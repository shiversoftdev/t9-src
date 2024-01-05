#using scripts\core_common\system_shared.csc;
#using scripts\killstreaks\supplydrop_shared.csc;

#namespace supplydrop;

/*
	Name: function_233b7e75
	Namespace: supplydrop
	Checksum: 0x398AA4DA
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_233b7e75()
{
	level notify(-281729783);
}

/*
	Name: __init__system__
	Namespace: supplydrop
	Checksum: 0xAF47A2E4
	Offset: 0x90
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"supplydrop", &function_70a657d8, undefined, undefined, #"killstreaks");
}

/*
	Name: function_70a657d8
	Namespace: supplydrop
	Checksum: 0x98B8C2B9
	Offset: 0xE0
	Size: 0x14
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	init_shared();
}

