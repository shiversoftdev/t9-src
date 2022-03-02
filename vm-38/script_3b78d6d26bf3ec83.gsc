#using script_13da4e6b98ca81a1;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_cd56c326;

/*
	Name: function_5d5f3702
	Namespace: namespace_cd56c326
	Checksum: 0x38B27AF0
	Offset: 0x1C0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_5d5f3702()
{
	level notify(508412018);
}

#namespace jammer;

/*
	Name: function_89f2df9
	Namespace: jammer
	Checksum: 0x3DB02067
	Offset: 0x1E0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"gadget_jammer", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: jammer
	Checksum: 0x98B8C2B9
	Offset: 0x228
	Size: 0x14
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	init_shared();
}

/*
	Name: init_shared
	Namespace: jammer
	Checksum: 0x8685D0CF
	Offset: 0x248
	Size: 0xEC
	Parameters: 0
	Flags: Linked
*/
function init_shared()
{
	if(!isdefined(level.var_578f7c6d))
	{
		level.var_578f7c6d = spawnstruct();
	}
	level.var_578f7c6d.weapon = getweapon(#"gadget_jammer");
	level.var_c20391e9 = getdvarint(#"hash_7f7f1118da837313", level.var_578f7c6d.weapon.explosionradius);
	if(!isdefined(level.var_6d8e6535))
	{
		level.var_6d8e6535 = [];
	}
	registerclientfields();
	callback::on_localclient_connect(&on_localplayer_connect);
}

/*
	Name: register
	Namespace: jammer
	Checksum: 0xE4C72BD5
	Offset: 0x340
	Size: 0x22
	Parameters: 2
	Flags: None
*/
function register(entity, var_b89c18)
{
	entity.var_a19988fc = var_b89c18;
}

/*
	Name: registerclientfields
	Namespace: jammer
	Checksum: 0xE2093E45
	Offset: 0x370
	Size: 0x244
	Parameters: 0
	Flags: Linked, Private
*/
function private registerclientfields()
{
	clientfield::register("scriptmover", "isJammed", 1, 1, "int", &function_43a5b68a, 0, 0);
	clientfield::register("missile", "isJammed", 1, 1, "int", &function_43a5b68a, 0, 0);
	clientfield::register("vehicle", "isJammed", 1, 1, "int", &function_43a5b68a, 0, 0);
	clientfield::register("toplayer", "isJammed", 1, 1, "int", &player_isjammed, 0, 1);
	clientfield::register("allplayers", "isHiddenByFriendlyJammer", 1, 1, "int", &function_b53badf6, 0, 1);
	clientfield::register("missile", "jammer_active", 1, 1, "int", &function_d28eb2e, 0, 0);
	clientfield::register("missile", "jammer_hacked", 1, 1, "counter", &jammerhacked, 0, 0);
	clientfield::register("toplayer", "jammedvehpostfx", 1, 1, "int", &function_4a82368f, 0, 1);
}

/*
	Name: on_localplayer_connect
	Namespace: jammer
	Checksum: 0x3FCC63F3
	Offset: 0x5C0
	Size: 0x5C
	Parameters: 1
	Flags: Linked
*/
function on_localplayer_connect(localclientnum)
{
	setuimodelvalue(createuimodel(function_1df4c3b0(localclientnum, #"hud_items"), "jammedStrength"), 0);
}

/*
	Name: function_d28eb2e
	Namespace: jammer
	Checksum: 0x5D4B8B93
	Offset: 0x628
	Size: 0x7C
	Parameters: 7
	Flags: Linked
*/
function function_d28eb2e(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(fieldname == 1)
	{
		self function_2560e153(binitialsnap, bwastimejump);
		self thread function_5e3d8fe(binitialsnap);
	}
}

/*
	Name: jammerhacked
	Namespace: jammer
	Checksum: 0xFCA4A6EE
	Offset: 0x6B0
	Size: 0xFC
	Parameters: 7
	Flags: Linked
*/
function jammerhacked(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!isentity(self.var_7ec0e2d1))
	{
		return;
	}
	localplayer = function_5c10bd79(bwastimejump);
	if(util::function_fbce7263(localplayer.team, self.team) && !codcaster::function_b8fe9b52(bwastimejump))
	{
		self.var_7ec0e2d1 setcompassicon("ui_hud_minimap_shroud_flipbook");
	}
	else
	{
		self.var_7ec0e2d1 setcompassicon("ui_hud_minimap_shroud_friendly");
	}
}

/*
	Name: function_43a5b68a
	Namespace: jammer
	Checksum: 0xECC83A27
	Offset: 0x7B8
	Size: 0x1E0
	Parameters: 7
	Flags: Linked
*/
function function_43a5b68a(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self.isjammed = undefined;
	if(newval == 1)
	{
		self.isjammed = 1;
	}
	if(!isdefined(self))
	{
		return;
	}
	if(isdefined(self.var_a19988fc))
	{
		self thread [[self.var_a19988fc]](localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump);
	}
	weapon = (isdefined(self.identifier_weapon) ? self.identifier_weapon : self.weapon);
	if(!isdefined(weapon.var_96850284))
	{
		return;
	}
	self util::waittill_dobj(localclientnum);
	if(!isdefined(self))
	{
		return;
	}
	if(newval == 1)
	{
		self.var_4dc44ba4 = playtagfxset(localclientnum, weapon.var_96850284, self);
	}
	else if(newval == 0 && oldval == 1 && isdefined(self.var_4dc44ba4))
	{
		foreach(fx in self.var_4dc44ba4)
		{
			stopfx(localclientnum, fx);
		}
	}
}

/*
	Name: function_b53badf6
	Namespace: jammer
	Checksum: 0xFABD180
	Offset: 0x9A0
	Size: 0x11C
	Parameters: 7
	Flags: Linked
*/
function function_b53badf6(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!isdefined(self) || !isplayer(self))
	{
		return;
	}
	self util::waittill_dobj(fieldname);
	if(!isdefined(self))
	{
		return;
	}
	localplayer = function_5c10bd79(fieldname);
	if(self == localplayer || self.team == localplayer.team)
	{
		return;
	}
	if(bwastimejump == 1)
	{
		self function_811196d1(1);
	}
	else if(bwastimejump == 0)
	{
		self function_811196d1(0);
	}
}

/*
	Name: player_isjammed
	Namespace: jammer
	Checksum: 0x60F7008C
	Offset: 0xAC8
	Size: 0x266
	Parameters: 7
	Flags: Linked
*/
function player_isjammed(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!isdefined(self) || !isplayer(self))
	{
		return;
	}
	self util::waittill_dobj(bnewent);
	if(!isdefined(self))
	{
		return;
	}
	var_da91b79d = getuimodel(function_1df4c3b0(bnewent, #"hud_items"), "jammedStrength");
	if(fieldname == 1)
	{
		self notify(#"stop_sounds");
		playsound(bnewent, #"hash_4a43757dd4b02977");
		level.var_6d8e6535[bnewent] = function_604c9983(bnewent, #"hash_3330b85ee1abeb2b");
		self thread function_e9e14905(bnewent);
		setuimodelvalue(var_da91b79d, 1);
		self notify(#"hash_55123a0e484012d5");
	}
	else if(fieldname == 0)
	{
		if(isdefined(level.var_6d8e6535[bnewent]) && !bwastimejump)
		{
			playsound(bnewent, #"hash_112352517abf5b11");
		}
		self notify(#"stop_sounds");
		if(binitialsnap == 1 && isalive(self) && self function_da43934d())
		{
			self thread function_b47f94f(bnewent, var_da91b79d);
		}
		else
		{
			setuimodelvalue(var_da91b79d, 0);
			self notify(#"hash_55123a0e484012d5");
		}
	}
}

/*
	Name: function_b47f94f
	Namespace: jammer
	Checksum: 0x2027E042
	Offset: 0xD38
	Size: 0xD4
	Parameters: 2
	Flags: Linked
*/
function function_b47f94f(localclientnum, var_da91b79d)
{
	self endon(#"hash_55123a0e484012d5");
	endtime = 0.25;
	progress = 0;
	while(progress < endtime)
	{
		percent = 1 - (min(1, progress / endtime));
		setuimodelvalue(var_da91b79d, percent);
		wait(0.15);
		progress = progress + 0.1;
	}
	setuimodelvalue(var_da91b79d, 0);
}

/*
	Name: function_2560e153
	Namespace: jammer
	Checksum: 0x627DC8C0
	Offset: 0xE18
	Size: 0x264
	Parameters: 2
	Flags: Linked
*/
function function_2560e153(localclientnum, bwastimejump)
{
	localplayer = function_5c10bd79(localclientnum);
	if(bwastimejump === 1)
	{
		if(isdefined(self.var_7ec0e2d1))
		{
			return;
		}
	}
	else if(isdefined(self.var_7ec0e2d1))
	{
		self.var_7ec0e2d1 delete();
	}
	self.var_7ec0e2d1 = spawn(localclientnum, self.origin, "script_model", localplayer getentitynumber(), self.team);
	self.var_7ec0e2d1 setmodel(#"tag_origin");
	self.var_7ec0e2d1 linkto(self);
	self.var_7ec0e2d1 setcompassicon("ui_hud_minimap_shroud_flipbook");
	self.var_7ec0e2d1 function_a5edb367(#"neutral");
	self.var_7ec0e2d1 enableonradar();
	if(localplayer.team == self.team || codcaster::function_b8fe9b52(localclientnum))
	{
		self.var_7ec0e2d1 setcompassicon("ui_hud_minimap_shroud_friendly");
	}
	else
	{
		self.var_7ec0e2d1 setcompassicon("ui_hud_minimap_shroud_flipbook");
	}
	diameter = getdvarint(#"hash_7f7f1118da837313", level.var_578f7c6d.weapon.explosionradius) * 2;
	self.var_7ec0e2d1 function_5e00861(diameter, 1);
	self thread function_fc59d60e(localclientnum);
}

/*
	Name: function_5e3d8fe
	Namespace: jammer
	Checksum: 0x66A40844
	Offset: 0x1088
	Size: 0x14E
	Parameters: 1
	Flags: Linked
*/
function function_5e3d8fe(localclientnum)
{
	self notify("5359f065dcc45c69");
	self endon("5359f065dcc45c69");
	self endon(#"death");
	self util::waittill_dobj(localclientnum);
	var_df1b3b55 = 0.6;
	var_8288805c = 0.2;
	if(isdefined(self.weapon.var_4dd46f8a))
	{
		var_966a1350 = getscriptbundle(self.weapon.var_4dd46f8a);
		if(isdefined(var_966a1350.var_b941081f) && isdefined(var_966a1350.var_40772cbe))
		{
			while(isdefined(self))
			{
				self.fx = util::playfxontag(localclientnum, var_966a1350.var_b941081f, self, var_966a1350.var_40772cbe);
				wait(var_8288805c);
				if(isdefined(self.fx))
				{
					stopfx(localclientnum, self.fx);
				}
				wait(var_df1b3b55);
			}
		}
	}
}

/*
	Name: function_e9e14905
	Namespace: jammer
	Checksum: 0x52E210F8
	Offset: 0x11E0
	Size: 0x7C
	Parameters: 1
	Flags: Linked
*/
function function_e9e14905(localclientnum)
{
	self waittill(#"death", #"stop_sounds");
	if(isdefined(level.var_6d8e6535[localclientnum]))
	{
		function_d48752e(localclientnum, level.var_6d8e6535[localclientnum]);
		level.var_6d8e6535[localclientnum] = undefined;
	}
}

/*
	Name: function_4a82368f
	Namespace: jammer
	Checksum: 0xF43967FA
	Offset: 0x1268
	Size: 0xCC
	Parameters: 7
	Flags: Linked
*/
function function_4a82368f(local_client_num, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		self postfx::playpostfxbundle(#"hash_68b6dee9bf4fbfbe");
	}
	else if(bwastimejump == 0 && self postfx::function_556665f2(#"hash_68b6dee9bf4fbfbe"))
	{
		self postfx::stoppostfxbundle(#"hash_68b6dee9bf4fbfbe");
	}
}

/*
	Name: function_fc59d60e
	Namespace: jammer
	Checksum: 0x88B584EE
	Offset: 0x1340
	Size: 0x4C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_fc59d60e(localclientnum)
{
	self waittill(#"death");
	if(isdefined(self.var_7ec0e2d1))
	{
		self.var_7ec0e2d1 delete();
	}
}

