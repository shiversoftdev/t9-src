#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_44eccfcc : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_44eccfcc
		Checksum: 0x987EAB71
		Offset: 0x1B8
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_44eccfcc
		Checksum: 0x661BCB0D
		Offset: 0x2F0
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_44eccfcc
		Checksum: 0xAE9EA3A2
		Offset: 0x228
		Size: 0x3C
		Parameters: 2
		Flags: Linked
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
		Namespace: namespace_44eccfcc
		Checksum: 0xCD27FDB
		Offset: 0x270
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function close(player)
	{
		namespace_6aaccc24::function_a68f6e20(player);
	}

	/*
		Name: function_6eef7f4f
		Namespace: namespace_44eccfcc
		Checksum: 0x20CB43D8
		Offset: 0x2A0
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_6eef7f4f(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "stim_count", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_44eccfcc
		Checksum: 0x3D340397
		Offset: 0x1D8
		Size: 0x44
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("stim_count");
		namespace_6aaccc24::function_da693cbe("stim_count", 1, 4, "int", 0);
	}

}

#namespace stim_count;

/*
	Name: register
	Namespace: stim_count
	Checksum: 0x1B82A6FB
	Offset: 0xB8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_44eccfcc();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: stim_count
	Checksum: 0x9E0FBA10
	Offset: 0xF8
	Size: 0x38
	Parameters: 2
	Flags: Linked
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
	Namespace: stim_count
	Checksum: 0x43870681
	Offset: 0x138
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
	Namespace: stim_count
	Checksum: 0xB2A10D20
	Offset: 0x160
	Size: 0x1A
	Parameters: 1
	Flags: Linked
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: function_6eef7f4f
	Namespace: stim_count
	Checksum: 0xD3C5B48B
	Offset: 0x188
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_6eef7f4f(player, value)
{
	[[ self ]]->function_6eef7f4f(player, value);
}

