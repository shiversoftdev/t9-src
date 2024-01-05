#using scripts\core_common\system_shared.gsc;
#using script_7475f917e6d3bed9;
#using scripts\killstreaks\killstreaks_shared.gsc;

#namespace napalm_strike;

/*
	Name: function_21b727e2
	Namespace: napalm_strike
	Checksum: 0x1A43C0C5
	Offset: 0x98
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_21b727e2()
{
	level notify(-703426788);
}

/*
	Name: __init__system__
	Namespace: napalm_strike
	Checksum: 0x567E5DFE
	Offset: 0xB8
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"napalm_strike", &function_70a657d8, undefined, undefined, #"killstreaks");
}

/*
	Name: function_70a657d8
	Namespace: napalm_strike
	Checksum: 0x34CEA211
	Offset: 0x108
	Size: 0x1C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	init_shared("killstreak_napalm_strike");
}

