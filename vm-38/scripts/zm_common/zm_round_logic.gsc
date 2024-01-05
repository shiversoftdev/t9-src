#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\ai\zombie_death.gsc;
#using scripts\zm_common\trials\zm_trial_special_enemy.gsc;
#using scripts\core_common\ai_shared.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_wallbuy.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_round_spawning.gsc;
#using scripts\zm_common\zm_quick_spawning.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_player.gsc;
#using scripts\zm_common\zm_placeable_mine.gsc;
#using scripts\zm_common\zm_perks.gsc;
#using scripts\zm_common\zm_melee_weapon.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\zm_common\zm_laststand.gsc;
#using scripts\zm_common\zm_hud.gsc;
#using scripts\zm_common\zm_game_module.gsc;
#using scripts\zm_common\zm_ffotd.gsc;
#using scripts\zm_common\zm_equipment.gsc;
#using scripts\zm_common\zm_customgame.gsc;
#using scripts\zm_common\zm_crafting.gsc;
#using scripts\zm_common\zm_cleanup_mgr.gsc;
#using scripts\zm_common\zm_blockers.gsc;
#using scripts\zm_common\zm_bgb.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\zm_common\util.gsc;
#using scripts\zm_common\callbacks.gsc;
#using scripts\zm_common\gametypes\globallogic_scriptmover.gsc;
#using scripts\zm_common\gametypes\globallogic_player.gsc;
#using scripts\zm_common\gametypes\globallogic_spawn.gsc;
#using scripts\zm_common\gametypes\zm_gametype.gsc;
#using script_35598499769dbb3d;
#using scripts\zm_common\bb.gsc;
#using scripts\zm_common\gametypes\globallogic.gsc;
#using scripts\core_common\killcam_shared.gsc;
#using scripts\core_common\potm_shared.gsc;
#using scripts\core_common\globallogic\globallogic_vehicle.gsc;
#using scripts\core_common\visionset_mgr_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\status_effects\status_effects.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\hud_util_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\ai_puppeteer_shared.gsc;
#using scripts\core_common\aat_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace zm_round_logic;

/*
	Name: function_eddc3dba
	Namespace: zm_round_logic
	Checksum: 0xD84479BC
	Offset: 0x468
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_eddc3dba()
{
	level notify(1172443185);
}

/*
	Name: __init__system__
	Namespace: zm_round_logic
	Checksum: 0x8446FC23
	Offset: 0x488
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_round_logic", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_round_logic
	Checksum: 0x9672F7C8
	Offset: 0x4D0
	Size: 0x114
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level flag::init("round_reset");
	level flag::init(#"trial_failed");
	level flag::init("enable_round_timeout");
	level flag::init("pause_round_timeout");
	level flag::init(#"infinite_round_spawning");
	level flag::init(#"hold_round_end");
	if(!isdefined(level.var_54d9d726))
	{
		level.var_54d9d726 = 6;
	}
	zm_trial_special_enemy::function_95c1dd81(#"zombie", &function_f5c01f5);
}

/*
	Name: function_d20309f1
	Namespace: zm_round_logic
	Checksum: 0xA18A32A6
	Offset: 0x5F0
	Size: 0x18A
	Parameters: 0
	Flags: Linked
*/
function function_d20309f1()
{
	level flag::wait_till_any(array("start_zombie_round_logic", "start_encounters_match_logic"));
	while(true)
	{
		var_cdbf6ee2 = get_round_number();
		level.round_number = undefined;
		var_496beb9e = var_cdbf6ee2;
		switch(randomint(5))
		{
			case 0:
			{
				var_3b354f31 = var_cdbf6ee2;
			}
			var_e516a2f5 = var_cdbf6ee2;
			var_d6a70616 = var_cdbf6ee2;
			var_82475d54 = var_cdbf6ee2;
			var_64ed22a0 = var_cdbf6ee2;
		}
		level.round_number = var_cdbf6ee2;
		var_cdbf6ee2 = undefined;
		var_9e0394c8 = undefined;
		var_496beb9e = undefined;
		var_3b354f31 = undefined;
		var_e516a2f5 = undefined;
		var_d6a70616 = undefined;
		var_82475d54 = undefined;
		var_64ed22a0 = undefined;
		waitframe(1);
	}
}

/*
	Name: set_round_number
	Namespace: zm_round_logic
	Checksum: 0xBA8BF955
	Offset: 0x788
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function set_round_number(new_round)
{
	if(new_round > 935)
	{
		new_round = 935;
	}
	world.roundnumber = new_round ^ 115;
}

/*
	Name: get_round_number
	Namespace: zm_round_logic
	Checksum: 0x20B0A5B6
	Offset: 0x7C8
	Size: 0x14
	Parameters: 0
	Flags: Linked
*/
function get_round_number()
{
	return world.roundnumber ^ 115;
}

