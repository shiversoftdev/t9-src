#using scripts\core_common\visionset_mgr_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\struct.csc;

#namespace zm_traps;

/*
	Name: function_8e83748
	Namespace: zm_traps
	Checksum: 0xD7834703
	Offset: 0x98
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_8e83748()
{
	level notify(-142410681);
}

/*
	Name: __init__system__
	Namespace: zm_traps
	Checksum: 0x3C97D619
	Offset: 0xB8
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
	Checksum: 0x62E43719
	Offset: 0x100
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
	Checksum: 0x75DB15B2
	Offset: 0x1F0
	Size: 0x18
	Parameters: 1
	Flags: Linked
*/
function is_trap_registered(a_registered_traps)
{
	return isdefined(a_registered_traps[self.script_noteworthy]);
}

