#using scripts\core_common\animation_shared.gsc;
#using script_16d00590b7ac9e6;

#namespace animation_selector_table_evaluators;

/*
	Name: registerastscriptfunctions
	Namespace: animation_selector_table_evaluators
	Checksum: 0xB030F782
	Offset: 0x338
	Size: 0x234
	Parameters: 0
	Flags: AutoExec
*/
function autoexec registerastscriptfunctions()
{
	animationselectortable::registeranimationselectortableevaluator("testFunction", &testfunction);
	animationselectortable::registeranimationselectortableevaluator("evaluateMoveToCQBAnimations", &evaluatemovetocqbanimations);
	animationselectortable::registeranimationselectortableevaluator("evaluateBlockedAnimations", &evaluateblockedanimations);
	animationselectortable::registeranimationselectortableevaluator("evaluateBlockedCoverArrivalAnimations", &evaluateblockedcoverarrivalanimations);
	animationselectortable::registeranimationselectortableevaluator("evaluateBlockedCoverExitAnimations", &evaluateblockedcoverexitanimations);
	animationselectortable::registeranimationselectortableevaluator("evaluateBlockedNoStairsAnimations", &evaluateblockednostairsanimations);
	animationselectortable::registeranimationselectortableevaluator("evaluateBlockedAnimationsRelaxed", &evaluateblockedanimationsrelaxed);
	animationselectortable::registeranimationselectortableevaluator("evaluateBlockedAnimationsOffNavmesh", &evaluateblockedanimationsoffnavmesh);
	animationselectortable::registeranimationselectortableevaluator("evaluateHumanTurnAnimations", &evaluatehumanturnanimations);
	animationselectortable::registeranimationselectortableevaluator("matchPrePlannedTurn", &matchpreplannedturn);
	animationselectortable::registeranimationselectortableevaluator("planHumanTurnAnimations", &planhumanturnanimations);
	animationselectortable::registeranimationselectortableevaluator("evaluateHumanExposedArrivalAnimations", &evaluatehumanexposedarrivalanimations);
	animationselectortable::registeranimationselectortableevaluator("evaluateJukeBlockedAnimations", &evaluatejukeblockedanimations);
	animationselectortable::registeranimationselectortableevaluator("humanDeathEvaluation", &humandeathevaluation);
}

/*
	Name: testfunction
	Namespace: animation_selector_table_evaluators
	Checksum: 0x1D830983
	Offset: 0x578
	Size: 0x46
	Parameters: 2
	Flags: Linked
*/
function testfunction(entity, animations)
{
	if(isarray(animations) && animations.size > 0)
	{
		return animations[0];
	}
}

/*
	Name: function_aa7530df
	Namespace: animation_selector_table_evaluators
	Checksum: 0xF7EE35E8
	Offset: 0x5C8
	Size: 0x162
	Parameters: 2
	Flags: Linked, Private
*/
function private function_aa7530df(entity, animation)
{
	pixbeginevent();
	/#
		assert(isactor(entity));
	#/
	forwarddir = anglestoforward(entity.angles);
	localdeltavector = getmovedelta(animation, 0, 1);
	endpoint = entity localtoworldcoords(localdeltavector);
	forwardpoint = endpoint + vectorscale(forwarddir, 100);
	/#
		recordline(entity.origin, endpoint, (0, 0, 1), "", entity);
		recordline(endpoint, forwardpoint, (1, 0.5, 0), "", entity);
	#/
	if(entity maymovefrompointtopoint(endpoint, forwardpoint, 1, 1))
	{
		pixendevent();
		return 1;
	}
	pixendevent();
	return 0;
}

/*
	Name: evaluatejukeblockedanimations
	Namespace: animation_selector_table_evaluators
	Checksum: 0x70342795
	Offset: 0x738
	Size: 0x74
	Parameters: 2
	Flags: Linked, Private
*/
function private evaluatejukeblockedanimations(entity, animations)
{
	if(animations.size > 0)
	{
		return evaluator_findfirstvalidanimation(entity, animations, array(&evaluator_checkanimationagainstnavmesh, &function_aa7530df, &evaluator_checkanimationforovershootinggoal));
	}
}

