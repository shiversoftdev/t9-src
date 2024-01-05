#using scripts\core_common\lui_shared.csc;

class class_b5586f52 : cluielem
{

	/*
		Name: constructor
		Namespace: namespace_b5586f52
		Checksum: 0x32030C36
		Offset: 0x300
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
		Checksum: 0xF8EC7C3A
		Offset: 0x3D0
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
		Checksum: 0x986DF31B
		Offset: 0x3A0
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
		Checksum: 0x909E9EB7
		Offset: 0x348
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
		Checksum: 0xAB8374E
		Offset: 0x320
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
		Checksum: 0xE84C49C8
		Offset: 0x370
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
	Name: function_80f13d71
	Namespace: sr_objective_timer
	Checksum: 0x6B087814
	Offset: 0xB0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_80f13d71()
{
	level notify(284861366);
}

/*
	Name: register
	Namespace: sr_objective_timer
	Checksum: 0x6118BDC2
	Offset: 0xD0
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
	Checksum: 0x1261F43B
	Offset: 0x248
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
	Checksum: 0xEB7BA0EC
	Offset: 0x288
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
	Checksum: 0x3C077B77
	Offset: 0x2B0
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
	Checksum: 0xB115C4C7
	Offset: 0x2D8
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

