#using script_17dcb1172e441bf6;
#using script_1ee011cd0961afd7;
#using script_2a5bf5b4a00cee0d;
#using script_47851dbeea22fe66;
#using script_634ae70c663d1cc9;
#using script_774302f762d76254;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace namespace_53f73cda;

/*
	Name: init
	Namespace: namespace_53f73cda
	Checksum: 0x80F724D1
	Offset: 0x280
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function init()
{
}

/*
	Name: main
	Namespace: namespace_53f73cda
	Checksum: 0x12897B82
	Offset: 0x290
	Size: 0x2A
	Parameters: 0
	Flags: Linked
*/
function main()
{
	level.doa.var_7a2db350 = [];
	level.doa.var_8d14dcbf = [];
}

/*
	Name: function_215e1efb
	Namespace: namespace_53f73cda
	Checksum: 0xEB69BB7
	Offset: 0x2C8
	Size: 0x28A
	Parameters: 0
	Flags: Linked
*/
function function_215e1efb()
{
	self notify("181e2a51f4b6bc73");
	self endon("181e2a51f4b6bc73");
	self thread namespace_268747c0::function_978c05b5();
	self thread namespace_268747c0::function_5418a00f();
	result = undefined;
	result = self waittill(#"hash_3e251384a5400dce");
	if(is_true(self.paged) && is_true(result.var_760a0807))
	{
		arrayremovevalue(level.doa.var_7a2db350, self);
		namespace_1e25ad94::debugmsg("Deleting Pole trap permenently at:" + self.origin);
	}
	if(isdefined(self.script_models))
	{
		foreach(model in self.script_models)
		{
			if(!isdefined(model))
			{
				continue;
			}
			model notify(#"hash_3e251384a5400dce");
			waitframe(1);
			if(isdefined(model.trigger))
			{
				model.trigger namespace_268747c0::function_54f185a();
				model.trigger = undefined;
			}
			model namespace_e32bb68::function_ae271c0b("hazard_electric_trap_active");
			model namespace_83eb6304::turnofffx("hazard_electric_trap_red");
			model namespace_83eb6304::turnofffx("hazard_electric_trap_green");
			model namespace_83eb6304::turnofffx("hazard_electric_trap_active");
			model namespace_ec06fe4a::function_8c808737();
			model thread namespace_ec06fe4a::function_52afe5df(0.5);
		}
		self.script_models = undefined;
	}
}

/*
	Name: function_3bea16f1
	Namespace: namespace_53f73cda
	Checksum: 0xAAFFB98D
	Offset: 0x560
	Size: 0x140
	Parameters: 3
	Flags: Linked
*/
function function_3bea16f1(trap, paged, origin)
{
	if(!isdefined(paged))
	{
		paged = 0;
	}
	if(!isdefined(origin))
	{
		origin = trap.origin;
	}
	if(!mayspawnentity())
	{
		return;
	}
	hazard = namespace_ec06fe4a::function_e22ae9b3(origin, "zombietron_electrical_pole");
	if(isdefined(hazard))
	{
		hazard.targetname = "hazard";
		hazard.var_fd5301f9 = "pole";
		hazard solid();
		hazard thread function_4eec8432();
		if(isdefined(trap))
		{
			if(!isdefined(trap.script_models))
			{
				trap.script_models = [];
			}
			trap.script_models[trap.script_models.size] = hazard;
		}
	}
	if(isdefined(trap))
	{
		trap.paged = paged;
		trap thread function_215e1efb();
	}
	return trap;
}

/*
	Name: function_4eec8432
	Namespace: namespace_53f73cda
	Checksum: 0x9EBE3299
	Offset: 0x6A8
	Size: 0x1E0
	Parameters: 0
	Flags: Linked
*/
function function_4eec8432()
{
	self endon(#"death", #"hash_3e251384a5400dce");
	self.active = 0;
	waitframe(1);
	while(true)
	{
		self namespace_83eb6304::turnofffx("hazard_electric_trap_red");
		self namespace_83eb6304::function_3ecfde67("hazard_electric_trap_green");
		wait(randomfloatrange(5, 15));
		self namespace_83eb6304::function_3ecfde67("hazard_electric_trap_red");
		self namespace_83eb6304::turnofffx("hazard_electric_trap_green");
		self namespace_e32bb68::function_3a59ec34("evt_doa_hazard_pole_warning");
		wait(1.2);
		self namespace_83eb6304::turnofffx("hazard_electric_trap_red");
		self namespace_83eb6304::turnofffx("hazard_electric_trap_green");
		self namespace_83eb6304::function_3ecfde67("hazard_electric_trap_active");
		self.active = 1;
		self thread function_a0fe5f28();
		wait(randomfloatrange(4, 10));
		self.active = 0;
		self namespace_e32bb68::function_3a59ec34("evt_doa_hazard_pole_off");
		self namespace_83eb6304::turnofffx("hazard_electric_trap_active");
	}
}

/*
	Name: function_a0fe5f28
	Namespace: namespace_53f73cda
	Checksum: 0xB982116E
	Offset: 0x890
	Size: 0x34E
	Parameters: 0
	Flags: Linked
*/
function function_a0fe5f28()
{
	self endon(#"death", #"hash_3e251384a5400dce");
	var_5fdeec29 = 8500;
	/#
		assert(!isdefined(self.trigger));
	#/
	while(isdefined(self) && is_true(self.active))
	{
		if(!isdefined(self.trigger))
		{
			self.trigger = namespace_268747c0::function_5bfa98c9("pole", self.origin);
			if(isdefined(self.trigger))
			{
				self.trigger.origin = self.origin;
				self.trigger.angles = self.angles;
			}
		}
		if(isdefined(self.trigger))
		{
			result = undefined;
			result = self.trigger waittilltimeout(0.25, #"trigger");
			guy = result.activator;
			if(isdefined(guy))
			{
				if(!isdefined(guy.doa))
				{
					continue;
				}
				if(is_true(guy.var_2b989b2e))
				{
					continue;
				}
				if(!isdefined(guy.doa.var_c72c2145))
				{
					guy.doa.var_c72c2145 = 0;
				}
				curtime = gettime();
				if(curtime < guy.doa.var_c72c2145)
				{
					continue;
				}
				guy.doa.var_c72c2145 = curtime + 1500;
				guy namespace_e32bb68::function_3a59ec34("evt_doa_hazard_pole_impact");
				guy namespace_83eb6304::function_3ecfde67("hazard_electric");
				guy namespace_83eb6304::function_3ecfde67("tesla_shock");
				if(is_true(guy.var_47267079) || is_true(guy.boss))
				{
					continue;
				}
				if(isplayer(guy) || isvehicle(guy))
				{
					guy dodamage(guy.health + 100, guy.origin);
				}
				else
				{
					guy thread namespace_ec06fe4a::function_570729f0(0.1);
				}
			}
			continue;
		}
		else
		{
			wait(0.25);
		}
	}
	if(isdefined(self.trigger))
	{
		self.trigger namespace_268747c0::function_54f185a();
		self.trigger = undefined;
	}
}

/*
	Name: function_28826539
	Namespace: namespace_53f73cda
	Checksum: 0xB67E2102
	Offset: 0xBE8
	Size: 0x11C
	Parameters: 3
	Flags: Linked
*/
function function_28826539(trap, page, origin)
{
	if(!isdefined(page))
	{
		page = 0;
	}
	if(!mayspawnentity())
	{
		return;
	}
	if(page)
	{
		if(!isdefined(level.doa.var_7a2db350))
		{
			level.doa.var_7a2db350 = [];
		}
		else if(!isarray(level.doa.var_7a2db350))
		{
			level.doa.var_7a2db350 = array(level.doa.var_7a2db350);
		}
		level.doa.var_7a2db350[level.doa.var_7a2db350.size] = trap;
	}
	else
	{
		return function_3bea16f1(trap, 0, origin);
	}
}

/*
	Name: function_97d551b
	Namespace: namespace_53f73cda
	Checksum: 0xAF2724C5
	Offset: 0xD10
	Size: 0x390
	Parameters: 1
	Flags: Linked
*/
function function_97d551b(var_2c5f6748)
{
	state = namespace_4dae815d::function_59a9cf1d();
	if(state == 0)
	{
		if(level.doa.roundnumber < 8)
		{
			return;
		}
		cluster_count = math::clamp(1 + (randomint(2 + (int((level.doa.roundnumber - 4) / 5)))), 1, 40);
		if(getdvarint(#"hash_1ea1b9dc5e765aa9", 0))
		{
			cluster_count = 40;
		}
		if(isdefined(var_2c5f6748) && cluster_count > var_2c5f6748)
		{
			cluster_count = var_2c5f6748;
		}
		if(cluster_count <= 0)
		{
			return;
		}
	}
	level.doa.var_7a2db350 = [];
	level.doa.var_8d14dcbf = [];
	level thread function_16abf3d3();
	if(isdefined(level.doa.var_a77e6349))
	{
		var_71da84c = [[ level.doa.var_a77e6349 ]]->function_87f950c1("elec_pole");
	}
	else
	{
		var_71da84c = [[ level.doa.var_39e3fa99 ]]->function_242886d5("elec_pole");
	}
	if(var_71da84c.size == 0)
	{
		return;
	}
	if(state == 0)
	{
		while(cluster_count)
		{
			cluster_count--;
			trap = var_71da84c[randomint(var_71da84c.size)];
			radius = 85;
			if(isdefined(trap.radius))
			{
				radius = int(trap.radius);
			}
			origin = trap.origin + (randomintrange(radius * -1, radius), randomintrange(radius * -1, radius), 0);
			origin = function_a971a62f(origin, trap.origin, radius);
			if(isdefined(origin))
			{
				level.doa.var_8d14dcbf[level.doa.var_8d14dcbf.size] = function_28826539(trap, 0, origin);
			}
		}
	}
	else
	{
		foreach(trap in var_71da84c)
		{
			function_28826539(trap, 1);
		}
	}
}

/*
	Name: function_16abf3d3
	Namespace: namespace_53f73cda
	Checksum: 0x810F2D6E
	Offset: 0x10A8
	Size: 0x334
	Parameters: 0
	Flags: Linked
*/
function function_16abf3d3()
{
	self notify("523846fafc71c417");
	self endon("523846fafc71c417");
	level endon(#"game_over");
	while(true)
	{
		wait(0.5);
		state = namespace_4dae815d::function_59a9cf1d();
		if(state == 0)
		{
			continue;
		}
		foreach(trap in level.doa.var_7a2db350)
		{
			time = gettime();
			if(isdefined(trap.var_eb9d64bb) && time < trap.var_eb9d64bb)
			{
				continue;
			}
			trap.var_eb9d64bb = (time + 2000) + randomint(600);
			if(!isdefined(trap.script_models))
			{
				activate = 0;
				if(isdefined(trap.var_f8660931))
				{
					distsq = distancesquared(trap.origin, trap.var_f8660931.origin);
					if(distsq < sqr(3200))
					{
						activate = 1;
					}
				}
				if(!activate)
				{
					trap.var_f8660931 = namespace_ec06fe4a::function_6eacecf5(trap.origin, 1600);
					if(isdefined(trap.var_f8660931))
					{
						activate = 1;
					}
					else
					{
						trap.var_f8660931 = namespace_ec06fe4a::function_bd3709ce(trap.origin, 600);
						if(isdefined(trap.var_f8660931))
						{
							activate = 1;
						}
					}
				}
				if(activate)
				{
					function_3bea16f1(trap, 1);
					trap.var_eb9d64bb = trap.var_eb9d64bb + 5000;
					namespace_1e25ad94::debugmsg("Paging IN pole trap at:" + trap.origin);
				}
				continue;
			}
			trap.var_f8660931 = namespace_ec06fe4a::function_f3eab80e(trap.origin, 1800);
			if(!isdefined(trap.var_f8660931))
			{
				trap notify(#"hash_3e251384a5400dce", {#hash_760a0807:0});
				namespace_1e25ad94::debugmsg("Paging out pole trap at:" + trap.origin);
			}
		}
	}
}

/*
	Name: function_a971a62f
	Namespace: namespace_53f73cda
	Checksum: 0xBE14EAC
	Offset: 0x13E8
	Size: 0x442
	Parameters: 3
	Flags: Linked
*/
function function_a971a62f(origin, var_5c526bd9, var_c705f304)
{
	if(!isdefined(var_5c526bd9))
	{
		var_5c526bd9 = origin;
	}
	if(!isdefined(var_c705f304))
	{
		var_c705f304 = 85;
	}
	min_dist = 36;
	min_dist_squared = min_dist * min_dist;
	pushed = 1;
	max_tries = 5;
	while(pushed && max_tries > 0)
	{
		max_tries--;
		pushed = 0;
		foreach(hazard in level.doa.var_8d14dcbf)
		{
			if(!isdefined(hazard))
			{
				continue;
			}
			dist_squared = distancesquared(origin, hazard.origin);
			if(dist_squared < min_dist_squared)
			{
				dir = origin - hazard.origin;
				dir = vectornormalize(dir);
				var_d8176d62 = origin - var_5c526bd9;
				var_d8176d62 = vectornormalize(dir);
				if(vectordot(dir, var_d8176d62) < 0)
				{
					dir = dir * -1;
				}
				origin = origin + (dir * min_dist);
				pushed = 1;
			}
		}
	}
	dist_squared = distancesquared(origin, var_5c526bd9);
	if(dist_squared > sqr(var_c705f304))
	{
		return undefined;
	}
	trace = worldtrace(origin + vectorscale((0, 0, 1), 32), origin + (48, 0, 32));
	var_cb85c7c9 = trace[#"fraction"] == 1 && trace[#"surfacetype"] == "none";
	if(!var_cb85c7c9)
	{
		return undefined;
	}
	trace = worldtrace(origin + vectorscale((0, 0, 1), 32), origin + (-48, 0, 32));
	var_cb85c7c9 = trace[#"fraction"] == 1 && trace[#"surfacetype"] == "none";
	if(!var_cb85c7c9)
	{
		return undefined;
	}
	trace = worldtrace(origin + vectorscale((0, 0, 1), 32), origin + (0, 48, 32));
	var_cb85c7c9 = trace[#"fraction"] == 1 && trace[#"surfacetype"] == "none";
	if(!var_cb85c7c9)
	{
		return undefined;
	}
	trace = worldtrace(origin + vectorscale((0, 0, 1), 32), origin + (0, -48, 32));
	var_cb85c7c9 = trace[#"fraction"] == 1 && trace[#"surfacetype"] == "none";
	if(!var_cb85c7c9)
	{
		return undefined;
	}
	return namespace_ec06fe4a::function_65ee50ba(origin);
}

