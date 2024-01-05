#using scripts\core_common\ai_shared.gsc;
#using script_489b835a247c990e;
#using scripts\core_common\ai\archetype_utility.gsc;
#using script_3aa0f32b70d4f7cb;
#using script_178024232e91b0a1;
#using script_59f07c660e6710a5;

#namespace archetype_human_locomotion;

/*
	Name: function_44bdb014
	Namespace: archetype_human_locomotion
	Checksum: 0x3C0B07B7
	Offset: 0x220
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_44bdb014()
{
	level notify(-741895871);
}

#namespace namespace_2dd2c4d8;

/*
	Name: registerbehaviorscriptfunctions
	Namespace: namespace_2dd2c4d8
	Checksum: 0x8B5B12FC
	Offset: 0x240
	Size: 0x12B4
	Parameters: 0
	Flags: AutoExec
*/
function autoexec registerbehaviorscriptfunctions()
{
	/#
		assert(isscriptfunctionptr(&prepareformovement));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"prepareformovement", &prepareformovement);
	/#
		assert(isscriptfunctionptr(&prepareformovement));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"prepareformovement", &prepareformovement);
	/#
		assert(isscriptfunctionptr(&shouldtacticalarrivecondition));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"shouldtacticalarrive", &shouldtacticalarrivecondition);
	/#
		assert(isscriptfunctionptr(&planhumanarrivalatcover));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"planhumanarrivalatcover", &planhumanarrivalatcover);
	/#
		assert(isscriptfunctionptr(&shouldplanarrivalintocover));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"shouldplanarrivalintocover", &shouldplanarrivalintocover);
	/#
		assert(iscodefunctionptr(&btapi_shouldarriveexposed));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"btapi_shouldarriveexposed", &btapi_shouldarriveexposed);
	/#
		assert(isscriptfunctionptr(&function_d68785cf));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_68e2b8b69e5739d0", &function_d68785cf);
	/#
		assert(iscodefunctionptr(&btapi_humannoncombatlocomotionupdate));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"btapi_humannoncombatlocomotionupdate", &btapi_humannoncombatlocomotionupdate);
	/#
		assert(isscriptfunctionptr(&combatlocomotionstart));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"combatlocomotionstart", &combatlocomotionstart);
	/#
		assert(isscriptfunctionptr(&function_52950d3d));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_6b12744ac88be28f", &function_52950d3d);
	/#
		assert(isscriptfunctionptr(&function_4937d436));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_5ff9dd2b25d5c185", &function_4937d436);
	/#
		assert(isscriptfunctionptr(&function_145df88b));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_57981ededd43a0de", &function_145df88b);
	/#
		assert(isscriptfunctionptr(&function_2985b5fa));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_4caa5fa7a97f83ea", &function_2985b5fa);
	/#
		assert(isscriptfunctionptr(&function_31a6aada));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_341f9ccd69da418c", &function_31a6aada);
	/#
		assert(isscriptfunctionptr(&function_41ae663f));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_cf6fb7a59d64171", &function_41ae663f);
	/#
		assert(isscriptfunctionptr(&function_76ff98aa));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_1fa0b1eca87bd7ef", &function_76ff98aa);
	/#
		assert(isscriptfunctionptr(&function_e20dbfa4));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_66f99f9da0a69762", &function_e20dbfa4);
	/#
		assert(isscriptfunctionptr(&function_888d9ea5));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_58eba240a42bbdcd", &function_888d9ea5);
	/#
		assert(isscriptfunctionptr(&function_e20dbfa4));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_66f99f9da0a69762", &function_e20dbfa4);
	/#
		assert(isscriptfunctionptr(&function_888d9ea5));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_58eba240a42bbdcd", &function_888d9ea5);
	/#
		assert(isscriptfunctionptr(&function_45d8f364));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_4160e8b3456ab234", &function_45d8f364);
	/#
		assert(isscriptfunctionptr(&function_27c368b1));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_6c5516f89d4ff0c7", &function_27c368b1);
	/#
		assert(isscriptfunctionptr(&function_45d8f364));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_4160e8b3456ab234", &function_45d8f364);
	/#
		assert(isscriptfunctionptr(&function_27c368b1));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_6c5516f89d4ff0c7", &function_27c368b1);
	/#
		assert(iscodefunctionptr(&btapi_combatlocomotionupdate));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"btapi_combatlocomotionupdate", &btapi_combatlocomotionupdate);
	/#
		assert(iscodefunctionptr(&btapi_humannoncombatlocomotioncondition));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"btapi_humannoncombatlocomotioncondition", &btapi_humannoncombatlocomotioncondition);
	/#
		assert(iscodefunctionptr(&btapi_humancombatlocomotioncondition));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"btapi_humancombatlocomotioncondition", &btapi_humancombatlocomotioncondition);
	/#
		assert(isscriptfunctionptr(&preparetostopnearenemy));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"preparetostopnearenemy", &preparetostopnearenemy);
	/#
		assert(isscriptfunctionptr(&preparetostopnearenemy));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"preparetostopnearenemy", &preparetostopnearenemy);
	/#
		assert(isscriptfunctionptr(&preparetomoveawayfromnearbyenemy));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"preparetomoveawayfromnearbyenemy", &preparetomoveawayfromnearbyenemy);
	/#
		assert(isscriptfunctionptr(&shouldtacticalwalkpain));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"shouldtacticalwalkpain", &shouldtacticalwalkpain);
	/#
		assert(isscriptfunctionptr(&begintacticalwalkpain));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"begintacticalwalkpain", &begintacticalwalkpain);
	/#
		assert(isscriptfunctionptr(&shouldcontinuetacticalwalkpain));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"shouldcontinuetacticalwalkpain", &shouldcontinuetacticalwalkpain);
	/#
		assert(isscriptfunctionptr(&bsmlocomotionhasvalidpaininterrupt));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"bsmlocomotionhasvalidpaininterrupt", &bsmlocomotionhasvalidpaininterrupt);
	/#
		assert(isscriptfunctionptr(&function_1972c057));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_61aa304b516f76a7", &function_1972c057);
	/#
		assert(isscriptfunctionptr(&function_968efd1f));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_17b044df7de84a21", &function_968efd1f);
	/#
		assert(isscriptfunctionptr(&function_80c579d8));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_2a9f4015fc6217df", &function_80c579d8);
	/#
		assert(iscodefunctionptr(&function_2da76de));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_34f3c9eb834c01fb", &function_2da76de);
	/#
		assert(iscodefunctionptr(&function_2da76de));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_34f3c9eb834c01fb", &function_2da76de);
	/#
		assert(isscriptfunctionptr(&function_c34dd9f8));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_2746da0437b7aaf9", &function_c34dd9f8);
	/#
		assert(isscriptfunctionptr(&function_f2c9142));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_77f68c7d2552ba09", &function_f2c9142);
	/#
		assert(isscriptfunctionptr(&function_d8a81861));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_3d48a4a68d62f9b2", &function_d8a81861);
	/#
		assert(isscriptfunctionptr(&function_ab6f96b6));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_25898377b0649f0e", &function_ab6f96b6);
	/#
		assert(isscriptfunctionptr(&function_7ba867a8));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_631ad7fc5b704ad", &function_7ba867a8);
	/#
		assert(isscriptfunctionptr(&function_52c3ab28));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_799d1239ee7780df", &function_52c3ab28);
	/#
		assert(isscriptfunctionptr(&function_b1092561));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_7a0baaf803e988e1", &function_b1092561);
}

