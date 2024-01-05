#using script_6cc18c65e4f06fd0;
#using script_66f2b1934f77b26c;
#using scripts\zm\zm_gold_main_quest.gsc;
#using script_4187b16829c63b21;
#using script_25ebc9ade08aed84;
#using scripts\zm\zm_gold_ww_quest.gsc;
#using script_46fe62930372dc4e;
#using script_60d2812480bc5591;
#using script_5fd73298643b6fff;
#using scripts\zm\zm_gold_util.gsc;
#using script_7492032440d4d998;
#using scripts\zm\zm_gold_pap_quest.gsc;
#using script_1d777b787ec7d4bb;
#using scripts\zm\zm_gold_zones.gsc;
#using script_3e57cc1a9084fdd6;
#using script_1e13c013927b6692;
#using script_58860a35d0555f74;
#using scripts\zm_common\gametypes\zm_gametype.gsc;
#using script_663d23db6a134b9c;
#using script_3411bb48d41bd3b;
#using script_ab862743b3070a;
#using scripts\zm_common\zm_devgui.gsc;
#using script_77b61a4178efdbc4;
#using scripts\zm\zm_ai_raz.gsc;
#using scripts\zm_common\zm_sq.gsc;
#using scripts\zm_common\zm_magicbox.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_power.gsc;
#using scripts\zm_common\zm_player.gsc;
#using scripts\zm_common\zm_perks.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using script_b9d273dc917ee1f;
#using scripts\zm_common\zm_fasttravel.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\callbacks.gsc;
#using scripts\zm_common\zm.gsc;
#using script_7b1cd3908a825fdd;
#using script_72d96920f15049b8;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\scriptmodels_shared.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using script_3a704cbcf4081bfb;
#using scripts\core_common\load_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using script_d9b5c8b1ad38ef5;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\compass.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using script_75d4e6ecb8f05163;

#namespace namespace_808e3265;

