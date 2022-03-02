#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_b6e5ba9d : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_b6e5ba9d
		Checksum: 0x987EAB71
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
		Namespace: namespace_b6e5ba9d
		Checksum: 0xB0D3F724
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
		Namespace: namespace_b6e5ba9d
		Checksum: 0xC699E39A
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
		namespace_6aaccc24::function_8b8089ba(player, flags);
	}

	/*
		Name: close
		Namespace: namespace_b6e5ba9d
		Checksum: 0x5C76BE64
		Offset: 0x288
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
		Namespace: namespace_b6e5ba9d
		Checksum: 0xADE40AAD
		Offset: 0x1F0
		Size: 0x44
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("insertion_passenger_count");
		namespace_6aaccc24::function_da693cbe("count", 1, 7, "int");
	}

	/*
		Name: set_count
		Namespace: namespace_b6e5ba9d
		Checksum: 0xE39A8D0B
		Offset: 0x2B8
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_count(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "count", value);
	}

}

#namespace insertion_passenger_count;

/*
	Name: register
	Namespace: insertion_passenger_count
	Checksum: 0xA23E0D05
	Offset: 0xD0
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_b6e5ba9d();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: insertion_passenger_count
	Checksum: 0x9E0FBA10
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
	Namespace: insertion_passenger_count
	Checksum: 0x43870681
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
	Namespace: insertion_passenger_count
	Checksum: 0xB2A10D20
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
	Name: set_count
	Namespace: insertion_passenger_count
	Checksum: 0xDBC06F9E
	Offset: 0x1A0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_count(player, value)
{
	[[ self ]]->set_count(player, value);
}

