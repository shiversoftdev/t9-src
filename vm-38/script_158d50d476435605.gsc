#using script_240ef62ff60b2694;
#using script_474309807eb94f34;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\math_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_5a1d6cb0;

/*
	Name: function_1a05cd40
	Namespace: namespace_5a1d6cb0
	Checksum: 0x8A31AEE1
	Offset: 0x170
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_1a05cd40()
{
	level notify(1296499213);
}

#namespace activecamo;

/*
	Name: function_89f2df9
	Namespace: activecamo
	Checksum: 0x895F032D
	Offset: 0x190
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"activecamo", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: activecamo
	Checksum: 0x1B6BF8BD
	Offset: 0x1D8
	Size: 0xD4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	callback::add_callback(#"hash_1d3c7b07ff527f3e", &function_7bbf0553);
	callback::on_spawned(&on_player_spawned);
	callback::function_f77ced93(&function_f77ced93);
	callback::on_localplayer_spawned(&on_local_player_spawned);
	level.var_b9b11197 = getgametypesetting(#"hash_1f3825ba2a669400");
	/#
		thread function_12e53b2d();
	#/
}

/*
	Name: on_local_player_spawned
	Namespace: activecamo
	Checksum: 0xEDE9CA66
	Offset: 0x2B8
	Size: 0x44
	Parameters: 1
	Flags: Linked, Private
*/
function private on_local_player_spawned(localclientnum)
{
	if(!self function_21c0fa55())
	{
		return;
	}
	function_e3e0feb5(localclientnum, self);
}

/*
	Name: function_e3e0feb5
	Namespace: activecamo
	Checksum: 0xA37BC04B
	Offset: 0x308
	Size: 0x198
	Parameters: 2
	Flags: Linked, Private
*/
function private function_e3e0feb5(localclientnum, localplayer)
{
	players = getplayers(localclientnum);
	foreach(player in players)
	{
		if(!isdefined(player) || !player isplayer() || !isalive(player))
		{
			continue;
		}
		if(player === localplayer)
		{
			continue;
		}
		if(!player hasdobj(localclientnum))
		{
			continue;
		}
		weapon = player function_d2c2b168();
		weaponoptions = player function_e10e6c37();
		var_d1a848d9 = function_5442be13(weaponoptions);
		player function_350f0d(localclientnum, weapon, "tag_weapon_right", var_d1a848d9, 1, weaponoptions);
	}
}

/*
	Name: function_f77ced93
	Namespace: activecamo
	Checksum: 0x9459CDD7
	Offset: 0x4A8
	Size: 0xD4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_f77ced93(params)
{
	if(self == level || !isplayer(self))
	{
		return;
	}
	localclientnum = params.localclientnum;
	weapon = self function_d2c2b168();
	weaponoptions = self function_e10e6c37();
	var_d1a848d9 = function_5442be13(weaponoptions);
	self function_350f0d(localclientnum, weapon, "tag_weapon_right", var_d1a848d9, 1, weaponoptions);
}

/*
	Name: on_player_spawned
	Namespace: activecamo
	Checksum: 0x27FA7360
	Offset: 0x588
	Size: 0x9C
	Parameters: 1
	Flags: Linked, Private
*/
function private on_player_spawned(localclientnum)
{
	weapon = self function_d2c2b168();
	weaponoptions = self function_e10e6c37();
	var_d1a848d9 = function_5442be13(weaponoptions);
	self function_350f0d(localclientnum, weapon, "tag_weapon_right", var_d1a848d9, 1, weaponoptions);
}

