#using script_1568a517f901b845;
#using scripts\core_common\system_shared.csc;

#namespace napalm_strike;

/*
	Name: function_1c3d7fe1
	Namespace: napalm_strike
	Checksum: 0xBC30D01
	Offset: 0x90
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_1c3d7fe1()
{
	level notify(824348058);
}

/*
	Name: function_89f2df9
	Namespace: napalm_strike
	Checksum: 0x567E5DFE
	Offset: 0xB0
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"napalm_strike", &function_70a657d8, undefined, undefined, #"killstreaks");
}

/*
	Name: function_70a657d8
	Namespace: napalm_strike
	Checksum: 0x34CEA211
	Offset: 0x100
	Size: 0x1C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	init_shared("killstreak_napalm_strike");
}

