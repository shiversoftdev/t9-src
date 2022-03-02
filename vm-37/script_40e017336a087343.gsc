#using scripts\core_common\lui_shared.csc;

class class_e6e7895b : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_e6e7895b
		Checksum: 0xA2B9B3A1
		Offset: 0x598
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_e6e7895b
		Checksum: 0x10A5F210
		Offset: 0xBB8
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_e6e7895b
		Checksum: 0x338F1705
		Offset: 0x958
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		namespace_6aaccc24::open(localclientnum);
	}

	/*
		Name: function_1bd2bb26
		Namespace: namespace_e6e7895b
		Checksum: 0x50FB04A
		Offset: 0xB80
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_1bd2bb26(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "horizontal_alignment", value);
	}

	/*
		Name: function_2208b8db
		Namespace: namespace_e6e7895b
		Checksum: 0x27B68992
		Offset: 0xAD8
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
		Namespace: namespace_e6e7895b
		Checksum: 0x771C9EB9
		Offset: 0xA30
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
		Namespace: namespace_e6e7895b
		Checksum: 0x473B868A
		Offset: 0x7C0
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("LUIelemText");
	}

	/*
		Name: function_5dbd7024
		Namespace: namespace_e6e7895b
		Checksum: 0xD4C9CF7F
		Offset: 0x9F8
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
		Namespace: namespace_e6e7895b
		Checksum: 0xF812D84
		Offset: 0xB10
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_7420df0a(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "blue", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_e6e7895b
		Checksum: 0x90909E7E
		Offset: 0x5B8
		Size: 0x1FC
		Parameters: 10
		Flags: None
	*/
	function setup_clientfields(var_218de242, var_f6cc2724, var_fae6c0b5, var_a3e0a6ce, var_af074abc, var_9350f184, var_788c188f, var_3fb95ac9, var_f5852d69, var_cfabd75c)
	{
		namespace_6aaccc24::setup_clientfields("LUIelemText");
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
	}

	/*
		Name: set_y
		Namespace: namespace_e6e7895b
		Checksum: 0x9E8BDD23
		Offset: 0x9C0
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
		Namespace: namespace_e6e7895b
		Checksum: 0xC355902C
		Offset: 0xA68
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
		Namespace: namespace_e6e7895b
		Checksum: 0xDF9DBEBB
		Offset: 0x988
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_x(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "x", value);
	}

	/*
		Name: function_d5ea17f0
		Namespace: namespace_e6e7895b
		Checksum: 0x5977415C
		Offset: 0xB48
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_d5ea17f0(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "text", value);
	}

	/*
		Name: function_eccc151d
		Namespace: namespace_e6e7895b
		Checksum: 0xEC9252C5
		Offset: 0xAA0
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
		Namespace: namespace_e6e7895b
		Checksum: 0x9D088C61
		Offset: 0x7E8
		Size: 0x168
		Parameters: 1
		Flags: None
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
	}

}

#namespace luielemtext;

/*
	Name: register
	Namespace: luielemtext
	Checksum: 0x3122E128
	Offset: 0x128
	Size: 0x1CE
	Parameters: 10
	Flags: None
*/
function register(var_218de242, var_f6cc2724, var_fae6c0b5, var_a3e0a6ce, var_af074abc, var_9350f184, var_788c188f, var_3fb95ac9, var_f5852d69, var_cfabd75c)
{
	elem = new class_e6e7895b();
	[[ elem ]]->setup_clientfields(var_218de242, var_f6cc2724, var_fae6c0b5, var_a3e0a6ce, var_af074abc, var_9350f184, var_788c188f, var_3fb95ac9, var_f5852d69, var_cfabd75c);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"luielemtext"]))
	{
		level.var_ae746e8f[#"luielemtext"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"luielemtext"]))
	{
		level.var_ae746e8f[#"luielemtext"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"luielemtext"]))
	{
		level.var_ae746e8f[#"luielemtext"] = array(level.var_ae746e8f[#"luielemtext"]);
	}
	level.var_ae746e8f[#"luielemtext"][level.var_ae746e8f[#"luielemtext"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: luielemtext
	Checksum: 0x4B009C1B
	Offset: 0x300
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_e6e7895b();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: luielemtext
	Checksum: 0xCDA40AB7
	Offset: 0x340
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
	Namespace: luielemtext
	Checksum: 0x1DDC9A54
	Offset: 0x368
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
	Namespace: luielemtext
	Checksum: 0xA12C0C24
	Offset: 0x390
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
	Namespace: luielemtext
	Checksum: 0x9F6DDA82
	Offset: 0x3B8
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
	Namespace: luielemtext
	Checksum: 0x66652937
	Offset: 0x3E8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_y(localclientnum, value)
{
	[[ self ]]->set_y(localclientnum, value);
}

/*
	Name: function_5dbd7024
	Namespace: luielemtext
	Checksum: 0x53EAA7B
	Offset: 0x418
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
	Namespace: luielemtext
	Checksum: 0xDA05953
	Offset: 0x448
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
	Namespace: luielemtext
	Checksum: 0xE372ECC3
	Offset: 0x478
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
	Namespace: luielemtext
	Checksum: 0x6B983027
	Offset: 0x4A8
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
	Namespace: luielemtext
	Checksum: 0x4CEBD72F
	Offset: 0x4D8
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
	Namespace: luielemtext
	Checksum: 0xE66FE21E
	Offset: 0x508
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_7420df0a(localclientnum, value)
{
	[[ self ]]->function_7420df0a(localclientnum, value);
}

/*
	Name: function_d5ea17f0
	Namespace: luielemtext
	Checksum: 0x2E723E60
	Offset: 0x538
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
	Namespace: luielemtext
	Checksum: 0x941F71F4
	Offset: 0x568
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_1bd2bb26(localclientnum, value)
{
	[[ self ]]->function_1bd2bb26(localclientnum, value);
}

