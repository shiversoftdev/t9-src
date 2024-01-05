#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_2a13cc4e;

/*
	Name: function_a8117988
	Namespace: namespace_2a13cc4e
	Checksum: 0xB757AEEE
	Offset: 0x98
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_a8117988()
{
	level notify(-2130333284);
}

#namespace mission_utils;

/*
	Name: __init__system__
	Namespace: mission_utils
	Checksum: 0x13BA671F
	Offset: 0xB8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"mission", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: mission_utils
	Checksum: 0x3FB00857
	Offset: 0x100
	Size: 0x34
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	clientfield::register("world", "mission_active_flags", 1, 8, "int");
}

/*
	Name: start
	Namespace: mission_utils
	Checksum: 0x7B648F8A
	Offset: 0x140
	Size: 0x84
	Parameters: 1
	Flags: None
*/
function start(mission_index)
{
	if(!isdefined(level.mission_active_flags))
	{
		level.mission_active_flags = 0;
	}
	level.mission_active_flags = level.mission_active_flags | (1 << mission_index);
	clientfield::set("mission_active_flags", level.mission_active_flags);
	startmission(mission_index);
}

/*
	Name: stop
	Namespace: mission_utils
	Checksum: 0xAAA5CC9
	Offset: 0x1D0
	Size: 0xE4
	Parameters: 1
	Flags: None
*/
function stop(mission_index)
{
	if(!isdefined(level.mission_active_flags))
	{
		level.mission_active_flags = 0;
		return;
	}
	if(!isdefined(mission_index))
	{
		for(i = 0; i < 8; i++)
		{
			stop(i);
		}
		return;
	}
	if((level.mission_active_flags & (1 << mission_index)) != 0)
	{
		level.mission_active_flags = level.mission_active_flags & (~(1 << mission_index));
		clientfield::set("mission_active_flags", level.mission_active_flags);
		stopmission(mission_index);
	}
}

