#using scripts\core_common\lui_shared.csc;

class cdoa_textbubble : cluielem
{

	/*
		Name: constructor
		Namespace: cdoa_textbubble
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
		Namespace: cdoa_textbubble
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
		Namespace: cdoa_textbubble
		Checksum: 0x11B7671C
		Offset: 0x6A0
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function open(localclientnum)
	{
		cluielem::open(localclientnum);
	}

	/*
		Name: set_offset_y
		Namespace: cdoa_textbubble
		Checksum: 0x2E5B9900
		Offset: 0x778
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
		Namespace: cdoa_textbubble
		Checksum: 0x475959ED
		Offset: 0x5B0
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function register_clientside()
	{
		cluielem::register_clientside("DOA_TextBubble");
	}

	/*
		Name: set_offset_x
		Namespace: cdoa_textbubble
		Checksum: 0xBD3A723A
		Offset: 0x740
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
		Namespace: cdoa_textbubble
		Checksum: 0xEEC0A34E
		Offset: 0x7B0
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
		Namespace: cdoa_textbubble
		Checksum: 0xDC786FED
		Offset: 0x560
		Size: 0x44
		Parameters: 5
		Flags: Linked
	*/
	function setup_clientfields(var_5a7b4b38, var_f5852d69, var_5957697a, var_90efc226, var_b77f41ee)
	{
		cluielem::setup_clientfields("DOA_TextBubble");
	}

	/*
		Name: set_entnum
		Namespace: cdoa_textbubble
		Checksum: 0xCFD2EAC
		Offset: 0x6D0
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_entnum(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "entnum", value);
	}

	/*
		Name: set_text
		Namespace: cdoa_textbubble
		Checksum: 0xDCB7F289
		Offset: 0x708
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_text(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "text", value);
	}

	/*
		Name: function_fa582112
		Namespace: cdoa_textbubble
		Checksum: 0xC50D27A9
		Offset: 0x5D8
		Size: 0xC0
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
		[[ self ]]->set_data(localclientnum, "entnum", 0);
		[[ self ]]->set_data(localclientnum, "text", #"");
		[[ self ]]->set_data(localclientnum, "offset_x", 0);
		[[ self ]]->set_data(localclientnum, "offset_y", 0);
		[[ self ]]->set_data(localclientnum, "offset_z", 0);
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
	self set_offset_x(localclientnum, offsetx);
	self set_offset_y(localclientnum, offsety);
	self set_offset_z(localclientnum, offsetz);
}

/*
	Name: set_bonetag
	Namespace: doa_textbubble
	Checksum: 0x14EABC8A
	Offset: 0x160
	Size: 0x30
	Parameters: 2
	Flags: Linked
*/
function set_bonetag(localclientnum, value)
{
	[[ self ]]->set_data(localclientnum, "boneTag", value);
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
	self set_entnum(localclientnum, entnum);
	self set_bonetag(localclientnum, bonetag);
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
	elem = new cdoa_textbubble();
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
	Name: register_clientside
	Namespace: doa_textbubble
	Checksum: 0x70AB7C63
	Offset: 0x398
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function register_clientside()
{
	elem = new cdoa_textbubble();
	[[ elem ]]->register_clientside();
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
	Name: set_entnum
	Namespace: doa_textbubble
	Checksum: 0x4A1E525A
	Offset: 0x450
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_entnum(localclientnum, value)
{
	[[ self ]]->set_entnum(localclientnum, value);
}

/*
	Name: set_text
	Namespace: doa_textbubble
	Checksum: 0x5C9A020E
	Offset: 0x480
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_text(localclientnum, value)
{
	[[ self ]]->set_text(localclientnum, value);
}

/*
	Name: set_offset_x
	Namespace: doa_textbubble
	Checksum: 0x7F27E866
	Offset: 0x4B0
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
	Namespace: doa_textbubble
	Checksum: 0x68225F8D
	Offset: 0x4E0
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
	Namespace: doa_textbubble
	Checksum: 0xE8F7D291
	Offset: 0x510
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_offset_z(localclientnum, value)
{
	[[ self ]]->set_offset_z(localclientnum, value);
}

