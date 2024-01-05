#using scripts\core_common\lui_shared.csc;

class csr_armor_menu : cluielem
{

	/*
		Name: constructor
		Namespace: csr_armor_menu
		Checksum: 0xF58476EA
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
		Namespace: csr_armor_menu
		Checksum: 0x9604EE4A
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
		Namespace: csr_armor_menu
		Checksum: 0xE9672F07
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
		Namespace: csr_armor_menu
		Checksum: 0x343720C7
		Offset: 0x340
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
		Checksum: 0xA460A7EA
		Offset: 0x318
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
		Checksum: 0xBB37DD6E
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

#namespace sr_armor_menu;

/*
	Name: function_b8e0052b
	Namespace: sr_armor_menu
	Checksum: 0x53760D2
	Offset: 0xA8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b8e0052b()
{
	level notify(44166574);
}

/*
	Name: register
	Namespace: sr_armor_menu
	Checksum: 0xDFC0B962
	Offset: 0xC8
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
	Checksum: 0xE1663481
	Offset: 0x240
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
	Checksum: 0xB035C16B
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
	Namespace: sr_armor_menu
	Checksum: 0x8A5D773E
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
	Namespace: sr_armor_menu
	Checksum: 0xEAA27B4E
	Offset: 0x2D0
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

