#using scripts\core_common\lui_shared.csc;

class cstealth_meter_display : cluielem
{

	/*
		Name: constructor
		Namespace: cstealth_meter_display
		Checksum: 0x5075BD65
		Offset: 0x478
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cstealth_meter_display
		Checksum: 0x63A25521
		Offset: 0x7E8
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: cstealth_meter_display
		Checksum: 0x4BF0982B
		Offset: 0x6A0
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function open(localclientnum)
	{
		cluielem::open(localclientnum);
	}

	/*
		Name: set_direction
		Namespace: cstealth_meter_display
		Checksum: 0x65BF2179
		Offset: 0x778
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_direction(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "direction", value);
	}

	/*
		Name: set_awarenessstate
		Namespace: cstealth_meter_display
		Checksum: 0x1270E340
		Offset: 0x708
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_awarenessstate(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "awarenessState", value);
	}

	/*
		Name: register_clientside
		Namespace: cstealth_meter_display
		Checksum: 0x28F6635A
		Offset: 0x5B0
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function register_clientside()
	{
		cluielem::register_clientside("stealth_meter_display");
	}

	/*
		Name: set_awarenessprogress
		Namespace: cstealth_meter_display
		Checksum: 0xF7E59CA9
		Offset: 0x740
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_awarenessprogress(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "awarenessProgress", value);
	}

	/*
		Name: setup_clientfields
		Namespace: cstealth_meter_display
		Checksum: 0x2061EAF0
		Offset: 0x498
		Size: 0x10C
		Parameters: 5
		Flags: Linked
	*/
	function setup_clientfields(var_5a7b4b38, var_579b061b, var_f10a04a3, var_f228b5fa, var_bda3bf84)
	{
		cluielem::setup_clientfields("stealth_meter_display");
		cluielem::add_clientfield("entNum", 1, 10, "int", var_5a7b4b38);
		cluielem::add_clientfield("awarenessState", 1, 4, "int", var_579b061b);
		cluielem::add_clientfield("awarenessProgress", 1, 4, "float", var_f10a04a3);
		cluielem::add_clientfield("direction", 1, 4, "float", var_f228b5fa);
		cluielem::add_clientfield("clamped", 1, 1, "int", var_bda3bf84);
	}

	/*
		Name: set_entnum
		Namespace: cstealth_meter_display
		Checksum: 0x5C125907
		Offset: 0x6D0
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_entnum(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "entNum", value);
	}

	/*
		Name: function_fa582112
		Namespace: cstealth_meter_display
		Checksum: 0xC204E87E
		Offset: 0x5D8
		Size: 0xC0
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
		[[ self ]]->set_data(localclientnum, "entNum", 0);
		[[ self ]]->set_data(localclientnum, "awarenessState", 0);
		[[ self ]]->set_data(localclientnum, "awarenessProgress", 0);
		[[ self ]]->set_data(localclientnum, "direction", 0);
		[[ self ]]->set_data(localclientnum, "clamped", 0);
	}

	/*
		Name: set_clamped
		Namespace: cstealth_meter_display
		Checksum: 0xB5E228BC
		Offset: 0x7B0
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_clamped(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "clamped", value);
	}

}

#namespace stealth_meter_display;

/*
	Name: function_7308a8ab
	Namespace: stealth_meter_display
	Checksum: 0x973EAED5
	Offset: 0x108
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_7308a8ab()
{
	level notify(1266501413);
}

/*
	Name: register
	Namespace: stealth_meter_display
	Checksum: 0x719EC839
	Offset: 0x128
	Size: 0x19E
	Parameters: 5
	Flags: None
*/
function register(var_5a7b4b38, var_579b061b, var_f10a04a3, var_f228b5fa, var_bda3bf84)
{
	elem = new cstealth_meter_display();
	[[ elem ]]->setup_clientfields(var_5a7b4b38, var_579b061b, var_f10a04a3, var_f228b5fa, var_bda3bf84);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"stealth_meter_display"]))
	{
		level.var_ae746e8f[#"stealth_meter_display"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"stealth_meter_display"]))
	{
		level.var_ae746e8f[#"stealth_meter_display"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"stealth_meter_display"]))
	{
		level.var_ae746e8f[#"stealth_meter_display"] = array(level.var_ae746e8f[#"stealth_meter_display"]);
	}
	level.var_ae746e8f[#"stealth_meter_display"][level.var_ae746e8f[#"stealth_meter_display"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: stealth_meter_display
	Checksum: 0x6792CB88
	Offset: 0x2D0
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function register_clientside()
{
	elem = new cstealth_meter_display();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: stealth_meter_display
	Checksum: 0x875E5960
	Offset: 0x310
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function open(player)
{
	[[ self ]]->open(player);
}

/*
	Name: close
	Namespace: stealth_meter_display
	Checksum: 0x8A22208E
	Offset: 0x338
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function close(player)
{
	[[ self ]]->close(player);
}

/*
	Name: is_open
	Namespace: stealth_meter_display
	Checksum: 0x1CFC583F
	Offset: 0x360
	Size: 0x1A
	Parameters: 1
	Flags: Linked
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: set_entnum
	Namespace: stealth_meter_display
	Checksum: 0x4C2BEDA4
	Offset: 0x388
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_entnum(localclientnum, value)
{
	[[ self ]]->set_entnum(localclientnum, value);
}

/*
	Name: set_awarenessstate
	Namespace: stealth_meter_display
	Checksum: 0x605138CB
	Offset: 0x3B8
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_awarenessstate(localclientnum, value)
{
	[[ self ]]->set_awarenessstate(localclientnum, value);
}

/*
	Name: set_awarenessprogress
	Namespace: stealth_meter_display
	Checksum: 0x534A825F
	Offset: 0x3E8
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_awarenessprogress(localclientnum, value)
{
	[[ self ]]->set_awarenessprogress(localclientnum, value);
}

/*
	Name: set_direction
	Namespace: stealth_meter_display
	Checksum: 0x424CFC5D
	Offset: 0x418
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_direction(localclientnum, value)
{
	[[ self ]]->set_direction(localclientnum, value);
}

/*
	Name: set_clamped
	Namespace: stealth_meter_display
	Checksum: 0x1ACD70FD
	Offset: 0x448
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_clamped(localclientnum, value)
{
	[[ self ]]->set_clamped(localclientnum, value);
}

