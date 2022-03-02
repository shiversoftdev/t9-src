#using script_317aa6153a75c589;
#using script_35598499769dbb3d;
#using script_3819e7a1427df6d2;
#using script_3aa0f32b70d4f7cb;
#using script_41fe08c37d53a635;
#using script_489b835a247c990e;
#using script_48f7c4ab73137f8;
#using script_4a3f9b8905878272;
#using script_4bf952f6ba31bb17;
#using script_4c5c4a64a59247a2;
#using script_4cb08c763ab82f54;
#using script_522aeb6ae906391e;
#using script_5660bae5b402a1eb;
#using script_59f07c660e6710a5;
#using script_67336be3b739af13;
#using script_6809bf766eba194a;
#using script_71dfbfdfba4489a0;
#using script_7b7ed6e4bc963a51;
#using script_caf007e2a98afa2;
#using script_cf8f48e7ee10aa3;
#using script_ed50e9299d3e143;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\zm_common\zm_devgui.gsc;
#using scripts\zm_common\zm_laststand.gsc;
#using scripts\zm_common\zm_perks.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;

#namespace archetype_zod_companion;

/*
	Name: function_39c19f2e
	Namespace: archetype_zod_companion
	Checksum: 0x84992DE2
	Offset: 0xA00
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_39c19f2e()
{
	level notify(1629121249);
}

/*
	Name: main
	Namespace: archetype_zod_companion
	Checksum: 0xD9D8925A
	Offset: 0xA20
	Size: 0x11C
	Parameters: 0
	Flags: AutoExec
*/
function autoexec main()
{
	clientfield::register("allplayers", "" + #"being_robot_revived", 24000, 1, "int");
	spawner::add_archetype_spawn_function(#"zod_companion", &zodcompanionbehavior::archetypezodcompanionblackboardinit);
	spawner::add_archetype_spawn_function(#"zod_companion", &zodcompanionserverutils::zodcompanionsoldierspawnsetup);
	zodcompanioninterface::registerzodcompanioninterfaceattributes();
	zodcompanionbehavior::registerbehaviorscriptfunctions();
	val::register("prioritize_target_near_leader", 1);
	val::default_value("prioritize_target_near_leader", 0);
	/#
		zm_devgui::function_c7dd7a17("");
	#/
}

#namespace zodcompanionbehavior;

/*
	Name: registerbehaviorscriptfunctions
	Namespace: zodcompanionbehavior
	Checksum: 0x454EDB27
	Offset: 0xB48
	Size: 0xF0C
	Parameters: 0
	Flags: None
*/
function registerbehaviorscriptfunctions()
{
	/#
		assert(isscriptfunctionptr(&zodcompaniontacticalwalkactionstart));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("zodCompanionTacticalWalkActionStart", &zodcompaniontacticalwalkactionstart);
	/#
		assert(isscriptfunctionptr(&zodcompanionabletoshootcondition));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("zodCompanionAbleToShoot", &zodcompanionabletoshootcondition);
	/#
		assert(isscriptfunctionptr(&zodcompanionshouldtacticalwalk));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("zodCompanionShouldTacticalWalk", &zodcompanionshouldtacticalwalk);
	/#
		assert(isscriptfunctionptr(&zodcompanionmovement));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("zodCompanionMovement", &zodcompanionmovement);
	/#
		assert(isscriptfunctionptr(&zodcompaniondelaymovement));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("zodCompanionDelayMovement", &zodcompaniondelaymovement);
	/#
		assert(isscriptfunctionptr(&zodcompanionsetdesiredstancetostand));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("zodCompanionSetDesiredStanceToStand", &zodcompanionsetdesiredstancetostand);
	/#
		assert(isscriptfunctionptr(&zodcompanionfinishedsprinttransition));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("zodCompanionFinishedSprintTransition", &zodcompanionfinishedsprinttransition);
	/#
		assert(isscriptfunctionptr(&zodcompanionsprinttransitioning));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("zodCompanionSprintTransitioning", &zodcompanionsprinttransitioning);
	/#
		assert(isscriptfunctionptr(&zodcompanionkeepscurrentmovementmode));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("zodCompanionKeepsCurrentMovementMode", &zodcompanionkeepscurrentmovementmode);
	/#
		assert(isscriptfunctionptr(&function_ad245111));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("zodCompanionShouldMelee", &function_ad245111);
	/#
		assert(isscriptfunctionptr(&function_11e6aca));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("zodCompanionIsInMeleeCooldown", &function_11e6aca);
	/#
		assert(isscriptfunctionptr(&function_6d669535));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("zodShouldAttackEnemy", &function_6d669535);
	/#
		assert(isscriptfunctionptr(&function_6379110b));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("zodCompanionIsExhausted", &function_6379110b);
	/#
		assert(isscriptfunctionptr(&function_b227bb80));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("zodCompanionHasAttackable", &function_b227bb80);
	/#
		assert(isscriptfunctionptr(&function_b0f37bd1));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_20604332da3960bd", &function_b0f37bd1);
	/#
		assert(isscriptfunctionptr(&function_eb957b75));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("zodCompanionHasDefendLocation", &function_eb957b75);
	/#
		assert(isscriptfunctionptr(&function_7a02ee66));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("zodCompanionDontShootWhileMoving", &function_7a02ee66);
	/#
		assert(isscriptfunctionptr(&function_63ea1da8));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("zodCompanionIsCarryingBomb", &function_63ea1da8);
	/#
		assert(isscriptfunctionptr(&function_f09ebebd));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("zodCompanionCarryBombCanMove", &function_f09ebebd);
	/#
		assert(isscriptfunctionptr(&function_4c27129));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("zodCompanionIsSprinting", &function_4c27129);
	/#
		assert(isscriptfunctionptr(&zodcompanioncanjuke));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("zodCompanionCanJuke", &zodcompanioncanjuke);
	/#
		assert(isscriptfunctionptr(&zodcompanioncanpreemptivejuke));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("zodCompanionCanPreemptiveJuke", &zodcompanioncanpreemptivejuke);
	/#
		assert(isscriptfunctionptr(&zodcompanionjukeinitialize));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("zodCompanionJukeInitialize", &zodcompanionjukeinitialize);
	/#
		assert(isscriptfunctionptr(&zodcompanionpreemptivejuketerminate));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("zodCompanionPreemptiveJukeTerminate", &zodcompanionpreemptivejuketerminate);
	/#
		assert(isscriptfunctionptr(&function_295d18f9));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("zodCompanionLeapTerminate", &function_295d18f9);
	/#
		assert(isscriptfunctionptr(&zodcompaniontargetservice));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("zodCompanionTargetService", &zodcompaniontargetservice);
	/#
		assert(isscriptfunctionptr(&zodcompaniontryreacquireservice));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("zodCompanionTryReacquireService", &zodcompaniontryreacquireservice);
	/#
		assert(isscriptfunctionptr(&manage_companion_movement));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("manage_companion_movement", &manage_companion_movement);
	/#
		assert(isscriptfunctionptr(&zodcompanioncollisionservice));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("zodCompanionCollisionService", &zodcompanioncollisionservice);
	/#
		assert(isscriptfunctionptr(&function_5e0202e4));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("tryStoppingCompanionService", &function_5e0202e4);
	/#
		assert(isscriptfunctionptr(&function_28f700f0));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("zodCompanionExhaustedBehaviorService", &function_28f700f0);
	/#
		assert(isscriptfunctionptr(&function_4c53c3ad));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("zodCompanionDefendLocationBehaviorService", &function_4c53c3ad);
	/#
		assert(isscriptfunctionptr(&function_6a3f6a31));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("zodCompanionClearObstacleService", &function_6a3f6a31);
	/#
		assert(!isdefined(&function_72edbea6) || isscriptfunctionptr(&function_72edbea6));
	#/
	/#
		assert(!isdefined(&function_7598aa02) || isscriptfunctionptr(&function_7598aa02));
	#/
	/#
		assert(!isdefined(&function_74ffdef5) || isscriptfunctionptr(&function_74ffdef5));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction("zodProceduralTraversal", &function_72edbea6, &function_7598aa02, &function_74ffdef5);
	/#
		assert(isscriptfunctionptr(&function_f5c4149e));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("zodCalcProceduralTraversal", &function_f5c4149e);
	/#
		assert(isscriptfunctionptr(&function_2b827272));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("zodProceduralLanding", &function_2b827272);
	/#
		assert(isscriptfunctionptr(&function_7942d9f2));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("zodTraverseEnd", &function_7942d9f2);
	animationstatenetwork::registeranimationmocomp("mocomp_procedural_traversal", &function_26cc92cd, &function_7d1f506, &function_dd922f46);
}

/*
	Name: function_ad245111
	Namespace: zodcompanionbehavior
	Checksum: 0xE5DA91F3
	Offset: 0x1A60
	Size: 0x232
	Parameters: 1
	Flags: Private
*/
function private function_ad245111(behaviortreeentity)
{
	if(function_b0f37bd1(behaviortreeentity))
	{
		return true;
	}
	enemy = function_a8bce123(behaviortreeentity);
	if(isdefined(enemy))
	{
		meleedist = 80;
		if(isdefined(behaviortreeentity.meleeweapon) && behaviortreeentity.meleeweapon !== level.weaponnone)
		{
			meleedist = behaviortreeentity.meleeweapon.var_d3cafde6;
		}
		if(isalive(enemy) && distancesquared(behaviortreeentity.origin, enemy.origin) < sqr(meleedist))
		{
			if(behaviortreeentity cansee(enemy))
			{
				return true;
			}
		}
		else
		{
			var_d32424f1 = getentitiesinradius(behaviortreeentity.origin, meleedist, 15);
			var_d32424f1 = array::exclude(var_d32424f1, behaviortreeentity);
			if(var_d32424f1.size > 0)
			{
				foreach(ai in var_d32424f1)
				{
					if(isalive(ai) && behaviortreeentity cansee(ai))
					{
						self.favoriteenemy = ai;
						self.nexttargetserviceupdate = gettime() + 1000;
						return true;
					}
				}
			}
			else
			{
				return false;
			}
		}
	}
	return false;
}

/*
	Name: function_11e6aca
	Namespace: zodcompanionbehavior
	Checksum: 0x562AF5BC
	Offset: 0x1CA0
	Size: 0x4E
	Parameters: 1
	Flags: Private
*/
function private function_11e6aca(behaviortreeentity)
{
	if(!isdefined(behaviortreeentity))
	{
		return 0;
	}
	if(function_b0f37bd1(behaviortreeentity))
	{
		return 0;
	}
	return isdefined(behaviortreeentity.var_88bd96a9) && gettime() < behaviortreeentity.var_88bd96a9;
}

/*
	Name: function_a8bce123
	Namespace: zodcompanionbehavior
	Checksum: 0x65F3DF1
	Offset: 0x1CF8
	Size: 0x52
	Parameters: 1
	Flags: Private
*/
function private function_a8bce123(entity)
{
	if(isdefined(entity.attackable))
	{
		return entity.attackable;
	}
	return (isdefined(entity.enemy) ? entity.enemy : entity.favoriteenemy);
}

/*
	Name: function_6d669535
	Namespace: zodcompanionbehavior
	Checksum: 0x82587A31
	Offset: 0x1D58
	Size: 0x56
	Parameters: 1
	Flags: Private
*/
function private function_6d669535(entity)
{
	var_d81e0034 = isdefined(entity.enemy) || isdefined(entity.favoriteenemy);
	return var_d81e0034 && !function_b227bb80(entity);
}

/*
	Name: function_5e0202e4
	Namespace: zodcompanionbehavior
	Checksum: 0xD39F32E
	Offset: 0x1DB8
	Size: 0xBE
	Parameters: 1
	Flags: None
*/
function function_5e0202e4(entity)
{
	if(is_true(entity.exhausted) || isdefined(entity.var_9140144d) || isdefined(entity.v_zombie_custom_goal_pos) || is_true(self.reviving_a_player))
	{
		return false;
	}
	enemy = function_a8bce123(entity);
	if(!isdefined(enemy))
	{
		aiutility::keepclaimnode(entity);
		return true;
	}
	aiutility::releaseclaimnode(entity);
	return false;
}

/*
	Name: mocompignorepainfaceenemyinit
	Namespace: zodcompanionbehavior
	Checksum: 0xFC3049CD
	Offset: 0x1E80
	Size: 0x74
	Parameters: 5
	Flags: Private
*/
function private mocompignorepainfaceenemyinit(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	mocompduration.blockingpain = 1;
	mocompduration orientmode("face enemy");
	mocompduration animmode("pos deltas");
}

/*
	Name: mocompignorepainfaceenemyterminate
	Namespace: zodcompanionbehavior
	Checksum: 0xB079C321
	Offset: 0x1F00
	Size: 0x36
	Parameters: 5
	Flags: Private
*/
function private mocompignorepainfaceenemyterminate(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	mocompduration.blockingpain = 0;
}

/*
	Name: archetypezodcompanionblackboardinit
	Namespace: zodcompanionbehavior
	Checksum: 0x4244059C
	Offset: 0x1F40
	Size: 0x74
	Parameters: 0
	Flags: Private
*/
function private archetypezodcompanionblackboardinit()
{
	entity = self;
	entity.pushable = 1;
	blackboard::createblackboardforentity(entity);
	ai::createinterfaceforentity(entity);
	self setblackboardattribute("_locomotion_speed", "locomotion_speed_sprint");
}

/*
	Name: zodcompaniondelaymovement
	Namespace: zodcompanionbehavior
	Checksum: 0x8ACEEA0E
	Offset: 0x1FC0
	Size: 0x44
	Parameters: 1
	Flags: Private
*/
function private zodcompaniondelaymovement(entity)
{
	entity pathmode("move delayed", 0, randomfloatrange(1, 2));
}

/*
	Name: zodcompanionmovement
	Namespace: zodcompanionbehavior
	Checksum: 0x62221BDD
	Offset: 0x2010
	Size: 0x5C
	Parameters: 1
	Flags: Private
*/
function private zodcompanionmovement(entity)
{
	if(entity getblackboardattribute("_stance") != "stand")
	{
		entity setblackboardattribute("_desired_stance", "stand");
	}
}

/*
	Name: zodcompanioncanjuke
	Namespace: zodcompanionbehavior
	Checksum: 0x25FD5903
	Offset: 0x2078
	Size: 0x13E
	Parameters: 1
	Flags: None
*/
function zodcompanioncanjuke(entity)
{
	if(!is_true(entity.steppedoutofcover) && aiutility::canjuke(entity))
	{
		jukeevents = blackboard::getblackboardevents("robot_juke");
		tooclosejukedistancesqr = 57600;
		foreach(event in jukeevents)
		{
			if(event.data.entity != entity && distance2dsquared(entity.origin, event.data.origin) <= tooclosejukedistancesqr)
			{
				return false;
			}
		}
		return true;
	}
	return false;
}

/*
	Name: zodcompanioncanpreemptivejuke
	Namespace: zodcompanionbehavior
	Checksum: 0x5F151201
	Offset: 0x21C0
	Size: 0x2BE
	Parameters: 1
	Flags: None
*/
function zodcompanioncanpreemptivejuke(entity)
{
	if(!isdefined(entity.enemy) || !isplayer(entity.enemy))
	{
		return 0;
	}
	if(entity getblackboardattribute("_stance") == "crouch")
	{
		return 0;
	}
	if(!entity.shouldpreemptivejuke)
	{
		return 0;
	}
	if(isdefined(entity.nextpreemptivejuke) && entity.nextpreemptivejuke > gettime())
	{
		return 0;
	}
	if(entity.enemy playerads() < entity.nextpreemptivejukeads)
	{
		return 0;
	}
	if(distancesquared(entity.origin, entity.enemy.origin) < 360000)
	{
		angledifference = absangleclamp180(entity.angles[1] - entity.enemy.angles[1]);
		/#
			record3dtext(angledifference, entity.origin + vectorscale((0, 0, 1), 5), (0, 1, 0), "");
		#/
		if(angledifference > 135)
		{
			enemyangles = entity.enemy getgunangles();
			toenemy = entity.enemy.origin - entity.origin;
			forward = anglestoforward(enemyangles);
			dotproduct = abs(vectordot(vectornormalize(toenemy), forward));
			/#
				record3dtext(acos(dotproduct), entity.origin + vectorscale((0, 0, 1), 10), (0, 1, 0), "");
			#/
			if(dotproduct > 0.9848)
			{
				return zodcompanioncanjuke(entity);
			}
		}
	}
	return 0;
}

/*
	Name: _isvalidplayer
	Namespace: zodcompanionbehavior
	Checksum: 0xB47BF06A
	Offset: 0x2488
	Size: 0xA8
	Parameters: 1
	Flags: Private
*/
function private _isvalidplayer(player)
{
	if(!isdefined(player) || !isalive(player) || !isplayer(player) || player.sessionstate == "spectator" || player.sessionstate == "intermission" || player laststand::player_is_in_laststand() || player.ignoreme)
	{
		return false;
	}
	return true;
}

/*
	Name: _findclosest
	Namespace: zodcompanionbehavior
	Checksum: 0x73D1A21B
	Offset: 0x2538
	Size: 0x248
	Parameters: 3
	Flags: Private
*/
function private _findclosest(entity, entities, var_eac22f6)
{
	if(!entities.size)
	{
		return undefined;
	}
	var_b98a92a2 = (isdefined(entity.var_b98a92a2) ? entity.var_b98a92a2 : 2500);
	entities = arraysortclosest(entities, var_eac22f6, 10, 0, var_b98a92a2);
	if(!entities.size)
	{
		return undefined;
	}
	potential_targets = [];
	var_8d6705e8 = [];
	foreach(target in entities)
	{
		enemypositiononnavmesh = getclosestpointonnavmesh(target.origin, 200);
		if(isdefined(enemypositiononnavmesh))
		{
			potential_targets[potential_targets.size] = target;
			var_8d6705e8[var_8d6705e8.size] = enemypositiononnavmesh;
		}
	}
	if(!potential_targets.size)
	{
		return undefined;
	}
	var_674755ca = function_5cb65d8a(var_eac22f6, var_8d6705e8, entity, entity getpathfindingradius(), entity function_6a9ae71(), -1, -1, 1000);
	if(!isdefined(var_674755ca))
	{
		return undefined;
	}
	for(i = 0; i < var_674755ca.size; i++)
	{
		if(var_674755ca[i] >= 0)
		{
			closest = {#entity:potential_targets[i], #distancesquared:distancesquared(var_eac22f6, var_8d6705e8[i])};
			return closest;
		}
	}
	return undefined;
}

/*
	Name: zodcompaniontargetservice
	Namespace: zodcompanionbehavior
	Checksum: 0x61328CE2
	Offset: 0x2788
	Size: 0x4B2
	Parameters: 1
	Flags: Private
*/
function private zodcompaniontargetservice(entity)
{
	if(!zodcompanionabletoshootcondition(entity))
	{
		return;
	}
	if(is_true(entity.ignoreall))
	{
		return;
	}
	if(isdefined(entity.attackable))
	{
		entity.nexttargetserviceupdate = 0;
		return;
	}
	if(is_true(entity.enemy.aat_turned))
	{
		entity clearenemy();
	}
	if(isdefined(entity.nexttargetserviceupdate) && entity.nexttargetserviceupdate > gettime() && isalive(entity.favoriteenemy) && !is_true(entity.favoriteenemy.aat_turned))
	{
		return false;
	}
	entity.nexttargetserviceupdate = gettime() + randomintrange(500, 1000);
	aienemies = [];
	playerenemies = [];
	ais = getactorteamarray("axis", "team3");
	players = getplayers();
	if(is_true(entity.("prioritize_target_near_leader")) && isdefined(entity.leader))
	{
		positiononnavmesh = getclosestpointonnavmesh(entity.leader.origin);
	}
	if(!isdefined(positiononnavmesh))
	{
		positiononnavmesh = getclosestpointonnavmesh(entity.origin, 200);
	}
	if(!isdefined(positiononnavmesh))
	{
		return;
	}
	if(ais.size)
	{
		var_f7dcf937 = [];
		foreach(ai in ais)
		{
			if(isalive(ai))
			{
				var_f7dcf937[var_f7dcf937.size] = ai;
			}
		}
		closestai = _findclosest(entity, var_f7dcf937, positiononnavmesh);
	}
	if(!is_false(entity.var_ab38d331))
	{
		validplayers = [];
		foreach(value in players)
		{
			if(_isvalidplayer(value))
			{
				validplayers[validplayers.size] = value;
			}
		}
		closestplayer = _findclosest(entity, validplayers, positiononnavmesh);
	}
	if(!isdefined(closestplayer.entity) && !isdefined(closestai.entity))
	{
		entity.favoriteenemy = undefined;
		return;
	}
	if(isdefined(self.var_135f3e2e))
	{
		entity.favoriteenemy = [[self.var_135f3e2e]](closestai, closestplayer);
	}
	else
	{
		if(!isdefined(closestai.entity))
		{
			entity.favoriteenemy = closestplayer.entity;
		}
		else
		{
			if(!isdefined(closestplayer.entity))
			{
				entity.favoriteenemy = closestai.entity;
			}
			else
			{
				if(closestai.distancesquared < closestplayer.distancesquared)
				{
					entity.favoriteenemy = closestai.entity;
				}
				else
				{
					entity.favoriteenemy = closestplayer.entity;
				}
			}
		}
	}
}

/*
	Name: zodcompaniontacticalwalkactionstart
	Namespace: zodcompanionbehavior
	Checksum: 0x5CE54723
	Offset: 0x2C48
	Size: 0x2C
	Parameters: 1
	Flags: Private
*/
function private zodcompaniontacticalwalkactionstart(entity)
{
	entity orientmode("face enemy");
}

/*
	Name: zodcompanionabletoshootcondition
	Namespace: zodcompanionbehavior
	Checksum: 0xAE1041A
	Offset: 0x2C80
	Size: 0x4E
	Parameters: 1
	Flags: Private
*/
function private zodcompanionabletoshootcondition(entity)
{
	return entity.weapon.name != level.weaponnone.name && !gibserverutils::isgibbed(entity, 16);
}

/*
	Name: zodcompanionshouldtacticalwalk
	Namespace: zodcompanionbehavior
	Checksum: 0x7735C155
	Offset: 0x2CD8
	Size: 0x2E
	Parameters: 1
	Flags: Private
*/
function private zodcompanionshouldtacticalwalk(entity)
{
	if(!entity haspath())
	{
		return false;
	}
	return true;
}

/*
	Name: zodcompanionjukeinitialize
	Namespace: zodcompanionbehavior
	Checksum: 0xAE1B590A
	Offset: 0x2D10
	Size: 0x94
	Parameters: 1
	Flags: Private
*/
function private zodcompanionjukeinitialize(entity)
{
	aiutility::choosejukedirection(entity);
	entity clearpath();
	jukeinfo = spawnstruct();
	jukeinfo.origin = entity.origin;
	jukeinfo.entity = entity;
	blackboard::addblackboardevent("robot_juke", jukeinfo, 2000);
}

/*
	Name: zodcompanionpreemptivejuketerminate
	Namespace: zodcompanionbehavior
	Checksum: 0xDCC5D7ED
	Offset: 0x2DB0
	Size: 0x5A
	Parameters: 1
	Flags: Private
*/
function private zodcompanionpreemptivejuketerminate(entity)
{
	entity.nextpreemptivejuke = gettime() + randomintrange(4000, 6000);
	entity.nextpreemptivejukeads = randomfloatrange(0.5, 0.95);
}

/*
	Name: function_295d18f9
	Namespace: zodcompanionbehavior
	Checksum: 0xBFAB9A3E
	Offset: 0x2E18
	Size: 0x34
	Parameters: 1
	Flags: Private
*/
function private function_295d18f9(entity)
{
	entity setblackboardattribute("_locomotion_speed", "locomotion_speed_walk");
}

/*
	Name: zodcompaniontryreacquireservice
	Namespace: zodcompanionbehavior
	Checksum: 0xBA1864D4
	Offset: 0x2E58
	Size: 0x2B6
	Parameters: 1
	Flags: Private
*/
function private zodcompaniontryreacquireservice(entity)
{
	if(!isdefined(entity.reacquire_state))
	{
		entity.reacquire_state = 0;
	}
	if(!isdefined(entity.enemy))
	{
		entity.reacquire_state = 0;
		return false;
	}
	if(entity haspath())
	{
		return false;
	}
	if(!zodcompanionabletoshootcondition(entity))
	{
		return false;
	}
	if(entity cansee(entity.enemy) && entity canshootenemy())
	{
		entity.reacquire_state = 0;
		return false;
	}
	dirtoenemy = vectornormalize(entity.enemy.origin - entity.origin);
	forward = anglestoforward(entity.angles);
	if(vectordot(dirtoenemy, forward) < 0.5)
	{
		entity.reacquire_state = 0;
		return false;
	}
	switch(entity.reacquire_state)
	{
		case 0:
		case 1:
		case 2:
		{
			step_size = 32 + (entity.reacquire_state * 32);
			reacquirepos = entity reacquirestep(step_size);
			break;
		}
		case 4:
		{
			if(!entity cansee(entity.enemy) || !entity canshootenemy())
			{
				entity flagenemyunattackable();
			}
			break;
		}
		default:
		{
			if(entity.reacquire_state > 15)
			{
				entity.reacquire_state = 0;
				return false;
			}
			break;
		}
	}
	if(isvec(reacquirepos))
	{
		entity function_a57c34b7(reacquirepos);
		return true;
	}
	entity.reacquire_state++;
	return false;
}

/*
	Name: manage_companion_movement
	Namespace: zodcompanionbehavior
	Checksum: 0x751B8A77
	Offset: 0x3118
	Size: 0xBA4
	Parameters: 1
	Flags: Private
*/
function private manage_companion_movement(entity)
{
	self endon(#"death");
	if(is_true(entity.exhausted))
	{
		return;
	}
	if(function_63ea1da8(entity))
	{
		return;
	}
	if(isdefined(level.var_1a612d42) && level.var_1a612d42.eligible_leader)
	{
		self.leader = level.var_1a612d42;
	}
	if(!isdefined(entity.var_5f694f04))
	{
		entity.var_5f694f04 = 0;
	}
	if(isdefined(entity.ai.bulletsinclip) && entity.ai.bulletsinclip < entity.weapon.clipsize)
	{
		entity.ai.bulletsinclip = entity.weapon.clipsize;
	}
	if(entity.reviving_a_player === 1)
	{
		return;
	}
	if(entity.time_expired === 1)
	{
		return;
	}
	if(entity.var_8dc43281 === 1 || entity.teleporting === 1)
	{
		return;
	}
	if(isdefined(entity.leader) && entity.leader.teleporting === 1)
	{
		entity thread function_818f64d1(entity.leader.teleport_location);
		return;
	}
	if(entity.var_7e56b71c === 1)
	{
		return;
	}
	if(isdefined(entity.leader) && entity.leader.is_flung === 1)
	{
		entity thread function_d5390a05(entity.leader.var_a76eba5b);
	}
	foreach(player in level.players)
	{
		if(player laststand::player_is_in_laststand() && entity.reviving_a_player === 0 && (!is_true(player.var_b895a3ff) && player.revivetrigger.beingrevived !== 1 || (is_true(player.var_b895a3ff) && player.var_dc4f101.revivetrigger.beingrevived !== 1)))
		{
			time = gettime();
			point = (is_true(player.var_b895a3ff) ? player.var_dc4f101.origin : player.origin);
			if(zm_utility::check_point_in_playable_area(point) && distancesquared(entity.origin, point) <= sqr(1024) && time >= entity.var_5f694f04)
			{
				if(isdefined(player.var_7d960eaa) && player.var_7d960eaa > gettime())
				{
					continue;
				}
				entity.reviving_a_player = 1;
				entity zod_companion_revive_player(player);
				return;
			}
		}
	}
	if(isdefined(entity.attackable) && isdefined(entity.var_b238ef38) && isdefined(entity.var_b238ef38.position))
	{
		if(function_eb957b75(entity))
		{
			entity zodcompanionutility::function_34179e9a();
		}
		var_ad1c1da4 = entity.var_b238ef38.position;
		if(distancesquared(entity.origin, var_ad1c1da4) <= sqr(entity getpathfindingradius()))
		{
			entity clearpath();
		}
		else
		{
			var_1f2328d0 = entity function_4794d6a3();
			if(!isdefined(var_1f2328d0.goalpos) || entity.var_5db9cc48 !== var_1f2328d0.goalpos)
			{
				if(distancesquared(entity.origin, var_ad1c1da4) > sqr(64))
				{
					if(is_true(entity.var_b238ef38.slot.var_bb075e37))
					{
						positiononnavmesh = var_ad1c1da4;
					}
					else
					{
						positiononnavmesh = getclosestpointonnavmesh(var_ad1c1da4, entity getpathfindingradius(), entity getpathfindingradius());
					}
					if(isdefined(positiononnavmesh))
					{
						entity.companion_destination = positiononnavmesh;
						entity.var_5db9cc48 = positiononnavmesh;
						entity clearforcedgoal();
						entity setgoal(positiononnavmesh, 1);
					}
				}
			}
			else if(entity isatgoal())
			{
				entity clearpath();
			}
		}
		return;
	}
	if(isdefined(entity.var_9140144d))
	{
		if(isdefined(entity.var_a72ffc1e) && entity namespace_47c5b560::function_72371f2a() && isdefined(entity.v_zombie_custom_goal_pos))
		{
			var_1f2328d0 = entity function_4794d6a3();
			if(!isdefined(var_1f2328d0.goalpos) || entity.v_zombie_custom_goal_pos !== var_1f2328d0.goalpos)
			{
				entity setgoal(entity.v_zombie_custom_goal_pos, 1);
			}
		}
		return;
	}
	if(!isdefined(entity.var_f4fb31fe))
	{
		entity.var_f4fb31fe = gettime();
	}
	if(gettime() >= entity.var_f4fb31fe && isdefined(level.active_powerups) && level.active_powerups.size > 0)
	{
		if(!isdefined(entity.var_345d40))
		{
			entity.var_345d40 = 0;
		}
		foreach(powerup in level.active_powerups)
		{
			if(isdefined(powerup))
			{
				if(isinarray(entity.var_2f03f56a, powerup.powerup_name))
				{
					dist = distancesquared(entity.origin, powerup.origin);
					if(dist <= 147456 && randomint(100) < (50 + (10 * entity.var_345d40)))
					{
						entity setgoal(powerup.origin, 1);
						entity.var_f4fb31fe = gettime() + randomintrange(2500, 3500);
						entity.next_move_time = gettime() + randomintrange(2500, 3500);
						entity.var_345d40 = 0;
						return;
					}
					entity.var_345d40 = entity.var_345d40 + 1;
				}
			}
		}
		entity.var_f4fb31fe = gettime() + randomintrange(333, 666);
	}
	follow_radius_squared = sqr((isdefined(entity.var_397796ce) ? entity.var_397796ce : 256));
	if(isdefined(entity.leader))
	{
		entity.companion_anchor_point = entity.leader.origin;
	}
	if(isdefined(entity.pathgoalpos))
	{
		dist_check_start_point = entity.pathgoalpos;
	}
	else
	{
		dist_check_start_point = entity.origin;
	}
	if(isdefined(entity.enemy) && isdefined(entity.enemy.archetype) && entity.enemy.archetype == "parasite")
	{
		height_difference = abs(entity.origin[2] - entity.enemy.origin[2]);
		var_3b91e18 = sqr(1.5 * height_difference);
		if(distancesquared(dist_check_start_point, entity.enemy.origin) < var_3b91e18)
		{
			entity pick_new_movement_point();
		}
	}
	if(distancesquared(dist_check_start_point, entity.companion_anchor_point) > follow_radius_squared || distancesquared(dist_check_start_point, entity.companion_anchor_point) < 4096)
	{
		entity pick_new_movement_point();
	}
	if(gettime() >= entity.next_move_time)
	{
		entity pick_new_movement_point();
	}
}

/*
	Name: zodcompanioncollisionservice
	Namespace: zodcompanionbehavior
	Checksum: 0xD0585864
	Offset: 0x3CC8
	Size: 0x1A6
	Parameters: 1
	Flags: Private
*/
function private zodcompanioncollisionservice(entity)
{
	if(isdefined(entity.dontpushtime))
	{
		if(gettime() < entity.dontpushtime)
		{
			return true;
		}
	}
	var_26cddecd = 0;
	zombies = getaiteamarray(level.zombie_team);
	foreach(zombie in zombies)
	{
		if(zombie == entity)
		{
			continue;
		}
		dist_sq = distancesquared(entity.origin, zombie.origin);
		if(dist_sq < 14400)
		{
			if(is_true(zombie.cant_move))
			{
				zombie thread function_d0371e1e();
				var_26cddecd = 1;
			}
		}
	}
	if(var_26cddecd)
	{
		entity collidewithactors(0);
		entity.dontpushtime = gettime() + 2000;
		return true;
	}
	entity collidewithactors(1);
	return false;
}

/*
	Name: function_d0371e1e
	Namespace: zodcompanionbehavior
	Checksum: 0xA54D0553
	Offset: 0x3E78
	Size: 0x4C
	Parameters: 0
	Flags: Private
*/
function private function_d0371e1e()
{
	self endon(#"death");
	self collidewithactors(0);
	wait(2);
	self collidewithactors(1);
}

/*
	Name: function_a2ba1ce8
	Namespace: zodcompanionbehavior
	Checksum: 0x7365ADC7
	Offset: 0x3ED0
	Size: 0x10E
	Parameters: 2
	Flags: Private
*/
function private function_a2ba1ce8(target_entity, max_distance)
{
	entity = self;
	var_85e6dc61 = target_entity.origin;
	if(distancesquared(entity.origin, var_85e6dc61) > sqr(max_distance))
	{
		return false;
	}
	path = entity calcapproximatepathtoposition(var_85e6dc61);
	segmentlength = 0;
	for(index = 1; index < path.size; index++)
	{
		currentseglength = distance(path[index - 1], path[index]);
		if(currentseglength + segmentlength > max_distance)
		{
			return false;
		}
		segmentlength = segmentlength + currentseglength;
	}
	return true;
}

/*
	Name: function_818f64d1
	Namespace: zodcompanionbehavior
	Checksum: 0x102DACB8
	Offset: 0x3FE8
	Size: 0x72
	Parameters: 1
	Flags: Private
*/
function private function_818f64d1(var_d2a1361a)
{
	self endon(#"death");
	self.var_8dc43281 = 1;
	self setgoal(var_d2a1361a, 1);
	self waittill(#"goal");
	wait(1);
	self.var_8dc43281 = 0;
}

/*
	Name: function_d5390a05
	Namespace: zodcompanionbehavior
	Checksum: 0x62444FB0
	Offset: 0x4068
	Size: 0xC2
	Parameters: 1
	Flags: Private
*/
function private function_d5390a05(var_33d955f9)
{
	self endon(#"death");
	self.var_7e56b71c = 1;
	var_cf5caf08 = getnodearray("flinger_traversal", "script_noteworthy");
	var_b2546f7 = arraygetclosest(var_33d955f9, var_cf5caf08);
	self setgoal(var_b2546f7.origin, 1);
	self waittill(#"goal");
	wait(1);
	self.var_7e56b71c = 0;
}

/*
	Name: pick_new_movement_point
	Namespace: zodcompanionbehavior
	Checksum: 0xA643AB28
	Offset: 0x4138
	Size: 0x4C6
	Parameters: 0
	Flags: Private
*/
function private pick_new_movement_point()
{
	if(isdefined(self.v_zombie_custom_goal_pos))
	{
		var_1f2328d0 = self function_4794d6a3();
		if(var_1f2328d0.goalpos === self.v_zombie_custom_goal_pos)
		{
			return;
		}
		/#
			if(getdvarint(#"hash_1b2cf8e5ac354d32", 0))
			{
				println(("" + "") + self.v_zombie_custom_goal_pos);
			}
		#/
		self.companion_destination = self.v_zombie_custom_goal_pos;
		aiutility::releaseclaimnode(self);
		self clearforcedgoal();
		self setgoal(self.companion_destination, 1);
		self.next_move_time = gettime() + randomintrange(20000, 30000);
		return;
	}
	if(namespace_47c5b560::function_a69c4b69(self) || is_true(self.var_2b5f41fd))
	{
		/#
			if(getdvarint(#"hash_1b2cf8e5ac354d32", 0))
			{
				println("" + "");
			}
		#/
		self.next_move_time = gettime() + randomintrange(2000, 3000);
		return;
	}
	var_a054e094 = (isdefined(self.var_397796ce) ? self.var_397796ce : 256);
	queryresult = positionquery_source_navigation(self.companion_anchor_point, 96, var_a054e094, 32, 20, self);
	if(queryresult.data.size)
	{
		if(isdefined(self.enemy) && isdefined(self.enemy.archetype) && self.enemy.archetype == "parasite")
		{
			array::filter(queryresult.data, 0, &function_bc4cbfe, self.enemy);
		}
	}
	if(queryresult.data.size)
	{
		point = queryresult.data[randomint(queryresult.data.size)];
		while(queryresult.data.size > 1 && isdefined(self.companion_destination) && point.origin === self.companion_destination)
		{
			point = queryresult.data[randomint(queryresult.data.size)];
		}
		pathsuccess = self findpath(self.origin, point.origin, 1, 0);
		if(!pathsuccess)
		{
			pathsuccess = self namespace_47c5b560::function_765e9504(point.origin);
		}
		if(pathsuccess)
		{
			self.companion_destination = point.origin;
		}
		else
		{
			self.next_move_time = gettime() + randomintrange(500, 1500);
			return;
		}
	}
	if(isdefined(self.companion_destination))
	{
		/#
			if(getdvarint(#"hash_1b2cf8e5ac354d32", 0))
			{
				println(("" + "") + self.companion_destination);
			}
		#/
		if(!self zodcompanionutility::function_c2725e7e(self.companion_destination))
		{
			self setgoal(self.companion_destination, 1);
		}
	}
	self.next_move_time = gettime() + randomintrange(20000, 30000);
}

/*
	Name: function_bc4cbfe
	Namespace: zodcompanionbehavior
	Checksum: 0x8F685CE6
	Offset: 0x4608
	Size: 0xA8
	Parameters: 1
	Flags: Private
*/
function private function_bc4cbfe(parasite)
{
	point = self;
	height_difference = abs(point.origin[2] - parasite.origin[2]);
	var_3b91e18 = sqr(1.5 * height_difference);
	return distancesquared(point.origin, parasite.origin) > var_3b91e18;
}

/*
	Name: zodcompanionsetdesiredstancetostand
	Namespace: zodcompanionbehavior
	Checksum: 0x29D66199
	Offset: 0x46B8
	Size: 0x6C
	Parameters: 1
	Flags: Private
*/
function private zodcompanionsetdesiredstancetostand(behaviortreeentity)
{
	currentstance = behaviortreeentity getblackboardattribute("_stance");
	if(currentstance == "crouch")
	{
		behaviortreeentity setblackboardattribute("_desired_stance", "stand");
	}
}

/*
	Name: zod_companion_revive_player
	Namespace: zodcompanionbehavior
	Checksum: 0xB18F766C
	Offset: 0x4730
	Size: 0x894
	Parameters: 1
	Flags: None
*/
function zod_companion_revive_player(player)
{
	self endon(#"death", #"revive_terminated", #"end_game");
	player endon(#"disconnect");
	if(!is_true(self.reviving_a_player))
	{
		self.reviving_a_player = 1;
	}
	self flag::set(#"reviving_a_player");
	player.being_revived_by_robot = 0;
	self thread zod_companion_monitor_revive_attempt(player);
	self val::set(#"zod_companion", "ignoreall", 1);
	pathmode = self getpathmode();
	var_46939b30 = 96;
	var_26304c9d = 64;
	var_7ad033f4 = 3;
	while(true)
	{
		target_point = (is_true(player.var_b895a3ff) ? player.var_dc4f101.origin : player.origin);
		if(!isdefined(self.companion_destination) || distancesquared(self.companion_destination, target_point) > sqr(var_46939b30))
		{
			queryresult = positionquery_source_navigation(target_point, var_26304c9d, var_46939b30, 96, 18, self);
			if(queryresult.data.size)
			{
				point = queryresult.data[randomint(queryresult.data.size)];
				self.companion_destination = point.origin;
			}
			else
			{
				if(var_7ad033f4 == 3)
				{
					var_46939b30 = 128;
					var_26304c9d = 32;
				}
				var_7ad033f4--;
				if(var_7ad033f4 == 0)
				{
					/#
						println("" + target_point);
					#/
					player.var_7d960eaa = gettime() + 1000;
					self.var_90b19379 = 1;
					return;
				}
				wait(1);
				continue;
			}
		}
		self pathmode("move allowed");
		aiutility::releaseclaimnode(self);
		self clearforcedgoal();
		self setgoal(self.companion_destination, 1);
		self waittilltimeout(1, #"goal");
		if(self isatgoal() && distancesquared(self.companion_destination, self.origin) <= sqr(self.goalradius))
		{
			break;
		}
	}
	self pathmode(pathmode);
	waitframe(1);
	revive_trigger = (is_true(player.var_b895a3ff) ? player.var_dc4f101.revivetrigger : player.revivetrigger);
	target_point = (is_true(player.var_b895a3ff) ? player.var_dc4f101.origin : player.origin);
	if(isplayer(player) && isdefined(revive_trigger))
	{
		level.var_ee623e8 = 1;
		revive_trigger.beingrevived = 1;
		player.being_revived_by_robot = 1;
		player.var_c6a6f334 = 1;
		vector = vectornormalize(target_point - self.origin);
		angles = vectortoangles(vector);
		angles = (0, angles[1], 0);
		self teleport(self.origin, angles);
		if(isdefined(self.var_69bfb00a))
		{
			self [[self.var_69bfb00a]](angles);
		}
		else
		{
			self thread animation::play("ai_robot_base_stn_exposed_revive", self, angles, 1.5);
		}
		wait(0.67);
		player clientfield::set("" + #"being_robot_revived", 1);
		if(!is_true(player.var_b895a3ff))
		{
			player val::set(#"hash_78da69acddea21c2", "allow_movement", 0);
		}
		player thread laststand::revive_hud_show_n_fade(#"hash_772a7cb5462ff9a", 3);
		player thread function_9cb5b8e0();
		self waittill(#"robot_revive_complete");
		if(level.players.size == 1 && level flag::get("solo_game"))
		{
			self.var_5f694f04 = gettime() + 10000;
		}
		else
		{
			self.var_5f694f04 = gettime() + 5000;
		}
		if(isdefined(level.a_revive_success_perk_func))
		{
			foreach(func in level.a_revive_success_perk_func)
			{
				self [[func]]();
			}
		}
		level.var_ff482f76 zm_laststand_client::close(player);
		if(is_true(player.var_b895a3ff))
		{
			if(isdefined(level.var_655e32ec))
			{
				player [[level.var_655e32ec]]();
			}
		}
		else
		{
			player thread zm_laststand::revive_success(self, 0);
			player notify(#"stop_revive_trigger");
		}
		level.var_ee623e8 = 0;
		players = getplayers();
		if(players.size == 1 && level flag::get("solo_game") && is_true(player.waiting_to_revive))
		{
			level.solo_game_free_player_quickrevive = 1;
			player thread zm_perks::function_a7ae070c(#"hash_7f98b3dd3cce95aa");
		}
	}
	self zod_companion_revive_cleanup(player);
}

/*
	Name: function_9cb5b8e0
	Namespace: zodcompanionbehavior
	Checksum: 0x2A6302D2
	Offset: 0x4FD0
	Size: 0x126
	Parameters: 0
	Flags: None
*/
function function_9cb5b8e0()
{
	revivetime = 3;
	var_d3e5d819 = 0;
	while(isdefined(self))
	{
		var_ae7a2103 = (isplayer(self.var_1ff8de20) ? self.var_1ff8de20 : self);
		level.var_ff482f76 zm_laststand_client::function_d50fdde9(var_ae7a2103, var_d3e5d819 / revivetime);
		if(isdefined(var_ae7a2103.var_57b374b4))
		{
			objective_setprogress(var_ae7a2103.var_57b374b4, var_d3e5d819 / revivetime);
			objective_setgamemodeflags(var_ae7a2103.var_57b374b4, 0);
		}
		if(var_d3e5d819 >= revivetime)
		{
			break;
		}
		waitframe(1);
		var_d3e5d819 = var_d3e5d819 + (float(function_60d95f53()) / 1000);
	}
}

/*
	Name: zod_companion_monitor_revive_attempt
	Namespace: zodcompanionbehavior
	Checksum: 0xF8B7E849
	Offset: 0x5100
	Size: 0x1A6
	Parameters: 1
	Flags: None
*/
function zod_companion_monitor_revive_attempt(player)
{
	self endon(#"death", #"revive_terminated");
	while(true)
	{
		if(is_true(player.var_b895a3ff))
		{
			if(!isdefined(player.var_dc4f101.revivetrigger) || (player.var_dc4f101.revivetrigger.beingrevived === 1 && player.being_revived_by_robot !== 1))
			{
				self zod_companion_revive_cleanup(player);
			}
		}
		else if(!isdefined(player.revivetrigger) || (player.revivetrigger.beingrevived === 1 && player.being_revived_by_robot !== 1) || is_true(player.revivetrigger.auto_revive))
		{
			self zod_companion_revive_cleanup(player);
		}
		if(!is_true(player laststand::player_is_in_laststand()) || is_true(self.var_90b19379))
		{
			self zod_companion_revive_cleanup(player);
		}
		waitframe(1);
	}
}

/*
	Name: zod_companion_revive_cleanup
	Namespace: zodcompanionbehavior
	Checksum: 0xC8D163F2
	Offset: 0x52B0
	Size: 0x156
	Parameters: 1
	Flags: None
*/
function zod_companion_revive_cleanup(player)
{
	self val::reset(#"zod_companion", "ignoreall");
	self.reviving_a_player = 0;
	self.var_90b19379 = undefined;
	self flag::clear(#"reviving_a_player");
	if(isplayer(player))
	{
		if(player.being_revived_by_robot === 1)
		{
			player.being_revived_by_robot = 0;
		}
		if(isdefined(player.revivetrigger) && player.revivetrigger.beingrevived === 1)
		{
			player.revivetrigger.beingrevived = 0;
		}
		player.var_c6a6f334 = 0;
		player clientfield::set("" + #"being_robot_revived", 0);
		player val::reset(#"hash_78da69acddea21c2", "allow_movement");
	}
	self notify(#"revive_terminated");
}

/*
	Name: zodcompanionfinishedsprinttransition
	Namespace: zodcompanionbehavior
	Checksum: 0x63C9358A
	Offset: 0x5410
	Size: 0xD4
	Parameters: 1
	Flags: Private
*/
function private zodcompanionfinishedsprinttransition(behaviortreeentity)
{
	behaviortreeentity.sprint_transition_happening = 0;
	if(behaviortreeentity getblackboardattribute("_locomotion_speed") == "locomotion_speed_walk")
	{
		behaviortreeentity ai::set_behavior_attribute("sprint", 1);
		behaviortreeentity setblackboardattribute("_locomotion_speed", "locomotion_speed_sprint");
	}
	else
	{
		behaviortreeentity ai::set_behavior_attribute("sprint", 0);
		behaviortreeentity setblackboardattribute("_locomotion_speed", "locomotion_speed_walk");
	}
}

/*
	Name: zodcompanionkeepscurrentmovementmode
	Namespace: zodcompanionbehavior
	Checksum: 0x13C63C01
	Offset: 0x54F0
	Size: 0x14A
	Parameters: 1
	Flags: Private
*/
function private zodcompanionkeepscurrentmovementmode(behaviortreeentity)
{
	var_202e5b5c = 640000;
	if(function_55a341c9(behaviortreeentity))
	{
		var_202e5b5c = 36864;
	}
	var_c351bd17 = 36864;
	if(isdefined(behaviortreeentity.var_3948eee7))
	{
		if(behaviortreeentity getblackboardattribute("_locomotion_speed") != behaviortreeentity.var_3948eee7)
		{
			return false;
		}
		return true;
	}
	dist = 0;
	if(isdefined(behaviortreeentity.pathgoalpos))
	{
		dist = distancesquared(behaviortreeentity.origin, behaviortreeentity.pathgoalpos);
	}
	if(dist > var_202e5b5c && behaviortreeentity getblackboardattribute("_locomotion_speed") == "locomotion_speed_walk")
	{
		return false;
	}
	if(dist < var_c351bd17 && behaviortreeentity getblackboardattribute("_locomotion_speed") == "locomotion_speed_sprint")
	{
		return false;
	}
	return true;
}

/*
	Name: zodcompanionsprinttransitioning
	Namespace: zodcompanionbehavior
	Checksum: 0x8A0A719E
	Offset: 0x5648
	Size: 0x28
	Parameters: 1
	Flags: Private
*/
function private zodcompanionsprinttransitioning(behaviortreeentity)
{
	if(behaviortreeentity.sprint_transition_happening === 1)
	{
		return true;
	}
	return false;
}

/*
	Name: function_6379110b
	Namespace: zodcompanionbehavior
	Checksum: 0x9A09F14C
	Offset: 0x5678
	Size: 0x22
	Parameters: 1
	Flags: None
*/
function function_6379110b(behaviortreeentity)
{
	return is_true(behaviortreeentity.exhausted);
}

/*
	Name: function_28f700f0
	Namespace: zodcompanionbehavior
	Checksum: 0xFC3D3C9A
	Offset: 0x56A8
	Size: 0xC2
	Parameters: 1
	Flags: None
*/
function function_28f700f0(behaviortreeentity)
{
	if(!is_true(behaviortreeentity.exhausted))
	{
		return;
	}
	var_1f2328d0 = behaviortreeentity function_4794d6a3();
	if(isdefined(behaviortreeentity.var_342791dd) && var_1f2328d0.goalpos === behaviortreeentity.var_342791dd && behaviortreeentity isatgoal())
	{
		behaviortreeentity pathmode("dont move", 1);
		behaviortreeentity.var_342791dd = undefined;
		behaviortreeentity.pushable = 0;
	}
}

/*
	Name: function_eb957b75
	Namespace: zodcompanionbehavior
	Checksum: 0x4E49CB28
	Offset: 0x5778
	Size: 0x18
	Parameters: 1
	Flags: None
*/
function function_eb957b75(behaviortreeentity)
{
	return isdefined(behaviortreeentity.var_9140144d);
}

/*
	Name: function_55a341c9
	Namespace: zodcompanionbehavior
	Checksum: 0x2D59E623
	Offset: 0x5798
	Size: 0x2A
	Parameters: 1
	Flags: None
*/
function function_55a341c9(behaviortreeentity)
{
	return isdefined(behaviortreeentity.var_9140144d) && isdefined(behaviortreeentity.var_a72ffc1e);
}

/*
	Name: function_4c53c3ad
	Namespace: zodcompanionbehavior
	Checksum: 0x1638C395
	Offset: 0x57D0
	Size: 0x20C
	Parameters: 1
	Flags: None
*/
function function_4c53c3ad(behaviortreeentity)
{
	if(!function_eb957b75(behaviortreeentity))
	{
		return;
	}
	if(function_6379110b(behaviortreeentity))
	{
		return;
	}
	if(is_true(behaviortreeentity.reviving_a_player))
	{
		return;
	}
	if(isdefined(behaviortreeentity.leader))
	{
		var_54b4d8be = distancesquared(behaviortreeentity.origin, behaviortreeentity.leader.origin);
		if(var_54b4d8be > sqr(1200))
		{
			/#
				if(getdvarint(#"hash_1b2cf8e5ac354d32", 0))
				{
					println("" + "");
				}
			#/
			behaviortreeentity zodcompanionutility::function_34179e9a();
			return;
		}
	}
	if(!isdefined(behaviortreeentity.var_a72ffc1e))
	{
		if(distancesquared(behaviortreeentity.origin, behaviortreeentity.var_9140144d) > sqr(256))
		{
			/#
				if(getdvarint(#"hash_1b2cf8e5ac354d32", 0))
				{
					println("" + "");
				}
			#/
			behaviortreeentity zodcompanionutility::function_fc7a4f48(behaviortreeentity.var_9140144d);
		}
		else
		{
			behaviortreeentity pathmode("dont move", 1);
		}
	}
}

/*
	Name: function_6a3f6a31
	Namespace: zodcompanionbehavior
	Checksum: 0x2921D5E9
	Offset: 0x59E8
	Size: 0x35A
	Parameters: 1
	Flags: None
*/
function function_6a3f6a31(behaviortreeentity)
{
	var_126918fc = function_55a341c9(behaviortreeentity);
	time = gettime();
	if(isdefined(behaviortreeentity.var_879af1ac))
	{
		if(var_126918fc)
		{
			if(time < behaviortreeentity.var_879af1ac)
			{
				behaviortreeentity function_a57c34b7(behaviortreeentity.origin);
				return;
			}
			/#
				iprintlnbold("");
			#/
		}
		behaviortreeentity val::reset(#"hash_6b00cd63706305ff", "ignoreall");
		behaviortreeentity val::reset(#"hash_6b00cd63706305ff", "prioritize_target_near_leader");
		behaviortreeentity function_d4c687c9();
		behaviortreeentity.var_879af1ac = undefined;
		behaviortreeentity.var_2c14b3fd = 0;
	}
	if(!var_126918fc)
	{
		return;
	}
	if(behaviortreeentity haspath() && !behaviortreeentity isatgoal())
	{
		if(isdefined(behaviortreeentity.var_43933fca) && time < behaviortreeentity.var_43933fca)
		{
			return;
		}
		is_blocked = 0;
		if(isdefined(behaviortreeentity.var_3c07378c))
		{
			var_545a671 = distancesquared(behaviortreeentity.var_3c07378c, behaviortreeentity.origin);
			is_blocked = var_545a671 < 4;
		}
		behaviortreeentity.var_43933fca = time + 1000;
		behaviortreeentity.var_3c07378c = behaviortreeentity.origin;
		if(is_blocked && !behaviortreeentity function_dd070839())
		{
			var_d32424f1 = getentitiesinradius(behaviortreeentity.origin, 80, 15);
			var_d32424f1 = array::exclude(var_d32424f1, behaviortreeentity);
			if(var_d32424f1.size > 0)
			{
				if(!isdefined(behaviortreeentity.var_2c14b3fd))
				{
					behaviortreeentity.var_2c14b3fd = 0;
				}
				behaviortreeentity.var_2c14b3fd++;
				if(behaviortreeentity.var_2c14b3fd >= 3)
				{
					behaviortreeentity.var_879af1ac = time + 3000;
					behaviortreeentity val::set(#"hash_6b00cd63706305ff", "ignoreall", 0);
					behaviortreeentity val::set(#"hash_6b00cd63706305ff", "prioritize_target_near_leader", 0);
					/#
						iprintlnbold("");
					#/
				}
				return;
			}
		}
		behaviortreeentity.var_2c14b3fd = 0;
	}
}

/*
	Name: function_7a02ee66
	Namespace: zodcompanionbehavior
	Checksum: 0x1174F71F
	Offset: 0x5D50
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function function_7a02ee66(behaviortreeentity)
{
	return function_6379110b(behaviortreeentity) || function_eb957b75(behaviortreeentity);
}

/*
	Name: function_4c27129
	Namespace: zodcompanionbehavior
	Checksum: 0x7F5404DC
	Offset: 0x5D98
	Size: 0x34
	Parameters: 1
	Flags: None
*/
function function_4c27129(behaviortreeentity)
{
	return behaviortreeentity getblackboardattribute("_locomotion_speed") === "locomotion_speed_sprint";
}

/*
	Name: function_b227bb80
	Namespace: zodcompanionbehavior
	Checksum: 0x3344D6B3
	Offset: 0x5DD8
	Size: 0x18
	Parameters: 1
	Flags: None
*/
function function_b227bb80(behaviortreeentity)
{
	return isdefined(behaviortreeentity.attackable);
}

/*
	Name: function_b0f37bd1
	Namespace: zodcompanionbehavior
	Checksum: 0xCF00BEDB
	Offset: 0x5DF8
	Size: 0x9E
	Parameters: 1
	Flags: None
*/
function function_b0f37bd1(behaviortreeentity)
{
	if(!isdefined(behaviortreeentity.attackable) || !isdefined(behaviortreeentity.var_b238ef38.position))
	{
		return false;
	}
	if(isdefined(behaviortreeentity.var_8a3828c6))
	{
		return false;
	}
	if(distancesquared(behaviortreeentity.var_b238ef38.position, behaviortreeentity.origin) < sqr(64))
	{
		return true;
	}
	return false;
}

/*
	Name: function_f5c4149e
	Namespace: zodcompanionbehavior
	Checksum: 0xD6939960
	Offset: 0x5EA0
	Size: 0x5C2
	Parameters: 1
	Flags: Private
*/
function private function_f5c4149e(entity)
{
	if(isdefined(entity.traversestartnode) && isdefined(entity.traverseendnode))
	{
		startpos = entity.origin;
		endpos = entity.traverseendnode.origin;
	}
	else
	{
		if(isdefined(entity.traversalstartpos) && isdefined(entity.traversalendpos))
		{
			startpos = entity.origin;
			endpos = entity.traversalendpos;
		}
		else
		{
			return;
		}
	}
	entity.traversal = spawnstruct();
	traversal = entity.traversal;
	traversal.landingdistance = 24;
	traversal.minimumspeed = 18;
	traversal.startpoint1 = startpos;
	traversal.endpoint1 = endpos;
	traversal.distancetoend = distance(traversal.startpoint1, traversal.endpoint1);
	traversal.absheighttoend = abs(traversal.startpoint1[2] - traversal.endpoint1[2]);
	traversal.abslengthtoend = distance2d(traversal.startpoint1, traversal.endpoint1);
	speedboost = 0;
	if(traversal.abslengthtoend > 200)
	{
		speedboost = 16;
	}
	else
	{
		if(traversal.abslengthtoend > 120)
		{
			speedboost = 8;
		}
		else if(traversal.abslengthtoend > 80 || traversal.absheighttoend > 80)
		{
			speedboost = 4;
		}
	}
	if(isdefined(entity.traversalspeedboost))
	{
		speedboost = entity [[entity.traversalspeedboost]]();
	}
	traversal.speedoncurve = (traversal.minimumspeed + speedboost) * 12;
	heightoffset = min(96, max(traversal.absheighttoend * 0.6, traversal.abslengthtoend));
	traversal.startpoint2 = entity.origin + (0, 0, heightoffset);
	traversal.endpoint2 = traversal.endpoint1 + (0, 0, heightoffset);
	if(traversal.startpoint1[2] < traversal.endpoint1[2])
	{
		traversal.startpoint2 = traversal.startpoint2 + (0, 0, traversal.absheighttoend);
	}
	else
	{
		traversal.endpoint2 = traversal.endpoint2 + (0, 0, traversal.absheighttoend);
	}
	/#
		recordline(traversal.startpoint1, traversal.startpoint2, (1, 0.5, 0), "", entity);
		recordline(traversal.startpoint1, traversal.endpoint1, (1, 0.5, 0), "", entity);
		recordline(traversal.endpoint1, traversal.endpoint2, (1, 0.5, 0), "", entity);
		recordline(traversal.startpoint2, traversal.endpoint2, (1, 0.5, 0), "", entity);
		record3dtext(traversal.abslengthtoend, traversal.endpoint1 + vectorscale((0, 0, 1), 12), (1, 0.5, 0), "", entity);
	#/
	segments = 10;
	previouspoint = traversal.startpoint1;
	traversal.curvelength = 0;
	for(index = 1; index <= segments; index++)
	{
		t = index / segments;
		nextpoint = calculatecubicbezier(t, traversal.startpoint1, traversal.startpoint2, traversal.endpoint2, traversal.endpoint1);
		/#
			recordline(previouspoint, nextpoint, (0, 1, 0), "", entity);
		#/
		traversal.curvelength = traversal.curvelength + distance(previouspoint, nextpoint);
		previouspoint = nextpoint;
	}
	traversal.starttime = gettime();
	traversal.endtime = traversal.starttime + (traversal.curvelength * (1000 / traversal.speedoncurve));
	traversal.totaltime = traversal.endtime - traversal.starttime;
	traversal.landing = 0;
	return true;
}

/*
	Name: function_72edbea6
	Namespace: zodcompanionbehavior
	Checksum: 0x89A530CC
	Offset: 0x6470
	Size: 0xA8
	Parameters: 2
	Flags: Private
*/
function private function_72edbea6(entity, asmstatename)
{
	entity.skipdeath = 1;
	traversal = entity.traversal;
	traversal.starttime = gettime();
	traversal.endtime = traversal.starttime + (traversal.curvelength * (1000 / traversal.speedoncurve));
	traversal.totaltime = traversal.endtime - traversal.starttime;
	animationstatenetworkutility::requeststate(entity, asmstatename);
	return 5;
}

/*
	Name: function_7598aa02
	Namespace: zodcompanionbehavior
	Checksum: 0x9F69B2F3
	Offset: 0x6520
	Size: 0xCC
	Parameters: 2
	Flags: Private
*/
function private function_7598aa02(entity, asmstatename)
{
	/#
		assert(isdefined(asmstatename.traversal));
	#/
	traversal = asmstatename.traversal;
	t = min((gettime() - traversal.starttime) / traversal.totaltime, 1);
	curveremaining = traversal.curvelength * (1 - t);
	if(curveremaining < traversal.landingdistance)
	{
		traversal.landing = 1;
		return 4;
	}
	return 5;
}

/*
	Name: function_2b827272
	Namespace: zodcompanionbehavior
	Checksum: 0xDB0992B4
	Offset: 0x65F8
	Size: 0x38
	Parameters: 1
	Flags: Private
*/
function private function_2b827272(entity)
{
	if(isdefined(entity.traversal))
	{
		entity finishtraversal();
	}
	return 5;
}

/*
	Name: function_74ffdef5
	Namespace: zodcompanionbehavior
	Checksum: 0x59A3C916
	Offset: 0x6638
	Size: 0x48
	Parameters: 2
	Flags: Private
*/
function private function_74ffdef5(entity, asmstatename)
{
	if(!isalive(asmstatename))
	{
		asmstatename startragdoll();
	}
	return 4;
}

/*
	Name: function_7942d9f2
	Namespace: zodcompanionbehavior
	Checksum: 0xE2AE9FCE
	Offset: 0x6688
	Size: 0x54
	Parameters: 1
	Flags: Private
*/
function private function_7942d9f2(entity)
{
	function_74ffdef5(entity);
	entity.skipdeath = 0;
	entity.traversal = undefined;
	entity notify(#"traverse_end");
	return 4;
}

/*
	Name: function_26cc92cd
	Namespace: zodcompanionbehavior
	Checksum: 0xE5121F3F
	Offset: 0x66E8
	Size: 0x10C
	Parameters: 5
	Flags: Private
*/
function private function_26cc92cd(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	traversal = mocompduration.traversal;
	mocompduration setavoidancemask("avoid none");
	mocompduration orientmode("face angle", mocompduration.angles[1]);
	mocompduration setrepairpaths(0);
	mocompduration animmode("noclip", 0);
	mocompduration.blockingpain = 1;
	mocompduration.clamptonavmesh = 0;
	if(isdefined(traversal) && traversal.landing)
	{
		mocompduration animmode("angle deltas", 0);
	}
}

/*
	Name: function_7d1f506
	Namespace: zodcompanionbehavior
	Checksum: 0x69B054DE
	Offset: 0x6800
	Size: 0x1D4
	Parameters: 5
	Flags: Private
*/
function private function_7d1f506(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	traversal = mocompduration.traversal;
	if(isdefined(traversal))
	{
		if(mocompduration ispaused())
		{
			traversal.starttime = traversal.starttime + (int((float(function_60d95f53()) / 1000) * 1000));
			return;
		}
		realt = (gettime() - traversal.starttime) / traversal.totaltime;
		t = min(realt, 1);
		if(t < 1 || realt == 1)
		{
			currentpos = calculatecubicbezier(t, traversal.startpoint1, traversal.startpoint2, traversal.endpoint2, traversal.endpoint1);
			angles = mocompduration.angles;
			if(isdefined(traversal.angles))
			{
				angles = traversal.angles;
			}
			mocompduration forceteleport(currentpos, angles, 0);
		}
		else
		{
			mocompduration animmode("normal_nogravity", 0);
		}
	}
}

/*
	Name: function_dd922f46
	Namespace: zodcompanionbehavior
	Checksum: 0xFB1B4A
	Offset: 0x69E0
	Size: 0xD4
	Parameters: 5
	Flags: Private
*/
function private function_dd922f46(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	traversal = mocompduration.traversal;
	if(isdefined(traversal) && gettime() >= traversal.endtime)
	{
		mocompduration pathmode("move allowed");
	}
	mocompduration.clamptonavmesh = 1;
	mocompduration.blockingpain = 0;
	mocompduration setrepairpaths(1);
	mocompduration setavoidancemask("avoid all");
}

/*
	Name: calculatecubicbezier
	Namespace: zodcompanionbehavior
	Checksum: 0x2FC5B743
	Offset: 0x6AC0
	Size: 0xD2
	Parameters: 5
	Flags: Private
*/
function private calculatecubicbezier(t, p1, p2, p3, p4)
{
	return ((pow(1 - t, 3)) * p1) + (((3 * (pow(1 - t, 2))) * t) * p2) + ((3 * (1 - t)) * pow(t, 2) * p3) + (pow(t, 3) * p4);
}

/*
	Name: function_63ea1da8
	Namespace: zodcompanionbehavior
	Checksum: 0x4718AF46
	Offset: 0x6BA0
	Size: 0x22
	Parameters: 1
	Flags: None
*/
function function_63ea1da8(behaviortreeentity)
{
	return is_true(behaviortreeentity.var_fee1e0f4);
}

/*
	Name: function_f09ebebd
	Namespace: zodcompanionbehavior
	Checksum: 0x2D4D08DE
	Offset: 0x6BD0
	Size: 0xF2
	Parameters: 1
	Flags: None
*/
function function_f09ebebd(behaviortreeentity)
{
	if(behaviortreeentity zodcompanionutility::function_be70ddb1() <= 0)
	{
		return 0;
	}
	foreach(player in function_a1ef346b())
	{
		if(distancesquared(behaviortreeentity.origin, player.origin) > 360000)
		{
			return 0;
		}
	}
	return behaviortreeentity haspath();
}

#namespace zodcompanionserverutils;

/*
	Name: _trygibbinghead
	Namespace: zodcompanionserverutils
	Checksum: 0x7064AC85
	Offset: 0x6CD0
	Size: 0x174
	Parameters: 6
	Flags: Private
*/
function private _trygibbinghead(entity, damage, weapon, var_fd90b0bb, hitloc, isexplosive)
{
	var_c3317960 = gibserverutils::function_de4d9d(weapon, var_fd90b0bb);
	if(isexplosive && randomfloatrange(0, 1) <= 0.5)
	{
		gibserverutils::gibhead(entity, var_c3317960);
	}
	else
	{
		if(isinarray(array("head", "neck", "helmet"), hitloc) && randomfloatrange(0, 1) <= 1)
		{
			gibserverutils::gibhead(entity, var_c3317960);
		}
		else if((entity.health - damage) <= 0 && randomfloatrange(0, 1) <= 0.25)
		{
			gibserverutils::gibhead(entity, var_c3317960);
		}
	}
}

/*
	Name: _trygibbinglimb
	Namespace: zodcompanionserverutils
	Checksum: 0x1399FF18
	Offset: 0x6E50
	Size: 0x2BC
	Parameters: 6
	Flags: Private
*/
function private _trygibbinglimb(entity, damage, weapon, var_fd90b0bb, hitloc, isexplosive)
{
	if(gibserverutils::isgibbed(entity, 32) || gibserverutils::isgibbed(entity, 16))
	{
		return;
	}
	var_c3317960 = gibserverutils::function_de4d9d(weapon, var_fd90b0bb);
	if(isexplosive && randomfloatrange(0, 1) <= 0.25)
	{
		if((entity.health - damage) <= 0 && entity.allowdeath && math::cointoss())
		{
			gibserverutils::gibrightarm(entity, var_c3317960);
		}
		else
		{
			gibserverutils::gibleftarm(entity, var_c3317960);
		}
	}
	else
	{
		if(isinarray(array("left_hand", "left_arm_lower", "left_arm_upper"), hitloc))
		{
			gibserverutils::gibleftarm(entity, var_c3317960);
		}
		else
		{
			if((entity.health - damage) <= 0 && entity.allowdeath && isinarray(array("right_hand", "right_arm_lower", "right_arm_upper"), hitloc))
			{
				gibserverutils::gibrightarm(entity, var_c3317960);
			}
			else if((entity.health - damage) <= 0 && entity.allowdeath && randomfloatrange(0, 1) <= 0.25)
			{
				if(math::cointoss())
				{
					gibserverutils::gibleftarm(entity, var_c3317960);
				}
				else
				{
					gibserverutils::gibrightarm(entity, var_c3317960);
				}
			}
		}
	}
}

/*
	Name: _trygibbinglegs
	Namespace: zodcompanionserverutils
	Checksum: 0xF7090FAF
	Offset: 0x7118
	Size: 0x384
	Parameters: 7
	Flags: Private
*/
function private _trygibbinglegs(entity, damage, weapon, var_fd90b0bb, hitloc, isexplosive, attacker)
{
	if(!isdefined(attacker))
	{
		attacker = entity;
	}
	var_c3317960 = gibserverutils::function_de4d9d(weapon, var_fd90b0bb);
	cangiblegs = (entity.health - damage) <= 0 && entity.allowdeath;
	cangiblegs = cangiblegs || (((entity.health - damage) / entity.maxhealth) <= 0.25 && distancesquared(entity.origin, attacker.origin) <= 360000 && entity.allowdeath);
	if((entity.health - damage) <= 0 && entity.allowdeath && isexplosive && randomfloatrange(0, 1) <= 0.5)
	{
		gibserverutils::giblegs(entity, var_c3317960);
		entity startragdoll();
	}
	else
	{
		if(cangiblegs && isinarray(array("left_leg_upper", "left_leg_lower", "left_foot"), hitloc) && randomfloatrange(0, 1) <= 1)
		{
			if(entity.health - damage > 0)
			{
				entity.becomecrawler = 1;
			}
			gibserverutils::gibleftleg(entity, var_c3317960);
		}
		else
		{
			if(cangiblegs && isinarray(array("right_leg_upper", "right_leg_lower", "right_foot"), hitloc) && randomfloatrange(0, 1) <= 1)
			{
				if(entity.health - damage > 0)
				{
					entity.becomecrawler = 1;
				}
				gibserverutils::gibrightleg(entity, var_c3317960);
			}
			else if((entity.health - damage) <= 0 && entity.allowdeath && randomfloatrange(0, 1) <= 0.25)
			{
				if(math::cointoss())
				{
					gibserverutils::gibleftleg(entity, var_c3317960);
				}
				else
				{
					gibserverutils::gibrightleg(entity, var_c3317960);
				}
			}
		}
	}
}

/*
	Name: zodcompaniongibdamageoverride
	Namespace: zodcompanionserverutils
	Checksum: 0x662A0A56
	Offset: 0x74A8
	Size: 0x178
	Parameters: 13
	Flags: Private
*/
function private zodcompaniongibdamageoverride(inflictor, attacker, damage, flags, meansofdeath, weapon, var_fd90b0bb, point, dir, hitloc, offsettime, boneindex, modelindex)
{
	entity = self;
	if((entity.health - dir) / entity.maxhealth > 0.75)
	{
		return dir;
	}
	gibserverutils::togglespawngibs(entity, 1);
	isexplosive = isinarray(array("MOD_GRENADE", "MOD_GRENADE_SPLASH", "MOD_PROJECTILE", "MOD_PROJECTIVLE_SPLASH", "MOD_EXPLOSIVE"), hitloc);
	_trygibbinghead(entity, dir, offsettime, boneindex, modelindex, isexplosive);
	_trygibbinglimb(entity, dir, offsettime, boneindex, modelindex, isexplosive);
	_trygibbinglegs(entity, dir, offsettime, boneindex, modelindex, isexplosive, point);
	return dir;
}

/*
	Name: zodcompaniondestructdeathoverride
	Namespace: zodcompanionserverutils
	Checksum: 0x38CD8C22
	Offset: 0x7628
	Size: 0x1FC
	Parameters: 12
	Flags: Private
*/
function private zodcompaniondestructdeathoverride(inflictor, attacker, damage, flags, meansofdeath, weapon, point, dir, hitloc, offsettime, boneindex, modelindex)
{
	entity = self;
	if((entity.health - modelindex) <= 0)
	{
		destructserverutils::togglespawngibs(entity, 1);
		piececount = destructserverutils::getpiececount(entity);
		possiblepieces = [];
		for(index = 1; index <= piececount; index++)
		{
			if(!destructserverutils::isdestructed(entity, index) && randomfloatrange(0, 1) <= 0.2)
			{
				possiblepieces[possiblepieces.size] = index;
			}
		}
		gibbedpieces = 0;
		for(index = 0; index < possiblepieces.size && possiblepieces.size > 1 && gibbedpieces < 2; index++)
		{
			randompiece = randomintrange(0, possiblepieces.size - 1);
			if(!destructserverutils::isdestructed(entity, possiblepieces[randompiece]))
			{
				destructserverutils::destructpiece(entity, possiblepieces[randompiece]);
				gibbedpieces++;
			}
		}
	}
	return modelindex;
}

/*
	Name: zodcompaniondamageoverride
	Namespace: zodcompanionserverutils
	Checksum: 0xB62C943F
	Offset: 0x7830
	Size: 0xDA
	Parameters: 13
	Flags: Private
*/
function private zodcompaniondamageoverride(inflictor, attacker, damage, flags, meansofdeath, weapon, var_fd90b0bb, point, dir, hitloc, offsettime, boneindex, modelindex)
{
	entity = self;
	if(modelindex == "helmet" || modelindex == "head" || modelindex == "neck")
	{
		boneindex = int(boneindex * 0.5);
	}
	return boneindex;
}

/*
	Name: findclosestnavmeshpositiontoenemy
	Namespace: zodcompanionserverutils
	Checksum: 0xF7F966F7
	Offset: 0x7918
	Size: 0x76
	Parameters: 1
	Flags: Private
*/
function private findclosestnavmeshpositiontoenemy(enemy)
{
	enemypositiononnavmesh = undefined;
	for(tolerancelevel = 1; tolerancelevel <= 4; tolerancelevel++)
	{
		enemypositiononnavmesh = getclosestpointonnavmesh(enemy.origin, 200 * tolerancelevel);
		if(isdefined(enemypositiononnavmesh))
		{
			break;
		}
	}
	return enemypositiononnavmesh;
}

/*
	Name: zodcompanionsoldierspawnsetup
	Namespace: zodcompanionserverutils
	Checksum: 0x42CFEE3B
	Offset: 0x7998
	Size: 0x1E4
	Parameters: 0
	Flags: Private
*/
function private zodcompanionsoldierspawnsetup()
{
	entity = self;
	entity.combatmode = "cover";
	entity.fullhealth = entity.health;
	entity.controllevel = 0;
	entity.steppedoutofcover = 0;
	entity.startingweapon = entity.weapon;
	entity.jukedistance = 90;
	entity.jukemaxdistance = 600;
	entity.entityradius = 15;
	entity.highlyawareradius = 256;
	entity.treatallcoversasgeneric = 1;
	entity.onlycroucharrivals = 1;
	entity.nextpreemptivejukeads = randomfloatrange(0.5, 0.95);
	entity.shouldpreemptivejuke = math::cointoss();
	entity.reviving_a_player = 0;
	aiutility::addaioverridedamagecallback(entity, &destructserverutils::handledamage);
	aiutility::addaioverridedamagecallback(entity, &zodcompaniondamageoverride);
	aiutility::addaioverridedamagecallback(entity, &zodcompaniongibdamageoverride);
	entity.companion_anchor_point = entity.origin;
	entity.next_move_time = gettime();
	entity.allow_zombie_to_target_ai = 1;
	entity.var_4d607241 = &zodcompanionutility::function_878dd91;
	entity val::set(#"zod_companion", "ignoreme", 1);
	entity thread zodcompanionutility::function_dbd6fcc6();
	entity thread zodcompanionutility::manage_companion();
}

#namespace zodcompanionutility;

/*
	Name: manage_companion
	Namespace: zodcompanionutility
	Checksum: 0x311AACB6
	Offset: 0x7B88
	Size: 0xB8
	Parameters: 0
	Flags: None
*/
function manage_companion()
{
	self endon(#"death");
	while(true)
	{
		if(!self.reviving_a_player && !zodcompanionbehavior::function_6379110b(self))
		{
			if(!isdefined(self.leader) || !self.leader.eligible_leader)
			{
				if(self flag::get(#"hash_2ba0c8dec55ab3f2"))
				{
				}
				else
				{
					self define_new_leader();
				}
			}
		}
		wait(0.5);
	}
}

/*
	Name: function_dbd6fcc6
	Namespace: zodcompanionutility
	Checksum: 0x8A82438C
	Offset: 0x7C48
	Size: 0x88
	Parameters: 0
	Flags: None
*/
function function_dbd6fcc6()
{
	self.var_2f03f56a = [];
	self.var_2f03f56a[0] = "double_points";
	self.var_2f03f56a[1] = "fire_sale";
	self.var_2f03f56a[2] = "insta_kill";
	self.var_2f03f56a[3] = "nuke";
	self.var_2f03f56a[4] = "full_ammo";
	self.var_2f03f56a[5] = "insta_kill_ug";
}

/*
	Name: define_new_leader
	Namespace: zodcompanionutility
	Checksum: 0x81278BE
	Offset: 0x7CD8
	Size: 0x252
	Parameters: 0
	Flags: None
*/
function define_new_leader()
{
	if(isdefined(level.var_1a612d42) && level.var_1a612d42.eligible_leader)
	{
		self.leader = level.var_1a612d42;
	}
	else
	{
		var_4266300b = (getdvarint(#"hash_6d35b5921943876a", 1) ? 32 : 200);
		a_potential_leaders = get_potential_leaders(self, var_4266300b);
		closest_leader = undefined;
		closest_distance = 1000000;
		if(a_potential_leaders.size == 0)
		{
			self.leader = undefined;
		}
		else
		{
			if(getdvarint(#"hash_6d35b5921943876a", 1))
			{
				foreach(potential_leader in a_potential_leaders)
				{
					if(distancesquared(potential_leader.entity.origin, potential_leader.goal_pos) < sqr(var_4266300b))
					{
						self.leader = potential_leader.entity;
						break;
					}
				}
			}
			else
			{
				foreach(potential_leader in a_potential_leaders)
				{
					if(potential_leader.path_distance < closest_distance)
					{
						closest_distance = potential_leader.path_distance;
						self.leader = potential_leader.entity;
					}
				}
			}
		}
	}
}

/*
	Name: get_potential_leaders
	Namespace: zodcompanionutility
	Checksum: 0x6AA34329
	Offset: 0x7F38
	Size: 0x270
	Parameters: 2
	Flags: None
*/
function get_potential_leaders(companion, var_4266300b)
{
	a_potential_leaders = [];
	potential_targets = [];
	var_8d6705e8 = [];
	players = getplayers();
	foreach(player in players)
	{
		if(!zodcompanionbehavior::_isvalidplayer(player))
		{
			continue;
		}
		if(!isdefined(player.eligible_leader))
		{
			player.eligible_leader = 1;
		}
		if(!is_true(player.eligible_leader))
		{
			continue;
		}
		positiononnavmesh = getclosestpointonnavmesh(player.origin, var_4266300b);
		if(isdefined(positiononnavmesh))
		{
			potential_targets[potential_targets.size] = player;
			var_8d6705e8[var_8d6705e8.size] = positiononnavmesh;
		}
	}
	if(!potential_targets.size)
	{
		return a_potential_leaders;
	}
	var_674755ca = function_5cb65d8a(companion.origin, var_8d6705e8, companion, companion getpathfindingradius(), companion function_6a9ae71(), -1, -1, 5000);
	if(!isdefined(var_674755ca))
	{
		return a_potential_leaders;
	}
	for(i = 0; i < var_674755ca.size; i++)
	{
		if(var_674755ca[i] >= 0)
		{
			leader = {#entity:potential_targets[i], #goal_pos:var_8d6705e8[i], #path_distance:var_674755ca[i]};
			a_potential_leaders[a_potential_leaders.size] = leader;
		}
	}
	return a_potential_leaders;
}

/*
	Name: function_14f3d97b
	Namespace: zodcompanionutility
	Checksum: 0x6C5D194E
	Offset: 0x81B0
	Size: 0x248
	Parameters: 2
	Flags: None
*/
function function_14f3d97b(goalpos, var_ff1d11ed)
{
	if(!isdefined(var_ff1d11ed))
	{
		var_ff1d11ed = 0;
	}
	self endon(#"death");
	var_5a7117fb = undefined;
	if(is_true(var_ff1d11ed) && zodcompanionbehavior::function_eb957b75(self))
	{
		self function_34179e9a();
	}
	if(isdefined(goalpos))
	{
		if(distancesquared(self.origin, goalpos) <= sqr(self getpathfindingradius()))
		{
			self.var_342791dd = self.origin;
			var_5a7117fb = 1;
		}
		else
		{
			positiononnavmesh = getclosestpointonnavmesh(goalpos, self getpathfindingradius(), self getpathfindingradius());
			if(!isdefined(positiononnavmesh))
			{
				positiononnavmesh = getclosestpointonnavmesh(goalpos, 50, self getpathfindingradius());
			}
			if(isdefined(positiononnavmesh))
			{
				self.var_342791dd = positiononnavmesh;
				var_5a7117fb = 1;
			}
		}
	}
	if(is_true(var_5a7117fb))
	{
		self.exhausted = 1;
		self val::set(#"exhausted", "ignoreall", 1);
		aiutility::releaseclaimnode(self);
		self clearforcedgoal();
		self setgoal(self.var_342791dd);
		self pathmode("move allowed");
	}
	return var_5a7117fb;
}

/*
	Name: function_3fb3f41e
	Namespace: zodcompanionutility
	Checksum: 0x9DED4252
	Offset: 0x8400
	Size: 0x36
	Parameters: 1
	Flags: None
*/
function function_3fb3f41e(follow_player)
{
	if(isdefined(follow_player))
	{
		self.leader = follow_player;
		self.leader.eligible_leader = 1;
	}
}

/*
	Name: function_633d6f7b
	Namespace: zodcompanionutility
	Checksum: 0xE178F086
	Offset: 0x8440
	Size: 0xBC
	Parameters: 1
	Flags: None
*/
function function_633d6f7b(var_ff1d11ed)
{
	if(!isdefined(var_ff1d11ed))
	{
		var_ff1d11ed = 1;
	}
	if(is_true(var_ff1d11ed) && zodcompanionbehavior::function_eb957b75(self))
	{
		self function_34179e9a();
	}
	self.exhausted = undefined;
	self val::reset(#"exhausted", "ignoreall");
	self.pushable = 1;
	self pathmode("move allowed");
}

/*
	Name: function_fc7a4f48
	Namespace: zodcompanionutility
	Checksum: 0x960058B6
	Offset: 0x8508
	Size: 0x428
	Parameters: 2
	Flags: None
*/
function function_fc7a4f48(goalpos, var_f36009e2)
{
	if(!isdefined(var_f36009e2))
	{
		var_f36009e2 = 0;
	}
	if(zodcompanionbehavior::function_6379110b(self))
	{
		return 0;
	}
	if(zodcompanionbehavior::function_63ea1da8(self))
	{
		return 0;
	}
	if(namespace_47c5b560::function_a69c4b69(self))
	{
		/#
			if(getdvarint(#"hash_1b2cf8e5ac354d32", 0))
			{
				println(("" + "") + goalpos);
			}
		#/
		self.var_a8130f46 = {#hash_f36009e2:var_f36009e2, #goalpos:goalpos};
		return 1;
	}
	if(isdefined(self.var_a72ffc1e))
	{
		/#
			if(getdvarint(#"hash_1b2cf8e5ac354d32", 0))
			{
				println("" + "");
			}
		#/
		self flag::clear(#"hash_3218e127380e4a29");
		self notify(#"hash_6edebe8930290c3b");
	}
	self.var_9140144d = undefined;
	var_5a7117fb = 0;
	if(isdefined(goalpos))
	{
		if(distancesquared(self.origin, goalpos) <= sqr(self.goalradius))
		{
			self.var_a72ffc1e = undefined;
			var_5a7117fb = 1;
		}
		else
		{
			if(var_f36009e2)
			{
				self.var_a72ffc1e = goalpos;
				var_5a7117fb = 1;
			}
			else
			{
				positiononnavmesh = getclosestpointonnavmesh(goalpos, self getpathfindingradius(), self getpathfindingradius());
				if(!isdefined(positiononnavmesh))
				{
					positiononnavmesh = getclosestpointonnavmesh(goalpos, 256, self getpathfindingradius());
				}
				if(isdefined(positiononnavmesh))
				{
					self.var_a72ffc1e = positiononnavmesh;
					var_5a7117fb = 1;
				}
			}
		}
	}
	if(var_5a7117fb)
	{
		/#
			if(getdvarint(#"hash_1b2cf8e5ac354d32", 0))
			{
				println(("" + "") + goalpos);
			}
		#/
		self.var_9140144d = goalpos;
		if(isdefined(self.var_a72ffc1e))
		{
			self pathmode("move allowed");
			self val::set(#"hash_5a1605e61cf90569", "ignoreall", 1);
			aiutility::releaseclaimnode(self);
			self clearforcedgoal();
			self flag::clear(#"hash_3218e127380e4a29");
			if(!self function_c2725e7e(self.var_a72ffc1e))
			{
				self setgoal(self.var_a72ffc1e, 1);
				self thread function_9660ee54();
			}
		}
		else
		{
			self flag::set(#"hash_3218e127380e4a29");
		}
	}
	return var_5a7117fb;
}

/*
	Name: function_9660ee54
	Namespace: zodcompanionutility
	Checksum: 0x1870029A
	Offset: 0x8938
	Size: 0x254
	Parameters: 0
	Flags: Private
*/
function private function_9660ee54()
{
	var_17b7891d = "8f51a1643370f5e" + #"hash_27c2dda34d73743a";
	self notify(var_17b7891d);
	self endon(var_17b7891d);
	level endon(#"end_game");
	self endon(#"hash_6edebe8930290c3b", #"death");
	while(true)
	{
		self waittill(#"goal");
		if(distancesquared(self.origin, self.var_a72ffc1e) > sqr(self.goalradius))
		{
			/#
				if(getdvarint(#"hash_1b2cf8e5ac354d32", 0))
				{
					println((((("" + "") + self.origin) + "") + self.var_a72ffc1e) + "");
				}
			#/
			waitframe(1);
		}
		else
		{
			break;
		}
	}
	/#
		if(getdvarint(#"hash_1b2cf8e5ac354d32", 0))
		{
			println(("" + "") + self.origin);
		}
	#/
	self pathmode("dont move", 1);
	self.var_a72ffc1e = undefined;
	self val::reset(#"hash_5a1605e61cf90569", "ignoreall");
	self val::set(#"hash_5a1605e61cf90569", "prioritize_target_near_leader", 0);
	self flag::set(#"hash_3218e127380e4a29");
	self thread function_706cbe78();
}

/*
	Name: function_706cbe78
	Namespace: zodcompanionutility
	Checksum: 0xACAF3E06
	Offset: 0x8B98
	Size: 0x8C
	Parameters: 0
	Flags: Private
*/
function private function_706cbe78()
{
	if(isdefined(self.var_fab98b03))
	{
		foreach(callback in self.var_fab98b03)
		{
			self thread [[callback]]();
		}
	}
}

/*
	Name: function_34179e9a
	Namespace: zodcompanionutility
	Checksum: 0x96E5BFB8
	Offset: 0x8C30
	Size: 0x21E
	Parameters: 0
	Flags: None
*/
function function_34179e9a()
{
	if(isdefined(self.var_9140144d))
	{
		/#
			if(getdvarint(#"hash_1b2cf8e5ac354d32", 0))
			{
				println("" + "");
			}
		#/
		self pathmode("move allowed");
		var_1f2328d0 = self function_4794d6a3();
		if(isdefined(var_1f2328d0.goalpos))
		{
			if(var_1f2328d0.goalpos === self.var_a72ffc1e || var_1f2328d0.goalpos === self.var_9140144d)
			{
				self clearpath();
				self clearforcedgoal();
				self setgoal(self.origin);
			}
			else
			{
				self clearforcedgoal();
				self setgoal(var_1f2328d0.goalpos);
			}
			self.next_move_time = gettime();
		}
		self.var_9140144d = undefined;
		self.var_a72ffc1e = undefined;
		self val::reset(#"hash_5a1605e61cf90569", "ignoreall");
		self val::reset(#"hash_5a1605e61cf90569", "prioritize_target_near_leader");
		self function_e13a5dec();
		self flag::clear(#"hash_3218e127380e4a29");
		self notify(#"hash_6edebe8930290c3b");
	}
	self.var_a8130f46 = undefined;
}

/*
	Name: function_fc67b7ed
	Namespace: zodcompanionutility
	Checksum: 0xF43859C3
	Offset: 0x8E58
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function function_fc67b7ed(func)
{
	if(!isdefined(self.var_fab98b03))
	{
		self.var_fab98b03 = [];
	}
	self.var_fab98b03[self.var_fab98b03.size] = func;
}

/*
	Name: function_30df05d5
	Namespace: zodcompanionutility
	Checksum: 0xE40B7780
	Offset: 0x8EA0
	Size: 0xA4
	Parameters: 1
	Flags: None
*/
function function_30df05d5(func)
{
	foreach(index, callback in self.var_fab98b03)
	{
		if(callback == func)
		{
			arrayremoveindex(self.var_fab98b03, index, 0);
			break;
		}
	}
}

/*
	Name: function_3419fc55
	Namespace: zodcompanionutility
	Checksum: 0x254AB089
	Offset: 0x8F50
	Size: 0xA
	Parameters: 0
	Flags: None
*/
function function_3419fc55()
{
	return self.var_fab98b03;
}

/*
	Name: function_edaf4203
	Namespace: zodcompanionutility
	Checksum: 0xBE74C859
	Offset: 0x8F68
	Size: 0x7E
	Parameters: 0
	Flags: Private
*/
function private function_edaf4203()
{
	foreach(var_182df905 in self.var_c7f5b6e1)
	{
		var_182df905.reserved = 1;
	}
}

/*
	Name: function_26b4d2aa
	Namespace: zodcompanionutility
	Checksum: 0xD0C42620
	Offset: 0x8FF0
	Size: 0x46
	Parameters: 0
	Flags: None
*/
function function_26b4d2aa()
{
	if(isdefined(self.var_c7f5b6e1) && self.var_c7f5b6e1.size > 0)
	{
		return is_true(self.var_c7f5b6e1[0].reserved);
	}
	return 0;
}

/*
	Name: function_ae69d4a5
	Namespace: zodcompanionutility
	Checksum: 0x71E031F2
	Offset: 0x9040
	Size: 0x1DC
	Parameters: 0
	Flags: None
*/
function function_ae69d4a5()
{
	/#
		if(getdvarint(#"hash_1b2cf8e5ac354d32", 0))
		{
			println("" + "");
		}
	#/
	if(isdefined(self.var_a8130f46))
	{
		/#
			if(getdvarint(#"hash_1b2cf8e5ac354d32", 0))
			{
				println(("" + "") + self.var_a8130f46.goalpos);
			}
		#/
		self function_fc7a4f48(self.var_a8130f46.goalpos, self.var_a8130f46.var_f36009e2);
		self.var_a8130f46 = undefined;
		return;
	}
	var_793f966c = self function_26b4d2aa();
	if(!var_793f966c && isdefined(self.var_a72ffc1e))
	{
		/#
			if(getdvarint(#"hash_1b2cf8e5ac354d32", 0))
			{
				println(("" + "") + self.var_a72ffc1e);
			}
		#/
		self clearforcedgoal();
		self setgoal(self.var_a72ffc1e, 1);
		self thread function_9660ee54();
	}
}

/*
	Name: function_681263de
	Namespace: zodcompanionutility
	Checksum: 0x6A2CF80F
	Offset: 0x9228
	Size: 0xDC
	Parameters: 0
	Flags: None
*/
function function_681263de()
{
	/#
		if(getdvarint(#"hash_1b2cf8e5ac354d32", 0))
		{
			println("" + "");
		}
	#/
	self.var_c7f5b6e1 = undefined;
	if(zodcompanionbehavior::function_eb957b75(self))
	{
		/#
			if(getdvarint(#"hash_1b2cf8e5ac354d32", 0))
			{
				println("" + "");
			}
		#/
		self function_34179e9a();
	}
}

/*
	Name: function_878dd91
	Namespace: zodcompanionutility
	Checksum: 0xA10CD791
	Offset: 0x9310
	Size: 0x52
	Parameters: 1
	Flags: None
*/
function function_878dd91(var_182df905)
{
	if(isdefined(self.var_9140144d))
	{
		if(!isdefined(self.var_a72ffc1e) || !is_true(var_182df905.reserved))
		{
			return false;
		}
	}
	return true;
}

/*
	Name: function_c2725e7e
	Namespace: zodcompanionutility
	Checksum: 0x4859369B
	Offset: 0x9370
	Size: 0x118
	Parameters: 1
	Flags: Private
*/
function private function_c2725e7e(goal)
{
	self function_e13a5dec();
	if(self namespace_47c5b560::function_a6b0387d(self.origin, goal, 1))
	{
		self function_edaf4203();
		/#
			if(getdvarint(#"hash_1b2cf8e5ac354d32", 0))
			{
				println(("" + "") + goal);
			}
		#/
		return true;
	}
	/#
		if(getdvarint(#"hash_1b2cf8e5ac354d32", 0))
		{
			println(("" + "") + goal);
		}
	#/
	self.var_c7f5b6e1 = undefined;
	return false;
}

/*
	Name: function_e13a5dec
	Namespace: zodcompanionutility
	Checksum: 0x4210E6B3
	Offset: 0x9490
	Size: 0xBE
	Parameters: 0
	Flags: Private
*/
function private function_e13a5dec()
{
	if(self namespace_47c5b560::function_72371f2a() && isdefined(self.v_zombie_custom_goal_pos))
	{
		/#
			if(getdvarint(#"hash_1b2cf8e5ac354d32", 0))
			{
				println("" + "");
			}
		#/
		self namespace_47c5b560::function_c2576f59();
		self namespace_47c5b560::function_240680df();
		self.var_2b5f41fd = undefined;
		self.var_c7f5b6e1 = undefined;
	}
}

/*
	Name: function_60dcf99d
	Namespace: zodcompanionutility
	Checksum: 0x566599A7
	Offset: 0x9558
	Size: 0x94
	Parameters: 1
	Flags: None
*/
function function_60dcf99d(var_ac5f535)
{
	if(is_true(var_ac5f535))
	{
		self.var_fee1e0f4 = 1;
		self val::reset(#"zod_companion", "ignoreme");
	}
	else
	{
		self.var_fee1e0f4 = undefined;
		self val::set(#"zod_companion", "ignoreme", 1);
	}
}

/*
	Name: function_be70ddb1
	Namespace: zodcompanionutility
	Checksum: 0x810BB948
	Offset: 0x95F8
	Size: 0x1C
	Parameters: 0
	Flags: None
*/
function function_be70ddb1()
{
	return true;
}

/*
	Name: function_423c790b
	Namespace: zodcompanionutility
	Checksum: 0xDB552B1D
	Offset: 0x9620
	Size: 0x32
	Parameters: 1
	Flags: None
*/
function function_423c790b(speed)
{
	self.var_20b90c56 = math::clamp(speed, 0, 100);
}

