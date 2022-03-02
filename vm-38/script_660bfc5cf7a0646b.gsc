#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\struct.csc;

#namespace namespace_f838b0ea;

/*
	Name: function_90690ec
	Namespace: namespace_f838b0ea
	Checksum: 0x53AEE5D4
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_90690ec()
{
	level notify(527366948);
}

/*
	Name: main
	Namespace: namespace_f838b0ea
	Checksum: 0xD6FBC781
	Offset: 0x90
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
	Checksum: 0x529DEF6E
	Offset: 0x140
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
	Checksum: 0x469421EE
	Offset: 0x170
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

