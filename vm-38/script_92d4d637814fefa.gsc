#using scripts\core_common\lui_shared.gsc;

class class_1beae0 : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_1beae0
		Checksum: 0xDEA28501
		Offset: 0x378
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
		Checksum: 0xEBD8BC27
		Offset: 0x828
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
		Checksum: 0x4F2AD109
		Offset: 0x3C0
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
		Checksum: 0x90BF7DD6
		Offset: 0x7D0
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
		Checksum: 0x5FCBB415
		Offset: 0x688
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
		Checksum: 0x9FA4F87E
		Offset: 0x540
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
		Checksum: 0x2BBF1674
		Offset: 0x408
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
		Checksum: 0x4DF31C81
		Offset: 0x778
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
		Checksum: 0x1978449F
		Offset: 0x4E8
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
		Checksum: 0xD6EEF5FA
		Offset: 0x700
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
		Checksum: 0x5DE92221
		Offset: 0x398
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
		Checksum: 0xFD556E69
		Offset: 0x490
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
		Checksum: 0x23B1ADB9
		Offset: 0x598
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
		Checksum: 0x76B4B8E1
		Offset: 0x438
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
		Checksum: 0xA8DB298A
		Offset: 0x610
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
	Name: function_a3591821
	Namespace: luielemcounter
	Checksum: 0x71F3E8B7
	Offset: 0xA8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_a3591821()
{
	level notify(-1681478518);
}

/*
	Name: register
	Namespace: luielemcounter
	Checksum: 0x1FC1FF07
	Offset: 0xC8
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
	Checksum: 0x40D59CB0
	Offset: 0x108
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
	Checksum: 0x6221B1B7
	Offset: 0x148
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
	Checksum: 0xD7920DB2
	Offset: 0x170
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
	Checksum: 0xD2194910
	Offset: 0x198
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
	Checksum: 0x19EE99F
	Offset: 0x1C8
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
	Checksum: 0xAF14A468
	Offset: 0x1F8
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
	Checksum: 0x8FAB7BC0
	Offset: 0x228
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
	Checksum: 0x1605E1A7
	Offset: 0x258
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
	Checksum: 0x90480C91
	Offset: 0x288
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
	Checksum: 0x356D6122
	Offset: 0x2B8
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
	Checksum: 0x93EF1DC8
	Offset: 0x2E8
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
	Checksum: 0x3632D910
	Offset: 0x318
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
	Checksum: 0xFB18B532
	Offset: 0x348
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_horizontal_alignment(player, value)
{
	[[ self ]]->set_horizontal_alignment(player, value);
}

