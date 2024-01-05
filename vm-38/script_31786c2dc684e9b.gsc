#using script_4937c6974f43bb71;
#using script_31e9b35aaacbbd93;
#using script_85cd2e9a28ea8a1;
#using script_54412fb3a6fab34c;
#using script_5552bd756afee443;
#using script_3dc93ca9902a9cda;
#using script_1292451e284848cc;
#using scripts\core_common\fx_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using script_474bf596f5ecdb01;
#using scripts\cp_common\gametypes\globallogic_ui.gsc;
#using scripts\cp_common\skipto.gsc;
#using scripts\cp_common\objectives.gsc;
#using script_67c9a990c0db216c;
#using script_74940ab70a48ee4e;
#using script_6eea75edd4d830a;
#using script_37f9ff47f340fbe8;
#using script_7b4396f5e8e35b28;
#using script_7d0013bbc05623b9;
#using script_32399001bdb550da;
#using script_73e0d5e10c6348fa;
#using script_3b82b8c68189025e;
#using script_263b7f2982258785;
#using scripts\core_common\lui_shared.gsc;
#using scripts\cp_common\util.gsc;
#using script_61cfc2ab8e60625;
#using script_2d443451ce681a;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace namespace_14a3352a;

/*
	Name: function_c810475a
	Namespace: namespace_14a3352a
	Checksum: 0x8788FE39
	Offset: 0xE28
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_c810475a()
{
	level notify(1697585363);
}

#namespace tkdn_raid_bar;

/*
	Name: starting
	Namespace: tkdn_raid_bar
	Checksum: 0x733B8A67
	Offset: 0xE48
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function starting(str_skipto)
{
	level.var_c0c469ea = 1.75;
	level thread scene::init_streamer(#"scene_tkd_hit2_intro_bar_v2", getplayers());
	namespace_a052577e::function_b9b9189c();
}

/*
	Name: main
	Namespace: tkdn_raid_bar
	Checksum: 0xCE39F0B5
	Offset: 0xEB8
	Size: 0x60C
	Parameters: 2
	Flags: Linked
*/
function main(str_skipto, b_starting)
{
	setdvar(#"r_lightingsunshadowdisabledynamicdraw", 1);
	setsaveddvar(#"hash_6b57212fd4fcdd3a", 0);
	player = getplayers()[0];
	var_4f2ba130 = player getweaponslistprimaries();
	foreach(var_5f48185 in var_4f2ba130)
	{
		player takeweapon(var_5f48185);
	}
	player clientfield::set_to_player("force_stream_weapons", 1);
	level util::screen_fade_out(0);
	player endon(#"death");
	player val::set(#"chyron", "freezecontrols", 1);
	scene::add_scene_func("scene_tkd_hit2_intro_bar_v2", &function_e2d2754d, "Shot 1");
	level.var_efac709f = getent("player_breach_clip", "targetname");
	level.var_efac709f disconnectpaths();
	var_8a3bb97c = getspawnerarray("raid_adler", "targetname");
	var_8a3bb97c[0] spawner::add_spawn_function(&namespace_b100dd86::function_9109a1fe);
	var_6534f716 = getspawnerarray("raid_woods", "targetname");
	var_6534f716[0] spawner::add_spawn_function(&namespace_b100dd86::function_87d56d50);
	police_spawner = getspawnerarray("bar_police", "targetname");
	police_spawner[0] spawner::add_spawn_function(&namespace_b100dd86::function_c3eb1449);
	scene::add_scene_func("scene_tkd_hit2_intro_bar_v2", &function_9153c019, "Init");
	player thread function_2c918915();
	level.adler = var_8a3bb97c[0] spawner::spawn(1);
	wait(1);
	player dialogue::player_say("vox_cp_tdwn_03100_masn_yousurewecantru_3c");
	wait(0.3);
	player dialogue::player_say("vox_cp_tdwn_03100_adlr_thisguyhasdonem_9f");
	namespace_a052577e::function_82bfce7c();
	wait(2);
	player playrumbleonentity("damage_light");
	level thread lui::play_movie(#"hash_11485d82e61a7b51", "fullscreen", 1, 0, 0);
	wait(0.5);
	level scene::init("scene_tkd_hit2_intro_bar_v2");
	level util::function_3e65fe0b(1);
	wait(1);
	level thread function_d8e3ce93();
	level thread function_ac208f44();
	player util::delay(5, undefined, &districts::function_a7d79fcb, "amsterdam_main");
	level util::delay(4.2, undefined, &globallogic_ui::do_chyron_text, 0, 0);
	level waittill(#"hash_4aade1e09ed49814");
	snd::function_7db65a93(#"hash_1ef4e0d9441579d");
	player thread function_e9102587();
	objectives::scripted("obj_takedown_capture", undefined, #"hash_49c1d860c97e3792");
	objectives::follow("follow_adler", level.adler, undefined, 0, 0);
	util::function_eefca70f(1);
	level flag::wait_till("raid_bar_complete");
	setdvar(#"r_lightingsunshadowdisabledynamicdraw", 0);
	if(isdefined(b_starting))
	{
		skipto::objective_completed(b_starting);
	}
}

/*
	Name: function_2c918915
	Namespace: tkdn_raid_bar
	Checksum: 0x554076B8
	Offset: 0x14D0
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function function_2c918915()
{
	level waittill(#"hash_7f0782cc9884e068");
	self playrumbleonentity("damage_light");
}

/*
	Name: function_1df134ab
	Namespace: tkdn_raid_bar
	Checksum: 0x84835FFB
	Offset: 0x1518
	Size: 0x3C
	Parameters: 0
	Flags: None
*/
function function_1df134ab()
{
	level waittill(#"hash_645059af11908989");
	self clientfield::set_to_player("lerp_fov", 2);
}

/*
	Name: function_9153c019
	Namespace: tkdn_raid_bar
	Checksum: 0xEE8555F9
	Offset: 0x1560
	Size: 0xBC
	Parameters: 1
	Flags: Linked
*/
function function_9153c019(a_ents)
{
	door = a_ents[#"bar_door"];
	if(!isdefined(door))
	{
		return;
	}
	var_b7ec8c4b = getent("bar_door_clip", "targetname");
	org = getent("bar_door_org", "targetname");
	var_b7ec8c4b linkto(org);
	org linkto(door, "tag_door_animate");
}

/*
	Name: function_e9102587
	Namespace: tkdn_raid_bar
	Checksum: 0xB2962CEC
	Offset: 0x1628
	Size: 0xEC
	Parameters: 0
	Flags: Linked
*/
function function_e9102587()
{
	self endon(#"death");
	if(!is_true(level.var_5be43b2d))
	{
		level thread savegame::function_7790f03(1);
	}
	self setmovespeedscale(0.4);
	self val::set(#"bar", "allow_sprint", 0);
	self val::set(#"bar", "allow_mantle", 0);
	self val::set(#"bar", "allow_jump", 0);
}

/*
	Name: function_513e85fe
	Namespace: tkdn_raid_bar
	Checksum: 0x5035E82C
	Offset: 0x1720
	Size: 0xEC
	Parameters: 1
	Flags: None
*/
function function_513e85fe(a_ents)
{
	photo_1 = a_ents[#"hash_4902117e214da2ef"];
	photo_2 = a_ents[#"hash_4902127e214da4a2"];
	photo_2 clientfield::set("burning_photo", 2);
	level flag::wait_till("raid_bar_complete");
	photo_2 clientfield::set("burning_photo", 0);
	waitframe(1);
	if(isdefined(photo_1))
	{
		photo_1 delete();
	}
	if(isdefined(photo_2))
	{
		photo_2 delete();
	}
}

/*
	Name: function_ac208f44
	Namespace: tkdn_raid_bar
	Checksum: 0x5A3730A4
	Offset: 0x1818
	Size: 0x2E4
	Parameters: 0
	Flags: Linked
*/
function function_ac208f44()
{
	player = getplayers()[0];
	player endon(#"death");
	level util::delay(1, undefined, &function_f0ba2044, player);
	level thread scene::play("scene_tkd_hit2_intro_bar_v2", "Shot 1");
	level thread scene::play("scene_tkd_hit2_intro_bar_v2", "Adler_part_1", [0:level.adler]);
	player val::reset(#"chyron", "freezecontrols");
	wait(1);
	videostart("cp_shared_1981_dutch_soccer_game", 1);
	level waittill(#"hash_163ca826f8d5e1ba");
	level thread function_68461db2();
	if(level flag::get("flag_adler_bar_part_2"))
	{
		level thread scene::play("scene_tkd_hit2_intro_bar_v2", "Adler_part_2");
	}
	else
	{
		level thread scene::play("scene_tkd_hit2_intro_bar_v2", "Adler_wait_enter");
		level waittill(#"hash_3b45e02cd3e4683b");
		level thread scene::play("scene_tkd_hit2_intro_bar_v2", "Adler_wait_loop");
		level flag::wait_till("flag_adler_bar_part_2_breakout");
		level thread scene::play("scene_tkd_hit2_intro_bar_v2", "Adler_wait_exit");
	}
	level waittill(#"hash_5ec30593efaaa279");
	level.var_2f3bf638 = getent("raid_car", "targetname");
	level thread scene::play("scene_tkd_hit2_intro_bar_v2", "Adler_part_3", [0:level.var_2f3bf638]);
	videostop("cp_shared_1981_dutch_soccer_game");
	level flag::set("raid_bar_complete");
}

/*
	Name: function_e2d2754d
	Namespace: tkdn_raid_bar
	Checksum: 0x1D3059D6
	Offset: 0x1B08
	Size: 0xA84
	Parameters: 1
	Flags: Linked
*/
function function_e2d2754d(a_ents)
{
	level.var_66d27402 = [];
	if(isdefined(a_ents[#"hash_2803d4ed0d4da90d"]))
	{
		a_ents[#"hash_2803d4ed0d4da90d"] sethighdetail(1);
	}
	if(isdefined(a_ents[#"hash_6a732b399dbc4fe9"]))
	{
		level.var_66d27402[level.var_66d27402.size] = a_ents[#"hash_6a732b399dbc4fe9"];
		level.var_2e5999de = a_ents[#"hash_6a732b399dbc4fe9"];
		level.var_2e5999de sethighdetail(1);
	}
	if(isdefined(a_ents[#"hash_59f29791d15d58c7"]))
	{
		level.var_66d27402[level.var_66d27402.size] = a_ents[#"hash_59f29791d15d58c7"];
		a_ents[#"hash_59f29791d15d58c7"] sethighdetail(1);
	}
	if(isdefined(a_ents[#"adler"]))
	{
		a_ents[#"adler"] sethighdetail(1);
	}
	if(isdefined(a_ents[#"hash_79e169910f0e462c"]))
	{
		a_ents[#"hash_79e169910f0e462c"] setmodel(#"hash_7786228ec735855b");
		level.var_6535af53 = a_ents[#"hash_79e169910f0e462c"];
		level.var_6535af53 notsolid();
		level.var_66d27402[level.var_66d27402.size] = a_ents[#"hash_79e169910f0e462c"];
	}
	if(isdefined(a_ents[#"hash_79e16c910f0e4b45"]))
	{
		a_ents[#"hash_79e16c910f0e4b45"] setmodel(#"hash_5f01127e9d2adc38");
		level.var_40c96673 = a_ents[#"hash_79e16c910f0e4b45"];
		level.var_40c96673 notsolid();
		level.var_66d27402[level.var_66d27402.size] = a_ents[#"hash_79e16c910f0e4b45"];
	}
	if(isdefined(a_ents[#"hash_79e16b910f0e4992"]))
	{
		a_ents[#"hash_79e16b910f0e4992"] setmodel(#"hash_7786278ec7358dda");
		level.var_335e4b9d = a_ents[#"hash_79e16b910f0e4992"];
		level.var_335e4b9d notsolid();
		level.var_66d27402[level.var_66d27402.size] = a_ents[#"hash_79e16b910f0e4992"];
	}
	if(isdefined(a_ents[#"hash_79e166910f0e4113"]))
	{
		a_ents[#"hash_79e166910f0e4113"] setmodel(#"hash_4e78c19c7ff72cf9");
		level.var_2c44bd6a = a_ents[#"hash_79e166910f0e4113"];
		level.var_2c44bd6a notsolid();
		level.var_66d27402[level.var_66d27402.size] = a_ents[#"hash_79e166910f0e4113"];
	}
	if(isdefined(a_ents[#"hash_79e165910f0e3f60"]))
	{
		a_ents[#"hash_79e165910f0e3f60"] setmodel(#"hash_256cdb005822b45e");
		level.var_ed08282 = a_ents[#"hash_79e165910f0e3f60"];
		level.var_66d27402[level.var_66d27402.size] = a_ents[#"hash_79e165910f0e3f60"];
	}
	if(isdefined(a_ents[#"hash_79e168910f0e4479"]))
	{
		a_ents[#"hash_79e168910f0e4479"] setmodel(#"hash_7f9540115b94683d");
		level.var_41376757 = a_ents[#"hash_79e168910f0e4479"];
		level.var_41376757 notsolid();
		level.var_66d27402[level.var_66d27402.size] = a_ents[#"hash_79e168910f0e4479"];
	}
	if(isdefined(a_ents[#"hash_79e167910f0e42c6"]))
	{
		a_ents[#"hash_79e167910f0e42c6"] setmodel(#"hash_7f953a115b945e0b");
		level.var_33884bf9 = a_ents[#"hash_79e167910f0e42c6"];
		level.var_33884bf9 notsolid();
		level.var_66d27402[level.var_66d27402.size] = a_ents[#"hash_79e167910f0e42c6"];
	}
	if(isdefined(a_ents[#"hash_79e172910f0e5577"]))
	{
		a_ents[#"hash_79e172910f0e5577"] setmodel(#"hash_5eec337e9d18b841");
		level.var_2cb2be4e = a_ents[#"hash_79e172910f0e5577"];
		level.var_2cb2be4e notsolid();
		level.var_66d27402[level.var_66d27402.size] = a_ents[#"hash_79e172910f0e5577"];
	}
	if(isdefined(a_ents[#"hash_79e171910f0e53c4"]))
	{
		a_ents[#"hash_79e171910f0e53c4"] setmodel(#"hash_7786218ec73583a8");
		level.var_f0282ee = a_ents[#"hash_79e171910f0e53c4"];
		level.var_f0282ee notsolid();
		level.var_66d27402[level.var_66d27402.size] = a_ents[#"hash_79e171910f0e53c4"];
	}
	if(isdefined(a_ents[#"hash_284c7d7c95412194"]))
	{
		a_ents[#"hash_284c7d7c95412194"] setmodel(#"hash_7786208ec73581f5");
		level.var_65f41fdf = a_ents[#"hash_284c7d7c95412194"];
		level.var_66d27402[level.var_66d27402.size] = a_ents[#"hash_284c7d7c95412194"];
	}
	if(isdefined(a_ents[#"hash_284c7e7c95412347"]))
	{
		a_ents[#"hash_284c7e7c95412347"] setmodel(#"hash_7f953d115b946324");
		level.var_37c2c37d = a_ents[#"hash_284c7e7c95412347"];
		level.var_66d27402[level.var_66d27402.size] = a_ents[#"hash_284c7e7c95412347"];
	}
	if(isdefined(a_ents[#"hash_284c7f7c954124fa"]))
	{
		a_ents[#"hash_284c7f7c954124fa"] setmodel(#"hash_77861f8ec7358042");
		level.var_8166d6c4 = a_ents[#"hash_284c7f7c954124fa"];
		level.var_66d27402[level.var_66d27402.size] = a_ents[#"hash_284c7f7c954124fa"];
	}
	if(isdefined(a_ents[#"hash_284c807c954126ad"]))
	{
		a_ents[#"hash_284c807c954126ad"] setmodel(#"hash_426c766ef4c2475d");
		level.var_9330fa58 = a_ents[#"hash_284c807c954126ad"];
		level.var_66d27402[level.var_66d27402.size] = a_ents[#"hash_284c807c954126ad"];
	}
	if(isdefined(a_ents[#"hash_284c797c95411ac8"]))
	{
		level.var_9c278c41 = a_ents[#"hash_284c797c95411ac8"];
		level.var_66d27402[level.var_66d27402.size] = a_ents[#"hash_284c797c95411ac8"];
	}
	level thread function_616d61c3();
	level thread function_8c455090();
	level thread function_4a906234();
	level thread function_9248227f();
	level thread function_94005f3d(level.var_65f41fdf);
	level thread function_fa84c01d(level.var_ed08282);
	level thread function_10254e69();
	level thread function_b252dec4();
}

/*
	Name: function_94005f3d
	Namespace: tkdn_raid_bar
	Checksum: 0xB8D0FCD0
	Offset: 0x2598
	Size: 0x12E
	Parameters: 1
	Flags: Linked
*/
function function_94005f3d(guy)
{
	level endon(#"hash_7d331e36702f2357");
	level waittill(#"hash_b55abd61e973251");
	while(true)
	{
		guy dialogue::queue("vox_cp_tdwn_03200_dmc3_comeon_a2");
		wait(1);
		guy dialogue::queue("vox_cp_tdwn_03200_dmc3_nonono_b8");
		guy dialogue::queue("vox_cp_tdwn_03200_dmc3_alrightletsseew_42");
		wait(2);
		guy dialogue::queue("vox_cp_tdwn_03200_dmc3_hmm_ac");
		guy dialogue::queue("vox_cp_tdwn_03200_dmc3_laughs_d5");
		guy dialogue::queue("vox_cp_tdwn_03200_dmc3_clearsthroat_7d");
		wait(2);
		guy dialogue::queue("vox_cp_tdwn_03200_dmc3_bringiton_0d");
		wait(6);
	}
}

/*
	Name: function_b252dec4
	Namespace: tkdn_raid_bar
	Checksum: 0xA6390B2C
	Offset: 0x26D0
	Size: 0x136
	Parameters: 0
	Flags: Linked
*/
function function_b252dec4()
{
	level endon(#"hash_7d331e36702f2357");
	level waittill(#"hash_4aade1e09ed49814");
	wait(2);
	while(true)
	{
		level.var_2e5999de dialogue::queue("vox_cp_tdwn_03200_plch_goaheadanddoit_3a");
		wait(2);
		level.var_2e5999de dialogue::queue("vox_cp_tdwn_03200_plch_thatsright_6b");
		wait(3);
		level.var_2e5999de dialogue::queue("vox_cp_tdwn_03200_plch_mmhmm_4a");
		wait(2);
		level.var_2e5999de dialogue::queue("vox_cp_tdwn_03200_plch_ofcourse_94");
		wait(2);
		level.var_2e5999de dialogue::queue("vox_cp_tdwn_03200_plch_no_eb");
		wait(2);
		level.var_2e5999de dialogue::queue("vox_cp_tdwn_03200_plch_cough_67");
		wait(6);
	}
}

/*
	Name: function_616d61c3
	Namespace: tkdn_raid_bar
	Checksum: 0x1EE03C7B
	Offset: 0x2810
	Size: 0x110
	Parameters: 0
	Flags: Linked
*/
function function_616d61c3()
{
	level endon(#"hash_7d331e36702f2357");
	while(true)
	{
		wait(10);
		level.var_40c96673 dialogue::queue("vox_cp_tdwn_03200_dfc1_idontthinkyoure_15");
		wait(2);
		level.var_6535af53 dialogue::queue("vox_cp_tdwn_03200_dmc2_wellthatsrudewh_16");
		wait(2);
		level.var_40c96673 dialogue::queue("vox_cp_tdwn_03200_dfc1_sheswaytooyoung_e4");
		wait(2);
		level.var_6535af53 dialogue::queue("vox_cp_tdwn_03200_dmc2_soimtooold_a3");
		wait(4);
		level.var_335e4b9d dialogue::queue("vox_cp_tdwn_03200_dmc1_justtoolame_05");
		level.var_40c96673 dialogue::queue("vox_cp_tdwn_03200_dfc2_laughs_d5");
	}
}

/*
	Name: function_9248227f
	Namespace: tkdn_raid_bar
	Checksum: 0xDF6E9289
	Offset: 0x2928
	Size: 0x138
	Parameters: 0
	Flags: Linked
*/
function function_9248227f()
{
	level endon(#"hash_7d331e36702f2357");
	while(true)
	{
		wait(5);
		level.var_37c2c37d dialogue::queue("vox_cp_tdwn_03200_dfc1_idontthinkyoure_15");
		wait(2);
		level.var_8166d6c4 dialogue::queue("vox_cp_tdwn_03200_dmc2_wellthatsrudewh_16");
		wait(2);
		level.var_37c2c37d dialogue::queue("vox_cp_tdwn_03200_dfc1_sheswaytooyoung_e4");
		wait(2);
		level.var_8166d6c4 dialogue::queue("vox_cp_tdwn_03200_dmc2_soimtooold_a3");
		wait(4);
		level.var_37c2c37d dialogue::queue("vox_cp_tdwn_03200_dmc1_justtoolame_05");
		wait(1);
		level.var_8166d6c4 thread dialogue::queue("vox_cp_tdwn_03200_dmc3_laughs_d5");
		level.var_37c2c37d dialogue::queue("vox_cp_tdwn_03200_dfc2_laughs_d5");
	}
}

/*
	Name: function_fa84c01d
	Namespace: tkdn_raid_bar
	Checksum: 0x859E3CD
	Offset: 0x2A68
	Size: 0x10E
	Parameters: 1
	Flags: Linked
*/
function function_fa84c01d(guy)
{
	level endon(#"hash_7d331e36702f2357");
	while(true)
	{
		guy dialogue::queue("vox_cp_tdwn_03200_bart_lager_2a");
		wait(3);
		guy dialogue::queue("vox_cp_tdwn_03200_bart_okaythenwellcel_27");
		wait(3);
		guy dialogue::queue("vox_cp_tdwn_03200_dmc3_clearsthroat_7d");
		wait(8);
		guy dialogue::queue("vox_cp_tdwn_03200_bart_anotherround_58");
		wait(2);
		guy dialogue::queue("vox_cp_tdwn_03200_bart_comingrightup_ce");
		wait(8);
		guy dialogue::queue("vox_cp_tdwn_03200_bart_whatcanigetyou_6b");
		wait(4);
		guy dialogue::queue("vox_cp_tdwn_03200_bart_startingatab_63");
		wait(15);
	}
}

/*
	Name: function_8c455090
	Namespace: tkdn_raid_bar
	Checksum: 0x1FB87ED0
	Offset: 0x2B80
	Size: 0x13E
	Parameters: 0
	Flags: Linked
*/
function function_8c455090()
{
	level endon(#"hash_7d331e36702f2357");
	while(true)
	{
		level.var_41376757 dialogue::queue("vox_cp_tdwn_03200_dfc2_clearsthroat_7d");
		wait(2);
		level.var_33884bf9 dialogue::queue("vox_cp_tdwn_03200_dfc2_coughs_da");
		wait(3);
		level.var_41376757 dialogue::queue("vox_cp_tdwn_03200_dfc2_justanotherday_43");
		wait(2);
		level.var_33884bf9 dialogue::queue("vox_cp_tdwn_03200_dfc2_iwishonemoreyea_59");
		wait(2);
		level.var_41376757 dialogue::queue("vox_cp_tdwn_03200_dfc2_imalmostdonewit_63");
		wait(2);
		level.var_33884bf9 dialogue::queue("vox_cp_tdwn_03200_dfc2_imjustwaitingfo_99");
		wait(1);
		level.var_41376757 dialogue::queue("vox_cp_tdwn_03200_dfc2_itwasagoodguess_e7");
		wait(10);
	}
}

/*
	Name: function_4a906234
	Namespace: tkdn_raid_bar
	Checksum: 0xAF2CDB22
	Offset: 0x2CC8
	Size: 0x13E
	Parameters: 0
	Flags: Linked
*/
function function_4a906234()
{
	level endon(#"hash_7d331e36702f2357");
	while(true)
	{
		level.var_f0282ee dialogue::queue("vox_cp_tdwn_03200_dmc1_thatsjusttheway_a8");
		wait(2);
		level.var_2cb2be4e dialogue::queue("vox_cp_tdwn_03200_dfc1_iwonderhowhetre_63");
		wait(3);
		level.var_f0282ee dialogue::queue("vox_cp_tdwn_03200_dmc2_idontevenknowif_aa");
		wait(2);
		level.var_2cb2be4e dialogue::queue("vox_cp_tdwn_03200_dmc1_heprobablywontl_1f");
		wait(2);
		level.var_f0282ee dialogue::queue("vox_cp_tdwn_03200_dmc1_atleasthegivesu_26");
		wait(2);
		level.var_2cb2be4e dialogue::queue("vox_cp_tdwn_03200_dfc1_cheerstothat_4f");
		wait(1);
		level.var_2cb2be4e dialogue::queue("vox_cp_tdwn_03200_dfc2_laughs_d5");
		wait(2);
	}
}

/*
	Name: function_10254e69
	Namespace: tkdn_raid_bar
	Checksum: 0xA85ED31F
	Offset: 0x2E10
	Size: 0x300
	Parameters: 0
	Flags: Linked
*/
function function_10254e69()
{
	level endon(#"hash_7d331e36702f2357");
	while(true)
	{
		level.var_9330fa58 dialogue::queue("vox_cp_tdwn_03200_dmc1_ithoughtthepoin_be");
		wait(2);
		level.var_9c278c41 dialogue::queue("vox_cp_tdwn_03200_dmc2_bullseyesaregoo_4d");
		wait(3);
		level.var_9330fa58 dialogue::queue("vox_cp_tdwn_03200_dmc1_andyouwaitedunt_cb");
		wait(2);
		level.var_9c278c41 dialogue::queue("vox_cp_tdwn_03200_dmc2_youwerehavingso_06");
		wait(2);
		level.var_9330fa58 dialogue::queue("vox_cp_tdwn_03200_dmc1_soyouresayingim_4b");
		wait(2);
		level.var_9c278c41 dialogue::queue("vox_cp_tdwn_03200_dmc2_ohnoyouregettin_36");
		wait(1);
		level.var_9330fa58 dialogue::queue("vox_cp_tdwn_03200_dmc1_timeforacomebac_bc");
		wait(2);
		level.var_9330fa58 dialogue::queue("vox_cp_tdwn_03200_dmc1_anotherbullseye_77");
		level.var_9c278c41 dialogue::queue("vox_cp_tdwn_03200_dmc1_doesthatcount_e4");
		level.var_9330fa58 dialogue::queue("vox_cp_tdwn_03200_dmc1_ahshitsoclose_14");
		wait(2);
		level.var_9c278c41 dialogue::queue("vox_cp_tdwn_03200_dmc1_igotit_d1");
		wait(2);
		level.var_9330fa58 dialogue::queue("vox_cp_tdwn_03200_dmc2_illtakeit_0c");
		wait(2);
		level.var_9c278c41 dialogue::queue("vox_cp_tdwn_03200_dmc2_watchthemaster_32");
		wait(1);
		level.var_9330fa58 dialogue::queue("vox_cp_tdwn_03200_dmc2_iguessthreesare_4e");
		wait(1);
		level.var_9330fa58 dialogue::queue("vox_cp_tdwn_03200_dmc2_ifihitthisyoure_05");
		level.var_9330fa58 dialogue::queue("vox_cp_tdwn_03200_dmc3_comeon_a2");
		wait(2);
		level.var_9c278c41 dialogue::queue("vox_cp_tdwn_03200_dmc3_nonono_b8");
		wait(1);
		level.var_9330fa58 dialogue::queue("vox_cp_tdwn_03200_dmc3_alrightletsseew_42");
		wait(1);
		level.var_9c278c41 dialogue::queue("vox_cp_tdwn_03200_dmc3_bringiton_0d");
	}
}

/*
	Name: function_a5d7de3c
	Namespace: tkdn_raid_bar
	Checksum: 0xA831D5BE
	Offset: 0x3118
	Size: 0xA0
	Parameters: 0
	Flags: Linked
*/
function function_a5d7de3c()
{
	level notify(#"hash_7d331e36702f2357");
	foreach(person in level.var_66d27402)
	{
		person delete();
	}
}

/*
	Name: function_f0ba2044
	Namespace: tkdn_raid_bar
	Checksum: 0xE4A0F77D
	Offset: 0x31C0
	Size: 0x124
	Parameters: 1
	Flags: Linked
*/
function function_f0ba2044(player)
{
	if(isdefined(level.str_player_start_flag))
	{
		player flag::set(level.str_player_start_flag);
	}
	wait(0.1);
	level thread util::screen_fade_in(1.75);
	lui_menu = lui::get_luimenu("full_screen_movie");
	if([[ lui_menu ]]->function_7bfd10e6(player))
	{
		player notify(#"menuresponse", {#value:1, #response:#"finished_movie_playback", #menu:#"full_screen_movie"});
	}
	wait(1);
	savegame::function_7790f03(1);
}

/*
	Name: function_68461db2
	Namespace: tkdn_raid_bar
	Checksum: 0x89FAD6D8
	Offset: 0x32F0
	Size: 0x334
	Parameters: 0
	Flags: Linked
*/
function function_68461db2()
{
	player = getplayers()[0];
	weapon = spawnstruct();
	weapon.var_15803bcb = getweapon(#"smg_standard_t9", "steadyaim", "elo2");
	weapon.var_c5932593 = getweapon(#"smg_handling_t9", "steadyaim", "reflex", "grip");
	weapon.var_50cb17be = getweapon(#"smg_heavy_t9", "acog");
	weapon.var_e035b3c3 = getentarray("trunk_smg1", "targetname");
	weapon.var_5dc45345 = getentarray("trunk_smg2", "targetname");
	weapon.var_ccbb5ad1 = getentarray("trunk_smg3", "targetname");
	weapon.var_4bb56827 = #"hash_354b11b88d53b149";
	weapon.var_895ad5bc = #"hash_354b0eb88d53ac30";
	weapon.var_d7c6490d = #"hash_354b0fb88d53ade3";
	weapon.var_5a3a522d = getent("smg_use", "targetname");
	weapon.var_ba0f1686 = getent("shg_use", "targetname");
	weapon.var_e9482014 = getent("ar_use", "targetname");
	level thread function_3f2fe2a4(weapon.var_15803bcb, weapon.var_e035b3c3, weapon.var_4bb56827, weapon.var_5a3a522d);
	level thread function_3f2fe2a4(weapon.var_c5932593, weapon.var_5dc45345, weapon.var_895ad5bc, weapon.var_ba0f1686);
	level thread function_3f2fe2a4(weapon.var_50cb17be, weapon.var_ccbb5ad1, weapon.var_d7c6490d, weapon.var_e9482014);
	level flag::wait_till("flag_move_on_to_alley");
	weapon.var_5a3a522d util::remove_cursor_hint();
	weapon.var_ba0f1686 util::remove_cursor_hint();
	weapon.var_e9482014 util::remove_cursor_hint();
}

/*
	Name: function_3f2fe2a4
	Namespace: tkdn_raid_bar
	Checksum: 0xBB0D2937
	Offset: 0x3630
	Size: 0x34A
	Parameters: 4
	Flags: Linked
*/
function function_3f2fe2a4(var_9f43fd46, var_5526621d, var_e3fbbf0d, use_ent)
{
	level endon(#"hash_5c41a54cd623966e");
	player = getplayers()[0];
	while(true)
	{
		if(!player hasweapon(var_9f43fd46))
		{
			foreach(model in var_5526621d)
			{
				model show();
			}
			use_ent util::create_cursor_hint(undefined, (0, 0, 0), var_e3fbbf0d, 80, 0.5, undefined, #"use", 70, 8, 0, 1);
			use_ent prompts::function_2557566(#"use", 1);
			use_ent waittill(#"trigger");
			level notify(#"hash_31f218fde8a04717");
			player util::set_low_ready(0);
			player takeallweapons();
			foreach(model in var_5526621d)
			{
				model hide();
			}
			pistol = getweapon(#"pistol_semiauto_t9", "steadyaim", "fastreload", "reflex_pistol");
			player namespace_c25eb016::function_2e7c81f6(var_9f43fd46, pistol, #"frag_grenade");
			player initialweaponraise(var_9f43fd46);
			player switchtoweapon(var_9f43fd46);
			player util::delay(1.35, undefined, &util::set_low_ready, 1);
			player disableoffhandweapons();
			level notify(#"player_has_weapon");
		}
		waitframe(1);
	}
}

/*
	Name: function_76052005
	Namespace: tkdn_raid_bar
	Checksum: 0x5DFE773C
	Offset: 0x3988
	Size: 0x2EC
	Parameters: 1
	Flags: None
*/
function function_76052005(var_68f1c314)
{
	var_e7b28412 = (19128, 19118, 167);
	var_15120957 = (18874, 19122, 167);
	xfade = 0.1;
	var_89a1a06c = [3:"amb_mus_bar_3d_lp", 2:"amb_mus_bar_3d_lp", 1:"amb_mus_bar_3d_lp", 0:"amb_mus_bar_3d_lp"];
	var_6093c6f9 = [3:"amb_mus_bar_3d_lp", 2:"amb_mus_bar_3d_lp", 1:"amb_mus_bar_3d_lp", 0:"amb_mus_bar_3d_lp"];
	snd::waitforplayers();
	if(isdefined(level.var_947152e4) && isdefined(level.var_189abb9e))
	{
		snd::stop(level.var_947152e4, xfade);
		snd::stop(level.var_189abb9e, xfade);
		level.var_947152e4 = undefined;
		level.var_189abb9e = undefined;
	}
	snd::play("pfx_t8_spark_med", level.var_8aab5623);
	snd::play([1:"pfx_spark_med_far", 0:0.25], level.var_8aab5623);
	wait(0.5);
	var_5a6278b7 = var_89a1a06c[var_68f1c314];
	var_59aeab90 = var_6093c6f9[var_68f1c314];
	if(!isdefined(var_89a1a06c) && !isdefined(var_6093c6f9))
	{
		/#
			iprintlnbold("");
		#/
		return;
	}
	level.var_947152e4 = snd::play([1:xfade, 0:var_5a6278b7], var_e7b28412);
	level.var_189abb9e = snd::play([1:xfade, 0:var_59aeab90], var_15120957);
	if(!isdefined(level.var_947152e4) && !isdefined(level.var_189abb9e))
	{
		/#
			iprintlnbold("");
		#/
	}
}

/*
	Name: function_a6d1922d
	Namespace: tkdn_raid_bar
	Checksum: 0x1753AD08
	Offset: 0x3C80
	Size: 0xC0
	Parameters: 0
	Flags: None
*/
function function_a6d1922d()
{
	level endon(#"hash_77cacf3b22ba7d5c");
	player = getplayers()[0];
	player setlowready(0);
	while(true)
	{
		if(player adsbuttonpressed())
		{
			player enableweapons();
			wait(0.25);
		}
		else
		{
			wait(0.5);
			player disableweapons();
			wait(0.05);
		}
	}
}

/*
	Name: function_8f134086
	Namespace: tkdn_raid_bar
	Checksum: 0xDDD5A0EB
	Offset: 0x3D48
	Size: 0x40
	Parameters: 0
	Flags: None
*/
function function_8f134086()
{
	level waittill(#"hash_742020afbebe9132");
	player = getplayers()[0];
}

/*
	Name: function_d8e3ce93
	Namespace: tkdn_raid_bar
	Checksum: 0x103A6DF1
	Offset: 0x3D90
	Size: 0x7C
	Parameters: 0
	Flags: Linked
*/
function function_d8e3ce93()
{
	player = getplayers()[0];
	namespace_82bfe441::fade(1, "FadeImmediate");
	level waittill(#"hash_4aade1e09ed49814");
	wait(1);
	namespace_82bfe441::fade(0, "FadeSlow");
}

/*
	Name: cleanup
	Namespace: tkdn_raid_bar
	Checksum: 0x5775204C
	Offset: 0x3E18
	Size: 0x24
	Parameters: 4
	Flags: Linked
*/
function cleanup(name, starting, direct, player)
{
}

/*
	Name: init_flags
	Namespace: tkdn_raid_bar
	Checksum: 0xFCFB4705
	Offset: 0x3E48
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function init_flags()
{
	level flag::init("raid_bar_complete");
}

/*
	Name: init_clientfields
	Namespace: tkdn_raid_bar
	Checksum: 0x85EBABBA
	Offset: 0x3E78
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function init_clientfields()
{
	clientfield::register("scriptmover", "burning_photo", 1, 3, "int");
}

/*
	Name: init_scenes
	Namespace: tkdn_raid_bar
	Checksum: 0x80F724D1
	Offset: 0x3EB8
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function init_scenes()
{
}

