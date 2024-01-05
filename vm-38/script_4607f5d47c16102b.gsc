#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class cluielemimage : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: cluielemimage
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
		Namespace: cluielemimage
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
		Namespace: cluielemimage
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
		cluielem::open_luielem(player, flags);
	}

	/*
		Name: set_green
		Namespace: cluielemimage
		Checksum: 0xA1C92449
		Offset: 0xBA0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_green(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "green", value);
	}

	/*
		Name: set_fadeovertime
		Namespace: cluielemimage
		Checksum: 0x8D113850
		Offset: 0xAB0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_fadeovertime(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "fadeOverTime", value);
	}

	/*
		Name: close
		Namespace: cluielemimage
		Checksum: 0xF16B23DC
		Offset: 0x940
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function close(player)
	{
		cluielem::close_luielem(player);
	}

	/*
		Name: set_height
		Namespace: cluielemimage
		Checksum: 0xE5DDB341
		Offset: 0xA60
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_height(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "height", value);
	}

	/*
		Name: set_material
		Namespace: cluielemimage
		Checksum: 0x94CFC89C
		Offset: 0xC40
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_material(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "material", value);
	}

	/*
		Name: set_blue
		Namespace: cluielemimage
		Checksum: 0x482D38EB
		Offset: 0xBF0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_blue(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "blue", value);
	}

	/*
		Name: set_width
		Namespace: cluielemimage
		Checksum: 0x96F1A05D
		Offset: 0xA10
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_width(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "width", value);
	}

	/*
		Name: setup_clientfields
		Namespace: cluielemimage
		Checksum: 0x91507839
		Offset: 0x740
		Size: 0x1AC
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("LUIelemImage");
		cluielem::add_clientfield("x", 1, 7, "int");
		cluielem::add_clientfield("y", 1, 6, "int");
		cluielem::add_clientfield("width", 1, 6, "int");
		cluielem::add_clientfield("height", 1, 6, "int");
		cluielem::add_clientfield("fadeOverTime", 1, 5, "int");
		cluielem::add_clientfield("alpha", 1, 4, "float");
		cluielem::add_clientfield("red", 1, 4, "float");
		cluielem::add_clientfield("green", 1, 4, "float");
		cluielem::add_clientfield("blue", 1, 4, "float");
		cluielem::function_dcb34c80("material", "material", 1);
	}

	/*
		Name: set_y
		Namespace: cluielemimage
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
		Name: set_alpha
		Namespace: cluielemimage
		Checksum: 0x561639E
		Offset: 0xB00
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_alpha(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "alpha", value);
	}

	/*
		Name: set_x
		Namespace: cluielemimage
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
		Name: set_red
		Namespace: cluielemimage
		Checksum: 0x4D89FDD8
		Offset: 0xB50
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_red(player, value)
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
	level notify(-2068297687);
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
	self set_red(player, red);
	self set_green(player, green);
	self set_blue(player, blue);
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
	self set_alpha(player, var_1a92607f);
	self set_fadeovertime(player, int(duration * 10));
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
	self set_width(player, int(width / 4));
	self set_height(player, int(height / 4));
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
	elem = new cluielemimage();
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
	Name: set_width
	Namespace: luielemimage
	Checksum: 0x2ED28C09
	Offset: 0x5A0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_width(player, value)
{
	[[ self ]]->set_width(player, value);
}

/*
	Name: set_height
	Namespace: luielemimage
	Checksum: 0x11DDFDF5
	Offset: 0x5D0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_height(player, value)
{
	[[ self ]]->set_height(player, value);
}

/*
	Name: set_fadeovertime
	Namespace: luielemimage
	Checksum: 0xFB25F7E5
	Offset: 0x600
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_fadeovertime(player, value)
{
	[[ self ]]->set_fadeovertime(player, value);
}

/*
	Name: set_alpha
	Namespace: luielemimage
	Checksum: 0x13D43460
	Offset: 0x630
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_alpha(player, value)
{
	[[ self ]]->set_alpha(player, value);
}

/*
	Name: set_red
	Namespace: luielemimage
	Checksum: 0xCD6839A1
	Offset: 0x660
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_red(player, value)
{
	[[ self ]]->set_red(player, value);
}

/*
	Name: set_green
	Namespace: luielemimage
	Checksum: 0x7E853FE7
	Offset: 0x690
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_green(player, value)
{
	[[ self ]]->set_green(player, value);
}

/*
	Name: set_blue
	Namespace: luielemimage
	Checksum: 0x504CE79
	Offset: 0x6C0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_blue(player, value)
{
	[[ self ]]->set_blue(player, value);
}

/*
	Name: set_material
	Namespace: luielemimage
	Checksum: 0x21955541
	Offset: 0x6F0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_material(player, value)
{
	[[ self ]]->set_material(player, value);
}

