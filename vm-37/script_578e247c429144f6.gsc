#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class cvehicleturretdurability : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: cvehicleturretdurability
		Checksum: 0x25B4C7BF
		Offset: 0x1D0
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cvehicleturretdurability
		Checksum: 0x68AFEC36
		Offset: 0x308
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: cvehicleturretdurability
		Checksum: 0x94518CE1
		Offset: 0x240
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
		Namespace: cvehicleturretdurability
		Checksum: 0x5FCE4
		Offset: 0x288
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
		Namespace: cvehicleturretdurability
		Checksum: 0xBA7A4D6B
		Offset: 0x1F0
		Size: 0x44
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("VehicleTurretDurability");
		cluielem::add_clientfield("bar_percent", 1, 6, "float", 0);
	}

	/*
		Name: set_bar_percent
		Namespace: cvehicleturretdurability
		Checksum: 0x988BD09F
		Offset: 0x2B8
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_bar_percent(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "bar_percent", value);
	}

}

#namespace vehicleturretdurability;

/*
	Name: register
	Namespace: vehicleturretdurability
	Checksum: 0xE13B5726
	Offset: 0xD0
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new cvehicleturretdurability();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: vehicleturretdurability
	Checksum: 0x66AF6895
	Offset: 0x110
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
	Namespace: vehicleturretdurability
	Checksum: 0xCF4D1283
	Offset: 0x150
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
	Namespace: vehicleturretdurability
	Checksum: 0xD7BC2ED4
	Offset: 0x178
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: set_bar_percent
	Namespace: vehicleturretdurability
	Checksum: 0xA67667D1
	Offset: 0x1A0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_bar_percent(player, value)
{
	[[ self ]]->set_bar_percent(player, value);
}