/*
	Name: function_451a49f4
	Namespace: activecamo
	Checksum: 0x6F2CDB4D
	Offset: 0x630
	Size: 0x13E
	Parameters: 4
	Flags: Linked, Private
*/
function private function_451a49f4(localclientnum, var_f4eb4a50, weapon, var_d1a848d9)
{
	activecamo = self function_6f08b691(var_f4eb4a50, 0);
	if(isdefined(activecamo))
	{
		if(!isdefined(activecamo.var_fe56592))
		{
			activecamo.var_fe56592 = [];
		}
		if(!isdefined(activecamo.var_fe56592[localclientnum]))
		{
			activecamo.var_fe56592[localclientnum] = {};
		}
		if(!isdefined(activecamo.var_fe56592[localclientnum].var_dd54a13b))
		{
			activecamo.var_fe56592[localclientnum].var_dd54a13b = [];
		}
		baseweapon = function_c14cb514(weapon);
		if(!isdefined(activecamo.var_fe56592[localclientnum].var_dd54a13b[baseweapon]))
		{
			activecamo.var_fe56592[localclientnum].var_dd54a13b[baseweapon] = {};
		}
		activecamo.var_fe56592[localclientnum].var_dd54a13b[baseweapon].var_d1a848d9 = var_d1a848d9;
	}
	return activecamo;
}

/*
	Name: function_130e0542
	Namespace: activecamo
	Checksum: 0xC0EF1F69
	Offset: 0x778
	Size: 0x1B4
	Parameters: 3
	Flags: Linked, Private
*/
function private function_130e0542(localclientnum, weapon, camoindex)
{
	init_stage = 0;
	var_f4eb4a50 = function_13e12ab1(camoindex);
	activecamo = self function_6f08b691(var_f4eb4a50, 0);
	if(isdefined(activecamo))
	{
		if(isdefined(activecamo.var_13949c61.stages))
		{
			var_f8bf269c = 0;
			foreach(key, stage in activecamo.var_13949c61.stages)
			{
				if(isdefined(stage.var_d2eac588))
				{
					var_b4b21bd = stats::function_441050ca(localclientnum, stage.var_d2eac588);
					if(isdefined(var_b4b21bd) && var_b4b21bd >= stage.var_e2dbd42d)
					{
						var_f8bf269c = 1;
						continue;
					}
				}
				if(var_f8bf269c || stage.var_19b6044e === camoindex)
				{
					init_stage = key;
					break;
				}
			}
		}
		return function_451a49f4(localclientnum, var_f4eb4a50, weapon, init_stage);
	}
}

