#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_14224618 : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_14224618
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
		Namespace: namespace_14224618
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
		Name: function_331f9dd
		Namespace: namespace_14224618
		Checksum: 0x5A9210B1
		Offset: 0x698
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_331f9dd(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "endAlpha", value);
	}

	/*
		Name: open
		Namespace: namespace_14224618
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
		namespace_6aaccc24::function_8b8089ba(player, flags);
	}

	/*
		Name: function_2208b8db
		Namespace: namespace_14224618
		Checksum: 0xBC4056C9
		Offset: 0x558
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_2208b8db(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "green", value);
	}

	/*
		Name: function_237ff433
		Namespace: namespace_14224618
		Checksum: 0xA4C90688
		Offset: 0x5F8
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_237ff433(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "fadeOverTime", value);
	}

	/*
		Name: close
		Namespace: namespace_14224618
		Checksum: 0x90D7CE74
		Offset: 0x4D8
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function close(player)
	{
		namespace_6aaccc24::function_a68f6e20(player);
	}

	/*
		Name: function_7420df0a
		Namespace: namespace_14224618
		Checksum: 0xE619E965
		Offset: 0x5A8
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_7420df0a(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "blue", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_14224618
		Checksum: 0x5C26FDFA
		Offset: 0x350
		Size: 0x134
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("full_screen_black");
		namespace_6aaccc24::function_da693cbe("red", 1, 3, "float");
		namespace_6aaccc24::function_da693cbe("green", 1, 3, "float");
		namespace_6aaccc24::function_da693cbe("blue", 1, 3, "float");
		namespace_6aaccc24::function_da693cbe("fadeOverTime", 1, 12, "int");
		namespace_6aaccc24::function_da693cbe("startAlpha", 1, 5, "float");
		namespace_6aaccc24::function_da693cbe("endAlpha", 1, 5, "float");
		namespace_6aaccc24::function_da693cbe("drawHUD", 1, 1, "int");
	}

	/*
		Name: function_9cd54463
		Namespace: namespace_14224618
		Checksum: 0x41D28BED
		Offset: 0x648
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_9cd54463(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "startAlpha", value);
	}

	/*
		Name: function_ae1277a0
		Namespace: namespace_14224618
		Checksum: 0x2FDF91E9
		Offset: 0x6E8
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_ae1277a0(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "drawHUD", value);
	}

	/*
		Name: function_eccc151d
		Namespace: namespace_14224618
		Checksum: 0x5ED99DA4
		Offset: 0x508
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_eccc151d(player, value)
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
	elem = new class_14224618();
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
	Name: function_eccc151d
	Namespace: full_screen_black
	Checksum: 0x7B15AD65
	Offset: 0x1E0
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
	Namespace: full_screen_black
	Checksum: 0xCCC5F452
	Offset: 0x210
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
	Namespace: full_screen_black
	Checksum: 0x9D49DABB
	Offset: 0x240
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_7420df0a(player, value)
{
	[[ self ]]->function_7420df0a(player, value);
}

/*
	Name: function_237ff433
	Namespace: full_screen_black
	Checksum: 0x32682548
	Offset: 0x270
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_237ff433(player, value)
{
	[[ self ]]->function_237ff433(player, value);
}

/*
	Name: function_9cd54463
	Namespace: full_screen_black
	Checksum: 0x7666CA7C
	Offset: 0x2A0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_9cd54463(player, value)
{
	[[ self ]]->function_9cd54463(player, value);
}

/*
	Name: function_331f9dd
	Namespace: full_screen_black
	Checksum: 0x8B020A94
	Offset: 0x2D0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_331f9dd(player, value)
{
	[[ self ]]->function_331f9dd(player, value);
}

/*
	Name: function_ae1277a0
	Namespace: full_screen_black
	Checksum: 0xD6D5653D
	Offset: 0x300
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_ae1277a0(player, value)
{
	[[ self ]]->function_ae1277a0(player, value);
}

