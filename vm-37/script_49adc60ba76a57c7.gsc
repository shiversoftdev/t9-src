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
#using script_3f9e0dc8454d98e1;
#using script_47851dbeea22fe66;
#using script_489b835a247c990e;
#using script_4bf952f6ba31bb17;
#using script_4d85e8de54b02198;
#using script_522aeb6ae906391e;
#using script_5701633066d199f2;
#using script_57f7003580bb15e0;
#using script_59f07c660e6710a5;
#using script_5f20d3b434d24884;
#using script_67e37e63e177f107;
#using script_7b7ed6e4bc963a51;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\statemachine_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\vehicle_ai_shared.gsc;

class class_a504b9a3 
{

	/*
		Name: constructor
		Namespace: namespace_a504b9a3
		Checksum: 0x7DA26F64
		Offset: 0x3768
		Size: 0x3E
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
		self.var_9ab05afa = 0;
		self.var_6392c3a2 = 0;
		self.var_190509f3 = 0;
		self.var_9177748f = gettime();
		self.var_fadcdbaf = gettime();
	}

	/*
		Name: destructor
		Namespace: namespace_a504b9a3
		Checksum: 0x80F724D1
		Offset: 0x37B0
		Size: 0x4
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

}

#namespace namespace_2e61cc4b;

/*
	Name: init
	Namespace: namespace_2e61cc4b
	Checksum: 0xB4EDE0B3
	Offset: 0x5B8
	Size: 0x91C
	Parameters: 0
	Flags: Linked
*/
function init()
{
	namespace_250e9486::function_252dff4d("elephant", 26, &function_295c9975, &function_238b5fdc);
	clientfield::register("actor", "towers_boss_melee_effect", 1, 1, "counter");
	clientfield::register("actor", "tower_boss_death_fx", 1, 1, "counter");
	clientfield::register("actor", "towers_boss_eye_fx_cf", 1, 2, "int");
	clientfield::register("actor", "boss_death_rob", 1, 2, "int");
	clientfield::register("scriptmover", "entrails_model_cf", 1, 1, "int");
	clientfield::register("scriptmover", "towers_boss_head_proj_fx_cf", 1, 1, "int");
	clientfield::register("scriptmover", "towers_boss_head_proj_explosion_fx_cf", 1, 1, "int");
	/#
		assert(isscriptfunctionptr(&function_2c58bc39));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_2f6e4a95b8974fcd", &function_2c58bc39);
	/#
		assert(isscriptfunctionptr(&function_10a75bb7));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_40d6b5994b49d7aa", &function_10a75bb7);
	/#
		assert(isscriptfunctionptr(&function_d3d560e9));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_9188ed9ed594c69", &function_d3d560e9);
	/#
		assert(isscriptfunctionptr(&elephantknockdownservice));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"elephantknockdownservice", &elephantknockdownservice);
	/#
		assert(isscriptfunctionptr(&function_5db0f49a));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_7aace3e67f786b19", &function_5db0f49a);
	/#
		assert(isscriptfunctionptr(&function_1c0db2ec));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_a14b98894f1d688", &function_1c0db2ec);
	/#
		assert(isscriptfunctionptr(&function_18e1bf30));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_4b225936ae91a204", &function_18e1bf30);
	/#
		assert(isscriptfunctionptr(&elephantshouldmelee));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"elephantshouldmelee", &elephantshouldmelee);
	/#
		assert(isscriptfunctionptr(&elephantshouldmelee));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"elephantshouldmelee", &elephantshouldmelee);
	/#
		assert(isscriptfunctionptr(&function_9c076ff9));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_2cab44d162eb9a83", &function_9c076ff9);
	/#
		assert(isscriptfunctionptr(&function_69faa74));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_597ef06035bca069", &function_69faa74);
	/#
		assert(isscriptfunctionptr(&function_cd472d5));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_4e7335c0f98549c3", &function_cd472d5);
	/#
		assert(isscriptfunctionptr(&function_f2c697c7));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_4fbf554dacfacc1f", &function_f2c697c7);
	/#
		assert(isscriptfunctionptr(&function_f8145b00));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_67699fc0b32fc954", &function_f8145b00);
	/#
		assert(isscriptfunctionptr(&function_2bfd3841));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_72b216f44f66e0ca", &function_2bfd3841);
	animationstatenetwork::registeranimationmocomp("mocomp_melee@towers_boss", &function_5e17ac7a, &function_e88518a1, &function_10296bfa);
	animationstatenetwork::registernotetrackhandlerfunction("towersboss_melee", &function_2328518e);
	animationstatenetwork::registernotetrackhandlerfunction("towersboss_melee_big", &function_df15eebf);
	animationstatenetwork::registernotetrackhandlerfunction("launch_head_proj", &function_4b28fc8c);
	animationstatenetwork::registernotetrackhandlerfunction("launch_head_proj2", &function_4b28fc8c);
	animationstatenetwork::registernotetrackhandlerfunction("towers_boss_ground_attack", &function_ce8fe2b0);
	animation::add_global_notetrack_handler("tower_boss_death_effects", &function_afc99f32, 0);
	animation::add_global_notetrack_handler("tower_boss_entrace_effects", &function_35130a59, 0);
	level.var_c6001986 = &function_67525edc;
}

