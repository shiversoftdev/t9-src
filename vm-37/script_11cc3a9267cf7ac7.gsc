#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_98decc78;

/*
	Name: function_89f2df9
	Namespace: namespace_98decc78
	Checksum: 0xC09E0851
	Offset: 0xF0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_5cb28995c23c44a", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_98decc78
	Checksum: 0x134C27B1
	Offset: 0x138
	Size: 0x5C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("toplayer", "" + #"hash_3a86c740229275b7", 1, 3, "counter", &function_d5270d1a, 0, 0);
}

/*
	Name: function_d5270d1a
	Namespace: namespace_98decc78
	Checksum: 0x1B1D4055
	Offset: 0x1A0
	Size: 0x284
	Parameters: 7
	Flags: Linked
*/
function function_d5270d1a(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	util::waittill_dobj(localclientnum);
	self endon(#"death");
	self thread postfx::playpostfxbundle(#"hash_1d2ed88d1700cf24");
	if(newval === 1)
	{
		self postfx::function_c8b5f318(#"hash_1d2ed88d1700cf24", "Origin Y", 1);
		self postfx::function_c8b5f318(#"hash_1d2ed88d1700cf24", "Origin X", 0);
	}
	else
	{
		if(newval === 2)
		{
			self postfx::function_c8b5f318(#"hash_1d2ed88d1700cf24", "Origin Y", -1);
			self postfx::function_c8b5f318(#"hash_1d2ed88d1700cf24", "Origin X", 0);
		}
		else
		{
			if(newval === 3)
			{
				self postfx::function_c8b5f318(#"hash_1d2ed88d1700cf24", "Origin Y", 0);
				self postfx::function_c8b5f318(#"hash_1d2ed88d1700cf24", "Origin X", 1);
			}
			else if(newval === 4)
			{
				self postfx::function_c8b5f318(#"hash_1d2ed88d1700cf24", "Origin Y", 0);
				self postfx::function_c8b5f318(#"hash_1d2ed88d1700cf24", "Origin X", -1);
			}
		}
	}
	if(!isdefined(self.var_f0007ebc))
	{
		self.var_f0007ebc = 0;
	}
	self thread function_28efdb7f(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump);
}

/*
	Name: function_28efdb7f
	Namespace: namespace_98decc78
	Checksum: 0xE523FD26
	Offset: 0x430
	Size: 0x1A4
	Parameters: 7
	Flags: Linked
*/
function function_28efdb7f(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	self.var_d5e7df0f = 1;
	self postfx::function_c8b5f318(#"hash_1d2ed88d1700cf24", "Opacity", 0);
	self util::lerp_generic(bwastimejump, 175, &function_606248f8, self.var_f0007ebc, 1, "Opacity", #"hash_1d2ed88d1700cf24");
	self postfx::function_c8b5f318(#"hash_1d2ed88d1700cf24", "Screen Radius Inner", 0.5);
	self postfx::function_c8b5f318(#"hash_1d2ed88d1700cf24", "Screen Radius Outer", 0.7);
	wait(0.175);
	self util::lerp_generic(bwastimejump, 1650, &function_606248f8, self.var_f0007ebc, 0, "Opacity", #"hash_1d2ed88d1700cf24");
}

/*
	Name: function_606248f8
	Namespace: namespace_98decc78
	Checksum: 0xE2B583FB
	Offset: 0x5E0
	Size: 0xEC
	Parameters: 8
	Flags: Linked
*/
function function_606248f8(currenttime, elapsedtime, localclientnum, duration, var_2347e08e, var_991d3376, constant, postfx)
{
	self endon(#"death");
	if(!self postfx::function_556665f2(#"hash_1d2ed88d1700cf24"))
	{
		return;
	}
	percent = var_2347e08e / var_991d3376;
	amount = (postfx * percent) + (constant * (1 - percent));
	self.var_f0007ebc = amount;
	self postfx::function_c8b5f318(#"hash_1d2ed88d1700cf24", "Opacity", amount);
}

