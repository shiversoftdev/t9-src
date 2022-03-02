#using scripts\core_common\lui_shared.csc;

class class_5813c56a : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_5813c56a
		Checksum: 0xDDCEE5BF
		Offset: 0x370
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
		Checksum: 0x406D7D10
		Offset: 0x548
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
		Checksum: 0xE0229A68
		Offset: 0x4A8
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
		Checksum: 0x44C8846B
		Offset: 0x510
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
		Checksum: 0x77B069F1
		Offset: 0x418
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
		Checksum: 0x589D6726
		Offset: 0x390
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
		Checksum: 0x22031DBE
		Offset: 0x4D8
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
		Checksum: 0xC2EADB9F
		Offset: 0x440
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
	Name: register
	Namespace: zm_silver_hud
	Checksum: 0x9613EBD3
	Offset: 0xD0
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
	Checksum: 0x7FEA42B9
	Offset: 0x258
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
	Checksum: 0xFEAE6ECB
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
	Namespace: zm_silver_hud
	Checksum: 0xED3935EA
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
	Namespace: zm_silver_hud
	Checksum: 0x63E2A6A4
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
	Name: function_9efecfd1
	Namespace: zm_silver_hud
	Checksum: 0xDBC11664
	Offset: 0x310
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
	Checksum: 0xC2228C0
	Offset: 0x340
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_39ee9107(localclientnum, value)
{
	[[ self ]]->function_39ee9107(localclientnum, value);
}

