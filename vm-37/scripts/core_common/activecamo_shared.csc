#using scripts\core_common\player\player_stats.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\math_shared.csc;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\struct.csc;
#using script_474309807eb94f34;

#namespace activecamo;

/*
	Name: __init__system__
	Namespace: activecamo
	Checksum: 0x5EE69D
	Offset: 0x170
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"activecamo", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: activecamo
	Checksum: 0xDAE116DA
	Offset: 0x1B8
	Size: 0xD4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	callback::add_callback(#"updateactivecamo", &updateactivecamo);
	callback::on_spawned(&on_player_spawned);
	callback::on_weapon_change(&on_weapon_change);
	callback::on_localplayer_spawned(&on_local_player_spawned);
	level.var_b9b11197 = getgametypesetting(#"hash_1f3825ba2a669400");
	/#
		thread function_12e53b2d();
	#/
}

/*
	Name: on_local_player_spawned
	Namespace: activecamo
	Checksum: 0x871C6BE9
	Offset: 0x298
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
	Checksum: 0xC7140DC9
	Offset: 0x2E8
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
		stagenum = getactivecamostage(weaponoptions);
		player function_158c76b1(localclientnum, weapon, "tag_weapon_right", stagenum, 1, weaponoptions);
	}
}

/*
	Name: on_weapon_change
	Namespace: activecamo
	Checksum: 0xF1C4C73
	Offset: 0x488
	Size: 0xD4
	Parameters: 1
	Flags: Linked, Private
*/
function private on_weapon_change(params)
{
	if(self == level || !isplayer(self))
	{
		return;
	}
	localclientnum = params.localclientnum;
	weapon = self function_d2c2b168();
	weaponoptions = self function_e10e6c37();
	stagenum = getactivecamostage(weaponoptions);
	self function_158c76b1(localclientnum, weapon, "tag_weapon_right", stagenum, 1, weaponoptions);
}

/*
	Name: on_player_spawned
	Namespace: activecamo
	Checksum: 0x86D48095
	Offset: 0x568
	Size: 0x9C
	Parameters: 1
	Flags: Linked, Private
*/
function private on_player_spawned(localclientnum)
{
	weapon = self function_d2c2b168();
	weaponoptions = self function_e10e6c37();
	stagenum = getactivecamostage(weaponoptions);
	self function_158c76b1(localclientnum, weapon, "tag_weapon_right", stagenum, 1, weaponoptions);
}

/*
	Name: function_451a49f4
	Namespace: activecamo
	Checksum: 0x8AB071DF
	Offset: 0x610
	Size: 0x13E
	Parameters: 4
	Flags: Linked, Private
*/
function private function_451a49f4(localclientnum, var_f4eb4a50, weapon, stagenum)
{
	activecamo = self init_activecamo(var_f4eb4a50, 0);
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
		activecamo.var_fe56592[localclientnum].var_dd54a13b[baseweapon].stagenum = stagenum;
	}
	return activecamo;
}

