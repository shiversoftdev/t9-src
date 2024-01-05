#using scripts\core_common\lui_shared.gsc;

class class_1beae0 : cluielem
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
		cluielem::open_luielem(player, flags);
	}

	/*
		Name: set_horizontal_alignment
		Namespace: namespace_1beae0
		Checksum: 0xFFA7D19
		Offset: 0x7B0
		Size: 0x4C
		Parameters: 2
		Flags: Linked
	*/
	function set_horizontal_alignment(player, value)
	{
		player lui::function_bb6bcb89(hash(var_d5213cbb), var_bf9c8c95, 10, value, 0);
	}

	/*
		Name: set_green
		Namespace: namespace_1beae0
		Checksum: 0x5C358CFC
		Offset: 0x668
		Size: 0x6C
		Parameters: 2
		Flags: Linked
	*/
	function set_green(player, value)
	{
		player lui::function_bb6bcb89(hash(var_d5213cbb), var_bf9c8c95, 7, int(value * (16 - 1)), 0);
	}

	/*
		Name: set_fadeovertime
		Namespace: namespace_1beae0
		Checksum: 0x9239CD56
		Offset: 0x520
		Size: 0x4C
		Parameters: 2
		Flags: Linked
	*/
	function set_fadeovertime(player, value)
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
		cluielem::close_luielem(player);
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
		Name: set_height
		Namespace: namespace_1beae0
		Checksum: 0xDB144B5A
		Offset: 0x4C8
		Size: 0x4C
		Parameters: 2
		Flags: Linked
	*/
	function set_height(player, value)
	{
		player lui::function_bb6bcb89(hash(var_d5213cbb), var_bf9c8c95, 3, value, 0);
	}

	/*
		Name: set_blue
		Namespace: namespace_1beae0
		Checksum: 0x2F003D0A
		Offset: 0x6E0
		Size: 0x6C
		Parameters: 2
		Flags: Linked
	*/
	function set_blue(player, value)
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
		cluielem::setup_clientfields("LUIelemCounter");
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
		Name: set_alpha
		Namespace: namespace_1beae0
		Checksum: 0xDD19F70F
		Offset: 0x578
		Size: 0x6C
		Parameters: 2
		Flags: Linked
	*/
	function set_alpha(player, value)
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
		Name: set_red
		Namespace: namespace_1beae0
		Checksum: 0x9D4A3CD9
		Offset: 0x5F0
		Size: 0x6C
		Parameters: 2
		Flags: Linked
	*/
	function set_red(player, value)
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
	Name: set_height
	Namespace: luielemcounter
	Checksum: 0xAD7F41B0
	Offset: 0x1D8
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
	Namespace: luielemcounter
	Checksum: 0x32682548
	Offset: 0x208
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
	Namespace: luielemcounter
	Checksum: 0x2239CB1D
	Offset: 0x238
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_alpha(player, value)
{
	[[ self ]]->set_alpha(player, value);
}

/*
	Name: set_red
	Namespace: luielemcounter
	Checksum: 0x362CDB09
	Offset: 0x268
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_red(player, value)
{
	[[ self ]]->set_red(player, value);
}

/*
	Name: set_green
	Namespace: luielemcounter
	Checksum: 0xCBE17BF7
	Offset: 0x298
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_green(player, value)
{
	[[ self ]]->set_green(player, value);
}

/*
	Name: set_blue
	Namespace: luielemcounter
	Checksum: 0x449F3A34
	Offset: 0x2C8
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_blue(player, value)
{
	[[ self ]]->set_blue(player, value);
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
	Name: set_horizontal_alignment
	Namespace: luielemcounter
	Checksum: 0xD2C67B5E
	Offset: 0x328
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_horizontal_alignment(player, value)
{
	[[ self ]]->set_horizontal_alignment(player, value);
}

