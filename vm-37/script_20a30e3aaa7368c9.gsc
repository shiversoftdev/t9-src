#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class cluielembar_ct : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: cluielembar_ct
		Checksum: 0xF7C09A47
		Offset: 0x708
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cluielembar_ct
		Checksum: 0xAD4AC80F
		Offset: 0xC78
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: cluielembar_ct
		Checksum: 0xB31AA7B6
		Offset: 0x8E0
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
		Namespace: cluielembar_ct
		Checksum: 0xD6FBA6E
		Offset: 0xB88
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
		Namespace: cluielembar_ct
		Checksum: 0x81417FC
		Offset: 0xA98
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
		Namespace: cluielembar_ct
		Checksum: 0x28C838F1
		Offset: 0x928
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
		Namespace: cluielembar_ct
		Checksum: 0x8D0C4D8F
		Offset: 0xA48
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_height(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "height", value);
	}

	/*
		Name: set_blue
		Namespace: cluielembar_ct
		Checksum: 0xF44E3106
		Offset: 0xBD8
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
		Namespace: cluielembar_ct
		Checksum: 0xC0BE6C03
		Offset: 0x9F8
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
		Namespace: cluielembar_ct
		Checksum: 0x8FEE669D
		Offset: 0x728
		Size: 0x1AC
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("LUIelemBar_ct");
		cluielem::add_clientfield("x", 1, 7, "int");
		cluielem::add_clientfield("y", 1, 6, "int");
		cluielem::add_clientfield("width", 1, 6, "int");
		cluielem::add_clientfield("height", 1, 6, "int");
		cluielem::add_clientfield("fadeOverTime", 1, 5, "int");
		cluielem::add_clientfield("alpha", 1, 4, "float");
		cluielem::add_clientfield("red", 1, 4, "float");
		cluielem::add_clientfield("green", 1, 4, "float");
		cluielem::add_clientfield("blue", 1, 4, "float");
		cluielem::add_clientfield("bar_percent", 1, 6, "float");
	}

	/*
		Name: set_y
		Namespace: cluielembar_ct
		Checksum: 0x87FC6FD3
		Offset: 0x9A8
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
		Namespace: cluielembar_ct
		Checksum: 0x729D851C
		Offset: 0xAE8
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
		Namespace: cluielembar_ct
		Checksum: 0x99C7559D
		Offset: 0x958
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
		Namespace: cluielembar_ct
		Checksum: 0x7C2BAF5F
		Offset: 0xB38
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_red(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "red", value);
	}

	/*
		Name: set_bar_percent
		Namespace: cluielembar_ct
		Checksum: 0xE39A4AB5
		Offset: 0xC28
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_bar_percent(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "bar_percent", value);
	}

}

#namespace luielembar_ct;

/*
	Name: set_color
	Namespace: luielembar_ct
	Checksum: 0xEED41CB3
	Offset: 0x120
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
	Namespace: luielembar_ct
	Checksum: 0x229B8700
	Offset: 0x198
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
	Namespace: luielembar_ct
	Checksum: 0xD15E9AF8
	Offset: 0x220
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
	Namespace: luielembar_ct
	Checksum: 0xB0A37613
	Offset: 0x270
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
	Namespace: luielembar_ct
	Checksum: 0x2DDB6825
	Offset: 0x2B8
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
	Namespace: luielembar_ct
	Checksum: 0x8D1B00BA
	Offset: 0x310
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
	Namespace: luielembar_ct
	Checksum: 0x8C4561EA
	Offset: 0x368
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
	Namespace: luielembar_ct
	Checksum: 0xDF23FFB5
	Offset: 0x3C0
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
	Namespace: luielembar_ct
	Checksum: 0xD59B7696
	Offset: 0x458
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new cluielembar_ct();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: luielembar_ct
	Checksum: 0x8EF4F6FA
	Offset: 0x498
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
	Namespace: luielembar_ct
	Checksum: 0xA45D939B
	Offset: 0x4D8
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
	Checksum: 0xA6DE1A52
	Offset: 0x500
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
	Namespace: luielembar_ct
	Checksum: 0x324B2914
	Offset: 0x528
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
	Namespace: luielembar_ct
	Checksum: 0x83D68D82
	Offset: 0x558
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
	Namespace: luielembar_ct
	Checksum: 0xB673A9ED
	Offset: 0x588
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
	Namespace: luielembar_ct
	Checksum: 0xDBB5B59D
	Offset: 0x5B8
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
	Namespace: luielembar_ct
	Checksum: 0x9AD1783A
	Offset: 0x5E8
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
	Namespace: luielembar_ct
	Checksum: 0xAEDE76C4
	Offset: 0x618
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
	Namespace: luielembar_ct
	Checksum: 0x6D7B5355
	Offset: 0x648
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
	Namespace: luielembar_ct
	Checksum: 0x4FA0E462
	Offset: 0x678
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
	Namespace: luielembar_ct
	Checksum: 0xE1736848
	Offset: 0x6A8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_blue(player, value)
{
	[[ self ]]->set_blue(player, value);
}

/*
	Name: set_bar_percent
	Namespace: luielembar_ct
	Checksum: 0x781262C8
	Offset: 0x6D8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_bar_percent(player, value)
{
	[[ self ]]->set_bar_percent(player, value);
}

