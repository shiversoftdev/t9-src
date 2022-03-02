#using scripts\core_common\lui_shared.csc;

class class_276088fe : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_276088fe
		Checksum: 0xC66AB38D
		Offset: 0x640
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_276088fe
		Checksum: 0x7D341C0A
		Offset: 0xC68
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_276088fe
		Checksum: 0x5E1D002B
		Offset: 0x950
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function open(localclientnum)
	{
		namespace_6aaccc24::open(localclientnum);
	}

	/*
		Name: function_4f6e830d
		Namespace: namespace_276088fe
		Checksum: 0x41F3C812
		Offset: 0xB88
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_4f6e830d(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "offset_y", value);
	}

	/*
		Name: function_5c1bb138
		Namespace: namespace_276088fe
		Checksum: 0x3A907364
		Offset: 0x810
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("LUIelem_entity_bar");
	}

	/*
		Name: function_61312692
		Namespace: namespace_276088fe
		Checksum: 0xED3C9E11
		Offset: 0xB50
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_61312692(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "offset_x", value);
	}

	/*
		Name: function_7ddfdfef
		Namespace: namespace_276088fe
		Checksum: 0x3F55DE3B
		Offset: 0xBC0
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_7ddfdfef(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "offset_z", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_276088fe
		Checksum: 0xED34F4A2
		Offset: 0x660
		Size: 0x1A4
		Parameters: 9
		Flags: Linked
	*/
	function setup_clientfields(var_aabf01c7, var_5a7b4b38, var_bda3bf84, var_f228b5fa, var_5957697a, var_90efc226, var_b77f41ee, var_255edd98, var_2c8aa656)
	{
		namespace_6aaccc24::setup_clientfields("LUIelem_entity_bar");
		namespace_6aaccc24::function_da693cbe("_state", 1, 3, "int");
		namespace_6aaccc24::function_da693cbe("progress_percent", 1, 7, "float", var_bda3bf84);
		namespace_6aaccc24::function_da693cbe("entnum", 1, 7, "int", var_f228b5fa);
		namespace_6aaccc24::function_da693cbe("offset_x", 1, 6, "int", var_5957697a);
		namespace_6aaccc24::function_da693cbe("offset_y", 1, 6, "int", var_90efc226);
		namespace_6aaccc24::function_da693cbe("offset_z", 1, 6, "int", var_b77f41ee);
		namespace_6aaccc24::function_da693cbe("entityClamp", 1, 1, "int", var_255edd98);
		namespace_6aaccc24::function_da693cbe("entityScale", 1, 1, "int", var_2c8aa656);
	}

	/*
		Name: function_a9793a65
		Namespace: namespace_276088fe
		Checksum: 0x97ECE4D1
		Offset: 0xC30
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_a9793a65(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "entityScale", value);
	}

	/*
		Name: function_c8350e33
		Namespace: namespace_276088fe
		Checksum: 0xA240827F
		Offset: 0xB18
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_c8350e33(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "entnum", value);
	}

	/*
		Name: set_state
		Namespace: namespace_276088fe
		Checksum: 0x7795FB46
		Offset: 0x980
		Size: 0x154
		Parameters: 2
		Flags: Linked
	*/
	function set_state(localclientnum, state_name)
	{
		if(#"defaultstate" == state_name)
		{
			[[ self ]]->function_d7d2fcce(localclientnum, "_state", 0);
		}
		else
		{
			if(#"friendlyblue" == state_name)
			{
				[[ self ]]->function_d7d2fcce(localclientnum, "_state", 1);
			}
			else
			{
				if(#"green" == state_name)
				{
					[[ self ]]->function_d7d2fcce(localclientnum, "_state", 2);
				}
				else
				{
					if(#"yellow" == state_name)
					{
						[[ self ]]->function_d7d2fcce(localclientnum, "_state", 3);
					}
					else
					{
						if(#"red" == state_name)
						{
							[[ self ]]->function_d7d2fcce(localclientnum, "_state", 4);
						}
						else
						{
							/#
								assertmsg("");
							#/
							/#
							#/
						}
					}
				}
			}
		}
	}

	/*
		Name: function_dfed4b05
		Namespace: namespace_276088fe
		Checksum: 0x7587ADF6
		Offset: 0xBF8
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_dfed4b05(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "entityClamp", value);
	}

	/*
		Name: function_ecacbaa5
		Namespace: namespace_276088fe
		Checksum: 0xE980A500
		Offset: 0xAE0
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_ecacbaa5(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "progress_percent", value);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_276088fe
		Checksum: 0x8050C272
		Offset: 0x838
		Size: 0x110
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
		[[ self ]]->set_state(localclientnum, #"defaultstate");
		[[ self ]]->function_d7d2fcce(localclientnum, "progress_percent", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "entnum", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "offset_x", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "offset_y", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "offset_z", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "entityClamp", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "entityScale", 0);
	}

}

#namespace luielem_entity_bar;

/*
	Name: function_78098d4b
	Namespace: luielem_entity_bar
	Checksum: 0xE1EE2504
	Offset: 0x130
	Size: 0x30
	Parameters: 2
	Flags: Linked
*/
function function_78098d4b(localclientnum, value)
{
	[[ self ]]->function_d7d2fcce(localclientnum, "boneTag", value);
}

/*
	Name: function_919052d
	Namespace: luielem_entity_bar
	Checksum: 0x9FB24089
	Offset: 0x168
	Size: 0x4C
	Parameters: 3
	Flags: None
*/
function function_919052d(localclientnum, entnum, bonetag)
{
	self function_c8350e33(localclientnum, entnum);
	self function_78098d4b(localclientnum, bonetag);
}

/*
	Name: function_b4023f5a
	Namespace: luielem_entity_bar
	Checksum: 0x316DFD6F
	Offset: 0x1C0
	Size: 0x6C
	Parameters: 4
	Flags: Linked
*/
function function_b4023f5a(localclientnum, offsetx, offsety, offsetz)
{
	self function_61312692(localclientnum, offsetx);
	self function_4f6e830d(localclientnum, offsety);
	self function_7ddfdfef(localclientnum, offsetz);
}

/*
	Name: register
	Namespace: luielem_entity_bar
	Checksum: 0x12873F1D
	Offset: 0x238
	Size: 0x1C6
	Parameters: 9
	Flags: None
*/
function register(var_aabf01c7, var_5a7b4b38, var_bda3bf84, var_f228b5fa, var_5957697a, var_90efc226, var_b77f41ee, var_255edd98, var_2c8aa656)
{
	elem = new class_276088fe();
	[[ elem ]]->setup_clientfields(var_aabf01c7, var_5a7b4b38, var_bda3bf84, var_f228b5fa, var_5957697a, var_90efc226, var_b77f41ee, var_255edd98, var_2c8aa656);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"luielem_entity_bar"]))
	{
		level.var_ae746e8f[#"luielem_entity_bar"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"luielem_entity_bar"]))
	{
		level.var_ae746e8f[#"luielem_entity_bar"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"luielem_entity_bar"]))
	{
		level.var_ae746e8f[#"luielem_entity_bar"] = array(level.var_ae746e8f[#"luielem_entity_bar"]);
	}
	level.var_ae746e8f[#"luielem_entity_bar"][level.var_ae746e8f[#"luielem_entity_bar"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: luielem_entity_bar
	Checksum: 0x625AEB24
	Offset: 0x408
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_5c1bb138()
{
	elem = new class_276088fe();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: luielem_entity_bar
	Checksum: 0x4D177612
	Offset: 0x448
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function open(player)
{
	[[ self ]]->open(player);
}

/*
	Name: close
	Namespace: luielem_entity_bar
	Checksum: 0x983596B8
	Offset: 0x470
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function close(player)
{
	[[ self ]]->close(player);
}

/*
	Name: is_open
	Namespace: luielem_entity_bar
	Checksum: 0x6C55F1A7
	Offset: 0x498
	Size: 0x1A
	Parameters: 1
	Flags: Linked
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: set_state
	Namespace: luielem_entity_bar
	Checksum: 0xB0660DB6
	Offset: 0x4C0
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_state(localclientnum, state_name)
{
	[[ self ]]->set_state(localclientnum, state_name);
}

/*
	Name: function_ecacbaa5
	Namespace: luielem_entity_bar
	Checksum: 0x983F990B
	Offset: 0x4F0
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_ecacbaa5(localclientnum, value)
{
	[[ self ]]->function_ecacbaa5(localclientnum, value);
}

/*
	Name: function_c8350e33
	Namespace: luielem_entity_bar
	Checksum: 0x7677B1E4
	Offset: 0x520
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_c8350e33(localclientnum, value)
{
	[[ self ]]->function_c8350e33(localclientnum, value);
}

/*
	Name: function_61312692
	Namespace: luielem_entity_bar
	Checksum: 0xC6761349
	Offset: 0x550
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_61312692(localclientnum, value)
{
	[[ self ]]->function_61312692(localclientnum, value);
}

/*
	Name: function_4f6e830d
	Namespace: luielem_entity_bar
	Checksum: 0xE9F26C50
	Offset: 0x580
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_4f6e830d(localclientnum, value)
{
	[[ self ]]->function_4f6e830d(localclientnum, value);
}

/*
	Name: function_7ddfdfef
	Namespace: luielem_entity_bar
	Checksum: 0x53F6E726
	Offset: 0x5B0
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_7ddfdfef(localclientnum, value)
{
	[[ self ]]->function_7ddfdfef(localclientnum, value);
}

/*
	Name: function_dfed4b05
	Namespace: luielem_entity_bar
	Checksum: 0x72C9D93D
	Offset: 0x5E0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_dfed4b05(localclientnum, value)
{
	[[ self ]]->function_dfed4b05(localclientnum, value);
}

/*
	Name: function_a9793a65
	Namespace: luielem_entity_bar
	Checksum: 0xCB18A3EB
	Offset: 0x610
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_a9793a65(localclientnum, value)
{
	[[ self ]]->function_a9793a65(localclientnum, value);
}

