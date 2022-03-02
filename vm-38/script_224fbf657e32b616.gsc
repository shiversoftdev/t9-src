#using script_6c8abe14025b47c4;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_7be16dd9;

/*
	Name: function_2b01956a
	Namespace: namespace_7be16dd9
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
	Name: function_89f2df9
	Namespace: namespace_7be16dd9
	Checksum: 0x2269E50F
	Offset: 0xB0
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_25181c4d7525232e", &__init__, undefined, undefined, #"killstreaks");
}

/*
	Name: __init__
	Namespace: namespace_7be16dd9
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
		killstreaks::function_e4ef8390("killstreak_warmachine", &killstreaks::function_fc82c544);
	}
}

