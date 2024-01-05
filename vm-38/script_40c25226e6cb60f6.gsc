#using script_164a456ce05c3483;
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

#namespace namespace_c228bbfa;

/*
	Name: function_65742d70
	Namespace: namespace_c228bbfa
	Checksum: 0xD696764B
	Offset: 0x200
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_65742d70()
{
	level notify(1857794731);
}

#namespace namespace_61052b71;

/*
	Name: init
	Namespace: namespace_61052b71
	Checksum: 0x80F724D1
	Offset: 0x220
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function init()
{
}

/*
	Name: main
	Namespace: namespace_61052b71
	Checksum: 0x40B3DB2E
	Offset: 0x230
	Size: 0x16
	Parameters: 0
	Flags: None
*/
function main()
{
	level.doa.var_17228d33 = [];
}

/*
	Name: function_5529395e
	Namespace: namespace_61052b71
	Checksum: 0x1EBA0B37
	Offset: 0x250
	Size: 0x156
	Parameters: 0
	Flags: Linked
*/
function function_5529395e()
{
	self notify("21a1deafb5f08486");
	self endon("21a1deafb5f08486");
	self thread namespace_268747c0::function_978c05b5();
	result = undefined;
	result = self waittill(#"hash_3e251384a5400dce");
	if(is_true(self.paged) && is_true(result.var_760a0807))
	{
		arrayremovevalue(level.doa.var_17228d33, self);
		namespace_1e25ad94::debugmsg("Deleting physics box trap permenently at:" + self.origin);
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
		self.script_model = undefined;
	}
}

/*
	Name: function_8b014c60
	Namespace: namespace_61052b71
	Checksum: 0x60B45474
	Offset: 0x3B0
	Size: 0x218
	Parameters: 2
	Flags: Linked
*/
function function_8b014c60(trap, paged)
{
	if(!isdefined(paged))
	{
		paged = 0;
	}
	/#
		assert(isdefined(trap.script_parameters), "");
	#/
	args = strtok(trap.script_parameters, ";");
	trap.var_b7a27a3a = 0;
	if(isdefined(trap.script_int))
	{
		trap.var_b7a27a3a = int(trap.script_int);
	}
	switch(args[0])
	{
		case "velocity":
		{
			/#
				assert(args.size >= 4, "");
			#/
			trap.var_88eccffa = (float(args[1]), float(args[2]), float(args[3]));
			trap.type = 0;
			break;
		}
		default:
		{
			/#
				assert(0);
			#/
			break;
		}
	}
	trap.script_model = namespace_ec06fe4a::function_e22ae9b3(trap.origin, trap.model, trap.angles);
	if(isdefined(trap.script_model))
	{
		trap.script_model.targetname = "hazard";
		trap.script_model.var_fd5301f9 = "physicsbox";
	}
	trap.paged = paged;
	trap thread function_d74e40c3();
	return trap;
}

/*
	Name: function_bb1d1cf9
	Namespace: namespace_61052b71
	Checksum: 0xD5B56091
	Offset: 0x5D0
	Size: 0x10C
	Parameters: 2
	Flags: Linked
*/
function function_bb1d1cf9(trap, page)
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
		if(!isdefined(level.doa.var_17228d33))
		{
			level.doa.var_17228d33 = [];
		}
		else if(!isarray(level.doa.var_17228d33))
		{
			level.doa.var_17228d33 = array(level.doa.var_17228d33);
		}
		level.doa.var_17228d33[level.doa.var_17228d33.size] = trap;
	}
	else
	{
		function_8b014c60(trap);
	}
}

/*
	Name: function_e74a3df6
	Namespace: namespace_61052b71
	Checksum: 0xEB2EFA56
	Offset: 0x6E8
	Size: 0x2F4
	Parameters: 0
	Flags: Linked
*/
function function_e74a3df6()
{
	self notify("6a2e88ac4d6010df");
	self endon("6a2e88ac4d6010df");
	level endon(#"game_over");
	while(true)
	{
		wait(0.5);
		state = namespace_4dae815d::function_59a9cf1d();
		if(state == 0)
		{
			continue;
		}
		foreach(trap in level.doa.var_17228d33)
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
				}
				if(activate)
				{
					function_8b014c60(trap, 1);
					trap.var_eb9d64bb = trap.var_eb9d64bb + 5000;
					namespace_1e25ad94::debugmsg("Paging IN physics box trap at:" + trap.origin);
				}
				continue;
			}
			trap.var_f8660931 = namespace_ec06fe4a::function_6eacecf5(trap.origin, 3600);
			if(!isdefined(trap.var_f8660931))
			{
				trap notify(#"hash_3e251384a5400dce", {#hash_760a0807:0});
				namespace_1e25ad94::debugmsg("Paging out physics box trap at:" + trap.origin);
			}
		}
	}
}

