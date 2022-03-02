#using script_5bb072c3abf4652c;
#using script_60d2812480bc5591;
#using script_6c5b51f98cd04fa3;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm\zm_gold_util.gsc;
#using scripts\zm_common\zm_power.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace namespace_e0b1e9f5;

/*
	Name: function_be983b8d
	Namespace: namespace_e0b1e9f5
	Checksum: 0x4A63695C
	Offset: 0x340
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_be983b8d()
{
	level notify(1480341300);
}

/*
	Name: init
	Namespace: namespace_e0b1e9f5
	Checksum: 0x39DA63B0
	Offset: 0x360
	Size: 0x1C4
	Parameters: 0
	Flags: Linked
*/
function init()
{
	clientfield::register("world", "" + #"hash_666ad912cb4541f1", 16000, 1, "int");
	clientfield::register("world", "" + #"hash_18c31f1201f7c968", 16000, 1, "counter");
	clientfield::register("world", "" + #"hash_4d477a055c04e499", 16000, 1, "counter");
	level.var_ce45839f = #"pap_quest_completed";
	level.var_2645bbc0 = 0;
	function_675b2881();
	level thread function_2be12d47();
	level thread function_4313bea3();
	level thread function_34427db();
	level thread function_5a72edf0();
	callback::on_start_gametype(&function_ed6d34fb);
	callback::add_callback(#"hash_594217387367ebb4", &function_d81240c3);
	level thread function_aaf8fd90();
}

/*
	Name: function_d81240c3
	Namespace: namespace_e0b1e9f5
	Checksum: 0x5DD985FB
	Offset: 0x530
	Size: 0xB4
	Parameters: 0
	Flags: Linked
*/
function function_d81240c3()
{
	callback::remove_callback(#"hash_594217387367ebb4", &function_d81240c3);
	namespace_ee206246::objective_complete(#"hash_42ebe8f41ed5edc8");
	namespace_ee206246::objective_complete(#"hash_968256af57af0db");
	namespace_ee206246::objective_complete(#"hash_69cca9825b7edc33");
	namespace_ee206246::objective_complete(#"hash_2b663a5dd7beb565");
}

/*
	Name: function_aaf8fd90
	Namespace: namespace_e0b1e9f5
	Checksum: 0x15081DEA
	Offset: 0x5F0
	Size: 0x6C
	Parameters: 0
	Flags: Linked
*/
function function_aaf8fd90()
{
	level endon(#"end_game");
	level flag::wait_till(#"all_players_spawned");
	level clientfield::increment("" + #"hash_4d477a055c04e499");
}

/*
	Name: function_34427db
	Namespace: namespace_e0b1e9f5
	Checksum: 0xC76DE34B
	Offset: 0x668
	Size: 0x1A8
	Parameters: 0
	Flags: Linked
*/
function function_34427db()
{
	level endon(#"end_game");
	hidemiscmodels("mdl_env_omega_defence_01");
	hidemiscmodels("mdl_env_omega_defence_02");
	hidemiscmodels("mdl_env_omega_defence_03");
	level thread function_1ff92a8e();
	while(true)
	{
		waitresult = undefined;
		waitresult = level waittill(#"power_on1", #"power_on2", #"power_on3");
		switch(waitresult._notify)
		{
			case "power_on1":
			{
				var_6e6fd14b = "mdl_env_omega_defence_01";
				break;
			}
			case "power_on2":
			{
				var_6e6fd14b = "mdl_env_omega_defence_02";
				break;
			}
			case "power_on3":
			{
				var_6e6fd14b = "mdl_env_omega_defence_03";
				break;
			}
		}
		if(level flag::get(waitresult._notify))
		{
			showmiscmodels(var_6e6fd14b);
		}
		else
		{
			hidemiscmodels(var_6e6fd14b);
		}
	}
}

/*
	Name: function_1ff92a8e
	Namespace: namespace_e0b1e9f5
	Checksum: 0x60BFE00B
	Offset: 0x818
	Size: 0x98
	Parameters: 0
	Flags: Linked
*/
function function_1ff92a8e()
{
	hidemiscmodels("mdl_env_village");
	while(true)
	{
		level flag::wait_till("power_on");
		showmiscmodels("mdl_env_village");
		level flag::wait_till_clear("power_on");
		hidemiscmodels("mdl_env_village");
	}
}

/*
	Name: function_4313bea3
	Namespace: namespace_e0b1e9f5
	Checksum: 0xEA1C4E85
	Offset: 0x8B8
	Size: 0x15C
	Parameters: 0
	Flags: Linked
*/
function function_4313bea3()
{
	level endon(#"end_game");
	var_9febe337 = struct::get("pap_machine_pos", "targetname");
	var_695c9ed4 = util::spawn_model(#"hash_608fac8bdc2fc87a", var_9febe337.origin, var_9febe337.angles);
	var_a5927988 = struct::get("pap_prompt_pos", "targetname");
	var_5bf94905 = var_a5927988 zm_unitrigger::create(#"hash_71158766520dc432", 63);
	level flag::wait_till(#"pap_quest_completed");
	streamermodelhint(#"p9_fxanim_zm_gp_pap_xmodel", 10);
	var_695c9ed4 thread util::delayed_delete(0.5);
	zm_unitrigger::unregister_unitrigger(var_5bf94905);
}

/*
	Name: function_2be12d47
	Namespace: namespace_e0b1e9f5
	Checksum: 0x2DD3FBAB
	Offset: 0xA20
	Size: 0x9C
	Parameters: 0
	Flags: Linked
*/
function function_2be12d47()
{
	level.var_9674d6e2 = struct::get("omega_soldier", "targetname");
	scene::add_scene_func("aib_t9_zm_vign_rav_seated_01", &function_5a6cc369, "seated_loop_1");
	level thread scene::play("aib_t9_zm_vign_rav_seated_01", "seated_loop_1");
	level thread function_31abb662();
}

/*
	Name: function_5a6cc369
	Namespace: namespace_e0b1e9f5
	Checksum: 0x3D4BD536
	Offset: 0xAC8
	Size: 0xCC
	Parameters: 1
	Flags: Linked
*/
function function_5a6cc369(a_ents)
{
	level.var_bd246dc3 = a_ents[#"hash_1c592f176a13a480"];
	level.var_3318039 = a_ents[#"hash_2e81dcdde79520c2"];
	level.var_3ebc9062 = array(level.var_bd246dc3, level.var_3318039);
	level.var_bd246dc3.targetname = "ravenov";
	level.var_3318039.targetname = "ravenov_chair";
	scene::remove_scene_func("aib_t9_zm_vign_rav_seated_01", &function_5a6cc369, "seated_loop_1");
}

/*
	Name: function_31abb662
	Namespace: namespace_e0b1e9f5
	Checksum: 0x84855587
	Offset: 0xBA0
	Size: 0x29C
	Parameters: 0
	Flags: Linked
*/
function function_31abb662()
{
	level endon(#"pap_quest_completed");
	level flag::wait_till("match_start_vo_done");
	level thread function_63193c65();
	if(level.round_number == 1)
	{
		var_be17187b = undefined;
		var_be17187b = level waittill(#"end_of_round", #"hash_5cdcf4e238ae5f1f");
	}
	level.var_bd246dc3 scene::stop(level.var_bd246dc3.current_scene);
	level.var_3318039 animation::stop();
	if(!level flag::get("enable_firebase_zone"))
	{
		if(var_be17187b._notify === #"hash_5cdcf4e238ae5f1f")
		{
			zm_utility::function_d729de6a(1, [0:#"hash_42ac79c9c56988e2"]);
		}
		level flag::set(#"hash_7b872eebd26623c5");
		scene_index = randomintrange(1, 6);
		level thread zm_vo::function_7622cb70(#"hash_3afb47d4b7211560" + scene_index);
		level scene::play("aib_t9_zm_vign_cust_frbz_rav_vignette_01_alt_0" + scene_index, level.var_3ebc9062);
		level scene::stop("aib_t9_zm_vign_cust_frbz_rav_vignette_01_alt_0" + scene_index);
		level.var_3318039 animation::stop();
		zm_utility::function_d729de6a(0, [0:#"hash_42ac79c9c56988e2"]);
	}
	level thread scene::play("aib_t9_zm_vign_rav_seated_01", "seated_loop_1", level.var_3ebc9062);
	level flag::clear(#"hash_7b872eebd26623c5");
}

/*
	Name: function_a79d2a2d
	Namespace: namespace_e0b1e9f5
	Checksum: 0x17FBD852
	Offset: 0xE48
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function function_a79d2a2d(str_notify)
{
	level.var_9674d6e2 zm_unitrigger::unregister_unitrigger(level.var_9674d6e2.s_unitrigger);
	level flag::clear(#"hash_72dc610ec86ebe7e");
}

/*
	Name: function_63193c65
	Namespace: namespace_e0b1e9f5
	Checksum: 0xAD4DAD02
	Offset: 0xEA8
	Size: 0x37C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_63193c65()
{
	level endoncallback(&function_a79d2a2d, #"hash_2ef294d4837fda33");
	level.var_9674d6e2 zm_unitrigger::function_fac87205(&function_db073473, 64);
	if(level.round_number == 1)
	{
		level notify(#"hash_5cdcf4e238ae5f1f");
		waitframe(1);
		level flag::wait_till_clear(#"hash_7b872eebd26623c5");
		wait(5);
		level.var_9674d6e2 zm_unitrigger::function_fac87205(&function_db073473, 64);
	}
	namespace_1812c3f4::function_e0948550();
	level.var_bd246dc3 zm_vo::function_d6f8bbd9(#"hash_25d5a996ae1d37cb");
	level.var_bd246dc3 zm_vo::function_d6f8bbd9(#"hash_25d5a896ae1d3618");
	namespace_1812c3f4::function_767d8cf3();
	wait(5);
	level.var_9674d6e2 zm_unitrigger::function_fac87205(&function_db073473, 64);
	namespace_1812c3f4::function_e0948550();
	level.var_bd246dc3 zm_vo::function_d6f8bbd9(#"hash_389b4390cad9a65c");
	level.var_bd246dc3 zm_vo::function_d6f8bbd9(#"hash_389b4490cad9a80f");
	namespace_1812c3f4::function_767d8cf3();
	wait(5);
	level.var_9674d6e2 zm_unitrigger::function_fac87205(&function_db073473, 64);
	namespace_1812c3f4::function_e0948550();
	level.var_bd246dc3 zm_vo::function_d6f8bbd9(#"hash_2a0aa41936ba305");
	level.var_bd246dc3 zm_vo::function_d6f8bbd9(#"hash_2a0a941936ba152");
	namespace_1812c3f4::function_767d8cf3();
	wait(5);
	level.var_9674d6e2 zm_unitrigger::function_fac87205(&function_db073473, 64);
	namespace_1812c3f4::function_e0948550();
	level.var_bd246dc3 zm_vo::function_d6f8bbd9(#"hash_7135542825eb95c6");
	namespace_1812c3f4::function_767d8cf3();
	wait(5);
	level.var_9674d6e2 zm_unitrigger::function_fac87205(&function_db073473, 64);
	namespace_1812c3f4::function_e0948550();
	level.var_bd246dc3 zm_vo::function_d6f8bbd9(#"hash_d3f91bb458d42df");
	namespace_1812c3f4::function_767d8cf3();
}

/*
	Name: function_db073473
	Namespace: namespace_e0b1e9f5
	Checksum: 0x536A1127
	Offset: 0x1230
	Size: 0x78
	Parameters: 1
	Flags: Linked
*/
function function_db073473(e_player)
{
	if(level flag::get(#"hash_3e765c26047c9f54") || level flag::get(#"hash_7b872eebd26623c5"))
	{
		return false;
	}
	self sethintstring(#"hash_78573012d7272fae");
	return true;
}

/*
	Name: function_675b2881
	Namespace: namespace_e0b1e9f5
	Checksum: 0xC1B6DC7E
	Offset: 0x12B0
	Size: 0x124
	Parameters: 0
	Flags: Linked
*/
function function_675b2881()
{
	level namespace_ee206246::register(#"hash_29e235392e9e49f8", #"hash_4351d45c325720cc", #"hash_3cf982e6179123fe", &function_da010d65, &function_c3ff2857);
	level namespace_ee206246::register(#"hash_29e235392e9e49f8", #"hash_2a1f2228a0ffb82e", #"hash_3cf981e61791224b", &function_1574da8d, &function_40d62928);
	level namespace_ee206246::register(#"hash_29e235392e9e49f8", #"hash_3163e5e53e7ce6fc", #"hash_3cf980e617912098", &function_9855e2a1, &function_db63534f);
}

/*
	Name: function_5a72edf0
	Namespace: namespace_e0b1e9f5
	Checksum: 0xC2B77F03
	Offset: 0x13E0
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_5a72edf0()
{
	level flag::wait_till("start_zombie_round_logic");
	level namespace_ee206246::start(#"hash_29e235392e9e49f8", 1);
}

/*
	Name: function_da010d65
	Namespace: namespace_e0b1e9f5
	Checksum: 0x7B8FCCFB
	Offset: 0x1438
	Size: 0x2B4
	Parameters: 1
	Flags: Linked
*/
function function_da010d65(b_skipped)
{
	level endon(#"end_game", #"hash_4351d45c325720cc" + "_ended_early", #"hash_3e765c26047c9f54");
	level.var_2645bbc0 = 2;
	if(b_skipped)
	{
		return;
	}
	namespace_ee206246::objective_set(#"hash_68f0c1062d24257e", undefined, undefined, #"hash_47909976fbca363c", #"hash_42ebe8f41ed5edc8", undefined, &namespace_5c4c9a39::function_13ebb331, "vol_player_in_village");
	var_5c96cc94 = struct::get_array("fasttravel_trigger", "targetname");
	foreach(var_f4560d61 in var_5c96cc94)
	{
		if(isdefined(var_f4560d61) && var_f4560d61.script_string === "firebase")
		{
			namespace_ee206246::objective_set(#"hash_68f0c1062d24257e", var_f4560d61, undefined, undefined, #"hash_968256af57af0db", undefined, &namespace_5c4c9a39::function_13ebb331, "vol_player_in_village");
			break;
		}
	}
	if(isdefined(level.var_9674d6e2))
	{
		namespace_ee206246::objective_set(#"hash_3fa48a6ce34459eb", level.var_9674d6e2, undefined, undefined, #"hash_69cca9825b7edc33", undefined, &namespace_5c4c9a39::function_13ebb331, "vol_player_in_village");
	}
	level thread function_a2854e57();
	level flag::wait_till("enable_firebase_zone");
	namespace_ee206246::objective_complete(#"hash_69cca9825b7edc33");
	level clientfield::increment("" + #"hash_18c31f1201f7c968", 1);
}

/*
	Name: function_c3ff2857
	Namespace: namespace_e0b1e9f5
	Checksum: 0x2E602A79
	Offset: 0x16F8
	Size: 0xBC
	Parameters: 2
	Flags: Linked
*/
function function_c3ff2857(b_skipped, var_19e802fa)
{
	if(!level flag::get(#"hash_3e765c26047c9f54") && (b_skipped || var_19e802fa))
	{
		level flag::set(#"hash_31d6edbd6e9f7243");
		level.var_2645bbc0 = 2;
		namespace_ee206246::objective_complete(#"hash_69cca9825b7edc33");
		namespace_ee206246::objective_complete(#"hash_42ebe8f41ed5edc8");
	}
}

/*
	Name: function_ed6d34fb
	Namespace: namespace_e0b1e9f5
	Checksum: 0x385DCD9B
	Offset: 0x17C0
	Size: 0x170
	Parameters: 0
	Flags: Linked
*/
function function_ed6d34fb()
{
	if(!level flag::get("open_fasttravel_to_hill"))
	{
		level flag::set("open_fasttravel_to_hill");
		var_73524bb4 = getentarray("portal_fx", "targetname");
		foreach(portal_fx in var_73524bb4)
		{
			portal_fx.portal_pos = util::spawn_model("tag_origin", portal_fx.origin, portal_fx.angles);
			level clientfield::set("" + #"hash_666ad912cb4541f1", 1);
			playsoundatposition(#"hash_5f27432854b069c9", portal_fx.portal_pos.origin);
		}
	}
}

/*
	Name: function_e7aacbc9
	Namespace: namespace_e0b1e9f5
	Checksum: 0x4D131359
	Offset: 0x1938
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_e7aacbc9()
{
	level clientfield::set("" + #"hash_666ad912cb4541f1", 0);
}

/*
	Name: function_1574da8d
	Namespace: namespace_e0b1e9f5
	Checksum: 0xDED8077F
	Offset: 0x1978
	Size: 0x142
	Parameters: 1
	Flags: Linked
*/
function function_1574da8d(b_skipped)
{
	level endon(#"end_game", #"hash_2a1f2228a0ffb82e" + "_ended_early", #"hash_3e765c26047c9f54");
	if(b_skipped)
	{
		return;
	}
	namespace_ee206246::objective_complete(#"hash_42ebe8f41ed5edc8");
	function_b8854133();
	level flag::wait_till_all(array("power_on1", "power_on2", "power_on3"));
	if(level.var_9583b85c < level.round_number)
	{
		level.var_9583b85c = level.round_number + 1;
	}
	level.var_2645bbc0 = 3;
	namespace_ee206246::objective_complete(#"hash_968256af57af0db");
	namespace_ee206246::objective_complete(#"hash_2b663a5dd7beb565");
	wait(1);
}

/*
	Name: function_40d62928
	Namespace: namespace_e0b1e9f5
	Checksum: 0x49E65FA1
	Offset: 0x1AC8
	Size: 0x13C
	Parameters: 2
	Flags: Linked
*/
function function_40d62928(b_skipped, var_19e802fa)
{
	if(!level flag::get(#"hash_3e765c26047c9f54") && (b_skipped || var_19e802fa))
	{
		zm_power::turn_power_on_and_open_doors(1);
		zm_power::turn_power_on_and_open_doors(2);
		zm_power::turn_power_on_and_open_doors(3);
		foreach(var_9fbdac89 in level.var_cc43b632)
		{
			var_9fbdac89 = 2;
		}
		level.var_2645bbc0 = 3;
		namespace_ee206246::objective_complete(#"hash_2b663a5dd7beb565");
	}
}

/*
	Name: function_b8854133
	Namespace: namespace_e0b1e9f5
	Checksum: 0xF4C07657
	Offset: 0x1C10
	Size: 0x1F4
	Parameters: 0
	Flags: Linked
*/
function function_b8854133()
{
	if(level.var_2645bbc0 === 1)
	{
		namespace_ee206246::objective_set(#"hash_3fa48a6ce34459eb", level.var_9674d6e2, undefined, #"hash_32932aa868c8519d", #"hash_69cca9825b7edc33", undefined, &namespace_5c4c9a39::function_13ebb331, "vol_player_in_village");
	}
	else
	{
		if(level.var_2645bbc0 === 2)
		{
			foreach(var_9fbdac89 in level.var_cc43b632)
			{
				if(var_9fbdac89.var_269ad176 === 0)
				{
					namespace_ee206246::objective_set(#"hash_3fa48b6ce3445b9e", var_9fbdac89.var_af9beb09, undefined, #"hash_329327a868c84c84", #"hash_2b663a5dd7beb565", undefined, &namespace_5c4c9a39::function_13ebb331, "vol_player_in_firebase");
				}
			}
		}
		else if(level.var_2645bbc0 === 3)
		{
			namespace_ee206246::objective_set(#"hash_3fa48c6ce3445d51", level.var_9674d6e2, undefined, #"hash_329328a868c84e37", #"hash_69cca9825b7edc33", undefined, &namespace_5c4c9a39::function_13ebb331, "vol_player_in_village");
		}
	}
}

/*
	Name: function_9855e2a1
	Namespace: namespace_e0b1e9f5
	Checksum: 0xE80D630D
	Offset: 0x1E10
	Size: 0x2DC
	Parameters: 1
	Flags: Linked
*/
function function_9855e2a1(b_skipped)
{
	level endon(#"end_game", #"hash_3163e5e53e7ce6fc" + "_ended_early", #"hash_3e765c26047c9f54");
	if(b_skipped)
	{
		return;
	}
	var_5c96cc94 = struct::get_array("fasttravel_trigger", "targetname");
	foreach(var_f4560d61 in var_5c96cc94)
	{
		if(isdefined(var_f4560d61) && var_f4560d61.script_string === "village")
		{
			namespace_ee206246::objective_set(#"hash_68f0c1062d24257e", var_f4560d61, undefined, undefined, #"hash_968256af57af0db", undefined, &namespace_5c4c9a39::function_13ebb331, "vol_player_in_firebase");
			break;
		}
	}
	namespace_ee206246::objective_set(#"hash_3fa48c6ce3445d51", level.var_9674d6e2, undefined, #"hash_329328a868c84e37", #"hash_69cca9825b7edc33", undefined, &namespace_5c4c9a39::function_13ebb331, "vol_player_in_village");
	while(true)
	{
		foreach(player in function_a1ef346b())
		{
			var_cf81848f = distance2d(player.origin, level.var_9674d6e2.origin);
			if(var_cf81848f <= 350)
			{
				function_e361ce1b();
				namespace_ee206246::objective_complete(#"hash_968256af57af0db");
				namespace_ee206246::objective_complete(#"hash_69cca9825b7edc33");
				return;
			}
		}
		wait(1);
	}
}

/*
	Name: function_db63534f
	Namespace: namespace_e0b1e9f5
	Checksum: 0x5991ABCF
	Offset: 0x20F8
	Size: 0x9C
	Parameters: 2
	Flags: Linked
*/
function function_db63534f(b_skipped, var_19e802fa)
{
	if(!level flag::get(#"hash_3e765c26047c9f54") && (b_skipped || var_19e802fa))
	{
		function_e361ce1b();
		namespace_ee206246::objective_complete(#"hash_968256af57af0db");
		namespace_ee206246::objective_complete(#"hash_69cca9825b7edc33");
	}
}

/*
	Name: function_e361ce1b
	Namespace: namespace_e0b1e9f5
	Checksum: 0xEE3AD216
	Offset: 0x21A0
	Size: 0x74
	Parameters: 0
	Flags: Linked
*/
function function_e361ce1b()
{
	level flag::set(#"pap_quest_completed");
	level.var_2645bbc0 = 4;
	function_d18f9441();
	zm_unitrigger::unregister_unitrigger(level.var_a02e68a7);
	level thread function_9d367ce1();
}

/*
	Name: function_9d367ce1
	Namespace: namespace_e0b1e9f5
	Checksum: 0x915DD3F3
	Offset: 0x2220
	Size: 0x128
	Parameters: 0
	Flags: Linked
*/
function function_9d367ce1()
{
	level endon(#"end_game");
	while(true)
	{
		level flag::wait_till_clear_any([2:#"power_on3", 1:#"power_on2", 0:#"power_on1"]);
		level flag::set(#"disable_weapon_machine");
		level flag::wait_till_all([2:#"power_on3", 1:#"power_on2", 0:#"power_on1"]);
		level flag::clear(#"disable_weapon_machine");
	}
}

/*
	Name: function_a2854e57
	Namespace: namespace_e0b1e9f5
	Checksum: 0xF5E3BF0A
	Offset: 0x2350
	Size: 0x126
	Parameters: 0
	Flags: Linked, Private
*/
function private function_a2854e57()
{
	level endon(#"hash_7ff60305b7037f35", #"hash_3e765c26047c9f54");
	while(true)
	{
		a_players = function_a1ef346b();
		foreach(player in a_players)
		{
			if(distancesquared(player.origin, level.var_9674d6e2.origin) <= 90000)
			{
				namespace_ee206246::objective_complete(#"hash_69cca9825b7edc33");
				break;
			}
		}
		wait(2);
	}
}

/*
	Name: function_d18f9441
	Namespace: namespace_e0b1e9f5
	Checksum: 0x21863A10
	Offset: 0x2480
	Size: 0x108
	Parameters: 0
	Flags: Linked, Private
*/
function private function_d18f9441()
{
	var_63a065c3 = struct::get("pap_prompt_pos", "targetname");
	a_players = function_a1ef346b();
	foreach(player in a_players)
	{
		if(distancesquared(var_63a065c3.origin, player.origin) < 250000)
		{
			player function_bc82f900(#"hash_9547d6aac0a0ad3");
		}
	}
}

