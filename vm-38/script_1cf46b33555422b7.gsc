#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_e6e7895b : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_e6e7895b
		Checksum: 0x87603CDD
		Offset: 0x6A0
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
		Checksum: 0x884B5438
		Offset: 0xC10
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
		Checksum: 0x55D7E3F7
		Offset: 0x878
		Size: 0x3C
		Parameters: 2
		Flags: None
	*/
	function open(player, flags)
	{
		if(!isdefined(flags))
		{
			flags = 0;
		}
		namespace_6aaccc24::function_8b8089ba(player, flags);
	}

	/*
		Name: function_1bd2bb26
		Namespace: namespace_e6e7895b
		Checksum: 0x38DF4CB1
		Offset: 0xBC0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_1bd2bb26(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "horizontal_alignment", value);
	}

	/*
		Name: function_2208b8db
		Namespace: namespace_e6e7895b
		Checksum: 0x343668D8
		Offset: 0xAD0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_2208b8db(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "green", value);
	}

	/*
		Name: function_237ff433
		Namespace: namespace_e6e7895b
		Checksum: 0x4FF245BE
		Offset: 0x9E0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_237ff433(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "fadeOverTime", value);
	}

	/*
		Name: close
		Namespace: namespace_e6e7895b
		Checksum: 0xE80149C3
		Offset: 0x8C0
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function close(player)
	{
		namespace_6aaccc24::function_a68f6e20(player);
	}

	/*
		Name: function_5dbd7024
		Namespace: namespace_e6e7895b
		Checksum: 0xFEA80F6F
		Offset: 0x990
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_5dbd7024(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "height", value);
	}

	/*
		Name: function_7420df0a
		Namespace: namespace_e6e7895b
		Checksum: 0x9FC3FB18
		Offset: 0xB20
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_7420df0a(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "blue", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_e6e7895b
		Checksum: 0x20E99400
		Offset: 0x6C0
		Size: 0x1AC
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("LUIelemText");
		namespace_6aaccc24::function_da693cbe("x", 1, 7, "int");
		namespace_6aaccc24::function_da693cbe("y", 1, 6, "int");
		namespace_6aaccc24::function_da693cbe("height", 1, 2, "int");
		namespace_6aaccc24::function_da693cbe("fadeOverTime", 1, 5, "int");
		namespace_6aaccc24::function_da693cbe("alpha", 1, 4, "float");
		namespace_6aaccc24::function_da693cbe("red", 1, 4, "float");
		namespace_6aaccc24::function_da693cbe("green", 1, 4, "float");
		namespace_6aaccc24::function_da693cbe("blue", 1, 4, "float");
		namespace_6aaccc24::function_dcb34c80("string", "text", 1);
		namespace_6aaccc24::function_da693cbe("horizontal_alignment", 1, 2, "int");
	}

	/*
		Name: set_y
		Namespace: namespace_e6e7895b
		Checksum: 0xEBE0EC97
		Offset: 0x940
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_y(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "y", value);
	}

	/*
		Name: function_aa5c711d
		Namespace: namespace_e6e7895b
		Checksum: 0xEA1734FB
		Offset: 0xA30
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_aa5c711d(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "alpha", value);
	}

	/*
		Name: set_x
		Namespace: namespace_e6e7895b
		Checksum: 0x219173DB
		Offset: 0x8F0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_x(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "x", value);
	}

	/*
		Name: function_d5ea17f0
		Namespace: namespace_e6e7895b
		Checksum: 0x98DB450E
		Offset: 0xB70
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_d5ea17f0(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "text", value);
	}

	/*
		Name: function_eccc151d
		Namespace: namespace_e6e7895b
		Checksum: 0x563F342F
		Offset: 0xA80
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_eccc151d(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "red", value);
	}

}

#namespace luielemtext;

/*
	Name: function_e7ec272f
	Namespace: luielemtext
	Checksum: 0x80334AFE
	Offset: 0x130
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_e7ec272f()
{
	level notify(2105572997);
}

/*
	Name: set_color
	Namespace: luielemtext
	Checksum: 0xF7B6C1A1
	Offset: 0x150
	Size: 0x6C
	Parameters: 4
	Flags: None
*/
function set_color(player, red, green, blue)
{
	self function_eccc151d(player, red);
	self function_2208b8db(player, green);
	self function_7420df0a(player, blue);
}

/*
	Name: fade
	Namespace: luielemtext
	Checksum: 0xBBC125AB
	Offset: 0x1C8
	Size: 0x7C
	Parameters: 3
	Flags: None
*/
function fade(player, var_1a92607f, duration)
{
	if(!isdefined(duration))
	{
		duration = 0;
	}
	self function_aa5c711d(player, var_1a92607f);
	self function_237ff433(player, int(duration * 10));
}

