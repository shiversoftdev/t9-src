#using script_14f4a3c583c77d4b;
#using script_178024232e91b0a1;
#using script_1940fc077a028a81;
#using script_1b10fdf0addd52e;
#using script_1e72c148eb0b32d2;
#using script_2c5daa95f8fec03c;
#using script_317aa6153a75c589;
#using script_3411bb48d41bd3b;
#using script_35598499769dbb3d;
#using script_36f4be19da8eb6d0;
#using script_3819e7a1427df6d2;
#using script_3aa0f32b70d4f7cb;
#using script_3d3c03b88e16a244;
#using script_3f9e0dc8454d98e1;
#using script_41fe08c37d53a635;
#using script_489b835a247c990e;
#using script_4bf952f6ba31bb17;
#using script_4d85e8de54b02198;
#using script_522aeb6ae906391e;
#using script_57f7003580bb15e0;
#using script_58c342edd81589fb;
#using script_59f07c660e6710a5;
#using script_5bb072c3abf4652c;
#using script_6809bf766eba194a;
#using script_71dfbfdfba4489a0;
#using script_7b7ed6e4bc963a51;
#using script_7e59d7bba853fe4b;
#using script_bd2b8aaa388dcce;
#using script_caf007e2a98afa2;
#using script_db06eb511bd9b36;
#using scripts\core_common\aat_shared.gsc;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm_behavior.gsc;
#using scripts\zm_common\zm_devgui.gsc;
#using scripts\zm_common\zm_pack_a_punch.gsc;
#using scripts\zm_common\zm_pack_a_punch_util.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;

#namespace namespace_88795f45;

/*
	Name: function_e1a65ec8
	Namespace: namespace_88795f45
	Checksum: 0x68E64F81
	Offset: 0x6D8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_e1a65ec8()
{
	level notify(1063337158);
}

/*
	Name: function_89f2df9
	Namespace: namespace_88795f45
	Checksum: 0xCF8CA5D
	Offset: 0x6F8
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_338a74f5c94ba66a", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_88795f45
	Checksum: 0x3290FF06
	Offset: 0x750
	Size: 0x36C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	registerbehaviorscriptfunctions();
	/#
		execdevgui("");
		level thread function_e96e00cc();
		level thread update_dvars();
	#/
	spawner::add_archetype_spawn_function(#"hash_7c0d83ac1e845ac2", &function_7ec99c76);
	spawner::function_89a2cd87(#"hash_7c0d83ac1e845ac2", &function_cf0706a7);
	clientfield::register("actor", "steiner_radiation_bomb_prepare_fire_clientfield", 1, 1, "int");
	clientfield::register("scriptmover", "radiation_bomb_play_landed_fx", 1, 2, "int");
	clientfield::register("missile", "radiation_bomb_trail_fx_clientfield", 1, 1, "int");
	clientfield::register("actor", "steiner_split_combine_fx_clientfield", 1, 1, "int");
	clientfield::register("actor", "steiner_perform_split_clientfield", 1, 1, "counter");
	clientfield::register("actor", "steiner_cleanup_teleport_clientfield", 4000, 1, "counter");
	callback::on_actor_killed(&function_f26fe009);
	callback::on_actor_damage(&function_61e1c2a1);
	callback::on_player_damage(&function_bc9fe637);
	zm_utility::function_d0f02e71(#"hash_7c0d83ac1e845ac2");
	zm_cleanup::function_cdf5a512(#"hash_7c0d83ac1e845ac2", &function_99c14949);
	namespace_c3287616::register_archetype(#"hash_7c0d83ac1e845ac2", &function_f4788553, &round_spawn, undefined, 100);
	namespace_c3287616::function_306ce518(#"hash_7c0d83ac1e845ac2", &function_3ced6468);
	zm::function_84d343d(#"hash_2b47921791da6f0", &function_7709f2df);
	zm::function_84d343d(#"hash_67307aa00ad6f686", &function_7ff0ce68);
}

/*
	Name: function_8ac3bea9
	Namespace: namespace_88795f45
	Checksum: 0x80F724D1
	Offset: 0xAC8
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ac3bea9()
{
}

/*
	Name: registerbehaviorscriptfunctions
	Namespace: namespace_88795f45
	Checksum: 0x12067557
	Offset: 0xAD8
	Size: 0x17A4
	Parameters: 0
	Flags: Linked, Private
*/
function private registerbehaviorscriptfunctions()
{
	/#
		assert(isscriptfunctionptr(&function_7a893a7));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_7280253b8045f3aa", &function_7a893a7);
	/#
		assert(isscriptfunctionptr(&function_e6d0f1d4));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_25f6a58aa44b9b2a", &function_e6d0f1d4);
	/#
		assert(isscriptfunctionptr(&function_b46c0796));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_79642ea6dc02eebd", &function_b46c0796);
	/#
		assert(isscriptfunctionptr(&function_fb61fd57));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_42117ec3b040839a", &function_fb61fd57);
	/#
		assert(isscriptfunctionptr(&function_b52cb76c));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_4cc6cc5dc62bf114", &function_b52cb76c);
	/#
		assert(isscriptfunctionptr(&function_e9e122fa));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_154f7a6870ab70d2", &function_e9e122fa);
	/#
		assert(isscriptfunctionptr(&function_15c1e3df));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_6ad94e79dd5192", &function_15c1e3df);
	/#
		assert(isscriptfunctionptr(&function_7cac529b));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_7d62ea78150d61ab", &function_7cac529b);
	/#
		assert(isscriptfunctionptr(&function_29744716));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_7a17e3794c739769", &function_29744716);
	/#
		assert(isscriptfunctionptr(&function_52479a49));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_4f21279adbfeb5c6", &function_52479a49);
	/#
		assert(isscriptfunctionptr(&function_dcac38af));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_6ada226476fbbc5a", &function_dcac38af);
	/#
		assert(isscriptfunctionptr(&function_efc7dca5));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_4db554ff25b3f605", &function_efc7dca5);
	/#
		assert(isscriptfunctionptr(&function_e6b7aa9d));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_50a4fe24c23b6d27", &function_e6b7aa9d);
	/#
		assert(isscriptfunctionptr(&function_dab44559));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_23c568af83b67b77", &function_dab44559);
	/#
		assert(isscriptfunctionptr(&function_2745a754));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_34d3f0d3d41d76e5", &function_2745a754);
	/#
		assert(isscriptfunctionptr(&function_5142fcce));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_3e44bc48a1f81235", &function_5142fcce);
	/#
		assert(isscriptfunctionptr(&function_4b261274));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_2a396809551c1af9", &function_4b261274);
	/#
		assert(isscriptfunctionptr(&function_f9eee290));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_4b68c168ade3461c", &function_f9eee290);
	/#
		assert(isscriptfunctionptr(&function_baffe829));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_1146baaf761ec6ed", &function_baffe829);
	/#
		assert(isscriptfunctionptr(&function_fe1e617c));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_57c7c778e27ffa59", &function_fe1e617c);
	/#
		assert(isscriptfunctionptr(&function_4245d56f));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_98b56eef8e28325", &function_4245d56f);
	/#
		assert(isscriptfunctionptr(&function_45fabe41));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_1658d524a973ce91", &function_45fabe41);
	/#
		assert(isscriptfunctionptr(&function_99608cba));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_1a163703acd2ed3f", &function_99608cba);
	/#
		assert(isscriptfunctionptr(&function_779b5a9));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_2bb826405d693ccb", &function_779b5a9);
	/#
		assert(isscriptfunctionptr(&function_363c063));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_f175e396e0073c6", &function_363c063);
	/#
		assert(isscriptfunctionptr(&function_380fc4a5));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_4f54754f71b9dd6e", &function_380fc4a5);
	/#
		assert(isscriptfunctionptr(&function_545f48af));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_305325825d9f1ae9", &function_545f48af);
	/#
		assert(isscriptfunctionptr(&function_42d0830a));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_188114dd969b5dd5", &function_42d0830a);
	/#
		assert(isscriptfunctionptr(&function_5c25cce9));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_79093a39082de682", &function_5c25cce9);
	/#
		assert(isscriptfunctionptr(&function_5070830c));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_4544909102899fea", &function_5070830c);
	/#
		assert(isscriptfunctionptr(&function_d33f94e));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_170557ad6e763f0c", &function_d33f94e);
	/#
		assert(isscriptfunctionptr(&function_4b63f114));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_5676e5630fdedd2c", &function_4b63f114);
	/#
		assert(isscriptfunctionptr(&function_46e10c70));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_7cb881b920ccf02e", &function_46e10c70);
	/#
		assert(isscriptfunctionptr(&function_d778b630));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_1e786509dc63e8d5", &function_d778b630);
	/#
		assert(isscriptfunctionptr(&function_44c1658c));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_65a3b6de862fb75a", &function_44c1658c);
	/#
		assert(isscriptfunctionptr(&function_6e3a88b1));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_4b147f3238fcde5e", &function_6e3a88b1);
	/#
		assert(isscriptfunctionptr(&function_a14fcce8));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_5ce32e790014a59", &function_a14fcce8);
	/#
		assert(isscriptfunctionptr(&function_3bdb520f));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_dd673574a092994", &function_3bdb520f);
	/#
		assert(isscriptfunctionptr(&function_2154581b));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_604e4765f2e53c69", &function_2154581b);
	/#
		assert(isscriptfunctionptr(&function_7b89edb0));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_4a436c24681915c9", &function_7b89edb0);
	/#
		assert(isscriptfunctionptr(&function_8e782bd8));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_3e8af19176b18981", &function_8e782bd8);
	/#
		assert(isscriptfunctionptr(&function_850378bc));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_f99aa9fd7ca1763", &function_850378bc);
	/#
		assert(isscriptfunctionptr(&function_c9181afb));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_d426e2923cd605f", &function_c9181afb);
	/#
		assert(isscriptfunctionptr(&function_bf6d273f));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_6e9c0fd10ee65237", &function_bf6d273f);
	/#
		assert(isscriptfunctionptr(&function_bd9179c));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_1122d04b4a1feb63", &function_bd9179c);
	/#
		assert(isscriptfunctionptr(&function_13f6d246));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_136f063162bf4aa2", &function_13f6d246);
	/#
		assert(isscriptfunctionptr(&function_e37d4e19));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_24bc3164c6e2d00a", &function_e37d4e19);
	/#
		assert(isscriptfunctionptr(&function_218044b0));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_347c189df97826cb", &function_218044b0);
	/#
		assert(isscriptfunctionptr(&function_553ec0ae));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_6e07bf77046e74de", &function_553ec0ae);
	/#
		assert(isscriptfunctionptr(&function_f60a1f74));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_789e829d5e75ebb6", &function_f60a1f74);
	/#
		assert(isscriptfunctionptr(&function_9397dd2f));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_29e39b41a2ae57c6", &function_9397dd2f);
	/#
		assert(isscriptfunctionptr(&function_d5e64bba));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_696fd459823b4d1c", &function_d5e64bba);
	/#
		assert(isscriptfunctionptr(&function_6fc64eed));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_72b6cfe3e9c93972", &function_6fc64eed);
	/#
		assert(isscriptfunctionptr(&function_6254c264));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_52b10d159b214f3d", &function_6254c264);
	/#
		assert(isscriptfunctionptr(&function_e5ef0d0d));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_375d2172d1ccc231", &function_e5ef0d0d);
	/#
		assert(isscriptfunctionptr(&function_e456ad9b));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_78f3493bbe2fc0a6", &function_e456ad9b);
	animationstatenetwork::registernotetrackhandlerfunction("steiner_blast_fire", &function_46f4d406);
	animationstatenetwork::registernotetrackhandlerfunction("steiner_bomb_fire", &function_fc9189dd);
	animationstatenetwork::registernotetrackhandlerfunction("steiner_end_split_invulnerability", &function_208c255d);
	/#
		assert(isscriptfunctionptr(&function_829cfcc8));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_3bd518a057cb317c", &function_829cfcc8);
}

