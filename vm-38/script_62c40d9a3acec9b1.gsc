#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_58949729;

/*
	Name: function_c6699733
	Namespace: namespace_58949729
	Checksum: 0xE0575D2C
	Offset: 0x110
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_c6699733()
{
	level notify(1449025224);
}

/*
	Name: function_89f2df9
	Namespace: namespace_58949729
	Checksum: 0x4F4C76DA
	Offset: 0x130
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_5f19cd68b4607f52", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_58949729
	Checksum: 0x48BCC164
	Offset: 0x178
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	clientfield::register("scriptmover", "reward_chest_fx", 1, 2, "int", &reward_chest_fx, 0, 0);
}

/*
	Name: reward_chest_fx
	Namespace: namespace_58949729
	Checksum: 0x13AD35C4
	Offset: 0x1D0
	Size: 0x222
	Parameters: 7
	Flags: Linked
*/
function reward_chest_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	switch(bwastimejump)
	{
		case 0:
		{
			if(isdefined(self.n_fx_id))
			{
				stopfx(fieldname, self.n_fx_id);
			}
			if(isdefined(self.var_b3673abf))
			{
				self stoploopsound(self.var_b3673abf);
			}
			break;
		}
		case 1:
		{
			self.n_fx_id = util::playfxontag(fieldname, "sr/fx9_chest_explore_amb_sm", self, "tag_origin");
			self.var_b3673abf = self playloopsound(#"hash_149989d596125e40", undefined, vectorscale((0, 0, 1), 40));
			break;
		}
		case 2:
		{
			self.n_fx_id = util::playfxontag(fieldname, "sr/fx9_chest_explore_amb_md", self, "tag_origin");
			self.var_b3673abf = self playloopsound(#"hash_3b1f5984e7ae4c48", undefined, vectorscale((0, 0, 1), 40));
			break;
		}
		case 3:
		{
			self.n_fx_id = util::playfxontag(fieldname, "sr/fx9_chest_explore_amb_lg", self, "tag_origin");
			self.var_b3673abf = self playloopsound(#"hash_5dc67061425177d4", undefined, vectorscale((0, 0, 1), 40));
			break;
		}
	}
}

