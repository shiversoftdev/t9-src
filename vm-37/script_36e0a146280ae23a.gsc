#using scripts\core_common\lui_shared.csc;

class class_e1dc992f : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_e1dc992f
		Checksum: 0x467B1168
		Offset: 0x2E0
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_e1dc992f
		Checksum: 0x143F04C3
		Offset: 0x3B0
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_e1dc992f
		Checksum: 0x120E04A5
		Offset: 0x380
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
		Namespace: namespace_e1dc992f
		Checksum: 0x3F426332
		Offset: 0x328
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("sr_crafting_table_menu");
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_e1dc992f
		Checksum: 0xB43775F5
		Offset: 0x300
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("sr_crafting_table_menu");
	}

	/*
		Name: function_fa582112
		Namespace: namespace_e1dc992f
		Checksum: 0xB96C3F2B
		Offset: 0x350
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
	}

}

#namespace sr_crafting_table_menu;

/*
	Name: register
	Namespace: sr_crafting_table_menu
	Checksum: 0x54C22F41
	Offset: 0xB0
	Size: 0x16E
	Parameters: 0
	Flags: Linked
*/
function register()
{
	elem = new class_e1dc992f();
	[[ elem ]]->setup_clientfields();
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"sr_crafting_table_menu"]))
	{
		level.var_ae746e8f[#"sr_crafting_table_menu"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"sr_crafting_table_menu"]))
	{
		level.var_ae746e8f[#"sr_crafting_table_menu"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"sr_crafting_table_menu"]))
	{
		level.var_ae746e8f[#"sr_crafting_table_menu"] = array(level.var_ae746e8f[#"sr_crafting_table_menu"]);
	}
	level.var_ae746e8f[#"sr_crafting_table_menu"][level.var_ae746e8f[#"sr_crafting_table_menu"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: sr_crafting_table_menu
	Checksum: 0x5D8E23DB
	Offset: 0x228
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_e1dc992f();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: sr_crafting_table_menu
	Checksum: 0xFA87EE0E
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
	Namespace: sr_crafting_table_menu
	Checksum: 0x7C6BAA87
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
	Namespace: sr_crafting_table_menu
	Checksum: 0xF5E5C0E0
	Offset: 0x2B8
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

