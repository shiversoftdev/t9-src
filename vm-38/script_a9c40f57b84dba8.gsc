#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\zm_common\zm_utility.csc;

#namespace namespace_1b312da5;

/*
	Name: function_18813e2
	Namespace: namespace_1b312da5
	Checksum: 0xEB3E7DC3
	Offset: 0xB0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_18813e2()
{
	level notify(225901127);
}

/*
	Name: function_89f2df9
	Namespace: namespace_1b312da5
	Checksum: 0x693DE5BD
	Offset: 0xD0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_3cd3b81be4386726", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_1b312da5
	Checksum: 0x75E1DD51
	Offset: 0x118
	Size: 0x1AC
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	if(!zm_utility::is_survival())
	{
		return;
	}
	if(!zm_utility::function_e51dc2d8())
	{
		return;
	}
	clientfield::register("world", "" + #"hash_1ff35e37755facac", 1, getminbitcountfornum(6), "int", &function_a913a80c, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_33efd42a2437edc1", 1, 1, "int", &function_4e1f138b, 0, 0);
	clientfield::register("toplayer", "" + #"hash_3fa05b65abd13e3d", 1, 1, "int", &function_ff2baa34, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_22f5493de4d47138", 1, getminbitcountfornum(2), "int", &function_3a098313, 0, 0);
}

/*
	Name: function_a913a80c
	Namespace: namespace_1b312da5
	Checksum: 0x38283ED8
	Offset: 0x2D0
	Size: 0x2DA
	Parameters: 7
	Flags: Linked
*/
function function_a913a80c(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	switch(bwastimejump)
	{
		case 1:
		{
			forcestreamxmodel(#"hash_172b09aab70a65da");
			forcestreamxmodel(#"hash_172b03aab70a5ba8");
			forcestreamxmodel(#"hash_172b05aab70a5f0e");
			forcestreamxmodel(#"hash_172b05aab70a5f0e");
			break;
		}
		case 2:
		{
			stopforcestreamingxmodel(#"hash_172b09aab70a65da");
			stopforcestreamingxmodel(#"hash_172b03aab70a5ba8");
			stopforcestreamingxmodel(#"hash_172b05aab70a5f0e");
			stopforcestreamingxmodel(#"hash_172b05aab70a5f0e");
			break;
		}
		case 3:
		{
			forcestreamxmodel(#"p9_fxanim_zm_ndu_essence_bomb_body_mod");
			break;
		}
		case 4:
		{
			stopforcestreamingxmodel(#"p9_fxanim_zm_ndu_essence_bomb_body_mod");
			break;
		}
		case 5:
		{
			forcestreamxmodel(#"hash_7848b915159e74a6");
			forcestreamxmodel(#"p8_zm_red_dks_chaos_crystal_cluster_sml_01b");
			forcestreamxmodel(#"hash_31150cf4ae726381");
			break;
		}
		case 6:
		{
			stopforcestreamingxmodel(#"hash_7848b915159e74a6");
			stopforcestreamingxmodel(#"p8_zm_red_dks_chaos_crystal_cluster_sml_01b");
			stopforcestreamingxmodel(#"hash_31150cf4ae726381");
			break;
		}
	}
}

/*
	Name: function_4e1f138b
	Namespace: namespace_1b312da5
	Checksum: 0x872792D3
	Offset: 0x5B8
	Size: 0xF6
	Parameters: 7
	Flags: Linked
*/
function function_4e1f138b(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		if(!isdefined(self.var_68d572a1))
		{
			self.var_68d572a1 = playfx(fieldname, #"hash_1b588b599d203b7e", self.origin);
			wait(2);
			if(isdefined(self.var_68d572a1))
			{
				stopfx(fieldname, self.var_68d572a1);
				self.var_68d572a1 = undefined;
			}
		}
	}
	else if(isdefined(self.var_68d572a1))
	{
		stopfx(fieldname, self.var_68d572a1);
		self.var_68d572a1 = undefined;
	}
}

/*
	Name: function_ff2baa34
	Namespace: namespace_1b312da5
	Checksum: 0x54F0188D
	Offset: 0x6B8
	Size: 0x8C
	Parameters: 7
	Flags: Linked
*/
function function_ff2baa34(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self postfx::playpostfxbundle(#"hash_4bce2bc0fe1ee966");
	}
	else
	{
		self postfx::exitpostfxbundle(#"hash_4bce2bc0fe1ee966");
	}
}

/*
	Name: function_3a098313
	Namespace: namespace_1b312da5
	Checksum: 0xC9490703
	Offset: 0x750
	Size: 0x22A
	Parameters: 7
	Flags: Linked
*/
function function_3a098313(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	switch(newval)
	{
		case 0:
		{
			if(isdefined(self.var_32bc7a97))
			{
				stopfx(localclientnum, self.var_32bc7a97);
				self.var_32bc7a97 = undefined;
			}
			if(isdefined(self.var_1c1ab285))
			{
				stopfx(localclientnum, self.var_1c1ab285);
				self.var_1c1ab285 = undefined;
			}
			break;
		}
		case 1:
		{
			function_3a098313(localclientnum, oldval, 0, bnewent, binitialsnap, fieldname, bwastimejump);
			if(!isdefined(self.var_32bc7a97))
			{
				self.var_32bc7a97 = playfx(localclientnum, #"hash_433034414b39f1ef", self.origin, (1, 0, -1), (1, 0, 1));
			}
			break;
		}
		case 2:
		{
			if(!isdefined(self.var_1c1ab285))
			{
				playfx(localclientnum, #"hash_458f9a6d2c210713", self.origin, anglestoforward(self.angles), anglestoup(self.angles));
				self.var_1c1ab285 = playfx(localclientnum, #"hash_6dc5c47b3575b7ca", self.origin, anglestoforward(self.angles), anglestoup(self.angles));
			}
			break;
		}
	}
}

