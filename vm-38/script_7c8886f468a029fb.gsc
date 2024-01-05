#using scripts\core_common\lui_shared.csc;

class class_90c2e4ec : cluielem
{

	/*
		Name: constructor
		Namespace: namespace_90c2e4ec
		Checksum: 0xCA423627
		Offset: 0x398
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_90c2e4ec
		Checksum: 0x7E4FE106
		Offset: 0x578
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_90c2e4ec
		Checksum: 0xD9AA372B
		Offset: 0x4D8
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		cluielem::open(localclientnum);
	}

	/*
		Name: register_clientside
		Namespace: namespace_90c2e4ec
		Checksum: 0xAD2BA357
		Offset: 0x440
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function register_clientside()
	{
		cluielem::register_clientside("sr_orda_health_bar");
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_90c2e4ec
		Checksum: 0xD72BFC53
		Offset: 0x3B8
		Size: 0x7C
		Parameters: 2
		Flags: None
	*/
	function setup_clientfields(healthcallback, var_d79cca54)
	{
		cluielem::setup_clientfields("sr_orda_health_bar");
		cluielem::add_clientfield("health", 4000, 7, "float", healthcallback);
		cluielem::add_clientfield("is_beast", 4000, 1, "int", var_d79cca54);
	}

	/*
		Name: set_is_beast
		Namespace: namespace_90c2e4ec
		Checksum: 0x7FFD40DE
		Offset: 0x540
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_is_beast(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "is_beast", value);
	}

	/*
		Name: set_health
		Namespace: namespace_90c2e4ec
		Checksum: 0x70D100B4
		Offset: 0x508
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_health(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "health", value);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_90c2e4ec
		Checksum: 0xD972ABA1
		Offset: 0x468
		Size: 0x64
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
		[[ self ]]->set_data(localclientnum, "health", 0);
		[[ self ]]->set_data(localclientnum, "is_beast", 0);
	}

}

#namespace sr_orda_health_bar;

/*
	Name: function_41a7b58c
	Namespace: sr_orda_health_bar
	Checksum: 0x21AD2A18
	Offset: 0xD8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_41a7b58c()
{
	level notify(-941724007);
}

/*
	Name: register
	Namespace: sr_orda_health_bar
	Checksum: 0x45795D4D
	Offset: 0xF8
	Size: 0x17E
	Parameters: 2
	Flags: None
*/
function register(healthcallback, var_d79cca54)
{
	elem = new class_90c2e4ec();
	[[ elem ]]->setup_clientfields(healthcallback, var_d79cca54);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"sr_orda_health_bar"]))
	{
		level.var_ae746e8f[#"sr_orda_health_bar"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"sr_orda_health_bar"]))
	{
		level.var_ae746e8f[#"sr_orda_health_bar"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"sr_orda_health_bar"]))
	{
		level.var_ae746e8f[#"sr_orda_health_bar"] = array(level.var_ae746e8f[#"sr_orda_health_bar"]);
	}
	level.var_ae746e8f[#"sr_orda_health_bar"][level.var_ae746e8f[#"sr_orda_health_bar"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: sr_orda_health_bar
	Checksum: 0x74AAB41F
	Offset: 0x280
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new class_90c2e4ec();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: sr_orda_health_bar
	Checksum: 0x3E0ABCB0
	Offset: 0x2C0
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
	Namespace: sr_orda_health_bar
	Checksum: 0xBB0D2404
	Offset: 0x2E8
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
	Namespace: sr_orda_health_bar
	Checksum: 0x7102EF49
	Offset: 0x310
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: set_health
	Namespace: sr_orda_health_bar
	Checksum: 0xD838DDD4
	Offset: 0x338
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_health(localclientnum, value)
{
	[[ self ]]->set_health(localclientnum, value);
}

/*
	Name: set_is_beast
	Namespace: sr_orda_health_bar
	Checksum: 0xA26FEADC
	Offset: 0x368
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_is_beast(localclientnum, value)
{
	[[ self ]]->set_is_beast(localclientnum, value);
}

