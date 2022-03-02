#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_d4941e5e : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_d4941e5e
		Checksum: 0x9C597585
		Offset: 0x310
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
		Checksum: 0x2F4F2EF2
		Offset: 0x770
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
		Checksum: 0x2E2E424D
		Offset: 0x448
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
		Checksum: 0x7A165EC9
		Offset: 0x6D0
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
		Checksum: 0xE56C487B
		Offset: 0x630
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
		Checksum: 0xBFABDC0D
		Offset: 0x490
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
		Checksum: 0xEDCD5C8
		Offset: 0x680
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
		Checksum: 0xEE6315DE
		Offset: 0x330
		Size: 0x10C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("stealth_meter_display");
		namespace_6aaccc24::function_da693cbe("_state", 1, 2, "int");
		namespace_6aaccc24::function_da693cbe("entNum", 1, 10, "int");
		namespace_6aaccc24::function_da693cbe("awarenessState", 1, 4, "int");
		namespace_6aaccc24::function_da693cbe("awarenessProgress", 1, 4, "float");
		namespace_6aaccc24::function_da693cbe("direction", 1, 4, "float");
		namespace_6aaccc24::function_da693cbe("clamped", 1, 1, "int");
	}

	/*
		Name: function_c8350e33
		Namespace: namespace_d4941e5e
		Checksum: 0x6D48503E
		Offset: 0x5E0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_c8350e33(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "entNum", value);
	}

	/*
		Name: set_state
		Namespace: namespace_d4941e5e
		Checksum: 0xB1CA87E4
		Offset: 0x4C0
		Size: 0x114
		Parameters: 2
		Flags: None
	*/
	function set_state(player, state_name)
	{
		if(#"defaultstate" == state_name)
		{
			player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "_state", 0);
		}
		else
		{
			if(#"hide" == state_name)
			{
				player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "_state", 1);
			}
			else
			{
				if(#"show" == state_name)
				{
					player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "_state", 2);
				}
				else
				{
					/#
						assertmsg("");
					#/
					/#
					#/
				}
			}
		}
	}

	/*
		Name: function_fae2a569
		Namespace: namespace_d4941e5e
		Checksum: 0xE7946819
		Offset: 0x720
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
	Name: register
	Namespace: stealth_meter_display
	Checksum: 0xBEC6D9DC
	Offset: 0x120
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
	Checksum: 0xB2724536
	Offset: 0x160
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
	Checksum: 0xA6D7C1EF
	Offset: 0x1A0
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
	Checksum: 0x3D187C10
	Offset: 0x1C8
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: set_state
	Namespace: stealth_meter_display
	Checksum: 0x33F3D17D
	Offset: 0x1F0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_state(player, state_name)
{
	[[ self ]]->set_state(player, state_name);
}

/*
	Name: function_c8350e33
	Namespace: stealth_meter_display
	Checksum: 0xBDF4BE99
	Offset: 0x220
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
	Checksum: 0x559EABFF
	Offset: 0x250
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
	Checksum: 0x24C56644
	Offset: 0x280
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
	Checksum: 0x56001BD5
	Offset: 0x2B0
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
	Checksum: 0x29B7A53C
	Offset: 0x2E0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_fae2a569(player, value)
{
	[[ self ]]->function_fae2a569(player, value);
}

