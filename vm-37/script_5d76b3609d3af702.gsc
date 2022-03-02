#using scripts\core_common\lui_shared.csc;

class class_b20c2804 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_b20c2804
		Checksum: 0xD3BDB838
		Offset: 0x540
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_b20c2804
		Checksum: 0x8B06ECA4
		Offset: 0x7E8
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_b20c2804
		Checksum: 0x11B7671C
		Offset: 0x6A0
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
		Namespace: namespace_b20c2804
		Checksum: 0x2E5B9900
		Offset: 0x778
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
		Namespace: namespace_b20c2804
		Checksum: 0x475959ED
		Offset: 0x5B0
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("DOA_TextBubble");
	}

	/*
		Name: function_61312692
		Namespace: namespace_b20c2804
		Checksum: 0xBD3A723A
		Offset: 0x740
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
		Namespace: namespace_b20c2804
		Checksum: 0xEEC0A34E
		Offset: 0x7B0
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
		Namespace: namespace_b20c2804
		Checksum: 0xDC786FED
		Offset: 0x560
		Size: 0x44
		Parameters: 5
		Flags: Linked
	*/
	function setup_clientfields(var_5a7b4b38, var_f5852d69, var_5957697a, var_90efc226, var_b77f41ee)
	{
		namespace_6aaccc24::setup_clientfields("DOA_TextBubble");
	}

	/*
		Name: function_c8350e33
		Namespace: namespace_b20c2804
		Checksum: 0xCFD2EAC
		Offset: 0x6D0
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_c8350e33(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "entnum", value);
	}

	/*
		Name: function_d5ea17f0
		Namespace: namespace_b20c2804
		Checksum: 0xDCB7F289
		Offset: 0x708
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_d5ea17f0(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "text", value);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_b20c2804
		Checksum: 0xC50D27A9
		Offset: 0x5D8
		Size: 0xC0
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
		[[ self ]]->function_d7d2fcce(localclientnum, "entnum", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "text", #"");
		[[ self ]]->function_d7d2fcce(localclientnum, "offset_x", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "offset_y", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "offset_z", 0);
	}

}

#namespace doa_textbubble;

/*
	Name: function_b4023f5a
	Namespace: doa_textbubble
	Checksum: 0x1384062B
	Offset: 0xE8
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
	Name: function_78098d4b
	Namespace: doa_textbubble
	Checksum: 0x14EABC8A
	Offset: 0x160
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
	Namespace: doa_textbubble
	Checksum: 0x23CDD908
	Offset: 0x198
	Size: 0x4C
	Parameters: 3
	Flags: Linked
*/
function function_919052d(localclientnum, entnum, bonetag)
{
	self function_c8350e33(localclientnum, entnum);
	self function_78098d4b(localclientnum, bonetag);
}

/*
	Name: register
	Namespace: doa_textbubble
	Checksum: 0xD61111C7
	Offset: 0x1F0
	Size: 0x19E
	Parameters: 5
	Flags: None
*/
function register(var_5a7b4b38, var_f5852d69, var_5957697a, var_90efc226, var_b77f41ee)
{
	elem = new class_b20c2804();
	[[ elem ]]->setup_clientfields(var_5a7b4b38, var_f5852d69, var_5957697a, var_90efc226, var_b77f41ee);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"doa_textbubble"]))
	{
		level.var_ae746e8f[#"doa_textbubble"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"doa_textbubble"]))
	{
		level.var_ae746e8f[#"doa_textbubble"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"doa_textbubble"]))
	{
		level.var_ae746e8f[#"doa_textbubble"] = array(level.var_ae746e8f[#"doa_textbubble"]);
	}
	level.var_ae746e8f[#"doa_textbubble"][level.var_ae746e8f[#"doa_textbubble"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: doa_textbubble
	Checksum: 0x70AB7C63
	Offset: 0x398
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_5c1bb138()
{
	elem = new class_b20c2804();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: doa_textbubble
	Checksum: 0x7967A665
	Offset: 0x3D8
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
	Namespace: doa_textbubble
	Checksum: 0x99687F4
	Offset: 0x400
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
	Namespace: doa_textbubble
	Checksum: 0xCB677869
	Offset: 0x428
	Size: 0x1A
	Parameters: 1
	Flags: Linked
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: function_c8350e33
	Namespace: doa_textbubble
	Checksum: 0x4A1E525A
	Offset: 0x450
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_c8350e33(localclientnum, value)
{
	[[ self ]]->function_c8350e33(localclientnum, value);
}

/*
	Name: function_d5ea17f0
	Namespace: doa_textbubble
	Checksum: 0x5C9A020E
	Offset: 0x480
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_d5ea17f0(localclientnum, value)
{
	[[ self ]]->function_d5ea17f0(localclientnum, value);
}

/*
	Name: function_61312692
	Namespace: doa_textbubble
	Checksum: 0x7F27E866
	Offset: 0x4B0
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
	Namespace: doa_textbubble
	Checksum: 0x68225F8D
	Offset: 0x4E0
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
	Namespace: doa_textbubble
	Checksum: 0xE8F7D291
	Offset: 0x510
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_7ddfdfef(localclientnum, value)
{
	[[ self ]]->function_7ddfdfef(localclientnum, value);
}

