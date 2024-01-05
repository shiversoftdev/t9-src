#using scripts\core_common\system_shared.csc;

#namespace teamset;

/*
	Name: __init__system__
	Namespace: teamset
	Checksum: 0x2D9D3057
	Offset: 0x68
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"teamset_seals", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: teamset
	Checksum: 0xEC8A8620
	Offset: 0xB0
	Size: 0x34
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.allies_team = #"allies";
	level.axis_team = #"axis";
}

