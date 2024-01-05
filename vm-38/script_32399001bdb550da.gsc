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

#namespace save;

/*
	Name: function_58f6a662
	Namespace: save
	Checksum: 0x705F5CAB
	Offset: 0x1F0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_58f6a662()
{
	level notify(-1305084861);
}

#namespace savegame;

/*
	Name: __init__system__
	Namespace: savegame
	Checksum: 0x3F228CFE
	Offset: 0x210
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
	Checksum: 0xA91D8E39
	Offset: 0x258
	Size: 0x334
	Parameters: 0
	Flags: Linked, Private
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
	Checksum: 0x3295F763
	Offset: 0x598
	Size: 0x27C
	Parameters: 2
	Flags: Linked
*/
function save(var_116ab377, var_296c7056)
{
	if(!function_7642d0c9())
	{
		return;
	}
	if(!isdefined(var_116ab377))
	{
		var_116ab377 = get_mission_name();
	}
	var_2466c81f = getmaporder() < 0;
	if(var_2466c81f)
	{
		return;
	}
	var_65792f8b = function_2717b55f(var_116ab377);
	if(!isdefined(var_296c7056) && isdefined(var_65792f8b) && is_true(var_65792f8b.var_beb20e53))
	{
		transient = get_mission_data(#"transient");
		if(is_true(transient.var_16e4161b))
		{
			var_296c7056 = skipto::function_547ca7d2(var_116ab377);
		}
	}
	savegame_create(var_116ab377, var_296c7056);
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
	Checksum: 0xD75D31D6
	Offset: 0x820
	Size: 0x52
	Parameters: 1
	Flags: Linked
*/
function function_ac15668a(var_1fdcd030)
{
	var_8670e6a3 = get_mission_data(#"persistent", var_1fdcd030);
	return is_true(var_8670e6a3.complete);
}

/*
	Name: function_1b212e67
	Namespace: savegame
	Checksum: 0x6DCFC77C
	Offset: 0x880
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
	Checksum: 0x91B2103F
	Offset: 0x8E0
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_fa31c391()
{
	level.var_593cdbb5 = 1;
	clear_player_data();
	function_a620739b();
}

/*
	Name: set_mission_name
	Namespace: savegame
	Checksum: 0x7EDCC5DE
	Offset: 0x920
	Size: 0x9C
	Parameters: 1
	Flags: Linked
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
	Checksum: 0x42DB15C3
	Offset: 0x9C8
	Size: 0x36
	Parameters: 0
	Flags: Linked
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
	Checksum: 0x8196F2AC
	Offset: 0xA08
	Size: 0xDA
	Parameters: 2
	Flags: Linked
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
	Checksum: 0xB4F05CDC
	Offset: 0xAF0
	Size: 0x126
	Parameters: 2
	Flags: Linked
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
	Checksum: 0xAFE57E47
	Offset: 0xC20
	Size: 0x20
	Parameters: 0
	Flags: Linked
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
	Checksum: 0x3A1BED97
	Offset: 0xC48
	Size: 0xEC
	Parameters: 0
	Flags: Linked
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
	Checksum: 0xA56421E6
	Offset: 0xD40
	Size: 0xD6
	Parameters: 0
	Flags: Linked
*/
function function_9797184c()
{
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
	Checksum: 0xDF6E64C4
	Offset: 0xE20
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
	Checksum: 0x8F5515D1
	Offset: 0x1308
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
	Checksum: 0x9DA997BC
	Offset: 0x15B0
	Size: 0x7E
	Parameters: 2
	Flags: Linked
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
	Checksum: 0xE7E785D
	Offset: 0x1638
	Size: 0x54
	Parameters: 2
	Flags: Linked
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
	Checksum: 0x790D75C0
	Offset: 0x1698
	Size: 0x4C
	Parameters: 0
	Flags: Linked
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
	Checksum: 0x941282D9
	Offset: 0x16F0
	Size: 0x6E
	Parameters: 0
	Flags: Linked
*/
function function_7642d0c9()
{
	return getdvarint(#"hash_30a8d8634a92b501", 1) == 0 && !is_true(level.gameended) && !is_true(level.var_593cdbb5);
}

/*
	Name: function_7790f03
	Namespace: savegame
	Checksum: 0x79518D61
	Offset: 0x1768
	Size: 0x7C
	Parameters: 1
	Flags: Linked
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
	Checksum: 0xCDEECBC1
	Offset: 0x17F0
	Size: 0x124
	Parameters: 1
	Flags: Linked, Private
*/
function private function_396464b(var_62a2ec8e)
{
	if(!isdefined(var_62a2ec8e))
	{
		var_62a2ec8e = 0;
	}
	level notify(#"checkpoint_save");
	level endon(#"checkpoint_save", #"save_restore");
	level notify(#"kill_save");
	player = getplayers()[0];
	if(isplayer(player) && player util::function_a1d6293())
	{
		return;
	}
	checkpointcreate();
	waitframe(1);
	waitframe(1);
	if(is_true(level.var_5be43b2d))
	{
		return;
	}
	checkpointcommit();
	function_40f4c631(var_62a2ec8e);
}

/*
	Name: checkpoint_trigger
	Namespace: savegame
	Checksum: 0x8806F3F3
	Offset: 0x1920
	Size: 0x3C
	Parameters: 0
	Flags: Linked
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
	Checksum: 0x6092CA96
	Offset: 0x1968
	Size: 0x44
	Parameters: 3
	Flags: Linked
*/
function checkpoint_save(var_62a2ec8e, var_a8976c31, stealth_check)
{
	if(!isdefined(var_62a2ec8e))
	{
		var_62a2ec8e = 0;
	}
	level thread function_655f1326(var_62a2ec8e, var_a8976c31, stealth_check);
}

/*
	Name: function_304c08c5
	Namespace: savegame
	Checksum: 0x96F1FE29
	Offset: 0x19B8
	Size: 0xB4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_304c08c5()
{
	if(function_7642d0c9())
	{
		var_56528c9b = (isdefined(skipto::get_current_skiptos()[0]) ? skipto::get_current_skiptos()[0] : "");
		var_1461c013 = (isdefined(get_player_data("last_saved_skipto")) ? get_player_data("last_saved_skipto") : "");
		return var_56528c9b != var_1461c013;
	}
	return 0;
}

/*
	Name: function_40f4c631
	Namespace: savegame
	Checksum: 0x467AC349
	Offset: 0x1A78
	Size: 0x74
	Parameters: 1
	Flags: Linked, Private
*/
function private function_40f4c631(var_62a2ec8e)
{
	var_b026e720 = function_304c08c5();
	level thread function_680b78aa(var_b026e720);
	if(!var_b026e720 && is_true(var_62a2ec8e))
	{
		util::function_502198f3();
	}
}

/*
	Name: function_680b78aa
	Namespace: savegame
	Checksum: 0xFA5127BD
	Offset: 0x1AF8
	Size: 0x34C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_680b78aa(var_62a2ec8e, delay)
{
	if(!isdefined(var_62a2ec8e))
	{
		var_62a2ec8e = 1;
	}
	if(!isdefined(delay))
	{
		delay = 1.5;
	}
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
		var_56528c9b = skipto::get_current_skiptos()[0];
		set_player_data("last_saved_skipto", var_56528c9b);
		if(isdefined(player) && is_true(var_62a2ec8e))
		{
			player util::function_b9dfcfb7();
		}
	}
}

/*
	Name: function_68cfab84
	Namespace: savegame
	Checksum: 0x40E7C380
	Offset: 0x1E50
	Size: 0x16A
	Parameters: 0
	Flags: Linked
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
		if(player util::function_a1d6293())
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
	Checksum: 0xB279E4D3
	Offset: 0x1FC8
	Size: 0x15C
	Parameters: 3
	Flags: Linked, Private
*/
function private function_655f1326(var_62a2ec8e, var_a8976c31, stealth_check)
{
	level notify(#"hash_7608fe484d0bea80");
	level endon(#"hash_7608fe484d0bea80", #"kill_save", #"save_restore");
	wait(0.1);
	while(true)
	{
		if(function_51c242e9(var_a8976c31, stealth_check))
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
			function_40f4c631(var_62a2ec8e);
			return;
		}
		wait(1);
	}
}

/*
	Name: function_51c242e9
	Namespace: savegame
	Checksum: 0x84591D86
	Offset: 0x2130
	Size: 0x272
	Parameters: 2
	Flags: Linked
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
	Checksum: 0x47DFA9B5
	Offset: 0x23B0
	Size: 0x2BA
	Parameters: 1
	Flags: Linked, Private
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
	if(self util::function_a1d6293())
	{
		return 0;
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
	Checksum: 0x85789F06
	Offset: 0x2678
	Size: 0x170
	Parameters: 0
	Flags: Linked, Private
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
	Checksum: 0x85079684
	Offset: 0x27F0
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
	Checksum: 0xE8D88C35
	Offset: 0x2928
	Size: 0xD6
	Parameters: 0
	Flags: Linked
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
	Checksum: 0x86F59175
	Offset: 0x2A08
	Size: 0x18C
	Parameters: 0
	Flags: Linked, Private
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

