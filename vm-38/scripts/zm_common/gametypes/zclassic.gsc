#using script_113dd7f0ea2a1d4f;
#using script_165beea08a63a243;
#using script_3411bb48d41bd3b;
#using script_34ab99a4ca1a43d;
#using script_4421226bbc54b398;
#using script_5bb072c3abf4652c;
#using script_67ce8e728d8f37ba;
#using script_6ce38ab036223e6e;
#using script_799de24f8ad427f7;
#using script_7b1cd3908a825fdd;
#using script_db06eb511bd9b36;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\gamestate.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm_common\callbacks.gsc;
#using scripts\zm_common\gametypes\zm_gametype.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\zm_common\zm_behavior.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;

#namespace zclassic;

/*
	Name: function_5170dd77
	Namespace: zclassic
	Checksum: 0x139394D
	Offset: 0x228
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_5170dd77()
{
	level notify(226184951);
}

/*
	Name: main
	Namespace: zclassic
	Checksum: 0x6F854770
	Offset: 0x248
	Size: 0x22C
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	level.var_2f5a329e = 1;
	level.var_75c2c45f = 50;
	level.var_8179368e = &function_452e5ad6;
	if(!isdefined(level.var_31028c5d))
	{
		level.var_31028c5d = prototype_hud::register();
	}
	zm_gametype::main();
	level.onprecachegametype = &onprecachegametype;
	level.onstartgametype = &onstartgametype;
	level._game_module_custom_spawn_init_func = &zm_gametype::custom_spawn_init_func;
	level._game_module_stat_update_func = &zm_stats::survival_classic_custom_stat_update;
	level._round_start_func = &namespace_a28acff3::round_start;
	level.var_4d30a9f0 = 1;
	level.var_cdc822b = &function_38499d79;
	level.var_9f01688e = 1;
	spawner::add_ai_spawn_function(&function_a143f9d1);
	level thread function_a24232f4();
	namespace_58949729::function_5a12541e();
	level thread intro_cinematic();
	callback::function_189f87c1(&function_189f87c1);
	callback::add_callback(#"hash_594217387367ebb4", &function_d81240c3);
	callback::add_callback(#"hash_3b7d3ed9e484ef72", &function_809241a9);
	callback::on_spawned(&on_player_spawn);
}

/*
	Name: function_a143f9d1
	Namespace: zclassic
	Checksum: 0xF7D19584
	Offset: 0x480
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function function_a143f9d1(params)
{
	self.var_1b2af7dc = 1;
	self thread function_acafdd66();
}

/*
	Name: function_acafdd66
	Namespace: zclassic
	Checksum: 0x380145BF
	Offset: 0x4B8
	Size: 0x4C
	Parameters: 0
	Flags: None
*/
function function_acafdd66()
{
	self endon(#"death");
	while(true)
	{
		self waittill(#"bad_path");
		self.var_4fe4e626 = 1;
		wait(0.5);
	}
}

/*
	Name: function_38499d79
	Namespace: zclassic
	Checksum: 0x9F1B3A75
	Offset: 0x510
	Size: 0x98
	Parameters: 0
	Flags: None
*/
function function_38499d79()
{
	if(is_true(self.cached_zone_volume.var_8e4005b6))
	{
		result = function_9cc082d2(self.origin, 16);
		if(isdefined(result) && isdefined(result[#"region"]))
		{
			return 1;
		}
		if(isdefined(level.var_6ceacf64))
		{
			return [[level.var_6ceacf64]]();
		}
		return 0;
	}
	return 1;
}

/*
	Name: function_d81240c3
	Namespace: zclassic
	Checksum: 0x3BE75DD7
	Offset: 0x5B0
	Size: 0x5C
	Parameters: 1
	Flags: None
*/
function function_d81240c3(params)
{
	spawner::add_archetype_spawn_function(#"zombie", &function_7a3ebb8a);
	level flag::set("rbz_exfil_started");
}

/*
	Name: function_7a3ebb8a
	Namespace: zclassic
	Checksum: 0xBF889DDB
	Offset: 0x618
	Size: 0x96
	Parameters: 0
	Flags: None
*/
function function_7a3ebb8a()
{
	self endon(#"death");
	if(self.targetname !== #"exfil_ai")
	{
		return;
	}
	self.var_90d0c0ff = "anim_spawn_from_ground";
	self namespace_85745671::function_2089690e();
	if(isdefined(self))
	{
		self pathmode("move allowed");
		self.completed_emerging_into_playable_area = 1;
		self.zombie_think_done = 1;
	}
}

/*
	Name: onprecachegametype
	Namespace: zclassic
	Checksum: 0xDEA09595
	Offset: 0x6B8
	Size: 0x1C
	Parameters: 0
	Flags: None
*/
function onprecachegametype()
{
	level.canplayersuicide = &zm_gametype::canplayersuicide;
}

/*
	Name: onstartgametype
	Namespace: zclassic
	Checksum: 0xC70A62FB
	Offset: 0x6E0
	Size: 0x1A4
	Parameters: 0
	Flags: None
*/
function onstartgametype()
{
	zm_behavior::function_70a657d8();
	zm_cleanup::function_70a657d8();
	zm_spawner::init();
	zm_behavior::function_8ac3bea9();
	zm_cleanup::function_8ac3bea9();
	level.spawnmins = (0, 0, 0);
	level.spawnmaxs = (0, 0, 0);
	structs = struct::get_array("player_respawn_point", "targetname");
	foreach(struct in structs)
	{
		level.spawnmins = math::expand_mins(level.spawnmins, struct.origin);
		level.spawnmaxs = math::expand_maxs(level.spawnmaxs, struct.origin);
	}
	level.mapcenter = math::find_box_center(level.spawnmins, level.spawnmaxs);
	setmapcenter(level.mapcenter);
}

/*
	Name: on_player_spawn
	Namespace: zclassic
	Checksum: 0xA9722F72
	Offset: 0x890
	Size: 0x1DC
	Parameters: 0
	Flags: None
*/
function on_player_spawn()
{
	self.specialty = self getloadoutperks(0);
	self zm::register_perks();
	if(!level.var_31028c5d prototype_hud::is_open(self))
	{
		level.var_31028c5d prototype_hud::open(self, 1);
	}
	if(is_true(self.is_hotjoin))
	{
		var_c6b6dcea = level.round_number * 500;
		self.pers[#"score"] = var_c6b6dcea;
		self.score = self.pers[#"score"];
		self.score_total = self.score;
		self.var_f22ee5e = self.score_total;
		/#
			if(getdvarint(#"zombie_cheat", 0) >= 1)
			{
				self.score = 100000;
			}
		#/
		self.is_hotjoin = undefined;
	}
	else if(isdefined(level.var_dfee7fc2) && !level flag::get("initial_blackscreen_passed") && !getdvarint(#"hash_39af51993585a73e", 0))
	{
		self thread scene::init_streamer(level.var_dfee7fc2, array(self), 0, 0);
	}
}

/*
	Name: intro_cinematic
	Namespace: zclassic
	Checksum: 0x5E4515E2
	Offset: 0xA78
	Size: 0x29C
	Parameters: 0
	Flags: Private
*/
function private intro_cinematic()
{
	level flag::wait_till("initial_blackscreen_passed");
	if(isdefined(level.var_dfee7fc2) && !getdvarint(#"hash_39af51993585a73e", 0))
	{
		foreach(player in getplayers())
		{
			player.var_f4e33249 = 1;
		}
		namespace_66d6aa44::function_bb17da18();
		level.var_3dfa8db4 = 1;
		util::wait_network_frame(2);
		level scene::play(level.var_dfee7fc2);
		callback::callback(#"hash_41e282f5ec98e877");
		namespace_66d6aa44::function_db62d086();
		level.var_dfee7fc2 = undefined;
		foreach(player in getplayers())
		{
			player dontinterpolate();
			player setorigin(player.spectator_respawn.origin);
			player setplayerangles(player.spectator_respawn.angles);
			player.var_f4e33249 = undefined;
		}
	}
	level flag::set(#"intro_scene_done");
	gamestate::set_state(#"playing");
}

/*
	Name: function_a24232f4
	Namespace: zclassic
	Checksum: 0xABD00D96
	Offset: 0xD20
	Size: 0xE0
	Parameters: 0
	Flags: None
*/
function function_a24232f4()
{
	level flag::wait_till_all(array(#"gameplay_started"));
	level thread namespace_591b4396::function_5a22584f();
	foreach(destination in level.var_7d45d0d4.var_d60029a6)
	{
		level thread namespace_591b4396::function_7c05a985(destination);
	}
}

/*
	Name: function_189f87c1
	Namespace: zclassic
	Checksum: 0xB5C41EFF
	Offset: 0xE08
	Size: 0x404
	Parameters: 0
	Flags: None
*/
function function_189f87c1()
{
	level endon(#"hash_3e765c26047c9f54", #"end_game");
	var_370ac26d = zm::function_d3113f01().var_bd588afd;
	luinotifyevent(#"hash_3e6dd0ad7b864154", 1, var_370ac26d);
	foreach(player in getplayers())
	{
		if(!isdefined(player.var_8d41c907))
		{
			player.var_8d41c907 = 0;
		}
		player addrankxpvalue("round_end_xp", var_370ac26d, 4);
		player.var_8d41c907 = player.var_8d41c907 + var_370ac26d;
	}
	if((level.round_number % 5) == 0 && level.round_number > 5)
	{
		foreach(player in getplayers())
		{
			player namespace_d4ecbbf0::function_73cddc69();
		}
		if(!level flag::get("rbz_exfil_allowed"))
		{
			level flag::wait_till("rbz_exfil_allowed");
			wait(12);
		}
		if(level.round_number !== getgametypesetting("zmExfilRound"))
		{
			level flag::set("rbz_exfil_beacon_active");
		}
		if(!is_true(level.var_22bf7a06))
		{
			level thread zm_vo::function_7622cb70(#"hash_5575881191efb302", undefined, 1, #"hash_23d445a634bedeae");
			if(!level flag::get(#"hash_23d445a634bedeae"))
			{
				level.var_22bf7a06 = 1;
			}
		}
		else
		{
			level thread zm_vo::function_7622cb70(#"hash_2788496d7ed6f0ef", undefined, 1, #"hash_23d445a634bedeae");
		}
		wait(120);
		level flag::clear("rbz_exfil_beacon_active");
		if(!is_true(level.var_9fcead52))
		{
			level thread zm_vo::function_7622cb70(#"hash_2a4c39d0533e577d", undefined, 1, #"hash_23d445a634bedeae");
			if(!level flag::get(#"hash_23d445a634bedeae"))
			{
				level.var_9fcead52 = 1;
			}
		}
		else
		{
			level thread zm_vo::function_7622cb70(#"hash_684b542bf103e4fe", undefined, 1, #"hash_23d445a634bedeae");
		}
	}
}

/*
	Name: function_809241a9
	Namespace: zclassic
	Checksum: 0xF23D3BEE
	Offset: 0x1218
	Size: 0x348
	Parameters: 0
	Flags: None
*/
function function_809241a9()
{
	players = getplayers();
	foreach(player in players)
	{
		/#
			/#
				assert(isdefined(player.var_b6577248), "");
			#/
		#/
		var_22ba849f = getdvarint(#"hash_3f0689f4ecc2fbab", 0);
		var_3f8d170c = (zm_utility::get_round_number() - player.var_b6577248) + 1;
		var_900d44db = zm::function_d3113f01();
		var_191f8e5e = var_900d44db.var_c6f2635d;
		var_7c032359 = var_900d44db.var_b93abbed[getplayers().size - 1];
		var_f65fd621 = function_7a2da789()[#"hash_31b5b9e273560fa9"];
		if(!isdefined(player.var_8d41c907))
		{
			player.var_8d41c907 = 0;
		}
		var_c602cc83 = player.var_8d41c907;
		var_370ac26d = int(((((var_22ba849f * var_3f8d170c) * var_191f8e5e) * var_f65fd621) - var_c602cc83) * var_7c032359);
		player zm::function_78e7b549(var_370ac26d);
		/#
			println((((("" + player getentnum()) + "") + player.name) + "") + var_370ac26d);
			println("" + var_22ba849f);
			println("" + var_3f8d170c);
			println("" + var_191f8e5e);
			println("" + var_f65fd621);
			println("" + var_7c032359);
			println("" + var_c602cc83);
			println("");
		#/
	}
}

/*
	Name: function_452e5ad6
	Namespace: zclassic
	Checksum: 0x2EFC285D
	Offset: 0x1568
	Size: 0x1A2
	Parameters: 0
	Flags: None
*/
function function_452e5ad6()
{
	spawn_points = zm_gametype::get_player_spawns_for_gametype();
	var_d117c934 = [];
	foreach(point in spawn_points)
	{
		if(zm_zonemgr::zone_is_enabled(point.script_noteworthy))
		{
			if(!isdefined(var_d117c934))
			{
				var_d117c934 = [];
			}
			else if(!isarray(var_d117c934))
			{
				var_d117c934 = array(var_d117c934);
			}
			var_d117c934[var_d117c934.size] = point;
		}
	}
	var_7fc5b7c3 = arraysortclosest(var_d117c934, self.origin, 20, 0, 2000);
	var_5d59bb63 = arraysortclosest(var_d117c934, self.origin, 20, 1000, 2000);
	var_1a672bba = (var_5d59bb63.size ? var_5d59bb63 : var_7fc5b7c3);
	var_61c941e8 = array::random(var_1a672bba);
	return var_61c941e8;
}

