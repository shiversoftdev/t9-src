#using scripts\core_common\lui_shared.csc;

class class_43514e12 : cluielem
{

	/*
		Name: constructor
		Namespace: namespace_43514e12
		Checksum: 0xDDCEE5BF
		Offset: 0x388
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
		Checksum: 0x945851AC
		Offset: 0x568
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
		Checksum: 0xFF6ED41B
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
		Namespace: namespace_43514e12
		Checksum: 0xA4561151
		Offset: 0x430
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function register_clientside()
	{
		cluielem::register_clientside("mp_gamemode_onslaught_2nd_msg");
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_43514e12
		Checksum: 0x77288CC0
		Offset: 0x3A8
		Size: 0x7C
		Parameters: 2
		Flags: None
	*/
	function setup_clientfields(var_61963aa5, var_242b1cea)
	{
		cluielem::setup_clientfields("mp_gamemode_onslaught_2nd_msg");
		cluielem::function_dcb34c80("string", "objective2Text", 1);
		cluielem::add_clientfield("obj2points", 1, 11, "int", var_242b1cea);
	}

	/*
		Name: set_objective2text
		Namespace: namespace_43514e12
		Checksum: 0x315DBB54
		Offset: 0x4F8
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_objective2text(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "objective2Text", value);
	}

	/*
		Name: function_d9092332
		Namespace: namespace_43514e12
		Checksum: 0x4CC3467F
		Offset: 0x530
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_d9092332(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "obj2points", value);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_43514e12
		Checksum: 0xCED850F2
		Offset: 0x458
		Size: 0x68
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
		[[ self ]]->set_data(localclientnum, "objective2Text", #"");
		[[ self ]]->set_data(localclientnum, "obj2points", 0);
	}

}

#namespace mp_gamemode_onslaught_2nd_msg;

/*
	Name: register
	Namespace: mp_gamemode_onslaught_2nd_msg
	Checksum: 0xF8FBB387
	Offset: 0xE8
	Size: 0x17E
	Parameters: 2
	Flags: None
*/
function register(var_61963aa5, var_242b1cea)
{
	elem = new class_43514e12();
	[[ elem ]]->setup_clientfields(var_61963aa5, var_242b1cea);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"mp_gamemode_onslaught_2nd_msg"]))
	{
		level.var_ae746e8f[#"mp_gamemode_onslaught_2nd_msg"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"mp_gamemode_onslaught_2nd_msg"]))
	{
		level.var_ae746e8f[#"mp_gamemode_onslaught_2nd_msg"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"mp_gamemode_onslaught_2nd_msg"]))
	{
		level.var_ae746e8f[#"mp_gamemode_onslaught_2nd_msg"] = array(level.var_ae746e8f[#"mp_gamemode_onslaught_2nd_msg"]);
	}
	level.var_ae746e8f[#"mp_gamemode_onslaught_2nd_msg"][level.var_ae746e8f[#"mp_gamemode_onslaught_2nd_msg"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: mp_gamemode_onslaught_2nd_msg
	Checksum: 0xB5F803AF
	Offset: 0x270
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new class_43514e12();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: mp_gamemode_onslaught_2nd_msg
	Checksum: 0xFEAE6ECB
	Offset: 0x2B0
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
	Namespace: mp_gamemode_onslaught_2nd_msg
	Checksum: 0xED3935EA
	Offset: 0x2D8
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
	Checksum: 0x63E2A6A4
	Offset: 0x300
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: set_objective2text
	Namespace: mp_gamemode_onslaught_2nd_msg
	Checksum: 0x899119BF
	Offset: 0x328
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_objective2text(localclientnum, value)
{
	[[ self ]]->set_objective2text(localclientnum, value);
}

/*
	Name: function_d9092332
	Namespace: mp_gamemode_onslaught_2nd_msg
	Checksum: 0x5570C7B5
	Offset: 0x358
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_d9092332(localclientnum, value)
{
	[[ self ]]->function_d9092332(localclientnum, value);
}

