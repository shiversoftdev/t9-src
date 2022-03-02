#using scripts\core_common\lui_shared.csc;

class class_e6e7895b : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_e6e7895b
		Checksum: 0xCB39AE69
		Offset: 0x5B8
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
		Checksum: 0x1800AD65
		Offset: 0xBD8
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
		Checksum: 0x64CF93D3
		Offset: 0x978
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
		Checksum: 0xFC1471EC
		Offset: 0xBA0
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
		Checksum: 0x9EAE093B
		Offset: 0xAF8
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
		Checksum: 0x380800C4
		Offset: 0xA50
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
		Checksum: 0x50AED88C
		Offset: 0x7E0
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
		Checksum: 0xFCBE7350
		Offset: 0xA18
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
		Checksum: 0x4BB35CD
		Offset: 0xB30
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
		Checksum: 0xB23FEB96
		Offset: 0x5D8
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
		Checksum: 0x51A768AF
		Offset: 0x9E0
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
		Checksum: 0xE979E188
		Offset: 0xA88
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
		Checksum: 0x5BD53FC8
		Offset: 0x9A8
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
		Checksum: 0x514FB6BC
		Offset: 0xB68
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
		Checksum: 0x4FF7D1EB
		Offset: 0xAC0
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
		Checksum: 0xE308FB33
		Offset: 0x808
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
	Name: function_6928b1e8
	Namespace: luielemtext
	Checksum: 0x6D3B8365
	Offset: 0x128
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_6928b1e8()
{
	level notify(435270559);
}

/*
	Name: register
	Namespace: luielemtext
	Checksum: 0x7684B2BF
	Offset: 0x148
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
	Checksum: 0xDAF63F64
	Offset: 0x320
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
	Checksum: 0x19478C4E
	Offset: 0x360
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
	Checksum: 0x8A5D6F94
	Offset: 0x388
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
	Checksum: 0x7F38FA4B
	Offset: 0x3B0
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
	Checksum: 0x55093B1F
	Offset: 0x3D8
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
	Checksum: 0xA866CBCD
	Offset: 0x408
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
	Checksum: 0x690919C5
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
	Namespace: luielemtext
	Checksum: 0xCCD835FA
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
	Namespace: luielemtext
	Checksum: 0xB753F236
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
	Namespace: luielemtext
	Checksum: 0xC18B8BE0
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
	Namespace: luielemtext
	Checksum: 0xE52BF041
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
	Namespace: luielemtext
	Checksum: 0xC8145105
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
	Name: function_d5ea17f0
	Namespace: luielemtext
	Checksum: 0xC1F623C1
	Offset: 0x558
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
	Checksum: 0xE13BB230
	Offset: 0x588
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_1bd2bb26(localclientnum, value)
{
	[[ self ]]->function_1bd2bb26(localclientnum, value);
}

