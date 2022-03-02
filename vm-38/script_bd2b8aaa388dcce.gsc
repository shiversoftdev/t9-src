#using script_178024232e91b0a1;
#using script_1fd28440161f280e;
#using script_35598499769dbb3d;
#using script_3819e7a1427df6d2;
#using script_3aa0f32b70d4f7cb;
#using script_3f9e0dc8454d98e1;
#using script_489b835a247c990e;
#using script_4bf952f6ba31bb17;
#using script_4d85e8de54b02198;
#using script_522aeb6ae906391e;
#using script_59f07c660e6710a5;
#using script_6809bf766eba194a;
#using script_7b7ed6e4bc963a51;
#using script_caf007e2a98afa2;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace zombie;

/*
	Name: function_6b5a03b1
	Namespace: zombie
	Checksum: 0xAC1233B5
	Offset: 0x560
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_6b5a03b1()
{
	level notify(1145019156);
}

#namespace zombiebehavior;

/*
	Name: init
	Namespace: zombiebehavior
	Checksum: 0xB7D80B00
	Offset: 0x580
	Size: 0x1DC
	Parameters: 0
	Flags: AutoExec
*/
function autoexec init()
{
	initzombiebehaviorsandasm();
	spawner::add_archetype_spawn_function(#"zombie", &archetypezombieblackboardinit);
	spawner::add_archetype_spawn_function(#"zombie", &zombie_utility::zombiespawnsetup);
	spawner::add_archetype_spawn_function(#"zombie", &archetypezombiedeathoverrideinit);
	spawner::add_archetype_spawn_function(#"zombie", &function_eb55349f);
	spawner::function_89a2cd87(#"zombie", &function_9668f61f);
	/#
		spawner::add_archetype_spawn_function(#"zombie", &zombie_utility::function_27ba8249);
	#/
	clientfield::register("actor", "zombie", 1, 1, "int");
	clientfield::register("actor", "pustule_pulse_cf", 1, 2, "int");
	clientfield::register("actor", "stunned_head_fx", 1, 1, "int");
	zombieinterface::registerzombieinterfaceattributes();
}

/*
	Name: initzombiebehaviorsandasm
	Namespace: zombiebehavior
	Checksum: 0xDFB3EABA
	Offset: 0x768
	Size: 0x166C
	Parameters: 0
	Flags: Linked, Private
*/
function private initzombiebehaviorsandasm()
{
	/#
		assert(!isdefined(&function_c6787767) || isscriptfunctionptr(&function_c6787767));
	#/
	/#
		assert(!isdefined(&zombiemoveactionupdate) || isscriptfunctionptr(&zombiemoveactionupdate));
	#/
	/#
		assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction(#"zombiemoveaction", &function_c6787767, &zombiemoveactionupdate, undefined);
	/#
		assert(!isdefined(&function_9b6830c9) || isscriptfunctionptr(&function_9b6830c9));
	#/
	/#
		assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
	#/
	/#
		assert(!isdefined(&function_fbdc2cc4) || isscriptfunctionptr(&function_fbdc2cc4));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction(#"hash_6b3df7eab00d9e03", &function_9b6830c9, undefined, &function_fbdc2cc4);
	/#
		assert(isscriptfunctionptr(&zombietargetservice));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"zombietargetservice", &zombietargetservice);
	/#
		assert(isscriptfunctionptr(&zombiecrawlercollision));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"zombiecrawlercollisionservice", &zombiecrawlercollision);
	/#
		assert(isscriptfunctionptr(&zombietraversalservice));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"zombietraversalservice", &zombietraversalservice);
	/#
		assert(isscriptfunctionptr(&zombieisatattackobject));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"zombieisatattackobject", &zombieisatattackobject);
	/#
		assert(isscriptfunctionptr(&zombieshouldattackobject));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"zombieshouldattackobject", &zombieshouldattackobject);
	/#
		assert(isscriptfunctionptr(&zombieshouldmeleecondition));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"zombieshouldmelee", &zombieshouldmeleecondition);
	/#
		assert(isscriptfunctionptr(&zombieshouldjumpmeleecondition));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"zombieshouldjumpmelee", &zombieshouldjumpmeleecondition);
	/#
		assert(isscriptfunctionptr(&zombieshouldjumpunderwatermelee));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"zombieshouldjumpunderwatermelee", &zombieshouldjumpunderwatermelee);
	/#
		assert(isscriptfunctionptr(&zombiegiblegscondition));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"zombiegiblegscondition", &zombiegiblegscondition);
	/#
		assert(isscriptfunctionptr(&zombieshoulddisplaypain));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"zombieshoulddisplaypain", &zombieshoulddisplaypain);
	/#
		assert(isscriptfunctionptr(&iszombiewalking));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"iszombiewalking", &iszombiewalking);
	/#
		assert(isscriptfunctionptr(&function_8cd8819b));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_521713e6e7c89ff6", &function_8cd8819b);
	/#
		assert(isscriptfunctionptr(&function_ff3245d3));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_13ad697f9b7a1e13", &function_ff3245d3);
	/#
		assert(isscriptfunctionptr(&function_a716a3af));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_4ba5bc2aba9e7670", &function_a716a3af);
	/#
		assert(isscriptfunctionptr(&function_ce53cb2e));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_27d8ceabf090b1aa", &function_ce53cb2e);
	/#
		assert(isscriptfunctionptr(&function_30373e53));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_2d1a9c2809fc0d28", &function_30373e53);
	/#
		assert(isscriptfunctionptr(&function_1b8c9407));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_4136381d29600bc", &function_1b8c9407);
	/#
		assert(isscriptfunctionptr(&function_ecba5a44));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_1732367c7f780c76", &function_ecba5a44);
	/#
		assert(isscriptfunctionptr(&function_97aec83a));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_7e8590f0e7d32865", &function_97aec83a);
	/#
		assert(isscriptfunctionptr(&function_eb4b29ab));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_781acbf9eb317aa9", &function_eb4b29ab);
	/#
		assert(isscriptfunctionptr(&zombieshouldmeleesuicide));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"zombieshouldmeleesuicide", &zombieshouldmeleesuicide);
	/#
		assert(isscriptfunctionptr(&zombiemeleesuicidestart));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"zombiemeleesuicidestart", &zombiemeleesuicidestart);
	/#
		assert(isscriptfunctionptr(&zombiemeleesuicideupdate));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"zombiemeleesuicideupdate", &zombiemeleesuicideupdate);
	/#
		assert(isscriptfunctionptr(&zombiemeleesuicideterminate));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"zombiemeleesuicideterminate", &zombiemeleesuicideterminate);
	/#
		assert(isscriptfunctionptr(&zombieshouldjukecondition));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"zombieshouldjuke", &zombieshouldjukecondition);
	/#
		assert(isscriptfunctionptr(&zombiejukeactionstart));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"zombiejukeactionstart", &zombiejukeactionstart);
	/#
		assert(isscriptfunctionptr(&zombiejukeactionterminate));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"zombiejukeactionterminate", &zombiejukeactionterminate);
	/#
		assert(isscriptfunctionptr(&zombiedeathaction));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"zombiedeathaction", &zombiedeathaction);
	/#
		assert(isscriptfunctionptr(&zombiejuke));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"zombiejukeservice", &zombiejuke);
	/#
		assert(isscriptfunctionptr(&zombiestumble));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"zombiestumbleservice", &zombiestumble);
	/#
		assert(isscriptfunctionptr(&zombieshouldstumblecondition));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"zombiestumblecondition", &zombieshouldstumblecondition);
	/#
		assert(isscriptfunctionptr(&zombiestumbleactionstart));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"zombiestumbleactionstart", &zombiestumbleactionstart);
	/#
		assert(isscriptfunctionptr(&zombieattackobjectstart));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"zombieattackobjectstart", &zombieattackobjectstart);
	/#
		assert(isscriptfunctionptr(&zombieattackobjectterminate));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"zombieattackobjectterminate", &zombieattackobjectterminate);
	/#
		assert(isscriptfunctionptr(&waskilledbyinterdimensionalguncondition));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"waskilledbyinterdimensionalgun", &waskilledbyinterdimensionalguncondition);
	/#
		assert(isscriptfunctionptr(&wascrushedbyinterdimensionalgunblackholecondition));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"wascrushedbyinterdimensionalgunblackhole", &wascrushedbyinterdimensionalgunblackholecondition);
	/#
		assert(isscriptfunctionptr(&zombieidgundeathupdate));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"zombieidgundeathupdate", &zombieidgundeathupdate);
	/#
		assert(isscriptfunctionptr(&zombieidgundeathupdate));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"zombievortexpullupdate", &zombieidgundeathupdate);
	/#
		assert(isscriptfunctionptr(&zombiehaslegs));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"zombiehaslegs", &zombiehaslegs);
	/#
		assert(isscriptfunctionptr(&zombieshouldproceduraltraverse));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"zombieshouldproceduraltraverse", &zombieshouldproceduraltraverse);
	/#
		assert(isscriptfunctionptr(&function_33ab7991));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_3940e25f9e65e404", &function_33ab7991);
	/#
		assert(isscriptfunctionptr(&function_f937377));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_31cc70f275702cf6", &function_f937377);
	/#
		assert(isscriptfunctionptr(&function_a82068d7));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_7a6e9a34d9a8290", &function_a82068d7);
	/#
		assert(isscriptfunctionptr(&function_626edd6b));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"zombiemoveactionupdate", &function_626edd6b);
	animationstatenetwork::registernotetrackhandlerfunction("zombie_melee", &zombienotetrackmeleefire);
	animationstatenetwork::registernotetrackhandlerfunction("crushed", &zombienotetrackcrushfire);
	animationstatenetwork::registeranimationmocomp("mocomp_death_idgun@zombie", &zombieidgundeathmocompstart, undefined, undefined);
	animationstatenetwork::registeranimationmocomp("mocomp_vortex_pull@zombie", &zombieidgundeathmocompstart, undefined, undefined);
	animationstatenetwork::registeranimationmocomp("mocomp_death_idgun_hole@zombie", &zombieidgunholedeathmocompstart, undefined, &zombieidgunholedeathmocompterminate);
	animationstatenetwork::registeranimationmocomp("mocomp_turn@zombie", &zombieturnmocompstart, &zombieturnmocompupdate, &zombieturnmocompterminate);
	animationstatenetwork::registeranimationmocomp("mocomp_melee_jump@zombie", &zombiemeleejumpmocompstart, &zombiemeleejumpmocompupdate, &zombiemeleejumpmocompterminate);
	animationstatenetwork::registeranimationmocomp("mocomp_zombie_idle@zombie", &zombiezombieidlemocompstart, undefined, undefined);
	animationstatenetwork::registeranimationmocomp("mocomp_attack_object@zombie", &zombieattackobjectmocompstart, &zombieattackobjectmocompupdate, undefined);
	animationstatenetwork::registeranimationmocomp("mocomp_teleport_traversal@zombie", &function_cbbae5cb, undefined, undefined);
	animationstatenetwork::registeranimationmocomp("mocomp_zombie_melee@zombie", &function_54d75299, &function_d1474842, &function_b6d297bb);
}

