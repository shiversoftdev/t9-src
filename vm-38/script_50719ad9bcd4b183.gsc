#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class cfull_screen_black : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: cfull_screen_black
		Checksum: 0x6705DDD1
		Offset: 0x350
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cfull_screen_black
		Checksum: 0x7F62FE24
		Offset: 0x758
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: set_endalpha
		Namespace: cfull_screen_black
		Checksum: 0x378F7AED
		Offset: 0x6B8
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_endalpha(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "endAlpha", value);
	}

	/*
		Name: open
		Namespace: cfull_screen_black
		Checksum: 0x74B72858
		Offset: 0x4B0
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
		Namespace: cfull_screen_black
		Checksum: 0xAA01AED1
		Offset: 0x578
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_green(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "green", value);
	}

	/*
		Name: set_fadeovertime
		Namespace: cfull_screen_black
		Checksum: 0xA10B3E86
		Offset: 0x618
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_fadeovertime(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "fadeOverTime", value);
	}

	/*
		Name: close
		Namespace: cfull_screen_black
		Checksum: 0x9855B99D
		Offset: 0x4F8
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function close(player)
	{
		cluielem::close_luielem(player);
	}

	/*
		Name: set_blue
		Namespace: cfull_screen_black
		Checksum: 0x72ACA967
		Offset: 0x5C8
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_blue(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "blue", value);
	}

	/*
		Name: setup_clientfields
		Namespace: cfull_screen_black
		Checksum: 0x8916B184
		Offset: 0x370
		Size: 0x134
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("full_screen_black");
		cluielem::add_clientfield("red", 1, 3, "float");
		cluielem::add_clientfield("green", 1, 3, "float");
		cluielem::add_clientfield("blue", 1, 3, "float");
		cluielem::add_clientfield("fadeOverTime", 1, 12, "int");
		cluielem::add_clientfield("startAlpha", 1, 5, "float");
		cluielem::add_clientfield("endAlpha", 1, 5, "float");
		cluielem::add_clientfield("drawHUD", 1, 1, "int");
	}

	/*
		Name: set_startalpha
		Namespace: cfull_screen_black
		Checksum: 0xA5A7B5B3
		Offset: 0x668
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_startalpha(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "startAlpha", value);
	}

	/*
		Name: set_drawhud
		Namespace: cfull_screen_black
		Checksum: 0x7927A9E6
		Offset: 0x708
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_drawhud(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "drawHUD", value);
	}

	/*
		Name: set_red
		Namespace: cfull_screen_black
		Checksum: 0x27557248
		Offset: 0x528
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_red(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "red", value);
	}

}

#namespace full_screen_black;

/*
	Name: function_f35a2a1b
	Namespace: full_screen_black
	Checksum: 0x959A521A
	Offset: 0x110
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_f35a2a1b()
{
	level notify(-1918152099);
}

/*
	Name: register
	Namespace: full_screen_black
	Checksum: 0xE66F3806
	Offset: 0x130
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function register()
{
	elem = new cfull_screen_black();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: full_screen_black
	Checksum: 0x40D59CB0
	Offset: 0x170
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
	Namespace: full_screen_black
	Checksum: 0x6221B1B7
	Offset: 0x1B0
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
	Namespace: full_screen_black
	Checksum: 0xD7920DB2
	Offset: 0x1D8
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: set_red
	Namespace: full_screen_black
	Checksum: 0x25A2AA3D
	Offset: 0x200
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
	Namespace: full_screen_black
	Checksum: 0x33C146D2
	Offset: 0x230
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
	Namespace: full_screen_black
	Checksum: 0x9F223F63
	Offset: 0x260
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_blue(player, value)
{
	[[ self ]]->set_blue(player, value);
}

/*
	Name: set_fadeovertime
	Namespace: full_screen_black
	Checksum: 0x8FAB7BC0
	Offset: 0x290
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_fadeovertime(player, value)
{
	[[ self ]]->set_fadeovertime(player, value);
}

/*
	Name: set_startalpha
	Namespace: full_screen_black
	Checksum: 0x425AE0C6
	Offset: 0x2C0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_startalpha(player, value)
{
	[[ self ]]->set_startalpha(player, value);
}

/*
	Name: set_endalpha
	Namespace: full_screen_black
	Checksum: 0x2D66DD0C
	Offset: 0x2F0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_endalpha(player, value)
{
	[[ self ]]->set_endalpha(player, value);
}

/*
	Name: set_drawhud
	Namespace: full_screen_black
	Checksum: 0x28597FE8
	Offset: 0x320
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_drawhud(player, value)
{
	[[ self ]]->set_drawhud(player, value);
}

