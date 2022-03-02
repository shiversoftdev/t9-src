#using script_1292451e284848cc;
#using script_263b7f2982258785;
#using script_2d443451ce681a;
#using script_31e9b35aaacbbd93;
#using script_3dc93ca9902a9cda;
#using script_3de86a21a0c8d47b;
#using script_45e09f634c49fdba;
#using script_4937c6974f43bb71;
#using script_4a73380997c0854e;
#using script_61cfc2ab8e60625;
#using script_74940ab70a48ee4e;
#using script_7cf3e180e994d17f;
#using script_85cd2e9a28ea8a1;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\music_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\cp_common\gametypes\battlechatter.gsc;
#using scripts\cp_common\gametypes\globallogic_ui.gsc;
#using scripts\cp_common\objectives.gsc;
#using scripts\cp_common\skipto.gsc;
#using scripts\cp_common\util.gsc;

#namespace namespace_793341d2;

/*
	Name: function_3c569b71
	Namespace: namespace_793341d2
	Checksum: 0xDDC7888A
	Offset: 0x328
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_3c569b71()
{
	level notify(1876230091);
}

#namespace namespace_4926d69e;

/*
	Name: starting
	Namespace: namespace_4926d69e
	Checksum: 0x4E4B5FA3
	Offset: 0x348
	Size: 0x9C
	Parameters: 1
	Flags: Linked
*/
function starting(str_skipto)
{
	player = getplayers()[0];
	/#
		if(!isdefined(player))
		{
			iprintlnbold("");
		}
	#/
	namespace_7d4dd7f0::function_a2015343();
	level scene::init("scene_tkd_hit3_intro");
	player freezecontrols(1);
}

