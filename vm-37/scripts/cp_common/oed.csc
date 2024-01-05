#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\visionset_mgr_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\struct.csc;

#namespace oed;

/*
	Name: __init__system__
	Namespace: oed
	Checksum: 0x30A987C6
	Offset: 0x1A0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"oed", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: oed
	Checksum: 0xCBF0B326
	Offset: 0x1E8
	Size: 0x2CC
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	clientfield::register("toplayer", "sitrep_toggle", 1, 1, "int", &sitrep_player_toggle, 0, 0);
	clientfield::register("toplayer", "active_dni_fx", 1, 1, "counter", &function_81c8f4da, 0, 0);
	clientfield::register("toplayer", "hack_dni_fx", 1, 1, "counter", &hack_dni_fx, 0, 0);
	clientfield::register("actor", "sitrep_material", 1, 1, "int", &ent_material_callback, 0, 0);
	clientfield::register("vehicle", "sitrep_material", 1, 1, "int", &ent_material_callback, 0, 0);
	clientfield::register("scriptmover", "sitrep_material", 1, 1, "int", &ent_material_callback, 0, 0);
	clientfield::register("item", "sitrep_material", 1, 1, "int", &ent_material_callback, 0, 0);
	clientfield::register("vehicle", "turret_keyline_render", 1, 1, "int", &function_c2b3ec13, 0, 0);
	clientfield::register("vehicle", "vehicle_keyline_toggle", 1, 1, "int", &vehicle_keyline_toggle, 0, 0);
	callback::on_spawned(&on_player_spawned);
	callback::on_localclient_shutdown(&on_localplayer_shutdown);
}

/*
	Name: on_player_spawned
	Namespace: oed
	Checksum: 0x6E6397E9
	Offset: 0x4C0
	Size: 0x7C
	Parameters: 1
	Flags: None
*/
function on_player_spawned(localclientnum)
{
	var_1d3b43d0 = 10500;
	var_9abc8c03 = 3000;
	if(isdefined(level.var_8df232be))
	{
		var_1d3b43d0 = level.var_8df232be;
	}
	if(isdefined(level.var_9f5b2c84))
	{
		var_9abc8c03 = level.var_9f5b2c84;
	}
	self thread function_66d9f518(localclientnum);
}

/*
	Name: on_localplayer_shutdown
	Namespace: oed
	Checksum: 0x96E7E1CE
	Offset: 0x548
	Size: 0xC
	Parameters: 1
	Flags: None
*/
function on_localplayer_shutdown(localclientnum)
{
}

