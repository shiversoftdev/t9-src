#using scripts\core_common\lui_shared.csc;

class cpip_menu : cluielem
{

	/*
		Name: constructor
		Namespace: cpip_menu
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
		Namespace: cpip_menu
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
		Name: set_moviename
		Namespace: cpip_menu
		Checksum: 0x7E7D48D3
		Offset: 0x630
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_moviename(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "movieName", value);
	}

	/*
		Name: open
		Namespace: cpip_menu
		Checksum: 0xD29D7CC2
		Offset: 0x600
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function open(localclientnum)
	{
		cluielem::open(localclientnum);
	}

	/*
		Name: set_additive
		Namespace: cpip_menu
		Checksum: 0x9B3212FB
		Offset: 0x6D8
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_additive(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "additive", value);
	}

	/*
		Name: register_clientside
		Namespace: cpip_menu
		Checksum: 0x811C8E2A
		Offset: 0x530
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function register_clientside()
	{
		cluielem::register_clientside("pip_menu");
	}

	/*
		Name: set_looping
		Namespace: cpip_menu
		Checksum: 0x14319523
		Offset: 0x6A0
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_looping(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "looping", value);
	}

	/*
		Name: set_showblackscreen
		Namespace: cpip_menu
		Checksum: 0x3A0A43F6
		Offset: 0x668
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_showblackscreen(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "showBlackScreen", value);
	}

	/*
		Name: setup_clientfields
		Namespace: cpip_menu
		Checksum: 0xE6D90A05
		Offset: 0x448
		Size: 0xDC
		Parameters: 4
		Flags: Linked
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
		Checksum: 0xBE9D12CE
		Offset: 0x558
		Size: 0xA0
		Parameters: 1
		Flags: Linked
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
	level notify(-533208743);
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
	Checksum: 0x362A5F33
	Offset: 0x2B0
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
	Name: set_moviename
	Namespace: pip_menu
	Checksum: 0xB57ED337
	Offset: 0x368
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
	Checksum: 0x9C433DCD
	Offset: 0x398
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
	Checksum: 0xD510B604
	Offset: 0x3C8
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
	Checksum: 0x71AC8D51
	Offset: 0x3F8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_additive(localclientnum, value)
{
	[[ self ]]->set_additive(localclientnum, value);
}

