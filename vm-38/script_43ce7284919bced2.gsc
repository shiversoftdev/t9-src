#using script_1029986e2bc8ca8e;
#using script_3e25b5e703601101;
#using script_3f9e0dc8454d98e1;
#using script_42b51e4a369b0f95;
#using script_467027ea7017462b;
#using script_4acbbbcdc7ef16a0;
#using script_4d000493c57bb851;
#using script_52c6c2d1a2ef1b46;
#using script_5c8450156115b2ba;
#using script_6c5b51f98cd04fa3;
#using script_6ce38ab036223e6e;
#using script_772d4fbcb229f593;
#using script_7bacb32f8222fa3e;
#using script_7e59d7bba853fe4b;
#using script_92d4d637814fefa;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\gestures.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm_power.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;

#namespace namespace_e502fca8;

/*
	Name: function_59dc7951
	Namespace: namespace_e502fca8
	Checksum: 0xF06FF90F
	Offset: 0x4F0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_59dc7951()
{
	level notify(121174422);
}

/*
	Name: init
	Namespace: namespace_e502fca8
	Checksum: 0x6315B5B7
	Offset: 0x510
	Size: 0x66C
	Parameters: 0
	Flags: None
*/
function init()
{
	clientfield::register("world", "" + #"hash_2c7fb1cc66c590a0", 28000, getminbitcountfornum(2), "int");
	clientfield::register("world", "" + #"hash_18f96dcb4766fbe8", 28000, 1, "int");
	clientfield::register("world", "" + #"hash_45c3013f063fe2c7", 28000, getminbitcountfornum(2), "int");
	clientfield::register("world", "" + #"hash_3432d09ff93c9a0c", 28000, 1, "int");
	clientfield::register("world", "" + #"hash_27308a7dd991ce8d", 28000, 1, "int");
	clientfield::register("actor", "" + #"hash_54e2a4e02a26cc62", 28000, 1, "counter");
	level namespace_ee206246::register(#"pap_quest", #"hash_2567a4f3df93c2b0", #"hash_b71b93f558098d2", &function_d6912122, &function_901d4808);
	level namespace_ee206246::register(#"pap_quest", #"hash_6552da7c5bcf7970", #"hash_36f55be5a8fc1820", &function_15cbe9b3, &function_ae76d66e);
	level namespace_ee206246::register(#"pap_quest", #"hash_3a495b8c519be728", #"hash_10767b6cc12968e", &function_4a137892, &function_150a6555);
	level namespace_ee206246::register(#"pap_quest", #"hash_302900663ba3693f", #"hash_69956b5ecab4a827", &function_b6f68914, &function_e172620);
	level namespace_ee206246::register(#"pap_quest", #"hash_3a5ea58248294ec5", #"hash_6cd201e96fac6f2b", &function_c754a36a, &function_109823ff);
	level namespace_ee206246::register(#"pap_quest", #"hash_6e9fae3b4619a7a2", #"hash_d65756159413944", &function_f826b3d, &function_2d857fb2);
	level namespace_ee206246::register(#"pap_quest", #"hash_233ac81ca7244a86", #"hash_441e3103e2b81f20", &function_57c1663d, &function_80f4c05c);
	level namespace_ee206246::register(#"pap_quest", #"hash_7c6e0d3248a4bce", #"hash_64f7ea514b9629b2", &function_71d12bb, &function_8af5a955);
	level namespace_ee206246::register(#"pap_quest", #"hash_3fed555cef7fdf94", #"hash_29fd3ce5e445ea52", &function_5dd183b3, &function_cb435598);
	level namespace_ee206246::register(#"pap_quest", #"hash_461178e0c41be838", #"hash_115c664a4c975e9c", &function_4710b248, &function_a5034a1);
	level namespace_ee206246::register(#"pap_quest", #"hash_79fc4b5e15a0da73", #"hash_2ee950c4c2dcc0b", &function_f4301c94, &function_32f7764e);
	level namespace_ee206246::register(#"pap_quest", #"hash_42541c1c30ef6ea8", #"hash_ae3a694c19ad474", &function_e876ecf0, &function_8ad7a0a7);
	scene::add_scene_func(#"hash_6542f0d26cc8042f", &function_54dd8e5d);
	level thread function_5a72edf0();
}

/*
	Name: function_5a72edf0
	Namespace: namespace_e502fca8
	Checksum: 0x3423081F
	Offset: 0xB88
	Size: 0x214
	Parameters: 0
	Flags: None
*/
function function_5a72edf0()
{
	level clientfield::set("" + #"hash_45c3013f063fe2c7", 1);
	portal_fx = getent("portal_fx_bunker_to_observation", "targetname");
	playsoundatposition(#"hash_4e9f052116a0cb95", portal_fx.origin);
	portal_fx = getent("portal_fx_helipads_to_observation", "targetname");
	playsoundatposition(#"hash_4e9f052116a0cb95", portal_fx.origin);
	level thread scene::play(#"hash_7c52431e19ff8737", "targetname");
	level clientfield::set("" + #"hash_27308a7dd991ce8d", 1);
	level thread gestures::function_ba4529d4(#"hash_606686a1b66827ac");
	level thread function_266ae0b1();
	level thread function_5ad3e281();
	level flag::wait_till("start_zombie_round_logic");
	function_4313bea3();
	exploder::exploder("lgt_env_teleporter_purple");
	function_eec40ef0();
	level namespace_ee206246::start(#"pap_quest", 1);
}

/*
	Name: function_eec40ef0
	Namespace: namespace_e502fca8
	Checksum: 0x8C9CBD74
	Offset: 0xDA8
	Size: 0x144
	Parameters: 0
	Flags: None
*/
function function_eec40ef0()
{
	if(getdvarint(#"hash_2c9810c754c52404", 0))
	{
		return;
	}
	level.round_wait_func = &function_94c3002d;
	level.func_get_delay_between_rounds = &function_aa02f83f;
	level.func_get_zombie_spawn_delay = &function_19d9bf39;
	util::delay(6, #"hash_3b763d6426336ce0", &zm_audio::function_b36aeaf6, "flood_spawning");
	level.var_69244388 = &function_7d10c7c2;
	level.var_9b33b774 = &function_6b9d74df;
	namespace_c097de49::function_2c40648c(0);
	level thread namespace_9771a88f::function_b922d5d7();
	callback::on_spawned(&function_9649136);
	callback::on_revived(&function_7eea09b8);
}

/*
	Name: function_1d310878
	Namespace: namespace_e502fca8
	Checksum: 0x22BFC2C8
	Offset: 0xEF8
	Size: 0xFC
	Parameters: 0
	Flags: None
*/
function function_1d310878()
{
	level.round_wait_func = &namespace_a28acff3::round_wait;
	level.func_get_delay_between_rounds = &namespace_a28acff3::get_delay_between_rounds;
	level.func_get_zombie_spawn_delay = &namespace_a28acff3::get_zombie_spawn_delay;
	level thread zm_audio::function_2354b945("flood_spawning");
	level.var_69244388 = undefined;
	level.var_9b33b774 = undefined;
	namespace_c097de49::function_2c40648c(1);
	callback::remove_on_spawned(&function_9649136);
	callback::function_61f038c(&function_7eea09b8);
	level flag::set(#"hash_3b763d6426336ce0");
}

/*
	Name: function_94c3002d
	Namespace: namespace_e502fca8
	Checksum: 0x3A901C2
	Offset: 0x1000
	Size: 0x322
	Parameters: 0
	Flags: Private
*/
function private function_94c3002d()
{
	level endon(#"restart_round", #"kill_round_wait");
	/#
		level endon(#"kill_round");
		if(getdvarint(#"zombie_rise_test", 0))
		{
			level waittill(#"forever");
		}
	#/
	if(zm::cheat_enabled(2))
	{
		level waittill(#"forever");
	}
	/#
		if(getdvarint(#"zombie_default_max", 0) == 0)
		{
			level waittill(#"forever");
		}
	#/
	wait(1);
	while(true)
	{
		if(level flag::get(#"hash_3b763d6426336ce0"))
		{
			if(zombie_utility::get_current_zombie_count() == 0 && level.zombie_total <= 0 && !level.intermission && !level flag::get(#"infinite_round_spawning") && !level flag::get(#"hold_round_end"))
			{
				return;
			}
		}
		else if(level.zombie_total <= 0 && !level.intermission && !level flag::get(#"infinite_round_spawning") && !level flag::get(#"hold_round_end"))
		{
			if(zombie_utility::get_current_zombie_count() == 0)
			{
				wait(1);
			}
			else
			{
				if(level.round_number == 1)
				{
					level flag::wait_till(#"hash_4ae6b839df55ee2a");
					wait(1);
				}
				else
				{
					wait(5);
				}
			}
			if(!level flag::get(#"hash_3b763d6426336ce0") || zombie_utility::get_current_zombie_count() == 0)
			{
				return;
			}
		}
		if(level flag::get("end_round_wait"))
		{
			return;
		}
		if(level flag::get("round_reset"))
		{
			return;
		}
		wait(1);
	}
}

/*
	Name: function_aa02f83f
	Namespace: namespace_e502fca8
	Checksum: 0x86F11C23
	Offset: 0x1330
	Size: 0xA
	Parameters: 0
	Flags: Private
*/
function private function_aa02f83f()
{
	return 0.5;
}

/*
	Name: function_19d9bf39
	Namespace: namespace_e502fca8
	Checksum: 0x7D65DE2D
	Offset: 0x1348
	Size: 0x12
	Parameters: 1
	Flags: Private
*/
function private function_19d9bf39(params)
{
	return 0.5;
}

/*
	Name: function_9649136
	Namespace: namespace_e502fca8
	Checksum: 0x29CE6D7D
	Offset: 0x1368
	Size: 0x4C
	Parameters: 0
	Flags: Private
*/
function private function_9649136()
{
	if(!is_true(self.is_hotjoining) && !self util::is_spectating())
	{
		self thread function_460fbb4();
	}
}

/*
	Name: function_7eea09b8
	Namespace: namespace_e502fca8
	Checksum: 0xEAD50C3
	Offset: 0x13C0
	Size: 0x24
	Parameters: 1
	Flags: Private
*/
function private function_7eea09b8(params)
{
	self thread function_9649136();
}

/*
	Name: function_460fbb4
	Namespace: namespace_e502fca8
	Checksum: 0x78B89B69
	Offset: 0x13F0
	Size: 0x9C
	Parameters: 0
	Flags: Private
*/
function private function_460fbb4()
{
	level endon(#"end_game");
	self endon(#"disconnect");
	self val::set(#"hash_2aa23bb7ec9c6f7d", "ignoreme", 1);
	self waittilltimeout(5, #"death");
	self val::reset(#"hash_2aa23bb7ec9c6f7d", "ignoreme");
}

/*
	Name: function_7d10c7c2
	Namespace: namespace_e502fca8
	Checksum: 0xAE65B30F
	Offset: 0x1498
	Size: 0xA4
	Parameters: 0
	Flags: Private
*/
function private function_7d10c7c2()
{
	if(isdefined(level.musicsystem.states[#"round_start_first"]) && level.round_number <= 1)
	{
		if(isdefined(level.var_f546b995))
		{
			level thread zm_audio::sndmusicsystem_playstate(("round_start_first" + "_") + level.var_f546b995);
		}
		else
		{
			level thread zm_audio::sndmusicsystem_playstate("round_start_first");
		}
	}
}

/*
	Name: function_6b9d74df
	Namespace: namespace_e502fca8
	Checksum: 0xA046CC12
	Offset: 0x1548
	Size: 0x2C
	Parameters: 0
	Flags: Private
*/
function private function_6b9d74df()
{
	playsoundatposition(#"hash_51cf3af54355aedc", (0, 0, 0));
}

/*
	Name: function_d6912122
	Namespace: namespace_e502fca8
	Checksum: 0xCCB1580B
	Offset: 0x1580
	Size: 0xEC
	Parameters: 1
	Flags: None
*/
function function_d6912122(b_skipped)
{
	level endon(#"end_game");
	if(b_skipped)
	{
		return;
	}
	var_b75e4db1 = struct::get_array(#"hash_75e8597555415f2e");
	namespace_ee206246::objective_set(#"hash_6b0d99dea8e99af5", var_b75e4db1, undefined, #"hash_1e26d87a292ce41e", undefined, 96);
	level.var_150884c = var_b75e4db1[0];
	level.var_150884c zm_unitrigger::function_fac87205(#"hash_4a63f43658e4a176", (47, 47, 67));
	level thread namespace_9771a88f::function_1402bc5a();
}

/*
	Name: function_901d4808
	Namespace: namespace_e502fca8
	Checksum: 0x7EE7AE6B
	Offset: 0x1678
	Size: 0x13C
	Parameters: 2
	Flags: None
*/
function function_901d4808(b_skipped, var_19e802fa)
{
	if(var_19e802fa)
	{
		zm_unitrigger::unregister_unitrigger(level.var_150884c.s_unitrigger);
	}
	level.var_150884c = undefined;
	namespace_ee206246::objective_complete(#"hash_6b0d99dea8e99af5");
	level flag::set(#"hash_5981a23fdea21f78");
	level clientfield::set("" + #"hash_2c7fb1cc66c590a0", 1);
	portal_fx = getent("portal_fx_helipads_to_main_street", "targetname");
	playsoundatposition(#"hash_4e9f052116a0cb95", portal_fx.origin);
	level thread scene::play(#"hash_5b9b9143bf52fa5f", "targetname");
}

/*
	Name: function_15cbe9b3
	Namespace: namespace_e502fca8
	Checksum: 0xEBB08CE9
	Offset: 0x17C0
	Size: 0x8C
	Parameters: 1
	Flags: None
*/
function function_15cbe9b3(b_skipped)
{
	level endon(#"end_game");
	if(b_skipped)
	{
		return;
	}
	namespace_ee206246::objective_set(#"hash_6b0d96dea8e995dc", undefined, undefined, #"hash_632a0c5e75e2afa2", undefined, undefined);
	objective_manager::start_timer(30, "pap_quest_holdout_until_teleporter_restart_step", 1);
}

/*
	Name: function_ae76d66e
	Namespace: namespace_e502fca8
	Checksum: 0x4DC2415D
	Offset: 0x1858
	Size: 0xA4
	Parameters: 2
	Flags: None
*/
function function_ae76d66e(b_skipped, var_19e802fa)
{
	if(var_19e802fa)
	{
		objective_manager::stop_timer();
	}
	namespace_ee206246::objective_complete(#"hash_6b0d96dea8e995dc");
	level flag::set(#"hash_23042147964b0bc2");
	level clientfield::set("" + #"hash_2c7fb1cc66c590a0", 2);
}

/*
	Name: function_4a137892
	Namespace: namespace_e502fca8
	Checksum: 0xCFA25DBA
	Offset: 0x1908
	Size: 0xFC
	Parameters: 1
	Flags: None
*/
function function_4a137892(b_skipped)
{
	level endon(#"end_game");
	namespace_f22a3322::function_990a7f89();
	if(b_skipped)
	{
		return;
	}
	var_b75e4db1 = struct::get_array(#"hash_10867d96a0793a37", "script_string");
	namespace_ee206246::objective_set(#"hash_6b0d97dea8e9978f", var_b75e4db1, undefined, #"hash_1e26d87a292ce41e", undefined, 96);
	level flag::wait_till(#"hash_4974c816b1d4372b");
	function_8ca5e5a(&namespace_9771a88f::function_dc17412a, "pap_quest_main_street_trigger", #"hash_12211793875e0971");
}

/*
	Name: function_150a6555
	Namespace: namespace_e502fca8
	Checksum: 0x4501EF1F
	Offset: 0x1A10
	Size: 0x44
	Parameters: 2
	Flags: None
*/
function function_150a6555(b_skipped, var_19e802fa)
{
	namespace_ee206246::objective_complete(#"hash_6b0d97dea8e9978f");
	function_1d310878();
}

/*
	Name: function_b6f68914
	Namespace: namespace_e502fca8
	Checksum: 0x5F6B8506
	Offset: 0x1A60
	Size: 0x294
	Parameters: 1
	Flags: None
*/
function function_b6f68914(b_skipped)
{
	level endon(#"end_game");
	if(b_skipped)
	{
		return;
	}
	var_b75e4db1 = struct::get_array(#"hash_6f4ff1b4d10bc283", "targetname");
	namespace_ee206246::objective_set(#"hash_20a2de434e54a6ae", var_b75e4db1, undefined, #"hash_6c1c6189dad114f3", undefined, 96);
	level thread namespace_ff7e490::function_a70fa155(#"hash_20a2de434e54a6ae", #"hash_62731aa273c00263", var_b75e4db1, level.var_6097ff89, [1:#"hash_12211793875e0971", 0:#"hash_79d03c1109324acf"]);
	level flag::wait_till(#"hash_79d03c1109324acf");
	namespace_ee206246::objective_complete(#"hash_20a2de434e54a6ae");
	var_b75e4db1 = struct::get_array(#"hash_2e6796ab3a32706f", "script_string");
	namespace_ee206246::objective_set(#"hash_20a2dd434e54a4fb", var_b75e4db1, undefined, #"hash_6c1c6189dad114f3", undefined, 96);
	level thread namespace_ff7e490::function_a70fa155(#"hash_20a2dd434e54a4fb", #"hash_62731aa273c00263", var_b75e4db1, level.var_6097ff89, #"hash_12211793875e0971");
	level flag::wait_till_all(array(#"hash_5257e1c2e1090ded", #"hash_6202d7ed71659fe"));
	namespace_f22a3322::function_4f804075();
	level flag::wait_till(#"hash_41474029b416f190");
	function_8ca5e5a(&namespace_9771a88f::function_23e9435d, "pap_quest_anytown_usa_trigger", #"hash_33c0045188845715");
}

/*
	Name: function_e172620
	Namespace: namespace_e502fca8
	Checksum: 0x8D06C5B2
	Offset: 0x1D00
	Size: 0x8C
	Parameters: 2
	Flags: None
*/
function function_e172620(b_skipped, var_19e802fa)
{
	if(var_19e802fa)
	{
		namespace_ee206246::objective_complete(#"hash_20a2de434e54a6ae");
		namespace_f22a3322::function_4f804075();
	}
	else if(b_skipped)
	{
		namespace_f22a3322::function_4f804075();
	}
	namespace_ee206246::objective_complete(#"hash_20a2dd434e54a4fb");
}

/*
	Name: function_c754a36a
	Namespace: namespace_e502fca8
	Checksum: 0x4D7E7859
	Offset: 0x1D98
	Size: 0x39C
	Parameters: 1
	Flags: None
*/
function function_c754a36a(b_skipped)
{
	level endon(#"end_game");
	level.var_ec7a1fe8 = [];
	callback::function_10a4dd0a(&function_10a4dd0a);
	if(!isdefined(level.var_f3ec3e94))
	{
		level.var_f3ec3e94 = 0;
	}
	function_48fb2ed5();
	if(b_skipped)
	{
		return;
	}
	var_b75e4db1 = array();
	array::add(var_b75e4db1, struct::get(#"hash_2144eecde83a155d", "targetname"));
	array::add(var_b75e4db1, struct::get(#"hash_2107b38a44736042", "targetname"));
	array::add(var_b75e4db1, struct::get(#"hash_5236174303a5bff7", "targetname"));
	namespace_ee206246::objective_set(#"hash_2b57f74354f9bc29", var_b75e4db1, undefined, #"hash_6c1c6189dad114f3", undefined, 96);
	level thread namespace_ff7e490::function_a70fa155(#"hash_2b57f74354f9bc29", #"hash_62731aa273c00263", var_b75e4db1, level.var_2f941a56, [3:#"hash_33c0045188845715", 2:#"hash_4631d121f7af0f45", 1:#"hash_80e313f33fdd940", 0:#"hash_46ea67e0190a83ef"]);
	level flag::wait_till_any([2:#"hash_4631d121f7af0f45", 1:#"hash_80e313f33fdd940", 0:#"hash_46ea67e0190a83ef"]);
	namespace_ee206246::objective_complete(#"hash_2b57f74354f9bc29");
	var_b75e4db1 = struct::get_array(#"hash_e90df2ca25fbd31", "script_string");
	if(!level flag::get(#"hash_419cb6aea3c6771e"))
	{
		namespace_ee206246::objective_set(#"hash_2b57f44354f9b710", var_b75e4db1, undefined, #"hash_6c1c6189dad114f3", undefined, 96);
		level thread namespace_ff7e490::function_a70fa155(#"hash_2b57f44354f9b710", #"hash_62731aa273c00263", var_b75e4db1, level.var_2f941a56, #"hash_33c0045188845715");
	}
	level flag::wait_till(#"hash_166ec934762f6ea4");
}

/*
	Name: function_109823ff
	Namespace: namespace_e502fca8
	Checksum: 0xAAF3F19A
	Offset: 0x2140
	Size: 0x74
	Parameters: 2
	Flags: None
*/
function function_109823ff(b_skipped, var_19e802fa)
{
	if(var_19e802fa)
	{
		namespace_ee206246::objective_complete(#"hash_2b57f74354f9bc29");
	}
	namespace_ee206246::objective_complete(#"hash_2b57f44354f9b710");
	level.var_37ad3691 = &function_b3d60c36;
}

/*
	Name: function_b3d60c36
	Namespace: namespace_e502fca8
	Checksum: 0xF3D1C597
	Offset: 0x21C0
	Size: 0x3A
	Parameters: 0
	Flags: None
*/
function function_b3d60c36()
{
	if(self.blueprint.name === #"hash_434e63df930cc195")
	{
		self.hint_string = #"hash_116dced27129125c";
	}
}

/*
	Name: function_f826b3d
	Namespace: namespace_e502fca8
	Checksum: 0x1599BC4C
	Offset: 0x2208
	Size: 0x254
	Parameters: 1
	Flags: None
*/
function function_f826b3d(b_skipped)
{
	level endon(#"end_game");
	if(b_skipped)
	{
		return;
	}
	level thread namespace_9771a88f::function_e3e7a6eb(level.var_f3ec3e94 >= 4);
	if(!level flag::get(#"hash_419cb6aea3c6771e"))
	{
		level function_ec1c666a();
		level thread namespace_ff7e490::function_a70fa155(#"hash_6b0d92dea8e98f10", #"hash_62731aa273c00263", undefined, level.var_2f941a56, #"hash_8576014ad5f7a8e");
		level thread function_73ab4038(#"hash_672632b6e90fd896", #"hash_51a0015904debd03", #"hash_5053d00c73ada9ef", level.var_ef6bb204);
		level thread function_73ab4038(#"hash_2d762fd9df35125", #"hash_51a0025904debeb6", #"hash_5053d10c73adaba2", level.var_e1ef8bc7);
		level thread function_73ab4038(#"hash_7f4a4a903eacb290", #"hash_51a0035904dec069", #"hash_5053d20c73adad55", level.var_8e3ebebd);
		level thread function_73ab4038(#"hash_6e8d9b0bcdb6a80f", #"hash_51a0045904dec21c", #"hash_5053cb0c73ada170", level.var_3174da65);
	}
	level flag::wait_till_all(array(#"hash_5053d00c73ada9ef", #"hash_5053d10c73adaba2", #"hash_5053d20c73adad55", #"hash_5053cb0c73ada170"));
}

/*
	Name: function_48fb2ed5
	Namespace: namespace_e502fca8
	Checksum: 0x94A403A6
	Offset: 0x2468
	Size: 0x4C4
	Parameters: 0
	Flags: Private
*/
function private function_48fb2ed5()
{
	if(getdvarint(#"hash_7db4fc2e427dab4", 0) == 1)
	{
		for(i = 0; i < 3; i++)
		{
			var_3aa83917 = "teleporter_part_a_" + i;
			var_d4d5e62 = "teleporter_part_b_" + i;
			var_e00503d2 = "teleporter_part_c_" + i;
			var_d6d47185 = "teleporter_part_d_" + i;
			level thread function_6badca5(hash(var_3aa83917), #"hash_74d379a1496a3d22");
			level thread function_6badca5(hash(var_d4d5e62), #"hash_74d378a1496a3b6f");
			level thread function_6badca5(hash(var_e00503d2), #"hash_74d377a1496a39bc");
			level thread function_6badca5(hash(var_d6d47185), #"hash_74d376a1496a3809");
		}
	}
	else
	{
		if((getdvarint(#"hash_43ea26c575227d39", -1)) >= 0)
		{
			n_loc = getdvarint(#"hash_43ea26c575227d39", 0);
			var_3aa83917 = "teleporter_part_a_" + n_loc;
			level.var_ef6bb204 = n_loc;
			var_d4d5e62 = "teleporter_part_b_" + n_loc;
			level.var_e1ef8bc7 = n_loc;
			var_e00503d2 = "teleporter_part_c_" + n_loc;
			level.var_8e3ebebd = n_loc;
			var_d6d47185 = "teleporter_part_d_" + n_loc;
			level.var_3174da65 = n_loc;
			level thread function_6badca5(hash(var_3aa83917), #"hash_74d379a1496a3d22");
			level thread function_6badca5(hash(var_d4d5e62), #"hash_74d378a1496a3b6f");
			level thread function_6badca5(hash(var_e00503d2), #"hash_74d377a1496a39bc");
			level thread function_6badca5(hash(var_d6d47185), #"hash_74d376a1496a3809");
		}
		else
		{
			var_eb0ad55b = randomint(3);
			var_3aa83917 = "teleporter_part_a_" + var_eb0ad55b;
			level.var_ef6bb204 = var_eb0ad55b;
			var_eb0ad55b = randomint(3);
			var_d4d5e62 = "teleporter_part_b_" + var_eb0ad55b;
			level.var_e1ef8bc7 = var_eb0ad55b;
			var_eb0ad55b = randomint(3);
			var_e00503d2 = "teleporter_part_c_" + var_eb0ad55b;
			level.var_8e3ebebd = var_eb0ad55b;
			var_eb0ad55b = randomint(3);
			var_d6d47185 = "teleporter_part_d_" + var_eb0ad55b;
			level.var_3174da65 = var_eb0ad55b;
			level thread function_6badca5(hash(var_3aa83917), #"hash_74d379a1496a3d22");
			level thread function_6badca5(hash(var_d4d5e62), #"hash_74d378a1496a3b6f");
			level thread function_6badca5(hash(var_e00503d2), #"hash_74d377a1496a39bc");
			level thread function_6badca5(hash(var_d6d47185), #"hash_74d376a1496a3809");
		}
	}
}

/*
	Name: function_6badca5
	Namespace: namespace_e502fca8
	Checksum: 0x313367B2
	Offset: 0x2938
	Size: 0x150
	Parameters: 2
	Flags: Private
*/
function private function_6badca5(var_de8de22d, str_item_name)
{
	level endon(#"end_game");
	var_de3fad27 = struct::get(var_de8de22d);
	if(isdefined(var_de3fad27))
	{
		point = function_4ba8fde(str_item_name);
		var_bd8c06d4 = item_drop::drop_item(0, undefined, 1, 0, point.id, var_de3fad27.origin, var_de3fad27.angles, 0);
		var_bd8c06d4.var_dd21aec2 = 1 | 16;
		var_bd8c06d4.var_a6762160.var_4cd830a = 1;
		if(!isdefined(level.var_ec7a1fe8))
		{
			level.var_ec7a1fe8 = [];
		}
		else if(!isarray(level.var_ec7a1fe8))
		{
			level.var_ec7a1fe8 = array(level.var_ec7a1fe8);
		}
		level.var_ec7a1fe8[level.var_ec7a1fe8.size] = var_bd8c06d4;
	}
}

/*
	Name: function_10a4dd0a
	Namespace: namespace_e502fca8
	Checksum: 0x7F259449
	Offset: 0x2A90
	Size: 0x1FA
	Parameters: 1
	Flags: None
*/
function function_10a4dd0a(params)
{
	if(isdefined(params.item) && isdefined(params.item.var_a6762160))
	{
		name = params.item.var_a6762160.name;
	}
	if(!isdefined(name) || !isplayer(self))
	{
		return;
	}
	switch(name)
	{
		case "hash_74d379a1496a3d22":
		{
			level thread function_3ddd0bcb("a");
			level namespace_6747c550::function_7df6bb60(#"hash_689d93f2ecc4ae51", 1);
			break;
		}
		case "hash_74d378a1496a3b6f":
		{
			level thread function_3ddd0bcb("b");
			level namespace_6747c550::function_7df6bb60(#"hash_689d90f2ecc4a938", 1);
			break;
		}
		case "hash_74d377a1496a39bc":
		{
			level thread function_3ddd0bcb("c");
			level namespace_6747c550::function_7df6bb60(#"hash_689d91f2ecc4aaeb", 1);
			break;
		}
		case "hash_74d376a1496a3809":
		{
			level thread function_3ddd0bcb("d");
			level namespace_6747c550::function_7df6bb60(#"hash_689d96f2ecc4b36a", 1);
			break;
		}
	}
}

/*
	Name: function_3ddd0bcb
	Namespace: namespace_e502fca8
	Checksum: 0x720B2F3C
	Offset: 0x2C98
	Size: 0x174
	Parameters: 1
	Flags: None
*/
function function_3ddd0bcb(str_part)
{
	level.var_f3ec3e94++;
	level thread namespace_9771a88f::function_e1798a8e(level.var_f3ec3e94);
	if(level.var_f3ec3e94 < 4 && !level flag::get(#"hash_419cb6aea3c6771e"))
	{
		level function_ec1c666a();
	}
	foreach(e_player in getplayers())
	{
		zm_items::player_pick_up(e_player, zm_crafting::function_4c2f8683(hash("zitem_tungsten_teleporter_part_" + str_part)));
	}
	level flag::set(#"hash_489085945502c0b4" + str_part);
}

/*
	Name: function_ec1c666a
	Namespace: namespace_e502fca8
	Checksum: 0xAF5B89DA
	Offset: 0x2E18
	Size: 0x124
	Parameters: 0
	Flags: None
*/
function function_ec1c666a()
{
	if(!level flag::get(#"hash_33c0045188845715"))
	{
		return;
	}
	switch(level.var_f3ec3e94)
	{
		case 0:
		default:
		{
			str_objective_text = #"hash_767f31cac737428";
			break;
		}
		case 1:
		{
			str_objective_text = #"hash_203dee68e7b0d8cc";
			break;
		}
		case 2:
		{
			str_objective_text = #"hash_203df168e7b0dde5";
			break;
		}
		case 3:
		{
			str_objective_text = #"hash_203df068e7b0dc32";
			break;
		}
	}
	namespace_ee206246::objective_set(#"hash_6b0d92dea8e98f10", undefined, undefined, str_objective_text, undefined, undefined);
}

/*
	Name: function_73ab4038
	Namespace: namespace_e502fca8
	Checksum: 0xA6056E3F
	Offset: 0x2F48
	Size: 0xDC
	Parameters: 4
	Flags: Private
*/
function private function_73ab4038(var_3ba63a49, var_cd5233de, var_19de10a2, var_c69deb0e)
{
	level endon(#"end_game");
	if(!level flag::get(var_c69deb0e))
	{
		s_poi = struct::get_array(var_cd5233de, "targetname");
		namespace_ee206246::objective_set(var_19de10a2, s_poi, undefined, undefined, undefined, 96, &function_c159026d);
		level flag::wait_till(var_c69deb0e);
		namespace_ee206246::objective_complete(var_19de10a2);
	}
}

/*
	Name: function_c159026d
	Namespace: namespace_e502fca8
	Checksum: 0xA2327584
	Offset: 0x3030
	Size: 0x32
	Parameters: 2
	Flags: None
*/
function function_c159026d(v_origin_or_ent, params)
{
	return self zm_zonemgr::is_player_in_zone(level.var_2f941a56);
}

/*
	Name: function_2d857fb2
	Namespace: namespace_e502fca8
	Checksum: 0x7974E18B
	Offset: 0x3070
	Size: 0x13C
	Parameters: 2
	Flags: None
*/
function function_2d857fb2(b_skipped, var_19e802fa)
{
	if(var_19e802fa)
	{
		namespace_ee206246::objective_complete(#"hash_51a0015904debd03");
		namespace_ee206246::objective_complete(#"hash_51a0025904debeb6");
		namespace_ee206246::objective_complete(#"hash_51a0035904dec069");
		namespace_ee206246::objective_complete(#"hash_51a0045904dec21c");
		function_43828640();
	}
	else if(b_skipped)
	{
		function_43828640();
	}
	callback::remove_callback(#"hash_56d1805bfff3e65b", &function_10a4dd0a);
	namespace_ee206246::objective_complete(#"hash_6b0d92dea8e98f10");
	level flag::set(#"hash_bc6e6c4a2ea3f60");
}

/*
	Name: function_43828640
	Namespace: namespace_e502fca8
	Checksum: 0x82EF26B8
	Offset: 0x31B8
	Size: 0x270
	Parameters: 0
	Flags: Private
*/
function private function_43828640()
{
	level namespace_6747c550::function_7df6bb60(#"hash_689d93f2ecc4ae51", 1);
	level namespace_6747c550::function_7df6bb60(#"hash_689d90f2ecc4a938", 1);
	level namespace_6747c550::function_7df6bb60(#"hash_689d91f2ecc4aaeb", 1);
	level namespace_6747c550::function_7df6bb60(#"hash_689d96f2ecc4b36a", 1);
	foreach(e_player in getplayers())
	{
		zm_items::player_pick_up(e_player, zm_crafting::function_4c2f8683(#"hash_4d2989acf6d2c3f4"));
		zm_items::player_pick_up(e_player, zm_crafting::function_4c2f8683(#"hash_4d298cacf6d2c90d"));
		zm_items::player_pick_up(e_player, zm_crafting::function_4c2f8683(#"hash_4d298bacf6d2c75a"));
		zm_items::player_pick_up(e_player, zm_crafting::function_4c2f8683(#"hash_4d2986acf6d2bedb"));
	}
	foreach(var_bd8c06d4 in level.var_ec7a1fe8)
	{
		if(isdefined(var_bd8c06d4))
		{
			var_bd8c06d4 delete();
		}
	}
}

/*
	Name: function_57c1663d
	Namespace: namespace_e502fca8
	Checksum: 0x5DE9A8F4
	Offset: 0x3430
	Size: 0x2B4
	Parameters: 1
	Flags: None
*/
function function_57c1663d(b_skipped)
{
	level endon(#"end_game");
	if(b_skipped)
	{
		return;
	}
	var_b75e4db1 = struct::get_array(#"hash_602ff2e237fe84ec");
	if(!level flag::get(#"hash_419cb6aea3c6771e"))
	{
		namespace_ee206246::objective_set(#"hash_6b0d93dea8e990c3", var_b75e4db1, undefined, #"hash_48d05f0065d46242", undefined, 96);
		level thread namespace_ff7e490::function_a70fa155(#"hash_6b0d93dea8e990c3", #"hash_62731aa273c00263", var_b75e4db1, level.var_2f941a56, [1:#"hash_53f8c5ea0b7cd05a", 0:#"hash_219a3f198a6aa63"]);
	}
	zm_crafting::function_d1f16587(#"hash_434e63df930cc195", &function_2a795365);
	level flag::wait_till(#"hash_219a3f198a6aa63");
	zm_crafting::function_ca244624(#"hash_434e63df930cc195");
	namespace_ee206246::objective_complete(#"hash_6b0d93dea8e990c3");
	level clientfield::set("" + #"hash_18f96dcb4766fbe8", 1);
	portal_fx = getent("portal_fx_anytown_usa_to_bunker", "targetname");
	playsoundatposition(#"hash_4e9f052116a0cb95", portal_fx.origin);
	level thread scene::play(#"hash_12a9771a2346ed59", "targetname");
	level clientfield::set("" + #"hash_27308a7dd991ce8d", 0);
	level function_891d8fc(#"hash_3976f9f041f5b338");
}

/*
	Name: function_2a795365
	Namespace: namespace_e502fca8
	Checksum: 0x25717569
	Offset: 0x36F0
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function function_2a795365(e_player)
{
	level flag::set(#"hash_219a3f198a6aa63");
}

/*
	Name: function_80f4c05c
	Namespace: namespace_e502fca8
	Checksum: 0xA05E4FC5
	Offset: 0x3728
	Size: 0x2B4
	Parameters: 2
	Flags: None
*/
function function_80f4c05c(b_skipped, var_19e802fa)
{
	if(var_19e802fa)
	{
		level flag::set(#"hash_219a3f198a6aa63");
		namespace_ee206246::objective_complete(#"hash_6b0d93dea8e990c3");
		zm_crafting::function_ca244624(#"hash_434e63df930cc195");
		level clientfield::set("" + #"hash_18f96dcb4766fbe8", 1);
		portal_fx = getent("portal_fx_anytown_usa_to_bunker", "targetname");
		playsoundatposition(#"hash_4e9f052116a0cb95", portal_fx.origin);
		level thread scene::play(#"hash_12a9771a2346ed59", "targetname");
		level clientfield::set("" + #"hash_27308a7dd991ce8d", 0);
		level flag::set(#"hash_3976f9f041f5b338");
	}
	else if(b_skipped)
	{
		zm_crafting::function_ca244624(#"hash_434e63df930cc195");
		level clientfield::set("" + #"hash_18f96dcb4766fbe8", 1);
		portal_fx = getent("portal_fx_anytown_usa_to_bunker", "targetname");
		playsoundatposition(#"hash_4e9f052116a0cb95", portal_fx.origin);
		level thread scene::play(#"hash_12a9771a2346ed59", "targetname");
		level clientfield::set("" + #"hash_27308a7dd991ce8d", 0);
		level flag::set(#"hash_3976f9f041f5b338");
	}
}

/*
	Name: function_71d12bb
	Namespace: namespace_e502fca8
	Checksum: 0xEE9D98CB
	Offset: 0x39E8
	Size: 0x12C
	Parameters: 1
	Flags: None
*/
function function_71d12bb(b_skipped)
{
	level endon(#"end_game");
	namespace_f22a3322::function_5c0aa258();
	if(b_skipped)
	{
		return;
	}
	var_b75e4db1 = struct::get_array(#"hash_e90df2ca25fbd31", "script_string");
	if(!level flag::get(#"hash_419cb6aea3c6771e"))
	{
		namespace_ee206246::objective_set(#"hash_6b0da0dea8e9a6da", var_b75e4db1, undefined, #"hash_6c1c6189dad114f3", undefined, 96);
		level thread namespace_ff7e490::function_a70fa155(#"hash_6b0da0dea8e9a6da", #"hash_62731aa273c00263", var_b75e4db1, level.var_2f941a56, #"hash_60b42daf2f6eed10");
	}
	level flag::wait_till(#"hash_3a6e7ed8a0c1d66f");
}

/*
	Name: function_8af5a955
	Namespace: namespace_e502fca8
	Checksum: 0x10996D90
	Offset: 0x3B20
	Size: 0x34
	Parameters: 2
	Flags: None
*/
function function_8af5a955(b_skipped, var_19e802fa)
{
	namespace_ee206246::objective_complete(#"hash_6b0da0dea8e9a6da");
}

/*
	Name: function_5dd183b3
	Namespace: namespace_e502fca8
	Checksum: 0x7F7ABA24
	Offset: 0x3B60
	Size: 0x24C
	Parameters: 1
	Flags: None
*/
function function_5dd183b3(b_skipped)
{
	level endon(#"end_game");
	if(b_skipped)
	{
		return;
	}
	var_b75e4db1 = struct::get_array(#"hash_41486bda55a042a1", "targetname");
	if(!level flag::get(#"hash_419cb6aea3c6771e"))
	{
		namespace_ee206246::objective_set(#"hash_132e6b438fc25c85", var_b75e4db1, undefined, #"hash_6c1c6189dad114f3", undefined, 96);
		level thread namespace_ff7e490::function_a70fa155(#"hash_132e6b438fc25c85", #"hash_62731aa273c00263", var_b75e4db1, level.var_65c43c31, [1:#"hash_21771dcc5fcdfdf0", 0:#"hash_72dd80c10b5daf3d"]);
	}
	level flag::wait_till(#"hash_72dd80c10b5daf3d");
	namespace_ee206246::objective_complete(#"hash_132e6b438fc25c85");
	var_b75e4db1 = struct::get_array(#"hash_5fc30c4b8c9bfde9", "script_string");
	if(!level flag::get(#"hash_419cb6aea3c6771e"))
	{
		namespace_ee206246::objective_set(#"hash_132e68438fc2576c", var_b75e4db1, undefined, #"hash_6c1c6189dad114f3", undefined, 96);
		level thread namespace_ff7e490::function_a70fa155(#"hash_132e68438fc2576c", #"hash_62731aa273c00263", var_b75e4db1, level.var_65c43c31, #"hash_21771dcc5fcdfdf0");
	}
	level flag::wait_till(#"hash_5e62d1ed239ef64f");
}

/*
	Name: function_cb435598
	Namespace: namespace_e502fca8
	Checksum: 0x431449C0
	Offset: 0x3DB8
	Size: 0x94
	Parameters: 2
	Flags: None
*/
function function_cb435598(b_skipped, var_19e802fa)
{
	if(var_19e802fa)
	{
		namespace_ee206246::objective_complete(#"hash_132e6b438fc25c85");
	}
	namespace_ee206246::objective_complete(#"hash_132e68438fc2576c");
	level clientfield::set("" + #"hash_45c3013f063fe2c7", 2);
}

/*
	Name: function_4710b248
	Namespace: namespace_e502fca8
	Checksum: 0xEFB5969B
	Offset: 0x3E58
	Size: 0x294
	Parameters: 1
	Flags: None
*/
function function_4710b248(b_skipped)
{
	level endon(#"end_game");
	if(b_skipped)
	{
		return;
	}
	exploder::stop_exploder("lgt_env_teleporter_purple");
	exploder::exploder("lgt_env_teleporter_red");
	level thread namespace_9771a88f::function_160a5a82();
	level scene::init(#"hash_2db28dd555f08d92", "targetname");
	wait(0.5);
	level scene::play(#"hash_2db28dd555f08d92", "targetname");
	playsoundatposition(#"hash_52aaa9a4a2e71c73", level.var_307ccdbc.origin + vectorscale((0, 0, 1), 40));
	level flag::set(#"hash_820c83920af16b7");
	level flag::set("pause_round_timeout");
	if(!level flag::get(#"hash_419cb6aea3c6771e"))
	{
		namespace_ee206246::objective_set(#"hash_6b109edea8ebd94b", level.var_307ccdbc, undefined, #"hash_60d5cfd57b14f4f9", undefined, undefined);
		level thread namespace_ff7e490::function_a70fa155(#"hash_6b109edea8ebd94b", #"hash_62731aa273c00263", [0:level.var_307ccdbc], level.var_65c43c31, #"hash_2be67a9d75cbb126", 1);
	}
	level thread function_168d593a();
	level.var_307ccdbc waittill(#"death");
	level thread zm_powerups::specific_powerup_drop("full_ammo", level.var_307ccdbc.origin, undefined, undefined, undefined, 0, 1);
	level thread namespace_9771a88f::function_65ed4fb1();
}

/*
	Name: function_54dd8e5d
	Namespace: namespace_e502fca8
	Checksum: 0x4320CD5
	Offset: 0x40F8
	Size: 0x7C
	Parameters: 1
	Flags: None
*/
function function_54dd8e5d(a_ents)
{
	level.var_307ccdbc = a_ents[#"abomination"];
	level.var_307ccdbc.ignore_round_spawn_failsafe = 1;
	level.var_307ccdbc.no_powerups = 1;
	level.var_307ccdbc flag::set(#"hash_204aaf6e250ebdbc");
}

/*
	Name: function_168d593a
	Namespace: namespace_e502fca8
	Checksum: 0xE50942BD
	Offset: 0x4180
	Size: 0x30A
	Parameters: 0
	Flags: Private
*/
function private function_168d593a()
{
	level endon(#"end_game", #"hash_19c523c64529d390", #"hash_13f94cabb3a57dc4");
	var_34596f46 = getdvarint(#"hash_384ba2437ce660b", getplayers().size);
	switch(var_34596f46)
	{
		case 4:
		{
			var_9d9c5a3c = 5;
			break;
		}
		case 3:
		{
			var_9d9c5a3c = 5;
			break;
		}
		case 2:
		{
			var_9d9c5a3c = 0;
			break;
		}
		default:
		{
			var_9d9c5a3c = 0;
			break;
		}
	}
	s_spawn_loc = struct::get(#"hash_5378bcd31960f347", "targetname");
	n_wait_time = 5;
	n_countdown = 5;
	var_d9439ea = 0;
	while(var_d9439ea < var_9d9c5a3c)
	{
		wait(n_wait_time);
		ai = undefined;
		while(!isdefined(ai))
		{
			n_ai = getaicount();
			if(n_ai < getailimit() && n_ai < level.zombie_ai_limit)
			{
				ai = spawnactor(namespace_96b7f11d::function_ddc13fd6().aitype, s_spawn_loc.origin, s_spawn_loc.angles, "pap_quest_add", 1);
				if(isdefined(ai))
				{
					ai thread function_43ea27c1();
					ai clientfield::increment("" + #"hash_54e2a4e02a26cc62", 1);
				}
				else
				{
					wait(1);
				}
			}
			else
			{
				wait(1);
			}
		}
		var_d9439ea++;
		if(n_wait_time > 5)
		{
			if(n_countdown > 1)
			{
				n_countdown--;
			}
			else
			{
				n_countdown = 5;
				n_wait_time = n_wait_time - 1;
			}
		}
	}
}

/*
	Name: function_43ea27c1
	Namespace: namespace_e502fca8
	Checksum: 0x1C6E28DA
	Offset: 0x4498
	Size: 0xAC
	Parameters: 0
	Flags: Private
*/
function private function_43ea27c1()
{
	self endon(#"death");
	self.maxhealth = self namespace_e0710ee6::function_b5fe98(level.round_number);
	self.health = self.maxhealth;
	self.no_powerups = 1;
	self.completed_emerging_into_playable_area = 1;
	self.zombie_think_done = 1;
	self zombie_utility::set_zombie_run_cycle("run");
	self pathmode("move allowed");
}

/*
	Name: function_a5034a1
	Namespace: namespace_e502fca8
	Checksum: 0x4522D265
	Offset: 0x4550
	Size: 0x154
	Parameters: 2
	Flags: None
*/
function function_a5034a1(b_skipped, var_19e802fa)
{
	if(var_19e802fa)
	{
		if(isdefined(level.var_307ccdbc))
		{
			level.var_307ccdbc thread function_73c168af();
		}
	}
	namespace_ee206246::objective_complete(#"hash_6b109edea8ebd94b");
	level notify(#"hash_19c523c64529d390");
	level flag::set(#"hash_67685d2c51bd61db");
	level flag::clear(#"hash_820c83920af16b7");
	if(level.round_number >= 6)
	{
		level flag::clear("pause_round_timeout");
	}
	level clientfield::set("" + #"hash_45c3013f063fe2c7", 1);
	exploder::stop_exploder("lgt_env_teleporter_red");
	exploder::exploder("lgt_env_teleporter_purple");
}

/*
	Name: function_73c168af
	Namespace: namespace_e502fca8
	Checksum: 0x63F41DC1
	Offset: 0x46B0
	Size: 0x64
	Parameters: 0
	Flags: Private
*/
function private function_73c168af()
{
	level endon(#"end_game");
	self endon(#"death");
	while(zm_utility::is_magic_bullet_shield_enabled(self))
	{
		wait(1);
	}
	self kill();
}

/*
	Name: function_f4301c94
	Namespace: namespace_e502fca8
	Checksum: 0xBA14E526
	Offset: 0x4720
	Size: 0x15C
	Parameters: 1
	Flags: None
*/
function function_f4301c94(b_skipped)
{
	level endon(#"end_game");
	namespace_f22a3322::function_904e469e();
	if(b_skipped)
	{
		return;
	}
	wait(3);
	var_b75e4db1 = struct::get_array(#"hash_5fc30c4b8c9bfde9", "script_string");
	if(!level flag::get(#"hash_419cb6aea3c6771e"))
	{
		namespace_ee206246::objective_set(#"hash_6b109ddea8ebd798", var_b75e4db1, undefined, #"hash_6c1c6189dad114f3", undefined, 96);
		level thread namespace_ff7e490::function_a70fa155(#"hash_6b109ddea8ebd798", #"hash_62731aa273c00263", var_b75e4db1, level.var_65c43c31, #"hash_54ee56714dc65535");
	}
	level flag::wait_till(#"hash_13f94cabb3a57dc4");
	function_8ca5e5a(&namespace_9771a88f::function_28594421, "pap_quest_observation_trigger");
}

/*
	Name: function_32f7764e
	Namespace: namespace_e502fca8
	Checksum: 0x64EAE5E3
	Offset: 0x4888
	Size: 0x34
	Parameters: 2
	Flags: None
*/
function function_32f7764e(b_skipped, var_19e802fa)
{
	namespace_ee206246::objective_complete(#"hash_6b109ddea8ebd798");
}

/*
	Name: function_e876ecf0
	Namespace: namespace_e502fca8
	Checksum: 0x34AD0C70
	Offset: 0x48C8
	Size: 0x134
	Parameters: 1
	Flags: None
*/
function function_e876ecf0(b_skipped)
{
	if(b_skipped)
	{
		return;
	}
	var_b75e4db1 = struct::get_array("lock_down_button");
	if(!level flag::get(#"hash_419cb6aea3c6771e"))
	{
		namespace_ee206246::objective_set(#"hash_b31321995c77e23", var_b75e4db1, undefined, #"hash_6a2ddbfbd9fb504d");
		level thread namespace_ff7e490::function_a70fa155(#"hash_b31321995c77e23", #"hash_62731aa273c00263", var_b75e4db1, [0:#"hash_10b836f6790b4662"], #"hash_74484cce46add9e");
	}
	var_b75e4db1[0] zm_unitrigger::create(&function_b4606168, 64, &function_b279c743);
	level flag::wait_till(#"hash_3814c5c6793e2b2d");
}

/*
	Name: function_8ad7a0a7
	Namespace: namespace_e502fca8
	Checksum: 0x50667C81
	Offset: 0x4A08
	Size: 0x21C
	Parameters: 2
	Flags: None
*/
function function_8ad7a0a7(b_skipped, var_19e802fa)
{
	if(var_19e802fa)
	{
		level flag::set(#"hash_3814c5c6793e2b2d");
	}
	namespace_ee206246::objective_complete(#"hash_b31321995c77e23");
	s_interact = struct::get("lock_down_button");
	s_interact thread zm_unitrigger::unregister_unitrigger(s_interact.s_unitrigger);
	level thread function_bb40f375();
	zm_power::turn_power_on_and_open_doors(1, 0);
	level function_d18f9441();
	level flag::clear(#"disable_weapon_machine");
	zm_unitrigger::unregister_unitrigger(level.var_2932d13.s_unitrigger);
	level flag::set("enable_round_timeout");
	level clientfield::set("" + #"hash_3432d09ff93c9a0c", 1);
	portal_fx = getent("portal_fx_observation_to_helipads", "targetname");
	playsoundatposition(#"hash_4e9f052116a0cb95", portal_fx.origin);
	level thread scene::play(#"hash_6331244ff2bb3ab1", "targetname");
	level thread function_891d8fc(#"hash_4c3af4729843e724");
}

/*
	Name: function_266ae0b1
	Namespace: namespace_e502fca8
	Checksum: 0x603F8DBB
	Offset: 0x4C30
	Size: 0xF4
	Parameters: 0
	Flags: None
*/
function function_266ae0b1()
{
	s_button = struct::get("lock_down_button");
	s_button.var_c9b734f5 = util::spawn_model(#"hash_7c81868a02c10968", s_button.origin, s_button.angles);
	s_button.var_c36e3eb9 = util::spawn_model(#"hash_51b155104fbf49b4", s_button.origin, s_button.angles);
	s_button.var_c9b734f5 setscale(s_button.modelscale);
	s_button.var_c36e3eb9 setscale(s_button.modelscale);
	s_button.var_c36e3eb9 hide();
}

/*
	Name: function_4313bea3
	Namespace: namespace_e502fca8
	Checksum: 0x4AE419E0
	Offset: 0x4D30
	Size: 0x6C
	Parameters: 0
	Flags: None
*/
function function_4313bea3()
{
	level flag::set(#"disable_weapon_machine");
	level.var_2932d13 = struct::get("pap_machine_lockdown");
	level.var_2932d13 zm_unitrigger::create(#"hash_793db3dc20917334");
}

/*
	Name: function_bb40f375
	Namespace: namespace_e502fca8
	Checksum: 0xFB5C9831
	Offset: 0x4DA8
	Size: 0x7C
	Parameters: 0
	Flags: None
*/
function function_bb40f375()
{
	s_button = struct::get("lock_down_button");
	if(isdefined(s_button.var_c36e3eb9))
	{
		s_button.var_c36e3eb9 show();
		wait(0.5);
		if(isdefined(s_button.var_c9b734f5))
		{
			s_button.var_c9b734f5 delete();
		}
	}
}

/*
	Name: function_b4606168
	Namespace: namespace_e502fca8
	Checksum: 0x5C04F044
	Offset: 0x4E30
	Size: 0x120
	Parameters: 1
	Flags: None
*/
function function_b4606168(player)
{
	if(isplayer(player))
	{
		if(!level flag::get(#"hash_790eded2ae749054") && !player isfiring() && !player isreloading() && player getstance() === "stand")
		{
			n_dot = player math::get_dot_forward(self.origin);
			if(n_dot > 0.5)
			{
				self sethintstringforplayer(player, #"hash_7852bc5d9a8aae9c");
				return true;
			}
		}
		self sethintstringforplayer(player, "");
		return false;
	}
}

/*
	Name: function_b279c743
	Namespace: namespace_e502fca8
	Checksum: 0x2DDC2A41
	Offset: 0x4F58
	Size: 0x1FC
	Parameters: 0
	Flags: None
*/
function function_b279c743()
{
	level endon(#"end_game");
	self endon(#"death");
	s_interact = struct::get("lock_down_button");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"trigger");
		activator = waitresult.activator;
		if(isplayer(activator))
		{
			level flag::set(#"hash_790eded2ae749054");
			if(activator gestures::function_8cc27b6d(#"hash_606686a1b66827ac"))
			{
				activator namespace_96b7f11d::function_2a73b31d();
				activator setorigin((6233, 4653, 556));
				activator setplayerangles((45, 91, 0));
				activator playgestureviewmodel(#"hash_606686a1b66827ac");
				wait(0.5);
				activator namespace_96b7f11d::function_202a6698();
			}
			activator playrumbleonentity("damage_light");
			playsoundatposition(#"hash_24529e08fd2e1264", s_interact.origin);
			level flag::set(#"hash_3814c5c6793e2b2d");
			break;
		}
	}
}

/*
	Name: function_d18f9441
	Namespace: namespace_e502fca8
	Checksum: 0x877FA104
	Offset: 0x5160
	Size: 0x110
	Parameters: 0
	Flags: None
*/
function function_d18f9441()
{
	var_63a065c3 = struct::get("pap_machine");
	a_players = function_a1ef346b();
	foreach(player in a_players)
	{
		if(distancesquared(var_63a065c3.origin, player.origin) < sqr(500))
		{
			player function_bc82f900(#"hash_38e6d9d60e16e199");
		}
	}
}

/*
	Name: function_5ad3e281
	Namespace: namespace_e502fca8
	Checksum: 0xA508BB74
	Offset: 0x5278
	Size: 0x54
	Parameters: 0
	Flags: None
*/
function function_5ad3e281()
{
	level endon(#"end_game");
	level flag::wait_till(#"hash_3814c5c6793e2b2d");
	changeadvertisedstatus(0);
}

/*
	Name: function_8ca5e5a
	Namespace: namespace_e502fca8
	Checksum: 0xACDD30BB
	Offset: 0x52D8
	Size: 0xE0
	Parameters: 3
	Flags: None
*/
function function_8ca5e5a(var_7a54a362, str_trigger, var_95c6b9dd)
{
	trigger = getent(str_trigger, "targetname");
	foreach(e_player in getplayers())
	{
		e_player thread function_69054a6f(var_7a54a362, trigger, var_95c6b9dd);
	}
}

/*
	Name: function_69054a6f
	Namespace: namespace_e502fca8
	Checksum: 0xFA996E33
	Offset: 0x53C0
	Size: 0xAC
	Parameters: 3
	Flags: Private
*/
function private function_69054a6f(var_7a54a362, trigger, var_95c6b9dd)
{
	level endon(#"end_game", var_95c6b9dd);
	self endon(#"death", #"disconnect");
	b_vo_played = 0;
	while(!b_vo_played)
	{
		if(self istouching(trigger))
		{
			self thread [[var_7a54a362]]();
			b_vo_played = 1;
		}
		else
		{
			wait(0.1);
		}
	}
}

/*
	Name: function_891d8fc
	Namespace: namespace_e502fca8
	Checksum: 0xE6D03FB8
	Offset: 0x5478
	Size: 0x44
	Parameters: 1
	Flags: None
*/
function function_891d8fc(var_324be745)
{
	level endon(#"end_game");
	wait(1.5);
	level flag::set(var_324be745);
}

/*
	Name: function_8ac7a154
	Namespace: namespace_e502fca8
	Checksum: 0xC9546D4A
	Offset: 0x54C8
	Size: 0x38C
	Parameters: 0
	Flags: None
*/
function function_8ac7a154()
{
	/#
		level flag::set(#"hash_23042147964b0bc2");
		level clientfield::set("" + #"hash_2c7fb1cc66c590a0", 1);
		portal_fx = getent("", "");
		playsoundatposition(#"hash_4e9f052116a0cb95", portal_fx.origin);
		level thread scene::play(#"hash_5b9b9143bf52fa5f", "");
		level flag::set(#"hash_3976f9f041f5b338");
		level clientfield::set("" + #"hash_18f96dcb4766fbe8", 1);
		portal_fx = getent("", "");
		playsoundatposition(#"hash_4e9f052116a0cb95", portal_fx.origin);
		level clientfield::set("" + #"hash_27308a7dd991ce8d", 0);
		level thread scene::play(#"hash_12a9771a2346ed59", "");
		level clientfield::set("" + #"hash_3432d09ff93c9a0c", 1);
		portal_fx = getent("", "");
		playsoundatposition(#"hash_4e9f052116a0cb95", portal_fx.origin);
		portal_fx = getent("", "");
		playsoundatposition(#"hash_4e9f052116a0cb95", portal_fx.origin);
		level thread scene::play(#"hash_6331244ff2bb3ab1", "");
		level thread scene::play(#"hash_7c52431e19ff8737", "");
		level flag::set(#"hash_67685d2c51bd61db");
		level flag::set(#"hash_4c3af4729843e724");
		namespace_f22a3322::function_990a7f89();
		namespace_f22a3322::function_4f804075();
		namespace_f22a3322::function_5c0aa258();
		namespace_f22a3322::function_904e469e();
	#/
}