/*
	Name: function_7ec99c76
	Namespace: namespace_88795f45
	Checksum: 0x968196A8
	Offset: 0x2288
	Size: 0x634
	Parameters: 0
	Flags: Linked
*/
function function_7ec99c76()
{
	self.no_gib = 1;
	self.instakill_func = &zm_powerups::function_16c2586a;
	self.zombie_move_speed = "walk";
	self.cant_move_cb = &zombiebehavior::function_79fe956f;
	self.var_306ee014 = &function_cabc8b69;
	self.var_81e5ae7 = &function_82654cab;
	self.closest_player_override = &zm_utility::function_3d70ba7a;
	self.allowdeath = 1;
	self.variant_type = 0;
	self.var_15d21bbf = 1;
	self.var_126d7bef = 1;
	self.ignore_round_spawn_failsafe = 1;
	self.var_f0d59f6d = 0;
	self.var_216935f8 = 1;
	if(!isdefined(self.var_9fde8624) || self function_ba878b50() || self.var_9fde8624 === #"hash_5605f3a585b3ef9f")
	{
		self.var_53bac70d = 1;
	}
	if(!isdefined(self.var_9fde8624) || self function_3758a4e7() || self.var_9fde8624 === #"hash_5605f3a585b3ef9f")
	{
		self.var_22b8f534 = 1;
	}
	if(!isdefined(self.var_9fde8624) || self.var_9fde8624 === #"hash_5605f3a585b3ef9f")
	{
		self.var_8d1d18aa = 1;
	}
	self.var_3ad8ef86 = 0;
	self.var_b52fc691 = 0;
	self.var_fcca372 = 0;
	if(!isdefined(self.ai))
	{
		self.ai = spawnstruct();
	}
	self.ai.var_a02f86e7 = 0;
	self.ai.var_5dc77566 = 0;
	self.ai.var_b13e6817 = 0;
	self.ai.var_76786d9c = 0;
	self.ai.var_fad877bf = 0;
	self.ai.var_2642a09b = 0;
	self.ai.var_a29f9a91 = 0;
	self.ai.var_8c90ae8e = 0;
	self.ai.var_bb06b848 = 1;
	self.ai.canstrafe = 0;
	self.ai.var_e93366a = 0;
	self.ai.var_a49798e7 = 0;
	self.ai.var_3dbed9a0 = 0;
	self.ai.var_4beb90f3 = 1;
	self.ai.var_8c8fb85a = 0;
	self.ai.var_26b09b96 = 1;
	self.var_28621cf4 = "j_head";
	self.var_e5365d8a = (0, 0, 0);
	self.var_67faa700 = 1;
	if(!zm_utility::is_survival())
	{
		self.no_powerups = 1;
	}
	self.ai.var_b90dccd6 = 0;
	self.ai.var_62741bfb = 0;
	if(is_true(self.var_22b8f534) && !isdefined(level.var_879dbfb8))
	{
		level.var_879dbfb8 = 0;
	}
	self.var_b077b73d = &function_b077b73d;
	self.var_fe72f961 = &function_617dea8a;
	self.var_ee833cd6 = &function_ef8a9f03;
	aiutility::addaioverridedamagecallback(self, &function_4e005f8f);
	zm_score::function_e5d6e6dd(#"hash_7c0d83ac1e845ac2", 60);
	self zm_score::function_82732ced();
	self zm_powerup_nuke::function_9a79647b(0.5);
	level thread zm_spawner::zombie_death_event(self);
	self thread function_ed79082a();
	if(getdvarint(#"hash_7bb1af7c8592abdf", 0))
	{
		self function_5ac86e25();
	}
	if(!self function_6b87eed1())
	{
		self.var_94378ef = 1;
		if(self function_1e521615())
		{
			self.var_94378ef = 1;
		}
	}
	if(self function_6b87eed1())
	{
		self thread function_3c494a14();
	}
	self flag::init("steiner_split_invulnerable", 0);
	if(self function_6b87eed1())
	{
		if(getdvarint(#"hash_63879de6b2db7236", 1) > 0 && self.targetname !== "debug_ai" && self.targetname !== "debug_idle_ai")
		{
			self flag::set_val("steiner_split_invulnerable", 1);
			self thread function_2d1a3809();
		}
	}
}

/*
	Name: function_2d1a3809
	Namespace: namespace_88795f45
	Checksum: 0xA515499A
	Offset: 0x28C8
	Size: 0xDC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_2d1a3809()
{
	level endon(#"end_game");
	self endon(#"death");
	self waittilltimeout(1, #"hash_200053f79d3c5c19");
	if(isdefined(self.intro_anim))
	{
		anim_length = getanimlength(self.intro_anim);
		notetrack_time = getnotetracktimes(self.intro_anim, "steiner_end_split_invulnerability")[0];
		time = anim_length * notetrack_time;
		wait(time);
	}
	function_208c255d(self);
}

/*
	Name: function_ef8a9f03
	Namespace: namespace_88795f45
	Checksum: 0xADF365A5
	Offset: 0x29B0
	Size: 0xE
	Parameters: 0
	Flags: Linked, Private
*/
function private function_ef8a9f03()
{
	self.no_powerups = 0;
}

/*
	Name: function_cf0706a7
	Namespace: namespace_88795f45
	Checksum: 0x58324A6
	Offset: 0x29C8
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function function_cf0706a7()
{
	namespace_81245006::initweakpoints(self);
}

/*
	Name: function_e96e00cc
	Namespace: namespace_88795f45
	Checksum: 0x2E4586DB
	Offset: 0x29F0
	Size: 0x7C
	Parameters: 0
	Flags: Private
*/
function private function_e96e00cc()
{
	/#
		if(isarchetypeloaded(#"hash_7c0d83ac1e845ac2"))
		{
			level flag::wait_till("");
			zm_devgui::add_custom_devgui_callback(&function_15677aa0);
			function_1d9f7b18();
		}
	#/
}

/*
	Name: function_1d9f7b18
	Namespace: namespace_88795f45
	Checksum: 0xFF3674C2
	Offset: 0x2A78
	Size: 0x38
	Parameters: 0
	Flags: Private
*/
function private function_1d9f7b18()
{
	/#
		if(is_true(level.var_a4fe61a4))
		{
			return;
		}
		level.var_a4fe61a4 = 1;
	#/
}

/*
	Name: function_15677aa0
	Namespace: namespace_88795f45
	Checksum: 0x5E42FAB0
	Offset: 0x2AB8
	Size: 0x992
	Parameters: 1
	Flags: Private
*/
function private function_15677aa0(cmd)
{
	/#
		switch(cmd)
		{
			case "hash_fb30e673c6ed7ed":
			case "hash_3710ddeafb2df7df":
			case "hash_7791897f03cdc3bf":
			case "hash_794aad9f189f1889":
			{
				player = getplayers()[0];
				v_direction = player getplayerangles();
				v_direction = anglestoforward(v_direction) * 8000;
				eye = player geteye();
				trace = bullettrace(eye, eye + v_direction, 0, undefined);
				var_380c580a = positionquery_source_navigation(trace[#"position"], 128, 256, 128, 20);
				s_spot = spawnstruct();
				if(isdefined(var_380c580a) && var_380c580a.data.size > 0)
				{
					s_spot.origin = var_380c580a.data[0].origin;
				}
				else
				{
					s_spot.origin = player.origin;
				}
				s_spot.angles = (0, player.angles[1] - 180, 0);
				spawner = #"spawner_zm_steiner";
				if(cmd == "")
				{
					spawner = #"spawner_zm_steiner_split_radiation_blast";
				}
				else
				{
					if(cmd == "")
					{
						spawner = #"spawner_zm_steiner_split_radiation_bomb";
					}
					else if(cmd == "")
					{
						function_f045e7c(s_spot, 0);
						break;
					}
				}
				steiner = spawnactor(spawner, s_spot.origin, s_spot.angles);
				if(isdefined(steiner))
				{
					steiner forceteleport(s_spot.origin);
				}
				break;
			}
			case "hash_7168487d1ca40ace":
			{
				steiners = getaiarchetypearray(#"hash_7c0d83ac1e845ac2");
				foreach(steiner in steiners)
				{
					steiner thread function_735ef74d();
				}
				break;
			}
			case "hash_56fe56d42aeaae84":
			{
				steiners = getaiarchetypearray(#"hash_7c0d83ac1e845ac2");
				foreach(steiner in steiners)
				{
					if(isalive(steiner))
					{
						steiner function_bf898e7e(!steiner function_b37b32b9());
					}
				}
				break;
			}
			case "hash_6c5505a13bdeb727":
			{
				steiners = getaiarchetypearray(#"hash_7c0d83ac1e845ac2");
				foreach(steiner in steiners)
				{
					if(isalive(steiner))
					{
						if(!isdefined(steiner.var_9fde8624) || steiner function_ba878b50() || steiner.var_9fde8624 === #"hash_5605f3a585b3ef9f")
						{
							steiner function_af554aaf(!is_true(steiner.var_53bac70d));
						}
					}
				}
				break;
			}
			case "hash_359a6fc8ff117087":
			{
				steiners = getaiarchetypearray(#"hash_7c0d83ac1e845ac2");
				foreach(steiner in steiners)
				{
					if(isalive(steiner))
					{
						if(!isdefined(steiner.var_9fde8624) || steiner function_3758a4e7() || steiner.var_9fde8624 === #"hash_5605f3a585b3ef9f")
						{
							steiner function_16a8babd(!is_true(steiner.var_22b8f534));
						}
					}
				}
				break;
			}
			case "hash_24ad0cbc87557614":
			{
				steiners = getaiarchetypearray(#"hash_7c0d83ac1e845ac2");
				foreach(steiner in steiners)
				{
					if(isalive(steiner))
					{
						steiner.ai.var_bb06b848 = !steiner.ai.var_bb06b848;
					}
				}
				break;
			}
			case "hash_2359be32da56aa21":
			{
				steiners = getaiarchetypearray(#"hash_7c0d83ac1e845ac2");
				split_blast = undefined;
				split_bomb = undefined;
				foreach(steiner in steiners)
				{
					if(!isdefined(steiner.var_9fde8624) || steiner.var_9fde8624 === #"hash_5605f3a585b3ef9f")
					{
						continue;
					}
					if(steiner function_ba878b50() && !isdefined(split_blast))
					{
						split_blast = steiner;
					}
					else if(steiner function_3758a4e7() && !isdefined(split_bomb))
					{
						split_bomb = steiner;
					}
					if(isdefined(split_blast) && isdefined(split_bomb))
					{
						level thread function_67a0e9a2([1:split_bomb, 0:split_blast], split_blast);
						break;
					}
				}
				break;
			}
			case "hash_108d247458cb597b":
			{
				function_bbb547de(250);
				break;
			}
			case "hash_77e4b4a0f4904933":
			{
				function_32af84be(level.players[0]);
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
	Name: update_dvars
	Namespace: namespace_88795f45
	Checksum: 0x5D214B87
	Offset: 0x3458
	Size: 0x48
	Parameters: 0
	Flags: None
*/
function update_dvars()
{
	/#
		while(true)
		{
			wait(1);
			level.var_a71c09f8 = getdvarint(#"hash_65428d4970618b19", 0);
		}
	#/
}

/*
	Name: function_ee21651d
	Namespace: namespace_88795f45
	Checksum: 0xA62826BA
	Offset: 0x34A8
	Size: 0x4C
	Parameters: 1
	Flags: None
*/
function function_ee21651d(message)
{
	/#
		if(is_true(level.var_a71c09f8))
		{
			println("" + message);
		}
	#/
}

/*
	Name: spawn_single
	Namespace: namespace_88795f45
	Checksum: 0x8DD9DE7B
	Offset: 0x3500
	Size: 0x1E0
	Parameters: 3
	Flags: Linked
*/
function spawn_single(b_force_spawn, var_eb3a8721, var_bc66d64b)
{
	if(!isdefined(var_eb3a8721))
	{
		var_eb3a8721 = 0;
	}
	if(!var_eb3a8721 && !function_fbb9b8fb())
	{
		return undefined;
	}
	a_s_locs = struct::get_array("spawn_location", "script_noteworthy");
	if(a_s_locs.size > 0)
	{
		s_spawn_loc = a_s_locs[0];
	}
	if(!isdefined(s_spawn_loc))
	{
		/#
			if(getdvarint(#"hash_1f8efa579fee787c", 0))
			{
				iprintlnbold("");
			}
		#/
		return undefined;
	}
	if(isdefined(level.var_9d098364))
	{
		spawner_name = level.var_9d098364;
	}
	else
	{
		spawner_name = #"spawner_zm_steiner";
	}
	ai = spawnactor(spawner_name, s_spawn_loc.origin, s_spawn_loc.angles);
	if(isdefined(ai))
	{
		ai.script_string = s_spawn_loc.script_string;
		ai.find_flesh_struct_string = s_spawn_loc.find_flesh_struct_string;
		ai.check_point_in_enabled_zone = &zm_utility::check_point_in_playable_area;
		ai.ignore_enemy_count = 1;
		if(isdefined(var_bc66d64b))
		{
			ai forceteleport(var_bc66d64b.origin, var_bc66d64b.angles);
		}
		else
		{
			ai thread function_f0811059();
		}
	}
	return ai;
}

/*
	Name: function_f0811059
	Namespace: namespace_88795f45
	Checksum: 0x551507DB
	Offset: 0x36E8
	Size: 0x12C
	Parameters: 0
	Flags: Linked
*/
function function_f0811059()
{
	level endon(#"game_ended");
	self endon(#"death");
	count = 0;
	while(count < 10)
	{
		if(isdefined(level.var_2a8acd42))
		{
			s_spawn_loc = [[level.var_2a8acd42]]();
		}
		else if(level.zm_loc_types[#"steiner_location"].size > 0)
		{
			s_spawn_loc = array::random(level.zm_loc_types[#"steiner_location"]);
		}
		if(isdefined(s_spawn_loc))
		{
			if(self teleport(s_spawn_loc.origin, s_spawn_loc.angles))
			{
				return;
			}
		}
		count++;
		wait(0.3);
	}
	if(isdefined(s_spawn_loc))
	{
		self forceteleport(s_spawn_loc.origin, s_spawn_loc.angles);
	}
}

/*
	Name: function_99c14949
	Namespace: namespace_88795f45
	Checksum: 0x54E058F
	Offset: 0x3820
	Size: 0x488
	Parameters: 0
	Flags: Linked
*/
function function_99c14949()
{
	self endon(#"death");
	/#
		function_ee21651d("");
	#/
	while(true)
	{
		var_31f7011a = arraysortclosest(getplayers(), self.origin);
		foreach(player in var_31f7011a)
		{
			if(zm_utility::is_player_valid(player))
			{
				closest_player = player;
				break;
			}
		}
		if(isdefined(closest_player))
		{
			break;
		}
		util::wait_network_frame();
	}
	var_a1ef7f29 = [];
	if(isdefined(level.var_2a8acd42))
	{
		spawn_locs = [[level.var_2a8acd42]](1);
		if(isarray(spawn_locs))
		{
			var_a1ef7f29 = spawn_locs;
		}
		else
		{
			array::add(var_a1ef7f29, spawn_locs);
		}
	}
	else if(level.zm_loc_types[#"steiner_location"].size > 0)
	{
		var_a1ef7f29 = level.zm_loc_types[#"steiner_location"];
	}
	var_69681a59 = [];
	if(isdefined(level.active_zone_names) && isarray(var_a1ef7f29) && var_a1ef7f29.size > 0)
	{
		foreach(spawn_loc in var_a1ef7f29)
		{
			if(isdefined(spawn_loc.zone_name) && array::contains(level.active_zone_names, spawn_loc.zone_name))
			{
				if(!isdefined(var_69681a59))
				{
					var_69681a59 = [];
				}
				else if(!isarray(var_69681a59))
				{
					var_69681a59 = array(var_69681a59);
				}
				var_69681a59[var_69681a59.size] = spawn_loc;
			}
		}
	}
	if(var_69681a59.size < 1)
	{
		/#
			function_ee21651d("");
		#/
		return true;
	}
	spawn_points = arraysortclosest(var_69681a59, closest_player.origin, undefined, 500);
	if(spawn_points.size > 0)
	{
		var_b2aa54a9 = spawn_points[0];
	}
	else
	{
		var_b2aa54a9 = arraygetfarthest(closest_player.origin, var_69681a59);
	}
	if(!isdefined(var_b2aa54a9))
	{
		/#
			function_ee21651d("");
		#/
		return true;
	}
	/#
		function_ee21651d((("" + self.origin) + "") + var_b2aa54a9.origin);
	#/
	self function_bf898e7e(0);
	self namespace_e0710ee6::function_a8dc3363(var_b2aa54a9);
	self clientfield::increment("steiner_cleanup_teleport_clientfield");
	self function_bf898e7e(1);
	return true;
}

/*
	Name: function_735ef74d
	Namespace: namespace_88795f45
	Checksum: 0xA1DC681C
	Offset: 0x3CB0
	Size: 0x84
	Parameters: 0
	Flags: Linked, Private
*/
function private function_735ef74d()
{
	if(isalive(self))
	{
		self.marked_for_death = 1;
		self.allowdeath = 1;
		self.var_98f1f37c = 1;
		self kill(undefined, undefined, undefined, undefined, undefined, 1);
		waitframe(1);
		if(isdefined(self))
		{
			self delete();
		}
	}
}

/*
	Name: function_f4788553
	Namespace: namespace_88795f45
	Checksum: 0xCC39989D
	Offset: 0x3D40
	Size: 0x1C2
	Parameters: 1
	Flags: Linked
*/
function function_f4788553(var_dbce0c44)
{
	if(isdefined(level.var_ad49daf9) && level.round_number < level.var_ad49daf9)
	{
		return 0;
	}
	n_player_count = zm_utility::function_a2541519(getplayers().size);
	if(n_player_count == 1)
	{
		switch(level.var_b15745d6)
		{
			case 0:
			case 1:
			case 2:
			{
				var_2506688 = 1;
				var_1797c23a = 1;
				break;
			}
			default:
			{
				var_2506688 = 1;
				var_1797c23a = 2;
			}
		}
	}
	else
	{
		switch(level.var_b15745d6)
		{
			case 0:
			case 1:
			{
				var_2506688 = 1;
				var_1797c23a = 1;
				break;
			}
			case 2:
			case 3:
			{
				var_2506688 = 2;
				var_1797c23a = 2;
				break;
			}
			default:
			{
				var_2506688 = 3;
				var_1797c23a = 3;
			}
		}
	}
	return function_21a3a673(var_2506688, var_1797c23a);
}

/*
	Name: function_3ced6468
	Namespace: namespace_88795f45
	Checksum: 0x67CA84AB
	Offset: 0x3F10
	Size: 0x134
	Parameters: 1
	Flags: Linked
*/
function function_3ced6468(n_round_number)
{
	level endon(#"end_game");
	if(!isdefined(level.var_b15745d6))
	{
		level.var_b15745d6 = 0;
	}
	while(true)
	{
		level waittill(#"hash_5d3012139f083ccb");
		if(namespace_c3287616::function_d0db51fc(#"hash_7c0d83ac1e845ac2"))
		{
			level.var_b15745d6++;
			n_player_count = zm_utility::function_a2541519(getplayers().size);
			if(n_player_count == 1)
			{
				level.var_ad49daf9 = level.round_number + function_21a3a673(3, 5);
			}
			else
			{
				level.var_ad49daf9 = level.round_number + function_21a3a673(3, 4);
			}
		}
	}
}

/*
	Name: round_spawn
	Namespace: namespace_88795f45
	Checksum: 0x9AF3ACAF
	Offset: 0x4050
	Size: 0x2E
	Parameters: 0
	Flags: Linked
*/
function round_spawn()
{
	ai = spawn_single();
	if(isdefined(ai))
	{
		return true;
	}
	return false;
}

/*
	Name: function_fbb9b8fb
	Namespace: namespace_88795f45
	Checksum: 0xB3205E97
	Offset: 0x4088
	Size: 0xB4
	Parameters: 0
	Flags: Linked
*/
function function_fbb9b8fb()
{
	var_77c7cc93 = function_5e039106();
	var_60f05a03 = function_1f8ac25d();
	if(!is_true(level.var_76934955) && (is_true(level.var_fe2bb2ac) || var_77c7cc93 >= var_60f05a03 || !level flag::get("spawn_zombies")))
	{
		return false;
	}
	return true;
}

/*
	Name: function_1f8ac25d
	Namespace: namespace_88795f45
	Checksum: 0x55E0990A
	Offset: 0x4148
	Size: 0xCE
	Parameters: 0
	Flags: Linked
*/
function function_1f8ac25d()
{
	n_player_count = zm_utility::function_a2541519(getplayers().size);
	switch(n_player_count)
	{
		case 1:
		{
			return 1;
			break;
		}
		case 2:
		{
			return 3;
			break;
		}
		case 3:
		{
			return 3;
			break;
		}
		case 4:
		{
			return 3;
			break;
		}
		case 5:
		{
			return 3;
			break;
		}
	}
	return 1;
}

/*
	Name: function_5e039106
	Namespace: namespace_88795f45
	Checksum: 0x5234B0BB
	Offset: 0x4220
	Size: 0xF4
	Parameters: 0
	Flags: Linked
*/
function function_5e039106()
{
	var_5a2d0d60 = getaiarchetypearray(#"hash_7c0d83ac1e845ac2");
	var_77c7cc93 = var_5a2d0d60.size;
	foreach(var_494993c6 in var_5a2d0d60)
	{
		if(!isalive(var_494993c6) || is_true(var_494993c6.ai.var_b90dccd6))
		{
			var_77c7cc93--;
		}
	}
	return var_77c7cc93;
}

/*
	Name: function_f26fe009
	Namespace: namespace_88795f45
	Checksum: 0xC774116D
	Offset: 0x4320
	Size: 0xC0
	Parameters: 1
	Flags: Linked
*/
function function_f26fe009(params)
{
	if(self.archetype !== #"hash_7c0d83ac1e845ac2")
	{
		return;
	}
	self function_bf898e7e(0);
	self thread function_4b193227();
	if(self function_9cc1ebd1())
	{
		level notify(#"hash_7e3660d8d125a63a", {#aitype:self.aitype, #position:self.origin});
	}
}

/*
	Name: function_61e1c2a1
	Namespace: namespace_88795f45
	Checksum: 0x4E7F9A20
	Offset: 0x43E8
	Size: 0x18C
	Parameters: 1
	Flags: Linked
*/
function function_61e1c2a1(params)
{
	if(self.archetype !== #"hash_7c0d83ac1e845ac2")
	{
		return;
	}
	if(self.team == #"allies")
	{
		self.health = self.maxhealth;
		if(!isplayer(params.eattacker))
		{
			if(self.ai.var_8c90ae8e)
			{
				self.ai.var_a49798e7 = 1;
				self notify(#"hash_39f4b987812e1540");
				self thread function_2a30b3a3(6);
			}
		}
	}
	if(isdefined(params.weapon) && namespace_b376a999::function_5fef4201(params.weapon))
	{
		self thread function_c235ead4(3);
	}
	if(isdefined(params.idamage))
	{
		ratio = params.idamage / self.maxhealth;
		if(self function_617dea8a(ratio) == "heavy")
		{
			self.ai.var_7555ca97 = gettime();
			/#
				function_ee21651d("");
			#/
		}
	}
}

/*
	Name: function_4e005f8f
	Namespace: namespace_88795f45
	Checksum: 0x1519AA85
	Offset: 0x4580
	Size: 0x2FA
	Parameters: 13
	Flags: Linked
*/
function function_4e005f8f(inflictor, attacker, damage, dflags, mod, weapon, var_fd90b0bb, point, dir, hitloc, offsettime, boneindex, modelindex)
{
	if(isplayer(dir) && self.team === dir.team)
	{
		return 0;
	}
	damage_type = 1;
	weakpoint = namespace_81245006::function_3131f5dd(self, modelindex, 1);
	if(weakpoint.var_3765e777 === 1 && aiutility::function_69c2d36f(offsettime))
	{
		damage_type = 2;
	}
	var_f54aa440 = hitloc;
	if(function_cabc8b69(self))
	{
		var_f54aa440 = 0;
		damage_type = 4;
	}
	else if(!function_6b87eed1())
	{
		var_dbf39ac4 = function_60722139(self);
		var_f54aa440 = min(hitloc, max(0, self.health - var_dbf39ac4));
		if((self.health - var_f54aa440) <= var_dbf39ac4)
		{
			damage_type = 4;
		}
	}
	if(damage_type === 4)
	{
		var_5f6e2918 = self.var_95d94ac4;
		if(!isdefined(var_5f6e2918))
		{
			var_5f6e2918 = 5;
		}
		if(self ai::is_stunned() && (isdefined(self.var_31cadcc9[#"eq_slow_grenade"]) && isdefined(self.var_31cadcc9[#"eq_slow_grenade"].time) && self.var_31cadcc9[#"eq_slow_grenade"].time > (gettime() - (var_5f6e2918 * 1000))))
		{
			self.var_136c407 = 1;
		}
	}
	if(!aiutility::function_493e5914(offsettime))
	{
		boneindex = aiutility::function_cb552839(self);
	}
	self.var_6936b30b = {#hash_ebcff177:damage_type, #weakpoint:weakpoint};
	return var_f54aa440;
}

/*
	Name: function_cabc8b69
	Namespace: namespace_88795f45
	Checksum: 0x930C2D7B
	Offset: 0x4888
	Size: 0xA8
	Parameters: 1
	Flags: Linked, Private
*/
function private function_cabc8b69(entity)
{
	if(self function_6b87eed1())
	{
		return self flag::get("steiner_split_invulnerable");
	}
	if(self flag::get("kill_hvt_teleporting"))
	{
		return 1;
	}
	var_dbf39ac4 = function_60722139(self);
	if(self.health <= var_dbf39ac4)
	{
		return 1;
	}
	return 0;
}

/*
	Name: function_208c255d
	Namespace: namespace_88795f45
	Checksum: 0xC8A272EC
	Offset: 0x4938
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_208c255d(entity)
{
	entity flag::set_val("steiner_split_invulnerable", 0);
}

/*
	Name: function_82654cab
	Namespace: namespace_88795f45
	Checksum: 0x338DE0BA
	Offset: 0x4970
	Size: 0x94
	Parameters: 1
	Flags: Linked
*/
function function_82654cab(enemy)
{
	enemypos = groundtrace(enemy.origin + vectorscale((0, 0, 1), 8), enemy.origin + (vectorscale((0, 0, -1), 100000)), 0, enemy)[#"position"];
	return !ispointonnavmesh(enemypos, self getpathfindingradius());
}

/*
	Name: function_bf898e7e
	Namespace: namespace_88795f45
	Checksum: 0x163C9DF8
	Offset: 0x4A10
	Size: 0x32
	Parameters: 1
	Flags: Linked
*/
function function_bf898e7e(enable)
{
	if(isdefined(self))
	{
		self.var_216935f8 = is_true(enable);
	}
}

/*
	Name: function_b37b32b9
	Namespace: namespace_88795f45
	Checksum: 0xE55F395F
	Offset: 0x4A50
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_b37b32b9()
{
	return isdefined(self) && is_true(self.var_216935f8);
}

/*
	Name: function_5ac86e25
	Namespace: namespace_88795f45
	Checksum: 0xEBFF3EDF
	Offset: 0x4A80
	Size: 0x264
	Parameters: 0
	Flags: Linked, Private
*/
function private function_5ac86e25()
{
	level endon(#"end_game");
	self endon(#"death", #"entitydeleted");
	var_ef4f2892 = 250;
	if(self function_6b87eed1())
	{
		var_ef4f2892 = int(125);
	}
	var_1e2b1cca = var_ef4f2892 * var_ef4f2892;
	head_origin = self gettagorigin("j_head");
	var_8b1f38b5 = head_origin[2] - self.origin[2];
	params = function_4d1e7b48("dot_steiner_radiation_aura");
	while(isdefined(self) && isalive(self))
	{
		if(!is_true(self.var_216935f8))
		{
			wait(0.2);
			continue;
		}
		players = function_a1ef346b(undefined, self.origin, var_ef4f2892);
		foreach(player in players)
		{
			if(player inlaststand())
			{
				continue;
			}
			if(abs(player.origin[2] - self.origin[2]) > var_8b1f38b5)
			{
				continue;
			}
			player status_effect::status_effect_apply(params, undefined, self);
		}
		wait(0.2);
	}
}

/*
	Name: function_bc9fe637
	Namespace: namespace_88795f45
	Checksum: 0xD0F19372
	Offset: 0x4CF0
	Size: 0x9C
	Parameters: 1
	Flags: Linked
*/
function function_bc9fe637(s_params)
{
	attacker = s_params.eattacker;
	if(isdefined(attacker) && isdefined(attacker.archetype) && attacker.archetype == #"hash_7c0d83ac1e845ac2" && s_params.idamage > 0)
	{
		if(s_params.smeansofdeath == "MOD_MELEE")
		{
			attacker function_5a481a84(self);
		}
	}
}

/*
	Name: function_c235ead4
	Namespace: namespace_88795f45
	Checksum: 0x46E9509B
	Offset: 0x4D98
	Size: 0x198
	Parameters: 1
	Flags: Linked, Private
*/
function private function_c235ead4(time)
{
	if(!getdvar(#"hash_7bb1af7c8592abdf", 0))
	{
		return;
	}
	if(!isdefined(time) || time <= 0)
	{
		return;
	}
	if(!is_true(self.var_216935f8) && !isdefined(self.var_7f1f0ba))
	{
		return;
	}
	self notify(#"hash_2a19d3b2750fdda9");
	self endon(#"death", #"hash_2a19d3b2750fdda9");
	self function_bf898e7e(0);
	var_7f1f0ba = gettime() + (int(time * 1000));
	if(isdefined(self.var_7f1f0ba))
	{
		self.var_7f1f0ba = int(max(self.var_7f1f0ba, var_7f1f0ba));
	}
	else
	{
		self.var_7f1f0ba = var_7f1f0ba;
	}
	while(isalive(self) && isdefined(self.var_7f1f0ba))
	{
		if(gettime() >= self.var_7f1f0ba)
		{
			self function_bf898e7e(1);
			return;
		}
		waitframe(1);
	}
}

/*
	Name: get_enemy
	Namespace: namespace_88795f45
	Checksum: 0xF26F53F3
	Offset: 0x4F38
	Size: 0x6A
	Parameters: 0
	Flags: Linked, Private
*/
function private get_enemy()
{
	if(!zm_utility::is_survival())
	{
		return (isdefined(self.var_93a62fe) ? self.var_93a62fe : self.enemy);
	}
	if(isentity(self.attackable))
	{
		return self.attackable;
	}
	return self.favoriteenemy;
}

/*
	Name: is_enemy_valid
	Namespace: namespace_88795f45
	Checksum: 0xAB69BAAE
	Offset: 0x4FB0
	Size: 0x8E
	Parameters: 1
	Flags: Linked, Private
*/
function private is_enemy_valid(enemy)
{
	return isalive(enemy) && (!isplayer(enemy) || !enemy inlaststand()) && !is_true(enemy.ignoreme) && !enemy isnotarget();
}

/*
	Name: can_see_enemy
	Namespace: namespace_88795f45
	Checksum: 0xE75AF3E9
	Offset: 0x5048
	Size: 0x9A
	Parameters: 0
	Flags: Linked, Private
*/
function private can_see_enemy()
{
	if(!isdefined(self.can_see_enemy))
	{
		self.can_see_enemy = 0;
	}
	if(!isdefined(self.var_6ed00311))
	{
		self.var_6ed00311 = 0;
	}
	enemy = self get_enemy();
	if(isdefined(enemy) && self.var_6ed00311 < gettime())
	{
		self.can_see_enemy = self cansee(enemy);
		self.var_6ed00311 = gettime() + 50;
	}
	return self.can_see_enemy;
}

/*
	Name: function_880fad96
	Namespace: namespace_88795f45
	Checksum: 0x6D0B17F0
	Offset: 0x50F0
	Size: 0x16
	Parameters: 0
	Flags: Linked, Private
*/
function private function_880fad96()
{
	return self.ai.var_2642a09b != 0;
}

/*
	Name: function_c124c913
	Namespace: namespace_88795f45
	Checksum: 0xA9B54388
	Offset: 0x5110
	Size: 0x20
	Parameters: 1
	Flags: Linked, Private
*/
function private function_c124c913(skill)
{
	return self.ai.var_2642a09b === skill;
}

/*
	Name: function_1da02b50
	Namespace: namespace_88795f45
	Checksum: 0x8806D1A5
	Offset: 0x5138
	Size: 0x4E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_1da02b50(var_b268a2ed)
{
	/#
		assert(var_b268a2ed >= 0 && var_b268a2ed <= 3);
	#/
	self.ai.var_2642a09b = var_b268a2ed;
}

/*
	Name: function_9ee55afa
	Namespace: namespace_88795f45
	Checksum: 0x7CD54E1D
	Offset: 0x5190
	Size: 0x56
	Parameters: 0
	Flags: Linked, Private
*/
function private function_9ee55afa()
{
	self.ai.var_2642a09b = 0;
	self.var_fcca372 = gettime() + (int(3 * 1000));
	self notify(#"hash_58f0b0e23afeccb9");
}

/*
	Name: function_efd416d6
	Namespace: namespace_88795f45
	Checksum: 0x75A2C841
	Offset: 0x51F0
	Size: 0x3E
	Parameters: 0
	Flags: Linked, Private
*/
function private function_efd416d6()
{
	return !is_true(self.var_25e2200c) && (!isdefined(self.var_fcca372) || self.var_fcca372 < gettime());
}

/*
	Name: function_969dd1ca
	Namespace: namespace_88795f45
	Checksum: 0xECFBF381
	Offset: 0x5238
	Size: 0x20
	Parameters: 1
	Flags: Linked, Private
*/
function private function_969dd1ca(var_ada67e63)
{
	return self.ai.var_2642a09b === var_ada67e63;
}

/*
	Name: function_af554aaf
	Namespace: namespace_88795f45
	Checksum: 0xDCEADA73
	Offset: 0x5260
	Size: 0x6E
	Parameters: 1
	Flags: Linked
*/
function function_af554aaf(enable)
{
	if(!isdefined(self))
	{
		return;
	}
	var_53bac70d = is_true(self.var_53bac70d);
	self.var_53bac70d = is_true(enable);
	if(var_53bac70d != self.var_53bac70d)
	{
		self.var_3ad8ef86 = 0;
	}
}

/*
	Name: function_7a893a7
	Namespace: namespace_88795f45
	Checksum: 0xF2973B5F
	Offset: 0x52D8
	Size: 0x106
	Parameters: 1
	Flags: Linked, Private
*/
function private function_7a893a7(entity)
{
	if(!is_true(entity.var_53bac70d))
	{
		return 0;
	}
	if(entity function_969dd1ca(1))
	{
		return 1;
	}
	enemy = self get_enemy();
	if(!is_enemy_valid(enemy))
	{
		return 0;
	}
	if(!is_true(entity.var_1fa24724))
	{
		var_8ff86729 = distance2dsquared(self.origin, enemy.origin);
		if(var_8ff86729 <= 90000)
		{
			return 0;
		}
	}
	return entity.ai.var_a02f86e7;
}

/*
	Name: function_baffe829
	Namespace: namespace_88795f45
	Checksum: 0x4E46ADEA
	Offset: 0x53E8
	Size: 0x24
	Parameters: 1
	Flags: Linked, Private
*/
function private function_baffe829(entity)
{
	entity function_1da02b50(1);
}

/*
	Name: function_fe1e617c
	Namespace: namespace_88795f45
	Checksum: 0xF406095C
	Offset: 0x5418
	Size: 0x124
	Parameters: 1
	Flags: Linked, Private
*/
function private function_fe1e617c(entity)
{
	if(isalive(entity))
	{
		var_16122b95 = 2 * 0.25;
		cooldown = randomfloatrange(1, 2);
		entity.var_3ad8ef86 = gettime() + (int((var_16122b95 + cooldown) * 1000));
		entity.ai.var_a02f86e7 = 0;
		entity.var_f0d59f6d = entity.var_f0d59f6d + 1;
		entity.variant_type = 0;
		if(is_true(entity.ai.var_de17c5a5))
		{
			entity.variant_type = 2;
			entity.ai.var_de17c5a5 = undefined;
		}
		entity function_9ee55afa();
	}
}

/*
	Name: function_3aa93442
	Namespace: namespace_88795f45
	Checksum: 0xB892FA7E
	Offset: 0x5548
	Size: 0x4AC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_3aa93442(entity)
{
	level endon(#"end_game");
	entity endon(#"death", #"entitydeleted");
	weapon = getweapon(#"hash_2b47921791da6f0");
	tags = [2:"j_head", 1:"j_head", 0:"j_head"];
	if(entity function_6b87eed1())
	{
		tags = [2:"j_head", 1:"j_head", 0:"j_head"];
	}
	/#
		assert(tags.size >= 3);
	#/
	count = 0;
	var_8c0e4cc3 = undefined;
	while(count < 3)
	{
		if(!isalive(entity))
		{
			return;
		}
		enemy = entity get_enemy();
		if(is_enemy_valid(enemy))
		{
			target_origin = enemy.origin;
			velocity = enemy getvelocity();
			dist = distance(entity.origin, target_origin);
			predict_time = dist / weapon.projectilespeed;
			target_origin = target_origin + (velocity * predict_time);
			var_68ff3c95 = enemy.origin[2] - entity.origin[2];
			if(var_68ff3c95 > 80)
			{
				target_origin = target_origin + vectorscale((0, 0, 1), 36);
			}
			else
			{
				var_b495d5d6 = randomintrange(30, 100);
				rand_x = randomintrange(0, var_b495d5d6);
				rand_y = var_b495d5d6 - rand_x;
				if(math::cointoss())
				{
					rand_x = rand_x * -1;
				}
				if(math::cointoss())
				{
					rand_y = rand_y * -1;
				}
				target_origin = target_origin + (rand_x, rand_y, 0);
			}
			if(isdefined(var_8c0e4cc3))
			{
				var_5193085 = distancesquared(target_origin, var_8c0e4cc3);
				if(var_5193085 < 2500)
				{
					rand_x = randomintrange(0, 50);
					rand_y = 50 - rand_x;
					if(math::cointoss())
					{
						rand_x = rand_x * -1;
					}
					if(math::cointoss())
					{
						rand_y = rand_y * -1;
					}
					target_origin = target_origin + (rand_x, rand_y, 0);
				}
			}
			source_origin = entity gettagorigin(tags[count]);
			entity playsoundontag(#"hash_67495e1530f787db", tags[count]);
			/#
				if(getdvarint(#"hash_77b40b42481ff900", 0))
				{
					recordsphere(target_origin, 20, (1, 0, 0));
				}
			#/
			magicbullet(weapon, source_origin, target_origin, entity);
			var_8c0e4cc3 = target_origin;
		}
		count++;
		if(-1)
		{
			wait(0.25);
		}
	}
}

/*
	Name: function_7709f2df
	Namespace: namespace_88795f45
	Checksum: 0x2F8425E3
	Offset: 0x5A00
	Size: 0xD0
	Parameters: 13
	Flags: Linked, Private
*/
function private function_7709f2df(inflictor, attacker, damage, flags, meansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype)
{
	var_7aa37d9f = surfacetype;
	if(isdefined(psoffsettime) && isdefined(boneindex) && isdefined(psoffsettime.team) && isdefined(boneindex.team) && psoffsettime.team == boneindex.team)
	{
		var_7aa37d9f = 0;
	}
	return var_7aa37d9f;
}

/*
	Name: function_46f4d406
	Namespace: namespace_88795f45
	Checksum: 0xEFA72173
	Offset: 0x5AD8
	Size: 0x3C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_46f4d406(entity)
{
	if(isalive(entity))
	{
		level thread function_3aa93442(entity);
	}
}

/*
	Name: function_829cfcc8
	Namespace: namespace_88795f45
	Checksum: 0x74F1FA75
	Offset: 0x5B20
	Size: 0x52E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_829cfcc8(entity)
{
	if(entity function_880fad96())
	{
		return;
	}
	if(self.ignoreall)
	{
		return;
	}
	if(!isdefined(entity.var_f8bb81c1))
	{
		random = randomintrange(1, 3);
		entity.var_f8bb81c1 = random;
	}
	if(entity function_6b87eed1())
	{
		entity.var_f8bb81c1 = 0;
	}
	entity.ai.var_a02f86e7 = 0;
	entity.ai.var_5dc77566 = 0;
	entity.ai.var_b13e6817 = 0;
	if(!entity function_efd416d6())
	{
		return;
	}
	enemy = entity get_enemy();
	if(!isdefined(enemy) || !is_enemy_valid(enemy))
	{
		if(!zm_utility::is_survival())
		{
			entity clearentitytarget();
		}
		if(zm_utility::is_classic() && !isdefined(entity.var_cc1c538e))
		{
			entity.var_cc1c538e = entity zm_cleanup::get_escape_position();
		}
		if(isdefined(entity.var_cc1c538e))
		{
			entity setgoal(entity.var_cc1c538e.origin, 0, 32);
		}
		else if(!zm_utility::is_survival())
		{
			entity setgoal(entity.origin, 0, 32);
		}
		return;
	}
	entity.var_cc1c538e = undefined;
	if(!zm_utility::is_survival() && is_enemy_valid(enemy))
	{
		entity setentitytarget(enemy);
	}
	currentvelocity = self getvelocity();
	currentspeed = length(currentvelocity);
	var_eab3f54a = distance2dsquared(entity.origin, enemy.origin);
	if(is_true(entity.var_22b8f534) && entity.var_b52fc691 < gettime() && !function_2bde9dfa(entity) && entity.var_f8bb81c1 <= entity.var_f0d59f6d)
	{
		var_477db4d3 = (currentspeed > 0 ? var_eab3f54a <= 810000 : var_eab3f54a <= 1000000);
		if(var_477db4d3 && entity can_see_enemy())
		{
			entity.ai.var_b13e6817 = 1;
			entity.ai.var_5dc77566 = 1;
		}
	}
	else if(is_true(entity.var_53bac70d) && entity.var_3ad8ef86 < gettime() && !function_2bde9dfa(entity))
	{
		var_477db4d3 = (currentspeed > 0 ? var_eab3f54a <= 810000 : var_eab3f54a <= 1000000);
		if(var_477db4d3 && entity can_see_enemy())
		{
			entity.ai.var_a02f86e7 = 1;
		}
	}
	if(isdefined(entity.ai.var_6d3ee308) && (entity.ai.var_5dc77566 || entity.ai.var_a02f86e7 || zombiebehavior::zombieshouldmeleecondition(entity)))
	{
		if(entity.ai.var_6d3ee308 < gettime())
		{
			entity.variant_type = 0;
		}
		else
		{
			entity.variant_type = 1;
			/#
				function_ee21651d("");
			#/
		}
		entity.ai.var_6d3ee308 = undefined;
	}
}

/*
	Name: function_16a8babd
	Namespace: namespace_88795f45
	Checksum: 0x76B2FAF4
	Offset: 0x6058
	Size: 0x6E
	Parameters: 1
	Flags: Linked
*/
function function_16a8babd(enable)
{
	if(!isdefined(self))
	{
		return;
	}
	var_22b8f534 = is_true(self.var_22b8f534);
	self.var_22b8f534 = is_true(enable);
	if(var_22b8f534 != self.var_22b8f534)
	{
		self.var_b52fc691 = 0;
	}
}

/*
	Name: function_e6d0f1d4
	Namespace: namespace_88795f45
	Checksum: 0x7E39BA8B
	Offset: 0x60D0
	Size: 0x11C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_e6d0f1d4(entity)
{
	if(!is_true(entity.var_22b8f534))
	{
		return 0;
	}
	if(entity function_969dd1ca(2))
	{
		return 1;
	}
	enemy = self get_enemy();
	if(!is_enemy_valid(enemy))
	{
		return 0;
	}
	if(!is_true(entity.var_1fa24724))
	{
		var_8ff86729 = distance2dsquared(self.origin, enemy.origin);
		if(var_8ff86729 <= 90000)
		{
			return 0;
		}
	}
	return entity.ai.var_5dc77566 && entity function_52562969();
}

/*
	Name: function_52562969
	Namespace: namespace_88795f45
	Checksum: 0x485ECC41
	Offset: 0x61F8
	Size: 0xD4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_52562969()
{
	if(isdefined(self.var_90c3aec8) && self.var_90c3aec8.size >= 3)
	{
		return 0;
	}
	enemy = self get_enemy();
	if(!is_enemy_valid(enemy))
	{
		return 0;
	}
	if(!is_true(self.var_1fa24724))
	{
		var_8ff86729 = distance2dsquared(self.origin, enemy.origin);
		if(var_8ff86729 <= 90000)
		{
			return 0;
		}
	}
	return level.var_879dbfb8 < 9;
}

/*
	Name: function_99608cba
	Namespace: namespace_88795f45
	Checksum: 0x6C5A7749
	Offset: 0x62D8
	Size: 0xC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_99608cba(entity)
{
}

/*
	Name: function_779b5a9
	Namespace: namespace_88795f45
	Checksum: 0x14B60E2B
	Offset: 0x62F0
	Size: 0xC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_779b5a9(entity)
{
}

/*
	Name: function_4245d56f
	Namespace: namespace_88795f45
	Checksum: 0x1FD9CE29
	Offset: 0x6308
	Size: 0x82
	Parameters: 1
	Flags: Linked, Private
*/
function private function_4245d56f(entity)
{
	if(entity function_52562969())
	{
		level.var_879dbfb8++;
		entity.var_4d0d199c = 1;
		entity clientfield::set("steiner_radiation_bomb_prepare_fire_clientfield", 1);
		entity function_1da02b50(2);
	}
	else
	{
		entity.var_4d0d199c = 0;
	}
}

/*
	Name: function_45fabe41
	Namespace: namespace_88795f45
	Checksum: 0x7908E9D3
	Offset: 0x6398
	Size: 0x16C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_45fabe41(entity)
{
	if(is_true(entity.var_4d0d199c))
	{
		entity.var_4d0d199c = 0;
	}
	cooldown = randomfloatrange(3, 5);
	if(entity function_6b87eed1())
	{
		cooldown = randomfloatrange(1, 2.5);
	}
	entity.var_b52fc691 = gettime() + (int(cooldown * 1000));
	entity.ai.var_5dc77566 = 0;
	entity.var_f0d59f6d = 0;
	entity.var_f8bb81c1 = undefined;
	entity.variant_type = 0;
	if(is_true(entity.ai.var_de17c5a5))
	{
		entity.variant_type = 3;
		entity.ai.var_de17c5a5 = undefined;
	}
	entity clientfield::set("steiner_radiation_bomb_prepare_fire_clientfield", 0);
	entity function_9ee55afa();
}

/*
	Name: function_7ff0ce68
	Namespace: namespace_88795f45
	Checksum: 0x2063D1EF
	Offset: 0x6510
	Size: 0xD0
	Parameters: 13
	Flags: Linked, Private
*/
function private function_7ff0ce68(inflictor, attacker, damage, flags, meansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype)
{
	var_7aa37d9f = surfacetype;
	if(isdefined(psoffsettime) && isdefined(boneindex) && isdefined(psoffsettime.team) && isdefined(boneindex.team) && psoffsettime.team == boneindex.team)
	{
		var_7aa37d9f = 0;
	}
	return var_7aa37d9f;
}

/*
	Name: function_bf8080c1
	Namespace: namespace_88795f45
	Checksum: 0xED2BABDC
	Offset: 0x65E8
	Size: 0x608
	Parameters: 1
	Flags: Linked, Private
*/
function private function_bf8080c1(entity)
{
	entity clientfield::set("steiner_radiation_bomb_prepare_fire_clientfield", 0);
	var_c29d35bd = getweapon(#"hash_67307aa00ad6f686");
	enemy = entity get_enemy();
	if(!is_enemy_valid(enemy))
	{
		return false;
	}
	var_dd6bc3a6 = var_c29d35bd.projectilespeed;
	launch_pos = entity gettagorigin("tag_bombthrower_FX");
	if(!isdefined(launch_pos))
	{
		return false;
	}
	var_6b98218b = enemy gettagorigin("j_ankle_ri");
	if(!isdefined(var_6b98218b))
	{
		var_6b98218b = enemy.origin;
	}
	var_c9c9e975 = enemy gettagorigin("j_ankle_le");
	if(!isdefined(var_c9c9e975))
	{
		var_c9c9e975 = enemy.origin;
	}
	if(!bullettracepassed(launch_pos, var_6b98218b, 0, self) && !bullettracepassed(launch_pos, var_c9c9e975, 0, self))
	{
		var_dd6bc3a6 = var_dd6bc3a6 / 2;
	}
	target_dist = distance(self.origin, enemy.origin);
	var_b6897326 = target_dist / var_dd6bc3a6;
	rand = randomfloatrange(0.5, 1);
	var_b6897326 = var_b6897326 + rand;
	var_6e3ad56b = enemy.origin;
	if(isplayer(enemy))
	{
		velocity = enemy getvelocity();
		var_6e3ad56b = var_6e3ad56b + (velocity * var_b6897326);
	}
	target_pos = groundtrace(enemy.origin + vectorscale((0, 0, 1), 64), enemy.origin + (vectorscale((0, 0, -1), 100000)), 0, enemy)[#"position"];
	angles = vectortoangles(target_pos - entity.origin);
	dir = anglestoforward(angles);
	dist = distance(launch_pos, target_pos);
	velocity = dir * var_dd6bc3a6;
	to_target = target_pos - launch_pos;
	time = length((to_target[0], to_target[1], to_target[2])) / var_dd6bc3a6;
	var_813d38fa = (to_target[2] + (0.5 * getdvarfloat(#"bg_lowgravity", 400)) * sqr(time)) / time;
	velocity = (velocity[0], velocity[1], var_813d38fa);
	entity playsoundontag(#"hash_24961baa62849a57", "tag_bombthrower_FX");
	/#
		if(getdvarint(#"hash_65abc910bc611782", 0))
		{
			recordsphere(target_pos, 16, (0, 1, 0));
			recordline(launch_pos, target_pos, (0, 1, 0));
			function_ee21651d((("" + enemy.origin) + "") + target_pos);
			i = 0;
			while(i <= time)
			{
				height = (launch_pos[2] + (var_813d38fa * i)) - (0.5 * getdvarfloat(#"bg_lowgravity", 400)) * sqr(i);
				var_37f8a843 = (launch_pos[0] + (velocity[0] * i), launch_pos[1] + (velocity[1] * i), height);
				recordsphere(var_37f8a843, 8, (0, 1, 0));
				i = i + 0.1;
			}
		}
	#/
	grenade = entity magicgrenadetype(var_c29d35bd, launch_pos, velocity);
	if(isdefined(grenade))
	{
		grenade.owner = entity;
		grenade.team = entity.team;
		grenade thread function_a56050b0();
	}
	return true;
}

/*
	Name: function_2bde9dfa
	Namespace: namespace_88795f45
	Checksum: 0x5688155A
	Offset: 0x6BF8
	Size: 0x44
	Parameters: 1
	Flags: Linked, Private
*/
function private function_2bde9dfa(entity)
{
	if(entity.ai.var_5dc77566 || entity.ai.var_b13e6817)
	{
		return true;
	}
	return false;
}

/*
	Name: function_a56050b0
	Namespace: namespace_88795f45
	Checksum: 0x4FE8CB87
	Offset: 0x6C48
	Size: 0x2EC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_a56050b0()
{
	level endon(#"end_game");
	self endon(#"entitydeleted");
	owner = self.owner;
	self setmodel("tag_origin");
	waitframe(1);
	self clientfield::set("radiation_bomb_trail_fx_clientfield", 1);
	var_be17187b = undefined;
	var_be17187b = self waittill(#"death", #"projectile_impact_explode", #"explode", #"hash_38b24dfa52842786");
	if(var_be17187b._notify == "death")
	{
		self deletedelay();
		var_be17187b = undefined;
		var_be17187b = self waittilltimeout(float(function_60d95f53()) / 1000, #"projectile_impact_explode", #"explode", #"hash_38b24dfa52842786");
		if(var_be17187b._notify == "timeout")
		{
			return;
		}
	}
	if(isalive(owner) && var_be17187b._notify == "projectile_impact_explode")
	{
		/#
			function_ee21651d((("" + self.origin) + "") + var_be17187b.position);
			if(getdvarint(#"hash_65abc910bc611782", 0))
			{
				recordsphere(self.origin, 16, (0, 1, 0));
			}
		#/
		var_b308e59c = util::spawn_model("tag_origin", var_be17187b.position, var_be17187b.normal);
		var_b308e59c clientfield::set("radiation_bomb_play_landed_fx", 1);
		var_b308e59c.owner = owner;
		owner function_4d70c1d3(var_b308e59c);
		var_b308e59c thread function_fac064dc();
	}
	self clientfield::set("radiation_bomb_trail_fx_clientfield", 0);
}

/*
	Name: function_4d70c1d3
	Namespace: namespace_88795f45
	Checksum: 0x7E2B5129
	Offset: 0x6F40
	Size: 0x8C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_4d70c1d3(ent)
{
	if(!isdefined(self.var_90c3aec8))
	{
		self.var_90c3aec8 = [];
	}
	if(!isdefined(self.var_90c3aec8))
	{
		self.var_90c3aec8 = [];
	}
	else if(!isarray(self.var_90c3aec8))
	{
		self.var_90c3aec8 = array(self.var_90c3aec8);
	}
	self.var_90c3aec8[self.var_90c3aec8.size] = ent;
}

/*
	Name: function_f2cb8145
	Namespace: namespace_88795f45
	Checksum: 0x2E1A00D0
	Offset: 0x6FD8
	Size: 0x18C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_f2cb8145(var_ec2c535e, destroyed)
{
	if(is_true(destroyed))
	{
		self clientfield::set("radiation_bomb_play_landed_fx", 2);
	}
	else
	{
		self clientfield::set("radiation_bomb_play_landed_fx", 0);
	}
	if(is_true(var_ec2c535e) && isdefined(self.owner) && isdefined(self.owner.var_90c3aec8))
	{
		arrayremovevalue(self.owner.var_90c3aec8, self);
	}
	if(is_true(self.var_5d15d0b2))
	{
		return;
	}
	self.var_5d15d0b2 = 1;
	util::wait_network_frame();
	level.var_879dbfb8--;
	/#
		assert(level.var_879dbfb8 >= 0);
	#/
	if(isdefined(self.trigger_damage))
	{
		self.trigger_damage delete();
	}
	if(isdefined(self))
	{
		self delete();
	}
}

/*
	Name: function_4b193227
	Namespace: namespace_88795f45
	Checksum: 0x8DA0D92
	Offset: 0x7170
	Size: 0x5E
	Parameters: 0
	Flags: Linked, Private
*/
function private function_4b193227()
{
	if(!isdefined(self.var_90c3aec8) || !self.var_90c3aec8.size)
	{
		return;
	}
	array::thread_all(self.var_90c3aec8, &function_f2cb8145, 0);
	self.var_90c3aec8 = [];
}

/*
	Name: function_fac064dc
	Namespace: namespace_88795f45
	Checksum: 0xDAB0D102
	Offset: 0x71D8
	Size: 0x34C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_fac064dc()
{
	level endon(#"end_game");
	self endon(#"death");
	self thread function_5afaa306(128);
	var_6f13bbe0 = gettime() + int(10000);
	origin = self.origin;
	owner = self.owner;
	weapon = getweapon(#"tear_gas");
	params = function_4d1e7b48("dot_steiner_radiation_bomb");
	while(gettime() < var_6f13bbe0)
	{
		alive_players = function_a1ef346b(undefined, origin, 128);
		foreach(player in alive_players)
		{
			var_2df27ba0 = 0;
			in_vehicle = player isinvehicle();
			if(in_vehicle)
			{
				vehicle = player getvehicleoccupied();
				var_2df27ba0 = is_true(vehicle.var_9a6644f2);
			}
			height = abs(origin[2] - player.origin[2]);
			if(player laststand::player_is_in_laststand() === 0 && height <= 72 && !var_2df27ba0)
			{
				player status_effect::status_effect_apply(params, weapon, self);
			}
		}
		var_15978c43 = getentitiesinradius(origin, 128, 12);
		foreach(vehicle in var_15978c43)
		{
			self namespace_85745671::function_2713ff17(vehicle, 25);
		}
		wait(0.2);
	}
	self thread function_f2cb8145(1);
}

/*
	Name: function_5afaa306
	Namespace: namespace_88795f45
	Checksum: 0x82F9F8E1
	Offset: 0x7530
	Size: 0x14A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_5afaa306(trigger_radius)
{
	self endon(#"death");
	self.trigger_damage = spawn("trigger_damage", self.origin, 0, trigger_radius, 24);
	self.trigger_damage endon(#"death");
	while(true)
	{
		s_result = undefined;
		s_result = self.trigger_damage waittill(#"damage");
		if(isplayer(s_result.attacker))
		{
			if(isdefined(s_result.weapon) && namespace_b376a999::function_5fef4201(s_result.weapon))
			{
				self thread function_f2cb8145(1, 1);
				if(is_true(s_result.var_98e101b0))
				{
					s_result.attacker thread function_410ca78d(self.origin);
				}
				return;
			}
		}
	}
}

/*
	Name: function_410ca78d
	Namespace: namespace_88795f45
	Checksum: 0xF2E7F703
	Offset: 0x7688
	Size: 0x128
	Parameters: 1
	Flags: Linked, Private
*/
function private function_410ca78d(center)
{
	self endon(#"death", #"weapon_switch_started");
	level endon(#"game_ended");
	waittime = 1;
	while(waittime > 0)
	{
		if(!mayspawnentity())
		{
			break;
		}
		rotation = randomint(360);
		start_pos = center + (cos(rotation), sin(rotation), 0) * randomint(128);
		level thread namespace_b376a999::function_6dbf1bb3(self, 3, start_pos);
		waittime = waittime - 0.05;
		wait(0.05);
	}
}

/*
	Name: function_fc9189dd
	Namespace: namespace_88795f45
	Checksum: 0xB426A6C7
	Offset: 0x77B8
	Size: 0x3C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_fc9189dd(entity)
{
	if(isalive(entity))
	{
		function_bf8080c1(entity);
	}
}

/*
	Name: function_ac56fb75
	Namespace: namespace_88795f45
	Checksum: 0xD5F5B084
	Offset: 0x7800
	Size: 0x7CC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_ac56fb75()
{
	level endon(#"end_game");
	self endon(#"death", #"entitydeleted");
	if(!isalive(self))
	{
		return;
	}
	if(is_true(self.var_8576e0be) || is_true(self.var_9b474709))
	{
		return;
	}
	if(!self.ai.var_4beb90f3)
	{
		self thread function_735ef74d();
		return;
	}
	if(self function_880fad96())
	{
		self.var_9b474709 = 1;
		waitresult = undefined;
		waitresult = self waittill(#"hash_58f0b0e23afeccb9", #"stop_wait_for_split");
		if(!isalive(self) || waitresult._notify == "stop_wait_for_split")
		{
			return;
		}
		self.var_9b474709 = 0;
	}
	while(getailimit() - getaicount() < 2)
	{
		/#
			function_ee21651d("");
		#/
		waitframe(1);
	}
	self.var_8576e0be = 1;
	self.var_c3083789 = 1;
	if(isplayer(self.attacker))
	{
		level scoreevents::doscoreeventcallback("scoreEventZM", {#scoreevent:"steiner_split_zm", #attacker:self.attacker});
		if(is_true(self.var_136c407))
		{
			self.attacker zm_stats::increment_challenge_stat(#"hash_4ec43679ab49c017");
		}
	}
	self function_1da02b50(3);
	health = int(self.maxhealth * 1);
	if(self function_1e521615())
	{
		health = int(self.maxhealth * 0.25);
	}
	if(isdefined(level.var_c42bdd1b))
	{
		var_9f7c58e6 = level.var_c42bdd1b;
		if(self function_1e521615())
		{
			if(isdefined(level.var_68b26ea))
			{
				var_9f7c58e6 = level.var_68b26ea;
			}
			else
			{
				var_9f7c58e6 = #"hash_7f957e36b4f6160f";
			}
		}
	}
	else
	{
		var_9f7c58e6 = #"spawner_zm_steiner_split_radiation_blast";
		if(self function_1e521615())
		{
			var_9f7c58e6 = #"hash_7f957e36b4f6160f";
		}
	}
	if(isdefined(level.var_dc38daf))
	{
		var_a0024591 = level.var_dc38daf;
		if(self function_1e521615())
		{
			if(isdefined(level.var_887c5017))
			{
				var_a0024591 = level.var_887c5017;
			}
			else
			{
				var_a0024591 = #"hash_6904f5c7bef64405";
			}
		}
	}
	else
	{
		var_a0024591 = #"spawner_zm_steiner_split_radiation_bomb";
		if(self function_1e521615())
		{
			var_a0024591 = #"hash_6904f5c7bef64405";
		}
	}
	var_188c5348 = self.var_fde10e1d === 30;
	var_c0bfa8c2 = !isdefined(self.var_fde10e1d);
	var_33867b8b = self function_eafb4701(var_9f7c58e6, self, health, var_188c5348, var_c0bfa8c2);
	var_863c0d4d = self function_eafb4701(var_a0024591, self, health, var_188c5348, var_c0bfa8c2);
	function_7fd70892(var_33867b8b, var_863c0d4d);
	if(isdefined(var_33867b8b) && isdefined(var_863c0d4d))
	{
		var_33867b8b.var_e293f8ac = [];
		if(!isdefined(var_33867b8b.var_e293f8ac))
		{
			var_33867b8b.var_e293f8ac = [];
		}
		else if(!isarray(var_33867b8b.var_e293f8ac))
		{
			var_33867b8b.var_e293f8ac = array(var_33867b8b.var_e293f8ac);
		}
		if(!isinarray(var_33867b8b.var_e293f8ac, var_863c0d4d))
		{
			var_33867b8b.var_e293f8ac[var_33867b8b.var_e293f8ac.size] = var_863c0d4d;
		}
		var_863c0d4d.var_e293f8ac = [];
		if(!isdefined(var_863c0d4d.var_e293f8ac))
		{
			var_863c0d4d.var_e293f8ac = [];
		}
		else if(!isarray(var_863c0d4d.var_e293f8ac))
		{
			var_863c0d4d.var_e293f8ac = array(var_863c0d4d.var_e293f8ac);
		}
		if(!isinarray(var_863c0d4d.var_e293f8ac, var_33867b8b))
		{
			var_863c0d4d.var_e293f8ac[var_863c0d4d.var_e293f8ac.size] = var_33867b8b;
		}
		var_33867b8b.var_24f0cbe0 = self function_7f0363e8(1);
		var_863c0d4d.var_24f0cbe0 = self function_7f0363e8(1);
	}
	if(isdefined(self.var_9d59692c))
	{
		self [[self.var_9d59692c]](var_33867b8b, var_863c0d4d);
	}
	/#
		var_97edc82 = (isdefined(var_33867b8b) ? (("" + var_33867b8b getentitynumber()) + "") + health : "");
		function_ee21651d(var_97edc82);
		var_97edc82 = (isdefined(var_863c0d4d) ? (("" + var_863c0d4d getentitynumber()) + "") + health : "");
		function_ee21651d(var_97edc82);
	#/
	self function_bf898e7e(0);
	self pathmode("dont move");
	self.suicidaldeath = 1;
	waitframe(1);
	self notify(#"spawned_split_ai");
	self function_9ee55afa();
	self thread function_735ef74d();
}

/*
	Name: function_eafb4701
	Namespace: namespace_88795f45
	Checksum: 0xC157141E
	Offset: 0x7FD8
	Size: 0x136
	Parameters: 5
	Flags: Linked, Private
*/
function private function_eafb4701(aitype, location, health, var_188c5348, var_c0bfa8c2)
{
	if(!isdefined(location.angles))
	{
		angles = (0, 0, 0);
	}
	else
	{
		angles = location.angles;
	}
	entity = spawnactor(aitype, location.origin, angles);
	if(!isdefined(entity))
	{
		return;
	}
	entity notify(#"hash_57cb7b473056de06", {#hash_c0bfa8c2:var_c0bfa8c2, #hash_188c5348:var_188c5348, #angles:angles, #origin:location.origin});
	entity.maxhealth = health;
	entity.health = health;
	entity setmaxhealth(health);
	entity.ignore_enemy_count = 1;
	return entity;
}

/*
	Name: function_7fd70892
	Namespace: namespace_88795f45
	Checksum: 0xD0032D3F
	Offset: 0x8118
	Size: 0x54
	Parameters: 2
	Flags: Linked
*/
function function_7fd70892(var_f6aecc0e, var_5a069f1)
{
	if(isdefined(var_f6aecc0e) && isdefined(var_5a069f1))
	{
		var_f6aecc0e function_9cd04ab6(var_5a069f1);
		var_5a069f1 function_9cd04ab6(var_f6aecc0e);
	}
}

/*
	Name: function_9cd04ab6
	Namespace: namespace_88795f45
	Checksum: 0xD153E5AC
	Offset: 0x8178
	Size: 0x26
	Parameters: 1
	Flags: Linked, Private
*/
function private function_9cd04ab6(brother)
{
	self.var_a0a8f386 = 1;
	self.twin = brother;
}

/*
	Name: function_9cc1ebd1
	Namespace: namespace_88795f45
	Checksum: 0x8F6B9502
	Offset: 0x81A8
	Size: 0x36
	Parameters: 0
	Flags: Linked, Private
*/
function private function_9cc1ebd1()
{
	return is_true(self.var_a0a8f386) && !isalive(self.twin);
}

/*
	Name: function_3c494a14
	Namespace: namespace_88795f45
	Checksum: 0x29D84ADF
	Offset: 0x81E8
	Size: 0x26C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_3c494a14()
{
	self endon(#"death");
	self.var_8576e0be = 1;
	waitresult = undefined;
	waitresult = self waittilltimeout(1, #"hash_57cb7b473056de06");
	if(waitresult._notify == #"timeout")
	{
		return;
	}
	self pathmode("dont move", 1);
	self ghost();
	self dontinterpolate();
	self forceteleport(waitresult.origin, waitresult.angles);
	waitframe(1);
	self show();
	animation = (is_true(waitresult.var_c0bfa8c2) ? #"hash_4f7125d4a1219db1" : (is_true(waitresult.var_188c5348) ? #"hash_472dc064bf8b45b6" : #"hash_1303360c7d27b2b4"));
	if(self function_ba878b50())
	{
		animation = (is_true(waitresult.var_c0bfa8c2) ? #"hash_6703e70213b1b7e4" : (is_true(waitresult.var_188c5348) ? #"hash_4e82076610a39b4b" : #"hash_2c6a542c7f682ad3"));
	}
	self.intro_anim = animation;
	self.var_188c5348 = waitresult.var_188c5348;
	self notify(#"hash_200053f79d3c5c19");
	self animcustom(&split_intro_run, &split_intro_end, "split_intro_run", "split_intro_end");
}

/*
	Name: split_intro_run
	Namespace: namespace_88795f45
	Checksum: 0xF6744AE6
	Offset: 0x8460
	Size: 0x202
	Parameters: 0
	Flags: Linked
*/
function split_intro_run()
{
	self endoncallback(&function_5311b652, #"death", #"killanimscript");
	self val::set(#"hash_57cb7b473056de06", "ignoreall", 1);
	self ai::disable_pain();
	self.ignore_all_poi = 1;
	if(self isragdoll())
	{
		return;
	}
	self orientmode("face angle", self.angles[1]);
	self animmode("noclip");
	self pathmode("dont move", 1);
	self animscripted(self.intro_anim, self.origin, self.angles, self.intro_anim, "custom");
	self thread function_51fb171c();
	var_74ee8be8 = getnotetracktimes(self.intro_anim, "noclip_end")[0];
	if(isdefined(var_74ee8be8))
	{
		var_74ee8be8 = var_74ee8be8 * getanimlength(self.intro_anim);
	}
	else
	{
		var_74ee8be8 = 0;
	}
	wait(var_74ee8be8);
	self animmode("gravity");
	wait(getanimlength(self.intro_anim) - var_74ee8be8);
}

/*
	Name: split_intro_end
	Namespace: namespace_88795f45
	Checksum: 0x3092A567
	Offset: 0x8670
	Size: 0x9C
	Parameters: 0
	Flags: Linked
*/
function split_intro_end()
{
	if(isalive(self))
	{
		self.var_8576e0be = 0;
		self val::reset(#"hash_57cb7b473056de06", "ignoreall");
		self ai::enable_pain();
		self.ignore_all_poi = 0;
		self.intro_anim = undefined;
		self pathmode("move allowed");
	}
}

/*
	Name: function_5311b652
	Namespace: namespace_88795f45
	Checksum: 0xF265494A
	Offset: 0x8718
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function function_5311b652(str_notify)
{
	if(str_notify === #"death")
	{
		self startragdoll();
	}
}

/*
	Name: function_b46c0796
	Namespace: namespace_88795f45
	Checksum: 0x38DBB2E
	Offset: 0x8758
	Size: 0x10A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_b46c0796(entity)
{
	var_87222bcb = function_60722139(entity);
	if(isalive(entity) && is_true(entity.var_8d1d18aa) && entity.health <= var_87222bcb && !is_true(entity.marked_for_death))
	{
		if(!entity function_3108de07(60))
		{
			entity function_3108de07(30);
		}
		if(!is_true(entity.var_8576e0be))
		{
			return true;
		}
		return false;
	}
	return false;
}

/*
	Name: function_60722139
	Namespace: namespace_88795f45
	Checksum: 0xE6EF0178
	Offset: 0x8870
	Size: 0x32
	Parameters: 1
	Flags: Linked, Private
*/
function private function_60722139(entity)
{
	var_87222bcb = entity.var_94378ef;
	return ceil(var_87222bcb);
}

/*
	Name: function_363c063
	Namespace: namespace_88795f45
	Checksum: 0xE4390869
	Offset: 0x88B0
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_363c063(entity)
{
	entity orientmode("face default");
}

/*
	Name: function_380fc4a5
	Namespace: namespace_88795f45
	Checksum: 0xB002045D
	Offset: 0x88E8
	Size: 0x44
	Parameters: 1
	Flags: Linked, Private
*/
function private function_380fc4a5(entity)
{
	entity clientfield::increment("steiner_perform_split_clientfield");
	entity thread function_ac56fb75();
}

/*
	Name: function_3108de07
	Namespace: namespace_88795f45
	Checksum: 0xF2E32A29
	Offset: 0x8938
	Size: 0x43E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_3108de07(var_fde10e1d)
{
	var_f62bfdc0 = anglestoright(self.angles);
	var_8e6411bf = var_f62bfdc0 * var_fde10e1d;
	startposition = function_9cc082d2(self.origin, 30);
	startposition = (isdefined(startposition[#"point"]) ? startposition[#"point"] : self.origin);
	rightposition = function_9cc082d2(startposition + var_8e6411bf, var_fde10e1d);
	rightposition = (isdefined(rightposition[#"point"]) ? rightposition[#"point"] : undefined);
	var_d9ca447f = isdefined(rightposition) && (distancesquared(startposition, rightposition) + 1) >= sqr(var_fde10e1d) && bullettracepassed(startposition + (0, 0, 30), (rightposition + (0, 0, 30)) + (var_f62bfdc0 * self getpathfindingradius()), 0, self);
	leftposition = function_9cc082d2(startposition - var_8e6411bf, var_fde10e1d);
	leftposition = (isdefined(leftposition[#"point"]) ? leftposition[#"point"] : undefined);
	var_290edef9 = isdefined(leftposition) && (distancesquared(startposition, leftposition) + 1) >= sqr(var_fde10e1d) && bullettracepassed(startposition + (0, 0, 30), (leftposition + (0, 0, 30)) - (var_f62bfdc0 * self getpathfindingradius()), 0, self);
	if(var_d9ca447f && var_290edef9)
	{
		/#
			function_ee21651d((("" + self.origin) + "") + var_fde10e1d);
		#/
		self.var_fde10e1d = var_fde10e1d;
		return true;
	}
	/#
		if(level.var_a71c09f8)
		{
			if(isdefined(rightposition))
			{
				color = (is_true(var_d9ca447f) ? (0, 1, 0) : (1, 0, 0));
				recordsphere(rightposition, 2, color);
				recordline(startposition + (0, 0, 30), rightposition + (0, 0, 30), color);
			}
			if(isdefined(leftposition))
			{
				color = (is_true(var_290edef9) ? (0, 1, 0) : (1, 0, 0));
				recordsphere(leftposition, 2, color);
				recordline(startposition + (0, 0, 30), leftposition + (0, 0, 30), color);
			}
		}
		function_ee21651d("" + self.origin);
	#/
	return false;
}

/*
	Name: function_51fb171c
	Namespace: namespace_88795f45
	Checksum: 0xE970E23C
	Offset: 0x8D80
	Size: 0x170
	Parameters: 0
	Flags: Linked, Private
*/
function private function_51fb171c()
{
	ents = getaiarchetypearray(#"zombie");
	var_9762dbfe = (is_true(self.var_188c5348) ? 30 : 60);
	var_3521085c = sqr(var_9762dbfe);
	foreach(ent in ents)
	{
		if(is_true(ent.knockdown))
		{
			continue;
		}
		if(gibserverutils::isgibbed(ent, 384))
		{
			continue;
		}
		if(distancesquared(ent.origin, self.origin) > var_3521085c)
		{
			continue;
		}
		ent thread zombie_utility::setup_zombie_knockdown(self);
	}
}

/*
	Name: function_fb61fd57
	Namespace: namespace_88795f45
	Checksum: 0xB42634B1
	Offset: 0x8EF8
	Size: 0x2E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_fb61fd57(entity)
{
	if(entity.ai.var_fad877bf)
	{
		return true;
	}
	return false;
}

/*
	Name: function_d33f94e
	Namespace: namespace_88795f45
	Checksum: 0x845DDD
	Offset: 0x8F30
	Size: 0xC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_d33f94e(entity)
{
}

/*
	Name: function_4b63f114
	Namespace: namespace_88795f45
	Checksum: 0x1ABBF78E
	Offset: 0x8F48
	Size: 0x1E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_4b63f114(entity)
{
	entity.ai.var_fad877bf = 0;
}

/*
	Name: function_15c1e3df
	Namespace: namespace_88795f45
	Checksum: 0x65052009
	Offset: 0x8F70
	Size: 0x80
	Parameters: 1
	Flags: Linked, Private
*/
function private function_15c1e3df(entity)
{
	if(function_fb61fd57(entity))
	{
		return true;
	}
	if(function_e9e122fa(entity) && function_b52cb76c(entity) && zombiebehavior::function_1b8c9407(entity))
	{
		return true;
	}
	return false;
}

/*
	Name: function_b52cb76c
	Namespace: namespace_88795f45
	Checksum: 0x134B2B39
	Offset: 0x8FF8
	Size: 0x5C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_b52cb76c(entity)
{
	if(is_true(entity.suicidaldeath))
	{
		return 0;
	}
	if(!hasasm(entity))
	{
		return 0;
	}
	return !is_true(entity.missinglegs);
}

/*
	Name: function_e9e122fa
	Namespace: namespace_88795f45
	Checksum: 0xDDED4A21
	Offset: 0x9060
	Size: 0xD4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_e9e122fa(entity)
{
	if(isdefined(entity.ai.var_7555ca97) && (gettime() - entity.ai.var_7555ca97) < 2500)
	{
		if(entity function_c124c913(1) || entity function_c124c913(2))
		{
			entity.ai.var_de17c5a5 = 1;
		}
		/#
			function_ee21651d(("" + entity getentitynumber()) + "");
		#/
		return true;
	}
	return false;
}

/*
	Name: function_617dea8a
	Namespace: namespace_88795f45
	Checksum: 0x5A7A4A52
	Offset: 0x9140
	Size: 0x2A
	Parameters: 1
	Flags: Linked
*/
function function_617dea8a(ratio)
{
	if(ratio >= 0.33)
	{
		return "heavy";
	}
	return "light";
}

/*
	Name: function_218044b0
	Namespace: namespace_88795f45
	Checksum: 0xAE418194
	Offset: 0x9178
	Size: 0x8A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_218044b0(entity)
{
	entity.ai.var_7555ca97 = undefined;
	if(entity.variant_type === 2 || entity.variant_type === 3)
	{
		entity.variant_type = 0;
	}
	if(is_true(entity.ai.var_fad877bf))
	{
		entity.ai.var_fad877bf = 0;
	}
}

/*
	Name: function_b077b73d
	Namespace: namespace_88795f45
	Checksum: 0x52BB6394
	Offset: 0x9210
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function function_b077b73d(time)
{
	if(!isdefined(time) || time <= 0)
	{
		return;
	}
	self thread function_392a816a(time);
}

/*
	Name: function_392a816a
	Namespace: namespace_88795f45
	Checksum: 0xE80EB1A7
	Offset: 0x9258
	Size: 0x1D0
	Parameters: 1
	Flags: Linked, Private
*/
function private function_392a816a(time)
{
	if(is_true(self.var_8576e0be))
	{
		return;
	}
	if(!is_true(self.var_8d1d18aa) && !isdefined(self.var_e1f39584))
	{
		return;
	}
	self notify(#"hash_1126b46a114399d");
	self endon(#"death", #"hash_1126b46a114399d");
	/#
		function_ee21651d("");
	#/
	self.var_8d1d18aa = 0;
	if(is_true(self.var_9b474709))
	{
		self notify(#"stop_wait_for_split");
		self.var_9b474709 = 0;
	}
	var_e1f39584 = gettime() + (int(time * 1000));
	if(isdefined(self.var_e1f39584))
	{
		self.var_e1f39584 = int(max(self.var_e1f39584, var_e1f39584));
	}
	else
	{
		self.var_e1f39584 = var_e1f39584;
	}
	while(isalive(self) && isdefined(self.var_e1f39584))
	{
		if(gettime() >= self.var_e1f39584)
		{
			self.var_8d1d18aa = 1;
			/#
				function_ee21651d("");
			#/
			return;
		}
		waitframe(1);
	}
}

/*
	Name: function_d778b630
	Namespace: namespace_88795f45
	Checksum: 0x2E8715E
	Offset: 0x9430
	Size: 0x32
	Parameters: 1
	Flags: Linked, Private
*/
function private function_d778b630(entity)
{
	entity.ai.var_76786d9c = 0;
	entity.ai.var_80045105 = gettime();
}

/*
	Name: function_46e10c70
	Namespace: namespace_88795f45
	Checksum: 0x78BED250
	Offset: 0x9470
	Size: 0x58
	Parameters: 1
	Flags: Linked, Private
*/
function private function_46e10c70(entity)
{
	if(entity.ai.var_76786d9c)
	{
		entity.ai.var_fad877bf = 1;
		entity.ai.var_76786d9c = 0;
		return 4;
	}
	return 5;
}

/*
	Name: function_44c1658c
	Namespace: namespace_88795f45
	Checksum: 0x6673A5E5
	Offset: 0x94D8
	Size: 0x16
	Parameters: 1
	Flags: Linked, Private
*/
function private function_44c1658c(entity)
{
	entity.variant_type = 0;
}

/*
	Name: function_5a481a84
	Namespace: namespace_88795f45
	Checksum: 0x416CF77B
	Offset: 0x94F8
	Size: 0x154
	Parameters: 1
	Flags: Linked, Private
*/
function private function_5a481a84(player)
{
	dist = distance(self.origin, player.origin);
	targetorigin = (player.origin[0], player.origin[1], self.origin[2]);
	var_a6470558 = vectornormalize(targetorigin - self.origin);
	var_d3cafde6 = self.meleeweapon.var_d3cafde6;
	var_32708f81 = 100 + var_d3cafde6;
	var_8cf8f805 = mapfloat(0, var_d3cafde6, 100, var_32708f81, dist);
	player playerknockback(1);
	player applyknockback(int(var_8cf8f805), var_a6470558);
	player playerknockback(0);
}

/*
	Name: function_6e3a88b1
	Namespace: namespace_88795f45
	Checksum: 0x1EB42A5A
	Offset: 0x9658
	Size: 0x5A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_6e3a88b1(entity)
{
	/#
		function_ee21651d("");
	#/
	function_d778b630(entity);
	entity.ai.var_ae3359f = 1;
}

/*
	Name: function_a14fcce8
	Namespace: namespace_88795f45
	Checksum: 0x31F55E64
	Offset: 0x96C0
	Size: 0x54
	Parameters: 1
	Flags: Linked, Private
*/
function private function_a14fcce8(entity)
{
	/#
		function_ee21651d("");
	#/
	entity.ai.var_ae3359f = 0;
	entity function_fc82d5c7();
}

/*
	Name: function_fc82d5c7
	Namespace: namespace_88795f45
	Checksum: 0xEBE94E65
	Offset: 0x9720
	Size: 0x44
	Parameters: 0
	Flags: Linked, Private
*/
function private function_fc82d5c7()
{
	self.ai.var_4902424b = gettime() + 5000;
	self.zombie_move_speed = "walk";
	/#
		function_ee21651d("");
	#/
}

/*
	Name: function_7cac529b
	Namespace: namespace_88795f45
	Checksum: 0xF7BD5162
	Offset: 0x9770
	Size: 0x220
	Parameters: 1
	Flags: Linked
*/
function function_7cac529b(behaviortreeentity)
{
	if(isdefined(behaviortreeentity.var_9ecae3b4) || (isdefined(behaviortreeentity.var_cc1c538e) && !behaviortreeentity isatgoal()))
	{
		return 1;
	}
	if(behaviortreeentity getpathmode() == "dont move" || behaviortreeentity.ignoreall)
	{
		return 0;
	}
	if(is_true(behaviortreeentity.ai.var_48ae6dbf))
	{
		return 1;
	}
	if(is_true(behaviortreeentity.ai.var_db6715c9))
	{
		return 1;
	}
	if(isdefined(behaviortreeentity.ai.var_5810aebe) && behaviortreeentity.ai.var_5810aebe > gettime())
	{
		return 0;
	}
	if(behaviortreeentity.ai.var_3dbed9a0 > gettime())
	{
		return 1;
	}
	enemy = behaviortreeentity get_enemy();
	if(isdefined(enemy) && is_enemy_valid(enemy))
	{
		var_eab3f54a = distance2dsquared(behaviortreeentity.origin, enemy.origin);
		canseeenemy = behaviortreeentity can_see_enemy();
		return behaviortreeentity function_3e6b7dd4(enemy, var_eab3f54a, canseeenemy);
	}
	if(is_true(self.ai.var_870d0893) && self haspath())
	{
		return 1;
	}
	return 0;
}

/*
	Name: function_3bdb520f
	Namespace: namespace_88795f45
	Checksum: 0xC7923290
	Offset: 0x9998
	Size: 0x78
	Parameters: 1
	Flags: Linked
*/
function function_3bdb520f(entity)
{
	if(is_true(entity.ai.var_d9f167ee) && !isdefined(entity.ai.var_f38a2e83))
	{
		entity.ai.var_f38a2e83 = gettime();
		/#
			function_ee21651d("");
		#/
	}
	return true;
}

/*
	Name: function_2154581b
	Namespace: namespace_88795f45
	Checksum: 0xB4B273D3
	Offset: 0x9A18
	Size: 0xDA
	Parameters: 1
	Flags: Linked
*/
function function_2154581b(behaviortreeentity)
{
	if(function_7a893a7(behaviortreeentity) || function_e6d0f1d4(behaviortreeentity))
	{
		behaviortreeentity clearpath();
		/#
			function_ee21651d("");
		#/
	}
	if(isdefined(behaviortreeentity.ai.var_f38a2e83) && (behaviortreeentity.ai.var_f38a2e83 + 10000) <= gettime())
	{
		behaviortreeentity function_fc82d5c7();
		behaviortreeentity.ai.var_f38a2e83 = undefined;
	}
	return true;
}

/*
	Name: function_7b89edb0
	Namespace: namespace_88795f45
	Checksum: 0x7B134BA6
	Offset: 0x9B00
	Size: 0x70
	Parameters: 1
	Flags: Linked, Private
*/
function private function_7b89edb0(behaviortreeentity)
{
	if(!behaviortreeentity function_dd070839())
	{
		behaviortreeentity clearpath();
	}
	behaviortreeentity.ai.var_3dbed9a0 = gettime();
	/#
		function_ee21651d("");
	#/
	return true;
}

/*
	Name: function_553ec0ae
	Namespace: namespace_88795f45
	Checksum: 0xB678534B
	Offset: 0x9B78
	Size: 0x40
	Parameters: 1
	Flags: Linked
*/
function function_553ec0ae(behaviortreeentity)
{
	behaviortreeentity.ai.var_48ae6dbf = 1;
	/#
		function_ee21651d("");
	#/
	return true;
}

/*
	Name: function_f60a1f74
	Namespace: namespace_88795f45
	Checksum: 0x6F402253
	Offset: 0x9BC0
	Size: 0x40
	Parameters: 1
	Flags: Linked
*/
function function_f60a1f74(behaviortreeentity)
{
	behaviortreeentity.ai.var_48ae6dbf = 0;
	/#
		function_ee21651d("");
	#/
	return true;
}

/*
	Name: function_efc7dca5
	Namespace: namespace_88795f45
	Checksum: 0xD8200D87
	Offset: 0x9C08
	Size: 0x1E
	Parameters: 1
	Flags: Linked
*/
function function_efc7dca5(behaviortreeentity)
{
	return behaviortreeentity.ai.canstrafe;
}

/*
	Name: function_3e6b7dd4
	Namespace: namespace_88795f45
	Checksum: 0x8B0CE148
	Offset: 0x9C30
	Size: 0x57E
	Parameters: 3
	Flags: Linked, Private
*/
function private function_3e6b7dd4(enemy, var_eab3f54a, canseeenemy)
{
	radiussqr = sqr(self getpathfindingradius());
	if(!isdefined(enemy))
	{
		self clearpath();
		return 0;
	}
	if(var_eab3f54a <= radiussqr)
	{
		self clearpath();
		return 0;
	}
	goal = getclosestpointonnavmesh(enemy.origin, 128, 30);
	if(!isdefined(goal))
	{
		/#
			function_ee21651d("" + enemy.origin);
		#/
		var_515f97cf = 1000;
		if(var_eab3f54a < 1000000)
		{
			var_515f97cf = sqrt(var_eab3f54a);
		}
		goal = getrandomnavpoint(enemy.origin, var_515f97cf, 30);
	}
	if(isdefined(goal))
	{
		var_57e5ec79 = distancesquared(enemy.origin, goal);
		var_600ef3ea = var_57e5ec79 > 1024;
		if(is_true(var_600ef3ea) && is_true(canseeenemy) && isplayer(enemy) && isdefined(self.var_2d5cbb7[enemy getentitynumber()]))
		{
			var_cd8d027d = self.var_2d5cbb7[enemy getentitynumber()].dist;
			var_f4bc864a = distancesquared(self.origin, goal);
			if(var_cd8d027d >= (var_f4bc864a * 9))
			{
				var_98f31071 = checknavmeshdirection(self.origin, enemy.origin - self.origin, distance(self.origin, enemy.origin), self getpathfindingradius());
				var_2bd124ce = distancesquared(enemy.origin, var_98f31071);
				if(var_2bd124ce < 1000000 || var_2bd124ce < 1000000)
				{
					goal = var_98f31071;
					var_eab3f54a = distance2dsquared(self.origin, goal);
					if(var_eab3f54a <= radiussqr)
					{
						/#
							function_ee21651d("" + self.origin);
						#/
						self clearpath();
						return 0;
					}
					/#
						function_ee21651d(("" + goal) + "");
						function_ee21651d((("" + sqrt(var_2bd124ce)) + "") + sqrt(var_57e5ec79));
					#/
				}
			}
		}
		if(zm_utility::is_survival())
		{
			namespace_e292b080::zombieupdategoal(goal);
		}
		else
		{
			self setgoal(goal);
		}
		if(self haspath())
		{
			self setblackboardattribute("_run_n_gun_variation", "variation_forward");
			self.ai.var_3dbed9a0 = gettime() + 1000;
			self function_21746f2d(var_eab3f54a);
		}
		else
		{
			/#
				function_ee21651d((("" + self.origin) + "") + goal);
			#/
		}
	}
	else
	{
		/#
			function_ee21651d(("" + self.origin) + "");
		#/
	}
	if(self.ai.var_3dbed9a0 <= gettime())
	{
		self.ai.var_d9f167ee = 0;
		self.ai.var_f38a2e83 = undefined;
	}
	return self.ai.var_3dbed9a0 > gettime();
}

/*
	Name: function_a788e366
	Namespace: namespace_88795f45
	Checksum: 0xAD562B2C
	Offset: 0xA1B8
	Size: 0x7E
	Parameters: 2
	Flags: Private
*/
function private function_a788e366(var_eab3f54a, canseeenemy)
{
	if(is_true(self.ai.var_bb06b848))
	{
		return false;
	}
	if(var_eab3f54a > 360000 || var_eab3f54a < 10000)
	{
		return false;
	}
	if(is_true(canseeenemy))
	{
		return false;
	}
	return true;
}

/*
	Name: function_bb5d7e92
	Namespace: namespace_88795f45
	Checksum: 0xF18E5E8E
	Offset: 0xA240
	Size: 0x20A
	Parameters: 2
	Flags: Private
*/
function private function_bb5d7e92(var_5920d6a6, enemy)
{
	right = anglestoright(self.angles);
	var_900963e4 = (is_true(enemy) ? -1 : 1);
	var_91d0d82d = randomintrange(100, 300);
	targetpoint = self.origin + (vectorscale(right, var_91d0d82d * var_900963e4));
	nav_mesh = getclosestpointonnavmesh(targetpoint, self getpathfindingradius(), 30);
	if(isdefined(nav_mesh) && tracepassedonnavmesh(self.origin, nav_mesh, self getpathfindingradius()) && sighttracepassed(self.origin + vectorscale((0, 0, 1), 80), nav_mesh + vectorscale((0, 0, 1), 30), 0, self))
	{
		if(self haspath())
		{
			self setblackboardattribute("_run_n_gun_variation", (enemy ? "variation_strafe_1" : "variation_strafe_2"));
			attribute = self getblackboardattribute("_run_n_gun_variation");
			self setgoal(nav_mesh);
			self.ignore_find_flesh = 1;
			return true;
		}
	}
	return false;
}

/*
	Name: function_8e782bd8
	Namespace: namespace_88795f45
	Checksum: 0x1EBB63DD
	Offset: 0xA458
	Size: 0xFA
	Parameters: 1
	Flags: Linked, Private
*/
function private function_8e782bd8(behaviortreeentity)
{
	attribute = behaviortreeentity getblackboardattribute("_run_n_gun_variation");
	/#
		if(behaviortreeentity getblackboardattribute("") === "")
		{
			function_ee21651d("");
		}
		else
		{
			if(behaviortreeentity getblackboardattribute("") === "")
			{
				function_ee21651d("");
			}
			else
			{
				function_ee21651d("");
			}
		}
	#/
	behaviortreeentity.ai.var_db6715c9 = 1;
}

/*
	Name: function_850378bc
	Namespace: namespace_88795f45
	Checksum: 0xB0FC716D
	Offset: 0xA560
	Size: 0x6E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_850378bc(behaviortreeentity)
{
	if(behaviortreeentity isatgoal())
	{
		behaviortreeentity.ignore_find_flesh = 0;
		behaviortreeentity.ai.var_db6715c9 = 0;
		/#
			function_ee21651d("");
		#/
		return 4;
	}
	return 5;
}

/*
	Name: function_c9181afb
	Namespace: namespace_88795f45
	Checksum: 0x5621FEEF
	Offset: 0xA5D8
	Size: 0x4A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_c9181afb(behaviortreeentity)
{
	/#
		function_ee21651d("");
	#/
	behaviortreeentity.ignore_find_flesh = 0;
	behaviortreeentity.ai.var_db6715c9 = 0;
}

/*
	Name: function_e6b7aa9d
	Namespace: namespace_88795f45
	Checksum: 0x21D7D521
	Offset: 0xA630
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function function_e6b7aa9d(behaviortreeentity)
{
	if(is_true(behaviortreeentity.ai.var_48ae6dbf))
	{
		return 0;
	}
	return behaviortreeentity getblackboardattribute("_locomotion_speed_zombie") === "locomotion_speed_walk";
}

/*
	Name: function_dab44559
	Namespace: namespace_88795f45
	Checksum: 0xCC3261AA
	Offset: 0xA690
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function function_dab44559(behaviortreeentity)
{
	if(is_true(behaviortreeentity.ai.var_48ae6dbf))
	{
		return 0;
	}
	return behaviortreeentity getblackboardattribute("_locomotion_speed_zombie") === "locomotion_speed_run";
}

/*
	Name: function_21746f2d
	Namespace: namespace_88795f45
	Checksum: 0xE3057AE0
	Offset: 0xA6F0
	Size: 0x224
	Parameters: 1
	Flags: Linked, Private
*/
function private function_21746f2d(var_eab3f54a)
{
	if(isdefined(self.ai.var_4902424b) && self.ai.var_4902424b > gettime())
	{
		self.zombie_move_speed = "walk";
		return;
	}
	if(!is_true(self.ai.var_d9f167ee) && var_eab3f54a <= 90000)
	{
		self.ai.var_d9f167ee = 1;
		/#
			function_ee21651d("");
		#/
	}
	var_533af8f8 = !is_true(self.ai.var_e93366a);
	if(var_eab3f54a > 90000 && var_eab3f54a <= 562500 && !is_true(self.ai.var_8c8fb85a))
	{
		var_533af8f8 = 0;
	}
	isrunning = self.zombie_move_speed == "run";
	if(var_533af8f8 != isrunning)
	{
		if(var_533af8f8)
		{
			currentvelocity = self getvelocity();
			currentspeed = length(currentvelocity);
			if(!isrunning || currentspeed > 0)
			{
				self.zombie_move_speed = "run";
				self.ai.rundelay = undefined;
				/#
					function_ee21651d("");
				#/
			}
		}
		else
		{
			self.zombie_move_speed = "walk";
			/#
				function_ee21651d("");
			#/
		}
	}
}

/*
	Name: function_29744716
	Namespace: namespace_88795f45
	Checksum: 0x1C7FAFFE
	Offset: 0xA920
	Size: 0x1E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_29744716(entity)
{
	return entity.ai.var_b90dccd6;
}

/*
	Name: function_2745a754
	Namespace: namespace_88795f45
	Checksum: 0x72F086EA
	Offset: 0xA948
	Size: 0x36
	Parameters: 1
	Flags: Linked, Private
*/
function private function_2745a754(entity)
{
	return entity.ai.var_8c90ae8e && !entity.ai.var_a49798e7;
}

/*
	Name: function_bf6d273f
	Namespace: namespace_88795f45
	Checksum: 0xEB69A087
	Offset: 0xA988
	Size: 0xC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_bf6d273f(entity)
{
}

/*
	Name: function_bd9179c
	Namespace: namespace_88795f45
	Checksum: 0x83F98B22
	Offset: 0xA9A0
	Size: 0xC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_bd9179c(entity)
{
}

/*
	Name: function_dede41c0
	Namespace: namespace_88795f45
	Checksum: 0x6106CC7E
	Offset: 0xA9B8
	Size: 0x1E6
	Parameters: 0
	Flags: Linked
*/
function function_dede41c0()
{
	enemy = self get_enemy();
	if(!zm_utility::is_survival())
	{
		if(isdefined(enemy) && is_enemy_valid(enemy))
		{
			predictedpos = self lastknownpos(enemy);
			if(isdefined(predictedpos))
			{
				turnyaw = absangleclamp360(self.angles[1] - (vectortoangles(predictedpos - self.origin)[1]));
				return turnyaw;
			}
		}
		var_e4ef5000 = self function_4794d6a3();
		if(isdefined(var_e4ef5000.goalangles))
		{
			turnyaw = absangleclamp360(self.angles[1] - var_e4ef5000.goalangles[1]);
			return turnyaw;
		}
	}
	else
	{
		pos = undefined;
		if(issentient(enemy))
		{
			pos = self lastknownpos(enemy);
		}
		else if(isdefined(enemy))
		{
			pos = enemy.origin;
		}
		if(isdefined(pos))
		{
			turnyaw = absangleclamp360(self.angles[1] - (vectortoangles(pos - self.origin)[1]));
			return turnyaw;
		}
	}
	return undefined;
}

/*
	Name: function_5142fcce
	Namespace: namespace_88795f45
	Checksum: 0xE4FC16F8
	Offset: 0xABA8
	Size: 0x2E
	Parameters: 1
	Flags: Linked
*/
function function_5142fcce(entity)
{
	if(entity.ai.var_a49798e7)
	{
		return true;
	}
	return false;
}

/*
	Name: function_13f6d246
	Namespace: namespace_88795f45
	Checksum: 0xB2EA7142
	Offset: 0xABE0
	Size: 0xC
	Parameters: 1
	Flags: Linked
*/
function function_13f6d246(entity)
{
}

/*
	Name: function_e37d4e19
	Namespace: namespace_88795f45
	Checksum: 0x62E6CB02
	Offset: 0xABF8
	Size: 0xC
	Parameters: 1
	Flags: Linked
*/
function function_e37d4e19(entity)
{
}

/*
	Name: function_2a30b3a3
	Namespace: namespace_88795f45
	Checksum: 0xD2A5B80E
	Offset: 0xAC10
	Size: 0x8E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_2a30b3a3(n_duration)
{
	self endon(#"hash_362dfacc3f97bf98", #"hash_39f4b987812e1540", #"death", #"entitydeleted");
	function_c01f9453();
	wait(n_duration);
	self.ai.var_a49798e7 = 0;
	self notify(#"hash_362dfacc3f97bf98");
}

/*
	Name: function_67a0e9a2
	Namespace: namespace_88795f45
	Checksum: 0x48A8B7AC
	Offset: 0xACA8
	Size: 0x13E
	Parameters: 2
	Flags: None
*/
function function_67a0e9a2(var_2fa3c4c9, location)
{
	level.var_f0c367c9 = location;
	level.var_8cc83376 = [];
	foreach(split in var_2fa3c4c9)
	{
		if(isactor(split) && isalive(split))
		{
			if(!isdefined(split.ai))
			{
				split.ai = [];
			}
			split.ai.var_b90dccd6 = 0;
			split.ai.var_62741bfb = 1;
			split setgoal(split.origin, 1);
			split.ignoreall = 1;
		}
	}
}

/*
	Name: function_52479a49
	Namespace: namespace_88795f45
	Checksum: 0x1EB7D454
	Offset: 0xADF0
	Size: 0x2A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_52479a49(entity)
{
	return is_true(entity.ai.var_62741bfb);
}

/*
	Name: function_5c25cce9
	Namespace: namespace_88795f45
	Checksum: 0xA72AFFA1
	Offset: 0xAE28
	Size: 0xC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_5c25cce9(entity)
{
}

/*
	Name: function_5070830c
	Namespace: namespace_88795f45
	Checksum: 0x432AF5B7
	Offset: 0xAE40
	Size: 0x80
	Parameters: 1
	Flags: Linked, Private
*/
function private function_5070830c(entity)
{
	array::add(level.var_8cc83376, entity, 0);
	entity.ai.var_62741bfb = 0;
	if(level.var_8cc83376.size == 2)
	{
		level thread function_aed09e18(level.var_8cc83376);
		level.var_8cc83376 = [];
	}
}

/*
	Name: function_dcac38af
	Namespace: namespace_88795f45
	Checksum: 0xF56893F8
	Offset: 0xAEC8
	Size: 0x1E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_dcac38af(entity)
{
	return entity.ai.var_a29f9a91;
}

/*
	Name: function_545f48af
	Namespace: namespace_88795f45
	Checksum: 0x8BF69EC
	Offset: 0xAEF0
	Size: 0xC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_545f48af(entity)
{
}

/*
	Name: function_42d0830a
	Namespace: namespace_88795f45
	Checksum: 0x66F60BE2
	Offset: 0xAF08
	Size: 0x5A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_42d0830a(entity)
{
	if(entity.variant_type < 3)
	{
		entity.variant_type = entity.variant_type + 1;
	}
	else
	{
		entity.variant_type = 0;
		entity.ai.var_a29f9a91 = 0;
	}
}

/*
	Name: function_aed09e18
	Namespace: namespace_88795f45
	Checksum: 0x74BC260A
	Offset: 0xAF70
	Size: 0x264
	Parameters: 2
	Flags: Linked, Private
*/
function private function_aed09e18(var_2fa3c4c9, location)
{
	foreach(split in var_2fa3c4c9)
	{
		if(isdefined(split))
		{
			split hide();
			split deletedelay();
		}
	}
	if(isdefined(location))
	{
		spawner = #"hash_1a09a8e1ac15a85";
		if(var_2fa3c4c9[0] function_1e521615())
		{
			spawner = #"spawner_zm_steiner_hvt";
		}
		steiner = spawnactor(#"hash_1a09a8e1ac15a85", location.origin, location.angles);
		if(isdefined(steiner))
		{
			steiner forceteleport(location.origin, location.angles);
			steiner.team = #"allies";
			steiner.ignoreall = 1;
			steiner.ignore_find_flesh = 1;
			steiner.ignoreme = 1;
			steiner.ignore_nuke = 1;
			steiner.ignore_all_poi = 1;
			steiner.var_8d1d18aa = 0;
			steiner.ai.var_a29f9a91 = 1;
			steiner.variant_type = 0;
			steiner function_bf898e7e(0);
			steiner function_af554aaf(0);
			steiner function_16a8babd(0);
			steiner.ignore_player = getplayers();
		}
	}
	level flag::set("steiner_merge_done");
}

/*
	Name: function_f045e7c
	Namespace: namespace_88795f45
	Checksum: 0x18ADFA84
	Offset: 0xB1E0
	Size: 0x188
	Parameters: 2
	Flags: None
*/
function function_f045e7c(location, var_c406df14)
{
	steiner = spawnactor(#"hash_1a09a8e1ac15a85", location.origin, location.angles);
	if(isdefined(steiner))
	{
		steiner forceteleport(location.origin, location.angles);
		steiner.team = #"allies";
		steiner.ignoreall = 1;
		steiner.ignore_find_flesh = 1;
		steiner.ignoreme = 0;
		steiner.ignore_nuke = 1;
		steiner.ignore_all_poi = 1;
		steiner.instakill_func = &zm_powerups::function_16c2586a;
		steiner.is_companion = 1;
		steiner.takedamage = 1;
		steiner.var_8d1d18aa = 0;
		steiner.ai.var_a29f9a91 = var_c406df14;
		steiner.variant_type = 0;
		steiner function_bf898e7e(0);
		steiner function_af554aaf(0);
		steiner function_16a8babd(0);
		steiner.ignore_player = getplayers();
		return steiner;
	}
}

/*
	Name: function_7e855c12
	Namespace: namespace_88795f45
	Checksum: 0xA18FCA94
	Offset: 0xB370
	Size: 0xA4
	Parameters: 2
	Flags: None
*/
function function_7e855c12(point, var_c03fe9e3)
{
	self.var_9ecae3b4 = 1;
	if(isdefined(var_c03fe9e3))
	{
		self.zombie_move_speed = var_c03fe9e3;
	}
	else
	{
		self.zombie_move_speed = "walk";
	}
	self setgoal(point, 0);
	self waittill(#"goal");
	self.var_9ecae3b4 = undefined;
	self setgoal(self.origin, 1);
}

/*
	Name: function_c6579189
	Namespace: namespace_88795f45
	Checksum: 0xC664630A
	Offset: 0xB420
	Size: 0x5C
	Parameters: 1
	Flags: None
*/
function function_c6579189(target)
{
	if(!isdefined(target))
	{
		return;
	}
	self setgoal(self.origin, 0, undefined, undefined, vectortoangles(target.origin - self.origin));
}

/*
	Name: function_46d99f6b
	Namespace: namespace_88795f45
	Checksum: 0xA3DD8470
	Offset: 0xB488
	Size: 0x132
	Parameters: 0
	Flags: Private
*/
function private function_46d99f6b()
{
	steiners = getaiarchetypearray(#"hash_7c0d83ac1e845ac2");
	var_ddb534a3 = [];
	foreach(steiner in steiners)
	{
		if(isalive(steiner) && steiner.team == #"allies")
		{
			if(!isdefined(var_ddb534a3))
			{
				var_ddb534a3 = [];
			}
			else if(!isarray(var_ddb534a3))
			{
				var_ddb534a3 = array(var_ddb534a3);
			}
			var_ddb534a3[var_ddb534a3.size] = steiner;
		}
	}
	return var_ddb534a3;
}

/*
	Name: function_6b87eed1
	Namespace: namespace_88795f45
	Checksum: 0x72136E39
	Offset: 0xB5C8
	Size: 0x8A
	Parameters: 0
	Flags: Linked
*/
function function_6b87eed1()
{
	if(!isdefined(self.var_9fde8624))
	{
		return 0;
	}
	var_6f8997fc = array(#"hash_5653bbc44a034094", #"hash_70162f4bc795092", #"hash_12fa854f3a7721b9", #"hash_3498fb1fbfcd0cf");
	return isinarray(var_6f8997fc, self.var_9fde8624);
}

/*
	Name: function_3758a4e7
	Namespace: namespace_88795f45
	Checksum: 0x6AE772CB
	Offset: 0xB660
	Size: 0x6A
	Parameters: 0
	Flags: Linked
*/
function function_3758a4e7()
{
	if(!isdefined(self.var_9fde8624))
	{
		return 0;
	}
	var_6f8997fc = array(#"hash_70162f4bc795092", #"hash_3498fb1fbfcd0cf");
	return isinarray(var_6f8997fc, self.var_9fde8624);
}

/*
	Name: function_ba878b50
	Namespace: namespace_88795f45
	Checksum: 0xE09816A
	Offset: 0xB6D8
	Size: 0x6A
	Parameters: 0
	Flags: Linked
*/
function function_ba878b50()
{
	if(!isdefined(self.var_9fde8624))
	{
		return 0;
	}
	var_6f8997fc = array(#"hash_5653bbc44a034094", #"hash_12fa854f3a7721b9");
	return isinarray(var_6f8997fc, self.var_9fde8624);
}

/*
	Name: function_1e521615
	Namespace: namespace_88795f45
	Checksum: 0x8418BA16
	Offset: 0xB750
	Size: 0x7A
	Parameters: 0
	Flags: Linked
*/
function function_1e521615()
{
	if(!isdefined(self.var_9fde8624))
	{
		return 0;
	}
	var_6f8997fc = array(#"hash_5605f3a585b3ef9f", #"hash_3498fb1fbfcd0cf", #"hash_12fa854f3a7721b9");
	return isinarray(var_6f8997fc, self.var_9fde8624);
}

/*
	Name: function_bbb547de
	Namespace: namespace_88795f45
	Checksum: 0xB989B9CB
	Offset: 0xB7D8
	Size: 0x1E0
	Parameters: 1
	Flags: None
*/
function function_bbb547de(dist)
{
	/#
		var_ddb534a3 = function_46d99f6b();
		foreach(steiner in var_ddb534a3)
		{
			fwd = vectorscale(vectornormalize(anglestoforward(steiner.angles)), dist);
			eye = steiner.origin + vectorscale((0, 0, 1), 80);
			trace = bullettrace(eye, eye + fwd, 0, undefined);
			var_380c580a = positionquery_source_navigation(trace[#"position"], 128, 256, 128, 20);
			point = steiner.origin;
			if(isdefined(var_380c580a) && var_380c580a.data.size > 0)
			{
				point = var_380c580a.data[0].origin;
			}
			goal = getclosestpointonnavmesh(point);
			if(isdefined(goal))
			{
				steiner thread function_7e855c12(goal);
			}
		}
	#/
}

/*
	Name: function_32af84be
	Namespace: namespace_88795f45
	Checksum: 0xAA546D9
	Offset: 0xB9C0
	Size: 0xB0
	Parameters: 1
	Flags: None
*/
function function_32af84be(target)
{
	/#
		var_ddb534a3 = function_46d99f6b();
		foreach(steiner in var_ddb534a3)
		{
			steiner thread function_c6579189(target);
		}
	#/
}

/*
	Name: function_ed79082a
	Namespace: namespace_88795f45
	Checksum: 0xF0EF3D36
	Offset: 0xBA78
	Size: 0x12
	Parameters: 0
	Flags: Linked
*/
function function_ed79082a()
{
	self.var_d03a9e80 = 1;
}

/*
	Name: function_1ebe48df
	Namespace: namespace_88795f45
	Checksum: 0x9B9BE4E1
	Offset: 0xBA98
	Size: 0x7E
	Parameters: 0
	Flags: None
*/
function function_1ebe48df()
{
	self endon(#"death", #"entitydeleted");
	while(true)
	{
		self waittill(#"hash_3eea9a5090ab2f4b");
		if(is_true(self.var_d03a9e80))
		{
			self.var_d03a9e80 = 0;
		}
		else
		{
			self.var_d03a9e80 = 1;
		}
	}
}

/*
	Name: function_5e09bd0f
	Namespace: namespace_88795f45
	Checksum: 0x12EE1BED
	Offset: 0xBB20
	Size: 0x90
	Parameters: 0
	Flags: None
*/
function function_5e09bd0f()
{
	self endon(#"death", #"entitydeleted");
	while(true)
	{
		if(is_true(self.var_d03a9e80))
		{
			self playsoundontag(#"hash_5d4fa1004dc72f03", "tag_eye");
		}
		wait(randomintrange(3, 9));
	}
}

/*
	Name: function_4b261274
	Namespace: namespace_88795f45
	Checksum: 0xB3C7F08A
	Offset: 0xBBB8
	Size: 0x1EA
	Parameters: 1
	Flags: Linked
*/
function function_4b261274(entity)
{
	if(entity.ignoreall)
	{
		return false;
	}
	if(is_true(entity.ai.var_ae3359f))
	{
		return true;
	}
	enemy = entity get_enemy();
	if(!isdefined(enemy) || !is_enemy_valid(enemy))
	{
		return false;
	}
	var_ff38566a = lengthsquared(enemy getvelocity());
	var_17c3916f = 10000;
	if(var_ff38566a < 30625)
	{
		var_17c3916f = 36100;
	}
	if(!is_true(level.intermission))
	{
		if(distancesquared(entity.origin, enemy.origin) > var_17c3916f)
		{
			return false;
		}
		if(!tracepassedonnavmesh(entity.origin, enemy.origin, self getpathfindingradius()))
		{
			return false;
		}
	}
	yawtoenemy = angleclamp180(entity.angles[1] - (vectortoangles(enemy.origin - entity.origin)[1]));
	if(abs(yawtoenemy) > 60)
	{
		return false;
	}
	return true;
}

/*
	Name: function_f9eee290
	Namespace: namespace_88795f45
	Checksum: 0x2DE74736
	Offset: 0xBDB0
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function function_f9eee290(entity)
{
	return isdefined(entity.damageweapon) && namespace_b376a999::function_5fef4201(entity.damageweapon);
}

/*
	Name: function_9397dd2f
	Namespace: namespace_88795f45
	Checksum: 0xE481161E
	Offset: 0xBDF0
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_9397dd2f(entity)
{
	entity asmsetanimationrate(1);
}

/*
	Name: function_6fc64eed
	Namespace: namespace_88795f45
	Checksum: 0x16160819
	Offset: 0xBE28
	Size: 0x3E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_6fc64eed(entity)
{
	entity asmsetanimationrate(1);
	entity.ai.var_2a4908cd = gettime();
}

/*
	Name: function_d5e64bba
	Namespace: namespace_88795f45
	Checksum: 0x17DB2684
	Offset: 0xBE70
	Size: 0x8E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_d5e64bba(entity)
{
	if(function_7a893a7(entity) || function_e6d0f1d4(entity) || zombiebehavior::zombieshouldmeleecondition(entity))
	{
		entity.ai.var_6d3ee308 = gettime() + 500;
		return gettime() - entity.ai.var_2a4908cd;
	}
	return 1500;
}

/*
	Name: function_6254c264
	Namespace: namespace_88795f45
	Checksum: 0x1D52CEA7
	Offset: 0xBF08
	Size: 0xB2
	Parameters: 1
	Flags: Linked, Private
*/
function private function_6254c264(entity)
{
	if(isdefined(entity.var_2e874959))
	{
		entity asmsetanimationrate(entity.var_2e874959);
		/#
			function_ee21651d("" + entity.var_2e874959);
		#/
	}
	entity.ai.var_7555ca97 = undefined;
	if(is_true(entity.ai.var_fad877bf))
	{
		entity.ai.var_fad877bf = 0;
	}
}

/*
	Name: function_e5ef0d0d
	Namespace: namespace_88795f45
	Checksum: 0x1E40A8CA
	Offset: 0xBFC8
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_e5ef0d0d(entity)
{
	entity asmsetanimationrate(1);
}

/*
	Name: function_e456ad9b
	Namespace: namespace_88795f45
	Checksum: 0xA8F7D5B9
	Offset: 0xC000
	Size: 0xB2
	Parameters: 1
	Flags: Linked, Private
*/
function private function_e456ad9b(entity)
{
	if(isdefined(entity.var_2e874959))
	{
		entity asmsetanimationrate(entity.var_2e874959);
		/#
			function_ee21651d("" + entity.var_2e874959);
		#/
	}
	entity.ai.var_7555ca97 = undefined;
	if(is_true(entity.ai.var_fad877bf))
	{
		entity.ai.var_fad877bf = 0;
	}
}

/*
	Name: function_c01f9453
	Namespace: namespace_88795f45
	Checksum: 0x7F8A242B
	Offset: 0xC0C0
	Size: 0x19C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_c01f9453()
{
	a_zombies = getaispeciesarray(level.zombie_team);
	var_e5cc0a0a = [];
	foreach(zombie in a_zombies)
	{
		if(distancesquared(self.origin, zombie.origin) < 10000)
		{
			if(!isdefined(var_e5cc0a0a))
			{
				var_e5cc0a0a = [];
			}
			else if(!isarray(var_e5cc0a0a))
			{
				var_e5cc0a0a = array(var_e5cc0a0a);
			}
			var_e5cc0a0a[var_e5cc0a0a.size] = zombie;
		}
	}
	target_zombie = array::random(var_e5cc0a0a);
	if(isdefined(target_zombie))
	{
		if(is_true(self.ai.var_26b09b96))
		{
			target_zombie zombie_utility::setup_zombie_knockdown(self);
			self.ai.var_26b09b96 = 0;
			self thread function_964739ed();
		}
	}
}

/*
	Name: function_964739ed
	Namespace: namespace_88795f45
	Checksum: 0x29AE6B91
	Offset: 0xC268
	Size: 0x32
	Parameters: 0
	Flags: Linked, Private
*/
function private function_964739ed()
{
	self endon(#"death");
	wait(5);
	self.ai.var_26b09b96 = 1;
}

