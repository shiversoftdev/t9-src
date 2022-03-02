#using scripts\core_common\struct.csc;

#namespace zgrief;

/*
	Name: main
	Namespace: zgrief
	Checksum: 0x7FFD0ED7
	Offset: 0x68
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
	Checksum: 0x9065D12
	Offset: 0xD0
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
	Checksum: 0x6A3B183F
	Offset: 0x100
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

