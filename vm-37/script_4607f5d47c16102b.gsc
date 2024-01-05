#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class cluielemimage : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: cluielemimage
		Checksum: 0xEAEF2954
		Offset: 0x700
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
		Checksum: 0x3A625428
		Offset: 0xC70
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
		Checksum: 0x1988739B
		Offset: 0x8D8
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
		Checksum: 0xA1A6E83B
		Offset: 0xB80
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
		Checksum: 0x386BC69E
		Offset: 0xA90
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
		Checksum: 0xE6F8B3FB
		Offset: 0x920
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
		Checksum: 0xD1CB58B1
		Offset: 0xA40
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
		Checksum: 0x9077E81
		Offset: 0xC20
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
		Checksum: 0xB547BB8C
		Offset: 0xBD0
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
		Checksum: 0x6F5EA713
		Offset: 0x9F0
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
		Checksum: 0x6D15CD6F
		Offset: 0x720
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
		Checksum: 0x3EB89B2
		Offset: 0x9A0
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
		Checksum: 0xB870AD12
		Offset: 0xAE0
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
		Checksum: 0x4CC11CA2
		Offset: 0x950
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
		Checksum: 0xA158F5BE
		Offset: 0xB30
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
	Name: set_color
	Namespace: luielemimage
	Checksum: 0xF01BC369
	Offset: 0x118
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
	Checksum: 0x69659581
	Offset: 0x190
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
	Checksum: 0xD97B8671
	Offset: 0x218
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
	Checksum: 0x9AB11771
	Offset: 0x268
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
	Checksum: 0x7CDCEC3F
	Offset: 0x2B0
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
	Checksum: 0x5CF86D94
	Offset: 0x308
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
	Checksum: 0xCFDE7435
	Offset: 0x360
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
	Checksum: 0x53765303
	Offset: 0x3B8
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
	Checksum: 0x295EEA6B
	Offset: 0x450
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
	Checksum: 0x39E7CB30
	Offset: 0x490
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
	Checksum: 0xEB3ACD5A
	Offset: 0x4D0
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
	Checksum: 0x618187BC
	Offset: 0x4F8
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
	Checksum: 0x20DBAFBA
	Offset: 0x520
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
	Checksum: 0x2C64531A
	Offset: 0x550
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
	Checksum: 0x1EE30FDE
	Offset: 0x580
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
	Checksum: 0x56424792
	Offset: 0x5B0
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
	Checksum: 0x82D90760
	Offset: 0x5E0
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
	Checksum: 0xABD16CF6
	Offset: 0x610
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
	Checksum: 0x7729FACA
	Offset: 0x640
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
	Checksum: 0x873B6D1
	Offset: 0x670
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
	Checksum: 0xD7609E7
	Offset: 0x6A0
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
	Checksum: 0x206974CE
	Offset: 0x6D0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_material(player, value)
{
	[[ self ]]->set_material(player, value);
}

