#using script_15022fca9ab99080;
#using script_1a26712868b71ff6;
#using script_1a82674d68f69c23;
#using script_1bb327fbdb3a211b;
#using script_1c65dbfc2f1c8d8f;
#using script_1cc417743d7c262d;
#using script_1d1a97b78f64bfd;
#using script_25be5471a9c31833;
#using script_2ddf7d76494fb52;
#using script_33d1cd7cfb7477c4;
#using script_3e25b5e703601101;
#using script_3f9e0dc8454d98e1;
#using script_467027ea7017462b;
#using script_4acbbbcdc7ef16a0;
#using script_4ccfb58a9443a60b;
#using script_4cd8239d2d41f43d;
#using script_4d000493c57bb851;
#using script_52c6c2d1a2ef1b46;
#using script_5660bae5b402a1eb;
#using script_58860a35d0555f74;
#using script_5a525a75a8f1f7e4;
#using script_5bb072c3abf4652c;
#using script_61fcfebb2f3a00e0;
#using script_676fc0767562bc02;
#using script_6c5b51f98cd04fa3;
#using script_6c8abe14025b47c4;
#using script_6fc2be37feeb317b;
#using script_76a8f964e4309959;
#using script_772d4fbcb229f593;
#using script_77b61a4178efdbc4;
#using script_7a5293d92c61c788;
#using script_7bacb32f8222fa3e;
#using script_7e59d7bba853fe4b;
#using script_7fc996fe8678852;
#using script_ab862743b3070a;
#using script_b9d273dc917ee1f;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\gestures.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\music_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\zm\zm_ai_raz.gsc;
#using scripts\zm_common\callbacks.gsc;
#using scripts\zm_common\gametypes\globallogic.gsc;
#using scripts\zm_common\zm_devgui.gsc;
#using scripts\zm_common\zm_equipment.gsc;
#using scripts\zm_common\zm_laststand.gsc;
#using scripts\zm_common\zm_player.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;

#namespace namespace_a8dddac2;

