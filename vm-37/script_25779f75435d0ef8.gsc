#using scripts\core_common\lui_shared.csc;

class ccp_captured_supplydrop : cluielem
{

	/*
		Name: constructor
		Namespace: ccp_captured_supplydrop
		Checksum: 0x12DE65E6
		Offset: 0x4F8
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
		Checksum: 0x4FA3F90
		Offset: 0x960
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
		Checksum: 0x755214E0
		Offset: 0x7A8
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		cluielem::open(localclientnum);
	}

	/*
		Name: set_guardian_count
		Namespace: ccp_captured_supplydrop
		Checksum: 0x7AEEFEC7
		Offset: 0x880
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_guardian_count(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "guardian_count", value);
	}

	/*
		Name: set_raps_count
		Namespace: ccp_captured_supplydrop
		Checksum: 0x845363D5
		Offset: 0x8F0
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_raps_count(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "raps_count", value);
	}

	/*
		Name: set_selector_state
		Namespace: ccp_captured_supplydrop
		Checksum: 0x87C4E86E
		Offset: 0x928
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_selector_state(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "selector_state", value);
	}

	/*
		Name: register_clientside
		Namespace: ccp_captured_supplydrop
		Checksum: 0xB8437ECA
		Offset: 0x690
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function register_clientside()
	{
		cluielem::register_clientside("cp_captured_supplydrop");
	}

	/*
		Name: set_wasp_count
		Namespace: ccp_captured_supplydrop
		Checksum: 0x8CAFE6C4
		Offset: 0x810
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_wasp_count(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "wasp_count", value);
	}

	/*
		Name: setup_clientfields
		Namespace: ccp_captured_supplydrop
		Checksum: 0xE9E3300E
		Offset: 0x518
		Size: 0x16C
		Parameters: 7
		Flags: None
	*/
	function setup_clientfields(var_e4f88108, var_a5022382, var_cad0ba31, var_dc5e3aea, var_efc8a38a, var_28bdc188, var_61794ad8)
	{
		cluielem::setup_clientfields("cp_captured_supplydrop");
		cluielem::add_clientfield("micromissile_count", 1, 2, "int", var_e4f88108);
		cluielem::add_clientfield("wasp_count", 1, 2, "int", var_a5022382);
		cluielem::add_clientfield("rcxd_count", 1, 2, "int", var_cad0ba31);
		cluielem::add_clientfield("guardian_count", 1, 2, "int", var_dc5e3aea);
		cluielem::add_clientfield("robot_count", 1, 2, "int", var_efc8a38a);
		cluielem::add_clientfield("raps_count", 1, 2, "int", var_28bdc188);
		cluielem::add_clientfield("selector_state", 1, 3, "int", var_61794ad8);
	}

	/*
		Name: set_robot_count
		Namespace: ccp_captured_supplydrop
		Checksum: 0xE4B25C74
		Offset: 0x8B8
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_robot_count(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "robot_count", value);
	}

	/*
		Name: set_rcxd_count
		Namespace: ccp_captured_supplydrop
		Checksum: 0x7D65DF6E
		Offset: 0x848
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_rcxd_count(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "rcxd_count", value);
	}

	/*
		Name: function_fa582112
		Namespace: ccp_captured_supplydrop
		Checksum: 0x98E89751
		Offset: 0x6B8
		Size: 0xE8
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
		[[ self ]]->set_data(localclientnum, "micromissile_count", 0);
		[[ self ]]->set_data(localclientnum, "wasp_count", 0);
		[[ self ]]->set_data(localclientnum, "rcxd_count", 0);
		[[ self ]]->set_data(localclientnum, "guardian_count", 0);
		[[ self ]]->set_data(localclientnum, "robot_count", 0);
		[[ self ]]->set_data(localclientnum, "raps_count", 0);
		[[ self ]]->set_data(localclientnum, "selector_state", 0);
	}

	/*
		Name: set_micromissile_count
		Namespace: ccp_captured_supplydrop
		Checksum: 0x6388583D
		Offset: 0x7D8
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_micromissile_count(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "micromissile_count", value);
	}

}

#namespace cp_captured_supplydrop;

/*
	Name: register
	Namespace: cp_captured_supplydrop
	Checksum: 0xD05C527
	Offset: 0x130
	Size: 0x1B6
	Parameters: 7
	Flags: None
*/
function register(var_e4f88108, var_a5022382, var_cad0ba31, var_dc5e3aea, var_efc8a38a, var_28bdc188, var_61794ad8)
{
	elem = new ccp_captured_supplydrop();
	[[ elem ]]->setup_clientfields(var_e4f88108, var_a5022382, var_cad0ba31, var_dc5e3aea, var_efc8a38a, var_28bdc188, var_61794ad8);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"cp_captured_supplydrop"]))
	{
		level.var_ae746e8f[#"cp_captured_supplydrop"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"cp_captured_supplydrop"]))
	{
		level.var_ae746e8f[#"cp_captured_supplydrop"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"cp_captured_supplydrop"]))
	{
		level.var_ae746e8f[#"cp_captured_supplydrop"] = array(level.var_ae746e8f[#"cp_captured_supplydrop"]);
	}
	level.var_ae746e8f[#"cp_captured_supplydrop"][level.var_ae746e8f[#"cp_captured_supplydrop"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: cp_captured_supplydrop
	Checksum: 0xA33E4FDB
	Offset: 0x2F0
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new ccp_captured_supplydrop();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: cp_captured_supplydrop
	Checksum: 0xB7FBAE8C
	Offset: 0x330
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function open(player)
{
	[[ self ]]->open(player);
}

/*
	Name: close
	Namespace: cp_captured_supplydrop
	Checksum: 0xC44D248D
	Offset: 0x358
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
	Checksum: 0x7401E0A1
	Offset: 0x380
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: set_micromissile_count
	Namespace: cp_captured_supplydrop
	Checksum: 0x8B1BACBA
	Offset: 0x3A8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_micromissile_count(localclientnum, value)
{
	[[ self ]]->set_micromissile_count(localclientnum, value);
}

/*
	Name: set_wasp_count
	Namespace: cp_captured_supplydrop
	Checksum: 0xEE4A149C
	Offset: 0x3D8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_wasp_count(localclientnum, value)
{
	[[ self ]]->set_wasp_count(localclientnum, value);
}

/*
	Name: set_rcxd_count
	Namespace: cp_captured_supplydrop
	Checksum: 0x40100657
	Offset: 0x408
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_rcxd_count(localclientnum, value)
{
	[[ self ]]->set_rcxd_count(localclientnum, value);
}

/*
	Name: set_guardian_count
	Namespace: cp_captured_supplydrop
	Checksum: 0x66750C2B
	Offset: 0x438
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_guardian_count(localclientnum, value)
{
	[[ self ]]->set_guardian_count(localclientnum, value);
}

/*
	Name: set_robot_count
	Namespace: cp_captured_supplydrop
	Checksum: 0x6A550F87
	Offset: 0x468
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_robot_count(localclientnum, value)
{
	[[ self ]]->set_robot_count(localclientnum, value);
}

/*
	Name: set_raps_count
	Namespace: cp_captured_supplydrop
	Checksum: 0xA8A9787C
	Offset: 0x498
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_raps_count(localclientnum, value)
{
	[[ self ]]->set_raps_count(localclientnum, value);
}

/*
	Name: set_selector_state
	Namespace: cp_captured_supplydrop
	Checksum: 0x4C61501A
	Offset: 0x4C8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_selector_state(localclientnum, value)
{
	[[ self ]]->set_selector_state(localclientnum, value);
}

