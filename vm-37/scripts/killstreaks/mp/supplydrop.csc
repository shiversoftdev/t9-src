#using scripts\core_common\system_shared.csc;
#using scripts\killstreaks\supplydrop_shared.csc;

#namespace supplydrop;

/*
	Name: __init__system__
	Namespace: supplydrop
	Checksum: 0x171A8493
	Offset: 0x70
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
	Checksum: 0x9DAAD88B
	Offset: 0xC0
	Size: 0x14
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	init_shared();
}

