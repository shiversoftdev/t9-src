#using script_164a456ce05c3483;
#using script_17dcb1172e441bf6;
#using script_1b01e95a6b5270fd;
#using script_1ee011cd0961afd7;
#using script_2a5bf5b4a00cee0d;
#using script_2c5daa95f8fec03c;
#using script_35598499769dbb3d;
#using script_3819e7a1427df6d2;
#using script_3aa0f32b70d4f7cb;
#using script_3faf478d5b0850fe;
#using script_41fe08c37d53a635;
#using script_47851dbeea22fe66;
#using script_4bf952f6ba31bb17;
#using script_4d85e8de54b02198;
#using script_522aeb6ae906391e;
#using script_5701633066d199f2;
#using script_57f7003580bb15e0;
#using script_59f07c660e6710a5;
#using script_5f20d3b434d24884;
#using script_7b7ed6e4bc963a51;
#using script_bd2b8aaa388dcce;
#using script_caf007e2a98afa2;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;

#namespace namespace_514c8ebc;

/*
	Name: init
	Namespace: namespace_514c8ebc
	Checksum: 0xDEFD28E7
	Offset: 0x5F0
	Size: 0x9BC
	Parameters: 0
	Flags: Linked
*/
function init()
{
	namespace_250e9486::function_252dff4d("gegenees", 27, &function_1b3fc8e4);
	clientfield::register("actor", "gegenees_shield_blast_effect", 16000, 1, "counter");
	clientfield::register("actor", "gegenees_shield_guard_effect", 16000, 1, "int");
	clientfield::register("actor", "gegenees_spear_tip_effect", 16000, 1, "int");
	clientfield::register("actor", "gegenees_spear_tip_tell_effect", 16000, 1, "int");
	clientfield::register("toplayer", "gegenees_damage_cf", 16000, 1, "counter");
	clientfield::register("scriptmover", "gegenees_spear_miss_cf", 16000, 1, "counter");
	clientfield::register("actor", "gegenees_helmet_explosion_cf", 16000, 1, "int");
	level.var_8c5f46f1 = [];
	for(i = 0; i < 8; i++)
	{
		level.var_8c5f46f1[level.var_8c5f46f1.size] = namespace_ec06fe4a::function_e22ae9b3((0, 0, 0), "tag_origin", (0, 0, 0), "gegenees impact");
	}
	/#
		assert(isscriptfunctionptr(&function_d5d3aa77));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_2bc0d801acaee9a4", &function_d5d3aa77);
	/#
		assert(isscriptfunctionptr(&function_4334cc3b));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_4053e75ff0301438", &function_4334cc3b);
	/#
		assert(isscriptfunctionptr(&function_a953d80d));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_1075ab617f39c601", &function_a953d80d);
	/#
		assert(isscriptfunctionptr(&function_7f34a57c));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_1e595daa404c5a3d", &function_7f34a57c);
	/#
		assert(isscriptfunctionptr(&function_75db4aba));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_7e22610d7293179e", &function_75db4aba);
	/#
		assert(isscriptfunctionptr(&function_d344063a));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_1d6949a6c9ec0081", &function_d344063a);
	/#
		assert(isscriptfunctionptr(&function_3133f922));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_6f4458058e881523", &function_3133f922);
	/#
		assert(isscriptfunctionptr(&function_d82de95f));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_16cf6fd0904e492f", &function_d82de95f);
	/#
		assert(isscriptfunctionptr(&function_564b9cf5));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_74ab5c3ab4cbfdda", &function_564b9cf5);
	/#
		assert(isscriptfunctionptr(&function_7505908b));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_572453d6d6540a73", &function_7505908b);
	/#
		assert(isscriptfunctionptr(&function_9175e656));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_1f9cdbd55afb3860", &function_9175e656);
	/#
		assert(isscriptfunctionptr(&function_c81af561));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_2c97edb3312da9c6", &function_c81af561);
	/#
		assert(isscriptfunctionptr(&function_47fdaf31));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_471802b111fa1af0", &function_47fdaf31);
	/#
		assert(isscriptfunctionptr(&function_ebf730ee));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_3e737f26ad26044", &function_ebf730ee);
	/#
		assert(!isdefined(&function_2301c0a7) || isscriptfunctionptr(&function_2301c0a7));
	#/
	/#
		assert(!isdefined(&function_c2155e05) || isscriptfunctionptr(&function_c2155e05));
	#/
	/#
		assert(!isdefined(&function_15502a5) || isscriptfunctionptr(&function_15502a5));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction(#"hash_49454f4516c40e65", &function_2301c0a7, &function_c2155e05, &function_15502a5);
	animationstatenetwork::registeranimationmocomp("mocomp_gegenees_shield", &function_d645d2ec, &function_f6bb8a07, &function_64c4573);
	animationstatenetwork::registernotetrackhandlerfunction("gegenees_melee", &function_c3c86ec1);
	animationstatenetwork::registernotetrackhandlerfunction("geg_throw_spear", &function_7fe60e9e);
	animationstatenetwork::registernotetrackhandlerfunction("geg_grab_spear", &function_4d6e95b6);
	animationstatenetwork::registernotetrackhandlerfunction("gegenees_weapon_drop", &function_43104218);
}

/*
	Name: function_1b3fc8e4
	Namespace: namespace_514c8ebc
	Checksum: 0xE38400EC
	Offset: 0xFB8
	Size: 0x2BA
	Parameters: 0
	Flags: Linked
*/
function function_1b3fc8e4()
{
	namespace_250e9486::function_25b2c8a9();
	self namespace_250e9486::function_db744d28();
	self.maxhealth = self.maxhealth + (200000 + (100000 * getplayers().size));
	self.health = self.maxhealth;
	self.var_1c8b76d3 = 1;
	self.no_gib = 1;
	self.meleedistsq = sqr(72);
	self.goalradius = 68;
	self setblackboardattribute("_gegenees_shield", "shield_down");
	self setblackboardattribute("_locomotion_speed", "locomotion_speed_walk");
	self.zombie_move_speed = "walk";
	self collidewithactors(1);
	aiutility::addaioverridedamagecallback(self, &function_ca5688e3);
	self callback::on_ai_killed(&function_a231dd3b);
	target_set(self);
	self namespace_e32bb68::function_3a59ec34("zmb_doa_ai_gegenees_spawn");
	self thread namespace_9fc66ac::function_ba33d23d(#"hash_2f8e9463ad366ab0", #"hash_2f8e9463ad366ab0", #"hash_4fbc2a660ed47842");
	self attach("c_t8_zmb_dlc2_gegenees_shield", "tag_weapon_left");
	self attach("c_t8_zmb_dlc2_gegenees_sword", "tag_weapon_right");
	self attach("c_t8_zmb_dlc2_gegenees_helmet1", "j_head");
	self function_d06af584();
	self.var_cc7959e1 = 1;
	self.var_ed782d5 = getweapon("zombietron_gegenees_spear_projectile");
	self.var_a9716e54 = 0;
	self.var_c63e2811 = 0;
}

/*
	Name: function_d4f5b993
	Namespace: namespace_514c8ebc
	Checksum: 0x139A11A0
	Offset: 0x1280
	Size: 0xEC
	Parameters: 2
	Flags: Linked, Private
*/
function private function_d4f5b993(entity, eventname)
{
	if(!isdefined(entity.favoriteenemy))
	{
		return false;
	}
	var_b3a11ca1 = blackboard::getblackboardevents(eventname);
	if(isdefined(var_b3a11ca1) && var_b3a11ca1.size)
	{
		foreach(var_8d7c592b in var_b3a11ca1)
		{
			if(var_8d7c592b.data.favoriteenemy === entity.favoriteenemy)
			{
				return false;
			}
		}
	}
	return true;
}

/*
	Name: function_697a9b7f
	Namespace: namespace_514c8ebc
	Checksum: 0x8F10857D
	Offset: 0x1378
	Size: 0x110
	Parameters: 3
	Flags: Linked, Private
*/
function private function_697a9b7f(entity, minrange, maxrange)
{
	if(!isdefined(entity.favoriteenemy))
	{
		return 0;
	}
	if(isdefined(entity.var_b491d096))
	{
		return 0;
	}
	if(!isdefined(minrange))
	{
		minrange = 200;
	}
	if(!isdefined(maxrange))
	{
		maxrange = 1000;
	}
	withinrange = distancesquared(entity.origin, entity.favoriteenemy.origin) <= sqr(maxrange);
	withinrange = entity isatgoal() || (withinrange && distancesquared(entity.origin, entity.favoriteenemy.origin) >= sqr(minrange));
	return withinrange;
}

/*
	Name: function_180db9a7
	Namespace: namespace_514c8ebc
	Checksum: 0x9F6A1B4E
	Offset: 0x1490
	Size: 0x92
	Parameters: 1
	Flags: Linked, Private
*/
function private function_180db9a7(entity)
{
	if(!isdefined(entity.favoriteenemy))
	{
		return 0;
	}
	if(isdefined(entity.var_b491d096))
	{
		return 0;
	}
	can_see = bullettracepassed(entity.origin + vectorscale((0, 0, 1), 36), entity.favoriteenemy.origin + vectorscale((0, 0, 1), 36), 0, undefined);
	return can_see;
}

/*
	Name: function_4b8e0aab
	Namespace: namespace_514c8ebc
	Checksum: 0x5835346C
	Offset: 0x1530
	Size: 0x102
	Parameters: 1
	Flags: Linked, Private
*/
function private function_4b8e0aab(entity)
{
	if(!isdefined(entity.favoriteenemy))
	{
		return 0;
	}
	if(isdefined(entity.var_b491d096))
	{
		return 0;
	}
	can_see = 0;
	trace = physicstrace(entity.origin + vectorscale((0, 0, 1), 48), entity.favoriteenemy.origin + vectorscale((0, 0, 1), 36), (-16, -16, -12), (16, 16, 12), entity);
	if(trace[#"fraction"] == 1 || trace[#"entity"] === entity.favoriteenemy)
	{
		can_see = 1;
	}
	return can_see;
}

/*
	Name: function_7f34a57c
	Namespace: namespace_514c8ebc
	Checksum: 0xB99135EB
	Offset: 0x1640
	Size: 0x68
	Parameters: 1
	Flags: Linked
*/
function function_7f34a57c(entity)
{
	if(function_697a9b7f(entity) && function_4b8e0aab(entity) && function_d4f5b993(entity, "geg_spear_attack"))
	{
		return true;
	}
	return false;
}

/*
	Name: function_f7d9bc34
	Namespace: namespace_514c8ebc
	Checksum: 0x3B7894D0
	Offset: 0x16B0
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function function_f7d9bc34()
{
	self endon(#"disconnect");
	self namespace_83eb6304::function_3ecfde67("incoming_impact");
	wait(1.2);
	if(isdefined(self))
	{
		self namespace_83eb6304::turnofffx("incoming_impact");
	}
}

/*
	Name: function_7fe60e9e
	Namespace: namespace_514c8ebc
	Checksum: 0x53665955
	Offset: 0x1720
	Size: 0x484
	Parameters: 1
	Flags: Linked
*/
function function_7fe60e9e(entity)
{
	var_d86ae1c4 = spawnstruct();
	var_d86ae1c4.favoriteenemy = entity.favoriteenemy;
	blackboard::addblackboardevent("geg_spear_attack", var_d86ae1c4, randomintrange(8500, 10000));
	if(!isactor(entity) || !isdefined(entity.favoriteenemy))
	{
		return;
	}
	entity.favoriteenemy thread function_f7d9bc34();
	targetpos = entity.favoriteenemy.origin;
	launchpos = entity gettagorigin("tag_inhand");
	var_ad804014 = 5;
	if(distancesquared(targetpos, entity.origin) > sqr(250))
	{
		velocity = entity.favoriteenemy getvelocity();
		targetpos = targetpos + (velocity * 0.25);
		var_a76a363d = math::randomsign() * randomint(var_ad804014);
		var_9b241db1 = math::randomsign() * randomint(var_ad804014);
		targetpos = targetpos + (var_a76a363d, var_9b241db1, 0);
		speed = length(velocity);
		if(speed > 0)
		{
			var_7ee6937e = vectornormalize((targetpos[0], targetpos[1], 0) - (launchpos[0], launchpos[1], 0));
			dot = vectordot(-1 * var_7ee6937e, velocity / speed);
			if(dot >= 0.8)
			{
				targetpos = targetpos + (((var_7ee6937e * dot) * speed) * 0.5);
			}
		}
	}
	targetpos = targetpos + vectorscale((0, 0, 1), 36);
	var_872c6826 = vectortoangles(targetpos - launchpos);
	angles = function_cc68801f(launchpos, targetpos, 600, getdvarfloat(#"bg_lowgravity", 0));
	if(isdefined(angles) && angles[#"hash_1d5798eaa3bed36c"] > 0)
	{
		dir = anglestoforward((-1 * angles[#"hash_1d5798eaa3bed36c"], var_872c6826[1], var_872c6826[2]));
	}
	else
	{
		dir = anglestoforward(var_872c6826);
	}
	velocity = dir * 600;
	var_1a3b2274 = "zombietron_gegenees_spear_projectile";
	var_a137cb9f = entity gettagorigin("tag_inhand");
	var_eb549b4f = entity.favoriteenemy.origin;
	projectile = entity magicmissile(entity.var_ed782d5, var_a137cb9f, velocity);
	projectile thread function_7d162bd0(projectile, entity);
	entity function_59e9f77b();
}

/*
	Name: function_a1fce938
	Namespace: namespace_514c8ebc
	Checksum: 0x2CA2FB0
	Offset: 0x1BB0
	Size: 0xA6
	Parameters: 0
	Flags: Linked, Private
*/
function private function_a1fce938()
{
	foreach(var_b12a43cc in level.var_8c5f46f1)
	{
		if(!is_true(var_b12a43cc.in_use))
		{
			var_b12a43cc.in_use = 1;
			return var_b12a43cc;
		}
	}
	return undefined;
}

/*
	Name: function_fc4cc729
	Namespace: namespace_514c8ebc
	Checksum: 0x5A8D9C5B
	Offset: 0x1C60
	Size: 0xC2
	Parameters: 2
	Flags: Linked, Private
*/
function private function_fc4cc729(enemy, origin)
{
	if(!isalive(enemy))
	{
		return false;
	}
	if(is_true(enemy.knockdown))
	{
		return false;
	}
	if(gibserverutils::isgibbed(enemy, 384))
	{
		return false;
	}
	if(enemy.archetype === #"gegenees")
	{
		return false;
	}
	if(distancesquared(enemy.origin, origin) > 10000)
	{
		return false;
	}
	return true;
}

/*
	Name: function_7e633e59
	Namespace: namespace_514c8ebc
	Checksum: 0x5AFD6497
	Offset: 0x1D30
	Size: 0xE0
	Parameters: 0
	Flags: Linked, Private
*/
function private function_7e633e59()
{
	var_a5a1f99c = getaiarchetypearray(#"zombie");
	var_a5a1f99c = array::filter(var_a5a1f99c, 0, &function_fc4cc729, self.origin);
	foreach(zombie in var_a5a1f99c)
	{
		zombie namespace_250e9486::setup_zombie_knockdown(self);
	}
}

/*
	Name: function_7d162bd0
	Namespace: namespace_514c8ebc
	Checksum: 0x988955D0
	Offset: 0x1E18
	Size: 0x1A4
	Parameters: 2
	Flags: Linked, Private
*/
function private function_7d162bd0(projectile, entity)
{
	result = undefined;
	result = projectile waittill(#"projectile_impact", #"projectile_impact_player", #"death");
	if(isdefined(projectile))
	{
		projectile thread namespace_ec06fe4a::function_52afe5df(3);
	}
	if(result._notify != "projectile_impact_player")
	{
		var_b12a43cc = function_a1fce938();
		if(isdefined(var_b12a43cc))
		{
			if(isdefined(projectile.origin))
			{
				projectile thread function_7e633e59();
				var_b12a43cc.origin = projectile.origin;
			}
			else if(isdefined(entity) && isdefined(entity.favoriteenemy))
			{
				var_b12a43cc.origin = entity.favoriteenemy.origin;
			}
			util::wait_network_frame();
			var_b12a43cc clientfield::increment("gegenees_spear_miss_cf");
			wait(0.25);
			var_b12a43cc.in_use = 0;
		}
	}
	else if(isdefined(result.player))
	{
		result.player clientfield::increment_to_player("gegenees_damage_cf");
	}
}

/*
	Name: function_4d6e95b6
	Namespace: namespace_514c8ebc
	Checksum: 0x9A1EA889
	Offset: 0x1FC8
	Size: 0x24
	Parameters: 1
	Flags: Linked, Private
*/
function private function_4d6e95b6(entity)
{
	entity function_d06af584();
}

/*
	Name: function_43104218
	Namespace: namespace_514c8ebc
	Checksum: 0x42CA568F
	Offset: 0x1FF8
	Size: 0x84
	Parameters: 1
	Flags: Linked, Private
*/
function private function_43104218(entity)
{
	destructserverutils::function_9885f550(entity, "left_hand", "tag_weapon_left");
	destructserverutils::function_9885f550(entity, "right_hand", "tag_weapon_right");
	destructserverutils::function_9885f550(entity, "right_arm_upper", "tag_inhand");
}

/*
	Name: function_e0b648bb
	Namespace: namespace_514c8ebc
	Checksum: 0xEA2B3B6D
	Offset: 0x2088
	Size: 0xE
	Parameters: 1
	Flags: Private
*/
function private function_e0b648bb(entity)
{
	return false;
}

/*
	Name: function_d344063a
	Namespace: namespace_514c8ebc
	Checksum: 0x553EE987
	Offset: 0x20A0
	Size: 0x2E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_d344063a(entity)
{
	if(is_true(entity.var_d64b7af0))
	{
		return true;
	}
	return false;
}

/*
	Name: function_47fdaf31
	Namespace: namespace_514c8ebc
	Checksum: 0x66F4F4AE
	Offset: 0x20D8
	Size: 0x16
	Parameters: 1
	Flags: Linked, Private
*/
function private function_47fdaf31(entity)
{
	entity.var_d64b7af0 = 0;
}

/*
	Name: function_ebf730ee
	Namespace: namespace_514c8ebc
	Checksum: 0x59847303
	Offset: 0x20F8
	Size: 0xC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_ebf730ee(entity)
{
}

/*
	Name: function_3839537e
	Namespace: namespace_514c8ebc
	Checksum: 0x406C161E
	Offset: 0x2110
	Size: 0xC
	Parameters: 1
	Flags: Private
*/
function private function_3839537e(entity)
{
}

/*
	Name: function_75db4aba
	Namespace: namespace_514c8ebc
	Checksum: 0xE98737B8
	Offset: 0x2128
	Size: 0xD0
	Parameters: 1
	Flags: Linked, Private
*/
function private function_75db4aba(entity)
{
	var_98c55679 = 0;
	var_a4017acd = 0.1 * entity.maxhealth;
	if(isdefined(entity.shielddamage))
	{
		if(entity.shielddamage > var_a4017acd)
		{
			var_98c55679 = 1;
		}
	}
	if(!var_98c55679)
	{
		return false;
	}
	if(function_697a9b7f(entity, 300, 1200) && function_180db9a7(entity) && function_d4f5b993(entity, "geg_shield_attack"))
	{
		return true;
	}
	return false;
}

/*
	Name: function_3133f922
	Namespace: namespace_514c8ebc
	Checksum: 0xCF615BBD
	Offset: 0x2200
	Size: 0x2A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_3133f922(entity)
{
	entity.var_7b0667d9 = 1;
	entity.locked_enemy = entity.favoriteenemy;
}

/*
	Name: function_d82de95f
	Namespace: namespace_514c8ebc
	Checksum: 0xC58F594E
	Offset: 0x2238
	Size: 0x372
	Parameters: 1
	Flags: Linked, Private
*/
function private function_d82de95f(entity)
{
	var_d7c9d429 = spawnstruct();
	var_d7c9d429.favoriteenemy = entity.locked_enemy;
	blackboard::addblackboardevent("geg_shield_attack", var_d7c9d429, randomintrange(2000, 3000));
	entity notify(#"hash_10501c0a873461f9");
	entity clientfield::increment("gegenees_shield_blast_effect");
	if(isdefined(entity.locked_enemy))
	{
		hit_enemy = 1;
		blast_origin = entity gettagorigin("j_gegenees_shield");
		forward_angles = anglestoforward(entity.angles);
		if(isdefined(blast_origin) && isdefined(forward_angles))
		{
			end_pos = blast_origin + (forward_angles * 1200);
			test_origin = entity.locked_enemy getcentroid();
			radial_origin = pointonsegmentnearesttopoint(blast_origin, end_pos, test_origin);
			var_caf24228 = distancesquared(test_origin, radial_origin);
			if(var_caf24228 > 4096)
			{
				hit_enemy = 0;
			}
			hit_enemy = bullettracepassed(blast_origin, test_origin, 0, undefined);
			if(hit_enemy)
			{
				player = entity.locked_enemy;
				if(isplayer(player))
				{
					player status_effect::status_effect_apply(function_4d1e7b48(#"hash_706608d269d2fefc"), undefined, entity, undefined, 2000);
					player thread function_60164697();
					player clientfield::increment_to_player("gegenees_damage_cf");
					if(level.doa.world_state != 0)
					{
						player dodamage(75, player.origin);
					}
					vec = ((vectornormalize(player.origin - entity.origin)) * 1500) + vectorscale((0, 0, 1), 100);
					player setvelocity(vec);
					player playrumbleonentity("zombietron_booster_rumble");
				}
				else
				{
					player dodamage(1500, player.origin);
				}
			}
		}
	}
	entity.shielddamage = 0;
	entity.locked_enemy = undefined;
}

/*
	Name: function_60164697
	Namespace: namespace_514c8ebc
	Checksum: 0x695B439E
	Offset: 0x25B8
	Size: 0x76
	Parameters: 0
	Flags: Linked, Private
*/
function private function_60164697()
{
	self endon(#"death", #"disconnect");
	time = gettime() + 2000;
	while(true)
	{
		if(gettime() > time)
		{
			break;
		}
		self playrumbleonentity("damage_heavy");
		waitframe(1);
	}
}

/*
	Name: function_564b9cf5
	Namespace: namespace_514c8ebc
	Checksum: 0x3CBE00CE
	Offset: 0x2638
	Size: 0x16
	Parameters: 1
	Flags: Linked, Private
*/
function private function_564b9cf5(entity)
{
	entity.var_7b0667d9 = 0;
}

/*
	Name: function_2301c0a7
	Namespace: namespace_514c8ebc
	Checksum: 0x32097A93
	Offset: 0x2658
	Size: 0xF0
	Parameters: 2
	Flags: Linked, Private
*/
function private function_2301c0a7(entity, asmstatename)
{
	entity.track_enemy = 1;
	entity.var_1ec6ea5d = gettime() + (int(entity ai::function_9139c839().var_3422adfd * 1000));
	entity.var_292d3a3b = gettime() + (int(entity ai::function_9139c839().var_5d9f2696 * 1000));
	entity clientfield::set("gegenees_shield_guard_effect", 1);
	/#
		entity.var_89b5e1e = 0;
	#/
	animationstatenetworkutility::requeststate(entity, asmstatename);
	return 5;
}

/*
	Name: function_c2155e05
	Namespace: namespace_514c8ebc
	Checksum: 0xF7DFDFCF
	Offset: 0x2750
	Size: 0x7C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_c2155e05(entity, asmstatename)
{
	if(is_true(asmstatename.track_enemy))
	{
		if(isdefined(asmstatename.var_292d3a3b))
		{
			if(gettime() > asmstatename.var_292d3a3b)
			{
				asmstatename.track_enemy = 0;
			}
		}
	}
	if(isdefined(asmstatename.var_1ec6ea5d))
	{
		if(gettime() < asmstatename.var_1ec6ea5d)
		{
			return 5;
		}
	}
	return 4;
}

/*
	Name: function_15502a5
	Namespace: namespace_514c8ebc
	Checksum: 0xC65E8DCA
	Offset: 0x27D8
	Size: 0x38
	Parameters: 2
	Flags: Linked, Private
*/
function private function_15502a5(entity, asmstatename)
{
	asmstatename clientfield::set("gegenees_shield_guard_effect", 0);
	return 4;
}

/*
	Name: function_7505908b
	Namespace: namespace_514c8ebc
	Checksum: 0x49DEE5C1
	Offset: 0x2818
	Size: 0x5A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_7505908b(entity)
{
	entity.var_7b0667d9 = 1;
	entity clientfield::set("gegenees_spear_tip_tell_effect", 1);
	entity.tell_fx = 1;
	entity.tell_off = gettime() + 250;
}

/*
	Name: function_9175e656
	Namespace: namespace_514c8ebc
	Checksum: 0x5CE0224A
	Offset: 0x2880
	Size: 0x64
	Parameters: 1
	Flags: Linked, Private
*/
function private function_9175e656(entity)
{
	if(is_true(entity.tell_fx))
	{
		if(gettime() > entity.tell_off)
		{
			entity.tell_fx = 0;
			entity clientfield::set("gegenees_spear_tip_tell_effect", 0);
		}
	}
}

/*
	Name: function_c81af561
	Namespace: namespace_514c8ebc
	Checksum: 0x517017C7
	Offset: 0x28F0
	Size: 0x16
	Parameters: 1
	Flags: Linked, Private
*/
function private function_c81af561(entity)
{
	entity.var_7b0667d9 = 0;
}

/*
	Name: function_d5d3aa77
	Namespace: namespace_514c8ebc
	Checksum: 0xFC3FB47
	Offset: 0x2910
	Size: 0x144
	Parameters: 1
	Flags: Linked, Private
*/
function private function_d5d3aa77(entity)
{
	enemy = entity.favoriteenemy;
	if(isdefined(enemy) && isalive(enemy))
	{
		if(entity.health / entity.maxhealth < 0.75)
		{
			entity setblackboardattribute("_locomotion_speed", "locomotion_speed_run");
		}
		else
		{
			dist_sq = distancesquared(entity.origin, enemy.origin);
			if(dist_sq > 302500)
			{
				entity setblackboardattribute("_locomotion_speed", "locomotion_speed_run");
			}
			if(dist_sq < 202500)
			{
				entity setblackboardattribute("_locomotion_speed", "locomotion_speed_walk");
			}
		}
	}
	else
	{
		entity setblackboardattribute("_locomotion_speed", "locomotion_speed_walk");
	}
}

/*
	Name: function_4334cc3b
	Namespace: namespace_514c8ebc
	Checksum: 0xE71F40AF
	Offset: 0x2A60
	Size: 0x7C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_4334cc3b(entity)
{
	if(!isdefined(self.var_c63e2811))
	{
		self.var_c63e2811 = 0;
	}
	if(self.var_c63e2811 > gettime())
	{
		self setblackboardattribute("_gegenees_shield", "shield_up");
	}
	else
	{
		self setblackboardattribute("_gegenees_shield", "shield_down");
	}
}

/*
	Name: function_a953d80d
	Namespace: namespace_514c8ebc
	Checksum: 0x18A2EB63
	Offset: 0x2AE8
	Size: 0xF6
	Parameters: 1
	Flags: Linked, Private
*/
function private function_a953d80d(entity)
{
	var_a5a1f99c = getaiarchetypearray(#"zombie");
	var_a5a1f99c = array::filter(var_a5a1f99c, 0, &function_3d752709, entity);
	foreach(zombie in var_a5a1f99c)
	{
		zombie namespace_250e9486::setup_zombie_knockdown(self);
		zombie.knockdown_type = "knockdown_shoved";
	}
}

/*
	Name: function_3d752709
	Namespace: namespace_514c8ebc
	Checksum: 0xD9B3EE20
	Offset: 0x2BE8
	Size: 0x188
	Parameters: 2
	Flags: Linked, Private
*/
function private function_3d752709(enemy, target)
{
	if(is_true(enemy.knockdown))
	{
		return false;
	}
	if(gibserverutils::isgibbed(enemy, 384))
	{
		return false;
	}
	if(distancesquared(enemy.origin, target.origin) > sqr(self ai::function_9139c839().var_ef908ac8))
	{
		return false;
	}
	var_f2fb414f = anglestoforward(target.angles);
	var_9349139f = enemy.origin - target.origin;
	var_3e3c8075 = (var_9349139f[0], var_9349139f[1], 0);
	var_c2ee8451 = (var_f2fb414f[0], var_f2fb414f[1], 0);
	var_3e3c8075 = vectornormalize(var_3e3c8075);
	var_c2ee8451 = vectornormalize(var_c2ee8451);
	var_34e02165 = vectordot(var_c2ee8451, var_3e3c8075);
	if(var_34e02165 < 0)
	{
		return false;
	}
	return true;
}

/*
	Name: function_d645d2ec
	Namespace: namespace_514c8ebc
	Checksum: 0x58671D94
	Offset: 0x2D78
	Size: 0xC4
	Parameters: 5
	Flags: Linked
*/
function function_d645d2ec(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	if(isdefined(mocompduration.locked_enemy))
	{
		to_enemy = mocompduration.locked_enemy.origin - mocompduration.origin;
		angles_to_enemy = vectortoangles(to_enemy);
		mocompduration orientmode("face angle", angles_to_enemy);
	}
	else
	{
		mocompduration orientmode("face current");
	}
}

/*
	Name: function_f6bb8a07
	Namespace: namespace_514c8ebc
	Checksum: 0xCCD46D38
	Offset: 0x2E48
	Size: 0xDC
	Parameters: 5
	Flags: Linked
*/
function function_f6bb8a07(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	if(is_true(mocompduration.track_enemy))
	{
		if(isdefined(mocompduration.locked_enemy))
		{
			to_enemy = mocompduration.locked_enemy.origin - mocompduration.origin;
			angles_to_enemy = vectortoangles(to_enemy);
			mocompduration orientmode("face angle", angles_to_enemy);
		}
		return;
	}
	mocompduration orientmode("face current");
}

/*
	Name: function_64c4573
	Namespace: namespace_514c8ebc
	Checksum: 0x626CA76E
	Offset: 0x2F30
	Size: 0x4C
	Parameters: 5
	Flags: Linked
*/
function function_64c4573(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	mocompduration orientmode("face default");
}

/*
	Name: function_c3c86ec1
	Namespace: namespace_514c8ebc
	Checksum: 0x680BB31A
	Offset: 0x2F88
	Size: 0x104
	Parameters: 1
	Flags: Linked, Private
*/
function private function_c3c86ec1(entity)
{
	hitent = entity melee();
	/#
		record3dtext("", self.origin, (1, 0, 0), "", entity);
	#/
	if(isdefined(hitent))
	{
		if(isplayer(hitent))
		{
			entity function_376a5549(hitent);
			hitent clientfield::increment_to_player("gegenees_damage_cf");
		}
		else if(!is_true(hitent.boss))
		{
			hitent dodamage(1000, hitent.origin);
		}
	}
}

/*
	Name: function_376a5549
	Namespace: namespace_514c8ebc
	Checksum: 0x7277D321
	Offset: 0x3098
	Size: 0xA4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_376a5549(enemy)
{
	forward = anglestoforward(self.angles);
	velocity = enemy getvelocity();
	var_886d7387 = 500;
	var_886d7387 = 200 + (randomint(var_886d7387 - 200));
	enemy setvelocity(velocity + (forward * var_886d7387));
}

/*
	Name: function_59e9f77b
	Namespace: namespace_514c8ebc
	Checksum: 0x2C693ABE
	Offset: 0x3148
	Size: 0x76
	Parameters: 0
	Flags: Linked
*/
function function_59e9f77b()
{
	if(is_true(self.var_cc7959e1))
	{
		self clientfield::set("gegenees_spear_tip_effect", 0);
		var_1a3b2274 = "c_t8_zmb_dlc2_gegenees_spear";
		self detach(var_1a3b2274, "tag_inhand");
		self.var_cc7959e1 = 0;
	}
}

/*
	Name: function_d06af584
	Namespace: namespace_514c8ebc
	Checksum: 0x74FE697F
	Offset: 0x31C8
	Size: 0x84
	Parameters: 0
	Flags: Linked
*/
function function_d06af584()
{
	if(!is_true(self.var_cc7959e1))
	{
		var_1a3b2274 = "c_t8_zmb_dlc2_gegenees_spear";
		self attach(var_1a3b2274, "tag_inhand");
		self.var_cc7959e1 = 1;
		self clientfield::set("gegenees_spear_tip_effect", 1);
	}
}

/*
	Name: function_ca5688e3
	Namespace: namespace_514c8ebc
	Checksum: 0x55533D10
	Offset: 0x3258
	Size: 0x5A8
	Parameters: 13
	Flags: Linked, Private
*/
function private function_ca5688e3(inflictor, attacker, damage, idflags, meansofdeath, weapon, var_fd90b0bb, point, dir, hitloc, offsettime, boneindex, modelindex)
{
	if(isdefined(boneindex))
	{
		bonename = getpartname(self, boneindex);
		if(bonename === "j_gegenees_shield")
		{
			if(isdefined(dir) && isdefined(point))
			{
				playfx("impacts/fx8_bul_impact_metal_sm", point, dir * -1, (0, 0, 1));
				if(isdefined(point))
				{
					playsoundatposition(#"hash_72db6f3f0e602a33", point);
				}
			}
			self namespace_ec06fe4a::function_2f4b0f9(self.health);
			return 0;
		}
	}
	var_786d7e06 = namespace_250e9486::function_422fdfd4(self, attacker, weapon, boneindex, hitloc, point);
	var_dd54fdb1 = var_786d7e06.var_84ed9a13;
	var_88e794fb = var_786d7e06.registerzombie_bgb_used_reinforce;
	level.var_d7e2833c = var_786d7e06.damage_scale > 1;
	adjusted_damage = int(damage * var_786d7e06.damage_scale);
	if(isdefined(var_dd54fdb1))
	{
		if(isdefined(var_dd54fdb1.var_8223b0cf) && var_dd54fdb1.var_8223b0cf > 0)
		{
			level.var_d7e2833c = var_786d7e06.damage_scale > 1 || var_dd54fdb1.var_8223b0cf > 1;
			adjusted_damage = int((damage * var_786d7e06.damage_scale) * var_dd54fdb1.var_8223b0cf);
		}
		if(var_88e794fb)
		{
			namespace_81245006::function_ef87b7e8(var_dd54fdb1, adjusted_damage);
			if(namespace_81245006::function_f29756fe(var_dd54fdb1) === 3)
			{
				self destructserverutils::handledamage(inflictor, attacker, damage, idflags, meansofdeath, weapon, var_fd90b0bb, point, dir, hitloc, offsettime, boneindex, modelindex);
				if(var_dd54fdb1.hitloc === "helmet")
				{
					var_465efe42 = namespace_81245006::function_37e3f011(self, "j_head", 2);
					namespace_81245006::function_6c64ebd3(var_465efe42, 1);
					self.var_d64b7af0 = 1;
					if(self isattached("c_t8_zmb_dlc2_gegenees_helmet1", "j_head"))
					{
						self detach("c_t8_zmb_dlc2_gegenees_helmet1", "j_head");
					}
					self clientfield::set("gegenees_helmet_explosion_cf", 1);
				}
				if(is_true(var_dd54fdb1.var_641ce20e))
				{
					namespace_81245006::function_6742b846(self, var_dd54fdb1);
				}
			}
			if(var_dd54fdb1.type === #"armor")
			{
				attacker util::show_hit_marker(!isalive(self));
				if(isdefined(dir) && isdefined(point))
				{
					playfx("impacts/fx8_bul_impact_metal_sm", point, dir * -1);
				}
				self namespace_ec06fe4a::function_2f4b0f9(self.health);
				return 0;
			}
			if(is_true(var_dd54fdb1.var_e37acc23))
			{
				if(isdefined(dir) && isdefined(point))
				{
					playfx("zm_ai/fx8_gegenees_weakpoint_impact", point, dir * -1);
				}
			}
		}
	}
	if(!isdefined(self.shielddamage))
	{
		self.shielddamage = adjusted_damage;
	}
	else
	{
		self.shielddamage = self.shielddamage + adjusted_damage;
	}
	self.var_a9716e54 = self.var_a9716e54 + adjusted_damage;
	if(self.var_a9716e54 >= 500)
	{
		self.var_a9716e54 = 0;
		self function_9a05389e();
	}
	var_799e18e5 = point;
	var_5f32808d = 1;
	if(adjusted_damage >= 1000)
	{
		var_5f32808d = 2;
	}
	self namespace_ec06fe4a::function_2f4b0f9(self.health, attacker, var_799e18e5, adjusted_damage, var_5f32808d);
	return adjusted_damage;
}

/*
	Name: function_a231dd3b
	Namespace: namespace_514c8ebc
	Checksum: 0x48347459
	Offset: 0x3808
	Size: 0x5C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_a231dd3b(s_params)
{
	if(!isdefined(self) || self.archetype !== #"gegenees")
	{
		return;
	}
	self val::set(#"gegenees_death", "takedamage", 0);
}

/*
	Name: function_9a05389e
	Namespace: namespace_514c8ebc
	Checksum: 0xBA605DC1
	Offset: 0x3870
	Size: 0x16
	Parameters: 0
	Flags: Linked
*/
function function_9a05389e()
{
	self.var_c63e2811 = gettime() + 4000;
}

