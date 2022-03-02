#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_b58d10b2 : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_b58d10b2
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
		Namespace: namespace_b58d10b2
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
		Namespace: namespace_b58d10b2
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
		namespace_6aaccc24::function_8b8089ba(player, flags);
	}

	/*
		Name: function_2208b8db
		Namespace: namespace_b58d10b2
		Checksum: 0xA1A6E83B
		Offset: 0xB80
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
		Checksum: 0x386BC69E
		Offset: 0xA90
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
		Checksum: 0xE6F8B3FB
		Offset: 0x920
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
		Checksum: 0xD1CB58B1
		Offset: 0xA40
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
		Checksum: 0x9077E81
		Offset: 0xC20
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
		Checksum: 0xB547BB8C
		Offset: 0xBD0
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
		Checksum: 0x6F5EA713
		Offset: 0x9F0
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
		Checksum: 0x6D15CD6F
		Offset: 0x720
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
		Name: function_aa5c711d
		Namespace: namespace_b58d10b2
		Checksum: 0xB870AD12
		Offset: 0xAE0
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
		Name: function_eccc151d
		Namespace: namespace_b58d10b2
		Checksum: 0xA158F5BE
		Offset: 0xB30
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
	self function_eccc151d(player, red);
	self function_2208b8db(player, green);
	self function_7420df0a(player, blue);
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
	self function_aa5c711d(player, var_1a92607f);
	self function_237ff433(player, int(duration * 10));
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
	self function_8b0b5811(player, int(width / 4));
	self function_5dbd7024(player, int(height / 4));
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
	elem = new class_b58d10b2();
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
	Name: function_8b0b5811
	Namespace: luielemimage
	Checksum: 0x1EE30FDE
	Offset: 0x580
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
	Checksum: 0x56424792
	Offset: 0x5B0
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
	Checksum: 0x82D90760
	Offset: 0x5E0
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
	Checksum: 0xABD16CF6
	Offset: 0x610
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
	Checksum: 0x7729FACA
	Offset: 0x640
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
	Checksum: 0x873B6D1
	Offset: 0x670
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
	Checksum: 0xD7609E7
	Offset: 0x6A0
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
	Checksum: 0x206974CE
	Offset: 0x6D0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_6416c30d(player, value)
{
	[[ self ]]->function_6416c30d(player, value);
}

