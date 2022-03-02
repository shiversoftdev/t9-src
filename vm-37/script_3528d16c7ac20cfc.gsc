#using scripts\core_common\lui_shared.csc;

class class_32689523 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_32689523
		Checksum: 0xC0A6ABC9
		Offset: 0x380
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_32689523
		Checksum: 0xFA990194
		Offset: 0x568
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_32689523
		Checksum: 0xFADFBE0B
		Offset: 0x4C8
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		namespace_6aaccc24::open(localclientnum);
	}

	/*
		Name: function_5c1bb138
		Namespace: namespace_32689523
		Checksum: 0x3DF2C520
		Offset: 0x428
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("mp_laststand_client");
	}

	/*
		Name: function_67bdfe40
		Namespace: namespace_32689523
		Checksum: 0xD7FF7043
		Offset: 0x4F8
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_67bdfe40(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "bleedout_progress", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_32689523
		Checksum: 0x3958D5F6
		Offset: 0x3A0
		Size: 0x7C
		Parameters: 2
		Flags: None
	*/
	function setup_clientfields(var_a9a4e140, var_e97e7153)
	{
		namespace_6aaccc24::setup_clientfields("mp_laststand_client");
		namespace_6aaccc24::function_da693cbe("bleedout_progress", 1, 6, "float", var_a9a4e140);
		namespace_6aaccc24::function_da693cbe("revive_progress", 1, 5, "float", var_e97e7153);
	}

	/*
		Name: function_d50fdde9
		Namespace: namespace_32689523
		Checksum: 0x3F47F408
		Offset: 0x530
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_d50fdde9(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "revive_progress", value);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_32689523
		Checksum: 0xA7C99903
		Offset: 0x450
		Size: 0x6C
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
		[[ self ]]->function_d7d2fcce(localclientnum, "bleedout_progress", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "revive_progress", 0);
	}

}

#namespace mp_laststand_client;

/*
	Name: register
	Namespace: mp_laststand_client
	Checksum: 0x9A1D578D
	Offset: 0xE0
	Size: 0x17E
	Parameters: 2
	Flags: None
*/
function register(var_a9a4e140, var_e97e7153)
{
	elem = new class_32689523();
	[[ elem ]]->setup_clientfields(var_a9a4e140, var_e97e7153);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"mp_laststand_client"]))
	{
		level.var_ae746e8f[#"mp_laststand_client"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"mp_laststand_client"]))
	{
		level.var_ae746e8f[#"mp_laststand_client"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"mp_laststand_client"]))
	{
		level.var_ae746e8f[#"mp_laststand_client"] = array(level.var_ae746e8f[#"mp_laststand_client"]);
	}
	level.var_ae746e8f[#"mp_laststand_client"][level.var_ae746e8f[#"mp_laststand_client"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: mp_laststand_client
	Checksum: 0xFB05A285
	Offset: 0x268
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_32689523();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: mp_laststand_client
	Checksum: 0xFBE067A2
	Offset: 0x2A8
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
	Namespace: mp_laststand_client
	Checksum: 0xF53814AC
	Offset: 0x2D0
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
	Namespace: mp_laststand_client
	Checksum: 0xF237DECB
	Offset: 0x2F8
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: function_67bdfe40
	Namespace: mp_laststand_client
	Checksum: 0xB13482E7
	Offset: 0x320
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_67bdfe40(localclientnum, value)
{
	[[ self ]]->function_67bdfe40(localclientnum, value);
}

/*
	Name: function_d50fdde9
	Namespace: mp_laststand_client
	Checksum: 0x9F99E539
	Offset: 0x350
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_d50fdde9(localclientnum, value)
{
	[[ self ]]->function_d50fdde9(localclientnum, value);
}