/*
	Name: function_7bbf0553
	Namespace: activecamo
	Checksum: 0xB9C43400
	Offset: 0x938
	Size: 0x6C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_7bbf0553(localclientnum, eventstruct)
{
	var_d1a848d9 = function_5442be13(eventstruct.var_6f2ae9c0);
	self function_350f0d(localclientnum, eventstruct.weapon, eventstruct.tagname, var_d1a848d9, 0, eventstruct.var_6f2ae9c0);
}

/*
	Name: function_350f0d
	Namespace: activecamo
	Checksum: 0xAF2A0D7
	Offset: 0x9B0
	Size: 0x50C
	Parameters: 6
	Flags: Linked, Private
*/
function private function_350f0d(localclientnum, weapon, tagname, var_d1a848d9, var_d71e8c6e, var_6f2ae9c0)
{
	var_d1460f46 = isdefined(tagname) && tagname == "tag_stowed_back";
	self function_7a55e60a(var_d1460f46);
	var_f4eb4a50 = self function_51bb743b(weapon, var_6f2ae9c0);
	if(!isdefined(var_f4eb4a50))
	{
		function_3e27a7cb(localclientnum, tagname);
		return;
	}
	activecamo = self function_6f08b691(var_f4eb4a50, 0);
	if(!isdefined(activecamo.var_13949c61.stages))
	{
		function_3e27a7cb(localclientnum, tagname);
		return;
	}
	stage = activecamo.var_13949c61.stages[var_d1a848d9];
	if(!isdefined(stage))
	{
		function_3e27a7cb(localclientnum, tagname);
		return;
	}
	if(!isdefined(activecamo.var_fe56592))
	{
		activecamo.var_fe56592 = [];
	}
	if(!isdefined(activecamo.var_fe56592[localclientnum]))
	{
		activecamo.var_fe56592[localclientnum] = {};
	}
	if(!isdefined(activecamo.var_fe56592[localclientnum].var_dd54a13b))
	{
		activecamo.var_fe56592[localclientnum].var_dd54a13b = [];
	}
	baseweapon = function_c14cb514(weapon);
	if(!isdefined(activecamo.var_fe56592[localclientnum].var_dd54a13b[baseweapon]))
	{
		activecamo.var_fe56592[localclientnum].var_dd54a13b[baseweapon] = {};
	}
	var_58bac2d = function_16d7447b(localclientnum, tagname, 1);
	if(isdefined(var_58bac2d.var_796fdf6e) && var_58bac2d.var_796fdf6e !== stage.rob)
	{
		function_3e27a7cb(localclientnum, tagname);
	}
	self function_a946fb86(activecamo, var_d1a848d9, var_d1460f46);
	var_5e38d32e = 1;
	if(!var_d1460f46 && self function_21c0fa55())
	{
		var_5bdd03ea = isswitchingweapons(localclientnum);
		var_5e38d32e = var_5bdd03ea || var_d71e8c6e;
		if(!var_5bdd03ea)
		{
			var_9a7e487a = activecamo.var_fe56592[localclientnum].var_dd54a13b[baseweapon].var_d1a848d9;
			if(isdefined(var_9a7e487a))
			{
				var_23abafd7 = activecamo.var_13949c61.stages[var_9a7e487a];
				if(isdefined(var_23abafd7) && var_23abafd7 != stage)
				{
					function_e1b6707f(localclientnum, weapon, var_23abafd7, stage);
				}
			}
		}
	}
	activecamo.var_fe56592[localclientnum].var_dd54a13b[baseweapon].var_d1a848d9 = var_d1a848d9;
	var_58bac2d.var_796fdf6e = stage.rob;
	if(isdefined(stage.rob) && tagname == "tag_weapon_right")
	{
		if(!self function_d2503806(stage.rob, tagname))
		{
			self function_bf9d3071(stage.rob, tagname);
		}
		self callback::add_entity_callback(#"death", &function_ead17f98);
		for(layer = 1; layer <= 3; layer++)
		{
			self thread function_b5b4013c(stage, tagname, layer, var_5e38d32e);
		}
		self thread function_bc6005b5(stage, tagname, "Diffuse2 Alpha", stage.var_2eeeee1b * 1000, stage.diffuse2alpha, var_5e38d32e);
		self thread function_bc6005b5(stage, tagname, "Diffuse3 Alpha", stage.var_7a3e0e45 * 1000, stage.diffuse3alpha, var_5e38d32e);
	}
}

/*
	Name: function_e1b6707f
	Namespace: activecamo
	Checksum: 0xFB0B8C5F
	Offset: 0xEC8
	Size: 0x154
	Parameters: 4
	Flags: Linked, Private
*/
function private function_e1b6707f(localclientnum, weapon, exitstage, enterstage)
{
	if(isdefined(enterstage.var_a000b430))
	{
		playsound(localclientnum, enterstage.var_a000b430);
	}
	else if(isdefined(exitstage.var_1c54e7b8))
	{
		playsound(localclientnum, exitstage.var_1c54e7b8);
	}
	if(isdefined(weapon))
	{
		fx = undefined;
		switch(weapon.weapclass)
		{
			case "rocketlauncher":
			case "mg":
			case "rifle":
			{
				fx = enterstage.var_69896523;
				break;
			}
			case "pistol":
			{
				fx = enterstage.var_bafc7841;
				break;
			}
			default:
			{
				fx = enterstage.var_9828c877;
				break;
			}
		}
		if(isdefined(fx))
		{
			playviewmodelfx(localclientnum, fx, "tag_flash");
		}
	}
}

/*
	Name: function_ead17f98
	Namespace: activecamo
	Checksum: 0xFCA4D196
	Offset: 0x1028
	Size: 0x64
	Parameters: 1
	Flags: Linked, Private
*/
function private function_ead17f98(params)
{
	self function_3e27a7cb(params.localclientnum, "tag_weapon_right");
	self callback::function_52ac9652(#"death", &function_ead17f98);
}

/*
	Name: function_3e27a7cb
	Namespace: activecamo
	Checksum: 0xA662D6E3
	Offset: 0x1098
	Size: 0x6E
	Parameters: 2
	Flags: Linked, Private
*/
function private function_3e27a7cb(localclientnum, tagname)
{
	var_58bac2d = function_16d7447b(localclientnum, tagname, 0);
	if(isdefined(var_58bac2d.var_796fdf6e))
	{
		self function_5d482e78(var_58bac2d.var_796fdf6e, tagname);
		var_58bac2d.var_796fdf6e = undefined;
	}
}

/*
	Name: function_a946fb86
	Namespace: activecamo
	Checksum: 0x18497076
	Offset: 0x1110
	Size: 0x140
	Parameters: 3
	Flags: Linked, Private
*/
function private function_a946fb86(activecamo, var_d1a848d9, var_d1460f46)
{
	foreach(stage in activecamo.var_13949c61.stages)
	{
		if(key > var_d1a848d9)
		{
			break;
		}
		if(isdefined(stage.var_9fbd261d))
		{
			if(is_true(stage.var_d04f3816) || (key < var_d1a848d9 && is_true(stage.var_413aa223)) || (key == var_d1a848d9 && is_true(stage.var_2873d2ba)))
			{
				self function_f0d52864(stage.var_9fbd261d, var_d1460f46);
			}
		}
	}
}

/*
	Name: function_16d7447b
	Namespace: activecamo
	Checksum: 0x7F29C8A9
	Offset: 0x1258
	Size: 0xB6
	Parameters: 3
	Flags: Linked, Private
*/
function private function_16d7447b(localclientnum, tagname, create)
{
	if(!create && !isdefined(self.var_32d117a2[localclientnum][tagname]))
	{
		return undefined;
	}
	if(!isdefined(self.var_32d117a2))
	{
		self.var_32d117a2 = [];
	}
	if(!isdefined(self.var_32d117a2[localclientnum]))
	{
		self.var_32d117a2[localclientnum] = [];
	}
	if(!isdefined(self.var_32d117a2[localclientnum][tagname]))
	{
		self.var_32d117a2[localclientnum][tagname] = {};
	}
	return self.var_32d117a2[localclientnum][tagname];
}

/*
	Name: function_bc6005b5
	Namespace: activecamo
	Checksum: 0xC8776C00
	Offset: 0x1318
	Size: 0x18C
	Parameters: 6
	Flags: Linked, Private
*/
function private function_bc6005b5(stage, tagname, var_eb6a239c, lerptime, var_f023ca7d, var_5e38d32e)
{
	self endon(#"death", #"weapon_change");
	if(!var_5e38d32e && lerptime > 0)
	{
		starttime = gettime();
		while(true)
		{
			waitframe(1);
			if(!isdefined(self) || !isplayer(self))
			{
				return;
			}
			currenttime = gettime();
			lerp = (currenttime - starttime) / lerptime;
			lerp = math::clamp(lerp, 0, 1);
			var_31cfb10 = lerpfloat(0, var_f023ca7d, lerp);
			self function_78233d29(stage.rob, tagname, var_eb6a239c, var_31cfb10);
			if(lerp >= 1)
			{
				return;
			}
		}
	}
	self function_78233d29(stage.rob, tagname, var_eb6a239c, var_f023ca7d);
}

/*
	Name: function_b5b4013c
	Namespace: activecamo
	Checksum: 0x5D6CE39A
	Offset: 0x14B0
	Size: 0x414
	Parameters: 4
	Flags: Linked, Private
*/
function private function_b5b4013c(stage, tagname, layer, var_5e38d32e)
{
	self endon(#"death", #"weapon_change");
	var_238c3eeb = "Layer" + layer;
	var_604ae5c3 = var_238c3eeb + " Brightness";
	var_d6637dc6 = var_238c3eeb + " Fade";
	var_ea35682d = var_238c3eeb + " Tint";
	var_d1732bd2 = "robLayer" + layer;
	var_27c1d8a2 = var_d1732bd2 + "_Brightness";
	var_f5747b8 = var_d1732bd2 + "_Fade";
	var_4a72a14a = var_d1732bd2 + "_LerpTime";
	var_7fd61736 = var_d1732bd2 + "_Tint";
	lerptime = (isdefined(stage.(var_4a72a14a)) ? stage.(var_4a72a14a) : 0) * 1000;
	brightness = (isdefined(stage.(var_27c1d8a2)) ? stage.(var_27c1d8a2) : 0);
	fade = (isdefined(stage.(var_f5747b8)) ? stage.(var_f5747b8) : 0);
	tint = (isdefined(stage.(var_7fd61736)) ? stage.(var_7fd61736) : 0);
	if(!var_5e38d32e && lerptime > 0)
	{
		starttime = gettime();
		while(true)
		{
			waitframe(1);
			if(!isdefined(self) || !isplayer(self))
			{
				return;
			}
			currenttime = gettime();
			lerp = (currenttime - starttime) / lerptime;
			lerp = math::clamp(lerp, 0, 1);
			var_b9c539b7 = lerpfloat(0, brightness, lerp);
			var_a5e1ab6c = lerpfloat(0, fade, lerp);
			var_df9b6bd0 = lerpfloat(0, tint, lerp);
			self function_78233d29(stage.rob, tagname, var_604ae5c3, var_b9c539b7);
			self function_78233d29(stage.rob, tagname, var_d6637dc6, var_a5e1ab6c);
			self function_78233d29(stage.rob, tagname, var_ea35682d, var_df9b6bd0);
			if(lerp >= 1)
			{
				return;
			}
		}
	}
	self function_78233d29(stage.rob, tagname, var_604ae5c3, brightness);
	self function_78233d29(stage.rob, tagname, var_d6637dc6, fade);
	self function_78233d29(stage.rob, tagname, var_ea35682d, tint);
}

/*
	Name: function_8a6ced15
	Namespace: activecamo
	Checksum: 0x77C78B3E
	Offset: 0x18D0
	Size: 0x4B6
	Parameters: 2
	Flags: Linked, Private
*/
function private function_8a6ced15(var_f4eb4a50, forceupdate)
{
	var_13949c61 = undefined;
	if(isdefined(var_f4eb4a50) && isdefined(var_f4eb4a50.name))
	{
		if(!isdefined(level.activecamoinfo))
		{
			level.activecamoinfo = [];
		}
		if(!forceupdate && isdefined(level.activecamoinfo[var_f4eb4a50.name]))
		{
			return level.activecamoinfo[var_f4eb4a50.name];
		}
		if(!isdefined(level.activecamoinfo[var_f4eb4a50.name]))
		{
			level.activecamoinfo[var_f4eb4a50.name] = {};
		}
		var_13949c61 = level.activecamoinfo[var_f4eb4a50.name];
		if(isdefined(var_f4eb4a50.stages))
		{
			if(!isdefined(var_13949c61.stages))
			{
				var_13949c61.stages = [];
			}
			var_d3daabe = 0;
			foreach(var_3594168e in var_f4eb4a50.stages)
			{
				if(is_true(var_3594168e.disabled))
				{
					var_d3daabe++;
					continue;
				}
				if(!isdefined(var_13949c61.stages[key - var_d3daabe]))
				{
					var_13949c61.stages[key - var_d3daabe] = {};
				}
				stage = var_13949c61.stages[key - var_d3daabe];
				stage.rob = var_3594168e.rob;
				if(isdefined(var_3594168e.var_879c8798))
				{
					stage.var_19b6044e = function_8b51d9d1(var_3594168e.var_879c8798);
				}
				stage.var_9fbd261d = var_3594168e.var_9fbd261d;
				stage.var_d2eac588 = var_3594168e.var_d2eac588;
				stage.var_e2dbd42d = function_54f0afd2(var_3594168e);
				if(isdefined(stage.var_9fbd261d))
				{
					stage.var_d04f3816 = var_3594168e.var_d04f3816;
					stage.var_413aa223 = var_3594168e.var_413aa223;
					stage.var_2873d2ba = var_3594168e.var_2873d2ba;
				}
				if(is_true(level.var_b9b11197))
				{
					stage.var_1c54e7b8 = var_3594168e.var_1c54e7b8;
					stage.var_a000b430 = var_3594168e.var_a000b430;
				}
				stage.var_bafc7841 = var_3594168e.var_bafc7841;
				stage.var_9828c877 = var_3594168e.var_9828c877;
				stage.var_69896523 = var_3594168e.var_69896523;
				for(layer = 1; layer <= 3; layer++)
				{
					var_d1732bd2 = "robLayer" + layer;
					var_4a72a14a = var_d1732bd2 + "_LerpTime";
					var_27c1d8a2 = var_d1732bd2 + "_Brightness";
					var_f5747b8 = var_d1732bd2 + "_Fade";
					var_7fd61736 = var_d1732bd2 + "_Tint";
					stage.(var_4a72a14a) = var_3594168e.(var_4a72a14a);
					stage.(var_27c1d8a2) = var_3594168e.(var_27c1d8a2);
					stage.(var_f5747b8) = var_3594168e.(var_f5747b8);
					stage.(var_7fd61736) = var_3594168e.(var_7fd61736);
				}
				stage.diffuse2alpha = (isdefined(var_3594168e.diffuse2alpha) ? var_3594168e.diffuse2alpha : 0);
				stage.var_2eeeee1b = (isdefined(var_3594168e.var_2eeeee1b) ? var_3594168e.var_2eeeee1b : 0);
				stage.diffuse3alpha = (isdefined(var_3594168e.diffuse3alpha) ? var_3594168e.diffuse3alpha : 0);
				stage.var_7a3e0e45 = (isdefined(var_3594168e.var_7a3e0e45) ? var_3594168e.var_7a3e0e45 : 0);
			}
		}
	}
	return var_13949c61;
}

/*
	Name: function_6f08b691
	Namespace: activecamo
	Checksum: 0x2B0743BF
	Offset: 0x1D90
	Size: 0x104
	Parameters: 2
	Flags: Linked, Private
*/
function private function_6f08b691(var_f4eb4a50, forceupdate)
{
	if(isdefined(var_f4eb4a50))
	{
		if(!isdefined(self.var_9413f8b4))
		{
			self.var_9413f8b4 = [];
		}
		if(!forceupdate && isdefined(self.var_9413f8b4[var_f4eb4a50.name]))
		{
			return self.var_9413f8b4[var_f4eb4a50.name];
		}
		if(!isdefined(self.var_9413f8b4[var_f4eb4a50.name]))
		{
			self.var_9413f8b4[var_f4eb4a50.name] = {};
		}
		activecamo = self.var_9413f8b4[var_f4eb4a50.name];
		activecamo.var_13949c61 = function_8a6ced15(var_f4eb4a50, forceupdate);
		/#
			assert(isdefined(activecamo.var_13949c61));
		#/
		return activecamo;
	}
	return undefined;
}

/*
	Name: function_6c9e0e1a
	Namespace: activecamo
	Checksum: 0x7E48F664
	Offset: 0x1EA0
	Size: 0x440
	Parameters: 4
	Flags: Linked
*/
function function_6c9e0e1a(localclientnum, weaponmodel, var_3594168e, &var_49daa2f6)
{
	if(!isdefined(var_3594168e.rob))
	{
		return false;
	}
	stage = {};
	stage.rob = var_3594168e.rob;
	stage.diffuse2alpha = (isdefined(var_3594168e.diffuse2alpha) ? var_3594168e.diffuse2alpha : 0);
	stage.var_2eeeee1b = (isdefined(var_3594168e.var_2eeeee1b) ? var_3594168e.var_2eeeee1b : 0);
	stage.diffuse3alpha = (isdefined(var_3594168e.diffuse3alpha) ? var_3594168e.diffuse3alpha : 0);
	stage.var_7a3e0e45 = (isdefined(var_3594168e.var_7a3e0e45) ? var_3594168e.var_7a3e0e45 : 0);
	if(!weaponmodel function_d2503806(stage.rob, "tag_origin"))
	{
		weaponmodel function_bf9d3071(stage.rob, "tag_origin");
		var_49daa2f6[localclientnum] = stage.rob;
	}
	for(layer = 1; layer <= 3; layer++)
	{
		var_d1732bd2 = "robLayer" + layer;
		var_27c1d8a2 = var_d1732bd2 + "_Brightness";
		var_f5747b8 = var_d1732bd2 + "_Fade";
		var_7fd61736 = var_d1732bd2 + "_Tint";
		stage.(var_27c1d8a2) = (isdefined(var_3594168e.(var_27c1d8a2)) ? var_3594168e.(var_27c1d8a2) : 0);
		stage.(var_f5747b8) = (isdefined(var_3594168e.(var_f5747b8)) ? var_3594168e.(var_f5747b8) : 0);
		stage.(var_7fd61736) = (isdefined(var_3594168e.(var_7fd61736)) ? var_3594168e.(var_7fd61736) : 0);
		var_238c3eeb = "Layer" + layer;
		var_604ae5c3 = var_238c3eeb + " Brightness";
		var_d6637dc6 = var_238c3eeb + " Fade";
		var_ea35682d = var_238c3eeb + " Tint";
		weaponmodel function_78233d29(stage.rob, "tag_origin", var_604ae5c3, stage.(var_27c1d8a2));
		weaponmodel function_78233d29(stage.rob, "tag_origin", var_d6637dc6, stage.(var_f5747b8));
		weaponmodel function_78233d29(stage.rob, "tag_origin", var_ea35682d, stage.(var_7fd61736));
	}
	diffuse2alpha = (isdefined(var_3594168e.diffuse2alpha) ? var_3594168e.diffuse2alpha : 0);
	diffuse3alpha = (isdefined(var_3594168e.diffuse3alpha) ? var_3594168e.diffuse3alpha : 0);
	weaponmodel function_78233d29(stage.rob, "tag_origin", "Diffuse2 Alpha", diffuse2alpha);
	weaponmodel function_78233d29(stage.rob, "tag_origin", "Diffuse3 Alpha", diffuse3alpha);
	return true;
}

/*
	Name: function_cbfd8fd6
	Namespace: activecamo
	Checksum: 0xE1416F87
	Offset: 0x22E8
	Size: 0xA4
	Parameters: 1
	Flags: Linked
*/
function function_cbfd8fd6(localclientnum)
{
	if(isdefined(self.weapon))
	{
		var_6f2ae9c0 = self function_e10e6c37();
		var_f4eb4a50 = self function_51bb743b(self.weapon, var_6f2ae9c0);
		if(isdefined(var_f4eb4a50))
		{
			var_d1a848d9 = function_5442be13(var_6f2ae9c0);
			self function_7721b2d5(localclientnum, var_f4eb4a50, var_d1a848d9);
		}
	}
}

/*
	Name: function_e40c785a
	Namespace: activecamo
	Checksum: 0xC3156FC9
	Offset: 0x2398
	Size: 0x12C
	Parameters: 1
	Flags: Linked
*/
function function_e40c785a(localclientnum)
{
	if(isdefined(self.weapon))
	{
		var_6f2ae9c0 = self function_e10e6c37();
		var_f4eb4a50 = self function_51bb743b(self.weapon, var_6f2ae9c0);
		if(isdefined(var_f4eb4a50))
		{
			if(isdefined(var_f4eb4a50.stages))
			{
				init_stage = 0;
				foreach(key, var_3594168e in var_f4eb4a50.stages)
				{
					if(isdefined(var_3594168e.var_d2eac588))
					{
						continue;
					}
					init_stage = key;
					break;
				}
				self function_7721b2d5(localclientnum, var_f4eb4a50, init_stage);
			}
		}
	}
}

/*
	Name: function_6efb762c
	Namespace: activecamo
	Checksum: 0xC096388D
	Offset: 0x24D0
	Size: 0x284
	Parameters: 3
	Flags: Linked
*/
function function_6efb762c(localclientnum, var_e827f698, weaponoptions)
{
	var_f4eb4a50 = self function_51bb743b(var_e827f698, weaponoptions);
	if(isdefined(var_f4eb4a50))
	{
		player = function_27673a7(localclientnum);
		activecamo = player function_6f08b691(var_f4eb4a50, 0);
		if(isdefined(activecamo))
		{
			baseweapon = function_c14cb514(var_e827f698);
			init_stage = function_5442be13(weaponoptions);
			if(isdefined(activecamo.var_fe56592) && isdefined(activecamo.var_fe56592[localclientnum]) && isdefined(activecamo.var_fe56592[localclientnum].var_dd54a13b[baseweapon]))
			{
				init_stage = activecamo.var_fe56592[localclientnum].var_dd54a13b[baseweapon].var_d1a848d9;
			}
			else
			{
				camoindex = getcamoindex(weaponoptions);
				activecamo = player function_130e0542(localclientnum, var_e827f698, camoindex);
				if(isdefined(activecamo) && isdefined(activecamo.var_fe56592) && isdefined(activecamo.var_fe56592[localclientnum]) && isdefined(activecamo.var_fe56592[localclientnum].var_dd54a13b[baseweapon]))
				{
					init_stage = activecamo.var_fe56592[localclientnum].var_dd54a13b[baseweapon].var_d1a848d9;
				}
			}
			if(isdefined(var_f4eb4a50.stages))
			{
				var_3594168e = var_f4eb4a50.stages[init_stage];
				if(isdefined(var_3594168e.var_879c8798))
				{
					var_19b6044e = function_8b51d9d1(var_3594168e.var_879c8798);
					self function_bd3cce02(var_19b6044e);
					self function_a6fc2979(init_stage);
				}
			}
			self function_7721b2d5(localclientnum, var_f4eb4a50, init_stage);
		}
	}
}

/*
	Name: function_7721b2d5
	Namespace: activecamo
	Checksum: 0xD8D0E7BB
	Offset: 0x2760
	Size: 0x94
	Parameters: 3
	Flags: Linked
*/
function function_7721b2d5(localclientnum, var_f4eb4a50, init_stage)
{
	if(isdefined(var_f4eb4a50) && isdefined(var_f4eb4a50.stages))
	{
		var_3594168e = var_f4eb4a50.stages[init_stage];
		if(isdefined(var_3594168e))
		{
			if(!isdefined(self.var_49daa2f6))
			{
				self.var_49daa2f6 = [];
			}
			function_6c9e0e1a(localclientnum, self, var_3594168e, self.var_49daa2f6);
		}
	}
}

/*
	Name: function_ce6b99ba
	Namespace: activecamo
	Checksum: 0x7AAC8C76
	Offset: 0x2800
	Size: 0x52
	Parameters: 1
	Flags: Linked
*/
function function_ce6b99ba(weapon)
{
	var_f879230e = self function_8cbd254d();
	activecamoname = function_ad9499dc(weapon, var_f879230e);
	return activecamoname;
}

/*
	Name: function_51bb743b
	Namespace: activecamo
	Checksum: 0xCBD0AEC7
	Offset: 0x2860
	Size: 0xAE
	Parameters: 2
	Flags: Linked
*/
function function_51bb743b(weapon, var_6f2ae9c0)
{
	var_f4eb4a50 = function_edd6511(var_6f2ae9c0);
	if(isdefined(var_f4eb4a50))
	{
		return var_f4eb4a50;
	}
	if(isdefined(weapon))
	{
		activecamoname = self function_ce6b99ba(weapon);
		if(isdefined(activecamoname) && activecamoname != #"")
		{
			var_f4eb4a50 = getscriptbundle(activecamoname);
			return var_f4eb4a50;
		}
	}
	return undefined;
}

/*
	Name: function_12e53b2d
	Namespace: activecamo
	Checksum: 0x1981F335
	Offset: 0x2918
	Size: 0x1A0
	Parameters: 0
	Flags: None
*/
function function_12e53b2d()
{
	/#
		self notify("");
		self endon("");
		while(true)
		{
			var_f4eb4a50 = undefined;
			waitresult = undefined;
			waitresult = level waittill(#"liveupdate");
			if(!isdefined(level.activecamoinfo))
			{
				continue;
			}
			if(isdefined(waitresult.scriptbundlename))
			{
				var_f4eb4a50 = getscriptbundle(waitresult.scriptbundlename);
				if(!isdefined(var_f4eb4a50.name))
				{
					continue;
				}
				if(!isdefined(level.activecamoinfo[var_f4eb4a50.name]))
				{
					continue;
				}
				players = getplayers(0);
				foreach(player in players)
				{
					activecamo = player function_6f08b691(var_f4eb4a50, 1);
				}
				function_e3e0feb5(0, undefined);
			}
		}
	#/
}

