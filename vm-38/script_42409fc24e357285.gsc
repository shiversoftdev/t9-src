#using scripts\core_common\lui_shared.csc;

class class_140ed462 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_140ed462
		Checksum: 0xB040D463
		Offset: 0x3D0
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
		Checksum: 0xA858F513
		Offset: 0x628
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
		Checksum: 0x30830059
		Offset: 0x550
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
		Checksum: 0xF81C9536
		Offset: 0x5B8
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
		Checksum: 0xBDE8DD87
		Offset: 0x4A8
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
		Checksum: 0x6D5E63B5
		Offset: 0x5F0
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
		Checksum: 0x7AC008CF
		Offset: 0x3F0
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
		Checksum: 0xDEA4AEE9
		Offset: 0x580
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
		Checksum: 0x472634B8
		Offset: 0x4D0
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
	Name: function_54413909
	Namespace: zm_game_timer
	Checksum: 0x60B0937B
	Offset: 0xD0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_54413909()
{
	level notify(1601742921);
}

/*
	Name: register
	Namespace: zm_game_timer
	Checksum: 0xF5828CCA
	Offset: 0xF0
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
	Checksum: 0x9EE0298D
	Offset: 0x288
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
	Checksum: 0x29A01F8
	Offset: 0x2C8
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
	Checksum: 0x133F04AA
	Offset: 0x2F0
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
	Checksum: 0xBA805EE5
	Offset: 0x318
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
	Checksum: 0x492561FA
	Offset: 0x340
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
	Checksum: 0x4688FC03
	Offset: 0x370
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
	Checksum: 0x6F1F718F
	Offset: 0x3A0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_7954feaf(localclientnum, value)
{
	[[ self ]]->function_7954feaf(localclientnum, value);
}

