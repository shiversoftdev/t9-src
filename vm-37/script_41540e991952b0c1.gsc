#using scripts\core_common\lui_shared.csc;

class class_1bec696c : cluielem
{

	/*
		Name: constructor
		Namespace: namespace_1bec696c
		Checksum: 0x2F2D8A75
		Offset: 0x888
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_1bec696c
		Checksum: 0xEAB73634
		Offset: 0xF38
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_1bec696c
		Checksum: 0x4124F548
		Offset: 0xCA0
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function open(localclientnum)
	{
		cluielem::open(localclientnum);
	}

	/*
		Name: set_horizontal_alignment
		Namespace: namespace_1bec696c
		Checksum: 0x96502886
		Offset: 0xEC8
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
		Namespace: namespace_1bec696c
		Checksum: 0x69A715B6
		Offset: 0xE20
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
		Namespace: namespace_1bec696c
		Checksum: 0x5B71AA81
		Offset: 0xD78
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
		Namespace: namespace_1bec696c
		Checksum: 0x336721A6
		Offset: 0xAE0
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function register_clientside()
	{
		cluielem::register_clientside("DOA_BannerElement");
	}

	/*
		Name: set_height
		Namespace: namespace_1bec696c
		Checksum: 0xB39545D4
		Offset: 0xD40
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
		Namespace: namespace_1bec696c
		Checksum: 0x477A7230
		Offset: 0xE58
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
		Namespace: namespace_1bec696c
		Checksum: 0xB1F43820
		Offset: 0x8A8
		Size: 0x22C
		Parameters: 11
		Flags: Linked
	*/
	function setup_clientfields(xcallback, ycallback, heightcallback, fadeovertimecallback, alphacallback, redcallback, greencallback, bluecallback, var_f5852d69, horizontal_alignmentcallback, var_766e2bbb)
	{
		cluielem::setup_clientfields("DOA_BannerElement");
		cluielem::add_clientfield("x", 1, 7, "int", ycallback);
		cluielem::add_clientfield("y", 1, 6, "int", heightcallback);
		cluielem::add_clientfield("height", 1, 2, "int", fadeovertimecallback);
		cluielem::add_clientfield("fadeOverTime", 1, 5, "int", alphacallback);
		cluielem::add_clientfield("alpha", 1, 4, "float", redcallback);
		cluielem::add_clientfield("red", 1, 4, "float", greencallback);
		cluielem::add_clientfield("green", 1, 4, "float", bluecallback);
		cluielem::add_clientfield("blue", 1, 4, "float", var_f5852d69);
		cluielem::function_dcb34c80("string", "text", 1);
		cluielem::add_clientfield("horizontal_alignment", 1, 2, "int", horizontal_alignmentcallback);
		cluielem::add_clientfield("scale", 1, 6, "float", var_766e2bbb);
	}

