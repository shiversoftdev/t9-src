#using scripts\zm_common\zm_fasttravel.gsc;
#using scripts\zm_common\ai\zm_ai_utility.gsc;
#using scripts\zm_common\zm_blockers.gsc;
#using scripts\zm_common\zm_round_logic.gsc;
#using script_3411bb48d41bd3b;
#using script_3cf7932e9702e270;
#using scripts\zm\zm_silver_util.gsc;
#using scripts\zm\zm_silver.gsc;
#using script_4d1e366b77f0b4b;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\zm_common\zm_ui_inventory.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_vo.gsc;
#using scripts\zm_common\zm_player.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_sq.gsc;
#using script_4421226bbc54b398;
#using script_b9d273dc917ee1f;
#using scripts\zm_common\zm_items.gsc;
#using scripts\zm_common\zm_equipment.gsc;
#using scripts\zm_common\zm_crafting.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using script_7b1cd3908a825fdd;
#using script_1029986e2bc8ca8e;
#using scripts\core_common\ai_shared.gsc;
#using script_36f4be19da8eb6d0;
#using scripts\core_common\popups_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using script_7bacb32f8222fa3e;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\music_shared.gsc;
#using script_7fc996fe8678852;
#using script_92d4d637814fefa;
#using script_113dd7f0ea2a1d4f;

#namespace namespace_d769652e;

