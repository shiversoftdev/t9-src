#using scripts\core_common\spawnbeacon_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace spawn_beacon;

/*
	Name: __init__system__
	Namespace: spawn_beacon
	Checksum: 0x457B658F
	Offset: 0x70
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"spawnbeacon", &function_70a657d8, undefined, undefined, #"killstreaks");
}

/*
	Name: function_70a657d8
	Namespace: spawn_beacon
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

