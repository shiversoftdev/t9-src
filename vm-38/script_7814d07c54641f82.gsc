#using scripts\core_common\lui_shared.csc;

class cvehicleturretdurability : cluielem
{

	/*
		Name: constructor
		Namespace: cvehicleturretdurability
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
		Namespace: cvehicleturretdurability
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
		Namespace: cvehicleturretdurability
		Checksum: 0x8D2E111F
		Offset: 0x440
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		cluielem::open(localclientnum);
	}

	/*
		Name: register_clientside
		Namespace: cvehicleturretdurability
		Checksum: 0x52775501
		Offset: 0x3C8
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function register_clientside()
	{
		cluielem::register_clientside("VehicleTurretDurability");
	}

	/*
		Name: setup_clientfields
		Namespace: cvehicleturretdurability
		Checksum: 0x407ECB1D
		Offset: 0x370
		Size: 0x4C
		Parameters: 1
		Flags: None
	*/
	function setup_clientfields(var_661989d5)
	{
		cluielem::setup_clientfields("VehicleTurretDurability");
		cluielem::add_clientfield("bar_percent", 1, 6, "float", var_661989d5);
	}

	/*
		Name: function_fa582112
		Namespace: cvehicleturretdurability
		Checksum: 0x84E5206D
		Offset: 0x3F0
		Size: 0x48
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
		[[ self ]]->set_data(localclientnum, "bar_percent", 0);
	}

	/*
		Name: set_bar_percent
		Namespace: cvehicleturretdurability
		Checksum: 0x1D0AF15E
		Offset: 0x470
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_bar_percent(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "bar_percent", value);
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
	elem = new cvehicleturretdurability();
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
	Name: register_clientside
	Namespace: vehicleturretdurability
	Checksum: 0xB966FC46
	Offset: 0x268
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new cvehicleturretdurability();
	[[ elem ]]->register_clientside();
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
	Name: set_bar_percent
	Namespace: vehicleturretdurability
	Checksum: 0x9BBCE78F
	Offset: 0x320
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_bar_percent(localclientnum, value)
{
	[[ self ]]->set_bar_percent(localclientnum, value);
}

