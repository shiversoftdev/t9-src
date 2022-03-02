#using scripts\core_common\lui_shared.csc;

class class_70ee35b1 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_70ee35b1
		Checksum: 0x742D7204
		Offset: 0x428
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_70ee35b1
		Checksum: 0x2A1940D
		Offset: 0x710
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: function_87bb24
		Namespace: namespace_70ee35b1
		Checksum: 0x7E7D48D3
		Offset: 0x630
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_87bb24(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "movieName", value);
	}

	/*
		Name: open
		Namespace: namespace_70ee35b1
		Checksum: 0xD29D7CC2
		Offset: 0x600
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function open(localclientnum)
	{
		namespace_6aaccc24::open(localclientnum);
	}

	/*
		Name: function_493305af
		Namespace: namespace_70ee35b1
		Checksum: 0x9B3212FB
		Offset: 0x6D8
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_493305af(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "additive", value);
	}

	/*
		Name: function_5c1bb138
		Namespace: namespace_70ee35b1
		Checksum: 0x811C8E2A
		Offset: 0x530
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("pip_menu");
	}

	/*
		Name: function_5caa21cb
		Namespace: namespace_70ee35b1
		Checksum: 0x14319523
		Offset: 0x6A0
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_5caa21cb(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "looping", value);
	}

	/*
		Name: function_8f7a8b9c
		Namespace: namespace_70ee35b1
		Checksum: 0x3A0A43F6
		Offset: 0x668
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_8f7a8b9c(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "showBlackScreen", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_70ee35b1
		Checksum: 0xE6D90A05
		Offset: 0x448
		Size: 0xDC
		Parameters: 4
		Flags: Linked
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
		Checksum: 0xBE9D12CE
		Offset: 0x558
		Size: 0xA0
		Parameters: 1
		Flags: Linked
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
	Name: function_ca20caac
	Namespace: pip_menu
	Checksum: 0xAB436937
	Offset: 0xF0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ca20caac()
{
	level notify(533208743);
}

/*
	Name: register
	Namespace: pip_menu
	Checksum: 0x2C0053DA
	Offset: 0x110
	Size: 0x196
	Parameters: 4
	Flags: Linked
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
	Checksum: 0x362A5F33
	Offset: 0x2B0
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
	Checksum: 0x2E334AF
	Offset: 0x2F0
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
	Checksum: 0x571D34BF
	Offset: 0x318
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
	Checksum: 0xD4D680BC
	Offset: 0x340
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
	Checksum: 0xB57ED337
	Offset: 0x368
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
	Checksum: 0x9C433DCD
	Offset: 0x398
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
	Checksum: 0xD510B604
	Offset: 0x3C8
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
	Checksum: 0x71AC8D51
	Offset: 0x3F8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_493305af(localclientnum, value)
{
	[[ self ]]->function_493305af(localclientnum, value);
}

