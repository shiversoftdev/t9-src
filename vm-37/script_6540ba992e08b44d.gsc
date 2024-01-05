#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class class_1bec696c : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_1bec696c
		Checksum: 0xAC9BDC23
		Offset: 0x6C0
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_1bec696c
		Checksum: 0xE5DCAA47
		Offset: 0xCA8
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_1bec696c
		Checksum: 0xCDB94087
		Offset: 0x8C0
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
		Name: set_horizontal_alignment
		Namespace: namespace_1bec696c
		Checksum: 0x9D33EF49
		Offset: 0xC08
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_horizontal_alignment(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "horizontal_alignment", value);
	}

	/*
		Name: set_green
		Namespace: namespace_1bec696c
		Checksum: 0x51DAD523
		Offset: 0xB18
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
		Namespace: namespace_1bec696c
		Checksum: 0x4ACE276C
		Offset: 0xA28
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
		Namespace: namespace_1bec696c
		Checksum: 0x28A09AB
		Offset: 0x908
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
		Namespace: namespace_1bec696c
		Checksum: 0xE4930BCD
		Offset: 0x9D8
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
		Namespace: namespace_1bec696c
		Checksum: 0x443ACBD8
		Offset: 0xB68
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_blue(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "blue", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_1bec696c
		Checksum: 0xD00FC838
		Offset: 0x6E0
		Size: 0x1D4
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("DOA_BannerElement");
		cluielem::add_clientfield("x", 1, 7, "int");
		cluielem::add_clientfield("y", 1, 6, "int");
		cluielem::add_clientfield("height", 1, 2, "int");
		cluielem::add_clientfield("fadeOverTime", 1, 5, "int");
		cluielem::add_clientfield("alpha", 1, 4, "float");
		cluielem::add_clientfield("red", 1, 4, "float");
		cluielem::add_clientfield("green", 1, 4, "float");
		cluielem::add_clientfield("blue", 1, 4, "float");
		cluielem::function_dcb34c80("string", "text", 1);
		cluielem::add_clientfield("horizontal_alignment", 1, 2, "int");
		cluielem::add_clientfield("scale", 1, 6, "float");
	}

	/*
		Name: set_y
		Namespace: namespace_1bec696c
		Checksum: 0xFC8264EE
		Offset: 0x988
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
		Namespace: namespace_1bec696c
		Checksum: 0xB98FC90D
		Offset: 0xA78
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_alpha(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "alpha", value);
	}

	/*
		Name: set_scale
		Namespace: namespace_1bec696c
		Checksum: 0x6C272E9
		Offset: 0xC58
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_scale(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "scale", value);
	}

	/*
		Name: set_x
		Namespace: namespace_1bec696c
		Checksum: 0x8A8AAB17
		Offset: 0x938
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_x(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "x", value);
	}

	/*
		Name: set_text
		Namespace: namespace_1bec696c
		Checksum: 0x24DB3C73
		Offset: 0xBB8
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_text(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "text", value);
	}

	/*
		Name: set_red
		Namespace: namespace_1bec696c
		Checksum: 0xC67384F1
		Offset: 0xAC8
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_red(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "red", value);
	}

}

#namespace doa_bannerelement;

/*
	Name: set_color
	Namespace: doa_bannerelement
	Checksum: 0xD188D9A2
	Offset: 0x140
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
	Namespace: doa_bannerelement
	Checksum: 0xD8F2E698
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
	self set_alpha(player, var_1a92607f);
	self set_fadeovertime(player, int(duration * 10));
}

/*
	Name: show
	Namespace: doa_bannerelement
	Checksum: 0x51466083
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
	Namespace: doa_bannerelement
	Checksum: 0x36EE4E8D
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
	Namespace: doa_bannerelement
	Checksum: 0x299838B9
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
	Namespace: doa_bannerelement
	Checksum: 0x5EA9CEF4
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
	Namespace: doa_bannerelement
	Checksum: 0xE9A8EE84
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
	Name: register
	Namespace: doa_bannerelement
	Checksum: 0x4E94F3AE
	Offset: 0x3E0
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_1bec696c();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: doa_bannerelement
	Checksum: 0xE3FD9264
	Offset: 0x420
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
	Namespace: doa_bannerelement
	Checksum: 0x551A22C0
	Offset: 0x460
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
	Namespace: doa_bannerelement
	Checksum: 0xCABDAFC2
	Offset: 0x488
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
	Namespace: doa_bannerelement
	Checksum: 0x2AA12FF4
	Offset: 0x4B0
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
	Namespace: doa_bannerelement
	Checksum: 0xDAC58781
	Offset: 0x4E0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_y(player, value)
{
	[[ self ]]->set_y(player, value);
}

/*
	Name: set_height
	Namespace: doa_bannerelement
	Checksum: 0x228A057C
	Offset: 0x510
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
	Namespace: doa_bannerelement
	Checksum: 0x7440E36
	Offset: 0x540
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
	Namespace: doa_bannerelement
	Checksum: 0xD1D274DF
	Offset: 0x570
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
	Namespace: doa_bannerelement
	Checksum: 0x37AAFDB2
	Offset: 0x5A0
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
	Namespace: doa_bannerelement
	Checksum: 0xCB78713
	Offset: 0x5D0
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
	Namespace: doa_bannerelement
	Checksum: 0xD191AAD4
	Offset: 0x600
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_blue(player, value)
{
	[[ self ]]->set_blue(player, value);
}

/*
	Name: set_text
	Namespace: doa_bannerelement
	Checksum: 0x3FC3B3BD
	Offset: 0x630
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_text(player, value)
{
	[[ self ]]->set_text(player, value);
}

/*
	Name: set_horizontal_alignment
	Namespace: doa_bannerelement
	Checksum: 0x15AC8E5A
	Offset: 0x660
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_horizontal_alignment(player, value)
{
	[[ self ]]->set_horizontal_alignment(player, value);
}

/*
	Name: set_scale
	Namespace: doa_bannerelement
	Checksum: 0xC2A50C7E
	Offset: 0x690
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_scale(player, value)
{
	[[ self ]]->set_scale(player, value);
}

