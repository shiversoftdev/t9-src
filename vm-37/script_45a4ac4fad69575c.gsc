#using scripts\core_common\lui_shared.csc;

class class_fd95a9c : cluielem
{

	/*
		Name: constructor
		Namespace: namespace_fd95a9c
		Checksum: 0xD444D2CE
		Offset: 0x370
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_fd95a9c
		Checksum: 0xF5B94E1D
		Offset: 0x560
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_fd95a9c
		Checksum: 0x31B0D3E9
		Offset: 0x4C0
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function open(localclientnum)
	{
		cluielem::open(localclientnum);
	}

	/*
		Name: set_confirmbtn
		Namespace: namespace_fd95a9c
		Checksum: 0x52B0309E
		Offset: 0x528
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_confirmbtn(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "confirmBtn", value);
	}

	/*
		Name: register_clientside
		Namespace: namespace_fd95a9c
		Checksum: 0x8911C24C
		Offset: 0x418
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function register_clientside()
	{
		cluielem::register_clientside("DOA_KeyTrade");
	}

	/*
		Name: set_textboxhint
		Namespace: namespace_fd95a9c
		Checksum: 0x12A1F6E7
		Offset: 0x4F0
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_textboxhint(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "textBoxHint", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_fd95a9c
		Checksum: 0x99B95ADD
		Offset: 0x390
		Size: 0x7C
		Parameters: 2
		Flags: Linked
	*/
	function setup_clientfields(var_909954a3, var_66f4eb53)
	{
		cluielem::setup_clientfields("DOA_KeyTrade");
		cluielem::function_dcb34c80("string", "textBoxHint", 1);
		cluielem::function_dcb34c80("string", "confirmBtn", 1);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_fd95a9c
		Checksum: 0xC445C8BD
		Offset: 0x440
		Size: 0x74
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
		[[ self ]]->set_data(localclientnum, "textBoxHint", #"");
		[[ self ]]->set_data(localclientnum, "confirmBtn", #"");
	}

}

#namespace doa_keytrade;

/*
	Name: register
	Namespace: doa_keytrade
	Checksum: 0xFC71CB95
	Offset: 0xD0
	Size: 0x17E
	Parameters: 2
	Flags: Linked
*/
function register(var_909954a3, var_66f4eb53)
{
	elem = new class_fd95a9c();
	[[ elem ]]->setup_clientfields(var_909954a3, var_66f4eb53);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"doa_keytrade"]))
	{
		level.var_ae746e8f[#"doa_keytrade"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"doa_keytrade"]))
	{
		level.var_ae746e8f[#"doa_keytrade"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"doa_keytrade"]))
	{
		level.var_ae746e8f[#"doa_keytrade"] = array(level.var_ae746e8f[#"doa_keytrade"]);
	}
	level.var_ae746e8f[#"doa_keytrade"][level.var_ae746e8f[#"doa_keytrade"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: doa_keytrade
	Checksum: 0x8910B407
	Offset: 0x258
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new class_fd95a9c();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: doa_keytrade
	Checksum: 0x4F0ADB9F
	Offset: 0x298
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
	Namespace: doa_keytrade
	Checksum: 0xCDB1A4BB
	Offset: 0x2C0
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
	Namespace: doa_keytrade
	Checksum: 0x72821333
	Offset: 0x2E8
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: set_textboxhint
	Namespace: doa_keytrade
	Checksum: 0x5CE8ADD9
	Offset: 0x310
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_textboxhint(localclientnum, value)
{
	[[ self ]]->set_textboxhint(localclientnum, value);
}

/*
	Name: set_confirmbtn
	Namespace: doa_keytrade
	Checksum: 0x66CB5BC3
	Offset: 0x340
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_confirmbtn(localclientnum, value)
{
	[[ self ]]->set_confirmbtn(localclientnum, value);
}

