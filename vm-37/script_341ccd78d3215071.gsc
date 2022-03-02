#using scripts\core_common\lui_shared.csc;

class class_d1ed471a : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_d1ed471a
		Checksum: 0x2EE5231B
		Offset: 0x378
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_d1ed471a
		Checksum: 0xFAF73EB9
		Offset: 0x560
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_d1ed471a
		Checksum: 0xE6D18C41
		Offset: 0x4C0
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
		Namespace: namespace_d1ed471a
		Checksum: 0x1B878BD3
		Offset: 0x420
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("zm_gold_hud");
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_d1ed471a
		Checksum: 0xE623216F
		Offset: 0x398
		Size: 0x7C
		Parameters: 2
		Flags: None
	*/
	function setup_clientfields(var_ad2e14b, var_ffd97b17)
	{
		namespace_6aaccc24::setup_clientfields("zm_gold_hud");
		namespace_6aaccc24::function_da693cbe("showTerminal", 1000, 1, "int", var_ffd97b17);
		namespace_6aaccc24::function_dcb34c80("string", "satelliteInfo", 1000);
	}

	/*
		Name: function_9dc41635
		Namespace: namespace_d1ed471a
		Checksum: 0x8C6D76A5
		Offset: 0x4F0
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_9dc41635(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "showTerminal", value);
	}

	/*
		Name: function_f308d6bb
		Namespace: namespace_d1ed471a
		Checksum: 0xE6650243
		Offset: 0x528
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_f308d6bb(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "satelliteInfo", value);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_d1ed471a
		Checksum: 0xF58D05E5
		Offset: 0x448
		Size: 0x6C
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
		[[ self ]]->function_d7d2fcce(localclientnum, "showTerminal", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "satelliteInfo", #"");
	}

}

#namespace namespace_82d7691b;

/*
	Name: register
	Namespace: namespace_82d7691b
	Checksum: 0xC40DA770
	Offset: 0xD8
	Size: 0x17E
	Parameters: 2
	Flags: None
*/
function register(var_ad2e14b, var_ffd97b17)
{
	elem = new class_d1ed471a();
	[[ elem ]]->setup_clientfields(var_ad2e14b, var_ffd97b17);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"hash_270f51c6d631dccd"]))
	{
		level.var_ae746e8f[#"hash_270f51c6d631dccd"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"hash_270f51c6d631dccd"]))
	{
		level.var_ae746e8f[#"hash_270f51c6d631dccd"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"hash_270f51c6d631dccd"]))
	{
		level.var_ae746e8f[#"hash_270f51c6d631dccd"] = array(level.var_ae746e8f[#"hash_270f51c6d631dccd"]);
	}
	level.var_ae746e8f[#"hash_270f51c6d631dccd"][level.var_ae746e8f[#"hash_270f51c6d631dccd"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: namespace_82d7691b
	Checksum: 0x43A289C3
	Offset: 0x260
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_d1ed471a();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: namespace_82d7691b
	Checksum: 0x2452FC06
	Offset: 0x2A0
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
	Namespace: namespace_82d7691b
	Checksum: 0xFE1506A9
	Offset: 0x2C8
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
	Namespace: namespace_82d7691b
	Checksum: 0xC80CA57E
	Offset: 0x2F0
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: function_9dc41635
	Namespace: namespace_82d7691b
	Checksum: 0xD9E4F7F6
	Offset: 0x318
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_9dc41635(localclientnum, value)
{
	[[ self ]]->function_9dc41635(localclientnum, value);
}

/*
	Name: function_f308d6bb
	Namespace: namespace_82d7691b
	Checksum: 0x784B59E6
	Offset: 0x348
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_f308d6bb(localclientnum, value)
{
	[[ self ]]->function_f308d6bb(localclientnum, value);
}

