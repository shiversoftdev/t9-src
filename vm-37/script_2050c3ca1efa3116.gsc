#using script_47851dbeea22fe66;
#using script_774302f762d76254;
#using script_1ee011cd0961afd7;
#using script_634ae70c663d1cc9;
#using script_17dcb1172e441bf6;
#using script_2a5bf5b4a00cee0d;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_d20e7d3b;

/*
	Name: init
	Namespace: namespace_d20e7d3b
	Checksum: 0x80F724D1
	Offset: 0x268
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function init()
{
}

/*
	Name: main
	Namespace: namespace_d20e7d3b
	Checksum: 0x89461728
	Offset: 0x278
	Size: 0x16
	Parameters: 0
	Flags: Linked
*/
function main()
{
	level.doa.var_f9d893a7 = [];
}

/*
	Name: function_be14ecd2
	Namespace: namespace_d20e7d3b
	Checksum: 0x3FF5F362
	Offset: 0x298
	Size: 0x144
	Parameters: 0
	Flags: Linked
*/
function function_be14ecd2()
{
	self notify("5634ec87c8202e49");
	self endon("5634ec87c8202e49");
	self thread namespace_268747c0::function_978c05b5();
	result = undefined;
	result = self waittill(#"hash_3e251384a5400dce");
	if(is_true(self.paged) && is_true(result.var_760a0807))
	{
		arrayremovevalue(level.doa.var_f9d893a7, self);
		namespace_1e25ad94::debugmsg("Deleting Pungi trap permenently at:" + self.origin);
	}
	util::wait_network_frame();
	if(isdefined(self.trigger))
	{
		self.trigger namespace_268747c0::function_54f185a();
	}
	if(isdefined(self.script_model))
	{
		self.script_model delete();
	}
}

/*
	Name: function_c5cbd3bf
	Namespace: namespace_d20e7d3b
	Checksum: 0x2A9B5A89
	Offset: 0x3E8
	Size: 0xB8
	Parameters: 2
	Flags: Linked
*/
function function_c5cbd3bf(trap, paged)
{
	if(!isdefined(paged))
	{
		paged = 0;
	}
	hazard = namespace_ec06fe4a::function_e22ae9b3(trap.origin, "zombietron_pungi_sticks");
	if(isdefined(hazard))
	{
		hazard.targetname = "hazard";
		hazard.var_fd5301f9 = "pungi";
		hazard.angles = trap.angles;
	}
	trap.script_model = hazard;
	trap.paged = paged;
	trap thread function_20cf5ee5();
	return trap;
}

/*
	Name: function_f42615a9
	Namespace: namespace_d20e7d3b
	Checksum: 0xACE00DEA
	Offset: 0x4A8
	Size: 0x10C
	Parameters: 2
	Flags: Linked
*/
function function_f42615a9(trap, page)
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
		if(!isdefined(level.doa.var_f9d893a7))
		{
			level.doa.var_f9d893a7 = [];
		}
		else if(!isarray(level.doa.var_f9d893a7))
		{
			level.doa.var_f9d893a7 = array(level.doa.var_f9d893a7);
		}
		level.doa.var_f9d893a7[level.doa.var_f9d893a7.size] = trap;
	}
	else
	{
		function_c5cbd3bf(trap);
	}
}

/*
	Name: function_157f1b14
	Namespace: namespace_d20e7d3b
	Checksum: 0xC6889144
	Offset: 0x5C0
	Size: 0x334
	Parameters: 0
	Flags: Linked
*/
function function_157f1b14()
{
	self notify("562ef6d54ec2bd07");
	self endon("562ef6d54ec2bd07");
	level endon(#"game_over");
	while(true)
	{
		wait(0.5);
		state = namespace_4dae815d::function_59a9cf1d();
		if(state == 0)
		{
			continue;
		}
		foreach(trap in level.doa.var_f9d893a7)
		{
			time = gettime();
			if(isdefined(trap.var_eb9d64bb) && time < trap.var_eb9d64bb)
			{
				continue;
			}
			trap.var_eb9d64bb = (time + 2000) + randomint(600);
			if(!isdefined(trap.script_model))
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
					trap.var_f8660931 = namespace_ec06fe4a::function_6eacecf5(trap.origin, 3200);
					if(isdefined(trap.var_f8660931))
					{
						activate = 1;
					}
					else
					{
						trap.var_f8660931 = namespace_ec06fe4a::function_bd3709ce(trap.origin, 1200);
						if(isdefined(trap.var_f8660931))
						{
							activate = 1;
						}
					}
				}
				if(activate)
				{
					function_c5cbd3bf(trap, 1);
					trap.var_eb9d64bb = trap.var_eb9d64bb + 5000;
					namespace_1e25ad94::debugmsg("Paging IN pungi trap at:" + trap.origin);
				}
				continue;
			}
			trap.var_f8660931 = namespace_ec06fe4a::function_f3eab80e(trap.origin, 3600);
			if(!isdefined(trap.var_f8660931))
			{
				trap notify(#"hash_3e251384a5400dce", {#hash_760a0807:0});
				namespace_1e25ad94::debugmsg("Paging out pungi trap at:" + trap.origin);
			}
		}
	}
}

