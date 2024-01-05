#using script_3b893ec1252cdffd;
#using scripts\core_common\ai\zombie_vortex.csc;
#using script_76abb7986de59601;
#using script_67049b48b589d81;
#using script_64e5d3ad71ce8140;
#using script_6b71c9befed901f2;
#using script_75c3996cce8959f7;
#using script_71603a58e2da0698;
#using script_30c7fb449869910;
#using script_33128b01aae27d52;
#using script_1b2f6ef7778cf920;
#using script_771f5bff431d8d57;
#using script_4adf64e112e9afec;
#using script_42cbbdcd1e160063;
#using script_3314b730521b9666;
#using script_77163d5a569e2071;
#using script_38635d174016f682;
#using script_18910f59cc847b42;
#using scripts\core_common\hud_message_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\spawning_shared.csc;
#using scripts\core_common\spawner_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\serverfield_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\math_shared.csc;
#using scripts\core_common\array_shared.csc;

#namespace namespace_b59ddbce;

/*
	Name: init
	Namespace: namespace_b59ddbce
	Checksum: 0xD103E2C4
	Offset: 0x480
	Size: 0x4BC
	Parameters: 0
	Flags: Linked
*/
function init()
{
	level.var_46a66896 = doa_overworld::register_clientside();
	clientfield::register("allplayers", "bombDrop", 1, 1, "int", &function_c75159ad, 0, 0);
	clientfield::register("toplayer", "cutscene", 1, 2, "int", &function_769d489, 0, 0);
	clientfield::register("toplayer", "controlBinding", 1, 4, "counter", &function_e7a44fda, 0, 0);
	clientfield::register("toplayer", "goFPS", 1, 1, "counter", &function_f32984d0, 0, 0);
	clientfield::register("world", "doafps", 1, 1, "int", &function_8a19ab89, 0, 0);
	clientfield::register("toplayer", "exitFPS", 1, 1, "counter", &function_43ae94e0, 0, 0);
	clientfield::register("toplayer", "changeCamera", 1, 1, "counter", &changecamera, 0, 0);
	clientfield::register("toplayer", "resetCamera", 1, 1, "counter", &resetcamera, 0, 0);
	clientfield::register("toplayer", "hardResetCamera", 1, 1, "counter", &hardresetcamera, 0, 0);
	clientfield::register("toplayer", "lastStand", 1, 2, "int", &laststand, 0, 0);
	clientfield::register("toplayer", "setCameraDown", 1, 5, "int", &setcameradown, 0, 0);
	clientfield::register("toplayer", "setCameraSide", 1, 1, "int", &setcameraside, 0, 0);
	clientfield::register("allplayers", "flipCamera", 1, 2, "int", &flipcamera, 0, 0);
	clientfield::register("toplayer", "showMap", 1, 1, "int", &showmap, 0, 0);
	clientfield::register("toplayer", "toggleflashlight", 1, 1, "int", &function_4fd00e1f, 0, 0);
	callback::on_localclient_connect(&on_player_connect);
	callback::on_spawned(&on_player_spawned);
	function_32d5e898();
	level thread function_c7ab4997();
}

