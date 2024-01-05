#using scripts\core_common\lui_shared.csc;

class class_25c5977f : cluielem
{

	/*
		Name: constructor
		Namespace: namespace_25c5977f
		Checksum: 0x44410434
		Offset: 0x358
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_25c5977f
		Checksum: 0x3D6E3C51
		Offset: 0x4A8
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_25c5977f
		Checksum: 0x8D2E111F
		Offset: 0x440
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
		Namespace: namespace_25c5977f
		Checksum: 0x2B7CA68B
		Offset: 0x3D0
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function register_clientside()
	{
		cluielem::register_clientside("zm_tungsten_title_cards");
	}

	/*
		Name: function_89134efb
		Namespace: namespace_25c5977f
		Checksum: 0x1D0AF15E
		Offset: 0x470
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_89134efb(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "is_title_card_02", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_25c5977f
		Checksum: 0x419AAB67
		Offset: 0x378
		Size: 0x4C
		Parameters: 1
		Flags: Linked
	*/
	function setup_clientfields(var_cb91ced3)
	{
		cluielem::setup_clientfields("zm_tungsten_title_cards");
		cluielem::add_clientfield("is_title_card_02", 4000, 1, "int", var_cb91ced3);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_25c5977f
		Checksum: 0xE95DF02F
		Offset: 0x3F8
		Size: 0x40
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
		[[ self ]]->set_data(localclientnum, "is_title_card_02", 0);
	}

}

#namespace zm_tungsten_title_cards;

/*
	Name: function_63423176
	Namespace: zm_tungsten_title_cards
	Checksum: 0xA42A0FC4
	Offset: 0xD0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_63423176()
{
	level notify(-1793476796);
}

/*
	Name: register
	Namespace: zm_tungsten_title_cards
	Checksum: 0x297DB24B
	Offset: 0xF0
	Size: 0x176
	Parameters: 1
	Flags: Linked
*/
function register(var_cb91ced3)
{
	elem = new class_25c5977f();
	[[ elem ]]->setup_clientfields(var_cb91ced3);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"zm_tungsten_title_cards"]))
	{
		level.var_ae746e8f[#"zm_tungsten_title_cards"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"zm_tungsten_title_cards"]))
	{
		level.var_ae746e8f[#"zm_tungsten_title_cards"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"zm_tungsten_title_cards"]))
	{
		level.var_ae746e8f[#"zm_tungsten_title_cards"] = array(level.var_ae746e8f[#"zm_tungsten_title_cards"]);
	}
	level.var_ae746e8f[#"zm_tungsten_title_cards"][level.var_ae746e8f[#"zm_tungsten_title_cards"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: zm_tungsten_title_cards
	Checksum: 0x9E386FC1
	Offset: 0x270
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new class_25c5977f();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: zm_tungsten_title_cards
	Checksum: 0xC950A47
	Offset: 0x2B0
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
	Namespace: zm_tungsten_title_cards
	Checksum: 0x371BE82F
	Offset: 0x2D8
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
	Namespace: zm_tungsten_title_cards
	Checksum: 0x38B4598
	Offset: 0x300
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: function_89134efb
	Namespace: zm_tungsten_title_cards
	Checksum: 0xAB1DD420
	Offset: 0x328
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_89134efb(localclientnum, value)
{
	[[ self ]]->function_89134efb(localclientnum, value);
}