/*
	Name: main
	Namespace: namespace_4926d69e
	Checksum: 0x4513B1A5
	Offset: 0x3F0
	Size: 0x67C
	Parameters: 2
	Flags: Linked
*/
function main(str_skipto, b_starting)
{
	plane = namespace_b100dd86::function_5431431d();
	namespace_b100dd86::function_c8381339(plane, 0);
	exploder::stop_exploder("airfield_assault_lighting_noplane");
	exploder::exploder("airfield_assault_lighting");
	level thread util::screen_fade_out(0);
	level thread namespace_29a279dd::function_901ca209(3);
	level lui::play_movie(#"hash_1b87a73f3c672bf7", "fullscreen", 1, 0, 0, #"", 20);
	player = getplayers()[0];
	while(!isplayer(player))
	{
		waitframe(1);
		player = getplayers()[0];
	}
	player endon(#"death", #"disconnect");
	player function_8fd843dd(7);
	player clientfield::set_to_player("force_stream_weapons", 2);
	setdvar(#"hash_76c0d7e6385ee6de", 0.05);
	setdvar(#"hash_7b06b8037c26b99b", 255);
	var_d388318 = 1;
	/#
		var_d388318 = 0;
	#/
	namespace_82bfe441::fade(1, "FadeImmediate");
	player freezecontrols(0);
	player setstance("stand");
	player val::set("af_intro", "allow_sprint", 1);
	exploder::exploder("hit3_intro_ambient");
	exploder::exploder("hit3_prop_mist");
	wait(1.25);
	level thread util::screen_fade_in(0.7);
	level thread scene::play("scene_tkd_hit3_intro", "shot 1", [1:level.woods, 0:level.adler]);
	thread function_d12ea338();
	music::setmusicstate("b1.0_opening_part_2");
	snd::function_7db65a93("af_intro_camera_whoosh");
	namespace_a052577e::function_7c1cb9f9();
	wait(1.5);
	level thread function_1dee368();
	wait(2);
	thread namespace_a052577e::function_dd4c9710();
	player thread function_b598d07b();
	level waittill(#"hash_1582572f4be81dc1");
	player function_8fd843dd(9);
	level flag::set("af_fade_in_complete");
	player namespace_db2381c4::function_c8bc54e4();
	level waittill(#"hash_47b9f42b49b80814");
	player setmovespeedscale(0.3);
	namespace_b100dd86::function_5aabc3fb();
	if(isdefined(level.str_player_start_flag))
	{
		player flag::clear(level.str_player_start_flag);
	}
	player namespace_45a40084::function_43593d7d();
	player enableweapons();
	player util::delay(1, undefined, &util::set_low_ready, 0);
	player setlowready(0);
	player function_e0c7d69(1);
	level.adler ai::set_behavior_attribute("demeanor", "cqb");
	level.woods ai::set_behavior_attribute("demeanor", "cqb");
	level waittill(#"hash_42c2d836748c8726");
	music::playstinger("b1.5_airfield_reveal");
	player util::blend_movespeedscale(0.6, 2);
	namespace_82bfe441::fade(0, "FadeSlow");
	var_19a8c4d9 = vehicle::simple_spawn_and_drive("plane_flyover");
	thread namespace_a052577e::function_92a6fd6a(var_19a8c4d9);
	level flag::wait_till("start_tarmac");
	if(isdefined(b_starting))
	{
		skipto::objective_completed(b_starting);
	}
}

/*
	Name: function_b598d07b
	Namespace: namespace_4926d69e
	Checksum: 0x672E0954
	Offset: 0xA78
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function function_b598d07b()
{
	level waittill(#"hash_396b658765ef9b4e");
	self playrumbleonentity("damage_light");
}

/*
	Name: function_1dee368
	Namespace: namespace_4926d69e
	Checksum: 0xA45AB851
	Offset: 0xAC0
	Size: 0xC4
	Parameters: 1
	Flags: Linked
*/
function function_1dee368(var_54fed624)
{
	player = getplayers()[0];
	if(!isplayer(player))
	{
		return;
	}
	player endon(#"death");
	namespace_29a279dd::function_901ca209(4, #"hash_3601a56208a44de8", #"hash_6ad17ea80deca71a");
	wait(3.5);
	namespace_29a279dd::function_901ca209(5);
	wait(3);
	namespace_29a279dd::remove();
}

/*
	Name: function_d12ea338
	Namespace: namespace_4926d69e
	Checksum: 0xE3824562
	Offset: 0xB90
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_d12ea338()
{
	level waittill(#"hash_3286e739acb53c93");
	level objectives::follow("af_follow_adler", level.adler, undefined, 0, 0);
}

/*
	Name: function_cc5aa221
	Namespace: namespace_4926d69e
	Checksum: 0xD3031848
	Offset: 0xBE8
	Size: 0x3C
	Parameters: 0
	Flags: None
*/
function function_cc5aa221()
{
	player = getplayers()[0];
	level waittill(#"hash_6682816c8cb8b60f");
}

/*
	Name: cleanup
	Namespace: namespace_4926d69e
	Checksum: 0xFC6B5C22
	Offset: 0xC30
	Size: 0x64
	Parameters: 4
	Flags: Linked
*/
function cleanup(name, starting, direct, player)
{
	level clientfield::set("crash_models", 1);
	level clientfield::set("crash_models", 0);
}

/*
	Name: init_flags
	Namespace: namespace_4926d69e
	Checksum: 0xF18C1B93
	Offset: 0xCA0
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function init_flags()
{
	level flag::init("af_fade_in_complete");
}

/*
	Name: init_clientfields
	Namespace: namespace_4926d69e
	Checksum: 0x80F724D1
	Offset: 0xCD0
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function init_clientfields()
{
}

/*
	Name: init_scenes
	Namespace: namespace_4926d69e
	Checksum: 0x80F724D1
	Offset: 0xCE0
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function init_scenes()
{
}

/*
	Name: function_78bc26d5
	Namespace: namespace_4926d69e
	Checksum: 0xE4E9772D
	Offset: 0xCF0
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_78bc26d5()
{
	self vehicle::lights_on();
	self vehicle::toggle_force_driver_taillights(1);
}

