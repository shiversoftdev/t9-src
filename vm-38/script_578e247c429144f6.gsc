#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_366ba496 : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_366ba496
		Checksum: 0xBA748155
		Offset: 0x1F0
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_366ba496
		Checksum: 0xF105F770
		Offset: 0x328
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_366ba496
		Checksum: 0x1AF786EA
		Offset: 0x260
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
		Name: close
		Namespace: namespace_366ba496
		Checksum: 0xC24A9008
		Offset: 0x2A8
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function close(player)
	{
		namespace_6aaccc24::function_a68f6e20(player);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_366ba496
		Checksum: 0xE6C59C35
		Offset: 0x210
		Size: 0x44
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("VehicleTurretDurability");
		namespace_6aaccc24::function_da693cbe("bar_percent", 1, 6, "float", 0);
	}

	/*
		Name: function_fd8c13fb
		Namespace: namespace_366ba496
		Checksum: 0x623F3C5E
		Offset: 0x2D8
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_fd8c13fb(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "bar_percent", value);
	}

}

#namespace vehicleturretdurability;

/*
	Name: function_2139229
	Namespace: vehicleturretdurability
	Checksum: 0x6FF7D394
	Offset: 0xD0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_2139229()
{
	level notify(1171389297);
}

/*
	Name: register
	Namespace: vehicleturretdurability
	Checksum: 0x7B4F13D7
	Offset: 0xF0
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_366ba496();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: vehicleturretdurability
	Checksum: 0x584B4B43
	Offset: 0x130
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
	Checksum: 0x5189623B
	Offset: 0x170
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
	Checksum: 0xC3D6EA8D
	Offset: 0x198
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: function_fd8c13fb
	Namespace: vehicleturretdurability
	Checksum: 0x143C393C
	Offset: 0x1C0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_fd8c13fb(player, value)
{
	[[ self ]]->function_fd8c13fb(player, value);
}

