#using script_1029986e2bc8ca8e;
#using script_14f4a3c583c77d4b;
#using script_18077945bb84ede7;
#using script_1a26712868b71ff6;
#using script_1bb327fbdb3a211b;
#using script_1c65dbfc2f1c8d8f;
#using script_1cd534c7e79b126f;
#using script_221cb3c0b91a347a;
#using script_252989ab0c1d9a4c;
#using script_256b8879317373de;
#using script_270a16f0a470f2a6;
#using script_2ddf7d76494fb52;
#using script_2f560596a9a134ab;
#using script_340a2e805e35f7a2;
#using script_3a704cbcf4081bfb;
#using script_3e57cc1a9084fdd6;
#using script_3f9e0dc8454d98e1;
#using script_42b51e4a369b0f95;
#using script_43ce7284919bced2;
#using script_448683444db21d61;
#using script_4acbbbcdc7ef16a0;
#using script_4ccfb58a9443a60b;
#using script_4ce5d94e8c797350;
#using script_52c6c2d1a2ef1b46;
#using script_57f7003580bb15e0;
#using script_58860a35d0555f74;
#using script_58c342edd81589fb;
#using script_5c00791eb1bb8daf;
#using script_5c8450156115b2ba;
#using script_5ed2585bb7f6211f;
#using script_61fcfebb2f3a00e0;
#using script_6727713c6a2b75e4;
#using script_676fc0767562bc02;
#using script_6c5b51f98cd04fa3;
#using script_6ce38ab036223e6e;
#using script_6d148b720e2af260;
#using script_6fd04d6a5aedaec9;
#using script_7224d61ed502ea07;
#using script_72d96920f15049b8;
#using script_744259b349d834c7;
#using script_76a8f964e4309959;
#using script_772d4fbcb229f593;
#using script_77b61a4178efdbc4;
#using script_78e15c602a78106b;
#using script_7b1cd3908a825fdd;
#using script_7bacb32f8222fa3e;
#using script_7d5c9b91cf8d272b;
#using script_7e59d7bba853fe4b;
#using script_ab862743b3070a;
#using script_b9d273dc917ee1f;
#using script_db06eb511bd9b36;
#using scripts\core_common\aat_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\compass.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\load_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\scriptmodels_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\zm\zm_ai_raz.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm_devgui.gsc;
#using scripts\zm_common\zm_perks.gsc;
#using scripts\zm_common\zm_player.gsc;
#using scripts\zm_common\zm_power.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;

#namespace namespace_96b7f11d;

/*
	Name: function_b1837364
	Namespace: namespace_96b7f11d
	Checksum: 0xC2182F0D
	Offset: 0xDD0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b1837364()
{
	level notify(103882262);
}

/*
	Name: opt_in
	Namespace: namespace_96b7f11d
	Checksum: 0x391906F3
	Offset: 0xDF0
	Size: 0x5C
	Parameters: 0
	Flags: AutoExec
*/
function autoexec opt_in()
{
	level.aat_in_use = 1;
	level.bgb_machine_count = 2;
	level.random_pandora_box_start = 1;
	level.var_e2f95698 = #"hash_30d01dde2ca22cfc";
	level.var_1d1a6e08 = 1;
}

/*
	Name: main
	Namespace: namespace_96b7f11d
	Checksum: 0x801E538C
	Offset: 0xE58
	Size: 0x11F4
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	level.var_dfee7fc2 = #"hash_72c14048a8615869";
	level.var_f937a06e = 1;
	namespace_4abf1500::function_88645994(#"hash_2315f92412308649", undefined, undefined, undefined, undefined, #"hash_31bde97c3fc17a13", #"hash_50f16516daf5dfef", #"hash_605d833ff08f56aa", #"hash_6ae5ada2ca89db98");
	callback::on_start_gametype(&namespace_ff7e490::function_677bca6e);
	callback::on_spawned(&on_player_spawned);
	zm::init_fx();
	namespace_297ae820::init();
	namespace_c097de49::init();
	namespace_ff7e490::init();
	namespace_e502fca8::init();
	namespace_a8dddac2::init();
	namespace_95c839d1::init();
	namespace_8a08914c::init();
	namespace_dbaeabbd::init();
	namespace_9771a88f::init();
	namespace_edb23975::init();
	namespace_60bf0cf2::init();
	namespace_e5670722::init();
	register_clientfields = 1;
	if(register_clientfields)
	{
		clientfield::function_a8bbc967("player_lives", 1, 2, "int");
		clientfield::register("toplayer", "" + #"hash_464e0cd19b3b8c12", 1, 1, "int");
		clientfield::register("scriptmover", "" + #"hash_16e5e4d2ea0716b7", 1, 2, "int");
		clientfield::register("scriptmover", "" + #"hash_575d68a64ff032b2", 1, 1, "counter");
		clientfield::register("toplayer", "" + #"hash_69dc133e22a2769f", 28000, 1, "int");
		clientfield::register("toplayer", "" + #"hash_4cb4c776a64a6cca", 28000, getminbitcountfornum(5), "int");
		clientfield::register("scriptmover", "" + #"hash_27556b053ce9a6a2", 1, 1, "counter");
		clientfield::register("toplayer", "" + #"hash_d4826b65faa9efb", 28000, 1, "int");
		clientfield::register("toplayer", "" + #"hash_4c2c37e44f9d6cf4", 28000, 2, "int");
		clientfield::register("toplayer", "" + #"hash_4be33f9c734f0cb9", 1, getminbitcountfornum(4), "int");
		clientfield::register("toplayer", "" + #"hash_7c5d3ac35353f95c", 28000, getminbitcountfornum(2), "int");
		clientfield::register("world", "" + #"hash_763dd8035e80f7c", 28000, 1, "int");
		clientfield::register("world", "" + #"hash_7b3ada6e5b1cf81e", 1, 1, "int");
		clientfield::register("toplayer", "" + #"hash_56c7e620d1de163a", 1, 1, "counter");
		clientfield::register("toplayer", "" + #"hash_4f232c4c4c5f7816", 1, 1, "int");
		clientfield::register("world", "" + #"hash_14197af7df70a497", 28000, 1, "int");
		clientfield::register("world", "" + #"hash_6ecd61d493349ec0", 28000, getminbitcountfornum(2), "int");
		clientfield::register("scriptmover", "" + #"hash_431b27e4b133e650", 28000, 1, "int");
		clientfield::register("world", "" + #"hash_1fb207d10fbe27ce", 28000, 1, "int");
		clientfield::register("world", "" + #"hash_5a36f05cbdf2580", 28000, getminbitcountfornum(12), "int");
		clientfield::register("allplayers", "" + #"hash_3198b85c253e79d4", 28000, 1, "int");
		clientfield::register("actor", "" + #"hash_3e4641a9ea00d061", 28000, 1, "int");
		clientfield::register("world", "" + #"hash_2f4e23884d9865e1", 28000, 1, "int");
		clientfield::register("world", "" + #"hash_7fd166b952515da7", 28000, 1, "int");
		clientfield::register("world", "" + #"hash_3e71bd47ea1a6144", 28000, 1, "int");
		clientfield::register("allplayers", "" + #"hash_73227fdae7d9bc0e", 28000, 1, "int");
		clientfield::register("vehicle", "" + #"hash_66006a74a4ab8b8e", 28000, 1, "int");
		clientfield::register("allplayers", "" + #"hash_1a529bb0de6717d5", 1, 1, "int");
	}
	clientfield::register("world", "" + #"hash_2a35f1483d5f5467", 1, 1, "int");
	clientfield::register("world", "" + #"hash_deec7a5e441c482", 1, 1, "int");
	level.default_start_location = "zone_helipads";
	level.default_game_mode = "zclassic";
	level._allow_melee_weapon_switching = 1;
	level.zombiemode_reusing_pack_a_punch = 1;
	level.var_88672174 = 119;
	level.var_5b8c6c9b = 120;
	level.var_f1662fe9 = 121;
	level.custom_spawner_entry[#"crawl"] = &zm_spawner::function_45bb11e4;
	level.var_d0ab70a2 = #"hash_415d2f1314ea548a";
	level.player_out_of_playable_area_monitor = 1;
	level.var_6f6cc58 = &function_6f6cc58;
	level.local_doors_stay_open = 1;
	level.var_1b57c9ca = 1;
	level.var_76e8fb05 = 1;
	level.var_dfe80386 = 1;
	level.var_24a62388 = &function_9bd5841;
	callback::function_532a4f74(&function_a648d1a6);
	callback::function_c16ce2bc(&function_dc9b097c);
	load::main();
	compass::setupminimap("");
	setdvar(#"hash_384191a42356d34", 1);
	setdvar(#"hash_64d8f355a9e6daa5", 1);
	setdvar(#"hash_2d56e13848a82d14", 0);
	setdvar(#"hash_b3395a8d3abf84a", 1);
	setdvar(#"hash_7b06b8037c26b99b", 100);
	level.var_f30c7ef1 = 1;
	level.var_e714f814 = 1;
	function_78e3584f((4750, 1778.25, -230), "zone_drinks_bar");
	function_78e3584f((4850, 1778.25, -230), "zone_drinks_bar");
	function_78e3584f((4650, 1778.25, -230), "zone_drinks_bar");
	level.zones = [];
	level.zone_manager_init_func = &namespace_f22a3322::zone_init;
	level thread zm_zonemgr::manage_zones("zone_helipads");
	level thread sndfunctions();
	level.var_cd3d6a27 = &function_65c65feb;
	level.var_fc439a95 = #"hash_69461751fa492ea4";
	level flag::set(#"power_on");
	level flag::set("pause_round_timeout");
	level thread function_9a17632d();
	level.var_7f72eddd = "default_zombies_tungsten";
	level.var_dafeed10 = "exfil_tungsten_";
	level.var_8bb7479c = #"hash_477b4126fbff1de1";
	level.var_72a3d8bc = #"hash_4f5da795ab0a5fc";
	level.var_26ed6a07 = 600;
	level.var_c86f12d4 = 200;
	level.var_aaf7505f = 120;
	level.var_baed3b8e = 1750;
	level.var_ac94c2b8 = 2;
	callback::add_callback(#"hash_594217387367ebb4", &function_d81240c3);
	namespace_591b4396::function_fa5bd408(array("zone_helipads", "zone_helipads_2", "zone_helipads_3", "zone_helipads_4"));
	level thread zm_perks::spare_change();
	namespace_471b2690::init();
	level thread function_24e89a46();
	level thread function_ae72b4d0(8);
	level thread function_9aa4197b(30);
	level thread function_7ee69673(12);
	level thread function_6227dac2(14, 16);
	level thread function_289c7852(15);
	level thread function_32401229(20);
	level thread function_9e6f187d(25);
	level thread function_df4859f();
	level thread function_43b0a4e2();
	level thread function_88a42ff9();
	/#
		level thread function_96aabf2f();
	#/
	/#
		level thread function_37597f29();
	#/
	level thread function_f2763418();
	level thread function_cee737a4();
	level thread function_4f3af205();
	level thread function_5e6cac2d();
	level thread function_2420f30f();
	level thread function_d4738f46();
	level.var_68e3cf24 = 1;
	level.var_fd959dcf = "chopper_gunner_vol_amerika";
	namespace_e8c18978::function_d887d24d("chopper_gunner_vol_helipads");
	level.var_33833303 = &function_33833303;
	level.var_19441a5a = &function_19441a5a;
	level.var_caddca10 = &function_caddca10;
	hidemiscmodels("ts_dark_aether_grass");
	namespace_1fd59e39::function_1376ec37((5531, 4217, 574), 300);
	namespace_1fd59e39::function_1376ec37((5544, 5747, 574), 300);
	player::function_31b5c778((2324, 1386, -275), 300);
	var_3ec9cf5e = util::spawn_model(#"hash_3d720eba92c50261", (5595, 3218.55, -392.382));
	var_3ec9cf5e setscale(0.5);
	/#
		level thread function_5a3997b4();
	#/
}

/*
	Name: function_78e3584f
	Namespace: namespace_96b7f11d
	Checksum: 0x367B8F64
	Offset: 0x2058
	Size: 0x5A
	Parameters: 2
	Flags: Linked
*/
function function_78e3584f(v_position, str_zone_name)
{
	e_info_volume = spawn("info_volume", v_position);
	if(isdefined(e_info_volume))
	{
		e_info_volume.targetname = str_zone_name;
		e_info_volume.script_noteworthy = "player_volume";
	}
}

