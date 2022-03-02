#using script_164a456ce05c3483;
#using script_178024232e91b0a1;
#using script_17dcb1172e441bf6;
#using script_1b01e95a6b5270fd;
#using script_1ee011cd0961afd7;
#using script_2a5bf5b4a00cee0d;
#using script_2c5daa95f8fec03c;
#using script_35598499769dbb3d;
#using script_3819e7a1427df6d2;
#using script_3aa0f32b70d4f7cb;
#using script_3faf478d5b0850fe;
#using script_47851dbeea22fe66;
#using script_4bf952f6ba31bb17;
#using script_4d85e8de54b02198;
#using script_522aeb6ae906391e;
#using script_556e19065f09f8a2;
#using script_5701633066d199f2;
#using script_57f7003580bb15e0;
#using script_59f07c660e6710a5;
#using script_5f20d3b434d24884;
#using script_7b7ed6e4bc963a51;
#using script_caf007e2a98afa2;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\util_shared.gsc;

class class_9f07f58e 
{

	/*
		Name: constructor
		Namespace: namespace_9f07f58e
		Checksum: 0x7878B7A0
		Offset: 0x30E0
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
		Namespace: namespace_9f07f58e
		Checksum: 0x80F724D1
		Offset: 0x3108
		Size: 0x4
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

}

#namespace namespace_2a445563;

/*
	Name: function_79505e4a
	Namespace: namespace_2a445563
	Checksum: 0x54248F8D
	Offset: 0x458
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_79505e4a()
{
	level notify(1044288580);
}

/*
	Name: init
	Namespace: namespace_2a445563
	Checksum: 0x33304A81
	Offset: 0x478
	Size: 0x10C
	Parameters: 0
	Flags: Linked
*/
function init()
{
	clientfield::register("actor", "wrwlf_silver_death_fx", 1, 1, "int");
	clientfield::register("actor", "wrwlf_weakpoint_fx", 1, 2, "counter");
	clientfield::register("actor", "wrwlf_silver_hit_fx", 1, 1, "counter");
	clientfield::register("actor", "wrwlf_leap_attack_rumble", 1, 1, "counter");
	namespace_250e9486::function_252dff4d("werewolf", 18, &function_afc62ca5, undefined);
	registerbehaviorscriptfunctions();
	registerwerewolfinterfaceattributes();
}

/*
	Name: function_afc62ca5
	Namespace: namespace_2a445563
	Checksum: 0x1DEFCAAD
	Offset: 0x590
	Size: 0x38C
	Parameters: 0
	Flags: Linked
*/
function function_afc62ca5()
{
	namespace_250e9486::function_25b2c8a9();
	self namespace_250e9486::function_db744d28();
	self.var_9329a57c = 0;
	self.maxhealth = self.maxhealth + (250000 + (50000 * getplayers().size)) + (level.doa.var_6c58d51 * 300000);
	self.health = self.maxhealth;
	self.var_d04a8ee = 200;
	aiutility::addaioverridedamagecallback(self, &function_ebf85268);
	self.fovcosine = 0;
	self.fovcosinebusy = 0;
	self.fovcosinez = 0;
	self.var_1c8b76d3 = 1;
	self.no_gib = 1;
	self.var_1a60ad62 = 0;
	self.var_b7ba7211 = 0;
	self.var_9d9575a4 = 0;
	self.goalradius = 56;
	self.meleedistsq = sqr(64);
	self.var_ccb2e201 = 0;
	self.var_f46fbf3f = 1;
	self.ignorepathenemyfightdist = 1;
	self.var_ceed8829 = 1;
	self.var_7d39ec6a = 1;
	self callback::function_d8abfc3d(#"on_ai_killed", &function_f6db38ad);
	self setavoidancemask("avoid none");
	self collidewithactors(1);
	self function_11578581(70);
	self setblackboardattribute("_locomotion_speed", "locomotion_speed_walk");
	self setblackboardattribute("_werewolf_stance", "upright");
	self.ai.var_9465ce93 = gettime() + randomintrange(4500, 5500);
	self.var_c6213c58 = doa_enemy::function_d7c5adee("wolf_ghosthound");
	self namespace_e32bb68::function_3a59ec34("zmb_doa_ai_werewolf_vocal_summon");
	self thread namespace_9fc66ac::function_ba33d23d(#"hash_64aff27de2337435", #"hash_64aff27de2337435", #"hash_2b3a9f1a898594d7");
	target_set(self);
	self.var_651e2d9b = 0.7;
	earthquake(0.5, 0.75, self.origin, 1000);
	self namespace_83eb6304::function_3ecfde67("lightningStrike");
	self namespace_e32bb68::function_3a59ec34("evt_doa_lightning_bolt");
}

/*
	Name: function_f6db38ad
	Namespace: namespace_2a445563
	Checksum: 0x6649E1D8
	Offset: 0x928
	Size: 0xC
	Parameters: 1
	Flags: Linked
*/
function function_f6db38ad(params)
{
}

/*
	Name: registerwerewolfinterfaceattributes
	Namespace: namespace_2a445563
	Checksum: 0xC7D6E3BD
	Offset: 0x940
	Size: 0xB4
	Parameters: 0
	Flags: Linked
*/
function registerwerewolfinterfaceattributes()
{
	ai::registermatchedinterface(#"werewolf", #"patrol", 0, array(1, 0), &function_2341cdf0);
	ai::registermatchedinterface(#"werewolf", #"summon_wolves", 0, array(1, 0), &function_2c67c3e1);
}

/*
	Name: registerbehaviorscriptfunctions
	Namespace: namespace_2a445563
	Checksum: 0x41F1DB4
	Offset: 0xA00
	Size: 0xBAC
	Parameters: 0
	Flags: Linked, Private
*/
function private registerbehaviorscriptfunctions()
{
	/#
		assert(isscriptfunctionptr(&function_5565da55));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_2a3d640de0f32bb0", &function_5565da55);
	/#
		assert(isscriptfunctionptr(&function_6bfc7a5f));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_50eb50a32d0c4791", &function_6bfc7a5f);
	/#
		assert(isscriptfunctionptr(&werewolfshouldstun));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"werewolfshouldstun", &werewolfshouldstun);
	/#
		assert(isscriptfunctionptr(&werewolfidlestart));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"werewolfidlestart", &werewolfidlestart);
	/#
		assert(isscriptfunctionptr(&function_4014790a));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_5bd93c0cfe1ada6", &function_4014790a);
	/#
		assert(isscriptfunctionptr(&function_1917d76d));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_7d2da6c50e1bc111", &function_1917d76d);
	/#
		assert(isscriptfunctionptr(&function_f8912291));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_603662b9e4017e3f", &function_f8912291);
	/#
		assert(isscriptfunctionptr(&function_f5d7dc0a));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_6268b60dd4b1a7d4", &function_f5d7dc0a);
	/#
		assert(isscriptfunctionptr(&function_fcc1c537));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_6ce96736fe43832a", &function_fcc1c537);
	/#
		assert(isscriptfunctionptr(&function_f2e3495a));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_6f2cd3c4d5ecbf8d", &function_f2e3495a);
	/#
		assert(isscriptfunctionptr(&function_ee311142));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_1516ae5422f14ad8", &function_ee311142);
	/#
		assert(isscriptfunctionptr(&function_6488bc7e));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_28bbc81deeedc395", &function_6488bc7e);
	/#
		assert(isscriptfunctionptr(&function_ba605111));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_37194f1a33dd9fa9", &function_ba605111);
	/#
		assert(isscriptfunctionptr(&werewolfshouldreset));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"werewolfshouldreset", &werewolfshouldreset);
	/#
		assert(isscriptfunctionptr(&werewolfshouldshowpain));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"werewolfshouldshowpain", &werewolfshouldshowpain);
	/#
		assert(isscriptfunctionptr(&function_1ab1a5b3));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_2485d20310e0248c", &function_1ab1a5b3);
	/#
		assert(isscriptfunctionptr(&werewolfshouldmelee));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"werewolfshouldmelee", &werewolfshouldmelee);
	/#
		assert(isscriptfunctionptr(&function_9e901f61));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_3ac66a354287014b", &function_9e901f61);
	/#
		assert(isscriptfunctionptr(&function_da984f51));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_645ddbbfa8bea6f9", &function_da984f51);
	/#
		assert(isscriptfunctionptr(&function_7e2f67cf));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_5e3e49240f58c3fb", &function_7e2f67cf);
	/#
		assert(isscriptfunctionptr(&function_390c9423));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_45de1aecce571c1", &function_390c9423);
	/#
		assert(isscriptfunctionptr(&function_7a66357b));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_3bca879f16f06962", &function_7a66357b);
	/#
		assert(isscriptfunctionptr(&function_a5c42011));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_599e12fb160520d7", &function_a5c42011);
	animationstatenetwork::registernotetrackhandlerfunction("summon_wolves", &function_aa43003c);
	animationstatenetwork::registernotetrackhandlerfunction("werewolf_leap_melee", &function_fca0332e);
	animationstatenetwork::registernotetrackhandlerfunction("werewolf_disable_pain", &function_8690f1e9);
	animationstatenetwork::registernotetrackhandlerfunction("wrwlf_silver_death_fx", &function_b74b9f01);
	animationstatenetwork::registernotetrackhandlerfunction("werewolf_leap_rumble", &function_e980911c);
	animationstatenetwork::registernotetrackhandlerfunction("start_breakout", &function_dc05cd83);
	animationstatenetwork::registernotetrackhandlerfunction("end_breakout", &function_2d5048be);
	/#
		assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
	#/
	/#
		assert(!isdefined(&function_8ddb1128) || isscriptfunctionptr(&function_8ddb1128));
	#/
	/#
		assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction(#"hash_4f16c6f87860a582", undefined, &function_8ddb1128, undefined);
	animationstatenetwork::registeranimationmocomp("mocomp_werewolf_leap_attack", &function_7ad7aa7d, &function_8b63ee0e, &function_76968111);
}

/*
	Name: werewolfshouldstun
	Namespace: namespace_2a445563
	Checksum: 0xC9079AC5
	Offset: 0x15B8
	Size: 0x48
	Parameters: 1
	Flags: Linked
*/
function werewolfshouldstun(entity)
{
	if(namespace_250e9486::function_32353f6e(entity) && function_833670b7(entity))
	{
		return true;
	}
	return false;
}

/*
	Name: function_833670b7
	Namespace: namespace_2a445563
	Checksum: 0x93B7C7F4
	Offset: 0x1608
	Size: 0xC8
	Parameters: 1
	Flags: Linked, Private
*/
function private function_833670b7(entity)
{
	var_7a69f7e9 = blackboard::getblackboardevents("wrwlf_stun");
	if(isdefined(var_7a69f7e9) && var_7a69f7e9.size)
	{
		foreach(event in var_7a69f7e9)
		{
			if(event.werewolf === entity)
			{
				return false;
			}
		}
	}
	return true;
}

/*
	Name: function_5565da55
	Namespace: namespace_2a445563
	Checksum: 0x9C687D03
	Offset: 0x16D8
	Size: 0x8A
	Parameters: 1
	Flags: Linked
*/
function function_5565da55(entity)
{
	namespace_250e9486::stunstart(entity);
	var_268f1415 = spawnstruct();
	var_268f1415.werewolf = entity;
	blackboard::addblackboardevent("wrwlf_stun", var_268f1415, randomintrange(10000, 12000));
	entity.var_cc2d7568 = 1;
}

/*
	Name: function_8ddb1128
	Namespace: namespace_2a445563
	Checksum: 0xF2F99BFD
	Offset: 0x1770
	Size: 0x38
	Parameters: 2
	Flags: Linked, Private
*/
function private function_8ddb1128(entity, asmstatename)
{
	if(asmstatename ai::is_stunned())
	{
		return 5;
	}
	return 4;
}

/*
	Name: function_6bfc7a5f
	Namespace: namespace_2a445563
	Checksum: 0x2479ECFB
	Offset: 0x17B0
	Size: 0x2E
	Parameters: 1
	Flags: Linked
*/
function function_6bfc7a5f(entity)
{
	namespace_250e9486::function_de68bf47(entity);
	entity.var_cc2d7568 = 0;
}

/*
	Name: werewolfidlestart
	Namespace: namespace_2a445563
	Checksum: 0x7AD5E724
	Offset: 0x17E8
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function werewolfidlestart(entity)
{
	if(is_true(entity.var_cc2d7568))
	{
		entity.var_cc2d7568 = 0;
		if(entity getpathmode() == "dont move")
		{
			entity pathmode("move allowed");
		}
	}
}

/*
	Name: function_dc05cd83
	Namespace: namespace_2a445563
	Checksum: 0xD8A4DC13
	Offset: 0x1860
	Size: 0x1A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_dc05cd83(entity)
{
	self.var_2037a949 = 1;
}

/*
	Name: function_2d5048be
	Namespace: namespace_2a445563
	Checksum: 0xE2CAA71
	Offset: 0x1888
	Size: 0x16
	Parameters: 1
	Flags: Linked, Private
*/
function private function_2d5048be(entity)
{
	self.var_2037a949 = 0;
}

/*
	Name: function_ebf85268
	Namespace: namespace_2a445563
	Checksum: 0xFA029BBA
	Offset: 0x18A8
	Size: 0x4B0
	Parameters: 13
	Flags: Linked, Private
*/
function private function_ebf85268(inflictor, attacker, damage, idflags, meansofdeath, weapon, var_fd90b0bb, point, dir, hitloc, offsettime, boneindex, modelindex)
{
	if(isdefined(point) && self === point)
	{
		dir = 0;
	}
	var_786d7e06 = namespace_250e9486::function_422fdfd4(self, point, hitloc, modelindex, boneindex, offsettime);
	final_damage = int(dir * var_786d7e06.damage_scale);
	var_934e9dce = isdefined(var_786d7e06.var_84ed9a13) && is_true(var_786d7e06.registerzombie_bgb_used_reinforce) && isdefined(point) && isplayer(point);
	if(var_934e9dce)
	{
		self.var_265cb589 = 1;
		self.var_4bb78ac7 = gettime() + 1000;
		point playhitmarker(undefined, 5, undefined, 1, 0);
		if(var_786d7e06.var_84ed9a13.var_51e8b151 === "tag_chest_ws")
		{
			clientfield::increment("wrwlf_weakpoint_fx", 1);
		}
		else
		{
			clientfield::increment("wrwlf_weakpoint_fx", 2);
		}
	}
	else
	{
		if(isdefined(self.var_4bb78ac7) && gettime() < self.var_4bb78ac7)
		{
			self.var_265cb589 = 1;
		}
		else
		{
			self.var_265cb589 = 0;
		}
	}
	if(isdefined(self.var_c59e2dbf))
	{
		self.var_c59e2dbf = self.var_c59e2dbf + final_damage;
	}
	else
	{
		self.var_c59e2dbf = final_damage;
	}
	if(!is_true(self.var_48baa747) && !is_true(self.var_e9ed8a62) && self.var_c59e2dbf > (self.maxhealth * (self ai::function_9139c839().var_96b9b674 / 100)))
	{
		if(self.var_b7ba7211 < gettime() && hasasm(self) && self function_ebbebf56() >= 1)
		{
			self.var_1cfbbe3d = 1;
		}
		self.var_c59e2dbf = 0;
	}
	if(isdefined(point) && isplayer(point))
	{
		if(is_true(var_934e9dce) && is_true(self.var_48baa747) && is_true(self.var_2037a949) && hasasm(self) && self function_ebbebf56() >= 1)
		{
			self.var_1cfbbe3d = 1;
			self.blockingpain = 0;
		}
		if(gettime() >= self.ai.var_9465ce93)
		{
			self.ai.var_9465ce93 = gettime() + randomintrange(4500, 5500);
			self.var_125e7ef = 1;
			self clientfield::increment("wrwlf_silver_hit_fx");
		}
	}
	var_799e18e5 = offsettime;
	var_5f32808d = 1;
	if(dir >= 1000)
	{
		var_5f32808d = 2;
	}
	self namespace_ec06fe4a::function_2f4b0f9(self.health, point, var_799e18e5, dir, var_5f32808d);
	return final_damage;
}

/*
	Name: function_7e2f67cf
	Namespace: namespace_2a445563
	Checksum: 0x72F8FB2C
	Offset: 0x1D60
	Size: 0x84
	Parameters: 1
	Flags: Linked
*/
function function_7e2f67cf(entity)
{
	currentstance = entity getblackboardattribute("_werewolf_stance");
	if(currentstance == "upright" && is_true(self.var_125e7ef))
	{
		self.var_125e7ef = 0;
		return true;
	}
	self.var_125e7ef = 0;
	return false;
}

/*
	Name: function_390c9423
	Namespace: namespace_2a445563
	Checksum: 0x192348FC
	Offset: 0x1DF0
	Size: 0x50
	Parameters: 1
	Flags: Linked, Private
*/
function private function_390c9423(entity)
{
	currentstance = entity getblackboardattribute("_werewolf_stance");
	if(currentstance == "upright")
	{
		return true;
	}
	return false;
}

/*
	Name: function_7a66357b
	Namespace: namespace_2a445563
	Checksum: 0x5A9C7D31
	Offset: 0x1E48
	Size: 0x2E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_7a66357b(entity)
{
	if(is_true(entity.var_1cfbbe3d))
	{
		return true;
	}
	return false;
}

/*
	Name: function_da984f51
	Namespace: namespace_2a445563
	Checksum: 0x6FE598F4
	Offset: 0x1E80
	Size: 0x2E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_da984f51(entity)
{
	if(is_true(entity.var_e0f90289))
	{
		return true;
	}
	return false;
}

/*
	Name: werewolfshouldreset
	Namespace: namespace_2a445563
	Checksum: 0x96A9285A
	Offset: 0x1EB8
	Size: 0x2E
	Parameters: 1
	Flags: Linked, Private
*/
function private werewolfshouldreset(entity)
{
	if(is_true(entity.var_1cfbbe3d))
	{
		return true;
	}
	return false;
}

/*
	Name: werewolfshouldshowpain
	Namespace: namespace_2a445563
	Checksum: 0xC915EBA
	Offset: 0x1EF0
	Size: 0x80
	Parameters: 1
	Flags: Linked, Private
*/
function private werewolfshouldshowpain(entity)
{
	if(function_7a66357b(entity))
	{
		return true;
	}
	if(!werewolfshouldmelee(entity) && btapi_locomotionbehaviorcondition(entity) && function_390c9423(entity))
	{
		return true;
	}
	return false;
}

/*
	Name: function_4014790a
	Namespace: namespace_2a445563
	Checksum: 0x4FF2C7C8
	Offset: 0x1F78
	Size: 0x94
	Parameters: 1
	Flags: Linked, Private
*/
function private function_4014790a(entity)
{
	entity.var_1cfbbe3d = undefined;
	entity.var_b7ba7211 = gettime() + (int(entity ai::function_9139c839().var_bd87ef4d * 1000));
	entity.blockingpain = 1;
	entity namespace_e32bb68::function_3a59ec34("zmb_doa_ai_werewolf_vocal_pain");
	function_43f02cf0(entity);
}

/*
	Name: function_1917d76d
	Namespace: namespace_2a445563
	Checksum: 0xD2F4E632
	Offset: 0x2018
	Size: 0x34
	Parameters: 1
	Flags: Linked, Private
*/
function private function_1917d76d(entity)
{
	entity.blockingpain = 0;
	entity pathmode("move allowed");
}

/*
	Name: function_8690f1e9
	Namespace: namespace_2a445563
	Checksum: 0x48D47517
	Offset: 0x2058
	Size: 0x1A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_8690f1e9(entity)
{
	entity.var_e9ed8a62 = 1;
}

/*
	Name: function_b74b9f01
	Namespace: namespace_2a445563
	Checksum: 0xB766C11C
	Offset: 0x2080
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function function_b74b9f01(entity)
{
	self clientfield::set("wrwlf_silver_death_fx", 1);
	self thread function_fc2777d9();
}

/*
	Name: function_fc2777d9
	Namespace: namespace_2a445563
	Checksum: 0x6E567C
	Offset: 0x20D0
	Size: 0x24
	Parameters: 0
	Flags: Linked, Private
*/
function private function_fc2777d9()
{
	wait(3);
	if(isdefined(self))
	{
		self delete();
	}
}

/*
	Name: function_2341cdf0
	Namespace: namespace_2a445563
	Checksum: 0x1E34AFA9
	Offset: 0x2100
	Size: 0x60
	Parameters: 4
	Flags: Linked
*/
function function_2341cdf0(entity, attribute, oldvalue, value)
{
	attribute.b_ignore_cleanup = value;
	if(value == 0 && oldvalue != value)
	{
		attribute notify(#"hash_1783be2ff62b582c");
	}
}

/*
	Name: stop_patrol
	Namespace: namespace_2a445563
	Checksum: 0x2F459302
	Offset: 0x2168
	Size: 0x60
	Parameters: 1
	Flags: None
*/
function stop_patrol(entity)
{
	if(entity ai::has_behavior_attribute("patrol"))
	{
		entity ai::set_behavior_attribute("patrol", 0);
	}
	entity notify(#"stop_patrol");
}

/*
	Name: function_4b392ea3
	Namespace: namespace_2a445563
	Checksum: 0x11C5A152
	Offset: 0x21D0
	Size: 0x16E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_4b392ea3(entity)
{
	if(entity function_ebbebf56() != 1)
	{
		return false;
	}
	if(isdefined(entity.ai.var_d6cd1d4e))
	{
		if(gettime() < entity.ai.var_d6cd1d4e)
		{
			return false;
		}
	}
	var_34529779 = blackboard::getblackboardevents("wrlf_stance_change");
	if(isdefined(var_34529779) && var_34529779.size)
	{
		foreach(var_462d3042 in var_34529779)
		{
			if(isdefined(var_462d3042.data.pos) && distancesquared(var_462d3042.data.pos, entity.origin) <= sqr(800))
			{
				return false;
			}
		}
	}
	return true;
}

/*
	Name: function_a5c42011
	Namespace: namespace_2a445563
	Checksum: 0x65D69455
	Offset: 0x2348
	Size: 0x284
	Parameters: 1
	Flags: Linked, Private
*/
function private function_a5c42011(entity)
{
	currentstance = entity getblackboardattribute("_werewolf_stance");
	desiredstance = currentstance;
	pathgoalpos = entity.pathgoalpos;
	if(function_4b392ea3(entity))
	{
		if(isdefined(pathgoalpos))
		{
			distsq = distancesquared(entity.origin, pathgoalpos);
			if(currentstance == "upright" && distsq > sqr(entity ai::function_9139c839().var_ed83d6e9))
			{
				desiredstance = "quad";
				self allowpitchangle(1);
				self setpitchorient();
			}
			else if(currentstance == "quad" && distsq < sqr(entity ai::function_9139c839().var_e5f93adc))
			{
				desiredstance = "upright";
				self allowpitchangle(0);
				self clearpitchorient();
			}
		}
		else
		{
			desiredstance = "upright";
		}
		entity.ai.var_d6cd1d4e = gettime() + (int(entity ai::function_9139c839().var_6d4b0dd6 * 1000));
		entity setblackboardattribute("_werewolf_stance", desiredstance);
		var_462d3042 = spawnstruct();
		var_462d3042.pos = entity.origin;
		blackboard::addblackboardevent("wrlf_stance_change", var_462d3042, randomintrange(1000, 5000));
	}
}

/*
	Name: function_6488bc7e
	Namespace: namespace_2a445563
	Checksum: 0x471C9B1
	Offset: 0x25D8
	Size: 0x1CC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_6488bc7e(entity)
{
	zombies = getaiteamarray("axis");
	zombies = arraysortclosest(zombies, entity.origin, undefined, 0, entity getpathfindingradius() + 20);
	var_31a419e0 = [];
	foreach(zombie in zombies)
	{
		if(is_true(zombie.basic))
		{
			if(!isdefined(var_31a419e0))
			{
				var_31a419e0 = [];
			}
			else if(!isarray(var_31a419e0))
			{
				var_31a419e0 = array(var_31a419e0);
			}
			var_31a419e0[var_31a419e0.size] = zombie;
		}
	}
	foreach(zombie in var_31a419e0)
	{
		zombie namespace_250e9486::setup_zombie_knockdown(entity);
	}
	return true;
}

/*
	Name: function_ee311142
	Namespace: namespace_2a445563
	Checksum: 0xD41163B9
	Offset: 0x27B0
	Size: 0x10
	Parameters: 1
	Flags: Linked, Private
*/
function private function_ee311142(entity)
{
	return true;
}

/*
	Name: function_ba605111
	Namespace: namespace_2a445563
	Checksum: 0x117D63EE
	Offset: 0x27C8
	Size: 0x10
	Parameters: 1
	Flags: Linked, Private
*/
function private function_ba605111(entity)
{
	return true;
}

/*
	Name: function_f5d7dc0a
	Namespace: namespace_2a445563
	Checksum: 0x68917B4E
	Offset: 0x27E0
	Size: 0x70
	Parameters: 1
	Flags: Linked, Private
*/
function private function_f5d7dc0a(entity)
{
	var_3bfe8ebe = spawnstruct();
	var_3bfe8ebe.enemy = entity.enemy;
	blackboard::addblackboardevent("vlf_melee_event", var_3bfe8ebe, randomintrange(6000, 8500));
	return true;
}

/*
	Name: function_e84f3864
	Namespace: namespace_2a445563
	Checksum: 0x118EBEA6
	Offset: 0x2858
	Size: 0xEC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_e84f3864(entity)
{
	if(!isdefined(entity.enemy))
	{
		return false;
	}
	var_33f55f67 = blackboard::getblackboardevents("vlf_melee_event");
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
	Name: werewolfshouldmelee
	Namespace: namespace_2a445563
	Checksum: 0x88C5AA12
	Offset: 0x2950
	Size: 0x60
	Parameters: 1
	Flags: Linked, Private
*/
function private werewolfshouldmelee(entity)
{
	if(!function_2801a911(entity))
	{
		return false;
	}
	if(btapi_shouldnormalmelee(entity) || function_9e901f61(entity))
	{
		return true;
	}
	return false;
}

/*
	Name: function_2801a911
	Namespace: namespace_2a445563
	Checksum: 0xA3E0320E
	Offset: 0x29B8
	Size: 0x7A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_2801a911(entity)
{
	if(entity.ignoreall)
	{
		return false;
	}
	if(!isdefined(entity.enemy))
	{
		return false;
	}
	if(abs(entity.enemy.origin[2] - entity.origin[2]) > 64)
	{
		return false;
	}
	return true;
}

/*
	Name: function_6cde7a8b
	Namespace: namespace_2a445563
	Checksum: 0x5003EF7A
	Offset: 0x2A40
	Size: 0x98
	Parameters: 2
	Flags: Linked, Private
*/
function private function_6cde7a8b(entity, predictedenemypos)
{
	enemypos = entity.enemy.origin;
	if(isdefined(predictedenemypos))
	{
		enemypos = predictedenemypos;
	}
	dirtoenemy = vectornormalize(enemypos - entity.origin);
	dirtoenemy = vectornormalize(dirtoenemy);
	return enemypos + ((dirtoenemy * -1) * 45);
}

/*
	Name: function_93211521
	Namespace: namespace_2a445563
	Checksum: 0x1658AAF
	Offset: 0x2AE0
	Size: 0xC8
	Parameters: 2
	Flags: Linked, Private
*/
function private function_93211521(entity, var_856465ed)
{
	vectoenemy = var_856465ed - entity.origin;
	var_c43ad98d = entity.origin + vectorscale(vectoenemy, 0.5);
	results = physicstraceex(var_c43ad98d, var_c43ad98d + vectorscale((0, 0, 1), 120), (-15, -15, -5), (15, 15, 5), self);
	if(results[#"fraction"] == 1)
	{
		return true;
	}
	return false;
}

/*
	Name: function_9e901f61
	Namespace: namespace_2a445563
	Checksum: 0x3782A93
	Offset: 0x2BB0
	Size: 0x2FA
	Parameters: 1
	Flags: Linked, Private
*/
function private function_9e901f61(entity)
{
	if(entity function_ebbebf56() != 1)
	{
		return false;
	}
	if(entity.ignoreall)
	{
		return false;
	}
	if(!isdefined(entity.enemy))
	{
		return false;
	}
	if(!function_e84f3864(entity))
	{
		return false;
	}
	if(isdefined(entity.enemy))
	{
		var_856465ed = function_6cde7a8b(entity);
		distancesq = distancesquared(entity.origin, var_856465ed);
		if(!ispointonnavmesh(entity.enemy.origin, entity.enemy))
		{
			return false;
		}
		if(!ispointonnavmesh(entity.enemy.origin, entity))
		{
			return false;
		}
		if(!ispointonnavmesh(var_856465ed, 60))
		{
			return false;
		}
		if(!ispointonnavmesh(var_856465ed, entity.enemy))
		{
			return false;
		}
		if(abs(entity.origin[2] - entity.enemy.origin[2]) > 64)
		{
			return false;
		}
		if(abs(entity.origin[2] - var_856465ed[2]) > 64)
		{
			return false;
		}
		if(distancesq < sqr(entity ai::function_9139c839().var_2a25aee8))
		{
			return false;
		}
		if(distancesq > sqr(entity ai::function_9139c839().var_bacb44ae))
		{
			return false;
		}
		if(!tracepassedonnavmesh(entity.origin, var_856465ed, entity getpathfindingradius()))
		{
			return false;
		}
		if(!util::within_fov(self.origin, self.angles, var_856465ed, cos(40)))
		{
			return false;
		}
		if(!function_93211521(entity, var_856465ed))
		{
			return false;
		}
		return true;
	}
	return false;
}

/*
	Name: function_fca0332e
	Namespace: namespace_2a445563
	Checksum: 0x2992868B
	Offset: 0x2EB8
	Size: 0x1C4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_fca0332e(entity)
{
	if(entity.ignoreall)
	{
		return;
	}
	if(!isdefined(entity.enemy))
	{
		return;
	}
	if(entity.enemy.ignoreme)
	{
		return;
	}
	radiusdamage(entity.origin, 48, 15, 5, entity, "MOD_MELEE");
	zombies = getaiarchetypearray(#"zombie", "axis");
	zombies = arraysortclosest(zombies, self.origin + ((anglestoforward(self.angles) * 65) * 0.5), undefined, undefined, self getpathfindingradius() + 65);
	foreach(zombie in zombies)
	{
		zombie namespace_250e9486::setup_zombie_knockdown(self);
		zombie.knockdown_type = "knockdown_stun";
	}
	entity melee(anglestoforward(entity.angles));
}

/*
	Name: function_e980911c
	Namespace: namespace_2a445563
	Checksum: 0x46789C7C
	Offset: 0x3088
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_e980911c(entity)
{
	entity clientfield::increment("wrwlf_leap_attack_rumble");
}

/*
	Name: function_f2e3495a
	Namespace: namespace_2a445563
	Checksum: 0x2FA5F190
	Offset: 0x30C0
	Size: 0x16
	Parameters: 1
	Flags: Linked, Private
*/
function private function_f2e3495a(entity)
{
	entity.var_e9ed8a62 = undefined;
}

/*
	Name: function_7ad7aa7d
	Namespace: namespace_2a445563
	Checksum: 0xEC47EB0
	Offset: 0x31A0
	Size: 0x232
	Parameters: 5
	Flags: Linked, Private
*/
function private function_7ad7aa7d(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	mocompanimflag animmode("gravity", 1);
	mocompanimflag orientmode("face angle", mocompanimflag.angles[1]);
	mocompanimflag.blockingpain = 1;
	mocompanimflag.takedamage = 0;
	mocompanimflag.usegoalanimweight = 1;
	mocompanimflag pathmode("dont move");
	mocompanimflag collidewithactors(0);
	mocompanimflag.var_b736fc8b = 1;
	if(isdefined(mocompanimflag.enemy))
	{
		dirtoenemy = vectornormalize(mocompanimflag.enemy.origin - mocompanimflag.origin);
		mocompanimflag forceteleport(mocompanimflag.origin, vectortoangles(dirtoenemy));
	}
	if(!isdefined(self.var_cd8354e0))
	{
		self.var_cd8354e0 = new class_9f07f58e();
		self.var_cd8354e0.var_9bfa8497 = mocompanimflag.origin;
		self.var_cd8354e0.var_98bc84b7 = getnotetracktimes(mocompduration, "start_procedural")[0];
		self.var_cd8354e0.var_6392c3a2 = getnotetracktimes(mocompduration, "stop_procedural")[0];
		var_e397f54c = getmovedelta(mocompduration, 0, 1);
		self.var_cd8354e0.var_cb28f380 = mocompanimflag localtoworldcoords(var_e397f54c);
	}
}

/*
	Name: function_8b63ee0e
	Namespace: namespace_2a445563
	Checksum: 0xEC3333FC
	Offset: 0x33E0
	Size: 0x9D4
	Parameters: 5
	Flags: Linked
*/
function function_8b63ee0e(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	if(mocompanimflag.health <= 0)
	{
		return;
	}
	/#
		assert(isdefined(mocompanimflag.var_cd8354e0));
	#/
	var_e72a224a = mocompanimflag getanimtime(mocompduration);
	zombies = getaiarchetypearray(#"zombie", "axis");
	zombies = arraysortclosest(zombies, mocompanimflag.origin, undefined, 0, mocompanimflag getpathfindingradius() + 15);
	var_7bfb4133 = 0;
	foreach(zombie in zombies)
	{
		if(is_true(zombie.knockdown))
		{
			continue;
		}
		zombie namespace_250e9486::setup_zombie_knockdown(mocompanimflag);
		var_7bfb4133++;
		if(var_7bfb4133 >= 5)
		{
			break;
		}
	}
	if(isdefined(mocompanimflag.enemy) && !mocompanimflag.var_cd8354e0.adjustmentstarted && mocompanimflag.var_cd8354e0.var_425c4c8b && var_e72a224a >= mocompanimflag.var_cd8354e0.var_98bc84b7)
	{
		predictedenemypos = mocompanimflag.enemy.origin;
		var_856465ed = function_6cde7a8b(mocompanimflag, predictedenemypos);
		mocompanimflag.var_cd8354e0.var_736d2cce = var_856465ed;
		var_cc075bd0 = vectornormalize(mocompanimflag.origin - mocompanimflag.var_cd8354e0.var_736d2cce);
		var_cf699df5 = distancesquared(mocompanimflag.var_cd8354e0.var_9bfa8497, mocompanimflag.var_cd8354e0.var_cb28f380);
		var_776ddabf = distancesquared(mocompanimflag.var_cd8354e0.var_cb28f380, mocompanimflag.var_cd8354e0.var_736d2cce);
		var_65cbfb52 = distancesquared(mocompanimflag.var_cd8354e0.var_9bfa8497, mocompanimflag.var_cd8354e0.var_736d2cce);
		var_201660e6 = tracepassedonnavmesh(mocompanimflag.var_cd8354e0.var_9bfa8497, mocompanimflag.var_cd8354e0.var_736d2cce, mocompanimflag getpathfindingradius());
		traceresult = bullettrace(mocompanimflag.origin, mocompanimflag.var_cd8354e0.var_736d2cce + vectorscale((0, 0, 1), 30), 0, mocompanimflag);
		isvisible = traceresult[#"fraction"] == 1;
		var_535d098c = 0;
		if(isdefined(traceresult[#"hitloc"]) && traceresult[#"hitloc"] == "riotshield")
		{
			mocompanimflag.var_cd8354e0.var_736d2cce = mocompanimflag.var_cd8354e0.var_736d2cce + vectorscale(var_cc075bd0, 50);
			var_535d098c = 1;
		}
		if(!var_201660e6)
		{
			mocompanimflag.var_cd8354e0.var_425c4c8b = 0;
		}
		else
		{
			if(var_cf699df5 > var_65cbfb52 && var_776ddabf >= sqr(mocompanimflag ai::function_9139c839().var_d781a7cc))
			{
				mocompanimflag.var_cd8354e0.var_425c4c8b = 0;
			}
			else if(var_776ddabf >= sqr(mocompanimflag ai::function_9139c839().var_e49498dc))
			{
				mocompanimflag.var_cd8354e0.var_425c4c8b = 0;
			}
		}
		if(var_535d098c)
		{
			mocompanimflag.var_cd8354e0.var_425c4c8b = 1;
		}
		if(mocompanimflag.var_cd8354e0.var_425c4c8b)
		{
			var_776ddabf = distancesquared(mocompanimflag.var_cd8354e0.var_cb28f380, mocompanimflag.var_cd8354e0.var_736d2cce);
			var_beabc994 = anglestoforward(mocompanimflag.angles);
			var_1c3641f2 = (var_856465ed[0], var_856465ed[1], mocompanimflag.origin[2]);
			dirtoenemy = vectornormalize(var_1c3641f2 - mocompanimflag.origin);
			zdiff = mocompanimflag.var_cd8354e0.var_cb28f380[2] - var_856465ed[2];
			var_6738a702 = abs(zdiff) <= mocompanimflag ai::function_9139c839().var_3c41cb92;
			var_175919d1 = vectordot(var_beabc994, dirtoenemy) > mocompanimflag ai::function_9139c839().var_e2b09972;
			var_7948b2f3 = var_6738a702 && var_175919d1;
			var_425c4c8b = isvisible || var_535d098c && var_7948b2f3;
			if(var_425c4c8b)
			{
				var_90c3cdd2 = length(mocompanimflag.var_cd8354e0.var_736d2cce - mocompanimflag.var_cd8354e0.var_cb28f380);
				timestep = function_60d95f53();
				animlength = getanimlength(mocompduration) * 1000;
				starttime = mocompanimflag.var_cd8354e0.var_98bc84b7 * animlength;
				stoptime = mocompanimflag.var_cd8354e0.var_6392c3a2 * animlength;
				starttime = floor(starttime / timestep);
				stoptime = floor(stoptime / timestep);
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
	Name: function_76968111
	Namespace: namespace_2a445563
	Checksum: 0xCCF4A4A5
	Offset: 0x3DC0
	Size: 0xDA
	Parameters: 5
	Flags: Linked
*/
function function_76968111(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	mocompduration.takedamage = 1;
	mocompduration.blockingpain = 0;
	mocompduration.usegoalanimweight = 0;
	mocompduration clearpath();
	mocompduration orientmode("face enemy");
	mocompduration pathmode("move delayed", 1, 0.2);
	mocompduration collidewithactors(1);
	mocompduration.var_cd8354e0 = undefined;
	mocompduration.var_b736fc8b = 0;
}

/*
	Name: function_e1743aa
	Namespace: namespace_2a445563
	Checksum: 0x3481748B
	Offset: 0x3EA8
	Size: 0x1BC
	Parameters: 1
	Flags: Linked
*/
function function_e1743aa(entity)
{
	right = anglestoright(entity.angles) * 50;
	point = getclosestpointonnavmesh(entity.origin + right, 80);
	if(isdefined(point))
	{
		doa_enemy::function_a6b807ea(entity.var_c6213c58, 1, point, 0, undefined, entity.enemy);
	}
	if(math::cointoss())
	{
		point = getclosestpointonnavmesh(entity.origin - right, 80);
		doa_enemy::function_a6b807ea(entity.var_c6213c58, 1, point, 0, undefined, entity.enemy);
	}
	if(getplayers().size > 1)
	{
		if(isdefined(point))
		{
			doa_enemy::function_a6b807ea(entity.var_c6213c58, 1, point, 0, undefined, entity.enemy);
		}
		if(math::cointoss())
		{
			point = getclosestpointonnavmesh(entity.origin - right, 80);
			doa_enemy::function_a6b807ea(entity.var_c6213c58, 1, point, 0, undefined, entity.enemy);
		}
	}
}

/*
	Name: function_2c67c3e1
	Namespace: namespace_2a445563
	Checksum: 0xAB5693C
	Offset: 0x4070
	Size: 0x32
	Parameters: 4
	Flags: Linked
*/
function function_2c67c3e1(entity, attribute, oldvalue, value)
{
	oldvalue.summon_wolves = value;
}

/*
	Name: function_43f02cf0
	Namespace: namespace_2a445563
	Checksum: 0x9C375B7C
	Offset: 0x40B0
	Size: 0xE2
	Parameters: 1
	Flags: Linked, Private
*/
function private function_43f02cf0(entity)
{
	if(is_true(entity.summon_wolves))
	{
		return false;
	}
	if(entity function_ebbebf56() != 1)
	{
		return false;
	}
	if(entity.health / entity.maxhealth > entity ai::function_9139c839().var_8c0e8cfb / 100)
	{
		return false;
	}
	if(entity.var_1a60ad62 > gettime())
	{
		return false;
	}
	if(function_21a3a673(0, 100) < entity ai::function_9139c839().var_d9838997)
	{
		entity.summon_wolves = 1;
	}
}

/*
	Name: function_1ab1a5b3
	Namespace: namespace_2a445563
	Checksum: 0xACC5B511
	Offset: 0x41A0
	Size: 0x22
	Parameters: 1
	Flags: Linked, Private
*/
function private function_1ab1a5b3(entity)
{
	return is_true(entity.summon_wolves);
}

/*
	Name: function_f8912291
	Namespace: namespace_2a445563
	Checksum: 0x1B2884C7
	Offset: 0x41D0
	Size: 0x74
	Parameters: 1
	Flags: Linked, Private
*/
function private function_f8912291(entity)
{
	entity.var_48baa747 = 1;
	entity.summon_wolves = undefined;
	entity.var_1a60ad62 = gettime() + entity ai::function_9139c839().var_fe050356;
	entity.blockingpain = 1;
	entity namespace_e32bb68::function_3a59ec34("zmb_doa_ai_werewolf_vocal_summon");
}

/*
	Name: function_fcc1c537
	Namespace: namespace_2a445563
	Checksum: 0xA4BFB9F9
	Offset: 0x4250
	Size: 0x92
	Parameters: 1
	Flags: Linked, Private
*/
function private function_fcc1c537(entity)
{
	entity.var_48baa747 = 0;
	entity.ai.var_d6cd1d4e = gettime() + (int(entity ai::function_9139c839().var_6d4b0dd6 * 1000));
	entity.var_1a60ad62 = gettime() + entity ai::function_9139c839().var_fe050356;
	entity.blockingpain = 0;
}

/*
	Name: function_aa43003c
	Namespace: namespace_2a445563
	Checksum: 0x491F8FA2
	Offset: 0x42F0
	Size: 0xBC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_aa43003c(entity)
{
	var_c59b482e = self.maxhealth * (0.1 + (0.1 * getplayers().size));
	self.health = int(min(self.health + var_c59b482e, self.maxhealth));
	self thread namespace_ec06fe4a::function_2f4b0f9(self.health);
	function_e1743aa(entity);
}

