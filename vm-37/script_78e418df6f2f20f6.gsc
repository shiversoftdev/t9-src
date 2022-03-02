#using scripts\core_common\lui_shared.csc;

class class_442ed2b4 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_442ed2b4
		Checksum: 0x8B23F4C
		Offset: 0x340
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_442ed2b4
		Checksum: 0x8A460354
		Offset: 0x4A0
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_442ed2b4
		Checksum: 0x7705ECE4
		Offset: 0x438
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
		Namespace: namespace_442ed2b4
		Checksum: 0xC6264817
		Offset: 0x3B8
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("mp_gamemode_onslaught_bossalert_msg");
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_442ed2b4
		Checksum: 0xE3334427
		Offset: 0x360
		Size: 0x4C
		Parameters: 1
		Flags: None
	*/
	function setup_clientfields(var_ef8933e3)
	{
		namespace_6aaccc24::setup_clientfields("mp_gamemode_onslaught_bossalert_msg");
		namespace_6aaccc24::function_dcb34c80("string", "bossAlertText", 1);
	}

	/*
		Name: function_b73d2d7c
		Namespace: namespace_442ed2b4
		Checksum: 0xCEF7CB65
		Offset: 0x468
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_b73d2d7c(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "bossAlertText", value);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_442ed2b4
		Checksum: 0x2E616A33
		Offset: 0x3E0
		Size: 0x4C
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
		[[ self ]]->function_d7d2fcce(localclientnum, "bossAlertText", #"");
	}

}

#namespace mp_gamemode_onslaught_bossalert_msg;

/*
	Name: register
	Namespace: mp_gamemode_onslaught_bossalert_msg
	Checksum: 0x718606F4
	Offset: 0xD8
	Size: 0x176
	Parameters: 1
	Flags: None
*/
function register(var_ef8933e3)
{
	elem = new class_442ed2b4();
	[[ elem ]]->setup_clientfields(var_ef8933e3);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"mp_gamemode_onslaught_bossalert_msg"]))
	{
		level.var_ae746e8f[#"mp_gamemode_onslaught_bossalert_msg"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"mp_gamemode_onslaught_bossalert_msg"]))
	{
		level.var_ae746e8f[#"mp_gamemode_onslaught_bossalert_msg"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"mp_gamemode_onslaught_bossalert_msg"]))
	{
		level.var_ae746e8f[#"mp_gamemode_onslaught_bossalert_msg"] = array(level.var_ae746e8f[#"mp_gamemode_onslaught_bossalert_msg"]);
	}
	level.var_ae746e8f[#"mp_gamemode_onslaught_bossalert_msg"][level.var_ae746e8f[#"mp_gamemode_onslaught_bossalert_msg"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: mp_gamemode_onslaught_bossalert_msg
	Checksum: 0x2A8F6F7F
	Offset: 0x258
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_442ed2b4();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: mp_gamemode_onslaught_bossalert_msg
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
	Namespace: mp_gamemode_onslaught_bossalert_msg
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
	Namespace: mp_gamemode_onslaught_bossalert_msg
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
	Name: function_b73d2d7c
	Namespace: mp_gamemode_onslaught_bossalert_msg
	Checksum: 0xC7D61015
	Offset: 0x310
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_b73d2d7c(localclientnum, value)
{
	[[ self ]]->function_b73d2d7c(localclientnum, value);
}

