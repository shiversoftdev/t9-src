#using scripts\core_common\lui_shared.csc;

class class_9c58d24e : cluielem
{

	/*
		Name: constructor
		Namespace: namespace_9c58d24e
		Checksum: 0x6847223E
		Offset: 0x2F8
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_9c58d24e
		Checksum: 0xD1288E34
		Offset: 0x3C8
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_9c58d24e
		Checksum: 0x6F7D0D69
		Offset: 0x398
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function open(localclientnum)
	{
		cluielem::open(localclientnum);
	}

	/*
		Name: register_clientside
		Namespace: namespace_9c58d24e
		Checksum: 0xF9C8F613
		Offset: 0x340
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function register_clientside()
	{
		cluielem::register_clientside("sr_beacon_menu");
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_9c58d24e
		Checksum: 0x23DE0498
		Offset: 0x318
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("sr_beacon_menu");
	}

	/*
		Name: function_fa582112
		Namespace: namespace_9c58d24e
		Checksum: 0xBF81C59
		Offset: 0x368
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
	}

}

#namespace sr_beacon_menu;

/*
	Name: function_2529039
	Namespace: sr_beacon_menu
	Checksum: 0xF5335478
	Offset: 0xA8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_2529039()
{
	level notify(1104836487);
}

/*
	Name: register
	Namespace: sr_beacon_menu
	Checksum: 0x9655FEE3
	Offset: 0xC8
	Size: 0x16E
	Parameters: 0
	Flags: Linked
*/
function register()
{
	elem = new class_9c58d24e();
	[[ elem ]]->setup_clientfields();
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"sr_beacon_menu"]))
	{
		level.var_ae746e8f[#"sr_beacon_menu"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"sr_beacon_menu"]))
	{
		level.var_ae746e8f[#"sr_beacon_menu"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"sr_beacon_menu"]))
	{
		level.var_ae746e8f[#"sr_beacon_menu"] = array(level.var_ae746e8f[#"sr_beacon_menu"]);
	}
	level.var_ae746e8f[#"sr_beacon_menu"][level.var_ae746e8f[#"sr_beacon_menu"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: sr_beacon_menu
	Checksum: 0xA0447803
	Offset: 0x240
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new class_9c58d24e();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: sr_beacon_menu
	Checksum: 0x4C92B014
	Offset: 0x280
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
	Namespace: sr_beacon_menu
	Checksum: 0x9DE286F
	Offset: 0x2A8
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
	Namespace: sr_beacon_menu
	Checksum: 0xC32F1927
	Offset: 0x2D0
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

