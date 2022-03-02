#using scripts\core_common\lui_shared.csc;

class class_d4941e5e : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_d4941e5e
		Checksum: 0x5075BD65
		Offset: 0x478
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_d4941e5e
		Checksum: 0x63A25521
		Offset: 0x7E8
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_d4941e5e
		Checksum: 0x4BF0982B
		Offset: 0x6A0
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function open(localclientnum)
	{
		namespace_6aaccc24::open(localclientnum);
	}

	/*
		Name: function_18066380
		Namespace: namespace_d4941e5e
		Checksum: 0x65BF2179
		Offset: 0x778
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_18066380(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "direction", value);
	}

	/*
		Name: function_4d628707
		Namespace: namespace_d4941e5e
		Checksum: 0x1270E340
		Offset: 0x708
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_4d628707(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "awarenessState", value);
	}

	/*
		Name: function_5c1bb138
		Namespace: namespace_d4941e5e
		Checksum: 0x28F6635A
		Offset: 0x5B0
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("stealth_meter_display");
	}

	/*
		Name: function_7425637b
		Namespace: namespace_d4941e5e
		Checksum: 0xF7E59CA9
		Offset: 0x740
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_7425637b(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "awarenessProgress", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_d4941e5e
		Checksum: 0x2061EAF0
		Offset: 0x498
		Size: 0x10C
		Parameters: 5
		Flags: Linked
	*/
	function setup_clientfields(var_5a7b4b38, var_579b061b, var_f10a04a3, var_f228b5fa, var_bda3bf84)
	{
		namespace_6aaccc24::setup_clientfields("stealth_meter_display");
		namespace_6aaccc24::function_da693cbe("entNum", 1, 10, "int", var_5a7b4b38);
		namespace_6aaccc24::function_da693cbe("awarenessState", 1, 4, "int", var_579b061b);
		namespace_6aaccc24::function_da693cbe("awarenessProgress", 1, 4, "float", var_f10a04a3);
		namespace_6aaccc24::function_da693cbe("direction", 1, 4, "float", var_f228b5fa);
		namespace_6aaccc24::function_da693cbe("clamped", 1, 1, "int", var_bda3bf84);
	}

	/*
		Name: function_c8350e33
		Namespace: namespace_d4941e5e
		Checksum: 0x5C125907
		Offset: 0x6D0
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_c8350e33(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "entNum", value);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_d4941e5e
		Checksum: 0xC204E87E
		Offset: 0x5D8
		Size: 0xC0
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
		[[ self ]]->function_d7d2fcce(localclientnum, "entNum", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "awarenessState", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "awarenessProgress", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "direction", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "clamped", 0);
	}

	/*
		Name: function_fae2a569
		Namespace: namespace_d4941e5e
		Checksum: 0xB5E228BC
		Offset: 0x7B0
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_fae2a569(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "clamped", value);
	}

}

#namespace stealth_meter_display;

/*
	Name: function_7308a8ab
	Namespace: stealth_meter_display
	Checksum: 0x973EAED5
	Offset: 0x108
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_7308a8ab()
{
	level notify(1266501413);
}

/*
	Name: register
	Namespace: stealth_meter_display
	Checksum: 0x719EC839
	Offset: 0x128
	Size: 0x19E
	Parameters: 5
	Flags: None
*/
function register(var_5a7b4b38, var_579b061b, var_f10a04a3, var_f228b5fa, var_bda3bf84)
{
	elem = new class_d4941e5e();
	[[ elem ]]->setup_clientfields(var_5a7b4b38, var_579b061b, var_f10a04a3, var_f228b5fa, var_bda3bf84);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"stealth_meter_display"]))
	{
		level.var_ae746e8f[#"stealth_meter_display"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"stealth_meter_display"]))
	{
		level.var_ae746e8f[#"stealth_meter_display"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"stealth_meter_display"]))
	{
		level.var_ae746e8f[#"stealth_meter_display"] = array(level.var_ae746e8f[#"stealth_meter_display"]);
	}
	level.var_ae746e8f[#"stealth_meter_display"][level.var_ae746e8f[#"stealth_meter_display"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: stealth_meter_display
	Checksum: 0x6792CB88
	Offset: 0x2D0
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_5c1bb138()
{
	elem = new class_d4941e5e();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: stealth_meter_display
	Checksum: 0x875E5960
	Offset: 0x310
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function open(player)
{
	[[ self ]]->open(player);
}

/*
	Name: close
	Namespace: stealth_meter_display
	Checksum: 0x8A22208E
	Offset: 0x338
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function close(player)
{
	[[ self ]]->close(player);
}

/*
	Name: is_open
	Namespace: stealth_meter_display
	Checksum: 0x1CFC583F
	Offset: 0x360
	Size: 0x1A
	Parameters: 1
	Flags: Linked
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: function_c8350e33
	Namespace: stealth_meter_display
	Checksum: 0x4C2BEDA4
	Offset: 0x388
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_c8350e33(localclientnum, value)
{
	[[ self ]]->function_c8350e33(localclientnum, value);
}

/*
	Name: function_4d628707
	Namespace: stealth_meter_display
	Checksum: 0x605138CB
	Offset: 0x3B8
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_4d628707(localclientnum, value)
{
	[[ self ]]->function_4d628707(localclientnum, value);
}

/*
	Name: function_7425637b
	Namespace: stealth_meter_display
	Checksum: 0x534A825F
	Offset: 0x3E8
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_7425637b(localclientnum, value)
{
	[[ self ]]->function_7425637b(localclientnum, value);
}

/*
	Name: function_18066380
	Namespace: stealth_meter_display
	Checksum: 0x424CFC5D
	Offset: 0x418
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_18066380(localclientnum, value)
{
	[[ self ]]->function_18066380(localclientnum, value);
}

/*
	Name: function_fae2a569
	Namespace: stealth_meter_display
	Checksum: 0x1ACD70FD
	Offset: 0x448
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_fae2a569(localclientnum, value)
{
	[[ self ]]->function_fae2a569(localclientnum, value);
}

