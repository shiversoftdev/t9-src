#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace namespace_2a13cc4e;

/*
	Name: function_310407da
	Namespace: namespace_2a13cc4e
	Checksum: 0xE8B2A1F8
	Offset: 0x98
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_310407da()
{
	level notify(1882098520);
}

#namespace mission_utils;

/*
	Name: function_89f2df9
	Namespace: mission_utils
	Checksum: 0x13BA671F
	Offset: 0xB8
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
	Checksum: 0xD5C72BB7
	Offset: 0x100
	Size: 0x4C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	clientfield::register("world", "mission_active_flags", 1, 8, "int", &mission_active_changed, 0, 0);
}

/*
	Name: mission_active_changed
	Namespace: mission_utils
	Checksum: 0x532BFB09
	Offset: 0x158
	Size: 0x164
	Parameters: 7
	Flags: None
*/
function mission_active_changed(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!isdefined(level.mission_active_flags))
	{
		level.mission_active_flags = 0;
	}
	for(i = 0; i < 8; i++)
	{
		changedflags = level.mission_active_flags ^ bwastimejump;
		if((changedflags & (1 << i)) != 0)
		{
			if((level.mission_active_flags & (1 << i)) != 0)
			{
				stopmission(i);
			}
		}
	}
	for(i = 0; i < 8; i++)
	{
		changedflags = level.mission_active_flags ^ bwastimejump;
		if((changedflags & (1 << i)) != 0)
		{
			if((level.mission_active_flags & (1 << i)) == 0)
			{
				startmission(i);
			}
		}
	}
	level.mission_active_flags = bwastimejump;
}

