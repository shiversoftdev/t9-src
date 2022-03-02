#using script_1292451e284848cc;
#using script_1478fbd17fe393cf;
#using script_263b7f2982258785;
#using script_2d443451ce681a;
#using script_31e9b35aaacbbd93;
#using script_32399001bdb550da;
#using script_3dc93ca9902a9cda;
#using script_45e09f634c49fdba;
#using script_47fb62300ac0bd60;
#using script_4937c6974f43bb71;
#using script_61cfc2ab8e60625;
#using script_693a0b9bd751df83;
#using script_7cf3e180e994d17f;
#using script_7d0013bbc05623b9;
#using script_9bfd3d8a6a89e5e;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\music_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\vehicle_ai_shared.gsc;
#using scripts\core_common\vehicle_death_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\cp_common\debug.gsc;
#using scripts\cp_common\gametypes\battlechatter.gsc;
#using scripts\cp_common\gametypes\globallogic_ui.gsc;
#using scripts\cp_common\objectives.gsc;
#using scripts\cp_common\skipto.gsc;
#using scripts\cp_common\util.gsc;

#namespace namespace_38c39f5;

/*
	Name: starting
	Namespace: namespace_38c39f5
	Checksum: 0x9D3E832C
	Offset: 0x1360
	Size: 0x1BC
	Parameters: 1
	Flags: Linked
*/
function starting(str_skipto)
{
	level.player = getplayers()[0];
	namespace_7d4dd7f0::function_a2015343(str_skipto);
	plane = namespace_b100dd86::function_5431431d();
	namespace_b100dd86::function_c8381339(plane, 1);
	exploder::stop_exploder("airfield_assault_lighting_noplane");
	exploder::exploder("airfield_assault_lighting");
	setdvar(#"hash_76c0d7e6385ee6de", 0.05);
	setdvar(#"hash_62b11f12963c68d4", 2000);
	namespace_b100dd86::function_5aabc3fb();
	level thread scene::play_from_time("scene_tkd_hit3_intro", "shot 1", undefined, 1, 1, 1, 0, 0);
	trigger::use("approach_airstrip", "targetname", undefined, 0);
	thread namespace_b100dd86::function_19919872();
	thread namespace_a052577e::function_79270d32();
	thread function_9d8f5cd3();
	level clientfield::set("prop_wash", 1);
}

/*
	Name: function_614083bb
	Namespace: namespace_38c39f5
	Checksum: 0x75C62DBA
	Offset: 0x1528
	Size: 0x1EC
	Parameters: 1
	Flags: Linked
*/
function function_614083bb(str_skipto)
{
	thread namespace_a052577e::function_79270d32();
	namespace_b100dd86::function_5aabc3fb();
	level.player = getplayers()[0];
	thread namespace_a052577e::function_79270d32();
	namespace_7d4dd7f0::function_a2015343(str_skipto);
	plane = namespace_b100dd86::function_5431431d();
	namespace_b100dd86::function_c8381339(plane, 1);
	setdvar(#"hash_76c0d7e6385ee6de", 0.05);
	setdvar(#"hash_3d9a09e7ecea2271", 0);
	trigger::use("approach_airstrip", "targetname", undefined, 0);
	thread namespace_b100dd86::function_19919872();
	thread function_d9fae56b();
	function_6c9a840b();
	level.player val::set(#"chase", "allowdeath", 0);
	level flag::set("af_start_rc_car");
	level.var_e561515d thread function_f311ea18();
	thread function_326abc48();
	thread namespace_82bfe441::fade(1, "FadeFast");
}

/*
	Name: cleanup
	Namespace: namespace_38c39f5
	Checksum: 0x2EBC9E7F
	Offset: 0x1720
	Size: 0x24
	Parameters: 4
	Flags: Linked
*/
function cleanup(name, starting, direct, player)
{
}

/*
	Name: function_cca97e77
	Namespace: namespace_38c39f5
	Checksum: 0xC15E19B6
	Offset: 0x1750
	Size: 0x64
	Parameters: 4
	Flags: Linked
*/
function function_cca97e77(name, starting, direct, player)
{
	level flag::set("rc_car_on_ground");
	level flag::set("no_more_truck_chase");
}

/*
	Name: init_flags
	Namespace: namespace_38c39f5
	Checksum: 0xF2F7F5D
	Offset: 0x17C0
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function init_flags()
{
	level flag::init("af_start_rc_car");
	level flag::init("af_chase_complete");
	level flag::init("af_pressed_rc_button");
}

/*
	Name: init_clientfields
	Namespace: namespace_38c39f5
	Checksum: 0x273BB772
	Offset: 0x1830
	Size: 0x154
	Parameters: 0
	Flags: Linked
*/
function init_clientfields()
{
	clientfield::register("vehicle", "le_door_en2_death_fallout", 1, 1, "int");
	clientfield::register("vehicle", "ri_door_en2_death_fallout", 1, 1, "int");
	clientfield::register("vehicle", "4x4_getin_door", 1, 1, "int");
	clientfield::register("vehicle", "4x4_getin_door_woods", 1, 1, "int");
	clientfield::register("vehicle", "af_rc_deploy1", 1, 1, "int");
	clientfield::register("vehicle", "af_rc_deploy2", 1, 1, "int");
	clientfield::register("vehicle", "af_rc_deploy3", 1, 1, "int");
}

/*
	Name: init_scenes
	Namespace: namespace_38c39f5
	Checksum: 0xF4ACADC
	Offset: 0x1990
	Size: 0x84
	Parameters: 0
	Flags: Linked
*/
function init_scenes()
{
	animation::add_notetrack_func("le_door_en2_death_fallout_server", &function_3c807d60);
	animation::add_notetrack_func("ri_door_en2_death_fallout_server", &function_bfc3dbe5);
	scene::add_scene_func("scene_tkd_hit3_chase", &function_192e7a1, "loop");
}

/*
	Name: function_3c807d60
	Namespace: namespace_38c39f5
	Checksum: 0x2E4BC32C
	Offset: 0x1A20
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function function_3c807d60(params)
{
	self.vehicle clientfield::set("le_door_en2_death_fallout", 1);
	self.vehicle setanim(#"hash_55c97e9bf41cf070", 1, 0, 1);
}

/*
	Name: function_bfc3dbe5
	Namespace: namespace_38c39f5
	Checksum: 0x65B669C2
	Offset: 0x1A90
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function function_bfc3dbe5(params)
{
	self.vehicle clientfield::set("ri_door_en2_death_fallout", 1);
	self.vehicle setanim(#"hash_7ed3204394a2ff5e", 1, 0, 1);
}

/*
	Name: main
	Namespace: namespace_38c39f5
	Checksum: 0x82E9F3A8
	Offset: 0x1B00
	Size: 0x374
	Parameters: 2
	Flags: Linked
*/
function main(str_skipto, b_starting)
{
	player = getplayers()[0];
	player endon(#"death");
	if(b_starting)
	{
		util::delay(0.2, undefined, &namespace_2fbde9a9::function_565588e1);
	}
	level.adler dialogue::function_47b06180();
	level.adler.script_accuracy = 100;
	level.woods.script_accuracy = 100;
	setdvar(#"hash_3d9a09e7ecea2271", 0);
	level.var_2762a9c namespace_db2381c4::function_c5bbfcb8();
	level.var_2762a9c namespace_db2381c4::function_b6cccb8();
	level.var_2762a9c namespace_db2381c4::function_8e4c996d();
	level.var_2762a9c thread function_3a97edf();
	spawner::add_spawn_function_group("af_vh_enemy", "targetname", &function_db378ce0);
	vehicle::add_spawn_function_group("af_enemy_chase_veh_r", "script_noteworthy", &function_40c45b6);
	vehicle::add_spawn_function_group("af_enemy_chase_veh_l", "script_noteworthy", &function_40c45b6);
	function_d9fae56b();
	thread function_dcc35e0b();
	thread function_4c87c5cf(b_starting);
	thread function_b90ebd9a();
	thread function_9555ada1();
	wait(2);
	level flag::wait_till("af_start_ride");
	namespace_b100dd86::function_c8381339(level.var_2762a9c, 1);
	thread function_35bf824f();
	player thread function_6e899b0e();
	player thread function_e90d5c1();
	thread function_326abc48();
	level flag::wait_till("af_start_rc_car");
	thread function_761593b3();
	thread function_9509c87f();
	thread function_7730c3f4();
	level waittill(#"hash_2c1821278dd7ecb1");
	wait(2);
	level notify(#"hash_351eb749d2c8fa9c");
	if(isdefined(str_skipto))
	{
		skipto::objective_completed(str_skipto);
	}
	level.woods ai::gun_recall();
}

/*
	Name: function_95f6d250
	Namespace: namespace_38c39f5
	Checksum: 0x6FFFF858
	Offset: 0x1E80
	Size: 0xA4
	Parameters: 1
	Flags: Linked
*/
function function_95f6d250(var_d36613f6)
{
	var_7d86dbf8 = self gamepadusedlast();
	var_719ad9bc = !var_7d86dbf8 && self function_afbfaf58();
	if(var_719ad9bc)
	{
		self flag::set(var_d36613f6);
	}
	else
	{
		self flag::clear(var_d36613f6);
	}
	self thread function_269adc62(var_d36613f6);
}

/*
	Name: function_269adc62
	Namespace: namespace_38c39f5
	Checksum: 0x9F1B6175
	Offset: 0x1F30
	Size: 0x126
	Parameters: 1
	Flags: Linked
*/
function function_269adc62(var_d36613f6)
{
	self endon(#"death", #"hash_79da7f3e8e35f82d");
	var_620beea5 = self gamepadusedlast();
	var_b04af81c = self function_afbfaf58();
	while(true)
	{
		var_288becd = self gamepadusedlast();
		var_b86dfa19 = self function_afbfaf58();
		if(var_288becd != var_620beea5 || var_b86dfa19 != var_b04af81c)
		{
			var_620beea5 = var_288becd;
			var_b04af81c = var_b86dfa19;
			if(!var_620beea5 && var_b04af81c)
			{
				self flag::set(var_d36613f6);
			}
			else
			{
				self flag::clear(var_d36613f6);
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_2ccc781e
	Namespace: namespace_38c39f5
	Checksum: 0x99599EE2
	Offset: 0x2060
	Size: 0xB1C
	Parameters: 2
	Flags: Linked
*/
function function_2ccc781e(str_skipto, b_starting)
{
	vehicle::add_spawn_function_group("challenge_truck", "script_noteworthy", &function_2016824f);
	spawner::add_spawn_function_group("af_vh_rc_enemy", "targetname", &function_db378ce0);
	player = getplayers()[0];
	setdvar(#"hash_3d9a09e7ecea2271", 0);
	util::cleanupactorcorpses();
	player endon(#"death");
	level.player val::set(#"chase", "allowdeath", 0);
	player linkto(level.var_49a5d2a4);
	level.var_49a5d2a4 vehicle::get_off_path();
	pathnode = getvehiclenode("rc_chase_start", "targetname");
	level.var_49a5d2a4 thread vehicle::get_on_and_go_path(pathnode);
	player unlink();
	thread function_3c7a908d(b_starting);
	thread function_9535c641();
	thread function_e585ec0d();
	thread function_1ce84183();
	thread function_bc4a48ea();
	thread function_31c124f2();
	waitframe(1);
	org = getent("rpg_guy_plane_spot", "script_noteworthy");
	level.var_52eba6e7 = spawner::simple_spawn_single("plane_rpg_guy");
	level.var_52eba6e7 linkto(org, undefined, (0, 0, 0), vectorscale((0, 1, 0), 180));
	level.var_52eba6e7 val::set(#"hash_64a597ebec90b6f7", "ignoreall", 1);
	level waittill(#"hash_3b760cd442251b37");
	level thread dialogue::radio("vox_cp_tdwn_07400_masn_ontheground_ee", undefined, 1);
	player ghost();
	level.player val::reset(#"chase", "allow_prone");
	var_9f4d9e27 = [0:namespace_fe8e9929::function_f0104b5([2:#"hash_4b6208b00403f13f", 1:#"hash_2b29cb97f3659ab5", 0:#"hash_7aca54ffec0ead0c"], undefined, [2:#"hash_4b6208b00403f13f", 1:#"hash_2477ad1395a6639e", 0:#"hash_7aca54ffec0ead0c"], "alt_controls_activated")];
	level.player function_95f6d250("alt_controls_activated");
	wait(1);
	level.player val::reset(#"hash_11ec473621277f18", "freezecontrols");
	level.player setnoncheckpointdata("SeenRCCarTutorial", 1);
	namespace_fe8e9929::function_4c2d4fc4(#"", #"hash_449406a42e97953e", undefined, undefined, undefined, 5, undefined, 1, var_9f4d9e27);
	namespace_fe8e9929::pause();
	player thread function_8bbbfc85();
	thread function_afa87bfc(player);
	wait(1);
	thread function_1c4bdba5();
	level flag::wait_till("af_start_crash");
	level.var_49a5d2a4 sethighdetail(1);
	player enableweapons();
	namespace_82bfe441::fade(0, "FadeSlow");
	level objectives::complete("af_chase_plane_rc", level.var_c7b3a621);
	level.player notifyonplayercommand("blow_rc_car", "+vehicleattack");
	thread function_7766538b();
	player waittill(#"hash_23f138b7bfc6234");
	player show();
	level notify(#"hash_374f8d724a5aa7f5");
	player prompts::remove(#"hash_400c7c122bc26dec");
	level music::setmusicstate("none");
	level.player namespace_db2381c4::function_6539055f();
	if(!level flag::get("af_start_crash") && !level flag::get("failed_chase"))
	{
		level flag::set("failed_chase");
		level thread util::missionfailedwrapper(#"hash_4efe29bbbdba2730", #"hash_4d4c51db77bea4d0");
	}
	if(level flag::get("failed_chase"))
	{
		level waittill(#"forever");
	}
	level.player notifyonplayercommandremove("blow_rc_car", "+vehicleattack");
	level.var_e561515d makevehicleusable();
	level.var_e561515d useby(player);
	level.var_e561515d makevehicleunusable();
	level.var_e561515d linkto(level.var_2762a9c);
	setdvar(#"hash_252e699c41531f1a", 2);
	array::add(level.var_2e151cca, level.var_52eba6e7);
	foreach(guy in level.var_2e151cca)
	{
		if(isalive(guy))
		{
			guy kill();
		}
	}
	vehs = arraycombine(getvehiclearray("af_enemy_chase_veh_r", "script_noteworthy"), getvehiclearray("af_enemy_chase_veh_l", "script_noteworthy"));
	vehs = arraycombine(vehs, getvehiclearray("af_enemy_deploy_veh_f", "targetname"));
	vehs = arraycombine(vehs, getvehiclearray("af_enemy_deploy_veh_l", "targetname"));
	vehs = arraycombine(vehs, getvehiclearray("af_enemy_deploy_veh_r", "targetname"));
	foreach(veh in vehs)
	{
		veh vehicle_death::death_cleanup_riders();
		veh delete();
	}
	vehs = getvehiclearray();
	vehs = array::exclude(vehs, [1:level.var_e561515d, 0:level.var_49a5d2a4]);
	array::delete_all(vehs);
	vehs = getvehiclearray();
	if(isdefined(str_skipto))
	{
		skipto::objective_completed(str_skipto);
	}
}

/*
	Name: function_8bbbfc85
	Namespace: namespace_38c39f5
	Checksum: 0x2A15EE18
	Offset: 0x2B88
	Size: 0x294
	Parameters: 0
	Flags: Linked
*/
function function_8bbbfc85()
{
	thread function_cc5078c1();
	while(length(self getnormalizedmovement()) < 0.1)
	{
		waitframe(1);
	}
	level.player notify(#"player_driving");
	wait(1);
	if(!level flag::get("rc_boosted"))
	{
		level.player thread util::show_hint_text(#"hash_4b6208b00403f13f", 0, [2:"blow_rc_car", 1:"rc_boosted", 0:"rc_detonate"], -1);
		level.player waittill(#"hash_54e4b30e16930cbb");
	}
	level.player endon(#"hash_23f138b7bfc6234");
	var_727f982c = 20;
	var_727f982c = var_727f982c * 39.3701;
	while(true)
	{
		old_dist = distance2d(level.var_e561515d.origin, level.var_2762a9c.origin);
		wait(5);
		new_dist = distance2d(level.var_e561515d.origin, level.var_2762a9c.origin);
		if(new_dist > old_dist || (abs(old_dist - new_dist)) < var_727f982c)
		{
			level.player thread util::show_hint_text(#"hash_4b6208b00403f13f", 0, [2:"blow_rc_car", 1:"rc_boosted", 0:"rc_detonate"], -1);
			thread function_cc5078c1();
			level.player waittill(#"hash_54e4b30e16930cbb");
		}
	}
}

/*
	Name: function_cc5078c1
	Namespace: namespace_38c39f5
	Checksum: 0x8CE9BACE
	Offset: 0x2E28
	Size: 0x82
	Parameters: 0
	Flags: Linked
*/
function function_cc5078c1()
{
	level.player endon(#"hash_23f138b7bfc6234");
	while(true)
	{
		if(self boostbuttonpressed())
		{
			level.player notify(#"hash_54e4b30e16930cbb");
			level flag::set("rc_boosted");
			break;
		}
		waitframe(1);
	}
}

/*
	Name: function_1ce84183
	Namespace: namespace_38c39f5
	Checksum: 0xD36285DA
	Offset: 0x2EB8
	Size: 0xCC
	Parameters: 0
	Flags: Linked
*/
function function_1ce84183()
{
	level.player endon(#"hash_23f138b7bfc6234");
	level.player endon(#"death");
	level.var_e561515d waittill(#"death", #"killed");
	if(!level flag::get("failed_chase"))
	{
		level flag::set("failed_chase");
		level util::missionfailedwrapper(#"hash_4efe29bbbdba2730", #"hash_2f0e469c0a45ac0");
	}
}

/*
	Name: function_9509c87f
	Namespace: namespace_38c39f5
	Checksum: 0xC2A43BF2
	Offset: 0x2F90
	Size: 0x6C
	Parameters: 0
	Flags: Linked
*/
function function_9509c87f()
{
	level.woods dialogue::queue("vox_cp_tdwn_07400_wood_goddamnittheyre_69");
	level util::delay_notify(2.5, "show_rc_hint");
	level.adler dialogue::queue("vox_cp_tdwn_07400_adlr_werenotdoneyetb_2d");
}

/*
	Name: function_761593b3
	Namespace: namespace_38c39f5
	Checksum: 0x40196BEB
	Offset: 0x3008
	Size: 0x23C
	Parameters: 0
	Flags: Linked
*/
function function_761593b3()
{
	level endon(#"hash_1177fa275536c828");
	level waittill(#"hash_763e280605952eca");
	player = getplayers()[0];
	player thread util::show_hint_text(#"hash_102900bc26caa616", undefined, "rcxd_stop_hint_controller", -1);
	while(true)
	{
		if(player actionslotfourbuttonpressed())
		{
			player notify(#"hash_2384697029c5eabe");
			break;
		}
		waitframe(1);
	}
	thread namespace_82bfe441::fade(1, "FadeFast");
	level notify(#"hash_2c1821278dd7ecb1");
	level flag::set("af_pressed_rc_button");
	level music::setmusicstate("b6.0_rc");
	level objectives::complete("af_chase_plane", level.var_2762a9c);
	controller = getweapon(#"hash_1a8252eba901e734");
	player giveweapon(controller);
	player switchtoweapon(controller);
	player val::set(#"chase", "disable_weapon_cycling", 1);
	level waittill(#"hash_2000b4f0550d06a6");
	player val::reset(#"chase", "disable_weapon_cycling");
	player takeweapon(controller);
}

/*
	Name: function_7766538b
	Namespace: namespace_38c39f5
	Checksum: 0xF39E6483
	Offset: 0x3250
	Size: 0xD8
	Parameters: 0
	Flags: Linked
*/
function function_7766538b()
{
	level endon(#"hash_3f97b17eb9713c73");
	level flag::wait_till("af_start_crash");
	player = getplayers()[0];
	player prompts::create(#"hash_400c7c122bc26dec", #"hash_6e490c4cf7210a63");
	while(true)
	{
		level flag::wait_till("af_start_crash");
		level flag::wait_till_clear("af_start_crash");
	}
}

/*
	Name: function_afa87bfc
	Namespace: namespace_38c39f5
	Checksum: 0xD2BB5126
	Offset: 0x3330
	Size: 0x254
	Parameters: 1
	Flags: Linked
*/
function function_afa87bfc(player)
{
	level endon(#"hash_219f7d6f1fd1b31a");
	wait(3);
	level thread util::function_27f5f662([4:"vox_cp_tdwn_07500_adlr_getnearoneofthe_67", 3:"vox_cp_tdwn_07500_adlr_wererunningouto_0c", 2:"vox_cp_tdwn_07500_adlr_hurrybeforeitta_8a", 1:"vox_cp_tdwn_07500_adlr_getundertheplan_10", 0:"vox_cp_tdwn_07500_adlr_takeoutthelandi_3b"], "af_start_crash", 4);
	level flag::wait_till("af_plane_raise_gate");
	level notify(#"hash_4cd47970be99bc1b");
	snd::function_7db65a93(#"hash_1bdccb03a5e24d52");
	clips = getentarray("plane_floor_clip", "targetname");
	array::delete_all(clips);
	level.var_2762a9c scene::play("scene_tkd_hit3_chase_plane", "close_doors");
	if(!level flag::get("af_plane_takeoff"))
	{
		level.var_2762a9c thread scene::play("scene_tkd_hit3_chase_plane", "doorup");
	}
	level flag::wait_till("af_plane_takeoff");
	if(!level flag::get("af_doing_crash"))
	{
		level.var_2762a9c thread scene::play("scene_tkd_hit3_chase_plane", "takeoff");
		thread function_ecef49a4();
		level waittill(#"hash_1aef226070f83b0b");
		thread function_b46ef638(0.1, "starting_crash_seq");
	}
}

/*
	Name: function_ecef49a4
	Namespace: namespace_38c39f5
	Checksum: 0xA4AA9F03
	Offset: 0x3590
	Size: 0xE8
	Parameters: 0
	Flags: Linked
*/
function function_ecef49a4()
{
	level waittill(#"hash_495d3e750229a2a");
	ents = getentarray("plane_cargo", "targetname");
	ents = array::filter_classname(ents, 0, "script_model");
	foreach(ent in ents)
	{
		ent notsolid();
	}
}

/*
	Name: function_9555ada1
	Namespace: namespace_38c39f5
	Checksum: 0xB31B970A
	Offset: 0x3680
	Size: 0x2E8
	Parameters: 0
	Flags: Linked
*/
function function_9555ada1()
{
	level endon(#"hash_2c1821278dd7ecb1");
	level thread function_2205d3f9();
	level flag::wait_till("af_chase_fire_rpg");
	weapon = getweapon("launcher_standard_t9_takedown_chase");
	org = level.var_2762a9c gettagorigin("tag_body_ramp_rear_lower_animate") + vectorscale((0, 0, 1), 60);
	trucks = getvehiclearray("af_enemy_chase_veh_l", "script_noteworthy");
	truck = array::get_all_closest(level.player.origin, trucks, undefined, 1, 5000)[0];
	if(isdefined(truck))
	{
		/#
			debugaxis(truck.origin, truck.angles, 36);
		#/
		var_d5843701 = vectornormalize((truck.origin + vectorscale((0, 0, 1), 200)) - org);
		var_9441d79a = anglestoforward(truck.angles);
		missile = level.player magicmissile(weapon, org, var_d5843701);
		missile missile_settarget(truck, vectorscale((0, 0, 1), 30));
	}
	level flag::wait_till("af_start_rc_car");
	while(!flag::get("af_start_crash"))
	{
		org = level.var_2762a9c gettagorigin("tag_body_ramp_rear_lower_animate") + vectorscale((0, 0, 1), 60);
		var_d5843701 = vectornormalize((level.player.origin + vectorscale((0, 0, 1), 100)) - org);
		missile = level.player magicmissile(weapon, org, var_d5843701);
		wait(randomfloatrange(3, 5));
	}
}

/*
	Name: function_2205d3f9
	Namespace: namespace_38c39f5
	Checksum: 0xCE9F8DEA
	Offset: 0x3970
	Size: 0xFC
	Parameters: 0
	Flags: Linked
*/
function function_2205d3f9()
{
	level waittill(#"hash_6526e39540234e50");
	trucks = getvehiclearray("af_enemy_chase_veh_l", "script_noteworthy");
	truck = array::get_all_closest(level.player.origin, trucks, undefined, 1, 5000)[0];
	if(isdefined(truck))
	{
		snd::play("veh_tkd_chase_jeepbump_rev", truck);
		truck callback::function_36aab2f3(&function_bfd50c68);
		truck waittill(#"death");
		snd::play("veh_tkd_chase_jeepbump_explo_01", truck);
	}
}

/*
	Name: function_f8223b2e
	Namespace: namespace_38c39f5
	Checksum: 0x59FCD29C
	Offset: 0x3A78
	Size: 0x2B6
	Parameters: 0
	Flags: Linked
*/
function function_f8223b2e()
{
	self endon(#"death");
	level endon(#"hash_2b1bc16a2395a69d", #"hash_351eb749d2c8fa9c");
	var_93eeb60a = "shake_med";
	max_speed = 1000;
	while(true)
	{
		scalar = 1;
		if(level.var_e561515d.active === 1)
		{
			scalar = level.var_e561515d.vehspeed / max_speed;
			scalar = max(0, min(1, scalar));
		}
		source = self.origin;
		pitch = randomfloatrange(0, 0.15) * scalar;
		yaw = randomfloatrange(0, 0.15) * scalar;
		roll = 0;
		duration = randomfloatrange(0.25, 1);
		var_2038a0d5 = randomfloatrange(2.5, 3.5);
		var_f6383e50 = randomfloatrange(2.5, 3.5);
		if(var_93eeb60a == "shake_med")
		{
			pitch = randomfloatrange(0.02, 0.35) * scalar;
			yaw = randomfloatrange(0.02, 0.25) * scalar;
			roll = randomfloatrange(0.02, 0.1) * scalar;
			duration = 1;
			var_2038a0d5 = 10;
			var_f6383e50 = 7;
		}
		if(pitch + yaw > 0.025)
		{
			screenshake(source, pitch, yaw, roll, duration, 0, 0, 0, var_2038a0d5, var_f6383e50);
		}
		wait(duration);
	}
}

/*
	Name: function_9d8f5cd3
	Namespace: namespace_38c39f5
	Checksum: 0xF729C6C5
	Offset: 0x3D38
	Size: 0x2BC
	Parameters: 0
	Flags: Linked
*/
function function_9d8f5cd3()
{
	level endon(#"hash_549c71e6907f4207");
	level flag::wait_till("af_grenade_toss");
	player = getplayers()[0];
	grenade_start = level.player.origin + (vectornormalize(anglestoforward(level.player.angles)) * 12);
	badguys = getaiteamarray("axis");
	if(badguys.size > 0)
	{
		nade = badguys[0] magicgrenadetype(getweapon(#"frag_grenade"), grenade_start, (0, 0, 0), 0.05);
	}
	player dodamage(player.health * 0.8, player.origin);
	player setstance("prone");
	player playrumbleonentity("damage_heavy");
	screenshake(player.origin, 4, 2, 3, 2.5, 0, -1, 0, 5, 3, 5, 2);
	player freezecontrolsallowlook(1);
	player val::set(#"hash_2a9f7e34ecf7ff75", "allowdeath", 0);
	player val::set(#"hash_2a9f7e34ecf7ff75", "disable_weapons", 1);
	wait(3);
	player setstance("crouch");
	player val::reset_all(#"hash_2a9f7e34ecf7ff75");
	level.players[0] freezecontrolsallowlook(0);
}

/*
	Name: function_4c87c5cf
	Namespace: namespace_38c39f5
	Checksum: 0x50B20F2
	Offset: 0x4000
	Size: 0x40C
	Parameters: 1
	Flags: Linked
*/
function function_4c87c5cf(starting)
{
	level.player endon(#"death");
	plane = level.var_2762a9c;
	org = level.var_7929453e;
	org thread function_3bbaf145();
	thread namespace_b100dd86::function_1c77193b(plane);
	start_pos = struct::get("plane_chase_start_pos", "targetname");
	plane clientfield::set("clf_cargoplane_door_sparks", 1);
	level thread function_e234cffa(plane);
	exploder::exploder_stop("hit3_prop_mist");
	accel_time = 0;
	if(starting)
	{
		accel_time = 3;
	}
	org moveto(start_pos.origin, 20, accel_time, 0);
	org rotateto(start_pos.angles, 20, accel_time, 0);
	thread function_b46ef638(20, "af_player_start_ride");
	snd::function_b23661d5(level.var_49a5d2a4, "af_truck_plr");
	snd::function_b23661d5(level.var_2762a9c, "cargo_plane");
	snd::function_b23661d5(level.var_7929453e, "cargo_plane_mover");
	level waittill(#"player_lookdown");
	org moveto(start_pos.origin, 3.5, 0, 1);
	org rotateto(start_pos.angles, 3.5, 0, 1);
	flag::wait_till("af_start_ride");
	level notify(#"hash_549c71e6907f4207");
	end_pos = struct::get("plane_chase_end_pos", "targetname");
	var_bf626e36 = 53.5;
	var_e973bd14 = 6.5;
	org moveto(end_pos.origin, var_bf626e36 + var_e973bd14, 10, 0);
	org rotateto(end_pos.angles, var_bf626e36 + var_e973bd14, 10, 0);
	level endon(#"hash_2c1821278dd7ecb1");
	wait(var_bf626e36);
	if(!flag::get("af_pressed_rc_button"))
	{
		level notify(#"hash_1177fa275536c828");
		level.var_2762a9c thread scene::play("scene_tkd_hit3_chase_plane", "takeoff_fail");
		wait(1);
		if(!level flag::get("failed_chase"))
		{
			level flag::set("failed_chase");
			level util::missionfailedwrapper(#"hash_4efe29bbbdba2730", #"hash_4d4c51db77bea4d0");
		}
	}
}

/*
	Name: function_e585ec0d
	Namespace: namespace_38c39f5
	Checksum: 0xF43E9A46
	Offset: 0x4418
	Size: 0x1D4
	Parameters: 0
	Flags: Linked
*/
function function_e585ec0d()
{
	level.player endon(#"death");
	level endon(#"hash_374f8d724a5aa7f5");
	org = level.var_7929453e;
	end_pos = struct::get("plane_chase_end_pos", "targetname");
	start_pos = struct::get("rc_car_plane_start_pos", "targetname");
	org moveto(start_pos.origin, 0.01);
	org rotateto(start_pos.angles, 0.01);
	org waittilltimeout(0.2, #"movedone");
	var_bf626e36 = 30;
	var_e973bd14 = 12;
	org moveto(end_pos.origin, var_bf626e36 + var_e973bd14, 1);
	org rotateto(end_pos.angles, var_bf626e36 + var_e973bd14, 1);
	wait(var_bf626e36);
	level flag::set("af_plane_raise_gate");
	level flag::set("af_plane_takeoff");
	thread function_b46ef638(var_e973bd14, "starting_crash_seq");
}

/*
	Name: function_b46ef638
	Namespace: namespace_38c39f5
	Checksum: 0x9DDD23BC
	Offset: 0x45F8
	Size: 0x9C
	Parameters: 2
	Flags: Linked
*/
function function_b46ef638(time, end_notify)
{
	level.player endon(#"death");
	if(isdefined(end_notify))
	{
		level endon(end_notify);
	}
	if(isdefined(time))
	{
		wait(time);
	}
	level flag::set("failed_chase");
	level util::missionfailedwrapper(#"hash_4efe29bbbdba2730", #"hash_4d4c51db77bea4d0");
}

/*
	Name: function_3bbaf145
	Namespace: namespace_38c39f5
	Checksum: 0x9FD927FF
	Offset: 0x46A0
	Size: 0x140
	Parameters: 0
	Flags: Linked
*/
function function_3bbaf145()
{
	level.player endon(#"death");
	level endon(#"hash_38b829732a6ab14e");
	while(!level flag::get("af_start_rc_car"))
	{
		self thread scene::play("scene_tkd_hit3_chase_plane", "idle_drive");
		wait(randomfloatrange(5, 10));
		if(!level flag::get("af_start_rc_car"))
		{
			if(randomint(2))
			{
				self scene::play("scene_tkd_hit3_chase_plane", "swerve");
			}
			else
			{
				self scene::play("scene_tkd_hit3_chase_plane", "swerve2");
			}
		}
		else
		{
			self thread scene::play("scene_tkd_hit3_chase_plane", "idle_drive");
		}
	}
}

/*
	Name: function_3a97edf
	Namespace: namespace_38c39f5
	Checksum: 0xB23178E8
	Offset: 0x47E8
	Size: 0x2C4
	Parameters: 0
	Flags: Linked
*/
function function_3a97edf()
{
	player = getplayers()[0];
	level waittill(#"hash_3f97b17eb9713c73");
	function_41c091de(player.origin);
	self waittill(#"hash_474a6dde316a444d");
	function_c716afe1(player.origin);
	self waittill(#"hash_1780176f9d302d25");
	function_9547ba99(player.origin);
	self waittill(#"hash_75c2a1c8e3b8b7f1");
	function_43cc6136(player.origin);
	self waittill(#"hash_474a6dde316a444d");
	function_c716afe1(player.origin);
	self waittill(#"hash_474a6dde316a444d");
	function_41c091de(player.origin);
	self waittill(#"hash_a71dd4f0ea1a311");
	function_46d1f44(player.origin);
	self waittill(#"hash_a71dd4f0ea1a311");
	function_46d1f44(player.origin);
	self waittill(#"hash_474a6dde316a444d");
	function_c716afe1(player.origin);
	self waittill(#"hash_474a6dde316a444d");
	function_c716afe1(player.origin);
	self waittill(#"hash_474a6dde316a444d");
	function_41c091de(player.origin);
	self waittill(#"hash_474a6dde316a444d");
	function_c716afe1(player.origin);
	self waittill(#"hash_474a6dde316a444d");
	function_c716afe1(player.origin);
	self waittill(#"hash_474a6dde316a444d");
	function_41c091de(player.origin);
}

/*
	Name: function_41c091de
	Namespace: namespace_38c39f5
	Checksum: 0x95595CDA
	Offset: 0x4AB8
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function function_41c091de(origin)
{
	screenshake(origin, 4, 0, 2, 0.66, 0, 0.66, 0, 10, 0, 20, 2);
}

/*
	Name: function_c716afe1
	Namespace: namespace_38c39f5
	Checksum: 0x1D34E112
	Offset: 0x4B10
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function function_c716afe1(origin)
{
	screenshake(origin, 2, 0, 0, 0.5, 0, 0.5, 0, 10, 0, 20, 2);
}

/*
	Name: function_9547ba99
	Namespace: namespace_38c39f5
	Checksum: 0xD252EADC
	Offset: 0x4B68
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function function_9547ba99(origin)
{
	screenshake(origin, 4, 0, 0, 1, 0, 1, 0, 5, 0, 0, 2);
}

/*
	Name: function_43cc6136
	Namespace: namespace_38c39f5
	Checksum: 0x344958B9
	Offset: 0x4BB8
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function function_43cc6136(origin)
{
	screenshake(origin, 2, 1, 1, 1, 0.2, 0.75, 0, 4, 2, 2, 4);
}

/*
	Name: function_46d1f44
	Namespace: namespace_38c39f5
	Checksum: 0x1E5106F9
	Offset: 0x4C18
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function function_46d1f44(origin)
{
	screenshake(origin, 0, 5, 1, 1, 0, 1, 0, 0, 4, 2, 2);
}

/*
	Name: function_cd9b97a8
	Namespace: namespace_38c39f5
	Checksum: 0xCEDFFCD4
	Offset: 0x4C68
	Size: 0x3C
	Parameters: 0
	Flags: None
*/
function function_cd9b97a8()
{
	level flag::wait_till("af_start_crash");
	self delete();
}

/*
	Name: function_e234cffa
	Namespace: namespace_38c39f5
	Checksum: 0xCCF4CFBF
	Offset: 0x4CB0
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function function_e234cffa(plane)
{
	level waittill(#"hash_2c1821278dd7ecb1");
	wait(4);
	plane clientfield::set("clf_cargoplane_door_sparks", 0);
}

/*
	Name: function_d9fae56b
	Namespace: namespace_38c39f5
	Checksum: 0x9FBF851C
	Offset: 0x4D08
	Size: 0x2CC
	Parameters: 0
	Flags: Linked
*/
function function_d9fae56b()
{
	vehs = getvehiclearray("af_chase_veh", "targetname");
	var_49a5d2a4 = vehs[0];
	trigs = getentarray("get_in_truck_trig", "targetname");
	foreach(trig in trigs)
	{
		trig enablelinkto();
		trig linkto(var_49a5d2a4);
	}
	level.var_49a5d2a4 = var_49a5d2a4;
	level.var_49a5d2a4 val::set(#"chase", "allowdeath", 0);
	snd::function_b23661d5(level.var_49a5d2a4, "af_truck_plr");
	waitframe(1);
	var_87816bd7 = getent("bronco_probe", "targetname");
	if(isdefined(var_87816bd7))
	{
		var_87816bd7 linkto(level.var_49a5d2a4, "tag_body_animate", vectorscale((0, 0, 1), 44), (0, 0, 0));
	}
	var_c4042c90 = getent("bronco_bed_probe", "targetname");
	if(isdefined(var_c4042c90))
	{
		var_c4042c90 linkto(level.var_49a5d2a4, "tag_body_animate", (-48, 0, 56), (0, 0, 0));
	}
	level.var_49a5d2a4 vehicle::lights_on();
	level.var_49a5d2a4 vehicle::toggle_force_driver_taillights(1);
	level.var_49a5d2a4 namespace_db2381c4::function_4c265dee();
	level.var_49a5d2a4 thread function_c0061b42();
	level.var_49a5d2a4 setmovingplatformenabled(1, 0);
}

/*
	Name: function_b90ebd9a
	Namespace: namespace_38c39f5
	Checksum: 0xEA748AD4
	Offset: 0x4FE0
	Size: 0x974
	Parameters: 0
	Flags: Linked
*/
function function_b90ebd9a()
{
	util::magic_bullet_shield(level.woods);
	level.woods thread util::function_27f5f662([2:"vox_cp_tdwn_07200_wood_getinwecancatch_96", 1:"vox_cp_tdwn_07200_wood_hopin_3f", 0:"vox_cp_tdwn_07200_wood_letsgomoveit_7f"], "af_player_start_ride", 3);
	level objectives::complete("af_follow_adler", level.adler);
	objectives::function_4eb5c04a("af_get_in_truck", level.var_49a5d2a4 gettagorigin("tag_bed") + vectorscale((0, 0, 1), 24));
	level flag::wait_till_any([2:"af_player_get_in_right", 1:"af_player_get_in_left", 0:"af_player_get_in_back"]);
	level.player namespace_6cecf2d8::function_9fa1a484();
	level.player setstance("stand");
	level.player val::set(#"chase", "allow_crouch", 0);
	level.player val::set(#"chase", "allow_prone", 0);
	snd::function_7db65a93("af_truck_plr_in");
	level flag::set("af_player_start_ride");
	level battlechatter::function_2ab9360b(0);
	level objectives::complete("af_get_in_truck");
	level.player = level.players[0];
	level.player namespace_db2381c4::function_ec0a577();
	thread function_d3cdf2a7();
	var_7e4a7b32 = getweapon(#"ar_accurate_t9");
	level.adler setweapon(var_7e4a7b32);
	level.player.fakeplayer = util::spawn_player_clone(level.player);
	level.player.fakeplayer.targetname = "FakePlayer 2";
	level.player.fakeplayer ghost();
	level.player.fakeplayer dontinterpolate();
	util::nvidiaansel_scriptdisable(1);
	shot = undefined;
	if(level flag::get("af_player_get_in_back"))
	{
		shot = "get_in";
		anim = #"hash_5916909863e780a8";
	}
	else
	{
		if(level flag::get("af_player_get_in_right"))
		{
			shot = "get_in_right";
			anim = #"hash_139b3208e93b39f5";
		}
		else
		{
			shot = "get_in_left";
			anim = #"hash_697f6a68b0ce4e60";
		}
	}
	level.player val::set(#"getin", "allowdeath", 0);
	savegame::checkpoint_save(1);
	level.var_49a5d2a4 thread scene::play("scene_tkd_hit3_chase_getin", "get_in");
	level.var_49a5d2a4 clientfield::set("4x4_getin_door", 1);
	level.var_49a5d2a4 setanim(#"hash_7e2b806a227352d0", 1, 0, 1);
	level thread function_db746914(shot);
	wait(0.05);
	var_1ae5ba85 = 0.2;
	var_84ce1e3d = 0.5;
	velocity = level.player getvelocity();
	speed = length(velocity);
	var_61316b5 = math::normalize_value(179, 324, speed);
	blendtime = lerpfloat(var_84ce1e3d, var_1ae5ba85, var_61316b5);
	var_9c329e3d = lerpfloat(0.5, 0, var_61316b5);
	var_1f85a945 = lerpfloat(0.5, 0, var_61316b5);
	if(blendtime < 0.4)
	{
		var_3bf4cdb7 = 2;
	}
	else
	{
		var_3bf4cdb7 = 1;
	}
	level.player val::set(#"chase", "disable_weapons", var_3bf4cdb7);
	level.player val::set(#"chase", "freezecontrols", 1);
	level.player playerlinktoblend(level.player.fakeplayer, "tag_player", blendtime, blendtime * var_9c329e3d, 0, blendtime, blendtime * var_1f85a945, 0, 1);
	wait(blendtime);
	level.player.fakeplayer show();
	level waittill(#"raise_gun");
	level.player val::reset(#"getin", "allowdeath");
	thread namespace_a052577e::function_bbedb5ab();
	level.player allowjump(0);
	level.player val::set(#"hash_7b049ed4cd7a4d6b", "allow_mantle", 0);
	level.player val::reset(#"chase", "freezecontrols");
	level.player val::reset(#"chase", "disable_weapons");
	util::nvidiaansel_scriptdisable(0);
	level flag::set("af_start_ride");
	level.var_49a5d2a4 thread vehicle::go_path();
	objectives::function_4eb5c04a("af_chase_plane", level.var_2762a9c);
	objectives::function_67f87f80("af_chase_plane", [0:level.var_2762a9c], #"hash_2b84cc72687b168a");
	level.player thread function_f8223b2e();
	level waittill(#"hash_7dd48b5765cd3020");
	level.woods stopanimscripted();
	level.var_49a5d2a4 thread scene::play("scene_tkd_hit3_chase");
	level.var_49a5d2a4 thread function_8d9f9fd7();
	waitframe(1);
	function_6c9a840b();
	level.adler thread dialogue::queue("vox_cp_tdwn_07200_adlr_gogo_ef");
}

/*
	Name: function_192e7a1
	Namespace: namespace_38c39f5
	Checksum: 0xAC4E6111
	Offset: 0x5960
	Size: 0x74
	Parameters: 1
	Flags: Linked
*/
function function_192e7a1(a_ents)
{
	var_9af87fb8 = a_ents[#"hash_11cd06b03a240cf3"];
	var_9af87fb8 notsolid();
	level flag::wait_till("af_start_rc_car");
	var_9af87fb8 hide();
}

/*
	Name: function_db746914
	Namespace: namespace_38c39f5
	Checksum: 0xEA276F34
	Offset: 0x59E0
	Size: 0x114
	Parameters: 1
	Flags: Linked
*/
function function_db746914(shot)
{
	level.var_49a5d2a4 scene::play("scene_tkd_hit3_chase_getin_player", shot, level.player.fakeplayer);
	level.player unlink();
	level.woods notsolid();
	level.adler notsolid();
	level.player val::reset(#"chase", "allow_crouch");
	level.player.overrideplayerdamage = &function_132b6d19;
	if(isdefined(level.player.fakeplayer))
	{
		level.player.fakeplayer delete();
	}
}

/*
	Name: function_132b6d19
	Namespace: namespace_38c39f5
	Checksum: 0xA6CFEFCF
	Offset: 0x5B00
	Size: 0x86
	Parameters: 12
	Flags: Linked
*/
function function_132b6d19(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex)
{
	if(isdefined(boneindex) && boneindex == level.var_49a5d2a4)
	{
		return false;
	}
}

/*
	Name: function_6c9a840b
	Namespace: namespace_38c39f5
	Checksum: 0x5C0FD766
	Offset: 0x5B90
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function function_6c9a840b()
{
	level.var_e561515d = vehicle::simple_spawn("player_rc_car")[0];
	level.var_e561515d makevehicleunusable();
	level.var_e561515d notsolid();
}

/*
	Name: function_dcc35e0b
	Namespace: namespace_38c39f5
	Checksum: 0x99FD4EBD
	Offset: 0x5BF8
	Size: 0x274
	Parameters: 0
	Flags: Linked
*/
function function_dcc35e0b()
{
	level flag::wait_till("woods_get_in_truck");
	if(!flag::get("woods_waiting_at_truck"))
	{
		level flag::wait_till_any([2:"af_player_get_in_right", 1:"af_player_get_in_left", 0:"af_player_get_in_back"]);
		level waittill(#"player_lookdown");
	}
	level.var_49a5d2a4 thread scene::play("scene_tkd_hit3_pre_chase", "exit", [0:level.woods]);
	level.var_49a5d2a4 clientfield::set("4x4_getin_door_woods", 1);
	level.var_49a5d2a4 setanim(#"hash_7310b4167a3dbe5f", 1, 0, 1);
	if(!flag::get_any([2:"af_player_get_in_right", 1:"af_player_get_in_left", 0:"af_player_get_in_back"]))
	{
		level waittill(#"hash_17a948f941d73226");
		if(!flag::get_any([2:"af_player_get_in_right", 1:"af_player_get_in_left", 0:"af_player_get_in_back"]))
		{
			level flag::wait_till_any([2:"af_player_get_in_right", 1:"af_player_get_in_left", 0:"af_player_get_in_back"]);
			level.var_49a5d2a4 thread scene::play("scene_tkd_hit3_pre_chase", "chase_start", [0:level.woods]);
		}
	}
}

/*
	Name: function_8d9f9fd7
	Namespace: namespace_38c39f5
	Checksum: 0x74ECB0AB
	Offset: 0x5E78
	Size: 0x1C2
	Parameters: 0
	Flags: Linked
*/
function function_8d9f9fd7()
{
	level endon(#"hash_4e525a53534172f4");
	skip_idle = 0;
	while(true)
	{
		if(!skip_idle)
		{
			self thread scene::play("scene_tkd_hit3_chase_adler", "loop");
		}
		wait(randomfloatrange(1, 5));
		vehs = getvehiclearray("af_enemy_chase_veh_r", "script_noteworthy");
		if(vehs.size > 0)
		{
			vehs = array::get_all_closest(level.adler.origin, vehs);
			dot = level.var_49a5d2a4 math::get_dot_forward(vehs[0].origin, 1, 1);
			shot = "shoot_right_";
			if(dot > 0.2)
			{
				shot = "shoot_forward_";
			}
			else if(dot < -0.2)
			{
				shot = "shoot_behind_";
			}
			shot = shot + (string(randomint(2) + 1));
			self scene::play("scene_tkd_hit3_chase_adler", shot);
			skip_idle = 0;
		}
		else
		{
			skip_idle = 1;
		}
	}
}

/*
	Name: function_c0061b42
	Namespace: namespace_38c39f5
	Checksum: 0x493955DE
	Offset: 0x6048
	Size: 0x70
	Parameters: 0
	Flags: Linked
*/
function function_c0061b42()
{
	self endon(#"death");
	while(true)
	{
		self waittill(#"fx_door_open");
		self namespace_db2381c4::function_4b711786();
		self waittill(#"fx_door_closed");
		self namespace_db2381c4::function_b21aeabe();
	}
}

/*
	Name: function_d4dfd1df
	Namespace: namespace_38c39f5
	Checksum: 0xAA5BAEC7
	Offset: 0x60C0
	Size: 0x6E
	Parameters: 0
	Flags: None
*/
function function_d4dfd1df()
{
	self endon(#"death");
	/#
		while(true)
		{
			util::debug_line(self.origin, self.origin + vectorscale((0, 0, 1), 5000), (0, 1, 0), undefined, undefined, 1);
			waitframe(1);
		}
	#/
}

/*
	Name: function_d3cdf2a7
	Namespace: namespace_38c39f5
	Checksum: 0xBE930C31
	Offset: 0x6138
	Size: 0x14C
	Parameters: 0
	Flags: Linked
*/
function function_d3cdf2a7()
{
	level flag::wait_till("af_player_start_ride");
	level waittill(#"player_lookdown");
	thread function_142791a7();
	vehs = vehicle::simple_spawn("af_enemy_chase_veh");
	level.var_57c220b5 = 0;
	foreach(veh in vehs)
	{
		snd::function_b23661d5(veh, "af_enemy_chase_veh");
	}
	snd::function_7db65a93(#"hash_706ce4bbfd6f3342");
	snd::function_7db65a93(#"hash_754239f68f68db30");
}

/*
	Name: function_142791a7
	Namespace: namespace_38c39f5
	Checksum: 0x1241C46B
	Offset: 0x6290
	Size: 0x2F8
	Parameters: 0
	Flags: Linked
*/
function function_142791a7()
{
	level.var_d18d2af9 = [];
	level.var_d18d2af9[#"hash_c76662249694a15"] = 0;
	level.var_d18d2af9[#"hash_c7658224969324b"] = 0;
	sides = [1:"af_enemy_chase_veh_r", 0:"af_enemy_chase_veh_l"];
	foreach(side in sides)
	{
		level.var_d18d2af9[side] = 0;
		level flag::set(side);
	}
	while(!level flag::get("af_start_rc_car"))
	{
		foreach(side in sides)
		{
			if(level.var_d18d2af9[side] <= 0 && !level flag::get(side))
			{
				level.var_d18d2af9[side] = 0;
				level flag::set(side);
			}
			if(level.var_d18d2af9[side] > 0 && level flag::get(side))
			{
				level flag::clear(side);
				trigs = getentarray(side + "_trig", "targetname");
				foreach(trig in trigs)
				{
					trig triggerenable(0);
				}
			}
		}
		wait(0.1);
	}
}

/*
	Name: function_3683d2e8
	Namespace: namespace_38c39f5
	Checksum: 0xDCEB35C1
	Offset: 0x6590
	Size: 0x72
	Parameters: 1
	Flags: Linked
*/
function function_3683d2e8(truck)
{
	level.var_d18d2af9[truck.script_noteworthy]++;
	truck waittill(#"death", #"kill_self", #"hash_38e103e482582e7f");
	level.var_d18d2af9[truck.script_noteworthy]--;
}

/*
	Name: function_bfd50c68
	Namespace: namespace_38c39f5
	Checksum: 0x3280964B
	Offset: 0x6610
	Size: 0xBC
	Parameters: 1
	Flags: Linked
*/
function function_bfd50c68(params)
{
	var_53c5484a = 500;
	if(!isdefined(self.var_4810ca3e))
	{
		self.var_4810ca3e = 0;
	}
	if(isalive(self) && isdefined(params.entity) && params.entity == level.var_49a5d2a4 && gettime() > self.var_4810ca3e)
	{
		self.var_4810ca3e = gettime() + var_53c5484a;
		self notify(#"crunch");
		snd::play("veh_tkd_chase_jeepbump_impact", self);
	}
}

/*
	Name: function_35bf824f
	Namespace: namespace_38c39f5
	Checksum: 0x41682440
	Offset: 0x66D8
	Size: 0x1EE
	Parameters: 0
	Flags: Linked
*/
function function_35bf824f()
{
	level endon(#"hash_4e525a53534172f4");
	var_be9333bc = [2:"vox_cp_tdwn_07300_adlr_truckontheright_c6", 1:"vox_cp_tdwn_07300_adlr_enemytotheright_c1", 0:"vox_cp_tdwn_07300_adlr_lookright_f4"];
	var_539f7582 = [2:"vox_cp_tdwn_07300_adlr_lookleft_81", 1:"vox_cp_tdwn_07300_adlr_trucktotheleft_59", 0:"vox_cp_tdwn_07300_adlr_totheleft_10"];
	var_ea3f660f = 0;
	var_fb6cba84 = 0;
	while(true)
	{
		ret = undefined;
		ret = level waittill(#"hash_23db14c35403da49");
		wait(randomfloatrange(3, 6));
		if(isdefined(ret.veh) && isalive(ret.veh))
		{
			switch(ret.veh.script_noteworthy)
			{
				case "hash_c76662249694a15":
				{
					level.adler dialogue::queue(var_be9333bc[var_fb6cba84]);
					var_fb6cba84++;
					if(var_fb6cba84 >= var_be9333bc.size)
					{
						var_fb6cba84 = 0;
					}
					break;
				}
				case "hash_c7658224969324b":
				{
					level.adler dialogue::queue(var_539f7582[var_ea3f660f]);
					var_ea3f660f++;
					if(var_ea3f660f >= var_539f7582.size)
					{
						var_ea3f660f = 0;
					}
					break;
				}
			}
		}
	}
}

/*
	Name: function_40c45b6
	Namespace: namespace_38c39f5
	Checksum: 0x5274EB9C
	Offset: 0x68D0
	Size: 0x29C
	Parameters: 0
	Flags: Linked
*/
function function_40c45b6()
{
	self endon(#"death");
	level notify(#"hash_23db14c35403da49", {#veh:self});
	snd::function_b23661d5(self, "af_enemy_chase_veh");
	thread function_3683d2e8(self);
	self.takedamage = 1;
	while(!isdefined(self.var_761c973.riders[#"driver"]))
	{
		wait(0.1);
	}
	self thread function_236fa45d();
	driver = self.var_761c973.riders[#"driver"];
	self thread function_b5d668a4(driver);
	player = getplayers()[0];
	self thread function_367b3229(player);
	waitframe(1);
	self vehicle::lights_on();
	self vehicle::toggle_force_driver_taillights(1);
	self thread function_afa8ab9f();
	self waittill(#"kill_self");
	self flag::set("fake_dying");
	snd::play("veh_tkd_chase_npc_jeeps_skid_stop", self);
	self thread function_149a7584(level.var_49a5d2a4);
	to_the_right = 0;
	if(math::get_dot_right(player.origin, 1, 1) >= 0)
	{
		to_the_right = 1;
	}
	if(isdefined(driver) && isalive(driver) && randomfloat(1) >= 0.25)
	{
		wait(0.5);
		self function_ba23e9b(level.player, to_the_right);
	}
}

/*
	Name: function_ba23e9b
	Namespace: namespace_38c39f5
	Checksum: 0x2CFA7875
	Offset: 0x6B78
	Size: 0x18C
	Parameters: 2
	Flags: Linked
*/
function function_ba23e9b(player, to_the_right)
{
	self vehicle::get_off_path();
	wait(0.1);
	right_vec = anglestoright(self.angles);
	var_a7ccb4c1 = anglestoforward(self.angles);
	var_43939108 = vectorscale((-1, 0, 0), 6);
	var_5fb21670 = (0, 0, 0);
	if(!to_the_right)
	{
		var_43939108 = var_43939108 + (right_vec * 24);
		var_5fb21670 = -1 * right_vec;
	}
	else
	{
		var_43939108 = var_43939108 - (right_vec * 24);
		var_5fb21670 = right_vec;
	}
	var_5fb21670 = vectornormalize(var_5fb21670);
	var_5fb21670 = var_5fb21670 + (0, 0, 1);
	var_5fb21670 = var_5fb21670 * 100;
	self launchvehicle(var_5fb21670, var_43939108, 1, 1);
	self delete_riders(1);
	wait(randomfloatrange(0.75, 1.5));
	if(self.takedamage)
	{
		self kill();
	}
}

/*
	Name: function_afa8ab9f
	Namespace: namespace_38c39f5
	Checksum: 0x954D0E5A
	Offset: 0x6D10
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_afa8ab9f()
{
	self endon(#"death");
	self endon(#"delete");
	self waittill(#"hash_38e103e482582e7f");
	self vehicle::get_off_path();
}

/*
	Name: function_367b3229
	Namespace: namespace_38c39f5
	Checksum: 0x154C5825
	Offset: 0x6D68
	Size: 0x92
	Parameters: 1
	Flags: Linked
*/
function function_367b3229(target)
{
	self endon(#"death");
	self endon(#"kill_self");
	self endon(#"delete");
	while(isalive(self))
	{
		self.var_135dba79 = self math::get_dot_forward(target.origin, 1);
		waitframe(1);
		waitframe(1);
	}
}

/*
	Name: function_b5d668a4
	Namespace: namespace_38c39f5
	Checksum: 0xF8E91764
	Offset: 0x6E08
	Size: 0x1AE
	Parameters: 1
	Flags: Linked
*/
function function_b5d668a4(passenger)
{
	self endon(#"death");
	level endon(#"hash_4e525a53534172f4");
	passenger endon(#"death");
	passenger.dontdropweapon = 1;
	passenger.var_ec30f5da.ridedeathanim = undefined;
	passenger notify(#"new_death_anim");
	self thread function_868edfac(passenger);
	while(passenger.health > 1)
	{
		ret = undefined;
		ret = passenger waittill(#"damage");
		if(passenger.health > 1)
		{
			level.player playhitmarker(undefined, 5, undefined, 0, 0, 0);
		}
	}
	level.player playhitmarker(undefined, 5, undefined, 1);
	passenger notify(#"fake_death");
	passenger stopanimscripted();
	if(isalive(self))
	{
		self thread scene::play("scene_tkd_hit3_chase_jeep_driver", "death", [0:passenger]);
	}
	self notify(#"kill_self");
}

/*
	Name: function_868edfac
	Namespace: namespace_38c39f5
	Checksum: 0x688A3CA5
	Offset: 0x6FC0
	Size: 0x190
	Parameters: 1
	Flags: Linked
*/
function function_868edfac(passenger)
{
	self endon(#"death");
	self endon(#"hash_2b34ed034183965");
	passenger endon(#"fake_death");
	passenger endon(#"death");
	while(isalive(self))
	{
		self thread scene::play("scene_tkd_hit3_chase_jeep_driver", "idle", [0:passenger]);
		wait(randomfloatrange(3, 5));
		while(self.var_135dba79 > 0)
		{
			wait(randomfloatrange(1, 3));
		}
		if(isalive(self))
		{
			if(self.script_noteworthy == "af_enemy_chase_veh_r")
			{
				self scene::play("scene_tkd_hit3_chase_jeep_driver", "Look_Back_Left", [0:passenger]);
			}
			else
			{
				self scene::play("scene_tkd_hit3_chase_jeep_driver", "Look_Back_Right", [0:passenger]);
			}
		}
	}
}

/*
	Name: delete_riders
	Namespace: namespace_38c39f5
	Checksum: 0xD46C0B59
	Offset: 0x7158
	Size: 0x1E2
	Parameters: 1
	Flags: Linked
*/
function delete_riders(launch)
{
	if(!isdefined(launch))
	{
		launch = 0;
	}
	if(isdefined(self.var_761c973) && isdefined(self.var_761c973.riders))
	{
		foreach(rider in self.var_761c973.riders)
		{
			if(isdefined(rider))
			{
				rider notify(#"fake_death");
				if(launch)
				{
					rider stopanimscripted();
					rider val::set("chase_enemy", "allowdeath", 1);
					rider unlink();
					rider startragdoll(1);
					launch_force = rider.origin - self.origin;
					launch_force = (vectornormalize(launch_force) + anglestoup(self.angles)) * 50;
					rider launchragdoll(launch_force);
					continue;
				}
				rider deletedelay();
			}
		}
		self.var_761c973.riders = [];
	}
}

/*
	Name: function_236fa45d
	Namespace: namespace_38c39f5
	Checksum: 0x2EA11B3
	Offset: 0x7348
	Size: 0x70
	Parameters: 0
	Flags: Linked
*/
function function_236fa45d()
{
	level endon(#"death");
	self waittill(#"death");
	self delete_riders(1);
	level.var_57c220b5++;
	level notify(#"hash_25795a7707b10909");
}

/*
	Name: function_9535c641
	Namespace: namespace_38c39f5
	Checksum: 0x70BBCC37
	Offset: 0x73C0
	Size: 0x218
	Parameters: 0
	Flags: Linked
*/
function function_9535c641()
{
	level.var_55e62e4f = vehicle::simple_spawn_and_drive("af_enemy_deploy_veh_r");
	level.var_55e62e4f = arraycombine(level.var_55e62e4f, vehicle::simple_spawn_and_drive("af_enemy_deploy_veh_l"));
	level.var_55e62e4f = arraycombine(level.var_55e62e4f, vehicle::simple_spawn_and_drive("af_enemy_deploy_veh_f"));
	level.var_57c220b5 = 0;
	foreach(veh in level.var_55e62e4f)
	{
		veh.script_noteworthy = "rc_enemy";
		level.var_d18d2af9[veh.script_noteworthy] = 0;
		veh thread function_40c45b6();
		veh thread function_e6320cb3();
		veh vehicle::lights_on();
		veh vehicle::toggle_force_driver_taillights(1);
		veh thread function_6b9d341b();
		if(getdvarint(#"hash_1d23302b87198714", 0) == 1)
		{
			veh vehicle::god_on();
			veh val::set(#"hash_7b049ed4cd7a4d6b", "allowdeath", 0);
		}
	}
}

/*
	Name: function_6b9d341b
	Namespace: namespace_38c39f5
	Checksum: 0xF0B6916C
	Offset: 0x75E0
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function function_6b9d341b()
{
	self endon(#"death");
	self waittill(#"lights_off");
	self vehicle::lights_off();
	self vehicle::toggle_force_driver_taillights(0);
}

/*
	Name: function_7730c3f4
	Namespace: namespace_38c39f5
	Checksum: 0xBA3C2975
	Offset: 0x7640
	Size: 0x160
	Parameters: 0
	Flags: Linked
*/
function function_7730c3f4()
{
	level.var_e561515d thread function_f311ea18(1);
	level.player = level.players[0];
	level.var_49a5d2a4 clientfield::set("af_rc_deploy1", 1);
	level.var_49a5d2a4 setanim(#"hash_65fb765a66b27ef1", 1, 0, 1);
	level scene::play("scene_tkd_hit3_chase_deploy_rc", "enter");
	level thread scene::play("scene_tkd_hit3_chase_deploy_rc", "loop");
	level.var_49a5d2a4 setanim(#"hash_77cbdb56c22e71f", 1, 0, 1);
	level.var_49a5d2a4 clientfield::set("af_rc_deploy2", 1);
	level waittill(#"hash_32caebf20e289c77");
	waitframe(1);
	wait(2);
}

/*
	Name: function_3c7a908d
	Namespace: namespace_38c39f5
	Checksum: 0xA68B8A2C
	Offset: 0x77A8
	Size: 0x74C
	Parameters: 1
	Flags: Linked
*/
function function_3c7a908d(b_starting)
{
	thread namespace_a052577e::function_b3b2671a(level.player);
	snd::function_b23661d5(level.var_2762a9c, "cargo_plane");
	snd::function_b23661d5(level.var_7929453e, "cargo_plane_mover");
	snd::function_b23661d5(level.var_49a5d2a4, "af_truck_plr");
	snd::function_b23661d5(level.var_e561515d, "rc_car_plr");
	thread namespace_a052577e::function_1e281573();
	level.var_49a5d2a4 clientfield::set("af_rc_deploy3", 1);
	level.var_49a5d2a4 setanim(#"hash_3be8472c6114d6b6", 1, 0, 1);
	level thread scene::play("scene_tkd_hit3_chase_deploy_rc", "exit");
	level.player namespace_db2381c4::function_701c25a5();
	level.player util::delay(0.5, undefined, &namespace_db2381c4::function_a31136d8);
	level waittill(#"hash_2b34ed034183965");
	level flag::set("no_more_truck_chase");
	vehs = arraycombine(getvehiclearray("af_enemy_chase_veh_l", "script_noteworthy"), getvehiclearray("af_enemy_chase_veh_r", "script_noteworthy"));
	foreach(veh in vehs)
	{
		veh vehicle_death::death_cleanup_riders();
		veh delete();
	}
	guys = getaiarray("af_vh_enemy", "targetname");
	array::delete_all(guys);
	level notify(#"hash_2384697029c5eabe");
	guys = getaiteamarray("axis");
	guys = array::exclude(level.var_2e151cca);
	array::delete_all(guys);
	corpses = ai::function_4f84c3ed();
	array::delete_all(corpses);
	level.player namespace_db2381c4::function_2be1d5b0();
	self thread scene::play("scene_tkd_hit3_chase_adler", "loop");
	level.var_49a5d2a4 thread scene::play("scene_tkd_hit3_chase", "loop");
	waitframe(1);
	level.player enableweapons();
	level.player stopanimscripted(0, 1);
	level.var_e561515d solid();
	level.var_e561515d unlink();
	level.var_e561515d stopanimscripted(0, 1);
	level.player setplayerangles((0, 0, 0));
	level.var_e561515d makevehicleusable();
	waitframe(1);
	level.player val::set(#"hash_11ec473621277f18", "freezecontrols", 1);
	var_a00e7b18 = level.var_49a5d2a4.angles - vectorscale((0, 1, 0), 3);
	level.var_e561515d.angles = var_a00e7b18;
	push = 42;
	if(b_starting)
	{
		push = 36;
	}
	level.var_e561515d launchvehicle(vectornormalize(anglestoforward(var_a00e7b18)) * push);
	wait(0.5);
	waitframe(1);
	if(!level.player vehicle::player_is_driver())
	{
		level notify(#"hash_2384697029c5eabe");
		level.var_e561515d makevehicleusable();
		level.var_e561515d usevehicle(level.player, 0);
	}
	level.var_e561515d makevehicleunusable();
	waitframe(1);
	level notify(#"hash_3b760cd442251b37");
	level flag::set("rc_car_on_ground");
	level notify(#"hash_6f65948492627624");
	level.var_e561515d thread function_c6a4d54b();
	wait(0.5);
	n_current_speed = level.var_49a5d2a4 getspeedmph();
	level.var_49a5d2a4 setspeed(n_current_speed * 0.8);
	level objectives::function_4eb5c04a("af_chase_plane_rc", level.var_c7b3a621);
	level objectives::function_67f87f80("af_chase_plane_rc", [0:level.var_c7b3a621], #"hash_2b84cc72687b168a");
}

/*
	Name: function_53e16f01
	Namespace: namespace_38c39f5
	Checksum: 0xF8F2C3C5
	Offset: 0x7F00
	Size: 0x226
	Parameters: 1
	Flags: Linked
*/
function function_53e16f01(params)
{
	/#
		if(getdvarint(#"hash_72994415c8ecf806", 0) > 0)
		{
			return;
		}
	#/
	if(!isdefined(self.var_1b3a6aa9))
	{
		self.var_1b3a6aa9 = 0;
	}
	var_d1148f2f = 1000;
	screenshake(self.origin, 2, 2, 6, 1, 0, -1, 0, 8, 4, 2, 2);
	level.player playrumbleonentity("damage_heavy");
	if(isdefined(params.entity) && (!(isdefined(params.entity.targetname) && params.entity.targetname == "crater_clip")))
	{
		var_a7ccb4c1 = anglestoforward(self.angles);
		dot = vectordot(var_a7ccb4c1, params.normal);
		var_9602c3bf = params.normal;
		if(dot < 0)
		{
			var_9602c3bf = vectornormalize(params.normal + var_a7ccb4c1);
		}
		knockback = -5;
		self launchvehicle(params.normal * knockback, (0, 0, 0), 1, 0);
	}
	if(isdefined(params.entity) && gettime() > self.var_1b3a6aa9)
	{
		self namespace_db2381c4::function_6bd3950d(25);
		self.var_1b3a6aa9 = gettime() + var_d1148f2f;
	}
}

/*
	Name: function_bc4a48ea
	Namespace: namespace_38c39f5
	Checksum: 0x50CA4104
	Offset: 0x8130
	Size: 0x268
	Parameters: 0
	Flags: Linked
*/
function function_bc4a48ea()
{
	level endon(#"death");
	level waittill(#"hash_3b760cd442251b37");
	wait(5);
	weapon = getweapon("launcher_standard_t9_takedown_chase");
	while(!level flag::get("af_plane_raise_gate") && isalive(level.var_52eba6e7))
	{
		org = level.var_52eba6e7 gettagorigin("tag_flash");
		var_b26e76e3 = level.var_e561515d.origin + ((vectornormalize(anglestoforward(level.var_e561515d.angles)) + ((vectornormalize(org - level.var_e561515d.origin)) * 0.5)) * 750);
		var_b26e76e3 = (var_b26e76e3[0], var_b26e76e3[1], level.var_e561515d.origin[2]);
		if(distancesquared(var_b26e76e3, org) < 40000)
		{
			var_b26e76e3 = level.var_e561515d.origin;
		}
		var_d5843701 = vectornormalize(var_b26e76e3 - org);
		missile = level.player magicmissile(weapon, org, var_d5843701);
		playfxontag(#"hash_338c0ef8c7e88199", level.var_52eba6e7, "tag_flash");
		missile thread function_e652a247();
		wait(randomfloatrange(3, 6));
	}
}

/*
	Name: function_e652a247
	Namespace: namespace_38c39f5
	Checksum: 0x6F2E464C
	Offset: 0x83A0
	Size: 0x246
	Parameters: 0
	Flags: Linked
*/
function function_e652a247()
{
	level endon(#"death");
	level endon(#"hash_38b829732a6ab14e");
	getplayers()[0] endon(#"death");
	runway_org = struct::get("runway_center", "targetname");
	self waittill(#"death");
	/#
	#/
	crater = spawn("script_model", (self.origin[0], self.origin[1], runway_org.origin[2]));
	crater hide();
	crater.angles = (0, randomfloatrange(0, 360), 0);
	crater setmodel("p8_zm_esc_spawn_cap_crater");
	snd::play("wpn_tkd_chase_rpg_imp", self);
	crater setscale(0.15);
	crater show();
	clip = getent("crater_clip", "targetname");
	if(isdefined(clip) && isdefined(crater))
	{
		clip.origin = crater.origin;
		clip.angles = crater.angles;
		level waittill(#"hash_374f8d724a5aa7f5");
		crater delete();
		clip.origin = clip.origin - vectorscale((0, 0, 1), 20);
	}
}

/*
	Name: function_c6a4d54b
	Namespace: namespace_38c39f5
	Checksum: 0x2D637E96
	Offset: 0x85F0
	Size: 0x27C
	Parameters: 0
	Flags: Linked
*/
function function_c6a4d54b()
{
	level endon(#"hash_38b829732a6ab14e");
	level flag::wait_till("af_enemy_skid");
	while(level.var_e561515d.angles[1] > 10 && level.var_e561515d.angles[1] < 180)
	{
		waitframe(1);
	}
	var_4a0d7a89 = level.var_e561515d getspeedmph();
	if(var_4a0d7a89 < 63)
	{
		wait(2);
	}
	thread function_f92dfd2c();
	y_offset = 500;
	if(level.var_e561515d.origin[1] > level.var_2762a9c.origin[1])
	{
		y_offset = 100 + (level.var_e561515d.origin[1] - level.var_2762a9c.origin[1]);
	}
	org = util::spawn_model("tag_origin", level.var_2762a9c.origin, (0, 0, 0));
	org linkto(level.var_2762a9c, undefined, (500, y_offset, -15), (0, 0, 0));
	veh = vehicle::simple_spawn_single_and_drive("skid_veh");
	snd::function_b23661d5(veh, "skid_veh");
	thread namespace_a052577e::function_32f20d13(veh);
	wait(0.1);
	veh vehicle::lights_on();
	veh vehicle::toggle_force_driver_taillights(1);
	org scene::play("scene_tkd_hit3_chase_jeep_deaths", "runway_skid", [0:veh]);
}

/*
	Name: function_f92dfd2c
	Namespace: namespace_38c39f5
	Checksum: 0x52A08867
	Offset: 0x8878
	Size: 0x146
	Parameters: 0
	Flags: Linked
*/
function function_f92dfd2c()
{
	var_ba5c0429 = 2000;
	for(i = 1; i <= 5; i++)
	{
		foreach(truck in level.var_55e62e4f)
		{
			if(isdefined(truck) && isalive(truck) && !truck flag::get("fake_dying"))
			{
				if(level.var_2762a9c.origin[0] - truck.origin[0] < var_ba5c0429)
				{
					truck setspeed(50, 20, 20);
				}
			}
		}
		wait(1);
	}
}

/*
	Name: function_f311ea18
	Namespace: namespace_38c39f5
	Checksum: 0xF5CDA50
	Offset: 0x89C8
	Size: 0x134
	Parameters: 1
	Flags: Linked
*/
function function_f311ea18(var_bbe56cd4)
{
	if(!isdefined(var_bbe56cd4))
	{
		var_bbe56cd4 = 0;
	}
	self notify("33c52f5404d1b9cc");
	self endon("33c52f5404d1b9cc");
	self endon(#"death");
	if(var_bbe56cd4)
	{
		level waittill(#"hash_32caebf20e289c77");
	}
	self namespace_db2381c4::function_f0ecd8();
	self namespace_db2381c4::function_3419411b();
	level waittill(#"hash_3b760cd442251b37");
	self.active = 1;
	self thread function_2682a954();
	wait(2);
	level.var_e561515d callback::function_36aab2f3(&function_53e16f01);
	level waittill(#"hash_3f97b17eb9713c73");
	self.active = undefined;
	self namespace_db2381c4::function_fe8be1e0();
}

/*
	Name: function_2682a954
	Namespace: namespace_38c39f5
	Checksum: 0x7DDF9475
	Offset: 0x8B08
	Size: 0xA0
	Parameters: 0
	Flags: Linked
*/
function function_2682a954()
{
	self endon(#"death");
	level endon(#"hash_3f97b17eb9713c73");
	while(true)
	{
		self namespace_db2381c4::function_323b6e10();
		level flag::wait_till("af_start_crash");
		self namespace_db2381c4::function_53bd0317();
		level flag::wait_till_clear("af_start_crash");
	}
}

/*
	Name: function_db378ce0
	Namespace: namespace_38c39f5
	Checksum: 0xF5C6DE36
	Offset: 0x8BB0
	Size: 0x714
	Parameters: 0
	Flags: Linked
*/
function function_db378ce0()
{
	self endon(#"death");
	self endon(#"fake_death");
	self val::set("chase_enemy", "allowdeath", 0);
	self.dontdropweapon = 1;
	if(isdefined(level.var_89cb0a79) && !level flag::get("af_pressed_rc_button"))
	{
		curtime = gettime();
		var_76fc2ac9 = curtime - level.var_89cb0a79;
		if(var_76fc2ac9 > 10000)
		{
			self thread function_a75da416();
		}
	}
	if(isdefined(self.script_noteworthy))
	{
		while(!isdefined(self.vehicle))
		{
			wait(0.1);
		}
		self.var_ec30f5da.ridedeathanim = undefined;
		self notify(#"new_death_anim");
		if(!isdefined(self.vehicle.var_349e69c4))
		{
			self.vehicle.var_349e69c4 = 0;
		}
		self.vehicle.var_349e69c4++;
		anim_scene = "scene_tkd_hit3_chase_jeep_rollbar_le_en2";
		anim_tag = "roll_r1";
		switch(self.script_noteworthy)
		{
			case "hash_1326aeed0f386d94":
			{
				anim_tag = "tag_passenger2";
				anim_scene = "scene_tkd_hit3_chase_jeep_rollbar_le_en2";
				break;
			}
			case "hash_1326b1ed0f3872ad":
			{
				anim_tag = "tag_passenger3";
				anim_scene = "scene_tkd_hit3_chase_jeep_rollbar_le_en3";
				break;
			}
			case "hash_1326b0ed0f3870fa":
			{
				anim_tag = "tag_passenger1";
				anim_scene = "scene_tkd_hit3_chase_jeep_rollbar_le_en4";
				break;
			}
			case "hash_12c09aed0ee19866":
			{
				anim_tag = "tag_passenger2";
				anim_scene = "scene_tkd_hit3_chase_jeep_rollbar_ri_en2";
				break;
			}
			case "hash_12c099ed0ee196b3":
			{
				anim_tag = "tag_passenger3";
				anim_scene = "scene_tkd_hit3_chase_jeep_rollbar_ri_en3";
				break;
			}
			case "hash_12c098ed0ee19500":
			{
				anim_tag = "tag_passenger1";
				anim_scene = "scene_tkd_hit3_chase_jeep_rollbar_ri_en4";
				break;
			}
			case "hash_48024b666fce275a":
			{
				anim_tag = "tag_passenger2";
				anim_scene = "scene_tkd_hit3_chase_jeep_hardtop_le_en2";
				break;
			}
			case "hash_48024a666fce25a7":
			{
				anim_tag = "tag_passenger3";
				anim_scene = "scene_tkd_hit3_chase_jeep_hardtop_le_en3";
				break;
			}
			case "hash_480249666fce23f4":
			{
				anim_tag = "tag_passenger1";
				anim_scene = "scene_tkd_hit3_chase_jeep_hardtop_le_en4";
				break;
			}
			case "hash_47e02f666fb11160":
			{
				anim_tag = "tag_passenger2";
				anim_scene = "scene_tkd_hit3_chase_jeep_hardtop_ri_en2";
				break;
			}
			case "hash_47e032666fb11679":
			{
				anim_tag = "tag_passenger3";
				anim_scene = "scene_tkd_hit3_chase_jeep_hardtop_ri_en3";
				break;
			}
			case "hash_47e031666fb114c6":
			{
				anim_tag = "tag_passenger1";
				anim_scene = "scene_tkd_hit3_chase_jeep_hardtop_ri_en4";
				break;
			}
		}
		self.vehicle thread scene::play(anim_scene, "idle", [0:self]);
		org = util::spawn_model("tag_origin", self.vehicle.origin, self.vehicle.angles);
		org linkto(self.vehicle, anim_tag, (0, 0, 0), (0, 0, 0));
		self thread function_f6fcf011(org, anim_scene);
	}
	self thread function_ebfff762();
	if(isdefined(self.script_noteworthy))
	{
		var_de9ba1c9 = 1;
		if(scene::function_9730988a(anim_scene, "idle3"))
		{
			var_de9ba1c9 = 3;
		}
		while(!level flag::get("af_start_crash"))
		{
			var_6eeb49c8 = "firing";
			if(isdefined(self.vehicle.var_135dba79))
			{
				if(self.vehicle.var_135dba79 > -0.36)
				{
					var_6eeb49c8 = "firing_side";
				}
				if(self.vehicle.var_135dba79 < -0.98)
				{
					var_6eeb49c8 = "firing_rear";
				}
			}
			self stopanimscripted();
			org scene::play(anim_scene, var_6eeb49c8, [0:self]);
			if(self.health > 1)
			{
				var_ae72f23a = randomintrange(1, var_de9ba1c9 + 1);
				var_27e1b0d4 = "idle";
				if(var_ae72f23a > 1)
				{
					var_27e1b0d4 = var_27e1b0d4 + string(var_ae72f23a);
				}
				org thread scene::play(anim_scene, var_27e1b0d4, [0:self]);
				level notify(#"hash_1b1fa861e29350f5", {#enemy:self});
				wait(randomfloatrange(0.2 * self.vehicle.var_349e69c4, 0.5 * self.vehicle.var_349e69c4));
			}
			waitframe(1);
		}
	}
	level flag::wait_till("af_start_crash");
	if(isdefined(org))
	{
		org delete();
	}
	if(isdefined(self) && isalive(self))
	{
		self deletedelay();
	}
}

/*
	Name: function_ebfff762
	Namespace: namespace_38c39f5
	Checksum: 0xA03B0C38
	Offset: 0x92D0
	Size: 0x88
	Parameters: 0
	Flags: Linked
*/
function function_ebfff762()
{
	self endon(#"death");
	self endon(#"fake_death");
	level endon(#"hash_4e525a53534172f4");
	while(true)
	{
		self waittill(#"damage");
		level.player playhitmarker(undefined, 5, undefined, 0, 0, 0);
	}
}

/*
	Name: function_f6fcf011
	Namespace: namespace_38c39f5
	Checksum: 0xA5F052A0
	Offset: 0x9360
	Size: 0x22C
	Parameters: 2
	Flags: Linked
*/
function function_f6fcf011(org, scene)
{
	level endon(#"hash_2b34ed034183965");
	level endon(#"hash_a6dcf188197774d");
	self endon(#"death");
	self endon(#"delete");
	self.vehicle endon(#"death");
	while(self.health > 2)
	{
		wait(0.1);
	}
	waitframe(1);
	self.vehicle.var_349e69c4--;
	if(self.vehicle.var_349e69c4 == 0)
	{
		if(1)
		{
			self.vehicle notify(#"kill_self");
		}
		else
		{
			self.vehicle notify(#"hash_38e103e482582e7f");
		}
	}
	level.player playhitmarker(undefined, 5, undefined, 1);
	self notify(#"fake_death");
	if(isdefined(self.script_noteworthy))
	{
		var_f1fd7a1c = "death";
		if(randomfloat(1) >= 0.25)
		{
			var_f1fd7a1c = "death2";
		}
		org scene::play(scene, var_f1fd7a1c, [0:self]);
		if(isalive(self))
		{
			self stopanimscripted();
			self val::set("chase_enemy", "allowdeath", 1);
			self deletedelay();
		}
	}
}

/*
	Name: function_149a7584
	Namespace: namespace_38c39f5
	Checksum: 0x3CD7596A
	Offset: 0x9598
	Size: 0x416
	Parameters: 1
	Flags: Linked
*/
function function_149a7584(var_ba735fae)
{
	self endon(#"crash_done", #"crash_move_done", #"death");
	self thread vehicle_death::monitor_ground_vehicle_crash_collision();
	self.crashing = 1;
	n_current_speed = self getspeedmph();
	if(n_current_speed > 0 || is_true(self.b_stopped_crash))
	{
		if(self vehicle_death::is_crash_detour_nearby())
		{
			self notify(#"crashpath", {#path:self.nd_crash_path});
			self.nd_crash_path.derailed = 1;
			self notify(#"newpath");
			nd_switch = self.currentnode vehicle_death::get_switch_node(self.nd_crash_path);
			self setswitchnode(nd_switch, self.nd_crash_path);
			self thread vehicle_death::watch_for_crash_detour_scene(self.nd_crash_path);
			if(n_current_speed == 0)
			{
				n_current_speed = 5;
				self setbrake(0);
				self vehicle::resume_path();
				self resumespeed(5);
			}
			n_set_speed = n_current_speed * 3;
			self setspeed(n_set_speed, n_set_speed / 2);
			self waittilltimeout(15, #"reached_end_node");
		}
		else
		{
			self vehicle::detach_path();
			if(self math::get_dot_right(var_ba735fae.origin, 1, 1) > 0)
			{
				n_modifier = 1;
			}
			else
			{
				n_modifier = -1;
			}
			if(n_current_speed == 0)
			{
				n_current_speed = 5;
				self setbrake(0);
				self vehicle::resume_path();
				self resumespeed(5);
			}
			v_goal = self.origin + ((anglestoforward(self.angles + (0, n_modifier * 35, 0))) * 600);
			a_trace = physicstraceex(v_goal + vectorscale((0, 0, 1), 200), v_goal - vectorscale((0, 0, 1), 1000));
			n_set_speed = n_current_speed * 3;
			self setspeed(n_set_speed, n_set_speed / 2);
			self function_a57c34b7(a_trace[#"position"], 0);
			self waittilltimeout(15, #"near_goal");
			self vehicle_ai::clearallmovement(1);
			self vehicle_ai::clearalllookingandtargeting();
		}
	}
	self notify(#"crash_done");
}

/*
	Name: function_326abc48
	Namespace: namespace_38c39f5
	Checksum: 0xA8732AA
	Offset: 0x99B8
	Size: 0xA8
	Parameters: 0
	Flags: Linked
*/
function function_326abc48()
{
	level endon(#"hash_374f8d724a5aa7f5");
	var_8bd12fb4 = 2;
	var_1d542590 = 1;
	level.var_e37c1d1 = 0;
	while(true)
	{
		waitresult = undefined;
		waitresult = level waittill(#"hash_1b1fa861e29350f5");
		if(level.var_e37c1d1 < var_8bd12fb4)
		{
			waitresult.enemy thread function_e4f900a2(var_1d542590);
		}
	}
}

/*
	Name: function_e4f900a2
	Namespace: namespace_38c39f5
	Checksum: 0xA44B69EB
	Offset: 0x9A68
	Size: 0x28
	Parameters: 1
	Flags: Linked
*/
function function_e4f900a2(var_effc03f2)
{
	level.var_e37c1d1++;
	wait(var_effc03f2);
	level.var_e37c1d1--;
}

/*
	Name: function_1c4bdba5
	Namespace: namespace_38c39f5
	Checksum: 0x9A4D394C
	Offset: 0x9A98
	Size: 0xD6
	Parameters: 0
	Flags: Linked
*/
function function_1c4bdba5()
{
	level.player endon(#"hash_23f138b7bfc6234");
	var_b2462917 = 30;
	var_b2462917 = var_b2462917 * 12;
	while(true)
	{
		var_72f2834e = level.var_e561515d.origin + (anglestoforward(level.var_e561515d.angles) * 150);
		if(var_72f2834e[0] - level.var_49a5d2a4.origin[0] > var_b2462917)
		{
			level notify(#"hash_4a8efa61ddc01361");
			break;
		}
		waitframe(1);
	}
}

/*
	Name: function_e6320cb3
	Namespace: namespace_38c39f5
	Checksum: 0xD083E91B
	Offset: 0x9B78
	Size: 0x216
	Parameters: 0
	Flags: Linked
*/
function function_e6320cb3()
{
	level.player endon(#"hash_23f138b7bfc6234");
	level.player endon(#"death");
	level endon(#"hash_820ce007ad535a9");
	self endon(#"death");
	var_908eb0a2 = 50;
	var_908eb0a2 = var_908eb0a2 * 12;
	var_908eb0a2 = var_908eb0a2 * var_908eb0a2;
	var_5d248f34 = -1 * cos(25);
	level waittill(#"hash_4a8efa61ddc01361");
	while(!level flag::get("failed_chase"))
	{
		var_72f2834e = level.var_e561515d.origin + (anglestoforward(level.var_e561515d.angles) * 150);
		var_51fb6d83 = distance2dsquared(self.origin, var_72f2834e);
		if(var_51fb6d83 <= var_908eb0a2)
		{
			/#
			#/
			var_25e859c2 = self math::get_dot_forward(var_72f2834e, 1, 1);
			if(var_25e859c2 < 0 && var_25e859c2 > var_5d248f34)
			{
				right_dot = self math::get_dot_right(var_72f2834e, 1, 1);
				if(right_dot > 0)
				{
					self function_b9613eb(1);
				}
				else
				{
					self function_b9613eb(0);
				}
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_b9613eb
	Namespace: namespace_38c39f5
	Checksum: 0x4F92124B
	Offset: 0x9D98
	Size: 0x3B4
	Parameters: 5
	Flags: Linked
*/
function function_b9613eb(right, speed_pct, var_4c7dbda9, var_6466f659, var_28ec8367)
{
	if(!isdefined(right))
	{
		right = 1;
	}
	if(!isdefined(speed_pct))
	{
		speed_pct = 1;
	}
	if(!isdefined(var_4c7dbda9))
	{
		var_4c7dbda9 = 10;
	}
	if(!isdefined(var_6466f659))
	{
		var_6466f659 = 100;
	}
	if(!isdefined(var_28ec8367))
	{
		var_28ec8367 = 2000;
	}
	level.player endon(#"death");
	level endon(#"hash_820ce007ad535a9");
	self endon(#"death");
	level.player endon(#"hash_23f138b7bfc6234");
	n_modifier = 1;
	if(right)
	{
		n_modifier = -1;
	}
	var_6466f659 = var_6466f659 * 12;
	var_28ec8367 = sqr(var_28ec8367);
	cur_node = self.currentnode;
	if(!isdefined(cur_node.target))
	{
		return;
	}
	next_node = getvehiclenode(cur_node.target, "targetname");
	self vehicle::detach_path();
	n_current_speed = self getspeedmph();
	v_goal = self.origin + ((anglestoforward(self.angles + (0, n_modifier * var_4c7dbda9, 0))) * var_6466f659);
	a_trace = physicstraceex(v_goal + vectorscale((0, 0, 1), 200), v_goal - vectorscale((0, 0, 1), 200));
	self setspeed(n_current_speed * speed_pct);
	/#
	#/
	self function_a57c34b7(a_trace[#"position"], 0);
	self waittilltimeout(3, #"near_goal");
	var_56b3db36 = math::get_dot_forward(next_node.origin, 1, 1);
	var_26b9354a = cos(var_4c7dbda9);
	while(isdefined(next_node) && distance2dsquared(next_node.origin, self.origin) < var_28ec8367)
	{
		cur_node = next_node;
		next_node = getvehiclenode(cur_node.target, "targetname");
	}
	if(isdefined(next_node))
	{
		/#
		#/
		self function_a57c34b7(next_node.origin, 0);
		self waittill(#"near_goal");
		self vehicle::get_on_path(cur_node.target, "targetname");
		self thread vehicle::go_path();
	}
}

/*
	Name: function_6e899b0e
	Namespace: namespace_38c39f5
	Checksum: 0xC9748C08
	Offset: 0xA158
	Size: 0x15A
	Parameters: 0
	Flags: Linked
*/
function function_6e899b0e()
{
	level endon(#"hash_2c1821278dd7ecb1");
	while(!isdefined(self.groundentity))
	{
		waitframe(1);
	}
	var_a997b436 = 0;
	while(!level flag::get("failed_chase") && !level flag::get("af_pressed_rc_button"))
	{
		if(!isdefined(self.groundentity))
		{
			var_a997b436++;
			if(var_a997b436 >= 8)
			{
				level.player allowcrouch(0);
				level.player setstance("stand");
				waitframe(1);
				level.player dontinterpolate();
				level.player playerlinkto(level.var_49a5d2a4, "tag_bed");
				level.player allowcrouch(1);
				return;
			}
		}
		else
		{
			var_a997b436 = 0;
		}
		waitframe(1);
	}
}

/*
	Name: function_e90d5c1
	Namespace: namespace_38c39f5
	Checksum: 0x80E3502
	Offset: 0xA2C0
	Size: 0x152
	Parameters: 0
	Flags: Linked
*/
function function_e90d5c1()
{
	level endon(#"hash_2c1821278dd7ecb1");
	player = self;
	level.var_89cb0a79 = gettime();
	tag_time = 10;
	ammo_left = player function_ab88cc4();
	while(ammo_left > 0)
	{
		ret = undefined;
		ret = player waittilltimeout(tag_time, #"weapon_fired");
		if(ret._notify == #"timeout")
		{
			guys = getaiarray("af_vh_enemy", "targetname");
			array::thread_all(guys, &function_a75da416);
			player waittill(#"weapon_fired");
		}
		level.var_89cb0a79 = gettime();
		level notify(#"hash_7fa2ac712408ddb9");
		ammo_left = player function_ab88cc4();
	}
}

/*
	Name: function_a75da416
	Namespace: namespace_38c39f5
	Checksum: 0xBDD356A5
	Offset: 0xA420
	Size: 0x1B8
	Parameters: 0
	Flags: Linked
*/
function function_a75da416()
{
	level endon(#"hash_7fa2ac712408ddb9");
	level endon(#"hash_2c1821278dd7ecb1");
	self endon(#"death");
	myweapon = getweapon("ar_standard_t9_noballistics");
	player = getplayers()[0];
	while(!isdefined(level.var_89cb0a79))
	{
		waitframe(1);
	}
	while(!level flag::get("af_pressed_rc_button"))
	{
		self waittill(#"fire");
		curtime = gettime();
		var_76fc2ac9 = curtime - level.var_89cb0a79;
		var_4e1914bc = var_76fc2ac9 / 20000;
		rand = randomfloat(1);
		if(rand < var_4e1914bc)
		{
			org = self gettagorigin("tag_flash");
			dest = player gettagorigin("tag_eye");
			magicbullet(myweapon, org, dest, self, player);
		}
	}
}

/*
	Name: function_ab88cc4
	Namespace: namespace_38c39f5
	Checksum: 0xC5DFC23C
	Offset: 0xA5E0
	Size: 0xC0
	Parameters: 0
	Flags: Linked
*/
function function_ab88cc4()
{
	var_12078aec = self getweaponslist();
	ammo = 0;
	foreach(weap in var_12078aec)
	{
		ammo = ammo + self getammocount(weap);
	}
	return ammo;
}

/*
	Name: function_2016824f
	Namespace: namespace_38c39f5
	Checksum: 0x834E3DC8
	Offset: 0xA6A8
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function function_2016824f()
{
	trig = getent(self.linkto, "linkname");
	if(isdefined(trig))
	{
		trig enablelinkto();
		trig linkto(self);
	}
}

/*
	Name: function_31c124f2
	Namespace: namespace_38c39f5
	Checksum: 0x9CDD9A7
	Offset: 0xA718
	Size: 0x124
	Parameters: 0
	Flags: Linked
*/
function function_31c124f2()
{
	var_87d63211 = [4:"truck_challenge5", 3:"truck_challenge4", 2:"truck_challenge3", 1:"truck_challenge2", 0:"truck_challenge1"];
	var_5dc5c128 = 0;
	while(var_5dc5c128 < 3)
	{
		ret = flag::wait_till_any(var_87d63211);
		var_87d63211 = array::exclude(var_87d63211, ret._notify);
		var_5dc5c128++;
		waitframe(1);
	}
	if(level.player stats::function_441050ca(#"hash_6cf378bf26dccb10") == 0)
	{
		level.player stats::function_dad108fa(#"hash_6cf378bf26dccb10", 1);
	}
}

