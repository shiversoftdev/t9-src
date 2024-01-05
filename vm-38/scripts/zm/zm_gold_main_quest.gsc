#using scripts\zm\zm_gold_ww_quest.gsc;
#using script_60d2812480bc5591;
#using scripts\zm\zm_gold.gsc;
#using script_6cc18c65e4f06fd0;
#using script_7492032440d4d998;
#using script_5fd73298643b6fff;
#using script_1d777b787ec7d4bb;
#using script_1e13c013927b6692;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_vo.gsc;
#using script_3e5784d8fa74c940;
#using script_5404bcacf34a92d;
#using script_b9d273dc917ee1f;
#using scripts\zm_common\zm_sq.gsc;
#using scripts\zm_common\zm_devgui.gsc;
#using script_3411bb48d41bd3b;
#using scripts\zm_common\zm_zonemgr.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_ui_inventory.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\callbacks.gsc;
#using script_3357acf79ce92f4b;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\status_effects\status_effect_util.gsc;
#using script_7bacb32f8222fa3e;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_af171776;

/*
	Name: function_69b64c96
	Namespace: namespace_af171776
	Checksum: 0xA87D03A
	Offset: 0xA38
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_69b64c96()
{
	level notify(1718276923);
}

/*
	Name: init
	Namespace: namespace_af171776
	Checksum: 0xB334682E
	Offset: 0xA58
	Size: 0x6EC
	Parameters: 0
	Flags: Linked
*/
function init()
{
	clientfield::register("scriptmover", "" + #"hash_6f292901e2fcaeb3", 16000, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_5eccf9a3ab802cf7", 16000, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_571f15e1b82b6e1e", 16000, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_13b42b800d7ddc38", 16000, 1, "counter");
	clientfield::register("scriptmover", "" + #"hash_4e18b4bbb52e74bb", 16000, 2, "int");
	clientfield::register("scriptmover", "" + #"hash_a3ff7de846a027f", 16000, 1, "counter");
	clientfield::register("scriptmover", "" + #"hash_3ee70ebc06c36969", 16000, 1, "int");
	clientfield::register("world", "" + #"hash_493518ca957daaea", 16000, 2, "int");
	clientfield::register("actor", "" + #"hash_7dc2e40e04fdfbad", 16000, 1, "counter");
	clientfield::register("toplayer", "" + #"hash_5120ca20225a7324", 16000, 1, "counter");
	clientfield::register("world", "" + #"hash_2e532832d80e7afb", 16000, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_33a2a9faed4bf8d9", 16000, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_5db889fa88fbbe02", 16000, getminbitcountfornum(4), "int");
	clientfield::register("scriptmover", "" + #"hash_46bf4cc1eea0741a", 16000, 1, "int");
	clientfield::register("toplayer", "" + #"hash_d4826b65faa9efb", 16000, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_6ab08e0e1cffcd35", 16000, 1, "int");
	clientfield::register("world", "" + #"hash_6c7ee343dab35f07", 16000, 1, "int");
	level thread function_b7fb7df6();
	if(!zm_utility::is_ee_enabled())
	{
		return;
	}
	function_e983f15a();
	level.var_3034d7b8 = &function_d5d67561;
	callback::on_item_pickup(&on_item_pickup);
	level.var_2912d8c5 = 0;
	level thread function_de84b08d();
	level thread function_e12506e5();
	level thread function_e9c07a3d();
	level.var_9a81036b = getent("vgnt_peck", "targetname");
	level.var_9f1e2800 = getent("vgnt_peck_chir", "targetname");
	level.var_9a81036b.animname = "peck";
	level.var_9f1e2800.animname = "peck_chair";
	level.var_96689f39 = array(level.var_9f1e2800, level.var_9a81036b);
	level.var_90655717 = struct::get("trg_pk", "targetname");
	level thread scene::play("aib_t9_zm_vign_peck_seated_01", "seated_loop", level.var_96689f39);
	level thread function_b21632bf("1");
	level thread function_b21632bf("2");
	level thread function_b21632bf("3");
	level thread function_b21632bf("4");
	level thread function_520b958d();
	callback::on_spawned(&function_be0bcb78);
	/#
		level thread devgui_setup();
	#/
}

/*
	Name: function_be0bcb78
	Namespace: namespace_af171776
	Checksum: 0x8366CCA3
	Offset: 0x1150
	Size: 0x9C
	Parameters: 0
	Flags: Linked
*/
function function_be0bcb78()
{
	level endon(#"end_game");
	self endon(#"death");
	if(self zm_stats::get_map_stat(#"main_quest_completed") && !self zm_stats::function_376778d3(#"hash_de5dd4ba9aa676c"))
	{
		self thread namespace_4abf1500::collect_intel(#"hash_de5dd4ba9aa676c");
	}
}

/*
	Name: function_e983f15a
	Namespace: namespace_af171776
	Checksum: 0xC7457E58
	Offset: 0x11F8
	Size: 0x3CC
	Parameters: 0
	Flags: Linked
*/
function function_e983f15a()
{
	level zm_sq::register(#"hash_40f667cdf0bccad4", #"hash_22b789728918395f", #"hash_342e10211feb6e85", &function_899080e4, &function_a23c9017);
	level zm_sq::register(#"hash_40f667cdf0bccad4", #"hash_3feee5b58a00d16c", #"hash_342e0d211feb696c", &function_db7d739a, &function_6eb8a9b2);
	level zm_sq::register(#"hash_40f667cdf0bccad4", #"hash_488b680e29b812d", #"hash_342e0e211feb6b1f", &function_2fd63927, &function_4d5b1342);
	level zm_sq::register(#"hash_40f667cdf0bccad4", #"hash_1a7551970d707039", #"hash_342e0b211feb6606", &function_cd4fe3bf, &function_2084058e);
	level zm_sq::register(#"hash_40f667cdf0bccad4", #"hash_638edd9b0b05cd3b", #"hash_342e0c211feb67b9", &function_6184283f, &function_74b83d82);
	level zm_sq::register(#"hash_40f667cdf0bccad4", #"hash_474aeb01bf3e2726", #"hash_342e09211feb62a0", &function_72036ab1, &function_86a23fd4);
	level zm_sq::register(#"hash_40f667cdf0bccad4", #"hash_25befcacd1e78ac7", #"hash_342e0a211feb6453", &function_62d6b8df, &function_157c5321);
	level zm_sq::register(#"hash_40f667cdf0bccad4", #"hash_1953096735765f35", #"hash_342e17211feb7a6a", &function_8365add8, &function_b78a218b);
	level zm_sq::register(#"hash_40f667cdf0bccad4", #"hash_1cb2e993ffa829f0", #"hash_276792e11fed422e", &function_32fba4cd, &function_aba92bd4);
	level zm_sq::register(#"hash_40f667cdf0bccad4", #"end_fight", #"hash_3130208028a11b3", &namespace_c4d353e7::function_79868b3b, &namespace_c4d353e7::function_ec198408, 1);
}

/*
	Name: function_d5d67561
	Namespace: namespace_af171776
	Checksum: 0x31BB32F3
	Offset: 0x15D0
	Size: 0x58
	Parameters: 0
	Flags: Linked
*/
function function_d5d67561()
{
	level flag::set(#"main_quest_completed");
	level notify(#"end_game", {#reason:#"main_quest_completed"});
}

/*
	Name: function_e9c07a3d
	Namespace: namespace_af171776
	Checksum: 0xCC05F84A
	Offset: 0x1630
	Size: 0x74
	Parameters: 0
	Flags: Linked
*/
function function_e9c07a3d()
{
	level flag::wait_till("pap_quest_completed");
	level thread scene::play("p9_fxanim_zm_gold_shutters_peck_bundle", "open");
	level zm_sq::start(#"hash_40f667cdf0bccad4", 1);
}

/*
	Name: function_899080e4
	Namespace: namespace_af171776
	Checksum: 0x49EC09F3
	Offset: 0x16B0
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function function_899080e4(b_skipped)
{
	if(b_skipped)
	{
		return;
	}
	level thread function_cd7e8422();
	level flag::wait_till(#"hash_652c6116077f444e");
}

/*
	Name: function_cd7e8422
	Namespace: namespace_af171776
	Checksum: 0xDBC3AEF8
	Offset: 0x1708
	Size: 0xFC
	Parameters: 0
	Flags: Linked
*/
function function_cd7e8422()
{
	level endon(#"end_game", #"hash_652c6116077f444e");
	if(isdefined(level.var_90655717))
	{
		/#
			level thread function_f7a25ad5(level.var_90655717);
		#/
		level.var_90655717 zm_unitrigger::unregister_unitrigger(level.var_90655717.s_unitrigger);
		level.var_90655717 zm_unitrigger::function_fac87205(#"hash_8907bffd7ded28e", 100);
		function_80b4d925();
		level thread function_720b3a4d();
	}
	level flag::set(#"hash_652c6116077f444e");
}

/*
	Name: function_f7a25ad5
	Namespace: namespace_af171776
	Checksum: 0xBC19179B
	Offset: 0x1810
	Size: 0xCE
	Parameters: 1
	Flags: None
*/
function function_f7a25ad5(var_23d9277f)
{
	/#
		level endon(#"end_game", #"hash_1943cbe07e8dd438", #"hash_7c153e7ca15e550f");
		while(true)
		{
			if(getdvarint(#"zm_debug_ee", 0))
			{
				circle(var_23d9277f.origin, 8, (0, 1, 0));
				print3d(var_23d9277f.origin, "", (0, 1, 0), 1, 0.15);
			}
			waitframe(1);
		}
	#/
}

/*
	Name: function_a23c9017
	Namespace: namespace_af171776
	Checksum: 0x186C6DEF
	Offset: 0x18E8
	Size: 0x8C
	Parameters: 2
	Flags: Linked
*/
function function_a23c9017(b_skipped, var_19e802fa)
{
	if(b_skipped || var_19e802fa)
	{
		zm_utility::function_d729de6a(0, [0:#"zone_napalm_strike2"]);
		level thread function_720b3a4d();
		level flag::set(#"hash_652c6116077f444e");
	}
}

/*
	Name: function_720b3a4d
	Namespace: namespace_af171776
	Checksum: 0x2382E342
	Offset: 0x1980
	Size: 0x4B4
	Parameters: 0
	Flags: Linked
*/
function function_720b3a4d()
{
	level endon(#"hash_1943cbe07e8dd438", #"end_game", #"hash_7c153e7ca15e550f");
	level.var_9a81036b childthread namespace_1812c3f4::function_20df51b5();
	level.var_90655717 zm_unitrigger::unregister_unitrigger(level.var_90655717.s_unitrigger);
	level.var_90655717 zm_unitrigger::function_fac87205(&function_946d65b9, 100);
	level flag::set(#"hash_105197dc3cc8052e");
	namespace_1812c3f4::function_e8d13d70();
	level.var_9a81036b zm_vo::function_d6f8bbd9(#"hash_ad52c3bd713e833");
	namespace_1812c3f4::function_98b949fc();
	level flag::clear(#"hash_105197dc3cc8052e");
	wait(5);
	level.var_90655717 zm_unitrigger::function_fac87205(&function_946d65b9, 100);
	level flag::set(#"hash_105197dc3cc8052e");
	namespace_1812c3f4::function_e8d13d70();
	level.var_9a81036b zm_vo::function_d6f8bbd9(#"hash_6b8f6203fe49d418");
	level.var_9a81036b zm_vo::function_d6f8bbd9(#"hash_6b8f6303fe49d5cb");
	level.var_9a81036b zm_vo::function_d6f8bbd9(#"hash_6b8f6403fe49d77e");
	namespace_1812c3f4::function_98b949fc();
	level flag::clear(#"hash_105197dc3cc8052e");
	wait(5);
	level.var_90655717 zm_unitrigger::function_fac87205(&function_946d65b9, 100);
	level flag::set(#"hash_105197dc3cc8052e");
	namespace_1812c3f4::function_e8d13d70();
	level.var_9a81036b zm_vo::function_d6f8bbd9(#"hash_298847060a5d326d");
	level.var_9a81036b zm_vo::function_d6f8bbd9(#"hash_298846060a5d30ba");
	namespace_1812c3f4::function_98b949fc();
	level flag::clear(#"hash_105197dc3cc8052e");
	wait(5);
	level.var_90655717 zm_unitrigger::function_fac87205(&function_946d65b9, 100);
	level flag::set(#"hash_105197dc3cc8052e");
	namespace_1812c3f4::function_e8d13d70();
	level.var_9a81036b zm_vo::function_d6f8bbd9(#"hash_76f1c94c57b3ed2a");
	namespace_1812c3f4::function_98b949fc();
	level flag::clear(#"hash_105197dc3cc8052e");
	wait(5);
	level.var_90655717 zm_unitrigger::function_fac87205(&function_946d65b9, 100);
	level flag::set(#"hash_105197dc3cc8052e");
	namespace_1812c3f4::function_e8d13d70();
	level.var_9a81036b zm_vo::function_d6f8bbd9(#"hash_4322136ed988079f");
	level.var_9a81036b zm_vo::function_d6f8bbd9(#"hash_4322126ed98805ec");
	namespace_1812c3f4::function_98b949fc();
	level flag::clear(#"hash_105197dc3cc8052e");
}

/*
	Name: function_946d65b9
	Namespace: namespace_af171776
	Checksum: 0x6A84B988
	Offset: 0x1E40
	Size: 0xA0
	Parameters: 1
	Flags: Linked
*/
function function_946d65b9(e_player)
{
	if(is_true(level.var_9a81036b.isspeaking) || level flag::get("dr_peck_mq_vignette_talking") || level flag::get(#"hash_105197dc3cc8052e"))
	{
		return false;
	}
	self sethintstring(#"hash_8907bffd7ded28e");
	return true;
}

/*
	Name: function_db7d739a
	Namespace: namespace_af171776
	Checksum: 0x76A6EA1C
	Offset: 0x1EE8
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function function_db7d739a(b_skipped)
{
	if(b_skipped)
	{
		return;
	}
	level thread function_9a978ce6();
	level flag::wait_till(#"hash_7f78ed1043c221b7");
}

/*
	Name: function_e12506e5
	Namespace: namespace_af171776
	Checksum: 0x2A646DE3
	Offset: 0x1F40
	Size: 0x140
	Parameters: 0
	Flags: Linked
*/
function function_e12506e5()
{
	level flag::wait_till("start_zombie_round_logic");
	level.var_8986480a = struct::get_array("compound_pos", "script_noteworthy");
	foreach(var_59481abd in level.var_8986480a)
	{
		var_59481abd.locker = getent(var_59481abd.target, "targetname");
		var_59481abd.reader = getent(var_59481abd.targetname, "script_noteworthy");
		var_59481abd.reader clientfield::set("" + #"hash_4e18b4bbb52e74bb", 2);
	}
}

/*
	Name: function_bd9ebda
	Namespace: namespace_af171776
	Checksum: 0xC14969C6
	Offset: 0x2088
	Size: 0x33A
	Parameters: 0
	Flags: Linked
*/
function function_bd9ebda()
{
	level endon(#"end_game", #"hash_7f78ed1043c221b7");
	if(isdefined(self))
	{
		e_activator = self zm_unitrigger::function_fac87205(#"hash_4b5445f8ee28bc1", 60);
		if(isplayer(e_activator))
		{
			e_activator function_bc82f900(#"hash_3937704286348bfa");
		}
		point = function_4ba8fde(#"hash_5ce83280d3f2e00" + self.targetname);
		var_d9c4a4a7 = struct::get(self.reader.target, "targetname");
		self.card = util::spawn_model(#"hash_59568dab0af5e9db", var_d9c4a4a7.origin, var_d9c4a4a7.angles);
		self.card moveto(self.card.origin + (vectorscale((0, 0, -1), 18)), 0.4, 0.1, 0.1);
		self.card playsound(#"hash_29005ff29a7ee6e6");
		self.card waittill(#"movedone");
		self.card delete();
		self.reader clientfield::set("" + #"hash_4e18b4bbb52e74bb", 1);
		wait(1);
		switch(self.targetname)
		{
			case "hash_285f077e557a5131":
			{
				level thread scene::play(#"p9_fxanim_ger_tank_cabinet_metal_standing_01_bundle");
				break;
			}
			case "hash_20ff4f7e51aa9656":
			{
				level thread scene::play(#"p9_fxanim_ger_tank_cabinet_metal_standing_01_bundle_02");
				break;
			}
			case "hash_c5a4324c7d54618":
			{
				level thread scene::play(#"p9_fxanim_ger_tank_cabinet_metal_standing_01_bundle_03");
				break;
			}
		}
		var_854fb47e = item_drop::drop_item(0, undefined, 1, 0, point.id, self.origin, self.angles, 0);
		var_854fb47e.var_dd21aec2 = 1 | 16;
	}
}

/*
	Name: function_4a9e112c
	Namespace: namespace_af171776
	Checksum: 0x62FADD89
	Offset: 0x23D0
	Size: 0x13C
	Parameters: 0
	Flags: Linked
*/
function function_4a9e112c()
{
	level endon(#"end_game", #"hash_7f78ed1043c221b7");
	zone_name = self.zone_name;
	level flag::clear("spawn_zombies");
	dog_count = 4 + (getplayers().size * 2);
	if(isdefined(level.var_e2aef122))
	{
		level.var_e2aef122 = level.var_e2aef122 + dog_count;
	}
	while(dog_count > 0)
	{
		ai = zm_utility::function_cce73165("dog_location", #"hash_7a8b592728eec95d", #"zone_field_hospital");
		if(isdefined(ai))
		{
			dog_count--;
			ai.var_ba75c6dc = 1;
		}
		waitframe(1);
	}
	level flag::set("spawn_zombies");
}

/*
	Name: function_9a978ce6
	Namespace: namespace_af171776
	Checksum: 0x12B0E906
	Offset: 0x2518
	Size: 0x634
	Parameters: 0
	Flags: Linked
*/
function function_9a978ce6()
{
	level endon(#"end_game", #"hash_7f78ed1043c221b7");
	level notify(#"hash_2ef294d4837fda33");
	level.var_9674d6e2 zm_unitrigger::unregister_unitrigger(level.var_9674d6e2.s_unitrigger);
	if(zm_zonemgr::any_player_in_zone("zone_atrium"))
	{
		var_921eb5ac = 0;
		foreach(player in getplayers())
		{
			if(zm_vo::function_c10c4064(player))
			{
				var_921eb5ac = 1;
				break;
			}
		}
		if(var_921eb5ac)
		{
			wait(4);
		}
	}
	level.var_9674d6e2 zm_unitrigger::function_fac87205(#"hash_78573012d7272fae", 64);
	level scene::stop(level.ravenov.current_scene);
	level thread function_2d9a6efe();
	level thread zm_vo::function_7622cb70(#"hash_115bf9a5f6cd2107", undefined, undefined, undefined, 1);
	zm_utility::function_d729de6a(1, [0:#"zone_atrium"]);
	level scene::play("aib_t9_zm_vign_cust_frbz_rav_vignette_02", level.var_3ebc9062);
	level thread scene::play("aib_t9_zm_vign_rav_seated_01", "seated_loop_1", level.var_3ebc9062);
	zm_utility::function_d729de6a(0, [0:#"zone_atrium"]);
	level flag::wait_till(#"accesscard_picked_up");
	if(isarray(level.var_8986480a))
	{
		array::thread_all(level.var_8986480a, &function_bd9ebda);
	}
	level flag::wait_till_all([2:#"hash_6a27b5e2ac791e2a", 1:#"hash_49f375553940bfed", 0:#"hash_29d5efd7e75d2cef"]);
	var_135b1c0e = struct::get("cm_pos", "targetname");
	var_1e019b9b = getent("dd_pos", "targetname");
	e_activator = var_135b1c0e zm_unitrigger::function_fac87205(&function_4460c48, 64);
	if(isplayer(e_activator))
	{
		e_activator function_bc82f900(#"hash_3937704286348bfa");
	}
	level flag::set(#"hash_54b5f60de17405f");
	level thread function_e8a759be();
	level thread util::delay(#"hash_b6dcc686f41e64", "end_game", &namespace_1812c3f4::function_a71f7322);
	level thread function_b88f30aa(var_135b1c0e);
	level scene::play(#"p9_fxanim_zm_gold_chemical_mixer_bundle", "play");
	level flag::clear(#"hash_54b5f60de17405f");
	e_activator = var_135b1c0e zm_unitrigger::function_fac87205(#"hash_64df4f391c0175fa", 64);
	if(isplayer(e_activator))
	{
		e_activator function_bc82f900(#"hash_3937704286348bfa");
	}
	level scene::play(#"p9_fxanim_zm_gold_chemical_mixer_bundle", "transfer");
	if(isdefined(var_1e019b9b))
	{
		point = function_4ba8fde(#"hash_70390dd4007cdd9e");
		var_32ec11a3 = item_drop::drop_item(0, undefined, 1, 0, point.id, var_1e019b9b.origin, var_1e019b9b.angles, 0);
		var_32ec11a3.var_dd21aec2 = 1 | 16;
		var_1e019b9b thread util::delayed_delete(1);
	}
	level flag::wait_till(#"hash_3daef4d64d9ddc57");
	level flag::set(#"hash_7f78ed1043c221b7");
}

/*
	Name: function_2d9a6efe
	Namespace: namespace_af171776
	Checksum: 0xFB91254B
	Offset: 0x2B58
	Size: 0xE2
	Parameters: 0
	Flags: Linked, Private
*/
function private function_2d9a6efe()
{
	level waittill(#"hash_b56ebec328804aa");
	var_254ceca7 = struct::get("ac_pos", "targetname");
	level scene::play(#"hash_12ffbe477b23e132");
	point = function_4ba8fde(#"hash_70390ed4007cdf51");
	var_a9b4d006 = item_drop::drop_item(0, undefined, 1, 0, point.id, var_254ceca7.origin, var_254ceca7.angles, 0);
	var_a9b4d006.var_dd21aec2 = 1 | 16;
}

/*
	Name: function_4460c48
	Namespace: namespace_af171776
	Checksum: 0xDD87EC00
	Offset: 0x2C48
	Size: 0x58
	Parameters: 1
	Flags: Linked, Private
*/
function private function_4460c48(e_player)
{
	if(level flag::get(#"power_on3"))
	{
		self sethintstring(#"hash_4454d82241a74c59");
		return true;
	}
	return false;
}

/*
	Name: function_b88f30aa
	Namespace: namespace_af171776
	Checksum: 0x1F1EFE03
	Offset: 0x2CB0
	Size: 0x124
	Parameters: 1
	Flags: Linked, Private
*/
function private function_b88f30aa(var_63b11ed2)
{
	level endon(#"hash_2272aaadd9c5a70f");
	level waittill(#"hash_7aa56c9c2f9ef59a");
	while(true)
	{
		a_players = function_a1ef346b();
		foreach(player in a_players)
		{
			if(distancesquared(player.origin, var_63b11ed2.origin) < 62500)
			{
				player function_bc82f900(#"hash_3937704286348bfa");
			}
		}
		wait(0.3);
	}
}

/*
	Name: function_e8a759be
	Namespace: namespace_af171776
	Checksum: 0xE304DA23
	Offset: 0x2DE0
	Size: 0x54
	Parameters: 1
	Flags: Linked, Private
*/
function private function_e8a759be(var_9c84fce2)
{
	wait(5);
	level flag::set(#"hash_2e2ac44c0ab09fa");
	wait(3);
	level thread function_4a9e112c();
}

/*
	Name: function_6eb8a9b2
	Namespace: namespace_af171776
	Checksum: 0x1C238D5F
	Offset: 0x2E40
	Size: 0xD4
	Parameters: 2
	Flags: Linked
*/
function function_6eb8a9b2(b_skipped, var_19e802fa)
{
	if(b_skipped || var_19e802fa)
	{
		level notify(#"hash_2ef294d4837fda33");
		if(!level flag::get("accesscard_picked_up"))
		{
			level flag::set(#"accesscard_picked_up");
			level thread namespace_1812c3f4::function_1de1e6b4();
		}
		zm_utility::function_d729de6a(0, [0:#"zone_atrium"]);
		level flag::set(#"hash_7f78ed1043c221b7");
	}
}

/*
	Name: function_2fd63927
	Namespace: namespace_af171776
	Checksum: 0x1FF0480E
	Offset: 0x2F20
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function function_2fd63927(b_skipped)
{
	if(b_skipped)
	{
		return;
	}
	level thread function_ad7dbaa3();
	level flag::wait_till(#"hash_1943cbe07e8dd438");
}

/*
	Name: function_ad7dbaa3
	Namespace: namespace_af171776
	Checksum: 0x9188B71C
	Offset: 0x2F78
	Size: 0x24C
	Parameters: 0
	Flags: Linked
*/
function function_ad7dbaa3()
{
	level endon(#"end_game", #"hash_1943cbe07e8dd438");
	var_13e92fe1 = struct::get(#"hash_4c49d1366b79372d", "targetname");
	var_44a8a9e4 = struct::get(#"hash_116f2cc8bcae7371", "targetname");
	e_activator = var_44a8a9e4 zm_unitrigger::function_fac87205(#"hash_407517c7604d95b7", 60);
	if(isplayer(e_activator))
	{
		e_activator function_bc82f900(#"hash_3937704286348bfa");
	}
	var_1e019b9b = util::spawn_model("tag_origin", var_13e92fe1.origin, var_13e92fe1.angles);
	var_1e019b9b playsound(#"hash_94fdf10a792f5fb");
	var_1e019b9b playsound(#"hash_1cc97472d1a1ac95");
	level clientfield::set("" + #"hash_493518ca957daaea", 1);
	level thread function_50f8e514(var_13e92fe1);
	level scene::play(#"hash_6bf2ab72626e5ebf");
	function_b3524864();
	function_31b6fa5b();
	level clientfield::set("" + #"hash_493518ca957daaea", 2);
	level flag::set(#"hash_1943cbe07e8dd438");
}

/*
	Name: function_4d5b1342
	Namespace: namespace_af171776
	Checksum: 0x2098FDE
	Offset: 0x31D0
	Size: 0xB4
	Parameters: 2
	Flags: Linked
*/
function function_4d5b1342(b_skipped, var_19e802fa)
{
	if(b_skipped || var_19e802fa)
	{
		zm_utility::function_d729de6a(0, [0:#"zone_napalm_strike2"]);
		level.var_90655717 zm_unitrigger::unregister_unitrigger(level.var_90655717.s_unitrigger);
		level thread function_355a2ff4();
		level flag::set(#"hash_1943cbe07e8dd438");
	}
}

/*
	Name: function_50f8e514
	Namespace: namespace_af171776
	Checksum: 0xEE4D6D86
	Offset: 0x3290
	Size: 0x124
	Parameters: 1
	Flags: Linked, Private
*/
function private function_50f8e514(var_99402def)
{
	level endon(#"hash_20230fbbd136c229");
	level waittill(#"hash_79f8116ea4cf5158");
	while(true)
	{
		a_players = function_a1ef346b();
		foreach(player in a_players)
		{
			if(distancesquared(player.origin, var_99402def.origin) < 62500)
			{
				player function_bc82f900(#"hash_3937704286348bfa");
			}
		}
		wait(0.3);
	}
}

/*
	Name: function_cd4fe3bf
	Namespace: namespace_af171776
	Checksum: 0x6382663F
	Offset: 0x33C0
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function function_cd4fe3bf(b_skipped)
{
	if(b_skipped)
	{
		return;
	}
	level thread function_b509640();
	level flag::wait_till(#"hash_b60b8708c801044");
}

/*
	Name: function_cbb8aadb
	Namespace: namespace_af171776
	Checksum: 0x4CBC04F6
	Offset: 0x3418
	Size: 0xA8
	Parameters: 1
	Flags: Linked
*/
function function_cbb8aadb(e_player)
{
	if(isplayer(e_player))
	{
		if(level flag::get("power_on" + self.stub.var_b555f02e))
		{
			self sethintstring(#"hash_4f9c1da05cedb79");
			return true;
		}
		self sethintstring(#"hash_71158766520dc432");
		return true;
	}
	return false;
}

/*
	Name: function_341f3901
	Namespace: namespace_af171776
	Checksum: 0xDC3F72DD
	Offset: 0x34C8
	Size: 0xE8
	Parameters: 0
	Flags: Linked
*/
function function_341f3901()
{
	level endon(#"end_game");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"trigger");
		player = waitresult.activator;
		if(!level flag::get("power_on" + self.stub.var_b555f02e))
		{
			continue;
		}
		player function_bc82f900(#"hash_3937704286348bfa");
		level notify(#"hash_34b4fc2dc060acdd");
		zm_unitrigger::unregister_unitrigger(self.stub);
	}
}

/*
	Name: function_b509640
	Namespace: namespace_af171776
	Checksum: 0x986AD481
	Offset: 0x35B8
	Size: 0x394
	Parameters: 0
	Flags: Linked
*/
function function_b509640()
{
	level endon(#"end_game", #"hash_b60b8708c801044");
	mdl_mts = getent("mdl_mts", "targetname");
	var_580d9e4f = mdl_mts zm_unitrigger::create(&function_cbb8aadb, 60, &function_341f3901);
	var_580d9e4f.var_b555f02e = mdl_mts.script_int;
	level childthread function_b8091725(mdl_mts);
	level waittill(#"hash_34b4fc2dc060acdd");
	mdl_mts playsound(#"hash_9b358b6ff20162b");
	level flag::set(#"hash_2aa7dafe13615e92");
	level thread function_3d2f9ce0();
	mdl_mts thread function_3c3fc3c6();
	level flag::wait_till_all([2:#"hash_18e72857cd13a082", 1:#"hash_d5792142b22f671", 0:#"hash_18e72757cd139ecf"]);
	mdl_mts zm_vo::function_d6f8bbd9(#"hash_26be0908167ccec");
	var_bb8974cd = util::spawn_model(#"p9_rus_floppy_disk_01", struct::get("fd_pos", "targetname").origin, struct::get("fd_pos", "targetname").angles);
	var_bb8974cd moveto(struct::get("fd_pos", "targetname").origin + (5, 3, 0), 1, 0.25, 0.25);
	var_bb8974cd waittill(#"movedone");
	point = function_4ba8fde(#"hash_4a5e27a7820eb0c2");
	var_cd1e9ad1 = item_drop::drop_item(0, undefined, 1, 0, point.id, var_bb8974cd.origin, var_bb8974cd.angles, 0);
	var_cd1e9ad1 = 1 | 16;
	var_bb8974cd delete();
	zm_unitrigger::unregister_unitrigger(mdl_mts.s_unitrigger);
	level flag::wait_till(#"hash_4f85be0e86e8cb3a");
	level flag::set(#"hash_b60b8708c801044");
}

/*
	Name: function_b21632bf
	Namespace: namespace_af171776
	Checksum: 0x91B4D098
	Offset: 0x3958
	Size: 0x22C
	Parameters: 1
	Flags: Linked
*/
function function_b21632bf(var_7961a37e)
{
	level endon(#"end_game", #"hash_b60b8708c801044");
	var_15bb9460 = struct::get("mt_pos_" + var_7961a37e, "targetname");
	var_10ce7806 = util::spawn_model(#"hash_f93e1bf903e219b", var_15bb9460.origin, var_15bb9460.angles);
	level flag::wait_till(#"hash_2aa7dafe13615e92");
	var_10ce7806 thread util::delayed_delete(1);
	while(true)
	{
		point = function_4ba8fde(#"hash_703910d4007ce2b7");
		var_c511e32c = item_drop::drop_item(0, getweapon(#"hash_f223cacb02788e3"), 1, 0, point.id, var_15bb9460.origin, var_15bb9460.angles, 0);
		var_c511e32c.var_dd21aec2 = 1 | 16;
		var_c511e32c.var_7961a37e = var_7961a37e;
		var_ee062de6 = 0;
		while(!is_true(var_ee062de6))
		{
			waitresult = undefined;
			waitresult = level waittill(#"hash_52b46513284ae413", #"hash_6382150c7bec4fd9");
			if(isdefined(waitresult.id))
			{
				if(waitresult.id == var_7961a37e)
				{
					var_ee062de6 = 1;
				}
			}
		}
		var_ee062de6 = 0;
		wait(3);
	}
}

/*
	Name: function_3d2f9ce0
	Namespace: namespace_af171776
	Checksum: 0x4499C6AA
	Offset: 0x3B90
	Size: 0x2B0
	Parameters: 0
	Flags: Linked
*/
function function_3d2f9ce0()
{
	level endon(#"end_game", #"hash_b60b8708c801044");
	level.var_74c83b1e = [2:"motor_pool", 1:"military_command", 0:"peck_quarters"];
	var_ad024dca = struct::get_array("msp_pos_01", "targetname");
	var_7c69ae3a = struct::get_array("msp_pos_02", "targetname");
	var_5682f38c = struct::get_array("msp_pos_03", "targetname");
	level thread function_863a7434();
	while(true)
	{
		if(level.var_74c83b1e.size == 0 || !isdefined(level.var_74c83b1e))
		{
			break;
		}
		var_a518682b = array::random(level.var_74c83b1e);
		/#
			iprintlnbold(("" + var_a518682b) + "");
		#/
		level flag::clear(#"hash_36004301ded71d07");
		switch(var_a518682b)
		{
			case "peck_quarters":
			{
				level thread function_aa3414cb(var_ad024dca, #"hash_1e5b6d005e2b1d26", "zone_peck_quarters");
				break;
			}
			case "military_command":
			{
				level thread function_aa3414cb(var_7c69ae3a, #"coordinates", "zone_chopper_gunner3");
				break;
			}
			case "motor_pool":
			{
				level thread function_aa3414cb(var_5682f38c, #"hash_1e5b6c005e2b1b73", "zone_trenches");
				break;
			}
		}
		level flag::wait_till(#"hash_36004301ded71d07");
	}
}

/*
	Name: function_863a7434
	Namespace: namespace_af171776
	Checksum: 0x63A0BBB2
	Offset: 0x3E48
	Size: 0xD6
	Parameters: 0
	Flags: Linked
*/
function function_863a7434()
{
	level endon(#"end_game", #"hash_b60b8708c801044");
	while(true)
	{
		level flag::wait_till(#"hash_55a1375be913ab9");
		level waittill(#"end_of_round");
		if(flag::get(#"hash_55a1375be913ab9"))
		{
			level flag::clear(#"hash_55a1375be913ab9");
			level flag::set(#"hash_36004301ded71d07");
		}
		waitframe(1);
	}
}

/*
	Name: function_aa3414cb
	Namespace: namespace_af171776
	Checksum: 0xE2C53449
	Offset: 0x3F28
	Size: 0x19C
	Parameters: 3
	Flags: Linked
*/
function function_aa3414cb(a_pos, var_753342a3, str_zone_name)
{
	level endon(#"end_game", #"hash_b60b8708c801044");
	while(zm_zonemgr::get_players_in_zone(str_zone_name) !== 0)
	{
		waitframe(1);
	}
	var_b6246671 = array::random(a_pos);
	if(isdefined(var_b6246671))
	{
		level.var_aff5d50e = spawnactor("spawner_bo5_mimic", var_b6246671.origin, var_b6246671.angles, undefined, 1);
		if(isdefined(level.var_aff5d50e))
		{
			level.var_aff5d50e.var_d9558be1 = var_753342a3;
			level.var_aff5d50e callback::on_death(&function_4741f2d1);
			level.var_aff5d50e.var_7a5e475 = 1;
			level.var_aff5d50e callback::function_d8abfc3d(#"hash_29cb63a7ebb5d699", &namespace_808e3265::function_b7bf6e96);
			level.var_aff5d50e callback::function_d8abfc3d(#"hash_484127e0cbd8f8cb", &namespace_808e3265::function_64515cbe);
		}
	}
}

/*
	Name: function_4741f2d1
	Namespace: namespace_af171776
	Checksum: 0xB854390F
	Offset: 0x40D0
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function function_4741f2d1(params)
{
	level flag::set(#"hash_55a1375be913ab9");
}

/*
	Name: function_3c3fc3c6
	Namespace: namespace_af171776
	Checksum: 0xA19511D0
	Offset: 0x4108
	Size: 0x380
	Parameters: 0
	Flags: Linked
*/
function function_3c3fc3c6()
{
	level endon(#"end_game", #"hash_b60b8708c801044");
	self endon(#"death");
	while(true)
	{
		self zm_unitrigger::create(&function_5ed3ff52, 100);
		waitresult = undefined;
		waitresult = self waittill(#"trigger_activated");
		zm_unitrigger::unregister_unitrigger(self.s_unitrigger);
		if(!isdefined(waitresult.e_who.var_348162a4))
		{
			continue;
		}
		self playsound(#"hash_47eb58f0e1a10de8");
		if(isplayer(waitresult.e_who))
		{
			if(isdefined(waitresult.e_who.var_646dca28.var_d9558be1))
			{
				switch(waitresult.e_who.var_646dca28.var_d9558be1)
				{
					case "hash_1e5b6d005e2b1d26":
					{
						arrayremovevalue(level.var_74c83b1e, "peck_quarters");
						level flag::set(#"hash_749935125ea3680c");
						waitresult.e_who namespace_e0966e1e::function_43cd5eff();
						self function_51657aa2();
						level flag::set(#"hash_18e72757cd139ecf");
						break;
					}
					case "hash_1e5b6c005e2b1b73":
					{
						arrayremovevalue(level.var_74c83b1e, "motor_pool");
						level flag::set(#"hash_749935125ea3680c");
						waitresult.e_who namespace_e0966e1e::function_43cd5eff();
						self function_beff1fff();
						level flag::set(#"hash_18e72857cd13a082");
						break;
					}
					case "coordinates":
					{
						arrayremovevalue(level.var_74c83b1e, "military_command");
						level flag::set(#"hash_749935125ea3680c");
						waitresult.e_who namespace_e0966e1e::function_43cd5eff();
						self function_f6853a4a();
						level flag::set(#"hash_d5792142b22f671");
						break;
					}
				}
			}
			else
			{
				waitresult.e_who namespace_e0966e1e::function_43cd5eff();
				self function_af82e929();
			}
		}
	}
}

/*
	Name: function_5ed3ff52
	Namespace: namespace_af171776
	Checksum: 0x7F390D91
	Offset: 0x4490
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function function_5ed3ff52(player)
{
	if(isdefined(player.var_348162a4) && isdefined(player.var_646dca28.aitype))
	{
		self sethintstringforplayer(player, #"hash_3cf594d9dc3f9587");
		return true;
	}
	return false;
}

/*
	Name: function_2084058e
	Namespace: namespace_af171776
	Checksum: 0xE174CEE8
	Offset: 0x4500
	Size: 0x44
	Parameters: 2
	Flags: Linked
*/
function function_2084058e(b_skipped, var_19e802fa)
{
	if(b_skipped || var_19e802fa)
	{
		level flag::set(#"hash_b60b8708c801044");
	}
}

/*
	Name: function_6184283f
	Namespace: namespace_af171776
	Checksum: 0xD976334
	Offset: 0x4550
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function function_6184283f(b_skipped)
{
	if(b_skipped)
	{
		return;
	}
	level thread function_35e13260();
	level flag::wait_till(#"hash_261cbb8b959939fa");
}

/*
	Name: function_9e39dad3
	Namespace: namespace_af171776
	Checksum: 0xC5B962F5
	Offset: 0x45A8
	Size: 0x2C2
	Parameters: 1
	Flags: Linked
*/
function function_9e39dad3(var_b555f02e)
{
	switch(var_b555f02e)
	{
		case 1:
		{
			break;
		}
		case 2:
		{
			var_d19e0f1f = getent("zd_01", "targetname");
			var_d19e0f1f thread scene::play(#"hash_4c1133b3cbe4dcea", "play", var_d19e0f1f);
			var_d19e0f1f.var_78530c1a = util::spawn_model(#"hash_2d2920b192056678", var_d19e0f1f.origin, var_d19e0f1f.angles);
			var_d19e0f1f.var_78530c1a linkto(var_d19e0f1f);
			var_d19e0f1f.light_ent = util::spawn_model(#"hash_565777717feba8e8", var_d19e0f1f.origin, var_d19e0f1f.angles);
			var_d19e0f1f.light_ent linkto(var_d19e0f1f);
			break;
		}
		case 3:
		{
			mdl_mts = getent("mdl_mts", "targetname");
			mdl_mts thread scene::play(#"hash_3d5b1ffba2bf0b8d", "play", mdl_mts);
			mdl_mts.var_78530c1a = util::spawn_model(#"hash_2d2923b192056b91", mdl_mts.origin, mdl_mts.angles);
			mdl_mts.var_78530c1a linkto(mdl_mts);
			mdl_mts.light_ent = util::spawn_model(#"hash_51c576bf73f00a45", mdl_mts.origin, mdl_mts.angles);
			mdl_mts.light_ent linkto(mdl_mts);
			var_535d61f8 = getent("retinal_scan", "targetname");
			var_535d61f8 clientfield::set("" + #"hash_33a2a9faed4bf8d9", 1);
			break;
		}
		default:
		{
			break;
		}
	}
}

/*
	Name: function_1621782d
	Namespace: namespace_af171776
	Checksum: 0xA624EA36
	Offset: 0x4878
	Size: 0x202
	Parameters: 1
	Flags: Linked
*/
function function_1621782d(var_b555f02e)
{
	switch(var_b555f02e)
	{
		case 1:
		{
			break;
		}
		case 2:
		{
			var_d19e0f1f = getent("zd_01", "targetname");
			var_d19e0f1f thread scene::stop(#"hash_4c1133b3cbe4dcea");
			if(isdefined(var_d19e0f1f.var_78530c1a))
			{
				var_d19e0f1f.var_78530c1a delete();
			}
			if(isdefined(var_d19e0f1f.light_ent))
			{
				var_d19e0f1f.light_ent delete();
			}
			break;
		}
		case 3:
		{
			mdl_mts = getent("mdl_mts", "targetname");
			mdl_mts thread scene::stop(#"hash_3d5b1ffba2bf0b8d");
			if(isdefined(mdl_mts.var_78530c1a))
			{
				mdl_mts.var_78530c1a delete();
			}
			if(isdefined(mdl_mts.light_ent))
			{
				mdl_mts.light_ent delete();
			}
			var_535d61f8 = getent("retinal_scan", "targetname");
			var_535d61f8 clientfield::set("" + #"hash_33a2a9faed4bf8d9", 0);
			break;
		}
		default:
		{
			break;
		}
	}
}

/*
	Name: function_b7fb7df6
	Namespace: namespace_af171776
	Checksum: 0x1A93158D
	Offset: 0x4A88
	Size: 0x8C
	Parameters: 0
	Flags: Linked
*/
function function_b7fb7df6()
{
	level endon(#"end_game");
	level flag::wait_till("start_zombie_round_logic");
	level flag::wait_till(#"power_on");
	level clientfield::set("" + #"hash_2e532832d80e7afb", 1);
}

/*
	Name: function_823c9bad
	Namespace: namespace_af171776
	Checksum: 0xADEF1660
	Offset: 0x4B20
	Size: 0xA8
	Parameters: 1
	Flags: Linked
*/
function function_823c9bad(e_player)
{
	if(isplayer(e_player))
	{
		if(level flag::get("power_on" + self.stub.var_b555f02e))
		{
			self sethintstring(#"hash_5af4680fe9e5c9ca");
			return true;
		}
		self sethintstring(#"hash_71158766520dc432");
		return true;
	}
	return false;
}

/*
	Name: function_16a611c6
	Namespace: namespace_af171776
	Checksum: 0x133FAC87
	Offset: 0x4BD0
	Size: 0xF0
	Parameters: 1
	Flags: Linked
*/
function function_16a611c6(e_player)
{
	level endon(#"end_game");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"trigger");
		player = waitresult.activator;
		if(!level flag::get("power_on" + self.stub.var_b555f02e))
		{
			continue;
		}
		player function_bc82f900(#"hash_3937704286348bfa");
		level notify(#"hash_35c23d17b985b0bc");
		zm_unitrigger::unregister_unitrigger(self.stub);
	}
}

/*
	Name: function_35e13260
	Namespace: namespace_af171776
	Checksum: 0xA3E3F336
	Offset: 0x4CC8
	Size: 0x504
	Parameters: 0
	Flags: Linked
*/
function function_35e13260()
{
	level endon(#"end_game", #"hash_261cbb8b959939fa");
	var_d19e0f1f = getent("zd_01", "targetname");
	var_251be152 = struct::get(var_d19e0f1f.target, "targetname");
	var_580d9e4f = var_251be152 zm_unitrigger::create(&function_823c9bad, 60, &function_16a611c6);
	var_580d9e4f.var_b555f02e = var_d19e0f1f.script_int;
	level waittill(#"hash_35c23d17b985b0bc");
	var_bb8974cd = util::spawn_model(#"p9_rus_floppy_disk_01", struct::get("crp_pos").origin, struct::get("crp_pos").angles);
	var_bb8974cd moveto(var_bb8974cd.origin + (vectorscale((0, -1, 0), 8)), 1, 0.25, 0.25);
	var_bb8974cd playsound(#"hash_1c9b4881c0da618a");
	var_bb8974cd waittill(#"movedone");
	var_d19e0f1f zm_vo::function_d6f8bbd9(#"hash_6b29558edcd0bd8d");
	wait(1);
	var_d19e0f1f zm_vo::function_d6f8bbd9(#"hash_7b9e4ae70712abbc");
	wait(3);
	var_d19e0f1f zm_vo::function_d6f8bbd9(#"hash_23ad1a37d43952c3");
	level notify(#"hash_17aa3d4ecb08b26f");
	var_1f5391d1 = struct::get("tp_pos");
	var_6e21385 = 0;
	while(true)
	{
		a_players = function_a1ef346b();
		foreach(player in a_players)
		{
			if(distancesquared(player.origin, var_1f5391d1.origin) < 160000)
			{
				var_6e21385 = 1;
				break;
			}
		}
		if(is_true(var_6e21385))
		{
			break;
		}
		wait(1);
	}
	exploder::exploder("fxexp_cin_mid_main_spawn_red");
	exploder::exploder("fxexp_cin_mid_main_spawn");
	function_7814d598(#"on");
	level.var_5a3a7338 = spawncollision(#"hash_1d1c56a494aa468e", "collider", var_1f5391d1.origin, var_1f5391d1.angles);
	level.var_5a3a7338 setscale(2.5);
	level thread function_ddd13d30(var_1f5391d1);
	var_d19e0f1f zm_vo::function_d6f8bbd9(#"hash_3003250228537400");
	wait(2);
	var_d19e0f1f zm_vo::function_d6f8bbd9(#"hash_30032602285375b3");
	wait(3);
	var_d19e0f1f zm_vo::function_d6f8bbd9(#"hash_3003270228537766");
	wait(1);
	var_d19e0f1f zm_vo::function_d6f8bbd9(#"hash_3003280228537919");
	level zm_vo::function_7622cb70(#"hash_b487cefc11242f");
	level flag::set(#"hash_261cbb8b959939fa");
}

/*
	Name: function_7814d598
	Namespace: namespace_af171776
	Checksum: 0x54EF28C9
	Offset: 0x51D8
	Size: 0x17E
	Parameters: 1
	Flags: Linked
*/
function function_7814d598(status)
{
	if(status === #"on")
	{
		var_1f5391d1 = struct::get("tp_pos");
		if(isdefined(var_1f5391d1))
		{
			if(!isdefined(level.portal))
			{
				level.portal = util::spawn_model("tag_origin", var_1f5391d1.origin, var_1f5391d1.angles);
			}
			if(!isdefined(level.portal.sfx))
			{
				level.portal playsound(#"hash_4a04fd9edb696634");
				level.portal.sfx = level.portal playloopsound(#"hash_61bfd6cc3f47194");
			}
		}
	}
	else if(isdefined(level.portal.sfx))
	{
		level.portal playsound(#"hash_257a16d125ce57ed");
		level.portal stoploopsound(level.portal.sfx);
		level.portal.sfx = undefined;
	}
}

/*
	Name: function_ddd13d30
	Namespace: namespace_af171776
	Checksum: 0x973AAF04
	Offset: 0x5360
	Size: 0x10C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_ddd13d30(portal_pos)
{
	level endon(#"hash_bbb538fda3639e4");
	while(true)
	{
		a_players = function_a1ef346b();
		foreach(player in a_players)
		{
			if(distancesquared(player.origin, portal_pos.origin) < 62500)
			{
				player function_bc82f900(#"hash_3937704286348bfa");
			}
		}
		wait(0.3);
	}
}

/*
	Name: function_74b83d82
	Namespace: namespace_af171776
	Checksum: 0x14CDB612
	Offset: 0x5478
	Size: 0x148
	Parameters: 2
	Flags: Linked
*/
function function_74b83d82(b_skipped, var_19e802fa)
{
	if(b_skipped || var_19e802fa)
	{
		var_1f5391d1 = struct::get("tp_pos");
		exploder::exploder("fxexp_cin_mid_main_spawn_red");
		exploder::exploder("fxexp_cin_mid_main_spawn");
		if(!isdefined(level.portal))
		{
			function_7814d598(#"on");
		}
		if(!isdefined(level.var_5a3a7338))
		{
			level.var_5a3a7338 = spawncollision(#"hash_1d1c56a494aa468e", "collider", var_1f5391d1.origin, var_1f5391d1.angles);
			level.var_5a3a7338 setscale(2.5);
		}
		level flag::set(#"hash_261cbb8b959939fa");
		level notify(#"hash_17aa3d4ecb08b26f");
	}
}

/*
	Name: function_de84b08d
	Namespace: namespace_af171776
	Checksum: 0x15984108
	Offset: 0x55C8
	Size: 0x10E
	Parameters: 0
	Flags: Linked
*/
function function_de84b08d()
{
	level.var_5868e205 = struct::get_array("aether_crystal_pos", "targetname");
	foreach(crystal_pos in level.var_5868e205)
	{
		crystal_pos.mdl = crystal_pos util::spawn_model(#"p9_zm_gold_aetherium_container", crystal_pos.origin, crystal_pos.angles);
		crystal_pos.mdl_tag = crystal_pos util::spawn_model("tag_origin", crystal_pos.origin, crystal_pos.angles);
	}
}

/*
	Name: function_72036ab1
	Namespace: namespace_af171776
	Checksum: 0x5752BDD1
	Offset: 0x56E0
	Size: 0x15C
	Parameters: 1
	Flags: Linked
*/
function function_72036ab1(b_skipped)
{
	if(b_skipped)
	{
		return;
	}
	level thread function_a8df5533();
	foreach(player in getplayers())
	{
		player thread function_f0423163();
	}
	s_waitresult = undefined;
	s_waitresult = level waittill(#"hash_5e6fc756a650e960");
	if(!is_true(s_waitresult.var_50b70894))
	{
		level thread function_b9a3fa11(#"hash_7376556a9f3c7c76", #"hash_7376456a9f3c6146", #"hash_7376496a9f3c6812");
	}
	/#
		iprintlnbold("");
	#/
}

/*
	Name: function_86a23fd4
	Namespace: namespace_af171776
	Checksum: 0xB105E7BD
	Offset: 0x5848
	Size: 0x1A8
	Parameters: 2
	Flags: Linked
*/
function function_86a23fd4(b_skipped, var_19e802fa)
{
	if(b_skipped || var_19e802fa)
	{
		level clientfield::set("" + #"hash_493518ca957daaea", 0);
		zm_utility::function_d729de6a(0, [0:#"zone_napalm_strike2"]);
		foreach(player in getplayers())
		{
			player thread function_f0423163();
		}
		level flag::set(#"hash_102797babb455461");
	}
	array::thread_all(getplayers(), &namespace_4abf1500::collect_intel, #"hash_196203efbf362226");
	level notify(#"hash_5e6fc756a650e960", {#hash_50b70894:b_skipped || var_19e802fa});
}

/*
	Name: function_62d6b8df
	Namespace: namespace_af171776
	Checksum: 0x1EBE4605
	Offset: 0x59F8
	Size: 0xFC
	Parameters: 1
	Flags: Linked
*/
function function_62d6b8df(b_skipped)
{
	if(b_skipped)
	{
		return;
	}
	level.var_28c80220 = 0;
	level thread function_3a3ca419();
	level thread function_531dcaa4();
	level thread function_b5fc7e46();
	level flag::wait_till_all(array(#"hash_2041fe24705ad8c9", #"hash_384b665200ca31eb", #"hash_447995ebf38228d0"));
	/#
		iprintlnbold("");
	#/
	level flag::set(#"hash_11b32b176a293211");
}

/*
	Name: function_520b958d
	Namespace: namespace_af171776
	Checksum: 0xF84C11A7
	Offset: 0x5B00
	Size: 0x94
	Parameters: 0
	Flags: Linked
*/
function function_520b958d()
{
	level flag::wait_till("start_zombie_round_logic");
	var_ca1193a6 = getent("shovel_tool_pos", "targetname");
	if(isdefined(var_ca1193a6))
	{
		namespace_9f2e6680::function_ade87eb5(#"hash_27ca0b2cf2e3ceaf", var_ca1193a6, 0);
		var_ca1193a6 delete();
	}
}

/*
	Name: function_a8df5533
	Namespace: namespace_af171776
	Checksum: 0x8F79365C
	Offset: 0x5BA0
	Size: 0x25A
	Parameters: 0
	Flags: Linked
*/
function function_a8df5533()
{
	level endon(#"end_game");
	if(isdefined(level.var_90655717))
	{
		level.var_90655717 zm_unitrigger::unregister_unitrigger(level.var_90655717.s_unitrigger);
		activator = level.var_90655717 zm_unitrigger::function_fac87205(#"hash_8907bffd7ded28e", 100);
		activator function_bc82f900(#"hash_3937704286348bfa");
		function_fe96e109();
	}
	var_5e79128f = getent("locked_cabinet", "targetname");
	var_923312f6 = getent("code_lock", "targetname");
	var_923312f6 linkto(var_5e79128f, "tag_door");
	activator = var_5e79128f zm_unitrigger::function_fac87205(#"hash_3f754ca49083b2de", 100);
	activator function_bc82f900(#"hash_3937704286348bfa");
	var_923312f6 playsound(#"hash_34725b511df96083");
	var_5e79128f thread scene::play("p7_lockers_metal_tail_01_bundle", var_5e79128f);
	aethermeter_pos = struct::get("aethermeter_pos", "targetname");
	point = function_4ba8fde(#"hash_70390fd4007ce104");
	var_3aea9b8d = item_drop::drop_item(0, undefined, 1, 0, point.id, aethermeter_pos.origin, aethermeter_pos.angles, 0);
	var_3aea9b8d.var_dd21aec2 = 1 | 16;
}

/*
	Name: function_f0423163
	Namespace: namespace_af171776
	Checksum: 0x8A5B1A68
	Offset: 0x5E08
	Size: 0x1F8
	Parameters: 0
	Flags: Linked
*/
function function_f0423163()
{
	self notify("4672709fe5739165");
	self endon("4672709fe5739165");
	level endon(#"end_game", #"hash_11b32b176a293211");
	self endon(#"disconnect");
	level.var_852bdce8 = [];
	s_waitresult = undefined;
	s_waitresult = level waittill(#"hash_5e6fc756a650e960");
	while(!level flag::get(#"hash_108169b95cf29e99"))
	{
		var_c2b976ac = function_db7e1556(self, level.var_852bdce8);
		if(isdefined(var_c2b976ac.dis) && 256 > var_c2b976ac.dis)
		{
			self playsoundtoplayer("zmb_gold_mq_aether_meter_chirp_2d", self);
			wait_time = 1.5 * (var_c2b976ac.dis / 256);
			if(wait_time < 0.1)
			{
				wait_time = 0.1;
			}
			else if(wait_time > 1.5)
			{
				wait_time = 1.5;
			}
			wait(wait_time);
			/#
				self iprintlnbold("" + var_c2b976ac.dis);
			#/
		}
		else
		{
			wait(1);
			/#
				if(isdefined(var_c2b976ac.dis) && isdefined(self))
				{
					self iprintlnbold(var_c2b976ac.dis);
				}
			#/
		}
	}
}

/*
	Name: function_db7e1556
	Namespace: namespace_af171776
	Checksum: 0x9F4F9421
	Offset: 0x6008
	Size: 0x196
	Parameters: 2
	Flags: Linked
*/
function function_db7e1556(var_4ab05779, var_d7716b9c)
{
	var_9c58be04 = undefined;
	var_39235da4 = spawnstruct();
	foreach(entity in var_d7716b9c)
	{
		if(isdefined(var_9c58be04) && isdefined(entity))
		{
			var_1399d2d2 = distance(var_4ab05779.origin, var_9c58be04.origin);
			var_f30607a8 = distance(var_4ab05779.origin, entity.origin);
			if(isdefined(var_1399d2d2) && isdefined(var_f30607a8) && var_f30607a8 < var_1399d2d2)
			{
				var_9c58be04 = entity;
				var_1399d2d2 = var_f30607a8;
			}
			continue;
		}
		var_9c58be04 = entity;
		var_1399d2d2 = distance(var_4ab05779.origin, entity.origin);
	}
	var_39235da4.dis = var_1399d2d2;
	var_39235da4.entity = var_9c58be04;
	return var_39235da4;
}

/*
	Name: on_item_pickup
	Namespace: namespace_af171776
	Checksum: 0xEF3164E9
	Offset: 0x61A8
	Size: 0x5E2
	Parameters: 1
	Flags: Linked
*/
function on_item_pickup(params)
{
	item = params.item;
	if(isplayer(self))
	{
		if(isdefined(item.var_a6762160.name))
		{
			switch(item.var_a6762160.name)
			{
				case "hash_70390fd4007ce104":
				{
					level zm_ui_inventory::function_7df6bb60(#"hash_68710dddf2ce34c5", 1);
					array::thread_all(function_a1ef346b(), &namespace_4abf1500::collect_intel, #"hash_196203efbf362226");
					level notify(#"hash_5e6fc756a650e960");
					break;
				}
				case "hash_70390ed4007cdf51":
				{
					array::thread_all(function_a1ef346b(), &namespace_4abf1500::collect_intel, #"hash_196206efbf36273f");
					level flag::set(#"accesscard_picked_up");
					level thread namespace_1812c3f4::function_f314c888();
					break;
				}
				case "hash_3ac100db82bf361b":
				{
					level zm_ui_inventory::function_7df6bb60(#"hash_5af00d28eb1b6e90", 1);
					if(!level flag::get_any([2:#"hash_6a27b5e2ac791e2a", 1:#"hash_49f375553940bfed", 0:#"hash_29d5efd7e75d2cef"]))
					{
						level thread namespace_1812c3f4::function_68c6149e();
					}
					level flag::set(#"hash_29d5efd7e75d2cef");
					break;
				}
				case "hash_739087fdf5e8732b":
				{
					if(!level flag::get_any([2:#"hash_6a27b5e2ac791e2a", 1:#"hash_49f375553940bfed", 0:#"hash_29d5efd7e75d2cef"]))
					{
						level thread namespace_1812c3f4::function_68c6149e();
					}
					level zm_ui_inventory::function_7df6bb60(#"hash_6dfb2c86406ffc1e", 1);
					level flag::set(#"hash_49f375553940bfed");
					break;
				}
				case "hash_6adcdffdf0f7d384":
				{
					level zm_ui_inventory::function_7df6bb60(#"hash_770dc48645b11519", 1);
					if(!level flag::get_any([2:#"hash_6a27b5e2ac791e2a", 1:#"hash_49f375553940bfed", 0:#"hash_29d5efd7e75d2cef"]))
					{
						level thread namespace_1812c3f4::function_68c6149e();
					}
					level flag::set(#"hash_6a27b5e2ac791e2a");
					break;
				}
				case "hash_70390dd4007cdd9e":
				{
					level zm_ui_inventory::function_7df6bb60(#"hash_3463252589f042b8", 1);
					array::thread_all(function_a1ef346b(), &namespace_4abf1500::collect_intel, #"hash_196205efbf36258c");
					level flag::set(#"hash_3daef4d64d9ddc57");
					level thread namespace_1812c3f4::function_421f7a59();
					break;
				}
				case "hash_703910d4007ce2b7":
				{
					self namespace_4abf1500::collect_intel(#"hash_196204efbf3623d9");
					break;
				}
				case "hash_4a5e27a7820eb0c2":
				{
					level zm_ui_inventory::function_7df6bb60(#"hash_6ded46343cad4c61", 1);
					level flag::set(#"hash_4f85be0e86e8cb3a");
					level thread namespace_1812c3f4::function_7930927d();
					break;
				}
				case "hash_27ca0b2cf2e3ceaf":
				{
					level zm_ui_inventory::function_7df6bb60(#"hash_3dbda17facd5a63e", 1);
					level flag::set(#"hash_102797babb455461");
					/#
						iprintlnbold("");
					#/
				}
				default:
				{
					return;
				}
			}
		}
	}
}

/*
	Name: function_3a3ca419
	Namespace: namespace_af171776
	Checksum: 0xDCA28746
	Offset: 0x6798
	Size: 0xB04
	Parameters: 0
	Flags: Linked
*/
function function_3a3ca419()
{
	level endon(#"end_game");
	s_crystal = function_ad8d71a0("zone_armory");
	if(!isdefined(s_crystal.mdl))
	{
		s_crystal.mdl = s_crystal util::spawn_model(#"p9_zm_gold_aetherium_container", s_crystal.origin, s_crystal.angles);
	}
	if(!isdefined(level.var_54f26c14))
	{
		level.var_54f26c14 = 0;
	}
	if(!isdefined(level.var_852bdce8))
	{
		level.var_852bdce8 = [];
	}
	else if(!isarray(level.var_852bdce8))
	{
		level.var_852bdce8 = array(level.var_852bdce8);
	}
	if(!isinarray(level.var_852bdce8, s_crystal.mdl))
	{
		level.var_852bdce8[level.var_852bdce8.size] = s_crystal.mdl;
	}
	s_trigger = s_crystal zm_unitrigger::create(&function_9c74e3e3, 80, &function_f69ec622);
	s_trigger.origin = s_trigger.origin + vectorscale((0, 0, 1), 30);
	s_trigger.spawn_pos = s_crystal;
	callback::function_50fdac80(&function_3a3ca419);
	level waittill(#"hash_6c5c3396d53d00dc");
	s_fx = struct::get(#"hash_5b6087423178f120");
	playfx(#"hash_1dd0650d48b02a2", s_fx.origin, anglestoforward(s_fx.angles), anglestoup(s_fx.angles));
	s_crystal.mdl clientfield::set("" + #"hash_5db889fa88fbbe02", 2);
	s_crystal.mdl moveto(s_crystal.mdl.origin + vectorscale((0, 0, 1), 30), 1);
	playsoundatposition(#"hash_2eb7e53bbef32adf", s_crystal.mdl.origin + vectorscale((0, 0, 1), 50));
	s_crystal.mdl waittill(#"movedone");
	wait(2);
	if(isdefined(s_crystal.mdl))
	{
		arrayremovevalue(level.var_852bdce8, s_crystal.mdl);
	}
	playfx(#"hash_7be84069975ec045", s_crystal.mdl.origin, anglestoforward(s_crystal.mdl.angles), anglestoup(s_crystal.mdl.angles));
	playsoundatposition(#"hash_3d369627caa2ec0e", s_crystal.mdl.origin + vectorscale((0, 0, 1), 25));
	if(isdefined(s_crystal.mdl))
	{
		s_crystal.mdl clientfield::set("" + #"hash_5db889fa88fbbe02", 0);
		s_crystal.mdl ghost();
		s_crystal.mdl thread util::delayed_delete(1);
	}
	wait(1);
	if(!isarray(s_crystal))
	{
		spawn_pos = struct::get_array(s_crystal.target, "targetname");
		spawn_pos = array::randomize(spawn_pos);
		var_4cfcaaf5 = 0;
		var_1668a871 = 0;
		level.var_f77e46b7 = [];
		for(i = 0; i < 20; i++)
		{
			if(!var_4cfcaaf5)
			{
				spawn_pos[i] function_eca49808(#"p9_zm_gold_aetherium_container");
				spawn_pos[i].mdl.var_551e7e80 = 1;
				spawn_pos[i].mdl_tag clientfield::set("" + #"hash_5db889fa88fbbe02", 2);
				spawn_pos[i].mdl thread scene::play(#"hash_1a51f6d578011617", "play", spawn_pos[i].mdl);
				var_4cfcaaf5 = 1;
				if(!isdefined(level.var_852bdce8))
				{
					level.var_852bdce8 = [];
				}
				else if(!isarray(level.var_852bdce8))
				{
					level.var_852bdce8 = array(level.var_852bdce8);
				}
				if(!isinarray(level.var_852bdce8, spawn_pos[i]))
				{
					level.var_852bdce8[level.var_852bdce8.size] = spawn_pos[i];
				}
			}
			else
			{
				if(var_1668a871 < (getplayers().size * 1) + 4)
				{
					spawn_pos[i] function_eca49808(#"p9_zm_gold_aetherium_container");
					spawn_pos[i].mdl.var_aa3c8a94 = 1;
					spawn_pos[i].mdl_tag clientfield::set("" + #"hash_5db889fa88fbbe02", 3);
					if(!isdefined(level.var_852bdce8))
					{
						level.var_852bdce8 = [];
					}
					else if(!isarray(level.var_852bdce8))
					{
						level.var_852bdce8 = array(level.var_852bdce8);
					}
					if(!isinarray(level.var_852bdce8, spawn_pos[i]))
					{
						level.var_852bdce8[level.var_852bdce8.size] = spawn_pos[i];
					}
					var_1668a871++;
				}
				else
				{
					spawn_pos[i] function_eca49808(#"p9_zm_gold_aetherium_container");
					spawn_pos[i].mdl_tag clientfield::set("" + #"hash_5db889fa88fbbe02", 3);
					spawn_pos[i].mdl thread scene::play(#"hash_1a51f6d578011617", "play", spawn_pos[i].mdl);
					if(!isdefined(level.var_852bdce8))
					{
						level.var_852bdce8 = [];
					}
					else if(!isarray(level.var_852bdce8))
					{
						level.var_852bdce8 = array(level.var_852bdce8);
					}
					if(!isinarray(level.var_852bdce8, spawn_pos[i]))
					{
						level.var_852bdce8[level.var_852bdce8.size] = spawn_pos[i];
					}
				}
			}
			if(!isdefined(level.var_f77e46b7))
			{
				level.var_f77e46b7 = [];
			}
			else if(!isarray(level.var_f77e46b7))
			{
				level.var_f77e46b7 = array(level.var_f77e46b7);
			}
			if(!isinarray(level.var_f77e46b7, spawn_pos[i]))
			{
				level.var_f77e46b7[level.var_f77e46b7.size] = spawn_pos[i];
			}
			s_unitrigger = spawn_pos[i] zm_unitrigger::create(#"hash_10171975870a057a", 64, &function_d6298eb3);
			s_unitrigger.spawn_pos = spawn_pos[i];
			spawn_pos[i].s_unitrigger = s_unitrigger;
		}
	}
	if(level.var_54f26c14 >= 2 && !s_crystal flag::get(#"hash_34e53728fe25b1e0"))
	{
		s_crystal flag::set(#"hash_34e53728fe25b1e0");
		wait(2);
		level thread function_b9a3fa11(#"hash_2c6b41d2e3c34581", #"hash_2c6b31d2e3c32a51", #"hash_2c6b35d2e3c3311d");
	}
}

/*
	Name: function_eca49808
	Namespace: namespace_af171776
	Checksum: 0x169C2128
	Offset: 0x72A8
	Size: 0xF4
	Parameters: 1
	Flags: Linked
*/
function function_eca49808(model)
{
	self.mdl = self util::spawn_model(model, self.origin, self.angles);
	self.mdl function_619a5c20();
	if(!isdefined(self.mdl_tag))
	{
		self.mdl_tag = self util::spawn_model("tag_origin", self.origin, self.angles);
	}
	self.mdl_tag clientfield::increment("" + #"hash_a3ff7de846a027f", 1);
	self.mdl solid();
	self.mdl disconnectpaths();
}

/*
	Name: function_d6298eb3
	Namespace: namespace_af171776
	Checksum: 0xB46AE98D
	Offset: 0x73A8
	Size: 0x98
	Parameters: 0
	Flags: Linked
*/
function function_d6298eb3()
{
	level endon(#"end_game");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"trigger");
		waitresult.activator function_bc82f900(#"hash_3937704286348bfa");
		level thread function_d4ec7e31(self.stub.spawn_pos);
	}
}

/*
	Name: function_d4ec7e31
	Namespace: namespace_af171776
	Checksum: 0x2A25EB5F
	Offset: 0x7448
	Size: 0x45C
	Parameters: 1
	Flags: Linked
*/
function function_d4ec7e31(s_container)
{
	if(is_true(s_container.mdl.var_551e7e80))
	{
		playsoundatposition(#"hash_580d07205ee4fd96", s_container.mdl.origin);
		level zm_ui_inventory::function_7df6bb60(#"hash_41f1735c1f1772a1", 1);
		level flag::set(#"hash_10087ff5db48e4db");
		level flag::set(#"hash_2041fe24705ad8c9");
		level.var_28c80220++;
		arrayremovevalue(level.var_852bdce8, undefined);
		arrayremovevalue(level.var_852bdce8, s_container);
		foreach(var_27495858 in level.var_f77e46b7)
		{
			var_27495858 thread function_1f1ea0d3();
			arrayremovevalue(level.var_852bdce8, var_27495858);
			zm_unitrigger::unregister_unitrigger(var_27495858.s_unitrigger);
		}
		level.var_f77e46b7 = [];
		/#
			iprintlnbold("");
		#/
	}
	else
	{
		level.var_54f26c14++;
		arrayremovevalue(level.var_f77e46b7, undefined);
		foreach(var_27495858 in level.var_f77e46b7)
		{
			arrayremovevalue(level.var_852bdce8, var_27495858);
			var_27495858 thread function_1f1ea0d3();
			if(is_true(var_27495858.mdl.var_aa3c8a94))
			{
				v_origin = var_27495858.origin;
				v_angles = var_27495858.angles;
				if(isdefined(var_27495858.target))
				{
					var_14ff74f5 = struct::get(var_27495858.target);
					if(isdefined(var_14ff74f5))
					{
						v_origin = var_14ff74f5.origin;
						v_angles = var_14ff74f5.angles;
					}
				}
				var_aff5d50e = spawnactor("spawner_bo5_mimic", v_origin, v_angles, undefined, 1);
				if(isdefined(var_aff5d50e))
				{
					var_aff5d50e clientfield::increment("" + #"hash_7dc2e40e04fdfbad", 1);
					var_aff5d50e.var_7a5e475 = 0;
					if(level.zombie_total > 0)
					{
						level.zombie_total--;
					}
				}
			}
			zm_unitrigger::unregister_unitrigger(var_27495858.s_unitrigger);
		}
		callback::function_74872db6(&function_3a3ca419);
		level.var_f77e46b7 = [];
		/#
			iprintlnbold("");
		#/
	}
}

/*
	Name: function_1f1ea0d3
	Namespace: namespace_af171776
	Checksum: 0x33155B90
	Offset: 0x78B0
	Size: 0x12C
	Parameters: 0
	Flags: Linked
*/
function function_1f1ea0d3()
{
	playfx(#"hash_7be84069975ec045", self.mdl.origin, anglestoforward(self.mdl.angles), anglestoup(self.mdl.angles));
	self.mdl clientfield::set("" + #"hash_5db889fa88fbbe02", 0);
	self.mdl notsolid();
	self.mdl connectpaths();
	waitframe(5);
	if(isdefined(self.mdl))
	{
		self.mdl delete();
	}
	if(isdefined(self.mdl_tag))
	{
		self.mdl_tag delete();
	}
}

/*
	Name: function_531dcaa4
	Namespace: namespace_af171776
	Checksum: 0x758FDFDD
	Offset: 0x79E8
	Size: 0x6D6
	Parameters: 0
	Flags: Linked
*/
function function_531dcaa4()
{
	level endon(#"end_game", #"hash_384b665200ca31eb");
	s_crystal = function_ad8d71a0(#"zone_tents");
	if(!isdefined(level.var_852bdce8))
	{
		level.var_852bdce8 = [];
	}
	else if(!isarray(level.var_852bdce8))
	{
		level.var_852bdce8 = array(level.var_852bdce8);
	}
	if(!isinarray(level.var_852bdce8, s_crystal.mdl))
	{
		level.var_852bdce8[level.var_852bdce8.size] = s_crystal.mdl;
	}
	s_trigger = s_crystal zm_unitrigger::create(&function_9c74e3e3, 80, &function_f69ec622);
	s_trigger.origin = s_trigger.origin + vectorscale((0, 0, 1), 30);
	s_trigger.spawn_pos = s_crystal;
	level waittill(#"hash_594981d29e7367a");
	s_fx = struct::get(#"hash_49b108485b1c0965");
	playfx(#"hash_4fb181e52d7a732a", s_fx.origin, anglestoforward(s_fx.angles), anglestoup(s_fx.angles));
	s_crystal.mdl clientfield::set("" + #"hash_5db889fa88fbbe02", 1);
	s_crystal.mdl moveto(s_crystal.mdl.origin + vectorscale((0, 0, 1), 30), 1);
	playsoundatposition(#"hash_2eb7e53bbef32adf", s_crystal.mdl.origin + vectorscale((0, 0, 1), 30));
	s_crystal.mdl waittill(#"movedone");
	zm_unitrigger::unregister_unitrigger(s_trigger);
	var_a2ff5983 = struct::get_array(s_crystal.target, "targetname");
	b_played_vo = 0;
	s_crystal.mdl thread function_73141752(s_crystal);
	s_crystal.mdl playloopsound(#"hash_3b049f6a10ebab9c");
	var_b53352fa = 0;
	while(!level flag::get(#"hash_384b665200ca31eb"))
	{
		var_c2b976ac = function_db7e1556(s_crystal.mdl, function_a1ef346b());
		dis = var_c2b976ac.dis;
		if(isdefined(dis) && dis < 256 && !s_crystal.mdl flag::get(#"hash_2665ae35598c4f7f"))
		{
			s_crystal.mdl clientfield::set("" + #"hash_5eccf9a3ab802cf7", 1);
			s_crystal.mdl thread scene::play(#"hash_1a51f6d578011617", "shake", s_crystal.mdl);
			s_crystal.mdl thread function_4924bc79(1);
			s_crystal.mdl waittill(#"hash_7d2daba7fc66764c");
			s_crystal.mdl thread scene::stop(#"hash_1a51f6d578011617");
			s_crystal.mdl clientfield::increment("" + #"hash_13b42b800d7ddc38", 1);
			next_pos = function_40d9cf7a(next_pos, var_a2ff5983, 0, 1000);
			s_crystal.mdl rotateto(next_pos.angles, 0.5);
			s_crystal.mdl moveto(next_pos.origin, 0.5);
			s_crystal.mdl waittill(#"movedone");
			if(isdefined(s_crystal.mdl.s_unitrigger))
			{
				zm_unitrigger::unregister_unitrigger(s_crystal.mdl.s_unitrigger);
			}
			var_b53352fa++;
			if(!b_played_vo && var_b53352fa >= 3)
			{
				b_played_vo = 1;
				level util::delay(2, #"end_game", &function_b9a3fa11, #"hash_19dec545870b5e23", #"hash_19deb545870b42f3", #"hash_19deb945870b49bf");
			}
			s_crystal.mdl clientfield::set("" + #"hash_5eccf9a3ab802cf7", 0);
		}
		waitframe(1);
	}
}

/*
	Name: function_73141752
	Namespace: namespace_af171776
	Checksum: 0x96A24FDB
	Offset: 0x80C8
	Size: 0x218
	Parameters: 1
	Flags: Linked
*/
function function_73141752(s_crystal)
{
	level endon(#"end_game", #"hash_384b665200ca31eb");
	while(true)
	{
		while(true)
		{
			var_91c31660 = arraycopy(level.var_3afb1303);
			arrayremovevalue(var_91c31660, undefined);
			var_66a3bd19 = arraysortclosest(var_91c31660, self.origin, 1, 0, 64).size > 0;
			if(var_66a3bd19)
			{
				break;
			}
			waitframe(1);
		}
		self flag::set(#"hash_2665ae35598c4f7f");
		self scene::stop(#"hash_1a51f6d578011617");
		s_trigger = self zm_unitrigger::create(#"hash_10171975870a057a", 64, &function_ffb5a78a);
		s_trigger.spawn_pos = s_crystal;
		while(true)
		{
			var_91c31660 = arraycopy(level.var_3afb1303);
			arrayremovevalue(var_91c31660, undefined);
			var_66a3bd19 = arraysortclosest(var_91c31660, self.origin, 1, 0, 64).size > 0;
			if(!var_66a3bd19)
			{
				break;
			}
			waitframe(1);
		}
		self flag::clear(#"hash_2665ae35598c4f7f");
		self zm_unitrigger::unregister_unitrigger(s_trigger);
	}
}

/*
	Name: function_4924bc79
	Namespace: namespace_af171776
	Checksum: 0xA1E3F27D
	Offset: 0x82E8
	Size: 0x7C
	Parameters: 1
	Flags: Linked
*/
function function_4924bc79(time)
{
	level endon(#"end_game", #"hash_384b665200ca31eb");
	self endon(#"hash_aead8715c589a00");
	wait(time);
	self notify(#"hash_7d2daba7fc66764c");
	/#
		iprintlnbold("");
	#/
}

/*
	Name: function_ffb5a78a
	Namespace: namespace_af171776
	Checksum: 0xD3960AC0
	Offset: 0x8370
	Size: 0x274
	Parameters: 0
	Flags: Linked
*/
function function_ffb5a78a()
{
	level endon(#"end_game");
	self endon(#"death");
	self waittill(#"trigger");
	if(isdefined(self.stub.spawn_pos.mdl))
	{
		playsoundatposition(#"hash_580d07205ee4fd96", self.stub.spawn_pos.mdl.origin);
		level zm_ui_inventory::function_7df6bb60(#"hash_41f1705c1f176d88", 1);
		level flag::set(#"hash_dca80b283387742");
		level flag::set(#"hash_384b665200ca31eb");
		array::thread_all(getplayers(), &namespace_4abf1500::collect_intel, #"hash_de5dd4ba9aa676c");
		level.var_28c80220++;
		self.stub.spawn_pos.mdl clientfield::set("" + #"hash_5db889fa88fbbe02", 0);
		self.stub.spawn_pos.mdl clientfield::set("" + #"hash_5eccf9a3ab802cf7", 0);
		arrayremovevalue(level.var_852bdce8, self.stub.spawn_pos.mdl);
		waitframe(5);
		self.stub.spawn_pos.mdl delete();
		/#
			iprintlnbold("");
		#/
		zm_unitrigger::unregister_unitrigger(self.stub);
	}
}

/*
	Name: function_b5fc7e46
	Namespace: namespace_af171776
	Checksum: 0x838ABA0D
	Offset: 0x85F0
	Size: 0x132
	Parameters: 0
	Flags: Linked
*/
function function_b5fc7e46()
{
	spawn_pos = function_ad8d71a0(#"zone_hillside_road_defend");
	if(!isdefined(level.var_852bdce8))
	{
		level.var_852bdce8 = [];
	}
	else if(!isarray(level.var_852bdce8))
	{
		level.var_852bdce8 = array(level.var_852bdce8);
	}
	if(!isinarray(level.var_852bdce8, spawn_pos))
	{
		level.var_852bdce8[level.var_852bdce8.size] = spawn_pos;
	}
	s_trigger = spawn_pos zm_unitrigger::create(&function_9c74e3e3, 80, &function_f69ec622);
	s_trigger.origin = s_trigger.origin + vectorscale((0, 0, 1), 30);
	s_trigger.spawn_pos = spawn_pos;
}

/*
	Name: function_9c74e3e3
	Namespace: namespace_af171776
	Checksum: 0x5882B5DA
	Offset: 0x8730
	Size: 0x194
	Parameters: 1
	Flags: Linked
*/
function function_9c74e3e3(e_player)
{
	if(isplayer(e_player))
	{
		if(level flag::get(#"hash_102797babb455461") && !is_true(self.stub.spawn_pos.var_4a5787c9))
		{
			if(self.stub.spawn_pos.script_noteworthy === #"zone_hillside_road_defend" && self.stub.spawn_pos flag::get(#"hash_478be680bb087e19"))
			{
				self sethintstringforplayer(e_player, #"hash_10171975870a057a");
				return true;
			}
			self sethintstringforplayer(e_player, #"hash_37b281e7aa4d1069");
			return true;
		}
		if(!level flag::get(#"hash_102797babb455461"))
		{
			self sethintstringforplayer(e_player, #"hash_429f1ecfde757d4f");
			return true;
		}
		return false;
	}
	return false;
}

/*
	Name: function_f69ec622
	Namespace: namespace_af171776
	Checksum: 0xB61B77F9
	Offset: 0x88D0
	Size: 0x1F0
	Parameters: 0
	Flags: Linked
*/
function function_f69ec622()
{
	level endon(#"end_game", #"death");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"trigger");
		player = waitresult.activator;
		if(level flag::get(#"hash_102797babb455461"))
		{
			if(self.stub.spawn_pos.script_noteworthy === "zone_armory")
			{
				level notify(#"hash_6c5c3396d53d00dc");
				player function_bc82f900(#"hash_3937704286348bfa");
				zm_unitrigger::unregister_unitrigger(self.stub);
			}
			else
			{
				if(self.stub.spawn_pos.script_noteworthy === "zone_tents")
				{
					level notify(#"hash_594981d29e7367a");
					player function_bc82f900(#"hash_3937704286348bfa");
					zm_unitrigger::unregister_unitrigger(self.stub);
				}
				else if(self.stub.spawn_pos.script_noteworthy === "zone_hillside_road_defend")
				{
					player function_bc82f900(#"hash_3937704286348bfa");
					level thread function_6b76cd80(self.stub.spawn_pos);
				}
			}
		}
	}
}

/*
	Name: function_6b76cd80
	Namespace: namespace_af171776
	Checksum: 0x5AF1B87C
	Offset: 0x8AC8
	Size: 0x474
	Parameters: 1
	Flags: Linked
*/
function function_6b76cd80(s_container)
{
	s_container.var_4a5787c9 = 1;
	if(!s_container flag::get(#"hash_4edaa9e538a35497"))
	{
		level flag::set(#"hash_793eafdc24e3f0eb");
		arrayremovevalue(level.var_852bdce8, s_container);
		if(!s_container flag::get(#"hash_478be680bb087e19"))
		{
			s_container flag::set(#"hash_478be680bb087e19");
			s_container.mdl = s_container util::spawn_model(#"p9_zm_gold_aetherium_container", s_container.origin, s_container.angles);
			s_container.mdl clientfield::set("" + #"hash_5db889fa88fbbe02", 4);
			s_container.mdl moveto(s_container.origin + vectorscale((0, 0, 1), 30), 1);
			playsoundatposition(#"hash_2eb7e53bbef32adf", s_container.origin + vectorscale((0, 0, 1), 30));
			s_fx = struct::get(#"hash_5296018a08d2d23a");
			playfx(#"hash_4413769381cdade2", s_fx.origin, anglestoforward(s_fx.angles), anglestoup(s_fx.angles));
			s_container.mdl waittill(#"movedone");
			wait(1);
			level thread zm_vo::function_7622cb70(#"hash_3e83d33830605ace");
			level util::delay(3, #"end_game", &function_b9a3fa11, #"hash_1a07aa5e4de8730", #"hash_1a06aa5e4de6c00", #"hash_1a06ea5e4de72cc");
		}
		s_container.mdl clientfield::set("" + #"hash_3ee70ebc06c36969", 1);
		wait(1);
		level thread function_df33ac59(s_container);
	}
	else
	{
		zm_unitrigger::unregister_unitrigger(s_container.s_unitrigger);
		level flag::set(#"hash_447995ebf38228d0");
		level zm_ui_inventory::function_7df6bb60(#"hash_41f1715c1f176f3b", 1);
		level flag::set(#"hash_7a45234210f642a1");
		level.var_28c80220++;
		arrayremovevalue(level.var_852bdce8, s_container);
		playsoundatposition(#"hash_580d07205ee4fd96", s_container.mdl.origin + vectorscale((0, 0, 1), 10));
		s_container.mdl clientfield::set("" + #"hash_5db889fa88fbbe02", 0);
		s_container.mdl ghost();
		s_container.mdl thread util::delayed_delete(1);
	}
}

/*
	Name: function_df33ac59
	Namespace: namespace_af171776
	Checksum: 0xA5198FB8
	Offset: 0x8F48
	Size: 0x5FA
	Parameters: 1
	Flags: Linked
*/
function function_df33ac59(s_container)
{
	level endon(#"end_game");
	exploder::exploder("fxexp_radiation");
	if(!isdefined(level.var_4f92e3a0))
	{
		level.var_4f92e3a0 = spawnstruct();
	}
	var_18ceba08 = level.var_4f92e3a0;
	var_18ceba08 flag::clear(#"zombies");
	var_18ceba08 flag::clear(#"completed");
	var_18ceba08 flag::clear(#"success");
	var_18ceba08 flag::clear(#"failed");
	var_18ceba08.v_center = s_container.origin;
	var_18ceba08.var_ee657f9b = 512;
	mdl_dome = util::spawn_model(#"hash_5079f3c7d659ff2", var_18ceba08.v_center);
	mdl_dome clientfield::set("" + #"hash_46bf4cc1eea0741a", 1);
	level thread function_35914dc4(var_18ceba08);
	mdl_dome setscale(1);
	level thread function_cdba47c6(var_18ceba08, mdl_dome);
	callback::on_spawned(&function_92f65927);
	foreach(e_player in function_a1ef346b())
	{
		e_player thread function_92f65927();
	}
	level thread function_c5a09ae3(var_18ceba08);
	var_18ceba08 flag::wait_till_any([1:#"failed", 0:#"success"]);
	var_18ceba08 flag::set(#"completed");
	level flag::clear(#"hash_793eafdc24e3f0eb");
	callback::remove_on_spawned(&function_92f65927);
	foreach(e_player in getplayers())
	{
		function_882a2c43(e_player, 0);
	}
	exploder::stop_exploder("fxexp_radiation");
	mdl_dome clientfield::set("" + #"hash_46bf4cc1eea0741a", 0);
	mdl_dome thread util::delayed_delete(1);
	s_container.mdl clientfield::set("" + #"hash_3ee70ebc06c36969", 0);
	if(!isdefined(level.var_852bdce8))
	{
		level.var_852bdce8 = [];
	}
	else if(!isarray(level.var_852bdce8))
	{
		level.var_852bdce8 = array(level.var_852bdce8);
	}
	if(!isinarray(level.var_852bdce8, s_container))
	{
		level.var_852bdce8[level.var_852bdce8.size] = s_container;
	}
	if(var_18ceba08 flag::get(#"success"))
	{
		s_container flag::set(#"hash_4edaa9e538a35497");
		s_container.var_4a5787c9 = 0;
	}
	else
	{
		s_container.mdl clientfield::set("" + #"hash_6ab08e0e1cffcd35", 1);
		level thread function_f36d9845(s_container);
		level waittill(#"end_of_round");
		s_container.mdl clientfield::set("" + #"hash_6ab08e0e1cffcd35", 0);
		s_container notify(#"hash_13939f4d75e88028");
		s_container.var_4a5787c9 = 0;
	}
}

/*
	Name: function_35914dc4
	Namespace: namespace_af171776
	Checksum: 0xD0BD620E
	Offset: 0x9550
	Size: 0x19C
	Parameters: 1
	Flags: Linked
*/
function function_35914dc4(var_18ceba08)
{
	level endon(#"end_game");
	var_18ceba08 endon(#"completed");
	/#
		if(getdvarint(#"hash_5175e492b5b26c3a", 0))
		{
			return;
		}
	#/
	var_44defc26 = 0;
	while(true)
	{
		wait(1);
		var_6c6a5caa = 1;
		foreach(e_player in function_a1ef346b(undefined, var_18ceba08.v_center, var_18ceba08.var_ee657f9b))
		{
			if(zm_utility::is_player_valid(e_player))
			{
				var_6c6a5caa = 0;
				break;
			}
		}
		if(var_6c6a5caa)
		{
			var_44defc26++;
			if(var_44defc26 >= 3)
			{
				break;
			}
		}
		else
		{
			var_44defc26 = 0;
		}
	}
	var_18ceba08 flag::set(#"failed");
}

/*
	Name: function_cdba47c6
	Namespace: namespace_af171776
	Checksum: 0x75C3EB4B
	Offset: 0x96F8
	Size: 0x184
	Parameters: 2
	Flags: Linked
*/
function function_cdba47c6(var_18ceba08, mdl_dome)
{
	if(!isdefined(var_18ceba08) || !isdefined(mdl_dome))
	{
		return;
	}
	level endon(#"end_game");
	var_18ceba08 endon(#"completed");
	wait(30);
	n_scale = 1;
	n_start_time = gettime();
	while(isdefined(mdl_dome) && n_scale > 0.3515625)
	{
		n_percent = ((float(gettime() - n_start_time)) / 1000) / 120;
		n_scale = lerpfloat(1, 0.3515625, n_percent);
		n_scale = max(n_scale, 0.3515625);
		mdl_dome setscale(n_scale);
		var_ee657f9b = lerpfloat(512, 180, n_percent);
		var_ee657f9b = max(var_ee657f9b, 180);
		var_18ceba08.var_ee657f9b = var_ee657f9b;
		waitframe(1);
	}
}

/*
	Name: function_92f65927
	Namespace: namespace_af171776
	Checksum: 0x29880418
	Offset: 0x9888
	Size: 0x19E
	Parameters: 0
	Flags: Linked
*/
function function_92f65927()
{
	self notify("565b6cd98efd529e");
	self endon("565b6cd98efd529e");
	level endon(#"end_game");
	self endon(#"death");
	var_18ceba08 = level.var_4f92e3a0;
	if(!isdefined(var_18ceba08) || var_18ceba08 flag::get(#"completed"))
	{
		return;
	}
	var_18ceba08 endon(#"completed");
	self.var_9493a52c = 0;
	level thread function_7dc5b077(var_18ceba08, self);
	while(true)
	{
		n_dist = distancesquared(self.origin, var_18ceba08.v_center);
		if(n_dist <= sqr(2048) && n_dist > sqr(var_18ceba08.var_ee657f9b))
		{
			function_5f6a508b(self);
			function_46932caa(self);
		}
		else
		{
			self.var_9493a52c = 0;
			function_882a2c43(self);
		}
		waitframe(1);
	}
}

/*
	Name: function_5f6a508b
	Namespace: namespace_af171776
	Checksum: 0x28F30E95
	Offset: 0x9A30
	Size: 0x94
	Parameters: 1
	Flags: Linked
*/
function function_5f6a508b(e_player)
{
	if(!isdefined(e_player) || e_player flag::get(#"hash_d4826b65faa9efb"))
	{
		return;
	}
	e_player flag::set(#"hash_d4826b65faa9efb");
	e_player clientfield::set_to_player("" + #"hash_d4826b65faa9efb", 1);
}

/*
	Name: function_882a2c43
	Namespace: namespace_af171776
	Checksum: 0x7321EC70
	Offset: 0x9AD0
	Size: 0xAC
	Parameters: 2
	Flags: Linked
*/
function function_882a2c43(e_player, var_468fde99)
{
	if(!isdefined(var_468fde99))
	{
		var_468fde99 = 1;
	}
	if(!isdefined(e_player) || (var_468fde99 && !e_player flag::get(#"hash_d4826b65faa9efb")))
	{
		return;
	}
	e_player flag::clear(#"hash_d4826b65faa9efb");
	e_player clientfield::set_to_player("" + #"hash_d4826b65faa9efb", 0);
}

/*
	Name: function_7dc5b077
	Namespace: namespace_af171776
	Checksum: 0x38F5F4D3
	Offset: 0x9B88
	Size: 0x74
	Parameters: 2
	Flags: Linked
*/
function function_7dc5b077(var_18ceba08, e_player)
{
	if(!isdefined(var_18ceba08) || !isdefined(e_player))
	{
		return;
	}
	var_18ceba08 endon(#"complete");
	e_player waittill(#"death");
	function_882a2c43(e_player, 0);
}

/*
	Name: function_46932caa
	Namespace: namespace_af171776
	Checksum: 0x61957738
	Offset: 0x9C08
	Size: 0x16C
	Parameters: 1
	Flags: Linked
*/
function function_46932caa(e_player)
{
	if(!zm_utility::is_player_valid(e_player) || e_player flag::get(#"hash_5ff5159adfca3ce8"))
	{
		return;
	}
	e_player flag::set(#"hash_5ff5159adfca3ce8");
	level thread function_9bd73066(e_player);
	var_9493a52c = min(e_player.var_9493a52c + 1, 15);
	e_player.var_9493a52c = var_9493a52c;
	n_damage = 30;
	if(var_9493a52c <= 10)
	{
		n_damage = 15;
		if(var_9493a52c <= 5)
		{
			n_damage = 5;
		}
	}
	e_player dodamage(n_damage, e_player.origin);
	var_b597becb = getstatuseffect(#"dot_dome_gas");
	e_player thread status_effect::status_effect_apply(var_b597becb, undefined, e_player);
}

/*
	Name: function_9bd73066
	Namespace: namespace_af171776
	Checksum: 0xB40769A2
	Offset: 0x9D80
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function function_9bd73066(e_player)
{
	if(!isdefined(e_player))
	{
		return;
	}
	wait(1);
	if(isdefined(e_player))
	{
		e_player flag::clear(#"hash_5ff5159adfca3ce8");
	}
}

/*
	Name: function_f36d9845
	Namespace: namespace_af171776
	Checksum: 0x1C39340A
	Offset: 0x9DD0
	Size: 0x1E4
	Parameters: 1
	Flags: Linked
*/
function function_f36d9845(s_canister)
{
	level endon(#"end_game", #"end_of_round");
	s_canister endon(#"hash_13939f4d75e88028");
	var_57e77903 = s_canister.mdl;
	v_origin = var_57e77903.origin;
	w_weapon = getweapon(#"tear_gas");
	statuseffect = getstatuseffect(#"hash_13181eed582a78fd");
	while(true)
	{
		foreach(e_player in function_a1ef346b(undefined, v_origin, 128))
		{
			if(zm_utility::is_player_valid(e_player) && (abs(v_origin[2] - e_player.origin[2])) <= 72)
			{
				e_player thread status_effect::status_effect_apply(statuseffect, w_weapon, var_57e77903);
			}
		}
		wait(0.2);
	}
}

/*
	Name: function_ad8d71a0
	Namespace: namespace_af171776
	Checksum: 0x7FFB3A7
	Offset: 0x9FC0
	Size: 0x16E
	Parameters: 1
	Flags: Linked
*/
function function_ad8d71a0(zonename)
{
	var_e95523a = undefined;
	foreach(crystal_pos in level.var_5868e205)
	{
		if(crystal_pos.script_noteworthy === zonename)
		{
			if(isdefined(var_e95523a))
			{
				if(!isarray(var_e95523a))
				{
					if(!isdefined(var_e95523a))
					{
						var_e95523a = [];
					}
					else if(!isarray(var_e95523a))
					{
						var_e95523a = array(var_e95523a);
					}
				}
				if(!isdefined(var_e95523a))
				{
					var_e95523a = [];
				}
				else if(!isarray(var_e95523a))
				{
					var_e95523a = array(var_e95523a);
				}
				if(!isinarray(var_e95523a, crystal_pos))
				{
					var_e95523a[var_e95523a.size] = crystal_pos;
				}
				continue;
			}
			var_e95523a = crystal_pos;
		}
	}
	return var_e95523a;
}

/*
	Name: function_157c5321
	Namespace: namespace_af171776
	Checksum: 0x4207301F
	Offset: 0xA138
	Size: 0xB4
	Parameters: 2
	Flags: Linked
*/
function function_157c5321(b_skipped, var_19e802fa)
{
	level flag::set(#"hash_447995ebf38228d0");
	level flag::set(#"hash_2041fe24705ad8c9");
	level flag::set(#"hash_384b665200ca31eb");
	level.var_28c80220 = 3;
	level flag::set(#"hash_11b32b176a293211");
}

/*
	Name: function_8365add8
	Namespace: namespace_af171776
	Checksum: 0x4EAD5BD8
	Offset: 0xA1F8
	Size: 0x83A
	Parameters: 1
	Flags: Linked
*/
function function_8365add8(b_skipped)
{
	if(b_skipped)
	{
		return;
	}
	level flag::wait_till_all(array(#"hash_1f5f04cb61802118", #"hash_1f5f07cb61802631", #"hash_1f5f06cb6180247e"));
	/#
		iprintlnbold("");
	#/
	var_fac83bd = struct::get("opc_activator_pos");
	var_1f5391d1 = struct::get("tp_pos");
	var_e8c728b4 = util::spawn_model("tag_origin", var_fac83bd.origin, var_fac83bd.angles);
	zm_sq::objective_set(#"hash_70910dcf03846864", var_1f5391d1);
	n_time = 0;
	while(true)
	{
		a_players = function_a1ef346b();
		var_e8178f0 = 0;
		foreach(player in a_players)
		{
			if(distancesquared(player.origin, var_1f5391d1.origin) < 160000 && player util::is_player_looking_at(var_1f5391d1.origin))
			{
				var_e8178f0 = 1;
				break;
			}
		}
		if(var_e8178f0 || n_time >= 150)
		{
			break;
		}
		waitframe(1);
		n_time = n_time + (float(function_60d95f53()) / 1000);
	}
	zm_sq::objective_complete(#"hash_70910dcf03846864", var_1f5391d1);
	zm_utility::function_d729de6a(1, [0:#"zone_opc_room"]);
	if(isdefined(level.portal))
	{
		level.portal playloopsound(#"hash_61bfd6cc3f47194", 5);
		level.portal playsound(#"hash_508a2323a5946199");
	}
	exploder::exploder("fxexp_cin_mid_main_spawn_red");
	exploder::exploder("fxexp_cin_mid_main_spawn");
	var_e8c728b4 zm_vo::function_d6f8bbd9(#"hash_43e85507a029ca1a", 0, undefined, 1);
	foreach(player in function_a1ef346b())
	{
		player function_66337ef1(#"hash_665d7e2386e92b98");
		player thread function_1f427fc1();
	}
	var_e8c728b4 zm_vo::function_d6f8bbd9(#"hash_43e85607a029cbcd");
	level zm_vo::function_7622cb70(#"hash_69ab4c75699cd464");
	if(isdefined(level.portal))
	{
		level.portal playsound(#"hash_4c3121363d5dcc52");
	}
	level clientfield::set("" + #"hash_6c7ee343dab35f07", 1);
	if(isdefined(level.portal))
	{
		level.portal playsound(#"hash_521261c5fc6bf5bf");
	}
	var_e8c728b4 zm_vo::function_d6f8bbd9(#"hash_2ed2fc51e08b749b");
	level thread function_57acf4b3(3);
	var_e8c728b4 zm_vo::function_d6f8bbd9(#"hash_43b82a91736564ac");
	if(isdefined(level.portal))
	{
		level.portal stoploopsound(0.5);
		level.portal playsound(#"hash_bf92f44d5acaeaa");
	}
	level clientfield::set("" + #"hash_6c7ee343dab35f07", 0);
	exploder::stop_exploder("fxexp_cin_mid_main_spawn_close");
	if(isdefined(level.portal))
	{
		function_7814d598(#"off");
	}
	foreach(player in getplayers())
	{
		player stoprumble(#"hash_665d7e2386e92b98");
		player notify(#"hash_76fa1ccbdb31ec1b");
	}
	if(isdefined(level.var_5a3a7338))
	{
		level.var_5a3a7338 delete();
	}
	level zm_vo::function_7622cb70(#"hash_4e77b5925fa2aff3", 3);
	level zm_vo::function_7622cb70(#"hash_1232f1d835656b19");
	level zm_vo::function_7622cb70(#"hash_27c3ea192aa6aae6");
	level thread function_2f0869bc();
	if(isdefined(level.portal))
	{
		level.portal delete();
	}
	if(isdefined(var_e8c728b4))
	{
		var_e8c728b4 delete();
	}
	level notify(#"hash_bbb538fda3639e4");
	zm_utility::function_d729de6a(0, [0:#"zone_opc_room"]);
	wait(30);
}

/*
	Name: function_57acf4b3
	Namespace: namespace_af171776
	Checksum: 0xEADEE6F5
	Offset: 0xAA40
	Size: 0x6C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_57acf4b3(n_delay)
{
	if(!isdefined(n_delay))
	{
		n_delay = 0.5;
	}
	wait(n_delay);
	exploder::stop_exploder("fxexp_cin_mid_main_spawn_red");
	exploder::stop_exploder("fxexp_cin_mid_main_spawn");
	exploder::exploder("fxexp_cin_mid_main_spawn_close");
}

/*
	Name: function_1f427fc1
	Namespace: namespace_af171776
	Checksum: 0x1D193B1D
	Offset: 0xAAB8
	Size: 0x5E
	Parameters: 0
	Flags: Linked
*/
function function_1f427fc1()
{
	self endon(#"death", #"hash_76fa1ccbdb31ec1b");
	while(true)
	{
		self playsoundtoplayer(#"hash_7b48ab684f546cde", self);
		wait(3);
	}
}

/*
	Name: function_2f0869bc
	Namespace: namespace_af171776
	Checksum: 0x60218E65
	Offset: 0xAB20
	Size: 0x4C4
	Parameters: 0
	Flags: Linked
*/
function function_2f0869bc()
{
	self notify("619dbf8604d01b56");
	self endon("619dbf8604d01b56");
	level endon(#"end_game");
	level notify(#"hash_67560f7c31cd5e89");
	level.var_9a81036b childthread namespace_1812c3f4::function_20df51b5();
	level.var_90655717 zm_unitrigger::unregister_unitrigger(level.var_90655717.s_unitrigger);
	level.var_90655717 zm_unitrigger::function_fac87205(&function_946d65b9, 100);
	level flag::set(#"hash_105197dc3cc8052e");
	namespace_1812c3f4::function_e8d13d70();
	level.var_9a81036b zm_vo::function_d6f8bbd9(#"hash_5cb7e27882557f36");
	namespace_1812c3f4::function_98b949fc();
	level flag::clear(#"hash_105197dc3cc8052e");
	wait(5);
	level.var_90655717 zm_unitrigger::function_fac87205(&function_946d65b9, 100);
	level flag::set(#"hash_105197dc3cc8052e");
	namespace_1812c3f4::function_e8d13d70();
	level.var_9a81036b zm_vo::function_d6f8bbd9(#"hash_6d786f8ee5c334d5");
	level.var_9a81036b zm_vo::function_d6f8bbd9(#"hash_6d786e8ee5c33322");
	namespace_1812c3f4::function_98b949fc();
	level flag::clear(#"hash_105197dc3cc8052e");
	wait(5);
	level.var_90655717 zm_unitrigger::function_fac87205(&function_946d65b9, 100);
	level flag::set(#"hash_105197dc3cc8052e");
	namespace_1812c3f4::function_e8d13d70();
	level.var_9a81036b zm_vo::function_d6f8bbd9(#"hash_463db778febc7fe0");
	namespace_1812c3f4::function_98b949fc();
	level flag::clear(#"hash_105197dc3cc8052e");
	wait(5);
	level.var_90655717 zm_unitrigger::function_fac87205(&function_946d65b9, 100);
	level flag::set(#"hash_105197dc3cc8052e");
	namespace_1812c3f4::function_e8d13d70();
	level.var_9a81036b zm_vo::function_d6f8bbd9(#"hash_33218b9cb2d0d1a7");
	level.var_9a81036b zm_vo::function_d6f8bbd9(#"hash_33218a9cb2d0cff4");
	level.var_9a81036b zm_vo::function_d6f8bbd9(#"hash_33218d9cb2d0d50d");
	namespace_1812c3f4::function_98b949fc();
	level flag::clear(#"hash_105197dc3cc8052e");
	wait(5);
	level.var_90655717 zm_unitrigger::function_fac87205(&function_946d65b9, 100);
	level flag::set(#"hash_105197dc3cc8052e");
	namespace_1812c3f4::function_e8d13d70();
	level.var_9a81036b zm_vo::function_d6f8bbd9(#"hash_43c8e4152218e0d2");
	level.var_9a81036b zm_vo::function_d6f8bbd9(#"hash_43c8e5152218e285");
	namespace_1812c3f4::function_98b949fc();
	level flag::clear(#"hash_105197dc3cc8052e");
}

/*
	Name: function_b78a218b
	Namespace: namespace_af171776
	Checksum: 0xEB0F9442
	Offset: 0xAFF0
	Size: 0x1C0
	Parameters: 2
	Flags: Linked
*/
function function_b78a218b(b_skipped, var_19e802fa)
{
	if(b_skipped || var_19e802fa)
	{
		exploder::stop_exploder("fxexp_cin_mid_main_spawn_red");
		exploder::stop_exploder("fxexp_cin_mid_main_spawn");
		exploder::stop_exploder("fxexp_cin_mid_main_spawn_close");
		if(var_19e802fa)
		{
			var_1f5391d1 = struct::get("tp_pos");
			zm_sq::objective_complete(#"hash_70910dcf03846864", var_1f5391d1);
		}
		zm_utility::function_d729de6a(0, [0:#"zone_opc_room"]);
		if(isdefined(level.portal))
		{
			level.portal delete();
		}
		level thread scene::play(#"aib_t9_zm_vign_peck_seated_01", "seated_loop", level.var_96689f39);
		level thread function_2f0869bc();
	}
	level flag::set(#"hash_1f5f04cb61802118");
	level flag::set(#"hash_1f5f07cb61802631");
	level flag::set(#"hash_1f5f06cb6180247e");
	level.var_28c80220 = 0;
}

/*
	Name: function_32fba4cd
	Namespace: namespace_af171776
	Checksum: 0x25420569
	Offset: 0xB1B8
	Size: 0x36C
	Parameters: 1
	Flags: Linked
*/
function function_32fba4cd(b_skipped)
{
	if(b_skipped)
	{
		return;
	}
	if(isdefined(level.var_5a3a7338))
	{
		level.var_5a3a7338 delete();
	}
	level zm_vo::function_7622cb70(#"hash_31a543911a839f83");
	level function_b9a3fa11(#"hash_267e4f0a9474ea86", #"hash_267e5f0a947505b6", #"hash_267e630a94750c82");
	level.var_ef84ff45 = [];
	level.var_f91a6ee = 300;
	/#
		assert(isdefined(level.terminal.group));
	#/
	level clientfield::set("" + #"hash_5c8a1cf9b543c223", level.terminal.group);
	var_ed980865 = function_30f0bf79();
	level flag::wait_till(#"hash_22e4c4a43b33a4bd");
	zm_unitrigger::unregister_unitrigger(var_ed980865);
	level thread function_aaac2a38();
	wait(4);
	level namespace_1812c3f4::function_78cc0d39(#"hash_c192062377eb938");
	wait(3);
	level namespace_1812c3f4::function_78cc0d39(#"hash_459eba0711755806");
	level namespace_1812c3f4::function_78cc0d39(#"hash_17e596f01f68cedd");
	wait(1.5);
	level namespace_1812c3f4::function_78cc0d39(#"hash_513b5b11b067f41e");
	level thread namespace_1812c3f4::function_78cc0d39(#"hash_47f6297583055596");
	level.var_894a83d8 = 1;
	level flag::set(#"infinite_round_spawning");
	level flag::set("spawn_zombies");
	var_1c8e649 = struct::get("s_tp_console");
	var_1c8e649 zm_unitrigger::create(#"hash_4be701bdba0686b8", 99, &function_666eda20);
	zm_sq::objective_set(#"hash_4acae0c2f9e8da3d", var_1c8e649, undefined, #"hash_116f95f8a12e36ba");
	level thread function_aded680b();
	level flag::wait_till(#"hash_118f37213e91b44d");
	/#
		iprintlnbold("");
	#/
}

/*
	Name: function_aaac2a38
	Namespace: namespace_af171776
	Checksum: 0x1466CE16
	Offset: 0xB530
	Size: 0x132
	Parameters: 0
	Flags: Linked
*/
function function_aaac2a38()
{
	level endon(#"hash_118f37213e91b44d");
	timer = gettime();
	while(true)
	{
		if(gettime() > timer)
		{
			foreach(player in function_a1ef346b())
			{
				player thread clientfield::increment_to_player("" + #"hash_5120ca20225a7324", 1);
			}
			wait(4);
			timer = gettime() + (int(randomintrange(5, 8) * 1000));
		}
		waitframe(1);
	}
}

/*
	Name: function_dca16fc0
	Namespace: namespace_af171776
	Checksum: 0xAED90949
	Offset: 0xB670
	Size: 0xB4
	Parameters: 0
	Flags: Linked
*/
function function_dca16fc0()
{
	level.no_powerups = 1;
	level flag::clear("spawn_zombies");
	level flag::clear("zombie_drop_powerups");
	level flag::clear(#"hash_21921ed511559aa3");
	level flag::set(#"pause_round_timeout");
	level flag::set("hold_round_end");
}

/*
	Name: function_666eda20
	Namespace: namespace_af171776
	Checksum: 0xE00C244D
	Offset: 0xB730
	Size: 0x60
	Parameters: 0
	Flags: Linked
*/
function function_666eda20()
{
	while(true)
	{
		self waittill(#"trigger");
		level flag::set(#"hash_118f37213e91b44d");
		zm_unitrigger::unregister_unitrigger(self.stub);
	}
}

/*
	Name: function_30f0bf79
	Namespace: namespace_af171776
	Checksum: 0xDE7421D4
	Offset: 0xB798
	Size: 0x8E
	Parameters: 0
	Flags: Linked
*/
function function_30f0bf79()
{
	var_2c6a70ef = struct::get("satellite_computer_pos", "targetname");
	var_df549657 = var_2c6a70ef zm_unitrigger::create(&function_a69ecd2c, 64, &function_6addcb69);
	var_df549657.var_47e9ef0c = var_2c6a70ef;
	var_df549657.var_47e9ef0c.var_ec1fca48 = level.round_number;
	return var_df549657;
}

/*
	Name: function_a69ecd2c
	Namespace: namespace_af171776
	Checksum: 0xC04A5BD8
	Offset: 0xB830
	Size: 0x184
	Parameters: 1
	Flags: Linked
*/
function function_a69ecd2c(e_player)
{
	if(isplayer(e_player))
	{
		if(level flag::get(#"hash_7752d012501cd222"))
		{
			return false;
		}
		if(!level flag::get_all(array("captured_control_point1", "captured_control_point2", "captured_control_point3")))
		{
			return false;
		}
		if(level flag::get(#"hash_f274034949876d7"))
		{
			return false;
		}
		if(isdefined(self.stub.var_47e9ef0c.var_ec1fca48) && level.round_number < self.stub.var_47e9ef0c.var_ec1fca48)
		{
			self sethintstringforplayer(e_player, #"hash_495ccd58c4bd8e7b");
			return true;
		}
		if(!level flag::get(#"hash_7bbbf2ad970ee0c2"))
		{
			self sethintstringforplayer(e_player, #"hash_385ac8e678b4a402");
			return true;
		}
	}
	return false;
}

/*
	Name: function_6addcb69
	Namespace: namespace_af171776
	Checksum: 0x7C5CA657
	Offset: 0xB9C0
	Size: 0x298
	Parameters: 0
	Flags: Linked
*/
function function_6addcb69()
{
	level endon(#"end_game");
	self endon(#"death");
	if(!isdefined(level.var_7c7b2f25))
	{
		level.var_7c7b2f25 = 0;
	}
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"trigger");
		level flag::set(#"hash_5dce120a8e013b48");
		if(isdefined(self.stub.var_47e9ef0c.var_ec1fca48) && level.round_number >= self.stub.var_47e9ef0c.var_ec1fca48)
		{
			level flag::set(#"hash_f274034949876d7");
			player = waitresult.activator;
			player function_bc82f900(#"hash_3937704286348bfa");
			playsoundatposition(#"hash_38f4c586226a2f93", self.stub.var_47e9ef0c.origin);
			if(!level.var_7c7b2f25)
			{
				level thread function_b9a3fa11(#"hash_4505b5deaf63577a", #"hash_4505a5deaf633c4a", #"hash_4505a1deaf63357e");
				level.var_7c7b2f25 = 1;
			}
			s_target = self namespace_2a67e53::function_902089af(player);
			level flag::clear(#"hash_f274034949876d7");
			if(isdefined(s_target))
			{
				level thread function_ee77f553(s_target);
				self.stub.var_47e9ef0c.var_ec1fca48 = self.stub.var_47e9ef0c.var_ec1fca48 + 2;
				level thread function_41a039fe(self.stub.var_47e9ef0c.var_ec1fca48);
			}
		}
	}
}

/*
	Name: function_41a039fe
	Namespace: namespace_af171776
	Checksum: 0xED124488
	Offset: 0xBC60
	Size: 0xB4
	Parameters: 1
	Flags: Linked
*/
function function_41a039fe(round_number)
{
	self notify("273fcfe3247d5261");
	self endon("273fcfe3247d5261");
	level endon(#"end_game", #"death", #"hash_22e4c4a43b33a4bd");
	while(true)
	{
		level waittill(#"end_of_round");
		if(round_number < level.round_number)
		{
			level namespace_1812c3f4::function_78cc0d39(#"hash_6417f64768bed0b1");
			break;
		}
	}
}

/*
	Name: function_ee77f553
	Namespace: namespace_af171776
	Checksum: 0xEA9889A8
	Offset: 0xBD20
	Size: 0x764
	Parameters: 1
	Flags: Linked
*/
function function_ee77f553(s_target)
{
	level endon(#"end_game");
	level flag::set(#"hash_7bbbf2ad970ee0c2");
	level flag::set(#"hash_58d741b93fb5a331");
	level flag::clear("rbz_exfil_allowed");
	if(is_true(s_target.success))
	{
		level thread function_dca16fc0();
		level thread function_4f3ab7da();
	}
	var_d9080f61 = lerpfloat(50, 270, s_target.yaw);
	var_aa756da2 = lerpfloat(20, 70, s_target.pitch);
	var_62f885eb = getent("satellite_base", "targetname");
	satellite_base_swivel = getent("satellite_base_swivel", "targetname");
	var_24bedbb = getent("satellite_rotate_center", "targetname");
	satellite_fx_pos = struct::get("satellite_fx_pos", "targetname");
	if(!isdefined(var_62f885eb.fx_tag))
	{
		var_62f885eb.fx_tag = util::spawn_model("tag_origin", satellite_fx_pos.origin, satellite_fx_pos.angles);
	}
	var_62f885eb playsound(#"hash_3a4d278de8fac149");
	var_62f885eb playloopsound(#"hash_3d559b5f0ab4680f");
	foreach(player in function_a1ef346b())
	{
		player function_66337ef1(#"hash_3937704286348bfa");
	}
	satellite_base_swivel linkto(var_24bedbb);
	var_62f885eb.fx_tag linkto(var_24bedbb);
	base_time = var_24bedbb.angles[1];
	base_time = (base_time > 0 ? base_time : base_time + 360);
	base_time = abs(base_time - var_d9080f61);
	base_time = (base_time > 180 ? 360 - base_time : base_time);
	time = base_time / 5;
	/#
		iprintlnbold(time);
	#/
	if(time < 1)
	{
		time = 1;
	}
	else if(time > 15)
	{
		time = 15;
	}
	var_24bedbb rotateto((0, var_d9080f61, 90 - var_aa756da2), time);
	var_62f885eb rotateto((0, var_d9080f61, 0), time);
	var_62f885eb waittilltimeout(time, #"rotatedone");
	foreach(player in function_a1ef346b())
	{
		player stoprumble(#"hash_3937704286348bfa");
	}
	/#
		iprintlnbold("");
	#/
	level flag::clear(#"hash_58d741b93fb5a331");
	var_62f885eb stoploopsound();
	var_62f885eb playsound(#"hash_2a10867f535ea938");
	if(is_true(s_target.success))
	{
		level flag::wait_till("#rotate_satellite_base_vo_success_done");
		level function_b9a3fa11(#"hash_31e43ad4ac786631", #"hash_31e44ad4ac788161", #"hash_31e44ed4ac78882d");
		level namespace_1812c3f4::function_78cc0d39(#"hash_4d4e175616429fbe");
		level namespace_1812c3f4::function_78cc0d39(#"hash_6101313164a1aed1");
		level namespace_1812c3f4::function_78cc0d39(#"hash_23cd8c0e642e8db4");
		level namespace_1812c3f4::function_78cc0d39(#"hash_267b1faaad5aa807");
		var_62f885eb.fx_tag clientfield::set("" + #"hash_6f292901e2fcaeb3", 1);
		level zm_vo::function_7622cb70(#"hash_2589c1d3e717294");
		level flag::clear(#"hash_5dc90fb13f4ddf12");
		level flag::set(#"hash_22e4c4a43b33a4bd");
	}
	else
	{
		wait(1);
		level function_b9a3fa11(#"hash_49a0f334deb312ae", #"hash_49a0e334deb2f77e", #"hash_49a0e734deb2fe4a");
		level flag::clear(#"hash_7bbbf2ad970ee0c2");
		level flag::clear(#"hash_5dce120a8e013b48");
	}
}

/*
	Name: function_4f3ab7da
	Namespace: namespace_af171776
	Checksum: 0x435B5102
	Offset: 0xC490
	Size: 0x6C
	Parameters: 0
	Flags: Linked
*/
function function_4f3ab7da()
{
	wait(1.5);
	level zm_vo::function_7622cb70(#"hash_3d1c1a9f248e2e06");
	level zm_vo::function_7622cb70(#"hash_7f0ae406060f431");
	level flag::set("#rotate_satellite_base_vo_success_done");
}

/*
	Name: function_40d9cf7a
	Namespace: namespace_af171776
	Checksum: 0x7CADBEC8
	Offset: 0xC508
	Size: 0x13C
	Parameters: 4
	Flags: Linked
*/
function function_40d9cf7a(current_point, var_3751e731, var_9d16fce2, var_737cf3ae)
{
	if(!isdefined(var_9d16fce2))
	{
		var_9d16fce2 = 0;
	}
	if(!isdefined(var_737cf3ae))
	{
		var_737cf3ae = undefined;
	}
	if(!isdefined(current_point))
	{
		current_point = array::random(var_3751e731);
	}
	else
	{
		while(true)
		{
			next_point = array::random(var_3751e731);
			if(var_9d16fce2)
			{
				if(current_point != next_point && next_point.var_269ad176 === 1)
				{
					current_point = next_point;
					break;
				}
			}
			else if(current_point != next_point)
			{
				dis = distance(current_point.origin, next_point.origin);
				if(isdefined(var_737cf3ae))
				{
					if(isdefined(dis) && dis >= var_737cf3ae)
					{
						current_point = next_point;
						break;
					}
				}
				else
				{
					current_point = next_point;
					break;
				}
			}
			waitframe(1);
		}
	}
	return current_point;
}

/*
	Name: function_aded680b
	Namespace: namespace_af171776
	Checksum: 0x2156BFDF
	Offset: 0xC650
	Size: 0x8C
	Parameters: 0
	Flags: Linked
*/
function function_aded680b()
{
	level endon(#"end_game", #"hash_118f37213e91b44d");
	timeout = gettime() + (int(90 * 1000));
	while(gettime() < timeout)
	{
		waitframe(1);
	}
	level flag::set(#"hash_118f37213e91b44d");
}

/*
	Name: function_f040e2ee
	Namespace: namespace_af171776
	Checksum: 0x52455117
	Offset: 0xC6E8
	Size: 0xCC
	Parameters: 2
	Flags: None
*/
function function_f040e2ee(index, override_time)
{
	if(!isdefined(override_time))
	{
		override_time = undefined;
	}
	level endon(#"end_game", #"hash_5dc90fb13f4ddf12", #"hash_22e4c4a43b33a4bd");
	if(isdefined(override_time))
	{
		wait(override_time);
	}
	else
	{
		wait(60);
	}
	level flag::set(#"hash_615084a299d1da04" + index);
	wait(3);
	level flag::clear(#"hash_615084a299d1da04" + index);
}

/*
	Name: function_3d89b096
	Namespace: namespace_af171776
	Checksum: 0x17A66160
	Offset: 0xC7C0
	Size: 0xC8
	Parameters: 1
	Flags: None
*/
function function_3d89b096(var_aa67e3a5)
{
	level endon(#"end_game", #"hash_5dc90fb13f4ddf12", #"hash_22e4c4a43b33a4bd");
	function_2eb5792(var_aa67e3a5);
	if(getplayers().size === 1)
	{
		wait(45);
		function_51001a7b();
		level notify(#"hash_29a4c64cdfba6465");
	}
	else
	{
		wait(45);
		function_51001a7b();
		level notify(#"hash_29a4c64cdfba6465");
	}
}

/*
	Name: function_2eb5792
	Namespace: namespace_af171776
	Checksum: 0x234AFD6D
	Offset: 0xC890
	Size: 0x230
	Parameters: 1
	Flags: Linked
*/
function function_2eb5792(var_aa67e3a5)
{
	if(isarray(var_aa67e3a5))
	{
		foreach(var_9fbdac89 in var_aa67e3a5)
		{
			zm_sq::objective_set(#"hash_68f4e9062d28524d", var_9fbdac89, undefined, #"hash_3859482a0c5aa91f");
			if(!isdefined(level.var_ef84ff45))
			{
				level.var_ef84ff45 = [];
			}
			else if(!isarray(level.var_ef84ff45))
			{
				level.var_ef84ff45 = array(level.var_ef84ff45);
			}
			if(!isinarray(level.var_ef84ff45, var_9fbdac89))
			{
				level.var_ef84ff45[level.var_ef84ff45.size] = var_9fbdac89;
			}
		}
	}
	else
	{
		zm_sq::objective_set(#"hash_68f4e9062d28524d", var_aa67e3a5, undefined, #"hash_3859482a0c5aa91f");
		if(!isdefined(level.var_ef84ff45))
		{
			level.var_ef84ff45 = [];
		}
		else if(!isarray(level.var_ef84ff45))
		{
			level.var_ef84ff45 = array(level.var_ef84ff45);
		}
		if(!isinarray(level.var_ef84ff45, var_aa67e3a5))
		{
			level.var_ef84ff45[level.var_ef84ff45.size] = var_aa67e3a5;
		}
	}
}

/*
	Name: function_51001a7b
	Namespace: namespace_af171776
	Checksum: 0xDC7ABBDA
	Offset: 0xCAC8
	Size: 0xA4
	Parameters: 0
	Flags: Linked
*/
function function_51001a7b()
{
	foreach(var_9fbdac89 in level.var_ef84ff45)
	{
		zm_sq::objective_complete(#"hash_68f4e9062d28524d", var_9fbdac89);
	}
	level.var_ef84ff45 = [];
}

/*
	Name: function_2b4153d6
	Namespace: namespace_af171776
	Checksum: 0x7A682DF7
	Offset: 0xCB78
	Size: 0x174
	Parameters: 3
	Flags: None
*/
function function_2b4153d6(var_c1369554, index, var_4fcb30db)
{
	if(!isdefined(var_4fcb30db))
	{
		var_4fcb30db = 0;
	}
	level endon(#"end_game", #"hash_5dc90fb13f4ddf12", #"hash_22e4c4a43b33a4bd");
	/#
		iprintlnbold("" + index);
	#/
	while(!level flag::get(#"hash_615084a299d1da04" + index))
	{
		var_9777582e = getentarray("assault_ai" + var_c1369554.script_int, "targetname");
		if(var_9777582e.size < 20 || var_4fcb30db)
		{
			level thread namespace_b7a7e548::function_44361a8f(var_c1369554, undefined, 10 + (getplayers().size * 4));
		}
		wait(10);
	}
	/#
		iprintlnbold(("" + index) + "");
	#/
}

/*
	Name: function_aba92bd4
	Namespace: namespace_af171776
	Checksum: 0xBA879CA
	Offset: 0xCCF8
	Size: 0x164
	Parameters: 2
	Flags: Linked
*/
function function_aba92bd4(b_skipped, var_19e802fa)
{
	level clientfield::set("" + #"hash_5c8a1cf9b543c223", 0);
	level thread namespace_2a67e53::cleanup();
	var_1c8e649 = struct::get("s_tp_console");
	zm_sq::objective_complete(#"hash_4acae0c2f9e8da3d", var_1c8e649);
	level.var_894a83d8 = 0;
	level flag::clear(#"infinite_round_spawning");
	level function_dca16fc0();
	level zm_utility::function_9ad5aeb1(0, 0, 1, 0);
	level flag::set(#"hash_22e4c4a43b33a4bd");
	level flag::set(#"hash_118f37213e91b44d");
}

/*
	Name: function_d329256
	Namespace: namespace_af171776
	Checksum: 0x4F105790
	Offset: 0xCE68
	Size: 0x4B4
	Parameters: 1
	Flags: None
*/
function function_d329256(v_center)
{
	level endon(#"end_game");
	var_4d57e237 = util::spawn_model("tag_origin", v_center);
	var_4d57e237 clientfield::set("" + #"hash_571f15e1b82b6e1e", 1);
	var_4d57e237 setscale(0.1333333);
	var_3098593c = util::spawn_model("tag_origin", v_center);
	var_3098593c clientfield::set("" + #"hash_571f15e1b82b6e1e", 1);
	var_3098593c thread function_b5fa44e4();
	level thread function_c5a09ae3(v_center);
	level thread function_60a64aa9(var_3098593c, 2000);
	var_b597becb = getstatuseffect("dot_dome_gas");
	while(level.var_b089f503 > 0 || level flag::get("dome_zombie_spawning"))
	{
		a_ai_zombies = array::get_all_closest(v_center, getaiteamarray(level.zombie_team), undefined, undefined, 2000);
		foreach(ai in a_ai_zombies)
		{
			dist = distance2d(ai.origin, v_center);
			if(dist > var_3098593c.var_6fcf713a)
			{
				ai dodamage(10, ai.origin);
			}
		}
		a_players = getplayers();
		var_bec85643 = 1;
		foreach(player in a_players)
		{
			dist = distance2d(player.origin, v_center);
			if(dist <= 2000)
			{
				var_bec85643 = 0;
				if(dist > var_3098593c.var_6fcf713a)
				{
					player status_effect::status_effect_apply(var_b597becb, undefined, player);
				}
			}
		}
		if(var_bec85643)
		{
			break;
		}
		wait(0.5);
	}
	var_5dcab950 = getaiarchetypearray(#"zombie");
	foreach(ai in var_5dcab950)
	{
		ai.ignore_player = [];
	}
	level notify(#"hash_4ff88f43cb6063b9", {#success:!var_bec85643});
	if(isdefined(var_3098593c))
	{
		var_3098593c delete();
	}
	if(isdefined(var_4d57e237))
	{
		var_4d57e237 delete();
	}
}

/*
	Name: function_60a64aa9
	Namespace: namespace_af171776
	Checksum: 0x30328AF3
	Offset: 0xD328
	Size: 0x230
	Parameters: 2
	Flags: Linked
*/
function function_60a64aa9(target_entity, radius)
{
	level endon(#"end_game", #"hash_4ff88f43cb6063b9");
	var_b9764f1a = [];
	while(true)
	{
		foreach(player in function_a1ef346b())
		{
			dis = distance(player.origin, target_entity.origin);
			if(dis < radius)
			{
				if(!isdefined(var_b9764f1a))
				{
					var_b9764f1a = [];
				}
				else if(!isarray(var_b9764f1a))
				{
					var_b9764f1a = array(var_b9764f1a);
				}
				if(!isinarray(var_b9764f1a, player))
				{
					var_b9764f1a[var_b9764f1a.size] = player;
				}
				continue;
			}
			arrayremovevalue(var_b9764f1a, player);
		}
		var_5dcab950 = getaiarchetypearray(#"zombie");
		foreach(ai in var_5dcab950)
		{
			ai.ignore_player = var_b9764f1a;
		}
		wait(1);
	}
}

/*
	Name: function_b5fa44e4
	Namespace: namespace_af171776
	Checksum: 0x5D896FD8
	Offset: 0xD560
	Size: 0xD8
	Parameters: 0
	Flags: Linked
*/
function function_b5fa44e4()
{
	level endon(#"end_game");
	self endon(#"death");
	self.var_6fcf713a = 512;
	self setscale(self.var_6fcf713a / 15000);
	wait(30);
	var_8020f96 = 452 / 2400;
	var_2c696c5e = 2400;
	while(var_2c696c5e > 0)
	{
		self setscale(self.var_6fcf713a / 15000);
		self.var_6fcf713a = self.var_6fcf713a - var_8020f96;
		var_2c696c5e--;
		waitframe(1);
	}
}

/*
	Name: function_c5a09ae3
	Namespace: namespace_af171776
	Checksum: 0x1D07A284
	Offset: 0xD640
	Size: 0x66C
	Parameters: 1
	Flags: Linked
*/
function function_c5a09ae3(var_18ceba08)
{
	level endon(#"end_game");
	var_18ceba08 endon(#"success", #"failed");
	v_center = var_18ceba08.v_center;
	var_18ceba08 flag::set(#"zombies");
	dog_count = (getplayers().size * 2) + 4;
	var_4b56616b = (getplayers().size > 2 ? 2 : 1);
	level.var_b089f503 = dog_count + var_4b56616b;
	var_eaeaf8e6 = 0;
	a_s_pts = namespace_85745671::function_e4791424(v_center, 20, 80, 600, 512);
	/#
		assert(a_s_pts.size > 0, "");
	#/
	i = 0;
	while(i < var_4b56616b)
	{
		s_pos = array::random(a_s_pts);
		if(isdefined(s_pos))
		{
			ai = spawnactor(#"hash_4f87aa2a203d37d0", s_pos.origin, s_pos.angles, "defend_zombie", 1);
			if(isdefined(ai))
			{
				ai callback::function_d8abfc3d(#"on_ai_killed", &function_d5b65d2f);
				ai zombie_utility::set_zombie_run_cycle("sprint");
				i++;
			}
		}
		wait(1.5);
	}
	wait(5);
	i = 0;
	while(i < dog_count)
	{
		s_pos = array::random(a_s_pts);
		if(isdefined(s_pos))
		{
			ai = spawnactor(#"hash_7a8b592728eec95d", s_pos.origin, s_pos.angles, "defend_zombie", 1);
			if(isdefined(ai))
			{
				ai callback::function_d8abfc3d(#"on_ai_killed", &function_d5b65d2f);
				ai zombie_utility::set_zombie_run_cycle("sprint");
				i++;
			}
		}
		wait(1.5);
	}
	wait(5);
	dog_count = (getplayers().size * 3) + 4;
	level.var_b089f503 = level.var_b089f503 + dog_count;
	i = 0;
	while(i < dog_count)
	{
		s_pos = array::random(a_s_pts);
		if(isdefined(s_pos))
		{
			ai = spawnactor(#"hash_7a8b592728eec95d", s_pos.origin, s_pos.angles, "defend_zombie", 1);
			if(isdefined(ai))
			{
				ai callback::function_d8abfc3d(#"on_ai_killed", &function_d5b65d2f);
				ai zombie_utility::set_zombie_run_cycle("sprint");
				i++;
			}
		}
		wait(1.5);
	}
	wait(8);
	dog_count = (getplayers().size * 3) + 8;
	level.var_b089f503 = (dog_count + level.var_b089f503) + var_4b56616b;
	i = 0;
	while(i < dog_count)
	{
		s_pos = array::random(a_s_pts);
		if(isdefined(s_pos))
		{
			ai = spawnactor(#"hash_7a8b592728eec95d", s_pos.origin, s_pos.angles, "defend_zombie", 1);
			if(isdefined(ai))
			{
				ai callback::function_d8abfc3d(#"on_ai_killed", &function_d5b65d2f);
				ai zombie_utility::set_zombie_run_cycle("sprint");
				i++;
			}
			if(i >= (dog_count / 2) && !is_true(var_eaeaf8e6))
			{
				m = 0;
				while(m < var_4b56616b)
				{
					s_pos = array::random(a_s_pts);
					if(isdefined(s_pos))
					{
						ai = spawnactor(#"hash_4f87aa2a203d37d0", s_pos.origin, s_pos.angles, "defend_zombie", 1);
						if(isdefined(ai))
						{
							ai callback::function_d8abfc3d(#"on_ai_killed", &function_d5b65d2f);
							ai zombie_utility::set_zombie_run_cycle("sprint");
							m++;
						}
					}
					wait(1.5);
				}
				var_eaeaf8e6 = 1;
			}
		}
		wait(1.5);
	}
	var_18ceba08 flag::clear(#"zombies");
}

/*
	Name: function_d5b65d2f
	Namespace: namespace_af171776
	Checksum: 0x89C6402E
	Offset: 0xDCB8
	Size: 0x94
	Parameters: 1
	Flags: Linked
*/
function function_d5b65d2f(s_params)
{
	level.var_b089f503--;
	var_18ceba08 = level.var_4f92e3a0;
	if(!isdefined(var_18ceba08))
	{
		return;
	}
	if(level.var_b089f503 <= 0 && !var_18ceba08 flag::get(#"zombies"))
	{
		var_18ceba08 flag::set(#"success");
	}
}

/*
	Name: function_351f1fe5
	Namespace: namespace_af171776
	Checksum: 0xE963356C
	Offset: 0xDD58
	Size: 0x84
	Parameters: 0
	Flags: None
*/
function function_351f1fe5()
{
	self endon(#"death");
	a_players = array::get_all_closest(self.origin, function_a1ef346b());
	if(isalive(a_players[0]))
	{
		awareness::function_c241ef9a(self, a_players[0], 30);
	}
}

/*
	Name: function_80b4d925
	Namespace: namespace_af171776
	Checksum: 0x765947B
	Offset: 0xDDE8
	Size: 0x2E4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_80b4d925()
{
	level notify(#"hash_2ef294d4837fda33");
	level.var_9674d6e2 zm_unitrigger::unregister_unitrigger(level.var_9674d6e2.s_unitrigger);
	zm_utility::function_d729de6a(1, [0:#"zone_napalm_strike2"]);
	level scene::stop(level.var_9a81036b.current_scene);
	str_scene = array::random([2:#"hash_1f626adcaaa6ef98", 1:#"hash_1f626bdcaaa6f14b", 0:#"hash_1f626cdcaaa6f2fe"]);
	switch(str_scene)
	{
		case "hash_1f626cdcaaa6f2fe":
		{
			level thread zm_vo::function_7622cb70(#"hash_671b8f1b6215a73b", undefined, undefined, undefined, 1);
			break;
		}
		case "hash_1f626bdcaaa6f14b":
		{
			level thread zm_vo::function_7622cb70(#"hash_671b901b6215a8ee", undefined, undefined, undefined, 1);
			break;
		}
		case "hash_1f626adcaaa6ef98":
		{
			level thread zm_vo::function_7622cb70(#"hash_671b911b6215aaa1", undefined, undefined, undefined, 1);
			break;
		}
	}
	var_7ebc4fe8 = array::random([2:#"hash_4cdef2876c1ec13c", 1:#"hash_4cdef3876c1ec2ef", 0:#"hash_4cdef4876c1ec4a2"]);
	level util::delay("start_ravenov_response_to_peck", "end_game", &zm_vo::function_7622cb70, var_7ebc4fe8);
	level scene::play(str_scene, level.var_96689f39);
	level thread scene::play("aib_t9_zm_vign_peck_seated_01", "seated_loop", level.var_96689f39);
	zm_utility::function_d729de6a(0, [0:#"zone_napalm_strike2"]);
}

/*
	Name: function_b3524864
	Namespace: namespace_af171776
	Checksum: 0x432F830C
	Offset: 0xE0D8
	Size: 0x144
	Parameters: 0
	Flags: Linked, Private
*/
function private function_b3524864()
{
	level flag::wait_till_clear(#"hash_105197dc3cc8052e");
	zm_unitrigger::unregister_unitrigger(level.var_90655717.s_unitrigger);
	level flag::set(#"dr_peck_mq_vignette_talking");
	level scene::stop(level.var_9a81036b.current_scene);
	zm_utility::function_d729de6a(1, [0:#"zone_napalm_strike2"]);
	level scene::play("aib_t9_zm_vign_cust_frbz_peck_vignette_02a", "into_dance", level.var_96689f39);
	level thread function_c952cd2c();
	zm_utility::function_d729de6a(0, [0:#"zone_napalm_strike2"]);
}

/*
	Name: function_c952cd2c
	Namespace: namespace_af171776
	Checksum: 0xBFFD666B
	Offset: 0xE228
	Size: 0x74
	Parameters: 0
	Flags: Linked
*/
function function_c952cd2c()
{
	level scene::play("aib_t9_zm_vign_cust_frbz_peck_vignette_02a", "dance_loop_narrative", level.var_96689f39);
	level thread scene::play("aib_t9_zm_vign_cust_frbz_peck_vignette_02a", "dance_loop", level.var_96689f39);
	level.var_1c9c24e5 = 1;
}

/*
	Name: function_31b6fa5b
	Namespace: namespace_af171776
	Checksum: 0xECFC8368
	Offset: 0xE2A8
	Size: 0x45C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_31b6fa5b()
{
	level notify(#"hash_7c153e7ca15e550f");
	zm_utility::function_d729de6a(1, [0:#"zone_napalm_strike2"]);
	level flag::set(#"dr_peck_mq_vignette_talking");
	level.var_90655717 zm_unitrigger::unregister_unitrigger(level.var_90655717.s_unitrigger);
	level waittill(#"hash_3d73e7b09a5f4f7");
	level.var_90655717 zm_unitrigger::create(#"hash_8907bffd7ded28e", 100, &function_ae6e3aa4);
	s_waitresult = undefined;
	s_waitresult = level waittill(#"hash_59def0fde5d07c3");
	level.var_90655717 zm_unitrigger::unregister_unitrigger(level.var_90655717.s_unitrigger);
	if(!is_true(level.var_1c9c24e5))
	{
		s_waitresult = undefined;
		s_waitresult = level.var_9a81036b waittill(#"hash_164072e3193b1685", #"hash_16406fe3193b116c", #"hash_164070e3193b131f", #"hash_16406de3193b0e06", #"hash_16406ee3193b0fb9", #"hash_7fd5f29cf67a2e57", #"scriptedanim");
		level scene::stop(level.var_9a81036b.current_scene);
		switch(s_waitresult._notify)
		{
			case "hash_164072e3193b1685":
			{
				level scene::play("aib_t9_zm_vign_cust_frbz_peck_vignette_02a", "out_of_dance_mark_1", level.var_96689f39);
				break;
			}
			case "hash_16406fe3193b116c":
			{
				level scene::play("aib_t9_zm_vign_cust_frbz_peck_vignette_02a", "out_of_dance_mark_2", level.var_96689f39);
				break;
			}
			case "hash_164070e3193b131f":
			{
				level scene::play("aib_t9_zm_vign_cust_frbz_peck_vignette_02a", "out_of_dance_mark_3", level.var_96689f39);
				break;
			}
			case "hash_16406de3193b0e06":
			{
				level scene::play("aib_t9_zm_vign_cust_frbz_peck_vignette_02a", "out_of_dance_mark_4", level.var_96689f39);
				break;
			}
			case "hash_16406ee3193b0fb9":
			{
				level scene::play("aib_t9_zm_vign_cust_frbz_peck_vignette_02a", "out_of_dance_mark_5", level.var_96689f39);
				break;
			}
			case "scriptedanim":
			case "hash_7fd5f29cf67a2e57":
			{
				break;
			}
		}
	}
	else
	{
		level.var_9a81036b waittill(#"hash_1f8db1f0505545cc");
	}
	level thread function_800a8361();
	level scene::stop(level.var_9a81036b.current_scene);
	level thread scene::play("aib_t9_zm_vign_cust_frbz_peck_vignette_02b", "out_of_dance", level.var_96689f39);
	level.var_c7e56d5b = 1;
	level waittill(#"hash_680f27749f11fc04");
	zm_utility::function_d729de6a(0, [0:#"zone_napalm_strike2"]);
}

/*
	Name: function_800a8361
	Namespace: namespace_af171776
	Checksum: 0x65B75493
	Offset: 0xE710
	Size: 0x4C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_800a8361()
{
	level.var_9a81036b waittill(#"hash_353ab3792c998a6e");
	level thread zm_vo::function_7622cb70(#"hash_58cdb464f3049973", undefined, undefined, undefined, 1);
}

/*
	Name: function_ae6e3aa4
	Namespace: namespace_af171776
	Checksum: 0xA2033E5B
	Offset: 0xE768
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function function_ae6e3aa4(e_player)
{
	self endon(#"death");
	while(true)
	{
		s_waitresult = undefined;
		s_waitresult = self waittill(#"trigger");
		level notify(#"hash_59def0fde5d07c3");
	}
}

/*
	Name: function_9dfccdca
	Namespace: namespace_af171776
	Checksum: 0xD1D339EA
	Offset: 0xE7D8
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function function_9dfccdca(str_notify)
{
	level.var_90655717 zm_unitrigger::unregister_unitrigger(level.var_90655717.s_unitrigger);
}

/*
	Name: function_9b0199c0
	Namespace: namespace_af171776
	Checksum: 0xD63F5CE1
	Offset: 0xE818
	Size: 0x184
	Parameters: 1
	Flags: Linked
*/
function function_9b0199c0(mdl_mts)
{
	level endon(#"end_game", #"hash_34b4fc2dc060acdd");
	mdl_mts endon(#"death");
	while(true)
	{
		var_8d4a23a5 = 0;
		foreach(player in function_a1ef346b())
		{
			if(player util::is_player_looking_at(mdl_mts.origin + vectorscale((0, 0, 1), 40), undefined, undefined, mdl_mts) && distancesquared(player.origin, mdl_mts.origin) <= 250000)
			{
				var_8d4a23a5 = 1;
			}
		}
		if(var_8d4a23a5 || level flag::get(#"hash_2aa7dafe13615e92"))
		{
			return;
		}
		waitframe(1);
	}
}

/*
	Name: function_b8091725
	Namespace: namespace_af171776
	Checksum: 0xBD05636D
	Offset: 0xE9A8
	Size: 0x16C
	Parameters: 1
	Flags: Linked
*/
function function_b8091725(mdl_mts)
{
	level.var_90655717 zm_unitrigger::unregister_unitrigger(level.var_90655717.s_unitrigger);
	if(is_true(level.var_c7e56d5b))
	{
		level waittill(#"hash_2569ea19c6752179");
		level scene::stop(level.var_9a81036b.current_scene);
	}
	level thread scene::play("aib_t9_zm_vign_cust_frbz_peck_vignette_02b", "drugged_seated_loop", level.var_96689f39);
	function_9b0199c0(mdl_mts);
	level scene::play("aib_t9_zm_vign_cust_frbz_peck_vignette_02b", "memory_transferance", level.var_96689f39);
	level thread scene::play("aib_t9_zm_vign_cust_frbz_peck_vignette_02b", "drugged_seated_loop", level.var_96689f39);
	level flag::set(#"hash_2651a51980ef57ee");
	level thread function_355a2ff4();
}

/*
	Name: function_355a2ff4
	Namespace: namespace_af171776
	Checksum: 0x3F33561
	Offset: 0xEB20
	Size: 0x374
	Parameters: 0
	Flags: Linked
*/
function function_355a2ff4()
{
	if(!isdefined(level.var_9a81036b))
	{
		return;
	}
	level endoncallback(&function_9dfccdca, #"hash_10f5c9ec28097208", #"hash_67560f7c31cd5e89");
	level.var_9a81036b endoncallback(&function_9dfccdca, #"death");
	level.var_90655717 zm_unitrigger::unregister_unitrigger(level.var_90655717.s_unitrigger);
	level.var_90655717 zm_unitrigger::function_fac87205(#"hash_8907bffd7ded28e", 100);
	level scene::play("aib_t9_zm_vign_cust_frbz_peck_vignette_02b", "martha_01", level.var_96689f39);
	level thread scene::play("aib_t9_zm_vign_cust_frbz_peck_vignette_02b", "drugged_seated_loop", level.var_96689f39);
	wait(5);
	level.var_90655717 zm_unitrigger::function_fac87205(#"hash_8907bffd7ded28e", 100);
	level scene::play("aib_t9_zm_vign_cust_frbz_peck_vignette_02b", "martha_02", level.var_96689f39);
	level thread scene::play("aib_t9_zm_vign_cust_frbz_peck_vignette_02b", "drugged_seated_loop", level.var_96689f39);
	wait(5);
	level.var_90655717 zm_unitrigger::function_fac87205(#"hash_8907bffd7ded28e", 100);
	level scene::play("aib_t9_zm_vign_cust_frbz_peck_vignette_02b", "martha_03", level.var_96689f39);
	level thread scene::play("aib_t9_zm_vign_cust_frbz_peck_vignette_02b", "drugged_seated_loop", level.var_96689f39);
	wait(5);
	level.var_90655717 zm_unitrigger::function_fac87205(#"hash_8907bffd7ded28e", 100);
	level scene::play("aib_t9_zm_vign_cust_frbz_peck_vignette_02b", "martha_04", level.var_96689f39);
	level thread scene::play("aib_t9_zm_vign_cust_frbz_peck_vignette_02b", "drugged_seated_loop", level.var_96689f39);
	wait(5);
	level.var_90655717 zm_unitrigger::function_fac87205(#"hash_8907bffd7ded28e", 100);
	level scene::play("aib_t9_zm_vign_cust_frbz_peck_vignette_02b", "martha_05", level.var_96689f39);
	level thread scene::play("aib_t9_zm_vign_cust_frbz_peck_vignette_02b", "drugged_seated_loop", level.var_96689f39);
}

/*
	Name: function_fe96e109
	Namespace: namespace_af171776
	Checksum: 0x455E2321
	Offset: 0xEEA0
	Size: 0x1F4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_fe96e109()
{
	level flag::wait_till_clear(#"hash_105197dc3cc8052e");
	level notify(#"hash_10f5c9ec28097208");
	zm_utility::function_d729de6a(1, [0:#"zone_napalm_strike2"]);
	level flag::set(#"dr_peck_mq_vignette_talking");
	level scene::stop(level.var_9a81036b.current_scene);
	level thread zm_vo::function_7622cb70(#"hash_45612c30b103dc90");
	level.var_9a81036b util::delay("close_window", undefined, &function_e47c39d0);
	level util::delay("start_ravenov_response_to_peck", "end_game", &function_c548adb3);
	level scene::play("aib_t9_zm_vign_cust_frbz_peck_vignette_03", level.var_96689f39);
	level thread scene::play("aib_t9_zm_vign_peck_seated_01", "seated_loop", level.var_96689f39);
	level flag::clear(#"dr_peck_mq_vignette_talking");
	zm_utility::function_d729de6a(0, [0:#"zone_napalm_strike2"]);
	level flag::wait_till(#"hash_8198df0de10d695");
}

/*
	Name: function_e47c39d0
	Namespace: namespace_af171776
	Checksum: 0x506A022F
	Offset: 0xF0A0
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function function_e47c39d0()
{
	level thread scene::play(#"p9_fxanim_zm_gold_shutters_peck_bundle", "close");
	level clientfield::set("" + #"hash_493518ca957daaea", 0);
}

/*
	Name: function_c548adb3
	Namespace: namespace_af171776
	Checksum: 0x798C818D
	Offset: 0xF108
	Size: 0xB4
	Parameters: 0
	Flags: Linked
*/
function function_c548adb3()
{
	level endon(#"end_game");
	level zm_vo::function_7622cb70(#"hash_4ff369eb03ad0d84", undefined, undefined, undefined, 1);
	level zm_vo::function_7622cb70(#"hash_26eb412ebe77f3ce", undefined, undefined, undefined, 1);
	level zm_vo::function_7622cb70(#"hash_2b9371a23fa25095", undefined, undefined, undefined, 1);
	level flag::set(#"hash_8198df0de10d695");
}

/*
	Name: function_51657aa2
	Namespace: namespace_af171776
	Checksum: 0xEE0F8741
	Offset: 0xF1C8
	Size: 0x12C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_51657aa2()
{
	self endon(#"death");
	self zm_vo::function_d6f8bbd9(#"hash_28031630dd82405e");
	self zm_vo::function_d6f8bbd9(#"hash_61b5e228663c9e19");
	self zm_vo::function_d6f8bbd9(#"hash_61b5e128663c9c66");
	self zm_vo::function_d6f8bbd9(#"hash_61b5e028663c9ab3");
	if(level flag::get_any([1:#"hash_18e72857cd13a082", 0:#"hash_18e72757cd139ecf"]))
	{
		level zm_vo::function_7622cb70(#"hash_4a415129c28a0999");
	}
	else
	{
		level zm_vo::function_7622cb70(#"hash_74ea84a7ad9d15e");
	}
}

/*
	Name: function_beff1fff
	Namespace: namespace_af171776
	Checksum: 0x4FE3A670
	Offset: 0xF300
	Size: 0x12C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_beff1fff()
{
	self endon(#"death");
	self zm_vo::function_d6f8bbd9(#"hash_28031630dd82405e");
	self zm_vo::function_d6f8bbd9(#"hash_33fe6da8c0f99ae1");
	self zm_vo::function_d6f8bbd9(#"hash_33fe6ca8c0f9992e");
	self zm_vo::function_d6f8bbd9(#"hash_33fe6ba8c0f9977b");
	if(level flag::get_any([1:#"hash_18e72857cd13a082", 0:#"hash_18e72757cd139ecf"]))
	{
		level zm_vo::function_7622cb70(#"hash_4a415129c28a0999");
	}
	else
	{
		level zm_vo::function_7622cb70(#"hash_74ea84a7ad9d15e");
	}
}

/*
	Name: function_f6853a4a
	Namespace: namespace_af171776
	Checksum: 0x4D1F5CBD
	Offset: 0xF438
	Size: 0xBC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_f6853a4a()
{
	self endon(#"death");
	self zm_vo::function_d6f8bbd9(#"hash_28031630dd82405e");
	self zm_vo::function_d6f8bbd9(#"hash_503d03606ee2c05");
	self zm_vo::function_d6f8bbd9(#"hash_503cf3606ee2a52");
	self zm_vo::function_d6f8bbd9(#"hash_503ce3606ee289f");
	level zm_vo::function_7622cb70(#"hash_1f4135a999b43530");
}

/*
	Name: function_af82e929
	Namespace: namespace_af171776
	Checksum: 0x41F822BA
	Offset: 0xF500
	Size: 0x58C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_af82e929()
{
	self endon(#"death");
	self zm_vo::function_d6f8bbd9(#"hash_28031630dd82405e");
	if(!isdefined(level.var_e4d84c8b))
	{
		level.var_e4d84c8b = array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9);
	}
	n_vo_index = array::random(level.var_e4d84c8b);
	arrayremovevalue(level.var_e4d84c8b, n_vo_index);
	if(!isdefined(n_vo_index))
	{
		self zm_vo::function_d6f8bbd9(#"hash_310a812f7f3f2e67");
		return;
	}
	switch(n_vo_index)
	{
		case 0:
		{
			self zm_vo::function_d6f8bbd9(#"hash_474701ffd753450e");
			self zm_vo::function_d6f8bbd9(#"hash_474702ffd75346c1");
			self zm_vo::function_d6f8bbd9(#"hash_4746ffffd75341a8");
			break;
		}
		case 1:
		{
			self zm_vo::function_d6f8bbd9(#"hash_70ceacb565d4be55");
			self zm_vo::function_d6f8bbd9(#"hash_70ceabb565d4bca2");
			break;
		}
		case 2:
		{
			self zm_vo::function_d6f8bbd9(#"hash_3c6a8e68efcecfad");
			self zm_vo::function_d6f8bbd9(#"hash_3c6a8d68efcecdfa");
			self zm_vo::function_d6f8bbd9(#"hash_3c6a8c68efcecc47");
			break;
		}
		case 3:
		{
			self zm_vo::function_d6f8bbd9(#"hash_4425dab807497793");
			self zm_vo::function_d6f8bbd9(#"hash_4425d9b8074975e0");
			self zm_vo::function_d6f8bbd9(#"hash_4425dcb807497af9");
			break;
		}
		case 4:
		{
			self zm_vo::function_d6f8bbd9(#"hash_70c624af23ce3360");
			self zm_vo::function_d6f8bbd9(#"hash_70c625af23ce3513");
			break;
		}
		case 5:
		{
			self zm_vo::function_d6f8bbd9(#"hash_18387167274f96a");
			self zm_vo::function_d6f8bbd9(#"hash_18388167274fb1d");
			self zm_vo::function_d6f8bbd9(#"hash_18385167274f604");
			break;
		}
		case 6:
		{
			self zm_vo::function_d6f8bbd9(#"hash_5ba6399f9b3f5b23");
			self zm_vo::function_d6f8bbd9(#"hash_5ba6389f9b3f5970");
			self zm_vo::function_d6f8bbd9(#"hash_5ba63b9f9b3f5e89");
			break;
		}
		case 7:
		{
			self zm_vo::function_d6f8bbd9(#"hash_3be13721b2904562");
			self zm_vo::function_d6f8bbd9(#"hash_3be13821b2904715");
			break;
		}
		case 8:
		{
			self zm_vo::function_d6f8bbd9(#"hash_74f71012004138b9");
			self zm_vo::function_d6f8bbd9(#"hash_74f70f1200413706");
			self zm_vo::function_d6f8bbd9(#"hash_74f70e1200413553");
			break;
		}
		case 9:
		{
			self zm_vo::function_d6f8bbd9(#"hash_5ee27fe28d88196");
			self zm_vo::function_d6f8bbd9(#"hash_5ee28fe28d88349");
			self zm_vo::function_d6f8bbd9(#"hash_5ee25fe28d87e30");
			break;
		}
		default:
		{
			return;
		}
	}
	level thread zm_vo::function_7622cb70(#"hash_14140a527d375876", undefined, 0);
}

/*
	Name: function_b9a3fa11
	Namespace: namespace_af171776
	Checksum: 0xE61D96AB
	Offset: 0xFA98
	Size: 0xC4
	Parameters: 3
	Flags: Linked
*/
function function_b9a3fa11(var_e0c6386f, var_40feefce, var_c4ad7aa9)
{
	switch(level.var_85422c0e)
	{
		case "strauss":
		{
			var_b3b54a4 = var_e0c6386f;
			break;
		}
		case "carver":
		{
			var_b3b54a4 = var_40feefce;
			break;
		}
		case "grey":
		{
			var_b3b54a4 = var_c4ad7aa9;
			break;
		}
		default:
		{
			break;
		}
	}
	level zm_vo::function_7622cb70(var_b3b54a4);
}

/*
	Name: devgui_setup
	Namespace: namespace_af171776
	Checksum: 0x7B3EF69F
	Offset: 0xFB68
	Size: 0x5C
	Parameters: 0
	Flags: None
*/
function devgui_setup()
{
	/#
		util::add_debug_command("");
		util::add_debug_command("");
		zm_devgui::add_custom_devgui_callback(&cmd);
	#/
}

/*
	Name: cmd
	Namespace: namespace_af171776
	Checksum: 0xEA311C7B
	Offset: 0xFBD0
	Size: 0x82
	Parameters: 1
	Flags: None
*/
function cmd(cmd)
{
	/#
		switch(cmd)
		{
			case "hash_75f15b2152e52f98":
			{
				function_a8a17d5d();
				break;
			}
			case "hash_58c7ce95895353b8":
			{
				function_47a17b36();
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
	Name: function_a8a17d5d
	Namespace: namespace_af171776
	Checksum: 0x5EBECF26
	Offset: 0xFC60
	Size: 0x104
	Parameters: 0
	Flags: None
*/
function function_a8a17d5d()
{
	/#
		var_62f885eb = getent("", "");
		satellite_fx_pos = struct::get("", "");
		if(!isdefined(var_62f885eb.fx_tag))
		{
			var_62f885eb.fx_tag = util::spawn_model("", satellite_fx_pos.origin, satellite_fx_pos.angles);
		}
		var_62f885eb.fx_tag clientfield::set("" + #"hash_6f292901e2fcaeb3", 0);
		wait(1);
		var_62f885eb.fx_tag clientfield::set("" + #"hash_6f292901e2fcaeb3", 1);
	#/
}

/*
	Name: function_47a17b36
	Namespace: namespace_af171776
	Checksum: 0xB5C52927
	Offset: 0xFD70
	Size: 0x84
	Parameters: 0
	Flags: None
*/
function function_47a17b36()
{
	/#
		var_62f885eb = getent("", "");
		if(isdefined(var_62f885eb) && isdefined(var_62f885eb.fx_tag))
		{
			var_62f885eb.fx_tag clientfield::set("" + #"hash_6f292901e2fcaeb3", 0);
		}
	#/
}

