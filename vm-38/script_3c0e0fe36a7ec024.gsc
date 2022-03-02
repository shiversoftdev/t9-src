#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\zm_common\zm_utility.csc;

#namespace namespace_12a6a726;

/*
	Name: function_a84b86bb
	Namespace: namespace_12a6a726
	Checksum: 0x2BF210FE
	Offset: 0xB8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_a84b86bb()
{
	level notify(392598706);
}

/*
	Name: function_89f2df9
	Namespace: namespace_12a6a726
	Checksum: 0x32FAC17F
	Offset: 0xD8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_72a9f15f4124442", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_12a6a726
	Checksum: 0xA32E730B
	Offset: 0x120
	Size: 0xC4
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	if(!zm_utility::is_survival())
	{
		return;
	}
	if(!is_true(getgametypesetting(#"hash_49c3a9d150ecbb16")) && !getdvarint(#"hash_730311c63805303a", 0))
	{
		return;
	}
	clientfield::register("scriptmover", "sr_supply_drop_chest_fx", 1, 2, "int", &function_804af09b, 0, 0);
}

/*
	Name: function_804af09b
	Namespace: namespace_12a6a726
	Checksum: 0xE078159A
	Offset: 0x1F0
	Size: 0x2AC
	Parameters: 7
	Flags: Linked
*/
function function_804af09b(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		self.var_aa4114ee = function_239993de(fieldname, #"hash_23c80cc2126820b2", self, "tag_origin");
		self.var_4b0f392d = self playloopsound(#"hash_52036cf3cfe2b967");
		playsound(fieldname, #"hash_1f3fbd4b941aceed", self.origin + vectorscale((0, 0, 1), 35));
		function_239993de(fieldname, #"hash_64f736260391468a", self, "tag_origin");
	}
	else
	{
		if(bwastimejump == 2)
		{
			self.n_fx = function_239993de(fieldname, #"hash_755eec380d6c4e4a", self, "tag_origin");
			self playsound(fieldname, #"hash_259adbb44db3fea8");
			self.var_3dec4e8f = self playloopsound(#"hash_5a60a8ef6b7d6df1");
		}
		else if(bwastimejump == 3)
		{
			if(isdefined(self.n_fx))
			{
				stopfx(fieldname, self.n_fx);
			}
			if(isdefined(self.var_aa4114ee))
			{
				stopfx(fieldname, self.var_aa4114ee);
			}
			if(isdefined(self.var_4b0f392d))
			{
				self stoploopsound(self.var_4b0f392d);
				self.var_4b0f392d = undefined;
			}
			if(isdefined(self.var_3dec4e8f))
			{
				self stoploopsound(self.var_3dec4e8f);
				self.var_3dec4e8f = undefined;
			}
			function_239993de(fieldname, #"hash_160e892a069e168e", self, "tag_origin");
			self playsound(fieldname, #"hash_2d72791853c13b5");
		}
	}
}

