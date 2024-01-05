#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace warmachine;

/*
	Name: __init__system__
	Namespace: warmachine
	Checksum: 0x9F8C2F3
	Offset: 0x90
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
	Checksum: 0x204FE708
	Offset: 0xE0
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

