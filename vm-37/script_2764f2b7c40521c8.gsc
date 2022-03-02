#using scripts\core_common\lui_shared.csc;

class class_70ee35b1 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_70ee35b1
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
		Namespace: namespace_70ee35b1
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
		Name: function_87bb24
		Namespace: namespace_70ee35b1
		Checksum: 0xC1879939
		Offset: 0x610
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_87bb24(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "movieName", value);
	}

	/*
		Name: open
		Namespace: namespace_70ee35b1
		Checksum: 0x21BEAFDF
		Offset: 0x5E0
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		namespace_6aaccc24::open(localclientnum);
	}

	/*
		Name: function_493305af
		Namespace: namespace_70ee35b1
		Checksum: 0x232B4CD0
		Offset: 0x6B8
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_493305af(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "additive", value);
	}

	/*
		Name: function_5c1bb138
		Namespace: namespace_70ee35b1
		Checksum: 0x11CAB9E9
		Offset: 0x510
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("pip_menu");
	}

	/*
		Name: function_5caa21cb
		Namespace: namespace_70ee35b1
		Checksum: 0xDC465109
		Offset: 0x680
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_5caa21cb(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "looping", value);
	}

	/*
		Name: function_8f7a8b9c
		Namespace: namespace_70ee35b1
		Checksum: 0x99A527F8
		Offset: 0x648
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_8f7a8b9c(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "showBlackScreen", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_70ee35b1
		Checksum: 0x9430F8AD
		Offset: 0x428
		Size: 0xDC
		Parameters: 4
		Flags: None
	*/
	function setup_clientfields(var_f7b454f9, var_d5b04ae3, var_e4decd0, var_e545d4b9)
	{
		namespace_6aaccc24::setup_clientfields("pip_menu");
		namespace_6aaccc24::function_dcb34c80("moviefile", "movieName", 1);
		namespace_6aaccc24::function_da693cbe("showBlackScreen", 1, 1, "int", var_d5b04ae3);
		namespace_6aaccc24::function_da693cbe("looping", 1, 1, "int", var_e4decd0);
		namespace_6aaccc24::function_da693cbe("additive", 1, 1, "int", var_e545d4b9);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_70ee35b1
		Checksum: 0x3741EFF4
		Offset: 0x538
		Size: 0xA0
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
		[[ self ]]->function_d7d2fcce(localclientnum, "movieName", #"");
		[[ self ]]->function_d7d2fcce(localclientnum, "showBlackScreen", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "looping", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "additive", 0);
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
	elem = new class_70ee35b1();
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
	Name: function_5c1bb138
	Namespace: pip_menu
	Checksum: 0xFFCF4B47
	Offset: 0x290
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_70ee35b1();
	[[ elem ]]->function_5c1bb138();
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
	Name: function_87bb24
	Namespace: pip_menu
	Checksum: 0x8896E128
	Offset: 0x348
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_87bb24(localclientnum, value)
{
	[[ self ]]->function_87bb24(localclientnum, value);
}

/*
	Name: function_8f7a8b9c
	Namespace: pip_menu
	Checksum: 0xC1052F0D
	Offset: 0x378
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_8f7a8b9c(localclientnum, value)
{
	[[ self ]]->function_8f7a8b9c(localclientnum, value);
}

/*
	Name: function_5caa21cb
	Namespace: pip_menu
	Checksum: 0xBBD0E82
	Offset: 0x3A8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_5caa21cb(localclientnum, value)
{
	[[ self ]]->function_5caa21cb(localclientnum, value);
}

/*
	Name: function_493305af
	Namespace: pip_menu
	Checksum: 0x39289CCD
	Offset: 0x3D8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_493305af(localclientnum, value)
{
	[[ self ]]->function_493305af(localclientnum, value);
}

