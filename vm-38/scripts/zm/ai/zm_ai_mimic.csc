#using scripts\core_common\ai\archetype_mimic.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace namespace_14c07d4f;

/*
	Name: function_566d9208
	Namespace: namespace_14c07d4f
	Checksum: 0x5F0800FB
	Offset: 0x118
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_566d9208()
{
	level notify(-1169433534);
}

/*
	Name: __init__system__
	Namespace: namespace_14c07d4f
	Checksum: 0xE43C62C0
	Offset: 0x138
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_7442f9a5295824fd", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_14c07d4f
	Checksum: 0x977CA8F1
	Offset: 0x180
	Size: 0xDC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("actor", "mimic_show_on_minimap", 16000, 1, "int", &function_78505cdf, 0, 0);
	clientfield::register("actor", "mimic_cleanup_teleport", 16000, 1, "counter", &function_dca29f5c, 0, 0);
	clientfield::register("toplayer", "mimic_range_hit", 16000, 1, "counter", &function_4bc65819, 0, 0);
}

/*
	Name: function_78505cdf
	Namespace: namespace_14c07d4f
	Checksum: 0x1D6D6284
	Offset: 0x268
	Size: 0x74
	Parameters: 7
	Flags: Linked
*/
function function_78505cdf(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump)
	{
		self function_811196d1(1);
	}
	else
	{
		self function_811196d1(0);
	}
}

/*
	Name: function_dca29f5c
	Namespace: namespace_14c07d4f
	Checksum: 0xE1AF24B5
	Offset: 0x2E8
	Size: 0x6C
	Parameters: 7
	Flags: Linked
*/
function function_dca29f5c(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(isdefined(self))
	{
		util::playfxontag(bwasdemojump, #"hash_784a8bc7b9b17876", self, "tag_origin");
	}
}

/*
	Name: function_4bc65819
	Namespace: namespace_14c07d4f
	Checksum: 0x91BCCC7
	Offset: 0x360
	Size: 0xC4
	Parameters: 7
	Flags: Linked
*/
function function_4bc65819(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	util::waittill_dobj(bwasdemojump);
	self endon(#"death");
	if(!self function_d2cb869e(#"hash_58e9d4772527f71a"))
	{
		self codeplaypostfxbundle(#"hash_58e9d4772527f71a");
	}
	self thread function_119c2eb0();
}

/*
	Name: function_119c2eb0
	Namespace: namespace_14c07d4f
	Checksum: 0xB5488DFA
	Offset: 0x430
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function function_119c2eb0()
{
	self notify("5fbe1a9a16e8ed88");
	self endon("5fbe1a9a16e8ed88");
	self waittilltimeout(1, #"death");
	self codestoppostfxbundle(#"hash_58e9d4772527f71a");
}

