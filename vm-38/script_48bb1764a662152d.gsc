#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class cvehicleturretoverheat : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: cvehicleturretoverheat
		Checksum: 0xB6920732
		Offset: 0x230
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cvehicleturretoverheat
		Checksum: 0xB1D7E39C
		Offset: 0x468
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: cvehicleturretoverheat
		Checksum: 0xD2759495
		Offset: 0x2C8
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
		Name: close
		Namespace: cvehicleturretoverheat
		Checksum: 0x187D1183
		Offset: 0x310
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function close(player)
	{
		cluielem::close_luielem(player);
	}

	/*
		Name: setup_clientfields
		Namespace: cvehicleturretoverheat
		Checksum: 0x5622D09B
		Offset: 0x250
		Size: 0x6C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("VehicleTurretOverheat");
		cluielem::add_clientfield("_state", 1, 1, "int");
		cluielem::add_clientfield("bar_percent", 1, 6, "float", 0);
	}

	/*
		Name: set_state
		Namespace: cvehicleturretoverheat
		Checksum: 0x4113EC45
		Offset: 0x340
		Size: 0xCC
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
			if(#"overheat" == state_name)
			{
				player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "_state", 1);
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

	/*
		Name: set_bar_percent
		Namespace: cvehicleturretoverheat
		Checksum: 0x60616771
		Offset: 0x418
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_bar_percent(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "bar_percent", value);
	}

}

#namespace vehicleturretoverheat;

/*
	Name: function_d0c4c7af
	Namespace: vehicleturretoverheat
	Checksum: 0xBE4E1D5B
	Offset: 0xE0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_d0c4c7af()
{
	level notify(1330814438);
}

/*
	Name: register
	Namespace: vehicleturretoverheat
	Checksum: 0x5EDC56D
	Offset: 0x100
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new cvehicleturretoverheat();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: vehicleturretoverheat
	Checksum: 0x40D59CB0
	Offset: 0x140
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
	Namespace: vehicleturretoverheat
	Checksum: 0x6221B1B7
	Offset: 0x180
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
	Namespace: vehicleturretoverheat
	Checksum: 0xD7920DB2
	Offset: 0x1A8
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
	Namespace: vehicleturretoverheat
	Checksum: 0xD15109CF
	Offset: 0x1D0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_state(player, state_name)
{
	[[ self ]]->set_state(player, state_name);
}

/*
	Name: set_bar_percent
	Namespace: vehicleturretoverheat
	Checksum: 0x19F1D56
	Offset: 0x200
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_bar_percent(player, value)
{
	[[ self ]]->set_bar_percent(player, value);
}

