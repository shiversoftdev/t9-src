#using script_178024232e91b0a1;
#using script_1f0e83e43bf9c3b9;
#using script_3aa0f32b70d4f7cb;
#using script_4bf952f6ba31bb17;
#using script_4d85e8de54b02198;
#using script_522aeb6ae906391e;
#using script_7b7ed6e4bc963a51;
#using scripts\core_common\aat_shared.gsc;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;

class class_1546f28e 
{

	/*
		Name: constructor
		Namespace: namespace_1546f28e
		Checksum: 0xD6824552
		Offset: 0x2948
		Size: 0x1A
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
		self.adjustmentstarted = 0;
		self.var_425c4c8b = 1;
	}

	/*
		Name: destructor
		Namespace: namespace_1546f28e
		Checksum: 0x80F724D1
		Offset: 0x2970
		Size: 0x4
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

}

#namespace namespace_8f7da5cc;

/*
	Name: function_977a7edf
	Namespace: namespace_8f7da5cc
	Checksum: 0xBA747A21
	Offset: 0x2F8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_977a7edf()
{
	level notify(463713116);
}

#namespace namespace_41b4e1ce;

/*
	Name: init
	Namespace: namespace_41b4e1ce
	Checksum: 0x857BBD6D
	Offset: 0x318
	Size: 0x84
	Parameters: 0
	Flags: AutoExec
*/
function autoexec init()
{
	namespace_b3c8cf82::function_da6eecb2();
	registerbehaviorscriptfunctions();
	spawner::add_archetype_spawn_function(#"nosferatu", &function_5b800648);
	clientfield::register("actor", "nfrtu_leap_melee_rumb", 8000, 1, "counter");
}

/*
	Name: function_dbd0360f
	Namespace: namespace_41b4e1ce
	Checksum: 0x3DE1B315
	Offset: 0x3A8
	Size: 0x4A
	Parameters: 0
	Flags: Linked, Private
*/
function private function_dbd0360f()
{
	blackboard::createblackboardforentity(self);
	self.___archetypeonanimscriptedcallback = &function_f8ab724f;
	self.___archetypeonbehavecallback = &function_b1df7220;
}

/*
	Name: function_b1df7220
	Namespace: namespace_41b4e1ce
	Checksum: 0x8F033804
	Offset: 0x400
	Size: 0xC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_b1df7220(entity)
{
}

/*
	Name: function_f8ab724f
	Namespace: namespace_41b4e1ce
	Checksum: 0x34473333
	Offset: 0x418
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_f8ab724f(entity)
{
	self.__blackboard = undefined;
	self function_dbd0360f();
}

/*
	Name: function_5b800648
	Namespace: namespace_41b4e1ce
	Checksum: 0xA671BC9B
	Offset: 0x450
	Size: 0xB4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_5b800648()
{
	/#
		assert(isdefined(self.ai));
	#/
	function_dbd0360f();
	self.ignorepathenemyfightdist = 1;
	self.var_ceed8829 = 1;
	self.zigzag_activation_distance = 400;
	self.var_7d39ec6a = 1;
	self setavoidancemask("avoid actor");
	self callback::function_d8abfc3d(#"hash_11aa32ad6d527054", &function_2e5f2af4);
}

/*
	Name: function_2e5f2af4
	Namespace: namespace_41b4e1ce
	Checksum: 0x9959DE10
	Offset: 0x510
	Size: 0x3C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_2e5f2af4()
{
	if(isdefined(self.var_cd8354e0))
	{
		radiusdamage(self.origin, 150, 15, 5, self, "MOD_MELEE");
	}
}

/*
	Name: registerbehaviorscriptfunctions
	Namespace: namespace_41b4e1ce
	Checksum: 0x93576A92
	Offset: 0x558
	Size: 0x804
	Parameters: 0
	Flags: Linked, Private
*/
function private registerbehaviorscriptfunctions()
{
	/#
		assert(isscriptfunctionptr(&nosferatushouldmelee));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"nosferatushouldmelee", &nosferatushouldmelee);
	/#
		assert(isscriptfunctionptr(&function_7ffbbff));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_986eb7e87a024a", &function_7ffbbff);
	/#
		assert(isscriptfunctionptr(&function_85d8b15d));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_12fd6029cfc2a603", &function_85d8b15d);
	/#
		assert(isscriptfunctionptr(&function_4df0b87d));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_571c2407eee0f7ce", &function_4df0b87d);
	/#
		assert(isscriptfunctionptr(&function_ed80a3bc));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_326882aa02157f0d", &function_ed80a3bc);
	/#
		assert(isscriptfunctionptr(&function_15d413b9));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_4c559b769f33559e", &function_15d413b9);
	/#
		assert(isscriptfunctionptr(&function_e9819a23));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_7c46d4f8f6bd8a19", &function_e9819a23);
	/#
		assert(isscriptfunctionptr(&function_b5047448));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_d557a256994b864", &function_b5047448);
	/#
		assert(isscriptfunctionptr(&function_15d413b9));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_4c559b769f33559e", &function_15d413b9);
	/#
		assert(isscriptfunctionptr(&function_a41a5aea));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_2392a1b5bcda2a4d", &function_a41a5aea);
	/#
		assert(isscriptfunctionptr(&function_b5305a8f));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_55bb0ab8a037fcca", &function_b5305a8f);
	/#
		assert(isscriptfunctionptr(&function_ebe0e1b5));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_38a10af328e33bf7", &function_ebe0e1b5);
	/#
		assert(isscriptfunctionptr(&function_76505306));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_5ba3133a0e93c9f1", &function_76505306);
	/#
		assert(isscriptfunctionptr(&function_e0ad0db2));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_77c524bf92130b36", &function_e0ad0db2);
	/#
		assert(isscriptfunctionptr(&function_b75dd595));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_544b52e495ac560e", &function_b75dd595);
	/#
		assert(isscriptfunctionptr(&function_8b2173e0));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_4d02bd1f2f959be9", &function_8b2173e0);
	/#
		assert(isscriptfunctionptr(&function_b758de87));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_ee12d5fffc3b8bb", &function_b758de87);
	animationstatenetwork::registeranimationmocomp("mocomp_nfrtu_leap_attack", &function_1ad502a0, &function_3511ecd1, &function_b472ba3d);
	animationstatenetwork::registeranimationmocomp("mocomp_nfrtu_latch_attack", &function_1ad502a0, &function_3511ecd1, &function_b472ba3d);
	animationstatenetwork::registeranimationmocomp("mocomp_nfrtu_run_attack", &function_37d5cfc, undefined, &function_4b55eb0a);
	animationstatenetwork::registernotetrackhandlerfunction("nosferatu_leap_attack_rumble", &function_270f7c3f);
	animationstatenetwork::registernotetrackhandlerfunction("nosferatu_bite", &function_2e8014e);
}

/*
	Name: function_2e8014e
	Namespace: namespace_41b4e1ce
	Checksum: 0xF5E57EBB
	Offset: 0xD68
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function function_2e8014e(entity)
{
	if(isdefined(entity) && isdefined(entity.enemy))
	{
		entity.enemy dodamage(25, entity.enemy.origin, entity, entity, "neck", "MOD_MELEE");
	}
}

/*
	Name: function_b75dd595
	Namespace: namespace_41b4e1ce
	Checksum: 0x7227F63F
	Offset: 0xDD8
	Size: 0x10C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_b75dd595(entity)
{
	if(!isdefined(entity.enemy))
	{
		return false;
	}
	if(entity.var_9fde8624 !== #"crimson_nosferatu")
	{
		return false;
	}
	var_ae9326df = blackboard::getblackboardevents("nfrtu_move_dash");
	if(isdefined(var_ae9326df) && var_ae9326df.size)
	{
		foreach(var_d86ae1c4 in var_ae9326df)
		{
			if(var_d86ae1c4.data.enemy === entity.enemy)
			{
				return false;
			}
		}
	}
	return true;
}

/*
	Name: function_8b2173e0
	Namespace: namespace_41b4e1ce
	Checksum: 0x7ABE6D88
	Offset: 0xEF0
	Size: 0x70
	Parameters: 1
	Flags: Linked, Private
*/
function private function_8b2173e0(entity)
{
	var_d86ae1c4 = spawnstruct();
	var_d86ae1c4.enemy = entity.enemy;
	blackboard::addblackboardevent("nfrtu_move_dash", var_d86ae1c4, randomintrange(8500, 10000));
	return true;
}

/*
	Name: function_3df24b25
	Namespace: namespace_41b4e1ce
	Checksum: 0x914E2148
	Offset: 0xF68
	Size: 0x11C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_3df24b25(entity)
{
	/#
		if(getdvarint(#"hash_5ebc5d42d65e6fd1", 0))
		{
			return true;
		}
	#/
	if(!isdefined(entity.enemy))
	{
		return false;
	}
	var_935d5acc = blackboard::getblackboardevents("nfrtu_latch_melee");
	if(isdefined(var_935d5acc) && var_935d5acc.size)
	{
		foreach(var_1e5d8d32 in var_935d5acc)
		{
			if(var_1e5d8d32.data.enemy === entity.enemy)
			{
				return false;
			}
		}
	}
	return true;
}

/*
	Name: function_15d413b9
	Namespace: namespace_41b4e1ce
	Checksum: 0xDE2CEF86
	Offset: 0x1090
	Size: 0x80
	Parameters: 1
	Flags: Linked, Private
*/
function private function_15d413b9(entity)
{
	entity.var_1c33120d = 1;
	var_1e5d8d32 = spawnstruct();
	var_1e5d8d32.enemy = entity.enemy;
	blackboard::addblackboardevent("nfrtu_latch_melee", var_1e5d8d32, randomintrange(30000, 50000));
	return true;
}

/*
	Name: function_b758de87
	Namespace: namespace_41b4e1ce
	Checksum: 0xED88C9E3
	Offset: 0x1118
	Size: 0x8C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_b758de87(entity)
{
	entity.var_1c33120d = 0;
	entity clearpath();
	var_3bfe8ebe = spawnstruct();
	var_3bfe8ebe.enemy = entity.enemy;
	blackboard::addblackboardevent("nfrtu_leap_melee", var_3bfe8ebe, randomintrange(6000, 9000));
}

/*
	Name: function_b5305a8f
	Namespace: namespace_41b4e1ce
	Checksum: 0x87654A4D
	Offset: 0x11B0
	Size: 0x38
	Parameters: 1
	Flags: Linked, Private
*/
function private function_b5305a8f(entity)
{
	if(isdefined(entity.enemy))
	{
		entity thread function_20a76c21(entity);
	}
	return true;
}

/*
	Name: function_2ad18645
	Namespace: namespace_41b4e1ce
	Checksum: 0x6C4030E7
	Offset: 0x11F0
	Size: 0xCC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_2ad18645(notifyhash)
{
	player = self;
	if(isdefined(self) && !isplayer(self) && isdefined(self.enemy) && isplayer(self.enemy))
	{
		player = self.enemy;
	}
	if(isdefined(player))
	{
		player val::reset(#"hash_56d5d2157d677c61", "ignoreme");
		player val::reset(#"hash_56d5d2157d677c61", "disable_weapons");
	}
}

/*
	Name: function_fb3fdf43
	Namespace: namespace_41b4e1ce
	Checksum: 0x5A1CB3E2
	Offset: 0x12C8
	Size: 0x106
	Parameters: 2
	Flags: Linked, Private
*/
function private function_fb3fdf43(entity, latch_enemy)
{
	entity endoncallback(&function_2ad18645, #"death");
	latch_enemy endoncallback(&function_2ad18645, #"disconnect", #"death");
	if(isdefined(self) && isdefined(entity) && isdefined(latch_enemy))
	{
		self scene::play(#"hash_2f5e51824901e5", array(entity, latch_enemy));
	}
	if(isdefined(entity))
	{
		entity.var_cd8354e0 = undefined;
		entity.var_1c33120d = 0;
	}
	if(isdefined(self))
	{
		self notify(#"hash_7a32b2af2eef5415");
	}
}

/*
	Name: function_20a76c21
	Namespace: namespace_41b4e1ce
	Checksum: 0x40268485
	Offset: 0x13D8
	Size: 0x1EC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_20a76c21(entity)
{
	entity endoncallback(&function_2ad18645, #"death");
	latch_enemy = entity.enemy;
	latch_enemy endoncallback(&function_2ad18645, #"disconnect", #"death");
	if(isdefined(latch_enemy))
	{
		latch_enemy thread function_db62d88a();
	}
	alignnode = spawnstruct();
	alignnode.origin = entity.enemy.origin;
	alignnode.angles = entity.enemy.angles;
	alignnode thread function_fb3fdf43(entity, latch_enemy);
	alignnode waittilltimeout(7, #"hash_7a32b2af2eef5415");
	if(isdefined(alignnode))
	{
		alignnode struct::delete();
	}
	if(isdefined(latch_enemy))
	{
		latch_enemy val::reset(#"hash_56d5d2157d677c61", "disable_weapons");
		latch_enemy notify(#"hash_7a32b2af2eef5415");
	}
	if(isdefined(entity))
	{
		entity.var_1c33120d = 0;
		entity clearpath();
	}
	var_3bfe8ebe = spawnstruct();
	var_3bfe8ebe.enemy = latch_enemy;
	blackboard::addblackboardevent("nfrtu_leap_melee", var_3bfe8ebe, randomintrange(6000, 9000));
}

/*
	Name: function_db62d88a
	Namespace: namespace_41b4e1ce
	Checksum: 0xB526D6BF
	Offset: 0x15D0
	Size: 0xEC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_db62d88a()
{
	self endon(#"death");
	self val::set(#"hash_56d5d2157d677c61", "ignoreme", 1);
	w_current = self getcurrentweapon();
	if(isdefined(w_current) && is_true(w_current.isheroweapon))
	{
		self val::set(#"hash_56d5d2157d677c61", "disable_weapons", 1);
	}
	wait(8);
	self val::reset(#"hash_56d5d2157d677c61", "ignoreme");
}

/*
	Name: function_a41a5aea
	Namespace: namespace_41b4e1ce
	Checksum: 0x83B2250E
	Offset: 0x16C8
	Size: 0x1E6
	Parameters: 1
	Flags: Linked, Private
*/
function private function_a41a5aea(entity)
{
	if(!isdefined(entity.enemy))
	{
		return false;
	}
	if(!isplayer(entity.enemy))
	{
		return false;
	}
	if(is_true(entity.enemy.var_7ebdb2c9))
	{
		return false;
	}
	if(abs(entity.origin[2] - entity.enemy.origin[2]) > 64)
	{
		return false;
	}
	distancesq = distancesquared(entity.origin, entity.enemy.origin);
	if(distancesq >= sqr(96))
	{
		return false;
	}
	if(!entity cansee(entity.enemy))
	{
		return false;
	}
	enemyangles = entity.enemy getplayerangles();
	if(!util::within_fov(entity.enemy.origin, enemyangles, self.origin, cos(25)))
	{
		return false;
	}
	if(!tracepassedonnavmesh(entity.origin, entity.enemy.origin, entity getpathfindingradius()))
	{
		return false;
	}
	return true;
}

/*
	Name: function_b5047448
	Namespace: namespace_41b4e1ce
	Checksum: 0x7D3600D4
	Offset: 0x18B8
	Size: 0x17A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_b5047448(entity)
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
		if(!function_c2f87d6(entity))
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
	Name: function_e9819a23
	Namespace: namespace_41b4e1ce
	Checksum: 0x7472D237
	Offset: 0x1A40
	Size: 0x3D2
	Parameters: 1
	Flags: Linked, Private
*/
function private function_e9819a23(entity)
{
	if(entity.var_9fde8624 !== #"crimson_nosferatu")
	{
		return false;
	}
	if(entity asmistransitionrunning() || entity asmistransdecrunning())
	{
		return false;
	}
	if(isdefined(entity.enemy))
	{
		if(!btapi_shouldchargemelee(entity))
		{
			return false;
		}
		if(!function_3df24b25(entity))
		{
			return false;
		}
		if(!isplayer(entity.enemy))
		{
			return false;
		}
		if(is_true(entity.enemy.var_7ebdb2c9))
		{
			return false;
		}
		if(abs(entity.origin[2] - entity.enemy.origin[2]) > 64)
		{
			return false;
		}
		predictedenemypos = entity.enemy.origin;
		velocity = entity.enemy getvelocity();
		if(length(velocity) > 0)
		{
			predictedenemypos = predictedenemypos + vectorscale(velocity, 0.25);
		}
		distancesq = distancesquared(entity.origin, predictedenemypos);
		if(distancesq <= sqr(128))
		{
			return false;
		}
		if(distancesq >= sqr(100))
		{
			if(entity.enemy issprinting())
			{
				enemyvelocity = vectornormalize(entity.enemy getvelocity());
				var_7a61ad67 = vectornormalize(entity getvelocity());
				if(vectordot(var_7a61ad67, enemyvelocity) > cos(20))
				{
					/#
						record3dtext("", entity.origin + vectorscale((0, 0, 1), 60), (1, 0, 0), "");
					#/
					return false;
				}
			}
		}
		if(!entity cansee(entity.enemy))
		{
			return false;
		}
		enemyangles = entity.enemy getplayerangles();
		if(!util::within_fov(entity.enemy.origin, enemyangles, self.origin, cos(25)))
		{
			return false;
		}
		if(!tracepassedonnavmesh(entity.origin, predictedenemypos, entity getpathfindingradius()))
		{
			return false;
		}
		return true;
	}
	return false;
}

/*
	Name: function_85d8b15d
	Namespace: namespace_41b4e1ce
	Checksum: 0xFE29700C
	Offset: 0x1E20
	Size: 0x322
	Parameters: 1
	Flags: Linked, Private
*/
function private function_85d8b15d(entity)
{
	if(entity asmistransitionrunning() || entity asmistransdecrunning())
	{
		return false;
	}
	if(isdefined(entity.enemy))
	{
		if(!btapi_shouldchargemelee(entity))
		{
			return false;
		}
		if(!function_105988a0(entity))
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
		predictedenemypos = entity.enemy.origin;
		velocity = entity.enemy getvelocity();
		if(length(velocity) > 0)
		{
			predictedenemypos = predictedenemypos + vectorscale(velocity, 0.25);
		}
		distancesq = distancesquared(entity.origin, predictedenemypos);
		if(distancesq <= sqr(128))
		{
			return false;
		}
		if(distancesq >= sqr(100))
		{
			if(entity.enemy issprinting())
			{
				enemyvelocity = vectornormalize(entity.enemy getvelocity());
				var_7a61ad67 = vectornormalize(entity getvelocity());
				if(vectordot(var_7a61ad67, enemyvelocity) > cos(20))
				{
					/#
						record3dtext("", entity.origin + vectorscale((0, 0, 1), 60), (1, 0, 0), "");
					#/
					return false;
				}
			}
		}
		if(!entity cansee(entity.enemy))
		{
			return false;
		}
		if(!tracepassedonnavmesh(entity.origin, predictedenemypos, entity getpathfindingradius()))
		{
			return false;
		}
		return true;
	}
	return false;
}

/*
	Name: function_ebe0e1b5
	Namespace: namespace_41b4e1ce
	Checksum: 0xA95DA70E
	Offset: 0x2150
	Size: 0xEC
	Parameters: 1
	Flags: Linked
*/
function function_ebe0e1b5(entity)
{
	if(!isdefined(entity.enemy))
	{
		return false;
	}
	var_623b3520 = blackboard::getblackboardevents("nfrtu_full_pain");
	if(isdefined(var_623b3520) && var_623b3520.size)
	{
		foreach(var_77d2339d in var_623b3520)
		{
			if(var_77d2339d.data.enemy === entity.enemy)
			{
				return false;
			}
		}
	}
	return true;
}

/*
	Name: function_76505306
	Namespace: namespace_41b4e1ce
	Checksum: 0x61EDD056
	Offset: 0x2248
	Size: 0x6C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_76505306(entity)
{
	var_77d2339d = spawnstruct();
	var_77d2339d.enemy = entity.enemy;
	blackboard::addblackboardevent("nfrtu_full_pain", var_77d2339d, randomintrange(4500, 6500));
}

/*
	Name: function_e0ad0db2
	Namespace: namespace_41b4e1ce
	Checksum: 0x55867BE5
	Offset: 0x22C0
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_e0ad0db2(entity)
{
	entity pathmode("move allowed");
}

/*
	Name: nosferatushouldmelee
	Namespace: namespace_41b4e1ce
	Checksum: 0x48F1E09C
	Offset: 0x22F8
	Size: 0xB0
	Parameters: 1
	Flags: Linked, Private
*/
function private nosferatushouldmelee(entity)
{
	if(!isdefined(entity.enemy))
	{
		return false;
	}
	if(is_true(entity.enemy.ignoreme))
	{
		return false;
	}
	if(function_85d8b15d(entity) || function_7ffbbff(entity) || function_e9819a23(entity) || function_b5047448(entity))
	{
		return true;
	}
	return false;
}

/*
	Name: function_7ffbbff
	Namespace: namespace_41b4e1ce
	Checksum: 0x2CB91085
	Offset: 0x23B0
	Size: 0x24E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_7ffbbff(entity)
{
	if(!isdefined(entity.enemy))
	{
		return false;
	}
	if(entity asmistransitionrunning() || entity asmistransdecrunning())
	{
		return false;
	}
	if(isdefined(entity.marked_for_death))
	{
		return false;
	}
	if(is_true(entity.ignoremelee))
	{
		return false;
	}
	if(abs(entity.origin[2] - entity.enemy.origin[2]) > 64)
	{
		return false;
	}
	if(distancesquared(entity.origin, entity.enemy.origin) > sqr(80))
	{
		return false;
	}
	yawtoenemy = angleclamp180(entity.angles[1] - (vectortoangles(entity.enemy.origin - entity.origin)[1]));
	if(abs(yawtoenemy) > (isdefined(entity.var_1c0eb62a) ? entity.var_1c0eb62a : 60))
	{
		return false;
	}
	if(!entity cansee(entity.enemy))
	{
		return false;
	}
	if(!tracepassedonnavmesh(entity.origin, (isdefined(entity.enemy.last_valid_position) ? entity.enemy.last_valid_position : entity.enemy.origin), entity.enemy getpathfindingradius()))
	{
		return false;
	}
	return true;
}

/*
	Name: function_105988a0
	Namespace: namespace_41b4e1ce
	Checksum: 0x64E1880
	Offset: 0x2608
	Size: 0x11C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_105988a0(entity)
{
	/#
		if(getdvarint(#"hash_541d64bc060bdd29", 0))
		{
			return true;
		}
	#/
	if(!isdefined(entity.enemy))
	{
		return false;
	}
	var_33f55f67 = blackboard::getblackboardevents("nfrtu_leap_melee");
	if(isdefined(var_33f55f67) && var_33f55f67.size)
	{
		foreach(var_3bfe8ebe in var_33f55f67)
		{
			if(var_3bfe8ebe.data.enemy === entity.enemy)
			{
				return false;
			}
		}
	}
	return true;
}

/*
	Name: function_c2f87d6
	Namespace: namespace_41b4e1ce
	Checksum: 0xCD5AB558
	Offset: 0x2730
	Size: 0x11C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_c2f87d6(entity)
{
	/#
		if(getdvarint(#"hash_43a13163c1956e08", 0))
		{
			return true;
		}
	#/
	if(!isdefined(entity.enemy))
	{
		return false;
	}
	var_33f55f67 = blackboard::getblackboardevents("nfrtu_run_melee");
	if(isdefined(var_33f55f67) && var_33f55f67.size)
	{
		foreach(var_3bfe8ebe in var_33f55f67)
		{
			if(var_3bfe8ebe.data.enemy === entity.enemy)
			{
				return false;
			}
		}
	}
	return true;
}

/*
	Name: function_ed80a3bc
	Namespace: namespace_41b4e1ce
	Checksum: 0x5F588537
	Offset: 0x2858
	Size: 0x6C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_ed80a3bc(entity)
{
	var_3bfe8ebe = spawnstruct();
	var_3bfe8ebe.enemy = entity.enemy;
	blackboard::addblackboardevent("nfrtu_run_melee", var_3bfe8ebe, randomintrange(10000, 12000));
}

/*
	Name: function_4df0b87d
	Namespace: namespace_41b4e1ce
	Checksum: 0xC60BEFDB
	Offset: 0x28D0
	Size: 0x6C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_4df0b87d(entity)
{
	var_3bfe8ebe = spawnstruct();
	var_3bfe8ebe.enemy = entity.enemy;
	blackboard::addblackboardevent("nfrtu_leap_melee", var_3bfe8ebe, randomintrange(6000, 9000));
}

/*
	Name: function_37d5cfc
	Namespace: namespace_41b4e1ce
	Checksum: 0x6C5C0067
	Offset: 0x2A08
	Size: 0x9A
	Parameters: 5
	Flags: Linked
*/
function function_37d5cfc(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	mocompduration animmode("zonly_physics", 1);
	mocompduration orientmode("face enemy");
	mocompduration pathmode("dont move", 0);
	mocompduration.usegoalanimweight = 1;
}

/*
	Name: function_4b55eb0a
	Namespace: namespace_41b4e1ce
	Checksum: 0xDD504965
	Offset: 0x2AB0
	Size: 0x84
	Parameters: 5
	Flags: Linked
*/
function function_4b55eb0a(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	mocompduration.blockingpain = 0;
	mocompduration.usegoalanimweight = 0;
	mocompduration orientmode("face default");
	mocompduration pathmode("move delayed", 0, 0.2);
}

/*
	Name: function_1ad502a0
	Namespace: namespace_41b4e1ce
	Checksum: 0x1BB033A
	Offset: 0x2B40
	Size: 0x2F4
	Parameters: 5
	Flags: Linked
*/
function function_1ad502a0(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	mocompanimflag animmode("gravity", 1);
	mocompanimflag orientmode("face angle", mocompanimflag.angles[1]);
	mocompanimflag.blockingpain = 1;
	mocompanimflag.usegoalanimweight = 1;
	mocompanimflag pathmode("dont move", 1);
	mocompanimflag collidewithactors(0);
	if(isdefined(mocompanimflag.enemy))
	{
		dirtoenemy = vectornormalize(mocompanimflag.enemy.origin - mocompanimflag.origin);
		mocompanimflag forceteleport(mocompanimflag.origin, vectortoangles(dirtoenemy));
	}
	if(!isdefined(mocompanimflag.var_cd8354e0))
	{
		mocompanimflag.var_cd8354e0 = new class_1546f28e();
		mocompanimflag.var_cd8354e0.var_9bfa8497 = mocompanimflag.origin;
		mocompanimflag.var_cd8354e0.var_98bc84b7 = getnotetracktimes(mocompduration, "start_adjust")[0];
		mocompanimflag.var_cd8354e0.var_6392c3a2 = getnotetracktimes(mocompduration, "end_adjust")[0];
		var_e397f54c = getmovedelta(mocompduration, 0, 1);
		mocompanimflag.var_cd8354e0.var_cb28f380 = mocompanimflag localtoworldcoords(var_e397f54c);
		/#
			movedelta = getmovedelta(mocompduration, 0, 1);
			var_6b8f735f = mocompanimflag localtoworldcoords(movedelta);
			distance = distance(mocompanimflag.origin, var_6b8f735f);
			recordcircle(var_6b8f735f, 3, (0, 1, 0), "");
			record3dtext("" + distance, var_6b8f735f, (0, 1, 0), "");
		#/
	}
}

/*
	Name: function_3511ecd1
	Namespace: namespace_41b4e1ce
	Checksum: 0x9D1AE32C
	Offset: 0x2E40
	Size: 0xB64
	Parameters: 5
	Flags: Linked
*/
function function_3511ecd1(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	if(!isalive(mocompanimflag))
	{
		return;
	}
	/#
		assert(isdefined(mocompanimflag.var_cd8354e0));
	#/
	var_e72a224a = mocompanimflag getanimtime(mocompduration);
	if(isdefined(mocompanimflag.enemy) && !mocompanimflag.var_cd8354e0.adjustmentstarted && mocompanimflag.var_cd8354e0.var_425c4c8b && var_e72a224a >= mocompanimflag.var_cd8354e0.var_98bc84b7)
	{
		predictedenemypos = mocompanimflag.enemy.origin;
		velocity = mocompanimflag.enemy getvelocity();
		if(length(velocity) > 0)
		{
			predictedenemypos = predictedenemypos + vectorscale(velocity, 0.25);
		}
		mocompanimflag.var_cd8354e0.var_736d2cce = predictedenemypos;
		var_cf699df5 = distancesquared(mocompanimflag.var_cd8354e0.var_9bfa8497, mocompanimflag.var_cd8354e0.var_cb28f380);
		var_776ddabf = distancesquared(mocompanimflag.var_cd8354e0.var_cb28f380, mocompanimflag.var_cd8354e0.var_736d2cce);
		var_65cbfb52 = distancesquared(mocompanimflag.var_cd8354e0.var_9bfa8497, mocompanimflag.var_cd8354e0.var_736d2cce);
		var_201660e6 = tracepassedonnavmesh(mocompanimflag.var_cd8354e0.var_9bfa8497, mocompanimflag.var_cd8354e0.var_736d2cce, mocompanimflag getpathfindingradius());
		traceresult = bullettrace(mocompanimflag.origin, mocompanimflag.var_cd8354e0.var_736d2cce + vectorscale((0, 0, 1), 30), 0, mocompanimflag, 0, 0, mocompanimflag.enemy);
		isvisible = traceresult[#"fraction"] == 1;
		var_535d098c = 0;
		if(isdefined(traceresult[#"hitloc"]) && traceresult[#"hitloc"] == "riotshield")
		{
			var_cc075bd0 = vectornormalize(mocompanimflag.origin - mocompanimflag.var_cd8354e0.var_736d2cce);
			mocompanimflag.var_cd8354e0.var_736d2cce = mocompanimflag.var_cd8354e0.var_736d2cce + vectorscale(var_cc075bd0, 50);
			var_535d098c = 1;
		}
		if(traceresult[#"fraction"] < 0.9)
		{
			/#
				record3dtext("", mocompanimflag.origin + vectorscale((0, 0, 1), 60), (1, 0, 0), "");
			#/
			mocompanimflag.var_cd8354e0.var_425c4c8b = 0;
		}
		else
		{
			if(!var_201660e6)
			{
				/#
					record3dtext("", mocompanimflag.origin + vectorscale((0, 0, 1), 60), (1, 0, 0), "");
				#/
				mocompanimflag.var_cd8354e0.var_425c4c8b = 0;
			}
			else
			{
				if(var_cf699df5 > var_65cbfb52 && var_776ddabf >= sqr(130))
				{
					/#
						record3dtext("", mocompanimflag.origin + vectorscale((0, 0, 1), 60), (1, 0, 0), "");
					#/
					mocompanimflag.var_cd8354e0.var_425c4c8b = 0;
				}
				else if(var_65cbfb52 >= sqr(450))
				{
					/#
						record3dtext("", mocompanimflag.origin + vectorscale((0, 0, 1), 60), (1, 0, 0), "");
					#/
					mocompanimflag.var_cd8354e0.var_425c4c8b = 0;
				}
			}
		}
		if(var_535d098c)
		{
			/#
				record3dtext("", mocompanimflag.origin + vectorscale((0, 0, 1), 60), (1, 0, 0), "");
			#/
			mocompanimflag.var_cd8354e0.var_425c4c8b = 1;
		}
		if(mocompanimflag.var_cd8354e0.var_425c4c8b)
		{
			var_776ddabf = distancesquared(mocompanimflag.var_cd8354e0.var_cb28f380, mocompanimflag.var_cd8354e0.var_736d2cce);
			var_beabc994 = anglestoforward(mocompanimflag.angles);
			var_1c3641f2 = (mocompanimflag.enemy.origin[0], mocompanimflag.enemy.origin[1], mocompanimflag.origin[2]);
			dirtoenemy = vectornormalize(var_1c3641f2 - mocompanimflag.origin);
			zdiff = mocompanimflag.var_cd8354e0.var_cb28f380[2] - mocompanimflag.enemy.origin[2];
			var_6738a702 = abs(zdiff) <= 64;
			var_175919d1 = vectordot(var_beabc994, dirtoenemy) > cos(50);
			var_7948b2f3 = var_6738a702 && var_175919d1;
			var_425c4c8b = isvisible || var_535d098c && var_7948b2f3;
			/#
				reasons = (((("" + isvisible) + "") + var_6738a702) + "") + var_175919d1;
				if(var_425c4c8b)
				{
					record3dtext(reasons, mocompanimflag.origin + vectorscale((0, 0, 1), 60), (0, 1, 0), "");
				}
				else
				{
					record3dtext(reasons, mocompanimflag.origin + vectorscale((0, 0, 1), 60), (1, 0, 0), "");
				}
			#/
			if(var_425c4c8b)
			{
				var_90c3cdd2 = length(mocompanimflag.var_cd8354e0.var_736d2cce - mocompanimflag.var_cd8354e0.var_cb28f380);
				timestep = function_60d95f53();
				animlength = getanimlength(mocompduration) * 1000;
				starttime = mocompanimflag.var_cd8354e0.var_98bc84b7 * animlength;
				stoptime = mocompanimflag.var_cd8354e0.var_6392c3a2 * animlength;
				starttime = ceil(starttime / timestep);
				stoptime = ceil(stoptime / timestep);
				adjustduration = stoptime - starttime;
				mocompanimflag.var_cd8354e0.var_10b8b6d1 = vectornormalize(mocompanimflag.var_cd8354e0.var_736d2cce - mocompanimflag.var_cd8354e0.var_cb28f380);
				mocompanimflag.var_cd8354e0.var_8b9a15a6 = var_90c3cdd2 / adjustduration;
				mocompanimflag.var_cd8354e0.var_425c4c8b = 1;
				mocompanimflag.var_cd8354e0.adjustmentstarted = 1;
			}
			else
			{
				mocompanimflag.var_cd8354e0.var_425c4c8b = 0;
			}
		}
	}
	if(mocompanimflag.var_cd8354e0.adjustmentstarted)
	{
		if(var_e72a224a <= mocompanimflag.var_cd8354e0.var_6392c3a2)
		{
			/#
				assert(isdefined(mocompanimflag.var_cd8354e0.var_10b8b6d1) && isdefined(mocompanimflag.var_cd8354e0.var_8b9a15a6));
			#/
			/#
				recordsphere(mocompanimflag.var_cd8354e0.var_cb28f380, 3, (0, 1, 0), "");
				recordsphere(mocompanimflag.var_cd8354e0.var_736d2cce, 3, (0, 0, 1), "");
			#/
			adjustedorigin = mocompanimflag.origin + (mocompanimflag.var_cd8354e0.var_10b8b6d1 * mocompanimflag.var_cd8354e0.var_8b9a15a6);
			mocompanimflag forceteleport(adjustedorigin);
		}
		else if(isdefined(mocompanimflag.enemy))
		{
			mocompanimflag orientmode("face enemy");
		}
	}
}

/*
	Name: function_b472ba3d
	Namespace: namespace_41b4e1ce
	Checksum: 0xC40BBFC6
	Offset: 0x39B0
	Size: 0xBE
	Parameters: 5
	Flags: Linked
*/
function function_b472ba3d(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	mocompduration.blockingpain = 0;
	mocompduration.usegoalanimweight = 0;
	mocompduration orientmode("face enemy");
	mocompduration collidewithactors(1);
	mocompduration clearpath();
	mocompduration pathmode("move delayed", 1, 0.2);
	mocompduration.var_cd8354e0 = undefined;
}

/*
	Name: function_270f7c3f
	Namespace: namespace_41b4e1ce
	Checksum: 0x45D28FC
	Offset: 0x3A78
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function function_270f7c3f(entity)
{
	entity clientfield::increment("nfrtu_leap_melee_rumb");
}

