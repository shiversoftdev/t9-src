#using scripts\core_common\lui_shared.csc;

class czm_game_timer : cluielem
{

	/*
		Name: constructor
		Namespace: czm_game_timer
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
		Namespace: czm_game_timer
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
		Namespace: czm_game_timer
		Checksum: 0x30830059
		Offset: 0x550
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		cluielem::open(localclientnum);
	}

	/*
		Name: set_minutes
		Namespace: czm_game_timer
		Checksum: 0xF81C9536
		Offset: 0x5B8
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_minutes(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "minutes", value);
	}

	/*
		Name: register_clientside
		Namespace: czm_game_timer
		Checksum: 0xBDE8DD87
		Offset: 0x4A8
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function register_clientside()
	{
		cluielem::register_clientside("zm_game_timer");
	}

	/*
		Name: set_showzero
		Namespace: czm_game_timer
		Checksum: 0x6D5E63B5
		Offset: 0x5F0
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_showzero(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "showzero", value);
	}

	/*
		Name: setup_clientfields
		Namespace: czm_game_timer
		Checksum: 0x7AC008CF
		Offset: 0x3F0
		Size: 0xAC
		Parameters: 3
		Flags: None
	*/
	function setup_clientfields(var_b1de907e, var_359a4d9a, var_8fd8bfaa)
	{
		cluielem::setup_clientfields("zm_game_timer");
		cluielem::add_clientfield("seconds", 1, 6, "int", var_b1de907e);
		cluielem::add_clientfield("minutes", 1, 9, "int", var_359a4d9a);
		cluielem::add_clientfield("showzero", 1, 1, "int", var_8fd8bfaa);
	}

	/*
		Name: set_seconds
		Namespace: czm_game_timer
		Checksum: 0xDEA4AEE9
		Offset: 0x580
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_seconds(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "seconds", value);
	}

	/*
		Name: function_fa582112
		Namespace: czm_game_timer
		Checksum: 0x472634B8
		Offset: 0x4D0
		Size: 0x78
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
		[[ self ]]->set_data(localclientnum, "seconds", 0);
		[[ self ]]->set_data(localclientnum, "minutes", 0);
		[[ self ]]->set_data(localclientnum, "showzero", 0);
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
	level notify(-1601742921);
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
	elem = new czm_game_timer();
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
	Name: register_clientside
	Namespace: zm_game_timer
	Checksum: 0x9EE0298D
	Offset: 0x288
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new czm_game_timer();
	[[ elem ]]->register_clientside();
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
	Name: set_seconds
	Namespace: zm_game_timer
	Checksum: 0x492561FA
	Offset: 0x340
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_seconds(localclientnum, value)
{
	[[ self ]]->set_seconds(localclientnum, value);
}

/*
	Name: set_minutes
	Namespace: zm_game_timer
	Checksum: 0x4688FC03
	Offset: 0x370
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_minutes(localclientnum, value)
{
	[[ self ]]->set_minutes(localclientnum, value);
}

/*
	Name: set_showzero
	Namespace: zm_game_timer
	Checksum: 0x6F1F718F
	Offset: 0x3A0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_showzero(localclientnum, value)
{
	[[ self ]]->set_showzero(localclientnum, value);
}

