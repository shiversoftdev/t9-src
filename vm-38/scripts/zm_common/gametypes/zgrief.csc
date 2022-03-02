#using scripts\core_common\struct.csc;

#namespace zgrief;

/*
	Name: function_32d34433
	Namespace: zgrief
	Checksum: 0x3D562E36
	Offset: 0x68
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_32d34433()
{
	level notify(1151304072);
}

/*
	Name: main
	Namespace: zgrief
	Checksum: 0xFBDCB9BA
	Offset: 0x88
	Size: 0x5C
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	level._zombie_gamemodeprecache = &onprecachegametype;
	level._zombie_gamemodemain = &onstartgametype;
	/#
		println("");
	#/
}

/*
	Name: onprecachegametype
	Namespace: zgrief
	Checksum: 0x872046BB
	Offset: 0xF0
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function onprecachegametype()
{
	/#
		println("");
	#/
}

/*
	Name: onstartgametype
	Namespace: zgrief
	Checksum: 0xE8E0E49D
	Offset: 0x120
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function onstartgametype()
{
	/#
		println("");
	#/
}

