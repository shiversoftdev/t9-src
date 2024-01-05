#using scripts\core_common\lui_shared.csc;

class cvehicleturretoverheat : cluielem
{

	/*
		Name: constructor
		Namespace: cvehicleturretoverheat
		Checksum: 0x360A6CDE
		Offset: 0x370
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cvehicleturretoverheat
		Checksum: 0xC6E89526
		Offset: 0x5C8
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: cvehicleturretoverheat
		Checksum: 0x9573B5DB
		Offset: 0x4A8
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
		Namespace: cvehicleturretoverheat
		Checksum: 0xA4308DB3
		Offset: 0x410
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function register_clientside()
	{
		cluielem::register_clientside("VehicleTurretOverheat");
	}

	/*
		Name: setup_clientfields
		Namespace: cvehicleturretoverheat
		Checksum: 0x3700E6BE
		Offset: 0x390
		Size: 0x74
		Parameters: 1
		Flags: None
	*/
	function setup_clientfields(var_661989d5)
	{
		cluielem::setup_clientfields("VehicleTurretOverheat");
		cluielem::add_clientfield("_state", 1, 1, "int");
		cluielem::add_clientfield("bar_percent", 1, 6, "float", var_661989d5);
	}

	/*
		Name: set_state
		Namespace: cvehicleturretoverheat
		Checksum: 0x732A4FA7
		Offset: 0x4D8
		Size: 0xAC
		Parameters: 2
		Flags: None
	*/
	function set_state(localclientnum, state_name)
	{
		if(#"defaultstate" == state_name)
		{
			[[ self ]]->set_data(localclientnum, "_state", 0);
		}
		else
		{
			if(#"overheat" == state_name)
			{
				[[ self ]]->set_data(localclientnum, "_state", 1);
			}
			else
			{
				/#
					assertmsg("");
				#/
				/#
				#/
			}
		}
	}

	/*
		Name: function_fa582112
		Namespace: cvehicleturretoverheat
		Checksum: 0xFD40AB06
		Offset: 0x438
		Size: 0x68
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
		[[ self ]]->set_state(localclientnum, #"defaultstate");
		[[ self ]]->set_data(localclientnum, "bar_percent", 0);
	}

	/*
		Name: set_bar_percent
		Namespace: cvehicleturretoverheat
		Checksum: 0xDBB13155
		Offset: 0x590
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_bar_percent(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "bar_percent", value);
	}

}

#namespace vehicleturretoverheat;

/*
	Name: register
	Namespace: vehicleturretoverheat
	Checksum: 0xC1FA0EA8
	Offset: 0xD8
	Size: 0x176
	Parameters: 1
	Flags: None
*/
function register(var_661989d5)
{
	elem = new cvehicleturretoverheat();
	[[ elem ]]->setup_clientfields(var_661989d5);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"vehicleturretoverheat"]))
	{
		level.var_ae746e8f[#"vehicleturretoverheat"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"vehicleturretoverheat"]))
	{
		level.var_ae746e8f[#"vehicleturretoverheat"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"vehicleturretoverheat"]))
	{
		level.var_ae746e8f[#"vehicleturretoverheat"] = array(level.var_ae746e8f[#"vehicleturretoverheat"]);
	}
	level.var_ae746e8f[#"vehicleturretoverheat"][level.var_ae746e8f[#"vehicleturretoverheat"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: vehicleturretoverheat
	Checksum: 0xD2F681AA
	Offset: 0x258
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new cvehicleturretoverheat();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: vehicleturretoverheat
	Checksum: 0xA013B51C
	Offset: 0x298
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
	Namespace: vehicleturretoverheat
	Checksum: 0x26818F9B
	Offset: 0x2C0
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
	Namespace: vehicleturretoverheat
	Checksum: 0x4631A662
	Offset: 0x2E8
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: set_state
	Namespace: vehicleturretoverheat
	Checksum: 0x25E5CC91
	Offset: 0x310
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_state(localclientnum, state_name)
{
	[[ self ]]->set_state(localclientnum, state_name);
}

/*
	Name: set_bar_percent
	Namespace: vehicleturretoverheat
	Checksum: 0x1551F3EB
	Offset: 0x340
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_bar_percent(localclientnum, value)
{
	[[ self ]]->set_bar_percent(localclientnum, value);
}

