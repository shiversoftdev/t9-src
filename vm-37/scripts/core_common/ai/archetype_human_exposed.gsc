#using scripts\core_common\ai\archetype_human_cover.gsc;
#using script_4a3f9b8905878272;
#using scripts\core_common\ai\archetype_utility.gsc;
#using script_178024232e91b0a1;
#using script_3aa0f32b70d4f7cb;

#namespace archetype_human_exposed;

/*
	Name: registerbehaviorscriptfunctions
	Namespace: archetype_human_exposed
	Checksum: 0xAC7E1408
	Offset: 0x230
	Size: 0x7B4
	Parameters: 0
	Flags: AutoExec
*/
function autoexec registerbehaviorscriptfunctions()
{
	/#
		assert(isscriptfunctionptr(&hascloseenemy));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("hasCloseEnemy", &hascloseenemy);
	/#
		assert(isscriptfunctionptr(&nocloseenemyservice));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("noCloseEnemyService", &nocloseenemyservice);
	/#
		assert(isscriptfunctionptr(&tryreacquireservice));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("tryReacquireService", &tryreacquireservice);
	/#
		assert(isscriptfunctionptr(&preparetoreacttoenemy));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("prepareToReactToEnemy", &preparetoreacttoenemy);
	/#
		assert(isscriptfunctionptr(&resetreactiontoenemy));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("resetReactionToEnemy", &resetreactiontoenemy);
	/#
		assert(isscriptfunctionptr(&function_fa6d93ea));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_2ec2006a59a43ce", &function_fa6d93ea);
	/#
		assert(isscriptfunctionptr(&function_66b40330));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("exposedUpdateService", &function_66b40330);
	/#
		assert(isscriptfunctionptr(&exposedshootstart));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("exposedShootStart", &exposedshootstart);
	/#
		assert(isscriptfunctionptr(&exposedshootupdate));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("exposedShootUpdate", &exposedshootupdate);
	/#
		assert(isscriptfunctionptr(&exposedshootterminate));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("exposedShootTerminate", &exposedshootterminate);
	/#
		assert(isscriptfunctionptr(&exposedreloadinitialize));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("exposedReloadInitialize", &exposedreloadinitialize);
	/#
		assert(isscriptfunctionptr(&exposedreloadterminate));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("exposedReloadTerminate", &exposedreloadterminate);
	/#
		assert(isscriptfunctionptr(&exposedsetdesiredstancetostand));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("exposedSetDesiredStanceToStand", &exposedsetdesiredstancetostand);
	/#
		assert(isscriptfunctionptr(&setpathmovedelayedrandom));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("setPathMoveDelayedRandom", &setpathmovedelayedrandom);
	/#
		assert(isscriptfunctionptr(&shouldusesidearmpistol));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("shouldUseSidearmPistol", &shouldusesidearmpistol);
	/#
		assert(isscriptfunctionptr(&function_ec3ea122));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_bf0ead963f57001", &function_ec3ea122);
	/#
		assert(isscriptfunctionptr(&function_bb575b62));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_30b41b7040b96c68", &function_bb575b62);
	/#
		assert(isscriptfunctionptr(&isusingsidearm));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"isusingsidearm", &isusingsidearm);
	/#
		assert(isscriptfunctionptr(&function_52dfff39));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_235249277c9d92c4", &function_52dfff39);
	/#
		assert(isscriptfunctionptr(&function_56512b87));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_b01c4c3e55f7cd", &function_56512b87);
}

/*
	Name: function_fa6d93ea
	Namespace: archetype_human_exposed
	Checksum: 0x8F849021
	Offset: 0x9F0
	Size: 0x14C
	Parameters: 1
	Flags: Linked
*/
function function_fa6d93ea(entity)
{
	if(btapi_locomotionbehaviorcondition(entity) && !entity shouldholdgroundagainstenemy())
	{
		return false;
	}
	if(btapi_isatcovercondition(entity))
	{
		if(entity isatcovernodestrict() && is_true(entity.var_342553bc))
		{
			if(archetype_human_cover::function_1fa73a96(entity))
			{
				return true;
			}
			if(is_true(entity.ai.reloading))
			{
				return true;
			}
			if(isdefined(entity.var_541abeb7) && (gettime() - entity.var_541abeb7) < 3000)
			{
				if(distancesquared(entity.origin, entity.var_99d0daef) < sqr(32))
				{
					return true;
				}
			}
		}
		return false;
	}
	return true;
}