/*
	Name: shouldtacticalwalkpain
	Namespace: namespace_2dd2c4d8
	Checksum: 0xEBED3B61
	Offset: 0x1500
	Size: 0x6E
	Parameters: 1
	Flags: Linked, Private
*/
function private shouldtacticalwalkpain(entity)
{
	if(!isdefined(entity.startpaintime) || (entity.startpaintime + 3000) < gettime() && randomfloat(1) > 0.25)
	{
		return bsmlocomotionhasvalidpaininterrupt(entity);
	}
	return 0;
}

/*
	Name: begintacticalwalkpain
	Namespace: namespace_2dd2c4d8
	Checksum: 0xAA3A9F62
	Offset: 0x1578
	Size: 0x1A
	Parameters: 1
	Flags: Linked, Private
*/
function private begintacticalwalkpain(entity)
{
	entity.startpaintime = gettime();
	return true;
}

/*
	Name: shouldcontinuetacticalwalkpain
	Namespace: namespace_2dd2c4d8
	Checksum: 0x6C6F5D14
	Offset: 0x15A0
	Size: 0x20
	Parameters: 1
	Flags: Linked, Private
*/
function private shouldcontinuetacticalwalkpain(entity)
{
	return (entity.startpaintime + 100) >= gettime();
}

/*
	Name: bsmlocomotionhasvalidpaininterrupt
	Namespace: namespace_2dd2c4d8
	Checksum: 0x2DA3D5F3
	Offset: 0x15C8
	Size: 0x2A
	Parameters: 1
	Flags: Linked, Private
*/
function private bsmlocomotionhasvalidpaininterrupt(entity)
{
	return entity hasvalidinterrupt("pain");
}

/*
	Name: preparetostopnearenemy
	Namespace: namespace_2dd2c4d8
	Checksum: 0xD9C597F9
	Offset: 0x1600
	Size: 0x3C
	Parameters: 1
	Flags: Linked, Private
*/
function private preparetostopnearenemy(behaviortreeentity)
{
	behaviortreeentity clearpath();
	aiutility::keepclaimnode(behaviortreeentity);
}

/*
	Name: preparetomoveawayfromnearbyenemy
	Namespace: namespace_2dd2c4d8
	Checksum: 0xD9CE52ED
	Offset: 0x1648
	Size: 0x3C
	Parameters: 1
	Flags: Linked, Private
*/
function private preparetomoveawayfromnearbyenemy(behaviortreeentity)
{
	behaviortreeentity clearpath();
	aiutility::keepclaimnode(behaviortreeentity);
}