/*
	Name: function_130e0542
	Namespace: activecamo
	Checksum: 0x5F101DF8
	Offset: 0x758
	Size: 0x1B4
	Parameters: 3
	Flags: Linked, Private
*/
function private function_130e0542(localclientnum, weapon, camoindex)
{
	init_stage = 0;
	var_f4eb4a50 = function_13e12ab1(camoindex);
	activecamo = self init_activecamo(var_f4eb4a50, 0);
	if(isdefined(activecamo))
	{
		if(isdefined(activecamo.var_13949c61.stages))
		{
			var_f8bf269c = 0;
			foreach(key, stage in activecamo.var_13949c61.stages)
			{
				if(isdefined(stage.var_d2eac588))
				{
					camo_stat = stats::get_stat_global(localclientnum, stage.var_d2eac588);
					if(isdefined(camo_stat) && camo_stat >= stage.var_e2dbd42d)
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
	Name: updateactivecamo
	Namespace: activecamo
	Checksum: 0xDA1E4D21
	Offset: 0x918
	Size: 0x6C
	Parameters: 2
	Flags: Linked, Private
*/
function private updateactivecamo(localclientnum, eventstruct)
{
	stagenum = getactivecamostage(eventstruct.var_6f2ae9c0);
	self function_158c76b1(localclientnum, eventstruct.weapon, eventstruct.tagname, stagenum, 0, eventstruct.var_6f2ae9c0);
}

/*
	Name: function_158c76b1
	Namespace: activecamo
	Checksum: 0x29C5343B
	Offset: 0x990
	Size: 0x50C
	Parameters: 6
	Flags: Linked, Private
*/
function private function_158c76b1(localclientnum, weapon, tagname, stagenum, var_d71e8c6e, var_6f2ae9c0)
{
	var_d1460f46 = isdefined(tagname) && tagname == "tag_stowed_back";
	self function_7a55e60a(var_d1460f46);
	var_f4eb4a50 = function_edd6511(var_6f2ae9c0);
	if(!isdefined(var_f4eb4a50))
	{
		function_3e27a7cb(localclientnum, tagname);
		return;
	}
	activecamo = self init_activecamo(var_f4eb4a50, 0);
	if(!isdefined(activecamo.var_13949c61.stages))
	{
		function_3e27a7cb(localclientnum, tagname);
		return;
	}
	stage = activecamo.var_13949c61.stages[stagenum];
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
	if(isdefined(var_58bac2d.crob) && var_58bac2d.crob !== stage.rob)
	{
		function_3e27a7cb(localclientnum, tagname);
	}
	self function_a946fb86(activecamo, stagenum, var_d1460f46);
	var_5e38d32e = 1;
	if(!var_d1460f46 && self function_21c0fa55())
	{
		var_5bdd03ea = isswitchingweapons(localclientnum);
		var_5e38d32e = var_5bdd03ea || var_d71e8c6e;
		if(!var_5bdd03ea)
		{
			var_9a7e487a = activecamo.var_fe56592[localclientnum].var_dd54a13b[baseweapon].stagenum;
			if(isdefined(var_9a7e487a))
			{
				laststage = activecamo.var_13949c61.stages[var_9a7e487a];
				if(isdefined(laststage) && laststage != stage)
				{
					function_e1b6707f(localclientnum, weapon, laststage, stage);
				}
			}
		}
	}
	activecamo.var_fe56592[localclientnum].var_dd54a13b[baseweapon].stagenum = stagenum;
	var_58bac2d.crob = stage.rob;
	if(isdefined(stage.rob) && tagname == "tag_weapon_right")
	{
		if(!self function_d2503806(stage.rob, tagname))
		{
			self playrenderoverridebundle(stage.rob, tagname);
		}
		self callback::add_entity_callback(#"death", &player_on_death);
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
	Checksum: 0x647A0308
	Offset: 0xEA8
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
	Name: player_on_death
	Namespace: activecamo
	Checksum: 0x2BB240DA
	Offset: 0x1008
	Size: 0x64
	Parameters: 1
	Flags: Linked, Private
*/
function private player_on_death(params)
{
	self function_3e27a7cb(params.localclientnum, "tag_weapon_right");
	self callback::function_52ac9652(#"death", &player_on_death);
}

/*
	Name: function_3e27a7cb
	Namespace: activecamo
	Checksum: 0xD11DE552
	Offset: 0x1078
	Size: 0x6E
	Parameters: 2
	Flags: Linked, Private
*/
function private function_3e27a7cb(localclientnum, tagname)
{
	var_58bac2d = function_16d7447b(localclientnum, tagname, 0);
	if(isdefined(var_58bac2d.crob))
	{
		self stoprenderoverridebundle(var_58bac2d.crob, tagname);
		var_58bac2d.crob = undefined;
	}
}

/*
	Name: function_a946fb86
	Namespace: activecamo
	Checksum: 0xBFF87E14
	Offset: 0x10F0
	Size: 0x140
	Parameters: 3
	Flags: Linked, Private
*/
function private function_a946fb86(activecamo, stagenum, var_d1460f46)
{
	foreach(stage in activecamo.var_13949c61.stages)
	{
		if(key > stagenum)
		{
			break;
		}
		if(isdefined(stage.var_9fbd261d))
		{
			if(is_true(stage.var_d04f3816) || (key < stagenum && is_true(stage.var_413aa223)) || (key == stagenum && is_true(stage.var_2873d2ba)))
			{
				self function_f0d52864(stage.var_9fbd261d, var_d1460f46);
			}
		}
	}
}

/*
	Name: function_16d7447b
	Namespace: activecamo
	Checksum: 0xF30FB240
	Offset: 0x1238
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
	Checksum: 0xAF40C6C8
	Offset: 0x12F8
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
	Checksum: 0x669A833C
	Offset: 0x1490
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
	Checksum: 0xB2240E18
	Offset: 0x18B0
	Size: 0x4C6
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
				stage.var_e2dbd42d = (isdefined(var_3594168e.var_e2dbd42d) ? var_3594168e.var_e2dbd42d : 0);
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
	Name: init_activecamo
	Namespace: activecamo
	Checksum: 0x6AFA3760
	Offset: 0x1D80
	Size: 0x104
	Parameters: 2
	Flags: Linked, Private
*/
function private init_activecamo(var_f4eb4a50, forceupdate)
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
	Checksum: 0x619AB8DA
	Offset: 0x1E90
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
		weaponmodel playrenderoverridebundle(stage.rob, "tag_origin");
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
	Checksum: 0xDB52051A
	Offset: 0x22D8
	Size: 0xBC
	Parameters: 1
	Flags: Linked
*/
function function_cbfd8fd6(localclientnum)
{
	if(isdefined(self.weapon))
	{
		weaponoptions = self function_e10e6c37();
		camoindex = getcamoindex(weaponoptions);
		var_f4eb4a50 = function_13e12ab1(camoindex);
		if(isdefined(var_f4eb4a50))
		{
			stagenum = getactivecamostage(weaponoptions);
			self function_7721b2d5(localclientnum, var_f4eb4a50, stagenum);
		}
	}
}

/*
	Name: function_e40c785a
	Namespace: activecamo
	Checksum: 0xA1BA3C93
	Offset: 0x23A0
	Size: 0x13C
	Parameters: 1
	Flags: Linked
*/
function function_e40c785a(localclientnum)
{
	weaponoptions = self function_e10e6c37();
	camoindex = getcamoindex(weaponoptions);
	var_f4eb4a50 = function_13e12ab1(camoindex);
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

/*
	Name: function_6efb762c
	Namespace: activecamo
	Checksum: 0x6392EE10
	Offset: 0x24E8
	Size: 0x27C
	Parameters: 3
	Flags: Linked
*/
function function_6efb762c(localclientnum, camoweapon, weaponoptions)
{
	camoindex = getcamoindex(weaponoptions);
	var_f4eb4a50 = function_13e12ab1(camoindex);
	if(isdefined(var_f4eb4a50))
	{
		player = function_27673a7(localclientnum);
		activecamo = player init_activecamo(var_f4eb4a50, 0);
		if(isdefined(activecamo))
		{
			baseweapon = function_c14cb514(camoweapon);
			init_stage = getactivecamostage(weaponoptions);
			if(isdefined(activecamo.var_fe56592) && isdefined(activecamo.var_fe56592[localclientnum]) && isdefined(activecamo.var_fe56592[localclientnum].var_dd54a13b[baseweapon]))
			{
				init_stage = activecamo.var_fe56592[localclientnum].var_dd54a13b[baseweapon].stagenum;
			}
			else
			{
				activecamo = player function_130e0542(localclientnum, camoweapon, camoindex);
				if(isdefined(activecamo) && isdefined(activecamo.var_fe56592) && isdefined(activecamo.var_fe56592[localclientnum]) && isdefined(activecamo.var_fe56592[localclientnum].var_dd54a13b[baseweapon]))
				{
					init_stage = activecamo.var_fe56592[localclientnum].var_dd54a13b[baseweapon].stagenum;
				}
			}
			if(isdefined(var_f4eb4a50.stages))
			{
				var_3594168e = var_f4eb4a50.stages[init_stage];
				if(isdefined(var_3594168e))
				{
					var_19b6044e = function_8b51d9d1(var_3594168e.var_879c8798);
					self setcamo(var_19b6044e);
					self setactivecamostage(init_stage);
				}
			}
			self function_7721b2d5(localclientnum, var_f4eb4a50, init_stage);
		}
	}
}

/*
	Name: function_7721b2d5
	Namespace: activecamo
	Checksum: 0x952F6294
	Offset: 0x2770
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
	Name: function_12e53b2d
	Namespace: activecamo
	Checksum: 0x51EA721
	Offset: 0x2810
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
					activecamo = player init_activecamo(var_f4eb4a50, 1);
				}
				function_e3e0feb5(0, undefined);
			}
		}
	#/
}

