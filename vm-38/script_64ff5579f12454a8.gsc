#using script_1029986e2bc8ca8e;
#using script_113dd7f0ea2a1d4f;
#using script_16b1b77a76492c6a;
#using script_1e72319526fef936;
#using script_2125dd4d7e4788a5;
#using script_2cb831533cab2794;
#using script_32b18d9fb454babf;
#using script_340a2e805e35f7a2;
#using script_34ab99a4ca1a43d;
#using script_437ce686d29bb81b;
#using script_4f2e2d1ba0040420;
#using script_5bb072c3abf4652c;
#using script_6418a6112420d977;
#using script_6b2d896ac43eb90;
#using script_7bacb32f8222fa3e;
#using script_7fc996fe8678852;
#using script_b9d273dc917ee1f;
#using script_cf3d8fde2407bb1;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\fx_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace namespace_af1ba366;

/*
	Name: function_720b37e8
	Namespace: namespace_af1ba366
	Checksum: 0x48493457
	Offset: 0x398
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_720b37e8()
{
	level notify(1304816826);
}

/*
	Name: function_89f2df9
	Namespace: namespace_af1ba366
	Checksum: 0xFDA6058B
	Offset: 0x3B8
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_779f30bffb82a50e", &function_70a657d8, undefined, undefined, #"hash_f81b9dea74f0ee");
}

/*
	Name: function_70a657d8
	Namespace: namespace_af1ba366
	Checksum: 0xD7CB690B
	Offset: 0x408
	Size: 0x794
	Parameters: 0
	Flags: None
*/
function function_70a657d8()
{
	if(!zm_utility::is_survival())
	{
		return;
	}
	var_39539c05 = zm_utility::function_e51dc2d8();
	var_95613111 = #"hash_50cc93a10c9d2175";
	var_a0ab1f0d = getgametypesetting(var_95613111);
	/#
		var_39539c05 = getdvarint(#"hash_2992299f853b2039", 0);
		var_a0ab1f0d = 1;
	#/
	if(!var_39539c05 || !var_a0ab1f0d)
	{
		return;
	}
	function_f3afb36c();
	level callback::add_callback(#"hash_540f54ade63017ea", &function_22f3bc59);
	namespace_8b6a9d79::function_b3464a7c(#"hash_18be5193d8310f84", &function_7cdcb903);
	namespace_8b6a9d79::function_b3464a7c(#"hash_18be5493d831149d", &function_ba2ed0f6);
	namespace_8b6a9d79::function_b3464a7c(#"hash_18be5393d83112ea", &function_830b8b01);
	var_bc4a7f19 = getdvarint(#"hash_292db25b2be947f", 0);
	var_6e1b5f33 = 0;
	if(level flag::get(#"hash_6d89e1456f61e5ab") || getdvarint(#"hash_c0b5b313ff35979", 0))
	{
		if(!var_bc4a7f19)
		{
			objective_manager::function_b3464a7c(#"hash_7d91d19173f382d", &function_9ad91439, &function_83ac5bc2, #"ee", #"hash_b418b036831ea2a", var_95613111, 3, #"hash_e747f276dd2bc6c");
			var_6e1b5f33 = 1;
		}
	}
	if(var_6e1b5f33 || var_bc4a7f19)
	{
		namespace_8b6a9d79::function_b3464a7c(#"hash_18be4d93d83108b8", &namespace_f865255e::function_42818ffd);
		if(var_bc4a7f19)
		{
			setdvar(#"hash_4c7a7b0813c6765d", "ee");
			level flag::set(#"hash_6d89e1456f61e5ab");
			level flag::set(#"hash_1558183088c6ccff");
		}
	}
	clientfield::register("toplayer", "" + #"hash_5ef33fc92614c211", 1, 1, "int");
	clientfield::register("toplayer", "" + #"hash_34af381c063f6611", 1, 1, "int");
	clientfield::register("scriptmover", "" + #"ambient_fx", 1, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_4bedc093642e28f6", 1, 1, "int");
	clientfield::register("vehicle", "" + #"hash_7d17014634879c10", 1, 1, "counter");
	clientfield::register("vehicle", "" + #"hash_1e59af4706036a79", 1, 1, "int");
	clientfield::register("vehicle", "" + #"hash_3178e1dcaee33fd3", 1, 1, "int");
	clientfield::register("world", "" + #"chopper_crash", 1, 1, "int");
	clientfield::register("world", "" + #"hash_4c8a7e79b5a2c61d", 1, 1, "int");
	clientfield::register("world", "" + #"hash_2c5407e7aece0a93", 1, 1, "int");
	clientfield::register("world", "" + #"hash_46265c2ce587e427", 1, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_705c1eb33e79522b", 1, 1, "int");
	/#
		if(getdvarint(#"hash_c0b5b313ff35979", 0))
		{
			setdvar(#"hash_4c7a7b0813c6765d", "");
			level flag::set(#"hash_4c9bb7a770c9e973");
			level flag::set(#"hash_6d89e1456f61e5ab");
		}
		if(getdvarint(#"hash_5b906952bed5efee", 0))
		{
			level flag::set(#"hash_414ba7eb6d94978d");
			level flag::set(#"hash_16f61b20c3d2c610");
		}
		if(getdvarint(#"hash_27ed0b721aab06a", 0))
		{
			level flag::set(#"hash_4b060b9820d4141d");
			level thread namespace_e69881c5::function_8375e4a7();
		}
	#/
}

/*
	Name: function_f3afb36c
	Namespace: namespace_af1ba366
	Checksum: 0xED36A185
	Offset: 0xBA8
	Size: 0xAC
	Parameters: 0
	Flags: None
*/
function function_f3afb36c()
{
	if(namespace_cf6efd05::function_21d402f4(#"hash_17d8f2b850883bac"))
	{
		level flag::set(#"hash_4c9bb7a770c9e973");
		function_f73a5c91();
		level thread function_9026620d();
	}
	if(namespace_cf6efd05::function_21d402f4(#"hash_6b772645c0ad8598"))
	{
		level flag::set(#"hash_6d89e1456f61e5ab");
	}
}

/*
	Name: function_22f3bc59
	Namespace: namespace_af1ba366
	Checksum: 0xA4C6AD10
	Offset: 0xC60
	Size: 0x94
	Parameters: 0
	Flags: None
*/
function function_22f3bc59()
{
	if(level flag::get(#"hash_4c9bb7a770c9e973"))
	{
		namespace_cf6efd05::function_c484a9be(#"hash_17d8f2b850883bac", 1);
	}
	if(level flag::get(#"hash_6d89e1456f61e5ab"))
	{
		namespace_cf6efd05::function_c484a9be(#"hash_6b772645c0ad8598", 1);
	}
}

/*
	Name: function_7cdcb903
	Namespace: namespace_af1ba366
	Checksum: 0xA4B69A26
	Offset: 0xD00
	Size: 0x2D8
	Parameters: 1
	Flags: None
*/
function function_7cdcb903(instance)
{
	if(!getdvarint(#"hash_5d3079579464742a", 0) && (level flag::get(#"hash_4c9bb7a770c9e973") || level.var_b48509f9 < 3) || level flag::get(#"hash_3b46a8a050e7823e"))
	{
		return;
	}
	level.var_ff7bf48c = [];
	var_2b357ce9 = instance.var_fe2612fe[#"hash_5a4e996db5182fe"][0];
	var_2b357ce9.s_teleport = struct::get(var_2b357ce9.targetname, "target");
	var_edf7d1ed = 1;
	function_6b9a56f7(var_2b357ce9, var_edf7d1ed, 0, 80);
	var_2b357ce9 = instance.var_fe2612fe[#"hash_5a4e896db51814b"][0];
	var_2b357ce9.s_teleport = struct::get(var_2b357ce9.targetname, "target");
	var_edf7d1ed = 2;
	function_6b9a56f7(var_2b357ce9, var_edf7d1ed);
	if(!var_2b357ce9 flag::get(#"hash_5c79c9319298891a"))
	{
		return;
	}
	var_2b357ce9 = instance.var_fe2612fe[#"hash_5a4e796db517f98"][0];
	var_2b357ce9.s_teleport = struct::get(var_2b357ce9.targetname, "target");
	var_edf7d1ed = 3;
	function_6b9a56f7(var_2b357ce9, var_edf7d1ed);
	if(!var_2b357ce9 flag::get(#"hash_5c79c9319298891a"))
	{
		return;
	}
	var_2b357ce9 = instance.var_fe2612fe[#"hash_5a4ee96db518b7d"][0];
	var_2b357ce9.s_teleport = struct::get(var_2b357ce9.targetname, "target");
	level thread function_ada90340(var_2b357ce9);
	function_6b9a56f7(var_2b357ce9);
	if(!var_2b357ce9 flag::get(#"hash_5c79c9319298891a"))
	{
		return;
	}
}

/*
	Name: function_6b9a56f7
	Namespace: namespace_af1ba366
	Checksum: 0x4DF1584E
	Offset: 0xFE0
	Size: 0x2A4
	Parameters: 4
	Flags: Private
*/
function private function_6b9a56f7(var_2b357ce9, var_edf7d1ed, b_timeout, n_radius)
{
	if(!isdefined(b_timeout))
	{
		b_timeout = 1;
	}
	if(!isdefined(n_radius))
	{
		n_radius = 160;
	}
	var_94b03771 = namespace_8b6a9d79::spawn_script_model(var_2b357ce9, "tag_origin");
	var_94b03771 clientfield::set("" + #"hash_705c1eb33e79522b", 1);
	var_94b03771 playloopsound(#"hash_78dbd059bc86c3d6");
	var_94b03771.instance = var_2b357ce9.parent;
	level.var_ff7bf48c[level.var_ff7bf48c.size] = var_94b03771;
	v_offset = vectorscale((0, 0, -1), 64);
	trigger = spawn("trigger_radius", var_2b357ce9.origin + v_offset, 0, n_radius, 128);
	trigger trigger::add_flags(16);
	trigger.instance = var_2b357ce9.parent;
	trigger.var_2b357ce9 = var_2b357ce9;
	trigger.var_94b03771 = var_94b03771;
	trigger.var_3b53f898 = 6;
	var_2b357ce9.trigger = trigger;
	var_2b357ce9.var_40803981 = 1;
	trigger callback::function_35a12f19(&namespace_7ec6ae9f::function_1c5803d9);
	if(isdefined(var_edf7d1ed))
	{
		var_2b357ce9 thread function_60e3239e(var_edf7d1ed);
	}
	if(b_timeout)
	{
		trigger util::deleteaftertime(45);
		var_94b03771 util::deleteaftertime(44);
		s_result = undefined;
		s_result = var_2b357ce9 waittilltimeout(45, #"hash_5c79c9319298891a");
		if(s_result._notify === "timeout")
		{
			var_2b357ce9 notify(#"hash_7365db42af38f201");
			return;
		}
	}
	var_2b357ce9 waittill(#"hash_5bc4e4b06c059733");
}

/*
	Name: function_60e3239e
	Namespace: namespace_af1ba366
	Checksum: 0x459B3A74
	Offset: 0x1290
	Size: 0x134
	Parameters: 1
	Flags: Private
*/
function private function_60e3239e(var_edf7d1ed)
{
	self flag::wait_till(#"hash_5c79c9319298891a");
	waitframe(1);
	foreach(player in function_a1ef346b())
	{
		if(player flag::get(#"hash_9f062ac608bb7e4"))
		{
			var_99356832 = player;
			break;
		}
	}
	if(isdefined(var_99356832))
	{
		var_99356832 zm_vo::function_7622cb70(#"hash_6e97f0d54d966da6" + var_edf7d1ed, randomfloatrange(0.2, 1), 0);
	}
}

/*
	Name: function_ada90340
	Namespace: namespace_af1ba366
	Checksum: 0xA39BC3F3
	Offset: 0x13D0
	Size: 0x2E4
	Parameters: 1
	Flags: Private
*/
function private function_ada90340(var_2b357ce9)
{
	var_dce66956 = var_2b357ce9.s_teleport;
	var_90016943 = namespace_8b6a9d79::spawn_script_model(var_dce66956, #"hash_30876ea41ba82413");
	var_90016943.angles = var_90016943.angles + (vectorscale((0, -1, 0), 90));
	var_90016943 ghost();
	s_result = undefined;
	s_result = var_2b357ce9 waittill(#"hash_5bc4e4b06c059733", #"hash_7365db42af38f201");
	if(s_result._notify === #"hash_7365db42af38f201")
	{
		var_90016943 delete();
		return;
	}
	var_90016943 show();
	var_90016943 playsound(#"hash_28e3e768d951d792");
	var_90016943 clientfield::set("" + #"hash_705c1eb33e79522b", 1);
	s_landing = struct::get(var_dce66956.targetname, "target");
	n_wait = var_90016943 zm_utility::fake_physicslaunch(s_landing.origin, 1900);
	wait(n_wait);
	var_90016943.origin = s_landing.origin;
	point = function_4ba8fde(#"hash_1147c0233d0fcf50");
	item_drop::drop_item(0, undefined, 1, point.amount, point.id, var_90016943.origin, var_90016943.angles, 0);
	var_90016943 deletedelay();
	callback::function_10a4dd0a(&function_6c8a368);
	wait(2);
	if(!level flag::get(#"hash_4c9bb7a770c9e973"))
	{
		level fx::play(#"hash_2c182d8faa3b2b9", s_landing.origin, vectorscale((1, 0, 0), 270), #"hash_4c9bb7a770c9e973");
	}
}

/*
	Name: function_6c8a368
	Namespace: namespace_af1ba366
	Checksum: 0x8710DBAA
	Offset: 0x16C0
	Size: 0x114
	Parameters: 1
	Flags: Private
*/
function private function_6c8a368(eventstruct)
{
	if(isplayer(self) && eventstruct.item.var_a6762160.name === #"hash_1147c0233d0fcf50")
	{
		callback::remove_callback(#"hash_56d1805bfff3e65b", &function_6c8a368);
		if(!level flag::get(#"hash_537da116d92d952f"))
		{
			level flag::set(#"hash_4c9bb7a770c9e973");
			function_f73a5c91();
			level thread function_9026620d();
			level zm_vo::function_7622cb70(#"hash_39648ccf27d7b75d", 0.5);
		}
	}
}

/*
	Name: function_76b5a507
	Namespace: namespace_af1ba366
	Checksum: 0x66D8E861
	Offset: 0x17E0
	Size: 0x1B4
	Parameters: 1
	Flags: None
*/
function function_76b5a507(s_params)
{
	namespace_dbb31ff3::function_170982ca(&function_76b5a507);
	var_6afa034c = level.var_1ea1d494.scriptmodel;
	if(isdefined(var_6afa034c))
	{
		var_8746b886 = util::spawn_model(#"hash_30876ea41ba82413", var_6afa034c gettagorigin("screen_exfil_jnt") + (-4.5, 15.5, 0), var_6afa034c gettagangles("screen_exfil_jnt") + vectorscale((1, 0, 0), 78));
		var_8746b886 setscale(0.75);
		var_8746b886 linkto(var_6afa034c, "screen_exfil_jnt", (-4.5, 15.5, 0), vectorscale((1, 0, 0), 78));
		var_8746b886 playsound(#"hash_3b5cbbf2a7018a89");
		var_8746b886 playloopsound(#"hash_5c3886dfcd812df");
		var_6afa034c.var_8746b886 = var_8746b886;
		var_6afa034c showpart("screen_respond_jnt");
		level thread function_f43ecee8(var_6afa034c);
	}
}

/*
	Name: function_57099652
	Namespace: namespace_af1ba366
	Checksum: 0x410D97CA
	Offset: 0x19A0
	Size: 0x254
	Parameters: 2
	Flags: None
*/
function function_57099652(machine, trigger)
{
	level notify(#"hash_21533c72f7fcd47b");
	function_a9c9d2c9();
	if(level flag::get(#"hash_4c9bb7a770c9e973"))
	{
		foreach(e_player in function_a1ef346b())
		{
			e_player clientfield::set_to_player("" + #"hash_583ce51cd4d9a904", 1);
		}
		level flag::set(#"hash_6d89e1456f61e5ab");
		namespace_cf6efd05::function_c484a9be(#"hash_6b772645c0ad8598", 1);
		var_6afa034c = level.var_1ea1d494.scriptmodel;
		if(isdefined(var_6afa034c.var_8746b886))
		{
			var_6afa034c.var_8746b886 stoploopsound();
		}
		namespace_18bbc38e::function_8e64a2b1("wz_sanatorium", #"ee", #"hash_7d91d19173f382d");
		level zm_vo::function_7622cb70(#"hash_6a0064de3091a957", 1);
		n_line = function_21a3a673(1, 3);
		level zm_vo::function_7622cb70(#"hash_16a4d7a3a801028f" + n_line, 0.5);
	}
}

/*
	Name: function_f73a5c91
	Namespace: namespace_af1ba366
	Checksum: 0xE046CD15
	Offset: 0x1C00
	Size: 0xFC
	Parameters: 0
	Flags: None
*/
function function_f73a5c91()
{
	callback::on_connect(&function_8cb966d6);
	foreach(e_player in getplayers())
	{
		e_player thread function_8cb966d6();
	}
	namespace_dbb31ff3::function_ef5e5f3(&function_76b5a507);
	namespace_dbb31ff3::function_bf90331e("beacon_choice_ravenov", &function_57099652);
}

/*
	Name: function_8cb966d6
	Namespace: namespace_af1ba366
	Checksum: 0xB3BAE89D
	Offset: 0x1D08
	Size: 0x7C
	Parameters: 0
	Flags: None
*/
function function_8cb966d6()
{
	level endon(#"end_game", #"hash_321d1e0f446a8d6d");
	self endon(#"disconnect");
	while(!isdefined(level.var_8bef1f53))
	{
		waitframe(1);
	}
	level.var_8bef1f53 namespace_d84b2e13::function_666779d(self, 2);
}

/*
	Name: function_a9c9d2c9
	Namespace: namespace_af1ba366
	Checksum: 0x2FB4B892
	Offset: 0x1D90
	Size: 0x15C
	Parameters: 0
	Flags: None
*/
function function_a9c9d2c9()
{
	callback::remove_on_connect(&function_8cb966d6);
	level notify(#"hash_321d1e0f446a8d6d");
	namespace_dbb31ff3::function_170982ca(&function_76b5a507);
	namespace_dbb31ff3::function_b26aed81("beacon_choice_ravenov");
	if(isdefined(level.var_8bef1f53))
	{
		foreach(e_player in getplayers())
		{
			level.var_8bef1f53 namespace_d84b2e13::function_666779d(e_player, 0);
		}
	}
	var_6afa034c = level.var_1ea1d494.scriptmodel;
	if(isdefined(var_6afa034c))
	{
		var_6afa034c hidepart("screen_respond_jnt");
	}
}

/*
	Name: function_f43ecee8
	Namespace: namespace_af1ba366
	Checksum: 0x3C20D626
	Offset: 0x1EF8
	Size: 0x8C
	Parameters: 1
	Flags: None
*/
function function_f43ecee8(var_6afa034c)
{
	if(!isdefined(var_6afa034c))
	{
		return;
	}
	level endon(#"end_game");
	var_6afa034c endon(#"death");
	level waittill(#"hash_29edd9425510b40d", #"hash_66a72ae427cfc39a");
	var_6afa034c hidepart("screen_respond_jnt");
}

/*
	Name: function_9026620d
	Namespace: namespace_af1ba366
	Checksum: 0x1C4348D7
	Offset: 0x1F90
	Size: 0xAC
	Parameters: 0
	Flags: None
*/
function function_9026620d()
{
	level endon(#"end_game", #"hash_21533c72f7fcd47b");
	level waittill(#"hash_345e9169ebba28fb", #"hash_3e765c26047c9f54");
	if(level flag::get(#"hash_4c9bb7a770c9e973"))
	{
		namespace_cf6efd05::function_c484a9be(#"hash_17d8f2b850883bac", 1);
		function_a9c9d2c9();
	}
}

/*
	Name: function_ba2ed0f6
	Namespace: namespace_af1ba366
	Checksum: 0x1865FC04
	Offset: 0x2048
	Size: 0x274
	Parameters: 1
	Flags: None
*/
function function_ba2ed0f6(instance)
{
	if(!level flag::get(#"hash_6d89e1456f61e5ab"))
	{
		return;
	}
	var_28bf3706 = instance.var_fe2612fe[#"heli_crash"][0];
	namespace_8b6a9d79::spawn_script_model(var_28bf3706, #"hash_6f4bd8715d49e317", 0, 0);
	var_33c42924 = namespace_8b6a9d79::spawn_script_model(var_28bf3706, #"hash_45d5f1151627a0d2", 0, 0);
	var_33c42924 disconnectpaths(2, 0);
	level flag::wait_till(#"all_players_spawned");
	if(namespace_cf6efd05::function_85b812c9())
	{
		level flag::wait_till(#"initial_fade_in_complete");
	}
	level clientfield::set("" + #"chopper_crash", 1);
	level exploder::exploder("fxexp_mq_heli_crash");
	level thread function_45b4534b();
	v_offset = vectorscale((0, 0, -1), 400);
	trigger = spawn("trigger_radius", var_28bf3706.origin + v_offset, 0, 800, 800);
	trigger.instance = instance;
	trigger callback::function_35a12f19(&function_f8b96957);
	instance.var_1c61fe4b = instance.var_fe2612fe[#"heli_audio"][0];
	instance.var_a9ef21d = namespace_8b6a9d79::spawn_script_model(instance.var_1c61fe4b, #"p9_zm_ndu_reel_to_reel_audio_recorder_01");
	level thread namespace_e69881c5::function_206ee608();
}

/*
	Name: function_f8b96957
	Namespace: namespace_af1ba366
	Checksum: 0x108884C7
	Offset: 0x22C8
	Size: 0x10C
	Parameters: 1
	Flags: Private
*/
function private function_f8b96957(eventstruct)
{
	player = eventstruct.activator;
	if(!isplayer(player) || level flag::get(#"hash_11e8bad986624085") || is_true(self.b_triggered))
	{
		return;
	}
	self.b_triggered = 1;
	self callback::function_b74bf3e(&function_f8b96957);
	self function_b1f268c1(self.instance.var_fe2612fe[#"heli_crash"][0].origin, self.instance);
	self deletedelay();
}

/*
	Name: function_b1f268c1
	Namespace: namespace_af1ba366
	Checksum: 0x8ACD2799
	Offset: 0x23E0
	Size: 0x24E
	Parameters: 2
	Flags: Private
*/
function private function_b1f268c1(v_loc, instance)
{
	level flag::set(#"hash_11e8bad986624085");
	trigger = namespace_8b6a9d79::function_214737c7(instance.var_1c61fe4b, &function_c8fba110, #"hash_4f43eb02fbcce2f5", undefined, undefined, undefined, 0);
	trigger.instance = instance;
	trigger.b_activated = 1;
	trigger usetriggerrequirelookat(0);
	level zm_vo::function_7622cb70(#"hash_c41aee239ce8b26");
	level zm_vo::function_7622cb70(#"hash_6587f9c1e0ab3a1f", 1);
	a_spawns = array::randomize((isdefined(instance.var_fe2612fe[#"hash_39aeaa4632e834e2"]) ? instance.var_fe2612fe[#"hash_39aeaa4632e834e2"] : []));
	self callback::function_35a12f19(&namespace_2c949ef8::function_39ee3b21, undefined, a_spawns);
	namespace_2c949ef8::do_ambush(v_loc, undefined, 512, 2048, undefined, undefined, undefined, undefined, 512);
	function_701ee731(v_loc);
	instance.var_a9ef21d playloopsound(#"hash_2e77024e1f0a29f1");
	/#
		iprintlnbold("");
	#/
	level flag::set(#"hash_2a08b38a93336dbf");
	trigger sethintstring(#"hash_1114a7cc4d89285c");
	trigger.b_activated = undefined;
}

/*
	Name: function_c8fba110
	Namespace: namespace_af1ba366
	Checksum: 0x2C9A2BE1
	Offset: 0x2638
	Size: 0x376
	Parameters: 1
	Flags: Private
*/
function private function_c8fba110(eventstruct)
{
	player = eventstruct.activator;
	if(!isplayer(player) || is_true(self.b_activated))
	{
		return;
	}
	self triggerenable(0);
	self.b_activated = 1;
	player function_bc82f900("zm_interact_rumble");
	foreach(player in getplayers())
	{
		player thread namespace_4abf1500::collect_intel(#"hash_5b87019ce0ec391c", undefined, undefined, 1);
	}
	self.instance.var_a9ef21d stoploopsound();
	self.instance.var_a9ef21d playsound(#"hash_ea30fff000de600");
	self.instance.var_a9ef21d thread scene::play(#"hash_1b79053f7d2b9dd1", self.instance.var_a9ef21d);
	level flag::set(#"hash_414ba7eb6d94978d");
	self.instance.var_a9ef21d zm_vo::function_d6f8bbd9(#"hash_68609aac048f6529");
	self.instance.var_a9ef21d zm_vo::function_d6f8bbd9(#"hash_686099ac048f6376");
	self.instance.var_a9ef21d zm_vo::function_d6f8bbd9(#"hash_686098ac048f61c3");
	self.instance.var_a9ef21d zm_vo::function_d6f8bbd9(#"hash_686097ac048f6010");
	self.instance.var_a9ef21d zm_vo::function_d6f8bbd9(#"hash_68609eac048f6bf5");
	level flag::set(#"hash_16f61b20c3d2c610");
	self.instance.var_a9ef21d playsound(#"hash_19cebf2f0254187a");
	self.instance.var_a9ef21d scene::stop(#"hash_1b79053f7d2b9dd1");
	self triggerenable(1);
	self.b_activated = 0;
}

/*
	Name: function_701ee731
	Namespace: namespace_af1ba366
	Checksum: 0x3010B60C
	Offset: 0x29B8
	Size: 0x174
	Parameters: 3
	Flags: Private
*/
function private function_701ee731(v_loc, var_751350bb, n_timeout)
{
	if(!isdefined(var_751350bb))
	{
		var_751350bb = 800;
	}
	if(!isdefined(n_timeout))
	{
		n_timeout = 120;
	}
	n_timeout = gettime() + (int(n_timeout * 1000));
	while(gettime() < n_timeout)
	{
		a_ai = arraysortclosest(getaiteamarray(#"axis"), v_loc, undefined, undefined, var_751350bb);
		foreach(ai in a_ai)
		{
			if(ai.current_state.name === #"wander")
			{
				arrayremovevalue(a_ai, ai);
			}
		}
		if(!a_ai.size)
		{
			break;
		}
		wait(0.25);
	}
}

/*
	Name: function_45b4534b
	Namespace: namespace_af1ba366
	Checksum: 0xA30F7253
	Offset: 0x2B38
	Size: 0x318
	Parameters: 0
	Flags: Private
*/
function private function_45b4534b()
{
	level flag::wait_till(#"hash_7e250b62cf326bf9");
	wait(2.5);
	if(level flag::get(#"hash_16f61b20c3d2c610"))
	{
		return;
	}
	n_line = function_21a3a673(1, 3);
	level zm_vo::function_7622cb70(#"hash_6bc4e8966adf89c6" + n_line);
	n_line = function_21a3a673(1, 3);
	level zm_vo::function_7622cb70(#"hash_c0ed255bb2e332b" + n_line, 1);
	foreach(player in getplayers())
	{
		level.var_31028c5d prototype_hud::function_953da284(player, #"hash_63a0d1633ac6a8c9");
		level.var_31028c5d prototype_hud::function_817e4d10(player, 2);
	}
	level flag::wait_till(#"hash_11e8bad986624085");
	wait(3);
	foreach(player in getplayers())
	{
		level.var_31028c5d prototype_hud::function_953da284(player, #"hash_763264a084691d1b");
	}
	level flag::wait_till(#"hash_2a08b38a93336dbf");
	foreach(player in getplayers())
	{
		level.var_31028c5d prototype_hud::function_953da284(player, #"hash_7c54d598bc324520");
	}
}

/*
	Name: function_830b8b01
	Namespace: namespace_af1ba366
	Checksum: 0x9914FF5C
	Offset: 0x2E58
	Size: 0xD4
	Parameters: 1
	Flags: None
*/
function function_830b8b01(instance)
{
	if(!level flag::get(#"hash_6d89e1456f61e5ab"))
	{
		return;
	}
	level thread function_f5f14ffe(instance);
	level flag::wait_till(#"hash_414ba7eb6d94978d");
	level thread function_a5864a0e();
	level thread function_99e393f3(instance);
	level thread function_e7a0cf81(instance);
	level flag::wait_till(#"hash_4b060b9820d4141d");
}

/*
	Name: function_f5f14ffe
	Namespace: namespace_af1ba366
	Checksum: 0x167C82A9
	Offset: 0x2F38
	Size: 0x2F6
	Parameters: 1
	Flags: Private
*/
function private function_f5f14ffe(instance)
{
	level flag::wait_till("moving_chest_enabled");
	if(isdefined(level.var_2c678640.zbarrier.var_e55c8b4e))
	{
		zm_utility::function_bc5a54a8(level.var_2c678640.zbarrier.var_e55c8b4e);
		level.var_2c678640.zbarrier.var_e55c8b4e = undefined;
	}
	if(isdefined(level.var_2c678640.trigger))
	{
		level.var_2c678640.trigger delete();
	}
	if(isdefined(level.var_2c678640.zbarrier))
	{
		level.var_2c678640.zbarrier delete();
	}
	namespace_8b6a9d79::spawn_script_model(level.var_2c678640, #"hash_7fb5646204aceaf6");
	level flag::wait_till(#"hash_414ba7eb6d94978d");
	level.var_2c678640.angles = level.var_2c678640.angles + vectorscale((0, 1, 0), 90);
	playfx(#"hash_5ee919420dab816a", level.var_2c678640.origin + vectorscale((0, 0, 1), 10), anglestoforward(level.var_2c678640.angles), anglestoup(level.var_2c678640.angles));
	wait(0.2);
	instance.var_af44ab5f = namespace_8b6a9d79::spawn_script_model(level.var_2c678640, #"hash_7f311e8d38b7d936");
	instance.var_af44ab5f notsolid();
	trigger = namespace_8b6a9d79::function_214737c7(level.var_2c678640, &function_4cb97b84, #"hash_2829798affdda59e", undefined, 96);
	trigger.instance = instance;
	/#
		while(true)
		{
			sphere(level.var_2c678640.origin - vectorscale((0, 0, 1), 24), 16, (1, 1, 0));
			waitframe(1);
		}
	#/
}

/*
	Name: function_4cb97b84
	Namespace: namespace_af1ba366
	Checksum: 0x91860B2A
	Offset: 0x3238
	Size: 0x84C
	Parameters: 1
	Flags: Private
*/
function private function_4cb97b84(eventstruct)
{
	player = eventstruct.activator;
	var_af44ab5f = self.instance.var_af44ab5f;
	if(!isdefined(var_af44ab5f) || !isplayer(player) || is_true(player.laststand))
	{
		return;
	}
	if(!is_true(self.b_activated))
	{
		self.b_activated = 1;
		self triggerenable(0);
		playfxontag(#"hash_2620f801cec5ff00", var_af44ab5f, "j_spine4");
		player function_bc82f900("zm_interact_rumble");
		var_af44ab5f playsound(#"hash_1cb2156b9c85b526");
		var_af44ab5f playloopsound(#"hash_16c9b69ca21b8cb9");
		scene::add_scene_func(#"hash_5bd18563535d0e37", &function_ea2f5d05, "dance");
		var_af44ab5f thread scene::play(#"hash_5bd18563535d0e37", var_af44ab5f);
		namespace_2c949ef8::do_ambush(self.origin, undefined, 500, 1500);
		function_701ee731(self.origin);
		var_af44ab5f playsound(#"hash_1f204d7a336581e8");
		var_af44ab5f.var_41dec230 moveto(level.var_2c678640.origin + vectorscale((0, 0, 1), 8), 1.5);
		var_af44ab5f.var_41dec230 waittill(#"movedone");
		var_af44ab5f.var_41dec230 delete();
		playfxontag(#"hash_2620f801cec5ff00", var_af44ab5f, "j_spine4");
		callback::function_10a4dd0a(&function_f37669b6);
		var_cc1fb2d0 = namespace_58949729::function_fd5e77fa(#"gold");
		var_69fc8214 = 15;
		dropstruct = {#hash_738dfc81:var_69fc8214, #angles:level.var_2c678640.angles, #origin:level.var_2c678640.origin + vectorscale((0, 0, 1), 24)};
		dropstruct thread namespace_65181344::function_fd87c780(var_cc1fb2d0, var_69fc8214, 4);
		dropstruct thread namespace_65181344::function_fd87c780(#"hash_4db4013e3c90a1db", 1, 4);
		/#
			iprintlnbold("");
		#/
		self triggerenable(1);
		self.b_available = 1;
		level callback::on_laststand(&function_72caec31);
		level callback::on_disconnect(&function_6004e022);
	}
	else if(is_true(self.b_available))
	{
		self.b_available = 0;
		player function_bc82f900("zm_interact_rumble");
		scene::remove_scene_func(#"hash_5bd18563535d0e37", &function_ea2f5d05, "dance");
		var_af44ab5f stoploopsound();
		var_af44ab5f playsound(#"hash_298c8c0c83309783");
		var_af44ab5f scene::stop(#"hash_5bd18563535d0e37");
		var_af44ab5f.trigger = self;
		foreach(e_player in getplayers())
		{
			if(e_player != player)
			{
				self setinvisibletoplayer(e_player);
			}
		}
		self usetriggerrequirelookat(0);
		self sethintstring(#"hash_63195b50ebd87df5");
		self enablelinkto();
		self linkto(var_af44ab5f, "tag_origin");
		tagname = "tag_stowed_back";
		if(!player haspart(tagname))
		{
			tagname = undefined;
		}
		var_af44ab5f linkto(player, tagname, (18, -5, 2), (0, 245, 90));
		playfxontag(#"hash_2620f801cec5ff00", var_af44ab5f, "j_spine4");
		if(!level flag::get(#"hash_32f5b780908d3c59"))
		{
			level flag::set(#"hash_32f5b780908d3c59");
			if(level flag::get(#"hash_b1eeb838255a28b"))
			{
				level thread zm_vo::function_7622cb70(#"hash_40ca0d2a94efaf1b", 0.5);
			}
			else
			{
				level thread zm_vo::function_7622cb70(#"hash_721f8a35d308dba0", 0.5);
			}
		}
		player.var_67aa3392 = var_af44ab5f;
		if(!isdefined(player.var_67aa3392))
		{
			return;
		}
		player flag::set(#"hash_35735a804a34da04");
		player clientfield::set_to_player("" + #"hash_5ef33fc92614c211", 1);
		player thread objective_retrieval::function_4be8796(self.instance);
		player thread objective_retrieval::function_d52adbbc(self.instance);
		player thread function_c132c1b1();
	}
}

/*
	Name: function_f37669b6
	Namespace: namespace_af1ba366
	Checksum: 0xBD7CE477
	Offset: 0x3A90
	Size: 0xCC
	Parameters: 1
	Flags: None
*/
function function_f37669b6(eventstruct)
{
	item = eventstruct.item;
	if(isplayer(self) && item.var_a6762160.name === #"hash_267a32b67d5bb3cd")
	{
		array::thread_all(getplayers(), &namespace_4abf1500::collect_intel, #"hash_526d0121cbd13a5f");
		callback::remove_callback(#"hash_56d1805bfff3e65b", &function_f37669b6);
	}
}

/*
	Name: function_ea2f5d05
	Namespace: namespace_af1ba366
	Checksum: 0x35C08E70
	Offset: 0x3B68
	Size: 0xF4
	Parameters: 1
	Flags: None
*/
function function_ea2f5d05(a_ents)
{
	ent = a_ents[#"hash_2b6cdfe2b147d77f"];
	var_41dec230 = util::spawn_model("tag_origin", ent.origin, ent.angles);
	ent linkto(var_41dec230);
	ent.var_41dec230 = var_41dec230;
	var_41dec230 moveto(ent.origin + vectorscale((0, 0, 1), 75), 2);
	var_41dec230 waittill(#"movedone");
	wait(0.5);
	var_41dec230 bobbing((0, 0, 1), 15, 4);
}

/*
	Name: function_c132c1b1
	Namespace: namespace_af1ba366
	Checksum: 0x1AC0B263
	Offset: 0x3C68
	Size: 0x106
	Parameters: 0
	Flags: Private
*/
function private function_c132c1b1()
{
	self endon(#"death", #"disconnect", #"player_downed", #"hash_3c90e32bc140ebf3");
	level endon(#"hash_1d1fe20ab0d24d9e");
	while(self flag::get(#"hash_35735a804a34da04"))
	{
		var_53044e8e = self gamepadusedlast();
		if(!var_53044e8e && self buttonbitstate("BUTTON_BIT_ANY_DOWN") || (var_53044e8e && self actionslottwobuttonpressed()))
		{
			self thread function_63422d64();
		}
		waitframe(1);
	}
}

/*
	Name: function_72caec31
	Namespace: namespace_af1ba366
	Checksum: 0x25423E6E
	Offset: 0x3D78
	Size: 0x2C
	Parameters: 1
	Flags: Private
*/
function private function_72caec31(eventstruct)
{
	if(isdefined(self.var_67aa3392))
	{
		self function_63422d64();
	}
}

/*
	Name: function_6004e022
	Namespace: namespace_af1ba366
	Checksum: 0x1E2BE57B
	Offset: 0x3DB0
	Size: 0x6C
	Parameters: 1
	Flags: Private
*/
function private function_6004e022(eventstruct)
{
	if(isdefined(self.var_67aa3392))
	{
		self function_63422d64();
		if(level.zm_hint_text zm_hint_text::is_open(self))
		{
			level.zm_hint_text zm_hint_text::close(self);
		}
	}
}

/*
	Name: function_63422d64
	Namespace: namespace_af1ba366
	Checksum: 0x5AEF8A52
	Offset: 0x3E28
	Size: 0x366
	Parameters: 0
	Flags: Private
*/
function private function_63422d64()
{
	self flag::clear(#"hash_35735a804a34da04");
	self notify(#"hash_6d2d12b8afe43c8e");
	self clientfield::set_to_player("" + #"hash_5ef33fc92614c211", 0);
	self thread objective_retrieval::function_1a58f438();
	self function_bc82f900("zm_interact_rumble");
	if(isdefined(self.var_67aa3392))
	{
		self.var_67aa3392 unlink();
		self.var_67aa3392.angles = (0, self.angles[1], 0);
		self.var_67aa3392.origin = self.origin + vectorscale((0, 0, 1), 4);
		self.var_67aa3392 thread scene::play(#"hash_5bd18563535d0e37", self.var_67aa3392);
		playfxontag(#"hash_2620f801cec5ff00", self.var_67aa3392, "j_spine4");
		self.var_67aa3392 playsound(#"hash_5c0841de58dda162");
		self.var_67aa3392 playloopsound(#"hash_16c9b69ca21b8cb9");
		self.var_67aa3392.trigger unlink();
		self.var_67aa3392.trigger.origin = self.var_67aa3392.origin + vectorscale((0, 0, 1), 32);
		self.var_67aa3392.trigger triggerenable(1);
		self.var_67aa3392.trigger.b_available = 1;
		self.var_67aa3392.trigger sethintstring(#"hash_2829798affdda59e");
		foreach(e_player in getplayers())
		{
			self.var_67aa3392.trigger setvisibletoplayer(e_player);
		}
		self.var_67aa3392.trigger usetriggerrequirelookat(0);
		/#
			level thread function_6fcaf33e(self.var_67aa3392);
		#/
		self.var_67aa3392 = undefined;
	}
}

/*
	Name: function_6fcaf33e
	Namespace: namespace_af1ba366
	Checksum: 0xED224004
	Offset: 0x4198
	Size: 0xAE
	Parameters: 1
	Flags: Private
*/
function private function_6fcaf33e(var_af44ab5f)
{
	/#
		self notify("");
		self endon("");
		while(isdefined(var_af44ab5f.trigger))
		{
			var_2b4ca868 = var_af44ab5f gettagorigin("");
			debugstar(var_2b4ca868);
			debugstar(var_af44ab5f.trigger.origin, 10, (0, 1, 0));
			waitframe(10);
		}
	#/
}

/*
	Name: function_99e393f3
	Namespace: namespace_af1ba366
	Checksum: 0x36A9BC5D
	Offset: 0x4250
	Size: 0xAD0
	Parameters: 1
	Flags: Private
*/
function private function_99e393f3(instance)
{
	s_orb = array::random((isdefined(instance.var_fe2612fe[#"orb_spawn"]) ? instance.var_fe2612fe[#"orb_spawn"] : []));
	var_b7eee573 = namespace_8b6a9d79::spawn_script_model(s_orb, #"hash_53079af25eecf35b");
	var_b7eee573 setscale(0.5);
	var_b7eee573 playsound(#"hash_55b5e35f7d261fee");
	var_b7eee573 playloopsound(#"hash_5dc7884f02e73776");
	var_b7eee573 val::set(#"hash_3aa2d77611cb6b8b", "takedamage", 1);
	var_b7eee573 val::set(#"hash_3aa2d77611cb6b8b", "allowdeath", 0);
	instance.var_b7eee573 = var_b7eee573;
	if(isdefined(level.var_c39a4b8f))
	{
		level.var_c39a4b8f.var_b7eee573 = var_b7eee573;
	}
	var_b7eee573 endon(#"death");
	var_b7eee573 fx::play(#"hash_54e06747246909e3", var_b7eee573.origin + vectorscale((0, 0, 1), 22), var_b7eee573.angles, #"hash_544ad67b059004d3", 1);
	level callback::add_callback(#"hash_137b937fd26992be", &function_a9d3bd70);
	util::wait_network_frame();
	var_b7eee573 ghost();
	var_63ef2885 = undefined;
	var_6ba3d26a = [];
	while(!level flag::get(#"hash_4b060b9820d4141d"))
	{
		s_result = undefined;
		s_result = var_b7eee573 waittill(#"damage", #"hash_5261a9b309eef309");
		if(level flag::get_all(array(#"hash_1d1fe20ab0d24d9e", #"hash_24be0dad9e05661a")))
		{
			return;
		}
		if(s_result._notify === "damage")
		{
			if(!isplayer(s_result.attacker) || s_result.mod === "MOD_CRUSH")
			{
				continue;
			}
			if(!level flag::get(#"hash_52ea7bbdad9d23f6"))
			{
				level flag::set(#"hash_52ea7bbdad9d23f6");
				level thread function_142f7eb7();
			}
			if(!isdefined(var_6ba3d26a))
			{
				var_6ba3d26a = [];
			}
			else if(!isarray(var_6ba3d26a))
			{
				var_6ba3d26a = array(var_6ba3d26a);
			}
			if(!isinarray(var_6ba3d26a, s_result.attacker.angles))
			{
				var_6ba3d26a[var_6ba3d26a.size] = s_result.attacker.angles;
			}
			var_b7eee573 thread function_7d88cc57();
			var_b7eee573 playsound(#"hash_641d6edcbf8111c1");
			if(!isdefined(var_63ef2885))
			{
				var_63ef2885 = gettime();
				var_b7eee573 util::delay_notify(float(2000) / 1000, #"hash_5261a9b309eef309");
			}
		}
		else
		{
			var_b7eee573 notify(#"hash_4588a3de47c44f6f");
			var_b7eee573.var_b8477436 = 0;
			var_63ef2885 = undefined;
			var_d297efab = (0, 0, 0);
			foreach(v_direction in var_6ba3d26a)
			{
				var_d297efab = var_d297efab + v_direction;
			}
			var_657dc854 = var_d297efab / max(var_6ba3d26a.size, 1);
			var_657dc854 = (0, absangleclamp360(var_657dc854[1]), 0);
			var_853a6020 = 0;
			var_5848577a = arraycopy((isdefined(instance.var_fe2612fe[#"hash_1d34895d7e866b6f"]) ? instance.var_fe2612fe[#"hash_1d34895d7e866b6f"] : []));
			var_d22c2d89 = arraycopy(var_5848577a);
			while(var_5848577a.size)
			{
				v_dest = var_b7eee573.origin + (anglestoforward(var_657dc854) * (1500 + var_853a6020));
				var_9f3b9a91 = arraygetclosest(v_dest, var_5848577a);
				if(!isdefined(var_9f3b9a91))
				{
					arrayremovevalue(var_5848577a, undefined);
					continue;
				}
				if(var_9f3b9a91.origin === var_b7eee573.var_8d1c63ac)
				{
					arrayremovevalue(var_d22c2d89, var_9f3b9a91);
					arrayremovevalue(var_5848577a, var_9f3b9a91);
					continue;
				}
				var_af6fb377 = vectortoangles(var_9f3b9a91.origin - var_b7eee573.origin);
				n_angle_diff = math::angle_dif(int(absangleclamp360(var_af6fb377[1])), int(var_657dc854[1]));
				if(abs(n_angle_diff) > 45)
				{
					if(var_853a6020 > 2500)
					{
						arrayremovevalue(var_5848577a, var_9f3b9a91);
						var_853a6020 = 0;
						if(var_5848577a.size == 0)
						{
							var_63ef2885 = undefined;
							var_9f3b9a91 = arraygetclosest(v_dest, var_d22c2d89);
							if(isdefined(var_9f3b9a91))
							{
								var_b7eee573.var_8d1c63ac = var_9f3b9a91.origin;
							}
							else
							{
								var_b7eee573.var_8d1c63ac = var_b7eee573.origin;
							}
						}
					}
					else
					{
						var_853a6020 = var_853a6020 + 500;
					}
				}
				else
				{
					var_b7eee573.var_8d1c63ac = var_9f3b9a91.origin;
					break;
				}
			}
			var_6ba3d26a = [];
			n_dist = distance(var_b7eee573.origin, var_b7eee573.var_8d1c63ac);
			n_move_time = n_dist / 400;
			var_b7eee573 fx::play(#"hash_10e51613cc775f48", var_b7eee573.origin + vectorscale((0, 0, 1), 22), var_b7eee573.angles, #"hash_4708ec2a663db459", 1);
			var_b7eee573 playsound(#"hash_3d8d2041fe8f5bbf");
			var_b7eee573 playloopsound(#"hash_5455d7addafa1122");
			level flag::clear(#"hash_24be0dad9e05661a");
			var_b7eee573 moveto(var_b7eee573.var_8d1c63ac, max(1, n_move_time));
			var_b7eee573 waittill(#"movedone");
			var_b7eee573 notify(#"hash_4708ec2a663db459");
			var_b7eee573 playsound(#"hash_2d17bb0a3d5bdb37");
			var_b7eee573 playloopsound(#"hash_5dc7884f02e73776");
			if(var_9f3b9a91.script_noteworthy === #"hash_5872000773b81e")
			{
				level flag::set(#"hash_24be0dad9e05661a");
				if(level flag::get(#"hash_1d1fe20ab0d24d9e"))
				{
					return;
				}
				if(!level flag::get(#"hash_b1eeb838255a28b"))
				{
					level flag::set(#"hash_b1eeb838255a28b");
					level thread function_74b6fb1(var_9f3b9a91);
				}
			}
		}
	}
}

/*
	Name: function_a9d3bd70
	Namespace: namespace_af1ba366
	Checksum: 0x3BDBFA96
	Offset: 0x4D28
	Size: 0xAC
	Parameters: 1
	Flags: Private
*/
function private function_a9d3bd70(eventstruct)
{
	if(isdefined(level.var_c39a4b8f.var_b7eee573))
	{
		level.var_c39a4b8f.var_b7eee573 fx::play(#"hash_54e06747246909e3", level.var_c39a4b8f.var_b7eee573.origin + vectorscale((0, 0, 1), 22), level.var_c39a4b8f.var_b7eee573.angles, #"hash_544ad67b059004d3", 1);
	}
}

/*
	Name: function_142f7eb7
	Namespace: namespace_af1ba366
	Checksum: 0x9B7AB1A
	Offset: 0x4DE0
	Size: 0x6C
	Parameters: 0
	Flags: Private
*/
function private function_142f7eb7()
{
	level zm_vo::function_7622cb70(#"hash_2034c2f79f570e13");
	n_line = function_21a3a673(1, 3);
	level zm_vo::function_7622cb70(#"hash_4e388c5febd5565" + n_line);
}

/*
	Name: function_74b6fb1
	Namespace: namespace_af1ba366
	Checksum: 0x16A9A64D
	Offset: 0x4E58
	Size: 0x144
	Parameters: 1
	Flags: Private
*/
function private function_74b6fb1(var_1c4dd56d)
{
	level endon(#"hash_1d1fe20ab0d24d9e");
	trigger = spawn("trigger_radius", var_1c4dd56d.origin + (vectorscale((0, 0, -1), 150)), 256, 800, 128);
	trigger.target = var_1c4dd56d.targetname;
	trigger waittill(#"trigger_look");
	trigger deletedelay();
	n_line = function_21a3a673(1, 3);
	level zm_vo::function_7622cb70(#"hash_605e192095314641" + n_line);
	n_line = function_21a3a673(1, 3);
	level zm_vo::function_7622cb70(#"hash_72ef359bb13a200" + n_line);
}

/*
	Name: function_7d88cc57
	Namespace: namespace_af1ba366
	Checksum: 0xC8163B1B
	Offset: 0x4FA8
	Size: 0x128
	Parameters: 0
	Flags: Private
*/
function private function_7d88cc57()
{
	self endon(#"death", #"hash_4588a3de47c44f6f");
	if(is_true(self.var_b8477436))
	{
		return;
	}
	self.var_b8477436 = 1;
	while(true)
	{
		self bobbing((randomfloatrange(-0.5, 0.5), randomfloatrange(-0.5, 0.5), randomfloatrange(-0.5, 0.5)), 15, 0.2);
		wait(randomfloatrange(0.2, 0.2 * 4));
	}
}

/*
	Name: function_e7a0cf81
	Namespace: namespace_af1ba366
	Checksum: 0x90E1E9CD
	Offset: 0x50D8
	Size: 0x21C
	Parameters: 1
	Flags: Private
*/
function private function_e7a0cf81(instance)
{
	level flag::wait_till(#"hash_32f5b780908d3c59");
	var_7a312ce5 = spawnstruct();
	var_7a312ce5.origin = level.var_c39a4b8f gettagorigin("tag_cage_attach");
	var_7a312ce5.angles = level.var_c39a4b8f gettagangles("tag_cage_attach");
	trigger = namespace_8b6a9d79::function_214737c7(var_7a312ce5, &function_6f51b8ea, #"hash_2b816e700692aa46");
	trigger.instance = instance;
	trigger usetriggerrequirelookat(0);
	while(isdefined(trigger) && !level flag::get(#"hash_1d1fe20ab0d24d9e"))
	{
		foreach(player in function_a1ef346b())
		{
			if(player flag::get(#"hash_35735a804a34da04") && player istouching(trigger))
			{
				trigger setvisibletoplayer(player);
				continue;
			}
			trigger setinvisibletoplayer(player);
		}
		wait(0.25);
	}
}

/*
	Name: function_6f51b8ea
	Namespace: namespace_af1ba366
	Checksum: 0x8E26422D
	Offset: 0x5300
	Size: 0x40C
	Parameters: 1
	Flags: Private
*/
function private function_6f51b8ea(eventstruct)
{
	player = eventstruct.activator;
	if(!isplayer(player) || !player flag::get(#"hash_35735a804a34da04"))
	{
		return;
	}
	self triggerenable(0);
	level flag::set(#"hash_1d1fe20ab0d24d9e");
	player flag::clear(#"hash_35735a804a34da04");
	player notify(#"hash_6d2d12b8afe43c8e");
	if(!level flag::get(#"hash_24be0dad9e05661a"))
	{
		level thread zm_vo::function_7622cb70(#"hash_14097c38f792fcfc", 0.5);
	}
	player clientfield::set_to_player("" + #"hash_5ef33fc92614c211", 0);
	player thread objective_retrieval::function_1a58f438();
	player function_bc82f900("zm_interact_rumble");
	self.instance notify(#"hash_69090774fec4a17b");
	level thread function_eb56183c();
	wait(1);
	playfx(#"hash_5ee919420dab816a", level.var_c39a4b8f gettagorigin("tag_cage_attach") + vectorscale((0, 0, 1), 8));
	wait(0.2);
	self.instance.var_af44ab5f unlink();
	self.instance.var_af44ab5f linkto(level.var_c39a4b8f, "tag_cage_attach", (0, 0, 0), vectorscale((0, 1, 0), 180));
	playfxontag(#"hash_2620f801cec5ff00", self.instance.var_af44ab5f, "j_spine4");
	self.instance.var_af44ab5f thread scene::play(#"hash_5bd18563535d0e37", self.instance.var_af44ab5f);
	self.instance.var_af44ab5f playsound(#"hash_1f204d7a336581e8");
	self.instance.var_af44ab5f playloopsound(#"hash_16c9b69ca21b8cb9");
	level callback::function_53888e7f(&function_72caec31);
	level callback::remove_on_disconnect(&function_6004e022);
	level thread function_7ae1d982(self.instance);
	if(isdefined(self.instance.var_af44ab5f.trigger))
	{
		self.instance.var_af44ab5f.trigger delete();
	}
	self deletedelay();
}

/*
	Name: function_eb56183c
	Namespace: namespace_af1ba366
	Checksum: 0x6A5D58B8
	Offset: 0x5718
	Size: 0x84
	Parameters: 0
	Flags: None
*/
function function_eb56183c()
{
	level.var_c39a4b8f clientfield::increment("" + #"hash_7d17014634879c10");
	wait(getanimlength("p9_fxanim_sv_payload_atv_cage_open_anim"));
	wait(getanimlength("p9_fxanim_sv_payload_atv_cage_close_anim"));
	level flag::set(#"hash_1fae4b16fa196a8b");
}

/*
	Name: function_7ae1d982
	Namespace: namespace_af1ba366
	Checksum: 0x419D5F4
	Offset: 0x57A8
	Size: 0x364
	Parameters: 1
	Flags: Private
*/
function private function_7ae1d982(instance)
{
	if(level flag::get(#"hash_4b060b9820d4141d"))
	{
		return;
	}
	level flag::wait_till_all(array(#"hash_1d1fe20ab0d24d9e", #"hash_24be0dad9e05661a", #"hash_1fae4b16fa196a8b"));
	var_b7eee573 = instance.var_b7eee573;
	do
	{
		wait(1);
		a_players = function_a1ef346b(#"any", var_b7eee573.origin, 512);
	}
	while(!a_players.size);
	wait(1);
	v_offset = vectorscale((0, 0, -1), 5);
	str_tag = "tag_cage_attach";
	var_ec6068b9 = level.var_c39a4b8f gettagorigin(str_tag);
	var_b7eee573 playsound(#"hash_3d8d2041fe8f5bbf");
	var_b7eee573 stoploopsound();
	var_b7eee573 moveto(var_ec6068b9 + v_offset, 1.25, 1);
	var_b7eee573 waittill(#"movedone");
	var_b7eee573 notify(#"hash_544ad67b059004d3");
	var_b7eee573 notify(#"hash_4708ec2a663db459");
	level callback::remove_callback(#"hash_137b937fd26992be", &function_a9d3bd70);
	var_b7eee573 playsound(#"hash_517c244152f5bff5");
	var_b7eee573 fx::play(#"hash_1b9b90f45278a5ae", var_b7eee573.origin + vectorscale((0, 0, 1), 22), var_b7eee573.angles);
	var_b7eee573 linkto(level.var_c39a4b8f, str_tag, v_offset, (0, 0, 0));
	var_b7eee573 fx::play(#"hash_c36745220550934", var_b7eee573.origin + vectorscale((0, 0, 1), 22), var_b7eee573.angles, "death", 1);
	var_b7eee573 playloopsound(#"hash_20abf82a386d4b4e");
	level.var_c39a4b8f.var_b7eee573 = var_b7eee573;
	if(isdefined(instance.var_af44ab5f))
	{
		instance.var_af44ab5f delete();
	}
	level flag::set(#"hash_4b060b9820d4141d");
}

/*
	Name: function_a5864a0e
	Namespace: namespace_af1ba366
	Checksum: 0x313E10E9
	Offset: 0x5B18
	Size: 0x198
	Parameters: 0
	Flags: Private
*/
function private function_a5864a0e()
{
	level flag::wait_till(#"all_players_spawned");
	level flag::wait_till(#"hash_16f61b20c3d2c610");
	wait(0.5);
	n_line = function_21a3a673(1, 3);
	level zm_vo::function_7622cb70(#"hash_48360d46842bebbf" + n_line);
	n_line = function_21a3a673(1, 3);
	level zm_vo::function_7622cb70(#"hash_7cd88ca0fdf56d94" + n_line, 1);
	foreach(player in getplayers())
	{
		level.var_31028c5d prototype_hud::function_953da284(player, #"hash_526ed5994d2a7d1a");
		level.var_31028c5d prototype_hud::function_817e4d10(player, 2);
	}
}

/*
	Name: function_9ad91439
	Namespace: namespace_af1ba366
	Checksum: 0x5E0B1D6B
	Offset: 0x5CB8
	Size: 0x348
	Parameters: 1
	Flags: None
*/
function function_9ad91439(instance)
{
	if(level flag::get(#"hash_1558183088c6ccff"))
	{
		return;
	}
	instance.starttrigger triggerenable(0);
	objective_setinvisibletoall(instance.var_e55c8b4e);
	var_1c4dd56d = instance.var_fe2612fe[#"hash_79eb1dad68ac34ff"][0];
	level.var_c39a4b8f = spawnvehicle(#"hash_d069dee6a0076c8", var_1c4dd56d.origin, var_1c4dd56d.angles, "vehicle_phase_rover", 0, undefined, "sensor");
	level thread function_b62b94e6(var_1c4dd56d);
	var_b8c8ab67 = instance.var_fe2612fe[#"hash_2af8aec02162621a"][0];
	instance.var_fb224b3b = namespace_8b6a9d79::spawn_script_model(var_b8c8ab67, #"p9_zm_ndu_reel_to_reel_audio_recorder_01");
	waitframe(1);
	level.var_c39a4b8f thread namespace_e69881c5::function_4f8b33df(instance);
	level flag::wait_till(#"gameplay_started");
	showmiscmodels("mq4_choppercrash");
	level flag::wait_till(#"hash_4b060b9820d4141d");
	function_8693ce36(instance);
	foreach(player in getplayers())
	{
		player.var_41c16555 = 1;
	}
	objective_setposition(instance.var_e55c8b4e, instance.var_fb224b3b.origin);
	objective_setvisibletoall(instance.var_e55c8b4e);
	foreach(player in getplayers())
	{
		level.var_31028c5d prototype_hud::function_953da284(player, #"hash_58ab7cac7a43cf66");
		level.var_31028c5d prototype_hud::function_817e4d10(player, 2);
	}
}

/*
	Name: function_b62b94e6
	Namespace: namespace_af1ba366
	Checksum: 0x7210EFC2
	Offset: 0x6008
	Size: 0x114
	Parameters: 1
	Flags: Private
*/
function private function_b62b94e6(var_1c4dd56d)
{
	level endon(#"hash_24be0dad9e05661a");
	level flag::wait_till(#"hash_16f61b20c3d2c610");
	trigger = spawn("trigger_radius", var_1c4dd56d.origin, 256, 1024, 128);
	trigger.target = var_1c4dd56d.targetname;
	trigger waittill(#"trigger_look");
	trigger deletedelay();
	n_line = function_21a3a673(1, 3);
	level zm_vo::function_7622cb70(#"hash_6576e0ab783af1f3" + n_line);
}

/*
	Name: function_8693ce36
	Namespace: namespace_af1ba366
	Checksum: 0xF072A46
	Offset: 0x6128
	Size: 0x122
	Parameters: 1
	Flags: Private
*/
function private function_8693ce36(instance)
{
	var_9f3b9a91 = instance.var_fe2612fe[#"hash_492bf57238a8ab72"][0];
	instance.var_fb224b3b notsolid();
	n_wait = instance.var_fb224b3b zm_utility::fake_physicslaunch(var_9f3b9a91.origin, 99);
	wait(n_wait);
	instance.var_fb224b3b.origin = var_9f3b9a91.origin;
	instance.var_fb224b3b playloopsound(#"hash_2e77024e1f0a29f1");
	trigger = namespace_8b6a9d79::function_214737c7(var_9f3b9a91, &function_1554ed60, #"hash_1114a7cc4d89285c", undefined, undefined, undefined, undefined, vectorscale((0, 0, 1), 32));
	trigger.instance = instance;
}

/*
	Name: function_1554ed60
	Namespace: namespace_af1ba366
	Checksum: 0xBC404CA5
	Offset: 0x6258
	Size: 0x4AC
	Parameters: 1
	Flags: Private
*/
function private function_1554ed60(eventstruct)
{
	if(is_true(self.b_activated))
	{
		return;
	}
	self.b_activated = 1;
	self triggerenable(0);
	if(!level flag::get(#"hash_68879aa426e6559a"))
	{
		objective_setinvisibletoall(self.instance.var_e55c8b4e);
	}
	self.instance.var_fb224b3b stoploopsound();
	self.instance.var_fb224b3b playsound(#"hash_ea30fff000de600");
	self.instance.var_fb224b3b thread scene::play(#"hash_1b79053f7d2b9dd1", self.instance.var_fb224b3b);
	foreach(player in getplayers())
	{
		player thread namespace_4abf1500::collect_intel(#"hash_5b87029ce0ec3acf", undefined, undefined, 1);
	}
	/#
		iprintlnbold("");
	#/
	self.instance.var_fb224b3b zm_vo::function_d6f8bbd9(#"hash_622e25d4968b2342");
	self.instance.var_fb224b3b zm_vo::function_d6f8bbd9(#"hash_622e26d4968b24f5");
	self.instance.var_fb224b3b zm_vo::function_d6f8bbd9(#"hash_622e23d4968b1fdc");
	foreach(player in getplayers())
	{
		level.var_31028c5d prototype_hud::function_953da284(player, #"hash_46781b2af8770f3f");
		level.var_31028c5d prototype_hud::function_817e4d10(player, 2);
	}
	if(!level flag::get(#"hash_68879aa426e6559a"))
	{
		level flag::set(#"hash_68879aa426e6559a");
		var_8485244b = self.instance.var_fe2612fe[#"hash_3966465c498df3a6"][0];
		objective_setposition(self.instance.var_e55c8b4e, var_8485244b.origin);
		objective_setvisibletoall(self.instance.var_e55c8b4e);
		self.instance.starttrigger triggerenable(1);
	}
	self.instance.var_fb224b3b zm_vo::function_d6f8bbd9(#"hash_622e24d4968b218f");
	self.instance.var_fb224b3b playsound(#"hash_19cebf2f0254187a");
	self.instance.var_fb224b3b scene::stop(#"hash_1b79053f7d2b9dd1");
	self.b_activated = 0;
	self triggerenable(1);
}

/*
	Name: function_83ac5bc2
	Namespace: namespace_af1ba366
	Checksum: 0xF8EC4848
	Offset: 0x6710
	Size: 0x54
	Parameters: 2
	Flags: None
*/
function function_83ac5bc2(instance, activator)
{
	if(level flag::get(#"hash_1558183088c6ccff"))
	{
		return;
	}
	level.var_c39a4b8f namespace_e69881c5::function_540c0d15(activator);
}

