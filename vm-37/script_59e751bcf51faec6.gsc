#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_e6fa6527 : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_e6fa6527
		Checksum: 0x987EAB71
		Offset: 0x1C8
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_e6fa6527
		Checksum: 0xB0D3F724
		Offset: 0x300
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_e6fa6527
		Checksum: 0xC699E39A
		Offset: 0x238
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
		Name: function_3820c524
		Namespace: namespace_e6fa6527
		Checksum: 0x6A2398A
		Offset: 0x2B0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_3820c524(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "shutdown_sec", value);
	}

	/*
		Name: close
		Namespace: namespace_e6fa6527
		Checksum: 0x5C76BE64
		Offset: 0x280
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
		Namespace: namespace_e6fa6527
		Checksum: 0xE9D17FD1
		Offset: 0x1E8
		Size: 0x44
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("death_zone");
		namespace_6aaccc24::function_da693cbe("shutdown_sec", 1, 9, "int");
	}

}

#namespace death_zone;

/*
	Name: register
	Namespace: death_zone
	Checksum: 0xE49B7877
	Offset: 0xC8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_e6fa6527();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: death_zone
	Checksum: 0x9E0FBA10
	Offset: 0x108
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
	Namespace: death_zone
	Checksum: 0x43870681
	Offset: 0x148
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
	Namespace: death_zone
	Checksum: 0xB2A10D20
	Offset: 0x170
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: function_3820c524
	Namespace: death_zone
	Checksum: 0x8DAC8E82
	Offset: 0x198
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_3820c524(player, value)
{
	[[ self ]]->function_3820c524(player, value);
}

