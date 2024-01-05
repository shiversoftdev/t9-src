#using scripts\core_common\lui_shared.csc;

class cdoa_textbubble : cluielem
{

	/*
		Name: constructor
		Namespace: cdoa_textbubble
		Checksum: 0x7C0CD366
		Offset: 0x560
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cdoa_textbubble
		Checksum: 0xFE6101F5
		Offset: 0x808
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: cdoa_textbubble
		Checksum: 0x5009DED4
		Offset: 0x6C0
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		cluielem::open(localclientnum);
	}

	/*
		Name: set_offset_y
		Namespace: cdoa_textbubble
		Checksum: 0x2332828C
		Offset: 0x798
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_offset_y(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "offset_y", value);
	}

	/*
		Name: register_clientside
		Namespace: cdoa_textbubble
		Checksum: 0xD8BB26DA
		Offset: 0x5D0
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function register_clientside()
	{
		cluielem::register_clientside("DOA_TextBubble");
	}

	/*
		Name: set_offset_x
		Namespace: cdoa_textbubble
		Checksum: 0xB88F04F2
		Offset: 0x760
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_offset_x(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "offset_x", value);
	}

	/*
		Name: set_offset_z
		Namespace: cdoa_textbubble
		Checksum: 0xDCAD69B9
		Offset: 0x7D0
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_offset_z(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "offset_z", value);
	}

	/*
		Name: setup_clientfields
		Namespace: cdoa_textbubble
		Checksum: 0x7EBDB5AA
		Offset: 0x580
		Size: 0x44
		Parameters: 5
		Flags: None
	*/
	function setup_clientfields(var_5a7b4b38, var_f5852d69, var_5957697a, var_90efc226, var_b77f41ee)
	{
		cluielem::setup_clientfields("DOA_TextBubble");
	}

	/*
		Name: set_entnum
		Namespace: cdoa_textbubble
		Checksum: 0x363CB818
		Offset: 0x6F0
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_entnum(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "entnum", value);
	}

	/*
		Name: set_text
		Namespace: cdoa_textbubble
		Checksum: 0x6FFFA821
		Offset: 0x728
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_text(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "text", value);
	}

	/*
		Name: function_fa582112
		Namespace: cdoa_textbubble
		Checksum: 0xD055506C
		Offset: 0x5F8
		Size: 0xC0
		Parameters: 1
		Flags: None
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
	Name: function_3c8abe2
	Namespace: doa_textbubble
	Checksum: 0x687D28E0
	Offset: 0xE8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_3c8abe2()
{
	level notify(1640802832);
}

/*
	Name: function_b4023f5a
	Namespace: doa_textbubble
	Checksum: 0xA413E92A
	Offset: 0x108
	Size: 0x6C
	Parameters: 4
	Flags: None
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
	Checksum: 0xB5405580
	Offset: 0x180
	Size: 0x30
	Parameters: 2
	Flags: None
*/
function set_bonetag(localclientnum, value)
{
	[[ self ]]->set_data(localclientnum, "boneTag", value);
}

/*
	Name: function_919052d
	Namespace: doa_textbubble
	Checksum: 0xD1E7A866
	Offset: 0x1B8
	Size: 0x4C
	Parameters: 3
	Flags: None
*/
function function_919052d(localclientnum, entnum, bonetag)
{
	self set_entnum(localclientnum, entnum);
	self set_bonetag(localclientnum, bonetag);
}

/*
	Name: register
	Namespace: doa_textbubble
	Checksum: 0xC526122
	Offset: 0x210
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
	Checksum: 0x94D5D8D9
	Offset: 0x3B8
	Size: 0x34
	Parameters: 0
	Flags: None
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
	Checksum: 0x1F31AC01
	Offset: 0x3F8
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function open(player)
{
	[[ self ]]->open(player);
}

/*
	Name: close
	Namespace: doa_textbubble
	Checksum: 0x23DD11
	Offset: 0x420
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function close(player)
{
	[[ self ]]->close(player);
}

/*
	Name: is_open
	Namespace: doa_textbubble
	Checksum: 0xC04D9549
	Offset: 0x448
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: set_entnum
	Namespace: doa_textbubble
	Checksum: 0xAFA8A384
	Offset: 0x470
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_entnum(localclientnum, value)
{
	[[ self ]]->set_entnum(localclientnum, value);
}

/*
	Name: set_text
	Namespace: doa_textbubble
	Checksum: 0x1517EB17
	Offset: 0x4A0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_text(localclientnum, value)
{
	[[ self ]]->set_text(localclientnum, value);
}

/*
	Name: set_offset_x
	Namespace: doa_textbubble
	Checksum: 0xDB3E99DA
	Offset: 0x4D0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_offset_x(localclientnum, value)
{
	[[ self ]]->set_offset_x(localclientnum, value);
}

/*
	Name: set_offset_y
	Namespace: doa_textbubble
	Checksum: 0xEEA35256
	Offset: 0x500
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_offset_y(localclientnum, value)
{
	[[ self ]]->set_offset_y(localclientnum, value);
}

/*
	Name: set_offset_z
	Namespace: doa_textbubble
	Checksum: 0xB45FA8C8
	Offset: 0x530
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_offset_z(localclientnum, value)
{
	[[ self ]]->set_offset_z(localclientnum, value);
}