/*
	Name: function_66b40330
	Namespace: archetype_human_exposed
	Checksum: 0xE3B29182
	Offset: 0xB48
	Size: 0x72
	Parameters: 1
	Flags: Linked, Private
*/
function private function_66b40330(entity)
{
	if(entity isatcovernode())
	{
		aiutility::function_3823e69e(entity);
		entity.var_342553bc = 1;
		entity.var_b8cc25c = 0;
		entity.var_f13fb34f = gettime();
		entity.var_39226de1 = entity.origin;
	}
}

/*
	Name: exposedshootstart
	Namespace: archetype_human_exposed
	Checksum: 0xCAA2E1F9
	Offset: 0xBC8
	Size: 0x3E
	Parameters: 1
	Flags: Linked, Private
*/
function private exposedshootstart(entity)
{
	aiutility::releaseclaimnode(entity);
	entity.var_b636f23b = 0;
	entity.var_a4f84a7f = entity.lastshottime;
}

/*
	Name: exposedshootupdate
	Namespace: archetype_human_exposed
	Checksum: 0xA9DEF2B
	Offset: 0xC10
	Size: 0xDE
	Parameters: 1
	Flags: Linked, Private
*/
function private exposedshootupdate(entity)
{
	if(entity asmistransitionrunning())
	{
		return;
	}
	if(entity.lastshottime > entity.var_a4f84a7f)
	{
		entity.var_b636f23b = 0;
		entity.var_a4f84a7f = entity.lastshottime;
	}
	if(isdefined(entity.enemy) && entity cansee(entity.enemy))
	{
		entity.var_b636f23b = entity.var_b636f23b + 0.05;
	}
	else
	{
		entity.var_b636f23b = 0;
	}
	if(entity.var_b636f23b >= 5)
	{
		entity.nextfindbestcovertime = gettime();
		entity.var_b636f23b = 0;
	}
}

/*
	Name: exposedshootterminate
	Namespace: archetype_human_exposed
	Checksum: 0xAF1024EF
	Offset: 0xCF8
	Size: 0x22
	Parameters: 1
	Flags: Linked, Private
*/
function private exposedshootterminate(entity)
{
	entity.var_b636f23b = undefined;
	entity.var_a4f84a7f = undefined;
}

/*
	Name: exposedreloadinitialize
	Namespace: archetype_human_exposed
	Checksum: 0xCAA0CC69
	Offset: 0xD28
	Size: 0x3C
	Parameters: 1
	Flags: Linked, Private
*/
function private exposedreloadinitialize(entity)
{
	aiutility::keepclaimnode(entity);
	aiutility::function_43a090a8(entity);
}

/*
	Name: exposedreloadterminate
	Namespace: archetype_human_exposed
	Checksum: 0x23C315A9
	Offset: 0xD70
	Size: 0x54
	Parameters: 1
	Flags: Linked, Private
*/
function private exposedreloadterminate(entity)
{
	if(isalive(entity))
	{
		aiutility::function_dc44803c(entity);
	}
	aiutility::releaseclaimnode(entity);
}

/*
	Name: preparetoreacttoenemy
	Namespace: archetype_human_exposed
	Checksum: 0x697AAE77
	Offset: 0xDD0
	Size: 0x44
	Parameters: 1
	Flags: Linked, Private
*/
function private preparetoreacttoenemy(behaviortreeentity)
{
	behaviortreeentity.newenemyreaction = 0;
	behaviortreeentity.malfunctionreaction = 0;
	behaviortreeentity pathmode("move delayed", 1, 3);
}

/*
	Name: resetreactiontoenemy
	Namespace: archetype_human_exposed
	Checksum: 0x751756E3
	Offset: 0xE20
	Size: 0x22
	Parameters: 1
	Flags: Linked, Private
*/
function private resetreactiontoenemy(behaviortreeentity)
{
	behaviortreeentity.newenemyreaction = 0;
	behaviortreeentity.malfunctionreaction = 0;
}

