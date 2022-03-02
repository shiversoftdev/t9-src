#using script_1029986e2bc8ca8e;
#using script_1c65dbfc2f1c8d8f;
#using script_1df36deb5752c05d;
#using script_1e13c013927b6692;
#using script_3a88f428c6d8ef90;
#using script_3f9e0dc8454d98e1;
#using script_58860a35d0555f74;
#using script_5bb072c3abf4652c;
#using script_60d2812480bc5591;
#using script_64fee205fe8ada38;
#using script_6809bf766eba194a;
#using script_68d2ee1489345a1d;
#using script_72401f526ba71638;
#using script_77b61a4178efdbc4;
#using script_7e59d7bba853fe4b;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\hud_shared.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\music_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\zm\zm_ai_raz.gsc;
#using scripts\zm\zm_gold_pap_quest.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm_challenges.gsc;
#using scripts\zm_common\zm_devgui.gsc;
#using scripts\zm_common\zm_equipment.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_weapons.gsc;

#namespace namespace_c4d353e7;

/*
	Name: function_42bc0409
	Namespace: namespace_c4d353e7
	Checksum: 0x6745BAF1
	Offset: 0x790
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_42bc0409()
{
	level notify(1608939045);
}

/*
	Name: init
	Namespace: namespace_c4d353e7
	Checksum: 0x9AB54392
	Offset: 0x7B0
	Size: 0x32C
	Parameters: 0
	Flags: None
*/
function init()
{
	clientfield::register("world", "" + #"hash_4976dec6e1aa8221", 1, getminbitcountfornum(2), "int");
	clientfield::register("world", "" + #"hash_763dd8035e80f7c", 1, 1, "int");
	scene::add_scene_func(#"hash_1be24c2c65ab0233", &function_56700eee, "play");
	scene::add_scene_func(#"hash_7a0ecc691a5a3bfe", &function_56700eee, "play");
	scene::add_scene_func(#"hash_7a0ecc691a5a3bfe", &function_2996c15f, "shot230");
	scene::add_scene_func(#"hash_7a0ecc691a5a3bfe", &function_e9b849a7, "shot240");
	scene::add_scene_func(#"hash_74463db12dcd6b5e", &function_318f5bad, "play");
	scene::add_scene_func(#"hash_4f11c86e59a3292a", &function_324cf392, "play");
	scene::add_scene_func(#"hash_66a962b4710a2287", &function_324cf392, "play");
	scene::add_scene_func(#"hash_7a0ecc691a5a3bfe", &function_e3c65980, "done");
	scene::add_scene_func(#"hash_66a962b4710a2287", &function_e3c65980, "done");
	level thread function_cdf29db1(1);
	level thread function_1d66a215(1);
	level thread function_5e569522(1);
	if(!zm_utility::function_e51dc2d8())
	{
		return;
	}
	/#
		if(getdvarint(#"hash_11ad6a9695943217", 0) == 1)
		{
			level thread function_37597f29();
		}
	#/
}

/*
	Name: function_cdf29db1
	Namespace: namespace_c4d353e7
	Checksum: 0xDF86506F
	Offset: 0xAE8
	Size: 0x2A4
	Parameters: 1
	Flags: None
*/
function function_cdf29db1(b_hide)
{
	var_3f351d85 = getentarray("end_fight_path_blocker", "targetname");
	var_9d8fad40 = getent("village_courtyard_gate_clip", "targetname");
	if(is_true(b_hide))
	{
		hidemiscmodels("end_fight_path_blocker");
		foreach(var_ba78a356 in var_3f351d85)
		{
			if(is_true(var_ba78a356.disconnect_paths))
			{
				var_ba78a356 connectpaths();
				var_ba78a356 hide();
			}
			var_ba78a356 notsolid();
		}
		if(isdefined(var_9d8fad40))
		{
			var_9d8fad40 solid();
			var_9d8fad40 disconnectpaths();
		}
	}
	else
	{
		showmiscmodels("end_fight_path_blocker");
		foreach(var_ba78a356 in var_3f351d85)
		{
			if(is_true(var_ba78a356.disconnect_paths))
			{
				var_ba78a356 disconnectpaths();
				var_ba78a356 show();
			}
			var_ba78a356 solid();
		}
		if(isdefined(var_9d8fad40))
		{
			var_9d8fad40 notsolid();
			var_9d8fad40 connectpaths();
		}
	}
}

/*
	Name: function_1d66a215
	Namespace: namespace_c4d353e7
	Checksum: 0xDD30678E
	Offset: 0xD98
	Size: 0x21C
	Parameters: 1
	Flags: None
*/
function function_1d66a215(b_hide)
{
	if(is_true(b_hide))
	{
		var_ab2d0c82 = getentarray("radioroom_show", "targetname");
		array::run_all(var_ab2d0c82, &hide);
		array::run_all(var_ab2d0c82, &notsolid);
		array::run_all(var_ab2d0c82, &connectpaths);
		var_ab2d0c82 = getentarray("build07_show", "targetname");
		array::run_all(var_ab2d0c82, &hide);
	}
	else
	{
		var_80d8fcf4 = getentarray("radioroom_hide", "targetname");
		array::run_all(var_80d8fcf4, &hide);
		hidemiscmodels("radioroom_hide");
		var_80d8fcf4 = getentarray("build07_hide", "targetname");
		array::run_all(var_80d8fcf4, &hide);
		hidemiscmodels("build07_hide");
		var_ab2d0c82 = getentarray("build07_show", "targetname");
		array::run_all(var_ab2d0c82, &show);
		hidemiscmodels("village_tower_1");
		hidemiscmodels("village_tower_2");
	}
}

/*
	Name: function_5e569522
	Namespace: namespace_c4d353e7
	Checksum: 0xAE79509B
	Offset: 0xFC0
	Size: 0xDC
	Parameters: 1
	Flags: None
*/
function function_5e569522(b_hide)
{
	var_f39a76f2 = getentarray("end_fight_boss_arm_clip", "targetname");
	if(!isdefined(var_f39a76f2))
	{
		return;
	}
	if(is_true(b_hide))
	{
		array::run_all(var_f39a76f2, &notsolid);
		array::run_all(var_f39a76f2, &connectpaths);
	}
	else
	{
		array::run_all(var_f39a76f2, &solid);
		array::run_all(var_f39a76f2, &disconnectpaths);
	}
}

/*
	Name: function_79868b3b
	Namespace: namespace_c4d353e7
	Checksum: 0x507B645C
	Offset: 0x10A8
	Size: 0x124
	Parameters: 1
	Flags: None
*/
function function_79868b3b(b_skipped)
{
	if(b_skipped)
	{
		return;
	}
	level function_671424c7();
	level function_2f0a2ce2();
	music::setmusicstate("boss");
	level thread function_2baf9762();
	level thread function_cdf29db1();
	namespace_1fd59e39::function_1376ec37((-49096, -20120, 624), 80);
	namespace_1fd59e39::function_1376ec37((-48705, -20110, 771), 100);
	level thread function_1d66a215();
	level thread function_c8ef8fb2();
	level function_79ae7b73();
}

/*
	Name: function_ec198408
	Namespace: namespace_c4d353e7
	Checksum: 0xD8D4513B
	Offset: 0x11D8
	Size: 0x14
	Parameters: 2
	Flags: None
*/
function function_ec198408(b_skipped, var_19e802fa)
{
}

/*
	Name: function_671424c7
	Namespace: namespace_c4d353e7
	Checksum: 0x3ACD18CA
	Offset: 0x11F8
	Size: 0xD4
	Parameters: 0
	Flags: None
*/
function function_671424c7()
{
	level.no_powerups = 1;
	level flag::clear("spawn_zombies");
	level flag::clear("zombie_drop_powerups");
	level flag::clear(#"hash_21921ed511559aa3");
	level flag::set(#"pause_round_timeout");
	level flag::set("hold_round_end");
	level zm_utility::function_9ad5aeb1(0, 0, 1, 0);
}

/*
	Name: function_2f0a2ce2
	Namespace: namespace_c4d353e7
	Checksum: 0xC496A5C4
	Offset: 0x12D8
	Size: 0x2FE
	Parameters: 0
	Flags: None
*/
function function_2f0a2ce2()
{
	/#
		if(getdvarint(#"hash_211aa1fd5f72a91", 0) == 1)
		{
			level function_165a271d();
			level function_db84b4f4();
			return;
		}
	#/
	level function_abb25db(0, (0, 0, 0));
	level thread function_542224cc(1.5, (0, 0, 0), "screen_fade_in_black");
	level thread function_abb25db(0.15, (1, 1, 1), "screen_fade_to_white");
	level scene::init_streamer(#"hash_1be24c2c65ab0233", getplayers(), 0, 0);
	foreach(player in getplayers())
	{
		player.var_f4e33249 = 1;
	}
	level zm_audio::sndmusicsystem_stopandflush();
	level.musicsystemoverride = 1;
	music::setmusicstate("mid_igc");
	function_c9fd78e4(#"hash_1be24c2c65ab0233", #"hash_7a0ecc691a5a3bfe");
	level scene::play(#"hash_1be24c2c65ab0233");
	music::setmusicstate("mid_igc_1");
	level thread function_542224cc(0.5, (1, 1, 1), "screen_fade_from_white", 1);
	level scene::play(#"hash_7a0ecc691a5a3bfe");
	foreach(player in getplayers())
	{
		player.var_f4e33249 = undefined;
	}
}

/*
	Name: function_c9fd78e4
	Namespace: namespace_c4d353e7
	Checksum: 0x325B8C78
	Offset: 0x15E0
	Size: 0xBC
	Parameters: 3
	Flags: None
*/
function function_c9fd78e4(str_current_scene, var_13d06437, var_7730357c)
{
	if(!isdefined(var_7730357c))
	{
		var_7730357c = 10;
	}
	var_9d90ef8b = scene::function_12479eba(str_current_scene);
	var_75388bc3 = max(0, var_9d90ef8b - var_7730357c);
	level util::delay(var_75388bc3, "end_game", &scene::init_streamer, var_13d06437, getplayers(), 0, 0);
}

/*
	Name: function_abb25db
	Namespace: namespace_c4d353e7
	Checksum: 0xFFCF6020
	Offset: 0x16A8
	Size: 0x178
	Parameters: 3
	Flags: None
*/
function function_abb25db(n_time, n_color, str_waittill)
{
	if(!isdefined(n_color))
	{
		n_color = (0, 0, 0);
	}
	if(isdefined(str_waittill))
	{
		level waittill(str_waittill);
	}
	foreach(player in getplayers())
	{
		player thread lui::screen_fade_out(n_time, n_color);
		player val::set(#"hash_6378ea83b88b4f36", "takedamage", 0);
		player val::set(#"hash_6378ea83b88b4f36", "freezecontrols", 1);
		player val::set(#"hash_6378ea83b88b4f36", "show_crosshair", 0);
		player val::set(#"hash_6378ea83b88b4f36", "show_weapon_hud", 0);
	}
}

/*
	Name: function_542224cc
	Namespace: namespace_c4d353e7
	Checksum: 0xD99E16F0
	Offset: 0x1828
	Size: 0x190
	Parameters: 4
	Flags: None
*/
function function_542224cc(n_time, n_color, str_waittill, var_e9a0b654)
{
	if(!isdefined(n_color))
	{
		n_color = (0, 0, 0);
	}
	if(isdefined(str_waittill))
	{
		level waittill(str_waittill);
	}
	foreach(player in getplayers())
	{
		player thread lui::screen_fade_in(n_time, n_color);
		if(is_true(var_e9a0b654))
		{
			player val::reset(#"hash_6378ea83b88b4f36", "takedamage");
			player val::reset(#"hash_6378ea83b88b4f36", "freezecontrols");
			player val::reset(#"hash_6378ea83b88b4f36", "show_crosshair");
			player val::reset(#"hash_6378ea83b88b4f36", "show_weapon_hud");
		}
	}
}

/*
	Name: function_db84b4f4
	Namespace: namespace_c4d353e7
	Checksum: 0x74E56177
	Offset: 0x19C0
	Size: 0xF8
	Parameters: 0
	Flags: None
*/
function function_db84b4f4()
{
	zombie_doors = getentarray("zombie_door", "targetname");
	players = getplayers();
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
}

/*
	Name: function_56700eee
	Namespace: namespace_c4d353e7
	Checksum: 0x6C543125
	Offset: 0x1AC0
	Size: 0x15C
	Parameters: 1
	Flags: None
*/
function function_56700eee(a_ents)
{
	/#
		level notify(#"pap_quest_completed");
		level notify(#"hash_1943cbe07e8dd438");
	#/
	level function_165a271d();
	level function_db84b4f4();
	if(!level flag::get("connect_zone_opc_room_to_armory2"))
	{
		var_b1081d76 = getent("sms_door", "targetname");
		if(isdefined(var_b1081d76))
		{
			var_b1081d76 moveto(var_b1081d76.origin + (vectorscale((0, 0, -1), 102)), 0.05);
		}
	}
	hidemiscmodels("village_courtyard_side_gate");
	level thread function_1d66a215();
	level clientfield::set("" + #"hash_763dd8035e80f7c", 1);
}

/*
	Name: function_2996c15f
	Namespace: namespace_c4d353e7
	Checksum: 0x3CFC5160
	Offset: 0x1C28
	Size: 0x94
	Parameters: 1
	Flags: None
*/
function function_2996c15f(a_ents)
{
	var_a6e592f0 = a_ents[#"hash_5caebe2b8de202c6"];
	if(isdefined(var_a6e592f0))
	{
		var_a6e592f0 clientfield::set("" + #"hash_3ce728c2f6b351eb", 1);
	}
	hidemiscmodels("village_courtyard_side_gate");
	level thread function_1d66a215();
}

/*
	Name: function_e9b849a7
	Namespace: namespace_c4d353e7
	Checksum: 0x5147C018
	Offset: 0x1CC8
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function function_e9b849a7(a_ents)
{
	level thread function_1d66a215();
	level thread function_c8ef8fb2();
}

/*
	Name: function_318f5bad
	Namespace: namespace_c4d353e7
	Checksum: 0x10E64355
	Offset: 0x1D10
	Size: 0x134
	Parameters: 1
	Flags: None
*/
function function_318f5bad(a_ents)
{
	level thread function_165a271d();
	level thread function_db84b4f4();
	level thread function_1d66a215();
	var_a6e592f0 = a_ents[#"hash_5caebe2b8de202c6"];
	if(isdefined(var_a6e592f0))
	{
		var_a6e592f0 clientfield::set("" + #"hash_3ce728c2f6b351eb", 1);
	}
	level clientfield::set("" + #"hash_763dd8035e80f7c", 1);
	level waittill(#"hash_bc6b9462ca86b70");
	if(isdefined(var_a6e592f0))
	{
		var_a6e592f0 clientfield::set("" + #"hash_3ce728c2f6b351eb", 0);
	}
}

/*
	Name: function_324cf392
	Namespace: namespace_c4d353e7
	Checksum: 0xEDB5D7DA
	Offset: 0x1E50
	Size: 0x8C
	Parameters: 1
	Flags: None
*/
function function_324cf392(a_ents)
{
	/#
		level notify(#"pap_quest_completed");
		level notify(#"hash_1943cbe07e8dd438");
	#/
	hidemiscmodels("mdl_env_omega_defence_02");
	level thread function_165a271d();
	level thread function_db84b4f4();
}

/*
	Name: function_e3c65980
	Namespace: namespace_c4d353e7
	Checksum: 0xA79D9CE6
	Offset: 0x1EE8
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function function_e3c65980(a_ents)
{
	level clientfield::set("" + #"hash_763dd8035e80f7c", 0);
}

/*
	Name: function_165a271d
	Namespace: namespace_c4d353e7
	Checksum: 0x43C5CA36
	Offset: 0x1F30
	Size: 0xBC
	Parameters: 0
	Flags: None
*/
function function_165a271d()
{
	hidemiscmodels("hide_scene_models");
	hidemiscmodels("hide_mid_scene_models");
	a_script_models = getentarray("hide_scene_models", "targetname");
	var_21e76d02 = getentarray("hide_scene_models", "script_noteworthy");
	a_script_models = arraycombine(a_script_models, var_21e76d02);
	array::run_all(a_script_models, &hide);
}

/*
	Name: function_2baf9762
	Namespace: namespace_c4d353e7
	Checksum: 0x75471F64
	Offset: 0x1FF8
	Size: 0x114
	Parameters: 0
	Flags: None
*/
function function_2baf9762()
{
	level endon(#"end_game");
	s_veh = struct::get("end_fight_vehicle_loc");
	if(isdefined(s_veh))
	{
		var_2560e451 = spawnvehicle("veh_mil_ru_fav_heavy_zm", s_veh.origin, s_veh.angles, "end_fight_vehicle");
		var_2560e451.takedamage = 0;
		var_2560e451 thread scene::play(#"hash_6ce133c6a716cfc2");
		level flag::wait_till(#"hash_4b00aa230ebbe82b");
		var_2560e451 scene::stop(#"hash_6ce133c6a716cfc2", 1);
		if(isdefined(var_2560e451))
		{
			var_2560e451 delete();
		}
	}
}

/*
	Name: function_c8ef8fb2
	Namespace: namespace_c4d353e7
	Checksum: 0x5A7FE14B
	Offset: 0x2118
	Size: 0x1C
	Parameters: 0
	Flags: None
*/
function function_c8ef8fb2()
{
	exploder::exploder("fxexp_boss_orda_ambient");
}

/*
	Name: function_79ae7b73
	Namespace: namespace_c4d353e7
	Checksum: 0x1A8FAF6F
	Offset: 0x2140
	Size: 0x1E4
	Parameters: 0
	Flags: None
*/
function function_79ae7b73()
{
	level flag::set(#"hash_1b9ecc7979b0fcfb");
	level flag::set(#"boss_fight_started");
	showmiscmodels("hide_mid_scene_models");
	hidemiscmodels("village_courtyard_side_gate");
	level thread namespace_e0b1e9f5::function_e7aacbc9();
	level zm_utility::function_9ad5aeb1(0, 0, 1, 0);
	level.var_923e8cb4 = struct::get_array("end_fight_spawn_points");
	level teleport_players(level.var_923e8cb4);
	level.zones[#"hash_73946ff9933c1717"].is_enabled = 0;
	level.var_d6f059f7 = max(level.round_number, 20);
	level thread function_995832fb();
	level thread zm_vo::function_7622cb70(#"hash_49d2f2169f86e320");
	level scene::add_scene_func(#"hash_3c473c110c8c0ff6", &function_32d60e81, "init");
	level thread scene::play(#"hash_3c473c110c8c0ff6", "init");
	level waittill(#"hash_64d940c6df765159");
}

/*
	Name: teleport_players
	Namespace: namespace_c4d353e7
	Checksum: 0x50230607
	Offset: 0x2330
	Size: 0x94
	Parameters: 1
	Flags: None
*/
function teleport_players(var_a347ab1)
{
	a_players = getplayers();
	for(i = 0; i < a_players.size; i++)
	{
		a_players[i] setorigin(var_a347ab1[i].origin);
		a_players[i] setplayerangles(var_a347ab1[i].angles);
	}
}

/*
	Name: function_32d60e81
	Namespace: namespace_c4d353e7
	Checksum: 0xB603E25E
	Offset: 0x23D0
	Size: 0x2F4
	Parameters: 1
	Flags: None
*/
function function_32d60e81(ents)
{
	level.var_d99f785b = ents[#"hash_5caebe2b8de202c6"];
	level.var_d99f785b function_619a5c20();
	level.var_d99f785b setcandamage(1);
	level.var_d99f785b clientfield::set("" + #"hash_3ce728c2f6b351eb", 1);
	if(!isdefined(level.var_d99f785b.var_86a21346))
	{
		level.var_d99f785b.var_86a21346 = &function_b8f5e813;
	}
	level.var_d99f785b.var_28621cf4 = "j_head";
	level.var_d99f785b.var_e5365d8a = (0, 0, 0);
	n_round = level.round_number;
	if(n_round < 20)
	{
		n_round = 20;
	}
	else if(n_round > 40)
	{
		n_round = 40;
	}
	n_percent = 1 - ((40 - n_round) / 20);
	var_57113f74 = int(lerpfloat(80000, 450000, n_percent));
	var_64cfdaf1 = int(lerpfloat(80000, 450000, n_percent));
	var_1bb6c8c4 = int(lerpfloat(80000, 450000, n_percent));
	level.var_d99f785b thread function_2d524ed([2:var_1bb6c8c4, 1:var_64cfdaf1, 0:var_57113f74]);
	level.var_d99f785b thread function_17836c63();
	level.var_d99f785b thread function_dc466f4e();
	level.var_d99f785b thread function_9ad6d900();
	/#
		if(getdvarint(#"hash_1eae33931bd2729", 0))
		{
			level thread objective_manager::start_timer(300);
		}
	#/
}

/*
	Name: function_dc466f4e
	Namespace: namespace_c4d353e7
	Checksum: 0x820C22C9
	Offset: 0x26D0
	Size: 0x5A8
	Parameters: 0
	Flags: None
*/
function function_dc466f4e()
{
	level endon(#"end_game");
	level waittill(#"hash_3807e7b1086e4aa0");
	level zm_utility::function_9ad5aeb1(0, 1, 0, 0);
	level flag::set(#"hash_4b00aa230ebbe82b");
	level function_abb25db(0, (0, 0, 0));
	level thread function_542224cc(0.5, (0, 0, 0), "screen_fade_in_black");
	level thread function_abb25db(0.15, (0, 0, 0), "screen_fade_to_black");
	level scene::stop("aib_t9_zm_vign_peck_seated_01", 1);
	if(isdefined(level.var_9f1e2800))
	{
		level.var_9f1e2800 delete();
	}
	if(isdefined(level.var_9a81036b))
	{
		level.var_9a81036b delete();
	}
	a_ents[#"hash_5caebe2b8de202c6"] = level.var_d99f785b;
	level scene::stop(#"hash_3c473c110c8c0ff6");
	level scene::init_streamer(#"hash_74463db12dcd6b5e", getplayers(), 0, 0);
	music::setmusicstate("outro_igc_1");
	foreach(player in getplayers())
	{
		player.var_f4e33249 = 1;
	}
	function_c9fd78e4(#"hash_74463db12dcd6b5e", #"hash_4f11c86e59a3292a");
	level scene::play(#"hash_74463db12dcd6b5e", a_ents);
	music::setmusicstate("outro_igc_2");
	level thread function_542224cc(1.5, (0, 0, 0), "screen_fade_in_black");
	level thread function_abb25db(0.15, (0, 0, 0), "screen_fade_to_black");
	function_c9fd78e4(#"hash_4f11c86e59a3292a", #"hash_66a962b4710a2287");
	level scene::play(#"hash_4f11c86e59a3292a");
	music::setmusicstate("epilogue");
	level thread function_542224cc(1.5, (0, 0, 0), "screen_fade_in_black");
	level thread function_abb25db(0.15, (0, 0, 0), "screen_fade_to_black");
	level scene::play(#"hash_66a962b4710a2287");
	level.musicsystemoverride = 0;
	wait(1.5);
	foreach(player in getplayers())
	{
		player.var_f4e33249 = undefined;
	}
	if(isdefined(level.var_7f41d246))
	{
		foreach(player_struct in level.var_7f41d246)
		{
			if(zm_utility::is_player_valid(player_struct.player, 0, 1))
			{
				player_struct.player zm_stats::increment_challenge_stat(#"hash_7b482d2a97abe802");
				player_struct.player zm_challenges::function_d6b32ad3(player_struct.weapon, #"hash_9c59d60380f570a", 3);
			}
		}
	}
	level notify(#"hash_64d940c6df765159");
}

/*
	Name: function_9ad6d900
	Namespace: namespace_c4d353e7
	Checksum: 0x1BAD89E9
	Offset: 0x2C80
	Size: 0xE0
	Parameters: 0
	Flags: None
*/
function function_9ad6d900()
{
	level endon(#"hash_3807e7b1086e4aa0", #"end_game");
	self endon(#"death");
	while(true)
	{
		self waittill(#"hash_67f026d74b2aa6d7");
		level flag::set(#"hash_7b2214bd0c40093");
		level thread namespace_1812c3f4::function_ed7aab5b(#"hash_2a01a5091cb599b1", #"hash_6aa9238eb4e57fd3", 60);
		wait(8);
		level flag::clear(#"hash_7b2214bd0c40093");
	}
}

/*
	Name: function_17836c63
	Namespace: namespace_c4d353e7
	Checksum: 0x28D8D058
	Offset: 0x2D68
	Size: 0x144
	Parameters: 0
	Flags: None
*/
function function_17836c63()
{
	level endon(#"hash_3807e7b1086e4aa0", #"end_game");
	self function_aa6f0550("slam", 1);
	self function_aa6f0550("swarm", 1);
	self function_aa6f0550("idle", 1);
	while(true)
	{
		switch(level.var_41afa8f)
		{
			case 1:
			default:
			{
				self function_9f1469b5();
				break;
			}
			case 2:
			{
				self function_f979cde4();
				break;
			}
			case 3:
			{
				self function_a01cbba7();
				break;
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_9f1469b5
	Namespace: namespace_c4d353e7
	Checksum: 0x42146F9
	Offset: 0x2EB8
	Size: 0xFC
	Parameters: 0
	Flags: None
*/
function function_9f1469b5()
{
	level endon(#"hash_3807e7b1086e4aa0", #"end_game");
	n_rand = randomint(100);
	if(n_rand <= 40)
	{
		self function_aa6f0550("idle");
	}
	else
	{
		if(n_rand <= 60)
		{
			self function_aa6f0550("slam");
		}
		else
		{
			if(n_rand <= 80)
			{
				self function_aa6f0550("swarm");
			}
			else
			{
				self function_aa6f0550("launcher");
			}
		}
	}
}

/*
	Name: function_f979cde4
	Namespace: namespace_c4d353e7
	Checksum: 0xAE897181
	Offset: 0x2FC0
	Size: 0xFC
	Parameters: 0
	Flags: None
*/
function function_f979cde4()
{
	level endon(#"hash_3807e7b1086e4aa0", #"end_game");
	n_rand = randomint(100);
	if(n_rand <= 40)
	{
		self function_aa6f0550("slam");
	}
	else
	{
		if(n_rand <= 60)
		{
			self function_aa6f0550("idle");
		}
		else
		{
			if(n_rand <= 80)
			{
				self function_aa6f0550("swarm");
			}
			else
			{
				self function_aa6f0550("launcher");
			}
		}
	}
}

/*
	Name: function_a01cbba7
	Namespace: namespace_c4d353e7
	Checksum: 0xDEC33729
	Offset: 0x30C8
	Size: 0xFC
	Parameters: 0
	Flags: None
*/
function function_a01cbba7()
{
	level endon(#"hash_3807e7b1086e4aa0", #"end_game");
	n_rand = randomint(100);
	if(n_rand <= 40)
	{
		self function_aa6f0550("slam");
	}
	else
	{
		if(n_rand <= 60)
		{
			self function_aa6f0550("idle");
		}
		else
		{
			if(n_rand <= 80)
			{
				self function_aa6f0550("launcher");
			}
			else
			{
				self function_aa6f0550("swarm");
			}
		}
	}
}

/*
	Name: function_f40bbb22
	Namespace: namespace_c4d353e7
	Checksum: 0xE79262D3
	Offset: 0x31D0
	Size: 0xC6
	Parameters: 1
	Flags: None
*/
function function_f40bbb22(var_7f0ca11a)
{
	foreach(player in function_a1ef346b())
	{
		if(player istouching(var_7f0ca11a) && !is_true(player.ignoreme))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_aa6f0550
	Namespace: namespace_c4d353e7
	Checksum: 0xB250B8E4
	Offset: 0x32A0
	Size: 0x3AE
	Parameters: 2
	Flags: None
*/
function function_aa6f0550(str_state, var_a013c644)
{
	level endon(#"hash_3807e7b1086e4aa0", #"end_game");
	if(!is_true(var_a013c644))
	{
		var_7f0ca11a = getent("trigger_arm_smash_start", "targetname");
		if(function_f40bbb22(var_7f0ca11a))
		{
			str_state = "slam";
		}
	}
	if(level flag::get(#"hash_5f55ca06d7a8211"))
	{
		str_state = "hit";
	}
	if(!is_true(var_a013c644))
	{
		if(self.var_93706a0d === "launcher" && str_state === "launcher")
		{
			str_state = array::random([2:"swarm", 1:"slam", 0:"idle"]);
		}
		else
		{
			if(self.var_93706a0d === "idle" && str_state === "idle")
			{
				str_state = array::random([2:"launcher", 1:"swarm", 0:"slam"]);
			}
			else if(self.var_93706a0d === "swarm" && str_state === "swarm")
			{
				str_state = array::random([2:"launcher", 1:"idle", 0:"slam"]);
			}
		}
	}
	/#
		if(isdefined(level.var_cc4817d7))
		{
			str_state = level.var_cc4817d7;
		}
	#/
	switch(str_state)
	{
		case "idle":
		default:
		{
			self.ai_state = "idle";
			self function_133bf8a7();
			break;
		}
		case "slam":
		{
			self.ai_state = str_state;
			self function_c37dfa52(var_a013c644);
			break;
		}
		case "swarm":
		{
			self.ai_state = str_state;
			self function_75edf7ba();
			break;
		}
		case "launcher":
		{
			self.ai_state = str_state;
			self function_6afb3f4b();
			break;
		}
		case "hit":
		{
			self.ai_state = str_state;
			self function_fee76e8f();
			break;
		}
	}
	self.var_93706a0d = str_state;
	self.ai_state = undefined;
}

/*
	Name: function_133bf8a7
	Namespace: namespace_c4d353e7
	Checksum: 0x97EB77B6
	Offset: 0x3658
	Size: 0x84
	Parameters: 0
	Flags: None
*/
function function_133bf8a7()
{
	level endon(#"hash_3807e7b1086e4aa0", #"end_game");
	if(math::cointoss())
	{
		var_559c5c3e = "idle_03";
	}
	else
	{
		var_559c5c3e = "idle_twitch";
	}
	level scene::play(#"hash_3c473c110c8c0ff6", var_559c5c3e);
}

/*
	Name: function_c37dfa52
	Namespace: namespace_c4d353e7
	Checksum: 0x574CF994
	Offset: 0x36E8
	Size: 0x12C
	Parameters: 1
	Flags: None
*/
function function_c37dfa52(var_a013c644)
{
	level endon(#"hash_3807e7b1086e4aa0", #"end_game");
	if(!is_true(var_a013c644))
	{
		e_vol = getent("orda_arm_slam_volume", "targetname");
		a_touching = array::get_touching(function_a1ef346b(), e_vol);
		if(a_touching.size == 0)
		{
			return;
		}
		array::thread_all(a_touching, &namespace_1812c3f4::function_ed7aab5b, #"hash_5ab11d26df1a0595", #"hash_7a66af8196ad9bf6");
	}
	self thread function_9fc0edc6();
	level scene::play(#"hash_3c473c110c8c0ff6", "arm_slam");
}

/*
	Name: function_9fc0edc6
	Namespace: namespace_c4d353e7
	Checksum: 0x8B5977F9
	Offset: 0x3820
	Size: 0x604
	Parameters: 0
	Flags: None
*/
function function_9fc0edc6()
{
	level endon(#"hash_3807e7b1086e4aa0", #"end_game");
	var_5692f6cb = struct::get("arm_smash_origin");
	trigger_damage = getent("trigger_arm_smash_damage", "targetname");
	var_38a434b = getent("trigger_arm_smash_death", "targetname");
	var_f39a76f2 = getentarray("end_fight_boss_arm_clip", "targetname");
	self waittill(#"hash_64b1591725b1913d");
	array::run_all(var_f39a76f2, &disconnectpaths);
	waitframe(1);
	earthquake(0.6, 0.8, var_5692f6cb.origin, 4000);
	foreach(player in function_a1ef346b())
	{
		player function_bc82f900(#"damage_heavy");
	}
	var_6a05438d = array::get_touching(getplayers(), var_38a434b);
	var_574aa352 = array::get_touching(getaiarray(), var_38a434b);
	var_36113471 = arraycombine(var_6a05438d, var_574aa352);
	var_a347ab1 = struct::get_array(#"hash_3364670f906ce18b");
	foreach(ent in var_36113471)
	{
		if(isplayer(ent) && !ispointonnavmesh(ent.origin, 96))
		{
			ent thread function_5d8fb754();
			if(var_a347ab1.size <= 0)
			{
				var_a347ab1 = struct::get_array(#"hash_3364670f906ce18b");
			}
			s_teleport = arraygetclosest(ent.origin, var_a347ab1);
			arrayremovevalue(var_a347ab1, s_teleport);
			v_valid_point = getclosestpointonnavmesh(s_teleport.origin, 500, 64);
			if(!isvec(v_valid_point))
			{
				v_valid_point = s_teleport.origin;
			}
			ent setorigin(v_valid_point);
		}
		ent dodamage(ent.health + 1000, ent.origin, self);
	}
	var_68812391 = array::get_touching(getplayers(), trigger_damage);
	var_aaff98d4 = array::get_touching(getaiarray(), trigger_damage);
	var_45f7a733 = arraycombine(var_68812391, var_aaff98d4);
	var_45f7a733 = array::exclude(var_45f7a733, var_36113471);
	foreach(ent in var_45f7a733)
	{
		ent dodamage(75, ent.origin, self);
		if(isai(ent))
		{
			ent zombie_utility::setup_zombie_knockdown(var_5692f6cb.origin);
		}
	}
	waitframe(1);
	array::run_all(var_f39a76f2, &solid);
	self waittill(#"hash_64e9b0ba4872c5e8");
	array::run_all(var_f39a76f2, &notsolid);
	array::run_all(var_f39a76f2, &connectpaths);
}

/*
	Name: function_5d8fb754
	Namespace: namespace_c4d353e7
	Checksum: 0xC35989A8
	Offset: 0x3E30
	Size: 0x84
	Parameters: 0
	Flags: None
*/
function function_5d8fb754()
{
	self endon(#"disconnect");
	if(self util::isusingremote())
	{
		return;
	}
	self lui::screen_fade_out(0, (0, 0, 0), "arm_slam_blackscreen");
	wait(3);
	self lui::screen_fade_in(1.5, (0, 0, 0), "arm_slam_blackscreen");
}

/*
	Name: function_61d6d1bf
	Namespace: namespace_c4d353e7
	Checksum: 0x1C35A5CD
	Offset: 0x3EC0
	Size: 0x5C
	Parameters: 1
	Flags: None
*/
function function_61d6d1bf(n_damage)
{
	if(!isdefined(n_damage))
	{
		n_damage = 75;
	}
	self endon(#"death");
	self dodamage(n_damage, self.origin, level.var_d99f785b);
}

/*
	Name: function_75edf7ba
	Namespace: namespace_c4d353e7
	Checksum: 0x4C4C1750
	Offset: 0x3F28
	Size: 0x64
	Parameters: 0
	Flags: None
*/
function function_75edf7ba()
{
	level endon(#"hash_3807e7b1086e4aa0", #"end_game");
	self thread function_7d032ab3();
	level scene::play(#"hash_3c473c110c8c0ff6", "swarm_attack");
}

/*
	Name: function_7d032ab3
	Namespace: namespace_c4d353e7
	Checksum: 0x6F7C52BD
	Offset: 0x3F98
	Size: 0xAC
	Parameters: 0
	Flags: None
*/
function function_7d032ab3()
{
	level endon(#"hash_3807e7b1086e4aa0", #"end_game");
	self waittill(#"swarm_attack");
	self namespace_cc727a3b::function_f2b0a2e1();
	for(i = 0; i < 4; i++)
	{
		if(!isdefined(self))
		{
			return;
		}
		self thread namespace_cc727a3b::function_2d86c7c9();
		wait(0.75);
	}
}

/*
	Name: function_6afb3f4b
	Namespace: namespace_c4d353e7
	Checksum: 0x29903F20
	Offset: 0x4050
	Size: 0x78
	Parameters: 0
	Flags: None
*/
function function_6afb3f4b()
{
	level endon(#"hash_3807e7b1086e4aa0", #"end_game");
	self thread function_c9cec280();
	level scene::play(#"hash_3c473c110c8c0ff6", "hellhound_attack");
	level notify(#"hash_211b2d007aced982");
}

/*
	Name: function_c9cec280
	Namespace: namespace_c4d353e7
	Checksum: 0xED2FCAAD
	Offset: 0x40D0
	Size: 0x278
	Parameters: 0
	Flags: None
*/
function function_c9cec280()
{
	level endon(#"hash_211b2d007aced982", #"hash_3807e7b1086e4aa0", #"end_game");
	a_targets = struct::get_array("hellhound_launcher_target_loc");
	e_vol = getent("orda_dog_launcher_attack_volume", "targetname");
	while(true)
	{
		self waittill(#"hash_63670ad154a3b11e");
		var_53e3ff82 = undefined;
		a_players = array::randomize(function_a1ef346b());
		if(a_players.size)
		{
			foreach(player in a_players)
			{
				if(is_true(self has_line_of_sight(player)) && player istouching(e_vol))
				{
					var_53e3ff82 = player;
					break;
				}
			}
		}
		if(!isdefined(var_53e3ff82))
		{
			s_target = array::random(a_targets);
			if(!isdefined(s_target.mdl_origin))
			{
				s_target.mdl_origin = util::spawn_model("tag_origin", s_target.origin);
				util::wait_network_frame();
			}
			var_53e3ff82 = s_target.mdl_origin;
		}
		level thread namespace_1812c3f4::function_ed7aab5b(#"hash_5cdf7cb84bd3af3d", #"hash_5c3326edfaef3e64");
		self thread namespace_cc727a3b::function_4b462025(var_53e3ff82, 1);
	}
}

/*
	Name: has_line_of_sight
	Namespace: namespace_c4d353e7
	Checksum: 0x2D56B03A
	Offset: 0x4350
	Size: 0x82
	Parameters: 1
	Flags: None
*/
function has_line_of_sight(player)
{
	eye = player util::get_eye();
	launch_pos = self gettagorigin("j_pocket5_le");
	trace = sighttracepassed(launch_pos, eye, 0, self, player);
	return trace;
}

/*
	Name: function_fee76e8f
	Namespace: namespace_c4d353e7
	Checksum: 0x639A2C27
	Offset: 0x43E0
	Size: 0xA4
	Parameters: 0
	Flags: None
*/
function function_fee76e8f()
{
	level endon(#"hash_3807e7b1086e4aa0", #"end_game");
	if(level.var_41afa8f === 3)
	{
		var_541138b6 = "transition_02";
	}
	else
	{
		var_541138b6 = "transition_pain";
	}
	level scene::play(#"hash_3c473c110c8c0ff6", var_541138b6);
	level flag::clear(#"hash_5f55ca06d7a8211");
}

/*
	Name: function_2d524ed
	Namespace: namespace_c4d353e7
	Checksum: 0x424A95C5
	Offset: 0x4490
	Size: 0x3B0
	Parameters: 1
	Flags: None
*/
function function_2d524ed(var_8f66ca5d)
{
	level endon(#"hash_3807e7b1086e4aa0", #"end_game");
	if(!isdefined(level.var_41afa8f))
	{
		level.var_41afa8f = 1;
	}
	var_25febefa = [];
	var_f6cc9550 = 0;
	foreach(e_player in getplayers())
	{
		if(!level.var_7dbadc8c namespace_72133e5::is_open(e_player))
		{
			level.var_7dbadc8c namespace_72133e5::open(e_player);
		}
		level.var_7dbadc8c namespace_72133e5::function_751f7270(e_player, 0);
		level.var_7dbadc8c namespace_72133e5::function_338d48a0(e_player, 0);
		level.var_7dbadc8c namespace_72133e5::function_a95c34f3(e_player, 1);
		level.var_7dbadc8c namespace_72133e5::function_a59aefa6(e_player, 1);
	}
	n_players = function_a1ef346b().size;
	if(n_players < 1)
	{
		n_players = 1;
	}
	else if(n_players > 4)
	{
		n_players = 4;
	}
	var_2aaf6cdb = 1 + ((n_players - 1) * 0.75);
	for(i = 0; i < var_8f66ca5d.size; i++)
	{
		var_c962047c = int(var_2aaf6cdb * var_8f66ca5d[i]);
		if(!isdefined(var_25febefa))
		{
			var_25febefa = [];
		}
		else if(!isarray(var_25febefa))
		{
			var_25febefa = array(var_25febefa);
		}
		var_25febefa[var_25febefa.size] = var_c962047c;
		var_f6cc9550 = var_f6cc9550 + var_c962047c;
	}
	self function_386e82a(var_f6cc9550, var_25febefa);
	foreach(e_player in getplayers())
	{
		if(level.var_7dbadc8c namespace_72133e5::is_open(e_player))
		{
			level.var_7dbadc8c namespace_72133e5::function_a95c34f3(e_player, 0);
			level.var_7dbadc8c namespace_72133e5::close(e_player);
		}
	}
	level notify(#"hash_3807e7b1086e4aa0");
}

/*
	Name: function_b8f5e813
	Namespace: namespace_c4d353e7
	Checksum: 0xA3FA2F6
	Offset: 0x4848
	Size: 0x136
	Parameters: 13
	Flags: None
*/
function function_b8f5e813(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, iboneindex, imodelindex)
{
	tagorigin = self gettagorigin("j_neck");
	distsq = distancesquared(imodelindex, tagorigin);
	self.var_1c0ce945 = 0;
	if(distsq <= sqr(64) && level flag::get(#"hash_7b2214bd0c40093"))
	{
		iboneindex = int(iboneindex * 4);
		self.var_1c0ce945 = 1;
	}
	return iboneindex;
}

/*
	Name: function_386e82a
	Namespace: namespace_c4d353e7
	Checksum: 0x26EE292A
	Offset: 0x4988
	Size: 0x4F8
	Parameters: 2
	Flags: None
*/
function function_386e82a(var_f6cc9550, var_25febefa)
{
	level endon(#"end_game");
	self endon(#"death");
	level.n_total_damage = 0;
	level.var_c962047c = var_25febefa[0];
	self.var_95ee6823 = 0.3;
	n_index = 0;
	var_245f6f1 = var_f6cc9550;
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"damage");
		if(isdefined(waitresult.amount) && isplayer(waitresult.attacker))
		{
			damage = waitresult.amount;
			weapon = waitresult.weapon;
			attacker = waitresult.attacker;
			inflictor = waitresult.inflictor;
			flags = waitresult.flags;
			meansofdeath = waitresult.mod;
			var_fd90b0bb = waitresult.var_fd90b0bb;
			vpoint = waitresult.position;
			vdir = waitresult.direction;
			shitloc = waitresult.shitloc;
			psoffsettime = waitresult.psoffsettime;
			boneindex = waitresult.boneindex;
			surfacetype = waitresult.surfacetype;
			damage = get_weapon_damage(inflictor, attacker, damage, flags, meansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype);
			if(isdefined(weapon) && zm_weapons::is_wonder_weapon(weapon))
			{
				damage = int(damage * 0.3);
			}
			var_ebcff177 = (is_true(self.var_1c0ce945) ? 2 : 1);
			var_cb7c50c0 = aiutility::function_cb552839(self);
			hud::function_c9800094(attacker, var_cb7c50c0, damage, var_ebcff177);
			attacker util::show_hit_marker();
			level.n_total_damage = level.n_total_damage + damage;
			var_245f6f1 = var_245f6f1 - damage;
			if(zm_utility::is_player_valid(attacker, 0, 0))
			{
				if(!isdefined(level.var_7f41d246))
				{
					level.var_7f41d246 = [];
				}
				var_cf7befe9 = {#weapon:weapon, #player:attacker};
				level.var_7f41d246[attacker getentitynumber()] = var_cf7befe9;
			}
			n_percent = var_245f6f1 / var_f6cc9550;
			if(n_percent < 0)
			{
				n_percent = 0;
			}
			foreach(e_player in getplayers())
			{
				level.var_7dbadc8c namespace_72133e5::function_a59aefa6(e_player, n_percent);
			}
			b_dead = level.n_total_damage >= var_f6cc9550;
			if(b_dead || level.n_total_damage >= level.var_c962047c)
			{
				level notify(#"hash_38f29f9cb03586ea");
				if(b_dead)
				{
					return;
				}
				level.var_41afa8f++;
				n_index++;
				level.var_c962047c = level.n_total_damage + var_25febefa[n_index];
				level flag::set(#"hash_5f55ca06d7a8211");
			}
		}
	}
}

/*
	Name: get_weapon_damage
	Namespace: namespace_c4d353e7
	Checksum: 0x8E23C7EC
	Offset: 0x4E88
	Size: 0x302
	Parameters: 13
	Flags: None
*/
function get_weapon_damage(inflictor, attacker, damage, flags, meansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype)
{
	if(killstreaks::is_killstreak_weapon(weapon) && isdefined(weapon.name))
	{
		switch(weapon.name)
		{
			case "remote_missile_missile":
			{
				damage = 50000;
				break;
			}
			case "napalm_strike":
			{
				damage = 10000;
				break;
			}
			case "planemortar":
			{
				damage = 7000;
				break;
			}
		}
	}
	if(weapon.offhandslot === "Tactical grenade" || weapon.offhandslot === "Lethal grenade" || weapon.offhandslot === "Special")
	{
		damage = zm_equipment::function_379f6b5d(damage);
		damage = int(damage * 0.1);
	}
	item = attacker namespace_b376ff3f::function_230ceec4(weapon);
	if(isdefined(item))
	{
		var_528363fd = self namespace_b61a349a::function_b3496fde(inflictor, attacker, damage, flags, meansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype);
		damage = damage + var_528363fd;
		if(meansofdeath != "MOD_MELEE")
		{
			var_4d1602de = zm_weapons::function_d85e6c3a(item.var_a6762160);
			damage = damage * var_4d1602de;
			if(isdefined(item.var_a8bccf69))
			{
				var_645b8bb = zm_weapons::function_896671d5(item.var_a6762160.weapon, item.var_a8bccf69);
				damage = damage * var_645b8bb;
			}
		}
	}
	else
	{
		var_fd72ea28 = self namespace_b61a349a::function_b3496fde(inflictor, attacker, damage, flags, meansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype);
		damage = damage + var_fd72ea28;
	}
	damage = namespace_1b527536::actor_damage_override(inflictor, attacker, damage, flags, meansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype);
	return int(damage);
}

/*
	Name: function_995832fb
	Namespace: namespace_c4d353e7
	Checksum: 0x4DBE171B
	Offset: 0x5198
	Size: 0x1C4
	Parameters: 0
	Flags: None
*/
function function_995832fb()
{
	level endon(#"hash_3807e7b1086e4aa0", #"end_game");
	callback::on_ai_killed(&on_ai_killed);
	if(!isdefined(level.var_2c1f758c))
	{
		level.var_2c1f758c = 0;
	}
	if(!isdefined(level.var_9eaf1031))
	{
		level.var_9eaf1031 = 0;
	}
	if(!isdefined(level.var_d306d2e))
	{
		level.var_d306d2e = 0;
	}
	if(!isdefined(level.var_197697e8))
	{
		level.var_197697e8 = 0;
	}
	if(!isdefined(level.var_2266b455))
	{
		level.var_2266b455 = 0;
	}
	level thread function_732f7da0();
	wait(8);
	level thread function_2b6b4a44();
	level thread function_d6270518();
	level waittill(#"hash_38f29f9cb03586ea");
	wait(8);
	level thread function_2b6b4a44();
	level thread function_e3dda085();
	level waittill(#"hash_38f29f9cb03586ea");
	wait(8);
	level thread function_2b6b4a44();
	level thread function_d6c80686();
}

/*
	Name: function_d6270518
	Namespace: namespace_c4d353e7
	Checksum: 0x9D7206AC
	Offset: 0x5368
	Size: 0x64
	Parameters: 0
	Flags: None
*/
function function_d6270518()
{
	level flag::set(#"hash_3bdcbb902730e623");
	level.var_2c1f758c = 0;
	level thread function_de60e752(undefined, struct::get_array("orda_boss_spawns"));
}

/*
	Name: function_e3dda085
	Namespace: namespace_c4d353e7
	Checksum: 0x4A5F495B
	Offset: 0x53D8
	Size: 0x9C
	Parameters: 0
	Flags: None
*/
function function_e3dda085()
{
	level flag::set(#"hash_3bdcbb902730e623");
	level.var_2c1f758c = 0;
	level.var_2266b455 = 0;
	level thread function_de60e752(undefined, struct::get_array("orda_boss_spawns"));
	level thread function_e4db583b(0, undefined, undefined, struct::get_array("orda_boss_spawns"));
}

/*
	Name: function_d6c80686
	Namespace: namespace_c4d353e7
	Checksum: 0xA5711DAA
	Offset: 0x5480
	Size: 0xDC
	Parameters: 0
	Flags: None
*/
function function_d6c80686()
{
	level flag::set(#"hash_3bdcbb902730e623");
	level.var_2c1f758c = 0;
	level.var_2266b455 = 0;
	level.var_197697e8 = 0;
	level thread function_de60e752(undefined, struct::get_array("orda_boss_spawns"));
	level thread function_c7f8bea5(0, undefined, undefined, struct::get_array("orda_boss_spawns"));
	level thread function_e4db583b(10, undefined, undefined, struct::get_array("orda_boss_spawns"));
}

/*
	Name: function_732f7da0
	Namespace: namespace_c4d353e7
	Checksum: 0xA36C4A05
	Offset: 0x5568
	Size: 0x6C
	Parameters: 0
	Flags: None
*/
function function_732f7da0()
{
	if(!isdefined(level.var_f3c4bd00))
	{
		level.var_f3c4bd00 = zm_utility::get_number_of_valid_players();
	}
	else if(level.var_f3c4bd00 < zm_utility::get_number_of_valid_players())
	{
		level.var_f3c4bd00 = zm_utility::get_number_of_valid_players();
	}
}

/*
	Name: function_de60e752
	Namespace: namespace_c4d353e7
	Checksum: 0xF97B6CD6
	Offset: 0x55E0
	Size: 0x6A0
	Parameters: 2
	Flags: None
*/
function function_de60e752(var_533ac894, a_s_spawnpoints)
{
	level endon(#"hash_38f29f9cb03586ea", #"spawn_zombies", #"intermission");
	n_round = level.var_d6f059f7;
	switch(level.var_f3c4bd00)
	{
		case 1:
		{
			var_d166a3c6 = 1;
			var_6d55be0e = 0.25;
			break;
		}
		case 2:
		{
			var_d166a3c6 = 2;
			var_6d55be0e = 0.2;
			break;
		}
		case 3:
		{
			var_d166a3c6 = 5;
			var_6d55be0e = 0.15;
			break;
		}
		case 4:
		{
			var_d166a3c6 = 9;
			var_6d55be0e = 0.1;
			break;
		}
	}
	n_max_active_ai = 19 + var_d166a3c6;
	level.var_9eaf1031 = 0;
	level.var_83c0592c = 0;
	if(!isarray(a_s_spawnpoints))
	{
		s_zone = level.zones[#"hash_64d4cc9731a01d78"];
		a_s_spawnpoints = struct::get_array(s_zone.name + "_spawns");
		a_s_spawnpoints = arraycombine(a_s_spawnpoints, struct::get_array(s_zone.name + "_spawner"), 0, 0);
		var_e6217dda = getarraykeys(s_zone.adjacent_zones);
		foreach(str_zone in var_e6217dda)
		{
			if(isdefined(s_zone.adjacent_zones[str_zone]) && s_zone.adjacent_zones[str_zone].is_connected)
			{
				a_s_spawnpoints = arraycombine(a_s_spawnpoints, struct::get_array(str_zone + "_spawns"), 0, 0);
				a_s_spawnpoints = arraycombine(a_s_spawnpoints, struct::get_array(str_zone + "_spawner"), 0, 0);
			}
		}
		if(isdefined(var_533ac894))
		{
			foreach(str_zone in var_533ac894)
			{
				a_s_spawnpoints = arraycombine(a_s_spawnpoints, struct::get_array(str_zone + "_spawns"), 0, 0);
				a_s_spawnpoints = arraycombine(a_s_spawnpoints, struct::get_array(str_zone + "_spawner"), 0, 0);
			}
		}
	}
	a_s_spawnpoints = array::filter(a_s_spawnpoints, 0, &function_62b1d725);
	var_c5cc6b59 = array::randomize(a_s_spawnpoints);
	n_index = 0;
	level.var_c92172f4 = 0;
	level.var_d306d2e = 0;
	while(true)
	{
		while(getaiteamarray(level.zombie_team).size >= n_max_active_ai)
		{
			util::wait_network_frame();
		}
		spawner = array::random(level.zombie_spawners);
		s_spawnpoint = var_c5cc6b59[n_index];
		if((n_index + 1) >= var_c5cc6b59.size)
		{
			n_index = 0;
		}
		else
		{
			n_index++;
		}
		var_b2a4b538 = level.var_83c0592c;
		level waittill(#"hash_6986218d09dc1cb2");
		e_zombie = zombie_utility::spawn_zombie(spawner, spawner.targetname, s_spawnpoint, n_round);
		if(isdefined(e_zombie))
		{
			level.var_83c0592c++;
			e_zombie.maxhealth = e_zombie namespace_e0710ee6::function_b5fe98(n_round);
			e_zombie.health = e_zombie.maxhealth;
			level.var_2c1f758c++;
		}
		level.var_c92172f4++;
		if(level.var_c92172f4 >= n_max_active_ai)
		{
			var_ee1205c2 = n_max_active_ai - (n_max_active_ai * 0.25);
			while(level.var_d306d2e <= var_ee1205c2)
			{
				util::wait_network_frame();
			}
			level flag::clear(#"hash_3bdcbb902730e623");
			wait(40);
			level.var_c92172f4 = 0;
			level.var_d306d2e = 0;
			level flag::set(#"hash_3bdcbb902730e623");
		}
		wait(var_6d55be0e);
	}
	level notify(#"hash_71fd67248b9a37ca");
}

/*
	Name: on_ai_killed
	Namespace: namespace_c4d353e7
	Checksum: 0x61355841
	Offset: 0x5C88
	Size: 0x14C
	Parameters: 1
	Flags: None
*/
function on_ai_killed(params)
{
	e_attacker = params.eattacker;
	if(self.archetype === #"zombie")
	{
		if(!isplayer(e_attacker))
		{
			level thread function_a42d50ad();
			return;
		}
		level.var_2c1f758c--;
		level.var_9eaf1031++;
		level.var_d306d2e++;
	}
	if(self.archetype === #"mimic")
	{
		if(!isplayer(e_attacker))
		{
			level thread function_11cc0e55();
			return;
		}
		level.var_2266b455--;
		level.var_d306d2e++;
	}
	if(self.archetype === #"raz")
	{
		if(!isplayer(e_attacker))
		{
			level thread function_c658f846();
			return;
		}
		level.var_197697e8--;
		level.var_d306d2e++;
	}
}

/*
	Name: function_a42d50ad
	Namespace: namespace_c4d353e7
	Checksum: 0x3F7063CF
	Offset: 0x5DE0
	Size: 0xF2
	Parameters: 0
	Flags: None
*/
function function_a42d50ad()
{
	level endon(#"hash_38f29f9cb03586ea", #"spawn_zombies", #"intermission");
	spawner = array::random(level.zombie_spawners);
	n_round = level.var_d6f059f7;
	ai_zombie = undefined;
	while(!isdefined(ai_zombie))
	{
		level waittill(#"hash_6986218d09dc1cb2");
		ai_zombie = zombie_utility::spawn_zombie(spawner, spawner.targetname, undefined, n_round);
	}
	ai_zombie.maxhealth = ai_zombie namespace_e0710ee6::function_b5fe98(n_round);
	ai_zombie.health = ai_zombie.maxhealth;
}

/*
	Name: function_11cc0e55
	Namespace: namespace_c4d353e7
	Checksum: 0x222F8163
	Offset: 0x5EE0
	Size: 0xC2
	Parameters: 0
	Flags: None
*/
function function_11cc0e55()
{
	level endon(#"hash_38f29f9cb03586ea", #"spawn_zombies", #"intermission");
	n_round = level.var_d6f059f7;
	var_c40fb40b = undefined;
	while(!isdefined(var_c40fb40b))
	{
		level waittill(#"hash_66fc3c05e12b4225");
		var_c40fb40b = namespace_14c07d4f::spawn_single();
	}
	var_c40fb40b.maxhealth = var_c40fb40b namespace_e0710ee6::function_b5fe98(n_round);
	var_c40fb40b.health = var_c40fb40b.maxhealth;
}

/*
	Name: function_c658f846
	Namespace: namespace_c4d353e7
	Checksum: 0x346D905F
	Offset: 0x5FB0
	Size: 0xCA
	Parameters: 0
	Flags: None
*/
function function_c658f846()
{
	level endon(#"hash_38f29f9cb03586ea", #"spawn_zombies", #"intermission");
	n_round = level.var_d6f059f7;
	var_7e46a1cf = undefined;
	while(!isdefined(var_7e46a1cf))
	{
		level waittill(#"hash_7d77b8df9833a574");
		var_7e46a1cf = zm_ai_raz::spawn_single(1, undefined, n_round);
	}
	var_7e46a1cf.maxhealth = var_7e46a1cf namespace_e0710ee6::function_b5fe98(n_round);
	var_7e46a1cf.health = var_7e46a1cf.maxhealth;
}

/*
	Name: function_62b1d725
	Namespace: namespace_c4d353e7
	Checksum: 0xAD47560E
	Offset: 0x6088
	Size: 0xEC
	Parameters: 1
	Flags: None
*/
function function_62b1d725(s_loc)
{
	if(!isdefined(s_loc.script_noteworthy))
	{
		return false;
	}
	if(s_loc.script_noteworthy === "spawn_location")
	{
		return true;
	}
	a_str_tokens = strtok(s_loc.script_noteworthy, " ");
	foreach(str_token in a_str_tokens)
	{
		if(str_token == "custom_spawner_entry")
		{
			return true;
		}
	}
	return false;
}

/*
	Name: boss_cleanup_zombie
	Namespace: namespace_c4d353e7
	Checksum: 0xFF79F2CF
	Offset: 0x6180
	Size: 0x15E
	Parameters: 0
	Flags: None
*/
function boss_cleanup_zombie()
{
	level endon(#"intermission");
	a_ai_zombies = getaiarchetypearray(#"zombie", level.zombie_team);
	foreach(ai in a_ai_zombies)
	{
		if(!isalive(ai) || zm_utility::is_magic_bullet_shield_enabled(ai) || is_true(ai.var_69a981e6))
		{
			util::wait_network_frame();
			continue;
		}
		ai kill();
		ai hide();
		level.var_83c0592c--;
		return;
	}
}

/*
	Name: function_e4db583b
	Namespace: namespace_c4d353e7
	Checksum: 0xC976FF6B
	Offset: 0x62E8
	Size: 0x776
	Parameters: 4
	Flags: None
*/
function function_e4db583b(var_238eb6ec, var_bce45f4a, var_533ac894, var_cb579f71)
{
	if(!isdefined(var_bce45f4a))
	{
		var_bce45f4a = 0;
	}
	level endon(#"hash_38f29f9cb03586ea", #"hash_52f503364125cc1a", #"spawn_zombies", #"intermission");
	n_round = level.var_d6f059f7;
	var_12ce7e88 = 0;
	var_3a8c1407 = 0;
	var_35ee32e0 = [];
	switch(level.var_f3c4bd00)
	{
		case 1:
		{
			var_16d15044 = 3;
			var_12532e1c = 4.5;
			var_dda23e4b = 0.5;
			break;
		}
		case 2:
		{
			var_16d15044 = 2.5;
			var_12532e1c = 4;
			var_dda23e4b = 0.4;
			break;
		}
		case 3:
		{
			var_16d15044 = 2;
			var_12532e1c = 3.5;
			var_dda23e4b = 0.35;
			break;
		}
		case 4:
		{
			var_16d15044 = 1.5;
			var_12532e1c = 3;
			var_dda23e4b = 0.3;
			break;
		}
	}
	var_5dc704a7 = int(ceil(var_238eb6ec + (var_238eb6ec * var_dda23e4b)));
	var_1e8caeb1 = var_5dc704a7;
	n_max_active_ai = 19 + level.var_f3c4bd00;
	var_698258d8 = level.var_f3c4bd00 + 2;
	var_c40fb40b = undefined;
	if(!isarray(var_cb579f71))
	{
		s_zone = level.zones[#"hash_64d4cc9731a01d78"];
		var_cb579f71 = struct::get_array(s_zone.name + "_spawns");
		var_cb579f71 = arraycombine(var_cb579f71, struct::get_array(s_zone.name + "_spawner"), 0, 0);
		var_e6217dda = getarraykeys(s_zone.adjacent_zones);
		foreach(str_zone in var_e6217dda)
		{
			if(isdefined(s_zone.adjacent_zones[str_zone]) && s_zone.adjacent_zones[str_zone].is_connected)
			{
				var_cb579f71 = arraycombine(var_cb579f71, struct::get_array(str_zone + "_spawns"), 0, 0);
				var_cb579f71 = arraycombine(var_cb579f71, struct::get_array(str_zone + "_spawner"), 0, 0);
			}
		}
		if(isdefined(var_533ac894))
		{
			foreach(str_zone in var_533ac894)
			{
				var_cb579f71 = arraycombine(var_cb579f71, struct::get_array(str_zone + "_spawns"), 0, 0);
				var_cb579f71 = arraycombine(var_cb579f71, struct::get_array(str_zone + "_spawner"), 0, 0);
			}
		}
	}
	var_cb579f71 = array::filter(var_cb579f71, 0, &function_23fa277f);
	var_c92172f4 = 0;
	while(var_bce45f4a == 0 || var_12ce7e88 < var_bce45f4a)
	{
		if(level.var_9eaf1031 < var_1e8caeb1)
		{
			util::wait_network_frame(5);
			continue;
		}
		var_77bcb393 = 0;
		var_1e8caeb1 = var_1e8caeb1 + var_5dc704a7;
		while(level.var_2266b455 < var_698258d8)
		{
			level.var_2266b455++;
			while(!isdefined(var_c40fb40b))
			{
				level waittill(#"hash_66fc3c05e12b4225");
				var_c40fb40b = namespace_14c07d4f::spawn_single(array::random(var_cb579f71));
			}
			var_c40fb40b.maxhealth = var_c40fb40b namespace_e0710ee6::function_b5fe98(n_round);
			var_c40fb40b.health = var_c40fb40b.maxhealth;
			var_3a8c1407++;
			while(getaiteamarray(level.zombie_team).size >= n_max_active_ai)
			{
				util::wait_network_frame();
				level boss_cleanup_zombie();
			}
			if(isdefined(level.var_16d15044) && isdefined(level.var_12532e1c))
			{
				var_f36d4571 = level.var_16d15044;
				var_e7987a1 = level.var_12532e1c;
			}
			else
			{
				var_f36d4571 = var_16d15044;
				var_e7987a1 = var_12532e1c;
			}
			wait(randomfloatrange(var_f36d4571, var_e7987a1));
			var_c40fb40b = undefined;
			var_77bcb393++;
			level flag::wait_till(#"hash_3bdcbb902730e623");
		}
		if(var_bce45f4a > 0)
		{
			var_12ce7e88++;
			if(var_12ce7e88 >= var_bce45f4a)
			{
				break;
			}
		}
		level flag::wait_till(#"hash_3bdcbb902730e623");
		waitframe(1);
	}
}

/*
	Name: function_23fa277f
	Namespace: namespace_c4d353e7
	Checksum: 0x9FC025B3
	Offset: 0x6A68
	Size: 0x40
	Parameters: 1
	Flags: None
*/
function function_23fa277f(s_loc)
{
	if(!isdefined(s_loc.script_noteworthy))
	{
		return false;
	}
	if(s_loc.script_noteworthy === "mimic_location")
	{
		return true;
	}
	return false;
}

/*
	Name: function_c7f8bea5
	Namespace: namespace_c4d353e7
	Checksum: 0xCE333032
	Offset: 0x6AB0
	Size: 0x76E
	Parameters: 4
	Flags: None
*/
function function_c7f8bea5(var_238eb6ec, var_9919554c, var_533ac894, var_29173f01)
{
	if(!isdefined(var_9919554c))
	{
		var_9919554c = 0;
	}
	level endon(#"hash_38f29f9cb03586ea", #"hash_201d82405c5ec44f", #"spawn_zombies", #"intermission");
	n_round = level.var_d6f059f7;
	var_a6bf7be8 = 0;
	var_71fc7983 = 0;
	var_7ca5f4fb = [];
	switch(level.var_f3c4bd00)
	{
		case 1:
		{
			var_6c1ed07 = 3;
			var_23152eb5 = 4.5;
			var_dda23e4b = 0.5;
			break;
		}
		case 2:
		{
			var_6c1ed07 = 2.5;
			var_23152eb5 = 4;
			var_dda23e4b = 0.4;
			break;
		}
		case 3:
		{
			var_6c1ed07 = 2;
			var_23152eb5 = 3.5;
			var_dda23e4b = 0.35;
			break;
		}
		case 4:
		{
			var_6c1ed07 = 1.5;
			var_23152eb5 = 3;
			var_dda23e4b = 0.3;
			break;
		}
	}
	var_5dc704a7 = int(ceil(var_238eb6ec + (var_238eb6ec * var_dda23e4b)));
	var_1e8caeb1 = var_5dc704a7;
	n_max_active_ai = 19 + level.var_f3c4bd00;
	var_f9ded159 = level.var_f3c4bd00 + 2;
	var_7e46a1cf = undefined;
	if(!isarray(var_29173f01))
	{
		s_zone = level.zones[#"hash_64d4cc9731a01d78"];
		var_29173f01 = struct::get_array(s_zone.name + "_spawns");
		var_29173f01 = arraycombine(var_29173f01, struct::get_array(s_zone.name + "_spawner"), 0, 0);
		var_e6217dda = getarraykeys(s_zone.adjacent_zones);
		foreach(str_zone in var_e6217dda)
		{
			if(isdefined(s_zone.adjacent_zones[str_zone]) && s_zone.adjacent_zones[str_zone].is_connected)
			{
				var_29173f01 = arraycombine(var_29173f01, struct::get_array(str_zone + "_spawns"), 0, 0);
				var_29173f01 = arraycombine(var_29173f01, struct::get_array(str_zone + "_spawner"), 0, 0);
			}
		}
		if(isdefined(var_533ac894))
		{
			foreach(str_zone in var_533ac894)
			{
				var_862c57d0 = arraycombine(var_29173f01, struct::get_array(str_zone + "_spawns"), 0, 0);
				var_29173f01 = arraycombine(var_29173f01, struct::get_array(str_zone + "_spawner"), 0, 0);
			}
		}
	}
	var_29173f01 = array::filter(var_29173f01, 0, &function_8499733d);
	while(var_9919554c == 0 || var_a6bf7be8 < var_9919554c)
	{
		if(level.var_9eaf1031 < var_1e8caeb1)
		{
			util::wait_network_frame(5);
			continue;
		}
		var_c99b0541 = 0;
		var_1e8caeb1 = var_1e8caeb1 + var_5dc704a7;
		while(level.var_197697e8 < var_f9ded159)
		{
			level.var_197697e8++;
			while(!isdefined(var_7e46a1cf))
			{
				level waittill(#"hash_7d77b8df9833a574");
				var_7e46a1cf = zm_ai_raz::spawn_single(1, array::random(var_29173f01), n_round);
			}
			var_7e46a1cf.maxhealth = var_7e46a1cf namespace_e0710ee6::function_b5fe98(n_round);
			var_7e46a1cf.health = var_7e46a1cf.maxhealth;
			var_71fc7983++;
			while(getaiteamarray(level.zombie_team).size >= n_max_active_ai)
			{
				util::wait_network_frame();
				level boss_cleanup_zombie();
			}
			if(isdefined(level.var_6c1ed07) && isdefined(level.var_23152eb5))
			{
				var_f36d4571 = level.var_6c1ed07;
				var_e7987a1 = level.var_23152eb5;
			}
			else
			{
				var_f36d4571 = var_6c1ed07;
				var_e7987a1 = var_23152eb5;
			}
			wait(randomfloatrange(var_f36d4571, var_e7987a1));
			var_7e46a1cf = undefined;
			var_c99b0541++;
			level flag::wait_till(#"hash_3bdcbb902730e623");
		}
		if(var_9919554c > 0)
		{
			var_a6bf7be8++;
			if(var_a6bf7be8 >= var_9919554c)
			{
				break;
			}
		}
		level flag::wait_till(#"hash_3bdcbb902730e623");
		waitframe(1);
	}
}

/*
	Name: function_8499733d
	Namespace: namespace_c4d353e7
	Checksum: 0x967153B
	Offset: 0x7228
	Size: 0x40
	Parameters: 1
	Flags: None
*/
function function_8499733d(s_loc)
{
	if(!isdefined(s_loc.script_noteworthy))
	{
		return false;
	}
	if(s_loc.script_noteworthy === "raz_location")
	{
		return true;
	}
	return false;
}

/*
	Name: function_98198f98
	Namespace: namespace_c4d353e7
	Checksum: 0x687D9D69
	Offset: 0x7270
	Size: 0x12E
	Parameters: 1
	Flags: None
*/
function function_98198f98(str_archetype)
{
	level endon(#"intermission");
	util::delay_notify(600, #"hash_20ba9a0874996fda");
	while(true)
	{
		wait(0.5);
		b_wait = 0;
		a_ai = getaiarchetypearray(str_archetype);
		foreach(ai in a_ai)
		{
			if(isalive(ai))
			{
				b_wait = 1;
				break;
			}
		}
		if(!b_wait)
		{
			level notify(#"hash_3a4456148ade383a");
			return;
		}
	}
}

/*
	Name: function_2b6b4a44
	Namespace: namespace_c4d353e7
	Checksum: 0xB54A9578
	Offset: 0x73A8
	Size: 0x138
	Parameters: 0
	Flags: None
*/
function function_2b6b4a44()
{
	level endon(#"hash_38f29f9cb03586ea", #"spawn_zombies", #"intermission");
	while(true)
	{
		level notify(#"hash_6986218d09dc1cb2");
		util::wait_network_frame();
		level function_e2f134ce();
		if(level.var_41afa8f >= 2)
		{
			level notify(#"hash_66fc3c05e12b4225");
			util::wait_network_frame();
			level function_e2f134ce();
		}
		if(level.var_41afa8f == 3)
		{
			level notify(#"hash_7d77b8df9833a574");
			util::wait_network_frame();
			level function_e2f134ce();
		}
	}
}

/*
	Name: function_e2f134ce
	Namespace: namespace_c4d353e7
	Checksum: 0xED0D26E9
	Offset: 0x74E8
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_e2f134ce()
{
	level flag::wait_till_clear(#"hash_21921ed511559aa3");
}

/*
	Name: function_37597f29
	Namespace: namespace_c4d353e7
	Checksum: 0xD6500302
	Offset: 0x7518
	Size: 0xD4
	Parameters: 0
	Flags: None
*/
function function_37597f29()
{
	/#
		util::function_345e5b9a("");
		util::function_345e5b9a("");
		util::function_345e5b9a("");
		util::function_345e5b9a("");
		util::function_345e5b9a("");
		util::function_345e5b9a("");
		util::function_345e5b9a("");
		zm_devgui::add_custom_devgui_callback(&cmd);
	#/
}

/*
	Name: cmd
	Namespace: namespace_c4d353e7
	Checksum: 0xF3F6E91F
	Offset: 0x75F8
	Size: 0x14A
	Parameters: 1
	Flags: None
*/
function cmd(cmd)
{
	/#
		switch(cmd)
		{
			case "hash_213591a3df24967d":
			{
				level.var_cc4817d7 = "";
				break;
			}
			case "hash_7b914ebf5b57c696":
			{
				level.var_cc4817d7 = "";
				break;
			}
			case "hash_f72e94a26490fd7":
			{
				level.var_cc4817d7 = "";
				break;
			}
			case "hash_12274633230d3eb4":
			{
				level.var_cc4817d7 = "";
				break;
			}
			case "hash_5de2ff5967070ea8":
			{
				level.var_cc4817d7 = "";
				break;
			}
			case "hash_6ee66ab56d6217f6":
			{
				level.var_cc4817d7 = undefined;
				break;
			}
			case "hash_264ec163f16c435b":
			{
				level notify(#"hash_38f29f9cb03586ea");
				level notify(#"hash_3807e7b1086e4aa0");
				break;
			}
			default:
			{
				break;
			}
		}
	#/
}

