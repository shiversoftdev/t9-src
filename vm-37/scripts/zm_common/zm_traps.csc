#using scripts\core_common\visionset_mgr_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\struct.csc;

#namespace zm_traps;

/*
	Name: __init__system__
	Namespace: zm_traps
	Checksum: 0xB59633A9
	Offset: 0x98
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_traps", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_traps
	Checksum: 0xC699FBD5
	Offset: 0xE0
	Size: 0xE4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	s_traps_array = struct::get_array("zm_traps", "targetname");
	a_registered_traps = [];
	foreach(trap in s_traps_array)
	{
		if(isdefined(trap.script_noteworthy))
		{
			if(!trap is_trap_registered(a_registered_traps))
			{
				a_registered_traps[trap.script_noteworthy] = 1;
			}
		}
	}
}

/*
	Name: is_trap_registered
	Namespace: zm_traps
	Checksum: 0xB60E6816
	Offset: 0x1D0
	Size: 0x18
	Parameters: 1
	Flags: Linked
*/
function is_trap_registered(a_registered_traps)
{
	return isdefined(a_registered_traps[self.script_noteworthy]);
}

