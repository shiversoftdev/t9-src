#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\struct.csc;

#namespace namespace_f838b0ea;

/*
	Name: main
	Namespace: namespace_f838b0ea
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
	if(!level flag::exists(#"hash_33037f6188bd285f"))
	{
		level flag::init(#"hash_33037f6188bd285f", 1);
	}
	/#
		println("");
	#/
}

/*
	Name: onprecachegametype
	Namespace: namespace_f838b0ea
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
	Namespace: namespace_f838b0ea
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