/*
	Name: function_ea23e13b
	Namespace: namespace_808e3265
	Checksum: 0xDC254F4B
	Offset: 0xE68
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ea23e13b()
{
	level notify(1802438847);
}

/*
	Name: opt_in
	Namespace: namespace_808e3265
	Checksum: 0xFC007B70
	Offset: 0xE88
	Size: 0x13C
	Parameters: 0
	Flags: AutoExec
*/
function autoexec opt_in()
{
	level.aat_in_use = 1;
	level.bgb_machine_count = 2;
	level.random_pandora_box_start = 1;
	level.var_8bb7479c = #"hash_10124966022c3040";
	level.var_72a3d8bc = #"hash_7c308e44e34e652b";
	level.var_6e297a0d = &function_4b29f610;
	system::ignore(#"hash_36cdf1547e49b57a");
	namespace_4abf1500::function_88645994(#"hash_1367b294390f3ba9", #"hash_6aeeb56daf9669c5", #"hash_483da168d7c978d9", #"hash_7ad762022f44fb97", #"hash_37b19a33841ec0fa", #"hash_117cfd8b471ea733", #"hash_2fc538b8d645480f", #"hash_540a035e499e01ca", #"hash_2d027ad8e44050b8");
}

/*
	Name: main
	Namespace: namespace_808e3265
	Checksum: 0xFFC025E1
	Offset: 0xFD0
	Size: 0xE1C
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	level.var_dfee7fc2 = #"hash_7c313a787b088ec3";
	zm::init_fx();
	namespace_f7b3ed9::init();
	namespace_e0b1e9f5::init();
	namespace_2a67e53::init();
	namespace_5c4c9a39::init();
	namespace_b7a7e548::init();
	namespace_9f2e6680::init();
	namespace_47809ab2::init();
	namespace_5ce39742::init();
	namespace_af171776::init();
	namespace_1812c3f4::init();
	namespace_4ce4e65e::init();
	namespace_36ebd7e4::init();
	namespace_c4d353e7::init();
	namespace_8dac58da::init();
	namespace_13fefac0::init();
	clientfield::register_clientuimodel("player_lives", 1, 2, "int");
	clientfield::register("toplayer", "" + #"hash_697cae64fbcf81f8", 1, 1, "int");
	clientfield::register("allplayers", "" + #"hash_63af42145e260fb5", 1, 2, "int");
	clientfield::register("world", "" + #"hash_7d7dcebcb0511b14", 1, 1, "int");
	clientfield::register("world", "" + #"hash_5368b2aa337a0ec3", 16000, 2, "int");
	clientfield::register("world", "" + #"hash_4c60439fcb3b4056", 16000, 1, "int");
	zm_perks::function_9760a58b(#"hash_38c08136902fd553");
	level.var_7f72eddd = "default_zombies_gold";
	level.var_dafeed10 = "exfil_gold_";
	level.var_26ed6a07 = 600;
	level.var_c86f12d4 = 200;
	level.var_aaf7505f = 90;
	level.var_baed3b8e = 1750;
	level.var_ac94c2b8 = 2;
	namespace_591b4396::function_fa5bd408(array("zone_burnt_forest_defend", "zone_burnt_forest_defend_outside"));
	level.var_fc439a95 = #"hash_5bd48d860ebd5a41";
	level.var_f454f2b5 = 0;
	level.var_8abe919a = 0;
	callback::on_round_end(&function_1688adb7);
	level.fn_custom_round_ai_spawn = &function_fb609897;
	level.var_ebc170a1 = 15;
	level.var_9583b85c = 10;
	spawner::function_89a2cd87(#"zombie_dog", &namespace_85745671::function_2089690e);
	level.default_start_location = "start_room";
	level.default_game_mode = "zclassic";
	level._allow_melee_weapon_switching = 1;
	level.zombiemode_reusing_pack_a_punch = 1;
	level.custom_spawner_entry[#"crawl"] = &zm_spawner::function_45bb11e4;
	level.var_d0ab70a2 = #"hash_466c279241bfbf7c";
	level.player_out_of_playable_area_monitor = getdvarint(#"hash_77fd1a6fe2acd976", 0);
	level.var_e2f95698 = #"hash_10051f0481ec163a";
	level.var_462ca9bb = #"blops_taacom";
	level.var_dbf9c70d = &function_452e5ad6;
	level.player_out_of_playable_area_override = &function_dd3a31d8;
	level.player_out_of_playable_area_monitor_callback = &player_out_of_playable_area_monitor_callback;
	level thread function_d4738f46();
	level.var_1c486b12 = [];
	function_aa7d6bdd((-49800, -19833, 727), 200, #"village");
	load::main();
	setupminimap("", "village");
	level.zones = [];
	level.zone_manager_init_func = &namespace_ac0e32c5::zone_init;
	level thread zm_zonemgr::manage_zones("zone_village");
	level.var_ce7af4fa = 1;
	level.var_6f6cc58 = &function_6f6cc58;
	level.var_68e3cf24 = 1;
	level.var_b80c4ecc = [16:"zone_armory2", 15:"zone_armory", 14:"zone_trenches_office", 13:"zone_field_hospital", 12:"zone_tents_a", 11:"zone_tents_b", 10:"zone_walkway", 9:"zone_radio_room", 8:"zone_colonel_office", 7:"zone_napalm_strike2", 6:"zone_artillery_strike2", 5:"zone_artillery_strike", 4:"zone_chopper_gunner3", 3:"zone_chopper_gunner2", 2:"zone_weapon_lab", 1:"zone_armory", 0:"zone_village_house"];
	callback::on_spawned(&on_player_spawned);
	callback::on_player_killed(&on_death);
	spawner::add_archetype_spawn_function(#"mimic", &function_64ed78df);
	level thread function_e0a4ccda();
	level thread function_b2ad70b7();
	level thread sndfunctions();
	level thread function_16a7f6db();
	level thread function_53555fd2();
	level thread function_25696a75();
	level thread zm_perks::spare_change();
	level thread function_d0e6ff7a("zmintel_gold_omega_audiolog_2", "t_fling_zmintel_gold_omega_audiolog_2", 100);
	level thread function_d0e6ff7a("zmintel_gold_maxis_audiolog_1", "t_fling_zmintel_gold_maxis_audiolog_1", 100);
	level thread function_d0e6ff7a("zmintel_gold_requiem_audiolog_4", "t_fling_zmintel_gold_requiem_audiolog_4", 400);
	level thread function_a1960bde();
	level thread function_e3e3f619();
	level thread function_109d90d3();
	/#
		level thread function_37597f29();
	#/
	level scene::add_scene_func(level.var_dfee7fc2, &function_9d0a5271, "play");
	level scene::add_scene_func(level.var_dfee7fc2, &function_358633e5, "done");
	level scene::add_scene_func(#"p9_fxanim_zm_gold_chemical_mixer_bundle", &function_76c00f63, "init");
	level scene::add_scene_func(#"hash_122db1604a2e8803", &function_f3c4fbd9, "play");
	level scene::add_scene_func(#"hash_fb0fc45d9039733", &function_abd6be92, "play");
	level thread scene::init("p9_fxanim_zm_gold_shutters_peck_bundle");
	level thread scene::init("p9_fxanim_zm_gold_chemical_mixer_bundle");
	level thread scene::init("p9_fxanim_ger_tank_cabinet_metal_standing_01_bundle");
	level thread scene::init("p9_fxanim_ger_tank_cabinet_metal_standing_01_bundle_02");
	level thread scene::init("p9_fxanim_ger_tank_cabinet_metal_standing_01_bundle_03");
	level.var_fd959dcf = "chopper_gunner_vol_mountain";
	namespace_e8c18978::function_d887d24d("chopper_gunner_vol_village");
	namespace_e8c18978::function_d887d24d("chopper_gunner_rocky_defense");
	namespace_e8c18978::function_d887d24d("chopper_gunner_jungle_defense");
	namespace_e8c18978::function_d887d24d("chopper_gunner_scorched_defense");
	setdvar(#"hash_7b06b8037c26b99b", 115);
	setdvar(#"hkai_pathfinditerationlimit", 1500);
	setdvar(#"hash_4c706136b82e86a5", -50);
	var_98b2fbc9 = spawnstruct();
	var_98b2fbc9.var_fc96f513 = "aib_t9_zm_vign_rav_seated_01";
	var_98b2fbc9.lod = 2;
	var_98b2fbc9.var_7d8cef45 = 2;
	var_43b94aa4 = spawnstruct();
	var_43b94aa4.var_fc96f513 = "aib_t9_zm_vign_peck_seated_01";
	var_43b94aa4.lod = 2;
	var_43b94aa4.var_7d8cef45 = 2;
	function_596712a4([0:var_98b2fbc9], [3:"zone_peck_quarters", 2:"zone_scientist", 1:"zone_village2", 0:"zone_atrium"]);
	function_596712a4([0:var_43b94aa4], [0:"zone_napalm_strike2"]);
	zm_spawner::function_97ee316((-49732, -19891, 673), "spawn_location");
	zm_spawner::function_97ee316((-49732, -19891, 673), "mimic_location");
	zm_spawner::function_97ee316((-49732, -19891, 673), "raz_location");
	zm_spawner::function_97ee316((-49732, -19891, 673), "dog_location");
	level.var_6ceacf64 = &function_cdc822b;
	namespace_1fd59e39::function_1376ec37((-49262, -19390, 954), 800);
	namespace_1fd59e39::function_1376ec37((-48587, -19605, 614), 400);
	namespace_1fd59e39::function_1376ec37((-48811, -19978, 692), 200);
}

/*
	Name: function_cdc822b
	Namespace: namespace_808e3265
	Checksum: 0xF9E27A40
	Offset: 0x1DF8
	Size: 0x46
	Parameters: 0
	Flags: Linked
*/
function function_cdc822b()
{
	if(!isdefined(self.var_73a3271))
	{
		self.var_73a3271 = gettime() + 2000;
	}
	if(gettime() > self.var_73a3271)
	{
		self.var_73a3271 = gettime() + 2000;
		return true;
	}
	return false;
}

/*
	Name: function_dd3a31d8
	Namespace: namespace_808e3265
	Checksum: 0x233D8393
	Offset: 0x1E48
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_dd3a31d8()
{
	if(is_true(self.is_flung))
	{
		return 0;
	}
	return undefined;
}

/*
	Name: player_out_of_playable_area_monitor_callback
	Namespace: namespace_808e3265
	Checksum: 0xB2F88DB1
	Offset: 0x1E78
	Size: 0x26
	Parameters: 0
	Flags: Linked
*/
function player_out_of_playable_area_monitor_callback()
{
	if(is_true(self.is_flung))
	{
		return false;
	}
	return true;
}

/*
	Name: function_d4738f46
	Namespace: namespace_808e3265
	Checksum: 0x2309CAED
	Offset: 0x1EA8
	Size: 0x660
	Parameters: 0
	Flags: Linked
*/
function function_d4738f46()
{
	level endon(#"end_game");
	var_f27ded04 = getent("vol_player_in_village", "targetname");
	var_417f8343 = getent("vol_player_in_firebase", "targetname");
	var_1d1bbd52[#"village"] = [];
	for(i = 0; i < 4; i++)
	{
		var_1d1bbd52[#"village"][i] = struct::get("village_end_" + i, "targetname");
	}
	var_1d1bbd52[#"firebase"] = [];
	for(i = 0; i < 4; i++)
	{
		var_1d1bbd52[#"firebase"][i] = struct::get("firebase_end_" + i, "targetname");
	}
	while(true)
	{
		players = getplayers();
		foreach(player in players)
		{
			util::wait_network_frame();
			if(!isdefined(player))
			{
				continue;
			}
			if(player isinmovemode("ufo", "noclip") || is_true(level.disable_kill_thread) || getdvarint(#"zombie_cheat", 0) > 0)
			{
				continue;
			}
			if(player.sessionstate == "spectator")
			{
				continue;
			}
			if(is_true(player.hostmigrationcontrolsfrozen))
			{
				continue;
			}
			if(player.var_f22c83f5 === 1)
			{
				continue;
			}
			if(!player zm_player::in_life_brush() && (player zm_player::in_kill_brush() || !player zm_player::in_enabled_playable_area() || (isdefined(level.player_out_of_playable_area_override) && is_true(player [[level.player_out_of_playable_area_override]]()))) && !is_true(player.var_2c27f919) && !player scene::is_igc_active())
			{
				if(!istouching(player.origin, var_417f8343) && !istouching(player.origin, var_f27ded04))
				{
					if(!isdefined(player.var_42b83e3e))
					{
						player.var_42b83e3e = 1;
					}
					else
					{
						if(player.var_42b83e3e >= 3)
						{
							continue;
						}
						player.var_42b83e3e++;
					}
					n_closest_dist = 999999999;
					foreach(a_s_loc in var_1d1bbd52)
					{
						n_dist = distance2d(player.origin, a_s_loc[0].origin);
						if(n_dist < n_closest_dist)
						{
							n_closest_dist = n_dist;
							var_2ed46675 = a_s_loc;
						}
					}
					a_players_to_check = getplayers();
					for(i = 0; i < 4; i++)
					{
						b_safe = 1;
						s_loc = var_2ed46675[i];
						foreach(player_to_check in a_players_to_check)
						{
							if(player_to_check == player)
							{
								continue;
							}
							var_91d1913b = distancesquared(s_loc.origin, player_to_check.origin);
							if(var_91d1913b < 1024)
							{
								b_safe = 0;
								break;
							}
						}
						if(b_safe)
						{
							player setorigin(s_loc.origin + vectorscale((0, 0, 1), 32));
							player setvelocity((0, 0, 0));
							break;
						}
					}
				}
			}
		}
		wait(0.4);
	}
}

/*
	Name: function_9d0a5271
	Namespace: namespace_808e3265
	Checksum: 0x8EC2C8C2
	Offset: 0x2510
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function function_9d0a5271(a_ents)
{
	hidemiscmodels("hide_scene_models");
	hidemiscmodels("village_tower_1");
	hidemiscmodels("village_tower_2");
}

/*
	Name: function_358633e5
	Namespace: namespace_808e3265
	Checksum: 0x5930BE97
	Offset: 0x2570
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function function_358633e5(a_ents)
{
	showmiscmodels("hide_scene_models");
	showmiscmodels("village_tower_1");
	showmiscmodels("village_tower_2");
}

/*
	Name: function_d0e6ff7a
	Namespace: namespace_808e3265
	Checksum: 0x37DB5E84
	Offset: 0x25D0
	Size: 0x10C
	Parameters: 3
	Flags: Linked
*/
function function_d0e6ff7a(var_d5fa8477, var_8f788dfa, n_power)
{
	var_99bf2e73 = struct::get(var_d5fa8477, "scriptbundlename");
	t_damage = getent(var_8f788dfa, "targetname");
	t_damage setcandamage(1);
	s_waitresult = undefined;
	s_waitresult = t_damage waittill(#"trigger", #"damage");
	var_99bf2e73 namespace_4abf1500::function_c1974629(undefined, n_power);
	util::wait_network_frame();
	t_damage delete();
}

/*
	Name: function_4b29f610
	Namespace: namespace_808e3265
	Checksum: 0x88B4F736
	Offset: 0x26E8
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function function_4b29f610()
{
	array::thread_all(level.chests, &zm_magicbox::hide_chest);
}

/*
	Name: on_player_spawned
	Namespace: namespace_808e3265
	Checksum: 0xA09EF135
	Offset: 0x2720
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function on_player_spawned()
{
	self thread function_23c31b4e();
	self thread function_fab8c902();
}

/*
	Name: function_596712a4
	Namespace: namespace_808e3265
	Checksum: 0x8FD11925
	Offset: 0x2760
	Size: 0xB6
	Parameters: 2
	Flags: Linked
*/
function function_596712a4(var_383fe4d6, zone_names)
{
	foreach(zone in level.zones)
	{
		if(array::contains(zone_names, zone.name))
		{
			zone.var_7a10fbea = var_383fe4d6;
		}
	}
}

/*
	Name: function_fab8c902
	Namespace: namespace_808e3265
	Checksum: 0xE840D678
	Offset: 0x2820
	Size: 0x4D6
	Parameters: 0
	Flags: Linked
*/
function function_fab8c902()
{
	self endon(#"death");
	self.var_6f6efa4c = [];
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"zone_change");
		zone = waitresult.zone;
		/#
			if(is_true(level.var_babe0dcd))
			{
				continue;
			}
		#/
		if(isdefined(zone.var_7a10fbea))
		{
			var_7f04600c = [];
			var_f8ab5db9 = [];
			var_69a88b1c = zone.var_7a10fbea;
			if(self.var_6f6efa4c.size > 0)
			{
				foreach(var_3a009b84 in self.var_6f6efa4c)
				{
					if(array::contains(var_69a88b1c, var_3a009b84))
					{
						if(!isdefined(var_7f04600c))
						{
							var_7f04600c = [];
						}
						else if(!isarray(var_7f04600c))
						{
							var_7f04600c = array(var_7f04600c);
						}
						var_7f04600c[var_7f04600c.size] = var_3a009b84;
						continue;
					}
					if(!isdefined(var_f8ab5db9))
					{
						var_f8ab5db9 = [];
					}
					else if(!isarray(var_f8ab5db9))
					{
						var_f8ab5db9 = array(var_f8ab5db9);
					}
					var_f8ab5db9[var_f8ab5db9.size] = var_3a009b84;
				}
				var_69a88b1c = array::exclude(var_69a88b1c, var_7f04600c);
			}
			foreach(var_3a009b84 in var_f8ab5db9)
			{
				self scene::function_f81475ae(var_3a009b84.var_fc96f513);
				/#
					iprintlnbold("" + var_3a009b84.var_fc96f513);
				#/
			}
			self.var_6f6efa4c = array::exclude(self.var_6f6efa4c, var_f8ab5db9);
			foreach(var_3a009b84 in var_69a88b1c)
			{
				self scene::function_27f5972e(var_3a009b84.var_fc96f513, var_3a009b84.lod, var_3a009b84.var_7d8cef45);
				if(!isdefined(self.var_6f6efa4c))
				{
					self.var_6f6efa4c = [];
				}
				else if(!isarray(self.var_6f6efa4c))
				{
					self.var_6f6efa4c = array(self.var_6f6efa4c);
				}
				self.var_6f6efa4c[self.var_6f6efa4c.size] = var_3a009b84;
				/#
					iprintlnbold("" + var_3a009b84.var_fc96f513);
				#/
			}
		}
		else if(isdefined(self.var_6f6efa4c))
		{
			foreach(var_3a009b84 in self.var_6f6efa4c)
			{
				self scene::function_f81475ae(var_3a009b84.var_fc96f513);
				/#
					iprintlnbold("" + var_3a009b84.var_fc96f513);
				#/
			}
			self.var_6f6efa4c = [];
		}
	}
}

/*
	Name: on_death
	Namespace: namespace_808e3265
	Checksum: 0x88D92B08
	Offset: 0x2D00
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function on_death()
{
	self clientfield::set("" + #"hash_63af42145e260fb5", 0);
}

/*
	Name: function_31b6f21e
	Namespace: namespace_808e3265
	Checksum: 0xCAF2E711
	Offset: 0x2D38
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function function_31b6f21e(str_notify)
{
	self clientfield::set("" + #"hash_63af42145e260fb5", 0);
}

/*
	Name: function_b2ad70b7
	Namespace: namespace_808e3265
	Checksum: 0xE8103199
	Offset: 0x2D78
	Size: 0x1F0
	Parameters: 0
	Flags: Linked
*/
function function_b2ad70b7()
{
	var_201ed983 = [4:"zone_colonel_office", 3:"zone_trenches_office", 2:"zone_walkway", 1:"zone_chopper_gunner3", 0:"zone_chopper_gunner2"];
	var_6e56c0a1 = [2:"zone_armory2", 1:"zone_armory", 0:"zone_napalm_strike2"];
	var_dee8bc1d = [5:"zone_weapon_lab", 4:"zone_field_hospital", 3:"zone_tents_a", 2:"zone_tents_b", 1:"zone_artillery_strike2", 0:"zone_artillery_strike"];
	while(true)
	{
		waitresult = undefined;
		waitresult = level waittill(#"power_on1", #"power_on2", #"power_on3");
		if(waitresult._notify === "power_on1")
		{
			function_5e9f7ede("power_on1", var_201ed983);
		}
		else
		{
			if(waitresult._notify === "power_on2")
			{
				function_5e9f7ede("power_on2", var_6e56c0a1);
			}
			else
			{
				function_5e9f7ede("power_on3", var_dee8bc1d);
			}
		}
	}
}

/*
	Name: function_5e9f7ede
	Namespace: namespace_808e3265
	Checksum: 0x850B4E51
	Offset: 0x2F70
	Size: 0x200
	Parameters: 2
	Flags: Linked
*/
function function_5e9f7ede(flag_name, zones)
{
	if(level flag::get(flag_name))
	{
		level.var_b80c4ecc = array::exclude(level.var_b80c4ecc, zones);
		foreach(player in getplayers())
		{
			if(player zm_zonemgr::is_player_in_zone(zones))
			{
				player clientfield::set("" + #"hash_63af42145e260fb5", 0);
			}
		}
	}
	else
	{
		level.var_b80c4ecc = arraycombine(level.var_b80c4ecc, zones);
		foreach(player in getplayers())
		{
			if(player zm_zonemgr::is_player_in_zone(zones))
			{
				player clientfield::set("" + #"hash_63af42145e260fb5", 1);
			}
		}
	}
}

/*
	Name: function_23c31b4e
	Namespace: namespace_808e3265
	Checksum: 0x3A04B7AE
	Offset: 0x3178
	Size: 0x188
	Parameters: 0
	Flags: Linked
*/
function function_23c31b4e()
{
	self notify("54ac97802355424d");
	self endon("54ac97802355424d");
	if(is_true(self.is_hotjoining) || self util::is_spectating())
	{
		return;
	}
	self endoncallback(&function_31b6f21e, #"death");
	var_ac9c3e75 = [1:"zone_radio_room", 0:"zone_village_house"];
	while(true)
	{
		if(level flag::get(#"power_on"))
		{
			level.var_b80c4ecc = array::exclude(level.var_b80c4ecc, var_ac9c3e75);
			self clientfield::set("" + #"hash_63af42145e260fb5", 0);
		}
		else
		{
			level.var_b80c4ecc = arraycombine(level.var_b80c4ecc, var_ac9c3e75);
		}
		self childthread function_3ba2978d();
		level waittill(#"power_on");
	}
}

/*
	Name: function_3ba2978d
	Namespace: namespace_808e3265
	Checksum: 0xA6BE6701
	Offset: 0x3308
	Size: 0x126
	Parameters: 0
	Flags: Linked
*/
function function_3ba2978d()
{
	level endon(#"power_on");
	while(true)
	{
		if(self zm_zonemgr::is_player_in_zone(level.var_b80c4ecc))
		{
			self clientfield::set("" + #"hash_63af42145e260fb5", 1);
		}
		else
		{
			if(self zm_zonemgr::is_player_in_zone([1:"zone_bunny_room_2", 0:"zone_bunny_room_1"]))
			{
				self clientfield::set("" + #"hash_63af42145e260fb5", 2);
			}
			else
			{
				self clientfield::set("" + #"hash_63af42145e260fb5", 0);
			}
		}
		self waittill(#"zone_change");
	}
}

/*
	Name: offhand_weapon_overrride
	Namespace: namespace_808e3265
	Checksum: 0xBF613F8D
	Offset: 0x3438
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
	Namespace: namespace_808e3265
	Checksum: 0x76741D80
	Offset: 0x3470
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
	Name: function_53555fd2
	Namespace: namespace_808e3265
	Checksum: 0xFB26C9CA
	Offset: 0x3540
	Size: 0x20C
	Parameters: 0
	Flags: Linked
*/
function function_53555fd2()
{
	level endon(#"end_game");
	while(true)
	{
		level waittill(#"start_of_round");
		if(level.round_number >= 5 && level flag::get("enable_firebase_zone") || level.round_number >= 10)
		{
			break;
		}
		wait(1);
	}
	/#
		iprintlnbold("");
	#/
	level.var_5c9581e1 = [5:"zone_napalm_strike2", 4:"zone_napalm_strike", 3:"zone_artillery_strike2", 2:"zone_artillery_strike", 1:"zone_chopper_gunner3", 0:"zone_chopper_gunner2"];
	level.var_3db96efc = struct::get_array("mimic_item_spawn_point", "targetname");
	level.var_4096945a = level.round_number;
	while(true)
	{
		level waittill(#"start_of_round");
		if(level.round_number < level.var_4096945a)
		{
			continue;
		}
		level thread function_9f46dbde();
		level waittill(#"end_of_round");
		namespace_be0f9d50::function_fd24f982();
		level.var_4096945a = level.var_4096945a + randomintrange(2, 6);
	}
}

/*
	Name: function_9f46dbde
	Namespace: namespace_808e3265
	Checksum: 0x8B71AA94
	Offset: 0x3758
	Size: 0x378
	Parameters: 0
	Flags: Linked
*/
function function_9f46dbde()
{
	level endon(#"game_ended", #"end_of_round", #"hash_263cb0e9d84b0fa6");
	a_players = getplayers();
	switch(a_players.size)
	{
		case 1:
		{
			var_fdb8ea91 = 1;
			var_99963ba3 = 3;
			break;
		}
		case 2:
		{
			var_fdb8ea91 = 1;
			var_99963ba3 = 3;
			break;
		}
		case 3:
		{
			var_fdb8ea91 = 2;
			var_99963ba3 = 4;
			break;
		}
		default:
		{
			var_fdb8ea91 = 2;
			var_99963ba3 = 4;
			break;
		}
	}
	if(level.round_number < 30)
	{
		switch(a_players.size)
		{
			case 1:
			{
				var_99963ba3 = 2;
				break;
			}
			case 2:
			{
				var_99963ba3 = 2;
				break;
			}
			case 3:
			{
				var_99963ba3 = 3;
				break;
			}
			default:
			{
				var_99963ba3 = 3;
				break;
			}
		}
	}
	if(level.round_number < 15)
	{
		var_fdb8ea91 = 1;
		var_99963ba3 = 1;
	}
	level.var_a4642f0a = 0;
	function_6b214340(8);
	level thread function_ecf00b5(var_fdb8ea91, var_99963ba3);
	while(level.var_a4642f0a < var_99963ba3)
	{
		s_waitresult = undefined;
		s_waitresult = level waittill(#"hash_6d7ff9f9ff07619c");
		level.var_a4642f0a = level.var_a4642f0a + 1;
		var_93bd7be9 = s_waitresult.var_c40fb40b;
		var_322f4e77 = getaiarchetypearray(#"mimic");
		var_2c062b3e = namespace_be0f9d50::function_e82cee4e();
		var_68c93a8d = var_322f4e77.size + var_2c062b3e.size;
		if(var_322f4e77.size < var_fdb8ea91)
		{
			var_d3329483 = 8 - var_2c062b3e.size;
			if(var_d3329483 > 0)
			{
				function_6b214340(var_d3329483);
			}
		}
		else
		{
			while(isdefined(var_93bd7be9.var_a6fe91fd) && isdefined(var_93bd7be9.var_a6fe91fd[0]) && isdefined(var_93bd7be9.var_a6fe91fd[0].var_1626d18c))
			{
				waitframe(1);
			}
			namespace_be0f9d50::function_fd24f982();
		}
	}
}

/*
	Name: function_6b214340
	Namespace: namespace_808e3265
	Checksum: 0xE55521E1
	Offset: 0x3AD8
	Size: 0x74C
	Parameters: 1
	Flags: Linked
*/
function function_6b214340(var_d3329483)
{
	if(var_d3329483 < 1)
	{
		return;
	}
	var_a2134c4e = [];
	foreach(var_5f0673a in level.zone_keys)
	{
		if(!isdefined(var_a2134c4e))
		{
			var_a2134c4e = [];
		}
		else if(!isarray(var_a2134c4e))
		{
			var_a2134c4e = array(var_a2134c4e);
		}
		if(!isinarray(var_a2134c4e, var_5f0673a))
		{
			var_a2134c4e[var_a2134c4e.size] = var_5f0673a;
		}
	}
	var_71fc1453 = [];
	var_6dcebc54 = function_7b8e26b3(level.var_3db96efc, 0, "inClaimedLocation");
	foreach(s_spawn_point in level.var_3db96efc)
	{
		var_1d4c3ee8 = hash(s_spawn_point.script_noteworthy);
		if(isinarray(var_a2134c4e, var_1d4c3ee8) && !is_true(s_spawn_point.claimed))
		{
			var_bbde0cda = 0;
			a_players = getplayers();
			var_100cd7d = function_72d3bca6(a_players, s_spawn_point.origin, undefined, undefined, 750);
			if(var_100cd7d.size < 1)
			{
				var_95ca13d1 = function_72d3bca6(a_players, s_spawn_point.origin, undefined, 750, 10000);
				if(var_95ca13d1.size > 0)
				{
					var_bbde0cda = 1;
					if(var_6dcebc54.size > 0)
					{
						var_1072e0bb = 0;
						var_e240bc30 = [];
						foreach(point in var_6dcebc54)
						{
							if(!isdefined(var_e240bc30))
							{
								var_e240bc30 = [];
							}
							else if(!isarray(var_e240bc30))
							{
								var_e240bc30 = array(var_e240bc30);
							}
							if(!isinarray(var_e240bc30, point.script_noteworthy))
							{
								var_e240bc30[var_e240bc30.size] = point.script_noteworthy;
							}
						}
						if(!isinarray(var_e240bc30, s_spawn_point.script_noteworthy))
						{
							var_f5682dc1 = arraygetclosest(s_spawn_point.origin, var_6dcebc54, 1200);
							if(isdefined(var_f5682dc1))
							{
								var_1072e0bb = 1;
							}
						}
					}
					else
					{
						var_1072e0bb = 1;
					}
					if(var_bbde0cda && var_1072e0bb)
					{
						if(!isdefined(var_71fc1453))
						{
							var_71fc1453 = [];
						}
						else if(!isarray(var_71fc1453))
						{
							var_71fc1453 = array(var_71fc1453);
						}
						if(!isinarray(var_71fc1453, s_spawn_point))
						{
							var_71fc1453[var_71fc1453.size] = s_spawn_point;
						}
					}
				}
			}
		}
	}
	for(i = 1; i <= var_d3329483; i++)
	{
		if(var_71fc1453.size > 0)
		{
			var_e933f1de = 0;
			if(var_71fc1453.size > 1)
			{
				var_e933f1de = randomint(var_71fc1453.size);
			}
			var_ed94ce04 = [];
			if(!isdefined(var_ed94ce04))
			{
				var_ed94ce04 = [];
			}
			else if(!isarray(var_ed94ce04))
			{
				var_ed94ce04 = array(var_ed94ce04);
			}
			if(!isinarray(var_ed94ce04, var_71fc1453[var_e933f1de]))
			{
				var_ed94ce04[var_ed94ce04.size] = var_71fc1453[var_e933f1de];
			}
			namespace_be0f9d50::function_b309db61(var_ed94ce04, undefined, var_ed94ce04[0]);
			var_e969bf8e = array::get_all_closest(var_ed94ce04[0].origin, var_71fc1453, undefined, undefined, 1200);
			if(is_true(1))
			{
				foreach(spawn_point in var_71fc1453)
				{
					if(spawn_point.script_noteworthy === var_ed94ce04[0].script_noteworthy)
					{
						arrayremovevalue(var_71fc1453, spawn_point);
					}
				}
			}
			if(var_e969bf8e.size > 0)
			{
				foreach(loc in var_e969bf8e)
				{
					arrayremovevalue(var_71fc1453, loc);
				}
			}
			wait(0.5);
			continue;
		}
		/#
			println("");
		#/
	}
}

/*
	Name: function_ecf00b5
	Namespace: namespace_808e3265
	Checksum: 0xE2478149
	Offset: 0x4230
	Size: 0x2A6
	Parameters: 2
	Flags: Linked
*/
function function_ecf00b5(var_fdb8ea91, var_99963ba3)
{
	level endon(#"game_ended", #"end_of_round", #"hash_263cb0e9d84b0fa6");
	while(true)
	{
		a_players = function_a1ef346b();
		var_9b79c3aa = 0;
		var_5a6fbe59 = 0;
		var_ce5c1431 = 0;
		var_e5788fc4 = 0;
		var_edeec8f8 = 0;
		foreach(player in a_players)
		{
			if(player zm_zonemgr::is_player_in_zone(level.var_aa31c120, 0))
			{
				var_5a6fbe59 = var_5a6fbe59 + 1;
			}
			if(player zm_zonemgr::is_player_in_zone(level.var_4b35561a, 0))
			{
				var_9b79c3aa = var_9b79c3aa + 1;
			}
		}
		if(var_5a6fbe59 <= 0)
		{
			var_e5788fc4 = function_8937f221(level.var_aa31c120);
		}
		if(var_9b79c3aa <= 0)
		{
			var_edeec8f8 = function_8937f221(level.var_4b35561a);
		}
		var_ce5c1431 = var_e5788fc4 + var_edeec8f8;
		var_322f4e77 = getaiarchetypearray(#"mimic");
		var_2c062b3e = namespace_be0f9d50::function_e82cee4e();
		var_68c93a8d = var_322f4e77.size + var_2c062b3e.size;
		if(var_322f4e77.size < var_fdb8ea91 && level.var_a4642f0a < var_99963ba3)
		{
			var_d3329483 = 8 - var_2c062b3e.size;
			if(var_d3329483 > 0)
			{
				function_6b214340(var_d3329483);
			}
		}
		wait(1);
	}
}

/*
	Name: function_8937f221
	Namespace: namespace_808e3265
	Checksum: 0xC78B9524
	Offset: 0x44E0
	Size: 0x132
	Parameters: 1
	Flags: Linked
*/
function function_8937f221(a_str_zone_names)
{
	arrayremovevalue(level.var_5fafe5ac, undefined);
	var_656150d9 = 0;
	foreach(prop in level.var_5fafe5ac)
	{
		zone = zm_zonemgr::get_zone_from_position(prop.origin, 1, 1);
		if(!isdefined(zone) || isinarray(a_str_zone_names, zone))
		{
			level thread namespace_be0f9d50::function_175bb809(prop);
			var_656150d9 = var_656150d9 + 1;
		}
	}
	return var_656150d9;
}

/*
	Name: function_64ed78df
	Namespace: namespace_808e3265
	Checksum: 0x66AC2807
	Offset: 0x4620
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function function_64ed78df()
{
	self callback::function_d8abfc3d(#"hash_29cb63a7ebb5d699", &function_b7bf6e96);
	self callback::function_d8abfc3d(#"hash_484127e0cbd8f8cb", &function_64515cbe);
}

/*
	Name: function_b7bf6e96
	Namespace: namespace_808e3265
	Checksum: 0x68194BD4
	Offset: 0x4690
	Size: 0x26
	Parameters: 1
	Flags: Linked
*/
function function_b7bf6e96(prop)
{
	self.var_126d7bef = 1;
	self.ignore_enemy_count = 1;
}

/*
	Name: function_64515cbe
	Namespace: namespace_808e3265
	Checksum: 0x870D2B30
	Offset: 0x46C0
	Size: 0x48
	Parameters: 1
	Flags: Linked
*/
function function_64515cbe(params)
{
	self.var_126d7bef = 0;
	self.ignore_enemy_count = 0;
	level notify(#"hash_6d7ff9f9ff07619c", {#hash_c40fb40b:self});
}

/*
	Name: sndfunctions
	Namespace: namespace_808e3265
	Checksum: 0xA63DDC04
	Offset: 0x4710
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function sndfunctions()
{
	zm_utility::add_sound("zmb_heavy_door_open", "zmb_heavy_door_open");
	level thread setup_personality_character_exerts();
	level thread setupmusic();
}

/*
	Name: setup_personality_character_exerts
	Namespace: namespace_808e3265
	Checksum: 0x5B29AFB0
	Offset: 0x4770
	Size: 0x3C2
	Parameters: 0
	Flags: Linked
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
	Namespace: namespace_808e3265
	Checksum: 0x1E5E51E9
	Offset: 0x4B40
	Size: 0x1D4
	Parameters: 0
	Flags: Linked
*/
function setupmusic()
{
	zm_audio::musicstate_create("round_start_first", 3, "round_start_first");
	zm_audio::musicstate_create("round_start", 3, "round_start_00", "round_start_01", "round_start_02");
	zm_audio::musicstate_create("round_end", 3, "round_end_00", "round_end_01", "round_end_02");
	zm_audio::musicstate_create("head_quest_scare", 3, "head_quest_scare");
	zm_audio::musicstate_create("game_over", 5, "gameover_gold");
	zm_audio::musicstate_create("assault_round_00", 4, "assault_round_00");
	zm_audio::function_e441162b("assault_round_00");
	zm_audio::musicstate_create("assault_round_01", 4, "assault_round_01");
	zm_audio::function_e441162b("assault_round_01");
	zm_audio::musicstate_create("assault_round_02", 4, "assault_round_02");
	zm_audio::function_e441162b("assault_round_02");
	zm_audio::musicstate_create("ee_song", 4, "egg");
}

/*
	Name: setupminimap
	Namespace: namespace_808e3265
	Checksum: 0x25994D09
	Offset: 0x4D20
	Size: 0x2A4
	Parameters: 2
	Flags: Linked
*/
function setupminimap(material, area_name)
{
	corners = territory::get_ent_array("minimap_corner", "targetname");
	var_db594db = [];
	var_8e0a6036 = [];
	foreach(corner in corners)
	{
		if(corner.script_noteworthy === "firebase")
		{
			if(!isdefined(var_db594db))
			{
				var_db594db = [];
			}
			else if(!isarray(var_db594db))
			{
				var_db594db = array(var_db594db);
			}
			var_db594db[var_db594db.size] = corner;
			continue;
		}
		if(!isdefined(var_8e0a6036))
		{
			var_8e0a6036 = [];
		}
		else if(!isarray(var_8e0a6036))
		{
			var_8e0a6036 = array(var_8e0a6036);
		}
		var_8e0a6036[var_8e0a6036.size] = corner;
	}
	/#
		assert(var_db594db.size == 2 && var_8e0a6036.size == 2, "");
	#/
	if(area_name == "firebase")
	{
		self compass::function_d6cba2e9(material, var_db594db[0].origin[0], var_db594db[0].origin[1], var_db594db[1].origin[0], var_db594db[1].origin[1]);
	}
	if(area_name == "village")
	{
		self compass::function_d6cba2e9(material, var_8e0a6036[0].origin[0], var_8e0a6036[0].origin[1], var_8e0a6036[1].origin[0], var_8e0a6036[1].origin[1]);
	}
}

/*
	Name: function_16a7f6db
	Namespace: namespace_808e3265
	Checksum: 0x1092874F
	Offset: 0x4FD0
	Size: 0x94
	Parameters: 0
	Flags: Linked
*/
function function_16a7f6db()
{
	level flag::wait_till_all(array(#"power_on1", #"power_on2", #"power_on3"));
	level flag::set(#"power_on");
	/#
		iprintlnbold("");
	#/
}

/*
	Name: function_fb609897
	Namespace: namespace_808e3265
	Checksum: 0x99A3EBC1
	Offset: 0x5070
	Size: 0x21C
	Parameters: 0
	Flags: Linked
*/
function function_fb609897()
{
	if(level.round_number >= level.var_ebc170a1 && getaiarchetypearray(#"raz").size <= 3)
	{
		if(level.round_number <= 20)
		{
			n_rate = 1;
		}
		else
		{
			if(level.round_number <= 35)
			{
				n_rate = 2;
			}
			else
			{
				n_rate = 4;
			}
		}
		if(math::cointoss(n_rate))
		{
			var_6381f902 = zm_ai_raz::round_spawn();
			if(isdefined(var_6381f902))
			{
				level.var_f454f2b5 = 1;
				return true;
			}
		}
	}
	if(25 <= level.round_number)
	{
		if(math::cointoss(5))
		{
			var_6381f902 = zombie_dog_util::dog_round_spawn();
			if(isdefined(var_6381f902))
			{
				return true;
			}
		}
	}
	if(level.round_number >= level.var_9583b85c)
	{
		if(level.round_number < 30)
		{
			var_a77909d4 = 1;
			n_rate = 1;
		}
		else
		{
			var_a77909d4 = 3;
			n_rate = 2;
		}
		if(getaiarchetypearray(#"mimic").size <= var_a77909d4)
		{
			if(math::cointoss(n_rate))
			{
				var_6381f902 = namespace_14c07d4f::spawn_single();
				if(isdefined(var_6381f902))
				{
					level.var_8abe919a = 1;
					return true;
				}
			}
		}
	}
	return false;
}

/*
	Name: function_1688adb7
	Namespace: namespace_808e3265
	Checksum: 0x19BB43EF
	Offset: 0x5298
	Size: 0xB4
	Parameters: 0
	Flags: Linked
*/
function function_1688adb7()
{
	if(level.var_ebc170a1 < 20)
	{
		if(level.var_f454f2b5)
		{
			level.var_ebc170a1 = level.var_ebc170a1 + randomintrange(1, 2);
			level.var_f454f2b5 = 0;
		}
	}
	if(level.var_9583b85c < 20)
	{
		if(level.var_8abe919a)
		{
			level.var_9583b85c = level.var_9583b85c + randomintrange(2, 3);
			level.var_8abe919a = 0;
		}
	}
}

/*
	Name: function_67a2ce93
	Namespace: namespace_808e3265
	Checksum: 0x17CF3E9E
	Offset: 0x5358
	Size: 0x150
	Parameters: 0
	Flags: None
*/
function function_67a2ce93()
{
	level waittill(#"captured_control_point");
	var_af767d15 = getplayers().size;
	if(var_af767d15 > 3)
	{
		var_af767d15 = 3;
	}
	var_c385f97d = array("captured_control_point1", "captured_control_point2", "captured_control_point3");
	for(i = 0; i < 3 - var_af767d15; i++)
	{
		arrayremoveindex(var_c385f97d, randomint(var_c385f97d.size));
	}
	foreach(str_power in var_c385f97d)
	{
		level thread function_28ad3c61(str_power);
	}
}

/*
	Name: function_28ad3c61
	Namespace: namespace_808e3265
	Checksum: 0xAA2E275F
	Offset: 0x54B0
	Size: 0x7C
	Parameters: 1
	Flags: Linked
*/
function function_28ad3c61(str_power)
{
	level flag::wait_till(str_power);
	wait(5);
	while(true)
	{
		if(zombie_utility::get_current_zombie_count() > 0)
		{
			var_c40fb40b = namespace_14c07d4f::spawn_single();
			if(isdefined(var_c40fb40b))
			{
				break;
			}
		}
		wait(1);
	}
}

/*
	Name: function_25696a75
	Namespace: namespace_808e3265
	Checksum: 0xC4110495
	Offset: 0x5538
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function function_25696a75()
{
	level.fn_custom_zombie_spawner_selection = &function_ddc13fd6;
}

/*
	Name: function_ddc13fd6
	Namespace: namespace_808e3265
	Checksum: 0xF16CF1C9
	Offset: 0x5560
	Size: 0x41C
	Parameters: 0
	Flags: Linked
*/
function function_ddc13fd6()
{
	var_88b0ae7e = [];
	var_22dbd27f = level.var_aa31c120;
	s_spot = array::random(level.zm_loc_types[#"zombie_location"]);
	var_eafe85db = [];
	var_99fb71cc = [];
	var_da5b34aa = [];
	foreach(sp_zombie in level.zombie_spawners)
	{
		if(sp_zombie.script_int === 0)
		{
			var_b2c6800d = sp_zombie;
		}
		else
		{
			if(sp_zombie.script_int === 2)
			{
				var_441a0a32 = sp_zombie;
			}
			else
			{
				if(sp_zombie.script_int === 1)
				{
					var_7d97e927 = sp_zombie;
				}
				else
				{
					if(sp_zombie.script_int === 3)
					{
						if(!isdefined(var_eafe85db))
						{
							var_eafe85db = [];
						}
						else if(!isarray(var_eafe85db))
						{
							var_eafe85db = array(var_eafe85db);
						}
						var_eafe85db[var_eafe85db.size] = sp_zombie;
					}
					else if(sp_zombie.script_int === 4)
					{
						if(!isdefined(var_99fb71cc))
						{
							var_99fb71cc = [];
						}
						else if(!isarray(var_99fb71cc))
						{
							var_99fb71cc = array(var_99fb71cc);
						}
						var_99fb71cc[var_99fb71cc.size] = sp_zombie;
					}
				}
			}
		}
		if(level.round_number >= 10 && level.round_number < 30)
		{
			var_da5b34aa = var_eafe85db;
			continue;
		}
		if(level.round_number >= 30)
		{
			var_da5b34aa = arraycombine(var_eafe85db, var_99fb71cc);
		}
	}
	if(isdefined(s_spot.zone_name) && isinarray(var_22dbd27f, s_spot.zone_name))
	{
		var_787b7c5e = randomintrange(0, 100);
		if(level.round_number >= 10)
		{
			if(var_787b7c5e <= 5)
			{
				sp_zombie = array::random(var_da5b34aa);
				return sp_zombie;
			}
			if(var_787b7c5e <= 20)
			{
				return var_441a0a32;
			}
			if(var_787b7c5e <= 100)
			{
				return var_b2c6800d;
			}
		}
		else
		{
			if(var_787b7c5e <= 20)
			{
				return var_441a0a32;
			}
			if(var_787b7c5e <= 100)
			{
				return var_b2c6800d;
			}
		}
	}
	else if(isdefined(s_spot.zone_name))
	{
		var_787b7c5e = randomintrange(0, 100);
		if(level.round_number >= 10)
		{
			if(var_787b7c5e <= 5)
			{
				sp_zombie = array::random(var_da5b34aa);
				return sp_zombie;
			}
			if(var_787b7c5e <= 100)
			{
				return var_b2c6800d;
			}
		}
		else if(var_787b7c5e <= 100)
		{
			return var_7d97e927;
		}
	}
}

/*
	Name: function_aa7d6bdd
	Namespace: namespace_808e3265
	Checksum: 0x5AD56868
	Offset: 0x5988
	Size: 0x84
	Parameters: 3
	Flags: Linked
*/
function function_aa7d6bdd(origin, radius, location)
{
	level.var_1c486b12[level.var_1c486b12.size] = {#location:location, #radiussq:sqr(radius), #origin:origin};
}

/*
	Name: function_48e07036
	Namespace: namespace_808e3265
	Checksum: 0xE8AFFDB9
	Offset: 0x5A18
	Size: 0x94
	Parameters: 1
	Flags: Linked
*/
function function_48e07036(origin)
{
	if(!level.var_1c486b12.size || !isdefined(origin))
	{
		return;
	}
	nearest = arraygetclosest(origin, level.var_1c486b12);
	if(isdefined(nearest) && distancesquared(nearest.origin, origin) <= nearest.radiussq)
	{
		return nearest.location;
	}
}

/*
	Name: function_6f6cc58
	Namespace: namespace_808e3265
	Checksum: 0x86A73C69
	Offset: 0x5AB8
	Size: 0x244
	Parameters: 1
	Flags: Linked
*/
function function_6f6cc58(e_player)
{
	if(isdefined(e_player) && isdefined(self))
	{
		var_129a65ba = getent("vol_player_in_village", "targetname");
		var_ca4a1377 = getent("vol_player_in_firebase", "targetname");
		var_9fb26bc8 = getent("vol_player_in_bunny_room", "targetname");
		var_72b2c2ea = function_48e07036(e_player.origin);
		var_7769ffe6 = function_48e07036(self.origin);
		if(self istouching(var_129a65ba) || var_7769ffe6 === #"village" && (e_player istouching(var_129a65ba) || var_72b2c2ea === #"village"))
		{
			return true;
		}
		if(self istouching(var_ca4a1377) || var_7769ffe6 === #"firebase" && (e_player istouching(var_ca4a1377) || var_72b2c2ea === #"firebase"))
		{
			return true;
		}
		if(self istouching(var_9fb26bc8) || var_7769ffe6 === #"hash_44f6d7fff3150303" && (e_player istouching(var_9fb26bc8) || var_72b2c2ea === #"hash_44f6d7fff3150303"))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_a1960bde
	Namespace: namespace_808e3265
	Checksum: 0x75759126
	Offset: 0x5D08
	Size: 0x244
	Parameters: 0
	Flags: Linked
*/
function function_a1960bde()
{
	level flag::wait_till("start_zombie_round_logic");
	var_b1081d76 = getent("sms_door", "targetname");
	if(isdefined(var_b1081d76))
	{
		var_b1081d76 disconnectpaths();
	}
	level waittill(#"hash_17aa3d4ecb08b26f");
	a_players = function_a1ef346b();
	foreach(player in a_players)
	{
		player function_bc82f900(#"hash_665d7e2386e92b98");
	}
	level clientfield::set("" + #"hash_4c60439fcb3b4056", 1);
	playsoundatposition(#"hash_2deaada8def8eb0b", var_b1081d76.origin + vectorscale((0, 0, 1), 50));
	wait(0.5);
	if(isdefined(var_b1081d76))
	{
		var_b1081d76 connectpaths();
		var_b1081d76 moveto(var_b1081d76.origin + (vectorscale((0, 0, -1), 102)), 1);
		playsoundatposition(#"hash_741d94c4d2a60cce", var_b1081d76.origin + vectorscale((0, 0, 1), 50));
	}
	level flag::set("connect_zone_opc_room_to_armory2");
}

/*
	Name: function_e3e3f619
	Namespace: namespace_808e3265
	Checksum: 0xE2A51629
	Offset: 0x5F58
	Size: 0xE4
	Parameters: 0
	Flags: Linked
*/
function function_e3e3f619()
{
	level flag::wait_till("start_zombie_round_logic");
	var_c0948775 = getent("col_peck_room_fire", "targetname");
	var_c0948775 disconnectpaths();
	namespace_8dac58da::function_a7e6c47e(1);
	level flag::wait_till(#"power_on2");
	var_c0948775 connectpaths();
	var_c0948775 delete();
	namespace_8dac58da::function_a7e6c47e(0);
}

/*
	Name: function_109d90d3
	Namespace: namespace_808e3265
	Checksum: 0x4CCAD6B4
	Offset: 0x6048
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_109d90d3()
{
	level scene::init(#"hash_12ffbe477b23e132");
}

/*
	Name: function_e0a4ccda
	Namespace: namespace_808e3265
	Checksum: 0x67CD3B14
	Offset: 0x6078
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function function_e0a4ccda()
{
	level clientfield::set("" + #"hash_7d7dcebcb0511b14", 1);
}

/*
	Name: function_76c00f63
	Namespace: namespace_808e3265
	Checksum: 0x9AC997A0
	Offset: 0x60C0
	Size: 0x44
	Parameters: 1
	Flags: Linked, Private
*/
function private function_76c00f63(a_ents)
{
	level.mixer = a_ents[#"prop 1"];
	level.mixer thread function_e77d33cb();
}

/*
	Name: function_e77d33cb
	Namespace: namespace_808e3265
	Checksum: 0xA28568AB
	Offset: 0x6110
	Size: 0x12E
	Parameters: 0
	Flags: Linked, Private
*/
function private function_e77d33cb()
{
	level endon(#"end_game");
	if(!zm_utility::is_ee_enabled())
	{
		return;
	}
	while(true)
	{
		if(level flag::get(#"hash_54b5f60de17405f"))
		{
			level clientfield::set("" + #"hash_5368b2aa337a0ec3", 2);
		}
		else
		{
			if(level flag::get("power_on3"))
			{
				level clientfield::set("" + #"hash_5368b2aa337a0ec3", 1);
			}
			else
			{
				level clientfield::set("" + #"hash_5368b2aa337a0ec3", 0);
			}
		}
		wait(1);
	}
}

/*
	Name: function_452e5ad6
	Namespace: namespace_808e3265
	Checksum: 0x5816FC7B
	Offset: 0x6248
	Size: 0x342
	Parameters: 0
	Flags: Linked
*/
function function_452e5ad6()
{
	spawn_points = zm_gametype::get_player_spawns_for_gametype();
	var_98fd8384 = array("zone_village", "zone_village2", "zone_village3", "zone_atrium", "zone_village_house", "zone_village_house2", "zone_radio_room", "zone_peck_quarters", "zone_scientist", "zone_portal_transfer");
	var_a6107c9 = array("zone_bunny_room_1", "zone_bunny_room_2");
	var_bdf9e3c2 = zm_zonemgr::get_player_zone();
	var_d9814981 = isinarray(var_98fd8384, var_bdf9e3c2);
	var_d117c934 = [];
	foreach(point in spawn_points)
	{
		if(!zm_zonemgr::zone_is_enabled(point.script_noteworthy) || isinarray(var_a6107c9, point.script_noteworthy))
		{
			continue;
		}
		if(var_d9814981 && isinarray(var_98fd8384, point.script_noteworthy))
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
			continue;
		}
		if(!var_d9814981 && !isinarray(var_98fd8384, point.script_noteworthy))
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
	s_player_spawn = array::random(var_1a672bba);
	return s_player_spawn;
}

/*
	Name: function_f3c4fbd9
	Namespace: namespace_808e3265
	Checksum: 0xA4FE0FCB
	Offset: 0x6598
	Size: 0x94
	Parameters: 1
	Flags: Linked
*/
function function_f3c4fbd9(a_ents)
{
	if(!level flag::get("connect_zone_opc_room_to_armory2"))
	{
		var_b1081d76 = getent("sms_door", "targetname");
		if(isdefined(var_b1081d76))
		{
			var_b1081d76 moveto(var_b1081d76.origin + (vectorscale((0, 0, -1), 102)), 0.05);
		}
	}
}

/*
	Name: function_abd6be92
	Namespace: namespace_808e3265
	Checksum: 0xD45BE159
	Offset: 0x6638
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function function_abd6be92(a_ents)
{
	level scene::stop(#"aib_t9_zm_vign_rav_seated_01", 1);
}

/*
	Name: function_37597f29
	Namespace: namespace_808e3265
	Checksum: 0x17053E10
	Offset: 0x6678
	Size: 0xBC
	Parameters: 0
	Flags: None
*/
function function_37597f29()
{
	/#
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
	Namespace: namespace_808e3265
	Checksum: 0x925EB0D9
	Offset: 0x6740
	Size: 0x1A2
	Parameters: 1
	Flags: None
*/
function cmd(cmd)
{
	/#
		switch(cmd)
		{
			case "hash_50d92ca3c6c7c2a8":
			{
				function_71a6c3ea();
				break;
			}
			case "hash_1faf9b6b2b3c3575":
			{
				setdvar(#"hash_11a7075c2b20fe1d", 1);
				array::thread_all(getplayers(), &function_23c31b4e);
				break;
			}
			case "hash_37da2a13ec5047be":
			{
				setdvar(#"hash_11a7075c2b20fe1d", 0);
				array::thread_all(getplayers(), &function_23c31b4e);
				break;
			}
			case "hash_df871245c70fbe7":
			{
				function_ed6d34fb();
				break;
			}
			case "hash_564106a8aa366208":
			{
				function_8946bb7a();
				break;
			}
			case "hash_363948df64c05e49":
			{
				function_d349e956();
				break;
			}
			default:
			{
				break;
			}
		}
	#/
}

/*
	Name: function_71a6c3ea
	Namespace: namespace_808e3265
	Checksum: 0x9724778C
	Offset: 0x68F0
	Size: 0x344
	Parameters: 0
	Flags: None
*/
function function_71a6c3ea()
{
	/#
		level notify(#"hash_50d92ca3c6c7c2a8");
		level.var_f925c697 = 1;
		zm_devgui::zombie_devgui_open_sesame();
		zm_power::turn_power_on_and_open_doors(1);
		zm_power::turn_power_on_and_open_doors(2);
		zm_power::turn_power_on_and_open_doors(3);
		namespace_8dac58da::function_1a3aacac(1);
		namespace_8dac58da::function_1a3aacac(2);
		namespace_8dac58da::function_1a3aacac(3);
		level thread namespace_47809ab2::function_b858693f(1);
		level thread namespace_47809ab2::function_b858693f(2);
		level thread namespace_47809ab2::function_b858693f(3);
		foreach(var_9fbdac89 in level.var_cc43b632)
		{
			var_9fbdac89 thread namespace_f7b3ed9::function_21a9e71b(1);
		}
		var_b0c3aec3 = getentarray("", "");
		foreach(flinger_landing_pad in var_b0c3aec3)
		{
			if(flinger_landing_pad.script_noteworthy === "")
			{
				level flag::set("" + flinger_landing_pad.script_int);
				flinger_landing_pad thread namespace_47809ab2::function_726d8f3a();
			}
		}
		level thread namespace_e0b1e9f5::function_ed6d34fb();
		level flag::set(#"pap_quest_completed");
		zm_sq::objective_complete(#"hash_3fa48a6ce34459eb", level.var_9674d6e2);
		zm_sq::objective_complete(#"hash_3fa48b6ce3445b9e", var_9fbdac89.var_af9beb09);
		zm_sq::objective_complete(#"hash_3fa48c6ce3445d51", level.var_9674d6e2);
	#/
}

/*
	Name: function_ed6d34fb
	Namespace: namespace_808e3265
	Checksum: 0x3713B483
	Offset: 0x6C40
	Size: 0x1C
	Parameters: 0
	Flags: None
*/
function function_ed6d34fb()
{
	/#
		level thread namespace_e0b1e9f5::function_ed6d34fb();
	#/
}

/*
	Name: function_8946bb7a
	Namespace: namespace_808e3265
	Checksum: 0xD8DE7AF6
	Offset: 0x6C68
	Size: 0x1C
	Parameters: 0
	Flags: None
*/
function function_8946bb7a()
{
	/#
		namespace_14c07d4f::spawn_single();
	#/
}

/*
	Name: function_d349e956
	Namespace: namespace_808e3265
	Checksum: 0x56C226D3
	Offset: 0x6C90
	Size: 0x1DE
	Parameters: 0
	Flags: None
*/
function function_d349e956()
{
	/#
		if(is_true(level.var_babe0dcd))
		{
			level.var_babe0dcd = 0;
			iprintln("");
		}
		else
		{
			level.var_babe0dcd = 1;
			iprintln("");
			players = getplayers();
			foreach(player in players)
			{
				if(isplayer(player) && isdefined(player.var_6f6efa4c))
				{
					foreach(bundle in player.var_6f6efa4c)
					{
						player scene::function_f81475ae(bundle);
						iprintln("" + bundle);
					}
					player.var_6f6efa4c = [];
				}
			}
		}
	#/
}

