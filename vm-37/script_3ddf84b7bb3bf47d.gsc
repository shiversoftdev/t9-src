#using scripts\core_common\clientfield_shared.gsc;

#namespace namespace_52c8f34d;

/*
	Name: function_70a657d8
	Namespace: namespace_52c8f34d
	Checksum: 0x6F92C618
	Offset: 0x98
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	if(isdefined(level.var_6b33db60))
	{
		return;
	}
	level.var_6b33db60 = 1;
	level clientfield::register("scriptmover", "item_machine_spawn_rob", 1, 1, "int");
}

