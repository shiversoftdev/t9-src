#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using script_178024232e91b0a1;
#using script_41fe08c37d53a635;
#using script_2c5daa95f8fec03c;
#using script_3aa0f32b70d4f7cb;
#using script_522aeb6ae906391e;
#using script_caf007e2a98afa2;
#using script_4d85e8de54b02198;
#using script_4bf952f6ba31bb17;
#using scripts\core_common\ai\archetype_utility.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\ai_shared.gsc;
#using script_3819e7a1427df6d2;

#namespace namespace_19c99142;

/*
	Name: function_33cdc9fa
	Namespace: namespace_19c99142
	Checksum: 0x741FFC82
	Offset: 0x630
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_33cdc9fa()
{
	level notify(290560225);
}

/*
	Name: __init__system__
	Namespace: namespace_19c99142
	Checksum: 0xAA86553D
	Offset: 0x650
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_2f2eba883d5db256", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_19c99142
	Checksum: 0xF802DDE7
	Offset: 0x698
	Size: 0x24E
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	if(!isarchetypeloaded(#"soa"))
	{
		return;
	}
	registerbehaviorscriptfunctions();
	spawner::add_archetype_spawn_function(#"soa", &function_7ba58c09);
	clientfield::register("actor", "soaBindTurnCF", 14000, 1, "int");
	clientfield::register("actor", "soaBindProcessCF", 14000, 1, "int");
	clientfield::register("actor", "soaHeadGlowCF", 14000, 2, "int");
	clientfield::register("actor", "soaSpawnCompleteCF", 14000, 2, "int");
	clientfield::register("actor", "soaLifeDrainBeamKillCF", 14000, 1, "counter");
	clientfield::register("actor", "soaDeathDissolveCF", 14000, 2, "int");
	clientfield::register("actor", "soaHealthStateCF", 14000, 2, "int");
	clientfield::register("toplayer", "soaLifeDrainPostFXCF", 14000, 1, "int");
	clientfield::register("scriptmover", "soaLifeDrainEntCF", 14000, 2, "int");
	/#
		thread function_ed9529fa();
		level thread function_ed17dbef();
	#/
}

/*
	Name: function_7ba58c09
	Namespace: namespace_19c99142
	Checksum: 0xB1542CCC
	Offset: 0x8F0
	Size: 0x4C4
	Parameters: 0
	Flags: Linked
*/
function function_7ba58c09()
{
	function_ed796ba1();
	self setblackboardattribute("_locomotion_speed", "locomotion_speed_walk");
	level thread query_all_possible_targets();
	level thread function_a55742e8();
	if(!isdefined(level.var_8f50760e))
	{
		level.var_8f50760e = 0;
	}
	level.var_8f50760e++;
	level.var_a81a9504 = [];
	if(!isdefined(level.var_7a4dc7e8))
	{
		level.var_7a4dc7e8 = [];
	}
	callback::on_deleted(&function_878b889a);
	self callback::function_d8abfc3d(#"on_ai_killed", &function_9db77ef8);
	self callback::function_d8abfc3d(#"hash_7cdd5b06f3e281c6", &function_539e0920);
	self callback::function_d8abfc3d(#"on_ai_damage", &function_66c569e2);
	aiutility::addaioverridedamagecallback(self, &function_859e7ea2);
	self.var_276a8013 = [];
	self.var_4a8fb39d = [];
	self.var_75b76562 = #"chase";
	self.var_ad1a2a3c = 1;
	self.cant_move_cb = &function_31c9342d;
	self.var_d106da57 = &function_54fa701a;
	self.var_8a901d4b = 1;
	self.var_318a0ac8 = &function_29c1ba76;
	self.var_c07d2388 = #"hash_199477e2c7a333a4";
	self.var_cdc5412 = 0;
	self.spawn_time = gettime();
	self.var_9817f19a = 0;
	self.var_4d56625b = 0;
	self.var_306ee014 = &function_a5b798b5;
	self.var_d30b4aa3 = 0;
	self.var_11b65fa = &function_fc7356e3;
	self.var_55d2eb17 = &function_3975c89d;
	self thread function_940cd1d8();
	function_6dc728a2(self, #"hash_685254f9ed0ce346", &function_961c1fc0);
	function_6dc728a2(self, #"hash_4ec3ec4f06b9498f", &function_43413efd);
	function_6dc728a2(self, #"chase", &function_8d707ed2);
	function_82dc224a(self, #"hash_4ec3ec4f06b9498f", &function_fe96f51d);
	function_6dc728a2(self, #"hash_110ee879f18b605f", &function_5f116663);
	function_82dc224a(self, #"hash_110ee879f18b605f", &function_9db27415);
	function_82dc224a(self, #"hash_6192d8af630c6c07", &function_d5ecd46a);
	function_6dc728a2(self, #"circle", &function_71d2268d);
	self.var_d8861a5f = 1;
	self.var_ad033811 = &function_6415297d;
	self.var_d5e58936 = &function_be4a6e08;
	self thread function_82f2b2fd(self);
	self thread function_73156638(self);
	self thread function_efa1ad6b(self);
}

/*
	Name: function_ed796ba1
	Namespace: namespace_19c99142
	Checksum: 0x44F15F66
	Offset: 0xDC0
	Size: 0x32
	Parameters: 0
	Flags: Linked, Private
*/
function private function_ed796ba1()
{
	blackboard::createblackboardforentity(self);
	self.___archetypeonanimscriptedcallback = &function_7310a1fd;
}

/*
	Name: function_7310a1fd
	Namespace: namespace_19c99142
	Checksum: 0xCD52E9BE
	Offset: 0xE00
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_7310a1fd(entity)
{
	entity.__blackboard = undefined;
	entity function_ed796ba1();
}

/*
	Name: registerbehaviorscriptfunctions
	Namespace: namespace_19c99142
	Checksum: 0x61746A37
	Offset: 0xE38
	Size: 0x18B4
	Parameters: 0
	Flags: Linked
*/
function registerbehaviorscriptfunctions()
{
	/#
		assert(isscriptfunctionptr(&function_c86ef1cd));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_459f6b422b2fbd4e", &function_c86ef1cd);
	/#
		assert(isscriptfunctionptr(&function_cc9102fc));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_69adfd4cd8fcfa53", &function_cc9102fc);
	/#
		assert(isscriptfunctionptr(&function_fa692036));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_3904080fee39c8c3", &function_fa692036);
	/#
		assert(!isdefined(&function_1ae5d56a) || isscriptfunctionptr(&function_1ae5d56a));
	#/
	/#
		assert(!isdefined(&function_78d5d69e) || isscriptfunctionptr(&function_78d5d69e));
	#/
	/#
		assert(!isdefined(&function_d27b2a9a) || isscriptfunctionptr(&function_d27b2a9a));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction(#"hash_1bc92898f953c0c1", &function_1ae5d56a, &function_78d5d69e, &function_d27b2a9a);
	/#
		assert(isscriptfunctionptr(&function_351bf6f2));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_195a475bf9fa86b7", &function_351bf6f2);
	/#
		assert(isscriptfunctionptr(&function_dfbc9dea));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_6ec33e3d858ea412", &function_dfbc9dea);
	/#
		assert(isscriptfunctionptr(&function_36c559fa));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_2df2a44bb71d4435", &function_36c559fa);
	/#
		assert(isscriptfunctionptr(&function_8ca0249d));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_457e3cc71cc1678b", &function_8ca0249d);
	/#
		assert(!isdefined(&function_43b0545a) || isscriptfunctionptr(&function_43b0545a));
	#/
	/#
		assert(!isdefined(&function_15080704) || isscriptfunctionptr(&function_15080704));
	#/
	/#
		assert(!isdefined(&function_1a29c303) || isscriptfunctionptr(&function_1a29c303));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction(#"hash_543a4cf647a0476", &function_43b0545a, &function_15080704, &function_1a29c303);
	/#
		assert(isscriptfunctionptr(&function_39994f21));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_7d1276de77247e76", &function_39994f21);
	/#
		assert(isscriptfunctionptr(&function_2953d806));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_a9927a80b64381f", &function_2953d806);
	/#
		assert(isscriptfunctionptr(&function_114e7369));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_2142f4f33c96abf3", &function_114e7369);
	/#
		assert(isscriptfunctionptr(&function_52ca7e05));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_73ea36491e6dbf14", &function_52ca7e05);
	/#
		assert(!isdefined(&function_76e0c5a7) || isscriptfunctionptr(&function_76e0c5a7));
	#/
	/#
		assert(!isdefined(&function_8096be0e) || isscriptfunctionptr(&function_8096be0e));
	#/
	/#
		assert(!isdefined(&function_9b1c356b) || isscriptfunctionptr(&function_9b1c356b));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction(#"hash_7697b81573903dd0", &function_76e0c5a7, &function_8096be0e, &function_9b1c356b);
	/#
		assert(!isdefined(&function_5b44f9c2) || isscriptfunctionptr(&function_5b44f9c2));
	#/
	/#
		assert(!isdefined(&function_b2314b9) || isscriptfunctionptr(&function_b2314b9));
	#/
	/#
		assert(!isdefined(&function_8df98513) || isscriptfunctionptr(&function_8df98513));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction("soaMoveZipline", &function_5b44f9c2, &function_b2314b9, &function_8df98513);
	/#
		assert(!isdefined(&function_31a8422e) || isscriptfunctionptr(&function_31a8422e));
	#/
	/#
		assert(!isdefined(&function_6965f1e3) || isscriptfunctionptr(&function_6965f1e3));
	#/
	/#
		assert(!isdefined(&function_9769881) || isscriptfunctionptr(&function_9769881));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction("soaMoveSweep", &function_31a8422e, &function_6965f1e3, &function_9769881);
	/#
		assert(!isdefined(&function_f98327eb) || isscriptfunctionptr(&function_f98327eb));
	#/
	/#
		assert(!isdefined(&function_1a0791fc) || isscriptfunctionptr(&function_1a0791fc));
	#/
	/#
		assert(!isdefined(&function_3e895403) || isscriptfunctionptr(&function_3e895403));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction("soaMoveSweepNoclip", &function_f98327eb, &function_1a0791fc, &function_3e895403);
	/#
		assert(isscriptfunctionptr(&function_18936a77));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_231eef47fde69c6e", &function_18936a77);
	/#
		assert(isscriptfunctionptr(&function_fa0a3cc));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_6478754622c6e9a", &function_fa0a3cc);
	/#
		assert(isscriptfunctionptr(&function_718c627d));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal("soaLocomotionStrafeUpdate", &function_718c627d);
	/#
		assert(isscriptfunctionptr(&function_7b84cb6a));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_6b72b76b13830da7", &function_7b84cb6a);
	/#
		assert(isscriptfunctionptr(&function_38f6cd8c));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_4666ea33d9da260c", &function_38f6cd8c);
	/#
		assert(isscriptfunctionptr(&function_d9ab9fda));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_1727c79463fa2222", &function_d9ab9fda);
	/#
		assert(isscriptfunctionptr(&function_33d6f18));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_77e870041bff21fb", &function_33d6f18);
	/#
		assert(isscriptfunctionptr(&function_6fec468f));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_6525902fd2a8ff18", &function_6fec468f);
	/#
		assert(isscriptfunctionptr(&function_d01b93a));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_38748b5a602d0dde", &function_d01b93a);
	/#
		assert(isscriptfunctionptr(&function_179244e9));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_764ff3fe3e1128d3", &function_179244e9, 2);
	/#
		assert(isscriptfunctionptr(&function_2ca0d658));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_4aaa9ea3de95a1b9", &function_2ca0d658);
	/#
		assert(isscriptfunctionptr(&function_4b5c56a5));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_32dd5faefed3e191", &function_4b5c56a5);
	/#
		assert(isscriptfunctionptr(&function_b7623789));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_711f32ca50e323c5", &function_b7623789);
	/#
		assert(isscriptfunctionptr(&function_a6e66d26));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_759644134beacc30", &function_a6e66d26);
	/#
		assert(isscriptfunctionptr(&function_e417cf33));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_5766c8d72a819e5", &function_e417cf33);
	/#
		assert(isscriptfunctionptr(&function_ca5c24db));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_257b9d5bdcd558c2", &function_ca5c24db);
	/#
		assert(isscriptfunctionptr(&function_fc775f13));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_33e0b1ca4d7d8938", &function_fc775f13);
	/#
		assert(isscriptfunctionptr(&function_4a46d613));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_7e1a49f4786610bf", &function_4a46d613);
	/#
		assert(isscriptfunctionptr(&function_ca416ac3));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_7843bc5bae75c661", &function_ca416ac3);
	/#
		assert(isscriptfunctionptr(&function_5a2c32ca));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_ba4ea9e7220e750", &function_5a2c32ca);
	/#
		assert(isscriptfunctionptr(&function_adbacb27));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_13ad8273695bd0f1", &function_adbacb27);
	/#
		assert(isscriptfunctionptr(&function_71cc3e18));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_5ea7c4e18e4aac3", &function_71cc3e18);
	/#
		assert(isscriptfunctionptr(&function_77c135e2));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_2ea3b4010918530e", &function_77c135e2);
	/#
		assert(isscriptfunctionptr(&function_1be46939));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_3bfb7809ec2cd603", &function_1be46939);
	/#
		assert(isscriptfunctionptr(&function_71d28905));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_efe5975946bb550", &function_71d28905);
	/#
		assert(isscriptfunctionptr(&function_7fe60089));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_ad592f3057b5637", &function_7fe60089);
	/#
		assert(isscriptfunctionptr(&function_f5f0b614));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal("soaShouldLocomotionStrafeFlip", &function_f5f0b614);
	/#
		assert(isscriptfunctionptr(&function_6d6bd946));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("soaShouldUseLocomotionBlendspace", &function_6d6bd946);
	animationstatenetwork::registeranimationmocomp("soa_move_to_retreat@soa", &function_190c6600, &function_2a8799e1, &function_1d3f5ac);
	animationstatenetwork::registeranimationmocomp("soa_move_zipline@soa", &function_8b051aff, &function_90db0e6d, &function_d7a2a6d3);
	animationstatenetwork::registeranimationmocomp("soa_move_sweep_noclip@soa", &function_f4e85274, &function_3b5becd0, &function_80985f6);
	animationstatenetwork::registeranimationmocomp("soa_procedural_traverse@soa", &function_69e1fc18, &function_88023de5, &function_fdde7e99);
	animationstatenetwork::registeranimationmocomp("soa_force_face_lifedrain@soa", &function_1f8fc149, &function_576a104c, undefined);
	animationstatenetwork::registernotetrackhandlerfunction("soa_dissolve", &function_42ea6b21);
}

/*
	Name: function_878b889a
	Namespace: namespace_19c99142
	Checksum: 0xE0E26B2
	Offset: 0x26F8
	Size: 0x90
	Parameters: 0
	Flags: Linked
*/
function function_878b889a()
{
	if(self.archetype === #"soa")
	{
		if(isdefined(level.var_8f50760e))
		{
			level.var_8f50760e = int(max(0, level.var_8f50760e - 1));
			if(level.var_8f50760e === 0)
			{
				level notify(#"hash_e87dc146d0a8050");
			}
		}
	}
}

/*
	Name: function_9db77ef8
	Namespace: namespace_19c99142
	Checksum: 0x3900D21A
	Offset: 0x2790
	Size: 0x22C
	Parameters: 1
	Flags: Linked
*/
function function_9db77ef8(params)
{
	self clientfield::set("soaDeathDissolveCF", 1);
	self.takedamage = 0;
	var_bc1c3139 = function_a25a16fc(self);
	if(var_bc1c3139.size >= 5 && isplayer(params.eattacker))
	{
		level scoreevents::doscoreeventcallback("scoreEventZM", {#scoreevent:"disciple_kill_with_max_zombies_zm", #attacker:params.eattacker});
	}
	self playsound(#"hash_268d8f386334e1ec");
	function_1b2f34c9(self);
	function_3975c89d(self);
	if(isdefined(self.var_26dc9a8a))
	{
		foreach(zombie in self.var_26dc9a8a)
		{
			if(isdefined(zombie))
			{
				zombie ai::clear_stun();
				zombie flag::clear(#"hash_335e103725141428");
				zombie clientfield::set("soaBindProcessCF", 0);
			}
		}
	}
	level.var_7a4dc7e8[self getentitynumber()] = undefined;
	self thread delete_corpse();
}

/*
	Name: delete_corpse
	Namespace: namespace_19c99142
	Checksum: 0x715AB344
	Offset: 0x29C8
	Size: 0x9C
	Parameters: 0
	Flags: Linked, Private
*/
function private delete_corpse()
{
	if(is_true(self.var_bf8a126c))
	{
		return;
	}
	self endon(#"end_game", #"deleted", #"hash_1b5a2b3f9dfe9fad");
	self waittill(#"actor_corpse", #"deleted");
	waitframe(1);
	zombie_utility::function_96e9d980(#"soa");
}

/*
	Name: function_940cd1d8
	Namespace: namespace_19c99142
	Checksum: 0x9070BA48
	Offset: 0x2A70
	Size: 0x13C
	Parameters: 0
	Flags: Linked
*/
function function_940cd1d8()
{
	self endon(#"death");
	self function_9d34061c(int(max(0, (self.maxhealth * 0.67) - self.health)));
	function_bc16962c(self, self.health);
	self clientfield::set("soaSpawnCompleteCF", 1);
	self setmodel(#"hash_26b01bce96eb07bc");
	self thread flag::set_for_time(1.2, #"hash_f0028251a31e1fe");
	wait(1.4);
	self clientfield::set("soaSpawnCompleteCF", 2);
	self setmodel(#"hash_4330c469894950e2");
}

/*
	Name: function_a5b798b5
	Namespace: namespace_19c99142
	Checksum: 0xE04CFF98
	Offset: 0x2BB8
	Size: 0x2A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_a5b798b5(entity)
{
	return entity flag::get(#"hash_f0028251a31e1fe");
}

/*
	Name: function_42ea6b21
	Namespace: namespace_19c99142
	Checksum: 0x19ADBD38
	Offset: 0x2BF0
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function function_42ea6b21(entity)
{
	self setmodel(#"c_t9_zmb_son_of_orda_3_ww1");
	if(isdefined(entity))
	{
		entity clientfield::set("soaDeathDissolveCF", 2);
	}
}

/*
	Name: function_539e0920
	Namespace: namespace_19c99142
	Checksum: 0xE50ABB44
	Offset: 0x2C50
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function function_539e0920(params)
{
	function_1b2f34c9(self);
	function_3975c89d(self);
	self.favoriteenemy = undefined;
	set_head_model(self, 1, undefined, 1);
}

/*
	Name: function_54fa701a
	Namespace: namespace_19c99142
	Checksum: 0x96E54408
	Offset: 0x2CC0
	Size: 0xE
	Parameters: 0
	Flags: Linked
*/
function function_54fa701a()
{
	self.var_5ade90d9 = undefined;
}

/*
	Name: function_6415297d
	Namespace: namespace_19c99142
	Checksum: 0xC3E50B09
	Offset: 0x2CD8
	Size: 0xC2
	Parameters: 2
	Flags: Linked, Private
*/
function private function_6415297d(potential_target, var_ab0d150d)
{
	var_615334ef = zm_utility::function_d89330e6(self.favoriteenemy);
	dist_to_target = (var_ab0d150d === self.favoriteenemy ? var_615334ef : zm_utility::function_d89330e6(var_ab0d150d));
	if(dist_to_target < 0)
	{
		return 0;
	}
	var_3f7b3e70 = 1;
	if(var_615334ef > dist_to_target)
	{
		var_3f7b3e70 = 2;
	}
	return (sqrt(dist_to_target) / self.maxhealth) * var_3f7b3e70;
}

/*
	Name: function_be4a6e08
	Namespace: namespace_19c99142
	Checksum: 0xF0B9620B
	Offset: 0x2DA8
	Size: 0x1BC
	Parameters: 2
	Flags: Linked
*/
function function_be4a6e08(target_player, score)
{
	if(target_player flag::get(#"hash_60491982ef9b417f") && self.var_7418f498 !== target_player)
	{
		score = score + sqr(500);
	}
	else if(!target_player flag::get(#"hash_60491982ef9b417f") || self.var_7418f498 === target_player && distance2dsquared(self.origin, target_player.origin) < sqr(225))
	{
		score = score - (sqr(self.maxhealth * 2));
	}
	if(isdefined(level.var_632f9a2e[target_player getentitynumber()]))
	{
		var_73c38e13 = level.var_632f9a2e[target_player getentitynumber()].size;
		priority = var_73c38e13;
		if(self.var_5b2fe31d === target_player)
		{
			priority = self.var_4d56625b;
		}
		score = score + (sqr(300 * priority));
	}
	return score;
}

/*
	Name: function_73156638
	Namespace: namespace_19c99142
	Checksum: 0xE968F316
	Offset: 0x2F70
	Size: 0x1A4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_73156638(entity)
{
	self endon(#"death");
	while(true)
	{
		var_4d21f369 = function_da71e09a(entity);
		if(var_4d21f369 === #"chase" && isplayer(entity.favoriteenemy) && !entity.favoriteenemy flag::get(#"hash_60491982ef9b417f"))
		{
			if(distancesquared(entity.origin, entity.favoriteenemy.origin) < sqr(500))
			{
				player_forward = anglestoforward(entity.favoriteenemy.angles);
				var_2cfb4597 = entity.origin - entity.favoriteenemy.origin;
				if(vectordot(player_forward, var_2cfb4597) < 0)
				{
					entity playsound(#"hash_3192d760955b3f62");
					wait(5);
				}
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_7d9fb4f4
	Namespace: namespace_19c99142
	Checksum: 0xC191AD95
	Offset: 0x3120
	Size: 0x102
	Parameters: 1
	Flags: Linked, Private
*/
function private function_7d9fb4f4(params)
{
	if(function_3c14ef44(self))
	{
		if(params.shitloc === "right_hand" || params.shitloc === "right_arm_lower" || params.shitloc === "right_arm_upper")
		{
			return true;
		}
		var_8378c252 = self gettagorigin("j_mid_ri_1");
		if(isdefined(var_8378c252) && isdefined(params.vpoint) && distancesquared(var_8378c252, params.vpoint) < sqr(15))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_66c569e2
	Namespace: namespace_19c99142
	Checksum: 0x3FADA74C
	Offset: 0x3230
	Size: 0x1B4
	Parameters: 1
	Flags: Linked
*/
function function_66c569e2(params)
{
	if(function_7d9fb4f4(params))
	{
		if(!isdefined(self.var_b8114eb4))
		{
			self.var_b8114eb4 = 0;
		}
		self.var_b8114eb4 = self.var_b8114eb4 + params.idamage;
		self.var_b4d7d55a = params.eattacker;
		playfxontag(#"hash_1dc785784a653924", self, "tag_fx_hand_ri_palm");
	}
	self.var_2c400759 = gettime();
	new_health = max(self.health - params.idamage, 0);
	var_c281d137 = int(4 - (ceil((new_health / self.maxhealth) * 3)));
	if(isdefined(self.var_81e38bf6))
	{
		self.var_81e38bf6 = self.var_81e38bf6 + params.idamage;
	}
	if(function_bc16962c(self, new_health) && !function_3c14ef44(self))
	{
		if(!is_true(self.var_5b6bf2e7))
		{
			self.var_5b358a38 = 1;
		}
		self playsound(#"hash_7d2102e821def54b");
	}
}

/*
	Name: function_bc16962c
	Namespace: namespace_19c99142
	Checksum: 0x60138CA9
	Offset: 0x33F0
	Size: 0x1D6
	Parameters: 2
	Flags: Linked
*/
function function_bc16962c(entity, new_health)
{
	var_c281d137 = int(4 - (ceil((new_health / entity.maxhealth) * 3)));
	if(entity.var_ad1a2a3c !== var_c281d137)
	{
		switch(var_c281d137)
		{
			case 1:
			{
				self setmodel(#"hash_4330c469894950e2");
				set_head_model(self, undefined, #"hash_199477e2c7a333a4");
				break;
			}
			case 2:
			{
				self clientfield::set("soaHealthStateCF", 1);
				self setmodel(#"hash_322e5835a0cf66af");
				set_head_model(self, undefined, #"hash_19947ae2c7a338bd");
				break;
			}
			case 3:
			{
				self clientfield::set("soaHealthStateCF", 2);
				self setmodel(#"hash_322e5735a0cf64fc");
				set_head_model(self, undefined, #"hash_19947ae2c7a338bd");
				break;
			}
		}
		entity.var_ad1a2a3c = var_c281d137;
		return true;
	}
	return false;
}

/*
	Name: function_859e7ea2
	Namespace: namespace_19c99142
	Checksum: 0x9ED2FEE4
	Offset: 0x35D0
	Size: 0xA8
	Parameters: 13
	Flags: Linked
*/
function function_859e7ea2(inflictor, attacker, damage, dflags, meansofdeath, weapon, var_fd90b0bb, vpoint, dir, shitloc, offsettime, boneindex, modelindex)
{
	if(self zm_utility::function_4562a3ef(modelindex, boneindex) && self.var_ad1a2a3c >= 3)
	{
		return self.health;
	}
	return offsettime;
}

/*
	Name: function_29c1ba76
	Namespace: namespace_19c99142
	Checksum: 0x7155873A
	Offset: 0x3680
	Size: 0x3C4
	Parameters: 13
	Flags: Linked
*/
function function_29c1ba76(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype)
{
	if(isdefined(self.var_306ee014) && is_true([[self.var_306ee014]](self)))
	{
		vdir = 0;
	}
	self.var_426947c4 = undefined;
	var_ebcff177 = 1;
	if(namespace_81245006::hasarmor(self) && (shitloc === "MOD_PROJECTILE_SPLASH" || shitloc === "MOD_GRENADE_SPLASH" || shitloc == "MOD_EXPLOSIVE"))
	{
		var_3cddb028 = 0.9 * vdir;
		if(isdefined(level.var_56f626bc))
		{
			var_3cddb028 = var_3cddb028 * [[level.var_56f626bc]](self, psoffsettime, vpoint);
		}
		var_31e96b81 = int(var_3cddb028);
		foreach(weakpoint in self.var_5ace757d)
		{
			self function_671249fb(weakpoint, var_31e96b81);
		}
	}
	weakpoint = namespace_81245006::function_3131f5dd(self, surfacetype, 1);
	if(!isdefined(weakpoint))
	{
		weakpoint = namespace_81245006::function_73ab4754(self, boneindex, 1);
	}
	if(isdefined(weakpoint) && weakpoint.type === #"armor" && namespace_81245006::function_f29756fe(weakpoint) !== 3)
	{
		var_ebcff177 = 3;
		vdir = 0.9 * vdir;
		if(isdefined(level.var_56f626bc))
		{
			vdir = vdir * [[level.var_56f626bc]](self, psoffsettime, vpoint);
		}
		self function_671249fb(weakpoint, vdir, vpoint);
	}
	if(isdefined(weakpoint) && weakpoint.var_3765e777 === 1 && aiutility::function_e2278a4b(psoffsettime, shitloc))
	{
		var_ebcff177 = 2;
		playfxontag(#"hash_78446e47909cbb46", self, "tag_fx_head_weakspot");
	}
	if(isdefined(level.var_1b01acb4))
	{
		vdir = vdir * [[level.var_1b01acb4]](self, psoffsettime, vpoint);
	}
	return {#hash_ebcff177:var_ebcff177, #weakpoint:weakpoint, #damage:vdir};
}

/*
	Name: function_671249fb
	Namespace: namespace_19c99142
	Checksum: 0x779AD4D0
	Offset: 0x3A50
	Size: 0x15A
	Parameters: 3
	Flags: Linked, Private
*/
function private function_671249fb(weakpoint, var_31e96b81, eattacker)
{
	if(weakpoint.type === #"armor" && weakpoint.currstate === 1)
	{
		namespace_81245006::function_ef87b7e8(weakpoint, var_31e96b81);
		if(namespace_81245006::function_f29756fe(weakpoint) === 3 && isdefined(weakpoint.var_f371ebb0))
		{
			destructserverutils::function_8475c53a(self, weakpoint.var_f371ebb0);
			set_head_model(self, 1);
			playfxontag(#"hash_6236fa1cff9eed39", self, "tag_fx_head_weakspot");
			self playsound(#"hash_2dbd7a349939d740");
			if(!is_true(self.var_5b6bf2e7))
			{
				self.var_40994afa = 1;
				self.var_a41c7ae4 = eattacker;
			}
			self.var_426947c4 = 1;
		}
		return true;
	}
	return false;
}

/*
	Name: function_35979cdd
	Namespace: namespace_19c99142
	Checksum: 0x169A77C1
	Offset: 0x3BB8
	Size: 0x138
	Parameters: 1
	Flags: Linked, Private
*/
function private function_35979cdd(entity)
{
	entity.blockingpain = 1;
	entity playsound(#"hash_429347ef564f1960");
	entity flag::clear(#"hash_9f9406444a7e5b0");
	if(isdefined(entity.var_26dc9a8a))
	{
		foreach(zombie in entity.var_26dc9a8a)
		{
			if(isdefined(zombie))
			{
				zombie ai::clear_stun();
				zombie flag::clear(#"hash_335e103725141428");
				zombie clientfield::set("soaBindProcessCF", 0);
			}
		}
	}
}

/*
	Name: pain_update
	Namespace: namespace_19c99142
	Checksum: 0x2DE01E65
	Offset: 0x3CF8
	Size: 0x3A
	Parameters: 1
	Flags: Linked, Private
*/
function private pain_update(entity)
{
	entity.var_5b358a38 = 0;
	entity.var_5015c6e8 = 0;
	entity.var_40994afa = 0;
	entity.blockingpain = 1;
}

/*
	Name: function_fd74c2ff
	Namespace: namespace_19c99142
	Checksum: 0x7B7399CF
	Offset: 0x3D40
	Size: 0x46
	Parameters: 1
	Flags: Linked, Private
*/
function private function_fd74c2ff(entity)
{
	entity.var_5b358a38 = 0;
	entity.var_40994afa = 0;
	entity.var_5015c6e8 = 0;
	entity.blockingpain = 0;
	entity.var_3ab5f48b = gettime();
}

/*
	Name: function_71d28905
	Namespace: namespace_19c99142
	Checksum: 0xE750AA5B
	Offset: 0x3D90
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function function_71d28905(entity)
{
	return is_true(entity.var_5b358a38);
}

/*
	Name: function_7b84cb6a
	Namespace: namespace_19c99142
	Checksum: 0xD822AC97
	Offset: 0x3DC0
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function function_7b84cb6a(entity)
{
	function_35979cdd(entity);
}

/*
	Name: function_38f6cd8c
	Namespace: namespace_19c99142
	Checksum: 0x28774988
	Offset: 0x3DF0
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function function_38f6cd8c(entity)
{
	pain_update(entity);
}

/*
	Name: function_d9ab9fda
	Namespace: namespace_19c99142
	Checksum: 0x93A4BF9F
	Offset: 0x3E20
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function function_d9ab9fda(entity)
{
	function_fd74c2ff(entity);
}

/*
	Name: function_7fe60089
	Namespace: namespace_19c99142
	Checksum: 0xEDCEFF8C
	Offset: 0x3E50
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function function_7fe60089(entity)
{
	return is_true(entity.var_40994afa);
}

/*
	Name: function_33d6f18
	Namespace: namespace_19c99142
	Checksum: 0x596EA1E9
	Offset: 0x3E80
	Size: 0x8C
	Parameters: 1
	Flags: Linked
*/
function function_33d6f18(entity)
{
	function_35979cdd(entity);
	if(isplayer(entity.var_a41c7ae4))
	{
		level scoreevents::doscoreeventcallback("scoreEventZM", {#scoreevent:"disciple_mask_shot_off_zm", #attacker:entity.var_a41c7ae4});
	}
}

/*
	Name: function_6fec468f
	Namespace: namespace_19c99142
	Checksum: 0xBDACA6CF
	Offset: 0x3F18
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function function_6fec468f(entity)
{
	pain_update(entity);
}

/*
	Name: function_d01b93a
	Namespace: namespace_19c99142
	Checksum: 0xD606D255
	Offset: 0x3F48
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function function_d01b93a(entity)
{
	function_fd74c2ff(entity);
}

/*
	Name: set_head_model
	Namespace: namespace_19c99142
	Checksum: 0x7B14AB99
	Offset: 0x3F78
	Size: 0x17C
	Parameters: 4
	Flags: Linked
*/
function set_head_model(entity, damaged, var_12db14c5, var_6faf2e31)
{
	if(!isdefined(var_12db14c5))
	{
		var_12db14c5 = self.var_c07d2388;
	}
	if(!isdefined(damaged))
	{
		damaged = self.var_c07d2388 === #"hash_19947ae2c7a338bd";
	}
	var_bfabd025 = (damaged ? #"hash_19947ae2c7a338bd" : #"hash_199477e2c7a333a4");
	if(var_bfabd025 === #"hash_19947ae2c7a338bd")
	{
		if(is_true(var_6faf2e31))
		{
			entity clientfield::set("soaHeadGlowCF", 2);
		}
		else
		{
			entity clientfield::set("soaHeadGlowCF", 1);
		}
	}
	if(var_12db14c5 === var_bfabd025)
	{
		return;
	}
	if(isdefined(var_12db14c5))
	{
		entity detach(var_12db14c5);
	}
	self.var_c07d2388 = var_bfabd025;
	if(!entity isattached(self.var_c07d2388))
	{
		entity attach(self.var_c07d2388, "", 1);
	}
}

/*
	Name: function_c86ef1cd
	Namespace: namespace_19c99142
	Checksum: 0xE2AB347B
	Offset: 0x4100
	Size: 0x1DE
	Parameters: 1
	Flags: Linked
*/
function function_c86ef1cd(entity)
{
	/#
		if(is_true(entity.var_b1ee9658))
		{
			return true;
		}
	#/
	var_4d21f369 = function_da71e09a(entity);
	if(var_4d21f369 !== #"hash_6192d8af630c6c07" && var_4d21f369 !== #"hash_4ec3ec4f06b9498f")
	{
		return false;
	}
	var_bc1c3139 = function_a25a16fc(entity);
	if((5 - var_bc1c3139.size) <= 0)
	{
		return false;
	}
	if(entity flag::get(#"hash_1da8d7a8ea4456fe"))
	{
		return false;
	}
	function_1eaaceab(entity.var_4a8fb39d);
	var_6f5b42c8 = arraygetclosest(entity.origin, entity.var_4a8fb39d);
	var_a77b530e = 100;
	if(isdefined(var_6f5b42c8))
	{
		if(lengthsquared(var_6f5b42c8 getvelocity()) > lengthsquared(entity getvelocity()))
		{
			var_a77b530e = var_a77b530e + 100;
		}
		if(distancesquared(entity.origin, var_6f5b42c8.origin) < sqr(var_a77b530e))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_cc9102fc
	Namespace: namespace_19c99142
	Checksum: 0xDDC4D951
	Offset: 0x42E8
	Size: 0x26A
	Parameters: 1
	Flags: Linked
*/
function function_cc9102fc(entity)
{
	/#
		entity.var_28a576a2 = gettime() + getdvarfloat(#"hash_7d6060c0af754b38", 0);
	#/
	entity.var_26dc9a8a = [];
	var_bc1c3139 = function_a25a16fc(entity);
	var_24738af7 = 5 - var_bc1c3139.size;
	var_be5959b8 = 2000;
	if(isdefined(level.var_4206745e))
	{
		entity.var_26dc9a8a = array::get_all_closest(entity.origin, level.var_4206745e, var_bc1c3139, var_24738af7, 500);
		function_1eaaceab(entity.var_26dc9a8a);
		var_be5959b8 = var_be5959b8 + ((max(0, entity.var_26dc9a8a.size - 1)) * 2000);
		foreach(zombie in entity.var_26dc9a8a)
		{
			zombie ai::stun((float(var_be5959b8) / 1000) + 1);
			zombie flag::set(#"hash_335e103725141428");
		}
		if(isdefined(entity.var_26dc9a8a[0]))
		{
			entity.var_26dc9a8a[0] clientfield::set("soaBindProcessCF", 1);
		}
	}
	var_3d32e0f = 2000;
	if(var_bc1c3139.size === 0)
	{
		var_3d32e0f = var_3d32e0f * 0.25;
	}
	entity.var_9f171203 = gettime() + var_3d32e0f;
	entity.blockingpain = 1;
}

/*
	Name: function_690b6f24
	Namespace: namespace_19c99142
	Checksum: 0x88C3ED7
	Offset: 0x4560
	Size: 0x29A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_690b6f24(entity)
{
	if(isdefined(entity.var_26dc9a8a[0]))
	{
		var_c37b6517 = vectortoyaw(entity.var_26dc9a8a[0].origin - entity.origin);
		entity orientmode("face angle", var_c37b6517);
		yaw_diff = math::angle_dif(int(var_c37b6517), int(entity.angles[1]));
		var_454b9186 = 30;
		if(yaw_diff <= var_454b9186 && entity.var_4fbcec51 !== entity.var_26dc9a8a[0])
		{
			var_7c43328d = getweapon(#"hash_5c00a044827a0e2e");
			var_dd92dfed = entity getcentroid() + vectorscale((0, 0, 1), 20);
			var_ea644ea1 = getdvarfloat(#"hash_7f3203e297288dd0", 400);
			v_velocity = (vectornormalize((entity.var_26dc9a8a[0].origin - var_dd92dfed) + vectorscale((0, 0, 1), 50))) * var_ea644ea1;
			target = entity.var_26dc9a8a[0];
			var_5b61a3b6 = entity magicmissile(var_7c43328d, var_dd92dfed, v_velocity, target);
			if(isdefined(var_5b61a3b6))
			{
				playfxontag(#"hash_4dde54f0e04c117a", var_5b61a3b6, "tag_origin");
				var_5b61a3b6 playsound(#"hash_426d28088d47c4b");
				var_5b61a3b6 thread function_a95ee556(target);
			}
			entity.var_4fbcec51 = entity.var_26dc9a8a[0];
		}
	}
}

/*
	Name: function_a95ee556
	Namespace: namespace_19c99142
	Checksum: 0xDB46AB83
	Offset: 0x4808
	Size: 0x144
	Parameters: 1
	Flags: Linked, Private
*/
function private function_a95ee556(target)
{
	self endon(#"death");
	timeout = gettime() + (int(15 * 1000));
	while(isdefined(self) && isdefined(target) && gettime() < timeout && target flag::get(#"hash_335e103725141428"))
	{
		dist_threshold = getdvarfloat(#"hash_41aef1e31f496f99", 20);
		if(distancesquared(self.origin, target.origin + vectorscale((0, 0, 1), 50)) < sqr(dist_threshold))
		{
			self delete();
		}
		waitframe(1);
	}
	if(isdefined(self))
	{
		self delete();
	}
}

/*
	Name: function_fa692036
	Namespace: namespace_19c99142
	Checksum: 0x7EB7423D
	Offset: 0x4958
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function function_fa692036(entity)
{
	function_690b6f24(entity);
}

/*
	Name: function_1ae5d56a
	Namespace: namespace_19c99142
	Checksum: 0x1B4DA307
	Offset: 0x4988
	Size: 0x60
	Parameters: 2
	Flags: Linked
*/
function function_1ae5d56a(entity, asmstatename)
{
	animationstatenetworkutility::requeststate(entity, asmstatename);
	entity.blockingpain = 1;
	entity playsound(#"hash_1d00009d031c6635");
	return 5;
}

/*
	Name: function_78d5d69e
	Namespace: namespace_19c99142
	Checksum: 0xD466F20A
	Offset: 0x49F0
	Size: 0x190
	Parameters: 2
	Flags: Linked
*/
function function_78d5d69e(entity, asmstatename)
{
	/#
		if(gettime() < asmstatename.var_28a576a2)
		{
			return 5;
		}
	#/
	function_1eaaceab(asmstatename.var_26dc9a8a);
	if(asmstatename.var_26dc9a8a.size <= 0)
	{
		return 4;
	}
	function_690b6f24(asmstatename);
	if(gettime() > asmstatename.var_9f171203)
	{
		var_a4536440 = array::pop_front(asmstatename.var_26dc9a8a, 0);
		var_a4536440 ai::clear_stun();
		var_a4536440 flag::clear(#"hash_335e103725141428");
		var_a4536440 clientfield::set("soaBindProcessCF", 0);
		function_e8a2d39a(asmstatename, var_a4536440);
		var_7a337533 = 2000;
		if(asmstatename.var_9817f19a < 5)
		{
			var_7a337533 = 500;
		}
		asmstatename.var_9f171203 = gettime() + var_7a337533;
		if(isdefined(asmstatename.var_26dc9a8a[0]))
		{
			asmstatename.var_26dc9a8a[0] clientfield::set("soaBindProcessCF", 1);
		}
	}
	return 5;
}

/*
	Name: function_d27b2a9a
	Namespace: namespace_19c99142
	Checksum: 0xD7FEEA04
	Offset: 0x4B88
	Size: 0x130
	Parameters: 2
	Flags: Linked
*/
function function_d27b2a9a(entity, asmstatename)
{
	asmstatename.blockingpain = 0;
	foreach(zombie in asmstatename.var_26dc9a8a)
	{
		if(isdefined(zombie))
		{
			zombie ai::clear_stun();
			zombie flag::clear(#"hash_335e103725141428");
			zombie clientfield::set("soaBindProcessCF", 0);
		}
	}
	if(asmstatename.var_9817f19a >= 5)
	{
		asmstatename thread flag::set_for_time(10, #"hash_1da8d7a8ea4456fe");
	}
	return 4;
}

/*
	Name: function_e8a2d39a
	Namespace: namespace_19c99142
	Checksum: 0xAE8504F0
	Offset: 0x4CC0
	Size: 0xE4
	Parameters: 2
	Flags: Linked
*/
function function_e8a2d39a(entity, zombie)
{
	/#
		if(distance2dsquared(entity.origin, zombie.origin) > sqr(500))
		{
			println(#"hash_436a51e268fd55d" + zombie getentitynumber());
		}
	#/
	zombie function_6b68419c(entity);
	zombie callback::on_death(&function_5bb7560c);
	entity.var_276a8013[entity.var_276a8013.size] = zombie;
	entity.var_9817f19a++;
	return true;
}

/*
	Name: function_a25a16fc
	Namespace: namespace_19c99142
	Checksum: 0x3A30DC71
	Offset: 0x4DB0
	Size: 0x16
	Parameters: 1
	Flags: Linked
*/
function function_a25a16fc(entity)
{
	return entity.var_276a8013;
}

/*
	Name: query_all_possible_targets
	Namespace: namespace_19c99142
	Checksum: 0x88F66791
	Offset: 0x4DD0
	Size: 0x2D2
	Parameters: 0
	Flags: Linked, Private
*/
function private query_all_possible_targets()
{
	self endon(#"hash_e87dc146d0a8050");
	var_17b7891d = "2ee192f3d702f61f" + "query_all_possible_targets";
	self notify(var_17b7891d);
	self endon(var_17b7891d);
	while(true)
	{
		level.var_4206745e = [];
		potential_targets = getaiarchetypearray(#"zombie");
		if(!isdefined(potential_targets))
		{
			potential_targets = [];
		}
		var_cfbaa047 = getaiarchetypearray(#"tormentor");
		if(!isdefined(var_cfbaa047))
		{
			var_cfbaa047 = [];
		}
		potential_targets = arraycombine(potential_targets, var_cfbaa047);
		players = function_a1ef346b();
		foreach(target in potential_targets)
		{
			if(!is_true(target.completed_emerging_into_playable_area))
			{
				continue;
			}
			if(target function_dd070839())
			{
				continue;
			}
			if(is_true(target.var_a1b40ce9))
			{
				continue;
			}
			if(target.team !== level.zombie_team)
			{
				continue;
			}
			if(isdefined(players) && isdefined(players[0]))
			{
				closest_player = arraygetclosest(target.origin, players);
				if(!isdefined(closest_player.origin) || !isdefined(target.origin))
				{
					continue;
				}
				if(distancesquared(closest_player.origin, target.origin) < sqr(200))
				{
					continue;
				}
			}
			if(target flag::get(#"hash_335e103725141428"))
			{
				continue;
			}
			level.var_4206745e[level.var_4206745e.size] = target;
		}
		wait(1);
	}
}

/*
	Name: function_a55742e8
	Namespace: namespace_19c99142
	Checksum: 0xA00148D4
	Offset: 0x50B0
	Size: 0x33A
	Parameters: 0
	Flags: Linked, Private
*/
function private function_a55742e8()
{
	self endon(#"hash_e87dc146d0a8050");
	var_17b7891d = "1fa9689aaa1ba5bc" + "designate_preferred_soa_for_players";
	self notify(var_17b7891d);
	self endon(var_17b7891d);
	level.var_632f9a2e = [3:[], 2:[], 1:[], 0:[]];
	while(true)
	{
		var_68589f9a = getaiarchetypearray(#"soa");
		level.var_a81a9504 = var_68589f9a;
		players = getplayers();
		var_db920e6e = [3:[], 2:[], 1:[], 0:[]];
		foreach(soa in var_68589f9a)
		{
			if(isdefined(soa) && isplayer(soa.favoriteenemy))
			{
				var_3d0fbb56 = soa.favoriteenemy getentitynumber();
				if(isdefined(var_db920e6e[var_3d0fbb56]))
				{
					index = var_db920e6e[var_3d0fbb56].size;
					var_db920e6e[var_3d0fbb56][index] = soa;
				}
			}
			waitframe(1);
		}
		for(var_10f063e1 = 0; var_10f063e1 < var_db920e6e.size; var_10f063e1++)
		{
			if(!isdefined(players[var_10f063e1]))
			{
				continue;
			}
			function_1eaaceab(var_db920e6e[var_10f063e1]);
			var_db920e6e[var_10f063e1] = arraysortclosest(var_db920e6e[var_10f063e1], players[var_10f063e1].origin);
			var_d74c0b86 = 0;
			foreach(soa in var_db920e6e[var_10f063e1])
			{
				if(isdefined(soa))
				{
					soa.var_4d56625b = var_d74c0b86;
					soa.var_5b2fe31d = players[var_10f063e1];
					var_d74c0b86++;
				}
			}
		}
		level.var_632f9a2e = var_db920e6e;
		wait(1);
	}
}

/*
	Name: function_a64f7068
	Namespace: namespace_19c99142
	Checksum: 0x564F16F8
	Offset: 0x53F8
	Size: 0x134
	Parameters: 0
	Flags: Linked
*/
function function_a64f7068()
{
	if(!isdefined(level.var_632f9a2e))
	{
		return undefined;
	}
	players = getplayers();
	if(players.size <= 1)
	{
		return players[0];
	}
	var_58d7a9bf = undefined;
	var_b8f04a8e = -1;
	foreach(player in players)
	{
		var_3f461bc5 = level.var_632f9a2e[player getentitynumber()];
		if(isdefined(var_3f461bc5) && var_3f461bc5.size > var_b8f04a8e)
		{
			var_58d7a9bf = player;
			var_b8f04a8e = var_3f461bc5.size;
		}
	}
	return var_58d7a9bf;
}

/*
	Name: function_179244e9
	Namespace: namespace_19c99142
	Checksum: 0x247CB5DF
	Offset: 0x5538
	Size: 0xFC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_179244e9(entity)
{
	var_bc1c3139 = function_a25a16fc(entity);
	if((5 - var_bc1c3139.size) <= 0)
	{
		entity.var_4a8fb39d = [];
		return;
	}
	var_e4b11b8a = 900;
	var_e4b11b8a = var_e4b11b8a - (var_bc1c3139.size * 170);
	entity.var_4a8fb39d = array::get_all_closest(entity.origin, level.var_4206745e, var_bc1c3139, undefined, var_e4b11b8a);
	/#
		if(getdvarint(#"hash_20ead0e6e8e713d8", 0) > 0)
		{
			recordcircle(entity.origin, var_e4b11b8a, vectorscale((1, 1, 1), 0.2));
		}
	#/
}

/*
	Name: function_2ca0d658
	Namespace: namespace_19c99142
	Checksum: 0x7C765A92
	Offset: 0x5640
	Size: 0x166
	Parameters: 1
	Flags: Linked, Private
*/
function private function_2ca0d658(entity)
{
	function_1eaaceab(entity.var_276a8013);
	var_bc1c3139 = function_a25a16fc(entity);
	if(isdefined(entity.favoriteenemy))
	{
		var_bc1c3139 = arraysortclosest(var_bc1c3139, entity.favoriteenemy.origin);
	}
	entity.var_6017b1f7 = undefined;
	for(i = 0; i < var_bc1c3139.size; i++)
	{
		bound = var_bc1c3139[i];
		bound flag::clear(#"hash_66428e102eda132b");
		if(isdefined(entity.favoriteenemy) && i <= (var_bc1c3139.size / 2))
		{
			bound.var_ff3cbd9e = 1;
			if(i === 0)
			{
				bound flag::set(#"hash_66428e102eda132b");
				entity.var_6017b1f7 = bound;
			}
		}
		else
		{
			bound.var_ff3cbd9e = 0;
		}
		bound.var_bf2dba23 = i;
	}
}

/*
	Name: function_3d972f3
	Namespace: namespace_19c99142
	Checksum: 0xD4A7B7DE
	Offset: 0x57B0
	Size: 0x1B8
	Parameters: 1
	Flags: Linked
*/
function function_3d972f3(entity)
{
	level.var_7a4dc7e8[entity getentitynumber()] = undefined;
	var_bc1c3139 = function_a25a16fc(entity);
	if((5 - var_bc1c3139.size) <= 0)
	{
		return undefined;
	}
	if(!isdefined(entity.var_4a8fb39d))
	{
		return undefined;
	}
	foreach(target in entity.var_4a8fb39d)
	{
		if(!isdefined(target))
		{
			continue;
		}
		var_b4f61be8 = arraygetclosest(target.origin, level.var_7a4dc7e8);
		if(!isdefined(var_b4f61be8) || distance2dsquared(var_b4f61be8.origin, target.origin) > sqr(200))
		{
			level.var_7a4dc7e8[entity getentitynumber()] = {#origin:target.origin};
			return target;
		}
	}
	return undefined;
}

/*
	Name: function_85d7a413
	Namespace: namespace_19c99142
	Checksum: 0x79B75786
	Offset: 0x5970
	Size: 0x280
	Parameters: 2
	Flags: Linked
*/
function function_85d7a413(entity, target)
{
	/#
		/#
			assert(isdefined(target), "");
		#/
	#/
	target_player = undefined;
	if(isplayer(entity.favoriteenemy))
	{
		target_player = entity.favoriteenemy;
	}
	else
	{
		target_player = zm_utility::function_d7fedde2(entity);
	}
	if(!isdefined(target_player))
	{
		return true;
	}
	if(entity flag::get(#"hash_1da8d7a8ea4456fe"))
	{
		return false;
	}
	if(target_player flag::get(#"hash_60491982ef9b417f"))
	{
		return true;
	}
	to_player = target_player.origin - entity.origin;
	var_64ec1ea4 = target.origin - entity.origin;
	var_51fb6d83 = lengthsquared(to_player);
	if(target_player.origin !== entity.origin && target.origin !== entity.origin)
	{
		if(var_51fb6d83 < lengthsquared(var_64ec1ea4) && vectordot(vectornormalize(to_player), vectornormalize(var_64ec1ea4)) > 0.8660254)
		{
			return false;
		}
	}
	if(function_a25a16fc(entity).size === 0)
	{
		return true;
	}
	var_64ec1ea4 = (var_64ec1ea4[0], var_64ec1ea4[1], var_64ec1ea4[2] * 2);
	var_64ec1ea4 = var_64ec1ea4 * 0.5;
	var_efdfa449 = lengthsquared(var_64ec1ea4) / 1.5;
	if(var_51fb6d83 < var_efdfa449)
	{
		return false;
	}
	return true;
}

/*
	Name: function_3975c89d
	Namespace: namespace_19c99142
	Checksum: 0xDF003F54
	Offset: 0x5BF8
	Size: 0x156
	Parameters: 1
	Flags: Linked
*/
function function_3975c89d(entity)
{
	var_bc1c3139 = function_a25a16fc(entity);
	if(var_bc1c3139.size <= 0)
	{
		return;
	}
	function_1eaaceab(var_bc1c3139);
	foreach(zombie in var_bc1c3139)
	{
		zombie ai::stun(float(500) / 1000);
	}
	array::thread_all(var_bc1c3139, &util::delay, float(500) / 1000, undefined, &function_8f117c65);
	entity.var_276a8013 = [];
}

/*
	Name: function_d5ecd46a
	Namespace: namespace_19c99142
	Checksum: 0x49C94F4D
	Offset: 0x5D58
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function function_d5ecd46a(entity)
{
	level.var_7a4dc7e8[entity getentitynumber()] = undefined;
}

/*
	Name: function_da71e09a
	Namespace: namespace_19c99142
	Checksum: 0x20107114
	Offset: 0x5D90
	Size: 0x16
	Parameters: 1
	Flags: Linked
*/
function function_da71e09a(entity)
{
	return entity.var_75b76562;
}

/*
	Name: function_708afe1d
	Namespace: namespace_19c99142
	Checksum: 0x3663B16D
	Offset: 0x5DB0
	Size: 0x15E
	Parameters: 2
	Flags: Linked
*/
function function_708afe1d(entity, state)
{
	/#
		/#
			assert(isinarray([5:#"circle", 4:#"hash_110ee879f18b605f", 3:#"hash_685254f9ed0ce346", 2:#"hash_4ec3ec4f06b9498f", 1:#"chase", 0:#"hash_6192d8af630c6c07"], state), "");
		#/
	#/
	if(isdefined(entity.var_75b76562) && isdefined(entity.var_826cce6d[entity.var_75b76562]))
	{
		[[entity.var_826cce6d[entity.var_75b76562]]](entity);
	}
	entity.var_75b76562 = state;
	if(isdefined(entity.var_250ac321[state]))
	{
		[[entity.var_250ac321[state]]](entity);
	}
}

/*
	Name: function_6dc728a2
	Namespace: namespace_19c99142
	Checksum: 0x28CE859
	Offset: 0x5F18
	Size: 0x88
	Parameters: 3
	Flags: Linked
*/
function function_6dc728a2(entity, state, func)
{
	if(!isdefined(entity.var_250ac321))
	{
		entity.var_250ac321 = [];
	}
	else if(!isarray(entity.var_250ac321))
	{
		entity.var_250ac321 = array(entity.var_250ac321);
	}
	entity.var_250ac321[state] = func;
}

/*
	Name: function_82dc224a
	Namespace: namespace_19c99142
	Checksum: 0x64DE934C
	Offset: 0x5FA8
	Size: 0x88
	Parameters: 3
	Flags: Linked
*/
function function_82dc224a(entity, state, func)
{
	if(!isdefined(entity.var_826cce6d))
	{
		entity.var_826cce6d = [];
	}
	else if(!isarray(entity.var_826cce6d))
	{
		entity.var_826cce6d = array(entity.var_826cce6d);
	}
	entity.var_826cce6d[state] = func;
}

/*
	Name: function_38cf7fb8
	Namespace: namespace_19c99142
	Checksum: 0xF80376E2
	Offset: 0x6038
	Size: 0x72C
	Parameters: 1
	Flags: Linked
*/
function function_38cf7fb8(entity)
{
	var_4d21f369 = function_da71e09a(entity);
	switch(var_4d21f369)
	{
		case "chase":
		{
			if(function_3c14ef44(entity))
			{
				new_move_speed = "locomotion_speed_walk";
			}
			else
			{
				new_move_speed = "locomotion_speed_sprint";
				var_bc1c3139 = function_a25a16fc(entity);
				if(var_bc1c3139.size > 2 && !entity flag::get(#"hash_5c35337a4e15867"))
				{
					new_move_speed = "locomotion_speed_run";
				}
				if(isdefined(entity.favoriteenemy) && entity cansee(entity.favoriteenemy))
				{
					dist_sq = distancesquared(entity.origin, entity.favoriteenemy.origin);
					var_8b30afc5 = 150;
					var_15f8df68 = var_8b30afc5 - 25;
					if(dist_sq < sqr(var_15f8df68))
					{
						new_move_speed = "locomotion_speed_walk";
					}
					else if(dist_sq < sqr(var_8b30afc5))
					{
						new_move_speed = "locomotion_speed_run";
					}
					var_8d253a4b = function_881fda47(entity);
					if(var_bc1c3139.size > 4 && (entity.health / entity.maxhealth) > (var_8d253a4b - 0.05))
					{
						new_move_speed = "locomotion_speed_walk";
					}
					var_9d4d90db = 0;
					if(dist_sq > sqr(500) && entity.var_5b2fe31d === entity.favoriteenemy)
					{
						if(isdefined(level.var_632f9a2e[entity.favoriteenemy getentitynumber()][0]))
						{
							leader = level.var_632f9a2e[entity.favoriteenemy getentitynumber()][0];
							if(entity !== leader && distance2dsquared(entity.origin, leader.origin) < sqr(50))
							{
								var_9d4d90db = 1;
								new_move_speed = "locomotion_speed_walk";
							}
						}
					}
					if(var_bc1c3139.size > 1 && !var_9d4d90db)
					{
						var_a949cfbb = 1;
						foreach(bound in var_bc1c3139)
						{
							if(isdefined(bound) && (vectordot(bound.origin - entity.favoriteenemy.origin, entity.origin - entity.favoriteenemy.origin)) > 0)
							{
								var_ae33672a = math::closest_point_on_line(bound.origin, entity.origin, entity.favoriteenemy.origin);
								var_462633bf = distance2dsquared(bound.origin, var_ae33672a);
								if(var_462633bf < sqr(200))
								{
									var_a949cfbb = 0;
									break;
								}
							}
						}
						if(var_a949cfbb)
						{
							new_move_speed = "locomotion_speed_sprint";
						}
					}
				}
			}
			break;
		}
		case "hash_6192d8af630c6c07":
		{
			new_move_speed = "locomotion_speed_sprint";
			break;
		}
		case "hash_685254f9ed0ce346":
		{
			new_move_speed = "locomotion_speed_sprint";
			break;
		}
		case "hash_4ec3ec4f06b9498f":
		{
			new_move_speed = "locomotion_speed_walk";
			break;
		}
		case "circle":
		{
			new_move_speed = "locomotion_speed_run";
			break;
		}
	}
	if(isdefined(entity.var_acf89fbb))
	{
		new_move_speed = [[entity.var_acf89fbb]](entity, new_move_speed);
	}
	/#
		var_3700e49b = getdvarstring(#"hash_39b0926e73c73f6c", "");
		if(var_3700e49b !== "")
		{
			new_move_speed = var_3700e49b;
		}
	#/
	var_67328a14 = 1;
	if(!entity flag::get(#"sweeping"))
	{
		switch(var_4d21f369)
		{
			case "chase":
			{
				if(isdefined(entity.favoriteenemy))
				{
					to_enemy = entity.favoriteenemy.origin - entity.origin;
					forward_vec = anglestoforward(entity.angles);
					if(vectordot(to_enemy, forward_vec) < 0 && new_move_speed === "locomotion_speed_sprint")
					{
						var_67328a14 = 2;
					}
				}
				break;
			}
		}
		entity function_d7033ff(var_67328a14);
	}
	move_speed = entity getblackboardattribute("_locomotion_speed");
	if(isdefined(new_move_speed) && new_move_speed !== move_speed)
	{
		entity setblackboardattribute("_locomotion_speed", new_move_speed);
	}
}

/*
	Name: function_52ca7e05
	Namespace: namespace_19c99142
	Checksum: 0x1FB9CE21
	Offset: 0x6770
	Size: 0x162
	Parameters: 1
	Flags: Linked
*/
function function_52ca7e05(entity)
{
	if(entity flag::get(#"hash_f0028251a31e1fe") || (isdefined(entity.spawn_time) && (gettime() - entity.spawn_time) < (float(function_60d95f53()) / 1000)))
	{
		return 0;
	}
	var_4d21f369 = function_da71e09a(entity);
	if(var_4d21f369 === #"chase")
	{
		if(isdefined(entity.favoriteenemy) && distancesquared(entity.origin, entity.favoriteenemy.origin) < sqr(200) && entity cansee(entity.favoriteenemy))
		{
			entity clearpath();
			return 0;
		}
	}
	return btapi_locomotionbehaviorcondition(entity);
}

/*
	Name: function_b7623789
	Namespace: namespace_19c99142
	Checksum: 0x4E73AAE0
	Offset: 0x68E0
	Size: 0x24
	Parameters: 1
	Flags: Linked, Private
*/
function private function_b7623789(entity)
{
	function_38cf7fb8(entity);
}

/*
	Name: function_f10f6b15
	Namespace: namespace_19c99142
	Checksum: 0xF6C0B0D7
	Offset: 0x6910
	Size: 0x69A
	Parameters: 1
	Flags: Linked
*/
function function_f10f6b15(entity)
{
	if(!isdefined(entity.var_8196533))
	{
		entity.var_8196533 = 0;
	}
	var_d6d81c76 = (entity flag::get(#"hash_5c35337a4e15867") ? 200 : 100);
	var_493731bd = 15;
	var_b661d0e1 = getdvarfloat(#"hash_344d60ee9112a9ef", -1);
	if(var_b661d0e1 > 0)
	{
		entity.var_2e38a54d = var_b661d0e1;
		return;
	}
	if(gettime() < entity.var_8196533 || (isdefined(entity.var_78fdc8b4) && distance2dsquared(entity.var_78fdc8b4, entity.origin) < sqr(30)))
	{
		entity.var_2e38a54d = var_493731bd;
		return;
	}
	if(entity flag::get(#"hash_9f9406444a7e5b0"))
	{
		var_493731bd = 60;
	}
	else if(isdefined(entity.favoriteenemy))
	{
		delta_z = (entity.origin[2] - entity.var_5a0d79a4) - entity.favoriteenemy.origin[2];
		var_bbcca6fc = (entity flag::get(#"sweeping") ? 75 : 50);
		if(isdefined(entity.var_48615dc2))
		{
			var_bbcca6fc = [[entity.var_48615dc2]](entity, var_bbcca6fc);
		}
		if(abs(delta_z) > 250)
		{
			var_493731bd = 15;
		}
		else
		{
			var_493731bd = math::clamp(var_bbcca6fc - delta_z, 15, var_d6d81c76);
		}
	}
	if(is_true(entity.var_5d8eb698))
	{
		top_pos = entity getcentroid();
		entity.var_5d8eb698 = 0;
	}
	else
	{
		top_pos = entity geteye() + vectorscale((0, 0, 1), 5);
		entity.var_5d8eb698 = 1;
	}
	if(var_493731bd > 15 && length2dsquared(entity getvelocity()) > 0 && entity.var_5a0d79a4 > 10)
	{
		var_95f90063 = vectornormalize(entity getvelocity()) * 75;
		var_95f90063 = (var_95f90063[0], var_95f90063[1], 0);
		var_3396fda0 = bullettracepassed(top_pos, top_pos + var_95f90063, 0, entity);
		entity.var_78fdc8b4 = undefined;
		if(!var_3396fda0)
		{
			var_493731bd = 15;
			entity function_2aa322b7(3);
		}
		/#
			if(getdvarint(#"hash_20ead0e6e8e713d8", 0) > 0)
			{
				recordline(top_pos, top_pos + var_95f90063, (var_3396fda0 ? (0, 1, 0) : (1, 0, 0)));
			}
		#/
	}
	if(!isdefined(entity.var_c9738c9a))
	{
		entity.var_c9738c9a = 0;
	}
	if(var_493731bd > 15 && gettime() > entity.var_c9738c9a)
	{
		var_b18b5d80 = (entity geteye() - (0, 0, entity.var_5a0d79a4)) + (0, 0, var_493731bd) + vectorscale((0, 0, 1), 5);
		trace = bullettrace(top_pos, var_b18b5d80 + vectorscale((0, 0, 1), 70), 0, entity);
		var_3396fda0 = trace[#"fraction"] >= 1;
		if(!var_3396fda0)
		{
			var_b4d6bef6 = trace[#"position"][2] - top_pos[2];
			var_493731bd = max(var_493731bd - (max(60 - var_b4d6bef6, 0)), 15);
			entity.var_c9738c9a = gettime() + (int(0.5 * 1000));
			entity flag::set(#"hash_551edc835a4a0c30");
		}
		else
		{
			entity.var_c9738c9a = gettime() + (int(2 * 1000));
			entity flag::clear(#"hash_551edc835a4a0c30");
		}
		/#
			if(getdvarint(#"hash_20ead0e6e8e713d8", 0) > 0)
			{
				recordline(top_pos, var_b18b5d80 + vectorscale((0, 0, 1), 70), (var_3396fda0 ? (0, 1, 0) : (1, 0, 0)));
			}
		#/
	}
	entity.var_2e38a54d = var_493731bd;
}

/*
	Name: function_a6e66d26
	Namespace: namespace_19c99142
	Checksum: 0xDFED8AEC
	Offset: 0x6FB8
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function function_a6e66d26(entity)
{
	function_f10f6b15(entity);
}

/*
	Name: function_2aa322b7
	Namespace: namespace_19c99142
	Checksum: 0x85CD16D3
	Offset: 0x6FE8
	Size: 0x46
	Parameters: 1
	Flags: Linked
*/
function function_2aa322b7(time_s)
{
	self.var_8196533 = gettime() + (int(time_s * 1000));
	self.var_78fdc8b4 = self.origin;
}

/*
	Name: function_31c9342d
	Namespace: namespace_19c99142
	Checksum: 0x3262A180
	Offset: 0x7038
	Size: 0x9C
	Parameters: 0
	Flags: Linked
*/
function function_31c9342d()
{
	var_fe63ce8d = 0;
	self function_2aa322b7(3);
	projected_point = self.origin - (0, 0, self.var_5a0d79a4);
	if(!ispointonnavmesh(projected_point, self) || !zm_utility::check_point_in_playable_area(self.origin))
	{
		function_73f51fce(self);
	}
}

/*
	Name: function_73f51fce
	Namespace: namespace_19c99142
	Checksum: 0x99629E6E
	Offset: 0x70E0
	Size: 0x33C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_73f51fce(entity)
{
	projected_point = self.origin - (0, 0, self.var_5a0d79a4);
	forward_vec = anglestoforward(self.angles) * 100;
	predicted_pos = projected_point + forward_vec;
	var_53b2da60 = zombie_utility::function_d446de65(self, predicted_pos, 250);
	var_317aba1e = zm_utility::function_21f4ac36();
	if(!isdefined(var_53b2da60) || (var_317aba1e && !zm_utility::check_point_in_enabled_zone(var_53b2da60)))
	{
		predicted_pos = predicted_pos + forward_vec;
		var_53b2da60 = zombie_utility::function_d446de65(self, predicted_pos, 250);
	}
	if(!isdefined(var_53b2da60) || (var_317aba1e && !zm_utility::check_point_in_enabled_zone(var_53b2da60)))
	{
		var_4a8a44e8 = anglestoright(self.angles) * 100;
		predicted_pos = predicted_pos + var_4a8a44e8;
		var_53b2da60 = zombie_utility::function_d446de65(self, predicted_pos, 250);
		if(!isdefined(var_53b2da60) || (var_317aba1e && !zm_utility::check_point_in_enabled_zone(var_53b2da60)))
		{
			predicted_pos = predicted_pos - (var_4a8a44e8 * 2);
			var_53b2da60 = zombie_utility::function_d446de65(self, predicted_pos, 250);
		}
	}
	if(!isdefined(var_53b2da60))
	{
		spawn_point = self.spawn_point;
		if(!isdefined(spawn_point))
		{
			all_spawn_locations = struct::get_array("spawn_location", "script_noteworthy");
			if(isdefined(all_spawn_locations))
			{
				spawn_point = arraygetclosest(self.origin, all_spawn_locations);
			}
		}
		if(isdefined(spawn_point))
		{
			if(isdefined(spawn_point.zone_name) && isdefined(level.zones[spawn_point.zone_name].nodes))
			{
				var_59d51a1c = arraygetclosest(spawn_point.origin, level.zones[spawn_point.zone_name].nodes).origin;
			}
			if(isdefined(var_59d51a1c))
			{
				var_53b2da60 = zombie_utility::function_d446de65(self, var_59d51a1c, 250);
			}
		}
	}
	if(isdefined(var_53b2da60))
	{
		function_fc7356e3(self, var_53b2da60);
		return true;
	}
	return false;
}

/*
	Name: function_ca5c24db
	Namespace: namespace_19c99142
	Checksum: 0xB197FB1C
	Offset: 0x7428
	Size: 0xF4
	Parameters: 1
	Flags: Linked
*/
function function_ca5c24db(entity)
{
	if(!isdefined(entity.traversalendpos))
	{
		return;
	}
	var_4d21f369 = function_da71e09a(entity);
	if(var_4d21f369 === #"hash_110ee879f18b605f")
	{
		return;
	}
	entity.var_293428fc = entity.traversalendpos;
	if(isdefined(entity.traversemantlenode))
	{
		entity.var_293428fc = (entity.var_293428fc[0], entity.var_293428fc[1], max(entity.traversalendpos[2], entity.traversemantlenode.origin[2]));
	}
	function_708afe1d(entity, #"hash_110ee879f18b605f");
}

/*
	Name: function_5a2c32ca
	Namespace: namespace_19c99142
	Checksum: 0x44C8DC49
	Offset: 0x7528
	Size: 0x50
	Parameters: 1
	Flags: Linked
*/
function function_5a2c32ca(entity)
{
	var_4d21f369 = function_da71e09a(entity);
	if(var_4d21f369 === #"hash_110ee879f18b605f")
	{
		return true;
	}
	return false;
}

/*
	Name: function_5f116663
	Namespace: namespace_19c99142
	Checksum: 0x9641CA51
	Offset: 0x7580
	Size: 0x1E2
	Parameters: 1
	Flags: Linked
*/
function function_5f116663(entity)
{
	/#
		/#
			assert(isdefined(entity.var_293428fc), "");
		#/
	#/
	end_pos = entity.var_293428fc;
	delta_z = math::clamp(entity.origin[2] - end_pos[2], 0, 200);
	delta_z = delta_z * 0.5;
	end_pos = (end_pos[0], end_pos[1], end_pos[2] + delta_z);
	entity.var_d1669ee1 = {#start_angles:entity.angles, #hash_62224b05:entity getvelocity(), #start_time:gettime(), #delta_z:end_pos[2] - entity.origin[2], #hash_1a655500:length2d(end_pos - entity.origin), #length:length(end_pos - entity.origin), #goal:end_pos, #start:entity.origin};
	entity.var_67faa700 = 1;
}

/*
	Name: function_9db27415
	Namespace: namespace_19c99142
	Checksum: 0x2D9BEF61
	Offset: 0x7770
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function function_9db27415(entity)
{
	entity.var_67faa700 = 0;
	if(entity function_dd070839())
	{
		entity finishtraversal();
	}
}

/*
	Name: function_69e1fc18
	Namespace: namespace_19c99142
	Checksum: 0x35AF9A4A
	Offset: 0x77C0
	Size: 0x56
	Parameters: 5
	Flags: Linked
*/
function function_69e1fc18(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	mocompduration animmode("angle deltas noclip", 1);
	mocompduration.var_d30b4aa3 = 0;
}

/*
	Name: function_88023de5
	Namespace: namespace_19c99142
	Checksum: 0x3521679E
	Offset: 0x7820
	Size: 0x42C
	Parameters: 5
	Flags: Linked
*/
function function_88023de5(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	var_10160518 = mocompduration.var_d1669ee1;
	speed = max(function_cd4d42c4(length(var_10160518.var_62224b05)), 5);
	var_17075fc1 = var_10160518.goal - mocompduration.origin;
	var_eb7e4cf7 = (var_17075fc1[0], var_17075fc1[1], 0);
	var_19eb3ee6 = length(var_17075fc1);
	if(var_19eb3ee6 === 0)
	{
		return;
	}
	var_6450293d = min(speed, var_19eb3ee6);
	new_origin = mocompduration.origin;
	var_542007b8 = (gettime() - var_10160518.start_time) * (float(function_60d95f53()) / 1000);
	percentage = math::clamp(((var_542007b8 * speed) * 0.5) / mocompduration.var_d1669ee1.length, 0, 1);
	if(var_10160518.delta_z > 0)
	{
		percentage = easesine(percentage, 0, 1);
		new_origin = mocompduration.origin + (vectornormalize(var_17075fc1) * var_6450293d);
		var_74d0dd30 = var_10160518.start[2] + (var_10160518.delta_z * percentage);
		new_origin = (new_origin[0], new_origin[1], var_74d0dd30);
	}
	else
	{
		if(lengthsquared(var_eb7e4cf7) < sqr(var_10160518.var_1a655500) * 0.1)
		{
			new_origin = mocompduration.origin + (vectornormalize(var_17075fc1) * var_6450293d);
			var_74d0dd30 = new_origin[2];
		}
		else
		{
			new_origin = mocompduration.origin + (vectornormalize(var_eb7e4cf7) * var_6450293d);
			var_74d0dd30 = var_10160518.start[2];
			new_origin = (new_origin[0], new_origin[1], var_74d0dd30);
		}
	}
	mocompduration.var_d30b4aa3 = (var_74d0dd30 - mocompduration.origin[2]) / 20;
	new_angles = mocompduration.angles;
	if(var_19eb3ee6 > speed && isdefined(mocompduration.favoriteenemy))
	{
		to_enemy = mocompduration.favoriteenemy.origin - mocompduration.origin;
		new_angles = (0, vectortoyaw(to_enemy), 0);
		var_d771426a = anglelerp(mocompduration.angles[1], new_angles[1], 0.5);
		new_angles = (new_angles[0], var_d771426a, new_angles[2]);
	}
	mocompduration forceteleport(new_origin, new_angles, 0);
}

/*
	Name: function_fdde7e99
	Namespace: namespace_19c99142
	Checksum: 0xE27544FD
	Offset: 0x7C58
	Size: 0x54
	Parameters: 5
	Flags: Linked
*/
function function_fdde7e99(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	mocompduration function_66c86ed1(mocompduration.angles[1]);
}

/*
	Name: function_e4d60b47
	Namespace: namespace_19c99142
	Checksum: 0x7339ED92
	Offset: 0x7CB8
	Size: 0xBE
	Parameters: 1
	Flags: Linked
*/
function function_e4d60b47(entity)
{
	if(isdefined(entity.var_d1669ee1) && distance2dsquared(entity.origin, entity.var_d1669ee1.goal) < sqr(15) && (abs(entity.origin[2] - entity.var_d1669ee1.goal[2])) < 5)
	{
		return true;
	}
	return false;
}

/*
	Name: function_18936a77
	Namespace: namespace_19c99142
	Checksum: 0xDC68C6F5
	Offset: 0x7D80
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function function_18936a77(entity)
{
	if(function_e4d60b47(entity))
	{
		function_708afe1d(entity, #"chase");
	}
}

/*
	Name: function_fa0a3cc
	Namespace: namespace_19c99142
	Checksum: 0xA6FD99CD
	Offset: 0x7DD0
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function function_fa0a3cc(entity)
{
	entity finishtraversal();
}

/*
	Name: function_ca416ac3
	Namespace: namespace_19c99142
	Checksum: 0xE22F4ADB
	Offset: 0x7E00
	Size: 0xCC
	Parameters: 1
	Flags: Linked
*/
function function_ca416ac3(entity)
{
	var_4d21f369 = function_da71e09a(entity);
	if(var_4d21f369 === #"chase")
	{
		if(isdefined(entity.var_ea989fd2))
		{
			if(distance2dsquared(entity.origin, entity.var_ea989fd2.start_zipline.origin) < sqr(30))
			{
				return true;
			}
		}
	}
	if(isdefined(entity.var_1389a0b3))
	{
		return true;
	}
	return false;
}

/*
	Name: function_8b051aff
	Namespace: namespace_19c99142
	Checksum: 0x527B714C
	Offset: 0x7ED8
	Size: 0x5A
	Parameters: 5
	Flags: Linked
*/
function function_8b051aff(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	mocompduration animmode("angle deltas noclip", 1);
	mocompduration.var_5b6bf2e7 = 1;
}

/*
	Name: function_90db0e6d
	Namespace: namespace_19c99142
	Checksum: 0xB8985C44
	Offset: 0x7F40
	Size: 0xE4
	Parameters: 5
	Flags: Linked
*/
function function_90db0e6d(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	var_9fe419d0 = mocompduration.var_1389a0b3;
	speed = 10;
	var_17075fc1 = var_9fe419d0.var_b4a3c7c5.origin - mocompduration.origin;
	new_origin = mocompduration.origin + (vectornormalize(var_17075fc1) * speed);
	new_angles = (0, vectortoyaw(var_17075fc1), 0);
	mocompduration forceteleport(new_origin, new_angles, 0);
}

/*
	Name: function_d7a2a6d3
	Namespace: namespace_19c99142
	Checksum: 0x20AFB2AA
	Offset: 0x8030
	Size: 0x36
	Parameters: 5
	Flags: Linked
*/
function function_d7a2a6d3(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	mocompduration.var_5b6bf2e7 = 0;
}

/*
	Name: function_5b44f9c2
	Namespace: namespace_19c99142
	Checksum: 0xC3200D2D
	Offset: 0x8070
	Size: 0x68
	Parameters: 2
	Flags: Linked, Private
*/
function private function_5b44f9c2(entity, asmstatename)
{
	animationstatenetworkutility::requeststate(entity, asmstatename);
	if(!isdefined(entity.var_1389a0b3))
	{
		entity.var_1389a0b3 = entity.var_ea989fd2;
	}
	function_3975c89d(entity);
	return 5;
}

/*
	Name: function_b2314b9
	Namespace: namespace_19c99142
	Checksum: 0x621C5A04
	Offset: 0x80E0
	Size: 0x94
	Parameters: 2
	Flags: Linked, Private
*/
function private function_b2314b9(entity, asmstatename)
{
	if(!isdefined(asmstatename.var_1389a0b3))
	{
		return 4;
	}
	if(distance2dsquared(asmstatename.origin, asmstatename.var_1389a0b3.var_b4a3c7c5.origin) < sqr(30))
	{
		asmstatename.var_1389a0b3 = undefined;
		return 4;
	}
	return 5;
}

/*
	Name: function_8df98513
	Namespace: namespace_19c99142
	Checksum: 0x401BD46F
	Offset: 0x8180
	Size: 0x30
	Parameters: 2
	Flags: Linked, Private
*/
function private function_8df98513(entity, asmstatename)
{
	asmstatename clearpath();
	return 4;
}

/*
	Name: function_82f2b2fd
	Namespace: namespace_19c99142
	Checksum: 0x21050BF1
	Offset: 0x81B8
	Size: 0x10E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_82f2b2fd(entity)
{
	self endon(#"death");
	while(true)
	{
		var_30b7a63c = entity predictpath();
		status = var_30b7a63c[#"path_prediction_status"];
		if(status === 2)
		{
			entity flag::set(#"hash_5c35337a4e15867");
		}
		else
		{
			entity flag::clear(#"hash_5c35337a4e15867");
		}
		entity waittill(#"goal", #"goal_changed", #"path_set", #"pathfind_result");
		waitframe(1);
	}
}

/*
	Name: function_efa1ad6b
	Namespace: namespace_19c99142
	Checksum: 0x15668B52
	Offset: 0x82D0
	Size: 0xB8
	Parameters: 1
	Flags: Linked
*/
function function_efa1ad6b(entity)
{
	self endon(#"death");
	while(true)
	{
		entity waittill(#"bad_path");
		if(zm_utility::function_21f4ac36() && !zm_utility::check_point_in_enabled_zone(entity.origin) && !entity flag::get(#"sweeping"))
		{
			entity function_73f51fce(entity);
		}
	}
}

/*
	Name: function_71cc3e18
	Namespace: namespace_19c99142
	Checksum: 0x3F8A17C0
	Offset: 0x8390
	Size: 0x2CE
	Parameters: 1
	Flags: Linked, Private
*/
function private function_71cc3e18(entity)
{
	if(!getdvarint(#"hash_211f17b04bbe885b", 1) > 0)
	{
		return false;
	}
	if(!entity flag::get(#"hash_5c35337a4e15867"))
	{
		return false;
	}
	var_4d21f369 = function_da71e09a(entity);
	if(var_4d21f369 !== #"chase" && var_4d21f369 !== #"hash_6192d8af630c6c07")
	{
		return false;
	}
	if(!isdefined(entity.favoriteenemy))
	{
		return false;
	}
	if(isplayer(entity.favoriteenemy) && (entity.favoriteenemy flag::get(#"hash_6068b3318465d") || entity.favoriteenemy flag::get(#"hash_60491982ef9b417f")))
	{
		return false;
	}
	if(isdefined(self.var_d690f304) && !is_true([[self.var_d690f304]](self, entity.favoriteenemy)))
	{
		return false;
	}
	var_1f1f9cfa = entity function_4794d6a3();
	if(isdefined(var_1f1f9cfa.goalpos))
	{
		var_9da7f6e5 = 800;
		var_bc1c3139 = function_a25a16fc(entity);
		if(var_bc1c3139.size === 0)
		{
			var_9da7f6e5 = 600;
		}
		if(var_4d21f369 === #"hash_6192d8af630c6c07")
		{
			var_9da7f6e5 = var_9da7f6e5 * 0.5;
		}
		if(entity flag::get(#"hash_63058c3bf14d7177"))
		{
			var_9da7f6e5 = var_9da7f6e5 * 0.5;
		}
		if(isdefined(entity.var_3ab5f48b) && (gettime() - entity.var_3ab5f48b) < 1000)
		{
			var_9da7f6e5 = var_9da7f6e5 * 0.5;
		}
		if(distance2dsquared(var_1f1f9cfa.goalpos, entity.origin) < sqr(var_9da7f6e5))
		{
			return false;
		}
	}
	return true;
}

/*
	Name: function_31a8422e
	Namespace: namespace_19c99142
	Checksum: 0x8F093B5
	Offset: 0x8668
	Size: 0x1A2
	Parameters: 2
	Flags: Linked, Private
*/
function private function_31a8422e(entity, asmstatename)
{
	animationstatenetworkutility::requeststate(entity, asmstatename);
	entity.var_e63c4261 = gettime() + (int(4 * 1000));
	entity flag::set(#"sweeping");
	entity playsound(#"hash_1cd98685e43fce1a");
	entity function_d7033ff(3);
	entity flag::clear(#"hash_7ff4499cadec6ebb");
	if(isplayer(entity.favoriteenemy))
	{
		entity.favoriteenemy thread flag::set_for_time(2, #"hash_6068b3318465d");
	}
	entity.var_81d8adf = gettime() + (int(0.5 * 1000));
	entity.var_be4b6d94 = int(vectortoyaw(anglestoforward(entity.angles)));
	entity.blockingpain = 1;
	return 5;
}

/*
	Name: function_6965f1e3
	Namespace: namespace_19c99142
	Checksum: 0x2F6142E1
	Offset: 0x8818
	Size: 0x12A
	Parameters: 2
	Flags: Linked, Private
*/
function private function_6965f1e3(entity, asmstatename)
{
	if(gettime() > asmstatename.var_e63c4261)
	{
		return 4;
	}
	if(isdefined(asmstatename.favoriteenemy))
	{
		var_8ebe7c9f = 200;
		if(distance2dsquared(asmstatename.origin, asmstatename.favoriteenemy.origin) < sqr(var_8ebe7c9f))
		{
			return 4;
		}
	}
	var_1288d4ef = int(vectortoyaw(anglestoforward(asmstatename.angles)));
	if(gettime() > asmstatename.var_81d8adf)
	{
		if(math::angle_dif(var_1288d4ef, asmstatename.var_be4b6d94) > 15)
		{
			return 4;
		}
	}
	asmstatename.var_be4b6d94 = var_1288d4ef;
	return 5;
}

/*
	Name: function_9769881
	Namespace: namespace_19c99142
	Checksum: 0x9B3D3961
	Offset: 0x8950
	Size: 0x5A
	Parameters: 2
	Flags: Linked, Private
*/
function private function_9769881(entity, asmstatename)
{
	asmstatename flag::clear(#"sweeping");
	asmstatename function_d7033ff(1);
	asmstatename.blockingpain = 0;
	return 4;
}

/*
	Name: function_ff6a04bc
	Namespace: namespace_19c99142
	Checksum: 0xD01AFC40
	Offset: 0x89B8
	Size: 0x3A2
	Parameters: 1
	Flags: Linked
*/
function function_ff6a04bc(entity)
{
	if(!isdefined(entity.favoriteenemy))
	{
		return false;
	}
	if(entity.var_cdc5412 < 1)
	{
		return false;
	}
	if(entity flag::get(#"sweeping"))
	{
		return false;
	}
	if(!isdefined(entity.var_513787f6) || (gettime() - entity.var_513787f6) > 500)
	{
		return false;
	}
	if(!entity cansee(entity.favoriteenemy))
	{
		return false;
	}
	entity.var_cdc5412--;
	var_79c8d3ac = undefined;
	var_23876531 = entity.favoriteenemy.origin - entity.origin;
	var_4892db1b = length(var_23876531);
	if(var_4892db1b < 300)
	{
		return false;
	}
	var_b629d106 = vectornormalize(var_23876531);
	var_8ebe7c9f = 200;
	var_2dc610d5 = entity.origin + (var_b629d106 * (var_4892db1b - var_8ebe7c9f));
	var_2dc610d5 = (var_2dc610d5[0], var_2dc610d5[1], entity.favoriteenemy.origin[2]);
	var_4669dbc4 = zombie_utility::function_d446de65(entity, var_2dc610d5, 100);
	if(isdefined(var_4669dbc4))
	{
		var_79c8d3ac = var_4669dbc4;
	}
	else
	{
		var_ee604c66 = entity.favoriteenemy.origin;
		var_2fa1aef8 = zombie_utility::function_d446de65(entity, var_ee604c66, 100);
		if(isdefined(var_2fa1aef8))
		{
			var_79c8d3ac = var_2fa1aef8;
		}
	}
	/#
		if(getdvarint(#"hash_20ead0e6e8e713d8", 0) > 0)
		{
			if(isdefined(var_2dc610d5))
			{
				function_ae63c292(var_2dc610d5, "", (1, 1, 0));
			}
			if(isdefined(var_ee604c66))
			{
				function_ae63c292(var_ee604c66, "", (1, 1, 0));
			}
		}
	#/
	if(!isdefined(var_79c8d3ac))
	{
		/#
			/#
				if(is_true(level.var_a2c1c3a5))
				{
					println("" + "");
				}
			#/
		#/
		return false;
	}
	entity.var_a6d2562d = 1;
	entity.var_8cdffa65 = {#hash_62224b05:entity getvelocity(), #dist:distance(entity.origin, var_79c8d3ac), #end_pos:var_79c8d3ac, #start_pos:entity.origin};
	return true;
}

/*
	Name: function_fc7356e3
	Namespace: namespace_19c99142
	Checksum: 0xE4709042
	Offset: 0x8D68
	Size: 0xAE
	Parameters: 2
	Flags: Linked
*/
function function_fc7356e3(entity, var_79c8d3ac)
{
	entity.var_a6d2562d = 1;
	entity.var_8cdffa65 = {#hash_62224b05:entity getvelocity(), #dist:distance(entity.origin, var_79c8d3ac), #end_pos:var_79c8d3ac, #start_pos:entity.origin};
}

/*
	Name: function_77c135e2
	Namespace: namespace_19c99142
	Checksum: 0x4E4BA95A
	Offset: 0x8E20
	Size: 0x66
	Parameters: 1
	Flags: Linked, Private
*/
function private function_77c135e2(entity)
{
	if(!getdvarint(#"hash_211f17b04bbe885b", 1) > 0)
	{
		return false;
	}
	if(!is_true(entity.var_a6d2562d))
	{
		return false;
	}
	return true;
}

/*
	Name: function_f98327eb
	Namespace: namespace_19c99142
	Checksum: 0xEA214A28
	Offset: 0x8E90
	Size: 0x7E
	Parameters: 2
	Flags: Linked, Private
*/
function private function_f98327eb(entity, asmstatename)
{
	animationstatenetworkutility::requeststate(entity, asmstatename);
	entity flag::set(#"sweeping");
	entity flag::set(#"hash_71f6b0692dd1ef");
	entity.blockingpain = 1;
	return 5;
}

/*
	Name: function_1a0791fc
	Namespace: namespace_19c99142
	Checksum: 0xFB454A3D
	Offset: 0x8F18
	Size: 0x90
	Parameters: 2
	Flags: Linked, Private
*/
function private function_1a0791fc(entity, asmstatename)
{
	if(!isdefined(asmstatename.var_8cdffa65))
	{
		return 4;
	}
	var_79c8d3ac = asmstatename.var_8cdffa65.end_pos;
	if(distance2dsquared(asmstatename.origin, var_79c8d3ac) < sqr(15))
	{
		return 4;
	}
	return 5;
}

/*
	Name: function_3e895403
	Namespace: namespace_19c99142
	Checksum: 0x5341C7D7
	Offset: 0x8FB0
	Size: 0xE2
	Parameters: 2
	Flags: Linked, Private
*/
function private function_3e895403(entity, asmstatename)
{
	asmstatename flag::clear(#"sweeping");
	if(isdefined(asmstatename.var_8cdffa65))
	{
		var_79c8d3ac = asmstatename.var_8cdffa65.end_pos;
		if(distance2dsquared(asmstatename.origin, var_79c8d3ac) < sqr(15))
		{
			asmstatename.var_a6d2562d = 0;
		}
	}
	if(!isdefined(asmstatename.var_8cdffa65))
	{
		asmstatename.var_a6d2562d = 0;
	}
	asmstatename clearpath();
	asmstatename.blockingpain = 0;
	return 4;
}

/*
	Name: function_f4e85274
	Namespace: namespace_19c99142
	Checksum: 0x62F375B3
	Offset: 0x90A0
	Size: 0xB2
	Parameters: 5
	Flags: Linked
*/
function function_f4e85274(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	mocompduration animmode("angle deltas noclip", 1);
	mocompduration.var_5b6bf2e7 = 1;
	mocompduration.var_c53ce8cb = 0;
	if(isdefined(mocompduration.var_8cdffa65))
	{
		mocompduration.var_c53ce8cb = function_cd4d42c4(length(mocompduration.var_8cdffa65.var_62224b05));
	}
}

/*
	Name: function_3b5becd0
	Namespace: namespace_19c99142
	Checksum: 0xC15A88DA
	Offset: 0x9160
	Size: 0x1F4
	Parameters: 5
	Flags: Linked
*/
function function_3b5becd0(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	if(!isdefined(mocompduration.var_8cdffa65))
	{
		return;
	}
	var_79c8d3ac = mocompduration.var_8cdffa65.end_pos;
	var_17075fc1 = var_79c8d3ac - mocompduration.origin;
	var_19eb3ee6 = length(var_17075fc1);
	speed = mocompduration.var_c53ce8cb;
	target_speed = 20;
	if(var_19eb3ee6 < min(100, mocompduration.var_8cdffa65.dist * 0.5))
	{
		target_speed = 15;
	}
	sign = math::sign(target_speed - speed);
	if(sign >= 1)
	{
		speed = speed + 1.5;
	}
	else if(sign < 0)
	{
		speed = speed - 2;
	}
	speed = min(speed, var_19eb3ee6);
	mocompduration.var_c53ce8cb = speed;
	new_origin = mocompduration.origin + (vectornormalize(var_17075fc1) * speed);
	new_angles = (0, vectortoyaw(var_17075fc1), 0);
	mocompduration forceteleport(new_origin, new_angles, 0);
}

/*
	Name: function_80985f6
	Namespace: namespace_19c99142
	Checksum: 0x1ED1CF28
	Offset: 0x9360
	Size: 0x36
	Parameters: 5
	Flags: Linked
*/
function function_80985f6(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	mocompduration.var_5b6bf2e7 = 0;
}

/*
	Name: function_cd4d42c4
	Namespace: namespace_19c99142
	Checksum: 0x2484E0D0
	Offset: 0x93A0
	Size: 0x16
	Parameters: 1
	Flags: Linked, Private
*/
function private function_cd4d42c4(var_1e74aaf8)
{
	return var_1e74aaf8 / 20;
}

/*
	Name: function_b046be53
	Namespace: namespace_19c99142
	Checksum: 0xBB7D53ED
	Offset: 0x93C0
	Size: 0x57C
	Parameters: 1
	Flags: Linked
*/
function function_b046be53(entity)
{
	if(!isdefined(entity.favoriteenemy))
	{
		return;
	}
	var_1f1f9cfa = entity function_4794d6a3();
	if(entity flag::get(#"hash_7d6cd50c56c9ce7c") || (isdefined(var_1f1f9cfa.goalpos) && distance2dsquared(entity.origin, var_1f1f9cfa.goalpos) < sqr(40)))
	{
		var_2cfb4597 = entity.origin - entity.favoriteenemy.origin;
		var_edd2d153 = vectortoyaw(var_2cfb4597);
		angle_offset = 30;
		angle_offsets = [1:angle_offset * -1, 0:angle_offset];
		var_5c85bc30 = [];
		var_bdca7c56 = 100;
		if((entity getentitynumber() % 2) == 0)
		{
			var_bdca7c56 = var_bdca7c56 + 50;
		}
		foreach(angle in angle_offsets)
		{
			var_43ed722a = absangleclamp360(var_edd2d153 + angle);
			target_vec = anglestoforward((0, var_43ed722a, 0));
			target_pos = entity.favoriteenemy.origin + (target_vec * var_bdca7c56);
			var_c38ec8b1 = getclosestpointonnavmesh(target_pos, 64, entity getpathfindingradius());
			if(isdefined(var_c38ec8b1))
			{
				var_5c85bc30[var_5c85bc30.size] = var_c38ec8b1;
			}
		}
		var_e3a26bf0 = undefined;
		if(entity flag::get(#"hash_7d6cd50c56c9ce7c"))
		{
			entity flag::clear(#"hash_7d6cd50c56c9ce7c");
			if(!isdefined(entity.favoriteenemy.var_d7be8ef6))
			{
				entity.favoriteenemy.var_d7be8ef6 = 1;
			}
			entity.favoriteenemy.var_d7be8ef6 = entity.favoriteenemy.var_d7be8ef6 * -1;
			entity.favoriteenemy flag::toggle(#"hash_3075b8c61785d706");
			if(entity.favoriteenemy flag::get(#"hash_3075b8c61785d706"))
			{
				var_e3a26bf0 = (isdefined(var_5c85bc30[1]) ? var_5c85bc30[1] : var_5c85bc30[0]);
			}
			else
			{
				var_e3a26bf0 = var_5c85bc30[0];
			}
		}
		else
		{
			var_9da770d9 = 0;
			var_e1aa7e8 = undefined;
			forward_vec = entity getvelocity();
			foreach(pos in var_5c85bc30)
			{
				var_2872f5ac = pos - entity.origin;
				dot = vectordot(var_2872f5ac, forward_vec);
				if(dot > 0)
				{
					var_e3a26bf0 = pos;
				}
				if(!isdefined(var_e1aa7e8))
				{
					var_e1aa7e8 = dot;
				}
				if(math::sign(dot) != math::sign(var_e1aa7e8))
				{
					var_9da770d9 = 1;
				}
				var_e1aa7e8 = dot;
			}
		}
		if(!isdefined(var_e3a26bf0) && var_5c85bc30.size > 0)
		{
			var_e3a26bf0 = var_5c85bc30[randomint(var_5c85bc30.size)];
		}
		if(isdefined(var_e3a26bf0))
		{
			entity setgoal(var_e3a26bf0);
		}
	}
}

/*
	Name: function_d1293a5a
	Namespace: namespace_19c99142
	Checksum: 0xC836B3C8
	Offset: 0x9948
	Size: 0x58
	Parameters: 1
	Flags: Linked
*/
function function_d1293a5a(entity)
{
	if(!isdefined(entity.favoriteenemy) || function_3c14ef44(entity) || function_52ca7e05(entity))
	{
		return false;
	}
	return true;
}

/*
	Name: function_25517868
	Namespace: namespace_19c99142
	Checksum: 0x86790B88
	Offset: 0x99A8
	Size: 0x10E
	Parameters: 1
	Flags: Linked
*/
function function_25517868(entity)
{
	var_b859defb = !isdefined(entity.favoriteenemy);
	var_131462f5 = 0;
	var_bd9572c6 = 0;
	if(!var_b859defb)
	{
		if(distancesquared(entity.origin, entity.favoriteenemy.origin) > sqr(225))
		{
			var_131462f5 = 1;
		}
		if(!entity.favoriteenemy flag::get(#"hash_60491982ef9b417f") && !function_b003534e(entity, 100))
		{
			var_bd9572c6 = 1;
		}
	}
	if(var_b859defb || var_131462f5 || var_bd9572c6)
	{
		return true;
	}
	return false;
}

/*
	Name: function_71d2268d
	Namespace: namespace_19c99142
	Checksum: 0xC812F745
	Offset: 0x9AC0
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function function_71d2268d(entity)
{
	entity flag::set(#"hash_7d6cd50c56c9ce7c");
}

/*
	Name: function_5d447a73
	Namespace: namespace_19c99142
	Checksum: 0x7F5F061A
	Offset: 0x9AF8
	Size: 0x1A6
	Parameters: 0
	Flags: Linked, Private
*/
function private function_5d447a73()
{
	var_4d21f369 = function_da71e09a(self);
	if(var_4d21f369 === #"hash_110ee879f18b605f")
	{
		if(isdefined(self.var_d1669ee1))
		{
			to_goal = self.var_d1669ee1.goal - self.origin;
			var_64e52c8e = int(vectortoyaw(to_goal));
			diff = var_64e52c8e - int(self.var_d1669ee1.start_angles[1]);
			if(abs(diff) < 5)
			{
				diff = 0;
			}
			return diff;
		}
	}
	else if(var_4d21f369 === #"hash_685254f9ed0ce346")
	{
		if(isdefined(self.var_63a0699f))
		{
			to_goal = self.var_63a0699f.goal - self.origin;
			var_64e52c8e = int(vectortoyaw(to_goal));
			diff = var_64e52c8e - int(self.angles[1]);
			return diff;
		}
	}
	return self.var_55a3f1d3;
}

/*
	Name: function_1a63a646
	Namespace: namespace_19c99142
	Checksum: 0xA4BD5581
	Offset: 0x9CA8
	Size: 0xA
	Parameters: 0
	Flags: Linked, Private
*/
function private function_1a63a646()
{
	return self.var_d30b4aa3;
}

/*
	Name: function_718c627d
	Namespace: namespace_19c99142
	Checksum: 0x7910E1CC
	Offset: 0x9CC0
	Size: 0x76
	Parameters: 1
	Flags: Linked, Private
*/
function private function_718c627d(entity)
{
	entity.ai.var_798e85cd = (isdefined(entity.ai.var_7979fbb2) ? entity.ai.var_7979fbb2 : 0);
	entity.ai.var_7979fbb2 = entity function_144f21ef();
	return true;
}

/*
	Name: function_f5f0b614
	Namespace: namespace_19c99142
	Checksum: 0x37A3B781
	Offset: 0x9D40
	Size: 0xC2
	Parameters: 1
	Flags: Linked, Private
*/
function private function_f5f0b614(entity)
{
	if(!(isdefined(entity.ai.var_798e85cd) && isdefined(entity.ai.var_798e85cd)))
	{
		return false;
	}
	diff = math::angle_dif(int(entity.ai.var_798e85cd), int(entity.ai.var_7979fbb2));
	if(abs(diff) > 60)
	{
		return true;
	}
	return false;
}

/*
	Name: function_6d6bd946
	Namespace: namespace_19c99142
	Checksum: 0x247735FF
	Offset: 0x9E10
	Size: 0x36
	Parameters: 1
	Flags: Linked, Private
*/
function private function_6d6bd946(entity)
{
	return getdvarint(#"hash_191681a8103230c9", 1) > 0;
}

/*
	Name: function_47f3f527
	Namespace: namespace_19c99142
	Checksum: 0x3F41FA3D
	Offset: 0x9E50
	Size: 0x7A8
	Parameters: 1
	Flags: Linked
*/
function function_47f3f527(entity)
{
	/#
		if(!getdvarint(#"hash_2a0f529024f09738", 1) > 0)
		{
			return false;
		}
	#/
	if(!isplayer(entity.favoriteenemy))
	{
		return false;
	}
	if(entity flag::get(#"hash_551edc835a4a0c30"))
	{
		return false;
	}
	var_91459622 = 0;
	if(function_4cc12c9(entity))
	{
		if(entity.var_4d56625b !== 0)
		{
			var_91459622 = 1;
		}
	}
	if(!entity flag::get(#"hash_7ff4499cadec6ebb") && !var_91459622)
	{
		return false;
	}
	if(entity function_dd070839())
	{
		return false;
	}
	if(entity.team !== level.zombie_team)
	{
		return false;
	}
	var_4fa84b3f = function_4fa84b3f(entity, 3);
	var_87c702eb = function_a25a16fc(entity).size;
	if(!var_4fa84b3f && var_87c702eb <= 1 && entity.var_4d56625b < 2 && getdvarint(#"hash_137e2f2e88299f9c", 1) > 0)
	{
		return false;
	}
	if(isdefined(entity.var_2c400759) && (entity.var_2c400759 + (int(4 * 1000))) > gettime())
	{
		return false;
	}
	if(isdefined(entity.var_fd7ccb7d) && (entity.var_fd7ccb7d + (int(3 * 1000))) > gettime())
	{
		return false;
	}
	if(!isdefined(level.var_c9a650e3))
	{
		level.var_c9a650e3 = 0;
	}
	var_1556c25 = getlevelframenumber();
	if(level.var_c9a650e3 === var_1556c25)
	{
		return false;
	}
	level.var_c9a650e3 = var_1556c25;
	if(!entity cansee(entity.favoriteenemy))
	{
		entity.var_fd7ccb7d = gettime();
		return false;
	}
	if(!isdefined(level.var_a522353f))
	{
		level.var_a522353f = [];
	}
	var_778aa7d8 = arraygetclosest(entity.favoriteenemy.origin, level.var_a522353f);
	var_f2723316 = 200;
	if(isdefined(var_778aa7d8) && distancesquared(var_778aa7d8.origin, entity.favoriteenemy.origin) < sqr(var_f2723316))
	{
		var_c202a406 = var_778aa7d8.spots;
	}
	else
	{
		var_c202a406 = function_6aee3a5b(entity, entity.favoriteenemy);
	}
	if(!isdefined(var_c202a406) || var_c202a406.size === 0)
	{
		entity.var_fd7ccb7d = gettime();
		return false;
	}
	var_c202a406 = array::slice(var_c202a406, 0, 20, 1);
	if(var_c202a406.size === 0)
	{
		entity.var_fd7ccb7d = gettime();
		return false;
	}
	level.var_a522353f[level.var_a522353f.size] = {#origin:entity.favoriteenemy.origin, #spots:var_c202a406};
	if(level.var_a522353f.size > 15)
	{
		level.var_a522353f = array::slice(level.var_a522353f, 5, 14);
	}
	var_c202a406 = function_72d3bca6(var_c202a406, entity.origin, undefined, 200);
	if(!isdefined(level.var_24c45d5f))
	{
		level.var_24c45d5f = [];
	}
	function_1eaaceab(level.var_24c45d5f);
	for(i = 0; i < level.var_24c45d5f.size; i++)
	{
		if(var_c202a406.size === 0)
		{
			entity.var_fd7ccb7d = gettime();
			return false;
		}
		var_62a60152 = level.var_24c45d5f[i];
		var_c202a406 = function_72d3bca6(var_c202a406, function_60ddd10a(var_62a60152), undefined, 200);
	}
	for(i = 0; isdefined(entity.var_5f8bc332) && i < entity.var_5f8bc332.size; i++)
	{
		if(var_c202a406.size === 0)
		{
			entity.var_fd7ccb7d = gettime();
			return false;
		}
		var_8df7be5c = entity.var_5f8bc332[i];
		var_c202a406 = function_72d3bca6(var_c202a406, var_8df7be5c, undefined, 200);
	}
	if(isdefined(var_c202a406[0]))
	{
		z_offset = vectorscale((0, 0, 1), 50);
		end = (var_c202a406[0].origin + z_offset) + ((vectornormalize(entity.favoriteenemy.origin - var_c202a406[0].origin)) * 200);
		var_3396fda0 = bullettracepassed(var_c202a406[0].origin + z_offset, end, 0, entity);
		/#
			recordline(var_c202a406[0].origin + z_offset, end, (var_3396fda0 ? (0, 1, 0) : (1, 0, 0)));
		#/
		if(var_3396fda0)
		{
			entity.var_56877baf = var_c202a406[0].origin;
			level.var_24c45d5f[level.var_24c45d5f.size] = entity;
			return true;
		}
	}
	entity.var_fd7ccb7d = gettime();
	return false;
}

/*
	Name: function_6aee3a5b
	Namespace: namespace_19c99142
	Checksum: 0x132CED01
	Offset: 0xA600
	Size: 0x8A
	Parameters: 2
	Flags: Linked, Private
*/
function private function_6aee3a5b(entity, player)
{
	var_b1f9c3ce = tacticalquery(#"hash_4b13225320d15d22", entity.origin, player.origin + (0, 0, player getplayerviewheight()), entity, player.origin, vectorscale((0, 0, -1), 5000));
	return var_b1f9c3ce;
}

/*
	Name: function_60ddd10a
	Namespace: namespace_19c99142
	Checksum: 0xE0399530
	Offset: 0xA698
	Size: 0x32
	Parameters: 1
	Flags: Linked
*/
function function_60ddd10a(entity)
{
	if(!isdefined(entity.var_56877baf))
	{
		return entity.origin;
	}
	return entity.var_56877baf;
}

/*
	Name: function_fc775f13
	Namespace: namespace_19c99142
	Checksum: 0x19E595BB
	Offset: 0xA6D8
	Size: 0x50
	Parameters: 1
	Flags: Linked
*/
function function_fc775f13(entity)
{
	var_4d21f369 = function_da71e09a(entity);
	if(var_4d21f369 === #"hash_685254f9ed0ce346")
	{
		return true;
	}
	return false;
}

/*
	Name: function_961c1fc0
	Namespace: namespace_19c99142
	Checksum: 0x765A13D1
	Offset: 0xA730
	Size: 0x192
	Parameters: 1
	Flags: Linked
*/
function function_961c1fc0(entity)
{
	var_615c3f7d = function_60ddd10a(entity);
	var_615c3f7d = (var_615c3f7d[0], var_615c3f7d[1], max(entity.origin[2], var_615c3f7d[2]));
	entity.var_105f5842 = int(max(entity.health * 0.5, entity.health - (entity.maxhealth * 0.1)));
	entity.var_63a0699f = {#delta_z:var_615c3f7d[2] - entity.origin[2], #hash_1a655500:length2d(var_615c3f7d - entity.origin), #length:length(var_615c3f7d - entity.origin), #goal:var_615c3f7d, #start:entity.origin};
	entity.var_67faa700 = 1;
}

/*
	Name: function_190c6600
	Namespace: namespace_19c99142
	Checksum: 0x864FE76B
	Offset: 0xA8D0
	Size: 0x5A
	Parameters: 5
	Flags: Linked
*/
function function_190c6600(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	mocompduration animmode("angle deltas noclip", 1);
	mocompduration.var_5b6bf2e7 = 1;
}

/*
	Name: function_2a8799e1
	Namespace: namespace_19c99142
	Checksum: 0x2B7942D8
	Offset: 0xA938
	Size: 0x354
	Parameters: 5
	Flags: Linked
*/
function function_2a8799e1(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	var_6ceb29a9 = mocompduration.var_63a0699f;
	var_d15ca860 = var_6ceb29a9.goal - mocompduration.origin;
	var_67662307 = length(var_d15ca860);
	var_8d977686 = length2d(var_d15ca860);
	percentage = 1 - (var_67662307 / var_6ceb29a9.length);
	var_84560a5f = 1 - (var_8d977686 / var_6ceb29a9.var_1a655500);
	var_8ccce9cf = 1;
	if(percentage < 0.5)
	{
		var_8ccce9cf = 0.7 + ((easesine(percentage / 0.5, 1, 0)) * 0.3);
	}
	else
	{
		var_8ccce9cf = max(1 - (easesine((percentage - 0.5) / 0.5, 1, 0)), 0.2);
	}
	speed = 10 * var_8ccce9cf;
	if(isdefined(mocompduration.var_105f5842) && mocompduration.health < mocompduration.var_105f5842)
	{
		speed = speed * 2;
	}
	var_3354f994 = (var_d15ca860[0], var_d15ca860[1], 0);
	if(var_67662307 > speed)
	{
		new_origin = mocompduration.origin + (vectornormalize(var_3354f994) * speed);
		if(var_6ceb29a9.delta_z < var_6ceb29a9.var_1a655500)
		{
			var_afd96f54 = easesine(var_84560a5f, 1, 1);
		}
		else
		{
			var_afd96f54 = easepower(var_84560a5f, 2, 0, 1);
		}
		new_origin = (new_origin[0], new_origin[1], var_6ceb29a9.start[2] + (var_6ceb29a9.delta_z * var_afd96f54));
	}
	else
	{
		new_origin = var_6ceb29a9.goal;
	}
	new_angles = mocompduration.angles;
	if(isdefined(mocompduration.favoriteenemy))
	{
		new_angles = (0, vectortoyaw(mocompduration.favoriteenemy.origin - mocompduration.origin), 0);
	}
	mocompduration forceteleport(new_origin, new_angles, 0);
}

/*
	Name: function_1d3f5ac
	Namespace: namespace_19c99142
	Checksum: 0xB73B6F91
	Offset: 0xAC98
	Size: 0x36
	Parameters: 5
	Flags: Linked
*/
function function_1d3f5ac(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	mocompduration.var_5b6bf2e7 = 0;
}

/*
	Name: function_4a46d613
	Namespace: namespace_19c99142
	Checksum: 0x2866EA03
	Offset: 0xACD8
	Size: 0x50
	Parameters: 1
	Flags: Linked
*/
function function_4a46d613(entity)
{
	var_4d21f369 = function_da71e09a(entity);
	if(var_4d21f369 === #"hash_4ec3ec4f06b9498f")
	{
		return true;
	}
	return false;
}

/*
	Name: function_ee1f25af
	Namespace: namespace_19c99142
	Checksum: 0xFA73AFC3
	Offset: 0xAD30
	Size: 0x76
	Parameters: 1
	Flags: Linked
*/
function function_ee1f25af(entity)
{
	var_615c3f7d = function_60ddd10a(entity);
	if(distance2dsquared(entity.origin, var_615c3f7d) < sqr(15))
	{
		return true;
	}
	return false;
}

/*
	Name: function_43413efd
	Namespace: namespace_19c99142
	Checksum: 0xA22CEB50
	Offset: 0xADB0
	Size: 0xFE
	Parameters: 1
	Flags: Linked
*/
function function_43413efd(entity)
{
	entity clearpath();
	var_439b094d = 2;
	entity flag::clear(#"hash_71f6b0692dd1ef");
	if(isdefined(entity.var_105f5842) && entity.health < entity.var_105f5842)
	{
		var_439b094d = 0;
	}
	entity.var_c5578297 = {#hash_2a6a9eac:0, #hash_c6194d4f:gettime() + (int(5 * 1000)), #hash_3a668dd:gettime() + (int(var_439b094d * 1000))};
}

/*
	Name: function_89dbf30f
	Namespace: namespace_19c99142
	Checksum: 0xBE46097F
	Offset: 0xAEB8
	Size: 0x174
	Parameters: 1
	Flags: Linked
*/
function function_89dbf30f(entity)
{
	info = entity.var_c5578297;
	if(!isdefined(info))
	{
		return true;
	}
	var_bc1c3139 = function_a25a16fc(entity);
	if(var_bc1c3139.size <= 0 && !function_4fa84b3f(entity, 1))
	{
		return true;
	}
	if(gettime() < info.var_3a668dd)
	{
		return false;
	}
	if(gettime() > info.var_c6194d4f)
	{
		return true;
	}
	if(isdefined(entity.var_105f5842) && entity.health < entity.var_105f5842)
	{
		return true;
	}
	if(isdefined(entity.var_ea989fd2))
	{
		return true;
	}
	if(isdefined(entity.favoriteenemy) && distancesquared(entity.origin, entity.favoriteenemy.origin) < sqr(200))
	{
		return true;
	}
	if(info.var_2a6a9eac >= 3)
	{
		return true;
	}
	return false;
}

/*
	Name: function_4cc12c9
	Namespace: namespace_19c99142
	Checksum: 0x88F51E86
	Offset: 0xB038
	Size: 0x70
	Parameters: 1
	Flags: Linked
*/
function function_4cc12c9(entity)
{
	if(isdefined(entity.var_c5578297) && !entity flag::get(#"hash_71f6b0692dd1ef"))
	{
		if(gettime() - entity.var_c5578297.var_c6194d4f < 500)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_fe96f51d
	Namespace: namespace_19c99142
	Checksum: 0xFCF72255
	Offset: 0xB0B0
	Size: 0x146
	Parameters: 1
	Flags: Linked
*/
function function_fe96f51d(entity)
{
	if(isinarray(level.var_24c45d5f, entity))
	{
		arrayremovevalue(level.var_24c45d5f, entity);
	}
	if(!isdefined(entity.var_5f8bc332))
	{
		entity.var_5f8bc332 = [];
	}
	if(entity.var_5f8bc332.size >= 2)
	{
		array::pop_front(entity.var_5f8bc332, 0);
	}
	array::push(entity.var_5f8bc332, function_60ddd10a(entity));
	entity.var_67faa700 = 0;
	if(entity function_dd070839())
	{
		entity finishtraversal();
	}
	entity flag::clear(#"hash_7ff4499cadec6ebb");
	entity.var_bcc78639 = undefined;
	entity.var_513787f6 = gettime();
	entity.var_cdc5412 = 1;
}

/*
	Name: function_e417cf33
	Namespace: namespace_19c99142
	Checksum: 0x626C58B0
	Offset: 0xB200
	Size: 0x7A
	Parameters: 1
	Flags: Linked
*/
function function_e417cf33(entity)
{
	info = entity.var_c5578297;
	if(!isdefined(info))
	{
		return;
	}
	if(isdefined(entity.favoriteenemy) && !entity cansee(entity.favoriteenemy))
	{
		info.var_2a6a9eac = info.var_2a6a9eac + 1;
	}
}

/*
	Name: function_4fa84b3f
	Namespace: namespace_19c99142
	Checksum: 0xF0E87048
	Offset: 0xB288
	Size: 0x122
	Parameters: 2
	Flags: Linked
*/
function function_4fa84b3f(entity, n_to_spawn)
{
	/#
		/#
			assert(isdefined(n_to_spawn), "");
		#/
	#/
	if(!getdvarint(#"hash_137e2f2e88299f9c", 1) > 0)
	{
		return false;
	}
	if(getailimit() - getaicount() < n_to_spawn)
	{
		return false;
	}
	if(entity.team !== level.zombie_team)
	{
		return false;
	}
	var_bc1c3139 = function_a25a16fc(entity);
	if(5 - var_bc1c3139.size < n_to_spawn)
	{
		return false;
	}
	if(isdefined(entity.var_917994fb))
	{
		if(![[entity.var_917994fb]](entity, n_to_spawn))
		{
			return false;
		}
	}
	return true;
}

/*
	Name: function_adbacb27
	Namespace: namespace_19c99142
	Checksum: 0xEA8C2465
	Offset: 0xB3B8
	Size: 0x6E
	Parameters: 1
	Flags: Linked
*/
function function_adbacb27(entity)
{
	var_4d21f369 = function_da71e09a(entity);
	if(var_4d21f369 !== #"hash_4ec3ec4f06b9498f")
	{
		return false;
	}
	if(function_4fa84b3f(entity, 3))
	{
		return true;
	}
	return false;
}

/*
	Name: function_ba8a29f2
	Namespace: namespace_19c99142
	Checksum: 0x709E7C86
	Offset: 0xB430
	Size: 0xC2
	Parameters: 1
	Flags: Linked
*/
function function_ba8a29f2(entity)
{
	self endon(#"death");
	entity.var_bcc78639 = undefined;
	var_615c3f7d = entity function_60ddd10a(entity);
	spawn_points = [];
	if(isdefined(level.var_dbe79058))
	{
		spawn_points = [[level.var_dbe79058]](var_615c3f7d, 3, 200, 100, 15, 0, 1, 1);
	}
	entity.var_bcc78639 = spawn_points;
}

/*
	Name: function_76e0c5a7
	Namespace: namespace_19c99142
	Checksum: 0xCC9B8B89
	Offset: 0xB500
	Size: 0xA0
	Parameters: 2
	Flags: Linked
*/
function function_76e0c5a7(entity, asmstatename)
{
	animationstatenetworkutility::requeststate(entity, asmstatename);
	entity thread function_ba8a29f2(entity);
	entity.var_71afd614 = undefined;
	entity.blockingpain = 1;
	entity playsound(#"hash_2198874ee44264fd");
	entity flag::set(#"hash_9f9406444a7e5b0");
	return 5;
}

/*
	Name: function_8096be0e
	Namespace: namespace_19c99142
	Checksum: 0xCE5819EF
	Offset: 0xB5A8
	Size: 0x1E2
	Parameters: 2
	Flags: Linked
*/
function function_8096be0e(entity, asmstatename)
{
	var_4d21f369 = function_da71e09a(asmstatename);
	if(!isdefined(asmstatename.var_bcc78639) && var_4d21f369 === #"hash_4ec3ec4f06b9498f")
	{
		return 5;
	}
	if(isdefined(asmstatename.var_71afd614) && gettime() < asmstatename.var_71afd614)
	{
		return 5;
	}
	if(isdefined(asmstatename.var_bcc78639[0]) && function_4fa84b3f(asmstatename, 1))
	{
		spawn_point = array::pop_front(asmstatename.var_bcc78639, 0);
		if(isdefined(level.var_7cee3713))
		{
			ai_spawned = [[level.var_7cee3713]](spawn_point.origin, asmstatename.angles, "soa_spawn");
		}
		if(isdefined(ai_spawned))
		{
			ai_spawned playsound(#"hash_5db196a99c3f2399");
			function_e8a2d39a(asmstatename, ai_spawned);
			if(isdefined(asmstatename.var_9d431816))
			{
				[[asmstatename.var_9d431816]](asmstatename, ai_spawned);
			}
			asmstatename.var_71afd614 = gettime() + (int(2 * 1000));
			if(!isdefined(asmstatename.var_9dabebcd))
			{
				asmstatename.var_9dabebcd = 0;
			}
			asmstatename.var_9dabebcd++;
		}
		return 5;
	}
	return 4;
}

/*
	Name: function_9b1c356b
	Namespace: namespace_19c99142
	Checksum: 0x33F48FF9
	Offset: 0xB798
	Size: 0x40
	Parameters: 2
	Flags: Linked
*/
function function_9b1c356b(entity, asmstatename)
{
	asmstatename.blockingpain = 0;
	asmstatename flag::clear(#"hash_9f9406444a7e5b0");
	return 4;
}

/*
	Name: function_6b68419c
	Namespace: namespace_19c99142
	Checksum: 0xFEFF6313
	Offset: 0xB7E0
	Size: 0x1FE
	Parameters: 1
	Flags: Linked
*/
function function_6b68419c(soa)
{
	self.favoriteenemy = undefined;
	self thread clientfield::set("soaBindTurnCF", 1);
	self.var_a1b40ce9 = 1;
	function_c33fb385(self, #"following");
	self callback::callback(#"hash_72fd23232c4c7ab1", soa);
	self.var_ce2dd587 = 0.75;
	max_health = int(self.maxhealth * 2);
	self.maxhealth = max_health;
	self.health = max_health;
	self clearpath();
	self.keep_moving = 0;
	self callback::function_d8abfc3d(#"on_ai_killed", &function_a4a6ada4);
	/#
		/#
			assert(self.archetype === #"zombie" || self.archetype === #"tormentor", "");
		#/
	#/
	if(math::cointoss())
	{
		if(self.zombie_arms_position == "up")
		{
			self.variant_type = 6;
		}
		else
		{
			self.variant_type = 7;
		}
	}
	else
	{
		if(self.zombie_arms_position == "up")
		{
			self.variant_type = 7;
		}
		else
		{
			self.variant_type = 8;
		}
	}
	self.var_3981459f = soa;
}

/*
	Name: function_8f117c65
	Namespace: namespace_19c99142
	Checksum: 0x353D77D8
	Offset: 0xB9E8
	Size: 0x13C
	Parameters: 0
	Flags: Linked
*/
function function_8f117c65()
{
	self.favoriteenemy = undefined;
	self thread clientfield::set("soaBindTurnCF", 0);
	self.var_a1b40ce9 = 0;
	self callback::callback(#"hash_2a040f8b8142266d");
	self.var_ce2dd587 = 1;
	max_health = int(self.maxhealth * 0.5);
	self.maxhealth = max_health;
	old_health = self.health;
	self.health = max_health;
	if(old_health < max_health)
	{
		self dodamage(max_health - old_health, self.origin);
	}
	self clearpath();
	self.keep_moving = 0;
	self.var_3981459f = undefined;
	self callback::function_52ac9652(#"on_ai_killed", &function_a4a6ada4);
}

/*
	Name: function_a4a6ada4
	Namespace: namespace_19c99142
	Checksum: 0xAE90697
	Offset: 0xBB30
	Size: 0x11A
	Parameters: 1
	Flags: Linked
*/
function function_a4a6ada4(s_params)
{
	soa = function_9dd68a24(self);
	if(isalive(soa))
	{
		if(isdefined(soa.var_f83eea5) && isdefined(soa.var_785a0384) && gettime() <= soa.var_f83eea5)
		{
			soa.var_785a0384++;
			if(soa.var_785a0384 >= 3)
			{
				soa playsoundontag(#"hash_4bb094bce1653801", "j_head");
				soa thread flag::set_for_time(2, #"hash_63058c3bf14d7177");
				soa.var_785a0384 = undefined;
				soa.var_f83eea5 = undefined;
			}
		}
		else
		{
			soa.var_f83eea5 = gettime() + 10000;
			soa.var_785a0384 = 1;
		}
	}
}

/*
	Name: function_d9fe2b0
	Namespace: namespace_19c99142
	Checksum: 0x97AB03A4
	Offset: 0xBC58
	Size: 0x2FC
	Parameters: 1
	Flags: Linked
*/
function function_d9fe2b0(zombie)
{
	var_4d21f369 = function_2905c7db(zombie);
	if(var_4d21f369 === #"following")
	{
		target_pos = function_dd116fa9(zombie, 1);
		var_3ad825ba = distance2d(zombie.origin, target_pos);
		var_59e0da57 = 1000;
		ratio = var_3ad825ba / var_59e0da57;
		new_move_speed = zombie_utility::function_f9c50a93(int(236 * ratio));
		if(new_move_speed === "super_sprint")
		{
			soa = function_9dd68a24(zombie);
			if(distance2dsquared(zombie.origin, soa.origin) < sqr(100))
			{
				new_move_speed = "sprint";
			}
		}
	}
	else if(var_4d21f369 === #"attacking")
	{
		var_809d2ce8 = zombie_utility::function_33da7a07();
		var_4c7df3af = zombie_utility::function_9e46a191(var_809d2ce8);
		if(var_4c7df3af === "super_sprint" && var_809d2ce8 !== "super_sprint" && soa.var_ad1a2a3c !== 3)
		{
			var_4c7df3af = "sprint";
		}
		soa = function_9dd68a24(zombie);
		if(isdefined(soa.favoriteenemy) && isdefined(zombie.favoriteenemy) && soa.favoriteenemy === zombie.favoriteenemy)
		{
			if(vectordot(soa.favoriteenemy.origin - soa.origin, zombie.origin - soa.origin) < 0)
			{
				var_4c7df3af = zombie_utility::function_9e46a191(var_4c7df3af);
			}
		}
		new_move_speed = var_4c7df3af;
	}
	if(new_move_speed !== zombie.zombie_move_speed)
	{
		zombie zombie_utility::set_zombie_run_cycle(new_move_speed);
	}
}

/*
	Name: function_dd116fa9
	Namespace: namespace_19c99142
	Checksum: 0xF24A3A40
	Offset: 0xBF60
	Size: 0x202
	Parameters: 2
	Flags: Linked
*/
function function_dd116fa9(zombie, var_5f5dd627)
{
	if(!isdefined(var_5f5dd627))
	{
		var_5f5dd627 = 0;
	}
	soa = function_9dd68a24(zombie);
	var_1f1f9cfa = soa function_4794d6a3();
	if(isdefined(var_1f1f9cfa.goalpos))
	{
		var_962bde63 = var_1f1f9cfa.goalpos;
		if(is_true(var_5f5dd627))
		{
			return var_962bde63;
		}
		var_ca94f78a = 150;
		if(isdefined(zombie.var_87c9386e) && distance2dsquared(zombie.var_87c9386e, var_962bde63) < sqr(var_ca94f78a))
		{
			return zombie.var_87c9386e;
		}
		zombie.var_87c9386e = undefined;
		var_f5b51915 = 150;
		if(distance2dsquared(zombie.origin, var_962bde63) < sqr(var_f5b51915))
		{
			query = positionquery_source_navigation(var_962bde63, 50, 150, 36, 16, zombie, 16);
			positionquery_filter_inclaimedlocation(query, zombie);
			if(query.data.size > 0)
			{
				point = query.data[randomint(query.data.size)];
				zombie.var_87c9386e = point.origin;
				return zombie.var_87c9386e;
			}
		}
		return var_962bde63;
	}
	return zombie.origin;
}

/*
	Name: function_9dd68a24
	Namespace: namespace_19c99142
	Checksum: 0x25A20AD8
	Offset: 0xC170
	Size: 0x16
	Parameters: 1
	Flags: Linked
*/
function function_9dd68a24(zombie)
{
	return zombie.var_3981459f;
}

/*
	Name: function_9d13a2e7
	Namespace: namespace_19c99142
	Checksum: 0x3A50E97B
	Offset: 0xC190
	Size: 0x46
	Parameters: 1
	Flags: Linked
*/
function function_9d13a2e7(zombie)
{
	return isdefined(zombie.var_3981459f.archetype) && zombie.var_3981459f.archetype === #"soa";
}

/*
	Name: function_5bb7560c
	Namespace: namespace_19c99142
	Checksum: 0xB2107B28
	Offset: 0xC1E0
	Size: 0x44
	Parameters: 1
	Flags: Linked, Private
*/
function private function_5bb7560c(params)
{
	if(function_9d13a2e7(self))
	{
		function_1eaaceab(self.var_3981459f.var_276a8013);
	}
}

/*
	Name: function_2905c7db
	Namespace: namespace_19c99142
	Checksum: 0x3D952D88
	Offset: 0xC230
	Size: 0x16
	Parameters: 1
	Flags: Linked
*/
function function_2905c7db(zombie)
{
	return zombie.var_1eaa4eb2;
}

/*
	Name: function_c33fb385
	Namespace: namespace_19c99142
	Checksum: 0xCFA2871D
	Offset: 0xC250
	Size: 0x92
	Parameters: 2
	Flags: Linked
*/
function function_c33fb385(zombie, state)
{
	/#
		if(getdvarint(#"hash_212234fabb83ea82", 0) > 0)
		{
			if(state === #"attacking")
			{
				return;
			}
		}
	#/
	zombie.var_1eaa4eb2 = state;
	if(isdefined(zombie.var_e78db5d8[state]))
	{
		[[zombie.var_e78db5d8[state]]](zombie);
	}
}

/*
	Name: function_7d12a873
	Namespace: namespace_19c99142
	Checksum: 0xA99B35B4
	Offset: 0xC2F0
	Size: 0x88
	Parameters: 3
	Flags: None
*/
function function_7d12a873(zombie, state, func)
{
	if(!isdefined(zombie.var_e78db5d8))
	{
		zombie.var_e78db5d8 = [];
	}
	else if(!isarray(zombie.var_e78db5d8))
	{
		zombie.var_e78db5d8 = array(zombie.var_e78db5d8);
	}
	zombie.var_e78db5d8[state] = func;
}

/*
	Name: function_351bf6f2
	Namespace: namespace_19c99142
	Checksum: 0x8690175F
	Offset: 0xC380
	Size: 0x56
	Parameters: 1
	Flags: Linked
*/
function function_351bf6f2(entity)
{
	/#
		if(is_true(entity.var_ed05cdb2))
		{
			return true;
		}
	#/
	if(is_true(entity.var_c8bed5f2))
	{
		return true;
	}
	return false;
}

/*
	Name: function_dfbc9dea
	Namespace: namespace_19c99142
	Checksum: 0x587480B2
	Offset: 0xC3E0
	Size: 0xA4
	Parameters: 1
	Flags: Linked
*/
function function_dfbc9dea(entity)
{
	/#
		entity.var_22e5a90f = gettime() + getdvarfloat(#"hash_19bf67ccf094da8b", 0);
	#/
	entity.blockingpain = 1;
	if(isdefined(entity.favoriteenemy) && !isdefined(entity.attackable))
	{
		entity.var_e3ce0a5f = entity.favoriteenemy;
		entity.favoriteenemy flag::set(#"hash_a580869eb595fc4");
	}
}

/*
	Name: function_36c559fa
	Namespace: namespace_19c99142
	Checksum: 0xDE5E4624
	Offset: 0xC490
	Size: 0x1A
	Parameters: 1
	Flags: Linked
*/
function function_36c559fa(entity)
{
	entity.blockingpain = 1;
}

/*
	Name: function_8ca0249d
	Namespace: namespace_19c99142
	Checksum: 0xDA1BDE95
	Offset: 0xC4B8
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function function_8ca0249d(entity)
{
	if(isdefined(entity.var_e3ce0a5f))
	{
		entity.var_e3ce0a5f flag::clear(#"hash_a580869eb595fc4");
	}
}

/*
	Name: function_43b0545a
	Namespace: namespace_19c99142
	Checksum: 0x6EFACFD3
	Offset: 0xC508
	Size: 0x56
	Parameters: 2
	Flags: Linked
*/
function function_43b0545a(entity, asmstatename)
{
	animationstatenetworkutility::requeststate(entity, asmstatename);
	entity thread function_88f1c3bf(entity);
	entity.blockingpain = 1;
	return 5;
}

/*
	Name: function_15080704
	Namespace: namespace_19c99142
	Checksum: 0xDA0CA8F9
	Offset: 0xC568
	Size: 0xB2
	Parameters: 2
	Flags: Linked
*/
function function_15080704(behaviortreeentity, asmstatename)
{
	/#
		if(gettime() < asmstatename.var_22e5a90f)
		{
			return 5;
		}
	#/
	if(!function_3c14ef44(asmstatename))
	{
		return 4;
	}
	to_enemy = asmstatename.var_7418f498.origin - asmstatename.origin;
	if(vectordot(to_enemy, anglestoforward(asmstatename.angles)) < 0)
	{
		return 4;
	}
	return 5;
}

/*
	Name: function_1a29c303
	Namespace: namespace_19c99142
	Checksum: 0xAB9D1174
	Offset: 0xC628
	Size: 0x3A
	Parameters: 2
	Flags: Linked
*/
function function_1a29c303(entity, asmstatename)
{
	asmstatename function_1b2f34c9(asmstatename);
	asmstatename.blockingpain = 0;
	return 4;
}

/*
	Name: function_4b5c56a5
	Namespace: namespace_19c99142
	Checksum: 0x6B5E099F
	Offset: 0xC670
	Size: 0x5BC
	Parameters: 1
	Flags: Linked
*/
function function_4b5c56a5(entity)
{
	var_4d21f369 = function_da71e09a(entity);
	if(var_4d21f369 !== #"chase" && var_4d21f369 !== #"circle")
	{
		function_1b2f34c9(entity);
		return;
	}
	if(!isdefined(entity.attackable))
	{
		if(!isalive(entity.favoriteenemy))
		{
			function_1b2f34c9(entity);
			return;
		}
		if(!isplayer(entity.favoriteenemy) && entity.team === level.zombie_team)
		{
			function_1b2f34c9(entity);
			return;
		}
		if(isplayer(entity.favoriteenemy) && !zombie_utility::is_player_valid(entity.favoriteenemy, 1))
		{
			function_1b2f34c9(entity);
			return;
		}
	}
	var_913ff8ad = !isdefined(entity.var_c8489bd4) || gettime() > entity.var_c8489bd4;
	var_70fcb993 = !entity flag::get(#"hash_f0028251a31e1fe");
	var_be9a0d55 = 1;
	var_d91ee5f6 = 1;
	var_4f24df4b = 1;
	if(isdefined(entity.favoriteenemy))
	{
		var_be9a0d55 = entity.team !== entity.favoriteenemy.team;
		var_d91ee5f6 = !isplayer(entity.favoriteenemy) || (!entity.favoriteenemy flag::get(#"hash_60491982ef9b417f") && !entity.favoriteenemy flag::get(#"hash_a580869eb595fc4"));
		trace = beamtrace(entity getcentroid(), entity.favoriteenemy getcentroid(), 0, entity, 0, 0, entity.favoriteenemy);
		var_4f24df4b = trace[#"fraction"] >= 1 || (isplayer(entity.favoriteenemy) && entity.favoriteenemy isinvehicle());
	}
	target = (isdefined(entity.attackable) ? entity.attackable : entity.favoriteenemy);
	dist_sq = distancesquared(entity.origin, target.origin);
	if(!function_3c14ef44(entity))
	{
		function_1eaaceab(level.var_a81a9504);
		var_2a4acca4 = !function_b003534e(entity, 100);
		if(dist_sq < sqr(225) && var_913ff8ad && var_d91ee5f6 && var_4f24df4b && var_2a4acca4 && var_70fcb993 && var_be9a0d55)
		{
			entity.var_c8bed5f2 = 1;
		}
	}
	else
	{
		if(dist_sq > sqr(350))
		{
			function_1b2f34c9(entity);
		}
		if(!var_4f24df4b)
		{
			function_1b2f34c9(entity);
		}
		if(entity.var_b8114eb4 > 0.1 * entity.maxhealth)
		{
			function_1b2f34c9(entity);
			entity.var_c8489bd4 = gettime() + (int(5 * 1000));
			if(!is_true(entity.var_5b6bf2e7))
			{
				entity.var_5015c6e8 = 1;
			}
		}
		if(!isdefined(entity.var_7418f498) || !isalive(entity.var_7418f498) || entity.var_7418f498.team === entity.team)
		{
			function_1b2f34c9(entity);
		}
	}
}

/*
	Name: function_3c14ef44
	Namespace: namespace_19c99142
	Checksum: 0x76F9330E
	Offset: 0xCC38
	Size: 0x18
	Parameters: 1
	Flags: Linked
*/
function function_3c14ef44(entity)
{
	return isdefined(entity.var_7418f498);
}

/*
	Name: function_b003534e
	Namespace: namespace_19c99142
	Checksum: 0xD0E74FEC
	Offset: 0xCC58
	Size: 0x5A
	Parameters: 2
	Flags: Linked
*/
function function_b003534e(entity, range)
{
	function_1eaaceab(level.var_a81a9504);
	return function_72d3bca6(level.var_a81a9504, entity.origin, 2, 0, range).size > 1;
}

/*
	Name: function_a91b9ba0
	Namespace: namespace_19c99142
	Checksum: 0xB7403817
	Offset: 0xCCC0
	Size: 0x48C
	Parameters: 2
	Flags: Linked
*/
function function_a91b9ba0(entity, target)
{
	entity endon(#"death");
	if(!isdefined(level.var_dadd5b88))
	{
		level.var_dadd5b88 = [];
	}
	if(!isdefined(level.var_dadd5b88[0]))
	{
		level.var_dadd5b88[0] = util::spawn_model("tag_origin", undefined, undefined, undefined, 1);
	}
	if(!isdefined(level.var_dadd5b88[1]))
	{
		level.var_dadd5b88[1] = util::spawn_model("tag_origin", undefined, undefined, undefined, 1);
	}
	if(!isdefined(level.var_dadd5b88) || !isdefined(level.var_dadd5b88[0]) || !isdefined(level.var_dadd5b88[1]))
	{
		return;
	}
	if(!isdefined(level.var_e4d3a9ea))
	{
		level.var_e4d3a9ea = [];
	}
	array::add(level.var_e4d3a9ea, entity, 0);
	entity callback::function_d8abfc3d(#"death", &function_71c5e86a);
	while(flag::get(#"hash_59adf62a6bf02202"))
	{
		self waittill(#"hash_59adf62a6bf02202");
		foreach(item in level.var_e4d3a9ea)
		{
			if(isdefined(item))
			{
				if(item === entity)
				{
					arrayremovevalue(level.var_e4d3a9ea, item);
					break;
				}
				continue;
			}
		}
	}
	level flag::set(#"hash_59adf62a6bf02202");
	level.var_dadd5b88[0] linkto(entity);
	level.var_dadd5b88[1] linkto(target);
	level.var_dadd5b88[0] clientfield::set("soaLifeDrainEntCF", 1);
	util::wait_network_frame(1);
	if(function_3c14ef44(entity) && target === (isdefined(entity.attackable) ? entity.attackable : entity.favoriteenemy))
	{
		level.var_dadd5b88[1] clientfield::set("soaLifeDrainEntCF", 2);
	}
	util::wait_network_frame(1);
	level.var_dadd5b88[0] clientfield::set("soaLifeDrainEntCF", 0);
	level.var_dadd5b88[1] clientfield::set("soaLifeDrainEntCF", 0);
	util::wait_network_frame(1);
	entity callback::function_52ac9652(#"death", &function_71c5e86a);
	level flag::clear(#"hash_59adf62a6bf02202");
	if(!function_3c14ef44(entity))
	{
		function_7600184c(entity);
	}
}

/*
	Name: function_71c5e86a
	Namespace: namespace_19c99142
	Checksum: 0x56EB2EA
	Offset: 0xD158
	Size: 0x44
	Parameters: 1
	Flags: Linked, Private
*/
function private function_71c5e86a(params)
{
	level flag::clear(#"hash_59adf62a6bf02202");
	function_1eaaceab(level.var_e4d3a9ea);
}

/*
	Name: function_7600184c
	Namespace: namespace_19c99142
	Checksum: 0x15A609FE
	Offset: 0xD1A8
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function function_7600184c(entity)
{
	entity clientfield::increment("soaLifeDrainBeamKillCF", 1);
}

/*
	Name: function_422fc905
	Namespace: namespace_19c99142
	Checksum: 0xD9DF749D
	Offset: 0xD1E0
	Size: 0x2C
	Parameters: 1
	Flags: Private
*/
function private function_422fc905(params)
{
	level flag::clear(#"hash_79e274f4532a74af");
}

/*
	Name: function_88f1c3bf
	Namespace: namespace_19c99142
	Checksum: 0x959DDEE3
	Offset: 0xD218
	Size: 0x4F0
	Parameters: 1
	Flags: Linked
*/
function function_88f1c3bf(entity)
{
	self endon(#"death", #"hash_67fec37b909a670a");
	target = (isdefined(entity.attackable) ? entity.attackable : entity.favoriteenemy);
	if(function_3c14ef44(entity) || !isdefined(target))
	{
		entity.var_c8bed5f2 = 0;
		return;
	}
	entity.var_c8bed5f2 = 1;
	entity.var_7418f498 = target;
	entity thread function_a91b9ba0(entity, target);
	entity.var_b578c13b = gettime() + (int(6 * 1000));
	entity.var_b8114eb4 = 0;
	entity.var_c2e24cc8 = 0;
	entity.var_81e38bf6 = 0;
	entity flag::set(#"hash_7ff4499cadec6ebb");
	entity.var_7418f498 flag::set(#"hash_60491982ef9b417f");
	if(isplayer(entity.var_7418f498))
	{
		entity.var_7418f498 clientfield::set_to_player("soaLifeDrainPostFXCF", 1);
	}
	else if(isactor(entity.var_7418f498))
	{
		entity.var_7418f498 zombie_utility::set_zombie_run_cycle_override_value("walk");
	}
	while(function_3c14ef44(entity))
	{
		wait(0.5);
		if(!function_3c14ef44(entity))
		{
			break;
		}
		var_e6d32a21 = 1 - (entity.health / entity.maxhealth);
		var_790365b2 = (0.025 * entity.maxhealth) * (1 + (var_e6d32a21 * 2)) / 2;
		var_790365b2 = var_790365b2 + (entity.var_81e38bf6 * 0.8);
		entity.var_81e38bf6 = 0;
		var_e9ac00b = function_881fda47(entity);
		var_790365b2 = int(min(var_790365b2, (var_e9ac00b * entity.maxhealth) - entity.health));
		entity function_9d34061c(var_790365b2);
		entity.var_c2e24cc8 = entity.var_c2e24cc8 + var_790365b2;
		if(isplayer(entity.var_7418f498))
		{
			damage = int(5);
		}
		else
		{
			if(entity.attackable === entity.var_7418f498)
			{
				damage = int(20);
			}
			else if(isdefined(entity.var_7418f498.maxhealth))
			{
				damage = int(min(max(entity.maxhealth * 0.05, entity.var_7418f498.maxhealth * 0.05), entity.maxhealth));
			}
		}
		if(!isdefined(damage))
		{
			damage = 0;
		}
		if(isdefined(entity.var_7418f498))
		{
			attacker = entity;
			damage_source = entity.origin;
			if(isdefined(entity.var_443d78cc))
			{
				attacker = entity.var_443d78cc;
				damage_source = entity.var_7418f498.origin;
			}
			entity.var_7418f498 dodamage(damage, entity.var_7418f498.origin, attacker, entity, "torso_upper", "MOD_PROJECTILE");
		}
	}
}

/*
	Name: function_881fda47
	Namespace: namespace_19c99142
	Checksum: 0xCA19F0EC
	Offset: 0xD710
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function function_881fda47(entity)
{
	return (4 - entity.var_ad1a2a3c) * 0.34;
}

/*
	Name: function_1b2f34c9
	Namespace: namespace_19c99142
	Checksum: 0x6CE0D153
	Offset: 0xD740
	Size: 0x1F0
	Parameters: 1
	Flags: Linked
*/
function function_1b2f34c9(entity)
{
	entity.var_c8bed5f2 = 0;
	if(isdefined(entity.var_e3ce0a5f))
	{
		entity.var_e3ce0a5f flag::clear(#"hash_a580869eb595fc4");
	}
	if(!function_3c14ef44(entity))
	{
		return;
	}
	if(isplayer(entity.var_7418f498))
	{
		entity.var_7418f498 clientfield::set_to_player("soaLifeDrainPostFXCF", 0);
	}
	else if(isactor(entity.var_7418f498))
	{
		entity.var_7418f498 zombie_utility::set_zombie_run_cycle_restore_from_override();
	}
	function_7600184c(entity);
	if(isdefined(entity.var_c2e24cc8))
	{
		if(isdefined(entity.var_448aebc7[entity.var_7418f498 getentitynumber()]) && isdefined(entity.var_c2e24cc8))
		{
			entity.var_448aebc7[entity.var_7418f498 getentitynumber()] = max(0, entity.var_448aebc7[entity.var_7418f498 getentitynumber()] - entity.var_c2e24cc8);
		}
	}
	entity.var_7418f498 flag::clear(#"hash_60491982ef9b417f");
	entity.var_7418f498 = undefined;
	entity notify(#"hash_67fec37b909a670a");
}

/*
	Name: function_264f914c
	Namespace: namespace_19c99142
	Checksum: 0x52C23437
	Offset: 0xD938
	Size: 0xDA
	Parameters: 1
	Flags: Linked
*/
function function_264f914c(entity)
{
	if(!function_3c14ef44(entity) && !is_true(entity.var_c8bed5f2) && !entity flag::get(#"hash_a580869eb595fc4"))
	{
		return true;
	}
	if(!zm_utility::is_player_valid(entity.var_7418f498) && !isdefined(entity.attackable))
	{
		return true;
	}
	if(isdefined(entity.var_b578c13b) && gettime() > entity.var_b578c13b)
	{
		return true;
	}
	return false;
}

/*
	Name: function_8d707ed2
	Namespace: namespace_19c99142
	Checksum: 0x92D0E260
	Offset: 0xDA20
	Size: 0xC
	Parameters: 1
	Flags: Linked
*/
function function_8d707ed2(entity)
{
}

/*
	Name: function_1be46939
	Namespace: namespace_19c99142
	Checksum: 0x325B1AE6
	Offset: 0xDA38
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function function_1be46939(entity)
{
	return is_true(entity.var_5015c6e8);
}

/*
	Name: function_39994f21
	Namespace: namespace_19c99142
	Checksum: 0x14B2BD53
	Offset: 0xDA68
	Size: 0x8C
	Parameters: 1
	Flags: Linked
*/
function function_39994f21(entity)
{
	function_35979cdd(entity);
	if(isplayer(entity.var_b4d7d55a))
	{
		level scoreevents::doscoreeventcallback("scoreEventZM", {#scoreevent:"disciple_stun_drain_life_zm", #attacker:entity.var_b4d7d55a});
	}
}

/*
	Name: function_2953d806
	Namespace: namespace_19c99142
	Checksum: 0xC655C74B
	Offset: 0xDB00
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function function_2953d806(entity)
{
	pain_update(entity);
}

/*
	Name: function_114e7369
	Namespace: namespace_19c99142
	Checksum: 0xEA8D9490
	Offset: 0xDB30
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function function_114e7369(entity)
{
	function_fd74c2ff(entity);
}

/*
	Name: function_1f8fc149
	Namespace: namespace_19c99142
	Checksum: 0x4684885
	Offset: 0xDB60
	Size: 0x114
	Parameters: 5
	Flags: Linked
*/
function function_1f8fc149(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	enemy = (isdefined(mocompduration.var_7418f498) ? mocompduration.var_7418f498 : mocompduration.attackable);
	if(!isdefined(enemy))
	{
		enemy = mocompduration.enemy;
	}
	if(isdefined(enemy))
	{
		toenemy = enemy.origin - mocompduration.origin;
		var_8e08536c = vectortoangles(toenemy);
		mocompduration orientmode("face angle", var_8e08536c);
	}
	else
	{
		mocompduration orientmode("face enemy");
	}
	mocompduration animmode("zonly_physics");
}

/*
	Name: function_576a104c
	Namespace: namespace_19c99142
	Checksum: 0xBDF843F1
	Offset: 0xDC80
	Size: 0x104
	Parameters: 5
	Flags: Linked
*/
function function_576a104c(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	enemy = (isdefined(mocompduration.var_7418f498) ? mocompduration.var_7418f498 : mocompduration.enemy);
	if(isdefined(enemy) && enemy.health > 0 && mocompduration function_ebbebf56() > 0.5)
	{
		var_1b0f41cd = enemy.origin;
		toenemy = var_1b0f41cd - mocompduration.origin;
		var_8e08536c = vectortoangles(toenemy);
		mocompduration orientmode("face angle", var_8e08536c);
	}
}

/*
	Name: function_ed9529fa
	Namespace: namespace_19c99142
	Checksum: 0xA2195A8B
	Offset: 0xDD90
	Size: 0x548
	Parameters: 0
	Flags: None
*/
function function_ed9529fa()
{
	/#
		function_5ac4dc99(#"hash_1d6cd903d17ac72", "");
		function_cd140ee9(#"hash_1d6cd903d17ac72", &function_fb306c05);
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
	Name: function_fb306c05
	Namespace: namespace_19c99142
	Checksum: 0x3A17E41D
	Offset: 0xE2E0
	Size: 0x284
	Parameters: 1
	Flags: None
*/
function function_fb306c05(dvar)
{
	/#
		tokens = strtok(dvar.value, "");
		switch((isdefined(tokens[0]) ? tokens[0] : ""))
		{
			case "hash_19c2cf4f6a62ed5d":
			{
				function_c221c3cc();
				break;
			}
			case "hash_62d67535f4a81c95":
			{
				function_13f1306e();
				break;
			}
			case "hash_4234099c2d42ee5c":
			{
				function_b9cd7c51();
				break;
			}
			case "hash_63d03f0db09b4345":
			{
				function_7c39bab6();
				break;
			}
			case "hash_78c342c8c1eabf":
			{
				function_6cf38b2c();
				break;
			}
			case "hash_5bc5b28458973e4a":
			{
				function_c645776b();
				break;
			}
			case "hash_a7dad989049b1e3":
			{
				function_eadaa815();
				break;
			}
			case "hash_128b5208a9239ce1":
			{
				function_f528b32c();
				break;
			}
			case "hash_37d6d1f2b822eeae":
			{
				function_e970dd48();
				break;
			}
			case "hash_316fa1a4dcfe9f25":
			{
				level thread function_4de3c0c();
				break;
			}
			case "hash_3bc103465bc73009":
			{
				level thread function_b4a17ed2();
				break;
			}
			case "hash_45ac54b6f6c62ca8":
			{
				level thread function_2e7ab4e5();
				break;
			}
			default:
			{
				return;
			}
		}
		setdvar(#"hash_1d6cd903d17ac72", "");
	#/
}

/*
	Name: function_c221c3cc
	Namespace: namespace_19c99142
	Checksum: 0x37FE6DD9
	Offset: 0xE570
	Size: 0x104
	Parameters: 0
	Flags: None
*/
function function_c221c3cc()
{
	/#
		level.var_b1ee9658 = !(isdefined(level.var_b1ee9658) ? level.var_b1ee9658 : 0);
		var_68589f9a = function_df254269();
		foreach(soa in var_68589f9a)
		{
			soa.var_b1ee9658 = level.var_b1ee9658;
		}
		iprintlnbold("" + (level.var_b1ee9658 ? "" : ""));
	#/
}

/*
	Name: function_13f1306e
	Namespace: namespace_19c99142
	Checksum: 0x4B861E09
	Offset: 0xE680
	Size: 0x104
	Parameters: 0
	Flags: None
*/
function function_13f1306e()
{
	/#
		level.var_ed05cdb2 = !(isdefined(level.var_ed05cdb2) ? level.var_ed05cdb2 : 0);
		var_68589f9a = function_df254269();
		foreach(soa in var_68589f9a)
		{
			soa.var_ed05cdb2 = level.var_ed05cdb2;
		}
		iprintlnbold("" + (level.var_ed05cdb2 ? "" : ""));
	#/
}

/*
	Name: function_b9cd7c51
	Namespace: namespace_19c99142
	Checksum: 0x7A6A5EB9
	Offset: 0xE790
	Size: 0x4C
	Parameters: 0
	Flags: Private
*/
function private function_b9cd7c51()
{
	/#
		setdvar(#"hash_20ead0e6e8e713d8", !getdvarint(#"hash_20ead0e6e8e713d8", 0) > 0);
	#/
}

/*
	Name: function_ed17dbef
	Namespace: namespace_19c99142
	Checksum: 0x54ECB039
	Offset: 0xE7E8
	Size: 0x442
	Parameters: 0
	Flags: Private
*/
function private function_ed17dbef()
{
	/#
		self endon(#"end_game");
		while(true)
		{
			if(!getdvarint(#"hash_20ead0e6e8e713d8", 0) > 0)
			{
				level.var_a2c1c3a5 = 0;
				waitframe(1);
				continue;
			}
			level.var_a2c1c3a5 = 1;
			if(isdefined(level.var_48137965))
			{
				recordsphere(level.var_48137965, 15, (1, 0, 0));
				record3dtext("", level.var_48137965 + vectorscale((0, 0, 1), 15), (1, 0, 0));
			}
			var_68589f9a = function_df254269();
			foreach(soa in var_68589f9a)
			{
				recordcircle(soa.origin, 500, (1, 0, 0));
				zombies = (isdefined(level.var_4206745e) ? level.var_4206745e : []);
				bound = function_a25a16fc(soa);
				potential = array::get_all_closest(soa.origin, zombies, bound, undefined, 500);
				if(isdefined(soa.var_8cdffa65))
				{
					function_ae63c292(soa.var_8cdffa65.start_pos, "", (1, 0, 1));
					function_ae63c292(soa.var_8cdffa65.end_pos, "", (1, 0, 1));
					recordline(soa.var_8cdffa65.start_pos, soa.var_8cdffa65.end_pos, (1, 0, 1));
				}
				if(isdefined(soa.var_4d56625b))
				{
					record3dtext("" + soa.var_4d56625b, soa.origin + vectorscale((0, 0, 1), 72), (0, 1, 0));
				}
			}
			if(isdefined(level.var_aa8f3642))
			{
				foreach(point in level.var_aa8f3642)
				{
					recordsphere(point, 15, (0, 1, 0));
				}
			}
			if(isdefined(level.var_7a4dc7e8))
			{
				foreach(point in level.var_7a4dc7e8)
				{
					function_ae63c292(point.origin, "", (1, 0, 0));
				}
			}
			waitframe(1);
		}
	#/
}

/*
	Name: function_7c39bab6
	Namespace: namespace_19c99142
	Checksum: 0xC7312F9F
	Offset: 0xEC38
	Size: 0x1A4
	Parameters: 0
	Flags: None
*/
function function_7c39bab6()
{
	/#
		iprintlnbold("");
		var_68589f9a = function_df254269();
		foreach(soa in var_68589f9a)
		{
			zombies = (isdefined(level.var_4206745e) ? level.var_4206745e : []);
			bound = function_a25a16fc(soa);
			potential = array::get_all_closest(soa.origin, zombies, bound, undefined, 500);
			foreach(target in potential)
			{
				function_e8a2d39a(soa, target);
			}
		}
	#/
}

/*
	Name: function_6cf38b2c
	Namespace: namespace_19c99142
	Checksum: 0x7685777E
	Offset: 0xEDE8
	Size: 0x178
	Parameters: 0
	Flags: None
*/
function function_6cf38b2c()
{
	/#
		var_d610cbe2 = sqr(1000);
		player = getplayers()[0];
		player_vec = vectornormalize(anglestoforward(player getplayerangles()));
		player_eye = player.origin + (0, 0, player getplayerviewheight());
		trace = bullettrace(player_eye, player_eye + (player_vec * 1000), 0, player);
		if(trace[#"fraction"] < 1)
		{
			pos = trace[#"position"];
			dropped = function_9cc082d2(pos, 100);
			if(isdefined(dropped[#"point"]))
			{
				level.var_48137965 = dropped[#"point"];
			}
		}
	#/
}

/*
	Name: function_c645776b
	Namespace: namespace_19c99142
	Checksum: 0x9703283F
	Offset: 0xEF68
	Size: 0x8C
	Parameters: 0
	Flags: None
*/
function function_c645776b()
{
	/#
		setdvar(#"hash_4ac64c7f46b01880", !getdvar(#"hash_4ac64c7f46b01880", 0));
		iprintlnbold("" + getdvar(#"hash_4ac64c7f46b01880", 0));
	#/
}

/*
	Name: function_eadaa815
	Namespace: namespace_19c99142
	Checksum: 0xA90A547A
	Offset: 0xF000
	Size: 0x12A
	Parameters: 0
	Flags: None
*/
function function_eadaa815()
{
	/#
		iprintlnbold("");
		foreach(soa in function_df254269())
		{
			if(isdefined(soa.favoriteenemy))
			{
				if(!isdefined(soa.var_9634511))
				{
					soa.var_9634511 = beamlaunch(soa, soa.favoriteenemy, "", "", getweapon(""));
					continue;
				}
				soa.var_9634511 delete();
				soa.var_9634511 = undefined;
			}
		}
	#/
}

/*
	Name: function_f528b32c
	Namespace: namespace_19c99142
	Checksum: 0x656FC907
	Offset: 0xF138
	Size: 0xC8
	Parameters: 0
	Flags: None
*/
function function_f528b32c()
{
	/#
		iprintlnbold("");
		foreach(soa in function_df254269())
		{
			soa forceteleport(soa.origin + vectorscale((0, 0, 1), 100));
		}
	#/
}

/*
	Name: function_e970dd48
	Namespace: namespace_19c99142
	Checksum: 0xF9DB7FD2
	Offset: 0xF208
	Size: 0x19E
	Parameters: 0
	Flags: None
*/
function function_e970dd48()
{
	/#
		iprintlnbold("");
		foreach(soa in function_df254269())
		{
			soa.var_ad1a2a3c = int(max((soa.var_ad1a2a3c + 1) % 4, 1));
			switch(soa.var_ad1a2a3c)
			{
				case 1:
				{
					soa setmodel(#"hash_4330c469894950e2");
					break;
				}
				case 2:
				{
					soa setmodel(#"hash_322e5835a0cf66af");
					break;
				}
				case 3:
				{
					soa setmodel(#"hash_322e5735a0cf64fc");
					break;
				}
			}
		}
	#/
}

/*
	Name: function_b4a17ed2
	Namespace: namespace_19c99142
	Checksum: 0x10010C52
	Offset: 0xF3B0
	Size: 0x120
	Parameters: 0
	Flags: None
*/
function function_b4a17ed2()
{
	/#
		level.var_97c9c115 = [];
		foreach(soa in function_df254269())
		{
			nearest_player = arraygetclosest(soa.origin, function_a1ef346b());
			if(!isdefined(nearest_player))
			{
				continue;
			}
			var_b1f9c3ce = function_6aee3a5b(soa, nearest_player);
			if(isdefined(var_b1f9c3ce))
			{
				level.var_97c9c115 = arraycombine(var_b1f9c3ce, level.var_97c9c115, 0);
			}
		}
	#/
}

/*
	Name: function_4de3c0c
	Namespace: namespace_19c99142
	Checksum: 0x35EDF85
	Offset: 0xF4D8
	Size: 0x176
	Parameters: 0
	Flags: None
*/
function function_4de3c0c()
{
	/#
		level.("") = !is_true(level.(""));
		if(!is_true(level.("")))
		{
			level notify(#"kill_" + "");
			return;
		}
		level endon(#"kill_" + "");
		while(true)
		{
			i = 0;
			if(isdefined(level.var_97c9c115))
			{
				foreach(spot in level.var_97c9c115)
				{
					recordsphere(spot.origin, 10, (i === 0 ? (0, 1, 0) : (1, 1, 0)));
					i++;
				}
			}
			waitframe(1);
		}
	#/
}

/*
	Name: function_2e7ab4e5
	Namespace: namespace_19c99142
	Checksum: 0xC297C8D9
	Offset: 0xF658
	Size: 0x2CA
	Parameters: 0
	Flags: None
*/
function function_2e7ab4e5()
{
	/#
		level.("") = !is_true(level.(""));
		if(!is_true(level.("")))
		{
			level notify(#"kill_" + "");
			return;
		}
		level endon(#"kill_" + "");
		while(true)
		{
			foreach(soa in function_df254269())
			{
				if(!soa haspath())
				{
					continue;
				}
				var_30b7a63c = soa predictpath();
				status = var_30b7a63c[#"path_prediction_status"];
				if(status == 2)
				{
					flag_str = (soa flag::get(#"hash_5c35337a4e15867") ? "" : "");
					record3dtext("" + flag_str, soa.origin + vectorscale((0, 0, 1), 70), (0, 1, 0));
					final_pos = soa getfinalpathpos();
					recordline(soa.origin, final_pos, (0, 1, 0));
					continue;
				}
				flag_str = (soa flag::get(#"hash_5c35337a4e15867") ? "" : "");
				record3dtext("" + flag_str, soa.origin + vectorscale((0, 0, 1), 70), (1, 0, 0));
			}
			waitframe(1);
		}
	#/
}

/*
	Name: function_ae63c292
	Namespace: namespace_19c99142
	Checksum: 0xC1D36D74
	Offset: 0xF930
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
	Name: function_df254269
	Namespace: namespace_19c99142
	Checksum: 0x2CDEE655
	Offset: 0xF9A0
	Size: 0x2A
	Parameters: 0
	Flags: None
*/
function function_df254269()
{
	/#
		return getaiarchetypearray(#"soa");
	#/
}

