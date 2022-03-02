#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_14224618 : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_14224618
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
		Namespace: namespace_14224618
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
		Name: function_331f9dd
		Namespace: namespace_14224618
		Checksum: 0x378F7AED
		Offset: 0x6B8
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
		namespace_6aaccc24::function_8b8089ba(player, flags);
	}

	/*
		Name: function_2208b8db
		Namespace: namespace_14224618
		Checksum: 0xAA01AED1
		Offset: 0x578
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
		Checksum: 0xA10B3E86
		Offset: 0x618
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
		Checksum: 0x9855B99D
		Offset: 0x4F8
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
		Checksum: 0x72ACA967
		Offset: 0x5C8
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
		Checksum: 0x8916B184
		Offset: 0x370
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
		Checksum: 0xA5A7B5B3
		Offset: 0x668
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
		Checksum: 0x7927A9E6
		Offset: 0x708
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
		Checksum: 0x27557248
		Offset: 0x528
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
	level notify(1918152099);
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
	elem = new class_14224618();
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
	Name: function_eccc151d
	Namespace: full_screen_black
	Checksum: 0x25A2AA3D
	Offset: 0x200
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
	Checksum: 0x33C146D2
	Offset: 0x230
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
	Checksum: 0x9F223F63
	Offset: 0x260
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
	Checksum: 0x8FAB7BC0
	Offset: 0x290
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
	Checksum: 0x425AE0C6
	Offset: 0x2C0
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
	Checksum: 0x2D66DD0C
	Offset: 0x2F0
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
	Checksum: 0x28597FE8
	Offset: 0x320
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_ae1277a0(player, value)
{
	[[ self ]]->function_ae1277a0(player, value);
}

