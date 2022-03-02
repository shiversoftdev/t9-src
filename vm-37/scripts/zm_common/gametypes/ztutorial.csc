#namespace ztutorial;

/*
	Name: main
	Namespace: ztutorial
	Checksum: 0xF1579269
	Offset: 0x60
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
	Checksum: 0x5A2CAB0E
	Offset: 0xA8
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
	Checksum: 0xF8318A7F
	Offset: 0xD8
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

