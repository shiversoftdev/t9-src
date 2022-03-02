#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace mission_utils;

/*
	Name: function_89f2df9
	Namespace: mission_utils
	Checksum: 0xBC95C06B
	Offset: 0x98
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"mission", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: mission_utils
	Checksum: 0x94DC0EB9
	Offset: 0xE0
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
	Checksum: 0x359F1F4
	Offset: 0x120
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
	Checksum: 0x9486E7E6
	Offset: 0x1B0
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

