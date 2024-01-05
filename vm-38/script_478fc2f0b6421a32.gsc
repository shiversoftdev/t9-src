#using scripts\core_common\util_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace namespace_60bf0cf2;

/*
	Name: function_e393f1c8
	Namespace: namespace_60bf0cf2
	Checksum: 0xF4D20F4E
	Offset: 0xB8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_e393f1c8()
{
	level notify(-1677213572);
}

/*
	Name: init
	Namespace: namespace_60bf0cf2
	Checksum: 0x3FA880B9
	Offset: 0xD8
	Size: 0x14
	Parameters: 0
	Flags: Linked
*/
function init()
{
	init_clientfields();
}

/*
	Name: init_clientfields
	Namespace: namespace_60bf0cf2
	Checksum: 0xDD1D54A9
	Offset: 0xF8
	Size: 0x10C
	Parameters: 0
	Flags: Linked
*/
function init_clientfields()
{
	clientfield::register("scriptmover", "" + #"hash_5808d23568bc787", 1, 1, "int", &function_f1c7d9e3, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_50dd9d9bf6b71a00", 1, 1, "counter", &function_2518f379, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_464c0289eeaff2a8", 1, 1, "int", &function_35a58b7, 0, 0);
}

/*
	Name: function_f1c7d9e3
	Namespace: namespace_60bf0cf2
	Checksum: 0x2CF4710B
	Offset: 0x210
	Size: 0xAE
	Parameters: 7
	Flags: Linked
*/
function function_f1c7d9e3(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self.var_ddd3b139 = util::playfxontag(fieldname, #"hash_67ab48748fb2d398", self, "j_eyeball_le");
	}
	else if(isdefined(self.var_ddd3b139))
	{
		stopfx(fieldname, self.var_ddd3b139);
		self.var_ddd3b139 = undefined;
	}
}

/*
	Name: function_2518f379
	Namespace: namespace_60bf0cf2
	Checksum: 0x9EFB4461
	Offset: 0x2C8
	Size: 0x6C
	Parameters: 7
	Flags: Linked
*/
function function_2518f379(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		util::playfxontag(fieldname, #"hash_1a0fe6e34e30e968", self, "j_mainroot");
	}
}

/*
	Name: function_35a58b7
	Namespace: namespace_60bf0cf2
	Checksum: 0x2EF1076F
	Offset: 0x340
	Size: 0x6C
	Parameters: 7
	Flags: Linked
*/
function function_35a58b7(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		util::playfxontag(fieldname, #"hash_1eade7553747299a", self, "j_mainroot");
	}
}

