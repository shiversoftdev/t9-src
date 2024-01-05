#using scripts\core_common\ai\zombie_utility.gsc;
#using script_35598499769dbb3d;
#using script_41fe08c37d53a635;
#using script_2c5daa95f8fec03c;
#using script_522aeb6ae906391e;
#using script_3aa0f32b70d4f7cb;
#using script_178024232e91b0a1;
#using script_4bf952f6ba31bb17;
#using script_4d85e8de54b02198;
#using script_caf007e2a98afa2;
#using scripts\core_common\ai\archetype_utility.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\throttle_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace namespace_361e505d;

/*
	Name: function_616cd452
	Namespace: namespace_361e505d
	Checksum: 0x62F4525D
	Offset: 0x430
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_616cd452()
{
	level notify(-1485792638);
}

/*
	Name: __init__system__
	Namespace: namespace_361e505d
	Checksum: 0xE5E9973F
	Offset: 0x450
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_7776caebba9c5d5a", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_361e505d
	Checksum: 0x53D69EB3
	Offset: 0x498
	Size: 0x9D6
	Parameters: 0
	Flags: None
*/
function function_70a657d8()
{
	if(!isarchetypeloaded(#"hash_7c09b683edfb0e96"))
	{
		return;
	}
	registerbehaviorscriptfunctions();
	spawner::add_archetype_spawn_function(#"hash_7c09b683edfb0e96", &function_30c823be);
	clientfield::register("scriptmover", "abomLaunchBeamCF", 17000, 1, "int");
	clientfield::register("scriptmover", "abomRegisterBeamTargetCF", 17000, 1, "int");
	clientfield::register("actor", "abomBeamDissolveCF", 17000, 1, "int");
	clientfield::register("actor", "abomHeadDestroyCF", 17000, 2, "int");
	clientfield::register("actor", "abomHeadWeakpointLeCF", 17000, 1, "int");
	clientfield::register("actor", "abomHeadWeakpointMidCF", 17000, 1, "int");
	clientfield::register("actor", "abomHeadWeakpointRiCF", 17000, 1, "int");
	clientfield::register("actor", "abomRoarCF", 17000, 1, "int");
	clientfield::register("actor", "abomMovingCF", 17000, 1, "int");
	clientfield::register("actor", "abomDissolveCF", 17000, 2, "int");
	clientfield::register("toplayer", "abomBullChargeHitPlayerCF", 17000, 1, "int");
	clientfield::register("allplayers", "abomBiteHitPlayerCF", 17000, 1, "counter");
	if(!isdefined(level.var_5ef577c5))
	{
		level.var_5ef577c5 = new throttle();
		[[ level.var_5ef577c5 ]]->initialize(1, (float(function_60d95f53()) / 1000) * 2);
	}
	if(util::get_game_type() === #"zsurvival")
	{
		level.var_1a4cc228[#"hash_7cba8a05511ceedf"] = [7:#"hash_1340313347e93335", 6:#"hash_11e4908180a964c", 5:#"hash_6799427e5e6c417c", 4:#"hash_4d95f42b33499eba", 3:#"hash_1c8805fec5806efe", 2:#"hash_26f6708ef92a0eae", 1:#"hash_1798ecca7f98873d", 0:#"hash_49adea61f71924bf"];
		level.var_1a4cc228[#"hash_29771ab26cb78d9b"] = [7:#"hash_779daa809936d578", 6:#"hash_34d9e63476111b5d", 5:#"hash_1c437f787033a2e5", 4:#"hash_5e074c09a3a31d97", 3:#"hash_11d7f39f088f3822", 2:#"hash_7d223eb036f4a31b", 1:#"hash_299e8cfa6d75ffd4", 0:#"hash_69143c727337ba1a"];
		level.var_1a4cc228[#"hash_46c917a1b5ed91e7"] = [0:#"hash_4729aed4cfa43476"];
		level.var_1a4cc228[#"hash_338eb4103e0ed797"] = [0:#"hash_59e40ffcdcfbffa6"];
		level.var_1a4cc228[#"hash_124b582ce08d78c0"] = [7:#"hash_4ece13caf46c00c7", 6:#"hash_53dbc62471a61f88", 5:#"hash_33c0e923173d2b48", 4:#"hash_75cfd69ce1d6f3dd", 3:#"hash_6b9e4c8e8e955c71", 2:#"hash_94674cb554826a9", 1:#"hash_63e9d6f275dc720", 0:#"hash_149fa86a9c5d858c"];
		level.var_1a4cc228[#"hash_30e4941b102093c4"] = [7:#"hash_53dbc62471a61f88", 6:#"hash_b35b3dcb7417075", 5:#"hash_3e647996c0a4d6b9", 4:#"hash_31713e12a88def10", 3:#"hash_5616978b668f07dc", 2:#"hash_23492308d6911444", 1:#"hash_e8b647bb58521c1", 0:#"hash_5c0dcc3f9d9e1ea5"];
		level.var_1a4cc228[#"hash_78215fa79f5557dc"] = [0:#"hash_4814b7b3c67568e3"];
		level.var_1a4cc228[#"hash_12a17ab3df5889eb"] = level.var_1a4cc228[#"hash_78215fa79f5557dc"];
		level.var_1a4cc228[#"hash_7a8b592728eec95d"] = [0:#"hash_2cb37314243526ec"];
		level.var_1a4cc228[#"hash_729b116cf9d044"] = [0:#"hash_78238b400ae08c28"];
	}
	else if(util::get_map_name() == "zm_tungsten")
	{
		level.var_1a4cc228[#"spawner_bo5_zombie_zm_tungsten"] = [3:#"hash_5c0dcc3f9d9e1ea5", 2:#"hash_63d74789d0b11dbc", 1:#"hash_32561af4cae216fa", 0:#"hash_42c772d33b3b95d7"];
		level.var_1a4cc228[#"spawner_bo5_zombie_zm_tungsten_armor_heavy"] = [0:#"hash_4729aed4cfa43476"];
		level.var_1a4cc228[#"spawner_bo5_zombie_zm_tungsten_armor_medium"] = [0:#"hash_59e40ffcdcfbffa6"];
		level.var_1a4cc228[#"spawner_bo5_zombie_zm_tungsten_omega_soldier"] = [7:#"hash_1c89bc2d12106779", 6:#"hash_2d07ee0d2dca46d9", 5:#"hash_78a973a6fb604cf", 4:#"hash_7151a0027b3ff314", 3:#"hash_1c8805fec5806efe", 2:#"hash_35d84238103deb46", 1:#"hash_7b3bac29e8e3bf13", 0:#"hash_656d60e84740cf6b"];
	}
	/#
		thread function_ac104a3d();
		level thread function_e1f48a38();
	#/
}

/*
	Name: function_30c823be
	Namespace: namespace_361e505d
	Checksum: 0x99EF6B42
	Offset: 0xE78
	Size: 0x4BC
	Parameters: 0
	Flags: None
*/
function function_30c823be()
{
	function_8673af9f();
	self setblackboardattribute("_locomotion_speed", "locomotion_speed_walk");
	self.var_318a0ac8 = &function_a1e5b1db;
	self.custom_melee_fire = &function_a86617d;
	self.allowpain = 0;
	self.var_58c4c69b = 1;
	self.var_586465e4 = 3;
	self.ai.var_24b39f1f = 10;
	self.var_d7fb5a47 = [2:1, 1:1, 0:1];
	self.var_42bc30c = [2:0, 1:0, 0:0];
	self.var_dc06e6af = [2:0, 1:0, 0:0];
	self.var_32309360 = [2:#"hash_60eac895c28bae41", 1:#"hash_60ab2879f1ceca56", 0:#"hash_6127b095c2bf3397"];
	self.var_41ab433a = [2:#"hash_223d33cbb96c441a", 1:#"hash_45992c2c2b853aab", 0:#"hash_225113cbb97cb6c4"];
	self.var_7baf0b4d = [2:"j_head_ri", 1:"j_head", 0:"j_head_le"];
	self.var_a8bb18af = [2:3, 1:3, 0:2];
	self.var_ef229fd6 = [2:12, 1:15, 0:15];
	self.var_ac8b8c0f = [2:"abomHeadWeakpointRiCF", 1:"abomHeadWeakpointMidCF", 0:"abomHeadWeakpointLeCF"];
	self.var_ef651d05 = [2:"tag_fx_head_ri_throat", 1:"tag_fx_head_center_throat", 0:"tag_fx_head_le_throat"];
	self.var_460b8f9b = self getpathfindingradius();
	self.var_ca68c386 = self function_6a9ae71();
	self callback::function_d8abfc3d(#"on_ai_damage", &function_f7441304);
	self callback::function_d8abfc3d(#"on_ai_killed", &function_8991b66);
	self attach(#"hash_6127b095c2bf3397");
	self attach(#"hash_60ab2879f1ceca56");
	self attach(#"hash_60eac895c28bae41");
	function_9de20709(self, 1, int(20 * 1000));
	function_9de20709(self, 4, int(5 * 1000));
	self thread function_18fd18de(self);
	self thread function_838ac041(self);
	self thread function_940cd1d8();
	self function_2038df41(self);
}

/*
	Name: function_8673af9f
	Namespace: namespace_361e505d
	Checksum: 0x138A62EA
	Offset: 0x1340
	Size: 0x32
	Parameters: 0
	Flags: Private
*/
function private function_8673af9f()
{
	blackboard::createblackboardforentity(self);
	self.___archetypeonanimscriptedcallback = &function_41c5d1ff;
}

/*
	Name: function_41c5d1ff
	Namespace: namespace_361e505d
	Checksum: 0x17C299D8
	Offset: 0x1380
	Size: 0x2C
	Parameters: 1
	Flags: Private
*/
function private function_41c5d1ff(entity)
{
	entity.__blackboard = undefined;
	entity function_8673af9f();
}

/*
	Name: registerbehaviorscriptfunctions
	Namespace: namespace_361e505d
	Checksum: 0xBA72AF18
	Offset: 0x13B8
	Size: 0x16BC
	Parameters: 0
	Flags: None
*/
function registerbehaviorscriptfunctions()
{
	/#
		assert(isscriptfunctionptr(&function_40e1bdb2));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_58ccdad05e3dfdf0", &function_40e1bdb2);
	/#
		assert(isscriptfunctionptr(&function_d8fde04f));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_7a264fd56611d346", &function_d8fde04f);
	/#
		assert(isscriptfunctionptr(&function_c5713c35));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_57c0df901a90b8ec", &function_c5713c35);
	/#
		assert(!isdefined(&function_209f64c3) || isscriptfunctionptr(&function_209f64c3));
	#/
	/#
		assert(!isdefined(&function_132c087b) || isscriptfunctionptr(&function_132c087b));
	#/
	/#
		assert(!isdefined(&function_25b49d18) || isscriptfunctionptr(&function_25b49d18));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction(#"hash_27d2c66cd3993e87", &function_209f64c3, &function_132c087b, &function_25b49d18);
	/#
		assert(isscriptfunctionptr(&function_983f6134));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_7e695110b86764c7", &function_983f6134);
	/#
		assert(isscriptfunctionptr(&function_6f6a2167));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_68791b5401a757d8", &function_6f6a2167);
	/#
		assert(isscriptfunctionptr(&function_dd80b921));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_787ad56a97636ea4", &function_dd80b921);
	/#
		assert(isscriptfunctionptr(&function_fc02984a));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_66f085cf6783c6cb", &function_fc02984a);
	/#
		assert(isscriptfunctionptr(&function_48400b3b));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_5eeebea90ed4ecce", &function_48400b3b);
	/#
		assert(isscriptfunctionptr(&function_3e6c0b74));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_6ac5c748ecc553cf", &function_3e6c0b74);
	/#
		assert(!isdefined(&function_998c02dd) || isscriptfunctionptr(&function_998c02dd));
	#/
	/#
		assert(!isdefined(&function_39d052f1) || isscriptfunctionptr(&function_39d052f1));
	#/
	/#
		assert(!isdefined(&function_33bbae5c) || isscriptfunctionptr(&function_33bbae5c));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction(#"hash_7a0bda56e765e93", &function_998c02dd, &function_39d052f1, &function_33bbae5c);
	/#
		assert(isscriptfunctionptr(&function_cb669282));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_2f2a98f870343b04", &function_cb669282);
	/#
		assert(isscriptfunctionptr(&function_1f33b20c));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_268d56d2d40606fe", &function_1f33b20c);
	/#
		assert(isscriptfunctionptr(&function_1f33b20c));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_268d56d2d40606fe", &function_1f33b20c);
	/#
		assert(isscriptfunctionptr(&function_46855ac8));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_1a7c6ae7b2d009fd", &function_46855ac8);
	/#
		assert(isscriptfunctionptr(&function_8f8e4828));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_13a5f8af435e5047", &function_8f8e4828);
	/#
		assert(isscriptfunctionptr(&function_cb669282));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_2f2a98f870343b04", &function_cb669282);
	/#
		assert(isscriptfunctionptr(&function_d6975705));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_37f63fc90f963787", &function_d6975705);
	/#
		assert(isscriptfunctionptr(&function_a81051b8));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_3e15369ae2e0ba02", &function_a81051b8);
	/#
		assert(isscriptfunctionptr(&function_d6975705));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_37f63fc90f963787", &function_d6975705);
	/#
		assert(isscriptfunctionptr(&function_a81051b8));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_3e15369ae2e0ba02", &function_a81051b8);
	/#
		assert(isscriptfunctionptr(&function_e75778ab));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_5d59d21e3b6f7923", &function_e75778ab);
	/#
		assert(isscriptfunctionptr(&function_3a175c82));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_1337fdf2de40e117", &function_3a175c82);
	/#
		assert(isscriptfunctionptr(&function_86e3dd7b));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_f7408c272e04bcf", &function_86e3dd7b);
	/#
		assert(isscriptfunctionptr(&function_fcb91a0d));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_34f47a9621b05d49", &function_fcb91a0d);
	/#
		assert(isscriptfunctionptr(&function_b3bc50af));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_fa82962810e4d26", &function_b3bc50af);
	/#
		assert(isscriptfunctionptr(&function_cbeafd0f));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_577fbe18c438d63", &function_cbeafd0f);
	/#
		assert(isscriptfunctionptr(&function_9d242adf));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_276abc14e4ebc2fb", &function_9d242adf);
	/#
		assert(isscriptfunctionptr(&function_3160120e));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_3a4c97a14693ce39", &function_3160120e);
	/#
		assert(isscriptfunctionptr(&function_3a6d62a1));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_62b46928d4bca570", &function_3a6d62a1);
	/#
		assert(!isdefined(&function_c0e34ca8) || isscriptfunctionptr(&function_c0e34ca8));
	#/
	/#
		assert(!isdefined(&function_640570ec) || isscriptfunctionptr(&function_640570ec));
	#/
	/#
		assert(!isdefined(&function_bcf8dd2a) || isscriptfunctionptr(&function_bcf8dd2a));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction(#"hash_74b036e6bb61f73a", &function_c0e34ca8, &function_640570ec, &function_bcf8dd2a);
	/#
		assert(isscriptfunctionptr(&function_e7cfd92));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_560f5388a6b3e2e8", &function_e7cfd92);
	/#
		assert(isscriptfunctionptr(&function_6791808c));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_4e52767083f9e130", &function_6791808c);
	/#
		assert(isscriptfunctionptr(&function_edcb107c));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_cc8a263f2d4daee", &function_edcb107c);
	/#
		assert(isscriptfunctionptr(&function_acb229fd));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_399a1a1e26e04f1e", &function_acb229fd);
	/#
		assert(isscriptfunctionptr(&function_fe8e1e36));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_643d6ada48d2aa54", &function_fe8e1e36);
	/#
		assert(isscriptfunctionptr(&function_150b8b34));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_49518eaed69959c2", &function_150b8b34);
	/#
		assert(isscriptfunctionptr(&function_6b70d881));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_701b10ec24211ee7", &function_6b70d881);
	/#
		assert(!isdefined(&function_59685ed1) || isscriptfunctionptr(&function_59685ed1));
	#/
	/#
		assert(!isdefined(&function_58607a4e) || isscriptfunctionptr(&function_58607a4e));
	#/
	/#
		assert(!isdefined(&function_7b02beac) || isscriptfunctionptr(&function_7b02beac));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction(#"hash_d0be211581fcc79", &function_59685ed1, &function_58607a4e, &function_7b02beac);
	/#
		assert(isscriptfunctionptr(&function_19f30be));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_4595b7e254f5e148", &function_19f30be);
	/#
		assert(isscriptfunctionptr(&function_69623844));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_4aac2bbead44fd09", &function_69623844);
	/#
		assert(isscriptfunctionptr(&function_edde2d40));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_7d49d4032b033e82", &function_edde2d40);
	/#
		assert(isscriptfunctionptr(&function_4a5cebe2));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_64fadb62459a2d3", &function_4a5cebe2);
	/#
		assert(isscriptfunctionptr(&function_40c7079));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_3d45dc0a0c17074c", &function_40c7079);
	/#
		assert(isscriptfunctionptr(&function_ecb071b2));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_274a29a6c6e57895", &function_ecb071b2);
	/#
		assert(isscriptfunctionptr(&function_4d225f59));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_6fc7ddb1aba362eb", &function_4d225f59);
	animationstatenetwork::registeranimationmocomp("mocomp_abom_slide_outro", &function_d6971904, undefined, undefined);
	animationstatenetwork::registernotetrackhandlerfunction("abom_death_hide", &function_844fe7cb);
	animationstatenetwork::registernotetrackhandlerfunction("abom_death_dissolve", &abom_death_dissolve);
	animationstatenetwork::registernotetrackhandlerfunction("abom_head_impact", &function_a67b1c39);
}

/*
	Name: function_f7441304
	Namespace: namespace_361e505d
	Checksum: 0x5674945C
	Offset: 0x2A80
	Size: 0x16
	Parameters: 1
	Flags: None
*/
function function_f7441304(params)
{
	self.var_3f6ed6d = gettime();
}

/*
	Name: function_8991b66
	Namespace: namespace_361e505d
	Checksum: 0xD2D034BE
	Offset: 0x2AA0
	Size: 0x8C
	Parameters: 1
	Flags: None
*/
function function_8991b66(params)
{
	if(!self flag::get(#"hash_582584e89b2833cf"))
	{
		self.variant_type = 3;
	}
	if(isdefined(self.var_ee2440ac))
	{
		self.var_ee2440ac delete();
	}
	if(isdefined(self.head_collision))
	{
		self.head_collision delete();
	}
}

/*
	Name: function_844fe7cb
	Namespace: namespace_361e505d
	Checksum: 0x14956862
	Offset: 0x2B38
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function function_844fe7cb(entity)
{
	entity ghost();
	entity notsolid();
}

/*
	Name: abom_death_dissolve
	Namespace: namespace_361e505d
	Checksum: 0x9BE16A7D
	Offset: 0x2B80
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function abom_death_dissolve(entity)
{
	entity clientfield::set("abomDissolveCF", 2);
}

/*
	Name: function_2038df41
	Namespace: namespace_361e505d
	Checksum: 0xAAFAA23A
	Offset: 0x2BB8
	Size: 0x116
	Parameters: 1
	Flags: None
*/
function function_2038df41(entity)
{
	origin_offset = (0, 0, 0);
	angle_offset = (0, 0, 0);
	tag_origin = entity gettagorigin("j_head");
	tag_angles = entity gettagangles("j_head");
	model = util::spawn_model(#"hash_5329fae525fc210", tag_origin, tag_angles);
	model linkto(entity, "j_head", origin_offset, angle_offset);
	model ghost();
	model.parent = entity;
	entity.head_collision = model;
}

/*
	Name: function_a1e5b1db
	Namespace: namespace_361e505d
	Checksum: 0x7BB282B8
	Offset: 0x2CD8
	Size: 0x4FC
	Parameters: 13
	Flags: None
*/
function function_a1e5b1db(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype)
{
	if(isdefined(self.var_306ee014) && is_true([[self.var_306ee014]](self)))
	{
		vdir = 0;
	}
	self.var_426947c4 = undefined;
	var_ebcff177 = 1;
	weakpoint = namespace_81245006::function_3131f5dd(self, surfacetype, 1);
	if(!isdefined(weakpoint))
	{
		weakpoint = namespace_81245006::function_73ab4754(self, boneindex, 1);
	}
	if(isdefined(weakpoint) && weakpoint.var_3765e777 === 1 && aiutility::function_e2278a4b(psoffsettime, shitloc))
	{
		var_ebcff177 = 2;
		vdir = vdir * 1;
	}
	var_c5a8cbf7 = 0;
	if(shitloc === "MOD_MELEE" || shitloc === "MOD_EXPLOSIVE")
	{
		damage_origin = (isdefined(vpoint) ? vpoint.origin : boneindex);
		if(isdefined(damage_origin) && function_1c713d40(self))
		{
			to_damage = damage_origin - self.origin;
			to_damage = (to_damage[0], to_damage[1], 0);
			dot = vectordot(anglestoforward(self.angles), vectornormalize(to_damage));
			if(dot > 0.5)
			{
				var_c5a8cbf7 = 1;
				if(!isdefined(weakpoint))
				{
					weakpoint = namespace_81245006::function_c6aef8e0(self, damage_origin, 1);
				}
			}
		}
	}
	if(isdefined(weakpoint) && weakpoint.type === #"weakpoint" && namespace_81245006::function_f29756fe(weakpoint) !== 3)
	{
		var_8df5a32 = self.var_3539aa66;
		if(function_a5cc03cf(weakpoint, vdir, vpoint))
		{
			var_8e455c43 = function_fc845eb6(self);
			var_8d253a4b = 0.3333333 * var_8e455c43;
			if(var_8e455c43 === 1 && isdefined(var_8df5a32))
			{
				var_d238daa9 = gettime() - var_8df5a32;
				var_a19da801 = (max(1 - (var_d238daa9 / (int(10 * 1000))), 0)) * var_8d253a4b;
				var_8d253a4b = var_8d253a4b + var_a19da801;
			}
			vdir = max(self.health - (var_8d253a4b * self.maxhealth), vdir);
		}
	}
	if(isdefined(level.var_1b01acb4))
	{
		vdir = vdir * [[level.var_1b01acb4]](self, psoffsettime, vpoint);
	}
	if(isdefined(level.var_59505a17))
	{
		if([[level.var_59505a17]](psoffsettime))
		{
			if(!var_c5a8cbf7 && !isdefined(weakpoint))
			{
				vdir = vdir * 1;
			}
		}
	}
	if(shitloc === "MOD_MELEE")
	{
		self.var_d3c01fba = gettime();
	}
	if(!isdefined(weakpoint) && !var_c5a8cbf7)
	{
		vdir = vdir * 0.2;
		var_ebcff177 = 5;
	}
	return {#hash_ebcff177:var_ebcff177, #weakpoint:weakpoint, #damage:vdir};
}

/*
	Name: function_a5cc03cf
	Namespace: namespace_361e505d
	Checksum: 0x3B7AAD65
	Offset: 0x31E0
	Size: 0x3C6
	Parameters: 3
	Flags: Private
*/
function private function_a5cc03cf(weakpoint, var_31e96b81, eattacker)
{
	var_5f61b252 = 0;
	if(var_31e96b81.type === #"weakpoint" && var_31e96b81.currstate === 1)
	{
		var_8e455c43 = function_fc845eb6(self);
		var_e5da1214 = 0;
		if(var_8e455c43 === 1 && var_31e96b81.var_3765e777 === 1)
		{
			if(isactor(self) && isdefined(var_31e96b81.var_98634dc5))
			{
				self clientfield::increment(var_31e96b81.var_98634dc5);
			}
			if(eattacker >= self.health)
			{
				var_e5da1214 = 1;
				self flag::set(#"hash_582584e89b2833cf");
			}
		}
		else
		{
			namespace_81245006::function_ef87b7e8(var_31e96b81, eattacker);
			var_e5da1214 = namespace_81245006::function_f29756fe(var_31e96b81) === 3;
		}
		if(var_8e455c43 === 3 && !var_e5da1214)
		{
			var_a1de855e = function_290a928a(self);
			var_2234b71 = 0.15;
			if(!isdefined(self.var_9b6ec743))
			{
				self.var_9b6ec743 = gettime();
			}
			if(gettime() - self.var_9b6ec743 > int(15 * 1000))
			{
				var_2234b71 = 0.25;
			}
			if(var_a1de855e < var_2234b71)
			{
				var_e5da1214 = 1;
				/#
					if(is_true(level.var_bb61089c))
					{
						println((("" + "") + var_a1de855e) + "");
					}
				#/
			}
		}
		if(var_e5da1214)
		{
			destructserverutils::function_8475c53a(self, var_31e96b81.var_f371ebb0);
			if(isdefined(var_31e96b81.hittags[0]))
			{
				var_5f61b252 = 1;
				/#
					if(is_true(level.var_bb61089c))
					{
						println(((("" + "") + var_31e96b81.hittags[0]) + "") + eattacker);
					}
				#/
				switch(var_31e96b81.hittags[0])
				{
					case "tag_fx_jaw_le":
					{
						function_bea34373(self, 0);
						break;
					}
					case "tag_fx_jaw_center":
					{
						function_bea34373(self, 1);
						break;
					}
					case "tag_fx_jaw_ri":
					{
						function_bea34373(self, 2);
						break;
					}
				}
			}
		}
	}
	return var_5f61b252;
}

/*
	Name: function_290a928a
	Namespace: namespace_361e505d
	Checksum: 0x8BF79D4
	Offset: 0x35B0
	Size: 0xE2
	Parameters: 2
	Flags: Private
*/
function private function_290a928a(entity, head_index)
{
	weakpoints = namespace_81245006::function_fab3ee3e(entity);
	var_179f62f6 = 0;
	if(isdefined(head_index))
	{
		var_179f62f6 = max(weakpoints[head_index].health, 0);
	}
	else
	{
		for(i = 0; i < 3; i++)
		{
			var_179f62f6 = var_179f62f6 + max(weakpoints[i].health, 0);
		}
	}
	return float(var_179f62f6 / entity.maxhealth);
}

/*
	Name: function_17ae1df1
	Namespace: namespace_361e505d
	Checksum: 0x5873B37B
	Offset: 0x36A0
	Size: 0x32
	Parameters: 2
	Flags: None
*/
function function_17ae1df1(entity, head_index)
{
	return is_true(entity.var_d7fb5a47[head_index]);
}

/*
	Name: function_bea34373
	Namespace: namespace_361e505d
	Checksum: 0xF5A17300
	Offset: 0x36E0
	Size: 0x184
	Parameters: 2
	Flags: None
*/
function function_bea34373(entity, head_index)
{
	if(!is_true(entity.var_d7fb5a47[head_index]))
	{
		return;
	}
	entity detach(entity.var_32309360[head_index]);
	if(!entity isattached(entity.var_41ab433a[head_index]))
	{
		entity attach(entity.var_41ab433a[head_index]);
	}
	entity clientfield::set("abomHeadDestroyCF", head_index + 1);
	entity clientfield::set(entity.var_ac8b8c0f[head_index], 0);
	function_8d085377(entity, head_index);
	entity.var_d7fb5a47[head_index] = 0;
	entity.variant_type = head_index;
	entity.var_3539aa66 = gettime();
	entity.var_7ba69527 = 1;
	function_261709aa(entity, 1, int(5 * 1000));
}

/*
	Name: function_fc845eb6
	Namespace: namespace_361e505d
	Checksum: 0xBD8F30A7
	Offset: 0x3870
	Size: 0x64
	Parameters: 1
	Flags: None
*/
function function_fc845eb6(entity)
{
	loc_000038B0:
	return (entity.var_d7fb5a47[0] ? 1 : 0) + (entity.var_d7fb5a47[1] ? 1 : 0) + (entity.var_d7fb5a47[2] ? 1 : 0);
}

/*
	Name: function_4a5cebe2
	Namespace: namespace_361e505d
	Checksum: 0x7928377C
	Offset: 0x38E0
	Size: 0x22
	Parameters: 1
	Flags: None
*/
function function_4a5cebe2(entity)
{
	return is_true(entity.var_7ba69527);
}

/*
	Name: function_40c7079
	Namespace: namespace_361e505d
	Checksum: 0x951FCC13
	Offset: 0x3910
	Size: 0xB4
	Parameters: 1
	Flags: None
*/
function function_40c7079(entity)
{
	entity.var_7ba69527 = 0;
	if(!function_b31e6110(entity, 5))
	{
		entity flag::set(#"hash_1b72d36ab70a9107");
	}
	function_9de20709(entity, 5, int(10 * 1000));
	entity thread flag::set_for_time(10, "abom_head_recently_blown_off");
}

/*
	Name: function_4d225f59
	Namespace: namespace_361e505d
	Checksum: 0xBD2F0ACC
	Offset: 0x39D0
	Size: 0x52
	Parameters: 1
	Flags: None
*/
function function_4d225f59(entity)
{
	if(entity flag::get(#"hash_1b72d36ab70a9107"))
	{
		return 1000;
	}
	return int(-1);
}

/*
	Name: function_ecb071b2
	Namespace: namespace_361e505d
	Checksum: 0x9299821F
	Offset: 0x3A30
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function function_ecb071b2(entity)
{
	entity flag::clear(#"hash_1b72d36ab70a9107");
}

/*
	Name: function_b31e6110
	Namespace: namespace_361e505d
	Checksum: 0x5ECFBBDA
	Offset: 0x3A68
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_b31e6110(entity, attack)
{
	if(isdefined(entity.var_95721b4e[attack]))
	{
		return gettime() > entity.var_95721b4e[attack];
	}
	return 1;
}

/*
	Name: function_9de20709
	Namespace: namespace_361e505d
	Checksum: 0x9C96809A
	Offset: 0x3AB0
	Size: 0x4C
	Parameters: 3
	Flags: None
*/
function function_9de20709(entity, attack, var_1ec63d3d)
{
	if(!isdefined(entity.var_95721b4e))
	{
		entity.var_95721b4e = [];
	}
	entity.var_95721b4e[attack] = gettime() + var_1ec63d3d;
}

/*
	Name: function_ef9e3f0
	Namespace: namespace_361e505d
	Checksum: 0x53B21CA5
	Offset: 0x3B08
	Size: 0x8C
	Parameters: 3
	Flags: None
*/
function function_ef9e3f0(entity, attack, var_1ec63d3d)
{
	if(!isdefined(entity.var_95721b4e))
	{
		entity.var_95721b4e = [];
	}
	if(isdefined(entity.var_95721b4e[attack]))
	{
		var_b4943dff = entity.var_95721b4e[attack] - gettime();
		if(var_b4943dff > var_1ec63d3d)
		{
			function_9de20709(entity, attack, var_1ec63d3d);
		}
	}
}

/*
	Name: function_68ca0622
	Namespace: namespace_361e505d
	Checksum: 0x8D56F4DD
	Offset: 0x3BA0
	Size: 0x8C
	Parameters: 3
	Flags: None
*/
function function_68ca0622(entity, attack, var_1ec63d3d)
{
	if(!isdefined(entity.var_95721b4e))
	{
		entity.var_95721b4e = [];
	}
	if(isdefined(entity.var_95721b4e[attack]))
	{
		var_b4943dff = entity.var_95721b4e[attack] - gettime();
		if(var_b4943dff < var_1ec63d3d)
		{
			function_9de20709(entity, attack, var_1ec63d3d);
		}
	}
}

/*
	Name: function_261709aa
	Namespace: namespace_361e505d
	Checksum: 0x184C1522
	Offset: 0x3C38
	Size: 0x104
	Parameters: 3
	Flags: None
*/
function function_261709aa(entity, attack, var_1ec63d3d)
{
	if(!isdefined(entity.var_95721b4e))
	{
		entity.var_95721b4e = [];
	}
	if(isdefined(entity.var_95721b4e[attack]))
	{
		var_b4943dff = entity.var_95721b4e[attack] - gettime();
		new_time = var_b4943dff - var_1ec63d3d;
		function_9de20709(entity, attack, new_time);
		/#
			if(is_true(level.var_bb61089c))
			{
				println(((("" + "") + attack) + "") + (float(new_time) / 1000));
			}
		#/
	}
}

/*
	Name: function_4d4efd70
	Namespace: namespace_361e505d
	Checksum: 0xE6B7BA
	Offset: 0x3D48
	Size: 0x8C
	Parameters: 3
	Flags: None
*/
function function_4d4efd70(entity, attack, var_1ec63d3d)
{
	if(!isdefined(entity.var_95721b4e))
	{
		entity.var_95721b4e = [];
	}
	if(isdefined(entity.var_95721b4e[attack]))
	{
		var_b4943dff = entity.var_95721b4e[attack] - gettime();
		if(var_b4943dff < var_1ec63d3d)
		{
			function_9de20709(entity, attack, 0);
		}
	}
}

/*
	Name: function_940cd1d8
	Namespace: namespace_361e505d
	Checksum: 0xF67CA0A3
	Offset: 0x3DE0
	Size: 0xD4
	Parameters: 0
	Flags: None
*/
function function_940cd1d8()
{
	self endon(#"death");
	if(self flag::get(#"hash_78790bd238b6fdc2"))
	{
		return;
	}
	self flag::set(#"hash_78790bd238b6fdc2");
	self clientfield::set("abomDissolveCF", 1);
	wait(2);
	self clientfield::set("abomDissolveCF", 0);
	self flag::clear(#"hash_78790bd238b6fdc2");
}

/*
	Name: function_69623844
	Namespace: namespace_361e505d
	Checksum: 0x1257E5E9
	Offset: 0x3EC0
	Size: 0x4A4
	Parameters: 1
	Flags: None
*/
function function_69623844(entity)
{
	var_f08cc1e0 = function_fc845eb6(entity);
	enemy = undefined;
	if(isdefined(level.var_f67b08f5))
	{
		enemy = [[level.var_f67b08f5]](self);
	}
	if(isdefined(enemy))
	{
		key_zmb_ke = gettime() - (isdefined(entity.var_3f6ed6d) ? entity.var_3f6ed6d : 0);
		if(var_f08cc1e0 === 3 && key_zmb_ke > (int(3 * 1000)))
		{
			var_f08cc1e0 = var_f08cc1e0 - 1;
		}
		if(var_f08cc1e0 === 2 && distancesquared(enemy.origin, entity.origin) > sqr(600) && !entity cansee(enemy) && key_zmb_ke > ((int(3 * 1000)) * 2))
		{
			var_f08cc1e0 = var_f08cc1e0 - 1;
		}
	}
	new_move_speed = "locomotion_speed_walk";
	if(var_f08cc1e0 <= 1)
	{
		new_move_speed = "locomotion_speed_sprint";
	}
	else if(var_f08cc1e0 <= 2)
	{
		new_move_speed = "locomotion_speed_run";
	}
	var_f08cc1e0 = undefined;
	/#
		var_3700e49b = getdvarstring(#"hash_57c46d0c21968268", "");
		if(var_3700e49b !== "")
		{
			new_move_speed = var_3700e49b;
		}
	#/
	move_speed = entity getblackboardattribute("_locomotion_speed");
	if(isdefined(new_move_speed) && new_move_speed !== move_speed)
	{
		entity setblackboardattribute("_locomotion_speed", new_move_speed);
	}
	function_2fe507a5(entity, entity.origin);
	if(!entity flag::get(#"hash_42f4206825b6195"))
	{
		entity flag::set(#"hash_42f4206825b6195");
		entity clientfield::set("abomMovingCF", 1);
		entity.var_37c36f39 = gettime();
		function_68ca0622(entity, 4, 200);
		/#
			if(is_true(level.var_bb61089c))
			{
				println("" + "");
			}
		#/
	}
	entity function_d7033ff(function_2fee0cc6(entity));
	ground_trace = groundtrace(entity.origin, entity.origin - vectorscale((0, 0, 1), 20), 0, entity);
	radius = entity.var_460b8f9b;
	height = entity.var_ca68c386;
	if(ground_trace[#"fraction"] < 1)
	{
		if(ground_trace[#"normal"][2] < 0.9)
		{
			radius = getdvarint(#"hash_14c2f74ecadf1614", 15);
		}
	}
	entity setphysparams(radius, 0, height);
}

/*
	Name: function_19f30be
	Namespace: namespace_361e505d
	Checksum: 0x6BCA928B
	Offset: 0x4370
	Size: 0x42
	Parameters: 1
	Flags: Private
*/
function private function_19f30be(entity)
{
	if(entity flag::get(#"hash_78790bd238b6fdc2"))
	{
		return 0;
	}
	return btapi_locomotionbehaviorcondition(entity);
}

/*
	Name: function_edde2d40
	Namespace: namespace_361e505d
	Checksum: 0xCBE77154
	Offset: 0x43C0
	Size: 0x94
	Parameters: 1
	Flags: Private
*/
function private function_edde2d40(entity)
{
	entity flag::clear(#"hash_42f4206825b6195");
	entity clientfield::set("abomMovingCF", 0);
	/#
		if(is_true(level.var_bb61089c))
		{
			println("" + "");
		}
	#/
}

/*
	Name: function_838ac041
	Namespace: namespace_361e505d
	Checksum: 0x211F93A1
	Offset: 0x4460
	Size: 0x1B6
	Parameters: 1
	Flags: Private
*/
function private function_838ac041(entity)
{
	self endon(#"death");
	while(true)
	{
		var_30b7a63c = entity predictpath();
		status = var_30b7a63c[#"path_prediction_status"];
		if(status === 2 && !entity function_76f5c546(0))
		{
			entity flag::set(#"hash_5c35337a4e15867");
		}
		else
		{
			entity flag::clear(#"hash_5c35337a4e15867");
			/#
				if(getdvarint(#"hash_4e47873b8bfbca14", 0) > 0)
				{
					function_ae63c292(var_30b7a63c[#"path_prediction_enter_turn_point"], "", (0, 1, 0));
					function_ae63c292(var_30b7a63c[#"path_prediction_leave_turn_point"], "", (1, 0, 0));
				}
			#/
		}
		entity waittill(#"goal", #"goal_changed", #"path_set", #"pathfind_result");
		waitframe(1);
	}
}

/*
	Name: function_cb669282
	Namespace: namespace_361e505d
	Checksum: 0x9B109565
	Offset: 0x4620
	Size: 0x90
	Parameters: 1
	Flags: Private
*/
function private function_cb669282(entity)
{
	var_d40fc7e0 = entity function_be51bf77();
	if(var_d40fc7e0 < 45 || var_d40fc7e0 > 315)
	{
		return false;
	}
	move_speed = entity getblackboardattribute("_locomotion_speed");
	if(move_speed === "locomotion_speed_sprint")
	{
		return false;
	}
	return true;
}

/*
	Name: function_1f33b20c
	Namespace: namespace_361e505d
	Checksum: 0x1130E0B1
	Offset: 0x46B8
	Size: 0x90
	Parameters: 1
	Flags: Private
*/
function private function_1f33b20c(entity)
{
	var_d40fc7e0 = entity function_be51bf77();
	if(var_d40fc7e0 < 90 || var_d40fc7e0 > 270)
	{
		return false;
	}
	move_speed = entity getblackboardattribute("_locomotion_speed");
	if(move_speed === "locomotion_speed_sprint")
	{
		return false;
	}
	return true;
}

/*
	Name: function_46855ac8
	Namespace: namespace_361e505d
	Checksum: 0x14B2B611
	Offset: 0x4750
	Size: 0x50
	Parameters: 1
	Flags: Private
*/
function private function_46855ac8(entity)
{
	move_speed = entity getblackboardattribute("_locomotion_speed");
	if(move_speed === "locomotion_speed_sprint")
	{
		return false;
	}
	return true;
}

/*
	Name: function_8f8e4828
	Namespace: namespace_361e505d
	Checksum: 0xD7F37F5F
	Offset: 0x47A8
	Size: 0x88
	Parameters: 1
	Flags: Private
*/
function private function_8f8e4828(entity)
{
	move_speed = entity getblackboardattribute("_locomotion_speed");
	if(move_speed !== "locomotion_speed_sprint")
	{
		return false;
	}
	if(isdefined(entity.var_37c36f39))
	{
		var_370511c5 = gettime() - entity.var_37c36f39;
		if(var_370511c5 > 100)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_d6975705
	Namespace: namespace_361e505d
	Checksum: 0x80EB14E
	Offset: 0x4838
	Size: 0x30
	Parameters: 1
	Flags: Private
*/
function private function_d6975705(entity)
{
	entity flag::set(#"turning");
	return true;
}

/*
	Name: function_a81051b8
	Namespace: namespace_361e505d
	Checksum: 0x37F2339D
	Offset: 0x4870
	Size: 0x30
	Parameters: 1
	Flags: Private
*/
function private function_a81051b8(entity)
{
	entity flag::clear(#"turning");
	return true;
}

/*
	Name: function_be51bf77
	Namespace: namespace_361e505d
	Checksum: 0xC0F9B5A7
	Offset: 0x48A8
	Size: 0x136
	Parameters: 0
	Flags: Private
*/
function private function_be51bf77()
{
	enemy = undefined;
	if(isdefined(level.var_f67b08f5))
	{
		enemy = [[level.var_f67b08f5]](self);
	}
	if(isdefined(enemy))
	{
		predictedpos = self lastknownpos(enemy);
		if(isdefined(predictedpos))
		{
			turnyaw = absangleclamp360(self.angles[1] - (vectortoangles(predictedpos - self.origin)[1]));
			return turnyaw;
		}
	}
	else
	{
		var_1f1f9cfa = self function_4794d6a3();
		if(isdefined(var_1f1f9cfa.goalpos))
		{
			turnyaw = absangleclamp360(self.angles[1] - (vectortoangles(var_1f1f9cfa.goalpos - self.origin)[1]));
			return turnyaw;
		}
	}
	return 0;
}

/*
	Name: function_2fee0cc6
	Namespace: namespace_361e505d
	Checksum: 0x1F674574
	Offset: 0x49E8
	Size: 0x54
	Parameters: 1
	Flags: Private
*/
function private function_2fee0cc6(entity)
{
	move_speed = entity getblackboardattribute("_locomotion_speed");
	if(move_speed === "locomotion_speed_sprint")
	{
		return 1.5;
	}
	return 1;
}

/*
	Name: function_40e1bdb2
	Namespace: namespace_361e505d
	Checksum: 0x64686102
	Offset: 0x4A48
	Size: 0x146
	Parameters: 1
	Flags: None
*/
function function_40e1bdb2(entity)
{
	/#
		if(is_true(entity.var_a8785ea7))
		{
			return true;
		}
		if(getdvarint(#"hash_1d29ba18cfbb1bbb", 0) > 0)
		{
			return false;
		}
	#/
	if(entity flag::get(#"hash_78790bd238b6fdc2"))
	{
		return false;
	}
	enemy = undefined;
	if(isdefined(level.var_f67b08f5))
	{
		enemy = [[level.var_f67b08f5]](entity);
	}
	if(!is_true(entity.var_1fa24724) && isdefined(enemy) && zombie_utility::is_player_valid(enemy, 1))
	{
		if(entity flag::get(#"hash_5c35337a4e15867"))
		{
			if(function_b31e6110(entity, 0))
			{
				return true;
			}
		}
	}
	return false;
}

/*
	Name: function_d8fde04f
	Namespace: namespace_361e505d
	Checksum: 0x9FCDC403
	Offset: 0x4B98
	Size: 0x134
	Parameters: 1
	Flags: Private
*/
function private function_d8fde04f(entity)
{
	var_4b5e91d6 = 0;
	move_speed = entity getblackboardattribute("_locomotion_speed");
	if(move_speed === "locomotion_speed_sprint")
	{
		if(randomfloat(1) < 0.2)
		{
			/#
				if(is_true(level.var_bb61089c))
				{
					println("" + "");
				}
			#/
			var_4b5e91d6 = 1;
		}
	}
	if(entity flag::get(#"abom_head_recently_blown_off") || entity flag::get(#"hash_1f9ad625c3185bf4") || var_4b5e91d6)
	{
		entity flag::set(#"hash_1a23f4b19598f1b0");
	}
}

/*
	Name: function_c5713c35
	Namespace: namespace_361e505d
	Checksum: 0xF2D8774A
	Offset: 0x4CD8
	Size: 0x52
	Parameters: 1
	Flags: Private
*/
function private function_c5713c35(entity)
{
	if(entity flag::get(#"hash_1a23f4b19598f1b0"))
	{
		return 1000;
	}
	return int(-1);
}

/*
	Name: function_209f64c3
	Namespace: namespace_361e505d
	Checksum: 0x7C19343B
	Offset: 0x4D38
	Size: 0xDA
	Parameters: 2
	Flags: None
*/
function function_209f64c3(entity, asmstatename)
{
	animationstatenetworkutility::requeststate(entity, asmstatename);
	entity.var_ccd1e8c = gettime();
	function_9de20709(entity, 0, int(20 * 1000));
	entity.var_4f5d39ac = entity getvelocity();
	entity.var_2bd7ca9d = 0;
	entity flag::clear(#"hash_5047ba8da693e1c5");
	entity.var_2976f01f = entity.origin;
	return 5;
}

/*
	Name: function_132c087b
	Namespace: namespace_361e505d
	Checksum: 0xD7926A9C
	Offset: 0x4E20
	Size: 0xA06
	Parameters: 2
	Flags: None
*/
function function_132c087b(behaviortreeentity, asmstatename)
{
	velocity = asmstatename getvelocity();
	if(!isdefined(asmstatename.var_4f5d39ac))
	{
		asmstatename.var_4f5d39ac = velocity;
	}
	var_71610b41 = 0.2;
	var_9a4357f2 = asmstatename.origin + (velocity * var_71610b41);
	/#
		if(getdvarint(#"hash_4e47873b8bfbca14", 0) > 0)
		{
			function_ae63c292(var_9a4357f2, "", (0, 0, 1));
		}
	#/
	function_2fe507a5(asmstatename, var_9a4357f2);
	var_11d22bae = function_849b329(asmstatename, var_9a4357f2);
	if(is_true(var_11d22bae))
	{
		/#
			if(is_true(level.var_bb61089c))
			{
				println("" + "");
			}
		#/
		return 4;
	}
	drop_height = 60;
	var_53b2da60 = zombie_utility::function_d446de65(asmstatename, var_9a4357f2, drop_height, 0.5);
	if(isdefined(var_53b2da60))
	{
		/#
			if(getdvarint(#"hash_4e47873b8bfbca14", 0) > 0)
			{
				function_ae63c292(var_53b2da60, "", (1, 0, 1));
			}
		#/
	}
	trace_z_offset = vectorscale((0, 0, 1), 70);
	var_1cdbb377 = 40;
	var_b76d460e = (var_1cdbb377 * -1, var_1cdbb377 * -1, -5);
	var_d7c27d70 = (var_1cdbb377, var_1cdbb377, 5);
	trace_point = var_9a4357f2 + (vectornormalize(velocity) * 30);
	trace_point = (trace_point[0], trace_point[1], max(var_9a4357f2[2], asmstatename.origin[2]));
	trace = physicstraceex(asmstatename.origin + trace_z_offset, trace_point + trace_z_offset, var_b76d460e, var_d7c27d70);
	var_cb7d6f5 = isdefined(trace[#"fraction"]) && trace[#"fraction"] < 1;
	/#
		if(getdvarint(#"hash_4e47873b8bfbca14", 0) > 0)
		{
			box_origin = trace[#"position"];
			var_7ce15329 = (var_cb7d6f5 ? (1, 0, 0) : vectorscale((1, 1, 1), 0.75));
			function_af72dbc5(box_origin, var_b76d460e, var_d7c27d70, asmstatename.angles[1], var_7ce15329);
			recordline(asmstatename.origin + trace_z_offset, box_origin, var_7ce15329);
			if(isdefined(trace[#"entity"]))
			{
				/#
					if(is_true(level.var_bb61089c))
					{
						println(("" + "") + trace[#"entity"] getentitynumber() + "");
					}
				#/
			}
		}
	#/
	var_49bf47e8 = lengthsquared(velocity);
	var_875531fe = lengthsquared(asmstatename.var_4f5d39ac);
	if((var_49bf47e8 * 4) <= var_875531fe)
	{
		/#
			if(is_true(level.var_bb61089c))
			{
				println(("" + "") + sqrt(var_49bf47e8));
			}
		#/
		asmstatename.var_2bd7ca9d = 1;
		asmstatename thread flag::set_for_time(2.5, #"hash_5047ba8da693e1c5");
		return 4;
	}
	if(var_cb7d6f5)
	{
		/#
			if(is_true(level.var_bb61089c))
			{
				println(("" + "") + (isdefined(trace[#"normal"]) ? trace[#"normal"] : ""));
			}
		#/
		asmstatename.var_2bd7ca9d = 1;
		asmstatename thread flag::set_for_time(2.5, #"hash_5047ba8da693e1c5");
		asmstatename.var_d86b94b3 = {#normal:trace[#"normal"], #origin:trace[#"position"]};
		return 4;
	}
	if(!isdefined(var_53b2da60))
	{
		/#
			if(is_true(level.var_bb61089c))
			{
				println(("" + "") + var_9a4357f2);
			}
		#/
		return 4;
	}
	min_charge_time = int(1 * 1000);
	if(var_49bf47e8 < 25 && gettime() > (asmstatename.var_ccd1e8c + min_charge_time))
	{
		/#
			if(is_true(level.var_bb61089c))
			{
				println("" + "");
			}
		#/
		return 4;
	}
	if(!isdefined(asmstatename.var_f1888c9d))
	{
		asmstatename.var_f1888c9d = 0;
	}
	if(gettime() > asmstatename.var_f1888c9d)
	{
		var_6ff44b20 = 2;
		if(asmstatename flag::get(#"hash_1a23f4b19598f1b0"))
		{
			var_6ff44b20 = 0.2;
		}
		asmstatename.var_f1888c9d = gettime() + (int(var_6ff44b20 * 1000));
		players = getplayers();
		var_89cc0335 = function_72d3bca6(players, asmstatename.origin, undefined, 0, 1500);
		var_7bafb710 = [];
		var_1142e3f3 = 1;
		facing_vec = anglestoforward(asmstatename.angles);
		foreach(player in var_89cc0335)
		{
			if(isalive(player) && zombie_utility::is_player_valid(player, 1))
			{
				if(!function_5020432f(asmstatename, player.origin, facing_vec))
				{
					var_1142e3f3 = 0;
					break;
				}
			}
		}
		if(is_true(var_1142e3f3))
		{
			/#
				if(is_true(level.var_bb61089c))
				{
					println("" + "");
				}
			#/
			return 4;
		}
	}
	return 5;
}

/*
	Name: function_25b49d18
	Namespace: namespace_361e505d
	Checksum: 0xCD9E5E44
	Offset: 0x5830
	Size: 0x88
	Parameters: 2
	Flags: None
*/
function function_25b49d18(entity, asmstatename)
{
	/#
		asmstatename.var_a8785ea7 = 0;
	#/
	function_68ca0622(asmstatename, 0, 5000);
	function_68ca0622(asmstatename, 1, 5000);
	asmstatename flag::clear(#"hash_1a23f4b19598f1b0");
	return 4;
}

/*
	Name: function_a67b1c39
	Namespace: namespace_361e505d
	Checksum: 0x3DF1D72
	Offset: 0x58C0
	Size: 0x106
	Parameters: 1
	Flags: Private
*/
function private function_a67b1c39(entity)
{
	if(isdefined(entity.var_d86b94b3))
	{
		entity.var_d86b94b3.normal = (entity.var_d86b94b3.normal[0], 0, entity.var_d86b94b3.normal[2]);
		if(lengthsquared(entity.var_d86b94b3.normal) <= 0)
		{
			entity.var_d86b94b3.normal = anglestoforward(entity.angles) * -1;
		}
		playfx(#"hash_1d65341e8671f3d", entity.var_d86b94b3.origin, entity.var_d86b94b3.normal);
		entity.var_d86b94b3 = undefined;
	}
}

/*
	Name: function_983f6134
	Namespace: namespace_361e505d
	Checksum: 0xD8B54C1D
	Offset: 0x59D0
	Size: 0xDE
	Parameters: 1
	Flags: None
*/
function function_983f6134(entity)
{
	if(distancesquared(entity.var_2976f01f, entity.origin) > sqr(100))
	{
		return true;
	}
	if(!ispointonnavmesh(entity.origin, entity))
	{
		/#
			if(is_true(level.var_bb61089c))
			{
				println("" + "");
			}
		#/
		return true;
	}
	function_9de20709(entity, 0, 0);
	return false;
}

/*
	Name: function_d6971904
	Namespace: namespace_361e505d
	Checksum: 0x987AB81D
	Offset: 0x5AB8
	Size: 0x74
	Parameters: 5
	Flags: None
*/
function function_d6971904(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	mocompduration animmode("gravity", 1);
	mocompduration orientmode("face angle", mocompduration.angles[1]);
}

/*
	Name: function_6f6a2167
	Namespace: namespace_361e505d
	Checksum: 0xDD6C6621
	Offset: 0x5B38
	Size: 0x22
	Parameters: 1
	Flags: None
*/
function function_6f6a2167(entity)
{
	return is_true(entity.var_2bd7ca9d);
}

/*
	Name: function_dd80b921
	Namespace: namespace_361e505d
	Checksum: 0x8C4D6625
	Offset: 0x5B68
	Size: 0xE0
	Parameters: 1
	Flags: None
*/
function function_dd80b921(entity)
{
	alive_players = function_a1ef346b(undefined, entity.origin, 700);
	if(isdefined(alive_players) && alive_players.size > 0)
	{
		foreach(player in alive_players)
		{
			player function_bc82f900(#"hash_69900e93e16813de");
		}
	}
}

/*
	Name: function_fc02984a
	Namespace: namespace_361e505d
	Checksum: 0xAFF20D59
	Offset: 0x5C50
	Size: 0xDA
	Parameters: 1
	Flags: None
*/
function function_fc02984a(entity)
{
	enemy = undefined;
	if(isdefined(level.var_f67b08f5))
	{
		enemy = [[level.var_f67b08f5]](entity);
	}
	if(isdefined(enemy))
	{
		var_de27dc69 = vectortoyaw(enemy.origin - entity.origin);
		angle_diff = math::angle_dif(int(var_de27dc69), int(entity.angles[1]));
		if(angle_diff > 160)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_3e6c0b74
	Namespace: namespace_361e505d
	Checksum: 0x1A7C4F29
	Offset: 0x5D38
	Size: 0x74
	Parameters: 1
	Flags: Private
*/
function private function_3e6c0b74(entity)
{
	entity thread flag::set_for_time(1.5, #"hash_1f9ad625c3185bf4");
	if(entity flag::get(#"hash_5c35337a4e15867"))
	{
		function_9de20709(entity, 0, 0);
	}
}

/*
	Name: function_998c02dd
	Namespace: namespace_361e505d
	Checksum: 0x1BD888E9
	Offset: 0x5DB8
	Size: 0xA2
	Parameters: 2
	Flags: None
*/
function function_998c02dd(entity, asmstatename)
{
	animationstatenetworkutility::requeststate(entity, asmstatename);
	var_4d93e3bf = 1;
	var_ac6e874 = function_fc845eb6(entity);
	if(var_ac6e874 <= 1)
	{
		var_4d93e3bf = 0;
	}
	entity.var_aa722082 = gettime() + (int(var_4d93e3bf * 1000));
	return 5;
}

/*
	Name: function_39d052f1
	Namespace: namespace_361e505d
	Checksum: 0xC10E3C91
	Offset: 0x5E68
	Size: 0x40
	Parameters: 2
	Flags: None
*/
function function_39d052f1(entity, asmstatename)
{
	if(isdefined(asmstatename.var_aa722082) && gettime() < asmstatename.var_aa722082)
	{
		return 5;
	}
	return 4;
}

/*
	Name: function_33bbae5c
	Namespace: namespace_361e505d
	Checksum: 0xB13565C6
	Offset: 0x5EB0
	Size: 0x60
	Parameters: 2
	Flags: None
*/
function function_33bbae5c(entity, asmstatename)
{
	function_68ca0622(asmstatename, 0, 10000);
	function_68ca0622(asmstatename, 1, 10000);
	return 4;
}

/*
	Name: function_48400b3b
	Namespace: namespace_361e505d
	Checksum: 0x8937D2
	Offset: 0x5F18
	Size: 0x54
	Parameters: 1
	Flags: None
*/
function function_48400b3b(entity)
{
	if(!entity flag::get(#"hash_441651e111f0e04d"))
	{
		entity thread flag::set_for_time(5, #"hash_441651e111f0e04d");
	}
}

/*
	Name: function_2fe507a5
	Namespace: namespace_361e505d
	Checksum: 0x1C3996EF
	Offset: 0x5F78
	Size: 0x250
	Parameters: 3
	Flags: Private
*/
function private function_2fe507a5(entity, var_9a4357f2, radius)
{
	if(!isdefined(radius))
	{
		radius = 48;
	}
	if(!isdefined(entity.var_d2b407f6))
	{
		entity.var_d2b407f6 = gettime();
	}
	if(gettime() - entity.var_d2b407f6 < int(0.2 * 1000))
	{
		return;
	}
	a_zombies = getentitiesinradius(var_9a4357f2, radius, 15);
	a_filtered_zombies = array::filter(a_zombies, 0, &function_4a332962, entity);
	foreach(zombie in a_filtered_zombies)
	{
		zombie zombie_utility::setup_zombie_knockdown(entity.origin);
	}
	a_filtered_zombies = array::filter(a_zombies, 0, &function_13ba4731, entity);
	foreach(zombie in a_filtered_zombies)
	{
		zombie thread flag::set_for_time(2, #"hash_222ae70a0dc4273a");
		if(isdefined(level.var_81c6aa5b))
		{
			[[level.var_81c6aa5b]](entity, zombie);
		}
	}
}

/*
	Name: function_4a332962
	Namespace: namespace_361e505d
	Checksum: 0x528047D9
	Offset: 0x61D0
	Size: 0x160
	Parameters: 2
	Flags: Private
*/
function private function_4a332962(zombie, target)
{
	if(zombie.archetype !== #"zombie" || zombie.knockdown === 1 || gibserverutils::isgibbed(zombie, 384))
	{
		return false;
	}
	origin = target.origin;
	facing_vec = anglestoforward(target.angles);
	enemy_vec = zombie.origin - origin;
	enemy_yaw_vec = (enemy_vec[0], enemy_vec[1], 0);
	facing_yaw_vec = (facing_vec[0], facing_vec[1], 0);
	enemy_yaw_vec = vectornormalize(enemy_yaw_vec);
	facing_yaw_vec = vectornormalize(facing_yaw_vec);
	enemy_dot = vectordot(facing_yaw_vec, enemy_yaw_vec);
	if(enemy_dot < 0)
	{
		return false;
	}
	return true;
}

/*
	Name: function_13ba4731
	Namespace: namespace_361e505d
	Checksum: 0x567D62B
	Offset: 0x6338
	Size: 0x15E
	Parameters: 2
	Flags: Private
*/
function private function_13ba4731(zombie, target)
{
	if(zombie.archetype === #"zombie" || zombie flag::get(#"hash_222ae70a0dc4273a") === 1)
	{
		return false;
	}
	origin = target.origin;
	facing_vec = anglestoforward(target.angles);
	enemy_vec = zombie.origin - origin;
	enemy_yaw_vec = (enemy_vec[0], enemy_vec[1], 0);
	facing_yaw_vec = (facing_vec[0], facing_vec[1], 0);
	enemy_yaw_vec = vectornormalize(enemy_yaw_vec);
	facing_yaw_vec = vectornormalize(facing_yaw_vec);
	enemy_dot = vectordot(facing_yaw_vec, enemy_yaw_vec);
	if(enemy_dot < 0.5)
	{
		return false;
	}
	return true;
}

/*
	Name: function_849b329
	Namespace: namespace_361e505d
	Checksum: 0x8C96DCB
	Offset: 0x64A0
	Size: 0x288
	Parameters: 2
	Flags: Private
*/
function private function_849b329(entity, var_9a4357f2)
{
	players = getplayers();
	var_9ce867db = 1.6;
	var_89cc0335 = function_72d3bca6(players, var_9a4357f2, undefined, 0, 40 * var_9ce867db);
	if(isdefined(var_89cc0335) && var_89cc0335.size > 0)
	{
		var_9ce867db = var_9ce867db * 2;
		var_89cc0335 = function_72d3bca6(players, var_9a4357f2, undefined, 0, 40 * var_9ce867db);
	}
	/#
		if(getdvarint(#"hash_4e47873b8bfbca14", 0) > 0)
		{
			recordcircle(var_9a4357f2, 40 * var_9ce867db, vectorscale((1, 1, 1), 0.75));
		}
	#/
	var_26548e5f = 0;
	var_7bafb710 = [];
	foreach(player in var_89cc0335)
	{
		if(isalive(player))
		{
			if(!player flag::get(#"hash_5047ba8da693e1c5"))
			{
				player thread flag::set_for_time(2, #"hash_5047ba8da693e1c5");
				var_7bafb710[var_7bafb710.size] = player;
				/#
					if(is_true(level.var_bb61089c))
					{
						println(("" + "") + player getentitynumber() + "");
					}
				#/
				function_a768119c(entity, player, var_9a4357f2);
				continue;
			}
			var_26548e5f = 1;
		}
	}
	return var_26548e5f;
}

/*
	Name: function_a768119c
	Namespace: namespace_361e505d
	Checksum: 0xFD24B2DB
	Offset: 0x6730
	Size: 0x1F4
	Parameters: 3
	Flags: Private
*/
function private function_a768119c(entity, player, hit_point)
{
	if(!(isdefined(entity) && isdefined(player)))
	{
		return;
	}
	player playerknockback(1);
	var_3090e649 = vectornormalize(player.origin - hit_point);
	var_3090e649 = (var_3090e649[0], var_3090e649[1], 0.1);
	player applyknockback(int(200), var_3090e649);
	player playerknockback(0);
	player function_bc82f900(#"hash_157e567055fd73f7");
	damage = 75;
	damage_scalar = 1;
	if(isdefined(level.var_a2ed0864))
	{
		round_number = [[level.var_a2ed0864]]();
		if(round_number > 20)
		{
			damage_scalar = 1 + ((min(round_number, 40) - 20) / 40);
		}
	}
	damage = damage * damage_scalar;
	player dodamage(int(damage), hit_point, entity, entity, "torso_upper", "MOD_IMPACT");
	player notify(#"hash_45f594b911699a4b");
	player thread function_bda6d3d7(entity, player);
}

/*
	Name: function_bda6d3d7
	Namespace: namespace_361e505d
	Checksum: 0xA8C81147
	Offset: 0x6930
	Size: 0xDC
	Parameters: 2
	Flags: Private
*/
function private function_bda6d3d7(entity, player)
{
	player endon(#"death", #"hash_45f594b911699a4b");
	player clientfield::set_to_player("abomBullChargeHitPlayerCF", 1);
	wait_time = float(1000) / 1000;
	self shellshock(#"hash_5047ba8da693e1c5", wait_time);
	wait(wait_time);
	if(isdefined(player))
	{
		player clientfield::set_to_player("abomBullChargeHitPlayerCF", 0);
	}
}

/*
	Name: function_e75778ab
	Namespace: namespace_361e505d
	Checksum: 0x195781C4
	Offset: 0x6A18
	Size: 0x15A
	Parameters: 1
	Flags: None
*/
function function_e75778ab(entity)
{
	/#
		if(is_true(entity.var_c44e9122))
		{
			return true;
		}
	#/
	if(isdefined(level.var_87bca031))
	{
		var_b498174 = [[level.var_87bca031]](entity);
		if(!var_b498174)
		{
			return false;
		}
		enemy = undefined;
		if(isdefined(level.var_f67b08f5))
		{
			enemy = [[level.var_f67b08f5]](entity);
		}
		if(isdefined(enemy))
		{
			dist_2d_sq = distance2dsquared(enemy.origin, entity.origin);
			if(dist_2d_sq > sqr(100))
			{
				var_3396fda0 = bullettracepassed(entity getcentroid(), enemy getcentroid(), 0, entity);
				if(!var_3396fda0)
				{
					return false;
				}
			}
		}
		return true;
	}
	return false;
}

/*
	Name: function_fcb91a0d
	Namespace: namespace_361e505d
	Checksum: 0x4D449129
	Offset: 0x6B80
	Size: 0x22E
	Parameters: 1
	Flags: None
*/
function function_fcb91a0d(entity)
{
	/#
		if(is_true(entity.var_d7cf94a0))
		{
			return true;
		}
	#/
	if(isdefined(level.var_87bca031))
	{
		entity flag::set(#"hash_49b119b42f4610ea");
		can_melee = [[level.var_87bca031]](entity);
		entity flag::clear(#"hash_49b119b42f4610ea");
		if(is_false(can_melee))
		{
			return false;
		}
		enemy = undefined;
		if(isdefined(level.var_f67b08f5))
		{
			enemy = [[level.var_f67b08f5]](entity);
		}
		if(isdefined(enemy))
		{
			dist_2d_sq = distance2dsquared(enemy.origin, entity.origin);
			if(dist_2d_sq > sqr(100))
			{
				var_3396fda0 = bullettracepassed(entity getcentroid(), enemy getcentroid(), 0, entity);
				if(!var_3396fda0)
				{
					return false;
				}
			}
		}
	}
	enemy = undefined;
	if(isdefined(level.var_f67b08f5))
	{
		enemy = [[level.var_f67b08f5]](entity);
	}
	if(!isdefined(enemy) || !function_5020432f(entity, enemy.origin))
	{
		return false;
	}
	if(!function_b31e6110(entity, 3))
	{
		return false;
	}
	return true;
}

/*
	Name: function_b3bc50af
	Namespace: namespace_361e505d
	Checksum: 0x6555B0B9
	Offset: 0x6DB8
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function function_b3bc50af(entity)
{
	entity flag::set(#"hash_33e36dd4c60798b4");
}

/*
	Name: function_cbeafd0f
	Namespace: namespace_361e505d
	Checksum: 0x6C44A250
	Offset: 0x6DF0
	Size: 0x8C
	Parameters: 1
	Flags: None
*/
function function_cbeafd0f(entity)
{
	entity flag::clear(#"hash_33e36dd4c60798b4");
	entity flag::clear(#"hash_49b119b42f4610ea");
	function_9de20709(entity, 3, int(3 * 1000));
}

/*
	Name: function_9d242adf
	Namespace: namespace_361e505d
	Checksum: 0xCEC49A7D
	Offset: 0x6E88
	Size: 0x134
	Parameters: 1
	Flags: None
*/
function function_9d242adf(entity)
{
	var_b6949a60 = (isdefined(entity.var_dd3458a6) ? entity.var_dd3458a6 : 0);
	var_78138687 = (isdefined(self.var_d3c01fba) ? self.var_d3c01fba : 0);
	var_6e9c6b0d = (gettime() - var_b6949a60) < 3000;
	var_b5d3943d = (gettime() - var_78138687) < 3000;
	entity.var_dd3458a6 = gettime();
	if(var_6e9c6b0d && !var_b5d3943d)
	{
		entity flag::set(#"hash_547d56829c19d20f");
		function_261709aa(entity, 0, int(2 * 1000));
	}
	else
	{
		entity flag::clear(#"hash_547d56829c19d20f");
	}
}

/*
	Name: function_3a175c82
	Namespace: namespace_361e505d
	Checksum: 0xCF0961E0
	Offset: 0x6FC8
	Size: 0xA2
	Parameters: 1
	Flags: Private
*/
function private function_3a175c82(entity)
{
	var_c0519bcf = 850;
	var_b6949a60 = (isdefined(entity.var_dd3458a6) ? entity.var_dd3458a6 : 0);
	if(!entity flag::get(#"hash_547d56829c19d20f") && (gettime() - var_b6949a60) < 3000)
	{
		return var_c0519bcf;
	}
	return int(-1);
}

/*
	Name: function_a86617d
	Namespace: namespace_361e505d
	Checksum: 0x2AF1CB2B
	Offset: 0x7078
	Size: 0x97C
	Parameters: 0
	Flags: None
*/
function function_a86617d()
{
	melee_range = self.meleeweapon.aimeleerange;
	var_bff5eef3 = 50;
	var_9051190 = [];
	nearby_players = function_a1ef346b(undefined, self.origin, melee_range);
	var_60c8f87a = [];
	foreach(player in nearby_players)
	{
		if(isdefined(self.var_f6fd2062) && ![[self.var_f6fd2062]](player))
		{
			if(!is_true(player.var_b895a3ff))
			{
				continue;
			}
		}
		if(!isalive(player))
		{
			continue;
		}
		if(flag::get(#"hash_33e36dd4c60798b4"))
		{
			function_240a4635(player, var_bff5eef3, -180, -90, &var_9051190, 0);
			function_240a4635(player, var_bff5eef3, 90, 180, &var_9051190, 0);
			continue;
		}
		for(head_index = 0; head_index < 3; head_index++)
		{
			if(!function_17ae1df1(self, head_index) && head_index !== 1)
			{
				continue;
			}
			var_e3e6e7 = (22.5 * -1) + ((head_index - 1) * 45);
			var_333285c2 = 22.5 + ((head_index - 1) * 45);
			var_574fd932 = function_240a4635(player, var_bff5eef3, var_e3e6e7, var_333285c2, &var_9051190);
			if(var_574fd932)
			{
				if(!function_17ae1df1(self, head_index))
				{
					if(function_17ae1df1(self, 0))
					{
						if(!isdefined(var_60c8f87a))
						{
							var_60c8f87a = [];
						}
						else if(!isarray(var_60c8f87a))
						{
							var_60c8f87a = array(var_60c8f87a);
						}
						if(!isinarray(var_60c8f87a, 0))
						{
							var_60c8f87a[var_60c8f87a.size] = 0;
						}
					}
					if(function_17ae1df1(self, 2))
					{
						if(!isdefined(var_60c8f87a))
						{
							var_60c8f87a = [];
						}
						else if(!isarray(var_60c8f87a))
						{
							var_60c8f87a = array(var_60c8f87a);
						}
						if(!isinarray(var_60c8f87a, 2))
						{
							var_60c8f87a[var_60c8f87a.size] = 2;
						}
					}
					continue;
				}
				if(!isdefined(var_60c8f87a))
				{
					var_60c8f87a = [];
				}
				else if(!isarray(var_60c8f87a))
				{
					var_60c8f87a = array(var_60c8f87a);
				}
				if(!isinarray(var_60c8f87a, head_index))
				{
					var_60c8f87a[var_60c8f87a.size] = head_index;
				}
			}
		}
	}
	for(var_bb8837d1 = 0; var_bb8837d1 < var_60c8f87a.size; var_bb8837d1++)
	{
		var_e4ee29ae = var_60c8f87a[var_bb8837d1];
		playfxontag(#"hash_792489c5ae9dfe3c", self, self.var_ef651d05[var_e4ee29ae]);
	}
	var_1ff1751 = 1.2;
	var_15978c43 = getentitiesinradius(self.origin, melee_range * var_1ff1751, 12);
	foreach(vehicle in var_15978c43)
	{
		if(isinarray(var_9051190, vehicle))
		{
			continue;
		}
		if(flag::get(#"hash_33e36dd4c60798b4"))
		{
			function_640114ff(vehicle, var_bff5eef3, -180, -90, &var_9051190);
			function_640114ff(vehicle, var_bff5eef3, 90, 180, &var_9051190);
			continue;
		}
		for(head_index = 0; head_index < 3; head_index++)
		{
			if(!function_17ae1df1(self, head_index))
			{
				continue;
			}
			var_e3e6e7 = (22.5 * -1) + ((head_index - 1) * 45);
			var_333285c2 = 22.5 + ((head_index - 1) * 45);
			function_640114ff(vehicle, var_bff5eef3, var_e3e6e7, var_333285c2, &var_9051190);
		}
	}
	attackables = [];
	if(isdefined(level.attackables) && level.attackables.size > 0)
	{
		attackables = arraysortclosest(level.attackables, self.origin, undefined, undefined, melee_range);
	}
	foreach(attackable in attackables)
	{
		if(isinarray(var_9051190, attackable))
		{
			continue;
		}
		attackable dodamage(var_bff5eef3, self.origin, self, self, 0, "MOD_MELEE", 0, self.weapon);
	}
	/#
		if(getdvarint(#"hash_4e47873b8bfbca14", 0) > 0)
		{
			for(head_index = 2; head_index >= 0; head_index--)
			{
				if(!function_17ae1df1(self, head_index))
				{
					continue;
				}
				var_e3e6e7 = (22.5 * -1) + ((head_index - 1) * 45);
				var_333285c2 = 22.5 + ((head_index - 1) * 45);
				recordcircle(self.origin, melee_range, (1, 0, 0));
				recordline(self.origin, self.origin + ((anglestoforward((0, self.angles[1] + var_e3e6e7, 0))) * melee_range), (1, 0.5, 0));
				recordline(self.origin, self.origin + ((anglestoforward((0, self.angles[1] + var_333285c2, 0))) * melee_range), (1, 0.5, 0));
				recordline(self.origin + ((anglestoforward((0, self.angles[1] + var_e3e6e7, 0))) * melee_range), self.origin + ((anglestoforward((0, self.angles[1] + var_333285c2, 0))) * melee_range), (1, 0.5, 0));
			}
		}
	#/
}

/*
	Name: function_240a4635
	Namespace: namespace_361e505d
	Checksum: 0xFC0E8E74
	Offset: 0x7A00
	Size: 0x200
	Parameters: 6
	Flags: Private
*/
function private function_240a4635(player, var_bff5eef3, var_e3e6e7, var_333285c2, var_9051190, b_play_fx)
{
	var_17c6835 = 0;
	var_592c1baa = angleclamp180(self.angles[1] - (vectortoangles(var_bff5eef3.origin - self.origin)[1]));
	if(var_592c1baa >= var_333285c2 && var_592c1baa <= var_9051190)
	{
		if(var_bff5eef3 isinvehicle())
		{
			vehicle = var_bff5eef3 getvehicleoccupied();
			if(!isinarray(b_play_fx, vehicle))
			{
				if(isdefined(level.var_34a02ce7))
				{
					[[level.var_34a02ce7]](vehicle, self.var_a0193213);
				}
				if(!isdefined(b_play_fx))
				{
					b_play_fx = [];
				}
				else if(!isarray(b_play_fx))
				{
					b_play_fx = array(b_play_fx);
				}
				b_play_fx[b_play_fx.size] = vehicle;
			}
			if(!is_true(vehicle.var_9a6644f2))
			{
				var_17c6835 = 1;
			}
		}
		else
		{
			var_17c6835 = 1;
		}
	}
	if(var_17c6835)
	{
		var_bff5eef3 dodamage(var_e3e6e7, self.origin, self, self, 0, "MOD_MELEE", 0, self.weapon);
		var_bff5eef3 clientfield::increment("abomBiteHitPlayerCF", 1);
	}
	return var_17c6835;
}

/*
	Name: function_640114ff
	Namespace: namespace_361e505d
	Checksum: 0xDD5DB8B9
	Offset: 0x7C08
	Size: 0x10A
	Parameters: 5
	Flags: Private
*/
function private function_640114ff(vehicle, var_bff5eef3, var_e3e6e7, var_333285c2, var_9051190)
{
	var_348afc81 = angleclamp180(self.angles[1] - (vectortoangles(var_bff5eef3.origin - self.origin)[1]));
	if(var_348afc81 >= var_e3e6e7 && var_348afc81 <= var_333285c2)
	{
		if(isdefined(level.var_34a02ce7))
		{
			[[level.var_34a02ce7]](var_bff5eef3, self.var_a0193213);
		}
		if(!isdefined(var_9051190))
		{
			var_9051190 = [];
		}
		else if(!isarray(var_9051190))
		{
			var_9051190 = array(var_9051190);
		}
		var_9051190[var_9051190.size] = var_bff5eef3;
	}
}

/*
	Name: function_3160120e
	Namespace: namespace_361e505d
	Checksum: 0x6793BC10
	Offset: 0x7D20
	Size: 0xF4
	Parameters: 1
	Flags: None
*/
function function_3160120e(entity)
{
	/#
		if(is_true(entity.var_f5ffa31e))
		{
			return true;
		}
	#/
	if(!function_b31e6110(entity, 2))
	{
		return false;
	}
	if(!entity flag::get(#"hash_441651e111f0e04d"))
	{
		return false;
	}
	move_speed = entity getblackboardattribute("_locomotion_speed");
	if(move_speed === "locomotion_speed_sprint")
	{
		var_d40fc7e0 = entity function_be51bf77();
		if(var_d40fc7e0 > 15 && var_d40fc7e0 < 345)
		{
			return false;
		}
	}
	return true;
}

/*
	Name: function_3a6d62a1
	Namespace: namespace_361e505d
	Checksum: 0x70A5F290
	Offset: 0x7E20
	Size: 0x454
	Parameters: 1
	Flags: None
*/
function function_3a6d62a1(entity)
{
	var_ac6e874 = function_fc845eb6(entity);
	var_c6c7ab63 = 3 - var_ac6e874;
	if(var_ac6e874 <= 0)
	{
		return;
	}
	if(!isdefined(entity.var_5c8fc94e))
	{
		entity.var_5c8fc94e = -1;
	}
	var_e8bbc3b4 = entity.var_5c8fc94e >= 0;
	if(var_e8bbc3b4)
	{
		if(!isdefined(entity.var_2d502a2b))
		{
			entity.var_2d502a2b = 0;
		}
		var_511099f7 = gettime() - entity.var_2d502a2b;
		var_eeb76b76 = [2:4, 1:5, 0:3];
		var_c1607f0f = int(var_eeb76b76[var_c6c7ab63] * 1000);
		if(var_511099f7 > var_c1607f0f)
		{
			function_14605606(entity);
			var_21b140fe = [2:8, 1:1, 0:1];
			var_8d0f7b0c = int(var_21b140fe[var_c6c7ab63] * 1000);
			if(entity flag::get(#"hash_204aaf6e250ebdbc"))
			{
				var_8d0f7b0c = var_8d0f7b0c * 0.5;
			}
			/#
				if(is_true(level.var_bb61089c))
				{
					println((("" + "") + (float(var_c1607f0f) / 1000) + "") + (float(var_8d0f7b0c) / 1000));
				}
			#/
			function_9de20709(entity, 4, var_8d0f7b0c);
		}
	}
	else if(function_b31e6110(entity, 4) && entity flag::get(#"hash_42f4206825b6195"))
	{
		var_6a230f24 = [];
		if(function_17ae1df1(entity, 0))
		{
			if(!isdefined(var_6a230f24))
			{
				var_6a230f24 = [];
			}
			else if(!isarray(var_6a230f24))
			{
				var_6a230f24 = array(var_6a230f24);
			}
			var_6a230f24[var_6a230f24.size] = 0;
		}
		if(function_17ae1df1(entity, 1))
		{
			if(!isdefined(var_6a230f24))
			{
				var_6a230f24 = [];
			}
			else if(!isarray(var_6a230f24))
			{
				var_6a230f24 = array(var_6a230f24);
			}
			var_6a230f24[var_6a230f24.size] = 1;
		}
		if(function_17ae1df1(entity, 2))
		{
			if(!isdefined(var_6a230f24))
			{
				var_6a230f24 = [];
			}
			else if(!isarray(var_6a230f24))
			{
				var_6a230f24 = array(var_6a230f24);
			}
			var_6a230f24[var_6a230f24.size] = 2;
		}
		if(var_6a230f24.size > 0)
		{
			var_d5f97318 = randomint(var_6a230f24.size);
			function_6bafca91(entity, var_6a230f24[var_d5f97318]);
		}
	}
}

/*
	Name: function_14605606
	Namespace: namespace_361e505d
	Checksum: 0xA9ED8B37
	Offset: 0x8280
	Size: 0xC2
	Parameters: 1
	Flags: Private
*/
function private function_14605606(entity)
{
	head_index = (isdefined(entity.var_5c8fc94e) ? entity.var_5c8fc94e : -1);
	if(head_index >= 0)
	{
		function_2c3c388d(entity, head_index);
		/#
			if(is_true(level.var_bb61089c))
			{
				println((("" + "") + head_index) + "");
			}
		#/
	}
	entity.var_5c8fc94e = -1;
}

/*
	Name: function_6bafca91
	Namespace: namespace_361e505d
	Checksum: 0x950CE60C
	Offset: 0x8350
	Size: 0x10C
	Parameters: 2
	Flags: Private
*/
function private function_6bafca91(entity, head_index)
{
	if(!function_17ae1df1(entity, head_index))
	{
		/#
			if(is_true(level.var_bb61089c))
			{
				println(("" + "") + head_index);
			}
		#/
		return;
	}
	entity.var_5c8fc94e = head_index;
	entity.var_2d502a2b = gettime();
	if(head_index >= 0)
	{
		function_efb1766(entity, head_index);
		/#
			if(is_true(level.var_bb61089c))
			{
				println((("" + "") + head_index) + "");
			}
		#/
	}
}

/*
	Name: function_c0e34ca8
	Namespace: namespace_361e505d
	Checksum: 0xE4305577
	Offset: 0x8468
	Size: 0x110
	Parameters: 2
	Flags: None
*/
function function_c0e34ca8(entity, asmstatename)
{
	animationstatenetworkutility::requeststate(entity, asmstatename);
	var_a1346113 = 2000;
	var_ac6e874 = function_fc845eb6(entity);
	var_a1346113 = var_a1346113 * (1 + (var_ac6e874 / 6));
	if(flag::get(#"hash_1c464f9df131fb78"))
	{
		var_a1346113 = 1500;
	}
	entity.var_f58807b8 = gettime() + var_a1346113;
	entity clientfield::set("abomRoarCF", 1);
	function_2fe507a5(entity, entity.origin, 200);
	function_e119344f(entity);
	return 5;
}

/*
	Name: function_640570ec
	Namespace: namespace_361e505d
	Checksum: 0x79707D19
	Offset: 0x8580
	Size: 0x2C
	Parameters: 2
	Flags: None
*/
function function_640570ec(behaviortreeentity, asmstatename)
{
	if(gettime() < asmstatename.var_f58807b8)
	{
		return 5;
	}
	return 4;
}

/*
	Name: function_bcf8dd2a
	Namespace: namespace_361e505d
	Checksum: 0x60878F36
	Offset: 0x85B8
	Size: 0x188
	Parameters: 2
	Flags: None
*/
function function_bcf8dd2a(entity, asmstatename)
{
	function_48f2cd39(asmstatename);
	enemy = undefined;
	if(isdefined(level.var_f67b08f5))
	{
		enemy = [[level.var_f67b08f5]](asmstatename);
	}
	if(isdefined(enemy))
	{
		var_7befcf25 = distancesquared(asmstatename.origin, enemy.origin);
		if(var_7befcf25 < sqr(600))
		{
			function_68ca0622(asmstatename, 0, int(10 * 1000));
		}
		else
		{
			function_ef9e3f0(asmstatename, 0, 0);
		}
	}
	function_9de20709(asmstatename, 2, int(10 * 1000));
	asmstatename clientfield::set("abomRoarCF", 0);
	return 4;
}

/*
	Name: function_edcb107c
	Namespace: namespace_361e505d
	Checksum: 0x6F6BD7F8
	Offset: 0x8748
	Size: 0x24
	Parameters: 1
	Flags: Private
*/
function private function_edcb107c(entity)
{
	function_e119344f(entity);
}

/*
	Name: function_6791808c
	Namespace: namespace_361e505d
	Checksum: 0xB48DDF86
	Offset: 0x8778
	Size: 0x24
	Parameters: 1
	Flags: Private
*/
function private function_6791808c(entity)
{
	function_48f2cd39(entity);
}

/*
	Name: function_e119344f
	Namespace: namespace_361e505d
	Checksum: 0x5344A6A8
	Offset: 0x87A8
	Size: 0x8C
	Parameters: 1
	Flags: None
*/
function function_e119344f(entity)
{
	if(entity flag::get(#"hash_762cffc9e7a61f9c"))
	{
		return;
	}
	entity flag::set(#"hash_762cffc9e7a61f9c");
	for(head_index = 0; head_index < 3; head_index++)
	{
		function_efb1766(entity, head_index);
	}
}

/*
	Name: function_efb1766
	Namespace: namespace_361e505d
	Checksum: 0x958AFDD4
	Offset: 0x8840
	Size: 0x1BC
	Parameters: 2
	Flags: None
*/
function function_efb1766(entity, head_index)
{
	if(is_true(entity.var_dc06e6af[head_index]))
	{
		return;
	}
	var_84ed9a13 = entity.var_5ace757d[head_index];
	if(var_84ed9a13.currstate !== 1)
	{
		return;
	}
	if(!isdefined(var_84ed9a13.var_8b732142))
	{
		return;
	}
	if(!function_17ae1df1(entity, head_index))
	{
		return;
	}
	if(!isdefined(var_84ed9a13.var_b7fbe51b))
	{
		/#
			if(is_true(level.var_bb61089c))
			{
				println("" + "");
			}
		#/
		var_84ed9a13.var_b7fbe51b = 0;
	}
	var_84ed9a13.var_2c5a8a86 = var_84ed9a13.var_b7fbe51b;
	var_84ed9a13.var_b7fbe51b = 20;
	entity.var_dc06e6af[head_index] = 1;
	if(head_index < 3)
	{
		entity clientfield::set(entity.var_ac8b8c0f[head_index], 1);
	}
	/#
		if(is_true(level.var_bb61089c))
		{
			println(((("" + "") + head_index) + "") + var_84ed9a13.var_b7fbe51b);
		}
	#/
}

/*
	Name: function_48f2cd39
	Namespace: namespace_361e505d
	Checksum: 0xC4E72B54
	Offset: 0x8A08
	Size: 0x8C
	Parameters: 1
	Flags: None
*/
function function_48f2cd39(entity)
{
	if(!entity flag::get(#"hash_762cffc9e7a61f9c"))
	{
		return;
	}
	entity flag::clear(#"hash_762cffc9e7a61f9c");
	for(head_index = 0; head_index < 3; head_index++)
	{
		function_2c3c388d(entity, head_index);
	}
}

/*
	Name: function_2c3c388d
	Namespace: namespace_361e505d
	Checksum: 0xABFC6BB8
	Offset: 0x8AA0
	Size: 0x1F4
	Parameters: 2
	Flags: None
*/
function function_2c3c388d(entity, head_index)
{
	if(is_false(entity.var_dc06e6af[head_index]))
	{
		return;
	}
	var_84ed9a13 = entity.var_5ace757d[head_index];
	if(var_84ed9a13.currstate !== 1)
	{
		return;
	}
	if(!isdefined(var_84ed9a13.var_8b732142))
	{
		return;
	}
	if(!isdefined(var_84ed9a13.var_b7fbe51b))
	{
		/#
			if(is_true(level.var_bb61089c))
			{
				println("" + "");
			}
		#/
		var_84ed9a13.var_b7fbe51b = 0;
	}
	var_6ee1527f = var_84ed9a13.var_2c5a8a86;
	if(!isdefined(var_84ed9a13.var_2c5a8a86))
	{
		/#
			if(is_true(level.var_bb61089c))
			{
				println("" + "");
			}
		#/
		return;
	}
	var_84ed9a13.var_b7fbe51b = var_84ed9a13.var_2c5a8a86;
	entity.var_dc06e6af[head_index] = 0;
	if(head_index < 3)
	{
		entity clientfield::set(entity.var_ac8b8c0f[head_index], 0);
	}
	/#
		if(is_true(level.var_bb61089c))
		{
			println(((("" + "") + head_index) + "") + var_84ed9a13.var_b7fbe51b);
		}
	#/
}

/*
	Name: function_1c713d40
	Namespace: namespace_361e505d
	Checksum: 0x72B9C4AD
	Offset: 0x8CA0
	Size: 0xA2
	Parameters: 2
	Flags: None
*/
function function_1c713d40(entity, head_index)
{
	if(!isdefined(head_index))
	{
		head_index = undefined;
	}
	if(!isdefined(head_index))
	{
		return function_1c713d40(entity, 0) || function_1c713d40(entity, 1) || function_1c713d40(entity, 2);
	}
	return is_true(entity.var_dc06e6af[head_index]);
}

/*
	Name: function_4be4b4a6
	Namespace: namespace_361e505d
	Checksum: 0x8A7285AA
	Offset: 0x8D50
	Size: 0x2A
	Parameters: 1
	Flags: None
*/
function function_4be4b4a6(entity)
{
	return entity flag::get(#"hash_762cffc9e7a61f9c");
}

/*
	Name: function_e7cfd92
	Namespace: namespace_361e505d
	Checksum: 0xCD5C5DEA
	Offset: 0x8D88
	Size: 0x274
	Parameters: 1
	Flags: Private
*/
function private function_e7cfd92(entity)
{
	if(function_e75778ab(entity) || function_3160120e(entity))
	{
		return;
	}
	if(!isdefined(entity.var_ee2440ac))
	{
		return;
	}
	if(is_true(entity.var_e76a75b4))
	{
		forward_vec = anglestoforward(entity gettagangles("j_head"));
		forward_vec = (forward_vec[0], forward_vec[1], 0);
		entity.var_ee2440ac dontinterpolate();
		entity.var_ee2440ac.origin = entity gettagorigin("j_head") + (forward_vec * 1000);
		if(!entity flag::get(#"hash_67c62575285677e4"))
		{
			entity flag::set(#"hash_5a61b819c92c0059");
			/#
				if(is_true(level.var_bb61089c))
				{
					println("" + "");
				}
			#/
			entity thread function_4ac5ff55(entity);
		}
	}
	else if(entity flag::get(#"hash_5a61b819c92c0059"))
	{
		if(flag::get(#"hash_67c62575285677e4"))
		{
			entity flag::clear(#"hash_5a61b819c92c0059");
			/#
				if(is_true(level.var_bb61089c))
				{
					println("" + "");
				}
			#/
			entity thread function_8a959784(entity);
		}
	}
}

/*
	Name: function_4ac5ff55
	Namespace: namespace_361e505d
	Checksum: 0x4A0D0AFD
	Offset: 0x9008
	Size: 0x10C
	Parameters: 1
	Flags: None
*/
function function_4ac5ff55(entity)
{
	entity endon(#"death");
	entity.var_ee2440ac clientfield::set("abomLaunchBeamCF", 1);
	for(head_index = 0; head_index < 3; head_index++)
	{
		function_57773958(entity, head_index);
		[[ level.var_5ef577c5 ]]->waitinqueue(entity);
		entity playsound(#"hash_38c5886415893c76");
		entity playloopsound(#"hash_522f564c50daffff");
	}
	if(entity flag::get(#"hash_67c62575285677e4"))
	{
		entity thread function_e1a54e93(entity);
	}
}

/*
	Name: function_57773958
	Namespace: namespace_361e505d
	Checksum: 0x27C43ABA
	Offset: 0x9120
	Size: 0xBC
	Parameters: 2
	Flags: Private
*/
function private function_57773958(entity, head_index)
{
	if(function_17ae1df1(entity, head_index))
	{
		entity.var_42bc30c[head_index] = 1;
		/#
			if(is_true(level.var_bb61089c))
			{
				println((("" + "") + entity getentitynumber() + "") + head_index);
			}
		#/
		function_29abbe4c(entity);
	}
}

/*
	Name: function_8a959784
	Namespace: namespace_361e505d
	Checksum: 0x4E1BC1C3
	Offset: 0x91E8
	Size: 0x9A
	Parameters: 1
	Flags: None
*/
function function_8a959784(entity)
{
	entity stoploopsound(0.2);
	if(isdefined(entity.var_ee2440ac))
	{
		entity.var_ee2440ac clientfield::set("abomLaunchBeamCF", 0);
	}
	for(head_index = 0; head_index < 3; head_index++)
	{
		function_8d085377(entity, head_index);
		waitframe(1);
	}
}

/*
	Name: function_8d085377
	Namespace: namespace_361e505d
	Checksum: 0x692EC54F
	Offset: 0x9290
	Size: 0x18C
	Parameters: 2
	Flags: Private
*/
function private function_8d085377(entity, head_index)
{
	/#
		if(is_true(level.var_bb61089c))
		{
			println(((((("" + "") + entity getentitynumber() + "") + head_index) + "") + function_17ae1df1(entity, head_index) + "") + is_true(entity.var_42bc30c[head_index]));
		}
	#/
	if(function_17ae1df1(entity, head_index) && is_true(entity.var_42bc30c[head_index]))
	{
		entity.var_42bc30c[head_index] = 0;
		/#
			if(is_true(level.var_bb61089c))
			{
				println((("" + "") + entity getentitynumber() + "") + head_index);
			}
		#/
		function_29abbe4c(entity);
	}
}

/*
	Name: function_29abbe4c
	Namespace: namespace_361e505d
	Checksum: 0xEBDC4CB5
	Offset: 0x9428
	Size: 0x14C
	Parameters: 1
	Flags: Private
*/
function private function_29abbe4c(entity)
{
	var_c81f5b16 = 1;
	foreach(var_2e255462 in entity.var_42bc30c)
	{
		if(is_true(var_2e255462))
		{
			var_c81f5b16 = 0;
		}
	}
	/#
		if(!var_c81f5b16 !== flag::get(#"hash_67c62575285677e4"))
		{
			/#
				if(is_true(level.var_bb61089c))
				{
					println(("" + "") + !var_c81f5b16);
				}
			#/
		}
	#/
	flag::set_val(#"hash_67c62575285677e4", !var_c81f5b16);
}

/*
	Name: function_e1a54e93
	Namespace: namespace_361e505d
	Checksum: 0xC513C157
	Offset: 0x9580
	Size: 0x99C
	Parameters: 1
	Flags: Private
*/
function private function_e1a54e93(entity)
{
	entity endon(#"death");
	while(true)
	{
		if(!flag::get(#"hash_67c62575285677e4"))
		{
			/#
				if(is_true(level.var_bb61089c))
				{
					println("" + "");
				}
			#/
			return;
		}
		var_bff560a3 = 1;
		for(head_index = 0; head_index < 3; head_index++)
		{
			if(function_17ae1df1(entity, head_index))
			{
				var_bff560a3 = 0;
				start_pos = entity gettagorigin(entity.var_7baf0b4d[head_index]);
				end_pos = entity.var_ee2440ac gettagorigin("tag_origin");
				trace = beamtrace(start_pos, end_pos, 1, entity);
				hit_ent = undefined;
				if(isdefined(trace))
				{
					hit_ent = trace[#"entity"];
				}
				if(!isdefined(hit_ent) && isdefined(trace[#"position"]) && is_true(self.var_1fa24724))
				{
					var_89cc0335 = getplayers(undefined, trace[#"position"], 150);
					if(isdefined(var_89cc0335[0]))
					{
						hit_ent = var_89cc0335[0];
					}
				}
				if(isdefined(hit_ent))
				{
					if(isplayer(hit_ent))
					{
						var_b5caed86 = 0;
						var_b7968902 = hit_ent getgroundent();
						if(!isdefined(var_b7968902))
						{
							player_eye_pos = hit_ent geteye();
							var_adedf780 = 15;
							if(abs(trace[#"position"][2] - player_eye_pos[2]) > var_adedf780)
							{
								var_b5caed86 = 1;
								/#
									if(is_true(level.var_bb61089c))
									{
										println(("" + "") + (abs(trace[#"position"][2] - player_eye_pos[2])));
									}
								#/
							}
						}
						if(!var_b5caed86)
						{
							/#
								if(is_true(level.var_bb61089c))
								{
									println(("" + "") + hit_ent getentitynumber());
								}
							#/
							entity.var_54529e1e = gettime();
							var_8104fad = 8;
							if(!isdefined(hit_ent.var_e12bf6a3) || gettime() > (hit_ent.var_e12bf6a3 + (int(3 * 1000))))
							{
								var_8104fad = 15;
							}
							damage_scalar = 1;
							if(isdefined(level.var_a2ed0864))
							{
								round_number = [[level.var_a2ed0864]]();
								if(round_number > 20)
								{
									damage_scalar = 1 + ((min(round_number, 40) - 20) / 40);
								}
							}
							if(isdefined(hit_ent.health) && isdefined(hit_ent.maxhealth))
							{
								if(hit_ent.health < hit_ent.maxhealth * 0.5)
								{
									damage_scalar = damage_scalar * (hit_ent.health / hit_ent.maxhealth);
								}
							}
							var_8104fad = var_8104fad * damage_scalar;
							var_8104fad = max(var_8104fad, 3);
							hit_ent dodamage(var_8104fad, trace[#"position"], entity, entity, undefined, "MOD_ELECTROCUTED");
							hit_ent.var_e12bf6a3 = gettime();
						}
					}
					else
					{
						if(hit_ent.var_6f84b820 === #"normal")
						{
							hit_ent.allowdeath = 1;
							hit_ent kill();
							if(hit_ent function_ac1ff86e())
							{
								hit_ent clientfield::set("abomBeamDissolveCF", 1);
								hit_ent thread function_5a2447b1(1.2);
							}
							var_ab2fdbbc = gettime() + (int(2 * 1000));
							entity.var_16109727 = max(var_ab2fdbbc, entity.var_16109727);
						}
						else if(hit_ent.var_6f84b820 === #"elite" || hit_ent.var_6f84b820 === #"special")
						{
							hit_ent ai::stun(1);
						}
					}
				}
				if(isdefined(trace[#"position"]))
				{
					target_pos = trace[#"position"];
					var_7ee5d97a = 85;
					height_check = (abs(target_pos[2] - start_pos[2])) + var_7ee5d97a;
					var_577fefe8 = distance(start_pos, target_pos) * 1.5;
					var_e86a4d9 = function_c3d68575(start_pos, (var_577fefe8, var_577fefe8, height_check));
					var_21bdf069 = sqr(var_577fefe8);
					foreach(dynent in var_e86a4d9)
					{
						closest_point = math::closest_point_on_line(dynent.origin, start_pos, target_pos);
						if(distancesquared(dynent.origin, closest_point) > sqr(var_7ee5d97a))
						{
							continue;
						}
						dynent notify(#"hash_642d0d9004ae3789");
						if(isdefined(level.var_6d2016b8) && ![[level.var_6d2016b8]](dynent, 1))
						{
							continue;
						}
						should_break = 0;
						if(isdefined(level.var_9fbe660b))
						{
							should_break = [[level.var_9fbe660b]](dynent);
						}
						if(should_break && dynent.health > 0)
						{
							dynent dodamage(dynent.health, start_pos, self, self, undefined, "MOD_ELECTROCUTED");
						}
					}
				}
			}
		}
		if(var_bff560a3)
		{
			/#
				if(is_true(level.var_bb61089c))
				{
					println("" + "");
				}
			#/
			return;
		}
		var_e9f9d662 = 0.2;
		wait(var_e9f9d662);
	}
}

/*
	Name: function_5a2447b1
	Namespace: namespace_361e505d
	Checksum: 0xED3A19F3
	Offset: 0x9F28
	Size: 0x94
	Parameters: 1
	Flags: None
*/
function function_5a2447b1(time)
{
	result = undefined;
	result = self waittilltimeout(time, #"actor_corpse", #"death");
	waittillframeend();
	if(isdefined(result.corpse))
	{
		result.corpse deletedelay();
	}
	else if(isdefined(self))
	{
		self deletedelay();
	}
}

/*
	Name: function_ac1ff86e
	Namespace: namespace_361e505d
	Checksum: 0x1654D9CD
	Offset: 0x9FC8
	Size: 0xB8
	Parameters: 0
	Flags: None
*/
function function_ac1ff86e()
{
	if(!isdefined(level.var_1a4cc228[self.aitype]))
	{
		return false;
	}
	self function_f9b43587();
	entitynum = self getentitynumber();
	a_characters = level.var_1a4cc228[self.aitype];
	self setmodel(a_characters[entitynum % a_characters.size]);
	if(isdefined(self.gib_state))
	{
		gibserverutils::function_96bedd91(self);
	}
	return true;
}

/*
	Name: function_18fd18de
	Namespace: namespace_361e505d
	Checksum: 0x962CB9BC
	Offset: 0xA088
	Size: 0x104
	Parameters: 1
	Flags: Private
*/
function private function_18fd18de(entity)
{
	entity endon(#"death");
	if(isdefined(entity.var_ee2440ac))
	{
		return;
	}
	ent = util::spawn_model("tag_origin", entity.origin, (0, 0, 0), undefined, 1);
	ent linkto(entity);
	entity.var_ee2440ac = ent;
	util::wait_network_frame(1);
	if(isdefined(ent))
	{
		ent clientfield::set("abomRegisterBeamTargetCF", 1);
	}
	util::wait_network_frame(1);
	if(isdefined(ent))
	{
		ent unlink();
	}
}

/*
	Name: function_acb229fd
	Namespace: namespace_361e505d
	Checksum: 0xE038987F
	Offset: 0xA198
	Size: 0x2D6
	Parameters: 1
	Flags: None
*/
function function_acb229fd(entity)
{
	/#
		if(is_true(entity.var_308a238a))
		{
			return true;
		}
		if(getdvarint(#"hash_1d29ba18cfbb1bbb", 0) > 0)
		{
			return false;
		}
	#/
	var_e792a112 = function_fc845eb6(entity);
	if(var_e792a112 === 0)
	{
		return false;
	}
	if(entity flag::get(#"turning"))
	{
		return false;
	}
	enemy = undefined;
	if(isdefined(level.var_f67b08f5))
	{
		enemy = [[level.var_f67b08f5]](entity);
	}
	if(!isdefined(enemy) || (isplayer(enemy) && !zombie_utility::is_player_valid(enemy, 1)))
	{
		return false;
	}
	if(!entity cansee(enemy))
	{
		return false;
	}
	dist_sq = distancesquared(entity.origin, enemy.origin);
	if(dist_sq > sqr(800) || (dist_sq < sqr(300) && !is_true(entity.var_1fa24724)))
	{
		return false;
	}
	if(dist_sq > sqr(600))
	{
		function_4d4efd70(entity, 1, int(5 * 1000));
	}
	if(!function_b31e6110(entity, 1))
	{
		return false;
	}
	trace_z_offset = vectorscale((0, 0, 1), 50);
	var_3396fda0 = bullettracepassed(entity.origin + trace_z_offset, enemy.origin + trace_z_offset, 0, enemy, entity);
	if(!var_3396fda0)
	{
		return false;
	}
	return true;
}

/*
	Name: function_fe8e1e36
	Namespace: namespace_361e505d
	Checksum: 0x51CA2EFA
	Offset: 0xA478
	Size: 0x62
	Parameters: 1
	Flags: None
*/
function function_fe8e1e36(entity)
{
	variant = function_fc845eb6(entity) - 1;
	if(function_1f33b20c(entity))
	{
		variant = 0;
	}
	entity.variant_type = variant;
}

/*
	Name: function_150b8b34
	Namespace: namespace_361e505d
	Checksum: 0x52394DF1
	Offset: 0xA4E8
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function function_150b8b34(entity)
{
	if(entity.variant_type === 0)
	{
		entity function_d7033ff(6);
	}
}

/*
	Name: function_6b70d881
	Namespace: namespace_361e505d
	Checksum: 0x7D552D69
	Offset: 0xA530
	Size: 0x34
	Parameters: 1
	Flags: None
*/
function function_6b70d881(entity)
{
	entity function_d7033ff(function_2fee0cc6(entity));
}

/*
	Name: function_59685ed1
	Namespace: namespace_361e505d
	Checksum: 0x2A7EA8A7
	Offset: 0xA570
	Size: 0x2EE
	Parameters: 2
	Flags: None
*/
function function_59685ed1(entity, asmstatename)
{
	animationstatenetworkutility::requeststate(entity, asmstatename);
	var_e792a112 = function_fc845eb6(entity);
	if(var_e792a112 === 0)
	{
		return 5;
	}
	var_72e6d5f = entity.var_a8bb18af[var_e792a112 - 1];
	/#
		assert(isdefined(var_72e6d5f), "");
	#/
	entity.var_16109727 = gettime() + (int(var_72e6d5f * 1000));
	entity.var_526dce0b = gettime();
	/#
		if(is_true(entity.var_308a238a))
		{
			var_c066b9a6 = getdvarfloat(#"hash_69e707c32ac2d165", -1);
			if(var_c066b9a6 > 0)
			{
				entity.var_16109727 = gettime() + (int(var_72e6d5f * 1000));
			}
		}
	#/
	/#
		/#
			assert(!entity flag::get(#"hash_67c62575285677e4"), "");
		#/
	#/
	if(!entity flag::get(#"hash_67c62575285677e4"))
	{
		/#
			if(is_true(level.var_bb61089c))
			{
				println("" + "");
			}
		#/
		forward_vec = anglestoforward(entity gettagangles("j_head"));
		forward_vec = (forward_vec[0], forward_vec[1], 0);
		entity.var_ee2440ac dontinterpolate();
		entity.var_ee2440ac.origin = entity gettagorigin("j_head") + (forward_vec * 900);
		entity.var_ac71e4ab = (0, 0, 0);
		entity thread function_4ac5ff55(entity);
	}
	entity.var_76ae69b0 = 0;
	entity.var_67839366 = 0;
	return 5;
}

/*
	Name: function_58607a4e
	Namespace: namespace_361e505d
	Checksum: 0x12ED4C97
	Offset: 0xA868
	Size: 0x7CC
	Parameters: 2
	Flags: None
*/
function function_58607a4e(behaviortreeentity, asmstatename)
{
	enemy = undefined;
	if(isdefined(level.var_f67b08f5))
	{
		enemy = [[level.var_f67b08f5]](asmstatename);
	}
	var_df839f8e = asmstatename gettagangles("j_head");
	var_df839f8e = (0, var_df839f8e[1], var_df839f8e[2]);
	to_enemy_angles = var_df839f8e;
	if(isdefined(enemy))
	{
		to_enemy_angles = vectortoangles(enemy getcentroid() - asmstatename gettagorigin("j_head"));
		var_b98aaa32 = vectorcross(anglestoforward((0, var_df839f8e[1], 0)), anglestoforward((0, to_enemy_angles[1], 0)));
		var_8b8deb51 = math::angle_dif(int(var_df839f8e[1]), int(to_enemy_angles[1])) * math::sign(var_b98aaa32[2]);
		var_dba5e06 = vectorcross(anglestoforward((0, var_df839f8e[0], 0)), anglestoforward((0, to_enemy_angles[0], 0)));
		var_ac726f4d = math::angle_dif(int(var_df839f8e[0]), int(to_enemy_angles[0])) * math::sign(var_dba5e06[2]);
		var_6980273c = math::clamp(var_8b8deb51, -30, 30);
		var_5f823b62 = math::clamp(var_ac726f4d, -45, 45);
		var_f7244c05 = (var_5f823b62, var_6980273c, 0);
		var_e792a112 = function_fc845eb6(asmstatename);
		if(var_e792a112 === 0)
		{
			return 4;
		}
		var_6b69382b = 0.25 / (1 + (var_e792a112 * 0.4));
		var_78b0f832 = anglelerp(asmstatename.var_ac71e4ab[1], var_6980273c, var_6b69382b);
		var_5782852e = anglelerp(asmstatename.var_ac71e4ab[0], var_5f823b62, var_6b69382b);
		asmstatename.var_ac71e4ab = (var_5782852e, var_78b0f832, 0);
		if(!asmstatename cansee(enemy) || abs(var_8b8deb51) > 45)
		{
			asmstatename.var_76ae69b0 = asmstatename.var_76ae69b0 + (float(function_60d95f53()) / 1000);
		}
		else
		{
			asmstatename.var_76ae69b0 = 0;
		}
	}
	if(is_true(asmstatename.var_1fa24724))
	{
		var_ab2fdbbc = gettime() + (int(1 * 1000));
		asmstatename.var_16109727 = max(var_ab2fdbbc, asmstatename.var_16109727);
	}
	if(!isdefined(asmstatename.var_9120e7f0))
	{
		asmstatename.var_9120e7f0 = var_df839f8e[1];
	}
	if(!isdefined(asmstatename.var_67839366))
	{
		asmstatename.var_67839366 = 0;
	}
	var_e54e9225 = math::angle_dif(int(asmstatename.var_9120e7f0), int(var_df839f8e[1]));
	if(var_e54e9225 < 5)
	{
		asmstatename.var_67839366 = asmstatename.var_67839366 + (float(function_60d95f53()) / 1000);
		asmstatename.var_9120e7f0 = var_df839f8e[1];
	}
	else
	{
		asmstatename.var_67839366 = 0;
	}
	forward_vec = anglestoforward(var_df839f8e + asmstatename.var_ac71e4ab);
	asmstatename.var_ee2440ac.origin = asmstatename gettagorigin("j_head") + (forward_vec * 900);
	if(!is_true(asmstatename.var_308a238a))
	{
		if(isplayer(enemy) && !zombie_utility::is_player_valid(enemy, 1))
		{
			/#
				if(is_true(level.var_bb61089c))
				{
					println("" + "");
				}
			#/
			return 4;
		}
		if(asmstatename.var_76ae69b0 > 2)
		{
			/#
				if(is_true(level.var_bb61089c))
				{
					println("" + "");
				}
			#/
			return 4;
		}
		if(asmstatename.var_67839366 > 1)
		{
			if(isdefined(asmstatename.var_54529e1e) && ((float(gettime() - asmstatename.var_54529e1e)) / 1000) > 2)
			{
				/#
					if(is_true(level.var_bb61089c))
					{
						println("" + "");
					}
				#/
				return 4;
			}
		}
	}
	if(gettime() < asmstatename.var_16109727)
	{
		return 5;
	}
	return 4;
}

/*
	Name: function_7b02beac
	Namespace: namespace_361e505d
	Checksum: 0xEC992047
	Offset: 0xB040
	Size: 0x218
	Parameters: 2
	Flags: None
*/
function function_7b02beac(entity, asmstatename)
{
	if(flag::get(#"hash_67c62575285677e4"))
	{
		/#
			if(is_true(level.var_bb61089c))
			{
				println("" + "");
			}
		#/
		asmstatename thread function_8a959784(asmstatename);
	}
	duration_ms = gettime() - asmstatename.var_526dce0b;
	var_e792a112 = function_fc845eb6(asmstatename);
	if(var_e792a112 === 0)
	{
		return 4;
	}
	beam_cooldown = asmstatename.var_ef229fd6[var_e792a112 - 1];
	var_c452f02a = asmstatename.var_a8bb18af[var_e792a112 - 1];
	if(duration_ms < (int(var_c452f02a * 1000)) * 0.5)
	{
		beam_cooldown = beam_cooldown * 0.5;
	}
	if(is_true(asmstatename.var_1fa24724))
	{
		beam_cooldown = beam_cooldown * 0.5;
	}
	if(duration_ms < int(2 * 1000))
	{
		asmstatename thread flag::set_for_time(1, #"hash_1c464f9df131fb78");
	}
	function_9de20709(asmstatename, 1, int(beam_cooldown * 1000));
	return 4;
}

/*
	Name: function_86e3dd7b
	Namespace: namespace_361e505d
	Checksum: 0x210659B3
	Offset: 0xB260
	Size: 0xF2
	Parameters: 1
	Flags: Private
*/
function private function_86e3dd7b(entity)
{
	var_c7c3c6f5 = 1200;
	var_e792a112 = function_fc845eb6(entity);
	if(var_e792a112 === 1)
	{
		return var_c7c3c6f5;
	}
	enemy = undefined;
	if(isdefined(level.var_f67b08f5))
	{
		enemy = [[level.var_f67b08f5]](entity);
	}
	if(isdefined(enemy) && distancesquared(enemy.origin, entity.origin) < sqr(300))
	{
		return var_c7c3c6f5;
	}
	return int(-1);
}

/*
	Name: function_5020432f
	Namespace: namespace_361e505d
	Checksum: 0x49C415D2
	Offset: 0xB360
	Size: 0x66
	Parameters: 3
	Flags: Private
*/
function private function_5020432f(entity, point, facing_vec)
{
	if(!isdefined(facing_vec))
	{
		facing_vec = anglestoforward(entity.angles);
	}
	return (vectordot(facing_vec, point - entity.origin)) < 0;
}

/*
	Name: function_ac104a3d
	Namespace: namespace_361e505d
	Checksum: 0xD43BAA8D
	Offset: 0xB3D0
	Size: 0x2D8
	Parameters: 0
	Flags: None
*/
function function_ac104a3d()
{
	/#
		function_5ac4dc99(#"hash_7993983e3d5d27e6", "");
		function_cd140ee9(#"hash_7993983e3d5d27e6", &function_25a1aefe);
		var_211a8012 = (isdefined(var_211a8012) ? var_211a8012 : 0);
		util::add_debug_command(((((("" + "") + "") + var_211a8012) + "") + "") + "");
		var_211a8012++;
		var_211a8012 = (isdefined(var_211a8012) ? var_211a8012 : 0);
		util::add_debug_command(((((("" + "") + "") + var_211a8012) + "") + "") + "");
		var_211a8012++;
		var_211a8012 = (isdefined(var_211a8012) ? var_211a8012 : 0);
		util::add_debug_command(((((("" + "") + "") + var_211a8012) + "") + "") + "");
		var_211a8012++;
		var_211a8012 = (isdefined(var_211a8012) ? var_211a8012 : 0);
		util::add_debug_command(((((("" + "") + "") + var_211a8012) + "") + "") + "");
		var_211a8012++;
		var_211a8012 = (isdefined(var_211a8012) ? var_211a8012 : 0);
		util::add_debug_command(((((("" + "") + "") + var_211a8012) + "") + "") + "");
		var_211a8012++;
		var_211a8012 = (isdefined(var_211a8012) ? var_211a8012 : 0);
		util::add_debug_command(((((("" + "") + "") + var_211a8012) + "") + "") + "");
		var_211a8012++;
	#/
}

/*
	Name: function_25a1aefe
	Namespace: namespace_361e505d
	Checksum: 0x80B12B67
	Offset: 0xB6B0
	Size: 0x194
	Parameters: 1
	Flags: None
*/
function function_25a1aefe(dvar)
{
	/#
		tokens = strtok(dvar.value, "");
		switch((isdefined(tokens[0]) ? tokens[0] : ""))
		{
			case "hash_ccd4769d7cd0b67":
			{
				function_5427626d();
				break;
			}
			case "hash_19e4ca4f6a7fcb44":
			{
				function_38b446e();
				break;
			}
			case "hash_b5154c650a08666":
			{
				function_3da7e651();
				break;
			}
			case "hash_3453da4f31a58dd1":
			{
				function_bf8145a9();
				break;
			}
			case "hash_43332ff3554c1df4":
			{
				function_dd021803();
				break;
			}
			case "hash_67c639c05d24e196":
			{
				function_315c8e4();
				break;
			}
			default:
			{
				return;
			}
		}
		setdvar(#"hash_7993983e3d5d27e6", "");
	#/
}

/*
	Name: function_5427626d
	Namespace: namespace_361e505d
	Checksum: 0x207A2CCB
	Offset: 0xB850
	Size: 0xBA
	Parameters: 0
	Flags: Private
*/
function private function_5427626d()
{
	/#
		var_9119d11f = function_3ecd4ae();
		foreach(var_60f0309d in var_9119d11f)
		{
			var_60f0309d.var_a8785ea7 = !is_true(var_60f0309d.var_a8785ea7);
		}
	#/
}

/*
	Name: function_38b446e
	Namespace: namespace_361e505d
	Checksum: 0xFF69BC
	Offset: 0xB918
	Size: 0xBA
	Parameters: 0
	Flags: Private
*/
function private function_38b446e()
{
	/#
		var_9119d11f = function_3ecd4ae();
		foreach(var_60f0309d in var_9119d11f)
		{
			var_60f0309d.var_c44e9122 = !is_true(var_60f0309d.var_c44e9122);
		}
	#/
}

/*
	Name: function_3da7e651
	Namespace: namespace_361e505d
	Checksum: 0x8EEA980F
	Offset: 0xB9E0
	Size: 0xBA
	Parameters: 0
	Flags: Private
*/
function private function_3da7e651()
{
	/#
		var_9119d11f = function_3ecd4ae();
		foreach(var_60f0309d in var_9119d11f)
		{
			var_60f0309d.var_f5ffa31e = !is_true(var_60f0309d.var_f5ffa31e);
		}
	#/
}

/*
	Name: function_bf8145a9
	Namespace: namespace_361e505d
	Checksum: 0xF8DB6CE
	Offset: 0xBAA8
	Size: 0xBA
	Parameters: 0
	Flags: Private
*/
function private function_bf8145a9()
{
	/#
		var_9119d11f = function_3ecd4ae();
		foreach(var_60f0309d in var_9119d11f)
		{
			var_60f0309d.var_308a238a = !is_true(var_60f0309d.var_308a238a);
		}
	#/
}

/*
	Name: function_dd021803
	Namespace: namespace_361e505d
	Checksum: 0x8F1BCC6C
	Offset: 0xBB70
	Size: 0xBA
	Parameters: 0
	Flags: Private
*/
function private function_dd021803()
{
	/#
		var_9119d11f = function_3ecd4ae();
		foreach(var_60f0309d in var_9119d11f)
		{
			var_60f0309d.var_e76a75b4 = !is_true(var_60f0309d.var_e76a75b4);
		}
	#/
}

/*
	Name: function_315c8e4
	Namespace: namespace_361e505d
	Checksum: 0x614EC1A1
	Offset: 0xBC38
	Size: 0xD8
	Parameters: 0
	Flags: Private
*/
function private function_315c8e4()
{
	/#
		var_9119d11f = function_3ecd4ae();
		foreach(var_60f0309d in var_9119d11f)
		{
			if(isdefined(level.var_8f1e0b55))
			{
				var_60f0309d [[level.var_8f1e0b55]](vectorscale((0, 0, 1), 300), getplayers()[0]);
			}
		}
	#/
}

/*
	Name: function_e1f48a38
	Namespace: namespace_361e505d
	Checksum: 0xE441B658
	Offset: 0xBD18
	Size: 0x392
	Parameters: 0
	Flags: Private
*/
function private function_e1f48a38()
{
	/#
		self endon(#"end_game");
		while(true)
		{
			if(!getdvarint(#"hash_4e47873b8bfbca14", 0) > 0)
			{
				level.var_bb61089c = 0;
				waitframe(1);
				continue;
			}
			level.var_bb61089c = 1;
			var_9119d11f = function_3ecd4ae();
			foreach(var_60f0309d in var_9119d11f)
			{
				if(getdvarint(#"hash_647193278c68afe1", 0) > 0)
				{
					tag_names = [2:"", 1:"", 0:""];
					for(i = 0; i < 3; i++)
					{
						if(function_17ae1df1(var_60f0309d, i))
						{
							recordsphere(var_60f0309d gettagorigin(tag_names[i]), getdvarfloat(#"hash_4b3df2be7b23dc9f", 15), (1, 0, 0));
						}
					}
				}
				if(getdvarint(#"hash_1cd4bd84364131fc", 0) > 0)
				{
					flag_str = (var_60f0309d flag::get(#"hash_5c35337a4e15867") ? "" : "");
					var_190e31e1 = (var_60f0309d flag::get(#"hash_5c35337a4e15867") ? (0, 1, 0) : (1, 0, 0));
					record3dtext(flag_str, var_60f0309d.origin + vectorscale((0, 0, 1), 70), var_190e31e1);
				}
			}
			if(isdefined(level.zm_loc_types[#"hash_b7c88561b5e9b2c"]))
			{
				foreach(loc_struct in level.zm_loc_types[#"hash_b7c88561b5e9b2c"])
				{
					function_ae63c292(loc_struct.origin, "", (1, 0, 0));
				}
			}
			waitframe(1);
		}
	#/
}

/*
	Name: function_ae63c292
	Namespace: namespace_361e505d
	Checksum: 0xC1D7A654
	Offset: 0xC0B8
	Size: 0x64
	Parameters: 3
	Flags: None
*/
function function_ae63c292(pos, text, col)
{
	/#
		recordsphere(pos, 10, col);
		record3dtext(text, pos + vectorscale((0, 0, 1), 10), col);
	#/
}

/*
	Name: function_3ecd4ae
	Namespace: namespace_361e505d
	Checksum: 0x5B891700
	Offset: 0xC128
	Size: 0x2A
	Parameters: 0
	Flags: None
*/
function function_3ecd4ae()
{
	/#
		return getaiarchetypearray(#"hash_7c09b683edfb0e96");
	#/
}