/*
	Name: shouldplanarrivalintocover
	Namespace: namespace_2dd2c4d8
	Checksum: 0xA1E605C3
	Offset: 0x1690
	Size: 0x2BA
	Parameters: 1
	Flags: Linked, Private
*/
function private shouldplanarrivalintocover(behaviortreeentity)
{
	goingtocovernode = isdefined(behaviortreeentity.node) && iscovernode(behaviortreeentity.node) && behaviortreeentity function_4c2fffe6(behaviortreeentity.node);
	if(!goingtocovernode)
	{
		return false;
	}
	if(!aiutility::function_c94f0d1(behaviortreeentity))
	{
		return false;
	}
	if(isdefined(behaviortreeentity.pathgoalpos))
	{
		if(is_true(behaviortreeentity.ai.var_ee9a2dfd))
		{
			return true;
		}
		if(isdefined(behaviortreeentity.arrivalfinalpos))
		{
			nodeoffsetpos = behaviortreeentity getnodeoffsetposition(behaviortreeentity.node);
			if(behaviortreeentity.arrivalfinalpos != nodeoffsetpos)
			{
				return true;
			}
			if(behaviortreeentity.ai.replannedcoverarrival === 0 && isdefined(behaviortreeentity.exitpos) && isdefined(behaviortreeentity.predictedexitpos))
			{
				behaviortreeentity.ai.replannedcoverarrival = 1;
				exitdir = vectornormalize(behaviortreeentity.predictedexitpos - behaviortreeentity.exitpos);
				currentdir = vectornormalize(behaviortreeentity.origin - behaviortreeentity.exitpos);
				if(lengthsquared(exitdir) > 0.0001 && lengthsquared(currentdir) > 0.0001 && vectordot(exitdir, currentdir) < cos(30))
				{
					behaviortreeentity.predictedarrivaldirectionvalid = 0;
					return true;
				}
				var_f4f4457e = function_15a5703b(#"human", behaviortreeentity function_28e7d252());
				if(behaviortreeentity.var_2dc0ed5e !== var_f4f4457e)
				{
					return true;
				}
			}
		}
		else
		{
			return true;
		}
	}
	return false;
}

/*
	Name: combatlocomotionstart
	Namespace: namespace_2dd2c4d8
	Checksum: 0x70F07C2D
	Offset: 0x1958
	Size: 0x128
	Parameters: 1
	Flags: Linked, Private
*/
function private combatlocomotionstart(behaviortreeentity)
{
	behaviortreeentity.ai.var_9ec404f2 = behaviortreeentity getblackboardattribute("_stance");
	behaviortreeentity setblackboardattribute("_desired_stance", "stand");
	behaviortreeentity ai::function_fc7bd6c7();
	randomchance = randomint(100);
	if(randomchance > 50)
	{
		behaviortreeentity setblackboardattribute("_run_n_gun_variation", "variation_forward");
		return true;
	}
	if(randomchance > 25)
	{
		behaviortreeentity setblackboardattribute("_run_n_gun_variation", "variation_strafe_1");
		return true;
	}
	behaviortreeentity setblackboardattribute("_run_n_gun_variation", "variation_strafe_2");
	return true;
}

/*
	Name: function_52950d3d
	Namespace: namespace_2dd2c4d8
	Checksum: 0x5A3AB914
	Offset: 0x1A88
	Size: 0x38
	Parameters: 1
	Flags: Linked, Private
*/
function private function_52950d3d(behaviortreeentity)
{
	behaviortreeentity.ai.var_9ec404f2 = undefined;
	behaviortreeentity ai::function_f6060793();
	return true;
}

/*
	Name: function_3b9e6ead
	Namespace: namespace_2dd2c4d8
	Checksum: 0x59626471
	Offset: 0x1AC8
	Size: 0x4C
	Parameters: 2
	Flags: Linked
*/
function function_3b9e6ead(entity, var_cddf6299)
{
	if(function_52c3ab28(entity))
	{
		entity astsearch(var_cddf6299, "planHumanTurnAnimations");
	}
}

/*
	Name: function_4937d436
	Namespace: namespace_2dd2c4d8
	Checksum: 0xB9D89CFD
	Offset: 0x1B20
	Size: 0x138
	Parameters: 1
	Flags: Linked, Private
*/
function private function_4937d436(behaviortreeentity)
{
	behaviortreeentity setblackboardattribute("_desired_stance", "stand");
	behaviortreeentity function_ed7c3705("run_n_gun");
	behaviortreeentity ai::function_fc7bd6c7();
	behaviortreeentity.var_f334caee = 1;
	behaviortreeentity.var_e62db63f = 0;
	randomchance = randomint(100);
	if(randomchance > 50)
	{
		behaviortreeentity setblackboardattribute("_run_n_gun_variation", "variation_forward");
		return true;
	}
	if(randomchance > 25)
	{
		behaviortreeentity setblackboardattribute("_run_n_gun_variation", "variation_strafe_1");
		return true;
	}
	behaviortreeentity setblackboardattribute("_run_n_gun_variation", "variation_strafe_2");
	return true;
}

/*
	Name: function_145df88b
	Namespace: namespace_2dd2c4d8
	Checksum: 0x7AACCAEF
	Offset: 0x1C60
	Size: 0x94
	Parameters: 1
	Flags: Linked, Private
*/
function private function_145df88b(entity)
{
	if(is_true(entity.var_f334caee))
	{
		if(!entity asmistransitionrunning())
		{
			entity.var_d4a1d7ed = gettime() + 2000;
			entity.var_f334caee = undefined;
		}
	}
	if(btapi_combatlocomotionupdate(entity))
	{
		function_3b9e6ead(entity, "turn@locomotion");
		return true;
	}
	return false;
}

/*
	Name: function_2985b5fa
	Namespace: namespace_2dd2c4d8
	Checksum: 0xBAF6AD1
	Offset: 0x1D00
	Size: 0x52
	Parameters: 1
	Flags: Linked, Private
*/
function private function_2985b5fa(behaviortreeentity)
{
	behaviortreeentity ai::function_f6060793();
	behaviortreeentity function_ed7c3705("none");
	behaviortreeentity.var_d4a1d7ed = 0;
	return true;
}

/*
	Name: function_31a6aada
	Namespace: namespace_2dd2c4d8
	Checksum: 0x57040F55
	Offset: 0x1D60
	Size: 0x70
	Parameters: 1
	Flags: Linked, Private
*/
function private function_31a6aada(behaviortreeentity)
{
	behaviortreeentity setblackboardattribute("_desired_stance", "stand");
	behaviortreeentity function_ed7c3705("non_combat_run");
	behaviortreeentity ai::function_fc7bd6c7();
	return true;
}

/*
	Name: function_41ae663f
	Namespace: namespace_2dd2c4d8
	Checksum: 0xD9A2C6DA
	Offset: 0x1DD8
	Size: 0x4C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_41ae663f(entity)
{
	if(btapi_humannoncombatlocomotionupdate(entity))
	{
		function_3b9e6ead(entity, "turn@locomotion");
		return true;
	}
	return false;
}

/*
	Name: function_76ff98aa
	Namespace: namespace_2dd2c4d8
	Checksum: 0xFDA30926
	Offset: 0x1E30
	Size: 0x48
	Parameters: 1
	Flags: Linked, Private
*/
function private function_76ff98aa(behaviortreeentity)
{
	behaviortreeentity ai::function_f6060793();
	behaviortreeentity function_ed7c3705("none");
	return true;
}

/*
	Name: function_e20dbfa4
	Namespace: namespace_2dd2c4d8
	Checksum: 0xFFF4D052
	Offset: 0x1E80
	Size: 0x28
	Parameters: 1
	Flags: Linked, Private
*/
function private function_e20dbfa4(behaviortreeentity)
{
	behaviortreeentity ai::function_fc7bd6c7();
	return true;
}

/*
	Name: function_888d9ea5
	Namespace: namespace_2dd2c4d8
	Checksum: 0xB7A629CB
	Offset: 0x1EB0
	Size: 0x28
	Parameters: 1
	Flags: Linked, Private
*/
function private function_888d9ea5(behaviortreeentity)
{
	behaviortreeentity ai::function_f6060793();
	return true;
}

/*
	Name: function_45d8f364
	Namespace: namespace_2dd2c4d8
	Checksum: 0x70EA8CCB
	Offset: 0x1EE0
	Size: 0x28
	Parameters: 1
	Flags: Linked, Private
*/
function private function_45d8f364(behaviortreeentity)
{
	behaviortreeentity ai::function_fc7bd6c7();
	return true;
}

/*
	Name: function_27c368b1
	Namespace: namespace_2dd2c4d8
	Checksum: 0x364049E3
	Offset: 0x1F10
	Size: 0x28
	Parameters: 1
	Flags: Linked, Private
*/
function private function_27c368b1(behaviortreeentity)
{
	behaviortreeentity ai::function_f6060793();
	return true;
}

/*
	Name: prepareformovement
	Namespace: namespace_2dd2c4d8
	Checksum: 0x8B61E62E
	Offset: 0x1F40
	Size: 0x38
	Parameters: 1
	Flags: Linked, Private
*/
function private prepareformovement(behaviortreeentity)
{
	behaviortreeentity setblackboardattribute("_stance", "stand");
	return true;
}

/*
	Name: isarrivingfour
	Namespace: namespace_2dd2c4d8
	Checksum: 0xF27565B9
	Offset: 0x1F80
	Size: 0x32
	Parameters: 1
	Flags: Linked, Private
*/
function private isarrivingfour(arrivalangle)
{
	if(arrivalangle >= 45 && arrivalangle <= 120)
	{
		return true;
	}
	return false;
}

/*
	Name: isarrivingone
	Namespace: namespace_2dd2c4d8
	Checksum: 0x62992E38
	Offset: 0x1FC0
	Size: 0x32
	Parameters: 1
	Flags: Linked, Private
*/
function private isarrivingone(arrivalangle)
{
	if(arrivalangle >= 120 && arrivalangle <= 165)
	{
		return true;
	}
	return false;
}

/*
	Name: isarrivingtwo
	Namespace: namespace_2dd2c4d8
	Checksum: 0x4DA71372
	Offset: 0x2000
	Size: 0x32
	Parameters: 1
	Flags: Linked, Private
*/
function private isarrivingtwo(arrivalangle)
{
	if(arrivalangle >= 165 && arrivalangle <= 195)
	{
		return true;
	}
	return false;
}

/*
	Name: isarrivingthree
	Namespace: namespace_2dd2c4d8
	Checksum: 0x31A05A44
	Offset: 0x2040
	Size: 0x32
	Parameters: 1
	Flags: Linked, Private
*/
function private isarrivingthree(arrivalangle)
{
	if(arrivalangle >= 195 && arrivalangle <= 240)
	{
		return true;
	}
	return false;
}

/*
	Name: isarrivingsix
	Namespace: namespace_2dd2c4d8
	Checksum: 0xE66F75D1
	Offset: 0x2080
	Size: 0x32
	Parameters: 1
	Flags: Linked, Private
*/
function private isarrivingsix(arrivalangle)
{
	if(arrivalangle >= 240 && arrivalangle <= 315)
	{
		return true;
	}
	return false;
}

/*
	Name: isfacingfour
	Namespace: namespace_2dd2c4d8
	Checksum: 0x67ADC186
	Offset: 0x20C0
	Size: 0x32
	Parameters: 1
	Flags: Linked, Private
*/
function private isfacingfour(facingangle)
{
	if(facingangle >= 45 && facingangle <= 135)
	{
		return true;
	}
	return false;
}

/*
	Name: isfacingeight
	Namespace: namespace_2dd2c4d8
	Checksum: 0xB989D407
	Offset: 0x2100
	Size: 0x32
	Parameters: 1
	Flags: Linked, Private
*/
function private isfacingeight(facingangle)
{
	if(facingangle >= -45 && facingangle <= 45)
	{
		return true;
	}
	return false;
}

/*
	Name: isfacingseven
	Namespace: namespace_2dd2c4d8
	Checksum: 0xAD5FAFA4
	Offset: 0x2140
	Size: 0x30
	Parameters: 1
	Flags: Linked, Private
*/
function private isfacingseven(facingangle)
{
	if(facingangle >= 0 && facingangle <= 90)
	{
		return true;
	}
	return false;
}

/*
	Name: isfacingsix
	Namespace: namespace_2dd2c4d8
	Checksum: 0x7B79D2D4
	Offset: 0x2178
	Size: 0x32
	Parameters: 1
	Flags: Linked, Private
*/
function private isfacingsix(facingangle)
{
	if(facingangle >= -135 && facingangle <= -45)
	{
		return true;
	}
	return false;
}

/*
	Name: isfacingnine
	Namespace: namespace_2dd2c4d8
	Checksum: 0x8CBA065E
	Offset: 0x21B8
	Size: 0x30
	Parameters: 1
	Flags: Linked, Private
*/
function private isfacingnine(facingangle)
{
	if(facingangle >= -90 && facingangle <= 0)
	{
		return true;
	}
	return false;
}

/*
	Name: shouldtacticalarrivecondition
	Namespace: namespace_2dd2c4d8
	Checksum: 0xF95BC452
	Offset: 0x21F0
	Size: 0x3FA
	Parameters: 1
	Flags: Linked, Private
*/
function private shouldtacticalarrivecondition(behaviortreeentity)
{
	if(getdvarint(#"enabletacticalarrival", 0) != 1)
	{
		return false;
	}
	if(!isdefined(behaviortreeentity.node))
	{
		return false;
	}
	if(!behaviortreeentity.node.type == #"cover left")
	{
		return false;
	}
	stance = behaviortreeentity getblackboardattribute("_arrival_stance");
	if(stance != "stand")
	{
		return false;
	}
	arrivaldistance = 35;
	/#
		arrivaldvar = getdvarint(#"tacarrivaldistance", 0);
		if(arrivaldvar != 0)
		{
			arrivaldistance = arrivaldvar;
		}
	#/
	nodeoffsetposition = behaviortreeentity getnodeoffsetposition(behaviortreeentity.node);
	if(distance(nodeoffsetposition, behaviortreeentity.origin) > arrivaldistance || distance(nodeoffsetposition, behaviortreeentity.origin) < 25)
	{
		return false;
	}
	entityangles = vectortoangles(behaviortreeentity.origin - nodeoffsetposition);
	if(abs(behaviortreeentity.node.angles[1] - entityangles[1]) < 60)
	{
		return false;
	}
	tacticalfaceangle = behaviortreeentity getblackboardattribute("_tactical_arrival_facing_yaw");
	arrivalangle = behaviortreeentity getblackboardattribute("_locomotion_arrival_yaw");
	if(isarrivingfour(arrivalangle))
	{
		if(!isfacingsix(tacticalfaceangle) && !isfacingeight(tacticalfaceangle) && !isfacingfour(tacticalfaceangle))
		{
			return false;
		}
	}
	else
	{
		if(isarrivingone(arrivalangle))
		{
			if(!isfacingnine(tacticalfaceangle) && !isfacingseven(tacticalfaceangle))
			{
				return false;
			}
		}
		else
		{
			if(isarrivingtwo(arrivalangle))
			{
				if(!isfacingeight(tacticalfaceangle))
				{
					return false;
				}
			}
			else
			{
				if(isarrivingthree(arrivalangle))
				{
					if(!isfacingseven(tacticalfaceangle) && !isfacingnine(tacticalfaceangle))
					{
						return false;
					}
				}
				else
				{
					if(isarrivingsix(arrivalangle))
					{
						if(!isfacingfour(tacticalfaceangle) && !isfacingeight(tacticalfaceangle) && !isfacingsix(tacticalfaceangle))
						{
							return false;
						}
					}
					else
					{
						return false;
					}
				}
			}
		}
	}
	return true;
}

/*
	Name: planhumanarrivalatcover
	Namespace: namespace_2dd2c4d8
	Checksum: 0x62F30268
	Offset: 0x25F8
	Size: 0x68C
	Parameters: 2
	Flags: Linked, Private
*/
function private planhumanarrivalatcover(behaviortreeentity, arrivalanim)
{
	behaviortreeentity.ai.var_ee9a2dfd = undefined;
	if(behaviortreeentity ai::get_behavior_attribute("disablearrivals"))
	{
		return false;
	}
	behaviortreeentity setblackboardattribute("_desired_stance", "stand");
	if(!isdefined(arrivalanim))
	{
		return false;
	}
	if(!aiutility::function_c94f0d1(behaviortreeentity))
	{
		return false;
	}
	if(isdefined(behaviortreeentity.node) && isdefined(behaviortreeentity.pathgoalpos))
	{
		if(!iscovernode(behaviortreeentity.node) || !behaviortreeentity function_4c2fffe6(behaviortreeentity.node))
		{
			return false;
		}
		nodeoffsetposition = behaviortreeentity getnodeoffsetposition(behaviortreeentity.node);
		if(isdefined(arrivalanim))
		{
			splittime = getarrivalsplittime(arrivalanim);
			issplitarrival = splittime > 0 && splittime < 1;
			nodeapproachyaw = behaviortreeentity getnodeoffsetangles(behaviortreeentity.node)[1];
			angle = (0, nodeapproachyaw - getangledelta(arrivalanim), 0);
			forwarddir = anglestoforward(angle);
			rightdir = anglestoright(angle);
			animlength = getanimlength(arrivalanim);
			var_ff177acc = getmovedelta(arrivalanim, 0, (animlength - 0.2) / animlength);
			if(issplitarrival)
			{
				var_d56d1d2d = getmovedelta(arrivalanim, 0, splittime);
				var_f0dd8bc8 = var_ff177acc - var_d56d1d2d;
				var_fb34812f = vectorscale(forwarddir, var_d56d1d2d[0]);
				var_944b0150 = vectorscale(rightdir, var_d56d1d2d[1]);
				var_85e98eb9 = vectorscale(forwarddir, var_f0dd8bc8[0]);
				var_a358ca3 = vectorscale(rightdir, var_f0dd8bc8[1]);
				var_6e775fcc = (nodeoffsetposition - var_85e98eb9) + var_a358ca3;
				coverenterpos = (var_6e775fcc - var_fb34812f) + var_944b0150;
				var_5fd77fe1 = var_6e775fcc + vectorscale((0, 0, 1), 8);
				var_c7c8e445 = nodeoffsetposition + vectorscale((0, 0, 1), 8);
				var_6c21c197 = coverenterpos + vectorscale((0, 0, 1), 8);
				/#
					recordline(var_5fd77fe1, var_c7c8e445, (1, 0.5, 0), "");
					record3dtext("", var_5fd77fe1, (1, 0.5, 0), "");
					recordline(var_6c21c197, var_5fd77fe1, (1, 0.5, 0), "");
					record3dtext("", var_6c21c197, (1, 0.5, 0), "");
				#/
				if(!behaviortreeentity maymovefrompointtopoint(var_5fd77fe1, var_c7c8e445, 1, 1, behaviortreeentity, 0.05))
				{
					return false;
				}
				if(!behaviortreeentity maymovefrompointtopoint(var_6c21c197, var_5fd77fe1, 1, 1, behaviortreeentity, 0.05))
				{
					return false;
				}
			}
			else
			{
				forward = vectorscale(forwarddir, var_ff177acc[0]);
				right = vectorscale(rightdir, var_ff177acc[1]);
				coverenterpos = (nodeoffsetposition - forward) + right;
				var_c7c8e445 = nodeoffsetposition + vectorscale((0, 0, 1), 8);
				var_6c21c197 = coverenterpos + vectorscale((0, 0, 1), 8);
				/#
					recordline(var_6c21c197, var_c7c8e445, (1, 0.5, 0), "");
					record3dtext("", var_6c21c197, (1, 0.5, 0), "");
				#/
				if(!behaviortreeentity maymovefrompointtopoint(var_6c21c197, var_c7c8e445, 1, 1, behaviortreeentity, 0.05))
				{
					return false;
				}
			}
			if(!checkcoverarrivalconditions(coverenterpos, nodeoffsetposition))
			{
				return false;
			}
			if(ispointonnavmesh(coverenterpos, behaviortreeentity))
			{
				behaviortreeentity.var_2dc0ed5e = function_15a5703b(#"human", behaviortreeentity function_28e7d252());
				/#
					recordcircle(coverenterpos, 2, (1, 0, 0), "");
				#/
				behaviortreeentity function_a57c34b7(coverenterpos, nodeoffsetposition, "arrival");
				return true;
			}
		}
	}
	return false;
}

/*
	Name: checkcoverarrivalconditions
	Namespace: namespace_2dd2c4d8
	Checksum: 0xE234E144
	Offset: 0x2C90
	Size: 0x2EC
	Parameters: 2
	Flags: Linked, Private
*/
function private checkcoverarrivalconditions(coverenterpos, coverpos)
{
	distsqtonode = distancesquared(self.origin, coverpos);
	distsqfromnodetoenterpos = distancesquared(coverpos, coverenterpos);
	awayfromenterpos = distsqtonode >= (distsqfromnodetoenterpos + 150);
	if(!awayfromenterpos)
	{
		return false;
	}
	trace = groundtrace(coverenterpos + vectorscale((0, 0, 1), 72), coverenterpos + (vectorscale((0, 0, -1), 72)), 0, 0, 0);
	if(isdefined(trace[#"position"]) && (abs(trace[#"position"][2] - coverpos[2])) > 30)
	{
		/#
			if(getdvarint(#"ai_debugarrivals", 0))
			{
				recordcircle(coverenterpos, 1, (1, 0, 0), "");
				record3dtext("", coverenterpos, (1, 0, 0), "", undefined, 0.4);
				recordcircle(trace[#"position"], 1, (1, 0, 0), "");
				record3dtext("" + (int(abs(trace[#"position"][2] - coverpos[2]))), trace[#"position"] + vectorscale((0, 0, 1), 5), (1, 0, 0), "", undefined, 0.4);
				record3dtext("" + 30, trace[#"position"], (1, 0, 0), "", undefined, 0.4);
				recordline(coverenterpos, trace[#"position"], (1, 0, 0), "");
			}
		#/
		return false;
	}
	return true;
}

/*
	Name: getarrivalsplittime
	Namespace: namespace_2dd2c4d8
	Checksum: 0x99ED455D
	Offset: 0x2F88
	Size: 0x240
	Parameters: 1
	Flags: Linked, Private
*/
function private getarrivalsplittime(arrivalanim)
{
	if(!isdefined(level.animarrivalsplittimes))
	{
		level.animarrivalsplittimes = [];
	}
	if(isdefined(level.animarrivalsplittimes[arrivalanim]))
	{
		return level.animarrivalsplittimes[arrivalanim];
	}
	bestsplit = -1;
	if(animhasnotetrack(arrivalanim, "corner"))
	{
		times = getnotetracktimes(arrivalanim, "corner");
		/#
			assert(times.size == 1, ((("" + function_9e72a96(arrivalanim)) + "") + "") + "");
		#/
		bestsplit = times[0];
	}
	else
	{
		/#
			var_1e582813 = function_9e72a96(arrivalanim);
			var_ccd34262 = issubstr(var_1e582813, "") || issubstr(var_1e582813, "") || issubstr(var_1e582813, "");
			var_ffc4381b = issubstr(var_1e582813, "");
			assertmsg(((("" + var_1e582813) + "") + "") + "");
		#/
		if(var_ccd34262 && !var_ffc4381b && self.archetype == #"human")
		{
			/#
			#/
		}
	}
	level.animarrivalsplittimes[arrivalanim] = bestsplit;
	return bestsplit;
}

/*
	Name: deltarotate
	Namespace: namespace_2dd2c4d8
	Checksum: 0x8D40205B
	Offset: 0x31D0
	Size: 0x92
	Parameters: 2
	Flags: Private
*/
function private deltarotate(delta, yaw)
{
	cosine = cos(yaw);
	sine = sin(yaw);
	return ((delta[0] * cosine) - (delta[1] * sine), (delta[1] * cosine) + (delta[0] * sine), 0);
}

/*
	Name: function_e7f9cf11
	Namespace: namespace_2dd2c4d8
	Checksum: 0x6CD999A9
	Offset: 0x3270
	Size: 0x72
	Parameters: 0
	Flags: Linked, Private
*/
function private function_e7f9cf11()
{
	/#
		assert(self.archetype == #"human" || self.archetype == #"civilian");
	#/
	speed = self function_28e7d252();
	return speed;
}

/*
	Name: function_3298688b
	Namespace: namespace_2dd2c4d8
	Checksum: 0x32E7145D
	Offset: 0x32F0
	Size: 0x5A
	Parameters: 0
	Flags: Linked, Private
*/
function private function_3298688b()
{
	/#
		assert(self.archetype == #"human");
	#/
	speed = self function_359fd121();
	return speed;
}

/*
	Name: function_eb731440
	Namespace: namespace_2dd2c4d8
	Checksum: 0xECD79F3C
	Offset: 0x3358
	Size: 0x3A
	Parameters: 0
	Flags: Linked, Private
*/
function private function_eb731440()
{
	/#
		assert(self.archetype == #"human");
	#/
	return self.var_55a3f1d3;
}

/*
	Name: function_631d7179
	Namespace: namespace_2dd2c4d8
	Checksum: 0xD46FE5B5
	Offset: 0x33A0
	Size: 0x5E
	Parameters: 0
	Flags: Linked, Private
*/
function private function_631d7179()
{
	/#
		assert(self.archetype == #"human");
	#/
	if(is_true(self.var_dd1cd771))
	{
		return self.var_31162969;
	}
	return self.var_55a3f1d3;
}

/*
	Name: function_cb9c22a2
	Namespace: namespace_2dd2c4d8
	Checksum: 0x9998EACB
	Offset: 0x3408
	Size: 0x164
	Parameters: 1
	Flags: Linked, Private
*/
function private function_cb9c22a2(entity)
{
	if(entity haspath() && !isdefined(entity.traversestartnode) && !entity function_3c566724())
	{
		if(entity getorientmode("script") != "face enemy strafe")
		{
			entity.var_6a36b46d = 1;
			entity animmode("zonly_physics");
			entity orientmode("face enemy strafe");
			entity.var_6a36b46d = 0;
		}
	}
	var_55a3f1d3 = entity function_144f21ef();
	if(is_true(entity.ai.var_c978f9a1))
	{
		if(-85 < var_55a3f1d3 && var_55a3f1d3 < 35)
		{
			return false;
		}
		return true;
	}
	if(var_55a3f1d3 < -90 || var_55a3f1d3 > 90)
	{
		return true;
	}
	return false;
}

/*
	Name: function_1972c057
	Namespace: namespace_2dd2c4d8
	Checksum: 0x5BCE60A2
	Offset: 0x3578
	Size: 0x2E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_1972c057(entity)
{
	if(function_cb9c22a2(entity))
	{
		return true;
	}
	return false;
}

/*
	Name: function_968efd1f
	Namespace: namespace_2dd2c4d8
	Checksum: 0xFBF620E
	Offset: 0x35B0
	Size: 0x2E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_968efd1f(entity)
{
	if(!function_cb9c22a2(entity))
	{
		return true;
	}
	return false;
}

/*
	Name: function_c2fb1a1e
	Namespace: namespace_2dd2c4d8
	Checksum: 0x8D13E9AA
	Offset: 0x35E8
	Size: 0x5E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_c2fb1a1e(entity)
{
	if(!level.enablehipflip)
	{
		return false;
	}
	starttime = entity.ai.var_f92c6536;
	if(!isdefined(starttime))
	{
		return false;
	}
	if(gettime() - starttime < 1000)
	{
		return false;
	}
	return true;
}

/*
	Name: function_aede5c43
	Namespace: namespace_2dd2c4d8
	Checksum: 0xDC1F1757
	Offset: 0x3650
	Size: 0xB8
	Parameters: 1
	Flags: Linked, Private
*/
function private function_aede5c43(entity)
{
	if(entity haspath())
	{
		disttogoalsq = distancesquared(entity.pathgoalpos, entity.origin);
		if(disttogoalsq < sqr(150))
		{
			return false;
		}
	}
	footstep = entity function_4b57124f(150);
	if(footstep != "left foot")
	{
		return false;
	}
	return true;
}

/*
	Name: function_c34dd9f8
	Namespace: namespace_2dd2c4d8
	Checksum: 0xE7981C97
	Offset: 0x3710
	Size: 0xF6
	Parameters: 1
	Flags: Linked, Private
*/
function private function_c34dd9f8(entity)
{
	if(!function_c2fb1a1e(entity))
	{
		return 0;
	}
	if(!is_true(entity.ai.var_c978f9a1))
	{
		var_55a3f1d3 = entity.ai.var_7979fbb2;
		if(var_55a3f1d3 < -120 && var_55a3f1d3 < entity.ai.var_798e85cd)
		{
			return function_aede5c43(entity);
		}
		if(var_55a3f1d3 > 55 && var_55a3f1d3 < 90 && var_55a3f1d3 > entity.ai.var_798e85cd)
		{
			return function_aede5c43(entity);
		}
	}
	return 0;
}

/*
	Name: function_f2c9142
	Namespace: namespace_2dd2c4d8
	Checksum: 0xAD3E6DC8
	Offset: 0x3810
	Size: 0x106
	Parameters: 1
	Flags: Linked, Private
*/
function private function_f2c9142(entity)
{
	if(!function_c2fb1a1e(entity))
	{
		return 0;
	}
	if(is_true(entity.ai.var_c978f9a1))
	{
		var_55a3f1d3 = entity.ai.var_7979fbb2;
		if(var_55a3f1d3 < 55 && var_55a3f1d3 > 20 && var_55a3f1d3 < entity.ai.var_798e85cd)
		{
			return function_aede5c43(entity);
		}
		if(var_55a3f1d3 > -135 && var_55a3f1d3 < -105 && var_55a3f1d3 > entity.ai.var_798e85cd)
		{
			return function_aede5c43(entity);
		}
	}
	return 0;
}

/*
	Name: function_d8a81861
	Namespace: namespace_2dd2c4d8
	Checksum: 0x595F9BF7
	Offset: 0x3920
	Size: 0xCA
	Parameters: 1
	Flags: Linked, Private
*/
function private function_d8a81861(entity)
{
	if(!level.enablehipflip)
	{
		return function_1972c057(entity);
	}
	if(!is_true(entity.ai.var_c978f9a1))
	{
		var_55a3f1d3 = entity.ai.var_7979fbb2;
		if(var_55a3f1d3 > 135 && var_55a3f1d3 > entity.ai.var_798e85cd)
		{
			return 1;
		}
		if(var_55a3f1d3 < -135 && var_55a3f1d3 < entity.ai.var_798e85cd)
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: function_ab6f96b6
	Namespace: namespace_2dd2c4d8
	Checksum: 0x3B9A3AC9
	Offset: 0x39F8
	Size: 0x90
	Parameters: 1
	Flags: Linked, Private
*/
function private function_ab6f96b6(entity)
{
	if(!level.enablehipflip)
	{
		return function_968efd1f(entity);
	}
	if(is_true(entity.ai.var_c978f9a1))
	{
		var_55a3f1d3 = entity.ai.var_7979fbb2;
		if(var_55a3f1d3 > -60 && var_55a3f1d3 < 45)
		{
			return 1;
		}
	}
	return 0;
}

/*
	Name: function_7ba867a8
	Namespace: namespace_2dd2c4d8
	Checksum: 0x1B8908CC
	Offset: 0x3A90
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function function_7ba867a8(entity)
{
	var_422d3ed4 = entity function_fe54a83e();
	if(var_422d3ed4 >= 45 && var_422d3ed4 <= 315)
	{
		return true;
	}
	entity.var_3b77553e = -1;
	return false;
}

/*
	Name: function_52c3ab28
	Namespace: namespace_2dd2c4d8
	Checksum: 0x4EC06549
	Offset: 0x3B00
	Size: 0x150
	Parameters: 1
	Flags: Linked
*/
function function_52c3ab28(entity)
{
	if(!function_7ba867a8(entity))
	{
		return false;
	}
	if(!isdefined(entity.var_3b77553e) || entity.var_3b77553e <= 0)
	{
		return true;
	}
	if(!isdefined(entity.var_7b1f015a))
	{
		return true;
	}
	if(distance2dsquared(entity.var_7b1f015a.pos, entity.var_14b548c5) > sqr(4))
	{
		return true;
	}
	if(abs(entity.var_7b1f015a.angle - entity.var_871c9e86) > 1)
	{
		return true;
	}
	if(entity.var_7b1f015a.var_568d90d2 != function_15a5703b(#"human", entity function_359fd121()))
	{
		return true;
	}
	return false;
}

/*
	Name: function_b1092561
	Namespace: namespace_2dd2c4d8
	Checksum: 0xE79E24CF
	Offset: 0x3C58
	Size: 0x1B0
	Parameters: 1
	Flags: Linked
*/
function function_b1092561(entity)
{
	if((isdefined(entity.var_3b77553e) ? entity.var_3b77553e : 0) > 0 && isdefined(entity.var_7b1f015a.animation) && isdefined(entity.var_14b548c5))
	{
		splittime = 0.5;
		if(animhasnotetrack(entity.var_7b1f015a.animation, "corner"))
		{
			times = getnotetracktimes(entity.var_7b1f015a.animation, "corner");
			/#
				assert(times.size == 1, ((("" + function_9e72a96(entity.var_7b1f015a.animation)) + "") + "") + "");
			#/
			splittime = times[0];
		}
		localdeltahalfvector = getmovedelta(entity.var_7b1f015a.animation, 0, splittime);
		if(distance2dsquared(entity.origin, entity.var_14b548c5) <= lengthsquared(localdeltahalfvector))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_80c579d8
	Namespace: namespace_2dd2c4d8
	Checksum: 0x51882E11
	Offset: 0x3E10
	Size: 0x12
	Parameters: 1
	Flags: Linked, Private
*/
function private function_80c579d8(entity)
{
	return self.var_ca796dd1;
}

/*
	Name: function_2fa3d847
	Namespace: namespace_2dd2c4d8
	Checksum: 0xE52D80D
	Offset: 0x3E30
	Size: 0x108
	Parameters: 0
	Flags: Linked
*/
function function_2fa3d847()
{
	enemy = self.enemy;
	if(!isdefined(enemy))
	{
		return self.var_e62db63f;
	}
	var_3e0a4a57 = self function_584873ef();
	var_7c8caf6 = var_3e0a4a57 - self.var_e62db63f;
	var_b3aae738 = 1;
	if(var_7c8caf6 < 0)
	{
		var_b3aae738 = -1;
	}
	var_7c8caf6 = min(abs(var_7c8caf6), self.var_1f35a3cf);
	var_d4699b3f = self.var_e62db63f + (var_b3aae738 * var_7c8caf6);
	self.var_e62db63f = var_d4699b3f;
	/#
		recordenttext("" + var_d4699b3f, self, (1, 0, 0), "");
	#/
	return var_d4699b3f;
}

/*
	Name: function_d68785cf
	Namespace: namespace_2dd2c4d8
	Checksum: 0x45E2E59A
	Offset: 0x3F40
	Size: 0x6A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_d68785cf(entity)
{
	if(btapi_shouldarriveexposed(entity))
	{
		var_55a3f1d3 = entity function_144f21ef();
		if(abs(var_55a3f1d3) < 3)
		{
			return true;
		}
	}
	return false;
}

