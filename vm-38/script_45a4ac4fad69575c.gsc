#using scripts\core_common\lui_shared.csc;

class class_fd95a9c : cluielem
{

	/*
		Name: constructor
		Namespace: namespace_fd95a9c
		Checksum: 0xCA05CB42
		Offset: 0x390
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_fd95a9c
		Checksum: 0xFA0D2AEB
		Offset: 0x580
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_fd95a9c
		Checksum: 0x4FC6C2D1
		Offset: 0x4E0
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		cluielem::open(localclientnum);
	}

	/*
		Name: set_confirmbtn
		Namespace: namespace_fd95a9c
		Checksum: 0x46F58CCC
		Offset: 0x548
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_confirmbtn(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "confirmBtn", value);
	}

	/*
		Name: register_clientside
		Namespace: namespace_fd95a9c
		Checksum: 0x58EBB4CB
		Offset: 0x438
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function register_clientside()
	{
		cluielem::register_clientside("DOA_KeyTrade");
	}

	/*
		Name: set_textboxhint
		Namespace: namespace_fd95a9c
		Checksum: 0xF1937791
		Offset: 0x510
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_textboxhint(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "textBoxHint", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_fd95a9c
		Checksum: 0x653DDBA3
		Offset: 0x3B0
		Size: 0x7C
		Parameters: 2
		Flags: None
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
		Checksum: 0x3A0A9605
		Offset: 0x460
		Size: 0x74
		Parameters: 1
		Flags: None
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
	Name: function_db33eec9
	Namespace: doa_keytrade
	Checksum: 0x882D3581
	Offset: 0xD0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_db33eec9()
{
	level notify(-1804819692);
}

/*
	Name: register
	Namespace: doa_keytrade
	Checksum: 0x24256FE8
	Offset: 0xF0
	Size: 0x17E
	Parameters: 2
	Flags: None
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
	Checksum: 0x31910F9C
	Offset: 0x278
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
	Checksum: 0x71F6CE6A
	Offset: 0x2B8
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
	Checksum: 0xF7D0D2ED
	Offset: 0x2E0
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
	Checksum: 0x1D9FE681
	Offset: 0x308
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
	Checksum: 0xBE3C601
	Offset: 0x330
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
	Checksum: 0xDE0385CE
	Offset: 0x360
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_confirmbtn(localclientnum, value)
{
	[[ self ]]->set_confirmbtn(localclientnum, value);
}

