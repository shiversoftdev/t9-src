#using scripts\core_common\util_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace namespace_4914de7c;

/*
	Name: function_83eaf112
	Namespace: namespace_4914de7c
	Checksum: 0x96F86096
	Offset: 0x80
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_83eaf112()
{
	level notify(-1715586623);
}

/*
	Name: main
	Namespace: namespace_4914de7c
	Checksum: 0xD934819E
	Offset: 0xA0
	Size: 0x2A
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	if(util::get_map_name() !== "wz_russia")
	{
		return;
	}
}

