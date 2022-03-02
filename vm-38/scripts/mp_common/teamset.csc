#using scripts\core_common\system_shared.csc;

#namespace teamset;

/*
	Name: function_10370c53
	Namespace: teamset
	Checksum: 0xB69F8BB1
	Offset: 0x68
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_10370c53()
{
	level notify(634534827);
}

/*
	Name: function_89f2df9
	Namespace: teamset
	Checksum: 0x82B29723
	Offset: 0x88
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"teamset_seals", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: teamset
	Checksum: 0x9027952
	Offset: 0xD0
	Size: 0x34
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.allies_team = #"allies";
	level.axis_team = #"axis";
}

