#using scripts\core_common\lui_shared.gsc;

class class_1beae0 : class_6aaccc24
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
		namespace_6aaccc24::function_8b8089ba(player, flags);
	}

	/*
		Name: function_1bd2bb26
		Namespace: namespace_1beae0
		Checksum: 0x90BF7DD6
		Offset: 0x7D0
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
		Checksum: 0x5FCBB415
		Offset: 0x688
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
		Checksum: 0x9FA4F87E
		Offset: 0x540
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
		Checksum: 0x2BBF1674
		Offset: 0x408
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
		Name: function_5dbd7024
		Namespace: namespace_1beae0
		Checksum: 0x1978449F
		Offset: 0x4E8
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
		Checksum: 0xD6EEF5FA
		Offset: 0x700
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
		Checksum: 0x5DE92221
		Offset: 0x398
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
		Name: function_aa5c711d
		Namespace: namespace_1beae0
		Checksum: 0x23B1ADB9
		Offset: 0x598
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
		Name: function_eccc151d
		Namespace: namespace_1beae0
		Checksum: 0xA8DB298A
		Offset: 0x610
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
	level notify(1681478518);
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
	Name: function_5dbd7024
	Namespace: luielemcounter
	Checksum: 0xAF14A468
	Offset: 0x1F8
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
	Checksum: 0x8FAB7BC0
	Offset: 0x228
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
	Checksum: 0x1605E1A7
	Offset: 0x258
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
	Checksum: 0x90480C91
	Offset: 0x288
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
	Checksum: 0x356D6122
	Offset: 0x2B8
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
	Checksum: 0x93EF1DC8
	Offset: 0x2E8
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
	Name: function_1bd2bb26
	Namespace: luielemcounter
	Checksum: 0xFB18B532
	Offset: 0x348
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_1bd2bb26(player, value)
{
	[[ self ]]->function_1bd2bb26(player, value);
}

