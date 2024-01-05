#using scripts\zm_common\zm_trial.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_player.gsc;
#using scripts\zm_common\zm_devgui.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\rat_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace rat;

/*
	Name: function_3f3f1ff
	Namespace: rat
	Checksum: 0xE2446BFA
	Offset: 0xB8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_3f3f1ff()
{
	level notify(-1712984425);
}

/*
	Name: __init__system__
	Namespace: rat
	Checksum: 0xD5463D36
	Offset: 0xD8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	/#
		system::register(#"rat", &function_70a657d8, undefined, undefined, undefined);
	#/
}

/*
	Name: function_70a657d8
	Namespace: rat
	Checksum: 0xD2A5965E
	Offset: 0x120
	Size: 0x544
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	/#
		init();
		level.rat.common.gethostplayer = &util::gethostplayer;
		addratscriptcmd("", &derriesezombiespawnnavmeshtest);
		addratscriptcmd("", &function_b8181e0d);
		addratscriptcmd("", &function_38d6a592);
		addratscriptcmd("", &function_ff8061ca);
		addratscriptcmd("", &function_1428d95e);
		addratscriptcmd("", &function_63a39134);
		addratscriptcmd("", &function_26a15f4d);
		addratscriptcmd("", &function_3d37c034);
		addratscriptcmd("", &function_7a11ca68);
		addratscriptcmd("", &function_782c6850);
		addratscriptcmd("", &function_125e2d8d);
		addratscriptcmd("", &function_e7dffcf9);
		addratscriptcmd("", &function_c3aa7d01);
		addratscriptcmd("", &function_684f2efb);
		addratscriptcmd("", &function_123195b9);
		addratscriptcmd("", &function_c79c0501);
		addratscriptcmd("", &function_3bbff2c5);
		addratscriptcmd("", &function_ea4b3f00);
		addratscriptcmd("", &function_8f340c78);
		addratscriptcmd("", &function_1bd3da0f);
		addratscriptcmd("", &function_6ea9a113);
		addratscriptcmd("", &function_e2143adf);
		addratscriptcmd("", &function_ff8f5737);
		addratscriptcmd("", &function_5b9ddfdb);
		addratscriptcmd("", &function_d49caa1a);
		addratscriptcmd("", &function_d52c7fc3);
		addratscriptcmd("", &function_d87f9fe1);
		addratscriptcmd("", &function_94ac25d9);
		addratscriptcmd("", &function_a6f7ea4a);
		addratscriptcmd("", &function_303319e9);
		addratscriptcmd("", &function_d71d4f64);
		addratscriptcmd("", &function_e1bdc812);
	#/
}

/*
	Name: function_e1bdc812
	Namespace: rat
	Checksum: 0x27F11865
	Offset: 0x670
	Size: 0x22
	Parameters: 1
	Flags: None
*/
function function_e1bdc812(params)
{
	/#
		return zm_trial::function_ba9853db();
	#/
}

/*
	Name: function_303319e9
	Namespace: rat
	Checksum: 0x298ABC3A
	Offset: 0x6A0
	Size: 0x278
	Parameters: 1
	Flags: None
*/
function function_303319e9(params)
{
	/#
		zombies = getaiarchetypearray("", level.zombie_team);
		player = getplayer(params);
		forward = anglestoforward(player.angles);
		distance = 31;
		if(isdefined(params.distance))
		{
			distance = float(params.distance);
		}
		spawn = player.origin + (forward * distance);
		foreach(zombie in zombies)
		{
			zombie forceteleport(spawn, player.angles);
			if(isdefined(params.is_dummy) && params.is_dummy == 1)
			{
				if(!isdefined(zombie.ignore_player))
				{
					zombie.ignore_player = [];
				}
				else if(!isarray(zombie.ignore_player))
				{
					zombie.ignore_player = array(zombie.ignore_player);
				}
				zombie.ignore_player[zombie.ignore_player.size] = player;
				zombie.var_67faa700 = 1;
				zombie.ignoremelee = 1;
				zombie.ignore_round_spawn_failsafe = 1;
				zombie pathmode("");
				zombie orientmode("", player.angles[1]);
			}
		}
	#/
}

/*
	Name: function_d71d4f64
	Namespace: rat
	Checksum: 0x20C88A36
	Offset: 0x920
	Size: 0xF0
	Parameters: 1
	Flags: None
*/
function function_d71d4f64(params)
{
	/#
		zombies = getaiarchetypearray("", level.zombie_team);
		foreach(zombie in zombies)
		{
			function_55e20e75(params._id, zombie.origin);
			function_55e20e75(params._id, zombie.angles);
		}
	#/
}

