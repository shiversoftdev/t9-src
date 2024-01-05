#using scripts\core_common\lui_shared.csc;

class cbountyhunterbuy : cluielem
{

	/*
		Name: constructor
		Namespace: cbountyhunterbuy
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
		Namespace: cbountyhunterbuy
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
		Namespace: cbountyhunterbuy
		Checksum: 0xEB7B87E
		Offset: 0x378
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
		Namespace: cbountyhunterbuy
		Checksum: 0xEE89349A
		Offset: 0x320
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function register_clientside()
	{
		cluielem::register_clientside("BountyHunterBuy");
	}

	/*
		Name: setup_clientfields
		Namespace: cbountyhunterbuy
		Checksum: 0xB492B128
		Offset: 0x2F8
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("BountyHunterBuy");
	}

	/*
		Name: function_fa582112
		Namespace: cbountyhunterbuy
		Checksum: 0xA692EB8A
		Offset: 0x348
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
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
	elem = new cbountyhunterbuy();
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
	Name: register_clientside
	Namespace: bountyhunterbuy
	Checksum: 0xFE3FA916
	Offset: 0x220
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new cbountyhunterbuy();
	[[ elem ]]->register_clientside();
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

