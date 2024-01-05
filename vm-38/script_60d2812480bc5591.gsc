#using scripts\zm\zm_gold_main_quest.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_devgui.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;
#using scripts\zm_common\zm_vo.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace namespace_1812c3f4;

/*
	Name: function_28196b2b
	Namespace: namespace_1812c3f4
	Checksum: 0xB46E305
	Offset: 0x328
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_28196b2b()
{
	level notify(491240648);
}

/*
	Name: init
	Namespace: namespace_1812c3f4
	Checksum: 0xC12FD00E
	Offset: 0x348
	Size: 0xF8
	Parameters: 0
	Flags: Linked
*/
function init()
{
	level thread function_303e39b2();
	level thread function_e23b5b30();
	level thread function_543f9e02();
	level thread function_a6c9ee49();
	level thread function_d50a530();
	level callback::on_actor_killed(&on_actor_killed);
	level callback::on_ai_spawned(&on_ai_spawned);
	callback::on_spawned(&on_player_spawn);
	level.var_df07292e = 1.75;
	level.var_b0f33564 = 0;
}

/*
	Name: on_player_spawn
	Namespace: namespace_1812c3f4
	Checksum: 0x9DFCFBC0
	Offset: 0x448
	Size: 0x19E
	Parameters: 0
	Flags: Linked
*/
function on_player_spawn()
{
	self endoncallback(&function_b5b9317a, #"death");
	while(true)
	{
		s_waitresult = undefined;
		s_waitresult = self waittill(#"hash_360ecb13f668ae0f", #"hash_52a52b5007f36141");
		if(s_waitresult._notify === #"hash_360ecb13f668ae0f")
		{
			self.var_9c1a4644 = #"cdp_taacom";
			while(true)
			{
				s_waitresult = undefined;
				s_waitresult = self waittill(#"hash_360ecb13f668ae0f", #"hash_52a52b5007f36141", #"killstreak_done");
				if(s_waitresult._notify === #"hash_360ecb13f668ae0f")
				{
					continue;
				}
				if(s_waitresult._notify === #"killstreak_done")
				{
					if(is_true(s_waitresult.is_successful))
					{
						s_waitresult = undefined;
						s_waitresult = self waittilltimeout(20, #"hash_360ecb13f668ae0f", #"hash_52a52b5007f36141");
					}
					if(s_waitresult._notify !== #"hash_360ecb13f668ae0f")
					{
						break;
					}
				}
				else
				{
					break;
				}
			}
			self.var_9c1a4644 = undefined;
		}
	}
}

/*
	Name: function_b5b9317a
	Namespace: namespace_1812c3f4
	Checksum: 0x852CB0
	Offset: 0x5F0
	Size: 0x16
	Parameters: 1
	Flags: Linked
*/
function function_b5b9317a(str_notify)
{
	self.var_9c1a4644 = undefined;
}

/*
	Name: function_43655604
	Namespace: namespace_1812c3f4
	Checksum: 0x9A4C929F
	Offset: 0x610
	Size: 0x1F4
	Parameters: 0
	Flags: Linked
*/
function function_43655604()
{
	level endon(#"end_game", #"hash_43393d6e22873fc4", #"hash_6bd174fa0d5006f4");
	switch(self.script_int)
	{
		case 1:
		{
			str_vo_alias = #"hash_39131a3f57995b19";
			var_88c20a4 = #"zone_hillside_road_defend";
			break;
		}
		case 2:
		{
			str_vo_alias = #"hash_39131a3f57995b19";
			var_88c20a4 = #"zone_burnt_forest_defend";
			break;
		}
		case 3:
		{
			str_vo_alias = #"hash_6ee5ba966ea32498";
			var_88c20a4 = #"zone_rocky_slope_defend";
			break;
		}
		default:
		{
			return;
		}
	}
	while(true)
	{
		var_ebf4f229 = 0;
		foreach(player in function_a1ef346b())
		{
			if(player.cached_zone_name === var_88c20a4)
			{
				var_ebf4f229 = 1;
				break;
			}
		}
		if(var_ebf4f229)
		{
			break;
		}
		waitframe(1);
	}
	level thread function_78cc0d39(str_vo_alias);
}

/*
	Name: function_303e39b2
	Namespace: namespace_1812c3f4
	Checksum: 0x5290F301
	Offset: 0x810
	Size: 0x20C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_303e39b2()
{
	level flag::wait_till("initial_blackscreen_passed");
	switch(randomintrange(0, 3))
	{
		case 0:
		{
			level zm_vo::function_7622cb70("fbz_gs_infil_s", 5);
			level.var_85422c0e = "strauss";
			break;
		}
		case 1:
		{
			level zm_vo::function_7622cb70("fbs_gs_infil_c", 5);
			level.var_85422c0e = "carver";
			break;
		}
		case 2:
		{
			level zm_vo::function_7622cb70("fbs_gs_infil_g", 5);
			level.var_85422c0e = "grey";
			break;
		}
	}
	level flag::wait_till(#"intro_scene_done");
	var_d0767760 = array::random([4:#"hash_6650e8afb63fdd30", 3:#"hash_6650e9afb63fdee3", 2:#"hash_6650eeafb63fe762", 1:#"hash_6650efafb63fe915", 0:#"hash_6650ecafb63fe3fc"]);
	level zm_vo::function_7622cb70(var_d0767760);
	level flag::set("match_start_vo_done");
}

/*
	Name: function_81971b17
	Namespace: namespace_1812c3f4
	Checksum: 0xDF853DA5
	Offset: 0xA28
	Size: 0x80
	Parameters: 0
	Flags: Linked
*/
function function_81971b17()
{
	level endon(#"hash_2815bf32fb443bc3", #"hash_a88cb65d3952bc4", #"hash_4210e12176f5ee6c");
	while(true)
	{
		level waittill(#"hash_b637efb9d19e84a");
		level thread zm_vo::function_7622cb70("orda_weakpoint_warning");
	}
}

/*
	Name: function_e23b5b30
	Namespace: namespace_1812c3f4
	Checksum: 0x21DEE307
	Offset: 0xAB0
	Size: 0x274
	Parameters: 0
	Flags: Linked
*/
function function_e23b5b30()
{
	level endon(#"end_game", #"pap_quest_completed");
	var_a2bc7f20 = array::random([4:#"hash_23c8aa02a3fb5c75", 3:#"hash_23c8a902a3fb5ac2", 2:#"hash_23c8a402a3fb5243", 1:#"hash_23c8a302a3fb5090", 0:#"hash_23c8a602a3fb55a9"]);
	var_c08d39 = array::random([4:#"hash_7e78bfc835a04714", 3:#"hash_7e78c0c835a048c7", 2:#"hash_7e78bdc835a043ae", 1:#"hash_7e78bec835a04561", 0:#"hash_7e78bbc835a04048"]);
	level waittill(#"enable_firebase_zone", #"fasttravel_bought");
	zm_vo::function_3c173d37();
	for(scene_index = 1; scene_index <= 5; scene_index++)
	{
		level scene::stop("aib_t9_zm_vign_cust_frbz_rav_vignette_01_alt_0" + scene_index);
	}
	if(isdefined(level.ravenov))
	{
		level.ravenov stopsounds();
	}
	level flag::wait_till(#"enable_firebase_zone");
	level zm_vo::function_7622cb70(var_a2bc7f20, 0.5);
	level thread function_4fd64e07();
	level thread zm_vo::function_7622cb70(var_c08d39, 1);
}

/*
	Name: function_fe881426
	Namespace: namespace_1812c3f4
	Checksum: 0xACAF3982
	Offset: 0xD30
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function function_fe881426(str_notify)
{
	var_23d9277f = struct::get("trg_pk");
	zm_unitrigger::unregister_unitrigger(var_23d9277f.s_unitrigger);
}

/*
	Name: function_4fd64e07
	Namespace: namespace_1812c3f4
	Checksum: 0xDB0532D5
	Offset: 0xD88
	Size: 0x33C
	Parameters: 0
	Flags: Linked
*/
function function_4fd64e07()
{
	if(!isdefined(level.var_9a81036b))
	{
		return;
	}
	level endoncallback(&function_fe881426, #"pap_quest_completed", #"power_on");
	level.var_9a81036b endoncallback(&function_fe881426, #"death");
	var_23d9277f = struct::get("trg_pk");
	/#
		level thread function_51e0aa02(var_23d9277f);
	#/
	level.var_9a81036b.var_c92e501c = "interrupt_p4";
	level.var_9a81036b childthread function_20df51b5();
	var_23d9277f zm_unitrigger::function_fac87205(#"hash_8907bffd7ded28e", 100);
	function_e8d13d70(0);
	level.var_9a81036b zm_vo::function_d6f8bbd9(#"hash_79c5ba88b52935a0");
	function_98b949fc();
	wait(5);
	var_23d9277f zm_unitrigger::function_fac87205(#"hash_8907bffd7ded28e", 100);
	function_e8d13d70(0);
	level.var_9a81036b zm_vo::function_d6f8bbd9(#"hash_3f58afeef123e8fb");
	function_98b949fc();
	wait(5);
	var_23d9277f zm_unitrigger::function_fac87205(#"hash_8907bffd7ded28e", 100);
	function_e8d13d70(0);
	level.var_9a81036b zm_vo::function_d6f8bbd9(#"hash_5c08c3611f1462f6");
	function_98b949fc();
	wait(5);
	var_23d9277f zm_unitrigger::function_fac87205(#"hash_8907bffd7ded28e", 100);
	function_e8d13d70(0);
	level.var_9a81036b zm_vo::function_d6f8bbd9(#"hash_476f0f690366f9d1");
	function_98b949fc();
	wait(5);
	var_23d9277f zm_unitrigger::function_fac87205(#"hash_8907bffd7ded28e", 100);
	function_e8d13d70(0);
	level.var_9a81036b zm_vo::function_d6f8bbd9(#"hash_387e898f9aab686c");
	function_98b949fc();
}

/*
	Name: function_e8d13d70
	Namespace: namespace_1812c3f4
	Checksum: 0x1B9A7A6B
	Offset: 0x10D0
	Size: 0xAC
	Parameters: 1
	Flags: Linked
*/
function function_e8d13d70(var_9e5d6843)
{
	if(!isdefined(var_9e5d6843))
	{
		var_9e5d6843 = 1;
	}
	level endon(#"hash_108827cca89515e");
	level flag::set("peck_interact_vo_playing");
	level scene::stop(level.var_9a81036b.current_scene);
	level thread function_b384d73c(var_9e5d6843);
	wait(0.5);
}

/*
	Name: function_b384d73c
	Namespace: namespace_1812c3f4
	Checksum: 0x18F3E2B4
	Offset: 0x1188
	Size: 0x9C
	Parameters: 1
	Flags: Linked
*/
function function_b384d73c(var_9e5d6843)
{
	if(!isdefined(var_9e5d6843))
	{
		var_9e5d6843 = 1;
	}
	level endon(#"hash_108827cca89515e");
	if(var_9e5d6843)
	{
		level scene::play(#"aib_t9_zm_vign_peck_seated_01", "into_convo", level.var_96689f39);
	}
	level thread scene::play(#"aib_t9_zm_vign_peck_seated_01", "convo_loop", level.var_96689f39);
}

/*
	Name: function_20df51b5
	Namespace: namespace_1812c3f4
	Checksum: 0xC9E373AD
	Offset: 0x1230
	Size: 0x156
	Parameters: 0
	Flags: Linked
*/
function function_20df51b5()
{
	self endon(#"death");
	self notify("4691fb805f755f3f");
	self endon("4691fb805f755f3f");
	while(true)
	{
		s_waitresult = undefined;
		s_waitresult = self waittill(#"hash_5db01607981fb0ea", #"hash_5db01507981faf37", #"hash_5db01407981fad84", #"hash_5db01307981fabd1");
		switch(s_waitresult._notify)
		{
			case "hash_5db01607981fb0ea":
			{
				self.var_c92e501c = "interrupt_p1";
				break;
			}
			case "hash_5db01507981faf37":
			{
				self.var_c92e501c = "interrupt_p2";
				break;
			}
			case "hash_5db01407981fad84":
			{
				self.var_c92e501c = "interrupt_p3";
				break;
			}
			case "hash_5db01307981fabd1":
			default:
			{
				self.var_c92e501c = "interrupt_p4";
				break;
			}
		}
	}
}

/*
	Name: function_98b949fc
	Namespace: namespace_1812c3f4
	Checksum: 0x85FFBF22
	Offset: 0x1390
	Size: 0xBC
	Parameters: 0
	Flags: Linked
*/
function function_98b949fc()
{
	level notify(#"hash_108827cca89515e");
	level flag::clear("ravenov_interact_vo_playing");
	level scene::stop(level.var_9a81036b.current_scene);
	level scene::play(#"aib_t9_zm_vign_peck_seated_01", "out_of_convo", level.var_96689f39);
	level thread scene::play(#"aib_t9_zm_vign_peck_seated_01", "seated_loop", level.var_96689f39);
}

/*
	Name: function_e0948550
	Namespace: namespace_1812c3f4
	Checksum: 0xF2E950E6
	Offset: 0x1458
	Size: 0xBC
	Parameters: 0
	Flags: Linked
*/
function function_e0948550()
{
	level endon(#"hash_7ed70ad1c9bb59e2");
	level flag::set("ravenov_interact_vo_playing");
	level scene::stop(level.ravenov.current_scene);
	level scene::play(#"aib_t9_zm_vign_rav_seated_01", "into_convo", level.var_3ebc9062);
	level thread scene::play(#"aib_t9_zm_vign_rav_seated_01", "convo_loop", level.var_3ebc9062);
}

/*
	Name: function_767d8cf3
	Namespace: namespace_1812c3f4
	Checksum: 0xBD627
	Offset: 0x1520
	Size: 0xBC
	Parameters: 0
	Flags: Linked
*/
function function_767d8cf3()
{
	level notify(#"hash_7ed70ad1c9bb59e2");
	level flag::clear("ravenov_interact_vo_playing");
	level scene::stop(level.ravenov.current_scene);
	level scene::play(#"aib_t9_zm_vign_rav_seated_01", "out_of_convo", level.var_3ebc9062);
	level thread scene::play(#"aib_t9_zm_vign_rav_seated_01", "seated_loop_1", level.var_3ebc9062);
}

/*
	Name: function_51e0aa02
	Namespace: namespace_1812c3f4
	Checksum: 0x1DF81265
	Offset: 0x15E8
	Size: 0xAE
	Parameters: 1
	Flags: None
*/
function function_51e0aa02(var_23d9277f)
{
	/#
		level endon(#"pap_quest_completed");
		while(true)
		{
			if(getdvarint(#"zm_debug_ee", 0))
			{
				circle(var_23d9277f.origin, 8, (0, 1, 0));
				print3d(var_23d9277f.origin, "", (0, 1, 0), undefined, 0.15);
			}
			waitframe(1);
		}
	#/
}

/*
	Name: function_a99c18d7
	Namespace: namespace_1812c3f4
	Checksum: 0xF1A69ED2
	Offset: 0x16A0
	Size: 0x11C
	Parameters: 0
	Flags: Linked
*/
function function_a99c18d7()
{
	self notify("352d8006dd0ad7bb");
	self endon("352d8006dd0ad7bb");
	level endon(#"end_game");
	while(true)
	{
		var_6450afa8 = 0;
		foreach(player in function_a1ef346b())
		{
			if(player.cached_zone_name === #"zone_napalm_strike2")
			{
				var_6450afa8 = 1;
				break;
			}
		}
		if(var_6450afa8)
		{
			break;
		}
		waitframe(1);
	}
	level thread zm_vo::function_7622cb70(#"hash_69ccee7bbff01e4");
}

/*
	Name: function_df0c6e4e
	Namespace: namespace_1812c3f4
	Checksum: 0x3F8B07B9
	Offset: 0x17C8
	Size: 0x264
	Parameters: 0
	Flags: Linked
*/
function function_df0c6e4e()
{
	self notify("a4b0affc6b06b7c");
	self endon("a4b0affc6b06b7c");
	if(is_true(level.var_95f26c94))
	{
		return;
	}
	while(true)
	{
		var_30f24311 = 0;
		foreach(player in function_a1ef346b())
		{
			var_cf81848f = distance2d(player.origin, level.var_9674d6e2.origin);
			if(var_cf81848f <= 450)
			{
				var_30f24311 = 1;
			}
		}
		if(var_30f24311)
		{
			break;
		}
		wait(0.5);
	}
	var_bd78bbd3 = 0;
	foreach(var_9fbdac89 in level.var_cc43b632)
	{
		if(var_9fbdac89.var_269ad176 === 0)
		{
			var_bd78bbd3++;
		}
	}
	if(var_bd78bbd3 > 0)
	{
		level.var_95f26c94 = 1;
		str_vo_alias = array::random([2:#"hash_1745cd3e306dda05", 1:#"hash_4d40668d67dbdd5c", 0:#"hash_3a7acc934b1f6ecb"]);
		level.ravenov thread zm_vo::function_d6f8bbd9(str_vo_alias);
	}
}

/*
	Name: function_891da57a
	Namespace: namespace_1812c3f4
	Checksum: 0x3F63D7C9
	Offset: 0x1A38
	Size: 0x35C
	Parameters: 0
	Flags: Linked
*/
function function_891da57a()
{
	if(isdefined(level.var_dda99941) || is_true(level.var_f925c697))
	{
		return;
	}
	switch(self.script_int)
	{
		case 1:
		{
			level function_78cc0d39(#"hash_3e585004a27f59ce");
			break;
		}
		case 2:
		{
			level function_78cc0d39(#"hash_2b6773cacd83207");
			break;
		}
		case 3:
		{
			level function_78cc0d39(#"hash_628725c2bb754829");
			break;
		}
		default:
		{
			break;
		}
	}
	if(!is_true(level.var_c52dc4d4))
	{
		level.var_c52dc4d4 = 1;
		var_d0767760 = array::random([4:#"hash_a3e6849ce5f023a", 3:#"hash_a3e6949ce5f03ed", 2:#"hash_a3e6249ce5ef808", 1:#"hash_a3e6349ce5ef9bb", 0:#"hash_a3e6449ce5efb6e"]);
		level zm_vo::function_7622cb70(var_d0767760, 1);
	}
	if(level flag::get_all([2:"captured_control_point3", 1:"captured_control_point2", 0:"captured_control_point1"]))
	{
		level.var_dda99941 = level.round_number;
		level function_78cc0d39(#"hash_223f84579096023b");
		level thread zm_vo::function_7622cb70(#"hash_399464c7667b8dfb");
		level waittill(#"end_of_round");
		wait(2);
		var_d0767760 = array::random([4:#"hash_b4022459c0cdb08", 3:#"hash_b4023459c0cdcbb", 2:#"hash_b4028459c0ce53a", 1:#"hash_b4029459c0ce6ed", 0:#"hash_b4026459c0ce1d4"]);
		level zm_vo::function_7622cb70(var_d0767760);
		wait(2);
		level thread function_a99c18d7();
	}
}

/*
	Name: function_65937665
	Namespace: namespace_1812c3f4
	Checksum: 0xBE5F453
	Offset: 0x1DA0
	Size: 0x1E4
	Parameters: 0
	Flags: Linked
*/
function function_65937665()
{
	level endon(#"end_game");
	switch(level.var_85422c0e)
	{
		case "strauss":
		{
			var_d0767760 = #"hash_359dc466218eb0ff";
			break;
		}
		case "carver":
		{
			var_d0767760 = #"hash_359dd466218ecc2f";
			break;
		}
		case "grey":
		{
			var_d0767760 = #"hash_359dd066218ec563";
			break;
		}
		default:
		{
			var_d0767760 = array::random([2:#"hash_359dd066218ec563", 1:#"hash_359dd466218ecc2f", 0:#"hash_359dc466218eb0ff"]);
			break;
		}
	}
	level zm_vo::function_7622cb70(var_d0767760);
	if(level flag::get(#"hash_5c438c30435a20f3"))
	{
		return;
	}
	wait(2);
	var_b3b54a4 = array::random([2:#"hash_4e1dbca19aa92ef9", 1:#"hash_4e1dbba19aa92d46", 0:#"hash_4e1dbaa19aa92b93"]);
	level zm_vo::function_7622cb70(var_b3b54a4);
}

/*
	Name: function_84947a87
	Namespace: namespace_1812c3f4
	Checksum: 0x72E8078E
	Offset: 0x1F90
	Size: 0x142
	Parameters: 0
	Flags: Linked
*/
function function_84947a87()
{
	level endon(#"end_game");
	b_play = 0;
	var_778b20f3 = "zone_tents";
	while(!b_play)
	{
		foreach(player in function_a1ef346b())
		{
			player_zone = player zm_zonemgr::get_player_zone();
			if(isdefined(player_zone) && player_zone == var_778b20f3)
			{
				level namespace_af171776::function_b9a3fa11(#"hash_467a44d6adea637a", #"hash_467a34d6adea484a", #"hash_467a30d6adea417e");
				b_play = 1;
			}
		}
		wait(1);
	}
}

/*
	Name: function_f83c329c
	Namespace: namespace_1812c3f4
	Checksum: 0x2ACF360
	Offset: 0x20E0
	Size: 0x6C
	Parameters: 1
	Flags: None
*/
function function_f83c329c(var_56f5a757)
{
	level endon(#"end_game");
	if(isarray(var_56f5a757))
	{
		var_d0767760 = array::random(var_56f5a757);
		level zm_vo::function_7622cb70(var_d0767760);
	}
}

/*
	Name: function_78cc0d39
	Namespace: namespace_1812c3f4
	Checksum: 0xB73A9C69
	Offset: 0x2158
	Size: 0x54
	Parameters: 2
	Flags: Linked
*/
function function_78cc0d39(str_vo_alias, b_wait_if_busy)
{
	if(!isdefined(b_wait_if_busy))
	{
		b_wait_if_busy = 1;
	}
	self zm_vo::function_d6f8bbd9(str_vo_alias, undefined, function_a1ef346b(), b_wait_if_busy);
}

/*
	Name: function_543f9e02
	Namespace: namespace_1812c3f4
	Checksum: 0x502DF6EC
	Offset: 0x21B8
	Size: 0x1DE
	Parameters: 0
	Flags: Linked, Private
*/
function private function_543f9e02()
{
	level endon(#"end_game");
	while(true)
	{
		s_waitresult = undefined;
		s_waitresult = level waittill(#"hash_6d7ff9f9ff07619c");
		switch(level.var_85422c0e)
		{
			case "strauss":
			{
				var_b3b54a4 = #"hash_66dcd6a30312f825";
				break;
			}
			case "carver":
			{
				var_b3b54a4 = #"hash_5b02401fdc592601";
				break;
			}
			case "grey":
			{
				var_b3b54a4 = #"hash_4c3eea3dc6d2104a";
				break;
			}
			default:
			{
				var_b3b54a4 = #"hash_66dcd6a30312f825";
				break;
			}
		}
		var_a74e1ff8 = 1;
		foreach(player in function_a1ef346b())
		{
			if(!is_true(player.var_e0059718))
			{
				var_a74e1ff8 = 0;
				s_waitresult.var_c40fb40b thread function_9a419851(player, var_b3b54a4);
			}
		}
		if(var_a74e1ff8)
		{
			return;
		}
	}
}

/*
	Name: function_9a419851
	Namespace: namespace_1812c3f4
	Checksum: 0xBCAF6A66
	Offset: 0x23A0
	Size: 0xBC
	Parameters: 2
	Flags: Linked, Private
*/
function private function_9a419851(player, var_b3b54a4)
{
	self endon(#"death");
	player endon(#"death");
	while(true)
	{
		if(player util::is_player_looking_at(self getcentroid()))
		{
			break;
		}
		waitframe(1);
	}
	if(!is_true(player.var_e0059718))
	{
		player.var_e0059718 = 1;
		player thread zm_vo::function_7622cb70(var_b3b54a4, 1, 0);
	}
}

/*
	Name: function_a6c9ee49
	Namespace: namespace_1812c3f4
	Checksum: 0x5CC0399E
	Offset: 0x2468
	Size: 0x13C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_a6c9ee49()
{
	level endon(#"end_game");
	level waittill(#"hash_3eb4c19472384f5b");
	switch(level.var_85422c0e)
	{
		case "strauss":
		{
			var_4b8c1ea7 = #"hash_4271010934d7ff16";
			break;
		}
		case "carver":
		{
			var_4b8c1ea7 = #"hash_7e3a0e811e6347d2";
			break;
		}
		case "grey":
		{
			var_4b8c1ea7 = #"hash_5688a462847552b9";
			break;
		}
		default:
		{
			var_4b8c1ea7 = #"hash_4271010934d7ff16";
			break;
		}
	}
	var_ca46ac46 = #"hash_33a906eca69357b6";
	level zm_vo::function_7622cb70(var_4b8c1ea7);
	level thread zm_vo::function_7622cb70(var_ca46ac46);
}

/*
	Name: on_actor_killed
	Namespace: namespace_1812c3f4
	Checksum: 0x49BE89D6
	Offset: 0x25B0
	Size: 0x13C
	Parameters: 1
	Flags: Linked, Private
*/
function private on_actor_killed(params)
{
	if(self.archetype === #"mimic" && self.team === level.zombie_team)
	{
		switch(level.var_85422c0e)
		{
			case "strauss":
			{
				var_b3b54a4 = #"hash_74270a8581b4849a";
				break;
			}
			case "carver":
			{
				var_b3b54a4 = #"hash_12a4b90943442c86";
				break;
			}
			case "grey":
			{
				var_b3b54a4 = #"hash_3f74c72c2033c1c5";
				break;
			}
			default:
			{
				var_b3b54a4 = #"hash_74270a8581b4849a";
				break;
			}
		}
		level thread zm_vo::function_7622cb70(var_b3b54a4, 1.25, 0);
		level callback::remove_on_actor_killed(&on_actor_killed);
	}
}

/*
	Name: on_ai_spawned
	Namespace: namespace_1812c3f4
	Checksum: 0xF1D51530
	Offset: 0x26F8
	Size: 0x20C
	Parameters: 0
	Flags: Linked
*/
function on_ai_spawned()
{
	self endon(#"death");
	level endon(#"end_game");
	if(self.archetype === #"raz" && self.team === level.zombie_team)
	{
		switch(level.var_85422c0e)
		{
			case "strauss":
			{
				var_b3b54a4 = #"hash_62001c8ac133172a";
				break;
			}
			case "carver":
			{
				var_b3b54a4 = #"hash_6cc8aa06ce7cc5d6";
				break;
			}
			case "grey":
			{
				var_b3b54a4 = #"hash_32dd8255ea06555";
				break;
			}
			default:
			{
				var_b3b54a4 = #"hash_62001c8ac133172a";
				break;
			}
		}
		var_3a0dcf4c = 1;
		foreach(player in function_a1ef346b())
		{
			if(!is_true(player.var_138d17d5))
			{
				var_3a0dcf4c = 0;
				self thread function_886e25dc(player, var_b3b54a4);
			}
		}
		if(var_3a0dcf4c)
		{
			level callback::remove_on_ai_spawned(&on_ai_spawned);
		}
	}
}

/*
	Name: function_886e25dc
	Namespace: namespace_1812c3f4
	Checksum: 0x8D86D065
	Offset: 0x2910
	Size: 0xCC
	Parameters: 2
	Flags: Linked
*/
function function_886e25dc(player, var_b3b54a4)
{
	self endon(#"death");
	player endon(#"death", #"hash_1a917d3ddd4fab73");
	while(true)
	{
		if(player util::is_player_looking_at(self getcentroid()))
		{
			break;
		}
		waitframe(1);
	}
	if(!is_true(player.var_138d17d5))
	{
		player.var_138d17d5 = 1;
		player thread zm_vo::function_7622cb70(var_b3b54a4);
	}
}

/*
	Name: function_421f7a59
	Namespace: namespace_1812c3f4
	Checksum: 0xB2E740DE
	Offset: 0x29E8
	Size: 0x22C
	Parameters: 0
	Flags: Linked
*/
function function_421f7a59()
{
	level zm_vo::function_7622cb70(#"hash_172f226477a8163");
	wait(0.75);
	switch(level.var_85422c0e)
	{
		case "strauss":
		{
			var_b3b54a4 = array::random([2:#"hash_4b1d5dadb2764dea", 1:#"hash_4b1d5eadb2764f9d", 0:#"hash_4b1d5badb2764a84"]);
			break;
		}
		case "carver":
		{
			var_b3b54a4 = array::random([2:#"hash_4b53ddadb2a4b6da", 1:#"hash_4b53deadb2a4b88d", 0:#"hash_4b53dbadb2a4b374"]);
			break;
		}
		case "grey":
		{
			var_b3b54a4 = array::random([2:#"hash_4b4645adb2992a36", 1:#"hash_4b4646adb2992be9", 0:#"hash_4b4643adb29926d0"]);
			break;
		}
		default:
		{
			var_b3b54a4 = array::random([2:#"hash_4b1d5dadb2764dea", 1:#"hash_4b1d5eadb2764f9d", 0:#"hash_4b1d5badb2764a84"]);
			break;
		}
	}
	level thread zm_vo::function_7622cb70(var_b3b54a4);
}

/*
	Name: function_f314c888
	Namespace: namespace_1812c3f4
	Checksum: 0xDA64894B
	Offset: 0x2C20
	Size: 0xF4
	Parameters: 0
	Flags: Linked
*/
function function_f314c888()
{
	switch(level.var_85422c0e)
	{
		case "strauss":
		{
			var_b3b54a4 = #"hash_e353adc2878fc33";
			break;
		}
		case "carver":
		{
			var_b3b54a4 = #"hash_e354adc28791763";
			break;
		}
		case "grey":
		{
			var_b3b54a4 = #"hash_e354edc28791e2f";
			break;
		}
		default:
		{
			var_b3b54a4 = #"hash_e353adc2878fc33";
			break;
		}
	}
	level zm_vo::function_7622cb70(var_b3b54a4);
	level thread function_1de1e6b4();
}

/*
	Name: function_1de1e6b4
	Namespace: namespace_1812c3f4
	Checksum: 0x32C715F2
	Offset: 0x2D20
	Size: 0x802
	Parameters: 0
	Flags: Linked
*/
function function_1de1e6b4()
{
	level endon(#"end_game");
	waitframe(1);
	level.var_9674d6e2 zm_unitrigger::unregister_unitrigger(level.var_9674d6e2.s_unitrigger);
	level.var_9674d6e2 zm_unitrigger::function_fac87205(&function_c732de82, 64);
	level flag::set(#"ravenov_interact_vo_playing");
	level.ravenov zm_vo::function_d6f8bbd9(#"hash_1cebc7a22041890");
	level.ravenov zm_vo::function_d6f8bbd9(#"hash_1cebd7a22041a43");
	wait(0.5);
	level flag::clear(#"ravenov_interact_vo_playing");
	wait(10);
	level.var_9674d6e2 zm_unitrigger::function_fac87205(&function_c732de82, 64);
	level flag::set(#"ravenov_interact_vo_playing");
	level.ravenov zm_vo::function_d6f8bbd9(#"hash_22a8a913a347b9af");
	level.ravenov zm_vo::function_d6f8bbd9(#"hash_22a8a813a347b7fc");
	wait(0.5);
	level flag::clear(#"ravenov_interact_vo_playing");
	wait(10);
	level flag::wait_till_clear(#"hash_7b872eebd26623c5");
	level.var_9674d6e2 zm_unitrigger::function_fac87205(&function_c732de82, 64);
	level flag::set(#"ravenov_interact_vo_playing");
	level.ravenov zm_vo::function_d6f8bbd9(#"hash_7a0bc62112b2e716");
	wait(0.5);
	level flag::clear(#"ravenov_interact_vo_playing");
	wait(10);
	level.var_9674d6e2 zm_unitrigger::function_fac87205(&function_c732de82, 64);
	level flag::set(#"ravenov_interact_vo_playing");
	level.ravenov zm_vo::function_d6f8bbd9(#"hash_20e45efab9284bd5");
	level.ravenov zm_vo::function_d6f8bbd9(#"hash_20e45dfab9284a22");
	wait(0.5);
	level flag::clear(#"ravenov_interact_vo_playing");
	wait(10);
	level.var_9674d6e2 zm_unitrigger::function_fac87205(&function_c732de82, 64);
	level flag::set(#"ravenov_interact_vo_playing");
	level.ravenov zm_vo::function_d6f8bbd9(#"hash_6427ba6c6908d42c");
	level.ravenov zm_vo::function_d6f8bbd9(#"hash_6427bb6c6908d5df");
	wait(0.5);
	level flag::clear(#"ravenov_interact_vo_playing");
	wait(10);
	level.var_9674d6e2 zm_unitrigger::function_fac87205(&function_c732de82, 64);
	level flag::set(#"ravenov_interact_vo_playing");
	level.ravenov zm_vo::function_d6f8bbd9(#"hash_1cb9b8ab0038e9b");
	level.ravenov zm_vo::function_d6f8bbd9(#"hash_1cb9a8ab0038ce8");
	wait(0.5);
	level flag::clear(#"ravenov_interact_vo_playing");
	wait(10);
	level.var_9674d6e2 zm_unitrigger::function_fac87205(&function_c732de82, 64);
	level flag::set(#"ravenov_interact_vo_playing");
	level.ravenov zm_vo::function_d6f8bbd9(#"hash_72e6e8c4c447af2");
	level.ravenov zm_vo::function_d6f8bbd9(#"hash_72e6f8c4c447ca5");
	wait(0.5);
	level flag::clear(#"ravenov_interact_vo_playing");
	wait(10);
	level.var_9674d6e2 zm_unitrigger::function_fac87205(&function_c732de82, 64);
	level flag::set(#"ravenov_interact_vo_playing");
	level.ravenov zm_vo::function_d6f8bbd9(#"hash_7d020bf3da1a57f1");
	level.ravenov zm_vo::function_d6f8bbd9(#"hash_7d020af3da1a563e");
	wait(0.5);
	level flag::clear(#"ravenov_interact_vo_playing");
	wait(10);
	level.var_9674d6e2 zm_unitrigger::function_fac87205(&function_c732de82, 64);
	level flag::set(#"ravenov_interact_vo_playing");
	level.ravenov zm_vo::function_d6f8bbd9(#"hash_7a28a080860d8fb8");
	level.ravenov zm_vo::function_d6f8bbd9(#"hash_7a28a180860d916b");
	wait(0.5);
	level flag::clear(#"ravenov_interact_vo_playing");
	wait(10);
	level.var_9674d6e2 zm_unitrigger::function_fac87205(&function_c732de82, 64);
	level flag::set(#"ravenov_interact_vo_playing");
	level.ravenov zm_vo::function_d6f8bbd9(#"hash_39fcf62269d363ac");
	wait(0.5);
	level flag::clear(#"ravenov_interact_vo_playing");
	wait(10);
}

/*
	Name: function_c732de82
	Namespace: namespace_1812c3f4
	Checksum: 0x1F65A42F
	Offset: 0x3530
	Size: 0x58
	Parameters: 1
	Flags: Linked
*/
function function_c732de82(e_player)
{
	if(is_true(level.ravenov.isspeaking))
	{
		return false;
	}
	self sethintstring(#"hash_78573012d7272fae");
	return true;
}

/*
	Name: function_68c6149e
	Namespace: namespace_1812c3f4
	Checksum: 0x1063CD43
	Offset: 0x3590
	Size: 0x204
	Parameters: 0
	Flags: Linked
*/
function function_68c6149e()
{
	switch(level.var_85422c0e)
	{
		case "strauss":
		{
			var_b3b54a4 = array::random([2:#"hash_1b5b25733cdc44de", 1:#"hash_1b5b26733cdc4691", 0:#"hash_1b5b23733cdc4178"]);
			break;
		}
		case "carver":
		{
			var_b3b54a4 = array::random([2:#"hash_1b91a5733d0aadce", 1:#"hash_1b91a6733d0aaf81", 0:#"hash_1b91a3733d0aaa68"]);
			break;
		}
		case "grey":
		{
			var_b3b54a4 = array::random([2:#"hash_1b9f1d733d160412", 1:#"hash_1b9f1e733d1605c5", 0:#"hash_1b9f1b733d1600ac"]);
			break;
		}
		default:
		{
			var_b3b54a4 = array::random([2:#"hash_1b5b25733cdc44de", 1:#"hash_1b5b26733cdc4691", 0:#"hash_1b5b23733cdc4178"]);
			break;
		}
	}
	level thread zm_vo::function_7622cb70(var_b3b54a4);
}

/*
	Name: function_a71f7322
	Namespace: namespace_1812c3f4
	Checksum: 0x551EFE0
	Offset: 0x37A0
	Size: 0xDC
	Parameters: 0
	Flags: Linked
*/
function function_a71f7322()
{
	switch(level.var_85422c0e)
	{
		case "strauss":
		{
			var_b3b54a4 = #"hash_4a84679c88de5a62";
			break;
		}
		case "carver":
		{
			var_b3b54a4 = #"hash_4a84579c88de3f32";
			break;
		}
		case "grey":
		{
			var_b3b54a4 = #"hash_4a84539c88de3866";
			break;
		}
		default:
		{
			var_b3b54a4 = #"hash_4a84679c88de5a62";
			break;
		}
	}
	level thread zm_vo::function_7622cb70(var_b3b54a4);
}

/*
	Name: function_d50a530
	Namespace: namespace_1812c3f4
	Checksum: 0xE5B536CD
	Offset: 0x3888
	Size: 0x124
	Parameters: 0
	Flags: Linked, Private
*/
function private function_d50a530()
{
	level flag::wait_till_all([1:#"hash_2651a51980ef57ee", 0:#"hash_1dc3d47b1604d916"]);
	switch(level.var_85422c0e)
	{
		case "strauss":
		{
			var_b3b54a4 = #"hash_4b8ddfd962701e2e";
			break;
		}
		case "carver":
		{
			var_b3b54a4 = #"hash_4b8dcfd9627002fe";
			break;
		}
		case "grey":
		{
			var_b3b54a4 = #"hash_4b8dd3d9627009ca";
			break;
		}
		default:
		{
			var_b3b54a4 = #"hash_4b8ddfd962701e2e";
			break;
		}
	}
	level thread zm_vo::function_7622cb70(var_b3b54a4);
}

/*
	Name: function_7930927d
	Namespace: namespace_1812c3f4
	Checksum: 0x794B28EA
	Offset: 0x39B8
	Size: 0xDC
	Parameters: 0
	Flags: Linked
*/
function function_7930927d()
{
	switch(level.var_85422c0e)
	{
		case "strauss":
		{
			var_b3b54a4 = #"hash_7c4c4f063a9db5b8";
			break;
		}
		case "carver":
		{
			var_b3b54a4 = #"hash_7c4c5f063a9dd0e8";
			break;
		}
		case "grey":
		{
			var_b3b54a4 = #"hash_7c4c63063a9dd7b4";
			break;
		}
		default:
		{
			var_b3b54a4 = #"hash_7c4c4f063a9db5b8";
			break;
		}
	}
	level thread zm_vo::function_7622cb70(var_b3b54a4);
}

/*
	Name: function_3c870e42
	Namespace: namespace_1812c3f4
	Checksum: 0xA674DC59
	Offset: 0x3AA0
	Size: 0x44
	Parameters: 0
	Flags: None
*/
function function_3c870e42()
{
	level function_78cc0d39(#"hash_3329c0be8481aad4");
	level thread zm_vo::function_7622cb70(#"hash_60628311a3a18ac4");
}

/*
	Name: function_8cc97115
	Namespace: namespace_1812c3f4
	Checksum: 0x89543C6C
	Offset: 0x3AF0
	Size: 0x100
	Parameters: 0
	Flags: Linked
*/
function function_8cc97115()
{
	switch(level.var_85422c0e)
	{
		case "strauss":
		{
			var_3e86fd2e = #"hash_6dc5d7d4efbfbfa9";
			break;
		}
		case "carver":
		{
			var_3e86fd2e = #"hash_6dfc97d4efee9559";
			break;
		}
		case "grey":
		{
			var_3e86fd2e = #"hash_6dee97d4efe257fd";
			break;
		}
		default:
		{
			var_3e86fd2e = #"hash_6dc5d7d4efbfbfa9";
			break;
		}
	}
	if(level.var_b0f33564 < 5)
	{
		level zm_vo::function_7622cb70(var_3e86fd2e + level.var_b0f33564);
		level.var_b0f33564++;
	}
}

/*
	Name: function_ed7aab5b
	Namespace: namespace_1812c3f4
	Checksum: 0x4DFAE4A7
	Offset: 0x3BF8
	Size: 0xDC
	Parameters: 3
	Flags: Linked
*/
function function_ed7aab5b(var_75fb47b3, var_5566fac5, n_cooldown)
{
	if(!isdefined(n_cooldown))
	{
		n_cooldown = 120;
	}
	if(!self flag::get(var_5566fac5))
	{
		self flag::set(var_5566fac5);
		self thread zm_vo::function_7622cb70(var_75fb47b3);
		if(isplayer(self))
		{
			var_318863c = "disconnect";
		}
		else
		{
			var_318863c = "end_game";
		}
		self util::delay(n_cooldown, var_318863c, &flag::clear, var_5566fac5);
	}
}

