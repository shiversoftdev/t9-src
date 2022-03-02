#using scripts\core_common\lui_shared.gsc;

class class_1beae0 : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_1beae0
		Checksum: 0x424EF13F
		Offset: 0x358
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_1beae0
		Checksum: 0x6D9AC362
		Offset: 0x808
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_1beae0
		Checksum: 0x3706B34A
		Offset: 0x3A0
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
		Name: function_1bd2bb26
		Namespace: namespace_1beae0
		Checksum: 0xFFA7D19
		Offset: 0x7B0
		Size: 0x4C
		Parameters: 2
		Flags: Linked
	*/
	function function_1bd2bb26(player, value)
	{
		player lui::function_bb6bcb89(hash(var_d5213cbb), var_bf9c8c95, 10, value, 0);
	}

	/*
		Name: function_2208b8db
		Namespace: namespace_1beae0
		Checksum: 0x5C358CFC
		Offset: 0x668
		Size: 0x6C
		Parameters: 2
		Flags: Linked
	*/
	function function_2208b8db(player, value)
	{
		player lui::function_bb6bcb89(hash(var_d5213cbb), var_bf9c8c95, 7, int(value * (16 - 1)), 0);
	}

	/*
		Name: function_237ff433
		Namespace: namespace_1beae0
		Checksum: 0x9239CD56
		Offset: 0x520
		Size: 0x4C
		Parameters: 2
		Flags: Linked
	*/
	function function_237ff433(player, value)
	{
		player lui::function_bb6bcb89(hash(var_d5213cbb), var_bf9c8c95, 4, value, 0);
	}

	/*
		Name: close
		Namespace: namespace_1beae0
		Checksum: 0x43D3362F
		Offset: 0x3E8
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function close(player)
	{
		namespace_6aaccc24::function_a68f6e20(player);
	}

	/*
		Name: set_number
		Namespace: namespace_1beae0
		Checksum: 0xE7DAFB03
		Offset: 0x758
		Size: 0x4C
		Parameters: 2
		Flags: Linked
	*/
	function set_number(player, value)
	{
		player lui::function_bb6bcb89(hash(var_d5213cbb), var_bf9c8c95, 9, value, 0);
	}

	/*
		Name: function_5dbd7024
		Namespace: namespace_1beae0
		Checksum: 0xDB144B5A
		Offset: 0x4C8
		Size: 0x4C
		Parameters: 2
		Flags: Linked
	*/
	function function_5dbd7024(player, value)
	{
		player lui::function_bb6bcb89(hash(var_d5213cbb), var_bf9c8c95, 3, value, 0);
	}

	/*
		Name: function_7420df0a
		Namespace: namespace_1beae0
		Checksum: 0x2F003D0A
		Offset: 0x6E0
		Size: 0x6C
		Parameters: 2
		Flags: Linked
	*/
	function function_7420df0a(player, value)
	{
		player lui::function_bb6bcb89(hash(var_d5213cbb), var_bf9c8c95, 8, int(value * (16 - 1)), 0);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_1beae0
		Checksum: 0x58D217CE
		Offset: 0x378
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("LUIelemCounter");
	}

	/*
		Name: set_y
		Namespace: namespace_1beae0
		Checksum: 0xFF57C3DF
		Offset: 0x470
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
		Namespace: namespace_1beae0
		Checksum: 0xDD19F70F
		Offset: 0x578
		Size: 0x6C
		Parameters: 2
		Flags: Linked
	*/
	function function_aa5c711d(player, value)
	{
		player lui::function_bb6bcb89(hash(var_d5213cbb), var_bf9c8c95, 5, int(value * (16 - 1)), 0);
	}

	/*
		Name: set_x
		Namespace: namespace_1beae0
		Checksum: 0x5BED6935
		Offset: 0x418
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
		Namespace: namespace_1beae0
		Checksum: 0x9D4A3CD9
		Offset: 0x5F0
		Size: 0x6C
		Parameters: 2
		Flags: Linked
	*/
	function function_eccc151d(player, value)
	{
		player lui::function_bb6bcb89(hash(var_d5213cbb), var_bf9c8c95, 6, int(value * (16 - 1)), 0);
	}

}

#namespace luielemcounter;

/*
	Name: register
	Namespace: luielemcounter
	Checksum: 0xE868B66E
	Offset: 0xA8
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function register()
{
	elem = new class_1beae0();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: luielemcounter
	Checksum: 0x34E39DA0
	Offset: 0xE8
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
	Namespace: luielemcounter
	Checksum: 0x74CB4E3A
	Offset: 0x128
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
	Namespace: luielemcounter
	Checksum: 0xA9AD379B
	Offset: 0x150
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
	Namespace: luielemcounter
	Checksum: 0x8CAE4E48
	Offset: 0x178
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
	Namespace: luielemcounter
	Checksum: 0xFE9A5B1F
	Offset: 0x1A8
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_y(player, value)
{
	[[ self ]]->set_y(player, value);
}

/*
	Name: function_5dbd7024
	Namespace: luielemcounter
	Checksum: 0xAD7F41B0
	Offset: 0x1D8
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
	Namespace: luielemcounter
	Checksum: 0x32682548
	Offset: 0x208
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
	Namespace: luielemcounter
	Checksum: 0x2239CB1D
	Offset: 0x238
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
	Namespace: luielemcounter
	Checksum: 0x362CDB09
	Offset: 0x268
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
	Namespace: luielemcounter
	Checksum: 0xCBE17BF7
	Offset: 0x298
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
	Namespace: luielemcounter
	Checksum: 0x449F3A34
	Offset: 0x2C8
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_7420df0a(player, value)
{
	[[ self ]]->function_7420df0a(player, value);
}

/*
	Name: set_number
	Namespace: luielemcounter
	Checksum: 0xE61B0BD5
	Offset: 0x2F8
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_number(player, value)
{
	[[ self ]]->set_number(player, value);
}

/*
	Name: function_1bd2bb26
	Namespace: luielemcounter
	Checksum: 0xD2C67B5E
	Offset: 0x328
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_1bd2bb26(player, value)
{
	[[ self ]]->function_1bd2bb26(player, value);
}

