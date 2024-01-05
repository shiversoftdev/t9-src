#using scripts\core_common\clientfield_shared.csc;

#namespace namespace_52c8f34d;

/*
	Name: function_31a349f4
	Namespace: namespace_52c8f34d
	Checksum: 0xCE33C44F
	Offset: 0x98
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_31a349f4()
{
	level notify(-1798110841);
}

/*
	Name: function_70a657d8
	Namespace: namespace_52c8f34d
	Checksum: 0x907FC036
	Offset: 0xB8
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
	Checksum: 0x444723F0
	Offset: 0x130
	Size: 0x9C
	Parameters: 7
	Flags: Linked
*/
function function_c30c297c(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(isdefined(self))
	{
		self playrenderoverridebundle(#"hash_1528dae63f55fcde");
		playsound(bwastimejump, #"hash_20c4f0485930af2a", self.origin + vectorscale((0, 0, 1), 35));
	}
}

