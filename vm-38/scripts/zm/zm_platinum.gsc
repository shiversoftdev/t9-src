#using script_4bdd2bb136949c9b;
#using script_488555e9bc2ef7da;
#using script_100835406ec3feaf;
#using script_40627e3239a72ee;
#using script_b64b5c3524ca55e;
#using script_7b7446984eba6e7c;
#using script_4fb8d41d7f3a3fff;
#using script_5ec1c9c908a7518a;
#using script_7d5a9e4ec34372d0;
#using script_1c92816b36da2771;
#using script_5b190e6124417f5a;
#using script_63b5c2449d0e2f48;
#using script_2a16392237e8cf8d;
#using script_49f1b42b7a848958;
#using scripts\zm\zm_ai_raz.gsc;
#using script_1ea5c1aec36ac889;
#using script_61fcfebb2f3a00e0;
#using script_77b61a4178efdbc4;
#using script_252989ab0c1d9a4c;
#using script_5eb334a29c814cf2;
#using scripts\zm\archetype\archetype_zod_companion.gsc;
#using script_76a8f964e4309959;
#using scripts\zm\ai\zm_ai_avogadro.gsc;
#using script_58860a35d0555f74;
#using scripts\zm_common\gametypes\zm_gametype.gsc;
#using script_353f4332c07d6432;
#using scripts\zm_common\ai\zm_ai_utility.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_player.gsc;
#using scripts\zm_common\zm_round_logic.gsc;
#using script_62caa307a394c18c;
#using scripts\zm_common\zm_equipment.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using script_24c32478acf44108;
#using scripts\zm_common\zm_sq.gsc;
#using scripts\zm_common\zm_fasttravel.gsc;
#using scripts\zm_common\zm_magicbox.gsc;
#using script_7b1cd3908a825fdd;
#using script_3411bb48d41bd3b;
#using scripts\zm_common\zm_devgui.gsc;
#using script_4ce5d94e8c797350;
#using scripts\zm_common\callbacks.gsc;
#using script_b9d273dc917ee1f;
#using script_72596c919cdba3f7;
#using scripts\zm_common\zm_zonemgr.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_round_spawning.gsc;
#using scripts\zm_common\zm_perks.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using script_448683444db21d61;
#using scripts\zm_common\zm_cleanup_mgr.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm.gsc;
#using script_ed50e9299d3e143;
#using scripts\zm_common\zm_weapons.gsc;
#using script_2f560596a9a134ab;
#using scripts\zm_common\zm_score.gsc;
#using script_18077945bb84ede7;
#using script_4ccfb58a9443a60b;
#using script_35598499769dbb3d;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\zm_common\zm_vo.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\aat_shared.gsc;
#using scripts\core_common\item_inventory.gsc;
#using script_7bacb32f8222fa3e;
#using script_340a2e805e35f7a2;
#using scripts\core_common\player\player_shared.gsc;
#using scripts\core_common\burnplayer.gsc;
#using scripts\core_common\scriptmodels_shared.gsc;
#using scripts\core_common\ai\archetype_utility.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\hud_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\compass.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\load_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using script_744259b349d834c7;

#namespace namespace_3fa257af;

