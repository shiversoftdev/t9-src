#using scripts\core_common\lui_shared.csc;

class class_32689523 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_32689523
		Checksum: 0x1E1925B6
		Offset: 0x3A0
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
		Checksum: 0x593F3433
		Offset: 0x588
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
		Checksum: 0xA90560F
		Offset: 0x4E8
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
		Checksum: 0x9B84CCE1
		Offset: 0x448
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
		Checksum: 0x46F00E78
		Offset: 0x518
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
		Checksum: 0x6DC80C94
		Offset: 0x3C0
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
		Checksum: 0x14977856
		Offset: 0x550
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
		Checksum: 0x979368DB
		Offset: 0x470
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
	Name: function_1b04d38
	Namespace: mp_laststand_client
	Checksum: 0xC9563A75
	Offset: 0xE0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_1b04d38()
{
	level notify(228569532);
}

/*
	Name: register
	Namespace: mp_laststand_client
	Checksum: 0x21905362
	Offset: 0x100
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
	Checksum: 0x28720300
	Offset: 0x288
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
	Checksum: 0x30C153CC
	Offset: 0x2C8
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
	Checksum: 0x5DBF26A
	Offset: 0x2F0
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
	Checksum: 0xF8480F91
	Offset: 0x318
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
	Checksum: 0x1B7DF8A0
	Offset: 0x340
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
	Checksum: 0x1CEF86D5
	Offset: 0x370
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_d50fdde9(localclientnum, value)
{
	[[ self ]]->function_d50fdde9(localclientnum, value);
}

