#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_b58d10b2 : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_b58d10b2
		Checksum: 0xF6507B99
		Offset: 0x720
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
		Checksum: 0xD20CA314
		Offset: 0xC90
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
		Checksum: 0x21FA0BDE
		Offset: 0x8F8
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
		Name: function_2208b8db
		Namespace: namespace_b58d10b2
		Checksum: 0xA1C92449
		Offset: 0xBA0
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
		Namespace: namespace_b58d10b2
		Checksum: 0x8D113850
		Offset: 0xAB0
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
		Namespace: namespace_b58d10b2
		Checksum: 0xF16B23DC
		Offset: 0x940
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
		Namespace: namespace_b58d10b2
		Checksum: 0xE5DDB341
		Offset: 0xA60
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_5dbd7024(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "height", value);
	}

	/*
		Name: function_6416c30d
		Namespace: namespace_b58d10b2
		Checksum: 0x94CFC89C
		Offset: 0xC40
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_6416c30d(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "material", value);
	}

	/*
		Name: function_7420df0a
		Namespace: namespace_b58d10b2
		Checksum: 0x482D38EB
		Offset: 0xBF0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_7420df0a(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "blue", value);
	}

	/*
		Name: function_8b0b5811
		Namespace: namespace_b58d10b2
		Checksum: 0x96F1A05D
		Offset: 0xA10
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_8b0b5811(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "width", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_b58d10b2
		Checksum: 0x91507839
		Offset: 0x740
		Size: 0x1AC
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("LUIelemImage");
		namespace_6aaccc24::function_da693cbe("x", 1, 7, "int");
		namespace_6aaccc24::function_da693cbe("y", 1, 6, "int");
		namespace_6aaccc24::function_da693cbe("width", 1, 6, "int");
		namespace_6aaccc24::function_da693cbe("height", 1, 6, "int");
		namespace_6aaccc24::function_da693cbe("fadeOverTime", 1, 5, "int");
		namespace_6aaccc24::function_da693cbe("alpha", 1, 4, "float");
		namespace_6aaccc24::function_da693cbe("red", 1, 4, "float");
		namespace_6aaccc24::function_da693cbe("green", 1, 4, "float");
		namespace_6aaccc24::function_da693cbe("blue", 1, 4, "float");
		namespace_6aaccc24::function_dcb34c80("material", "material", 1);
	}

	/*
		Name: set_y
		Namespace: namespace_b58d10b2
		Checksum: 0x5B859552
		Offset: 0x9C0
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
		Namespace: namespace_b58d10b2
		Checksum: 0x561639E
		Offset: 0xB00
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
		Namespace: namespace_b58d10b2
		Checksum: 0xA7878C3D
		Offset: 0x970
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_x(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "x", value);
	}

	/*
		Name: function_eccc151d
		Namespace: namespace_b58d10b2
		Checksum: 0x4D89FDD8
		Offset: 0xB50
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_eccc151d(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "red", value);
	}

}

#namespace luielemimage;

/*
	Name: function_f57a0c56
	Namespace: luielemimage
	Checksum: 0x9EB5F86E
	Offset: 0x118
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_f57a0c56()
{
	level notify(2068297687);
}

/*
	Name: set_color
	Namespace: luielemimage
	Checksum: 0x79996B20
	Offset: 0x138
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
	Namespace: luielemimage
	Checksum: 0xF2BC6A92
	Offset: 0x1B0
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
	Namespace: luielemimage
	Checksum: 0x2B4C8131
	Offset: 0x238
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
	Namespace: luielemimage
	Checksum: 0xDC4FB858
	Offset: 0x288
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
	Namespace: luielemimage
	Checksum: 0x8FC88791
	Offset: 0x2D0
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
	Namespace: luielemimage
	Checksum: 0x65C66481
	Offset: 0x328
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
	Namespace: luielemimage
	Checksum: 0xAB5E2967
	Offset: 0x380
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
	Name: function_35f52fe9
	Namespace: luielemimage
	Checksum: 0xF296F452
	Offset: 0x3D8
	Size: 0x8C
	Parameters: 3
	Flags: None
*/
function function_35f52fe9(player, width, height)
{
	self function_8b0b5811(player, int(width / 4));
	self function_5dbd7024(player, int(height / 4));
}

/*
	Name: register
	Namespace: luielemimage
	Checksum: 0x73DEC662
	Offset: 0x470
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_b58d10b2();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: luielemimage
	Checksum: 0x7C75A94C
	Offset: 0x4B0
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
	Namespace: luielemimage
	Checksum: 0xCCC449AE
	Offset: 0x4F0
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
	Checksum: 0x26D82178
	Offset: 0x518
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
	Namespace: luielemimage
	Checksum: 0xD3842C5D
	Offset: 0x540
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
	Namespace: luielemimage
	Checksum: 0x2001DD15
	Offset: 0x570
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_y(player, value)
{
	[[ self ]]->set_y(player, value);
}

/*
	Name: function_8b0b5811
	Namespace: luielemimage
	Checksum: 0x2ED28C09
	Offset: 0x5A0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_8b0b5811(player, value)
{
	[[ self ]]->function_8b0b5811(player, value);
}

/*
	Name: function_5dbd7024
	Namespace: luielemimage
	Checksum: 0x11DDFDF5
	Offset: 0x5D0
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
	Namespace: luielemimage
	Checksum: 0xFB25F7E5
	Offset: 0x600
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
	Namespace: luielemimage
	Checksum: 0x13D43460
	Offset: 0x630
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
	Namespace: luielemimage
	Checksum: 0xCD6839A1
	Offset: 0x660
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
	Namespace: luielemimage
	Checksum: 0x7E853FE7
	Offset: 0x690
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
	Namespace: luielemimage
	Checksum: 0x504CE79
	Offset: 0x6C0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_7420df0a(player, value)
{
	[[ self ]]->function_7420df0a(player, value);
}

/*
	Name: function_6416c30d
	Namespace: luielemimage
	Checksum: 0x21955541
	Offset: 0x6F0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_6416c30d(player, value)
{
	[[ self ]]->function_6416c30d(player, value);
}

