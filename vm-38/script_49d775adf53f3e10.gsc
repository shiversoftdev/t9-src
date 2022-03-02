#using script_17a9d06bf819b2d3;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_47809ab2;

/*
	Name: function_14538ed9
	Namespace: namespace_47809ab2
	Checksum: 0x25DF19DA
	Offset: 0x168
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_14538ed9()
{
	level notify(1239873005);
}

/*
	Name: init
	Namespace: namespace_47809ab2
	Checksum: 0x38D16D96
	Offset: 0x188
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
	Namespace: namespace_47809ab2
	Checksum: 0x3E616219
	Offset: 0x1A8
	Size: 0x1EC
	Parameters: 0
	Flags: Linked
*/
function init_clientfields()
{
	clientfield::register("toplayer", "" + #"hash_227c832bd5864419", 1, 1, "int", &function_9199e921, 0, 0);
	clientfield::register("allplayers", "" + #"hash_31c153af499657fd", 1, 1, "int", &function_4a0e5efb, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_5822132672ad230f", 1, 1, "int", &function_2c087855, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_6219dce209d171ed", 1, 2, "int", &function_fccba5d0, 0, 0);
	namespace_5b1144e::function_5ae4a10c("p9_zm_gold_jumppads_machine_main", "gold_jump_pad", #"hash_7f09cfa60a53e5da", undefined, #"hash_78c19a4e1e68d0c4", 1, -20);
	namespace_5b1144e::function_5ae4a10c("p9_zm_gold_jumppads_machine_sub", "gold_landing_pad", #"hash_5d6fe9e2bb10532d", undefined, #"hash_3a19bc129f8b2b4b");
}

/*
	Name: function_9199e921
	Namespace: namespace_47809ab2
	Checksum: 0x48243135
	Offset: 0x3A0
	Size: 0xAC
	Parameters: 7
	Flags: Linked
*/
function function_9199e921(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		self thread postfx::playpostfxbundle("pstfx_jump_pad_launch");
	}
	else
	{
		self thread postfx::exitpostfxbundle("pstfx_jump_pad_launch");
		self playrumbleonentity(fieldname, #"hash_17a7c0691c65e722");
	}
}

/*
	Name: function_4a0e5efb
	Namespace: namespace_47809ab2
	Checksum: 0x29CCD099
	Offset: 0x458
	Size: 0xAE
	Parameters: 7
	Flags: Linked
*/
function function_4a0e5efb(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		self.var_1749c2a9 = self playloopsound(#"hash_64c2dcc38c5547e2");
	}
	else if(isdefined(self.var_1749c2a9))
	{
		self stoploopsound(self.var_1749c2a9);
		self.var_1749c2a9 = undefined;
	}
}

/*
	Name: function_2c087855
	Namespace: namespace_47809ab2
	Checksum: 0x893458AD
	Offset: 0x510
	Size: 0xBE
	Parameters: 7
	Flags: Linked
*/
function function_2c087855(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		if(!isdefined(self.var_c9480534))
		{
			self.var_c9480534 = self playloopsound(#"hash_67d068901551222c");
		}
	}
	else if(isdefined(self.var_c9480534))
	{
		self stoploopsound(self.var_c9480534);
		self.var_c9480534 = undefined;
	}
}

/*
	Name: function_fccba5d0
	Namespace: namespace_47809ab2
	Checksum: 0x7574398E
	Offset: 0x5D8
	Size: 0x1C2
	Parameters: 7
	Flags: Linked
*/
function function_fccba5d0(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(isdefined(self.var_4b81d3a7))
	{
		stopfx(fieldname, self.var_4b81d3a7);
		self.var_4b81d3a7 = undefined;
	}
	if(isdefined(self.var_510ae6c9))
	{
		stopfx(fieldname, self.var_510ae6c9);
		self.var_510ae6c9 = undefined;
	}
	switch(bwastimejump)
	{
		case 0:
		{
			break;
		}
		case 1:
		{
			self.var_510ae6c9 = util::playfxontag(fieldname, #"hash_425a20b3838488b9", self, "tag_light_right_fx");
			self.var_4b81d3a7 = util::playfxontag(fieldname, #"hash_425a20b3838488b9", self, "tag_light_left_fx");
			break;
		}
		case 2:
		{
			self.var_510ae6c9 = util::playfxontag(fieldname, #"hash_2fa753029cdd63bd", self, "tag_light_right_fx");
			self.var_4b81d3a7 = util::playfxontag(fieldname, #"hash_2fa753029cdd63bd", self, "tag_light_left_fx");
			break;
		}
		default:
		{
			break;
		}
	}
}

