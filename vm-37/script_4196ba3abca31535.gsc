#using scripts\core_common\lui_shared.csc;

class class_5e02ffeb : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_5e02ffeb
		Checksum: 0xA2B9B3A1
		Offset: 0x588
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_5e02ffeb
		Checksum: 0xDDABEB8B
		Offset: 0xBA8
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_5e02ffeb
		Checksum: 0xE1990972
		Offset: 0x948
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
		Namespace: namespace_5e02ffeb
		Checksum: 0x90B2A911
		Offset: 0xB00
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
		Namespace: namespace_5e02ffeb
		Checksum: 0x3FFD4E68
		Offset: 0xA58
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
		Namespace: namespace_5e02ffeb
		Checksum: 0xE376E4BF
		Offset: 0x7B0
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("LUIelemBar_ct");
	}

	/*
		Name: function_5dbd7024
		Namespace: namespace_5e02ffeb
		Checksum: 0x2E335C0D
		Offset: 0xA20
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
		Namespace: namespace_5e02ffeb
		Checksum: 0x1CE1756A
		Offset: 0xB38
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
		Namespace: namespace_5e02ffeb
		Checksum: 0x8E3ADE38
		Offset: 0x9E8
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
		Namespace: namespace_5e02ffeb
		Checksum: 0xBEB0952A
		Offset: 0x5A8
		Size: 0x1FC
		Parameters: 10
		Flags: None
	*/
	function setup_clientfields(var_218de242, var_f6cc2724, var_997793d7, var_fae6c0b5, var_a3e0a6ce, var_af074abc, var_9350f184, var_788c188f, var_3fb95ac9, var_661989d5)
	{
		namespace_6aaccc24::setup_clientfields("LUIelemBar_ct");
		namespace_6aaccc24::function_da693cbe("x", 1, 7, "int", var_218de242);
		namespace_6aaccc24::function_da693cbe("y", 1, 6, "int", var_f6cc2724);
		namespace_6aaccc24::function_da693cbe("width", 1, 6, "int", var_997793d7);
		namespace_6aaccc24::function_da693cbe("height", 1, 6, "int", var_fae6c0b5);
		namespace_6aaccc24::function_da693cbe("fadeOverTime", 1, 5, "int", var_a3e0a6ce);
		namespace_6aaccc24::function_da693cbe("alpha", 1, 4, "float", var_af074abc);
		namespace_6aaccc24::function_da693cbe("red", 1, 4, "float", var_9350f184);
		namespace_6aaccc24::function_da693cbe("green", 1, 4, "float", var_788c188f);
		namespace_6aaccc24::function_da693cbe("blue", 1, 4, "float", var_3fb95ac9);
		namespace_6aaccc24::function_da693cbe("bar_percent", 1, 6, "float", var_661989d5);
	}

	/*
		Name: set_y
		Namespace: namespace_5e02ffeb
		Checksum: 0xE9BC68AD
		Offset: 0x9B0
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
		Namespace: namespace_5e02ffeb
		Checksum: 0xD177737D
		Offset: 0xA90
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
		Namespace: namespace_5e02ffeb
		Checksum: 0xA61A28C5
		Offset: 0x978
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
		Namespace: namespace_5e02ffeb
		Checksum: 0x7FD0B237
		Offset: 0xAC8
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
		Namespace: namespace_5e02ffeb
		Checksum: 0xCE95CBAA
		Offset: 0x7D8
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
		Namespace: namespace_5e02ffeb
		Checksum: 0xEA1AD274
		Offset: 0xB70
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_fd8c13fb(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "bar_percent", value);
	}

}

#namespace luielembar_ct;

/*
	Name: register
	Namespace: luielembar_ct
	Checksum: 0x203E7B25
	Offset: 0x118
	Size: 0x1CE
	Parameters: 10
	Flags: None
*/
function register(var_218de242, var_f6cc2724, var_997793d7, var_fae6c0b5, var_a3e0a6ce, var_af074abc, var_9350f184, var_788c188f, var_3fb95ac9, var_661989d5)
{
	elem = new class_5e02ffeb();
	[[ elem ]]->setup_clientfields(var_218de242, var_f6cc2724, var_997793d7, var_fae6c0b5, var_a3e0a6ce, var_af074abc, var_9350f184, var_788c188f, var_3fb95ac9, var_661989d5);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"luielembar_ct"]))
	{
		level.var_ae746e8f[#"luielembar_ct"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"luielembar_ct"]))
	{
		level.var_ae746e8f[#"luielembar_ct"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"luielembar_ct"]))
	{
		level.var_ae746e8f[#"luielembar_ct"] = array(level.var_ae746e8f[#"luielembar_ct"]);
	}
	level.var_ae746e8f[#"luielembar_ct"][level.var_ae746e8f[#"luielembar_ct"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: luielembar_ct
	Checksum: 0xCB4E440
	Offset: 0x2F0
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_5e02ffeb();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: luielembar_ct
	Checksum: 0xCDA40AB7
	Offset: 0x330
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
	Namespace: luielembar_ct
	Checksum: 0x1DDC9A54
	Offset: 0x358
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
	Namespace: luielembar_ct
	Checksum: 0xA12C0C24
	Offset: 0x380
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
	Namespace: luielembar_ct
	Checksum: 0x9F6DDA82
	Offset: 0x3A8
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
	Namespace: luielembar_ct
	Checksum: 0x66652937
	Offset: 0x3D8
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
	Namespace: luielembar_ct
	Checksum: 0xFE67FA08
	Offset: 0x408
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
	Namespace: luielembar_ct
	Checksum: 0x1D454E91
	Offset: 0x438
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
	Namespace: luielembar_ct
	Checksum: 0xE86EFC89
	Offset: 0x468
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
	Namespace: luielembar_ct
	Checksum: 0xDEB4E37B
	Offset: 0x498
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
	Namespace: luielembar_ct
	Checksum: 0xA022129
	Offset: 0x4C8
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
	Namespace: luielembar_ct
	Checksum: 0x3E655BC7
	Offset: 0x4F8
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
	Namespace: luielembar_ct
	Checksum: 0x421F6CFA
	Offset: 0x528
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
	Namespace: luielembar_ct
	Checksum: 0xEC53D4C8
	Offset: 0x558
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_fd8c13fb(localclientnum, value)
{
	[[ self ]]->function_fd8c13fb(localclientnum, value);
}