/*
	Name: function_9a17632d
	Namespace: namespace_96b7f11d
	Checksum: 0xE4299B64
	Offset: 0x20C0
	Size: 0xCC
	Parameters: 0
	Flags: Linked
*/
function function_9a17632d()
{
	level endon(#"end_game");
	while(true)
	{
		level waittill(#"start_of_round", #"power_on1");
		if(level.round_number >= 6 || level flag::get("power_on1"))
		{
			if(!level flag::get(#"hash_820c83920af16b7"))
			{
				level flag::clear("pause_round_timeout");
				break;
			}
		}
	}
}

/*
	Name: function_88a42ff9
	Namespace: namespace_96b7f11d
	Checksum: 0x3B8506A7
	Offset: 0x2198
	Size: 0x1EE
	Parameters: 0
	Flags: Linked
*/
function function_88a42ff9()
{
	level endon(#"end_game");
	while(true)
	{
		var_be17187b = undefined;
		var_be17187b = level waittill(#"hash_e39eca74fa250b4");
		s_magic_box = var_be17187b.s_magic_box;
		if(!isdefined(s_magic_box.script_noteworthy))
		{
			waitframe(1);
			continue;
		}
		switch(s_magic_box.script_noteworthy)
		{
			case "hash_56d1c62d9d855079":
			{
				s_magic_box function_b4abc0a1("map_box_loc_staging_area");
				break;
			}
			case "hash_4df315302311fca6":
			{
				s_magic_box function_b4abc0a1("map_box_loc_storage_5");
				break;
			}
			case "hash_491b1052ddf51113":
			{
				s_magic_box function_b4abc0a1("map_box_loc_storage_10");
				break;
			}
			case "hash_63575e63c86bf1be":
			{
				s_magic_box function_b4abc0a1("map_box_loc_anytown_east");
				break;
			}
			case "hash_38c125278e00d34b":
			{
				s_magic_box function_b4abc0a1("map_box_loc_anytown_west");
				break;
			}
			case "hash_367f50ca7e5de64e":
			{
				s_magic_box function_b4abc0a1("map_box_loc_amplifier");
				break;
			}
			case "hash_6a534c1571dbef87":
			{
				s_magic_box function_b4abc0a1("map_box_loc_tower");
				break;
			}
			default:
			{
				break;
			}
		}
	}
}

/*
	Name: function_b4abc0a1
	Namespace: namespace_96b7f11d
	Checksum: 0x3FAB09A8
	Offset: 0x2390
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function function_b4abc0a1(var_19eadb8b)
{
	if(is_true(self.hidden))
	{
		hidemiscmodels(var_19eadb8b);
	}
	else
	{
		showmiscmodels(var_19eadb8b);
	}
}

/*
	Name: function_43b0a4e2
	Namespace: namespace_96b7f11d
	Checksum: 0x4AEA887D
	Offset: 0x23F0
	Size: 0x8C
	Parameters: 0
	Flags: Linked
*/
function function_43b0a4e2()
{
	level endon(#"end_game");
	level flag::wait_till_all([1:"connect_pizza_parlor", 0:"start_zombie_round_logic"]);
	level clientfield::set("" + #"hash_3e71bd47ea1a6144", 1);
}

/*
	Name: function_963beb87
	Namespace: namespace_96b7f11d
	Checksum: 0xC90EBB12
	Offset: 0x2488
	Size: 0x68
	Parameters: 0
	Flags: None
*/
function function_963beb87()
{
	level.random_pandora_box_start = 0;
	level.start_chest_name = "test_chest";
	level.open_chest_location = [];
	level.open_chest_location[0] = "test_chest";
	level.open_chest_location[1] = "test2_chest";
	level.open_chest_location[2] = "test3_chest";
}

/*
	Name: offhand_weapon_overrride
	Namespace: namespace_96b7f11d
	Checksum: 0xB60D4547
	Offset: 0x24F8
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
	Namespace: namespace_96b7f11d
	Checksum: 0x5CDF18FC
	Offset: 0x2530
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
	Name: on_player_spawned
	Namespace: namespace_96b7f11d
	Checksum: 0x6AC0094
	Offset: 0x2600
	Size: 0xD2
	Parameters: 0
	Flags: Linked
*/
function on_player_spawned()
{
	self thread function_bf14bffe();
	self thread function_5e8470e6();
	self thread function_bce9fcbe();
	if(!is_true(self.is_hotjoining) && !self util::is_spectating())
	{
		self thread function_a7ba2448();
		self thread function_daaf54cb();
		self.var_3487fff6 = undefined;
		self.var_1bfa91a = undefined;
		self.var_6dfeb5ef = &function_6eba65ea;
	}
}

/*
	Name: function_bce9fcbe
	Namespace: namespace_96b7f11d
	Checksum: 0x74C467B3
	Offset: 0x26E0
	Size: 0x21E
	Parameters: 0
	Flags: Linked
*/
function function_bce9fcbe()
{
	self notify("56c3b424a367243");
	self endon("56c3b424a367243");
	level endon(#"end_game");
	self endon(#"disconnect", #"death");
	while(true)
	{
		var_e8178f0 = self zm_zonemgr::is_player_in_zone(level.var_707f916f);
		self clientfield::set_to_player("" + #"hash_69dc133e22a2769f", var_e8178f0);
		var_733eb37d = 0;
		str_player_zone = self zm_zonemgr::get_player_zone();
		if(isdefined(str_player_zone))
		{
			switch(str_player_zone)
			{
				case "hash_110a083dd7a4c73d":
				case "hash_3a8a659340d5b7dc":
				case "hash_7628e93652bfe982":
				{
					var_733eb37d = 1;
					break;
				}
				case "hash_56acab851acd203f":
				case "hash_7616fa58d551f408":
				{
					var_733eb37d = 2;
					break;
				}
				case "hash_27c27904f3b6057c":
				case "hash_5cc30692a3a4880f":
				{
					var_733eb37d = 3;
					break;
				}
				case "hash_3369039ae8e52c76":
				case "hash_6425bc684cb99569":
				{
					var_733eb37d = 4;
					break;
				}
				case "hash_10b836f6790b4662":
				{
					var_733eb37d = 5;
					break;
				}
			}
		}
		self clientfield::set_to_player("" + #"hash_4cb4c776a64a6cca", var_733eb37d);
		self waittill(#"hash_2d4daa9e80b86b60");
	}
}

/*
	Name: sndfunctions
	Namespace: namespace_96b7f11d
	Checksum: 0xFE78CE80
	Offset: 0x2908
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
	Namespace: namespace_96b7f11d
	Checksum: 0xD26D5243
	Offset: 0x2968
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
	Namespace: namespace_96b7f11d
	Checksum: 0x752808EC
	Offset: 0x2D38
	Size: 0x16C
	Parameters: 0
	Flags: Linked
*/
function setupmusic()
{
	zm_audio::musicstate_create("round_start_first", 3, "round_start_first");
	zm_audio::musicstate_create("round_start", 3, "round_start_00", "round_start_01", "round_start_02");
	zm_audio::musicstate_create("round_end", 3, "round_end_00");
	zm_audio::musicstate_create("round_start_special", 3, "round_start_special_00");
	zm_audio::musicstate_create("round_end_special", 3, "round_end_special_00");
	zm_audio::musicstate_create("game_over", 5, "gameover_tungsten");
	zm_audio::musicstate_create("ee_song", 4, "egg");
	zm_audio::musicstate_create("flood_spawning", 3, "flood_spawning");
	zm_audio::function_e441162b("flood_spawning");
}

/*
	Name: function_65c65feb
	Namespace: namespace_96b7f11d
	Checksum: 0x9CE5929F
	Offset: 0x2EB0
	Size: 0x54
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
		level thread namespace_c097de49::function_e2901362();
	}
	else
	{
		level thread namespace_c097de49::function_26113358();
	}
}

/*
	Name: function_6f6cc58
	Namespace: namespace_96b7f11d
	Checksum: 0xA70B99F7
	Offset: 0x2F10
	Size: 0x4DE
	Parameters: 1
	Flags: Linked
*/
function function_6f6cc58(e_player)
{
	if(level flag::get(#"hash_2145c074d359b87d"))
	{
		return 1;
	}
	if(isdefined(self) && isdefined(e_player))
	{
		if(!isdefined(level.var_dff48402))
		{
			level.var_dff48402 = [];
		}
		if(!isdefined(level.var_dff48402[e_player getentitynumber()]) || e_player.origin !== level.var_dff48402[e_player getentitynumber()].origin)
		{
			level.var_dff48402[e_player getentitynumber()] = {#origin:e_player.origin, #zone:e_player zm_utility::get_current_zone()};
		}
		zone_name = level.var_dff48402[e_player getentitynumber()].zone;
		if(zone_name === "zone_observation" || function_2fab3106(e_player))
		{
			return 0;
		}
		if(level flag::get(#"hash_3e765c26047c9f54"))
		{
			if(isinarray(level.var_ad5e81fe, zone_name))
			{
				if(distance2dsquared(self.origin, e_player.origin) < 4000000)
				{
					return 1;
				}
			}
		}
		if(isdefined(self.archetype) && isinarray([6:#"zombie_dog", 5:#"hash_7c09b683edfb0e96", 4:#"avogadro", 3:#"mimic", 2:#"raz", 1:#"hash_1bc8194446d4722f", 0:#"zombie"], self.archetype))
		{
			if(isplayer(e_player))
			{
				if(isdefined(self.v_zombie_custom_goal_pos) && isdefined(self.var_29656770))
				{
					return 1;
				}
				var_e2414b1b = zm_zonemgr::function_54fc7938(e_player, (isdefined(self.cached_zone_name) ? self.cached_zone_name : self));
				return isdefined(var_e2414b1b);
			}
		}
		else
		{
			if(isplayer(e_player) && self.archetype === #"hash_24f9e195cf2de42")
			{
				var_e2414b1b = zm_zonemgr::function_54fc7938(e_player, (isdefined(self.cached_zone_name) ? self.cached_zone_name : self));
				if(isdefined(var_e2414b1b))
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
					zone_name = (isdefined(self.cached_zone_name) ? self.cached_zone_name : self zm_utility::get_current_zone());
					if(!isdefined(zone_name))
					{
						zone_name = self.var_5e54763a;
					}
					var_e2414b1b = zm_zonemgr::function_54fc7938(e_player, zone_name);
					return isdefined(var_e2414b1b);
				}
				return 1;
			}
			return 1;
		}
	}
	return 0;
}

/*
	Name: function_2fab3106
	Namespace: namespace_96b7f11d
	Checksum: 0x871D648F
	Offset: 0x33F8
	Size: 0x48
	Parameters: 1
	Flags: Linked
*/
function function_2fab3106(e_player)
{
	if(isalive(e_player) && e_player function_e128a831())
	{
		return true;
	}
	return false;
}

/*
	Name: function_24e89a46
	Namespace: namespace_96b7f11d
	Checksum: 0xC9DABAAF
	Offset: 0x3448
	Size: 0x44
	Parameters: 0
	Flags: Linked, Private
*/
function private function_24e89a46()
{
	level.fn_custom_zombie_spawner_selection = &function_ddc13fd6;
	level.zombie_spawners = array::sort_by_script_int(level.zombie_spawners, 1);
}

/*
	Name: function_ddc13fd6
	Namespace: namespace_96b7f11d
	Checksum: 0x26EAA640
	Offset: 0x3498
	Size: 0x16C
	Parameters: 0
	Flags: Linked
*/
function function_ddc13fd6()
{
	s_loc = array::random(level.zm_loc_types[#"zombie_location"]);
	var_87e4f82c = randomintrange(0, 100);
	var_b62ee10a = [1:1, 0:0];
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
	return level.zombie_spawners[array::random(var_b62ee10a)];
}

/*
	Name: function_ae72b4d0
	Namespace: namespace_96b7f11d
	Checksum: 0x71E82FF7
	Offset: 0x3610
	Size: 0xCC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_ae72b4d0(n_round)
{
	namespace_c3287616::function_2876740e(#"hash_1bc8194446d4722f", &function_d3687911);
	zm_cleanup::function_cdf5a512(#"hash_1bc8194446d4722f", &function_d8461453);
	namespace_c3287616::function_306ce518(#"hash_1bc8194446d4722f", &function_42885f70);
	level.var_97100fcf = n_round;
	namespace_c3287616::function_cc103b38(#"hash_1bc8194446d4722f", n_round);
}

/*
	Name: function_9aa4197b
	Namespace: namespace_96b7f11d
	Checksum: 0x73E4C21C
	Offset: 0x36E8
	Size: 0xB4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_9aa4197b(n_round)
{
	namespace_c3287616::function_2876740e(#"avogadro", &function_68ae7023);
	zm_cleanup::function_cdf5a512(#"avogadro", &function_1d78bd02);
	level.var_69f2520a = n_round;
	namespace_c3287616::function_cc103b38(#"avogadro", n_round);
	level.var_4e1942d2 = &function_d9f5ec34;
}

/*
	Name: function_6227dac2
	Namespace: namespace_96b7f11d
	Checksum: 0x845348D4
	Offset: 0x37A8
	Size: 0xF4
	Parameters: 2
	Flags: Linked, Private
*/
function private function_6227dac2(var_5ef83799, var_43416dd5)
{
	if(is_true(level.is_forever_solo_game))
	{
		n_round = var_43416dd5;
	}
	else
	{
		n_round = var_5ef83799;
	}
	namespace_c3287616::function_2876740e(#"hash_7c09b683edfb0e96", &function_48924a80);
	zm_cleanup::function_cdf5a512(#"hash_7c09b683edfb0e96", &function_1d787beb);
	level.var_9135c56e = n_round;
	namespace_c3287616::function_cc103b38(#"hash_7c09b683edfb0e96", n_round);
	level.var_eb59a95c = &function_30815e9d;
}

/*
	Name: function_289c7852
	Namespace: namespace_96b7f11d
	Checksum: 0x83152136
	Offset: 0x38A8
	Size: 0x94
	Parameters: 1
	Flags: Linked, Private
*/
function private function_289c7852(n_round)
{
	spawner::add_archetype_spawn_function(#"mimic", &function_64ed78df);
	zm_cleanup::function_cdf5a512(#"mimic", &function_5394f283);
	level.var_9583b85c = 15;
	level thread function_53555fd2();
}

/*
	Name: function_7ee69673
	Namespace: namespace_96b7f11d
	Checksum: 0x3E0712E8
	Offset: 0x3948
	Size: 0x9C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_7ee69673(n_round)
{
	namespace_c3287616::function_2876740e(#"zombie_dog", &function_eaf01ea9);
	namespace_c3287616::function_cc103b38(#"zombie_dog", n_round);
	level.var_952c8793 = n_round;
	namespace_c3287616::function_306ce518(#"zombie_dog", &function_1ec597c3);
}

/*
	Name: function_32401229
	Namespace: namespace_96b7f11d
	Checksum: 0x8A4A198C
	Offset: 0x39F0
	Size: 0xFC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_32401229(n_round)
{
	namespace_c3287616::function_2876740e(#"hash_24f9e195cf2de42", &function_76a7a9ef);
	zm_cleanup::function_cdf5a512(#"hash_24f9e195cf2de42", &function_817bfebd);
	namespace_c3287616::function_306ce518(#"hash_24f9e195cf2de42", &function_2927859c);
	level.var_a1c6ba48 = n_round;
	namespace_c3287616::function_cc103b38(#"hash_24f9e195cf2de42", n_round);
	level.var_194823e7 = &function_41a4961d;
	level.var_f9bb6f24 = &function_f9bb6f24;
}

/*
	Name: function_f9bb6f24
	Namespace: namespace_96b7f11d
	Checksum: 0xF0BFCCC7
	Offset: 0x3AF8
	Size: 0x6
	Parameters: 0
	Flags: Linked
*/
function function_f9bb6f24()
{
	return undefined;
}

/*
	Name: function_9e6f187d
	Namespace: namespace_96b7f11d
	Checksum: 0x892E992E
	Offset: 0x3B08
	Size: 0xE4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_9e6f187d(n_round)
{
	namespace_c3287616::function_2876740e(#"raz", &function_d4f11e3c);
	zm_cleanup::function_cdf5a512(#"raz", &function_54993e2);
	namespace_c3287616::function_306ce518(#"raz", &function_f1355240);
	level.var_36678664 = n_round;
	namespace_c3287616::function_cc103b38(#"raz", n_round);
	level.var_2e33420c = &function_218424b3;
}

/*
	Name: function_218424b3
	Namespace: namespace_96b7f11d
	Checksum: 0x3ED3E3AD
	Offset: 0x3BF8
	Size: 0xBA
	Parameters: 1
	Flags: Linked
*/
function function_218424b3(get_all)
{
	if(!isdefined(get_all))
	{
		get_all = 0;
	}
	if(isdefined(level.zm_loc_types[#"raz_location"]) && level.zm_loc_types[#"raz_location"].size)
	{
		if(get_all)
		{
			s_spawn_loc = level.zm_loc_types[#"raz_location"];
		}
		else
		{
			s_spawn_loc = array::random(level.zm_loc_types[#"raz_location"]);
		}
	}
	return s_spawn_loc;
}

/*
	Name: function_30815e9d
	Namespace: namespace_96b7f11d
	Checksum: 0x3C3B60AF
	Offset: 0x3CC0
	Size: 0xBA
	Parameters: 1
	Flags: Linked
*/
function function_30815e9d(get_all)
{
	if(!isdefined(get_all))
	{
		get_all = 0;
	}
	if(isdefined(level.zm_loc_types[#"hash_b7c88561b5e9b2c"]) && level.zm_loc_types[#"hash_b7c88561b5e9b2c"].size)
	{
		if(get_all)
		{
			s_spawn_loc = level.zm_loc_types[#"hash_b7c88561b5e9b2c"];
		}
		else
		{
			s_spawn_loc = array::random(level.zm_loc_types[#"hash_b7c88561b5e9b2c"]);
		}
	}
	return s_spawn_loc;
}

/*
	Name: function_d9f5ec34
	Namespace: namespace_96b7f11d
	Checksum: 0xDE2C8B77
	Offset: 0x3D88
	Size: 0xBA
	Parameters: 1
	Flags: Linked
*/
function function_d9f5ec34(get_all)
{
	if(!isdefined(get_all))
	{
		get_all = 0;
	}
	if(isdefined(level.zm_loc_types[#"hash_2fe3f22c14b70850"]) && level.zm_loc_types[#"hash_2fe3f22c14b70850"].size)
	{
		if(get_all)
		{
			s_spawn_loc = level.zm_loc_types[#"hash_2fe3f22c14b70850"];
		}
		else
		{
			s_spawn_loc = array::random(level.zm_loc_types[#"hash_2fe3f22c14b70850"]);
		}
	}
	return s_spawn_loc;
}

/*
	Name: function_41a4961d
	Namespace: namespace_96b7f11d
	Checksum: 0x9293E5BF
	Offset: 0x3E50
	Size: 0x3B2
	Parameters: 1
	Flags: Linked
*/
function function_41a4961d(get_all)
{
	if(!isdefined(get_all))
	{
		get_all = 0;
	}
	if(isdefined(level.zm_loc_types[#"hash_2fe3f22c14b70850"]) && level.zm_loc_types[#"hash_2fe3f22c14b70850"].size)
	{
		if(get_all)
		{
			s_spawn_loc = level.zm_loc_types[#"hash_2fe3f22c14b70850"];
		}
		else
		{
			locs = level.zm_loc_types[#"hash_2fe3f22c14b70850"];
			if(getplayers().size > 1)
			{
				var_a6c95035 = [];
				var_b0becd1e = namespace_19c99142::function_a64f7068();
				if(!isdefined(var_b0becd1e))
				{
					return array::random(locs);
				}
				var_5f3b05e8 = var_b0becd1e zm_zonemgr::get_player_zone();
				if(!isdefined(var_5f3b05e8))
				{
					return array::random(locs);
				}
				var_c61e7ea7 = level.zones[var_5f3b05e8];
				var_24f5d9f8 = array(var_c61e7ea7.name);
				var_e15699c4 = getarraykeys(var_c61e7ea7.adjacent_zones);
				foreach(str_zone in var_e15699c4)
				{
					if(var_c61e7ea7.adjacent_zones[str_zone].is_connected)
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
	Name: function_48924a80
	Namespace: namespace_96b7f11d
	Checksum: 0xD79A69D5
	Offset: 0x4210
	Size: 0x8A
	Parameters: 1
	Flags: Linked
*/
function function_48924a80(var_148cc603)
{
	if(isdefined(level.var_9135c56e) && level.round_number < level.var_9135c56e)
	{
		return 0;
	}
	if(function_b05cfca9())
	{
		return function_1bbe93bc(level.var_59adf71, var_148cc603);
	}
	level.var_9135c56e = level.round_number + 1;
	return 0;
}

/*
	Name: function_68ae7023
	Namespace: namespace_96b7f11d
	Checksum: 0x14932D5E
	Offset: 0x42A8
	Size: 0x82
	Parameters: 1
	Flags: Linked
*/
function function_68ae7023(var_148cc603)
{
	if(isdefined(level.var_69f2520a) && level.round_number < level.var_69f2520a)
	{
		return 0;
	}
	if(function_b05cfca9())
	{
		return function_cf877849(var_148cc603);
	}
	level.var_69f2520a = level.round_number + 1;
	return 0;
}

/*
	Name: function_76a7a9ef
	Namespace: namespace_96b7f11d
	Checksum: 0xBEBC6E8
	Offset: 0x4338
	Size: 0x82
	Parameters: 1
	Flags: Linked
*/
function function_76a7a9ef(var_148cc603)
{
	if(isdefined(level.var_a1c6ba48) && level.round_number < level.var_a1c6ba48)
	{
		return 0;
	}
	if(function_b05cfca9())
	{
		return function_cf877849(var_148cc603);
	}
	level.var_a1c6ba48 = level.round_number + 1;
	return 0;
}

/*
	Name: function_a613c599
	Namespace: namespace_96b7f11d
	Checksum: 0x350EABC4
	Offset: 0x43C8
	Size: 0x82
	Parameters: 1
	Flags: None
*/
function function_a613c599(var_148cc603)
{
	if(isdefined(level.var_8c1fa240) && level.round_number < level.var_8c1fa240)
	{
		return 0;
	}
	if(function_b05cfca9())
	{
		return function_cf877849(var_148cc603);
	}
	level.var_8c1fa240 = level.round_number + 1;
	return 0;
}

/*
	Name: function_d4f11e3c
	Namespace: namespace_96b7f11d
	Checksum: 0x2DC929F6
	Offset: 0x4458
	Size: 0x82
	Parameters: 1
	Flags: Linked
*/
function function_d4f11e3c(var_148cc603)
{
	if(isdefined(level.var_36678664) && level.round_number < level.var_36678664)
	{
		return 0;
	}
	if(function_b05cfca9())
	{
		return function_cf877849(var_148cc603);
	}
	level.var_36678664 = level.round_number + 1;
	return 0;
}

/*
	Name: function_d3687911
	Namespace: namespace_96b7f11d
	Checksum: 0x8C8EB0D0
	Offset: 0x44E8
	Size: 0x4A
	Parameters: 1
	Flags: Linked
*/
function function_d3687911(var_148cc603)
{
	if(isdefined(level.var_97100fcf) && level.round_number < level.var_97100fcf)
	{
		return 0;
	}
	return function_cf877849(var_148cc603);
}

/*
	Name: function_eaf01ea9
	Namespace: namespace_96b7f11d
	Checksum: 0x8FA0FA3
	Offset: 0x4540
	Size: 0x4A
	Parameters: 1
	Flags: Linked
*/
function function_eaf01ea9(var_148cc603)
{
	if(isdefined(level.var_952c8793) && level.round_number < level.var_952c8793)
	{
		return 0;
	}
	return function_cf877849(var_148cc603);
}

/*
	Name: function_822214be
	Namespace: namespace_96b7f11d
	Checksum: 0x46466F45
	Offset: 0x4598
	Size: 0x10C
	Parameters: 1
	Flags: None
*/
function function_822214be(n_round_number)
{
	level endon(#"end_game");
	if(!isdefined(level.var_9c55e25a))
	{
		level.var_9c55e25a = 0;
	}
	while(true)
	{
		level waittill(#"hash_5d3012139f083ccb");
		if(namespace_c3287616::function_d0db51fc(#"mimic"))
		{
			level.var_9c55e25a++;
			if(level.round_number <= 20)
			{
				level.var_8c1fa240 = level.round_number + function_21a3a673(2, 4);
			}
			else
			{
				level.var_8c1fa240 = level.round_number + function_21a3a673(2, 3);
			}
		}
	}
}

/*
	Name: function_42885f70
	Namespace: namespace_96b7f11d
	Checksum: 0x98556C86
	Offset: 0x46B0
	Size: 0xBC
	Parameters: 1
	Flags: Linked
*/
function function_42885f70(n_round_number)
{
	level endon(#"end_game");
	if(!isdefined(level.var_3bb8de45))
	{
		level.var_3bb8de45 = 0;
	}
	while(true)
	{
		level waittill(#"hash_5d3012139f083ccb");
		if(namespace_c3287616::function_d0db51fc(#"hash_1bc8194446d4722f"))
		{
			level.var_3bb8de45++;
			level.var_97100fcf = level.round_number + function_21a3a673(1, 2);
		}
	}
}

/*
	Name: function_1ec597c3
	Namespace: namespace_96b7f11d
	Checksum: 0x4A4C442B
	Offset: 0x4778
	Size: 0x10C
	Parameters: 1
	Flags: Linked
*/
function function_1ec597c3(n_round_number)
{
	level endon(#"end_game");
	if(!isdefined(level.var_b0e7164b))
	{
		level.var_b0e7164b = 0;
	}
	while(true)
	{
		level waittill(#"hash_5d3012139f083ccb");
		if(namespace_c3287616::function_d0db51fc(#"zombie_dog"))
		{
			level.var_b0e7164b++;
			if(level.round_number <= 20)
			{
				level.var_952c8793 = level.round_number + function_21a3a673(2, 4);
			}
			else
			{
				level.var_952c8793 = level.round_number + function_21a3a673(2, 3);
			}
		}
	}
}

/*
	Name: function_2927859c
	Namespace: namespace_96b7f11d
	Checksum: 0x23286B22
	Offset: 0x4890
	Size: 0x10C
	Parameters: 1
	Flags: Linked
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
		if(namespace_c3287616::function_d0db51fc(#"hash_24f9e195cf2de42"))
		{
			level.var_d8db349d++;
			if(level.round_number <= 20)
			{
				level.var_a1c6ba48 = level.round_number + function_21a3a673(2, 4);
			}
			else
			{
				level.var_a1c6ba48 = level.round_number + function_21a3a673(2, 3);
			}
		}
	}
}

/*
	Name: function_f1355240
	Namespace: namespace_96b7f11d
	Checksum: 0xB18225E8
	Offset: 0x49A8
	Size: 0x134
	Parameters: 1
	Flags: Linked
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
		if(namespace_c3287616::function_d0db51fc(#"raz"))
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
	Name: function_cf877849
	Namespace: namespace_96b7f11d
	Checksum: 0x3A7D489E
	Offset: 0x4AE8
	Size: 0x7A
	Parameters: 1
	Flags: Linked
*/
function function_cf877849(var_148cc603)
{
	var_e5f0889c = 0.02;
	n_max = ceil(level.zombie_total * var_e5f0889c);
	return int(min(var_148cc603, n_max));
}

/*
	Name: function_1bbe93bc
	Namespace: namespace_96b7f11d
	Checksum: 0xFDBB36B3
	Offset: 0x4B70
	Size: 0x1D2
	Parameters: 2
	Flags: Linked
*/
function function_1bbe93bc(var_64501ea4, var_148cc603)
{
	n_player_count = zm_utility::function_a2541519(getplayers().size);
	if(n_player_count == 1)
	{
		switch(var_64501ea4)
		{
			case 0:
			case 1:
			case 2:
			{
				var_2506688 = 1;
				var_1797c23a = 1;
				break;
			}
			default:
			{
				var_2506688 = 1;
				var_1797c23a = 2;
				break;
			}
		}
	}
	else
	{
		switch(var_64501ea4)
		{
			case 0:
			case 1:
			{
				var_2506688 = 1;
				var_1797c23a = 1;
				break;
			}
			case 2:
			case 3:
			{
				var_2506688 = 2;
				var_1797c23a = 2;
				break;
			}
			default:
			{
				var_2506688 = 3;
				var_1797c23a = 3;
				break;
			}
		}
	}
	if(isdefined(var_148cc603))
	{
		var_1797c23a = int(min(var_148cc603, var_1797c23a));
	}
	return function_21a3a673(var_2506688, var_1797c23a);
}

/*
	Name: function_b05cfca9
	Namespace: namespace_96b7f11d
	Checksum: 0xC0EC58B3
	Offset: 0x4D50
	Size: 0x14C
	Parameters: 0
	Flags: Linked
*/
function function_b05cfca9()
{
	if(!isdefined(level.var_97be4fcf))
	{
		level.var_97be4fcf = 0;
	}
	if(isinarray([7:25, 6:20, 5:15, 4:16, 3:14, 2:12, 1:30, 0:8], level.round_number))
	{
		return false;
	}
	if(level.round_number < 20 && level.var_97be4fcf >= 1)
	{
		return false;
	}
	if(level.round_number < 30 && level.var_97be4fcf >= 2)
	{
		return false;
	}
	if(level.round_number < 50 && level.var_97be4fcf >= 3)
	{
		return false;
	}
	if(level.var_97be4fcf >= 4)
	{
		return false;
	}
	level.var_97be4fcf++;
	return true;
}

/*
	Name: function_df4859f
	Namespace: namespace_96b7f11d
	Checksum: 0x3D91EADC
	Offset: 0x4EA8
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_df4859f()
{
	level endon(#"end_game");
	while(true)
	{
		level waittill(#"end_of_round");
		level.var_97be4fcf = 0;
	}
}

/*
	Name: function_1d78bd02
	Namespace: namespace_96b7f11d
	Checksum: 0x216A2BFB
	Offset: 0x4F00
	Size: 0x398
	Parameters: 0
	Flags: Linked
*/
function function_1d78bd02()
{
	self endon(#"death");
	while(true)
	{
		var_31f7011a = arraysortclosest(getplayers(), self.origin);
		foreach(player in var_31f7011a)
		{
			if(zm_utility::is_player_valid(player))
			{
				closest_player = player;
				break;
			}
		}
		if(isdefined(closest_player))
		{
			break;
		}
		util::wait_network_frame();
	}
	var_a1ef7f29 = [];
	if(isdefined(level.var_4e1942d2))
	{
		spawn_locs = [[level.var_4e1942d2]](1);
		if(isarray(spawn_locs))
		{
			var_a1ef7f29 = spawn_locs;
		}
		else
		{
			array::add(var_a1ef7f29, spawn_locs);
		}
	}
	else
	{
		spawn_locs = function_d9f5ec34(1);
		if(isarray(spawn_locs))
		{
			var_a1ef7f29 = spawn_locs;
		}
	}
	var_69681a59 = [];
	if(isdefined(level.active_zone_names) && isarray(var_a1ef7f29) && var_a1ef7f29.size > 0)
	{
		foreach(spawn_loc in var_a1ef7f29)
		{
			if(isdefined(spawn_loc.zone_name) && array::contains(level.active_zone_names, spawn_loc.zone_name))
			{
				if(!isdefined(var_69681a59))
				{
					var_69681a59 = [];
				}
				else if(!isarray(var_69681a59))
				{
					var_69681a59 = array(var_69681a59);
				}
				var_69681a59[var_69681a59.size] = spawn_loc;
			}
		}
	}
	if(var_69681a59.size < 1)
	{
		return true;
	}
	spawn_points = arraysortclosest(var_69681a59, closest_player.origin, undefined, 500);
	if(spawn_points.size > 0)
	{
		var_b2aa54a9 = spawn_points[0];
	}
	else
	{
		var_b2aa54a9 = arraygetfarthest(closest_player.origin, var_69681a59);
	}
	if(isdefined(var_b2aa54a9))
	{
		self namespace_e0710ee6::function_a8dc3363(var_b2aa54a9);
	}
	return true;
}

/*
	Name: function_1d787beb
	Namespace: namespace_96b7f11d
	Checksum: 0x26D7A0DA
	Offset: 0x52A0
	Size: 0xD0
	Parameters: 0
	Flags: Linked
*/
function function_1d787beb()
{
	if(isdefined(level.var_eb59a95c))
	{
		var_d7eff26a = [[level.var_eb59a95c]]();
	}
	else
	{
		var_91562d8c = level.zm_loc_types[#"hash_b7c88561b5e9b2c"];
		if(isdefined(var_91562d8c.size))
		{
			var_d7eff26a = zm_spawner::function_20e7d186(var_91562d8c);
		}
	}
	if(isentity(self) && isdefined(var_d7eff26a))
	{
		self namespace_e0710ee6::function_a8dc3363(var_d7eff26a);
		self thread namespace_361e505d::function_940cd1d8();
	}
	return true;
}

/*
	Name: function_817bfebd
	Namespace: namespace_96b7f11d
	Checksum: 0xE3701D1C
	Offset: 0x5378
	Size: 0x1D4
	Parameters: 0
	Flags: Linked
*/
function function_817bfebd()
{
	self endon(#"death");
	closest_player = zm_utility::function_d7fedde2(self);
	if(isdefined(closest_player))
	{
		if(closest_player zm_utility::get_current_zone() === "zone_observation")
		{
			return true;
		}
		var_debfdbf5 = 10;
		while(var_debfdbf5 > 0 && isalive(closest_player))
		{
			if(closest_player zm_utility::get_current_zone() === "zone_observation")
			{
				return true;
			}
			point = getrandomnavpoint(closest_player.origin, 350);
			if(isdefined(point) && zm_utility::check_point_in_playable_area(point))
			{
				angles = (0, vectortoyaw(closest_player.origin - point), 0);
				self forceteleport(self.origin, angles);
				self thread namespace_19c99142::function_940cd1d8();
				waitframe(1);
				namespace_e0710ee6::function_a8dc3363({#origin:point});
				self.completed_emerging_into_playable_area = 1;
				self.var_9817f19a = 0;
				break;
			}
			var_debfdbf5--;
			waitframe(1);
		}
	}
	return true;
}

/*
	Name: function_54993e2
	Namespace: namespace_96b7f11d
	Checksum: 0x60083CAC
	Offset: 0x5558
	Size: 0xC8
	Parameters: 0
	Flags: Linked
*/
function function_54993e2()
{
	if(isdefined(level.var_2e33420c))
	{
		var_d7eff26a = [[level.var_2e33420c]]();
	}
	else
	{
		var_91562d8c = level.zm_loc_types[#"raz_location"];
		if(var_91562d8c.size)
		{
			var_d7eff26a = zm_spawner::function_20e7d186(var_91562d8c);
		}
	}
	if(isentity(self) && isdefined(var_d7eff26a))
	{
		self namespace_e0710ee6::function_a8dc3363(var_d7eff26a);
		self thread zm_ai_raz::function_1f9940b8();
	}
	return true;
}

/*
	Name: function_d8461453
	Namespace: namespace_96b7f11d
	Checksum: 0xB73C3E43
	Offset: 0x5628
	Size: 0x10E
	Parameters: 0
	Flags: Linked
*/
function function_d8461453()
{
	s_spawn_loc = namespace_abfee9ba::function_a58fe5b7();
	if(isdefined(self) && isentity(self) && isdefined(s_spawn_loc))
	{
		self endon(#"death");
		level thread namespace_abfee9ba::function_55413772(s_spawn_loc);
		wait(1);
		self namespace_e0710ee6::function_a8dc3363(s_spawn_loc);
		earthquake(0.5, 0.75, self.origin, 1000);
		self.no_powerups = 1;
		if(isdefined(s_spawn_loc.script_string))
		{
			self.script_string = s_spawn_loc.script_string;
			self.find_flesh_struct_string = s_spawn_loc.script_string;
		}
	}
	return true;
}

/*
	Name: function_53555fd2
	Namespace: namespace_96b7f11d
	Checksum: 0xE73D5AF8
	Offset: 0x5740
	Size: 0x32C
	Parameters: 0
	Flags: Linked
*/
function function_53555fd2()
{
	level endon(#"end_game");
	while(true)
	{
		level waittill(#"start_of_round");
		if(level.round_number >= 15)
		{
			break;
		}
		wait(1);
	}
	/#
		iprintlnbold("");
	#/
	level.var_3db96efc = struct::get_array("mimic_item_spawn_point");
	level.var_4096945a = level.round_number;
	var_4b2b783e = spawnstruct();
	var_4b2b783e.origin = (6272, 4981, 576);
	var_4b2b783e.radius = 900;
	var_4b2b783e.halfheight = 200;
	str_key = "targetname";
	str_value = "zone_observation_no_mimic_prop_node";
	var_4b2b783e.(str_key) = str_value;
	if(!isdefined(level.var_657bb3b3[str_key][str_value]))
	{
		level.var_657bb3b3[str_key][str_value] = [];
	}
	else if(!isarray(level.var_657bb3b3[str_key][str_value]))
	{
		level.var_657bb3b3[str_key][str_value] = array(level.var_657bb3b3[str_key][str_value]);
	}
	if(!isinarray(level.var_657bb3b3[str_key][str_value], var_4b2b783e))
	{
		level.var_657bb3b3[str_key][str_value][level.var_657bb3b3[str_key][str_value].size] = var_4b2b783e;
	}
	while(true)
	{
		level waittill(#"hash_5d3012139f083ccb");
		if(level.round_number < level.var_4096945a)
		{
			continue;
		}
		b_skipped = undefined;
		if(function_b05cfca9() || level.round_number === 15)
		{
			level thread function_9f46dbde();
		}
		else
		{
			b_skipped = 1;
			level.var_4096945a = level.var_4096945a + 1;
		}
		level waittill(#"end_of_round");
		namespace_be0f9d50::function_fd24f982();
		if(!is_true(b_skipped))
		{
			level.var_4096945a = level.var_4096945a + randomintrange(2, 6);
		}
	}
}

/*
	Name: function_9f46dbde
	Namespace: namespace_96b7f11d
	Checksum: 0x32DC937C
	Offset: 0x5A78
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
		var_be17187b = undefined;
		var_be17187b = level waittill(#"hash_6d7ff9f9ff07619c");
		level.var_a4642f0a = level.var_a4642f0a + 1;
		var_93bd7be9 = var_be17187b.var_c40fb40b;
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
	Namespace: namespace_96b7f11d
	Checksum: 0x518EA336
	Offset: 0x5DF8
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
	Namespace: namespace_96b7f11d
	Checksum: 0x75C0FA67
	Offset: 0x6550
	Size: 0x396
	Parameters: 2
	Flags: Linked
*/
function function_ecf00b5(var_fdb8ea91, var_99963ba3)
{
	level endon(#"game_ended", #"end_of_round", #"hash_263cb0e9d84b0fa6");
	while(true)
	{
		a_players = function_a1ef346b();
		var_b568a31a = 0;
		var_1c4ca328 = 0;
		var_6dbe2ba3 = 0;
		var_64b8549e = 0;
		var_ce5c1431 = 0;
		var_a214bc86 = 0;
		var_84efce87 = 0;
		var_329d5499 = 0;
		var_55bdf746 = 0;
		foreach(player in a_players)
		{
			if(player zm_zonemgr::is_player_in_zone(level.var_dc2ca204, 0))
			{
				var_1c4ca328 = var_1c4ca328 + 1;
			}
			if(player zm_zonemgr::is_player_in_zone(level.var_65c43c31, 0))
			{
				var_b568a31a = var_b568a31a + 1;
			}
			if(player zm_zonemgr::is_player_in_zone(level.var_6097ff89, 0))
			{
				var_6dbe2ba3 = var_6dbe2ba3 + 1;
			}
			if(player zm_zonemgr::is_player_in_zone(level.var_2f941a56, 0))
			{
				var_64b8549e = var_64b8549e + 1;
			}
		}
		if(var_1c4ca328 <= 0)
		{
			var_a214bc86 = function_8937f221(level.var_dc2ca204);
		}
		if(var_b568a31a <= 0)
		{
			var_84efce87 = function_8937f221(level.var_65c43c31);
		}
		if(var_6dbe2ba3 <= 0)
		{
			var_329d5499 = function_8937f221(level.var_6097ff89);
		}
		if(var_64b8549e <= 0)
		{
			var_55bdf746 = function_8937f221(level.var_2f941a56);
		}
		var_ce5c1431 = ((var_a214bc86 + var_84efce87) + var_329d5499) + var_55bdf746;
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
	Namespace: namespace_96b7f11d
	Checksum: 0x190F6180
	Offset: 0x68F0
	Size: 0x132
	Parameters: 1
	Flags: Linked
*/
function function_8937f221(var_5ef6045b)
{
	arrayremovevalue(level.var_5fafe5ac, undefined);
	var_656150d9 = 0;
	foreach(prop in level.var_5fafe5ac)
	{
		zone = zm_zonemgr::get_zone_from_position(prop.origin, 1, 1);
		if(!isdefined(zone) || isinarray(var_5ef6045b, zone))
		{
			level thread namespace_be0f9d50::function_175bb809(prop);
			var_656150d9 = var_656150d9 + 1;
		}
	}
	return var_656150d9;
}

/*
	Name: function_64ed78df
	Namespace: namespace_96b7f11d
	Checksum: 0x60AD2F69
	Offset: 0x6A30
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
	Namespace: namespace_96b7f11d
	Checksum: 0xAA6A7280
	Offset: 0x6AA0
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
	Namespace: namespace_96b7f11d
	Checksum: 0xB9CD5BDC
	Offset: 0x6AD0
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
	Name: function_5394f283
	Namespace: namespace_96b7f11d
	Checksum: 0x316893FF
	Offset: 0x6B20
	Size: 0x8A
	Parameters: 0
	Flags: Linked
*/
function function_5394f283()
{
	if(is_true(self.var_43c4bc66))
	{
		b_result = self namespace_14c07d4f::function_dca29f5c();
	}
	else
	{
		b_result = self function_ce42b67b();
	}
	if(is_true(b_result))
	{
		self.completed_emerging_into_playable_area = 1;
	}
	return is_true(b_result);
}

/*
	Name: function_ce42b67b
	Namespace: namespace_96b7f11d
	Checksum: 0x75916908
	Offset: 0x6BB8
	Size: 0x186
	Parameters: 0
	Flags: Linked
*/
function function_ce42b67b()
{
	level endon(#"end_game");
	self endon(#"death");
	spawn_points = namespace_14c07d4f::function_64aa9d51();
	if(!isarray(spawn_points) || !spawn_points.size)
	{
		self.b_ignore_cleanup = 0;
		return false;
	}
	var_b2aa54a9 = spawn_points[randomint(spawn_points.size)];
	self namespace_e0710ee6::function_a8dc3363(var_b2aa54a9);
	if(isdefined(self.var_a6fe91fd))
	{
		foreach(prop in self.var_a6fe91fd)
		{
			level thread namespace_be0f9d50::function_175bb809(prop);
		}
		arrayremovevalue(self.var_a6fe91fd, undefined);
	}
	self.should_hide = 1;
	return true;
}

/*
	Name: function_cee737a4
	Namespace: namespace_96b7f11d
	Checksum: 0x9A7BC033
	Offset: 0x6D48
	Size: 0xBC
	Parameters: 0
	Flags: Linked
*/
function function_cee737a4()
{
	level flag::wait_till(#"hash_79bb6bfeda6a5c");
	s_zone = struct::get("s_radiation_zone");
	level.var_73f7a821 = spawn("trigger_radius", s_zone.origin, 0, s_zone.radius, s_zone.height);
	callback::on_spawned(&function_642c3b7a);
	level thread function_15a94953();
}

/*
	Name: function_642c3b7a
	Namespace: namespace_96b7f11d
	Checksum: 0x44F47243
	Offset: 0x6E10
	Size: 0x178
	Parameters: 0
	Flags: Linked
*/
function function_642c3b7a()
{
	self notify("4224b517887091ae");
	self endon("4224b517887091ae");
	level endon(#"end_game", #"hash_cee0ebf9c123cb9");
	self endon(#"death", #"disconnect");
	if(!isdefined(level.var_73f7a821))
	{
		return;
	}
	level.var_73f7a821 endon(#"death");
	self.var_9493a52c = 0;
	level thread function_7dc5b077(self);
	level thread function_1d123acd();
	while(true)
	{
		while(isdefined(self) && isdefined(level.var_73f7a821) && !self istouching(level.var_73f7a821))
		{
			waitframe(1);
		}
		function_5f6a508b(self);
		self function_70eca8d3();
		self.var_9493a52c = 0;
		function_882a2c43(self);
	}
}

/*
	Name: function_1d123acd
	Namespace: namespace_96b7f11d
	Checksum: 0x9B454A41
	Offset: 0x6F90
	Size: 0xC4
	Parameters: 0
	Flags: Linked
*/
function function_1d123acd()
{
	level endon(#"end_game");
	level.var_d58a6548 = 45;
	level clientfield::set("" + #"hash_6ecd61d493349ec0", 1);
	level flag::wait_till(#"hash_3814c5c6793e2b2d");
	level.var_d58a6548 = 30;
	level clientfield::set("" + #"hash_6ecd61d493349ec0", 2);
}

/*
	Name: function_70eca8d3
	Namespace: namespace_96b7f11d
	Checksum: 0x243D1264
	Offset: 0x7060
	Size: 0x1BE
	Parameters: 0
	Flags: Linked
*/
function function_70eca8d3()
{
	self notify("1a5dbb1b2a4b8974");
	self endon("1a5dbb1b2a4b8974");
	level endon(#"end_game", #"hash_cee0ebf9c123cb9");
	if(!isdefined(self))
	{
		return;
	}
	self endon(#"death", #"disconnect");
	timer = gettime() + (int(level.var_d58a6548 * 1000));
	while(isdefined(self) && isdefined(level.var_73f7a821) && self istouching(level.var_73f7a821))
	{
		if(is_true(self.laststand))
		{
			timer = gettime() + (int(level.var_d58a6548 * 1000));
		}
		if(gettime() > timer)
		{
			if((self clientfield::get_to_player("" + #"hash_4c2c37e44f9d6cf4")) != 2)
			{
				self clientfield::set_to_player("" + #"hash_4c2c37e44f9d6cf4", 2);
			}
			function_46932caa(self);
		}
		waitframe(1);
	}
}

/*
	Name: function_7dc5b077
	Namespace: namespace_96b7f11d
	Checksum: 0xBFD237CA
	Offset: 0x7228
	Size: 0x84
	Parameters: 1
	Flags: Linked
*/
function function_7dc5b077(e_player)
{
	self notify("2da3538b26396054");
	self endon("2da3538b26396054");
	level endon(#"end_game", #"hash_cee0ebf9c123cb9");
	if(!isdefined(e_player))
	{
		return;
	}
	e_player waittill(#"death");
	function_882a2c43(e_player, 0);
}

/*
	Name: function_5f6a508b
	Namespace: namespace_96b7f11d
	Checksum: 0xDFEC93C9
	Offset: 0x72B8
	Size: 0xCC
	Parameters: 1
	Flags: Linked
*/
function function_5f6a508b(e_player)
{
	if(!isdefined(e_player) || e_player flag::get(#"hash_d4826b65faa9efb"))
	{
		return;
	}
	e_player flag::set(#"hash_d4826b65faa9efb");
	e_player clientfield::set_to_player("" + #"hash_d4826b65faa9efb", 1);
	e_player clientfield::set_to_player("" + #"hash_4c2c37e44f9d6cf4", 1);
}

/*
	Name: function_882a2c43
	Namespace: namespace_96b7f11d
	Checksum: 0x25DC73AC
	Offset: 0x7390
	Size: 0xDC
	Parameters: 2
	Flags: Linked
*/
function function_882a2c43(e_player, var_468fde99)
{
	if(!isdefined(var_468fde99))
	{
		var_468fde99 = 1;
	}
	if(!isdefined(e_player) || (var_468fde99 && !e_player flag::get(#"hash_d4826b65faa9efb")))
	{
		return;
	}
	e_player flag::clear(#"hash_d4826b65faa9efb");
	e_player clientfield::set_to_player("" + #"hash_d4826b65faa9efb", 0);
	e_player clientfield::set_to_player("" + #"hash_4c2c37e44f9d6cf4", 0);
}

/*
	Name: function_aa863ff1
	Namespace: namespace_96b7f11d
	Checksum: 0x71E5B94D
	Offset: 0x7478
	Size: 0xB0
	Parameters: 0
	Flags: Linked
*/
function function_aa863ff1()
{
	level notify(#"hash_cee0ebf9c123cb9");
	foreach(player in function_a1ef346b())
	{
		level thread function_882a2c43(player, 0);
	}
}

/*
	Name: function_15a94953
	Namespace: namespace_96b7f11d
	Checksum: 0x1E841BEB
	Offset: 0x7530
	Size: 0x90
	Parameters: 0
	Flags: Linked
*/
function function_15a94953()
{
	foreach(player in function_a1ef346b())
	{
		player thread function_642c3b7a();
	}
}

/*
	Name: function_46932caa
	Namespace: namespace_96b7f11d
	Checksum: 0x6227F15E
	Offset: 0x75C8
	Size: 0x1BC
	Parameters: 2
	Flags: Linked
*/
function function_46932caa(e_player, var_98696959)
{
	/#
		if(is_true(level.var_4da195fc))
		{
			return;
		}
	#/
	if(!zm_utility::is_player_valid(e_player) || e_player flag::get(#"hash_5ff5159adfca3ce8"))
	{
		return;
	}
	e_player flag::set(#"hash_5ff5159adfca3ce8");
	level thread function_9bd73066(e_player);
	if(is_true(var_98696959))
	{
		var_9493a52c = min(e_player.var_9493a52c + 1, 15);
		e_player.var_9493a52c = var_9493a52c;
		n_damage = 30;
		if(var_9493a52c <= 10)
		{
			n_damage = 15;
			if(var_9493a52c <= 5)
			{
				n_damage = 5;
			}
		}
	}
	else
	{
		n_damage = 10;
	}
	e_player dodamage(n_damage, e_player.origin);
	var_b597becb = function_4d1e7b48(#"hash_63df7af5f4b05040");
	e_player thread status_effect::status_effect_apply(var_b597becb, undefined, e_player);
}

/*
	Name: function_9bd73066
	Namespace: namespace_96b7f11d
	Checksum: 0x1499E68E
	Offset: 0x7790
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function function_9bd73066(e_player)
{
	if(!isdefined(e_player))
	{
		return;
	}
	wait(1);
	if(isdefined(e_player))
	{
		e_player flag::clear(#"hash_5ff5159adfca3ce8");
	}
}

/*
	Name: function_4f3af205
	Namespace: namespace_96b7f11d
	Checksum: 0xA67ED95B
	Offset: 0x77E0
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function function_4f3af205()
{
	level endon(#"game_ended");
	level flag::wait_till("all_players_spawned");
	zombie_utility::set_zombie_var(#"below_world_check", -4000);
}

/*
	Name: function_5e6cac2d
	Namespace: namespace_96b7f11d
	Checksum: 0xC68F9696
	Offset: 0x7848
	Size: 0x158
	Parameters: 0
	Flags: Linked
*/
function function_5e6cac2d()
{
	var_e102fb58 = getentarray("local_electric_door", "script_noteworthy");
	foreach(door_trigger in var_e102fb58)
	{
		door_trigger sethintstring(#"hash_793db3dc20917334");
	}
	level flag::wait_till("power_on1");
	wait(5);
	foreach(door_trigger in var_e102fb58)
	{
		if(isdefined(door_trigger))
		{
			door_trigger delete();
		}
	}
}

/*
	Name: function_bf14bffe
	Namespace: namespace_96b7f11d
	Checksum: 0x23F8AE69
	Offset: 0x79A8
	Size: 0x2A6
	Parameters: 0
	Flags: Linked
*/
function function_bf14bffe()
{
	self notify("4d29f4e6a908da04");
	self endon("4d29f4e6a908da04");
	level endon(#"end_game");
	self endon(#"death", #"disconnect", #"hash_7f3f3b496fcd3707");
	level flag::wait_till_all([1:#"intro_scene_done", 0:#"load_main_complete"]);
	while(true)
	{
		var_1e8cb595 = undefined;
		if(self zm_zonemgr::is_player_in_zone(level.var_dc2ca204, 1))
		{
			var_1e8cb595 = bullettracepassed(self.origin, self.origin + vectorscale((0, 0, 1), 10000), 0, self);
		}
		if(is_true(var_1e8cb595) && !self flag::get(#"hash_1561f2d74277f5a1") && !is_true(self.var_16735873))
		{
			self flag::set(#"hash_1561f2d74277f5a1");
			self clientfield::set_to_player("" + #"hash_7c5d3ac35353f95c", 1);
		}
		else if(!is_true(var_1e8cb595) && self flag::get(#"hash_1561f2d74277f5a1"))
		{
			if(is_true(self.var_16735873))
			{
				n_value = 2;
			}
			else
			{
				n_value = 0;
			}
			self flag::clear(#"hash_1561f2d74277f5a1");
			self clientfield::set_to_player("" + #"hash_7c5d3ac35353f95c", n_value);
		}
		wait(1);
	}
}

/*
	Name: function_5e8470e6
	Namespace: namespace_96b7f11d
	Checksum: 0x840BDC29
	Offset: 0x7C58
	Size: 0xFE
	Parameters: 0
	Flags: Linked
*/
function function_5e8470e6()
{
	self notify("3c656837b69443b8");
	self endon("3c656837b69443b8");
	level endon(#"end_game");
	self endon(#"disconnect", #"death");
	var_1cf127f4 = 0;
	while(true)
	{
		if(var_1cf127f4)
		{
			if(!self zm_zonemgr::is_player_in_zone(level.var_dc2ca204))
			{
				exploder::exploder_stop("fxexp_sky_lightning");
				var_1cf127f4 = 0;
			}
		}
		else if(self zm_zonemgr::is_player_in_zone(level.var_dc2ca204))
		{
			exploder::exploder("fxexp_sky_lightning");
			var_1cf127f4 = 1;
		}
		wait(1);
	}
}

/*
	Name: function_4af68b
	Namespace: namespace_96b7f11d
	Checksum: 0xFEADDFD2
	Offset: 0x7D60
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
	Name: function_4cc5fca6
	Namespace: namespace_96b7f11d
	Checksum: 0x995989DD
	Offset: 0x7E48
	Size: 0xAC
	Parameters: 0
	Flags: Linked
*/
function function_4cc5fca6()
{
	level endon(#"end_game");
	level clientfield::set("" + #"hash_7b3ada6e5b1cf81e", 1);
	array::wait_till(function_a1ef346b(), "fasttravel_over", 15);
	level clientfield::set("" + #"hash_7b3ada6e5b1cf81e", 0);
}

/*
	Name: function_a648d1a6
	Namespace: namespace_96b7f11d
	Checksum: 0xEDDA9AE0
	Offset: 0x7F00
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_a648d1a6()
{
	self val::set(#"hash_29bdcb17a4141af3", "freezecontrols", 1);
}

/*
	Name: function_dc9b097c
	Namespace: namespace_96b7f11d
	Checksum: 0xB527BDFA
	Offset: 0x7F40
	Size: 0x3E
	Parameters: 0
	Flags: Linked
*/
function function_dc9b097c()
{
	self val::reset(#"hash_29bdcb17a4141af3", "freezecontrols");
	self notify(#"rappel_end");
}

/*
	Name: function_6eba65ea
	Namespace: namespace_96b7f11d
	Checksum: 0x86AC99
	Offset: 0x7F88
	Size: 0x4C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_6eba65ea()
{
	self clientfield::set("" + #"hash_73227fdae7d9bc0e", 1);
	self thread function_7015204c();
}

/*
	Name: function_7015204c
	Namespace: namespace_96b7f11d
	Checksum: 0x27FD95B2
	Offset: 0x7FE0
	Size: 0xBC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_7015204c(timeout)
{
	if(!isdefined(timeout))
	{
		timeout = 5;
	}
	level endon(#"end_game");
	self endon(#"disconnect");
	self notify("23e61aab55dc07e0");
	self endon("23e61aab55dc07e0");
	self waittilltimeout(timeout, #"death", #"rappel_end");
	self clientfield::set("" + #"hash_73227fdae7d9bc0e", 0);
}

/*
	Name: function_2420f30f
	Namespace: namespace_96b7f11d
	Checksum: 0x8D44D965
	Offset: 0x80A8
	Size: 0xE0
	Parameters: 0
	Flags: Linked
*/
function function_2420f30f()
{
	var_f45b8196 = getentarray("amp_rotate", "targetname");
	foreach(var_34f6451 in var_f45b8196)
	{
		if(isdefined(var_34f6451.script_int))
		{
			n_rotate = var_34f6451.script_int;
			var_34f6451 rotate((0, 0, n_rotate));
		}
	}
}

/*
	Name: function_2a73b31d
	Namespace: namespace_96b7f11d
	Checksum: 0xD21E8435
	Offset: 0x8190
	Size: 0xAC
	Parameters: 0
	Flags: Linked
*/
function function_2a73b31d()
{
	self val::set(#"lock_player_controls", "takedamage", 0);
	self val::set(#"lock_player_controls", "freezecontrols", 1);
	self val::set(#"lock_player_controls", "show_crosshair", 0);
	self val::set(#"lock_player_controls", "show_weapon_hud", 0);
}

/*
	Name: function_202a6698
	Namespace: namespace_96b7f11d
	Checksum: 0xCB4CC4A5
	Offset: 0x8248
	Size: 0xA4
	Parameters: 0
	Flags: Linked
*/
function function_202a6698()
{
	self val::reset(#"lock_player_controls", "takedamage");
	self val::reset(#"lock_player_controls", "freezecontrols");
	self val::reset(#"lock_player_controls", "show_crosshair");
	self val::reset(#"lock_player_controls", "show_weapon_hud");
}

/*
	Name: function_d81240c3
	Namespace: namespace_96b7f11d
	Checksum: 0x4F6D909C
	Offset: 0x82F8
	Size: 0xAC
	Parameters: 0
	Flags: Linked
*/
function function_d81240c3()
{
	level endon(#"game_ended");
	while(!isdefined(level.var_117d5f10))
	{
		waitframe(1);
	}
	level.var_117d5f10 clientfield::set("" + #"hash_66006a74a4ab8b8e", 1);
	level waittill(#"hash_4fbe4720f6f13107");
	level.var_117d5f10 clientfield::set("" + #"hash_66006a74a4ab8b8e", 0);
}

/*
	Name: function_96aabf2f
	Namespace: namespace_96b7f11d
	Checksum: 0x3F7E302C
	Offset: 0x83B0
	Size: 0x124
	Parameters: 0
	Flags: None
*/
function function_96aabf2f()
{
	/#
		if(!zm_utility::function_e51dc2d8())
		{
			return;
		}
		util::waittill_can_add_debug_command();
		util::function_e2e9d901("", "");
		util::function_e2e9d901("", "");
		util::function_e2e9d901("", "");
		util::function_e2e9d901("", "");
		level flag::wait_till_all([2:"", 1:"", 0:#"intro_scene_done"]);
		wait(2);
		level thread function_9b92c023();
	#/
}

/*
	Name: function_9b92c023
	Namespace: namespace_96b7f11d
	Checksum: 0xC6675831
	Offset: 0x84E0
	Size: 0x47E
	Parameters: 0
	Flags: None
*/
function function_9b92c023()
{
	/#
		while(true)
		{
			if(getdvarint(#"hash_3e6a88037f209b4d", 0) > 0)
			{
				if(!is_true(level.var_2c5f3bcc))
				{
					level function_dd3953d3();
					level.var_2c5f3bcc = 1;
				}
				setdvar(#"hash_3e6a88037f209b4d", 0);
			}
			if(getdvarint(#"hash_67ec344c88ecfcb", 0))
			{
				if(!is_true(level.var_a522b20f))
				{
					foreach(player in function_a1ef346b())
					{
						player function_e6b581e7(1);
					}
					level.var_a522b20f = 1;
				}
				setdvar(#"hash_67ec344c88ecfcb", 0);
			}
			if(getdvarint(#"hash_53838e0bdbb2e257", 0))
			{
				if(!is_true(level.var_4935bf9d))
				{
					foreach(player in function_a1ef346b())
					{
						player function_e6b581e7(0);
					}
					level.var_4935bf9d = 1;
				}
				setdvar(#"hash_53838e0bdbb2e257", 0);
			}
			if(getdvarint(#"hash_651f2f99447aa462", 0))
			{
				if(!is_true(level.var_c3788074))
				{
					level function_e4146082();
					level.var_c3788074 = 1;
				}
				setdvar(#"hash_651f2f99447aa462", 0);
			}
			if(getdvarint(#"hash_fac5f738960a49a", 0))
			{
				if(!is_true(level.var_438ef12b))
				{
					level function_f2a98fbe();
					level.var_438ef12b = 1;
				}
				setdvar(#"hash_fac5f738960a49a", 0);
			}
			if(getdvarint(#"hash_3a77e7ad0025555d", 0) > 0)
			{
				if(!is_true(level.var_d8315268))
				{
					n_round = getdvarint(#"hash_3a77e7ad0025555d", 0);
					level thread zombie_devgui_goto_round(n_round);
					level.var_d8315268 = 1;
				}
				setdvar(#"hash_3a77e7ad0025555d", 0);
			}
			waitframe(3);
		}
	#/
}

/*
	Name: function_dd3953d3
	Namespace: namespace_96b7f11d
	Checksum: 0x60C8826
	Offset: 0x8968
	Size: 0x1CC
	Parameters: 0
	Flags: None
*/
function function_dd3953d3()
{
	/#
		level function_58f27026();
		level thread function_42f2b8ac();
		level thread function_81acf2cf();
		switch(getdvarint(#"hash_3e6a88037f209b4d", 0))
		{
			case 1:
			default:
			{
				step_name = #"hash_2cec5bd1113224f4";
				break;
			}
			case 2:
			{
				step_name = #"hash_31e51b6600a81c68";
				break;
			}
			case 3:
			{
				step_name = #"hash_434b5ee7bea53369";
				break;
			}
			case 4:
			{
				step_name = #"hash_31740aafc81f583a";
				break;
			}
			case 5:
			{
				step_name = #"escort";
				break;
			}
			case 6:
			{
				step_name = #"end_fight";
				break;
			}
			case 7:
			{
				step_name = #"outro";
				break;
			}
		}
		level function_284985a5(#"hash_6deef93cdc13faf2", step_name);
	#/
}

/*
	Name: zombie_devgui_goto_round
	Namespace: namespace_96b7f11d
	Checksum: 0x7FAAF545
	Offset: 0x8B40
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
		namespace_a28acff3::set_round_number(target_round - 1);
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
	Namespace: namespace_96b7f11d
	Checksum: 0xA377A959
	Offset: 0x8D00
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
	Namespace: namespace_96b7f11d
	Checksum: 0x862CFCC8
	Offset: 0x9170
	Size: 0x3C
	Parameters: 0
	Flags: None
*/
function function_42f2b8ac()
{
	/#
		level flag::set("");
		zm_power::turn_power_on_and_open_doors(1, 0);
	#/
}

/*
	Name: function_81acf2cf
	Namespace: namespace_96b7f11d
	Checksum: 0xE00F8F2D
	Offset: 0x91B8
	Size: 0xC4
	Parameters: 0
	Flags: None
*/
function function_81acf2cf()
{
	/#
		level flag::wait_till("");
		ee = level.var_ec84950b[#"pap_quest"];
		while(!is_true(ee.started))
		{
			waitframe(1);
		}
		level thread function_abae9b3f(#"pap_quest");
		level flag::set("");
		namespace_f22a3322::function_2d12df62();
	#/
}

/*
	Name: function_abae9b3f
	Namespace: namespace_96b7f11d
	Checksum: 0xDF003379
	Offset: 0x9288
	Size: 0xD4
	Parameters: 1
	Flags: None
*/
function function_abae9b3f(ee_name)
{
	/#
		self endon(ee_name + "");
		ee = self.var_ec84950b[ee_name];
		if(ee.started)
		{
			for(i = 0; i <= ee.steps.size; i++)
			{
				while(ee.current_step <= i)
				{
					ee.steps[ee.current_step] notify(#"hash_74e7dcfac985bd3e");
					wait(0.5);
				}
			}
		}
		else
		{
			/#
				iprintlnbold("");
			#/
		}
	#/
}

/*
	Name: function_e6b581e7
	Namespace: namespace_96b7f11d
	Checksum: 0x658670AB
	Offset: 0x9368
	Size: 0x1AA
	Parameters: 1
	Flags: None
*/
function function_e6b581e7(var_9ff20235)
{
	/#
		level flag::wait_till("");
		start_weapon = self getcurrentweapon();
		self thread function_40985978(start_weapon);
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
		if(isdefined(start_weapon) && isdefined(start_weapon.name))
		{
			str_weapon_name = start_weapon.name;
		}
		else
		{
			str_weapon_name = array::random([5:"", 4:"", 3:"", 2:"", 1:"", 0:""]);
		}
		self function_749d2cfc(hash(str_weapon_name + var_7625b6cc), var_27751b99);
		self waittill(#"hash_69358718466f2118");
	#/
}

/*
	Name: function_40985978
	Namespace: namespace_96b7f11d
	Checksum: 0x3B0FA11E
	Offset: 0x9520
	Size: 0x26E
	Parameters: 1
	Flags: None
*/
function function_40985978(start_weapon)
{
	/#
		self waittill(#"hash_4de2d5115dc310e2");
		if(getdvarint(#"hash_651f2f99447aa462", 0) || getdvarint(#"hash_fac5f738960a49a", 0))
		{
			weapon_list = self getweaponslistprimaries();
			foreach(weapon in weapon_list)
			{
				if(weapon == start_weapon)
				{
					self switchtoweaponimmediate(weapon);
					self waittill(#"weapon_change_complete");
				}
			}
		}
		self thread zm_perks::function_29387491(#"hash_47d7a8105237c88");
		self thread zm_perks::function_29387491(#"hash_38c08136902fd553");
		self thread zm_perks::function_29387491(#"hash_210097a75bb6c49a");
		self thread zm_perks::function_29387491(#"hash_7f98b3dd3cce95aa");
		if(is_true(getgametypesetting(#"hash_4b8929fb898a9e80")))
		{
			self thread zm_perks::function_29387491(#"hash_3417450e1347185");
		}
		str_item_name = namespace_f999c142::function_ff28876a(3);
		self namespace_f999c142::function_923efc48(str_item_name, 3);
		self namespace_1cc7b406::function_52df229a(#"hash_7bc70addda19ca00");
		self notify(#"hash_69358718466f2118");
	#/
}

/*
	Name: function_749d2cfc
	Namespace: namespace_96b7f11d
	Checksum: 0xC6AC66DA
	Offset: 0x9798
	Size: 0x284
	Parameters: 2
	Flags: None
*/
function function_749d2cfc(str_item_name, var_27751b99)
{
	/#
		self endon(#"disconnect");
		if(!isdefined(str_item_name))
		{
			return;
		}
		point = function_4ba8fde(str_item_name);
		if(isdefined(point) && isdefined(var_27751b99) && isdefined(level.var_fee1eaaf))
		{
			var_e9c4fe29 = [[level.var_fee1eaaf]](point);
			if(isdefined(var_e9c4fe29))
			{
				point = var_e9c4fe29;
				point.var_a8bccf69 = var_27751b99;
			}
		}
		if(isdefined(point.var_a6762160.var_a53e9db0))
		{
			weapon = namespace_65181344::function_67456242(point.var_a6762160);
			dropitem = item_drop::drop_item(0, weapon, 1, weapon.maxammo, point.id, self.origin, self.angles, 1);
			dropitem.var_519e776c = 1;
			dropitem.var_8e092725 = 1;
			dropitem hide();
			self zm_weapons::function_98776900(dropitem, 0, 0, 1);
		}
		else
		{
			self zm_weapons::function_98776900(point, 0, 0, 1);
		}
		if(isdefined(var_27751b99))
		{
			self namespace_b376ff3f::function_d92c6b5b(self.currentweapon, 0);
			maxammo = self.currentweapon.maxammo;
			var_53b14ebf = self function_b7f1fd2c(self.currentweapon);
			self setweaponammoclip(self.currentweapon, var_53b14ebf);
			self setweaponammostock(self.currentweapon, maxammo);
			self notify(#"hash_75ec9942d2d5fd0f");
		}
		self waittill(#"weapon_change_complete");
		self function_fc6ae19f();
	#/
}

/*
	Name: function_fc6ae19f
	Namespace: namespace_96b7f11d
	Checksum: 0x686AA650
	Offset: 0x9A28
	Size: 0xF4
	Parameters: 0
	Flags: None
*/
function function_fc6ae19f()
{
	/#
		var_36cb1235 = array::random([4:"", 3:"", 2:"", 1:"", 0:""]);
		aat_name = ("" + var_36cb1235) + "";
		currentweapon = self namespace_b376ff3f::get_current_weapon();
		var_4657c1e0 = self namespace_b376ff3f::function_230ceec4(currentweapon);
		self zm_weapons::function_37e9e0cb(var_4657c1e0, currentweapon, aat_name);
	#/
}

/*
	Name: function_e4146082
	Namespace: namespace_96b7f11d
	Checksum: 0x49670956
	Offset: 0x9B28
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
	Namespace: namespace_96b7f11d
	Checksum: 0xBE169DAF
	Offset: 0x9BC8
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
	Name: function_f2a98fbe
	Namespace: namespace_96b7f11d
	Checksum: 0x7235BA6A
	Offset: 0x9C50
	Size: 0x98
	Parameters: 0
	Flags: None
*/
function function_f2a98fbe()
{
	/#
		foreach(player in function_a1ef346b())
		{
			player thread function_e4462dce();
		}
	#/
}

/*
	Name: function_e4462dce
	Namespace: namespace_96b7f11d
	Checksum: 0x7004E973
	Offset: 0x9CF0
	Size: 0x84
	Parameters: 0
	Flags: None
*/
function function_e4462dce()
{
	/#
		self endon(#"disconnect", #"death");
		while(self zm_utility::is_drinking())
		{
			wait(0.1);
		}
		self zm_weapons::weapon_give(getweapon(#"hash_69461751fa492ea4"), 1);
	#/
}

/*
	Name: function_284985a5
	Namespace: namespace_96b7f11d
	Checksum: 0xCB8CACC6
	Offset: 0x9D80
	Size: 0xC8
	Parameters: 2
	Flags: None
*/
function function_284985a5(ee_name, step_name)
{
	/#
		ee = self.var_ec84950b[ee_name];
		var_90adfb76 = namespace_ee206246::function_9212ff4d(ee_name, step_name);
		if(ee.started && var_90adfb76 <= ee.current_step)
		{
			return false;
		}
		ee.skip_to_step = var_90adfb76;
		if(ee.started)
		{
			function_905781df(ee_name);
		}
		else
		{
			level namespace_ee206246::start(ee.name);
		}
		return true;
	#/
}

/*
	Name: function_905781df
	Namespace: namespace_96b7f11d
	Checksum: 0x65AE62C8
	Offset: 0x9E58
	Size: 0xA4
	Parameters: 1
	Flags: None
*/
function function_905781df(ee_name)
{
	/#
		ee = self.var_ec84950b[ee_name];
		if(ee.started)
		{
			while(ee.current_step <= (ee.skip_to_step - 1))
			{
				ee.steps[ee.current_step] notify(#"hash_74e7dcfac985bd3e");
				wait(0.5);
			}
		}
		else
		{
			/#
				iprintlnbold("");
			#/
		}
	#/
}

/*
	Name: run_step
	Namespace: namespace_96b7f11d
	Checksum: 0x1F0ECA84
	Offset: 0x9F08
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
		step.var_24e42ded = 1;
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
	Namespace: namespace_96b7f11d
	Checksum: 0xF256247F
	Offset: 0xA148
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
		step endoncallback(&function_df365859, #"hash_74e7dcfac985bd3e");
		self notify(step.var_e788cdd7 + "");
		if(isdefined(step.var_6cc77d4e))
		{
			level namespace_ee206246::objective_set(step.var_6cc77d4e, step.a_targets, undefined, step.str_objective_text);
		}
		[[step.setup_func]](var_5ea5c94d);
		step.completed = 1;
		if(isdefined(step.var_6cc77d4e))
		{
			level namespace_ee206246::objective_complete(step.var_6cc77d4e, step.a_targets);
		}
		self notify(step.var_e788cdd7 + "");
	#/
}

/*
	Name: function_df365859
	Namespace: namespace_96b7f11d
	Checksum: 0x9DFE4245
	Offset: 0xA2A8
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
			level namespace_ee206246::objective_complete(self.var_6cc77d4e, self.a_targets);
		}
		waittillframeend();
		self.ee.owner notify(self.var_e788cdd7 + "");
		self.ee.owner notify(self.var_e788cdd7 + "");
	#/
}

/*
	Name: function_23031ae8
	Namespace: namespace_96b7f11d
	Checksum: 0x2457F40F
	Offset: 0xA350
	Size: 0x214
	Parameters: 2
	Flags: None
*/
function function_23031ae8(ee_name, var_f2c264bb)
{
	/#
		if(isentity(self))
		{
			self endon(#"death");
			self endon(#"disconnect");
		}
		self endon(#"game_ended");
		ee = self.var_ec84950b[ee_name];
		step = ee.steps[var_f2c264bb];
		if(function_284985a5(ee_name, step.name))
		{
			if(!step.started)
			{
				wait_time = 10 * ee.steps.size;
				waitresult = undefined;
				waitresult = self waittilltimeout(wait_time, step.var_e788cdd7 + "");
				if(waitresult._notify == #"timeout")
				{
					/#
						iprintlnbold((("" + function_9e72a96(ee_name)) + "") + function_9e72a96(ee.steps[ee.current_step].name));
					#/
					return;
				}
			}
			wait(1);
		}
		/#
			iprintlnbold((("" + function_9e72a96(ee.name)) + "") + function_9e72a96(ee.steps[ee.current_step].name) + "");
		#/
		function_905781df(ee_name);
	#/
}

/*
	Name: function_33833303
	Namespace: namespace_96b7f11d
	Checksum: 0x80F724D1
	Offset: 0xA570
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function function_33833303()
{
}

/*
	Name: function_a7ba2448
	Namespace: namespace_96b7f11d
	Checksum: 0x5C066A5
	Offset: 0xA580
	Size: 0x136
	Parameters: 0
	Flags: Linked
*/
function function_a7ba2448()
{
	self notify("3008a6d5e44bd2e9");
	self endon("3008a6d5e44bd2e9");
	level endon(#"end_game");
	self endon(#"death", #"disconnect");
	while(true)
	{
		util::waittill_any_ents(self, "zone_change", level, "end_of_round");
		if(self.cached_zone_name === "zone_burger_town")
		{
			var_b7f7d612 = level.round_number;
			while(self.cached_zone_name === "zone_burger_town")
			{
				util::waittill_any_ents(self, "zone_change", level, "end_of_round");
				if((level.round_number - var_b7f7d612) >= 5)
				{
					self zm_stats::increment_challenge_stat(#"hash_78e5512f079af452");
					return;
				}
			}
		}
	}
}

/*
	Name: function_daaf54cb
	Namespace: namespace_96b7f11d
	Checksum: 0xC0C1223C
	Offset: 0xA6C0
	Size: 0x1EE
	Parameters: 0
	Flags: Linked
*/
function function_daaf54cb()
{
	self notify("5dc2bc18d910c27c");
	self endon("5dc2bc18d910c27c");
	level endon(#"end_game");
	self endon(#"death", #"disconnect");
	while(true)
	{
		util::waittill_any_ents(self, "zone_change", level, "end_of_round");
		if(self.cached_zone_name === "zone_helipads" || self.cached_zone_name === "zone_helipads_2" || self.cached_zone_name === "zone_helipads_3" || self.cached_zone_name === "zone_helipads_4" || self.cached_zone_name === "zone_helipads_portal_room")
		{
			var_b7f7d612 = level.round_number;
			while(self.cached_zone_name === "zone_helipads" || self.cached_zone_name === "zone_helipads_2" || self.cached_zone_name === "zone_helipads_3" || self.cached_zone_name === "zone_helipads_4" || self.cached_zone_name === "zone_helipads_portal_room")
			{
				util::waittill_any_ents(self, "zone_change", level, "end_of_round");
				if((level.round_number - var_b7f7d612) >= 10)
				{
					self zm_stats::increment_challenge_stat(#"hash_268fa1d97a2fab27");
					return;
				}
			}
		}
	}
}

/*
	Name: function_9bd5841
	Namespace: namespace_96b7f11d
	Checksum: 0x8EF4AEFF
	Offset: 0xA8B8
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_9bd5841()
{
	self zm_stats::function_7ec42fbf(#"hash_7157c967c371c77c");
}

/*
	Name: function_f2763418
	Namespace: namespace_96b7f11d
	Checksum: 0xC61F096
	Offset: 0xA8E8
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function function_f2763418()
{
	level endon(#"end_game");
	level flag::wait_till("start_zombie_round_logic");
	level thread function_d164bea5();
	level thread function_2c6be4e1();
}

/*
	Name: function_d164bea5
	Namespace: namespace_96b7f11d
	Checksum: 0xBCEFAFB0
	Offset: 0xA958
	Size: 0x160
	Parameters: 0
	Flags: Linked
*/
function function_d164bea5()
{
	level endon(#"end_game");
	var_fd50ba9e = getnodearray("traversal_node_burger_town", "targetname");
	foreach(var_881969c in var_fd50ba9e)
	{
		unlinktraversal(var_881969c);
	}
	level flag::wait_till("connect_burger_town");
	foreach(var_881969c in var_fd50ba9e)
	{
		linktraversal(var_881969c);
	}
}

/*
	Name: function_2c6be4e1
	Namespace: namespace_96b7f11d
	Checksum: 0x915DEE0D
	Offset: 0xAAC0
	Size: 0x160
	Parameters: 0
	Flags: Linked
*/
function function_2c6be4e1()
{
	level endon(#"end_game");
	var_ed68b18b = getnodearray("traversal_node_pizza_parlor", "targetname");
	foreach(var_97ac2838 in var_ed68b18b)
	{
		unlinktraversal(var_97ac2838);
	}
	level flag::wait_till("connect_pizza_parlor");
	foreach(var_97ac2838 in var_ed68b18b)
	{
		linktraversal(var_97ac2838);
	}
}

/*
	Name: function_994637d8
	Namespace: namespace_96b7f11d
	Checksum: 0xF8BEBE55
	Offset: 0xAC28
	Size: 0xE8
	Parameters: 1
	Flags: Linked
*/
function function_994637d8(str_flag)
{
	if(!isdefined(level.var_776c1ce1))
	{
		level.var_776c1ce1 = array(#"hash_3e765c26047c9f54", "rbz_exfil_beacon_active");
	}
	if(!isdefined(level.var_776c1ce1))
	{
		level.var_776c1ce1 = [];
	}
	else if(!isarray(level.var_776c1ce1))
	{
		level.var_776c1ce1 = array(level.var_776c1ce1);
	}
	if(!isinarray(level.var_776c1ce1, str_flag))
	{
		level.var_776c1ce1[level.var_776c1ce1.size] = str_flag;
	}
}

/*
	Name: function_835bb4a7
	Namespace: namespace_96b7f11d
	Checksum: 0xD6245495
	Offset: 0xAD18
	Size: 0xF0
	Parameters: 0
	Flags: Linked
*/
function function_835bb4a7()
{
	if(level flag::get(#"hash_709701a349515bd7") || level flag::get(#"hash_561302e48877300e") || level flag::get(#"hash_1695615ee9fcfe29") || level flag::get(#"hash_6de3a0458517d4ad") || level flag::get(#"hash_4be36d666c75b752") || is_true(function_89950a23()))
	{
		return true;
	}
	return false;
}

/*
	Name: function_1fd1da2b
	Namespace: namespace_96b7f11d
	Checksum: 0x7C541B04
	Offset: 0xAE10
	Size: 0xF6
	Parameters: 1
	Flags: Linked
*/
function function_1fd1da2b(var_92310804)
{
	if(!isdefined(var_92310804))
	{
		var_92310804 = 1;
	}
	if(var_92310804 && function_89950a23())
	{
		return true;
	}
	if(isdefined(level.var_776c1ce1.size) && level.var_776c1ce1.size != 0)
	{
		foreach(str_flag in level.var_776c1ce1)
		{
			if(level flag::get(str_flag))
			{
				return true;
			}
		}
		return false;
	}
	return false;
}

/*
	Name: function_89950a23
	Namespace: namespace_96b7f11d
	Checksum: 0xE5DFAA5
	Offset: 0xAF10
	Size: 0xA2
	Parameters: 0
	Flags: Linked
*/
function function_89950a23()
{
	foreach(e_player in getplayers())
	{
		if(e_player flag::get(#"hash_467e4279ccacfd8a"))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_4c324227
	Namespace: namespace_96b7f11d
	Checksum: 0x4505F7B1
	Offset: 0xAFC0
	Size: 0x78
	Parameters: 1
	Flags: Linked, Private
*/
function private function_4c324227(var_5e1c5c6d)
{
	a_s_locs = [];
	for(i = 0; i < 4; i++)
	{
		a_s_locs[i] = struct::get((var_5e1c5c6d + "_") + i, "targetname");
	}
	return a_s_locs;
}

/*
	Name: function_d4738f46
	Namespace: namespace_96b7f11d
	Checksum: 0x4A8D274
	Offset: 0xB040
	Size: 0x7C8
	Parameters: 0
	Flags: Linked
*/
function function_d4738f46()
{
	level endon(#"end_game");
	var_18e0dde5 = [];
	array::add(var_18e0dde5, getent("vol_player_in_intermission_space", "targetname"));
	array::add(var_18e0dde5, getent("vol_player_on_ground", "targetname"));
	array::add(var_18e0dde5, getent("vol_player_in_bunker", "targetname"));
	var_1d1bbd52[#"hash_32dfe21b4b983a5d"] = function_4c324227("main_street_to_helipads_end");
	var_1d1bbd52[#"hash_3d8c7ec25b02d4f1"] = function_4c324227("anytown_usa_to_main_street_end");
	var_1d1bbd52[#"hash_2e6796ab3a32706f"] = function_4c324227("main_street_to_anytown_usa_end");
	var_1d1bbd52[#"hash_e90df2ca25fbd31"] = function_4c324227("anytown_usa_to_bunker_end");
	var_1d1bbd52[#"hash_10867d96a0793a37"] = function_4c324227("helipads_to_main_street_end");
	var_1d1bbd52[#"hash_5fc30c4b8c9bfde9"] = function_4c324227("bunker_to_observation_end");
	var_1d1bbd52[#"hash_166fe534402b9b58"] = function_4c324227("helipads_to_observation_end");
	var_1d1bbd52[#"hash_4f67bbef6c02e1ce"] = function_4c324227("observation_to_helipads_end");
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
			if(is_true(player.var_f22c83f5))
			{
				continue;
			}
			if(!player zm_player::in_life_brush() && (player zm_player::in_kill_brush() || !player zm_player::in_enabled_playable_area() || (isdefined(level.player_out_of_playable_area_override) && is_true(player [[level.player_out_of_playable_area_override]]()))) && !is_true(player.var_2c27f919) && !player scene::is_igc_active())
			{
				var_96110541 = 0;
				foreach(var_ef325671 in var_18e0dde5)
				{
					if(istouching(player.origin, var_ef325671))
					{
						var_96110541 = 1;
						break;
					}
				}
				if(var_96110541)
				{
					continue;
				}
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
				foreach(var_94c758f2 in var_1d1bbd52)
				{
					n_dist = distance2d(player.origin, var_94c758f2[0].origin);
					if(n_dist < n_closest_dist)
					{
						n_closest_dist = n_dist;
						var_2ed46675 = var_94c758f2;
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
		wait(0.4);
	}
}

/*
	Name: function_19441a5a
	Namespace: namespace_96b7f11d
	Checksum: 0x9FD0278D
	Offset: 0xB810
	Size: 0xC2
	Parameters: 1
	Flags: Linked
*/
function function_19441a5a(players)
{
	potential_targets = [];
	foreach(player in players)
	{
		if(function_caddca10(player))
		{
			array::add(potential_targets, player);
		}
	}
	return array::random(potential_targets);
}

/*
	Name: function_caddca10
	Namespace: namespace_96b7f11d
	Checksum: 0x4DDCD4A6
	Offset: 0xB8E0
	Size: 0x6E
	Parameters: 1
	Flags: Linked
*/
function function_caddca10(player)
{
	if(!isdefined(player))
	{
		return 0;
	}
	var_2942900 = player flag::get(#"hash_5b86982b4c9c8c5") || player flag::get(#"hash_1d5bd82de65c5fe0");
	return !var_2942900;
}

/*
	Name: function_37597f29
	Namespace: namespace_96b7f11d
	Checksum: 0x4B89B3F4
	Offset: 0xB958
	Size: 0xA4
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
		zm_devgui::add_custom_devgui_callback(&cmd);
	#/
}

/*
	Name: cmd
	Namespace: namespace_96b7f11d
	Checksum: 0xBAC041F0
	Offset: 0xBA08
	Size: 0x102
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
			case "hash_41ed3803afaf6e4a":
			{
				namespace_e502fca8::function_1d310878();
				break;
			}
			case "hash_1f1d6a652126f2f":
			{
				level.var_4da195fc = 1;
				break;
			}
			case "hash_11cc5cc057abb4a0":
			{
				level.var_4da195fc = 0;
				break;
			}
			case "hash_57b9473a38039ff0":
			{
				function_71a6c3ea();
				level thread namespace_a8dddac2::function_2f0a2ce2();
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
	Namespace: namespace_96b7f11d
	Checksum: 0xD2E3A2F0
	Offset: 0xBB18
	Size: 0xC4
	Parameters: 0
	Flags: None
*/
function function_71a6c3ea()
{
	/#
		level notify(#"hash_50d92ca3c6c7c2a8");
		level.var_f925c697 = 1;
		zm_devgui::zombie_devgui_open_sesame();
		level thread namespace_ee206246::function_f2dd8601(#"pap_quest", namespace_ee206246::function_9212ff4d(#"pap_quest", #"hash_42541c1c30ef6ea8"));
		level flag::set("");
		namespace_f22a3322::function_2d12df62();
	#/
}

/*
	Name: function_5a3997b4
	Namespace: namespace_96b7f11d
	Checksum: 0x247A9B59
	Offset: 0xBBE8
	Size: 0x8C
	Parameters: 0
	Flags: None
*/
function function_5a3997b4()
{
	/#
		level endon(#"end_game", #"hash_50d92ca3c6c7c2a8");
		level waittill(#"open_sesame");
		namespace_e502fca8::function_8ac7a154();
		zm_power::turn_power_on_and_open_doors(1, 0);
		level flag::clear(#"disable_weapon_machine");
	#/
}

