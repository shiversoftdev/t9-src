#using scripts\core_common\lui_shared.csc;

class class_1762fc34 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_1762fc34
		Checksum: 0x3BCEC622
		Offset: 0x300
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_1762fc34
		Checksum: 0x6256C5C1
		Offset: 0x3D0
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_1762fc34
		Checksum: 0x4545CB00
		Offset: 0x3A0
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function open(localclientnum)
	{
		namespace_6aaccc24::open(localclientnum);
	}

	/*
		Name: function_5c1bb138
		Namespace: namespace_1762fc34
		Checksum: 0x3F64661C
		Offset: 0x348
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("lui_napalm_strike");
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_1762fc34
		Checksum: 0xA644F64E
		Offset: 0x320
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("lui_napalm_strike");
	}

	/*
		Name: function_fa582112
		Namespace: namespace_1762fc34
		Checksum: 0x1BD22C71
		Offset: 0x370
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
	}

}

#namespace lui_napalm_strike;

/*
	Name: function_cb42875a
	Namespace: lui_napalm_strike
	Checksum: 0xC8379C45
	Offset: 0xB0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_cb42875a()
{
	level notify(1469166775);
}

/*
	Name: register
	Namespace: lui_napalm_strike
	Checksum: 0x6232C095
	Offset: 0xD0
	Size: 0x16E
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_1762fc34();
	[[ elem ]]->setup_clientfields();
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"lui_napalm_strike"]))
	{
		level.var_ae746e8f[#"lui_napalm_strike"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"lui_napalm_strike"]))
	{
		level.var_ae746e8f[#"lui_napalm_strike"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"lui_napalm_strike"]))
	{
		level.var_ae746e8f[#"lui_napalm_strike"] = array(level.var_ae746e8f[#"lui_napalm_strike"]);
	}
	level.var_ae746e8f[#"lui_napalm_strike"][level.var_ae746e8f[#"lui_napalm_strike"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: lui_napalm_strike
	Checksum: 0xFAD38267
	Offset: 0x248
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_1762fc34();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: lui_napalm_strike
	Checksum: 0xAA4C3D4A
	Offset: 0x288
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
	Namespace: lui_napalm_strike
	Checksum: 0xCE0C5BF0
	Offset: 0x2B0
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
	Namespace: lui_napalm_strike
	Checksum: 0x54C22DD7
	Offset: 0x2D8
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

