#using script_85cd2e9a28ea8a1;
#using script_3dc93ca9902a9cda;
#using script_1292451e284848cc;
#using script_7cf3e180e994d17f;
#using script_1aa56b3bc89b63e5;
#using script_3de86a21a0c8d47b;
#using script_35e4637ff0faed7f;
#using script_31e9b35aaacbbd93;
#using script_61cfc2ab8e60625;
#using script_73e0d5e10c6348fa;
#using scripts\cp_common\gametypes\globallogic_ui.gsc;
#using scripts\cp_common\util.gsc;
#using scripts\cp_common\skipto.gsc;
#using script_32399001bdb550da;
#using script_35ae72be7b4fec10;
#using scripts\core_common\lui_shared.gsc;
#using script_1883fa4e60abbf9f;
#using script_37f9ff47f340fbe8;
#using scripts\core_common\colors_shared.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\cp_common\objectives.gsc;
#using script_263b7f2982258785;
#using script_2d443451ce681a;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\music_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace namespace_a19fe693;

/*
	Name: function_cfc8e856
	Namespace: namespace_a19fe693
	Checksum: 0xD0FB1FDE
	Offset: 0xB00
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_cfc8e856()
{
	level notify(-625759955);
}

#namespace tkdn_af_hill;

/*
	Name: starting
	Namespace: tkdn_af_hill
	Checksum: 0xD2E51276
	Offset: 0xB20
	Size: 0x164
	Parameters: 1
	Flags: Linked
*/
function starting(str_skipto)
{
	function_a2015343(str_skipto);
	plane = namespace_b100dd86::function_5431431d();
	namespace_b100dd86::function_c8381339(plane, 0);
	exploder::stop_exploder("airfield_assault_lighting_noplane");
	exploder::exploder("airfield_assault_lighting");
	namespace_b100dd86::function_5aabc3fb();
	exploder::exploder("hit3_prop_mist");
	player = getplayers()[0];
	player namespace_db2381c4::function_c8bc54e4();
	exploder::activate_radiant_exploder("airfield_intro_lights");
	thread namespace_a052577e::function_a42cfb58();
	var_19a8c4d9 = vehicle::simple_spawn_and_drive("plane_flyover");
	level thread scene::play_from_time("scene_tkd_hit3_intro", "shot 1", undefined, 1, 1, 1, 0, 0);
}

