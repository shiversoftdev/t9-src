#using script_3411bb48d41bd3b;
#using script_3f9e0dc8454d98e1;
#using script_467027ea7017462b;
#using script_4d000493c57bb851;
#using script_52c6c2d1a2ef1b46;
#using script_5bb072c3abf4652c;
#using script_5fd73298643b6fff;
#using script_60d2812480bc5591;
#using script_6c5b51f98cd04fa3;
#using script_7bacb32f8222fa3e;
#using script_b9d273dc917ee1f;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\zm\zm_gold_main_quest.gsc;
#using scripts\zm_common\zm_devgui.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;

#namespace namespace_9f2e6680;

/*
	Name: function_27e4f407
	Namespace: namespace_9f2e6680
	Checksum: 0xC8199435
	Offset: 0x488
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_27e4f407()
{
	level notify(169812662);
}

/*
	Name: init
	Namespace: namespace_9f2e6680
	Checksum: 0x5C2DE2FC
	Offset: 0x4A8
	Size: 0x26C
	Parameters: 0
	Flags: Linked
*/
function init()
{
	clientfield::register("world", "" + #"hash_e3e178ca4bfed0a", 16000, 1, "int");
	clientfield::register("world", "" + #"hash_4bbd14acfb65a055", 16000, 1, "counter");
	clientfield::register("world", "" + #"hash_6ad15545c118bf44", 16000, 6, "int");
	clientfield::register("world", "" + #"play_charge_fx", 16000, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_438f8800ecce6fba", 16000, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_631477f00832803c", 16000, 1, "int");
	level thread function_47f32607();
	level thread function_f861601e();
	level thread function_1b65b01d();
	spawner::add_ai_spawn_function(&function_2d43051c);
	callback::function_10a4dd0a(&function_eeecf07f);
	level thread function_2b26d68b();
	level thread function_7baaf94();
	level thread function_2d9c01e4();
	/#
		level thread function_37597f29();
	#/
}

/*
	Name: function_2d43051c
	Namespace: namespace_9f2e6680
	Checksum: 0x83CBA711
	Offset: 0x720
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_2d43051c()
{
	if(self.archetype === #"raz")
	{
		self thread function_fc49d802();
	}
}

/*
	Name: function_fc49d802
	Namespace: namespace_9f2e6680
	Checksum: 0xD157A665
	Offset: 0x760
	Size: 0x88
	Parameters: 0
	Flags: Linked
*/
function function_fc49d802()
{
	level endon(#"hash_607dade1cb80a138");
	self endon(#"death");
	self waittill(#"raz_arm_detach");
	if(zm_utility::check_point_in_playable_area(self.origin))
	{
		level notify(#"hash_712ab943a79224a7", {#ai:self});
	}
}

/*
	Name: function_f861601e
	Namespace: namespace_9f2e6680
	Checksum: 0x32FF3AC
	Offset: 0x7F0
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function function_f861601e()
{
	level.lockers = [];
	var_b24a929f = struct::get_array("lockers_pos", "targetname");
	array::thread_all(var_b24a929f, &function_a91dc42a);
}

/*
	Name: function_7baaf94
	Namespace: namespace_9f2e6680
	Checksum: 0xC7D919E7
	Offset: 0x858
	Size: 0xF0
	Parameters: 0
	Flags: Linked
*/
function function_7baaf94()
{
	level flag::wait_till(#"power_on3");
	var_fd72bb7d = getentarray("crafting_trigger", "targetname");
	foreach(crafting_trigger in var_fd72bb7d)
	{
		if(isdefined(crafting_trigger) && crafting_trigger.script_noteworthy === "wonder_weapon_trigger")
		{
			crafting_trigger setinvisibletoall();
		}
	}
}

/*
	Name: function_1b65b01d
	Namespace: namespace_9f2e6680
	Checksum: 0xC66F6D5C
	Offset: 0x950
	Size: 0x2A4
	Parameters: 0
	Flags: Linked
*/
function function_1b65b01d()
{
	level namespace_ee206246::register(#"hash_6455630f195358ff", #"hash_6758d64b690c570f", #"hash_3cfd69dc67bdcf69", &function_a4b8aff7, &function_ce530cda);
	level namespace_ee206246::register(#"hash_6455630f195358ff", #"hash_7b5bab654708470b", #"hash_3cfd66dc67bdca50", &function_87f86c84, &function_5c376939);
	level namespace_ee206246::register(#"hash_6455630f195358ff", #"hash_287ae417b1339180", #"hash_3cfd67dc67bdcc03", &function_c2088edf, &function_4b909440);
	level namespace_ee206246::register(#"hash_6455630f195358ff", #"hash_4f76cd73cc058cff", #"hash_3cfd6cdc67bdd482", &function_4ef5947, &function_c36925e7);
	level namespace_ee206246::register(#"hash_6455630f195358ff", #"hash_c6f3225f56517f9", #"hash_3cfd6ddc67bdd635", &function_a634505e, &function_33d6e713);
	level namespace_ee206246::register(#"hash_6455630f195358ff", #"hash_3540a78605fcb68f", #"hash_3cfd6adc67bdd11c", &function_8f2904c6, &function_230b550c);
	level namespace_ee206246::register(#"hash_6455630f195358ff", #"hash_50c3abfaa73108ba", #"hash_3cfd6bdc67bdd2cf", &function_cd56635f, &function_63eefce1);
}

/*
	Name: function_47f32607
	Namespace: namespace_9f2e6680
	Checksum: 0x4A749BAB
	Offset: 0xC00
	Size: 0xE4
	Parameters: 0
	Flags: Linked
*/
function function_47f32607()
{
	level endon(#"end_game");
	level flag::wait_till("start_zombie_round_logic");
	var_583d6636 = struct::get("ww_schematic", "targetname");
	function_ade87eb5(#"hash_a2df964f9390e75", var_583d6636, 0);
	level clientfield::set("" + #"hash_e3e178ca4bfed0a", 1);
	level namespace_ee206246::start(#"hash_6455630f195358ff", 1);
}

/*
	Name: function_a4b8aff7
	Namespace: namespace_9f2e6680
	Checksum: 0xFE9DF1D2
	Offset: 0xCF0
	Size: 0x172
	Parameters: 1
	Flags: Linked
*/
function function_a4b8aff7(b_skipped)
{
	level endon(#"end_game", #"hash_6758d64b690c570f" + "_ended_early");
	/#
		wait(2);
		iprintlnbold("");
	#/
	if(b_skipped)
	{
		return;
	}
	level flag::wait_till(#"hash_722723ce1e3aa7d2");
	var_fd72bb7d = getentarray("crafting_trigger", "targetname");
	foreach(crafting_trigger in var_fd72bb7d)
	{
		if(isdefined(crafting_trigger) && crafting_trigger.script_noteworthy === "wonder_weapon_trigger")
		{
			crafting_trigger setvisibletoall();
		}
	}
	/#
		iprintlnbold("");
		wait(2);
	#/
}

/*
	Name: function_ce530cda
	Namespace: namespace_9f2e6680
	Checksum: 0x289930B0
	Offset: 0xE70
	Size: 0x134
	Parameters: 2
	Flags: Linked
*/
function function_ce530cda(b_skipped, var_19e802fa)
{
	if(b_skipped || var_19e802fa)
	{
		var_fd72bb7d = getentarray("crafting_trigger", "targetname");
		foreach(crafting_trigger in var_fd72bb7d)
		{
			if(isdefined(crafting_trigger) && crafting_trigger.script_noteworthy === "wonder_weapon_trigger")
			{
				crafting_trigger setvisibletoall();
			}
		}
	}
	level flag::set(#"hash_722723ce1e3aa7d2");
	/#
		iprintlnbold("");
	#/
}

/*
	Name: function_2b26d68b
	Namespace: namespace_9f2e6680
	Checksum: 0xCC3C1EB5
	Offset: 0xFB0
	Size: 0x2E8
	Parameters: 0
	Flags: Linked
*/
function function_2b26d68b()
{
	level.var_1aca2bc0 = array::random([0:#"hash_3785cb37a2950fc7"]);
	level flag::wait_till(#"hash_722723ce1e3aa7d2");
	while(true)
	{
		n_players_in_zone = (zm_zonemgr::get_players_in_zone(#"hash_6c20f47b4d4428a2") + zm_zonemgr::get_players_in_zone(#"hash_5bdf5947c4426530")) + zm_zonemgr::get_players_in_zone(#"hash_5ee9b6f27cd1a266");
		if(n_players_in_zone <= 0)
		{
			break;
		}
		waitframe(1);
	}
	level scene::init(#"hash_451a7f652aaab3c6");
	var_a1175523 = getentarray("dimitri_ww_interact", "targetname");
	foreach(var_3f073f58 in var_a1175523)
	{
		if(isdefined(var_3f073f58) && var_3f073f58.script_noteworthy == level.var_1aca2bc0)
		{
			var_3f073f58 thread function_8de4f4ec();
		}
		var_3f073f58 setmodel("tag_origin");
	}
	var_2805a4c0 = getentarray("weapon_folder", "targetname");
	foreach(var_15a4e821 in var_2805a4c0)
	{
		if(isdefined(var_15a4e821) && var_15a4e821.script_noteworthy == level.var_1aca2bc0)
		{
			function_ade87eb5(#"hash_a2df664f939095c", var_15a4e821, 0);
		}
		var_15a4e821 delete();
	}
}

/*
	Name: function_8de4f4ec
	Namespace: namespace_9f2e6680
	Checksum: 0x760C1C04
	Offset: 0x12A0
	Size: 0x472
	Parameters: 0
	Flags: Linked
*/
function function_8de4f4ec()
{
	level endon(#"end_game");
	var_b446c1a5 = self zm_unitrigger::create(&function_5c2866af, 80);
	waitresult = undefined;
	waitresult = self waittill(#"trigger_activated");
	zm_unitrigger::unregister_unitrigger(var_b446c1a5);
	level flag::set(#"hash_5dce120a8e013b48");
	waitresult.e_who val::set(#"hash_4a38b38071007d0a", "disable_weapons");
	wait(0.6);
	if(isdefined(waitresult.e_who))
	{
		waitresult.e_who function_cf884a61();
		if(isdefined(waitresult.e_who))
		{
			waitresult.e_who val::reset(#"hash_4a38b38071007d0a", "disable_weapons");
		}
	}
	level flag::clear(#"hash_5dce120a8e013b48");
	level namespace_6747c550::function_7df6bb60(#"hash_4214918e34681e5a", 1);
	array::thread_all(function_a1ef346b(), &namespace_4abf1500::collect_intel, #"hash_196207efbf3628f2");
	level flag::set(#"hash_5c438c30435a20f3");
	s_spawn_pos = struct::get(self.target, "targetname");
	var_7f595528 = namespace_85745671::function_7a1b21f6(s_spawn_pos.origin, s_spawn_pos.angles, 15, 512, 512, 512);
	var_67fee1f1 = [];
	if(isarray(var_7f595528))
	{
		foreach(spawn_point in var_7f595528)
		{
			if(ispointonnavmesh(spawn_point.origin, 0))
			{
				if(!isdefined(var_67fee1f1))
				{
					var_67fee1f1 = [];
				}
				else if(!isarray(var_67fee1f1))
				{
					var_67fee1f1 = array(var_67fee1f1);
				}
				if(!isinarray(var_67fee1f1, spawn_point))
				{
					var_67fee1f1[var_67fee1f1.size] = spawn_point;
				}
			}
		}
	}
	i = 0;
	while(i < 10)
	{
		s_spawn = array::random(var_67fee1f1);
		spawn_ai = spawnactor("spawner_bo5_zombie_zm_gold", s_spawn.origin, s_spawn.angles, undefined, 1);
		if(isdefined(spawn_ai))
		{
			spawn_ai.var_c9b11cb3 = #"hash_5d96e8e3ed203968";
			spawn_ai thread namespace_85745671::function_2089690e();
			spawn_ai pathmode("move allowed");
			spawn_ai.ignore_enemy_count = 1;
			spawn_ai.exclude_cleanup_adding_to_total = 1;
			spawn_ai.completed_emerging_into_playable_area = 1;
			spawn_ai.zombie_think_done = 1;
			i++;
			wait(1);
		}
		waitframe(1);
	}
}

/*
	Name: function_5c2866af
	Namespace: namespace_9f2e6680
	Checksum: 0xBEF25346
	Offset: 0x1720
	Size: 0x74
	Parameters: 1
	Flags: Linked
*/
function function_5c2866af(e_player)
{
	if(isplayer(e_player))
	{
		if(!level flag::get(#"hash_49e515cdcf4bb8db"))
		{
			self sethintstring(#"hash_f6abf835e03d2f8");
			return true;
		}
		return false;
	}
	return false;
}

/*
	Name: function_87f86c84
	Namespace: namespace_9f2e6680
	Checksum: 0x548AE280
	Offset: 0x17A0
	Size: 0x84
	Parameters: 1
	Flags: Linked
*/
function function_87f86c84(b_skipped)
{
	level endon(#"end_game", #"hash_7b5bab654708470b" + "_ended_early");
	if(b_skipped)
	{
		return;
	}
	level flag::wait_till(#"hash_5c438c30435a20f3");
	/#
		iprintlnbold("");
	#/
}

/*
	Name: function_5c376939
	Namespace: namespace_9f2e6680
	Checksum: 0x3CAC873C
	Offset: 0x1830
	Size: 0x44
	Parameters: 2
	Flags: Linked
*/
function function_5c376939(b_skipped, var_19e802fa)
{
	if(b_skipped || var_19e802fa)
	{
		/#
			iprintlnbold("");
		#/
	}
}

/*
	Name: function_c2088edf
	Namespace: namespace_9f2e6680
	Checksum: 0xFFA3787D
	Offset: 0x1880
	Size: 0x23C
	Parameters: 1
	Flags: Linked
*/
function function_c2088edf(b_skipped)
{
	level endon(#"end_game", #"hash_287ae417b1339180" + "_ended_early");
	if(b_skipped)
	{
		return;
	}
	var_611c4091 = getent("ww_quest_computer", "targetname");
	var_611c4091 zm_unitrigger::create(&function_e594b500, 64, &function_5d8ec91d);
	level waittill(#"hash_7788540323db060");
	var_d9bc28a9 = struct::get("dimitri_eyes_pos", "targetname");
	var_95614195 = var_d9bc28a9 util::spawn_model(#"hash_59fe28273eedc6e3", var_d9bc28a9.origin, var_d9bc28a9.angles);
	var_535d61f8 = getent("retinal_scan", "targetname");
	var_535d61f8 scene::play(#"hash_291b7cbc6012c485", "up", var_535d61f8);
	var_535d61f8 clientfield::set("" + #"hash_438f8800ecce6fba", 1);
	wait(4);
	var_535d61f8 scene::stop(#"hash_291b7cbc6012c485");
	var_535d61f8 thread scene::play(#"hash_291b7cbc6012c485", "down", var_535d61f8);
	var_611c4091 playsound(#"hash_30cc6f636c8bdec1");
	/#
		iprintlnbold("");
	#/
}

/*
	Name: function_e594b500
	Namespace: namespace_9f2e6680
	Checksum: 0xC0625F0B
	Offset: 0x1AC8
	Size: 0x98
	Parameters: 1
	Flags: Linked
*/
function function_e594b500(e_player)
{
	if(isplayer(e_player))
	{
		if(level flag::get("power_on3"))
		{
			self sethintstring(#"hash_6244ec26d09cb15d");
			return true;
		}
		self sethintstring(#"hash_71158766520dc432");
		return true;
	}
	return false;
}

/*
	Name: function_5d8ec91d
	Namespace: namespace_9f2e6680
	Checksum: 0x84F57EDF
	Offset: 0x1B68
	Size: 0xD0
	Parameters: 0
	Flags: Linked
*/
function function_5d8ec91d()
{
	level endon(#"end_game");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"trigger");
		player = waitresult.activator;
		if(!level flag::get("power_on3"))
		{
			continue;
		}
		player function_bc82f900(#"hash_3937704286348bfa");
		level notify(#"hash_7788540323db060");
		zm_unitrigger::unregister_unitrigger(self.stub);
	}
}

/*
	Name: function_4b909440
	Namespace: namespace_9f2e6680
	Checksum: 0xB012954B
	Offset: 0x1C40
	Size: 0x44
	Parameters: 2
	Flags: Linked
*/
function function_4b909440(b_skipped, var_19e802fa)
{
	if(b_skipped || var_19e802fa)
	{
		/#
			iprintlnbold("");
		#/
	}
}

/*
	Name: function_fd185787
	Namespace: namespace_9f2e6680
	Checksum: 0x60037F8F
	Offset: 0x1C90
	Size: 0x24C
	Parameters: 0
	Flags: Linked
*/
function function_fd185787()
{
	level.var_685ca72f = function_af26979d();
	var_79bb44c5 = getent("puzzle_board_center", "targetname");
	var_79bb44c5 thread function_912a9d36(level.var_685ca72f);
	level.var_3fc8ed1e = getent("ww_quest_computer", "targetname");
	level thread function_d196daba(level.var_3fc8ed1e, level.var_685ca72f);
	level flag::wait_till(#"hash_76c7837322a67981");
	var_3180c9b8 = util::spawn_model("tag_origin", var_79bb44c5.origin, var_79bb44c5.angles);
	var_3180c9b8 clientfield::set("" + #"hash_631477f00832803c", 1);
	var_79bb44c5 hide();
	wait(3);
	var_33229741 = struct::get(var_79bb44c5.target, "targetname");
	var_5d7d58f2 = function_ade87eb5(#"hash_11a77d8a90e047f1", var_79bb44c5, 0);
	var_3180c9b8 playsound(#"hash_783d3d061bcb79ae");
	n_power = length(var_79bb44c5.origin - var_33229741.origin);
	drop_time = var_5d7d58f2 zm_utility::fake_physicslaunch(var_33229741.origin, n_power);
	wait(1);
	var_79bb44c5 delete();
}

/*
	Name: function_4ef5947
	Namespace: namespace_9f2e6680
	Checksum: 0x1EACF73E
	Offset: 0x1EE8
	Size: 0x414
	Parameters: 1
	Flags: Linked
*/
function function_4ef5947(b_skipped)
{
	level endon(#"end_game", #"hash_4f76cd73cc058cff" + "_ended_early");
	if(b_skipped)
	{
		return;
	}
	level thread function_fd185787();
	var_10fcac9a = getent("computer_desk_drawer", "targetname");
	var_1616b76e = var_10fcac9a.origin;
	a_s_pos = struct::get_array(var_10fcac9a.target, "targetname");
	foreach(pos in a_s_pos)
	{
		if(pos.script_string === "desk_drawer_open_pos")
		{
			var_51961e1e = pos;
			continue;
		}
		var_7486f39c = pos;
	}
	var_10fcac9a playsound("zmb_quest_ww_drawer_open");
	var_44750086 = struct::get("locker_key_pos", "targetname");
	var_4f28f4ee = function_ade87eb5(#"hash_7dcd682c7e6f92d0", var_44750086, 0);
	var_4f28f4ee linkto(var_10fcac9a);
	var_10fcac9a moveto(var_51961e1e.origin, 2);
	level waittill(#"hash_28bed8664988e37a");
	var_10fcac9a moveto(var_1616b76e, 2);
	var_10fcac9a playsound("zmb_quest_ww_drawer_close");
	var_7fca3c64 = 0;
	var_30ee3bb8 = 0;
	var_720e558b = 0;
	var_7a10624 = 0;
	for(i = 0; i < 6; i++)
	{
		locker = array::random(level.lockers);
		if(!var_7fca3c64)
		{
			locker.var_b6d3d947 = 1;
			var_7fca3c64 = 1;
			continue;
		}
		if(!var_30ee3bb8)
		{
			locker.var_58d0878f = 1;
			var_30ee3bb8 = 1;
			continue;
		}
		if(!var_720e558b)
		{
			locker.var_e87fbf2f = 1;
			var_720e558b = 1;
			continue;
		}
		if(!is_true(locker.var_b6d3d947))
		{
			locker.var_aa3c8a94 = 1;
			if(!var_7a10624)
			{
				locker.var_943bebe3 = 1;
				var_7a10624 = 1;
			}
		}
	}
	level flag::set(#"hash_705c7ba8a56685ed");
	/#
		iprintlnbold("");
	#/
	level flag::wait_till(#"hash_7fc23d1679a60824");
	/#
		iprintlnbold("");
	#/
}

/*
	Name: function_c36925e7
	Namespace: namespace_9f2e6680
	Checksum: 0xF12B174B
	Offset: 0x2308
	Size: 0x64
	Parameters: 2
	Flags: Linked
*/
function function_c36925e7(b_skipped, var_19e802fa)
{
	if(b_skipped || var_19e802fa)
	{
		level flag::set(#"hash_705c7ba8a56685ed");
		/#
			iprintlnbold("");
		#/
	}
}

/*
	Name: function_a634505e
	Namespace: namespace_9f2e6680
	Checksum: 0x22C45F6B
	Offset: 0x2378
	Size: 0x84
	Parameters: 1
	Flags: Linked
*/
function function_a634505e(b_skipped)
{
	level endon(#"end_game", #"hash_c6f3225f56517f9" + "_ended_early");
	if(b_skipped)
	{
		return;
	}
	level flag::wait_till(#"hash_5b2f8d1b5f283517");
	/#
		iprintlnbold("");
	#/
}

/*
	Name: function_33d6e713
	Namespace: namespace_9f2e6680
	Checksum: 0xA1F40CB
	Offset: 0x2408
	Size: 0x17C
	Parameters: 2
	Flags: Linked
*/
function function_33d6e713(b_skipped, var_19e802fa)
{
	if(b_skipped || var_19e802fa)
	{
		/#
			iprintlnbold("");
		#/
		level clientfield::set("" + #"hash_6ad15545c118bf44", 0);
	}
	level flag::clear(#"hash_23851dbffef298e1");
	level flag::clear(#"hash_5f15896c26974eb0");
	level flag::clear(#"hash_4dd185fb6c5516d");
	if(isdefined(level.var_b0b63450))
	{
		level.var_b0b63450 delete();
	}
	if(isdefined(level.var_1221f4ab))
	{
		level.var_1221f4ab delete();
	}
	if(isdefined(level.var_82f3ced5))
	{
		level.var_82f3ced5 delete();
	}
	level clientfield::set("" + #"hash_e3e178ca4bfed0a", 0);
}

/*
	Name: function_af26979d
	Namespace: namespace_9f2e6680
	Checksum: 0x302BC7A8
	Offset: 0x2590
	Size: 0x8E
	Parameters: 0
	Flags: Linked
*/
function function_af26979d()
{
	var_77d81993 = [];
	var_cc14c4b2 = 1;
	for(i = 0; i < 3; i++)
	{
		do
		{
			var_76f1881e = randomint(20) + 1;
		}
		while(var_76f1881e == var_cc14c4b2);
		var_77d81993[var_77d81993.size] = var_76f1881e;
		var_cc14c4b2 = var_76f1881e;
	}
	return var_77d81993;
}

/*
	Name: function_d7d376af
	Namespace: namespace_9f2e6680
	Checksum: 0x28D1681B
	Offset: 0x2628
	Size: 0x14C
	Parameters: 1
	Flags: Linked
*/
function function_d7d376af(var_77d81993)
{
	var_cc14c4b2 = 1;
	b_clockwise = 1;
	for(i = 0; i < var_77d81993.size; i++)
	{
		var_76f1881e = var_77d81993[i] & 31;
		var_76f1881e = var_76f1881e + (b_clockwise ? 0 : 32);
		level clientfield::set("" + #"hash_6ad15545c118bf44", var_76f1881e);
		n_delta = (var_77d81993[i] - var_cc14c4b2) * (b_clockwise ? 1 : -1);
		if(n_delta < 0)
		{
			n_delta = n_delta + 20;
		}
		var_cc14c4b2 = var_77d81993[i];
		b_clockwise = !b_clockwise;
		wait((n_delta * 0.5) + 2);
	}
	level clientfield::set("" + #"hash_6ad15545c118bf44", 0);
}

/*
	Name: function_a8890244
	Namespace: namespace_9f2e6680
	Checksum: 0x3F74D9CD
	Offset: 0x2780
	Size: 0xE0
	Parameters: 1
	Flags: Linked
*/
function function_a8890244(var_c8e10123)
{
	self endon(#"death");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"damage");
		if(isplayer(waitresult.attacker) && (waitresult.mod === "MOD_PISTOL_BULLET" || waitresult.mod === "MOD_RIFLE_BULLET"))
		{
			/#
				iprintlnbold(function_9e72a96(var_c8e10123));
			#/
			level flag::set(var_c8e10123);
		}
	}
}

/*
	Name: function_b3e7ac72
	Namespace: namespace_9f2e6680
	Checksum: 0x78C568F3
	Offset: 0x2868
	Size: 0xF8
	Parameters: 4
	Flags: Linked
*/
function function_b3e7ac72(mdl_clip, v_origin, v_angles, var_c8e10123)
{
	e_clip = util::spawn_model(mdl_clip, v_origin, v_angles);
	e_clip setcandamage(1);
	e_clip ghost();
	e_clip val::set("hit_clip", "allowdeath", 0);
	e_clip thread function_a8890244(var_c8e10123);
	/#
		if(is_true(level.var_55513c53))
		{
			e_clip show();
		}
	#/
	return e_clip;
}

/*
	Name: function_a6d637ea
	Namespace: namespace_9f2e6680
	Checksum: 0x91803617
	Offset: 0x2968
	Size: 0x6A
	Parameters: 2
	Flags: Linked, Private
*/
function private function_a6d637ea(var_77d81993, n_index)
{
	var_76f1881e = var_77d81993[n_index];
	n_angle = (var_76f1881e - 1) * 18;
	self.angles = (n_angle, self.angles[1], self.angles[2]);
}

/*
	Name: function_912a9d36
	Namespace: namespace_9f2e6680
	Checksum: 0x9C066C9E
	Offset: 0x29E0
	Size: 0x3D4
	Parameters: 1
	Flags: Linked
*/
function function_912a9d36(var_77d81993)
{
	self notify("176317fcb3d53d71");
	self endon("176317fcb3d53d71");
	level.var_b0b63450 = function_b3e7ac72(#"hash_51fb36a0b1fe909c", self.origin, self.angles, #"hash_5f15896c26974eb0");
	level.var_1221f4ab = function_b3e7ac72(#"hash_51fb37a0b1fe924f", self.origin - vectorscale((0, 1, 0), 0.5), self.angles, #"hash_23851dbffef298e1");
	level.var_82f3ced5 = function_b3e7ac72(#"hash_51fb38a0b1fe9402", self.origin + vectorscale((0, 1, 0), 0.5), self.angles, #"hash_4dd185fb6c5516d");
	n_index = 0;
	level.var_1221f4ab function_a6d637ea(var_77d81993, n_index);
	while(true)
	{
		if(level flag::get(#"hash_23851dbffef298e1"))
		{
			n_index++;
			if(n_index < var_77d81993.size)
			{
				level.var_1221f4ab function_a6d637ea(var_77d81993, n_index);
			}
			else
			{
				level.var_1221f4ab notsolid();
			}
		}
		else
		{
			if(level flag::get(#"hash_5f15896c26974eb0"))
			{
				if(n_index >= var_77d81993.size)
				{
					level flag::set(#"hash_76c7837322a67981");
					/#
						iprintlnbold("");
					#/
					break;
				}
				else
				{
					n_index = 0;
					level.var_1221f4ab function_a6d637ea(var_77d81993, n_index);
					level.var_1221f4ab solid();
				}
			}
			else if(level flag::get(#"hash_4dd185fb6c5516d"))
			{
				n_index = 0;
				level.var_1221f4ab function_a6d637ea(var_77d81993, n_index);
				level.var_1221f4ab solid();
			}
		}
		level flag::clear(#"hash_23851dbffef298e1");
		level flag::clear(#"hash_5f15896c26974eb0");
		level flag::clear(#"hash_4dd185fb6c5516d");
		waitframe(1);
	}
	if(isdefined(level.var_b0b63450))
	{
		level.var_b0b63450 delete();
	}
	if(isdefined(level.var_1221f4ab))
	{
		level.var_1221f4ab delete();
	}
	if(isdefined(level.var_82f3ced5))
	{
		level.var_82f3ced5 delete();
	}
}

/*
	Name: function_85d6a457
	Namespace: namespace_9f2e6680
	Checksum: 0x4CC553FC
	Offset: 0x2DC0
	Size: 0x6C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_85d6a457(str_notify)
{
	level clientfield::set("" + #"hash_6ad15545c118bf44", 0);
	if(isdefined(level.var_3fc8ed1e))
	{
		zm_unitrigger::unregister_unitrigger(level.var_3fc8ed1e.s_unitrigger);
	}
}

/*
	Name: function_d196daba
	Namespace: namespace_9f2e6680
	Checksum: 0x2A72467E
	Offset: 0x2E38
	Size: 0x160
	Parameters: 2
	Flags: Linked
*/
function function_d196daba(var_3d7ad116, var_77d81993)
{
	level endoncallback(&function_85d6a457, #"hash_76c7837322a67981");
	level clientfield::increment("" + #"hash_4bbd14acfb65a055");
	var_35fc9135 = struct::get("go_co_sc_lo", "targetname");
	playsoundatposition(#"hash_5cffc6d32c1f7512", var_35fc9135.origin);
	while(true)
	{
		activator = var_3d7ad116 zm_unitrigger::function_fac87205(#"hash_6766f9d6a024ee72", 64);
		activator function_bc82f900(#"hash_3937704286348bfa");
		playsoundatposition(#"hash_3874b1f24664c38a", var_35fc9135.origin);
		level function_d7d376af(var_77d81993);
	}
}

/*
	Name: function_2d9c01e4
	Namespace: namespace_9f2e6680
	Checksum: 0xE4CD1CF1
	Offset: 0x2FA0
	Size: 0x2AC
	Parameters: 0
	Flags: Linked
*/
function function_2d9c01e4()
{
	level endon(#"end_game");
	level flag::wait_till(#"hash_722723ce1e3aa7d2");
	level thread function_6128f9d0();
	level flag::wait_till(#"hash_4942017a2b95789a");
	var_d5eca4f1 = struct::get("power_cell_pos", "targetname");
	activator = var_d5eca4f1 zm_unitrigger::function_fac87205(#"hash_48839f315e10aa6a", 64);
	activator function_bc82f900(#"hash_3937704286348bfa");
	var_3875fad7 = level.round_number + 2;
	var_6d5cc247 = util::spawn_model(#"hash_521acd0534d0676a", var_d5eca4f1.origin, var_d5eca4f1.angles);
	playsoundatposition(#"hash_70b82b4de231f767", var_d5eca4f1.origin);
	level clientfield::set("" + #"play_charge_fx", 1);
	var_c6adbe4d = var_d5eca4f1 zm_unitrigger::create(#"hash_107c45e6dc18900f", 64, &function_e08e775b);
	while(var_3875fad7 > level.round_number)
	{
		wait(1);
	}
	if(isdefined(var_c6adbe4d))
	{
		zm_unitrigger::unregister_unitrigger(var_c6adbe4d);
	}
	level clientfield::set("" + #"play_charge_fx", 0);
	/#
		iprintlnbold("");
	#/
	waitframe(5);
	var_6d5cc247 delete();
	function_ade87eb5(#"hash_1caaa6e2c3bfe02", var_d5eca4f1, 0);
}

/*
	Name: function_e08e775b
	Namespace: namespace_9f2e6680
	Checksum: 0xFA6AD1CD
	Offset: 0x3258
	Size: 0xA8
	Parameters: 0
	Flags: Linked
*/
function function_e08e775b()
{
	level endon(#"end_game");
	self endon(#"death");
	while(true)
	{
		self waittill(#"trigger");
		level thread namespace_af171776::function_b9a3fa11(#"hash_1e547dbf77f66df3", #"hash_1e548dbf77f68923", #"hash_1e5491bf77f68fef");
		zm_unitrigger::unregister_unitrigger(self.stub);
	}
}

/*
	Name: function_8f2904c6
	Namespace: namespace_9f2e6680
	Checksum: 0x9E93CA1C
	Offset: 0x3308
	Size: 0x110
	Parameters: 1
	Flags: Linked
*/
function function_8f2904c6(b_skipped)
{
	level endon(#"end_game", #"hash_3540a78605fcb68f" + "_ended_early");
	if(b_skipped)
	{
		return;
	}
	level flag::wait_till(#"hash_370e627ee07d49f4");
	foreach(player in getplayers())
	{
		if(isdefined(player))
		{
			zm_items::player_pick_up(player, zm_crafting::function_4c2f8683("zitem_gold_charged_power_cell"));
		}
	}
}

/*
	Name: function_230b550c
	Namespace: namespace_9f2e6680
	Checksum: 0x87796DE
	Offset: 0x3420
	Size: 0xE8
	Parameters: 2
	Flags: Linked
*/
function function_230b550c(b_skipped, var_19e802fa)
{
	if(b_skipped || var_19e802fa)
	{
		/#
			iprintlnbold("");
		#/
		foreach(player in function_a1ef346b())
		{
			zm_items::player_pick_up(player, zm_crafting::function_4c2f8683("zitem_gold_charged_power_cell"));
		}
	}
}

/*
	Name: function_6128f9d0
	Namespace: namespace_9f2e6680
	Checksum: 0x798AC011
	Offset: 0x3510
	Size: 0xDC
	Parameters: 0
	Flags: Linked
*/
function function_6128f9d0()
{
	level endon(#"end_game");
	waitresult = undefined;
	waitresult = level waittill(#"hash_712ab943a79224a7");
	ai = waitresult.ai;
	if(isdefined(ai))
	{
		function_ade87eb5(#"hash_322a19bc285c73d9", ai, 2);
		level waittill(#"hash_2d5cdf8748bf209d");
		/#
			iprintlnbold("");
		#/
		level flag::set(#"hash_4942017a2b95789a");
	}
}

/*
	Name: function_cd56635f
	Namespace: namespace_9f2e6680
	Checksum: 0xF4F6E888
	Offset: 0x35F8
	Size: 0x114
	Parameters: 1
	Flags: Linked
*/
function function_cd56635f(b_skipped)
{
	level endon(#"end_game", #"hash_50c3abfaa73108ba" + "_ended_early");
	if(b_skipped)
	{
		return;
	}
	zm_crafting::function_d1f16587("zblueprint_gold_wonderweapon", &function_37ad9539);
	level flag::wait_till(#"hash_6eeca22c4519b770");
	var_4c9abdd4 = struct::get("craft_item_pos", "targetname");
	function_ade87eb5(#"hash_a2df464f93905f6", var_4c9abdd4, 0);
	level waittill(#"ww_pickup");
	/#
		iprintlnbold("");
	#/
}

/*
	Name: function_63eefce1
	Namespace: namespace_9f2e6680
	Checksum: 0x9870054E
	Offset: 0x3718
	Size: 0xFC
	Parameters: 2
	Flags: Linked
*/
function function_63eefce1(b_skipped, var_19e802fa)
{
	if(b_skipped || var_19e802fa)
	{
		var_4f2dc9b = getweapon(#"hash_5bd48d860ebd5a41");
		foreach(player in getplayers())
		{
			player zm_weapons::weapon_give(var_4f2dc9b);
		}
		/#
			iprintlnbold("");
		#/
	}
}

/*
	Name: function_37ad9539
	Namespace: namespace_9f2e6680
	Checksum: 0x4CE5F12
	Offset: 0x3820
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function function_37ad9539(e_crafter)
{
	level flag::set(#"hash_6eeca22c4519b770");
	/#
		iprintlnbold("");
	#/
}

/*
	Name: function_a91dc42a
	Namespace: namespace_9f2e6680
	Checksum: 0x467AAACF
	Offset: 0x3878
	Size: 0x1CA
	Parameters: 0
	Flags: Linked
*/
function function_a91dc42a()
{
	level endon(#"end_game");
	model = util::spawn_model(#"p7_lockers_metal_tall_01", self.origin, self.angles);
	if(!isdefined(level.lockers))
	{
		level.lockers = [];
	}
	else if(!isarray(level.lockers))
	{
		level.lockers = array(level.lockers);
	}
	if(!isinarray(level.lockers, model))
	{
		level.lockers[level.lockers.size] = model;
	}
	var_3d9eca2c = anglestoforward(self.angles);
	level flag::wait_till(#"hash_705c7ba8a56685ed");
	var_e03eac13 = model zm_unitrigger::create(#"hash_2319b3ca445b4cf1", 32, &function_6de8eec4);
	var_e03eac13.origin = (var_e03eac13.origin + vectorscale((0, 0, 1), 40)) + (var_3d9eca2c * 20);
	var_e03eac13.var_dad14d36 = model;
	var_e03eac13.var_40376d20 = struct::get(self.target, "targetname");
}

/*
	Name: function_6de8eec4
	Namespace: namespace_9f2e6680
	Checksum: 0x6FAF800B
	Offset: 0x3A50
	Size: 0x340
	Parameters: 0
	Flags: Linked
*/
function function_6de8eec4()
{
	level endon(#"end_game");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"trigger");
		player = waitresult.activator;
		player function_bc82f900(#"hash_3937704286348bfa");
		if(is_true(self.stub.var_dad14d36.var_aa3c8a94))
		{
			var_ac9c030e = array::random([1:"zone_tents", 0:"zone_tents2"]);
			var_aff5d50e = zm_utility::function_cce73165("mimic_location", #"hash_785d6a6acd470388", var_ac9c030e);
			if(isdefined(var_aff5d50e))
			{
				var_aff5d50e.var_7a5e475 = 0;
				if(is_true(self.stub.var_dad14d36.var_943bebe3))
				{
					var_aff5d50e callback::function_d8abfc3d(#"hash_3beb0aebbde81394", &function_4741f2d1);
					var_aff5d50e callback::on_death(&function_4741f2d1);
				}
			}
		}
		if(is_true(self.stub.var_dad14d36.var_e87fbf2f))
		{
			if(isdefined(self.stub.var_40376d20))
			{
				var_ab71b599 = namespace_4abf1500::function_2ba45c94("zmintel_gold_maxis_audiolog_3", self.stub.var_40376d20.origin);
				var_ab71b599.angles = vectorscale((0, 0, 1), 53);
			}
		}
		if(is_true(self.stub.var_dad14d36.var_58d0878f))
		{
			playsoundatposition(#"hash_1faff36484237fbb", self.origin);
			/#
				iprintlnbold("");
			#/
			array::thread_all(function_a1ef346b(), &namespace_4abf1500::collect_intel, #"hash_4579071a9a00f2b1");
		}
		self.stub.var_dad14d36 thread scene::play("p7_lockers_metal_tail_01_bundle", self.stub.var_dad14d36);
		zm_unitrigger::unregister_unitrigger(self.stub);
	}
}

/*
	Name: function_4741f2d1
	Namespace: namespace_9f2e6680
	Checksum: 0xAA82AF46
	Offset: 0x3D98
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function function_4741f2d1(params)
{
	if(!isdefined(level.var_30690c68) && !isdefined(self.var_fa074143))
	{
		self.var_fa074143 = 1;
		level thread function_a458979c(self);
	}
}

/*
	Name: function_a458979c
	Namespace: namespace_9f2e6680
	Checksum: 0x84E36650
	Offset: 0x3DF8
	Size: 0x1CC
	Parameters: 1
	Flags: Linked
*/
function function_a458979c(entity)
{
	level endon(#"end_game");
	if(zm_utility::check_point_in_playable_area(entity.origin))
	{
		function_ade87eb5(#"hash_63707e896cd62344", entity, 2);
		level waittill(#"hash_2aa8a173854fca6e");
		/#
			iprintlnbold("");
		#/
		level flag::set(#"hash_7fc23d1679a60824");
	}
	else
	{
		wait(3);
		var_ac9c030e = array::random([1:"zone_tents", 0:"zone_tents2"]);
		var_aff5d50e = zm_utility::function_cce73165("mimic_location", #"hash_785d6a6acd470388", var_ac9c030e);
		if(isdefined(var_aff5d50e))
		{
			var_aff5d50e.var_7a5e475 = 0;
			if(is_true(self.stub.var_dad14d36.var_943bebe3))
			{
				var_aff5d50e callback::function_d8abfc3d(#"hash_3beb0aebbde81394", &function_4741f2d1);
				var_aff5d50e callback::on_death(&function_4741f2d1);
			}
		}
	}
}

/*
	Name: function_eeecf07f
	Namespace: namespace_9f2e6680
	Checksum: 0xF5DD7081
	Offset: 0x3FD0
	Size: 0x542
	Parameters: 1
	Flags: Linked
*/
function function_eeecf07f(params)
{
	item = params.item;
	if(isplayer(self))
	{
		if(isdefined(item.var_a6762160.name))
		{
			switch(item.var_a6762160.name)
			{
				case "hash_a2df964f9390e75":
				{
					level namespace_6747c550::function_7df6bb60(#"hash_5d24d46e696a9fd1", 1);
					array::thread_all(function_a1ef346b(), &namespace_4abf1500::collect_intel, #"hash_4579051a9a00ef4b");
					level flag::set(#"hash_722723ce1e3aa7d2");
					namespace_1812c3f4::function_65937665();
					break;
				}
				case "hash_7dcd682c7e6f92d0":
				{
					level namespace_6747c550::function_7df6bb60(#"hash_36dcff5d560ebdf2", 1);
					level notify(#"hash_28bed8664988e37a");
					level thread namespace_1812c3f4::function_84947a87();
					break;
				}
				case "hash_a2df664f939095c":
				{
					array::thread_all(function_a1ef346b(), &namespace_4abf1500::collect_intel, #"hash_4579061a9a00f0fe");
					break;
				}
				case "hash_63707e896cd62344":
				{
					level namespace_6747c550::function_7df6bb60(#"hash_36dcff5d560ebdf2", 2);
					level notify(#"hash_2aa8a173854fca6e");
					level namespace_af171776::function_b9a3fa11(#"hash_343bcffdd018ad79", #"hash_343bdffdd018c8a9", #"hash_343be3fdd018cf75");
					break;
				}
				case "hash_a2df464f93905f6":
				{
					array::thread_all(function_a1ef346b(), &namespace_4abf1500::collect_intel, #"hash_4579081a9a00f464");
					level notify(#"ww_pickup");
					var_4f2dc9b = getweapon(#"hash_5bd48d860ebd5a41");
					self zm_weapons::weapon_give(var_4f2dc9b, 1);
					self zm_vo::function_d342796e(#"hash_62aba8e16a728e4");
					wait(1);
					level namespace_af171776::function_b9a3fa11(#"hash_32525c195b5b2706", #"hash_32526c195b5b4236", #"hash_325270195b5b4902");
					break;
				}
				case "hash_11a77d8a90e047f1":
				{
					level namespace_6747c550::function_7df6bb60(#"hash_4214918e34681e5a", 2);
					level flag::set(#"hash_5b2f8d1b5f283517");
					level namespace_af171776::function_b9a3fa11(#"hash_30dd69dc943a1b0f", #"hash_30dd59dc9439ffdf", #"hash_30dd55dc9439f913");
					break;
				}
				case "hash_1caaa6e2c3bfe02":
				{
					level namespace_6747c550::function_7df6bb60(#"hash_64ec4aaf73911014", 2);
					level flag::set(#"hash_370e627ee07d49f4");
					level namespace_af171776::function_b9a3fa11(#"hash_6c5be047d95ba22f", #"hash_6c5bd047d95b86ff", #"hash_6c5bcc47d95b8033");
					break;
				}
				case "hash_322a19bc285c73d9":
				{
					level namespace_6747c550::function_7df6bb60(#"hash_64ec4aaf73911014", 1);
					level notify(#"hash_2d5cdf8748bf209d");
					level namespace_af171776::function_b9a3fa11(#"hash_4900551fa5339d35", #"hash_4900451fa5338205", #"hash_4900411fa5337b39");
					break;
				}
			}
		}
	}
}

/*
	Name: function_cf884a61
	Namespace: namespace_9f2e6680
	Checksum: 0x304FA1C5
	Offset: 0x4520
	Size: 0xF4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_cf884a61()
{
	switch(level.var_85422c0e)
	{
		case "hash_583a7c6fc0d127b0":
		{
			var_d0767760 = #"hash_3ed655c697ae2603";
			break;
		}
		case "carver":
		{
			var_d0767760 = #"hash_3ed645c697ae0ad3";
			break;
		}
		case "grey":
		{
			var_d0767760 = #"hash_3ed649c697ae119f";
			break;
		}
		default:
		{
			break;
		}
	}
	level thread zm_vo::function_7622cb70(var_d0767760, 0.5, 0);
	level scene::play(#"hash_451a7f652aaab3c6", self);
}

/*
	Name: function_ade87eb5
	Namespace: namespace_9f2e6680
	Checksum: 0x55A7A7F2
	Offset: 0x4620
	Size: 0x96
	Parameters: 3
	Flags: Linked
*/
function function_ade87eb5(item_name, entity, type)
{
	point = function_4ba8fde(item_name);
	item = item_drop::drop_item(0, undefined, 1, 0, point.id, entity.origin, entity.angles, type);
	item.var_dd21aec2 = 1 | 16;
	return item;
}

/*
	Name: function_37597f29
	Namespace: namespace_9f2e6680
	Checksum: 0x19190EED
	Offset: 0x46C0
	Size: 0x74
	Parameters: 0
	Flags: None
*/
function function_37597f29()
{
	/#
		util::function_345e5b9a("");
		util::function_345e5b9a("");
		util::function_345e5b9a("");
		zm_devgui::add_custom_devgui_callback(&cmd);
	#/
}

/*
	Name: cmd
	Namespace: namespace_9f2e6680
	Checksum: 0x8765D0BA
	Offset: 0x4740
	Size: 0xAA
	Parameters: 1
	Flags: None
*/
function cmd(cmd)
{
	/#
		switch(cmd)
		{
			case "hash_ddb7689e8dd7f4a":
			{
				function_f6d9adbf();
				break;
			}
			case "hash_1ca6d4b25ce0e1a1":
			{
				function_4291c822();
				break;
			}
			case "hash_48623dc89693d85a":
			{
				function_c6769eb8();
				break;
			}
			default:
			{
				break;
			}
		}
	#/
}

/*
	Name: function_f6d9adbf
	Namespace: namespace_9f2e6680
	Checksum: 0xEF5B6E68
	Offset: 0x47F8
	Size: 0x1C
	Parameters: 0
	Flags: None
*/
function function_f6d9adbf()
{
	/#
		level thread function_e37a65e1();
	#/
}

/*
	Name: function_4291c822
	Namespace: namespace_9f2e6680
	Checksum: 0x5B3BC7B6
	Offset: 0x4820
	Size: 0x3C
	Parameters: 0
	Flags: None
*/
function function_4291c822()
{
	/#
		var_685ca72f = function_af26979d();
		level thread function_d7d376af(var_685ca72f);
	#/
}

/*
	Name: function_c6769eb8
	Namespace: namespace_9f2e6680
	Checksum: 0x2CD8EB2C
	Offset: 0x4868
	Size: 0x1C8
	Parameters: 0
	Flags: None
*/
function function_c6769eb8()
{
	/#
		var_79bb44c5 = getent("", "");
		var_685ca72f = function_af26979d();
		if(isdefined(level.var_b0b63450))
		{
			level.var_b0b63450 delete();
		}
		if(isdefined(level.var_1221f4ab))
		{
			level.var_1221f4ab delete();
		}
		if(isdefined(level.var_82f3ced5))
		{
			level.var_82f3ced5 delete();
		}
		level.var_55513c53 = 1;
		var_79bb44c5 thread function_912a9d36(var_685ca72f);
		level.var_1221f4ab.origin = (var_79bb44c5.origin[0] + 10, level.var_1221f4ab.origin[1], level.var_1221f4ab.origin[2]);
		foreach(var_76f1881e in var_685ca72f)
		{
			iprintlnbold(var_76f1881e);
		}
	#/
}

/*
	Name: function_e37a65e1
	Namespace: namespace_9f2e6680
	Checksum: 0x3F75FB9C
	Offset: 0x4A38
	Size: 0xB4
	Parameters: 0
	Flags: None
*/
function function_e37a65e1()
{
	/#
		var_b6246671 = struct::get("", "");
		var_e37a65e1 = spawnactor(#"hash_4f87aa2a203d37d0", var_b6246671.origin, var_b6246671.angles, "", 1);
		if(isdefined(var_e37a65e1))
		{
			var_e37a65e1 callback::function_d8abfc3d(#"on_ai_damage", &function_fdccaaa8);
		}
	#/
}

/*
	Name: function_fdccaaa8
	Namespace: namespace_9f2e6680
	Checksum: 0xE7DB264
	Offset: 0x4AF8
	Size: 0x6C
	Parameters: 1
	Flags: None
*/
function function_fdccaaa8(s_params)
{
	/#
		str_hit_loc = s_params.shitloc;
		if(self.archetype === #"raz" && str_hit_loc === "")
		{
			level thread function_f4a3a8b0(self);
		}
	#/
}

/*
	Name: function_f4a3a8b0
	Namespace: namespace_9f2e6680
	Checksum: 0x8D0069C2
	Offset: 0x4B70
	Size: 0x124
	Parameters: 1
	Flags: None
*/
function function_f4a3a8b0(entity)
{
	/#
		level endon(#"end_game");
		if(math::cointoss(50))
		{
			callback::remove_on_ai_damage(&function_fdccaaa8);
			var_728dec0e = util::spawn_model(#"hash_7e497f3ba0621b6d", entity.origin + vectorscale((0, 0, 1), 20), entity.angles);
			var_728dec0e zm_unitrigger::function_fac87205(#"hash_1d065ea51d79a22e", 64);
			/#
				iprintlnbold("");
			#/
			var_728dec0e delete();
			level flag::set(#"hash_4942017a2b95789a");
		}
	#/
}

