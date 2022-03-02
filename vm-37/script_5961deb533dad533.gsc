#using scripts\core_common\lui_shared.gsc;

class class_3c805d30 : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_3c805d30
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
		Namespace: namespace_3c805d30
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
		Namespace: namespace_3c805d30
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
		namespace_6aaccc24::function_8b8089ba(player, flags);
	}

	/*
		Name: function_2208b8db
		Namespace: namespace_3c805d30
		Checksum: 0xADA47FFA
		Offset: 0x9F8
		Size: 0x6C
		Parameters: 2
		Flags: Linked
	*/
	function function_2208b8db(player, value)
	{
		player lui::function_bb6bcb89(hash(var_d5213cbb), var_bf9c8c95, 8, int(value * (16 - 1)), 0);
	}

	/*
		Name: function_237ff433
		Namespace: namespace_3c805d30
		Checksum: 0xB1036A18
		Offset: 0x8B0
		Size: 0x4C
		Parameters: 2
		Flags: Linked
	*/
	function function_237ff433(player, value)
	{
		player lui::function_bb6bcb89(hash(var_d5213cbb), var_bf9c8c95, 5, value, 0);
	}

	/*
		Name: close
		Namespace: namespace_3c805d30
		Checksum: 0xDAD25E9A
		Offset: 0x720
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function close(player)
	{
		namespace_6aaccc24::function_a68f6e20(player);
	}

	/*
		Name: function_5dbd7024
		Namespace: namespace_3c805d30
		Checksum: 0xF4A87D62
		Offset: 0x858
		Size: 0x4C
		Parameters: 2
		Flags: Linked
	*/
	function function_5dbd7024(player, value)
	{
		player lui::function_bb6bcb89(hash(var_d5213cbb), var_bf9c8c95, 4, value, 0);
	}

	/*
		Name: function_7420df0a
		Namespace: namespace_3c805d30
		Checksum: 0xB01D2D14
		Offset: 0xA70
		Size: 0x6C
		Parameters: 2
		Flags: Linked
	*/
	function function_7420df0a(player, value)
	{
		player lui::function_bb6bcb89(hash(var_d5213cbb), var_bf9c8c95, 9, int(value * (16 - 1)), 0);
	}

	/*
		Name: function_8b0b5811
		Namespace: namespace_3c805d30
		Checksum: 0x1F536E1B
		Offset: 0x800
		Size: 0x4C
		Parameters: 2
		Flags: Linked
	*/
	function function_8b0b5811(player, value)
	{
		player lui::function_bb6bcb89(hash(var_d5213cbb), var_bf9c8c95, 3, value, 0);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_3c805d30
		Checksum: 0x160BE0B9
		Offset: 0x6B0
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("LUIelemBar");
	}

	/*
		Name: set_y
		Namespace: namespace_3c805d30
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
		Name: function_aa5c711d
		Namespace: namespace_3c805d30
		Checksum: 0x17A7809E
		Offset: 0x908
		Size: 0x6C
		Parameters: 2
		Flags: Linked
	*/
	function function_aa5c711d(player, value)
	{
		player lui::function_bb6bcb89(hash(var_d5213cbb), var_bf9c8c95, 6, int(value * (16 - 1)), 0);
	}

	/*
		Name: set_x
		Namespace: namespace_3c805d30
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
		Name: function_eccc151d
		Namespace: namespace_3c805d30
		Checksum: 0x8B55DA62
		Offset: 0x980
		Size: 0x6C
		Parameters: 2
		Flags: Linked
	*/
	function function_eccc151d(player, value)
	{
		player lui::function_bb6bcb89(hash(var_d5213cbb), var_bf9c8c95, 7, int(value * (16 - 1)), 0);
	}

	/*
		Name: function_fd8c13fb
		Namespace: namespace_3c805d30
		Checksum: 0x77945D23
		Offset: 0xAE8
		Size: 0x6C
		Parameters: 2
		Flags: Linked
	*/
	function function_fd8c13fb(player, value)
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
	self function_eccc151d(player, red);
	self function_2208b8db(player, green);
	self function_7420df0a(player, blue);
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
	self function_aa5c711d(player, var_1a92607f);
	self function_237ff433(player, int(duration * 10));
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
	self function_8b0b5811(player, int(width / 4));
	self function_5dbd7024(player, int(height / 4));
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
	elem = new class_3c805d30();
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
	Name: function_8b0b5811
	Namespace: luielembar
	Checksum: 0xB673A9ED
	Offset: 0x510
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_8b0b5811(player, value)
{
	[[ self ]]->function_8b0b5811(player, value);
}

/*
	Name: function_5dbd7024
	Namespace: luielembar
	Checksum: 0xDBB5B59D
	Offset: 0x540
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_5dbd7024(player, value)
{
	[[ self ]]->function_5dbd7024(player, value);
}

/*
	Name: function_237ff433
	Namespace: luielembar
	Checksum: 0x9AD1783A
	Offset: 0x570
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_237ff433(player, value)
{
	[[ self ]]->function_237ff433(player, value);
}

/*
	Name: function_aa5c711d
	Namespace: luielembar
	Checksum: 0xAEDE76C4
	Offset: 0x5A0
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_aa5c711d(player, value)
{
	[[ self ]]->function_aa5c711d(player, value);
}

/*
	Name: function_eccc151d
	Namespace: luielembar
	Checksum: 0x6D7B5355
	Offset: 0x5D0
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_eccc151d(player, value)
{
	[[ self ]]->function_eccc151d(player, value);
}

/*
	Name: function_2208b8db
	Namespace: luielembar
	Checksum: 0x4FA0E462
	Offset: 0x600
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_2208b8db(player, value)
{
	[[ self ]]->function_2208b8db(player, value);
}

/*
	Name: function_7420df0a
	Namespace: luielembar
	Checksum: 0xE1736848
	Offset: 0x630
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_7420df0a(player, value)
{
	[[ self ]]->function_7420df0a(player, value);
}

/*
	Name: function_fd8c13fb
	Namespace: luielembar
	Checksum: 0x781262C8
	Offset: 0x660
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_fd8c13fb(player, value)
{
	[[ self ]]->function_fd8c13fb(player, value);
}

