#using scripts\core_common\lui_shared.csc;

class class_140ed462 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_140ed462
		Checksum: 0xE77EB51F
		Offset: 0x3B0
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_140ed462
		Checksum: 0x59CCCCC6
		Offset: 0x608
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_140ed462
		Checksum: 0xEA6730F0
		Offset: 0x530
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		namespace_6aaccc24::open(localclientnum);
	}

	/*
		Name: function_21eb67aa
		Namespace: namespace_140ed462
		Checksum: 0x21334095
		Offset: 0x598
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_21eb67aa(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "minutes", value);
	}

	/*
		Name: function_5c1bb138
		Namespace: namespace_140ed462
		Checksum: 0x2307886C
		Offset: 0x488
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("zm_game_timer");
	}

	/*
		Name: function_7954feaf
		Namespace: namespace_140ed462
		Checksum: 0x4736B3E8
		Offset: 0x5D0
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_7954feaf(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "showzero", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_140ed462
		Checksum: 0xB25B704
		Offset: 0x3D0
		Size: 0xAC
		Parameters: 3
		Flags: None
	*/
	function setup_clientfields(var_b1de907e, var_359a4d9a, var_8fd8bfaa)
	{
		namespace_6aaccc24::setup_clientfields("zm_game_timer");
		namespace_6aaccc24::function_da693cbe("seconds", 1, 6, "int", var_b1de907e);
		namespace_6aaccc24::function_da693cbe("minutes", 1, 9, "int", var_359a4d9a);
		namespace_6aaccc24::function_da693cbe("showzero", 1, 1, "int", var_8fd8bfaa);
	}

	/*
		Name: function_c48569e7
		Namespace: namespace_140ed462
		Checksum: 0xA8D415CA
		Offset: 0x560
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_c48569e7(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "seconds", value);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_140ed462
		Checksum: 0x5A62BDDC
		Offset: 0x4B0
		Size: 0x78
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
		[[ self ]]->function_d7d2fcce(localclientnum, "seconds", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "minutes", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "showzero", 0);
	}

}

#namespace zm_game_timer;

/*
	Name: register
	Namespace: zm_game_timer
	Checksum: 0xFBFD021A
	Offset: 0xD0
	Size: 0x18E
	Parameters: 3
	Flags: None
*/
function register(var_b1de907e, var_359a4d9a, var_8fd8bfaa)
{
	elem = new class_140ed462();
	[[ elem ]]->setup_clientfields(var_b1de907e, var_359a4d9a, var_8fd8bfaa);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"zm_game_timer"]))
	{
		level.var_ae746e8f[#"zm_game_timer"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"zm_game_timer"]))
	{
		level.var_ae746e8f[#"zm_game_timer"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"zm_game_timer"]))
	{
		level.var_ae746e8f[#"zm_game_timer"] = array(level.var_ae746e8f[#"zm_game_timer"]);
	}
	level.var_ae746e8f[#"zm_game_timer"][level.var_ae746e8f[#"zm_game_timer"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: zm_game_timer
	Checksum: 0x3939ECD7
	Offset: 0x268
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_140ed462();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: zm_game_timer
	Checksum: 0x670E1B9A
	Offset: 0x2A8
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
	Namespace: zm_game_timer
	Checksum: 0x65D172D9
	Offset: 0x2D0
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
	Namespace: zm_game_timer
	Checksum: 0xFBDA8A2A
	Offset: 0x2F8
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: function_c48569e7
	Namespace: zm_game_timer
	Checksum: 0xD4CFEE73
	Offset: 0x320
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_c48569e7(localclientnum, value)
{
	[[ self ]]->function_c48569e7(localclientnum, value);
}

/*
	Name: function_21eb67aa
	Namespace: zm_game_timer
	Checksum: 0x5CDAC4E3
	Offset: 0x350
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_21eb67aa(localclientnum, value)
{
	[[ self ]]->function_21eb67aa(localclientnum, value);
}

/*
	Name: function_7954feaf
	Namespace: zm_game_timer
	Checksum: 0x99801EDA
	Offset: 0x380
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_7954feaf(localclientnum, value)
{
	[[ self ]]->function_7954feaf(localclientnum, value);
}