/*
	Name: evaluator_checkanimationagainstgeo
	Namespace: animation_selector_table_evaluators
	Checksum: 0xF3DF497B
	Offset: 0x7B8
	Size: 0x222
	Parameters: 2
	Flags: Linked, Private
*/
function private evaluator_checkanimationagainstgeo(entity, animation)
{
	pixbeginevent();
	/#
		assert(isactor(entity));
	#/
	splittime = function_382b0cfb(animation);
	localdeltahalfvector = getmovedelta(animation, 0, splittime);
	midpoint = entity localtoworldcoords(localdeltahalfvector);
	midpoint = (midpoint[0], midpoint[1], entity.origin[2] + 6);
	/#
		recordline(entity.origin, midpoint, (1, 0.5, 0), "", entity);
	#/
	if(entity maymovetopoint(midpoint, 1, 1, entity, 0.05))
	{
		localdeltavector = getmovedelta(animation, 0, 1);
		endpoint = entity localtoworldcoords(localdeltavector);
		endpoint = (endpoint[0], endpoint[1], entity.origin[2] + 6);
		/#
			recordline(midpoint, endpoint, (1, 0.5, 0), "", entity);
		#/
		if(entity maymovefrompointtopoint(midpoint, endpoint, 1, 1, entity, 0.05))
		{
			pixendevent();
			return 1;
		}
	}
	pixendevent();
	return 0;
}

/*
	Name: evaluator_checkanimationendpointagainstgeo
	Namespace: animation_selector_table_evaluators
	Checksum: 0xFB3C6E9D
	Offset: 0x9E8
	Size: 0x11A
	Parameters: 2
	Flags: Private
*/
function private evaluator_checkanimationendpointagainstgeo(entity, animation)
{
	pixbeginevent();
	/#
		assert(isactor(entity));
	#/
	localdeltavector = getmovedelta(animation, 0, 1);
	var_e21fa5a4 = entity.angles + (0, entity function_144f21ef(), 0);
	endpoint = function_323c3bee(localdeltavector, entity.origin, var_e21fa5a4);
	endpoint = (endpoint[0], endpoint[1], entity.origin[2]);
	if(entity maymovetopoint(endpoint, 0, 0))
	{
		pixendevent();
		return 1;
	}
	pixendevent();
	return 0;
}

/*
	Name: function_91a832bb
	Namespace: animation_selector_table_evaluators
	Checksum: 0xEB2CD5F2
	Offset: 0xB10
	Size: 0x144
	Parameters: 2
	Flags: Linked, Private
*/
function private function_91a832bb(entity, animation)
{
	localdeltavector = getmovedelta(animation, 0, 1);
	var_f0ccb726 = lengthsquared(localdeltavector);
	if(var_f0ccb726 > sqr(entity getpathlength()))
	{
		return false;
	}
	splittime = function_382b0cfb(animation);
	localdeltavector = getmovedelta(animation, 0, splittime);
	var_773216e9 = length(localdeltavector);
	var_62f5df14 = distance2d(entity.origin, entity.var_14b548c5);
	if(var_773216e9 >= var_62f5df14 && var_773216e9 < (var_62f5df14 * 1.2))
	{
		return true;
	}
	return false;
}

/*
	Name: function_3c7d2020
	Namespace: animation_selector_table_evaluators
	Checksum: 0x70615645
	Offset: 0xC60
	Size: 0x5A
	Parameters: 2
	Flags: Linked, Private
*/
function private function_3c7d2020(entity, animation)
{
	if(animhasnotetrack(animation, "corner"))
	{
		return 1;
	}
	return evaluator_checkanimationforovershootinggoal(entity, animation);
}