/*
	Name: nocloseenemyservice
	Namespace: archetype_human_exposed
	Checksum: 0x29884678
	Offset: 0xE50
	Size: 0x54
	Parameters: 1
	Flags: Linked, Private
*/
function private nocloseenemyservice(behaviortreeentity)
{
	if(isdefined(behaviortreeentity.enemy) && aiutility::hascloseenemytomelee(behaviortreeentity))
	{
		behaviortreeentity clearpath();
		return true;
	}
	return false;
}

/*
	Name: hascloseenemy
	Namespace: archetype_human_exposed
	Checksum: 0x28042BA8
	Offset: 0xEB0
	Size: 0x5A
	Parameters: 1
	Flags: Linked, Private
*/
function private hascloseenemy(behaviortreeentity)
{
	if(!isdefined(behaviortreeentity.enemy))
	{
		return false;
	}
	if(distancesquared(behaviortreeentity.origin, behaviortreeentity.enemy.origin) < 22500)
	{
		return true;
	}
	return false;
}

/*
	Name: function_56512b87
	Namespace: archetype_human_exposed
	Checksum: 0x889E0B3E
	Offset: 0xF18
	Size: 0x2A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_56512b87(entity)
{
	entity.bulletsinclip = entity.sidearm.clipsize;
	return true;
}

/*
	Name: function_52dfff39
	Namespace: archetype_human_exposed
	Checksum: 0x5C442F78
	Offset: 0xF50
	Size: 0x36
	Parameters: 1
	Flags: Linked, Private
*/
function private function_52dfff39(entity)
{
	var_52dfff39 = 0;
	if(entity.bulletsinclip <= 0)
	{
		var_52dfff39 = 1;
	}
	return var_52dfff39;
}

/*
	Name: function_bb575b62
	Namespace: archetype_human_exposed
	Checksum: 0xD6CE0527
	Offset: 0xF90
	Size: 0x10
	Parameters: 1
	Flags: Linked, Private
*/
function private function_bb575b62(entity)
{
	return true;
}

/*
	Name: isusingsidearm
	Namespace: archetype_human_exposed
	Checksum: 0x4B48082D
	Offset: 0xFA8
	Size: 0x20
	Parameters: 1
	Flags: Linked, Private
*/
function private isusingsidearm(entity)
{
	return entity.weapon != entity.primaryweapon;
}

/*
	Name: function_ec3ea122
	Namespace: archetype_human_exposed
	Checksum: 0x301D1123
	Offset: 0xFD0
	Size: 0x34
	Parameters: 1
	Flags: Linked, Private
*/
function private function_ec3ea122(entity)
{
	return !shouldusesidearmpistol(entity, sqr(500));
}

