#using scripts\core_common\flag_shared.gsc;

#namespace system_shared;

/*
	Name: function_32cc6365
	Namespace: system_shared
	Checksum: 0x6F2996CA
	Offset: 0x88
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_32cc6365()
{
	level notify(-1387797376);
}

#namespace system;

/*
	Name: register
	Namespace: system
	Checksum: 0x1BC3B3B3
	Offset: 0xA8
	Size: 0x194
	Parameters: 5
	Flags: Linked
*/
function register(str_name, func_preinit, func_postinit, var_e9137475, reqs)
{
	if(isdefined(level.system_funcs[str_name]))
	{
		/#
			assert(level.system_funcs[str_name].flags & 1, ("" + function_9e72a96(str_name)) + "");
		#/
		return;
	}
	if(!isdefined(level.system_funcs))
	{
		level.system_funcs = [];
	}
	system = {#flags:0, #reqs:reqs, #hash_f30a1800:var_e9137475, #postfunc:func_postinit, #prefunc:func_preinit};
	system.flags = system.flags | (isdefined(func_preinit) ? 2 : 0);
	system.flags = system.flags | (isdefined(func_postinit) ? 4 : 0);
	system.flags = system.flags | (isdefined(var_e9137475) ? 8 : 0);
	level.system_funcs[str_name] = system;
}

/*
	Name: exec_post_system
	Namespace: system
	Checksum: 0x9E3C274A
	Offset: 0x248
	Size: 0x90
	Parameters: 1
	Flags: Linked
*/
function exec_post_system(func)
{
	if(!isdefined(func) || func.flags & 1)
	{
		return;
	}
	if(!func.flags & 4)
	{
		if(isdefined(func.reqs))
		{
			function_5095b2c6(func);
		}
		func.flags = func.flags | 4;
		[[func.postfunc]]();
	}
}

/*
	Name: function_5095b2c6
	Namespace: system
	Checksum: 0xEC158645
	Offset: 0x2E0
	Size: 0x1E4
	Parameters: 1
	Flags: Linked
*/
function function_5095b2c6(func)
{
	/#
		assert(func.flags & 2 || func.flags & 1, "");
	#/
	if(isdefined(func.reqs))
	{
		if(isarray(func.reqs))
		{
			foreach(req in func.reqs)
			{
				/#
					assert(isdefined(req), ("" + req) + "");
				#/
				thread exec_post_system(level.system_funcs[req]);
			}
		}
		else
		{
			/#
				assert(isdefined(level.system_funcs[func.reqs]), ("" + (ishash(func.reqs) ? function_9e72a96(func.reqs) : func.reqs)) + "");
			#/
			thread exec_post_system(level.system_funcs[func.reqs]);
		}
	}
}

/*
	Name: run_post_systems
	Namespace: system
	Checksum: 0x733C33AA
	Offset: 0x4D0
	Size: 0xBC
	Parameters: 0
	Flags: Linked
*/
function run_post_systems()
{
	foreach(func in level.system_funcs)
	{
		function_5095b2c6(func);
		thread exec_post_system(func);
	}
	level flag::set("system_postinit_complete");
}

/*
	Name: exec_pre_system
	Namespace: system
	Checksum: 0x97EAF1B
	Offset: 0x598
	Size: 0x8E
	Parameters: 1
	Flags: Linked
*/
function exec_pre_system(func)
{
	if(!isdefined(func) || func.flags & 1)
	{
		return;
	}
	if(!func.flags & 2)
	{
		if(isdefined(func.reqs))
		{
			function_8dfa23e0(func);
		}
		[[func.prefunc]]();
		func.flags = func.flags | 2;
	}
}

/*
	Name: function_8dfa23e0
	Namespace: system
	Checksum: 0xCE624ABC
	Offset: 0x630
	Size: 0x1A4
	Parameters: 1
	Flags: Linked
*/
function function_8dfa23e0(func)
{
	if(isdefined(func.reqs))
	{
		if(isarray(func.reqs))
		{
			foreach(req in func.reqs)
			{
				/#
					assert(isdefined(req), ("" + req) + "");
				#/
				thread exec_pre_system(level.system_funcs[req]);
			}
		}
		else
		{
			/#
				assert(isdefined(level.system_funcs[func.reqs]), ("" + (ishash(func.reqs) ? function_9e72a96(func.reqs) : func.reqs)) + "");
			#/
			thread exec_pre_system(level.system_funcs[func.reqs]);
		}
	}
}

/*
	Name: run_pre_systems
	Namespace: system
	Checksum: 0xCA9ACCEB
	Offset: 0x7E0
	Size: 0xA0
	Parameters: 0
	Flags: Linked
*/
function run_pre_systems()
{
	foreach(func in level.system_funcs)
	{
		function_8dfa23e0(func);
		thread exec_pre_system(func);
	}
}

/*
	Name: function_6cc01f0
	Namespace: system
	Checksum: 0xF08E64DC
	Offset: 0x888
	Size: 0x8E
	Parameters: 1
	Flags: Linked
*/
function function_6cc01f0(func)
{
	if(!isdefined(func) || func.flags & 1)
	{
		return;
	}
	if(!func.flags & 8)
	{
		if(isdefined(func.reqs))
		{
			function_3e3686fa(func);
		}
		[[func.var_f30a1800]]();
		func.flags = func.flags | 8;
	}
}

/*
	Name: function_3e3686fa
	Namespace: system
	Checksum: 0x70AC3458
	Offset: 0x920
	Size: 0x1A4
	Parameters: 1
	Flags: Linked
*/
function function_3e3686fa(func)
{
	if(isdefined(func.reqs))
	{
		if(isarray(func.reqs))
		{
			foreach(req in func.reqs)
			{
				/#
					assert(isdefined(req), ("" + req) + "");
				#/
				thread function_6cc01f0(level.system_funcs[req]);
			}
		}
		else
		{
			/#
				assert(isdefined(level.system_funcs[func.reqs]), ("" + (ishash(func.reqs) ? function_9e72a96(func.reqs) : func.reqs)) + "");
			#/
			thread function_6cc01f0(level.system_funcs[func.reqs]);
		}
	}
}

/*
	Name: function_b1553822
	Namespace: system
	Checksum: 0xB5B06090
	Offset: 0xAD0
	Size: 0xAA
	Parameters: 0
	Flags: Linked
*/
function function_b1553822()
{
	foreach(func in level.system_funcs)
	{
		function_3e3686fa(func);
		thread function_6cc01f0(func);
	}
	level.system_funcs = undefined;
}

/*
	Name: function_c11b0642
	Namespace: system
	Checksum: 0x5F70539D
	Offset: 0xB88
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_c11b0642()
{
	level flag::wait_till(#"system_postinit_complete");
}

/*
	Name: ignore
	Namespace: system
	Checksum: 0x48A8B012
	Offset: 0xBB8
	Size: 0x92
	Parameters: 1
	Flags: Linked
*/
function ignore(str_name)
{
	/#
		assert(!isdefined(level.gametype), "");
	#/
	if(!isdefined(level.system_funcs[str_name]))
	{
		register(str_name);
	}
	level.system_funcs[str_name].flags = level.system_funcs[str_name].flags | 1;
}

