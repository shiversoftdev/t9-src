#using script_3357acf79ce92f4b;
#using script_3411bb48d41bd3b;
#using script_3aa0f32b70d4f7cb;
#using script_178024232e91b0a1;
#using script_caf007e2a98afa2;
#using script_4d85e8de54b02198;
#using script_4bf952f6ba31bb17;
#using scripts\core_common\ai\zombie.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\ai_shared.gsc;

#namespace namespace_e292b080;

/*
	Name: __init__system__
	Namespace: namespace_e292b080
	Checksum: 0x35D228BE
	Offset: 0x318
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_1f8830cd01b39f8f", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_e292b080
	Checksum: 0x3DE262F
	Offset: 0x360
	Size: 0x4C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	function_7ff2a0fc();
	val::register("blockingpain", 1);
	val::default_value("blockingpain", 0);
}

/*
	Name: function_7ff2a0fc
	Namespace: namespace_e292b080
	Checksum: 0xF6973FE9
	Offset: 0x3B8
	Size: 0x1194
	Parameters: 0
	Flags: Linked, Private
*/
function private function_7ff2a0fc()
{
	/#
		assert(isscriptfunctionptr(&function_e91d8371));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"wzzombieupdatethrottle", &function_e91d8371, 2);
	/#
		assert(isscriptfunctionptr(&function_5aeeecac));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_3ac312897079296a", &function_5aeeecac, 2);
	/#
		assert(isscriptfunctionptr(&function_eea7a68a));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_300dd0c6326499f2", &function_eea7a68a, 1);
	/#
		assert(isscriptfunctionptr(&function_1ca9d31b));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_35bf14858fe8b5cf", &function_1ca9d31b, 3);
	/#
		assert(isscriptfunctionptr(&zombieshouldmelee));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"wzzombieshouldmelee", &zombieshouldmelee);
	/#
		assert(isscriptfunctionptr(&function_d8b225ae));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"wzzombieshouldmeleeattackable", &function_d8b225ae);
	/#
		assert(isscriptfunctionptr(&zombieshouldmove));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"wzzombieshouldmove", &zombieshouldmove);
	/#
		assert(isscriptfunctionptr(&function_bfc25c77));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_502cf2e8eca970f0", &function_bfc25c77);
	/#
		assert(isscriptfunctionptr(&function_b9b03294));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_91cfd1edd5185d1", &function_b9b03294);
	/#
		assert(isscriptfunctionptr(&zombieshouldknockdown));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"wzzombieshouldknockdown", &zombieshouldknockdown);
	/#
		assert(isscriptfunctionptr(&function_2a7b4aab));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_27c0b6c5a7e05804", &function_2a7b4aab);
	/#
		assert(isscriptfunctionptr(&function_931b615f));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_5ecbb3fc61f4458c", &function_931b615f);
	/#
		assert(isscriptfunctionptr(&function_e1b85c34));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_570afe82cdfa6969", &function_e1b85c34);
	/#
		assert(isscriptfunctionptr(&function_e9e6482));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_7d363abffd05f58a", &function_e9e6482);
	/#
		assert(isscriptfunctionptr(&function_10b38c5a));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_1d366f17af8db750", &function_10b38c5a);
	/#
		assert(isscriptfunctionptr(&function_10b38c5a));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_1d366f17af8db750", &function_10b38c5a);
	/#
		assert(isscriptfunctionptr(&function_573545a));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_35721134610efe59", &function_573545a);
	/#
		assert(isscriptfunctionptr(&function_573545a));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_35721134610efe59", &function_573545a);
	/#
		assert(isscriptfunctionptr(&zombiemoveactionstart));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"wzzombiemoveactionstart", &zombiemoveactionstart);
	/#
		assert(isscriptfunctionptr(&zombiemoveactionupdate));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"wzzombiemoveactionupdate", &zombiemoveactionupdate);
	/#
		assert(isscriptfunctionptr(&zombiemoveactionstart));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"wzzombiemoveactionstart", &zombiemoveactionstart);
	/#
		assert(isscriptfunctionptr(&zombiemoveactionupdate));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"wzzombiemoveactionupdate", &zombiemoveactionupdate);
	/#
		assert(isscriptfunctionptr(&function_7c8e35e8));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_5b037e170b517862", &function_7c8e35e8);
	/#
		assert(!isdefined(&function_7c8e35e8) || isscriptfunctionptr(&function_7c8e35e8));
	#/
	/#
		assert(!isdefined(&function_fee7d867) || isscriptfunctionptr(&function_fee7d867));
	#/
	/#
		assert(!isdefined(&function_3f71b9c2) || isscriptfunctionptr(&function_3f71b9c2));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction(#"hash_5bd00a38dffd47e", &function_7c8e35e8, &function_fee7d867, &function_3f71b9c2);
	/#
		assert(isscriptfunctionptr(&zombieknockdownactionstart));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"wzzombieknockdownactionstart", &zombieknockdownactionstart);
	/#
		assert(isscriptfunctionptr(&function_c8939973));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_7a21325931f5ca2f", &function_c8939973);
	/#
		assert(isscriptfunctionptr(&zombiegetupactionterminate));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"wzzombiegetupactionterminate", &zombiegetupactionterminate);
	/#
		assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
	#/
	/#
		assert(!isdefined(&function_78106a79) || isscriptfunctionptr(&function_78106a79));
	#/
	/#
		assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction(#"hash_43da8039096f842f", undefined, &function_78106a79, undefined);
	/#
		assert(isscriptfunctionptr(&function_f8250d5e));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"wzzombieidleactionstart", &function_f8250d5e);
	/#
		assert(isscriptfunctionptr(&function_860d5d8));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"wzzombieidleactionupdate", &function_860d5d8);
	/#
		assert(isscriptfunctionptr(&function_f8250d5e));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"wzzombieidleactionstart", &function_f8250d5e);
	/#
		assert(isscriptfunctionptr(&function_860d5d8));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"wzzombieidleactionupdate", &function_860d5d8);
	/#
		assert(isscriptfunctionptr(&function_f37b0fbd));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_23cab4c0aa3e9ee0", &function_f37b0fbd);
	/#
		assert(isscriptfunctionptr(&function_da99776f));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_45589afe0073d903", &function_da99776f);
	/#
		assert(isscriptfunctionptr(&function_da99776f));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_45589afe0073d903", &function_da99776f);
	/#
		assert(isscriptfunctionptr(&function_c8caa34b));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_1cb57a93258839fc", &function_c8caa34b);
	/#
		assert(isscriptfunctionptr(&function_c8caa34b));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_1cb57a93258839fc", &function_c8caa34b);
	animationstatenetwork::registernotetrackhandlerfunction("zombieRiserFx", &function_79c3a487);
	animationstatenetwork::registernotetrackhandlerfunction("showZombie", &showzombie);
	animationstatenetwork::registernotetrackhandlerfunction("damageDoor", &damagedoor);
	animationstatenetwork::registeranimationmocomp("mocomp_zombie_attack_attackable", &function_81349d20, undefined, undefined);
	animationstatenetwork::registeranimationmocomp("mocomp_attack_traversal_blocker", &function_8aa7d53, undefined, undefined);
	animationstatenetwork::registeranimationmocomp("mocomp_force_face_attackable_or_enemy", &function_933af241, undefined, undefined);
}

