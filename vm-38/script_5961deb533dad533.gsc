#using scripts\core_common\lui_shared.gsc;

class class_3c805d30 : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_3c805d30
		Checksum: 0x16E02915
		Offset: 0x6B0
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
		Checksum: 0x1C02379D
		Offset: 0xB80
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
		Checksum: 0xE582A322
		Offset: 0x6F8
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
		Checksum: 0xADC14E25
		Offset: 0xA18
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
		Checksum: 0x80F446C3
		Offset: 0x8D0
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
		Checksum: 0xF88C2DFE
		Offset: 0x740
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
		Checksum: 0x6093B6C7
		Offset: 0x878
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
		Checksum: 0xAD0CAD77
		Offset: 0xA90
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
		Checksum: 0x16509506
		Offset: 0x820
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
		Checksum: 0xB7AF7524
		Offset: 0x6D0
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
		Checksum: 0x7EEBA1C3
		Offset: 0x7C8
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
		Checksum: 0x1A5EC481
		Offset: 0x928
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
		Checksum: 0xF5F538AB
		Offset: 0x770
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
		Checksum: 0x6FEEDF98
		Offset: 0x9A0
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
		Checksum: 0x54B97954
		Offset: 0xB08
		Size: 0x6C
		Parameters: 2
		Flags: Linked
	*/
	function function_fd8c13fb(player, value)
	{
		player lui::function_bb6bcb89(hash(var_d5213cbb), var_bf9c8c95, 10, int(value * (128 - 1)), 0);
	}

}

#namespace luielembar;

/*
	Name: function_28908ecd
	Namespace: luielembar
	Checksum: 0xFE3A581F
	Offset: 0xA8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_28908ecd()
{
	level notify(531631652);
}

/*
	Name: set_color
	Namespace: luielembar
	Checksum: 0xF7B6C1A1
	Offset: 0xC8
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
	Checksum: 0xBBC125AB
	Offset: 0x140
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
	Checksum: 0xD3A9082
	Offset: 0x1C8
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
	Checksum: 0x62407FB7
	Offset: 0x218
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
	Checksum: 0xCA434655
	Offset: 0x260
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
	Checksum: 0x9E9605BE
	Offset: 0x2B8
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
	Checksum: 0x45A9429F
	Offset: 0x310
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
	Checksum: 0x9E44AD44
	Offset: 0x368
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
	Checksum: 0xBAF60A18
	Offset: 0x400
	Size: 0x34
	Parameters: 0
	Flags: Linked
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
	Checksum: 0xF413922D
	Offset: 0x440
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
	Checksum: 0xB33DD40D
	Offset: 0x480
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
	Checksum: 0x4194485C
	Offset: 0x4A8
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
	Checksum: 0xC039CD56
	Offset: 0x4D0
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
	Checksum: 0x865656D7
	Offset: 0x500
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
	Checksum: 0xFA7AB9A8
	Offset: 0x530
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
	Checksum: 0xD7C27507
	Offset: 0x560
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
	Checksum: 0x56418D59
	Offset: 0x590
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
	Checksum: 0xF23C770D
	Offset: 0x5C0
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
	Checksum: 0xE51AED42
	Offset: 0x5F0
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
	Checksum: 0x4E70A0F9
	Offset: 0x620
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
	Checksum: 0x263C1476
	Offset: 0x650
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
	Checksum: 0x30C3BB02
	Offset: 0x680
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_fd8c13fb(player, value)
{
	[[ self ]]->function_fd8c13fb(player, value);
}
