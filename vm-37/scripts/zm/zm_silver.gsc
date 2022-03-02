#using script_14f4a3c583c77d4b;
#using script_3411bb48d41bd3b;
#using script_3b5e488c4d278da3;
#using script_3cebb48c37fc271;
#using script_3cf7932e9702e270;
#using script_3e57cc1a9084fdd6;
#using script_432a18be09b697bd;
#using script_4ce5d94e8c797350;
#using script_4cf51a28ef39b750;
#using script_4d1e366b77f0b4b;
#using script_5882f53c3e1f693f;
#using script_58c342edd81589fb;
#using script_72596c919cdba3f7;
#using script_7b1cd3908a825fdd;
#using script_ab862743b3070a;
#using script_ab890501c40b73c;
#using script_b9d273dc917ee1f;
#using script_c08f3519167b630;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\compass.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\load_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\scriptmodels_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm\zm_silver_main_quest.gsc;
#using scripts\zm\zm_silver_pap_quest.gsc;
#using scripts\zm\zm_silver_sound.gsc;
#using scripts\zm\zm_silver_util.gsc;
#using scripts\zm\zm_silver_ww_quest.gsc;
#using scripts\zm\zm_silver_zones.gsc;
#using scripts\zm_common\callbacks.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm_devgui.gsc;
#using scripts\zm_common\zm_magicbox.gsc;
#using scripts\zm_common\zm_perks.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;

#namespace namespace_ee0fc845;