/*
	Name: function_8bd713b2
	Namespace: namespace_61052b71
	Checksum: 0x4B9ECE37
	Offset: 0x9E8
	Size: 0x130
	Parameters: 0
	Flags: Linked
*/
function function_8bd713b2()
{
	level.doa.var_17228d33 = [];
	level thread function_e74a3df6();
	if(isdefined(level.doa.var_a77e6349))
	{
		traps = [[ level.doa.var_a77e6349 ]]->function_87f950c1("physicsbox");
		page = 1;
	}
	else
	{
		traps = [[ level.doa.var_39e3fa99 ]]->function_242886d5("physicsbox");
	}
	foreach(trap in traps)
	{
		function_bb1d1cf9(trap, page);
	}
}

/*
	Name: function_d74e40c3
	Namespace: namespace_61052b71
	Checksum: 0x8540C8B
	Offset: 0xB20
	Size: 0x486
	Parameters: 0
	Flags: Linked
*/
function function_d74e40c3()
{
	self notify("1f0b44627f606460");
	self endon("1f0b44627f606460");
	level endon(#"game_over");
	self endon(#"hash_3e251384a5400dce");
	self thread function_5529395e();
	if(!isdefined(self.script_model))
	{
		self notify(#"hash_3e251384a5400dce");
	}
	var_d71f280f = self.origin;
	var_2aedafcb = var_d71f280f + vectorscale((0, 0, 1), 15);
	while(isdefined(self))
	{
		waitframe(1);
		if(!isdefined(self.trigger))
		{
			self.trigger = self namespace_268747c0::function_678eaf60("physicsbox", self.origin, 256, 1, 128);
			self.trigger.origin = self.trigger.origin + (0, 0, self.var_b7a27a3a);
			self.trigger triggerenable(1);
		}
		else
		{
			result = undefined;
			result = self.trigger waittill(#"trigger", #"hash_5dc5b7f198cd1bec");
			if(result._notify === #"hash_5dc5b7f198cd1bec")
			{
				wait(0.25);
				continue;
			}
			self.script_model moveto(var_2aedafcb, 0.1);
			guy = result.activator;
			switch(self.type)
			{
				case 0:
				{
					if(isplayer(guy))
					{
						self.script_model namespace_e32bb68::function_3a59ec34("zmb_physicsBoxVelocity");
						var_c84aa3c4 = guy getvelocity() + self.var_88eccffa;
						guy setorigin(guy.origin + vectorscale((0, 0, 1), 30));
						waitframe(1);
						if(isdefined(guy))
						{
							guy setvelocity(var_c84aa3c4);
							if(namespace_4dae815d::function_59a9cf1d() != 0)
							{
								guy thread namespace_7f5aeb59::function_a74228bc();
							}
							guy namespace_e32bb68::function_3a59ec34("evt_doa_springboard");
						}
					}
					else if(isactor(guy))
					{
						if(isdefined(guy.launched))
						{
							continue;
						}
						if(!issentient(guy))
						{
							continue;
						}
						if(!is_true(guy.takedamage))
						{
							continue;
						}
						if(is_true(guy.var_47267079) || is_true(guy.boss))
						{
							continue;
						}
						if(!is_true(guy.no_ragdoll))
						{
							guy.launched = 1;
							guy thread namespace_ec06fe4a::function_5678f0d(self.var_88eccffa, 180, 0.3);
							guy namespace_e32bb68::function_3a59ec34("zmb_ragdoll_launched");
							guy namespace_e32bb68::function_3a59ec34("evt_doa_springboard");
						}
					}
					break;
				}
			}
			wait(5);
			self.script_model moveto(var_d71f280f, 2);
			wait(2);
		}
	}
}

