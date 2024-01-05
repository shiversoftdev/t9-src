#using scripts\core_common\system_shared.csc;

#namespace namespace_ce472ff1;

/*
	Name: function_ff552685
	Namespace: namespace_ce472ff1
	Checksum: 0x84BBE83
	Offset: 0x68
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ff552685()
{
	level notify(1442236289);
}

/*
	Name: __init__system__
	Namespace: namespace_ce472ff1
	Checksum: 0x25415E24
	Offset: 0x88
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_788b2cd49344cd51", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_ce472ff1
	Checksum: 0xD779E2A8
	Offset: 0xD0
	Size: 0x30
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(level.var_f2814a96 !== 1 && level.var_f2814a96 !== 2)
	{
		return;
	}
}

