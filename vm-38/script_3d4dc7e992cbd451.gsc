#using script_6c8abe14025b47c4;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_ac1193d0;

/*
	Name: function_cb64c69b
	Namespace: namespace_ac1193d0
	Checksum: 0xB8AA0E10
	Offset: 0x88
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_cb64c69b()
{
	level notify(1043114065);
}

/*
	Name: function_89f2df9
	Namespace: namespace_ac1193d0
	Checksum: 0x90B4DCA0
	Offset: 0xA8
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_ddd96714b2ba3e5", &__init__, undefined, undefined, #"killstreaks");
}

/*
	Name: __init__
	Namespace: namespace_ac1193d0
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
		killstreaks::function_e4ef8390("killstreak_scythe", &killstreaks::function_fc82c544);
	}
}

