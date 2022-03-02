#using scripts\core_common\lui_shared.csc;

class class_b58d10b2 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_b58d10b2
		Checksum: 0xF8FD9DA9
		Offset: 0x580
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
		Checksum: 0x4455FB23
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
		Namespace: namespace_b58d10b2
		Checksum: 0x238FC31
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
		Namespace: namespace_b58d10b2
		Checksum: 0x4688B5FD
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
		Namespace: namespace_b58d10b2
		Checksum: 0xB7F58C19
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
		Namespace: namespace_b58d10b2
		Checksum: 0xCFDC3E57
		Offset: 0x7A8
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
		Checksum: 0xDA0A2624
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
		Name: function_6416c30d
		Namespace: namespace_b58d10b2
		Checksum: 0x1490757F
		Offset: 0xB70
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
		Checksum: 0x2E317EE3
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
		Namespace: namespace_b58d10b2
		Checksum: 0x46707AD3
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
		Namespace: namespace_b58d10b2
		Checksum: 0x127307B1
		Offset: 0x5A0
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
		Checksum: 0xB686601D
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
		Namespace: namespace_b58d10b2
		Checksum: 0xEEC7D6AA
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
		Namespace: namespace_b58d10b2
		Checksum: 0x9E27D50E
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
		Namespace: namespace_b58d10b2
		Checksum: 0x1498F82B
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
		Namespace: namespace_b58d10b2
		Checksum: 0xD4408A8A
		Offset: 0x7D0
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
	Name: register
	Namespace: luielemimage
	Checksum: 0x206FEB6B
	Offset: 0x110
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
	Checksum: 0xCAD0FAF8
	Offset: 0x2E8
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
	Checksum: 0xFBE41D0
	Offset: 0x328
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
	Checksum: 0x356FF80F
	Offset: 0x350
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
	Checksum: 0xB1B73A57
	Offset: 0x378
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
	Checksum: 0xF55221F9
	Offset: 0x3A0
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
	Checksum: 0xB81A9868
	Offset: 0x3D0
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
	Checksum: 0x56DF7BA
	Offset: 0x400
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
	Checksum: 0x79EABADC
	Offset: 0x430
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
	Checksum: 0xE5EF2C9
	Offset: 0x460
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
	Checksum: 0x4BEDDD41
	Offset: 0x490
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
	Checksum: 0xD621DD14
	Offset: 0x4C0
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
	Checksum: 0xC3AC5426
	Offset: 0x4F0
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
	Checksum: 0xF4AC12DD
	Offset: 0x520
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
	Checksum: 0x6D80A617
	Offset: 0x550
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_6416c30d(localclientnum, value)
{
	[[ self ]]->function_6416c30d(localclientnum, value);
}

