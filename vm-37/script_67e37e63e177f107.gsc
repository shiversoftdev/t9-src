#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\globallogic\globallogic_score.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\statemachine_shared.gsc;
#using scripts\core_common\vehicle_ai_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace namespace_77b8863;

/*
	Name: __init__system__
	Namespace: namespace_77b8863
	Checksum: 0xA8D4A48B
	Offset: 0x170
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_60e9e594b4389b03", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_77b8863
	Checksum: 0x408A0A6A
	Offset: 0x1B8
	Size: 0x8C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	vehicle::add_main_callback(#"dust_ball", &function_c346ef73);
	clientfield::register("scriptmover", "towers_boss_dust_ball_fx", 1, getminbitcountfornum(4), "int");
	/#
		level thread update_dvars();
	#/
}

/*
	Name: update_dvars
	Namespace: namespace_77b8863
	Checksum: 0xD8D85276
	Offset: 0x250
	Size: 0x8
	Parameters: 0
	Flags: None
*/
function update_dvars()
{
	/#
	#/
}

/*
	Name: function_c346ef73
	Namespace: namespace_77b8863
	Checksum: 0xE88E9D99
	Offset: 0x260
	Size: 0xA4
	Parameters: 0
	Flags: Linked
*/
function function_c346ef73()
{
	self.settings = getscriptbundle(self.scriptbundlesettings);
	self.var_1dab821a = 0;
	self useanimtree("generic");
	if(isdefined(self.owner))
	{
		self setteam(self.owner.team);
	}
	self setneargoalnotifydist(60);
	defaultrole();
}

