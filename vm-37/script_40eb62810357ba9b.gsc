#using script_164a456ce05c3483;
#using script_17dcb1172e441bf6;
#using script_1b01e95a6b5270fd;
#using script_1ee011cd0961afd7;
#using script_2a5bf5b4a00cee0d;
#using script_3aa0f32b70d4f7cb;
#using script_47851dbeea22fe66;
#using script_4d85e8de54b02198;
#using script_4ee0ccb42a9d88f5;
#using script_522aeb6ae906391e;
#using script_5701633066d199f2;
#using script_57f7003580bb15e0;
#using script_5f20d3b434d24884;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\math_shared.gsc;

#namespace namespace_df4fbf0;

/*
	Name: init
	Namespace: namespace_df4fbf0
	Checksum: 0xC30D73B3
	Offset: 0x230
	Size: 0xBE
	Parameters: 0
	Flags: Linked
*/
function init()
{
	namespace_250e9486::function_252dff4d("brutus", 2, &function_8b038048, undefined, 49, &function_c610e461);
	clientfield::register("toplayer", "brutus_shock_attack_player", 1, 1, "counter");
	clientfield::register("actor", "brutus_shock_attack", 1, 1, "counter");
	registerbehaviorscriptfunctions();
	level.doa.var_36fba6 = [];
}

/*
	Name: registerbehaviorscriptfunctions
	Namespace: namespace_df4fbf0
	Checksum: 0x7387BE59
	Offset: 0x2F8
	Size: 0x234
	Parameters: 0
	Flags: Linked
*/
function registerbehaviorscriptfunctions()
{
	/#
		assert(isscriptfunctionptr(&namespace_250e9486::function_abb6c18a));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_67cf14163bf00d16", &namespace_250e9486::function_abb6c18a);
	/#
		assert(isscriptfunctionptr(&namespace_250e9486::function_99ed5179));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_14f093af5e75dca1", &namespace_250e9486::function_99ed5179);
	/#
		assert(isscriptfunctionptr(&namespace_250e9486::function_50547dae));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_23de4beb58b2ce65", &namespace_250e9486::function_50547dae);
	/#
		assert(isscriptfunctionptr(&function_3bda3c55));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_43c922ea035ca163", &function_3bda3c55);
	/#
		assert(isscriptfunctionptr(&function_f4a61e6a));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_7cdf61f23f735254", &function_f4a61e6a);
	animationstatenetwork::registernotetrackhandlerfunction("hit_ground", &function_85e8940a);
}

