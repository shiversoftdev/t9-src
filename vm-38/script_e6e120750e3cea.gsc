#using script_71b355b2496e3c6d;
#using script_1a76d38155e9ab3c;
#using scripts\core_common\system_shared.csc;

#namespace satchel_charge;

/*
	Name: function_8fe0b84c
	Namespace: satchel_charge
	Checksum: 0x3BA5030D
	Offset: 0x78
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_8fe0b84c()
{
	level notify(747636320);
}

/*
	Name: __init__system__
	Namespace: satchel_charge
	Checksum: 0x6D960A9D
	Offset: 0x98
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"satchel_charge", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: satchel_charge
	Checksum: 0x214908DE
	Offset: 0xE0
	Size: 0x24
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	init_shared();
	namespace_cc411409::function_70a657d8();
}