/*
	Name: opt_in
	Namespace: namespace_ee0fc845
	Checksum: 0xD48A270
	Offset: 0x910
	Size: 0x1DC
	Parameters: 0
	Flags: AutoExec
*/
function autoexec opt_in()
{
	level.aat_in_use = 1;
	level.random_pandora_box_start = 1;
	level.var_5470be1c = 1;
	level.var_e2f95698 = #"hash_20902988a95a6003";
	level.var_462ca9bb = #"blops_taacom";
	level.var_8bb7479c = #"hash_10124966022c3040";
	level.var_72a3d8bc = #"hash_7c308e44e34e652b";
	level.var_6e297a0d = &function_4b29f610;
	level.var_cd3d6a27 = &function_65c65feb;
	namespace_4abf1500::function_88645994(#"hash_1650c04a5db4ba64", #"hash_69f1546764fcc948", #"hash_44becc3958fa81a2", #"hash_549a6693186d47cc", #"hash_3c7bf14c75b291f9", #"hash_4eadf87f04308190", #"hash_7676acc36353a1ae", #"hash_14226a503acda919", #"hash_54455979b64faab");
	setdvar(#"player_shallowwaterwadescale", 1);
	setdvar(#"player_waistwaterwadescale", 1);
	setdvar(#"hash_70d60913dea5aadd", 1);
}

/*
	Name: main
	Namespace: namespace_ee0fc845
	Checksum: 0x42642701
	Offset: 0xAF8
	Size: 0x9A4
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	setclearanceceiling(29);
	level.var_dfee7fc2 = #"hash_1c6b6adda3e5f98";
	scene::function_497689f6(#"hash_1c6b6adda3e5f98", "helicopter", "tag_probe_attach", "prb_tn_zm_silver_heli_light_cabin");
	level thread function_a6101b7();
	zm::init_fx();
	zm_perks::function_9760a58b(#"hash_7f98b3dd3cce95aa");
	zm_perks::function_9760a58b(#"hash_47d7a8105237c88");
	zm_perks::function_9760a58b(#"hash_602a1b6107105f07");
	level.var_7f72eddd = "default_zombies_silver";
	level.var_dafeed10 = "exfil_silver_";
	level.var_26ed6a07 = 600;
	level.var_c86f12d4 = 200;
	level.var_aaf7505f = 90;
	level.var_baed3b8e = 1750;
	level.var_ac94c2b8 = 2;
	clientfield::function_a8bbc967("player_lives", 1, 2, "int");
	clientfield::register("world", "" + #"hash_5e38b0496d9664bb", 1, 3, "int");
	clientfield::register("world", "" + #"hash_2690e69916d071d9", 1, 1, "int");
	clientfield::register("toplayer", "" + #"hash_464e0cd19b3b8c12", 1, 1, "int");
	clientfield::register("toplayer", "" + #"hash_4be33f9c734f0cb9", 1, 2, "int");
	clientfield::register("toplayer", "" + #"hash_6696d96a08b9701d", 1, 1, "counter");
	clientfield::register("toplayer", "" + #"hash_7a769c728c89b6b5", 1, 1, "counter");
	clientfield::register("toplayer", "" + #"hash_20d620050345e82", 6000, 1, "int");
	level.default_start_location = "zone_proto_start";
	level.default_game_mode = "zclassic";
	level._allow_melee_weapon_switching = 1;
	level.zombiemode_reusing_pack_a_punch = 1;
	level.custom_spawner_entry[#"crawl"] = &zm_spawner::function_45bb11e4;
	level.var_d0ab70a2 = #"hash_5e105c88ae5d540f";
	level.var_5fe8eeaa = gettime();
	level thread function_a58c1ef7();
	load::main();
	compass::setupminimap("");
	clientfield::set("" + #"hash_2690e69916d071d9", 1);
	namespace_812a8849::init();
	namespace_c8c67699::init();
	namespace_d769652e::init();
	namespace_9f845210::init();
	namespace_45690bb8::init();
	namespace_2b924e50::init();
	namespace_f172695e::init();
	namespace_c3c0ef6f::init();
	level._effect[#"large_ceiling_dust"] = #"hash_32cd6b127f58a7bf";
	level._effect[#"hash_10dedae3d37c056f"] = #"hash_28bb64d8996beecf";
	level._effect[#"hash_10dedbe3d37c0722"] = #"hash_4065776f701ae199";
	level._effect[#"hash_10dedce3d37c08d5"] = #"hash_310a2d10fb7f56d9";
	level._effect[#"hash_10ded5e3d37bfcf0"] = #"hash_2fb218362f315f96";
	level._effect[#"hash_10ded6e3d37bfea3"] = #"hash_11eb24ae473a4d69";
	level.zones = [];
	level.zone_manager_init_func = &namespace_51925ebc::zone_init;
	level thread zm_zonemgr::manage_zones("zone_proto_start");
	level.var_aea7dde1 = &namespace_51925ebc::function_a74dcd0a;
	level.var_64c67df3 = &namespace_51925ebc::function_64c67df3;
	level.var_fbbd95cc = &namespace_d769652e::function_5080c483;
	level.var_92c52eed = 1;
	level thread function_963beb87();
	level thread sndfunctions();
	level thread zm_perks::spare_change();
	level thread function_3ada378c();
	level thread function_360fb84d();
	level thread function_a6308ec9();
	level thread function_e4e257b6();
	level thread function_7cdd91fd();
	level thread function_b935b15c();
	level thread function_7a15a086();
	level thread function_85bd89cb();
	level callback::function_74872db6(&function_74872db6);
	level callback::function_189f87c1(&function_189f87c1);
	level thread function_26ecdeeb();
	level.var_bb6bf2e0 = 1;
	namespace_591b4396::function_fa5bd408(array("zone_proto_exterior_rear2", "zone_proto_exterior_rear"));
	level.var_24a62388 = &function_77dff008;
	/#
		execdevgui("");
		level thread function_ec9000ea();
	#/
	setdvar(#"hash_7b06b8037c26b99b", 72);
	level thread clientfield::set("" + #"hash_5e38b0496d9664bb", 5);
	setdvar(#"hkai_pathfinditerationlimit", 1050);
	level.missileremotelaunchvert = 9000;
	level.missileremotelaunchhorz = 4000;
	level.var_eb6a7fa3 = vectorscale((0, 1, 0), 90);
	level.var_2743a7e2 = level.mapcenter + vectorscale((0, 1, 0), 500);
	callback::add_callback(#"hash_41e282f5ec98e877", &function_44ed971);
	zm_utility::function_89dbd679((484, 13, -516), 70, 50, (540.786, -3.57566, -544.107), 128);
}

/*
	Name: function_44ed971
	Namespace: namespace_ee0fc845
	Checksum: 0x1CD33EE3
	Offset: 0x14A8
	Size: 0xB0
	Parameters: 0
	Flags: Linked
*/
function function_44ed971()
{
	foreach(player in getplayers())
	{
		player clientfield::set_to_player("" + #"hash_20d620050345e82", 1);
	}
}

/*
	Name: function_26ecdeeb
	Namespace: namespace_ee0fc845
	Checksum: 0x1149E338
	Offset: 0x1560
	Size: 0x84
	Parameters: 0
	Flags: Linked
*/
function function_26ecdeeb()
{
	count = 0;
	while(true)
	{
		wait(randomfloatrange(5, 35));
		if(gettimescale() > 1.1)
		{
			count++;
			if(count >= 5)
			{
				function_17cf7de1(1);
				return;
			}
		}
		else
		{
			count = 0;
		}
	}
}

/*
	Name: function_963beb87
	Namespace: namespace_ee0fc845
	Checksum: 0xEF972204
	Offset: 0x15F0
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function function_963beb87()
{
	zm_magicbox::function_fcbfc7e9(#"hash_315d03848e9c8533", #"hash_79d7d5e206eaf770", &function_c260f7a1);
}

/*
	Name: function_4b29f610
	Namespace: namespace_ee0fc845
	Checksum: 0xB1884D5
	Offset: 0x1640
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function function_4b29f610()
{
	array::thread_all(level.chests, &zm_magicbox::hide_chest);
}

/*
	Name: function_77dff008
	Namespace: namespace_ee0fc845
	Checksum: 0x80B68CDD
	Offset: 0x1678
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_77dff008()
{
	self contracts::function_5b88297d(#"hash_52d7aad059ba306a");
}

/*
	Name: function_c260f7a1
	Namespace: namespace_ee0fc845
	Checksum: 0x1C38C2AA
	Offset: 0x16A8
	Size: 0x3CC
	Parameters: 1
	Flags: Linked
*/
function function_c260f7a1(var_e9ea5e13)
{
	var_a02789e0 = getweapon(#"hash_655d944e437c3d5b");
	var_f934814c = getweapon(#"hash_5dd5741f21fd680d");
	var_fb0c0b60 = getweapon(#"hash_6e0b27b854e591a3");
	var_95254da2 = getweapon(#"hash_72796957033e2e4a");
	var_7de2a5d9 = getweapon(#"hash_3fa91d1674123e09");
	if(isplayer(var_e9ea5e13))
	{
		if(var_e9ea5e13 hasweapon(var_a02789e0) || var_e9ea5e13 hasweapon(var_f934814c) || var_e9ea5e13 hasweapon(var_fb0c0b60) || var_e9ea5e13 hasweapon(var_95254da2) || var_e9ea5e13 hasweapon(var_7de2a5d9))
		{
			return false;
		}
	}
	var_b6a0e846 = 0;
	foreach(item in level.var_18dc9d17)
	{
		if(item.var_a6762160.weapon === var_a02789e0 || item.var_a6762160.weapon === var_f934814c || item.var_a6762160.weapon === var_fb0c0b60 || item.var_a6762160.weapon === var_95254da2 || item.var_a6762160.weapon === var_7de2a5d9)
		{
			var_b6a0e846++;
		}
	}
	foreach(player in getplayers())
	{
		if(player hasweapon(var_a02789e0) || player hasweapon(var_f934814c) || player hasweapon(var_fb0c0b60) || player hasweapon(var_95254da2) || player hasweapon(var_7de2a5d9))
		{
			var_b6a0e846++;
		}
	}
	if(var_b6a0e846 >= 4)
	{
		return false;
	}
	if(level.chest_moves >= 1)
	{
		return true;
	}
	return false;
}

/*
	Name: function_a58c1ef7
	Namespace: namespace_ee0fc845
	Checksum: 0x6CB20648
	Offset: 0x1A80
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function function_a58c1ef7()
{
	level.use_multiple_spawns = 1;
	level.spawner_int = 1;
	level.fn_custom_zombie_spawner_selection = &function_ddc13fd6;
}

/*
	Name: function_ddc13fd6
	Namespace: namespace_ee0fc845
	Checksum: 0x5606B03A
	Offset: 0x1AC8
	Size: 0x30C
	Parameters: 0
	Flags: Linked
*/
function function_ddc13fd6()
{
	a_s_spots = level.zm_loc_types[#"zombie_location"];
	/#
		if(getdvarint(#"scr_zombie_spawn_in_view", 0))
		{
			player = getplayers()[0];
			a_s_spots = zm_spawner::function_3f416d76(player, a_s_spots);
		}
	#/
	s_spot = array::random(a_s_spots);
	var_bf65599c = (isdefined(s_spot.script_int) ? s_spot.script_int : 1);
	var_3a615dd8 = [];
	var_7f5d141a = [];
	foreach(sp_zombie in level.zombie_spawners)
	{
		if(is_true(sp_zombie.var_5d6331b7))
		{
			if(!isdefined(var_7f5d141a))
			{
				var_7f5d141a = [];
			}
			else if(!isarray(var_7f5d141a))
			{
				var_7f5d141a = array(var_7f5d141a);
			}
			var_7f5d141a[var_7f5d141a.size] = sp_zombie;
			continue;
		}
		if(isdefined(sp_zombie.script_int) && sp_zombie.script_int == var_bf65599c)
		{
			if(!isdefined(var_3a615dd8))
			{
				var_3a615dd8 = [];
			}
			else if(!isarray(var_3a615dd8))
			{
				var_3a615dd8 = array(var_3a615dd8);
			}
			var_3a615dd8[var_3a615dd8.size] = sp_zombie;
		}
	}
	if(level.round_number >= 20 && var_7f5d141a.size > 0)
	{
		return (randomintrange(0, 100) < 5 ? array::random(var_7f5d141a) : (var_3a615dd8.size > 0 ? array::random(var_3a615dd8) : level.zombie_spawners[0]));
	}
	return (var_3a615dd8.size > 0 ? array::random(var_3a615dd8) : level.zombie_spawners[0]);
}

/*
	Name: offhand_weapon_overrride
	Namespace: namespace_ee0fc845
	Checksum: 0x43F06429
	Offset: 0x1DE0
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
	Namespace: namespace_ee0fc845
	Checksum: 0x9ABCED49
	Offset: 0x1E18
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
	Name: sndfunctions
	Namespace: namespace_ee0fc845
	Checksum: 0xB27FB35C
	Offset: 0x1EE8
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
	Namespace: namespace_ee0fc845
	Checksum: 0x3CEA01FC
	Offset: 0x1F48
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
	Namespace: namespace_ee0fc845
	Checksum: 0x31148F80
	Offset: 0x2318
	Size: 0x1DC
	Parameters: 0
	Flags: Linked
*/
function setupmusic()
{
	zm_audio::musicstate_create("round_start_first", 3, "round_start_first");
	zm_audio::musicstate_create("round_start_first_winter", 3, "intro_winter_00", "intro_winter_01");
	zm_audio::musicstate_create("round_start", 3, "round_start_00", "round_start_01", "round_start_02");
	zm_audio::musicstate_create("round_start_winter", 3, "round_start_winter_00", "round_start_winter_01", "round_start_winter_02");
	zm_audio::musicstate_create("round_end", 3, "round_end_00", "round_end_01", "round_end_02");
	zm_audio::musicstate_create("round_end_winter", 3, "round_end_winter_00", "round_end_winter_01", "round_end_winter_02");
	zm_audio::musicstate_create("round_start_special", 3, "round_start_special_00");
	zm_audio::musicstate_create("round_end_special", 3, "round_end_special_00");
	zm_audio::musicstate_create("ee_song", 4, "silver_egg");
	zm_audio::musicstate_create("game_over", 5, "gameover_silver");
}

/*
	Name: function_65c65feb
	Namespace: namespace_ee0fc845
	Checksum: 0x646B0767
	Offset: 0x2500
	Size: 0x178
	Parameters: 1
	Flags: Linked
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
	Name: function_cd3a65e0
	Namespace: namespace_ee0fc845
	Checksum: 0x49A1F4B0
	Offset: 0x2680
	Size: 0x13A
	Parameters: 0
	Flags: Linked
*/
function function_cd3a65e0()
{
	switch(level.dog_round_count)
	{
		case 2:
		{
			level.next_dog_round = level.round_number + function_21a3a673(5, 7);
			break;
		}
		case 3:
		{
			level.next_dog_round = level.round_number + function_21a3a673(6, 8);
			break;
		}
		case 4:
		{
			level.next_dog_round = level.round_number + function_21a3a673(7, 9);
			break;
		}
		default:
		{
			level.next_dog_round = level.round_number + function_21a3a673(8, 10);
			break;
		}
	}
}

/*
	Name: function_360fb84d
	Namespace: namespace_ee0fc845
	Checksum: 0x62415430
	Offset: 0x27C8
	Size: 0x180
	Parameters: 0
	Flags: Linked, Private
*/
function private function_360fb84d()
{
	level endon(#"end_game");
	var_d1ae80e1 = undefined;
	while(true)
	{
		var_be17187b = undefined;
		var_be17187b = level waittill(#"start_of_round", #"pap_quest_completed");
		n_players = zm_utility::function_a2541519(getplayers().size);
		if(!namespace_c3287616::function_fab464c4(level.round_number) && (n_players == 1 && level.round_number >= 15 || (n_players > 1 && level.round_number >= 13) || (isdefined(var_d1ae80e1) && level.round_number >= var_d1ae80e1)))
		{
			function_a95110c(level.round_number);
			return;
		}
		if(level flag::get("pap_quest_completed") && !isdefined(var_d1ae80e1))
		{
			var_d1ae80e1 = level.round_number + 2;
		}
	}
}

/*
	Name: function_a95110c
	Namespace: namespace_ee0fc845
	Checksum: 0xF2A5B70A
	Offset: 0x2950
	Size: 0x7C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_a95110c(n_round)
{
	level.var_ad49daf9 = n_round;
	namespace_c3287616::function_cc103b38(#"hash_7c0d83ac1e845ac2", level.var_ad49daf9);
	level.var_2a8acd42 = &function_55b0a71e;
	level flag::set(#"hash_6d4b62fdfe880888");
}

/*
	Name: function_87f4bdb0
	Namespace: namespace_ee0fc845
	Checksum: 0xABE787D2
	Offset: 0x29D8
	Size: 0x7A
	Parameters: 0
	Flags: None
*/
function function_87f4bdb0()
{
	if(isdefined(level.zm_loc_types[#"dog_location"]) && level.zm_loc_types[#"dog_location"].size)
	{
		s_spawn_loc = array::random(level.zm_loc_types[#"dog_location"]);
	}
	return s_spawn_loc;
}

/*
	Name: function_55b0a71e
	Namespace: namespace_ee0fc845
	Checksum: 0xC809DD23
	Offset: 0x2A60
	Size: 0xBA
	Parameters: 1
	Flags: Linked
*/
function function_55b0a71e(get_all)
{
	if(!isdefined(get_all))
	{
		get_all = 0;
	}
	if(isdefined(level.zm_loc_types[#"steiner_location"]) && level.zm_loc_types[#"steiner_location"].size)
	{
		if(get_all)
		{
			s_spawn_loc = level.zm_loc_types[#"steiner_location"];
		}
		else
		{
			s_spawn_loc = array::random(level.zm_loc_types[#"steiner_location"]);
		}
	}
	return s_spawn_loc;
}

/*
	Name: function_74872db6
	Namespace: namespace_ee0fc845
	Checksum: 0x80F724D1
	Offset: 0x2B28
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function function_74872db6()
{
}

/*
	Name: function_189f87c1
	Namespace: namespace_ee0fc845
	Checksum: 0x80F724D1
	Offset: 0x2B38
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function function_189f87c1()
{
}

/*
	Name: function_ccf0175a
	Namespace: namespace_ee0fc845
	Checksum: 0x13F3C790
	Offset: 0x2B48
	Size: 0x90
	Parameters: 0
	Flags: None
*/
function function_ccf0175a()
{
	level endon(#"hash_3ff04dee69f9fe00");
	while(gettime() >= level.var_5fe8eeaa)
	{
		if(level.var_95198344.size < function_7040caed())
		{
			namespace_ce8a59be::function_6b39d9c5(1);
			function_93abe410();
		}
		else
		{
			function_93abe410();
		}
	}
}

/*
	Name: function_93abe410
	Namespace: namespace_ee0fc845
	Checksum: 0x606FEDF6
	Offset: 0x2BE0
	Size: 0x42
	Parameters: 0
	Flags: Linked
*/
function function_93abe410()
{
	var_bcb1a003 = function_1401e135();
	level.var_5fe8eeaa = level.var_5fe8eeaa + (var_bcb1a003 * 1000);
	wait(var_bcb1a003);
}

/*
	Name: function_1401e135
	Namespace: namespace_ee0fc845
	Checksum: 0xDB8947B9
	Offset: 0x2C30
	Size: 0x1D2
	Parameters: 0
	Flags: Linked
*/
function function_1401e135()
{
	switch(level.round_number)
	{
		case 1:
		case 2:
		case 3:
		case 4:
		case 5:
		case 6:
		case 7:
		case 8:
		case 9:
		case 10:
		case 11:
		case 12:
		{
			return randomintrange(70, 90);
		}
		case 13:
		case 14:
		case 15:
		case 16:
		case 17:
		{
			return randomintrange(40, 60);
		}
		case 18:
		case 19:
		case 20:
		{
			return randomintrange(35, 45);
		}
		default:
		{
			return randomintrange(35, 45);
		}
	}
}

/*
	Name: function_7040caed
	Namespace: namespace_ee0fc845
	Checksum: 0xEF4CB5F5
	Offset: 0x2E10
	Size: 0x1B2
	Parameters: 0
	Flags: Linked
*/
function function_7040caed()
{
	if(!level flag::get("power_on"))
	{
		return -1;
	}
	switch(level.round_number)
	{
		case 1:
		case 2:
		case 3:
		case 4:
		case 5:
		case 6:
		case 7:
		case 8:
		case 9:
		case 10:
		case 11:
		case 12:
		{
			return 4;
		}
		case 13:
		case 14:
		case 15:
		case 16:
		case 17:
		{
			return 6;
		}
		case 18:
		case 19:
		case 20:
		{
			return 8;
		}
		default:
		{
			return 8;
		}
	}
}

/*
	Name: function_3ada378c
	Namespace: namespace_ee0fc845
	Checksum: 0xDCE9CA44
	Offset: 0x2FD0
	Size: 0xB4
	Parameters: 0
	Flags: Linked
*/
function function_3ada378c()
{
	level flag::wait_till("power_on");
	level.var_3161430e = level.round_number;
	level.var_539f36cd = &function_cd3a65e0;
	level.dog_round_track_override = &dog_round_tracker;
	namespace_c402654::function_aec3446d(0);
	level flag::wait_till(#"hash_3b2ee17e5ce02f9e");
	namespace_c3287616::function_d36196b1(level.next_dog_round);
}

/*
	Name: dog_round_tracker
	Namespace: namespace_ee0fc845
	Checksum: 0x82C072E6
	Offset: 0x3090
	Size: 0x184
	Parameters: 1
	Flags: Linked
*/
function dog_round_tracker(var_634c65f0)
{
	level.dog_round_count = 1;
	level.next_dog_round = (level.round_number <= 5 ? 6 : level.round_number + 1);
	namespace_c3287616::function_376e51ef(#"zombie_dog", int(max(12, level.next_dog_round + 1)));
	namespace_c3287616::function_b4a8f95a(#"zombie_dog", level.next_dog_round, &namespace_c402654::dog_round_start, &namespace_c402654::dog_round_stop, &namespace_c402654::function_dd162858, &waiting_for_next_dog_spawn, level.var_dc50acfa);
	spawner::function_89a2cd87(#"zombie_dog", &namespace_85745671::function_2089690e);
	namespace_c3287616::function_df803678(&namespace_c402654::function_ed67c5e7);
	/#
		level thread namespace_c402654::function_de0a6ae4();
	#/
}

/*
	Name: function_be03ceef
	Namespace: namespace_ee0fc845
	Checksum: 0x5095F1B
	Offset: 0x3220
	Size: 0x50
	Parameters: 1
	Flags: Linked
*/
function function_be03ceef(time)
{
	level.var_61a89694 = time;
	while(level.var_61a89694 > 0)
	{
		wait(1);
		level.var_61a89694 = level.var_61a89694 - 1;
	}
}

/*
	Name: function_e4e257b6
	Namespace: namespace_ee0fc845
	Checksum: 0x8391113F
	Offset: 0x3278
	Size: 0x76
	Parameters: 0
	Flags: Linked
*/
function function_e4e257b6()
{
	level endon(#"end_game");
	level thread function_706bc947();
	while(true)
	{
		level waittill(#"dog_round");
		function_7bb4a5d7("dog_round");
		wait(1);
	}
}

/*
	Name: function_b935b15c
	Namespace: namespace_ee0fc845
	Checksum: 0x7DA47F52
	Offset: 0x32F8
	Size: 0x104
	Parameters: 0
	Flags: Linked
*/
function function_b935b15c()
{
	level endon(#"end_game");
	level waittill(#"hash_795783e3edb7670");
	if(level clientfield::get("dog_round_fog_bank"))
	{
		level thread clientfield::set("dog_round_fog_bank", 0);
	}
	if(level flag::get(#"snowfall_fade_in") || level flag::get(#"snowfall_loop"))
	{
		function_7bb4a5d7("snowfall_fade_out");
		function_be03ceef(30);
		function_7bb4a5d7("snowfall_clear");
	}
}

/*
	Name: function_7cdd91fd
	Namespace: namespace_ee0fc845
	Checksum: 0xD8D89655
	Offset: 0x3408
	Size: 0x234
	Parameters: 0
	Flags: Linked
*/
function function_7cdd91fd()
{
	level endon(#"end_game");
	level flag::wait_till(#"dark_aether_active");
	level flag::wait_till_clear(#"dark_aether_active");
	level notify(#"hash_245ff34dcc7bfe66");
	level flag::clear(#"snowfall_fade_in");
	level flag::clear(#"hash_2751dc07d8287c1");
	level flag::clear(#"snowfall_fade_out");
	if(!level flag::get("dog_round"))
	{
		level thread clientfield::set("" + #"hash_5e38b0496d9664bb", 3);
		level flag::set(#"snowfall_loop");
		exploder::stop_exploder("fxexp_snow_blizzard_fade_in");
		exploder::exploder("fxexp_snow_blizzard_loop");
		setdvar(#"hash_7b06b8037c26b99b", 195);
	}
	function_be03ceef(randomintrange(100, 120));
	function_7bb4a5d7("snowfall_fade_out");
	function_be03ceef(30);
	function_7bb4a5d7("snowfall_clear");
	level thread function_a6308ec9();
}

/*
	Name: function_a6308ec9
	Namespace: namespace_ee0fc845
	Checksum: 0x80B8F361
	Offset: 0x3648
	Size: 0x130
	Parameters: 0
	Flags: Linked
*/
function function_a6308ec9()
{
	level endon(#"end_game", #"hash_245ff34dcc7bfe66", #"hash_795783e3edb7670");
	while(true)
	{
		function_be03ceef(randomintrange(1200, 1500));
		function_7bb4a5d7("snowfall_fade_in");
		function_be03ceef(30);
		function_7bb4a5d7("snowfall_loop");
		function_be03ceef(randomintrange(100, 120));
		function_7bb4a5d7("snowfall_fade_out");
		function_be03ceef(30);
		function_7bb4a5d7("snowfall_clear");
	}
}

/*
	Name: function_7bb4a5d7
	Namespace: namespace_ee0fc845
	Checksum: 0x7B027B5F
	Offset: 0x3780
	Size: 0x472
	Parameters: 1
	Flags: Linked
*/
function function_7bb4a5d7(state)
{
	switch(state)
	{
		case "snowfall_fade_in":
		{
			if(!level flag::get("dog_round"))
			{
				level flag::set(#"snowfall_fade_in");
				level thread clientfield::set("" + #"hash_5e38b0496d9664bb", 1);
				exploder::exploder("fxexp_snow_blizzard_fade_in");
				exploder::stop_exploder("fxexp_snow_blizzard_loop");
				setdvar(#"hash_7b06b8037c26b99b", 195);
			}
			break;
		}
		case "snowfall_loop":
		{
			if(!level flag::get("dog_round") && level flag::get(#"snowfall_fade_in"))
			{
				level flag::clear(#"snowfall_fade_in");
				level flag::set(#"snowfall_loop");
				exploder::stop_exploder("fxexp_snow_blizzard_fade_in");
				exploder::exploder("fxexp_snow_blizzard_loop");
			}
			break;
		}
		case "snowfall_fade_out":
		{
			if(!level flag::get("dog_round") && level flag::get(#"snowfall_loop"))
			{
				level flag::clear(#"snowfall_loop");
				level flag::set(#"snowfall_fade_out");
				level thread clientfield::set("" + #"hash_5e38b0496d9664bb", 0);
				exploder::stop_exploder("fxexp_snow_blizzard_fade_in");
				exploder::stop_exploder("fxexp_snow_blizzard_loop");
				setdvar(#"hash_7b06b8037c26b99b", 72);
			}
			break;
		}
		case "snowfall_clear":
		{
			if(level flag::get(#"snowfall_fade_out"))
			{
				level flag::clear(#"snowfall_fade_in");
				level flag::clear(#"hash_2751dc07d8287c1");
				level flag::clear(#"snowfall_fade_out");
			}
			break;
		}
		case "dog_round":
		{
			level flag::clear(#"snowfall_fade_in");
			level flag::clear(#"snowfall_loop");
			level flag::clear(#"snowfall_fade_out");
			level thread clientfield::set("" + #"hash_5e38b0496d9664bb", 2);
			exploder::stop_exploder("fxexp_snow_blizzard_fade_in");
			exploder::stop_exploder("fxexp_snow_blizzard_loop");
			break;
		}
	}
}

/*
	Name: function_706bc947
	Namespace: namespace_ee0fc845
	Checksum: 0x978F5214
	Offset: 0x3C00
	Size: 0xB0
	Parameters: 0
	Flags: Linked
*/
function function_706bc947()
{
	level endon(#"end_game");
	while(true)
	{
		level flag::wait_till("dog_round");
		setdvar(#"hash_7b06b8037c26b99b", 220);
		level flag::wait_till_clear("dog_round");
		wait(9);
		setdvar(#"hash_7b06b8037c26b99b", 72);
	}
}

/*
	Name: function_7a15a086
	Namespace: namespace_ee0fc845
	Checksum: 0xE1AE1FBC
	Offset: 0x3CB8
	Size: 0x1B2
	Parameters: 0
	Flags: Linked
*/
function function_7a15a086()
{
	var_b6596672 = getentarray("earthquake_area", "tag");
	while(true)
	{
		if(level flag::get("power_on"))
		{
			a_players = getplayers();
			foreach(player in a_players)
			{
				foreach(vol in var_b6596672)
				{
					if(isalive(player) && player istouching(vol))
					{
						player function_bc82f900(#"particle_accelerator_rumble");
						break;
					}
				}
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_85bd89cb
	Namespace: namespace_ee0fc845
	Checksum: 0x75B2FF7E
	Offset: 0x3E78
	Size: 0xCC
	Parameters: 0
	Flags: Linked
*/
function function_85bd89cb()
{
	level endon(#"end_game");
	level flag::wait_till("start_zombie_round_logic");
	toy_horse_trigger = getent("toy_horse_trigger", "targetname");
	level thread scene::init(#"hash_4054de8e8701c4d");
	toy_horse_trigger waittill(#"trigger");
	level thread scene::play(#"hash_4054de8e8701c4d");
	toy_horse_trigger delete();
}

/*
	Name: waiting_for_next_dog_spawn
	Namespace: namespace_ee0fc845
	Checksum: 0xFF1FEC96
	Offset: 0x3F50
	Size: 0xE4
	Parameters: 2
	Flags: Linked
*/
function waiting_for_next_dog_spawn(count, max)
{
	default_wait = 2.75;
	if(level.dog_round_count == 1)
	{
		default_wait = 4;
	}
	else
	{
		if(level.dog_round_count == 2)
		{
			default_wait = 3.5;
		}
		else if(level.dog_round_count == 3)
		{
			default_wait = 3;
		}
	}
	if(isdefined(count) && isdefined(max))
	{
		wait(max(default_wait - (count / max), 0.05));
	}
	else
	{
		wait(max(default_wait - 0.5, 0.05));
	}
}

/*
	Name: function_a6101b7
	Namespace: namespace_ee0fc845
	Checksum: 0xF05B30B8
	Offset: 0x4040
	Size: 0xD4
	Parameters: 0
	Flags: Linked
*/
function function_a6101b7()
{
	if(util::function_5df4294() == #"zclassic" || (!is_true(getgametypesetting(#"hash_7e8e34cc69a77e0b")) && getdvarint(#"hash_40bd34b35079cf2e", 0) === 0))
	{
		hidemiscmodels("xmas_decorations");
		array::delete_all(getentarray("xmas_decorations", "targetname"));
	}
}

/*
	Name: function_ec9000ea
	Namespace: namespace_ee0fc845
	Checksum: 0x3D502DDD
	Offset: 0x4120
	Size: 0x44
	Parameters: 0
	Flags: Private
*/
function private function_ec9000ea()
{
	/#
		level flag::wait_till("");
		zm_devgui::add_custom_devgui_callback(&function_3ab942cb);
	#/
}

/*
	Name: function_3ab942cb
	Namespace: namespace_ee0fc845
	Checksum: 0x9F124138
	Offset: 0x4170
	Size: 0x5A
	Parameters: 1
	Flags: Private
*/
function private function_3ab942cb(cmd)
{
	/#
		switch(cmd)
		{
			case "hash_fc3b784a3c0b31d":
			{
				level.var_61a89694 = 1;
				break;
			}
			default:
			{
				break;
			}
		}
	#/
}

