#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace namespace_5d18774f;

/*
	Name: function_45ab5811
	Namespace: namespace_5d18774f
	Checksum: 0x6CE5A8BB
	Offset: 0x88
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_45ab5811()
{
	level notify(574026545);
}

/*
	Name: __init__system__
	Namespace: namespace_5d18774f
	Checksum: 0xD9B0A878
	Offset: 0xA8
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
	Checksum: 0x24631E7E
	Offset: 0xF0
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function preload()
{
	if(sessionmodeiscampaigngame())
	{
		clientfield::register("world", "" + #"hash_7dc38a630ed68eb3", 1, 1, "int");
	}
}

