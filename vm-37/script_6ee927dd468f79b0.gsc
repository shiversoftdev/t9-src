#using script_47851dbeea22fe66;
#using script_774302f762d76254;
#using script_1ee011cd0961afd7;
#using script_1b0b07ff57d1dde3;
#using script_634ae70c663d1cc9;
#using script_17dcb1172e441bf6;
#using script_2a5bf5b4a00cee0d;
#using scripts\core_common\scene_shared.gsc;
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

#namespace namespace_2a2a39d4;

/*
	Name: init
	Namespace: namespace_2a2a39d4
	Checksum: 0x36848E0E
	Offset: 0x250
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
	Checksum: 0xF26951B2
	Offset: 0x2B0
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
	Checksum: 0xA893B7A4
	Offset: 0x2D0
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
	Checksum: 0x5942E444
	Offset: 0x3F8
	Size: 0x148
	Parameters: 2
	Flags: Linked
*/
function function_b9c75c0(trap, paged)
{
	if(!isdefined(paged))
	{
		paged = 0;
	}
	hazard = namespace_ec06fe4a::function_e22ae9b3(trap.origin, "zombietron_fireball_trap");
	if(isdefined(hazard))
	{
		hazard.targetname = "hazard";
		hazard.var_fd5301f9 = "fireball";
		hazard.angles = trap.angles;
		hazard.team = "axis";
	}
	trap.script_model = hazard;
	trap.paged = paged;
	if(trap.script_parameters === "gravity")
	{
		trap.weapon = level.doa.var_18a44fc1;
	}
	else
	{
		trap.weapon = level.doa.var_45c191a4;
	}
	trap.velocity = (isdefined(trap.script_int) ? int(trap.script_int) : 200);
	trap thread function_14a55bfa();
	return trap;
}

/*
	Name: function_7a2f725d
	Namespace: namespace_2a2a39d4
	Checksum: 0x3DFE8FCD
	Offset: 0x548
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
	Checksum: 0xA262EAD0
	Offset: 0x660
	Size: 0x30C
	Parameters: 0
	Flags: Linked
*/
function function_d4a86caf()
{
	self notify("152f2b6fa2f3ab30");
	self endon("152f2b6fa2f3ab30");
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
	Checksum: 0xB0992180
	Offset: 0x978
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
	Checksum: 0xFB9C959F
	Offset: 0xAB0
	Size: 0x1B8
	Parameters: 0
	Flags: Linked
*/
function function_14a55bfa()
{
	self notify("339dbdf18ddb8b0b");
	self endon("339dbdf18ddb8b0b");
	level endon(#"game_over");
	self endon(#"hash_3e251384a5400dce");
	self thread function_cddc7db1();
	if(!isdefined(self.script_model))
	{
		self notify(#"hash_3e251384a5400dce");
	}
	origin = self.script_model gettagorigin("tag_flash_lvl3_le");
	angles = self.script_model gettagangles("tag_flash_lvl3_le");
	velocity = anglestoforward(angles) * self.velocity;
	while(true)
	{
		wait(randomfloatrange(5, 10));
		for(rounds = randomintrange(2, 8); rounds; rounds--)
		{
			missile = self.script_model magicmissile(self.weapon, origin, velocity);
			self.script_model namespace_e32bb68::function_3a59ec34("zmb_doa_fireball_emit");
			wait(randomfloatrange(1, 4));
		}
	}
}

