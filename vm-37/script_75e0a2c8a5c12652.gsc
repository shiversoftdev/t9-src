#using scripts\core_common\lui_shared.csc;

class class_df106b1 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_df106b1
		Checksum: 0xD09BA686
		Offset: 0x950
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_df106b1
		Checksum: 0x30B479BD
		Offset: 0x1110
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_df106b1
		Checksum: 0x9E84B8E2
		Offset: 0xE08
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function open(localclientnum)
	{
		namespace_6aaccc24::open(localclientnum);
	}

	/*
		Name: function_1a98dac6
		Namespace: namespace_df106b1
		Checksum: 0x298FF418
		Offset: 0x10A0
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_1a98dac6(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "textpayload", value);
	}

	/*
		Name: function_1bd2bb26
		Namespace: namespace_df106b1
		Checksum: 0x1E15FFC4
		Offset: 0x1030
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_1bd2bb26(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "horizontal_alignment", value);
	}

	/*
		Name: function_2208b8db
		Namespace: namespace_df106b1
		Checksum: 0x960137D5
		Offset: 0xF88
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_2208b8db(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "green", value);
	}

	/*
		Name: function_237ff433
		Namespace: namespace_df106b1
		Checksum: 0x6478955B
		Offset: 0xEE0
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_237ff433(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "fadeOverTime", value);
	}

	/*
		Name: function_5c1bb138
		Namespace: namespace_df106b1
		Checksum: 0xB0011558
		Offset: 0xC08
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("DOA_TextElement");
	}

	/*
		Name: function_5dbd7024
		Namespace: namespace_df106b1
		Checksum: 0x319C2DBF
		Offset: 0xEA8
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_5dbd7024(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "height", value);
	}

	/*
		Name: function_7420df0a
		Namespace: namespace_df106b1
		Checksum: 0x70A59DFF
		Offset: 0xFC0
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_7420df0a(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "blue", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_df106b1
		Checksum: 0xA67ABBDC
		Offset: 0x970
		Size: 0x28C
		Parameters: 13
		Flags: Linked
	*/
	function setup_clientfields(var_218de242, var_f6cc2724, var_fae6c0b5, var_a3e0a6ce, var_af074abc, var_9350f184, var_788c188f, var_3fb95ac9, var_f5852d69, var_cfabd75c, var_9194fd72, var_3d17213, var_766e2bbb)
	{
		namespace_6aaccc24::setup_clientfields("DOA_TextElement");
		namespace_6aaccc24::function_da693cbe("x", 1, 7, "int", var_fae6c0b5);
		namespace_6aaccc24::function_da693cbe("y", 1, 6, "int", var_a3e0a6ce);
		namespace_6aaccc24::function_da693cbe("height", 1, 2, "int", var_af074abc);
		namespace_6aaccc24::function_da693cbe("fadeOverTime", 1, 5, "int", var_9350f184);
		namespace_6aaccc24::function_da693cbe("alpha", 1, 4, "float", var_788c188f);
		namespace_6aaccc24::function_da693cbe("red", 1, 4, "float", var_3fb95ac9);
		namespace_6aaccc24::function_da693cbe("green", 1, 4, "float", var_f5852d69);
		namespace_6aaccc24::function_da693cbe("blue", 1, 4, "float", var_cfabd75c);
		namespace_6aaccc24::function_dcb34c80("string", "text", 1);
		namespace_6aaccc24::function_da693cbe("horizontal_alignment", 1, 2, "int", var_9194fd72);
		namespace_6aaccc24::function_da693cbe("intpayload", 1, 32, "int", var_3d17213);
		namespace_6aaccc24::function_dcb34c80("string", "textpayload", 1);
		namespace_6aaccc24::function_da693cbe("scale", 1, 5, "float", var_766e2bbb);
	}

	/*
		Name: set_y
		Namespace: namespace_df106b1
		Checksum: 0x68E4E504
		Offset: 0xE70
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_y(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "y", value);
	}

	/*
		Name: function_9e089af4
		Namespace: namespace_df106b1
		Checksum: 0x788E1426
		Offset: 0x1068
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_9e089af4(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "intpayload", value);
	}

	/*
		Name: function_aa5c711d
		Namespace: namespace_df106b1
		Checksum: 0xFBA40452
		Offset: 0xF18
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_aa5c711d(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "alpha", value);
	}

	/*
		Name: function_bede6f52
		Namespace: namespace_df106b1
		Checksum: 0x5336AF33
		Offset: 0x10D8
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_bede6f52(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "scale", value);
	}

	/*
		Name: set_x
		Namespace: namespace_df106b1
		Checksum: 0x2F23384F
		Offset: 0xE38
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_x(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "x", value);
	}

	/*
		Name: function_d5ea17f0
		Namespace: namespace_df106b1
		Checksum: 0x40D85968
		Offset: 0xFF8
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_d5ea17f0(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "text", value);
	}

	/*
		Name: function_eccc151d
		Namespace: namespace_df106b1
		Checksum: 0x7903FEF8
		Offset: 0xF50
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_eccc151d(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "red", value);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_df106b1
		Checksum: 0x11FC4A22
		Offset: 0xC30
		Size: 0x1D0
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
		[[ self ]]->function_d7d2fcce(localclientnum, "x", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "y", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "height", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "fadeOverTime", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "alpha", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "red", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "green", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "blue", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "text", #"");
		[[ self ]]->function_d7d2fcce(localclientnum, "horizontal_alignment", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "intpayload", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "textpayload", #"");
		[[ self ]]->function_d7d2fcce(localclientnum, "scale", 0);
	}

}

#namespace doa_textelement;

/*
	Name: set_color
	Namespace: doa_textelement
	Checksum: 0x829EA7AC
	Offset: 0x150
	Size: 0x6C
	Parameters: 4
	Flags: Linked
*/
function set_color(localclientnum, red, green, blue)
{
	self function_eccc151d(localclientnum, red);
	self function_2208b8db(localclientnum, green);
	self function_7420df0a(localclientnum, blue);
}

