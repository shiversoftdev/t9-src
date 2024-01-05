#using scripts\core_common\lui_shared.csc;

class class_df106b1 : cluielem
{

	/*
		Name: constructor
		Namespace: namespace_df106b1
		Checksum: 0x2CC7B056
		Offset: 0x970
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_df106b1
		Checksum: 0xC75C1851
		Offset: 0x1130
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_df106b1
		Checksum: 0x39E4EF96
		Offset: 0xE28
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		cluielem::open(localclientnum);
	}

	/*
		Name: set_textpayload
		Namespace: namespace_df106b1
		Checksum: 0x245C6EC6
		Offset: 0x10C0
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_textpayload(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "textpayload", value);
	}

	/*
		Name: set_horizontal_alignment
		Namespace: namespace_df106b1
		Checksum: 0xC5D31E39
		Offset: 0x1050
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_horizontal_alignment(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "horizontal_alignment", value);
	}

	/*
		Name: set_green
		Namespace: namespace_df106b1
		Checksum: 0xC5F628A9
		Offset: 0xFA8
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_green(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "green", value);
	}

	/*
		Name: set_fadeovertime
		Namespace: namespace_df106b1
		Checksum: 0x21F7AC51
		Offset: 0xF00
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_fadeovertime(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "fadeOverTime", value);
	}

	/*
		Name: register_clientside
		Namespace: namespace_df106b1
		Checksum: 0x522B0DF0
		Offset: 0xC28
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function register_clientside()
	{
		cluielem::register_clientside("DOA_TextElement");
	}

	/*
		Name: set_height
		Namespace: namespace_df106b1
		Checksum: 0x70BF5E2A
		Offset: 0xEC8
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_height(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "height", value);
	}

	/*
		Name: set_blue
		Namespace: namespace_df106b1
		Checksum: 0x19E2AF80
		Offset: 0xFE0
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_blue(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "blue", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_df106b1
		Checksum: 0xB7169364
		Offset: 0x990
		Size: 0x28C
		Parameters: 13
		Flags: None
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
		Checksum: 0xA4B8CB92
		Offset: 0xE90
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_y(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "y", value);
	}

	/*
		Name: set_intpayload
		Namespace: namespace_df106b1
		Checksum: 0x3840030D
		Offset: 0x1088
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_intpayload(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "intpayload", value);
	}

	/*
		Name: set_alpha
		Namespace: namespace_df106b1
		Checksum: 0xE2BF531A
		Offset: 0xF38
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_alpha(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "alpha", value);
	}

	/*
		Name: set_scale
		Namespace: namespace_df106b1
		Checksum: 0xB8A88D12
		Offset: 0x10F8
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_scale(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "scale", value);
	}

	/*
		Name: set_x
		Namespace: namespace_df106b1
		Checksum: 0x673E00C5
		Offset: 0xE58
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_x(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "x", value);
	}

	/*
		Name: set_text
		Namespace: namespace_df106b1
		Checksum: 0x6BEE85A7
		Offset: 0x1018
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_text(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "text", value);
	}

	/*
		Name: set_red
		Namespace: namespace_df106b1
		Checksum: 0xB5951329
		Offset: 0xF70
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_red(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "red", value);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_df106b1
		Checksum: 0x7DAB2BC
		Offset: 0xC50
		Size: 0x1D0
		Parameters: 1
		Flags: None
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
	Name: function_df088a28
	Namespace: doa_textelement
	Checksum: 0xDED4C050
	Offset: 0x150
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_df088a28()
{
	level notify(393840172);
}

/*
	Name: set_color
	Namespace: doa_textelement
	Checksum: 0xD72FED5
	Offset: 0x170
	Size: 0x6C
	Parameters: 4
	Flags: None
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
	Checksum: 0x921DA7F3
	Offset: 0x1E8
	Size: 0x7C
	Parameters: 3
	Flags: None
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
	Checksum: 0x17B79958
	Offset: 0x270
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
	Checksum: 0xF9D8361D
	Offset: 0x2C0
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
	Checksum: 0xA1D7F8C3
	Offset: 0x308
	Size: 0x4C
	Parameters: 2
	Flags: None
*/
function function_e5898fd7(localclientnum, var_c6572d9b)
{
	self set_x(localclientnum, int(var_c6572d9b / 15));
}

/*
	Name: function_58a135d3
	Namespace: doa_textelement
	Checksum: 0x9064C74E
	Offset: 0x360
	Size: 0x4C
	Parameters: 2
	Flags: None
*/
function function_58a135d3(localclientnum, var_d390c80e)
{
	self set_y(localclientnum, int(var_d390c80e / 15));
}

/*
	Name: function_f97e9049
	Namespace: doa_textelement
	Checksum: 0x3CA4839
	Offset: 0x3B8
	Size: 0x4C
	Parameters: 3
	Flags: None
*/
function function_f97e9049(localclientnum, var_c6572d9b, var_d390c80e)
{
	self function_e5898fd7(localclientnum, var_c6572d9b);
	self function_58a135d3(localclientnum, var_d390c80e);
}

/*
	Name: function_f50d5765
	Namespace: doa_textelement
	Checksum: 0x58ED4A03
	Offset: 0x410
	Size: 0x34
	Parameters: 2
	Flags: None
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
	Checksum: 0xA3084496
	Offset: 0x450
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
	Checksum: 0x73FCF369
	Offset: 0x648
	Size: 0x34
	Parameters: 0
	Flags: None
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
	Checksum: 0x15DE5E06
	Offset: 0x688
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
	Namespace: doa_textelement
	Checksum: 0x5717CF9A
	Offset: 0x6B0
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
	Checksum: 0xCA10754F
	Offset: 0x6D8
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: set_x
	Namespace: doa_textelement
	Checksum: 0xF65674F
	Offset: 0x700
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_x(localclientnum, value)
{
	[[ self ]]->set_x(localclientnum, value);
}

/*
	Name: set_y
	Namespace: doa_textelement
	Checksum: 0xFE27EF6A
	Offset: 0x730
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_y(localclientnum, value)
{
	[[ self ]]->set_y(localclientnum, value);
}

/*
	Name: set_height
	Namespace: doa_textelement
	Checksum: 0x3A03E7E5
	Offset: 0x760
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
	Checksum: 0x83D1381B
	Offset: 0x790
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_fadeovertime(localclientnum, value)
{
	[[ self ]]->set_fadeovertime(localclientnum, value);
}

/*
	Name: set_alpha
	Namespace: doa_textelement
	Checksum: 0xAA84C6B9
	Offset: 0x7C0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_alpha(localclientnum, value)
{
	[[ self ]]->set_alpha(localclientnum, value);
}

/*
	Name: set_red
	Namespace: doa_textelement
	Checksum: 0x37169273
	Offset: 0x7F0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_red(localclientnum, value)
{
	[[ self ]]->set_red(localclientnum, value);
}

/*
	Name: set_green
	Namespace: doa_textelement
	Checksum: 0x42E92527
	Offset: 0x820
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_green(localclientnum, value)
{
	[[ self ]]->set_green(localclientnum, value);
}

/*
	Name: set_blue
	Namespace: doa_textelement
	Checksum: 0x96DB6E37
	Offset: 0x850
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_blue(localclientnum, value)
{
	[[ self ]]->set_blue(localclientnum, value);
}

/*
	Name: set_text
	Namespace: doa_textelement
	Checksum: 0x881A059B
	Offset: 0x880
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_text(localclientnum, value)
{
	[[ self ]]->set_text(localclientnum, value);
}

/*
	Name: set_horizontal_alignment
	Namespace: doa_textelement
	Checksum: 0xB4E9ED61
	Offset: 0x8B0
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
	Checksum: 0xA3C6F438
	Offset: 0x8E0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_intpayload(localclientnum, value)
{
	[[ self ]]->set_intpayload(localclientnum, value);
}

/*
	Name: set_textpayload
	Namespace: doa_textelement
	Checksum: 0x9734ECD6
	Offset: 0x910
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
	Checksum: 0xAC3DFF3E
	Offset: 0x940
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_scale(localclientnum, value)
{
	[[ self ]]->set_scale(localclientnum, value);
}