/*
	Name: function_238b5fdc
	Namespace: namespace_2e61cc4b
	Checksum: 0xC58053AD
	Offset: 0xEE0
	Size: 0xAC
	Parameters: 0
	Flags: Linked
*/
function function_238b5fdc()
{
	self endon(#"death");
	while(true)
	{
		if(isdefined(self.enemy) && is_true(self.enemy.laststand))
		{
			self clearenemy();
			self.favoriteenemy = undefined;
		}
		if(!isdefined(self.enemy))
		{
			self namespace_250e9486::function_4b49bf0d();
			wait(0.5);
		}
		else
		{
			wait(0.1);
		}
	}
}

/*
	Name: function_ea5dfa17
	Namespace: namespace_2e61cc4b
	Checksum: 0x6FF94807
	Offset: 0xF98
	Size: 0x124
	Parameters: 0
	Flags: Linked
*/
function function_ea5dfa17()
{
	self notify("55e25450fcf6bf52");
	self endon("55e25450fcf6bf52");
	streamermodelhint("c_t8_zmb_dlc0_elephant_body1", 999);
	streamermodelhint("c_t8_zmb_dlc0_elephant_husk_body1", 999);
	streamermodelhint("c_t8_zmb_dlc0_elephant_body1_evil", 999);
	streamermodelhint("c_t8_zmb_dlc0_elephant_husk_body1_evil", 999);
	level waittill(#"game_over", #"hash_77e4bcc14697c018");
	streamermodelhint("c_t8_zmb_dlc0_elephant_body1", 0);
	streamermodelhint("c_t8_zmb_dlc0_elephant_husk_body1", 0);
	streamermodelhint("c_t8_zmb_dlc0_elephant_body1_evil", 0);
	streamermodelhint("c_t8_zmb_dlc0_elephant_husk_body1_evil", 0);
}

/*
	Name: function_295c9975
	Namespace: namespace_2e61cc4b
	Checksum: 0x53B74EBE
	Offset: 0x10C8
	Size: 0x394
	Parameters: 0
	Flags: Linked
*/
function function_295c9975()
{
	namespace_250e9486::function_25b2c8a9();
	level thread function_ea5dfa17();
	self.maxhealth = self.maxhealth + (150000 + (50000 * getplayers().size));
	self.health = self.maxhealth;
	self.var_1c8b76d3 = 1;
	self namespace_250e9486::function_db744d28();
	self.var_9be3628d = array(0, 0, 0, 0);
	self.no_gib = 1;
	self.overrideactordamage = &function_36603968;
	self.ai.phase = #"hash_266f56fb994e6639";
	self disableaimassist();
	self pushplayer(1);
	self setavoidancemask("avoid none");
	self.ai.var_5c1cc6e9 = gettime() + 3000;
	self.ai.var_c53cce81 = gettime() + randomint(2000);
	self.ai.var_a05929e4 = getweapon("elephant_eye_projectile_zm");
	self.ai.var_4622f7a9 = gettime() + randomintrange(1500, 2000);
	self setrepairpaths(0);
	self.clamptonavmesh = 1;
	self.ai.var_a5dabb8b = 1;
	self bloodimpact("none");
	namespace_81245006::initweakpoints(self);
	self.ai.var_112ec817 = #"hash_8e170ae91588f20";
	self setblackboardattribute("_locomotion_speed", "locomotion_speed_run");
	self thread function_4ccdadc3();
	self namespace_e32bb68::function_3a59ec34("zmb_doa_ai_hellephant_spawn");
	self.var_a6bdfeb8 = self.origin;
	self.var_473fb012 = 0;
	self.proximitykill = namespace_ec06fe4a::spawntrigger("trigger_radius", self.origin, 2, 90, 60);
	if(isdefined(self.proximitykill))
	{
		self.proximitykill enablelinkto();
		self.proximitykill thread namespace_ec06fe4a::function_d55f042c(self, "death");
		self.proximitykill thread function_538a00bb(self);
		self.proximitykill linkto(self, "tag_origin", vectorscale((0, 0, 1), 30));
	}
}

/*
	Name: function_538a00bb
	Namespace: namespace_2e61cc4b
	Checksum: 0x50EC02AB
	Offset: 0x1468
	Size: 0xF2
	Parameters: 1
	Flags: Linked
*/
function function_538a00bb(owner)
{
	self endon(#"death");
	while(true)
	{
		result = undefined;
		result = self waittill(#"trigger");
		time = gettime();
		if(isdefined(result.activator))
		{
			if(!isdefined(result.activator.var_4f58c24d))
			{
				result.activator.var_4f58c24d = 0;
			}
			if(time > result.activator.var_4f58c24d)
			{
				result.activator dodamage(149, self.origin, owner);
				result.activator.var_4f58c24d = time + 1500;
			}
		}
	}
}

/*
	Name: function_36603968
	Namespace: namespace_2e61cc4b
	Checksum: 0xC5E0EFF5
	Offset: 0x1568
	Size: 0x168
	Parameters: 13
	Flags: Linked, Private
*/
function private function_36603968(inflictor, attacker, damage, flags, meansofdamage, weapon, var_fd90b0bb, point, dir, hitloc, offsettime, boneindex, modelindex)
{
	if(is_true(self.dying))
	{
		return 0;
	}
	if(isdefined(offsettime) && !isplayer(offsettime))
	{
		self namespace_ec06fe4a::function_2f4b0f9(self.health);
		return 0;
	}
	var_799e18e5 = modelindex;
	var_5f32808d = 1;
	if(boneindex >= 1000)
	{
		var_5f32808d = 2;
	}
	self.lastattacker = offsettime;
	self.var_d429b0ce = hitloc;
	self namespace_ec06fe4a::function_2f4b0f9(self.health, offsettime, var_799e18e5, boneindex, var_5f32808d);
	if(boneindex >= self.health)
	{
		level thread elephantstartdeath(self);
	}
	return boneindex;
}

/*
	Name: function_67525edc
	Namespace: namespace_2e61cc4b
	Checksum: 0xB885594F
	Offset: 0x16D8
	Size: 0x188
	Parameters: 1
	Flags: Linked
*/
function function_67525edc(var_3f1f1429)
{
	enemies = function_f6f34851(self.team);
	foreach(target in enemies)
	{
		if(isplayer(target))
		{
			distsq = distancesquared(var_3f1f1429.origin, target.origin);
			if(distsq <= sqr(150))
			{
				params = function_4d1e7b48(#"hash_12a64221f4d27f9b");
				weapon = getweapon(#"eq_molotov");
				target status_effect::status_effect_apply(params, weapon, var_3f1f1429, 0, 3000, undefined, var_3f1f1429.origin);
			}
		}
	}
}

/*
	Name: function_35130a59
	Namespace: namespace_2e61cc4b
	Checksum: 0x5A267EBD
	Offset: 0x1868
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_35130a59()
{
	self clientfield::increment("tower_boss_death_fx");
}

/*
	Name: function_afc99f32
	Namespace: namespace_2e61cc4b
	Checksum: 0xD2D5219
	Offset: 0x1898
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_afc99f32()
{
	self clientfield::increment("tower_boss_death_fx");
}

/*
	Name: elephantstartdeath
	Namespace: namespace_2e61cc4b
	Checksum: 0x9262E745
	Offset: 0x18C8
	Size: 0x2D4
	Parameters: 1
	Flags: Linked
*/
function elephantstartdeath(elephant)
{
	if(is_true(elephant.dying))
	{
		return;
	}
	elephant namespace_ec06fe4a::function_2f4b0f9(0);
	elephant clientfield::set("show_health_bar", 0);
	model = "p8_fxanim_zm_towers_boss_death_02_mod";
	animname = "p8_fxanim_zm_towers_boss_death_02_anim";
	deathanim = elephant animmappingsearch(#"hash_2ca88c72c7b85749");
	phase = elephant.ai.phase;
	elephant.skipdeath = 1;
	elephant.diedinscriptedanim = 1;
	elephant.var_8cf9d4df = namespace_ec06fe4a::function_e22ae9b3(elephant.origin);
	elephant.var_8cf9d4df thread namespace_ec06fe4a::function_52afe5df(10);
	elephant.var_8cf9d4df setmodel(model);
	elephant.var_8cf9d4df useanimtree("generic");
	elephant.var_8cf9d4df thread animation::play(animname, elephant.origin, elephant.angles, 1, 0.2, 0.1, undefined, undefined, undefined, 0);
	elephant.var_8cf9d4df clientfield::set("entrails_model_cf", 1);
	origin = elephant.origin;
	angles = elephant.angles;
	elephant clientfield::set("towers_boss_eye_fx_cf", 0);
	attacker = elephant.lastattacker;
	if(isdefined(elephant.var_d429b0ce) && isdefined(elephant.var_d429b0ce.owner))
	{
		attacker = elephant.var_d429b0ce.owner;
	}
	elephant.dying = 1;
	elephant dodamage(elephant.health, elephant.origin, elephant.lastattacker, elephant.var_d429b0ce);
	level thread function_106b6b29();
}

/*
	Name: function_106b6b29
	Namespace: namespace_2e61cc4b
	Checksum: 0xD4002C6
	Offset: 0x1BA8
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_106b6b29()
{
	wait(4.5);
	playsoundatposition(#"hash_4cf49c7c9533b539", (0, 0, 0));
}

/*
	Name: function_4b28fc8c
	Namespace: namespace_2e61cc4b
	Checksum: 0x7DF6DDE0
	Offset: 0x1BE8
	Size: 0x368
	Parameters: 1
	Flags: Linked
*/
function function_4b28fc8c(entity)
{
	/#
		assert(isdefined(entity.ai.var_a05929e4));
	#/
	launchpos = entity gettagorigin("j_head");
	var_d82e1fd1 = entity gettagangles("j_head");
	/#
		recordsphere(launchpos, 3, (0, 0, 1), "");
	#/
	landpos = entity.var_f6ea2286;
	if(!isdefined(landpos))
	{
		landpos = entity.favoriteenemy.origin;
	}
	var_f5022ab9 = namespace_ec06fe4a::function_e22ae9b3(launchpos, "tag_origin");
	vectorfromenemy = vectornormalize(entity.origin - landpos);
	vectorfromenemy = vectorscale(vectorfromenemy, 250);
	targetpos = (landpos + vectorfromenemy) + vectorscale((0, 0, 1), 200);
	var_f5022ab9 clientfield::set("towers_boss_head_proj_fx_cf", 1);
	trajectory = [];
	dirtotarget = targetpos - launchpos;
	var_f1c85329 = vectorscale((0, 0, 1), 30);
	var_62e75be4 = vectorscale((0, 0, 1), 200);
	trajectory[trajectory.size] = (launchpos + (dirtotarget * 0.85)) + var_f1c85329;
	trajectory[trajectory.size] = (launchpos + (dirtotarget * 0.5)) + var_62e75be4;
	trajectory[trajectory.size] = (launchpos + (dirtotarget * 0.15)) + var_f1c85329;
	trajectory = array::reverse(trajectory);
	var_10b732dc = 0.3;
	foreach(point in trajectory)
	{
		var_f5022ab9 moveto(point, var_10b732dc);
		var_f5022ab9 waittill(#"movedone");
	}
	self playsound(#"hash_62894125ab280b62");
	self notify(#"hash_79e095919e415a70");
	if(isdefined(entity.ai.var_502d9d0d))
	{
		[[entity.ai.var_502d9d0d]](entity, var_f5022ab9);
	}
}

/*
	Name: function_df15eebf
	Namespace: namespace_2e61cc4b
	Checksum: 0xC51244DB
	Offset: 0x1F58
	Size: 0x2D0
	Parameters: 1
	Flags: Linked, Private
*/
function private function_df15eebf(entity)
{
	origin = entity gettagorigin("j_nose4");
	radiusdamage(origin, 200, 150, 150, entity);
	/#
		level thread namespace_1e25ad94::debugcircle(origin, 200, 5, (1, 0, 0));
	#/
	enemies = function_f6f34851(self.team);
	foreach(target in enemies)
	{
		dist = distance(self.origin, target.origin);
		if(isplayer(target) && dist < 600)
		{
			params = function_4d1e7b48(#"hash_2c80515d8ac9f1b4");
			weapon = getweapon(#"zombie_ai_defaultmelee");
			target status_effect::status_effect_apply(params, weapon, entity, 0, 500);
		}
	}
	entity clientfield::increment("towers_boss_melee_effect");
	var_a5a1f99c = getaiarchetypearray(#"zombie");
	var_a5a1f99c = array::filter(var_a5a1f99c, 0, &function_1d65bc12, entity);
	foreach(zombie in var_a5a1f99c)
	{
		zombie namespace_250e9486::setup_zombie_knockdown(entity);
	}
}

/*
	Name: function_2328518e
	Namespace: namespace_2e61cc4b
	Checksum: 0x961605EC
	Offset: 0x2230
	Size: 0x39C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_2328518e(entity)
{
	if(!isdefined(entity))
	{
		return;
	}
	entity endon(#"death");
	if(!isdefined(entity.var_470f7225))
	{
		entity.var_470f7225 = [];
	}
	if(entity haspart("j_heart_fnt"))
	{
		origin = entity gettagorigin("j_heart_fnt");
	}
	else
	{
		origin = entity.origin;
	}
	var_dc9ec224 = namespace_ec06fe4a::function_65ee50ba(origin);
	radiusdamage(var_dc9ec224, 200, 150, 150, entity);
	function_1eaaceab(entity.var_470f7225);
	if(entity.var_470f7225.size < 6 && randomint(100) < 25)
	{
		if(!isdefined(level.doa.var_314b1f0))
		{
			level.doa.var_314b1f0 = doa_enemy::function_d7c5adee("spider");
		}
		ai = doa_enemy::function_db55a448(level.doa.var_314b1f0, origin);
		if(isdefined(ai))
		{
			if(!isdefined(entity.var_470f7225))
			{
				entity.var_470f7225 = [];
			}
			else if(!isarray(entity.var_470f7225))
			{
				entity.var_470f7225 = array(entity.var_470f7225);
			}
			entity.var_470f7225[entity.var_470f7225.size] = ai;
		}
	}
	/#
		level thread namespace_1e25ad94::debugcircle(var_dc9ec224, 200, 5, (1, 0, 1));
	#/
	enemies = function_f6f34851(entity.team);
	foreach(target in enemies)
	{
		dist = distance(var_dc9ec224, target.origin);
		if(isplayer(target) && dist < 450)
		{
			params = function_4d1e7b48(#"hash_2c80515d8ac9f1b4");
			weapon = getweapon("zombie_ai_defaultmelee");
			target status_effect::status_effect_apply(params, weapon, entity, 0, 500);
		}
	}
	entity clientfield::increment("towers_boss_melee_effect");
}

/*
	Name: function_4ccdadc3
	Namespace: namespace_2e61cc4b
	Checksum: 0x83B26595
	Offset: 0x25D8
	Size: 0xA4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_4ccdadc3()
{
	self endon(#"death");
	while(!isdefined(self.ai.phase))
	{
		wait(0.1);
	}
	if(self.ai.phase === #"hash_266f56fb994e6639")
	{
		self clientfield::set("towers_boss_eye_fx_cf", 2);
	}
	else
	{
		self clientfield::set("towers_boss_eye_fx_cf", 1);
	}
}

/*
	Name: function_5db0f49a
	Namespace: namespace_2e61cc4b
	Checksum: 0x822B6BF7
	Offset: 0x2688
	Size: 0x26
	Parameters: 1
	Flags: Linked, Private
*/
function private function_5db0f49a(entity)
{
	entity.ai.isturning = 1;
	return true;
}

/*
	Name: function_1c0db2ec
	Namespace: namespace_2e61cc4b
	Checksum: 0x6B0495EA
	Offset: 0x26B8
	Size: 0x22
	Parameters: 1
	Flags: Linked, Private
*/
function private function_1c0db2ec(entity)
{
	entity.ai.isturning = 0;
	return true;
}

/*
	Name: function_9c076ff9
	Namespace: namespace_2e61cc4b
	Checksum: 0x194FCE3C
	Offset: 0x26E8
	Size: 0x44
	Parameters: 1
	Flags: Linked, Private
*/
function private function_9c076ff9(entity)
{
	entity setgoal(entity.origin);
	entity clearpath();
}

/*
	Name: function_1d65bc12
	Namespace: namespace_2e61cc4b
	Checksum: 0xFF853378
	Offset: 0x2738
	Size: 0x190
	Parameters: 3
	Flags: Linked, Private
*/
function private function_1d65bc12(enemy, elephant, var_60e4c6b7)
{
	if(!isdefined(var_60e4c6b7))
	{
		var_60e4c6b7 = 1;
	}
	if(is_true(enemy.knockdown))
	{
		return false;
	}
	if(gibserverutils::isgibbed(enemy, 384))
	{
		return false;
	}
	if(distancesquared(enemy.origin, elephant.origin) > sqr(250))
	{
		return false;
	}
	var_f2fb414f = anglestoforward(elephant.angles);
	var_9349139f = enemy.origin - elephant.origin;
	var_3e3c8075 = (var_9349139f[0], var_9349139f[1], 0);
	var_c2ee8451 = (var_f2fb414f[0], var_f2fb414f[1], 0);
	var_3e3c8075 = vectornormalize(var_3e3c8075);
	var_c2ee8451 = vectornormalize(var_c2ee8451);
	if(var_60e4c6b7)
	{
		var_34e02165 = vectordot(var_c2ee8451, var_3e3c8075);
		if(var_34e02165 < 0)
		{
			return false;
		}
	}
	return true;
}

/*
	Name: elephantknockdownservice
	Namespace: namespace_2e61cc4b
	Checksum: 0x6B36F78C
	Offset: 0x28D0
	Size: 0x170
	Parameters: 1
	Flags: Linked, Private
*/
function private elephantknockdownservice(entity)
{
	if(!isdefined(self.ai.var_a504b9a3))
	{
		return false;
	}
	var_a5a1f99c = getaiarchetypearray(#"zombie");
	var_a5a1f99c = arraycombine(var_a5a1f99c, getaiarchetypearray(#"catalyst"), 0, 0);
	var_a5a1f99c = arraycombine(var_a5a1f99c, getaiarchetypearray(#"tiger"), 0, 0);
	var_a5a1f99c = array::filter(var_a5a1f99c, 0, &function_1d65bc12, entity);
	foreach(zombie in var_a5a1f99c)
	{
		zombie namespace_250e9486::setup_zombie_knockdown(entity);
	}
}

/*
	Name: function_cd472d5
	Namespace: namespace_2e61cc4b
	Checksum: 0x6A7C773D
	Offset: 0x2A48
	Size: 0x1DC
	Parameters: 1
	Flags: Linked
*/
function function_cd472d5(entity)
{
	if(is_true(self.var_b554dbf2))
	{
		return false;
	}
	if(!isdefined(entity.favoriteenemy))
	{
		return false;
	}
	if(isdefined(entity.ai.var_f2d193df) && gettime() < entity.ai.var_f2d193df)
	{
		return false;
	}
	if(distancesquared(entity.favoriteenemy.origin, entity.origin) < sqr(200))
	{
		return false;
	}
	fov = cos(30);
	if(!util::within_fov(entity.origin, entity.angles, entity.favoriteenemy.origin, fov))
	{
		return false;
	}
	var_b21fc1a7 = blackboard::getblackboardevents("towersboss_head_proj");
	if(isdefined(var_b21fc1a7) && var_b21fc1a7.size)
	{
		foreach(var_358d39a3 in var_b21fc1a7)
		{
			if(var_358d39a3.enemy === entity.favoriteenemy)
			{
				return false;
			}
		}
	}
	return true;
}

/*
	Name: function_ce8fe2b0
	Namespace: namespace_2e61cc4b
	Checksum: 0xCFD445D
	Offset: 0x2C30
	Size: 0x3BC
	Parameters: 2
	Flags: Linked
*/
function function_ce8fe2b0(entity, var_ab9f62ef)
{
	self endon(#"death");
	forwardvec = vectornormalize(anglestoforward(entity.angles));
	forwarddist = 200;
	if(isdefined(var_ab9f62ef))
	{
		var_6629fd0d = var_ab9f62ef;
	}
	else
	{
		var_6629fd0d = entity.origin + (forwarddist * forwardvec);
	}
	var_cbdae441 = getclosestpointonnavmesh(var_6629fd0d, 500, 200);
	if(isdefined(var_cbdae441))
	{
		trace = groundtrace(var_cbdae441 + vectorscale((0, 0, 1), 200), var_cbdae441 + (vectorscale((0, 0, -1), 200)), 0, undefined);
		if(isdefined(trace[#"position"]))
		{
			newpos = trace[#"position"];
		}
		/#
			recordsphere(newpos, 15, (1, 0.5, 0), "");
		#/
		var_3f1f1429 = spawnvehicle(#"hash_6be593a62b8b87a5", newpos, entity.angles, "dynamic_spawn_ai");
		var_3f1f1429 thread namespace_ec06fe4a::function_52afe5df(15);
		if(isdefined(var_3f1f1429))
		{
			var_3f1f1429.var_6353e3f1 = 1;
			entity.ai.var_f2d193df = gettime() + randomintrange(5000, 8000);
			if(is_true(self.var_fe41477d))
			{
				entity.ai.var_f2d193df = gettime() + 5000;
			}
		}
	}
	else
	{
		/#
			recordsphere(var_6629fd0d, 15, (0, 0, 0), "");
		#/
	}
	wait(0.5);
	targets = getplayers();
	for(i = 0; i < targets.size; i++)
	{
		target = targets[i];
		if(!is_player_valid(target, 1, 1) || !function_71790b86(entity))
		{
			arrayremovevalue(targets, target);
			break;
		}
	}
	if(targets.size == 0)
	{
		return;
	}
	if(targets.size > 1 && self.ai.phase == #"hash_266f56fb994e6639" && isdefined(var_3f1f1429) && isalive(var_3f1f1429) && !isdefined(var_ab9f62ef))
	{
		function_ce8fe2b0(self, var_3f1f1429.origin);
	}
}

/*
	Name: function_69faa74
	Namespace: namespace_2e61cc4b
	Checksum: 0x4DD2372E
	Offset: 0x2FF8
	Size: 0x1AC
	Parameters: 1
	Flags: Linked
*/
function function_69faa74(entity)
{
	if(is_true(self.var_fe41477d))
	{
		return false;
	}
	if(!isdefined(entity.favoriteenemy))
	{
		return false;
	}
	if(gettime() < entity.ai.var_c53cce81)
	{
		return false;
	}
	if(distancesquared(entity.favoriteenemy.origin, entity.origin) < sqr(256))
	{
		return false;
	}
	fov = 60;
	if(!util::within_fov(entity.origin, entity.angles, entity.favoriteenemy.origin, fov))
	{
		return false;
	}
	var_b21fc1a7 = blackboard::getblackboardevents("towersboss_head_proj");
	if(isdefined(var_b21fc1a7) && var_b21fc1a7.size)
	{
		foreach(var_358d39a3 in var_b21fc1a7)
		{
			if(var_358d39a3.enemy === entity.favoriteenemy)
			{
				return false;
			}
		}
	}
	return true;
}

/*
	Name: function_2bfd3841
	Namespace: namespace_2e61cc4b
	Checksum: 0x36633B3B
	Offset: 0x31B0
	Size: 0xB4
	Parameters: 1
	Flags: Linked
*/
function function_2bfd3841(entity)
{
	entity.ai.var_c53cce81 = gettime() + randomint(3000);
	var_51955401 = spawnstruct();
	var_51955401.enemy = entity.favoriteenemy;
	entity.var_f6ea2286 = entity.favoriteenemy.origin;
	blackboard::addblackboardevent("towersboss_head_proj", var_51955401, randomintrange(3500, 4000));
}

/*
	Name: function_18e1bf30
	Namespace: namespace_2e61cc4b
	Checksum: 0x352A8103
	Offset: 0x3270
	Size: 0x7E
	Parameters: 1
	Flags: Linked
*/
function function_18e1bf30(entity)
{
	if(!elephantshouldmelee(entity))
	{
		return false;
	}
	if(!util::within_fov(entity.origin, entity.angles, entity.favoriteenemy.origin, cos(45)))
	{
		return false;
	}
	return true;
}

/*
	Name: elephantshouldmelee
	Namespace: namespace_2e61cc4b
	Checksum: 0x21A35F73
	Offset: 0x32F8
	Size: 0x156
	Parameters: 1
	Flags: Linked, Private
*/
function private elephantshouldmelee(entity)
{
	if(!isdefined(entity.favoriteenemy))
	{
		return false;
	}
	if(entity asmistransitionrunning() || entity asmistransdecrunning())
	{
		return false;
	}
	if(is_true(entity.ai.isturning))
	{
		return false;
	}
	disttoenemysq = distancesquared(entity.favoriteenemy.origin, entity.origin);
	yawtoenemy = angleclamp180(entity.angles[1] - (vectortoangles(entity.favoriteenemy.origin - entity.origin)[1]));
	if(disttoenemysq <= sqr(200) && abs(yawtoenemy) < 30)
	{
		return true;
	}
	return false;
}

/*
	Name: function_71790b86
	Namespace: namespace_2e61cc4b
	Checksum: 0x53FAA33B
	Offset: 0x3458
	Size: 0x10
	Parameters: 1
	Flags: Linked, Private
*/
function private function_71790b86(entity)
{
	return true;
}

/*
	Name: function_ec336810
	Namespace: namespace_2e61cc4b
	Checksum: 0x809BA885
	Offset: 0x3470
	Size: 0x1BE
	Parameters: 1
	Flags: Linked, Private
*/
function private function_ec336810(entity)
{
	if(isdefined(entity.favoriteenemy))
	{
		if(distance(entity.var_a6bdfeb8, entity.favoriteenemy.origin) > 6000)
		{
			if(distance(entity.var_a6bdfeb8, entity.origin) > 1000)
			{
				entity.ai.var_ea8d826a = 1;
				targetpos = getclosestpointonnavmesh(entity.var_a6bdfeb8, 400, entity getpathfindingradius() * 1.2);
				entity setgoal(targetpos);
				entity.var_473fb012 = 1;
			}
			else if(entity.health < entity.maxhealth)
			{
				entity.health = entity.maxhealth;
			}
		}
		else
		{
			entity.ai.var_ea8d826a = 0;
			entity.var_473fb012 = 0;
		}
	}
	if(entity.var_473fb012 === 1)
	{
		if(distance(entity.var_a6bdfeb8, entity.origin) < 600)
		{
			entity.var_473fb012 = 0;
			entity.ai.var_ea8d826a = 0;
			if(entity.health < entity.maxhealth)
			{
				entity.health = entity.maxhealth;
			}
		}
	}
}

/*
	Name: function_2ff17378
	Namespace: namespace_2e61cc4b
	Checksum: 0x16FDBE13
	Offset: 0x3638
	Size: 0x126
	Parameters: 1
	Flags: Linked, Private
*/
function private function_2ff17378(entity)
{
	function_ec336810(entity);
	if(is_true(entity.ai.var_ea8d826a))
	{
		return false;
	}
	if(!isdefined(entity.favoriteenemy))
	{
		return false;
	}
	if(entity.ai.var_5c1cc6e9 > gettime())
	{
		return false;
	}
	if(isdefined(entity.ai.var_a504b9a3))
	{
		return false;
	}
	if(entity asmistransitionrunning() || entity asmistransdecrunning())
	{
		return false;
	}
	if(is_true(entity.ai.isturning))
	{
		return false;
	}
	if(!function_71790b86(entity))
	{
		return false;
	}
	if(elephantshouldmelee(entity))
	{
		return false;
	}
	return true;
}

/*
	Name: function_10a75bb7
	Namespace: namespace_2e61cc4b
	Checksum: 0x91DD77C2
	Offset: 0x3848
	Size: 0x9C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_10a75bb7(entity)
{
	if(function_2ff17378(entity))
	{
		targetpos = getclosestpointonnavmesh(entity.favoriteenemy.origin, 400, entity getpathfindingradius() * 1.2);
		if(isdefined(targetpos))
		{
			entity setgoal(targetpos);
			return true;
		}
	}
	return false;
}

/*
	Name: function_f2c697c7
	Namespace: namespace_2e61cc4b
	Checksum: 0x606D3E21
	Offset: 0x38F0
	Size: 0x13E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_f2c697c7(entity)
{
	entity.ai.var_a504b9a3 = new class_a504b9a3();
	entity.ai.var_a504b9a3.var_86d0fc5 = entity.goalpos;
	entity.ai.var_a504b9a3.var_9ab05afa = distancesquared(entity.origin, entity.goalpos);
	entity.ai.var_a504b9a3.startpos = entity.origin;
	entity.ai.var_a504b9a3.var_6392c3a2 = gettime() + randomintrange(3500, 4000);
	entity.ai.var_a504b9a3.var_190509f3 = sqr(250);
	entity.ai.var_a504b9a3.var_f84fafb2 = sqr(400);
	return true;
}

/*
	Name: function_5dee26ed
	Namespace: namespace_2e61cc4b
	Checksum: 0xB045E683
	Offset: 0x3A38
	Size: 0xE2
	Parameters: 1
	Flags: Linked, Private
*/
function private function_5dee26ed(entity)
{
	if(!isdefined(entity.var_261ff182))
	{
		entity.var_261ff182 = entity.origin;
		entity.var_7ab66e6a = gettime() + 2000;
	}
	else if(isdefined(entity.var_7ab66e6a) && entity.var_7ab66e6a < gettime())
	{
		var_eef47db = distance(entity.origin, entity.var_261ff182);
		if(var_eef47db < 250)
		{
			entity.var_261ff182 = undefined;
			function_9c076ff9(entity);
		}
		else
		{
			entity.var_261ff182 = entity.origin;
			entity.var_7ab66e6a = gettime() + 2000;
		}
	}
}

/*
	Name: function_f8145b00
	Namespace: namespace_2e61cc4b
	Checksum: 0x16EFDC5F
	Offset: 0x3B28
	Size: 0x5CA
	Parameters: 1
	Flags: Linked, Private
*/
function private function_f8145b00(entity)
{
	if(isdefined(entity.favoriteenemy) && isalive(entity.favoriteenemy))
	{
		/#
			assert(isdefined(entity.ai.var_a504b9a3));
		#/
		/#
			assert(isdefined(entity.ai.var_a504b9a3.var_86d0fc5));
		#/
		/#
			assert(isdefined(entity.ai.var_a504b9a3.var_6392c3a2));
		#/
		function_5dee26ed(entity);
		/#
			recordsphere(entity.ai.var_a504b9a3.var_86d0fc5, 8, (1, 0, 0), "");
		#/
		if(entity asmistransitionrunning() || entity asmistransdecrunning())
		{
			return true;
		}
		if(gettime() < entity.ai.var_a504b9a3.var_9177748f)
		{
			return true;
		}
		if(gettime() <= entity.ai.var_a504b9a3.var_6392c3a2)
		{
			var_ba63d54d = distancesquared(entity.ai.var_a504b9a3.var_86d0fc5, entity.favoriteenemy.origin);
			var_3a73a0ae = distancesquared(entity.ai.var_a504b9a3.startpos, entity.favoriteenemy.origin) > entity.ai.var_a504b9a3.var_9ab05afa;
			threshold = entity.ai.var_a504b9a3.var_190509f3;
			if(var_3a73a0ae)
			{
				threshold = entity.ai.var_a504b9a3.var_f84fafb2;
			}
			if(var_ba63d54d <= threshold && sighttracepassed(entity.origin + vectorscale((0, 0, 1), 200), entity.favoriteenemy.origin + vectorscale((0, 0, 1), 100), 0, entity, entity.favoriteenemy))
			{
				/#
					recordline(entity.origin + vectorscale((0, 0, 1), 200), entity.favoriteenemy.origin + vectorscale((0, 0, 1), 200), (0, 1, 0), "");
				#/
				targetpos = getclosestpointonnavmesh(entity.favoriteenemy.origin, 400, entity getpathfindingradius() * 1.2);
				if(isdefined(targetpos))
				{
					/#
						recordsphere(targetpos, 8, (0, 1, 1), "");
					#/
					dirtoenemy = vectornormalize(targetpos - self.origin);
					targetpos = targetpos + (vectorscale(dirtoenemy * -1, 170));
					targetpos = getclosestpointonnavmesh(targetpos, 400, entity getpathfindingradius() * 1.2);
					if(isdefined(targetpos))
					{
						path = generatenavmeshpath(self.origin, targetpos, self);
						if(!isdefined(path) || !isdefined(path.pathpoints) || path.pathpoints.size == 0)
						{
							/#
								recordsphere(targetpos, 8, vectorscale((1, 1, 1), 0.1), "");
							#/
						}
						else
						{
							entity setgoal(targetpos);
							/#
								recordsphere(targetpos, 8, (0, 0, 1), "");
							#/
							/#
								recordline(entity.ai.var_a504b9a3.var_86d0fc5, targetpos, (1, 0, 0), "");
							#/
						}
					}
					else
					{
						/#
							recordsphere(targetpos, 8, vectorscale((1, 1, 1), 0.1), "");
						#/
					}
				}
			}
		}
	}
	entity.ai.var_a504b9a3.var_9177748f = gettime() + 200;
	return true;
}

/*
	Name: function_d3d560e9
	Namespace: namespace_2e61cc4b
	Checksum: 0xCBEBF601
	Offset: 0x4100
	Size: 0x6A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_d3d560e9(entity)
{
	entity aiutility::cleararrivalpos(entity);
	entity.ai.var_a504b9a3 = undefined;
	entity.ai.var_5c1cc6e9 = gettime() + randomintrange(500, 2000);
	return true;
}

/*
	Name: is_player_valid
	Namespace: namespace_2e61cc4b
	Checksum: 0x1504C1CE
	Offset: 0x4178
	Size: 0x188
	Parameters: 3
	Flags: Linked
*/
function is_player_valid(player, checkignoremeflag, ignore_laststand_players)
{
	if(!isdefined(player))
	{
		return 0;
	}
	if(!isalive(player))
	{
		return 0;
	}
	if(!isplayer(player))
	{
		return 0;
	}
	if(player isnotarget())
	{
		return 0;
	}
	if(isdefined(player.is_zombie) && player.is_zombie == 1)
	{
		return 0;
	}
	if(player.sessionstate == "spectator")
	{
		return 0;
	}
	if(player.sessionstate == "intermission")
	{
		return 0;
	}
	if(is_true(player.intermission))
	{
		return 0;
	}
	if(!is_true(ignore_laststand_players))
	{
		if(player laststand::player_is_in_laststand())
		{
			return 0;
		}
	}
	if(player isnotarget())
	{
		return 0;
	}
	if(is_true(checkignoremeflag) && player.ignoreme)
	{
		return 0;
	}
	if(isdefined(level.is_player_valid_override))
	{
		return [[level.is_player_valid_override]](player);
	}
	return 1;
}

/*
	Name: function_2c58bc39
	Namespace: namespace_2e61cc4b
	Checksum: 0x6A1EB020
	Offset: 0x4308
	Size: 0xC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_2c58bc39(entity)
{
}

/*
	Name: function_5e17ac7a
	Namespace: namespace_2e61cc4b
	Checksum: 0xF6806C27
	Offset: 0x4320
	Size: 0xA4
	Parameters: 5
	Flags: Linked, Private
*/
function private function_5e17ac7a(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	mocompduration animmode("zonly_physics", 1);
	mocompduration pathmode("dont move");
	mocompduration clearpath();
	mocompduration setgoal(mocompduration.origin);
}

/*
	Name: function_e88518a1
	Namespace: namespace_2e61cc4b
	Checksum: 0xE26DD5C9
	Offset: 0x43D0
	Size: 0x2C
	Parameters: 5
	Flags: Linked, Private
*/
function private function_e88518a1(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
}

/*
	Name: function_10296bfa
	Namespace: namespace_2e61cc4b
	Checksum: 0x59C4D3D8
	Offset: 0x4408
	Size: 0x6C
	Parameters: 5
	Flags: Linked, Private
*/
function private function_10296bfa(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	mocompduration pathmode("move allowed");
	mocompduration setgoal(mocompduration.origin);
}

