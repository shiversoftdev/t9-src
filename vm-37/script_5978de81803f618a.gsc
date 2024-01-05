#using scripts\core_common\lui_shared.csc;

class class_5c7b7dcc : cluielem
{

	/*
		Name: constructor
		Namespace: namespace_5c7b7dcc
		Checksum: 0x52B1EC21
		Offset: 0x338
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_5c7b7dcc
		Checksum: 0x67DC023D
		Offset: 0x488
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_5c7b7dcc
		Checksum: 0xF254CA46
		Offset: 0x420
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		cluielem::open(localclientnum);
	}

	/*
		Name: register_clientside
		Namespace: namespace_5c7b7dcc
		Checksum: 0x262034EC
		Offset: 0x3B0
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function register_clientside()
	{
		cluielem::register_clientside("mp_infect_timer");
	}

	/*
		Name: set_infectiontimeremaining
		Namespace: namespace_5c7b7dcc
		Checksum: 0x7543EA63
		Offset: 0x450
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_infectiontimeremaining(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "infectionTimeRemaining", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_5c7b7dcc
		Checksum: 0xDF0C3E37
		Offset: 0x358
		Size: 0x4C
		Parameters: 1
		Flags: None
	*/
	function setup_clientfields(var_7682811d)
	{
		cluielem::setup_clientfields("mp_infect_timer");
		cluielem::add_clientfield("infectionTimeRemaining", 1, 4, "int", var_7682811d);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_5c7b7dcc
		Checksum: 0x858D1608
		Offset: 0x3D8
		Size: 0x40
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
		[[ self ]]->set_data(localclientnum, "infectionTimeRemaining", 0);
	}

}

#namespace mp_infect_timer;

/*
	Name: register
	Namespace: mp_infect_timer
	Checksum: 0xB8EC42D5
	Offset: 0xD0
	Size: 0x176
	Parameters: 1
	Flags: None
*/
function register(var_7682811d)
{
	elem = new class_5c7b7dcc();
	[[ elem ]]->setup_clientfields(var_7682811d);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"mp_infect_timer"]))
	{
		level.var_ae746e8f[#"mp_infect_timer"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"mp_infect_timer"]))
	{
		level.var_ae746e8f[#"mp_infect_timer"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"mp_infect_timer"]))
	{
		level.var_ae746e8f[#"mp_infect_timer"] = array(level.var_ae746e8f[#"mp_infect_timer"]);
	}
	level.var_ae746e8f[#"mp_infect_timer"][level.var_ae746e8f[#"mp_infect_timer"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: mp_infect_timer
	Checksum: 0x8715756B
	Offset: 0x250
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new class_5c7b7dcc();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: mp_infect_timer
	Checksum: 0x3C98118D
	Offset: 0x290
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
	Namespace: mp_infect_timer
	Checksum: 0xD1CCEE43
	Offset: 0x2B8
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
	Namespace: mp_infect_timer
	Checksum: 0x130C2BF5
	Offset: 0x2E0
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: set_infectiontimeremaining
	Namespace: mp_infect_timer
	Checksum: 0x8E26B47A
	Offset: 0x308
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_infectiontimeremaining(localclientnum, value)
{
	[[ self ]]->set_infectiontimeremaining(localclientnum, value);
}

