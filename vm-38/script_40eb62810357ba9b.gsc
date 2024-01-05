#using scripts\core_common\ai\archetype_brutus.gsc;
#using script_2a5bf5b4a00cee0d;
#using script_164a456ce05c3483;
#using script_5f20d3b434d24884;
#using script_47851dbeea22fe66;
#using script_1ee011cd0961afd7;
#using script_5701633066d199f2;
#using script_1b01e95a6b5270fd;
#using script_17dcb1172e441bf6;
#using scripts\core_common\status_effects\status_effect_util.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using script_522aeb6ae906391e;
#using script_3aa0f32b70d4f7cb;
#using script_4d85e8de54b02198;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\ai_shared.gsc;

#namespace namespace_df4fbf0;

/*
	Name: function_32039f2e
	Namespace: namespace_df4fbf0
	Checksum: 0x7C642C31
	Offset: 0x230
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_32039f2e()
{
	level notify(-1935609788);
}

/*
	Name: init
	Namespace: namespace_df4fbf0
	Checksum: 0x99AEE676
	Offset: 0x250
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
	Checksum: 0x8578748B
	Offset: 0x318
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
	Checksum: 0x58A07B6E
	Offset: 0x558
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
	Checksum: 0xFD835EF0
	Offset: 0x5C0
	Size: 0x254
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
	self.shock_status_effect = getstatuseffect(#"hash_19533caf858a9f3b");
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
		var_e7ef13a3 = undefined;
		if(isdefined(level.doa.var_dce49f12))
		{
			spot = [[level.doa.var_dce49f12]]();
			if(isdefined(spot))
			{
				var_e7ef13a3 = spot.origin;
			}
		}
		self thread namespace_250e9486::function_e10af211(var_e7ef13a3, "gem_trail_red", "turret_impact", 1);
		self.var_e020e658 = 1;
	}
	self namespace_e32bb68::function_3a59ec34("zmb_doa_ai_brutus_spawn");
}

/*
	Name: damagewatch
	Namespace: namespace_df4fbf0
	Checksum: 0xE29A120C
	Offset: 0x820
	Size: 0xDC
	Parameters: 0
	Flags: Linked
*/
function damagewatch()
{
	self notify("4fc4501e558372df");
	self endon("4fc4501e558372df");
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
	Checksum: 0x384F2518
	Offset: 0x908
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function function_79445831()
{
	self notify("4c18bcdc16f235ef");
	self endon("4c18bcdc16f235ef");
	self waittill(#"death");
	if(isdefined(self))
	{
		self namespace_e32bb68::function_3a59ec34("zmb_doa_ai_brutus_death");
	}
}

/*
	Name: function_3bda3c55
	Namespace: namespace_df4fbf0
	Checksum: 0xEFB834BC
	Offset: 0x968
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
	Checksum: 0xEFCF9148
	Offset: 0xAB0
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
	Checksum: 0xF0388ACB
	Offset: 0xB08
	Size: 0x2E8
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
		var_ed9fd11e = player gettagorigin("j_spine4");
		if(!isdefined(var_ed9fd11e) || !bullettracepassed(entity.origin, var_ed9fd11e, 0, entity, player))
		{
			continue;
		}
		damage = mapfloat(entity getpathfindingradius() + 15, entity ai::function_9139c839().var_1709a39, 90, 20, distance(entity.origin, player.origin));
		damage = int(max(20, damage));
		player dodamage(damage, entity.origin, entity, entity, "none", "MOD_PROJECTILE_SPLASH");
		player thread status_effect::status_effect_apply(self.shock_status_effect, undefined, self, 0);
		player clientfield::increment_to_player("brutus_shock_attack_player", 1);
	}
}

