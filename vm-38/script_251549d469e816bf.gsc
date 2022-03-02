#using scripts\core_common\lui_shared.csc;

class class_b58d10b2 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_b58d10b2
		Checksum: 0xE584B148
		Offset: 0x5A0
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_b58d10b2
		Checksum: 0x4BCEB41C
		Offset: 0xBC8
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_b58d10b2
		Checksum: 0x38DC5A7A
		Offset: 0x968
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		namespace_6aaccc24::open(localclientnum);
	}

	/*
		Name: function_2208b8db
		Namespace: namespace_b58d10b2
		Checksum: 0x6E7DFEDA
		Offset: 0xB20
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_2208b8db(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "green", value);
	}

	/*
		Name: function_237ff433
		Namespace: namespace_b58d10b2
		Checksum: 0xB4854575
		Offset: 0xA78
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_237ff433(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "fadeOverTime", value);
	}

	/*
		Name: function_5c1bb138
		Namespace: namespace_b58d10b2
		Checksum: 0xADB2BEE4
		Offset: 0x7C8
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("LUIelemImage");
	}

	/*
		Name: function_5dbd7024
		Namespace: namespace_b58d10b2
		Checksum: 0x4C1520A5
		Offset: 0xA40
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_5dbd7024(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "height", value);
	}

	/*
		Name: function_6416c30d
		Namespace: namespace_b58d10b2
		Checksum: 0x4F485175
		Offset: 0xB90
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_6416c30d(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "material", value);
	}

	/*
		Name: function_7420df0a
		Namespace: namespace_b58d10b2
		Checksum: 0x364D6F57
		Offset: 0xB58
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_7420df0a(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "blue", value);
	}

	/*
		Name: function_8b0b5811
		Namespace: namespace_b58d10b2
		Checksum: 0x4255DEFF
		Offset: 0xA08
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_8b0b5811(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "width", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_b58d10b2
		Checksum: 0x9125D2EA
		Offset: 0x5C0
		Size: 0x1FC
		Parameters: 10
		Flags: None
	*/
	function setup_clientfields(var_218de242, var_f6cc2724, var_997793d7, var_fae6c0b5, var_a3e0a6ce, var_af074abc, var_9350f184, var_788c188f, var_3fb95ac9, var_e6b6b84b)
	{
		namespace_6aaccc24::setup_clientfields("LUIelemImage");
		namespace_6aaccc24::function_da693cbe("x", 1, 7, "int", var_f6cc2724);
		namespace_6aaccc24::function_da693cbe("y", 1, 6, "int", var_997793d7);
		namespace_6aaccc24::function_da693cbe("width", 1, 6, "int", var_fae6c0b5);
		namespace_6aaccc24::function_da693cbe("height", 1, 6, "int", var_a3e0a6ce);
		namespace_6aaccc24::function_da693cbe("fadeOverTime", 1, 5, "int", var_af074abc);
		namespace_6aaccc24::function_da693cbe("alpha", 1, 4, "float", var_9350f184);
		namespace_6aaccc24::function_da693cbe("red", 1, 4, "float", var_788c188f);
		namespace_6aaccc24::function_da693cbe("green", 1, 4, "float", var_3fb95ac9);
		namespace_6aaccc24::function_da693cbe("blue", 1, 4, "float", var_e6b6b84b);
		namespace_6aaccc24::function_dcb34c80("material", "material", 1);
	}

	/*
		Name: set_y
		Namespace: namespace_b58d10b2
		Checksum: 0x49EFC37F
		Offset: 0x9D0
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_y(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "y", value);
	}

	/*
		Name: function_aa5c711d
		Namespace: namespace_b58d10b2
		Checksum: 0xFAB89AF
		Offset: 0xAB0
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_aa5c711d(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "alpha", value);
	}

	/*
		Name: set_x
		Namespace: namespace_b58d10b2
		Checksum: 0x769C5B64
		Offset: 0x998
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_x(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "x", value);
	}

	/*
		Name: function_eccc151d
		Namespace: namespace_b58d10b2
		Checksum: 0xABF13E53
		Offset: 0xAE8
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_eccc151d(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "red", value);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_b58d10b2
		Checksum: 0x37C59C31
		Offset: 0x7F0
		Size: 0x16C
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
		[[ self ]]->function_d7d2fcce(localclientnum, "x", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "y", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "width", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "height", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "fadeOverTime", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "alpha", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "red", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "green", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "blue", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "material", #"");
	}

}

#namespace luielemimage;

/*
	Name: function_17117bd2
	Namespace: luielemimage
	Checksum: 0xF60A63D3
	Offset: 0x110
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_17117bd2()
{
	level notify(1283685884);
}

/*
	Name: register
	Namespace: luielemimage
	Checksum: 0x5B81AD06
	Offset: 0x130
	Size: 0x1CE
	Parameters: 10
	Flags: None
*/
function register(var_218de242, var_f6cc2724, var_997793d7, var_fae6c0b5, var_a3e0a6ce, var_af074abc, var_9350f184, var_788c188f, var_3fb95ac9, var_e6b6b84b)
{
	elem = new class_b58d10b2();
	[[ elem ]]->setup_clientfields(var_218de242, var_f6cc2724, var_997793d7, var_fae6c0b5, var_a3e0a6ce, var_af074abc, var_9350f184, var_788c188f, var_3fb95ac9, var_e6b6b84b);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"luielemimage"]))
	{
		level.var_ae746e8f[#"luielemimage"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"luielemimage"]))
	{
		level.var_ae746e8f[#"luielemimage"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"luielemimage"]))
	{
		level.var_ae746e8f[#"luielemimage"] = array(level.var_ae746e8f[#"luielemimage"]);
	}
	level.var_ae746e8f[#"luielemimage"][level.var_ae746e8f[#"luielemimage"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: luielemimage
	Checksum: 0xB5A703A3
	Offset: 0x308
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_b58d10b2();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: luielemimage
	Checksum: 0x4281783D
	Offset: 0x348
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
	Namespace: luielemimage
	Checksum: 0xD3BDF75D
	Offset: 0x370
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
	Namespace: luielemimage
	Checksum: 0xC950B86E
	Offset: 0x398
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
	Namespace: luielemimage
	Checksum: 0xA6D3B518
	Offset: 0x3C0
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
	Namespace: luielemimage
	Checksum: 0x29D46422
	Offset: 0x3F0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_y(localclientnum, value)
{
	[[ self ]]->set_y(localclientnum, value);
}

/*
	Name: function_8b0b5811
	Namespace: luielemimage
	Checksum: 0xDD11AD48
	Offset: 0x420
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_8b0b5811(localclientnum, value)
{
	[[ self ]]->function_8b0b5811(localclientnum, value);
}

/*
	Name: function_5dbd7024
	Namespace: luielemimage
	Checksum: 0xE6BA06B7
	Offset: 0x450
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
	Namespace: luielemimage
	Checksum: 0xA66DFAA9
	Offset: 0x480
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_237ff433(localclientnum, value)
{
	[[ self ]]->function_237ff433(localclientnum, value);
}

/*
	Name: function_aa5c711d
	Namespace: luielemimage
	Checksum: 0xDDD1E13C
	Offset: 0x4B0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_aa5c711d(localclientnum, value)
{
	[[ self ]]->function_aa5c711d(localclientnum, value);
}

/*
	Name: function_eccc151d
	Namespace: luielemimage
	Checksum: 0x1938C932
	Offset: 0x4E0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_eccc151d(localclientnum, value)
{
	[[ self ]]->function_eccc151d(localclientnum, value);
}

/*
	Name: function_2208b8db
	Namespace: luielemimage
	Checksum: 0x505BBF9
	Offset: 0x510
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_2208b8db(localclientnum, value)
{
	[[ self ]]->function_2208b8db(localclientnum, value);
}

/*
	Name: function_7420df0a
	Namespace: luielemimage
	Checksum: 0x8AACFA5E
	Offset: 0x540
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_7420df0a(localclientnum, value)
{
	[[ self ]]->function_7420df0a(localclientnum, value);
}

/*
	Name: function_6416c30d
	Namespace: luielemimage
	Checksum: 0xAB463992
	Offset: 0x570
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_6416c30d(localclientnum, value)
{
	[[ self ]]->function_6416c30d(localclientnum, value);
}