/*
	Name: function_a6f7ea4a
	Namespace: rat
	Checksum: 0x64AC3557
	Offset: 0xA18
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function function_a6f7ea4a(params)
{
	/#
		zombie_utility::set_zombie_var(#"rebuild_barrier_cap_per_round", 2147483647);
	#/
}

/*
	Name: function_94ac25d9
	Namespace: rat
	Checksum: 0x69E61430
	Offset: 0xA60
	Size: 0xF8
	Parameters: 1
	Flags: None
*/
function function_94ac25d9(params)
{
	/#
		windows = level.exterior_goals;
		if(isdefined(windows))
		{
			foreach(window in windows)
			{
				origin = window.origin;
				function_55e20e75(params._id, origin);
				angles = window.angles;
				function_55e20e75(params._id, angles);
			}
		}
	#/
}

/*
	Name: function_8f340c78
	Namespace: rat
	Checksum: 0xBCE32850
	Offset: 0xB60
	Size: 0x13C
	Parameters: 1
	Flags: None
*/
function function_8f340c78(params)
{
	/#
		chests = level.chests;
		if(isdefined(chests))
		{
			foreach(chest in chests)
			{
				if(chest.hidden == 0)
				{
					origin = chest.origin;
					function_55e20e75(params._id, origin);
					angles = (chest.angles[0], chest.angles[1] - 90, chest.angles[2]);
					function_55e20e75(params._id, angles);
					break;
				}
			}
		}
	#/
}

/*
	Name: function_d52c7fc3
	Namespace: rat
	Checksum: 0x9B7E545D
	Offset: 0xCA8
	Size: 0x154
	Parameters: 1
	Flags: None
*/
function function_d52c7fc3(params)
{
	/#
		for(i = 0; i < level._unitriggers.trigger_stubs.size; i++)
		{
			triggerstub = level._unitriggers.trigger_stubs[i];
			if(isdefined(triggerstub.script_noteworthy))
			{
				if(triggerstub.script_noteworthy == "" || triggerstub.script_noteworthy == "")
				{
					origin = (triggerstub.origin[0], triggerstub.origin[1], triggerstub.origin[2]);
					function_55e20e75(params._id, origin);
					angles = (triggerstub.angles[0], triggerstub.angles[1], triggerstub.angles[2]);
					function_55e20e75(params._id, angles);
				}
			}
		}
	#/
}

/*
	Name: function_d87f9fe1
	Namespace: rat
	Checksum: 0xA1F2FACF
	Offset: 0xE08
	Size: 0x38
	Parameters: 1
	Flags: None
*/
function function_d87f9fe1(params)
{
	/#
		host = util::gethostplayer();
		return isdefined(host.var_4e90ce0c);
	#/
}

/*
	Name: function_6ea9a113
	Namespace: rat
	Checksum: 0x2DD4267B
	Offset: 0xE50
	Size: 0x1DC
	Parameters: 1
	Flags: None
*/
function function_6ea9a113(params)
{
	/#
		foreach(items in level.item_spawns)
		{
			foreach(item in items)
			{
				if(isdefined(item))
				{
					offset = (item.origin[0], item.origin[1], item.origin[2]);
					function_55e20e75(params._id, offset);
					forward = item.origin - offset;
					angle = vectornormalize(forward);
					angles = (item.angles[0], item.angles[1], item.angles[2]);
					function_55e20e75(params._id, angles);
				}
			}
		}
	#/
}

/*
	Name: function_ff8f5737
	Namespace: rat
	Checksum: 0x84FF8F05
	Offset: 0x1038
	Size: 0x144
	Parameters: 1
	Flags: None
*/
function function_ff8f5737(params)
{
	/#
		for(i = 0; i < level._unitriggers.trigger_stubs.size; i++)
		{
			triggerstub = level._unitriggers.trigger_stubs[i];
			if(isdefined(triggerstub.target))
			{
				if(triggerstub.target == "")
				{
					origin = (triggerstub.origin[0], triggerstub.origin[1], triggerstub.origin[2]);
					function_55e20e75(params._id, origin);
					angles = (triggerstub.angles[0], triggerstub.angles[1] + 180, triggerstub.angles[2]);
					function_55e20e75(params._id, angles);
				}
			}
		}
	#/
}

