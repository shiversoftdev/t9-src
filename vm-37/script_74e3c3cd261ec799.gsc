#using scripts\core_common\lui_shared.csc;

class class_b5586f52 : cluielem
{

	/*
		Name: constructor
		Namespace: namespace_b5586f52
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
		Namespace: namespace_b5586f52
		Checksum: 0xE2EA79A
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
		Namespace: namespace_b5586f52
		Checksum: 0x5D87F1D3
		Offset: 0x380
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
		Namespace: namespace_b5586f52
		Checksum: 0x1F7F2F89
		Offset: 0x328
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function register_clientside()
	{
		cluielem::register_clientside("sr_objective_timer");
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_b5586f52
		Checksum: 0x1F15312E
		Offset: 0x300
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("sr_objective_timer");
	}

	/*
		Name: function_fa582112
		Namespace: namespace_b5586f52
		Checksum: 0x51D984A3
		Offset: 0x350
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
	}

}

#namespace sr_objective_timer;

/*
	Name: register
	Namespace: sr_objective_timer
	Checksum: 0x2F256D6D
	Offset: 0xB0
	Size: 0x16E
	Parameters: 0
	Flags: Linked
*/
function register()
{
	elem = new class_b5586f52();
	[[ elem ]]->setup_clientfields();
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"sr_objective_timer"]))
	{
		level.var_ae746e8f[#"sr_objective_timer"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"sr_objective_timer"]))
	{
		level.var_ae746e8f[#"sr_objective_timer"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"sr_objective_timer"]))
	{
		level.var_ae746e8f[#"sr_objective_timer"] = array(level.var_ae746e8f[#"sr_objective_timer"]);
	}
	level.var_ae746e8f[#"sr_objective_timer"][level.var_ae746e8f[#"sr_objective_timer"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: sr_objective_timer
	Checksum: 0xEBBC092F
	Offset: 0x228
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new class_b5586f52();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: sr_objective_timer
	Checksum: 0x2D274664
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
	Namespace: sr_objective_timer
	Checksum: 0x16FB416A
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
	Namespace: sr_objective_timer
	Checksum: 0x1D24A8D6
	Offset: 0x2B8
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

