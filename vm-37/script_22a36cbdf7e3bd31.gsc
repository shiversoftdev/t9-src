#using scripts\core_common\util_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace namespace_45690bb8;

/*
	Name: init
	Namespace: namespace_45690bb8
	Checksum: 0x3920BF29
	Offset: 0xE0
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
	Namespace: namespace_45690bb8
	Checksum: 0xCA6A7AD
	Offset: 0x100
	Size: 0x374
	Parameters: 0
	Flags: Linked
*/
function init_clientfields()
{
	clientfield::register("scriptmover", "" + #"hash_18735ccb22cdefb5", 1, 1, "int", &function_d9576449, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_1df73c94e87e145c", 1, 1, "int", &function_7d5ce4d9, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_615d25f799b80ed7", 1, 1, "int", &function_672b008a, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_7e481cd16f021d79", 1, 1, "int", &function_5402e221, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_acf98ff6d976e10", 1, 1, "int", &function_1a90da2b, 0, 0);
	clientfield::register("world", "" + #"hash_58dd30074d399de5", 1, 1, "int", &function_8772dde6, 0, 0);
	clientfield::register("world", "" + #"hash_195f6fa038980aca", 1, 1, "int", &function_38a832d2, 0, 0);
	clientfield::register("actor", "" + #"hash_3d14472eb7838c71", 1, 1, "int", &function_33d52b21, 0, 0);
	clientfield::register("toplayer", "" + #"hash_734d80bbfc2cb595", 1, 2, "counter", &function_ccd8d6e0, 0, 0);
	clientfield::register("toplayer", "" + #"hash_802934d416ac981", 1, 1, "int", &function_6b8c4c36, 0, 0);
}

/*
	Name: function_d9576449
	Namespace: namespace_45690bb8
	Checksum: 0xBB891737
	Offset: 0x480
	Size: 0x156
	Parameters: 7
	Flags: Linked
*/
function function_d9576449(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self.var_c0049122 = util::playfxontag(fieldname, #"hash_50611dced846f036", self, "tag_origin");
		if(!isdefined(self.var_8aee9835))
		{
			self playsound(fieldname, #"hash_6d99a1e0c2b22c3d");
			self.var_8aee9835 = self playloopsound(#"hash_7f631a3f8ad73dc0");
		}
	}
	else if(isdefined(self.var_8aee9835))
	{
		stopfx(fieldname, self.var_c0049122);
		self playsound(fieldname, #"hash_554b4bdae5c4f739");
		self stoploopsound(self.var_8aee9835);
		self.var_8aee9835 = undefined;
	}
}

/*
	Name: function_7d5ce4d9
	Namespace: namespace_45690bb8
	Checksum: 0x8E8ABA79
	Offset: 0x5E0
	Size: 0xAE
	Parameters: 7
	Flags: Linked
*/
function function_7d5ce4d9(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self.lightning_fx = util::playfxontag(fieldname, #"hash_58d5e856ce222a5d", self, "tag_origin");
	}
	else if(isdefined(self.lightning_fx))
	{
		stopfx(fieldname, self.lightning_fx);
		self.lightning_fx = undefined;
	}
}

/*
	Name: function_8772dde6
	Namespace: namespace_45690bb8
	Checksum: 0xEB6BE82D
	Offset: 0x698
	Size: 0x1F4
	Parameters: 7
	Flags: Linked
*/
function function_8772dde6(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		playsound(fieldname, #"hash_2a8b12ffa840219e", (-245, 1121, 588));
		soundlineemitter(#"hash_141c67065ba502c5", (2009, 553, 659), (-245, 1121, 588));
		soundlineemitter(#"hash_141c67065ba502c5", (-2115, 5914, 1682), (-245, 1121, 588));
		soundlineemitter(#"hash_141c67065ba502c5", (-4142, -1021, 1064), (-245, 1121, 588));
	}
	else
	{
		soundstoplineemitter(#"hash_141c67065ba502c5", (2009, 553, 659), (-245, 1121, 588));
		soundstoplineemitter(#"hash_141c67065ba502c5", (-2115, 5914, 1682), (-245, 1121, 588));
		soundstoplineemitter(#"hash_141c67065ba502c5", (-4142, -1021, 1064), (-245, 1121, 588));
	}
}

/*
	Name: function_38a832d2
	Namespace: namespace_45690bb8
	Checksum: 0x28636424
	Offset: 0x898
	Size: 0xA4
	Parameters: 7
	Flags: Linked
*/
function function_38a832d2(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		soundloopemitter(#"hash_65f5a97a9265ad32", (562, -98, -315));
	}
	else
	{
		soundstoploopemitter(#"hash_65f5a97a9265ad32", (562, -98, -315));
	}
}

/*
	Name: function_672b008a
	Namespace: namespace_45690bb8
	Checksum: 0xF565ECE0
	Offset: 0x948
	Size: 0xAE
	Parameters: 7
	Flags: Linked
*/
function function_672b008a(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self.var_551198af = playfx(fieldname, #"hash_6836aff4dcf79417", self.origin);
	}
	else if(isdefined(self.var_551198af))
	{
		stopfx(fieldname, self.var_551198af);
		self.var_551198af = undefined;
	}
}

/*
	Name: function_5402e221
	Namespace: namespace_45690bb8
	Checksum: 0x6BF03EA9
	Offset: 0xA00
	Size: 0x48
	Parameters: 7
	Flags: Linked
*/
function function_5402e221(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
	}
}

/*
	Name: function_1a90da2b
	Namespace: namespace_45690bb8
	Checksum: 0x78EED81E
	Offset: 0xA50
	Size: 0xA4
	Parameters: 7
	Flags: Linked
*/
function function_1a90da2b(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self.var_5d366358 = util::playfxontag(fieldname, #"hash_23a6fc6ed48651f9", self, "j_eyeball_le");
	}
	else if(isdefined(self.var_5d366358))
	{
		stopfx(fieldname, self.var_5d366358);
	}
}

/*
	Name: function_6b8c4c36
	Namespace: namespace_45690bb8
	Checksum: 0x65CC02C5
	Offset: 0xB00
	Size: 0xB4
	Parameters: 7
	Flags: Linked
*/
function function_6b8c4c36(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self playrumbleonentity(fieldname, #"hash_431e56f34a345079");
		self postfx::playpostfxbundle(#"hash_1c01122f6d0510cf");
	}
	else
	{
		self postfx::stoppostfxbundle(#"hash_1c01122f6d0510cf");
	}
}

/*
	Name: function_ccd8d6e0
	Namespace: namespace_45690bb8
	Checksum: 0x328234EC
	Offset: 0xBC0
	Size: 0xAC
	Parameters: 7
	Flags: Linked
*/
function function_ccd8d6e0(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		self playrumbleonentity(fieldname, #"hash_575c14596fbb0902");
	}
	else if(bwastimejump == 2)
	{
		self playrumbleonentity(fieldname, #"hash_701661f6699fd075");
	}
}

/*
	Name: function_33d52b21
	Namespace: namespace_45690bb8
	Checksum: 0xF2FAD7C4
	Offset: 0xC78
	Size: 0x74
	Parameters: 7
	Flags: Linked
*/
function function_33d52b21(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self function_c2e69953(1);
	}
	else
	{
		self function_c2e69953(0);
	}
}

