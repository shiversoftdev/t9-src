#using scripts\core_common\lui_shared.csc;

class class_4c6a0e72 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_4c6a0e72
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
		Namespace: namespace_4c6a0e72
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
		Name: function_6b7b6e4
		Namespace: namespace_4c6a0e72
		Checksum: 0xC4DFBD60
		Offset: 0x7B8
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_6b7b6e4(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "line3", value);
	}

	/*
		Name: open
		Namespace: namespace_4c6a0e72
		Checksum: 0x9772144E
		Offset: 0x718
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		namespace_6aaccc24::open(localclientnum);
	}

	/*
		Name: function_147e5271
		Namespace: namespace_4c6a0e72
		Checksum: 0x28255A1D
		Offset: 0x780
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_147e5271(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "line2", value);
	}

	/*
		Name: function_2a377de3
		Namespace: namespace_4c6a0e72
		Checksum: 0x9AE5215A
		Offset: 0x828
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_2a377de3(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "line5", value);
	}

	/*
		Name: function_4b584028
		Namespace: namespace_4c6a0e72
		Checksum: 0x78584389
		Offset: 0x748
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_4b584028(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "line1", value);
	}

	/*
		Name: function_5c1bb138
		Namespace: namespace_4c6a0e72
		Checksum: 0x5ADD175F
		Offset: 0x5E0
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("cp_chyron");
	}

	/*
		Name: set_index
		Namespace: namespace_4c6a0e72
		Checksum: 0x69EC837
		Offset: 0x860
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_index(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "index", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_4c6a0e72
		Checksum: 0xBDF07D9E
		Offset: 0x498
		Size: 0x13C
		Parameters: 6
		Flags: None
	*/
	function setup_clientfields(var_27185c26, var_9da4cb62, var_865fc474, var_1909e1e7, var_2ff7635c, var_eaf012fc)
	{
		namespace_6aaccc24::setup_clientfields("cp_chyron");
		namespace_6aaccc24::function_dcb34c80("string", "line1", 1);
		namespace_6aaccc24::function_dcb34c80("string", "line2", 1);
		namespace_6aaccc24::function_dcb34c80("string", "line3", 1);
		namespace_6aaccc24::function_dcb34c80("string", "line4", 1);
		namespace_6aaccc24::function_dcb34c80("string", "line5", 1);
		namespace_6aaccc24::function_da693cbe("index", 1, 4, "int", var_eaf012fc);
	}

	/*
		Name: function_b7f01956
		Namespace: namespace_4c6a0e72
		Checksum: 0x6D370ACF
		Offset: 0x7F0
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_b7f01956(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "line4", value);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_4c6a0e72
		Checksum: 0xE8755B69
		Offset: 0x608
		Size: 0x108
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
		[[ self ]]->function_d7d2fcce(localclientnum, "line1", #"");
		[[ self ]]->function_d7d2fcce(localclientnum, "line2", #"");
		[[ self ]]->function_d7d2fcce(localclientnum, "line3", #"");
		[[ self ]]->function_d7d2fcce(localclientnum, "line4", #"");
		[[ self ]]->function_d7d2fcce(localclientnum, "line5", #"");
		[[ self ]]->function_d7d2fcce(localclientnum, "index", 0);
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
	elem = new class_4c6a0e72();
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
	Name: function_5c1bb138
	Namespace: cp_chyron
	Checksum: 0x2C29577B
	Offset: 0x2A0
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_4c6a0e72();
	[[ elem ]]->function_5c1bb138();
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
	Name: function_4b584028
	Namespace: cp_chyron
	Checksum: 0xDDEE3BB2
	Offset: 0x358
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_4b584028(localclientnum, value)
{
	[[ self ]]->function_4b584028(localclientnum, value);
}

/*
	Name: function_147e5271
	Namespace: cp_chyron
	Checksum: 0x1BA5E1EA
	Offset: 0x388
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_147e5271(localclientnum, value)
{
	[[ self ]]->function_147e5271(localclientnum, value);
}

/*
	Name: function_6b7b6e4
	Namespace: cp_chyron
	Checksum: 0x71CB1DF5
	Offset: 0x3B8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_6b7b6e4(localclientnum, value)
{
	[[ self ]]->function_6b7b6e4(localclientnum, value);
}

/*
	Name: function_b7f01956
	Namespace: cp_chyron
	Checksum: 0x791BAE81
	Offset: 0x3E8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_b7f01956(localclientnum, value)
{
	[[ self ]]->function_b7f01956(localclientnum, value);
}

/*
	Name: function_2a377de3
	Namespace: cp_chyron
	Checksum: 0x6AA4B6AC
	Offset: 0x418
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_2a377de3(localclientnum, value)
{
	[[ self ]]->function_2a377de3(localclientnum, value);
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

