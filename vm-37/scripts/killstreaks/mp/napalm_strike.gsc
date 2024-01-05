#using scripts\core_common\system_shared.gsc;
#using script_7475f917e6d3bed9;
#using scripts\killstreaks\killstreaks_shared.gsc;

#namespace napalm_strike;

/*
	Name: __init__system__
	Namespace: napalm_strike
	Checksum: 0x923C8611
	Offset: 0x98
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
	Checksum: 0x70BE2B73
	Offset: 0xE8
	Size: 0x1C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	init_shared("killstreak_napalm_strike");
}

