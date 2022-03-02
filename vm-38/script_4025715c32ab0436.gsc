#using scripts\core_common\lui_shared.csc;

class class_5813c56a : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_5813c56a
		Checksum: 0xB776CD1A
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
		Namespace: namespace_5813c56a
		Checksum: 0x8397FDFC
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
		Namespace: namespace_5813c56a
		Checksum: 0xC19FB2C6
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
		Name: function_39ee9107
		Namespace: namespace_5813c56a
		Checksum: 0xFB11C6D6
		Offset: 0x530
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_39ee9107(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "showPhoto", value);
	}

	/*
		Name: function_5c1bb138
		Namespace: namespace_5813c56a
		Checksum: 0x16754AE2
		Offset: 0x438
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("zm_silver_hud");
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_5813c56a
		Checksum: 0x122FCC05
		Offset: 0x3B0
		Size: 0x7C
		Parameters: 2
		Flags: None
	*/
	function setup_clientfields(var_a7dcee14, var_5cdd6232)
	{
		namespace_6aaccc24::setup_clientfields("zm_silver_hud");
		namespace_6aaccc24::function_da693cbe("aetherscopeStatus", 1, 2, "int", var_a7dcee14);
		namespace_6aaccc24::function_da693cbe("showPhoto", 1, 1, "int", var_5cdd6232);
	}

	/*
		Name: function_9efecfd1
		Namespace: namespace_5813c56a
		Checksum: 0x604F0B5F
		Offset: 0x4F8
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_9efecfd1(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "aetherscopeStatus", value);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_5813c56a
		Checksum: 0x7752B8E3
		Offset: 0x460
		Size: 0x5C
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
		[[ self ]]->function_d7d2fcce(localclientnum, "aetherscopeStatus", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "showPhoto", 0);
	}

}

#namespace zm_silver_hud;

/*
	Name: function_5cd697e6
	Namespace: zm_silver_hud
	Checksum: 0xC36C9DED
	Offset: 0xD0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_5cd697e6()
{
	level notify(1143308275);
}

/*
	Name: register
	Namespace: zm_silver_hud
	Checksum: 0x7F963E7A
	Offset: 0xF0
	Size: 0x17E
	Parameters: 2
	Flags: None
*/
function register(var_a7dcee14, var_5cdd6232)
{
	elem = new class_5813c56a();
	[[ elem ]]->setup_clientfields(var_a7dcee14, var_5cdd6232);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"zm_silver_hud"]))
	{
		level.var_ae746e8f[#"zm_silver_hud"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"zm_silver_hud"]))
	{
		level.var_ae746e8f[#"zm_silver_hud"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"zm_silver_hud"]))
	{
		level.var_ae746e8f[#"zm_silver_hud"] = array(level.var_ae746e8f[#"zm_silver_hud"]);
	}
	level.var_ae746e8f[#"zm_silver_hud"][level.var_ae746e8f[#"zm_silver_hud"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: zm_silver_hud
	Checksum: 0x87A53E01
	Offset: 0x278
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_5813c56a();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: zm_silver_hud
	Checksum: 0x8E37ED85
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
	Namespace: zm_silver_hud
	Checksum: 0x30E117C8
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
	Namespace: zm_silver_hud
	Checksum: 0xE5A81192
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
	Name: function_9efecfd1
	Namespace: zm_silver_hud
	Checksum: 0x6D0E0B80
	Offset: 0x330
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_9efecfd1(localclientnum, value)
{
	[[ self ]]->function_9efecfd1(localclientnum, value);
}

/*
	Name: function_39ee9107
	Namespace: zm_silver_hud
	Checksum: 0x3FE969F9
	Offset: 0x360
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_39ee9107(localclientnum, value)
{
	[[ self ]]->function_39ee9107(localclientnum, value);
}

