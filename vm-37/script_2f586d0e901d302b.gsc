#using scripts\core_common\lui_shared.csc;

class class_8019ebdc : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_8019ebdc
		Checksum: 0x7C638A2B
		Offset: 0x2E0
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_8019ebdc
		Checksum: 0xCE97CD0C
		Offset: 0x3B0
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_8019ebdc
		Checksum: 0x6078E44F
		Offset: 0x380
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
		Namespace: namespace_8019ebdc
		Checksum: 0xAD290318
		Offset: 0x328
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("mobile_armory_loadout");
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_8019ebdc
		Checksum: 0x2D544A0F
		Offset: 0x300
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("mobile_armory_loadout");
	}

	/*
		Name: function_fa582112
		Namespace: namespace_8019ebdc
		Checksum: 0xA9F94B3B
		Offset: 0x350
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
	}

}

#namespace mobile_armory_loadout;

/*
	Name: register
	Namespace: mobile_armory_loadout
	Checksum: 0x4E2FE83A
	Offset: 0xB0
	Size: 0x16E
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_8019ebdc();
	[[ elem ]]->setup_clientfields();
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"mobile_armory_loadout"]))
	{
		level.var_ae746e8f[#"mobile_armory_loadout"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"mobile_armory_loadout"]))
	{
		level.var_ae746e8f[#"mobile_armory_loadout"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"mobile_armory_loadout"]))
	{
		level.var_ae746e8f[#"mobile_armory_loadout"] = array(level.var_ae746e8f[#"mobile_armory_loadout"]);
	}
	level.var_ae746e8f[#"mobile_armory_loadout"][level.var_ae746e8f[#"mobile_armory_loadout"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: mobile_armory_loadout
	Checksum: 0xC504E1C9
	Offset: 0x228
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_8019ebdc();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: mobile_armory_loadout
	Checksum: 0xC89C55D6
	Offset: 0x268
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
	Namespace: mobile_armory_loadout
	Checksum: 0x6B0A46F8
	Offset: 0x290
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
	Namespace: mobile_armory_loadout
	Checksum: 0x88771CC9
	Offset: 0x2B8
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

