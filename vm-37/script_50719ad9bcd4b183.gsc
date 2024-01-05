#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class cfull_screen_black : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: cfull_screen_black
		Checksum: 0xF7E2A852
		Offset: 0x330
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
		Checksum: 0x31B58032
		Offset: 0x738
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
		Checksum: 0x5A9210B1
		Offset: 0x698
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
		Checksum: 0x73BFFEFD
		Offset: 0x490
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
		Checksum: 0xBC4056C9
		Offset: 0x558
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
		Checksum: 0xA4C90688
		Offset: 0x5F8
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
		Checksum: 0x90D7CE74
		Offset: 0x4D8
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
		Checksum: 0xE619E965
		Offset: 0x5A8
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
		Checksum: 0x5C26FDFA
		Offset: 0x350
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
		Checksum: 0x41D28BED
		Offset: 0x648
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
		Checksum: 0x2FDF91E9
		Offset: 0x6E8
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
		Checksum: 0x5ED99DA4
		Offset: 0x508
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
	Name: register
	Namespace: full_screen_black
	Checksum: 0x11C6716F
	Offset: 0x110
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
	Checksum: 0x34E39DA0
	Offset: 0x150
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
	Checksum: 0x74CB4E3A
	Offset: 0x190
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
	Checksum: 0xA9AD379B
	Offset: 0x1B8
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
	Checksum: 0x7B15AD65
	Offset: 0x1E0
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
	Checksum: 0xCCC5F452
	Offset: 0x210
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
	Checksum: 0x9D49DABB
	Offset: 0x240
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
	Checksum: 0x32682548
	Offset: 0x270
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
	Checksum: 0x7666CA7C
	Offset: 0x2A0
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
	Checksum: 0x8B020A94
	Offset: 0x2D0
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
	Checksum: 0xD6D5653D
	Offset: 0x300
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_drawhud(player, value)
{
	[[ self ]]->set_drawhud(player, value);
}

