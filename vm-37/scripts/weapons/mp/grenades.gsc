#using scripts\weapons\grenades.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace grenades;

/*
	Name: __init__system__
	Namespace: grenades
	Checksum: 0x7D2A9E32
	Offset: 0x70
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"grenades", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: grenades
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

