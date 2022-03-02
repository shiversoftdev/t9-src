#using scripts\core_common\lui_shared.csc;

class class_af345a5f : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_af345a5f
		Checksum: 0x5400FEEA
		Offset: 0x3D8
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_af345a5f
		Checksum: 0xCABBBF29
		Offset: 0x640
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_af345a5f
		Checksum: 0x6B8F274D
		Offset: 0x568
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function open(localclientnum)
	{
		namespace_6aaccc24::open(localclientnum);
	}

	/*
		Name: function_5c1bb138
		Namespace: namespace_af345a5f
		Checksum: 0xC8F6ABB0
		Offset: 0x4B0
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("zm_laststand_client");
	}

	/*
		Name: function_65194707
		Namespace: namespace_af345a5f
		Checksum: 0x5208188A
		Offset: 0x608
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_65194707(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "num_downs", value);
	}

	/*
		Name: function_67bdfe40
		Namespace: namespace_af345a5f
		Checksum: 0x89EE3521
		Offset: 0x598
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_67bdfe40(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "bleedout_progress", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_af345a5f
		Checksum: 0x34598E5E
		Offset: 0x3F8
		Size: 0xAC
		Parameters: 3
		Flags: Linked
	*/
	function setup_clientfields(var_a9a4e140, var_e97e7153, var_5db69c99)
	{
		namespace_6aaccc24::setup_clientfields("zm_laststand_client");
		namespace_6aaccc24::function_da693cbe("bleedout_progress", 1, 8, "float", var_a9a4e140);
		namespace_6aaccc24::function_da693cbe("revive_progress", 1, 8, "float", var_e97e7153);
		namespace_6aaccc24::function_da693cbe("num_downs", 1, 8, "int", var_5db69c99);
	}

	/*
		Name: function_d50fdde9
		Namespace: namespace_af345a5f
		Checksum: 0x43969914
		Offset: 0x5D0
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_d50fdde9(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "revive_progress", value);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_af345a5f
		Checksum: 0x5F600DA8
		Offset: 0x4D8
		Size: 0x88
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
		[[ self ]]->function_d7d2fcce(localclientnum, "bleedout_progress", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "revive_progress", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "num_downs", 0);
	}

}

#namespace zm_laststand_client;

/*
	Name: register
	Namespace: zm_laststand_client
	Checksum: 0x4FBC4B4A
	Offset: 0xF8
	Size: 0x18E
	Parameters: 3
	Flags: Linked
*/
function register(var_a9a4e140, var_e97e7153, var_5db69c99)
{
	elem = new class_af345a5f();
	[[ elem ]]->setup_clientfields(var_a9a4e140, var_e97e7153, var_5db69c99);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"zm_laststand_client"]))
	{
		level.var_ae746e8f[#"zm_laststand_client"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"zm_laststand_client"]))
	{
		level.var_ae746e8f[#"zm_laststand_client"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"zm_laststand_client"]))
	{
		level.var_ae746e8f[#"zm_laststand_client"] = array(level.var_ae746e8f[#"zm_laststand_client"]);
	}
	level.var_ae746e8f[#"zm_laststand_client"][level.var_ae746e8f[#"zm_laststand_client"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: zm_laststand_client
	Checksum: 0xDA4D0C26
	Offset: 0x290
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_af345a5f();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: zm_laststand_client
	Checksum: 0xC6E9C991
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
	Namespace: zm_laststand_client
	Checksum: 0xB22AC333
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
	Namespace: zm_laststand_client
	Checksum: 0x19F9F518
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
	Name: function_67bdfe40
	Namespace: zm_laststand_client
	Checksum: 0xAEF5FDCD
	Offset: 0x348
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_67bdfe40(localclientnum, value)
{
	[[ self ]]->function_67bdfe40(localclientnum, value);
}

/*
	Name: function_d50fdde9
	Namespace: zm_laststand_client
	Checksum: 0xC94D2A0A
	Offset: 0x378
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_d50fdde9(localclientnum, value)
{
	[[ self ]]->function_d50fdde9(localclientnum, value);
}

/*
	Name: function_65194707
	Namespace: zm_laststand_client
	Checksum: 0xDCA2DD43
	Offset: 0x3A8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_65194707(localclientnum, value)
{
	[[ self ]]->function_65194707(localclientnum, value);
}

