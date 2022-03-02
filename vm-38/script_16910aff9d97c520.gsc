#using script_17dcb1172e441bf6;
#using script_1b0b07ff57d1dde3;
#using script_1ee011cd0961afd7;
#using script_2a5bf5b4a00cee0d;
#using script_47851dbeea22fe66;
#using script_57f7003580bb15e0;
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

#namespace namespace_6624770a;

/*
	Name: function_ee531218
	Namespace: namespace_6624770a
	Checksum: 0xA3EC0D7C
	Offset: 0x1F0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ee531218()
{
	level notify(1222393815);
}

/*
	Name: init
	Namespace: namespace_6624770a
	Checksum: 0x80F724D1
	Offset: 0x210
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function init()
{
}

/*
	Name: main
	Namespace: namespace_6624770a
	Checksum: 0xA004E829
	Offset: 0x220
	Size: 0x16
	Parameters: 0
	Flags: Linked
*/
function main()
{
	level.doa.var_e60dfadc = [];
}

/*
	Name: function_49caf2d6
	Namespace: namespace_6624770a
	Checksum: 0x96A27EF9
	Offset: 0x240
	Size: 0x14C
	Parameters: 0
	Flags: Linked
*/
function function_49caf2d6()
{
	self notify("7982aa19a2f9f78d");
	self endon("7982aa19a2f9f78d");
	self thread namespace_268747c0::function_978c05b5();
	result = undefined;
	result = self waittill(#"hash_3e251384a5400dce");
	if(is_true(self.paged) && is_true(result.var_760a0807))
	{
		arrayremovevalue(level.doa.var_e60dfadc, self);
		namespace_1e25ad94::debugmsg("Deleting killbox trap permenently at:" + self.origin);
	}
	util::wait_network_frame();
	if(isdefined(self.trigger))
	{
		self.trigger namespace_268747c0::function_54f185a();
		self.trigger = undefined;
	}
	if(isdefined(self.script_model))
	{
		self.script_model delete();
	}
}

/*
	Name: function_7023aae4
	Namespace: namespace_6624770a
	Checksum: 0xFA5EDCEC
	Offset: 0x398
	Size: 0xD8
	Parameters: 3
	Flags: Linked
*/
function function_7023aae4(trap, paged, modelname)
{
	if(!isdefined(paged))
	{
		paged = 0;
	}
	if(isdefined(modelname))
	{
		hazard = namespace_ec06fe4a::function_e22ae9b3(trap.origin, modelname);
		if(isdefined(hazard))
		{
			hazard.targetname = "hazard";
			hazard.var_fd5301f9 = "killbox";
			hazard.angles = trap.angles;
			hazard enablelinkto();
		}
		trap.script_model = hazard;
	}
	trap.paged = paged;
	trap thread function_e7b3a3fe();
	return trap;
}

/*
	Name: function_bbdbcaa5
	Namespace: namespace_6624770a
	Checksum: 0xCC4532AE
	Offset: 0x478
	Size: 0x34C
	Parameters: 2
	Flags: Linked
*/
function function_bbdbcaa5(trap, page)
{
	if(!isdefined(page))
	{
		page = 0;
	}
	if(!is_true(trap.initialized))
	{
		/#
			assert(isdefined(trap.script_parameters), "");
		#/
		args = strtok(trap.script_parameters, ";");
		/#
			assert(args.size >= 4, "");
		#/
		trap.type = hash(args[0]);
		trap.length = int(args[1]);
		trap.width = int(args[2]);
		trap.height = int(args[3]);
		trap.teleport = 1;
		if(args.size > 4)
		{
			trap.teleport = int(args[4]);
		}
		trap.damage = 50;
		trap.tickrate = 1;
		if(args.size > 5)
		{
			trap.damage = int(args[5]);
		}
		if(args.size > 6)
		{
			trap.tickrate = int(args[6]);
		}
		if(trap.type === #"acid")
		{
			trap.var_2e485cc = function_4d1e7b48(#"hash_69c2a47bf2322b6b");
		}
		if(trap.type === #"fire")
		{
			trap.var_2e485cc = function_4d1e7b48(#"hash_69374f563cb01313");
		}
		trap.initialized = 1;
	}
	if(page)
	{
		if(!isdefined(level.doa.var_e60dfadc))
		{
			level.doa.var_e60dfadc = [];
		}
		else if(!isarray(level.doa.var_e60dfadc))
		{
			level.doa.var_e60dfadc = array(level.doa.var_e60dfadc);
		}
		level.doa.var_e60dfadc[level.doa.var_e60dfadc.size] = trap;
	}
	else
	{
		function_7023aae4(trap);
	}
}

/*
	Name: function_d4a86caf
	Namespace: namespace_6624770a
	Checksum: 0x62E15AC7
	Offset: 0x7D0
	Size: 0x31C
	Parameters: 0
	Flags: Linked
*/
function function_d4a86caf()
{
	self notify("41f606aa177d8d06");
	self endon("41f606aa177d8d06");
	level endon(#"game_over");
	while(true)
	{
		wait(0.5);
		foreach(trap in level.doa.var_e60dfadc)
		{
			time = gettime();
			if(isdefined(trap.var_eb9d64bb) && time < trap.var_eb9d64bb)
			{
				continue;
			}
			trap.var_eb9d64bb = (time + 2000) + randomint(600);
			if(!is_true(trap.active))
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
					function_7023aae4(trap, 1);
					trap.var_eb9d64bb = trap.var_eb9d64bb + 5000;
					namespace_1e25ad94::debugmsg("Paging IN killbox trap at:" + trap.origin);
				}
				continue;
			}
			trap.var_f8660931 = namespace_ec06fe4a::function_f3eab80e(trap.origin, 3600);
			if(!isdefined(trap.var_f8660931))
			{
				trap notify(#"hash_3e251384a5400dce", {#hash_760a0807:0});
				namespace_1e25ad94::debugmsg("Paging out killbox trap at:" + trap.origin);
			}
		}
	}
}

/*
	Name: function_813ad4cb
	Namespace: namespace_6624770a
	Checksum: 0x47903BCB
	Offset: 0xAF8
	Size: 0x156
	Parameters: 1
	Flags: Linked
*/
function function_813ad4cb(traps)
{
	level.doa.var_e60dfadc = [];
	level thread function_d4a86caf();
	if(isdefined(level.doa.var_a77e6349))
	{
		traps = [[ level.doa.var_a77e6349 ]]->function_87f950c1("killbox");
		page = 1;
		arena = 0;
	}
	else
	{
		traps = [[ level.doa.var_39e3fa99 ]]->function_242886d5("killbox");
		arena = 1;
	}
	foreach(trap in traps)
	{
		function_bbdbcaa5(trap, page);
		trap.arena = arena;
	}
}

/*
	Name: function_e7b3a3fe
	Namespace: namespace_6624770a
	Checksum: 0xAAA3C36C
	Offset: 0xC58
	Size: 0x238
	Parameters: 0
	Flags: Linked
*/
function function_e7b3a3fe()
{
	self notify("37f159c943c3db47");
	self endon("37f159c943c3db47");
	level endon(#"game_over");
	self endon(#"hash_3e251384a5400dce");
	self thread function_49caf2d6();
	wait(randomfloatrange(0.1, 3));
	while(true)
	{
		self.trigger = self namespace_268747c0::function_678eaf60("killbox", self.origin, 1024, 1, 256);
		if(self.trigger.width != self.width || self.trigger.length != self.length || self.trigger.height != self.height)
		{
			self.trigger delete();
			namespace_268747c0::function_e8bbd3ad("killbox");
			self.trigger = namespace_268747c0::function_3111b4b2("killbox", "trigger_box", self.length, self.height, self.width);
			if(isdefined(self.trigger))
			{
				self.trigger namespace_268747c0::function_b3c196a(self, self.origin, self.angles);
			}
		}
		if(!isdefined(self.trigger))
		{
			wait(0.2);
			continue;
		}
		self.trigger thread function_d1b295d7(self);
		wait(1);
		if(isdefined(self.trigger))
		{
			self.trigger triggerenable(1);
			while(isdefined(self.trigger))
			{
				wait(0.25);
			}
		}
	}
}

/*
	Name: function_d1b295d7
	Namespace: namespace_6624770a
	Checksum: 0x40BEC4C
	Offset: 0xE98
	Size: 0x490
	Parameters: 1
	Flags: Linked
*/
function function_d1b295d7(trap)
{
	self notify("10130a76d58d799d");
	self endon("10130a76d58d799d");
	level endon(#"game_over");
	self endon(#"death", #"hash_3e251384a5400dce", #"hash_5dc5b7f198cd1bec");
	tickrate = (isdefined(trap.tickrate) ? trap.tickrate : 1) * 1000;
	while(true)
	{
		result = undefined;
		result = self waittill(#"trigger");
		guy = result.activator;
		if(!isdefined(guy))
		{
			continue;
		}
		if(is_true(guy.var_47267079) || is_true(guy.boss))
		{
			continue;
		}
		if(is_true(guy.laststand))
		{
			continue;
		}
		if(!isalive(guy))
		{
			continue;
		}
		if(!isdefined(guy.var_a138f7e0))
		{
			guy.var_a138f7e0 = 0;
		}
		time = gettime();
		if(guy.var_a138f7e0 > gettime())
		{
			continue;
		}
		guy.var_a138f7e0 = time + tickrate;
		if(isplayer(guy))
		{
			guy dodamage((isdefined(trap.damage) ? trap.damage : guy.health + 100), guy.origin);
			guy playrumbleonentity("damage_light");
			if(isdefined(trap.var_2e485cc) && guy.birthtime != gettime())
			{
				guy thread status_effect::status_effect_apply(trap.var_2e485cc, guy.currentweapon, self, 1);
			}
		}
		else
		{
			if(!isdefined(guy.var_4ff10643))
			{
				guy.var_4ff10643 = 0;
			}
			if(guy.var_4ff10643 < gettime())
			{
				if(trap.type === #"fire")
				{
					guy namespace_83eb6304::function_3ecfde67("burn_zombie");
				}
				guy.var_4ff10643 = gettime() + 1000;
			}
			if(trap.type === #"fire")
			{
				guy thread namespace_ec06fe4a::function_570729f0(randomfloatrange(0.5, 2.2));
			}
			if(trap.type === #"hash_1af42a1c565c45de")
			{
				guy thread namespace_ec06fe4a::function_570729f0(0.1);
				guy thread namespace_ed80aead::function_586ef822();
			}
			else
			{
				guy thread namespace_ec06fe4a::function_570729f0(0.1);
			}
		}
		level notify(#"hash_46fa6c5088941b95", {#guy:guy});
		if(isplayer(guy) && is_true(trap.arena) && is_true(trap.teleport))
		{
			spot = [[ level.doa.var_39e3fa99 ]]->function_70fb5745();
			guy setorigin(spot.origin);
		}
	}
}

