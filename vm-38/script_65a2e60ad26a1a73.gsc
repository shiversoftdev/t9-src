#using script_57f7003580bb15e0;
#using script_6c8abe14025b47c4;
#using scripts\core_common\system_shared.gsc;

#namespace flamethrower;

/*
	Name: function_785ed14d
	Namespace: flamethrower
	Checksum: 0x2DEE2D01
	Offset: 0xD8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_785ed14d()
{
	level notify(175992166);
}

/*
	Name: function_89f2df9
	Namespace: flamethrower
	Checksum: 0xD07F3019
	Offset: 0xF8
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"flamethrower", &__init__, undefined, undefined, #"killstreaks");
}

/*
	Name: __init__
	Namespace: flamethrower
	Checksum: 0x86FE5802
	Offset: 0x148
	Size: 0x9C
	Parameters: 0
	Flags: Linked
*/
function __init__()
{
	if(!sessionmodeiscampaigngame())
	{
		killstreaks::function_e4ef8390("killstreak_flamethrower", &killstreaks::function_fc82c544);
	}
	status_effect::function_30e7d622(getweapon("hero_flamethrower"), "flakjacket");
	status_effect::function_30e7d622(getweapon("inventory_hero_flamethrower"), "flakjacket");
}

