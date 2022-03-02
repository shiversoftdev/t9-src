#using script_1a76d38155e9ab3c;
#using scripts\core_common\system_shared.csc;

#namespace satchel_charge;

/*
	Name: function_b32b4a1d
	Namespace: satchel_charge
	Checksum: 0xB1FFFD9C
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b32b4a1d()
{
	level notify(1478126306);
}

/*
	Name: function_89f2df9
	Namespace: satchel_charge
	Checksum: 0x6D960A9D
	Offset: 0x90
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"satchel_charge", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: satchel_charge
	Checksum: 0x98B8C2B9
	Offset: 0xD8
	Size: 0x14
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	init_shared();
}

