#using scripts\cp_common\util.gsc;
#using scripts\cp_common\skipto.gsc;
#using scripts\core_common\oob.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\player\player_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace savegame;

/*
	Name: __init__system__
	Namespace: savegame
	Checksum: 0x71B6FC5F
	Offset: 0x1D8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"save", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: savegame
	Checksum: 0x1FCA8B6D
	Offset: 0x220
	Size: 0x334
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(!isdefined(world.loadout))
	{
		world.loadout = [];
	}
	if(!isdefined(world.mapdata))
	{
		world.mapdata = [];
	}
	if(!isdefined(world.playerdata))
	{
		world.playerdata = [];
	}
	level.var_9d48137b = &clear_mission_data;
	level.var_8fe8980a = &function_9797184c;
	missionid = get_mission_name();
	if(!isdefined(world.mapdata[missionid][#"persistent"]))
	{
		world.mapdata[missionid][#"persistent"] = spawnstruct();
	}
	if(!isdefined(world.mapdata[missionid][#"transient"]))
	{
		world.mapdata[missionid][#"transient"] = spawnstruct();
	}
	var_316f308b = savegame_getsavedmap();
	if(!isdefined(var_316f308b) || var_316f308b.size == 0 || getrootmapname(missionid) !== getrootmapname(var_316f308b))
	{
		set_player_data("previous_mission", "");
		set_player_data("previous_safehouse", "");
	}
	var_361c6eb = getdvar(#"hash_1d8621150bcf0c0c", "");
	if(!isdefined(var_361c6eb) || var_361c6eb.size == 0 || var_361c6eb == skipto::function_5011fee2(missionid))
	{
		clear_mission_data(#"transient");
	}
	foreach(trig in trigger::get_all())
	{
		if(is_true(trig.var_544e29))
		{
			trig thread checkpoint_trigger();
		}
	}
	level.var_a1cfeb5a = [];
}

/*
	Name: save
	Namespace: savegame
	Checksum: 0x94E7E80E
	Offset: 0x560
	Size: 0x1C4
	Parameters: 1
	Flags: None
*/
function save(var_116ab377)
{
	if(!function_7642d0c9() || level.gameended)
	{
		return;
	}
	if(!isdefined(var_116ab377))
	{
		var_116ab377 = get_mission_name();
	}
	savegame_create(var_116ab377);
	var_2466c81f = getmaporder() < 0;
	if(var_2466c81f)
	{
		return;
	}
	player = getplayers()[0];
	if(!isdefined(player))
	{
		return;
	}
	var_8670e6a3 = get_mission_data(#"persistent", var_116ab377);
	var_8670e6a3.unlocked = 1;
	player stats::set_stat(#"mapdata", var_116ab377, #"unlocked", 1);
	var_116ab377 = get_mission_name();
	player stats::set_stat(#"hash_19d9ddd673699368", hash(var_116ab377));
	var_c82845ea = getutc();
	player stats::set_stat(#"hash_6addb0d6ea1de644", var_c82845ea);
	uploadstats(player);
}

/*
	Name: function_ac15668a
	Namespace: savegame
	Checksum: 0xACF888B6
	Offset: 0x730
	Size: 0x52
	Parameters: 1
	Flags: None
*/
function function_ac15668a(var_1fdcd030)
{
	var_8670e6a3 = get_mission_data(#"persistent", var_1fdcd030);
	return is_true(var_8670e6a3.complete);
}

/*
	Name: function_1b212e67
	Namespace: savegame
	Checksum: 0xECB82270
	Offset: 0x790
	Size: 0x52
	Parameters: 1
	Flags: None
*/
function function_1b212e67(var_1fdcd030)
{
	var_8670e6a3 = get_mission_data(#"persistent", var_1fdcd030);
	return is_true(var_8670e6a3.unlocked);
}

/*
	Name: function_fa31c391
	Namespace: savegame
	Checksum: 0x17292DE9
	Offset: 0x7F0
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_fa31c391()
{
	clear_player_data();
	function_a620739b();
}

/*
	Name: set_mission_name
	Namespace: savegame
	Checksum: 0x9BF43932
	Offset: 0x820
	Size: 0x9C
	Parameters: 1
	Flags: None
*/
function set_mission_name(name)
{
	if(isdefined(level.savename) && level.savename != name && level.script != "cp_ger_hub")
	{
		/#
			errormsg(((("" + level.savename) + "") + name) + "");
		#/
	}
	level.savename = name;
}

/*
	Name: get_mission_name
	Namespace: savegame
	Checksum: 0x1EF22C58
	Offset: 0x8C8
	Size: 0x36
	Parameters: 0
	Flags: None
*/
function get_mission_name()
{
	if(!isdefined(level.savename))
	{
		set_mission_name(level.script);
	}
	return level.savename;
}

/*
	Name: get_mission_data
	Namespace: savegame
	Checksum: 0xA1688285
	Offset: 0x908
	Size: 0xDA
	Parameters: 2
	Flags: None
*/
function get_mission_data(dataname, var_1fdcd030)
{
	if(!isdefined(dataname))
	{
		dataname = #"transient";
	}
	if(!isdefined(var_1fdcd030))
	{
		var_1fdcd030 = get_mission_name();
	}
	if(!isdefined(world.mapdata))
	{
		world.mapdata = [];
	}
	if(!isdefined(world.mapdata[var_1fdcd030]))
	{
		world.mapdata[var_1fdcd030] = [];
	}
	if(!isdefined(world.mapdata[var_1fdcd030][dataname]))
	{
		world.mapdata[var_1fdcd030][dataname] = spawnstruct();
	}
	return world.mapdata[var_1fdcd030][dataname];
}

/*
	Name: clear_mission_data
	Namespace: savegame
	Checksum: 0x5D043EB
	Offset: 0x9F0
	Size: 0x126
	Parameters: 2
	Flags: None
*/
function clear_mission_data(dataname, var_1fdcd030)
{
	if(!isdefined(var_1fdcd030))
	{
		var_1fdcd030 = get_mission_name();
	}
	if(isdefined(world.mapdata) && isdefined(world.mapdata[var_1fdcd030]))
	{
		if(isdefined(dataname))
		{
			if(isdefined(world.mapdata[var_1fdcd030][dataname]))
			{
				world.mapdata[var_1fdcd030][dataname] = spawnstruct();
			}
		}
		else
		{
			foreach(value in world.mapdata[var_1fdcd030])
			{
				world.mapdata[var_1fdcd030][dataname] = spawnstruct();
			}
		}
	}
}

/*
	Name: function_a620739b
	Namespace: savegame
	Checksum: 0x8FF17945
	Offset: 0xB20
	Size: 0x20
	Parameters: 0
	Flags: None
*/
function function_a620739b()
{
	if(isdefined(world.mapdata))
	{
		world.mapdata = [];
	}
}

/*
	Name: function_7e0e735b
	Namespace: savegame
	Checksum: 0x76A8E137
	Offset: 0xB48
	Size: 0xEC
	Parameters: 0
	Flags: None
*/
function function_7e0e735b()
{
	var_1fdcd030 = get_mission_name();
	level.var_d6bcee66 = [];
	if(isdefined(world.mapdata[var_1fdcd030]))
	{
		foreach(dataname, value in world.mapdata[var_1fdcd030])
		{
			level.var_d6bcee66[dataname] = function_2e532eed(world.mapdata[var_1fdcd030][dataname], 1);
		}
	}
}

/*
	Name: function_9797184c
	Namespace: savegame
	Checksum: 0x52E47C15
	Offset: 0xC40
	Size: 0xE6
	Parameters: 0
	Flags: None
*/
function function_9797184c()
{
	clear_mission_data();
	var_1fdcd030 = get_mission_name();
	if(isdefined(level.var_d6bcee66))
	{
		foreach(dataname, value in level.var_d6bcee66)
		{
			world.mapdata[var_1fdcd030][dataname] = function_2e532eed(level.var_d6bcee66[dataname], 1);
		}
	}
}

/*
	Name: function_379f84b3
	Namespace: savegame
	Checksum: 0x79793532
	Offset: 0xD30
	Size: 0x4DE
	Parameters: 0
	Flags: None
*/
function function_379f84b3()
{
	missionid = get_mission_name();
	world.mapdata[missionid][#"transient"].var_2e7c022f = [];
	player = getplayers()[0];
	a_weapon_list = player getweaponslist();
	current_weapon = player getcurrentweapon();
	world.mapdata[missionid][#"transient"].var_37017d9 = current_weapon.name;
	foreach(weapon in a_weapon_list)
	{
		if(isdefined(weapon.name))
		{
			if(!isdefined(world.mapdata[missionid][#"transient"].var_2e7c022f))
			{
				world.mapdata[missionid][#"transient"].var_2e7c022f = [];
			}
			else if(!isarray(world.mapdata[missionid][#"transient"].var_2e7c022f))
			{
				world.mapdata[missionid][#"transient"].var_2e7c022f = array(world.mapdata[missionid][#"transient"].var_2e7c022f);
			}
			world.mapdata[missionid][#"transient"].var_2e7c022f[world.mapdata[missionid][#"transient"].var_2e7c022f.size] = weapon.name;
			if(isdefined(weapon.attachments) && weapon.attachments.size > 0)
			{
				world.mapdata[missionid][#"transient"].var_ba4d1bad[weapon.name] = [];
				foreach(attachment in weapon.attachments)
				{
					if(!isdefined(world.mapdata[missionid][#"transient"].var_ba4d1bad[weapon.name]))
					{
						world.mapdata[missionid][#"transient"].var_ba4d1bad[weapon.name] = [];
					}
					else if(!isarray(world.mapdata[missionid][#"transient"].var_ba4d1bad[weapon.name]))
					{
						world.mapdata[missionid][#"transient"].var_ba4d1bad[weapon.name] = array(world.mapdata[missionid][#"transient"].var_ba4d1bad[weapon.name]);
					}
					world.mapdata[missionid][#"transient"].var_ba4d1bad[weapon.name][world.mapdata[missionid][#"transient"].var_ba4d1bad[weapon.name].size] = attachment;
				}
			}
		}
	}
}

/*
	Name: function_7396472d
	Namespace: savegame
	Checksum: 0x8B96B1D7
	Offset: 0x1218
	Size: 0x29C
	Parameters: 0
	Flags: None
*/
function function_7396472d()
{
	missionid = get_mission_name();
	player = getplayers()[0];
	if(isdefined(world.mapdata[missionid][#"transient"].var_2e7c022f))
	{
		player takeallweapons();
		foreach(weapon_name in world.mapdata[missionid][#"transient"].var_2e7c022f)
		{
			if(isdefined(weapon_name))
			{
				if(isdefined(world.mapdata[missionid][#"transient"].var_ba4d1bad[weapon_name]))
				{
					weapon = getweapon(weapon_name, world.mapdata[missionid][#"transient"].var_ba4d1bad[weapon_name]);
				}
				else
				{
					weapon = getweapon(weapon_name);
				}
				if(isdefined(weapon))
				{
					player giveweapon(weapon);
				}
			}
		}
		if(isdefined(world.mapdata[missionid][#"transient"].var_37017d9))
		{
			current_weapon = player getcurrentweapon();
			var_fc1c4650 = getweapon(world.mapdata[missionid][#"transient"].var_37017d9);
			if(isdefined(current_weapon) && isdefined(var_fc1c4650) && current_weapon != var_fc1c4650)
			{
				if(player hasweapon(var_fc1c4650))
				{
					player switchtoweaponimmediate(var_fc1c4650);
				}
			}
		}
	}
}

/*
	Name: set_player_data
	Namespace: savegame
	Checksum: 0xB71A3347
	Offset: 0x14C0
	Size: 0x7E
	Parameters: 2
	Flags: None
*/
function set_player_data(name, value)
{
	var_91a52156 = "CP";
	if(!isdefined(world.playerdata))
	{
		world.playerdata = [];
	}
	if(!isdefined(world.playerdata[var_91a52156]))
	{
		world.playerdata[var_91a52156] = [];
	}
	world.playerdata[var_91a52156][name] = value;
}

/*
	Name: get_player_data
	Namespace: savegame
	Checksum: 0x4AAA84A4
	Offset: 0x1548
	Size: 0x54
	Parameters: 2
	Flags: None
*/
function get_player_data(name, defval)
{
	var_91a52156 = "CP";
	if(isdefined(world.playerdata[var_91a52156][name]))
	{
		return world.playerdata[var_91a52156][name];
	}
	return defval;
}

/*
	Name: clear_player_data
	Namespace: savegame
	Checksum: 0x1EB349A7
	Offset: 0x15A8
	Size: 0x4C
	Parameters: 0
	Flags: None
*/
function clear_player_data()
{
	var_91a52156 = "CP";
	if(isdefined(world.playerdata) && isdefined(world.playerdata[var_91a52156]))
	{
		world.playerdata[var_91a52156] = [];
	}
}

/*
	Name: function_7642d0c9
	Namespace: savegame
	Checksum: 0xEEB6D828
	Offset: 0x1600
	Size: 0x2E
	Parameters: 0
	Flags: None
*/
function function_7642d0c9()
{
	return getdvarint(#"hash_30a8d8634a92b501", 1) == 0;
}

/*
	Name: function_7790f03
	Namespace: savegame
	Checksum: 0x10E2E9A6
	Offset: 0x1638
	Size: 0x7C
	Parameters: 1
	Flags: None
*/
function function_7790f03(var_62a2ec8e)
{
	if(!isdefined(var_62a2ec8e))
	{
		var_62a2ec8e = 0;
	}
	if(is_true(level.var_815395f5) || getdvarint(#"hash_3a4333abc7abc233", 0))
	{
		return;
	}
	level thread function_396464b(var_62a2ec8e);
}

/*
	Name: function_396464b
	Namespace: savegame
	Checksum: 0xE90B729C
	Offset: 0x16C0
	Size: 0xD4
	Parameters: 1
	Flags: Private
*/
function private function_396464b(var_62a2ec8e)
{
	if(!isdefined(var_62a2ec8e))
	{
		var_62a2ec8e = 0;
	}
	level notify(#"checkpoint_save");
	level endon(#"checkpoint_save", #"save_restore");
	checkpointcreate();
	waitframe(1);
	waitframe(1);
	if(is_true(level.var_5be43b2d))
	{
		return;
	}
	checkpointcommit();
	if(is_true(var_62a2ec8e))
	{
		show_checkpoint_reached();
	}
}

/*
	Name: checkpoint_trigger
	Namespace: savegame
	Checksum: 0x1F235E30
	Offset: 0x17A0
	Size: 0x3C
	Parameters: 0
	Flags: None
*/
function checkpoint_trigger()
{
	self endon(#"death");
	self waittill(#"trigger");
	checkpoint_save();
}

/*
	Name: checkpoint_save
	Namespace: savegame
	Checksum: 0xF5BE6DB9
	Offset: 0x17E8
	Size: 0x34
	Parameters: 1
	Flags: None
*/
function checkpoint_save(var_62a2ec8e)
{
	if(!isdefined(var_62a2ec8e))
	{
		var_62a2ec8e = 0;
	}
	level thread function_655f1326(var_62a2ec8e);
}

/*
	Name: show_checkpoint_reached
	Namespace: savegame
	Checksum: 0x8CF3AE49
	Offset: 0x1828
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function show_checkpoint_reached()
{
	level thread function_4baf8f0c(1.5);
}

/*
	Name: function_4baf8f0c
	Namespace: savegame
	Checksum: 0xD6F27F07
	Offset: 0x1858
	Size: 0x2C4
	Parameters: 1
	Flags: None
*/
function function_4baf8f0c(delay)
{
	if(function_7642d0c9())
	{
		wait(0.2);
		foreach(player in level.players)
		{
			player player::generate_weapon_data();
			player set_player_data("saved_weapon", player._generated_current_weapon.rootweapon.name);
			player set_player_data("saved_weapon_attachments", util::function_2146bd83(player._generated_current_weapon));
			player set_player_data("saved_weapondata", player._generated_weapons);
			player set_player_data("lives", player.lives);
			player._generated_current_weapon = undefined;
			player._generated_weapons = undefined;
		}
		player = util::gethostplayer();
		if(isdefined(player))
		{
			player set_player_data("savegame_score", player.pers[#"score"]);
			player set_player_data("savegame_kills", player.pers[#"kills"]);
			player set_player_data("savegame_assists", player.pers[#"assists"]);
			player set_player_data("savegame_incaps", player.pers[#"incaps"]);
			player set_player_data("savegame_revives", player.pers[#"revives"]);
		}
		save();
		wait(delay);
		if(isdefined(player))
		{
			player util::function_502198f3();
		}
	}
}

/*
	Name: function_68cfab84
	Namespace: savegame
	Checksum: 0xD4E65810
	Offset: 0x1B28
	Size: 0x152
	Parameters: 0
	Flags: None
*/
function function_68cfab84()
{
	if(is_true(level.missionfailed))
	{
		return 0;
	}
	foreach(player in level.players)
	{
		if(!isalive(player))
		{
			return 0;
		}
		if(player clientfield::get("burn"))
		{
			return 0;
		}
		if(player.sessionstate == "spectator")
		{
			firstspawn = (isdefined(self.firstspawn) ? self.firstspawn : 1);
			return firstspawn;
		}
		if(player oob::isoutofbounds())
		{
			return 0;
		}
		if(is_true(player.burning))
		{
			return 0;
		}
	}
	return 1;
}

/*
	Name: function_655f1326
	Namespace: savegame
	Checksum: 0xD34BCB75
	Offset: 0x1C88
	Size: 0x15C
	Parameters: 1
	Flags: Private
*/
function private function_655f1326(var_62a2ec8e)
{
	level notify(#"hash_7608fe484d0bea80");
	level endon(#"hash_7608fe484d0bea80", #"kill_save", #"save_restore");
	wait(0.1);
	while(true)
	{
		if(function_51c242e9())
		{
			wait(0.1);
			checkpointcreate();
			wait(6);
			for(check_count = 0; check_count < 5; check_count++)
			{
				if(function_68cfab84())
				{
					break;
				}
				wait(1);
			}
			if(check_count == 5)
			{
				continue;
			}
			if(is_true(level.var_5be43b2d))
			{
				continue;
			}
			checkpointcommit();
			show_checkpoint_reached();
			if(var_62a2ec8e)
			{
				level thread show_checkpoint_reached();
			}
			return;
		}
		wait(1);
	}
}

/*
	Name: function_51c242e9
	Namespace: savegame
	Checksum: 0x11FAF76D
	Offset: 0x1DF0
	Size: 0x272
	Parameters: 2
	Flags: None
*/
function function_51c242e9(var_a8976c31, stealth_check)
{
	if(!isdefined(var_a8976c31))
	{
		var_a8976c31 = 0;
	}
	if(!isdefined(stealth_check))
	{
		stealth_check = 1;
	}
	if(!var_a8976c31)
	{
		if(is_true(level.var_815395f5))
		{
			return false;
		}
		if(getdvarint(#"hash_3a4333abc7abc233", 0))
		{
			return false;
		}
	}
	if(is_true(level.missionfailed))
	{
		return false;
	}
	var_e46695c4 = 0;
	foreach(player in level.players)
	{
		if(isdefined(player) && player function_172f4daa(var_a8976c31))
		{
			var_e46695c4++;
		}
	}
	var_a9a7b3a2 = level.players.size;
	if(var_e46695c4 < var_a9a7b3a2)
	{
		return false;
	}
	if(!function_2ceb3570())
	{
		return false;
	}
	if(!function_6dadecb9())
	{
		return false;
	}
	if(isdefined(level.var_a1cfeb5a) && !var_a8976c31)
	{
		foreach(func in level.var_a1cfeb5a)
		{
			if(!level [[func]]())
			{
				return false;
			}
		}
	}
	if(stealth_check && isdefined(level.var_8bca2033))
	{
		if(![[level.var_8bca2033]]())
		{
			return false;
		}
	}
	return true;
}

/*
	Name: function_172f4daa
	Namespace: savegame
	Checksum: 0x600BCB7B
	Offset: 0x2070
	Size: 0x2A2
	Parameters: 1
	Flags: Private
*/
function private function_172f4daa(var_a8976c31)
{
	if(!isdefined(var_a8976c31))
	{
		var_a8976c31 = 0;
	}
	healthfraction = 1;
	if(isdefined(self.health) && isdefined(self.maxhealth) && self.maxhealth > 0)
	{
		healthfraction = self.health / self.maxhealth;
	}
	if(healthfraction < 0.7 && !var_a8976c31)
	{
		return 0;
	}
	if(isdefined(self.lastdamagetime) && self.lastdamagetime > (gettime() - 1500))
	{
		return 0;
	}
	if(self clientfield::get("burn"))
	{
		return 0;
	}
	if(self ismeleeing())
	{
		return 0;
	}
	if(self isthrowinggrenade())
	{
		return 0;
	}
	if(self isfiring())
	{
		return 0;
	}
	if(self util::isflashed())
	{
		return 0;
	}
	if(self.sessionstate == "spectator")
	{
		firstspawn = (isdefined(self.firstspawn) ? self.firstspawn : 1);
		return firstspawn;
	}
	if(self oob::isoutofbounds())
	{
		return 0;
	}
	if(is_true(self.burning))
	{
		return 0;
	}
	if(self flag::get(#"mobile_armory_in_use"))
	{
		return 0;
	}
	if(var_a8976c31)
	{
		return 1;
	}
	foreach(weapon in self getweaponslist())
	{
		fraction = self getfractionmaxammo(weapon);
		if(fraction > 0.1)
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: function_6dadecb9
	Namespace: savegame
	Checksum: 0xAEB68E2E
	Offset: 0x2320
	Size: 0x170
	Parameters: 0
	Flags: Private
*/
function private function_6dadecb9()
{
	if(!getdvarint(#"hash_3c20efa8bd1aa30", 1))
	{
		return true;
	}
	ais = getaiteamarray(#"axis");
	foreach(ai in ais)
	{
		if(!isdefined(ai))
		{
			continue;
		}
		if(!isalive(ai))
		{
			continue;
		}
		if(isactor(ai) && ai isinscriptedstate())
		{
			continue;
		}
		if(is_true(ai.ignoreall))
		{
			continue;
		}
		playerproximity = ai function_838fa3a9();
		if(playerproximity <= 80)
		{
			return false;
		}
	}
	return true;
}

/*
	Name: function_6f9ec10b
	Namespace: savegame
	Checksum: 0xFEFB68CD
	Offset: 0x2498
	Size: 0x130
	Parameters: 0
	Flags: Private
*/
function private function_6f9ec10b()
{
	if(!isdefined(self.enemy))
	{
		return true;
	}
	if(!isplayer(self.enemy))
	{
		return true;
	}
	if(isdefined(self.melee) && isdefined(self.melee.target) && isplayer(self.melee.target))
	{
		return false;
	}
	playerproximity = self function_838fa3a9();
	if(playerproximity < 500)
	{
		return false;
	}
	if(playerproximity > 1000 || playerproximity < 0)
	{
		return true;
	}
	if(isactor(self) && self cansee(self.enemy) && self canshootenemy())
	{
		return false;
	}
	return true;
}

/*
	Name: function_838fa3a9
	Namespace: savegame
	Checksum: 0x4CE9C974
	Offset: 0x25D0
	Size: 0xD6
	Parameters: 0
	Flags: None
*/
function function_838fa3a9()
{
	mindist = -1;
	foreach(player in function_a1ef346b())
	{
		dist = distance(player.origin, self.origin);
		if(dist < mindist || mindist < 0)
		{
			mindist = dist;
		}
	}
	return mindist;
}

/*
	Name: function_2ceb3570
	Namespace: savegame
	Checksum: 0xAD127ED
	Offset: 0x26B0
	Size: 0x18C
	Parameters: 0
	Flags: Private
*/
function private function_2ceb3570()
{
	var_e1a8a025 = 0;
	foreach(grenade in getentarray("grenade", "classname"))
	{
		foreach(player in function_a1ef346b())
		{
			distsq = distancesquared(grenade.origin, player.origin);
			if(distsq < 90000)
			{
				var_e1a8a025++;
			}
		}
	}
	if(var_e1a8a025 > 0 && var_e1a8a025 >= function_a1ef346b().size)
	{
		return false;
	}
	return true;
}

