#using scripts\core_common\lui_shared.csc;

class cdebug_center_screen : cluielem
{

	/*
		Name: constructor
		Namespace: cdebug_center_screen
		Checksum: 0xDC4084E4
		Offset: 0x300
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cdebug_center_screen
		Checksum: 0xCB392D6D
		Offset: 0x3D0
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: cdebug_center_screen
		Checksum: 0x6BBE1073
		Offset: 0x3A0
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function open(localclientnum)
	{
		cluielem::open(localclientnum);
	}

	/*
		Name: register_clientside
		Namespace: cdebug_center_screen
		Checksum: 0x1C8CEAA7
		Offset: 0x348
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function register_clientside()
	{
		cluielem::register_clientside("debug_center_screen");
	}

	/*
		Name: setup_clientfields
		Namespace: cdebug_center_screen
		Checksum: 0xD6F94C2A
		Offset: 0x320
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("debug_center_screen");
	}

	/*
		Name: function_fa582112
		Namespace: cdebug_center_screen
		Checksum: 0x1D2B076A
		Offset: 0x370
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
	}

}

#namespace debug_center_screen;

/*
	Name: function_4ddb5599
	Namespace: debug_center_screen
	Checksum: 0x1E96B3D7
	Offset: 0xB0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_4ddb5599()
{
	level notify(1428937030);
}

/*
	Name: register
	Namespace: debug_center_screen
	Checksum: 0xDB21A0AE
	Offset: 0xD0
	Size: 0x16E
	Parameters: 0
	Flags: Linked
*/
function register()
{
	elem = new cdebug_center_screen();
	[[ elem ]]->setup_clientfields();
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"debug_center_screen"]))
	{
		level.var_ae746e8f[#"debug_center_screen"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"debug_center_screen"]))
	{
		level.var_ae746e8f[#"debug_center_screen"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"debug_center_screen"]))
	{
		level.var_ae746e8f[#"debug_center_screen"] = array(level.var_ae746e8f[#"debug_center_screen"]);
	}
	level.var_ae746e8f[#"debug_center_screen"][level.var_ae746e8f[#"debug_center_screen"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: debug_center_screen
	Checksum: 0xAFD1561A
	Offset: 0x248
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new cdebug_center_screen();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: debug_center_screen
	Checksum: 0xDC8037A3
	Offset: 0x288
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
	Namespace: debug_center_screen
	Checksum: 0x9A28CCE
	Offset: 0x2B0
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
	Namespace: debug_center_screen
	Checksum: 0x9AC1CC48
	Offset: 0x2D8
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