	/*
		Name: set_y
		Namespace: namespace_1bec696c
		Checksum: 0xC1DB8A75
		Offset: 0xD08
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_y(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "y", value);
	}

	/*
		Name: set_alpha
		Namespace: namespace_1bec696c
		Checksum: 0x78BC38BC
		Offset: 0xDB0
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
		Namespace: namespace_1bec696c
		Checksum: 0x67ADECFC
		Offset: 0xF00
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
		Namespace: namespace_1bec696c
		Checksum: 0x36170A57
		Offset: 0xCD0
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
		Namespace: namespace_1bec696c
		Checksum: 0x77B1C12
		Offset: 0xE90
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
		Namespace: namespace_1bec696c
		Checksum: 0x29F02181
		Offset: 0xDE8
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
		Namespace: namespace_1bec696c
		Checksum: 0x6349B0B6
		Offset: 0xB08
		Size: 0x18C
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
		[[ self ]]->set_data(localclientnum, "scale", 0);
	}

}

#namespace doa_bannerelement;

/*
	Name: set_color
	Namespace: doa_bannerelement
	Checksum: 0x41063064
	Offset: 0x138
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
	Namespace: doa_bannerelement
	Checksum: 0xDFAE0FEA
	Offset: 0x1B0
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
	Namespace: doa_bannerelement
	Checksum: 0x57F92A64
	Offset: 0x238
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
	Namespace: doa_bannerelement
	Checksum: 0x15527083
	Offset: 0x288
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
	Namespace: doa_bannerelement
	Checksum: 0x242A6AF6
	Offset: 0x2D0
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
	Namespace: doa_bannerelement
	Checksum: 0x531B9CBB
	Offset: 0x328
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
	Namespace: doa_bannerelement
	Checksum: 0xE41ABCCB
	Offset: 0x380
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
	Name: register
	Namespace: doa_bannerelement
	Checksum: 0x8CD6B38E
	Offset: 0x3D8
	Size: 0x1DE
	Parameters: 11
	Flags: None
*/
function register(xcallback, ycallback, heightcallback, fadeovertimecallback, alphacallback, redcallback, greencallback, bluecallback, var_f5852d69, horizontal_alignmentcallback, var_766e2bbb)
{
	elem = new class_1bec696c();
	[[ elem ]]->setup_clientfields(xcallback, ycallback, heightcallback, fadeovertimecallback, alphacallback, redcallback, greencallback, bluecallback, var_f5852d69, horizontal_alignmentcallback, var_766e2bbb);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"doa_bannerelement"]))
	{
		level.var_ae746e8f[#"doa_bannerelement"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"doa_bannerelement"]))
	{
		level.var_ae746e8f[#"doa_bannerelement"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"doa_bannerelement"]))
	{
		level.var_ae746e8f[#"doa_bannerelement"] = array(level.var_ae746e8f[#"doa_bannerelement"]);
	}
	level.var_ae746e8f[#"doa_bannerelement"][level.var_ae746e8f[#"doa_bannerelement"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: doa_bannerelement
	Checksum: 0x93651F57
	Offset: 0x5C0
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function register_clientside()
{
	elem = new class_1bec696c();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: doa_bannerelement
	Checksum: 0xE49B5646
	Offset: 0x600
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
	Namespace: doa_bannerelement
	Checksum: 0x9E1CE301
	Offset: 0x628
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
	Namespace: doa_bannerelement
	Checksum: 0xEF10EB90
	Offset: 0x650
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
	Namespace: doa_bannerelement
	Checksum: 0x9C6B64E4
	Offset: 0x678
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
	Namespace: doa_bannerelement
	Checksum: 0xB80B87F8
	Offset: 0x6A8
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
	Namespace: doa_bannerelement
	Checksum: 0x73EF929F
	Offset: 0x6D8
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
	Namespace: doa_bannerelement
	Checksum: 0xD987B571
	Offset: 0x708
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
	Namespace: doa_bannerelement
	Checksum: 0x54CBC48
	Offset: 0x738
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
	Namespace: doa_bannerelement
	Checksum: 0xCCCA0D2A
	Offset: 0x768
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
	Namespace: doa_bannerelement
	Checksum: 0x6903396E
	Offset: 0x798
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
	Namespace: doa_bannerelement
	Checksum: 0x17C47D6D
	Offset: 0x7C8
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
	Namespace: doa_bannerelement
	Checksum: 0x97B90AE5
	Offset: 0x7F8
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
	Namespace: doa_bannerelement
	Checksum: 0x65715E03
	Offset: 0x828
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_horizontal_alignment(localclientnum, value)
{
	[[ self ]]->set_horizontal_alignment(localclientnum, value);
}

/*
	Name: set_scale
	Namespace: doa_bannerelement
	Checksum: 0x51DBCC48
	Offset: 0x858
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_scale(localclientnum, value)
{
	[[ self ]]->set_scale(localclientnum, value);
}

