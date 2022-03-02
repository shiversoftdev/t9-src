#using scripts\core_common\clientfield_shared.csc;

#namespace namespace_52c8f34d;

/*
	Name: function_70a657d8
	Namespace: namespace_52c8f34d
	Checksum: 0xE14C639
	Offset: 0x98
	Size: 0x6C
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
	level clientfield::register("scriptmover", "item_machine_spawn_rob", 1, 1, "int", &function_c30c297c, 0, 0);
}

/*
	Name: function_c30c297c
	Namespace: namespace_52c8f34d
	Checksum: 0xF059BA64
	Offset: 0x110
	Size: 0x64
	Parameters: 7
	Flags: Linked
*/
function function_c30c297c(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(isdefined(self))
	{
		self function_bf9d3071(#"hash_1528dae63f55fcde");
	}
}

