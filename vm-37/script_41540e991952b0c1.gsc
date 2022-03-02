#using scripts\core_common\lui_shared.csc;

class class_1bec696c : class_6aaccc24
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
		namespace_6aaccc24::open(localclientnum);
	}

	/*
		Name: function_1bd2bb26
		Namespace: namespace_1bec696c
		Checksum: 0x96502886
		Offset: 0xEC8
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
		Namespace: namespace_1bec696c
		Checksum: 0x69A715B6
		Offset: 0xE20
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
		Namespace: namespace_1bec696c
		Checksum: 0x5B71AA81
		Offset: 0xD78
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
		Namespace: namespace_1bec696c
		Checksum: 0x336721A6
		Offset: 0xAE0
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("DOA_BannerElement");
	}

	/*
		Name: function_5dbd7024
		Namespace: namespace_1bec696c
		Checksum: 0xB39545D4
		Offset: 0xD40
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
		Namespace: namespace_1bec696c
		Checksum: 0x477A7230
		Offset: 0xE58
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
		Namespace: namespace_1bec696c
		Checksum: 0xB1F43820
		Offset: 0x8A8
		Size: 0x22C
		Parameters: 11
		Flags: Linked
	*/
	function setup_clientfields(var_218de242, var_f6cc2724, var_fae6c0b5, var_a3e0a6ce, var_af074abc, var_9350f184, var_788c188f, var_3fb95ac9, var_f5852d69, var_cfabd75c, var_766e2bbb)
	{
		namespace_6aaccc24::setup_clientfields("DOA_BannerElement");
		namespace_6aaccc24::function_da693cbe("x", 1, 7, "int", var_f6cc2724);
		namespace_6aaccc24::function_da693cbe("y", 1, 6, "int", var_fae6c0b5);
		namespace_6aaccc24::function_da693cbe("height", 1, 2, "int", var_a3e0a6ce);
		namespace_6aaccc24::function_da693cbe("fadeOverTime", 1, 5, "int", var_af074abc);
		namespace_6aaccc24::function_da693cbe("alpha", 1, 4, "float", var_9350f184);
		namespace_6aaccc24::function_da693cbe("red", 1, 4, "float", var_788c188f);
		namespace_6aaccc24::function_da693cbe("green", 1, 4, "float", var_3fb95ac9);
		namespace_6aaccc24::function_da693cbe("blue", 1, 4, "float", var_f5852d69);
		namespace_6aaccc24::function_dcb34c80("string", "text", 1);
		namespace_6aaccc24::function_da693cbe("horizontal_alignment", 1, 2, "int", var_cfabd75c);
		namespace_6aaccc24::function_da693cbe("scale", 1, 6, "float", var_766e2bbb);
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
		[[ self ]]->function_d7d2fcce(localclientnum, "y", value);
	}

	/*
		Name: function_aa5c711d
		Namespace: namespace_1bec696c
		Checksum: 0x78BC38BC
		Offset: 0xDB0
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
		Namespace: namespace_1bec696c
		Checksum: 0x67ADECFC
		Offset: 0xF00
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
		Namespace: namespace_1bec696c
		Checksum: 0x36170A57
		Offset: 0xCD0
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
		Namespace: namespace_1bec696c
		Checksum: 0x77B1C12
		Offset: 0xE90
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
		Namespace: namespace_1bec696c
		Checksum: 0x29F02181
		Offset: 0xDE8
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
		Namespace: namespace_1bec696c
		Checksum: 0x6349B0B6
		Offset: 0xB08
		Size: 0x18C
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
		[[ self ]]->function_d7d2fcce(localclientnum, "scale", 0);
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
	self function_eccc151d(localclientnum, red);
	self function_2208b8db(localclientnum, green);
	self function_7420df0a(localclientnum, blue);
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
	self function_aa5c711d(localclientnum, var_1a92607f);
	self function_237ff433(localclientnum, int(duration * 10));
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
function register(var_218de242, var_f6cc2724, var_fae6c0b5, var_a3e0a6ce, var_af074abc, var_9350f184, var_788c188f, var_3fb95ac9, var_f5852d69, var_cfabd75c, var_766e2bbb)
{
	elem = new class_1bec696c();
	[[ elem ]]->setup_clientfields(var_218de242, var_f6cc2724, var_fae6c0b5, var_a3e0a6ce, var_af074abc, var_9350f184, var_788c188f, var_3fb95ac9, var_f5852d69, var_cfabd75c, var_766e2bbb);
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
	Name: function_5c1bb138
	Namespace: doa_bannerelement
	Checksum: 0x93651F57
	Offset: 0x5C0
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_5c1bb138()
{
	elem = new class_1bec696c();
	[[ elem ]]->function_5c1bb138();
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
	Name: function_5dbd7024
	Namespace: doa_bannerelement
	Checksum: 0x73EF929F
	Offset: 0x6D8
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
	Namespace: doa_bannerelement
	Checksum: 0xD987B571
	Offset: 0x708
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
	Namespace: doa_bannerelement
	Checksum: 0x54CBC48
	Offset: 0x738
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
	Namespace: doa_bannerelement
	Checksum: 0xCCCA0D2A
	Offset: 0x768
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
	Namespace: doa_bannerelement
	Checksum: 0x6903396E
	Offset: 0x798
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
	Namespace: doa_bannerelement
	Checksum: 0x17C47D6D
	Offset: 0x7C8
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
	Namespace: doa_bannerelement
	Checksum: 0x97B90AE5
	Offset: 0x7F8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_d5ea17f0(localclientnum, value)
{
	[[ self ]]->function_d5ea17f0(localclientnum, value);
}

/*
	Name: function_1bd2bb26
	Namespace: doa_bannerelement
	Checksum: 0x65715E03
	Offset: 0x828
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_1bd2bb26(localclientnum, value)
{
	[[ self ]]->function_1bd2bb26(localclientnum, value);
}

/*
	Name: function_bede6f52
	Namespace: doa_bannerelement
	Checksum: 0x51DBCC48
	Offset: 0x858
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_bede6f52(localclientnum, value)
{
	[[ self ]]->function_bede6f52(localclientnum, value);
}

