#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_43514e12 : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_43514e12
		Checksum: 0xCB4D3D30
		Offset: 0x220
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_43514e12
		Checksum: 0x8F4E628C
		Offset: 0x3D0
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_43514e12
		Checksum: 0xDD6BB9B1
		Offset: 0x2B8
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
		Namespace: namespace_43514e12
		Checksum: 0x3FEE2097
		Offset: 0x300
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
		Namespace: namespace_43514e12
		Checksum: 0x59B757AF
		Offset: 0x240
		Size: 0x6C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("mp_gamemode_onslaught_2nd_msg");
		namespace_6aaccc24::function_dcb34c80("string", "objective2Text", 1);
		namespace_6aaccc24::function_da693cbe("obj2points", 1, 11, "int");
	}

	/*
		Name: function_9c1c0811
		Namespace: namespace_43514e12
		Checksum: 0x17FB8A1D
		Offset: 0x330
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_9c1c0811(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "objective2Text", value);
	}

	/*
		Name: function_d9092332
		Namespace: namespace_43514e12
		Checksum: 0x8DCF4192
		Offset: 0x380
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_d9092332(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "obj2points", value);
	}

}

#namespace mp_gamemode_onslaught_2nd_msg;

/*
	Name: register
	Namespace: mp_gamemode_onslaught_2nd_msg
	Checksum: 0x10E10E5
	Offset: 0xF0
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_43514e12();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: mp_gamemode_onslaught_2nd_msg
	Checksum: 0x34E39DA0
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
	Namespace: mp_gamemode_onslaught_2nd_msg
	Checksum: 0x74CB4E3A
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
	Namespace: mp_gamemode_onslaught_2nd_msg
	Checksum: 0xA9AD379B
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
	Name: function_9c1c0811
	Namespace: mp_gamemode_onslaught_2nd_msg
	Checksum: 0xC15FB9C4
	Offset: 0x1C0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_9c1c0811(player, value)
{
	[[ self ]]->function_9c1c0811(player, value);
}

/*
	Name: function_d9092332
	Namespace: mp_gamemode_onslaught_2nd_msg
	Checksum: 0x492D5A37
	Offset: 0x1F0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_d9092332(player, value)
{
	[[ self ]]->function_d9092332(player, value);
}

