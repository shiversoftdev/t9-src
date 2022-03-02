#using scripts\core_common\lui_shared.csc;

class class_28a7d65d : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_28a7d65d
		Checksum: 0x52B1EC21
		Offset: 0x328
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_28a7d65d
		Checksum: 0x8EE667C0
		Offset: 0x480
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: function_459465a
		Namespace: namespace_28a7d65d
		Checksum: 0xAF5BB400
		Offset: 0x448
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_459465a(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "percent", value);
	}

	/*
		Name: open
		Namespace: namespace_28a7d65d
		Checksum: 0x1A5B1125
		Offset: 0x418
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
		Namespace: namespace_28a7d65d
		Checksum: 0x262034EC
		Offset: 0x3A0
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("self_respawn");
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_28a7d65d
		Checksum: 0xB22C7CEC
		Offset: 0x348
		Size: 0x4C
		Parameters: 1
		Flags: None
	*/
	function setup_clientfields(var_1089a5f3)
	{
		namespace_6aaccc24::setup_clientfields("self_respawn");
		namespace_6aaccc24::function_da693cbe("percent", 1, 6, "float", var_1089a5f3);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_28a7d65d
		Checksum: 0x2DD9CBB8
		Offset: 0x3C8
		Size: 0x48
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
		[[ self ]]->function_d7d2fcce(localclientnum, "percent", 0);
	}

}

#namespace self_respawn;

/*
	Name: register
	Namespace: self_respawn
	Checksum: 0x2295199E
	Offset: 0xC0
	Size: 0x176
	Parameters: 1
	Flags: None
*/
function register(var_1089a5f3)
{
	elem = new class_28a7d65d();
	[[ elem ]]->setup_clientfields(var_1089a5f3);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"self_respawn"]))
	{
		level.var_ae746e8f[#"self_respawn"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"self_respawn"]))
	{
		level.var_ae746e8f[#"self_respawn"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"self_respawn"]))
	{
		level.var_ae746e8f[#"self_respawn"] = array(level.var_ae746e8f[#"self_respawn"]);
	}
	level.var_ae746e8f[#"self_respawn"][level.var_ae746e8f[#"self_respawn"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: self_respawn
	Checksum: 0x29CFF52E
	Offset: 0x240
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_28a7d65d();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: self_respawn
	Checksum: 0x3C98118D
	Offset: 0x280
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
	Namespace: self_respawn
	Checksum: 0xD1CCEE43
	Offset: 0x2A8
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
	Namespace: self_respawn
	Checksum: 0x130C2BF5
	Offset: 0x2D0
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: function_459465a
	Namespace: self_respawn
	Checksum: 0x39C553D0
	Offset: 0x2F8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_459465a(localclientnum, value)
{
	[[ self ]]->function_459465a(localclientnum, value);
}

