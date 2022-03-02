#using scripts\core_common\lui_shared.csc;

class class_b20c2804 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_b20c2804
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
		Namespace: namespace_b20c2804
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
		Namespace: namespace_b20c2804
		Checksum: 0x5009DED4
		Offset: 0x6C0
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		namespace_6aaccc24::open(localclientnum);
	}

	/*
		Name: function_4f6e830d
		Namespace: namespace_b20c2804
		Checksum: 0x2332828C
		Offset: 0x798
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_4f6e830d(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "offset_y", value);
	}

	/*
		Name: function_5c1bb138
		Namespace: namespace_b20c2804
		Checksum: 0xD8BB26DA
		Offset: 0x5D0
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("DOA_TextBubble");
	}

	/*
		Name: function_61312692
		Namespace: namespace_b20c2804
		Checksum: 0xB88F04F2
		Offset: 0x760
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_61312692(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "offset_x", value);
	}

	/*
		Name: function_7ddfdfef
		Namespace: namespace_b20c2804
		Checksum: 0xDCAD69B9
		Offset: 0x7D0
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_7ddfdfef(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "offset_z", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_b20c2804
		Checksum: 0x7EBDB5AA
		Offset: 0x580
		Size: 0x44
		Parameters: 5
		Flags: None
	*/
	function setup_clientfields(var_5a7b4b38, var_f5852d69, var_5957697a, var_90efc226, var_b77f41ee)
	{
		namespace_6aaccc24::setup_clientfields("DOA_TextBubble");
	}

	/*
		Name: function_c8350e33
		Namespace: namespace_b20c2804
		Checksum: 0x363CB818
		Offset: 0x6F0
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_c8350e33(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "entnum", value);
	}

	/*
		Name: function_d5ea17f0
		Namespace: namespace_b20c2804
		Checksum: 0x6FFFA821
		Offset: 0x728
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_d5ea17f0(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "text", value);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_b20c2804
		Checksum: 0xD055506C
		Offset: 0x5F8
		Size: 0xC0
		Parameters: 1
		Flags: None
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
	self function_61312692(localclientnum, offsetx);
	self function_4f6e830d(localclientnum, offsety);
	self function_7ddfdfef(localclientnum, offsetz);
}

/*
	Name: function_78098d4b
	Namespace: doa_textbubble
	Checksum: 0xB5405580
	Offset: 0x180
	Size: 0x30
	Parameters: 2
	Flags: None
*/
function function_78098d4b(localclientnum, value)
{
	[[ self ]]->function_d7d2fcce(localclientnum, "boneTag", value);
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
	self function_c8350e33(localclientnum, entnum);
	self function_78098d4b(localclientnum, bonetag);
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
	Checksum: 0x94D5D8D9
	Offset: 0x3B8
	Size: 0x34
	Parameters: 0
	Flags: None
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
	Name: function_c8350e33
	Namespace: doa_textbubble
	Checksum: 0xAFA8A384
	Offset: 0x470
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_c8350e33(localclientnum, value)
{
	[[ self ]]->function_c8350e33(localclientnum, value);
}

/*
	Name: function_d5ea17f0
	Namespace: doa_textbubble
	Checksum: 0x1517EB17
	Offset: 0x4A0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_d5ea17f0(localclientnum, value)
{
	[[ self ]]->function_d5ea17f0(localclientnum, value);
}

/*
	Name: function_61312692
	Namespace: doa_textbubble
	Checksum: 0xDB3E99DA
	Offset: 0x4D0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_61312692(localclientnum, value)
{
	[[ self ]]->function_61312692(localclientnum, value);
}

/*
	Name: function_4f6e830d
	Namespace: doa_textbubble
	Checksum: 0xEEA35256
	Offset: 0x500
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_4f6e830d(localclientnum, value)
{
	[[ self ]]->function_4f6e830d(localclientnum, value);
}

/*
	Name: function_7ddfdfef
	Namespace: doa_textbubble
	Checksum: 0xB45FA8C8
	Offset: 0x530
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_7ddfdfef(localclientnum, value)
{
	[[ self ]]->function_7ddfdfef(localclientnum, value);
}

