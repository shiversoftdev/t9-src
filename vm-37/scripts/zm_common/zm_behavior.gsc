#using script_3751b21462a54a7d;
#using script_2c5daa95f8fec03c;
#using scripts\zm_common\ai\zm_ai_utility.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;
#using script_3a88f428c6d8ef90;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_cleanup_mgr.gsc;
#using scripts\zm_common\zm_blockers.gsc;
#using scripts\zm_common\zm_behavior_utility.gsc;
#using scripts\zm_common\zm_attackables.gsc;
#using script_35b8a6927c851193;
#using scripts\zm_common\zm.gsc;
#using script_1940fc077a028a81;
#using script_3411bb48d41bd3b;
#using script_3357acf79ce92f4b;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\damagefeedback_shared.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\ai\zombie.gsc;
#using script_35598499769dbb3d;
#using script_41fe08c37d53a635;
#using script_522aeb6ae906391e;
#using script_3aa0f32b70d4f7cb;
#using script_178024232e91b0a1;
#using script_489b835a247c990e;
#using scripts\core_common\ai\archetype_utility.gsc;
#using script_4bf952f6ba31bb17;
#using script_4d85e8de54b02198;
#using script_caf007e2a98afa2;
#using scripts\core_common\weapons_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\ai_shared.gsc;
#using script_37aecc8eb906ed91;
#using scripts\abilities\gadgets\gadget_cymbal_monkey.gsc;

#namespace zm_behavior;

