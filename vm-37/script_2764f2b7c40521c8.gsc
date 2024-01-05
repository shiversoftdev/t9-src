#using scripts\core_common\lui_shared.csc;

class cpip_menu : cluielem
{

	/*
		Name: constructor
		Namespace: cpip_menu
		Checksum: 0xCFEB7292
		Offset: 0x408
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cpip_menu
		Checksum: 0xEB422DEB
		Offset: 0x6F0
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: set_moviename
		Namespace: cpip_menu
		Checksum: 0xC1879939
		Offset: 0x610
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_moviename(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "movieName", value);
	}

	/*
		Name: open
		Namespace: cpip_menu
		Checksum: 0x21BEAFDF
		Offset: 0x5E0
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		cluielem::open(localclientnum);
	}

	/*
		Name: set_additive
		Namespace: cpip_menu
		Checksum: 0x232B4CD0
		Offset: 0x6B8
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_additive(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "additive", value);
	}

	/*
		Name: register_clientside
		Namespace: cpip_menu
		Checksum: 0x11CAB9E9
		Offset: 0x510
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function register_clientside()
	{
		cluielem::register_clientside("pip_menu");
	}

	/*
		Name: set_looping
		Namespace: cpip_menu
		Checksum: 0xDC465109
		Offset: 0x680
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_looping(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "looping", value);
	}

	/*
		Name: set_showblackscreen
		Namespace: cpip_menu
		Checksum: 0x99A527F8
		Offset: 0x648
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_showblackscreen(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "showBlackScreen", value);
	}

	/*
		Name: setup_clientfields
		Namespace: cpip_menu
		Checksum: 0x9430F8AD
		Offset: 0x428
		Size: 0xDC
		Parameters: 4
		Flags: None
	*/
	function setup_clientfields(var_f7b454f9, var_d5b04ae3, var_e4decd0, var_e545d4b9)
	{
		cluielem::setup_clientfields("pip_menu");
		cluielem::function_dcb34c80("moviefile", "movieName", 1);
		cluielem::add_clientfield("showBlackScreen", 1, 1, "int", var_d5b04ae3);
		cluielem::add_clientfield("looping", 1, 1, "int", var_e4decd0);
		cluielem::add_clientfield("additive", 1, 1, "int", var_e545d4b9);
	}

	/*
		Name: function_fa582112
		Namespace: cpip_menu
		Checksum: 0x3741EFF4
		Offset: 0x538
		Size: 0xA0
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
		[[ self ]]->set_data(localclientnum, "movieName", #"");
		[[ self ]]->set_data(localclientnum, "showBlackScreen", 0);
		[[ self ]]->set_data(localclientnum, "looping", 0);
		[[ self ]]->set_data(localclientnum, "additive", 0);
	}

}

#namespace pip_menu;

/*
	Name: register
	Namespace: pip_menu
	Checksum: 0x48F371F3
	Offset: 0xF0
	Size: 0x196
	Parameters: 4
	Flags: None
*/
function register(var_f7b454f9, var_d5b04ae3, var_e4decd0, var_e545d4b9)
{
	elem = new cpip_menu();
	[[ elem ]]->setup_clientfields(var_f7b454f9, var_d5b04ae3, var_e4decd0, var_e545d4b9);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"pip_menu"]))
	{
		level.var_ae746e8f[#"pip_menu"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"pip_menu"]))
	{
		level.var_ae746e8f[#"pip_menu"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"pip_menu"]))
	{
		level.var_ae746e8f[#"pip_menu"] = array(level.var_ae746e8f[#"pip_menu"]);
	}
	level.var_ae746e8f[#"pip_menu"][level.var_ae746e8f[#"pip_menu"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: pip_menu
	Checksum: 0xFFCF4B47
	Offset: 0x290
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new cpip_menu();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: pip_menu
	Checksum: 0xAE58960E
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
	Namespace: pip_menu
	Checksum: 0xDFE520B6
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
	Namespace: pip_menu
	Checksum: 0x850E16A8
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
	Name: set_moviename
	Namespace: pip_menu
	Checksum: 0x8896E128
	Offset: 0x348
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_moviename(localclientnum, value)
{
	[[ self ]]->set_moviename(localclientnum, value);
}

/*
	Name: set_showblackscreen
	Namespace: pip_menu
	Checksum: 0xC1052F0D
	Offset: 0x378
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_showblackscreen(localclientnum, value)
{
	[[ self ]]->set_showblackscreen(localclientnum, value);
}

/*
	Name: set_looping
	Namespace: pip_menu
	Checksum: 0xBBD0E82
	Offset: 0x3A8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_looping(localclientnum, value)
{
	[[ self ]]->set_looping(localclientnum, value);
}

/*
	Name: set_additive
	Namespace: pip_menu
	Checksum: 0x39289CCD
	Offset: 0x3D8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_additive(localclientnum, value)
{
	[[ self ]]->set_additive(localclientnum, value);
}