/*
	Name: function_e91d8371
	Namespace: namespace_e292b080
	Checksum: 0x3FD8C7A7
	Offset: 0x1558
	Size: 0xE4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_e91d8371(entity)
{
	if(!is_true(entity.ai.var_870d0893))
	{
		return;
	}
	if(!isdefined(level.var_a2fbb776))
	{
		level.var_a2fbb776 = 0;
	}
	level.var_8de0b84e[level.var_a2fbb776] = entity getentitynumber();
	level.var_a2fbb776 = (level.var_a2fbb776 + 1) % 2;
	if(is_true(level.is_survival) && is_true(entity.has_awareness))
	{
		function_eea7a68a(entity);
	}
}

/*
	Name: function_5aeeecac
	Namespace: namespace_e292b080
	Checksum: 0x61E051D2
	Offset: 0x1648
	Size: 0x148
	Parameters: 1
	Flags: Linked, Private
*/
function private function_5aeeecac(entity)
{
	if(is_true(entity.var_4c85ebad))
	{
		return;
	}
	radiusmultiplier = entity.var_e729ffb;
	if(!isdefined(radiusmultiplier))
	{
		radiusmultiplier = 3;
	}
	forwardoffset = (anglestoforward(entity.angles) * entity getpathfindingradius()) * radiusmultiplier;
	var_d54999e4 = namespace_85745671::ee_head(entity, 0.8, forwardoffset);
	foreach(dynent in var_d54999e4)
	{
		if(namespace_85745671::function_8f57dc52(dynent))
		{
			entity.var_4c85ebad = 1;
			return;
		}
	}
}

/*
	Name: function_eea7a68a
	Namespace: namespace_e292b080
	Checksum: 0xFF317E84
	Offset: 0x1798
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function function_eea7a68a(entity)
{
	entity.enemy_override = namespace_85745671::function_b67c088d();
	namespace_85745671::function_744beb04(entity);
	awareness::target_update(entity);
}

/*
	Name: function_7c70e7fa
	Namespace: namespace_e292b080
	Checksum: 0x4EC8F940
	Offset: 0x17F0
	Size: 0x29A
	Parameters: 4
	Flags: Linked
*/
function function_7c70e7fa(entity, var_21bdf069, dynent, var_144ce0a0)
{
	var_f3fec032 = function_489009c1(dynent);
	state = function_ffdbe8c2(dynent);
	if(var_144ce0a0 && state != 0 || (isdefined(var_f3fec032.dynentstates[state]) && is_true(var_f3fec032.dynentstates[state].ignoredamage)))
	{
		return false;
	}
	bounds = function_c440d28e(dynent.var_15d44120);
	var_21a49757 = bounds.maxs[1] - bounds.mins[1];
	var_cc87c802 = getxmodelcenteroffset(dynent.var_15d44120);
	door_right = anglestoright(dynent.angles);
	doorcenter = dynent.origin + ((door_right * -1) * var_cc87c802[1]);
	/#
		recordstar(doorcenter, (0, 1, 0), "");
	#/
	end_point = doorcenter + (door_right * (var_21a49757 / 2));
	start_point = doorcenter - (door_right * (var_21a49757 / 2));
	/#
		recordline(start_point, end_point, (1, 0, 0), "");
		recordcircle(entity.origin, entity getpathfindingradius(), (0, 1, 0), "");
	#/
	point = math::closest_point_on_line(entity.origin, start_point, end_point);
	if(lengthsquared(point - entity.origin) > var_21bdf069)
	{
		return false;
	}
	return true;
}

