#using scripts\core_common\lui_shared.csc;

class class_366ba496 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_366ba496
		Checksum: 0xBB8B89DC
		Offset: 0x330
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
		Checksum: 0x5ABD7451
		Offset: 0x488
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
		Checksum: 0x3F68C410
		Offset: 0x420
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
		Checksum: 0xD58E1886
		Offset: 0x3A8
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
		Checksum: 0x1E56265A
		Offset: 0x350
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
		Checksum: 0x29AC1D3F
		Offset: 0x3D0
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
		Checksum: 0x6CE6C153
		Offset: 0x450
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
	Name: register
	Namespace: vehicleturretdurability
	Checksum: 0xE52F21D9
	Offset: 0xC8
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
	Checksum: 0xE0743893
	Offset: 0x248
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
	Checksum: 0xA8E7306E
	Offset: 0x288
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
	Checksum: 0x4FEA3E8B
	Offset: 0x2B0
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
	Checksum: 0xE1ACBCAD
	Offset: 0x2D8
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
	Checksum: 0xA2AA909C
	Offset: 0x300
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_fd8c13fb(localclientnum, value)
{
	[[ self ]]->function_fd8c13fb(localclientnum, value);
}