/*
	Name: init
	Namespace: namespace_d769652e
	Checksum: 0xA6FF126
	Offset: 0x1760
	Size: 0x9DC
	Parameters: 0
	Flags: Linked
*/
function init()
{
	function_f4ac09f8();
	table = getent("zm_mid_table", "targetname");
	if(isdefined(table))
	{
		table function_619a5c20();
	}
	if(!zm_utility::is_ee_enabled())
	{
		return;
	}
	level.var_465f425d = getent("ent_prf", "script_noteworthy");
	v_pos = level.var_465f425d gettagorigin("tag_origin");
	v_ang = level.var_465f425d gettagangles("tag_origin");
	level.var_5e8ab0 = util::spawn_model("p9_zm_ndu_purifier_tank01", v_pos, v_ang);
	level.var_e25a63e = util::spawn_model("p9_zm_ndu_purifier_tank02", v_pos, v_ang);
	level.var_39acfd4c = util::spawn_model("p9_zm_ndu_purifier_tank03", v_pos, v_ang);
	level.var_c77198d7 = util::spawn_model("p9_zm_ndu_purifier_tank04", v_pos, v_ang);
	init_steps();
	level.var_3034d7b8 = &function_d5d67561;
	callback::on_item_pickup(&on_item_pickup);
	callback::on_spawned(&on_player_spawned);
	level callback::on_actor_killed(&function_17468758);
	level.var_fc5dfa9 = gettime();
	level.var_a36cb684 = gettime();
	level.var_c7557d2f = gettime();
	level.var_46a47223 = [];
	level.var_c8dda611 = [];
	level.var_41a245ae = [];
	level.var_90f0a494 = [];
	level.var_cc18747e = 0;
	level.var_6084dd15 = 0;
	level.var_581a776e = 0;
	level.var_bf3f1109 = 0;
	level.var_3738589 = 0;
	level.var_b3d5a24f = 0;
	level.var_e2d64235 = [];
	level.var_b59d1162 = [];
	level.var_e8ed599 = 0.5;
	level.var_82947ea7 = 0;
	level.var_3df02306 = undefined;
	level.var_e0712ded = [];
	level.var_24de243e = [];
	clientfield::register("scriptmover", "" + #"hash_8358a32177aa60e", 1, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_654274a0648df21d", 1, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_6dc2bf4e960f0495", 1, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_77df0b1fb17c3a18", 1, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_17ea9211637fa6cf", 1, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_2f17676fe2c8e396", 1, 1, "int");
	clientfield::register("toplayer", "" + #"hash_3f49ce049c9da7d", 1, 1, "int");
	clientfield::register("toplayer", "" + #"hash_404a977ff0098cf", 1, 1, "counter");
	clientfield::register("toplayer", "" + #"hash_3cc984f9a32f1508", 1, 1, "int");
	clientfield::register("toplayer", "" + #"hash_41658211f38c2b02", 1, 1, "int");
	clientfield::register("world", "" + #"hash_5c2cc65ae866b3f4", 1, 1, "int");
	clientfield::register("world", "" + #"hash_48df238a087c684e", 1, 1, "int");
	clientfield::register("world", "" + #"hash_17466a1bb2380af6", 1, getminbitcountfornum(4), "int");
	clientfield::register("world", "" + #"hash_6f13307bc53f2de5", 1, 1, "int");
	clientfield::register("world", "" + #"hash_570bb58b50e9db2e", 1, 1, "int");
	clientfield::register("world", "" + #"hash_718b0f4fd6db0bb4", 1, 1, "int");
	clientfield::register("world", "" + #"hash_575a337754ccd980", 1, 1, "int");
	clientfield::register("world", "" + #"hash_3fd05810b220d13a", 1, 1, "int");
	scene::add_scene_func("aib_t9_zm_silver_echo_1_vogel_01", &function_332ca53e, "done", #"done_echo_scene_vogel_01");
	scene::add_scene_func("aib_t9_zm_silver_echo_2_vogel_01", &function_332ca53e, "done", #"done_echo_scene_vogel_02");
	scene::add_scene_func("aib_t9_zm_silver_echo_3_vogel_01", &function_332ca53e, "done", #"done_echo_scene_vogel_03");
	scene::add_scene_func("aib_t9_zm_silver_secretecho_2_lastsoldier_01", &function_299c9b7f, "done");
	scene::add_scene_func("aib_t9_zm_silver_secretecho_1_kurtzandvogel_01", &function_acc98467, "done");
	scene::add_scene_func("aib_t9_zm_silver_secretecho_3_dmitriyev_kalashnik_01_throw", &function_2214bfa4, "done");
	scene::add_scene_func("aib_t9_zm_silver_secretecho_4_orlovandmedved", &function_e920684, "done");
	scene::add_scene_func("aib_t9_zm_silver_secretecho_5_valentinaandpeck", &function_68fb1270, "done");
	scene::add_scene_func("aib_t9_zm_silver_echo_5_orlov_01", &function_4afbb1fa, "done");
	scene::add_scene_func("aib_t9_zm_silver_echo_4_dmitriyev_kalashnik_01", &function_fc0ced31, "done");
	level thread function_3f559b17();
	level thread function_58ce052e(0);
}

/*
	Name: function_f4ac09f8
	Namespace: namespace_d769652e
	Checksum: 0xD539E74E
	Offset: 0x2148
	Size: 0x10C
	Parameters: 0
	Flags: Linked
*/
function function_f4ac09f8()
{
	var_f04dd3ef = getentarray("exfil_aether_clip", "targetname");
	foreach(e_clip in var_f04dd3ef)
	{
		e_clip notsolid();
		e_clip connectpaths();
	}
	level thread scene::init(#"hash_1da91e1000776d72");
	level thread scene::init(#"hash_60241ccceaf44d2a");
}

/*
	Name: init_steps
	Namespace: namespace_d769652e
	Checksum: 0x8C3BE421
	Offset: 0x2260
	Size: 0x40C
	Parameters: 0
	Flags: Linked
*/
function init_steps()
{
	level zm_sq::register(#"main_quest", #"hash_31615b8387c7fe75", #"hash_31615b8387c7fe75", &function_5c9f6aa5, &function_d280572e);
	level zm_sq::register(#"main_quest", #"hash_1e814d4b4714c618", #"hash_1e814d4b4714c618", &function_f8065ad8, &function_bdfb3840);
	level zm_sq::register(#"main_quest", #"hash_61ed135b2872c893", #"hash_61ed135b2872c893", &function_6e538fed, &function_2bc04c1);
	level zm_sq::register(#"main_quest", #"hash_92c2f3cbebbdf63", #"hash_92c2f3cbebbdf63", &function_7d5e3785, &function_3520ea1b);
	var_767ca252 = getent("vol_trap_zone", "script_noteworthy");
	level zm_sq::register(#"main_quest", #"hash_3d0833fa6be461ba", #"hash_3d0833fa6be461ba", &function_ea72075c, &function_9c7d7ce3);
	level zm_sq::register(#"main_quest", #"hash_a9a2facc1258eb5", #"hash_a9a2facc1258eb5", &function_54ad1c95, &function_afbc77b5);
	level zm_sq::register(#"main_quest", #"hash_76f226ea4b16acdf", #"hash_76f226ea4b16acdf", &function_cb0e55f0, &function_70ffca9c);
	level zm_sq::register(#"main_quest", #"hash_4bb113a34a5e1d91", #"hash_4bb113a34a5e1d91", &function_1bddc36a, &function_d5e55496);
	level zm_sq::register(#"main_quest", #"defend", #"defend", &function_34c29791, &function_d7ef969f);
	level zm_sq::register(#"main_quest", #"hash_48ee9c10dd3affe2", #"hash_48ee9c10dd3affe2", &function_852146cc, &function_e3bd1289, 1);
	level thread function_5f94604c();
}

/*
	Name: function_7a4e3128
	Namespace: namespace_d769652e
	Checksum: 0x3068520E
	Offset: 0x2678
	Size: 0x106
	Parameters: 1
	Flags: Private
*/
function private function_7a4e3128(var_77f5a825)
{
	/#
		if(!getdvarint(#"zm_debug_ee", 0))
		{
			return;
		}
		self notify(#"hash_706c332950c29a");
		self endon(#"death", #"trigger_activated", #"hash_706c332950c29a");
		if(isdefined(var_77f5a825))
		{
			level endon(var_77f5a825);
		}
		while(true)
		{
			print3d(self.origin, (isdefined(self.targetname) ? self.targetname : ""), (1, 1, 0));
			circle(self.origin, 50, (1, 0, 0));
			waitframe(1);
		}
	#/
}

/*
	Name: function_5f94604c
	Namespace: namespace_d769652e
	Checksum: 0xBE56F481
	Offset: 0x2788
	Size: 0x5C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_5f94604c()
{
	level flag::wait_till(#"pap_quest_completed");
	level thread function_42da022b();
	level zm_sq::start(#"main_quest");
}

/*
	Name: function_5c9f6aa5
	Namespace: namespace_d769652e
	Checksum: 0x5293EF22
	Offset: 0x27F0
	Size: 0x8C
	Parameters: 1
	Flags: Linked
*/
function function_5c9f6aa5(b_skipped)
{
	if(!b_skipped)
	{
		zm_crafting::function_d1f16587("ztable_silver_aetherscope", &aetherscope_assembled);
		level thread function_16b7f990();
		level notify(#"hash_64a65262c4492d98");
		level flag::wait_till(#"hash_6aad5c2eec44c8a0");
	}
}

/*
	Name: function_16b7f990
	Namespace: namespace_d769652e
	Checksum: 0x10A52D2B
	Offset: 0x2888
	Size: 0x93C
	Parameters: 0
	Flags: Linked
*/
function function_16b7f990()
{
	level endon(#"end_game", #"hash_6aad5c2eec44c8a0");
	level flag::set("on_mq_step_0_2");
	level flag::wait_till_clear(#"dark_aether_active");
	var_32b1f567 = struct::get_array("zm_ptl_scope", "targetname");
	level.var_44aa636e = getent("zm_mid_table", "targetname");
	level childthread function_b2f3498a();
	var_7588c69f = 0;
	var_952641e5 = 0;
	var_2d4fbfe0 = undefined;
	var_9463599a = undefined;
	while(true)
	{
		if(var_32b1f567.size == 0)
		{
			level.var_ba3a0e1f = 0;
			var_f29ccbc4 = getentarray("crafting_trigger", "targetname");
			if(isdefined(var_f29ccbc4))
			{
				array::run_all(var_f29ccbc4, &setinvisibletoall);
			}
			level flag::wait_till_clear(#"dark_aether_active");
			if(isdefined(var_f29ccbc4))
			{
				array::run_all(var_f29ccbc4, &setvisibletoall);
			}
			break;
		}
		if(!isdefined(var_2d4fbfe0))
		{
			var_2d4fbfe0 = var_32b1f567[randomint(var_32b1f567.size)];
		}
		if(!level flag::get(#"dark_aether_active"))
		{
			if(var_2d4fbfe0 flag::get(#"hash_7a42d508140ae262"))
			{
				level flag::wait_till(#"hash_4d6700553ede7078");
			}
			var_f2484ed9 = util::spawn_model("tag_origin", var_2d4fbfe0.origin);
			var_f2484ed9 clientfield::set("" + #"hash_7ec80a02e9bb051a", 1);
			var_2d4fbfe0 function_19986231();
			if(!isdefined(level.var_83de12b4))
			{
				level.var_83de12b4 = [];
			}
			else if(!isarray(level.var_83de12b4))
			{
				level.var_83de12b4 = array(level.var_83de12b4);
			}
			level.var_83de12b4[level.var_83de12b4.size] = var_f2484ed9;
			/#
				var_f2484ed9 thread function_7a4e3128(#"hash_2dd625fe64fe0cd3");
			#/
			if(!isdefined(var_9463599a))
			{
				var_9463599a = var_f2484ed9 namespace_2b924e50::function_3be9e71a();
			}
			var_f2484ed9 function_58e278a1();
			waitresult = undefined;
			waitresult = level waittill(#"dark_tear_activated", #"into_the_dark_side");
			if(waitresult._notify == "dark_tear_activated")
			{
				var_2d4fbfe0 flag::set(#"hash_7a42d508140ae262");
				level notify(#"into_the_dark_side", var_7588c69f);
				level flag::set(#"hash_314875ee06541bf1");
			}
			var_f2484ed9.mdl_gameobject thread namespace_2b924e50::function_1194b9bc();
			level flag::wait_till(#"dark_aether_active");
			if(isdefined(var_9463599a))
			{
				var_9463599a delete();
			}
			var_f2484ed9 clientfield::set("" + #"hash_7ec80a02e9bb051a", 0);
			var_f2484ed9 delete();
			if(!var_2d4fbfe0 flag::get(#"hash_7a42d508140ae262"))
			{
				wait(1);
				continue;
			}
		}
		level flag::wait_till(#"dark_aether_active");
		if(!level flag::get(#"hash_314875ee06541bf1"))
		{
			wait(1);
			continue;
		}
		showmiscmodels(var_2d4fbfe0.var_96dbe9c2);
		var_f6425d8c = struct::get(var_2d4fbfe0.target2, "targetname");
		point = function_4ba8fde(var_f6425d8c.itemname);
		mdl_part = item_drop::drop_item(0, undefined, 1, 0, point.id, var_f6425d8c.origin, var_f6425d8c.angles, 0);
		/#
			mdl_part thread function_7a4e3128(#"hash_2dd625fe64fe0cd3");
		#/
		waitresult = undefined;
		waitresult = level waittill(#"manage_to_find_aetherscope_part", #"dark_aether_active");
		if(waitresult._notify === "manage_to_find_aetherscope_part")
		{
			waitresult.player thread function_829dde5f();
			zm_items::player_pick_up(waitresult.player, zm_crafting::get_component(var_2d4fbfe0.var_813c4285));
			hidemiscmodels(var_2d4fbfe0.var_96dbe9c2);
			showmiscmodels(level.var_44aa636e.var_96dbe9c2);
			var_7588c69f = 1;
			if(!var_952641e5)
			{
				var_952641e5 = 1;
			}
			arrayremovevalue(var_32b1f567, var_2d4fbfe0);
			var_2d4fbfe0 = undefined;
			var_9f928cb9 = util::spawn_model(var_f6425d8c.model, struct::get(var_f6425d8c.target, "targetname").origin, struct::get(var_f6425d8c.target, "targetname").angles);
			var_9f928cb9 thread function_6e288d90();
		}
		else
		{
			if(isdefined(mdl_part))
			{
				mdl_part delete();
			}
			level flag::clear(#"hash_314875ee06541bf1");
		}
	}
	level flag::wait_till("aetherscope_assembled");
	point = function_4ba8fde("item_zmintel_silver_requiem_artifact_3");
	var_9d20261b = item_drop::drop_item(0, undefined, 1, 0, point.id, struct::get("zm_mid_scope").origin, struct::get("zm_mid_scope").angles, 0);
	var_9d20261b.var_dd21aec2 = 1 | 16;
	level flag::wait_till("aetherscope_collected");
	/#
		iprintlnbold("");
	#/
	level function_a3de347d();
	level flag::set(#"hash_6aad5c2eec44c8a0");
}

/*
	Name: function_829dde5f
	Namespace: namespace_d769652e
	Checksum: 0x6D1D576E
	Offset: 0x31D0
	Size: 0x10C
	Parameters: 0
	Flags: Linked
*/
function function_829dde5f()
{
	zone_name = self.zone_name;
	level flag::clear("spawn_zombies");
	dog_count = 4 + (getplayers().size * 2);
	if(isdefined(level.var_e2aef122))
	{
		level.var_e2aef122 = level.var_e2aef122 + dog_count;
	}
	while(dog_count > 0)
	{
		ai = function_cce73165("dog_location", #"hash_12a17ab3df5889eb", zone_name);
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
	Name: function_58e278a1
	Namespace: namespace_d769652e
	Checksum: 0xFD719A39
	Offset: 0x32E8
	Size: 0x162
	Parameters: 1
	Flags: Linked
*/
function function_58e278a1(t_override)
{
	if(!isdefined(t_override))
	{
		t_override = undefined;
	}
	if(!isdefined(self.mdl_gameobject))
	{
		self.require_look_at = 1;
		self gameobjects::init_game_objects(#"hash_76653e6fda4bdfd1", undefined, undefined, t_override);
		self.mdl_gameobject gameobjects::allow_use(#"hash_5ccfd7bbbf07c770");
		self.mdl_gameobject gameobjects::set_onuse_event(&function_bd02699e);
		self.mdl_gameobject gameobjects::set_onbeginuse_event(&namespace_2b924e50::function_e6830825);
		self.mdl_gameobject gameobjects::set_onenduse_event(&namespace_2b924e50::function_834fd6bc);
		self.mdl_gameobject.trigger thread function_cf1b6a29();
		self.mdl_gameobject.dontlinkplayertotrigger = 1;
		self.mdl_gameobject.keepweapon = 1;
		self.mdl_gameobject.canuseobject = &namespace_2b924e50::function_dd9482b7;
	}
}

/*
	Name: function_cf1b6a29
	Namespace: namespace_d769652e
	Checksum: 0x7EAB19E3
	Offset: 0x3458
	Size: 0x14A
	Parameters: 0
	Flags: Linked
*/
function function_cf1b6a29()
{
	self endon(#"death");
	while(isdefined(self))
	{
		foreach(player in function_a1ef346b())
		{
			self setcursorhint("HINT_NOICON");
			self usetriggerignoreuseholdtime();
			self function_268e4500();
			b_enabled = self function_2a90006d(player);
			if(b_enabled)
			{
				self setvisibletoplayer(player);
				continue;
			}
			self setinvisibletoplayer(player);
		}
		wait(1);
	}
}

/*
	Name: function_2a90006d
	Namespace: namespace_d769652e
	Checksum: 0xB218C856
	Offset: 0x35B0
	Size: 0xF6
	Parameters: 1
	Flags: Linked
*/
function function_2a90006d(e_player)
{
	if(level flag::get(#"hash_3e765c26047c9f54") || level flag::get("in_exfil_event"))
	{
		self sethintstringforplayer(e_player, #"hash_4480b689c4039dac");
		return true;
	}
	if(!e_player usebuttonpressed())
	{
		self sethintstringforplayer(e_player, #"hash_622731cfc9a72bfa");
		return true;
	}
	self sethintstringforplayer(e_player, #"");
	return false;
}

/*
	Name: function_bd02699e
	Namespace: namespace_d769652e
	Checksum: 0xFB55BE39
	Offset: 0x36B0
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function function_bd02699e(player)
{
	self notify(#"hash_2330fdbe6e3eb567");
	level notify(#"dark_tear_activated");
	self thread namespace_2b924e50::function_cc15b58a();
}

/*
	Name: function_97000481
	Namespace: namespace_d769652e
	Checksum: 0xB4E407A1
	Offset: 0x3700
	Size: 0x128
	Parameters: 0
	Flags: None
*/
function function_97000481()
{
	self endon(#"death");
	while(isdefined(self))
	{
		waitresult = undefined;
		waitresult = self waittill(#"trigger");
		e_player = waitresult.activator;
		if(!zm_utility::can_use(e_player))
		{
			continue;
		}
		if(isplayer(e_player))
		{
			e_player clientfield::increment_to_player("" + #"hash_6696d96a08b9701d");
		}
		level notify(#"dark_tear_activated");
		if(isdefined(self.stub) && isdefined(self.stub.related_parent))
		{
			self.stub.related_parent notify(#"trigger_activated", {#e_who:e_player});
		}
	}
}

/*
	Name: function_b2f3498a
	Namespace: namespace_d769652e
	Checksum: 0xDBD527BA
	Offset: 0x3830
	Size: 0x130
	Parameters: 0
	Flags: Linked
*/
function function_b2f3498a()
{
	while(!level flag::get("aetherscope_assembled"))
	{
		waitresult = undefined;
		waitresult = level waittill(#"crafting_started");
		level thread scene::play("p9_fxanim_zm_gp_crafting_variant_bundle", level.var_44aa636e);
		e_crafter = waitresult.activator;
		e_crafter clientfield::set_to_player("" + #"hash_3f49ce049c9da7d", 1);
		waitresult.unitrigger waittill(#"hash_6db03c91467a21f5");
		level thread scene::stop("p9_fxanim_zm_gp_crafting_variant_bundle");
		if(isdefined(e_crafter))
		{
			e_crafter clientfield::set_to_player("" + #"hash_3f49ce049c9da7d", 0);
		}
	}
}

/*
	Name: aetherscope_assembled
	Namespace: namespace_d769652e
	Checksum: 0xCD1A153
	Offset: 0x3968
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function aetherscope_assembled(e_crafter)
{
	/#
		iprintlnbold("");
	#/
	hidemiscmodels(level.var_44aa636e.var_96dbe9c2);
	level flag::set("aetherscope_assembled");
}

/*
	Name: function_6e288d90
	Namespace: namespace_d769652e
	Checksum: 0x13A436E
	Offset: 0x39E0
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_6e288d90()
{
	level endon(#"end_game");
	level waittill(#"aetherscope_assembled");
	self delete();
}

/*
	Name: function_a3de347d
	Namespace: namespace_d769652e
	Checksum: 0x14C42317
	Offset: 0x3A38
	Size: 0x14
	Parameters: 0
	Flags: Linked
*/
function function_a3de347d()
{
	namespace_2b924e50::function_8fbe908e();
}

/*
	Name: function_d280572e
	Namespace: namespace_d769652e
	Checksum: 0x278FC399
	Offset: 0x3A58
	Size: 0xE4
	Parameters: 2
	Flags: Linked
*/
function function_d280572e(b_skipped, var_19e802fa)
{
	if(b_skipped || var_19e802fa)
	{
		if(isarray(level.var_83de12b4))
		{
			arrayremovevalue(level.var_83de12b4, undefined);
			array::run_all(level.var_83de12b4, &delete);
		}
		level flag::set("aetherscope_collected");
		level flag::set(#"hash_6aad5c2eec44c8a0");
		level function_a3de347d();
	}
}

/*
	Name: function_f8065ad8
	Namespace: namespace_d769652e
	Checksum: 0x7BE19505
	Offset: 0x3B48
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function function_f8065ad8(b_skipped)
{
	if(!b_skipped)
	{
		level thread function_6498e65c();
		level notify(#"hash_360f9258b1f19bcb");
		level flag::wait_till(#"init_purifier_finished");
	}
}

/*
	Name: function_3f559b17
	Namespace: namespace_d769652e
	Checksum: 0x787756D5
	Offset: 0x3BB8
	Size: 0xF0
	Parameters: 0
	Flags: Linked
*/
function function_3f559b17()
{
	level endon(#"end_game", #"hash_737db8433b93b7ae", #"init_purifier_finished");
	level.var_3bc06d8a = getent("zm_re_com", "script_noteworthy");
	while(true)
	{
		level thread function_e1352bc9();
		level flag::wait_till(#"dark_aether_active");
		level.var_3bc06d8a zm_unitrigger::unregister_unitrigger(level.var_3bc06d8a.s_unitrigger);
		level flag::wait_till_clear(#"dark_aether_active");
	}
}

/*
	Name: function_e1352bc9
	Namespace: namespace_d769652e
	Checksum: 0x17EBFA6C
	Offset: 0x3CB0
	Size: 0x240
	Parameters: 0
	Flags: Linked
*/
function function_e1352bc9()
{
	level endon(#"end_game", #"hash_737db8433b93b7ae", #"dark_aether_active");
	while(true)
	{
		level.var_3bc06d8a zm_unitrigger::unregister_unitrigger(level.var_3bc06d8a.s_unitrigger);
		level.var_3bc06d8a zm_unitrigger::create(#"hash_597a0ba4f4b5aa8", 48, &function_ce94e1d2);
		level.var_3bc06d8a.s_unitrigger.origin = level.var_3bc06d8a.s_unitrigger.origin + vectorscale((0, 1, 0), 24);
		level.var_3bc06d8a waittill(#"trigger_activated");
		level.var_3bc06d8a zm_unitrigger::unregister_unitrigger(level.var_3bc06d8a.s_unitrigger);
		level.var_3bc06d8a.s_unitrigger = undefined;
		if(!is_true(level.var_b46e7e38))
		{
			level.var_b46e7e38 = 1;
			level.var_3bc06d8a playsound(#"hash_98bcba1225bfa3");
			level.var_3bc06d8a zm_vo::function_d6f8bbd9(#"hash_1dafefe0169ec35e");
			level.var_3bc06d8a zm_vo::function_d6f8bbd9(#"hash_27b891a644e4399");
		}
		else
		{
			level.var_3bc06d8a playsound(#"hash_1b8526005ad2bb44");
			level.var_3bc06d8a zm_vo::function_d6f8bbd9(#"hash_2499b044fab62925");
		}
	}
}

/*
	Name: function_6498e65c
	Namespace: namespace_d769652e
	Checksum: 0x792D5CDB
	Offset: 0x3EF8
	Size: 0x5E4
	Parameters: 0
	Flags: Linked
*/
function function_6498e65c()
{
	level endon(#"init_purifier_finished");
	level flag::wait_till_clear("in_dark_side");
	level flag::set(#"hash_2aecb7319e5a0d11");
	level thread function_34a1157d("aib_t9_zm_silver_secretecho_2_lastsoldier_01", "scn_lastsoldier", "zone_proto_interior_lower", "init_purifier_finished", "done_echo_scene_lastsoldier");
	level thread function_34a1157d("aib_t9_zm_silver_secretecho_1_kurtzandvogel_01", "echo_scene_kurtzandvogel", "zone_center_upper_north", "init_purifier_finished", "done_echo_scene_kurtzandvogel");
	var_617f86a3 = struct::get("control_room_tear", "script_noteworthy");
	level thread function_a3d3d7c2(var_617f86a3);
	function_7b6e6199();
	hidemiscmodels(var_617f86a3.var_96dbe9c2);
	/#
		level.var_3bc06d8a thread function_7a4e3128(#"hash_1a730a397ac55112");
	#/
	level.var_3bc06d8a function_619a5c20();
	level.var_3bc06d8a zm_unitrigger::unregister_unitrigger(level.var_3bc06d8a.s_unitrigger);
	level.var_3bc06d8a zm_unitrigger::create(&function_f67c8bbb, 48, &function_ce94e1d2);
	level.var_3bc06d8a.s_unitrigger.origin = level.var_3bc06d8a.s_unitrigger.origin + vectorscale((0, 1, 0), 24);
	level.var_3bc06d8a waittill(#"trigger_activated");
	level.var_3bc06d8a function_23a29590();
	level.var_3bc06d8a zm_unitrigger::unregister_unitrigger(level.var_3bc06d8a.s_unitrigger);
	level.var_3bc06d8a.s_unitrigger = undefined;
	/#
		iprintlnbold("");
	#/
	if(isdefined(level.var_6c682532))
	{
		level.var_6c682532 delete();
	}
	level.var_7c6e836b = util::spawn_model(#"hash_23c2423afaccc4e5", level.var_b2371398.origin, level.var_b2371398.angles);
	level.var_3a734155 = util::spawn_model(#"hash_2a7c99f5ca0f1bbd", level.var_b2371398.origin, level.var_b2371398.angles);
	level.var_7c6e836b playsound(#"hash_98bcba1225bfa3");
	wait(1);
	if(isdefined(level.var_3a734155))
	{
		level.var_3a734155 delete();
	}
	level.var_fc67035a = util::spawn_model(#"hash_23c2493afaccd0ca", level.var_b2371398.origin, level.var_b2371398.angles);
	level.var_50356cd9 = util::spawn_model(#"hash_2a7c98f5ca0f1a0a", level.var_b2371398.origin, level.var_b2371398.angles);
	level.var_fc67035a playsound(#"hash_98bcba1225bfa3");
	wait(1);
	if(isdefined(level.var_50356cd9))
	{
		level.var_50356cd9 delete();
	}
	level.var_729c7023 = util::spawn_model(#"hash_23c24b3afaccd430", level.var_b2371398.origin, level.var_b2371398.angles);
	level.var_729c7023 playsound(#"hash_425afc32b2eb6c0c");
	wait(1);
	var_465f425d = getent("ent_prf", "script_noteworthy");
	var_465f425d clientfield::set("" + #"hash_77df0b1fb17c3a18", 1);
	level.var_3bc06d8a zm_vo::function_d6f8bbd9(#"hash_27bba296634d1ae1");
	level notify(#"hash_222af38f51671594");
	level flag::set(#"init_purifier_finished");
}

/*
	Name: function_f67c8bbb
	Namespace: namespace_d769652e
	Checksum: 0x40E7845F
	Offset: 0x44E8
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function function_f67c8bbb(e_player)
{
	if(!level flag::get(#"dark_aether_active"))
	{
		self sethintstring(#"hash_2a4e3990e91343b9");
		return true;
	}
	return false;
}

/*
	Name: function_51cc09e
	Namespace: namespace_d769652e
	Checksum: 0xD19482F
	Offset: 0x4548
	Size: 0xC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_51cc09e(var_f2484ed9)
{
}

/*
	Name: function_a3d3d7c2
	Namespace: namespace_d769652e
	Checksum: 0xA16B5F4F
	Offset: 0x4690
	Size: 0x7F4
	Parameters: 1
	Flags: Linked
*/
function function_a3d3d7c2(var_a3496a80)
{
	level endon(#"end_game");
	tear = util::spawn_model("tag_origin", var_a3496a80.origin);
	var_ff8e8b10 = getent("zm_note_left", "script_noteworthy");
	var_5297399c = util::spawn_model("p9_zm_ndu_blank_book_a", var_ff8e8b10.origin, var_ff8e8b10.angles);
	var_5297399c hide();
	var_d27db96b = util::spawn_model("p9_zm_ndu_blank_book_h", var_ff8e8b10.origin, var_ff8e8b10.angles);
	var_d27db96b hide();
	var_8ab5297b = util::spawn_model("p9_zm_ndu_blank_book_v", var_ff8e8b10.origin, var_ff8e8b10.angles);
	var_8ab5297b hide();
	level thread function_51cc09e(tear);
	var_9463599a = undefined;
	while(!level flag::get(#"hash_737db8433b93b7ae"))
	{
		if(tear flag::get(#"hash_7a42d508140ae262"))
		{
			level flag::wait_till(#"hash_4d6700553ede7078");
		}
		tear clientfield::set("" + #"hash_7ec80a02e9bb051a", 1);
		/#
			tear thread function_7a4e3128(#"hash_1a730a397ac55112");
		#/
		tear function_19986231();
		if(!isdefined(var_9463599a))
		{
			var_9463599a = tear namespace_2b924e50::function_3be9e71a();
		}
		t_override = spawn("trigger_radius_use", tear.origin + vectorscale((0, 0, 1), 48), 0, 96, 48, 1);
		t_override usetriggerrequirelookat(1);
		tear function_58e278a1(t_override);
		waitresult = undefined;
		waitresult = level waittill(#"dark_tear_activated", #"into_the_dark_side");
		if(waitresult._notify == "into_the_dark_side")
		{
			tear.mdl_gameobject thread namespace_2b924e50::function_1194b9bc();
			if(isdefined(t_override))
			{
				t_override delete();
			}
			level flag::wait_till(#"dark_aether_active");
			if(isdefined(var_9463599a))
			{
				var_9463599a delete();
			}
			tear clientfield::set("" + #"hash_7ec80a02e9bb051a", 0);
			level flag::wait_till_clear(#"dark_aether_active");
			continue;
		}
		tear.mdl_gameobject thread namespace_2b924e50::function_1194b9bc();
		if(isdefined(t_override))
		{
			t_override delete();
		}
		level notify(#"into_the_dark_side");
		level flag::set(#"hash_4fa1234f7156acb5");
		level flag::wait_till(#"dark_aether_active");
		tear flag::set(#"hash_7a42d508140ae262");
		if(isdefined(var_9463599a))
		{
			var_9463599a delete();
		}
		tear clientfield::set("" + #"hash_7ec80a02e9bb051a", 0);
		showmiscmodels(var_a3496a80.var_96dbe9c2);
		var_ff8e8b10 hide();
		var_5297399c hide();
		var_d27db96b hide();
		if(!level flag::get("someone_has_notebook"))
		{
			point = function_4ba8fde("item_zmintel_silver_requiem_artifact_4");
			var_59a8717 = item_drop::drop_item(0, undefined, 1, 0, point.id, struct::get("zm_re_note", "script_noteworthy").origin, struct::get("zm_re_note", "script_noteworthy").angles, 0);
			var_59a8717.var_dd21aec2 = 1 | 16;
			/#
				var_59a8717 thread function_7a4e3128(#"hash_1a730a397ac55112");
			#/
		}
		level flag::wait_till_clear(#"dark_aether_active");
		level flag::clear(#"hash_4fa1234f7156acb5");
		if(isdefined(var_59a8717))
		{
			var_59a8717 delete();
		}
		var_ff8e8b10 show();
		if(level flag::get("collect_letter_h"))
		{
			var_5297399c show();
			var_d27db96b show();
		}
		else if(level flag::get("collect_letter_a"))
		{
			var_5297399c show();
		}
	}
	level flag::wait_till_clear(#"dark_aether_active");
	var_ff8e8b10 show();
	var_5297399c show();
	var_d27db96b show();
	var_8ab5297b show();
}

/*
	Name: function_7b6e6199
	Namespace: namespace_d769652e
	Checksum: 0x3D34887C
	Offset: 0x4E90
	Size: 0x310
	Parameters: 0
	Flags: Linked
*/
function function_7b6e6199()
{
	level endon(#"init_purifier_finished");
	level.var_3d0030f2 = [2:struct::get("vogel_echo_2", "script_noteworthy"), 1:struct::get("vogel_echo_3", "script_noteworthy"), 0:struct::get("vogel_echo_1", "script_noteworthy")];
	while(true)
	{
		if(level.var_3d0030f2.size == 0)
		{
			level flag::set(#"hash_737db8433b93b7ae");
			break;
		}
		level flag::wait_till(#"dark_aether_active");
		if(!level flag::get(#"hash_4fa1234f7156acb5"))
		{
			wait(1);
			continue;
		}
		level.var_3d0030f2[0].var_94c7397b = util::spawn_model("tag_origin", level.var_3d0030f2[0].origin);
		level.var_3d0030f2[0].var_94c7397b thread function_de34115();
		level.var_3d0030f2[0].var_94c7397b zm_unitrigger::create(&function_45fed3bf, vectorscale((1, 1, 1), 64), &function_1876812b);
		level.var_3d0030f2[0].var_94c7397b thread function_19cc9adc();
		waitresult = undefined;
		waitresult = level waittill(#"notebook_given", #"dark_aether_active");
		wait(1);
		zm_unitrigger::unregister_unitrigger(level.var_3d0030f2[0].var_94c7397b.s_unitrigger);
		level.var_3d0030f2[0].var_94c7397b.s_unitrigger = undefined;
		if(isdefined(level.var_3d0030f2[0].var_94c7397b))
		{
			level.var_3d0030f2[0].var_94c7397b delete();
		}
		if(waitresult._notify === "notebook_given")
		{
			arrayremovevalue(level.var_3d0030f2, level.var_3d0030f2[0]);
		}
	}
}

/*
	Name: function_45fed3bf
	Namespace: namespace_d769652e
	Checksum: 0x47B9F0E5
	Offset: 0x51A8
	Size: 0x7C
	Parameters: 1
	Flags: Linked
*/
function function_45fed3bf(e_player)
{
	if(level flag::get("dark_aether_active") && !level flag::get("start_back_to_normal"))
	{
		self sethintstring(#"hash_51eee553370b6580");
		return true;
	}
	return false;
}

/*
	Name: function_1876812b
	Namespace: namespace_d769652e
	Checksum: 0x61650877
	Offset: 0x5230
	Size: 0x244
	Parameters: 0
	Flags: Linked
*/
function function_1876812b()
{
	level endon(#"end_game", #"dark_aether_active", #"notebook_given");
	self endon(#"death");
	waitresult = undefined;
	waitresult = self waittill(#"trigger");
	waitresult.activator thread flag::set_for_time(2, #"hash_7ef7aab6a305d0b0");
	if(isdefined(self.stub.related_parent))
	{
		self.stub.related_parent flag::set("orb_is_deciphered");
	}
	if(isplayer(waitresult.activator))
	{
		waitresult.activator clientfield::increment_to_player("" + #"hash_6696d96a08b9701d");
	}
	if(!isdefined(level.var_3d0030f2[0].script_noteworthy))
	{
		return;
	}
	switch(level.var_3d0030f2[0].script_noteworthy)
	{
		case "vogel_echo_1":
		{
			level thread function_28cbcd87("aib_t9_zm_silver_echo_1_vogel_01", "init");
			break;
		}
		case "vogel_echo_2":
		{
			level thread function_28cbcd87("aib_t9_zm_silver_echo_2_vogel_01", "init");
			break;
		}
		case "vogel_echo_3":
		{
			level thread function_28cbcd87("aib_t9_zm_silver_echo_3_vogel_01", "init");
			break;
		}
	}
	if(isdefined(self.stub.related_parent))
	{
		self.stub.related_parent notify(#"trigger_activated");
	}
}

/*
	Name: function_19cc9adc
	Namespace: namespace_d769652e
	Checksum: 0x14E758BA
	Offset: 0x5480
	Size: 0x370
	Parameters: 0
	Flags: Linked
*/
function function_19cc9adc()
{
	level endon(#"end_game", #"dark_aether_active");
	self endon(#"death");
	self waittill(#"trigger_activated");
	zm_unitrigger::unregister_unitrigger(self.s_unitrigger);
	self.s_unitrigger = undefined;
	wait(1);
	e_activator = self zm_unitrigger::function_fac87205(&function_59f2369, vectorscale((1, 1, 1), 64));
	if(isplayer(e_activator))
	{
		e_activator clientfield::increment_to_player("" + #"hash_6696d96a08b9701d");
	}
	switch(level.var_3d0030f2[0].script_noteworthy)
	{
		case "vogel_echo_1":
		{
			level thread function_28cbcd87("aib_t9_zm_silver_echo_1_vogel_01", "main");
			var_c74251a4 = scene::function_8582657c("aib_t9_zm_silver_echo_1_vogel_01", "main");
			level thread function_c5a2352(var_c74251a4, e_activator.zone_name, "done_echo_scene_vogel_01");
			level flag::set("collect_letter_a");
			break;
		}
		case "vogel_echo_2":
		{
			level thread function_28cbcd87("aib_t9_zm_silver_echo_2_vogel_01", "main");
			var_c74251a4 = scene::function_8582657c("aib_t9_zm_silver_echo_2_vogel_01", "main");
			level thread function_c5a2352(var_c74251a4, e_activator.zone_name, "done_echo_scene_vogel_02");
			level flag::set("collect_letter_h");
			break;
		}
		case "vogel_echo_3":
		{
			level thread function_28cbcd87("aib_t9_zm_silver_echo_3_vogel_01", "main");
			var_c74251a4 = scene::function_8582657c("aib_t9_zm_silver_echo_3_vogel_01", "main");
			level thread function_c5a2352(var_c74251a4, e_activator.zone_name, "done_echo_scene_vogel_03");
			level flag::set("collect_letter_v");
			break;
		}
	}
	if(level.var_ba3a0e1f < var_c74251a4)
	{
		level.var_ba3a0e1f = var_c74251a4;
	}
	else if(level.var_3d0030f2[0].script_noteworthy === "vogel_echo_3")
	{
		level.var_ba3a0e1f = var_c74251a4;
	}
	level notify(#"notebook_given");
}

/*
	Name: function_59f2369
	Namespace: namespace_d769652e
	Checksum: 0xBFB6B188
	Offset: 0x57F8
	Size: 0x9C
	Parameters: 1
	Flags: Linked
*/
function function_59f2369(e_player)
{
	if(level flag::get("someone_has_notebook") && level flag::get("dark_aether_active") && !level flag::get("start_back_to_normal"))
	{
		self sethintstring(#"hash_79ebe2a27b154ea0");
		return true;
	}
	return false;
}

/*
	Name: function_c5a2352
	Namespace: namespace_d769652e
	Checksum: 0xC9B4C7D5
	Offset: 0x58A0
	Size: 0x164
	Parameters: 3
	Flags: Linked
*/
function function_c5a2352(time, zone, str_end_notify)
{
	function_cd1efeed(zone, 0);
	a_players = getplayers();
	foreach(player in a_players)
	{
		player thread function_a7f549b0(zone, str_end_notify);
	}
	level callback::on_actor_damage(&function_e1e6ef8d);
	if(isdefined(time) && time > 1)
	{
		wait(time - 1);
	}
	function_165ebd72(zone);
	function_cd1efeed(zone, 1);
	level callback::remove_on_actor_damage(&function_e1e6ef8d);
}

/*
	Name: function_28cbcd87
	Namespace: namespace_d769652e
	Checksum: 0x5172276B
	Offset: 0x5A10
	Size: 0x94
	Parameters: 2
	Flags: Linked
*/
function function_28cbcd87(scene_name, shot_name)
{
	if(isdefined(shot_name))
	{
		level thread scene::play(scene_name, shot_name);
	}
	else
	{
		level thread scene::play(scene_name);
	}
	level flag::wait_till("start_back_to_normal");
	level scene::delete_scene_spawned_ents(scene_name);
}

/*
	Name: function_de34115
	Namespace: namespace_d769652e
	Checksum: 0xE42A9E3A
	Offset: 0x5AB0
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_de34115()
{
	self function_d2fe6299();
	self function_79d4f5fd();
}

/*
	Name: function_d2fe6299
	Namespace: namespace_d769652e
	Checksum: 0x110E403C
	Offset: 0x5AF0
	Size: 0x21E
	Parameters: 0
	Flags: Linked
*/
function function_d2fe6299()
{
	level endon(#"end_game");
	/#
		self thread function_7a4e3128(#"hash_1a730a397ac55112");
	#/
	while(!self flag::get("orb_is_deciphered") && level flag::get(#"dark_aether_active") && !level flag::get("start_back_to_normal"))
	{
		var_a330507a = 0;
		foreach(player in function_a1ef346b())
		{
			if(distancesquared(self.origin, player.origin) > 65536)
			{
				if(player.var_51cff0f8 === self)
				{
					player.var_51cff0f8 = undefined;
					player flag::clear(#"hash_1154242c9b1e4518");
				}
				continue;
			}
			var_a330507a = 1;
			if(!isdefined(player.var_51cff0f8))
			{
				player.var_51cff0f8 = self;
				player flag::set(#"hash_1154242c9b1e4518");
			}
		}
		self clientfield::set("" + #"hash_8358a32177aa60e", var_a330507a);
		waitframe(1);
	}
}

/*
	Name: function_79d4f5fd
	Namespace: namespace_d769652e
	Checksum: 0xEFC16D92
	Offset: 0x5D18
	Size: 0xF4
	Parameters: 0
	Flags: Linked
*/
function function_79d4f5fd()
{
	all_players = getplayers();
	foreach(player in all_players)
	{
		if(player.var_51cff0f8 === self)
		{
			player.var_51cff0f8 = undefined;
			player flag::clear(#"hash_1154242c9b1e4518");
		}
	}
	self clientfield::set("" + #"hash_8358a32177aa60e", 0);
}

/*
	Name: function_bdfb3840
	Namespace: namespace_d769652e
	Checksum: 0x6632934A
	Offset: 0x5E18
	Size: 0x44
	Parameters: 2
	Flags: Linked
*/
function function_bdfb3840(b_skipped, var_19e802fa)
{
	if(b_skipped || var_19e802fa)
	{
		level flag::set(#"init_purifier_finished");
	}
}

/*
	Name: function_6e538fed
	Namespace: namespace_d769652e
	Checksum: 0xD3EDAB39
	Offset: 0x5E68
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function function_6e538fed(b_skipped)
{
	if(!b_skipped)
	{
		level thread function_dd3b6aa2();
		level notify(#"hash_c28b252525633da");
		level flag::wait_till(#"hash_5d063793500cc512");
	}
}

/*
	Name: function_dd3b6aa2
	Namespace: namespace_d769652e
	Checksum: 0x6AC34AFC
	Offset: 0x5ED8
	Size: 0x24C
	Parameters: 0
	Flags: Linked
*/
function function_dd3b6aa2()
{
	level endon(#"hash_5d063793500cc512");
	if(isdefined(level.var_7c6e836b))
	{
		level.var_7c6e836b delete();
	}
	if(isdefined(level.var_fc67035a))
	{
		level.var_fc67035a delete();
	}
	if(isdefined(level.var_729c7023))
	{
		level.var_729c7023 delete();
	}
	level.var_59b6e9a5 setmodel(#"hash_ae53eff256fd336");
	level.var_59b6e9a5 playsound(#"hash_691b9c2488253fde");
	level flag::clear("on_mq_step_0_2");
	level.var_5e8ab0 thread function_3536208d("receptacle_dmg_01");
	level.var_e25a63e thread function_3536208d("receptacle_dmg_02");
	level.var_39acfd4c thread function_3536208d("receptacle_dmg_03");
	level.var_c77198d7 thread function_3536208d("receptacle_dmg_04");
	playsoundatposition(#"hash_212665295f429897", (266, 1681, -312));
	level flag::wait_till_all([3:"power_plasma_collected", 2:"power_nitrogen_collected", 1:"power_gas_collected", 0:"power_particle_collected"]);
	/#
		iprintlnbold("");
	#/
	level flag::set(#"hash_5d063793500cc512");
}

/*
	Name: function_f5edeec7
	Namespace: namespace_d769652e
	Checksum: 0xA3BE840E
	Offset: 0x6130
	Size: 0x4E
	Parameters: 2
	Flags: None
*/
function function_f5edeec7(player, time)
{
	if(time >= 2000)
	{
		self notify(#"hash_323bacd5b189fc1e", {#player:player});
	}
}

/*
	Name: function_3536208d
	Namespace: namespace_d769652e
	Checksum: 0x54B429FB
	Offset: 0x6188
	Size: 0x552
	Parameters: 1
	Flags: Linked
*/
function function_3536208d(trig_name)
{
	self endon(#"hash_6d87c51108eb2436");
	var_6e56e8a6 = getent(trig_name, "targetname");
	var_6e56e8a6 enablegrenadetouchdamage();
	flag = function_27f2ef17(var_6e56e8a6);
	function_4e3bb793(var_6e56e8a6, flag & (~512));
	/#
		self thread function_7a4e3128(#"hash_5be263faf0397bd");
	#/
	while(true)
	{
		waitresult = undefined;
		waitresult = var_6e56e8a6 waittill(#"damage");
		if(isplayer(waitresult.attacker) && !isdefined(waitresult.var_98e101b0) && waitresult.mod !== "MOD_MELEE")
		{
			if(self == level.var_5e8ab0)
			{
				if(namespace_b376a999::function_f17bb85a(waitresult.weapon) && !level flag::get("power_plasma_collected"))
				{
					level flag::set("power_plasma_collected");
					self scene::play("aib_t9_zm_silver_megaton_intro_purifier_tank_01", self);
					self linkto(level.var_465f425d);
					/#
						iprintlnbold("");
					#/
					self flag::set(#"hash_6d87c51108eb2436");
					/#
						self notify(#"hash_706c332950c29a");
					#/
				}
			}
			else
			{
				if(self == level.var_e25a63e)
				{
					if(namespace_b376a999::function_f1c015e1(waitresult.weapon) && !level flag::get("power_gas_collected"))
					{
						level flag::set("power_gas_collected");
						self scene::play("aib_t9_zm_silver_megaton_intro_purifier_tank_02", self);
						self linkto(level.var_465f425d);
						/#
							iprintlnbold("");
						#/
						self flag::set(#"hash_6d87c51108eb2436");
						/#
							self notify(#"hash_706c332950c29a");
						#/
					}
				}
				else
				{
					if(self == level.var_39acfd4c)
					{
						if(namespace_b376a999::function_8fbb3409(waitresult.weapon) && !level flag::get("power_nitrogen_collected"))
						{
							level flag::set("power_nitrogen_collected");
							self scene::play("aib_t9_zm_silver_megaton_intro_purifier_tank_03", self);
							self linkto(level.var_465f425d);
							/#
								iprintlnbold("");
							#/
							self flag::set(#"hash_6d87c51108eb2436");
							/#
								self notify(#"hash_706c332950c29a");
							#/
						}
					}
					else if(namespace_b376a999::function_c988c217(waitresult.weapon) && !level flag::get("power_particle_collected"))
					{
						level flag::set("power_particle_collected");
						self scene::play("aib_t9_zm_silver_megaton_intro_purifier_tank_04", self);
						self linkto(level.var_465f425d);
						/#
							iprintlnbold("");
						#/
						self flag::set(#"hash_6d87c51108eb2436");
						/#
							self notify(#"hash_706c332950c29a");
						#/
					}
				}
			}
		}
	}
}

/*
	Name: function_2bc04c1
	Namespace: namespace_d769652e
	Checksum: 0xA1F4994
	Offset: 0x66E8
	Size: 0x44
	Parameters: 2
	Flags: Linked
*/
function function_2bc04c1(b_skipped, var_19e802fa)
{
	if(b_skipped || var_19e802fa)
	{
		level flag::set(#"hash_5d063793500cc512");
	}
}

/*
	Name: function_7d5e3785
	Namespace: namespace_d769652e
	Checksum: 0xF5BB011
	Offset: 0x6738
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function function_7d5e3785(b_skipped)
{
	if(!b_skipped)
	{
		level thread function_2555092e();
		level notify(#"hash_147d728c7bf9fa75");
		level flag::wait_till(#"hash_6ddc7fc43d014f02");
	}
}

/*
	Name: function_2555092e
	Namespace: namespace_d769652e
	Checksum: 0xBF3EAD9B
	Offset: 0x67A8
	Size: 0xA64
	Parameters: 0
	Flags: Linked
*/
function function_2555092e()
{
	level endon(#"hash_6ddc7fc43d014f02");
	level flag::wait_till_clear(#"dark_aether_active");
	var_1d1beaf9 = getent("zm_rec_do", "targetname");
	var_1d1beaf9 rotateto(var_1d1beaf9.angles + (vectorscale((0, -1, 0), 135)), 1, 0.25, 0.25);
	var_1d1beaf9 playsound(#"hash_fe68e6bc00c17f6");
	level.var_59b6e9a5 setmodel(#"hash_3198b312a1aa0a17");
	level.var_59b6e9a5 playsound(#"hash_691b9c2488253fde");
	level thread function_34a1157d("aib_t9_zm_silver_secretecho_3_dmitriyev_kalashnik_01_throw", "echo_scene_dmitriyev_kalashnik_throw", "zone_proto_plane_exterior", #"hash_6ddc7fc43d014f02", "done_echo_scene_dmitriyev_kalashnik_01_throw");
	var_1304fdf9 = struct::get("zm_con_rec", "script_noteworthy");
	level.var_e5b2e1c9 = util::spawn_model("tag_origin", var_1304fdf9.origin, var_1304fdf9.angles);
	/#
		level.var_e5b2e1c9 thread function_7a4e3128(#"hash_53506d2bbecd0fad");
	#/
	level notify(#"hash_5d4ec14886878368");
	var_617f86a3 = struct::get("gold_container_tear", "script_noteworthy");
	var_617f86a3 thread function_a1bf0a43("soldier_dark_echo_found", #"hash_70d6bf6ca2ca3285");
	/#
		var_617f86a3 thread function_7a4e3128(#"soldier_dark_echo_found");
	#/
	level flag::wait_till(#"dark_aether_active");
	showmiscmodels("text_clue_stolen");
	function_34a1157d("aib_t9_zm_silver_echo_4_dmitriyev_kalashnik_01", "zm_exp_energy", "zone_trans_north", "done_echo_scene_thiefsoldier", "done_echo_scene_thiefsoldier", #"hash_70d6bf6ca2ca3285");
	level flag::set("soldier_dark_echo_found");
	level.var_ba3a0e1f = 0;
	level flag::wait_till_clear(#"dark_aether_active");
	point = function_4ba8fde("item_zmintel_silver_darkaether_artifact_4");
	item_drop::drop_item(0, undefined, 1, 0, point.id, struct::get("zm_exp_energy", "script_noteworthy").origin, undefined, 1);
	level flag::wait_till("wrench_collected");
	tank = getent("panzer_tank", "targetname");
	e_activator = tank zm_unitrigger::function_fac87205(#"hash_137a43a0f69e43b3", vectorscale((1, 1, 1), 256));
	e_activator playsound(#"hash_d760771fc3882e8");
	if(isplayer(e_activator))
	{
		e_activator clientfield::increment_to_player("" + #"hash_7a769c728c89b6b5");
	}
	playsoundatposition(#"hash_6620249ce68801b", (1270, -486, 156));
	/#
		iprintlnbold("");
	#/
	wait(1);
	e_activator = tank zm_unitrigger::function_fac87205(#"hash_137a43a0f69e43b3", vectorscale((1, 1, 1), 256));
	e_activator playsound(#"hash_d760771fc3882e8");
	if(isplayer(e_activator))
	{
		e_activator clientfield::increment_to_player("" + #"hash_7a769c728c89b6b5");
	}
	playsoundatposition(#"hash_6620349ce6881ce", (1270, -486, 156));
	/#
		iprintlnbold("");
	#/
	wait(1);
	e_activator = tank zm_unitrigger::function_fac87205(#"hash_137a43a0f69e43b3", vectorscale((1, 1, 1), 256));
	e_activator playsound(#"hash_d760771fc3882e8");
	if(isplayer(e_activator))
	{
		e_activator clientfield::increment_to_player("" + #"hash_7a769c728c89b6b5");
	}
	/#
		iprintlnbold("");
	#/
	scene::add_scene_func(#"hash_60241ccceaf44d2a", &function_c491aefd, "intro");
	level thread scene::play(#"hash_60241ccceaf44d2a", "intro");
	level waittill(#"hash_4bfee280acdb622f");
	scene::remove_scene_func(#"hash_60241ccceaf44d2a", &function_c491aefd, "intro");
	var_29c2d57 = getent("tank_grenade_dmg", "targetname");
	while(true)
	{
		s_result = undefined;
		s_result = var_29c2d57 waittill(#"damage");
		mod = s_result.mod;
		if(mod === "MOD_EXPLOSIVE" || mod === "MOD_PROJECTILE_SPLASH" || mod === "MOD_GRENADE_SPLASH")
		{
			break;
		}
	}
	/#
		iprintlnbold("");
	#/
	wait(2);
	tank clientfield::set("" + #"hash_654274a0648df21d", 1);
	foreach(player in getplayers())
	{
		if(distancesquared(tank.origin, player.origin) <= 262144)
		{
			player clientfield::set_to_player("" + #"hash_4119827af45a4ba7", 1);
		}
	}
	playsoundatposition(#"hash_3fd2219d3df800dd", (1201, -240, 157));
	tank scene::play(#"hash_58a47258b83a6579", tank);
	/#
		iprintlnbold("");
	#/
	scene::add_scene_func(#"hash_1da91e1000776d72", &function_a1dbe3ea, "play");
	level thread scene::play(#"hash_1da91e1000776d72", "play");
	level waittill(#"hash_3806f80cc5171e62");
	scene::remove_scene_func(#"hash_1da91e1000776d72", &function_a1dbe3ea, "play");
	function_460881cd();
	if(isdefined(var_29c2d57))
	{
		var_29c2d57 delete();
	}
}

/*
	Name: function_a1dbe3ea
	Namespace: namespace_d769652e
	Checksum: 0xD5AA2AFA
	Offset: 0x7218
	Size: 0xB8
	Parameters: 1
	Flags: Linked
*/
function function_a1dbe3ea(a_ents)
{
	var_f927d3b3 = a_ents[#"hash_6e2391966ff3c21b"];
	wait(2);
	level.var_6f1da2d5 = var_f927d3b3 gettagorigin("j_container_bone");
	level.var_6afe3ef2 = var_f927d3b3 gettagangles("j_container_bone");
	var_f927d3b3 hidepart("j_container_bone", "", 1);
	level notify(#"hash_3806f80cc5171e62");
}

/*
	Name: function_c491aefd
	Namespace: namespace_d769652e
	Checksum: 0x83495E61
	Offset: 0x72D8
	Size: 0xC8
	Parameters: 1
	Flags: Linked
*/
function function_c491aefd(a_ents)
{
	var_37779828 = a_ents[#"hash_580b6a4e3095fe19"];
	var_37779828.var_e8920729 = 1;
	var_37779828 val::set("tank_zombie", "allowdeath", 0);
	var_37779828 waittill(#"damage", #"death");
	level thread scene::play(#"hash_60241ccceaf44d2a", "end");
	wait(1.5);
	level notify(#"hash_4bfee280acdb622f");
}

/*
	Name: function_3520ea1b
	Namespace: namespace_d769652e
	Checksum: 0x99A760DA
	Offset: 0x73A8
	Size: 0x44
	Parameters: 2
	Flags: Linked
*/
function function_3520ea1b(b_skipped, var_19e802fa)
{
	if(b_skipped || var_19e802fa)
	{
		level flag::set(#"hash_6ddc7fc43d014f02");
	}
}

/*
	Name: function_ea72075c
	Namespace: namespace_d769652e
	Checksum: 0x15E17826
	Offset: 0x73F8
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function function_ea72075c(b_skipped)
{
	if(b_skipped)
	{
		return;
	}
	level notify(#"hash_695a92826c9198a4");
	function_2a8262fa();
}

/*
	Name: function_9c7d7ce3
	Namespace: namespace_d769652e
	Checksum: 0xC974C9CA
	Offset: 0x7440
	Size: 0x294
	Parameters: 2
	Flags: Linked
*/
function function_9c7d7ce3(b_skipped, var_19e802fa)
{
	if(b_skipped || var_19e802fa)
	{
		var_a4dd4eab = struct::get("steiner_cpt_uprit", "script_noteworthy");
		var_61a235dc = struct::get("steiner_cpt_uplft", "script_noteworthy");
		var_22a16427 = getent("ent_prf", "script_noteworthy");
		var_93700de7 = spawnactor(#"spawner_zm_steiner_split_radiation_blast", var_a4dd4eab.origin, var_a4dd4eab.angles);
		var_7ffcff59 = spawnactor(#"spawner_zm_steiner_split_radiation_bomb", var_61a235dc.origin, var_61a235dc.angles);
		if(!isdefined(level.var_24de243e))
		{
			level.var_24de243e = [];
		}
		else if(!isarray(level.var_24de243e))
		{
			level.var_24de243e = array(level.var_24de243e);
		}
		level.var_24de243e[level.var_24de243e.size] = var_93700de7;
		if(!isdefined(level.var_24de243e))
		{
			level.var_24de243e = [];
		}
		else if(!isarray(level.var_24de243e))
		{
			level.var_24de243e = array(level.var_24de243e);
		}
		level.var_24de243e[level.var_24de243e.size] = var_7ffcff59;
		var_93700de7.ai.var_b90dccd6 = 1;
		var_7ffcff59.ai.var_b90dccd6 = 1;
		var_93700de7 linkto(var_22a16427);
		var_7ffcff59 linkto(var_22a16427);
		level flag::set(#"hash_77fa97e90fc553ec");
	}
}

/*
	Name: function_54ad1c95
	Namespace: namespace_d769652e
	Checksum: 0xFEE805D
	Offset: 0x76E0
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function function_54ad1c95(b_skipped)
{
	if(b_skipped)
	{
		return;
	}
	function_dbe6d6b3();
}

/*
	Name: function_afbc77b5
	Namespace: namespace_d769652e
	Checksum: 0x57C5E3DC
	Offset: 0x7718
	Size: 0x44
	Parameters: 2
	Flags: Linked
*/
function function_afbc77b5(b_skipped, var_19e802fa)
{
	if(b_skipped || var_19e802fa)
	{
		level flag::set(#"hash_3b2ee17e5ce02f9e");
	}
}

/*
	Name: function_cb0e55f0
	Namespace: namespace_d769652e
	Checksum: 0xAAE049E
	Offset: 0x7768
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function function_cb0e55f0(b_skipped)
{
	if(b_skipped)
	{
		return;
	}
	level notify(#"hash_3bc9b27c09d93ae7");
	function_41e8018f();
}

/*
	Name: function_70ffca9c
	Namespace: namespace_d769652e
	Checksum: 0x65607127
	Offset: 0x77B0
	Size: 0x44
	Parameters: 2
	Flags: Linked
*/
function function_70ffca9c(b_skipped, var_19e802fa)
{
	if(b_skipped || var_19e802fa)
	{
		level flag::set(#"hash_3e332b6888c86102");
	}
}

/*
	Name: function_1bddc36a
	Namespace: namespace_d769652e
	Checksum: 0x9C4E3B1D
	Offset: 0x7800
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function function_1bddc36a(b_skipped)
{
	if(b_skipped)
	{
		return;
	}
	level notify(#"hash_6500b270bf5a1596");
	function_8c5dae74();
}

/*
	Name: function_d5e55496
	Namespace: namespace_d769652e
	Checksum: 0x59B2848F
	Offset: 0x7848
	Size: 0x32C
	Parameters: 2
	Flags: Linked
*/
function function_d5e55496(b_skipped, var_19e802fa)
{
	if(b_skipped || var_19e802fa)
	{
		level clientfield::set("" + #"hash_718b0f4fd6db0bb4", 1);
		var_bc233708 = struct::get_array("mq_br_dr_fx_loc", "targetname");
		foreach(loc in var_bc233708)
		{
			if(!isdefined(level.var_e0712ded))
			{
				level.var_e0712ded = [];
			}
			else if(!isarray(level.var_e0712ded))
			{
				level.var_e0712ded = array(level.var_e0712ded);
			}
			level.var_e0712ded[level.var_e0712ded.size] = spawncollision(#"collision_clip_wall_128x128x10", "collider", loc.origin, loc.angles);
		}
		foreach(clip in level.var_e0712ded)
		{
			clip disconnectpaths();
		}
		function_9afd3ea2(0);
		level.no_powerups = 1;
		level flag::clear("spawn_zombies");
		level flag::set(#"pause_round_timeout");
		var_ccd37052 = struct::get("steiner_phtloc", "script_noteworthy");
		level.var_3df02306 = util::spawn_model(#"p9_zm_ndu_family_photo", var_ccd37052.origin, var_ccd37052.angles);
		level.var_3df02306 setscale(0.45);
		level flag::set(#"hash_322c7f92525e008e");
	}
}

/*
	Name: function_34c29791
	Namespace: namespace_d769652e
	Checksum: 0xE5CF3BF8
	Offset: 0x7B80
	Size: 0x12C
	Parameters: 1
	Flags: Linked
*/
function function_34c29791(b_skipped)
{
	if(b_skipped)
	{
		function_8f85d169();
		level clientfield::set("" + #"hash_575a337754ccd980", 1);
		level clientfield::set("" + #"hash_3fd05810b220d13a", 1);
		level clientfield::set("" + #"hash_48df238a087c684e", 1);
		level clientfield::set("" + #"hash_17466a1bb2380af6", 4);
		return;
	}
	level notify(#"hash_196792ac246fbe91");
	function_1226c0a6();
}

/*
	Name: function_d7ef969f
	Namespace: namespace_d769652e
	Checksum: 0x9F89025
	Offset: 0x7CB8
	Size: 0x114
	Parameters: 2
	Flags: Linked
*/
function function_d7ef969f(b_skipped, var_19e802fa)
{
	if(b_skipped || var_19e802fa)
	{
		var_bf48e9e2 = function_b6a1fe09();
		foreach(var_2cbc18b7 in var_bf48e9e2)
		{
		}
	}
	level flag::set(#"hash_3a617ab5e651c2a9");
	level flag::set(#"hash_4a49aa778b3cdd8");
	level flag::set(#"hash_1aab687832f4e02b");
}

/*
	Name: function_852146cc
	Namespace: namespace_d769652e
	Checksum: 0x801809AB
	Offset: 0x7DD8
	Size: 0x134
	Parameters: 1
	Flags: Linked
*/
function function_852146cc(b_skipped)
{
	if(b_skipped)
	{
		return;
	}
	level flag::clear(#"hash_2aecb7319e5a0d11");
	level notify(#"hash_6f1392a5c4774e60");
	level.var_c29bf3b6 = "none";
	level.var_139ceb46 = #"hash_6084efb2631b6331";
	level.var_6363395e = #"none";
	level.var_f1a8b5e6 = #"none";
	level.var_6ceeb30a = #"none";
	level.var_f9d84559 = #"none";
	level.var_7c027cbe = #"none";
	level.var_29a33c08 = 1;
	level.var_aaf7505f = 90;
	level.var_7d45d0d4.var_14f09b99 = &function_14f09b99;
	function_39f889a2();
}

/*
	Name: function_e3bd1289
	Namespace: namespace_d769652e
	Checksum: 0xA7FAE9EC
	Offset: 0x7F18
	Size: 0x54
	Parameters: 2
	Flags: Linked
*/
function function_e3bd1289(b_skipped, var_19e802fa)
{
	array::thread_all(getplayers(), &namespace_2b924e50::close_hud);
}

/*
	Name: function_d5d67561
	Namespace: namespace_d769652e
	Checksum: 0x78772C51
	Offset: 0x7F78
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_d5d67561()
{
	level flag::set(#"main_quest_completed");
}

/*
	Name: function_14f09b99
	Namespace: namespace_d769652e
	Checksum: 0x73D0C3ED
	Offset: 0x7FA8
	Size: 0xA0
	Parameters: 1
	Flags: Linked
*/
function function_14f09b99(s_result)
{
	self endon(#"end_game");
	if(is_true(s_result.completed))
	{
		str_reason = #"hash_6ebafb1370ab6c93";
	}
	else
	{
		str_reason = #"hash_22a0611dcd352614";
	}
	waitframe(1);
	level notify(#"end_game", {#reason:str_reason});
}

/*
	Name: function_e3cee79f
	Namespace: namespace_d769652e
	Checksum: 0x4EC22B11
	Offset: 0x8050
	Size: 0xBA
	Parameters: 0
	Flags: Linked
*/
function function_e3cee79f()
{
	/#
		assert(isdefined(self.var_6f1da2d5));
	#/
	/#
		assert(isdefined(self.var_6afe3ef2));
	#/
	point = function_4ba8fde("item_zmintel_silver_requiem_artifact_5");
	e_container = item_drop::drop_item(0, undefined, 1, 0, point.id, self.var_6f1da2d5, self.var_6afe3ef2, 0);
	e_container.var_dd21aec2 = 1 | 16;
}

/*
	Name: function_460881cd
	Namespace: namespace_d769652e
	Checksum: 0x67D22402
	Offset: 0x8118
	Size: 0x17C
	Parameters: 0
	Flags: Linked
*/
function function_460881cd()
{
	level.var_5e824298 = getweapon("equip_gold_container_zm");
	level function_e3cee79f();
	var_2de34b7c = getent("zm_mb_re_scope", "targetname");
	var_2de34b7c thread function_e0960594();
	var_5cce521e = level.var_e5b2e1c9 zm_unitrigger::create(&function_e8030fb1, (24, 48, 64), &function_8b8ae486);
	var_5cce521e.origin = var_5cce521e.origin + (vectorscale((0, -1, 0), 20));
	zm_unitrigger::unitrigger_force_per_player_triggers(var_5cce521e, 1);
	zm_player::function_a827358a(&on_player_damage);
	callback::on_disconnect(&on_player_disconnect);
	level waittill(#"hash_3b0c1d89e0879d06");
	if(isdefined(var_2de34b7c))
	{
		var_2de34b7c delete();
	}
}

/*
	Name: function_e0960594
	Namespace: namespace_d769652e
	Checksum: 0x9278EC6A
	Offset: 0x82A0
	Size: 0x28C
	Parameters: 0
	Flags: Linked
*/
function function_e0960594()
{
	self endon(#"death");
	waitresult = undefined;
	waitresult = self waittill(#"trigger");
	if(zm_utility::is_player_valid(waitresult.activator))
	{
		self triggerenable(0);
		level flag::clear("spawn_zombies");
		for(dog_count = 4 + (getplayers().size * 2); dog_count > 0; dog_count--)
		{
			function_cce73165("dog_location", #"hash_12a17ab3df5889eb", waitresult.activator.zone_name);
		}
		var_9677f2f9 = undefined;
		foreach(sp_zombie in level.zombie_spawners)
		{
			if(is_true(sp_zombie.var_5d6331b7))
			{
				var_9677f2f9 = sp_zombie;
			}
		}
		for(var_7ee30bbb = 4 + (getplayers().size * 2); var_7ee30bbb > 0; var_7ee30bbb--)
		{
			if(getfreeactorcount() < 1)
			{
				a_zombie = getaiarchetypearray(#"zombie");
				if(isdefined(a_zombie))
				{
					a_zombie[0] kill();
				}
			}
			zombie_utility::spawn_zombie(var_9677f2f9, undefined, undefined, level.round_number);
		}
		level flag::set("spawn_zombies");
	}
}

/*
	Name: function_35e288c2
	Namespace: namespace_d769652e
	Checksum: 0x5CCDE18D
	Offset: 0x8538
	Size: 0x5E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_35e288c2(e_player)
{
	return zm_utility::is_player_valid(e_player) && e_player getcurrentweapon() === level.var_5e824298 && !e_player isswitchingweapons();
}

/*
	Name: function_8b8ae486
	Namespace: namespace_d769652e
	Checksum: 0x1628D8BC
	Offset: 0x85A0
	Size: 0x1EC
	Parameters: 0
	Flags: Linked
*/
function function_8b8ae486()
{
	self endon(#"death");
	waitresult = undefined;
	waitresult = self waittill(#"trigger");
	e_player = waitresult.activator;
	if(isdefined(self.stub) && isdefined(self.stub.related_parent))
	{
		self.stub.related_parent notify(#"trigger_activated", {#e_who:e_player});
		var_693201b7 = util::spawn_model("wpn_t9_zm_gold_container_b", level.var_e5b2e1c9.origin);
		var_693201b7 clientfield::set("" + #"hash_2f17676fe2c8e396", 1);
		var_693201b7 playsound(#"hash_29ebd9e0d7e566a");
		level notify(#"hash_3b0c1d89e0879d06");
		/#
			iprintlnbold("");
		#/
		var_1d1beaf9 = getent("zm_rec_do", "targetname");
		var_1d1beaf9 rotateto(var_1d1beaf9.angles + vectorscale((0, 1, 0), 135), 1, 0.25, 0.25);
		var_1d1beaf9 playsound(#"hash_1d88d624566db32");
	}
}

/*
	Name: function_714e14de
	Namespace: namespace_d769652e
	Checksum: 0x4E7D412B
	Offset: 0x8798
	Size: 0x15E
	Parameters: 0
	Flags: Linked
*/
function function_714e14de()
{
	level endon(#"end_game");
	v_start = self.origin + vectorscale((0, 0, 1), 32);
	v_end = self.origin - vectorscale((0, 0, 1), 1000);
	a_trace = groundtrace(v_start, v_end, 0, self, 1);
	v_ground_pos = (isdefined(a_trace[#"position"]) ? a_trace[#"position"] : self.origin);
	self playsound(#"hash_118722f1108139ea");
	point = function_4ba8fde("item_zmintel_silver_requiem_artifact_5");
	level.e_container = item_drop::drop_item(0, undefined, 1, 0, point.id, v_ground_pos, undefined, 0);
	level.e_container.var_dd21aec2 = 1 | 16;
}

/*
	Name: function_e8030fb1
	Namespace: namespace_d769652e
	Checksum: 0xCC2A0545
	Offset: 0x8900
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function function_e8030fb1(e_player)
{
	if(level function_35e288c2(e_player))
	{
		self sethintstringforplayer(e_player, #"hash_5d9e8fd25c0e4991");
		return true;
	}
	return false;
}

/*
	Name: function_85e60c0a
	Namespace: namespace_d769652e
	Checksum: 0x68F7DB01
	Offset: 0x8960
	Size: 0x106
	Parameters: 0
	Flags: Linked
*/
function function_85e60c0a()
{
	self notify("485cdfaf89f276ab");
	self endon("485cdfaf89f276ab");
	level endon(#"end_game", #"hash_1f20be24ebb9923c");
	wait(60);
	level notify(#"hash_e853f57d046c3c0");
	if(isdefined(level.e_container))
	{
		level.e_container.origin = level.var_6f1da2d5;
	}
	else
	{
		point = function_4ba8fde("item_zmintel_silver_requiem_artifact_5");
		level.e_container = item_drop::drop_item(0, undefined, 1, 0, point.id, level.var_6f1da2d5, level.var_6afe3ef2, 0);
		level.e_container.var_dd21aec2 = 1 | 16;
	}
}

/*
	Name: on_player_damage
	Namespace: namespace_d769652e
	Checksum: 0xB98AF878
	Offset: 0x8A70
	Size: 0xB6
	Parameters: 10
	Flags: Linked
*/
function on_player_damage(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime)
{
	if(psoffsettime >= self.health)
	{
		if(self getcurrentweapon() === level.var_5e824298)
		{
			self notify(#"hash_46a03eeac0661b25", {#str_result:"dropped"});
		}
	}
}

/*
	Name: on_player_disconnect
	Namespace: namespace_d769652e
	Checksum: 0x3141B414
	Offset: 0x8B30
	Size: 0xD0
	Parameters: 0
	Flags: Linked
*/
function on_player_disconnect()
{
	if(!self util::is_spectating())
	{
		var_2e07b8ff = self getweaponslistprimaries();
		foreach(w_weapon in var_2e07b8ff)
		{
			if(w_weapon === level.var_5e824298)
			{
				self thread function_86404122();
			}
		}
	}
}

/*
	Name: function_86404122
	Namespace: namespace_d769652e
	Checksum: 0xADBAD899
	Offset: 0x8C08
	Size: 0x74
	Parameters: 0
	Flags: Linked
*/
function function_86404122()
{
	self function_714e14de();
	level thread function_85e60c0a();
	callback::remove_on_weapon_change(&function_e9df7768);
	callback::function_824d206(&function_7904960c);
}

/*
	Name: function_7acfbb3a
	Namespace: namespace_d769652e
	Checksum: 0x38919B08
	Offset: 0x8C88
	Size: 0x210
	Parameters: 1
	Flags: Linked
*/
function function_7acfbb3a(e_player)
{
	e_player endon(#"hash_46a03eeac0661b25", #"disconnect");
	e_player playsound(#"hash_7de2e7ddb5eb901b");
	e_player val::set(#"hash_754e9e4a6ccbcb80", "disable_weapon_cycling", 1);
	e_player giveweapon(level.var_5e824298);
	e_player switchtoweapon(level.var_5e824298, 1);
	e_player thread function_f4b436d5();
	e_player waittill(#"weapon_change_complete");
	callback::on_weapon_change(&function_e9df7768);
	callback::function_33f0ddd3(&function_7904960c);
	e_player thread function_50d04ccb();
	e_player val::reset(#"hash_754e9e4a6ccbcb80", "disable_weapon_cycling");
	e_player thread zm_equipment::show_hint_text(#"hash_5b87d46ce24aa2cf", 10);
	level thread function_114098ba(e_player);
	if(isdefined(level.var_e5b2e1c9))
	{
		level.var_e5b2e1c9 waittill(#"trigger_activated");
	}
	e_player notify(#"hash_46a03eeac0661b25", {#str_result:"recovered"});
}

/*
	Name: function_f4b436d5
	Namespace: namespace_d769652e
	Checksum: 0x478889B7
	Offset: 0x8EA0
	Size: 0x27C
	Parameters: 0
	Flags: Linked
*/
function function_f4b436d5()
{
	self endon(#"disconnect");
	self.is_drinking = 1;
	self val::set(#"hash_754e9e4a6ccbcb80", "disable_weapon_fire", 1);
	self val::set(#"hash_754e9e4a6ccbcb80", "allow_melee", 0);
	self val::set(#"hash_754e9e4a6ccbcb80", "allow_mantle", 0);
	self val::set(#"hash_754e9e4a6ccbcb80", "allow_sprint", 0);
	self val::set(#"hash_754e9e4a6ccbcb80", "allow_jump", 0);
	self val::set(#"hash_754e9e4a6ccbcb80", "allow_crouch", 0);
	self val::set(#"hash_754e9e4a6ccbcb80", "allow_prone", 0);
	self waittill(#"hash_46a03eeac0661b25");
	self.is_drinking = 0;
	self val::reset(#"hash_754e9e4a6ccbcb80", "disable_weapon_fire");
	self val::reset(#"hash_754e9e4a6ccbcb80", "allow_melee");
	self val::reset(#"hash_754e9e4a6ccbcb80", "allow_mantle");
	self val::reset(#"hash_754e9e4a6ccbcb80", "allow_sprint");
	self val::reset(#"hash_754e9e4a6ccbcb80", "allow_jump");
	self val::reset(#"hash_754e9e4a6ccbcb80", "allow_crouch");
	self val::reset(#"hash_754e9e4a6ccbcb80", "allow_prone");
}

/*
	Name: function_114098ba
	Namespace: namespace_d769652e
	Checksum: 0x839B219C
	Offset: 0x9128
	Size: 0x16C
	Parameters: 1
	Flags: Linked
*/
function function_114098ba(e_player)
{
	e_player endon(#"disconnect");
	s_result = undefined;
	s_result = e_player waittill(#"hash_46a03eeac0661b25", #"fake_death");
	callback::remove_on_weapon_change(&function_e9df7768);
	callback::function_824d206(&function_7904960c);
	e_player takeweapon(level.var_5e824298);
	e_player notify(#"hide_equipment_hint_text");
	if(s_result.str_result === "dropped" || s_result._notify == "fake_death")
	{
		e_player function_714e14de();
		level thread function_85e60c0a();
	}
	else if(is_true(s_result.str_result === "recovered"))
	{
		level flag::set(#"hash_6ddc7fc43d014f02");
	}
}

/*
	Name: function_e9df7768
	Namespace: namespace_d769652e
	Checksum: 0xD9C73972
	Offset: 0x92A0
	Size: 0x36
	Parameters: 1
	Flags: Linked
*/
function function_e9df7768(s_params)
{
	self notify(#"hash_46a03eeac0661b25", {#str_result:"dropped"});
}

/*
	Name: function_7904960c
	Namespace: namespace_d769652e
	Checksum: 0x9149B417
	Offset: 0x92E0
	Size: 0xB6
	Parameters: 1
	Flags: Linked
*/
function function_7904960c(s_event)
{
	w_weapon = s_event.weapon;
	if(w_weapon.inventorytype === "ability")
	{
		return;
	}
	if(s_event.event === "take_weapon" && (w_weapon.inventorytype === "offhand" || w_weapon.inventorytype === "offhand_primary"))
	{
		return;
	}
	self notify(#"hash_46a03eeac0661b25", {#str_result:"dropped"});
}

/*
	Name: function_50d04ccb
	Namespace: namespace_d769652e
	Checksum: 0xE97B9381
	Offset: 0x93A0
	Size: 0x76
	Parameters: 0
	Flags: Linked
*/
function function_50d04ccb()
{
	self endon(#"disconnect", #"hash_46a03eeac0661b25", #"fake_death");
	self waittill(#"hash_4506f189fa360331");
	self notify(#"hash_46a03eeac0661b25", {#str_result:"dropped"});
}

/*
	Name: function_2a8262fa
	Namespace: namespace_d769652e
	Checksum: 0xC25D29E4
	Offset: 0x9420
	Size: 0x71A
	Parameters: 0
	Flags: Linked
*/
function function_2a8262fa()
{
	level endon(#"hash_77fa97e90fc553ec");
	hidemiscmodels("text_clue_stolen");
	level.var_59b6e9a5 setmodel(#"hash_2d1765d7129d576b");
	level.var_59b6e9a5 playsound(#"hash_691b9c2488253fde");
	var_a2e870fa = struct::get("steiner_cpt_grnd", "script_noteworthy");
	var_a0cd95e3 = struct::get("steiner_cpt_lwer", "script_noteworthy");
	var_c39b55d8 = struct::get("steiner_cpt_uplft", "script_noteworthy");
	var_5aeca601 = struct::get("steiner_cpt_uprit", "script_noteworthy");
	var_cec31715 = getent("steiner_cpt_rit", "script_noteworthy");
	var_21a98a47 = getent("steiner_cpt_lft", "script_noteworthy");
	var_465f425d = getent("ent_prf", "script_noteworthy");
	var_41d71fcc = [];
	var_211fb567 = [];
	while(true)
	{
		var_743a066e = getaiarchetypearray(#"hash_7c0d83ac1e845ac2");
		arrayremovevalue(var_211fb567, undefined, 0);
		arrayremovevalue(var_41d71fcc, undefined, 0);
		foreach(actor in var_743a066e)
		{
			if(isalive(actor) && distancesquared(actor.origin, var_a2e870fa.origin) <= 1600 && isdefined(actor.var_9fde8624))
			{
				if(actor.var_9fde8624 == #"hash_70162f4bc795092")
				{
					if(!is_true(actor.ai.var_b90dccd6) && !is_true(actor.var_8576e0be))
					{
						actor.ai.var_b90dccd6 = 1;
						actor.takedamage = 0;
						actor.ignore_nuke = 1;
						actor thread function_8d1b6fd8(var_21a98a47, var_a0cd95e3, var_c39b55d8, var_465f425d);
						if(!isdefined(var_211fb567))
						{
							var_211fb567 = [];
						}
						else if(!isarray(var_211fb567))
						{
							var_211fb567 = array(var_211fb567);
						}
						var_211fb567[var_211fb567.size] = actor;
					}
					if(var_41d71fcc.size === 0 && var_211fb567.size === 1)
					{
						level notify(#"hash_4337abdaab1fc730");
					}
					if(var_211fb567.size > 1)
					{
						level notify(#"hash_3f9e5836a14975bc");
						foreach(var_fbed7bd8 in var_211fb567)
						{
							var_fbed7bd8 kill();
						}
					}
				}
				if(actor.var_9fde8624 == #"hash_5653bbc44a034094")
				{
					if(!is_true(actor.ai.var_b90dccd6) && !is_true(actor.var_8576e0be))
					{
						actor.ai.var_b90dccd6 = 1;
						actor.takedamage = 0;
						actor.ignore_nuke = 1;
						actor thread function_8d1b6fd8(var_cec31715, var_a0cd95e3, var_5aeca601, var_465f425d);
						if(!isdefined(var_41d71fcc))
						{
							var_41d71fcc = [];
						}
						else if(!isarray(var_41d71fcc))
						{
							var_41d71fcc = array(var_41d71fcc);
						}
						var_41d71fcc[var_41d71fcc.size] = actor;
					}
					if(var_41d71fcc.size === 1 && var_211fb567.size === 0)
					{
						level notify(#"hash_4337abdaab1fc730");
					}
					if(var_41d71fcc.size > 1)
					{
						level notify(#"hash_3f9e5836a14975bc");
						foreach(var_1d1995be in var_41d71fcc)
						{
							var_1d1995be kill();
						}
					}
				}
			}
		}
		if(var_41d71fcc.size == 1 && var_211fb567.size == 1)
		{
			level.var_24de243e = arraycombine(var_41d71fcc, var_211fb567);
			level notify(#"hash_395eb3958f40a0cd");
			level flag::set(#"hash_77fa97e90fc553ec");
			break;
		}
		waitframe(1);
	}
}

/*
	Name: function_dbe6d6b3
	Namespace: namespace_d769652e
	Checksum: 0xE0F709BB
	Offset: 0x9B48
	Size: 0x234
	Parameters: 0
	Flags: Linked
*/
function function_dbe6d6b3()
{
	level endon(#"hash_3b2ee17e5ce02f9e");
	level flag::wait_till(#"hash_77fa97e90fc553ec");
	if(isdefined(level.var_e5b2e1c9))
	{
		level.var_e5b2e1c9 delete();
	}
	level.var_3bc06d8a = getent("zm_re_com", "script_noteworthy");
	level.var_3bc06d8a function_619a5c20();
	var_465f425d = getent("ent_prf", "script_noteworthy");
	var_448b5a02 = getent("vol_medical_lab_ctrlrm", "script_noteworthy");
	var_465f425d clientfield::set("" + #"hash_17ea9211637fa6cf", 1);
	/#
		iprintlnbold("");
	#/
	var_ed980865 = level.var_3bc06d8a zm_unitrigger::create(&function_b7c5dc4, vectorscale((1, 1, 1), 130), &function_ce94e1d2);
	level thread function_179c33b9(var_448b5a02);
	level.var_3bc06d8a waittill(#"trigger_activated");
	level.var_3bc06d8a function_23a29590();
	function_6492d9db(var_ed980865);
	level thread function_479a6396();
	level flag::set(#"hash_3b2ee17e5ce02f9e");
}

/*
	Name: function_b7c5dc4
	Namespace: namespace_d769652e
	Checksum: 0xB8D37470
	Offset: 0x9D88
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function function_b7c5dc4(e_player)
{
	if(level.var_82947ea7 && !level flag::get(#"in_dark_side"))
	{
		self sethintstring(#"hash_57620d2432a64bf9");
		return true;
	}
	return false;
}

/*
	Name: function_ce94e1d2
	Namespace: namespace_d769652e
	Checksum: 0xE9421847
	Offset: 0x9E00
	Size: 0x110
	Parameters: 0
	Flags: Linked
*/
function function_ce94e1d2()
{
	self endon(#"death");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"trigger");
		e_player = waitresult.activator;
		if(!zm_utility::can_use(e_player))
		{
			continue;
		}
		if(isplayer(e_player))
		{
			e_player clientfield::increment_to_player("" + #"hash_6696d96a08b9701d");
		}
		if(isdefined(self.stub) && isdefined(self.stub.related_parent))
		{
			self.stub.related_parent notify(#"trigger_activated", {#e_who:e_player});
		}
	}
}

/*
	Name: function_179c33b9
	Namespace: namespace_d769652e
	Checksum: 0xCB738CCF
	Offset: 0x9F18
	Size: 0x11A
	Parameters: 1
	Flags: Linked
*/
function function_179c33b9(var_cfc8323c)
{
	level endon(#"hash_3b2ee17e5ce02f9e");
	while(true)
	{
		var_9a92e103 = 1;
		players = getplayers();
		foreach(player in players)
		{
			if(!player istouching(var_cfc8323c) && !player util::is_spectating())
			{
				var_9a92e103 = 0;
				break;
			}
		}
		level.var_82947ea7 = var_9a92e103;
		wait(1);
	}
}

/*
	Name: function_41e8018f
	Namespace: namespace_d769652e
	Checksum: 0x135A1AE7
	Offset: 0xA040
	Size: 0x9B4
	Parameters: 0
	Flags: Linked
*/
function function_41e8018f()
{
	level flag::wait_till(#"hash_3b2ee17e5ce02f9e");
	level notify(#"hash_795783e3edb7670");
	function_8f85d169();
	level.var_59b6e9a5 setmodel(#"hash_4a5671156b3bf14d");
	level.var_59b6e9a5 playsound(#"hash_425afc32b2eb6c0c");
	var_465f425d = getent("ent_prf", "script_noteworthy");
	var_dc67de8c = getent("ctrlrm_door_lft", "script_noteworthy");
	var_f059f398 = getent("ctrlrm_door_rt", "script_noteworthy");
	var_de54286c = struct::get("clp_prf_lft", "script_noteworthy");
	var_a8bef0e5 = struct::get("clp_prf_rit", "script_noteworthy");
	foreach(player in getplayers())
	{
		player.var_1a4a768c = 1;
	}
	level flag::set(#"hash_4ae22bd566ad08c3");
	var_32c3c05c = getaiarchetypearray(#"hash_7c0d83ac1e845ac2");
	foreach(steiner in var_32c3c05c)
	{
		steiner.ai.var_4beb90f3 = 0;
	}
	a_zombies = getaispeciesarray(level.zombie_team);
	if(isdefined(level.var_24de243e))
	{
		foreach(steiner in level.var_24de243e)
		{
			arrayremovevalue(a_zombies, steiner);
		}
	}
	foreach(zombie in a_zombies)
	{
		zombie.allowdeath = 1;
		zombie kill();
	}
	var_dc67de8c moveto(var_dc67de8c.origin + (vectorscale((0, 0, -1), 265)), 1, 0, 0.5);
	var_f059f398 moveto(var_f059f398.origin + (vectorscale((0, 0, -1), 265)), 1, 0, 0.5);
	var_dc67de8c playsound(#"hash_3b49d7b126d7c509");
	var_f059f398 playsound(#"hash_429d103970d8dc6a");
	level clientfield::set("" + #"hash_6f13307bc53f2de5", 1);
	level flag::clear("spawn_zombies");
	level.disable_nuke_delay_spawning = 1;
	/#
		iprintlnbold("");
	#/
	var_465f425d clientfield::set("" + #"hash_6dc2bf4e960f0495", 1);
	namespace_88795f45::function_67a0e9a2(level.var_24de243e);
	level waittill(#"hash_4ba8914384a227e0");
	var_465f425d clientfield::set("" + #"hash_17ea9211637fa6cf", 0);
	level flag::wait_till(#"steiner_merge_done");
	music::setmusicstate("mq_6_emotional");
	level util::delay(37, undefined, &flag::set, #"hash_821afd1816759c2");
	s_scene = struct::get("scn_steiner_itr", "targetname");
	level thread function_a2a695e3();
	s_scene scene::play("aib_t9_zm_silver_megaton_intro_01", var_465f425d);
	spawncollision(#"collision_clip_wall_64x64x10", "collider", var_de54286c.origin, var_de54286c.angles);
	spawncollision(#"collision_clip_wall_64x64x10", "collider", var_a8bef0e5.origin, var_a8bef0e5.angles);
	level flag::set(#"spawn_zombies");
	level.disable_nuke_delay_spawning = 0;
	var_dc67de8c moveto(var_dc67de8c.origin + vectorscale((0, 0, 1), 272), 1, 0, 0.5);
	var_f059f398 moveto(var_f059f398.origin + vectorscale((0, 0, 1), 272), 1, 0, 0.5);
	var_dc67de8c playsound(#"hash_34df32180a9011fb");
	var_f059f398 playsound(#"hash_6d94f77a25928744");
	level clientfield::set("" + #"hash_6f13307bc53f2de5", 0);
	function_8f85d169(0);
	foreach(player in getplayers())
	{
		player.var_1a4a768c = undefined;
	}
	var_457de445 = getplayers().size;
	dog_count = 4 + (getplayers().size * 2);
	while(var_457de445 > 0)
	{
		function_cce73165("steiner_location", #"spawner_zm_steiner", "zone_trans_north");
		var_457de445--;
	}
	while(dog_count > 0)
	{
		function_cce73165("dog_location", #"hash_12a17ab3df5889eb", "zone_trans_north");
		dog_count--;
	}
	level flag::set(#"hash_3e332b6888c86102");
}

/*
	Name: function_8c5dae74
	Namespace: namespace_d769652e
	Checksum: 0xB8AF9FE
	Offset: 0xAA00
	Size: 0x8DC
	Parameters: 0
	Flags: Linked
*/
function function_8c5dae74()
{
	level flag::wait_till(#"hash_3e332b6888c86102");
	level.var_59b6e9a5 setmodel(#"hash_1fbce5805347884");
	var_924f0bf0 = struct::get("fml_pht_sploc", "script_noteworthy");
	var_9bb7cfb8 = struct::get("pht_ter", "script_noteworthy");
	var_ccd37052 = struct::get("steiner_phtloc", "script_noteworthy");
	var_bc233708 = struct::get_array("mq_br_dr_fx_loc", "targetname");
	level thread function_34a1157d("aib_t9_zm_silver_secretecho_4_orlovandmedved", "scn_orlovandmedved", "zone_proto_exterior_rear2", #"hash_22a4a6dd73981ef1", "done_echo_scene_orlovandmedved");
	level thread function_34a1157d("aib_t9_zm_silver_secretecho_5_valentinaandpeck", "scn_valentinaandpeck", "zone_power_room", #"hash_22a4a6dd73981ef1", "done_echo_scene_valentinaandpeck");
	level thread function_77e5b46f();
	level thread function_d65411e();
	level flag::set(#"hash_94bda7ad49639f5");
	function_abc0783b("steiner_spker");
	players = getplayers();
	foreach(player in players)
	{
		player thread function_9951a0d8();
	}
	var_9bb7cfb8 thread function_a1bf0a43(#"hash_1dd7e5ac52d2221c", #"hash_7a104127b995be32");
	level thread function_34a1157d("aib_t9_zm_silver_echo_5_orlov_01", "pht_eco", "zone_proto_interior_cave", #"hash_322c7f92525e008e", #"hash_1dd7e5ac52d2221c", #"hash_7a104127b995be32");
	level flag::wait_till(#"hash_1dd7e5ac52d2221c");
	level notify(#"hash_61e8a39b3a4bee6a");
	wait(10);
	showmiscmodels("txt_clu_fml");
	point = function_4ba8fde("item_zmintel_silver_omega_artifact_1");
	var_4da8bc2b = item_drop::drop_item(0, undefined, 1, 0, point.id, var_924f0bf0.origin, var_924f0bf0.angles, 0);
	var_4da8bc2b setscale(0.45);
	var_4da8bc2b moveto(var_924f0bf0.origin + (vectorscale((0, 0, -1), 93)), 2, 1, 1);
	var_4da8bc2b.var_dd21aec2 = 1 | 16;
	var_4da8bc2b.var_a6762160.var_4cd830a = 1;
	level flag::wait_till(#"hash_16f2a408c50fab14");
	level clientfield::increment("" + #"hash_5cf186464ce9cdd6");
	level thread namespace_2b924e50::function_4cc5fca6();
	wait(7);
	function_129e09f3();
	a_players = function_a1ef346b();
	var_f7e3ca3b = struct::get_array("mq_pto_tlpt_loc", "targetname");
	for(i = 0; i < a_players.size; i++)
	{
		var_82aaa7f4 = struct::spawn(var_f7e3ca3b[i].origin, var_f7e3ca3b[i].angles);
		a_players[i] thread zm_fasttravel::function_66d020b0(undefined, undefined, undefined, undefined, var_82aaa7f4, undefined, undefined, 1, 0, 0);
	}
	level clientfield::set("" + #"hash_51ed1d1064cfb0e", 1);
	level clientfield::set("" + #"hash_718b0f4fd6db0bb4", 1);
	function_9afd3ea2(0);
	level.no_powerups = 1;
	level flag::clear("spawn_zombies");
	level flag::set(#"pause_round_timeout");
	foreach(loc in var_bc233708)
	{
		if(!isdefined(level.var_e0712ded))
		{
			level.var_e0712ded = [];
		}
		else if(!isarray(level.var_e0712ded))
		{
			level.var_e0712ded = array(level.var_e0712ded);
		}
		level.var_e0712ded[level.var_e0712ded.size] = spawncollision(#"collision_clip_wall_128x128x10", "collider", loc.origin, loc.angles);
	}
	foreach(clip in level.var_e0712ded)
	{
		clip disconnectpaths();
	}
	scene::function_27f5972e("aib_t9_zm_silver_megaton_monologue_01");
	level.var_3df02306 = util::spawn_model(#"p9_zm_ndu_family_photo", var_ccd37052.origin, var_ccd37052.angles);
	level.var_3df02306 setscale(0.45);
	level.var_3df02306 playsound(#"");
	level flag::set(#"hash_22a4a6dd73981ef1");
	hidemiscmodels("text_clue_family");
	level flag::set(#"hash_322c7f92525e008e");
}

/*
	Name: function_9d3a3c54
	Namespace: namespace_d769652e
	Checksum: 0xCA4C30BF
	Offset: 0xB2E8
	Size: 0xB0
	Parameters: 0
	Flags: Linked
*/
function function_9d3a3c54()
{
	slots = namespace_85745671::function_bdb2b85b(self, self.origin, self.angles, 32, 10, 16);
	if(!isdefined(slots) || slots.size <= 0)
	{
		return;
	}
	self.is_active = 1;
	self.var_b79a8ac7 = {#slots:slots, #hash_f019ea1a:6000};
	level.attackables[level.attackables.size] = self;
}

/*
	Name: function_1c0daa38
	Namespace: namespace_d769652e
	Checksum: 0x3DA08313
	Offset: 0xB3A0
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_1c0daa38()
{
	self.is_active = 0;
	namespace_85745671::function_b70e2a37(self);
}

/*
	Name: function_1226c0a6
	Namespace: namespace_d769652e
	Checksum: 0x47CB0A35
	Offset: 0xB3D0
	Size: 0x1474
	Parameters: 0
	Flags: Linked
*/
function function_1226c0a6()
{
	level flag::wait_till(#"hash_322c7f92525e008e");
	level.zones[#"zone_trans_north"].is_enabled = 0;
	level.zones[#"zone_trans_north_pap_room"].is_enabled = 0;
	level.zones[#"zone_trans_south"].is_enabled = 0;
	level.zones[#"zone_trans_south_pap_room"].is_enabled = 0;
	level.zones[#"zone_trans_south_tunnel"].is_enabled = 0;
	level.zones[#"zone_power_tunnel"].is_enabled = 0;
	function_8f85d169();
	var_ccd37052 = struct::get("steiner_photo_loc", "script_noteworthy");
	var_c257a44 = struct::get("des_steiner_1", "script_noteworthy");
	var_fe76dee7 = struct::get("des_steiner_2", "script_noteworthy");
	var_28a53343 = struct::get("des_steiner_3", "script_noteworthy");
	var_ddfe70e = struct::get("rot_steiner_0", "script_noteworthy");
	var_9f3609bc = struct::get("rot_steiner_1", "script_noteworthy");
	var_b058ac01 = struct::get("rot_steiner_2", "script_noteworthy");
	s_scene = struct::get("scn_steiner_mlg", "targetname");
	var_b17c7251 = struct::get("f_steiner_sploc", "script_noteworthy");
	var_e5d4d76 = struct::get("des_steiner_0", "script_noteworthy");
	var_91a2766f = struct::get("steiner_phtloc", "script_noteworthy");
	var_65d3ed53 = getplayers().size;
	var_201095d5 = ceil(((var_65d3ed53 * 4) + 6) * 0.6);
	var_a3d1dedb = ceil(((var_65d3ed53 * 4) + 6) * 0.2);
	var_5cd38a5b = int(((var_65d3ed53 * 4) + 6) * 0.2);
	level.var_3738589 = int(5 + (var_65d3ed53 * 1));
	level.var_cc18747e = int(2 + (var_65d3ed53 * 2));
	level.var_6084dd15 = int(4 + (var_65d3ed53 * 4));
	function_b8e662e5(0);
	function_9afd3ea2(0);
	while(true)
	{
		level.var_b0eb5e2 = namespace_88795f45::function_f045e7c(var_b17c7251, 0);
		if(isdefined(level.var_b0eb5e2))
		{
			break;
		}
		waitframe(1);
	}
	level.var_b0eb5e2 namespace_88795f45::function_7e855c12(getclosestpointonnavmesh(var_e5d4d76.origin), "walk");
	if(isdefined(level.var_3df02306))
	{
		level.var_3df02306 delete();
	}
	var_aa2444c4 = spawncollision(#"hash_1d1c56a494aa468e", "collider", var_91a2766f.origin, var_91a2766f.angles);
	var_aa2444c4 setscale(2);
	music::setmusicstate("mq_8_emotional", undefined, 4);
	s_scene scene::play("aib_t9_zm_silver_megaton_monologue_01", level.var_b0eb5e2);
	scene::function_f81475ae("aib_t9_zm_silver_megaton_monologue_01");
	if(isdefined(var_aa2444c4))
	{
		var_aa2444c4 delete();
	}
	music::setmusicstate("mq_8_mid");
	level clientfield::set("" + #"hash_3fd05810b220d13a", 1);
	/#
		iprintlnbold("");
	#/
	level thread function_55958387();
	level flag::clear(#"hash_50afb2ec0a1fac0");
	level flag::clear(#"hash_a7e154a1957a04c");
	level flag::clear(#"hash_1731d238bd7ce8ad");
	level thread function_5cf1fe48(1, var_201095d5, var_a3d1dedb, var_5cd38a5b);
	level thread function_7e751ad9(0, #"hash_50afb2ec0a1fac0");
	level thread function_7e751ad9(0.33, #"hash_a7e154a1957a04c");
	level thread function_7e751ad9(0.66, #"hash_1731d238bd7ce8ad");
	level.var_581a776e = int(4 + (var_65d3ed53 * 2));
	level.var_bf3f1109 = 0;
	if(!isdefined(level.var_704c79ef))
	{
		level thread function_e59122de(level.var_cc18747e);
	}
	level flag::clear(#"hash_94bda7ad49639f5");
	level notify(#"hash_6b2607b65009a00b");
	level function_57cc7ff7();
	level thread function_21bfa736(5);
	level.var_b0eb5e2 namespace_88795f45::function_7e855c12(getclosestpointonnavmesh(var_c257a44.origin), "run");
	level flag::set(#"hash_f5da22dea5e85bf");
	level.var_b0eb5e2.ignore_player = getplayers();
	level.var_b0eb5e2 namespace_88795f45::function_c6579189(var_ddfe70e);
	var_c257a44 function_9d3a3c54();
	wait(1);
	level.var_b0eb5e2.ai.var_8c90ae8e = 1;
	level.var_b0eb5e2.pushable = 0;
	zm_sq::objective_set(#"hash_909766ed99673eb", var_c257a44, undefined, #"hash_31c12596d6427df3");
	level thread function_b2645a24(#"hash_3a617ab5e651c2a9");
	level.var_b0eb5e2 thread function_be97976d(30, 1);
	level flag::wait_till(#"hash_3a617ab5e651c2a9");
	playsoundatposition("zmb_silver_mq_9_screenshake", (582, -103, -293));
	music::setmusicstate("mq_8_low");
	zm_sq::objective_complete(#"hash_909766ed99673eb", var_c257a44);
	level.var_b0eb5e2.ai.var_8c90ae8e = 0;
	level thread function_bdd8e757();
	a_players = getplayers();
	foreach(player in a_players)
	{
		player thread clientfield::increment_to_player("" + #"hash_404a977ff0098cf", 1);
	}
	function_8d1e3ba6(1);
	var_c257a44 function_1c0daa38();
	wait(3);
	level.var_b0eb5e2 namespace_88795f45::function_7e855c12(getclosestpointonnavmesh(var_fe76dee7.origin), "run");
	level flag::set(#"hash_4f6940328c97b402");
	level flag::clear(#"hash_50afb2ec0a1fac0");
	level flag::clear(#"hash_a7e154a1957a04c");
	level flag::clear(#"hash_1731d238bd7ce8ad");
	level thread function_5cf1fe48(2, var_201095d5, var_a3d1dedb, var_5cd38a5b);
	level thread function_7e751ad9(0, #"hash_50afb2ec0a1fac0");
	level thread function_7e751ad9(0.33, #"hash_a7e154a1957a04c");
	level thread function_7e751ad9(0.66, #"hash_1731d238bd7ce8ad");
	level.var_581a776e = int(6 + (var_65d3ed53 * 2));
	level.var_bf3f1109 = 0;
	if(!isdefined(level.var_704c79ef))
	{
		level thread function_e59122de(level.var_cc18747e);
	}
	wait(0.5);
	level.var_b0eb5e2.ignore_player = getplayers();
	level.var_b0eb5e2 namespace_88795f45::function_c6579189(var_9f3609bc);
	var_fe76dee7 function_9d3a3c54();
	wait(1);
	level.var_b0eb5e2.ai.var_8c90ae8e = 1;
	level.var_b0eb5e2.pushable = 0;
	music::setmusicstate("mq_8_mid");
	zm_sq::objective_set(#"hash_909766ed99673eb", var_fe76dee7, undefined, #"hash_1a8fe6da75446f3b");
	level thread function_b2645a24(#"hash_4a49aa778b3cdd8");
	level.var_b0eb5e2 thread function_be97976d(30, 2);
	level flag::wait_till(#"hash_4a49aa778b3cdd8");
	playsoundatposition("zmb_silver_mq_9_screenshake", (582, -103, -293));
	music::setmusicstate("mq_8_low");
	zm_sq::objective_complete(#"hash_909766ed99673eb", var_fe76dee7);
	level.var_b0eb5e2.ai.var_8c90ae8e = 0;
	level thread function_bdd8e757();
	a_players = getplayers();
	foreach(player in a_players)
	{
		player thread clientfield::increment_to_player("" + #"hash_404a977ff0098cf", 1);
	}
	function_8d1e3ba6(2);
	var_fe76dee7 function_1c0daa38();
	wait(3);
	level.var_b0eb5e2 namespace_88795f45::function_7e855c12(getclosestpointonnavmesh(var_28a53343.origin), "run");
	level flag::set(#"hash_4f693f328c97b24f");
	level flag::clear(#"hash_50afb2ec0a1fac0");
	level flag::clear(#"hash_a7e154a1957a04c");
	level flag::clear(#"hash_1731d238bd7ce8ad");
	level thread function_5cf1fe48(3, var_201095d5, var_a3d1dedb, var_5cd38a5b);
	level thread function_7e751ad9(0, #"hash_50afb2ec0a1fac0");
	level thread function_7e751ad9(0.33, #"hash_a7e154a1957a04c");
	level thread function_7e751ad9(0.66, #"hash_1731d238bd7ce8ad");
	level.var_581a776e = int(8 + (var_65d3ed53 * 2));
	level.var_bf3f1109 = 0;
	if(!isdefined(level.var_704c79ef))
	{
		level thread function_e59122de(level.var_cc18747e);
	}
	wait(0.5);
	level.var_b0eb5e2.ignore_player = getplayers();
	level.var_b0eb5e2 namespace_88795f45::function_c6579189(var_b058ac01);
	var_28a53343 function_9d3a3c54();
	wait(1);
	level.var_b0eb5e2.ai.var_8c90ae8e = 1;
	level.var_b0eb5e2.pushable = 0;
	music::setmusicstate("mq_8_high");
	zm_sq::objective_set(#"hash_909766ed99673eb", var_28a53343, undefined, #"hash_464a09c2d211b73e");
	level thread function_b2645a24(#"hash_1aab687832f4e02b");
	level.var_b0eb5e2 thread function_be97976d(30, 3);
	level flag::wait_till(#"hash_1aab687832f4e02b");
	zm_sq::objective_complete(#"hash_909766ed99673eb", var_28a53343);
	playsoundatposition("zmb_silver_mq_8_alarm_progress_oneshot", (582, -103, -293));
	music::setmusicstate("mq_8_low");
	level.var_b0eb5e2.ai.var_8c90ae8e = 0;
	level thread function_bdd8e757();
	a_players = getplayers();
	foreach(player in a_players)
	{
		player thread clientfield::increment_to_player("" + #"hash_404a977ff0098cf", 1);
	}
	function_8d1e3ba6(3);
	level clientfield::set("" + #"hash_48df238a087c684e", 1);
	var_28a53343 function_1c0daa38();
	level.var_b0eb5e2 val::set(#"hash_7c1752bc83bf0b3c", "ignoreme", 1);
	function_9afd3ea2(1);
	level util::delay(25, undefined, &flag::set, #"hash_3dc9f09d14c418d9");
	level flag::wait_till(#"hash_3dc9f09d14c418d9");
}

/*
	Name: function_b2645a24
	Namespace: namespace_d769652e
	Checksum: 0x9DA83C24
	Offset: 0xC850
	Size: 0x90
	Parameters: 1
	Flags: Linked
*/
function function_b2645a24(complete_notify)
{
	self notify("5f7a2261c0550ba");
	self endon("5f7a2261c0550ba");
	level endon(#"end_game", complete_notify);
	while(true)
	{
		waitresult = undefined;
		waitresult = level waittill(#"hash_2af49a26c2d2b8");
		level zm_sq::sndonoverride_eye_(waitresult.progress);
	}
}

/*
	Name: function_39f889a2
	Namespace: namespace_d769652e
	Checksum: 0x98BAECA5
	Offset: 0xC8E8
	Size: 0x4A8
	Parameters: 0
	Flags: Linked
*/
function function_39f889a2()
{
	level endon(#"end_game");
	level util::delay_notify(40, #"hash_4e734bad5161c1e7");
	level waittill(#"hash_4e734bad5161c1e7");
	level notify(#"hash_795783e3edb7670");
	level flag::set(#"hash_6dae739b31c68d72");
	/#
		iprintlnbold("");
	#/
	music::setmusicstate("silver_mq_exfil");
	level thread exfil_aether_trigger();
	function_b86587a6();
	level.zones[#"zone_trans_north"].is_enabled = 1;
	level.zones[#"zone_trans_north_pap_room"].is_enabled = 1;
	level.zones[#"zone_trans_south"].is_enabled = 1;
	level.zones[#"zone_trans_south_pap_room"].is_enabled = 1;
	level.zones[#"zone_trans_south_tunnel"].is_enabled = 1;
	level.zones[#"zone_power_tunnel"].is_enabled = 1;
	level clientfield::set("" + #"hash_718b0f4fd6db0bb4", 0);
	foreach(clip in level.var_e0712ded)
	{
		clip connectpaths();
	}
	foreach(clip in level.var_e0712ded)
	{
		if(isdefined(clip))
		{
			clip delete();
		}
	}
	level function_3b4a24e2();
	level thread function_cc7a52ed();
	level thread function_d53c41b3();
	level thread function_fb092189("weapon_lab_spawned", "mq_exfil_spawn_trigger_wlb", "mq_exfil_direct_spawn_loc_wlb");
	level thread function_fb092189("medical_lab_spawned", "mq_exfil_spawn_trigger_mlb", "mq_exfil_direct_spawn_loc_mlb");
	level thread function_fb092189("tunnel_spawned", "mq_exfil_spawn_trigger_tnl", "mq_exfil_direct_spawn_loc_tnl");
	level thread function_fb092189("yard_spawned", "mq_exfil_spawn_trigger_yrd", "mq_exfil_direct_spawn_loc_yrd");
	level thread function_fb092189("crash_site_spawned", "mq_exfil_spawn_trigger_crsh", "mq_exfil_direct_spawn_loc_crsh");
	level clientfield::set("" + #"hash_5c2cc65ae866b3f4", 1);
	level.var_fdcaf3a6 waittill(#"objective_ended");
}

/*
	Name: function_3b4a24e2
	Namespace: namespace_d769652e
	Checksum: 0xBF125D34
	Offset: 0xCD98
	Size: 0x374
	Parameters: 0
	Flags: Linked
*/
function function_3b4a24e2()
{
	if(isdefined(level.var_fdcaf3a6))
	{
		return;
	}
	foreach(destination in level.var_7d45d0d4.var_d60029a6)
	{
		if(destination.targetname === "zm_silver_destination")
		{
			instance = namespace_591b4396::function_5a957da0(destination);
			break;
		}
	}
	/#
		assert(isdefined(instance));
	#/
	level.var_fdcaf3a6 = instance;
	level.no_powerups = 1;
	level flag::wait_till(#"gameplay_started");
	script = namespace_8b6a9d79::function_85255d0f(instance.content_script_name);
	objective_manager::function_9751c453(script.var_331b7cc3, instance.var_fe2612fe[#"hash_216188a7e7b381a6"][0].origin, instance);
	if(level clientfield::get("dog_round_fog_bank"))
	{
		level thread clientfield::set("dog_round_fog_bank", 0);
	}
	level callback::callback(#"hash_594217387367ebb4");
	var_28bf3706 = instance.var_fe2612fe[#"heli_spawn"][0];
	var_3ec7083c = instance.var_fe2612fe[#"hash_216188a7e7b381a6"][0];
	if(!isdefined(var_3ec7083c.radius))
	{
		var_3ec7083c.radius = 2000;
	}
	if(!isdefined(var_3ec7083c.height))
	{
		var_3ec7083c.height = 500;
	}
	var_3ec7083c.radius = int(var_3ec7083c.radius);
	var_3ec7083c.height = int(var_3ec7083c.height);
	if(isdefined(level.var_26ed6a07))
	{
		var_3ec7083c.radius = level.var_26ed6a07;
	}
	if(isdefined(level.var_c86f12d4))
	{
		var_3ec7083c.height = level.var_c86f12d4;
	}
	level thread function_664ae3fd();
	level thread function_3d325174();
	level thread function_25dd8ca9(var_28bf3706, var_3ec7083c);
	level thread function_ba172400();
	level thread function_31125f54(#"hash_139be8e926dda5d5");
}

/*
	Name: function_3d325174
	Namespace: namespace_d769652e
	Checksum: 0x9C5EC5C6
	Offset: 0xD118
	Size: 0xEC
	Parameters: 0
	Flags: Linked
*/
function function_3d325174()
{
	var_652c0aa1 = 0;
	while(!var_652c0aa1)
	{
		foreach(player in getplayers())
		{
			if(player zm_zonemgr::is_player_in_zone(level.var_ad5e81fe))
			{
				var_652c0aa1 = 1;
				break;
			}
		}
		wait(0.5);
	}
	level flag::set(#"hash_3babb5bf72d208da");
}

/*
	Name: function_25dd8ca9
	Namespace: namespace_d769652e
	Checksum: 0x83059367
	Offset: 0xD210
	Size: 0x14C
	Parameters: 2
	Flags: Linked
*/
function function_25dd8ca9(var_28bf3706, var_3ec7083c)
{
	waitresult = level flag::wait_till_timeout(10, #"hash_3babb5bf72d208da");
	/#
		iprintlnbold("");
	#/
	do
	{
		waitframe(1);
		level.var_117d5f10 = vehicle::spawn(undefined, "exfil_heli", #"hash_437293ae239af1ab", var_28bf3706.origin, var_28bf3706.angles);
	}
	while(!isdefined(level.var_117d5f10));
	level.var_117d5f10 function_d733412a(0);
	level.var_117d5f10 thread namespace_591b4396::function_c70a47c(var_3ec7083c);
	wait(10);
	if(!is_true(level.var_979630b4))
	{
		level.var_979630b4 = 1;
		zm_vo::function_7622cb70(#"hash_17a5b1277d5ccb3b");
	}
}

/*
	Name: function_ba172400
	Namespace: namespace_d769652e
	Checksum: 0xA06AE5B2
	Offset: 0xD368
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function function_ba172400()
{
	level flag::wait_till_all(array("exfil_heli_arrived", #"hash_3babb5bf72d208da"));
	waitframe(1);
	level flag::set(#"exfil_cleared");
}

/*
	Name: function_664ae3fd
	Namespace: namespace_d769652e
	Checksum: 0x4760C20F
	Offset: 0xD3D8
	Size: 0x15C
	Parameters: 0
	Flags: Linked
*/
function function_664ae3fd()
{
	level endon(#"objective_ended");
	foreach(player in getplayers())
	{
		level.var_31028c5d prototype_hud::set_active_objective_string(player, #"hash_2138b0d3ea594968");
		level.var_31028c5d prototype_hud::set_active_obj_visibility(player, 1);
	}
	level thread objective_manager::start_timer(90, "exfil");
	level thread function_c504b2d1();
	level thread function_8fcb0a(90);
	array::thread_all(getplayers(), &function_f885bcd1);
}

/*
	Name: function_8fcb0a
	Namespace: namespace_d769652e
	Checksum: 0x444F9787
	Offset: 0xD540
	Size: 0x314
	Parameters: 1
	Flags: Linked
*/
function function_8fcb0a(var_3aeede0b)
{
	level endon(#"objective_ended", #"hash_158779eefe4893d1", #"hash_4fbe4720f6f13107", #"end_game");
	if(var_3aeede0b >= 60)
	{
		var_cb54863d = var_3aeede0b - 60.4;
		wait(var_cb54863d);
		level thread namespace_51d1d6a3::function_5bd32264(#"hash_a20a9fe0eca6e47");
		wait(15);
		if(!is_true(level.var_979630b4))
		{
			level.var_979630b4 = 1;
			level thread zm_vo::function_7622cb70(#"hash_17a5b1277d5ccb3b");
		}
		wait(15);
		level thread zm_vo::function_7622cb70(#"hash_5d7eb59f636a2e09");
		level thread namespace_51d1d6a3::function_5bd32264(#"hash_4c20a2b005668364");
		wait(10);
		level thread namespace_51d1d6a3::function_5bd32264(#"hash_70a4846d29e9194b");
		wait(5);
		level thread zm_vo::function_7622cb70(#"hash_dea3051b8e963f2");
		wait(5);
		level thread namespace_51d1d6a3::function_5bd32264(#"hash_efaab96dfce6fd");
		wait(1);
		level thread namespace_51d1d6a3::function_5bd32264(#"hash_efa9b96dfce54a");
		wait(1);
		level thread namespace_51d1d6a3::function_5bd32264(#"hash_efa8b96dfce397");
		wait(1);
		level thread namespace_51d1d6a3::function_5bd32264(#"hash_efa7b96dfce1e4");
		wait(1);
		level thread namespace_51d1d6a3::function_5bd32264(#"hash_efa6b96dfce031");
		wait(1);
		level thread namespace_51d1d6a3::function_5bd32264(#"hash_efa5b96dfcde7e");
		wait(1);
		level thread namespace_51d1d6a3::function_5bd32264(#"hash_efa4b96dfcdccb");
		wait(1);
		level thread namespace_51d1d6a3::function_5bd32264(#"hash_efa3b96dfcdb18");
		wait(1);
		level thread namespace_51d1d6a3::function_5bd32264(#"hash_efa2b96dfcd965");
		wait(1);
		level thread namespace_51d1d6a3::function_5bd32264(#"hash_efa1b96dfcd7b2");
	}
}

/*
	Name: function_f885bcd1
	Namespace: namespace_d769652e
	Checksum: 0xD61EAFC9
	Offset: 0xD860
	Size: 0x19C
	Parameters: 0
	Flags: Linked
*/
function function_f885bcd1()
{
	self endon(#"death");
	self.v_train_inbound_igc = 0;
	while(!level flag::get(#"exfil_cleared") || !level flag::get(#"hash_fdc24944f59c262"))
	{
		if(is_true(self.var_2c27f919) || (!self.v_train_inbound_igc && self namespace_591b4396::function_591cb2f4()))
		{
			level flag::set(#"hash_fdc24944f59c262");
			if(!level flag::get(#"exfil_cleared"))
			{
				level.var_31028c5d prototype_hud::set_active_objective_string(self, #"hash_caeceb18a45aa58");
			}
			self.v_train_inbound_igc = 1;
		}
		else if(self.v_train_inbound_igc && !self namespace_591b4396::function_591cb2f4())
		{
			level.var_31028c5d prototype_hud::set_active_objective_string(self, #"hash_2138b0d3ea594968");
			self.v_train_inbound_igc = 0;
		}
		wait(0.5);
	}
}

/*
	Name: function_c504b2d1
	Namespace: namespace_d769652e
	Checksum: 0xB8306D98
	Offset: 0xDA08
	Size: 0x70
	Parameters: 0
	Flags: Linked
*/
function function_c504b2d1()
{
	level endon(#"objective_ended", #"hash_4fbe4720f6f13107");
	level waittill(#"hash_158779eefe4893d1");
	level notify(#"hash_4fbe4720f6f13107", {#b_success:0});
}

/*
	Name: function_31125f54
	Namespace: namespace_d769652e
	Checksum: 0x93164B01
	Offset: 0xDA80
	Size: 0x60C
	Parameters: 1
	Flags: Linked
*/
function function_31125f54(var_8bb7479c)
{
	level thread scene::init_streamer(var_8bb7479c, getplayers(), 0, 0);
	waitresult = undefined;
	waitresult = level waittill(#"hash_4fbe4720f6f13107");
	level.var_117d5f10 makevehicleunusable();
	objective_setinvisibletoall(level.var_fdcaf3a6.var_e55c8b4e);
	level.var_117d5f10.animname = "helicopter";
	if(isdefined(level.var_fdcaf3a6.trigger))
	{
		level.var_fdcaf3a6.trigger delete();
	}
	level clientfield::set("" + #"hash_3fd05810b220d13a", 0);
	b_success = waitresult.b_success;
	if(b_success)
	{
		music::setmusicstate("silver_mq_exfil_success");
		foreach(player in function_a1ef346b())
		{
			player val::set("exfil", "takedamage", 0);
			player val::set("exfil", "allowdeath", 0);
			player namespace_d4ecbbf0::function_3a2e46e0(1);
			player zm_stats::increment_challenge_stat(#"hash_1a7ff6d1e1ff03b0");
		}
		foreach(player in getplayers())
		{
			player.pers[#"outcome"] = #"win";
		}
		level thread namespace_591b4396::function_a7394b94(1);
		level namespace_ee0fc845::function_4b29f610();
		level.var_117d5f10 unlink();
		level notify(#"hash_343f8b4d163b808f");
		level flag::set(#"main_quest_completed");
		level scene::play(var_8bb7479c, level.var_117d5f10);
		array::thread_all(getplayers(), &function_ee6da6f6);
	}
	else
	{
		music::setmusicstate("");
		playsoundatposition(#"hash_40520cccacd1532e", (0, 0, 0));
		foreach(player in getplayers())
		{
			if(isdefined(var_8bb7479c) && isarray(player.var_231881b1) && isdefined(player.var_231881b1[var_8bb7479c]))
			{
				player playerstreamerrequest("clear", player.var_231881b1[var_8bb7479c]);
			}
		}
		level thread namespace_591b4396::function_a7394b94(0);
		array::thread_all(getplayers(), &function_1af4f450);
		wait(4);
		array::thread_all(getplayers(), &function_ee6da6f6);
	}
	level notify(#"objective_ended", {#completed:b_success});
	level callback::callback(#"objective_ended", {#completed:b_success, #instance:level.var_fdcaf3a6});
	level.var_fdcaf3a6.success = b_success;
	level.var_fdcaf3a6 notify(#"objective_ended");
}

/*
	Name: function_1af4f450
	Namespace: namespace_d769652e
	Checksum: 0xDCFD299B
	Offset: 0xE098
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function function_1af4f450()
{
	self endon(#"disconnect");
	self clientfield::set_to_player("" + #"hash_41658211f38c2b02", 1);
	wait(2);
	self lui::screen_fade_out(2, (1, 1, 1));
}

/*
	Name: function_ee6da6f6
	Namespace: namespace_d769652e
	Checksum: 0xA659A3C1
	Offset: 0xE108
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_ee6da6f6()
{
	self thread lui::screen_fade_out(0, (0, 0, 0), "end_game_blackscreen");
}

/*
	Name: exfil_aether_trigger
	Namespace: namespace_d769652e
	Checksum: 0x32F1F0AA
	Offset: 0xE138
	Size: 0xB8
	Parameters: 0
	Flags: Linked
*/
function exfil_aether_trigger()
{
	level thread function_c5d3e5c();
	foreach(e_trigger in getentarray("exfil_aether_trigger", "targetname"))
	{
		e_trigger thread function_34d3837d();
	}
}

/*
	Name: function_34d3837d
	Namespace: namespace_d769652e
	Checksum: 0x291A36A
	Offset: 0xE1F8
	Size: 0x74
	Parameters: 0
	Flags: Linked
*/
function function_34d3837d()
{
	level endon(#"end_game", #"exfil_aether_trigger");
	self endon(#"death");
	self waittill(#"trigger");
	level flag::set(#"exfil_aether_trigger");
}

/*
	Name: function_c5d3e5c
	Namespace: namespace_d769652e
	Checksum: 0x7CB5CF82
	Offset: 0xE278
	Size: 0x12C
	Parameters: 0
	Flags: Linked
*/
function function_c5d3e5c()
{
	level endon(#"end_game");
	level flag::wait_till(#"exfil_aether_trigger");
	var_a0b86b5f = getentarray("exfil_aether_damage", "targetname");
	foreach(e_trigger in var_a0b86b5f)
	{
		/#
			e_trigger thread function_7a4e3128(#"main_quest_completed");
		#/
		e_trigger thread watch_for_player_trigger();
	}
	level thread function_58ce052e(1);
}

/*
	Name: function_58ce052e
	Namespace: namespace_d769652e
	Checksum: 0xC9A3C49C
	Offset: 0xE3B0
	Size: 0x170
	Parameters: 1
	Flags: Linked
*/
function function_58ce052e(b_enable)
{
	var_f04dd3ef = getentarray("exfil_aether_clip", "targetname");
	if(b_enable)
	{
		foreach(e_clip in var_f04dd3ef)
		{
			e_clip solid();
			e_clip disconnectpaths();
		}
	}
	else
	{
		foreach(e_clip in var_f04dd3ef)
		{
			e_clip notsolid();
			e_clip connectpaths();
		}
	}
}

/*
	Name: watch_for_player_trigger
	Namespace: namespace_d769652e
	Checksum: 0x8A1B7011
	Offset: 0xE528
	Size: 0xB0
	Parameters: 0
	Flags: Linked
*/
function watch_for_player_trigger()
{
	level endon(#"end_game");
	self endon(#"death");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"trigger");
		e_activator = waitresult.activator;
		if(isplayer(e_activator) && !isdefined(e_activator.var_ccc1bcbf))
		{
			self thread function_bf287595(e_activator);
		}
	}
}

/*
	Name: function_bf287595
	Namespace: namespace_d769652e
	Checksum: 0x1EC6E4A
	Offset: 0xE5E0
	Size: 0x13E
	Parameters: 1
	Flags: Linked
*/
function function_bf287595(e_player)
{
	level endon(#"end_game");
	e_player endon(#"death", #"disconnect");
	e_player.var_ccc1bcbf = self;
	e_player clientfield::set_to_player("" + #"hash_3cc984f9a32f1508", 1);
	while(e_player istouching(self) && isalive(e_player))
	{
		e_player dodamage(25, self.origin, self, self, "none", "MOD_DOT");
		wait(0.25);
	}
	e_player clientfield::set_to_player("" + #"hash_3cc984f9a32f1508", 0);
	e_player.var_ccc1bcbf = undefined;
}

/*
	Name: function_8d1e3ba6
	Namespace: namespace_d769652e
	Checksum: 0x7301DB61
	Offset: 0xE728
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function function_8d1e3ba6(n_wave)
{
	level clientfield::set("" + #"hash_17466a1bb2380af6", n_wave);
}

/*
	Name: revive_players
	Namespace: namespace_d769652e
	Checksum: 0x6C7F9091
	Offset: 0xE770
	Size: 0x16
	Parameters: 0
	Flags: Linked
*/
function revive_players()
{
	self notify(#"auto_revive");
}

/*
	Name: function_8d1b6fd8
	Namespace: namespace_d769652e
	Checksum: 0xBA928099
	Offset: 0xE790
	Size: 0x17C
	Parameters: 4
	Flags: Linked
*/
function function_8d1b6fd8(var_26fccdce, var_6f9a60d5, var_80e903b2, var_465f425d)
{
	self endon(#"hash_d215e9a497df471", #"death");
	var_d32ad63c = struct::get("steiner_left_levitate", "targetname");
	self.pushable = 0;
	var_26fccdce.origin = self.origin;
	self linktoblendtotag(var_26fccdce);
	var_26fccdce moveto(var_6f9a60d5.origin, 2.5, 0.5, 0);
	var_d32ad63c thread scene::play("aib_t9_vign_cust_zm_silver_steiner_left_levitate", var_465f425d);
	var_26fccdce waittill(#"movedone");
	var_26fccdce moveto(var_80e903b2.origin, 2.5, 0, 0.5);
	var_26fccdce waittill(#"movedone");
	self flag::set(#"hash_d215e9a497df471");
}

/*
	Name: function_b6a1fe09
	Namespace: namespace_d769652e
	Checksum: 0x5491E0CC
	Offset: 0xE918
	Size: 0x132
	Parameters: 0
	Flags: Linked, Private
*/
function private function_b6a1fe09()
{
	steiners = getaiarchetypearray(#"hash_7c0d83ac1e845ac2");
	var_3fa8bde0 = [];
	foreach(steiner in steiners)
	{
		if(isalive(steiner) && steiner.team == #"allies")
		{
			if(!isdefined(var_3fa8bde0))
			{
				var_3fa8bde0 = [];
			}
			else if(!isarray(var_3fa8bde0))
			{
				var_3fa8bde0 = array(var_3fa8bde0);
			}
			var_3fa8bde0[var_3fa8bde0.size] = steiner;
		}
	}
	return var_3fa8bde0;
}

/*
	Name: function_9951a0d8
	Namespace: namespace_d769652e
	Checksum: 0x2740905E
	Offset: 0xEA58
	Size: 0x174
	Parameters: 0
	Flags: Linked
*/
function function_9951a0d8()
{
	self endon(#"disconnect");
	level endon(#"hash_16f2a408c50fab14");
	while(true)
	{
		var_2f39336 = self zm_zonemgr::get_player_zone();
		self waittill(#"zone_change");
		if(isdefined(var_2f39336))
		{
			if(is_true(level.var_a760155a.var_2c085075) && (var_2f39336 == "zone_trans_south_tunnel" && self.cached_zone_name == "zone_center_upper_west" || (var_2f39336 == "zone_trans_north" && self.cached_zone_name == "zone_center_upper_north") || (var_2f39336 == "zone_power_tunnel" && self.cached_zone_name == "zone_center_upper") || (var_2f39336 == "zone_power_tunnel" && self.cached_zone_name == "zone_center_lower")) && randomfloat(1) > 0.2)
			{
				level notify(#"hash_59b1c24ec69056a4");
			}
		}
	}
}

/*
	Name: function_abc0783b
	Namespace: namespace_d769652e
	Checksum: 0x5B5FDFD1
	Offset: 0xEBD8
	Size: 0x114
	Parameters: 1
	Flags: Linked
*/
function function_abc0783b(var_3e9e754f)
{
	var_fe2f597c = getent(var_3e9e754f, "script_noteworthy");
	level.var_a760155a = spawnstruct();
	level.var_a760155a.var_52fca55d = array(#"hash_2bf59e0b5ced6c91", #"hash_2bf59d0b5ced6ade", #"hash_2bf59c0b5ced692b", #"hash_2bf59b0b5ced6778", #"hash_2bf5a20b5ced735d");
	level.var_a760155a.var_400dbfbb = 0;
	level.var_a760155a.var_2c085075 = 1;
	var_fe2f597c thread function_52a4f924();
	var_fe2f597c thread function_6a06cd37();
}

/*
	Name: function_6a06cd37
	Namespace: namespace_d769652e
	Checksum: 0x7C62FFAB
	Offset: 0xECF8
	Size: 0xB0
	Parameters: 0
	Flags: Linked
*/
function function_6a06cd37()
{
	self endon(#"death");
	level endon(#"hash_59b1c24ec69056a4", #"hash_22a4a6dd73981ef1");
	n_delay = randomintrange(4, 7);
	wait(n_delay);
	while(true)
	{
		self zm_vo::function_d6f8bbd9(#"hash_29e1c245fd42f854");
		n_delay = randomintrange(20, 40);
		wait(n_delay);
	}
}

/*
	Name: function_52a4f924
	Namespace: namespace_d769652e
	Checksum: 0xD4943504
	Offset: 0xEDB0
	Size: 0x172
	Parameters: 0
	Flags: Linked
*/
function function_52a4f924()
{
	self endon(#"death");
	level endon(#"hash_22a4a6dd73981ef1", #"death");
	while(true)
	{
		level waittill(#"hash_59b1c24ec69056a4");
		if(level.var_a760155a.var_400dbfbb < level.var_a760155a.var_52fca55d.size)
		{
			/#
				iprintlnbold("" + level.var_a760155a.var_400dbfbb);
			#/
			self zm_vo::function_d6f8bbd9(level.var_a760155a.var_52fca55d[level.var_a760155a.var_400dbfbb]);
			level.var_a760155a.var_400dbfbb++;
			level flag::set(#"hash_781cedacdfef3f84");
		}
		else
		{
			level.var_a760155a.var_2c085075 = 0;
			break;
		}
		level.var_a760155a.var_2c085075 = 0;
		wait(20);
		level.var_a760155a.var_2c085075 = 1;
	}
}

/*
	Name: function_77e5b46f
	Namespace: namespace_d769652e
	Checksum: 0xEF76F1CC
	Offset: 0xEF30
	Size: 0x1FA
	Parameters: 0
	Flags: Linked
*/
function function_77e5b46f()
{
	level endon(#"hash_6b2607b65009a00b");
	while(true)
	{
		a_players = getplayers();
		foreach(player in a_players)
		{
			var_c512de04 = player zm_zonemgr::get_player_zone();
			if(level flag::get(#"dark_aether_active"))
			{
				player clientfield::set("" + #"hash_63af42145e260fb5", 2);
				continue;
			}
			if(var_c512de04 === "zone_center_upper" || var_c512de04 === "zone_center_lower" || var_c512de04 === "zone_center_upper_north" || var_c512de04 === "zone_center_upper_west" && !player util::is_spectating())
			{
				player clientfield::set("" + #"hash_63af42145e260fb5", 1);
				continue;
			}
			player clientfield::set("" + #"hash_63af42145e260fb5", 0);
		}
		wait(1);
	}
}

/*
	Name: function_57cc7ff7
	Namespace: namespace_d769652e
	Checksum: 0xF7218FDA
	Offset: 0xF138
	Size: 0xC0
	Parameters: 0
	Flags: Linked
*/
function function_57cc7ff7()
{
	a_players = getplayers();
	foreach(player in a_players)
	{
		player clientfield::set("" + #"hash_63af42145e260fb5", 0);
	}
}

/*
	Name: function_5cf1fe48
	Namespace: namespace_d769652e
	Checksum: 0xFAB1993E
	Offset: 0xF200
	Size: 0x30C
	Parameters: 4
	Flags: Linked
*/
function function_5cf1fe48(n_current_wave, var_201095d5, var_a3d1dedb, var_5cd38a5b)
{
	level flag::wait_till(#"hash_50afb2ec0a1fac0");
	level.var_b3d5a24f = 0;
	level.var_90f0a494 = [];
	level thread function_912f5a00(var_201095d5, #"hash_a7e154a1957a04c");
	level thread function_c6bf1890(var_a3d1dedb, #"hash_a7e154a1957a04c");
	level thread function_d6ff31d6(var_5cd38a5b, #"hash_a7e154a1957a04c");
	level thread function_969699c6();
	if(n_current_wave > 1)
	{
		function_637141d0();
	}
	level flag::wait_till(#"hash_a7e154a1957a04c");
	level.var_b3d5a24f = 0;
	level.var_90f0a494 = [];
	level thread function_912f5a00(var_201095d5, #"hash_1731d238bd7ce8ad");
	level thread function_c6bf1890(var_a3d1dedb, #"hash_1731d238bd7ce8ad");
	level thread function_d6ff31d6(var_5cd38a5b, #"hash_1731d238bd7ce8ad");
	level thread function_969699c6();
	level flag::wait_till(#"hash_1731d238bd7ce8ad");
	level.var_b3d5a24f = 0;
	level.var_90f0a494 = [];
	switch(n_current_wave)
	{
		case 1:
		{
			var_790823ce = #"hash_3a617ab5e651c2a9";
			break;
		}
		case 2:
		{
			var_790823ce = #"hash_4a49aa778b3cdd8";
			break;
		}
		case 3:
		{
			var_790823ce = #"hash_1aab687832f4e02b";
			break;
		}
	}
	level thread function_912f5a00(var_201095d5, var_790823ce);
	level thread function_c6bf1890(var_a3d1dedb, var_790823ce);
	level thread function_d6ff31d6(var_5cd38a5b, var_790823ce);
	level thread function_969699c6();
}

/*
	Name: function_7e751ad9
	Namespace: namespace_d769652e
	Checksum: 0x80F1AFAC
	Offset: 0xF518
	Size: 0x7E
	Parameters: 2
	Flags: Linked
*/
function function_7e751ad9(var_f870ca5, var_2c1b9289)
{
	level endon(var_2c1b9289);
	while(true)
	{
		waitresult = undefined;
		waitresult = level waittill(#"hash_2af49a26c2d2b8");
		if(waitresult.progress > var_f870ca5)
		{
			level flag::set(var_2c1b9289);
		}
		waitframe(1);
	}
}

/*
	Name: function_912f5a00
	Namespace: namespace_d769652e
	Checksum: 0x64F3B9CE
	Offset: 0xF5A0
	Size: 0xB6
	Parameters: 2
	Flags: Linked
*/
function function_912f5a00(var_ee4872c1, str_endon_flag)
{
	level endon(str_endon_flag, #"hash_2281b58db5d2dad");
	level.var_fc5dfa9 = gettime();
	while(true)
	{
		function_1eaaceab(level.var_46a47223);
		if(gettime() >= level.var_fc5dfa9)
		{
			if(level.var_46a47223.size < var_ee4872c1)
			{
				function_5237db24();
				level.var_fc5dfa9 = gettime() + 500;
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_5237db24
	Namespace: namespace_d769652e
	Checksum: 0xEDD1B253
	Offset: 0xF660
	Size: 0xD4
	Parameters: 0
	Flags: Linked
*/
function function_5237db24()
{
	ai = zombie_utility::spawn_zombie(level.zombie_spawners[0], undefined, undefined, 20);
	if(isdefined(ai))
	{
		set_zombie(ai);
		if(!isdefined(level.var_46a47223))
		{
			level.var_46a47223 = [];
		}
		else if(!isarray(level.var_46a47223))
		{
			level.var_46a47223 = array(level.var_46a47223);
		}
		level.var_46a47223[level.var_46a47223.size] = ai;
	}
	return ai;
}

/*
	Name: function_c6bf1890
	Namespace: namespace_d769652e
	Checksum: 0x46087993
	Offset: 0xF740
	Size: 0x20A
	Parameters: 2
	Flags: Linked
*/
function function_c6bf1890(var_ee4872c1, str_endon_flag)
{
	level endon(str_endon_flag, #"hash_2281b58db5d2dad");
	level.var_a36cb684 = gettime();
	var_9677f2f9 = undefined;
	foreach(sp_zombie in level.zombie_spawners)
	{
		if(is_true(sp_zombie.var_5d6331b7))
		{
			var_9677f2f9 = sp_zombie;
		}
	}
	while(true)
	{
		function_1eaaceab(level.var_c8dda611);
		if(gettime() >= level.var_a36cb684)
		{
			if(level.var_c8dda611.size < var_ee4872c1)
			{
				ai = zombie_utility::spawn_zombie(var_9677f2f9, undefined, undefined, 20);
				if(isdefined(ai))
				{
					set_zombie(ai);
					if(!isdefined(level.var_c8dda611))
					{
						level.var_c8dda611 = [];
					}
					else if(!isarray(level.var_c8dda611))
					{
						level.var_c8dda611 = array(level.var_c8dda611);
					}
					level.var_c8dda611[level.var_c8dda611.size] = ai;
					level.var_a36cb684 = gettime() + 1500;
				}
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_d6ff31d6
	Namespace: namespace_d769652e
	Checksum: 0x1ECB7992
	Offset: 0xF958
	Size: 0x172
	Parameters: 2
	Flags: Linked
*/
function function_d6ff31d6(var_ee4872c1, str_endon_flag)
{
	level endon(str_endon_flag, #"hash_2281b58db5d2dad");
	level.var_c7557d2f = gettime();
	while(true)
	{
		function_1eaaceab(level.var_41a245ae);
		if(gettime() >= level.var_c7557d2f)
		{
			if(level.var_41a245ae.size < var_ee4872c1)
			{
				ai = function_cce73165("dog_location", #"hash_12a17ab3df5889eb", "zone_center_upper");
				if(isdefined(ai))
				{
					ai.no_powerups = 1;
					if(!isdefined(level.var_41a245ae))
					{
						level.var_41a245ae = [];
					}
					else if(!isarray(level.var_41a245ae))
					{
						level.var_41a245ae = array(level.var_41a245ae);
					}
					level.var_41a245ae[level.var_41a245ae.size] = ai;
					level.var_c7557d2f = gettime() + 2500;
				}
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_969699c6
	Namespace: namespace_d769652e
	Checksum: 0xA226072E
	Offset: 0xFAD8
	Size: 0x7E
	Parameters: 0
	Flags: Linked
*/
function function_969699c6()
{
	level endon(#"hash_4e68fa195d35d63f");
	while(true)
	{
		if(level.var_90f0a494.size >= level.var_3738589)
		{
			level flag::set(#"hash_4e68fa195d35d63f");
		}
		function_78507a9f(level.var_3738589);
		waitframe(1);
	}
}

/*
	Name: function_74e188b0
	Namespace: namespace_d769652e
	Checksum: 0x2D361EB1
	Offset: 0xFB60
	Size: 0x6C
	Parameters: 2
	Flags: Linked
*/
function function_74e188b0(n_wait_time, var_b2eb7b6b)
{
	if(level flag::get(#"hash_4e68fa195d35d63f") && level.var_b3d5a24f <= level.var_6084dd15)
	{
		wait(n_wait_time);
		function_78507a9f(var_b2eb7b6b);
	}
}

/*
	Name: function_78507a9f
	Namespace: namespace_d769652e
	Checksum: 0x5EBA4A2E
	Offset: 0xFBD8
	Size: 0x23C
	Parameters: 1
	Flags: Linked
*/
function function_78507a9f(var_b2eb7b6b)
{
	var_7fbbd018 = undefined;
	var_67840931 = 0;
	a_attackers = [];
	if(level.var_c8dda611.size > 0 && level.var_46a47223.size > 0)
	{
		a_attackers = arraycombine(level.var_c8dda611, level.var_46a47223);
	}
	if(level.var_90f0a494.size < var_b2eb7b6b)
	{
		if(a_attackers.size > 0)
		{
			foreach(attacker in a_attackers)
			{
				if(!isinarray(level.var_90f0a494, attacker))
				{
					var_7fbbd018 = attacker;
					var_67840931 = 1;
					break;
				}
			}
			if(!is_true(var_67840931))
			{
				var_7fbbd018 = function_5237db24();
			}
		}
		else
		{
			var_7fbbd018 = function_5237db24();
		}
		if(isdefined(var_7fbbd018))
		{
			var_7fbbd018.var_12af7864 = 0;
			if(!isdefined(level.var_90f0a494))
			{
				level.var_90f0a494 = [];
			}
			else if(!isarray(level.var_90f0a494))
			{
				level.var_90f0a494 = array(level.var_90f0a494);
			}
			level.var_90f0a494[level.var_90f0a494.size] = var_7fbbd018;
			level.var_b3d5a24f = level.var_b3d5a24f + 1;
		}
	}
}

/*
	Name: function_55958387
	Namespace: namespace_d769652e
	Checksum: 0x45DCF416
	Offset: 0xFE20
	Size: 0x7E
	Parameters: 0
	Flags: Linked
*/
function function_55958387()
{
	level endon(#"hash_1aab687832f4e02b");
	while(true)
	{
		function_1eaaceab(level.var_90f0a494);
		if(level.var_b3d5a24f > level.var_6084dd15)
		{
			level flag::set(#"hash_2281b58db5d2dad");
		}
		waitframe(1);
	}
}

/*
	Name: function_637141d0
	Namespace: namespace_d769652e
	Checksum: 0xE2060C57
	Offset: 0xFEA8
	Size: 0x92
	Parameters: 0
	Flags: Linked
*/
function function_637141d0()
{
	if(level.var_90f0a494.size > 0)
	{
		foreach(attacker in level.var_90f0a494)
		{
			attacker.var_12af7864 = 0;
		}
	}
}

/*
	Name: function_e59122de
	Namespace: namespace_d769652e
	Checksum: 0x7277045F
	Offset: 0xFF48
	Size: 0xB6
	Parameters: 1
	Flags: Linked
*/
function function_e59122de(var_14fd7c9)
{
	level endon(#"hash_6d5f0babef82cff6");
	var_39c83b76 = struct::get("mq_hvt_steiner_spawner", "script_noteworthy");
	var_cd7e3d74 = gettime() + 15000;
	while(true)
	{
		if(gettime() >= var_cd7e3d74)
		{
			function_cf8d916f(var_14fd7c9);
			level flag::set(#"hash_6d5f0babef82cff6");
		}
		waitframe(1);
	}
}

/*
	Name: function_cf8d916f
	Namespace: namespace_d769652e
	Checksum: 0xD6571137
	Offset: 0x10008
	Size: 0xCC
	Parameters: 1
	Flags: Linked
*/
function function_cf8d916f(var_14fd7c9)
{
	level.var_704c79ef = function_cce73165("steiner_location", #"hash_53f4e0daa341a161", "zone_center_upper");
	function_480605d8(level.var_704c79ef, 1);
	if(isdefined(level.var_704c79ef))
	{
		level.var_704c79ef.ai.var_4beb90f3 = 0;
		level.var_704c79ef thread function_106bc9f8(var_14fd7c9);
		level.var_704c79ef thread function_d76cb937(var_14fd7c9);
	}
}

/*
	Name: function_d76cb937
	Namespace: namespace_d769652e
	Checksum: 0xEBA4751A
	Offset: 0x100E0
	Size: 0x310
	Parameters: 1
	Flags: Linked
*/
function function_d76cb937(var_14fd7c9)
{
	self endon(#"death");
	var_ea78a7cd = self.health;
	var_f7b87e0 = 0;
	while(true)
	{
		function_1eaaceab(level.var_e2d64235);
		var_f7b87e0 = var_f7b87e0 + (var_ea78a7cd - self.health);
		if(var_f7b87e0 >= (self.maxhealth * 0.1))
		{
			if(level.var_e2d64235.size < (var_14fd7c9 - 1) && level.var_bf3f1109 < level.var_581a776e)
			{
				var_93700de7 = spawnactor(#"spawner_zm_steiner_split_radiation_blast", self.origin, self.angles);
				var_7ffcff59 = spawnactor(#"spawner_zm_steiner_split_radiation_bomb", self.origin, self.angles);
				if(isdefined(var_93700de7))
				{
					var_93700de7 flag::set_val("steiner_split_invulnerable", 0);
					if(!isdefined(level.var_e2d64235))
					{
						level.var_e2d64235 = [];
					}
					else if(!isarray(level.var_e2d64235))
					{
						level.var_e2d64235 = array(level.var_e2d64235);
					}
					level.var_e2d64235[level.var_e2d64235.size] = var_93700de7;
					level.var_bf3f1109 = level.var_bf3f1109 + 1;
					function_480605d8(var_93700de7, 0.25);
				}
				if(isdefined(var_7ffcff59))
				{
					var_7ffcff59 flag::set_val("steiner_split_invulnerable", 0);
					if(!isdefined(level.var_e2d64235))
					{
						level.var_e2d64235 = [];
					}
					else if(!isarray(level.var_e2d64235))
					{
						level.var_e2d64235 = array(level.var_e2d64235);
					}
					level.var_e2d64235[level.var_e2d64235.size] = var_7ffcff59;
					level.var_bf3f1109 = level.var_bf3f1109 + 1;
					function_480605d8(var_7ffcff59, 0.25);
				}
				var_f7b87e0 = 0;
			}
		}
		var_ea78a7cd = self.health;
		waitframe(1);
	}
}

/*
	Name: function_106bc9f8
	Namespace: namespace_d769652e
	Checksum: 0xDB521CAD
	Offset: 0x103F8
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function function_106bc9f8(var_14fd7c9)
{
	self endon(#"death");
	self function_f7968d5b(15, var_14fd7c9);
}

/*
	Name: function_f7968d5b
	Namespace: namespace_d769652e
	Checksum: 0x3FE47255
	Offset: 0x10440
	Size: 0x2E0
	Parameters: 2
	Flags: Linked
*/
function function_f7968d5b(n_interval, var_f0d05ee7)
{
	var_c666969c = gettime() + (n_interval * 1000);
	while(true)
	{
		function_1eaaceab(level.var_e2d64235);
		if(gettime() >= var_c666969c)
		{
			if(level.var_e2d64235.size < (var_f0d05ee7 - 1) && level.var_bf3f1109 < level.var_581a776e)
			{
				var_93700de7 = spawnactor(#"spawner_zm_steiner_split_radiation_blast", self.origin, self.angles);
				var_7ffcff59 = spawnactor(#"spawner_zm_steiner_split_radiation_bomb", self.origin, self.angles);
				if(isdefined(var_93700de7))
				{
					var_93700de7 flag::set_val("steiner_split_invulnerable", 0);
					if(!isdefined(level.var_e2d64235))
					{
						level.var_e2d64235 = [];
					}
					else if(!isarray(level.var_e2d64235))
					{
						level.var_e2d64235 = array(level.var_e2d64235);
					}
					level.var_e2d64235[level.var_e2d64235.size] = var_93700de7;
					level.var_bf3f1109 = level.var_bf3f1109 + 1;
					function_480605d8(var_93700de7, 0.25);
				}
				if(isdefined(var_7ffcff59))
				{
					var_7ffcff59 flag::set_val("steiner_split_invulnerable", 0);
					if(!isdefined(level.var_e2d64235))
					{
						level.var_e2d64235 = [];
					}
					else if(!isarray(level.var_e2d64235))
					{
						level.var_e2d64235 = array(level.var_e2d64235);
					}
					level.var_e2d64235[level.var_e2d64235.size] = var_7ffcff59;
					level.var_bf3f1109 = level.var_bf3f1109 + 1;
					function_480605d8(var_7ffcff59, 0.25);
				}
				var_c666969c = gettime() + (n_interval * 1000);
			}
		}
		wait(1);
	}
}

/*
	Name: function_5a6268b8
	Namespace: namespace_d769652e
	Checksum: 0x849DDBC7
	Offset: 0x10728
	Size: 0x320
	Parameters: 3
	Flags: Linked
*/
function function_5a6268b8(n_interval, var_f0d05ee7, var_2c1b9289)
{
	level endon(var_2c1b9289);
	var_c666969c = gettime() + (n_interval * 1000);
	while(true)
	{
		function_1eaaceab(level.var_e2d64235);
		if(gettime() >= var_c666969c)
		{
			if(level.var_e2d64235.size < (var_f0d05ee7 - 1) && level.var_bf3f1109 < level.var_581a776e)
			{
				var_93700de7 = function_cce73165("steiner_location", #"hash_7f957e36b4f6160f", "zone_center_upper");
				var_7ffcff59 = function_cce73165("steiner_location", #"hash_6904f5c7bef64405", "zone_center_lower");
				if(isdefined(var_93700de7))
				{
					var_93700de7 flag::set_val("steiner_split_invulnerable", 0);
					var_93700de7 thread namespace_88795f45::function_f0811059();
					if(!isdefined(level.var_e2d64235))
					{
						level.var_e2d64235 = [];
					}
					else if(!isarray(level.var_e2d64235))
					{
						level.var_e2d64235 = array(level.var_e2d64235);
					}
					level.var_e2d64235[level.var_e2d64235.size] = var_93700de7;
					level.var_bf3f1109 = level.var_bf3f1109 + 1;
					function_480605d8(var_93700de7, 0.25);
				}
				if(isdefined(var_7ffcff59))
				{
					var_7ffcff59 flag::set_val("steiner_split_invulnerable", 0);
					var_7ffcff59 thread namespace_88795f45::function_f0811059();
					if(!isdefined(level.var_e2d64235))
					{
						level.var_e2d64235 = [];
					}
					else if(!isarray(level.var_e2d64235))
					{
						level.var_e2d64235 = array(level.var_e2d64235);
					}
					level.var_e2d64235[level.var_e2d64235.size] = var_7ffcff59;
					level.var_bf3f1109 = level.var_bf3f1109 + 1;
					function_480605d8(var_7ffcff59, 0.25);
				}
				var_c666969c = gettime() + (n_interval * 1000);
			}
		}
		wait(1);
	}
}

/*
	Name: function_480605d8
	Namespace: namespace_d769652e
	Checksum: 0x78AB506
	Offset: 0x10A50
	Size: 0xBA
	Parameters: 2
	Flags: Linked
*/
function function_480605d8(ai, health_ratio)
{
	if(isdefined(ai))
	{
		ai.ignore_enemy_count = 1;
		ai.no_powerups = 1;
		if(level.round_number < 20)
		{
			var_1af62beb = ai ai::function_9139c839().var_15c336d1;
			ai.maxhealth = (2000 + (20 * var_1af62beb[2].var_928e93a0)) * health_ratio;
			ai.health = int(ai.maxhealth);
		}
	}
}

/*
	Name: function_d65411e
	Namespace: namespace_d769652e
	Checksum: 0xB96AAF2
	Offset: 0x10B18
	Size: 0xE6
	Parameters: 0
	Flags: Linked
*/
function function_d65411e()
{
	level endon(#"hash_6b2607b65009a00b");
	exploder::exploder("lgt_env_photo_spotlight");
	while(true)
	{
		level flag::wait_till(#"dark_aether_active");
		exploder::exploder("lgt_env_photo_spotlight_aether");
		exploder::kill_exploder("lgt_env_photo_spotlight");
		level flag::wait_till_clear(#"dark_aether_active");
		exploder::kill_exploder("lgt_env_photo_spotlight_aether");
		exploder::exploder("lgt_env_photo_spotlight");
		waitframe(1);
	}
}

/*
	Name: function_21bfa736
	Namespace: namespace_d769652e
	Checksum: 0x5A8C4CC0
	Offset: 0x10C08
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function function_21bfa736(n_duration)
{
	wait(n_duration);
	exploder::kill_exploder("lgt_env_photo_spotlight");
}

/*
	Name: function_be97976d
	Namespace: namespace_d769652e
	Checksum: 0xD4445294
	Offset: 0x10C40
	Size: 0x2A4
	Parameters: 2
	Flags: Linked
*/
function function_be97976d(var_8286522a, current_wave)
{
	self endon(#"death");
	switch(current_wave)
	{
		case 1:
		{
			level endon(#"hash_3a617ab5e651c2a9");
			break;
		}
		case 2:
		{
			level endon(#"hash_4a49aa778b3cdd8");
			break;
		}
		case 3:
		{
			level endon(#"hash_1aab687832f4e02b");
			break;
		}
	}
	n_defend_time = var_8286522a * 1000;
	n_duration = n_defend_time;
	n_progress = 1 - (float(n_duration) / n_defend_time);
	level notify(#"hash_2af49a26c2d2b8", {#progress:n_progress});
	lasttime = gettime();
	while(true)
	{
		if(isdefined(self))
		{
			if(self.ai.var_a49798e7)
			{
			}
			else
			{
				n_duration = n_duration - (gettime() - lasttime);
				n_progress = 1 - (float(n_duration) / n_defend_time);
				level notify(#"hash_2af49a26c2d2b8", {#progress:n_progress});
			}
			lasttime = gettime();
			if(n_duration <= 0)
			{
				switch(current_wave)
				{
					case 1:
					{
						level flag::set(#"hash_3a617ab5e651c2a9");
						break;
					}
					case 2:
					{
						level flag::set(#"hash_4a49aa778b3cdd8");
						break;
					}
					case 3:
					{
						level flag::set(#"hash_1aab687832f4e02b");
						break;
					}
				}
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_7d583dd
	Namespace: namespace_d769652e
	Checksum: 0xA3DB88EB
	Offset: 0x10EF0
	Size: 0x2E
	Parameters: 0
	Flags: None
*/
function function_7d583dd()
{
	var_bf48e9e2 = function_b6a1fe09();
	self.favoriteenemy = var_bf48e9e2[0];
}

/*
	Name: function_a1bf0a43
	Namespace: namespace_d769652e
	Checksum: 0x2AA9F1B7
	Offset: 0x10F28
	Size: 0x298
	Parameters: 2
	Flags: Linked
*/
function function_a1bf0a43(end_notify, var_93bdf906)
{
	level endon(#"end_game", end_notify);
	var_f2484ed9 = util::spawn_model("tag_origin", self.origin);
	var_9463599a = undefined;
	while(true)
	{
		if(var_f2484ed9 flag::get(#"hash_7a42d508140ae262"))
		{
			level flag::wait_till(#"hash_4d6700553ede7078");
		}
		var_f2484ed9 clientfield::set("" + #"hash_7ec80a02e9bb051a", 1);
		if(!isdefined(var_9463599a))
		{
			var_9463599a = var_f2484ed9 namespace_2b924e50::function_3be9e71a();
		}
		var_f2484ed9 function_19986231();
		var_f2484ed9 function_58e278a1();
		waitresult = undefined;
		waitresult = level waittill(#"dark_tear_activated", #"into_the_dark_side");
		if(waitresult._notify == "dark_tear_activated")
		{
			var_f2484ed9 flag::set(#"hash_7a42d508140ae262");
			level notify(#"into_the_dark_side");
			level flag::set(var_93bdf906);
		}
		var_f2484ed9.mdl_gameobject thread namespace_2b924e50::function_1194b9bc();
		level flag::wait_till(#"dark_aether_active");
		var_f2484ed9 clientfield::set("" + #"hash_7ec80a02e9bb051a", 0);
		if(isdefined(var_9463599a))
		{
			var_9463599a delete();
		}
		level flag::wait_till_clear(#"dark_aether_active");
		level flag::clear(var_93bdf906);
	}
}

/*
	Name: function_34a1157d
	Namespace: namespace_d769652e
	Checksum: 0x65A85E14
	Offset: 0x111C8
	Size: 0x310
	Parameters: 6
	Flags: Linked
*/
function function_34a1157d(var_3b3f5ecb, var_7965c97b, str_zone_name, var_712035de, var_d51151ec, var_93bdf906)
{
	level endon(var_712035de);
	var_906de1e0 = struct::get(var_7965c97b, "script_noteworthy");
	while(true)
	{
		level flag::wait_till(#"dark_aether_active");
		if(isdefined(var_93bdf906) && !level flag::get(var_93bdf906))
		{
			wait(1);
			continue;
		}
		var_cbd423bc = util::spawn_model("tag_origin", var_906de1e0.origin);
		var_cbd423bc thread function_de34115();
		trigger = var_cbd423bc zm_unitrigger::create(&function_45fed3bf, vectorscale((1, 1, 1), 128), &function_ce94e1d2);
		if(!isdefined(level.var_b59d1162))
		{
			level.var_b59d1162 = [];
		}
		else if(!isarray(level.var_b59d1162))
		{
			level.var_b59d1162 = array(level.var_b59d1162);
		}
		level.var_b59d1162[level.var_b59d1162.size] = trigger;
		var_cbd423bc clientfield::set("" + #"hash_8358a32177aa60e", 0);
		zm_unitrigger::unitrigger_force_per_player_triggers(trigger, 1);
		wait_locations = level.zones[str_zone_name].a_loc_types[#"wait_location"];
		var_cbd423bc thread function_eedc944b(trigger, var_3b3f5ecb, str_zone_name, var_d51151ec);
		level flag::wait_till_clear(#"dark_aether_active");
		level scene::delete_scene_spawned_ents(var_3b3f5ecb);
		function_165ebd72(str_zone_name);
		function_cd1efeed(str_zone_name, 1);
		level callback::remove_on_actor_damage(&function_e1e6ef8d);
		if(isdefined(wait_locations))
		{
			level.zones[str_zone_name].a_loc_types[#"wait_location"] = wait_locations;
		}
	}
}

/*
	Name: function_8b256066
	Namespace: namespace_d769652e
	Checksum: 0x4D024643
	Offset: 0x114E0
	Size: 0x2A0
	Parameters: 1
	Flags: Linked
*/
function function_8b256066(str_scene)
{
	switch(str_scene)
	{
		case "done_echo_scene_vogel_01":
		{
			stat_name = #"zmecho_zm_silver_echo_1_vogel_01";
			break;
		}
		case "done_echo_scene_vogel_02":
		{
			stat_name = #"zmecho_zm_silver_echo_2_vogel_01";
			break;
		}
		case "done_echo_scene_vogel_03":
		{
			stat_name = #"zmecho_zm_silver_echo_3_vogel_01";
			break;
		}
		case "done_echo_scene_thiefsoldier":
		{
			stat_name = #"zmecho_zm_silver_echo_4_dmitriyev_kalashnik_01";
			break;
		}
		case "hash_32065ff0cf2dbf89":
		{
			stat_name = #"zmecho_zm_silver_echo_5_orlov_01";
			break;
		}
		case "done_echo_scene_kurtzandvogel":
		{
			stat_name = #"zmecho_zm_silver_secretecho_1_kurtzandvogel_01";
			break;
		}
		case "done_echo_scene_lastsoldier":
		{
			stat_name = #"zmecho_zm_silver_secretecho_2_lastsoldier_01";
			break;
		}
		case "done_echo_scene_dmitriyev_kalashnik_01_throw":
		{
			stat_name = #"zmecho_zm_silver_secretecho_3_dmitriyev_kalashnik_01_throw";
			break;
		}
		case "done_echo_scene_orlovandmedved":
		{
			stat_name = #"zmecho_zm_silver_secretecho_4_orlovandmedved";
			break;
		}
		case "done_echo_scene_valentinaandpeck":
		{
			stat_name = #"zmecho_zm_silver_secretecho_5_valentinaandpeck";
			break;
		}
		default:
		{
			return;
		}
	}
	players = getplayers();
	foreach(player in players)
	{
		if(!player zm_stats::function_165a4e7b(stat_name))
		{
			player zm_stats::function_b4cc2b13(stat_name, 1);
			player zm_stats::increment_challenge_stat(#"hash_1b624464514f34b1");
		}
	}
}

/*
	Name: function_eedc944b
	Namespace: namespace_d769652e
	Checksum: 0x968B52BF
	Offset: 0x11788
	Size: 0x250
	Parameters: 4
	Flags: Linked
*/
function function_eedc944b(var_b2419dd, var_3b3f5ecb, str_zone_name, str_endon_flag)
{
	level endon(#"dark_side_timeout", #"hash_61e8a39b3a4bee6a");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"trigger_activated");
		level.zones[str_zone_name].a_loc_types[#"wait_location"] = [];
		self playsound(#"hash_7c5c78e1489169ba");
		waitresult.e_who thread flag::set_for_time(2, #"hash_7ef7aab6a305d0b0");
		function_cd1efeed(str_zone_name, 0);
		a_players = getplayers();
		foreach(player in a_players)
		{
			player thread function_a7f549b0(str_zone_name, str_endon_flag);
		}
		level callback::on_actor_damage(&function_e1e6ef8d);
		if(level.var_ba3a0e1f <= scene::function_12479eba(var_3b3f5ecb))
		{
			level.var_ba3a0e1f = scene::function_12479eba(var_3b3f5ecb);
		}
		level thread scene::play(var_3b3f5ecb);
		function_6492d9db(var_b2419dd);
		self flag::set("orb_is_deciphered");
	}
}

/*
	Name: function_a7f549b0
	Namespace: namespace_d769652e
	Checksum: 0x30EE55B0
	Offset: 0x119E0
	Size: 0x110
	Parameters: 2
	Flags: Linked
*/
function function_a7f549b0(str_zone_name, str_endon_flag)
{
	self endon(#"death");
	level endon(#"dark_side_timeout", #"hash_61e8a39b3a4bee6a", str_endon_flag);
	var_3e3471b2 = self zm_zonemgr::get_player_zone();
	if(var_3e3471b2 === str_zone_name)
	{
		self function_ec732196(1);
	}
	while(true)
	{
		self waittill(#"zone_change");
		str_zone = self zm_zonemgr::get_player_zone();
		if(str_zone === str_zone_name)
		{
			self function_ec732196(1);
		}
		else
		{
			self function_ec732196(0);
		}
	}
}

/*
	Name: function_165ebd72
	Namespace: namespace_d769652e
	Checksum: 0x803E23BA
	Offset: 0x11AF8
	Size: 0xD8
	Parameters: 1
	Flags: Linked
*/
function function_165ebd72(str_zone_name)
{
	a_players = getplayers();
	foreach(player in a_players)
	{
		var_bdf9e3c2 = player zm_zonemgr::get_player_zone();
		if(var_bdf9e3c2 === str_zone_name)
		{
			player function_ec732196(0);
		}
	}
}

/*
	Name: function_cd1efeed
	Namespace: namespace_d769652e
	Checksum: 0xD0DB6141
	Offset: 0x11BD8
	Size: 0x42
	Parameters: 2
	Flags: Linked
*/
function function_cd1efeed(str_zone_name, var_e7f5b3e0)
{
	if(isdefined(level.zones[str_zone_name]))
	{
		level.zones[str_zone_name].is_spawning_allowed = var_e7f5b3e0;
	}
}

/*
	Name: function_ec732196
	Namespace: namespace_d769652e
	Checksum: 0xEEA2EF2C
	Offset: 0x11C28
	Size: 0x208
	Parameters: 1
	Flags: Linked
*/
function function_ec732196(var_bd357ae)
{
	if(var_bd357ae)
	{
		self val::set(#"hash_6316e79204ae05eb", "ignoreme", 1);
		var_743a066e = getaiarchetypearray(#"hash_7c0d83ac1e845ac2");
		if(isdefined(var_743a066e))
		{
			foreach(steiner in var_743a066e)
			{
				steiner val::set(#"hash_1fa97fcb67f9befc", "ignoreall", 1);
				steiner clearenemy();
			}
		}
	}
	else
	{
		self val::set(#"hash_6316e79204ae05eb", "ignoreme", 0);
		var_743a066e = getaiarchetypearray(#"hash_7c0d83ac1e845ac2");
		if(isdefined(var_743a066e))
		{
			foreach(steiner in var_743a066e)
			{
				steiner val::reset(#"hash_1fa97fcb67f9befc", "ignoreall");
			}
		}
	}
}

/*
	Name: function_42da022b
	Namespace: namespace_d769652e
	Checksum: 0xB78DB706
	Offset: 0x11E38
	Size: 0x108
	Parameters: 0
	Flags: Linked
*/
function function_42da022b()
{
	level endon(#"end_game");
	while(true)
	{
		level flag::wait_till(#"dark_aether_active");
		level flag::wait_till_clear(#"dark_aether_active");
		if(level.var_b59d1162.size > 0)
		{
			foreach(trigger in level.var_b59d1162)
			{
				function_6492d9db(trigger);
			}
			level.var_b59d1162 = [];
		}
	}
}

/*
	Name: function_6492d9db
	Namespace: namespace_d769652e
	Checksum: 0xBB881673
	Offset: 0x11F48
	Size: 0x2A
	Parameters: 1
	Flags: Linked
*/
function function_6492d9db(unitrigger)
{
	zm_unitrigger::unregister_unitrigger(unitrigger);
	unitrigger = undefined;
}

/*
	Name: function_e1e6ef8d
	Namespace: namespace_d769652e
	Checksum: 0xA13BAE2A
	Offset: 0x11F80
	Size: 0x5C
	Parameters: 1
	Flags: Linked
*/
function function_e1e6ef8d(params)
{
	if(self.team == level.zombie_team && isplayer(params.eattacker))
	{
		params.eattacker function_ec732196(0);
	}
}

/*
	Name: function_332ca53e
	Namespace: namespace_d769652e
	Checksum: 0x7354856
	Offset: 0x11FE8
	Size: 0x36
	Parameters: 2
	Flags: Linked
*/
function function_332ca53e(ents, str_notify)
{
	level function_8b256066(str_notify);
	level notify(str_notify);
}

/*
	Name: function_fc0ced31
	Namespace: namespace_d769652e
	Checksum: 0x61AFD59E
	Offset: 0x12028
	Size: 0x94
	Parameters: 1
	Flags: Linked
*/
function function_fc0ced31(ents)
{
	level notify(#"done_echo_scene_thiefsoldier");
	level function_8b256066("done_echo_scene_thiefsoldier");
	function_165ebd72("zone_trans_north");
	function_cd1efeed("zone_trans_north", 1);
	level callback::remove_on_actor_damage(&function_e1e6ef8d);
}

/*
	Name: function_299c9b7f
	Namespace: namespace_d769652e
	Checksum: 0x6D4F8498
	Offset: 0x120C8
	Size: 0x94
	Parameters: 1
	Flags: Linked
*/
function function_299c9b7f(ents)
{
	level notify(#"done_echo_scene_lastsoldier");
	level function_8b256066("done_echo_scene_lastsoldier");
	function_165ebd72("zone_proto_interior_lower");
	function_cd1efeed("zone_proto_interior_lower", 1);
	level callback::remove_on_actor_damage(&function_e1e6ef8d);
}

/*
	Name: function_acc98467
	Namespace: namespace_d769652e
	Checksum: 0xDF0C52DE
	Offset: 0x12168
	Size: 0x94
	Parameters: 1
	Flags: Linked
*/
function function_acc98467(ents)
{
	level notify(#"done_echo_scene_kurtzandvogel");
	level function_8b256066("done_echo_scene_kurtzandvogel");
	function_165ebd72("zone_center_upper_north");
	function_cd1efeed("zone_center_upper_north", 1);
	level callback::remove_on_actor_damage(&function_e1e6ef8d);
}

/*
	Name: function_68fb1270
	Namespace: namespace_d769652e
	Checksum: 0x2F46CE15
	Offset: 0x12208
	Size: 0x94
	Parameters: 1
	Flags: Linked
*/
function function_68fb1270(ents)
{
	level notify(#"done_echo_scene_valentinaandpeck");
	level function_8b256066("done_echo_scene_valentinaandpeck");
	function_165ebd72("zone_power_room");
	function_cd1efeed("zone_power_room", 1);
	level callback::remove_on_actor_damage(&function_e1e6ef8d);
}

/*
	Name: function_e920684
	Namespace: namespace_d769652e
	Checksum: 0xBA231029
	Offset: 0x122A8
	Size: 0x94
	Parameters: 1
	Flags: Linked
*/
function function_e920684(ents)
{
	level notify(#"done_echo_scene_orlovandmedved");
	level function_8b256066("done_echo_scene_orlovandmedved");
	function_165ebd72("zone_proto_exterior_rear2");
	function_cd1efeed("zone_proto_exterior_rear2", 1);
	level callback::remove_on_actor_damage(&function_e1e6ef8d);
}

/*
	Name: function_2214bfa4
	Namespace: namespace_d769652e
	Checksum: 0x28BEC47D
	Offset: 0x12348
	Size: 0x94
	Parameters: 1
	Flags: Linked
*/
function function_2214bfa4(ents)
{
	level notify(#"done_echo_scene_dmitriyev_kalashnik_01_throw");
	level function_8b256066("done_echo_scene_dmitriyev_kalashnik_01_throw");
	function_165ebd72("zone_proto_plane_exterior");
	function_cd1efeed("zone_proto_plane_exterior", 1);
	level callback::remove_on_actor_damage(&function_e1e6ef8d);
}

/*
	Name: function_4afbb1fa
	Namespace: namespace_d769652e
	Checksum: 0xDFB1F75B
	Offset: 0x123E8
	Size: 0xB4
	Parameters: 1
	Flags: Linked
*/
function function_4afbb1fa(ents)
{
	if(level.var_ba3a0e1f > 0)
	{
		level flag::set(#"hash_1dd7e5ac52d2221c");
	}
	level function_8b256066(#"hash_32065ff0cf2dbf89");
	function_165ebd72("zone_proto_interior_cave");
	function_cd1efeed("zone_proto_interior_cave", 1);
	level callback::remove_on_actor_damage(&function_e1e6ef8d);
}

/*
	Name: function_b8e662e5
	Namespace: namespace_d769652e
	Checksum: 0x6D5DB205
	Offset: 0x124A8
	Size: 0x7E
	Parameters: 1
	Flags: Linked
*/
function function_b8e662e5(var_c76bbbcc)
{
	level.zones[#"zone_trans_north"].is_spawning_allowed = var_c76bbbcc;
	level.zones[#"zone_trans_south_tunnel"].is_spawning_allowed = var_c76bbbcc;
	level.zones[#"zone_power_tunnel"].is_spawning_allowed = var_c76bbbcc;
}

/*
	Name: function_b86587a6
	Namespace: namespace_d769652e
	Checksum: 0x323523E3
	Offset: 0x12530
	Size: 0x76
	Parameters: 0
	Flags: Linked
*/
function function_b86587a6()
{
	level.zones[#"zone_trans_north"].is_spawning_allowed = 1;
	level.zones[#"zone_trans_south_tunnel"].is_spawning_allowed = 1;
	level.zones[#"zone_power_tunnel"].is_spawning_allowed = 1;
}

/*
	Name: set_zombie
	Namespace: namespace_d769652e
	Checksum: 0x39A13821
	Offset: 0x125B0
	Size: 0xA6
	Parameters: 1
	Flags: Linked, Private
*/
function private set_zombie(e_zombie)
{
	if(isdefined(e_zombie))
	{
		e_zombie.var_126d7bef = 1;
		e_zombie.ignore_round_spawn_failsafe = 1;
		e_zombie.b_ignore_cleanup = 1;
		e_zombie.ignore_enemy_count = 1;
		e_zombie.no_powerups = 1;
		if(isinarray(level.var_90f0a494, e_zombie))
		{
			e_zombie.var_12af7864 = 0;
		}
		else
		{
			e_zombie.var_12af7864 = 1;
		}
		if(e_zombie.health < 2000)
		{
			e_zombie.health = 2000;
		}
	}
}

/*
	Name: function_19986231
	Namespace: namespace_d769652e
	Checksum: 0x46747F5C
	Offset: 0x12660
	Size: 0xD8
	Parameters: 0
	Flags: Linked
*/
function function_19986231()
{
	if(!self flag::get(#"hash_7a42d508140ae262"))
	{
		foreach(player in getplayers())
		{
			player clientfield::set_to_player("" + #"hash_1fa45e1c3652d753", 1);
		}
	}
}

/*
	Name: on_item_pickup
	Namespace: namespace_d769652e
	Checksum: 0x54869FAD
	Offset: 0x12740
	Size: 0x644
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
				case "hash_2ebe3fb8c0af6e5b":
				{
					level zm_ui_inventory::function_7df6bb60(#"hash_1f87150a0632f418", 1);
					level notify(#"manage_to_find_aetherscope_part", {#player:self});
					self clientfield::increment_to_player("" + #"hash_6696d96a08b9701d");
					break;
				}
				case "hash_2ebe40b8c0af700e":
				{
					level zm_ui_inventory::function_7df6bb60(#"hash_1f87180a0632f931", 1);
					level notify(#"manage_to_find_aetherscope_part", {#player:self});
					self clientfield::increment_to_player("" + #"hash_6696d96a08b9701d");
					break;
				}
				case "hash_2ebe41b8c0af71c1":
				{
					level zm_ui_inventory::function_7df6bb60(#"hash_1f87170a0632f77e", 1);
					level notify(#"manage_to_find_aetherscope_part", {#player:self});
					self clientfield::increment_to_player("" + #"hash_6696d96a08b9701d");
					break;
				}
				case "item_zmintel_silver_darkaether_artifact_4":
				{
					level flag::set("wrench_collected");
					level zm_ui_inventory::function_7df6bb60(#"hash_1b836a89598ddaa4", 1);
					array::thread_all(function_a1ef346b(), &namespace_4abf1500::collect_intel, "zmintel_silver_darkaether_artifact_4");
					self clientfield::increment_to_player("" + #"hash_6696d96a08b9701d");
					break;
				}
				case "item_zmintel_silver_requiem_artifact_3":
				{
					level flag::set(#"hash_1e2c6b7b99b8706b");
					level flag::set("aetherscope_collected");
					array::thread_all(function_a1ef346b(), &namespace_4abf1500::collect_intel, "zmintel_silver_requiem_artifact_3");
					self clientfield::increment_to_player("" + #"hash_6696d96a08b9701d");
					break;
				}
				case "item_zmintel_silver_requiem_artifact_4":
				{
					level flag::set("someone_has_notebook");
					level zm_ui_inventory::function_7df6bb60(#"hash_6df578dd42812c70", 1);
					array::thread_all(function_a1ef346b(), &namespace_4abf1500::collect_intel, "zmintel_silver_requiem_artifact_4");
					self clientfield::increment_to_player("" + #"hash_6696d96a08b9701d");
					/#
						iprintlnbold("");
					#/
					break;
				}
				case "item_zmintel_silver_omega_artifact_1":
				{
					level flag::set(#"hash_16f2a408c50fab14");
					level zm_ui_inventory::function_7df6bb60(#"hash_2d5b26565a3e1ea1", 1);
					array::thread_all(function_a1ef346b(), &namespace_4abf1500::collect_intel, "zmintel_silver_omega_artifact_1");
					self clientfield::increment_to_player("" + #"hash_6696d96a08b9701d");
					break;
				}
				case "item_zmintel_silver_requiem_artifact_5":
				{
					level notify(#"hash_1f20be24ebb9923c");
					if(!level flag::get(#"hash_626c3cc90d7a0cdb"))
					{
						self thread namespace_4abf1500::collect_intel("zmintel_silver_requiem_artifact_5");
						level flag::set(#"hash_626c3cc90d7a0cdb");
					}
					level thread function_7acfbb3a(self);
					self clientfield::increment_to_player("" + #"hash_6696d96a08b9701d");
					break;
				}
				default:
				{
					return;
				}
			}
			level thread popups::function_87604884(#"hash_4cacf78219f8fca", self, self.team, item.var_a6762160.displayname);
		}
	}
}

/*
	Name: function_5080c483
	Namespace: namespace_d769652e
	Checksum: 0xF08C5252
	Offset: 0x12D90
	Size: 0x52
	Parameters: 1
	Flags: Linked
*/
function function_5080c483(item)
{
	if(item.var_a6762160.name === "item_zmintel_silver_requiem_artifact_5")
	{
		return !self function_7f1e56d8("stand");
	}
	return 1;
}

/*
	Name: on_player_spawned
	Namespace: namespace_d769652e
	Checksum: 0x70F3C4F0
	Offset: 0x12DF0
	Size: 0x6C
	Parameters: 0
	Flags: Linked
*/
function on_player_spawned()
{
	if(is_true(self.is_hotjoining) || self util::is_spectating())
	{
		return;
	}
	if(level flag::get("aetherscope_collected"))
	{
		self thread namespace_2b924e50::function_b9adea4e();
	}
}

/*
	Name: function_2b6da102
	Namespace: namespace_d769652e
	Checksum: 0x492CB608
	Offset: 0x12E68
	Size: 0x174
	Parameters: 1
	Flags: None
*/
function function_2b6da102(vo_alias)
{
	var_21995124 = util::spawn_model("tag_origin", self.origin);
	var_21995124 thread zm_vo::function_1ac9c00e(vo_alias);
	var_830266a7 = 0;
	foreach(alias in vo_alias)
	{
		var_830266a7 = var_830266a7 + (float(max((isdefined(soundgetplaybacktime(alias)) ? soundgetplaybacktime(alias) : 500), 500)) / 1000);
	}
	if(level.var_ba3a0e1f < var_830266a7)
	{
		level.var_ba3a0e1f = var_830266a7;
	}
	wait(var_830266a7);
	if(isdefined(var_21995124))
	{
		var_21995124 delete();
	}
}

/*
	Name: function_cc7a52ed
	Namespace: namespace_d769652e
	Checksum: 0x7AF78528
	Offset: 0x12FE8
	Size: 0x15C
	Parameters: 0
	Flags: Linked
*/
function function_cc7a52ed()
{
	level endon(#"end_game", #"hash_4fbe4720f6f13107");
	var_1b35991d = gettime();
	while(true)
	{
		if(gettime() > var_1b35991d)
		{
			a_players = function_a1ef346b();
			foreach(player in a_players)
			{
				level thread function_bdd8e757();
				player thread clientfield::increment_to_player("" + #"hash_404a977ff0098cf", 1);
			}
			wait(4);
			var_1b35991d = gettime() + (randomintrange(5, 8) * 1000);
		}
		wait(0.5);
	}
}

/*
	Name: function_cce73165
	Namespace: namespace_d769652e
	Checksum: 0xE60B6924
	Offset: 0x13150
	Size: 0x26A
	Parameters: 3
	Flags: Linked
*/
function function_cce73165(str_spawn_loc, var_82706add, str_zone_name)
{
	var_a96b643a = [];
	var_dbc18a74 = struct::get_array(str_spawn_loc, "script_noteworthy");
	foreach(spawner in var_dbc18a74)
	{
		if(str_zone_name === spawner.zone_name)
		{
			if(!isdefined(var_a96b643a))
			{
				var_a96b643a = [];
			}
			else if(!isarray(var_a96b643a))
			{
				var_a96b643a = array(var_a96b643a);
			}
			var_a96b643a[var_a96b643a.size] = spawner;
		}
	}
	if(var_a96b643a.size > 0)
	{
		var_958f8634 = var_a96b643a[randomint(var_a96b643a.size)];
	}
	else
	{
		return;
	}
	if(getfreeactorcount() < 1)
	{
		a_zombie = getaiarchetypearray(#"zombie");
		if(isdefined(a_zombie))
		{
			a_zombie[0].allowdeath = 1;
			a_zombie[0] kill();
		}
	}
	if(isdefined(var_958f8634))
	{
		ai = spawnactor(var_82706add, var_958f8634.origin, var_958f8634.angles);
	}
	else
	{
		/#
			iprintlnbold(("" + str_zone_name) + "");
		#/
		ai = spawnactor(var_82706add, var_dbc18a74[0].origin, var_dbc18a74[0].angles);
	}
	return ai;
}

/*
	Name: function_17468758
	Namespace: namespace_d769652e
	Checksum: 0xBC0AC128
	Offset: 0x133C8
	Size: 0x264
	Parameters: 1
	Flags: Linked
*/
function function_17468758(params)
{
	if(self.team == level.zombie_team && isinarray(level.var_90f0a494, self))
	{
		arrayremovevalue(level.var_90f0a494, self);
		n_interval = 0;
		if(function_a1ef346b().size > 1)
		{
			n_interval = 2;
		}
		else
		{
			n_interval = 2;
		}
		level thread function_74e188b0(n_interval, level.var_3738589);
	}
	if(self.team == level.zombie_team && self.aitype == #"spawner_zm_steiner_hvt" && level flag::get(#"hash_322c7f92525e008e"))
	{
		if(!level flag::get(#"hash_3a617ab5e651c2a9"))
		{
			level thread function_5a6268b8(15, level.var_cc18747e, #"hash_3a617ab5e651c2a9");
		}
		else
		{
			if(level flag::get(#"hash_3a617ab5e651c2a9") && !level flag::get(#"hash_4a49aa778b3cdd8"))
			{
				level thread function_5a6268b8(15, level.var_cc18747e, #"hash_4a49aa778b3cdd8");
			}
			else if(level flag::get(#"hash_4a49aa778b3cdd8") && !level flag::get(#"hash_1aab687832f4e02b"))
			{
				level thread function_5a6268b8(15, level.var_cc18747e, #"hash_1aab687832f4e02b");
			}
		}
	}
}

/*
	Name: function_bdd8e757
	Namespace: namespace_d769652e
	Checksum: 0x3EFA23F5
	Offset: 0x13638
	Size: 0x74
	Parameters: 0
	Flags: Linked
*/
function function_bdd8e757()
{
	level clientfield::set("" + #"hash_570bb58b50e9db2e", 1);
	wait(4);
	level clientfield::set("" + #"hash_570bb58b50e9db2e", 0);
}

/*
	Name: function_e2f745e1
	Namespace: namespace_d769652e
	Checksum: 0xC0B3E9B3
	Offset: 0x136B8
	Size: 0x7E
	Parameters: 0
	Flags: None
*/
function function_e2f745e1()
{
	level endon(#"hash_44078192bcaf5372");
	while(true)
	{
		a_zombies = getaispeciesarray(level.zombie_team);
		if(a_zombies.size == 0)
		{
			level flag::set(#"hash_44078192bcaf5372");
		}
		wait(1);
	}
}

/*
	Name: function_8f85d169
	Namespace: namespace_d769652e
	Checksum: 0xD8EF80A9
	Offset: 0x13740
	Size: 0x1B0
	Parameters: 1
	Flags: Linked
*/
function function_8f85d169(var_dbd74b22)
{
	if(!isdefined(var_dbd74b22))
	{
		var_dbd74b22 = 1;
	}
	if(var_dbd74b22)
	{
		level thread zm_audio::sndmusicsystem_stopandflush();
		level.musicsystemoverride = 1;
		foreach(player in getplayers())
		{
			player clientfield::set_to_player("" + #"hash_4be33f9c734f0cb9", 2);
		}
	}
	else
	{
		level.musicsystemoverride = 0;
		foreach(player in getplayers())
		{
			player clientfield::set_to_player("" + #"hash_4be33f9c734f0cb9", 3);
		}
	}
}

/*
	Name: function_9afd3ea2
	Namespace: namespace_d769652e
	Checksum: 0x96DFF696
	Offset: 0x138F8
	Size: 0xD4
	Parameters: 1
	Flags: Linked
*/
function function_9afd3ea2(var_1784db6)
{
	var_32c3c05c = getaiarchetypearray(#"hash_7c0d83ac1e845ac2");
	foreach(steiner in var_32c3c05c)
	{
		steiner.ai.var_4beb90f3 = 0;
	}
	level zm_utility::function_9ad5aeb1(0, 1, 0, var_1784db6);
}

/*
	Name: function_129e09f3
	Namespace: namespace_d769652e
	Checksum: 0x791F28ED
	Offset: 0x139D8
	Size: 0x94
	Parameters: 0
	Flags: Linked
*/
function function_129e09f3()
{
	players = getplayers();
	for(i = 0; i < players.size; i++)
	{
		e_player = players[i];
		e_player zm_player::spectator_respawn_player();
	}
	array::thread_all(getplayers(), &revive_players);
}

/*
	Name: function_a2a695e3
	Namespace: namespace_d769652e
	Checksum: 0xE2969D5
	Offset: 0x13A78
	Size: 0x318
	Parameters: 0
	Flags: Linked
*/
function function_a2a695e3()
{
	level waittill(#"hash_168c974a32574db3");
	a_players = function_a1ef346b();
	foreach(player in a_players)
	{
		player thread clientfield::increment_to_player("" + #"hash_7a769c728c89b6b5", 1);
	}
	level waittill(#"hash_168c984a32574f66");
	a_players = function_a1ef346b();
	foreach(player in a_players)
	{
		player thread clientfield::increment_to_player("" + #"hash_7a769c728c89b6b5", 1);
	}
	level waittill(#"hash_168c994a32575119");
	a_players = function_a1ef346b();
	foreach(player in a_players)
	{
		player thread clientfield::increment_to_player("" + #"hash_7a769c728c89b6b5", 1);
	}
	level waittill(#"hash_168c9a4a325752cc");
	a_players = function_a1ef346b();
	foreach(player in a_players)
	{
		player thread clientfield::increment_to_player("" + #"hash_7a769c728c89b6b5", 1);
	}
}

/*
	Name: function_479a6396
	Namespace: namespace_d769652e
	Checksum: 0xE97E5217
	Offset: 0x13D98
	Size: 0xEC
	Parameters: 0
	Flags: Linked
*/
function function_479a6396()
{
	level endon(#"steiner_merge_done");
	while(true)
	{
		a_players = function_a1ef346b();
		foreach(player in a_players)
		{
			player thread clientfield::increment_to_player("" + #"hash_6696d96a08b9701d", 1);
		}
		wait(0.5);
	}
}

/*
	Name: function_fb092189
	Namespace: namespace_d769652e
	Checksum: 0x18D6EF6B
	Offset: 0x13E90
	Size: 0x272
	Parameters: 3
	Flags: Linked
*/
function function_fb092189(var_426f34de, str_trigger_name, var_4fd582e7)
{
	level endon(var_426f34de, #"end_game");
	var_33507048 = struct::get(str_trigger_name, "script_noteworthy");
	var_2bf42f31 = struct::get_array(var_4fd582e7, "script_noteworthy");
	while(true)
	{
		a_players = function_a1ef346b();
		foreach(player in a_players)
		{
			if(distancesquared(player.origin, var_33507048.origin) <= 10000)
			{
				foreach(loc in var_2bf42f31)
				{
					ai = spawnactor("spawner_zm_zombie_silver", loc.origin, loc.angles, 1);
					set_zombie(ai);
					if(isdefined(ai))
					{
						ai.zombie_move_speed = "sprint";
						ai pathmode("move allowed");
						ai.completed_emerging_into_playable_area = 1;
						ai.zombie_think_done = 1;
					}
				}
				level flag::set(var_426f34de);
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_d53c41b3
	Namespace: namespace_d769652e
	Checksum: 0xDD51EF47
	Offset: 0x14110
	Size: 0x9C
	Parameters: 0
	Flags: Linked
*/
function function_d53c41b3()
{
	level endon(#"end_game");
	level flag::wait_till(#"hash_3babb5bf72d208da");
	level flag::set(#"spawn_zombies");
	level flag::set(#"infinite_round_spawning");
	level flag::set(#"pause_round_timeout");
}