/*
	Name: function_c610e461
	Namespace: namespace_df4fbf0
	Checksum: 0x48C30315
	Offset: 0x538
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function function_c610e461()
{
	function_1eaaceab(level.doa.var_36fba6);
	if(level.doa.world_state == 0)
	{
		return level.doa.var_36fba6.size < 16;
	}
	return 1;
}

/*
	Name: function_8b038048
	Namespace: namespace_df4fbf0
	Checksum: 0xA22142E5
	Offset: 0x5A0
	Size: 0x1F4
	Parameters: 0
	Flags: Linked
*/
function function_8b038048()
{
	namespace_250e9486::function_25b2c8a9();
	self.var_9329a57c = 0;
	self.health = 50000;
	self.doa.var_74e4ded8 = 1;
	self.var_c7121c91 = 1;
	self.var_4dcf6637 = 1;
	self.var_1c8b76d3 = 1;
	self.no_gib = 1;
	self.zombie_move_speed = "walk";
	self.maxhealth = self.health;
	self.var_5b857980 = function_4d1e7b48(#"hash_19533caf858a9f3b");
	self thread damagewatch();
	self thread function_79445831();
	if(level.doa.world_state == 0)
	{
		if(!isdefined(level.doa.var_36fba6))
		{
			level.doa.var_36fba6 = [];
		}
		else if(!isarray(level.doa.var_36fba6))
		{
			level.doa.var_36fba6 = array(level.doa.var_36fba6);
		}
		level.doa.var_36fba6[level.doa.var_36fba6.size] = self;
		self thread namespace_250e9486::function_e10af211(undefined, "gem_trail_red", "turret_impact", 1);
		self.var_e020e658 = 1;
	}
	self namespace_e32bb68::function_3a59ec34("zmb_doa_ai_brutus_spawn");
}

/*
	Name: damagewatch
	Namespace: namespace_df4fbf0
	Checksum: 0x664E43D6
	Offset: 0x7A0
	Size: 0xDC
	Parameters: 0
	Flags: Linked
*/
function damagewatch()
{
	self notify("2f4692e09e1fa0ef");
	self endon("2f4692e09e1fa0ef");
	self endon(#"death");
	result = undefined;
	result = self waittill(#"damage", #"nuked");
	self.goalradius = 42;
	if(self.zombie_move_speed == "walk")
	{
		self.var_8766b29b = 1;
	}
	self.zombie_move_speed = "run";
	if(result._notify === "nuked")
	{
		self dodamage(1000, self.origin);
	}
}

/*
	Name: function_79445831
	Namespace: namespace_df4fbf0
	Checksum: 0x59F976B4
	Offset: 0x888
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function function_79445831()
{
	self notify("78744a38d8d23432");
	self endon("78744a38d8d23432");
	self waittill(#"death");
	if(isdefined(self))
	{
		self namespace_e32bb68::function_3a59ec34("zmb_doa_ai_brutus_death");
	}
}

/*
	Name: function_3bda3c55
	Namespace: namespace_df4fbf0
	Checksum: 0x7B4264F
	Offset: 0x8E8
	Size: 0x13E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_3bda3c55(entity)
{
	if(!isdefined(entity))
	{
		return false;
	}
	if(is_true(entity.var_e020e658))
	{
		return false;
	}
	if(is_true(entity.var_8766b29b))
	{
		entity.var_8766b29b = undefined;
		return true;
	}
	if(!isdefined(entity.var_9329a57c))
	{
		entity.var_9329a57c = 0;
	}
	if(entity.var_9329a57c > gettime())
	{
		return false;
	}
	if(!isdefined(entity.favoriteenemy))
	{
		return false;
	}
	if(abs(entity.origin[2] - entity.favoriteenemy.origin[2]) > 72)
	{
		return false;
	}
	if(distance2dsquared(entity.origin, entity.favoriteenemy.origin) > sqr(200))
	{
		return false;
	}
	return true;
}

/*
	Name: function_f4a61e6a
	Namespace: namespace_df4fbf0
	Checksum: 0x399C09E
	Offset: 0xA30
	Size: 0x4E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_f4a61e6a(entity)
{
	entity.var_9329a57c = gettime() + (int(entity ai::function_9139c839().var_d5427206 * 1000));
}

/*
	Name: function_85e8940a
	Namespace: namespace_df4fbf0
	Checksum: 0xBD0A4153
	Offset: 0xA88
	Size: 0x2D0
	Parameters: 1
	Flags: Linked, Private
*/
function private function_85e8940a(entity)
{
	var_aa6baab8 = entity ai::function_9139c839().var_1709a39;
	players = getplayers(#"all", entity.origin, var_aa6baab8);
	entity clientfield::increment("brutus_shock_attack", 1);
	foreach(player in players)
	{
		if(!namespace_7f5aeb59::isplayervalid(player))
		{
			continue;
		}
		if(player.origin[2] - entity.origin[2] < -32)
		{
			continue;
		}
		if(player.origin[2] - entity.origin[2] > 200)
		{
			continue;
		}
		if(!bullettracepassed(entity.origin, player gettagorigin("j_spine4"), 0, entity, player))
		{
			continue;
		}
		damage = mapfloat(entity getpathfindingradius() + 15, entity ai::function_9139c839().var_1709a39, 90, 20, distance(entity.origin, player.origin));
		damage = int(max(20, damage));
		player dodamage(damage, entity.origin, entity, entity, "none", "MOD_PROJECTILE_SPLASH");
		player thread status_effect::status_effect_apply(self.var_5b857980, undefined, self, 0);
		player clientfield::increment_to_player("brutus_shock_attack_player", 1);
	}
}