/*
	Name: function_5b9ddfdb
	Namespace: rat
	Checksum: 0xB94C928
	Offset: 0x1188
	Size: 0x144
	Parameters: 1
	Flags: None
*/
function function_5b9ddfdb(params)
{
	/#
		for(i = 0; i < level._unitriggers.trigger_stubs.size; i++)
		{
			triggerstub = level._unitriggers.trigger_stubs[i];
			if(isdefined(triggerstub.target))
			{
				if(triggerstub.target == "")
				{
					origin = (triggerstub.origin[0], triggerstub.origin[1], triggerstub.origin[2]);
					function_55e20e75(params._id, origin);
					angles = (triggerstub.angles[0], triggerstub.angles[1] + 180, triggerstub.angles[2]);
					function_55e20e75(params._id, angles);
				}
			}
		}
	#/
}

/*
	Name: function_e2143adf
	Namespace: rat
	Checksum: 0x790CD4DD
	Offset: 0x12D8
	Size: 0x30
	Parameters: 1
	Flags: None
*/
function function_e2143adf(params)
{
	/#
		if(isdefined(level.item_inventory))
		{
			return level.item_inventory.size;
		}
		return 0;
	#/
}

/*
	Name: function_1bd3da0f
	Namespace: rat
	Checksum: 0x931BB79E
	Offset: 0x1318
	Size: 0x160
	Parameters: 1
	Flags: None
*/
function function_1bd3da0f(params)
{
	/#
		chunks = level.s_pap_quest.a_s_locations;
		if(isdefined(chunks))
		{
			foreach(chunk in chunks)
			{
				origin = (chunk.origin[0], chunk.origin[1] - 40, chunk.origin[2] - 40);
				function_55e20e75(params._id, origin);
				angles = (chunk.angles[0], chunk.angles[1] + 180, chunk.angles[2]);
				function_55e20e75(params._id, angles);
			}
		}
	#/
}

/*
	Name: function_d49caa1a
	Namespace: rat
	Checksum: 0xF97AA48E
	Offset: 0x1480
	Size: 0x22
	Parameters: 1
	Flags: None
*/
function function_d49caa1a(params)
{
	/#
		return level.s_pap_quest.var_be6e6f65;
	#/
}

/*
	Name: function_ea4b3f00
	Namespace: rat
	Checksum: 0xEE4FB7B2
	Offset: 0x14B0
	Size: 0x122
	Parameters: 1
	Flags: None
*/
function function_ea4b3f00(params)
{
	/#
		host = util::gethostplayer();
		skip = 0;
		if(isdefined(params.var_f870f386))
		{
			if(params.var_f870f386 == "")
			{
				skip = 1;
			}
		}
		players = getplayers();
		foreach(player in players)
		{
			if(skip)
			{
				if(player != host)
				{
					player enableinvulnerability();
				}
				continue;
			}
			skip = 0;
		}
	#/
}