/*
	Name: function_e6937bfa
	Namespace: zm_round_logic
	Checksum: 0xE12C703
	Offset: 0x7E8
	Size: 0x19A
	Parameters: 0
	Flags: Linked
*/
function function_e6937bfa()
{
	if(!isdefined(level.var_cd8b6cd0))
	{
		level.var_cd8b6cd0 = 4;
	}
	if(level.round_number < level.var_cd8b6cd0)
	{
		return;
	}
	level endon(#"intermission", #"end_of_round", #"restart_round");
	/#
		level endon(#"kill_round");
	#/
	while(level.zombie_total > 3)
	{
		wait(3);
	}
	a_ai_zombies = zombie_utility::get_round_enemy_array();
	while(a_ai_zombies.size > 0 || level.zombie_total > 0)
	{
		if(a_ai_zombies.size <= 3)
		{
			foreach(ai_zombie in a_ai_zombies)
			{
				ai_zombie thread registercentrifuge_zip_doormember();
			}
		}
		wait(1);
		a_ai_zombies = zombie_utility::get_round_enemy_array();
	}
}

/*
	Name: registercentrifuge_zip_doormember
	Namespace: zm_round_logic
	Checksum: 0x6756E3CC
	Offset: 0x990
	Size: 0x17C
	Parameters: 0
	Flags: Linked, Private
*/
function private registercentrifuge_zip_doormember()
{
	if(is_true(self.var_eceaa835))
	{
		return;
	}
	self endon(#"death");
	if(isalive(self))
	{
		if(self.archetype == #"zombie" || self.archetype == #"catalyst")
		{
			self.var_eceaa835 = 1;
			if(self.zombie_move_speed !== "sprint" && self.zombie_move_speed !== "super_sprint")
			{
				while(!isdefined(self.favoriteenemy) || distancesquared(self.favoriteenemy.origin, self.origin) < 65536)
				{
					wait(1);
				}
				self zombie_utility::set_zombie_run_cycle("sprint");
			}
		}
		else if(self.archetype == #"tiger")
		{
			self.var_eceaa835 = 1;
			self ai::set_behavior_attribute("sprint", 1);
		}
	}
}

/*
	Name: function_f5c01f5
	Namespace: zm_round_logic
	Checksum: 0x22809D7E
	Offset: 0xB18
	Size: 0xBC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_f5c01f5()
{
	/#
		assert(isdefined(level.zombie_spawners));
	#/
	spawner = array::random(level.zombie_spawners);
	ai = zombie_utility::spawn_zombie(spawner, spawner.targetname);
	if(isdefined(ai))
	{
		if(level.zombie_respawns > 0)
		{
			level.zombie_respawns--;
			ai.var_a9b2d989 = 1;
		}
		ai thread zombie_utility::round_spawn_failsafe();
		return true;
	}
	return false;
}

/*
	Name: round_spawning
	Namespace: zm_round_logic
	Checksum: 0x53760669
	Offset: 0xBE0
	Size: 0x628
	Parameters: 0
	Flags: Linked
*/
function round_spawning()
{
	if(level.zm_loc_types[#"zombie_location"].size < 1)
	{
		/#
			assertmsg("");
		#/
		return;
	}
	level.zombie_health = (isdefined(level.var_41dd92fd[#"zombie"].health) ? level.var_41dd92fd[#"zombie"].health : 100);
	level endon(#"intermission", #"end_of_round", #"restart_round");
	/#
		level endon(#"kill_round");
	#/
	if(level.intermission)
	{
		return;
	}
	if(zm::cheat_enabled(2))
	{
		return;
	}
	if(zm_round_spawning::function_191ae5ec())
	{
		return;
	}
	players = getplayers();
	for(i = 0; i < players.size; i++)
	{
		players[i].zombification_time = 0;
	}
	if(!(isdefined(level.kill_counter_hud) && level.zombie_total > 0))
	{
		level.zombie_total = get_zombie_count_for_round(level.round_number, level.players.size);
		level.var_38b15968 = level.zombie_total;
		level.var_9427911d = level.zombie_total;
		level.var_412516cb = level.var_2125984b;
		level.zombie_respawns = level.var_2125984b;
		level.zombie_total = level.zombie_total + level.var_2125984b;
		level notify(#"zombie_total_set");
		waittillframeend();
	}
	var_8dd554ee = function_1687c93(level.round_number, level.players.size);
	if(isdefined(level.zombie_total_set_func))
	{
		level thread [[level.zombie_total_set_func]]();
	}
	level thread [[level.var_d8d02d0e]]();
	zm_round_spawning::function_b2dabfc();
	old_spawn = undefined;
	while(true)
	{
		var_404e4288 = zombie_utility::get_current_zombie_count();
		var_3cafeff5 = 0;
		while(var_404e4288 >= level.zombie_ai_limit || (level.zombie_total <= 0 && !level flag::get(#"infinite_round_spawning")))
		{
			wait(0.1);
			zm_quick_spawning::function_367e3573();
			var_404e4288 = zombie_utility::get_current_zombie_count();
			continue;
		}
		while(zombie_utility::get_current_actor_count() >= level.zombie_ai_limit)
		{
			zombie_utility::clear_all_corpses();
			wait(0.1);
		}
		if(flag::exists("world_is_paused"))
		{
			level flag::wait_till_clear("world_is_paused");
		}
		level flag::wait_till("spawn_zombies");
		while(level.zm_loc_types[#"zombie_location"].size <= 0)
		{
			wait(0.1);
		}
		run_custom_ai_spawn_checks();
		if(is_true(level.hostmigrationtimer))
		{
			util::wait_network_frame();
			continue;
		}
		if(isdefined(level.var_78afc69) && [[level.var_78afc69]](var_404e4288, var_8dd554ee))
		{
			util::wait_network_frame();
			var_3cafeff5 = 1;
		}
		else
		{
			if(isdefined(level.fn_custom_round_ai_spawn) && [[level.fn_custom_round_ai_spawn]]())
			{
				util::wait_network_frame();
				var_3cafeff5 = 1;
			}
			else
			{
				if(zm_round_spawning::function_4990741c())
				{
					util::wait_network_frame();
					var_3cafeff5 = 1;
				}
				else if(isdefined(level.zombie_spawners))
				{
					var_6095c0b6 = function_4e8157cd(var_404e4288, var_8dd554ee);
					var_3cafeff5 = var_6095c0b6.var_3cafeff5;
				}
			}
		}
		if(var_3cafeff5)
		{
			wait((isdefined(zombie_utility::function_d2dfacfd(#"zombie_spawn_delay")) ? zombie_utility::function_d2dfacfd(#"zombie_spawn_delay") : zombie_utility::function_d2dfacfd(#"hash_7d5a25e2463f7fc5")));
		}
		else
		{
			util::wait_network_frame();
		}
	}
}

/*
	Name: function_4e8157cd
	Namespace: zm_round_logic
	Checksum: 0xAECB7827
	Offset: 0x1210
	Size: 0x224
	Parameters: 2
	Flags: Linked
*/
function function_4e8157cd(var_404e4288, var_8dd554ee)
{
	var_3cafeff5 = 0;
	if(isdefined(level.fn_custom_zombie_spawner_selection))
	{
		spawner = [[level.fn_custom_zombie_spawner_selection]]();
	}
	else
	{
		if(is_true(level.use_multiple_spawns))
		{
			if(isdefined(level.spawner_int) && is_true(level.zombie_spawn[level.spawner_int].size))
			{
				spawner = array::random(level.zombie_spawn[level.spawner_int]);
			}
			else
			{
				spawner = array::random(level.zombie_spawners);
			}
		}
		else
		{
			spawner = array::random(level.zombie_spawners);
		}
	}
	ai = zombie_utility::spawn_zombie(spawner, spawner.targetname);
	if(isdefined(ai))
	{
		level.zombie_total--;
		if(level.zombie_respawns > 0)
		{
			level.zombie_respawns--;
			ai.var_a9b2d989 = 1;
		}
		ai thread zombie_utility::round_spawn_failsafe();
		var_404e4288++;
		if(ai ai::has_behavior_attribute("can_juke"))
		{
			ai ai::set_behavior_attribute("can_juke", 0);
		}
		if(level.zombie_respawns > 0)
		{
			wait(0.1);
		}
		else
		{
			if(var_404e4288 < var_8dd554ee)
			{
				wait(0.1);
			}
			else
			{
				var_3cafeff5 = 1;
			}
		}
	}
	return {#hash_3cafeff5:var_3cafeff5, #ai_spawned:ai};
}

/*
	Name: get_zombie_count_for_round
	Namespace: zm_round_logic
	Checksum: 0x87561BF3
	Offset: 0x1440
	Size: 0x29A
	Parameters: 2
	Flags: Linked
*/
function get_zombie_count_for_round(n_round, n_player_count)
{
	n_player_count = zm_utility::function_a2541519(n_player_count);
	if(isdefined(level.var_ef1a71b3))
	{
		n_zombie_count = [[level.var_ef1a71b3]](n_round, n_player_count);
		if(n_zombie_count >= 0)
		{
			return function_c112af8e(n_zombie_count);
		}
	}
	max = zombie_utility::function_d2dfacfd(#"zombie_max_ai");
	if(n_player_count == 1)
	{
		var_8ca3a339 = zombie_utility::function_d2dfacfd(#"hash_4127e6c9e8fdd112");
		var_7b4dbf22 = zombie_utility::function_d2dfacfd(#"hash_115c28dc9ed1e60e");
		var_f231b103 = zombie_utility::function_d2dfacfd(#"hash_67b3cbf79292e047");
	}
	else
	{
		var_8ca3a339 = zombie_utility::function_d2dfacfd(#"hash_40be0852fb086eb0");
		var_7b4dbf22 = zombie_utility::function_d2dfacfd(#"hash_3a53015873fb9c74");
		var_f231b103 = 0.5 + (n_player_count / 2);
	}
	if(n_round < var_8ca3a339)
	{
		var_7b4dbf22 = zombie_utility::function_d2dfacfd(#"hash_607bc50072c2a386");
		multiplier = n_round / 5;
		if(multiplier < 1)
		{
			multiplier = 1;
		}
		multiplier = multiplier * (n_round * var_7b4dbf22);
	}
	else
	{
		multiplier = n_round * var_7b4dbf22;
	}
	max = max + (int((var_f231b103 * zombie_utility::function_d2dfacfd(#"zombie_ai_per_player")) * multiplier));
	if(!isdefined(level.max_zombie_func))
	{
		level.max_zombie_func = &zombie_utility::default_max_zombie_func;
	}
	n_zombie_count = [[level.max_zombie_func]](max, n_round);
	return function_c112af8e(n_zombie_count);
}

/*
	Name: function_c112af8e
	Namespace: zm_round_logic
	Checksum: 0xC6BCA3FC
	Offset: 0x16E8
	Size: 0x1AA
	Parameters: 1
	Flags: Linked
*/
function function_c112af8e(n_zombie_count)
{
	if(!isdefined(level.var_78afc69))
	{
		return n_zombie_count;
	}
	if(is_true(level.var_d3e01096))
	{
		n_zombie_count = n_zombie_count * (isdefined(level.var_397ca369) ? level.var_397ca369 : 1);
		n_zombie_count = int(max((n_zombie_count * 0.1) + 0.5, 1));
	}
	else
	{
		if(is_true(level.var_5931f93f))
		{
			n_zombie_count = n_zombie_count * (isdefined(level.var_66682370) ? level.var_66682370 : 1);
			n_zombie_count = int(max((n_zombie_count * 0.2) + 0.5, 1));
		}
		else if(is_true(level.var_d56511a2))
		{
			n_zombie_count = n_zombie_count * (isdefined(level.var_6a9f25ba) ? level.var_6a9f25ba : 1);
			n_zombie_count = int(max(n_zombie_count, 1));
		}
	}
	return n_zombie_count;
}

/*
	Name: function_1687c93
	Namespace: zm_round_logic
	Checksum: 0x2102265C
	Offset: 0x18A0
	Size: 0x94
	Parameters: 2
	Flags: Linked
*/
function function_1687c93(n_round, n_player_count)
{
	n_player_count = zm_utility::function_a2541519(n_player_count);
	if(isdefined(level.var_76859bbd))
	{
		n_zombie_count = [[level.var_76859bbd]](n_round, n_player_count);
		if(n_zombie_count >= 0)
		{
			return n_zombie_count;
		}
	}
	return (n_player_count + 4) + (int(n_round % 2));
}

/*
	Name: run_custom_ai_spawn_checks
	Namespace: zm_round_logic
	Checksum: 0x6157D5F2
	Offset: 0x1940
	Size: 0x50C
	Parameters: 0
	Flags: Linked
*/
function run_custom_ai_spawn_checks()
{
	foreach(s in level.custom_ai_spawn_check_funcs)
	{
		if([[s.func_check]]())
		{
			a_spawners = [[s.func_get_spawners]]();
			level.zombie_spawners = arraycombine(level.zombie_spawners, a_spawners, 0, 0);
			if(is_true(level.use_multiple_spawns))
			{
				foreach(sp in a_spawners)
				{
					if(isdefined(sp.script_int))
					{
						if(!isdefined(level.zombie_spawn[sp.script_int]))
						{
							level.zombie_spawn[sp.script_int] = [];
						}
						if(!isinarray(level.zombie_spawn[sp.script_int], sp))
						{
							if(!isdefined(level.zombie_spawn[sp.script_int]))
							{
								level.zombie_spawn[sp.script_int] = [];
							}
							else if(!isarray(level.zombie_spawn[sp.script_int]))
							{
								level.zombie_spawn[sp.script_int] = array(level.zombie_spawn[sp.script_int]);
							}
							level.zombie_spawn[sp.script_int][level.zombie_spawn[sp.script_int].size] = sp;
						}
					}
				}
			}
			if(isdefined(s.func_get_locations))
			{
				a_locations = [[s.func_get_locations]]();
				level.zm_loc_types[#"zombie_location"] = arraycombine(level.zm_loc_types[#"zombie_location"], a_locations, 0, 0);
			}
			continue;
		}
		a_spawners = [[s.func_get_spawners]]();
		foreach(sp in a_spawners)
		{
			arrayremovevalue(level.zombie_spawners, sp);
		}
		if(is_true(level.use_multiple_spawns))
		{
			foreach(sp in a_spawners)
			{
				if(isdefined(sp.script_int) && isdefined(level.zombie_spawn[sp.script_int]))
				{
					arrayremovevalue(level.zombie_spawn[sp.script_int], sp);
				}
			}
		}
		if(isdefined(s.func_get_locations))
		{
			a_locations = [[s.func_get_locations]]();
			foreach(s_loc in a_locations)
			{
				arrayremovevalue(level.zm_loc_types[#"zombie_location"], s_loc);
			}
		}
	}
}

/*
	Name: register_custom_ai_spawn_check
	Namespace: zm_round_logic
	Checksum: 0x49071BB2
	Offset: 0x1E58
	Size: 0xA2
	Parameters: 4
	Flags: None
*/
function register_custom_ai_spawn_check(str_id, func_check, func_get_spawners, func_get_locations)
{
	if(!isdefined(level.custom_ai_spawn_check_funcs[str_id]))
	{
		level.custom_ai_spawn_check_funcs[str_id] = spawnstruct();
	}
	level.custom_ai_spawn_check_funcs[str_id].func_check = func_check;
	level.custom_ai_spawn_check_funcs[str_id].func_get_spawners = func_get_spawners;
	level.custom_ai_spawn_check_funcs[str_id].func_get_locations = func_get_locations;
}

/*
	Name: round_spawning_test
	Namespace: zm_round_logic
	Checksum: 0x4011EF14
	Offset: 0x1F08
	Size: 0xAE
	Parameters: 0
	Flags: None
*/
function round_spawning_test()
{
	while(true)
	{
		spawn_point = array::random(level.zm_loc_types[#"zombie_location"]);
		spawner = array::random(level.zombie_spawners);
		ai = zombie_utility::spawn_zombie(spawner, spawner.targetname, spawn_point);
		ai waittill(#"death");
		wait(5);
	}
}

/*
	Name: round_start
	Namespace: zm_round_logic
	Checksum: 0xF432B5AC
	Offset: 0x1FC0
	Size: 0x2A0
	Parameters: 0
	Flags: None
*/
function round_start()
{
	if(!isdefined(level.zombie_spawners) || level.zombie_spawners.size == 0)
	{
		/#
			println("");
		#/
		level flag::set("begin_spawning");
		return;
	}
	/#
		println("");
	#/
	if(isdefined(level.round_prestart_func))
	{
		[[level.round_prestart_func]]();
	}
	else
	{
		n_delay = 2;
		if(isdefined(level.zombie_round_start_delay))
		{
			n_delay = level.zombie_round_start_delay;
		}
		wait(n_delay);
	}
	if(getdvarint(#"scr_writeconfigstrings", 0) == 1)
	{
		wait(5);
		exitlevel();
		return;
	}
	level flag::set("begin_spawning");
	if(!isdefined(level.var_d8d02d0e))
	{
		level.var_d8d02d0e = &function_e6937bfa;
	}
	if(!isdefined(level.round_spawn_func))
	{
		level.round_spawn_func = &round_spawning;
	}
	if(!isdefined(level.move_spawn_func))
	{
		level.move_spawn_func = &zm_utility::move_zombie_spawn_location;
	}
	if(!isdefined(level.var_322d0819))
	{
		level.var_322d0819 = &zm_quick_spawning::function_765cb1de;
	}
	/#
		if(getdvarint(#"zombie_rise_test", 0))
		{
			level.round_spawn_func = &round_spawning_test;
		}
	#/
	if(!isdefined(level.round_wait_func))
	{
		level.round_wait_func = &round_wait;
	}
	if(!isdefined(level.round_think_func))
	{
		level.round_think_func = &round_think;
	}
	level.var_15d17eb2 = 1;
	level.var_b48509f9 = 1;
	level thread [[level.round_think_func]]();
}

/*
	Name: wait_until_first_player
	Namespace: zm_round_logic
	Checksum: 0xE2878B46
	Offset: 0x2268
	Size: 0x44
	Parameters: 0
	Flags: None
*/
function wait_until_first_player()
{
	players = getplayers();
	if(!isdefined(players[0]))
	{
		level waittill(#"first_player_ready");
	}
}

/*
	Name: round_one_up
	Namespace: zm_round_logic
	Checksum: 0x65B61018
	Offset: 0x22B8
	Size: 0x20C
	Parameters: 0
	Flags: Linked
*/
function round_one_up()
{
	level endon(#"end_game");
	if(isdefined(level.noroundnumber) && level.noroundnumber == 1)
	{
		return;
	}
	if(!isdefined(level.doground_nomusic))
	{
		level.doground_nomusic = 0;
	}
	if(level.first_round)
	{
		intro = 1;
		if(isdefined(level._custom_intro_vox))
		{
			level thread [[level._custom_intro_vox]]();
		}
		else
		{
			level thread play_level_start_vox_delayed();
		}
	}
	else
	{
		intro = 0;
	}
	if(level.round_number == 5 || level.round_number == 10 || level.round_number == 20 || level.round_number == 35 || level.round_number == 50)
	{
		players = getplayers();
		rand = randomintrange(0, players.size);
		players[rand] thread zm_audio::create_and_play_dialog(#"general", #"round_" + level.round_number);
	}
	if(intro)
	{
		if(is_true(level.host_ended_game))
		{
			return;
		}
		wait(6.25);
		level notify(#"intro_hud_done");
		wait(2);
	}
	else
	{
		wait(2.5);
	}
	reportmtu(level.round_number);
}

/*
	Name: round_over
	Namespace: zm_round_logic
	Checksum: 0x3295061F
	Offset: 0x24D0
	Size: 0x2D0
	Parameters: 0
	Flags: Linked
*/
function round_over()
{
	if(isdefined(level.noroundnumber) && level.noroundnumber == 1)
	{
		return;
	}
	time = [[level.func_get_delay_between_rounds]]();
	/#
		if(getdvarint(#"zombie_cheat", 0) > 0)
		{
			time = 0.1;
		}
	#/
	players = getplayers();
	for(player_index = 0; player_index < players.size; player_index++)
	{
		if(!isdefined(players[player_index].pers[#"previous_distance_traveled"]))
		{
			players[player_index].pers[#"previous_distance_traveled"] = 0;
		}
		distancethisround = int(players[player_index].pers[#"distance_traveled"] - players[player_index].pers[#"previous_distance_traveled"]);
		players[player_index].pers[#"previous_distance_traveled"] = players[player_index].pers[#"distance_traveled"];
		players[player_index] incrementplayerstat("distance_traveled", distancethisround);
		if(players[player_index].pers[#"team"] != "spectator")
		{
			players[player_index] recordroundendstats();
		}
	}
	recordzombieroundend();
	level flag::wait_till_any_timeout(time, array("round_reset", #"trial_failed"));
	foreach(player in getplayers())
	{
		if(is_true(player.var_6696e200))
		{
			wait(level.var_54d9d726);
			break;
		}
	}
}

/*
	Name: get_delay_between_rounds
	Namespace: zm_round_logic
	Checksum: 0xA24272AD
	Offset: 0x27A8
	Size: 0x22
	Parameters: 0
	Flags: Linked
*/
function get_delay_between_rounds()
{
	return zombie_utility::function_d2dfacfd(#"zombie_between_round_time");
}

/*
	Name: recordplayerroundweapon
	Namespace: zm_round_logic
	Checksum: 0x7BA04085
	Offset: 0x27D8
	Size: 0x64
	Parameters: 2
	Flags: Linked
*/
function recordplayerroundweapon(weapon, statname)
{
	if(isdefined(weapon))
	{
		weaponidx = getbaseweaponitemindex(weapon);
		if(isdefined(weaponidx))
		{
			self incrementplayerstat(statname, weaponidx);
		}
	}
}

/*
	Name: recordprimaryweaponsstats
	Namespace: zm_round_logic
	Checksum: 0x8951BFA7
	Offset: 0x2848
	Size: 0x84
	Parameters: 2
	Flags: Linked
*/
function recordprimaryweaponsstats(base_stat_name, max_weapons)
{
	current_weapons = self getweaponslistprimaries();
	for(index = 0; index < max_weapons && index < current_weapons.size; index++)
	{
		recordplayerroundweapon(current_weapons[index], base_stat_name + index);
	}
}

/*
	Name: recordroundstartstats
	Namespace: zm_round_logic
	Checksum: 0x855F1559
	Offset: 0x28D8
	Size: 0xEC
	Parameters: 0
	Flags: Linked
*/
function recordroundstartstats()
{
	zonename = self zm_utility::get_current_zone();
	if(isdefined(zonename))
	{
		self recordzombiezone("startingZone", zonename);
	}
	if(!isdefined(self.score))
	{
		self.score = 0;
	}
	self incrementplayerstat("score", self.score);
	primaryweapon = self getcurrentweapon();
	self recordprimaryweaponsstats("roundStartPrimaryWeapon", 3);
	self recordmapevent(8, gettime(), self.origin, level.round_number);
}

/*
	Name: recordroundendstats
	Namespace: zm_round_logic
	Checksum: 0x20E3FEA
	Offset: 0x29D0
	Size: 0x94
	Parameters: 0
	Flags: Linked
*/
function recordroundendstats()
{
	zonename = self zm_utility::get_current_zone();
	if(isdefined(zonename))
	{
		self recordzombiezone("endingZone", zonename);
	}
	self recordprimaryweaponsstats("roundEndPrimaryWeapon", 3);
	self recordmapevent(9, gettime(), self.origin, level.round_number);
}

/*
	Name: function_89888d49
	Namespace: zm_round_logic
	Checksum: 0xD2DA7A38
	Offset: 0x2A70
	Size: 0x110
	Parameters: 0
	Flags: Linked, Private
*/
function private function_89888d49()
{
	foreach(player in level.players)
	{
		if(!player gamepadusedlast())
		{
			player util::delay(5, "end_game", &zm_equipment::show_hint_text, #"hash_372a154dca05d6ba");
			continue;
		}
		player util::delay(5, "end_game", &zm_equipment::show_hint_text, #"hash_7ad0fd9b634f581a");
	}
}

/*
	Name: round_think
	Namespace: zm_round_logic
	Checksum: 0xF311BB7B
	Offset: 0x2B88
	Size: 0x1066
	Parameters: 1
	Flags: Linked
*/
function round_think(restart)
{
	if(!isdefined(restart))
	{
		restart = 0;
	}
	/#
		println("");
	#/
	level endon(#"end_round_think", #"end_game");
	if(!is_true(restart))
	{
		if(isdefined(level.initial_round_wait_func))
		{
			[[level.initial_round_wait_func]]();
		}
		if(!is_true(level.host_ended_game))
		{
			players = getplayers();
			foreach(player in players)
			{
				player zm_stats::set_global_stat("rounds", level.round_number);
			}
		}
	}
	setroundsplayed(level.round_number);
	level.var_21e22beb = gettime();
	zm_trial::function_74872db6();
	callback::callback(#"hash_6df5348c2fb9a509");
	if(level flag::exists(#"ztcm"))
	{
		luinotifyevent(#"hash_2f5757ad20bc3ae", 0);
		function_89888d49();
	}
	array::thread_all(level.players, &zm_blockers::rebuild_barrier_reward_reset);
	while(true)
	{
		zombie_utility::set_zombie_var(#"rebuild_barrier_cap_per_round", min(500, 50 * level.round_number));
		level.pro_tips_start_time = gettime();
		level.zombie_last_run_time = gettime();
		if(isdefined(level.zombie_round_change_custom))
		{
			level thread zm_audio::function_4138a262();
			[[level.zombie_round_change_custom]]();
		}
		else
		{
			level thread zm_audio::function_4138a262();
			round_one_up();
		}
		zm_powerups::powerup_round_start();
		if(!is_true(level.headshots_only) && !restart)
		{
			level thread award_grenades_for_survivors();
		}
		/#
			println((("" + level.round_number) + "") + level.players.size);
		#/
		level.round_start_time = gettime();
		while(level.zm_loc_types[#"zombie_location"].size <= 0)
		{
			wait(0.1);
		}
		/#
			zkeys = getarraykeys(level.zones);
			for(i = 0; i < zkeys.size; i++)
			{
				zonename = zkeys[i];
				level.zones[zonename].round_spawn_count = 0;
			}
		#/
		if(!is_true(level.var_ab84adee))
		{
			level thread round_timeout();
		}
		level thread [[level.round_spawn_func]]();
		level notify(#"start_of_round", {#n_round_number:level.round_number});
		recordnumzombierounds(level.round_number - 1);
		recordzombieroundstart();
		players = getplayers();
		for(index = 0; index < players.size; index++)
		{
			players[index] recordroundstartstats();
		}
		if(isdefined(level.round_start_custom_func))
		{
			[[level.round_start_custom_func]]();
		}
		[[level.round_wait_func]]();
		level thread zm_audio::function_d0f5602a();
		level.first_round = 0;
		zm_trial::on_round_end();
		callback::callback(#"on_round_end");
		level notify(#"end_of_round");
		if(!zm_trial::is_trial_mode() || !zm_utility::is_standard())
		{
			playsoundatposition(#"hash_58df62ae7fa7b42b", (0, 0, 0));
		}
		if(isdefined(level.round_end_custom_logic))
		{
			[[level.round_end_custom_logic]]();
		}
		if(!level flag::get("round_reset") && zm_custom::function_901b751c(#"zmroundcap") == level.round_number && level.round_number != 0)
		{
			level.var_458eec65 = 1;
			wait(3);
			zm_custom::function_9be9c072("zmRoundCap");
			return;
		}
		/#
			if(getdvarint(#"hash_18ba3b9b4a48b008", 0) || level.players.size != getplayers().size)
			{
				var_f2f19afd = [];
				foreach(player in level.players)
				{
					if(!isplayer(player))
					{
						var_f2f19afd[var_f2f19afd.size] = "";
						continue;
					}
					var_f2f19afd[var_f2f19afd.size] = player.sessionstate;
				}
				var_9114f285 = [];
				foreach(player in getplayers())
				{
					if(!isplayer(player))
					{
						var_9114f285[var_9114f285.size] = "";
						continue;
					}
					var_9114f285[var_9114f285.size] = player.sessionstate;
				}
				message = ((("" + level.players.size) + "") + getplayers().size) + "";
				foreach(state in var_f2f19afd)
				{
					message = (message + state) + "";
				}
				message = message + "";
				foreach(state in var_9114f285)
				{
					message = (message + state) + "";
				}
				/#
					assertmsg(message);
				#/
			}
		#/
		if(level.players.size > 1 && !level flag::get("round_reset"))
		{
			level thread zm_player::spectators_respawn();
		}
		if(((int(level.round_number / 5)) * 5) == level.round_number)
		{
			level clientfield::set("round_complete_time", int(((level.time - level.n_gameplay_start_time) + 500) / 1000));
			level clientfield::set("round_complete_num", level.round_number);
		}
		level.var_b48509f9 = int((floor(level.round_number / 5)) + 1);
		if(level flag::get("round_reset"))
		{
			if(isdefined(level.var_495d3112))
			{
				[[level.var_495d3112]]();
			}
		}
		else if(get_round_number() !== getgametypesetting("zmExfilRound"))
		{
			set_round_number(1 + get_round_number());
		}
		setroundsplayed(get_round_number());
		zombie_utility::set_zombie_var(#"zombie_spawn_delay", [[level.func_get_zombie_spawn_delay]](get_round_number()));
		matchutctime = getutc();
		players = getplayers();
		foreach(player in players)
		{
			if(level.curr_gametype_affects_rank && get_round_number() > (3 + level.start_round))
			{
				player zm_stats::add_client_stat("weighted_rounds_played", get_round_number());
			}
			player zm_stats::set_global_stat("rounds", get_round_number());
			player zm_stats::update_playing_utc_time(matchutctime);
			player zm_stats::function_4dd876ad();
			if(!is_true(zm_custom::function_901b751c(#"zmhealthdrain")) && !player laststand::player_is_in_laststand() && is_true(player.heal.enabled))
			{
				player zm_utility::set_max_health(1);
			}
			for(i = 0; i < 4; i++)
			{
				player.number_revives_per_round[i] = 0;
			}
			if(isalive(player) && player.sessionstate != "spectator" && !is_true(level.skip_alive_at_round_end_xp) && !level flag::get("round_reset"))
			{
				player zm_stats::increment_challenge_stat(#"survivalist_survive_rounds", undefined, 1);
				score_number = get_round_number() - 1;
				if(score_number < 1)
				{
					score_number = 1;
				}
				else if(score_number > 20)
				{
					score_number = 20;
				}
				level scoreevents::doscoreeventcallback("scoreEventZM", {#scoreevent:"alive_at_round_end_" + score_number, #attacker:player});
			}
		}
		level.round_number = get_round_number();
		level flag::clear("round_reset");
		zm_trial::function_74872db6();
		callback::callback(#"hash_6df5348c2fb9a509");
		array::thread_all(level.players, &zm_blockers::rebuild_barrier_reward_reset);
		level round_over();
		level notify(#"between_round_over");
		level.skip_alive_at_round_end_xp = 0;
		restart = 0;
	}
}

/*
	Name: round_timeout
	Namespace: zm_round_logic
	Checksum: 0x4E19F19
	Offset: 0x3BF8
	Size: 0x25C
	Parameters: 0
	Flags: Linked
*/
function round_timeout()
{
	level endon(#"end_of_round", #"end_game");
	level waittill(#"zombie_total_set");
	level.var_2125984b = 0;
	if(level.round_number < 6)
	{
		level flag::wait_till_any(array("power_on", "enable_round_timeout"));
	}
	while(level.zombie_total > 0)
	{
		wait(1);
	}
	n_timeout = (isdefined(level.var_2e3a6cbe) ? level.var_2e3a6cbe : 600);
	var_18836dd9 = zombie_utility::get_current_zombie_count();
	var_a456111d = var_18836dd9;
	var_1df92c7c = (isdefined(level.var_589a7f02) ? level.var_589a7f02 : 20);
	while(n_timeout > 0 && var_1df92c7c > 0)
	{
		if(!level flag::get("pause_round_timeout"))
		{
			n_timeout--;
			if(is_true(level.var_d614a8b4))
			{
				if(var_a456111d == var_18836dd9)
				{
					var_1df92c7c--;
				}
				else
				{
					var_1df92c7c = (isdefined(level.var_3c91da30) ? level.var_3c91da30 : 20);
				}
			}
		}
		wait(1);
		var_18836dd9 = var_a456111d;
		var_a456111d = zombie_utility::get_current_zombie_count();
	}
	level flag::wait_till_clear("pause_round_timeout");
	level thread zm_cleanup::function_c6ad3003(1);
	level callback::on_round_end(&function_fb6aa5a3);
	level flag::set("end_round_wait");
}

/*
	Name: function_fb6aa5a3
	Namespace: zm_round_logic
	Checksum: 0xD633431B
	Offset: 0x3E60
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function function_fb6aa5a3()
{
	level flag::clear("end_round_wait");
	level callback::remove_on_round_end(&function_fb6aa5a3);
}

/*
	Name: award_grenades_for_survivors
	Namespace: zm_round_logic
	Checksum: 0x80F724D1
	Offset: 0x3EB0
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function award_grenades_for_survivors()
{
}

/*
	Name: get_zombie_spawn_delay
	Namespace: zm_round_logic
	Checksum: 0xBF914613
	Offset: 0x3EC0
	Size: 0x1F6
	Parameters: 1
	Flags: Linked
*/
function get_zombie_spawn_delay(n_round)
{
	if(n_round > 60)
	{
		n_round = 60;
	}
	n_player_count = zm_utility::function_a2541519(level.players.size);
	switch(n_player_count)
	{
		case 1:
		{
			n_delay = zombie_utility::function_d2dfacfd(#"hash_7d5a25e2463f7fc5");
			break;
		}
		case 2:
		{
			n_delay = zombie_utility::function_d2dfacfd(#"hash_7d5a25e2463f7fc5") * 0.75;
			break;
		}
		case 3:
		{
			n_delay = zombie_utility::function_d2dfacfd(#"hash_7d5a25e2463f7fc5") * 0.445;
			break;
		}
		case 4:
		{
			n_delay = zombie_utility::function_d2dfacfd(#"hash_7d5a25e2463f7fc5") * 0.335;
			break;
		}
		default:
		{
			n_delay = zombie_utility::function_d2dfacfd(#"hash_7d5a25e2463f7fc5") * 0.275;
			break;
		}
	}
	for(i = 1; i < n_round; i++)
	{
		n_delay = n_delay * 0.95;
		if(n_delay <= 0.1)
		{
			n_delay = 0.1;
			break;
		}
	}
	return n_delay;
}

/*
	Name: round_spawn_failsafe_debug
	Namespace: zm_round_logic
	Checksum: 0xC4063148
	Offset: 0x40C0
	Size: 0xA0
	Parameters: 0
	Flags: None
*/
function round_spawn_failsafe_debug()
{
	/#
		level notify(#"failsafe_debug_stop");
		level endon(#"failsafe_debug_stop");
		start = gettime();
		level.chunk_time = 0;
		while(true)
		{
			level.failsafe_time = gettime() - start;
			if(isdefined(self.lastchunk_destroy_time))
			{
				level.chunk_time = gettime() - self.lastchunk_destroy_time;
			}
			util::wait_network_frame();
		}
	#/
}

/*
	Name: print_zombie_counts
	Namespace: zm_round_logic
	Checksum: 0xFDB27794
	Offset: 0x4168
	Size: 0x164
	Parameters: 0
	Flags: None
*/
function print_zombie_counts()
{
	/#
		while(true)
		{
			if(getdvarint(#"zombiemode_debug_zombie_count", 0))
			{
				if(!isdefined(level.debug_zombie_count_hud))
				{
					level.debug_zombie_count_hud = newdebughudelem();
					level.debug_zombie_count_hud.alignx = "";
					level.debug_zombie_count_hud.x = 100;
					level.debug_zombie_count_hud.y = 10;
					level.debug_zombie_count_hud settext("");
				}
				currentcount = zombie_utility::get_current_zombie_count();
				number_to_kill = level.zombie_total;
				level.debug_zombie_count_hud settext((("" + currentcount) + "") + number_to_kill);
			}
			else if(isdefined(level.debug_zombie_count_hud))
			{
				level.debug_zombie_count_hud destroy();
				level.debug_zombie_count_hud = undefined;
			}
			wait(0.1);
		}
	#/
}

/*
	Name: round_wait
	Namespace: zm_round_logic
	Checksum: 0xF0A7B325
	Offset: 0x42D8
	Size: 0x20A
	Parameters: 0
	Flags: Linked
*/
function round_wait()
{
	level endon(#"restart_round", #"kill_round_wait");
	/#
		level endon(#"kill_round");
		if(getdvarint(#"zombie_rise_test", 0))
		{
			level waittill(#"forever");
		}
	#/
	if(zm::cheat_enabled(2))
	{
		level waittill(#"forever");
	}
	/#
		if(getdvarint(#"zombie_default_max", 0) == 0)
		{
			level waittill(#"forever");
		}
	#/
	wait(1);
	/#
		level thread print_zombie_counts();
		level thread sndmusiconkillround();
	#/
	while(true)
	{
		if(zombie_utility::get_current_zombie_count() == 0 && level.zombie_total <= 0 && !level.intermission && !level flag::get(#"infinite_round_spawning") && !level flag::get(#"hold_round_end"))
		{
			return;
		}
		if(level flag::get("end_round_wait"))
		{
			return;
		}
		if(level flag::get("round_reset"))
		{
			return;
		}
		wait(1);
	}
}

/*
	Name: sndmusiconkillround
	Namespace: zm_round_logic
	Checksum: 0x24752300
	Offset: 0x44F0
	Size: 0x54
	Parameters: 0
	Flags: None
*/
function sndmusiconkillround()
{
	level endon(#"end_of_round");
	level waittill(#"kill_round");
	level thread zm_audio::sndmusicsystem_playstate("round_end");
}

/*
	Name: play_level_start_vox_delayed
	Namespace: zm_round_logic
	Checksum: 0x9B323952
	Offset: 0x4550
	Size: 0x8C
	Parameters: 0
	Flags: Linked
*/
function play_level_start_vox_delayed()
{
	wait(3);
	players = getplayers();
	if(players.size <= 0)
	{
		return;
	}
	num = randomintrange(0, players.size);
	players[num] zm_audio::create_and_play_dialog(#"general", #"intro");
}