/*
	Name: show
	Namespace: luielemtext
	Checksum: 0xD3A9082
	Offset: 0x250
	Size: 0x44
	Parameters: 2
	Flags: None
*/
function show(player, duration)
{
	if(!isdefined(duration))
	{
		duration = 0;
	}
	self fade(player, 1, duration);
}

/*
	Name: hide
	Namespace: luielemtext
	Checksum: 0x62407FB7
	Offset: 0x2A0
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function hide(player, duration)
{
	if(!isdefined(duration))
	{
		duration = 0;
	}
	self fade(player, 0, duration);
}

/*
	Name: function_e5898fd7
	Namespace: luielemtext
	Checksum: 0xCA434655
	Offset: 0x2E8
	Size: 0x4C
	Parameters: 2
	Flags: None
*/
function function_e5898fd7(player, var_c6572d9b)
{
	self set_x(player, int(var_c6572d9b / 15));
}

/*
	Name: function_58a135d3
	Namespace: luielemtext
	Checksum: 0x9E9605BE
	Offset: 0x340
	Size: 0x4C
	Parameters: 2
	Flags: None
*/
function function_58a135d3(player, var_d390c80e)
{
	self set_y(player, int(var_d390c80e / 15));
}

/*
	Name: function_f97e9049
	Namespace: luielemtext
	Checksum: 0x45A9429F
	Offset: 0x398
	Size: 0x4C
	Parameters: 3
	Flags: None
*/
function function_f97e9049(player, var_c6572d9b, var_d390c80e)
{
	self function_e5898fd7(player, var_c6572d9b);
	self function_58a135d3(player, var_d390c80e);
}

/*
	Name: register
	Namespace: luielemtext
	Checksum: 0xF05CAB55
	Offset: 0x3F0
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_e6e7895b();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: luielemtext
	Checksum: 0xF9B0076D
	Offset: 0x430
	Size: 0x38
	Parameters: 2
	Flags: None
*/
function open(player, flags)
{
	if(!isdefined(flags))
	{
		flags = 0;
	}
	[[ self ]]->open(player, flags);
}

/*
	Name: close
	Namespace: luielemtext
	Checksum: 0x40863A4F
	Offset: 0x470
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
	Checksum: 0xA26CD720
	Offset: 0x498
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: set_x
	Namespace: luielemtext
	Checksum: 0x88D53DFE
	Offset: 0x4C0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_x(player, value)
{
	[[ self ]]->set_x(player, value);
}

/*
	Name: set_y
	Namespace: luielemtext
	Checksum: 0xE775AE74
	Offset: 0x4F0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_y(player, value)
{
	[[ self ]]->set_y(player, value);
}

/*
	Name: function_5dbd7024
	Namespace: luielemtext
	Checksum: 0x1E48D99F
	Offset: 0x520
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_5dbd7024(player, value)
{
	[[ self ]]->function_5dbd7024(player, value);
}

/*
	Name: function_237ff433
	Namespace: luielemtext
	Checksum: 0xAD0BEEBA
	Offset: 0x550
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_237ff433(player, value)
{
	[[ self ]]->function_237ff433(player, value);
}

/*
	Name: function_aa5c711d
	Namespace: luielemtext
	Checksum: 0xFCA8968
	Offset: 0x580
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_aa5c711d(player, value)
{
	[[ self ]]->function_aa5c711d(player, value);
}

/*
	Name: function_eccc151d
	Namespace: luielemtext
	Checksum: 0x4D2EC9B3
	Offset: 0x5B0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_eccc151d(player, value)
{
	[[ self ]]->function_eccc151d(player, value);
}

/*
	Name: function_2208b8db
	Namespace: luielemtext
	Checksum: 0x58E2953C
	Offset: 0x5E0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_2208b8db(player, value)
{
	[[ self ]]->function_2208b8db(player, value);
}

/*
	Name: function_7420df0a
	Namespace: luielemtext
	Checksum: 0x511CC388
	Offset: 0x610
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_7420df0a(player, value)
{
	[[ self ]]->function_7420df0a(player, value);
}

/*
	Name: function_d5ea17f0
	Namespace: luielemtext
	Checksum: 0xF29E4E90
	Offset: 0x640
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_d5ea17f0(player, value)
{
	[[ self ]]->function_d5ea17f0(player, value);
}

/*
	Name: function_1bd2bb26
	Namespace: luielemtext
	Checksum: 0x812F32A7
	Offset: 0x670
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_1bd2bb26(player, value)
{
	[[ self ]]->function_1bd2bb26(player, value);
}

