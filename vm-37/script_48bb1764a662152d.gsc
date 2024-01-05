#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class cvehicleturretoverheat : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: cvehicleturretoverheat
		Checksum: 0xCB4D3D30
		Offset: 0x210
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
		Checksum: 0x9D631F4F
		Offset: 0x448
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
		Checksum: 0x1AF4A248
		Offset: 0x2A8
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
		Checksum: 0x65BAB0D9
		Offset: 0x2F0
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
		Checksum: 0x12327450
		Offset: 0x230
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
		Checksum: 0xE192FF99
		Offset: 0x320
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
		Checksum: 0xBBD6486F
		Offset: 0x3F8
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
	Name: register
	Namespace: vehicleturretoverheat
	Checksum: 0xF2448C04
	Offset: 0xE0
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
	Checksum: 0x34E39DA0
	Offset: 0x120
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
	Checksum: 0x74CB4E3A
	Offset: 0x160
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
	Checksum: 0xA9AD379B
	Offset: 0x188
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
	Checksum: 0x8FE60E97
	Offset: 0x1B0
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
	Checksum: 0xFE9BAFD6
	Offset: 0x1E0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_bar_percent(player, value)
{
	[[ self ]]->set_bar_percent(player, value);
}

