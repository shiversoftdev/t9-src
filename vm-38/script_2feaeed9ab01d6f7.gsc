#using scripts\core_common\lui_shared.csc;

class class_14224618 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_14224618
		Checksum: 0x6087E2FF
		Offset: 0x4F0
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_14224618
		Checksum: 0xC13C2E7B
		Offset: 0x980
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: function_331f9dd
		Namespace: namespace_14224618
		Checksum: 0x5233AF94
		Offset: 0x910
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_331f9dd(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "endAlpha", value);
	}

	/*
		Name: open
		Namespace: namespace_14224618
		Checksum: 0x1E40A403
		Offset: 0x7C8
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function open(localclientnum)
	{
		namespace_6aaccc24::open(localclientnum);
	}

	/*
		Name: function_2208b8db
		Namespace: namespace_14224618
		Checksum: 0x5AFE5DB5
		Offset: 0x830
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
		Namespace: namespace_14224618
		Checksum: 0x8C0150E4
		Offset: 0x8A0
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
		Namespace: namespace_14224618
		Checksum: 0x947C154E
		Offset: 0x688
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("full_screen_black");
	}

	/*
		Name: function_7420df0a
		Namespace: namespace_14224618
		Checksum: 0x67CFE0DE
		Offset: 0x868
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
		Namespace: namespace_14224618
		Checksum: 0xF169FCB6
		Offset: 0x510
		Size: 0x16C
		Parameters: 7
		Flags: Linked
	*/
	function setup_clientfields(var_9350f184, var_788c188f, var_3fb95ac9, var_a3e0a6ce, var_b046940, var_34291db, var_32445b2)
	{
		namespace_6aaccc24::setup_clientfields("full_screen_black");
		namespace_6aaccc24::function_da693cbe("red", 1, 3, "float", var_9350f184);
		namespace_6aaccc24::function_da693cbe("green", 1, 3, "float", var_788c188f);
		namespace_6aaccc24::function_da693cbe("blue", 1, 3, "float", var_3fb95ac9);
		namespace_6aaccc24::function_da693cbe("fadeOverTime", 1, 12, "int", var_a3e0a6ce);
		namespace_6aaccc24::function_da693cbe("startAlpha", 1, 5, "float", var_b046940);
		namespace_6aaccc24::function_da693cbe("endAlpha", 1, 5, "float", var_34291db);
		namespace_6aaccc24::function_da693cbe("drawHUD", 1, 1, "int", var_32445b2);
	}

	/*
		Name: function_9cd54463
		Namespace: namespace_14224618
		Checksum: 0x9862E18D
		Offset: 0x8D8
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_9cd54463(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "startAlpha", value);
	}

	/*
		Name: function_ae1277a0
		Namespace: namespace_14224618
		Checksum: 0x2CFBE81C
		Offset: 0x948
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_ae1277a0(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "drawHUD", value);
	}

	/*
		Name: function_eccc151d
		Namespace: namespace_14224618
		Checksum: 0x6165FBDF
		Offset: 0x7F8
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
		Namespace: namespace_14224618
		Checksum: 0xA0B46827
		Offset: 0x6B0
		Size: 0x110
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
		[[ self ]]->function_d7d2fcce(localclientnum, "red", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "green", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "blue", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "fadeOverTime", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "startAlpha", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "endAlpha", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "drawHUD", 0);
	}

}

#namespace full_screen_black;

/*
	Name: function_67a01b4b
	Namespace: full_screen_black
	Checksum: 0xB40B7DDF
	Offset: 0x108
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_67a01b4b()
{
	level notify(526038684);
}

/*
	Name: register
	Namespace: full_screen_black
	Checksum: 0x44EEAE77
	Offset: 0x128
	Size: 0x1B6
	Parameters: 7
	Flags: Linked
*/
function register(var_9350f184, var_788c188f, var_3fb95ac9, var_a3e0a6ce, var_b046940, var_34291db, var_32445b2)
{
	elem = new class_14224618();
	[[ elem ]]->setup_clientfields(var_9350f184, var_788c188f, var_3fb95ac9, var_a3e0a6ce, var_b046940, var_34291db, var_32445b2);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"full_screen_black"]))
	{
		level.var_ae746e8f[#"full_screen_black"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"full_screen_black"]))
	{
		level.var_ae746e8f[#"full_screen_black"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"full_screen_black"]))
	{
		level.var_ae746e8f[#"full_screen_black"] = array(level.var_ae746e8f[#"full_screen_black"]);
	}
	level.var_ae746e8f[#"full_screen_black"][level.var_ae746e8f[#"full_screen_black"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: full_screen_black
	Checksum: 0x9D65E6BC
	Offset: 0x2E8
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_5c1bb138()
{
	elem = new class_14224618();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: full_screen_black
	Checksum: 0xD3A3A02F
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
	Namespace: full_screen_black
	Checksum: 0xC2853311
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
	Namespace: full_screen_black
	Checksum: 0xB8810DB7
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
	Name: function_eccc151d
	Namespace: full_screen_black
	Checksum: 0x7C92FCC5
	Offset: 0x3A0
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
	Namespace: full_screen_black
	Checksum: 0x2B68F8A6
	Offset: 0x3D0
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
	Namespace: full_screen_black
	Checksum: 0xC96BCD26
	Offset: 0x400
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_7420df0a(localclientnum, value)
{
	[[ self ]]->function_7420df0a(localclientnum, value);
}

/*
	Name: function_237ff433
	Namespace: full_screen_black
	Checksum: 0x113464FF
	Offset: 0x430
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_237ff433(localclientnum, value)
{
	[[ self ]]->function_237ff433(localclientnum, value);
}

/*
	Name: function_9cd54463
	Namespace: full_screen_black
	Checksum: 0x4EF9E405
	Offset: 0x460
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_9cd54463(localclientnum, value)
{
	[[ self ]]->function_9cd54463(localclientnum, value);
}

/*
	Name: function_331f9dd
	Namespace: full_screen_black
	Checksum: 0xB5285A65
	Offset: 0x490
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_331f9dd(localclientnum, value)
{
	[[ self ]]->function_331f9dd(localclientnum, value);
}

/*
	Name: function_ae1277a0
	Namespace: full_screen_black
	Checksum: 0xD61B3E86
	Offset: 0x4C0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_ae1277a0(localclientnum, value)
{
	[[ self ]]->function_ae1277a0(localclientnum, value);
}

