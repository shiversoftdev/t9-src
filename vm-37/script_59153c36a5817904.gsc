#using scripts\core_common\lui_shared.csc;

class class_c24030b9 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_c24030b9
		Checksum: 0x2EE5231B
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
		Namespace: namespace_c24030b9
		Checksum: 0x53DF2B70
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
		Namespace: namespace_c24030b9
		Checksum: 0x4544E379
		Offset: 0x4C8
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		namespace_6aaccc24::open(localclientnum);
	}

	/*
		Name: function_54166b84
		Namespace: namespace_c24030b9
		Checksum: 0x25BE08F1
		Offset: 0x530
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_54166b84(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "objpoints", value);
	}

	/*
		Name: function_5c1bb138
		Namespace: namespace_c24030b9
		Checksum: 0xD706ED8B
		Offset: 0x430
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("mp_gamemode_onslaught_msg");
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_c24030b9
		Checksum: 0xB9CAAB57
		Offset: 0x3A8
		Size: 0x7C
		Parameters: 2
		Flags: None
	*/
	function setup_clientfields(var_a584bc49, var_ea26adc8)
	{
		namespace_6aaccc24::setup_clientfields("mp_gamemode_onslaught_msg");
		namespace_6aaccc24::function_dcb34c80("string", "objectiveText", 1);
		namespace_6aaccc24::function_da693cbe("objpoints", 1, 11, "int", var_ea26adc8);
	}

	/*
		Name: function_eab3d36f
		Namespace: namespace_c24030b9
		Checksum: 0x13515163
		Offset: 0x4F8
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_eab3d36f(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "objectiveText", value);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_c24030b9
		Checksum: 0x255AF47F
		Offset: 0x458
		Size: 0x68
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
		[[ self ]]->function_d7d2fcce(localclientnum, "objectiveText", #"");
		[[ self ]]->function_d7d2fcce(localclientnum, "objpoints", 0);
	}

}

#namespace mp_gamemode_onslaught_msg;

/*
	Name: register
	Namespace: mp_gamemode_onslaught_msg
	Checksum: 0x22AEAEED
	Offset: 0xE8
	Size: 0x17E
	Parameters: 2
	Flags: None
*/
function register(var_a584bc49, var_ea26adc8)
{
	elem = new class_c24030b9();
	[[ elem ]]->setup_clientfields(var_a584bc49, var_ea26adc8);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"mp_gamemode_onslaught_msg"]))
	{
		level.var_ae746e8f[#"mp_gamemode_onslaught_msg"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"mp_gamemode_onslaught_msg"]))
	{
		level.var_ae746e8f[#"mp_gamemode_onslaught_msg"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"mp_gamemode_onslaught_msg"]))
	{
		level.var_ae746e8f[#"mp_gamemode_onslaught_msg"] = array(level.var_ae746e8f[#"mp_gamemode_onslaught_msg"]);
	}
	level.var_ae746e8f[#"mp_gamemode_onslaught_msg"][level.var_ae746e8f[#"mp_gamemode_onslaught_msg"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: mp_gamemode_onslaught_msg
	Checksum: 0xBB1C0163
	Offset: 0x270
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_c24030b9();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: mp_gamemode_onslaught_msg
	Checksum: 0xD35DC318
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
	Namespace: mp_gamemode_onslaught_msg
	Checksum: 0x4CDEE7E1
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
	Namespace: mp_gamemode_onslaught_msg
	Checksum: 0xB9C01C71
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
	Name: function_eab3d36f
	Namespace: mp_gamemode_onslaught_msg
	Checksum: 0x43CFC641
	Offset: 0x328
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_eab3d36f(localclientnum, value)
{
	[[ self ]]->function_eab3d36f(localclientnum, value);
}

/*
	Name: function_54166b84
	Namespace: mp_gamemode_onslaught_msg
	Checksum: 0xA68832F9
	Offset: 0x358
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_54166b84(localclientnum, value)
{
	[[ self ]]->function_54166b84(localclientnum, value);
}

