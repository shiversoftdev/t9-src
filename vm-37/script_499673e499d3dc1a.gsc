#using script_1292451e284848cc;
#using script_31e9b35aaacbbd93;
#using script_35e4637ff0faed7f;
#using script_3dc93ca9902a9cda;
#using script_45e09f634c49fdba;
#using script_4937c6974f43bb71;
#using script_61cfc2ab8e60625;
#using script_7cf3e180e994d17f;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\vehicle_death_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\cp_common\gametypes\globallogic_ui.gsc;
#using scripts\cp_common\skipto.gsc;
#using scripts\cp_common\util.gsc;

#namespace namespace_38d05c38;

/*
	Name: starting
	Namespace: namespace_38d05c38
	Checksum: 0x98B27860
	Offset: 0x2C0
	Size: 0x19C
	Parameters: 1
	Flags: Linked
*/
function starting(str_skipto)
{
	namespace_b100dd86::function_5aabc3fb();
	level.var_2762a9c = namespace_b100dd86::function_5431431d();
	namespace_b100dd86::function_c8381339(level.var_2762a9c, 1);
	thread namespace_b100dd86::function_1c77193b(level.var_2762a9c);
	level.var_49a5d2a4 = getvehiclearray("af_chase_veh", "targetname")[0];
	level.var_49a5d2a4 vehicle::lights_on();
	level.var_49a5d2a4 vehicle::toggle_force_driver_taillights(1);
	level.var_49a5d2a4 namespace_db2381c4::function_4c265dee();
	namespace_7d4dd7f0::function_a2015343();
	var_7e4a7b32 = getweapon(#"ar_accurate_t9");
	level.adler setweapon(var_7e4a7b32);
	level flag::set("af_start_enemy_crash_vehs");
	setdvar(#"hash_76c0d7e6385ee6de", 0.05);
	thread namespace_a052577e::function_3dbad6f5();
}

/*
	Name: main
	Namespace: namespace_38d05c38
	Checksum: 0x8A178954
	Offset: 0x468
	Size: 0x1D4
	Parameters: 2
	Flags: Linked
*/
function main(str_skipto, b_starting)
{
	player = getplayers()[0];
	setdvar(#"hash_3d9a09e7ecea2271", 0);
	level clientfield::set("crash_models", 1);
	vehs = getvehiclearray();
	function_def1eb14([2:"crash_veh_r", 1:"crash_veh_l", 0:"smash_veh"]);
	wait(0.1);
	level flag::set("af_doing_crash");
	thread function_243c9d46(player);
	level notify(#"hash_2000b4f0550d06a6");
	level flag::wait_till("af_skid_complete");
	if(isdefined(level.adler))
	{
		level.adler util::stop_magic_bullet_shield();
		level.adler delete();
	}
	setdvar(#"hash_3d9a09e7ecea2271", 1);
	if(isdefined(b_starting))
	{
		skipto::objective_completed(b_starting);
	}
}

/*
	Name: cleanup
	Namespace: namespace_38d05c38
	Checksum: 0x5AFCF946
	Offset: 0x648
	Size: 0x44
	Parameters: 4
	Flags: Linked
*/
function cleanup(name, starting, direct, player)
{
	level clientfield::set("crash_models", 0);
}

/*
	Name: init_flags
	Namespace: namespace_38d05c38
	Checksum: 0xAC03367
	Offset: 0x698
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function init_flags()
{
	level flag::init("af_skid_complete");
	level flag::init("af_doing_crash");
}

/*
	Name: init_clientfields
	Namespace: namespace_38d05c38
	Checksum: 0x80F724D1
	Offset: 0x6E8
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function init_clientfields()
{
}

/*
	Name: init_scenes
	Namespace: namespace_38d05c38
	Checksum: 0x80F724D1
	Offset: 0x6F8
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function init_scenes()
{
}

/*
	Name: function_def1eb14
	Namespace: namespace_38d05c38
	Checksum: 0x9E2094CF
	Offset: 0x708
	Size: 0xD0
	Parameters: 1
	Flags: Linked
*/
function function_def1eb14(name_array)
{
	level.var_515a88e0 = [];
	foreach(name in name_array)
	{
		veh = vehicle::simple_spawn_single(name);
		level.var_515a88e0[level.var_515a88e0.size] = veh;
		veh thread function_c5eaa394();
	}
}

/*
	Name: function_c5eaa394
	Namespace: namespace_38d05c38
	Checksum: 0x31B5B9B8
	Offset: 0x7E0
	Size: 0x74
	Parameters: 0
	Flags: Linked
*/
function function_c5eaa394()
{
	wait(0.1);
	if(self.targetname == "smash_veh")
	{
		self waittill(#"turn_on_lights");
	}
	self vehicle::lights_on();
	self vehicle::toggle_force_driver_taillights(1);
	self thread namespace_38c39f5::function_6b9d341b();
}

/*
	Name: function_243c9d46
	Namespace: namespace_38d05c38
	Checksum: 0x1F521AFD
	Offset: 0x860
	Size: 0x574
	Parameters: 1
	Flags: Linked
*/
function function_243c9d46(player)
{
	var_7256d0b6 = getvehiclearray("af_chase_veh", "targetname")[0];
	level.var_49a5d2a4 = var_7256d0b6;
	level.player = getplayers()[0];
	thread function_c0f9442c();
	thread function_e99dbb58(player);
	var_7256d0b6 vehicle::get_off_path();
	woods = getactorarray("af_woods", "targetname");
	if(woods.size > 0)
	{
		woods[0] unlink();
	}
	plane = getent("cargo_plane", "targetname");
	plane unlink();
	level.adler unlink();
	util::nvidiaansel_scriptdisable(1);
	actors = level.var_515a88e0;
	level.fake_player = util::spawn_player_clone(level.player);
	level.fake_player.targetname = "FakePlayer";
	actors[#"fakeplayer"] = level.fake_player;
	level.fake_player hide();
	level thread scene::play_from_time("scene_tkd_hit3_planecrash_intro", "crash_fakeplayer", actors, 0.8, 0, 1);
	waitframe(1);
	level.fake_player hide();
	level.fake_player setinvisibletoall();
	player playerlinktodelta(level.fake_player, "tag_player", 1, 180, 180, 180, 180, 1, 0, 1);
	level waittill(#"hash_2d945658a781d296");
	namespace_82bfe441::fade(1, "FadeImmediate");
	player playerlinktoblend(level.fake_player, "tag_player", 0.2, 0, 0, 0.2, 0, 0, 1);
	wait(0.2);
	level.fake_player show();
	level.fake_player setvisibletoall();
	player val::set("crash", "disable_weapons", 2);
	player playerlinktodelta(level.fake_player, "tag_player", 1, 0, 0, 0, 0, 1, 0, 1);
	level waittill(#"hash_360943c8eac07426");
	waitframe(1);
	level.var_49a5d2a4 vehicle::lights_off();
	level.var_49a5d2a4 vehicle::toggle_force_driver_taillights(0);
	level.var_49a5d2a4 namespace_db2381c4::function_2c185955();
	level waittill(#"hash_557087a4ef59ae6c");
	wait(3);
	level flag::set("af_skid_complete");
	snd::function_7db65a93("af_skid_complete");
	player unlink();
	level.fake_player delete();
	player val::reset("crash", "disable_weapons");
	player val::reset("crash", "allow_crouch");
	player val::reset("crash", "allow_prone");
	player val::reset(#"chase", "allowdeath");
	util::nvidiaansel_scriptdisable(0);
}

/*
	Name: function_c0f9442c
	Namespace: namespace_38d05c38
	Checksum: 0x80D34397
	Offset: 0xDE0
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function function_c0f9442c()
{
	level waittill(#"hash_164bf872d25545af");
	level notify(#"hash_6f65948492627624");
	snd::function_7db65a93(#"hash_164bf872d25545af");
}

/*
	Name: function_71a64494
	Namespace: namespace_38d05c38
	Checksum: 0x51AD0BF9
	Offset: 0xE40
	Size: 0x70
	Parameters: 2
	Flags: None
*/
function function_71a64494(player, guy)
{
	guy waittill(#"weapon_fired");
	level.player playhitmarker(undefined, 5, undefined, 1);
	wait(0.01);
	level notify(#"stop_slowmo");
}

/*
	Name: function_c2f81a50
	Namespace: namespace_38d05c38
	Checksum: 0x5242CD5C
	Offset: 0xEB8
	Size: 0x5E
	Parameters: 1
	Flags: None
*/
function function_c2f81a50(notification)
{
	level endon(notification);
	self waittill(#"damage");
	level.player playhitmarker(undefined, 5, undefined, 1);
	level notify(notification);
}

/*
	Name: function_e99dbb58
	Namespace: namespace_38d05c38
	Checksum: 0x82DB5AB6
	Offset: 0xF20
	Size: 0x1B4
	Parameters: 1
	Flags: Linked
*/
function function_e99dbb58(player)
{
	player unlink();
	player playersetgroundreferenceent(undefined);
	level.var_49a5d2a4 setmovingplatformenabled(1, 0);
	player setstance("stand");
	waitframe(1);
	player val::set("crash", "allow_crouch", 0);
	player val::set("crash", "allow_prone", 0);
	wait(2);
	if(isdefined(level.var_e561515d))
	{
		level.var_e561515d delete();
	}
	level waittill(#"hash_61855c3885c438e6");
	player shellshock(#"frag_grenade_mp", 4);
	level lui::screen_fade_out(0.2);
	player playrumbleonentity("damage_heavy");
	level notify(#"hash_351eb749d2c8fa9c");
	flag::clear("af_wing_smash");
}

/*
	Name: function_c9f7e2d2
	Namespace: namespace_38d05c38
	Checksum: 0x6189F23A
	Offset: 0x10E0
	Size: 0x26
	Parameters: 0
	Flags: None
*/
function function_c9f7e2d2()
{
	vehs = vehicle::simple_spawn_and_drive("af_enemy_crash_veh");
}

