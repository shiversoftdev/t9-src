#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_5e02ffeb : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_5e02ffeb
		Checksum: 0x16E02915
		Offset: 0x728
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_5e02ffeb
		Checksum: 0x6FBD1CB9
		Offset: 0xC98
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_5e02ffeb
		Checksum: 0x4BDEB4A5
		Offset: 0x900
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
		Namespace: namespace_5e02ffeb
		Checksum: 0xD0537886
		Offset: 0xBA8
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
		Namespace: namespace_5e02ffeb
		Checksum: 0x563E3F66
		Offset: 0xAB8
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
		Namespace: namespace_5e02ffeb
		Checksum: 0xC2CA3DD1
		Offset: 0x948
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
		Namespace: namespace_5e02ffeb
		Checksum: 0xD2171675
		Offset: 0xA68
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
		Namespace: namespace_5e02ffeb
		Checksum: 0x4D754A1B
		Offset: 0xBF8
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
		Namespace: namespace_5e02ffeb
		Checksum: 0x2AAEB98D
		Offset: 0xA18
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
		Namespace: namespace_5e02ffeb
		Checksum: 0x308CCFD5
		Offset: 0x748
		Size: 0x1AC
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("LUIelemBar_ct");
		namespace_6aaccc24::function_da693cbe("x", 1, 7, "int");
		namespace_6aaccc24::function_da693cbe("y", 1, 6, "int");
		namespace_6aaccc24::function_da693cbe("width", 1, 6, "int");
		namespace_6aaccc24::function_da693cbe("height", 1, 6, "int");
		namespace_6aaccc24::function_da693cbe("fadeOverTime", 1, 5, "int");
		namespace_6aaccc24::function_da693cbe("alpha", 1, 4, "float");
		namespace_6aaccc24::function_da693cbe("red", 1, 4, "float");
		namespace_6aaccc24::function_da693cbe("green", 1, 4, "float");
		namespace_6aaccc24::function_da693cbe("blue", 1, 4, "float");
		namespace_6aaccc24::function_da693cbe("bar_percent", 1, 6, "float");
	}

	/*
		Name: set_y
		Namespace: namespace_5e02ffeb
		Checksum: 0x1EA8B006
		Offset: 0x9C8
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
		Namespace: namespace_5e02ffeb
		Checksum: 0x1515213C
		Offset: 0xB08
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
		Namespace: namespace_5e02ffeb
		Checksum: 0x24CEC559
		Offset: 0x978
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
		Namespace: namespace_5e02ffeb
		Checksum: 0x50E91B1F
		Offset: 0xB58
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_eccc151d(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "red", value);
	}

	/*
		Name: function_fd8c13fb
		Namespace: namespace_5e02ffeb
		Checksum: 0x89899B6A
		Offset: 0xC48
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_fd8c13fb(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "bar_percent", value);
	}

}

#namespace luielembar_ct;

/*
	Name: function_7c5a2ea6
	Namespace: luielembar_ct
	Checksum: 0xA8006C79
	Offset: 0x120
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_7c5a2ea6()
{
	level notify(1949820440);
}

/*
	Name: set_color
	Namespace: luielembar_ct
	Checksum: 0xF7B6C1A1
	Offset: 0x140
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
	Namespace: luielembar_ct
	Checksum: 0xBBC125AB
	Offset: 0x1B8
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
	Namespace: luielembar_ct
	Checksum: 0xD3A9082
	Offset: 0x240
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
	Checksum: 0x62407FB7
	Offset: 0x290
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
	Checksum: 0xCA434655
	Offset: 0x2D8
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
	Checksum: 0x9E9605BE
	Offset: 0x330
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
	Checksum: 0x45A9429F
	Offset: 0x388
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
	Checksum: 0x9E44AD44
	Offset: 0x3E0
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
	Namespace: luielembar_ct
	Checksum: 0x2D2E9A0A
	Offset: 0x478
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_5e02ffeb();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: luielembar_ct
	Checksum: 0xF413922D
	Offset: 0x4B8
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
	Checksum: 0xB33DD40D
	Offset: 0x4F8
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
	Checksum: 0x4194485C
	Offset: 0x520
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
	Checksum: 0xC039CD56
	Offset: 0x548
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
	Checksum: 0x865656D7
	Offset: 0x578
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
	Namespace: luielembar_ct
	Checksum: 0xFA7AB9A8
	Offset: 0x5A8
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
	Namespace: luielembar_ct
	Checksum: 0xD7C27507
	Offset: 0x5D8
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
	Namespace: luielembar_ct
	Checksum: 0x56418D59
	Offset: 0x608
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
	Namespace: luielembar_ct
	Checksum: 0xF23C770D
	Offset: 0x638
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
	Namespace: luielembar_ct
	Checksum: 0xE51AED42
	Offset: 0x668
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
	Namespace: luielembar_ct
	Checksum: 0x4E70A0F9
	Offset: 0x698
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
	Namespace: luielembar_ct
	Checksum: 0x263C1476
	Offset: 0x6C8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_7420df0a(player, value)
{
	[[ self ]]->function_7420df0a(player, value);
}

/*
	Name: function_fd8c13fb
	Namespace: luielembar_ct
	Checksum: 0x30C3BB02
	Offset: 0x6F8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_fd8c13fb(player, value)
{
	[[ self ]]->function_fd8c13fb(player, value);
}

