#using scripts\core_common\lui_shared.csc;

class class_8ebbf51b : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_8ebbf51b
		Checksum: 0x7C638A2B
		Offset: 0x2D8
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_8ebbf51b
		Checksum: 0xCE97CD0C
		Offset: 0x3A8
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_8ebbf51b
		Checksum: 0x6078E44F
		Offset: 0x378
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
		Namespace: namespace_8ebbf51b
		Checksum: 0xAD290318
		Offset: 0x320
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("sr_armor_menu");
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_8ebbf51b
		Checksum: 0x2D544A0F
		Offset: 0x2F8
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("sr_armor_menu");
	}

	/*
		Name: function_fa582112
		Namespace: namespace_8ebbf51b
		Checksum: 0xA9F94B3B
		Offset: 0x348
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
	}

}

#namespace sr_armor_menu;

/*
	Name: register
	Namespace: sr_armor_menu
	Checksum: 0x43C3B2D4
	Offset: 0xA8
	Size: 0x16E
	Parameters: 0
	Flags: Linked
*/
function register()
{
	elem = new class_8ebbf51b();
	[[ elem ]]->setup_clientfields();
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"sr_armor_menu"]))
	{
		level.var_ae746e8f[#"sr_armor_menu"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"sr_armor_menu"]))
	{
		level.var_ae746e8f[#"sr_armor_menu"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"sr_armor_menu"]))
	{
		level.var_ae746e8f[#"sr_armor_menu"] = array(level.var_ae746e8f[#"sr_armor_menu"]);
	}
	level.var_ae746e8f[#"sr_armor_menu"][level.var_ae746e8f[#"sr_armor_menu"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: sr_armor_menu
	Checksum: 0x73419635
	Offset: 0x220
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_8ebbf51b();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: sr_armor_menu
	Checksum: 0xC89C55D6
	Offset: 0x260
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
	Namespace: sr_armor_menu
	Checksum: 0x6B0A46F8
	Offset: 0x288
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
	Namespace: sr_armor_menu
	Checksum: 0x88771CC9
	Offset: 0x2B0
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