/*
	Name: archetypezombieblackboardinit
	Namespace: zombiebehavior
	Checksum: 0x58C46308
	Offset: 0x1DE0
	Size: 0x4A
	Parameters: 0
	Flags: Linked
*/
function archetypezombieblackboardinit()
{
	blackboard::createblackboardforentity(self);
	ai::createinterfaceforentity(self);
	self.___archetypeonanimscriptedcallback = &archetypezombieonanimscriptedcallback;
}

/*
	Name: archetypezombieonanimscriptedcallback
	Namespace: zombiebehavior
	Checksum: 0x3D1894AA
	Offset: 0x1E38
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private archetypezombieonanimscriptedcallback(entity)
{
	entity.__blackboard = undefined;
	entity archetypezombieblackboardinit();
}

/*
	Name: function_eb55349f
	Namespace: zombiebehavior
	Checksum: 0xB9A3650C
	Offset: 0x1E70
	Size: 0x1B4
	Parameters: 0
	Flags: Linked
*/
function function_eb55349f()
{
	var_1690db4a = [4:#"hash_502c60e0a94ba04b", 3:#"hash_ef041655f01ad34", 2:#"hash_50fdc172aee097e6", 1:#"hash_16837b6c9b7a1881", 0:#"c_t9_zmb_ndu_zombie_shirtless2"];
	if(self.model === #"c_t9_zmb_zombie_light_body2" || (isdefined(self.model) && isinarray(var_1690db4a, self.model)))
	{
		self clientfield::set("pustule_pulse_cf", 1);
		self callback::function_d8abfc3d(#"on_ai_killed", &function_5b8201e0);
	}
	self callback::function_d8abfc3d(#"on_actor_damage", &function_f771a3f8);
	self callback::function_d8abfc3d(#"hash_7f690ab86160d4f6", &function_5d873c56);
	self callback::function_d8abfc3d(#"hash_40f6b51ae82126a4", &function_d8235fb0);
}

/*
	Name: function_9668f61f
	Namespace: zombiebehavior
	Checksum: 0x5D421091
	Offset: 0x2030
	Size: 0x62
	Parameters: 0
	Flags: Linked
*/
function function_9668f61f()
{
	self.stumble = 0;
	self.var_b1c7a59d = gettime();
	self.var_eabe8c08 = gettime();
	self.var_4db55459 = 0;
	self.var_8198a38c = function_4a33fa36();
	self.var_b91eb4e5 = function_9ec512e6();
}

/*
	Name: function_4a33fa36
	Namespace: zombiebehavior
	Checksum: 0x12C04D90
	Offset: 0x20A0
	Size: 0x2A
	Parameters: 0
	Flags: Linked
*/
function function_4a33fa36()
{
	if(isdefined(self.health))
	{
		return 0.15 * self.health;
	}
	return 30;
}

/*
	Name: function_9ec512e6
	Namespace: zombiebehavior
	Checksum: 0x9349AA29
	Offset: 0x20D8
	Size: 0x2A
	Parameters: 0
	Flags: Linked
*/
function function_9ec512e6()
{
	if(isdefined(self.health))
	{
		return 0.075 * self.health;
	}
	return 15;
}

/*
	Name: function_5b8201e0
	Namespace: zombiebehavior
	Checksum: 0xDF4C3EE7
	Offset: 0x2110
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function function_5b8201e0(params)
{
	self clientfield::set("pustule_pulse_cf", 0);
}

/*
	Name: function_5d873c56
	Namespace: zombiebehavior
	Checksum: 0xE1A97E2
	Offset: 0x2148
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function function_5d873c56(params)
{
	self clientfield::set("pustule_pulse_cf", 2);
}

/*
	Name: function_d8235fb0
	Namespace: zombiebehavior
	Checksum: 0x794CE80D
	Offset: 0x2180
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function function_d8235fb0(params)
{
	self clientfield::set("pustule_pulse_cf", 1);
}

/*
	Name: function_f771a3f8
	Namespace: zombiebehavior
	Checksum: 0x13AD11A5
	Offset: 0x21B8
	Size: 0x2EC
	Parameters: 1
	Flags: Linked
*/
function function_f771a3f8(params)
{
	switch(params.smeansofdeath)
	{
		case "mod_explosive":
		case "mod_grenade":
		case "mod_projectile":
		case "mod_grenade_splash":
		case "mod_projectile_splash":
		{
			if(!is_true(params.weapon.dostun) && function_84b43711(params.weapon))
			{
				self zombie_utility::setup_zombie_knockdown(params.vdamageorigin);
			}
			break;
		}
	}
	if(isdefined(self.var_b1c7a59d) && !is_true(self.missinglegs))
	{
		if(self.var_b1c7a59d < gettime())
		{
			self.var_b1c7a59d = gettime() + 5000;
			self.var_4db55459 = 0;
			self.stumble = 0;
		}
		self.var_4db55459 = self.var_4db55459 + params.idamage;
		if(isdefined(params.shitloc))
		{
			if(isinarray(array("helmet", "head", "neck"), params.shitloc))
			{
				function_da30b556(self);
			}
			else
			{
				if(isinarray(array("right_leg_upper", "left_leg_upper", "right_leg_lower", "left_leg_lower", "right_foot", "left_foot"), params.shitloc))
				{
					if(self.var_4db55459 >= self.var_b91eb4e5 && self.var_eabe8c08 < gettime())
					{
						function_da30b556(self);
					}
				}
				else if(self.var_4db55459 >= self.var_8198a38c && self.var_eabe8c08 < gettime())
				{
					function_da30b556(self);
				}
			}
		}
		else if(self.var_4db55459 >= self.var_8198a38c && self.var_eabe8c08 < gettime())
		{
			function_da30b556(self);
		}
	}
}

/*
	Name: function_84b43711
	Namespace: zombiebehavior
	Checksum: 0xACEA1247
	Offset: 0x24B0
	Size: 0x52
	Parameters: 1
	Flags: Linked
*/
function function_84b43711(weapon)
{
	if(weapon.name === #"ray_gun" || weapon.name === #"ray_gun_upgraded")
	{
		return false;
	}
	return true;
}

/*
	Name: function_da30b556
	Namespace: zombiebehavior
	Checksum: 0x5190274D
	Offset: 0x2510
	Size: 0x46
	Parameters: 1
	Flags: Linked
*/
function function_da30b556(entity)
{
	entity.stumble = 1;
	entity.var_b1c7a59d = gettime() + 5000;
	entity.var_eabe8c08 = gettime() + 1000;
	entity.var_4db55459 = 0;
}

/*
	Name: function_ce53cb2e
	Namespace: zombiebehavior
	Checksum: 0xA0341479
	Offset: 0x2560
	Size: 0x4C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_ce53cb2e(entity)
{
	if(entity.stumble === 1 && is_false(entity.var_67f98db0))
	{
		return true;
	}
	return false;
}

/*
	Name: function_30373e53
	Namespace: zombiebehavior
	Checksum: 0x7E702830
	Offset: 0x25B8
	Size: 0x42
	Parameters: 1
	Flags: Linked, Private
*/
function private function_30373e53(entity)
{
	entity.stumble = 0;
	entity.var_b1c7a59d = gettime() + 5000;
	entity.var_eabe8c08 = gettime() + 1000;
	entity.var_4db55459 = 0;
}

/*
	Name: bb_getvarianttype
	Namespace: zombiebehavior
	Checksum: 0xA3DF8278
	Offset: 0x2608
	Size: 0x1A
	Parameters: 0
	Flags: Linked
*/
function bb_getvarianttype()
{
	if(isdefined(self.variant_type))
	{
		return self.variant_type;
	}
	return 0;
}

/*
	Name: bb_getlowgravityvariant
	Namespace: zombiebehavior
	Checksum: 0x80616C31
	Offset: 0x2630
	Size: 0x1A
	Parameters: 0
	Flags: Linked
*/
function bb_getlowgravityvariant()
{
	if(isdefined(self.low_gravity_variant))
	{
		return self.low_gravity_variant;
	}
	return 0;
}

/*
	Name: function_a95e9277
	Namespace: zombiebehavior
	Checksum: 0xC6E3EE7A
	Offset: 0x2658
	Size: 0x5A
	Parameters: 0
	Flags: Linked, Private
*/
function private function_a95e9277()
{
	/#
		assert(self.archetype == #"zombie");
	#/
	speed = self function_28e7d252();
	return speed;
}

/*
	Name: iszombiewalking
	Namespace: zombiebehavior
	Checksum: 0xD56E935C
	Offset: 0x26C0
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function iszombiewalking(entity)
{
	return !is_true(entity.missinglegs);
}

/*
	Name: zombieshoulddisplaypain
	Namespace: zombiebehavior
	Checksum: 0x5AA18B21
	Offset: 0x26F0
	Size: 0x84
	Parameters: 1
	Flags: Linked
*/
function zombieshoulddisplaypain(entity)
{
	if(is_true(entity.suicidaldeath))
	{
		return 0;
	}
	if(!hasasm(entity) || entity function_ebbebf56() < 1)
	{
		return 0;
	}
	return !is_true(entity.missinglegs);
}

/*
	Name: zombieshouldjukecondition
	Namespace: zombiebehavior
	Checksum: 0x1FBF4475
	Offset: 0x2780
	Size: 0x58
	Parameters: 1
	Flags: Linked
*/
function zombieshouldjukecondition(entity)
{
	if(isdefined(entity.juke) && (entity.juke == "left" || entity.juke == "right"))
	{
		return true;
	}
	return false;
}

/*
	Name: zombieshouldstumblecondition
	Namespace: zombiebehavior
	Checksum: 0x79883071
	Offset: 0x27E0
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function zombieshouldstumblecondition(entity)
{
	if(isdefined(entity.stumble))
	{
		return true;
	}
	return false;
}

/*
	Name: zombiejukeactionstart
	Namespace: zombiebehavior
	Checksum: 0xDFEA01A4
	Offset: 0x2810
	Size: 0xAA
	Parameters: 1
	Flags: Linked, Private
*/
function private zombiejukeactionstart(entity)
{
	entity setblackboardattribute("_juke_direction", entity.juke);
	if(isdefined(entity.jukedistance))
	{
		entity setblackboardattribute("_juke_distance", entity.jukedistance);
	}
	else
	{
		entity setblackboardattribute("_juke_distance", "short");
	}
	entity.jukedistance = undefined;
	entity.juke = undefined;
}

/*
	Name: zombiejukeactionterminate
	Namespace: zombiebehavior
	Checksum: 0xF8C25081
	Offset: 0x28C8
	Size: 0x24
	Parameters: 1
	Flags: Linked, Private
*/
function private zombiejukeactionterminate(entity)
{
	entity clearpath();
}

/*
	Name: zombiestumbleactionstart
	Namespace: zombiebehavior
	Checksum: 0x5C02B93F
	Offset: 0x28F8
	Size: 0x16
	Parameters: 1
	Flags: Linked, Private
*/
function private zombiestumbleactionstart(entity)
{
	entity.stumble = undefined;
}

/*
	Name: zombieattackobjectstart
	Namespace: zombiebehavior
	Checksum: 0xA0ACF76F
	Offset: 0x2918
	Size: 0x1A
	Parameters: 1
	Flags: Linked, Private
*/
function private zombieattackobjectstart(entity)
{
	entity.is_inert = 1;
}

/*
	Name: zombieattackobjectterminate
	Namespace: zombiebehavior
	Checksum: 0x612BF449
	Offset: 0x2940
	Size: 0x16
	Parameters: 1
	Flags: Linked, Private
*/
function private zombieattackobjectterminate(entity)
{
	entity.is_inert = 0;
}

/*
	Name: zombiegiblegscondition
	Namespace: zombiebehavior
	Checksum: 0x246BB0F3
	Offset: 0x2960
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function zombiegiblegscondition(entity)
{
	return gibserverutils::isgibbed(entity, 256) || gibserverutils::isgibbed(entity, 128);
}

/*
	Name: function_f937377
	Namespace: zombiebehavior
	Checksum: 0xCEABCF5C
	Offset: 0x29B0
	Size: 0x1E
	Parameters: 1
	Flags: Linked
*/
function function_f937377(entity)
{
	entity.ai.var_80045105 = gettime();
}

/*
	Name: zombienotetrackmeleefire
	Namespace: zombiebehavior
	Checksum: 0xF7CA9B1F
	Offset: 0x29D8
	Size: 0x564
	Parameters: 1
	Flags: Linked
*/
function zombienotetrackmeleefire(entity)
{
	if(is_true(entity.marked_for_death))
	{
		return;
	}
	entity.var_88bd96a9 = gettime() + (getdvarfloat(#"hash_6182e0a57e0b549f", 1) * 1000);
	if(is_true(entity.aat_turned))
	{
		if(isdefined(entity.enemy) && isalive(entity.enemy) && !isplayer(entity.enemy))
		{
			if(isdefined(entity.var_16d0eb06) && is_true(entity.enemy.var_6d23c054))
			{
				if(isdefined(entity.var_443d78cc))
				{
					e_attacker = entity.var_443d78cc;
				}
				else
				{
					e_attacker = entity;
				}
				entity.enemy dodamage(entity.var_16d0eb06, entity.origin, e_attacker, entity);
				if(!isalive(entity.enemy))
				{
					gibserverutils::gibhead(entity.enemy, 0);
					entity.enemy zombie_utility::gib_random_parts();
					entity.enemy.var_7105092c = 1;
					entity.n_aat_turned_zombie_kills++;
				}
			}
			else
			{
				if(is_true(entity.enemy.var_6d23c054) && is_true(entity.enemy.allowdeath))
				{
					if(isdefined(entity.var_443d78cc))
					{
						e_attacker = entity.var_443d78cc;
					}
					else
					{
						e_attacker = entity;
					}
					gibserverutils::gibhead(entity.enemy, 0);
					entity.enemy zombie_utility::gib_random_parts();
					entity.enemy.var_7105092c = 1;
					entity.enemy kill(entity.enemy.origin, e_attacker, entity, undefined, undefined, 1);
					entity.n_aat_turned_zombie_kills++;
				}
				else if(is_true(entity.enemy.canbetargetedbyturnedzombies))
				{
					entity melee();
				}
			}
			entity callback::callback(#"hash_11aa32ad6d527054");
		}
	}
	else
	{
		if(isdefined(entity.enemy) && is_true(entity.enemy.ignoreme))
		{
			return;
		}
		if(isdefined(entity.ai.var_80045105))
		{
			/#
				record3dtext("" + (gettime() - entity.ai.var_80045105), self.origin, (1, 0, 0), "", entity);
			#/
		}
		if(isdefined(entity.var_847ab632))
		{
			entity [[entity.var_847ab632]]();
		}
		else
		{
			if(isdefined(level.var_847ab632))
			{
				entity [[level.var_847ab632]]();
			}
			else
			{
				entity melee();
			}
		}
		/#
			record3dtext("", entity.origin, (1, 0, 0), "", entity);
			if(isdefined(entity.enemy))
			{
				eyepos = entity geteye();
				record3dtext("" + distance2d(eyepos, entity.enemy.origin), entity.origin, (1, 0, 0), "", entity);
			}
		#/
		if(zombieshouldattackobject(entity))
		{
			if(isdefined(level.attackablecallback))
			{
				entity.attackable [[level.attackablecallback]](entity);
			}
		}
		entity callback::callback(#"hash_11aa32ad6d527054");
	}
}

/*
	Name: zombienotetrackcrushfire
	Namespace: zombiebehavior
	Checksum: 0x40F6190B
	Offset: 0x2F48
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function zombienotetrackcrushfire(entity)
{
	entity delete();
}

/*
	Name: zombietargetservice
	Namespace: zombiebehavior
	Checksum: 0x16E7035C
	Offset: 0x2F78
	Size: 0x250
	Parameters: 1
	Flags: Linked
*/
function zombietargetservice(entity)
{
	if(isdefined(entity.enablepushtime))
	{
		if(gettime() >= entity.enablepushtime)
		{
			entity collidewithactors(1);
			entity.enablepushtime = undefined;
		}
	}
	if(is_true(entity.disabletargetservice))
	{
		return false;
	}
	if(is_true(entity.ignoreall))
	{
		return false;
	}
	specifictarget = undefined;
	if(isdefined(level.zombielevelspecifictargetcallback))
	{
		specifictarget = [[level.zombielevelspecifictargetcallback]]();
	}
	if(isdefined(specifictarget))
	{
		entity setgoal(specifictarget.origin);
	}
	else
	{
		player = zombie_utility::get_closest_valid_player(self.origin, self.ignore_player);
		if(!isdefined(player))
		{
			if(isdefined(self.ignore_player))
			{
				if(isdefined(level._should_skip_ignore_player_logic) && [[level._should_skip_ignore_player_logic]]())
				{
					return false;
				}
				self.ignore_player = [];
			}
			self setgoal(self.origin);
			return false;
		}
		if(isdefined(player.last_valid_position))
		{
			if(!is_true(self.zombie_do_not_update_goal))
			{
				if(is_true(level.zombie_use_zigzag_path))
				{
					entity zombieupdatezigzaggoal();
				}
				else
				{
					entity setgoal(player.last_valid_position);
				}
			}
			return true;
		}
		if(!is_true(self.zombie_do_not_update_goal))
		{
			entity setgoal(entity.origin);
		}
		return false;
	}
}

/*
	Name: zombieupdatezigzaggoal
	Namespace: zombiebehavior
	Checksum: 0x63D36242
	Offset: 0x31D0
	Size: 0x5BC
	Parameters: 0
	Flags: Linked
*/
function zombieupdatezigzaggoal()
{
	aiprofile_beginentry("zombieUpdateZigZagGoal");
	shouldrepath = 0;
	if(!shouldrepath && isdefined(self.favoriteenemy))
	{
		if(!isdefined(self.nextgoalupdate) || self.nextgoalupdate <= gettime())
		{
			shouldrepath = 1;
		}
		else
		{
			if(distancesquared(self.origin, self.favoriteenemy.origin) <= sqr(250))
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
		goalpos = self.favoriteenemy.origin;
		if(isdefined(self.favoriteenemy.last_valid_position))
		{
			goalpos = self.favoriteenemy.last_valid_position;
		}
		self setgoal(goalpos);
		if(distancesquared(self.origin, goalpos) > sqr(250))
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
			if(isdefined(level._zombiezigzagdistancemin) && isdefined(level._zombiezigzagdistancemax))
			{
				min = level._zombiezigzagdistancemin;
				max = level._zombiezigzagdistancemax;
			}
			else
			{
				min = 240;
				max = 600;
			}
			deviationdistance = randomintrange(min, max);
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
					innerzigzagradius = 0;
					outerzigzagradius = 96;
					queryresult = positionquery_source_navigation(seedposition, innerzigzagradius, outerzigzagradius, 0.5 * 72, 16, self, 16);
					positionquery_filter_inclaimedlocation(queryresult, self);
					if(queryresult.data.size > 0)
					{
						point = queryresult.data[randomint(queryresult.data.size)];
						self setgoal(point.origin);
					}
					break;
				}
				segmentlength = segmentlength + currentseglength;
			}
		}
		if(isdefined(level._zombiezigzagtimemin) && isdefined(level._zombiezigzagtimemax))
		{
			mintime = level._zombiezigzagtimemin;
			maxtime = level._zombiezigzagtimemax;
		}
		else
		{
			mintime = 2500;
			maxtime = 3500;
		}
		self.nextgoalupdate = gettime() + randomintrange(mintime, maxtime);
	}
	aiprofile_endentry();
}

/*
	Name: zombiecrawlercollision
	Namespace: zombiebehavior
	Checksum: 0x2ADB6996
	Offset: 0x3798
	Size: 0x1E6
	Parameters: 1
	Flags: Linked
*/
function zombiecrawlercollision(entity)
{
	if(!is_true(entity.missinglegs) && !is_true(entity.knockdown))
	{
		return false;
	}
	if(isdefined(entity.dontpushtime))
	{
		if(gettime() < entity.dontpushtime)
		{
			return true;
		}
	}
	if(!isdefined(level.zombie_team))
	{
		return false;
	}
	zombies = getaiteamarray(level.zombie_team);
	foreach(zombie in zombies)
	{
		if(zombie == entity)
		{
			continue;
		}
		if(is_true(zombie.missinglegs) || is_true(zombie.knockdown))
		{
			continue;
		}
		dist_sq = distancesquared(entity.origin, zombie.origin);
		if(dist_sq < 14400)
		{
			entity collidewithactors(0);
			entity.dontpushtime = gettime() + 2000;
			return true;
		}
	}
	entity collidewithactors(1);
	return false;
}

/*
	Name: zombietraversalservice
	Namespace: zombiebehavior
	Checksum: 0x66D779
	Offset: 0x3988
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function zombietraversalservice(entity)
{
	if(isdefined(entity.traversestartnode))
	{
		entity collidewithactors(0);
		return true;
	}
	return false;
}

/*
	Name: zombieisatattackobject
	Namespace: zombiebehavior
	Checksum: 0xD14A2A11
	Offset: 0x39D0
	Size: 0x17E
	Parameters: 1
	Flags: Linked
*/
function zombieisatattackobject(entity)
{
	if(is_true(entity.missinglegs))
	{
		return false;
	}
	if(isdefined(entity.enemy_override))
	{
		return false;
	}
	if(isdefined(entity.favoriteenemy) && is_true(entity.favoriteenemy.b_is_designated_target))
	{
		return false;
	}
	if(is_true(entity.aat_turned))
	{
		return false;
	}
	if(isdefined(entity.attackable) && is_true(entity.attackable.is_active))
	{
		if(!isdefined(entity.attackable_slot))
		{
			return false;
		}
		dist = distance2dsquared(entity.origin, entity.attackable_slot.origin);
		if(dist < 256)
		{
			height_offset = abs(entity.origin[2] - entity.attackable_slot.origin[2]);
			if(height_offset < 32)
			{
				entity.is_at_attackable = 1;
				return true;
			}
		}
	}
	return false;
}

/*
	Name: zombieshouldattackobject
	Namespace: zombiebehavior
	Checksum: 0x2F6EF446
	Offset: 0x3B58
	Size: 0xEE
	Parameters: 1
	Flags: Linked
*/
function zombieshouldattackobject(entity)
{
	if(is_true(entity.missinglegs))
	{
		return false;
	}
	if(isdefined(entity.enemy_override))
	{
		return false;
	}
	if(isdefined(entity.favoriteenemy) && is_true(entity.favoriteenemy.b_is_designated_target))
	{
		return false;
	}
	if(is_true(entity.aat_turned))
	{
		return false;
	}
	if(isdefined(entity.attackable) && is_true(entity.attackable.is_active))
	{
		if(is_true(entity.is_at_attackable))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_997f1224
	Namespace: zombiebehavior
	Checksum: 0x75BFDC8D
	Offset: 0x3C50
	Size: 0x148
	Parameters: 1
	Flags: Linked
*/
function function_997f1224(entity)
{
	if(entity.archetype == #"zombie" && !isdefined(entity.var_9fde8624) && !is_true(self.missinglegs))
	{
		if(entity.zombie_move_speed == "walk")
		{
			return sqr(100);
		}
		if(entity.zombie_move_speed == "run")
		{
			return sqr(120);
		}
		return sqr(90);
	}
	if(isdefined(entity.meleeweapon) && entity.meleeweapon !== level.weaponnone)
	{
		meleedistsq = entity.meleeweapon.var_d3cafde6 * entity.meleeweapon.var_d3cafde6;
	}
	if(!isdefined(meleedistsq))
	{
		return sqr(100);
	}
	return meleedistsq;
}

/*
	Name: zombieshouldmeleecondition
	Namespace: zombiebehavior
	Checksum: 0x1D759CC5
	Offset: 0x3DA0
	Size: 0x366
	Parameters: 1
	Flags: Linked
*/
function zombieshouldmeleecondition(entity)
{
	if(isdefined(entity.enemy_override))
	{
		return false;
	}
	if(!isdefined(entity.enemy))
	{
		return false;
	}
	if(is_true(entity.marked_for_death))
	{
		return false;
	}
	if(is_true(entity.ignoremelee))
	{
		return false;
	}
	if(abs(entity.origin[2] - entity.enemy.origin[2]) > (isdefined(entity.var_737e8510) ? entity.var_737e8510 : 64))
	{
		return false;
	}
	meleedistsq = function_997f1224(entity);
	test_origin = entity.enemy.origin;
	if(isdefined(level.var_ee27c905) && isplayer(entity.enemy) && entity.enemy isinvehicle())
	{
		var_c6bad08 = entity.enemy getvehicleoccupied();
		test_origin = [[level.var_ee27c905]](var_c6bad08, entity.enemy);
		if(!isdefined(test_origin))
		{
			test_origin = entity.enemy.origin;
		}
	}
	if(distancesquared(entity.origin, test_origin) > meleedistsq)
	{
		return false;
	}
	yawtoenemy = angleclamp180(entity.angles[1] - (vectortoangles(entity.enemy.origin - entity.origin)[1]));
	if(abs(yawtoenemy) > (isdefined(entity.var_1c0eb62a) ? entity.var_1c0eb62a : 60))
	{
		return false;
	}
	if(!entity cansee(entity.enemy))
	{
		return false;
	}
	if(distancesquared(entity.origin, entity.enemy.origin) < sqr(40))
	{
		return true;
	}
	if(!tracepassedonnavmesh(entity.origin, (isdefined(entity.enemy.last_valid_position) ? entity.enemy.last_valid_position : entity.enemy.origin), entity.enemy getpathfindingradius()))
	{
		return false;
	}
	return true;
}

/*
	Name: function_1b8c9407
	Namespace: zombiebehavior
	Checksum: 0x5CB8E630
	Offset: 0x4110
	Size: 0xC2
	Parameters: 1
	Flags: Linked
*/
function function_1b8c9407(entity)
{
	/#
		if(getdvarint(#"hash_1a5939d8c37a2e07", 0))
		{
			return false;
		}
	#/
	var_9fce1294 = blackboard::getblackboardevents("zombie_full_pain");
	if(isdefined(var_9fce1294) && var_9fce1294.size)
	{
		return false;
	}
	if(is_true(self.var_67f98db0))
	{
		return false;
	}
	if(isdefined(level.var_eeb66e64) && ![[level.var_eeb66e64]](entity))
	{
		return false;
	}
	return true;
}

/*
	Name: function_ecba5a44
	Namespace: zombiebehavior
	Checksum: 0xA9BA76A0
	Offset: 0x41E0
	Size: 0x6C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_ecba5a44(entity)
{
	var_1e466fbb = spawnstruct();
	var_1e466fbb.enemy = entity.enemy;
	blackboard::addblackboardevent("zombie_full_pain", var_1e466fbb, randomintrange(6000, 9000));
}

/*
	Name: function_97aec83a
	Namespace: zombiebehavior
	Checksum: 0x7C445D88
	Offset: 0x4258
	Size: 0x3E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_97aec83a(entity)
{
	/#
		if(getdvarint(#"hash_30c850c9bcd873bb", 0))
		{
			return true;
		}
	#/
	return false;
}

/*
	Name: function_eb4b29ab
	Namespace: zombiebehavior
	Checksum: 0x976CE906
	Offset: 0x42A0
	Size: 0x3E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_eb4b29ab(entity)
{
	/#
		if(getdvarint(#"hash_174d05033246950b", 1))
		{
			return true;
		}
	#/
	return false;
}

/*
	Name: function_8cd8819b
	Namespace: zombiebehavior
	Checksum: 0xDC85F17B
	Offset: 0x42E8
	Size: 0x22
	Parameters: 1
	Flags: Linked, Private
*/
function private function_8cd8819b(entity)
{
	return is_true(entity.low_gravity);
}

/*
	Name: function_ff3245d3
	Namespace: zombiebehavior
	Checksum: 0x66AE8543
	Offset: 0x4318
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_ff3245d3(entity)
{
	return !isdefined(entity.var_40f848c3) || entity.var_40f848c3 < gettime();
}

/*
	Name: function_a716a3af
	Namespace: zombiebehavior
	Checksum: 0x8B67598D
	Offset: 0x4350
	Size: 0x22
	Parameters: 1
	Flags: Linked, Private
*/
function private function_a716a3af(entity)
{
	entity.var_40f848c3 = gettime() + 1000;
	return true;
}

/*
	Name: zombieshouldjumpmeleecondition
	Namespace: zombiebehavior
	Checksum: 0xB25312C7
	Offset: 0x4380
	Size: 0x358
	Parameters: 1
	Flags: Linked
*/
function zombieshouldjumpmeleecondition(entity)
{
	if(!is_true(entity.low_gravity))
	{
		return false;
	}
	if(isdefined(entity.enemy_override))
	{
		return false;
	}
	if(!isdefined(entity.enemy))
	{
		return false;
	}
	if(isdefined(entity.marked_for_death))
	{
		return false;
	}
	if(is_true(entity.ignoremelee))
	{
		return false;
	}
	if(entity.enemy isonground())
	{
		if(isplayer(entity.enemy) && entity.enemy isplayerswimming())
		{
			waterheight = getwaterheight(entity.enemy.origin);
			if(waterheight - entity.enemy.origin[2] < 24)
			{
				return false;
			}
		}
		else
		{
			return false;
		}
	}
	jumpchance = getdvarfloat(#"zmmeleejumpchance", 0.5);
	if((entity getentitynumber() % 10) / 10 > jumpchance)
	{
		return false;
	}
	predictedposition = entity.enemy.origin + ((entity.enemy getvelocity() * (float(function_60d95f53()) / 1000)) * 2);
	jumpdistancesq = pow(getdvarint(#"zmmeleejumpdistance", 180), 2);
	if(distance2dsquared(entity.origin, predictedposition) > jumpdistancesq)
	{
		return false;
	}
	yawtoenemy = angleclamp180(entity.angles[1] - (vectortoangles(entity.enemy.origin - entity.origin)[1]));
	if(abs(yawtoenemy) > 60)
	{
		return false;
	}
	heighttoenemy = entity.enemy.origin[2] - entity.origin[2];
	if(heighttoenemy <= getdvarint(#"zmmeleejumpheightdifference", 60))
	{
		return false;
	}
	return true;
}

/*
	Name: zombieshouldjumpunderwatermelee
	Namespace: zombiebehavior
	Checksum: 0x5BF0C1F6
	Offset: 0x46E0
	Size: 0x230
	Parameters: 1
	Flags: Linked
*/
function zombieshouldjumpunderwatermelee(entity)
{
	if(isdefined(entity.enemy_override))
	{
		return false;
	}
	if(is_true(entity.ignoreall))
	{
		return false;
	}
	if(!isdefined(entity.enemy))
	{
		return false;
	}
	if(isdefined(entity.marked_for_death))
	{
		return false;
	}
	if(is_true(entity.ignoremelee))
	{
		return false;
	}
	if(entity.enemy isonground())
	{
		return false;
	}
	if(entity depthinwater() < 48)
	{
		return false;
	}
	jumpdistancesq = pow(getdvarint(#"zmmeleewaterjumpdistance", 64), 2);
	if(distance2dsquared(entity.origin, entity.enemy.origin) > jumpdistancesq)
	{
		return false;
	}
	yawtoenemy = angleclamp180(entity.angles[1] - (vectortoangles(entity.enemy.origin - entity.origin)[1]));
	if(abs(yawtoenemy) > 60)
	{
		return false;
	}
	heighttoenemy = entity.enemy.origin[2] - entity.origin[2];
	if(heighttoenemy <= getdvarint(#"zmmeleejumpunderwaterheightdifference", 48))
	{
		return false;
	}
	return true;
}

/*
	Name: zombiestumble
	Namespace: zombiebehavior
	Checksum: 0x17E8DFB
	Offset: 0x4918
	Size: 0x17A
	Parameters: 1
	Flags: Linked
*/
function zombiestumble(entity)
{
	if(is_true(entity.missinglegs))
	{
		return false;
	}
	if(!is_true(entity.canstumble))
	{
		return false;
	}
	if(!isdefined(entity.zombie_move_speed) || entity.zombie_move_speed != "sprint")
	{
		return false;
	}
	if(isdefined(entity.stumble))
	{
		return false;
	}
	if(!isdefined(entity.next_stumble_time))
	{
		entity.next_stumble_time = gettime() + randomintrange(9000, 12000);
	}
	if(gettime() > entity.next_stumble_time)
	{
		if(randomint(100) < 5)
		{
			closestplayer = arraygetclosest(entity.origin, level.players);
			if(distancesquared(closestplayer.origin, entity.origin) > 50000)
			{
				if(isdefined(entity.next_juke_time))
				{
					entity.next_juke_time = undefined;
				}
				entity.next_stumble_time = undefined;
				entity.stumble = 1;
				return true;
			}
		}
	}
	return false;
}

/*
	Name: zombiejuke
	Namespace: zombiebehavior
	Checksum: 0x8AE7F88C
	Offset: 0x4AA0
	Size: 0x392
	Parameters: 1
	Flags: Linked
*/
function zombiejuke(entity)
{
	if(!entity ai::has_behavior_attribute("can_juke"))
	{
		return false;
	}
	if(!entity ai::get_behavior_attribute("can_juke"))
	{
		return false;
	}
	if(is_true(entity.missinglegs))
	{
		return false;
	}
	if(entity aiutility::function_cc26899f() != "locomotion_speed_walk")
	{
		if(entity ai::has_behavior_attribute("spark_behavior") && !entity ai::get_behavior_attribute("spark_behavior"))
		{
			return false;
		}
	}
	if(isdefined(entity.juke))
	{
		return false;
	}
	if(!isdefined(entity.next_juke_time))
	{
		entity.next_juke_time = gettime() + randomintrange(7500, 9500);
	}
	if(gettime() > entity.next_juke_time)
	{
		entity.next_juke_time = undefined;
		if(randomint(100) < 25 || (entity ai::has_behavior_attribute("spark_behavior") && entity ai::get_behavior_attribute("spark_behavior")))
		{
			if(isdefined(entity.next_stumble_time))
			{
				entity.next_stumble_time = undefined;
			}
			forwardoffset = 15;
			entity.ignorebackwardposition = 1;
			if(math::cointoss())
			{
				jukedistance = 101;
				entity.jukedistance = "long";
				switch(entity aiutility::function_cc26899f())
				{
					case "locomotion_speed_run":
					case "locomotion_speed_walk":
					{
						forwardoffset = 122;
						break;
					}
					case "locomotion_speed_sprint":
					{
						forwardoffset = 129;
						break;
					}
				}
				entity.juke = aiutility::calculatejukedirection(entity, forwardoffset, jukedistance);
			}
			if(!isdefined(entity.juke) || entity.juke == "forward")
			{
				jukedistance = 69;
				entity.jukedistance = "short";
				switch(entity aiutility::function_cc26899f())
				{
					case "locomotion_speed_run":
					case "locomotion_speed_walk":
					{
						forwardoffset = 127;
						break;
					}
					case "locomotion_speed_sprint":
					{
						forwardoffset = 148;
						break;
					}
				}
				entity.juke = aiutility::calculatejukedirection(entity, forwardoffset, jukedistance);
				if(entity.juke == "forward")
				{
					entity.juke = undefined;
					entity.jukedistance = undefined;
					return false;
				}
			}
		}
	}
}

/*
	Name: zombiedeathaction
	Namespace: zombiebehavior
	Checksum: 0x3ECD217
	Offset: 0x4E40
	Size: 0xE
	Parameters: 1
	Flags: Linked
*/
function zombiedeathaction(entity)
{
	return undefined;
}

/*
	Name: waskilledbyinterdimensionalguncondition
	Namespace: zombiebehavior
	Checksum: 0x34FFAFDF
	Offset: 0x4E58
	Size: 0x50
	Parameters: 1
	Flags: Linked
*/
function waskilledbyinterdimensionalguncondition(entity)
{
	if(isdefined(entity.interdimensional_gun_kill) && !isdefined(entity.killby_interdimensional_gun_hole) && isalive(entity))
	{
		return true;
	}
	return false;
}

/*
	Name: wascrushedbyinterdimensionalgunblackholecondition
	Namespace: zombiebehavior
	Checksum: 0x4D1F6051
	Offset: 0x4EB0
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function wascrushedbyinterdimensionalgunblackholecondition(entity)
{
	if(isdefined(entity.killby_interdimensional_gun_hole))
	{
		return true;
	}
	return false;
}

/*
	Name: zombieidgundeathmocompstart
	Namespace: zombiebehavior
	Checksum: 0x6BBB5900
	Offset: 0x4EE0
	Size: 0xAE
	Parameters: 5
	Flags: Linked
*/
function zombieidgundeathmocompstart(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	mocompduration orientmode("face angle", mocompduration.angles[1]);
	mocompduration animmode("noclip");
	mocompduration.pushable = 0;
	mocompduration.blockingpain = 1;
	mocompduration pathmode("dont move");
	mocompduration.hole_pull_speed = 0;
}

/*
	Name: zombiemeleejumpmocompstart
	Namespace: zombiebehavior
	Checksum: 0xCE67752C
	Offset: 0x4F98
	Size: 0xB6
	Parameters: 5
	Flags: Linked
*/
function zombiemeleejumpmocompstart(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	mocompduration orientmode("face enemy");
	mocompduration animmode("noclip", 0);
	mocompduration.pushable = 0;
	mocompduration.blockingpain = 1;
	mocompduration.clamptonavmesh = 0;
	mocompduration collidewithactors(0);
	mocompduration.jumpstartposition = mocompduration.origin;
}

/*
	Name: zombiemeleejumpmocompupdate
	Namespace: zombiebehavior
	Checksum: 0xDAF7F877
	Offset: 0x5058
	Size: 0x304
	Parameters: 5
	Flags: Linked
*/
function zombiemeleejumpmocompupdate(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	normalizedtime = ((mocompanim getanimtime(mocompanimblendouttime) * getanimlength(mocompanimblendouttime)) + mocompanimflag) / mocompduration;
	if(normalizedtime > 0.5)
	{
		mocompanim orientmode("face angle", mocompanim.angles[1]);
	}
	speed = 5;
	if(isdefined(mocompanim.zombie_move_speed))
	{
		switch(mocompanim.zombie_move_speed)
		{
			case "walk":
			{
				speed = 5;
				break;
			}
			case "run":
			{
				speed = 6;
				break;
			}
			case "sprint":
			{
				speed = 7;
				break;
			}
		}
	}
	newposition = mocompanim.origin + (anglestoforward(mocompanim.angles) * speed);
	newtestposition = (newposition[0], newposition[1], mocompanim.jumpstartposition[2]);
	newvalidposition = getclosestpointonnavmesh(newtestposition, 12, 20);
	if(isdefined(newvalidposition))
	{
		newvalidposition = (newvalidposition[0], newvalidposition[1], mocompanim.origin[2]);
	}
	else
	{
		newvalidposition = mocompanim.origin;
	}
	if(!is_true(mocompanim.var_7c16e514))
	{
		waterheight = getwaterheight(mocompanim.origin);
		if(newvalidposition[2] + mocompanim function_6a9ae71() > waterheight)
		{
			newvalidposition = (newvalidposition[0], newvalidposition[1], waterheight - mocompanim function_6a9ae71());
		}
	}
	groundpoint = getclosestpointonnavmesh(newvalidposition, 12, 20);
	if(isdefined(groundpoint) && groundpoint[2] > newvalidposition[2])
	{
		newvalidposition = (newvalidposition[0], newvalidposition[1], groundpoint[2]);
	}
	mocompanim forceteleport(newvalidposition);
}

/*
	Name: zombiemeleejumpmocompterminate
	Namespace: zombiebehavior
	Checksum: 0x28477D20
	Offset: 0x5368
	Size: 0xB4
	Parameters: 5
	Flags: Linked
*/
function zombiemeleejumpmocompterminate(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	mocompduration.pushable = 1;
	mocompduration.blockingpain = 0;
	mocompduration.clamptonavmesh = 1;
	mocompduration collidewithactors(1);
	groundpoint = getclosestpointonnavmesh(mocompduration.origin, 12);
	if(isdefined(groundpoint))
	{
		mocompduration forceteleport(groundpoint);
	}
}

/*
	Name: zombieidgundeathupdate
	Namespace: zombiebehavior
	Checksum: 0x8A4D34C5
	Offset: 0x5428
	Size: 0x2F4
	Parameters: 5
	Flags: Linked
*/
function zombieidgundeathupdate(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	if(!isdefined(mocompduration.killby_interdimensional_gun_hole))
	{
		entity_eye = mocompduration geteye();
		if(mocompduration.b_vortex_repositioned !== 1)
		{
			mocompduration.b_vortex_repositioned = 1;
			v_nearest_navmesh_point = getclosestpointonnavmesh(mocompduration.damageorigin, 36, 15);
			if(isdefined(v_nearest_navmesh_point))
			{
				f_distance = distance(mocompduration.damageorigin, v_nearest_navmesh_point);
				if(f_distance < 41)
				{
					mocompduration.damageorigin = mocompduration.damageorigin + vectorscale((0, 0, 1), 36);
				}
			}
		}
		entity_center = mocompduration.origin + ((entity_eye - mocompduration.origin) / 2);
		flyingdir = mocompduration.damageorigin - entity_center;
		lengthfromhole = length(flyingdir);
		if(lengthfromhole < mocompduration.hole_pull_speed)
		{
			mocompduration.killby_interdimensional_gun_hole = 1;
			mocompduration.allowdeath = 1;
			mocompduration.takedamage = 1;
			mocompduration.aioverridedamage = undefined;
			mocompduration.magic_bullet_shield = 0;
			level notify(#"interdimensional_kill", {#entity:mocompduration});
			if(isdefined(mocompduration.interdimensional_gun_weapon) && isdefined(mocompduration.interdimensional_gun_attacker))
			{
				mocompduration kill(mocompduration.origin, mocompduration.interdimensional_gun_attacker, mocompduration.interdimensional_gun_attacker, mocompduration.interdimensional_gun_weapon);
			}
			else
			{
				mocompduration kill(mocompduration.origin);
			}
		}
		else
		{
			if(mocompduration.hole_pull_speed < 12)
			{
				mocompduration.hole_pull_speed = mocompduration.hole_pull_speed + 0.5;
				if(mocompduration.hole_pull_speed > 12)
				{
					mocompduration.hole_pull_speed = 12;
				}
			}
			flyingdir = vectornormalize(flyingdir);
			mocompduration forceteleport(mocompduration.origin + (flyingdir * mocompduration.hole_pull_speed));
		}
	}
}

/*
	Name: zombieidgunholedeathmocompstart
	Namespace: zombiebehavior
	Checksum: 0x3EF64BEC
	Offset: 0x5728
	Size: 0x7E
	Parameters: 5
	Flags: Linked
*/
function zombieidgunholedeathmocompstart(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	mocompduration orientmode("face angle", mocompduration.angles[1]);
	mocompduration animmode("noclip");
	mocompduration.pushable = 0;
}

/*
	Name: zombieidgunholedeathmocompterminate
	Namespace: zombiebehavior
	Checksum: 0x8335BFF1
	Offset: 0x57B0
	Size: 0x5C
	Parameters: 5
	Flags: Linked
*/
function zombieidgunholedeathmocompterminate(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	if(!is_true(mocompduration.interdimensional_gun_kill_vortex_explosion))
	{
		mocompduration hide();
	}
}

/*
	Name: zombieturnmocompstart
	Namespace: zombiebehavior
	Checksum: 0xB66176CB
	Offset: 0x5818
	Size: 0x74
	Parameters: 5
	Flags: Linked, Private
*/
function private zombieturnmocompstart(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	mocompduration orientmode("face angle", mocompduration.angles[1]);
	mocompduration animmode("angle deltas", 0);
}

/*
	Name: zombieturnmocompupdate
	Namespace: zombiebehavior
	Checksum: 0x8A2BC22
	Offset: 0x5898
	Size: 0xA4
	Parameters: 5
	Flags: Linked, Private
*/
function private zombieturnmocompupdate(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	normalizedtime = (mocompanim getanimtime(mocompanimblendouttime) + mocompanimflag) / mocompduration;
	if(normalizedtime > 0.25)
	{
		mocompanim orientmode("face motion");
		mocompanim animmode("normal", 0);
	}
}

/*
	Name: zombieturnmocompterminate
	Namespace: zombiebehavior
	Checksum: 0x697CE87B
	Offset: 0x5948
	Size: 0x6C
	Parameters: 5
	Flags: Linked, Private
*/
function private zombieturnmocompterminate(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	mocompduration orientmode("face motion");
	mocompduration animmode("normal", 0);
}

/*
	Name: zombiehaslegs
	Namespace: zombiebehavior
	Checksum: 0x93689AD7
	Offset: 0x59C0
	Size: 0x28
	Parameters: 1
	Flags: Linked
*/
function zombiehaslegs(entity)
{
	if(entity.missinglegs === 1)
	{
		return false;
	}
	return true;
}

/*
	Name: function_33ab7991
	Namespace: zombiebehavior
	Checksum: 0x83BF04A3
	Offset: 0x59F0
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function function_33ab7991(entity)
{
	return !zombiehaslegs(entity);
}

/*
	Name: zombieshouldproceduraltraverse
	Namespace: zombiebehavior
	Checksum: 0x789132
	Offset: 0x5A20
	Size: 0x62
	Parameters: 1
	Flags: Linked
*/
function zombieshouldproceduraltraverse(entity)
{
	return isdefined(entity.traversestartnode) && isdefined(entity.traverseendnode) && entity.traversestartnode.spawnflags & 1024 && entity.traverseendnode.spawnflags & 1024;
}

/*
	Name: zombieshouldmeleesuicide
	Namespace: zombiebehavior
	Checksum: 0x8CE355C0
	Offset: 0x5A90
	Size: 0xB2
	Parameters: 1
	Flags: Linked
*/
function zombieshouldmeleesuicide(entity)
{
	if(!entity ai::get_behavior_attribute("suicidal_behavior"))
	{
		return false;
	}
	if(is_true(entity.magic_bullet_shield))
	{
		return false;
	}
	if(!isdefined(entity.enemy))
	{
		return false;
	}
	if(isdefined(entity.marked_for_death))
	{
		return false;
	}
	if(distancesquared(entity.origin, entity.enemy.origin) > 40000)
	{
		return false;
	}
	return true;
}

/*
	Name: zombiemeleesuicidestart
	Namespace: zombiebehavior
	Checksum: 0x4E53C61B
	Offset: 0x5B50
	Size: 0x40
	Parameters: 1
	Flags: Linked
*/
function zombiemeleesuicidestart(entity)
{
	entity.blockingpain = 1;
	if(isdefined(level.zombiemeleesuicidecallback))
	{
		entity thread [[level.zombiemeleesuicidecallback]](entity);
	}
}

/*
	Name: zombiemeleesuicideupdate
	Namespace: zombiebehavior
	Checksum: 0x62E63533
	Offset: 0x5B98
	Size: 0xC
	Parameters: 1
	Flags: Linked
*/
function zombiemeleesuicideupdate(entity)
{
}

/*
	Name: zombiemeleesuicideterminate
	Namespace: zombiebehavior
	Checksum: 0xE4809716
	Offset: 0x5BB0
	Size: 0x80
	Parameters: 1
	Flags: Linked
*/
function zombiemeleesuicideterminate(entity)
{
	if(isalive(entity) && zombieshouldmeleesuicide(entity))
	{
		entity.takedamage = 1;
		entity.allowdeath = 1;
		if(isdefined(level.zombiemeleesuicidedonecallback))
		{
			entity thread [[level.zombiemeleesuicidedonecallback]](entity);
		}
	}
}

/*
	Name: function_c6787767
	Namespace: zombiebehavior
	Checksum: 0x75D01A37
	Offset: 0x5C38
	Size: 0x11A
	Parameters: 2
	Flags: Linked
*/
function function_c6787767(entity, asmstatename)
{
	function_ec25b529(entity);
	animationstatenetworkutility::requeststate(entity, asmstatename);
	if(is_true(entity.stumble) && !isdefined(entity.move_anim_end_time))
	{
		stumbleactionresult = entity astsearch(asmstatename);
		stumbleactionanimation = animationstatenetworkutility::searchanimationmap(entity, stumbleactionresult[#"animation"]);
		entity.move_anim_end_time = entity.movetime + getanimlength(stumbleactionanimation);
	}
	entity.movetime = gettime();
	entity.moveorigin = entity.origin;
	entity.var_13138acf = 0;
	return 5;
}

/*
	Name: function_a82068d7
	Namespace: zombiebehavior
	Checksum: 0xAA7F56D5
	Offset: 0x5D60
	Size: 0x28
	Parameters: 1
	Flags: Linked
*/
function function_a82068d7(entity)
{
	function_ec25b529(entity);
	return true;
}

/*
	Name: function_ec25b529
	Namespace: zombiebehavior
	Checksum: 0x400EB198
	Offset: 0x5D90
	Size: 0x26
	Parameters: 1
	Flags: Linked
*/
function function_ec25b529(entity)
{
	entity.movetime = gettime();
	entity.moveorigin = entity.origin;
}

/*
	Name: zombiemoveactionupdate
	Namespace: zombiebehavior
	Checksum: 0x45BAE9B3
	Offset: 0x5DC0
	Size: 0xBA
	Parameters: 2
	Flags: Linked
*/
function zombiemoveactionupdate(entity, asmstatename)
{
	if(isdefined(entity.move_anim_end_time) && gettime() >= entity.move_anim_end_time)
	{
		entity.move_anim_end_time = undefined;
		return 4;
	}
	function_26f9b8b1(entity);
	if(entity asmgetstatus() == "asm_status_complete")
	{
		if(entity iscurrentbtactionlooping())
		{
			return function_c6787767(entity, asmstatename);
		}
		return 4;
	}
	return 5;
}

/*
	Name: function_626edd6b
	Namespace: zombiebehavior
	Checksum: 0x2D9E6427
	Offset: 0x5E88
	Size: 0x28
	Parameters: 1
	Flags: Linked
*/
function function_626edd6b(entity)
{
	function_26f9b8b1(entity);
	return true;
}

/*
	Name: function_26f9b8b1
	Namespace: zombiebehavior
	Checksum: 0x61B55FD8
	Offset: 0x5EB8
	Size: 0x19A
	Parameters: 1
	Flags: Linked
*/
function function_26f9b8b1(entity)
{
	if(!is_true(entity.missinglegs) && (gettime() - entity.movetime) > 1000)
	{
		distsq = distance2dsquared(entity.origin, entity.moveorigin);
		if(distsq < 144 && !is_true(entity.cant_move))
		{
			entity.cant_move = 1;
			entity setavoidancemask("avoid all");
			/#
				record3dtext("", entity.origin, (0, 0, 1), "", entity);
			#/
			if(isdefined(entity.cant_move_cb))
			{
				entity thread [[entity.cant_move_cb]]();
			}
		}
		else if(is_true(entity.cant_move))
		{
			entity.cant_move = 0;
			entity setavoidancemask("avoid none");
			if(isdefined(entity.var_63d2fce2))
			{
				entity thread [[entity.var_63d2fce2]]();
			}
		}
		entity.movetime = gettime();
		entity.moveorigin = entity.origin;
	}
}

/*
	Name: zombiemoveactionterminate
	Namespace: zombiebehavior
	Checksum: 0x90E83AC2
	Offset: 0x6060
	Size: 0x50
	Parameters: 2
	Flags: None
*/
function zombiemoveactionterminate(entity, asmstatename)
{
	if(!is_true(asmstatename.missinglegs))
	{
		asmstatename setavoidancemask("avoid none");
	}
	return 4;
}

/*
	Name: function_79fe956f
	Namespace: zombiebehavior
	Checksum: 0x6B8C3228
	Offset: 0x60B8
	Size: 0xAE
	Parameters: 0
	Flags: Linked
*/
function function_79fe956f()
{
	self notify("3fe0eafaba815391");
	self endon("3fe0eafaba815391");
	self endon(#"death");
	if(!isdefined(self.var_9ed3cc11))
	{
		self.var_9ed3cc11 = self function_e827fc0e();
	}
	self pushplayer(1);
	wait(2);
	if(isdefined(self.var_9ed3cc11))
	{
		self pushplayer(self.var_9ed3cc11);
		self.var_9ed3cc11 = undefined;
	}
}

/*
	Name: function_22762653
	Namespace: zombiebehavior
	Checksum: 0x3DA22A12
	Offset: 0x6170
	Size: 0x2C6
	Parameters: 0
	Flags: Linked
*/
function function_22762653()
{
	self notify("71d42a1d339af30f");
	self endon("71d42a1d339af30f");
	self endon(#"death");
	if(isdefined(self.enemy_override))
	{
		self.enemy_override callback::callback(#"cant_move", self);
		return;
	}
	if(util::function_5df4294() === #"zsurvival")
	{
		if(!isdefined(self.var_1f2c0ce1))
		{
			self.var_1f2c0ce1 = self.origin;
		}
		else
		{
			if(distancesquared(self.var_1f2c0ce1, self.origin) < sqr(self getpathfindingradius()))
			{
				self clearpath();
				self.var_1f2c0ce1 = undefined;
			}
			else
			{
				self.var_1f2c0ce1 = self.origin;
			}
		}
	}
	var_159fa617 = 0;
	foreach(player in getplayers())
	{
		if(player laststand::player_is_in_laststand())
		{
			if(distancesquared(self.origin, player.origin) < 14400)
			{
				var_159fa617 = 1;
				break;
			}
		}
	}
	if(!var_159fa617)
	{
		self collidewithactors(0);
		wait(2);
		self collidewithactors(1);
		return;
	}
	if(!isdefined(self.var_9ed3cc11))
	{
		self.var_9ed3cc11 = self function_e827fc0e();
	}
	self pushplayer(1);
	wait(2);
	if(isdefined(self.var_9ed3cc11))
	{
		self pushplayer(self.var_9ed3cc11);
		self.var_9ed3cc11 = undefined;
	}
}

/*
	Name: function_9b6830c9
	Namespace: zombiebehavior
	Checksum: 0x2D12BE21
	Offset: 0x6440
	Size: 0x50
	Parameters: 2
	Flags: Linked
*/
function function_9b6830c9(entity, asmstatename)
{
	animationstatenetworkutility::requeststate(entity, asmstatename);
	entity pathmode("dont move");
	return 5;
}

/*
	Name: function_fbdc2cc4
	Namespace: zombiebehavior
	Checksum: 0x628B4C21
	Offset: 0x6498
	Size: 0x38
	Parameters: 2
	Flags: Linked
*/
function function_fbdc2cc4(entity, asmstatename)
{
	asmstatename pathmode("move allowed");
	return 4;
}

/*
	Name: archetypezombiedeathoverrideinit
	Namespace: zombiebehavior
	Checksum: 0xB552625B
	Offset: 0x64D8
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function archetypezombiedeathoverrideinit()
{
	aiutility::addaioverridekilledcallback(self, &zombiegibkilledanhilateoverride);
}

/*
	Name: zombiegibkilledanhilateoverride
	Namespace: zombiebehavior
	Checksum: 0x4A369F20
	Offset: 0x6508
	Size: 0x2F0
	Parameters: 9
	Flags: Linked, Private
*/
function private zombiegibkilledanhilateoverride(inflictor, attacker, damage, meansofdeath, weapon, var_fd90b0bb, dir, hitloc, offsettime)
{
	if(!is_true(level.zombieanhilationenabled))
	{
		return dir;
	}
	if(is_true(self.forceanhilateondeath))
	{
		self zombie_utility::gib_random_parts();
		gibserverutils::annihilate(self);
		return dir;
	}
	if(isdefined(var_fd90b0bb) && isplayer(var_fd90b0bb) && (is_true(var_fd90b0bb.forceanhilateondeath) || is_true(level.forceanhilateondeath)))
	{
		self zombie_utility::gib_random_parts();
		gibserverutils::annihilate(self);
		return dir;
	}
	attackerdistance = 0;
	if(isdefined(var_fd90b0bb))
	{
		attackerdistance = distancesquared(var_fd90b0bb.origin, self.origin);
	}
	isexplosive = isinarray(array("MOD_CRUSH", "MOD_GRENADE", "MOD_GRENADE_SPLASH", "MOD_PROJECTILE", "MOD_PROJECTILE_SPLASH", "MOD_EXPLOSIVE"), hitloc);
	if(isdefined(offsettime.weapclass) && offsettime.weapclass == "turret")
	{
		if(isdefined(weapon))
		{
			isdirectexplosive = isinarray(array("MOD_GRENADE", "MOD_GRENADE_SPLASH", "MOD_PROJECTILE", "MOD_PROJECTILE_SPLASH", "MOD_EXPLOSIVE"), hitloc);
			iscloseexplosive = distancesquared(weapon.origin, self.origin) <= sqr(60);
			if(isdirectexplosive && iscloseexplosive)
			{
				self zombie_utility::gib_random_parts();
				gibserverutils::annihilate(self);
			}
		}
	}
	return dir;
}

/*
	Name: zombiezombieidlemocompstart
	Namespace: zombiebehavior
	Checksum: 0x3346FBD7
	Offset: 0x6800
	Size: 0xE4
	Parameters: 5
	Flags: Linked, Private
*/
function private zombiezombieidlemocompstart(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	if(isdefined(mocompduration.enemy_override) && mocompduration != mocompduration.enemy_override)
	{
		mocompduration orientmode("face direction", mocompduration.enemy_override.origin - mocompduration.origin);
		mocompduration animmode("zonly_physics", 0);
	}
	else
	{
		mocompduration orientmode("face current");
		mocompduration animmode("zonly_physics", 0);
	}
}

/*
	Name: zombieattackobjectmocompstart
	Namespace: zombiebehavior
	Checksum: 0xA584DFA6
	Offset: 0x68F0
	Size: 0xCC
	Parameters: 5
	Flags: Linked, Private
*/
function private zombieattackobjectmocompstart(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	if(isdefined(mocompduration.attackable_slot))
	{
		mocompduration orientmode("face angle", mocompduration.attackable_slot.angles[1]);
		mocompduration animmode("zonly_physics", 0);
	}
	else
	{
		mocompduration orientmode("face current");
		mocompduration animmode("zonly_physics", 0);
	}
}

/*
	Name: zombieattackobjectmocompupdate
	Namespace: zombiebehavior
	Checksum: 0xB7640AA8
	Offset: 0x69C8
	Size: 0x64
	Parameters: 5
	Flags: Linked, Private
*/
function private zombieattackobjectmocompupdate(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	if(isdefined(mocompduration.attackable_slot))
	{
		mocompduration forceteleport(mocompduration.attackable_slot.origin);
	}
}

/*
	Name: function_54d75299
	Namespace: zombiebehavior
	Checksum: 0x419643F
	Offset: 0x6A38
	Size: 0x19C
	Parameters: 5
	Flags: Linked, Private
*/
function private function_54d75299(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	if(isdefined(mocompanimflag.enemy))
	{
		mocompanimflag orientmode("face enemy");
	}
	mocompanimflag animmode("zonly_physics", 1);
	mocompanimflag pathmode("dont move");
	localdeltahalfvector = getmovedelta(mocompduration, 0, 0.9);
	endpoint = mocompanimflag localtoworldcoords(localdeltahalfvector);
	/#
		recordcircle(endpoint, 3, (1, 0, 0), "");
		recordline(mocompanimflag.origin, endpoint, (1, 0, 0), "");
		record3dtext((("" + distance(mocompanimflag.origin, endpoint)) + "") + function_9e72a96(mocompduration), endpoint, (1, 0, 0), "");
	#/
}

/*
	Name: function_d1474842
	Namespace: zombiebehavior
	Checksum: 0x6499449C
	Offset: 0x6BE0
	Size: 0x4C
	Parameters: 5
	Flags: Linked, Private
*/
function private function_d1474842(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	mocompduration pathmode("dont move");
}

/*
	Name: function_b6d297bb
	Namespace: zombiebehavior
	Checksum: 0x61108AFE
	Offset: 0x6C38
	Size: 0x4C
	Parameters: 5
	Flags: Linked, Private
*/
function private function_b6d297bb(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	mocompduration pathmode("move allowed");
}

/*
	Name: function_cbbae5cb
	Namespace: zombiebehavior
	Checksum: 0x1EFFF71F
	Offset: 0x6C90
	Size: 0x174
	Parameters: 5
	Flags: Linked, Private
*/
function private function_cbbae5cb(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	mocompduration orientmode("face angle", mocompduration.angles[1]);
	mocompduration animmode("normal");
	if(isdefined(mocompduration.traverseendnode))
	{
		/#
			print3d(mocompduration.traversestartnode.origin, "", (1, 0, 0), 1, 1, 60);
			print3d(mocompduration.traverseendnode.origin, "", (0, 1, 0), 1, 1, 60);
			line(mocompduration.traversestartnode.origin, mocompduration.traverseendnode.origin, (0, 1, 0), 1, 0, 60);
		#/
		mocompduration forceteleport(mocompduration.traverseendnode.origin, mocompduration.traverseendnode.angles, 0);
	}
}

/*
	Name: function_db26137a
	Namespace: zombiebehavior
	Checksum: 0xF45043E1
	Offset: 0x6E10
	Size: 0x11C
	Parameters: 4
	Flags: Linked
*/
function function_db26137a(entity, attribute, oldvalue, value)
{
	if(value == "low")
	{
		self.low_gravity = 1;
		if(!isdefined(self.low_gravity_variant) && isdefined(level.var_d9ffddf4))
		{
			if(is_true(self.missinglegs))
			{
				self.low_gravity_variant = randomint(level.var_d9ffddf4[#"crawl"]);
			}
			else
			{
				self.low_gravity_variant = randomint(level.var_d9ffddf4[self.zombie_move_speed]);
			}
		}
	}
	else if(value == "normal")
	{
		self.low_gravity = 0;
	}
	oldvalue setblackboardattribute("_low_gravity", value);
}