/*
	Name: evaluator_checkanimationforovershootinggoal
	Namespace: animation_selector_table_evaluators
	Checksum: 0x1B9237D6
	Offset: 0xCC8
	Size: 0x348
	Parameters: 2
	Flags: Linked, Private
*/
function private evaluator_checkanimationforovershootinggoal(entity, animation)
{
	pixbeginevent();
	/#
		assert(isactor(entity));
	#/
	if(entity haspath())
	{
		startpos = entity.origin;
		goalpos = entity.var_14b548c5;
		/#
			assert(isdefined(goalpos));
		#/
		disttogoalsq = distance2dsquared(startpos, goalpos);
		localdeltavector = getmovedelta(animation, 0, 1);
		animdistsq = lengthsquared(localdeltavector);
		if(entity.traversalstartdist > 0 && animdistsq > sqr(entity.traversalstartdist))
		{
			pixendevent();
			return 0;
		}
		if((isdefined(entity.var_c4c50a0b) ? entity.var_c4c50a0b : 0) && animdistsq > disttogoalsq)
		{
			pixendevent();
			return 0;
		}
		codemovetime = function_199662d1(animation);
		localdeltavector = getmovedelta(animation, 0, codemovetime);
		animdistsq = lengthsquared(localdeltavector);
		if(entity.isarrivalpending && distance2dsquared(startpos, entity.overridegoalpos) < disttogoalsq)
		{
			goalpos = entity.overridegoalpos;
			disttogoalsq = distance2dsquared(startpos, goalpos);
		}
		if(animdistsq < disttogoalsq * 0.9)
		{
			pixendevent();
			return 1;
		}
		/#
			record3dtext(((("" + function_9e72a96(animation)) + "") + sqrt(animdistsq) + "") + sqrt(disttogoalsq), entity.origin, (1, 0.5, 0), "", entity, 0.4);
		#/
	}
	else
	{
		/#
			record3dtext("", entity.origin, (1, 0.5, 0), "", entity, 0.4);
		#/
	}
	pixendevent();
	return 0;
}

