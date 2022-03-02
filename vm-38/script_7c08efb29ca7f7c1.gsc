#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_d4941e5e : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_d4941e5e
		Checksum: 0xE84C05F
		Offset: 0x2F0
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_d4941e5e
		Checksum: 0xABF2E285
		Offset: 0x608
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_d4941e5e
		Checksum: 0x13F5AA26
		Offset: 0x400
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
		Name: function_18066380
		Namespace: namespace_d4941e5e
		Checksum: 0x6F6C2E
		Offset: 0x568
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_18066380(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "direction", value);
	}

	/*
		Name: function_4d628707
		Namespace: namespace_d4941e5e
		Checksum: 0x75F67276
		Offset: 0x4C8
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_4d628707(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "awarenessState", value);
	}

	/*
		Name: close
		Namespace: namespace_d4941e5e
		Checksum: 0xCD25B4DD
		Offset: 0x448
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function close(player)
	{
		namespace_6aaccc24::function_a68f6e20(player);
	}

	/*
		Name: function_7425637b
		Namespace: namespace_d4941e5e
		Checksum: 0x4A3982C8
		Offset: 0x518
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_7425637b(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "awarenessProgress", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_d4941e5e
		Checksum: 0xA6DE38CA
		Offset: 0x310
		Size: 0xE4
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("stealth_meter_display");
		namespace_6aaccc24::function_da693cbe("entNum", 1, 10, "int");
		namespace_6aaccc24::function_da693cbe("awarenessState", 1, 4, "int");
		namespace_6aaccc24::function_da693cbe("awarenessProgress", 1, 4, "float");
		namespace_6aaccc24::function_da693cbe("direction", 1, 4, "float");
		namespace_6aaccc24::function_da693cbe("clamped", 1, 1, "int");
	}

	/*
		Name: function_c8350e33
		Namespace: namespace_d4941e5e
		Checksum: 0x6F09793D
		Offset: 0x478
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_c8350e33(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "entNum", value);
	}

	/*
		Name: function_fae2a569
		Namespace: namespace_d4941e5e
		Checksum: 0xB641A3DC
		Offset: 0x5B8
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_fae2a569(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "clamped", value);
	}

}

#namespace stealth_meter_display;

/*
	Name: function_4f1bd6de
	Namespace: stealth_meter_display
	Checksum: 0xB28F00BC
	Offset: 0x110
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_4f1bd6de()
{
	level notify(122692013);
}

/*
	Name: register
	Namespace: stealth_meter_display
	Checksum: 0xF5E918E1
	Offset: 0x130
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_d4941e5e();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: stealth_meter_display
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
	Namespace: stealth_meter_display
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
	Namespace: stealth_meter_display
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
	Name: function_c8350e33
	Namespace: stealth_meter_display
	Checksum: 0xAA5BD378
	Offset: 0x200
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_c8350e33(player, value)
{
	[[ self ]]->function_c8350e33(player, value);
}

/*
	Name: function_4d628707
	Namespace: stealth_meter_display
	Checksum: 0x8E553C9A
	Offset: 0x230
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_4d628707(player, value)
{
	[[ self ]]->function_4d628707(player, value);
}

/*
	Name: function_7425637b
	Namespace: stealth_meter_display
	Checksum: 0x48C01A0A
	Offset: 0x260
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_7425637b(player, value)
{
	[[ self ]]->function_7425637b(player, value);
}

/*
	Name: function_18066380
	Namespace: stealth_meter_display
	Checksum: 0x76137A8
	Offset: 0x290
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_18066380(player, value)
{
	[[ self ]]->function_18066380(player, value);
}

/*
	Name: function_fae2a569
	Namespace: stealth_meter_display
	Checksum: 0x7940E455
	Offset: 0x2C0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_fae2a569(player, value)
{
	[[ self ]]->function_fae2a569(player, value);
}

