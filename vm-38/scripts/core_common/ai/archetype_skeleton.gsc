#using script_41fe08c37d53a635;
#using script_2c5daa95f8fec03c;
#using script_522aeb6ae906391e;
#using script_3aa0f32b70d4f7cb;
#using script_4bf952f6ba31bb17;
#using script_59f07c660e6710a5;
#using script_7b7ed6e4bc963a51;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\ai\zombie.gsc;
#using script_3819e7a1427df6d2;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\ai_shared.gsc;

#namespace archetype_skeleton;

/*
	Name: function_9c634eaa
	Namespace: archetype_skeleton
	Checksum: 0x49C79B70
	Offset: 0x1D0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_9c634eaa()
{
	level notify(-2002542211);
}

/*
	Name: init
	Namespace: archetype_skeleton
	Checksum: 0xE7C2E1
	Offset: 0x1F0
	Size: 0x98
	Parameters: 0
	Flags: AutoExec
*/
function autoexec init()
{
	registerbehaviorscriptfunctions();
	spawner::add_archetype_spawn_function(#"skeleton", &function_f31535d8);
	spawner::add_archetype_spawn_function(#"skeleton", &function_a1acece9);
	level.var_cc1828c = [#"walk":4];
}

/*
	Name: function_f31535d8
	Namespace: archetype_skeleton
	Checksum: 0x488FB2D3
	Offset: 0x290
	Size: 0x4A
	Parameters: 0
	Flags: Linked, Private
*/
function private function_f31535d8()
{
	blackboard::createblackboardforentity(self);
	ai::createinterfaceforentity(self);
	self.___archetypeonanimscriptedcallback = &archetypeskeletononanimscriptedcallback;
}

/*
	Name: archetypeskeletononanimscriptedcallback
	Namespace: archetype_skeleton
	Checksum: 0x2A3B6202
	Offset: 0x2E8
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private archetypeskeletononanimscriptedcallback(entity)
{
	self.__blackboard = undefined;
	self function_f31535d8();
}

/*
	Name: registerbehaviorscriptfunctions
	Namespace: archetype_skeleton
	Checksum: 0x21751D0A
	Offset: 0x320
	Size: 0x1F4
	Parameters: 0
	Flags: Linked, Private
*/
function private registerbehaviorscriptfunctions()
{
	/#
		assert(isscriptfunctionptr(&function_7ef4937e));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_2dafca553cbc289b", &function_7ef4937e, 1);
	/#
		assert(isscriptfunctionptr(&function_233f80e1));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_22a1ab87ff6a9886", &function_233f80e1);
	/#
		assert(isscriptfunctionptr(&function_9eb31dff));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_5260937d1b37a1ab", &function_9eb31dff);
	/#
		assert(isscriptfunctionptr(&skeletondeathaction));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"skeletondeathaction", &skeletondeathaction);
	animationstatenetwork::registeranimationmocomp("mocomp_skeleton_run_melee", &function_7d1989aa, &function_5ff8994e, &function_9873c40e);
}

/*
	Name: function_a1acece9
	Namespace: archetype_skeleton
	Checksum: 0xEC936F05
	Offset: 0x520
	Size: 0x36C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_a1acece9()
{
	self.ignorepathenemyfightdist = 1;
	self.cant_move_cb = &zombiebehavior::function_79fe956f;
	self.var_2f68be48 = 1;
	self zombie_utility::set_zombie_run_cycle();
	self.base_speed = self.zombie_move_speed;
	self setup_variant_type();
	self callback::function_d8abfc3d(#"hash_dfbeaa068b23e7c", &setup_variant_type);
	if(self.var_9fde8624 === #"hash_fd7b9665529dd42")
	{
		self attach(#"c_t8_zmb_dlc2_skeleton_helmet", "j_head");
		self attach(#"c_t8_zmb_dlc2_skeleton_sword", "tag_weapon_right");
		self attach(#"c_t8_zmb_dlc2_skeleton_shield", "tag_weapon_left");
		self.shield = array(#"c_t8_zmb_dlc2_skeleton_shield", "tag_weapon_left");
		self.helmet = array(#"c_t8_zmb_dlc2_skeleton_helmet", "j_head");
	}
	else
	{
		if(self.var_9fde8624 === #"hash_1520c8987a671df0")
		{
			self attach(#"c_t8_zmb_dlc2_skeleton_helmet", "j_head");
			self attach(#"c_t8_zmb_dlc2_skeleton_spear", "tag_weapon_right");
			self.helmet = array(#"c_t8_zmb_dlc2_skeleton_helmet", "j_head");
		}
		else
		{
			if(self.var_9fde8624 === #"hash_342763a42d8fbca")
			{
				self attach(#"c_t8_zmb_dlc2_skeleton_sword", "tag_weapon_right");
				self attach(#"c_t8_zmb_dlc2_skeleton_shield", "tag_weapon_left");
				self.shield = array(#"c_t8_zmb_dlc2_skeleton_shield", "tag_weapon_left");
			}
			else if(self.var_9fde8624 === #"skeleton_spear")
			{
				self attach(#"c_t8_zmb_dlc2_skeleton_spear", "tag_weapon_right");
			}
		}
	}
	aiutility::addaioverridedamagecallback(self, &function_abab78a7);
	self callback::function_d8abfc3d(#"on_ai_killed", &function_4ac532fd);
}

/*
	Name: setup_variant_type
	Namespace: archetype_skeleton
	Checksum: 0x43E64AED
	Offset: 0x898
	Size: 0x72
	Parameters: 1
	Flags: Linked, Private
*/
function private setup_variant_type(params)
{
	if(isdefined(level.var_cc1828c) && isdefined(level.var_cc1828c[self.zombie_move_speed]))
	{
		self.variant_type = randomintrange(0, level.var_cc1828c[self.zombie_move_speed]);
	}
	else
	{
		self.variant_type = 0;
	}
}

/*
	Name: function_abab78a7
	Namespace: archetype_skeleton
	Checksum: 0xD0759939
	Offset: 0x918
	Size: 0xEE
	Parameters: 13
	Flags: Linked, Private
*/
function private function_abab78a7(inflictor, attacker, damage, idflags, meansofdeath, weapon, var_fd90b0bb, point, dir, hitloc, offsettime, boneindex, modelindex)
{
	if(isdefined(boneindex))
	{
		bonename = getpartname(self, boneindex);
		if(bonename === "tag_animate")
		{
			return 0;
		}
	}
	if(isdefined(level.var_dd9ff360))
	{
		damage = self [[level.var_dd9ff360]](inflictor, attacker, damage, idflags, meansofdeath, weapon, var_fd90b0bb, point, dir, hitloc, offsettime, boneindex, modelindex);
	}
	return damage;
}

/*
	Name: function_4ac532fd
	Namespace: archetype_skeleton
	Checksum: 0x9DC3CA15
	Offset: 0xA10
	Size: 0x5C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_4ac532fd(s_params)
{
	if(!is_true(self.fake_death))
	{
		destructserverutils::togglespawngibs(self, 1);
		destructserverutils::function_629a8d54(self, "tag_animate");
	}
}

/*
	Name: skeletondeathaction
	Namespace: archetype_skeleton
	Checksum: 0x4D984D2F
	Offset: 0xA78
	Size: 0x24
	Parameters: 1
	Flags: Linked, Private
*/
function private skeletondeathaction(entity)
{
	entity ghost();
}

/*
	Name: function_233f80e1
	Namespace: archetype_skeleton
	Checksum: 0x6F21E09F
	Offset: 0xAA8
	Size: 0x17A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_233f80e1(entity)
{
	if(entity asmistransitionrunning() || entity asmistransdecrunning())
	{
		return false;
	}
	if(isdefined(entity.enemy))
	{
		if(!entity haspath())
		{
			return false;
		}
		if(!btapi_shouldchargemelee(entity))
		{
			return false;
		}
		if(!function_dd3f5fa7(entity))
		{
			return false;
		}
		if(!isplayer(entity.enemy))
		{
			return false;
		}
		if(abs(entity.origin[2] - entity.enemy.origin[2]) > 64)
		{
			return false;
		}
		if(!entity cansee(entity.enemy))
		{
			return false;
		}
		if(!tracepassedonnavmesh(entity.origin, entity.enemy.origin, entity getpathfindingradius()))
		{
			return false;
		}
		return true;
	}
	return false;
}

/*
	Name: function_dd3f5fa7
	Namespace: archetype_skeleton
	Checksum: 0x9C85F34
	Offset: 0xC30
	Size: 0x11C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_dd3f5fa7(entity)
{
	/#
		if(getdvarint(#"hash_3e2ac8f3fd8af68a", 0))
		{
			return true;
		}
	#/
	if(!isdefined(entity.enemy))
	{
		return false;
	}
	var_2d00dddb = blackboard::getblackboardevents("skeleton_run_melee");
	if(isdefined(var_2d00dddb) && var_2d00dddb.size)
	{
		foreach(var_5d4c61c9 in var_2d00dddb)
		{
			if(var_5d4c61c9.data.enemy === entity.enemy)
			{
				return false;
			}
		}
	}
	return true;
}

/*
	Name: function_9eb31dff
	Namespace: archetype_skeleton
	Checksum: 0x3B2B2F8D
	Offset: 0xD58
	Size: 0x64
	Parameters: 1
	Flags: Linked, Private
*/
function private function_9eb31dff(entity)
{
	var_5d4c61c9 = {#enemy:entity.enemy};
	blackboard::addblackboardevent("skeleton_run_melee", var_5d4c61c9, randomintrange(5000, 7000));
}

/*
	Name: function_bcb3a1a1
	Namespace: archetype_skeleton
	Checksum: 0x1E3692FE
	Offset: 0xDC8
	Size: 0x8E
	Parameters: 0
	Flags: Linked
*/
function function_bcb3a1a1()
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

/*
	Name: function_7a007bbf
	Namespace: archetype_skeleton
	Checksum: 0x4BC29731
	Offset: 0xE60
	Size: 0x84
	Parameters: 2
	Flags: Private
*/
function private function_7a007bbf(skeleton, entity)
{
	forward = anglestoforward(skeleton.angles);
	to_enemy = vectornormalize(entity.origin - skeleton.origin);
	return vectordot(forward, to_enemy) >= 0.966;
}

/*
	Name: function_7d1989aa
	Namespace: archetype_skeleton
	Checksum: 0x880AD371
	Offset: 0xEF0
	Size: 0xDC
	Parameters: 5
	Flags: Linked
*/
function function_7d1989aa(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	mocompduration orientmode("face enemy");
	mocompduration animmode("zonly physics");
	if(isdefined(mocompduration.enemy) && distancesquared(mocompduration.enemy.origin, mocompduration.origin) < sqr(60))
	{
		mocompduration animmode("angle deltas");
	}
}

/*
	Name: function_5ff8994e
	Namespace: archetype_skeleton
	Checksum: 0xD99EBFAD
	Offset: 0xFD8
	Size: 0xDC
	Parameters: 5
	Flags: Linked
*/
function function_5ff8994e(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	mocompduration orientmode("face enemy");
	mocompduration animmode("zonly physics");
	if(isdefined(mocompduration.enemy) && distancesquared(mocompduration.enemy.origin, mocompduration.origin) < sqr(60))
	{
		mocompduration animmode("angle deltas");
	}
}

/*
	Name: function_9873c40e
	Namespace: archetype_skeleton
	Checksum: 0x7DCFF9F3
	Offset: 0x10C0
	Size: 0x4C
	Parameters: 5
	Flags: Linked
*/
function function_9873c40e(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	mocompduration orientmode("face current");
}

/*
	Name: function_a94fc02e
	Namespace: archetype_skeleton
	Checksum: 0xFD2509F1
	Offset: 0x1118
	Size: 0x130
	Parameters: 1
	Flags: Linked
*/
function function_a94fc02e(entity)
{
	if(entity.zombie_move_speed === "walk")
	{
		entity zombie_utility::set_zombie_run_cycle("run");
	}
	else if(entity.zombie_move_speed === "run")
	{
		entity zombie_utility::set_zombie_run_cycle("sprint");
	}
	entity.var_a2691e6b = gettime() + randomintrange(5000, 7500);
	entity.is_charging = 1;
	var_b7eca892 = {#enemy:entity.enemy};
	blackboard::addblackboardevent("skeleton_speed_update", var_b7eca892, randomintrange(1000, 2000));
	if(isdefined(level.var_a5007a40))
	{
		entity [[level.var_a5007a40]]();
	}
}

/*
	Name: function_9f7eb359
	Namespace: archetype_skeleton
	Checksum: 0xA121800D
	Offset: 0x1250
	Size: 0xD0
	Parameters: 1
	Flags: Linked
*/
function function_9f7eb359(entity)
{
	entity.is_charging = 0;
	entity.var_a9bb453f = gettime() + randomintrange(5000, 7500);
	if(entity.zombie_move_speed === "run")
	{
		entity zombie_utility::set_zombie_run_cycle("walk");
	}
	else if(entity.zombie_move_speed === "sprint")
	{
		entity zombie_utility::set_zombie_run_cycle("run");
	}
	if(isdefined(level.var_51e07970))
	{
		entity [[level.var_51e07970]]();
	}
}

/*
	Name: function_7ef4937e
	Namespace: archetype_skeleton
	Checksum: 0x6D8EC56D
	Offset: 0x1328
	Size: 0x274
	Parameters: 1
	Flags: Linked, Private
*/
function private function_7ef4937e(entity)
{
	if(!isdefined(self.enemy))
	{
		return false;
	}
	if(is_true(self.is_charging))
	{
		if(distance2dsquared(self.enemy.origin, entity.origin) >= sqr(1000) || gettime() >= self.var_a2691e6b)
		{
			function_9f7eb359(entity);
		}
		return false;
	}
	if(isdefined(self.var_a9bb453f) && gettime() < self.var_a9bb453f)
	{
		return false;
	}
	var_b2bf2e3c = blackboard::getblackboardevents("skeleton_speed_update");
	if(isdefined(var_b2bf2e3c) && var_b2bf2e3c.size)
	{
		foreach(var_b7eca892 in var_b2bf2e3c)
		{
			if(var_b7eca892.data.enemy === entity.enemy)
			{
				return false;
			}
		}
	}
	if(isdefined(level.var_64800a5a) && ![[level.var_64800a5a]](self))
	{
		return false;
	}
	if(distance2dsquared(self.enemy.origin, entity.origin) < sqr(400))
	{
		if(!util::within_fov(entity.enemy.origin, entity.enemy.angles, self.origin, cos(90)))
		{
			return false;
		}
		function_a94fc02e(entity);
		return true;
	}
	return false;
}