/*
	Name: function_433b5718
	Namespace: namespace_d20e7d3b
	Checksum: 0x2220995D
	Offset: 0x900
	Size: 0x130
	Parameters: 0
	Flags: Linked
*/
function function_433b5718()
{
	level.doa.var_f9d893a7 = [];
	level thread function_157f1b14();
	if(isdefined(level.doa.var_a77e6349))
	{
		traps = [[ level.doa.var_a77e6349 ]]->function_87f950c1("pungi");
		page = 1;
	}
	else
	{
		traps = [[ level.doa.var_39e3fa99 ]]->function_242886d5("pungi");
	}
	foreach(trap in traps)
	{
		function_f42615a9(trap, page);
	}
}

/*
	Name: function_20cf5ee5
	Namespace: namespace_d20e7d3b
	Checksum: 0xB0252F70
	Offset: 0xA38
	Size: 0x2F8
	Parameters: 0
	Flags: Linked
*/
function function_20cf5ee5()
{
	self notify("7bd720a76a24ef37");
	self endon("7bd720a76a24ef37");
	level endon(#"game_over");
	self endon(#"hash_3e251384a5400dce");
	self thread function_be14ecd2();
	if(!isdefined(self.script_model))
	{
		self notify(#"hash_3e251384a5400dce");
	}
	up = anglestoup(self.angles);
	var_16ddcf3 = vectorscale(up, -24);
	var_cae2bc5d = vectorscale(up, -48);
	wait(randomfloat(10));
	while(true)
	{
		self.state = 1;
		self.script_model namespace_e32bb68::function_3a59ec34("evt_doa_hazard_pungi_spike_down");
		self.script_model moveto(self.origin + var_cae2bc5d, 0.15);
		self.script_model waittill(#"movedone");
		self.script_model hide();
		wait(12);
		self.script_model show();
		self.state = 2;
		self.script_model moveto(self.origin + var_16ddcf3, 0.15);
		self.script_model waittill(#"movedone");
		self.script_model namespace_e32bb68::function_3a59ec34("evt_doa_hazard_pungi_spike_set");
		self.script_model namespace_83eb6304::function_3ecfde67("pungi_hint");
		wait(3);
		self.state = 3;
		self thread function_1e690b43();
		self.script_model namespace_e32bb68::function_3a59ec34("evt_doa_hazard_pungi_spike_up");
		self.script_model namespace_83eb6304::function_3ecfde67("pungi_activate");
		self.script_model moveto(self.origin, 0.15);
		wait(6);
		self.script_model namespace_83eb6304::turnofffx("pungi_hint");
	}
}

/*
	Name: function_1e690b43
	Namespace: namespace_d20e7d3b
	Checksum: 0x451FB1C6
	Offset: 0xD38
	Size: 0x29C
	Parameters: 0
	Flags: Linked
*/
function function_1e690b43()
{
	self endon(#"hash_3e251384a5400dce");
	trigger = undefined;
	while(isdefined(self) && self.state === 3)
	{
		if(!isdefined(trigger))
		{
			trigger = namespace_268747c0::function_5bfa98c9("pungi", self.origin);
			if(isdefined(trigger))
			{
				trigger.origin = self.origin;
				trigger.angles = self.angles;
			}
		}
		if(isdefined(trigger))
		{
			result = undefined;
			result = trigger waittilltimeout(0.25, #"trigger");
			guy = result.activator;
			if(isdefined(guy) && isalive(guy))
			{
				if(is_true(guy.var_47267079) || is_true(guy.boss))
				{
					continue;
				}
				if(isvehicle(guy))
				{
					continue;
				}
				if(isplayer(guy) && isdefined(guy.doa.vehicle))
				{
					continue;
				}
				if(!isdefined(guy.var_69a33279))
				{
					guy.var_69a33279 = 0;
				}
				if(guy.var_69a33279 < gettime())
				{
					guy namespace_e32bb68::function_3a59ec34("evt_doa_hazard_pungi_spike_impact");
					guy namespace_83eb6304::function_3ecfde67("pungi_damage");
					guy.var_69a33279 = gettime() + 1000;
				}
				if(isplayer(guy))
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
	if(isdefined(trigger))
	{
		trigger namespace_268747c0::function_54f185a();
	}
}

