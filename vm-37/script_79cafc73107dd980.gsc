#using script_164a456ce05c3483;
#using script_17dcb1172e441bf6;
#using script_1b01e95a6b5270fd;
#using script_1b0b07ff57d1dde3;
#using script_1ee011cd0961afd7;
#using script_2a5bf5b4a00cee0d;
#using script_35598499769dbb3d;
#using script_3819e7a1427df6d2;
#using script_3aa0f32b70d4f7cb;
#using script_3faf478d5b0850fe;
#using script_41fe08c37d53a635;
#using script_47851dbeea22fe66;
#using script_4d85e8de54b02198;
#using script_5701633066d199f2;
#using script_5f20d3b434d24884;
#using script_6809bf766eba194a;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_f6712ec9;

/*
	Name: init
	Namespace: namespace_f6712ec9
	Checksum: 0xAB57689
	Offset: 0x1B0
	Size: 0x18C
	Parameters: 0
	Flags: Linked
*/
function init()
{
	/#
		assert(isscriptfunctionptr(&function_29c22852));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_4ead7642034f30f7", &function_29c22852);
	/#
		assert(isscriptfunctionptr(&function_33b29495));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_3d7ced75f59bb519", &function_33b29495);
	/#
		assert(isscriptfunctionptr(&function_27a1a846));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_6e9be4be56cd06d3", &function_27a1a846);
	animationstatenetwork::registernotetrackhandlerfunction("nova_crawler_melee", &function_99ac548f);
	namespace_250e9486::function_252dff4d("crawler_zombie", 3, &function_96a48049, undefined);
}

/*
	Name: function_96a48049
	Namespace: namespace_f6712ec9
	Checksum: 0x9F8D2234
	Offset: 0x348
	Size: 0x16C
	Parameters: 0
	Flags: Linked
*/
function function_96a48049()
{
	self namespace_250e9486::function_25b2c8a9();
	self.var_1731eda3 = 1;
	self.var_2c628c0f = 1;
	self.canbetargetedbyturnedzombies = 1;
	self.is_zombie = 1;
	self.zombie_move_speed = "sprint";
	self.no_gib = 1;
	self.var_a592ffaa = 1;
	animrate = randomfloatrange(1, 1.3);
	self asmsetanimationrate(animrate);
	self namespace_83eb6304::function_3ecfde67("nova_crawler_aura_fx");
	if(isdefined(self.var_d55f22cb))
	{
		self namespace_83eb6304::function_3ecfde67("nova_crawler_burst");
	}
	self callback::function_d8abfc3d(#"on_ai_killed", &function_3dbef270);
	self thread namespace_9fc66ac::function_ba33d23d(#"hash_3defcaf3d4381c5a", #"hash_3defcaf3d4381c5a", #"hash_2d7e37242c315034");
}

/*
	Name: function_3dbef270
	Namespace: namespace_f6712ec9
	Checksum: 0x86A8D994
	Offset: 0x4C0
	Size: 0xCC
	Parameters: 1
	Flags: Linked
*/
function function_3dbef270(params)
{
	self namespace_83eb6304::function_3ecfde67("nova_crawler_burst");
	self namespace_e32bb68::function_3a59ec34("zmb_doa_ai_crawler_explo");
	trigger = namespace_ec06fe4a::spawntrigger("trigger_radius", self.origin, (2 | 1) | 512, 40, 50);
	if(isdefined(trigger))
	{
		trigger thread namespace_ec06fe4a::function_52afe5df(3);
		trigger thread function_86555fba();
	}
}

/*
	Name: function_86555fba
	Namespace: namespace_f6712ec9
	Checksum: 0x3283864B
	Offset: 0x598
	Size: 0x98
	Parameters: 0
	Flags: Linked
*/
function function_86555fba()
{
	self endon(#"death");
	while(true)
	{
		result = undefined;
		result = self waittill(#"trigger");
		if(isdefined(result.activator) && !is_true(result.activator.boss))
		{
			result.activator thread namespace_250e9486::function_b5feb0bf();
		}
	}
}

/*
	Name: function_29c22852
	Namespace: namespace_f6712ec9
	Checksum: 0x7B3A0D43
	Offset: 0x638
	Size: 0x246
	Parameters: 1
	Flags: Linked
*/
function function_29c22852(entity)
{
	if(!isdefined(entity.enemy))
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
	if(isdefined(entity.meleeweapon) && entity.meleeweapon !== level.weaponnone)
	{
		meleedistsq = entity.meleeweapon.var_d3cafde6 * entity.meleeweapon.var_d3cafde6;
	}
	if(!isdefined(meleedistsq))
	{
		return false;
	}
	if(distancesquared(entity.origin, entity.enemy.origin) > meleedistsq)
	{
		return false;
	}
	yawtoenemy = angleclamp180(entity.angles[1] - (vectortoangles(entity.enemy.origin - entity.origin)[1]));
	if(abs(yawtoenemy) > 60)
	{
		return false;
	}
	if(!entity cansee(entity.enemy))
	{
		return false;
	}
	if(!tracepassedonnavmesh(entity.origin, (isdefined(entity.enemy.last_valid_position) ? entity.enemy.last_valid_position : entity.enemy.origin), entity getpathfindingradius()))
	{
		return false;
	}
	return true;
}

/*
	Name: function_33b29495
	Namespace: namespace_f6712ec9
	Checksum: 0xB88F4CB3
	Offset: 0x888
	Size: 0xA8
	Parameters: 1
	Flags: Linked, Private
*/
function private function_33b29495(entity)
{
	var_711090a2 = 0;
	var_b77044e1 = lerpfloat(0.2, 0.8, math::clamp((level.doa.roundnumber - 1) / 30, 0, 1));
	if(randomfloat(1) <= var_b77044e1)
	{
		var_711090a2 = 1;
	}
	return var_711090a2;
}

/*
	Name: function_27a1a846
	Namespace: namespace_f6712ec9
	Checksum: 0xFD657C9E
	Offset: 0x938
	Size: 0x4E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_27a1a846(entity)
{
	var_62d41d8f = 0;
	if(is_true(self.killed_enemy_player))
	{
		var_62d41d8f = 1;
		self.killed_enemy_player = 0;
	}
	return var_62d41d8f;
}

/*
	Name: function_99ac548f
	Namespace: namespace_f6712ec9
	Checksum: 0xA0C5DABA
	Offset: 0x990
	Size: 0x44
	Parameters: 1
	Flags: Linked, Private
*/
function private function_99ac548f(entity)
{
	entity melee();
	entity callback::callback(#"hash_11aa32ad6d527054");
}