/*
	Name: function_da29fa63
	Namespace: animation_selector_table_evaluators
	Checksum: 0xB82EB017
	Offset: 0x1020
	Size: 0x1A6
	Parameters: 2
	Flags: Linked, Private
*/
function private function_da29fa63(entity, animation)
{
	pixbeginevent(#"hash_4de9b510d8b94b2c");
	/#
		assert(isactor(entity));
	#/
	if(isdefined(entity.node))
	{
		if(entity haspath())
		{
			startpos = entity.origin;
			goalpos = entity getnodeoffsetposition(entity.node);
			disttogoalsq = distance2dsquared(startpos, goalpos);
			localdeltavector = getmovedelta(animation, 0, 1);
			animdistsq = lengthsquared(localdeltavector);
			if(animdistsq <= disttogoalsq)
			{
				pixendevent();
				return true;
			}
		}
		/#
			record3dtext("", entity.origin, (1, 0.5, 0), "", entity);
		#/
	}
	pixendevent();
	return false;
}

/*
	Name: function_89b21ba9
	Namespace: animation_selector_table_evaluators
	Checksum: 0xA64B0B48
	Offset: 0x11D0
	Size: 0xFE
	Parameters: 2
	Flags: Linked, Private
*/
function private function_89b21ba9(entity, animation)
{
	/#
		assert(isactor(entity));
	#/
	localdeltavector = getmovedelta(animation, 0, 1);
	endpoint = function_323c3bee(localdeltavector, entity.origin, entity.angles);
	if(!ispointonstairs(endpoint))
	{
		return true;
	}
	/#
		record3dtext("" + endpoint, entity.origin, (1, 0.5, 0), "", entity);
	#/
	return false;
}

/*
	Name: function_8bd6d54d
	Namespace: animation_selector_table_evaluators
	Checksum: 0xF76092CD
	Offset: 0x12D8
	Size: 0x218
	Parameters: 2
	Flags: Linked, Private
*/
function private function_8bd6d54d(entity, animation)
{
	/#
		assert(isactor(entity));
	#/
	maxdist = entity getpathfindingradius() * 2;
	maxdistsq = sqr(maxdist);
	localdeltavector = getmovedelta(animation, 0, 1);
	endpoint = entity localtoworldcoords(localdeltavector);
	radius = length(localdeltavector) + maxdist;
	allies = function_e45cbe76(entity.origin, radius, entity.team);
	foreach(ally in allies)
	{
		if(ally != entity)
		{
			var_6560f463 = function_39ceb9d4(entity.origin, endpoint, ally.origin);
			if(var_6560f463 < maxdistsq)
			{
				/#
					record3dtext("", entity.origin, (1, 0.5, 0), "", entity);
				#/
				return false;
			}
		}
	}
	return true;
}

/*
	Name: evaluator_checkanimationagainstnavmesh
	Namespace: animation_selector_table_evaluators
	Checksum: 0xFF96B97D
	Offset: 0x14F8
	Size: 0x126
	Parameters: 2
	Flags: Linked, Private
*/
function private evaluator_checkanimationagainstnavmesh(entity, animation)
{
	/#
		assert(isactor(entity));
	#/
	localdeltavector = getmovedelta(animation, 0, 1);
	var_e21fa5a4 = entity.angles + (0, entity function_144f21ef(), 0);
	endpoint = function_323c3bee(localdeltavector, entity.origin, var_e21fa5a4);
	if(ispointonnavmesh(endpoint))
	{
		return true;
	}
	/#
		record3dtext("" + endpoint, entity.origin, (1, 0.5, 0), "", entity);
	#/
	return false;
}

/*
	Name: function_50c1352d
	Namespace: animation_selector_table_evaluators
	Checksum: 0x93BA535
	Offset: 0x1628
	Size: 0x19E
	Parameters: 2
	Flags: Linked, Private
*/
function private function_50c1352d(entity, animation)
{
	localdeltavector = getmovedelta(animation, 0, 1);
	animdistsq = lengthsquared(localdeltavector);
	goalpos = entity.pathgoalpos;
	disttogoalsq = distance2dsquared(entity.origin, goalpos);
	if(disttogoalsq <= animdistsq && (abs(goalpos[2] - entity.origin[2])) < 48)
	{
		if(is_true(entity.ai.var_a5dabb8b))
		{
			return true;
		}
		var_4da2186 = function_323c3bee(localdeltavector, entity.origin, entity.angles);
		if(distance2dsquared(goalpos, var_4da2186) < sqr(16) && (abs(goalpos[2] - var_4da2186[2])) < 48)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: evaluator_findfirstvalidanimation
	Namespace: animation_selector_table_evaluators
	Checksum: 0xBD652EA9
	Offset: 0x17D0
	Size: 0x1AA
	Parameters: 3
	Flags: Linked, Private
*/
function private evaluator_findfirstvalidanimation(entity, animations, tests)
{
	/#
		assert(isarray(animations), "");
	#/
	/#
		assert(isarray(tests), "");
	#/
	foreach(aliasanimations in animations)
	{
		if(aliasanimations.size > 0)
		{
			valid = 1;
			animation = aliasanimations[0];
			foreach(test in tests)
			{
				if(![[test]](entity, animation))
				{
					valid = 0;
					break;
				}
			}
			if(valid)
			{
				return animation;
			}
		}
	}
}

/*
	Name: evaluatemovetocqbanimations
	Namespace: animation_selector_table_evaluators
	Checksum: 0xE2AB7F31
	Offset: 0x1988
	Size: 0x108
	Parameters: 2
	Flags: Linked, Private
*/
function private evaluatemovetocqbanimations(entity, animations)
{
	if(is_true(entity.var_81238017))
	{
		return undefined;
	}
	anim = evaluateblockedanimations(entity, animations);
	/#
		if(isdefined(anim))
		{
			record3dtext("" + function_9e72a96(anim), entity.origin, (1, 0.5, 0), "", entity, 0.65);
		}
		else
		{
			record3dtext("", entity.origin, (1, 0.5, 0), "", entity, 0.65);
		}
	#/
	return anim;
}

/*
	Name: evaluateblockedanimations
	Namespace: animation_selector_table_evaluators
	Checksum: 0xB3DB2860
	Offset: 0x1A98
	Size: 0x126
	Parameters: 2
	Flags: Linked, Private
*/
function private evaluateblockedanimations(entity, animations)
{
	if(animations.size > 0)
	{
		anim = evaluator_findfirstvalidanimation(entity, animations, array(&evaluator_checkanimationagainstnavmesh, &evaluator_checkanimationforovershootinggoal));
		if(isdefined(anim))
		{
			/#
				record3dtext("" + function_9e72a96(anim), entity.origin, (1, 0.5, 0), "", entity, 0.65);
			#/
			return anim;
		}
	}
	/#
		record3dtext("", entity.origin, (1, 0.5, 0), "", entity, 0.65);
	#/
	return undefined;
}

/*
	Name: evaluateblockedcoverarrivalanimations
	Namespace: animation_selector_table_evaluators
	Checksum: 0x15ECDF32
	Offset: 0x1BC8
	Size: 0x116
	Parameters: 2
	Flags: Linked, Private
*/
function private evaluateblockedcoverarrivalanimations(entity, animations)
{
	if(animations.size > 0)
	{
		anim = evaluator_findfirstvalidanimation(entity, animations, array(&function_da29fa63));
		if(isdefined(anim))
		{
			/#
				record3dtext("" + function_9e72a96(anim), entity.origin, (1, 0.5, 0), "", entity, 0.65);
			#/
			return anim;
		}
	}
	/#
		record3dtext("", entity.origin, (1, 0.5, 0), "", entity, 0.65);
	#/
	return undefined;
}

/*
	Name: evaluateblockedcoverexitanimations
	Namespace: animation_selector_table_evaluators
	Checksum: 0xC37AC881
	Offset: 0x1CE8
	Size: 0x146
	Parameters: 2
	Flags: Linked, Private
*/
function private evaluateblockedcoverexitanimations(entity, animations)
{
	if(animations.size > 0)
	{
		anim = evaluator_findfirstvalidanimation(entity, animations, array(&evaluator_checkanimationagainstnavmesh, &function_3c7d2020, &function_89b21ba9, &function_8bd6d54d));
		if(isdefined(anim))
		{
			/#
				record3dtext("" + function_9e72a96(anim), entity.origin, (1, 0.5, 0), "", entity, 0.65);
			#/
			return anim;
		}
	}
	/#
		record3dtext("", entity.origin, (1, 0.5, 0), "", entity, 0.65);
	#/
	return undefined;
}

/*
	Name: evaluateblockednostairsanimations
	Namespace: animation_selector_table_evaluators
	Checksum: 0xD74FC69F
	Offset: 0x1E38
	Size: 0x136
	Parameters: 2
	Flags: Linked, Private
*/
function private evaluateblockednostairsanimations(entity, animations)
{
	if(animations.size > 0)
	{
		anim = evaluator_findfirstvalidanimation(entity, animations, array(&evaluator_checkanimationagainstnavmesh, &evaluator_checkanimationforovershootinggoal, &function_89b21ba9));
		if(isdefined(anim))
		{
			/#
				record3dtext("" + function_9e72a96(anim), entity.origin, (1, 0.5, 0), "", entity, 0.65);
			#/
			return anim;
		}
	}
	/#
		record3dtext("", entity.origin, (1, 0.5, 0), "", entity, 0.65);
	#/
	return undefined;
}

/*
	Name: evaluateblockedanimationsrelaxed
	Namespace: animation_selector_table_evaluators
	Checksum: 0x47C6E3D
	Offset: 0x1F78
	Size: 0x116
	Parameters: 2
	Flags: Linked, Private
*/
function private evaluateblockedanimationsrelaxed(entity, animations)
{
	if(animations.size > 0)
	{
		anim = evaluator_findfirstvalidanimation(entity, animations, array(&evaluator_checkanimationforovershootinggoal));
		if(isdefined(anim))
		{
			/#
				record3dtext("" + function_9e72a96(anim), entity.origin, (1, 0.5, 0), "", entity, 0.65);
			#/
			return anim;
		}
	}
	/#
		record3dtext("", entity.origin, (1, 0.5, 0), "", entity, 0.65);
	#/
	return undefined;
}

/*
	Name: evaluateblockedanimationsoffnavmesh
	Namespace: animation_selector_table_evaluators
	Checksum: 0xF7163E48
	Offset: 0x2098
	Size: 0x116
	Parameters: 2
	Flags: Linked, Private
*/
function private evaluateblockedanimationsoffnavmesh(entity, animations)
{
	if(animations.size > 0)
	{
		anim = evaluator_findfirstvalidanimation(entity, animations, array(&evaluator_checkanimationagainstgeo));
		if(isdefined(anim))
		{
			/#
				record3dtext("" + function_9e72a96(anim), entity.origin, (1, 0.5, 0), "", entity, 0.65);
			#/
			return anim;
		}
	}
	/#
		record3dtext("", entity.origin, (1, 0.5, 0), "", entity, 0.65);
	#/
	return undefined;
}

/*
	Name: evaluatehumanturnanimations
	Namespace: animation_selector_table_evaluators
	Checksum: 0x650DB66B
	Offset: 0x21B8
	Size: 0x1B6
	Parameters: 2
	Flags: Linked, Private
*/
function private evaluatehumanturnanimations(entity, animations)
{
	/#
		if(is_true(level.ai_dontturn))
		{
			return undefined;
		}
	#/
	/#
		record3dtext(("" + gettime()) + "", entity.origin, (1, 0.5, 0), "", entity, 0.65);
	#/
	if(animations.size > 0)
	{
		anim = evaluator_findfirstvalidanimation(entity, animations, array(&function_91a832bb, &evaluator_checkanimationagainstgeo, &evaluator_checkanimationagainstnavmesh));
		if(isdefined(anim))
		{
			/#
				record3dtext("" + function_9e72a96(anim), entity.origin, (1, 0.5, 0), "", entity, 0.65);
			#/
			return anim;
		}
	}
	/#
		record3dtext("", entity.origin, (1, 0.5, 0), "", entity, 0.65);
	#/
	return undefined;
}

/*
	Name: evaluatehumanexposedarrivalanimations
	Namespace: animation_selector_table_evaluators
	Checksum: 0x624BC885
	Offset: 0x2378
	Size: 0x2A0
	Parameters: 2
	Flags: Linked, Private
*/
function private evaluatehumanexposedarrivalanimations(entity, animations)
{
	if(isdefined(entity.pathgoalpos))
	{
		if(animations.size > 0)
		{
			var_5e259f59 = evaluator_findfirstvalidanimation(entity, animations, array(&function_50c1352d));
			/#
				if(isdefined(var_5e259f59))
				{
					record3dtext("" + function_9e72a96(var_5e259f59), entity.origin, (1, 0.5, 0), "", entity, 0.65);
				}
				else
				{
					record3dtext("", entity.origin, (1, 0.5, 0), "", entity, 0.65);
				}
			#/
			return var_5e259f59;
		}
	}
	else if(!entity haspath() && !isdefined(entity.node))
	{
		if(animations.size > 0)
		{
			foreach(aliasanimations in animations)
			{
				if(aliasanimations.size > 0)
				{
					anim = aliasanimations[0];
					/#
						if(isdefined(anim))
						{
							record3dtext("" + function_9e72a96(anim), entity.origin, (1, 0.5, 0), "", entity, 0.65);
						}
						else
						{
							record3dtext("", entity.origin, (1, 0.5, 0), "", entity, 0.65);
						}
					#/
					return anim;
				}
			}
		}
	}
	return undefined;
}

/*
	Name: function_199662d1
	Namespace: animation_selector_table_evaluators
	Checksum: 0x81AA4577
	Offset: 0x2620
	Size: 0xC4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_199662d1(animation)
{
	codemovetime = 1;
	if(animhasnotetrack(animation, "code_move"))
	{
		times = getnotetracktimes(animation, "code_move");
		codemovetime = times[0];
	}
	else if(animhasnotetrack(animation, "mocomp_end"))
	{
		times = getnotetracktimes(animation, "mocomp_end");
		codemovetime = times[0];
	}
	return codemovetime;
}

/*
	Name: function_382b0cfb
	Namespace: animation_selector_table_evaluators
	Checksum: 0x6AD748C1
	Offset: 0x26F0
	Size: 0xCA
	Parameters: 1
	Flags: Linked, Private
*/
function private function_382b0cfb(animation)
{
	splittime = 0.5;
	if(animhasnotetrack(animation, "corner"))
	{
		times = getnotetracktimes(animation, "corner");
		/#
			assert(times.size == 1, ((("" + function_9e72a96(animation)) + "") + "") + "");
		#/
		splittime = times[0];
	}
	return splittime;
}

/*
	Name: matchpreplannedturn
	Namespace: animation_selector_table_evaluators
	Checksum: 0x38732DA0
	Offset: 0x27C8
	Size: 0x7A
	Parameters: 2
	Flags: Linked, Private
*/
function private matchpreplannedturn(entity, animations)
{
	if(isdefined(entity.var_7b1f015a.animation))
	{
		for(i = 0; i < animations.size; i++)
		{
			if(animations[i][0] == entity.var_7b1f015a.animation)
			{
				return animations[i][0];
			}
		}
	}
	return undefined;
}

/*
	Name: planhumanturnanimations
	Namespace: animation_selector_table_evaluators
	Checksum: 0x3C44ABF4
	Offset: 0x2850
	Size: 0x2B4
	Parameters: 2
	Flags: Linked, Private
*/
function private planhumanturnanimations(entity, animations)
{
	if(!isdefined(entity.var_7b1f015a))
	{
		entity.var_7b1f015a = {};
	}
	if(animations.size > 0)
	{
		var_bff64930 = evaluator_findfirstvalidanimation(entity, animations, array(&function_147224));
		entity.var_7b1f015a.animation = var_bff64930;
		if(isdefined(var_bff64930))
		{
			splittime = function_382b0cfb(var_bff64930);
			halftime = splittime * 0.5;
			speed = animation::function_a23b2a60(var_bff64930, 0, halftime);
			/#
				record3dtext(((("" + gettime()) + "") + function_9e72a96(var_bff64930) + "") + speed, entity.origin, (1, 0.5, 0), "", entity);
			#/
			entity.var_3b77553e = speed;
			entity.var_7b1f015a.pos = entity.var_14b548c5;
			entity.var_7b1f015a.angle = entity.var_871c9e86;
			entity.var_7b1f015a.var_568d90d2 = function_15a5703b(#"human", entity function_359fd121());
			return var_bff64930;
		}
		/#
			record3dtext(("" + gettime()) + "", entity.origin, (1, 0.5, 0), "", entity);
		#/
		entity.var_3b77553e = -1;
		return var_bff64930;
	}
	/#
		record3dtext(("" + gettime()) + "", entity.origin, (1, 0.5, 0), "", entity);
	#/
	entity.var_3b77553e = -1;
	return undefined;
}

/*
	Name: function_fe8e7e36
	Namespace: animation_selector_table_evaluators
	Checksum: 0xF538E994
	Offset: 0x2B10
	Size: 0xC6
	Parameters: 1
	Flags: Linked, Private
*/
function private function_fe8e7e36(point)
{
	if(abs(self.pathgoalpos[2] - self.origin[2]) > 0.5)
	{
		trace = groundtrace(point + vectorscale((0, 0, 1), 72), point + (vectorscale((0, 0, -1), 72)), 0, 0, 0);
		point = (point[0], point[1], trace[#"position"][2] + 6);
	}
	return point;
}

/*
	Name: function_147224
	Namespace: animation_selector_table_evaluators
	Checksum: 0xF5C6F17B
	Offset: 0x2BE0
	Size: 0x368
	Parameters: 2
	Flags: Linked, Private
*/
function private function_147224(entity, animation)
{
	pixbeginevent();
	/#
		assert(isactor(entity));
	#/
	midpoint = (entity.var_14b548c5[0], entity.var_14b548c5[1], entity.origin[2] + 6);
	midpoint = entity function_fe8e7e36(midpoint);
	splittime = function_382b0cfb(animation);
	localdeltahalfvector = getmovedelta(animation, 0, splittime);
	var_3f5aa15b = distance2dsquared(entity.origin, midpoint);
	if(var_3f5aa15b > 0 && var_3f5aa15b < length2dsquared(localdeltahalfvector))
	{
		pixendevent();
		return 0;
	}
	entrypoint = midpoint + (vectornormalize(entity.origin - midpoint)) * length(localdeltahalfvector);
	entrypoint = entity function_fe8e7e36(entrypoint);
	if(entity maymovefrompointtopoint(entrypoint, midpoint, 1, 1, entity, 0.75))
	{
		/#
			recordline(midpoint, entrypoint, (1, 0.5, 0), "", entity);
		#/
		codemovetime = function_199662d1(animation);
		var_16ebe729 = getmovedelta(animation, 0, codemovetime);
		var_d66f5018 = vectortoangles(midpoint - entrypoint);
		endpoint = function_323c3bee(var_16ebe729, entrypoint, var_d66f5018);
		endpoint = entity function_fe8e7e36(endpoint);
		if(entity maymovefrompointtopoint(midpoint, endpoint, 1, 1, entity, 0.75))
		{
			/#
				recordline(midpoint, endpoint, (0, 1, 0), "", entity);
			#/
			pixendevent();
			return 1;
		}
		/#
			recordline(midpoint, endpoint, (1, 0, 0), "", entity);
		#/
	}
	else
	{
		/#
			recordline(midpoint, entrypoint, (1, 0, 0), "", entity);
		#/
	}
	pixendevent();
	return 0;
}

/*
	Name: humandeathevaluation
	Namespace: animation_selector_table_evaluators
	Checksum: 0xFA4E8D43
	Offset: 0x2F58
	Size: 0x184
	Parameters: 2
	Flags: Linked, Private
*/
function private humandeathevaluation(entity, animations)
{
	var_bec12c3d = 0;
	if((isdefined(self.script_longdeath) ? self.script_longdeath : 1) == 0 || (isdefined(level.var_d03f21c6) ? level.var_d03f21c6 : 0) > gettime())
	{
		var_bec12c3d = 1;
	}
	var_f4e2809d = undefined;
	if(var_bec12c3d)
	{
		validcount = 0;
		for(i = 0; i < animations.size; i++)
		{
			length = getanimlength(animations[i]);
			if(length < 4)
			{
				validcount++;
				if(randomint(validcount) == (validcount - 1))
				{
					var_f4e2809d = animations[i];
				}
			}
		}
	}
	else
	{
		randomindex = randomint(animations.size);
		var_f4e2809d = animations[randomindex];
		length = getanimlength(var_f4e2809d);
		if(length >= 4)
		{
			level.var_d03f21c6 = gettime() + 30000;
		}
	}
	return var_f4e2809d;
}

