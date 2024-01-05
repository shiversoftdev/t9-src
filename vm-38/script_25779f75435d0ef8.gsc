#using scripts\core_common\lui_shared.csc;

class ccp_captured_supplydrop : cluielem
{

	/*
		Name: constructor
		Namespace: ccp_captured_supplydrop
		Checksum: 0x5DA169F6
		Offset: 0x518
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
		Checksum: 0xD2A7BA53
		Offset: 0x980
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
		Checksum: 0x10C77F54
		Offset: 0x7C8
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
		Checksum: 0x9463B42A
		Offset: 0x8A0
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
		Checksum: 0x1A5BEC8A
		Offset: 0x910
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
		Checksum: 0x7886DBF
		Offset: 0x948
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
		Checksum: 0xC320422
		Offset: 0x6B0
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
		Checksum: 0x6F846515
		Offset: 0x830
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
		Checksum: 0x304C9803
		Offset: 0x538
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
		Checksum: 0xCB006D19
		Offset: 0x8D8
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
		Checksum: 0x61C2F74E
		Offset: 0x868
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
		Checksum: 0x62BBE2BD
		Offset: 0x6D8
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
		Checksum: 0x6BFDBE37
		Offset: 0x7F8
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
	Name: function_e8f45066
	Namespace: cp_captured_supplydrop
	Checksum: 0x2A2FCA42
	Offset: 0x130
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_e8f45066()
{
	level notify(72073109);
}

/*
	Name: register
	Namespace: cp_captured_supplydrop
	Checksum: 0xB0295375
	Offset: 0x150
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
	Checksum: 0x39330D52
	Offset: 0x310
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
	Checksum: 0xC1FD25EF
	Offset: 0x350
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
	Checksum: 0x255108DC
	Offset: 0x378
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
	Checksum: 0xEAE39130
	Offset: 0x3A0
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
	Checksum: 0x4436EFFD
	Offset: 0x3C8
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
	Checksum: 0xB56CCDD
	Offset: 0x3F8
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
	Checksum: 0x921C05F3
	Offset: 0x428
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
	Checksum: 0xF06A1C74
	Offset: 0x458
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
	Checksum: 0x733D2BA4
	Offset: 0x488
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
	Checksum: 0x5EF3C6B2
	Offset: 0x4B8
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
	Checksum: 0xEC6D7577
	Offset: 0x4E8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_selector_state(localclientnum, value)
{
	[[ self ]]->set_selector_state(localclientnum, value);
}

