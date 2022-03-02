#using script_17dcb1172e441bf6;
#using script_1b0b07ff57d1dde3;
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
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace namespace_2a2a39d4;

/*
	Name: function_64a6e2b2
	Namespace: namespace_2a2a39d4
	Checksum: 0x9498EDC9
	Offset: 0x258
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_64a6e2b2()
{
	level notify(556168391);
}

/*
	Name: init
	Namespace: namespace_2a2a39d4
	Checksum: 0x35CE717D
	Offset: 0x278
	Size: 0x52
	Parameters: 0
	Flags: Linked
*/
function init()
{
	level.doa.var_45c191a4 = getweapon("zombietron_fireball_weapon");
	level.doa.var_18a44fc1 = getweapon("zombietron_fireball_weapon_gravity");
}

/*
	Name: main
	Namespace: namespace_2a2a39d4
	Checksum: 0x7A038BED
	Offset: 0x2D8
	Size: 0x16
	Parameters: 0
	Flags: Linked
*/
function main()
{
	level.doa.var_a8a43931 = [];
}

/*
	Name: function_cddc7db1
	Namespace: namespace_2a2a39d4
	Checksum: 0x5AB25B27
	Offset: 0x2F8
	Size: 0x11C
	Parameters: 0
	Flags: Linked
*/
function function_cddc7db1()
{
	self notify("581b8d63530ee93f");
	self endon("581b8d63530ee93f");
	self thread namespace_268747c0::function_978c05b5();
	result = undefined;
	result = self waittill(#"hash_3e251384a5400dce");
	if(is_true(self.paged) && is_true(result.var_760a0807))
	{
		arrayremovevalue(level.doa.var_a8a43931, self);
		namespace_1e25ad94::debugmsg("Deleting Fireball trap permenently at:" + self.origin);
	}
	util::wait_network_frame();
	if(isdefined(self.script_model))
	{
		self.script_model delete();
	}
}

/*
	Name: function_b9c75c0
	Namespace: namespace_2a2a39d4
	Checksum: 0xAE4C9085
	Offset: 0x420
	Size: 0x2E0
	Parameters: 2
	Flags: Linked
*/
function function_b9c75c0(trap, paged)
{
	if(!isdefined(paged))
	{
		paged = 0;
	}
	trap.weapon = level.doa.var_45c191a4;
	trap.var_5a546472 = 0;
	if(isdefined(trap.script_parameters))
	{
		toks = strtok(trap.script_parameters, ";");
		if(toks.size > 0)
		{
			if(toks[0] === "gravity")
			{
				trap.weapon = level.doa.var_18a44fc1;
			}
			else
			{
				trap.weapon = level.doa.var_45c191a4;
			}
		}
		if(toks.size > 1)
		{
			trap.var_dc3a5332 = int(toks[1]);
		}
		if(toks.size > 2)
		{
			trap.hidemodel = int(toks[2]);
		}
		if(toks.size > 3)
		{
			trap.var_5a546472 = (int(toks[3]) ? 1 : 0);
		}
		if(toks.size > 4)
		{
			trap.var_f92c74e = int(toks[4]);
		}
	}
	if(isdefined(trap.var_dc3a5332) && level.doa.roundnumber < trap.var_dc3a5332)
	{
		return;
	}
	hazard = namespace_ec06fe4a::function_e22ae9b3(trap.origin, "zombietron_fireball_trap");
	if(isdefined(hazard))
	{
		hazard.targetname = "hazard";
		hazard.var_fd5301f9 = "fireball";
		hazard.angles = trap.angles;
		hazard.team = "axis";
		if(is_true(trap.hidemodel))
		{
			hazard hide();
		}
	}
	trap.script_model = hazard;
	trap.paged = paged;
	trap.velocity = (isdefined(trap.script_int) ? int(trap.script_int) : 200);
	trap thread function_14a55bfa();
	return trap;
}

/*
	Name: function_7a2f725d
	Namespace: namespace_2a2a39d4
	Checksum: 0xDBCF007A
	Offset: 0x708
	Size: 0x10C
	Parameters: 2
	Flags: Linked
*/
function function_7a2f725d(trap, page)
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
		if(!isdefined(level.doa.var_a8a43931))
		{
			level.doa.var_a8a43931 = [];
		}
		else if(!isarray(level.doa.var_a8a43931))
		{
			level.doa.var_a8a43931 = array(level.doa.var_a8a43931);
		}
		level.doa.var_a8a43931[level.doa.var_a8a43931.size] = trap;
	}
	else
	{
		function_b9c75c0(trap);
	}
}

