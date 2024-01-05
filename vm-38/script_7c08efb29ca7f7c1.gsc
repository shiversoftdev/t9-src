#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class cstealth_meter_display : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: cstealth_meter_display
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
		Namespace: cstealth_meter_display
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
		Namespace: cstealth_meter_display
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
		cluielem::open_luielem(player, flags);
	}

	/*
		Name: set_direction
		Namespace: cstealth_meter_display
		Checksum: 0x6F6C2E
		Offset: 0x568
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_direction(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "direction", value);
	}

	/*
		Name: set_awarenessstate
		Namespace: cstealth_meter_display
		Checksum: 0x75F67276
		Offset: 0x4C8
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_awarenessstate(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "awarenessState", value);
	}

	/*
		Name: close
		Namespace: cstealth_meter_display
		Checksum: 0xCD25B4DD
		Offset: 0x448
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function close(player)
	{
		cluielem::close_luielem(player);
	}

	/*
		Name: set_awarenessprogress
		Namespace: cstealth_meter_display
		Checksum: 0x4A3982C8
		Offset: 0x518
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_awarenessprogress(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "awarenessProgress", value);
	}

	/*
		Name: setup_clientfields
		Namespace: cstealth_meter_display
		Checksum: 0xA6DE38CA
		Offset: 0x310
		Size: 0xE4
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("stealth_meter_display");
		cluielem::add_clientfield("entNum", 1, 10, "int");
		cluielem::add_clientfield("awarenessState", 1, 4, "int");
		cluielem::add_clientfield("awarenessProgress", 1, 4, "float");
		cluielem::add_clientfield("direction", 1, 4, "float");
		cluielem::add_clientfield("clamped", 1, 1, "int");
	}

	/*
		Name: set_entnum
		Namespace: cstealth_meter_display
		Checksum: 0x6F09793D
		Offset: 0x478
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_entnum(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "entNum", value);
	}

	/*
		Name: set_clamped
		Namespace: cstealth_meter_display
		Checksum: 0xB641A3DC
		Offset: 0x5B8
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_clamped(player, value)
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
	level notify(-122692013);
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
	elem = new cstealth_meter_display();
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
	Name: set_entnum
	Namespace: stealth_meter_display
	Checksum: 0xAA5BD378
	Offset: 0x200
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_entnum(player, value)
{
	[[ self ]]->set_entnum(player, value);
}

/*
	Name: set_awarenessstate
	Namespace: stealth_meter_display
	Checksum: 0x8E553C9A
	Offset: 0x230
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_awarenessstate(player, value)
{
	[[ self ]]->set_awarenessstate(player, value);
}

/*
	Name: set_awarenessprogress
	Namespace: stealth_meter_display
	Checksum: 0x48C01A0A
	Offset: 0x260
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_awarenessprogress(player, value)
{
	[[ self ]]->set_awarenessprogress(player, value);
}

/*
	Name: set_direction
	Namespace: stealth_meter_display
	Checksum: 0x76137A8
	Offset: 0x290
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_direction(player, value)
{
	[[ self ]]->set_direction(player, value);
}

/*
	Name: set_clamped
	Namespace: stealth_meter_display
	Checksum: 0x7940E455
	Offset: 0x2C0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_clamped(player, value)
{
	[[ self ]]->set_clamped(player, value);
}