/*
	Name: defaultrole
	Namespace: namespace_77b8863
	Checksum: 0xF86F66E1
	Offset: 0x310
	Size: 0x1D4
	Parameters: 0
	Flags: Linked
*/
function defaultrole()
{
	statemachine = self vehicle_ai::init_state_machine_for_role("default");
	statemachine statemachine::add_state("seek", &function_9ddc7275, &function_3e16dec3, &function_64f7393f);
	statemachine statemachine::add_state("soul", &function_3f83eb6, &function_e452a40c, &function_22828012);
	self vehicle_ai::get_state_callbacks("death").update_func = &state_death_update;
	self val::set(#"dust_ball", "takedamage", 0);
	self.takedamage = 0;
	self vehicle_ai::call_custom_add_state_callbacks();
	self.fxent = spawn("script_model", self.origin);
	self.fxent setmodel("tag_origin");
	self.fxent linkto(self);
	self.fxent clientfield::set("towers_boss_dust_ball_fx", 1);
	vehicle_ai::startinitialstate("seek");
}

/*
	Name: function_d3a9800e
	Namespace: namespace_77b8863
	Checksum: 0x1EEEF7AB
	Offset: 0x4F0
	Size: 0x1A
	Parameters: 0
	Flags: Linked
*/
function function_d3a9800e()
{
	return self.origin + vectorscale((0, 0, 1), 30);
}

/*
	Name: waittill_pathing_done
	Namespace: namespace_77b8863
	Checksum: 0x73342152
	Offset: 0x518
	Size: 0x56
	Parameters: 1
	Flags: Linked
*/
function waittill_pathing_done(maxtime)
{
	if(!isdefined(maxtime))
	{
		maxtime = 15;
	}
	self endon(#"death");
	self endon(#"change_state");
	self waittilltimeout(maxtime, #"near_goal");
}

/*
	Name: function_f2fd92d1
	Namespace: namespace_77b8863
	Checksum: 0xBC8E2C5
	Offset: 0x578
	Size: 0x8C
	Parameters: 0
	Flags: Linked
*/
function function_f2fd92d1()
{
	if(isdefined(self.favoriteenemy))
	{
		target_pos = self.favoriteenemy.origin;
	}
	if(isdefined(target_pos))
	{
		target_pos_onnavmesh = getclosestpointonnavmesh(target_pos, 20, self.radius, 4194287);
	}
	if(isdefined(target_pos_onnavmesh))
	{
		return target_pos_onnavmesh;
	}
	if(isdefined(self.current_pathto_pos))
	{
		return self.current_pathto_pos;
	}
}

/*
	Name: function_3f83eb6
	Namespace: namespace_77b8863
	Checksum: 0x36EFDD8C
	Offset: 0x610
	Size: 0x7C
	Parameters: 1
	Flags: Linked
*/
function function_3f83eb6(params)
{
	self.fxent unlink();
	self.fxent linkto(self, "tag_origin", vectorscale((0, 0, 1), 50));
	self.fxent clientfield::set("towers_boss_dust_ball_fx", 3);
}

/*
	Name: function_e452a40c
	Namespace: namespace_77b8863
	Checksum: 0x5F87E4DB
	Offset: 0x698
	Size: 0x128
	Parameters: 1
	Flags: Linked
*/
function function_e452a40c(params)
{
	self endon(#"death");
	self setneargoalnotifydist(40);
	while(true)
	{
		if(!isdefined(self.ai.var_a38db64f))
		{
			waitframe(1);
			continue;
		}
		self setspeed(self.settings.var_9eff22ee);
		self setbrake(0);
		self function_a57c34b7(self.ai.var_a38db64f, 1, 1);
		self waittilltimeout(30, #"near_goal");
		if(isdefined(self.fxent))
		{
			self.fxent delete();
		}
		self delete();
	}
}

/*
	Name: function_22828012
	Namespace: namespace_77b8863
	Checksum: 0xF7F307A3
	Offset: 0x7C8
	Size: 0xC
	Parameters: 1
	Flags: Linked
*/
function function_22828012(params)
{
}

/*
	Name: function_9ddc7275
	Namespace: namespace_77b8863
	Checksum: 0x6E29DB72
	Offset: 0x7E0
	Size: 0xBC
	Parameters: 1
	Flags: Linked
*/
function function_9ddc7275(params)
{
	self.var_33506050 = undefined;
	self.favoriteenemy = undefined;
	duration = 2;
	self.var_373d5c91 = gettime() + (int(duration * 1000));
	self thread function_ef0bfb9d();
	self thread function_419f8ccb();
	if(isdefined(self.settings.var_d76543dd))
	{
		self playloopsound(self.settings.var_d76543dd);
	}
}

/*
	Name: function_64f7393f
	Namespace: namespace_77b8863
	Checksum: 0x954BD7F9
	Offset: 0x8A8
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function function_64f7393f(params)
{
	self stoploopsound();
}

/*
	Name: function_78b6454d
	Namespace: namespace_77b8863
	Checksum: 0xA262367A
	Offset: 0x8D8
	Size: 0x1A
	Parameters: 0
	Flags: Linked
*/
function function_78b6454d()
{
	if(gettime() > self.var_373d5c91)
	{
		return true;
	}
	return false;
}

/*
	Name: function_3e16dec3
	Namespace: namespace_77b8863
	Checksum: 0x9C6450BB
	Offset: 0x900
	Size: 0x146
	Parameters: 1
	Flags: Linked
*/
function function_3e16dec3(params)
{
	self endon(#"death");
	self endon(#"change_state");
	for(;;)
	{
		if(isdefined(self.favoriteenemy))
		{
			if(isdefined(self.settings.var_cfe1cc83))
			{
				self playloopsound(self.settings.var_cfe1cc83);
			}
			self.current_pathto_pos = self function_f2fd92d1();
			if(isdefined(self.current_pathto_pos))
			{
				self setspeed(self.settings.var_9eff22ee);
				self setbrake(0);
				self function_a57c34b7(self.current_pathto_pos, 1, 1);
				self waittill_pathing_done(1);
				continue;
			}
		}
		else
		{
			self function_55be8453();
		}
		waitframe(1);
	}
}

/*
	Name: function_ef0bfb9d
	Namespace: namespace_77b8863
	Checksum: 0x8DFA00BA
	Offset: 0xA50
	Size: 0x296
	Parameters: 0
	Flags: Linked
*/
function function_ef0bfb9d()
{
	self endon(#"death");
	self endon(#"change_state");
	wait(0.5);
	while(true)
	{
		enemies = function_f6f34851(self.team);
		alltargets = arraysort(enemies, self function_d3a9800e(), 1);
		zombiesarray = getaiarchetypearray(#"zombie");
		zombiesarray = arraycombine(zombiesarray, getaiarchetypearray(#"catalyst"), 0, 0);
		alltargets = arraycombine(zombiesarray, alltargets, 0, 0);
		foreach(target in alltargets)
		{
			var_87c0ec9c = distancesquared(target.origin, self function_d3a9800e());
			if(var_87c0ec9c <= sqr(self.settings.damage_radius))
			{
				if(isdefined(target.archetype))
				{
					target zombie_utility::setup_zombie_knockdown(self);
					target.knockdown_type = "knockdown_shoved";
					continue;
				}
				target dodamage(self.settings.var_274be2d6, self.origin, self, self, "", "MOD_IMPACT", 0);
			}
		}
		physicsexplosionsphere(self.origin, 200, 100, 2);
		waitframe(1);
	}
}

/*
	Name: function_413aacb3
	Namespace: namespace_77b8863
	Checksum: 0xAF2029C5
	Offset: 0xCF0
	Size: 0xCC
	Parameters: 1
	Flags: Linked
*/
function function_413aacb3(target)
{
	var_7588d977 = getaiarchetypearray(#"dust_ball");
	foreach(dustball in var_7588d977)
	{
		if(dustball == self)
		{
			continue;
		}
		if(dustball.favoriteenemy === target)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_55be8453
	Namespace: namespace_77b8863
	Checksum: 0xA8AEBC58
	Offset: 0xDC8
	Size: 0x2CE
	Parameters: 0
	Flags: Linked
*/
function function_55be8453()
{
	self endon(#"death");
	self endon(#"change_state");
	wait(0.5);
	if(isdefined(self.favoriteenemy))
	{
		if(util::within_fov(self.origin, self.angles, self.favoriteenemy.origin, 0.939))
		{
			var_87c0ec9c = distancesquared(self.favoriteenemy.origin, self function_d3a9800e());
			if(var_87c0ec9c <= 10000)
			{
				return;
			}
		}
	}
	enemies = function_f6f34851(self.team);
	alltargets = arraysort(enemies, self function_d3a9800e(), 1);
	foreach(target in alltargets)
	{
		angles = self.angles;
		if(self function_413aacb3(target))
		{
			continue;
		}
		if(util::within_fov(self.origin, angles, target.origin, 0))
		{
			self.favoriteenemy = target;
			return;
		}
	}
	foreach(target in alltargets)
	{
		var_87c0ec9c = distancesquared(target.origin, self function_d3a9800e());
		if(var_87c0ec9c <= 10000)
		{
			self.favoriteenemy = target;
			return;
		}
	}
	if(alltargets.size && isdefined(alltargets[0]))
	{
		self.favoriteenemy = alltargets[0];
	}
}

/*
	Name: function_419f8ccb
	Namespace: namespace_77b8863
	Checksum: 0x3099E914
	Offset: 0x10A0
	Size: 0x166
	Parameters: 0
	Flags: Linked
*/
function function_419f8ccb()
{
	self endon(#"death");
	self endon(#"change_state");
	for(;;)
	{
		if(self function_78b6454d())
		{
			self vehicle_ai::set_state("death");
		}
		if(isdefined(self.favoriteenemy))
		{
			distfromplayer = distancesquared(self.origin, self.favoriteenemy.origin);
			if(distfromplayer < sqr(self.settings.var_2c001f55) && !is_true(self.var_8d5279eb))
			{
				self.fxent clientfield::set("towers_boss_dust_ball_fx", 2);
				self.var_8d5279eb = 1;
			}
			if(distfromplayer < sqr(self.settings.zmb_zod_sprayer_pickupids))
			{
				self vehicle_ai::set_state("death");
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_469f1e03
	Namespace: namespace_77b8863
	Checksum: 0xED4F85E3
	Offset: 0x1210
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function function_469f1e03(fxent)
{
	wait(0.1);
	fxent delete();
}

/*
	Name: state_death_update
	Namespace: namespace_77b8863
	Checksum: 0x66183F72
	Offset: 0x1248
	Size: 0xBC
	Parameters: 1
	Flags: Linked
*/
function state_death_update(params)
{
	self.fxent clientfield::set("towers_boss_dust_ball_fx", 0);
	if(isdefined(level.var_c6001986))
	{
		[[level.var_c6001986]](self);
	}
	fxent = self.fxent;
	vehicle_ai::defaultstate_death_update(params);
	wait(2);
	if(isdefined(fxent))
	{
		level thread function_469f1e03(fxent);
	}
	if(isdefined(self))
	{
		self delete();
	}
}

