#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace scythe;

/*
	Name: function_cb64c69b
	Namespace: scythe
	Checksum: 0xB8AA0E10
	Offset: 0x88
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_cb64c69b()
{
	level notify(-1043114065);
}

/*
	Name: __init__system__
	Namespace: scythe
	Checksum: 0x90B4DCA0
	Offset: 0xA8
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"scythe", &__init__, undefined, undefined, #"killstreaks");
}

/*
	Name: __init__
	Namespace: scythe
	Checksum: 0xBEEB5CE4
	Offset: 0xF8
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function __init__()
{
	if(!sessionmodeiscampaigngame())
	{
		killstreaks::register_killstreak("killstreak_scythe", &killstreaks::function_fc82c544);
	}
}

