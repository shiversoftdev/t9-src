#using scripts\core_common\lui_shared.gsc;

class cluielembar : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: cluielembar
		Checksum: 0xF7C09A47
		Offset: 0x690
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cluielembar
		Checksum: 0x1D5E5E27
		Offset: 0xB60
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: cluielembar
		Checksum: 0x842E8B01
		Offset: 0x6D8
		Size: 0x3C
		Parameters: 2
		Flags: Linked
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
		Namespace: cluielembar
		Checksum: 0xADA47FFA
		Offset: 0x9F8
		Size: 0x6C
		Parameters: 2
		Flags: Linked
	*/
	function set_green(player, value)
	{
		player lui::function_bb6bcb89(hash(var_d5213cbb), var_bf9c8c95, 8, int(value * (16 - 1)), 0);
	}

	/*
		Name: set_fadeovertime
		Namespace: cluielembar
		Checksum: 0xB1036A18
		Offset: 0x8B0
		Size: 0x4C
		Parameters: 2
		Flags: Linked
	*/
	function set_fadeovertime(player, value)
	{
		player lui::function_bb6bcb89(hash(var_d5213cbb), var_bf9c8c95, 5, value, 0);
	}

	/*
		Name: close
		Namespace: cluielembar
		Checksum: 0xDAD25E9A
		Offset: 0x720
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function close(player)
	{
		cluielem::close_luielem(player);
	}

	/*
		Name: set_height
		Namespace: cluielembar
		Checksum: 0xF4A87D62
		Offset: 0x858
		Size: 0x4C
		Parameters: 2
		Flags: Linked
	*/
	function set_height(player, value)
	{
		player lui::function_bb6bcb89(hash(var_d5213cbb), var_bf9c8c95, 4, value, 0);
	}

	/*
		Name: set_blue
		Namespace: cluielembar
		Checksum: 0xB01D2D14
		Offset: 0xA70
		Size: 0x6C
		Parameters: 2
		Flags: Linked
	*/
	function set_blue(player, value)
	{
		player lui::function_bb6bcb89(hash(var_d5213cbb), var_bf9c8c95, 9, int(value * (16 - 1)), 0);
	}

	/*
		Name: set_width
		Namespace: cluielembar
		Checksum: 0x1F536E1B
		Offset: 0x800
		Size: 0x4C
		Parameters: 2
		Flags: Linked
	*/
	function set_width(player, value)
	{
		player lui::function_bb6bcb89(hash(var_d5213cbb), var_bf9c8c95, 3, value, 0);
	}

	/*
		Name: setup_clientfields
		Namespace: cluielembar
		Checksum: 0x160BE0B9
		Offset: 0x6B0
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("LUIelemBar");
	}

	/*
		Name: set_y
		Namespace: cluielembar
		Checksum: 0x6CB31F5A
		Offset: 0x7A8
		Size: 0x4C
		Parameters: 2
		Flags: Linked
	*/
	function set_y(player, value)
	{
		player lui::function_bb6bcb89(hash(var_d5213cbb), var_bf9c8c95, 2, value, 0);
	}

	/*
		Name: set_alpha
		Namespace: cluielembar
		Checksum: 0x17A7809E
		Offset: 0x908
		Size: 0x6C
		Parameters: 2
		Flags: Linked
	*/
	function set_alpha(player, value)
	{
		player lui::function_bb6bcb89(hash(var_d5213cbb), var_bf9c8c95, 6, int(value * (16 - 1)), 0);
	}

	/*
		Name: set_x
		Namespace: cluielembar
		Checksum: 0xF943D1BE
		Offset: 0x750
		Size: 0x4C
		Parameters: 2
		Flags: Linked
	*/
	function set_x(player, value)
	{
		player lui::function_bb6bcb89(hash(var_d5213cbb), var_bf9c8c95, 1, value, 0);
	}

	/*
		Name: set_red
		Namespace: cluielembar
		Checksum: 0x8B55DA62
		Offset: 0x980
		Size: 0x6C
		Parameters: 2
		Flags: Linked
	*/
	function set_red(player, value)
	{
		player lui::function_bb6bcb89(hash(var_d5213cbb), var_bf9c8c95, 7, int(value * (16 - 1)), 0);
	}

	/*
		Name: set_bar_percent
		Namespace: cluielembar
		Checksum: 0x77945D23
		Offset: 0xAE8
		Size: 0x6C
		Parameters: 2
		Flags: Linked
	*/
	function set_bar_percent(player, value)
	{
		player lui::function_bb6bcb89(hash(var_d5213cbb), var_bf9c8c95, 10, int(value * (64 - 1)), 0);
	}

}

