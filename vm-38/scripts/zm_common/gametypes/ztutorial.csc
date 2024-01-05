#namespace ztutorial;

/*
	Name: function_1b0de918
	Namespace: ztutorial
	Checksum: 0xE273CAE9
	Offset: 0x60
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_1b0de918()
{
	level notify(-2028010735);
}

/*
	Name: main
	Namespace: ztutorial
	Checksum: 0x20B03618
	Offset: 0x80
	Size: 0x3C
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	level._zombie_gamemodeprecache = &onprecachegametype;
	level._zombie_gamemodemain = &onstartgametype;
}

/*
	Name: onprecachegametype
	Namespace: ztutorial
	Checksum: 0x95B27CF2
	Offset: 0xC8
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
	Namespace: ztutorial
	Checksum: 0x8652413C
	Offset: 0xF8
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

