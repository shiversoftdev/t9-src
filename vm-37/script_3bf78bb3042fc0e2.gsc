#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_28a7d65d : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_28a7d65d
		Checksum: 0x16266B8D
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
		Namespace: namespace_28a7d65d
		Checksum: 0xC42AC60D
		Offset: 0x300
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: function_459465a
		Namespace: namespace_28a7d65d
		Checksum: 0x7FAB19E9
		Offset: 0x2B0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_459465a(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "percent", value);
	}

	/*
		Name: open
		Namespace: namespace_28a7d65d
		Checksum: 0x899CE1FB
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
		Name: close
		Namespace: namespace_28a7d65d
		Checksum: 0xA11CA29D
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
		Namespace: namespace_28a7d65d
		Checksum: 0x3A51758C
		Offset: 0x1E8
		Size: 0x44
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("self_respawn");
		namespace_6aaccc24::function_da693cbe("percent", 1, 6, "float");
	}

}

#namespace self_respawn;

/*
	Name: register
	Namespace: self_respawn
	Checksum: 0xADC06C3E
	Offset: 0xC8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_28a7d65d();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: self_respawn
	Checksum: 0xB2724536
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
	Namespace: self_respawn
	Checksum: 0xA6D7C1EF
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
	Namespace: self_respawn
	Checksum: 0x3D187C10
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
	Name: function_459465a
	Namespace: self_respawn
	Checksum: 0xA36A41BF
	Offset: 0x198
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_459465a(player, value)
{
	[[ self ]]->function_459465a(player, value);
}

