#using script_47851dbeea22fe66;
#using script_3faf478d5b0850fe;
#using script_2a5bf5b4a00cee0d;
#using script_164a456ce05c3483;
#using script_1ee011cd0961afd7;
#using script_5f20d3b434d24884;
#using script_5701633066d199f2;
#using script_1b01e95a6b5270fd;
#using script_17dcb1172e441bf6;
#using scripts\core_common\status_effects\status_effect_util.gsc;
#using script_35598499769dbb3d;
#using script_71dfbfdfba4489a0;
#using script_2c5daa95f8fec03c;
#using script_522aeb6ae906391e;
#using script_3aa0f32b70d4f7cb;
#using script_178024232e91b0a1;
#using script_caf007e2a98afa2;
#using script_4d85e8de54b02198;
#using script_4bf952f6ba31bb17;
#using script_59f07c660e6710a5;
#using script_7b7ed6e4bc963a51;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\ai\zombie.gsc;
#using scripts\core_common\ai\archetype_mocomps_utility.gsc;
#using script_489b835a247c990e;
#using script_3819e7a1427df6d2;
#using scripts\core_common\ai\archetype_utility.gsc;
#using script_556e19065f09f8a2;
#using script_41fe08c37d53a635;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\fx_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\aat_shared.gsc;

#namespace namespace_146875e;

/*
	Name: function_988cdf4a
	Namespace: namespace_146875e
	Checksum: 0x6B64043A
	Offset: 0x810
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_988cdf4a()
{
	level notify(2114524964);
}

/*
	Name: init
	Namespace: namespace_146875e
	Checksum: 0xDDFE583D
	Offset: 0x830
	Size: 0x154
	Parameters: 0
	Flags: Linked
*/
function init()
{
	level.doa.var_48af1fc9 = 0;
	namespace_250e9486::function_252dff4d("gladiator_destroyer", 6, &function_5af2c5ef, undefined, 5, &function_adb41cc7);
	namespace_250e9486::function_252dff4d("gladiator_marauder", 7, &function_5af2c5ef, undefined, 5, &function_adb41cc7);
	registerbehaviorscriptfunctions();
	registergladiatorinterfaceattributes();
	clientfield::register("toplayer", "gladiator_melee_effect", 1, 1, "counter");
	clientfield::register("actor", "gladiator_arm_effect", 1, 2, "int");
	animationstatenetwork::registernotetrackhandlerfunction("dropgun_left", &detachleft);
	animationstatenetwork::registernotetrackhandlerfunction("dropgun_right", &detachright);
}

/*
	Name: registergladiatorinterfaceattributes
	Namespace: namespace_146875e
	Checksum: 0xFBC0765E
	Offset: 0x990
	Size: 0xD4
	Parameters: 0
	Flags: Linked
*/
function registergladiatorinterfaceattributes()
{
	ai::registermatchedinterface(#"gladiator", #"run", 0, array(1, 0));
	ai::registermatchedinterface(#"gladiator", #"axe_throw", 1, array(1, 0));
	ai::registernumericinterface(#"gladiator", #"damage_multiplier", 1, 0, 100);
}

/*
	Name: detachleft
	Namespace: namespace_146875e
	Checksum: 0x5C0B8F5E
	Offset: 0xA70
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function detachleft(entity)
{
	if(is_true(self.var_fe593357))
	{
		destructserverutils::function_9885f550(entity, "left_hand", "tag_weapon_left");
	}
}

/*
	Name: detachright
	Namespace: namespace_146875e
	Checksum: 0x2D70526A
	Offset: 0xAC8
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function detachright(entity)
{
	if(is_true(self.var_88d88318))
	{
		destructserverutils::function_9885f550(entity, "right_hand", "tag_weapon_right");
	}
}

/*
	Name: registerbehaviorscriptfunctions
	Namespace: namespace_146875e
	Checksum: 0x9EB17B51
	Offset: 0xB20
	Size: 0xDEC
	Parameters: 0
	Flags: Linked
*/
function registerbehaviorscriptfunctions()
{
	/#
		assert(isscriptfunctionptr(&gladiatortargetservice));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"gladiatortargetservice", &gladiatortargetservice);
	/#
		assert(isscriptfunctionptr(&function_4f73587a));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_2f31066d04316712", &function_4f73587a);
	/#
		assert(isscriptfunctionptr(&function_4660925e));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_19f5dddb53541f2f", &function_4660925e);
	/#
		assert(isscriptfunctionptr(&function_edd0777f));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_3d538371b59fc4ce", &function_edd0777f);
	/#
		assert(isscriptfunctionptr(&function_154454e8));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_205614b8bf4014e6", &function_154454e8);
	/#
		assert(isscriptfunctionptr(&function_154454e8));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_205614b8bf4014e6", &function_154454e8);
	/#
		assert(isscriptfunctionptr(&function_2b6f49c8));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_48c3fc4eec7605", &function_2b6f49c8);
	/#
		assert(isscriptfunctionptr(&function_2b6f49c8));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_48c3fc4eec7605", &function_2b6f49c8);
	/#
		assert(isscriptfunctionptr(&function_d2ab62ae));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_4aefcc750ed27716", &function_d2ab62ae);
	/#
		assert(isscriptfunctionptr(&function_a3329afd));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_1e62e0f93339aad3", &function_a3329afd);
	/#
		assert(isscriptfunctionptr(&function_13f886a2));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_4038d6d7b731c1de", &function_13f886a2);
	/#
		assert(isscriptfunctionptr(&function_61e7d5f5));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_1d96f193711e7602", &function_61e7d5f5);
	/#
		assert(isscriptfunctionptr(&function_6bbfa1a0));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_753bdf09b9b21d9a", &function_6bbfa1a0);
	/#
		assert(isscriptfunctionptr(&function_dd674e3c));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_649ab6146cce9955", &function_dd674e3c);
	/#
		assert(isscriptfunctionptr(&function_7468904d));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_19966227fe912af8", &function_7468904d);
	/#
		assert(isscriptfunctionptr(&gladiatorshouldreact));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"gladiatorshouldreact", &gladiatorshouldreact);
	/#
		assert(isscriptfunctionptr(&function_c1b97472));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_5934d511f3d43e76", &function_c1b97472);
	/#
		assert(isscriptfunctionptr(&function_fe0ecd9f));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_7114ad7e891644ce", &function_fe0ecd9f);
	/#
		assert(isscriptfunctionptr(&gladiatorpickaxe));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"gladiatorpickaxe", &gladiatorpickaxe);
	/#
		assert(isscriptfunctionptr(&gladiatorpickaxe));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"gladiatorpickaxe", &gladiatorpickaxe);
	/#
		assert(isscriptfunctionptr(&function_7891bd9b));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_2ec3db12905e5ef2", &function_7891bd9b);
	/#
		assert(isscriptfunctionptr(&function_490a290d));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_324b5266aa732357", &function_490a290d);
	/#
		assert(isscriptfunctionptr(&function_6719445a));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_7a99cf7ed75b85d4", &function_6719445a);
	/#
		assert(isscriptfunctionptr(&function_fced00e1));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_84d084fea1afb67", &function_fced00e1);
	/#
		assert(isscriptfunctionptr(&function_3963581d));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_72578a0bdaf6cabc", &function_3963581d);
	/#
		assert(isscriptfunctionptr(&function_dfbf9d5e));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_1c6cfcf6fdb404ff", &function_dfbf9d5e);
	/#
		assert(isscriptfunctionptr(&function_8d49edfa));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_50e5d4b2634f5877", &function_8d49edfa);
	/#
		assert(isscriptfunctionptr(&function_990c9627));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_52aa25564f02b9a1", &function_990c9627);
	/#
		assert(isscriptfunctionptr(&function_6ba071ff));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_2d6fdeb321d8ce80", &function_6ba071ff);
	/#
		assert(isscriptfunctionptr(&function_3ca98f5a));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_7ed731cb43b72ab7", &function_3ca98f5a);
	/#
		assert(isscriptfunctionptr(&function_e217245a));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_51d4a260f5e68d32", &function_e217245a);
	animationstatenetwork::registeranimationmocomp("mocomp_gladiator_leap", &registerhud_message_electricity_, &function_3f15e557, &function_96f1cbf6);
	animationstatenetwork::registeranimationmocomp("mocomp_gladiator_throw", &function_3137174f, &function_64cd870, &function_d9e4ebc8);
	animationstatenetwork::registeranimationmocomp("mocomp_gladiator_run_melee", &function_37d33f09, &function_3f7c46a, &function_2bc1ffb8);
	animationstatenetwork::registernotetrackhandlerfunction("gladiator_melee", &function_cdef55f0);
	animationstatenetwork::registernotetrackhandlerfunction("axe_throw_start", &function_f3c02dbf);
	animationstatenetwork::registernotetrackhandlerfunction("axe_reload", &function_14ff2d78);
}