/*
	Name: function_70a657d8
	Namespace: zm_behavior
	Checksum: 0x12A7ED7A
	Offset: 0x6B0
	Size: 0x1C4
	Parameters: 0
	Flags: None
*/
function function_70a657d8()
{
	initzmbehaviorsandasm();
	if(!isdefined(level.zigzag_activation_distance))
	{
		level.zigzag_activation_distance = 175;
	}
	if(!isdefined(level.zigzag_distance_min))
	{
		level.zigzag_distance_min = 256;
	}
	if(!isdefined(level.zigzag_distance_max))
	{
		level.zigzag_distance_max = 400;
	}
	if(!isdefined(level.inner_zigzag_radius))
	{
		level.inner_zigzag_radius = 16;
	}
	if(!isdefined(level.outer_zigzag_radius))
	{
		level.outer_zigzag_radius = 128;
	}
	zm_utility::function_d0f02e71(#"zombie");
	spawner::add_archetype_spawn_function(#"zombie", &function_c15c6e44);
	spawner::add_archetype_spawn_function(#"zombie", &zombiespawninit);
	spawner::function_89a2cd87(#"zombie", &function_823a8ebd);
	level.do_randomized_zigzag_path = 1;
	level.zombie_targets = [];
	zm::register_actor_damage_callback(&function_7994fd99);
	zm::register_zombie_damage_override_callback(&function_95578a3c);
}

/*
	Name: zombiespawninit
	Namespace: zm_behavior
	Checksum: 0x5A277AF1
	Offset: 0x880
	Size: 0x18C
	Parameters: 0
	Flags: Linked, Private
*/
function private zombiespawninit()
{
	self pushplayer(0);
	self collidewithactors(0);
	self thread zm_utility::function_13cc9756();
	self.closest_player_override = &zm_utility::function_3d70ba7a;
	self.var_1731eda3 = 1;
	self.am_i_valid = 1;
	self.cant_move_cb = &zombiebehavior::function_22762653;
	self ai::set_behavior_attribute("use_attackable", 1);
	self callback::function_d8abfc3d(#"hash_1eda827ff5e6895b", &function_ff987791);
	self callback::function_d8abfc3d(#"hash_210adcf09e99fba1", &function_618ab591);
	self callback::function_d8abfc3d(#"hash_1518febf00439d5", &function_8b5bbd69);
	self callback::function_d8abfc3d(#"hash_34b65342cbfdadac", &function_d42e5f5b);
	self zm_spawner::zombie_spawn_init();
}

/*
	Name: function_823a8ebd
	Namespace: zm_behavior
	Checksum: 0x9E05FF8A
	Offset: 0xA18
	Size: 0x32
	Parameters: 0
	Flags: Linked, Private
*/
function private function_823a8ebd()
{
	function_cea9ab47(self);
	self.var_318a0ac8 = &function_29c1ba76;
}

/*
	Name: function_ff987791
	Namespace: zm_behavior
	Checksum: 0x9EE10BB7
	Offset: 0xA58
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function function_ff987791(params)
{
	if(isdefined(self.damageweapon) && self.damageweapon === getweapon(#"eq_slow_grenade"))
	{
		self clientfield::set("stunned_head_fx", 1);
	}
}

/*
	Name: function_618ab591
	Namespace: zm_behavior
	Checksum: 0x651DEDD0
	Offset: 0xAC8
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function function_618ab591(params)
{
	self clientfield::set("stunned_head_fx", 0);
}

/*
	Name: function_8b5bbd69
	Namespace: zm_behavior
	Checksum: 0xFA5A4C4A
	Offset: 0xB00
	Size: 0x344
	Parameters: 1
	Flags: Linked
*/
function function_8b5bbd69(params)
{
	self endon(#"hash_7aba28bf3e3cf9cd", #"death");
	traversalstartpos = self.traversalstartpos;
	traversalendpos = self.traversalendpos;
	traversalstartnode = self.traversestartnode;
	aitype = self.aitype;
	wait(10);
	if(isdefined(traversalendpos))
	{
		self forceteleport(traversalendpos);
	}
	if(getdvarint(#"hash_704243ad84566af7", 1) && (isdefined(traversalstartpos) && (isdefined(traversalendpos) && isdefined(aitype))))
	{
		var_96c5333a = !isdefined(traversalstartnode);
		if(!var_96c5333a)
		{
			eventparams = {#hash_23deb7ad:traversalstartnode.origin[2], #hash_3524da39:traversalstartnode.origin[1], #hash_b5b65b52:traversalstartnode.origin[0], #hash_340139b7:traversalendpos[2], #hash_40385225:traversalendpos[1], #hash_f774409e:traversalendpos[0], #hash_83cf29c8:traversalstartpos[2], #hash_753e8ca7:traversalstartpos[1], #hash_83e229fa:traversalstartpos[0], #spawner_name:hash(aitype)};
			function_92d1707f(#"hash_6ec90ea3ba426491", eventparams);
		}
		else
		{
			eventparams = {#hash_340139b7:traversalendpos[2], #hash_40385225:traversalendpos[1], #hash_f774409e:traversalendpos[0], #hash_83cf29c8:traversalstartpos[2], #hash_753e8ca7:traversalstartpos[1], #hash_83e229fa:traversalstartpos[0], #spawner_name:hash(aitype)};
			function_92d1707f(#"hash_1bf75b08b5ca39a9", eventparams);
		}
	}
	self finishtraversal();
}

/*
	Name: function_d42e5f5b
	Namespace: zm_behavior
	Checksum: 0xCF316775
	Offset: 0xE50
	Size: 0x1E
	Parameters: 1
	Flags: Linked
*/
function function_d42e5f5b(params)
{
	self notify(#"hash_7aba28bf3e3cf9cd");
}

/*
	Name: function_c15c6e44
	Namespace: zm_behavior
	Checksum: 0xEABB8B1A
	Offset: 0xE78
	Size: 0x56
	Parameters: 0
	Flags: Linked, Private
*/
function private function_c15c6e44()
{
	self endon(#"death");
	self waittill(#"completed_emerging_into_playable_area");
	self.var_641025d6 = gettime() + self ai::function_9139c839().var_9c0ebe1e;
}

/*
	Name: function_8ac3bea9
	Namespace: zm_behavior
	Checksum: 0x34B15484
	Offset: 0xED8
	Size: 0x3C
	Parameters: 0
	Flags: None
*/
function function_8ac3bea9()
{
	array::thread_all(level.zombie_spawners, &spawner::add_spawn_function, &function_d63f6426);
}

/*
	Name: function_d63f6426
	Namespace: zm_behavior
	Checksum: 0x5B4BD41
	Offset: 0xF20
	Size: 0x12E
	Parameters: 0
	Flags: Linked
*/
function function_d63f6426()
{
	if(!isdefined(self._starting_round_number))
	{
		self zm_cleanup::function_aa5726f2();
	}
	self zm_utility::init_zombie_run_cycle();
	self thread zm_spawner::zombie_think();
	if(isdefined(level._zombie_custom_spawn_logic))
	{
		if(isarray(level._zombie_custom_spawn_logic))
		{
			for(i = 0; i < level._zombie_custom_spawn_logic.size; i++)
			{
				self thread [[level._zombie_custom_spawn_logic[i]]]();
			}
		}
		else
		{
			self thread [[level._zombie_custom_spawn_logic]]();
		}
	}
	if(isdefined(level.zombie_init_done))
	{
		self [[level.zombie_init_done]]();
	}
	self.zombie_init_done = 1;
	self zm_score::function_82732ced();
	self notify(#"zombie_init_done");
}

/*
	Name: initzmbehaviorsandasm
	Namespace: zm_behavior
	Checksum: 0xE8B8AFB3
	Offset: 0x1058
	Size: 0x3494
	Parameters: 0
	Flags: Linked, Private
*/
function private initzmbehaviorsandasm()
{
	/#
		assert(iscodefunctionptr(&function_3227edfe));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_14f90f9369756366", &function_3227edfe);
	/#
		assert(isscriptfunctionptr(&shouldmovecondition));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"zombieshouldmove", &shouldmovecondition);
	/#
		assert(isscriptfunctionptr(&zombieshouldtearcondition));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"zombieshouldtear", &zombieshouldtearcondition);
	/#
		assert(isscriptfunctionptr(&zombieshouldattackthroughboardscondition));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"zombieshouldattackthroughboards", &zombieshouldattackthroughboardscondition);
	/#
		assert(isscriptfunctionptr(&zombieshouldattackthroughboardscondition));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"zombieshouldattackthroughboards", &zombieshouldattackthroughboardscondition);
	/#
		assert(isscriptfunctionptr(&zombieshouldtauntcondition));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"zombieshouldtaunt", &zombieshouldtauntcondition);
	/#
		assert(isscriptfunctionptr(&zombieshouldtauntcondition));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"zombieshouldtaunt", &zombieshouldtauntcondition);
	/#
		assert(isscriptfunctionptr(&zombiegottoentrancecondition));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"zombiegottoentrance", &zombiegottoentrancecondition);
	/#
		assert(isscriptfunctionptr(&zombiegottoattackspotcondition));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"zombiegottoattackspot", &zombiegottoattackspotcondition);
	/#
		assert(isscriptfunctionptr(&zombiehasattackspotalreadycondition));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"zombiehasattackspotalready", &zombiehasattackspotalreadycondition);
	/#
		assert(isscriptfunctionptr(&zombiehasattackspotalreadycondition));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"zombiehasattackspotalready", &zombiehasattackspotalreadycondition);
	/#
		assert(isscriptfunctionptr(&zombieshouldenterplayablecondition));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"zombieshouldenterplayable", &zombieshouldenterplayablecondition);
	/#
		assert(isscriptfunctionptr(&ischunkvalidcondition));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"ischunkvalid", &ischunkvalidcondition);
	/#
		assert(isscriptfunctionptr(&ischunkvalidcondition));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"ischunkvalid", &ischunkvalidcondition);
	/#
		assert(isscriptfunctionptr(&inplayablearea));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"inplayablearea", &inplayablearea);
	/#
		assert(isscriptfunctionptr(&shouldskipteardown));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"shouldskipteardown", &shouldskipteardown);
	/#
		assert(isscriptfunctionptr(&zombieisthinkdone));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"zombieisthinkdone", &zombieisthinkdone);
	/#
		assert(isscriptfunctionptr(&zombieisatgoal));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"zombieisatgoal", &zombieisatgoal);
	/#
		assert(isscriptfunctionptr(&zombieisatgoal));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"zombieisatgoal", &zombieisatgoal);
	/#
		assert(isscriptfunctionptr(&zombieisatentrance));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"zombieisatentrance", &zombieisatentrance);
	/#
		assert(isscriptfunctionptr(&function_4c12882b));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_626619641083db91", &function_4c12882b);
	/#
		assert(isscriptfunctionptr(&function_4c12882b));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_626619641083db91", &function_4c12882b);
	/#
		assert(isscriptfunctionptr(&function_b86a1b9d));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_150eeb42b488a14e", &function_b86a1b9d);
	/#
		assert(isscriptfunctionptr(&function_b86a1b9d));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_150eeb42b488a14e", &function_b86a1b9d);
	/#
		assert(isscriptfunctionptr(&function_e7f2e349));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_3f46416df5ad6e3e", &function_e7f2e349);
	/#
		assert(isscriptfunctionptr(&function_e7f2e349));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_3f46416df5ad6e3e", &function_e7f2e349);
	/#
		assert(isscriptfunctionptr(&function_45009145));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_2a86b9d29348a4df", &function_45009145);
	/#
		assert(isscriptfunctionptr(&function_a5a66d65));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_f8bf19d37668bca", &function_a5a66d65);
	/#
		assert(isscriptfunctionptr(&zombieshouldmoveawaycondition));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"zombieshouldmoveaway", &zombieshouldmoveawaycondition);
	/#
		assert(isscriptfunctionptr(&waskilledbyteslacondition));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"waskilledbytesla", &waskilledbyteslacondition);
	/#
		assert(isscriptfunctionptr(&function_a00b473a));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_3cf91e708d0422b", &function_a00b473a);
	/#
		assert(isscriptfunctionptr(&function_8396494f));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_176a3ec851460d73", &function_8396494f);
	/#
		assert(isscriptfunctionptr(&zombieshouldstun));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"zombieshouldstun", &zombieshouldstun);
	/#
		assert(isscriptfunctionptr(&zombieisbeinggrappled));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"zombieisbeinggrappled", &zombieisbeinggrappled);
	/#
		assert(isscriptfunctionptr(&zombieshouldknockdown));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"zombieshouldknockdown", &zombieshouldknockdown);
	/#
		assert(isscriptfunctionptr(&zombieispushed));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"zombieispushed", &zombieispushed);
	/#
		assert(isscriptfunctionptr(&zombiekilledwhilegettingpulled));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"zombiekilledwhilegettingpulled", &zombiekilledwhilegettingpulled);
	/#
		assert(isscriptfunctionptr(&zombiekilledbyblackholebombcondition));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"zombiekilledbyblackholebombcondition", &zombiekilledbyblackholebombcondition);
	/#
		assert(isscriptfunctionptr(&function_38fec26f));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_18fea53546637859", &function_38fec26f);
	/#
		assert(isscriptfunctionptr(&function_e4d7303f));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_32d8ffc79910d80b", &function_e4d7303f);
	/#
		assert(isscriptfunctionptr(&function_17cd1b17));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_1da059a5800a95c5", &function_17cd1b17);
	/#
		assert(isscriptfunctionptr(&function_691fecba));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_1492e6d3746e9ebb", &function_691fecba);
	/#
		assert(isscriptfunctionptr(&function_d8b225ae));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_651ab332997a387f", &function_d8b225ae);
	/#
		assert(isscriptfunctionptr(&function_cbb1e2bb));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_389ee9c3a9dad550", &function_cbb1e2bb);
	/#
		assert(isscriptfunctionptr(&disablepowerups));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"disablepowerups", &disablepowerups);
	/#
		assert(isscriptfunctionptr(&enablepowerups));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"enablepowerups", &enablepowerups);
	/#
		assert(isscriptfunctionptr(&function_77a0b45d));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_7acebd497b8032d5", &function_77a0b45d);
	/#
		assert(isscriptfunctionptr(&function_fa2814ae));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_6f98de025a95b79a", &function_fa2814ae);
	/#
		assert(!isdefined(&zombiemovetoentranceaction) || isscriptfunctionptr(&zombiemovetoentranceaction));
	#/
	/#
		assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
	#/
	/#
		assert(!isdefined(&zombiemovetoentranceactionterminate) || isscriptfunctionptr(&zombiemovetoentranceactionterminate));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction(#"zombiemovetoentranceaction", &zombiemovetoentranceaction, undefined, &zombiemovetoentranceactionterminate);
	/#
		assert(!isdefined(&zombiemovetoattackspotaction) || isscriptfunctionptr(&zombiemovetoattackspotaction));
	#/
	/#
		assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
	#/
	/#
		assert(!isdefined(&zombiemovetoattackspotactionterminate) || isscriptfunctionptr(&zombiemovetoattackspotactionterminate));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction(#"zombiemovetoattackspotaction", &zombiemovetoattackspotaction, undefined, &zombiemovetoattackspotactionterminate);
	/#
		assert(isscriptfunctionptr(&function_6eb4f847));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_5a7ebfd6f2aaad7b", &function_6eb4f847);
	/#
		assert(isscriptfunctionptr(&function_547701ae));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_3006c33ad53fb0be", &function_547701ae);
	/#
		assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
	#/
	/#
		assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
	#/
	/#
		assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction(#"zombieidleaction", undefined, undefined, undefined);
	/#
		assert(!isdefined(&zombiemoveaway) || isscriptfunctionptr(&zombiemoveaway));
	#/
	/#
		assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
	#/
	/#
		assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction(#"zombiemoveaway", &zombiemoveaway, undefined, undefined);
	/#
		assert(!isdefined(&zombietraverseaction) || isscriptfunctionptr(&zombietraverseaction));
	#/
	/#
		assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
	#/
	/#
		assert(!isdefined(&zombietraverseactionterminate) || isscriptfunctionptr(&zombietraverseactionterminate));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction(#"zombietraverseaction", &zombietraverseaction, undefined, &zombietraverseactionterminate);
	/#
		assert(!isdefined(&zombieholdboardaction) || isscriptfunctionptr(&zombieholdboardaction));
	#/
	/#
		assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
	#/
	/#
		assert(!isdefined(&zombieholdboardactionterminate) || isscriptfunctionptr(&zombieholdboardactionterminate));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction(#"holdboardaction", &zombieholdboardaction, undefined, &zombieholdboardactionterminate);
	/#
		assert(!isdefined(&zombiegrabboardaction) || isscriptfunctionptr(&zombiegrabboardaction));
	#/
	/#
		assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
	#/
	/#
		assert(!isdefined(&zombiegrabboardactionterminate) || isscriptfunctionptr(&zombiegrabboardactionterminate));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction(#"grabboardaction", &zombiegrabboardaction, undefined, &zombiegrabboardactionterminate);
	/#
		assert(isscriptfunctionptr(&function_66a8aef2));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_2c6c8e7fbe32827d", &function_66a8aef2);
	/#
		assert(isscriptfunctionptr(&function_16251b30));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_7b8b6e4f20e7c65c", &function_16251b30);
	/#
		assert(!isdefined(&zombiepullboardaction) || isscriptfunctionptr(&zombiepullboardaction));
	#/
	/#
		assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
	#/
	/#
		assert(!isdefined(&zombiepullboardactionterminate) || isscriptfunctionptr(&zombiepullboardactionterminate));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction(#"pullboardaction", &zombiepullboardaction, undefined, &zombiepullboardactionterminate);
	/#
		assert(isscriptfunctionptr(&function_aa76355a));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_6e6a6ae6dbfda8b6", &function_aa76355a);
	/#
		assert(isscriptfunctionptr(&function_76d619c8));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_61d9bc9bf2de7261", &function_76d619c8);
	/#
		assert(isscriptfunctionptr(&barricadebreakterminate));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("barricadeBreakTerminate", &barricadebreakterminate);
	/#
		assert(!isdefined(&zombieattackthroughboardsaction) || isscriptfunctionptr(&zombieattackthroughboardsaction));
	#/
	/#
		assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
	#/
	/#
		assert(!isdefined(&zombieattackthroughboardsactionterminate) || isscriptfunctionptr(&zombieattackthroughboardsactionterminate));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction(#"zombieattackthroughboardsaction", &zombieattackthroughboardsaction, undefined, &zombieattackthroughboardsactionterminate);
	/#
		assert(isscriptfunctionptr(&function_ebba4d65));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_5cf57595a9a7f525", &function_ebba4d65);
	/#
		assert(isscriptfunctionptr(&function_28b47cc8));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_1b4d2e123def1564", &function_28b47cc8);
	/#
		assert(!isdefined(&zombietauntaction) || isscriptfunctionptr(&zombietauntaction));
	#/
	/#
		assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
	#/
	/#
		assert(!isdefined(&zombietauntactionterminate) || isscriptfunctionptr(&zombietauntactionterminate));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction(#"zombietauntaction", &zombietauntaction, undefined, &zombietauntactionterminate);
	/#
		assert(isscriptfunctionptr(&function_eb270aac));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_5d23aebf14e71bd5", &function_eb270aac);
	/#
		assert(isscriptfunctionptr(&function_ba06c8a0));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_5e8abe4da3ebfbd4", &function_ba06c8a0);
	/#
		assert(!isdefined(&zombiemantleaction) || isscriptfunctionptr(&zombiemantleaction));
	#/
	/#
		assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
	#/
	/#
		assert(!isdefined(&zombiemantleactionterminate) || isscriptfunctionptr(&zombiemantleactionterminate));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction(#"zombiemantleaction", &zombiemantleaction, undefined, &zombiemantleactionterminate);
	/#
		assert(!isdefined(&zombiestunactionstart) || isscriptfunctionptr(&zombiestunactionstart));
	#/
	/#
		assert(!isdefined(&function_4e52c07) || isscriptfunctionptr(&function_4e52c07));
	#/
	/#
		assert(!isdefined(&zombiestunactionend) || isscriptfunctionptr(&zombiestunactionend));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction(#"zombiestunaction", &zombiestunactionstart, &function_4e52c07, &zombiestunactionend);
	/#
		assert(isscriptfunctionptr(&zombiestunstart));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"zombiestunstart", &zombiestunstart);
	/#
		assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
	#/
	/#
		assert(!isdefined(&function_4e52c07) || isscriptfunctionptr(&function_4e52c07));
	#/
	/#
		assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction(#"zombiestunactionloop", undefined, &function_4e52c07, undefined);
	/#
		assert(isscriptfunctionptr(&function_c377438f));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_5cae731c54d7a310", &function_c377438f);
	/#
		assert(isscriptfunctionptr(&function_7531db00));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_3ec08de422ecdfa7", &function_7531db00);
	/#
		assert(isscriptfunctionptr(&function_1329e086));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_cf69ce67c8c33fc", &function_1329e086);
	/#
		assert(isscriptfunctionptr(&zombiegrappleactionstart));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"zombiegrappleactionstart", &zombiegrappleactionstart);
	/#
		assert(isscriptfunctionptr(&zombieknockdownactionstart));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"zombieknockdownactionstart", &zombieknockdownactionstart);
	/#
		assert(isscriptfunctionptr(&function_c8939973));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_a6273a84b4237ce", &function_c8939973);
	/#
		assert(isscriptfunctionptr(&zombiepushedactionstart));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"zombiepushedactionstart", &zombiepushedactionstart);
	/#
		assert(isscriptfunctionptr(&zombiepushedactionterminate));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"zombiepushedactionterminate", &zombiepushedactionterminate);
	/#
		assert(!isdefined(&zombieblackholebombpullstart) || isscriptfunctionptr(&zombieblackholebombpullstart));
	#/
	/#
		assert(!isdefined(&zombieblackholebombpullupdate) || isscriptfunctionptr(&zombieblackholebombpullupdate));
	#/
	/#
		assert(!isdefined(&zombieblackholebombpullend) || isscriptfunctionptr(&zombieblackholebombpullend));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction(#"zombieblackholebombpullaction", &zombieblackholebombpullstart, &zombieblackholebombpullupdate, &zombieblackholebombpullend);
	/#
		assert(!isdefined(&zombiekilledbyblackholebombstart) || isscriptfunctionptr(&zombiekilledbyblackholebombstart));
	#/
	/#
		assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
	#/
	/#
		assert(!isdefined(&zombiekilledbyblackholebombend) || isscriptfunctionptr(&zombiekilledbyblackholebombend));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction(#"zombieblackholebombdeathaction", &zombiekilledbyblackholebombstart, undefined, &zombiekilledbyblackholebombend);
	/#
		assert(isscriptfunctionptr(&function_b654f4f5));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_2574c98f8c8e07ea", &function_b654f4f5);
	/#
		assert(isscriptfunctionptr(&function_36b3cb7d));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_65c425729831f505", &function_36b3cb7d);
	/#
		assert(isscriptfunctionptr(&getchunkservice));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"getchunkservice", &getchunkservice);
	/#
		assert(isscriptfunctionptr(&function_38237e30));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_4dde9e6bcca48bcb", &function_38237e30);
	/#
		assert(isscriptfunctionptr(&updatechunkservice));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"updatechunkservice", &updatechunkservice);
	/#
		assert(isscriptfunctionptr(&updateattackspotservice));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"updateattackspotservice", &updateattackspotservice);
	/#
		assert(isscriptfunctionptr(&function_b3311a1a));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_24d32558bbe4dd3b", &function_b3311a1a);
	/#
		assert(isscriptfunctionptr(&findnodesservice));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"findnodesservice", &findnodesservice);
	/#
		assert(isscriptfunctionptr(&function_92d348e2));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_7f1ef64b934748c3", &function_92d348e2);
	/#
		assert(isscriptfunctionptr(&function_4180f67));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_74a2d8577b2cd1", &function_4180f67, 2);
	/#
		assert(isscriptfunctionptr(&function_754be649));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_5b9e89679b8c51f9", &function_754be649, 10);
	/#
		assert(isscriptfunctionptr(&function_fae6123));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_52ef96cc6c0bfb77", &function_fae6123, 20);
	/#
		assert(isscriptfunctionptr(&zombieattackableobjectservice));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"zombieattackableobjectservice", &zombieattackableobjectservice, 4);
	/#
		assert(isscriptfunctionptr(&function_fb814207));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"zombiefindfleshservice", &function_fb814207, 3);
	/#
		assert(isscriptfunctionptr(&function_f637b05d));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_712f0844b14c72fe", &function_f637b05d, 1);
	/#
		assert(isscriptfunctionptr(&function_483766be));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_3a0b725ea5525c8d", &function_483766be, 1);
	/#
		assert(isscriptfunctionptr(&zombieenteredplayable));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"zombieenteredplayableservice", &zombieenteredplayable);
	animationstatenetwork::registeranimationmocomp("mocomp_board_tear@zombie", &boardtearmocompstart, &boardtearmocompupdate, undefined);
	animationstatenetwork::registeranimationmocomp("mocomp_barricade_enter@zombie", &barricadeentermocompstart, &barricadeentermocompupdate, &barricadeentermocompterminate);
	animationstatenetwork::registeranimationmocomp("mocomp_barricade_enter_no_z@zombie", &barricadeentermocompnozstart, &barricadeentermocompnozupdate, &barricadeentermocompnozterminate);
	animationstatenetwork::registernotetrackhandlerfunction("destroy_piece", &notetrackboardtear);
	animationstatenetwork::registernotetrackhandlerfunction("zombie_window_melee", &notetrackboardmelee);
	animationstatenetwork::registernotetrackhandlerfunction("smash_board", &function_b37b8c0d);
	animationstatenetwork::registernotetrackhandlerfunction("bhb_burst", &zombiebhbburst);
	animationstatenetwork::registernotetrackhandlerfunction("freezegun_hide", &function_36b3cb7d);
	setdvar(#"scr_zm_use_code_enemy_selection", 0);
}

/*
	Name: function_cbb1e2bb
	Namespace: zm_behavior
	Checksum: 0xE26DE462
	Offset: 0x44F8
	Size: 0xBA
	Parameters: 1
	Flags: Linked
*/
function function_cbb1e2bb(entity)
{
	if(!is_true(self.missinglegs) || (!gibserverutils::isgibbed(entity, 128) && !gibserverutils::isgibbed(entity, 256)) || !isdefined(self.var_177172b0) || (gettime() - self.var_177172b0) < (int(0.2 * 1000)))
	{
		return false;
	}
	return true;
}

/*
	Name: function_d8b225ae
	Namespace: zm_behavior
	Checksum: 0x77393DB8
	Offset: 0x45C0
	Size: 0xF6
	Parameters: 1
	Flags: Linked
*/
function function_d8b225ae(entity)
{
	if(!isdefined(entity.attackable))
	{
		return false;
	}
	radius = entity.goalradius;
	if(is_true(entity.allowoffnavmesh))
	{
		radius = 16;
	}
	if(isdefined(entity.var_b238ef38) && distance2dsquared(entity.origin, entity.var_b238ef38.position) < sqr(radius) && (abs(entity.origin[2] - entity.var_b238ef38.position[2])) < 50)
	{
		return true;
	}
	return false;
}

/*
	Name: function_4180f67
	Namespace: zm_behavior
	Checksum: 0x4137524C
	Offset: 0x46C0
	Size: 0xAC
	Parameters: 1
	Flags: Linked
*/
function function_4180f67(entity)
{
	entity.var_2d78e306 = 0;
	entity.var_b719e78 = 1;
	if(is_true(entity.var_4c85ebad))
	{
		entity.var_2d78e306 = 1;
		return true;
	}
	if(function_d8b225ae(entity))
	{
		entity.var_2d78e306 = 1;
		return true;
	}
	if(is_true(entity.ignoremelee))
	{
		entity.var_b719e78 = 0;
		return true;
	}
	return true;
}

/*
	Name: function_754be649
	Namespace: zm_behavior
	Checksum: 0xFE9AD4F3
	Offset: 0x4778
	Size: 0x4C8
	Parameters: 1
	Flags: Linked
*/
function function_754be649(entity)
{
	entity.var_85cea06c = 0;
	entity.var_d1bb0ad = 1;
	if(!isdefined(entity.enemy))
	{
		entity.var_d1bb0ad = 0;
		return true;
	}
	if(!namespace_85745671::is_player_valid(entity.enemy) && !namespace_85745671::function_1b9ed9b0(entity.enemy) && entity.team === level.zombie_team)
	{
		entity.var_d1bb0ad = 0;
		return true;
	}
	entity.meleedistsq = zombiebehavior::function_997f1224(entity);
	entity.var_5a81324d = undefined;
	entity.var_b3538985 = entity.enemy.origin;
	if(isplayer(entity.enemy) || is_true(entity.enemy.is_companion))
	{
		if(!is_true(zm_utility::is_classic()))
		{
			if(namespace_85745671::function_142c3c86(entity.enemy))
			{
				entity.var_5a81324d = entity.enemy getvehicleoccupied();
				var_81952387 = entity.var_5a81324d.origin;
				for(i = 0; i < 11; i++)
				{
					if(entity.var_5a81324d function_dcef0ba1(i))
					{
						var_ec950ebd = entity.var_5a81324d function_defc91b2(i);
						if(isdefined(var_ec950ebd) && var_ec950ebd >= 0)
						{
							seat_pos = entity.var_5a81324d function_5051cc0c(i);
							if(distancesquared(entity.origin, var_81952387) > distancesquared(entity.origin, seat_pos))
							{
								var_81952387 = seat_pos;
							}
						}
					}
				}
				entity.var_b3538985 = var_81952387;
			}
			else
			{
				if(isvehicle(entity.enemy getgroundent()))
				{
					entity.var_5a81324d = entity.enemy getgroundent();
					entity.var_b3538985 = (isdefined(entity.enemy.last_valid_position) ? entity.enemy.last_valid_position : entity.enemy.origin);
				}
				else if(isvehicle(entity.enemy getmoverent()))
				{
					entity.var_5a81324d = entity.enemy getmoverent();
					entity.var_b3538985 = (isdefined(entity.enemy.last_valid_position) ? entity.enemy.last_valid_position : entity.enemy.origin);
				}
			}
		}
		if(isdefined(entity.var_5a81324d) && isdefined(entity.var_cbc65493))
		{
			entity.meleedistsq = entity.meleedistsq * entity.var_cbc65493;
		}
	}
	if(is_true(self.isonnavmesh) && !tracepassedonnavmesh(entity.origin, (isdefined(entity.enemy.last_valid_position) ? entity.enemy.last_valid_position : entity.enemy.origin), entity.enemy getpathfindingradius()))
	{
		entity.var_d1bb0ad = 0;
		return true;
	}
	return true;
}

/*
	Name: function_fae6123
	Namespace: zm_behavior
	Checksum: 0xC7E397CD
	Offset: 0x4C48
	Size: 0x2DC
	Parameters: 1
	Flags: Linked
*/
function function_fae6123(entity)
{
	entity.var_2fe49a8a = 0;
	entity.var_e8e74caf = 1;
	if(isdefined(entity.zombie_poi))
	{
		entity.var_e8e74caf = 0;
		return true;
	}
	if(isdefined(entity.enemy_override))
	{
		entity.var_e8e74caf = 0;
		return true;
	}
	if(isdefined(entity.var_b3538985) && isdefined(entity.enemy))
	{
		if(abs(entity.origin[2] - entity.var_b3538985[2]) > (isdefined(entity.var_737e8510) ? entity.var_737e8510 : 64))
		{
			entity.var_e8e74caf = 0;
			return true;
		}
		if(distancesquared(entity.origin, entity.var_b3538985) > entity.meleedistsq)
		{
			entity.var_e8e74caf = 0;
			return true;
		}
		yawtoenemy = angleclamp180(entity.angles[1] - (vectortoangles(entity.enemy.origin - entity.origin)[1]));
		if(abs(yawtoenemy) > (isdefined(entity.var_1c0eb62a) ? entity.var_1c0eb62a : 60))
		{
			entity.var_e8e74caf = 0;
			return true;
		}
		if(!entity cansee((isdefined(entity.var_5a81324d) ? entity.var_5a81324d : entity.enemy)))
		{
			entity.var_e8e74caf = 0;
			return true;
		}
		if(distancesquared(entity.origin, entity.var_b3538985) < sqr(40))
		{
			entity.var_2fe49a8a = 1;
			return true;
		}
		if(isdefined(entity.var_5a81324d))
		{
			entity.var_2fe49a8a = 1;
			return true;
		}
	}
	else
	{
		entity.var_e8e74caf = 0;
		return true;
	}
	if(is_true(entity.var_1fa24724))
	{
		entity.var_e8e74caf = 0;
		return true;
	}
	return true;
}

/*
	Name: function_691fecba
	Namespace: zm_behavior
	Checksum: 0x22A004A4
	Offset: 0x4F30
	Size: 0x10E
	Parameters: 1
	Flags: Linked
*/
function function_691fecba(entity)
{
	if(entity function_dd070839())
	{
		return false;
	}
	if(is_true(entity.var_b719e78) && is_true(entity.var_d1bb0ad) && is_true(entity.var_e8e74caf) || (is_true(entity.var_2d78e306) || is_true(entity.var_85cea06c) || is_true(entity.var_2fe49a8a)))
	{
		entity.idletime = gettime();
		entity.var_1b250399 = entity.origin;
		return true;
	}
	return false;
}

/*
	Name: function_fb814207
	Namespace: zm_behavior
	Checksum: 0x2E885469
	Offset: 0x5048
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function function_fb814207(behaviortreeentity)
{
	if(is_true(behaviortreeentity.ai.var_870d0893))
	{
		return;
	}
	if(isdefined(self.var_72411ccf))
	{
		self [[self.var_72411ccf]](self);
	}
	else
	{
		self zombiefindflesh(self);
	}
}

/*
	Name: zombiefindflesh
	Namespace: zm_behavior
	Checksum: 0x2F1D179F
	Offset: 0x50C0
	Size: 0xB4A
	Parameters: 1
	Flags: Linked
*/
function zombiefindflesh(behaviortreeentity)
{
	if(isdefined(behaviortreeentity.enablepushtime))
	{
		if(gettime() >= behaviortreeentity.enablepushtime)
		{
			behaviortreeentity collidewithactors(1);
			behaviortreeentity.enablepushtime = undefined;
		}
	}
	if(getdvarint(#"scr_zm_use_code_enemy_selection", 0))
	{
		zombiefindfleshcode(behaviortreeentity);
		return;
	}
	if(level.intermission)
	{
		if(isdefined(level.var_b813f909))
		{
			[[level.var_b813f909]](behaviortreeentity);
		}
		return;
	}
	if(is_true(behaviortreeentity.var_67faa700))
	{
		return;
	}
	if(behaviortreeentity getpathmode() == "dont move")
	{
		return;
	}
	behaviortreeentity.ignore_player = [];
	behaviortreeentity.goalradius = 30;
	if(is_true(behaviortreeentity.ignore_find_flesh))
	{
		return;
	}
	if(behaviortreeentity.team == #"allies")
	{
		behaviortreeentity findzombieenemy();
		return;
	}
	if(zombieshouldmoveawaycondition(behaviortreeentity))
	{
		return;
	}
	decoy = nightingale::function_29fbe24f(behaviortreeentity);
	monkey = gadget_cymbal_monkey::function_4a5dff80(behaviortreeentity, 0);
	if(isdefined(monkey) && isdefined(decoy))
	{
		self.enemy_override = arraygetclosest(behaviortreeentity.origin, array(monkey, decoy));
	}
	else
	{
		if(isdefined(monkey))
		{
			self.enemy_override = monkey;
		}
		else if(isdefined(decoy))
		{
			self.enemy_override = decoy;
		}
	}
	zombie_poi = behaviortreeentity zm_utility::get_zombie_point_of_interest(behaviortreeentity.origin);
	behaviortreeentity.zombie_poi = zombie_poi;
	players = getplayers();
	if(!isdefined(behaviortreeentity.ignore_player) || players.size == 1)
	{
		behaviortreeentity.ignore_player = [];
	}
	else if(!isdefined(level._should_skip_ignore_player_logic) || ![[level._should_skip_ignore_player_logic]]())
	{
		i = 0;
		while(i < behaviortreeentity.ignore_player.size)
		{
			if(isdefined(behaviortreeentity.ignore_player[i]) && isdefined(behaviortreeentity.ignore_player[i].ignore_counter) && behaviortreeentity.ignore_player[i].ignore_counter > 3)
			{
				behaviortreeentity.ignore_player[i].ignore_counter = 0;
				behaviortreeentity.ignore_player = arrayremovevalue(behaviortreeentity.ignore_player, behaviortreeentity.ignore_player[i]);
				if(!isdefined(behaviortreeentity.ignore_player))
				{
					behaviortreeentity.ignore_player = [];
				}
				i = 0;
				continue;
			}
			i++;
		}
	}
	behaviortreeentity zombie_utility::run_ignore_player_handler();
	designated_target = 0;
	if(isdefined(behaviortreeentity.var_93a62fe) && is_true(behaviortreeentity.var_93a62fe.b_is_designated_target))
	{
		designated_target = 1;
	}
	if(!isdefined(behaviortreeentity.var_93a62fe) && !isdefined(self.enemy_override) && !isdefined(behaviortreeentity.attackable))
	{
		if(isdefined(behaviortreeentity.ignore_player))
		{
			if(isdefined(level._should_skip_ignore_player_logic) && [[level._should_skip_ignore_player_logic]]())
			{
				return;
			}
			behaviortreeentity.ignore_player = [];
		}
		/#
			if(is_true(behaviortreeentity.ispuppet))
			{
				return;
			}
		#/
		if(isdefined(level.no_target_override))
		{
			[[level.no_target_override]](behaviortreeentity);
		}
		else
		{
			behaviortreeentity setgoal(behaviortreeentity.origin);
		}
		function_9d92b55a(behaviortreeentity);
		return;
	}
	if(isdefined(level.var_d22435d9))
	{
		[[level.var_d22435d9]](behaviortreeentity);
	}
	if(!isdefined(level.check_for_alternate_poi) || ![[level.check_for_alternate_poi]]())
	{
		if(isdefined(zombie_poi))
		{
			behaviortreeentity.enemy_override = zombie_poi.poi_ent;
			behaviortreeentity.enemy_override.var_dfa42180 = &zm_utility::function_49f80b6f;
		}
		behaviortreeentity.favoriteenemy = behaviortreeentity.var_93a62fe;
	}
	if(isdefined(behaviortreeentity.v_zombie_custom_goal_pos))
	{
		goalpos = behaviortreeentity.v_zombie_custom_goal_pos;
		if(isdefined(behaviortreeentity.n_zombie_custom_goal_radius))
		{
			behaviortreeentity.goalradius = behaviortreeentity.n_zombie_custom_goal_radius;
		}
		behaviortreeentity setgoal(goalpos);
		function_9d92b55a(behaviortreeentity);
	}
	else
	{
		if(isdefined(behaviortreeentity.enemy_override))
		{
			behaviortreeentity.has_exit_point = undefined;
			goalpos = behaviortreeentity.enemy_override.origin;
			if(isdefined(behaviortreeentity.enemy_override.var_dfa42180))
			{
				goalpos = behaviortreeentity.enemy_override [[behaviortreeentity.enemy_override.var_dfa42180]](self);
			}
			if(isdefined(goalpos))
			{
				goalpos = getclosestpointonnavmesh(goalpos, 200, 0);
			}
			if(isdefined(goalpos))
			{
				if(!isdefined(zombie_poi))
				{
					aiprofile_beginentry("zombiefindflesh-enemyoverride");
					queryresult = positionquery_source_navigation(goalpos, 0, 48, 36, 4);
					aiprofile_endentry();
					foreach(point in queryresult.data)
					{
						goalpos = point.origin;
						break;
					}
				}
				behaviortreeentity setgoal(goalpos);
			}
			if(self isatgoal() || !isdefined(goalpos))
			{
				self clearpath();
				behaviortreeentity.keep_moving = 0;
			}
			function_9d92b55a(behaviortreeentity);
		}
		else
		{
			if(isdefined(behaviortreeentity.attackable) && !designated_target)
			{
				if(isdefined(behaviortreeentity.attackable_slot))
				{
					if(isdefined(behaviortreeentity.attackable_goal_radius))
					{
						behaviortreeentity.goalradius = behaviortreeentity.attackable_goal_radius;
					}
					nav_mesh = getclosestpointonnavmesh(behaviortreeentity.attackable_slot.origin, 64);
					if(isdefined(nav_mesh))
					{
						behaviortreeentity setgoal(nav_mesh);
					}
					else
					{
						behaviortreeentity setgoal(behaviortreeentity.attackable_slot.origin);
					}
				}
				else if(isdefined(behaviortreeentity.var_b238ef38) && isdefined(behaviortreeentity.var_b238ef38.position))
				{
					behaviortreeentity setgoal(behaviortreeentity.var_b238ef38.position);
				}
				function_9d92b55a(behaviortreeentity);
			}
			else if(isdefined(behaviortreeentity.favoriteenemy))
			{
				behaviortreeentity.has_exit_point = undefined;
				behaviortreeentity val::reset(#"attack_properties", "ignoreall");
				if(isarray(behaviortreeentity.enemy.var_f904e440) && isinarray(behaviortreeentity.enemy.var_f904e440, behaviortreeentity))
				{
					return;
				}
				if(isdefined(level.enemy_location_override_func))
				{
					goalpos = [[level.enemy_location_override_func]](behaviortreeentity, behaviortreeentity.favoriteenemy);
					if(isdefined(goalpos))
					{
						behaviortreeentity setgoal(goalpos);
					}
					else
					{
						behaviortreeentity zombieupdategoal();
					}
				}
				else
				{
					if(is_true(behaviortreeentity.is_rat_test))
					{
					}
					else
					{
						if(zombieshouldmoveawaycondition(behaviortreeentity))
						{
						}
						else
						{
							behaviortreeentity zombieupdategoal();
						}
					}
				}
			}
		}
	}
	if(players.size > 1)
	{
		for(i = 0; i < behaviortreeentity.ignore_player.size; i++)
		{
			if(isdefined(behaviortreeentity.ignore_player[i]))
			{
				if(!isdefined(behaviortreeentity.ignore_player[i].ignore_counter))
				{
					behaviortreeentity.ignore_player[i].ignore_counter = 0;
					continue;
				}
				behaviortreeentity.ignore_player[i].ignore_counter = behaviortreeentity.ignore_player[i].ignore_counter + 1;
			}
		}
	}
}

/*
	Name: function_483766be
	Namespace: zm_behavior
	Checksum: 0x779352D9
	Offset: 0x5C18
	Size: 0x19C
	Parameters: 1
	Flags: Linked
*/
function function_483766be(entity)
{
	if(is_true(entity.var_1fa24724) && !isdefined(entity.enemy_override) && isplayer(entity.enemy) && isdefined(entity.enemy.var_dbb28b34) && (gettime() - entity.enemy.var_dbb28b34) > 2000)
	{
		if(isdefined(entity.enemy) && !is_true(entity.var_205ab08b) && (!isdefined(entity.var_42ecd9f3) || entity.var_42ecd9f3 <= gettime()))
		{
			function_e5f60f55(entity);
		}
		if(isarray(entity.enemy.var_f904e440) && isinarray(entity.enemy.var_f904e440, entity))
		{
			return;
		}
	}
	else if(isarray(entity.enemy.var_f904e440))
	{
		arrayremovevalue(entity.enemy.var_f904e440, entity);
	}
}

/*
	Name: function_9d92b55a
	Namespace: zm_behavior
	Checksum: 0x6800CB48
	Offset: 0x5DC0
	Size: 0x16
	Parameters: 1
	Flags: Linked, Private
*/
function private function_9d92b55a(behaviortreeentity)
{
	behaviortreeentity.var_9e6e6645 = undefined;
}

/*
	Name: function_f637b05d
	Namespace: zm_behavior
	Checksum: 0x6AFE3254
	Offset: 0x5DE0
	Size: 0x5A
	Parameters: 1
	Flags: Linked
*/
function function_f637b05d(behaviortreeentity)
{
	if(is_true(behaviortreeentity.ai.var_870d0893))
	{
		return;
	}
	behaviortreeentity.var_93a62fe = zm_utility::get_closest_valid_player(behaviortreeentity.origin, behaviortreeentity.ignore_player);
}

/*
	Name: zombiefindfleshcode
	Namespace: zm_behavior
	Checksum: 0x29D60EE0
	Offset: 0x5E48
	Size: 0x49C
	Parameters: 1
	Flags: Linked
*/
function zombiefindfleshcode(behaviortreeentity)
{
	aiprofile_beginentry("zombieFindFleshCode");
	if(level.intermission)
	{
		aiprofile_endentry();
		return;
	}
	behaviortreeentity.ignore_player = [];
	behaviortreeentity.goalradius = 30;
	if(behaviortreeentity.team == #"allies")
	{
		behaviortreeentity findzombieenemy();
		aiprofile_endentry();
		return;
	}
	if(level.wait_and_revive)
	{
		aiprofile_endentry();
		return;
	}
	monkey = gadget_cymbal_monkey::function_4a5dff80(behaviortreeentity, 0);
	if(isdefined(monkey))
	{
		behaviortreeentity.enemy_override = monkey;
	}
	if(level.zombie_poi_array.size > 0)
	{
		zombie_poi = behaviortreeentity zm_utility::get_zombie_point_of_interest(behaviortreeentity.origin);
	}
	behaviortreeentity zombie_utility::run_ignore_player_handler();
	zm_utility::update_valid_players(behaviortreeentity.origin, behaviortreeentity.ignore_player);
	if(!isdefined(behaviortreeentity.enemy) && !isdefined(zombie_poi))
	{
		/#
			if(is_true(behaviortreeentity.ispuppet))
			{
				aiprofile_endentry();
				return;
			}
		#/
		if(isdefined(level.no_target_override))
		{
			[[level.no_target_override]](behaviortreeentity);
		}
		else
		{
			behaviortreeentity setgoal(behaviortreeentity.origin);
		}
		aiprofile_endentry();
		return;
	}
	behaviortreeentity.zombie_poi = zombie_poi;
	if(isdefined(zombie_poi))
	{
		behaviortreeentity.enemy_override = zombie_poi.poi_ent;
		behaviortreeentity.enemy_override.var_dfa42180 = &zm_utility::function_49f80b6f;
	}
	if(isdefined(behaviortreeentity.enemy_override))
	{
		behaviortreeentity.has_exit_point = undefined;
		goalpos = behaviortreeentity.enemy_override.origin;
		if(isdefined(behaviortreeentity.enemy_override.var_dfa42180))
		{
			goalpos = behaviortreeentity.enemy_override [[behaviortreeentity.enemy_override.var_dfa42180]](behaviortreeentity);
		}
		if(isdefined(goalpos))
		{
			queryresult = positionquery_source_navigation(goalpos, 0, 48, 36, 4);
			foreach(point in queryresult.data)
			{
				goalpos = point.origin;
				break;
			}
			behaviortreeentity setgoal(goalpos);
		}
	}
	else if(isdefined(behaviortreeentity.enemy))
	{
		behaviortreeentity.has_exit_point = undefined;
		/#
			if(is_true(behaviortreeentity.is_rat_test))
			{
				aiprofile_endentry();
				return;
			}
		#/
		if(isdefined(level.enemy_location_override_func))
		{
			goalpos = [[level.enemy_location_override_func]](behaviortreeentity, behaviortreeentity.enemy);
			if(isdefined(goalpos))
			{
				behaviortreeentity setgoal(goalpos);
			}
			else
			{
				behaviortreeentity zombieupdategoalcode();
			}
		}
		else if(isdefined(behaviortreeentity.enemy.last_valid_position))
		{
			behaviortreeentity zombieupdategoalcode();
		}
	}
	aiprofile_endentry();
}

/*
	Name: zombieupdategoal
	Namespace: zm_behavior
	Checksum: 0xA9190E2D
	Offset: 0x62F0
	Size: 0x5E4
	Parameters: 0
	Flags: Linked
*/
function zombieupdategoal()
{
	aiprofile_beginentry("zombieUpdateGoal");
	if(isplayer(self.favoriteenemy))
	{
		targetent = zm_ai_utility::function_a2e8fd7b(self, self.favoriteenemy);
		if(isdefined(targetent.last_valid_position))
		{
			targetpos = getclosestpointonnavmesh(targetent.last_valid_position, 64, 0);
			if(!isdefined(targetpos))
			{
				targetpos = targetent.origin;
			}
		}
		else
		{
			targetpos = targetent.origin;
		}
	}
	else
	{
		targetpos = getclosestpointonnavmesh(self.favoriteenemy.origin, 64, 0);
		if(!isdefined(targetpos) && self.favoriteenemy function_dd070839() && isdefined(self.favoriteenemy.traversestartnode))
		{
			targetpos = self.favoriteenemy.traversestartnode.origin;
		}
	}
	if(isentity(targetent))
	{
		if(!is_true(self.var_1fa24724))
		{
			self.var_1f1f2fcd = undefined;
		}
		queryresult = positionquery_source_navigation(targetpos, self getpathfindingradius(), self getpathfindingradius() * 5, 64, 16, self);
		positionquery_filter_inclaimedlocation(queryresult, self);
		queryresult.data = function_7b8e26b3(queryresult.data, 0, "inClaimedLocation");
		point = arraygetclosest(self.origin, queryresult.data);
		self.var_1f1f2fcd = point.origin;
		targetpos = point.origin;
		targetpos = (isdefined(self.var_1f1f2fcd) ? self.var_1f1f2fcd : targetpos);
	}
	if(!isdefined(targetpos))
	{
		return;
	}
	var_75dd804d = length2dsquared(self.origin - targetpos);
	var_2b8b6d3f = sqr(175);
	shouldrepath = 0;
	if(isdefined(self.var_9e6e6645))
	{
		if(isdefined(targetpos))
		{
			if(is_true(self.var_4fe4e626))
			{
				self.var_4fe4e626 = 0;
				shouldrepath = 1;
			}
			else
			{
				if(distancesquared(self.var_9e6e6645, targetpos) > sqr(18))
				{
					shouldrepath = 1;
				}
				else
				{
					if(var_75dd804d < sqr(72) && (!isdefined(self.nextgoalupdate) || self.nextgoalupdate < gettime()))
					{
						shouldrepath = 1;
					}
					else if(is_true(self.var_d9a37fc4) && var_75dd804d <= var_2b8b6d3f)
					{
						shouldrepath = 1;
					}
				}
			}
		}
	}
	else
	{
		shouldrepath = 1;
	}
	if(self function_dd070839())
	{
		shouldrepath = 0;
	}
	if(isactor(self) && self asmistransitionrunning() || self asmistransdecrunning())
	{
		shouldrepath = 0;
	}
	if(shouldrepath)
	{
		goalpos = targetpos;
		self.var_d9a37fc4 = 0;
		if(var_75dd804d > var_2b8b6d3f)
		{
			angle = randomfloatrange(-180, 180);
			distance = randomfloatrange(16, 128);
			goalpos = checknavmeshdirection(targetpos, function_ba142845(angle), distance, self getpathfindingradius() * 1.1);
			self.var_d9a37fc4 = 1;
		}
		self setgoal(goalpos, undefined, undefined, undefined, undefined, 1);
		self.var_9e6e6645 = targetpos;
		self.nextgoalupdate = gettime() + randomintrange(500, 1000);
	}
	aiprofile_endentry();
}

/*
	Name: zombieupdategoalcode
	Namespace: zm_behavior
	Checksum: 0x1F92AEFF
	Offset: 0x68E0
	Size: 0x544
	Parameters: 0
	Flags: Linked
*/
function zombieupdategoalcode()
{
	aiprofile_beginentry("zombieUpdateGoalCode");
	shouldrepath = 0;
	if(isdefined(self.enemy))
	{
		if(!isdefined(self.nextgoalupdate) || self.nextgoalupdate <= gettime())
		{
			shouldrepath = 1;
		}
		else
		{
			if(distancesquared(self.origin, self.enemy.origin) <= sqr(200))
			{
				shouldrepath = 1;
			}
			else if(isdefined(self.pathgoalpos))
			{
				distancetogoalsqr = distancesquared(self.origin, self.pathgoalpos);
				shouldrepath = distancetogoalsqr < sqr(72);
			}
		}
	}
	if(is_true(self.keep_moving))
	{
		if(gettime() > self.keep_moving_time)
		{
			self.keep_moving = 0;
		}
	}
	if(shouldrepath)
	{
		goalpos = self.enemy.origin;
		if(isdefined(self.enemy.last_valid_position))
		{
			var_2a741504 = getclosestpointonnavmesh(self.enemy.last_valid_position, 64, 0);
			if(isdefined(var_2a741504))
			{
				goalpos = var_2a741504;
			}
		}
		if(is_true(level.do_randomized_zigzag_path))
		{
			if(distancesquared(self.origin, goalpos) > sqr(240))
			{
				self.keep_moving = 1;
				self.keep_moving_time = gettime() + 250;
				path = self calcapproximatepathtoposition(goalpos, 0);
				/#
					if(getdvarint(#"ai_debugzigzag", 0))
					{
						for(index = 1; index < path.size; index++)
						{
							recordline(path[index - 1], path[index], (1, 0.5, 0), "", self);
						}
					}
				#/
				deviationdistance = randomintrange(240, 480);
				segmentlength = 0;
				for(index = 1; index < path.size; index++)
				{
					currentseglength = distance(path[index - 1], path[index]);
					if(segmentlength + currentseglength > deviationdistance)
					{
						remaininglength = deviationdistance - segmentlength;
						seedposition = (path[index - 1]) + ((vectornormalize(path[index] - (path[index - 1]))) * remaininglength);
						/#
							recordcircle(seedposition, 2, (1, 0.5, 0), "", self);
						#/
						innerzigzagradius = level.inner_zigzag_radius;
						outerzigzagradius = level.outer_zigzag_radius;
						queryresult = positionquery_source_navigation(seedposition, innerzigzagradius, outerzigzagradius, 36, 16, self, 16);
						positionquery_filter_inclaimedlocation(queryresult, self);
						if(queryresult.data.size > 0)
						{
							point = queryresult.data[randomint(queryresult.data.size)];
							if(tracepassedonnavmesh(seedposition, point.origin, 16))
							{
								goalpos = point.origin;
							}
						}
						break;
					}
					segmentlength = segmentlength + currentseglength;
				}
			}
		}
		self setgoal(goalpos);
		self.nextgoalupdate = gettime() + randomintrange(500, 1000);
	}
	aiprofile_endentry();
}

/*
	Name: zombieenteredplayable
	Namespace: zm_behavior
	Checksum: 0xF4C06A7
	Offset: 0x6E30
	Size: 0x26C
	Parameters: 1
	Flags: Linked
*/
function zombieenteredplayable(behaviortreeentity)
{
	if(is_true(behaviortreeentity.ai.var_870d0893))
	{
		return;
	}
	if(is_true(behaviortreeentity.completed_emerging_into_playable_area))
	{
		return;
	}
	if(zm_utility::function_c85ebbbc())
	{
		if(!isdefined(level.playable_area))
		{
			level.playable_area = getentarray("player_volume", "script_noteworthy");
		}
		var_12ed21a1 = function_72d3bca6(level.playable_area, behaviortreeentity.origin, undefined, undefined, level.var_603981f1);
		foreach(area in var_12ed21a1)
		{
			if(behaviortreeentity istouching(area))
			{
				if(isdefined(behaviortreeentity.var_ee833cd6))
				{
					behaviortreeentity [[behaviortreeentity.var_ee833cd6]]();
				}
				else
				{
					behaviortreeentity zm_spawner::zombie_complete_emerging_into_playable_area();
				}
				return true;
			}
		}
	}
	if(zm_utility::function_21f4ac36())
	{
		if(!isdefined(level.var_a2a9b2de))
		{
			level.var_a2a9b2de = getnodearray("player_region", "script_noteworthy");
		}
		node = function_52c1730(behaviortreeentity.origin, level.var_a2a9b2de, 500);
		if(isdefined(node))
		{
			if(isdefined(behaviortreeentity.var_ee833cd6))
			{
				behaviortreeentity [[behaviortreeentity.var_ee833cd6]]();
			}
			else
			{
				behaviortreeentity zm_spawner::zombie_complete_emerging_into_playable_area();
			}
			return true;
		}
	}
	return false;
}

/*
	Name: shouldmovecondition
	Namespace: zm_behavior
	Checksum: 0xF2A0C9D2
	Offset: 0x70A8
	Size: 0x4E
	Parameters: 1
	Flags: Linked
*/
function shouldmovecondition(behaviortreeentity)
{
	if(behaviortreeentity haspath())
	{
		return true;
	}
	if(is_true(behaviortreeentity.keep_moving))
	{
		return true;
	}
	return false;
}

/*
	Name: zombieshouldmoveawaycondition
	Namespace: zm_behavior
	Checksum: 0x488FF88B
	Offset: 0x7100
	Size: 0x16
	Parameters: 1
	Flags: Linked
*/
function zombieshouldmoveawaycondition(behaviortreeentity)
{
	return level.wait_and_revive;
}

/*
	Name: waskilledbyteslacondition
	Namespace: zm_behavior
	Checksum: 0x1E242963
	Offset: 0x7120
	Size: 0x2E
	Parameters: 1
	Flags: Linked
*/
function waskilledbyteslacondition(behaviortreeentity)
{
	if(is_true(behaviortreeentity.tesla_death))
	{
		return true;
	}
	return false;
}

/*
	Name: function_a00b473a
	Namespace: zm_behavior
	Checksum: 0x41CD66AC
	Offset: 0x7158
	Size: 0x2E
	Parameters: 1
	Flags: Linked
*/
function function_a00b473a(behaviortreeentity)
{
	if(is_true(behaviortreeentity.var_49fdad6a))
	{
		return true;
	}
	return false;
}

/*
	Name: function_8396494f
	Namespace: zm_behavior
	Checksum: 0x42874238
	Offset: 0x7190
	Size: 0x2E
	Parameters: 1
	Flags: Linked
*/
function function_8396494f(behaviortreeentity)
{
	if(is_true(behaviortreeentity.var_ebd66e27))
	{
		return true;
	}
	return false;
}

/*
	Name: function_77a0b45d
	Namespace: zm_behavior
	Checksum: 0x8366B01E
	Offset: 0x71C8
	Size: 0x1A
	Parameters: 1
	Flags: Linked
*/
function function_77a0b45d(behaviortreeentity)
{
	behaviortreeentity.var_98f1f37c = 1;
}

/*
	Name: disablepowerups
	Namespace: zm_behavior
	Checksum: 0x32910A51
	Offset: 0x71F0
	Size: 0x1A
	Parameters: 1
	Flags: Linked
*/
function disablepowerups(behaviortreeentity)
{
	behaviortreeentity.no_powerups = 1;
}

/*
	Name: function_fa2814ae
	Namespace: zm_behavior
	Checksum: 0xF414FE5F
	Offset: 0x7218
	Size: 0x16
	Parameters: 1
	Flags: Linked
*/
function function_fa2814ae(behaviortreeentity)
{
	behaviortreeentity.var_98f1f37c = 0;
}

/*
	Name: enablepowerups
	Namespace: zm_behavior
	Checksum: 0xED180A73
	Offset: 0x7238
	Size: 0x16
	Parameters: 1
	Flags: Linked
*/
function enablepowerups(behaviortreeentity)
{
	behaviortreeentity.no_powerups = 0;
}

/*
	Name: zombiemoveaway
	Namespace: zm_behavior
	Checksum: 0x12B8D949
	Offset: 0x7258
	Size: 0x2C8
	Parameters: 2
	Flags: Linked
*/
function zombiemoveaway(behaviortreeentity, asmstatename)
{
	player = util::gethostplayer();
	if(!isdefined(player))
	{
		return 5;
	}
	queryresult = level.move_away_points;
	animationstatenetworkutility::requeststate(behaviortreeentity, asmstatename);
	if(!isdefined(queryresult))
	{
		return 5;
	}
	self.keep_moving = 0;
	for(i = 0; i < queryresult.data.size; i++)
	{
		if(!zm_utility::check_point_in_playable_area(queryresult.data[i].origin))
		{
			continue;
		}
		isbehind = vectordot(player.origin - behaviortreeentity.origin, queryresult.data[i].origin - behaviortreeentity.origin);
		if(isbehind < 0)
		{
			behaviortreeentity setgoal(queryresult.data[i].origin);
			arrayremoveindex(level.move_away_points.data, i, 0);
			i--;
			return 5;
		}
	}
	for(i = 0; i < queryresult.data.size; i++)
	{
		if(!zm_utility::check_point_in_playable_area(queryresult.data[i].origin))
		{
			continue;
		}
		dist_zombie = distancesquared(queryresult.data[i].origin, behaviortreeentity.origin);
		dist_player = distancesquared(queryresult.data[i].origin, player.origin);
		if(dist_zombie < dist_player)
		{
			behaviortreeentity setgoal(queryresult.data[i].origin);
			arrayremoveindex(level.move_away_points.data, i, 0);
			i--;
			return 5;
		}
	}
	self zm::default_find_exit_point();
	return 5;
}

/*
	Name: zombieisbeinggrappled
	Namespace: zm_behavior
	Checksum: 0xF050DB46
	Offset: 0x7528
	Size: 0x2E
	Parameters: 1
	Flags: Linked
*/
function zombieisbeinggrappled(behaviortreeentity)
{
	if(is_true(behaviortreeentity.grapple_is_fatal))
	{
		return true;
	}
	return false;
}

/*
	Name: zombieshouldknockdown
	Namespace: zm_behavior
	Checksum: 0x3938D8F8
	Offset: 0x7560
	Size: 0x2E
	Parameters: 1
	Flags: Linked
*/
function zombieshouldknockdown(behaviortreeentity)
{
	if(is_true(behaviortreeentity.knockdown))
	{
		return true;
	}
	return false;
}

/*
	Name: zombieispushed
	Namespace: zm_behavior
	Checksum: 0xA857D584
	Offset: 0x7598
	Size: 0x2E
	Parameters: 1
	Flags: Linked
*/
function zombieispushed(behaviortreeentity)
{
	if(is_true(behaviortreeentity.pushed))
	{
		return true;
	}
	return false;
}

/*
	Name: function_7531db00
	Namespace: zm_behavior
	Checksum: 0x95D96252
	Offset: 0x75D0
	Size: 0x90
	Parameters: 1
	Flags: Linked
*/
function function_7531db00(behaviortreeentity)
{
	aiutility::traversesetup(behaviortreeentity);
	behaviortreeentity.old_powerups = behaviortreeentity.no_powerups;
	behaviortreeentity.var_9ed3cc11 = behaviortreeentity function_e827fc0e();
	behaviortreeentity pushplayer(1);
	behaviortreeentity callback::callback(#"hash_1518febf00439d5");
	return true;
}

/*
	Name: function_1329e086
	Namespace: zm_behavior
	Checksum: 0x45AA4821
	Offset: 0x7668
	Size: 0xC0
	Parameters: 1
	Flags: Linked
*/
function function_1329e086(behaviortreeentity)
{
	behaviortreeentity.no_powerups = behaviortreeentity.old_powerups;
	if(!is_true(behaviortreeentity.missinglegs))
	{
		behaviortreeentity collidewithactors(0);
		behaviortreeentity.enablepushtime = gettime() + 1000;
	}
	if(isdefined(behaviortreeentity.var_9ed3cc11))
	{
		behaviortreeentity pushplayer(behaviortreeentity.var_9ed3cc11);
		behaviortreeentity.var_9ed3cc11 = undefined;
	}
	behaviortreeentity callback::callback(#"hash_34b65342cbfdadac");
	return true;
}

/*
	Name: zombiegrappleactionstart
	Namespace: zm_behavior
	Checksum: 0x97A3BD34
	Offset: 0x7730
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function zombiegrappleactionstart(behaviortreeentity)
{
	behaviortreeentity setblackboardattribute("_grapple_direction", self.grapple_direction);
}

/*
	Name: zombieknockdownactionstart
	Namespace: zm_behavior
	Checksum: 0xA812538F
	Offset: 0x7770
	Size: 0xAA
	Parameters: 1
	Flags: Linked
*/
function zombieknockdownactionstart(behaviortreeentity)
{
	behaviortreeentity setblackboardattribute("_knockdown_direction", behaviortreeentity.knockdown_direction);
	behaviortreeentity setblackboardattribute("_knockdown_type", behaviortreeentity.knockdown_type);
	behaviortreeentity setblackboardattribute("_getup_direction", behaviortreeentity.getup_direction);
	behaviortreeentity collidewithactors(0);
	behaviortreeentity.blockingpain = 1;
}

/*
	Name: function_c8939973
	Namespace: zm_behavior
	Checksum: 0x715804AF
	Offset: 0x7828
	Size: 0x3E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_c8939973(behaviortreeentity)
{
	behaviortreeentity.knockdown = 0;
	behaviortreeentity collidewithactors(1);
	behaviortreeentity.blockingpain = 0;
}

/*
	Name: zombiepushedactionstart
	Namespace: zm_behavior
	Checksum: 0xD224C3DE
	Offset: 0x7870
	Size: 0x4C
	Parameters: 1
	Flags: Linked, Private
*/
function private zombiepushedactionstart(behaviortreeentity)
{
	behaviortreeentity collidewithactors(0);
	behaviortreeentity setblackboardattribute("_push_direction", behaviortreeentity.push_direction);
}

/*
	Name: zombiepushedactionterminate
	Namespace: zm_behavior
	Checksum: 0x3A55552F
	Offset: 0x78C8
	Size: 0x2E
	Parameters: 1
	Flags: Linked, Private
*/
function private zombiepushedactionterminate(behaviortreeentity)
{
	behaviortreeentity collidewithactors(1);
	behaviortreeentity.pushed = 0;
}

/*
	Name: zombieshouldstun
	Namespace: zm_behavior
	Checksum: 0xAB038ADE
	Offset: 0x7900
	Size: 0x52
	Parameters: 1
	Flags: Linked
*/
function zombieshouldstun(behaviortreeentity)
{
	if(behaviortreeentity ai::is_stunned() && !is_true(behaviortreeentity.tesla_death))
	{
		return true;
	}
	return false;
}

/*
	Name: zombiestunstart
	Namespace: zm_behavior
	Checksum: 0xD220EBAB
	Offset: 0x7960
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function zombiestunstart(behaviortreeentity)
{
	behaviortreeentity pathmode("dont move", 1);
	callback::callback(#"hash_1eda827ff5e6895b");
}

/*
	Name: function_c377438f
	Namespace: zm_behavior
	Checksum: 0x6740BBDD
	Offset: 0x79B8
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function function_c377438f(behaviortreeentity)
{
	behaviortreeentity pathmode("move allowed");
	callback::callback(#"hash_210adcf09e99fba1");
}

/*
	Name: zombiestunactionstart
	Namespace: zm_behavior
	Checksum: 0xA13966C2
	Offset: 0x7A10
	Size: 0x88
	Parameters: 2
	Flags: Linked
*/
function zombiestunactionstart(behaviortreeentity, asmstatename)
{
	zombiestunstart(behaviortreeentity);
	behaviortreeentity.var_4034a31 = gibserverutils::isgibbed(behaviortreeentity, 256) || gibserverutils::isgibbed(behaviortreeentity, 128);
	animationstatenetworkutility::requeststate(behaviortreeentity, asmstatename);
	return 5;
}

/*
	Name: function_4e52c07
	Namespace: zm_behavior
	Checksum: 0x1BC64490
	Offset: 0x7AA0
	Size: 0x98
	Parameters: 2
	Flags: Linked
*/
function function_4e52c07(behaviortreeentity, asmstatename)
{
	if(isdefined(asmstatename.var_4034a31) && (asmstatename.var_4034a31 != (gibserverutils::isgibbed(asmstatename, 256) || gibserverutils::isgibbed(asmstatename, 128))))
	{
		return 4;
	}
	if(asmstatename ai::is_stunned())
	{
		return 5;
	}
	return 4;
}

/*
	Name: zombiestunactionend
	Namespace: zm_behavior
	Checksum: 0x1E405309
	Offset: 0x7B40
	Size: 0x3A
	Parameters: 2
	Flags: Linked
*/
function zombiestunactionend(behaviortreeentity, asmstatename)
{
	function_c377438f(asmstatename);
	asmstatename.var_4034a31 = undefined;
	return 4;
}

/*
	Name: zombietraverseaction
	Namespace: zm_behavior
	Checksum: 0xC2C983C1
	Offset: 0x7B88
	Size: 0xC8
	Parameters: 2
	Flags: Linked
*/
function zombietraverseaction(behaviortreeentity, asmstatename)
{
	aiutility::traverseactionstart(behaviortreeentity, asmstatename);
	behaviortreeentity.old_powerups = behaviortreeentity.no_powerups;
	disablepowerups(behaviortreeentity);
	function_77a0b45d(behaviortreeentity);
	behaviortreeentity.var_9ed3cc11 = behaviortreeentity function_e827fc0e();
	behaviortreeentity pushplayer(1);
	behaviortreeentity callback::callback(#"hash_1518febf00439d5");
	return 5;
}

/*
	Name: zombietraverseactionterminate
	Namespace: zm_behavior
	Checksum: 0x734255D2
	Offset: 0x7C58
	Size: 0x100
	Parameters: 2
	Flags: Linked
*/
function zombietraverseactionterminate(behaviortreeentity, asmstatename)
{
	aiutility::wpn_debug_bot_joinleave(behaviortreeentity, asmstatename);
	if(behaviortreeentity asmgetstatus() == "asm_status_complete")
	{
		behaviortreeentity.no_powerups = behaviortreeentity.old_powerups;
		if(!is_true(behaviortreeentity.missinglegs))
		{
			behaviortreeentity collidewithactors(0);
			behaviortreeentity.enablepushtime = gettime() + 1000;
		}
		if(isdefined(behaviortreeentity.var_9ed3cc11))
		{
			behaviortreeentity pushplayer(behaviortreeentity.var_9ed3cc11);
			behaviortreeentity.var_9ed3cc11 = undefined;
		}
	}
	behaviortreeentity callback::callback(#"hash_34b65342cbfdadac");
	return 4;
}

/*
	Name: zombiegottoentrancecondition
	Namespace: zm_behavior
	Checksum: 0xC242ABA1
	Offset: 0x7D60
	Size: 0x2E
	Parameters: 1
	Flags: Linked
*/
function zombiegottoentrancecondition(behaviortreeentity)
{
	if(is_true(behaviortreeentity.got_to_entrance))
	{
		return true;
	}
	return false;
}

/*
	Name: zombiegottoattackspotcondition
	Namespace: zm_behavior
	Checksum: 0xFEB5DF6
	Offset: 0x7D98
	Size: 0x2E
	Parameters: 1
	Flags: Linked
*/
function zombiegottoattackspotcondition(behaviortreeentity)
{
	if(is_true(behaviortreeentity.at_entrance_tear_spot))
	{
		return true;
	}
	return false;
}

/*
	Name: zombiehasattackspotalreadycondition
	Namespace: zm_behavior
	Checksum: 0x42FE9A18
	Offset: 0x7DD0
	Size: 0x38
	Parameters: 1
	Flags: Linked
*/
function zombiehasattackspotalreadycondition(behaviortreeentity)
{
	if(isdefined(behaviortreeentity.attacking_spot_index) && behaviortreeentity.attacking_spot_index >= 0)
	{
		return true;
	}
	return false;
}

/*
	Name: zombieshouldtearcondition
	Namespace: zm_behavior
	Checksum: 0x8950A687
	Offset: 0x7E10
	Size: 0x7E
	Parameters: 1
	Flags: Linked
*/
function zombieshouldtearcondition(behaviortreeentity)
{
	if(isdefined(behaviortreeentity.first_node))
	{
		if(isdefined(behaviortreeentity.first_node.zbarrier))
		{
			if(isdefined(behaviortreeentity.first_node.barrier_chunks))
			{
				if(!zm_utility::all_chunks_destroyed(behaviortreeentity.first_node, behaviortreeentity.first_node.barrier_chunks))
				{
					return true;
				}
			}
		}
	}
	return false;
}

/*
	Name: zombieshouldattackthroughboardscondition
	Namespace: zm_behavior
	Checksum: 0xB7ED9752
	Offset: 0x7E98
	Size: 0x282
	Parameters: 1
	Flags: Linked
*/
function zombieshouldattackthroughboardscondition(behaviortreeentity)
{
	if(is_true(behaviortreeentity.missinglegs))
	{
		return false;
	}
	if(isdefined(behaviortreeentity.first_node.zbarrier))
	{
		if(!behaviortreeentity.first_node.zbarrier zbarriersupportszombiereachthroughattacks())
		{
			chunks = undefined;
			if(isdefined(behaviortreeentity.first_node))
			{
				chunks = zm_utility::get_non_destroyed_chunks(behaviortreeentity.first_node, behaviortreeentity.first_node.barrier_chunks);
			}
			if(isdefined(chunks) && chunks.size > 0)
			{
				return false;
			}
		}
	}
	if(getdvarstring(#"zombie_reachin_freq") == "")
	{
		setdvar(#"zombie_reachin_freq", 50);
	}
	freq = getdvarint(#"zombie_reachin_freq", 0);
	players = getplayers();
	attack = 0;
	behaviortreeentity.player_targets = [];
	for(i = 0; i < players.size; i++)
	{
		if(isalive(players[i]) && !isdefined(players[i].revivetrigger) && distance2d(behaviortreeentity.origin, players[i].origin) <= 109.8 && !is_true(players[i].ignoreme))
		{
			behaviortreeentity.player_targets[behaviortreeentity.player_targets.size] = players[i];
			attack = 1;
		}
	}
	if(!attack || freq < randomint(100))
	{
		return false;
	}
	return true;
}

/*
	Name: zombieshouldtauntcondition
	Namespace: zm_behavior
	Checksum: 0x840F92B
	Offset: 0x8128
	Size: 0x110
	Parameters: 1
	Flags: Linked
*/
function zombieshouldtauntcondition(behaviortreeentity)
{
	if(is_true(behaviortreeentity.missinglegs))
	{
		return false;
	}
	if(!isdefined(behaviortreeentity.first_node.zbarrier))
	{
		return false;
	}
	if(!behaviortreeentity.first_node.zbarrier zbarriersupportszombietaunts())
	{
		return false;
	}
	if(getdvarstring(#"zombie_taunt_freq") == "")
	{
		setdvar(#"zombie_taunt_freq", 5);
	}
	freq = getdvarint(#"zombie_taunt_freq", 0);
	if(freq >= randomint(100))
	{
		return true;
	}
	return false;
}

/*
	Name: zombieshouldenterplayablecondition
	Namespace: zm_behavior
	Checksum: 0x3BCE4795
	Offset: 0x8240
	Size: 0xC2
	Parameters: 1
	Flags: Linked
*/
function zombieshouldenterplayablecondition(behaviortreeentity)
{
	if(isdefined(behaviortreeentity.first_node) && isdefined(behaviortreeentity.first_node.barrier_chunks))
	{
		if(zm_utility::all_chunks_destroyed(behaviortreeentity.first_node, behaviortreeentity.first_node.barrier_chunks))
		{
			if(!isdefined(behaviortreeentity.attacking_spot) || is_true(behaviortreeentity.at_entrance_tear_spot) && !is_true(behaviortreeentity.completed_emerging_into_playable_area))
			{
				return true;
			}
		}
	}
	return false;
}

/*
	Name: ischunkvalidcondition
	Namespace: zm_behavior
	Checksum: 0xAB02BEDD
	Offset: 0x8310
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function ischunkvalidcondition(behaviortreeentity)
{
	if(isdefined(behaviortreeentity.chunk))
	{
		return true;
	}
	return false;
}

/*
	Name: inplayablearea
	Namespace: zm_behavior
	Checksum: 0xD5B113BA
	Offset: 0x8340
	Size: 0x2E
	Parameters: 1
	Flags: Linked
*/
function inplayablearea(behaviortreeentity)
{
	if(is_true(behaviortreeentity.completed_emerging_into_playable_area))
	{
		return true;
	}
	return false;
}

/*
	Name: shouldskipteardown
	Namespace: zm_behavior
	Checksum: 0xA7BFCB1F
	Offset: 0x8378
	Size: 0x36
	Parameters: 1
	Flags: Linked
*/
function shouldskipteardown(behaviortreeentity)
{
	if(behaviortreeentity zm_spawner::should_skip_teardown(behaviortreeentity.find_flesh_struct_string))
	{
		return true;
	}
	return false;
}

/*
	Name: zombieisthinkdone
	Namespace: zm_behavior
	Checksum: 0xFE417B5D
	Offset: 0x83B8
	Size: 0x56
	Parameters: 1
	Flags: Linked
*/
function zombieisthinkdone(behaviortreeentity)
{
	/#
		if(is_true(behaviortreeentity.is_rat_test))
		{
			return false;
		}
	#/
	if(is_true(behaviortreeentity.zombie_think_done))
	{
		return true;
	}
	return false;
}

/*
	Name: zombieisatgoal
	Namespace: zm_behavior
	Checksum: 0xA4AB4B0B
	Offset: 0x8418
	Size: 0x10C
	Parameters: 1
	Flags: Linked
*/
function zombieisatgoal(behaviortreeentity)
{
	var_1f2328d0 = behaviortreeentity function_4794d6a3();
	isatscriptgoal = is_true(var_1f2328d0.var_9e404264);
	if(is_true(level.var_21326085))
	{
		if(!isatscriptgoal && isdefined(var_1f2328d0.overridegoalpos))
		{
			if(abs(var_1f2328d0.overridegoalpos[2] - behaviortreeentity.origin[2]) < 17)
			{
				dist = distance2dsquared(var_1f2328d0.overridegoalpos, behaviortreeentity.origin);
				if(dist < 289)
				{
					return 1;
				}
			}
		}
	}
	return isatscriptgoal;
}

/*
	Name: zombieisatentrance
	Namespace: zm_behavior
	Checksum: 0xC18128CA
	Offset: 0x8530
	Size: 0x7A
	Parameters: 1
	Flags: Linked
*/
function zombieisatentrance(behaviortreeentity)
{
	var_1f2328d0 = behaviortreeentity function_4794d6a3();
	isatscriptgoal = is_true(var_1f2328d0.var_9e404264);
	isatentrance = isdefined(behaviortreeentity.first_node) && isatscriptgoal;
	return isatentrance;
}

/*
	Name: function_4c12882b
	Namespace: zm_behavior
	Checksum: 0x1BC22A88
	Offset: 0x85B8
	Size: 0x8A
	Parameters: 1
	Flags: Linked
*/
function function_4c12882b(behaviortreeentity)
{
	if(!is_true(behaviortreeentity.got_to_entrance))
	{
		return false;
	}
	if(isdefined(behaviortreeentity.first_node))
	{
		return true;
	}
	node = behaviortreeentity.var_a5add0c0;
	if(isdefined(node.traversal_blocker) && node.traversal_blocker.targetname === "barricade_window")
	{
		return true;
	}
	return false;
}

/*
	Name: function_b86a1b9d
	Namespace: zm_behavior
	Checksum: 0x6EA624AF
	Offset: 0x8650
	Size: 0x20A
	Parameters: 1
	Flags: Linked
*/
function function_b86a1b9d(behaviortreeentity)
{
	barricades = [1:behaviortreeentity.first_node, 0:(isdefined(behaviortreeentity.var_a5add0c0.traversal_blocker) ? behaviortreeentity.var_a5add0c0.traversal_blocker : undefined)];
	foreach(barricade in barricades)
	{
		if(namespace_85745671::is_blocker_valid(barricade))
		{
			/#
				if(getdvarint(#"hash_2f078c2224f40586", 0) && isdefined(barricade.zbarrier))
				{
					record3dtext("" + barricade.zbarrier getentnum(), behaviortreeentity.origin, (1, 0.5, 0), "", behaviortreeentity);
				}
			#/
			return true;
		}
		/#
			if(getdvarint(#"hash_2f078c2224f40586", 0) && isdefined(barricade.zbarrier))
			{
				record3dtext("" + barricade.zbarrier getentnum(), behaviortreeentity.origin, (1, 0, 0), "", behaviortreeentity);
			}
		#/
	}
	return false;
}

/*
	Name: function_e7f2e349
	Namespace: zm_behavior
	Checksum: 0xA4E0A709
	Offset: 0x8868
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function function_e7f2e349(behaviortreeentity)
{
	return function_4c12882b(behaviortreeentity) && function_b86a1b9d(behaviortreeentity);
}

/*
	Name: function_45009145
	Namespace: zm_behavior
	Checksum: 0xF11CC9B4
	Offset: 0x88B0
	Size: 0x3E
	Parameters: 1
	Flags: Linked
*/
function function_45009145(behaviortreeentity)
{
	ret = is_true(behaviortreeentity.var_348e5e19);
	behaviortreeentity.var_348e5e19 = undefined;
	return ret;
}

/*
	Name: getchunkservice
	Namespace: zm_behavior
	Checksum: 0x3026E25A
	Offset: 0x88F8
	Size: 0x14C
	Parameters: 1
	Flags: Linked
*/
function getchunkservice(behaviortreeentity)
{
	if(isdefined(behaviortreeentity.chunk) && isdefined(behaviortreeentity.first_node.zbarrier) && behaviortreeentity.first_node.zbarrier getzbarrierpiecestate(behaviortreeentity.chunk) === "targetted_by_zombie")
	{
		behaviortreeentity.first_node.zbarrier setzbarrierpiecestate(behaviortreeentity.chunk, "closed");
	}
	behaviortreeentity.chunk = zm_utility::get_closest_non_destroyed_chunk(behaviortreeentity.origin, behaviortreeentity.first_node, behaviortreeentity.first_node.barrier_chunks);
	if(isdefined(behaviortreeentity.chunk))
	{
		behaviortreeentity.first_node.zbarrier setzbarrierpiecestate(behaviortreeentity.chunk, "targetted_by_zombie");
		behaviortreeentity.first_node thread zm_spawner::check_zbarrier_piece_for_zombie_death(behaviortreeentity.chunk, behaviortreeentity.first_node.zbarrier, behaviortreeentity);
	}
}

/*
	Name: function_38237e30
	Namespace: zm_behavior
	Checksum: 0x12EF80FD
	Offset: 0x8A50
	Size: 0x2C
	Parameters: 2
	Flags: Linked
*/
function function_38237e30(behaviortreeentity, anim)
{
	getchunkservice(anim);
}

/*
	Name: updatechunkservice
	Namespace: zm_behavior
	Checksum: 0x9FCAD7F8
	Offset: 0x8A88
	Size: 0x6A
	Parameters: 1
	Flags: Linked
*/
function updatechunkservice(behaviortreeentity)
{
	while(0 < behaviortreeentity.first_node.zbarrier.chunk_health[behaviortreeentity.chunk])
	{
		behaviortreeentity.first_node.zbarrier.chunk_health[behaviortreeentity.chunk]--;
	}
	behaviortreeentity.lastchunk_destroy_time = gettime();
}

/*
	Name: updateattackspotservice
	Namespace: zm_behavior
	Checksum: 0x357E2789
	Offset: 0x8B00
	Size: 0xF2
	Parameters: 1
	Flags: Linked
*/
function updateattackspotservice(behaviortreeentity)
{
	if(is_true(behaviortreeentity.marked_for_death) || behaviortreeentity.health < 0)
	{
		return false;
	}
	if(!isdefined(behaviortreeentity.attacking_spot))
	{
		if(!isdefined(behaviortreeentity.first_node) || !behaviortreeentity zm_spawner::get_attack_spot(behaviortreeentity.first_node))
		{
			return false;
		}
	}
	if(isdefined(behaviortreeentity.attacking_spot))
	{
		behaviortreeentity.goalradius = 17;
		behaviortreeentity function_a57c34b7(behaviortreeentity.attacking_spot);
		if(zombieisatgoal(behaviortreeentity))
		{
			behaviortreeentity.at_entrance_tear_spot = 1;
		}
		return true;
	}
	return false;
}

/*
	Name: function_b3311a1a
	Namespace: zm_behavior
	Checksum: 0x1DE20359
	Offset: 0x8C00
	Size: 0x2A
	Parameters: 2
	Flags: Linked
*/
function function_b3311a1a(behaviortreeentity, anim)
{
	return updateattackspotservice(anim);
}

/*
	Name: findnodesservice
	Namespace: zm_behavior
	Checksum: 0x3AC56EF3
	Offset: 0x8C38
	Size: 0x230
	Parameters: 1
	Flags: Linked
*/
function findnodesservice(behaviortreeentity)
{
	node = undefined;
	behaviortreeentity.entrance_nodes = [];
	if(isdefined(behaviortreeentity.find_flesh_struct_string))
	{
		if(behaviortreeentity.find_flesh_struct_string == "find_flesh")
		{
			return false;
		}
		for(i = 0; i < level.exterior_goals.size; i++)
		{
			if(isdefined(level.exterior_goals[i].script_string) && level.exterior_goals[i].script_string == behaviortreeentity.find_flesh_struct_string)
			{
				node = level.exterior_goals[i];
				break;
			}
		}
		for(i = 0; i < level.barrier_align.size; i++)
		{
			if(isdefined(level.barrier_align[i].script_string) && level.barrier_align[i].script_string == behaviortreeentity.find_flesh_struct_string)
			{
				behaviortreeentity.barrier_align = level.barrier_align[i];
			}
		}
		behaviortreeentity.entrance_nodes[behaviortreeentity.entrance_nodes.size] = node;
		/#
			assert(isdefined(node), ("" + behaviortreeentity.find_flesh_struct_string) + "");
		#/
		behaviortreeentity.first_node = node;
		goal_pos = getclosestpointonnavmesh(node.origin, 128, self getpathfindingradius());
		if(isdefined(goal_pos))
		{
			behaviortreeentity function_a57c34b7(goal_pos);
		}
		if(zombieisatentrance(behaviortreeentity))
		{
			behaviortreeentity.got_to_entrance = 1;
		}
		return true;
	}
}

/*
	Name: function_92d348e2
	Namespace: zm_behavior
	Checksum: 0xC6890746
	Offset: 0x8E70
	Size: 0x60
	Parameters: 1
	Flags: Linked
*/
function function_92d348e2(behaviortreeentity)
{
	node = behaviortreeentity.traversestartnode;
	if(isdefined(node.traversal_blocker))
	{
		barricade = node.traversal_blocker;
		barricade notify(#"hash_5cfbbb6ee8378665");
		return true;
	}
	return false;
}

/*
	Name: zombieattackableobjectservice
	Namespace: zm_behavior
	Checksum: 0xDC18056F
	Offset: 0x8ED8
	Size: 0x1A2
	Parameters: 1
	Flags: Linked
*/
function zombieattackableobjectservice(behaviortreeentity)
{
	if(is_true(behaviortreeentity.ai.var_870d0893))
	{
		return;
	}
	if(!behaviortreeentity ai::has_behavior_attribute("use_attackable") || !behaviortreeentity ai::get_behavior_attribute("use_attackable"))
	{
		namespace_85745671::function_2b925fa5(behaviortreeentity);
		return false;
	}
	if(is_true(behaviortreeentity.missinglegs))
	{
		namespace_85745671::function_2b925fa5(behaviortreeentity);
		return false;
	}
	if(is_true(behaviortreeentity.aat_turned))
	{
		namespace_85745671::function_2b925fa5(behaviortreeentity);
		return false;
	}
	if(isdefined(behaviortreeentity.var_b238ef38) && !isdefined(behaviortreeentity.attackable))
	{
		namespace_85745671::function_2b925fa5(behaviortreeentity);
	}
	else
	{
		if(!isdefined(behaviortreeentity.attackable))
		{
			behaviortreeentity.attackable = namespace_85745671::get_attackable(behaviortreeentity, 1);
		}
		else if(!is_true(behaviortreeentity.attackable.is_active))
		{
			behaviortreeentity.attackable = undefined;
		}
	}
}

/*
	Name: zombiemovetoentranceaction
	Namespace: zm_behavior
	Checksum: 0xBD447A38
	Offset: 0x9088
	Size: 0x38
	Parameters: 2
	Flags: Linked
*/
function zombiemovetoentranceaction(behaviortreeentity, asmstatename)
{
	behaviortreeentity.got_to_entrance = 0;
	animationstatenetworkutility::requeststate(behaviortreeentity, asmstatename);
	return 5;
}

/*
	Name: zombiemovetoentranceactionterminate
	Namespace: zm_behavior
	Checksum: 0x5C693768
	Offset: 0x90C8
	Size: 0x3E
	Parameters: 2
	Flags: Linked
*/
function zombiemovetoentranceactionterminate(behaviortreeentity, asmstatename)
{
	if(zombieisatentrance(asmstatename))
	{
		asmstatename.got_to_entrance = 1;
	}
	return 4;
}

/*
	Name: zombiemovetoattackspotaction
	Namespace: zm_behavior
	Checksum: 0xECED7D4
	Offset: 0x9110
	Size: 0x48
	Parameters: 2
	Flags: Linked
*/
function zombiemovetoattackspotaction(behaviortreeentity, asmstatename)
{
	function_6eb4f847(behaviortreeentity);
	animationstatenetworkutility::requeststate(behaviortreeentity, asmstatename);
	return 5;
}

/*
	Name: function_6eb4f847
	Namespace: zm_behavior
	Checksum: 0x4AC2A9A8
	Offset: 0x9160
	Size: 0x1A
	Parameters: 1
	Flags: Linked
*/
function function_6eb4f847(behaviortreeentity)
{
	behaviortreeentity.at_entrance_tear_spot = 0;
	return true;
}

/*
	Name: zombiemovetoattackspotactionterminate
	Namespace: zm_behavior
	Checksum: 0x6CA003A0
	Offset: 0x9188
	Size: 0x30
	Parameters: 2
	Flags: Linked
*/
function zombiemovetoattackspotactionterminate(behaviortreeentity, asmstatename)
{
	function_547701ae(asmstatename);
	return 4;
}

/*
	Name: function_547701ae
	Namespace: zm_behavior
	Checksum: 0x7EEFD41F
	Offset: 0x91C0
	Size: 0x1E
	Parameters: 1
	Flags: Linked
*/
function function_547701ae(behaviortreeentity)
{
	behaviortreeentity.at_entrance_tear_spot = 1;
	return true;
}

/*
	Name: zombieholdboardaction
	Namespace: zm_behavior
	Checksum: 0xAA3E8B4F
	Offset: 0x91E8
	Size: 0x98
	Parameters: 2
	Flags: Linked
*/
function zombieholdboardaction(behaviortreeentity, asmstatename)
{
	function_f83905d5(behaviortreeentity);
	boardactionast = behaviortreeentity astsearch(asmstatename);
	boardactionanimation = animationstatenetworkutility::searchanimationmap(behaviortreeentity, boardactionast[#"animation"]);
	animationstatenetworkutility::requeststate(behaviortreeentity, asmstatename);
	return 5;
}

/*
	Name: function_f83905d5
	Namespace: zm_behavior
	Checksum: 0xCF41648A
	Offset: 0x9288
	Size: 0x98
	Parameters: 1
	Flags: Linked
*/
function function_f83905d5(behaviortreeentity)
{
	aiutility::keepclaimnode(behaviortreeentity);
	behaviortreeentity setblackboardattribute("_which_board_pull", int(behaviortreeentity.chunk));
	behaviortreeentity setblackboardattribute("_board_attack_spot", float(behaviortreeentity.attacking_spot_index));
	return true;
}

/*
	Name: zombieholdboardactionterminate
	Namespace: zm_behavior
	Checksum: 0x9DCB7CB6
	Offset: 0x9328
	Size: 0x30
	Parameters: 2
	Flags: Linked
*/
function zombieholdboardactionterminate(behaviortreeentity, asmstatename)
{
	function_7d0a2e12(asmstatename);
	return 4;
}

/*
	Name: function_7d0a2e12
	Namespace: zm_behavior
	Checksum: 0xE59A7BB7
	Offset: 0x9360
	Size: 0x98
	Parameters: 1
	Flags: Linked
*/
function function_7d0a2e12(behaviortreeentity)
{
	aiutility::keepclaimnode(behaviortreeentity);
	behaviortreeentity setblackboardattribute("_which_board_pull", int(behaviortreeentity.chunk));
	behaviortreeentity setblackboardattribute("_board_attack_spot", float(behaviortreeentity.attacking_spot_index));
	return true;
}

/*
	Name: zombiegrabboardaction
	Namespace: zm_behavior
	Checksum: 0xE1700D89
	Offset: 0x9400
	Size: 0x98
	Parameters: 2
	Flags: Linked
*/
function zombiegrabboardaction(behaviortreeentity, asmstatename)
{
	function_66a8aef2(behaviortreeentity);
	boardactionast = behaviortreeentity astsearch(asmstatename);
	boardactionanimation = animationstatenetworkutility::searchanimationmap(behaviortreeentity, boardactionast[#"animation"]);
	animationstatenetworkutility::requeststate(behaviortreeentity, asmstatename);
	return 5;
}

/*
	Name: function_66a8aef2
	Namespace: zm_behavior
	Checksum: 0x8A44323B
	Offset: 0x94A0
	Size: 0xB8
	Parameters: 1
	Flags: Linked
*/
function function_66a8aef2(behaviortreeentity)
{
	aiutility::keepclaimnode(behaviortreeentity);
	behaviortreeentity pathmode("dont move");
	behaviortreeentity setblackboardattribute("_which_board_pull", int(behaviortreeentity.chunk));
	behaviortreeentity setblackboardattribute("_board_attack_spot", float(behaviortreeentity.attacking_spot_index));
	return true;
}

/*
	Name: zombiegrabboardactionterminate
	Namespace: zm_behavior
	Checksum: 0xE3E96B4E
	Offset: 0x9560
	Size: 0x30
	Parameters: 2
	Flags: Linked
*/
function zombiegrabboardactionterminate(behaviortreeentity, asmstatename)
{
	function_16251b30(asmstatename);
	return 4;
}

/*
	Name: function_16251b30
	Namespace: zm_behavior
	Checksum: 0x65378E41
	Offset: 0x9598
	Size: 0x28
	Parameters: 1
	Flags: Linked
*/
function function_16251b30(behaviortreeentity)
{
	aiutility::releaseclaimnode(behaviortreeentity);
	return true;
}

/*
	Name: zombiepullboardaction
	Namespace: zm_behavior
	Checksum: 0xC19BBF29
	Offset: 0x95C8
	Size: 0x98
	Parameters: 2
	Flags: Linked
*/
function zombiepullboardaction(behaviortreeentity, asmstatename)
{
	function_aa76355a(behaviortreeentity);
	boardactionast = behaviortreeentity astsearch(asmstatename);
	boardactionanimation = animationstatenetworkutility::searchanimationmap(behaviortreeentity, boardactionast[#"animation"]);
	animationstatenetworkutility::requeststate(behaviortreeentity, asmstatename);
	return 5;
}

/*
	Name: function_aa76355a
	Namespace: zm_behavior
	Checksum: 0x5DA4356E
	Offset: 0x9668
	Size: 0x98
	Parameters: 1
	Flags: Linked
*/
function function_aa76355a(behaviortreeentity)
{
	aiutility::keepclaimnode(behaviortreeentity);
	behaviortreeentity setblackboardattribute("_which_board_pull", int(behaviortreeentity.chunk));
	behaviortreeentity setblackboardattribute("_board_attack_spot", float(behaviortreeentity.attacking_spot_index));
	return true;
}

/*
	Name: zombiepullboardactionterminate
	Namespace: zm_behavior
	Checksum: 0x2EDE4075
	Offset: 0x9708
	Size: 0x30
	Parameters: 2
	Flags: Linked
*/
function zombiepullboardactionterminate(behaviortreeentity, asmstatename)
{
	function_76d619c8(asmstatename);
	return 4;
}

/*
	Name: function_76d619c8
	Namespace: zm_behavior
	Checksum: 0x1CD1082F
	Offset: 0x9740
	Size: 0x32
	Parameters: 1
	Flags: Linked
*/
function function_76d619c8(behaviortreeentity)
{
	aiutility::releaseclaimnode(behaviortreeentity);
	self.lastchunk_destroy_time = gettime();
	return true;
}

/*
	Name: barricadebreakterminate
	Namespace: zm_behavior
	Checksum: 0x33E07CA6
	Offset: 0x9780
	Size: 0x114
	Parameters: 1
	Flags: Linked
*/
function barricadebreakterminate(behaviortreeentity)
{
	behaviortreeentity.pushable = 1;
	behaviortreeentity.blockingpain = 0;
	behaviortreeentity pathmode("move allowed");
	behaviortreeentity clearpath();
	behaviortreeentity animmode("normal", 0);
	behaviortreeentity orientmode("face motion");
	if(zm_utility::is_survival())
	{
		if(isdefined(behaviortreeentity.var_67ab7d45))
		{
			behaviortreeentity setgoal(behaviortreeentity.var_67ab7d45);
			behaviortreeentity.var_67ab7d45 = undefined;
		}
		callback::function_d8abfc3d(#"hash_34b65342cbfdadac", &function_a26fcba);
	}
}

/*
	Name: function_a26fcba
	Namespace: zm_behavior
	Checksum: 0x4521F4C1
	Offset: 0x98A0
	Size: 0x8A
	Parameters: 0
	Flags: Linked
*/
function function_a26fcba()
{
	callback::function_52ac9652(#"hash_34b65342cbfdadac", &function_a26fcba);
	self clearpath();
	self.first_node = undefined;
	self.barrier_align = undefined;
	self zombie_utility::reset_attack_spot();
	self.at_entrance_tear_spot = 0;
	self.got_to_entrance = 0;
}

/*
	Name: function_a5a66d65
	Namespace: zm_behavior
	Checksum: 0x3F585320
	Offset: 0x9938
	Size: 0x1E
	Parameters: 1
	Flags: Linked
*/
function function_a5a66d65(behaviortreeentity)
{
	behaviortreeentity.var_348e5e19 = 1;
	return true;
}

/*
	Name: zombieattackthroughboardsaction
	Namespace: zm_behavior
	Checksum: 0x3F7A0091
	Offset: 0x9960
	Size: 0x48
	Parameters: 2
	Flags: Linked
*/
function zombieattackthroughboardsaction(behaviortreeentity, asmstatename)
{
	function_ebba4d65(behaviortreeentity);
	animationstatenetworkutility::requeststate(behaviortreeentity, asmstatename);
	return 5;
}

/*
	Name: function_ebba4d65
	Namespace: zm_behavior
	Checksum: 0xA31F825D
	Offset: 0x99B0
	Size: 0x36
	Parameters: 1
	Flags: Linked
*/
function function_ebba4d65(behaviortreeentity)
{
	aiutility::keepclaimnode(behaviortreeentity);
	behaviortreeentity.boardattack = 1;
	return true;
}

/*
	Name: zombieattackthroughboardsactionterminate
	Namespace: zm_behavior
	Checksum: 0xF3D57B9C
	Offset: 0x99F0
	Size: 0x30
	Parameters: 2
	Flags: Linked
*/
function zombieattackthroughboardsactionterminate(behaviortreeentity, asmstatename)
{
	function_28b47cc8(asmstatename);
	return 4;
}

/*
	Name: function_28b47cc8
	Namespace: zm_behavior
	Checksum: 0x55D65070
	Offset: 0x9A28
	Size: 0x32
	Parameters: 1
	Flags: Linked
*/
function function_28b47cc8(behaviortreeentity)
{
	aiutility::releaseclaimnode(behaviortreeentity);
	behaviortreeentity.boardattack = 0;
	return true;
}

/*
	Name: zombietauntaction
	Namespace: zm_behavior
	Checksum: 0xA008C666
	Offset: 0x9A68
	Size: 0x48
	Parameters: 2
	Flags: Linked
*/
function zombietauntaction(behaviortreeentity, asmstatename)
{
	function_eb270aac(behaviortreeentity);
	animationstatenetworkutility::requeststate(behaviortreeentity, asmstatename);
	return 5;
}

/*
	Name: function_eb270aac
	Namespace: zm_behavior
	Checksum: 0xCE16FCD
	Offset: 0x9AB8
	Size: 0x28
	Parameters: 1
	Flags: Linked
*/
function function_eb270aac(behaviortreeentity)
{
	aiutility::keepclaimnode(behaviortreeentity);
	return true;
}

/*
	Name: zombietauntactionterminate
	Namespace: zm_behavior
	Checksum: 0x58245135
	Offset: 0x9AE8
	Size: 0x30
	Parameters: 2
	Flags: Linked
*/
function zombietauntactionterminate(behaviortreeentity, asmstatename)
{
	function_ba06c8a0(asmstatename);
	return 4;
}

/*
	Name: function_ba06c8a0
	Namespace: zm_behavior
	Checksum: 0x5A38DE0C
	Offset: 0x9B20
	Size: 0x28
	Parameters: 1
	Flags: Linked
*/
function function_ba06c8a0(behaviortreeentity)
{
	aiutility::releaseclaimnode(behaviortreeentity);
	return true;
}

/*
	Name: zombiemantleaction
	Namespace: zm_behavior
	Checksum: 0x9119285C
	Offset: 0x9B50
	Size: 0xE8
	Parameters: 2
	Flags: Linked
*/
function zombiemantleaction(behaviortreeentity, asmstatename)
{
	behaviortreeentity.clamptonavmesh = 0;
	if(isdefined(behaviortreeentity.attacking_spot_index))
	{
		behaviortreeentity.saved_attacking_spot_index = behaviortreeentity.attacking_spot_index;
		behaviortreeentity setblackboardattribute("_board_attack_spot", float(behaviortreeentity.attacking_spot_index));
	}
	behaviortreeentity.var_9ed3cc11 = behaviortreeentity function_e827fc0e();
	behaviortreeentity pushplayer(1);
	behaviortreeentity.isinmantleaction = 1;
	behaviortreeentity zombie_utility::reset_attack_spot();
	animationstatenetworkutility::requeststate(behaviortreeentity, asmstatename);
	return 5;
}

/*
	Name: zombiemantleactionterminate
	Namespace: zm_behavior
	Checksum: 0xC4266DE6
	Offset: 0x9C40
	Size: 0x80
	Parameters: 2
	Flags: Linked
*/
function zombiemantleactionterminate(behaviortreeentity, asmstatename)
{
	asmstatename.clamptonavmesh = 1;
	asmstatename.isinmantleaction = undefined;
	if(isdefined(asmstatename.var_9ed3cc11))
	{
		asmstatename pushplayer(asmstatename.var_9ed3cc11);
		asmstatename.var_9ed3cc11 = undefined;
	}
	asmstatename zm_behavior_utility::enteredplayablearea();
	return 4;
}

/*
	Name: boardtearmocompstart
	Namespace: zm_behavior
	Checksum: 0x33AAFAA
	Offset: 0x9CC8
	Size: 0x1CC
	Parameters: 5
	Flags: Linked
*/
function boardtearmocompstart(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	if(isdefined(mocompanimflag.barrier_align))
	{
		origin = getstartorigin(mocompanimflag.barrier_align.origin, mocompanimflag.barrier_align.angles, mocompduration);
		angles = getstartangles(mocompanimflag.barrier_align.origin, mocompanimflag.barrier_align.angles, mocompduration);
	}
	else
	{
		origin = getstartorigin(mocompanimflag.first_node.zbarrier.origin, mocompanimflag.first_node.zbarrier.angles, mocompduration);
		angles = getstartangles(mocompanimflag.first_node.zbarrier.origin, mocompanimflag.first_node.zbarrier.angles, mocompduration);
	}
	mocompanimflag forceteleport(origin, angles, 1);
	mocompanimflag.pushable = 0;
	mocompanimflag.blockingpain = 1;
	mocompanimflag animmode("noclip", 1);
	mocompanimflag orientmode("face angle", angles[1]);
}

/*
	Name: boardtearmocompupdate
	Namespace: zm_behavior
	Checksum: 0x20B3BC97
	Offset: 0x9EA0
	Size: 0x62
	Parameters: 5
	Flags: Linked
*/
function boardtearmocompupdate(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	mocompduration animmode("noclip", 0);
	mocompduration.pushable = 0;
	mocompduration.blockingpain = 1;
}

/*
	Name: barricadeentermocompstart
	Namespace: zm_behavior
	Checksum: 0x5A78B38A
	Offset: 0x9F10
	Size: 0x272
	Parameters: 5
	Flags: Linked
*/
function barricadeentermocompstart(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	if(isdefined(mocompanimflag.barrier_align))
	{
		origin = getstartorigin(mocompanimflag.barrier_align.origin, mocompanimflag.barrier_align.angles, mocompduration);
		angles = getstartangles(mocompanimflag.barrier_align.origin, mocompanimflag.barrier_align.angles, mocompduration);
	}
	else
	{
		zbarrier_origin = (isdefined(mocompanimflag.first_node.zbarrier) ? mocompanimflag.first_node.zbarrier.origin : mocompanimflag.first_node.zbarrier_origin);
		var_f4b27846 = (isdefined(mocompanimflag.first_node.zbarrier) ? mocompanimflag.first_node.zbarrier.angles : mocompanimflag.first_node.var_f4b27846);
		origin = getstartorigin(zbarrier_origin, var_f4b27846, mocompduration);
		angles = getstartangles(zbarrier_origin, var_f4b27846, mocompduration);
	}
	if(isdefined(mocompanimflag.mocomp_barricade_offset))
	{
		origin = origin + (anglestoforward(angles) * mocompanimflag.mocomp_barricade_offset);
	}
	mocompanimflag forceteleport(origin, angles, 1);
	mocompanimflag animmode("noclip", 0);
	mocompanimflag orientmode("face angle", angles[1]);
	mocompanimflag.pushable = 0;
	mocompanimflag.blockingpain = 1;
	mocompanimflag pathmode("dont move");
	mocompanimflag.usegoalanimweight = 1;
}

/*
	Name: barricadeentermocompupdate
	Namespace: zm_behavior
	Checksum: 0xD62E26B5
	Offset: 0xA190
	Size: 0x56
	Parameters: 5
	Flags: Linked
*/
function barricadeentermocompupdate(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	mocompduration animmode("noclip", 0);
	mocompduration.pushable = 0;
}

/*
	Name: barricadeentermocompterminate
	Namespace: zm_behavior
	Checksum: 0x6AE4A732
	Offset: 0xA1F0
	Size: 0x4E
	Parameters: 5
	Flags: Linked
*/
function barricadeentermocompterminate(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	barricadebreakterminate(mocompduration);
	mocompduration.usegoalanimweight = 0;
}

/*
	Name: barricadeentermocompnozstart
	Namespace: zm_behavior
	Checksum: 0x1572CD29
	Offset: 0xA248
	Size: 0x272
	Parameters: 5
	Flags: Linked
*/
function barricadeentermocompnozstart(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	if(isdefined(mocompanimflag.barrier_align))
	{
		origin = getstartorigin(mocompanimflag.barrier_align.origin, mocompanimflag.barrier_align.angles, mocompduration);
		angles = getstartangles(mocompanimflag.barrier_align.origin, mocompanimflag.barrier_align.angles, mocompduration);
	}
	else
	{
		zbarrier_origin = (isdefined(mocompanimflag.first_node.zbarrier) ? mocompanimflag.first_node.zbarrier.origin : mocompanimflag.first_node.zbarrier_origin);
		var_f4b27846 = (isdefined(mocompanimflag.first_node.zbarrier) ? mocompanimflag.first_node.zbarrier.angles : mocompanimflag.first_node.var_f4b27846);
		origin = getstartorigin(zbarrier_origin, var_f4b27846, mocompduration);
		angles = getstartangles(zbarrier_origin, var_f4b27846, mocompduration);
	}
	if(isdefined(mocompanimflag.mocomp_barricade_offset))
	{
		origin = origin + (anglestoforward(angles) * mocompanimflag.mocomp_barricade_offset);
	}
	mocompanimflag forceteleport(origin, angles, 1);
	mocompanimflag animmode("noclip", 0);
	mocompanimflag orientmode("face angle", angles[1]);
	mocompanimflag.pushable = 0;
	mocompanimflag.blockingpain = 1;
	mocompanimflag pathmode("dont move");
	mocompanimflag.usegoalanimweight = 1;
}

/*
	Name: barricadeentermocompnozupdate
	Namespace: zm_behavior
	Checksum: 0x846B7149
	Offset: 0xA4C8
	Size: 0x56
	Parameters: 5
	Flags: Linked
*/
function barricadeentermocompnozupdate(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	mocompduration animmode("noclip", 0);
	mocompduration.pushable = 0;
}

/*
	Name: barricadeentermocompnozterminate
	Namespace: zm_behavior
	Checksum: 0xEB23070F
	Offset: 0xA528
	Size: 0xAC
	Parameters: 5
	Flags: Linked
*/
function barricadeentermocompnozterminate(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	mocompduration.pushable = 1;
	mocompduration.blockingpain = 0;
	mocompduration pathmode("move allowed");
	mocompduration.usegoalanimweight = 0;
	mocompduration animmode("normal", 0);
	mocompduration orientmode("face motion");
}

/*
	Name: notetrackboardtear
	Namespace: zm_behavior
	Checksum: 0xF622124A
	Offset: 0xA5E0
	Size: 0xAC
	Parameters: 1
	Flags: Linked
*/
function notetrackboardtear(animationentity)
{
	if(isdefined(animationentity.chunk))
	{
		animationentity.first_node.zbarrier setzbarrierpiecestate(animationentity.chunk, "opening");
		level notify(#"zombie_board_tear", {#s_board:animationentity.first_node, #ai_zombie:animationentity});
		animationentity.first_node notify(#"zombie_board_tear");
	}
}

/*
	Name: notetrackboardmelee
	Namespace: zm_behavior
	Checksum: 0xEFCF8F20
	Offset: 0xA698
	Size: 0x2D4
	Parameters: 1
	Flags: Linked
*/
function notetrackboardmelee(animationentity)
{
	/#
		assert(animationentity.meleeweapon != level.weaponnone, "");
	#/
	if(isdefined(animationentity.first_node))
	{
		meleedistsq = 8100;
		if(isdefined(level.attack_player_thru_boards_range))
		{
			meleedistsq = level.attack_player_thru_boards_range * level.attack_player_thru_boards_range;
		}
		triggerdistsq = 2601;
		for(i = 0; i < animationentity.player_targets.size; i++)
		{
			if(!isdefined(animationentity.player_targets[i]))
			{
				continue;
			}
			playerdistsq = distance2dsquared(animationentity.player_targets[i].origin, animationentity.origin);
			heightdiff = abs(animationentity.player_targets[i].origin[2] - animationentity.origin[2]);
			if(playerdistsq < meleedistsq && (heightdiff * heightdiff) < meleedistsq)
			{
				playertriggerdistsq = distance2dsquared(animationentity.player_targets[i].origin, animationentity.first_node.trigger_location.origin);
				heightdiff = abs(animationentity.player_targets[i].origin[2] - animationentity.first_node.trigger_location.origin[2]);
				if(playertriggerdistsq < triggerdistsq && (heightdiff * heightdiff) < triggerdistsq)
				{
					animationentity.player_targets[i] playsoundtoplayer(#"hash_75318bcffca7ff06", animationentity.player_targets[i]);
					animationentity.player_targets[i] dodamage(animationentity.meleeweapon.meleedamage, animationentity.origin, self, self, "none", "MOD_MELEE");
					break;
				}
			}
		}
	}
	else
	{
		animationentity melee();
	}
}

/*
	Name: function_b37b8c0d
	Namespace: zm_behavior
	Checksum: 0x2ECC5A3
	Offset: 0xA978
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function function_b37b8c0d(entity)
{
	if(isdefined(entity.first_node))
	{
		zm_blockers::open_zbarrier(entity.first_node, 1);
	}
}

/*
	Name: findzombieenemy
	Namespace: zm_behavior
	Checksum: 0xE40C7A8D
	Offset: 0xA9C0
	Size: 0x1FC
	Parameters: 0
	Flags: Linked
*/
function findzombieenemy()
{
	if(isdefined(self.var_8b59c468))
	{
		self [[self.var_8b59c468]]();
		return;
	}
	zombies = getaispeciesarray(level.zombie_team, "all");
	zombie_enemy = undefined;
	closest_dist = undefined;
	foreach(zombie in zombies)
	{
		if(isalive(zombie) && is_true(zombie.completed_emerging_into_playable_area) && !zm_utility::is_magic_bullet_shield_enabled(zombie) && is_true(zombie.canbetargetedbyturnedzombies))
		{
			dist = distancesquared(self.origin, zombie.origin);
			if(!isdefined(closest_dist) || dist < closest_dist)
			{
				closest_dist = dist;
				zombie_enemy = zombie;
			}
		}
	}
	self.favoriteenemy = zombie_enemy;
	if(isdefined(self.favoriteenemy))
	{
		self setgoal(self.favoriteenemy.origin);
	}
	else
	{
		self setgoal(self.origin);
	}
}

/*
	Name: zombieblackholebombpullstart
	Namespace: zm_behavior
	Checksum: 0x22E720FC
	Offset: 0xABC8
	Size: 0x8E
	Parameters: 2
	Flags: Linked
*/
function zombieblackholebombpullstart(entity, asmstatename)
{
	entity.pulltime = gettime();
	entity.pullorigin = entity.origin;
	animationstatenetworkutility::requeststate(entity, asmstatename);
	zombieupdateblackholebombpullstate(entity);
	if(isdefined(entity.damageorigin))
	{
		entity.n_zombie_custom_goal_radius = 8;
		entity.v_zombie_custom_goal_pos = entity.damageorigin;
	}
	return 5;
}

/*
	Name: zombieupdateblackholebombpullstate
	Namespace: zm_behavior
	Checksum: 0xD2586A6D
	Offset: 0xAC60
	Size: 0x76
	Parameters: 1
	Flags: Linked
*/
function zombieupdateblackholebombpullstate(entity)
{
	dist_to_bomb = distancesquared(entity.origin, entity.damageorigin);
	if(dist_to_bomb < 16384)
	{
		entity._black_hole_bomb_collapse_death = 1;
	}
	else
	{
		if(dist_to_bomb < 1048576)
		{
		}
		else
		{
		}
	}
}

/*
	Name: zombieblackholebombpullupdate
	Namespace: zm_behavior
	Checksum: 0xC31FEF6D
	Offset: 0xACE0
	Size: 0x1DE
	Parameters: 2
	Flags: Linked
*/
function zombieblackholebombpullupdate(entity, asmstatename)
{
	if(!isdefined(asmstatename.interdimensional_gun_kill))
	{
		return 4;
	}
	zombieupdateblackholebombpullstate(asmstatename);
	if(is_true(asmstatename._black_hole_bomb_collapse_death))
	{
		asmstatename.skipautoragdoll = 1;
		asmstatename dodamage(asmstatename.health + 666, asmstatename.origin + vectorscale((0, 0, 1), 50), asmstatename.interdimensional_gun_attacker, undefined, undefined, "MOD_CRUSH");
		return 4;
	}
	if(isdefined(asmstatename.damageorigin))
	{
		asmstatename.v_zombie_custom_goal_pos = asmstatename.damageorigin;
	}
	if(!is_true(asmstatename.missinglegs) && (gettime() - asmstatename.pulltime) > 1000)
	{
		distsq = distance2dsquared(asmstatename.origin, asmstatename.pullorigin);
		if(distsq < 144)
		{
			asmstatename setavoidancemask("avoid all");
			asmstatename.cant_move = 1;
			if(isdefined(asmstatename.cant_move_cb))
			{
				asmstatename thread [[asmstatename.cant_move_cb]]();
			}
		}
		else
		{
			asmstatename setavoidancemask("avoid none");
			asmstatename.cant_move = 0;
		}
		asmstatename.pulltime = gettime();
		asmstatename.pullorigin = asmstatename.origin;
	}
	return 5;
}

/*
	Name: zombieblackholebombpullend
	Namespace: zm_behavior
	Checksum: 0x3BB9699F
	Offset: 0xAEC8
	Size: 0x46
	Parameters: 2
	Flags: Linked
*/
function zombieblackholebombpullend(entity, asmstatename)
{
	asmstatename.v_zombie_custom_goal_pos = undefined;
	asmstatename.n_zombie_custom_goal_radius = undefined;
	asmstatename.pulltime = undefined;
	asmstatename.pullorigin = undefined;
	return 4;
}

/*
	Name: zombiekilledwhilegettingpulled
	Namespace: zm_behavior
	Checksum: 0xBE2AD3AD
	Offset: 0xAF18
	Size: 0x72
	Parameters: 1
	Flags: Linked
*/
function zombiekilledwhilegettingpulled(entity)
{
	if(!is_true(self.missinglegs) && is_true(entity.interdimensional_gun_kill) && !is_true(entity._black_hole_bomb_collapse_death))
	{
		return true;
	}
	return false;
}

/*
	Name: zombiekilledbyblackholebombcondition
	Namespace: zm_behavior
	Checksum: 0xCA6B79CA
	Offset: 0xAF98
	Size: 0x2E
	Parameters: 1
	Flags: Linked
*/
function zombiekilledbyblackholebombcondition(entity)
{
	if(is_true(entity._black_hole_bomb_collapse_death))
	{
		return true;
	}
	return false;
}

/*
	Name: function_38fec26f
	Namespace: zm_behavior
	Checksum: 0x413F1CE0
	Offset: 0xAFD0
	Size: 0x2E
	Parameters: 1
	Flags: Linked
*/
function function_38fec26f(entity)
{
	if(is_true(entity.freezegun_death))
	{
		return true;
	}
	return false;
}

/*
	Name: function_e4d7303f
	Namespace: zm_behavior
	Checksum: 0x92D17B1B
	Offset: 0xB008
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function function_e4d7303f(entity)
{
	return is_true(entity.var_69a981e6);
}

/*
	Name: function_17cd1b17
	Namespace: zm_behavior
	Checksum: 0x8D0898B7
	Offset: 0xB038
	Size: 0xD2
	Parameters: 1
	Flags: Linked
*/
function function_17cd1b17(behaviortreeentity)
{
	if(!isdefined(behaviortreeentity.enemy))
	{
		return 0;
	}
	meleedistsq = 4096;
	if(isdefined(behaviortreeentity.meleeweapon) && behaviortreeentity.meleeweapon !== level.weaponnone)
	{
		meleedistsq = behaviortreeentity.meleeweapon.aimeleerange * behaviortreeentity.meleeweapon.aimeleerange;
	}
	if(distancesquared(behaviortreeentity.origin, behaviortreeentity.enemy.origin) > meleedistsq)
	{
		return 0;
	}
	return isdefined(behaviortreeentity.melee_cooldown) && gettime() < behaviortreeentity.melee_cooldown;
}

/*
	Name: zombiekilledbyblackholebombstart
	Namespace: zm_behavior
	Checksum: 0x1F980AED
	Offset: 0xB118
	Size: 0x64
	Parameters: 2
	Flags: Linked
*/
function zombiekilledbyblackholebombstart(entity, asmstatename)
{
	animationstatenetworkutility::requeststate(entity, asmstatename);
	if(isdefined(level.black_hole_bomb_death_start_func))
	{
		entity thread [[level.black_hole_bomb_death_start_func]](entity.damageorigin, entity.interdimensional_gun_projectile);
	}
	return 5;
}

/*
	Name: zombiekilledbyblackholebombend
	Namespace: zm_behavior
	Checksum: 0xBEA128BF
	Offset: 0xB188
	Size: 0xE0
	Parameters: 2
	Flags: Linked
*/
function zombiekilledbyblackholebombend(entity, asmstatename)
{
	if(isdefined(level._effect) && isdefined(level._effect[#"black_hole_bomb_zombie_gib"]))
	{
		fxorigin = asmstatename gettagorigin("tag_origin");
		forward = anglestoforward(asmstatename.angles);
		playfx(level._effect[#"black_hole_bomb_zombie_gib"], fxorigin, forward, (0, 0, 1));
	}
	asmstatename hide();
	return 4;
}

/*
	Name: zombiebhbburst
	Namespace: zm_behavior
	Checksum: 0xDB7D9ACA
	Offset: 0xB270
	Size: 0xBC
	Parameters: 1
	Flags: Linked
*/
function zombiebhbburst(entity)
{
	if(isdefined(level._effect) && isdefined(level._effect[#"black_hole_bomb_zombie_destroy"]))
	{
		fxorigin = entity gettagorigin("tag_origin");
		playfx(level._effect[#"black_hole_bomb_zombie_destroy"], fxorigin);
	}
	if(isdefined(entity.interdimensional_gun_projectile))
	{
		entity.interdimensional_gun_projectile notify(#"black_hole_bomb_kill");
	}
}

/*
	Name: function_b654f4f5
	Namespace: zm_behavior
	Checksum: 0x3E0D6B4B
	Offset: 0xB338
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function function_b654f4f5(entity)
{
	if(isdefined(level.var_58e6238))
	{
		entity [[level.var_58e6238]]();
	}
	return 5;
}

/*
	Name: function_36b3cb7d
	Namespace: zm_behavior
	Checksum: 0xFA736223
	Offset: 0xB378
	Size: 0x30
	Parameters: 1
	Flags: Linked
*/
function function_36b3cb7d(entity)
{
	if(isdefined(level.var_f975b6ae))
	{
		entity [[level.var_f975b6ae]]();
	}
}

/*
	Name: function_e403e74e
	Namespace: zm_behavior
	Checksum: 0x38EAEEF5
	Offset: 0xB3B0
	Size: 0x54
	Parameters: 3
	Flags: Linked
*/
function function_e403e74e(damage, weapon, target)
{
	var_2a3ef77c = weapons::function_74bbb3fa(damage, weapon, target);
	if(var_2a3ef77c > damage)
	{
		return 1.5;
	}
	return 1;
}

/*
	Name: function_29c1ba76
	Namespace: zm_behavior
	Checksum: 0x5B1BDD33
	Offset: 0xB410
	Size: 0x82C
	Parameters: 13
	Flags: Linked
*/
function function_29c1ba76(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype)
{
	self.var_426947c4 = undefined;
	var_e9809e9a = 0;
	if(isplayer(vdir))
	{
		if(vdir namespace_791d0451::function_56cedda7(#"hash_1f95b38e4a49dd97") || vdir namespace_791d0451::function_56cedda7(#"hash_1f95b28e4a49dbe4") || vdir namespace_791d0451::function_56cedda7(#"hash_1f95b18e4a49da31") || vdir namespace_791d0451::function_56cedda7(#"hash_1f95b08e4a49d87e"))
		{
			var_e9809e9a = 1;
		}
	}
	var_ebcff177 = 1;
	if(namespace_81245006::hasarmor(self) && (psoffsettime === "MOD_PROJECTILE_SPLASH" || psoffsettime === "MOD_GRENADE_SPLASH" || psoffsettime == "MOD_EXPLOSIVE"))
	{
		var_3cddb028 = 0.5 * shitloc;
		var_31e96b81 = int(var_3cddb028);
		foreach(weakpoint in self.var_5ace757d)
		{
			if(weakpoint.type === #"armor" && weakpoint.currstate === 1)
			{
				namespace_81245006::function_ef87b7e8(weakpoint, var_31e96b81);
				if(namespace_81245006::function_f29756fe(weakpoint) === 3 && isdefined(weakpoint.var_f371ebb0))
				{
					destructserverutils::function_8475c53a(self, weakpoint.var_f371ebb0);
					if(isplayer(vdir))
					{
						vdir zm_stats::increment_challenge_stat(#"hash_2805701e53ce32a1");
						level scoreevents::doscoreeventcallback("scoreEventZM", {#scoreevent:"destroyed_armor_zm", #attacker:vdir});
					}
					self.var_426947c4 = 1;
					if(weakpoint.var_f371ebb0 === "body_armor")
					{
						callback::callback(#"hash_7d67d0e9046494fb");
					}
				}
			}
		}
	}
	weakpoint = namespace_81245006::function_3131f5dd(self, surfacetype, 1);
	if(isdefined(weakpoint) && weakpoint.type === #"armor")
	{
		var_3cddb028 = shitloc;
		if(isdefined(boneindex))
		{
			var_3cddb028 = function_e403e74e(shitloc, boneindex, self) * shitloc;
		}
		var_3cddb028 = int(var_3cddb028);
		namespace_81245006::function_ef87b7e8(weakpoint, var_3cddb028);
		if(namespace_81245006::function_f29756fe(weakpoint) === 3 && isdefined(weakpoint.var_f371ebb0))
		{
			destructserverutils::function_8475c53a(self, weakpoint.var_f371ebb0);
			if(isplayer(vdir))
			{
				vdir zm_stats::increment_challenge_stat(#"hash_2805701e53ce32a1");
				level scoreevents::doscoreeventcallback("scoreEventZM", {#scoreevent:"destroyed_armor_zm", #attacker:vdir});
			}
			self.var_426947c4 = 1;
			if(weakpoint.var_f371ebb0 === "body_armor")
			{
				callback::callback(#"hash_7d67d0e9046494fb");
			}
		}
		w_base = zm_weapons::get_base_weapon(boneindex);
		var_36d55c9c = 1;
		if(isplayer(vdir))
		{
			weapclass = level.zombie_weapons[w_base].weapon_classname;
			if(isdefined(weapclass))
			{
				n_tier = vdir namespace_b61a349a::function_998f8321(boneindex);
				switch(weapclass)
				{
					case "lmg":
					case "sniper":
					{
						if(n_tier >= 2)
						{
							var_36d55c9c = (n_tier >= 4 ? 1.25 : 1.1);
						}
						break;
					}
					case "pistol":
					case "shotgun":
					{
						if(n_tier >= 3)
						{
							var_36d55c9c = 1.1;
						}
						break;
					}
				}
			}
			if(self.var_9fde8624 === #"hash_7a778318514578f7")
			{
				if(var_e9809e9a)
				{
					shitloc = int(shitloc * (0.375 * var_36d55c9c));
				}
				else
				{
					shitloc = int((shitloc * 0.25) * var_36d55c9c);
				}
				vdir namespace_b61a349a::function_8a6ccd14(boneindex, n_tier, undefined, shitloc);
			}
			else if(self.var_9fde8624 === #"hash_622e7c9cc7c06c7")
			{
				if(var_e9809e9a)
				{
					shitloc = int(shitloc * (0.75 * var_36d55c9c));
				}
				else
				{
					shitloc = int((shitloc * 0.5) * var_36d55c9c);
				}
				vdir namespace_b61a349a::function_8a6ccd14(boneindex, n_tier, undefined, shitloc);
			}
		}
		self.var_67f98db0 = 1;
		var_ebcff177 = 3;
		var_43f0e034 = function_f4e9bba4(self);
		self function_2d4173a8(var_43f0e034);
	}
	return {#hash_ebcff177:var_ebcff177, #weakpoint:weakpoint, #damage:shitloc};
}

/*
	Name: function_f4e9bba4
	Namespace: zm_behavior
	Checksum: 0xB98B93BD
	Offset: 0xBC48
	Size: 0x12A
	Parameters: 1
	Flags: Linked
*/
function function_f4e9bba4(entity)
{
	max_health = 0;
	var_765c0df4 = 0;
	weakpoints = namespace_81245006::function_fab3ee3e(entity);
	if(!isdefined(weakpoints))
	{
		return 0;
	}
	foreach(weakpoint in weakpoints)
	{
		if(weakpoint.type === #"armor")
		{
			max_health = max_health + weakpoint.maxhealth;
			var_765c0df4 = var_765c0df4 + max(weakpoint.health, 0);
		}
	}
	if(max_health == 0)
	{
		return 0;
	}
	return var_765c0df4 / max_health;
}

/*
	Name: function_7994fd99
	Namespace: zm_behavior
	Checksum: 0x45249CD0
	Offset: 0xBD80
	Size: 0x108
	Parameters: 13
	Flags: Linked
*/
function function_7994fd99(inflictor, attacker, damage, flags, meansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype)
{
	if(isdefined(damage) && isactor(damage) && self.team == damage.team)
	{
		return -1;
	}
	if(self.archetype == #"zombie" && !isdefined(self.var_9fde8624))
	{
		self destructserverutils::handledamage(attacker, damage, flags, meansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype);
	}
	return -1;
}

/*
	Name: function_95578a3c
	Namespace: zm_behavior
	Checksum: 0x8782788A
	Offset: 0xBE90
	Size: 0x11C
	Parameters: 14
	Flags: Linked
*/
function function_95578a3c(willbekilled, inflictor, attacker, damage, flags, mod, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype)
{
	if(!isdefined(self.var_448aebc7))
	{
		self.var_448aebc7 = [];
	}
	if(isdefined(boneindex) && isdefined(surfacetype))
	{
		if(!isdefined(self.var_448aebc7[boneindex getentitynumber()]))
		{
			self.var_448aebc7[boneindex getentitynumber()] = 0;
		}
		self.var_448aebc7[boneindex getentitynumber()] = self.var_448aebc7[boneindex getentitynumber()] + surfacetype;
	}
}

/*
	Name: function_92dcde87
	Namespace: zm_behavior
	Checksum: 0x4D5D2B2
	Offset: 0xBFB8
	Size: 0x516
	Parameters: 4
	Flags: Linked
*/
function function_92dcde87(start_pos, end_pos, velocity, var_781a6f9a)
{
	gravity = getdvarfloat(#"bg_lowgravity");
	if(velocity[2] > 0)
	{
		var_67fdba7f = velocity[2] / gravity;
		var_dd8c8ac8 = var_67fdba7f * 0.5;
		var_f334075d = (var_67fdba7f * var_67fdba7f) + ((2 * (start_pos[2] - end_pos[2])) / gravity);
		if(var_f334075d <= 0)
		{
			return false;
		}
		var_3ebd279c = 0.5 * sqrt(var_f334075d);
	}
	else
	{
		var_67fdba7f = 0;
		var_dd8c8ac8 = 0;
		var_f334075d = (velocity[2] * velocity[2]) + ((2 * (start_pos[2] - end_pos[2])) * gravity);
		if(var_f334075d <= 0)
		{
			return false;
		}
		var_3ebd279c = (0.5 * (velocity[2] + sqrt(var_f334075d))) / gravity;
	}
	var_dcd60882 = var_67fdba7f + var_3ebd279c;
	if(!isdefined(var_781a6f9a))
	{
		var_781a6f9a = var_dcd60882;
	}
	times = [2:var_dcd60882, 1:var_67fdba7f, 0:var_dd8c8ac8];
	points = [0:start_pos];
	for(i = 0; i < times.size; i++)
	{
		if(var_781a6f9a < times[i])
		{
			break;
		}
		points[points.size] = (start_pos[0] + (times[i] * velocity[0]), start_pos[1] + (times[i] * velocity[1]), start_pos[2] + (times[i] * (velocity[2] - ((0.5 * gravity) * times[i]))));
	}
	if(var_781a6f9a != (times[times.size - 1]))
	{
		points[points.size] = (start_pos[0] + (var_781a6f9a * velocity[0]), start_pos[1] + (var_781a6f9a * velocity[1]), start_pos[2] + (var_781a6f9a * (velocity[2] - ((0.5 * gravity) * var_781a6f9a))));
	}
	/#
		if(getdvarint(#"hash_2c509ee80b516880", 0))
		{
			var_48f09bdb = 0;
			for(i = 0; i < points.size - 1; i++)
			{
				if(!var_48f09bdb)
				{
					traceresults = bullettrace(points[i], points[i + 1], 0, self);
					if(traceresults[#"fraction"] < 1)
					{
						hit_point = vectorlerp(points[i], points[i + 1], traceresults[#"fraction"]);
						recordline(points[i], hit_point, (0, 1, 0), "");
						recordline(hit_point, points[i + 1], (1, 0, 0), "");
						var_48f09bdb = 1;
					}
					else
					{
						recordline(points[i], points[i + 1], (0, 1, 0), "");
					}
					continue;
				}
				recordline(points[i], points[i + 1], (1, 0, 0), "");
			}
		}
	#/
	for(i = 0; i < points.size - 1; i++)
	{
		if(!bullettracepassed(points[i], points[i + 1], 0, self))
		{
			return false;
		}
	}
	return true;
}

/*
	Name: function_4a99b560
	Namespace: zm_behavior
	Checksum: 0x20B4BBFD
	Offset: 0xC4D8
	Size: 0x6F2
	Parameters: 1
	Flags: Linked
*/
function function_4a99b560(entity)
{
	/#
		if(getdvarint(#"hash_2c509ee80b516880", 0))
		{
			if(isdefined(entity.enemy))
			{
				start_pos = entity.origin + (0, 0, entity function_6a9ae71());
				target_pos = entity.enemy gettagorigin("");
				to_target = target_pos - start_pos;
				if(to_target === (0, 0, 0))
				{
					record3dtext("", entity.origin, (0 ? (0, 1, 0) : (1, 0, 0)), "", entity);
					return 0;
				}
				time = max(length((to_target[0], to_target[1], 0)) / 700, 0.1);
				var_813d38fa = ((0.5 * getdvarfloat(#"bg_lowgravity", 400)) * sqr(time) + to_target[2]) / time;
				to_target = vectornormalize((to_target[0], to_target[1], 0)) * 700;
			}
			var_8a34a513 = isdefined(entity.enemy) && isarray(entity.enemy.var_f904e440);
			var_79637724 = var_8a34a513 && isinarray(entity.enemy.var_f904e440, entity);
			var_b295b952 = !isdefined(entity.enemy) || (!zm_utility::is_classic() && distance2dsquared(entity.origin, entity.enemy.origin) <= sqr(100));
			var_6c2051ca = !isdefined(entity.enemy) || !entity function_92dcde87(start_pos, target_pos, (to_target[0], to_target[1], var_813d38fa), time);
			record3dtext("", entity.origin, (var_8a34a513 ? (0, 1, 0) : (1, 0, 0)), "", entity);
			record3dtext("", entity.origin, (var_79637724 ? (0, 1, 0) : (1, 0, 0)), "", entity);
			record3dtext("", entity.origin, (var_b295b952 ? (0, 1, 0) : (1, 0, 0)), "", entity);
			record3dtext("", entity.origin, (var_6c2051ca ? (0, 1, 0) : (1, 0, 0)), "", entity);
			return var_8a34a513 && var_79637724 && !var_b295b952 && !var_6c2051ca;
		}
	#/
	if(!isdefined(entity.enemy.var_f904e440))
	{
		return 0;
	}
	start_pos = entity.origin + (0, 0, entity function_6a9ae71());
	target_pos = entity.enemy.origin + vectorscale((0, 0, 1), 46);
	to_target = target_pos - start_pos;
	if(to_target === (0, 0, 0))
	{
		return 0;
	}
	time = max(length((to_target[0], to_target[1], 0)) / 700, 0.1);
	var_64b12059 = entity.enemy namespace_98decc78::function_be5f206(start_pos, target_pos, time);
	if(isdefined(var_64b12059) && var_64b12059 !== start_pos)
	{
		target_pos = var_64b12059;
		to_target = target_pos - start_pos;
	}
	var_813d38fa = ((0.5 * getdvarfloat(#"bg_lowgravity", 400)) * sqr(time) + to_target[2]) / time;
	to_target = vectornormalize((to_target[0], to_target[1], 0)) * 700;
	if(zm_utility::is_survival() && isdefined(entity.current_state) && entity.current_state.name !== #"chase" || (zm_utility::is_survival() && distance2dsquared(entity.origin, entity.enemy.origin) <= sqr(100)) || !isinarray(entity.enemy.var_f904e440, entity) || !entity function_92dcde87(start_pos, target_pos, (to_target[0], to_target[1], var_813d38fa), time))
	{
		return 0;
	}
	return 1;
}

/*
	Name: function_e5f60f55
	Namespace: zm_behavior
	Checksum: 0x90683A4D
	Offset: 0xCBD8
	Size: 0x55C
	Parameters: 1
	Flags: Linked
*/
function function_e5f60f55(entity)
{
	if(!isdefined(entity.enemy.var_f904e440))
	{
		entity.enemy.var_f904e440 = [];
	}
	arrayremovevalue(entity.enemy.var_f904e440, undefined);
	var_a702ff0 = [];
	foreach(zombie in entity.enemy.var_f904e440)
	{
		if(zombie.enemy !== entity.enemy || (zm_utility::is_survival() && isdefined(zombie.current_state) && zombie.current_state.name !== #"chase"))
		{
			var_a702ff0[var_a702ff0.size] = zombie;
		}
	}
	foreach(zombie in var_a702ff0)
	{
		arrayremovevalue(entity.enemy.var_f904e440, zombie);
	}
	if(!isinarray(entity.enemy.var_f904e440, entity) && entity.enemy.var_f904e440.size < (zm_utility::is_survival() ? 24 : 24))
	{
		entity.enemy.var_f904e440[entity.enemy.var_f904e440.size] = entity;
	}
	if(isinarray(entity.enemy.var_f904e440, entity))
	{
		if(!isdefined(entity.var_6ca50f69))
		{
			entity.var_6ca50f69 = 0;
		}
		if(function_4a99b560(entity))
		{
			entity.var_8c4d3e5d = 1;
			entity.var_6ca50f69 = 0;
			entity setgoal(entity.origin);
			entity.var_95d1c014 = undefined;
			entity.keep_moving = 0;
			return;
		}
		step_size = max(100 - distance2d(entity.origin, entity.enemy.origin), 64 + (entity.var_6ca50f69 * 64));
		if(zm_utility::is_classic() || zm_utility::function_c200446c())
		{
			if(isdefined(self.enemy.last_valid_position))
			{
				entity.var_6ca50f69 = 0;
				entity setgoal(entity.enemy.last_valid_position);
				entity.var_95d1c014 = undefined;
				return;
			}
		}
		var_e737d2f1 = function_c41c61e8(step_size);
		if(isdefined(var_e737d2f1))
		{
			entity.var_6ca50f69 = 0;
			entity setgoal(var_e737d2f1);
			entity.var_95d1c014 = undefined;
			return;
		}
		reacquirestep = entity reacquirestep(step_size, 1);
		if(isdefined(reacquirestep))
		{
			entity.var_6ca50f69 = 0;
			entity setgoal(reacquirestep);
			entity.var_95d1c014 = undefined;
			return;
		}
		entity.var_6ca50f69++;
		if(entity.var_6ca50f69 > 4)
		{
			entity.var_6ca50f69 = undefined;
			if(isdefined(entity.enemy) && isarray(entity.enemy.var_f904e440))
			{
				arrayremovevalue(entity.enemy.var_f904e440, entity);
			}
			if(zm_utility::is_survival())
			{
				awareness::set_state(entity, #"wander");
			}
		}
	}
}

/*
	Name: function_c41c61e8
	Namespace: zm_behavior
	Checksum: 0xD1BD2B3E
	Offset: 0xD140
	Size: 0x1DC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_c41c61e8(step_size)
{
	dir = self.origin - self.enemy.origin;
	dir = vectornormalize((dir[0], dir[1], 0));
	start_point = getclosestpointonnavmesh(self.origin);
	if(isdefined(start_point))
	{
		point = checknavmeshdirection(start_point, dir, step_size, self getpathfindingradius() * 1.2);
		if(isdefined(point) && point != start_point && !self isposinclaimedlocation(point) && distancesquared(point, self.origin) > sqr(self.goalradius))
		{
			eye_offset = self geteyeapprox() - self.origin;
			/#
				recordline(point + eye_offset, self.enemy geteye(), (1, 0.5, 0), "", self);
			#/
			if(sighttracepassed(point + eye_offset, self.enemy geteye(), 0, self))
			{
				return point;
			}
		}
	}
}

/*
	Name: function_8158e9a0
	Namespace: zm_behavior
	Checksum: 0x20B718CA
	Offset: 0xD328
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function function_8158e9a0()
{
	if(namespace_81245006::hasarmor(self))
	{
		destructserverutils::function_8475c53a(self, #"helmet");
	}
}

/*
	Name: function_cea9ab47
	Namespace: zm_behavior
	Checksum: 0x3B1CB95B
	Offset: 0xD370
	Size: 0x264
	Parameters: 1
	Flags: Linked
*/
function function_cea9ab47(entity)
{
	namespace_81245006::initweakpoints(self);
	self callback::function_d8abfc3d(#"head_gibbed", &function_8158e9a0);
	if(!isdefined(entity.var_9fde8624))
	{
		return;
	}
	self.no_powerups = zm_utility::is_survival();
	switch(entity.var_9fde8624)
	{
		case "hash_622e7c9cc7c06c7":
		{
			entity attach("c_t9_zmb_zombie_medium_helmet");
			entity attach("c_t9_zmb_zombie_medium_armor");
			self function_2d4173a8(1);
			break;
		}
		case "hash_7a778318514578f7":
		{
			if(isdefined(level.var_eea9f85a))
			{
				entity attach(level.var_eea9f85a);
			}
			else
			{
				entity attach("c_t9_zmb_zombie_heavy_torso_armor");
			}
			if(isdefined(level.var_9e513533))
			{
				entity attach(level.var_9e513533);
			}
			else
			{
				entity attach("c_t9_zmb_zombie_heavy_helmet");
			}
			entity attach("c_t9_zmb_zombie_heavy_arm_armor_lt");
			entity attach("c_t9_zmb_zombie_heavy_arm_armor_rt");
			entity attach("c_t9_zmb_zombie_heavy_leg_armor_lt");
			entity attach("c_t9_zmb_zombie_heavy_leg_armor_rt");
			self function_2d4173a8(1);
			break;
		}
	}
	entity destructserverutils::togglespawngibs(entity, 1);
}