/*
	Name: main
	Namespace: tkdn_af_hill
	Checksum: 0x4732DA97
	Offset: 0xC90
	Size: 0xE94
	Parameters: 2
	Flags: Linked
*/
function main(str_skipto, b_starting)
{
	if(!isdefined(level objectives::function_285e460("af_follow_adler", level.adler)))
	{
		level objectives::follow("af_follow_adler", level.adler, undefined, 0, 0);
	}
	hidden = [];
	hidden[#"prone"] = 50;
	hidden[#"crouch"] = 200;
	hidden[#"stand"] = 400;
	spotted = [];
	spotted[#"prone"] = 200;
	spotted[#"crouch"] = 400;
	spotted[#"stand"] = 800;
	namespace_979752dc::set_detect_ranges(hidden, spotted);
	setdvar(#"hash_62b11f12963c68d4", 1200);
	thread function_61f33d07();
	util::function_3e65fe0b(1);
	guys = namespace_b100dd86::array_spawn("af_intro_enemies", "script_noteworthy");
	level thread scene::play("scene_tkd_hit3_intro_overlook_adler", [0:level.adler]);
	level thread scene::play("scene_tkd_hit3_intro_overlook_woods", [0:level.woods]);
	level thread scene::play("scene_tkd_hit3_intro_overlook", "initial_loop");
	level thread scene::play("scene_tkd_hit3_intro_overlook_enemy4", "initial_loop");
	level thread function_5dd4ff85();
	thread function_f7c7ce51();
	player = getplayers()[0];
	level.player = player;
	player endon(#"death");
	level.var_49a5d2a4 = getvehiclearray("af_chase_veh", "targetname")[0];
	level.var_49a5d2a4 val::set(#"hash_57927fe94524d139", "allowdeath", 0);
	thread function_cc465a2(player);
	level.player val::set(#"overlook", "ignoreme", 1);
	level.adler val::set(#"overlook", "ignoreme", 1);
	setdvar(#"hash_76c0d7e6385ee6de", 0.05);
	level.adler ai::set_behavior_attribute("demeanor", "cqb");
	level.woods ai::set_behavior_attribute("demeanor", "cqb");
	array::thread_all(guys, &namespace_979752dc::function_2324f175, 0);
	level flag::wait_till("af_start_overlook_scene");
	level flag::wait_till_all_timeout(8, [1:"af_adler_at_overlook", 0:"af_woods_at_overlook"]);
	thread handle_intro_dialog();
	clips = getentarray("plane_floor_clip", "targetname");
	foreach(clip in clips)
	{
		clip disconnectpaths(0, 1);
	}
	level music::setmusicstate("b2.0_recon", undefined, 6);
	snd::function_7db65a93("snd_overlook_scene");
	waitframe(1);
	level.player val::reset(#"overlook", "ignoreme");
	player waittill(#"camera_up");
	level.var_2762a9c sethighdetail(1);
	level.var_2713b408 sethighdetail(1);
	af_enemy4 = getaiarray("af_enemy4", "targetname")[0];
	af_enemy4 sethighdetail(1);
	level notify(#"hash_186d95ebb54fca9f");
	level thread scene::play("scene_tkd_hit3_intro_overlook_arash", "overlook_shot", [0:level.var_2713b408]);
	level thread scene::play("scene_tkd_hit3_intro_overlook_adler", "overlook_shot", [1:level.adler, 0:level.woods]);
	level thread scene::play("scene_tkd_hit3_intro_overlook", "overlook_shot");
	level thread util::delay("play_b3.0_iced_mus", undefined, &music::playstinger, "b3.0_iced");
	level thread util::delay("play_b3.0_iced_mus", undefined, &music::setmusicstate, "b4.0_hold_fire");
	level thread util::delay("play_b4.1_identify_mus", undefined, &music::playstinger, "b4.1_identify");
	level waittill(#"start_sniping", #"hash_380fe6172e5e75ed");
	level flag::set("start_sniping");
	snd::function_7db65a93("start_sniping");
	thread function_4bc0b384(player);
	thread function_7a77e3be(player);
	thread function_84d4429e(player);
	res = undefined;
	res = player waittilltimeout(10, #"end_binocs", #"weapon_change", #"weapon_fired");
	if(res._notify != #"timeout")
	{
		if(res._notify != #"weapon_fired")
		{
			res = undefined;
			res = player waittilltimeout(10, #"weapon_fired");
		}
	}
	level flag::set("end_binocs");
	player notify(#"end_binocs");
	if(res._notify != #"timeout")
	{
		level music::setmusicstate("none");
		level music::playstinger("b4.2_shot");
		var_7810080a = undefined;
		var_7810080a = level.var_2713b408 waittilltimeout(0.5, #"hash_ae39942308147bf", #"damage");
	}
	level notify(#"hash_1a8ccb31e7a09c0e");
	level.var_2713b408 val::set("hack", "takedamage", 0);
	player val::reset(#"overlook", "disable_weapon_cycling");
	level music::setmusicstate("b5.0_battle");
	util::delay(0.1, undefined, &function_31afa2db);
	if(level flag::get("perfect_sniper_spot") && isdefined(var_7810080a) && var_7810080a._notify == "damage")
	{
		function_32398bfb(player);
		thread function_4f024edb();
	}
	else
	{
		if(isdefined(var_7810080a) && var_7810080a._notify == #"hash_ae39942308147bf")
		{
			level thread scene::play("scene_tkd_hit3_intro_overlook_arash", "hit", [0:level.var_2713b408]);
			level thread scene::play("scene_tkd_hit3_intro_overlook_enemy4", "hit");
			level.var_2713b408 waittill(#"hash_3d799b8c342663fa");
			level thread scene::play("scene_tkd_hit3_intro_overlook_arash", "hit_impact", [0:level.var_2713b408]);
			level thread scene::play("scene_tkd_hit3_intro_overlook_enemy4", "hit_impact");
			snd::function_7db65a93(#"hash_1797695d0ca67ad8");
			level.var_2713b408 waittill(#"hash_377b8997737880e7");
			level flag::set("arash_in_plane");
			thread function_4f024edb();
		}
		else
		{
			af_enemy4 sethighdetail(0);
			level notify(#"hash_36f87644d590f542");
			level thread scene::play("scene_tkd_hit3_intro_overlook_arash", "hit_impact", [0:level.var_2713b408]);
			level thread scene::play("scene_tkd_hit3_intro_overlook_enemy4", "miss");
			thread function_4f024edb();
		}
	}
	level.var_2762a9c sethighdetail(0);
	util::function_3e65fe0b(0);
	thread function_254c9ae();
	thread tkdn_af_chase::function_9d8f5cd3();
	waitframe(1);
	savegame::function_7790f03(1);
	level flag::wait_till_any([1:"woods_to_truck", 0:"overlook_guys_done"]);
	if(!level flag::get("player_break_stealth_fired"))
	{
		level flag::set("af_hill_complete");
	}
	else
	{
		level flag::wait_till("forever");
	}
	level flag::wait_till("arash_in_plane");
	if(isdefined(b_starting))
	{
		skipto::objective_completed(b_starting);
	}
}

/*
	Name: function_84d4429e
	Namespace: tkdn_af_hill
	Checksum: 0x8CDD07B6
	Offset: 0x1B30
	Size: 0x38
	Parameters: 1
	Flags: Linked
*/
function function_84d4429e(player)
{
	level waittill(#"player_break_stealth_tarmac");
	player notify(#"weapon_fired");
}

/*
	Name: function_4f024edb
	Namespace: tkdn_af_hill
	Checksum: 0x44A20FF5
	Offset: 0x1B70
	Size: 0x11C
	Parameters: 0
	Flags: Linked
*/
function function_4f024edb()
{
	level.var_fac9425c stopanimscripted();
	var_2d1826f9 = getaiarray("af_enemy3", "targetname")[0];
	if(isalive(var_2d1826f9))
	{
		var_2d1826f9 stopanimscripted();
		var_2d1826f9 thread scene::play("scene_tkd_hit3_intro_overlook_guy3", "react_shot", [0:var_2d1826f9]);
	}
	level scene::play("scene_tkd_hit3_intro_overlook", "hit", [0:level.var_fac9425c]);
	af_enemy4 = getaiarray("af_enemy4", "targetname")[0];
	function_9967d19b(af_enemy4);
}

/*
	Name: function_ca9dd78b
	Namespace: tkdn_af_hill
	Checksum: 0x56355E75
	Offset: 0x1C98
	Size: 0xB0
	Parameters: 0
	Flags: Linked
*/
function function_ca9dd78b()
{
	level endon(#"hash_1a8ccb31e7a09c0e");
	while(true)
	{
		level flag::wait_till_clear("perfect_sniper_spot");
		level.var_2713b408 snipercam::function_6e29b7f1(1, 1, 2);
		level flag::wait_till("perfect_sniper_spot");
		level.var_2713b408 snipercam::function_6e29b7f1(0, 1, 2);
	}
}

/*
	Name: function_32398bfb
	Namespace: tkdn_af_hill
	Checksum: 0xEE7FBCFC
	Offset: 0x1D50
	Size: 0x332
	Parameters: 1
	Flags: Linked
*/
function function_32398bfb(player)
{
	guy = getaiarray("af_enemy4", "targetname")[0];
	guy stopanimscripted();
	level.var_2713b408 stopanimscripted();
	player.holdingbreath = undefined;
	setslowmotion(1, 0.5, 0);
	player_org = player.origin;
	player_ang = player.angles;
	var_ca71a1c8 = "black";
	thread namespace_61e6d095::function_28027c42(#"hash_4fe4ea6c5e05ffb7");
	exploder::exploder("airfield_sniper_bullet_light");
	level thread scene::play("scene_tkd_hit3_intro_overlook_bullet_cam", "fancy_bulletcam", [0:level.var_2713b408]);
	snd::function_7db65a93(#"hash_1533b6e574c5cfe7");
	level waittill(#"hash_387a7c439d244e6b");
	screenshake(player_org, 0.2, 2, 0, 0.33, 0, -1, 0, 12.5, 40, 0, 4);
	exploder::stop_exploder("airfield_sniper_bullet_light");
	level waittill(#"hash_57e0731c62f19ce1");
	setslowmotion(0.5, 1, 0.4);
	level waittill(#"hash_43ffc7bf753fe848");
	level thread lui::screen_fade_out(0, "black");
	level util::delay(0.005, undefined, &lui::screen_fade_in, 0, "black");
	player stopanimscripted(0, 1);
	level flag::set("arash_in_plane");
	snd::function_7db65a93(#"hash_3620fe1626778dde");
	waitframe(1);
	player setorigin(player_org);
	player setplayerangles(player_ang);
	namespace_61e6d095::function_4279fd02(#"hash_4fe4ea6c5e05ffb7");
	waitframe(1);
}

/*
	Name: function_c8a35cef
	Namespace: tkdn_af_hill
	Checksum: 0xB7A63632
	Offset: 0x2090
	Size: 0x74
	Parameters: 0
	Flags: None
*/
function function_c8a35cef()
{
	setdvar(#"hash_252e699c41531f1a", 2);
	setdvar(#"hash_38c17ad45d6603c0", 1);
	setdvar(#"hash_1e892dbf6ecb7caa", 0);
}

/*
	Name: function_b0d8b75
	Namespace: tkdn_af_hill
	Checksum: 0x2319CFEA
	Offset: 0x2110
	Size: 0x7C
	Parameters: 0
	Flags: None
*/
function function_b0d8b75()
{
	setdvar(#"hash_252e699c41531f1a", -1);
	setdvar(#"hash_38c17ad45d6603c0", 0.2);
	setdvar(#"hash_1e892dbf6ecb7caa", 0.75);
}

/*
	Name: function_5dd4ff85
	Namespace: tkdn_af_hill
	Checksum: 0x2E68DBE7
	Offset: 0x2198
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function function_5dd4ff85()
{
	level waittill(#"hash_59132013626fbab6");
	level thread scene::play("scene_tkd_hit3_intro_overlook_enemy4", "overlook_shot");
}

/*
	Name: function_31afa2db
	Namespace: tkdn_af_hill
	Checksum: 0x1162B368
	Offset: 0x21E8
	Size: 0xE4
	Parameters: 0
	Flags: Linked
*/
function function_31afa2db()
{
	primary_weapon = getweapon(#"ar_standard_t9");
	if(level.player hasweapon(primary_weapon))
	{
		level.player switchtoweaponimmediate(primary_weapon, 1);
	}
	else
	{
		weaps = level.player getweaponslistprimaries();
		level.player switchtoweaponimmediate(weaps[0], 1);
	}
	level.player setmovespeedscale(1);
}

/*
	Name: function_254c9ae
	Namespace: tkdn_af_hill
	Checksum: 0xEEEA77A1
	Offset: 0x22D8
	Size: 0x12C
	Parameters: 0
	Flags: Linked
*/
function function_254c9ae()
{
	level flag::set("keep_going");
	level.player val::reset(#"overlook", "ignoreme");
	level.adler thread function_b432f86a("adler_tarmac_combat");
	level.woods thread function_b432f86a("woods_tarmac_combat");
	level scene::play("scene_tkd_hit3_intro_overlook_adler", "hit", [1:level.adler, 0:level.woods]);
	waitframe(1);
	trigger::use("approach_airstrip", "targetname", undefined, 0);
	level flag::set("overlook_guys_done");
}

/*
	Name: function_b432f86a
	Namespace: tkdn_af_hill
	Checksum: 0xCD2683B0
	Offset: 0x2410
	Size: 0x10C
	Parameters: 1
	Flags: Linked
*/
function function_b432f86a(nodename)
{
	if(self == level.woods)
	{
		level endon(#"woods_to_truck");
	}
	self flag::wait_till_clear(#"scriptedanim");
	self stopanimscripted();
	self val::reset(#"overlook", "ignoreme");
	self val::reset(#"radiant", "ignoreall");
	self val::reset(#"airfield", "ignoreall");
	self ai::set_goal(nodename, "targetname", 1);
}

/*
	Name: function_7a77e3be
	Namespace: tkdn_af_hill
	Checksum: 0xA1B1A462
	Offset: 0x2528
	Size: 0xBE
	Parameters: 1
	Flags: Linked
*/
function function_7a77e3be(player)
{
	player thread util::show_hint_text(#"hash_1e0dbfcb374f641c", 0, "end_binocs", -1);
	while(true)
	{
		if(player weaponswitchbuttonpressed() || player buttonbitstate("BUTTON_BIT_ANY_WEAP_CHANGE"))
		{
			level flag::set("end_binocs");
			player notify(#"end_binocs");
			break;
		}
		waitframe(1);
	}
}

/*
	Name: function_4bc0b384
	Namespace: tkdn_af_hill
	Checksum: 0xAC87CCE7
	Offset: 0x25F0
	Size: 0xEC
	Parameters: 1
	Flags: Linked
*/
function function_4bc0b384(player)
{
	player waittill(#"end_binocs");
	player val::reset(#"overlook", "disable_weapon_cycling");
	sniper = getweapon(#"sniper_quickscope_t9");
	player seteverhadweaponall(1);
	player initialweaponraise(sniper);
	player switchtoweapon(sniper);
	waitframe(1);
	player takeweapon(level.var_42db149f);
}

/*
	Name: function_ef1d8a47
	Namespace: tkdn_af_hill
	Checksum: 0x46136DA0
	Offset: 0x26E8
	Size: 0x98
	Parameters: 0
	Flags: None
*/
function function_ef1d8a47()
{
	plane = getent("cargo_plane", "targetname");
	while(plane != undefined)
	{
		org = plane gettagorigin("tag_origin");
		/#
			print3d(org, "", (1, 1, 1), 1, 0.25);
		#/
		wait(0.05);
	}
}

/*
	Name: cleanup
	Namespace: tkdn_af_hill
	Checksum: 0x53CC913E
	Offset: 0x2788
	Size: 0xA4
	Parameters: 4
	Flags: Linked
*/
function cleanup(name, starting, direct, player)
{
	level flag::set("end_binocs");
	level.var_49a5d2a4 = getvehiclearray("af_chase_veh", "targetname")[0];
	level.var_49a5d2a4 val::set(#"hash_57927fe94524d139", "allowdeath", 0);
}

/*
	Name: init_flags
	Namespace: tkdn_af_hill
	Checksum: 0xD9613376
	Offset: 0x2838
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function init_flags()
{
	level flag::init("af_hill_complete");
	level flag::init("af_fade_in_complete");
}

/*
	Name: init_clientfields
	Namespace: tkdn_af_hill
	Checksum: 0x94AAE9B2
	Offset: 0x2888
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function init_clientfields()
{
	clientfield::register("world", "fake_snipercam_slomo", 1, 1, "int");
}

/*
	Name: init_scenes
	Namespace: tkdn_af_hill
	Checksum: 0x1A83562F
	Offset: 0x28C8
	Size: 0xC4
	Parameters: 0
	Flags: Linked
*/
function init_scenes()
{
	scene::add_scene_func("scene_tkd_hit3_intro_overlook", &function_2fc20b49, "initial_loop");
	scene::add_scene_func("scene_tkd_hit3_intro_overlook", &function_309e4828, "overlook_shot");
	scene::add_scene_func("scene_tkd_hit3_intro_overlook", &function_9b3565b1, "overlook_shot");
	scene::add_scene_func("scene_tkd_hit3_intro_overlook_enemy4", &function_f0cab8f5, "overlook_shot");
}

/*
	Name: function_2fc20b49
	Namespace: tkdn_af_hill
	Checksum: 0x3726CAF6
	Offset: 0x2998
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function function_2fc20b49(a_ents)
{
	thread function_94c3f34a(#"hash_2f5bf3e976fdd8ee", a_ents);
	thread function_94c3f34a(#"hash_f4e2cb35f1a71a6", a_ents);
}

/*
	Name: function_309e4828
	Namespace: tkdn_af_hill
	Checksum: 0x7440CFE
	Offset: 0x29F0
	Size: 0xBC
	Parameters: 1
	Flags: Linked
*/
function function_309e4828(a_ents)
{
	if(isdefined(a_ents[#"driver"]))
	{
		a_ents[#"driver"] val::set(#"hash_48aa53f40d892719", "ignoreme", 1);
	}
	if(isdefined(a_ents[#"bell"]))
	{
		a_ents[#"bell"] val::set(#"hash_48aa53f40d892719", "ignoreme", 1);
	}
}

/*
	Name: function_f0cab8f5
	Namespace: tkdn_af_hill
	Checksum: 0xDE00C3EA
	Offset: 0x2AB8
	Size: 0x5A
	Parameters: 1
	Flags: Linked
*/
function function_f0cab8f5(a_ents)
{
	level.var_2124e12b = a_ents[#"hash_f4e2bb35f1a6ff3"];
	if(isdefined(a_ents[#"af_enemy4"]))
	{
		guy = a_ents[#"af_enemy4"];
	}
}

/*
	Name: function_9b3565b1
	Namespace: tkdn_af_hill
	Checksum: 0x21380E23
	Offset: 0x2B20
	Size: 0xA4
	Parameters: 1
	Flags: Linked
*/
function function_9b3565b1(a_ents)
{
	level endon(#"hash_1a8ccb31e7a09c0e");
	level waittill(#"hash_4d3bb4cb42226cd8");
	level.var_fac9425c = a_ents[#"hash_4b83e4cb49ee37d1"];
	thread scene::play("scene_tkd_hit3_intro_overlook_guy2", "overlook_shot_part2", [1:level.var_2124e12b, 0:level.var_fac9425c]);
}

/*
	Name: function_94c3f34a
	Namespace: tkdn_af_hill
	Checksum: 0x37488DA3
	Offset: 0x2BD0
	Size: 0x74
	Parameters: 2
	Flags: Linked
*/
function function_94c3f34a(name, ents)
{
	if(isdefined(ents[name]))
	{
		thing = ents[name];
		thing waittill(#"hash_1e6fd05dff685aca");
		thing linkto(level.var_2762a9c, "tag_body_animate");
	}
}

/*
	Name: function_78bc26d5
	Namespace: tkdn_af_hill
	Checksum: 0x60B21F83
	Offset: 0x2C50
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_78bc26d5()
{
	self vehicle::lights_on();
	self vehicle::toggle_force_driver_taillights(1);
}

/*
	Name: function_f7c7ce51
	Namespace: tkdn_af_hill
	Checksum: 0xCA678BC1
	Offset: 0x2C90
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function function_f7c7ce51()
{
	level.var_2713b408 = ai::array_spawn("arash")[0];
	level.var_2713b408 namespace_979752dc::function_2324f175(0);
}

/*
	Name: handle_camera
	Namespace: tkdn_af_hill
	Checksum: 0x462FDFAF
	Offset: 0x2CE0
	Size: 0x2D4
	Parameters: 0
	Flags: Linked
*/
function handle_camera()
{
	level endoncallback(&function_8c38a6f0, #"hash_63e5acd07208c35d");
	player = getplayers()[0];
	player util::show_hint_text(#"hash_a9076dcaa02f4e", 0, "camera_up", -1);
	waitframe(1);
	player notifyonplayercommand("binoculars", "+actionslot 4");
	player waittill(#"binoculars");
	player notifyonplayercommandremove("binoculars", "+actionslot 4");
	waitframe(1);
	player notify(#"camera_up");
	waitframe(1);
	player giveweapon(level.var_42db149f);
	var_796f04ff = level.var_42db149f;
	thread function_ca9dd78b();
	level.var_9febe810 = player getcurrentweapon();
	player switchtoweapon(var_796f04ff);
	player val::set(#"overlook", "disable_weapon_cycling", 1);
	while(player getcurrentweapon().name != "eq_binoculars" || !player adsbuttonpressed())
	{
		waitframe(1);
	}
	wait(2);
	thread function_d75e55a1(struct::get("cargo_bay_lookat", "targetname"), "vox_cp_tdwn_07100_adlr_anysignofarash_3c", 6);
	thread function_8c011eca();
	wait(7);
	guys = getentarray("af_intro_enemies", "script_noteworthy", 1);
	lines = [2:"vox_cp_tdwn_07100_adlr_justaguard_88", 1:"vox_cp_tdwn_07100_adlr_nope_c0", 0:"vox_cp_tdwn_07100_adlr_thatsnothim_fc"];
	thread function_d75e55a1(guys, lines);
}

/*
	Name: function_8c38a6f0
	Namespace: tkdn_af_hill
	Checksum: 0xCE2EAAD0
	Offset: 0x2FC0
	Size: 0x44
	Parameters: 1
	Flags: Linked, Private
*/
function private function_8c38a6f0(parms)
{
	getplayers()[0] notifyonplayercommandremove("binoculars", "+actionslot 4");
}

/*
	Name: handle_intro_dialog
	Namespace: tkdn_af_hill
	Checksum: 0xA4E59909
	Offset: 0x3010
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function handle_intro_dialog()
{
	level flag::wait_till("af_start_overlook_scene");
	level.adler thread dialogue::queue("vox_cp_tdwn_07100_adlr_masoncheckitout_eb");
	thread handle_camera();
}

/*
	Name: function_8c011eca
	Namespace: tkdn_af_hill
	Checksum: 0x6B3387E6
	Offset: 0x3070
	Size: 0xD4
	Parameters: 0
	Flags: Linked
*/
function function_8c011eca()
{
	level endon(#"hash_5663f4acce350395");
	targ = getent("car_look_point", "targetname");
	level waittill(#"hash_5a1f3e30c78ae9a2");
	thread function_d75e55a1(targ, "looked_at_car", 15);
	level waittill(#"hash_3130ba431262d090");
	if(!level flag::get("looked_at_car"))
	{
		level.adler dialogue::queue("vox_cp_tdwn_07100_adlr_geteyesonitmaso_68");
	}
}

/*
	Name: function_9f929cf3
	Namespace: tkdn_af_hill
	Checksum: 0xB5160212
	Offset: 0x3150
	Size: 0x7C
	Parameters: 0
	Flags: None
*/
function function_9f929cf3()
{
	level flag::wait_till_any([2:"af_player_get_in_right", 1:"af_player_get_in_left", 0:"af_player_get_in_back"]);
	self vehicle::lights_off();
	self vehicle::toggle_force_driver_taillights(0);
}

/*
	Name: function_d75e55a1
	Namespace: tkdn_af_hill
	Checksum: 0x7F8A5007
	Offset: 0x31D8
	Size: 0x342
	Parameters: 4
	Flags: Linked
*/
function function_d75e55a1(targets, lines, fov, var_dc8ec980)
{
	if(!isdefined(fov))
	{
		fov = 2;
	}
	if(!isdefined(var_dc8ec980))
	{
		var_dc8ec980 = 5;
	}
	level endon(#"player_break_stealth_fired");
	level endon(#"player_break_stealth_tarmac");
	level endon(#"hash_63e5acd07208c35d");
	if(!isarray(targets))
	{
		targets = [0:targets];
	}
	if(!isarray(lines))
	{
		lines = [0:lines];
	}
	i = 0;
	player = getplayers()[0];
	while(!isdefined(player.spy_camera))
	{
		waitframe(1);
	}
	fov_cos = cos(fov);
	while(i < lines.size)
	{
		while(player getcurrentweapon().name != "eq_binoculars" || !player adsbuttonpressed())
		{
			waitframe(1);
		}
		var_32a7c3bf = undefined;
		while(!isdefined(var_32a7c3bf))
		{
			eye_pos = player getplayercamerapos();
			eye_angles = player getplayerangles();
			var_a74a4e75 = anglestoforward(eye_angles);
			foreach(targ in targets)
			{
				/#
				#/
				if(!is_true(targ.var_181d1cf5) && targ function_e779ff3c(player, eye_pos, eye_angles, fov_cos, var_a74a4e75, fov))
				{
					var_32a7c3bf = targ;
					break;
				}
			}
			waitframe(1);
		}
		var_32a7c3bf.var_181d1cf5 = 1;
		if(soundexists(lines[i]))
		{
			level.adler dialogue::queue(lines[i]);
		}
		else
		{
			level flag::set(lines[i]);
		}
		wait(var_dc8ec980);
		i++;
	}
}

/*
	Name: function_e779ff3c
	Namespace: tkdn_af_hill
	Checksum: 0x33297326
	Offset: 0x3528
	Size: 0xEE
	Parameters: 6
	Flags: Linked
*/
function function_e779ff3c(player, eye_pos, eye_angles, fov_cos, var_a74a4e75, fov)
{
	level endon(#"hash_63e5acd07208c35d");
	self endon(#"death");
	target_pos = self.origin + vectorscale((0, 0, 1), 30);
	if(eye_angles getcurrentweapon().name != "eq_binoculars" || !eye_angles adsbuttonpressed())
	{
		return false;
	}
	if(util::within_fov(fov_cos, var_a74a4e75, target_pos, fov))
	{
		return true;
	}
	return false;
}

/*
	Name: function_b12fabe5
	Namespace: tkdn_af_hill
	Checksum: 0x4E7E1399
	Offset: 0x3620
	Size: 0xCC
	Parameters: 1
	Flags: Linked
*/
function function_b12fabe5(player)
{
	player endon(#"death");
	while(true)
	{
		result = undefined;
		result = player waittill(#"weapon_fired");
		if(level flag::get("end_binocs"))
		{
			level flag::set("player_fired_at_arash");
			break;
		}
		if(result.weapon !== level.var_42db149f)
		{
			level flag::set("player_break_stealth_fired");
			break;
		}
	}
}

/*
	Name: function_9967d19b
	Namespace: tkdn_af_hill
	Checksum: 0x2224F4EC
	Offset: 0x36F8
	Size: 0x94
	Parameters: 1
	Flags: Linked
*/
function function_9967d19b(excludes)
{
	guys = getaiarray("af_intro_enemies", "script_noteworthy");
	guys = array::exclude(guys, level.var_2713b408);
	if(isdefined(excludes))
	{
		guys = array::exclude(guys, excludes);
	}
	array::thread_all(guys, &function_f1f9011d);
}

/*
	Name: function_f1f9011d
	Namespace: tkdn_af_hill
	Checksum: 0xBABBA64A
	Offset: 0x3798
	Size: 0x144
	Parameters: 0
	Flags: Linked
*/
function function_f1f9011d()
{
	self endon(#"death");
	player = getplayers()[0];
	if(self flag::get("no_interrupt"))
	{
		self flag::wait_till_clear("no_interrupt");
	}
	self stopanimscripted();
	self function_a3fcf9e0("attack", player, player.origin);
	self ai::set_behavior_attribute("demeanor", "combat");
	self val::set(#"failed", "ignoreall", 0);
	self val::set(#"failed", "ignoreme", 0);
	waitframe(1);
	self stopanimscripted();
}

/*
	Name: function_cc465a2
	Namespace: tkdn_af_hill
	Checksum: 0x6AD4D3F
	Offset: 0x38E8
	Size: 0x204
	Parameters: 1
	Flags: Linked
*/
function function_cc465a2(player)
{
	level endon(#"af_hill_complete");
	level endon(#"hash_1a8ccb31e7a09c0e");
	thread function_b12fabe5(player);
	ret = level flag::wait_till_any([2:"stealth_spotted", 1:"player_break_stealth_tarmac", 0:"player_break_stealth_fired"]);
	snd::function_7db65a93(#"hash_1e58e46360c0a83b");
	if(ret._notify == "stealth_spotted" && level flag::get("player_fired_at_arash"))
	{
		return;
	}
	if(ret._notify == #"player_break_stealth_tarmac" && level flag::get("start_sniping"))
	{
		return;
	}
	wait(0.2);
	level.woods thread dialogue::queue("vox_cp_tdwn_07200_wood_masonno_1d");
	level scene::stop("scene_tkd_hit3_intro_overlook");
	level scene::stop("scene_tkd_hit3_intro_overlook_adler");
	function_9967d19b();
	wait(3);
	level util::missionfailedwrapper(#"hash_307e01d87701c37");
	level.player notifyonplayercommandremove("blow_rc_car", "+attack");
}

/*
	Name: function_a2015343
	Namespace: tkdn_af_hill
	Checksum: 0x5041FEF7
	Offset: 0x3AF8
	Size: 0x398
	Parameters: 1
	Flags: Linked
*/
function function_a2015343(str_skipto)
{
	spawners = getspawnerarray("af_adler", "targetname");
	level.adler = spawners[0] spawner::spawn(1);
	level.adler val::set(#"airfield", "ignoreall", 1);
	level thread util::magic_bullet_shield(level.adler);
	var_7e4a7b32 = getweapon(#"ar_accurate_t9");
	level.adler namespace_c25eb016::function_65d14a19(var_7e4a7b32);
	spawners = getspawnerarray("af_woods", "targetname");
	level.woods = spawners[0] spawner::spawn(1);
	level.woods val::set(#"airfield", "ignoreall", 1);
	level.woods util::magic_bullet_shield(level.woods);
	var_7e4a7b32 = getweapon("ar_accurate_t9");
	level.woods namespace_c25eb016::function_65d14a19(var_7e4a7b32);
	level.adler.forcegoal = 1;
	level.adler.fixednode = 1;
	level.adler.radius = 50;
	level.adler.enableterrainik = 1;
	level.woods.forcegoal = 1;
	level.woods.fixednode = 1;
	level.woods.radius = 50;
	level.woods.enableterrainik = 1;
	if(isdefined(str_skipto))
	{
		var_57d91ef1 = struct::get_array(str_skipto + "_start", "targetname");
		foreach(spot in var_57d91ef1)
		{
			if(spot.script_noteworthy == "adler")
			{
				level.adler forceteleport(spot.origin, spot.angles);
			}
			if(spot.script_noteworthy == "woods")
			{
				level.woods forceteleport(spot.origin, spot.angles);
			}
		}
	}
}

/*
	Name: function_61f33d07
	Namespace: tkdn_af_hill
	Checksum: 0x5044D0A2
	Offset: 0x3E98
	Size: 0x224
	Parameters: 0
	Flags: Linked
*/
function function_61f33d07()
{
	car = vehicle::simple_spawn("airport_truck_approach")[0];
	targ = getent("car_look_point", "targetname");
	targ linkto(car, "tag_origin", vectorscale((0, 0, 1), 50));
	level waittill(#"hash_186d95ebb54fca9f");
	car vehicle::lights_on();
	car vehicle::toggle_force_driver_taillights(1);
	level waittill(#"hash_f1a37977643f3f0");
	car vehicle::lights_off();
	exploder::exploder("airfield_assault_arash_car_lights");
	playfxontag("vehicle/fx9_light_ru_truck_light_head_source", car, "tag_fx_headlight_right");
	playfxontag("vehicle/fx9_light_ru_truck_light_head_source", car, "tag_fx_headlight_left");
	light = getent("light_head_arash_truck_r", "targetname");
	if(isdefined(light))
	{
		light linkto(car, "tag_fx_headlight_right", vectorscale((-1, 0, 0), 0.5), vectorscale((1, 0, 0), 15));
	}
	light = getent("light_head_arash_truck_l", "targetname");
	if(isdefined(light))
	{
		light linkto(car, "tag_fx_headlight_left", vectorscale((-1, 0, 0), 0.5), vectorscale((1, 0, 0), 15));
	}
}