/*
	Name: shouldusesidearmpistol
	Namespace: archetype_human_exposed
	Checksum: 0xE9EEB225
	Offset: 0x1010
	Size: 0x386
	Parameters: 2
	Flags: Linked, Private
*/
function private shouldusesidearmpistol(entity, checkdistance)
{
	if(!isdefined(checkdistance))
	{
		checkdistance = sqr(300);
	}
	var_64c23a1b = 0;
	if(isdefined(entity.sidearm))
	{
		if(is_true(entity.forcesidearm))
		{
			var_64c23a1b = 1;
		}
		else if(is_true(entity.var_742cee23))
		{
			if(isdefined(entity.enemy) && distancesquared(entity.origin, entity.enemy.origin) < checkdistance)
			{
				targetangles = vectortoangles(entity.enemy.origin - entity.origin);
				entityangles = entity.angles;
				if(isdefined(entity.node) && (entity.node.type == #"cover left" || entity.node.type == #"cover right" || entity.node.type == #"cover pillar" || (entity.node.type == #"cover stand" || entity.node.type == #"conceal stand") || (entity.node.type == #"cover crouch" || entity.node.type == #"cover crouch window" || entity.node.type == #"conceal crouch")) && btapi_isatcovercondition(entity))
				{
					entityangles = entity.node.angles;
				}
				var_507685eb = angleclamp180(targetangles[1] - entityangles[1]);
				if(abs(var_507685eb) < 60)
				{
					var_64c23a1b = 1;
				}
			}
		}
	}
	/#
		var_f5093b66 = is_true(entity.usingsidearm);
		if(var_64c23a1b != var_f5093b66)
		{
			println(((("" + entity getentnum()) + "") + var_64c23a1b) + "");
		}
	#/
	entity.usingsidearm = var_64c23a1b;
	return var_64c23a1b;
}

/*
	Name: setpathmovedelayedrandom
	Namespace: archetype_human_exposed
	Checksum: 0x1C44FA2A
	Offset: 0x13A0
	Size: 0x4C
	Parameters: 2
	Flags: Linked, Private
*/
function private setpathmovedelayedrandom(behaviortreeentity, asmstatename)
{
	asmstatename pathmode("move delayed", 0, randomfloatrange(1, 3));
}

/*
	Name: exposedsetdesiredstancetostand
	Namespace: archetype_human_exposed
	Checksum: 0x3C1EC6A5
	Offset: 0x13F8
	Size: 0x7C
	Parameters: 2
	Flags: Linked, Private
*/
function private exposedsetdesiredstancetostand(behaviortreeentity, asmstatename)
{
	aiutility::keepclaimnode(asmstatename);
	currentstance = asmstatename getblackboardattribute("_stance");
	asmstatename setblackboardattribute("_desired_stance", "stand");
}

/*
	Name: tryreacquireservice
	Namespace: archetype_human_exposed
	Checksum: 0xA5BF0FBF
	Offset: 0x1480
	Size: 0x3C6
	Parameters: 1
	Flags: Linked, Private
*/
function private tryreacquireservice(behaviortreeentity)
{
	if(!isdefined(behaviortreeentity.reacquire_state))
	{
		behaviortreeentity.reacquire_state = 0;
	}
	var_d78ca29a = aiutility::function_589c524f(behaviortreeentity);
	if(var_d78ca29a == 4)
	{
		behaviortreeentity function_d4c687c9();
		behaviortreeentity.ai.var_47823ae7 = gettime() + 5000;
	}
	if(!isdefined(behaviortreeentity.enemy))
	{
		behaviortreeentity.reacquire_state = 0;
		return false;
	}
	if(aiutility::isexposedatcovercondition(behaviortreeentity))
	{
		return false;
	}
	if(isdefined(behaviortreeentity.ai.var_47823ae7) && gettime() < behaviortreeentity.ai.var_47823ae7)
	{
		behaviortreeentity.reacquire_state = 0;
		return false;
	}
	if(behaviortreeentity.birthtime + 1000 > gettime())
	{
		behaviortreeentity.reacquire_state = 0;
		return false;
	}
	if(behaviortreeentity haspath())
	{
		behaviortreeentity.reacquire_state = 0;
		return false;
	}
	if(is_true(behaviortreeentity.fixednode))
	{
		behaviortreeentity.reacquire_state = 0;
		return false;
	}
	if(behaviortreeentity seerecently(behaviortreeentity.enemy, 4))
	{
		behaviortreeentity.reacquire_state = 0;
		return false;
	}
	dirtoenemy = vectornormalize(behaviortreeentity.enemy.origin - behaviortreeentity.origin);
	forward = anglestoforward(behaviortreeentity.angles);
	if(vectordot(dirtoenemy, forward) < 0.5)
	{
		behaviortreeentity.reacquire_state = 0;
		return false;
	}
	switch(behaviortreeentity.reacquire_state)
	{
		case 0:
		case 1:
		case 2:
		{
			step_size = 32 + (behaviortreeentity.reacquire_state * 32);
			reacquirepos = behaviortreeentity reacquirestep(step_size);
			break;
		}
		case 4:
		{
			if(!behaviortreeentity cansee(behaviortreeentity.enemy) || !behaviortreeentity canshootenemy())
			{
				behaviortreeentity flagenemyunattackable();
			}
			break;
		}
		default:
		{
			if(behaviortreeentity.reacquire_state > 15)
			{
				behaviortreeentity.reacquire_state = 0;
				return false;
			}
			break;
		}
	}
	if(isvec(reacquirepos))
	{
		behaviortreeentity.ai.var_bb3caa0f = gettime();
		behaviortreeentity function_a57c34b7(reacquirepos, undefined, "exposed_reacquire");
		return true;
	}
	behaviortreeentity.reacquire_state++;
	return false;
}

