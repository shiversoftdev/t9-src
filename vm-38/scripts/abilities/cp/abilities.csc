#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace abilities;

/*
	Name: function_c19a3383
	Namespace: abilities
	Checksum: 0x7831F0E0
	Offset: 0x98
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_c19a3383()
{
	level notify(791447520);
}

/*
	Name: __init__system__
	Namespace: abilities
	Checksum: 0xB2BFE38B
	Offset: 0xB8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_4652e389efb9751f", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: abilities
	Checksum: 0xD4F87FEB
	Offset: 0x100
	Size: 0x54
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register_clientuimodel("playerAbilities.inRange", #"hash_3107ca3e77102da5", #"inrange", 1, 1, "int", undefined, 0, 0);
}