/*
	Name: function_b0ad2943
	Namespace: namespace_3fa257af
	Checksum: 0xCE776839
	Offset: 0x14B0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b0ad2943()
{
	level notify(637736228);
}

/*
	Name: opt_in
	Namespace: namespace_3fa257af
	Checksum: 0x3AD17720
	Offset: 0x14D0
	Size: 0x84
	Parameters: 0
	Flags: AutoExec
*/
function autoexec opt_in()
{
	level.aat_in_use = 1;
	level.random_pandora_box_start = 1;
	level.var_33833303 = &function_23c31b4e;
	level.var_e2f95698 = #"hash_103f5ac44716cbe4";
	level.var_462ca9bb = #"cdp_taacom";
	level.var_6ff1cc71[#"hash_4cc252a7609d289"] = 1;
}

/*
	Name: main
	Namespace: namespace_3fa257af
	Checksum: 0x20F757D8
	Offset: 0x1560
	Size: 0x182C
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	level.var_dfee7fc2 = #"hash_684819b1dcad20f5";
	level.var_775a83a7 = 1;
	namespace_1fd59e39::function_1376ec37(undefined, undefined, "tunnel_boundary_damage_volume");
	namespace_4abf1500::function_88645994(#"hash_4eeb1c7447479151", #"hash_5efbc7b901eeb16c", undefined, undefined, #"hash_62c9a6dffc5a51c2", #"hash_3633d4db6bcd078b", #"hash_7a489b9c567a2477", undefined, #"hash_76c2fd67ac34ad50");
	zm::init_fx();
	namespace_b574e135::init();
	zm_platinum_pap_quest::init();
	namespace_6fb22263::init();
	zm_platinum_ww_quest::init();
	namespace_7a518726::init();
	zm_platinum_main_quest::init();
	namespace_4e8d47b1::init();
	namespace_54685ebd::init();
	namespace_8d91c4fb::init();
	clientfield::register_clientuimodel("player_lives", 1, 2, "int");
	clientfield::register("toplayer", "" + #"hash_7c5d3ac35353f95c", 24000, 1, "int");
	clientfield::register("toplayer", "" + #"hash_3c8a07f3b4eaf129", 1, 1, "int");
	clientfield::register("toplayer", "" + #"hash_4be33f9c734f0cb9", 1, 2, "int");
	clientfield::register("world", "" + #"hash_2a93d12c263f2d68", 24000, getminbitcountfornum(7), "int");
	clientfield::register("world", "" + #"hash_7d7dcebcb0511b14", 1, 1, "int");
	clientfield::register("world", "" + #"hash_2971ea22ea5a646a", 1, 3, "int");
	clientfield::register("scriptmover", "" + #"hash_19a76e1eb767b16b", 1, 1, "int");
	clientfield::register("toplayer", "" + #"hash_6e5cc4162abd613f", 24000, 1, "int");
	clientfield::register("actor", "" + #"hash_15e37ba2a31217b8", 24000, 1, "int");
	clientfield::register("world", "" + #"hash_3a84ac42abd608d2", 24000, 1, "int");
	clientfield::register("world", "" + #"hash_600dd9c10bd3447b", 24000, 2, "int");
	clientfield::register("world", "" + #"hash_228f0acdd4255cb", 24000, 1, "int");
	clientfield::register("actor", "" + #"hash_3e4641a9ea00d061", 24000, 1, "int");
	clientfield::register("actor", "" + #"hash_703543ca871a0f75", 24000, 2, "int");
	clientfield::register("toplayer", "" + #"hash_46bbaae5eb8a7080", 24000, 1, "int");
	clientfield::register("world", "" + #"hash_6eb96d2ad043aa56", 1, 1, "int");
	clientfield::register("world", "" + #"hash_7b3ada6e5b1cf81e", 1, 1, "int");
	clientfield::register("world", "" + #"hash_56c7e620d1de163a", 1, 1, "counter");
	clientfield::register("toplayer", "fogofwareffects", 1, getminbitcountfornum(2), "int");
	clientfield::register("vehicle", "" + #"hash_315d8062badb2345", 24000, getminbitcountfornum(2), "int");
	clientfield::register("allplayers", "" + #"hash_1fb207d10fbe27ce", 24000, 1, "int");
	level.default_start_location = "zone_rooftops_start";
	level.default_game_mode = "zclassic";
	level._allow_melee_weapon_switching = 1;
	level.zombiemode_reusing_pack_a_punch = 1;
	level.var_88672174 = 116;
	level.var_5b8c6c9b = 117;
	level.var_f1662fe9 = 118;
	level.var_d2ba1c27 = &namespace_33c196c8::function_bad0c914;
	level.var_e0ee1b1d = &namespace_33c196c8::function_bad0c914;
	level.var_71f14231 = &namespace_33c196c8::function_b926dcfd;
	level.var_15eefdd = 10;
	level.custom_spawner_entry[#"crawl"] = &zm_spawner::function_45bb11e4;
	level.custom_spawner_entry[#"hash_23e56c56dab2f6fc"] = &zm_spawner::function_814fc0d0;
	level.var_d0ab70a2 = #"hash_499ec58230cbe8b6";
	level.var_dbf9c70d = &function_452e5ad6;
	level.player_out_of_playable_area_monitor = 1;
	level.var_cd3d6a27 = &function_65c65feb;
	level.local_doors_stay_open = 1;
	level.var_1b57c9ca = 1;
	level.var_76e8fb05 = 1;
	level.var_dfe80386 = 1;
	callback::function_532a4f74(&function_a648d1a6);
	callback::function_c16ce2bc(&function_dc9b097c);
	callback::function_74872db6(&function_a56b42c0);
	util::registerclientsys("platMusUnlock");
	level.var_6f6cc58 = &function_6f6cc58;
	scene::function_497689f6(#"hash_684819b1dcad20f5", "helicopter", "tag_probe_attach", "prb_mil_ru_heli_trans");
	scene::add_scene_func(#"hash_684819b1dcad20f5", &function_a0f98b8b, "sh010", "sh010");
	scene::add_scene_func(#"hash_684819b1dcad20f5", &function_a0f98b8b, "sh020", "sh020");
	scene::add_scene_func(#"hash_684819b1dcad20f5", &function_a0f98b8b, "stop");
	load::main();
	namespace_958b287a::init();
	compass::setupminimap("");
	setdvar(#"hash_64d8f355a9e6daa5", 1);
	setdvar(#"hash_b3395a8d3abf84a", 1);
	setdvar(#"hash_75a2e23bc66a08a7", 0);
	setdvar(#"hash_2d56e13848a82d14", 0);
	setdvar(#"hash_384191a42356d34", 1);
	setdvar(#"hash_7b06b8037c26b99b", 30);
	level.var_f30c7ef1 = 1;
	level.var_e714f814 = 1;
	callback::on_spawned(&on_player_spawned);
	callback::on_player_killed(&namespace_207ea311::function_31b6f21e);
	callback::add_callback(#"hash_594217387367ebb4", &function_d81240c3);
	level._effect[#"hash_10dedae3d37c056f"] = #"hash_1337a37de3e6690";
	level.var_fc439a95 = #"hash_386308ed987052a4";
	level.var_7f72eddd = "default_zombies_platinum";
	level.var_dafeed10 = "exfil_platinum_";
	level.var_4bc7192d = #"hash_3f8c4e1a10327ae3";
	level.var_8bb7479c = #"hash_3e633e5380f3653b";
	level.var_72a3d8bc = #"hash_53349c8b66ec5f42";
	level.var_26ed6a07 = 600;
	level.var_c86f12d4 = 200;
	level.var_aaf7505f = 120;
	level.var_baed3b8e = 1750;
	level.var_ac94c2b8 = 2;
	namespace_591b4396::function_fa5bd408(array("zone_destroyed_upper_floors", "zone_destroyed_upper_floors2", "zone_destroyed_upper_room"));
	level.zones = [];
	level.zone_manager_init_func = &zm_platinum_zones::zone_init;
	level thread zm_zonemgr::manage_zones("zone_rooftops_start");
	namespace_207ea311::function_c6b98f73([41:"zone_sewers_stairs", 40:"zone_no_mans_land_3", 39:"zone_no_mans_land_2", 38:"zone_control_room", 37:"zone_safe_house", 36:"zone_lab_tunnel", 35:"zone_hidden_lab", 34:"zone_power_substation2", 33:"zone_power_substation", 32:"zone_basement_1", 31:"zone_basement_2", 30:"zone_ghost_station_stairs", 29:"zone_ghost_station_4", 28:"zone_ghost_station_3", 27:"zone_ghost_station_2", 26:"zone_ghost_station", 25:"zone_east_berlin_street", 24:"zone_destroyed_upper_room", 23:"zone_destroyed_upper_floors2", 22:"zone_korber_sewing_room", 21:"zone_korber_roof2", 20:"zone_korber_stairs", 19:"zone_korber_roof", 18:"zone_hotel_jack_room", 17:"zone_east_berlin_hotel_4", 16:"zone_east_berlin_hotel_3", 15:"zone_east_berlin_hotel_2", 14:"zone_east_berlin_hotel_1", 13:"zone_rooftops_interior", 12:"zone_rooftops_start", 11:"zone_destroyed_upper_floors", 10:"zone_sewers_and_escape_tunnel2", 9:"zone_sewers_and_escape_tunnel", 8:"zone_secret_spy_tunnel", 7:"zone_electronics_store", 6:"zone_market", 5:"zone_bar", 4:"zone_east_berlin_street_4", 3:"zone_east_berlin_street_3", 2:"zone_east_berlin_street_2", 1:"zone_east_berlin_street_1", 0:"zone_east_berlin_street_alley"]);
	level.var_666d1958 = [4:"zone_ghost_station_4", 3:"zone_ghost_station_3", 2:"zone_ghost_station_2", 1:"zone_ghost_station", 0:"zone_ghost_station_stairs"];
	level.var_7baf05a7 = [1:"zone_power_substation2", 0:"zone_power_substation"];
	level.var_e40bce8f = [8:"zone_control_room", 7:"zone_secret_spy_tunnel", 6:"zone_sewers_and_escape_tunnel2", 5:"zone_sewers_and_escape_tunnel", 4:"zone_ghost_station_4", 3:"zone_ghost_station_3", 2:"zone_ghost_station_2", 1:"zone_ghost_station", 0:"zone_ghost_station_stairs"];
	level.var_cef1cab5 = [5:"zone_basement_1", 4:"zone_basement_2", 3:"zone_sewers_stairs", 2:"zone_power_substation2", 1:"zone_power_substation", 0:"zone_hidden_lab"];
	level.var_65c43c31 = [15:"zone_power_substation2", 14:"zone_sewers_stairs", 13:"zone_power_substation", 12:"zone_hidden_lab", 11:"zone_secret_spy_tunnel", 10:"zone_sewers_and_escape_tunnel2", 9:"zone_sewers_and_escape_tunnel", 8:"zone_control_room", 7:"zone_basement_1", 6:"zone_basement_2", 5:"zone_ghost_station_4", 4:"zone_ghost_station_3", 3:"zone_ghost_station_2", 2:"zone_ghost_station", 1:"zone_ghost_station_stairs", 0:"zone_safe_house"];
	level.var_692bc53a = [4:"zone_ghost_station_stairs", 3:"zone_ghost_station_4", 2:"zone_ghost_station_3", 1:"zone_ghost_station_2", 0:"zone_ghost_station"];
	level.var_aeef5b56 = [14:"zone_bunny_club", 13:"zone_power_substation2", 12:"zone_sewers_stairs", 11:"zone_power_substation", 10:"zone_hidden_lab", 9:"zone_secret_spy_tunnel", 8:"zone_sewers_and_escape_tunnel2", 7:"zone_sewers_and_escape_tunnel", 6:"zone_control_room", 5:"zone_basement_2", 4:"zone_ghost_station_4", 3:"zone_ghost_station_3", 2:"zone_ghost_station_2", 1:"zone_ghost_station", 0:"zone_safe_house"];
	level thread zm_perks::spare_change();
	level thread function_e0a4ccda();
	level thread sndfunctions();
	namespace_99d0d95e::init();
	namespace_178eb32b::init();
	level thread function_859fa480(16);
	level thread function_32401229(11);
	level thread function_9e6f187d(25);
	level thread function_ae72b4d0(15);
	level thread function_b4a55178();
	level thread function_ae76beb4();
	level thread function_f37d9da7();
	level thread function_3297eca5();
	level thread function_8c581f55();
	level thread function_92d44ee0();
	level callback::on_revived(&on_player_revived);
	zm_player::register_player_damage_callback(&on_player_damaged);
	level thread namespace_47c5b560::function_470c9a51([0:"vol_ladder_east_berlin_street"]);
	level thread function_90cffb5b([3:"rappel_sewer_lower", 2:"rappel_sewer_upper", 1:"rappel_spy_tunnel_lower", 0:"rappel_spy_tunnel_upper"]);
	/#
		level thread function_cd7a3de4();
	#/
	/#
		level thread function_c13a2cf5();
	#/
	level thread function_4c86cc5();
	level thread function_66efff7a();
	namespace_9ff9f642::register_burn(#"hash_4c291cb570b90c2e", 6, 9999);
	level thread function_49fa8c75();
	level thread open_sesame_watcher();
	level.var_6103ecd9 = 15;
	level function_419047b9();
	level thread function_9feaaed();
	level.round_start_custom_func = &function_565ac641;
	level.round_end_custom_logic = &function_e0b47006;
	level.var_9d96d174 = 1;
	level thread function_9d23c457();
	level thread function_d888610a();
	zm_utility::function_89dbd679((-2802, 11162.2, 570), 96, 50, (-3038, 11230.2, 498.5), 256);
	zm_utility::function_89dbd679((-2627, 9895, 8), 96, 50, (-2594, 9919, 8), 96);
	level.player_out_of_playable_area_monitor_callback = &player_out_of_playable_area_monitor_callback;
	level thread function_a8a85013();
}

/*
	Name: function_a8a85013
	Namespace: namespace_3fa257af
	Checksum: 0x352B34B4
	Offset: 0x2D98
	Size: 0x164
	Parameters: 0
	Flags: None
*/
function function_a8a85013()
{
	spawncollision("collision_clip_512x512x512", "collider", (-201, 10865, 425), (0, 0, 0));
	spawncollision("collision_clip_256x256x256", "collider", (-2723, 11432, 363), (0, 0, 0));
	spawncollision("collision_slick_128x128x128", "collider", (-1646, 11636, 212), (0, 0, 0));
	spawncollision("collision_slick_128x128x128", "collider", (-1578, 11597, 238), vectorscale((0, 1, 0), 60.8));
	spawncollision("collision_clip_256x256x256", "collider", (-2553, 12467, 565), (0, 0, 0));
	spawncollision("collision_clip_wall_512x512x10", "collider", (-2597, 11344, 634), (0, 0, 0));
	spawncollision("collision_clip_wall_512x512x10", "collider", (-2597, 11196, 634), (0, 0, 0));
}

/*
	Name: function_565ac641
	Namespace: namespace_3fa257af
	Checksum: 0xB52E44
	Offset: 0x2F08
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_565ac641()
{
	level flag::set(#"hash_3dfd0dd4caef92a9");
}

/*
	Name: function_e0b47006
	Namespace: namespace_3fa257af
	Checksum: 0x97C3D71F
	Offset: 0x2F38
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_e0b47006()
{
	level flag::clear(#"hash_3dfd0dd4caef92a9");
}

/*
	Name: player_out_of_playable_area_monitor_callback
	Namespace: namespace_3fa257af
	Checksum: 0x8825E7DA
	Offset: 0x2F68
	Size: 0xF2
	Parameters: 0
	Flags: None
*/
function player_out_of_playable_area_monitor_callback()
{
	if(isdefined(self))
	{
		if((distance2dsquared(self.origin, (-2159.5, 13415, 115))) <= sqr(96) || (distance2dsquared(self.origin, (-1381.1, 13774, 206.4))) <= sqr(96) || (distance2dsquared(self.origin, (-2552.5, 11568.4, 56.2))) <= sqr(96))
		{
			return false;
		}
	}
	return true;
}

/*
	Name: function_452e5ad6
	Namespace: namespace_3fa257af
	Checksum: 0xA095BFDE
	Offset: 0x3068
	Size: 0x616
	Parameters: 0
	Flags: None
*/
function function_452e5ad6()
{
	self endon(#"disconnect");
	if(level flag::get(#"in_dark_side"))
	{
		var_1a672bba = struct::get_array("zone_bunny_club_respawn_points");
		s_player_spawn = array::random(var_1a672bba);
		return s_player_spawn;
	}
	spawn_points = zm_gametype::get_player_spawns_for_gametype();
	spawn_points = arraysortclosest(spawn_points, self.origin, undefined, 0, 2000);
	var_a6107c9 = array("zone_bunny_club");
	var_bdf9e3c2 = self zm_zonemgr::get_player_zone();
	a_adjacent_zones = level.zones[var_bdf9e3c2].adjacent_zones;
	var_d117c934 = [];
	if(isdefined(var_bdf9e3c2))
	{
		foreach(point in spawn_points)
		{
			if(isentity(level.var_22a21403) && !istouching(point.origin, level.var_22a21403))
			{
				continue;
			}
			if(!zm_zonemgr::zone_is_enabled(point.script_noteworthy) || isinarray(var_a6107c9, point.script_noteworthy))
			{
				continue;
			}
			if(isdefined(a_adjacent_zones) && a_adjacent_zones.size > 0)
			{
				var_1d4c3ee8 = zm_zonemgr::get_zone_from_position(point.origin);
				if(!isinarray(a_adjacent_zones, var_1d4c3ee8) && var_1d4c3ee8 != var_bdf9e3c2)
				{
					continue;
				}
			}
			else
			{
				var_1d4c3ee8 = zm_zonemgr::get_zone_from_position(point.origin);
				if(var_1d4c3ee8 != var_bdf9e3c2)
				{
					continue;
				}
			}
			if(!isdefined(var_d117c934))
			{
				var_d117c934 = [];
			}
			else if(!isarray(var_d117c934))
			{
				var_d117c934 = array(var_d117c934);
			}
			if(!isinarray(var_d117c934, point))
			{
				var_d117c934[var_d117c934.size] = point;
			}
		}
	}
	if(var_d117c934.size == 0)
	{
		foreach(point in spawn_points)
		{
			if(isentity(level.var_22a21403) && !istouching(point.origin, level.var_22a21403))
			{
				continue;
			}
			if(!zm_zonemgr::zone_is_enabled(point.script_noteworthy) || isinarray(var_a6107c9, point.script_noteworthy))
			{
				continue;
			}
			if(!isdefined(var_d117c934))
			{
				var_d117c934 = [];
			}
			else if(!isarray(var_d117c934))
			{
				var_d117c934 = array(var_d117c934);
			}
			if(!isinarray(var_d117c934, point))
			{
				var_d117c934[var_d117c934.size] = point;
			}
		}
	}
	var_7fc5b7c3 = arraysortclosest(var_d117c934, self.origin, 20, 0, 2000);
	var_5d59bb63 = arraysortclosest(var_d117c934, self.origin, 20, 1000, 2000);
	if(isarray(level.var_fe1757e7))
	{
		var_5d59bb63 = arraycombine(var_5d59bb63, level.var_fe1757e7);
	}
	var_1a672bba = (var_5d59bb63.size ? var_5d59bb63 : var_7fc5b7c3);
	s_player_spawn = array::random(var_1a672bba);
	if(s_player_spawn.script_noteworthy === #"zone_ghost_station_2")
	{
		s_player_spawn.origin = (-2335.62, 11589.8, -278);
	}
	if(s_player_spawn.script_noteworthy === #"zone_ghost_station_3")
	{
		s_player_spawn.origin = (-2481.43, 11584.8, -285);
	}
	if(s_player_spawn.script_noteworthy === #"zone_ghost_station_4")
	{
		s_player_spawn.origin = (-1209.13, 11597.9, -284.75);
	}
	return s_player_spawn;
}

/*
	Name: function_a0f98b8b
	Namespace: namespace_3fa257af
	Checksum: 0xB6AB96E5
	Offset: 0x3688
	Size: 0x5C
	Parameters: 2
	Flags: None
*/
function function_a0f98b8b(a_ents, str_shot)
{
	if(str_shot === "sh010")
	{
		level util::set_lighting_state(1);
	}
	else
	{
		level util::set_lighting_state(0);
	}
}

/*
	Name: on_player_spawned
	Namespace: namespace_3fa257af
	Checksum: 0x93BE90B3
	Offset: 0x36F0
	Size: 0x64
	Parameters: 0
	Flags: None
*/
function on_player_spawned()
{
	self thread function_bf14bffe();
	self thread function_20ad9d07();
	self thread function_833114ef();
	self thread function_512d6468();
}

/*
	Name: function_512d6468
	Namespace: namespace_3fa257af
	Checksum: 0xB148BFC8
	Offset: 0x3760
	Size: 0x11E
	Parameters: 0
	Flags: None
*/
function function_512d6468()
{
	self endon(#"death");
	while(true)
	{
		util::waittill_any_ents(self, "zone_change", level, "end_of_round");
		if(self.cached_zone_name === "zone_no_mans_land_2" || self.cached_zone_name === "zone_no_mans_land_3")
		{
			var_b7f7d612 = level.round_number;
			while(self.cached_zone_name === "zone_no_mans_land_2" || self.cached_zone_name === "zone_no_mans_land_3")
			{
				util::waittill_any_ents(self, "zone_change", level, "end_of_round");
				if((level.round_number - var_b7f7d612) >= 5)
				{
					self zm_stats::increment_challenge_stat(#"hash_53f2c142041511ec");
					return;
				}
			}
		}
	}
}

/*
	Name: function_833114ef
	Namespace: namespace_3fa257af
	Checksum: 0xA7E8D09B
	Offset: 0x3888
	Size: 0xF8
	Parameters: 0
	Flags: None
*/
function function_833114ef()
{
	self endon(#"death");
	level flag::wait_till("start_zombie_round_logic");
	while(true)
	{
		self clientfield::set("" + #"hash_1fb207d10fbe27ce", 1);
		util::wait_network_frame();
		level flag::wait_till("power_on");
		self clientfield::set("" + #"hash_1fb207d10fbe27ce", 0);
		util::wait_network_frame();
		level flag::wait_till_clear("power_on");
	}
}

/*
	Name: function_bf14bffe
	Namespace: namespace_3fa257af
	Checksum: 0xC1EAF9D0
	Offset: 0x3988
	Size: 0x1F6
	Parameters: 0
	Flags: None
*/
function function_bf14bffe()
{
	self endon(#"death", #"disconnect", #"hash_7f3f3b496fcd3707");
	level flag::wait_till_all([1:#"intro_scene_done", 0:#"load_main_complete"]);
	while(true)
	{
		var_1e8cb595 = bullettracepassed(self.origin, self.origin + vectorscale((0, 0, 1), 10000), 0, self);
		if(var_1e8cb595 && !self flag::get(#"hash_1561f2d74277f5a1") && !is_true(self.var_16735873))
		{
			self flag::set(#"hash_1561f2d74277f5a1");
			self clientfield::set_to_player("" + #"hash_7c5d3ac35353f95c", 1);
		}
		else if(!var_1e8cb595 && self flag::get(#"hash_1561f2d74277f5a1"))
		{
			self flag::clear(#"hash_1561f2d74277f5a1");
			self clientfield::set_to_player("" + #"hash_7c5d3ac35353f95c", 0);
		}
		wait(3);
	}
}

/*
	Name: function_4af68b
	Namespace: namespace_3fa257af
	Checksum: 0x9D5E73FD
	Offset: 0x3B88
	Size: 0xE0
	Parameters: 0
	Flags: None
*/
function function_4af68b()
{
	foreach(player in getplayers())
	{
		player notify(#"hash_7f3f3b496fcd3707");
		player flag::clear(#"hash_1561f2d74277f5a1");
		player clientfield::set_to_player("" + #"hash_7c5d3ac35353f95c", 0);
	}
}

/*
	Name: offhand_weapon_overrride
	Namespace: namespace_3fa257af
	Checksum: 0x3ED2F685
	Offset: 0x3C70
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function offhand_weapon_overrride()
{
	zm_loadout::register_tactical_grenade_for_level(#"zhield_dw", 1);
}

/*
	Name: offhand_weapon_give_override
	Namespace: namespace_3fa257af
	Checksum: 0x719B1904
	Offset: 0x3CA8
	Size: 0xC6
	Parameters: 1
	Flags: None
*/
function offhand_weapon_give_override(str_weapon)
{
	self endon(#"death");
	if(zm_loadout::is_tactical_grenade(str_weapon) && isdefined(self zm_loadout::get_player_tactical_grenade()) && !self zm_loadout::is_player_tactical_grenade(str_weapon))
	{
		self setweaponammoclip(self zm_loadout::get_player_tactical_grenade(), 0);
		self takeweapon(self zm_loadout::get_player_tactical_grenade());
	}
	return false;
}

/*
	Name: function_e0a4ccda
	Namespace: namespace_3fa257af
	Checksum: 0x43F4935F
	Offset: 0x3D78
	Size: 0x3C
	Parameters: 0
	Flags: None
*/
function function_e0a4ccda()
{
	level clientfield::set("" + #"hash_7d7dcebcb0511b14", 1);
}

/*
	Name: sndfunctions
	Namespace: namespace_3fa257af
	Checksum: 0xF7C553DF
	Offset: 0x3DC0
	Size: 0x54
	Parameters: 0
	Flags: None
*/
function sndfunctions()
{
	zm_utility::add_sound("zmb_heavy_door_open", "zmb_heavy_door_open");
	level thread setup_personality_character_exerts();
	level thread setupmusic();
}

/*
	Name: setup_personality_character_exerts
	Namespace: namespace_3fa257af
	Checksum: 0x4E039ADB
	Offset: 0x3E20
	Size: 0x3C2
	Parameters: 0
	Flags: None
*/
function setup_personality_character_exerts()
{
	level.exert_sounds[1][#"hitmed"] = "vox_plr_1_exert_pain";
	level.exert_sounds[2][#"hitmed"] = "vox_plr_2_exert_pain";
	level.exert_sounds[3][#"hitmed"] = "vox_plr_3_exert_pain";
	level.exert_sounds[4][#"hitmed"] = "vox_plr_4_exert_pain";
	level.exert_sounds[1][#"hitlrg"] = "vox_plr_1_exert_pain";
	level.exert_sounds[2][#"hitlrg"] = "vox_plr_2_exert_pain";
	level.exert_sounds[3][#"hitlrg"] = "vox_plr_2_exert_pain";
	level.exert_sounds[4][#"hitlrg"] = "vox_plr_3_exert_pain";
	level.exert_sounds[1][#"drowning"] = "vox_plr_1_exert_underwater_air_low";
	level.exert_sounds[2][#"drowning"] = "vox_plr_2_exert_underwater_air_low";
	level.exert_sounds[3][#"drowning"] = "vox_plr_3_exert_underwater_air_low";
	level.exert_sounds[4][#"drowning"] = "vox_plr_4_exert_underwater_air_low";
	level.exert_sounds[1][#"cough"] = "vox_plr_1_exert_gas_cough";
	level.exert_sounds[2][#"cough"] = "vox_plr_2_exert_gas_cough";
	level.exert_sounds[3][#"cough"] = "vox_plr_3_exert_gas_cough";
	level.exert_sounds[4][#"cough"] = "vox_plr_4_exert_gas_cough";
	level.exert_sounds[1][#"underwater_emerge"] = "vox_plr_1_exert_underwater_emerge_breath";
	level.exert_sounds[2][#"underwater_emerge"] = "vox_plr_2_exert_underwater_emerge_breath";
	level.exert_sounds[3][#"underwater_emerge"] = "vox_plr_3_exert_underwater_emerge_breath";
	level.exert_sounds[4][#"underwater_emerge"] = "vox_plr_4_exert_underwater_emerge_breath";
	level.exert_sounds[1][#"underwater_gasp"] = "vox_plr_1_exert_underwater_emerge_gasp";
	level.exert_sounds[2][#"underwater_gasp"] = "vox_plr_2_exert_underwater_emerge_gasp";
	level.exert_sounds[3][#"underwater_gasp"] = "vox_plr_3_exert_underwater_emerge_gasp";
	level.exert_sounds[4][#"underwater_gasp"] = "vox_plr_4_exert_underwater_emerge_gasp";
}

/*
	Name: setupmusic
	Namespace: namespace_3fa257af
	Checksum: 0x7409D654
	Offset: 0x41F0
	Size: 0x1BC
	Parameters: 0
	Flags: None
*/
function setupmusic()
{
	zm_audio::musicstate_create("round_start_first", 3, "round_start_first");
	zm_audio::musicstate_create("round_start", 3, "round_start_00", "round_start_01", "round_start_02");
	zm_audio::musicstate_create("round_end", 3, "round_end_00", "round_end_01", "round_end_02");
	zm_audio::musicstate_create("round_start_special", 3, "round_start_special_00");
	zm_audio::musicstate_create("round_end_special", 3, "round_end_special_00");
	zm_audio::musicstate_create("game_over", 5, "gameover_platinum");
	zm_audio::musicstate_create("ee_song", 4, "ee_song");
	zm_audio::musicstate_create("papevent", 4, "papevent");
	zm_audio::function_e441162b("papevent");
	zm_audio::musicstate_create("tribes", 4, "tribes");
	zm_audio::function_e441162b("tribes");
}

/*
	Name: function_65c65feb
	Namespace: namespace_3fa257af
	Checksum: 0xEBA9C05E
	Offset: 0x43B8
	Size: 0x178
	Parameters: 1
	Flags: None
*/
function function_65c65feb(b_active)
{
	if(!isdefined(b_active))
	{
		b_active = 0;
	}
	if(b_active)
	{
		foreach(player in getplayers())
		{
			player clientfield::set_to_player("" + #"hash_4be33f9c734f0cb9", 2);
		}
	}
	else
	{
		foreach(player in getplayers())
		{
			player clientfield::set_to_player("" + #"hash_4be33f9c734f0cb9", 3);
		}
	}
}

/*
	Name: function_23c31b4e
	Namespace: namespace_3fa257af
	Checksum: 0xF8D99DEB
	Offset: 0x4538
	Size: 0xBC
	Parameters: 0
	Flags: None
*/
function function_23c31b4e()
{
	if(is_true(self.is_hotjoining) || self util::is_spectating())
	{
		return;
	}
	self endoncallback(&namespace_207ea311::function_31b6f21e, #"death");
	if(!isdefined(self.var_19f4406e))
	{
		self.var_19f4406e = 0;
	}
	self thread function_6e0fa6eb();
	self thread function_6cb44e03();
	self function_3ba2978d();
}

/*
	Name: function_6e0fa6eb
	Namespace: namespace_3fa257af
	Checksum: 0x8FDAF78D
	Offset: 0x4600
	Size: 0x132
	Parameters: 0
	Flags: None
*/
function function_6e0fa6eb()
{
	self endon(#"death", #"disconnect");
	while(true)
	{
		if(!is_true(self.var_eddb113e) && (self actionslotonebuttonpressed() || self buttonbitstate("BUTTON_BIT_FLASHLIGHT")) && !self clientfield::get_player_uimodel("hudItems.srOverlayOpen"))
		{
			var_ba127c46 = (is_true(self.var_c6af46f9) ? 2 : 1) + 1;
			self.var_19f4406e = (self.var_19f4406e + 1) % var_ba127c46;
			self flag::set(#"hash_2d6980738132f263");
			wait(0.5);
		}
		else
		{
			waitframe(1);
		}
	}
}

/*
	Name: function_3ba2978d
	Namespace: namespace_3fa257af
	Checksum: 0xFE43C1BC
	Offset: 0x4740
	Size: 0x4E0
	Parameters: 0
	Flags: None
*/
function function_3ba2978d()
{
	level endon(#"hash_31a61be99d69708a");
	level flag::wait_till_all([2:"start_zombie_round_logic", 1:"all_players_spawned", 0:#"intro_scene_done"]);
	wait(1);
	if(!level flag::get("power_on"))
	{
		self thread zm_equipment::show_hint_text(#"hash_77929503066a286b", 5);
		self flag::wait_till_timeout(5, #"hash_2d6980738132f263");
		self thread zm_equipment::function_57fbff5c();
		self flag::clear(#"hash_2d6980738132f263");
	}
	while(true)
	{
		var_a08cd817 = self flag::get(#"hash_2d6980738132f263");
		if(!var_a08cd817)
		{
			if(level flag::get("power_on"))
			{
				var_cef36b49 = self zm_zonemgr::is_player_in_zone(level.var_666d1958);
			}
			else
			{
				var_cef36b49 = self zm_zonemgr::is_player_in_zone(level.var_b80c4ecc);
			}
			self.var_19f4406e = (var_cef36b49 ? 1 : 0);
		}
		switch(self.var_19f4406e)
		{
			case 0:
			case 1:
			{
				if(!self flag::get(#"hash_8b791c5e5b0b269") && !self flag::get(#"hash_7fb35d12e64cf793"))
				{
					self clientfield::set("" + #"hash_63af42145e260fb5", self.var_19f4406e);
					self clientfield::set_to_player("" + #"hash_6d58634b9c00e983", 0);
				}
				else
				{
					self clientfield::set("" + #"hash_63af42145e260fb5", 0);
					self clientfield::set_to_player("" + #"hash_6d58634b9c00e983", 0);
				}
				break;
			}
			case 2:
			{
				if(!self flag::get(#"hash_8b791c5e5b0b269") && !self flag::get(#"hash_7fb35d12e64cf793"))
				{
					self clientfield::set("" + #"hash_63af42145e260fb5", 3);
					self clientfield::set_to_player("" + #"hash_6d58634b9c00e983", 1);
				}
				else
				{
					self clientfield::set("" + #"hash_63af42145e260fb5", 0);
					self clientfield::set_to_player("" + #"hash_6d58634b9c00e983", 0);
				}
				break;
			}
		}
		if(var_a08cd817)
		{
			util::waittill_any_ents(self, #"hash_2d6980738132f263", self, #"hash_8b791c5e5b0b269", self, #"hash_7fb35d12e64cf793");
		}
		else
		{
			util::waittill_any_ents(self, "zone_change", level, "power_on", self, #"hash_2d6980738132f263", self, #"hash_8b791c5e5b0b269", self, #"hash_7fb35d12e64cf793");
		}
	}
}

/*
	Name: function_6cb44e03
	Namespace: namespace_3fa257af
	Checksum: 0xF246D19
	Offset: 0x4C28
	Size: 0x98
	Parameters: 0
	Flags: Private
*/
function private function_6cb44e03()
{
	self endon(#"death", #"disconnect");
	while(true)
	{
		if(self isonladder())
		{
			self flag::set(#"hash_8b791c5e5b0b269");
		}
		else
		{
			self flag::clear(#"hash_8b791c5e5b0b269");
		}
		wait(0.5);
	}
}

/*
	Name: function_6f6cc58
	Namespace: namespace_3fa257af
	Checksum: 0x7CF12E7A
	Offset: 0x4CC8
	Size: 0x352
	Parameters: 1
	Flags: None
*/
function function_6f6cc58(e_player)
{
	if(isdefined(self) && isdefined(e_player))
	{
		if(self.archetype === #"zombie" || self.archetype === #"tormentor")
		{
			if(isplayer(e_player))
			{
				if(isdefined(self.v_zombie_custom_goal_pos) && isdefined(self.var_29656770))
				{
					return 1;
				}
				zone_path = zm_zonemgr::function_54fc7938(e_player, self);
				return isdefined(zone_path);
			}
			return 1;
		}
		if(isplayer(e_player) && self.archetype === #"soa")
		{
			zone_path = zm_zonemgr::function_54fc7938(e_player, self);
			zipline = zm_ai_soa::function_4a3e695a(self, e_player);
			if(isdefined(zipline) || isdefined(zone_path))
			{
				return 1;
			}
			if(distance2dsquared(self.origin, e_player.origin) < sqr(500))
			{
				return 1;
			}
			return 0;
		}
		if(isplayer(e_player) && self.archetype === #"mechz")
		{
			if(!is_true(self.var_7c4488fd))
			{
				var_1ea000f7 = [2:"zone_american_sector_left_building", 1:"zone_american_sector_right_building", 0:"zone_american_sector_street"];
				zone_name = self zm_utility::get_current_zone();
				if(!isdefined(zone_name))
				{
					zone_name = self.var_5e54763a;
				}
				zone_path = zm_zonemgr::function_54fc7938(e_player, zone_name);
				if(isinarray(var_1ea000f7, zone_name))
				{
					var_b41144a7 = isdefined(zone_path) && (!isdefined(zone_path.to_zone) || !isinarray(var_1ea000f7, zone_path.to_zone));
					if(!var_b41144a7 && !isdefined(self.var_cc1c538e))
					{
						self.zone_name = zone_name;
						self.var_11f7a9af = 1;
						self.var_cc1c538e = zm_cleanup::get_escape_position_in_current_zone();
					}
					return var_b41144a7;
				}
				self.var_11f7a9af = undefined;
				return isdefined(zone_path);
			}
			return 1;
		}
		return 1;
	}
	return 0;
}

/*
	Name: function_b4a55178
	Namespace: namespace_3fa257af
	Checksum: 0xC09F57FE
	Offset: 0x5028
	Size: 0x44
	Parameters: 0
	Flags: Private
*/
function private function_b4a55178()
{
	level.fn_custom_zombie_spawner_selection = &function_ddc13fd6;
	level.zombie_spawners = array::sort_by_script_int(level.zombie_spawners, 1);
}

/*
	Name: function_ddc13fd6
	Namespace: namespace_3fa257af
	Checksum: 0x1EE26431
	Offset: 0x5078
	Size: 0x314
	Parameters: 0
	Flags: None
*/
function function_ddc13fd6()
{
	wait(randomfloatrange(0.15, 0.25));
	s_loc = array::random(level.zm_loc_types[#"zombie_location"]);
	var_87e4f82c = randomintrange(0, 100);
	var_b62ee10a = [0:0];
	if(level.round_number >= 13 || level flag::get(#"hash_5fff608f0c23a53f"))
	{
		if(var_87e4f82c <= 5)
		{
			if(level.round_number < 30 && !level flag::get(#"hash_14ac8b5a5e403984"))
			{
				return level.zombie_spawners[2];
			}
			if(math::cointoss())
			{
				return level.zombie_spawners[3];
			}
			return level.zombie_spawners[2];
		}
	}
	if(var_87e4f82c <= 20)
	{
		return level.zombie_spawners[1];
	}
	if(level flag::get(#"hash_6e41f0a5d92ae86b"))
	{
		if(!isdefined(var_b62ee10a))
		{
			var_b62ee10a = [];
		}
		else if(!isarray(var_b62ee10a))
		{
			var_b62ee10a = array(var_b62ee10a);
		}
		var_b62ee10a[var_b62ee10a.size] = 6;
	}
	if(isdefined(s_loc) && isdefined(s_loc.zone_name))
	{
		if(isinarray(level.var_57c0b4c1, s_loc.zone_name))
		{
			if(!isdefined(var_b62ee10a))
			{
				var_b62ee10a = [];
			}
			else if(!isarray(var_b62ee10a))
			{
				var_b62ee10a = array(var_b62ee10a);
			}
			var_b62ee10a[var_b62ee10a.size] = 4;
		}
		if(!isinarray(level.var_28a7d418, s_loc.zone_name))
		{
			if(!isdefined(var_b62ee10a))
			{
				var_b62ee10a = [];
			}
			else if(!isarray(var_b62ee10a))
			{
				var_b62ee10a = array(var_b62ee10a);
			}
			var_b62ee10a[var_b62ee10a.size] = 5;
		}
	}
	return level.zombie_spawners[array::random(var_b62ee10a)];
}

/*
	Name: function_859fa480
	Namespace: namespace_3fa257af
	Checksum: 0x35CE550A
	Offset: 0x5398
	Size: 0x84
	Parameters: 1
	Flags: Private
*/
function private function_859fa480(n_round)
{
	zm_round_spawning::function_306ce518(#"mechz", &function_5e8a178a);
	level.var_1db9948 = n_round;
	zm_round_spawning::function_cc103b38(#"mechz", n_round);
	level.var_e333bf92 = &function_65c98960;
}

/*
	Name: function_32401229
	Namespace: namespace_3fa257af
	Checksum: 0x14F16068
	Offset: 0x5428
	Size: 0xB4
	Parameters: 1
	Flags: Private
*/
function private function_32401229(n_round)
{
	zm_round_spawning::function_2876740e(#"soa", &function_76a7a9ef);
	zm_round_spawning::function_306ce518(#"soa", &function_2927859c);
	level.var_a1c6ba48 = n_round;
	zm_round_spawning::function_cc103b38(#"soa", n_round);
	level.var_194823e7 = &function_41a4961d;
}

/*
	Name: function_9e6f187d
	Namespace: namespace_3fa257af
	Checksum: 0x2A022FBE
	Offset: 0x54E8
	Size: 0xB4
	Parameters: 1
	Flags: Private
*/
function private function_9e6f187d(n_round)
{
	zm_round_spawning::function_2876740e(#"raz", &function_d4f11e3c);
	zm_round_spawning::function_306ce518(#"raz", &function_f1355240);
	level.var_36678664 = n_round;
	zm_round_spawning::function_376e51ef(#"raz", n_round);
	level.var_2e33420c = &function_218424b3;
}

/*
	Name: function_ae72b4d0
	Namespace: namespace_3fa257af
	Checksum: 0xE953703A
	Offset: 0x55A8
	Size: 0x5C
	Parameters: 1
	Flags: Private
*/
function private function_ae72b4d0(n_round)
{
	zm_round_spawning::function_2876740e(#"tormentor", &function_44d45595);
	zm_round_spawning::function_376e51ef(#"tormentor", n_round);
}

/*
	Name: function_65c98960
	Namespace: namespace_3fa257af
	Checksum: 0x6BFF525
	Offset: 0x5610
	Size: 0xBA
	Parameters: 1
	Flags: None
*/
function function_65c98960(get_all)
{
	if(!isdefined(get_all))
	{
		get_all = 0;
	}
	if(isdefined(level.zm_loc_types[#"mechz_location"]) && level.zm_loc_types[#"mechz_location"].size)
	{
		if(get_all)
		{
			s_spawn_loc = level.zm_loc_types[#"mechz_location"];
		}
		else
		{
			s_spawn_loc = array::random(level.zm_loc_types[#"mechz_location"]);
		}
	}
	return s_spawn_loc;
}

/*
	Name: function_41a4961d
	Namespace: namespace_3fa257af
	Checksum: 0xB7B64879
	Offset: 0x56D8
	Size: 0x382
	Parameters: 1
	Flags: None
*/
function function_41a4961d(get_all)
{
	if(!isdefined(get_all))
	{
		get_all = 0;
	}
	if(isdefined(level.zm_loc_types[#"hash_6e9ce9c1beaea349"]) && level.zm_loc_types[#"hash_6e9ce9c1beaea349"].size)
	{
		if(get_all)
		{
			s_spawn_loc = level.zm_loc_types[#"hash_6e9ce9c1beaea349"];
		}
		else
		{
			locs = level.zm_loc_types[#"hash_6e9ce9c1beaea349"];
			if(getplayers().size > 1)
			{
				var_a6c95035 = [];
				var_b0becd1e = namespace_19c99142::function_a64f7068();
				if(!isdefined(var_b0becd1e))
				{
					return undefined;
				}
				var_5f3b05e8 = var_b0becd1e zm_zonemgr::get_player_zone();
				if(!isdefined(var_5f3b05e8))
				{
					return undefined;
				}
				target_zone = level.zones[var_5f3b05e8];
				var_24f5d9f8 = array(target_zone.name);
				a_str_adj_zones = getarraykeys(target_zone.adjacent_zones);
				foreach(str_zone in a_str_adj_zones)
				{
					if(target_zone.adjacent_zones[str_zone].is_connected)
					{
						if(!isdefined(var_24f5d9f8))
						{
							var_24f5d9f8 = [];
						}
						else if(!isarray(var_24f5d9f8))
						{
							var_24f5d9f8 = array(var_24f5d9f8);
						}
						var_24f5d9f8[var_24f5d9f8.size] = str_zone;
					}
				}
				foreach(loc in locs)
				{
					if(array::contains(var_24f5d9f8, loc.zone_name))
					{
						if(!isdefined(var_a6c95035))
						{
							var_a6c95035 = [];
						}
						else if(!isarray(var_a6c95035))
						{
							var_a6c95035 = array(var_a6c95035);
						}
						var_a6c95035[var_a6c95035.size] = loc;
					}
				}
				if(var_a6c95035.size === 0)
				{
					var_a6c95035 = locs;
				}
				s_spawn_loc = array::random(var_a6c95035);
			}
			else
			{
				s_spawn_loc = array::random(locs);
			}
		}
	}
	return s_spawn_loc;
}

/*
	Name: function_218424b3
	Namespace: namespace_3fa257af
	Checksum: 0x4C811D55
	Offset: 0x5A68
	Size: 0xBA
	Parameters: 1
	Flags: None
*/
function function_218424b3(get_all)
{
	if(!isdefined(get_all))
	{
		get_all = 0;
	}
	if(isdefined(level.zm_loc_types[#"hash_6e9ce9c1beaea349"]) && level.zm_loc_types[#"hash_6e9ce9c1beaea349"].size)
	{
		if(get_all)
		{
			s_spawn_loc = level.zm_loc_types[#"hash_6e9ce9c1beaea349"];
		}
		else
		{
			s_spawn_loc = array::random(level.zm_loc_types[#"hash_6e9ce9c1beaea349"]);
		}
	}
	return s_spawn_loc;
}

/*
	Name: function_d9f5ec34
	Namespace: namespace_3fa257af
	Checksum: 0x99D3CC02
	Offset: 0x5B30
	Size: 0xBA
	Parameters: 1
	Flags: None
*/
function function_d9f5ec34(get_all)
{
	if(!isdefined(get_all))
	{
		get_all = 0;
	}
	if(isdefined(level.zm_loc_types[#"hash_6e9ce9c1beaea349"]) && level.zm_loc_types[#"hash_6e9ce9c1beaea349"].size)
	{
		if(get_all)
		{
			s_spawn_loc = level.zm_loc_types[#"hash_6e9ce9c1beaea349"];
		}
		else
		{
			s_spawn_loc = array::random(level.zm_loc_types[#"hash_6e9ce9c1beaea349"]);
		}
	}
	return s_spawn_loc;
}

/*
	Name: function_ae76beb4
	Namespace: namespace_3fa257af
	Checksum: 0xCB5D9B2D
	Offset: 0x5BF8
	Size: 0xFC
	Parameters: 0
	Flags: None
*/
function function_ae76beb4()
{
	level endon(#"end_game");
	level flag::wait_till("start_zombie_round_logic");
	level flag::wait_till(#"hash_61e50ad0c8b499c0");
	wait(2);
	var_9ad9e33b = struct::get("charlie_rubble", "targetname");
	util::spawn_model(#"hash_73d31ba007bb147d", var_9ad9e33b.origin, var_9ad9e33b.angles);
	var_69708f86 = getentarray("charlie_razorwire", "targetname");
	array::delete_all(var_69708f86);
}

/*
	Name: function_f37d9da7
	Namespace: namespace_3fa257af
	Checksum: 0x544957D7
	Offset: 0x5D00
	Size: 0x244
	Parameters: 0
	Flags: None
*/
function function_f37d9da7()
{
	level endon(#"end_game");
	level flag::wait_till("start_zombie_round_logic");
	var_df192c8d = getent("manhole_cover_navmesh", "targetname");
	var_23a64dc = getnodearray("manhole_cover_connect_navmesh_node", "targetname");
	var_df192c8d setmovingplatformenabled(1);
	waitframe(1);
	foreach(node in var_23a64dc)
	{
		linktraversal(node);
	}
	level flag::wait_till(#"connect_east_berlin_street_to_ghost_station2");
	foreach(node in var_23a64dc)
	{
		unlinktraversal(node);
	}
	var_df192c8d setmovingplatformenabled(0);
	var_df192c8d disconnectpaths();
	var_df192c8d ghost();
	var_df192c8d notsolid();
	level thread function_d47fe1d8(var_df192c8d);
}

/*
	Name: function_d47fe1d8
	Namespace: namespace_3fa257af
	Checksum: 0x58FFB58B
	Offset: 0x5F50
	Size: 0x1C4
	Parameters: 1
	Flags: None
*/
function function_d47fe1d8(var_df192c8d)
{
	level endon(#"game_ended");
	zombies = getaiarchetypearray(#"zombie", level.zombie_team);
	origin = var_df192c8d getcentroid();
	zombies = function_72d3bca6(zombies, origin, undefined, undefined, 128);
	foreach(zombie in zombies)
	{
		if(isalive(zombie) && distance2dsquared(zombie.origin, origin) < sqr(100))
		{
			zombie zm_cleanup::cleanup_zombie(1);
			if(isdefined(zombie))
			{
				gibserverutils::annihilate(zombie);
			}
		}
	}
	if(!isdefined(var_df192c8d))
	{
		return;
	}
	var_df192c8d delete();
}

/*
	Name: function_3297eca5
	Namespace: namespace_3fa257af
	Checksum: 0x5BFCDEE3
	Offset: 0x6120
	Size: 0xAC
	Parameters: 0
	Flags: None
*/
function function_3297eca5()
{
	level endon(#"end_game");
	level flag::wait_till("start_zombie_round_logic");
	var_f6042708 = getnode("market_window_node", "targetname");
	unlinktraversal(var_f6042708);
	level flag::wait_till("power_on");
	linktraversal(var_f6042708);
}

/*
	Name: function_8c581f55
	Namespace: namespace_3fa257af
	Checksum: 0x9CDD77EB
	Offset: 0x61D8
	Size: 0x6C4
	Parameters: 0
	Flags: Private
*/
function private function_8c581f55()
{
	level endon(#"end_game");
	level thread function_850f10bc();
	level.var_e1b1f602 = struct::get("p9_fxainm_zm_platinum_ghost_train_south", "scriptbundlename");
	level.var_d05c528b = struct::get("p9_fxanim_zm_platinum_ghost_train_north", "scriptbundlename");
	level.var_3c41ed40 = struct::get("p9_fxainm_zm_platinum_ghost_train_south_sewer", "scriptbundlename");
	level.var_93504ea8 = struct::get("p9_fxanim_zm_platinum_ghost_train_north_sewer", "scriptbundlename");
	scene::add_scene_func(#"p9_fxainm_zm_platinum_ghost_train_south", &function_388594e2, "play");
	scene::add_scene_func(#"p9_fxanim_zm_platinum_ghost_train_north", &function_adcf116f, "play");
	scene::add_scene_func(#"p9_fxainm_zm_platinum_ghost_train_south_sewer", &function_388594e2, "play");
	scene::add_scene_func(#"p9_fxanim_zm_platinum_ghost_train_north_sewer", &function_adcf116f, "play");
	scene::add_scene_func(#"p9_fxainm_zm_platinum_ghost_train_south", &function_1ad17524, "done");
	scene::add_scene_func(#"p9_fxanim_zm_platinum_ghost_train_north", &function_5d303617, "done");
	scene::add_scene_func(#"p9_fxainm_zm_platinum_ghost_train_south_sewer", &function_1ad17524, "done");
	scene::add_scene_func(#"p9_fxanim_zm_platinum_ghost_train_north_sewer", &function_5d303617, "done");
	level.var_3daf2eb1 = struct::get("first_ghost_train_trigger", "targetname");
	level.var_2b758a3e = struct::get("first_ghost_train_trigger_02", "targetname");
	level.var_dd757193 = getentarray("train_clip_south", "targetname");
	level.var_4075a99d = getentarray("train_clip_north", "targetname");
	level.var_520a143d = struct::get_array("train_hit_down_loc", "targetname");
	while(!level flag::get(#"hash_69bc64a0ea76c1b9"))
	{
		if(!level flag::get(#"hash_13cd183e1c6cadd2"))
		{
			a_players = function_a1ef346b();
			foreach(player in a_players)
			{
				if(player zm_zonemgr::is_player_in_zone(level.var_65c43c31))
				{
					if(distancesquared(player.origin, level.var_3daf2eb1.origin) < 562500 || distancesquared(player.origin, level.var_2b758a3e.origin) < 562500)
					{
						level flag::set(#"hash_69bc64a0ea76c1b9");
						break;
					}
				}
			}
		}
		wait(1);
	}
	level.var_f528a88c = gettime();
	level.var_b458389e = gettime() + (int(1 * 1000));
	while(true)
	{
		if(!level flag::get(#"hash_13cd183e1c6cadd2") && level flag::get(#"hash_69bc64a0ea76c1b9") && !level flag::get(#"hash_59a4499797529045"))
		{
			if(gettime() > level.var_f528a88c)
			{
				function_bf105732();
				level.var_f528a88c = gettime() + (randomfloatrange(int(120 * 1000), int(180 * 1000)));
			}
			if(gettime() > level.var_b458389e)
			{
				function_bf105732(0);
				level.var_b458389e = gettime() + (randomfloatrange(int(120 * 1000), int(180 * 1000)));
			}
		}
		wait(0.1);
	}
}

/*
	Name: function_92d44ee0
	Namespace: namespace_3fa257af
	Checksum: 0x6033B2F2
	Offset: 0x68A8
	Size: 0x54
	Parameters: 0
	Flags: None
*/
function function_92d44ee0()
{
	level endon(#"end_game");
	level flag::wait_till("start_zombie_round_logic");
	level scene::play(#"hash_25ac32fd2e8d74b0");
}

/*
	Name: function_850f10bc
	Namespace: namespace_3fa257af
	Checksum: 0xFAC76FFF
	Offset: 0x6908
	Size: 0xA4
	Parameters: 0
	Flags: None
*/
function function_850f10bc()
{
	level endon(#"end_game");
	level clientfield::set("" + #"hash_2a6acb420c3bb07e", 1);
	level flag::wait_till(#"hash_7632e33ae2122338");
	level clientfield::set("" + #"hash_43c03ae4aff2ba0", 1);
}

/*
	Name: function_18a5cf8b
	Namespace: namespace_3fa257af
	Checksum: 0xAF548627
	Offset: 0x69B8
	Size: 0x120
	Parameters: 1
	Flags: None
*/
function function_18a5cf8b(a_zombies)
{
	if(!isdefined(a_zombies))
	{
		a_zombies = [];
	}
	else if(!isarray(a_zombies))
	{
		a_zombies = array(a_zombies);
	}
	foreach(zombie in a_zombies)
	{
		if(isalive(zombie))
		{
			zombie ghost();
			zombie dontinterpolate();
			zombie thread function_3e1598cc(0.25);
		}
	}
}

/*
	Name: function_3e1598cc
	Namespace: namespace_3fa257af
	Checksum: 0x1BCFEFB1
	Offset: 0x6AE0
	Size: 0x64
	Parameters: 1
	Flags: Private
*/
function private function_3e1598cc(delay_time)
{
	if(!isdefined(delay_time))
	{
		delay_time = 0.25;
	}
	level endon(#"end_game");
	wait(delay_time);
	if(isalive(self))
	{
		self show();
	}
}

/*
	Name: function_bf105732
	Namespace: namespace_3fa257af
	Checksum: 0x28C348B3
	Offset: 0x6B50
	Size: 0x25C
	Parameters: 1
	Flags: Private
*/
function private function_bf105732(var_4a8bf1a3)
{
	if(!isdefined(var_4a8bf1a3))
	{
		var_4a8bf1a3 = 1;
	}
	if(is_true(var_4a8bf1a3))
	{
		if(!level.var_e1b1f602 scene::is_playing(#"p9_fxainm_zm_platinum_ghost_train_south") && !level.var_3c41ed40 scene::is_playing(#"p9_fxainm_zm_platinum_ghost_train_south_sewer"))
		{
			level function_66dff432(1);
			function_18a5cf8b(level.var_4a7e5bf7);
			if(function_9c91ed70())
			{
				level.var_3c41ed40 thread scene::play(#"p9_fxainm_zm_platinum_ghost_train_south_sewer", level.var_4a7e5bf7);
			}
			else
			{
				level.var_e1b1f602 thread scene::play(#"p9_fxainm_zm_platinum_ghost_train_south", level.var_4a7e5bf7);
			}
		}
	}
	else if(!level.var_d05c528b scene::is_playing(#"p9_fxanim_zm_platinum_ghost_train_north") && !level.var_93504ea8 scene::is_playing(#"p9_fxanim_zm_platinum_ghost_train_north_sewer"))
	{
		level function_66dff432(0);
		function_18a5cf8b(level.var_9351a555);
		if(function_9c91ed70())
		{
			level.var_93504ea8 thread scene::play(#"p9_fxanim_zm_platinum_ghost_train_north_sewer", level.var_9351a555);
		}
		else
		{
			level.var_d05c528b thread scene::play(#"p9_fxanim_zm_platinum_ghost_train_north", level.var_9351a555);
		}
	}
}

/*
	Name: function_9c91ed70
	Namespace: namespace_3fa257af
	Checksum: 0x1670A0DE
	Offset: 0x6DB8
	Size: 0x132
	Parameters: 0
	Flags: Private
*/
function private function_9c91ed70()
{
	var_768cef1 = 0;
	var_925e4a10 = 0;
	a_players = function_a1ef346b();
	foreach(player in a_players)
	{
		if(distancesquared(player.origin, level.var_3daf2eb1.origin) < 562500)
		{
			var_925e4a10++;
		}
		if(distancesquared(player.origin, level.var_2b758a3e.origin) < 562500)
		{
			var_768cef1++;
		}
	}
	if(var_768cef1 > var_925e4a10)
	{
		return true;
	}
	return false;
}

/*
	Name: function_e803401a
	Namespace: namespace_3fa257af
	Checksum: 0x1D6E19B8
	Offset: 0x6EF8
	Size: 0x2D8
	Parameters: 1
	Flags: None
*/
function function_e803401a(var_4a8bf1a3)
{
	if(!isdefined(var_4a8bf1a3))
	{
		var_4a8bf1a3 = 1;
	}
	self notify("210ae071bc97e101");
	self endon("210ae071bc97e101");
	if(var_4a8bf1a3)
	{
		level endon(#"hash_3e8b4d2fb40996c6", #"end_game", #"hash_4250ffb13b75ed1d");
	}
	else
	{
		level endon(#"hash_1641307dd5ec1dc4", #"end_game", #"hash_4250ffb13b75ed1d");
	}
	level.str_rumble_type = #"light";
	level thread function_825111ad(var_4a8bf1a3);
	while(true)
	{
		a_players = function_a1ef346b();
		switch(level.str_rumble_type)
		{
			case "light":
			{
				foreach(player in a_players)
				{
					if(player zm_zonemgr::is_player_in_zone(level.var_e40bce8f))
					{
						player function_bc82f900(#"hash_109abe9169de475f");
					}
				}
				break;
			}
			case "heavy":
			{
				foreach(player in a_players)
				{
					if(player zm_zonemgr::is_player_in_zone(level.var_e40bce8f))
					{
						player function_bc82f900(#"hash_1f89166fed72f570");
						continue;
					}
					if(player zm_zonemgr::is_player_in_zone(level.var_cef1cab5))
					{
						player function_bc82f900(#"hash_109abe9169de475f");
					}
				}
				break;
			}
		}
		wait(0.4);
	}
}

/*
	Name: function_1f4205cd
	Namespace: namespace_3fa257af
	Checksum: 0xB6F5E042
	Offset: 0x71D8
	Size: 0xE8
	Parameters: 1
	Flags: None
*/
function function_1f4205cd(str_suffix)
{
	str_alias = #"hash_497b810942ea6cbd" + str_suffix;
	a_players = function_a1ef346b();
	foreach(player in a_players)
	{
		if(player zm_zonemgr::is_player_in_zone(level.var_e40bce8f))
		{
			player playsoundtoplayer(str_alias, player);
		}
	}
}

/*
	Name: function_825111ad
	Namespace: namespace_3fa257af
	Checksum: 0xF3821589
	Offset: 0x72C8
	Size: 0xA4
	Parameters: 1
	Flags: Private
*/
function private function_825111ad(var_4a8bf1a3)
{
	if(!isdefined(var_4a8bf1a3))
	{
		var_4a8bf1a3 = 1;
	}
	if(var_4a8bf1a3)
	{
		level endon(#"hash_3e8b4d2fb40996c6", #"end_game");
	}
	else
	{
		level endon(#"hash_1641307dd5ec1dc4", #"end_game");
	}
	level waittill(#"hash_b45cb9af027d66f");
	level.str_rumble_type = #"heavy";
}

/*
	Name: on_player_damaged
	Namespace: namespace_3fa257af
	Checksum: 0x19A8DC7F
	Offset: 0x7378
	Size: 0xE8
	Parameters: 10
	Flags: None
*/
function on_player_damaged(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime)
{
	if(psoffsettime == "MOD_CRUSH")
	{
		self thread function_1a360399();
	}
	if(isdefined(shitloc) && shitloc.team == level.zombie_team && is_true(shitloc.var_cb27a574))
	{
		self burnplayer::setplayerburning(7, 1, 5);
	}
	return -1;
}

/*
	Name: function_1a360399
	Namespace: namespace_3fa257af
	Checksum: 0x23600191
	Offset: 0x7468
	Size: 0x74
	Parameters: 0
	Flags: None
*/
function function_1a360399()
{
	self endon(#"death");
	self clientfield::set_to_player("" + #"hash_6e5cc4162abd613f", 1);
	wait(3.5);
	self clientfield::set_to_player("" + #"hash_6e5cc4162abd613f", 0);
}

/*
	Name: function_d7fb6a4c
	Namespace: namespace_3fa257af
	Checksum: 0x51921E23
	Offset: 0x74E8
	Size: 0x84
	Parameters: 0
	Flags: Private
*/
function private function_d7fb6a4c()
{
	if(isactor(self))
	{
		self pathmode("move allowed");
		self.completed_emerging_into_playable_area = 1;
		self.zombie_think_done = 1;
		self.zombie_move_speed = "run";
		self flag::set(#"hash_2cf0b6ebfb6c98f3");
	}
}

/*
	Name: function_388594e2
	Namespace: namespace_3fa257af
	Checksum: 0xCC47D81
	Offset: 0x7578
	Size: 0x1F4
	Parameters: 1
	Flags: None
*/
function function_388594e2(a_ents)
{
	if(!level.var_d05c528b scene::is_playing(#"p9_fxanim_zm_platinum_ghost_train_north") && !level.var_93504ea8 scene::is_playing(#"p9_fxanim_zm_platinum_ghost_train_north_sewer"))
	{
		level clientfield::set("" + #"hash_3a84ac42abd608d2", 1);
	}
	if(level flag::get(#"hash_7632e33ae2122338"))
	{
		level clientfield::set("" + #"hash_43c03ae4aff2ba0", 3);
	}
	level clientfield::set("" + #"hash_600dd9c10bd3447b", 1);
	level namespace_b574e135::function_d508d5d8(1);
	level clientfield::set("" + #"hash_2a93d12c263f2d68", 2);
	level thread function_e803401a();
	level thread function_1f4205cd("south");
	level function_a67ccd4e(a_ents, 1);
	level flag::set(#"hash_1c8cee37d4ebb24b");
}

/*
	Name: function_adcf116f
	Namespace: namespace_3fa257af
	Checksum: 0x471958B7
	Offset: 0x7778
	Size: 0x1F4
	Parameters: 1
	Flags: None
*/
function function_adcf116f(a_ents)
{
	if(!level.var_e1b1f602 scene::is_playing(#"p9_fxainm_zm_platinum_ghost_train_south") && !level.var_3c41ed40 scene::is_playing(#"p9_fxainm_zm_platinum_ghost_train_south_sewer"))
	{
		level clientfield::set("" + #"hash_3a84ac42abd608d2", 1);
	}
	if(level flag::get(#"hash_7632e33ae2122338"))
	{
		level clientfield::set("" + #"hash_43c03ae4aff2ba0", 4);
	}
	level clientfield::set("" + #"hash_600dd9c10bd3447b", 2);
	level namespace_b574e135::function_4b599595(1);
	level clientfield::set("" + #"hash_2a93d12c263f2d68", 1);
	level thread function_e803401a(0);
	level thread function_1f4205cd("north");
	level function_a67ccd4e(a_ents, 0);
	level flag::set(#"hash_50aa91e49479ab59");
}

/*
	Name: function_1ad17524
	Namespace: namespace_3fa257af
	Checksum: 0xD40CE38B
	Offset: 0x7978
	Size: 0x1AC
	Parameters: 1
	Flags: None
*/
function function_1ad17524(a_ents)
{
	if(!level.var_d05c528b scene::is_playing(#"p9_fxanim_zm_platinum_ghost_train_north") && !level.var_93504ea8 scene::is_playing(#"p9_fxanim_zm_platinum_ghost_train_north_sewer"))
	{
		level clientfield::set("" + #"hash_3a84ac42abd608d2", 0);
		level clientfield::set("" + #"hash_2a93d12c263f2d68", 4);
	}
	level clientfield::set("" + #"hash_600dd9c10bd3447b", 0);
	level namespace_b574e135::function_d508d5d8(0);
	level function_d6aff0b3();
	if(level flag::get(#"hash_7632e33ae2122338"))
	{
		level clientfield::set("" + #"hash_43c03ae4aff2ba0", 5);
	}
	level flag::clear(#"hash_1c8cee37d4ebb24b");
}

/*
	Name: function_5d303617
	Namespace: namespace_3fa257af
	Checksum: 0x9ED59F1C
	Offset: 0x7B30
	Size: 0x1AC
	Parameters: 1
	Flags: None
*/
function function_5d303617(a_ents)
{
	if(!level.var_e1b1f602 scene::is_playing(#"p9_fxainm_zm_platinum_ghost_train_south") && !level.var_3c41ed40 scene::is_playing(#"p9_fxainm_zm_platinum_ghost_train_south_sewer"))
	{
		level clientfield::set("" + #"hash_3a84ac42abd608d2", 0);
		level clientfield::set("" + #"hash_2a93d12c263f2d68", 4);
	}
	level clientfield::set("" + #"hash_600dd9c10bd3447b", 0);
	level namespace_b574e135::function_4b599595(0);
	level function_d6aff0b3(0);
	if(level flag::get(#"hash_7632e33ae2122338"))
	{
		level clientfield::set("" + #"hash_43c03ae4aff2ba0", 6);
	}
	level flag::clear(#"hash_50aa91e49479ab59");
}

/*
	Name: function_4dbee530
	Namespace: namespace_3fa257af
	Checksum: 0x4B157F5D
	Offset: 0x7CE8
	Size: 0xB4
	Parameters: 0
	Flags: Private
*/
function private function_4dbee530()
{
	if(isdefined(self))
	{
		var_6b9acd61 = getweapon("ghost_train_fire_zm");
		self clientfield::set("" + #"hash_15e37ba2a31217b8", 1);
		self.var_cb27a574 = 1;
		n_dmg = zm_equipment::function_379f6b5d(6, var_6b9acd61);
		self namespace_9ff9f642::burn(#"hash_4c291cb570b90c2e", undefined, undefined, n_dmg);
	}
}

/*
	Name: function_66dff432
	Namespace: namespace_3fa257af
	Checksum: 0x4F8B2433
	Offset: 0x7DA8
	Size: 0x1EC
	Parameters: 1
	Flags: Private
*/
function private function_66dff432(var_2fb6fe4e)
{
	if(var_2fb6fe4e)
	{
		if(!isdefined(level.var_4a7e5bf7))
		{
			level.var_4a7e5bf7 = [];
		}
		level.var_4a7e5bf7 = [];
	}
	else
	{
		if(!isdefined(level.var_9351a555))
		{
			level.var_9351a555 = [];
		}
		level.var_9351a555 = [];
	}
	var_52a410d1 = 0;
	var_4298996d = function_21a3a673(3, 4);
	var_be18ffe8 = 1;
	if(level flag::get(#"hash_6ca740d4a9204938"))
	{
		for(i = 0; i < 6; i++)
		{
			if(level.zombie_total > 0)
			{
				if(var_52a410d1 < var_4298996d)
				{
					var_be18ffe8 = 1;
					var_52a410d1++;
				}
				else
				{
					var_be18ffe8 = 0;
				}
				function_b9dd887f(var_2fb6fe4e, var_be18ffe8);
				level.zombie_total--;
			}
			else
			{
				break;
			}
			waitframe(1);
		}
	}
	else
	{
		for(i = 0; i < 6; i++)
		{
			if(var_52a410d1 < var_4298996d)
			{
				var_be18ffe8 = 1;
				var_52a410d1++;
			}
			else
			{
				var_be18ffe8 = 0;
			}
			function_b9dd887f(var_2fb6fe4e, var_be18ffe8);
			waitframe(1);
		}
	}
	if(!level flag::get(#"hash_6ca740d4a9204938"))
	{
		level flag::set(#"hash_6ca740d4a9204938");
	}
}

/*
	Name: function_b9dd887f
	Namespace: namespace_3fa257af
	Checksum: 0xE6B806AB
	Offset: 0x7FA0
	Size: 0x1D0
	Parameters: 2
	Flags: None
*/
function function_b9dd887f(var_2fb6fe4e, var_be18ffe8)
{
	zombie = zm_utility::function_cce73165("riser_location", #"hash_7613c8395a7cd724", #"zone_ghost_station");
	if(isactor(zombie) && isalive(zombie))
	{
		zombie function_d7fb6a4c();
		if(is_true(var_be18ffe8))
		{
			zombie function_4dbee530();
		}
	}
	if(var_2fb6fe4e)
	{
		if(!isdefined(level.var_4a7e5bf7))
		{
			level.var_4a7e5bf7 = [];
		}
		else if(!isarray(level.var_4a7e5bf7))
		{
			level.var_4a7e5bf7 = array(level.var_4a7e5bf7);
		}
		level.var_4a7e5bf7[level.var_4a7e5bf7.size] = zombie;
	}
	else
	{
		if(!isdefined(level.var_9351a555))
		{
			level.var_9351a555 = [];
		}
		else if(!isarray(level.var_9351a555))
		{
			level.var_9351a555 = array(level.var_9351a555);
		}
		level.var_9351a555[level.var_9351a555.size] = zombie;
	}
}

/*
	Name: function_a67ccd4e
	Namespace: namespace_3fa257af
	Checksum: 0x28EAAD7
	Offset: 0x8178
	Size: 0x41C
	Parameters: 2
	Flags: None
*/
function function_a67ccd4e(a_ents, var_4a8bf1a3)
{
	if(!isdefined(var_4a8bf1a3))
	{
		var_4a8bf1a3 = 1;
	}
	if(var_4a8bf1a3)
	{
		for(i = 1; i < 9; i++)
		{
			train = a_ents["Vehicle " + i];
			train setforcenocull();
			if(!isdefined(level.var_8790bd5c))
			{
				level.var_8790bd5c = [];
			}
			else if(!isarray(level.var_8790bd5c))
			{
				level.var_8790bd5c = array(level.var_8790bd5c);
			}
			level.var_8790bd5c[level.var_8790bd5c.size] = train;
		}
		/#
			assert(level.var_dd757193.size == level.var_8790bd5c.size, "");
		#/
		for(i = 0; i < level.var_dd757193.size; i++)
		{
			level.var_dd757193[i].origin = level.var_8790bd5c[i].origin;
			level.var_dd757193[i] enablelinkto();
			level.var_dd757193[i] linkto(level.var_8790bd5c[i]);
			if(i > 0)
			{
				level.var_dd757193[i] thread function_5e09fe1();
				continue;
			}
			level.var_dd757193[i] thread function_5e09fe1(1, 0);
		}
	}
	else
	{
		for(i = 1; i < 9; i++)
		{
			train = a_ents["Vehicle " + i];
			train setforcenocull();
			if(!isdefined(level.var_43aa8d26))
			{
				level.var_43aa8d26 = [];
			}
			else if(!isarray(level.var_43aa8d26))
			{
				level.var_43aa8d26 = array(level.var_43aa8d26);
			}
			level.var_43aa8d26[level.var_43aa8d26.size] = train;
		}
		/#
			assert(level.var_4075a99d.size == level.var_43aa8d26.size, "");
		#/
		for(i = 0; i < level.var_4075a99d.size; i++)
		{
			level.var_4075a99d[i].origin = level.var_43aa8d26[i].origin;
			level.var_4075a99d[i] enablelinkto();
			level.var_4075a99d[i] linkto(level.var_43aa8d26[i]);
			if(i > 0)
			{
				level.var_4075a99d[i] thread function_5e09fe1(0);
				continue;
			}
			level.var_4075a99d[i] thread function_5e09fe1(0, 0);
		}
	}
}

/*
	Name: function_d6aff0b3
	Namespace: namespace_3fa257af
	Checksum: 0x3B41ADFB
	Offset: 0x85A0
	Size: 0x148
	Parameters: 1
	Flags: None
*/
function function_d6aff0b3(var_4a8bf1a3)
{
	if(!isdefined(var_4a8bf1a3))
	{
		var_4a8bf1a3 = 1;
	}
	if(var_4a8bf1a3)
	{
		level.var_8790bd5c = [];
		foreach(clip in level.var_dd757193)
		{
			clip unlink();
		}
	}
	else
	{
		level.var_43aa8d26 = [];
		foreach(clip in level.var_4075a99d)
		{
			clip unlink();
		}
	}
}

/*
	Name: function_5e09fe1
	Namespace: namespace_3fa257af
	Checksum: 0xB268A317
	Offset: 0x86F0
	Size: 0x718
	Parameters: 2
	Flags: None
*/
function function_5e09fe1(var_4a8bf1a3, var_d15e3ab)
{
	if(!isdefined(var_4a8bf1a3))
	{
		var_4a8bf1a3 = 1;
	}
	if(!isdefined(var_d15e3ab))
	{
		var_d15e3ab = 1;
	}
	if(var_4a8bf1a3)
	{
		level endon(#"hash_3e8b4d2fb40996c6");
		var_8179aee4 = struct::get("spawn_klaus_south", "targetname");
	}
	else
	{
		level endon(#"hash_1641307dd5ec1dc4");
		var_8179aee4 = struct::get("spawn_klaus_north", "targetname");
	}
	self endon(#"death");
	while(true)
	{
		a_zombies = getaiteamarray(level.zombie_team);
		a_players = function_a1ef346b();
		foreach(zombie in a_zombies)
		{
			if(isdefined(zombie) && zombie.health > 0)
			{
				if(zombie istouching(self))
				{
					if(zombie.archetype === #"mechz")
					{
						zombie dodamage(zombie.maxhealth * 0.1, self.origin, self, self, 0, "MOD_CRUSH");
						if(zombie.health > 0)
						{
							locs = function_65c98960();
							zombie zm_ai_utility::function_a8dc3363(locs);
						}
						continue;
					}
					if(zombie.archetype === #"hash_7c0d83ac1e845ac2")
					{
						var_edc4ca59 = arraygetclosest(zombie.origin, level.var_520a143d);
						if(isdefined(var_edc4ca59))
						{
							zombie forceteleport(var_edc4ca59.origin);
						}
						continue;
					}
					if(!zombie flag::get(#"hash_2cf0b6ebfb6c98f3"))
					{
						a_players = function_a1ef346b();
						foreach(player in a_players)
						{
							if(player.cached_zone_name === "zone_ghost_station" || player.cached_zone_name === "zone_ghost_station_2")
							{
								player zm_stats::increment_challenge_stat(#"hash_64e4655b2bad9f63");
							}
						}
						zombie.allowdeath = 1;
						zombie kill(undefined, undefined, undefined, undefined, undefined, 1);
						playfxontag(#"zm_weapons/fx9_ww_ieu_death", zombie, "J_Spine4");
						zombie deletedelay();
					}
				}
			}
		}
		foreach(player in a_players)
		{
			if(isalive(player))
			{
				if(player istouching(self))
				{
					if(player laststand::player_is_in_laststand() && !player flag::get(#"hash_6dd5946508e5689a"))
					{
						player.bleedout_time = 0;
						continue;
					}
					if(var_d15e3ab)
					{
						player dodamage(30, self.origin, self, self, 0);
						var_a6470558 = vectornormalize(player.origin - self.origin);
						/#
							line(self.origin, player.origin, (1, 0, 0), 1, 1, 300);
						#/
						player playerknockback(1);
						player applyknockback(2000, var_a6470558);
						player playerknockback(0);
						continue;
					}
					player thread function_3dae6b8b();
					player thread function_1a360399();
					player dodamage(player.maxhealth + 100, self.origin, self, self, 0, "MOD_CRUSH");
					player flag::set(#"hash_6dd5946508e5689a");
				}
			}
		}
		if(isdefined(level.var_56e22cfa) && level.var_56e22cfa istouching(self))
		{
			level.var_56e22cfa forceteleport(getclosestpointonnavmesh(var_8179aee4.origin, 300, 10), (0, 0, 0), 0);
		}
		wait(0.1);
	}
}

/*
	Name: function_3dae6b8b
	Namespace: namespace_3fa257af
	Checksum: 0x58B9B2E3
	Offset: 0x8E10
	Size: 0x11C
	Parameters: 0
	Flags: None
*/
function function_3dae6b8b()
{
	level endon(#"end_game");
	var_781b19f5 = 99999;
	var_7b794373 = level.var_520a143d[0];
	foreach(loc in level.var_520a143d)
	{
		var_6bde26ff = distance(loc.origin, self.origin);
		if(var_6bde26ff < var_781b19f5)
		{
			var_781b19f5 = var_6bde26ff;
			var_7b794373 = loc;
		}
	}
	self setorigin(var_7b794373.origin);
}

/*
	Name: on_player_revived
	Namespace: namespace_3fa257af
	Checksum: 0x1CEA8933
	Offset: 0x8F38
	Size: 0x4C
	Parameters: 1
	Flags: None
*/
function on_player_revived(params)
{
	if(self flag::get(#"hash_6dd5946508e5689a"))
	{
		self flag::clear(#"hash_6dd5946508e5689a");
	}
}

/*
	Name: function_419047b9
	Namespace: namespace_3fa257af
	Checksum: 0x6EFDEA49
	Offset: 0x8F90
	Size: 0x8C
	Parameters: 0
	Flags: None
*/
function function_419047b9()
{
	if(!isdefined(level.var_f4b9daca))
	{
		level.var_f4b9daca = 0;
	}
	zm_round_spawning::function_b4a8f95a(#"tormentor", level.var_6103ecd9, &special_round_start, &special_round_end, &namespace_abfee9ba::function_44d45595, &function_dd0b40e0, 0);
}

/*
	Name: function_55413772
	Namespace: namespace_3fa257af
	Checksum: 0xA4DAF7AC
	Offset: 0x9028
	Size: 0xA4
	Parameters: 1
	Flags: None
*/
function function_55413772(s_spawn_loc)
{
	level endon(#"end_game");
	var_c0ef5a0c = util::spawn_model("tag_origin", s_spawn_loc.origin, s_spawn_loc.angles);
	var_c0ef5a0c clientfield::increment("" + #"hash_3220b44880f1807c");
	wait(5);
	if(isdefined(var_c0ef5a0c))
	{
		var_c0ef5a0c delete();
	}
}

/*
	Name: function_9feaaed
	Namespace: namespace_3fa257af
	Checksum: 0xE9680E51
	Offset: 0x90D8
	Size: 0x164
	Parameters: 0
	Flags: Private
*/
function private function_9feaaed()
{
	self notify("60d06f02ca483fd0");
	self endon("60d06f02ca483fd0");
	level endon(#"end_game");
	level flag::wait_till(#"hash_3f926cd1d573549d");
	if(level flag::get("rbz_exfil_started"))
	{
		return;
	}
	if(level flag::get(#"rbz_exfil_beacon_active"))
	{
		level flag::clear("rbz_exfil_beacon_active");
	}
	if(level flag::get("rbz_exfil_allowed"))
	{
		level flag::clear("rbz_exfil_allowed");
	}
	if(level.round_number < 15)
	{
		zm_round_spawning::function_d36196b1(15);
	}
	else if(isdefined(level.var_6103ecd9))
	{
		zm_round_spawning::function_d36196b1(level.var_6103ecd9);
	}
	function_efb7d5c9();
}

/*
	Name: function_efb7d5c9
	Namespace: namespace_3fa257af
	Checksum: 0xA4D234CD
	Offset: 0x9248
	Size: 0x2DC
	Parameters: 0
	Flags: Private
*/
function private function_efb7d5c9()
{
	if(level flag::get(#"hash_3dfd0dd4caef92a9"))
	{
		level.var_6103ecd9 = level.round_number + 1;
	}
	else
	{
		level.var_6103ecd9 = level.round_number;
	}
	if(level.var_6103ecd9 == 16)
	{
		function_ccae0e94(16);
		var_c968853d = level.round_number + 2;
		var_b652419c = function_b854a36e(var_c968853d);
		level thread function_859fa480(var_b652419c);
	}
	if(level.var_6103ecd9 == 11)
	{
		function_ccae0e94(11);
		var_c968853d = level.round_number + 2;
		var_47a1335a = function_b854a36e(var_c968853d);
		level thread function_32401229(var_47a1335a);
	}
	if(level.var_6103ecd9 == 15)
	{
		function_ccae0e94(15);
		var_c968853d = level.round_number + 2;
		var_c17aa866 = function_b854a36e(var_c968853d);
		level thread function_ae72b4d0(var_c17aa866);
	}
	level function_419047b9();
	/#
		iprintlnbold("" + level.var_6103ecd9);
		println("" + level.var_6103ecd9);
	#/
	level.zombie_total = 0;
	level notify(#"kill_round");
	level notify(#"kill_round_wait");
	level zm_utility::function_9ad5aeb1(0, 1, 0, 0);
	if(!level flag::get(#"hash_3dfd0dd4caef92a9"))
	{
		level flag::set("end_round_start_delay");
		wait(1);
		level flag::clear("end_round_start_delay");
	}
}

/*
	Name: function_b854a36e
	Namespace: namespace_3fa257af
	Checksum: 0xADECD9B
	Offset: 0x9530
	Size: 0x60
	Parameters: 1
	Flags: Private
*/
function private function_b854a36e(var_dc34e3b6)
{
	while(isinarray(level.var_865ea9f, var_dc34e3b6) || ((var_dc34e3b6 % 5) == 1 && var_dc34e3b6 > 10))
	{
		var_dc34e3b6++;
	}
	return var_dc34e3b6;
}

/*
	Name: function_ccae0e94
	Namespace: namespace_3fa257af
	Checksum: 0xBC5C860
	Offset: 0x9598
	Size: 0x5C
	Parameters: 1
	Flags: Private
*/
function private function_ccae0e94(var_2ae1a08f)
{
	if(isdefined(level.var_ff78f6de))
	{
		level.var_ff78f6de[var_2ae1a08f] = undefined;
	}
	if(isdefined(level.var_865ea9f))
	{
		arrayremovevalue(level.var_865ea9f, var_2ae1a08f);
	}
}

/*
	Name: function_2fea91a2
	Namespace: namespace_3fa257af
	Checksum: 0x25A4C6B4
	Offset: 0x9600
	Size: 0x12A
	Parameters: 0
	Flags: None
*/
function function_2fea91a2()
{
	if(!isdefined(level.var_19a4a8bb))
	{
		level.var_19a4a8bb = 0;
	}
	level.var_19a4a8bb++;
	if(level.var_19a4a8bb > 6)
	{
		level.var_19a4a8bb = 1;
	}
	switch(level.var_19a4a8bb)
	{
		case 1:
		default:
		{
			return #"avogadro";
			break;
		}
		case 2:
		case 3:
		{
			return #"soa";
			break;
		}
		case 4:
		{
			return #"avogadro";
			break;
		}
		case 5:
		{
			return #"soa";
			break;
		}
		case 6:
		{
			return #"avogadro";
			break;
		}
	}
}

/*
	Name: special_round_start
	Namespace: namespace_3fa257af
	Checksum: 0x9AF2B99C
	Offset: 0x9738
	Size: 0xC4
	Parameters: 0
	Flags: None
*/
function special_round_start()
{
	level flag::set(#"hash_6b9171e3b39fb7ed");
	level flag::clear(#"hash_69bc64a0ea76c1b9");
	level flag::clear(#"special_round_end");
	function_e2610c23();
	if(!level flag::get(#"hash_bb9098b117819a"))
	{
		level thread zm_vo::function_7622cb70(#"hash_b710973bfe77e06");
	}
	function_532b11c9();
}

/*
	Name: special_round_end
	Namespace: namespace_3fa257af
	Checksum: 0xBC3421A4
	Offset: 0x9808
	Size: 0x184
	Parameters: 1
	Flags: None
*/
function special_round_end(var_d25bbdd5)
{
	if(!level flag::get("rbz_exfil_allowed"))
	{
		level flag::set("rbz_exfil_allowed");
	}
	level flag::clear(#"hash_6b9171e3b39fb7ed");
	level flag::set(#"hash_69bc64a0ea76c1b9");
	if(!level flag::get(#"hash_5c97d613e20f93e4"))
	{
		level flag::set(#"hash_5c97d613e20f93e4");
	}
	function_e2610c23();
	a_alive_player = function_a1ef346b();
	a_alive_player = function_a1ef346b();
	if(isdefined(a_alive_player[0]))
	{
		level thread zm_powerups::specific_powerup_drop("full_ammo", a_alive_player[0].origin);
	}
	level flag::set(#"special_round_end");
}

/*
	Name: function_83aae371
	Namespace: namespace_3fa257af
	Checksum: 0x6DF8637A
	Offset: 0x9998
	Size: 0xE0
	Parameters: 0
	Flags: None
*/
function function_83aae371()
{
	players = getplayers();
	switch(level.var_f4b9daca)
	{
		case 1:
		{
			level.var_40f837cf = 300;
			break;
		}
		case 2:
		{
			level.var_40f837cf = 700;
			break;
		}
		case 3:
		{
			level.var_40f837cf = 1100;
			break;
		}
		case 4:
		{
			level.var_40f837cf = 1500;
			break;
		}
	}
	if(level.var_40f837cf > 2000)
	{
		level.var_40f837cf = 2000;
	}
}

/*
	Name: function_8d2936b1
	Namespace: namespace_3fa257af
	Checksum: 0xB5BD69DD
	Offset: 0x9A80
	Size: 0x92
	Parameters: 0
	Flags: None
*/
function function_8d2936b1()
{
	switch(getplayers().size)
	{
		case 1:
		{
			return 3;
		}
		case 2:
		{
			return 5;
		}
		case 3:
		{
			return 7;
		}
		case 4:
		{
			return 10;
		}
		default:
		{
			return 14;
		}
	}
}

/*
	Name: function_44d45595
	Namespace: namespace_3fa257af
	Checksum: 0xF53E49F6
	Offset: 0x9B20
	Size: 0x11A
	Parameters: 1
	Flags: None
*/
function function_44d45595(n_max_spawns)
{
	if(zm_round_spawning::function_fab464c4(level.round_number))
	{
		a_e_players = getplayers();
		if(level.var_f4b9daca < 3)
		{
			n_max = a_e_players.size * 8;
		}
		else
		{
			n_max = a_e_players.size * 10;
		}
		return n_max;
	}
	if(level.round_number < 20)
	{
		var_a5e820a7 = 0.02;
	}
	else
	{
		if(level.round_number < 30)
		{
			var_a5e820a7 = 0.03;
		}
		else
		{
			var_a5e820a7 = 0.04;
		}
	}
	n_max = int(ceil(level.zombie_total * var_a5e820a7));
	return n_max;
}

/*
	Name: function_d30fa080
	Namespace: namespace_3fa257af
	Checksum: 0x5ED420E5
	Offset: 0x9C48
	Size: 0xEA
	Parameters: 0
	Flags: None
*/
function function_d30fa080()
{
	a_players = getplayers();
	switch(a_players.size)
	{
		case 1:
		{
			level.var_57f3dce4 = 6;
			break;
		}
		case 2:
		{
			level.var_57f3dce4 = 10;
			break;
		}
		case 3:
		{
			level.var_57f3dce4 = 13;
			break;
		}
		case 4:
		{
			level.var_57f3dce4 = 15;
			break;
		}
		default:
		{
			level.var_57f3dce4 = 6;
			break;
		}
	}
	return level.var_57f3dce4;
}

/*
	Name: function_dd0b40e0
	Namespace: namespace_3fa257af
	Checksum: 0xC20A6A71
	Offset: 0x9D40
	Size: 0x15C
	Parameters: 0
	Flags: None
*/
function function_dd0b40e0()
{
	var_850bf822 = 0;
	var_115de5b6 = 0;
	var_d9dcedb1 = 0;
	a_players = getplayers();
	switch(a_players.size)
	{
		case 1:
		{
			var_115de5b6 = 2;
			var_d9dcedb1 = 3;
			break;
		}
		case 2:
		{
			var_115de5b6 = 1.2;
			var_d9dcedb1 = 2;
			break;
		}
		case 3:
		{
			var_115de5b6 = 1;
			var_d9dcedb1 = 1.5;
			break;
		}
		case 4:
		{
			var_115de5b6 = 0.5;
			var_d9dcedb1 = 1;
			break;
		}
		default:
		{
			var_115de5b6 = 2;
			var_d9dcedb1 = 3;
			break;
		}
	}
	wait(randomfloatrange(var_115de5b6, var_d9dcedb1));
}

/*
	Name: function_d4f11e3c
	Namespace: namespace_3fa257af
	Checksum: 0xCA540C99
	Offset: 0x9EA8
	Size: 0x182
	Parameters: 1
	Flags: None
*/
function function_d4f11e3c(n_max_spawns)
{
	if(isdefined(level.var_36678664) && level.round_number < level.var_36678664)
	{
		return 0;
	}
	if(isdefined(level.var_1db9948) && isdefined(level.var_a1c6ba48))
	{
		if(level.var_1db9948 <= level.round_number || level.var_a1c6ba48 <= level.round_number && level.round_number < 20)
		{
			return 0;
		}
		if(level.var_1db9948 <= level.round_number && level.var_a1c6ba48 <= level.round_number && level.round_number < 30)
		{
			return 0;
		}
	}
	if(level.round_number < 20)
	{
		var_74475add = 0.02;
	}
	else
	{
		if(level.round_number < 30)
		{
			var_74475add = 0.03;
		}
		else
		{
			var_74475add = 0.04;
		}
	}
	n_max = int(ceil(level.zombie_total * var_74475add));
	return n_max;
}

/*
	Name: function_f1355240
	Namespace: namespace_3fa257af
	Checksum: 0xA2386349
	Offset: 0xA038
	Size: 0x134
	Parameters: 1
	Flags: None
*/
function function_f1355240(n_round_number)
{
	level endon(#"end_game");
	if(!isdefined(level.var_2f45d799))
	{
		level.var_2f45d799 = 0;
	}
	while(true)
	{
		level waittill(#"hash_5d3012139f083ccb");
		if(zm_round_spawning::function_d0db51fc(#"raz"))
		{
			level.var_2f45d799++;
			n_player_count = zm_utility::function_a2541519(getplayers().size);
			if(n_player_count == 1)
			{
				level.var_36678664 = level.round_number + function_21a3a673(2, 4);
			}
			else
			{
				level.var_36678664 = level.round_number + function_21a3a673(2, 3);
			}
		}
	}
}

/*
	Name: function_5e8a178a
	Namespace: namespace_3fa257af
	Checksum: 0x199C477
	Offset: 0xA178
	Size: 0x17C
	Parameters: 1
	Flags: None
*/
function function_5e8a178a(n_round_number)
{
	level endon(#"end_game");
	if(!isdefined(level.var_ea1e9b1e))
	{
		level.var_ea1e9b1e = 0;
	}
	while(true)
	{
		level waittill(#"hash_5d3012139f083ccb");
		if(zm_round_spawning::function_d0db51fc(#"mechz"))
		{
			level.var_ea1e9b1e++;
			if(level.var_ea1e9b1e == 1 || level.var_ea1e9b1e == 2)
			{
				level.var_1db9948 = level.round_number + 6;
			}
			else
			{
				n_player_count = zm_utility::function_a2541519(getplayers().size);
				if(n_player_count === 1)
				{
					level.var_1db9948 = level.round_number + function_21a3a673(3, 5);
				}
				else
				{
					level.var_1db9948 = level.round_number + function_21a3a673(3, 4);
				}
			}
		}
	}
}

/*
	Name: function_76a7a9ef
	Namespace: namespace_3fa257af
	Checksum: 0xA682C3AB
	Offset: 0xA300
	Size: 0x112
	Parameters: 1
	Flags: None
*/
function function_76a7a9ef(n_max_spawns)
{
	if(isdefined(level.var_a1c6ba48) && level.round_number < level.var_a1c6ba48)
	{
		return 0;
	}
	if(isdefined(level.var_1db9948) && level.var_1db9948 <= level.round_number && level.round_number < 20)
	{
		return 0;
	}
	if(level.round_number < 20)
	{
		var_e5d49e0f = 0.02;
	}
	else
	{
		if(level.round_number < 30)
		{
			var_e5d49e0f = 0.03;
		}
		else
		{
			var_e5d49e0f = 0.04;
		}
	}
	n_max = int(ceil(level.zombie_total * var_e5d49e0f));
	return n_max;
}

/*
	Name: function_2927859c
	Namespace: namespace_3fa257af
	Checksum: 0xDEEA7E7F
	Offset: 0xA420
	Size: 0x10C
	Parameters: 1
	Flags: None
*/
function function_2927859c(n_round_number)
{
	level endon(#"end_game");
	if(!isdefined(level.var_d8db349d))
	{
		level.var_d8db349d = 0;
	}
	while(true)
	{
		level waittill(#"hash_5d3012139f083ccb");
		if(zm_round_spawning::function_d0db51fc(#"soa"))
		{
			level.var_d8db349d++;
			if(level.round_number <= 20)
			{
				level.var_a1c6ba48 = level.round_number + function_21a3a673(2, 3);
			}
			else
			{
				level.var_a1c6ba48 = level.round_number + function_21a3a673(1, 2);
			}
		}
	}
}

/*
	Name: function_bee969f1
	Namespace: namespace_3fa257af
	Checksum: 0x76CB319D
	Offset: 0xA538
	Size: 0x4C
	Parameters: 1
	Flags: None
*/
function function_bee969f1(s_params)
{
	if(isdefined(self))
	{
		level thread zm_powerups::specific_powerup_drop("full_ammo", self.origin, undefined, undefined, undefined, undefined, undefined, undefined, undefined, 1);
	}
}

/*
	Name: function_532b11c9
	Namespace: namespace_3fa257af
	Checksum: 0x57B2F326
	Offset: 0xA590
	Size: 0x134
	Parameters: 0
	Flags: Private
*/
function private function_532b11c9()
{
	level.var_f4b9daca++;
	if(level.var_f4b9daca == 1)
	{
		level.var_6103ecd9 = 20;
	}
	else
	{
		for(level.var_6103ecd9 = level.round_number + function_21a3a673(5, 7); isinarray(level.var_865ea9f, level.var_6103ecd9) || ((level.var_6103ecd9 % 5) == 1 && level.var_6103ecd9 > 10); level.var_6103ecd9++)
		{
		}
	}
	level function_419047b9();
	/#
		iprintlnbold("" + level.var_6103ecd9);
		println("" + level.var_6103ecd9);
	#/
}

/*
	Name: function_e2610c23
	Namespace: namespace_3fa257af
	Checksum: 0x6191CE29
	Offset: 0xA6D0
	Size: 0xD4
	Parameters: 0
	Flags: None
*/
function function_e2610c23()
{
	if(level flag::get(#"hash_74fd3f682346ea69"))
	{
		level thread clientfield::set("" + #"hash_228f0acdd4255cb", 0);
		level flag::clear(#"hash_74fd3f682346ea69");
	}
	else
	{
		level thread clientfield::set("" + #"hash_228f0acdd4255cb", 1);
		level flag::set(#"hash_74fd3f682346ea69");
	}
}

/*
	Name: function_4c86cc5
	Namespace: namespace_3fa257af
	Checksum: 0x385E3F96
	Offset: 0xA7B0
	Size: 0x524
	Parameters: 0
	Flags: None
*/
function function_4c86cc5()
{
	level endon(#"game_ended");
	level flag::wait_till("start_zombie_round_logic");
	wait(2);
	var_49f892f0 = struct::get("zipline_to_destroyed_apartments");
	zm_sq::objective_set(#"hash_6540714f9d2b59fb", var_49f892f0, undefined, #"hash_6a19188591b0ab07", undefined, 96);
	var_2aa1d292 = struct::get("zipline_to_east_berlin_hotel");
	zm_sq::objective_set(#"hash_6540724f9d2b5bae", var_2aa1d292, undefined, #"hash_6a19188591b0ab07", undefined, 96);
	level flag::wait_till_any([2:"connect_rooftops_to_destroyed_upper_floors", 1:"connect_rooftops_interior_to_east_berlin_hotel", 0:"power_on"]);
	zm_sq::objective_complete(#"hash_6540714f9d2b59fb", var_49f892f0);
	zm_sq::objective_complete(#"hash_6540724f9d2b5bae", var_2aa1d292);
	wait(1);
	var_5bad9552 = struct::get("garment_warehouse_door");
	zm_sq::objective_set(#"hash_6540734f9d2b5d61", var_5bad9552, undefined, #"hash_6a19188591b0ab07", undefined, 96);
	level flag::wait_till_any([1:"connect_korber_roof_to_korber_interior", 0:"power_on"]);
	zm_sq::objective_complete(#"hash_6540734f9d2b5d61", var_5bad9552);
	wait(1);
	var_74d25c9e = struct::get("ghost_station_door");
	zm_sq::objective_set(#"hash_6540744f9d2b5f14", var_74d25c9e, undefined, #"hash_6a19188591b0ab07", undefined, 96);
	var_e3b2d4f9 = struct::get("ghost_station2_door");
	zm_sq::objective_set(#"hash_6540754f9d2b60c7", var_e3b2d4f9, undefined, #"hash_6a19188591b0ab07", undefined, 96);
	level flag::wait_till_any([2:"connect_east_berlin_street_to_ghost_station2", 1:"connect_east_berlin_street_to_ghost_station", 0:"power_on"]);
	zm_sq::objective_complete(#"hash_6540744f9d2b5f14", var_74d25c9e);
	zm_sq::objective_complete(#"hash_6540754f9d2b60c7", var_e3b2d4f9);
	wait(1);
	var_7b6eae07 = getent("elec_switch", "script_noteworthy");
	zm_sq::objective_set(#"hash_50971d60dd167421", var_7b6eae07, undefined, #"hash_6a19188591b0ab07", undefined, 96);
	var_7b6eae07 function_619a5c20();
	level flag::wait_till_any([1:"power_on", 0:#"hash_7b0e9fd705e66691"]);
	zm_sq::objective_complete(#"hash_50971d60dd167421", var_7b6eae07);
	level flag::wait_till_any([1:#"power_on", 0:#"hash_7d72f2dda7a4104e"]);
	zm_sq::objective_set(#"hash_50971d60dd167421", var_7b6eae07, undefined, #"hash_6a19188591b0ab07", undefined, 96);
	level flag::wait_till("power_on");
	zm_sq::objective_complete(#"hash_50971d60dd167421", var_7b6eae07);
	var_7b6eae07 function_23a29590();
}

/*
	Name: open_sesame_watcher
	Namespace: namespace_3fa257af
	Checksum: 0x7F67D8C8
	Offset: 0xACE0
	Size: 0x3C
	Parameters: 0
	Flags: None
*/
function open_sesame_watcher()
{
	level waittill(#"open_sesame");
	level flag::set(#"hash_7d72f2dda7a4104e");
}

/*
	Name: function_49fa8c75
	Namespace: namespace_3fa257af
	Checksum: 0xB91F943C
	Offset: 0xAD28
	Size: 0x28A
	Parameters: 0
	Flags: None
*/
function function_49fa8c75()
{
	level endon(#"game_ended");
	level flag::wait_till("start_zombie_round_logic");
	level.var_3b115519 = getentarray("tunnel_boundary_damage_volume", "targetname");
	if(isdefined(level.var_3b115519))
	{
		while(true)
		{
			players = getplayers();
			foreach(player in players)
			{
				if(player is_touching_any(level.var_3b115519))
				{
					if(!is_true(player.var_b2373233))
					{
						if(isdefined(player.maxhealth) && player.maxhealth > 0)
						{
							n_damage = int((player.maxhealth / 6) + 1);
						}
						else
						{
							n_damage = 31;
						}
						player.var_b2373233 = 1;
						player thread function_7fd17b10();
						player dodamage(n_damage, player.origin, undefined, undefined, undefined, "MOD_DEATH_CIRCLE", 8192);
					}
					player function_bc82f900(#"damage_light");
					if(!isalive(player) || player scene::is_igc_active())
					{
						player function_fb28bd2c();
					}
					else
					{
						player function_1251f723();
					}
					continue;
				}
				player function_fb28bd2c();
			}
			waitframe(1);
		}
	}
}

/*
	Name: is_touching_any
	Namespace: namespace_3fa257af
	Checksum: 0xF1E021B8
	Offset: 0xAFC0
	Size: 0x10E
	Parameters: 1
	Flags: None
*/
function is_touching_any(a_volumes)
{
	self endon(#"death");
	if(zm_utility::is_player_valid(self, 0, 1))
	{
		if(isdefined(a_volumes) && a_volumes.size > 0)
		{
			foreach(volume in a_volumes)
			{
				if(isdefined(volume) && self istouching(volume))
				{
					if(isdefined(volume.damage_type))
					{
						self.var_878ca565 = volume.damage_type;
					}
					return true;
				}
			}
		}
	}
	return false;
}

/*
	Name: function_1251f723
	Namespace: namespace_3fa257af
	Checksum: 0x5D93A372
	Offset: 0xB0D8
	Size: 0x54
	Parameters: 0
	Flags: None
*/
function function_1251f723()
{
	if(self.var_878ca565 === "damage_electric")
	{
		n_value = 2;
	}
	else
	{
		n_value = 1;
	}
	self clientfield::set_to_player("fogofwareffects", n_value);
}

/*
	Name: function_fb28bd2c
	Namespace: namespace_3fa257af
	Checksum: 0x70D90C91
	Offset: 0xB138
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_fb28bd2c()
{
	self clientfield::set_to_player("fogofwareffects", 0);
}

/*
	Name: function_7fd17b10
	Namespace: namespace_3fa257af
	Checksum: 0x6A704DF8
	Offset: 0xB168
	Size: 0x42
	Parameters: 0
	Flags: None
*/
function function_7fd17b10()
{
	self notify("6af70c7224263305");
	self endon("6af70c7224263305");
	self endon(#"death");
	wait(1);
	self.var_b2373233 = 0;
}

/*
	Name: function_a648d1a6
	Namespace: namespace_3fa257af
	Checksum: 0xC6239BC9
	Offset: 0xB1B8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_a648d1a6()
{
	self val::set(#"hash_29bdcb17a4141af3", "freezecontrols", 1);
}

/*
	Name: function_dc9b097c
	Namespace: namespace_3fa257af
	Checksum: 0x69E097B2
	Offset: 0xB1F8
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function function_dc9b097c()
{
	self val::reset(#"hash_29bdcb17a4141af3", "freezecontrols");
}

/*
	Name: function_66efff7a
	Namespace: namespace_3fa257af
	Checksum: 0x40CAB722
	Offset: 0xB230
	Size: 0xAC
	Parameters: 0
	Flags: None
*/
function function_66efff7a()
{
	level endon(#"end_game");
	hidemiscmodels("zm_pt_static_mdl_stuff");
	level flag::wait_till("power_on");
	util::setclientsysstate("platMusUnlock", "unlockDia1");
	util::setclientsysstate("platMusUnlock", "unlockDia2");
	showmiscmodels("zm_pt_static_mdl_stuff");
}

/*
	Name: function_90cffb5b
	Namespace: namespace_3fa257af
	Checksum: 0x77956746
	Offset: 0xB2E8
	Size: 0x25A
	Parameters: 1
	Flags: None
*/
function function_90cffb5b(var_f52c2c29)
{
	level endon(#"end_game");
	level flag::wait_till("zones_initialized");
	level.var_141e4a5f = [];
	foreach(str_rappel in var_f52c2c29)
	{
		rappel = struct::get(str_rappel, "targetname");
		if(!isdefined(rappel))
		{
			continue;
		}
		posonnavmesh = getclosestpointonnavmesh(rappel.origin, 64, 16);
		if(!isdefined(posonnavmesh))
		{
			continue;
		}
		var_49360d05 = struct::get(rappel.target, "targetname");
		if(!isdefined(var_49360d05))
		{
			continue;
		}
		var_db90fcba = getclosestpointonnavmesh(var_49360d05.origin, 64, 16);
		if(!isdefined(var_db90fcba))
		{
			continue;
		}
		str_zone = zm_zonemgr::get_zone_from_position(posonnavmesh, 1);
		var_5f3b05e8 = zm_zonemgr::get_zone_from_position(var_db90fcba, 1);
		if(isdefined(str_zone) && isdefined(var_5f3b05e8))
		{
			if(!isdefined(level.var_141e4a5f[var_5f3b05e8]))
			{
				level.var_141e4a5f[var_5f3b05e8] = [];
			}
			level.var_141e4a5f[var_5f3b05e8][str_zone] = {#hash_db90fcba:var_db90fcba, #posonnavmesh:posonnavmesh, #rappel:rappel};
		}
	}
}

/*
	Name: function_20ad9d07
	Namespace: namespace_3fa257af
	Checksum: 0x42E0F7BB
	Offset: 0xB550
	Size: 0x47C
	Parameters: 0
	Flags: Private
*/
function private function_20ad9d07()
{
	level endon(#"end_game");
	self endon(#"death", #"disconnect");
	level flag::wait_till("zones_initialized");
	var_ff00218d = 1000000;
	max_dist_sq = 90000;
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"zone_change");
		var_5f3b05e8 = waitresult.zone_name;
		if(!isdefined(var_5f3b05e8) || !isdefined(level.var_141e4a5f[var_5f3b05e8]))
		{
			continue;
		}
		a_ai_zombies = getaiarchetypearray(#"zombie", level.zombie_team);
		var_b8855d07 = [];
		foreach(zombie in a_ai_zombies)
		{
			if(isdefined(zombie.var_29656770) && zombie.var_29656770.var_990bf66b === var_5f3b05e8)
			{
				var_b8855d07[var_b8855d07.size] = zombie;
				continue;
			}
			if(distancesquared(zombie.origin, self.origin) < var_ff00218d)
			{
				var_b8855d07[var_b8855d07.size] = zombie;
			}
		}
		foreach(zombie in var_b8855d07)
		{
			if(is_true(zombie.interdimensional_gun_kill))
			{
				continue;
			}
			if(is_true(zombie.var_61c270))
			{
				continue;
			}
			if(zombie.favoriteenemy === self)
			{
				if(isdefined(zombie.var_29656770) && zombie.var_29656770.var_990bf66b === var_5f3b05e8)
				{
					zombie.v_zombie_custom_goal_pos = zombie.var_29656770.var_178696d;
					zombie.var_29656770.target_zone = var_5f3b05e8;
					continue;
				}
				str_zone = zombie zm_utility::get_current_zone();
				if(isdefined(str_zone) && isdefined(level.var_141e4a5f[var_5f3b05e8][str_zone]))
				{
					var_71c80ceb = level.var_141e4a5f[var_5f3b05e8][str_zone];
					rappel = var_71c80ceb.rappel;
					if(distancesquared(zombie.origin, rappel.origin) < max_dist_sq)
					{
						/#
							println((("" + zombie getentitynumber()) + "") + var_5f3b05e8);
						#/
						zombie.var_29656770 = {#target_zone:var_5f3b05e8, #hash_178696d:var_71c80ceb.posonnavmesh, #hash_990bf66b:str_zone};
						zombie.v_zombie_custom_goal_pos = var_71c80ceb.var_db90fcba;
						zombie.var_b0709fcc = &function_ab69ca2e;
						zombie thread function_85dc9b9d();
					}
				}
			}
		}
	}
}

/*
	Name: function_ab69ca2e
	Namespace: namespace_3fa257af
	Checksum: 0xC4CD920A
	Offset: 0xB9D8
	Size: 0x26
	Parameters: 0
	Flags: None
*/
function function_ab69ca2e()
{
	if(isdefined(self.v_zombie_custom_goal_pos) && isdefined(self.var_29656770))
	{
		return true;
	}
	return false;
}

/*
	Name: function_85dc9b9d
	Namespace: namespace_3fa257af
	Checksum: 0x3EC9B188
	Offset: 0xBA08
	Size: 0x352
	Parameters: 0
	Flags: None
*/
function function_85dc9b9d()
{
	level endon(#"end_game");
	self endon(#"death");
	var_17b7891d = "64b92e37d913e599" + #"hash_5875102b7da237bc";
	self notify(var_17b7891d);
	self endon(var_17b7891d);
	var_41611e5c = self.favoriteenemy;
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"zone_change", #"goal", #"bad_path");
		if(is_true(self.interdimensional_gun_kill))
		{
			self.var_29656770 = undefined;
			self.var_b0709fcc = undefined;
			return;
		}
		if(!isdefined(self.favoriteenemy) || self.favoriteenemy !== var_41611e5c)
		{
			/#
				println(("" + self getentitynumber()) + "");
			#/
			break;
		}
		if(waitresult._notify == #"bad_path")
		{
			/#
				if(isdefined(self.v_zombie_custom_goal_pos))
				{
					println((((("" + self getentitynumber()) + "") + self.origin) + "") + self.v_zombie_custom_goal_pos);
				}
			#/
			self setgoal(self.origin);
			waitframe(1);
			break;
		}
		str_zone = self zm_utility::get_current_zone();
		if(str_zone === self.var_29656770.target_zone)
		{
			/#
				println((("" + self getentitynumber()) + "") + str_zone);
			#/
			break;
		}
		if(waitresult._notify == "goal" && isdefined(self.v_zombie_custom_goal_pos))
		{
			if(distancesquared(self.origin, self.v_zombie_custom_goal_pos) < sqr(self.goalradius))
			{
				/#
					println(("" + self getentitynumber()) + "");
				#/
				break;
			}
			else
			{
				self setgoal(self.v_zombie_custom_goal_pos);
			}
		}
	}
	self.var_29656770 = undefined;
	self.v_zombie_custom_goal_pos = undefined;
	self.var_b0709fcc = undefined;
}

/*
	Name: function_9d23c457
	Namespace: namespace_3fa257af
	Checksum: 0x4BDE5674
	Offset: 0xBD68
	Size: 0x8C
	Parameters: 0
	Flags: None
*/
function function_9d23c457()
{
	level clientfield::set("" + #"hash_6eb96d2ad043aa56", 1);
	level flag::wait_till(#"intro_scene_done");
	level clientfield::set("" + #"hash_6eb96d2ad043aa56", 0);
}

/*
	Name: function_4cc5fca6
	Namespace: namespace_3fa257af
	Checksum: 0x96CE1F4A
	Offset: 0xBE00
	Size: 0xAC
	Parameters: 0
	Flags: None
*/
function function_4cc5fca6()
{
	level endon(#"end_game");
	level clientfield::set("" + #"hash_7b3ada6e5b1cf81e", 1);
	array::wait_till(function_a1ef346b(), "fasttravel_over", 15);
	level clientfield::set("" + #"hash_7b3ada6e5b1cf81e", 0);
}

/*
	Name: function_4a62319d
	Namespace: namespace_3fa257af
	Checksum: 0xB0BB249E
	Offset: 0xBEB8
	Size: 0xA4
	Parameters: 0
	Flags: None
*/
function function_4a62319d()
{
	self endon(#"death");
	self waittill(#"risen");
	if(self istouching(getent("portal_spawn_fx_volume", "targetname")) && self.archetype === #"zombie")
	{
		self clientfield::increment("" + #"hash_636aa4e3dd50512a");
	}
}

/*
	Name: function_d81240c3
	Namespace: namespace_3fa257af
	Checksum: 0xC58471CC
	Offset: 0xBF68
	Size: 0x19C
	Parameters: 0
	Flags: None
*/
function function_d81240c3()
{
	level endon(#"game_ended", #"hash_4fbe4720f6f13107");
	while(!isdefined(level.var_117d5f10))
	{
		waitframe(1);
	}
	level.var_117d5f10 endon(#"death");
	level.var_117d5f10 clientfield::set("" + #"hash_315d8062badb2345", 1);
	level flag::wait_till("exfil_heli_arrived");
	var_fcda785d = getent("prb_mil_ru_heli_trans", "targetname");
	if(isdefined(var_fcda785d))
	{
		var_fcda785d unlink();
		var_fcda785d linkto(level.var_117d5f10, "tag_probe_attach", (0, 0, 0), (0, 0, 0));
	}
	exploder::exploder("fxexp_exfil_rotorwash");
	level flag::wait_till("exfil_cleared");
	level.var_117d5f10 clientfield::set("" + #"hash_315d8062badb2345", 2);
}

/*
	Name: function_a56b42c0
	Namespace: namespace_3fa257af
	Checksum: 0x58E74025
	Offset: 0xC110
	Size: 0x11A
	Parameters: 0
	Flags: None
*/
function function_a56b42c0()
{
	if(level.round_number === 10 && !zm_round_spawning::function_fab464c4())
	{
		level waittill(#"start_of_round");
		while(true)
		{
			active_zones = zm_zonemgr::get_active_zone_names();
			zone_name = array::random(active_zones);
			if(isdefined(zone_name))
			{
				spawn_ai = zm_utility::function_cce73165("mechz_location", #"hash_704a090ff9fcffd0", zone_name);
				if(isdefined(spawn_ai))
				{
					spawn_ai.var_5e54763a = zone_name;
					spawn_ai.var_98f1f37c = 1;
					callback::function_50fdac80(&function_a56b42c0);
					break;
				}
			}
			wait(1);
		}
	}
}

/*
	Name: function_d888610a
	Namespace: namespace_3fa257af
	Checksum: 0xD1B22C0D
	Offset: 0xC238
	Size: 0x154
	Parameters: 0
	Flags: Private
*/
function private function_d888610a()
{
	level endon(#"end_game");
	while(true)
	{
		a_players = function_a1ef346b();
		foreach(player in a_players)
		{
			if(player.cached_zone_name === "zone_power_substation2" || player.cached_zone_name === "zone_secret_spy_tunnel")
			{
				player clientfield::set_to_player("" + #"hash_46bbaae5eb8a7080", 1);
				continue;
			}
			player clientfield::set_to_player("" + #"hash_46bbaae5eb8a7080", 0);
		}
		wait(0.5);
	}
}

/*
	Name: function_c13a2cf5
	Namespace: namespace_3fa257af
	Checksum: 0x725DC702
	Offset: 0xC398
	Size: 0x124
	Parameters: 0
	Flags: None
*/
function function_c13a2cf5()
{
	/#
		if(!zm_utility::is_ee_enabled())
		{
			return;
		}
		util::waittill_can_add_debug_command();
		util::add_devgui("", "");
		util::add_devgui("", "");
		util::add_devgui("", "");
		util::add_devgui("", "");
		level flag::wait_till_all([2:"", 1:"", 0:#"intro_scene_done"]);
		wait(2);
		level thread function_dd856618();
	#/
}

/*
	Name: function_dd856618
	Namespace: namespace_3fa257af
	Checksum: 0xB07CDAE6
	Offset: 0xC4C8
	Size: 0x4C6
	Parameters: 0
	Flags: None
*/
function function_dd856618()
{
	/#
		while(true)
		{
			if(getdvarint(#"hash_7f4e76de02a19b25", 0) > 0)
			{
				if(!is_true(level.var_f979d504))
				{
					level function_dd3953d3();
					level.var_f979d504 = 1;
				}
				setdvar(#"hash_7f4e76de02a19b25", 0);
			}
			if(getdvarint(#"hash_31ba51c79831310b", 0))
			{
				if(!is_true(level.var_6d81f20c))
				{
					level function_58f27026();
					level function_42f2b8ac();
					level function_81acf2cf();
					level zombie_devgui_goto_round(8);
					level function_284985a5(#"hash_532d4747d3b67ad1", #"step_2");
					level.var_6d81f20c = 1;
				}
				setdvar(#"hash_31ba51c79831310b", 0);
			}
			if(getdvarint(#"hash_3c2831f7935e7323", 0))
			{
				if(!is_true(level.var_68bddf8a))
				{
					foreach(player in function_a1ef346b())
					{
						player function_e6b581e7(1);
					}
					level.var_68bddf8a = 1;
				}
				setdvar(#"hash_3c2831f7935e7323", 0);
			}
			if(getdvarint(#"hash_23fec5164390c16f", 0))
			{
				if(!is_true(level.var_f87312e7))
				{
					foreach(player in function_a1ef346b())
					{
						player function_e6b581e7(0);
					}
					level.var_f87312e7 = 1;
				}
				setdvar(#"hash_23fec5164390c16f", 0);
			}
			if(getdvarint(#"hash_59cf9e74e0825b8a", 0))
			{
				if(!is_true(level.var_29fe9e88))
				{
					level function_e4146082();
					level.var_29fe9e88 = 1;
				}
				setdvar(#"hash_59cf9e74e0825b8a", 0);
			}
			if(getdvarint(#"hash_67e70c8f0396cfa8", 0))
			{
				if(!is_true(level.var_5860e2da))
				{
					level function_115a1fd();
					level.var_5860e2da = 1;
				}
				setdvar(#"hash_67e70c8f0396cfa8", 0);
			}
			waitframe(3);
		}
	#/
}

/*
	Name: function_dd3953d3
	Namespace: namespace_3fa257af
	Checksum: 0x3744B4E6
	Offset: 0xC998
	Size: 0x224
	Parameters: 0
	Flags: None
*/
function function_dd3953d3()
{
	/#
		level function_58f27026();
		level function_42f2b8ac();
		level function_81acf2cf();
		level function_1365e765();
		level zombie_devgui_goto_round(8);
		switch(getdvarint(#"hash_7f4e76de02a19b25", 0))
		{
			case 1:
			default:
			{
				step_name = #"hash_587e74fe327f43fb";
				break;
			}
			case 2:
			{
				step_name = #"hash_428542f9f5e07c8e";
				break;
			}
			case 3:
			{
				step_name = #"hash_2eee1c712127c1ca";
				break;
			}
			case 4:
			{
				step_name = #"hash_4b1700b8df69481b";
				break;
			}
			case 5:
			{
				step_name = #"hash_63dee3cf914e5e20";
				break;
			}
			case 6:
			{
				step_name = #"hash_19376fa43a7e085c";
				break;
			}
			case 7:
			{
				step_name = #"hash_58a40205ad8ede62";
				break;
			}
			case 8:
			{
				step_name = #"hash_284338cc7c9db648";
				break;
			}
		}
		level function_284985a5(#"hash_389d6ed2b350d4ea", step_name);
	#/
}

/*
	Name: zombie_devgui_goto_round
	Namespace: namespace_3fa257af
	Checksum: 0xA10DEBDA
	Offset: 0xCBC8
	Size: 0x1B4
	Parameters: 1
	Flags: None
*/
function zombie_devgui_goto_round(target_round)
{
	/#
		player = getplayers()[0];
		if(target_round < 1)
		{
			target_round = 1;
		}
		level.devcheater = 1;
		level.zombie_total = 0;
		level.zombie_health = (isdefined(level.var_41dd92fd[#"zombie"].health) ? level.var_41dd92fd[#"zombie"].health : 100);
		zm_round_logic::set_round_number(target_round - 1);
		if(isdefined(level.var_e63636af))
		{
			[[level.var_e63636af]](target_round - 1);
		}
		level notify(#"kill_round");
		wait(1);
		zombies = getaiteamarray(level.zombie_team);
		if(isdefined(zombies))
		{
			for(i = 0; i < zombies.size; i++)
			{
				if(is_true(zombies[i].ignore_devgui_death))
				{
					continue;
				}
				zombies[i] dodamage(zombies[i].health + 666, zombies[i].origin);
			}
		}
	#/
}

/*
	Name: function_58f27026
	Namespace: namespace_3fa257af
	Checksum: 0xD35CAF4A
	Offset: 0xCD88
	Size: 0x464
	Parameters: 0
	Flags: None
*/
function function_58f27026()
{
	/#
		setdvar(#"zombie_unlock_all", 1);
		level flag::set("");
		level clientfield::set("", 1);
		power_trigs = getentarray("", "");
		foreach(trig in power_trigs)
		{
			if(isdefined(trig.script_int))
			{
				level flag::set("" + trig.script_int);
				level clientfield::set("", trig.script_int + 1);
			}
		}
		players = getplayers();
		foreach(player in players)
		{
			player zm_score::add_to_player_score(100000);
			player sr_scrap::function_afab250a(100000);
			player sr_scrap::function_a6d4221f(100000);
		}
		zombie_doors = getentarray("", "");
		for(i = 0; i < zombie_doors.size; i++)
		{
			if(!is_true(zombie_doors[i].has_been_opened))
			{
				zombie_doors[i] notify(#"trigger", {#activator:players[0]});
			}
			if(is_true(zombie_doors[i].power_door_ignore_flag_wait))
			{
				zombie_doors[i] notify(#"power_on");
			}
			waitframe(1);
		}
		zombie_airlock_doors = getentarray("", "");
		for(i = 0; i < zombie_airlock_doors.size; i++)
		{
			zombie_airlock_doors[i] notify(#"trigger", {#activator:players[0]});
			waitframe(1);
		}
		zombie_debris = getentarray("", "");
		for(i = 0; i < zombie_debris.size; i++)
		{
			if(isdefined(zombie_debris[i]))
			{
				zombie_debris[i] notify(#"trigger", {#activator:players[0]});
			}
			waitframe(1);
		}
		level notify(#"open_sesame");
		wait(1);
		setdvar(#"zombie_unlock_all", 0);
	#/
}

/*
	Name: function_42f2b8ac
	Namespace: namespace_3fa257af
	Checksum: 0x11A7BB2D
	Offset: 0xD1F8
	Size: 0x4C
	Parameters: 0
	Flags: None
*/
function function_42f2b8ac()
{
	/#
		level flag::set(#"hash_7d72f2dda7a4104e");
		level flag::set("");
	#/
}

/*
	Name: function_81acf2cf
	Namespace: namespace_3fa257af
	Checksum: 0x3143E002
	Offset: 0xD250
	Size: 0x272
	Parameters: 0
	Flags: None
*/
function function_81acf2cf()
{
	/#
		level flag::set(#"hash_20afa38b1f1c339e");
		level clientfield::set("" + #"hash_2e8ad83a0edc8ab4", 0);
		var_b9deb373 = struct::get_script_bundle_instances("", [1:"", 0:""]);
		var_f501ee56 = struct::get_script_bundle_instances("", [1:"", 0:""]);
		var_bc5ea9bc = arraycombine(var_b9deb373, var_f501ee56, 0, 0);
		var_1a4d3aef = struct::get_script_bundle_instances("", [1:"", 0:""]);
		var_bc5ea9bc = arraycombine(var_bc5ea9bc, var_1a4d3aef, 0, 0);
		foreach(var_8a36246d in var_bc5ea9bc)
		{
			if(var_8a36246d scene::is_playing())
			{
				var_8a36246d scene::stop(1);
			}
		}
		for(i = 0; i <= 10; i++)
		{
			level clientfield::set("" + #"hash_3fb8ca8c017ba7ac", i);
			waitframe(1);
		}
	#/
}

/*
	Name: function_1365e765
	Namespace: namespace_3fa257af
	Checksum: 0x39371C9
	Offset: 0xD4D0
	Size: 0x4C
	Parameters: 0
	Flags: None
*/
function function_1365e765()
{
	/#
		level flag::set(#"hash_5503fb2f49e6a242");
		level flag::set(#"hash_75f07aed08b6bb5e");
	#/
}

/*
	Name: function_e6b581e7
	Namespace: namespace_3fa257af
	Checksum: 0xC16E5CCC
	Offset: 0xD528
	Size: 0x32C
	Parameters: 1
	Flags: None
*/
function function_e6b581e7(var_9ff20235)
{
	/#
		level flag::wait_till("");
		start_weapon = self getcurrentweapon();
		if(is_true(var_9ff20235))
		{
			var_7625b6cc = "";
			var_27751b99 = 3;
		}
		else
		{
			var_7625b6cc = "";
			var_27751b99 = 1;
		}
		str_weapon_name = array::random([5:"", 4:"", 3:"", 2:"", 1:"", 0:""]);
		self function_749d2cfc(hash(str_weapon_name), hash(str_weapon_name + var_7625b6cc), var_27751b99);
		self aat::acquire(self getcurrentweapon());
		self waittill(#"weapon_change_complete");
		foreach(weapon in self getweaponslistprimaries())
		{
			if(weapon == start_weapon)
			{
				self switchtoweaponimmediate(weapon);
				self waittill(#"weapon_change_complete");
			}
		}
		self thread zm_perks::function_29387491(#"hash_47d7a8105237c88");
		self thread zm_perks::function_29387491(#"hash_38c08136902fd553");
		self thread zm_perks::function_29387491(#"hash_210097a75bb6c49a");
		self thread zm_perks::function_29387491(#"hash_7f98b3dd3cce95aa");
		str_item_name = namespace_f999c142::function_ff28876a(3);
		self namespace_f999c142::function_923efc48(str_item_name, 3);
		self namespace_1cc7b406::function_52df229a(#"hash_7bc70addda19ca00");
	#/
}

/*
	Name: function_749d2cfc
	Namespace: namespace_3fa257af
	Checksum: 0xD8C6D013
	Offset: 0xD860
	Size: 0x266
	Parameters: 3
	Flags: None
*/
function function_749d2cfc(str_weapon_name, str_item_name, var_27751b99)
{
	/#
		self endon(#"disconnect");
		if(isdefined(str_item_name))
		{
			point = function_4ba8fde(str_item_name);
			if(isdefined(point) && isdefined(var_27751b99) && isdefined(level.var_fee1eaaf))
			{
				new_item = [[level.var_fee1eaaf]](point);
				if(isdefined(new_item))
				{
					point = new_item;
					point.var_a8bccf69 = var_27751b99;
				}
			}
			if(isdefined(point.var_a6762160.var_a53e9db0))
			{
				weapon = namespace_65181344::function_67456242(point.var_a6762160);
				dropitem = item_drop::drop_item(0, weapon, 1, weapon.maxammo, point.id, self.origin, self.angles, 1);
				dropitem.var_519e776c = 1;
				dropitem.hidetime = 1;
				dropitem hide();
				self zm_weapons::function_98776900(dropitem, 0, 0, 1);
			}
			else
			{
				self zm_weapons::function_98776900(point, 0, 0, 1);
			}
			if(isdefined(var_27751b99))
			{
				self item_inventory::function_d92c6b5b(self.currentweapon, 0);
				maxammo = self.currentweapon.maxammo;
				var_53b14ebf = self function_b7f1fd2c(self.currentweapon);
				self setweaponammoclip(self.currentweapon, var_53b14ebf);
				self setweaponammostock(self.currentweapon, maxammo);
				self notify(#"hash_75ec9942d2d5fd0f");
			}
		}
	#/
}

/*
	Name: function_e4146082
	Namespace: namespace_3fa257af
	Checksum: 0xFC4888A8
	Offset: 0xDAD0
	Size: 0x98
	Parameters: 0
	Flags: None
*/
function function_e4146082()
{
	/#
		foreach(player in function_a1ef346b())
		{
			player function_86af79f6();
		}
	#/
}

/*
	Name: function_86af79f6
	Namespace: namespace_3fa257af
	Checksum: 0x4078FC68
	Offset: 0xDB70
	Size: 0x7C
	Parameters: 0
	Flags: None
*/
function function_86af79f6()
{
	/#
		self endon(#"disconnect", #"death");
		while(self zm_utility::is_drinking())
		{
			wait(0.1);
		}
		self zm_weapons::weapon_give(getweapon(""), 1);
	#/
}

/*
	Name: function_115a1fd
	Namespace: namespace_3fa257af
	Checksum: 0xAB99DE5F
	Offset: 0xDBF8
	Size: 0x98
	Parameters: 0
	Flags: None
*/
function function_115a1fd()
{
	/#
		foreach(player in function_a1ef346b())
		{
			player thread function_c026e69b();
		}
	#/
}

/*
	Name: function_c026e69b
	Namespace: namespace_3fa257af
	Checksum: 0x759B8160
	Offset: 0xDC98
	Size: 0x7C
	Parameters: 0
	Flags: None
*/
function function_c026e69b()
{
	/#
		self endon(#"disconnect", #"death");
		while(self zm_utility::is_drinking())
		{
			wait(0.1);
		}
		self zm_weapons::weapon_give(getweapon(""), 1);
	#/
}

/*
	Name: function_284985a5
	Namespace: namespace_3fa257af
	Checksum: 0xA6E43111
	Offset: 0xDD20
	Size: 0xC8
	Parameters: 2
	Flags: None
*/
function function_284985a5(ee_name, step_name)
{
	/#
		ee = self._ee[ee_name];
		step_index = zm_sq::function_9212ff4d(ee_name, step_name);
		if(ee.started && step_index <= ee.current_step)
		{
			return false;
		}
		ee.skip_to_step = step_index;
		if(ee.started)
		{
			function_905781df(ee_name);
		}
		else
		{
			level zm_sq::start(ee.name);
		}
		return true;
	#/
}

/*
	Name: function_905781df
	Namespace: namespace_3fa257af
	Checksum: 0x96682C0A
	Offset: 0xDDF8
	Size: 0xA4
	Parameters: 1
	Flags: None
*/
function function_905781df(ee_name)
{
	/#
		ee = self._ee[ee_name];
		if(ee.started)
		{
			while(ee.current_step <= (ee.skip_to_step - 1))
			{
				ee.steps[ee.current_step] notify(#"end_early");
				wait(0.5);
			}
		}
		else
		{
			iprintlnbold("");
		}
	#/
}

/*
	Name: run_step
	Namespace: namespace_3fa257af
	Checksum: 0x8C4722CE
	Offset: 0xDEA8
	Size: 0x234
	Parameters: 3
	Flags: None
*/
function run_step(ee, step, var_5ea5c94d)
{
	/#
		var_4ef8d79b = isentity(self);
		if(var_4ef8d79b)
		{
			self endon(#"death");
			self endon(#"disconnect");
		}
		self endon(#"game_ended");
		ee.started = 1;
		step.started = 1;
		self thread function_3f795dc3(ee, step, var_5ea5c94d);
		if(!step.completed)
		{
			waitresult = undefined;
			waitresult = self waittill(step.var_e788cdd7 + "", step.var_e788cdd7 + "");
		}
		if(game.state === #"postgame")
		{
			return;
		}
		ended_early = isdefined(waitresult) && waitresult._notify == (step.var_e788cdd7 + "");
		[[step.cleanup_func]](var_5ea5c94d, ended_early);
		step.cleaned_up = 1;
		if(game.state === #"postgame")
		{
			return;
		}
		self flag::set(step.var_e788cdd7 + "");
		if(isdefined(step.next_step))
		{
			var_5ea5c94d = 0;
			ee.current_step++;
			self thread run_step(ee, step.next_step, var_5ea5c94d);
		}
		else
		{
			ee.completed = 1;
			self flag::set(ee.name + "");
		}
	#/
}

/*
	Name: function_3f795dc3
	Namespace: namespace_3fa257af
	Checksum: 0xEB2A7C31
	Offset: 0xE0E8
	Size: 0x154
	Parameters: 3
	Flags: Private
*/
function private function_3f795dc3(ee, step, var_5ea5c94d)
{
	/#
		if(isentity(self))
		{
			self endon(#"death");
			self endon(#"disconnect");
		}
		self endon(#"game_ended");
		step endoncallback(&function_df365859, #"end_early");
		self notify(step.var_e788cdd7 + "");
		if(isdefined(step.var_6cc77d4e))
		{
			level zm_sq::objective_set(step.var_6cc77d4e, step.a_targets, undefined, step.str_objective_text);
		}
		[[step.setup_func]](var_5ea5c94d);
		step.completed = 1;
		if(isdefined(step.var_6cc77d4e))
		{
			level zm_sq::objective_complete(step.var_6cc77d4e, step.a_targets);
		}
		self notify(step.var_e788cdd7 + "");
	#/
}

/*
	Name: function_df365859
	Namespace: namespace_3fa257af
	Checksum: 0xBB37AB7B
	Offset: 0xE248
	Size: 0x9C
	Parameters: 1
	Flags: Private
*/
function private function_df365859(notifyhash)
{
	/#
		self.completed = 1;
		if(isdefined(self.var_6cc77d4e))
		{
			level zm_sq::objective_complete(self.var_6cc77d4e, self.a_targets);
		}
		waittillframeend();
		self.ee.owner notify(self.var_e788cdd7 + "");
		self.ee.owner notify(self.var_e788cdd7 + "");
	#/
}

/*
	Name: function_cd7a3de4
	Namespace: namespace_3fa257af
	Checksum: 0x80C90A82
	Offset: 0xE2F0
	Size: 0xD4
	Parameters: 0
	Flags: None
*/
function function_cd7a3de4()
{
	/#
		util::add_debug_command("");
		util::add_debug_command("");
		util::add_debug_command("");
		util::add_debug_command("");
		util::add_debug_command("");
		util::add_debug_command("");
		util::add_debug_command("");
		zm_devgui::add_custom_devgui_callback(&cmd);
	#/
}

/*
	Name: cmd
	Namespace: namespace_3fa257af
	Checksum: 0x24DF8551
	Offset: 0xE3D0
	Size: 0x262
	Parameters: 1
	Flags: None
*/
function cmd(cmd)
{
	/#
		switch(cmd)
		{
			case "hash_164c82054a4ebab8":
			{
				function_bf105732(1);
				break;
			}
			case "hash_841ce5811a32fe":
			{
				function_bf105732(0);
				break;
			}
			case "hash_1dfa325a761c2516":
			{
				function_e2610c23();
				break;
			}
			case "hash_3cdd5eae8d7817ac":
			{
				function_30e6bbd6();
				break;
			}
			case "hash_6be1051cba4047d8":
			{
				foreach(player in function_a1ef346b())
				{
					player thread function_23c31b4e();
				}
				break;
			}
			case "hash_f883dd07b22ce92":
			{
				level notify(#"hash_31a61be99d69708a");
				foreach(player in function_a1ef346b())
				{
					player clientfield::set("" + #"hash_63af42145e260fb5", 0);
				}
				break;
			}
			case "hash_1b44e1a5f513a996":
			{
				function_7b342056();
				break;
			}
		}
	#/
}

/*
	Name: function_30e6bbd6
	Namespace: namespace_3fa257af
	Checksum: 0xED99DAB1
	Offset: 0xE640
	Size: 0x2C
	Parameters: 0
	Flags: Private
*/
function private function_30e6bbd6()
{
	/#
		level flag::set(#"hash_3f926cd1d573549d");
	#/
}

/*
	Name: function_7b342056
	Namespace: namespace_3fa257af
	Checksum: 0x67925BB2
	Offset: 0xE678
	Size: 0xB0
	Parameters: 0
	Flags: None
*/
function function_7b342056()
{
	/#
		foreach(player in function_a1ef346b())
		{
			player zm_weapons::weapon_give(getweapon(""), 1);
		}
	#/
}

