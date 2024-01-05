#using script_1a76d38155e9ab3c;
#using scripts\core_common\system_shared.csc;

#namespace satchel_charge;

/*
	Name: __init__system__
	Namespace: satchel_charge
	Checksum: 0xC2B9ADE9
	Offset: 0x70
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
	Checksum: 0x9DAAD88B
	Offset: 0xB8
	Size: 0x14
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	init_shared();
}

