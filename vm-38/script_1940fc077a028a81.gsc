#using script_178024232e91b0a1;
#using script_3357acf79ce92f4b;
#using script_3411bb48d41bd3b;
#using script_3aa0f32b70d4f7cb;
#using script_4bf952f6ba31bb17;
#using script_4d85e8de54b02198;
#using script_7e59d7bba853fe4b;
#using script_bd2b8aaa388dcce;
#using script_caf007e2a98afa2;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace namespace_e292b080;

/*
	Name: function_9fedd279
	Namespace: namespace_e292b080
	Checksum: 0x3DE2408D
	Offset: 0x330
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_9fedd279()
{
	level notify(1536429938);
}

/*
	Name: function_89f2df9
	Namespace: namespace_e292b080
	Checksum: 0xB0219877
	Offset: 0x350
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_1f8830cd01b39f8f", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_e292b080
	Checksum: 0x9FF7E080
	Offset: 0x398
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
	Checksum: 0x266192E5
	Offset: 0x3F0
	Size: 0x1654
	Parameters: 0
	Flags: Linked, Private
*/
function private function_7ff2a0fc()
{
	if(zm_utility::is_survival() && getdvar(#"hash_2d0879ab385bc2c8", 0))
	{
		/#
			assert(isscriptfunctionptr(&function_e91d8371));
		#/
		behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_1d72a84d1a755d7f", &function_e91d8371, 1);
	}
	else
	{
		/#
			assert(isscriptfunctionptr(&function_e91d8371));
		#/
		behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_1d72a84d1a755d7f", &function_e91d8371, 2);
	}
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
		assert(isscriptfunctionptr(&function_a9602314));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_398253cb51d92e3c", &function_a9602314);
	/#
		assert(isscriptfunctionptr(&zombieshouldmelee));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_3481eea9a9726377", &zombieshouldmelee);
	/#
		assert(isscriptfunctionptr(&function_d8b225ae));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_61ab63365479456b", &function_d8b225ae);
	/#
		assert(isscriptfunctionptr(&zombieshouldmove));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_61a4f87f1c6225d0", &zombieshouldmove);
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
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_2cfb23ecd91e559f", &zombieshouldknockdown);
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
		assert(isscriptfunctionptr(&function_67d5c154));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_68b1f7fd11065924", &function_67d5c154);
	/#
		assert(isscriptfunctionptr(&function_837931eb));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_1fb23f2490e563bd", &function_837931eb);
	/#
		assert(isscriptfunctionptr(&function_837931eb));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_1fb23f2490e563bd", &function_837931eb);
	/#
		assert(isscriptfunctionptr(&function_5ac985fe));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_9d432cd960b099a", &function_5ac985fe);
	/#
		assert(isscriptfunctionptr(&function_5ac985fe));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_9d432cd960b099a", &function_5ac985fe);
	/#
		assert(isscriptfunctionptr(&function_c6787767));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_a8a1cfa346aa6fb", &function_c6787767);
	/#
		assert(isscriptfunctionptr(&zombiemoveactionupdate));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_7963765b515bfe18", &zombiemoveactionupdate);
	/#
		assert(isscriptfunctionptr(&function_c6787767));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_a8a1cfa346aa6fb", &function_c6787767);
	/#
		assert(isscriptfunctionptr(&zombiemoveactionupdate));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_7963765b515bfe18", &zombiemoveactionupdate);
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
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_70e2c6f9bb18c5cc", &zombieknockdownactionstart);
	/#
		assert(isscriptfunctionptr(&function_c8939973));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_7a21325931f5ca2f", &function_c8939973);
	/#
		assert(isscriptfunctionptr(&zombiegetupactionterminate));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_6c72993cdaed86ac", &zombiegetupactionterminate);
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
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_636c8e136e07da5a", &function_f8250d5e);
	/#
		assert(isscriptfunctionptr(&function_860d5d8));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_42e3f983d696091b", &function_860d5d8);
	/#
		assert(isscriptfunctionptr(&function_f8250d5e));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_636c8e136e07da5a", &function_f8250d5e);
	/#
		assert(isscriptfunctionptr(&function_860d5d8));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_42e3f983d696091b", &function_860d5d8);
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
	/#
		assert(!isdefined(&function_83a4da79) || isscriptfunctionptr(&function_83a4da79));
	#/
	/#
		assert(!isdefined(&function_596c95b0) || isscriptfunctionptr(&function_596c95b0));
	#/
	/#
		assert(!isdefined(&function_5abf1ae8) || isscriptfunctionptr(&function_5abf1ae8));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction(#"hash_69494c58be35bb56", &function_83a4da79, &function_596c95b0, &function_5abf1ae8);
	/#
		assert(isscriptfunctionptr(&function_62fb515e));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_7aebffd77debd56e", &function_62fb515e);
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
	Checksum: 0xD0391D8F
	Offset: 0x1A50
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
	if(is_true(level.is_survival) && is_true(entity.var_f9a12c59))
	{
		function_eea7a68a(entity);
	}
}

/*
	Name: function_5aeeecac
	Namespace: namespace_e292b080
	Checksum: 0xED413BA8
	Offset: 0x1B40
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
	Checksum: 0xD654D59A
	Offset: 0x1C90
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function function_eea7a68a(entity)
{
	entity.enemy_override = namespace_85745671::function_b67c088d();
	namespace_85745671::function_744beb04(entity);
	awareness::function_c8f102d5(entity);
}

/*
	Name: function_5ba8b9d4
	Namespace: namespace_e292b080
	Checksum: 0x7CCD5905
	Offset: 0x1CE8
	Size: 0x362
	Parameters: 6
	Flags: Linked
*/
function function_5ba8b9d4(entity, var_21bdf069, dynent, var_f3fec032, var_9680a0e4, var_144ce0a0)
{
	if(var_144ce0a0 && var_9680a0e4 != 0 || is_true(var_f3fec032.var_c14aa186[var_9680a0e4].ignoredamage))
	{
		return false;
	}
	if(!isdefined(dynent.var_81cb076))
	{
		bounds = function_c440d28e(dynent.var_15d44120);
		var_8c2f83ef = bounds.maxs - bounds.mins;
		var_cc87c802 = getxmodelcenteroffset(dynent.var_15d44120);
		if(var_8c2f83ef[0] < var_8c2f83ef[1])
		{
			door_right = anglestoright(dynent.angles);
			doorcenter = dynent.origin + ((door_right * -1) * var_cc87c802[1]);
			var_8d59f800 = door_right * (var_8c2f83ef[1] / 2);
			/#
				recordstar(doorcenter, (0, 1, 0), "");
			#/
			end_point = doorcenter + var_8d59f800;
			start_point = doorcenter - var_8d59f800;
		}
		else
		{
			var_71dfc5d4 = anglestoforward(dynent.angles);
			var_8d59f800 = var_71dfc5d4 * (var_8c2f83ef[0] / 2);
			doorcenter = dynent.origin + (var_71dfc5d4 * var_cc87c802[0]);
			/#
				recordstar(doorcenter, (1, 0.5, 0), "");
			#/
			end_point = doorcenter + var_8d59f800;
			start_point = doorcenter - var_8d59f800;
		}
		dynent.var_81cb076 = {#end_point:end_point, #start_point:start_point};
	}
	/#
		recordline(dynent.var_81cb076.start_point, dynent.var_81cb076.end_point, (1, 0, 0), "");
		recordcircle(entity.origin, sqrt(var_21bdf069), (0, 1, 0), "");
	#/
	point = math::closest_point_on_line(entity.origin, dynent.var_81cb076.start_point, dynent.var_81cb076.end_point);
	if(lengthsquared(point - entity.origin) < var_21bdf069)
	{
		return true;
	}
	return false;
}

/*
	Name: function_1ca9d31b
	Namespace: namespace_e292b080
	Checksum: 0x43652A17
	Offset: 0x2058
	Size: 0x310
	Parameters: 1
	Flags: Linked
*/
function function_1ca9d31b(entity)
{
	if(!getdvarint(#"hash_397bf855bf5ab4de", 1))
	{
		return;
	}
	var_577fefe8 = entity getpathfindingradius() + getdvar(#"hash_13d07d8f76be4095", 275);
	var_e86a4d9 = function_c3d68575(entity.origin, (var_577fefe8, var_577fefe8, entity function_6a9ae71()));
	height_check = max(entity function_6a9ae71(), 95);
	var_21bdf069 = sqr((isdefined(entity.var_c50d964) ? entity.var_c50d964 : entity getpathfindingradius()));
	foreach(dynent in var_e86a4d9)
	{
		if((abs(dynent.origin[2] - entity.origin[2])) > height_check || !namespace_85745671::function_8f57dc52(dynent, 1))
		{
			continue;
		}
		should_break = 0;
		var_144ce0a0 = dynent.script_noteworthy == #"hash_4d1fb8524fdfd254";
		if(var_144ce0a0 || dynent.destructible)
		{
			if(!isdefined(dynent.bundle))
			{
				dynent.bundle = function_489009c1(dynent);
			}
			state = function_ffdbe8c2(dynent);
			should_break = function_5ba8b9d4(entity, var_21bdf069, dynent, dynent.bundle, state, var_144ce0a0);
		}
		if(should_break && isdefined(dynent.bundle))
		{
			dynent dodamage(dynent.health, entity.origin, entity, entity, undefined, "MOD_MELEE");
		}
	}
}

/*
	Name: zombieshouldmelee
	Namespace: namespace_e292b080
	Checksum: 0xA5F39569
	Offset: 0x2370
	Size: 0x656
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
	var_c6bad08 = undefined;
	enemy = namespace_e0710ee6::function_825317c(entity);
	enemy = (isdefined(enemy) ? enemy : entity.enemy);
	test_origin = enemy.origin;
	if(isplayer(enemy))
	{
		if(namespace_85745671::function_142c3c86(enemy))
		{
			var_c6bad08 = enemy getvehicleoccupied();
			test_origin = namespace_85745671::function_401070dd(var_c6bad08, enemy);
			if(!isdefined(test_origin))
			{
				test_origin = enemy.origin;
			}
			test_origin = getclosestpointonnavmesh(test_origin, 200, entity getpathfindingradius());
			if(!isdefined(test_origin))
			{
				test_origin = enemy.origin;
			}
		}
		else
		{
			if(isvehicle(enemy getgroundent()))
			{
				var_c6bad08 = enemy getgroundent();
				test_origin = (isdefined(enemy.last_valid_position) ? enemy.last_valid_position : entity.enemy.origin);
			}
			else if(isvehicle(enemy getmoverent()))
			{
				var_c6bad08 = enemy getmoverent();
				test_origin = (isdefined(enemy.last_valid_position) ? enemy.last_valid_position : enemy.origin);
			}
		}
		if(isdefined(var_c6bad08) && isdefined(entity.var_cbc65493))
		{
			meleedistsq = meleedistsq * entity.var_cbc65493;
		}
		if(isdefined(var_c6bad08) && isdefined(entity.var_a9db7324) && abs(var_c6bad08 getspeed()) > 0)
		{
			meleedistsq = meleedistsq * entity.var_a9db7324;
		}
	}
	z_delta = abs(entity.origin[2] - test_origin[2]);
	if(z_delta > (isdefined(entity.var_737e8510) ? entity.var_737e8510 : 64))
	{
		return false;
	}
	if(z_delta < 40)
	{
		if(distance2dsquared(entity.origin, test_origin) > meleedistsq)
		{
			return false;
		}
	}
	else if(distancesquared(entity.origin, test_origin) > meleedistsq)
	{
		return false;
	}
	yawtoenemy = angleclamp180(entity.angles[1] - (vectortoangles(enemy.origin - entity.origin)[1]));
	if(abs(yawtoenemy) > (isdefined(entity.var_1c0eb62a) ? entity.var_1c0eb62a : 60))
	{
		return false;
	}
	if(!entity cansee((isdefined(var_c6bad08) ? var_c6bad08 : enemy)))
	{
		return false;
	}
	if(distancesquared(entity.origin, test_origin) < sqr(40))
	{
		entity.idletime = gettime();
		entity.var_1b250399 = entity.origin;
		return true;
	}
	if(isdefined(var_c6bad08))
	{
		entity.idletime = gettime();
		entity.var_1b250399 = entity.origin;
		return true;
	}
	if(is_true(self.var_37f16e2e) && !tracepassedonnavmesh(entity.origin, (isdefined(enemy.last_valid_position) ? enemy.last_valid_position : enemy.origin), enemy getpathfindingradius()))
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
	Checksum: 0x55FEA05C
	Offset: 0x29D0
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
	Checksum: 0xD20C53CF
	Offset: 0x2AD0
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
	Checksum: 0x4BA0FE37
	Offset: 0x2B08
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
	Checksum: 0x723F82D9
	Offset: 0x2BF0
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
	Checksum: 0xECD34375
	Offset: 0x2C70
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
	Checksum: 0x5E12E269
	Offset: 0x2C98
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
	Checksum: 0x1A0BD635
	Offset: 0x2CC0
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
	Checksum: 0xECF2F4E
	Offset: 0x2D50
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
	Checksum: 0x4D307411
	Offset: 0x2D80
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
	Name: function_67d5c154
	Namespace: namespace_e292b080
	Checksum: 0x72A2F3E7
	Offset: 0x2DB8
	Size: 0x5E
	Parameters: 1
	Flags: Linked
*/
function function_67d5c154(entity)
{
	if(isdefined(entity.var_62b4721) && (entity.var_62b4721 + getdvarfloat(#"hash_2cc8a2770c6d6662", 3000)) > gettime())
	{
		return false;
	}
	return true;
}

/*
	Name: function_83a4da79
	Namespace: namespace_e292b080
	Checksum: 0xE898C843
	Offset: 0x2E20
	Size: 0x30
	Parameters: 2
	Flags: Linked
*/
function function_83a4da79(entity, asmstate)
{
	animationstatenetworkutility::requeststate(entity, asmstate);
	return 5;
}

/*
	Name: function_596c95b0
	Namespace: namespace_e292b080
	Checksum: 0xC45B6388
	Offset: 0x2E58
	Size: 0x38
	Parameters: 2
	Flags: Linked
*/
function function_596c95b0(entity, asmstate)
{
	if(asmstate namespace_85745671::function_dc276637(asmstate))
	{
		return 5;
	}
	return 4;
}

/*
	Name: function_5abf1ae8
	Namespace: namespace_e292b080
	Checksum: 0xBB978F5B
	Offset: 0x2E98
	Size: 0x18
	Parameters: 2
	Flags: Linked
*/
function function_5abf1ae8(entity, asmstate)
{
	return 4;
}

/*
	Name: function_62fb515e
	Namespace: namespace_e292b080
	Checksum: 0xACB04C00
	Offset: 0x2EB8
	Size: 0x16
	Parameters: 1
	Flags: Linked
*/
function function_62fb515e(entity)
{
	entity.var_62b4721 = gettime();
}

/*
	Name: function_10b38c5a
	Namespace: namespace_e292b080
	Checksum: 0xA1C9B2E6
	Offset: 0x2ED8
	Size: 0x78
	Parameters: 1
	Flags: Linked
*/
function function_10b38c5a(entity)
{
	if(is_true(entity.var_1033fa72) && is_true(entity.var_9f6112bb) && (!isdefined(entity.var_6324ed63) || gettime() > entity.var_6324ed63))
	{
		return true;
	}
	return false;
}

/*
	Name: function_837931eb
	Namespace: namespace_e292b080
	Checksum: 0xDC92ED83
	Offset: 0x2F58
	Size: 0x3A
	Parameters: 1
	Flags: Linked
*/
function function_837931eb(entity)
{
	if(self.awarenesslevelcurrent != "combat")
	{
		return 0;
	}
	return function_10b38c5a(entity);
}

/*
	Name: function_5ac985fe
	Namespace: namespace_e292b080
	Checksum: 0x5992402E
	Offset: 0x2FA0
	Size: 0x36
	Parameters: 1
	Flags: Linked
*/
function function_5ac985fe(entity)
{
	if(getdvar(#"hash_2d0879ab385bc2c8", 0))
	{
		return false;
	}
	return true;
}

/*
	Name: function_da99776f
	Namespace: namespace_e292b080
	Checksum: 0xCB04F697
	Offset: 0x2FE0
	Size: 0x208
	Parameters: 1
	Flags: Linked
*/
function function_da99776f(entity)
{
	entity.var_1033fa72 = undefined;
	entity.var_9f6112bb = undefined;
	if(isdefined(entity.var_5aaa7f76))
	{
		toenemy = entity.var_5aaa7f76 - entity.origin;
		toenemyyaw = vectortoangles(toenemy)[1];
		forwardyaw = entity.angles[1];
		deltayaw = angleclamp180(toenemyyaw - forwardyaw);
		var_a94379e2 = (abs(deltayaw) < 45 ? 0 : deltayaw - (math::sign(deltayaw) * 45));
		targetyaw = toenemyyaw - ((ceil(abs(var_a94379e2) / 90)) * 90) * math::sign(var_a94379e2);
		newangles = (entity.angles[0], targetyaw, entity.angles[2]);
		entity teleport(entity.origin, newangles);
		/#
			var_dec635d = anglestoforward(newangles);
			recordline(entity.origin, entity.origin + (var_dec635d * 50), (0, 1, 0));
		#/
	}
	return true;
}

/*
	Name: function_a9602314
	Namespace: namespace_e292b080
	Checksum: 0x859051C
	Offset: 0x31F0
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function function_a9602314(entity)
{
	entity.var_1033fa72 = undefined;
	entity.var_9f6112bb = undefined;
}

/*
	Name: function_573545a
	Namespace: namespace_e292b080
	Checksum: 0x17AC4F3A
	Offset: 0x3220
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
	Checksum: 0x3DF3E03
	Offset: 0x3250
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
	Name: function_c6787767
	Namespace: namespace_e292b080
	Checksum: 0x350783A0
	Offset: 0x3278
	Size: 0xA2
	Parameters: 1
	Flags: Linked, Private
*/
function private function_c6787767(entity)
{
	entity.movetime = gettime();
	entity.moveorigin = entity.origin;
	entity.var_13138acf = 0;
	entity.current_move_anim = entity asmgetcurrentdeltaanimation();
	if(isdefined(entity.current_move_anim))
	{
		entity.var_cb2a43c0 = (getmovedelta(entity.current_move_anim) / getanimlength(entity.current_move_anim)) * 0.5;
	}
	return true;
}

/*
	Name: zombiemoveactionupdate
	Namespace: namespace_e292b080
	Checksum: 0x1428B5A9
	Offset: 0x3328
	Size: 0x1AA
	Parameters: 1
	Flags: Linked, Private
*/
function private zombiemoveactionupdate(entity)
{
	if(!isdefined(entity.current_move_anim) || entity asmgetcurrentdeltaanimation() !== entity.current_move_anim)
	{
		entity.current_move_anim = entity asmgetcurrentdeltaanimation();
		if(isdefined(entity.current_move_anim))
		{
			entity.var_cb2a43c0 = (getmovedelta(entity.current_move_anim) / getanimlength(entity.current_move_anim)) * 0.5;
		}
	}
	if(!is_true(entity.missinglegs) && (gettime() - entity.movetime) >= 1000 && isdefined(entity.var_cb2a43c0))
	{
		distsq = distancesquared(entity.origin, entity.moveorigin);
		if(distsq < lengthsquared(entity.var_cb2a43c0) && !is_true(entity.cant_move))
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
	Checksum: 0x922C1B4
	Offset: 0x34E0
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
			entity callback::function_d8abfc3d(#"hash_11aa32ad6d527054", &damagedoor);
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
	Checksum: 0x40E87E92
	Offset: 0x36B0
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
	Checksum: 0x994FC315
	Offset: 0x38D8
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
	asmstate callback::function_52ac9652(#"hash_11aa32ad6d527054", &damagedoor);
	if(asmstate asmgetstatus() == "asm_status_running")
	{
		asmstate.var_fc781a6f = 1;
	}
	return 4;
}

/*
	Name: zombieknockdownactionstart
	Namespace: namespace_e292b080
	Checksum: 0x9E05FC94
	Offset: 0x39F8
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
	Checksum: 0x14080579
	Offset: 0x3AD0
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
	Checksum: 0x4885E2C
	Offset: 0x3B50
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
	Checksum: 0x92B8EA10
	Offset: 0x3BD0
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
	Checksum: 0x5CBFA0ED
	Offset: 0x3C38
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
	Checksum: 0xA87E1B43
	Offset: 0x3C70
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
	Checksum: 0xBE1567DA
	Offset: 0x3D80
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
	Checksum: 0x46FE23D4
	Offset: 0x3DB0
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
	Checksum: 0xA07022FE
	Offset: 0x3DE8
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
	Checksum: 0x20F8687
	Offset: 0x3E18
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
	Checksum: 0xB9715477
	Offset: 0x3F38
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
	Checksum: 0x858E45BA
	Offset: 0x3FE8
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
	Checksum: 0x73C15C3D
	Offset: 0x41E0
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
	Checksum: 0xFD3DE8FF
	Offset: 0x42D8
	Size: 0x109C
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
	var_e24852e1 = distance2dsquared(self.origin, goalpos);
	var_61cfbe48 = 0;
	if(isdefined(self.var_40e7d5fb))
	{
		self [[self.var_40e7d5fb]](goalpos);
	}
	if(getdvarint(#"hash_6e49c9088d49cb70", 1) > 0)
	{
		var_20edce9c = (isdefined(self.var_62561fdc) ? self.var_62561fdc : getdvarfloat(#"hash_53b69693de5913be", 1250));
		if(var_e24852e1 > sqr(var_20edce9c))
		{
			var_514268b6 = goalpos - self.origin;
			disttogoal = sqrt(var_c7dee8e5);
			dirtogoal = vectorscale(var_514268b6, 1 / disttogoal);
			var_625d15c1 = getdvarint(#"hash_2d576274bf096bb1", 5);
			var_e8b40f42 = (isdefined(self.var_cfb82e92) ? self.var_cfb82e92 : 2);
			var_2a45598f = (isdefined(self.var_a44ca810) ? self.var_a44ca810 : getdvarfloat(#"hash_70d5ce88e4373b4a", 500));
			var_188c33e9 = [0:self.origin + (dirtogoal * var_2a45598f)];
			for(var_b292b14 = 0; var_b292b14 < var_625d15c1; var_b292b14++)
			{
				percentage = 0.3 + (var_b292b14 * 0.1);
				if(disttogoal * percentage > var_2a45598f)
				{
					var_188c33e9[var_188c33e9.size] = self.origin + ((dirtogoal * disttogoal) * percentage);
				}
			}
			var_a2dcc3fb = undefined;
			best_point = undefined;
			var_dd9d0d3b = 0;
			for(var_b292b14 = 0; var_b292b14 < var_188c33e9.size; var_b292b14++)
			{
				point = var_188c33e9[var_b292b14];
				var_b3e12265 = function_9cc082d2(point, getdvarfloat(#"hash_340ef7499f8caf47", 500));
				if(isdefined(var_b3e12265[#"point"]))
				{
					if(ispointonnavmesh(var_b3e12265[#"point"], self))
					{
						/#
							if(getdvarint(#"hash_8379681233f9701", 0) > 0)
							{
								recordline(point, var_b3e12265[#"point"], (1, 0, 1));
							}
						#/
						z_dist = abs(var_b3e12265[#"point"][2] - point[2]);
						if(!isdefined(var_a2dcc3fb) || var_a2dcc3fb > z_dist)
						{
							var_a2dcc3fb = z_dist;
							best_point = var_b3e12265[#"point"];
						}
						var_dd9d0d3b++;
						if(var_dd9d0d3b >= var_e8b40f42)
						{
							/#
								if(getdvarint(#"hash_8379681233f9701", 0) > 0)
								{
									recordline(point, self.origin, (1, 0, 1));
								}
							#/
							break;
						}
					}
				}
			}
			/#
				if(getdvarint(#"hash_8379681233f9701", 0) > 0)
				{
					if(isdefined(best_point))
					{
						recordsphere(best_point, 10, (1, 0, 1));
					}
					else
					{
						foreach(point in var_188c33e9)
						{
							recordsphere(point, 8, (1, 0, 0));
						}
					}
				}
			#/
			if(isdefined(best_point))
			{
				goalpos = best_point;
				var_61cfbe48 = 1;
			}
		}
	}
	if(is_true(self.var_4fe4e626))
	{
		self.var_4fe4e626 = 0;
		shouldrepath = 1;
	}
	else
	{
		if(!var_61cfbe48 && isdefined(self.var_9e6e6645) && distancesquared(self.var_9e6e6645, goalpos) > sqr(18))
		{
			shouldrepath = 1;
		}
		else
		{
			if(var_61cfbe48 && (isdefined(self.var_9e6e6645) && isdefined(self.var_d4118e22)) && distancesquared(self.var_9e6e6645, goalpos) > (self.var_d4118e22 * 0.5))
			{
				shouldrepath = 1;
			}
			else
			{
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
			}
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
		self.var_9e6e6645 = goalpos;
		if(var_61cfbe48)
		{
			self.var_d4118e22 = distancesquared(self.origin, goalpos);
		}
		should_zigzag = 0;
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
					var_f67d1ba2 = generatenavmeshpath(self.origin, goalpos, self);
					if(isdefined(var_f67d1ba2) && var_f67d1ba2.status === "succeeded" && isdefined(var_f67d1ba2.pathpoints))
					{
						path = var_f67d1ba2.pathpoints;
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
		if(!isdefined(self.attackable))
		{
			var_6f520cc1 = (isdefined(self.var_9b6bfdb7) ? self.var_9b6bfdb7 : 500);
			self.nextgoalupdate = gettime() + (randomintrange(var_6f520cc1, var_6f520cc1 + 500));
		}
	}
	aiprofile_endentry();
}

/*
	Name: function_bc777234
	Namespace: namespace_e292b080
	Checksum: 0x3B751BAF
	Offset: 0x5380
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

