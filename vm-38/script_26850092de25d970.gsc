#using script_263b7f2982258785;
#using script_2d443451ce681a;
#using script_31786c2dc684e9b;
#using script_31e9b35aaacbbd93;
#using script_32399001bdb550da;
#using script_3dc93ca9902a9cda;
#using script_474bf596f5ecdb01;
#using script_4937c6974f43bb71;
#using script_4a73380997c0854e;
#using script_4ccd0c3512b52a10;
#using script_61cfc2ab8e60625;
#using script_7d0013bbc05623b9;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\fx_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\cp_common\gametypes\globallogic_ui.gsc;
#using scripts\cp_common\objectives.gsc;
#using scripts\cp_common\skipto.gsc;
#using scripts\cp_common\util.gsc;

#namespace namespace_414c4954;

/*
	Name: function_2905e97b
	Namespace: namespace_414c4954
	Checksum: 0x4662C934
	Offset: 0x5E0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_2905e97b()
{
	level notify(252405389);
}

#namespace namespace_c9f7b6af;

/*
	Name: starting
	Namespace: namespace_c9f7b6af
	Checksum: 0xD7EE6D75
	Offset: 0x600
	Size: 0x324
	Parameters: 1
	Flags: Linked
*/
function starting(str_skipto)
{
	player = getplayers()[0];
	var_8a3bb97c = getspawnerarray("raid_adler", "targetname");
	var_8a3bb97c[0] spawner::add_spawn_function(&namespace_b100dd86::function_9109a1fe);
	var_6534f716 = getspawnerarray("raid_woods", "targetname");
	var_6534f716[0] spawner::add_spawn_function(&namespace_b100dd86::function_87d56d50);
	level.var_efac709f = getent("player_breach_clip", "targetname");
	level.var_efac709f disconnectpaths();
	level.adler = var_8a3bb97c[0] spawner::spawn(1);
	level.woods = var_6534f716[0] spawner::spawn(1);
	var_fcbd93e0 = struct::get("raid_approach_adler", "targetname");
	var_1100faeb = struct::get("raid_approach_woods", "targetname");
	level.adler forceteleport(var_fcbd93e0.origin, var_fcbd93e0.angles);
	level.woods forceteleport(var_1100faeb.origin, var_1100faeb.angles);
	player clientfield::set_to_player("force_stream_weapons", 1);
	level thread namespace_5df9d277::function_68461db2();
	level util::function_3e65fe0b(1);
	level notify(#"hash_4aade1e09ed49814");
	level notify(#"hash_41a9df66948f9e8a");
	scene::add_scene_func("scene_tkd_hit2_intro_bar_v2", &namespace_5df9d277::function_e2d2754d, "civilians");
	level thread scene::play("scene_tkd_hit2_intro_bar_v2", "civilians");
	var_b7ec8c4b = getent("bar_door_clip", "targetname");
	var_b7ec8c4b delete();
}

/*
	Name: main
	Namespace: namespace_c9f7b6af
	Checksum: 0x4E54A7CC
	Offset: 0x930
	Size: 0x634
	Parameters: 2
	Flags: Linked
*/
function main(str_skipto, b_starting)
{
	if(b_starting)
	{
		player = getplayers()[0];
		player setmovespeedscale(0.4);
		objectives::scripted("obj_takedown_capture", undefined, #"hash_49c1d860c97e3792");
		objectives::follow("follow_adler", level.adler, undefined, 0, 0);
		level.var_2f3bf638 = getent("raid_car", "targetname");
		level thread scene::play("scene_tkd_hit2_intro_bar_v2", "Adler_part_3", [0:level.var_2f3bf638]);
		if(isdefined(level.str_player_start_flag))
		{
			player flag::set(level.str_player_start_flag);
		}
	}
	level thread namespace_82bfe441::fade(0, "FadeSlow");
	scene::add_scene_func("scene_tkd_hit2_bar_alley", &function_3f65ad3b, "alley");
	thread namespace_a052577e::function_2032c91c();
	player = getplayers()[0];
	var_4f2ba130 = player getweaponslistprimaries();
	foreach(var_5f48185 in var_4f2ba130)
	{
		player takeweapon(var_5f48185);
	}
	player util::blend_movespeedscale(0.5, 2);
	level scene::init("scene_tkd_hit2_alley_civilians");
	thread namespace_a052577e::function_6591463();
	level thread function_4bc3dba();
	level util::waittill_multiple("player_has_weapon", "woods_gearup_done", "adler_gearup_done");
	level flag::set("enable_trig_move_onto_alley");
	level flag::wait_till("flag_move_on_to_alley");
	level thread function_3df72127();
	level notify(#"hash_5c41a54cd623966e");
	var_d582d701 = getent("alley_clip", "targetname");
	var_d582d701 delete();
	player val::reset(#"bar", "allow_sprint");
	player val::reset(#"bar", "allow_mantle");
	player val::reset(#"bar", "allow_jump");
	level thread function_b7d7ba47();
	level thread function_709cb1b3();
	level thread namespace_45a40084::function_7ea0ce5f();
	player util::blend_movespeedscale(0.45, 2);
	level thread function_c05edfd0();
	namespace_a052577e::function_b26ed576();
	level thread scene::init_streamer(#"hash_511c915b0909fb99", getplayers());
	level thread scene::init("scene_tkd_hit2_bar_alley");
	level thread scene::init("scene_tkd_hit2_adler_alley");
	level thread scene::play("scene_tkd_hit2_bar_alley", "Alley");
	level thread scene::play("scene_tkd_hit2_adler_alley", "Alley");
	level waittill(#"hash_4dcb7132963ee03d");
	thread namespace_a052577e::function_11062617();
	level flag::wait_till("flag_setup_apartment_combat");
	level notify(#"hash_1ab7d54e8692f78a");
	level thread savegame::function_7790f03(1);
	level thread scene::play("scene_tkd_hit2_adler_alley", "Yard");
	if(isdefined(str_skipto))
	{
		skipto::objective_completed(str_skipto);
	}
}

/*
	Name: function_3f65ad3b
	Namespace: namespace_c9f7b6af
	Checksum: 0x54E9E0B1
	Offset: 0xF70
	Size: 0x7C
	Parameters: 1
	Flags: Linked
*/
function function_3f65ad3b(a_ents)
{
	if(isdefined(a_ents[#"civ_1"]))
	{
		a_ents[#"civ_1"] thread function_5424b11();
	}
	if(isdefined(a_ents[#"civ_2"]))
	{
		a_ents[#"civ_2"] thread function_5424b11();
	}
}

/*
	Name: function_5424b11
	Namespace: namespace_c9f7b6af
	Checksum: 0x7DD558FA
	Offset: 0xFF8
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_5424b11()
{
	self waittill(#"end_anim");
	wait(1);
	self deletedelay();
}

/*
	Name: function_3df72127
	Namespace: namespace_c9f7b6af
	Checksum: 0x81B07A53
	Offset: 0x1038
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function function_3df72127()
{
	level waittill(#"hash_211c1837b9121eb1");
	util::delay(0.1, undefined, &namespace_96850e69::function_49ebaad2);
}

/*
	Name: function_c05edfd0
	Namespace: namespace_c9f7b6af
	Checksum: 0x436184C2
	Offset: 0x1088
	Size: 0x114
	Parameters: 0
	Flags: Linked
*/
function function_c05edfd0()
{
	var_d7e0979c = getspawnerarray("kitchen_guys", "script_aigroup");
	foreach(spawner in var_d7e0979c)
	{
		spawner spawner::add_spawn_function(&namespace_b331012d::function_306807e5);
	}
	level thread function_d5cc022();
	level flag::wait_till("flag_setup_kitchen_guys");
	level thread scene::play("scene_tkd_hit2_bar_alley", "Enemy_Waiting");
}

/*
	Name: function_d5cc022
	Namespace: namespace_c9f7b6af
	Checksum: 0x67309734
	Offset: 0x11A8
	Size: 0x200
	Parameters: 0
	Flags: Linked
*/
function function_d5cc022()
{
	level endon(#"hash_1ab7d54e8692f78a");
	level flag::wait_till("flag_apt_approach_guard_vo");
	org = getent("org_bodyguard_alleyway_vo", "targetname");
	while(true)
	{
		var_e8cccaf8 = snd::play("vox_cp_tdwn_03500_irg3_yellinggroan_7c_1", org.origin);
		snd::function_2fdc4fb(var_e8cccaf8);
		var_e8cccaf8 = snd::play("vox_cp_tdwn_03500_irg3_celebratoryyell_c3", org.origin);
		snd::function_2fdc4fb(var_e8cccaf8);
		var_e8cccaf8 = snd::play("vox_cp_tdwn_03500_irg3_celebratoryyell_c3_1", org.origin);
		snd::function_2fdc4fb(var_e8cccaf8);
		var_e8cccaf8 = snd::play("vox_cp_tdwn_03500_irg3_celebratoryyell_c3", org.origin);
		snd::function_2fdc4fb(var_e8cccaf8);
		var_e8cccaf8 = snd::play("vox_cp_tdwn_03500_irg2_celebratoryyell_c3_1", org.origin);
		snd::function_2fdc4fb(var_e8cccaf8);
		var_e8cccaf8 = snd::play("vox_cp_tdwn_03500_irg3_yellinggroan_7c", org.origin);
		snd::function_2fdc4fb(var_e8cccaf8);
		var_e8cccaf8 = snd::play("vox_cp_tdwn_03500_irg1_yellinggroan_7c_1", org.origin);
		snd::function_2fdc4fb(var_e8cccaf8);
	}
}

/*
	Name: function_37ddf68b
	Namespace: namespace_c9f7b6af
	Checksum: 0x2E3810D5
	Offset: 0x13B0
	Size: 0xB4
	Parameters: 1
	Flags: None
*/
function function_37ddf68b(a_ents)
{
	door = a_ents[#"hash_1aeea238444bdd4d"];
	var_b7ec8c4b = getent("yard_gate_clip", "targetname");
	org = getent("yard_gate_org", "targetname");
	var_b7ec8c4b linkto(org);
	org linkto(door, "tag_origin");
}

/*
	Name: function_4bc3dba
	Namespace: namespace_c9f7b6af
	Checksum: 0xD3B63B21
	Offset: 0x1470
	Size: 0x94
	Parameters: 0
	Flags: Linked
*/
function function_4bc3dba()
{
	level flag::wait_till("flag_close_bar_door");
	level thread scene::play("scene_tkd_hit2_intro_bar_v2", "Bar_Door_Close");
	wait(3);
	level thread namespace_5df9d277::function_a5d7de3c();
	setsaveddvar(#"hash_6b57212fd4fcdd3a", 300);
}

/*
	Name: function_b7d7ba47
	Namespace: namespace_c9f7b6af
	Checksum: 0xC8AAFD9
	Offset: 0x1510
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_b7d7ba47()
{
	level flag::wait_till("flag_window_guy");
	level scene::play("scene_tkd_hit2_alley_civilians", "window_civilian");
}

/*
	Name: function_709cb1b3
	Namespace: namespace_c9f7b6af
	Checksum: 0x645CCF10
	Offset: 0x1568
	Size: 0x9C
	Parameters: 0
	Flags: Linked
*/
function function_709cb1b3()
{
	player = getplayers()[0];
	level flag::wait_till("flag_window_guy");
	level thread scene::play("scene_tkd_hit2_alley_civilians", "drug_waiting");
	wait(1.5);
	level thread scene::play("scene_tkd_hit2_alley_civilians", "drug_deal");
}

/*
	Name: cleanup
	Namespace: namespace_c9f7b6af
	Checksum: 0x90AA2026
	Offset: 0x1610
	Size: 0x24
	Parameters: 4
	Flags: Linked
*/
function cleanup(name, starting, direct, player)
{
}

/*
	Name: init_flags
	Namespace: namespace_c9f7b6af
	Checksum: 0x92A60679
	Offset: 0x1640
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function init_flags()
{
	level flag::init("raid_approach_complete");
}

/*
	Name: init_clientfields
	Namespace: namespace_c9f7b6af
	Checksum: 0x80F724D1
	Offset: 0x1670
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function init_clientfields()
{
}

/*
	Name: init_scenes
	Namespace: namespace_c9f7b6af
	Checksum: 0x80F724D1
	Offset: 0x1680
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function init_scenes()
{
}

