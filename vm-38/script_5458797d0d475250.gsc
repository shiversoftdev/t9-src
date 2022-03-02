#using scripts\core_common\lui_shared.csc;

class class_25c5977f : class_6aaccc24
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
		namespace_6aaccc24::open(localclientnum);
	}

	/*
		Name: function_5c1bb138
		Namespace: namespace_25c5977f
		Checksum: 0x2B7CA68B
		Offset: 0x3D0
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("zm_tungsten_title_cards");
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
		[[ self ]]->function_d7d2fcce(localclientnum, "is_title_card_02", value);
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
		namespace_6aaccc24::setup_clientfields("zm_tungsten_title_cards");
		namespace_6aaccc24::function_da693cbe("is_title_card_02", 4000, 1, "int", var_cb91ced3);
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
		namespace_6aaccc24::function_fa582112(localclientnum);
		[[ self ]]->function_d7d2fcce(localclientnum, "is_title_card_02", 0);
	}

}

#namespace namespace_6783631d;

/*
	Name: function_63423176
	Namespace: namespace_6783631d
	Checksum: 0xA42A0FC4
	Offset: 0xD0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_63423176()
{
	level notify(1793476796);
}

/*
	Name: register
	Namespace: namespace_6783631d
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
	if(!isdefined(level.var_ae746e8f[#"hash_33eaad913c636274"]))
	{
		level.var_ae746e8f[#"hash_33eaad913c636274"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"hash_33eaad913c636274"]))
	{
		level.var_ae746e8f[#"hash_33eaad913c636274"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"hash_33eaad913c636274"]))
	{
		level.var_ae746e8f[#"hash_33eaad913c636274"] = array(level.var_ae746e8f[#"hash_33eaad913c636274"]);
	}
	level.var_ae746e8f[#"hash_33eaad913c636274"][level.var_ae746e8f[#"hash_33eaad913c636274"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: namespace_6783631d
	Checksum: 0x9E386FC1
	Offset: 0x270
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_25c5977f();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: namespace_6783631d
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
	Namespace: namespace_6783631d
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
	Namespace: namespace_6783631d
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
	Namespace: namespace_6783631d
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

