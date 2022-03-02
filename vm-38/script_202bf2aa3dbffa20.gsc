#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_dd8b9b1a;

/*
	Name: function_422b8440
	Namespace: namespace_dd8b9b1a
	Checksum: 0x3F6DC622
	Offset: 0x148
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_422b8440()
{
	level notify(128886683);
}

#namespace namespace_4faef43b;

/*
	Name: function_89f2df9
	Namespace: namespace_4faef43b
	Checksum: 0x54F10A6C
	Offset: 0x168
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_3793eb4a6c52c66f", &__init__, undefined, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_4faef43b
	Checksum: 0x469B07BC
	Offset: 0x1B0
	Size: 0x1B4
	Parameters: 0
	Flags: Linked
*/
function __init__()
{
	clientfield::register("scriptmover", "" + #"hash_322ed89801938bb9", 1, 1, "counter", &function_40fcb7b0, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_6d9aa5215e695ca2", 1, 1, "counter", &function_65502dee, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_1f232116f775fa91", 1, 1, "counter", &function_de8dd244, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_4719ef7fda616f3a", 1, 1, "counter", &function_b6000359, 0, 0);
	clientfield::function_a8bbc967("hudItems.reinforcing", #"hud_items", #"reinforcing", 1, 1, "int", undefined, 0, 0);
}

/*
	Name: function_de8dd244
	Namespace: namespace_4faef43b
	Checksum: 0xE29CBC9A
	Offset: 0x370
	Size: 0xA4
	Parameters: 7
	Flags: Linked
*/
function function_de8dd244(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		playfx(fieldname, "destruct/fx9_dmg_window_wood_wz", self.origin, anglestoforward(self.angles) + vectorscale((0, 1, 0), 90), anglestoup(self.angles));
	}
}

/*
	Name: function_b6000359
	Namespace: namespace_4faef43b
	Checksum: 0x25DECBF9
	Offset: 0x420
	Size: 0xA4
	Parameters: 7
	Flags: Linked
*/
function function_b6000359(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		playfx(fieldname, "destruct/fx9_dest_window_wood_wz", self.origin, anglestoforward(self.angles) + vectorscale((0, 1, 0), 90), anglestoup(self.angles));
	}
}

/*
	Name: function_40fcb7b0
	Namespace: namespace_4faef43b
	Checksum: 0xD7FD7E66
	Offset: 0x4D0
	Size: 0xA4
	Parameters: 7
	Flags: Linked
*/
function function_40fcb7b0(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		playfx(fieldname, "destruct/fx9_dmg_door_metal_wz", self.origin, anglestoforward(self.angles) + vectorscale((0, 1, 0), 90), anglestoup(self.angles));
	}
}

/*
	Name: function_65502dee
	Namespace: namespace_4faef43b
	Checksum: 0xF3FE25CB
	Offset: 0x580
	Size: 0xA4
	Parameters: 7
	Flags: Linked
*/
function function_65502dee(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		playfx(fieldname, "destruct/fx9_dest_door_metal_wz", self.origin, anglestoforward(self.angles) + vectorscale((0, 1, 0), 90), anglestoup(self.angles));
	}
}

