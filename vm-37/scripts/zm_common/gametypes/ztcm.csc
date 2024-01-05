#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\struct.csc;

#namespace ztcm;

/*
	Name: main
	Namespace: ztcm
	Checksum: 0x84FCFF77
	Offset: 0x70
	Size: 0xA4
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	level._zombie_gamemodeprecache = &onprecachegametype;
	level._zombie_gamemodemain = &onstartgametype;
	if(!level flag::exists(#"ztcm"))
	{
		level flag::init(#"ztcm", 1);
	}
	/#
		println("");
	#/
}

/*
	Name: onprecachegametype
	Namespace: ztcm
	Checksum: 0x560A6773
	Offset: 0x120
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
	Namespace: ztcm
	Checksum: 0x934A153F
	Offset: 0x150
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