/*
	Name: function_c79c0501
	Namespace: rat
	Checksum: 0x9E772FE1
	Offset: 0x15E0
	Size: 0x74
	Parameters: 1
	Flags: None
*/
function function_c79c0501(params)
{
	/#
		if(isdefined(params.round))
		{
			setdvar(#"scr_zombie_round", int(params.round));
			adddebugcommand("");
		}
	#/
}

/*
	Name: function_3bbff2c5
	Namespace: rat
	Checksum: 0x8E2C3ACA
	Offset: 0x1660
	Size: 0x7C
	Parameters: 1
	Flags: None
*/
function function_3bbff2c5(params)
{
	/#
		num = 3;
		if(isdefined(params.num))
		{
			num = int(params.num);
		}
		if(num > 0)
		{
			adddebugcommand("" + num);
		}
	#/
}

/*
	Name: function_123195b9
	Namespace: rat
	Checksum: 0x176D781
	Offset: 0x16E8
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function function_123195b9(params)
{
	/#
	#/
}

/*
	Name: function_684f2efb
	Namespace: rat
	Checksum: 0x2759BEDA
	Offset: 0x1700
	Size: 0x1F8
	Parameters: 1
	Flags: None
*/
function function_684f2efb(params)
{
	/#
		trigs = getentarray("", "");
		foreach(ent in trigs)
		{
			ent_parts = getentarray(ent.target, "");
			foreach(e in ent_parts)
			{
				if(isdefined(e.script_noteworthy) && e.script_noteworthy == "")
				{
					master_switch = e;
					function_55e20e75(params._id, master_switch.origin);
					angles = (master_switch.angles[0], master_switch.angles[1], master_switch.angles[2]);
					function_55e20e75(params._id, angles);
					break;
				}
			}
		}
	#/
}

/*
	Name: function_c3aa7d01
	Namespace: rat
	Checksum: 0xBFF25BA
	Offset: 0x1900
	Size: 0x50
	Parameters: 1
	Flags: None
*/
function function_c3aa7d01(params)
{
	/#
		player = util::gethostplayer();
		if(isdefined(player))
		{
			if(isdefined(player.perk_purchased))
			{
				return player.perk_purchased;
			}
		}
	#/
}

/*
	Name: function_125e2d8d
	Namespace: rat
	Checksum: 0x919D9BFE
	Offset: 0x1958
	Size: 0x90
	Parameters: 1
	Flags: None
*/
function function_125e2d8d(params)
{
	/#
		zombie_doors = getentarray("", "");
		count = 0;
		if(isdefined(zombie_doors))
		{
			for(i = 0; i < zombie_doors.size; i++)
			{
				if(isdefined(zombie_doors[i].purchaser))
				{
					count++;
				}
			}
		}
		return count;
	#/
}

/*
	Name: function_e7dffcf9
	Namespace: rat
	Checksum: 0xBA9CC823
	Offset: 0x19F8
	Size: 0x134
	Parameters: 1
	Flags: None
*/
function function_e7dffcf9(params)
{
	/#
		zombie_doors = getentarray("", "");
		if(isdefined(zombie_doors))
		{
			for(i = 0; i < zombie_doors.size; i++)
			{
				door = zombie_doors[i];
				if(isdefined(door.script_noteworthy))
				{
					if(door.script_noteworthy == "" && door._door_open == 0)
					{
						function_55e20e75(params._id, door.origin);
						angles = (door.angles[0], door.angles[1] + 90, door.angles[2]);
						function_55e20e75(params._id, angles);
					}
				}
			}
		}
	#/
}

/*
	Name: function_7a11ca68
	Namespace: rat
	Checksum: 0x5C15B105
	Offset: 0x1B38
	Size: 0x134
	Parameters: 1
	Flags: None
*/
function function_7a11ca68(params)
{
	/#
		for(i = 0; i < level._unitriggers.trigger_stubs.size; i++)
		{
			triggerstub = level._unitriggers.trigger_stubs[i];
			if(triggerstub.cursor_hint == "")
			{
				origin = triggerstub zm_unitrigger::unitrigger_origin();
				origin = (origin[0], origin[1], origin[2] - 40);
				function_55e20e75(params._id, origin);
				angles = triggerstub.angles;
				angles = (angles[0], angles[1] - 90, angles[2]);
				function_55e20e75(params._id, angles);
			}
		}
	#/
}

/*
	Name: function_782c6850
	Namespace: rat
	Checksum: 0x314311B4
	Offset: 0x1C78
	Size: 0x124
	Parameters: 1
	Flags: None
*/
function function_782c6850(params)
{
	/#
		for(i = 0; i < level._unitriggers.trigger_stubs.size; i++)
		{
			triggerstub = level._unitriggers.trigger_stubs[i];
			if(isdefined(triggerstub.hint_string) && triggerstub.hint_string == "")
			{
				origin = triggerstub zm_unitrigger::unitrigger_origin();
				function_55e20e75(params._id, origin);
				angles = triggerstub.angles;
				angles = (angles[0], angles[1] + 180, angles[2]);
				function_55e20e75(params._id, angles);
			}
		}
	#/
}

/*
	Name: function_3d37c034
	Namespace: rat
	Checksum: 0x3C51E049
	Offset: 0x1DA8
	Size: 0xE6
	Parameters: 1
	Flags: None
*/
function function_3d37c034(params)
{
	/#
		a_e_players = getplayers();
		foreach(e_player in a_e_players)
		{
			if(isdefined(e_player.intermission) || e_player.sessionstate == "" || e_player.sessionstate == "")
			{
				continue;
			}
			return true;
		}
		return false;
	#/
}

/*
	Name: function_38d6a592
	Namespace: rat
	Checksum: 0x51D6F08B
	Offset: 0x1E98
	Size: 0x34
	Parameters: 1
	Flags: None
*/
function function_38d6a592(params)
{
	/#
		setdvar(#"zombie_cheat", 2);
	#/
}

/*
	Name: function_26a15f4d
	Namespace: rat
	Checksum: 0x53B21199
	Offset: 0x1ED8
	Size: 0x34
	Parameters: 1
	Flags: None
*/
function function_26a15f4d(params)
{
	/#
		setdvar(#"zombie_cheat", 0);
	#/
}

/*
	Name: function_1428d95e
	Namespace: rat
	Checksum: 0x8356C43F
	Offset: 0x1F18
	Size: 0xEC
	Parameters: 1
	Flags: None
*/
function function_1428d95e(params)
{
	/#
		player = util::gethostplayer();
		forward = anglestoforward(player.angles);
		spawn = player.origin + (forward * 10);
		zombie = zm_devgui::devgui_zombie_spawn();
		if(isdefined(zombie))
		{
			zombie forceteleport(spawn, player.angles + vectorscale((0, 1, 0), 180));
			zombie pathmode("");
		}
	#/
}

/*
	Name: function_63a39134
	Namespace: rat
	Checksum: 0xF910CD2E
	Offset: 0x2010
	Size: 0x22
	Parameters: 1
	Flags: None
*/
function function_63a39134(params)
{
	/#
		return zombie_utility::get_current_zombie_count();
	#/
}

/*
	Name: function_b8181e0d
	Namespace: rat
	Checksum: 0xCB3D04E3
	Offset: 0x2040
	Size: 0x36
	Parameters: 1
	Flags: None
*/
function function_b8181e0d(params)
{
	/#
		player = util::gethostplayer();
		return player.score;
	#/
}

/*
	Name: function_ff8061ca
	Namespace: rat
	Checksum: 0xB9B180FA
	Offset: 0x2080
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function function_ff8061ca(params)
{
	/#
		if(isdefined(level.power_local_doors_globally))
		{
			return true;
		}
		return false;
	#/
}

/*
	Name: derriesezombiespawnnavmeshtest
	Namespace: rat
	Checksum: 0x7B77E8ED
	Offset: 0x20B8
	Size: 0x474
	Parameters: 2
	Flags: None
*/
function derriesezombiespawnnavmeshtest(params, inrat)
{
	/#
		if(!isdefined(inrat))
		{
			inrat = 1;
		}
		if(inrat)
		{
			wait(10);
		}
		enemy = zm_devgui::devgui_zombie_spawn();
		enemy.is_rat_test = 1;
		failed_spawn_origin = [];
		failed_node_origin = [];
		failed_attack_spot_spawn_origin = [];
		failed_attack_spot = [];
		size = 0;
		failed_attack_spot_size = 0;
		wait(0.2);
		foreach(zone in level.zones)
		{
			foreach(loc in zone.a_loc_types[#"zombie_location"])
			{
				angles = (0, 0, 0);
				enemy forceteleport(loc.origin, angles);
				wait(0.2);
				node = undefined;
				for(j = 0; j < level.exterior_goals.size; j++)
				{
					if(isdefined(level.exterior_goals[j].script_string) && level.exterior_goals[j].script_string == loc.script_string)
					{
						node = level.exterior_goals[j];
					}
				}
				if(isdefined(node))
				{
					ispath = enemy setgoal(node.origin);
					if(!ispath)
					{
						failed_spawn_origin[size] = loc.origin;
						failed_node_origin[size] = node.origin;
						size++;
					}
					wait(0.2);
					for(j = 0; j < node.attack_spots.size; j++)
					{
						isattackpath = enemy setgoal(node.attack_spots[j]);
						if(!isattackpath)
						{
							failed_attack_spot_spawn_origin[failed_attack_spot_size] = loc.origin;
							failed_attack_spot[failed_attack_spot_size] = node.attack_spots[j];
							failed_attack_spot_size++;
						}
						wait(0.2);
					}
				}
			}
		}
		if(inrat)
		{
			errmsg = "";
			for(i = 0; i < size; i++)
			{
				errmsg = errmsg + (((("" + failed_spawn_origin[i]) + "") + failed_node_origin[i]) + "");
			}
			for(i = 0; i < failed_attack_spot_size; i++)
			{
				errmsg = errmsg + (((("" + failed_attack_spot_spawn_origin[i]) + "") + failed_attack_spot[i]) + "");
			}
			if(size > 0 || failed_attack_spot_size > 0)
			{
				ratreportcommandresult(params._id, 0, errmsg);
			}
			else
			{
				ratreportcommandresult(params._id, 1);
			}
		}
	#/
}

