#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_616a42d0 : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_616a42d0
		Checksum: 0xB09D89E
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
		Namespace: namespace_616a42d0
		Checksum: 0x23E379AE
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
		Namespace: namespace_616a42d0
		Checksum: 0x4EC1E20B
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
		Namespace: namespace_616a42d0
		Checksum: 0x10682DF4
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
		Namespace: namespace_616a42d0
		Checksum: 0xC6B8493A
		Offset: 0x1E8
		Size: 0x44
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("zm_build_progress");
		namespace_6aaccc24::function_da693cbe("progress", 1, 6, "float");
	}

	/*
		Name: function_affe8f61
		Namespace: namespace_616a42d0
		Checksum: 0x822848A3
		Offset: 0x2B0
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_affe8f61(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "progress", value);
	}

}

#namespace zm_build_progress;

/*
	Name: register
	Namespace: zm_build_progress
	Checksum: 0x323C30C8
	Offset: 0xC8
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function register()
{
	elem = new class_616a42d0();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: zm_build_progress
	Checksum: 0x34E39DA0
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
	Namespace: zm_build_progress
	Checksum: 0x74CB4E3A
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
	Namespace: zm_build_progress
	Checksum: 0xA9AD379B
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
	Name: function_affe8f61
	Namespace: zm_build_progress
	Checksum: 0x9DB384F7
	Offset: 0x198
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_affe8f61(player, value)
{
	[[ self ]]->function_affe8f61(player, value);
}

