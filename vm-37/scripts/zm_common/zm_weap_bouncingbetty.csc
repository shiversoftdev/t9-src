#using scripts\weapons\bouncingbetty.csc;
#using scripts\core_common\system_shared.csc;

#namespace bouncingbetty;

/*
	Name: __init__system__
	Namespace: bouncingbetty
	Checksum: 0x592450F5
	Offset: 0x70
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"bouncingbetty", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: bouncingbetty
	Checksum: 0x9DAAD88B
	Offset: 0xB8
	Size: 0x14
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	init_shared();
}

