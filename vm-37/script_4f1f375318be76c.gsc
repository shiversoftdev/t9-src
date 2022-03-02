#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_35ee22bc : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_35ee22bc
		Checksum: 0x23B9BBC3
		Offset: 0x358
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_35ee22bc
		Checksum: 0x2BA4236B
		Offset: 0x760
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_35ee22bc
		Checksum: 0xE4B5600
		Offset: 0x4B8
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
		Name: function_16715e9f
		Namespace: namespace_35ee22bc
		Checksum: 0xDBE6364B
		Offset: 0x620
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_16715e9f(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "guardian_count", value);
	}

	/*
		Name: function_191323ee
		Namespace: namespace_35ee22bc
		Checksum: 0x8AFC68B8
		Offset: 0x6C0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_191323ee(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "raps_count", value);
	}

	/*
		Name: function_461034d2
		Namespace: namespace_35ee22bc
		Checksum: 0xDBE11312
		Offset: 0x710
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_461034d2(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "selector_state", value);
	}

	/*
		Name: close
		Namespace: namespace_35ee22bc
		Checksum: 0xE26F98BF
		Offset: 0x500
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function close(player)
	{
		namespace_6aaccc24::function_a68f6e20(player);
	}

	/*
		Name: function_69d88480
		Namespace: namespace_35ee22bc
		Checksum: 0xA424ECB6
		Offset: 0x580
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_69d88480(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "wasp_count", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_35ee22bc
		Checksum: 0xC2DD1CFC
		Offset: 0x378
		Size: 0x134
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("cp_captured_supplydrop");
		namespace_6aaccc24::function_da693cbe("micromissile_count", 1, 2, "int");
		namespace_6aaccc24::function_da693cbe("wasp_count", 1, 2, "int");
		namespace_6aaccc24::function_da693cbe("rcxd_count", 1, 2, "int");
		namespace_6aaccc24::function_da693cbe("guardian_count", 1, 2, "int");
		namespace_6aaccc24::function_da693cbe("robot_count", 1, 2, "int");
		namespace_6aaccc24::function_da693cbe("raps_count", 1, 2, "int");
		namespace_6aaccc24::function_da693cbe("selector_state", 1, 3, "int");
	}

	/*
		Name: function_de1ece9c
		Namespace: namespace_35ee22bc
		Checksum: 0x4700F549
		Offset: 0x670
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_de1ece9c(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "robot_count", value);
	}

	/*
		Name: function_ebe4fe7a
		Namespace: namespace_35ee22bc
		Checksum: 0x178E156F
		Offset: 0x5D0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_ebe4fe7a(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "rcxd_count", value);
	}

	/*
		Name: function_fdfe76bb
		Namespace: namespace_35ee22bc
		Checksum: 0xE3DAD296
		Offset: 0x530
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_fdfe76bb(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "micromissile_count", value);
	}

}

#namespace cp_captured_supplydrop;

/*
	Name: register
	Namespace: cp_captured_supplydrop
	Checksum: 0x73A1915C
	Offset: 0x138
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_35ee22bc();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: cp_captured_supplydrop
	Checksum: 0xB2724536
	Offset: 0x178
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
	Namespace: cp_captured_supplydrop
	Checksum: 0xA6D7C1EF
	Offset: 0x1B8
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
	Namespace: cp_captured_supplydrop
	Checksum: 0x3D187C10
	Offset: 0x1E0
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: function_fdfe76bb
	Namespace: cp_captured_supplydrop
	Checksum: 0x54ED268
	Offset: 0x208
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_fdfe76bb(player, value)
{
	[[ self ]]->function_fdfe76bb(player, value);
}

/*
	Name: function_69d88480
	Namespace: cp_captured_supplydrop
	Checksum: 0x2E76641B
	Offset: 0x238
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_69d88480(player, value)
{
	[[ self ]]->function_69d88480(player, value);
}

/*
	Name: function_ebe4fe7a
	Namespace: cp_captured_supplydrop
	Checksum: 0x2CB527B5
	Offset: 0x268
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_ebe4fe7a(player, value)
{
	[[ self ]]->function_ebe4fe7a(player, value);
}

/*
	Name: function_16715e9f
	Namespace: cp_captured_supplydrop
	Checksum: 0x9E06E781
	Offset: 0x298
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_16715e9f(player, value)
{
	[[ self ]]->function_16715e9f(player, value);
}

/*
	Name: function_de1ece9c
	Namespace: cp_captured_supplydrop
	Checksum: 0xD2B81092
	Offset: 0x2C8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_de1ece9c(player, value)
{
	[[ self ]]->function_de1ece9c(player, value);
}

/*
	Name: function_191323ee
	Namespace: cp_captured_supplydrop
	Checksum: 0x2A358184
	Offset: 0x2F8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_191323ee(player, value)
{
	[[ self ]]->function_191323ee(player, value);
}

/*
	Name: function_461034d2
	Namespace: cp_captured_supplydrop
	Checksum: 0x591EB082
	Offset: 0x328
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_461034d2(player, value)
{
	[[ self ]]->function_461034d2(player, value);
}