/*
	Name: function_c7ab4997
	Namespace: namespace_b59ddbce
	Checksum: 0x500A7440
	Offset: 0x948
	Size: 0xF0
	Parameters: 1
	Flags: Linked, Private
*/
function private function_c7ab4997(localclientnum)
{
	self notify("3506ac8df5a804ff");
	self endon("3506ac8df5a804ff");
	while(true)
	{
		result = undefined;
		result = level waittill(#"updategamerprofile", #"hash_ce3d6cba382b09e", #"hash_5f3b1ae5d64be652");
		namespace_1e25ad94::debugmsg(("profileWatch just intercepted notify-->") + result._notify);
		local_player = function_5c10bd79(result.localclientnum);
		if(isdefined(local_player))
		{
			local_player namespace_7f5aeb59::function_4d692cc4(result.localclientnum, local_player.var_88a2ff29);
		}
	}
}

/*
	Name: on_player_connect
	Namespace: namespace_b59ddbce
	Checksum: 0xA8E174BD
	Offset: 0xA40
	Size: 0xC4
	Parameters: 1
	Flags: Linked
*/
function on_player_connect(localclientnum)
{
	player = function_27673a7(localclientnum);
	if(!isdefined(player))
	{
		return;
	}
	player.var_f5602976 = gettime();
	var_818c564f = function_dac0d84(localclientnum);
	var_dd2c6e79 = function_5f72e972(#"hash_365a974a1df27ef4");
	uimodel = getuimodel(var_dd2c6e79, #"hash_a6a99321ab96e8d");
	setuimodelvalue(uimodel, var_818c564f);
}

/*
	Name: function_32d5e898
	Namespace: namespace_b59ddbce
	Checksum: 0xB4C5850D
	Offset: 0xB10
	Size: 0x132
	Parameters: 1
	Flags: Linked
*/
function function_32d5e898(localclientnum)
{
	if(!isdefined(level.doa.var_b73cc08))
	{
		level.doa.var_b73cc08 = spawn(0, (0, 0, 0), "script_model");
		level.doa.var_b73cc08 setmodel("tag_origin");
	}
	foreach(player in getlocalplayers())
	{
		player namespace_7f5aeb59::function_fcc90081();
	}
	level.doa.var_f65cb6ee = array(0, 0, 0, 0);
}

/*
	Name: function_e7a44fda
	Namespace: namespace_b59ddbce
	Checksum: 0x2B05091A
	Offset: 0xC50
	Size: 0x74
	Parameters: 7
	Flags: Linked
*/
function function_e7a44fda(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	allowactionslotinput(bwastimejump);
	self thread namespace_7f5aeb59::function_4d692cc4(bwastimejump, self.var_88a2ff29);
}

/*
	Name: on_player_spawned
	Namespace: namespace_b59ddbce
	Checksum: 0x783B6FAC
	Offset: 0xCD0
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function on_player_spawned(localclientnum)
{
	setsoundcontext("doa_1stperson", "inactive");
	/#
		assert(!isdefined(self.doa), "");
	#/
	self thread namespace_7f5aeb59::function_f3143608(localclientnum);
}

/*
	Name: function_c75159ad
	Namespace: namespace_b59ddbce
	Checksum: 0xFB11D2E4
	Offset: 0xD48
	Size: 0x2B4
	Parameters: 7
	Flags: Linked
*/
function function_c75159ad(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 0)
	{
		return;
	}
	var_b2b025b1 = getlocalplayers()[0];
	if(isdefined(var_b2b025b1.doa) && var_b2b025b1.doa.var_10752c35 === 5)
	{
		forward = anglestoforward(self.angles);
		var_7def0a05 = self.origin + (forward * 100);
	}
	else
	{
		var_7def0a05 = self.origin;
	}
	origin = var_7def0a05 + (20, 0, 2000);
	bomb = spawn(fieldname, origin, "script_model");
	bomb setmodel("zombietron_nuke");
	bomb.angles = vectorscale((1, 0, 0), 90);
	bomb moveto(var_7def0a05, 0.3, 0, 0);
	playsound(0, "evt_doa_powerup_nuke_activate", self.origin);
	bomb waittill(#"movedone");
	playsound(fieldname, "evt_doa_powerup_nuke_impact", var_7def0a05);
	playfx(fieldname, level._effect[#"bomb"], var_7def0a05);
	earthquake(fieldname, 1, 0.8, var_7def0a05, 1000);
	physicsexplosionsphere(fieldname, var_7def0a05, 1024, 0, 100);
	bomb delete();
	wait(0.2);
	playfx(fieldname, level._effect[#"nuke_dust"], var_7def0a05);
}

/*
	Name: function_43ae94e0
	Namespace: namespace_b59ddbce
	Checksum: 0x65C8B278
	Offset: 0x1008
	Size: 0x3EC
	Parameters: 7
	Flags: Linked
*/
function function_43ae94e0(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self.var_88a2ff29 = level.var_30df1fad;
	playsound(bwastimejump, #"hash_51a1d69295a5b7fe", (0, 0, 0));
	setsoundcontext("doa_1stperson", "inactive");
	if(!isdefined(self.doa))
	{
		self thread namespace_7f5aeb59::function_4d692cc4(bwastimejump, self.var_88a2ff29);
		namespace_4dae815d::function_b6e8ef46();
		return;
	}
	self.doa.var_10752c35 = 6;
	if(isdefined(self.doa.var_903d75b1))
	{
		self.doa.var_903d75b1 = self namespace_ac2a80f5::function_f7736714(bwastimejump, self.doa.var_903d75b1);
	}
	var_cc48f591 = (isdefined(self.doa.var_903d75b1) ? self.doa.var_903d75b1 : 1);
	level.doa.var_b73cc08.origin = self.origin + vectorscale((0, 0, 1), 72);
	level.doa.var_b73cc08.angles = self.angles;
	waitframe(1);
	if(isdefined(self.var_ca14ee83))
	{
		level.doa.var_b73cc08.angles = self.var_ca14ee83;
	}
	spot = (self.origin[0], self.origin[1], self.origin[2] + namespace_ac2a80f5::function_ccf8a968(var_cc48f591));
	level.doa.var_b73cc08 moveto(spot, 0.15);
	level.doa.var_b73cc08 waittilltimeout(0.16, #"movedone");
	self cameraforcedisablescriptcam(0);
	if(isdefined(self.doa.var_903d75b1))
	{
		self.doa.var_10752c35 = self.doa.var_903d75b1;
		/#
			assert(self.doa.var_10752c35 != 5);
		#/
	}
	else
	{
		self.doa.var_10752c35 = 1;
		if(getlocalplayers().size > 1)
		{
			self.doa.var_10752c35 = 3;
		}
	}
	self namespace_ac2a80f5::changecamera(bwastimejump, self.doa.var_10752c35);
	self.topdowncamera = 1;
	self.doa.var_3e81d24c = 0;
	if(isdefined(self.laserfx))
	{
		killfx(bwastimejump, self.laserfx);
		self.laserfx = undefined;
	}
	self thread namespace_7f5aeb59::function_4d692cc4(bwastimejump, self.var_88a2ff29);
	namespace_4dae815d::function_b6e8ef46();
}

/*
	Name: function_f32984d0
	Namespace: namespace_b59ddbce
	Checksum: 0x161B85DF
	Offset: 0x1400
	Size: 0x35C
	Parameters: 7
	Flags: Linked
*/
function function_f32984d0(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self.var_88a2ff29 = "default";
	if(self.doa.var_10752c35 === 5)
	{
		self thread namespace_7f5aeb59::function_4d692cc4(localclientnum, self.var_88a2ff29);
		self thread namespace_6e90e490::function_b5afa57f(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump);
		return;
	}
	playsound(localclientnum, #"hash_4716558fb561cab2", (0, 0, 0));
	setsoundcontext("doa_1stperson", "active");
	origin = self.origin;
	if(!isdefined(self.var_45c6f27d))
	{
		self.var_45c6f27d = self.origin + vectorscale((0, 0, 1), 1000);
	}
	if(!isdefined(self.var_ca14ee83))
	{
		self.var_ca14ee83 = vectorscale((1, 0, 0), 75);
	}
	if(localclientnum > 0 && level.localplayers.size > 1)
	{
		self.var_45c6f27d = level.localplayers[0].var_45c6f27d;
		self.var_ca14ee83 = level.localplayers[0].var_ca14ee83;
	}
	self.doa.var_10752c35 = 6;
	level.doa.var_b73cc08.origin = self.var_45c6f27d;
	level.doa.var_b73cc08.angles = self.var_ca14ee83;
	level.doa.var_b73cc08 moveto(origin + vectorscale((0, 0, 1), 72), 0.3);
	wait(0.2);
	if(isdefined(self))
	{
		playfx(localclientnum, level._effect[#"explode_lg"], origin);
		earthquake(localclientnum, 1, 0.8, origin, 1000);
		playrumbleonposition(localclientnum, "damage_heavy", self.origin);
	}
	wait(0.1);
	if(isdefined(self))
	{
		self.doa.var_10752c35 = 5;
		self.topdowncamera = 0;
		self.doa.var_3e81d24c = 1;
		self thread namespace_7f5aeb59::function_4d692cc4(localclientnum, self.var_88a2ff29);
		self thread namespace_6e90e490::function_b5afa57f(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump);
	}
	namespace_4dae815d::function_b6e8ef46();
}

/*
	Name: function_505038df
	Namespace: namespace_b59ddbce
	Checksum: 0xD8C54700
	Offset: 0x1768
	Size: 0xB2
	Parameters: 0
	Flags: Linked
*/
function function_505038df()
{
	foreach(player in getlocalplayers())
	{
		if(!isdefined(player))
		{
			continue;
		}
		if(is_true(player.doa.var_35200a9f))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_8a19ab89
	Namespace: namespace_b59ddbce
	Checksum: 0xA29F9BC1
	Offset: 0x1828
	Size: 0x1C6
	Parameters: 7
	Flags: Linked
*/
function function_8a19ab89(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	/#
		namespace_1e25ad94::debugmsg("" + bwastimejump);
	#/
	if(bwastimejump)
	{
		if(!isdefined(level.doa.var_d1aae7e4) && isdefined(level.doa.current_arena))
		{
			level.doa.var_d1aae7e4 = ("fxexp_" + level.doa.current_arena.script_noteworthy) + "_FPS";
			/#
				namespace_1e25ad94::debugmsg((("" + level.doa.var_d1aae7e4) + "") + fieldname);
			#/
			playradiantexploder(fieldname, level.doa.var_d1aae7e4);
		}
	}
	else
	{
		var_33a7b9c6 = function_505038df();
		if(!is_true(var_33a7b9c6))
		{
			if(isdefined(level.doa.var_d1aae7e4))
			{
				stopradiantexploder(fieldname, level.doa.var_d1aae7e4);
				level.doa.var_d1aae7e4 = undefined;
			}
		}
	}
}

/*
	Name: changecamera
	Namespace: namespace_b59ddbce
	Checksum: 0xD50CCD65
	Offset: 0x19F8
	Size: 0x1F4
	Parameters: 7
	Flags: Linked
*/
function changecamera(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(self.doa.var_10752c35 === 5)
	{
		return;
	}
	self.doa.var_10752c35 = namespace_ac2a80f5::function_1d5dc8d2(bwastimejump, self.doa.var_10752c35);
	self namespace_ac2a80f5::changecamera(bwastimejump, self.doa.var_10752c35);
	if(self.doa.var_10752c35 >= 0 && self.doa.var_10752c35 <= 3)
	{
		self.doa.var_903d75b1 = self.doa.var_10752c35;
	}
	switch(self.doa.var_10752c35)
	{
		case 1:
		{
			msg = #"hash_447dc787430ef129";
			break;
		}
		case 0:
		{
			msg = #"hash_7d810006d120ca86";
			break;
		}
		case 2:
		{
			msg = #"hash_61823fb81c973c88";
			break;
		}
		case 3:
		{
			msg = #"hash_6fca4e61bae022cd";
			break;
		}
	}
	if(isdefined(msg))
	{
		self thread message(bwastimejump, msg, 2, 0);
	}
}

/*
	Name: function_5abfd945
	Namespace: namespace_b59ddbce
	Checksum: 0x7B593F63
	Offset: 0x1BF8
	Size: 0xA6
	Parameters: 3
	Flags: Linked, Private
*/
function private function_5abfd945(localclientnum, text, var_d9d263a1)
{
	if(!isdefined(var_d9d263a1))
	{
		var_d9d263a1 = 5;
	}
	self.doa.var_5f165a77 = 1;
	self hud_message::clearlowermessage(localclientnum);
	self hud_message::setlowermessage(localclientnum, text);
	wait(var_d9d263a1);
	if(isdefined(self))
	{
		self hud_message::clearlowermessage(localclientnum);
		self.doa.var_5f165a77 = 0;
	}
}

/*
	Name: message
	Namespace: namespace_b59ddbce
	Checksum: 0xDAFA1A9D
	Offset: 0x1CA8
	Size: 0xC4
	Parameters: 4
	Flags: Linked
*/
function message(localclientnum, text, var_d9d263a1, hold)
{
	if(!isdefined(var_d9d263a1))
	{
		var_d9d263a1 = 5;
	}
	if(!isdefined(hold))
	{
		hold = 1;
	}
	stalled = 0;
	while(hold && is_true(self.doa.var_5f165a77))
	{
		stalled = 1;
		wait(1);
	}
	if(stalled)
	{
		wait(1);
	}
	if(isdefined(self))
	{
		self thread function_5abfd945(localclientnum, text, var_d9d263a1);
	}
}

/*
	Name: hardresetcamera
	Namespace: namespace_b59ddbce
	Checksum: 0xE827CFA
	Offset: 0x1D78
	Size: 0x1D4
	Parameters: 7
	Flags: Linked
*/
function hardresetcamera(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!isdefined(self.doa))
	{
		return;
	}
	namespace_1e25ad94::debugmsg((("Calling HARDRESETCAMERA on LocalClient:" + bwastimejump) + " Entity: ") + self.entnum);
	if(isdefined(self.doa.var_10752c35) && self.doa.var_10752c35 == 6)
	{
		return;
	}
	if(isdefined(self.doa.var_10752c35) && self.doa.var_10752c35 == 5 && is_true(level.doa.var_318aa67a))
	{
		return;
	}
	self.doa.var_67c3a8db = undefined;
	self.var_2d592f5b = undefined;
	self.var_45c6f27d = undefined;
	self.doa.var_903d75b1 = undefined;
	self.doa.var_10752c35 = 1;
	if(level.doa.world_state == 0 && getlocalplayers().size > 1)
	{
		if(level.doa.var_91f2835f == 1)
		{
			self.doa.var_10752c35 = 3;
		}
	}
	self namespace_ac2a80f5::changecamera(bwastimejump, self.doa.var_10752c35);
}

/*
	Name: resetcamera
	Namespace: namespace_b59ddbce
	Checksum: 0xF862969A
	Offset: 0x1F58
	Size: 0x124
	Parameters: 7
	Flags: Linked
*/
function resetcamera(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!isdefined(self.doa))
	{
		return;
	}
	self.doa.var_67c3a8db = undefined;
	self.var_2d592f5b = undefined;
	self.var_45c6f27d = undefined;
	if(isdefined(self.doa.var_903d75b1))
	{
		self.doa.var_10752c35 = self namespace_ac2a80f5::function_f7736714(bwastimejump, self.doa.var_903d75b1);
	}
	else
	{
		self.doa.var_10752c35 = 1;
		if(getlocalplayers().size > 1)
		{
			self.doa.var_10752c35 = 3;
		}
	}
	self namespace_ac2a80f5::changecamera(bwastimejump, self.doa.var_10752c35);
}

/*
	Name: setcameradown
	Namespace: namespace_b59ddbce
	Checksum: 0x6682F71
	Offset: 0x2088
	Size: 0x2FC
	Parameters: 7
	Flags: Linked
*/
function setcameradown(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!isdefined(self) || !isdefined(self.doa))
	{
		return;
	}
	if(level.doa.world_state == 0)
	{
		/#
			assert(isdefined(isdefined(level.doa.current_arena)));
		#/
		normalangle = level.doa.current_arena.var_13ea8aea;
		var_1d83376c = level.doa.current_arena.var_46f3a17d;
		if(!isdefined(normalangle) || !isdefined(var_1d83376c))
		{
			normalangle = vectorscale((1, 0, 0), 75);
			var_1d83376c = (75, 180, 0);
		}
	}
	else
	{
		normalangle = vectorscale((1, 0, 0), 75);
		var_1d83376c = (75, 180, 0);
	}
	if(bwastimejump)
	{
		if(getlocalplayers().size > 1 && self.doa.var_10752c35 == 3)
		{
			return;
		}
		maxval = 32 - 1;
		curval = bwastimejump / maxval;
		if(self.doa.var_71122e79)
		{
			var_7f8e0b4a = var_1d83376c;
		}
		else
		{
			var_7f8e0b4a = normalangle;
		}
		var_2797b11f = var_7f8e0b4a[0];
		maxpitch = 95;
		var_cc5b2628 = lerpfloat(var_2797b11f, maxpitch, curval);
		angle = (var_cc5b2628, var_7f8e0b4a[1], var_7f8e0b4a[2]);
		self.doa.var_67c3a8db = angle;
		self namespace_ac2a80f5::function_278f20a3(angle, self.doa.var_f793b3d3);
	}
	else
	{
		self.doa.var_67c3a8db = undefined;
		if(self.doa.var_71122e79)
		{
			self namespace_ac2a80f5::function_278f20a3(var_1d83376c, self.doa.var_f793b3d3);
		}
		else
		{
			self namespace_ac2a80f5::function_278f20a3(normalangle, self.doa.var_f793b3d3);
		}
	}
}

/*
	Name: function_9917e07
	Namespace: namespace_b59ddbce
	Checksum: 0xB71C3493
	Offset: 0x2390
	Size: 0x2BC
	Parameters: 2
	Flags: Linked
*/
function function_9917e07(localclientnum, value)
{
	self notify("56c1f61c7e68beaf");
	self endon("56c1f61c7e68beaf");
	while(true)
	{
		if(!isdefined(self))
		{
			return;
		}
		if(isdefined(self.doa))
		{
			break;
		}
		waitframe(1);
	}
	if(value)
	{
		angle = (5, 180, 0);
		self.doa.var_67c3a8db = angle;
		self.doa.var_c544c883 = 100;
		if(level.localplayers.size > 1)
		{
			namespace_4dae815d::function_e1887b0f(0);
			self namespace_ac2a80f5::changecamera(localclientnum, self.doa.var_10752c35);
		}
		self namespace_ac2a80f5::function_278f20a3(angle, self.doa.var_f793b3d3);
	}
	else
	{
		if(level.localplayers.size > 1)
		{
			self.doa.var_10752c35 = 3;
			self namespace_ac2a80f5::changecamera(localclientnum, self.doa.var_10752c35);
			namespace_4dae815d::function_b6e8ef46();
		}
		if(level.doa.world_state == 0)
		{
			/#
				assert(isdefined(isdefined(level.doa.current_arena)));
			#/
			normalangle = level.doa.current_arena.var_13ea8aea;
			var_1d83376c = level.doa.current_arena.var_46f3a17d;
		}
		else
		{
			normalangle = vectorscale((1, 0, 0), 75);
			var_1d83376c = (75, 180, 0);
		}
		self.doa.var_c544c883 = undefined;
		self.doa.var_67c3a8db = undefined;
		if(self.doa.var_71122e79)
		{
			self namespace_ac2a80f5::function_278f20a3(var_1d83376c, self.doa.var_f793b3d3);
		}
		else
		{
			self namespace_ac2a80f5::function_278f20a3(normalangle, self.doa.var_f793b3d3);
		}
	}
}

/*
	Name: setcameraside
	Namespace: namespace_b59ddbce
	Checksum: 0x2BFA993
	Offset: 0x2658
	Size: 0x54
	Parameters: 7
	Flags: Linked
*/
function setcameraside(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self thread function_9917e07(fieldname, bwastimejump);
}

/*
	Name: laststand
	Namespace: namespace_b59ddbce
	Checksum: 0xE692F1CB
	Offset: 0x26B8
	Size: 0x1F4
	Parameters: 7
	Flags: Linked
*/
function laststand(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(fieldname != 0)
	{
		return;
	}
	if(getlocalplayers().size > 1)
	{
		return;
	}
	if(!isdefined(self) || !isdefined(self.doa))
	{
		return;
	}
	if(self.doa.var_10752c35 !== 6)
	{
		if(bwastimejump)
		{
			self.doa.var_10752c35 = 0;
			if(bwastimejump == 2)
			{
				if(self namespace_ac2a80f5::function_f7736714(fieldname, 2))
				{
					self.doa.var_10752c35 = 2;
				}
			}
			if(level.doa.var_938e4f08 === 9 || level.doa.var_938e4f08 === 10 || level.doa.var_938e4f08 === 11)
			{
				self.doa.var_10752c35 = 0;
			}
		}
		else
		{
			if(isdefined(self.doa.var_903d75b1))
			{
				self.doa.var_10752c35 = self namespace_ac2a80f5::function_f7736714(fieldname, self.doa.var_903d75b1);
			}
			else
			{
				self.doa.var_10752c35 = 1;
			}
		}
		self namespace_ac2a80f5::changecamera(fieldname, self.doa.var_10752c35);
	}
}

/*
	Name: showmap
	Namespace: namespace_b59ddbce
	Checksum: 0xE88D3E02
	Offset: 0x28B8
	Size: 0xCC
	Parameters: 7
	Flags: Linked
*/
function showmap(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(fieldname != 0)
	{
		return;
	}
	if(bwastimejump)
	{
		if(!level.var_46a66896 doa_overworld::is_open(fieldname))
		{
			level.var_46a66896 doa_overworld::open(fieldname);
		}
	}
	else if(level.var_46a66896 doa_overworld::is_open(fieldname))
	{
		level.var_46a66896 doa_overworld::close(fieldname);
	}
}

/*
	Name: function_4fd00e1f
	Namespace: namespace_b59ddbce
	Checksum: 0x48328E2D
	Offset: 0x2990
	Size: 0x1E6
	Parameters: 7
	Flags: Linked
*/
function function_4fd00e1f(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		self playsound(fieldname, #"hash_79a78504d4dbaf3f");
		if(self.doa.var_10752c35 === 5)
		{
			if(!self hasdobj(fieldname))
			{
				return;
			}
			if(!isdefined(!isdefined(self.var_41b71195)))
			{
				if(viewmodelhastag(fieldname, "tag_flashlight"))
				{
					self.var_41b71195 = playviewmodelfx(fieldname, #"hash_679d39e5fd4eae19", "tag_flashlight");
				}
				else if(viewmodelhastag(fieldname, "tag_camera"))
				{
					self.var_41b71195 = playviewmodelfx(fieldname, #"hash_679d39e5fd4eae19", "tag_camera");
				}
			}
		}
		else
		{
			self.var_41b71195 = util::playfxontag(fieldname, #"hash_679d39e5fd4eae19", self, "tag_eye");
		}
	}
	else if(isdefined(self.var_41b71195))
	{
		self playsound(fieldname, #"hash_13715035b161a0c3");
		stopfx(fieldname, self.var_41b71195);
		self.var_41b71195 = undefined;
	}
}

/*
	Name: function_769d489
	Namespace: namespace_b59ddbce
	Checksum: 0xAFEB2802
	Offset: 0x2B80
	Size: 0x6C
	Parameters: 7
	Flags: Linked
*/
function function_769d489(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	level.doa.cutscene = bwastimejump;
	self thread function_65329ef6(bwastimejump, fieldname);
}

/*
	Name: function_65329ef6
	Namespace: namespace_b59ddbce
	Checksum: 0x715A14BC
	Offset: 0x2BF8
	Size: 0x20A
	Parameters: 2
	Flags: Linked
*/
function function_65329ef6(id, localclientnum)
{
	self notify("16ea1af0a80a7b6f");
	self endon("16ea1af0a80a7b6f");
	self endon(#"disconnect");
	while(!isdefined(self.doa))
	{
		waitframe(1);
	}
	switch(id)
	{
		case 0:
		{
			if(isdefined(self.doa.var_903d75b1))
			{
				self.doa.var_10752c35 = self namespace_ac2a80f5::function_f7736714(localclientnum, self.doa.var_903d75b1);
			}
			else
			{
				self.doa.var_10752c35 = 1;
				if(getlocalplayers().size > 1)
				{
					self.doa.var_10752c35 = 3;
				}
			}
			self namespace_ac2a80f5::changecamera(localclientnum, self.doa.var_10752c35);
			level notify(#"hash_2dc73ea9b586d104");
			break;
		}
		case 1:
		{
			self.doa.var_10752c35 = 6;
			loc = struct::get("island_cutscene_camloc", "targetname");
			level.doa.var_b73cc08.origin = loc.origin;
			level.doa.var_b73cc08.angles = loc.angles;
			break;
		}
		case 2:
		{
			self thread namespace_b7d49cfd::function_8d4cb2b(localclientnum);
			break;
		}
	}
}

/*
	Name: function_7df2149d
	Namespace: namespace_b59ddbce
	Checksum: 0x4D535E50
	Offset: 0x2E10
	Size: 0x294
	Parameters: 2
	Flags: Linked
*/
function function_7df2149d(localclientnum, orientation)
{
	self endon(#"disconnnect");
	self notify("2131d3dc44e53e3f");
	self endon("2131d3dc44e53e3f");
	while(!isdefined(self.doa))
	{
		waitframe(1);
	}
	height = namespace_ac2a80f5::function_ccf8a968(self.doa.var_10752c35);
	if(isdefined(level.doa.current_arena.camera_max_height))
	{
		if(height > level.doa.current_arena.camera_max_height)
		{
			height = level.doa.current_arena.camera_max_height;
		}
	}
	if(level.doa.world_state == 0 && isdefined(level.doa.current_arena))
	{
		normalangle = level.doa.current_arena.var_13ea8aea;
		var_1d83376c = level.doa.current_arena.var_46f3a17d;
	}
	else
	{
		normalangle = vectorscale((1, 0, 0), 75);
		var_1d83376c = (75, 180, 0);
	}
	switch(orientation)
	{
		case 0:
		case 2:
		{
			self.doa.var_71122e79 = 0;
			self namespace_ac2a80f5::function_278f20a3(normalangle, height);
			break;
		}
		case 1:
		{
			self.doa.var_71122e79 = 1;
			self namespace_ac2a80f5::function_278f20a3(var_1d83376c, height);
			break;
		}
	}
	level.var_2d592f5b = level.doa.camera_angles;
	namespace_1e25ad94::debugmsg(((("+++++++++++++++++++++++ Player ") + self.entnum) + " camera orientation is: ") + (self.doa.var_71122e79 ? "flipped" : "normal"));
}

/*
	Name: flipcamera
	Namespace: namespace_b59ddbce
	Checksum: 0xFFF35CE0
	Offset: 0x30B0
	Size: 0xBC
	Parameters: 7
	Flags: Linked
*/
function flipcamera(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	localplayers = getlocalplayers();
	if(isinarray(localplayers, self))
	{
		self thread function_7df2149d(fieldname, bwastimejump);
	}
	level.doa.var_f65cb6ee[self getentitynumber()] = bwastimejump == 1;
}