/*
	Name: function_26a28d0a
	Namespace: namespace_a8dddac2
	Checksum: 0xF297F3E0
	Offset: 0x15E0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_26a28d0a()
{
	level notify(401654437);
}

/*
	Name: init
	Namespace: namespace_a8dddac2
	Checksum: 0xA27D53A1
	Offset: 0x1600
	Size: 0xA04
	Parameters: 0
	Flags: None
*/
function init()
{
	level thread function_d7f67c90();
	clientfield::register("actor", "" + #"hash_4a5eb7837f9fd1ba", 1, 1, "counter");
	clientfield::register("actor", "" + #"hash_11839f68b17da97a", 1, 1, "counter");
	clientfield::register("actor", "" + #"hash_3b24d38fe21de8fd", 1, 1, "int");
	clientfield::register("actor", "" + #"hash_6f2c45f149dc1e5d", 1, 1, "counter");
	clientfield::register("missile", "" + #"hash_73b8798f1d815108", 1, 1, "int");
	clientfield::register("toplayer", "fogofwareffects", 1, 1, "int");
	clientfield::register("toplayer", "" + #"hash_1509a2aa5d40a44c", 1, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_55456562f670860", 1, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_7289d683073752c8", 1, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_5b48c7bf93fc3a4b", 1, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_54a76d632c7c51", 1, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_4b03e692ae3dfa64", 1, 1, "counter");
	clientfield::register("scriptmover", "" + #"hash_6ba3e6fd544c34a5", 1, 2, "int");
	clientfield::register("scriptmover", "" + #"hash_2ad0f9c6cbc5eed", 1, 1, "counter");
	clientfield::register("scriptmover", "" + #"hash_77d7a6f3a8842303", 1, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_4d2911e91cdb1e91", 1, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_1b9d966608efb40e", 1, 1, "counter");
	clientfield::register("scriptmover", "" + #"hash_1588c103924da726", 1, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_5e0a6fc6597e6e03", 1, 1, "counter");
	clientfield::register("scriptmover", "" + #"wall_smash", 1, 1, "counter");
	clientfield::register("vehicle", "" + #"hash_4145b0d4262e2782", 1, 1, "counter");
	clientfield::register("vehicle", "" + #"hash_485fe8f642043f78", 1, 1, "counter");
	clientfield::register("world", "" + #"hash_2509c24cd62ed5bc", 1, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_419ce223196785ef", 1, 1, "counter");
	clientfield::register("world", "" + #"hash_5940bc2717a75c96", 1, 1, "int");
	clientfield::register("world", "" + #"hash_7b50097ac4242bc9", 1, getminbitcountfornum(3), "int");
	level.var_9b6e1cc9 = namespace_6783631d::register();
	if(!zm_utility::function_e51dc2d8())
	{
		return;
	}
	function_e983f15a();
	level.var_3034d7b8 = &function_d5d67561;
	zm_utility::function_da0eb3e4(#"hash_4984ecebcaee2783", &function_90996ced);
	namespace_96b7f11d::function_994637d8(#"hash_4dd90ae5d15fe15c");
	namespace_96b7f11d::function_994637d8(#"hash_6868b1aab2d20ef4");
	scene::add_scene_func(#"hash_ef3c5bb86ea83fd", &function_a45c2bfd, "play");
	scene::add_scene_func(#"hash_ef3c5bb86ea83fd", &function_b15240c9, "done");
	scene::add_scene_func(#"hash_ef3c5bb86ea83fd", &function_644d04d5, "Shot 3");
	scene::add_scene_func(#"hash_ef3c5bb86ea83fd", &function_4b60049c, "Shot 10");
	scene::add_scene_func(#"hash_ef3c5bb86ea83fd", &function_49f3ccf, "Shot 13");
	scene::add_scene_func(#"hash_ef3c5bb86ea83fd", &function_1f2a6275, "Shot 14");
	scene::add_scene_func(#"hash_ef3c5bb86ea83fd", &function_938275a4, "Shot 15");
	scene::add_scene_func(#"hash_ef3c5bb86ea83fd", &function_b91176b1, "Shot 19");
	scene::add_scene_func(#"hash_ef3c5bb86ea83fd", &function_7a47935c, "Shot 23");
	scene::add_scene_func(#"hash_ef3c5bb86ea83fd", &function_c8622ee6, "Shot 31");
	scene::add_scene_func(#"hash_ef3c5bb86ea83fd", &function_9946b234, "skip_started");
	callback::on_spawned(&on_player_spawn);
	/#
		level thread function_cd7a3de4();
	#/
}

/*
	Name: function_e983f15a
	Namespace: namespace_a8dddac2
	Checksum: 0x24DB5EE4
	Offset: 0x2010
	Size: 0x364
	Parameters: 0
	Flags: None
*/
function function_e983f15a()
{
	level namespace_ee206246::register(#"hash_6deef93cdc13faf2", #"hash_2cec5bd1113224f4", #"hash_342e10211feb6e85", &function_5a2421aa, &function_8a15118a);
	level namespace_ee206246::register(#"hash_6deef93cdc13faf2", #"hash_31e51b6600a81c68", #"hash_342e0d211feb696c", &function_8b524e54, &function_601878a7);
	level namespace_ee206246::register(#"hash_6deef93cdc13faf2", #"hash_434b5ee7bea53369", #"hash_342e0e211feb6b1f", &function_b4e3ff4a, &function_28be9289);
	level namespace_ee206246::register(#"hash_6deef93cdc13faf2", #"hash_31740aafc81f583a", #"hash_342e0b211feb6606", &function_dd0ca999, &function_73076ac9);
	level namespace_ee206246::register(#"hash_6deef93cdc13faf2", #"escort", #"hash_342e0c211feb67b9", &function_faee663e, &function_e0567b44);
	level namespace_ee206246::register(#"hash_6deef93cdc13faf2", #"end_fight", #"hash_342e09211feb62a0", &namespace_95c839d1::function_79868b3b, &namespace_95c839d1::function_ec198408);
	level namespace_ee206246::register(#"hash_6deef93cdc13faf2", #"outro", #"hash_342e0a211feb6453", &function_197d500b, &outro_cleanup);
	level namespace_ee206246::register(#"hash_6deef93cdc13faf2", #"hash_54cd06dc58e5770d", #"hash_342e17211feb7a6a", &function_756178a, &function_3cccb124, 1);
	callback::function_10a4dd0a(&function_10a4dd0a);
	callback::on_disconnect(&on_player_disconnect);
	level thread function_e9c07a3d();
}

/*
	Name: function_d5d67561
	Namespace: namespace_a8dddac2
	Checksum: 0x528239DA
	Offset: 0x2380
	Size: 0x38
	Parameters: 0
	Flags: None
*/
function function_d5d67561()
{
	level notify(#"end_game", {#reason:#"hash_4b00aa230ebbe82b"});
}

/*
	Name: on_player_spawn
	Namespace: namespace_a8dddac2
	Checksum: 0xEDF9C3BB
	Offset: 0x23C0
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function on_player_spawn()
{
	self callback::function_20263b9e(&function_20263b9e);
}

/*
	Name: function_e9c07a3d
	Namespace: namespace_a8dddac2
	Checksum: 0x61E12CFA
	Offset: 0x23F0
	Size: 0xBC
	Parameters: 0
	Flags: None
*/
function function_e9c07a3d()
{
	level namespace_ee206246::start(#"hash_6deef93cdc13faf2");
	level flag::wait_till(#"hash_264e763f3fa44810");
	level thread function_be48e187();
	level thread function_34f41b72();
	level thread function_72dc9adc();
	level thread function_a048c235();
	showmiscmodels("ts_dark_aether_grass");
}

/*
	Name: function_d7f67c90
	Namespace: namespace_a8dddac2
	Checksum: 0x23ECD59
	Offset: 0x24B8
	Size: 0x58C
	Parameters: 0
	Flags: None
*/
function function_d7f67c90()
{
	level.var_2961befd = 0;
	level.var_e9eb81d7 = 0;
	level.var_8c011b28 = 0;
	level.var_6d18ddab = 0;
	level.var_daabc5cb = 0;
	level.var_864319a5 = 0;
	level.var_c59392fa = 0;
	level.var_1f7f9ebe = 0;
	level.var_d0c221e2 = array(#"hash_12ac9ac03d59aa62", #"hash_12ac9bc03d59ac15", #"hash_12ac98c03d59a6fc", #"hash_12ac99c03d59a8af", #"hash_12ac96c03d59a396");
	level.var_793ade71 = array(0, 1, 2);
	hidemiscmodels("rcxd_shelf_after");
	hidemiscmodels("rcxd_cabinet_on");
	namespace_1fd59e39::function_1376ec37(undefined, undefined, "vol_aether_shroud_exclusion");
	var_936c52b5 = getent("clip_player_barrier", "targetname");
	var_936c52b5 setinvisibletoall();
	var_c89beff = getent("clip_tunnel_end", "targetname");
	var_c89beff setinvisibletoall();
	var_cc61b071 = struct::get("door_town_square");
	level.var_c79d163e = util::spawn_model(#"hash_33df2ba078538a8c", var_cc61b071.origin, var_cc61b071.angles);
	var_57b44c1c = struct::get(#"hash_1c10f2ed01e2d5a");
	level.var_5850fb1d = util::spawn_model(var_57b44c1c.model, var_57b44c1c.origin, var_57b44c1c.angles);
	var_7dd14c74 = getent("clip_device_table", "targetname");
	var_7dd14c74 disconnectpaths();
	level.var_3ec2f5f5 = getent("zombie_abom_spawner", "script_noteworthy");
	var_45bf69aa = struct::get("vent_arc_xd");
	level.var_2133d509 = util::spawn_model(var_45bf69aa.model, var_45bf69aa.origin, var_45bf69aa.angles);
	level.var_1e477e6c = getweapon("eq_crystal_grenade");
	var_aaa9a919 = getent("main_street_clip", "targetname");
	var_aaa9a919 disconnectpaths();
	var_77da32e1 = getent("main_street_debris_clip", "targetname");
	var_77da32e1 disconnectpaths();
	level thread function_9547f28c();
	level thread function_71926382();
	level thread function_799fb043();
	level thread function_cf0bd6b9();
	level thread function_c8cd422c();
	level thread function_4907b660();
	level flag::wait_till("all_players_spawned");
	foreach(var_4b912983 in level.var_4fe2f84d)
	{
		var_4b912983[0] thread function_209aa0e3();
		if(var_4b912983[0].craftfoundry.name === "ztable_tungsten_neutralizer_device")
		{
			var_4b912983[0].usetime = 5000;
		}
	}
	level.var_c79d163e disconnectpaths();
	exploder::exploder("fxexp_sky_portal");
}

/*
	Name: function_209aa0e3
	Namespace: namespace_a8dddac2
	Checksum: 0x3F232292
	Offset: 0x2A50
	Size: 0x120
	Parameters: 0
	Flags: None
*/
function function_209aa0e3()
{
	self endon(#"death");
	while(true)
	{
		b_looking = 0;
		foreach(player in function_a1ef346b(undefined, self.origin, 80))
		{
			if(player util::is_player_looking_at(self.origin, 0.8))
			{
				b_looking = 1;
			}
		}
		if(is_true(b_looking))
		{
			self.locked = 0;
		}
		else
		{
			self.locked = 1;
		}
		wait(0.1);
	}
}

/*
	Name: function_799fb043
	Namespace: namespace_a8dddac2
	Checksum: 0xCF375139
	Offset: 0x2B78
	Size: 0x39C
	Parameters: 0
	Flags: None
*/
function function_799fb043()
{
	level endon(#"end_game");
	level.var_60a2b62c = function_f3e164a9(#"hash_5839d424446cf8ea");
	level.var_3f41835d = [];
	level.var_55f82e4e = [];
	level clientfield::set("" + #"hash_5940bc2717a75c96", 1);
	foreach(var_aa3984f0 in level.var_60a2b62c)
	{
		function_e2a06860(var_aa3984f0, 2);
		if(var_aa3984f0.targetname === #"hash_44bc86e237774e32")
		{
			if(!isdefined(level.var_3f41835d))
			{
				level.var_3f41835d = [];
			}
			else if(!isarray(level.var_3f41835d))
			{
				level.var_3f41835d = array(level.var_3f41835d);
			}
			level.var_3f41835d[level.var_3f41835d.size] = var_aa3984f0;
			continue;
		}
		if(!isdefined(level.var_55f82e4e))
		{
			level.var_55f82e4e = [];
		}
		else if(!isarray(level.var_55f82e4e))
		{
			level.var_55f82e4e = array(level.var_55f82e4e);
		}
		level.var_55f82e4e[level.var_55f82e4e.size] = var_aa3984f0;
	}
	level flag::wait_till(#"hash_264e763f3fa44810");
	level clientfield::set("" + #"hash_5940bc2717a75c96", 0);
	foreach(var_98871874 in level.var_3f41835d)
	{
		function_e2a06860(var_98871874, 0);
		var_98871874.ondamaged = &namespace_8a08914c::function_b49b76d4;
	}
	callback::function_189f87c1(&function_85a47e02);
	level flag::wait_till("main_street_tunnel_open");
	callback::remove_callback(#"hash_193ded5c8932fe29", &function_85a47e02);
}

/*
	Name: function_85a47e02
	Namespace: namespace_a8dddac2
	Checksum: 0x158AC3F8
	Offset: 0x2F20
	Size: 0x204
	Parameters: 0
	Flags: None
*/
function function_85a47e02()
{
	level endon(#"end_game");
	var_fa8f4fcc = [];
	foreach(var_aa3984f0 in level.var_60a2b62c)
	{
		if(function_ffdbe8c2(var_aa3984f0) !== 0)
		{
			if(!isdefined(var_fa8f4fcc))
			{
				var_fa8f4fcc = [];
			}
			else if(!isarray(var_fa8f4fcc))
			{
				var_fa8f4fcc = array(var_fa8f4fcc);
			}
			var_fa8f4fcc[var_fa8f4fcc.size] = var_aa3984f0;
		}
	}
	if(level.var_60a2b62c.size - var_fa8f4fcc.size < 10)
	{
		var_72e812fd = min(4, 10 - (level.var_60a2b62c.size - var_fa8f4fcc.size));
	}
	else
	{
		return;
	}
	var_4945de3b = 0;
	while(var_4945de3b < var_72e812fd)
	{
		var_1950bf84 = array::random(var_fa8f4fcc);
		if(var_1950bf84 function_85e19b28())
		{
			function_e2a06860(var_1950bf84, 0);
			var_1950bf84.ondamaged = &namespace_8a08914c::function_b49b76d4;
			arrayremovevalue(var_fa8f4fcc, var_1950bf84);
			var_4945de3b = var_4945de3b + 1;
		}
		wait(1);
	}
}

/*
	Name: function_85e19b28
	Namespace: namespace_a8dddac2
	Checksum: 0x9116D4E3
	Offset: 0x3130
	Size: 0xA2
	Parameters: 0
	Flags: None
*/
function function_85e19b28()
{
	foreach(player in getplayers())
	{
		if(player util::is_player_looking_at(self.origin))
		{
			return false;
		}
	}
	return true;
}

/*
	Name: function_10a4dd0a
	Namespace: namespace_a8dddac2
	Checksum: 0x2EB599D0
	Offset: 0x31E0
	Size: 0x69A
	Parameters: 1
	Flags: None
*/
function function_10a4dd0a(params)
{
	if(isdefined(params.item) && isdefined(params.item.var_a6762160))
	{
		name = params.item.var_a6762160.name;
	}
	if(is_true(self.var_c8f9547a) && is_true(params.item.var_627c698b.istacticalgrenade))
	{
		self.var_c8f9547a = undefined;
	}
	if(!isdefined(name) || !isplayer(self))
	{
		return;
	}
	switch(name)
	{
		case "hash_a114ca1007a05f0":
		{
			level flag::set(#"hash_77e125d6f8b2733e");
			level namespace_6747c550::function_7df6bb60(#"hash_4273532945cef4b0", 1);
			self thread namespace_9771a88f::function_d137d6a0(#"hash_612bd80e051ec8b2", #"hash_3795ddc1396dd6c", #"hash_270a520d4067d784");
			array::thread_all(function_a1ef346b(), &namespace_4abf1500::collect_intel, #"hash_48b4ab2df294b7e");
			break;
		}
		case "hash_7909eaa52e9eab4b":
		{
			level flag::set(#"hash_52d565520308890c");
			level namespace_6747c550::function_7df6bb60(#"hash_4273562945cef9c9", 1);
			self thread namespace_9771a88f::function_d137d6a0(#"hash_405d8e05784a9b7d", #"hash_2a781c57e3f9e24d", #"hash_27914478638171d1");
			array::thread_all(function_a1ef346b(), &namespace_4abf1500::collect_intel, #"hash_48b4cb2df294ee4");
			break;
		}
		case "hash_56b1b48511774f82":
		{
			level flag::set(#"hash_407e12c104cfde25");
			level namespace_6747c550::function_7df6bb60(#"hash_4273552945cef816", 1);
			self thread namespace_9771a88f::function_d137d6a0(#"hash_7a7170008c98841e", #"hash_69ad92374dc5d980", #"hash_426838694427e178");
			array::thread_all(function_a1ef346b(), &namespace_4abf1500::collect_intel, #"hash_48b4db2df295097");
			break;
		}
		case "hash_4984ecebcaee2783":
		{
			level flag::set(#"hash_22a51e8b22086fc6" + params.item.n_id);
			if(!isdefined(level.var_566d0d14))
			{
				level.var_566d0d14 = 1;
			}
			level.var_566d0d14++;
			level namespace_6747c550::function_7df6bb60(#"hash_4273532945cef4b0", level.var_566d0d14);
			level thread function_b6f5ae25();
			level thread function_e408d81(params.item.n_id);
			foreach(player in getplayers())
			{
				player zm_weapons::weapon_take(level.var_1e477e6c);
				player.var_c8f9547a = undefined;
			}
			break;
		}
		case "hash_5a24c496d257b674":
		{
			self.n_id = params.item.n_id;
			self.var_c8f9547a = 1;
			self thread namespace_1cc7b406::function_ff9ddbfa(#"hash_7c7d437280e992b", 1);
			self playsound(#"hash_3a2f974f67a11864");
			if(!level.var_daabc5cb)
			{
				level.var_daabc5cb = 1;
				level thread namespace_9771a88f::function_d137d6a0(#"hash_6cf88156e2cece4a", #"hash_2179d2c05c59fcd4", #"hash_5ee09ee0c21e867c");
			}
			break;
		}
		case "hash_2b899cf380ab5725":
		{
			self.var_a74ce90c = 1;
			self clientfield::set_to_player("" + #"hash_1509a2aa5d40a44c", 1);
			self thread function_e655e275();
			playsoundatposition(#"hash_16e8cfb644f6ca0e", self.origin);
			self function_bc82f900("damage_heavy");
			break;
		}
	}
}

/*
	Name: function_5a2421aa
	Namespace: namespace_a8dddac2
	Checksum: 0xF2C7AAC2
	Offset: 0x3888
	Size: 0xBC
	Parameters: 1
	Flags: None
*/
function function_5a2421aa(b_skipped)
{
	if(b_skipped)
	{
		return;
	}
	s_interact = struct::get("start_mq_button");
	level flag::wait_till(#"hash_3814c5c6793e2b2d");
	level thread function_ab0ea13b();
	s_interact zm_unitrigger::create(&function_bb065751, 64, &function_79936423);
	level flag::wait_till(#"hash_57b9473a38039ff0");
}

/*
	Name: function_9547f28c
	Namespace: namespace_a8dddac2
	Checksum: 0x938C0BDE
	Offset: 0x3950
	Size: 0xF4
	Parameters: 0
	Flags: None
*/
function function_9547f28c()
{
	s_button = struct::get("start_mq_button");
	s_button.var_c9b734f5 = util::spawn_model(#"hash_7c81868a02c10968", s_button.origin, s_button.angles);
	s_button.var_c36e3eb9 = util::spawn_model(#"hash_51b155104fbf49b4", s_button.origin, s_button.angles);
	s_button.var_c9b734f5 setscale(s_button.modelscale);
	s_button.var_c36e3eb9 setscale(s_button.modelscale);
	s_button.var_c9b734f5 hide();
}

/*
	Name: function_ab0ea13b
	Namespace: namespace_a8dddac2
	Checksum: 0xDA0CE062
	Offset: 0x3A50
	Size: 0x226
	Parameters: 0
	Flags: None
*/
function function_ab0ea13b()
{
	level endon(#"hash_57b9473a38039ff0");
	b_on = undefined;
	s_button = struct::get("start_mq_button");
	if(!isdefined(s_button.var_c36e3eb9) || !isdefined(s_button.var_c9b734f5))
	{
		if(isdefined(s_button.var_c36e3eb9))
		{
			s_button.var_c36e3eb9 delete();
		}
		if(isdefined(s_button.var_c9b734f5))
		{
			s_button.var_c9b734f5 delete();
		}
		function_9547f28c();
	}
	while(true)
	{
		if(!is_true(namespace_96b7f11d::function_835bb4a7()) && !is_true(b_on))
		{
			b_on = 1;
			s_button.var_c9b734f5 show();
			s_button.var_c36e3eb9 util::delay(0.5, "death", &hide);
		}
		else if(is_true(namespace_96b7f11d::function_835bb4a7()) && is_true(b_on))
		{
			b_on = 0;
			s_button.var_c36e3eb9 show();
			s_button.var_c9b734f5 util::delay(0.5, "death", &hide);
		}
		wait(1);
	}
}

/*
	Name: function_bb065751
	Namespace: namespace_a8dddac2
	Checksum: 0x4C2DB51A
	Offset: 0x3C80
	Size: 0x140
	Parameters: 1
	Flags: None
*/
function function_bb065751(player)
{
	if(isplayer(player))
	{
		if(!level flag::get(#"hash_1a68e69eb576f35b") && !is_true(namespace_96b7f11d::function_835bb4a7()) && !player isfiring() && !player isreloading() && player getstance() === "stand")
		{
			n_dot = player math::get_dot_forward(self.origin);
			if(n_dot > 0.5)
			{
				self sethintstringforplayer(player, "");
				return true;
			}
		}
		self sethintstringforplayer(player, "");
		return false;
	}
}

/*
	Name: function_79936423
	Namespace: namespace_a8dddac2
	Checksum: 0x80C5CE58
	Offset: 0x3DC8
	Size: 0x210
	Parameters: 0
	Flags: None
*/
function function_79936423()
{
	level endon(#"end_game", #"death");
	s_interact = struct::get("start_mq_button");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"trigger");
		activator = waitresult.activator;
		if(isplayer(activator))
		{
			level flag::set(#"hash_1a68e69eb576f35b");
			level flag::set(#"hash_4dd90ae5d15fe15c");
			if(activator gestures::function_8cc27b6d(#"hash_606686a1b66827ac"))
			{
				activator namespace_96b7f11d::function_2a73b31d();
				activator setorigin((6762, 4366, 567));
				activator setplayerangles((13, -97, 0));
				activator playgestureviewmodel(#"hash_606686a1b66827ac");
				wait(0.5);
				activator namespace_96b7f11d::function_202a6698();
			}
			activator playrumbleonentity("damage_light");
			playsoundatposition(#"hash_707c10126e3ac999", s_interact.origin);
			level flag::set(#"hash_57b9473a38039ff0");
		}
	}
}

/*
	Name: function_8a15118a
	Namespace: namespace_a8dddac2
	Checksum: 0xF67C5D93
	Offset: 0x3FE0
	Size: 0x17C
	Parameters: 2
	Flags: None
*/
function function_8a15118a(b_skipped, var_19e802fa)
{
	s_interact = struct::get("start_mq_button");
	if(var_19e802fa)
	{
		level flag::set(#"hash_57b9473a38039ff0");
	}
	s_interact thread zm_unitrigger::unregister_unitrigger(s_interact.s_unitrigger);
	if(isdefined(s_interact.var_c36e3eb9))
	{
		s_interact.var_c36e3eb9 show();
	}
	s_interact.var_c9b734f5 thread util::delayed_delete(0.5);
	if(!var_19e802fa && !level flag::get(#"hash_264e763f3fa44810"))
	{
		function_2f0a2ce2();
	}
	level thread function_5841db33();
	level flag::set(#"hash_264e763f3fa44810");
	level flag::set(#"hash_331ca6d639f4883d");
	level flag::clear(#"hash_4dd90ae5d15fe15c");
}

/*
	Name: function_5841db33
	Namespace: namespace_a8dddac2
	Checksum: 0x985069A8
	Offset: 0x4168
	Size: 0xDC
	Parameters: 0
	Flags: None
*/
function function_5841db33()
{
	level endon(#"end_game");
	wait(1);
	exploder::exploder("fxexp_dark_aether_interior_01");
	exploder::exploder("fxexp_dark_aether_interior_02");
	exploder::exploder("fxexp_dark_aether_interior_03");
	level clientfield::set("" + #"hash_4ed008087614d190", 1);
	level clientfield::set("" + #"hash_7fd166b952515da7", 1);
}

/*
	Name: function_2f0a2ce2
	Namespace: namespace_a8dddac2
	Checksum: 0x3349FBB0
	Offset: 0x4250
	Size: 0x858
	Parameters: 0
	Flags: None
*/
function function_2f0a2ce2()
{
	wait(1);
	level clientfield::set("" + #"hash_2509c24cd62ed5bc", 1);
	playsoundatposition(#"hash_7b74007ca246bbef", (0, 0, 0));
	level zm_utility::function_9ad5aeb1(1, 1, 0, 0);
	level.no_powerups = 1;
	level flag::clear("spawn_zombies");
	level flag::clear("zombie_drop_powerups");
	level flag::clear(#"hash_21921ed511559aa3");
	level flag::set(#"pause_round_timeout");
	level flag::set("hold_round_end");
	level thread namespace_96b7f11d::function_aa863ff1();
	foreach(player in getplayers())
	{
		player function_9409ac93();
	}
	exploder::exploder("fxexp_cin_mid_portal");
	foreach(player in getplayers())
	{
		player thread function_5414ee31();
	}
	level function_abb25db(1, (0, 0, 0));
	var_aeb8a47d = util::spawn_model(#"hash_b7cea188cbd2e02", vectorscale((0, 0, -1), 2048));
	var_aeb8a47d clientfield::set("" + #"hash_2fc89133ccd7b0df", 1);
	var_a8605c24 = var_aeb8a47d gettagorigin("j_head");
	var_9ee772b4 = var_aeb8a47d gettagangles("j_head");
	level.var_5092bb0e = util::spawn_model(#"tag_origin", var_a8605c24, var_9ee772b4);
	level.var_5092bb0e linkto(var_aeb8a47d, "j_head");
	var_aeb8a47d thread util::delete_on_death(level.var_5092bb0e);
	level.var_cc996567 = util::spawn_model(#"hash_49275da2ee5d6c3f", var_a8605c24, var_9ee772b4);
	level.var_cc996567 clientfield::set("" + #"hash_2fc89133ccd7b0df", 1);
	level.var_cc996567 linkto(level.var_5092bb0e);
	level.var_5092bb0e thread util::delete_on_death(level.var_cc996567);
	foreach(str_tag in [3:"j_spinelower_tentacle_root", 2:"j_spineupper_tentacle_root", 1:"j_tentacle_root_ri", 0:"j_tentacle_root_le"])
	{
		var_aeb8a47d hidepart(str_tag, "", 1);
	}
	n_start_time = gettime();
	level thread scene::init(#"hash_ef3c5bb86ea83fd");
	level scene::init_streamer(#"hash_ef3c5bb86ea83fd", getplayers());
	foreach(player in getplayers())
	{
		player.var_f4e33249 = 1;
	}
	n_time_left = 1.5 - ((float(gettime() - n_start_time)) / 1000);
	if(n_time_left > 0)
	{
		wait(n_time_left);
	}
	level flag::set(#"hash_2f702f46336d6832");
	a_ents[#"hash_5e15688e554ce28e"] = var_aeb8a47d;
	level scene::play(#"hash_ef3c5bb86ea83fd", a_ents);
	level flag::clear(#"hash_2f702f46336d6832");
	level clientfield::set("" + #"hash_2509c24cd62ed5bc", 0);
	foreach(player in getplayers())
	{
		player.var_f4e33249 = undefined;
	}
	level.no_powerups = undefined;
	level flag::set("spawn_zombies");
	level flag::set("zombie_drop_powerups");
	level flag::set(#"hash_21921ed511559aa3");
	level flag::clear(#"pause_round_timeout");
	level flag::clear("hold_round_end");
	level notify(#"hash_264e763f3fa44810");
}

/*
	Name: function_9409ac93
	Namespace: namespace_a8dddac2
	Checksum: 0x5FF1E882
	Offset: 0x4AB0
	Size: 0x7A
	Parameters: 0
	Flags: None
*/
function function_9409ac93()
{
	level endon(#"end_game");
	if(!isalive(self))
	{
		return;
	}
	self endon(#"death");
	while(self function_e128a831() || self function_b4813488())
	{
		waitframe(1);
	}
}

/*
	Name: function_a45c2bfd
	Namespace: namespace_a8dddac2
	Checksum: 0x2C7C65C7
	Offset: 0x4B38
	Size: 0x17C
	Parameters: 1
	Flags: None
*/
function function_a45c2bfd(a_ents)
{
	level endon(#"hash_264e763f3fa44810");
	hidemiscmodels("hide_mid_igc_models");
	level clientfield::set("" + #"hash_763dd8035e80f7c", 1);
	level clientfield::set("" + #"hash_1fb207d10fbe27ce", 1);
	level thread namespace_c097de49::function_8f85d169();
	music::setmusicstate("mid_igc");
	level thread namespace_96b7f11d::function_aa863ff1();
	level function_542224cc(1, (0, 0, 0));
	level thread scene::play(#"hash_6252caedac411934", "Shot 1");
	level thread function_4980ef91();
	level function_abb25db(0.5, (0, 0, 0), "mid_scene_fade_out");
}

/*
	Name: function_4980ef91
	Namespace: namespace_a8dddac2
	Checksum: 0x8E063B89
	Offset: 0x4CC0
	Size: 0x5C
	Parameters: 0
	Flags: None
*/
function function_4980ef91()
{
	level endon(#"hash_264e763f3fa44810");
	level waittill(#"hash_2b2d0000f48f2997");
	level thread scene::play(#"hash_6252caedac411934", "Shot 2");
}

/*
	Name: function_644d04d5
	Namespace: namespace_a8dddac2
	Checksum: 0xECE88B72
	Offset: 0x4D28
	Size: 0xBC
	Parameters: 1
	Flags: None
*/
function function_644d04d5(a_ents)
{
	level endon(#"hash_264e763f3fa44810", #"game_ended");
	var_8edd2e3a = a_ents[#"hash_3caf9991a21775a8"];
	if(!isdefined(var_8edd2e3a))
	{
		return;
	}
	var_8edd2e3a endon(#"death");
	var_8edd2e3a waittill(#"hash_72b5962447d193c3");
	var_8edd2e3a clientfield::increment("" + #"hash_419ce223196785ef");
}

/*
	Name: function_4b60049c
	Namespace: namespace_a8dddac2
	Checksum: 0x96FB8B8E
	Offset: 0x4DF0
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function function_4b60049c(a_ents)
{
	level thread function_dfedba73();
}

/*
	Name: function_49f3ccf
	Namespace: namespace_a8dddac2
	Checksum: 0x27769D4E
	Offset: 0x4E20
	Size: 0x84
	Parameters: 1
	Flags: None
*/
function function_49f3ccf(a_ents)
{
	if(isdefined(level.var_5092bb0e) && isdefined(level.var_cc996567))
	{
		a_ents = [];
		a_ents[#"head"] = level.var_cc996567;
		level.var_5092bb0e thread scene::play(#"hash_569e51cff0700fb6", "Shot 13", a_ents);
	}
}

/*
	Name: function_1f2a6275
	Namespace: namespace_a8dddac2
	Checksum: 0x5C2EFA2
	Offset: 0x4EB0
	Size: 0x84
	Parameters: 1
	Flags: None
*/
function function_1f2a6275(a_ents)
{
	if(isdefined(level.var_5092bb0e) && isdefined(level.var_cc996567))
	{
		a_ents = [];
		a_ents[#"head"] = level.var_cc996567;
		level.var_5092bb0e thread scene::play(#"hash_569e51cff0700fb6", "Shot 14", a_ents);
	}
}

/*
	Name: function_938275a4
	Namespace: namespace_a8dddac2
	Checksum: 0xB4236882
	Offset: 0x4F40
	Size: 0x84
	Parameters: 1
	Flags: None
*/
function function_938275a4(a_ents)
{
	if(isdefined(level.var_5092bb0e) && isdefined(level.var_cc996567))
	{
		a_ents = [];
		a_ents[#"head"] = level.var_cc996567;
		level.var_5092bb0e thread scene::play(#"hash_569e51cff0700fb6", "Shot 15", a_ents);
	}
}

/*
	Name: function_b91176b1
	Namespace: namespace_a8dddac2
	Checksum: 0xC121AA1D
	Offset: 0x4FD0
	Size: 0x84
	Parameters: 1
	Flags: None
*/
function function_b91176b1(a_ents)
{
	if(isdefined(level.var_5092bb0e) && isdefined(level.var_cc996567))
	{
		a_ents = [];
		a_ents[#"head"] = level.var_cc996567;
		level.var_5092bb0e thread scene::play(#"hash_569e51cff0700fb6", "Shot 19", a_ents);
	}
}

/*
	Name: function_7a47935c
	Namespace: namespace_a8dddac2
	Checksum: 0x8A8A0AC
	Offset: 0x5060
	Size: 0x84
	Parameters: 1
	Flags: None
*/
function function_7a47935c(a_ents)
{
	if(isdefined(level.var_5092bb0e) && isdefined(level.var_cc996567))
	{
		a_ents = [];
		a_ents[#"head"] = level.var_cc996567;
		level.var_5092bb0e thread scene::play(#"hash_569e51cff0700fb6", "Shot 23", a_ents);
	}
}

/*
	Name: function_c8622ee6
	Namespace: namespace_a8dddac2
	Checksum: 0x42B477BD
	Offset: 0x50F0
	Size: 0x194
	Parameters: 1
	Flags: None
*/
function function_c8622ee6(a_ents)
{
	var_2644aca3 = a_ents[#"maxis"];
	if(!isdefined(var_2644aca3))
	{
		return;
	}
	var_2644aca3 endon(#"death");
	var_be17187b = undefined;
	var_be17187b = level waittill(#"hash_77507bf59c02d349", #"hash_264e763f3fa44810");
	if(var_be17187b._notify === #"hash_77507bf59c02d349")
	{
		var_2644aca3 clientfield::increment("" + #"hash_419ce223196785ef");
		var_be17187b = undefined;
		var_be17187b = level waittill(#"hash_1c8e98ba1adc7b0c", #"hash_264e763f3fa44810");
		if(var_be17187b._notify === #"hash_1c8e98ba1adc7b0c")
		{
			var_2644aca3 clientfield::set("" + #"hash_9ef13a567692f32", 1);
			level waittill(#"hash_264e763f3fa44810");
			var_2644aca3 clientfield::set("" + #"hash_9ef13a567692f32", 0);
		}
	}
}

/*
	Name: function_b15240c9
	Namespace: namespace_a8dddac2
	Checksum: 0x6D219613
	Offset: 0x5290
	Size: 0x104
	Parameters: 1
	Flags: None
*/
function function_b15240c9(a_ents)
{
	level clientfield::set("" + #"hash_763dd8035e80f7c", 0);
	level clientfield::set("" + #"hash_1fb207d10fbe27ce", 0);
	level thread namespace_c097de49::function_8f85d169(0);
	showmiscmodels("hide_mid_igc_models");
	teleport_players(struct::get_array("mq_observation_end_mid_igc"));
	wait(1);
	level function_542224cc(1, (0, 0, 0), undefined, 1);
	level thread namespace_96b7f11d::function_15a94953();
}

/*
	Name: function_9946b234
	Namespace: namespace_a8dddac2
	Checksum: 0x275E0658
	Offset: 0x53A0
	Size: 0x470
	Parameters: 1
	Flags: None
*/
function function_9946b234(a_ents)
{
	level flag::set(#"hash_49bef484db99f3ac");
	music::setmusicstate("");
	playsoundatposition(#"hash_69157f74228c372a", (0, 0, 0));
	level thread scene::play(#"hash_6252caedac411934", "Shot 3");
	level thread function_dfedba73();
	exploder::stop_exploder("fxexp_cin_exp_start");
	exploder::stop_exploder("lgtexp_cin_zm_amerika_mid_ENV");
	exploder::stop_exploder("lgtexp_cin_zm_amerika_mid_ENV_spot");
	exploder::stop_exploder("lgtexp_cin_zm_amerika_mid_sh010");
	exploder::stop_exploder("lgtexp_cin_zm_amerika_mid_sh020");
	exploder::stop_exploder("lgtexp_cin_zm_amerika_mid_sh030");
	exploder::stop_exploder("lgtexp_cin_zm_amerika_mid_sh040");
	exploder::stop_exploder("lgtexp_cin_zm_amerika_mid_sh050");
	exploder::stop_exploder("lgtexp_cin_zm_amerika_mid_sh060");
	exploder::stop_exploder("lgtexp_cin_zm_amerika_mid_sh080");
	exploder::stop_exploder("lgtexp_cin_zm_amerika_mid_sh090");
	exploder::stop_exploder("lgtexp_cin_zm_amerika_mid_sh100");
	exploder::stop_exploder("lgtexp_cin_zm_amerika_mid_sh110");
	exploder::stop_exploder("lgtexp_cin_zm_amerika_mid_sh120");
	exploder::stop_exploder("lgtexp_cin_zm_amerika_mid_sh130");
	exploder::stop_exploder("lgtexp_cin_zm_amerika_mid_sh140");
	exploder::stop_exploder("lgtexp_cin_zm_amerika_mid_sh150");
	exploder::stop_exploder("lgtexp_cin_zm_amerika_mid_sh160");
	exploder::stop_exploder("lgtexp_cin_zm_amerika_mid_sh170");
	exploder::stop_exploder("lgtexp_cin_zm_amerika_mid_sh180");
	exploder::stop_exploder("lgtexp_cin_zm_amerika_mid_sh190");
	exploder::stop_exploder("lgtexp_cin_zm_amerika_mid_sh200");
	exploder::stop_exploder("lgtexp_cin_zm_amerika_mid_sh230");
	exploder::stop_exploder("lgtexp_cin_zm_amerika_mid_sh250");
	exploder::stop_exploder("lgtexp_cin_zm_amerika_mid_sh270");
	exploder::stop_exploder("lgtexp_cin_zm_amerika_mid_sh280");
	exploder::stop_exploder("lgtexp_cin_zm_amerika_mid_sh310");
	exploder::stop_exploder("lgtexp_cin_zm_amerika_mid_sh320");
	exploder::stop_exploder("lgtexp_cin_zm_amerika_mid_sh330");
	exploder::stop_exploder("lgtexp_cin_zm_amerika_mid_sh340");
	level clientfield::set("" + #"hash_2f4e23884d9865e1", 1);
	foreach(ent in a_ents)
	{
		if(isactor(ent) && ent.archetype === #"zombie")
		{
			if(isdefined(ent))
			{
				ent delete();
			}
		}
	}
}

/*
	Name: function_dfedba73
	Namespace: namespace_a8dddac2
	Checksum: 0x142163A2
	Offset: 0x5818
	Size: 0xB8
	Parameters: 0
	Flags: None
*/
function function_dfedba73()
{
	var_b419812e = getentarray("observation_tower_window", "targetname");
	foreach(window in var_b419812e)
	{
		if(isdefined(window))
		{
			window delete();
		}
	}
}

/*
	Name: teleport_players
	Namespace: namespace_a8dddac2
	Checksum: 0xB6A47889
	Offset: 0x58D8
	Size: 0x94
	Parameters: 1
	Flags: None
*/
function teleport_players(var_a347ab1)
{
	a_players = getplayers();
	for(i = 0; i < a_players.size; i++)
	{
		a_players[i] setorigin(var_a347ab1[i].origin);
		a_players[i] setplayerangles(var_a347ab1[i].angles);
	}
}

/*
	Name: function_abb25db
	Namespace: namespace_a8dddac2
	Checksum: 0x1E5C1F68
	Offset: 0x5978
	Size: 0x178
	Parameters: 3
	Flags: None
*/
function function_abb25db(n_time, n_color, str_waittill)
{
	if(!isdefined(n_color))
	{
		n_color = (0, 0, 0);
	}
	if(isdefined(str_waittill))
	{
		level waittill(str_waittill);
	}
	foreach(player in getplayers())
	{
		player thread lui::screen_fade_out(n_time, n_color);
		player val::set(#"hash_6378ea83b88b4f36", "takedamage", 0);
		player val::set(#"hash_6378ea83b88b4f36", "freezecontrols", 1);
		player val::set(#"hash_6378ea83b88b4f36", "show_crosshair", 0);
		player val::set(#"hash_6378ea83b88b4f36", "show_weapon_hud", 0);
	}
}

/*
	Name: function_542224cc
	Namespace: namespace_a8dddac2
	Checksum: 0x2DFB40FC
	Offset: 0x5AF8
	Size: 0x190
	Parameters: 4
	Flags: None
*/
function function_542224cc(n_time, n_color, str_waittill, var_e9a0b654)
{
	if(!isdefined(n_color))
	{
		n_color = (0, 0, 0);
	}
	if(isdefined(str_waittill))
	{
		level waittill(str_waittill);
	}
	foreach(player in getplayers())
	{
		player thread lui::screen_fade_in(n_time, n_color);
		if(is_true(var_e9a0b654))
		{
			player val::reset(#"hash_6378ea83b88b4f36", "takedamage");
			player val::reset(#"hash_6378ea83b88b4f36", "freezecontrols");
			player val::reset(#"hash_6378ea83b88b4f36", "show_crosshair");
			player val::reset(#"hash_6378ea83b88b4f36", "show_weapon_hud");
		}
	}
}

/*
	Name: function_5414ee31
	Namespace: namespace_a8dddac2
	Checksum: 0x7087BBF9
	Offset: 0x5C90
	Size: 0x84
	Parameters: 0
	Flags: None
*/
function function_5414ee31()
{
	self endon(#"disconnect");
	self clientfield::set("" + #"hash_3198b85c253e79d4", 1);
	level waittill(#"hash_a256b33f8bbf053");
	self clientfield::set("" + #"hash_3198b85c253e79d4", 0);
}

/*
	Name: function_4907b660
	Namespace: namespace_a8dddac2
	Checksum: 0x6B9AB7C9
	Offset: 0x5D20
	Size: 0x94
	Parameters: 0
	Flags: None
*/
function function_4907b660()
{
	level endon(#"end_game");
	level flag::wait_till("all_players_spawned");
	level thread scene::play(#"hash_33cdf7de77335178");
	level flag::wait_till(#"hash_57b9473a38039ff0");
	level thread scene::stop(#"hash_33cdf7de77335178");
}

/*
	Name: function_8b524e54
	Namespace: namespace_a8dddac2
	Checksum: 0x4855DEFD
	Offset: 0x5DC0
	Size: 0x124
	Parameters: 1
	Flags: None
*/
function function_8b524e54(b_skipped)
{
	callback::on_ai_spawned(&function_72989645);
	if(b_skipped)
	{
		return;
	}
	level flag::wait_till(#"start_zombie_round_logic");
	level thread function_34cc6b36();
	level thread function_a5015671();
	level thread function_8687b0f2();
	level thread function_96558bd7();
	level thread function_551048b9();
	level thread function_3eb5183();
	level flag::wait_till(#"hash_21844688fcfdffe4");
	/#
		iprintlnbold("");
	#/
}

/*
	Name: function_601878a7
	Namespace: namespace_a8dddac2
	Checksum: 0x68D232E0
	Offset: 0x5EF0
	Size: 0xBC
	Parameters: 2
	Flags: None
*/
function function_601878a7(b_skipped, var_19e802fa)
{
	if(b_skipped || var_19e802fa)
	{
		level namespace_6747c550::function_7df6bb60(#"hash_4273532945cef4b0", 1);
		level namespace_6747c550::function_7df6bb60(#"hash_4273562945cef9c9", 1);
		level namespace_6747c550::function_7df6bb60(#"hash_4273552945cef816", 1);
	}
	level flag::set(#"hash_21844688fcfdffe4");
}

/*
	Name: function_34cc6b36
	Namespace: namespace_a8dddac2
	Checksum: 0x13763DF
	Offset: 0x5FB8
	Size: 0xFC
	Parameters: 0
	Flags: None
*/
function function_34cc6b36()
{
	level endon(#"end_game");
	wait(1);
	foreach(player in function_a1ef346b())
	{
		player thread zm_vo::function_c4303dda(#"hash_3155be8a4cf39bcc");
	}
	wait(4.5);
	zm_vo::function_7622cb70(#"hash_4ed5804954cf3aa3");
	level thread function_5bc0739d();
}

/*
	Name: function_5bc0739d
	Namespace: namespace_a8dddac2
	Checksum: 0x46BACF78
	Offset: 0x60C0
	Size: 0x408
	Parameters: 0
	Flags: None
*/
function function_5bc0739d()
{
	level endon(#"end_game");
	str_zone = zm_zonemgr::get_zone_from_position(getplayers()[0].origin, 1, 1);
	wait(zm_vo::function_f577c17d(#"hash_4ed5804954cf3aa3"));
	while(true)
	{
		n_players = 0;
		n_players = zm_zonemgr::get_players_in_zone(str_zone);
		if(n_players < function_a1ef346b().size)
		{
			break;
		}
		wait(1);
	}
	wait(2);
	zm_vo::function_7622cb70(#"hash_7749600442916b95");
	wait(0.5);
	namespace_9771a88f::function_d137d6a0(#"hash_2d431dbfce4812f8", #"hash_61d4d43a45c0fd3e", #"hash_4979ef4dc775218e");
	level waittill(#"end_of_round");
	wait(1.5);
	if(!level.var_e9eb81d7)
	{
		zm_vo::function_7622cb70(#"hash_36681ff44e6a689f");
	}
	level waittill(#"end_of_round");
	wait(1.5);
	namespace_9771a88f::function_d137d6a0(#"hash_1cca6aa02c5e495", #"hash_7adc4fe20aa33695", #"hash_25d1cc1f5d0097c9");
	level waittill(#"end_of_round");
	wait(1.5);
	foreach(player in function_a1ef346b())
	{
		player thread zm_vo::function_c4303dda(#"hash_51f1e565da361355");
	}
	wait(zm_vo::function_f577c17d(#"hash_51f1e565da361355"));
	foreach(player in function_a1ef346b())
	{
		player thread zm_vo::function_c4303dda(#"hash_51f1e465da3611a2");
	}
	wait(zm_vo::function_f577c17d(#"hash_51f1e465da3611a2"));
	foreach(player in function_a1ef346b())
	{
		player thread zm_vo::function_c4303dda(#"hash_51f1e365da360fef");
	}
}

/*
	Name: function_c8cd422c
	Namespace: namespace_a8dddac2
	Checksum: 0x49D55967
	Offset: 0x64D0
	Size: 0x6C
	Parameters: 0
	Flags: None
*/
function function_c8cd422c()
{
	while(!zm_zonemgr::any_player_in_zone("zone_bunker_entrance_02"))
	{
		wait(0.5);
	}
	namespace_9771a88f::function_d137d6a0(#"hash_da30bfca721ac8a", #"hash_2defe32056b22414", #"hash_3825c78d0f1fadbc");
}

/*
	Name: function_cf0bd6b9
	Namespace: namespace_a8dddac2
	Checksum: 0x65F691C5
	Offset: 0x6548
	Size: 0x4C
	Parameters: 0
	Flags: None
*/
function function_cf0bd6b9()
{
	level flag::wait_till(#"hash_3814c5c6793e2b2d");
	wait(0.5);
	namespace_9771a88f::function_752b5c36(#"hash_44621d435320a2a0", undefined);
}

/*
	Name: function_be48e187
	Namespace: namespace_a8dddac2
	Checksum: 0x21898297
	Offset: 0x65A0
	Size: 0x1C
	Parameters: 0
	Flags: None
*/
function function_be48e187()
{
	level thread function_d1ac9156();
}

/*
	Name: function_d1ac9156
	Namespace: namespace_a8dddac2
	Checksum: 0x80C21130
	Offset: 0x65C8
	Size: 0x144
	Parameters: 0
	Flags: None
*/
function function_d1ac9156()
{
	var_84405100 = getent("trigger_boardroom_abom", "targetname");
	var_507cd99f = struct::get("abom_boardroom");
	s_target = struct::get(var_507cd99f.target);
	while(true)
	{
		s_result = undefined;
		s_result = var_84405100 waittill(#"trigger");
		if(zm_utility::is_player_valid(s_result.activator))
		{
			break;
		}
	}
	var_b779b2a4 = zombie_utility::spawn_zombie(level.var_3ec2f5f5, "abom", var_507cd99f, level.round_number);
	wait(0.1);
	if(isdefined(var_b779b2a4))
	{
		var_b779b2a4.script_noteworthy = undefined;
		var_b779b2a4.ignore_enemy_count = 1;
	}
	level thread function_f309f0fc();
}

/*
	Name: function_f309f0fc
	Namespace: namespace_a8dddac2
	Checksum: 0xD6825C63
	Offset: 0x6718
	Size: 0x1BC
	Parameters: 0
	Flags: None
*/
function function_f309f0fc()
{
	var_8fac91c0 = getent("trigger_abom_smash", "targetname");
	var_ceed8935 = struct::get(#"hash_35ee4beaafb5eed");
	var_5f9f614d = util::spawn_model("tag_origin", var_ceed8935.origin, var_ceed8935.angles);
	while(true)
	{
		s_result = undefined;
		s_result = var_8fac91c0 waittill(#"trigger");
		if(s_result.activator.aitype === "spawner_bo5_abom" && s_result.activator.var_2bd7ca9d === 1)
		{
			level.var_4414302d show();
			var_5f9f614d clientfield::increment("" + #"wall_smash");
			playrumbleonposition("sr_prototype_generator_explosion", var_8fac91c0.origin);
			playsoundatposition(#"hash_8e873c6bea5355a", var_5f9f614d.origin + vectorscale((0, 0, 1), 25));
			level thread function_8fc5e1ba();
			break;
		}
	}
}

/*
	Name: function_8fc5e1ba
	Namespace: namespace_a8dddac2
	Checksum: 0xC723119C
	Offset: 0x68E0
	Size: 0xDE
	Parameters: 0
	Flags: None
*/
function function_8fc5e1ba()
{
	var_b7a28022 = struct::get(#"housing");
	var_b5a64394 = getent("satellite_mounted", "targetname");
	var_b5a64394 thread scene::play(#"hash_7e9240eaa405e0c4", var_b5a64394);
	var_b5a64394 hidepart("tag_satellite");
	var_eb23961b = function_3d102402(#"hash_7909eaa52e9eab4b", var_b7a28022.origin, var_b7a28022.angles, 1);
}

/*
	Name: function_a5015671
	Namespace: namespace_a8dddac2
	Checksum: 0x3887F565
	Offset: 0x69C8
	Size: 0x84
	Parameters: 0
	Flags: None
*/
function function_a5015671()
{
	var_2e34590c = struct::get(#"hash_f1ef3c7a863696b");
	level.var_4414302d = util::spawn_model(var_2e34590c.model, var_2e34590c.origin, var_2e34590c.angles);
	wait(0.1);
	level.var_4414302d hide();
}

/*
	Name: function_34f41b72
	Namespace: namespace_a8dddac2
	Checksum: 0x710608C8
	Offset: 0x6A58
	Size: 0x204
	Parameters: 0
	Flags: None
*/
function function_34f41b72()
{
	level.var_e866a143 = [];
	level.var_a13ca883 = [];
	level.var_af1bea51 = [];
	level.var_e2c2d62f = 0;
	for(i = 1; i < 5; i++)
	{
		level.var_e866a143[level.var_e866a143.size] = struct::get("interact_tank_" + i);
	}
	var_936c52b5 = getent("clip_player_barrier", "targetname");
	var_936c52b5 setinvisibletoall();
	var_4fd98c9e = getentarray("fuel_tank_liquid", "targetname");
	level flag::wait_till(#"start_zombie_round_logic");
	for(i = 0; i < 4; i++)
	{
		level.var_a13ca883[i] = level.var_e866a143[i] zm_unitrigger::create(&tank_interact, 64, &function_7468ef6);
		level.var_a13ca883[i].str_flag = #"hash_7ee10096a289d2c5" + i;
		level.var_af1bea51[i] = level.var_a13ca883[i].str_flag;
		level.var_a13ca883[i] thread function_431c0845();
	}
	level thread function_ffc8553d();
}

/*
	Name: function_ffc8553d
	Namespace: namespace_a8dddac2
	Checksum: 0x82E76222
	Offset: 0x6C68
	Size: 0x1C
	Parameters: 0
	Flags: None
*/
function function_ffc8553d()
{
	level thread function_5ef63d9e();
}

/*
	Name: tank_interact
	Namespace: namespace_a8dddac2
	Checksum: 0x50E45467
	Offset: 0x6C90
	Size: 0x168
	Parameters: 1
	Flags: None
*/
function tank_interact(player)
{
	if(!level flag::get(#"hash_65c0f8b6c42b8159") && level flag::get(#"hash_3683ce7803b13dea") && !level flag::get(self.stub.str_flag))
	{
		self sethintstring(#"hash_2c7e24d5963081d1");
		return true;
	}
	if(level flag::get(#"hash_65c0f8b6c42b8159"))
	{
		self sethintstring(#"hash_7079aaada5942259");
		return true;
	}
	if(level flag::get(self.stub.str_flag))
	{
		self sethintstring(#"hash_39ad0237628f67ef");
		return true;
	}
	self sethintstring(#"hash_3fabd443621990f3");
	return true;
}

/*
	Name: function_7468ef6
	Namespace: namespace_a8dddac2
	Checksum: 0xF60AEBD9
	Offset: 0x6E08
	Size: 0x10C
	Parameters: 0
	Flags: None
*/
function function_7468ef6()
{
	level endon(#"hash_1a8b97bb9490c50c");
	while(true)
	{
		var_be17187b = undefined;
		var_be17187b = self waittill(#"trigger");
		if(zm_utility::is_player_valid(var_be17187b.activator) && !level flag::get(#"hash_65c0f8b6c42b8159") && level flag::get(#"hash_3683ce7803b13dea"))
		{
			playsoundatposition(#"hash_60c84d2631929f68", self.origin);
			level flag::set(self.stub.str_flag);
			level.var_e2c2d62f++;
		}
	}
}

/*
	Name: function_431c0845
	Namespace: namespace_a8dddac2
	Checksum: 0x629C708C
	Offset: 0x6F20
	Size: 0x44
	Parameters: 0
	Flags: None
*/
function function_431c0845()
{
	level flag::wait_till(#"hash_1a8b97bb9490c50c");
	if(isdefined(self))
	{
		zm_unitrigger::unregister_unitrigger(self);
	}
}

/*
	Name: function_5ef63d9e
	Namespace: namespace_a8dddac2
	Checksum: 0x1A4FECC9
	Offset: 0x6F70
	Size: 0x1C0
	Parameters: 0
	Flags: None
*/
function function_5ef63d9e()
{
	level endon(#"hash_1a8b97bb9490c50c");
	level flag::set(#"hash_3683ce7803b13dea");
	while(true)
	{
		level flag::wait_till_any(level.var_af1bea51);
		wait(1);
		if(level.var_e2c2d62f === getplayers().size)
		{
			level thread function_dbec41cd();
			exploder::exploder("lgt_tank_turn_on");
		}
		foreach(var_bb0e29b7 in level.var_a13ca883)
		{
			level flag::clear(var_bb0e29b7.str_flag);
		}
		level.var_e2c2d62f = 0;
		level flag::clear(#"hash_3683ce7803b13dea");
		level waittill(#"end_of_round");
		level flag::set(#"hash_3683ce7803b13dea");
	}
}

/*
	Name: function_dbec41cd
	Namespace: namespace_a8dddac2
	Checksum: 0x79084411
	Offset: 0x7138
	Size: 0x61C
	Parameters: 0
	Flags: None
*/
function function_dbec41cd()
{
	s_barrier = struct::get("player_barrier");
	var_532c4db3 = util::spawn_model("tag_origin", s_barrier.origin, s_barrier.angles);
	var_936c52b5 = getent("clip_player_barrier", "targetname");
	var_d34c45e0 = struct::get("fuel_tank");
	n_zombies = level.zombie_ai_limit;
	str_zone = zm_zonemgr::get_zone_from_position(var_d34c45e0.origin, 1, 1);
	level thread function_7239291b(var_d34c45e0.origin, 0);
	level flag::clear("spawn_zombies");
	level flag::set(#"hash_65c0f8b6c42b8159");
	level flag::clear(#"hash_3683ce7803b13dea");
	level thread function_f57eb037(var_d34c45e0, n_zombies);
	level thread function_bc6ebe8b(90);
	level thread function_18d53d45();
	level thread function_7825a3cb();
	level thread function_c4a3ac62();
	exploder::exploder("lgt_env_boiler");
	playrumbleonposition("sr_prototype_generator_explosion", var_d34c45e0.origin);
	foreach(player in getplayers())
	{
		player.var_45ef153 = 1;
		player.var_1a4a768c = 1;
		player thread function_9589412a();
	}
	if(isdefined(var_532c4db3))
	{
		var_532c4db3 clientfield::set("" + #"hash_7289d683073752c8", 1);
	}
	level clientfield::set("" + #"hash_5a36f05cbdf2580", 3);
	var_936c52b5 setvisibletoall();
	level flag::wait_till_any(array(#"hash_1a8b97bb9490c50c", #"hash_1b6edf77ac1694c2"));
	exploder::stop_exploder("lgt_env_boiler");
	foreach(player in getplayers())
	{
		player.var_45ef153 = 0;
		player.var_1a4a768c = 0;
	}
	if(level flag::get(#"hash_1b6edf77ac1694c2"))
	{
		var_4fd98c9e = getentarray("fuel_tank_liquid", "targetname");
		foreach(var_fc3c3d4a in var_4fd98c9e)
		{
			var_fc3c3d4a moveto(var_fc3c3d4a.var_df0610bd, 5);
		}
	}
	level flag::clear(#"hash_65c0f8b6c42b8159");
	level flag::clear(#"hash_1b6edf77ac1694c2");
	var_936c52b5 setinvisibletoall();
	if(isdefined(var_532c4db3))
	{
		var_532c4db3 clientfield::set("" + #"hash_7289d683073752c8", 0);
	}
	waitframe(1);
	if(isdefined(var_532c4db3))
	{
		var_532c4db3 delete();
	}
	level clientfield::set("" + #"hash_5a36f05cbdf2580", 4);
	wait(5);
	level flag::set("spawn_zombies");
}

/*
	Name: function_c4a3ac62
	Namespace: namespace_a8dddac2
	Checksum: 0xD1D9AEF
	Offset: 0x7760
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function function_c4a3ac62()
{
	wait(0.5);
	level thread namespace_9771a88f::function_752b5c36(#"hash_46d0da754e5732d7", undefined);
}

/*
	Name: function_7825a3cb
	Namespace: namespace_a8dddac2
	Checksum: 0xBA5D3EA8
	Offset: 0x7798
	Size: 0x74
	Parameters: 0
	Flags: None
*/
function function_7825a3cb()
{
	level endon(#"hash_61adf2a70e28f4cf", #"hash_1a8b97bb9490c50c", #"hash_1b6edf77ac1694c2");
	level flag::wait_till(#"hash_7b312d4275e203a6");
	level thread function_79cc990a();
}

/*
	Name: function_79cc990a
	Namespace: namespace_a8dddac2
	Checksum: 0xBA1AA141
	Offset: 0x7818
	Size: 0x4C
	Parameters: 0
	Flags: None
*/
function function_79cc990a()
{
	wait(0.5);
	namespace_9771a88f::function_752b5c36(#"hash_411a6cf2558ce491", undefined);
	level flag::clear(#"hash_7b312d4275e203a6");
}

/*
	Name: function_2fa25e79
	Namespace: namespace_a8dddac2
	Checksum: 0x9EEBB3DC
	Offset: 0x7870
	Size: 0x4C
	Parameters: 0
	Flags: None
*/
function function_2fa25e79()
{
	self endon(#"disconnect");
	self waittill(#"fasttravel_over");
	self thread namespace_9771a88f::function_b5b0518b(#"hash_411a6cf2558ce491", 1);
}

/*
	Name: function_18d53d45
	Namespace: namespace_a8dddac2
	Checksum: 0xBD1A306C
	Offset: 0x78C8
	Size: 0xF2
	Parameters: 0
	Flags: None
*/
function function_18d53d45()
{
	level endon(#"hash_61adf2a70e28f4cf", #"hash_1a8b97bb9490c50c", #"hash_1b6edf77ac1694c2");
	var_6660230c = getent("trigger_backlot", "targetname");
	while(true)
	{
		s_result = undefined;
		s_result = var_6660230c waittill(#"trigger");
		if(isdefined(s_result.activator) && !is_true(s_result.activator.b_entered))
		{
			s_result.activator.b_entered = 1;
			s_result.activator.var_98f1f37c = undefined;
		}
	}
}

/*
	Name: function_99adcd48
	Namespace: namespace_a8dddac2
	Checksum: 0x93460105
	Offset: 0x79C8
	Size: 0x128
	Parameters: 0
	Flags: None
*/
function function_99adcd48()
{
	self endon(#"death");
	level endon(#"hash_1a8b97bb9490c50c", #"hash_1b6edf77ac1694c2");
	wait(10);
	while(true)
	{
		wait(randomintrange(5, 8));
		for(i = 0; i < 6; i++)
		{
			if(zm_utility::is_player_valid(self))
			{
				ai_zombie = array::random(getaiarchetypearray(#"zombie"));
				if(isdefined(ai_zombie) && !self util::is_player_looking_at(ai_zombie.origin, 0.8))
				{
					ai_zombie deletedelay();
				}
			}
		}
	}
}

/*
	Name: function_f57eb037
	Namespace: namespace_a8dddac2
	Checksum: 0x86B62703
	Offset: 0x7AF8
	Size: 0x3C0
	Parameters: 2
	Flags: None
*/
function function_f57eb037(var_d34c45e0, n_zombies)
{
	level endon(#"hash_1a8b97bb9490c50c", #"hash_1b6edf77ac1694c2");
	str_zone = zm_zonemgr::get_zone_from_position(var_d34c45e0.origin, 1, 1);
	var_eb3b90d = [];
	var_72809a6 = struct::get_array("zone_anytown_usa_backlot_spawns");
	var_d0882897 = struct::get_array("tank_process_zombie");
	var_32174208 = arraycombine(var_72809a6, var_d0882897);
	foreach(s_spawn in var_32174208)
	{
		if(s_spawn.script_noteworthy === "spawn_location" || s_spawn.script_noteworthy === "custom_spawner_entry crawl" && distance2dsquared(var_d34c45e0.origin, s_spawn.origin) <= 4000000)
		{
			var_eb3b90d[var_eb3b90d.size] = s_spawn;
		}
	}
	i = 0;
	level thread function_5ceb4a8a(n_zombies, level.round_number);
	if(getplayers().size === 1)
	{
		getplayers()[0] thread function_99adcd48();
	}
	while(true)
	{
		if(function_e1403814() < n_zombies && !level flag::get(#"hash_54c8d63e66e2f949"))
		{
			ai_zombie = zombie_utility::spawn_zombie(function_7002478(), undefined, var_eb3b90d[i], level.round_number);
			if(isdefined(ai_zombie) && var_eb3b90d[i].script_noteworthy === "custom_spawner_entry crawl")
			{
				ai_zombie.var_ed454e33 = 1;
			}
			i++;
			if(i == var_eb3b90d.size)
			{
				i = 0;
				var_eb3b90d = array::randomize(var_eb3b90d);
			}
			waitframe(1);
			if(isdefined(ai_zombie))
			{
				ai_zombie thread function_69503077();
				ai_zombie thread function_b3bf446e(str_zone);
				ai_zombie thread zm_score::function_acaab828();
				ai_zombie.ignore_enemy_count = 1;
				ai_zombie.no_powerups = 1;
				if(ai_zombie.zombie_move_speed !== "super_sprint")
				{
					ai_zombie zombie_utility::set_zombie_run_cycle("sprint");
				}
			}
		}
		wait(0.2);
	}
}

/*
	Name: function_e1403814
	Namespace: namespace_a8dddac2
	Checksum: 0xE6480036
	Offset: 0x7EC0
	Size: 0xC8
	Parameters: 0
	Flags: None
*/
function function_e1403814()
{
	var_9c4334ef = getaiarray();
	foreach(entity in var_9c4334ef)
	{
		if(isvehicle(entity))
		{
			arrayremovevalue(var_9c4334ef, entity);
		}
	}
	if(isdefined(var_9c4334ef))
	{
		return var_9c4334ef.size;
	}
}

/*
	Name: function_7002478
	Namespace: namespace_a8dddac2
	Checksum: 0x2068461E
	Offset: 0x7F90
	Size: 0x13C
	Parameters: 0
	Flags: None
*/
function function_7002478()
{
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
	Name: function_69503077
	Namespace: namespace_a8dddac2
	Checksum: 0xA30642E4
	Offset: 0x80D8
	Size: 0x84
	Parameters: 0
	Flags: None
*/
function function_69503077()
{
	self endon(#"death");
	if(is_true(self.var_ed454e33))
	{
		self waittill(#"completed_emerging_into_playable_area");
	}
	if(isalive(self))
	{
		self clientfield::increment("" + #"hash_11839f68b17da97a");
	}
}

/*
	Name: function_5ceb4a8a
	Namespace: namespace_a8dddac2
	Checksum: 0x6E5FA982
	Offset: 0x8168
	Size: 0x328
	Parameters: 2
	Flags: None
*/
function function_5ceb4a8a(n_zombies, n_round)
{
	level endon(#"hash_1a8b97bb9490c50c", #"hash_1b6edf77ac1694c2");
	var_707cc758 = struct::get("tank_process_soa");
	var_cbd80ad6 = struct::get_array("tank_process_dog");
	level.var_248424c1 = 1;
	level.var_4d6a62ae = 1;
	level.var_a7f8d97b = 5;
	level.var_8e259073 = 0;
	level.var_d5fdc9c = 0;
	level.var_e00b0988 = 0;
	while(true)
	{
		level flag::set(#"hash_54c8d63e66e2f949");
		switch(function_21a3a673(0, 2))
		{
			case 0:
			{
				if(level.var_8e259073 < level.var_248424c1 && function_e1403814() < n_round)
				{
					var_397a719 = namespace_f7516cdf::spawn_single(1, var_707cc758);
					waitframe(1);
					if(isdefined(var_397a719))
					{
						level.var_8e259073++;
						var_397a719 thread function_cc66178();
					}
				}
				break;
			}
			case 1:
			{
				if(level.var_d5fdc9c < level.var_4d6a62ae && function_e1403814() < n_round)
				{
					var_2348406a = namespace_c80d5389::function_e803632f(1, var_707cc758);
					waitframe(1);
					if(isdefined(var_2348406a))
					{
						level.var_d5fdc9c++;
						var_2348406a thread function_95c43d9e();
					}
				}
				break;
			}
			case 2:
			{
				if(level.var_e00b0988 < level.var_a7f8d97b && function_e1403814() < n_round)
				{
					ai_dog = namespace_c402654::function_62db7b1c(1, array::random(var_cbd80ad6));
					waitframe(1);
					if(isdefined(ai_dog))
					{
						level.var_e00b0988++;
						ai_dog thread function_bb7fe568();
					}
				}
				break;
			}
		}
		level flag::clear(#"hash_54c8d63e66e2f949");
		wait(1);
	}
}

/*
	Name: function_bb7fe568
	Namespace: namespace_a8dddac2
	Checksum: 0x66E36DFC
	Offset: 0x8498
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_bb7fe568()
{
	self waittill(#"death");
	level.var_e00b0988--;
}

/*
	Name: function_95c43d9e
	Namespace: namespace_a8dddac2
	Checksum: 0x805BC99E
	Offset: 0x84C8
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_95c43d9e()
{
	self waittill(#"death");
	level.var_d5fdc9c--;
}

/*
	Name: function_cc66178
	Namespace: namespace_a8dddac2
	Checksum: 0xF0366AE2
	Offset: 0x84F8
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_cc66178()
{
	self waittill(#"death");
	level.var_8e259073--;
}

/*
	Name: function_b3bf446e
	Namespace: namespace_a8dddac2
	Checksum: 0xA295799F
	Offset: 0x8528
	Size: 0x152
	Parameters: 1
	Flags: None
*/
function function_b3bf446e(str_zone)
{
	self endon(#"death");
	self.var_98f1f37c = 1;
	self.no_powerups = 1;
	b_entered = 0;
	while(!b_entered)
	{
		if(isarray(str_zone))
		{
			foreach(zone in str_zone)
			{
				if(isalive(self) && self.zone_name === zone)
				{
					b_entered = 1;
				}
			}
		}
		else if(isalive(self) && self.zone_name === str_zone)
		{
			b_entered = 1;
		}
		wait(1);
	}
	self.var_98f1f37c = 0;
}

/*
	Name: function_bc6ebe8b
	Namespace: namespace_a8dddac2
	Checksum: 0x79D70C2B
	Offset: 0x8688
	Size: 0xBC
	Parameters: 1
	Flags: None
*/
function function_bc6ebe8b(n_timer)
{
	level thread function_9c2ad358(n_timer);
	level flag::wait_till_any(array(#"hash_1a8b97bb9490c50c", #"hash_1b6edf77ac1694c2"));
	exploder::stop_exploder("lgt_tank_turn_on");
	level thread zm_utility::function_9ad5aeb1(0, 1, 0, 0);
	wait(1);
	level thread function_5939f21c();
}

/*
	Name: function_9c2ad358
	Namespace: namespace_a8dddac2
	Checksum: 0x2DC3038D
	Offset: 0x8750
	Size: 0x19C
	Parameters: 1
	Flags: None
*/
function function_9c2ad358(n_timer)
{
	level endon(#"hash_1b6edf77ac1694c2", #"hash_1a8b97bb9490c50c");
	var_4fd98c9e = getentarray("fuel_tank_liquid", "targetname");
	foreach(var_fc3c3d4a in var_4fd98c9e)
	{
		var_fc3c3d4a.var_df0610bd = var_fc3c3d4a.origin;
	}
	foreach(var_fc3c3d4a in var_4fd98c9e)
	{
		var_fc3c3d4a thread function_6790ba9f(n_timer);
	}
	wait(n_timer);
	level notify(#"hash_61adf2a70e28f4cf");
	wait(1);
	level flag::set(#"hash_1a8b97bb9490c50c");
}

/*
	Name: function_6790ba9f
	Namespace: namespace_a8dddac2
	Checksum: 0xA6A9441A
	Offset: 0x88F8
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function function_6790ba9f(n_timer)
{
	self movez(130, n_timer);
}

/*
	Name: function_9589412a
	Namespace: namespace_a8dddac2
	Checksum: 0xE2EC023B
	Offset: 0x8928
	Size: 0xC0
	Parameters: 0
	Flags: None
*/
function function_9589412a()
{
	self endon(#"death");
	level endon(#"hash_61adf2a70e28f4cf", #"hash_1a8b97bb9490c50c");
	self waittill(#"hash_1c35eb15aa210d6");
	self thread function_2fa25e79();
	level flag::set(#"hash_7b312d4275e203a6");
	waitframe(1);
	level flag::set(#"hash_1b6edf77ac1694c2");
	level notify(#"hash_61adf2a70e28f4cf");
}

/*
	Name: function_8687b0f2
	Namespace: namespace_a8dddac2
	Checksum: 0x9930BA69
	Offset: 0x89F0
	Size: 0x126
	Parameters: 0
	Flags: None
*/
function function_8687b0f2()
{
	var_d34c45e0 = struct::get("fuel_tank");
	level flag::wait_till(#"hash_1a8b97bb9490c50c");
	level thread namespace_9771a88f::function_752b5c36(#"hash_7a068d507bf881b4", undefined);
	playrumbleonposition("sr_prototype_generator_explosion", var_d34c45e0.origin);
	wait(0.25);
	var_62b058e7 = getent("fuel_tank_cover", "targetname");
	var_62b058e7 thread scene::play(#"hash_49cd61dfddbf567e", var_62b058e7);
	waitframe(1);
	var_68cb0703 = function_3d102402(#"hash_a114ca1007a05f0", var_d34c45e0.origin, var_d34c45e0.angles, 1);
}

/*
	Name: function_7239291b
	Namespace: namespace_a8dddac2
	Checksum: 0x297F35DC
	Offset: 0x8B20
	Size: 0x28E
	Parameters: 2
	Flags: None
*/
function function_7239291b(v_org, b_in_zone)
{
	var_4b9821e4 = 0;
	a_zombies = getaiteamarray(level.zombie_team);
	str_zone = zm_zonemgr::get_zone_from_position(v_org);
	foreach(zombie in a_zombies)
	{
		if(b_in_zone)
		{
			if(isalive(zombie) && (isdefined(zombie.zone_name) && zombie.zone_name == str_zone))
			{
				zombie.b_clear = 1;
			}
		}
		else if(isalive(zombie) && (isdefined(zombie.zone_name) && zombie.zone_name != str_zone))
		{
			zombie.b_clear = 1;
		}
		if(isalive(zombie) && is_true(zombie.b_clear))
		{
			if(zm_utility::is_magic_bullet_shield_enabled(zombie))
			{
				zombie util::stop_magic_bullet_shield();
			}
			zombie.allowdeath = 1;
			zombie.no_powerups = 1;
			zombie.deathpoints_already_given = 1;
			zombie.marked_for_death = 1;
			zombie thread zombie_death::flame_death_fx();
			if(!is_true(zombie.no_gib))
			{
				zombie zombie_utility::zombie_head_gib();
			}
			zombie dodamage(zombie.health + 666, zombie.origin);
		}
		waitframe(1);
	}
}

/*
	Name: function_e17174c2
	Namespace: namespace_a8dddac2
	Checksum: 0xADF44447
	Offset: 0x8DB8
	Size: 0x1EE
	Parameters: 0
	Flags: None
*/
function function_e17174c2()
{
	var_4b9821e4 = 0;
	a_zombies = getaiteamarray(level.zombie_team);
	foreach(zombie in a_zombies)
	{
		if(zombie.n_id === self.n_id)
		{
			if(isalive(zombie))
			{
				zombie.b_clear = 1;
				if(zm_utility::is_magic_bullet_shield_enabled(zombie))
				{
					zombie util::stop_magic_bullet_shield();
				}
				if(isalive(zombie))
				{
					zombie.allowdeath = 1;
					zombie.no_powerups = 1;
					zombie.deathpoints_already_given = 1;
					zombie.marked_for_death = 1;
					zombie thread zombie_death::flame_death_fx();
					if(!is_true(zombie.no_gib))
					{
						zombie zombie_utility::zombie_head_gib();
					}
					if(isalive(zombie))
					{
						zombie dodamage(zombie.health + 666, zombie.origin);
					}
				}
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_5939f21c
	Namespace: namespace_a8dddac2
	Checksum: 0x5A2D41F2
	Offset: 0x8FB0
	Size: 0xA8
	Parameters: 0
	Flags: None
*/
function function_5939f21c()
{
	a_corpses = getcorpsearray();
	foreach(corpse in a_corpses)
	{
		if(isdefined(corpse))
		{
			corpse delete();
		}
	}
}

/*
	Name: function_72dc9adc
	Namespace: namespace_a8dddac2
	Checksum: 0xC21AA54E
	Offset: 0x9060
	Size: 0xB6
	Parameters: 0
	Flags: None
*/
function function_72dc9adc()
{
	vehicle::add_main_callback("vehicle_t9_rcxd_racing_mq", &recon_car::function_d1661ada);
	callback::add_callback(#"hash_1eda827ff5e6895b", &function_6e6149a6);
	callback::add_callback(#"hash_210adcf09e99fba1", &function_4b58e5ab);
	level.var_9b69599b = struct::get("gp_machine");
	level.var_ef566585 = undefined;
}

/*
	Name: function_6e6149a6
	Namespace: namespace_a8dddac2
	Checksum: 0xB943E5C6
	Offset: 0x9120
	Size: 0x11C
	Parameters: 0
	Flags: None
*/
function function_6e6149a6()
{
	if(!is_true(level.b_power) && distance2dsquared(self.origin, level.var_9b69599b.origin) <= 32400)
	{
		level.b_power = 1;
		self.is_powered = 1;
		self clientfield::set("" + #"hash_3b24d38fe21de8fd", 1);
		self thread function_420c57c4();
		wait(2);
		if(isalive(self.attacker) && isplayer(self.attacker))
		{
			self.attacker zm_vo::function_7622cb70(#"hash_3de820817318544b");
		}
	}
}

/*
	Name: function_420c57c4
	Namespace: namespace_a8dddac2
	Checksum: 0x236B1AE4
	Offset: 0x9248
	Size: 0x54
	Parameters: 0
	Flags: None
*/
function function_420c57c4()
{
	self waittill(#"death");
	if(isdefined(self))
	{
		self.is_powered = undefined;
		self clientfield::set("" + #"hash_3b24d38fe21de8fd", 0);
	}
}

/*
	Name: function_4b58e5ab
	Namespace: namespace_a8dddac2
	Checksum: 0x3A20F5B4
	Offset: 0x92A8
	Size: 0x124
	Parameters: 0
	Flags: None
*/
function function_4b58e5ab()
{
	if(isdefined(self) && is_true(self.is_powered) && is_true(level.b_power) && !level flag::get(#"hash_7eb10b962195f30c"))
	{
		level flag::set(#"hash_7eb10b962195f30c");
		level clientfield::set("" + #"hash_5a36f05cbdf2580", 1);
		level thread function_5f60162d();
		self.is_powered = undefined;
	}
	if(isdefined(self))
	{
		self clientfield::set("" + #"hash_3b24d38fe21de8fd", 0);
	}
}

/*
	Name: function_5f60162d
	Namespace: namespace_a8dddac2
	Checksum: 0xB915B2B
	Offset: 0x93D8
	Size: 0x7E
	Parameters: 0
	Flags: None
*/
function function_5f60162d()
{
	wait(2);
	showmiscmodels("rcxd_cabinet_on");
	hidemiscmodels("rcxd_cabinet_off");
	var_c809fcdc = level.var_9b69599b zm_unitrigger::create(&function_70b7fcd8, 64, &function_c3297243);
}

/*
	Name: function_70b7fcd8
	Namespace: namespace_a8dddac2
	Checksum: 0x45B2AA56
	Offset: 0x9460
	Size: 0xB8
	Parameters: 1
	Flags: None
*/
function function_70b7fcd8(player)
{
	if(!isdefined(level.var_ef566585))
	{
		self sethintstringforplayer(player, #"hash_5e1312f118a41e92", 2000);
		if(!player zm_score::can_player_purchase(2000))
		{
			player globallogic::function_d1924f29(#"hash_6e3ae7967dc5d414");
		}
		return true;
	}
	self sethintstringforplayer(player, #"hash_1d51bfe52c244e49");
	return true;
}

/*
	Name: function_c3297243
	Namespace: namespace_a8dddac2
	Checksum: 0xAEC03D9C
	Offset: 0x9528
	Size: 0x158
	Parameters: 0
	Flags: None
*/
function function_c3297243()
{
	while(true)
	{
		var_be17187b = undefined;
		var_be17187b = self waittill(#"trigger");
		if(zm_utility::is_player_valid(var_be17187b.activator) && var_be17187b.activator zm_score::can_player_purchase(2000) && !isdefined(level.var_ef566585))
		{
			level flag::set(#"hash_6868b1aab2d20ef4");
			var_be17187b.activator zm_score::minus_to_player_score(2000);
			function_1bfd873a(var_be17187b.activator);
			level flag::wait_till(#"hash_7f37f6722d373c94");
			level flag::clear(#"hash_7f37f6722d373c94");
			if(level flag::get(#"hash_1d60e20334999c12"))
			{
				zm_unitrigger::unregister_unitrigger(self.stub);
			}
		}
	}
}

/*
	Name: on_player_disconnect
	Namespace: namespace_a8dddac2
	Checksum: 0x5A3D8274
	Offset: 0x9688
	Size: 0x9C
	Parameters: 0
	Flags: None
*/
function on_player_disconnect()
{
	if(isdefined(level.var_ef566585) && level.var_ef566585.owner === self)
	{
		level flag::set(#"hash_7f37f6722d373c94");
		level flag::clear(#"hash_6868b1aab2d20ef4");
		if(isdefined(level.var_ef566585))
		{
			level.var_ef566585 delete();
		}
	}
}

/*
	Name: function_1bfd873a
	Namespace: namespace_a8dddac2
	Checksum: 0x9EB8DDC1
	Offset: 0x9730
	Size: 0x21C
	Parameters: 1
	Flags: None
*/
function function_1bfd873a(player)
{
	player endon(#"disconnect");
	if(!isdefined(level.var_ef566585))
	{
		var_c48a5d = getent("gp_spawn", "targetname");
		level.var_ef566585 = spawnvehicle(#"hash_1b0b4cfd9c2726dd", var_c48a5d.origin, var_c48a5d.angles);
		wait(0.1);
		if(isdefined(level.var_ef566585))
		{
			level.var_ef566585.owner = player;
			level.var_ef566585 clientfield::increment("" + #"hash_4145b0d4262e2782");
			level.var_ef566585.targetname = "gp_car";
			level.var_ef566585 thread function_66fe9481();
			level.var_ef566585 thread function_cee1d1a0();
			level.var_ef566585 thread function_c3a363f9();
			waitframe(1);
			level.var_ef566585 usevehicle(player, 0);
			level.var_ef566585 makevehicleunusable();
			player vehicle::set_vehicle_drivable_time_starting_now(30000);
			level.var_ef566585 thread killstreaks::waitfortimeoutbeep(10, 4, 30000);
			level.var_ef566585 thread function_21ec730a(30);
			level flag::set(#"hash_d9787e6e05bf6");
		}
	}
}

/*
	Name: function_c3a363f9
	Namespace: namespace_a8dddac2
	Checksum: 0xEDBC1915
	Offset: 0x9958
	Size: 0xD4
	Parameters: 0
	Flags: None
*/
function function_c3a363f9()
{
	self waittill(#"death");
	self thread function_31bea2f5();
	if(isdefined(self.owner))
	{
		self.owner val::reset("arc_xd", "ignoreme");
	}
	if(isdefined(self))
	{
		wait(0.5);
		level flag::set(#"hash_7f37f6722d373c94");
		level flag::clear(#"hash_6868b1aab2d20ef4");
		if(isdefined(self))
		{
			self delete();
		}
	}
}

/*
	Name: function_21ec730a
	Namespace: namespace_a8dddac2
	Checksum: 0x6D512CD4
	Offset: 0x9A38
	Size: 0x84
	Parameters: 1
	Flags: None
*/
function function_21ec730a(n_timer)
{
	self endon(#"death");
	wait(n_timer);
	if(isdefined(self.owner))
	{
		self.owner val::reset("arc_xd", "ignoreme");
	}
	self dodamage(self.health, self.origin);
}

/*
	Name: function_cee1d1a0
	Namespace: namespace_a8dddac2
	Checksum: 0xBE026E8C
	Offset: 0x9AC8
	Size: 0x20C
	Parameters: 0
	Flags: None
*/
function function_cee1d1a0()
{
	self endon(#"death", #"shutdown");
	var_45bf69aa = struct::get("vent_arc_xd");
	level.var_2133d509.s_target = struct::get(var_45bf69aa.target);
	var_8aaeebfe = struct::get("backroom_exp_loc");
	level.var_d47934e1 = util::spawn_model("tag_origin", var_8aaeebfe.origin, var_8aaeebfe.angles);
	while(true)
	{
		if(distance2dsquared(level.var_2133d509.origin, self.origin) <= 10000)
		{
			break;
		}
		wait(0.1);
	}
	self waittill(#"hash_2eef2b24309bc112");
	level.var_2133d509 playsound(#"hash_5039749da6b34ee8");
	level.var_2133d509 moveto(level.var_2133d509.s_target.origin, 0.1);
	level.var_2133d509 rotateto(level.var_2133d509.s_target.angles, 0.1);
	var_ab9c9dd4 = getent("clip_backroom_vent", "targetname");
	var_ab9c9dd4 setinvisibletoall();
}

/*
	Name: function_66fe9481
	Namespace: namespace_a8dddac2
	Checksum: 0xFF6AAD1B
	Offset: 0x9CE0
	Size: 0xD8
	Parameters: 0
	Flags: None
*/
function function_66fe9481()
{
	self endon(#"death");
	while(true)
	{
		s_result = undefined;
		s_result = self waittill(#"enter_vehicle");
		if(zm_utility::is_player_valid(s_result.player))
		{
			s_result.player val::set("arc_xd", "ignoreme", 1);
			s_result.player thread function_9030e55c();
			s_result.player thread function_d5ea10b();
			s_result.player thread function_41ff3cd8();
		}
	}
}

/*
	Name: function_41ff3cd8
	Namespace: namespace_a8dddac2
	Checksum: 0x2ED11C57
	Offset: 0x9DC0
	Size: 0xB4
	Parameters: 0
	Flags: None
*/
function function_41ff3cd8()
{
	self endon(#"disconnect");
	level.var_ef566585 endon(#"death");
	while(true)
	{
		s_result = trigger::wait_till("trigger_tv_backroom");
		if(s_result.who === level.var_ef566585)
		{
			if(isalive(self))
			{
				self zm_vo::function_7622cb70(#"hash_589145ca18409daa");
				break;
			}
		}
		wait(0.5);
	}
}

/*
	Name: function_d5ea10b
	Namespace: namespace_a8dddac2
	Checksum: 0x378D065A
	Offset: 0x9E80
	Size: 0xB8
	Parameters: 0
	Flags: None
*/
function function_d5ea10b()
{
	self endon(#"disconnect");
	level.var_ef566585 endon(#"death");
	while(true)
	{
		s_result = undefined;
		s_result = self waittill(#"exit_vehicle");
		if(zm_utility::is_player_valid(self) && s_result.vehicle === level.var_ef566585)
		{
			self val::reset("arc_xd", "ignoreme");
		}
	}
}

/*
	Name: function_9030e55c
	Namespace: namespace_a8dddac2
	Checksum: 0x8BF412CF
	Offset: 0x9F40
	Size: 0x1C4
	Parameters: 0
	Flags: None
*/
function function_9030e55c()
{
	self notify("1dfb8ee344f0b145");
	self endon("1dfb8ee344f0b145");
	self endon(#"death", #"exit_vehicle");
	while(true)
	{
		if(self vehicleattackbuttonpressed())
		{
			self val::reset("arc_xd", "ignoreme");
			level flag::clear(#"hash_6868b1aab2d20ef4");
			break;
		}
		waitframe(1);
	}
	if(isdefined(level.var_ef566585) && isdefined(self))
	{
		level.var_ef566585 clientfield::increment("" + #"hash_485fe8f642043f78");
		level.var_ef566585 playrumbleonentity("sr_prototype_generator_explosion");
		level.var_ef566585 radiusdamage(level.var_ef566585.origin + vectorscale((0, 0, 1), 10), 500, level.zombie_health, int(level.zombie_health * 0.5), self, "MOD_EXPLOSIVE");
		level.var_ef566585 dodamage(level.var_ef566585.health, level.var_ef566585.origin);
	}
}

/*
	Name: function_31bea2f5
	Namespace: namespace_a8dddac2
	Checksum: 0x4E23F8E1
	Offset: 0xA110
	Size: 0x84
	Parameters: 0
	Flags: None
*/
function function_31bea2f5()
{
	var_c1e7550c = getent("vol_tv_backroom", "targetname");
	b_success = 0;
	if(self istouching(var_c1e7550c) && !b_success)
	{
		b_success = 1;
		level thread function_5429a020();
	}
}

/*
	Name: function_5429a020
	Namespace: namespace_a8dddac2
	Checksum: 0xA038B537
	Offset: 0xA1A0
	Size: 0x1B4
	Parameters: 0
	Flags: None
*/
function function_5429a020()
{
	s_monitor = struct::get("part_monitor");
	level.var_d47934e1 clientfield::increment("" + #"hash_5e0a6fc6597e6e03");
	level thread function_52ad48fd();
	hidemiscmodels("backroom_hole");
	level clientfield::set("" + #"hash_5a36f05cbdf2580", 2);
	level flag::set(#"hash_1d60e20334999c12");
	var_a001c66d = function_3d102402(#"hash_56b1b48511774f82", s_monitor.origin, s_monitor.angles, 0);
	wait(0.1);
	var_a001c66d thread function_bc4f36d7();
	var_ab9c9dd4 = getent("clip_backroom_vent", "targetname");
	var_ab9c9dd4 setvisibletoall();
	wait(0.5);
	hidemiscmodels("rcxd_shelf_before");
	showmiscmodels("rcxd_shelf_after");
}

/*
	Name: function_bc4f36d7
	Namespace: namespace_a8dddac2
	Checksum: 0x633A1D63
	Offset: 0xA360
	Size: 0x104
	Parameters: 0
	Flags: None
*/
function function_bc4f36d7()
{
	if(self haspart("tag_screen_25"))
	{
		self hidepart("tag_screen_25");
	}
	if(self haspart("tag_screen_50"))
	{
		self hidepart("tag_screen_50");
	}
	if(self haspart("tag_screen_full"))
	{
		self hidepart("tag_screen_full");
	}
	if(self haspart("tag_screen_less"))
	{
		self hidepart("tag_screen_less");
	}
}

/*
	Name: function_1ddf7c10
	Namespace: namespace_a8dddac2
	Checksum: 0xD51934E9
	Offset: 0xA470
	Size: 0xAC
	Parameters: 1
	Flags: None
*/
function function_1ddf7c10(var_5fa67dc9)
{
	foreach(var_3f8f830a in self.var_401b92e8)
	{
		if(var_3f8f830a != var_5fa67dc9)
		{
			self hidepart(var_3f8f830a);
		}
	}
	self showpart(var_5fa67dc9);
}

/*
	Name: function_52ad48fd
	Namespace: namespace_a8dddac2
	Checksum: 0xF52B0D02
	Offset: 0xA528
	Size: 0xF8
	Parameters: 0
	Flags: None
*/
function function_52ad48fd()
{
	namespace_4abf1500::function_23255935("omega_audiolog_3");
	s_loc = struct::get("audiolog_loc");
	foreach(var_99bf2e73 in level.var_238bd723)
	{
		if(var_99bf2e73.targetname === "omega_audiolog_3" && isdefined(var_99bf2e73.var_bdb97676))
		{
			var_99bf2e73.var_bdb97676 namespace_4abf1500::function_c1974629(s_loc.origin);
		}
	}
}

/*
	Name: function_96558bd7
	Namespace: namespace_a8dddac2
	Checksum: 0xD90B2D31
	Offset: 0xA628
	Size: 0x74
	Parameters: 0
	Flags: None
*/
function function_96558bd7()
{
	level flag::wait_till_all(array(#"hash_52d565520308890c", #"hash_77e125d6f8b2733e", #"hash_407e12c104cfde25"));
	level flag::set(#"hash_21844688fcfdffe4");
}

/*
	Name: function_551048b9
	Namespace: namespace_a8dddac2
	Checksum: 0x4EADDE59
	Offset: 0xA6A8
	Size: 0x74
	Parameters: 0
	Flags: None
*/
function function_551048b9()
{
	level flag::wait_till_all(array(#"hash_6702dc6ad4563f02", #"hash_6702dd6ad45640b5", #"hash_6702da6ad4563b9c"));
	level flag::set(#"hash_45d1ea5a016b7916");
}

/*
	Name: function_b4e3ff4a
	Namespace: namespace_a8dddac2
	Checksum: 0x72FEA1F3
	Offset: 0xA728
	Size: 0x54
	Parameters: 1
	Flags: None
*/
function function_b4e3ff4a(b_skipped)
{
	if(b_skipped)
	{
		return;
	}
	level flag::wait_till(#"hash_717f6f193982a127");
	/#
		iprintlnbold("");
	#/
}

/*
	Name: function_28be9289
	Namespace: namespace_a8dddac2
	Checksum: 0x359A948
	Offset: 0xA788
	Size: 0x44
	Parameters: 2
	Flags: None
*/
function function_28be9289(b_skipped, var_19e802fa)
{
	level flag::set(#"hash_717f6f193982a127");
}

/*
	Name: function_a048c235
	Namespace: namespace_a8dddac2
	Checksum: 0xBF69C1FF
	Offset: 0xA7D8
	Size: 0x1B0
	Parameters: 0
	Flags: None
*/
function function_a048c235()
{
	level.var_999868f3 = [];
	level.var_eb04c103 = array(0, 1, 2);
	foreach(s_crystal in struct::get_array("crystal_pos"))
	{
		level.var_999868f3[level.var_999868f3.size] = util::spawn_model(s_crystal.model, s_crystal.origin, s_crystal.angles);
		wait(0.1);
		level.var_999868f3[level.var_999868f3.size - 1].var_9e7631bd = struct::get_array(s_crystal.target);
		level.var_999868f3[level.var_999868f3.size - 1].n_id = s_crystal.var_df2f9ba4;
		level.var_999868f3[level.var_999868f3.size - 1] thread function_43b1545e();
	}
	level.var_90acdb64 = level.var_999868f3.size;
}

/*
	Name: function_7ff1dd86
	Namespace: namespace_a8dddac2
	Checksum: 0xDB31E02
	Offset: 0xA990
	Size: 0x166
	Parameters: 1
	Flags: None
*/
function function_7ff1dd86(var_7ecdee63)
{
	n_players = getplayers().size;
	switch(var_7ecdee63)
	{
		case "dog":
		{
			if(n_players > 2)
			{
				n_limit = 5;
			}
			else
			{
				n_limit = 3;
			}
			break;
		}
		case "raz":
		{
			n_limit = 2;
			break;
		}
		case "hash_24f9e195cf2de42":
		{
			if(n_players > 2)
			{
				n_limit = 2;
			}
			else
			{
				n_limit = 1;
			}
			break;
		}
		case "mimic":
		{
			if(n_players > 2)
			{
				n_limit = 3;
			}
			else
			{
				n_limit = 2;
			}
			break;
		}
		case "hash_24c829c980982c1":
		{
			if(n_players > 2)
			{
				n_limit = 2;
			}
			else
			{
				n_limit = 1;
			}
			break;
		}
		case "hash_1bc8194446d4722f":
		{
			if(n_players > 2)
			{
				n_limit = 3;
			}
			else
			{
				n_limit = 2;
			}
			break;
		}
	}
	return n_limit;
}

/*
	Name: function_8d0f8a44
	Namespace: namespace_a8dddac2
	Checksum: 0x19C69E50
	Offset: 0xAB00
	Size: 0x2C2
	Parameters: 0
	Flags: None
*/
function function_8d0f8a44()
{
	switch(self.n_id)
	{
		case 0:
		{
			self.a_str_zones[self.a_str_zones.size] = "zone_helipads";
			self.a_str_zones[self.a_str_zones.size] = "zone_helipads_2";
			self.a_str_zones[self.a_str_zones.size] = "zone_helipads_3";
			self.a_str_zones[self.a_str_zones.size] = "zone_helipads_4";
			break;
		}
		case 1:
		{
			self.a_str_zones[self.a_str_zones.size] = "zone_xxx_club_roof";
			self.a_str_zones[self.a_str_zones.size] = "zone_xxx_club";
			self.a_str_zones[self.a_str_zones.size] = "zone_diner";
			self.a_str_zones[self.a_str_zones.size] = "zone_main_street_02";
			self.a_str_zones[self.a_str_zones.size] = "zone_main_street_bridge";
			self.a_str_zones[self.a_str_zones.size] = "zone_main_street_01";
			self.a_str_zones[self.a_str_zones.size] = "zone_deck_bar";
			self.a_str_zones[self.a_str_zones.size] = "zone_high_tide_bar_roof";
			self.a_str_zones[self.a_str_zones.size] = "zone_high_tide_bar";
			self.a_str_zones[self.a_str_zones.size] = "zone_pizza_parlor";
			self.a_str_zones[self.a_str_zones.size] = "zone_donuts";
			self.a_str_zones[self.a_str_zones.size] = "zone_main_street_backlot";
			break;
		}
		case 2:
		{
			self.a_str_zones[self.a_str_zones.size] = "zone_service_tunnels_01";
			self.a_str_zones[self.a_str_zones.size] = "zone_service_tunnels_02";
			self.a_str_zones[self.a_str_zones.size] = "zone_service_tunnels_03";
			self.a_str_zones[self.a_str_zones.size] = "zone_pa_room_01";
			self.a_str_zones[self.a_str_zones.size] = "zone_pa_room_02";
			self.a_str_zones[self.a_str_zones.size] = "zone_bunker_entrance_03";
			break;
		}
	}
}

/*
	Name: function_43b1545e
	Namespace: namespace_a8dddac2
	Checksum: 0x157D3591
	Offset: 0xADD0
	Size: 0xCD0
	Parameters: 0
	Flags: None
*/
function function_43b1545e()
{
	self.var_92038de6 = [];
	self.var_c84e1007 = [];
	self.var_3758c43e = [];
	self.a_str_zones = [];
	self.health = 999999;
	self.var_9bfb3ba = 3;
	self.n_rate = 1;
	self val::set("crystal", "takedamage", 0);
	self val::set("crystal", "allowdeath", 0);
	self disconnectpaths();
	self.var_7e977a12 = array::random(level.var_eb04c103);
	arrayremovevalue(level.var_eb04c103, self.var_7e977a12);
	self.str_zone = zm_zonemgr::get_zone_from_position(self.origin, 1, 1);
	self thread function_8d0f8a44();
	var_c61e7ea7 = level.zones[self.str_zone];
	self.var_e15699c4 = getarraykeys(var_c61e7ea7.adjacent_zones);
	if(!isdefined(self.var_e15699c4))
	{
		self.var_e15699c4 = [];
	}
	else if(!isarray(self.var_e15699c4))
	{
		self.var_e15699c4 = array(self.var_e15699c4);
	}
	self.var_e15699c4[self.var_e15699c4.size] = self.str_zone;
	self.a_zones = [];
	self.var_eb3b90d = [];
	self.var_b77578d8 = [];
	self.var_bde5a19a = [];
	self.var_f3ec34ec = [];
	self.var_2e4e85c5 = [];
	self.var_29db796e = [];
	self.var_581a505b = [];
	self.var_4c4255a3 = [];
	self.var_ace3e8e6 = [];
	self.var_1fdd1dc7 = function_7ff1dd86("dog");
	self.var_33199d58 = function_7ff1dd86("raz");
	self.var_6fc405f2 = function_7ff1dd86("soa");
	self.var_5e267965 = function_7ff1dd86("mimic");
	self.var_171665a9 = function_7ff1dd86("tempest");
	self.var_ee4b6df0 = function_7ff1dd86("tormentor");
	self.var_d3ab1e84 = 0;
	self.var_1bf25a28 = 0;
	self.var_d5fdc9c = 0;
	self.var_c1e479f3 = 0;
	self.var_8e259073 = 0;
	self.var_ee5dbb09 = 0;
	self.var_80164102 = 0;
	foreach(str_zone in self.var_e15699c4)
	{
		self.a_zones[self.a_zones.size] = level.zones[str_zone];
	}
	foreach(zone in self.a_zones)
	{
		foreach(node in zone.nodes)
		{
			var_eb3b90d = struct::get_array(node.target);
			foreach(s_spawn in var_eb3b90d)
			{
				if(s_spawn.script_noteworthy === #"spawn_location" || s_spawn.script_noteworthy === "custom_spawner_entry crawl")
				{
					self.var_bde5a19a[self.var_bde5a19a.size] = s_spawn;
					continue;
				}
				if(s_spawn.script_noteworthy === #"dog_location")
				{
					self.var_f3ec34ec[self.var_f3ec34ec.size] = s_spawn;
					continue;
				}
				if(s_spawn.script_noteworthy === #"raz_location")
				{
					self.var_2e4e85c5[self.var_2e4e85c5.size] = s_spawn;
					continue;
				}
				if(s_spawn.script_noteworthy === #"hash_2fe3f22c14b70850")
				{
					self.var_29db796e[self.var_29db796e.size] = s_spawn;
				}
			}
		}
	}
	var_75d7aa63 = struct::get_array(#"hash_48c93ac86435a399");
	foreach(var_734c3691 in var_75d7aa63)
	{
		if(var_734c3691.var_df2f9ba4 === self.n_id)
		{
			if(var_734c3691.script_noteworthy === #"mimic")
			{
				self.var_581a505b[self.var_581a505b.size] = var_734c3691;
				continue;
			}
			if(var_734c3691.script_noteworthy === #"hash_24c829c980982c1")
			{
				self.var_4c4255a3[self.var_4c4255a3.size] = var_734c3691;
				continue;
			}
			if(var_734c3691.script_noteworthy === #"hash_1bc8194446d4722f")
			{
				self.var_ace3e8e6[self.var_ace3e8e6.size] = var_734c3691;
			}
		}
	}
	self.var_b77578d8 = self function_9550923e();
	self clientfield::set("" + #"hash_4d2911e91cdb1e91", 1);
	self thread function_ebb95a0d();
	self thread function_e9df185f();
	self thread function_8e1ce89a();
	self thread function_3b0cf79();
	foreach(var_b00775de in struct::get_array("sphere_pos"))
	{
		if(var_b00775de.var_df2f9ba4 === self.n_id)
		{
			self.var_92038de6[self.var_92038de6.size] = var_b00775de;
			self.var_92038de6[self.var_92038de6.size - 1].n_delay = var_b00775de.n_delay;
		}
	}
	foreach(s_center in self.var_92038de6)
	{
		self.var_c84e1007[self.var_c84e1007.size] = util::spawn_model("tag_origin", s_center.origin, s_center.angles);
		self.var_c84e1007[self.var_c84e1007.size - 1].radius = s_center.radius;
		self.var_c84e1007[self.var_c84e1007.size - 1].n_delay = s_center.n_delay;
	}
	foreach(var_181a390b in self.var_c84e1007)
	{
		self.var_3758c43e[self.var_3758c43e.size] = util::spawn_model(#"hash_53079af25eecf35b", var_181a390b.origin + (var_181a390b.radius, 0, 0), var_181a390b.angles);
		wait(0.1);
		self.var_3758c43e[self.var_3758c43e.size - 1] setscale(0.5);
		self.var_3758c43e[self.var_3758c43e.size - 1] ghost();
		self.var_3758c43e[self.var_3758c43e.size - 1].e_fx = util::spawn_model("tag_origin", self.var_3758c43e[self.var_3758c43e.size - 1].origin);
		wait(0.1);
		self.var_3758c43e[self.var_3758c43e.size - 1] linkto(var_181a390b);
		wait(0.1);
		self thread function_cd8e8b80(var_181a390b, self.var_3758c43e[self.var_3758c43e.size - 1]);
	}
	foreach(var_b7eee573 in self.var_3758c43e)
	{
		var_b7eee573.e_owner = self;
		var_b7eee573 thread function_2a5d8845(self);
	}
}

/*
	Name: function_9550923e
	Namespace: namespace_a8dddac2
	Checksum: 0x7FCBD45C
	Offset: 0xBAA8
	Size: 0xCE
	Parameters: 0
	Flags: None
*/
function function_9550923e()
{
	switch(self.var_7e977a12)
	{
		case 0:
		{
			var_b77578d8 = array(self.var_f3ec34ec, self.var_2e4e85c5);
			break;
		}
		case 1:
		{
			var_b77578d8 = array(self.var_581a505b, self.var_29db796e);
			break;
		}
		case 2:
		{
			var_b77578d8 = array(self.var_ace3e8e6, self.var_4c4255a3);
			break;
		}
	}
	return var_b77578d8;
}

/*
	Name: function_e9df185f
	Namespace: namespace_a8dddac2
	Checksum: 0xE6DB4E78
	Offset: 0xBB80
	Size: 0x17A
	Parameters: 0
	Flags: None
*/
function function_e9df185f()
{
	level endon(#"hash_3e765c26047c9f54");
	self endon(#"death", #"destroyed");
	while(true)
	{
		self waittill(#"hash_4da63fe4689abc76");
		playsoundatposition(#"hash_2148316d1fd4d8d4", self.origin + vectorscale((0, 0, 1), 25));
		if(!level.var_e9eb81d7)
		{
			level.var_e9eb81d7 = 1;
			level.var_74e399d7 = self;
			level thread zm_vo::function_7622cb70(#"hash_318af4ddcfa6d2d7");
		}
		else if(!level.var_8c011b28 && self != level.var_74e399d7)
		{
			level.var_8c011b28 = 1;
			level thread zm_vo::function_7622cb70(#"hash_5928b946f83c46b");
		}
		if(self.var_9bfb3ba)
		{
			self.n_rate = self.n_rate - 0.25;
			self.var_9bfb3ba--;
			if(self.var_9bfb3ba < 1)
			{
				break;
			}
		}
	}
}

/*
	Name: function_ebb95a0d
	Namespace: namespace_a8dddac2
	Checksum: 0x294261C7
	Offset: 0xBD08
	Size: 0xCC
	Parameters: 0
	Flags: None
*/
function function_ebb95a0d()
{
	self endon(#"death", #"destroyed");
	self flag::wait_till(#"hash_28e0be8a85b0be77");
	if(!level.var_6d18ddab)
	{
		level.var_6d18ddab = 1;
		level thread zm_vo::function_7622cb70(#"hash_59e13c81d0a51e58");
	}
	self val::set("crystal", "takedamage", 1);
	self thread function_e255e996();
}

/*
	Name: function_8e1ce89a
	Namespace: namespace_a8dddac2
	Checksum: 0xB623955C
	Offset: 0xBDE0
	Size: 0x348
	Parameters: 0
	Flags: None
*/
function function_8e1ce89a()
{
	level endon(#"hash_3e765c26047c9f54");
	self endon(#"death", #"destroyed");
	self flag::wait_till(#"hash_60b2f597116f5ae");
	self flag::clear(#"hash_454130aa51c71a1a");
	self thread function_975ee8a1();
	self thread function_d341296a();
	self.var_52f2e0ec = array::randomize(self.var_b77578d8);
	self.var_eb3b90d = arraycombine(self.var_52f2e0ec[0], self.var_52f2e0ec[1]);
	self.var_eb3b90d = arraycombine(self.var_eb3b90d, self.var_bde5a19a);
	self.e_spawner = getentarray("zombie_spawner", "script_noteworthy")[0];
	i = 0;
	while(true)
	{
		if(self.var_80164102 < 12 && self flag::get(#"hash_60b2f597116f5ae") && self flag::get(#"hash_148b5949f208f189"))
		{
			s_spot = self.var_eb3b90d[i];
			ai_zombie = self function_1e31497f(s_spot);
			wait(0.1);
			if(isdefined(ai_zombie))
			{
				i++;
				if(i >= self.var_eb3b90d.size)
				{
					i = 0;
					self.var_eb3b90d = array::randomize(self.var_eb3b90d);
				}
				self.var_80164102++;
				ai_zombie.var_3128fb28 = self;
				ai_zombie zm_score::function_acaab828();
				ai_zombie callback::function_d8abfc3d(#"on_ai_killed", &on_zombie_killed);
				ai_zombie thread function_b3bf446e(self.var_e15699c4);
				ai_zombie thread function_69503077();
				ai_zombie zombie_utility::set_zombie_run_cycle("sprint");
				ai_zombie.ignore_enemy_count = 1;
				ai_zombie.b_ignore_cleanup = 1;
				ai_zombie.n_id = self.n_id;
			}
		}
		wait(randomfloatrange(1, 1.5));
	}
}

/*
	Name: on_zombie_killed
	Namespace: namespace_a8dddac2
	Checksum: 0xECD147A3
	Offset: 0xC130
	Size: 0x54
	Parameters: 1
	Flags: None
*/
function on_zombie_killed(params)
{
	if(isdefined(self.archetype) && isdefined(self.var_3128fb28))
	{
		self.var_3128fb28 thread function_ba3369d5(self.archetype);
	}
	self.var_3128fb28.var_80164102--;
}

/*
	Name: function_ba3369d5
	Namespace: namespace_a8dddac2
	Checksum: 0xBDB6A1FF
	Offset: 0xC190
	Size: 0xDA
	Parameters: 1
	Flags: None
*/
function function_ba3369d5(str_archetype)
{
	switch(str_archetype)
	{
		case "raz":
		{
			self.var_1bf25a28--;
			break;
		}
		case "zombie_dog":
		{
			self.var_d3ab1e84--;
			break;
		}
		case "mimic":
		{
			self.var_c1e479f3--;
			break;
		}
		case "hash_24f9e195cf2de42":
		{
			self.var_d5fdc9c--;
			break;
		}
		case "avogadro":
		{
			self.var_8e259073--;
			break;
		}
		case "hash_1bc8194446d4722f":
		{
			self.var_ee5dbb09--;
			break;
		}
	}
}

/*
	Name: function_1e31497f
	Namespace: namespace_a8dddac2
	Checksum: 0xDD6C31B
	Offset: 0xC278
	Size: 0x23C
	Parameters: 1
	Flags: None
*/
function function_1e31497f(s_spot)
{
	switch(s_spot.script_noteworthy)
	{
		case "dog_location":
		{
			if(self.var_d3ab1e84 < self.var_1fdd1dc7)
			{
				ai_zombie = namespace_c402654::function_62db7b1c(1, s_spot);
				self.var_d3ab1e84++;
			}
			break;
		}
		case "raz_location":
		{
			if(self.var_1bf25a28 < self.var_33199d58)
			{
				ai_zombie = zm_ai_raz::spawn_single(1, s_spot);
				self.var_1bf25a28++;
			}
			break;
		}
		case "hash_2fe3f22c14b70850":
		{
			if(self.var_d5fdc9c < self.var_6fc405f2)
			{
				ai_zombie = namespace_c80d5389::function_e803632f(1, s_spot);
				self.var_d5fdc9c++;
			}
			break;
		}
		case "mimic":
		{
			if(self.var_c1e479f3 < self.var_5e267965)
			{
				ai_zombie = namespace_14c07d4f::spawn_single(s_spot);
				self.var_c1e479f3++;
			}
			break;
		}
		case "hash_24c829c980982c1":
		{
			if(self.var_8e259073 < self.var_171665a9)
			{
				ai_zombie = namespace_f7516cdf::spawn_single(1, s_spot);
				self.var_8e259073++;
			}
			break;
		}
		case "hash_1bc8194446d4722f":
		{
			if(self.var_ee5dbb09 < self.var_ee4b6df0)
			{
				ai_zombie = namespace_abfee9ba::spawn_single(1, s_spot);
				self.var_ee5dbb09++;
			}
			break;
		}
	}
	wait(0.1);
	if(!isdefined(ai_zombie))
	{
		ai_zombie = zombie_utility::spawn_zombie(self.e_spawner, undefined, array::random(self.var_bde5a19a), level.round_number);
		return ai_zombie;
	}
	return ai_zombie;
}

/*
	Name: function_3b0cf79
	Namespace: namespace_a8dddac2
	Checksum: 0x215DFBB
	Offset: 0xC4C0
	Size: 0x16C
	Parameters: 0
	Flags: None
*/
function function_3b0cf79()
{
	self endon(#"death", #"destroyed");
	level waittill(#"hash_3e765c26047c9f54");
	self flag::clear(#"hash_60b2f597116f5ae");
	self flag::set(#"hash_454130aa51c71a1a");
	foreach(orb in self.var_3758c43e)
	{
		if(isdefined(orb))
		{
			orb dodamage(orb.health, orb.origin);
		}
	}
	wait(0.5);
	self thread function_e17174c2();
	if(!self flag::get(#"destroyed"))
	{
		self function_c821a64a();
	}
}

/*
	Name: function_975ee8a1
	Namespace: namespace_a8dddac2
	Checksum: 0x7F7F6C3E
	Offset: 0xC638
	Size: 0x168
	Parameters: 0
	Flags: None
*/
function function_975ee8a1()
{
	self endon(#"death", #"destroyed");
	while(true)
	{
		n_players = 0;
		foreach(str_zone in self.a_str_zones)
		{
			n_players = n_players + zm_zonemgr::get_players_in_zone(str_zone);
		}
		if(!n_players && self flag::get(#"hash_60b2f597116f5ae"))
		{
			self flag::clear(#"hash_60b2f597116f5ae");
			self flag::set(#"hash_454130aa51c71a1a");
			if(self.var_9bfb3ba)
			{
				self thread function_e17174c2();
			}
		}
		wait(1);
	}
}

/*
	Name: function_d341296a
	Namespace: namespace_a8dddac2
	Checksum: 0x6BD60C9
	Offset: 0xC7A8
	Size: 0xAE
	Parameters: 0
	Flags: None
*/
function function_d341296a()
{
	level endon(#"hash_3e765c26047c9f54");
	self endon(#"death", #"destroyed", #"hash_454130aa51c71a1a");
	while(true)
	{
		self flag::set(#"hash_148b5949f208f189");
		wait(45);
		self flag::clear(#"hash_148b5949f208f189");
		wait(20);
	}
}

/*
	Name: function_e255e996
	Namespace: namespace_a8dddac2
	Checksum: 0x3F647042
	Offset: 0xC860
	Size: 0x302
	Parameters: 0
	Flags: None
*/
function function_e255e996()
{
	self endon(#"death");
	while(true)
	{
		s_result = undefined;
		s_result = self waittill(#"damage");
		if(isplayer(s_result.attacker) && isalive(s_result.attacker) && (is_true(s_result.weapon.name === #"hash_69461751fa492ea4") || is_true(s_result.weapon.name === #"hash_5382c3fae4273fed")))
		{
			if(level.var_90acdb64)
			{
				level.var_90acdb64--;
				if(level.var_90acdb64 < 1)
				{
					level flag::set(#"hash_717f6f193982a127");
				}
			}
			s_result.attacker util::show_hit_marker();
			self thread function_c821a64a();
			v_start = self.origin + vectorscale((0, 0, 1), 50);
			v_end = self.origin - vectorscale((0, 0, 1), 1000);
			a_trace = groundtrace(v_start, v_end, 0, self, 0);
			v_ground = (isdefined(a_trace[#"position"]) ? a_trace[#"position"] : self.origin);
			self.origin = v_ground;
			util::wait_network_frame();
			self connectpaths();
			self thread function_e578b3ec();
			self function_379f0d71();
			self flag::set(#"destroyed");
			level thread function_d4808171(self);
			level thread function_a67ae8c3();
			break;
		}
		else if(isdefined(s_result.amount))
		{
			self.health = self.health + s_result.amount;
		}
	}
}

/*
	Name: function_a67ae8c3
	Namespace: namespace_a8dddac2
	Checksum: 0x4DB2E0B9
	Offset: 0xCB70
	Size: 0xD0
	Parameters: 0
	Flags: None
*/
function function_a67ae8c3()
{
	str_vo = array::random(level.var_d0c221e2);
	arrayremovevalue(level.var_d0c221e2, str_vo);
	foreach(player in function_a1ef346b())
	{
		player thread zm_vo::function_c4303dda(str_vo);
	}
}

/*
	Name: function_c821a64a
	Namespace: namespace_a8dddac2
	Checksum: 0xF73809C5
	Offset: 0xCC48
	Size: 0x15A
	Parameters: 0
	Flags: None
*/
function function_c821a64a()
{
	if(self flag::get(#"destroyed"))
	{
		return;
	}
	self clientfield::set("" + #"hash_4d2911e91cdb1e91", 0);
	switch(self.n_id)
	{
		case 0:
		{
			self setmodel("p9_fxanim_zm_tungsten_dark_aether_crystal_mod");
			self thread scene::play(#"hash_4b3d6ea055c23e20", self);
			break;
		}
		case 1:
		{
			self setmodel("p9_fxanim_zm_tungsten_dark_aether_crystal_street");
			self thread scene::play(#"hash_618e4ae852470b70", self);
			break;
		}
		case 2:
		{
			self setmodel("p9_fxanim_zm_tungsten_dark_aether_crystal_tunnel");
			self thread scene::play(#"hash_6e977fe653263d9f", self);
			break;
		}
	}
}

/*
	Name: function_e578b3ec
	Namespace: namespace_a8dddac2
	Checksum: 0x579CA15B
	Offset: 0xCDB0
	Size: 0x100
	Parameters: 0
	Flags: None
*/
function function_e578b3ec()
{
	level endon(#"hash_22a51e8b22086fc6" + self.n_id);
	wait(0.5);
	while(true)
	{
		var_b8e3924c = function_3d102402(#"hash_5a24c496d257b674", self.origin + vectorscale((0, 0, 1), 40), vectorscale((1, 0, 0), 90), 0);
		waitframe(1);
		if(isdefined(var_b8e3924c))
		{
			var_b8e3924c.n_id = self.n_id;
			var_b8e3924c.script_noteworthy = "crystal_shard";
			var_b8e3924c clientfield::set("" + #"hash_1588c103924da726", 1);
			var_b8e3924c waittill(#"death");
		}
	}
}

/*
	Name: function_379f0d71
	Namespace: namespace_a8dddac2
	Checksum: 0x74D440AB
	Offset: 0xCEB8
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_379f0d71()
{
	level thread zm_utility::function_9ad5aeb1(0, 1, 0, 0);
}

/*
	Name: function_8c6858aa
	Namespace: namespace_a8dddac2
	Checksum: 0xD706318F
	Offset: 0xCEE8
	Size: 0x234
	Parameters: 0
	Flags: None
*/
function function_8c6858aa()
{
	if(isdefined(self.stub.related_parent.n_id))
	{
		level endon(#"hash_1739a8d2d0ccbeb1" + self.stub.related_parent.n_id);
	}
	while(true)
	{
		var_be17187b = undefined;
		var_be17187b = self waittill(#"trigger");
		if(zm_utility::is_player_valid(var_be17187b.activator) && !is_true(var_be17187b.activator.var_c8f9547a))
		{
			var_be17187b.activator namespace_1cc7b406::function_ff9ddbfa(#"hash_7c7d437280e992b", 1);
			var_be17187b.activator.n_id = self.stub.related_parent.n_id;
			var_be17187b.activator.var_c8f9547a = 1;
			self playsound(#"hash_3a2f974f67a11864");
			var_3128fb28 = self.stub.related_parent.var_3128fb28;
			if(isdefined(self.stub.related_parent))
			{
				self.stub.related_parent delete();
			}
			var_3128fb28 thread function_e578b3ec();
			if(!level.var_daabc5cb)
			{
				level.var_daabc5cb = 1;
				level thread namespace_9771a88f::function_d137d6a0(#"hash_6cf88156e2cece4a", #"hash_2179d2c05c59fcd4", #"hash_5ee09ee0c21e867c");
			}
			zm_unitrigger::unregister_unitrigger(self.stub);
			break;
		}
	}
}

/*
	Name: function_20263b9e
	Namespace: namespace_a8dddac2
	Checksum: 0x6441F5F2
	Offset: 0xD128
	Size: 0x12C
	Parameters: 1
	Flags: None
*/
function function_20263b9e(s_params)
{
	if(isdefined(s_params.projectile) && s_params.weapon.name === #"hash_541cbceb633d12a3")
	{
		s_params.projectile endon(#"death");
		s_params.projectile clientfield::set("" + #"hash_73b8798f1d815108", 1);
		self.var_c8f9547a = undefined;
		s_result = undefined;
		s_result = s_params.projectile waittill(#"grenade_bounce");
		s_params.projectile clientfield::set("" + #"hash_73b8798f1d815108", 0);
		waitframe(1);
		if(isdefined(s_params.projectile))
		{
			s_params.projectile delete();
		}
	}
}

/*
	Name: function_7fbe7e0f
	Namespace: namespace_a8dddac2
	Checksum: 0x5B63A8F4
	Offset: 0xD260
	Size: 0xC4
	Parameters: 0
	Flags: None
*/
function function_7fbe7e0f()
{
	self endon(#"death");
	while(true)
	{
		s_result = undefined;
		s_result = self waittill(#"damage");
		if(s_result.weapon.name === #"hash_541cbceb633d12a3" && isdefined(s_result.position))
		{
			if(self function_248b9cef(s_result.position))
			{
				self thread function_d321a931(s_result.attacker);
				break;
			}
		}
	}
}

/*
	Name: function_248b9cef
	Namespace: namespace_a8dddac2
	Checksum: 0xD6F37A26
	Offset: 0xD330
	Size: 0xB8
	Parameters: 1
	Flags: None
*/
function function_248b9cef(v_loc)
{
	foreach(var_6dd77fd0 in self.var_eb56e6b6)
	{
		if(distancesquared(self gettagorigin(var_6dd77fd0), v_loc) <= 900)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_72989645
	Namespace: namespace_a8dddac2
	Checksum: 0x9E3B31FC
	Offset: 0xD3F0
	Size: 0xAC
	Parameters: 0
	Flags: None
*/
function function_72989645()
{
	if(self haspart("tag_fx_jaw_center") || self haspart("tag_fx_jaw_center") || self haspart("tag_fx_jaw_center"))
	{
		self.var_eb56e6b6 = array("tag_fx_jaw_center", "tag_fx_jaw_le", "tag_fx_jaw_ri");
		self thread function_7fbe7e0f();
	}
}

/*
	Name: function_d4808171
	Namespace: namespace_a8dddac2
	Checksum: 0xA29E4DDD
	Offset: 0xD4A8
	Size: 0x11C
	Parameters: 1
	Flags: None
*/
function function_d4808171(var_3128fb28)
{
	v_pos = getclosestpointonnavmesh(array::random(var_3128fb28.var_9e7631bd).origin, 100, 80);
	if(isdefined(v_pos))
	{
		v_spawnpt = v_pos;
	}
	else
	{
		v_spawnpt = var_3128fb28.origin;
	}
	s_spot = spawnstruct();
	s_spot.origin = v_spawnpt;
	var_307ccdbc = zombie_utility::spawn_zombie(level.var_3ec2f5f5, "abom", s_spot, level.round_number);
	wait(0.1);
	if(isdefined(var_307ccdbc))
	{
		var_307ccdbc.ignore_enemy_count = 1;
	}
	s_spot struct::delete();
}

/*
	Name: function_d321a931
	Namespace: namespace_a8dddac2
	Checksum: 0x73C63854
	Offset: 0xD5D0
	Size: 0x196
	Parameters: 1
	Flags: None
*/
function function_d321a931(attacker)
{
	self endon(#"death", #"hash_711423415ecfe2a9");
	if(is_true(self.var_ab398b8b))
	{
		return;
	}
	if(isdefined(attacker.n_id) && level flag::get(#"hash_1739a8d2d0ccbeb1" + attacker.n_id))
	{
		return;
	}
	if(isdefined(attacker.n_id))
	{
		self.ignore_nuke = 1;
		self.var_126d7bef = 1;
		self.b_ignore_cleanup = 1;
		attacker.var_c8f9547a = undefined;
		self.n_id = attacker.n_id;
		self.var_ab398b8b = 1;
		self clientfield::increment("" + #"hash_6f2c45f149dc1e5d");
		self thread function_47104ac4();
		self thread animation::play("aib_t9_zm_abom_swallow_crystal_01");
		if(!level.var_864319a5)
		{
			level.var_864319a5 = 1;
			level thread function_c7695f6f();
		}
		self notify(#"hash_711423415ecfe2a9");
	}
}

/*
	Name: function_c7695f6f
	Namespace: namespace_a8dddac2
	Checksum: 0xEF1FC4BB
	Offset: 0xD770
	Size: 0x4C
	Parameters: 0
	Flags: None
*/
function function_c7695f6f()
{
	wait(0.5);
	level thread namespace_9771a88f::function_d137d6a0(#"hash_41846be30e8383e", #"hash_9e8d134b3da220", #"hash_5963cef798b3fd18");
}

/*
	Name: function_47104ac4
	Namespace: namespace_a8dddac2
	Checksum: 0x3D59BBE4
	Offset: 0xD7C8
	Size: 0x1DC
	Parameters: 0
	Flags: None
*/
function function_47104ac4()
{
	n_id = self.n_id;
	self waittill(#"death");
	v_org = self.origin;
	if(level flag::get(#"hash_1739a8d2d0ccbeb1" + n_id))
	{
		return;
	}
	v_pos = getclosestpointonnavmesh(self.origin, 500, 80);
	wait(0.5);
	if(isdefined(v_pos))
	{
		var_e1622660 = function_3d102402(#"hash_4984ecebcaee2783", v_pos + vectorscale((0, 0, 1), 32), vectorscale((1, 0, 0), 90), 0);
	}
	else
	{
		var_e1622660 = function_3d102402(#"hash_4984ecebcaee2783", v_org + vectorscale((0, 0, 1), 32), vectorscale((1, 0, 0), 90), 0);
	}
	util::wait_network_frame();
	if(isdefined(var_e1622660))
	{
		var_e1622660.n_id = n_id;
		var_e1622660 clientfield::increment("" + #"hash_1b9d966608efb40e");
		var_e1622660 thread function_7e49a9ae();
		level flag::set(#"hash_1739a8d2d0ccbeb1" + n_id);
	}
}

/*
	Name: function_7e49a9ae
	Namespace: namespace_a8dddac2
	Checksum: 0xECEC30BC
	Offset: 0xD9B0
	Size: 0x204
	Parameters: 0
	Flags: None
*/
function function_7e49a9ae()
{
	n_id = self.n_id;
	self waittill(#"death");
	level thread function_8b429de9(n_id);
	wait(function_21a3a673(15, 30));
	var_9e4bdaed = 0;
	a_zombies = getaiarray();
	foreach(zombie in a_zombies)
	{
		if(zombie.aitype === #"hash_39b3550f618c72e8")
		{
			var_9e4bdaed++;
		}
	}
	if(!level flag::get(#"hash_22a51e8b22086fc6" + n_id) && var_9e4bdaed < 2)
	{
		foreach(var_d1d168de in level.var_999868f3)
		{
			if(var_d1d168de.n_id === n_id)
			{
				var_3128fb28 = var_d1d168de;
			}
		}
		if(isdefined(var_3128fb28))
		{
			function_d4808171(var_3128fb28);
		}
	}
}

/*
	Name: function_8b429de9
	Namespace: namespace_a8dddac2
	Checksum: 0x22E2920
	Offset: 0xDBC0
	Size: 0x17C
	Parameters: 1
	Flags: None
*/
function function_8b429de9(n_id)
{
	if(level flag::get(#"hash_1739a8d2d0ccbeb1" + n_id))
	{
		level flag::clear(#"hash_1739a8d2d0ccbeb1" + n_id);
	}
	if(!isdefined(level.var_ff8c3051))
	{
		level.var_ff8c3051 = 1;
		level thread namespace_9771a88f::function_d137d6a0(#"hash_6e60f8d4d0024e8", #"hash_3d4fbc481be0d8ee", #"hash_3bfd98fa2a76515e");
	}
	else if(isdefined(level.var_793ade71) && level.var_793ade71.size > 0)
	{
		n_index = array::random(level.var_793ade71);
		if(isdefined(n_index))
		{
			arrayremovevalue(level.var_793ade71, n_index);
			level thread namespace_9771a88f::function_d137d6a0(#"hash_2f678fab7f6b0fd2" + n_index, #"hash_68f92184143798ea" + n_index, #"hash_13f2461be9ad9ee" + n_index);
		}
	}
}

/*
	Name: function_90996ced
	Namespace: namespace_a8dddac2
	Checksum: 0x20882AE3
	Offset: 0xDD48
	Size: 0x96
	Parameters: 1
	Flags: None
*/
function function_90996ced(player)
{
	if(level flag::get(#"hash_77e125d6f8b2733e"))
	{
		return true;
	}
	if(!level.var_c59392fa)
	{
		level.var_c59392fa = 1;
		level thread namespace_9771a88f::function_d137d6a0(#"hash_2b81b9c79a3e14fa", #"hash_169bb9dc4c056704", #"hash_17786d8ce3c106cc");
	}
	return false;
}

/*
	Name: function_43c88b79
	Namespace: namespace_a8dddac2
	Checksum: 0x40B1544E
	Offset: 0xDDF0
	Size: 0x248
	Parameters: 0
	Flags: None
*/
function function_43c88b79()
{
	while(true)
	{
		var_be17187b = undefined;
		var_be17187b = self waittill(#"trigger");
		if(zm_utility::is_player_valid(var_be17187b.activator) && level flag::get(#"hash_77e125d6f8b2733e"))
		{
			n_id = self.stub.related_parent.n_id;
			level flag::set(#"hash_22a51e8b22086fc6" + n_id);
			level thread function_b6f5ae25();
			foreach(player in getplayers())
			{
				player zm_weapons::weapon_take(level.var_1e477e6c);
				player.var_c8f9547a = undefined;
			}
			if(isdefined(self.stub.related_parent))
			{
				self.stub.related_parent delete();
			}
			level thread function_e408d81(n_id);
			zm_unitrigger::unregister_unitrigger(self.stub);
			break;
		}
		else if(!level.var_c59392fa)
		{
			level.var_c59392fa = 1;
			level thread namespace_9771a88f::function_d137d6a0(#"hash_2b81b9c79a3e14fa", #"hash_169bb9dc4c056704", #"hash_17786d8ce3c106cc");
		}
	}
}

/*
	Name: function_e408d81
	Namespace: namespace_a8dddac2
	Checksum: 0xDB99FF64
	Offset: 0xE040
	Size: 0x110
	Parameters: 1
	Flags: None
*/
function function_e408d81(n_id)
{
	level flag::wait_till(#"hash_22a51e8b22086fc6" + n_id);
	var_60f945b7 = getentarray("crystal_shard", "script_noteworthy");
	foreach(var_94a7f7e1 in var_60f945b7)
	{
		if(var_94a7f7e1.n_id === n_id)
		{
			var_94a7f7e1 notify(#"done");
			if(isdefined(var_94a7f7e1))
			{
				var_94a7f7e1 delete();
			}
		}
	}
}

/*
	Name: function_b6f5ae25
	Namespace: namespace_a8dddac2
	Checksum: 0x33CE6893
	Offset: 0xE158
	Size: 0x104
	Parameters: 0
	Flags: None
*/
function function_b6f5ae25()
{
	level.var_1f7f9ebe++;
	if(level.var_1f7f9ebe > 2)
	{
		zm_vo::function_7622cb70(#"hash_33b8257a9869fa96");
	}
	else
	{
		if(level.var_1f7f9ebe > 1)
		{
			namespace_9771a88f::function_d137d6a0(#"hash_50aa78b55b72fc5", #"hash_33ce49529b635e45", #"hash_626f2a598b399499");
		}
		else
		{
			array::thread_all(function_a1ef346b(), &namespace_4abf1500::collect_intel, #"hash_27e4f92beb53e0c9");
			zm_vo::function_7622cb70(#"hash_752068cdf74086e9");
		}
	}
}

/*
	Name: function_28eb7fe5
	Namespace: namespace_a8dddac2
	Checksum: 0x40578F60
	Offset: 0xE268
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function function_28eb7fe5()
{
	wait(1);
	zm_vo::function_7622cb70(#"hash_794b50df34e72a9a");
}

/*
	Name: function_2a5d8845
	Namespace: namespace_a8dddac2
	Checksum: 0x41128829
	Offset: 0xE2A0
	Size: 0xBC
	Parameters: 1
	Flags: None
*/
function function_2a5d8845(var_3128fb28)
{
	self endon(#"death");
	var_3128fb28 endon(#"death");
	self val::set("crystal_orb", "takedamage", 1);
	self val::set("crystal_orb", "allowdeath", 1);
	self.health = 300;
	self thread function_694e280();
	self thread function_bc91db26();
}

/*
	Name: function_182e8559
	Namespace: namespace_a8dddac2
	Checksum: 0xB3FDA067
	Offset: 0xE368
	Size: 0xEC
	Parameters: 1
	Flags: None
*/
function function_182e8559(str_notify)
{
	if(isdefined(self))
	{
		self.e_fx clientfield::set("" + #"hash_5b48c7bf93fc3a4b", 0);
		self.e_owner notify(#"hash_4da63fe4689abc76");
		if(self.e_owner.var_9bfb3ba < 1)
		{
			self.e_owner flag::set(#"hash_28e0be8a85b0be77");
		}
		wait(0.1);
		if(isdefined(self.e_fx))
		{
			self.e_fx delete();
		}
		if(isdefined(self))
		{
			self delete();
		}
	}
}

/*
	Name: function_694e280
	Namespace: namespace_a8dddac2
	Checksum: 0xCAE5250B
	Offset: 0xE460
	Size: 0x1EE
	Parameters: 0
	Flags: None
*/
function function_694e280()
{
	self endoncallback(&function_182e8559, #"death");
	a_zombies = undefined;
	while(!isdefined(a_zombies))
	{
		a_zombies = getaiteamarray(level.zombie_team);
		foreach(zombie in a_zombies)
		{
			if(zombie.archetype === #"zombie")
			{
				n_health = zombie.health * 2;
			}
		}
	}
	while(true)
	{
		level waittill(#"start_of_round");
		wait(3);
		a_zombies = getaiteamarray(level.zombie_team);
		foreach(zombie in a_zombies)
		{
			if(zombie.archetype === #"zombie")
			{
				n_health = zombie.health * 2;
				break;
			}
		}
		self.health = n_health;
	}
}

/*
	Name: function_bc91db26
	Namespace: namespace_a8dddac2
	Checksum: 0xE65CB3F3
	Offset: 0xE658
	Size: 0x148
	Parameters: 0
	Flags: None
*/
function function_bc91db26()
{
	self endon(#"death");
	level endon(#"hash_3e765c26047c9f54");
	while(isdefined(self) && self.health > 0)
	{
		s_result = undefined;
		s_result = self waittill(#"damage");
		if(isplayer(s_result.attacker) && isalive(s_result.attacker))
		{
			s_result.attacker util::show_hit_marker();
			if(!self.e_owner flag::get(#"hash_60b2f597116f5ae"))
			{
				self.e_owner flag::set(#"hash_60b2f597116f5ae");
			}
			if(!level.var_2961befd)
			{
				level.var_2961befd = 1;
				level thread function_2fa3d84f();
			}
		}
	}
}

/*
	Name: function_2fa3d84f
	Namespace: namespace_a8dddac2
	Checksum: 0x38363BD6
	Offset: 0xE7A8
	Size: 0x110
	Parameters: 0
	Flags: None
*/
function function_2fa3d84f()
{
	str_vo = array::random(array(#"hash_3d72e6f276957956", #"hash_3d72e7f276957b09", #"hash_3d72e4f2769575f0", #"hash_3d72e5f2769577a3", #"hash_3d72eaf276958022"));
	foreach(player in getplayers())
	{
		player thread zm_vo::function_c4303dda(str_vo);
	}
}

/*
	Name: function_cd8e8b80
	Namespace: namespace_a8dddac2
	Checksum: 0x4E633D16
	Offset: 0xE8C0
	Size: 0x142
	Parameters: 2
	Flags: None
*/
function function_cd8e8b80(var_181a390b, var_b7eee573)
{
	self endon(#"death");
	var_b7eee573 endon(#"death");
	var_181a390b endon(#"death");
	self.n_rate = 1;
	var_b7eee573.e_fx clientfield::set("" + #"hash_5b48c7bf93fc3a4b", 1);
	var_b7eee573.e_fx linkto(var_b7eee573, undefined, vectorscale((0, 0, 1), 18));
	wait(var_181a390b.n_delay);
	while(true)
	{
		if(!var_181a390b.n_delay)
		{
			var_181a390b rotateroll(-90, self.n_rate);
		}
		else
		{
			var_181a390b rotateroll(90, self.n_rate);
		}
		wait(self.n_rate - 0.05);
	}
}

/*
	Name: function_dd0ca999
	Namespace: namespace_a8dddac2
	Checksum: 0xDF27F233
	Offset: 0xEA10
	Size: 0x54
	Parameters: 1
	Flags: None
*/
function function_dd0ca999(b_skipped)
{
	if(b_skipped)
	{
		return;
	}
	level flag::wait_till(#"hash_45d1ea5a016b7916");
	/#
		iprintlnbold("");
	#/
}

/*
	Name: function_73076ac9
	Namespace: namespace_a8dddac2
	Checksum: 0x26BFB978
	Offset: 0xEA70
	Size: 0xEC
	Parameters: 2
	Flags: None
*/
function function_73076ac9(b_skipped, var_19e802fa)
{
	if(b_skipped || var_19e802fa)
	{
		level flag::set(#"hash_331ca6d639f4883d");
		level flag::set(#"hash_21844688fcfdffe4");
		level flag::set(#"hash_717f6f193982a127");
		level flag::set(#"hash_45d1ea5a016b7916");
		level namespace_6747c550::function_7df6bb60(#"hash_4273532945cef4b0", 4);
	}
	level flag::set(#"hash_45d1ea5a016b7916");
}

/*
	Name: function_faee663e
	Namespace: namespace_a8dddac2
	Checksum: 0xA61B345
	Offset: 0xEB68
	Size: 0xB4
	Parameters: 1
	Flags: None
*/
function function_faee663e(b_skipped)
{
	if(b_skipped)
	{
		return;
	}
	level thread function_f03b2c72();
	level thread function_2073cf2f();
	level thread function_d4c62e3d();
	level thread function_7b087186();
	level flag::wait_till(#"hash_33aac7e159ca8f89");
	/#
		iprintlnbold("");
	#/
}

/*
	Name: function_e0567b44
	Namespace: namespace_a8dddac2
	Checksum: 0x9C6618A8
	Offset: 0xEC28
	Size: 0x5C
	Parameters: 2
	Flags: None
*/
function function_e0567b44(b_skipped, var_19e802fa)
{
	if(b_skipped || var_19e802fa)
	{
		/#
			namespace_95c839d1::function_14a35d6f();
		#/
	}
	level flag::set(#"hash_33aac7e159ca8f89");
}

/*
	Name: function_71926382
	Namespace: namespace_a8dddac2
	Checksum: 0x5C8D5BA4
	Offset: 0xEC90
	Size: 0x148
	Parameters: 0
	Flags: None
*/
function function_71926382()
{
	level flag::wait_till(#"start_zombie_round_logic");
	zm_crafting::function_d1f16587("ztable_tungsten_neutralizer_device", &function_65b074ce);
	level flag::wait_till_all(array(#"hash_21844688fcfdffe4", #"hash_45d1ea5a016b7916"));
	level thread function_be62f260();
	foreach(player in getplayers())
	{
		zm_items::player_pick_up(player, zm_crafting::function_4c2f8683("zitem_tungsten_neutralizer_device_zm"));
	}
}

/*
	Name: function_7d260d0
	Namespace: namespace_a8dddac2
	Checksum: 0x4BF51F95
	Offset: 0xEDE0
	Size: 0x78
	Parameters: 1
	Flags: None
*/
function function_7d260d0(player)
{
	if(level flag::get(#"hash_45d1ea5a016b7916"))
	{
		self sethintstring(#"hash_57381e8243f9e1d4");
		return true;
	}
	self sethintstring(#"hash_64cb545dd18c607");
	return true;
}

/*
	Name: function_65b074ce
	Namespace: namespace_a8dddac2
	Checksum: 0xED43F5ED
	Offset: 0xEE68
	Size: 0xA4
	Parameters: 1
	Flags: None
*/
function function_65b074ce(e_crafter)
{
	unitrigger_stub = self.stub;
	var_66bc7a53 = struct::get(self.target);
	level thread function_ada90340();
	while(!isdefined(level.var_90016943))
	{
		waitframe(1);
	}
	level.var_90016943 zm_unitrigger::create(#"hash_75d22fd1a57d9a99", 80, &function_d89378e);
}

/*
	Name: function_d89378e
	Namespace: namespace_a8dddac2
	Checksum: 0x79628D66
	Offset: 0xEF18
	Size: 0xC4
	Parameters: 0
	Flags: None
*/
function function_d89378e()
{
	level flag::wait_till(#"hash_22e95ce422f36713");
	level.var_90016943 thread function_1ddf7c10("tag_screen_full");
	level.var_90016943 clientfield::set("" + #"hash_77d7a6f3a8842303", 1);
	level.var_90016943 thread zm_vo::function_d6f8bbd9(#"hash_1550c0af5e37322b", undefined, undefined, 1);
	zm_unitrigger::unregister_unitrigger(self.stub);
}

/*
	Name: function_be62f260
	Namespace: namespace_a8dddac2
	Checksum: 0x34F4EBA5
	Offset: 0xEFE8
	Size: 0x21C
	Parameters: 0
	Flags: None
*/
function function_be62f260()
{
	while(true)
	{
		waitresult = undefined;
		waitresult = level waittill(#"hash_356be6a8a0b0668d");
		if(waitresult.unitrigger.target === "device")
		{
			break;
		}
	}
	zm_vo::function_7622cb70(#"hash_3db24cc3d4d62abd");
	zm_vo::function_7622cb70(#"hash_643db03576bae4af");
	playsoundatposition(#"hash_4b5114dc3a728de3", (5713, 5999, 935));
	exploder::exploder("lgt_fx_tower_explosion");
	wait(0.1);
	foreach(player in function_a1ef346b())
	{
		playrumbleonposition("sr_prototype_generator_explosion", player.origin);
	}
	wait(1);
	namespace_9771a88f::function_d137d6a0(#"hash_7aec9a847d0d9dee", #"hash_70cddb474ae3cad0", #"hash_643f7116d93e2ba8");
	wait(0.5);
	zm_vo::function_7622cb70(#"hash_49e005837257928b");
	level flag::set(#"hash_22e95ce422f36713");
}

/*
	Name: function_ada90340
	Namespace: namespace_a8dddac2
	Checksum: 0xE7743CA5
	Offset: 0xF210
	Size: 0x236
	Parameters: 0
	Flags: None
*/
function function_ada90340()
{
	var_66bc7a53 = struct::get("device");
	var_8a5cde88 = getent("vehicle_device", "targetname");
	level.var_fdf0d3fc = spawnvehicle(#"fake_vehicle", var_8a5cde88.origin, var_8a5cde88.angles);
	waitframe(1);
	level.var_fdf0d3fc thread function_dd5a203f();
	if(isdefined(var_66bc7a53))
	{
		level.var_90016943 = util::spawn_model(#"hash_2730e79c7f028537", var_66bc7a53.origin, var_66bc7a53.angles);
	}
	waitframe(1);
	level.var_90016943 function_619a5c20();
	level.var_90016943 clientfield::increment("" + #"hash_4b03e692ae3dfa64");
	level.var_90016943 thread function_bc4f36d7();
	level.var_90016943.var_401b92e8 = array("tag_screen_25", "tag_screen_50", "tag_screen_full", "tag_screen_less");
	array::thread_all(function_a1ef346b(), &namespace_4abf1500::collect_intel, #"hash_48b4bb2df294d31");
	level flag::wait_till(#"hash_22e95ce422f36713");
	var_c809fcdc = level.var_90016943 zm_unitrigger::create(#"hash_1f74c6e83a487cab", 80, &function_24a32a6d);
}

/*
	Name: function_dd5a203f
	Namespace: namespace_a8dddac2
	Checksum: 0x935AFD83
	Offset: 0xF450
	Size: 0x16C
	Parameters: 0
	Flags: None
*/
function function_dd5a203f()
{
	self.var_aa4b496 = 0;
	self.var_265cb589 = 1;
	self.var_a123c71 = 0;
	s_door = struct::get("interact_door_town_square");
	self.str_zone = "zone_main_street_tunnel";
	var_b4e8228c = struct::get_array("zone_main_street_tunnel_02_spawns");
	var_e271c42 = struct::get_array("zone_main_street_03_spawns");
	var_d73d2e6f = struct::get_array("zone_main_street_04_spawns");
	var_1fe91dac = arraycombine(var_e271c42, var_b4e8228c);
	var_32174208 = arraycombine(var_1fe91dac, var_d73d2e6f);
	var_c61e7ea7 = level.zones[self.str_zone];
	self.var_eb3b90d = var_32174208;
	self vehicle::get_on_path(getvehiclenode("node_start_device", "targetname"));
	self thread function_df4e6f32();
}

/*
	Name: function_df4e6f32
	Namespace: namespace_a8dddac2
	Checksum: 0x579A4C96
	Offset: 0xF5C8
	Size: 0xAE
	Parameters: 0
	Flags: None
*/
function function_df4e6f32()
{
	self endon(#"death", #"reached_end_node");
	var_f2bbbcb4 = struct::get_array("zone_main_street_tunnel_spawns");
	var_b4e8228c = struct::get_array("zone_main_street_tunnel_02_spawns");
	var_1fe91dac = arraycombine(var_f2bbbcb4, var_b4e8228c);
	self waittill(#"switch");
	self.var_eb3b90d = var_1fe91dac;
}

/*
	Name: function_24a32a6d
	Namespace: namespace_a8dddac2
	Checksum: 0x500B8A42
	Offset: 0xF680
	Size: 0xA4
	Parameters: 0
	Flags: None
*/
function function_24a32a6d()
{
	while(true)
	{
		var_be17187b = undefined;
		var_be17187b = self waittill(#"trigger");
		if(zm_utility::is_player_valid(var_be17187b.activator))
		{
			level.var_fdf0d3fc thread function_c02f8acc();
			level thread revive_players();
			zm_unitrigger::unregister_unitrigger(self.stub);
			break;
		}
	}
}

/*
	Name: function_c8b3217e
	Namespace: namespace_a8dddac2
	Checksum: 0x237A291F
	Offset: 0xF730
	Size: 0x13C
	Parameters: 0
	Flags: None
*/
function function_c8b3217e()
{
	self endon(#"death");
	while(true)
	{
		if(self.var_a5c9efc1 === 1)
		{
			n_dist = 250000;
		}
		else
		{
			if(self.var_a5c9efc1 === 2)
			{
				n_dist = 140625;
			}
			else
			{
				n_dist = 62500;
			}
		}
		foreach(player in function_a1ef346b())
		{
			if(distance2dsquared(player.origin, self.origin) <= n_dist)
			{
				player.var_99582f14 = 1;
				continue;
			}
			player.var_99582f14 = 0;
		}
		wait(0.25);
	}
}

/*
	Name: function_1e2224f5
	Namespace: namespace_a8dddac2
	Checksum: 0xA4FE8394
	Offset: 0xF878
	Size: 0x120
	Parameters: 0
	Flags: None
*/
function function_1e2224f5()
{
	self endon(#"death");
	level endon(#"hash_5c1b510c0cd18144");
	var_48f01f34 = 1;
	var_e26a4af6 = 1;
	while(true)
	{
		if(self.var_1105889c >= 0.7 && self.var_1105889c < 0.85 && var_48f01f34)
		{
			var_e26a4af6 = 1;
			var_48f01f34 = 0;
			self zm_vo::function_d6f8bbd9(#"hash_285aea366a26cbe5");
		}
		if(self.var_1105889c >= 0.4 && self.var_1105889c < 0.6 && var_e26a4af6)
		{
			var_e26a4af6 = 0;
			var_48f01f34 = 1;
			self zm_vo::function_d6f8bbd9(#"hash_6e7b57447c9db2fa");
		}
		wait(0.1);
	}
}

/*
	Name: function_c02f8acc
	Namespace: namespace_a8dddac2
	Checksum: 0x6271C7D5
	Offset: 0xF9A0
	Size: 0x930
	Parameters: 0
	Flags: None
*/
function function_c02f8acc()
{
	self endon(#"death");
	level.var_90016943 endon(#"death");
	n_zombies = level.zombie_ai_limit;
	level flag::clear("spawn_zombies");
	self playsound(#"hash_50a878a81f6971b3");
	self.var_a123c71 = 0;
	self.var_f8edfabd = 0;
	self.var_59078fae = 0;
	self.var_de319661 = 100;
	self.var_fce6b9f4 = 100;
	self.str_zone = zm_zonemgr::get_zone_from_position(self.origin, 1, 1);
	level clientfield::set("" + #"hash_5a36f05cbdf2580", 12);
	level thread namespace_c097de49::function_8f85d169();
	music::setmusicstate("escort");
	level.var_90016943 thread function_c8b3217e();
	level.var_90016943.var_a5c9efc1 = 1;
	level.var_90016943 movez(40, 2);
	wait(1.95);
	level.var_90016943 moveto(self.origin, 3);
	level.var_90016943 clientfield::set("" + #"hash_6ba3e6fd544c34a5", 1);
	level.var_90016943 playsound(#"hash_7ef122464223c4c5");
	wait(0.5);
	level thread zm_utility::function_9ad5aeb1(0, 1, 0, 0);
	level flag::set(#"in_dark_side");
	playrumbleonposition("sr_prototype_generator_explosion", level.var_90016943.origin);
	var_aaa9a919 = getent("main_street_clip", "targetname");
	var_aaa9a919 connectpaths();
	var_e87b7ad1 = getent("mainstreet_debris", "targetname");
	var_e87b7ad1 thread scene::play(#"hash_49d9e1d456ebd4a9", var_e87b7ad1);
	level flag::set("main_street_tunnel_open");
	wait(0.1);
	var_aaa9a919 delete();
	level.var_90016943 waittill(#"movedone");
	waitframe(1);
	level.var_90016943 linkto(self, undefined, (0, 0, 0), vectorscale((0, -1, 0), 90));
	level.var_90016943.e_parent = self;
	wait(0.1);
	level.var_90016943 thread function_28eb7fe5();
	self setspeedimmediate(0);
	self thread vehicle::go_path();
	self thread function_b2897fd3();
	self thread function_bc00d546();
	self thread function_5732ebe3();
	self.var_cd2c36da = spawn("trigger_radius_use", self.origin + vectorscale((0, 0, 1), 16), 0, 80, 80, 1);
	self.var_cd2c36da setcursorhint("HINT_NOICON");
	self.var_cd2c36da usetriggerrequirelookat(1);
	self.var_cd2c36da triggerignoreteam();
	self.var_cd2c36da enablelinkto();
	self.var_cd2c36da linkto(self, "tag_origin");
	self.var_cd2c36da thread function_7d757c5b();
	self thread function_83c7caee();
	level thread zm_utility::function_9ad5aeb1(1, 1, 1, 0);
	wait(1);
	foreach(player in getplayers())
	{
		player.var_45ef153 = 1;
		player.var_1a4a768c = 1;
	}
	level.var_90016943 thread function_1e2224f5();
	self thread function_95015f9a(n_zombies);
	while(true)
	{
		self.var_f4bd7934 = 1;
		self.n_players = 0;
		if(level.var_90016943.var_a5c9efc1 === 1)
		{
			n_dist = 250000;
		}
		else
		{
			if(level.var_90016943.var_a5c9efc1 === 2)
			{
				n_dist = 140625;
			}
			else
			{
				n_dist = 62500;
			}
		}
		foreach(player in function_a1ef346b())
		{
			if(distance2dsquared(player.origin, self.origin) > n_dist || !zm_utility::is_player_valid(player))
			{
				self.var_f4bd7934 = 0;
			}
		}
		wait(0.25);
		if(!self.var_f4bd7934 || is_true(self.abnormal_status.emped) || !self.var_fce6b9f4)
		{
			self setspeed(0, 5, 3);
			self notify(#"hash_4e0c5de3e24d5af8");
			if(is_true(self.var_a123c71))
			{
				self playsound(#"hash_5680f14366ba7aa5");
				self.var_a123c71 = 0;
			}
		}
		else
		{
			self notify(#"hash_d2f2236898d7b64");
			self setspeed(3, 2, 1);
			if(!is_true(self.var_a123c71))
			{
				self playsound(#"hash_523a36c12a3dc59d");
				self.var_a123c71 = 1;
			}
			if(self.var_fce6b9f4)
			{
				self.var_fce6b9f4 = self.var_fce6b9f4 - 1;
			}
			if(self.var_59078fae)
			{
				self.var_59078fae = 0;
				self connectpaths();
			}
		}
	}
}

/*
	Name: function_7d757c5b
	Namespace: namespace_a8dddac2
	Checksum: 0xA4EFB3BB
	Offset: 0x102D8
	Size: 0x112
	Parameters: 0
	Flags: None
*/
function function_7d757c5b()
{
	level endon(#"hash_5c1b510c0cd18144");
	while(true)
	{
		foreach(player in function_a1ef346b())
		{
			if(is_true(player.var_a74ce90c))
			{
				self sethintstringforplayer(player, #"hash_3469f9b4e1b6241d");
				continue;
			}
			self sethintstringforplayer(player, "");
		}
		waitframe(1);
	}
}

/*
	Name: function_83c7caee
	Namespace: namespace_a8dddac2
	Checksum: 0x215AA57F
	Offset: 0x103F8
	Size: 0x2A6
	Parameters: 0
	Flags: None
*/
function function_83c7caee()
{
	level endon(#"hash_5c1b510c0cd18144");
	self endon(#"death", #"reached_end_node");
	while(true)
	{
		s_result = undefined;
		s_result = self.var_cd2c36da waittill(#"trigger");
		if(zm_utility::is_player_valid(s_result.activator) && is_true(s_result.activator.var_a74ce90c))
		{
			level.var_90016943 clientfield::increment("" + #"hash_2ad0f9c6cbc5eed");
			s_result.activator.var_a74ce90c = undefined;
			if(s_result.activator clientfield::get_to_player("" + #"hash_1509a2aa5d40a44c"))
			{
				s_result.activator clientfield::set_to_player("" + #"hash_1509a2aa5d40a44c", 0);
			}
			s_result.activator function_bc82f900("damage_heavy");
			if(!level.var_90016943.e_parent.var_fce6b9f4)
			{
				level.var_90016943 thread zm_vo::function_d6f8bbd9(#"hash_2f866dec2871d934");
			}
			if(level.var_90016943.e_parent.var_fce6b9f4 < level.var_90016943.e_parent.var_de319661)
			{
				level.var_90016943.e_parent.var_fce6b9f4 = level.var_90016943.e_parent.var_fce6b9f4 + 40;
				if(level.var_90016943.e_parent.var_fce6b9f4 > level.var_90016943.e_parent.var_de319661)
				{
					level.var_90016943.e_parent.var_fce6b9f4 = level.var_90016943.e_parent.var_de319661;
				}
			}
		}
	}
}

/*
	Name: function_5732ebe3
	Namespace: namespace_a8dddac2
	Checksum: 0xC658A085
	Offset: 0x106A8
	Size: 0xBC
	Parameters: 0
	Flags: None
*/
function function_5732ebe3()
{
	self endon(#"death");
	self waittill(#"quarter");
	zm_vo::function_7622cb70(#"hash_a4d87c4b79e93d");
	self waittill(#"half");
	zm_vo::function_7622cb70(#"hash_93d57c4b6b70f1");
	self waittill(#"hash_13c0437f438490d8");
	zm_vo::function_7622cb70(#"hash_9ac47c4b7172bc");
}

/*
	Name: function_bc00d546
	Namespace: namespace_a8dddac2
	Checksum: 0xE5F8A993
	Offset: 0x10770
	Size: 0x344
	Parameters: 0
	Flags: None
*/
function function_bc00d546()
{
	self endon(#"death");
	self waittill(#"reached_end_node");
	level notify(#"hash_5c1b510c0cd18144");
	level flag::set(#"hash_5c1b510c0cd18144");
	str_zone = zm_zonemgr::get_zone_from_position(self.origin, 1, 1);
	foreach(player in getplayers())
	{
		if(player clientfield::get_to_player("" + #"hash_1509a2aa5d40a44c"))
		{
			player clientfield::set_to_player("" + #"hash_1509a2aa5d40a44c", 0);
		}
	}
	level thread zm_utility::function_9ad5aeb1(0, 1, 0, 0);
	music::setmusicstate("");
	level.var_90016943 clientfield::set("" + #"hash_6ba3e6fd544c34a5", 0);
	level.var_90016943 clientfield::set("" + #"hash_77d7a6f3a8842303", 0);
	level.var_90016943 playsound(#"hash_1c8b9b9e4a1275c1");
	level.var_90016943 unlink();
	wait(3);
	level.var_90016943 playsound(#"hash_7053c73b9bb95889");
	level.var_90016943 physicslaunch(level.var_90016943 gettagorigin("tag_monitor"), (-5, -25, 5));
	level.var_90016943 thread zm_vo::function_d6f8bbd9(#"hash_50b84c7dd7bfb1e3");
	level.var_90016943 thread function_1ddf7c10("tag_screen_less");
	level flag::wait_till(#"hash_1a21f991103bbd5d");
	level thread function_5deffb2();
}

/*
	Name: function_b2897fd3
	Namespace: namespace_a8dddac2
	Checksum: 0x6350287
	Offset: 0x10AC0
	Size: 0x2E8
	Parameters: 0
	Flags: None
*/
function function_b2897fd3()
{
	self endon(#"death", #"reached_end_node");
	var_1105889c = self.var_fce6b9f4 / self.var_de319661;
	while(true)
	{
		wait(1);
		var_1105889c = self.var_fce6b9f4 / self.var_de319661;
		level.var_90016943.var_1105889c = var_1105889c;
		if(var_1105889c > 0.5)
		{
			if((level.var_90016943 clientfield::get("" + #"hash_6ba3e6fd544c34a5")) !== 1)
			{
				level.var_90016943 clientfield::set("" + #"hash_6ba3e6fd544c34a5", 1);
				level.var_90016943.var_a5c9efc1 = 1;
				level.var_90016943 thread function_1ddf7c10("tag_screen_full");
			}
		}
		else
		{
			if(var_1105889c <= 0.5 && var_1105889c >= 0.25)
			{
				if((level.var_90016943 clientfield::get("" + #"hash_6ba3e6fd544c34a5")) !== 2)
				{
					level.var_90016943 clientfield::set("" + #"hash_6ba3e6fd544c34a5", 2);
					level.var_90016943.var_a5c9efc1 = 2;
					level.var_90016943 thread function_1ddf7c10("tag_screen_50");
				}
			}
			else
			{
				if(var_1105889c > 0)
				{
					if((level.var_90016943 clientfield::get("" + #"hash_6ba3e6fd544c34a5")) !== 3)
					{
						level.var_90016943 clientfield::set("" + #"hash_6ba3e6fd544c34a5", 3);
						level.var_90016943.var_a5c9efc1 = 3;
						level.var_90016943 thread function_1ddf7c10("tag_screen_25");
					}
				}
				else
				{
					level.var_90016943 thread function_1ddf7c10("tag_screen_less");
				}
			}
		}
	}
}

/*
	Name: function_95015f9a
	Namespace: namespace_a8dddac2
	Checksum: 0x621DC080
	Offset: 0x10DB0
	Size: 0x1E8
	Parameters: 1
	Flags: None
*/
function function_95015f9a(n_zombies)
{
	self endon(#"death", #"reached_end_node");
	self.var_eb3b90d = array::randomize(self.var_eb3b90d);
	i = 0;
	while(true)
	{
		s_spawnpt = self.var_eb3b90d[i];
		if(isdefined(s_spawnpt) && function_e1403814() < n_zombies)
		{
			ai_zombie = zombie_utility::spawn_zombie(function_7002478(), undefined, s_spawnpt, level.round_number);
		}
		wait(0.1);
		if(isdefined(ai_zombie))
		{
			i++;
			ai_zombie thread zm_score::function_acaab828();
			ai_zombie clientfield::increment("" + #"hash_11839f68b17da97a");
			ai_zombie.ignore_enemy_count = 1;
			if(ai_zombie.zombie_move_speed !== "super_sprint")
			{
				ai_zombie zombie_utility::set_zombie_run_cycle("sprint");
			}
			if(i >= self.var_eb3b90d.size)
			{
				i = 0;
				self.var_eb3b90d = array::randomize(self.var_eb3b90d);
				wait(5);
			}
		}
		wait(randomfloatrange(0.5, 1));
	}
}

/*
	Name: function_d4c62e3d
	Namespace: namespace_a8dddac2
	Checksum: 0xDE8B42EA
	Offset: 0x10FA0
	Size: 0x138
	Parameters: 0
	Flags: None
*/
function function_d4c62e3d()
{
	var_d56fdb6 = struct::get_array(#"hash_8b320c6cb413f97");
	level.var_99018b7a = [];
	for(i = 0; i < var_d56fdb6.size; i++)
	{
		level.var_99018b7a[level.var_99018b7a.size] = util::spawn_model(var_d56fdb6[i].model, var_d56fdb6[i].origin, var_d56fdb6[i].angles);
	}
	wait(0.1);
	foreach(var_3128fb28 in level.var_99018b7a)
	{
		var_3128fb28 thread function_843a2c7e();
	}
}

/*
	Name: function_843a2c7e
	Namespace: namespace_a8dddac2
	Checksum: 0x26A9E8D5
	Offset: 0x110E0
	Size: 0x10C
	Parameters: 0
	Flags: None
*/
function function_843a2c7e()
{
	self endon(#"death");
	self val::set(#"hash_7215c772b9355b8f", "takedamage", 1);
	self.health = 5;
	self clientfield::set("" + #"hash_54a76d632c7c51", 1);
	if(self.script_int === 1)
	{
		str_scene = "p9_zm_gold_sur_crystal_medium_01_bundle";
		self.death_model = #"p9_sur_crystal_medium_01_dmg";
	}
	else
	{
		str_scene = "p9_zm_gold_sur_crystal_medium_02_bundle";
		self.death_model = #"p9_sur_crystal_medium_02_dmg";
	}
	self thread scene::play(str_scene, self);
	level thread function_8265e656(self);
}

/*
	Name: function_8265e656
	Namespace: namespace_a8dddac2
	Checksum: 0x341538C7
	Offset: 0x111F8
	Size: 0x12C
	Parameters: 1
	Flags: None
*/
function function_8265e656(var_3128fb28)
{
	var_3128fb28 endon(#"death");
	var_3128fb28 callback::function_d8abfc3d(#"hash_5f0caa4b2d44fedf", &function_1cabf2e9);
	while(isdefined(var_3128fb28) && var_3128fb28.health > 0)
	{
		s_result = undefined;
		s_result = var_3128fb28 waittill(#"damage", #"death");
		if(isplayer(s_result.attacker) && isalive(s_result.attacker))
		{
			s_result.attacker util::show_hit_marker();
		}
	}
	var_3128fb28 callback::callback(#"hash_5f0caa4b2d44fedf", s_result);
}

/*
	Name: function_1cabf2e9
	Namespace: namespace_a8dddac2
	Checksum: 0x2E757633
	Offset: 0x11330
	Size: 0x10C
	Parameters: 1
	Flags: None
*/
function function_1cabf2e9(s_result)
{
	if(isplayer(s_result.attacker) || isai(s_result.attacker) || isvehicle(s_result.attacker))
	{
		if(isdefined(self))
		{
			self setmodel(self.death_model);
			self connectpaths();
			self thread function_84ddb230();
			self clientfield::set("" + #"hash_54a76d632c7c51", 0);
			playsoundatposition(#"hash_54c5c342b84cf845", self.origin);
		}
	}
}

/*
	Name: function_84ddb230
	Namespace: namespace_a8dddac2
	Checksum: 0x77D7DB94
	Offset: 0x11448
	Size: 0x94
	Parameters: 0
	Flags: None
*/
function function_84ddb230()
{
	var_b8e3924c = function_3d102402(#"hash_2b899cf380ab5725", self.origin + vectorscale((0, 0, 1), 32), vectorscale((1, 0, 0), 90), 0);
	waitframe(1);
	if(isdefined(var_b8e3924c))
	{
		var_b8e3924c clientfield::increment("" + #"hash_1b9d966608efb40e");
	}
}

/*
	Name: function_e655e275
	Namespace: namespace_a8dddac2
	Checksum: 0xCEDC3108
	Offset: 0x114E8
	Size: 0xBC
	Parameters: 0
	Flags: None
*/
function function_e655e275()
{
	self endon(#"death");
	var_d420f7c5 = util::spawn_model(#"hash_e05c1b39403d7b2");
	if(self haspart("tag_stowed_back"))
	{
		var_d420f7c5 linkto(self, "tag_stowed_back");
	}
	else
	{
		var_d420f7c5 linkto(self, undefined, (-12, 0, 45), vectorscale((-1, 0, 0), 5));
	}
}

/*
	Name: function_7b087186
	Namespace: namespace_a8dddac2
	Checksum: 0xE026AC22
	Offset: 0x115B0
	Size: 0xAC
	Parameters: 0
	Flags: None
*/
function function_7b087186()
{
	level flag::wait_till(#"hash_5c1b510c0cd18144");
	revive_players();
	trigger::wait_till("trigger_tunnel_end");
	var_c89beff = getent("clip_tunnel_end", "targetname");
	var_c89beff setvisibletoall();
	level flag::set(#"hash_1a21f991103bbd5d");
}

/*
	Name: function_3eb5183
	Namespace: namespace_a8dddac2
	Checksum: 0x94668392
	Offset: 0x11668
	Size: 0x594
	Parameters: 0
	Flags: None
*/
function function_3eb5183()
{
	var_c1f80780 = struct::get_array(#"hash_6ed57be36f241c4e");
	var_7594f81c = struct::get_array(#"hash_564a02bdac4a92fd");
	foreach(var_54961156 in var_c1f80780)
	{
		var_d0d7a17e = util::spawn_model(var_54961156.model, var_54961156.origin, var_54961156.angles);
		waitframe(1);
		if(isdefined(var_d0d7a17e))
		{
			var_d0d7a17e clientfield::set("" + #"hash_55456562f670860", 1);
		}
	}
	foreach(var_49af023b in var_7594f81c)
	{
		var_9ff72f0c = util::spawn_model(var_49af023b.model, var_49af023b.origin, var_49af023b.angles);
		waitframe(1);
		if(isdefined(var_9ff72f0c))
		{
			var_9ff72f0c clientfield::set("" + #"hash_55456562f670860", 1);
			var_9ff72f0c.targetname = "phase_wall";
		}
	}
	var_e74b3eec = struct::get(#"hash_1afd80bc27a25ca1");
	var_a450be6b = struct::get(#"hash_6ddb42502a4c85b6");
	var_f5adc5bf = util::spawn_model(var_e74b3eec.model, var_e74b3eec.origin, var_e74b3eec.angles);
	var_97ed3bd6 = util::spawn_model(var_a450be6b.model, var_a450be6b.origin, var_a450be6b.angles);
	waitframe(1);
	if(isdefined(var_f5adc5bf))
	{
		var_f5adc5bf clientfield::set("" + #"hash_55456562f670860", 1);
	}
	if(isdefined(var_97ed3bd6))
	{
		var_97ed3bd6 clientfield::set("" + #"hash_55456562f670860", 1);
	}
	level flag::wait_till(#"hash_33aac7e159ca8f89");
	var_c89beff = getent("clip_tunnel_end", "targetname");
	var_4c979c5b = getentarray("phase_wall", "targetname");
	if(isdefined(var_f5adc5bf))
	{
		var_f5adc5bf delete();
	}
	if(isdefined(var_97ed3bd6))
	{
		var_97ed3bd6 delete();
	}
	wait(10);
	var_c89beff movey(-746, 10);
	foreach(var_b7e0b1c0 in var_4c979c5b)
	{
		var_b7e0b1c0 movey(-746, 15);
	}
	var_c89beff waittill(#"movedone");
	level.var_c79d163e movez(-230, 6);
	level.var_c79d163e waittill(#"movedone");
	level.var_c79d163e thread function_b42e11c3();
	if(isdefined(var_d0d7a17e))
	{
		var_d0d7a17e delete();
	}
	if(isdefined(var_9ff72f0c))
	{
		var_9ff72f0c delete();
	}
}

/*
	Name: function_b42e11c3
	Namespace: namespace_a8dddac2
	Checksum: 0x5527D571
	Offset: 0x11C08
	Size: 0x150
	Parameters: 0
	Flags: None
*/
function function_b42e11c3()
{
	a_players = function_a1ef346b();
	foreach(player in a_players)
	{
		if(player.origin[1] >= self.origin[1])
		{
			player thread lui::screen_flash(1, 1, 0.5, 1, (1, 1, 1));
			wait(1);
			player setorigin((player.origin[0], self.origin[1] - 200, player.origin[2]));
			player setplayerangles(vectorscale((0, 1, 0), 270));
		}
	}
}

/*
	Name: function_5deffb2
	Namespace: namespace_a8dddac2
	Checksum: 0x233A690F
	Offset: 0x11D60
	Size: 0x5E
	Parameters: 0
	Flags: None
*/
function function_5deffb2()
{
	s_door = struct::get("interact_door_town_square");
	var_1ecccb40 = s_door zm_unitrigger::create(#"hash_5c200a5697d4b52a", 50, &function_c55d06d8);
}

/*
	Name: function_c55d06d8
	Namespace: namespace_a8dddac2
	Checksum: 0x651B39A9
	Offset: 0x11DC8
	Size: 0x11C
	Parameters: 0
	Flags: None
*/
function function_c55d06d8()
{
	while(true)
	{
		var_be17187b = undefined;
		var_be17187b = self waittill(#"trigger");
		if(zm_utility::is_player_valid(var_be17187b.activator))
		{
			foreach(player in getplayers())
			{
				player.var_45ef153 = 0;
				player.var_1a4a768c = 0;
			}
			level.var_c79d163e thread function_59bed7ab();
			zm_unitrigger::unregister_unitrigger(self.stub);
			break;
		}
	}
}

/*
	Name: function_59bed7ab
	Namespace: namespace_a8dddac2
	Checksum: 0xCD84124D
	Offset: 0x11EF0
	Size: 0xCC
	Parameters: 0
	Flags: None
*/
function function_59bed7ab()
{
	self movez(230, 6);
	self playsound(#"hash_61e120ca9d9d409f");
	self connectpaths();
	level thread namespace_c097de49::function_8f85d169();
	music::setmusicstate("boss_part1");
	level flag::clear(#"in_dark_side");
	level flag::set(#"hash_33aac7e159ca8f89");
}

/*
	Name: function_2073cf2f
	Namespace: namespace_a8dddac2
	Checksum: 0x8F91B623
	Offset: 0x11FC8
	Size: 0x532
	Parameters: 0
	Flags: None
*/
function function_2073cf2f()
{
	level endon(#"game_ended");
	var_a1cc3481 = getent("trigger_phase", "targetname");
	var_f4d9a132 = gettime() + (int(1 * 1000));
	var_549429b9 = int(3.333333 * 1000);
	var_3c43f4e0 = var_549429b9 * 2;
	var_10e74788 = 10;
	var_69a1706b = int(var_10e74788 / 3);
	var_2df437f5 = 0;
	for(i = 1; i <= var_69a1706b; i++)
	{
		var_2df437f5 = var_2df437f5 + (var_69a1706b * i);
	}
	while(true)
	{
		time = gettime();
		dodamage = time >= var_f4d9a132;
		var_6effa129 = function_a1ef346b();
		foreach(entity in var_6effa129)
		{
			if(!isdefined(entity.var_6a2e2f41))
			{
				entity.var_6a2e2f41 = gettime();
			}
			if(isplayer(entity) && (!isalive(entity) || entity scene::is_igc_active()))
			{
				entity function_8c7edff5();
				continue;
			}
			if(entity istouching(var_a1cc3481) && !is_true(entity.var_99582f14) && isdefined(entity.maxhealth))
			{
				player = undefined;
				vehicle = undefined;
				if(!isdefined(entity.var_9a1624b5))
				{
					entity.var_9a1624b5 = time;
				}
				elapsed_time = time - entity.var_9a1624b5;
				if(elapsed_time < var_549429b9)
				{
					intensity = 1;
				}
				else
				{
					if(elapsed_time < var_3c43f4e0)
					{
						intensity = 2;
					}
					else
					{
						intensity = 3;
					}
				}
				var_727ff533 = entity.maxhealth / var_2df437f5;
				var_9d778583 = int(var_727ff533 * intensity);
				if(isplayer(entity))
				{
					entity function_3ac75bd8(intensity);
					player = entity;
				}
				if(dodamage)
				{
					if(isdefined(player))
					{
						if(is_true(player.var_e5f956c5))
						{
							var_9d778583 = var_9d778583 * 2;
						}
						player dodamage(var_9d778583, player.origin, undefined, undefined, undefined, "MOD_TRIGGER_HURT", 8192);
						player playsoundtoplayer(#"hash_11f49f9aedeeff5e", player);
						player function_bc82f900(#"damage_light");
						if(time >= player.var_6a2e2f41)
						{
							player thread globallogic_audio::play_taacom_dialog("fogOfWarTrappedPlayer");
							player.var_6a2e2f41 = time + (int(240 * 1000));
						}
					}
				}
				continue;
			}
			if(isplayer(entity))
			{
				entity function_8c7edff5();
			}
			entity.var_9a1624b5 = undefined;
		}
		if(dodamage)
		{
			var_f4d9a132 = gettime() + (int(1 * 1000));
		}
		waitframe(1);
	}
}

/*
	Name: function_3ac75bd8
	Namespace: namespace_a8dddac2
	Checksum: 0xA7CC8BB4
	Offset: 0x12508
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function function_3ac75bd8(intensity)
{
	self clientfield::set_to_player("fogofwareffects", 1);
}

/*
	Name: function_8c7edff5
	Namespace: namespace_a8dddac2
	Checksum: 0x841DA4E6
	Offset: 0x12540
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_8c7edff5()
{
	self clientfield::set_to_player("fogofwareffects", 0);
}

/*
	Name: function_3d102402
	Namespace: namespace_a8dddac2
	Checksum: 0x6A1CEB38
	Offset: 0x12570
	Size: 0x12A
	Parameters: 4
	Flags: None
*/
function function_3d102402(str_item, v_org, v_ang, var_b17ecef0)
{
	point = function_4ba8fde(str_item);
	if(!isdefined(var_b17ecef0))
	{
		var_eaa939f9 = item_drop::drop_item(0, undefined, 1, 0, point.id, v_org, v_ang, 3);
	}
	else
	{
		if(!var_b17ecef0)
		{
			var_eaa939f9 = item_drop::drop_item(0, undefined, 1, 0, point.id, v_org, v_ang, 0);
		}
		else if(var_b17ecef0)
		{
			var_eaa939f9 = item_drop::drop_item(0, undefined, 1, 0, point.id, v_org, v_ang, 5);
		}
	}
	var_eaa939f9.var_dd21aec2 = 1 | 16;
	var_eaa939f9.var_a6762160.var_4cd830a = 1;
	return var_eaa939f9;
}

/*
	Name: revive_players
	Namespace: namespace_a8dddac2
	Checksum: 0x2423A927
	Offset: 0x126A8
	Size: 0xD0
	Parameters: 0
	Flags: None
*/
function revive_players()
{
	foreach(player in getplayers())
	{
		if(isdefined(player))
		{
			if(player laststand::player_is_in_laststand())
			{
				player zm_laststand::auto_revive(player, 0, 0);
				continue;
			}
			player zm_player::spectator_respawn_player();
		}
	}
}

/*
	Name: function_f03b2c72
	Namespace: namespace_a8dddac2
	Checksum: 0x9784E788
	Offset: 0x12780
	Size: 0x184
	Parameters: 0
	Flags: None
*/
function function_f03b2c72()
{
	var_877be6db = struct::get("armor_machine_tunnel");
	var_a8574c85 = struct::get("wonderfizz_tunnel");
	s_crafting = struct::get("crafting_table_tunnel");
	s_pap = struct::get("pap_machine_tunnel");
	model = #"hash_6e47d6576612543c";
	level thread function_be1b951c();
	level flag::wait_till(#"hash_1a21f991103bbd5d");
	namespace_4b9fccd8::function_e0069640(s_pap);
	namespace_1cc7b406::function_db05041b(s_crafting, #"hash_1e1b751abcb0c5b6", &namespace_1cc7b406::function_e3ad9f54);
	namespace_dd7e54e3::function_93a99046(var_877be6db);
	namespace_82b4c2d1::spawn_perk_machine(var_a8574c85, #"hash_6217ef2a3d7d895b", model, #"hash_4af85251966549b8", #"hash_3eac5ec7a888ddfb", 0, &namespace_82b4c2d1::function_472f16d8, undefined);
}

/*
	Name: function_be1b951c
	Namespace: namespace_a8dddac2
	Checksum: 0x2700673A
	Offset: 0x12910
	Size: 0xC0
	Parameters: 0
	Flags: None
*/
function function_be1b951c()
{
	models = getentarraybytype(6);
	foreach(model in models)
	{
		if(model.model === #"hash_94b3a8b935248d0")
		{
			self thread function_ed93e125(model);
		}
	}
}

/*
	Name: function_ed93e125
	Namespace: namespace_a8dddac2
	Checksum: 0x46CEC3E6
	Offset: 0x129D8
	Size: 0x114
	Parameters: 1
	Flags: None
*/
function function_ed93e125(model)
{
	model hide();
	if(isdefined(model.trigger))
	{
		model.trigger triggerenable(0);
	}
	if(isdefined(model.objectiveid))
	{
		objective_setinvisibletoall(model.objectiveid);
	}
	level flag::wait_till(#"hash_1a21f991103bbd5d");
	model show();
	if(isdefined(model.trigger))
	{
		model.trigger triggerenable(1);
	}
	wait(0.5);
	if(isdefined(model.objectiveid))
	{
		objective_setvisibletoall(model.objectiveid);
	}
}

/*
	Name: function_197d500b
	Namespace: namespace_a8dddac2
	Checksum: 0xC42A1F9F
	Offset: 0x12AF8
	Size: 0x52C
	Parameters: 1
	Flags: None
*/
function function_197d500b(b_skipped)
{
	foreach(e_player in getplayers())
	{
		e_player val::set(#"outro_igc", "allowdeath", 0);
		e_player val::set(#"outro_igc", "takedamage", 0);
		e_player val::set(#"outro_igc", "ignoreme", 1);
		e_player.var_f22c83f5 = 1;
		e_player.var_f4e33249 = 1;
		e_player val::set(#"outro_igc", "show_hud", 0);
		e_player val::set(#"outro_igc", "freezecontrols", 1);
	}
	level clientfield::set("" + #"hash_763dd8035e80f7c", 1);
	level clientfield::set("" + #"hash_1fb207d10fbe27ce", 1);
	if(b_skipped)
	{
		return;
	}
	if(!level flag::get(#"hash_16783a54b8777dc"))
	{
		level flag::set(#"hash_16783a54b8777dc");
		level lui::screen_fade_out(0, (0, 0, 0));
	}
	n_start_time = gettime();
	level scene::init_streamer(#"hash_111ad10d96cf00ac", getplayers());
	n_time_left = 3 - ((float(gettime() - n_start_time)) / 1000);
	if(n_time_left > 0)
	{
		wait(n_time_left);
	}
	level clientfield::set("" + #"hash_7b50097ac4242bc9", 1);
	scene::add_scene_func(#"hash_111ad10d96cf00ac", &function_d55fcc73, "play");
	scene::add_scene_func(#"hash_111ad10d96cf00ac", &function_cf3ede8a, "Shot 010");
	scene::add_scene_func(#"hash_111ad10d96cf00ac", &function_b78ba960, "Shot 010");
	scene::add_scene_func(#"hash_111ad10d96cf00ac", &function_dc9b74df, "Shot 050");
	scene::add_scene_func(#"hash_111ad10d96cf00ac", &function_3d0889e3, "Shot 060");
	scene::add_scene_func(#"hash_111ad10d96cf00ac", &function_6644db7b, "Shot 070");
	scene::add_scene_func(#"hash_111ad10d96cf00ac", &function_35fc7d2f, "Shot 090");
	scene::add_scene_func(#"hash_111ad10d96cf00ac", &function_3276c278, "Shot 150");
	scene::add_scene_func(#"hash_111ad10d96cf00ac", &function_a0ceaf8e, "Shot 170");
	level scene::play(#"hash_111ad10d96cf00ac");
}

/*
	Name: outro_cleanup
	Namespace: namespace_a8dddac2
	Checksum: 0x91A29AFF
	Offset: 0x13030
	Size: 0x44
	Parameters: 2
	Flags: None
*/
function outro_cleanup(b_skipped, var_19e802fa)
{
	level clientfield::set("" + #"hash_7b50097ac4242bc9", 0);
}

/*
	Name: function_d55fcc73
	Namespace: namespace_a8dddac2
	Checksum: 0x341FD79
	Offset: 0x13080
	Size: 0x94
	Parameters: 1
	Flags: None
*/
function function_d55fcc73(a_ents)
{
	scene::remove_scene_func(#"hash_111ad10d96cf00ac", &function_d55fcc73, "play");
	music::setmusicstate("outro");
	exploder::stop_exploder("fxexp_sky_portal");
	wait(1);
	level lui::screen_fade_in(0, (0, 0, 0));
}

/*
	Name: function_cf3ede8a
	Namespace: namespace_a8dddac2
	Checksum: 0xA86336C4
	Offset: 0x13120
	Size: 0x74
	Parameters: 1
	Flags: None
*/
function function_cf3ede8a(a_ents)
{
	scene::remove_scene_func(#"hash_111ad10d96cf00ac", &function_cf3ede8a, "Shot 010");
	level waittill(#"hash_1c788a515fa14bec");
	hidemiscmodels("weaver_rings");
}

/*
	Name: function_b78ba960
	Namespace: namespace_a8dddac2
	Checksum: 0xB2BB9BE0
	Offset: 0x131A0
	Size: 0xB4
	Parameters: 1
	Flags: None
*/
function function_b78ba960(a_ents)
{
	scene::remove_scene_func(#"hash_111ad10d96cf00ac", &function_b78ba960, "Shot 020");
	level clientfield::set("" + #"hash_7b50097ac4242bc9", 0);
	vh_heli = a_ents[#"hash_1154b5797e3db10e"];
	if(isdefined(vh_heli))
	{
		vh_heli vehicle::toggle_tread_fx(0);
	}
}

/*
	Name: function_dc9b74df
	Namespace: namespace_a8dddac2
	Checksum: 0xE216C89A
	Offset: 0x13260
	Size: 0x130
	Parameters: 1
	Flags: None
*/
function function_dc9b74df(a_ents)
{
	scene::remove_scene_func(#"hash_111ad10d96cf00ac", &function_dc9b74df, "Shot 050");
	var_b9f89aa6 = a_ents[#"hash_f49100b73641f9b"];
	if(isdefined(var_b9f89aa6))
	{
		foreach(str_tag in [3:"tag_eye_fx3", 2:"tag_eye_fx2", 1:"tag_eye_fx1", 0:"tag_eye_fx"])
		{
			level thread function_be188dd8(var_b9f89aa6, str_tag);
		}
	}
}

/*
	Name: function_be188dd8
	Namespace: namespace_a8dddac2
	Checksum: 0xD23950BB
	Offset: 0x13398
	Size: 0x124
	Parameters: 2
	Flags: None
*/
function function_be188dd8(var_b9f89aa6, str_tag)
{
	if(!isdefined(var_b9f89aa6) || !isstring(str_tag))
	{
		return;
	}
	var_b9f89aa6 endon(#"death");
	mdl_fx = util::spawn_model(#"tag_origin", var_b9f89aa6 gettagorigin(str_tag), var_b9f89aa6 gettagangles(str_tag));
	mdl_fx endon(#"death");
	var_b9f89aa6 thread util::delete_on_death(mdl_fx);
	mdl_fx linkto(var_b9f89aa6, str_tag);
	playfxontag(#"hash_20dea26bf4474819", mdl_fx, "tag_origin");
}

/*
	Name: function_3d0889e3
	Namespace: namespace_a8dddac2
	Checksum: 0xF621D59A
	Offset: 0x134C8
	Size: 0xA4
	Parameters: 1
	Flags: None
*/
function function_3d0889e3(a_ents)
{
	scene::remove_scene_func(#"hash_111ad10d96cf00ac", &function_3d0889e3, "Shot 060");
	level waittill(#"hash_30d1cedfe65248c4");
	level thread lui::screen_fade_out(1, (1, 1, 1));
	wait(2.33);
	level thread lui::screen_fade_in(1, (1, 1, 1));
}

/*
	Name: function_6644db7b
	Namespace: namespace_a8dddac2
	Checksum: 0xC2A6F9BD
	Offset: 0x13578
	Size: 0xBC
	Parameters: 1
	Flags: None
*/
function function_6644db7b(a_ents)
{
	scene::remove_scene_func(#"hash_111ad10d96cf00ac", &function_6644db7b, "Shot 070");
	level clientfield::set("" + #"hash_7b50097ac4242bc9", 2);
	vh_heli = a_ents[#"hash_1154b5797e3db10e"];
	if(isdefined(vh_heli))
	{
		vh_heli vehicle::toggle_tread_fx(0);
	}
}

/*
	Name: function_35fc7d2f
	Namespace: namespace_a8dddac2
	Checksum: 0x937D91D1
	Offset: 0x13640
	Size: 0x8C
	Parameters: 1
	Flags: None
*/
function function_35fc7d2f(a_ents)
{
	scene::remove_scene_func(#"hash_111ad10d96cf00ac", &function_35fc7d2f, "Shot 090");
	level clientfield::set("" + #"hash_7b50097ac4242bc9", 0);
	hidemiscmodels("director_hide");
}

/*
	Name: function_3276c278
	Namespace: namespace_a8dddac2
	Checksum: 0xF220D1F2
	Offset: 0x136D8
	Size: 0xDC
	Parameters: 1
	Flags: None
*/
function function_3276c278(a_ents)
{
	scene::remove_scene_func(#"hash_111ad10d96cf00ac", &function_3276c278, "Shot 150");
	level clientfield::set("" + #"hash_7b50097ac4242bc9", 3);
	level waittill(#"hash_3df325d01f1f7a18");
	level thread lui::screen_fade_out(1, (1, 1, 1));
	wait(2.6);
	level thread lui::screen_fade_in(1, (1, 1, 1));
}

/*
	Name: function_a0ceaf8e
	Namespace: namespace_a8dddac2
	Checksum: 0x85B743A0
	Offset: 0x137C0
	Size: 0x74
	Parameters: 1
	Flags: None
*/
function function_a0ceaf8e(a_ents)
{
	scene::remove_scene_func(#"hash_111ad10d96cf00ac", &function_a0ceaf8e, "Shot 170");
	level clientfield::set("" + #"hash_7b50097ac4242bc9", 0);
}

/*
	Name: function_756178a
	Namespace: namespace_a8dddac2
	Checksum: 0x7A0F36F9
	Offset: 0x13840
	Size: 0x48E
	Parameters: 1
	Flags: None
*/
function function_756178a(b_skipped)
{
	level lui::screen_fade_out(0, (0, 0, 0));
	foreach(e_player in function_a1ef346b())
	{
		level thread function_c1719fb7(e_player);
	}
	level thread function_3eb6da0d();
	wait(4);
	foreach(e_player in getplayers())
	{
		level.var_9b6e1cc9 namespace_6783631d::function_89134efb(e_player, 1);
		if(!level.var_9b6e1cc9 namespace_6783631d::is_open(e_player))
		{
			level.var_9b6e1cc9 namespace_6783631d::open(e_player);
		}
	}
	wait(2);
	level flag::wait_till(#"hash_67867730df53852");
	scene::add_scene_func(#"hash_3981b8c38bf4acb7", &function_7f7899bf, "play");
	level scene::play(#"hash_3981b8c38bf4acb7");
	level lui::screen_fade_out(0, (0, 0, 0));
	foreach(e_player in function_a1ef346b())
	{
		level thread function_c1719fb7(e_player);
	}
	wait(1);
	foreach(e_player in getplayers())
	{
		level.var_9b6e1cc9 namespace_6783631d::function_89134efb(e_player, 0);
		if(!level.var_9b6e1cc9 namespace_6783631d::is_open(e_player))
		{
			level.var_9b6e1cc9 namespace_6783631d::open(e_player);
		}
	}
	level clientfield::set("" + #"hash_763dd8035e80f7c", 0);
	wait(8);
	foreach(e_player in getplayers())
	{
		if(level.var_9b6e1cc9 namespace_6783631d::is_open(e_player))
		{
			level.var_9b6e1cc9 namespace_6783631d::close(e_player);
		}
	}
	wait(1);
}

/*
	Name: function_3cccb124
	Namespace: namespace_a8dddac2
	Checksum: 0xF6104B19
	Offset: 0x13CD8
	Size: 0x1C4
	Parameters: 2
	Flags: None
*/
function function_3cccb124(b_skipped, var_19e802fa)
{
	var_a347ab1 = level.var_75a7d6.var_4d537044;
	level notify(#"hash_780ee87a1c42cb4c");
	foreach(e_player in getplayers())
	{
		e_player thread zm_utility::function_ee6da6f6();
		e_player function_995ecb95();
		if(isarray(var_a347ab1))
		{
			s_teleport = var_a347ab1[i];
			v_teleport = s_teleport.origin;
			if(isvec(v_teleport))
			{
				e_player setorigin(v_teleport);
			}
		}
	}
	level clientfield::set("" + #"hash_763dd8035e80f7c", 0);
	level thread util::delay(1, undefined, &lui::screen_fade_in, 1, (0, 0, 0));
}

/*
	Name: function_c1719fb7
	Namespace: namespace_a8dddac2
	Checksum: 0xA9C4749A
	Offset: 0x13EA8
	Size: 0x10C
	Parameters: 1
	Flags: None
*/
function function_c1719fb7(e_player)
{
	if(!isalive(e_player))
	{
		return;
	}
	level endon(#"end_game", #"hash_780ee87a1c42cb4c");
	e_player endon(#"death");
	e_player callback::function_d8abfc3d(#"on_player_killed", &function_995ecb95);
	e_player.var_f22c83f5 = 1;
	e_player.var_f4e33249 = 1;
	e_player.var_d7bb5e99 = util::spawn_model(#"tag_origin", e_player.origin, e_player.angles);
	e_player linkto(e_player.var_d7bb5e99);
}

/*
	Name: function_995ecb95
	Namespace: namespace_a8dddac2
	Checksum: 0x843E8AAB
	Offset: 0x13FC0
	Size: 0x64
	Parameters: 1
	Flags: None
*/
function function_995ecb95(s_params)
{
	self callback::function_52ac9652(#"on_player_killed", &function_995ecb95);
	if(isdefined(self.var_d7bb5e99))
	{
		self.var_d7bb5e99 delete();
	}
}

/*
	Name: function_3eb6da0d
	Namespace: namespace_a8dddac2
	Checksum: 0xD8BC13D0
	Offset: 0x14030
	Size: 0x6C
	Parameters: 0
	Flags: None
*/
function function_3eb6da0d()
{
	level endon(#"end_game");
	level scene::init_streamer(#"hash_3981b8c38bf4acb7", getplayers());
	level flag::set(#"hash_67867730df53852");
}

/*
	Name: function_7f7899bf
	Namespace: namespace_a8dddac2
	Checksum: 0x7EFF5C62
	Offset: 0x140A8
	Size: 0x15C
	Parameters: 1
	Flags: None
*/
function function_7f7899bf(a_ents)
{
	scene::remove_scene_func(#"hash_3981b8c38bf4acb7", &function_7f7899bf, "play");
	music::setmusicstate("epilogue");
	level notify(#"hash_780ee87a1c42cb4c");
	foreach(e_player in getplayers())
	{
		e_player function_995ecb95();
		if(level.var_9b6e1cc9 namespace_6783631d::is_open(e_player))
		{
			level.var_9b6e1cc9 namespace_6783631d::close(e_player);
		}
	}
	level thread lui::screen_fade_in(1, (0, 0, 0));
}

/*
	Name: function_a4c80826
	Namespace: namespace_a8dddac2
	Checksum: 0xAB94BEE7
	Offset: 0x14210
	Size: 0xC4
	Parameters: 1
	Flags: None
*/
function function_a4c80826(a_s_pos)
{
	/#
		a_e_players = function_a1ef346b();
		for(i = 0; i < a_e_players.size; i++)
		{
			e_player = a_e_players[i];
			s_teleport = a_s_pos[i];
			if(isdefined(e_player) && isdefined(s_teleport))
			{
				e_player setorigin(s_teleport.origin);
				e_player setplayerangles(s_teleport.angles);
			}
		}
	#/
}

/*
	Name: function_cd7a3de4
	Namespace: namespace_a8dddac2
	Checksum: 0xC09BC30C
	Offset: 0x142E0
	Size: 0x194
	Parameters: 0
	Flags: None
*/
function function_cd7a3de4()
{
	/#
		util::function_345e5b9a("");
		util::function_345e5b9a("");
		util::function_345e5b9a("");
		util::function_345e5b9a("");
		util::function_345e5b9a("");
		util::function_345e5b9a("");
		util::function_345e5b9a("");
		util::function_345e5b9a("");
		util::function_345e5b9a("");
		util::function_345e5b9a("");
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
	Namespace: namespace_a8dddac2
	Checksum: 0x18139180
	Offset: 0x14480
	Size: 0x7DA
	Parameters: 1
	Flags: None
*/
function cmd(cmd)
{
	/#
		namespace_96b7f11d::function_71a6c3ea();
		switch(cmd)
		{
			case "hash_390016349056b819":
			{
				namespace_ee206246::function_f2dd8601(#"hash_6deef93cdc13faf2", namespace_ee206246::function_9212ff4d(#"hash_6deef93cdc13faf2", #"hash_2cec5bd1113224f4"));
				iprintlnbold("");
				level thread function_a4c80826(struct::get_array(#"hash_12376e3570660abc"));
				break;
			}
			case "hash_48a8b88c7ce6ae03":
			{
				level flag::set(#"hash_77e125d6f8b2733e");
				level namespace_6747c550::function_7df6bb60(#"hash_4273532945cef4b0", 1);
				iprintlnbold("");
				break;
			}
			case "hash_a2d020f3f18130d":
			{
				level flag::set(#"hash_52d565520308890c");
				level namespace_6747c550::function_7df6bb60(#"hash_4273562945cef9c9", 1);
				iprintlnbold("");
				break;
			}
			case "hash_73a9e3fd790e09ac":
			{
				level flag::set(#"hash_407e12c104cfde25");
				level namespace_6747c550::function_7df6bb60(#"hash_4273552945cef816", 1);
				iprintlnbold("");
				break;
			}
			case "hash_48909ec43ecd9048":
			{
				level flag::set(#"hash_52d565520308890c");
				level flag::set(#"hash_77e125d6f8b2733e");
				level flag::set(#"hash_407e12c104cfde25");
				level namespace_6747c550::function_7df6bb60(#"hash_4273532945cef4b0", 1);
				level namespace_6747c550::function_7df6bb60(#"hash_4273562945cef9c9", 1);
				level namespace_6747c550::function_7df6bb60(#"hash_4273552945cef816", 1);
				iprintlnbold("");
				break;
			}
			case "hash_7fdb12828b80c706":
			{
				iprintlnbold("");
				break;
			}
			case "hash_5722c0e70313508d":
			{
				iprintlnbold("");
				break;
			}
			case "hash_20df7d72cbca695b":
			{
				iprintlnbold("");
				break;
			}
			case "hash_39538636199f1fb5":
			{
				iprintlnbold("");
				break;
			}
			case "hash_60e984dbc694d6d2":
			{
				iprintlnbold("");
				break;
			}
			case "hash_42adc8078d26599":
			{
				iprintlnbold("");
				break;
			}
			case "hash_38df87bcd0f3b46f":
			{
				iprintlnbold("");
				break;
			}
			case "hash_34cbc37fe364c47e":
			{
				level flag::set(#"hash_43b85f38cbe7b533");
				level flag::set(#"hash_43b85e38cbe7b380");
				level flag::set(#"hash_43b86138cbe7b899");
				level namespace_6747c550::function_7df6bb60(#"hash_4273532945cef4b0", 4);
				iprintlnbold("");
				break;
			}
			case "hash_32de2812b8f91f4c":
			{
				level thread namespace_ee206246::function_f2dd8601(#"hash_6deef93cdc13faf2", namespace_ee206246::function_9212ff4d(#"hash_6deef93cdc13faf2", #"hash_2cec5bd1113224f4"));
				level flag::set(#"hash_331ca6d639f4883d");
				level flag::set(#"hash_21844688fcfdffe4");
				level flag::set(#"hash_717f6f193982a127");
				level flag::set(#"hash_45d1ea5a016b7916");
				level thread function_a4c80826(struct::get_array(#"hash_5c81ab439fcc310e"));
				iprintlnbold("");
				break;
			}
			case "hash_62c5a8940f2696c2":
			{
				level thread namespace_ee206246::function_f2dd8601(#"hash_6deef93cdc13faf2", namespace_ee206246::function_9212ff4d(#"hash_6deef93cdc13faf2", #"hash_2cec5bd1113224f4"));
				level flag::set(#"hash_331ca6d639f4883d");
				level flag::set(#"hash_21844688fcfdffe4");
				level flag::set(#"hash_717f6f193982a127");
				level flag::set(#"hash_45d1ea5a016b7916");
				level thread function_a4c80826(struct::get_array(#"hash_5c81ab439fcc310e"));
				level.var_c79d163e function_59bed7ab();
				iprintlnbold("");
				break;
			}
		}
	#/
}

