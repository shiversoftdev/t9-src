#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class ccp_captured_supplydrop : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: ccp_captured_supplydrop
		Checksum: 0xE7AEC773
		Offset: 0x378
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: ccp_captured_supplydrop
		Checksum: 0xF8F7F4CC
		Offset: 0x780
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: ccp_captured_supplydrop
		Checksum: 0x6905B833
		Offset: 0x4D8
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
		cluielem::open_luielem(player, flags);
	}

	/*
		Name: set_guardian_count
		Namespace: ccp_captured_supplydrop
		Checksum: 0xCF8F4C31
		Offset: 0x640
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_guardian_count(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "guardian_count", value);
	}

	/*
		Name: set_raps_count
		Namespace: ccp_captured_supplydrop
		Checksum: 0x321F39C8
		Offset: 0x6E0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_raps_count(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "raps_count", value);
	}

	/*
		Name: set_selector_state
		Namespace: ccp_captured_supplydrop
		Checksum: 0x34BCEDA1
		Offset: 0x730
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_selector_state(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "selector_state", value);
	}

	/*
		Name: close
		Namespace: ccp_captured_supplydrop
		Checksum: 0xFEF2F282
		Offset: 0x520
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function close(player)
	{
		cluielem::close_luielem(player);
	}

	/*
		Name: set_wasp_count
		Namespace: ccp_captured_supplydrop
		Checksum: 0xE073D084
		Offset: 0x5A0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_wasp_count(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "wasp_count", value);
	}

	/*
		Name: setup_clientfields
		Namespace: ccp_captured_supplydrop
		Checksum: 0xDBAFF5BF
		Offset: 0x398
		Size: 0x134
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("cp_captured_supplydrop");
		cluielem::add_clientfield("micromissile_count", 1, 2, "int");
		cluielem::add_clientfield("wasp_count", 1, 2, "int");
		cluielem::add_clientfield("rcxd_count", 1, 2, "int");
		cluielem::add_clientfield("guardian_count", 1, 2, "int");
		cluielem::add_clientfield("robot_count", 1, 2, "int");
		cluielem::add_clientfield("raps_count", 1, 2, "int");
		cluielem::add_clientfield("selector_state", 1, 3, "int");
	}

	/*
		Name: set_robot_count
		Namespace: ccp_captured_supplydrop
		Checksum: 0xE537351D
		Offset: 0x690
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_robot_count(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "robot_count", value);
	}

	/*
		Name: set_rcxd_count
		Namespace: ccp_captured_supplydrop
		Checksum: 0x2BE8FC09
		Offset: 0x5F0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_rcxd_count(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "rcxd_count", value);
	}

	/*
		Name: set_micromissile_count
		Namespace: ccp_captured_supplydrop
		Checksum: 0x3806744
		Offset: 0x550
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_micromissile_count(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "micromissile_count", value);
	}

}

#namespace cp_captured_supplydrop;

/*
	Name: function_a666ed95
	Namespace: cp_captured_supplydrop
	Checksum: 0x3B2304BB
	Offset: 0x138
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_a666ed95()
{
	level notify(116379006);
}

/*
	Name: register
	Namespace: cp_captured_supplydrop
	Checksum: 0x72662CEC
	Offset: 0x158
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new ccp_captured_supplydrop();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: cp_captured_supplydrop
	Checksum: 0x22B7D0A0
	Offset: 0x198
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
	Checksum: 0xBEEC1AC2
	Offset: 0x1D8
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
	Checksum: 0xD0CA6291
	Offset: 0x200
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: set_micromissile_count
	Namespace: cp_captured_supplydrop
	Checksum: 0x6CAEED59
	Offset: 0x228
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_micromissile_count(player, value)
{
	[[ self ]]->set_micromissile_count(player, value);
}

/*
	Name: set_wasp_count
	Namespace: cp_captured_supplydrop
	Checksum: 0x5BA9D309
	Offset: 0x258
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_wasp_count(player, value)
{
	[[ self ]]->set_wasp_count(player, value);
}

/*
	Name: set_rcxd_count
	Namespace: cp_captured_supplydrop
	Checksum: 0x6CBF72F3
	Offset: 0x288
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_rcxd_count(player, value)
{
	[[ self ]]->set_rcxd_count(player, value);
}

/*
	Name: set_guardian_count
	Namespace: cp_captured_supplydrop
	Checksum: 0xE834147
	Offset: 0x2B8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_guardian_count(player, value)
{
	[[ self ]]->set_guardian_count(player, value);
}

/*
	Name: set_robot_count
	Namespace: cp_captured_supplydrop
	Checksum: 0xF8D64904
	Offset: 0x2E8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_robot_count(player, value)
{
	[[ self ]]->set_robot_count(player, value);
}

/*
	Name: set_raps_count
	Namespace: cp_captured_supplydrop
	Checksum: 0xAE4E78C
	Offset: 0x318
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_raps_count(player, value)
{
	[[ self ]]->set_raps_count(player, value);
}

/*
	Name: set_selector_state
	Namespace: cp_captured_supplydrop
	Checksum: 0xCEA5B92A
	Offset: 0x348
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_selector_state(player, value)
{
	[[ self ]]->set_selector_state(player, value);
}

