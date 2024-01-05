#using scripts\core_common\lui_shared.csc;

class cvehicleturretoverheat : cluielem
{

	/*
		Name: constructor
		Namespace: cvehicleturretoverheat
		Checksum: 0x65C4FF7C
		Offset: 0x390
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
		Checksum: 0x2F909BAF
		Offset: 0x5E8
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
		Checksum: 0x971B8ACD
		Offset: 0x4C8
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
		Checksum: 0xF6A11C77
		Offset: 0x430
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
		Checksum: 0x4719A6BC
		Offset: 0x3B0
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
		Checksum: 0xB2C68AA4
		Offset: 0x4F8
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
		Checksum: 0x5C6F6C68
		Offset: 0x458
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
		Checksum: 0x2E9D86BF
		Offset: 0x5B0
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
	Name: function_7a6f549c
	Namespace: vehicleturretoverheat
	Checksum: 0xA88855F9
	Offset: 0xD8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_7a6f549c()
{
	level notify(239947989);
}

/*
	Name: register
	Namespace: vehicleturretoverheat
	Checksum: 0x35B74964
	Offset: 0xF8
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
	Checksum: 0x6301106A
	Offset: 0x278
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
	Checksum: 0xAB7C1ABF
	Offset: 0x2B8
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
	Checksum: 0x2C2BB37
	Offset: 0x2E0
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
	Checksum: 0x71B19878
	Offset: 0x308
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
	Checksum: 0xA72CA68F
	Offset: 0x330
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
	Checksum: 0xD20D0EDD
	Offset: 0x360
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_bar_percent(localclientnum, value)
{
	[[ self ]]->set_bar_percent(localclientnum, value);
}

