#using scripts\core_common\lui_shared.csc;

class cdoa_textbubble_playername : cluielem
{

	/*
		Name: constructor
		Namespace: cdoa_textbubble_playername
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
		Namespace: cdoa_textbubble_playername
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
		Namespace: cdoa_textbubble_playername
		Checksum: 0xED71C4D6
		Offset: 0x608
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function open(localclientnum)
	{
		cluielem::open(localclientnum);
	}

	/*
		Name: set_clientnum
		Namespace: cdoa_textbubble_playername
		Checksum: 0x494CFAA
		Offset: 0x670
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_clientnum(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "clientnum", value);
	}

	/*
		Name: set_offset_y
		Namespace: cdoa_textbubble_playername
		Checksum: 0x7C61F63F
		Offset: 0x6E0
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_offset_y(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "offset_y", value);
	}

	/*
		Name: register_clientside
		Namespace: cdoa_textbubble_playername
		Checksum: 0xE7D621C7
		Offset: 0x528
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function register_clientside()
	{
		cluielem::register_clientside("DOA_TextBubble_PlayerName");
	}

	/*
		Name: set_offset_x
		Namespace: cdoa_textbubble_playername
		Checksum: 0x7EEC2235
		Offset: 0x6A8
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_offset_x(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "offset_x", value);
	}

	/*
		Name: set_offset_z
		Namespace: cdoa_textbubble_playername
		Checksum: 0x414C32B0
		Offset: 0x718
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_offset_z(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "offset_z", value);
	}

	/*
		Name: setup_clientfields
		Namespace: cdoa_textbubble_playername
		Checksum: 0xEE62ABCF
		Offset: 0x4D8
		Size: 0x44
		Parameters: 5
		Flags: Linked
	*/
	function setup_clientfields(var_5a7b4b38, var_c05c67e2, var_5957697a, var_90efc226, var_b77f41ee)
	{
		cluielem::setup_clientfields("DOA_TextBubble_PlayerName");
	}

	/*
		Name: set_entnum
		Namespace: cdoa_textbubble_playername
		Checksum: 0xD267C096
		Offset: 0x638
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_entnum(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "entnum", value);
	}

	/*
		Name: function_fa582112
		Namespace: cdoa_textbubble_playername
		Checksum: 0x3E48E153
		Offset: 0x550
		Size: 0xB0
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
		[[ self ]]->set_data(localclientnum, "entnum", 0);
		[[ self ]]->set_data(localclientnum, "clientnum", 0);
		[[ self ]]->set_data(localclientnum, "offset_x", 0);
		[[ self ]]->set_data(localclientnum, "offset_y", 0);
		[[ self ]]->set_data(localclientnum, "offset_z", 0);
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
	self set_offset_x(localclientnum, offsetx);
	self set_offset_y(localclientnum, offsety);
	self set_offset_z(localclientnum, offsetz);
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
	elem = new cdoa_textbubble_playername();
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
	Name: register_clientside
	Namespace: doa_textbubble_playername
	Checksum: 0xE3D078BB
	Offset: 0x310
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function register_clientside()
{
	elem = new cdoa_textbubble_playername();
	[[ elem ]]->register_clientside();
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
	Name: set_entnum
	Namespace: doa_textbubble_playername
	Checksum: 0xD470DB9A
	Offset: 0x3C8
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_entnum(localclientnum, value)
{
	[[ self ]]->set_entnum(localclientnum, value);
}

/*
	Name: set_clientnum
	Namespace: doa_textbubble_playername
	Checksum: 0x2C6907CA
	Offset: 0x3F8
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_clientnum(localclientnum, value)
{
	[[ self ]]->set_clientnum(localclientnum, value);
}

/*
	Name: set_offset_x
	Namespace: doa_textbubble_playername
	Checksum: 0x42384878
	Offset: 0x428
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_offset_x(localclientnum, value)
{
	[[ self ]]->set_offset_x(localclientnum, value);
}

/*
	Name: set_offset_y
	Namespace: doa_textbubble_playername
	Checksum: 0x8F22A8C8
	Offset: 0x458
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_offset_y(localclientnum, value)
{
	[[ self ]]->set_offset_y(localclientnum, value);
}

/*
	Name: set_offset_z
	Namespace: doa_textbubble_playername
	Checksum: 0xFAF3B05A
	Offset: 0x488
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_offset_z(localclientnum, value)
{
	[[ self ]]->set_offset_z(localclientnum, value);
}