/*
	Name: function_d4a86caf
	Namespace: namespace_2a2a39d4
	Checksum: 0xC00EBAB5
	Offset: 0x820
	Size: 0x30C
	Parameters: 0
	Flags: Linked
*/
function function_d4a86caf()
{
	self notify("5894af4637062527");
	self endon("5894af4637062527");
	level endon(#"game_over");
	while(true)
	{
		wait(0.5);
		foreach(trap in level.doa.var_a8a43931)
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
					function_b9c75c0(trap, 1);
					trap.var_eb9d64bb = trap.var_eb9d64bb + 5000;
					namespace_1e25ad94::debugmsg("Paging IN fireball trap at:" + trap.origin);
				}
				continue;
			}
			trap.var_f8660931 = namespace_ec06fe4a::function_f3eab80e(trap.origin, 3600);
			if(!isdefined(trap.var_f8660931))
			{
				trap notify(#"hash_3e251384a5400dce", {#hash_760a0807:0});
				namespace_1e25ad94::debugmsg("Paging out fireball trap at:" + trap.origin);
			}
		}
	}
}

/*
	Name: function_3a25f62f
	Namespace: namespace_2a2a39d4
	Checksum: 0x342FFB7D
	Offset: 0xB38
	Size: 0x130
	Parameters: 0
	Flags: Linked
*/
function function_3a25f62f()
{
	level.doa.var_a8a43931 = [];
	level thread function_d4a86caf();
	if(isdefined(level.doa.var_a77e6349))
	{
		traps = [[ level.doa.var_a77e6349 ]]->function_87f950c1("fireball");
		page = 1;
	}
	else
	{
		traps = [[ level.doa.var_39e3fa99 ]]->function_242886d5("fireball");
	}
	foreach(trap in traps)
	{
		function_7a2f725d(trap, page);
	}
}

/*
	Name: function_14a55bfa
	Namespace: namespace_2a2a39d4
	Checksum: 0x8CE32CDB
	Offset: 0xC70
	Size: 0x338
	Parameters: 0
	Flags: Linked
*/
function function_14a55bfa()
{
	self notify("5a345b0f2222d448");
	self endon("5a345b0f2222d448");
	level endon(#"game_over");
	self endon(#"hash_3e251384a5400dce");
	self thread function_cddc7db1();
	if(!isdefined(self.script_model))
	{
		self notify(#"hash_3e251384a5400dce");
	}
	origin = self.script_model gettagorigin("tag_flash_lvl3_le");
	angles = self.script_model gettagangles("tag_flash_lvl3_le");
	var_7ceb92b = self.velocity;
	var_c36bfa20 = self.velocity * 0.08;
	var_ac885920 = is_true(self.var_5a546472) && (!isdefined(level.doa.var_6f3d327) && !isdefined(level.doa.var_182fb75a));
	minwait = (isdefined(self.var_f92c74e) ? self.var_f92c74e : 5);
	maxwait = (isdefined(self.var_f92c74e) ? self.var_f92c74e << 1 : 10);
	while(true)
	{
		wait(randomfloatrange(minwait, maxwait));
		for(rounds = randomint(3) + 1; rounds; rounds--)
		{
			newangles = angles;
			if(var_ac885920)
			{
				newangles = newangles + (randomfloatrange(-4, 4), randomfloatrange(-4, 4), randomfloatrange(-2, 2));
			}
			launchvector = anglestoforward(newangles);
			velocity = launchvector * (var_7ceb92b + (randomfloatrange(var_c36bfa20 * -1, var_c36bfa20)));
			missile = self.script_model magicmissile(self.weapon, origin, velocity);
			self.script_model namespace_e32bb68::function_3a59ec34("zmb_doa_fireball_emit");
			wait(randomfloatrange(1, 4));
		}
	}
}

