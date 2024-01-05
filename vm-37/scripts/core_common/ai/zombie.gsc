#using scripts\core_common\ai\archetype_zombie_interface.gsc;
#using script_59f07c660e6710a5;
#using scripts\core_common\ai\zombie_utility.gsc;
#using script_35598499769dbb3d;
#using script_522aeb6ae906391e;
#using script_7b7ed6e4bc963a51;
#using script_3aa0f32b70d4f7cb;
#using script_178024232e91b0a1;
#using scripts\core_common\ai\archetype_utility.gsc;
#using script_3819e7a1427df6d2;
#using script_489b835a247c990e;
#using script_4bf952f6ba31bb17;
#using script_4d85e8de54b02198;
#using script_caf007e2a98afa2;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\ai_shared.gsc;

#namespace zombiebehavior;

/*
	Name: init
	Namespace: zombiebehavior
	Checksum: 0xC1FC28BE
	Offset: 0x558
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
		spawner::add_archetype_spawn_function(#"zombie", &zombie_utility::updateanimationrate);
	#/
	clientfield::register("actor", "zombie", 1, 1, "int");
	clientfield::register("actor", "pustule_pulse_cf", 1, 2, "int");
	clientfield::register("actor", "stunned_head_fx", 1, 1, "int");
	zombieinterface::registerzombieinterfaceattributes();
}

/*
	Name: initzombiebehaviorsandasm
	Namespace: zombiebehavior
	Checksum: 0xBD59E471
	Offset: 0x740
	Size: 0x166C
	Parameters: 0
	Flags: Linked, Private
*/
function private initzombiebehaviorsandasm()
{
	/#
		assert(!isdefined(&zombiemoveactionstart) || isscriptfunctionptr(&zombiemoveactionstart));
	#/
	/#
		assert(!isdefined(&zombiemoveactionupdate) || isscriptfunctionptr(&zombiemoveactionupdate));
	#/
	/#
		assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction(#"zombiemoveaction", &zombiemoveactionstart, &zombiemoveactionupdate, undefined);
	/#
		assert(!isdefined(&function_9b6830c9) || isscriptfunctionptr(&function_9b6830c9));
	#/
	/#
		assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
	#/
	/#
		assert(!isdefined(&function_fbdc2cc4) || isscriptfunctionptr(&function_fbdc2cc4));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction(#"zombiemeleeaction", &function_9b6830c9, undefined, &function_fbdc2cc4);
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
		assert(isscriptfunctionptr(&zombieshouldmovelowg));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"zombieshouldmovelowg", &zombieshouldmovelowg);
	/#
		assert(isscriptfunctionptr(&zombieshouldturn));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"zombieshouldturn", &zombieshouldturn);
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
		assert(isscriptfunctionptr(&zombiemissinglegs));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"zombiemissinglegs", &zombiemissinglegs);
	/#
		assert(isscriptfunctionptr(&function_f937377));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_31cc70f275702cf6", &function_f937377);
	/#
		assert(isscriptfunctionptr(&function_a82068d7));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"zombiemoveactionstart", &function_a82068d7);
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
	Checksum: 0x3318B3A8
	Offset: 0x1DB8
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
	Checksum: 0x5A776393
	Offset: 0x1E10
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
	Checksum: 0xBCD44AE4
	Offset: 0x1E48
	Size: 0x13C
	Parameters: 0
	Flags: Linked
