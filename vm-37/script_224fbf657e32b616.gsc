#using script_6c8abe14025b47c4;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_7be16dd9;

/*
	Name: function_89f2df9
	Namespace: namespace_7be16dd9
	Checksum: 0x9F8C2F3
	Offset: 0x90
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
		killstreaks::function_e4ef8390("killstreak_warmachine", &killstreaks::function_fc82c544);
	}
}

