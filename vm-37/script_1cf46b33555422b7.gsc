#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_e6e7895b : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_e6e7895b
		Checksum: 0x531DE040
		Offset: 0x680
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
		Checksum: 0x93069EDB
		Offset: 0xBF0
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
		Checksum: 0xD454C337
		Offset: 0x858
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
		Checksum: 0xBB7F262D
		Offset: 0xBA0
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
		Checksum: 0x3FCCDEDE
		Offset: 0xAB0
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
		Checksum: 0x6F194EE3
		Offset: 0x9C0
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
		Checksum: 0x208D9318
		Offset: 0x8A0
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
		Checksum: 0x4FC40400
		Offset: 0x970
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
		Checksum: 0xFECE06FE
		Offset: 0xB00
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
		Checksum: 0xA20FE93
		Offset: 0x6A0
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
		Checksum: 0xADF909DA
		Offset: 0x920
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
		Checksum: 0x127032D
		Offset: 0xA10
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
		Checksum: 0x7548E1E7
		Offset: 0x8D0
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
		Checksum: 0x3C48B417
		Offset: 0xB50
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
		Checksum: 0xAD661CBC
		Offset: 0xA60
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
	Name: set_color
	Namespace: luielemtext
	Checksum: 0xEED41CB3
	Offset: 0x130
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
	Checksum: 0x229B8700
	Offset: 0x1A8
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
	Checksum: 0xD15E9AF8
	Offset: 0x230
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
	Checksum: 0xB0A37613
	Offset: 0x280
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
	Checksum: 0x2DDB6825
	Offset: 0x2C8
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
	Checksum: 0x8D1B00BA
	Offset: 0x320
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
	Checksum: 0x8C4561EA
	Offset: 0x378
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
	Checksum: 0x8B10ED10
	Offset: 0x3D0
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
	Checksum: 0xA2A77E39
	Offset: 0x410
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
	Checksum: 0xCEE115C4
	Offset: 0x450
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
	Checksum: 0x59A45E16
	Offset: 0x478
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
	Checksum: 0x1DA99471
	Offset: 0x4A0
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
	Checksum: 0xB8B563E6
	Offset: 0x4D0
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
	Checksum: 0x478F9F5E
	Offset: 0x500
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
	Checksum: 0x982084C2
	Offset: 0x530
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
	Checksum: 0xA455F9DA
	Offset: 0x560
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
	Checksum: 0x354DF135
	Offset: 0x590
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
	Checksum: 0xBBCA4FAB
	Offset: 0x5C0
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
	Checksum: 0xF47129E7
	Offset: 0x5F0
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
	Checksum: 0xF02D9A8E
	Offset: 0x620
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
	Checksum: 0xA364FAFB
	Offset: 0x650
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_1bd2bb26(player, value)
{
	[[ self ]]->function_1bd2bb26(player, value);
}