/*
	Name: fade
	Namespace: doa_textelement
	Checksum: 0xF0B6F4CF
	Offset: 0x1C8
	Size: 0x7C
	Parameters: 3
	Flags: Linked
*/
function fade(localclientnum, var_1a92607f, duration)
{
	if(!isdefined(duration))
	{
		duration = 0;
	}
	self function_aa5c711d(localclientnum, var_1a92607f);
	self function_237ff433(localclientnum, int(duration * 10));
}

/*
	Name: show
	Namespace: doa_textelement
	Checksum: 0x584DF888
	Offset: 0x250
	Size: 0x44
	Parameters: 2
	Flags: None
*/
function show(localclientnum, duration)
{
	if(!isdefined(duration))
	{
		duration = 0;
	}
	self fade(localclientnum, 1, duration);
}

/*
	Name: hide
	Namespace: doa_textelement
	Checksum: 0x507AA6F0
	Offset: 0x2A0
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function hide(localclientnum, duration)
{
	if(!isdefined(duration))
	{
		duration = 0;
	}
	self fade(localclientnum, 0, duration);
}

/*
	Name: function_e5898fd7
	Namespace: doa_textelement
	Checksum: 0xDAFEF6E5
	Offset: 0x2E8
	Size: 0x4C
	Parameters: 2
	Flags: Linked
*/
function function_e5898fd7(localclientnum, var_c6572d9b)
{
	self set_x(localclientnum, int(var_c6572d9b / 15));
}

/*
	Name: function_58a135d3
	Namespace: doa_textelement
	Checksum: 0x9185EEDF
	Offset: 0x340
	Size: 0x4C
	Parameters: 2
	Flags: Linked
*/
function function_58a135d3(localclientnum, var_d390c80e)
{
	self set_y(localclientnum, int(var_d390c80e / 15));
}

/*
	Name: function_f97e9049
	Namespace: doa_textelement
	Checksum: 0xFDE39332
	Offset: 0x398
	Size: 0x4C
	Parameters: 3
	Flags: Linked
*/
function function_f97e9049(localclientnum, var_c6572d9b, var_d390c80e)
{
	self function_e5898fd7(localclientnum, var_c6572d9b);
	self function_58a135d3(localclientnum, var_d390c80e);
}

/*
	Name: function_f50d5765
	Namespace: doa_textelement
	Checksum: 0xC942E7E2
	Offset: 0x3F0
	Size: 0x34
	Parameters: 2
	Flags: Linked
*/
function function_f50d5765(localclientnum, text)
{
	if(isdefined(text))
	{
		self function_d5ea17f0(localclientnum, text);
	}
}

