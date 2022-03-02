#using scripts\core_common\lui_shared.csc;

class class_3c805d30 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_3c805d30
		Checksum: 0x6CF30369
		Offset: 0x570
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_3c805d30
		Checksum: 0xE7E7F1EB
		Offset: 0xA00
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_3c805d30
		Checksum: 0x73E6A6BB
		Offset: 0x7A0
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
		Namespace: namespace_3c805d30
		Checksum: 0xB2BDF43F
		Offset: 0x958
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
		Namespace: namespace_3c805d30
		Checksum: 0xE1C9C00E
		Offset: 0x8B0
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
		Namespace: namespace_3c805d30
		Checksum: 0x1857F2CB
		Offset: 0x608
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("LUIelemBar");
	}

	/*
		Name: function_5dbd7024
		Namespace: namespace_3c805d30
		Checksum: 0x5ACED11E
		Offset: 0x878
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_5dbd7024(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "height", value);
	}

	/*
		Name: function_7420df0a
		Namespace: namespace_3c805d30
		Checksum: 0x13D35457
		Offset: 0x990
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
		Namespace: namespace_3c805d30
		Checksum: 0x8DBAA2FD
		Offset: 0x840
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
		Namespace: namespace_3c805d30
		Checksum: 0xC6555FA4
		Offset: 0x590
		Size: 0x6C
		Parameters: 10
		Flags: None
	*/
	function setup_clientfields(var_218de242, var_f6cc2724, var_997793d7, var_fae6c0b5, var_a3e0a6ce, var_af074abc, var_9350f184, var_788c188f, var_3fb95ac9, var_661989d5)
	{
		namespace_6aaccc24::setup_clientfields("LUIelemBar");
	}

	/*
		Name: set_y
		Namespace: namespace_3c805d30
		Checksum: 0x2E46BD7D
		Offset: 0x808
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
		Namespace: namespace_3c805d30
		Checksum: 0xFEC25C59
		Offset: 0x8E8
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
		Namespace: namespace_3c805d30
		Checksum: 0x29D98078
		Offset: 0x7D0
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
		Namespace: namespace_3c805d30
		Checksum: 0x6AADE64C
		Offset: 0x920
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
		Namespace: namespace_3c805d30
		Checksum: 0xE5B912AF
		Offset: 0x630
		Size: 0x164
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
		[[ self ]]->function_d7d2fcce(localclientnum, "bar_percent", 0);
	}

	/*
		Name: function_fd8c13fb
		Namespace: namespace_3c805d30
		Checksum: 0xC9EEA83B
		Offset: 0x9C8
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_fd8c13fb(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "bar_percent", value);
	}

}

#namespace luielembar;

/*
	Name: register
	Namespace: luielembar
	Checksum: 0x9AF4839C
	Offset: 0x100
	Size: 0x1CE
	Parameters: 10
	Flags: None
*/
function register(var_218de242, var_f6cc2724, var_997793d7, var_fae6c0b5, var_a3e0a6ce, var_af074abc, var_9350f184, var_788c188f, var_3fb95ac9, var_661989d5)
{
	elem = new class_3c805d30();
	[[ elem ]]->setup_clientfields(var_218de242, var_f6cc2724, var_997793d7, var_fae6c0b5, var_a3e0a6ce, var_af074abc, var_9350f184, var_788c188f, var_3fb95ac9, var_661989d5);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"luielembar"]))
	{
		level.var_ae746e8f[#"luielembar"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"luielembar"]))
	{
		level.var_ae746e8f[#"luielembar"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"luielembar"]))
	{
		level.var_ae746e8f[#"luielembar"] = array(level.var_ae746e8f[#"luielembar"]);
	}
	level.var_ae746e8f[#"luielembar"][level.var_ae746e8f[#"luielembar"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: luielembar
	Checksum: 0x4ED5276A
	Offset: 0x2D8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_3c805d30();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: luielembar
	Checksum: 0x5D4E59B1
	Offset: 0x318
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
	Namespace: luielembar
	Checksum: 0xFF8E026A
	Offset: 0x340
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
	Namespace: luielembar
	Checksum: 0x3622AE8C
	Offset: 0x368
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
	Namespace: luielembar
	Checksum: 0x464E3DD
	Offset: 0x390
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
	Namespace: luielembar
	Checksum: 0x35678B8D
	Offset: 0x3C0
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
	Namespace: luielembar
	Checksum: 0x3155583B
	Offset: 0x3F0
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
	Namespace: luielembar
	Checksum: 0x41D43E26
	Offset: 0x420
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
	Namespace: luielembar
	Checksum: 0xDFED0A69
	Offset: 0x450
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
	Namespace: luielembar
	Checksum: 0xD5F56FBC
	Offset: 0x480
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
	Namespace: luielembar
	Checksum: 0x3FB2838D
	Offset: 0x4B0
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
	Namespace: luielembar
	Checksum: 0x3F82CC93
	Offset: 0x4E0
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
	Namespace: luielembar
	Checksum: 0xE09FD7AA
	Offset: 0x510
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_7420df0a(localclientnum, value)
{
	[[ self ]]->function_7420df0a(localclientnum, value);
}

/*
	Name: function_fd8c13fb
	Namespace: luielembar
	Checksum: 0x38D32DD
	Offset: 0x540
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_fd8c13fb(localclientnum, value)
{
	[[ self ]]->function_fd8c13fb(localclientnum, value);
}

