#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_849c5d15 : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_849c5d15
		Checksum: 0x16266B8D
		Offset: 0x1C8
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_849c5d15
		Checksum: 0x5C0C5146
		Offset: 0x300
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_849c5d15
		Checksum: 0x1FDD1718
		Offset: 0x238
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
		Namespace: namespace_849c5d15
		Checksum: 0xE863F962
		Offset: 0x280
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function close(player)
	{
		namespace_6aaccc24::function_a68f6e20(player);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_849c5d15
		Checksum: 0xC1FEB899
		Offset: 0x1E8
		Size: 0x44
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("interactive_shot");
		namespace_6aaccc24::function_dcb34c80("string", "text", 1);
	}

	/*
		Name: function_d5ea17f0
		Namespace: namespace_849c5d15
		Checksum: 0x75FDB841
		Offset: 0x2B0
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_d5ea17f0(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "text", value);
	}

}

#namespace interactive_shot;

/*
	Name: register
	Namespace: interactive_shot
	Checksum: 0xD4C8B5CF
	Offset: 0xC8
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function register()
{
	elem = new class_849c5d15();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: interactive_shot
	Checksum: 0xAAD9FD56
	Offset: 0x108
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
	Namespace: interactive_shot
	Checksum: 0xD115B182
	Offset: 0x148
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function close(player)
{
	[[ self ]]->close(player);
}

/*
	Name: is_open
	Namespace: interactive_shot
	Checksum: 0x853CA0D4
	Offset: 0x170
	Size: 0x1A
	Parameters: 1
	Flags: Linked
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: function_d5ea17f0
	Namespace: interactive_shot
	Checksum: 0x6809A6ED
	Offset: 0x198
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_d5ea17f0(player, value)
{
	[[ self ]]->function_d5ea17f0(player, value);
}

