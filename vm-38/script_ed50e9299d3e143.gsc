#using script_3aa0f32b70d4f7cb;
#using script_4bf952f6ba31bb17;
#using script_caf007e2a98afa2;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;

#namespace namespace_47c5b560;

/*
	Name: function_4d940c43
	Namespace: namespace_47c5b560
	Checksum: 0x1BD4938B
	Offset: 0x250
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_4d940c43()
{
	level notify(105798457);
}

/*
	Name: function_89f2df9
	Namespace: namespace_47c5b560
	Checksum: 0xAC30034B
	Offset: 0x270
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_75d08e0bf3b9e062", &function_70a657d8, &init, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_47c5b560
	Checksum: 0x779B31F8
	Offset: 0x2C8
	Size: 0x14
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	function_cb019e1f();
}

/*
	Name: init
	Namespace: namespace_47c5b560
	Checksum: 0x78F9C9C6
	Offset: 0x2E8
	Size: 0x1C
	Parameters: 0
	Flags: Linked, Private
*/
function private init()
{
	level thread function_93a22b64();
}

/*
	Name: function_93a22b64
	Namespace: namespace_47c5b560
	Checksum: 0x71D1F6BC
	Offset: 0x310
	Size: 0x54
	Parameters: 0
	Flags: Linked, Private
*/
function private function_93a22b64()
{
	level endon(#"end_game");
	level flag::wait_till("zones_initialized");
	function_73773e63();
	function_72451c14();
}

/*
	Name: function_cb019e1f
	Namespace: namespace_47c5b560
	Checksum: 0xB1ABCA8A
	Offset: 0x370
	Size: 0x534
	Parameters: 0
	Flags: Linked, Private
*/
function private function_cb019e1f()
{
	/#
		assert(isscriptfunctionptr(&function_e6bb5366));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("aiLeapGoalService", &function_e6bb5366, 1);
	/#
		assert(isscriptfunctionptr(&function_a69c4b69));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("aiShouldLeap", &function_a69c4b69);
	/#
		assert(isscriptfunctionptr(&function_602211f7));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("aiIsLeaping", &function_602211f7);
	/#
		assert(isscriptfunctionptr(&function_5bfaa15d));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("aiShouldLeapFollowPath", &function_5bfaa15d);
	/#
		assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
	#/
	/#
		assert(!isdefined(&function_b12119f0) || isscriptfunctionptr(&function_b12119f0));
	#/
	/#
		assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction("aiLeapLoop", undefined, &function_b12119f0, undefined);
	/#
		assert(!isdefined(&function_21a9aefd) || isscriptfunctionptr(&function_21a9aefd));
	#/
	/#
		assert(!isdefined(&function_3cc9b7f6) || isscriptfunctionptr(&function_3cc9b7f6));
	#/
	/#
		assert(!isdefined(&function_9952445c) || isscriptfunctionptr(&function_9952445c));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction("aiLeapPathLoop", &function_21a9aefd, &function_3cc9b7f6, &function_9952445c);
	/#
		assert(isscriptfunctionptr(&function_34761c6c));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("aiLeapStart", &function_34761c6c);
	/#
		assert(isscriptfunctionptr(&function_dccd852a));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("aiLeapTerminate", &function_dccd852a);
	animationstatenetwork::registeranimationmocomp("mocomp_ai_leap", &function_92a98e31, &function_f14ad812, &function_a8ad5ef0);
	animationstatenetwork::registeranimationmocomp("mocomp_ai_leap_face_goal", &function_f4e094cf, undefined, &function_4e828c3b);
	animationstatenetwork::registeranimationmocomp("mocomp_ai_leap_path", &function_384fce1f, &function_a53a095f, &function_2534f25d);
}

/*
	Name: function_73773e63
	Namespace: namespace_47c5b560
	Checksum: 0x84856383
	Offset: 0x8B0
	Size: 0x1C8
	Parameters: 0
	Flags: Linked, Private
*/
function private function_73773e63()
{
	var_4f660cad = struct::get_array("pl_mez_nd", "script_noteworthy");
	if(var_4f660cad.size == 0)
	{
		return;
	}
	foreach(struct in var_4f660cad)
	{
		if(isdefined(struct.target))
		{
			target = struct::get(struct.target, "targetname");
			if(isdefined(target))
			{
				if(isdefined(struct.var_ffd3022f) && isdefined(target.var_ffd3022f))
				{
					struct.var_22043f8e = target.origin;
					struct.var_163558df = target.var_ffd3022f;
					function_91d135a3(struct.origin, target.origin, "rappel", struct);
					continue;
				}
				if(isdefined(struct.var_b4a3c7c5) && isdefined(target.var_b4a3c7c5))
				{
					struct.var_22043f8e = target.origin;
					struct.var_163558df = target.var_b4a3c7c5;
					function_91d135a3(struct.origin, target.origin, "zipline", struct);
				}
			}
		}
	}
}

/*
	Name: function_52c99a4f
	Namespace: namespace_47c5b560
	Checksum: 0xE3319800
	Offset: 0xA80
	Size: 0x3E4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_52c99a4f(entity)
{
	var_8657abc1 = 0;
	if(isdefined(entity.var_4b559171))
	{
		goalpos = getclosestpointonnavmesh(entity.var_4b559171, 256, entity getpathfindingradius() * 1.2);
		if(entity.var_bfd4c4c4 === entity.var_4b559171)
		{
			var_af225c86 = is_true(entity.var_5445693e);
			entity function_c2576f59();
			var_8657abc1 = 1;
		}
		entity.var_4b559171 = undefined;
	}
	else
	{
		var_1f2328d0 = entity function_4794d6a3();
		if(!isdefined(var_1f2328d0) || !isdefined(var_1f2328d0.goalpos))
		{
			return undefined;
		}
		if(isdefined(entity.favoriteenemy))
		{
			velocity = entity.favoriteenemy getvelocity();
			goalpos = var_1f2328d0.goalpos + (velocity * 1);
			goalpos = getclosestpointonnavmesh(goalpos, 256, entity getpathfindingradius() * 1.2);
		}
		else
		{
			if(is_true(entity.var_1fa24724) && isdefined(entity.enemy))
			{
				position = entity.enemy.origin;
				if(isdefined(entity.var_6178722c))
				{
					var_82d5baa6 = getrandomnavpoint(position, min(entity.var_6178722c, 5) * 50);
					if(isdefined(var_82d5baa6))
					{
						position = var_82d5baa6;
					}
				}
				goalpos = getclosestpointonnavmesh(position, 256, entity getpathfindingradius() * 1.2);
			}
			else
			{
				goalpos = getclosestpointonnavmesh(var_1f2328d0.goalpos, 256, entity getpathfindingradius() * 1.2);
			}
		}
		if(!isdefined(goalpos))
		{
			return undefined;
		}
		if(isdefined(entity.favoriteenemy) && distancesquared(entity.favoriteenemy.origin, goalpos) < sqr(96))
		{
			to_origin = entity.origin - goalpos;
			goalpos = checknavmeshdirection(goalpos, to_origin, 96, entity getpathfindingradius() * 1.2);
		}
	}
	if(isdefined(entity.var_e9a867e0) && !entity [[entity.var_e9a867e0]](goalpos))
	{
		return undefined;
	}
	return {#hash_af225c86:var_af225c86, #hash_8657abc1:var_8657abc1, #goalpos:goalpos};
}

/*
	Name: function_e6bb5366
	Namespace: namespace_47c5b560
	Checksum: 0x925EA039
	Offset: 0xE70
	Size: 0xC9E
	Parameters: 1
	Flags: Linked
*/
function function_e6bb5366(entity)
{
	if(isdefined(entity.var_862cb24b) || gettime() < entity.var_1e185a34 || !is_true(entity.var_7c4488fd) || isdefined(entity.var_ed09bf93))
	{
		return false;
	}
	if(is_true(entity.var_2b5f41fd))
	{
		if(function_673035b3(entity.var_6da37a9a))
		{
			/#
				if(getdvarint(#"hash_6a18a97ccb2ee1d8", 0))
				{
					println(("" + "") + entity getentitynumber() + "");
				}
			#/
			entity.var_2b5f41fd = undefined;
			entity.v_zombie_custom_goal_pos = undefined;
			entity.var_5445693e = undefined;
			entity function_56c12f58(entity.var_6da37a9a, 1);
			entity.var_ed09bf93 = function_c8c99c9f(entity.var_6da37a9a);
			entity.var_6da37a9a.nextpos = undefined;
			return true;
		}
		return false;
	}
	var_f0d4ca02 = function_52c99a4f(entity);
	if(!isdefined(var_f0d4ca02.goalpos))
	{
		entity function_3113dfa4();
		return false;
	}
	goalpos = var_f0d4ca02.goalpos;
	var_8657abc1 = var_f0d4ca02.var_8657abc1;
	var_af225c86 = var_f0d4ca02.var_af225c86;
	var_ab0e4f00 = (isdefined(self.var_535fbaa3) ? self.var_535fbaa3 : 500);
	var_db31ebd5 = !entity haspath() && (abs(goalpos[2] - entity.origin[2])) > 120;
	if(!is_true(var_8657abc1) && !var_db31ebd5 && distance2dsquared(entity.origin, goalpos) <= sqr(var_ab0e4f00) && (abs(entity.origin[2] - goalpos[2])) <= 2000)
	{
		entity function_3113dfa4();
		return false;
	}
	gravity = (is_true(entity.is_zombie) ? 5 : 4.5);
	startpos = entity.origin + getmovedelta(#"hash_2cf640e3ec8ad827", 0, 1);
	distance2d = distance2d(goalpos, startpos);
	dir = goalpos - startpos;
	dir = (dir[0], dir[1], 0);
	dir = vectornormalize(dir);
	time = mapfloat(var_ab0e4f00, 10000, 1, 3.5, distance2d);
	/#
		record3dtext(time, entity.origin, (0, 0, 1), "", entity);
	#/
	time = time / (float(function_60d95f53()) / 1000);
	var_199c57d2 = distance2d / time;
	var_ef97a46c = (goalpos[2] - startpos[2]) + (0.5 * gravity) * sqr(time) / time;
	entity.var_862cb24b = {#hash_af225c86:isdefined(var_af225c86), #vel:(dir[0] * var_199c57d2, dir[1] * var_199c57d2, var_ef97a46c), #to_goal:goalpos - startpos, #goal:goalpos, #nextpos:startpos, #startpos:startpos, #time:1};
	entity.var_862cb24b.nextpos = (entity.var_862cb24b.startpos + (entity.var_862cb24b.vel * entity.var_862cb24b.time)) + ((0.5 * (0, 0, -1)) * gravity) * sqr(entity.var_862cb24b.time);
	/#
		recordsphere(entity.var_862cb24b.goal, 10, (0, 0, 1), "", entity);
		recordline(startpos, entity.var_862cb24b.goal, (0, 0, 1), "", entity);
		prev_origin = startpos;
		for(i = 1; i <= time; i++)
		{
			pos = (entity.var_862cb24b.startpos + (entity.var_862cb24b.vel * i)) + ((0.5 * (0, 0, -1)) * gravity) * sqr(i);
			recordline(prev_origin, pos, (0, 0, 1), "", entity);
			record3dtext(i, pos, (0, 0, 1), "", entity);
			prev_origin = pos;
		}
		recordline(prev_origin, entity.var_862cb24b.goal, (0, 0, 1), "", entity);
		record3dtext(i, entity.var_862cb24b.goal, (0, 0, 1), "", entity);
	#/
	prev_origin = entity.origin;
	passed = 1;
	if(!is_true(var_af225c86))
	{
		for(i = 1; i <= 5; i++)
		{
			var_21dd2ef6 = (time / 5) * i;
			pos = (entity.var_862cb24b.startpos + (entity.var_862cb24b.vel * var_21dd2ef6)) + ((0.5 * (0, 0, -1)) * gravity) * sqr(var_21dd2ef6);
			if(isdefined(entity.var_e9a867e0) && !entity [[entity.var_e9a867e0]](pos))
			{
				/#
					recordline(prev_origin, pos, (1, 0, 0), "", entity);
				#/
				passed = 0;
				break;
			}
			traceresult = physicstraceex(prev_origin, pos, entity getmins(), entity getmaxs(), entity);
			/#
				if(getdvarint(#"hash_1d3e8e41a505eb61", 0))
				{
					line(prev_origin, pos, (1, 0, 0), 1, 0, 300);
					sphere(traceresult[#"position"], 5, (1, 1, 0), 1, 1, 8, 300);
					line(traceresult[#"position"], traceresult[#"position"] + (traceresult[#"normal"] * 20), (1, 1, 0), 1, 0, 300);
				}
			#/
			if(traceresult[#"fraction"] != 1)
			{
				if(traceresult[#"normal"][2] < sin(10))
				{
					/#
						recordline(prev_origin, pos, (1, 0, 0), "", entity);
						recordsphere(traceresult[#"position"], 5, (1, 1, 0), "", entity);
						recordline(traceresult[#"position"], traceresult[#"position"] + (traceresult[#"normal"] * 20), (1, 1, 0), "", entity);
					#/
					passed = 0;
					break;
				}
				var_55853a47 = function_9cc082d2(traceresult[#"position"], 2 * 39.37008);
				if(!isdefined(var_55853a47))
				{
					/#
						recordline(prev_origin, pos, (1, 0, 0), "", entity);
					#/
					passed = 0;
					break;
				}
				if(isdefined(entity.var_e9a867e0) && !entity [[entity.var_e9a867e0]](var_55853a47[#"point"]))
				{
					/#
						recordline(prev_origin, pos, (1, 0, 0), "", entity);
					#/
					passed = 0;
					break;
				}
			}
			/#
				recordline(prev_origin, pos, (0, 1, 0), "", entity);
			#/
			prev_origin = pos;
		}
	}
	if(!isdefined(entity.var_6178722c))
	{
		entity.var_6178722c = 0;
	}
	if(!passed)
	{
		entity.var_862cb24b = undefined;
		entity.var_a8eff0f2 = gettime();
		entity.var_6178722c++;
		if(!is_true(var_8657abc1))
		{
			entity function_3113dfa4();
		}
		return false;
	}
	entity.var_6178722c = 0;
	return true;
}

/*
	Name: function_a69c4b69
	Namespace: namespace_47c5b560
	Checksum: 0x8CDE51CA
	Offset: 0x1B18
	Size: 0x36
	Parameters: 1
	Flags: Linked
*/
function function_a69c4b69(entity)
{
	if(isdefined(entity.var_862cb24b) || isdefined(entity.var_ed09bf93))
	{
		return true;
	}
	return false;
}

/*
	Name: function_602211f7
	Namespace: namespace_47c5b560
	Checksum: 0xC373E1AE
	Offset: 0x1B58
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function function_602211f7(entity)
{
	if(isdefined(entity.var_1eb8b1ad))
	{
		return true;
	}
	return false;
}

/*
	Name: function_5bfaa15d
	Namespace: namespace_47c5b560
	Checksum: 0xB1B12D15
	Offset: 0x1B88
	Size: 0x36
	Parameters: 1
	Flags: Linked, Private
*/
function private function_5bfaa15d(entity)
{
	if(isdefined(entity.var_6da37a9a) && isdefined(entity.var_ed09bf93))
	{
		return true;
	}
	return false;
}

/*
	Name: function_b12119f0
	Namespace: namespace_47c5b560
	Checksum: 0x56DD7FA5
	Offset: 0x1BC8
	Size: 0x398
	Parameters: 2
	Flags: Linked
*/
function function_b12119f0(entity, asmstatename)
{
	if(!isdefined(entity.var_862cb24b))
	{
		return 4;
	}
	if(entity asmgetstatus() == "asm_status_complete" && isdefined(asmstatename))
	{
		animationstatenetworkutility::requeststate(entity, asmstatename);
	}
	gravity = (is_true(self.is_zombie) ? 5 : 4.5);
	entity.var_862cb24b.time = entity.var_862cb24b.time + 1;
	entity.var_862cb24b.nextpos = (entity.var_862cb24b.startpos + (entity.var_862cb24b.vel * entity.var_862cb24b.time)) + ((0.5 * (0, 0, -1)) * gravity) * sqr(entity.var_862cb24b.time);
	var_f423e961 = entity.var_862cb24b.goal - entity.var_862cb24b.nextpos;
	if(vectordot((var_f423e961[0], var_f423e961[1], 0), (entity.var_862cb24b.to_goal[0], entity.var_862cb24b.to_goal[1], 0)) < 0)
	{
		/#
			recordsphere(entity.var_862cb24b.goal, 10, (0, 1, 0), "", entity);
			recordline(entity.origin, entity.var_862cb24b.goal, (0, 1, 0), "", entity);
		#/
		entity.var_862cb24b.endpos = entity.var_862cb24b.goal;
		return 4;
	}
	if(!is_true(entity.var_862cb24b.var_af225c86))
	{
		traceresult = physicstraceex(entity.origin, entity.var_862cb24b.nextpos, entity getmins(), entity getmaxs(), entity);
		if(traceresult[#"fraction"] != 1)
		{
			/#
				recordsphere(traceresult[#"position"], 10, (0, 1, 0), "", entity);
				recordline(entity.origin, traceresult[#"position"], (0, 1, 0), "", entity);
			#/
			entity.var_862cb24b.endpos = traceresult[#"position"];
			return 4;
		}
	}
	return 5;
}

/*
	Name: function_21a9aefd
	Namespace: namespace_47c5b560
	Checksum: 0x3DA94A6B
	Offset: 0x1F68
	Size: 0x4A
	Parameters: 2
	Flags: Linked, Private
*/
function private function_21a9aefd(entity, asmstatename)
{
	animationstatenetworkutility::requeststate(entity, asmstatename);
	if(isdefined(entity.var_ed09bf93))
	{
		entity.var_4082a1ab = undefined;
	}
	return 5;
}

/*
	Name: function_3cc9b7f6
	Namespace: namespace_47c5b560
	Checksum: 0xCE60304A
	Offset: 0x1FC0
	Size: 0x236
	Parameters: 2
	Flags: Linked, Private
*/
function private function_3cc9b7f6(entity, asmstatename)
{
	if(!isdefined(entity.var_ed09bf93))
	{
		return 4;
	}
	if(entity asmgetstatus() == "asm_status_complete" && isdefined(asmstatename))
	{
		animationstatenetworkutility::requeststate(entity, asmstatename);
	}
	new_node = undefined;
	if(!isdefined(entity.var_4082a1ab))
	{
		new_node = entity.var_ed09bf93;
	}
	else if(gettime() >= entity.var_4082a1ab)
	{
		new_node = entity function_c8c99c9f(entity.var_ed09bf93);
	}
	if(isdefined(new_node))
	{
		entity.var_ed09bf93 = new_node;
	}
	velocity = (isdefined(entity.var_fbe88cc3) ? entity.var_fbe88cc3 : 800);
	dir = vectornormalize(entity.var_ed09bf93.origin - entity.origin);
	entity.var_6da37a9a.nextpos = entity.origin + (dir * velocity) * (float(function_60d95f53()) / 1000);
	if(isdefined(new_node))
	{
		dist = distance(entity.var_ed09bf93.origin, entity.origin);
		move_time = dist / velocity;
		entity.var_4082a1ab = gettime() + (int(move_time * 1000));
	}
	else if(gettime() >= entity.var_4082a1ab)
	{
		return 4;
	}
	return 5;
}

/*
	Name: function_9952445c
	Namespace: namespace_47c5b560
	Checksum: 0x44166D20
	Offset: 0x2200
	Size: 0x2C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_9952445c(entity, asmstatename)
{
	asmstatename notify(#"hash_607879be8202b639");
	return 4;
}

/*
	Name: function_34761c6c
	Namespace: namespace_47c5b560
	Checksum: 0xB303EAF4
	Offset: 0x2238
	Size: 0xB4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_34761c6c(entity)
{
	/#
		if(getdvarint(#"hash_6a18a97ccb2ee1d8", 0))
		{
			println((("" + "") + self getentitynumber() + "") + entity.origin);
		}
	#/
	entity.var_1eb8b1ad = 1;
	entity callback::callback(#"hash_2f9649a28e92ce9d");
}

/*
	Name: function_dccd852a
	Namespace: namespace_47c5b560
	Checksum: 0x5EB67AFC
	Offset: 0x22F8
	Size: 0x104
	Parameters: 1
	Flags: Linked, Private
*/
function private function_dccd852a(entity)
{
	entity.var_1eb8b1ad = undefined;
	if(isdefined(entity.var_e34ba400) && isdefined(entity.var_a87eb847))
	{
		entity.var_d27dc378 = (gettime() + entity.var_e34ba400) + (randomfloat(entity.var_a87eb847 - entity.var_e34ba400));
	}
	else
	{
		if(!is_true(entity.is_zombie))
		{
			entity.var_1e185a34 = (gettime() + 3000) + randomfloat(2000);
		}
		else
		{
			entity.var_1e185a34 = (gettime() + 1000) + randomfloat(500);
		}
	}
	entity callback::callback(#"hash_49bf4815e9501d2");
}

/*
	Name: function_92a98e31
	Namespace: namespace_47c5b560
	Checksum: 0x5DBCC831
	Offset: 0x2408
	Size: 0x13C
	Parameters: 5
	Flags: Linked, Private
*/
function private function_92a98e31(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	mocompduration animmode("zonly_physics", 1);
	mocompduration pathmode("dont move");
	mocompduration.blockingpain = 1;
	if(isdefined(mocompduration.var_862cb24b) && isvec(mocompduration.var_862cb24b.vel))
	{
		angles = vectortoangles((mocompduration.var_862cb24b.vel[0], mocompduration.var_862cb24b.vel[1], 0));
		if(isvec(angles))
		{
			mocompduration orientmode("face angle", angles[1]);
		}
	}
}

/*
	Name: function_f14ad812
	Namespace: namespace_47c5b560
	Checksum: 0xDAA95501
	Offset: 0x2550
	Size: 0x74
	Parameters: 5
	Flags: Linked, Private
*/
function private function_f14ad812(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	if(isdefined(mocompduration.var_862cb24b.nextpos))
	{
		mocompduration forceteleport(mocompduration.var_862cb24b.nextpos, mocompduration.angles, 0);
	}
}

/*
	Name: function_a8ad5ef0
	Namespace: namespace_47c5b560
	Checksum: 0x2993E372
	Offset: 0x25D0
	Size: 0xB6
	Parameters: 5
	Flags: Linked, Private
*/
function private function_a8ad5ef0(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	if(isdefined(mocompduration.var_862cb24b.endpos))
	{
		mocompduration forceteleport(mocompduration.var_862cb24b.endpos, mocompduration.angles, 1);
	}
	mocompduration pathmode("move allowed", 1);
	mocompduration.blockingpain = 0;
	mocompduration.var_862cb24b = undefined;
	mocompduration.jumpgoal = undefined;
}

/*
	Name: function_f4e094cf
	Namespace: namespace_47c5b560
	Checksum: 0x3DF64572
	Offset: 0x2690
	Size: 0x154
	Parameters: 5
	Flags: Linked, Private
*/
function private function_f4e094cf(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	mocompduration pathmode("dont move");
	mocompduration.blockingpain = 1;
	mocompduration animmode("zonly_physics", 1);
	if(isdefined(mocompduration.var_862cb24b) && isvec(mocompduration.var_862cb24b.vel))
	{
		angles = vectortoangles((mocompduration.var_862cb24b.vel[0], mocompduration.var_862cb24b.vel[1], 0));
		if(isvec(angles))
		{
			mocompduration orientmode("face angle", angles[1]);
		}
	}
	function_37e9153e(mocompduration);
}

/*
	Name: function_4e828c3b
	Namespace: namespace_47c5b560
	Checksum: 0x61AFE84F
	Offset: 0x27F0
	Size: 0x56
	Parameters: 5
	Flags: Linked, Private
*/
function private function_4e828c3b(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	mocompduration pathmode("move allowed");
	mocompduration.blockingpain = 0;
}

/*
	Name: function_384fce1f
	Namespace: namespace_47c5b560
	Checksum: 0x9AB1C5B5
	Offset: 0x2850
	Size: 0x8C
	Parameters: 5
	Flags: Linked, Private
*/
function private function_384fce1f(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	mocompduration animmode("zonly_physics", 1);
	mocompduration pathmode("dont move");
	mocompduration.blockingpain = 1;
	function_37e9153e(mocompduration);
}

/*
	Name: function_a53a095f
	Namespace: namespace_47c5b560
	Checksum: 0xB3F1C12F
	Offset: 0x28E8
	Size: 0x8C
	Parameters: 5
	Flags: Linked, Private
*/
function private function_a53a095f(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	function_37e9153e(mocompduration);
	if(isdefined(mocompduration.var_6da37a9a.nextpos))
	{
		mocompduration forceteleport(mocompduration.var_6da37a9a.nextpos, mocompduration.angles, 0);
	}
}

/*
	Name: function_2534f25d
	Namespace: namespace_47c5b560
	Checksum: 0x2B67DA20
	Offset: 0x2980
	Size: 0x10C
	Parameters: 5
	Flags: Linked, Private
*/
function private function_2534f25d(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	if(isdefined(mocompduration.var_ed09bf93))
	{
		radius = mocompduration getpathfindingradius();
		closestnavmeshpoint = getclosestpointonnavmesh(mocompduration.var_ed09bf93.origin, radius * 2, radius * 1.2);
		if(isdefined(closestnavmeshpoint))
		{
			mocompduration forceteleport(closestnavmeshpoint, mocompduration.angles, 1);
		}
	}
	mocompduration pathmode("move allowed", 1);
	mocompduration.blockingpain = 0;
	mocompduration function_240680df();
}

/*
	Name: function_37e9153e
	Namespace: namespace_47c5b560
	Checksum: 0xA303ECF7
	Offset: 0x2A98
	Size: 0xA4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_37e9153e(entity)
{
	if(isdefined(entity.var_ed09bf93))
	{
		forward = entity.var_ed09bf93.origin - entity.origin;
		angles = vectortoangles(forward);
		if(isvec(angles))
		{
			entity orientmode("face angle", angles[1]);
		}
	}
}

/*
	Name: function_376516c9
	Namespace: namespace_47c5b560
	Checksum: 0x60BA41B4
	Offset: 0x2B48
	Size: 0x376
	Parameters: 0
	Flags: Linked, Private
*/
function private function_376516c9()
{
	level endon(#"end_game");
	self endon(#"death");
	if(!function_fcfdadcd())
	{
		return;
	}
	while(true)
	{
		if(isdefined(self.var_862cb24b) || !is_true(self.var_7c4488fd))
		{
			waitframe(1);
			continue;
		}
		var_bf810675 = self.favoriteenemy;
		if(isdefined(self.var_6d409ca1))
		{
			var_bf810675 = [[self.var_6d409ca1]]();
		}
		if(!isdefined(var_bf810675))
		{
			self notify(#"hash_28e8830c0f1354d2");
			self.var_73915a58 = undefined;
		}
		else if(self.var_73915a58 !== var_bf810675)
		{
			self.var_73915a58 = var_bf810675;
			if(!function_602211f7(self))
			{
				/#
					if(getdvarint(#"hash_6a18a97ccb2ee1d8", 0))
					{
						println(("" + "") + self getentitynumber() + "");
					}
				#/
				self function_c2576f59();
				self function_240680df();
				self.var_2b5f41fd = undefined;
				self.var_c7f5b6e1 = undefined;
			}
			else
			{
				/#
					println(("" + "") + self getentitynumber() + "");
				#/
				if(getdvarint(#"hash_6a18a97ccb2ee1d8", 0))
				{
				}
			}
			if(!is_true(self.var_ba00404c))
			{
				self thread function_b3069b6c(var_bf810675);
			}
		}
		if(isdefined(self.v_zombie_custom_goal_pos) && (isdefined(self.var_bfd4c4c4) || isdefined(self.var_6da37a9a)))
		{
			if(distance2dsquared(self.origin, self.v_zombie_custom_goal_pos) <= sqr(self.goalradius))
			{
				/#
					if(getdvarint(#"hash_6a18a97ccb2ee1d8", 0))
					{
						println((("" + "") + self getentitynumber() + "") + self.v_zombie_custom_goal_pos);
					}
				#/
				if(isdefined(self.var_bfd4c4c4))
				{
					self.var_4b559171 = self.var_bfd4c4c4;
				}
				else
				{
					self.var_2b5f41fd = 1;
				}
			}
			else
			{
				self function_3e83b6c5(self.v_zombie_custom_goal_pos);
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_3e83b6c5
	Namespace: namespace_47c5b560
	Checksum: 0x4578CA37
	Offset: 0x2EC8
	Size: 0x3AE
	Parameters: 1
	Flags: Linked, Private
*/
function private function_3e83b6c5(targetpos)
{
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
		if(var_75dd804d > var_2b8b6d3f && !is_false(self.should_zigzag))
		{
			angle = randomfloatrange(-180, 180);
			distance = randomfloatrange(16, 128);
			if(isdefined(self.var_60d1126a))
			{
				struct = [[self.var_60d1126a]](self, targetpos);
				if(isdefined(struct))
				{
					/#
						/#
							assert(isdefined(struct.angle) && isdefined(struct.dist), "");
						#/
					#/
					angle = struct.angle;
					distance = struct.dist;
				}
			}
			goalpos = checknavmeshdirection(targetpos, function_ba142845(angle), distance, self getpathfindingradius() * 1.1);
			self.var_d9a37fc4 = 1;
		}
		self setgoal(goalpos, undefined, undefined, undefined, undefined, 1);
		self.var_9e6e6645 = targetpos;
		self.nextgoalupdate = gettime() + randomintrange(500, 1000);
	}
}

/*
	Name: function_b3069b6c
	Namespace: namespace_47c5b560
	Checksum: 0x31FE77FB
	Offset: 0x3280
	Size: 0x1C0
	Parameters: 1
	Flags: Linked, Private
*/
function private function_b3069b6c(target)
{
	if(!isplayer(target))
	{
		return;
	}
	self notify(#"hash_28e8830c0f1354d2");
	self endon(#"hash_28e8830c0f1354d2", #"death");
	target endon(#"death", #"disconnect");
	var_8787728e = self zm_utility::get_current_zone();
	if(!isdefined(var_8787728e))
	{
		var_8787728e = self.var_5e54763a;
	}
	if(isplayer(target))
	{
		var_427872c2 = target.cached_zone_name;
	}
	else
	{
		var_427872c2 = target zm_utility::get_current_zone();
	}
	if(isdefined(var_427872c2))
	{
		self function_fe23c655(var_8787728e, var_427872c2);
	}
	while(true)
	{
		waitresult = undefined;
		waitresult = target waittill(#"hash_2d4daa9e80b86b60");
		if(!isdefined(waitresult.zone_name) || waitresult.zone_name === var_427872c2)
		{
			continue;
		}
		var_427872c2 = waitresult.zone_name;
		var_8787728e = self zm_utility::get_current_zone();
		self function_fe23c655(var_8787728e, waitresult.zone_name);
	}
}

/*
	Name: function_fe23c655
	Namespace: namespace_47c5b560
	Checksum: 0xA5EFF28D
	Offset: 0x3448
	Size: 0x19C
	Parameters: 2
	Flags: Linked
*/
function function_fe23c655(var_8787728e, var_5f3b05e8)
{
	if(!(isdefined(var_8787728e) && isdefined(var_5f3b05e8)))
	{
		return;
	}
	if(self function_72371f2a() || function_a69c4b69(self) || function_602211f7(self))
	{
		/#
			if(getdvarint(#"hash_6a18a97ccb2ee1d8", 0))
			{
				println(((((("" + "") + self getentitynumber() + "") + var_8787728e) + "") + var_5f3b05e8) + "");
			}
		#/
		self.var_7df7df47 = var_5f3b05e8;
	}
	else
	{
		/#
			println((((("" + "") + self getentitynumber() + "") + var_8787728e) + "") + var_5f3b05e8);
		#/
		if(getdvarint(#"hash_6a18a97ccb2ee1d8", 0))
		{
		}
		self function_a6b0387d(var_8787728e, var_5f3b05e8);
	}
}

/*
	Name: function_3113dfa4
	Namespace: namespace_47c5b560
	Checksum: 0x684B59B4
	Offset: 0x35F0
	Size: 0x11C
	Parameters: 0
	Flags: Linked
*/
function function_3113dfa4()
{
	if(self function_72371f2a())
	{
		return;
	}
	if(!isdefined(self.var_73915a58))
	{
		return;
	}
	if(!isdefined(self.var_c7f5b6e1) || self.var_c7f5b6e1.size == 0)
	{
		return;
	}
	var_182df905 = self.var_c7f5b6e1[0];
	if(isdefined(self.var_4d607241))
	{
		if(!self [[self.var_4d607241]](var_182df905))
		{
			return;
		}
	}
	if(var_182df905.type == "rappel" || var_182df905.type == "zipline")
	{
		if(!self function_951ed389())
		{
			self function_236cda12();
		}
	}
	else if(var_182df905.type == "ladder")
	{
		self function_d21249bf();
	}
}

/*
	Name: function_72371f2a
	Namespace: namespace_47c5b560
	Checksum: 0xC17F3B5C
	Offset: 0x3718
	Size: 0x1A
	Parameters: 0
	Flags: Linked
*/
function function_72371f2a()
{
	return isdefined(self.var_bfd4c4c4) || isdefined(self.var_6da37a9a);
}

/*
	Name: function_951ed389
	Namespace: namespace_47c5b560
	Checksum: 0x8A7AEED7
	Offset: 0x3740
	Size: 0xCC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_951ed389()
{
	var_182df905 = self.var_c7f5b6e1[0];
	rappel_struct = undefined;
	if(isdefined(var_182df905.var_7d6b86d8))
	{
		if(isdefined(var_182df905.var_7d6b86d8.var_22043f8e))
		{
			arrayremoveindex(self.var_c7f5b6e1, 0);
			rappel_struct = var_182df905.var_7d6b86d8;
		}
	}
	if(isdefined(rappel_struct))
	{
		if(!self function_1c7692a4(rappel_struct.origin, rappel_struct.var_22043f8e))
		{
			self function_c2576f59();
		}
		return true;
	}
	return false;
}

/*
	Name: function_ca7b4071
	Namespace: namespace_47c5b560
	Checksum: 0xE1E0BE1B
	Offset: 0x3818
	Size: 0x22A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_ca7b4071(origin)
{
	radius = self getpathfindingradius();
	closestnavmeshpoint = getclosestpointonnavmesh(origin, radius * 2, radius);
	if(!isdefined(closestnavmeshpoint))
	{
		closestnavmeshpoint = getclosestpointonnavmesh(origin, radius * 3, radius);
		if(!isdefined(closestnavmeshpoint))
		{
			/#
				if(getdvarint(#"hash_6a18a97ccb2ee1d8", 0))
				{
					println((("" + "") + self getentitynumber() + "") + origin);
				}
			#/
			return;
		}
	}
	if(!zm_zonemgr::function_66bf6a43(closestnavmeshpoint, 0))
	{
		/#
			if(getdvarint(#"hash_6a18a97ccb2ee1d8", 0))
			{
				println(((("" + "") + self getentitynumber() + "") + closestnavmeshpoint) + "");
			}
		#/
		return;
	}
	if(!zm_utility::check_point_in_enabled_zone(closestnavmeshpoint))
	{
		/#
			if(getdvarint(#"hash_6a18a97ccb2ee1d8", 0))
			{
				println(((("" + "") + self getentitynumber() + "") + closestnavmeshpoint) + "");
			}
		#/
		return;
	}
	return closestnavmeshpoint;
}

/*
	Name: function_1c7692a4
	Namespace: namespace_47c5b560
	Checksum: 0xD0A70471
	Offset: 0x3A50
	Size: 0x1A0
	Parameters: 2
	Flags: Linked, Private
*/
function private function_1c7692a4(var_441e6fcc, var_22043f8e)
{
	var_7c2880c0 = self function_ca7b4071(var_441e6fcc);
	var_380469b1 = self function_ca7b4071(var_22043f8e);
	if(isdefined(var_7c2880c0) && isdefined(var_380469b1))
	{
		v_ground = groundtrace(var_7c2880c0 + vectorscale((0, 0, 1), 8), var_7c2880c0 + (vectorscale((0, 0, -1), 100000)), 0, self)[#"position"];
		if(isdefined(v_ground))
		{
			self.var_bfd4c4c4 = var_380469b1;
			self.v_zombie_custom_goal_pos = v_ground;
			self.var_5445693e = 1;
			self clearpath();
			/#
				if(getdvarint(#"hash_6a18a97ccb2ee1d8", 0))
				{
					println((((("" + "") + self getentitynumber() + "") + self.v_zombie_custom_goal_pos) + "") + self.var_bfd4c4c4);
				}
			#/
			if(isdefined(self.var_952959e1))
			{
				self [[self.var_952959e1]]();
			}
		}
		return true;
	}
	return false;
}

/*
	Name: function_c2576f59
	Namespace: namespace_47c5b560
	Checksum: 0x9225C6BF
	Offset: 0x3BF8
	Size: 0x26
	Parameters: 0
	Flags: Linked
*/
function function_c2576f59()
{
	self.var_bfd4c4c4 = undefined;
	self.v_zombie_custom_goal_pos = undefined;
	self.var_5445693e = undefined;
	self.var_fbe88cc3 = undefined;
}

/*
	Name: function_904442b2
	Namespace: namespace_47c5b560
	Checksum: 0x2AAEC480
	Offset: 0x3C28
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_904442b2()
{
	self.var_1e185a34 = 0;
	self thread function_376516c9();
}

/*
	Name: function_72451c14
	Namespace: namespace_47c5b560
	Checksum: 0x10EE7698
	Offset: 0x3C58
	Size: 0x160
	Parameters: 0
	Flags: Linked, Private
*/
function private function_72451c14()
{
	var_be24ab4 = struct::get_array("pl_moveto_nd", "script_noteworthy");
	if(var_be24ab4.size == 0)
	{
		return;
	}
	foreach(struct in var_be24ab4)
	{
		if(!isdefined(struct.var_ffd3022f) && !isdefined(struct.var_b4a3c7c5))
		{
			continue;
		}
		if(!isdefined(struct.target))
		{
			continue;
		}
		end_node = function_550876f3(struct);
		if(!isdefined(end_node))
		{
			continue;
		}
		struct.var_79b30398 = 0;
		function_91d135a3(struct.origin, end_node.origin, (isdefined(struct.var_ffd3022f) ? "rappel" : "zipline"), struct);
	}
}

/*
	Name: function_236cda12
	Namespace: namespace_47c5b560
	Checksum: 0xECC79B25
	Offset: 0x3DC0
	Size: 0x130
	Parameters: 0
	Flags: Linked, Private
*/
function private function_236cda12()
{
	var_182df905 = self.var_c7f5b6e1[0];
	rappel_struct = undefined;
	if(isdefined(var_182df905.var_7d6b86d8))
	{
		if(!isdefined(var_182df905.var_7d6b86d8.var_22043f8e))
		{
			rappel_struct = var_182df905.var_7d6b86d8;
		}
	}
	if(isdefined(rappel_struct))
	{
		arrayremoveindex(self.var_c7f5b6e1, 0);
		self.var_2b5f41fd = undefined;
		var_7c2880c0 = self function_ca7b4071(rappel_struct.origin);
		if(isdefined(var_7c2880c0))
		{
			self function_18867744(var_7c2880c0, rappel_struct);
		}
		else
		{
			self function_c2576f59();
			self function_240680df();
			if(isdefined(self.var_793f9f37))
			{
				self [[self.var_793f9f37]]();
			}
		}
		return true;
	}
	return false;
}

/*
	Name: function_18867744
	Namespace: namespace_47c5b560
	Checksum: 0x304169A4
	Offset: 0x3EF8
	Size: 0x198
	Parameters: 2
	Flags: Linked, Private
*/
function private function_18867744(navmeshpoint, var_7d6b86d8)
{
	v_ground = groundtrace(navmeshpoint + vectorscale((0, 0, 1), 8), navmeshpoint + (vectorscale((0, 0, -1), 100000)), 0, self)[#"position"];
	if(isdefined(v_ground))
	{
		/#
			if(getdvarint(#"hash_6a18a97ccb2ee1d8", 0))
			{
				println((("" + "") + self getentitynumber() + "") + v_ground);
			}
		#/
		self.var_6da37a9a = var_7d6b86d8;
		self.var_ed09bf93 = undefined;
		self.v_zombie_custom_goal_pos = v_ground;
		self.var_5445693e = 1;
		self clearpath();
		/#
			if(getdvarint(#"hash_6a18a97ccb2ee1d8", 0))
			{
				println(("" + "") + self.v_zombie_custom_goal_pos);
			}
		#/
		if(isdefined(self.var_952959e1))
		{
			self [[self.var_952959e1]]();
		}
		return true;
	}
	return false;
}

/*
	Name: function_550876f3
	Namespace: namespace_47c5b560
	Checksum: 0x8A439E49
	Offset: 0x4098
	Size: 0x132
	Parameters: 1
	Flags: Linked, Private
*/
function private function_550876f3(start_node)
{
	path = [];
	path[path.size] = start_node;
	target = start_node;
	while(isdefined(target.target))
	{
		next_target = struct::get(target.target, "targetname");
		if(!isdefined(next_target))
		{
			break;
		}
		if(array::contains(path, next_target))
		{
			/#
				println(("" + start_node.origin) + "");
				iprintlnbold(("" + start_node.origin) + "");
			#/
			return undefined;
		}
		path[path.size] = next_target;
		target = next_target;
	}
	if(path.size > 1)
	{
		return path[path.size - 1];
	}
	return undefined;
}

/*
	Name: function_c8c99c9f
	Namespace: namespace_47c5b560
	Checksum: 0xE779B800
	Offset: 0x41D8
	Size: 0x3A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_c8c99c9f(node)
{
	next_node = struct::get(node.target, "targetname");
	return next_node;
}

/*
	Name: function_673035b3
	Namespace: namespace_47c5b560
	Checksum: 0xDB029AD7
	Offset: 0x4220
	Size: 0x24
	Parameters: 1
	Flags: Linked, Private
*/
function private function_673035b3(path_start_node)
{
	return !is_true(path_start_node.var_79b30398);
}

/*
	Name: function_56c12f58
	Namespace: namespace_47c5b560
	Checksum: 0xAF280D9E
	Offset: 0x4250
	Size: 0x4C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_56c12f58(path_start_node, use)
{
	path_start_node.var_79b30398 = use;
	if(is_true(use))
	{
		self thread function_43f5477a(path_start_node);
	}
}

/*
	Name: function_43f5477a
	Namespace: namespace_47c5b560
	Checksum: 0x30DAFB75
	Offset: 0x42A8
	Size: 0xC6
	Parameters: 1
	Flags: Linked, Private
*/
function private function_43f5477a(path_start_node)
{
	level endon(#"end_game");
	self waittill(#"death", #"hash_607879be8202b639");
	/#
		if(getdvarint(#"hash_6a18a97ccb2ee1d8", 0))
		{
			println((("" + "") + self getentitynumber() + "") + self.origin);
		}
	#/
	path_start_node.var_79b30398 = 0;
}

/*
	Name: function_240680df
	Namespace: namespace_47c5b560
	Checksum: 0x524D3BB9
	Offset: 0x4378
	Size: 0x26
	Parameters: 0
	Flags: Linked
*/
function function_240680df()
{
	self.var_ed09bf93 = undefined;
	self.var_6da37a9a = undefined;
	self.var_fbe88cc3 = undefined;
	self.var_5445693e = undefined;
}

/*
	Name: function_470c9a51
	Namespace: namespace_47c5b560
	Checksum: 0x8A0994
	Offset: 0x43A8
	Size: 0x228
	Parameters: 1
	Flags: None
*/
function function_470c9a51(var_178aa03b)
{
	level endon(#"end_game");
	level flag::wait_till("zones_initialized");
	foreach(var_aa41f9eb in var_178aa03b)
	{
		var_148ad4cc = getentarray(var_aa41f9eb, "script_noteworthy");
		if(var_148ad4cc.size == 0)
		{
			continue;
		}
		/#
			assert(var_148ad4cc.size == 2);
		#/
		var_31bcbe75 = struct::get(var_148ad4cc[0].target, "targetname");
		var_1f7e19f8 = struct::get(var_148ad4cc[1].target, "targetname");
		if(!isdefined(var_31bcbe75) || !isdefined(var_1f7e19f8))
		{
			continue;
		}
		var_148ad4cc[0] function_84f4a6c7(var_148ad4cc[1]);
		var_148ad4cc[1] function_84f4a6c7(var_148ad4cc[0]);
		function_91d135a3(var_31bcbe75.origin, var_1f7e19f8.origin, "ladder", var_148ad4cc[0]);
		function_91d135a3(var_1f7e19f8.origin, var_31bcbe75.origin, "ladder", var_148ad4cc[1]);
	}
}

/*
	Name: function_84f4a6c7
	Namespace: namespace_47c5b560
	Checksum: 0xC8FE3ABE
	Offset: 0x45D8
	Size: 0x52
	Parameters: 1
	Flags: Linked, Private
*/
function private function_84f4a6c7(var_e1117576)
{
	self.target_volume = var_e1117576;
	var_f55b98ef = struct::get(self.target, "targetname");
	var_f55b98ef.var_79b30398 = 0;
}

/*
	Name: function_d21249bf
	Namespace: namespace_47c5b560
	Checksum: 0x210A1ED8
	Offset: 0x4638
	Size: 0x11C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_d21249bf()
{
	var_182df905 = self.var_c7f5b6e1[0];
	/#
		assert(var_182df905.type == "");
	#/
	/#
		assert(isdefined(var_182df905.var_7d6b86d8));
	#/
	var_f55b98ef = struct::get(var_182df905.var_7d6b86d8.target, "targetname");
	if(isdefined(var_f55b98ef.origin))
	{
		var_b4175332 = self function_ca7b4071(var_f55b98ef.origin);
		if(isdefined(var_b4175332))
		{
			self function_18867744(var_b4175332, var_f55b98ef);
			self.var_fbe88cc3 = 400;
		}
	}
	arrayremoveindex(self.var_c7f5b6e1, 0);
}

/*
	Name: function_91d135a3
	Namespace: namespace_47c5b560
	Checksum: 0x26FD6B8
	Offset: 0x4760
	Size: 0x116
	Parameters: 4
	Flags: Linked, Private
*/
function private function_91d135a3(start_pos, end_pos, type, var_7d6b86d8)
{
	str_zone = zm_zonemgr::get_zone_from_position(start_pos, 1);
	var_5f3b05e8 = zm_zonemgr::get_zone_from_position(end_pos, 1);
	if(!isdefined(str_zone) || !isdefined(var_5f3b05e8))
	{
		return;
	}
	if(!isdefined(level.var_87660cfd))
	{
		level.var_87660cfd = [];
	}
	if(!isdefined(level.var_87660cfd[var_5f3b05e8]))
	{
		level.var_87660cfd[var_5f3b05e8] = [];
	}
	var_7d6b86d8.str_zone = str_zone;
	var_7d6b86d8.var_5f3b05e8 = var_5f3b05e8;
	level.var_87660cfd[var_5f3b05e8][str_zone] = {#hash_7d6b86d8:var_7d6b86d8, #type:type};
}

/*
	Name: function_fcfdadcd
	Namespace: namespace_47c5b560
	Checksum: 0xA60AE7D1
	Offset: 0x4880
	Size: 0x10
	Parameters: 0
	Flags: Linked
*/
function function_fcfdadcd()
{
	return isdefined(level.var_87660cfd);
}

/*
	Name: function_512cbdfa
	Namespace: namespace_47c5b560
	Checksum: 0x92CB569D
	Offset: 0x4898
	Size: 0x30
	Parameters: 1
	Flags: Linked, Private
*/
function private function_512cbdfa(var_5f3b05e8)
{
	if(isdefined(level.var_87660cfd))
	{
		return level.var_87660cfd[var_5f3b05e8];
	}
	return undefined;
}

/*
	Name: function_259b61b6
	Namespace: namespace_47c5b560
	Checksum: 0xA242CCE3
	Offset: 0x48D0
	Size: 0x4C6
	Parameters: 2
	Flags: Linked, Private
*/
function private function_259b61b6(var_8787728e, var_266a0de8)
{
	if(!getdvarint(#"hash_576f5cfc006ef831", 1))
	{
		return undefined;
	}
	if(!isdefined(var_8787728e) || !isdefined(var_266a0de8))
	{
		return undefined;
	}
	if(var_8787728e == var_266a0de8)
	{
		return undefined;
	}
	var_5ef1a72c = [];
	var_5ef1a72c[var_5ef1a72c.size] = [0:{#zone_name:var_266a0de8}];
	var_d5766a02 = 10;
	path_depth = 0;
	while(path_depth < var_d5766a02)
	{
		var_23ca4e6e = [];
		var_84204f6a = 10;
		var_4ec884df = -1;
		foreach(path in var_5ef1a72c)
		{
			var_db249865 = function_512cbdfa(path[path.size - 1].zone_name);
			var_7d8e02e2 = [];
			if(isdefined(var_db249865))
			{
				foreach(var_4a52ff35, var_3c5f461e in var_db249865)
				{
					if(function_af3889fa(var_4a52ff35, path))
					{
						continue;
					}
					adjacent_zone = level.zones[var_4a52ff35];
					if(is_true(adjacent_zone.var_d68ef0f9))
					{
						continue;
					}
					new_path = arraycopy(path);
					new_path[new_path.size] = {#hash_3c5f461e:var_3c5f461e, #zone_name:var_4a52ff35};
					var_7d8e02e2[var_7d8e02e2.size] = var_4a52ff35;
					var_23ca4e6e[var_23ca4e6e.size] = new_path;
					if(var_4a52ff35 == var_8787728e)
					{
						var_2a185e29 = function_6b400792(new_path);
						if(var_2a185e29 < var_84204f6a)
						{
							var_84204f6a = var_2a185e29;
							var_4ec884df = var_23ca4e6e.size - 1;
						}
					}
				}
			}
			zone = level.zones[path[path.size - 1].zone_name];
			foreach(var_4a52ff35, adjacent_zone in zone.adjacent_zones)
			{
				if(is_true(adjacent_zone.var_d68ef0f9) || !adjacent_zone.is_connected)
				{
					continue;
				}
				if(array::contains(var_7d8e02e2, var_4a52ff35))
				{
					continue;
				}
				if(function_af3889fa(var_4a52ff35, path))
				{
					continue;
				}
				new_path = arraycopy(path);
				new_path[new_path.size] = {#zone_name:var_4a52ff35};
				var_23ca4e6e[var_23ca4e6e.size] = new_path;
				if(var_4a52ff35 == var_8787728e)
				{
					var_2a185e29 = function_6b400792(new_path);
					if(var_2a185e29 < var_84204f6a)
					{
						var_84204f6a = var_2a185e29;
						var_4ec884df = var_23ca4e6e.size - 1;
					}
				}
			}
		}
		if(var_4ec884df >= 0)
		{
			return array::reverse(var_23ca4e6e[var_4ec884df]);
		}
		path_depth++;
		var_5ef1a72c = var_23ca4e6e;
	}
	return undefined;
}

/*
	Name: function_6b400792
	Namespace: namespace_47c5b560
	Checksum: 0x6CADFF28
	Offset: 0x4DA0
	Size: 0x9C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_6b400792(path)
{
	num = 0;
	foreach(path_node in path)
	{
		if(isdefined(path_node.var_3c5f461e))
		{
			num++;
		}
	}
	return num;
}

/*
	Name: function_af3889fa
	Namespace: namespace_47c5b560
	Checksum: 0xC1943012
	Offset: 0x4E48
	Size: 0x9C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_af3889fa(zone_name, path)
{
	foreach(path_node in path)
	{
		if(path_node.zone_name === zone_name)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_a6b0387d
	Namespace: namespace_47c5b560
	Checksum: 0x19F68BFB
	Offset: 0x4EF0
	Size: 0x25A
	Parameters: 4
	Flags: Linked
*/
function function_a6b0387d(str_start, str_end, var_73b17dd3, var_f6e819e4)
{
	if(!isdefined(var_73b17dd3))
	{
		var_73b17dd3 = 0;
	}
	if(!isdefined(var_f6e819e4))
	{
		var_f6e819e4 = 1;
	}
	if(is_true(var_73b17dd3))
	{
		radius = self getpathfindingradius();
		var_55853a47 = getclosestpointonnavmesh(str_start, radius * 2, radius * 1.2);
		if(!isdefined(var_55853a47))
		{
			return false;
		}
		var_8787728e = zm_zonemgr::get_zone_from_position(var_55853a47, 1);
		var_55853a47 = getclosestpointonnavmesh(str_end, radius * 2, radius * 1.2);
		if(!isdefined(var_55853a47))
		{
			return false;
		}
		var_266a0de8 = zm_zonemgr::get_zone_from_position(var_55853a47, 1);
	}
	else
	{
		var_8787728e = str_start;
		var_266a0de8 = str_end;
	}
	path = function_259b61b6(var_8787728e, var_266a0de8);
	if(!isdefined(path))
	{
		return false;
	}
	leaps = [];
	foreach(path_node in path)
	{
		if(!isdefined(path_node.var_3c5f461e))
		{
			continue;
		}
		leaps[leaps.size] = path_node.var_3c5f461e;
	}
	if(leaps.size > 0)
	{
		if(is_true(var_f6e819e4))
		{
			self.var_c7f5b6e1 = leaps;
		}
		return true;
	}
	return false;
}

/*
	Name: function_765e9504
	Namespace: namespace_47c5b560
	Checksum: 0x390CF210
	Offset: 0x5158
	Size: 0x42
	Parameters: 1
	Flags: None
*/
function function_765e9504(end_pos)
{
	var_8aa93d8 = self function_a6b0387d(self.origin, end_pos, 1, 0);
	return var_8aa93d8;
}

/*
	Name: function_99487333
	Namespace: namespace_47c5b560
	Checksum: 0xCEA850B7
	Offset: 0x51A8
	Size: 0xCE
	Parameters: 0
	Flags: Linked
*/
function function_99487333()
{
	/#
		if(getdvarint(#"hash_6a18a97ccb2ee1d8", 0))
		{
			println((("" + "") + self getentitynumber() + "") + self.origin);
		}
	#/
	if(isdefined(self.var_7df7df47))
	{
		var_8787728e = zm_zonemgr::get_zone_from_position(self.origin, 1);
		self function_a6b0387d(var_8787728e, self.var_7df7df47);
		self.var_7df7df47 = undefined;
	}
}