/*
	Name: gladiatortargetservice
	Namespace: namespace_146875e
	Checksum: 0xA3E5FB68
	Offset: 0x1918
	Size: 0x3D6
	Parameters: 1
	Flags: Linked, Private
*/
function private gladiatortargetservice(entity)
{
	if(!isdefined(entity))
	{
		return;
	}
	if(!is_true(entity.hasseenfavoriteenemy))
	{
		if(isdefined(entity.favoriteenemy) && entity cansee(entity.favoriteenemy) || isdefined(entity.var_cb89528d))
		{
			entity.var_cb89528d = undefined;
			entity.hasseenfavoriteenemy = 1;
			entity.var_908a5d30 = 1;
			if(entity.var_9fde8624 == #"gladiator_destroyer")
			{
				entity setblackboardattribute("_gladiator_react", "idle");
				if(entity haspath())
				{
					entity setblackboardattribute("_gladiator_react", "walk");
				}
			}
			else
			{
				if(!isdefined(entity.favoriteenemy))
				{
					return;
				}
				/#
					assert(isdefined(entity.favoriteenemy.origin), (("" + (isdefined(entity.favoriteenemy.birthtime) ? entity.favoriteenemy.birthtime : "")) + "") + entity.favoriteenemy getentitynumber());
				#/
				to_enemy = entity.favoriteenemy.origin - entity.origin;
				to_enemy = (to_enemy[0], to_enemy[1], 0);
				var_2ddabcd3 = anglestoforward(entity.angles);
				var_2ddabcd3 = (var_2ddabcd3[0], var_2ddabcd3[1], 0);
				gladiator_right = anglestoright(entity.angles);
				gladiator_right = (gladiator_right[0], gladiator_right[1], 0);
				dot_forward = vectordot(var_2ddabcd3, to_enemy);
				dot_right = vectordot(gladiator_right, to_enemy);
				if(abs(dot_forward) > abs(dot_right))
				{
					dot = dot_forward;
					directions = array("front", "back");
				}
				else
				{
					dot = dot_right;
					directions = array("right", "left");
				}
				if(dot >= 0)
				{
					entity setblackboardattribute("_gladiator_react", directions[0]);
				}
				else
				{
					entity setblackboardattribute("_gladiator_react", directions[1]);
				}
			}
			if(entity.var_9fde8624 == #"gladiator_marauder")
			{
				entity ai::set_behavior_attribute("run", 1);
			}
		}
	}
	return false;
}

/*
	Name: function_4f73587a
	Namespace: namespace_146875e
	Checksum: 0x1EE34E66
	Offset: 0x1CF8
	Size: 0x194
	Parameters: 1
	Flags: Linked, Private
*/
function private function_4f73587a(entity)
{
	enemy = entity.favoriteenemy;
	if(entity ai::has_behavior_attribute("run"))
	{
		if(entity ai::get_behavior_attribute("run"))
		{
			entity setblackboardattribute("_locomotion_speed", "locomotion_speed_run");
			return true;
		}
	}
	if(!is_true(entity.hasseenfavoriteenemy))
	{
		entity setblackboardattribute("_locomotion_speed", "locomotion_speed_walk");
		return false;
	}
	if(isdefined(enemy) && isalive(enemy))
	{
		dist_sq = distancesquared(entity.origin, enemy.origin);
		if(dist_sq > 360000)
		{
			entity setblackboardattribute("_locomotion_speed", "locomotion_speed_run");
			return true;
		}
		if(dist_sq < 160000)
		{
			entity setblackboardattribute("_locomotion_speed", "locomotion_speed_walk");
			return true;
		}
	}
	return false;
}

/*
	Name: function_4660925e
	Namespace: namespace_146875e
	Checksum: 0xDBBA394B
	Offset: 0x1E98
	Size: 0x30
	Parameters: 1
	Flags: Linked, Private
*/
function private function_4660925e(entity)
{
	if(entity.var_9fde8624 == #"gladiator_destroyer")
	{
		return true;
	}
	return false;
}

/*
	Name: gladiatorpickaxe
	Namespace: namespace_146875e
	Checksum: 0xA476E64A
	Offset: 0x1ED0
	Size: 0x42
	Parameters: 1
	Flags: Linked, Private
*/
function private gladiatorpickaxe(entity)
{
	if(math::cointoss())
	{
		entity.var_34cc44de = "left";
	}
	else
	{
		entity.var_34cc44de = "right";
	}
}

/*
	Name: function_104b8cc1
	Namespace: namespace_146875e
	Checksum: 0x6B4EB961
	Offset: 0x1F20
	Size: 0x16
	Parameters: 0
	Flags: Linked, Private
*/
function private function_104b8cc1()
{
	self.var_844453ff = gettime() + 3000;
}

/*
	Name: function_d1242576
	Namespace: namespace_146875e
	Checksum: 0x560E0D3
	Offset: 0x1F40
	Size: 0x16
	Parameters: 0
	Flags: Linked, Private
*/
function private function_d1242576()
{
	self.next_leap_time = gettime() + 3000;
}

/*
	Name: function_edd0777f
	Namespace: namespace_146875e
	Checksum: 0x899E12EA
	Offset: 0x1F60
	Size: 0x20E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_edd0777f(entity)
{
	if(!entity ai::get_behavior_attribute("axe_throw"))
	{
		return false;
	}
	if(!isdefined(entity.favoriteenemy) || !isdefined(entity.favoriteenemy.origin))
	{
		return false;
	}
	if(isdefined(entity.favoriteenemy.birthtime) && gettime() < (entity.favoriteenemy.birthtime + 1000))
	{
		return false;
	}
	if(entity.var_9fde8624 != #"gladiator_destroyer")
	{
		return false;
	}
	if(!entity.has_left_arm || !entity.has_right_arm)
	{
		return false;
	}
	if(entity.var_ba481973)
	{
		return false;
	}
	if(gettime() < entity.var_844453ff)
	{
		return false;
	}
	dist_sq = distancesquared(entity.origin, entity.favoriteenemy.origin);
	if(dist_sq < 57600)
	{
		return false;
	}
	if(dist_sq > 360000)
	{
		return false;
	}
	yaw = abs(namespace_ec06fe4a::getyawtoenemy());
	if(yaw > 22.5)
	{
		return false;
	}
	can_see = bullettracepassed(entity.origin + vectorscale((0, 0, 1), 36), entity.favoriteenemy.origin + vectorscale((0, 0, 1), 36), 0, undefined);
	if(!can_see)
	{
		return false;
	}
	return true;
}

/*
	Name: function_f7d9bc34
	Namespace: namespace_146875e
	Checksum: 0x2D872EB6
	Offset: 0x2178
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
	Name: function_154454e8
	Namespace: namespace_146875e
	Checksum: 0xDD3050D6
	Offset: 0x21E8
	Size: 0x28
	Parameters: 1
	Flags: Linked, Private
*/
function private function_154454e8(entity)
{
	if(self.var_34cc44de === "left")
	{
		return true;
	}
	return false;
}

/*
	Name: function_2b6f49c8
	Namespace: namespace_146875e
	Checksum: 0x2697B0D7
	Offset: 0x2218
	Size: 0x28
	Parameters: 1
	Flags: Linked, Private
*/
function private function_2b6f49c8(entity)
{
	if(self.var_34cc44de === "right")
	{
		return true;
	}
	return false;
}

/*
	Name: function_a3329afd
	Namespace: namespace_146875e
	Checksum: 0x3C3B431
	Offset: 0x2248
	Size: 0x46
	Parameters: 1
	Flags: Linked, Private
*/
function private function_a3329afd(entity)
{
	if(self.var_34cc44de === "left")
	{
		if(is_true(self.var_d5e9528))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_d2ab62ae
	Namespace: namespace_146875e
	Checksum: 0x35E97381
	Offset: 0x2298
	Size: 0x46
	Parameters: 1
	Flags: Linked, Private
*/
function private function_d2ab62ae(entity)
{
	if(self.var_34cc44de === "right")
	{
		if(is_true(self.var_d5e9528))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_13f886a2
	Namespace: namespace_146875e
	Checksum: 0x61184DCF
	Offset: 0x22E8
	Size: 0x292
	Parameters: 1
	Flags: Linked
*/
function function_13f886a2(entity)
{
	if(entity.ignoreall)
	{
		return false;
	}
	if(!isdefined(entity.favoriteenemy))
	{
		return false;
	}
	if(!self.has_left_arm || !self.has_right_arm)
	{
		return false;
	}
	var_17c3916f = sqr(128);
	if(self.var_9fde8624 == #"gladiator_marauder")
	{
		if(gettime() < entity.next_leap_time)
		{
			return false;
		}
		enemy_dist_sq = distancesquared(entity.origin, entity.favoriteenemy.origin);
		if(enemy_dist_sq < sqr(128))
		{
			return false;
		}
		var_17c3916f = sqr(240);
		z_diff = abs(entity.origin[2] - entity.favoriteenemy.origin[2]);
		if(z_diff > 72)
		{
			return false;
		}
	}
	else if(self.var_9fde8624 == #"gladiator_destroyer")
	{
		z_diff = abs(entity.origin[2] - entity.favoriteenemy.origin[2]);
		if(z_diff > 48)
		{
			return false;
		}
	}
	if(distancesquared(entity.origin, entity.favoriteenemy.origin) > var_17c3916f)
	{
		return false;
	}
	yawtoenemy = angleclamp180(entity.angles[1] - (vectortoangles(entity.favoriteenemy.origin - entity.origin)[1]));
	if(abs(yawtoenemy) > 60)
	{
		return false;
	}
	return true;
}

/*
	Name: function_61e7d5f5
	Namespace: namespace_146875e
	Checksum: 0x479440DF
	Offset: 0x2588
	Size: 0x1D2
	Parameters: 1
	Flags: Linked
*/
function function_61e7d5f5(entity)
{
	if(!is_true(entity.completed_emerging_into_playable_area))
	{
		return false;
	}
	if(entity.ignoreall)
	{
		return false;
	}
	if(!isdefined(entity.favoriteenemy))
	{
		return false;
	}
	if(self.var_9fde8624 != #"gladiator_destroyer")
	{
		return false;
	}
	if(self.has_left_arm && self.has_right_arm)
	{
		return false;
	}
	var_ff38566a = lengthsquared(entity.favoriteenemy getvelocity());
	var_17c3916f = sqr(100);
	if(var_ff38566a < sqr(175))
	{
		var_17c3916f = sqr(190);
	}
	if(distancesquared(entity.origin, entity.favoriteenemy.origin) > var_17c3916f)
	{
		return false;
	}
	yawtoenemy = angleclamp180(entity.angles[1] - (vectortoangles(entity.favoriteenemy.origin - entity.origin)[1]));
	if(abs(yawtoenemy) > 60)
	{
		return false;
	}
	return true;
}

/*
	Name: function_7891bd9b
	Namespace: namespace_146875e
	Checksum: 0xFF9ADD40
	Offset: 0x2768
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_7891bd9b(entity)
{
	entity pathmode("dont move", 1);
}

/*
	Name: function_490a290d
	Namespace: namespace_146875e
	Checksum: 0xDD8789BE
	Offset: 0x27A0
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_490a290d(entity)
{
	entity pathmode("move allowed");
}

/*
	Name: function_8d49edfa
	Namespace: namespace_146875e
	Checksum: 0xD1C7D173
	Offset: 0x27D8
	Size: 0x2E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_8d49edfa(entity)
{
	if(is_true(entity.knockdown))
	{
		return false;
	}
	return true;
}

/*
	Name: function_6bbfa1a0
	Namespace: namespace_146875e
	Checksum: 0x6F1BF6B8
	Offset: 0x2810
	Size: 0x2E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_6bbfa1a0(entity)
{
	if(is_true(entity.var_9b959f19))
	{
		return true;
	}
	return false;
}

/*
	Name: function_dd674e3c
	Namespace: namespace_146875e
	Checksum: 0xBB391E69
	Offset: 0x2848
	Size: 0x50
	Parameters: 1
	Flags: Linked, Private
*/
function private function_dd674e3c(entity)
{
	locomotionspeed = entity getblackboardattribute("_locomotion_speed");
	if(locomotionspeed === "locomotion_speed_run")
	{
		return true;
	}
	return false;
}

/*
	Name: function_7468904d
	Namespace: namespace_146875e
	Checksum: 0x4F1F26E4
	Offset: 0x28A0
	Size: 0x58
	Parameters: 1
	Flags: Linked, Private
*/
function private function_7468904d(entity)
{
	if(entity getblackboardattribute("_locomotion_speed") === "locomotion_speed_run" && entity haspath())
	{
		return true;
	}
	return false;
}

/*
	Name: gladiatorshouldreact
	Namespace: namespace_146875e
	Checksum: 0x10ABF6EB
	Offset: 0x2900
	Size: 0x2E
	Parameters: 1
	Flags: Linked, Private
*/
function private gladiatorshouldreact(entity)
{
	if(is_true(entity.var_908a5d30))
	{
		return true;
	}
	return false;
}

/*
	Name: function_c1b97472
	Namespace: namespace_146875e
	Checksum: 0x9E5E8F6
	Offset: 0x2938
	Size: 0x24
	Parameters: 1
	Flags: Linked, Private
*/
function private function_c1b97472(entity)
{
	entity function_104b8cc1();
}

/*
	Name: function_fe0ecd9f
	Namespace: namespace_146875e
	Checksum: 0x826B753E
	Offset: 0x2968
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_fe0ecd9f(entity)
{
	entity.var_d5e9528 = 0;
	entity function_104b8cc1();
}

/*
	Name: function_6719445a
	Namespace: namespace_146875e
	Checksum: 0xDE2BF42F
	Offset: 0x29A0
	Size: 0x84
	Parameters: 1
	Flags: Linked, Private
*/
function private function_6719445a(entity)
{
	if(entity.var_9fde8624 == #"gladiator_marauder")
	{
		entity.var_5dd07a80 = 1;
		entity.var_c2986b66 = 1;
		entity function_d1242576();
		entity.var_b736fc8b = 1;
		entity pathmode("dont move", 1);
	}
}

/*
	Name: function_fced00e1
	Namespace: namespace_146875e
	Checksum: 0xE97A7000
	Offset: 0x2A30
	Size: 0x7C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_fced00e1(entity)
{
	if(entity.var_9fde8624 == #"gladiator_marauder")
	{
		entity.var_5dd07a80 = undefined;
		entity.var_c2986b66 = undefined;
		entity function_d1242576();
		entity.var_b736fc8b = 0;
		entity pathmode("move allowed");
	}
}

/*
	Name: function_3963581d
	Namespace: namespace_146875e
	Checksum: 0xECC2BC0A
	Offset: 0x2AB8
	Size: 0x42
	Parameters: 1
	Flags: Linked, Private
*/
function private function_3963581d(entity)
{
	if(entity.var_9fde8624 == #"gladiator_marauder")
	{
		entity.var_5dd07a80 = 1;
		entity.var_c2986b66 = 1;
	}
}

/*
	Name: function_dfbf9d5e
	Namespace: namespace_146875e
	Checksum: 0xD8D1F5AE
	Offset: 0x2B08
	Size: 0x3E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_dfbf9d5e(entity)
{
	if(entity.var_9fde8624 == #"gladiator_marauder")
	{
		entity.var_5dd07a80 = undefined;
		entity.var_c2986b66 = undefined;
	}
}

/*
	Name: function_990c9627
	Namespace: namespace_146875e
	Checksum: 0x54D8577E
	Offset: 0x2B50
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_990c9627(entity)
{
	entity pathmode("dont move", 1);
}

/*
	Name: function_6ba071ff
	Namespace: namespace_146875e
	Checksum: 0x927380
	Offset: 0x2B88
	Size: 0x34
	Parameters: 1
	Flags: Linked, Private
*/
function private function_6ba071ff(entity)
{
	entity.var_9b959f19 = 0;
	entity pathmode("move allowed");
}

/*
	Name: function_3ca98f5a
	Namespace: namespace_146875e
	Checksum: 0x9786796C
	Offset: 0x2BC8
	Size: 0x56
	Parameters: 1
	Flags: Linked, Private
*/
function private function_3ca98f5a(entity)
{
	entity pathmode("dont move", 1);
	if(entity.var_9fde8624 == #"gladiator_marauder")
	{
		entity.var_4f1b8d2b = 1;
	}
}

/*
	Name: function_e217245a
	Namespace: namespace_146875e
	Checksum: 0x1D9C7701
	Offset: 0x2C28
	Size: 0x36
	Parameters: 1
	Flags: Linked, Private
*/
function private function_e217245a(entity)
{
	entity pathmode("move allowed");
	entity.var_908a5d30 = 0;
}

/*
	Name: function_85b2f76f
	Namespace: namespace_146875e
	Checksum: 0xA49B5F75
	Offset: 0x2C68
	Size: 0x3A
	Parameters: 0
	Flags: Linked
*/
function function_85b2f76f()
{
	var_cd8354e0 = spawnstruct();
	var_cd8354e0.adjustmentstarted = 0;
	var_cd8354e0.var_425c4c8b = 1;
	return var_cd8354e0;
}

/*
	Name: registerhud_message_electricity_
	Namespace: namespace_146875e
	Checksum: 0xD05B047C
	Offset: 0x2CB0
	Size: 0x264
	Parameters: 5
	Flags: Linked
*/
function registerhud_message_electricity_(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	mocompanimflag animmode("gravity", 1);
	mocompanimflag orientmode("face angle", mocompanimflag.angles[1]);
	mocompanimflag.blockingpain = 1;
	mocompanimflag.var_5dd07a80 = 1;
	mocompanimflag.var_c2986b66 = 1;
	mocompanimflag.usegoalanimweight = 1;
	mocompanimflag pathmode("dont move");
	mocompanimflag collidewithactors(0);
	if(isdefined(mocompanimflag.favoriteenemy))
	{
		dirtoenemy = vectornormalize(mocompanimflag.favoriteenemy.origin - mocompanimflag.origin);
		mocompanimflag forceteleport(mocompanimflag.origin, vectortoangles(dirtoenemy));
	}
	if(!isdefined(self.var_cd8354e0))
	{
		self.var_cd8354e0 = function_85b2f76f();
		self.var_cd8354e0.var_9bfa8497 = mocompanimflag.origin;
		self.var_cd8354e0.var_98bc84b7 = getnotetracktimes(mocompduration, "start_procedural")[0];
		self.var_cd8354e0.var_6392c3a2 = getnotetracktimes(mocompduration, "stop_procedural")[0];
		var_e397f54c = getmovedelta(mocompduration, 0, 1);
		self.var_cd8354e0.var_cb28f380 = mocompanimflag localtoworldcoords(var_e397f54c);
	}
	namespace_1e25ad94::debugmsg("mocompGladiatorLeapStart entNum:" + self getentitynumber());
}

/*
	Name: function_3f15e557
	Namespace: namespace_146875e
	Checksum: 0x55B75AF6
	Offset: 0x2F20
	Size: 0x734
	Parameters: 5
	Flags: Linked
*/
function function_3f15e557(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	if(self.health <= 0)
	{
		return;
	}
	/#
		assert(isdefined(self.var_cd8354e0));
	#/
	if(!isdefined(self.var_cd8354e0))
	{
		return;
	}
	var_e72a224a = mocompanimflag getanimtime(mocompduration);
	if(isdefined(self.favoriteenemy) && !self.var_cd8354e0.adjustmentstarted && self.var_cd8354e0.var_425c4c8b && var_e72a224a >= self.var_cd8354e0.var_98bc84b7)
	{
		predictedenemypos = mocompanimflag.favoriteenemy.origin;
		if(isplayer(mocompanimflag.favoriteenemy))
		{
			velocity = mocompanimflag.favoriteenemy getvelocity();
			if(length(velocity) >= 0)
			{
				predictedenemypos = predictedenemypos + vectorscale(velocity, 0.25);
			}
		}
		var_83fd29ee = vectornormalize(predictedenemypos - mocompanimflag.origin);
		var_1efb2395 = predictedenemypos - (var_83fd29ee * mocompanimflag getpathfindingradius());
		self.var_cd8354e0.adjustedendpos = var_1efb2395;
		var_776ddabf = distancesquared(self.var_cd8354e0.var_cb28f380, self.var_cd8354e0.adjustedendpos);
		var_65cbfb52 = distancesquared(self.var_cd8354e0.var_9bfa8497, self.var_cd8354e0.adjustedendpos);
		if(var_776ddabf <= sqr(20))
		{
			self.var_cd8354e0.var_425c4c8b = 0;
		}
		else
		{
			if(var_65cbfb52 <= sqr(90))
			{
				self.var_cd8354e0.var_425c4c8b = 0;
			}
			else if(var_65cbfb52 >= sqr(400))
			{
				self.var_cd8354e0.var_425c4c8b = 0;
			}
		}
		if(self.var_cd8354e0.var_425c4c8b)
		{
			var_776ddabf = distancesquared(self.var_cd8354e0.var_cb28f380, self.var_cd8354e0.adjustedendpos);
			var_beabc994 = anglestoforward(self.angles);
			var_1c3641f2 = (mocompanimflag.favoriteenemy.origin[0], mocompanimflag.favoriteenemy.origin[1], mocompanimflag.origin[2]);
			dirtoenemy = vectornormalize(var_1c3641f2 - mocompanimflag.origin);
			zdiff = self.var_cd8354e0.var_cb28f380[2] - mocompanimflag.favoriteenemy.origin[2];
			var_6738a702 = abs(zdiff) <= 45;
			withinfov = vectordot(var_beabc994, dirtoenemy) > cos(30);
			var_7948b2f3 = var_6738a702 && withinfov;
			isvisible = bullettracepassed(mocompanimflag.origin, mocompanimflag.favoriteenemy.origin, 0, self);
			var_425c4c8b = isvisible && var_7948b2f3;
			if(var_425c4c8b)
			{
				var_90c3cdd2 = length(self.var_cd8354e0.adjustedendpos - self.var_cd8354e0.var_cb28f380);
				timestep = function_60d95f53();
				animlength = getanimlength(mocompduration) * 1000;
				starttime = self.var_cd8354e0.var_98bc84b7 * animlength;
				stoptime = self.var_cd8354e0.var_6392c3a2 * animlength;
				starttime = floor(starttime / timestep);
				stoptime = floor(stoptime / timestep);
				adjustduration = stoptime - starttime;
				self.var_cd8354e0.var_10b8b6d1 = vectornormalize(self.var_cd8354e0.adjustedendpos - self.var_cd8354e0.var_cb28f380);
				self.var_cd8354e0.var_8b9a15a6 = var_90c3cdd2 / adjustduration;
				self.var_cd8354e0.var_425c4c8b = 1;
				self.var_cd8354e0.adjustmentstarted = 1;
			}
			else
			{
				self.var_cd8354e0.var_425c4c8b = 0;
			}
		}
	}
	if(self.var_cd8354e0.adjustmentstarted && var_e72a224a <= self.var_cd8354e0.var_6392c3a2)
	{
		/#
			assert(isdefined(self.var_cd8354e0.var_10b8b6d1) && isdefined(self.var_cd8354e0.var_8b9a15a6));
		#/
		adjustedorigin = mocompanimflag.origin + (mocompanimflag.var_cd8354e0.var_10b8b6d1 * self.var_cd8354e0.var_8b9a15a6);
		mocompanimflag forceteleport(adjustedorigin);
	}
}

/*
	Name: function_96f1cbf6
	Namespace: namespace_146875e
	Checksum: 0xE188B864
	Offset: 0x3660
	Size: 0xE6
	Parameters: 5
	Flags: Linked
*/
function function_96f1cbf6(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	namespace_1e25ad94::debugmsg("mocompGladiatorLeapEnd entNum:" + self getentitynumber());
	mocompduration.blockingpain = 0;
	mocompduration.var_5dd07a80 = undefined;
	mocompduration.var_c2986b66 = undefined;
	mocompduration.usegoalanimweight = 0;
	mocompduration pathmode("move allowed");
	mocompduration orientmode("face default");
	mocompduration collidewithactors(1);
	mocompduration.var_cd8354e0 = undefined;
}

/*
	Name: function_3137174f
	Namespace: namespace_146875e
	Checksum: 0xA4856675
	Offset: 0x3750
	Size: 0xBC
	Parameters: 5
	Flags: Linked
*/
function function_3137174f(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	if(isdefined(mocompduration.favoriteenemy))
	{
		to_enemy = vectornormalize(mocompduration.favoriteenemy.origin - mocompduration.origin);
		angles_to_enemy = vectortoangles(to_enemy);
		mocompduration orientmode("face angle", angles_to_enemy[1]);
	}
}

/*
	Name: function_64cd870
	Namespace: namespace_146875e
	Checksum: 0xB3B2FF7
	Offset: 0x3818
	Size: 0xD4
	Parameters: 5
	Flags: Linked
*/
function function_64cd870(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	if(isdefined(mocompduration.favoriteenemy))
	{
		if(!is_true(mocompduration.var_ba481973))
		{
			to_enemy = vectornormalize(mocompduration.favoriteenemy.origin - mocompduration.origin);
			angles_to_enemy = vectortoangles(to_enemy);
			mocompduration orientmode("face angle", angles_to_enemy[1]);
		}
	}
}

/*
	Name: function_d9e4ebc8
	Namespace: namespace_146875e
	Checksum: 0xC305AC0F
	Offset: 0x38F8
	Size: 0x2C
	Parameters: 5
	Flags: Linked
*/
function function_d9e4ebc8(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
}

/*
	Name: function_37d33f09
	Namespace: namespace_146875e
	Checksum: 0xB5FBB818
	Offset: 0x3930
	Size: 0x6C
	Parameters: 5
	Flags: Linked
*/
function function_37d33f09(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	mocompduration animmode("normal");
	mocompduration orientmode("face motion");
}

/*
	Name: function_3f7c46a
	Namespace: namespace_146875e
	Checksum: 0xD10A3C47
	Offset: 0x39A8
	Size: 0xBC
	Parameters: 5
	Flags: Linked
*/
function function_3f7c46a(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	if(isdefined(mocompduration.favoriteenemy))
	{
		if(distancesquared(mocompduration.origin, mocompduration.favoriteenemy.origin) <= sqr(50))
		{
			mocompduration animmode("angle deltas");
		}
		else
		{
			mocompduration animmode("normal");
		}
	}
}

/*
	Name: function_2bc1ffb8
	Namespace: namespace_146875e
	Checksum: 0xAD141F86
	Offset: 0x3A70
	Size: 0x4C
	Parameters: 5
	Flags: Linked
*/
function function_2bc1ffb8(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	mocompduration animmode("normal");
}

/*
	Name: function_cdef55f0
	Namespace: namespace_146875e
	Checksum: 0xFB334A
	Offset: 0x3AC8
	Size: 0xA4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_cdef55f0(entity)
{
	hitent = entity melee(anglestoforward(entity.angles));
	entity.var_4f1b8d2b = 0;
	if(isdefined(hitent) && isplayer(hitent) && hitent.birthtime !== gettime())
	{
		hitent clientfield::increment_to_player("gladiator_melee_effect");
	}
}

/*
	Name: function_f3c02dbf
	Namespace: namespace_146875e
	Checksum: 0x52DF0CDC
	Offset: 0x3B78
	Size: 0x5C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_f3c02dbf(entity)
{
	if(!isdefined(entity.favoriteenemy))
	{
		return;
	}
	entity function_5be18f96(0);
	entity function_8a8841b0(entity.favoriteenemy.origin);
}

/*
	Name: function_14ff2d78
	Namespace: namespace_146875e
	Checksum: 0x739908D5
	Offset: 0x3BE0
	Size: 0x24
	Parameters: 1
	Flags: Linked, Private
*/
function private function_14ff2d78(entity)
{
	entity function_5be18f96();
}

/*
	Name: function_894d3d57
	Namespace: namespace_146875e
	Checksum: 0x378BD822
	Offset: 0x3C10
	Size: 0x2C4
	Parameters: 1
	Flags: Private
*/
function private function_894d3d57(entity)
{
	if(!isdefined(entity))
	{
		return;
	}
	if(!isdefined(entity.damage_info) || !isdefined(entity.damage_info.hitloc))
	{
		return;
	}
	var_34cc44de = "right";
	hand = "right_hand";
	if(entity.damage_info.hitloc == "left_arm_lower")
	{
		var_34cc44de = "left";
		hand = "left_hand";
	}
	entity destructserverutils::handledamage(entity.damage_info.inflictor, entity.damage_info.attacker, entity.damage_info.damage, entity.damage_info.idflags, entity.damage_info.meansofdeath, entity.damage_info.weapon, entity.damage_info.var_fd90b0bb, entity.damage_info.point, entity.damage_info.dir, entity.damage_info.hitloc, entity.damage_info.offsettime, entity.damage_info.boneindex, entity.damage_info.modelindex);
	if(entity.var_ba481973 && entity.var_34cc44de == var_34cc44de)
	{
		if(isdefined(entity.axe_model))
		{
			entity notify(#"arm_destroyed");
			entity.axe_model delete();
		}
	}
	else
	{
		entity destructserverutils::handledamage(entity.damage_info.inflictor, entity.damage_info.attacker, entity.damage_info.damage, entity.damage_info.idflags, entity.damage_info.meansofdeath, entity.damage_info.weapon, entity.damage_info.var_fd90b0bb, entity.damage_info.point, entity.damage_info.dir, hand, entity.damage_info.offsettime, entity.damage_info.boneindex, entity.damage_info.modelindex);
	}
}

/*
	Name: function_adb41cc7
	Namespace: namespace_146875e
	Checksum: 0x13F5E9A8
	Offset: 0x3EE0
	Size: 0x11E
	Parameters: 0
	Flags: Linked
*/
function function_adb41cc7()
{
	max = (level.doa.world_state == 0 ? 10 : 20);
	total = level.doa.var_48af1fc9;
	foreach(item in level.doa.var_dcbded2)
	{
		type = [[ item.spawndef ]]->function_5ce4fb28();
		if(type == 6 || type == 7)
		{
			total = total + item.count;
		}
	}
	return total < max;
}

/*
	Name: function_5af2c5ef
	Namespace: namespace_146875e
	Checksum: 0x9167E8EA
	Offset: 0x4008
	Size: 0x3EC
	Parameters: 0
	Flags: Linked
*/
function function_5af2c5ef()
{
	level.doa.var_48af1fc9++;
	self namespace_250e9486::function_25b2c8a9();
	self.maxhealth = self.health + 13000;
	if(isdefined(level.doa.var_a77e6349))
	{
		self.maxhealth = self.maxhealth + 10000;
	}
	self.meleedistsq = 1764 * 2;
	self.health = self.maxhealth;
	self.no_gib = 1;
	self.no_ragdoll = 1;
	self.goalradius = 60;
	self.var_9a9a0311 = [];
	self.var_f46fbf3f = 1;
	self.closest_player_override = &namespace_7f5aeb59::function_7781556b;
	self.doa.var_74e4ded8 = 1;
	self setblackboardattribute("_locomotion_speed", "locomotion_speed_walk");
	self.zombie_move_speed = "walk";
	self collidewithactors(1);
	if(self.var_9fde8624 == #"gladiator_destroyer")
	{
		self function_f6a04c04();
		self thread namespace_9fc66ac::function_ba33d23d(#"hash_6be5064b066a7b98", #"hash_6be5064b066a7b98", #"hash_33fa791e022eebca");
		self namespace_e32bb68::function_3a59ec34("zmb_ai_gladiator_spawn_des");
		self.org = namespace_ec06fe4a::function_e22ae9b3(self.origin, "tag_origin", (0, 0, 0), "gladiator org");
		if(isdefined(self.org))
		{
			self.org thread namespace_ec06fe4a::function_d55f042c(self, "death");
		}
	}
	else if(self.var_9fde8624 == #"gladiator_marauder")
	{
		self function_2617ff14();
		self.next_leap_time = gettime() + 3000;
		self thread namespace_9fc66ac::function_ba33d23d(#"hash_777f818e6f3092bc", #"hash_777f818e6f3092bc", #"hash_2abe1fa45408f3b6");
		self namespace_e32bb68::function_3a59ec34("zmb_ai_gladiator_spawn_mar");
	}
	namespace_81245006::initweakpoints(self);
	self function_104b8cc1();
	self.var_844453ff = gettime() + 3000;
	self.has_left_arm = 1;
	self.has_right_arm = 1;
	self.var_ba481973 = 0;
	self.var_8c28b842 = 1;
	self.var_7672fb41 = 1;
	self.ignorepathenemyfightdist = 1;
	self.allowdeath = 1;
	self thread zombie_eye_glow::function_b43f92cd();
	aiutility::addaioverridedamagecallback(self, &function_75f32da6);
	self callback::function_d8abfc3d(#"on_ai_killed", &function_3b8907b9);
	target_set(self);
}

/*
	Name: function_75f32da6
	Namespace: namespace_146875e
	Checksum: 0xF2D4402F
	Offset: 0x4400
	Size: 0x9DC
	Parameters: 13
	Flags: Linked, Private
*/
function private function_75f32da6(inflictor, attacker, damage, idflags, meansofdeath, weapon, var_fd90b0bb, point, dir, hitloc, offsettime, boneindex, modelindex)
{
	if(isdefined(attacker) && attacker.team === self.team)
	{
		return 0;
	}
	if(isdefined(attacker) && self.var_9fde8624 == #"gladiator_marauder" && !isdefined(self.var_4f1b8d2b))
	{
		if(issentient(attacker))
		{
			self.favoriteenemy = attacker;
			self.var_4f1b8d2b = 1;
			self.var_cb89528d = 1;
		}
	}
	var_786d7e06 = namespace_250e9486::function_422fdfd4(self, attacker, weapon, boneindex, hitloc, point);
	var_dd54fdb1 = var_786d7e06.var_84ed9a13;
	var_88e794fb = var_786d7e06.registerzombie_bgb_used_reinforce;
	if(!isdefined(var_dd54fdb1))
	{
		weakpoints = namespace_81245006::function_fab3ee3e(self);
		if(isdefined(weakpoints))
		{
			foreach(var_3a1904d3 in weakpoints)
			{
				if(namespace_81245006::function_f29756fe(var_3a1904d3) === 1 && var_3a1904d3.type === #"armor")
				{
					var_dd54fdb1 = var_3a1904d3;
					var_88e794fb = 1;
					break;
				}
			}
		}
	}
	adjusted_damage = int(damage * var_786d7e06.damage_scale);
	if(isdefined(var_dd54fdb1))
	{
		if(isdefined(var_dd54fdb1.var_8223b0cf) && var_dd54fdb1.var_8223b0cf > 0)
		{
			adjusted_damage = (damage * var_786d7e06.damage_scale) * var_dd54fdb1.var_8223b0cf;
		}
		adjusted_damage = int(adjusted_damage);
		if(var_88e794fb)
		{
			namespace_81245006::function_ef87b7e8(var_dd54fdb1, adjusted_damage);
			if(namespace_81245006::function_f29756fe(var_dd54fdb1) === 3)
			{
				var_a7d0fdac = 0;
				if(var_dd54fdb1.hitlocs[0] == "left_arm_lower" || var_dd54fdb1.hitlocs[0] == "right_arm_lower")
				{
					var_a7d0fdac = 1;
					self.damage_info = {#modelindex:modelindex, #boneindex:boneindex, #offsettime:offsettime, #hitloc:var_dd54fdb1.hitlocs[0], #dir:dir, #point:point, #hash_fd90b0bb:var_fd90b0bb, #weapon:weapon, #meansofdeath:meansofdeath, #idflags:idflags, #damage:damage, #attacker:attacker, #inflictor:inflictor};
				}
				self destructserverutils::handledamage(inflictor, attacker, damage, idflags, meansofdeath, weapon, var_fd90b0bb, point, dir, var_dd54fdb1.hitlocs[0], offsettime, boneindex, modelindex);
				self.gibbed = 1;
				if(isdefined(level.var_36fff581) && !var_a7d0fdac)
				{
					self [[level.var_36fff581]](attacker);
					if(function_3238d10d(self.origin))
					{
						playsoundatposition(#"hash_10711c56d7aa52d5", self.origin + vectorscale((0, 0, 1), 30));
					}
				}
				if(var_dd54fdb1.hitlocs[0] == "helmet")
				{
					var_465efe42 = namespace_81245006::function_37e3f011(self, "j_head", 2);
					namespace_81245006::function_6c64ebd3(var_465efe42, 1);
					self.var_9b959f19 = 1;
					self setblackboardattribute("_gladiator_weakpoint", "head");
				}
				else
				{
					if(var_dd54fdb1.hitlocs[0] == "left_arm_upper")
					{
						var_449bfcd3 = namespace_81245006::function_37e3f011(self, "j_shoulder_le");
					}
					else
					{
						if(var_dd54fdb1.hitlocs[0] == "right_arm_upper")
						{
							var_449bfcd3 = namespace_81245006::function_37e3f011(self, "j_shoulder_ri");
						}
						else
						{
							if(var_dd54fdb1.hitlocs[0] == "left_arm_lower")
							{
								self.has_left_arm = 0;
								if(!gibserverutils::isgibbed(self, 32))
								{
									gibserverutils::gibleftarm(self, 0);
								}
								if(!self.has_right_arm)
								{
									self thread namespace_ec06fe4a::function_570729f0(0.1, attacker, meansofdeath, weapon);
								}
								else
								{
									self ai::set_behavior_attribute("run", 1);
									self setblackboardattribute("_gladiator_arm", "right_arm");
								}
								if(!self isattached(#"c_t8_zmb_dlc0_zombie_destroyer_larm1_dam"))
								{
									self attach(#"c_t8_zmb_dlc0_zombie_destroyer_larm1_dam");
								}
								self.var_9b959f19 = 1;
								self clientfield::set("gladiator_arm_effect", 1);
								self setblackboardattribute("_gladiator_weakpoint", "left_arm");
								self ai::set_behavior_attribute("run", 1);
							}
							else if(var_dd54fdb1.hitlocs[0] == "right_arm_lower")
							{
								self.has_right_arm = 0;
								if(!gibserverutils::isgibbed(self, 16))
								{
									gibserverutils::gibrightarm(self, 0);
								}
								if(!self.has_left_arm)
								{
									self thread namespace_ec06fe4a::function_570729f0(0.1, attacker, meansofdeath, weapon);
								}
								else
								{
									self setblackboardattribute("_gladiator_arm", "left_arm");
								}
								if(!self isattached(#"c_t8_zmb_dlc0_zombie_destroyer_rarm1_dam"))
								{
									self attach(#"c_t8_zmb_dlc0_zombie_destroyer_rarm1_dam");
								}
								self.var_9b959f19 = 1;
								self clientfield::set("gladiator_arm_effect", 2);
								self setblackboardattribute("_gladiator_weakpoint", "right_arm");
								self ai::set_behavior_attribute("run", 1);
							}
						}
					}
				}
				if(isdefined(var_449bfcd3))
				{
					namespace_81245006::function_6c64ebd3(var_449bfcd3, 1);
				}
				if(is_true(var_dd54fdb1.var_641ce20e))
				{
					namespace_81245006::function_6742b846(self, var_dd54fdb1);
				}
			}
			if(adjusted_damage >= self.maxhealth)
			{
				return adjusted_damage;
			}
			if(var_dd54fdb1.type === #"armor")
			{
				if(isdefined(attacker))
				{
					attacker util::show_hit_marker(!isalive(self));
				}
				return 0;
			}
		}
	}
	return adjusted_damage;
}

/*
	Name: function_3b8907b9
	Namespace: namespace_146875e
	Checksum: 0xC33D146D
	Offset: 0x4DE8
	Size: 0x388
	Parameters: 1
	Flags: Linked, Private
*/
function private function_3b8907b9(s_params)
{
	if(self.archetype != #"gladiator")
	{
		return;
	}
	level.doa.var_48af1fc9--;
	if(level.doa.var_48af1fc9 < 0)
	{
		level.doa.var_48af1fc9 = 0;
	}
	self val::set(#"gladiator_death", "takedamage", 0);
	if(isdefined(self.var_9a9a0311[#"tag_weapon_left"]))
	{
		self.var_9a9a0311[#"tag_weapon_left"] delete();
	}
	if(isdefined(self.var_9a9a0311[#"tag_weapon_right"]))
	{
		self.var_9a9a0311[#"tag_weapon_right"] delete();
	}
	impulse = anglestoforward(self.angles) + vectorscale((0, 0, 1), 5);
	impulse = vectorscale(impulse, 3);
	self function_5be18f96(0);
	if(self isattached("c_t8_zmb_dlc0_zombie_destroyer_axe1", "tag_weapon_left"))
	{
		var_ae295f0 = self gettagorigin("tag_weapon_left");
		var_5ad95b22 = self gettagangles("tag_weapon_left");
		var_2f69def6 = namespace_ec06fe4a::function_e22ae9b3(var_ae295f0, "c_t8_zmb_dlc0_zombie_destroyer_axe1");
		if(isdefined(var_2f69def6))
		{
			var_2f69def6 thread namespace_ec06fe4a::function_52afe5df(8);
			var_2f69def6.angles = var_5ad95b22;
			var_2f69def6 physicslaunch(self.origin, impulse);
		}
	}
	if(self isattached("c_t8_zmb_dlc0_zombie_destroyer_axe1", "tag_weapon_right"))
	{
		var_9d073a3b = self gettagorigin("tag_weapon_right");
		var_9219c99e = self gettagangles("tag_weapon_right");
		var_53e8a7f3 = namespace_ec06fe4a::function_e22ae9b3(var_9d073a3b, "c_t8_zmb_dlc0_zombie_destroyer_axe1");
		if(isdefined(var_53e8a7f3))
		{
			var_53e8a7f3 thread namespace_ec06fe4a::function_52afe5df(8);
			var_53e8a7f3.angles = var_9219c99e;
			var_53e8a7f3 physicslaunch(self.origin, impulse);
		}
	}
	if(!isplayer(s_params.eattacker))
	{
		return;
	}
}

/*
	Name: function_fbc2806e
	Namespace: namespace_146875e
	Checksum: 0xEEBAE029
	Offset: 0x5178
	Size: 0x334
	Parameters: 2
	Flags: Linked, Private
*/
function private function_fbc2806e(var_a4388d06, spin_dir)
{
	self endon(#"death", #"arm_destroyed");
	var_23f0c5b3 = self gettagorigin(var_a4388d06);
	var_ecc54f32 = self gettagangles(var_a4388d06);
	invert = 1;
	if(isdefined(spin_dir))
	{
		invert = invert * spin_dir;
	}
	var_ecc54f32 = (0, self.angles[1], 0);
	axe = namespace_ec06fe4a::function_e22ae9b3(var_23f0c5b3, "tag_origin");
	if(!isdefined(axe))
	{
		return;
	}
	axe.angles = var_ecc54f32;
	level notify(#"hash_27a9b4863f38ef7c", {#hash_90db0e3c:axe});
	self.var_9a9a0311[var_a4388d06] = axe;
	axe namespace_83eb6304::function_3ecfde67("axe_trail");
	axe namespace_83eb6304::function_3ecfde67("red_shield");
	axe namespace_e32bb68::function_3a59ec34("zmb_ai_gladiator_axe_lp");
	enemy = self.favoriteenemy;
	if(isdefined(enemy) && enemy.birthtime == gettime())
	{
		return;
	}
	var_6a774ef = self.favoriteenemy geteye();
	dist_to_target = distance(var_23f0c5b3, var_6a774ef);
	var_bb95ea0c = 250;
	interval_dist = var_bb95ea0c * 0.1;
	time_to_target = dist_to_target / var_bb95ea0c;
	total_dist = 0;
	max_dist = 450;
	var_7900b267 = vectornormalize(var_6a774ef - var_23f0c5b3);
	var_285f5e05 = vectortoangles(var_7900b267);
	while(true)
	{
		move_pos = axe.origin + (var_7900b267 * interval_dist);
		if(self function_88d65504(axe, var_7900b267, move_pos))
		{
			break;
		}
		axe moveto(move_pos, 0.1);
		wait(0.1);
		total_dist = total_dist + interval_dist;
		if(total_dist >= max_dist)
		{
			break;
		}
	}
	self function_137ed431(axe, var_a4388d06, spin_dir);
}

/*
	Name: function_88d65504
	Namespace: namespace_146875e
	Checksum: 0x4E1BEC1D
	Offset: 0x54B8
	Size: 0x20E
	Parameters: 3
	Flags: Linked, Private
*/
function private function_88d65504(axe, var_7900b267, move_pos)
{
	trace = physicstrace(var_7900b267.origin, move_pos, (-16, -16, -12), (16, 16, 12), self);
	if(trace[#"fraction"] < 1)
	{
		hit_ent = trace[#"entity"];
		level notify(#"hash_435816ec8f13c19b", {#hit_ent:hit_ent, #hash_90db0e3c:var_7900b267, #hash_ba14b770:self, #hash_f1445bd6:trace});
		if(isdefined(hit_ent))
		{
			if(isplayer(hit_ent))
			{
				if(is_true(hit_ent.hasriotshield))
				{
					if(is_true(hit_ent.hasriotshieldequipped))
					{
						if(hit_ent namespace_ec06fe4a::is_facing(var_7900b267, 0.2))
						{
							return true;
						}
					}
					else if(!isdefined(hit_ent.riotshieldentity))
					{
						if(!hit_ent namespace_ec06fe4a::is_facing(var_7900b267, -0.2))
						{
							return true;
						}
					}
				}
				hit_ent dodamage(50, var_7900b267.origin, self, self);
				hit_ent playsoundtoplayer(#"evt_player_swiped", hit_ent);
				return true;
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
	Name: function_c3712093
	Namespace: namespace_146875e
	Checksum: 0x7F37BCAB
	Offset: 0x56D0
	Size: 0xD2
	Parameters: 3
	Flags: Linked, Private
*/
function private function_c3712093(axe, var_a4388d06, var_bb95ea0c)
{
	self endon(#"death");
	axe endon(#"death");
	while(true)
	{
		tag_pos = self gettagorigin(var_a4388d06);
		dist = distance(axe.origin, tag_pos);
		time = dist / var_bb95ea0c;
		if(time < 0.7)
		{
			break;
		}
		waitframe(1);
	}
	self.var_d5e9528 = 1;
}

/*
	Name: function_137ed431
	Namespace: namespace_146875e
	Checksum: 0x9A195CA
	Offset: 0x57B0
	Size: 0x2EE
	Parameters: 3
	Flags: Linked, Private
*/
function private function_137ed431(axe, var_a4388d06, spin_dir)
{
	tag_pos = self gettagorigin(spin_dir);
	tag_ang = self gettagangles(spin_dir);
	var_bf72b943 = distance(var_a4388d06.origin, tag_pos);
	var_bb95ea0c = 500;
	interval_dist = var_bb95ea0c * 0.1;
	var_6cdcefc1 = interval_dist * interval_dist;
	total_dist = 0;
	max_dist = 450;
	var_7900b267 = vectornormalize(tag_pos - var_a4388d06.origin);
	new_yaw = absangleclamp360(var_a4388d06.angles[1] + 180);
	var_a4388d06.angles = (0, new_yaw, 0);
	self thread function_c3712093(var_a4388d06, spin_dir, var_bb95ea0c);
	while(true)
	{
		tag_pos = self gettagorigin(spin_dir);
		var_7900b267 = vectornormalize(tag_pos - var_a4388d06.origin);
		move_pos = var_a4388d06.origin + (var_7900b267 * interval_dist);
		self function_88d65504(var_a4388d06, var_7900b267, move_pos);
		var_a4388d06 moveto(move_pos, 0.1);
		wait(0.1);
		var_8abea022 = distancesquared(var_a4388d06.origin, tag_pos);
		if(var_8abea022 < var_6cdcefc1)
		{
			break;
		}
	}
	var_a4388d06 namespace_83eb6304::turnofffx("axe_trail");
	var_a4388d06 namespace_83eb6304::turnofffx("red_shield");
	var_a4388d06 namespace_e32bb68::function_ae271c0b("zmb_ai_gladiator_axe_lp");
	self.var_9a9a0311[spin_dir] = undefined;
	var_a4388d06 delete();
	self function_5be18f96();
	self.var_ba481973 = 0;
}

/*
	Name: function_f6a04c04
	Namespace: namespace_146875e
	Checksum: 0xB5E60D7
	Offset: 0x5AA8
	Size: 0x136
	Parameters: 0
	Flags: Linked
*/
function function_f6a04c04()
{
	self attach("c_t8_zmb_dlc0_zombie_destroyer_le_arm1", "j_shoulder_le");
	self attach("c_t8_zmb_dlc0_zombie_destroyer_ri_arm1", "j_clavicle_ri");
	self attach("c_t8_zmb_dlc0_zombie_destroyer_helmet1", "j_head");
	self attach("c_t8_zmb_dlc0_zombie_destroyer_le_pauldron1", "tag_pauldron_le");
	self attach("c_t8_zmb_dlc0_zombie_destroyer_ri_pauldron1", "tag_pauldron_ri");
	self attach("c_t8_zmb_dlc0_zombie_destroyer_axe1", "tag_weapon_right");
	self attach("c_t8_zmb_dlc0_zombie_destroyer_axe1", "tag_weapon_left");
	self.var_88d88318 = 1;
	self.var_fe593357 = 1;
}

/*
	Name: function_2617ff14
	Namespace: namespace_146875e
	Checksum: 0x24DE3135
	Offset: 0x5BE8
	Size: 0x74
	Parameters: 0
	Flags: Linked
*/
function function_2617ff14()
{
	self attach("c_t8_zmb_dlc0_zombie_marauder_helmet1");
	self attach("c_t8_zmb_dlc0_zombie_gladiator_le_cestus1", "tag_weapon_left");
	self attach("c_t8_zmb_dlc0_zombie_gladiator_ri_cestus1", "tag_weapon_right");
}

/*
	Name: function_5be18f96
	Namespace: namespace_146875e
	Checksum: 0x2DF79CC9
	Offset: 0x5C68
	Size: 0x24E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_5be18f96(display)
{
	if(!isdefined(display))
	{
		display = 1;
	}
	if(self.var_34cc44de === "left")
	{
		if(display)
		{
			self attach("c_t8_zmb_dlc0_zombie_destroyer_axe1", "tag_weapon_left");
			self.var_fe593357 = 1;
		}
		else if(is_true(self.var_fe593357))
		{
			if(self isattached("c_t8_zmb_dlc0_zombie_destroyer_axe1", "tag_weapon_left"))
			{
				self detach("c_t8_zmb_dlc0_zombie_destroyer_axe1", "tag_weapon_left");
			}
			self.var_fe593357 = 0;
		}
	}
	else
	{
		if(display)
		{
			if(self.has_left_arm && is_true(self.var_fe593357))
			{
				if(self isattached("c_t8_zmb_dlc0_zombie_destroyer_axe1", "tag_weapon_left"))
				{
					self detach("c_t8_zmb_dlc0_zombie_destroyer_axe1", "tag_weapon_left");
				}
				self.var_fe593357 = 0;
			}
			self attach("c_t8_zmb_dlc0_zombie_destroyer_axe1", "tag_weapon_right");
			self.var_88d88318 = 1;
			if(self.has_left_arm)
			{
				self attach("c_t8_zmb_dlc0_zombie_destroyer_axe1", "tag_weapon_left");
				self.var_fe593357 = 1;
			}
		}
		else if(is_true(self.var_88d88318))
		{
			if(self isattached("c_t8_zmb_dlc0_zombie_destroyer_axe1", "tag_weapon_right"))
			{
				self detach("c_t8_zmb_dlc0_zombie_destroyer_axe1", "tag_weapon_right");
			}
			self.var_88d88318 = 0;
		}
	}
}

/*
	Name: function_8a8841b0
	Namespace: namespace_146875e
	Checksum: 0xD0AAEC9F
	Offset: 0x5EC0
	Size: 0xDC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_8a8841b0(targetspot)
{
	if(self.health <= 0)
	{
		return;
	}
	self namespace_e32bb68::function_3a59ec34("zmb_ai_gladiator_axe_throw");
	if(isdefined(self.org))
	{
		self.org.origin = targetspot;
		self.org thread function_f7d9bc34();
	}
	self.var_ba481973 = 1;
	if(self.var_34cc44de === "left")
	{
		self thread function_fbc2806e("tag_weapon_left", -1);
	}
	else
	{
		self thread function_fbc2806e("tag_weapon_right");
	}
}

/*
	Name: function_36fff581
	Namespace: namespace_146875e
	Checksum: 0x765FA6BB
	Offset: 0x5FA8
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function function_36fff581(func)
{
	level.var_36fff581 = func;
}

/*
	Name: function_dfcfc03b
	Namespace: namespace_146875e
	Checksum: 0x7AF3E65C
	Offset: 0x5FD0
	Size: 0x8E
	Parameters: 0
	Flags: None
*/
function function_dfcfc03b()
{
	if(isdefined(self.favoriteenemy))
	{
		predictedpos = self lastknownpos(self.favoriteenemy);
		if(isdefined(predictedpos))
		{
			turnyaw = absangleclamp360(self.angles[1] - (vectortoangles(predictedpos - self.origin)[1]));
			return turnyaw;
		}
	}
	return undefined;
}

