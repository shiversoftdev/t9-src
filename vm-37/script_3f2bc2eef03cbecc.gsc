#using scripts\core_common\lui_shared.csc;

class csr_armor_menu : cluielem
{

	/*
		Name: constructor
		Namespace: csr_armor_menu
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
		Namespace: csr_armor_menu
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
		Namespace: csr_armor_menu
		Checksum: 0x6078E44F
		Offset: 0x378
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
		Namespace: csr_armor_menu
		Checksum: 0xAD290318
		Offset: 0x320
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function register_clientside()
	{
		cluielem::register_clientside("sr_armor_menu");
	}

	/*
		Name: setup_clientfields
		Namespace: csr_armor_menu
		Checksum: 0x2D544A0F
		Offset: 0x2F8
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("sr_armor_menu");
	}

	/*
		Name: function_fa582112
		Namespace: csr_armor_menu
		Checksum: 0xA9F94B3B
		Offset: 0x348
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
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
	elem = new csr_armor_menu();
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
	Name: register_clientside
	Namespace: sr_armor_menu
	Checksum: 0x73419635
	Offset: 0x220
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new csr_armor_menu();
	[[ elem ]]->register_clientside();
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

