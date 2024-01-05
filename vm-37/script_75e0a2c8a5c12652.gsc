#using scripts\core_common\lui_shared.csc;

class class_df106b1 : cluielem
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
		cluielem::open(localclientnum);
	}

	/*
		Name: set_textpayload
		Namespace: namespace_df106b1
		Checksum: 0x298FF418
		Offset: 0x10A0
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_textpayload(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "textpayload", value);
	}

	/*
		Name: set_horizontal_alignment
		Namespace: namespace_df106b1
		Checksum: 0x1E15FFC4
		Offset: 0x1030
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_horizontal_alignment(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "horizontal_alignment", value);
	}

	/*
		Name: set_green
		Namespace: namespace_df106b1
		Checksum: 0x960137D5
		Offset: 0xF88
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_green(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "green", value);
	}

	/*
		Name: set_fadeovertime
		Namespace: namespace_df106b1
		Checksum: 0x6478955B
		Offset: 0xEE0
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_fadeovertime(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "fadeOverTime", value);
	}

	/*
		Name: register_clientside
		Namespace: namespace_df106b1
		Checksum: 0xB0011558
		Offset: 0xC08
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function register_clientside()
	{
		cluielem::register_clientside("DOA_TextElement");
	}

	/*
		Name: set_height
		Namespace: namespace_df106b1
		Checksum: 0x319C2DBF
		Offset: 0xEA8
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_height(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "height", value);
	}

	/*
		Name: set_blue
		Namespace: namespace_df106b1
		Checksum: 0x70A59DFF
		Offset: 0xFC0
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_blue(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "blue", value);
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
	function setup_clientfields(xcallback, ycallback, heightcallback, fadeovertimecallback, alphacallback, redcallback, greencallback, bluecallback, var_f5852d69, horizontal_alignmentcallback, var_9194fd72, var_3d17213, var_766e2bbb)
	{
		cluielem::setup_clientfields("DOA_TextElement");
		cluielem::add_clientfield("x", 1, 7, "int", heightcallback);
		cluielem::add_clientfield("y", 1, 6, "int", fadeovertimecallback);
		cluielem::add_clientfield("height", 1, 2, "int", alphacallback);
		cluielem::add_clientfield("fadeOverTime", 1, 5, "int", redcallback);
		cluielem::add_clientfield("alpha", 1, 4, "float", greencallback);
		cluielem::add_clientfield("red", 1, 4, "float", bluecallback);
		cluielem::add_clientfield("green", 1, 4, "float", var_f5852d69);
		cluielem::add_clientfield("blue", 1, 4, "float", horizontal_alignmentcallback);
		cluielem::function_dcb34c80("string", "text", 1);
		cluielem::add_clientfield("horizontal_alignment", 1, 2, "int", var_9194fd72);
		cluielem::add_clientfield("intpayload", 1, 32, "int", var_3d17213);
		cluielem::function_dcb34c80("string", "textpayload", 1);
		cluielem::add_clientfield("scale", 1, 5, "float", var_766e2bbb);
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
		[[ self ]]->set_data(localclientnum, "y", value);
	}

	/*
		Name: set_intpayload
		Namespace: namespace_df106b1
		Checksum: 0x788E1426
		Offset: 0x1068
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_intpayload(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "intpayload", value);
	}

	/*
		Name: set_alpha
		Namespace: namespace_df106b1
		Checksum: 0xFBA40452
		Offset: 0xF18
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_alpha(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "alpha", value);
	}

	/*
		Name: set_scale
		Namespace: namespace_df106b1
		Checksum: 0x5336AF33
		Offset: 0x10D8
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_scale(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "scale", value);
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
		[[ self ]]->set_data(localclientnum, "x", value);
	}

	/*
		Name: set_text
		Namespace: namespace_df106b1
		Checksum: 0x40D85968
		Offset: 0xFF8
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_text(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "text", value);
	}

	/*
		Name: set_red
		Namespace: namespace_df106b1
		Checksum: 0x7903FEF8
		Offset: 0xF50
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_red(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "red", value);
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
		cluielem::function_fa582112(localclientnum);
		[[ self ]]->set_data(localclientnum, "x", 0);
		[[ self ]]->set_data(localclientnum, "y", 0);
		[[ self ]]->set_data(localclientnum, "height", 0);
		[[ self ]]->set_data(localclientnum, "fadeOverTime", 0);
		[[ self ]]->set_data(localclientnum, "alpha", 0);
		[[ self ]]->set_data(localclientnum, "red", 0);
		[[ self ]]->set_data(localclientnum, "green", 0);
		[[ self ]]->set_data(localclientnum, "blue", 0);
		[[ self ]]->set_data(localclientnum, "text", #"");
		[[ self ]]->set_data(localclientnum, "horizontal_alignment", 0);
		[[ self ]]->set_data(localclientnum, "intpayload", 0);
		[[ self ]]->set_data(localclientnum, "textpayload", #"");
		[[ self ]]->set_data(localclientnum, "scale", 0);
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
	self set_red(localclientnum, red);
	self set_green(localclientnum, green);
	self set_blue(localclientnum, blue);
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
	self set_alpha(localclientnum, var_1a92607f);
	self set_fadeovertime(localclientnum, int(duration * 10));
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
		self set_text(localclientnum, text);
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
function register(xcallback, ycallback, heightcallback, fadeovertimecallback, alphacallback, redcallback, greencallback, bluecallback, var_f5852d69, horizontal_alignmentcallback, var_9194fd72, var_3d17213, var_766e2bbb)
{
	elem = new class_df106b1();
	[[ elem ]]->setup_clientfields(xcallback, ycallback, heightcallback, fadeovertimecallback, alphacallback, redcallback, greencallback, bluecallback, var_f5852d69, horizontal_alignmentcallback, var_9194fd72, var_3d17213, var_766e2bbb);
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
	Name: register_clientside
	Namespace: doa_textelement
	Checksum: 0x13842D6E
	Offset: 0x628
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function register_clientside()
{
	elem = new class_df106b1();
	[[ elem ]]->register_clientside();
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
	Name: set_height
	Namespace: doa_textelement
	Checksum: 0xD1BC1630
	Offset: 0x740
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_height(localclientnum, value)
{
	[[ self ]]->set_height(localclientnum, value);
}

/*
	Name: set_fadeovertime
	Namespace: doa_textelement
	Checksum: 0xEA48261F
	Offset: 0x770
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_fadeovertime(localclientnum, value)
{
	[[ self ]]->set_fadeovertime(localclientnum, value);
}

/*
	Name: set_alpha
	Namespace: doa_textelement
	Checksum: 0xCF4D0089
	Offset: 0x7A0
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_alpha(localclientnum, value)
{
	[[ self ]]->set_alpha(localclientnum, value);
}

/*
	Name: set_red
	Namespace: doa_textelement
	Checksum: 0xEC9A4F02
	Offset: 0x7D0
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_red(localclientnum, value)
{
	[[ self ]]->set_red(localclientnum, value);
}

/*
	Name: set_green
	Namespace: doa_textelement
	Checksum: 0xC398A6CF
	Offset: 0x800
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_green(localclientnum, value)
{
	[[ self ]]->set_green(localclientnum, value);
}

/*
	Name: set_blue
	Namespace: doa_textelement
	Checksum: 0x58354D8
	Offset: 0x830
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_blue(localclientnum, value)
{
	[[ self ]]->set_blue(localclientnum, value);
}

/*
	Name: set_text
	Namespace: doa_textelement
	Checksum: 0xDB3DA36D
	Offset: 0x860
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_text(localclientnum, value)
{
	[[ self ]]->set_text(localclientnum, value);
}

/*
	Name: set_horizontal_alignment
	Namespace: doa_textelement
	Checksum: 0xE1714DFB
	Offset: 0x890
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_horizontal_alignment(localclientnum, value)
{
	[[ self ]]->set_horizontal_alignment(localclientnum, value);
}

/*
	Name: set_intpayload
	Namespace: doa_textelement
	Checksum: 0x359AA0CD
	Offset: 0x8C0
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_intpayload(localclientnum, value)
{
	[[ self ]]->set_intpayload(localclientnum, value);
}

/*
	Name: set_textpayload
	Namespace: doa_textelement
	Checksum: 0x4903BD1
	Offset: 0x8F0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_textpayload(localclientnum, value)
{
	[[ self ]]->set_textpayload(localclientnum, value);
}

/*
	Name: set_scale
	Namespace: doa_textelement
	Checksum: 0x6374F49E
	Offset: 0x920
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_scale(localclientnum, value)
{
	[[ self ]]->set_scale(localclientnum, value);
}

