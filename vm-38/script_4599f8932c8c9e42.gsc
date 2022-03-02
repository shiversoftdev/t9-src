#using script_6c8abe14025b47c4;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_b7964db5;

/*
	Name: function_da8fed71
	Namespace: namespace_b7964db5
	Checksum: 0x9B340920
	Offset: 0x88
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_da8fed71()
{
	level notify(427888523);
}

#namespace ray_gun;

/*
	Name: function_89f2df9
	Namespace: ray_gun
	Checksum: 0xC845CB81
	Offset: 0xA8
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"ray_gun", &__init__, undefined, undefined, #"killstreaks");
}

/*
	Name: __init__
	Namespace: ray_gun
	Checksum: 0x46018879
	Offset: 0xF8
	Size: 0x5C
	Parameters: 0
	Flags: None
*/
function __init__()
{
	if(!sessionmodeiscampaigngame() && !sessionmodeiszombiesgame())
	{
		killstreaks::function_e4ef8390("killstreak_ray_gun", &killstreaks::function_fc82c544);
	}
}

