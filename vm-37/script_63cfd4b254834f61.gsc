#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace namespace_5d18774f;

/*
	Name: __init__system__
	Namespace: namespace_5d18774f
	Checksum: 0x71DE7503
	Offset: 0x88
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"blood", &preload, undefined, undefined, undefined);
}

/*
	Name: preload
	Namespace: namespace_5d18774f
	Checksum: 0x2EC6F5AA
	Offset: 0xD0
	Size: 0x54
	Parameters: 0
	Flags: None
*/
function preload()
{
	if(sessionmodeiscampaigngame())
	{
		clientfield::register("world", "" + #"hash_7dc38a630ed68eb3", 1, 1, "int");
	}
}