#namespace luielembar;

/*
	Name: set_color
	Namespace: luielembar
	Checksum: 0xEED41CB3
	Offset: 0xA8
	Size: 0x6C
	Parameters: 4
	Flags: Linked
*/
function set_color(player, red, green, blue)
{
	self set_red(player, red);
	self set_green(player, green);
	self set_blue(player, blue);
}

/*
	Name: fade
	Namespace: luielembar
	Checksum: 0x229B8700
	Offset: 0x120
	Size: 0x7C
	Parameters: 3
	Flags: Linked
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
	Namespace: luielembar
	Checksum: 0xD15E9AF8
	Offset: 0x1A8
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
	Namespace: luielembar
	Checksum: 0xB0A37613
	Offset: 0x1F8
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
	Namespace: luielembar
	Checksum: 0x2DDB6825
	Offset: 0x240
	Size: 0x4C
	Parameters: 2
	Flags: Linked
*/
function function_e5898fd7(player, var_c6572d9b)
{
	self set_x(player, int(var_c6572d9b / 15));
}

/*
	Name: function_58a135d3
	Namespace: luielembar
	Checksum: 0x8D1B00BA
	Offset: 0x298
	Size: 0x4C
	Parameters: 2
	Flags: Linked
*/
function function_58a135d3(player, var_d390c80e)
{
	self set_y(player, int(var_d390c80e / 15));
}

/*
	Name: function_f97e9049
	Namespace: luielembar
	Checksum: 0x8C4561EA
	Offset: 0x2F0
	Size: 0x4C
	Parameters: 3
	Flags: Linked
*/
function function_f97e9049(player, var_c6572d9b, var_d390c80e)
{
	self function_e5898fd7(player, var_c6572d9b);
	self function_58a135d3(player, var_d390c80e);
}

/*
	Name: function_35f52fe9
	Namespace: luielembar
	Checksum: 0xDF23FFB5
	Offset: 0x348
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
	Namespace: luielembar
	Checksum: 0x4243E684
	Offset: 0x3E0
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new cluielembar();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: luielembar
	Checksum: 0x8EF4F6FA
	Offset: 0x420
	Size: 0x38
	Parameters: 2
	Flags: Linked
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
	Namespace: luielembar
	Checksum: 0xA45D939B
	Offset: 0x460
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function close(player)
{
	[[ self ]]->close(player);
}

/*
	Name: is_open
	Namespace: luielembar
	Checksum: 0xA6DE1A52
	Offset: 0x488
	Size: 0x1A
	Parameters: 1
	Flags: Linked
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: set_x
	Namespace: luielembar
	Checksum: 0x324B2914
	Offset: 0x4B0
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_x(player, value)
{
	[[ self ]]->set_x(player, value);
}

/*
	Name: set_y
	Namespace: luielembar
	Checksum: 0x83D68D82
	Offset: 0x4E0
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_y(player, value)
{
	[[ self ]]->set_y(player, value);
}

/*
	Name: set_width
	Namespace: luielembar
	Checksum: 0xB673A9ED
	Offset: 0x510
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_width(player, value)
{
	[[ self ]]->set_width(player, value);
}

/*
	Name: set_height
	Namespace: luielembar
	Checksum: 0xDBB5B59D
	Offset: 0x540
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_height(player, value)
{
	[[ self ]]->set_height(player, value);
}

/*
	Name: set_fadeovertime
	Namespace: luielembar
	Checksum: 0x9AD1783A
	Offset: 0x570
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_fadeovertime(player, value)
{
	[[ self ]]->set_fadeovertime(player, value);
}

/*
	Name: set_alpha
	Namespace: luielembar
	Checksum: 0xAEDE76C4
	Offset: 0x5A0
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_alpha(player, value)
{
	[[ self ]]->set_alpha(player, value);
}

/*
	Name: set_red
	Namespace: luielembar
	Checksum: 0x6D7B5355
	Offset: 0x5D0
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_red(player, value)
{
	[[ self ]]->set_red(player, value);
}

/*
	Name: set_green
	Namespace: luielembar
	Checksum: 0x4FA0E462
	Offset: 0x600
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_green(player, value)
{
	[[ self ]]->set_green(player, value);
}

/*
	Name: set_blue
	Namespace: luielembar
	Checksum: 0xE1736848
	Offset: 0x630
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_blue(player, value)
{
	[[ self ]]->set_blue(player, value);
}

/*
	Name: set_bar_percent
	Namespace: luielembar
	Checksum: 0x781262C8
	Offset: 0x660
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_bar_percent(player, value)
{
	[[ self ]]->set_bar_percent(player, value);
}