*/
function function_eb55349f()
{
	if(self.model === #"c_t9_zmb_zombie_light_body2" || self.model === #"c_t9_zmb_ndu_zombie_shirtless2" || self.model === #"hash_16837b6c9b7a1881")
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
	Checksum: 0x4CCFF883
	Offset: 0x1F90
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
	Checksum: 0x871AC92B
	Offset: 0x2000
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
	Checksum: 0x1EBC725F
	Offset: 0x2038
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
	Checksum: 0xDF0EDFB6
	Offset: 0x2070
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
	Checksum: 0x931EC39A
	Offset: 0x20A8
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
	Checksum: 0x95A4D229
	Offset: 0x20E0
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
	Checksum: 0xB3E1BC0
	Offset: 0x2118
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
	Checksum: 0x6E34650A
	Offset: 0x2410
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
	Checksum: 0x7187EFF1
	Offset: 0x2470
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
	Checksum: 0x39DC4B08
	Offset: 0x24C0
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
	Checksum: 0x6545D0F9
	Offset: 0x2518
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
	Checksum: 0x121C4740
	Offset: 0x2568
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
	Checksum: 0xB1A2CEEA
	Offset: 0x2590
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
	Checksum: 0xC36BB908
	Offset: 0x25B8
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
	Checksum: 0x9E8C895E
	Offset: 0x2620
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
	Checksum: 0x17FB4FA5
	Offset: 0x2650
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
	Checksum: 0x406E5C80
	Offset: 0x26E0
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
	Checksum: 0xDF309B51
	Offset: 0x2740
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
	Checksum: 0x4EF41A33
	Offset: 0x2770
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
	Checksum: 0x5CD3C002
	Offset: 0x2828
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
	Checksum: 0xF1D164CA
	Offset: 0x2858
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
	Checksum: 0x7FD6011A
	Offset: 0x2878
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
	Checksum: 0x8E1DE572
	Offset: 0x28A0
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
	Checksum: 0x138F4B68
	Offset: 0x28C0
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
	Checksum: 0xA200B011
	Offset: 0x2910
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
	Checksum: 0x6D882DD9
	Offset: 0x2938
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
	entity.melee_cooldown = gettime() + (getdvarfloat(#"scr_zombiemeleecooldown", 1) * 1000);
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
			entity callback::callback(#"on_ai_melee");
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
		if(isdefined(entity.custom_melee_fire))
		{
			entity [[entity.custom_melee_fire]]();
		}
		else
		{
			if(isdefined(level.custom_melee_fire))
			{
				entity [[level.custom_melee_fire]]();
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
		entity callback::callback(#"on_ai_melee");
	}
}

/*
	Name: zombienotetrackcrushfire
	Namespace: zombiebehavior
	Checksum: 0x46C589B4
	Offset: 0x2EA8
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
	Checksum: 0x61AF642F
	Offset: 0x2ED8
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
	Checksum: 0xC20805B
	Offset: 0x3130
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
	Checksum: 0x4795969B
	Offset: 0x36F8
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
	Checksum: 0x4D68FC17
	Offset: 0x38E8
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
	Checksum: 0x610A4190
	Offset: 0x3930
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
	Checksum: 0xEBB8FA67
	Offset: 0x3AB8
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
	Checksum: 0x43877818
	Offset: 0x3BB0
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
		meleedistsq = entity.meleeweapon.aimeleerange * entity.meleeweapon.aimeleerange;
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
	Checksum: 0xDD52C5EE
	Offset: 0x3D00
	Size: 0x2AE
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
	if(distancesquared(entity.origin, entity.enemy.origin) > meleedistsq)
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
	Checksum: 0xFB5D1886
	Offset: 0x3FB8
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
	Checksum: 0x189FB763
	Offset: 0x4088
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
	Checksum: 0xB6CFF039
	Offset: 0x4100
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
	Checksum: 0x233EC26B
	Offset: 0x4148
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
	Name: zombieshouldmovelowg
	Namespace: zombiebehavior
	Checksum: 0xAB702F52
	Offset: 0x4190
	Size: 0x22
	Parameters: 1
	Flags: Linked, Private
*/
function private zombieshouldmovelowg(entity)
{
	return is_true(entity.low_gravity);
}

/*
	Name: zombieshouldturn
	Namespace: zombiebehavior
	Checksum: 0xD1A0158E
	Offset: 0x41C0
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private zombieshouldturn(entity)
{
	return !isdefined(entity.turn_cooldown) || entity.turn_cooldown < gettime();
}

/*
	Name: function_a716a3af
	Namespace: zombiebehavior
	Checksum: 0x7057297E
	Offset: 0x41F8
	Size: 0x22
	Parameters: 1
	Flags: Linked, Private
*/
function private function_a716a3af(entity)
{
	entity.turn_cooldown = gettime() + 1000;
	return true;
}

/*
	Name: zombieshouldjumpmeleecondition
	Namespace: zombiebehavior
	Checksum: 0x6C270CD1
	Offset: 0x4228
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
	Checksum: 0x1119841
	Offset: 0x4588
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
	Checksum: 0xDABCE5C4
	Offset: 0x47C0
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
	Checksum: 0xC59F4EAD
	Offset: 0x4948
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
	Checksum: 0xD89C1665
	Offset: 0x4CE8
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
	Checksum: 0xFF0DBB41
	Offset: 0x4D00
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
	Checksum: 0x5032B007
	Offset: 0x4D58
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
	Checksum: 0x2A812B34
	Offset: 0x4D88
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
	Checksum: 0x784944F6
	Offset: 0x4E40
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
	Checksum: 0xA54323C3
	Offset: 0x4F00
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
	Checksum: 0x9DF703C
	Offset: 0x5210
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
	Checksum: 0x91A8B3F0
	Offset: 0x52D0
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
	Checksum: 0x219EBA1D
	Offset: 0x55D0
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
	Checksum: 0x882A454F
	Offset: 0x5658
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
	Checksum: 0x42830C78
	Offset: 0x56C0
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
	Checksum: 0x721F786E
	Offset: 0x5740
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
	Checksum: 0xF4F00C80
	Offset: 0x57F0
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
	Checksum: 0xAFB5A557
	Offset: 0x5868
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
	Name: zombiemissinglegs
	Namespace: zombiebehavior
	Checksum: 0x3F7F4A3A
	Offset: 0x5898
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function zombiemissinglegs(entity)
{
	return !zombiehaslegs(entity);
}

/*
	Name: zombieshouldproceduraltraverse
	Namespace: zombiebehavior
	Checksum: 0x537CC8A5
	Offset: 0x58C8
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
	Checksum: 0x29805039
	Offset: 0x5938
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
	Checksum: 0xDA766BFD
	Offset: 0x59F8
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
	Checksum: 0x677C84A3
	Offset: 0x5A40
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
	Checksum: 0x77A7EA11
	Offset: 0x5A58
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
	Name: zombiemoveactionstart
	Namespace: zombiebehavior
	Checksum: 0x67DD88E3
	Offset: 0x5AE0
	Size: 0x11A
	Parameters: 2
	Flags: Linked
*/
function zombiemoveactionstart(entity, asmstatename)
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
	Checksum: 0x9C416FF8
	Offset: 0x5C08
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
	Checksum: 0x983C1E22
	Offset: 0x5C38
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
	Checksum: 0x8DCD34F2
	Offset: 0x5C68
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
			return zombiemoveactionstart(entity, asmstatename);
		}
		return 4;
	}
	return 5;
}

/*
	Name: function_626edd6b
	Namespace: zombiebehavior
	Checksum: 0x2DFDD894
	Offset: 0x5D30
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
	Checksum: 0x94DC07C9
	Offset: 0x5D60
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
	Checksum: 0x4280A28
	Offset: 0x5F08
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
	Checksum: 0x827B2155
	Offset: 0x5F60
	Size: 0xAE
	Parameters: 0
	Flags: Linked
*/
function function_79fe956f()
{
	self notify("6b6dfc9b49165d1b");
	self endon("6b6dfc9b49165d1b");
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
	Checksum: 0x7EEF893A
	Offset: 0x6018
	Size: 0x1FE
	Parameters: 0
	Flags: Linked
*/
function function_22762653()
{
	self notify("35a99972e486d7fd");
	self endon("35a99972e486d7fd");
	self endon(#"death");
	if(isdefined(self.enemy_override))
	{
		self.enemy_override callback::callback(#"cant_move", self);
		return;
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
	Checksum: 0x30E14C89
	Offset: 0x6220
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
	Checksum: 0xD0DA0BF2
	Offset: 0x6278
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
	Checksum: 0x4936A55
	Offset: 0x62B8
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
	Checksum: 0xCC70FDFC
	Offset: 0x62E8
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
	Checksum: 0x9C68E634
	Offset: 0x65E0
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
	Checksum: 0xEBCC9D89
	Offset: 0x66D0
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
	Checksum: 0xBC3718D4
	Offset: 0x67A8
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
	Checksum: 0x62395CA3
	Offset: 0x6818
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
	Checksum: 0x39B081D2
	Offset: 0x69C0
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
	Checksum: 0x9F4F2694
	Offset: 0x6A18
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
	Checksum: 0x254C8148
	Offset: 0x6A70
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
	Checksum: 0xBCAE27EB
	Offset: 0x6BF0
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

