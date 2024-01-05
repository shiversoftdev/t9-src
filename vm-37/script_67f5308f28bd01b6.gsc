#using scripts\core_common\lui_shared.csc;

class class_4868ccea : cluielem
{

	/*
		Name: constructor
		Namespace: namespace_4868ccea
		Checksum: 0xF4E52137
		Offset: 0x3D8
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_4868ccea
		Checksum: 0x40814524
		Offset: 0x658
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_4868ccea
		Checksum: 0xDF1F021A
		Offset: 0x580
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		cluielem::open(localclientnum);
	}

	/*
		Name: function_1ae2ab1b
		Namespace: namespace_4868ccea
		Checksum: 0xE0BDDE62
		Offset: 0x5B0
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_1ae2ab1b(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "wavesText", value);
	}

	/*
		Name: function_32a88912
		Namespace: namespace_4868ccea
		Checksum: 0x21746BDD
		Offset: 0x620
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_32a88912(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "zkillsText", value);
	}

	/*
		Name: register_clientside
		Namespace: namespace_4868ccea
		Checksum: 0xAD2A5848
		Offset: 0x4B0
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function register_clientside()
	{
		cluielem::register_clientside("mp_gamemode_onslaught_endscore_msg");
	}

	/*
		Name: function_5ef55261
		Namespace: namespace_4868ccea
		Checksum: 0xDF4188A0
		Offset: 0x5E8
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_5ef55261(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "eliteKillsText", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_4868ccea
		Checksum: 0x28638287
		Offset: 0x3F8
		Size: 0xAC
		Parameters: 3
		Flags: None
	*/
	function setup_clientfields(var_17be0970, var_5e297271, var_96a56852)
	{
		cluielem::setup_clientfields("mp_gamemode_onslaught_endscore_msg");
		cluielem::function_dcb34c80("string", "wavesText", 1);
		cluielem::function_dcb34c80("string", "eliteKillsText", 1);
		cluielem::function_dcb34c80("string", "zkillsText", 1);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_4868ccea
		Checksum: 0x9C5E540C
		Offset: 0x4D8
		Size: 0x9C
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
		[[ self ]]->set_data(localclientnum, "wavesText", #"");
		[[ self ]]->set_data(localclientnum, "eliteKillsText", #"");
		[[ self ]]->set_data(localclientnum, "zkillsText", #"");
	}

}

#namespace mp_gamemode_onslaught_endscore_msg;

/*
	Name: register
	Namespace: mp_gamemode_onslaught_endscore_msg
	Checksum: 0x1CDF3D2B
	Offset: 0xF8
	Size: 0x18E
	Parameters: 3
	Flags: None
*/
function register(var_17be0970, var_5e297271, var_96a56852)
{
	elem = new class_4868ccea();
	[[ elem ]]->setup_clientfields(var_17be0970, var_5e297271, var_96a56852);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"mp_gamemode_onslaught_endscore_msg"]))
	{
		level.var_ae746e8f[#"mp_gamemode_onslaught_endscore_msg"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"mp_gamemode_onslaught_endscore_msg"]))
	{
		level.var_ae746e8f[#"mp_gamemode_onslaught_endscore_msg"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"mp_gamemode_onslaught_endscore_msg"]))
	{
		level.var_ae746e8f[#"mp_gamemode_onslaught_endscore_msg"] = array(level.var_ae746e8f[#"mp_gamemode_onslaught_endscore_msg"]);
	}
	level.var_ae746e8f[#"mp_gamemode_onslaught_endscore_msg"][level.var_ae746e8f[#"mp_gamemode_onslaught_endscore_msg"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: mp_gamemode_onslaught_endscore_msg
	Checksum: 0x6957223A
	Offset: 0x290
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new class_4868ccea();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: mp_gamemode_onslaught_endscore_msg
	Checksum: 0x77E95CF7
	Offset: 0x2D0
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
	Namespace: mp_gamemode_onslaught_endscore_msg
	Checksum: 0x62F0536F
	Offset: 0x2F8
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
	Namespace: mp_gamemode_onslaught_endscore_msg
	Checksum: 0xE1B569D8
	Offset: 0x320
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: function_1ae2ab1b
	Namespace: mp_gamemode_onslaught_endscore_msg
	Checksum: 0x35A2647D
	Offset: 0x348
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_1ae2ab1b(localclientnum, value)
{
	[[ self ]]->function_1ae2ab1b(localclientnum, value);
}

/*
	Name: function_5ef55261
	Namespace: mp_gamemode_onslaught_endscore_msg
	Checksum: 0xEA1F8CFA
	Offset: 0x378
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_5ef55261(localclientnum, value)
{
	[[ self ]]->function_5ef55261(localclientnum, value);
}

/*
	Name: function_32a88912
	Namespace: mp_gamemode_onslaught_endscore_msg
	Checksum: 0x83C2F447
	Offset: 0x3A8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_32a88912(localclientnum, value)
{
	[[ self ]]->function_32a88912(localclientnum, value);
}