/*
	Name: function_81c8f4da
	Namespace: oed
	Checksum: 0xBC18A5B8
	Offset: 0x560
	Size: 0x5C
	Parameters: 7
	Flags: None
*/
function function_81c8f4da(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self thread postfx::playpostfxbundle(#"pstfx_tactical_bootup");
}

/*
	Name: hack_dni_fx
	Namespace: oed
	Checksum: 0x7F272AE3
	Offset: 0x5C8
	Size: 0x7C
	Parameters: 7
	Flags: None
*/
function hack_dni_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self thread postfx::playpostfxbundle(#"hash_28506c424004a886");
	self playsound(0, #"uin_hack_mode_activate");
}

/*
	Name: sitrep_player_toggle
	Namespace: oed
	Checksum: 0xCC60408
	Offset: 0x650
	Size: 0x94
	Parameters: 7
	Flags: None
*/
function sitrep_player_toggle(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!self function_21c0fa55())
	{
		return;
	}
	if(!isdefined(self.localclientnum))
	{
		return;
	}
	if(self.localclientnum != fieldname)
	{
		return;
	}
	self thread player_toggle_sitrep(fieldname, bwastimejump);
}

/*
	Name: player_toggle_sitrep
	Namespace: oed
	Checksum: 0x8247A312
	Offset: 0x6F0
	Size: 0x38
	Parameters: 2
	Flags: None
*/
function player_toggle_sitrep(lcn, newval)
{
	self.sitrep_active = newval;
	level notify(#"player_sitrep_toggle");
}

/*
	Name: ent_material_callback
	Namespace: oed
	Checksum: 0x4E97213D
	Offset: 0x730
	Size: 0xB4
	Parameters: 7
	Flags: None
*/
function ent_material_callback(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	/#
		assert(isdefined(self), "");
	#/
	if(bwastimejump == 1)
	{
		self thread function_88883a8f(fieldname);
	}
	else
	{
		self notify(#"hash_16a083f97a5204f3");
		self function_e4f63ce7(fieldname);
	}
}

/*
	Name: function_88883a8f
	Namespace: oed
	Checksum: 0x1567F057
	Offset: 0x7F0
	Size: 0x10C
	Parameters: 1
	Flags: Private
*/
function private function_88883a8f(localclientnum)
{
	self endon(#"hash_16a083f97a5204f3");
	if(function_73f4b33(localclientnum) === self.team || self.team === #"none" || self.script_team === #"any")
	{
		self function_67243557(localclientnum);
		if(isdefined(self))
		{
			self thread function_f8588df3(localclientnum, &function_67243557, &function_e4f63ce7);
			self waittill(#"death");
			if(isdefined(self))
			{
				self function_e4f63ce7(localclientnum);
			}
		}
	}
}

/*
	Name: function_67243557
	Namespace: oed
	Checksum: 0x486C296D
	Offset: 0x908
	Size: 0x84
	Parameters: 1
	Flags: Private
*/
function private function_67243557(localclientnum)
{
	self endon(#"death", #"hash_16a083f97a5204f3");
	while(is_true(isigcactive(localclientnum)))
	{
		waitframe(1);
	}
	self playrenderoverridebundle(#"hash_44a7b967f9f18d4f");
}

/*
	Name: function_e4f63ce7
	Namespace: oed
	Checksum: 0x6479C028
	Offset: 0x998
	Size: 0x34
	Parameters: 1
	Flags: Private
*/
function private function_e4f63ce7(localclientnum)
{
	if(isdefined(self))
	{
		self stoprenderoverridebundle(#"hash_44a7b967f9f18d4f");
	}
}

/*
	Name: function_f8588df3
	Namespace: oed
	Checksum: 0x795E77C6
	Offset: 0x9D8
	Size: 0x222
	Parameters: 3
	Flags: None
*/
function function_f8588df3(localclientnum, var_80583f56, var_1ca727c)
{
	if(!isdefined(self))
	{
		return;
	}
	self endon(#"death", #"disconnect", #"hash_16a083f97a5204f3");
	e_player = function_5c10bd79(localclientnum);
	self.var_cc9b9440 = 1;
	while(true)
	{
		waitresult = undefined;
		waitresult = level waittill(#"igc_activated", #"player_sitrep_toggle");
		if(isigcactive(localclientnum))
		{
			if(self.var_cc9b9440)
			{
				self [[var_1ca727c]](localclientnum);
				self.var_cc9b9440 = 0;
			}
		}
		else if(isdefined(e_player))
		{
			if(waitresult._notify == "igc_activated" && is_true(e_player.sitrep_active))
			{
				if(!waitresult.b_active && !self.var_cc9b9440)
				{
					self [[var_80583f56]](localclientnum);
					self.var_cc9b9440 = 1;
				}
			}
			else
			{
				if(waitresult._notify == "player_sitrep_toggle" && is_true(e_player.sitrep_active))
				{
					if(!self.var_cc9b9440)
					{
						self [[var_80583f56]](localclientnum);
						self.var_cc9b9440 = 1;
					}
				}
				else if(!is_true(e_player.sitrep_active))
				{
					if(self.var_cc9b9440)
					{
						self [[var_1ca727c]](localclientnum);
						self.var_cc9b9440 = 0;
					}
				}
			}
		}
	}
}

/*
	Name: function_66d9f518
	Namespace: oed
	Checksum: 0xAB5D950B
	Offset: 0xC08
	Size: 0xE4
	Parameters: 1
	Flags: None
*/
function function_66d9f518(localclientnum)
{
	self endon(#"disconnect");
	if(function_73f4b33(localclientnum) != self.team)
	{
		return;
	}
	self function_a47e049d(localclientnum);
	if(isdefined(self))
	{
		self thread function_f8588df3(localclientnum, &function_a47e049d, &function_ac5dfb21);
		self waittill(#"death", #"hash_16a083f97a5204f3");
		if(isdefined(self))
		{
			self function_ac5dfb21(localclientnum);
		}
	}
}

/*
	Name: function_a47e049d
	Namespace: oed
	Checksum: 0x8A5724D2
	Offset: 0xCF8
	Size: 0xF4
	Parameters: 1
	Flags: Private
*/
function private function_a47e049d(localclientnum)
{
	self endon(#"death", #"disconnect");
	localclient = function_5c10bd79(localclientnum);
	if(self.team == function_73f4b33(localclientnum) && localclient != self && !is_true(self.var_d676dcaa))
	{
		while(is_true(isigcactive(localclientnum)))
		{
			waitframe(1);
		}
		self playrenderoverridebundle(#"hash_1cbf6d26721c59a7");
	}
}

/*
	Name: function_ac5dfb21
	Namespace: oed
	Checksum: 0xA696E2D5
	Offset: 0xDF8
	Size: 0x64
	Parameters: 1
	Flags: Private
*/
function private function_ac5dfb21(localclientnum)
{
	localclient = function_5c10bd79(localclientnum);
	if(isdefined(self) && localclient != self)
	{
		self stoprenderoverridebundle(#"hash_1cbf6d26721c59a7");
	}
}

/*
	Name: function_c2b3ec13
	Namespace: oed
	Checksum: 0xCE84CD06
	Offset: 0xE68
	Size: 0x96
	Parameters: 7
	Flags: None
*/
function function_c2b3ec13(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump && self.team == function_73f4b33(fieldname))
	{
		self thread function_66d9f518(fieldname);
	}
	else
	{
		self notify(#"hash_16a083f97a5204f3");
	}
}

/*
	Name: vehicle_keyline_toggle
	Namespace: oed
	Checksum: 0xD6513650
	Offset: 0xF08
	Size: 0x2EE
	Parameters: 7
	Flags: None
*/
function vehicle_keyline_toggle(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	e_player = function_5c10bd79(fieldname);
	e_player endon(#"death", #"disconnect");
	self endon(#"death");
	waitframe(1);
	var_80730518 = getplayervehicle(e_player);
	if(bwastimejump == 1)
	{
		foreach(e_ally in getplayers(fieldname))
		{
			if(isbot(e_ally) && e_ally.owner === e_player && var_80730518 === self && (self.archetype === "fighter" || self.scriptvehicletype === "player_fav"))
			{
				e_ally thread function_39273849(1);
			}
		}
		if(self !== var_80730518 && self.team === function_73f4b33(fieldname))
		{
			self thread function_66d9f518(fieldname);
		}
	}
	else
	{
		foreach(e_ally in getplayers(fieldname))
		{
			if(isbot(e_ally) && e_ally.owner === e_player && !isdefined(var_80730518))
			{
				e_ally thread function_39273849(0);
			}
		}
		self notify(#"hash_16a083f97a5204f3");
		self.var_4e2bc5fc = undefined;
	}
}

/*
	Name: function_39273849
	Namespace: oed
	Checksum: 0x54BFF59
	Offset: 0x1200
	Size: 0xD6
	Parameters: 1
	Flags: None
*/
function function_39273849(b_disabled)
{
	self notify(#"hash_7faffd382697c916");
	self endon(#"death", #"hash_7faffd382697c916");
	while(is_true(self.owner.var_4e2bc5fc))
	{
		wait(0.2);
	}
	if(b_disabled)
	{
		self stoprenderoverridebundle(#"hash_1cbf6d26721c59a7");
		self.var_d676dcaa = 1;
	}
	else
	{
		self playrenderoverridebundle(#"hash_1cbf6d26721c59a7");
		self.var_d676dcaa = undefined;
	}
}

