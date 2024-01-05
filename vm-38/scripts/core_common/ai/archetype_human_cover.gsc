#using scripts\core_common\util_shared.gsc;
#using script_178024232e91b0a1;
#using scripts\core_common\laststand_shared.gsc;
#using script_4a3f9b8905878272;
#using scripts\core_common\ai\archetype_utility.gsc;
#using script_3aa0f32b70d4f7cb;
#using script_59f07c660e6710a5;
#using script_7b7ed6e4bc963a51;
#using scripts\core_common\ai_shared.gsc;

#namespace archetype_human_cover;

/*
	Name: function_3a38f3e0
	Namespace: archetype_human_cover
	Checksum: 0x8A186FE2
	Offset: 0x1D0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_3a38f3e0()
{
	level notify(-1342521349);
}

/*
	Name: registerbehaviorscriptfunctions
	Namespace: archetype_human_cover
	Checksum: 0xCDA5A11A
	Offset: 0x1F0
	Size: 0xA5C
	Parameters: 0
	Flags: AutoExec
*/
function autoexec registerbehaviorscriptfunctions()
{
	/#
		assert(isscriptfunctionptr(&shouldreturntocovercondition));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"shouldreturntocovercondition", &shouldreturntocovercondition);
	/#
		assert(isscriptfunctionptr(&shouldreturntosuppressedcover));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"shouldreturntosuppressedcover", &shouldreturntosuppressedcover);
	/#
		assert(isscriptfunctionptr(&shouldadjusttocover));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"shouldadjusttocover", &shouldadjusttocover);
	/#
		assert(isscriptfunctionptr(&prepareforadjusttocover));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"prepareforadjusttocover", &prepareforadjusttocover);
	/#
		assert(isscriptfunctionptr(&coverblindfireshootstart));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"coverblindfireshootstart", &coverblindfireshootstart);
	/#
		assert(isscriptfunctionptr(&function_49bbbf20));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_52c510ceb34186b1", &function_49bbbf20);
	/#
		assert(isscriptfunctionptr(&canchangestanceatcovercondition));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"canchangestanceatcovercondition", &canchangestanceatcovercondition);
	/#
		assert(isscriptfunctionptr(&coverchangestanceactionstart));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"coverchangestanceactionstart", &coverchangestanceactionstart);
	/#
		assert(isscriptfunctionptr(&preparetochangestancetostand));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"preparetochangestancetostand", &preparetochangestancetostand);
	/#
		assert(isscriptfunctionptr(&preparetochangestancetostand));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"preparetochangestancetostand", &preparetochangestancetostand);
	/#
		assert(isscriptfunctionptr(&cleanupchangestancetostand));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"cleanupchangestancetostand", &cleanupchangestancetostand);
	/#
		assert(isscriptfunctionptr(&preparetochangestancetocrouch));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"preparetochangestancetocrouch", &preparetochangestancetocrouch);
	/#
		assert(isscriptfunctionptr(&cleanupchangestancetocrouch));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"cleanupchangestancetocrouch", &cleanupchangestancetocrouch);
	/#
		assert(isscriptfunctionptr(&function_79c0ab14));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_116da7e421d7a68a", &function_79c0ab14);
	/#
		assert(isscriptfunctionptr(&function_bdba5c4));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_2c78dc566cc6dc6c", &function_bdba5c4);
	/#
		assert(isscriptfunctionptr(&function_9d8b22d8));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_6981f2035bc41f65", &function_9d8b22d8);
	/#
		assert(isscriptfunctionptr(&coverpreparetothrowgrenade));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"coverpreparetothrowgrenade", &coverpreparetothrowgrenade);
	/#
		assert(isscriptfunctionptr(&covercleanuptothrowgrenade));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"covercleanuptothrowgrenade", &covercleanuptothrowgrenade);
	/#
		assert(isscriptfunctionptr(&function_6e9ba2ac));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_5734f7a752b4150b", &function_6e9ba2ac);
	/#
		assert(isscriptfunctionptr(&aiutility::function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_5b614e766fc4d283", &aiutility::function_8f12f910);
	/#
		assert(isscriptfunctionptr(&aiutility::function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_2078ca98b094c39", &aiutility::function_8f12f910);
	/#
		assert(isscriptfunctionptr(&aiutility::function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_914aa2c9d4ad21c", &aiutility::function_8f12f910);
	/#
		assert(isscriptfunctionptr(&aiutility::function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"switchtogrenadelauncher", &aiutility::function_8f12f910);
	/#
		assert(isscriptfunctionptr(&aiutility::function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"switchtolightninggun", &aiutility::function_8f12f910);
	/#
		assert(isscriptfunctionptr(&aiutility::function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"switchtoannihilator", &aiutility::function_8f12f910);
	/#
		util::init_dvar("", 0, &function_9c20a620);
	#/
}

/*
	Name: function_9c20a620
	Namespace: archetype_human_cover
	Checksum: 0x573A671
	Offset: 0xC58
	Size: 0x3C
	Parameters: 1
	Flags: Private
*/
function private function_9c20a620(parms)
{
	/#
		level.var_6324e9e5[parms.name] = int(parms.value);
	#/
}

/*
	Name: function_9d8b22d8
	Namespace: archetype_human_cover
	Checksum: 0x2A6D9C9F
	Offset: 0xCA0
	Size: 0xC52
	Parameters: 3
	Flags: Linked
*/
function function_9d8b22d8(entity, throwifpossible, var_f06df42)
{
	if(!isdefined(throwifpossible))
	{
		throwifpossible = 0;
	}
	if(!isdefined(var_f06df42))
	{
		var_f06df42 = 1;
	}
	if(is_true(self.hero) && is_true(self.var_6fe3ea59))
	{
		throwifpossible = 1;
	}
	/#
		if(is_true(level.var_6324e9e5[#"hash_555b62c2fb0fbb4e"]))
		{
			throwifpossible = 1;
			if(isdefined(entity.grenadeammo) && entity.grenadeammo <= 0)
			{
				entity.grenadeammo = 1;
			}
		}
	#/
	if(is_true(level.aidisablegrenadethrows))
	{
		return false;
	}
	if(gettime() == entity.birthtime)
	{
		return false;
	}
	if(var_f06df42)
	{
		if(isdefined(level.var_7f6cef33) && isdefined(level.var_7f6cef33[entity.team]))
		{
			var_60777597 = gettime() - level.var_7f6cef33[entity.team];
			if(var_60777597 < 3000)
			{
				return false;
			}
		}
	}
	if(!isdefined(entity.var_38754eac))
	{
		if(!isdefined(entity.enemy))
		{
			return false;
		}
		if(!issentient(entity.enemy))
		{
			return false;
		}
		if(isvehicle(entity.enemy) && isairborne(entity.enemy))
		{
			return false;
		}
		if(isplayer(entity.enemy) && entity.enemy laststand::player_is_in_laststand())
		{
			return false;
		}
		if(isdefined(entity.var_b28feab5) && gettime() < entity.var_b28feab5)
		{
			return false;
		}
	}
	if(isdefined(entity.grenadeammo) && entity.grenadeammo <= 0)
	{
		return false;
	}
	if(ai::hasaiattribute(entity, "useGrenades") && !ai::getaiattribute(entity, "useGrenades"))
	{
		return false;
	}
	entityangles = entity.angles;
	if(function_4387243d(entity))
	{
		entityangles = entity.node.angles;
	}
	if(isdefined(entity.var_38754eac))
	{
		/#
			assert(isvec(entity.var_38754eac));
		#/
		throwifpossible = 1;
		var_4748f6aa = entity.var_38754eac;
	}
	else
	{
		enemyorigin = entity lastknownpos(entity.enemy);
		accuracy = 1;
		if(isdefined(level.s_game_difficulty) && isdefined(level.gameskill))
		{
			accuracy = level.s_game_difficulty[level.gameskill].base_enemy_accuracy;
		}
		maxdistance = 128 / accuracy;
		var_4748f6aa = (enemyorigin[0] + (maxdistance * (randomfloatrange(-1, 1))), enemyorigin[1] + (maxdistance * (randomfloatrange(-1, 1))), enemyorigin[2]);
	}
	totarget = var_4748f6aa - entity.origin;
	totarget = vectornormalize((totarget[0], totarget[1], 0));
	entityforward = anglestoforward(entityangles);
	entityforward = vectornormalize((entityforward[0], entityforward[1], 0));
	var_bdfbce20 = vectordot(totarget, entityforward);
	var_8de1b8f1 = 25;
	var_eb57f968 = cos(var_8de1b8f1);
	if(var_f06df42)
	{
		var_b3989cb8 = 60;
		var_7f68850f = cos(var_b3989cb8);
		if(var_bdfbce20 < var_7f68850f)
		{
			return false;
		}
		if(var_bdfbce20 < var_eb57f968)
		{
			if(isdefined(entity.var_38754eac))
			{
				return false;
			}
			anglestotarget = vectortoangles(totarget);
			var_507685eb = angleclamp180(anglestotarget[1] - entityangles[1]);
			var_ff1c6742 = abs(var_507685eb) / var_507685eb;
			var_af743256 = rotatepointaroundaxis(entityforward, (0, 0, 1), var_8de1b8f1 * var_ff1c6742);
			var_59a9f5cc = var_4748f6aa;
			var_cc358029 = distance(entity.origin, var_4748f6aa);
			var_4748f6aa = entity.origin + (var_af743256 * var_cc358029);
		}
	}
	else if(var_bdfbce20 < var_eb57f968)
	{
		return false;
	}
	if(!throwifpossible)
	{
		friendlyplayers = getplayers(entity.team);
		allplayers = getplayers();
		if(isdefined(friendlyplayers) && friendlyplayers.size)
		{
			foreach(player in friendlyplayers)
			{
				if(distancesquared(var_4748f6aa, player.origin) <= 640000)
				{
					return false;
				}
			}
		}
		if(isdefined(allplayers) && allplayers.size)
		{
			foreach(player in allplayers)
			{
				if(isdefined(player) && player laststand::player_is_in_laststand() && distancesquared(var_4748f6aa, player.origin) <= 640000)
				{
					return false;
				}
			}
		}
		grenadethrowinfos = blackboard::getblackboardevents("self_grenade_throw");
		foreach(grenadethrowinfo in grenadethrowinfos)
		{
			if(grenadethrowinfo.data.grenadethrower == entity)
			{
				return false;
			}
		}
		grenadethrowinfos = blackboard::getblackboardevents("team_grenade_throw");
		foreach(grenadethrowinfo in grenadethrowinfos)
		{
			if(grenadethrowinfo.data.grenadethrowerteam === entity.team)
			{
				return false;
			}
		}
		grenadethrowinfos = blackboard::getblackboardevents("target_grenade_throw");
		foreach(grenadethrowinfo in grenadethrowinfos)
		{
			if(isdefined(grenadethrowinfo.data.grenadethrownat) && isalive(grenadethrowinfo.data.grenadethrownat))
			{
				if(grenadethrowinfo.data.grenadethrownat == entity.enemy)
				{
					return false;
				}
				if(isdefined(grenadethrowinfo.data.grenadethrownposition) && distancesquared(grenadethrowinfo.data.grenadethrownposition, var_4748f6aa) <= 1440000)
				{
					return false;
				}
			}
		}
	}
	throw_dist = distance2dsquared(entity.origin, var_4748f6aa);
	if(throw_dist < sqr(500) || throw_dist > sqr(1250))
	{
		return false;
	}
	arm_offset = undefined;
	if(isdefined(entity.var_ce7a311e))
	{
		arm_offset = [[entity.var_ce7a311e]](entity, var_4748f6aa);
	}
	else
	{
		arm_offset = temp_get_arm_offset(entity, var_4748f6aa);
	}
	throw_vel = entity canthrowgrenadepos(arm_offset, var_4748f6aa);
	if(!isdefined(throw_vel))
	{
		return false;
	}
	var_376e55ae = vectordot(vectornormalize(throw_vel), (0, 0, 1));
	if(var_376e55ae > 0.8192)
	{
		return false;
	}
	entity.grenadethrowposition = var_4748f6aa;
	if(var_f06df42)
	{
		level.var_7f6cef33[entity.team] = gettime();
	}
	entity.var_8a3fd1b2 = entity.health;
	return true;
}

/*
	Name: function_4387243d
	Namespace: archetype_human_cover
	Checksum: 0xA802D527
	Offset: 0x1900
	Size: 0x74
	Parameters: 1
	Flags: Linked, Private
*/
function private function_4387243d(entity)
{
	if(aiutility::isatcoverstrictcondition(entity))
	{
		if(is_true(entity.var_b8cc25c) && (isdefined(entity.var_342553bc) && entity.var_342553bc !== 1))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: coverpreparetothrowgrenade
	Namespace: archetype_human_cover
	Checksum: 0xED9DB0DC
	Offset: 0x1980
	Size: 0x5E
	Parameters: 1
	Flags: Linked, Private
*/
function private coverpreparetothrowgrenade(entity)
{
	aiutility::keepclaimednodeandchoosecoverdirection(entity);
	entity setblackboardattribute("_cover_mode", "cover_alert");
	entity.preparegrenadeammo = entity.grenadeammo;
}

/*
	Name: function_ce446f2e
	Namespace: archetype_human_cover
	Checksum: 0x2C3CD82D
	Offset: 0x19E8
	Size: 0x14C
	Parameters: 1
	Flags: Linked
*/
function function_ce446f2e(entity)
{
	/#
		assert(isdefined(entity.grenadethrowposition));
	#/
	grenadethrowinfo = spawnstruct();
	grenadethrowinfo.grenadethrower = entity;
	grenadethrowinfo.grenadethrowerteam = entity.team;
	if(!isdefined(entity.var_38754eac))
	{
		grenadethrowinfo.grenadethrownat = entity.enemy;
	}
	grenadethrowinfo.grenadethrownposition = entity.grenadethrowposition;
	blackboard::addblackboardevent("self_grenade_throw", grenadethrowinfo, randomintrange(5000, 10000));
	blackboard::addblackboardevent("team_grenade_throw", grenadethrowinfo, randomintrange(5000, 10000));
	blackboard::addblackboardevent("target_grenade_throw", grenadethrowinfo, randomintrange(30000, 60000));
	entity grenadethrow();
}

/*
	Name: function_83c0b7e1
	Namespace: archetype_human_cover
	Checksum: 0x1C545D81
	Offset: 0x1B40
	Size: 0x210
	Parameters: 1
	Flags: Linked
*/
function function_83c0b7e1(entity)
{
	entityangles = entity.angles;
	if(function_4387243d(entity))
	{
		entityangles = entity.node.angles;
	}
	var_5864b659 = (anglestoforward(entityangles + (vectorscale((-1, 0, 0), 45)))) * 350;
	grenade_origin = entity gettagorigin("j_wrist_ri");
	grenadethrowinfo = spawnstruct();
	grenadethrowinfo.grenadethrower = entity;
	grenadethrowinfo.grenadethrowerteam = entity.team;
	if(!isdefined(entity.var_38754eac))
	{
		grenadethrowinfo.grenadethrownat = entity.enemy;
	}
	grenadethrowinfo.grenadethrownposition = grenade_origin;
	blackboard::addblackboardevent("self_grenade_throw", grenadethrowinfo, randomintrange(5000, 10000));
	blackboard::addblackboardevent("team_grenade_throw", grenadethrowinfo, randomintrange(5000, 10000));
	blackboard::addblackboardevent("target_grenade_throw", grenadethrowinfo, randomintrange(30000, 60000));
	entity magicgrenadetype(entity.grenadeweapon, grenade_origin, var_5864b659, float(entity.grenadeweapon.aifusetime) / 1000);
	entity.grenadeammo--;
}

/*
	Name: covercleanuptothrowgrenade
	Namespace: archetype_human_cover
	Checksum: 0x4D0527FA
	Offset: 0x1D58
	Size: 0x22E
	Parameters: 1
	Flags: Linked, Private
*/
function private covercleanuptothrowgrenade(entity)
{
	aiutility::resetcoverparameters(entity);
	if(entity.preparegrenadeammo == entity.grenadeammo)
	{
		if(entity.health <= 0 || entity.var_8a3fd1b2 != entity.health)
		{
			grenade = undefined;
			if(isactor(entity.enemy) && isdefined(entity.grenadeweapon))
			{
				grenade = entity.enemy magicgrenadetype(entity.grenadeweapon, entity gettagorigin("j_wrist_ri"), (0, 0, 0), float(entity.grenadeweapon.aifusetime) / 1000);
			}
			else if(isplayer(entity.enemy) && isdefined(entity.grenadeweapon))
			{
				grenade = entity.enemy magicgrenadeplayer(entity.grenadeweapon, entity gettagorigin("j_wrist_ri"), (0, 0, 0));
			}
			if(isdefined(grenade))
			{
				grenade.owner = entity;
				grenade.team = entity.team;
				grenade setcontents(grenade setcontents(0) & (~(((32768 | 16777216) | 2097152) | 8388608)));
				grenade.var_ec078486 = 1;
			}
		}
	}
	entity.preparegrenadeammo = undefined;
	entity.grenadethrowposition = undefined;
	entity.var_8a3fd1b2 = undefined;
}

/*
	Name: function_1fa73a96
	Namespace: archetype_human_cover
	Checksum: 0x10BA41C2
	Offset: 0x1F90
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function function_1fa73a96(entity)
{
	if(isdefined(entity.preparegrenadeammo))
	{
		return true;
	}
	return false;
}

/*
	Name: function_6e9ba2ac
	Namespace: archetype_human_cover
	Checksum: 0x4CEE416E
	Offset: 0x1FC0
	Size: 0x24
	Parameters: 1
	Flags: Linked, Private
*/
function private function_6e9ba2ac(entity)
{
	aiutility::function_3823e69e(entity);
}

/*
	Name: canchangestanceatcovercondition
	Namespace: archetype_human_cover
	Checksum: 0x535324E0
	Offset: 0x1FF0
	Size: 0xAC
	Parameters: 1
	Flags: Linked, Private
*/
function private canchangestanceatcovercondition(entity)
{
	switch(entity getblackboardattribute("_stance"))
	{
		case "stand":
		{
			return entity aiutility::function_c97b59f8("crouch", entity.node);
		}
		case "crouch":
		{
			return entity aiutility::function_c97b59f8("stand", entity.node);
		}
	}
	return 0;
}

/*
	Name: shouldreturntosuppressedcover
	Namespace: archetype_human_cover
	Checksum: 0xE0F74842
	Offset: 0x20A8
	Size: 0x2E
	Parameters: 1
	Flags: Linked, Private
*/
function private shouldreturntosuppressedcover(entity)
{
	if(!entity isatgoal())
	{
		return true;
	}
	return false;
}

/*
	Name: shouldreturntocovercondition
	Namespace: archetype_human_cover
	Checksum: 0xCDFE9B3B
	Offset: 0x20E0
	Size: 0x222
	Parameters: 1
	Flags: Linked, Private
*/
function private shouldreturntocovercondition(entity)
{
	if(entity asmistransitionrunning())
	{
		return false;
	}
	if(!entity isatgoal())
	{
		var_1c4c0ef7 = 0;
		if(isdefined(entity.node))
		{
			offsetorigin = entity getnodeoffsetposition(entity.node);
			if(entity isposatgoal(offsetorigin))
			{
				var_1c4c0ef7 = 1;
			}
		}
		if(!var_1c4c0ef7)
		{
			return true;
		}
	}
	if(isdefined(entity.covershootstarttime))
	{
		var_21e419d7 = gettime() - entity.covershootstarttime;
		if(var_21e419d7 < 3000)
		{
			return false;
		}
		var_a4127fed = entity.var_a4127fed * 1000;
		if(var_21e419d7 >= var_a4127fed)
		{
			return true;
		}
		if(isdefined(entity.enemy) && isplayer(entity.enemy) && entity.enemy.health < (entity.enemy.maxhealth * 0.5))
		{
			if(var_21e419d7 < 5000)
			{
				return false;
			}
		}
	}
	if(aiutility::issuppressedatcovercondition(entity))
	{
		return true;
	}
	if(aiutility::function_22766ccd(entity) && aiutility::function_15b9bbef(entity))
	{
		return true;
	}
	if(gettime() > entity.nextfindbestcovertime && !is_true(entity.fixednode))
	{
		return true;
	}
	return false;
}

/*
	Name: shouldadjusttocover
	Namespace: archetype_human_cover
	Checksum: 0x4D9F02E
	Offset: 0x2310
	Size: 0x16E
	Parameters: 1
	Flags: Linked, Private
*/
function private shouldadjusttocover(entity)
{
	if(!isdefined(entity.node))
	{
		return false;
	}
	if(entity.node.type == "cover_turret")
	{
		return false;
	}
	highestsupportedstance = entity aiutility::gethighestnodestance(entity.node);
	currentstance = entity getblackboardattribute("_stance");
	if(currentstance == "crouch" && highestsupportedstance == "crouch")
	{
		return false;
	}
	covermode = entity getblackboardattribute("_cover_mode");
	previouscovermode = entity getblackboardattribute("_previous_cover_mode");
	if(covermode != "cover_alert" && previouscovermode != "cover_alert" && !entity.keepclaimednode)
	{
		return true;
	}
	if(!entity aiutility::function_c97b59f8(currentstance, entity.node))
	{
		return true;
	}
	return false;
}

/*
	Name: coverblindfireshootstart
	Namespace: archetype_human_cover
	Checksum: 0xD1D80136
	Offset: 0x2488
	Size: 0x7A
	Parameters: 2
	Flags: Linked, Private
*/
function private coverblindfireshootstart(entity, asmstatename)
{
	aiutility::keepclaimnode(asmstatename);
	asmstatename setblackboardattribute("_cover_mode", "cover_blind");
	aiutility::choosecoverdirection(asmstatename);
	asmstatename.var_2e7eed43 = 1;
}

/*
	Name: function_49bbbf20
	Namespace: archetype_human_cover
	Checksum: 0x854FCB07
	Offset: 0x2510
	Size: 0x2E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_49bbbf20(entity)
{
	aiutility::resetcoverparameters(entity);
	entity.var_2e7eed43 = 0;
}

/*
	Name: preparetochangestancetostand
	Namespace: archetype_human_cover
	Checksum: 0x791B444F
	Offset: 0x2548
	Size: 0x58
	Parameters: 2
	Flags: Linked, Private
*/
function private preparetochangestancetostand(entity, asmstatename)
{
	aiutility::cleanupcovermode(asmstatename);
	asmstatename setblackboardattribute("_desired_stance", "stand");
	return true;
}

/*
	Name: cleanupchangestancetostand
	Namespace: archetype_human_cover
	Checksum: 0x7FD4DA9E
	Offset: 0x25A8
	Size: 0x36
	Parameters: 2
	Flags: Linked, Private
*/
function private cleanupchangestancetostand(entity, asmstatename)
{
	aiutility::releaseclaimnode(asmstatename);
	asmstatename.newenemyreaction = 0;
}

/*
	Name: preparetochangestancetocrouch
	Namespace: archetype_human_cover
	Checksum: 0xEBE77668
	Offset: 0x25E8
	Size: 0x54
	Parameters: 2
	Flags: Linked, Private
*/
function private preparetochangestancetocrouch(entity, asmstatename)
{
	aiutility::cleanupcovermode(asmstatename);
	asmstatename setblackboardattribute("_desired_stance", "crouch");
}

/*
	Name: cleanupchangestancetocrouch
	Namespace: archetype_human_cover
	Checksum: 0x1674BE3B
	Offset: 0x2648
	Size: 0x36
	Parameters: 2
	Flags: Linked, Private
*/
function private cleanupchangestancetocrouch(entity, asmstatename)
{
	aiutility::releaseclaimnode(asmstatename);
	asmstatename.newenemyreaction = 0;
}

/*
	Name: function_79c0ab14
	Namespace: archetype_human_cover
	Checksum: 0xD9014FF
	Offset: 0x2688
	Size: 0x54
	Parameters: 2
	Flags: Linked, Private
*/
function private function_79c0ab14(entity, asmstatename)
{
	aiutility::cleanupcovermode(asmstatename);
	asmstatename setblackboardattribute("_desired_stance", "prone");
}

/*
	Name: function_bdba5c4
	Namespace: archetype_human_cover
	Checksum: 0x6A8DC909
	Offset: 0x26E8
	Size: 0x36
	Parameters: 2
	Flags: Linked, Private
*/
function private function_bdba5c4(entity, asmstatename)
{
	aiutility::releaseclaimnode(asmstatename);
	asmstatename.newenemyreaction = 0;
}

/*
	Name: prepareforadjusttocover
	Namespace: archetype_human_cover
	Checksum: 0xD5D2754C
	Offset: 0x2728
	Size: 0x74
	Parameters: 2
	Flags: Linked, Private
*/
function private prepareforadjusttocover(entity, asmstatename)
{
	aiutility::keepclaimnode(asmstatename);
	highestsupportedstance = asmstatename aiutility::gethighestnodestance(asmstatename.node);
	asmstatename setblackboardattribute("_desired_stance", highestsupportedstance);
}

/*
	Name: coverchangestanceactionstart
	Namespace: archetype_human_cover
	Checksum: 0x8B957AF5
	Offset: 0x27A8
	Size: 0xF2
	Parameters: 2
	Flags: Linked, Private
*/
function private coverchangestanceactionstart(entity, asmstatename)
{
	asmstatename setblackboardattribute("_cover_mode", "cover_alert");
	aiutility::keepclaimnode(asmstatename);
	switch(asmstatename getblackboardattribute("_stance"))
	{
		case "stand":
		{
			asmstatename setblackboardattribute("_desired_stance", "crouch");
			break;
		}
		case "crouch":
		{
			asmstatename setblackboardattribute("_desired_stance", "stand");
			break;
		}
	}
}

/*
	Name: temp_get_arm_offset
	Namespace: archetype_human_cover
	Checksum: 0xE271EA9B
	Offset: 0x28A8
	Size: 0x360
	Parameters: 2
	Flags: Linked
*/
function temp_get_arm_offset(entity, throwposition)
{
	stance = throwposition getblackboardattribute("_stance");
	arm_offset = undefined;
	if(stance == "crouch")
	{
		arm_offset = (13, -1, 56);
	}
	else
	{
		arm_offset = (14, -3, 80);
	}
	if(function_4387243d(throwposition))
	{
		if(throwposition.node.type == #"cover left")
		{
			if(stance == "crouch")
			{
				arm_offset = (-38, 15, 23);
			}
			else
			{
				arm_offset = (-45, 0, 40);
			}
		}
		else
		{
			if(throwposition.node.type == #"cover right")
			{
				if(stance == "crouch")
				{
					arm_offset = (46, 12, 26);
				}
				else
				{
					arm_offset = (34, -21, 50);
				}
			}
			else
			{
				if(throwposition.node.type == #"cover stand" || throwposition.node.type == #"conceal stand")
				{
					arm_offset = (10, 7, 77);
				}
				else
				{
					if(throwposition.node.type == #"cover crouch" || throwposition.node.type == #"cover crouch window" || throwposition.node.type == #"conceal crouch")
					{
						arm_offset = (19, 5, 60);
					}
					else if(throwposition.node.type == #"cover pillar")
					{
						leftoffset = undefined;
						rightoffset = undefined;
						if(stance == "crouch")
						{
							leftoffset = (-20, 0, 35);
							rightoffset = (34, 6, 50);
						}
						else
						{
							leftoffset = (-24, 0, 76);
							rightoffset = (24, 0, 76);
						}
						coverdirection = aiutility::function_f6d48a6a(throwposition);
						if(coverdirection == "cover_right_direction")
						{
							arm_offset = rightoffset;
						}
						else
						{
							if(coverdirection == "cover_left_direction")
							{
								arm_offset = leftoffset;
							}
							else
							{
								/#
									assertmsg("");
								#/
							}
						}
					}
				}
			}
		}
	}
	return arm_offset;
}

