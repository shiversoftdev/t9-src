#using scripts\cp_common\gametypes\globallogic_ui.gsc;
#using scripts\cp_common\skipto.gsc;
#using script_1883fa4e60abbf9f;
#using scripts\cp_common\util.gsc;
#using scripts\core_common\values_shared.gsc;
#using script_1292451e284848cc;
#using script_31e9b35aaacbbd93;
#using script_61cfc2ab8e60625;
#using script_45e09f634c49fdba;
#using script_2d443451ce681a;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace namespace_8d783c4b;

/*
	Name: function_576c4713
	Namespace: namespace_8d783c4b
	Checksum: 0xE9940FBA
	Offset: 0x4F8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_576c4713()
{
	level notify(937987082);
}

#namespace tkdn_af_tarmac;

/*
	Name: starting
	Namespace: tkdn_af_tarmac
	Checksum: 0x2903A8B8
	Offset: 0x518
	Size: 0x2C4
	Parameters: 1
	Flags: Linked
*/
function starting(str_skipto)
{
	namespace_b100dd86::function_5aabc3fb();
	tkdn_af_hill::function_a2015343(str_skipto);
	plane = namespace_b100dd86::function_5431431d();
	namespace_b100dd86::function_c8381339(plane, 0);
	exploder::stop_exploder("airfield_assault_lighting_noplane");
	exploder::exploder("airfield_assault_lighting");
	var_2713b408 = ai::array_spawn("arash")[0];
	level thread scene::skipto_end("scene_tkd_hit3_intro_overlook_arash", "overlook_shot", [0:var_2713b408]);
	var_2713b408 thread util::delay(0.1, undefined, &delete);
	namespace_b100dd86::function_c8381339(plane, 1);
	setdvar(#"hash_76c0d7e6385ee6de", 0.05);
	level scene::init("scene_tkd_hit3_intro_overlook", "initial_loop");
	level thread util::delay(0.2, undefined, &scene::stop, "scene_tkd_hit3_intro_overlook");
	setsaveddvar(#"hash_7bf40e4b6a830d11", 0);
	thread namespace_a052577e::function_4074e9b1();
	guys = ai::array_spawn("af_unloader_guy");
	array::thread_all(guys, &namespace_979752dc::function_2324f175, 0);
	level flag::set("af_hill_complete");
	level flag::set("af_tarmac_complete");
	level thread scene::play_from_time("scene_tkd_hit3_intro", "shot 1", undefined, 1, 1, 1, 0, 0);
	util::delay(0.2, undefined, &tkdn_af_hill::function_9967d19b, var_2713b408);
}

/*
	Name: main
	Namespace: tkdn_af_tarmac
	Checksum: 0x836E8FB
	Offset: 0x7E8
	Size: 0x4CC
	Parameters: 2
	Flags: Linked
*/
function main(str_skipto, b_starting)
{
	level util::delay(0.1, undefined, &namespace_979752dc::disable_stealth_system);
	level.player = getplayers()[0];
	level.player endon(#"death");
	snd::function_7db65a93(#"hash_1e58e46360c0a83b");
	vehs = getvehiclearray("af_chase_veh", "targetname");
	vehs[0] setmovingplatformenabled(1, 0);
	guys = getaiarray("af_intro_enemies", "script_noteworthy");
	foreach(guy in guys)
	{
		guy notify(#"stop_going_to_node");
		guy function_a3fcf9e0("attack", level.player, level.player.origin);
		guy ai::set_goal("tarmac_combat_vol", "targetname", 1);
	}
	vehs = getvehiclearray("af_chase_veh", "targetname");
	level.var_49a5d2a4 = vehs[0];
	level.var_49a5d2a4 val::set(#"chase", "allowdeath", 0);
	trigger::use("approach_airstrip", "targetname", undefined, 0);
	level.adler val::reset(#"overlook", "ignoreme");
	level.adler val::reset(#"radiant", "ignoreall");
	level.adler val::reset(#"airfield", "ignoreall");
	level.woods val::reset(#"overlook", "ignoreme");
	level.woods val::reset(#"radiant", "ignoreall");
	level.woods val::reset(#"airfield", "ignoreall");
	level.adler.ignoreall = 0;
	level.adler ai::set_behavior_attribute("demeanor", "combat");
	level.woods ai::set_behavior_attribute("demeanor", "combat");
	thread function_b3df3ebf();
	thread function_565588e1();
	level flag::wait_till("woods_to_truck");
	level.woods thread util::function_27f5f662([2:"vox_cp_tdwn_07200_wood_hurry_3b", 1:"vox_cp_tdwn_07200_wood_quickbeforethep_01", 0:"vox_cp_tdwn_07200_wood_getarash_50"], "woods_to_truck", 2);
	level flag::wait_till("af_tarmac_complete");
	if(isdefined(b_starting))
	{
		skipto::objective_completed(b_starting);
	}
}

/*
	Name: cleanup
	Namespace: tkdn_af_tarmac
	Checksum: 0x94EAFAAB
	Offset: 0xCC0
	Size: 0x24
	Parameters: 4
	Flags: Linked
*/
function cleanup(name, starting, direct, player)
{
}

/*
	Name: init_flags
	Namespace: tkdn_af_tarmac
	Checksum: 0xD5E94BE1
	Offset: 0xCF0
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function init_flags()
{
	level flag::init("af_tarmac_complete");
}

/*
	Name: init_clientfields
	Namespace: tkdn_af_tarmac
	Checksum: 0x8D6A7A0F
	Offset: 0xD20
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function init_clientfields()
{
	clientfield::register("world", "prop_wash", 1, 1, "int");
}

/*
	Name: init_scenes
	Namespace: tkdn_af_tarmac
	Checksum: 0x80F724D1
	Offset: 0xD60
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function init_scenes()
{
}

/*
	Name: function_b3df3ebf
	Namespace: tkdn_af_tarmac
	Checksum: 0x3EE5789
	Offset: 0xD70
	Size: 0x1DC
	Parameters: 0
	Flags: Linked
*/
function function_b3df3ebf()
{
	level.player endon(#"death");
	level flag::wait_till_timeout(5, "woods_to_truck");
	snd::function_7db65a93("start_plane_rev");
	trigger::use("woods_to_truck_trig", "targetname", undefined, 0);
	thread function_3d64bc8b();
	thread namespace_b100dd86::function_19919872();
	wait(1);
	start_pos = struct::get("plane_chase_start_pos", "targetname");
	level.var_2762a9c clientfield::set("clf_cargoplane_door_sparks", 1);
	if(!level flag::get("af_tarmac_complete"))
	{
		level.var_7929453e moveto(start_pos.origin, 20, 20, 0);
		level.var_7929453e rotateto(start_pos.angles, 20, 20, 0);
	}
	level clientfield::set("prop_wash", 1);
	level flag::wait_till_all_timeout(10, "af_tarmac_complete");
	trigger::use("start_plane_takeoff", "targetname", undefined, 0);
}

/*
	Name: function_3d64bc8b
	Namespace: tkdn_af_tarmac
	Checksum: 0xA58F5BB4
	Offset: 0xF58
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function function_3d64bc8b()
{
	level.var_2762a9c scene::play("scene_tkd_hit3_chase_plane", "start_driving");
	level.var_2762a9c thread scene::play("scene_tkd_hit3_chase_plane", "idle_drive");
}

/*
	Name: function_565588e1
	Namespace: tkdn_af_tarmac
	Checksum: 0x70058AEF
	Offset: 0xFB8
	Size: 0x2D6
	Parameters: 0
	Flags: Linked
*/
function function_565588e1()
{
	level endon(#"af_player_get_in_back");
	level endon(#"af_player_get_in_left");
	level endon(#"af_player_get_in_right");
	level flag::wait_till("woods_to_truck");
	level.woods thread util::delay(3, undefined, &util::function_27f5f662, [1:"vox_cp_tdwn_07200_wood_gettothattruck_5e", 0:"vox_cp_tdwn_07200_adlr_wehavetocatchth_c8"], "forever", 4);
	while(!isdefined(level.var_49a5d2a4))
	{
		waitframe(1);
	}
	level.var_49a5d2a4 scene::play("scene_tkd_hit3_pre_chase", "enter", [0:level.woods]);
	level.woods stopanimscripted();
	level.woods ai::force_goal(level.woods.origin, 0, "never");
	level flag::set("woods_waiting_at_truck");
	level.woods val::set(#"chase", "ignoreall", 1);
	level.woods.script_fixednode = 1;
	if(level flag::get("woods_get_in_truck"))
	{
		level endon(#"player_lookdown");
	}
	else
	{
		level endon(#"woods_get_in_truck");
	}
	while(true)
	{
		var_ca06ae66 = "nag" + (string(randomint(2) + 1));
		level.var_49a5d2a4 scene::play("scene_tkd_hit3_pre_chase", var_ca06ae66, level.woods);
		level.var_49a5d2a4 scene::play("scene_tkd_hit3_pre_chase", "loop", level.woods);
		wait(2);
	}
}

