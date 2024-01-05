#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace warmachine;

/*
	Name: function_2b01956a
	Namespace: warmachine
	Checksum: 0xCD83CCA3
	Offset: 0x90
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_2b01956a()
{
	level notify(1633874678);
}

/*
	Name: __init__system__
	Namespace: warmachine
	Checksum: 0x2269E50F
	Offset: 0xB0
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"warmachine", &__init__, undefined, undefined, #"killstreaks");
}

/*
	Name: __init__
	Namespace: warmachine
	Checksum: 0x1EC06ADB
	Offset: 0x100
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function __init__()
{
	if(!sessionmodeiscampaigngame())
	{
		killstreaks::register_killstreak("killstreak_warmachine", &killstreaks::function_fc82c544);
	}
}

