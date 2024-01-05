#using scripts\core_common\lui_shared.csc;

class ccp_chyron : cluielem
{

	/*
		Name: constructor
		Namespace: ccp_chyron
		Checksum: 0xABFB1D8D
		Offset: 0x498
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: ccp_chyron
		Checksum: 0xE416AFF7
		Offset: 0x8B8
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: set_line3
		Namespace: ccp_chyron
		Checksum: 0x12778941
		Offset: 0x7D8
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_line3(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "line3", value);
	}

	/*
		Name: open
		Namespace: ccp_chyron
		Checksum: 0x6FDAFD2D
		Offset: 0x738
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function open(localclientnum)
	{
		cluielem::open(localclientnum);
	}

	/*
		Name: set_line2
		Namespace: ccp_chyron
		Checksum: 0xE92D5541
		Offset: 0x7A0
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_line2(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "line2", value);
	}

	/*
		Name: set_line5
		Namespace: ccp_chyron
		Checksum: 0x122C199D
		Offset: 0x848
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_line5(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "line5", value);
	}

	/*
		Name: set_line1
		Namespace: ccp_chyron
		Checksum: 0x7E5E4660
		Offset: 0x768
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_line1(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "line1", value);
	}

	/*
		Name: register_clientside
		Namespace: ccp_chyron
		Checksum: 0xC51F50B9
		Offset: 0x600
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function register_clientside()
	{
		cluielem::register_clientside("cp_chyron");
	}

	/*
		Name: set_index
		Namespace: ccp_chyron
		Checksum: 0xA3082A41
		Offset: 0x880
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_index(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "index", value);
	}

	/*
		Name: setup_clientfields
		Namespace: ccp_chyron
		Checksum: 0x8F4BC3B1
		Offset: 0x4B8
		Size: 0x13C
		Parameters: 6
		Flags: Linked
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
		Checksum: 0x7CDE0DC1
		Offset: 0x810
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_line4(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "line4", value);
	}

	/*
		Name: function_fa582112
		Namespace: ccp_chyron
		Checksum: 0x65BB909A
		Offset: 0x628
		Size: 0x108
		Parameters: 1
		Flags: Linked
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
	Name: function_49392798
	Namespace: cp_chyron
	Checksum: 0x7AF3B964
	Offset: 0xF0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_49392798()
{
	level notify(897291456);
}

/*
	Name: register
	Namespace: cp_chyron
	Checksum: 0xCCBB2989
	Offset: 0x110
	Size: 0x1A6
	Parameters: 6
	Flags: Linked
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
	Checksum: 0x500A6A77
	Offset: 0x2C0
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
	Checksum: 0xAD54BAF4
	Offset: 0x300
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
	Checksum: 0x45C73413
	Offset: 0x328
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
	Checksum: 0xB22877FB
	Offset: 0x350
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
	Checksum: 0xFA13AA05
	Offset: 0x378
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
	Checksum: 0x53B65E82
	Offset: 0x3A8
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
	Checksum: 0xA1A30684
	Offset: 0x3D8
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
	Checksum: 0x63DDDC88
	Offset: 0x408
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
	Checksum: 0x9E35EFED
	Offset: 0x438
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
	Checksum: 0x14F109EF
	Offset: 0x468
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_index(localclientnum, value)
{
	[[ self ]]->set_index(localclientnum, value);
}