/*
	Name: register
	Namespace: doa_textelement
	Checksum: 0xAE7140AB
	Offset: 0x430
	Size: 0x1EE
	Parameters: 13
	Flags: None
*/
function register(var_218de242, var_f6cc2724, var_fae6c0b5, var_a3e0a6ce, var_af074abc, var_9350f184, var_788c188f, var_3fb95ac9, var_f5852d69, var_cfabd75c, var_9194fd72, var_3d17213, var_766e2bbb)
{
	elem = new class_df106b1();
	[[ elem ]]->setup_clientfields(var_218de242, var_f6cc2724, var_fae6c0b5, var_a3e0a6ce, var_af074abc, var_9350f184, var_788c188f, var_3fb95ac9, var_f5852d69, var_cfabd75c, var_9194fd72, var_3d17213, var_766e2bbb);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"doa_textelement"]))
	{
		level.var_ae746e8f[#"doa_textelement"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"doa_textelement"]))
	{
		level.var_ae746e8f[#"doa_textelement"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"doa_textelement"]))
	{
		level.var_ae746e8f[#"doa_textelement"] = array(level.var_ae746e8f[#"doa_textelement"]);
	}
	level.var_ae746e8f[#"doa_textelement"][level.var_ae746e8f[#"doa_textelement"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: doa_textelement
	Checksum: 0x13842D6E
	Offset: 0x628
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_5c1bb138()
{
	elem = new class_df106b1();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: doa_textelement
	Checksum: 0x9BA1F5FD
	Offset: 0x668
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
	Namespace: doa_textelement
	Checksum: 0xCFE09313
	Offset: 0x690
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
	Namespace: doa_textelement
	Checksum: 0xA8B46F15
	Offset: 0x6B8
	Size: 0x1A
	Parameters: 1
	Flags: Linked
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: set_x
	Namespace: doa_textelement
	Checksum: 0xEC0DC4AB
	Offset: 0x6E0
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_x(localclientnum, value)
{
	[[ self ]]->set_x(localclientnum, value);
}

/*
	Name: set_y
	Namespace: doa_textelement
	Checksum: 0xC89D6CF4
	Offset: 0x710
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_y(localclientnum, value)
{
	[[ self ]]->set_y(localclientnum, value);
}

/*
	Name: function_5dbd7024
	Namespace: doa_textelement
	Checksum: 0xD1BC1630
	Offset: 0x740
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_5dbd7024(localclientnum, value)
{
	[[ self ]]->function_5dbd7024(localclientnum, value);
}

/*
	Name: function_237ff433
	Namespace: doa_textelement
	Checksum: 0xEA48261F
	Offset: 0x770
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_237ff433(localclientnum, value)
{
	[[ self ]]->function_237ff433(localclientnum, value);
}

/*
	Name: function_aa5c711d
	Namespace: doa_textelement
	Checksum: 0xCF4D0089
	Offset: 0x7A0
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_aa5c711d(localclientnum, value)
{
	[[ self ]]->function_aa5c711d(localclientnum, value);
}

/*
	Name: function_eccc151d
	Namespace: doa_textelement
	Checksum: 0xEC9A4F02
	Offset: 0x7D0
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_eccc151d(localclientnum, value)
{
	[[ self ]]->function_eccc151d(localclientnum, value);
}

/*
	Name: function_2208b8db
	Namespace: doa_textelement
	Checksum: 0xC398A6CF
	Offset: 0x800
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_2208b8db(localclientnum, value)
{
	[[ self ]]->function_2208b8db(localclientnum, value);
}

/*
	Name: function_7420df0a
	Namespace: doa_textelement
	Checksum: 0x58354D8
	Offset: 0x830
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_7420df0a(localclientnum, value)
{
	[[ self ]]->function_7420df0a(localclientnum, value);
}

/*
	Name: function_d5ea17f0
	Namespace: doa_textelement
	Checksum: 0xDB3DA36D
	Offset: 0x860
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_d5ea17f0(localclientnum, value)
{
	[[ self ]]->function_d5ea17f0(localclientnum, value);
}

/*
	Name: function_1bd2bb26
	Namespace: doa_textelement
	Checksum: 0xE1714DFB
	Offset: 0x890
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_1bd2bb26(localclientnum, value)
{
	[[ self ]]->function_1bd2bb26(localclientnum, value);
}

/*
	Name: function_9e089af4
	Namespace: doa_textelement
	Checksum: 0x359AA0CD
	Offset: 0x8C0
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_9e089af4(localclientnum, value)
{
	[[ self ]]->function_9e089af4(localclientnum, value);
}

/*
	Name: function_1a98dac6
	Namespace: doa_textelement
	Checksum: 0x4903BD1
	Offset: 0x8F0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_1a98dac6(localclientnum, value)
{
	[[ self ]]->function_1a98dac6(localclientnum, value);
}

/*
	Name: function_bede6f52
	Namespace: doa_textelement
	Checksum: 0x6374F49E
	Offset: 0x920
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_bede6f52(localclientnum, value)
{
	[[ self ]]->function_bede6f52(localclientnum, value);
}

