#using scripts\core_common\spawnbeacon_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace spawnbeacon;

/*
	Name: function_73875fde
	Namespace: spawnbeacon
	Checksum: 0x82C1DD34
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_73875fde()
{
	level notify(866627654);
}

#namespace spawn_beacon;

/*
	Name: __init__system__
	Namespace: spawn_beacon
	Checksum: 0xFD2643F8
	Offset: 0x90
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

