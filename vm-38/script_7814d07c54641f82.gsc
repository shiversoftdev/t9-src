#using scripts\core_common\lui_shared.csc;

class class_366ba496 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_366ba496
		Checksum: 0xCA5E39AD
		Offset: 0x350
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_366ba496
		Checksum: 0x3D6E3C51
		Offset: 0x4A8
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_366ba496
		Checksum: 0x8D2E111F
		Offset: 0x440
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		namespace_6aaccc24::open(localclientnum);
	}

	/*
		Name: function_5c1bb138
		Namespace: namespace_366ba496
		Checksum: 0x52775501
		Offset: 0x3C8
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("VehicleTurretDurability");
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_366ba496
		Checksum: 0x407ECB1D
		Offset: 0x370
		Size: 0x4C
		Parameters: 1
		Flags: None
	*/
	function setup_clientfields(var_661989d5)
	{
		namespace_6aaccc24::setup_clientfields("VehicleTurretDurability");
		namespace_6aaccc24::function_da693cbe("bar_percent", 1, 6, "float", var_661989d5);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_366ba496
		Checksum: 0x84E5206D
		Offset: 0x3F0
		Size: 0x48
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
		[[ self ]]->function_d7d2fcce(localclientnum, "bar_percent", 0);
	}

	/*
		Name: function_fd8c13fb
		Namespace: namespace_366ba496
		Checksum: 0x1D0AF15E
		Offset: 0x470
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_fd8c13fb(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "bar_percent", value);
	}

}

#namespace vehicleturretdurability;

/*
	Name: function_7d5b9412
	Namespace: vehicleturretdurability
	Checksum: 0x176AF50B
	Offset: 0xC8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_7d5b9412()
{
	level notify(1014101081);
}

/*
	Name: register
	Namespace: vehicleturretdurability
	Checksum: 0x92EFA890
	Offset: 0xE8
	Size: 0x176
	Parameters: 1
	Flags: None
*/
function register(var_661989d5)
{
	elem = new class_366ba496();
	[[ elem ]]->setup_clientfields(var_661989d5);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"vehicleturretdurability"]))
	{
		level.var_ae746e8f[#"vehicleturretdurability"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"vehicleturretdurability"]))
	{
		level.var_ae746e8f[#"vehicleturretdurability"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"vehicleturretdurability"]))
	{
		level.var_ae746e8f[#"vehicleturretdurability"] = array(level.var_ae746e8f[#"vehicleturretdurability"]);
	}
	level.var_ae746e8f[#"vehicleturretdurability"][level.var_ae746e8f[#"vehicleturretdurability"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: vehicleturretdurability
	Checksum: 0xB966FC46
	Offset: 0x268
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_366ba496();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: vehicleturretdurability
	Checksum: 0x50C9B987
	Offset: 0x2A8
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
	Namespace: vehicleturretdurability
	Checksum: 0x1F42E9D6
	Offset: 0x2D0
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
	Namespace: vehicleturretdurability
	Checksum: 0x715ED0C4
	Offset: 0x2F8
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: function_fd8c13fb
	Namespace: vehicleturretdurability
	Checksum: 0x9BBCE78F
	Offset: 0x320
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_fd8c13fb(localclientnum, value)
{
	[[ self ]]->function_fd8c13fb(localclientnum, value);
}

