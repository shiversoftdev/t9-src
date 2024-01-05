#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace annihilator;

/*
	Name: function_4cf026a3
	Namespace: annihilator
	Checksum: 0xD7F6B6A1
	Offset: 0xA0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_4cf026a3()
{
	level notify(1827750095);
}

/*
	Name: __init__system__
	Namespace: annihilator
	Checksum: 0xBE346E4E
	Offset: 0xC0
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"annihilator", &__init__, undefined, undefined, #"killstreaks");
}

/*
	Name: __init__
	Namespace: annihilator
	Checksum: 0x39525436
	Offset: 0x110
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function __init__()
{
	if(!sessionmodeiscampaigngame())
	{
		killstreaks::register_killstreak("killstreak_annihilator", &killstreaks::function_fc82c544);
	}
}

