#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_b6e5ba9d : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_b6e5ba9d
		Checksum: 0x94C99E74
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
		Namespace: namespace_b6e5ba9d
		Checksum: 0xC9C4E90C
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
		Namespace: namespace_b6e5ba9d
		Checksum: 0xD1ACEF65
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
		Namespace: namespace_b6e5ba9d
		Checksum: 0x5770F9DD
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
		Namespace: namespace_b6e5ba9d
		Checksum: 0xB4EDED3C
		Offset: 0x210
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
		Checksum: 0x4B88EEC5
		Offset: 0x2D8
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
	Name: function_9bf4a2e4
	Namespace: insertion_passenger_count
	Checksum: 0xA9D53A8B
	Offset: 0xD0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_9bf4a2e4()
{
	level notify(929343273);
}

/*
	Name: register
	Namespace: insertion_passenger_count
	Checksum: 0x9B629970
	Offset: 0xF0
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
	Checksum: 0xA4DF70D2
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
	Namespace: insertion_passenger_count
	Checksum: 0x2FDF789
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
	Namespace: insertion_passenger_count
	Checksum: 0xE6010A6A
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
	Name: set_count
	Namespace: insertion_passenger_count
	Checksum: 0xF9D70918
	Offset: 0x1C0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_count(player, value)
{
	[[ self ]]->set_count(player, value);
}

