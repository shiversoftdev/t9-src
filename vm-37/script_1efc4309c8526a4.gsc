#using scripts\core_common\lui_shared.csc;

class ccp_chyron : cluielem
{

	/*
		Name: constructor
		Namespace: ccp_chyron
		Checksum: 0x754B401B
		Offset: 0x478
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: ccp_chyron
		Checksum: 0x1753957D
		Offset: 0x898
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: set_line3
		Namespace: ccp_chyron
		Checksum: 0xC4DFBD60
		Offset: 0x7B8
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_line3(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "line3", value);
	}

	/*
		Name: open
		Namespace: ccp_chyron
		Checksum: 0x9772144E
		Offset: 0x718
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		cluielem::open(localclientnum);
	}

	/*
		Name: set_line2
		Namespace: ccp_chyron
		Checksum: 0x28255A1D
		Offset: 0x780
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_line2(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "line2", value);
	}

	/*
		Name: set_line5
		Namespace: ccp_chyron
		Checksum: 0x9AE5215A
		Offset: 0x828
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_line5(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "line5", value);
	}

	/*
		Name: set_line1
		Namespace: ccp_chyron
		Checksum: 0x78584389
		Offset: 0x748
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_line1(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "line1", value);
	}

	/*
		Name: register_clientside
		Namespace: ccp_chyron
		Checksum: 0x5ADD175F
		Offset: 0x5E0
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function register_clientside()
	{
		cluielem::register_clientside("cp_chyron");
	}

	/*
		Name: set_index
		Namespace: ccp_chyron
		Checksum: 0x69EC837
		Offset: 0x860
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_index(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "index", value);
	}

	/*
		Name: setup_clientfields
		Namespace: ccp_chyron
		Checksum: 0xBDF07D9E
		Offset: 0x498
		Size: 0x13C
		Parameters: 6
		Flags: None
	*/
	function setup_clientfields(var_27185c26, var_9da4cb62, var_865fc474, var_1909e1e7, var_2ff7635c, var_eaf012fc)
	{
		cluielem::setup_clientfields("cp_chyron");
		cluielem::function_dcb34c80("string", "line1", 1);
		cluielem::function_dcb34c80("string", "line2", 1);
		cluielem::function_dcb34c80("string", "line3", 1);
		cluielem::function_dcb34c80("string", "line4", 1);
		cluielem::function_dcb34c80("string", "line5", 1);
		cluielem::add_clientfield("index", 1, 4, "int", var_eaf012fc);
	}

	/*
		Name: set_line4
		Namespace: ccp_chyron
		Checksum: 0x6D370ACF
		Offset: 0x7F0
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_line4(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "line4", value);
	}

	/*
		Name: function_fa582112
		Namespace: ccp_chyron
		Checksum: 0xE8755B69
		Offset: 0x608
		Size: 0x108
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
		[[ self ]]->set_data(localclientnum, "line1", #"");
		[[ self ]]->set_data(localclientnum, "line2", #"");
		[[ self ]]->set_data(localclientnum, "line3", #"");
		[[ self ]]->set_data(localclientnum, "line4", #"");
		[[ self ]]->set_data(localclientnum, "line5", #"");
		[[ self ]]->set_data(localclientnum, "index", 0);
	}

}

#namespace cp_chyron;

/*
	Name: register
	Namespace: cp_chyron
	Checksum: 0x13F256A2
	Offset: 0xF0
	Size: 0x1A6
	Parameters: 6
	Flags: None
*/
function register(var_27185c26, var_9da4cb62, var_865fc474, var_1909e1e7, var_2ff7635c, var_eaf012fc)
{
	elem = new ccp_chyron();
	[[ elem ]]->setup_clientfields(var_27185c26, var_9da4cb62, var_865fc474, var_1909e1e7, var_2ff7635c, var_eaf012fc);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"cp_chyron"]))
	{
		level.var_ae746e8f[#"cp_chyron"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"cp_chyron"]))
	{
		level.var_ae746e8f[#"cp_chyron"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"cp_chyron"]))
	{
		level.var_ae746e8f[#"cp_chyron"] = array(level.var_ae746e8f[#"cp_chyron"]);
	}
	level.var_ae746e8f[#"cp_chyron"][level.var_ae746e8f[#"cp_chyron"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: cp_chyron
	Checksum: 0x2C29577B
	Offset: 0x2A0
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new ccp_chyron();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: cp_chyron
	Checksum: 0x36EEC670
	Offset: 0x2E0
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
	Namespace: cp_chyron
	Checksum: 0x1BDD9206
	Offset: 0x308
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
	Namespace: cp_chyron
	Checksum: 0x3B39E75A
	Offset: 0x330
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: set_line1
	Namespace: cp_chyron
	Checksum: 0xDDEE3BB2
	Offset: 0x358
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_line1(localclientnum, value)
{
	[[ self ]]->set_line1(localclientnum, value);
}

/*
	Name: set_line2
	Namespace: cp_chyron
	Checksum: 0x1BA5E1EA
	Offset: 0x388
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_line2(localclientnum, value)
{
	[[ self ]]->set_line2(localclientnum, value);
}

/*
	Name: set_line3
	Namespace: cp_chyron
	Checksum: 0x71CB1DF5
	Offset: 0x3B8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_line3(localclientnum, value)
{
	[[ self ]]->set_line3(localclientnum, value);
}

/*
	Name: set_line4
	Namespace: cp_chyron
	Checksum: 0x791BAE81
	Offset: 0x3E8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_line4(localclientnum, value)
{
	[[ self ]]->set_line4(localclientnum, value);
}

/*
	Name: set_line5
	Namespace: cp_chyron
	Checksum: 0x6AA4B6AC
	Offset: 0x418
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_line5(localclientnum, value)
{
	[[ self ]]->set_line5(localclientnum, value);
}

/*
	Name: set_index
	Namespace: cp_chyron
	Checksum: 0x66C0673D
	Offset: 0x448
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_index(localclientnum, value)
{
	[[ self ]]->set_index(localclientnum, value);
}

