#using scripts\core_common\lui_shared.csc;

class class_42946372 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_42946372
		Checksum: 0x3CA92F02
		Offset: 0x4B8
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_42946372
		Checksum: 0x2394690F
		Offset: 0x750
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_42946372
		Checksum: 0xED71C4D6
		Offset: 0x608
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function open(localclientnum)
	{
		namespace_6aaccc24::open(localclientnum);
	}

	/*
		Name: function_3b7b386a
		Namespace: namespace_42946372
		Checksum: 0x494CFAA
		Offset: 0x670
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_3b7b386a(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "clientnum", value);
	}

	/*
		Name: function_4f6e830d
		Namespace: namespace_42946372
		Checksum: 0x7C61F63F
		Offset: 0x6E0
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
		Namespace: namespace_42946372
		Checksum: 0xE7D621C7
		Offset: 0x528
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("DOA_TextBubble_PlayerName");
	}

	/*
		Name: function_61312692
		Namespace: namespace_42946372
		Checksum: 0x7EEC2235
		Offset: 0x6A8
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
		Namespace: namespace_42946372
		Checksum: 0x414C32B0
		Offset: 0x718
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
		Namespace: namespace_42946372
		Checksum: 0xEE62ABCF
		Offset: 0x4D8
		Size: 0x44
		Parameters: 5
		Flags: Linked
	*/
	function setup_clientfields(var_5a7b4b38, var_c05c67e2, var_5957697a, var_90efc226, var_b77f41ee)
	{
		namespace_6aaccc24::setup_clientfields("DOA_TextBubble_PlayerName");
	}

	/*
		Name: function_c8350e33
		Namespace: namespace_42946372
		Checksum: 0xD267C096
		Offset: 0x638
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_c8350e33(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "entnum", value);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_42946372
		Checksum: 0x3E48E153
		Offset: 0x550
		Size: 0xB0
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
		[[ self ]]->function_d7d2fcce(localclientnum, "entnum", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "clientnum", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "offset_x", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "offset_y", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "offset_z", 0);
	}

}

#namespace doa_textbubble_playername;

/*
	Name: function_b4023f5a
	Namespace: doa_textbubble_playername
	Checksum: 0xAC724DDB
	Offset: 0xF0
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
	Namespace: doa_textbubble_playername
	Checksum: 0x9F17167F
	Offset: 0x168
	Size: 0x19E
	Parameters: 5
	Flags: None
*/
function register(var_5a7b4b38, var_c05c67e2, var_5957697a, var_90efc226, var_b77f41ee)
{
	elem = new class_42946372();
	[[ elem ]]->setup_clientfields(var_5a7b4b38, var_c05c67e2, var_5957697a, var_90efc226, var_b77f41ee);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"doa_textbubble_playername"]))
	{
		level.var_ae746e8f[#"doa_textbubble_playername"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"doa_textbubble_playername"]))
	{
		level.var_ae746e8f[#"doa_textbubble_playername"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"doa_textbubble_playername"]))
	{
		level.var_ae746e8f[#"doa_textbubble_playername"] = array(level.var_ae746e8f[#"doa_textbubble_playername"]);
	}
	level.var_ae746e8f[#"doa_textbubble_playername"][level.var_ae746e8f[#"doa_textbubble_playername"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: doa_textbubble_playername
	Checksum: 0xE3D078BB
	Offset: 0x310
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_5c1bb138()
{
	elem = new class_42946372();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: doa_textbubble_playername
	Checksum: 0x363D9E88
	Offset: 0x350
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
	Namespace: doa_textbubble_playername
	Checksum: 0xCC1C83A2
	Offset: 0x378
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
	Namespace: doa_textbubble_playername
	Checksum: 0xC4064E9F
	Offset: 0x3A0
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
	Namespace: doa_textbubble_playername
	Checksum: 0xD470DB9A
	Offset: 0x3C8
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_c8350e33(localclientnum, value)
{
	[[ self ]]->function_c8350e33(localclientnum, value);
}

/*
	Name: function_3b7b386a
	Namespace: doa_textbubble_playername
	Checksum: 0x2C6907CA
	Offset: 0x3F8
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_3b7b386a(localclientnum, value)
{
	[[ self ]]->function_3b7b386a(localclientnum, value);
}

/*
	Name: function_61312692
	Namespace: doa_textbubble_playername
	Checksum: 0x42384878
	Offset: 0x428
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
	Namespace: doa_textbubble_playername
	Checksum: 0x8F22A8C8
	Offset: 0x458
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
	Namespace: doa_textbubble_playername
	Checksum: 0xFAF3B05A
	Offset: 0x488
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_7ddfdfef(localclientnum, value)
{
	[[ self ]]->function_7ddfdfef(localclientnum, value);
}

