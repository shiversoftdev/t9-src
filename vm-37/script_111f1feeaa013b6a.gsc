#using scripts\core_common\lui_shared.csc;

class class_81599b35 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_81599b35
		Checksum: 0xB550D7CC
		Offset: 0x2D8
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_81599b35
		Checksum: 0x531364BD
		Offset: 0x3A8
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_81599b35
		Checksum: 0xEB7B87E
		Offset: 0x378
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
		Namespace: namespace_81599b35
		Checksum: 0xEE89349A
		Offset: 0x320
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("BountyHunterBuy");
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_81599b35
		Checksum: 0xB492B128
		Offset: 0x2F8
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("BountyHunterBuy");
	}

	/*
		Name: function_fa582112
		Namespace: namespace_81599b35
		Checksum: 0xA692EB8A
		Offset: 0x348
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
	}

}

#namespace bountyhunterbuy;

/*
	Name: register
	Namespace: bountyhunterbuy
	Checksum: 0x82E732A3
	Offset: 0xA8
	Size: 0x16E
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_81599b35();
	[[ elem ]]->setup_clientfields();
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"bountyhunterbuy"]))
	{
		level.var_ae746e8f[#"bountyhunterbuy"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"bountyhunterbuy"]))
	{
		level.var_ae746e8f[#"bountyhunterbuy"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"bountyhunterbuy"]))
	{
		level.var_ae746e8f[#"bountyhunterbuy"] = array(level.var_ae746e8f[#"bountyhunterbuy"]);
	}
	level.var_ae746e8f[#"bountyhunterbuy"][level.var_ae746e8f[#"bountyhunterbuy"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: bountyhunterbuy
	Checksum: 0xFE3FA916
	Offset: 0x220
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_81599b35();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: bountyhunterbuy
	Checksum: 0xF2736B7C
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
	Namespace: bountyhunterbuy
	Checksum: 0x15001B97
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
	Namespace: bountyhunterbuy
	Checksum: 0x5278DA2F
	Offset: 0x2B0
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

