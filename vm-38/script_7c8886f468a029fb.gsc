#using scripts\core_common\lui_shared.csc;

class class_90c2e4ec : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_90c2e4ec
		Checksum: 0xCA423627
		Offset: 0x398
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_90c2e4ec
		Checksum: 0x7E4FE106
		Offset: 0x578
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_90c2e4ec
		Checksum: 0xD9AA372B
		Offset: 0x4D8
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
		Namespace: namespace_90c2e4ec
		Checksum: 0xAD2BA357
		Offset: 0x440
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("sr_orda_health_bar");
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_90c2e4ec
		Checksum: 0xD72BFC53
		Offset: 0x3B8
		Size: 0x7C
		Parameters: 2
		Flags: None
	*/
	function setup_clientfields(var_663a86fa, var_d79cca54)
	{
		namespace_6aaccc24::setup_clientfields("sr_orda_health_bar");
		namespace_6aaccc24::function_da693cbe("health", 4000, 7, "float", var_663a86fa);
		namespace_6aaccc24::function_da693cbe("is_beast", 4000, 1, "int", var_d79cca54);
	}

	/*
		Name: function_dff51e54
		Namespace: namespace_90c2e4ec
		Checksum: 0x7FFD40DE
		Offset: 0x540
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_dff51e54(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "is_beast", value);
	}

	/*
		Name: set_health
		Namespace: namespace_90c2e4ec
		Checksum: 0x70D100B4
		Offset: 0x508
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_health(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "health", value);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_90c2e4ec
		Checksum: 0xD972ABA1
		Offset: 0x468
		Size: 0x64
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
		[[ self ]]->function_d7d2fcce(localclientnum, "health", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "is_beast", 0);
	}

}

#namespace namespace_e7b931aa;

/*
	Name: function_41a7b58c
	Namespace: namespace_e7b931aa
	Checksum: 0x21AD2A18
	Offset: 0xD8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_41a7b58c()
{
	level notify(941724007);
}

/*
	Name: register
	Namespace: namespace_e7b931aa
	Checksum: 0x45795D4D
	Offset: 0xF8
	Size: 0x17E
	Parameters: 2
	Flags: None
*/
function register(var_663a86fa, var_d79cca54)
{
	elem = new class_90c2e4ec();
	[[ elem ]]->setup_clientfields(var_663a86fa, var_d79cca54);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"hash_51902cdefeaf2cf0"]))
	{
		level.var_ae746e8f[#"hash_51902cdefeaf2cf0"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"hash_51902cdefeaf2cf0"]))
	{
		level.var_ae746e8f[#"hash_51902cdefeaf2cf0"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"hash_51902cdefeaf2cf0"]))
	{
		level.var_ae746e8f[#"hash_51902cdefeaf2cf0"] = array(level.var_ae746e8f[#"hash_51902cdefeaf2cf0"]);
	}
	level.var_ae746e8f[#"hash_51902cdefeaf2cf0"][level.var_ae746e8f[#"hash_51902cdefeaf2cf0"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: namespace_e7b931aa
	Checksum: 0x74AAB41F
	Offset: 0x280
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_90c2e4ec();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: namespace_e7b931aa
	Checksum: 0x3E0ABCB0
	Offset: 0x2C0
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
	Namespace: namespace_e7b931aa
	Checksum: 0xBB0D2404
	Offset: 0x2E8
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
	Namespace: namespace_e7b931aa
	Checksum: 0x7102EF49
	Offset: 0x310
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: set_health
	Namespace: namespace_e7b931aa
	Checksum: 0xD838DDD4
	Offset: 0x338
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_health(localclientnum, value)
{
	[[ self ]]->set_health(localclientnum, value);
}

/*
	Name: function_dff51e54
	Namespace: namespace_e7b931aa
	Checksum: 0xA26FEADC
	Offset: 0x368
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_dff51e54(localclientnum, value)
{
	[[ self ]]->function_dff51e54(localclientnum, value);
}

