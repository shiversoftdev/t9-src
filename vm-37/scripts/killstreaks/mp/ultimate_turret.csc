#using scripts\core_common\system_shared.csc;
#using scripts\killstreaks\ultimate_turret_shared.csc;
#using scripts\killstreaks\killstreak_vehicle.csc;
#using scripts\core_common\struct.csc;

#namespace ultimate_turret;

/*
	Name: __init__system__
	Namespace: ultimate_turret
	Checksum: 0x5B6FA14E
	Offset: 0xA0
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"ultimate_turret", &function_70a657d8, undefined, undefined, #"killstreaks");
}

/*
	Name: function_70a657d8
	Namespace: ultimate_turret
	Checksum: 0x8501EC8B
	Offset: 0xF0
	Size: 0x4C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	init_shared();
	bundle = getscriptbundle("killstreak_ultimate_turret");
	killstreak_vehicle::init_killstreak(bundle);
}

