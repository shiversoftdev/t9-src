#using script_3c362258ff800237;
#using script_3d5821d793ed4c6;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\zm_common\util.csc;
#using scripts\zm_common\zm_pack_a_punch.csc;
#using scripts\zm_common\zm_utility.csc;

#namespace namespace_841de7df;

/*
	Name: function_e3b1e5e6
	Namespace: namespace_841de7df
	Checksum: 0x3533B9D2
	Offset: 0x100
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_e3b1e5e6()
{
	level notify(170100904);
}

/*
	Name: function_89f2df9
	Namespace: namespace_841de7df
	Checksum: 0xF8DC88BF
	Offset: 0x120
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_4ef9c479ac8da304", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_841de7df
	Checksum: 0x535D0208
	Offset: 0x168
	Size: 0xEC
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(!zm_trial::function_b47f6aba())
	{
		return;
	}
	clientfield::register("zbarrier", "" + #"hash_100f180bf5d2a517", 14000, 1, "int", &function_b245db69, 0, 0);
	level._effect[#"hash_1d15a2dad558ac8c"] = "zombie/fx8_packapunch_zmb_red_gauntlet";
	level._effect[#"hash_1d15a5dad558b1a5"] = "zombie/fx8_packapunch_zmb_red_gauntlet";
	zm_trial::register_challenge(#"hash_28d1b9857e2ca681", &function_d1de6a85, &function_9e7b3f4d);
}

/*
	Name: function_d1de6a85
	Namespace: namespace_841de7df
	Checksum: 0xD196B002
	Offset: 0x260
	Size: 0x14
	Parameters: 2
	Flags: Private
*/
function private function_d1de6a85(localclientnum, a_params)
{
}

/*
	Name: function_9e7b3f4d
	Namespace: namespace_841de7df
	Checksum: 0x38A4EF99
	Offset: 0x280
	Size: 0xC
	Parameters: 1
	Flags: Private
*/
function private function_9e7b3f4d(localclientnum)
{
}

/*
	Name: is_active
	Namespace: namespace_841de7df
	Checksum: 0xE1603A75
	Offset: 0x298
	Size: 0x32
	Parameters: 0
	Flags: None
*/
function is_active()
{
	challenge = zm_trial::function_a36e8c38(#"hash_28d1b9857e2ca681");
	return isdefined(challenge);
}

/*
	Name: function_b245db69
	Namespace: namespace_841de7df
	Checksum: 0x57C889DC
	Offset: 0x2D8
	Size: 0x224
	Parameters: 7
	Flags: Private
*/
function private function_b245db69(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		if(isdefined(self.var_18f8b30b))
		{
			self.var_18f8b30b delete();
		}
		if(isdefined(self.var_3b071bba))
		{
			deletefx(fieldname, self.var_3b071bba);
			self.var_3b071bba = undefined;
		}
		if(zm_utility::function_166646a6() == 1)
		{
			self.var_18f8b30b = util::spawn_model(fieldname, "tag_origin", self.origin, self.angles);
			self.var_3b071bba = util::playfxontag(fieldname, level._effect[#"hash_1d15a2dad558ac8c"], self.var_18f8b30b, "tag_origin");
		}
		else
		{
			self.var_18f8b30b = util::spawn_model(fieldname, "tag_origin", self.origin, self.angles);
			self.var_3b071bba = util::playfxontag(fieldname, level._effect[#"hash_1d15a5dad558b1a5"], self.var_18f8b30b, "tag_origin");
		}
	}
	else
	{
		if(isdefined(self.var_3b071bba))
		{
			deletefx(fieldname, self.var_3b071bba);
			self.var_3b071bba = undefined;
		}
		if(isdefined(self.var_18f8b30b))
		{
			self.var_18f8b30b delete();
		}
	}
}

