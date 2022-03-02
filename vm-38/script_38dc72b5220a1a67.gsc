#using scripts\core_common\lui_shared.csc;

class class_3c805d30 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_3c805d30
		Checksum: 0xD8E5C724
		Offset: 0x590
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_3c805d30
		Checksum: 0xC042D9F2
		Offset: 0xA20
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_3c805d30
		Checksum: 0xAE2B0646
		Offset: 0x7C0
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
		Namespace: namespace_3c805d30
		Checksum: 0x6D0C127A
		Offset: 0x978
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
		Namespace: namespace_3c805d30
		Checksum: 0x67F1A247
		Offset: 0x8D0
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
		Namespace: namespace_3c805d30
		Checksum: 0x60F1FD00
		Offset: 0x628
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("LUIelemBar");
	}

	/*
		Name: function_5dbd7024
		Namespace: namespace_3c805d30
		Checksum: 0x13722FFE
		Offset: 0x898
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
		Namespace: namespace_3c805d30
		Checksum: 0xA2F233AF
		Offset: 0x9B0
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_7420df0a(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "blue", value);
	}

	/*
		Name: function_8b0b5811
		Namespace: namespace_3c805d30
		Checksum: 0x356CA015
		Offset: 0x860
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_8b0b5811(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "width", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_3c805d30
		Checksum: 0xD07E9EB0
		Offset: 0x5B0
		Size: 0x6C
		Parameters: 10
		Flags: Linked
	*/
	function setup_clientfields(var_218de242, var_f6cc2724, var_997793d7, var_fae6c0b5, var_a3e0a6ce, var_af074abc, var_9350f184, var_788c188f, var_3fb95ac9, var_661989d5)
	{
		namespace_6aaccc24::setup_clientfields("LUIelemBar");
	}

	/*
		Name: set_y
		Namespace: namespace_3c805d30
		Checksum: 0xC93E1698
		Offset: 0x828
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
		Namespace: namespace_3c805d30
		Checksum: 0x37D0EF76
		Offset: 0x908
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_aa5c711d(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "alpha", value);
	}

	/*
		Name: set_x
		Namespace: namespace_3c805d30
		Checksum: 0x6C2C7953
		Offset: 0x7F0
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_x(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "x", value);
	}

	/*
		Name: function_eccc151d
		Namespace: namespace_3c805d30
		Checksum: 0x70726BCF
		Offset: 0x940
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
		Namespace: namespace_3c805d30
		Checksum: 0x93C5FF45
		Offset: 0x650
		Size: 0x164
		Parameters: 1
		Flags: Linked
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
		Checksum: 0xA48B91F
		Offset: 0x9E8
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_fd8c13fb(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "bar_percent", value);
	}

}

#namespace luielembar;

/*
	Name: function_d54d6baa
	Namespace: luielembar
	Checksum: 0xF0CCC36E
	Offset: 0x100
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_d54d6baa()
{
	level notify(860478694);
}

/*
	Name: register
	Namespace: luielembar
	Checksum: 0x1911AB96
	Offset: 0x120
	Size: 0x1CE
	Parameters: 10
	Flags: Linked
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
	Checksum: 0xF22089BF
	Offset: 0x2F8
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
	Checksum: 0xAF5FBFFF
	Offset: 0x338
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
	Checksum: 0xE8D7C9B4
	Offset: 0x360
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
	Checksum: 0x6BBA3FBC
	Offset: 0x388
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
	Checksum: 0xDB909C57
	Offset: 0x3B0
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
	Checksum: 0x79C008F2
	Offset: 0x3E0
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
	Checksum: 0x7F68A9FD
	Offset: 0x410
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
	Checksum: 0xC7CACECF
	Offset: 0x440
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
	Checksum: 0xF5E41E39
	Offset: 0x470
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
	Checksum: 0x43824B92
	Offset: 0x4A0
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
	Checksum: 0xBAFD4E87
	Offset: 0x4D0
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
	Checksum: 0x48085255
	Offset: 0x500
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
	Checksum: 0x2FB187B3
	Offset: 0x530
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
	Checksum: 0xEE9A1F24
	Offset: 0x560
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_fd8c13fb(localclientnum, value)
{
	[[ self ]]->function_fd8c13fb(localclientnum, value);
}

