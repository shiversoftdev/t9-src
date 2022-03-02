#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_af345a5f : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_af345a5f
		Checksum: 0x98BF4F32
		Offset: 0x260
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_af345a5f
		Checksum: 0x3D86C092
		Offset: 0x488
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_af345a5f
		Checksum: 0x89C5FE32
		Offset: 0x320
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
		Namespace: namespace_af345a5f
		Checksum: 0x67790807
		Offset: 0x368
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function close(player)
	{
		namespace_6aaccc24::function_a68f6e20(player);
	}

	/*
		Name: function_65194707
		Namespace: namespace_af345a5f
		Checksum: 0x41E1855A
		Offset: 0x438
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_65194707(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "num_downs", value);
	}

	/*
		Name: function_67bdfe40
		Namespace: namespace_af345a5f
		Checksum: 0x7B70989E
		Offset: 0x398
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_67bdfe40(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "bleedout_progress", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_af345a5f
		Checksum: 0x10E19162
		Offset: 0x280
		Size: 0x94
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("zm_laststand_client");
		namespace_6aaccc24::function_da693cbe("bleedout_progress", 1, 8, "float");
		namespace_6aaccc24::function_da693cbe("revive_progress", 1, 8, "float");
		namespace_6aaccc24::function_da693cbe("num_downs", 1, 8, "int");
	}

	/*
		Name: function_d50fdde9
		Namespace: namespace_af345a5f
		Checksum: 0x26DE24C
		Offset: 0x3E8
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_d50fdde9(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "revive_progress", value);
	}

}

#namespace zm_laststand_client;

/*
	Name: register
	Namespace: zm_laststand_client
	Checksum: 0x50DAB47E
	Offset: 0x100
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function register()
{
	elem = new class_af345a5f();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: zm_laststand_client
	Checksum: 0xB2724536
	Offset: 0x140
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
	Namespace: zm_laststand_client
	Checksum: 0xA6D7C1EF
	Offset: 0x180
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
	Namespace: zm_laststand_client
	Checksum: 0x3D187C10
	Offset: 0x1A8
	Size: 0x1A
	Parameters: 1
	Flags: Linked
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: function_67bdfe40
	Namespace: zm_laststand_client
	Checksum: 0xECC3992
	Offset: 0x1D0
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_67bdfe40(player, value)
{
	[[ self ]]->function_67bdfe40(player, value);
}

/*
	Name: function_d50fdde9
	Namespace: zm_laststand_client
	Checksum: 0x8D93BA6D
	Offset: 0x200
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_d50fdde9(player, value)
{
	[[ self ]]->function_d50fdde9(player, value);
}

/*
	Name: function_65194707
	Namespace: zm_laststand_client
	Checksum: 0x9D7ADB3
	Offset: 0x230
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_65194707(player, value)
{
	[[ self ]]->function_65194707(player, value);
}