/*
	Name: function_1ca9d31b
	Namespace: namespace_e292b080
	Checksum: 0xF2983B27
	Offset: 0x1A98
	Size: 0x2D8
	Parameters: 1
	Flags: Linked
*/
function function_1ca9d31b(entity)
{
	if(!getdvarint(#"hash_397bf855bf5ab4de", 1))
	{
		return;
	}
	var_577fefe8 = entity getpathfindingradius() + 275;
	var_e86a4d9 = function_c3d68575(entity.origin, (var_577fefe8, var_577fefe8, entity function_6a9ae71()));
	height_check = max(entity function_6a9ae71(), 95);
	var_21bdf069 = sqr(entity getpathfindingradius());
	foreach(dynent in var_e86a4d9)
	{
		if(abs(dynent.origin[2] - entity.origin[2]) > height_check)
		{
			continue;
		}
		should_break = 0;
		var_144ce0a0 = dynent.script_noteworthy == #"hash_4d1fb8524fdfd254";
		if(var_144ce0a0 || dynent.var_15d44120 === #"p8_fxanim_wz_rollup_door_medium_mod" || dynent.var_15d44120 === #"hash_30cb30fe79cd7bc0" || dynent.var_15d44120 === #"hash_3cccdd3bf12018bc" || dynent.var_15d44120 === #"hash_7edcc0480c4f0164")
		{
			should_break = function_7c70e7fa(entity, var_21bdf069, dynent, var_144ce0a0);
		}
		if(should_break && dynent.health > 0)
		{
			dynent dodamage(dynent.health, entity.origin, entity, entity, undefined, "MOD_MELEE");
		}
	}
}

/*
	Name: function_3bcb2832
	Namespace: namespace_e292b080
	Checksum: 0xF82AE82A
	Offset: 0x1D78
	Size: 0x138
	Parameters: 2
	Flags: None
*/
function function_3bcb2832(origin, bounds)
{
	var_e86a4d9 = function_c3d68575(origin, bounds);
	foreach(dynent in var_e86a4d9)
	{
		bundle = function_489009c1(dynent);
		state = function_ffdbe8c2(dynent);
		if(!isdefined(bundle.destroyed) || state === bundle.destroyed)
		{
			continue;
		}
		dynent dodamage(dynent.health, origin, undefined, undefined, undefined, "MOD_MELEE");
	}
}

/*
	Name: zombieshouldmelee
	Namespace: namespace_e292b080
	Checksum: 0x991920FA
	Offset: 0x1EB8
	Size: 0x67E
	Parameters: 1
	Flags: Linked
*/
function zombieshouldmelee(entity)
{
	if(is_true(entity.var_8a96267d) || is_true(entity.var_8ba6ede3))
	{
		return false;
	}
	if(is_true(entity.var_4c85ebad))
	{
		return true;
	}
	if(function_d8b225ae(entity))
	{
		return true;
	}
	if(!isdefined(entity.enemy))
	{
		return false;
	}
	if(!namespace_85745671::is_player_valid(entity.enemy) && !namespace_85745671::function_1b9ed9b0(entity.enemy) && entity.team === level.zombie_team)
	{
		return false;
	}
	if(is_true(entity.ignoremelee))
	{
		return false;
	}
	meleedistsq = zombiebehavior::function_997f1224(entity);
	enemy_vehicle = undefined;
	test_origin = entity.enemy.origin;
	if(isplayer(entity.enemy))
	{
		if(namespace_85745671::function_142c3c86(entity.enemy))
		{
			enemy_vehicle = entity.enemy getvehicleoccupied();
			var_81952387 = enemy_vehicle.origin;
			for(i = 0; i < 11; i++)
			{
				if(enemy_vehicle function_dcef0ba1(i))
				{
					var_ec950ebd = enemy_vehicle function_defc91b2(i);
					if(isdefined(var_ec950ebd) && var_ec950ebd >= 0)
					{
						seat_pos = enemy_vehicle function_5051cc0c(i);
						if(distancesquared(entity.origin, var_81952387) > distancesquared(entity.origin, seat_pos))
						{
							var_81952387 = seat_pos;
						}
					}
				}
			}
			test_origin = var_81952387;
		}
		else
		{
			if(isvehicle(entity.enemy getgroundent()))
			{
				enemy_vehicle = entity.enemy getgroundent();
				test_origin = (isdefined(entity.enemy.last_valid_position) ? entity.enemy.last_valid_position : entity.enemy.origin);
			}
			else if(isvehicle(entity.enemy getmoverent()))
			{
				enemy_vehicle = entity.enemy getmoverent();
				test_origin = (isdefined(entity.enemy.last_valid_position) ? entity.enemy.last_valid_position : entity.enemy.origin);
			}
		}
		if(isdefined(enemy_vehicle) && isdefined(entity.var_cbc65493))
		{
			meleedistsq = meleedistsq * entity.var_cbc65493;
		}
	}
	if(abs(entity.origin[2] - test_origin[2]) > (isdefined(entity.var_737e8510) ? entity.var_737e8510 : 64))
	{
		return false;
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
	if(!entity cansee((isdefined(enemy_vehicle) ? enemy_vehicle : entity.enemy)))
	{
		return false;
	}
	if(distancesquared(entity.origin, test_origin) < sqr(40))
	{
		entity.idletime = gettime();
		entity.var_1b250399 = entity.origin;
		return true;
	}
	if(isdefined(enemy_vehicle))
	{
		entity.idletime = gettime();
		entity.var_1b250399 = entity.origin;
		return true;
	}
	if(is_true(self.isonnavmesh) && !tracepassedonnavmesh(entity.origin, (isdefined(entity.enemy.last_valid_position) ? entity.enemy.last_valid_position : entity.enemy.origin), entity.enemy getpathfindingradius()))
	{
		return false;
	}
	entity.idletime = gettime();
	entity.var_1b250399 = entity.origin;
	return true;
}

/*
	Name: function_d8b225ae
	Namespace: namespace_e292b080
	Checksum: 0x53A9FA8D
	Offset: 0x2540
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
	Name: zombieshouldmove
	Namespace: namespace_e292b080
	Checksum: 0xC6B128C5
	Offset: 0x2640
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private zombieshouldmove(entity)
{
	return entity.allowoffnavmesh || entity haspath();
}

/*
	Name: function_bfc25c77
	Namespace: namespace_e292b080
	Checksum: 0x1B354D1
	Offset: 0x2678
	Size: 0xDE
	Parameters: 1
	Flags: Linked, Private
*/
function private function_bfc25c77(entity)
{
	if(!(isdefined(getgametypesetting(#"hash_2d40f1434ed94a2b")) ? getgametypesetting(#"hash_2d40f1434ed94a2b") : 0))
	{
		return false;
	}
	if(self function_3c566724())
	{
		return false;
	}
	startnode = entity.traversestartnode;
	if(!isnodeenabled(startnode))
	{
		return false;
	}
	if(namespace_85745671::is_blocker_valid(startnode.traversal_blocker))
	{
		entity.traversal_blocker = startnode.traversal_blocker;
		return true;
	}
	return false;
}

/*
	Name: function_b9b03294
	Namespace: namespace_e292b080
	Checksum: 0x1D8A705C
	Offset: 0x2760
	Size: 0x72
	Parameters: 1
	Flags: Linked, Private
*/
function private function_b9b03294(entity)
{
	if(self function_3c566724())
	{
		return true;
	}
	startnode = entity.traversestartnode;
	if(!isdefined(startnode) || !isnodeenabled(startnode))
	{
		return false;
	}
	return true;
}

/*
	Name: zombieshouldknockdown
	Namespace: namespace_e292b080
	Checksum: 0xCF251B25
	Offset: 0x27E0
	Size: 0x1C
	Parameters: 1
	Flags: Linked, Private
*/
function private zombieshouldknockdown(entity)
{
	return entity.knockdown === 1;
}

/*
	Name: function_2a7b4aab
	Namespace: namespace_e292b080
	Checksum: 0x5AC83F32
	Offset: 0x2808
	Size: 0x1C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_2a7b4aab(entity)
{
	return entity.var_85c3882d === 1;
}

/*
	Name: function_931b615f
	Namespace: namespace_e292b080
	Checksum: 0x45DAC4E0
	Offset: 0x2830
	Size: 0x84
	Parameters: 1
	Flags: Linked, Private
*/
function private function_931b615f(entity)
{
	if(entity hasvalidinterrupt("pain") || entity hasvalidinterrupt("death") || is_true(entity.knockdown))
	{
		function_3f71b9c2(entity);
	}
}

/*
	Name: function_e1b85c34
	Namespace: namespace_e292b080
	Checksum: 0xDE1C8FC9
	Offset: 0x28C0
	Size: 0x22
	Parameters: 1
	Flags: Linked, Private
*/
function private function_e1b85c34(entity)
{
	return is_true(entity.var_df840b81);
}

/*
	Name: function_e9e6482
	Namespace: namespace_e292b080
	Checksum: 0xF33666A5
	Offset: 0x28F0
	Size: 0x2E
	Parameters: 1
	Flags: Linked
*/
function function_e9e6482(entity)
{
	if(!is_true(entity.var_8c4d3e5d))
	{
		return false;
	}
	return true;
}

/*
	Name: function_10b38c5a
	Namespace: namespace_e292b080
	Checksum: 0xEF09731A
	Offset: 0x2928
	Size: 0x50
	Parameters: 1
	Flags: Linked
*/
function function_10b38c5a(entity)
{
	if(is_true(entity.var_1033fa72) && is_true(entity.var_9f6112bb))
	{
		return true;
	}
	return false;
}

/*
	Name: function_da99776f
	Namespace: namespace_e292b080
	Checksum: 0x8A83EEAF
	Offset: 0x2980
	Size: 0x26
	Parameters: 1
	Flags: Linked
*/
function function_da99776f(entity)
{
	entity.var_1033fa72 = undefined;
	entity.var_9f6112bb = undefined;
	return true;
}

/*
	Name: function_573545a
	Namespace: namespace_e292b080
	Checksum: 0x202AD5B3
	Offset: 0x29B0
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function function_573545a(entity)
{
	return is_true(entity.var_2772a472);
}

/*
	Name: function_c8caa34b
	Namespace: namespace_e292b080
	Checksum: 0x6AE29852
	Offset: 0x29E0
	Size: 0x1A
	Parameters: 1
	Flags: Linked
*/
function function_c8caa34b(entity)
{
	entity.var_2772a472 = undefined;
	return true;
}

/*
	Name: zombiemoveactionstart
	Namespace: namespace_e292b080
	Checksum: 0x698A4897
	Offset: 0x2A08
	Size: 0x36
	Parameters: 1
	Flags: Linked, Private
*/
function private zombiemoveactionstart(entity)
{
	entity.movetime = gettime();
	entity.moveorigin = entity.origin;
	entity.var_13138acf = 0;
	return true;
}

/*
	Name: zombiemoveactionupdate
	Namespace: namespace_e292b080
	Checksum: 0xA0A88151
	Offset: 0x2A48
	Size: 0xBA
	Parameters: 1
	Flags: Linked, Private
*/
function private zombiemoveactionupdate(entity)
{
	if(!is_true(entity.missinglegs) && (gettime() - entity.movetime) > 1000)
	{
		distsq = distance2dsquared(entity.origin, entity.moveorigin);
		if(distsq < 144)
		{
			if(isdefined(entity.cant_move_cb))
			{
				entity thread [[entity.cant_move_cb]]();
			}
		}
		entity.movetime = gettime();
		entity.moveorigin = entity.origin;
	}
	return true;
}

/*
	Name: function_7c8e35e8
	Namespace: namespace_e292b080
	Checksum: 0x2EAB6ED2
	Offset: 0x2B10
	Size: 0x1C6
	Parameters: 2
	Flags: Linked, Private
*/
function private function_7c8e35e8(entity, asmstate)
{
	if(isdefined(self.traversestartnode))
	{
		node = entity.traversestartnode;
		if(entity.traversestartnode.type !== #"begin" && entity.traversestartnode.type !== "Volume")
		{
			node = getothernodeinnegotiationpair(node);
		}
		unlinktraversal(node);
		entity.var_834b0770 = node;
		node.owner = entity;
		if(entity.archetype !== #"zombie" && !isentity(entity.traversal_blocker))
		{
			entity callback::function_d8abfc3d(#"on_ai_melee", &damagedoor);
		}
		if(isdefined(asmstate))
		{
			animationstatenetworkutility::requeststate(entity, asmstate);
		}
		entity pathmode("dont move");
	}
	if(isdefined(entity.traversal_blocker))
	{
		entity.var_a476b329 = entity.traversal_blocker.angles;
	}
	if(!isdefined(self.traversemantlenode))
	{
		entity.var_df840b81 = 1;
	}
	else
	{
		entity.var_df840b81 = undefined;
	}
	return 5;
}

/*
	Name: function_fee7d867
	Namespace: namespace_e292b080
	Checksum: 0x4E399C6
	Offset: 0x2CE0
	Size: 0x220
	Parameters: 2
	Flags: Linked, Private
*/
function private function_fee7d867(entity, asmstate)
{
	if(entity asmgetstatus() == "asm_status_complete" && isdefined(asmstate))
	{
		animationstatenetworkutility::requeststate(entity, asmstate);
	}
	if(isdefined(entity.traversal_blocker) && isdefined(entity.var_a476b329) && abs(vectordot(anglestoforward(entity.var_a476b329), anglestoforward(entity.traversal_blocker.angles)) < 0.5))
	{
		return 4;
	}
	if(!namespace_85745671::is_blocker_valid(entity.traversal_blocker))
	{
		return 4;
	}
	var_1f2328d0 = entity function_4794d6a3();
	if(isdefined(var_1f2328d0) && isdefined(var_1f2328d0.goalpos))
	{
		var_f940b57b = var_1f2328d0.goalpos;
	}
	if(!isdefined(var_f940b57b) && isdefined(entity.favoriteenemy))
	{
		var_f940b57b = entity.favoriteenemy.last_valid_position;
	}
	if(isdefined(var_f940b57b) && (abs(var_f940b57b[2] - entity.origin[2])) < 100 && (vectordot(anglestoforward(entity.angles), var_f940b57b - entity.origin)) < 0)
	{
		entity.var_df840b81 = undefined;
		return 4;
	}
	return 5;
}

/*
	Name: function_3f71b9c2
	Namespace: namespace_e292b080
	Checksum: 0xBFE80852
	Offset: 0x2F08
	Size: 0x112
	Parameters: 2
	Flags: Linked, Private
*/
function private function_3f71b9c2(entity, asmstate)
{
	asmstate finishtraversal();
	asmstate pathmode("move allowed", 1);
	if(isdefined(asmstate.var_834b0770))
	{
		linktraversal(asmstate.var_834b0770);
		asmstate.var_834b0770.owner = undefined;
		asmstate.var_834b0770 = undefined;
	}
	asmstate.traversal_blocker = undefined;
	asmstate.var_a476b329 = undefined;
	asmstate callback::function_52ac9652(#"on_ai_melee", &damagedoor);
	if(asmstate asmgetstatus() == "asm_status_running")
	{
		asmstate.var_fc781a6f = 1;
	}
	return 4;
}

/*
	Name: zombieknockdownactionstart
	Namespace: namespace_e292b080
	Checksum: 0xB14C14E5
	Offset: 0x3028
	Size: 0xCC
	Parameters: 1
	Flags: Linked
*/
function zombieknockdownactionstart(behaviortreeentity)
{
	behaviortreeentity setblackboardattribute("_knockdown_type", behaviortreeentity.knockdown_type);
	behaviortreeentity setblackboardattribute("_knockdown_direction", behaviortreeentity.knockdown_direction);
	behaviortreeentity setblackboardattribute("_getup_direction", behaviortreeentity.getup_direction);
	behaviortreeentity collidewithactors(0);
	behaviortreeentity val::set(#"zombie_knockdown", "blockingpain", 1);
}

/*
	Name: function_c8939973
	Namespace: namespace_e292b080
	Checksum: 0x60AC9E95
	Offset: 0x3100
	Size: 0x74
	Parameters: 1
	Flags: Linked, Private
*/
function private function_c8939973(behaviortreeentity)
{
	behaviortreeentity.knockdown = 0;
	behaviortreeentity collidewithactors(1);
	behaviortreeentity clearpath();
	behaviortreeentity val::reset(#"zombie_knockdown", "blockingpain");
}

/*
	Name: zombiegetupactionterminate
	Namespace: namespace_e292b080
	Checksum: 0x5BB35E87
	Offset: 0x3180
	Size: 0x74
	Parameters: 1
	Flags: Linked, Private
*/
function private zombiegetupactionterminate(behaviortreeentity)
{
	behaviortreeentity.knockdown = 0;
	behaviortreeentity collidewithactors(1);
	behaviortreeentity clearpath();
	behaviortreeentity val::reset(#"zombie_knockdown", "blockingpain");
}

/*
	Name: function_78106a79
	Namespace: namespace_e292b080
	Checksum: 0xDB77CB07
	Offset: 0x3200
	Size: 0x5A
	Parameters: 2
	Flags: Linked, Private
*/
function private function_78106a79(entity, asmstatename)
{
	if(asmstatename ai::is_stunned() || is_true(asmstatename.var_85c3882d))
	{
		return 5;
	}
	return 4;
}

/*
	Name: function_f8250d5e
	Namespace: namespace_e292b080
	Checksum: 0xD0A51709
	Offset: 0x3268
	Size: 0x2A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_f8250d5e(entity)
{
	entity.idletime = gettime();
	entity.var_1b250399 = entity.origin;
	return true;
}

/*
	Name: function_860d5d8
	Namespace: namespace_e292b080
	Checksum: 0x76C77F56
	Offset: 0x32A0
	Size: 0x102
	Parameters: 1
	Flags: Linked, Private
*/
function private function_860d5d8(entity)
{
	if(!is_true(entity.missinglegs) && (gettime() - entity.idletime) > 1000)
	{
		if(is_true(level.is_survival) == 1 && (gettime() - entity.idletime) < 1700)
		{
			return;
		}
		distsq = distance2dsquared(entity.origin, entity.var_1b250399);
		if(distsq < 144)
		{
			if(isdefined(entity.cant_move_cb))
			{
				entity thread [[entity.cant_move_cb]]();
			}
		}
		entity.idletime = gettime();
		entity.var_1b250399 = entity.origin;
	}
	return true;
}

/*
	Name: function_f37b0fbd
	Namespace: namespace_e292b080
	Checksum: 0x889EAB24
	Offset: 0x33B0
	Size: 0x24
	Parameters: 1
	Flags: Linked, Private
*/
function private function_f37b0fbd(entity)
{
	entity clearpath();
}

/*
	Name: function_79c3a487
	Namespace: namespace_e292b080
	Checksum: 0xD13B50AC
	Offset: 0x33E0
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_79c3a487(entity)
{
	entity clientfield::set("zombie_riser_fx", 1);
}

/*
	Name: showzombie
	Namespace: namespace_e292b080
	Checksum: 0x5E350C99
	Offset: 0x3418
	Size: 0x24
	Parameters: 1
	Flags: Linked, Private
*/
function private showzombie(entity)
{
	entity show();
}

/*
	Name: damagedoor
	Namespace: namespace_e292b080
	Checksum: 0xA497FB87
	Offset: 0x3448
	Size: 0x114
	Parameters: 1
	Flags: Linked, Private
*/
function private damagedoor(entity)
{
	if(isdefined(self.traversal_blocker))
	{
		if(self.traversal_blocker.targetname !== "barricade_window")
		{
			damage = (isdefined(self.var_1a6dcdff) ? self.var_1a6dcdff : 30);
			if(is_true(self.var_12ec333b))
			{
				damage = self.traversal_blocker.health;
			}
			self.traversal_blocker dodamage(damage, self.origin, self, self, "none", "MOD_EXPLOSIVE");
			if(!isdefined(self.traversal_blocker) || self.traversal_blocker.health <= 0)
			{
				self.traversal_blocker = undefined;
			}
		}
		else
		{
			self.traversal_blocker notify(#"hash_5cfbbb6ee8378665");
		}
	}
}

/*
	Name: function_81349d20
	Namespace: namespace_e292b080
	Checksum: 0x69CED5A4
	Offset: 0x3568
	Size: 0xA4
	Parameters: 5
	Flags: Linked, Private
*/
function private function_81349d20(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	if(isdefined(self.attackable))
	{
		self orientmode("face point", self.attackable.origin);
	}
	else
	{
		self orientmode("face current");
	}
	self animmode("angle deltas");
}

/*
	Name: function_8aa7d53
	Namespace: namespace_e292b080
	Checksum: 0xDE8A10E9
	Offset: 0x3618
	Size: 0x1EC
	Parameters: 5
	Flags: Linked
*/
function function_8aa7d53(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	forward = mocompduration.traversalendpos - mocompduration.traversalstartpos;
	forward = (forward[0], forward[1], 0);
	if(!isdefined(mocompduration.traversemantlenode))
	{
		mocompduration forceteleport(mocompduration.origin, mocompduration.angles, 0);
		mocompduration animmode("noclip", 0);
		mocompduration orientmode("face angle", vectortoangles(forward)[1]);
		return;
	}
	var_ce870aa5 = 13 + mocompduration getpathfindingradius();
	mocompduration.var_910c3b2c = mocompduration.traversemantlenode.origin - (vectornormalize(forward) * var_ce870aa5);
	mocompduration.var_910c3b2c = (mocompduration.var_910c3b2c[0], mocompduration.var_910c3b2c[1], mocompduration.traversalstartpos[2]);
	mocompduration animmode("angle deltas noclip", 0);
	mocompduration orientmode("face angle", vectortoangles(forward)[1]);
	mocompduration forceteleport(mocompduration.var_910c3b2c, mocompduration.angles, 0);
}

/*
	Name: function_933af241
	Namespace: namespace_e292b080
	Checksum: 0x910E382D
	Offset: 0x3810
	Size: 0xEC
	Parameters: 5
	Flags: Linked
*/
function function_933af241(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	if(isdefined(mocompduration.attackable))
	{
		self orientmode("face point", self.attackable.origin);
	}
	else
	{
		enemy = (isdefined(self.enemy) ? self.enemy : self.favoriteenemy);
		if(isdefined(enemy))
		{
			self orientmode("face point", enemy.origin);
		}
		else
		{
			self orientmode("face enemy");
		}
	}
}

/*
	Name: zombieupdategoal
	Namespace: namespace_e292b080
	Checksum: 0xAE076FBC
	Offset: 0x3908
	Size: 0xA44
	Parameters: 1
	Flags: Linked
*/
function zombieupdategoal(goalpos)
{
	aiprofile_beginentry("zombieUpdateGoal");
	shouldrepath = 0;
	zigzag_activation_distance = level.zigzag_activation_distance;
	if(isdefined(self.zigzag_activation_distance))
	{
		zigzag_activation_distance = self.zigzag_activation_distance;
	}
	pathgoalpos = self.pathgoalpos;
	var_c7dee8e5 = distancesquared(self.origin, goalpos);
	if(var_c7dee8e5 > 5000)
	{
		self setgoal(goalpos);
		aiprofile_endentry();
		return;
	}
	if(!isdefined(self.nextgoalupdate) || self.nextgoalupdate <= gettime())
	{
		shouldrepath = 1;
	}
	else
	{
		if(var_c7dee8e5 <= sqr(zigzag_activation_distance))
		{
			shouldrepath = 1;
		}
		else if(isdefined(pathgoalpos))
		{
			distancetogoalsqr = distancesquared(self.origin, pathgoalpos);
			shouldrepath = distancetogoalsqr < sqr(72);
		}
	}
	if(is_true(level.validate_on_navmesh))
	{
		if(!ispointonnavmesh(self.origin, self))
		{
			shouldrepath = 0;
		}
	}
	if(is_true(self.keep_moving))
	{
		if(gettime() > self.keep_moving_time)
		{
			self.keep_moving = 0;
		}
	}
	if(self function_dd070839() || self isplayinganimscripted())
	{
		shouldrepath = 0;
	}
	if(isactor(self) && self asmistransitionrunning() || self asmistransdecrunning())
	{
		shouldrepath = 0;
	}
	if(shouldrepath)
	{
		self setgoal(goalpos);
		should_zigzag = 1;
		if(isdefined(level.should_zigzag))
		{
			should_zigzag = self [[level.should_zigzag]]();
		}
		else if(isdefined(self.should_zigzag))
		{
			should_zigzag = self.should_zigzag;
		}
		if(isdefined(self.var_592a8227))
		{
			should_zigzag = should_zigzag && self.var_592a8227;
		}
		var_eb1c6f1c = 0;
		if(is_true(level.do_randomized_zigzag_path) && should_zigzag)
		{
			if(distancesquared(self.origin, goalpos) > sqr(zigzag_activation_distance))
			{
				self.keep_moving = 1;
				self.keep_moving_time = gettime() + 700;
				path = undefined;
				if(is_true(self.var_ceed8829))
				{
					pathdata = generatenavmeshpath(self.origin, goalpos, self);
					if(isdefined(pathdata) && pathdata.status === "succeeded" && isdefined(pathdata.pathpoints))
					{
						path = pathdata.pathpoints;
					}
				}
				else
				{
					path = self calcapproximatepathtoposition(goalpos, 0);
				}
				if(isdefined(path))
				{
					/#
						if(getdvarint(#"ai_debugzigzag", 0))
						{
							for(index = 1; index < path.size; index++)
							{
								recordline(path[index - 1], path[index], (1, 0.5, 0), "", self);
								record3dtext(abs((path[index - 1][2]) - path[index][2]), path[index - 1], (1, 0, 0));
							}
						}
					#/
					deviationdistance = randomintrange(level.zigzag_distance_min, level.zigzag_distance_max);
					if(isdefined(self.zigzag_distance_min) && isdefined(self.zigzag_distance_max))
					{
						deviationdistance = randomintrange(self.zigzag_distance_min, self.zigzag_distance_max);
					}
					segmentlength = 0;
					for(index = 1; index < path.size; index++)
					{
						if(isdefined(level.var_562c8f67) && (abs((path[index - 1][2]) - path[index][2])) > level.var_562c8f67)
						{
							break;
						}
						currentseglength = distance(path[index - 1], path[index]);
						var_570a7c72 = (segmentlength + currentseglength) > deviationdistance;
						if(index == (path.size - 1) && !var_570a7c72)
						{
							deviationdistance = (segmentlength + currentseglength) - 1;
							var_eb1c6f1c = 1;
						}
						if(var_570a7c72 || var_eb1c6f1c)
						{
							remaininglength = deviationdistance - segmentlength;
							dir = vectornormalize(path[index] - (path[index - 1]));
							seedposition = (path[index - 1]) + (dir * remaininglength);
							/#
								recordcircle(seedposition, 2, (1, 0.5, 0), "", self);
							#/
							innerzigzagradius = level.inner_zigzag_radius;
							if(var_eb1c6f1c)
							{
								innerzigzagradius = 0;
							}
							else if(isdefined(self.inner_zigzag_radius))
							{
								innerzigzagradius = self.inner_zigzag_radius;
							}
							outerzigzagradius = level.outer_zigzag_radius;
							if(var_eb1c6f1c)
							{
								outerzigzagradius = 48;
							}
							else if(isdefined(self.outer_zigzag_radius))
							{
								outerzigzagradius = self.outer_zigzag_radius;
							}
							if(getdvarint(#"hash_32b7866126eb3f6", 1))
							{
								queryresult = positionquery_source_navigation(seedposition, innerzigzagradius, outerzigzagradius, 36, 16, self, 16);
							}
							else
							{
								queryresult = {#data:function_bc777234(seedposition, dir, 4, max(innerzigzagradius, outerzigzagradius / 2), outerzigzagradius, 36, self getpathfindingradius())};
							}
							positionquery_filter_inclaimedlocation(queryresult, self);
							queryresult.data = function_7b8e26b3(queryresult.data, 0, "inClaimedLocation");
							if(queryresult.data.size > 0)
							{
								a_data = array::randomize(queryresult.data);
								for(i = 0; i < a_data.size; i++)
								{
									point = a_data[i];
									n_z_diff = seedposition[2] - point.origin[2];
									if(abs(n_z_diff) < 32)
									{
										/#
											if(getdvarint(#"ai_debugzigzag", 0))
											{
												recordstar(point.origin, (1, 0.5, 0), "");
											}
										#/
										self setgoal(point.origin);
										break;
									}
								}
							}
							break;
						}
						segmentlength = segmentlength + currentseglength;
					}
				}
			}
		}
		self.nextgoalupdate = gettime() + randomintrange(500, 1000);
	}
	aiprofile_endentry();
}

/*
	Name: function_bc777234
	Namespace: namespace_e292b080
	Checksum: 0x44F97CF3
	Offset: 0x4358
	Size: 0x1C4
	Parameters: 7
	Flags: Linked
*/
function function_bc777234(position, forward, var_cfcfe495, inner_radius, outer_radius, max_height, var_5e95f317)
{
	points = [];
	var_467c5362 = getclosestpointonnavmesh(position, 256);
	min_dist_sq = sqr(inner_radius);
	angles = vectortoangles(forward);
	var_8e05c13a = (0, 0, 1);
	if(isdefined(var_467c5362))
	{
		for(i = 0; i < var_cfcfe495; i++)
		{
			var_436b8c8c = namespace_85745671::function_4ed3741d(var_467c5362, angles, 0, outer_radius, inner_radius, 45, 135);
			traceresult = checknavmeshdirection(var_467c5362, var_436b8c8c, randomfloatrange(inner_radius, outer_radius), var_5e95f317);
			if((abs(traceresult[2] - var_467c5362[2])) <= max_height && distancesquared(traceresult, var_467c5362) < min_dist_sq)
			{
				points[points.size] = {#origin:traceresult};
			}
		}
	}
	return points;
}

