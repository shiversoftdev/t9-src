#using scripts\core_common\lui_shared.csc;

class cself_respawn : cluielem
{

	/*
		Name: constructor
		Namespace: cself_respawn
		Checksum: 0x999020D4
		Offset: 0x348
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cself_respawn
		Checksum: 0xDAA783F2
		Offset: 0x4A0
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: set_percent
		Namespace: cself_respawn
		Checksum: 0x7F231CEC
		Offset: 0x468
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_percent(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "percent", value);
	}

	/*
		Name: open
		Namespace: cself_respawn
		Checksum: 0x6760E502
		Offset: 0x438
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
		Namespace: cself_respawn
		Checksum: 0x3DD4B28F
		Offset: 0x3C0
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function register_clientside()
	{
		cluielem::register_clientside("self_respawn");
	}

	/*
		Name: setup_clientfields
		Namespace: cself_respawn
		Checksum: 0x1D696B36
		Offset: 0x368
		Size: 0x4C
		Parameters: 1
		Flags: None
	*/
	function setup_clientfields(var_1089a5f3)
	{
		cluielem::setup_clientfields("self_respawn");
		cluielem::add_clientfield("percent", 1, 6, "float", var_1089a5f3);
	}

	/*
		Name: function_fa582112
		Namespace: cself_respawn
		Checksum: 0x479F3D60
		Offset: 0x3E8
		Size: 0x48
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
		[[ self ]]->set_data(localclientnum, "percent", 0);
	}

}

#namespace self_respawn;

/*
	Name: function_87ee9c1d
	Namespace: self_respawn
	Checksum: 0xF32BA99E
	Offset: 0xC0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_87ee9c1d()
{
	level notify(-1759616643);
}

/*
	Name: register
	Namespace: self_respawn
	Checksum: 0x2C5FDC7B
	Offset: 0xE0
	Size: 0x176
	Parameters: 1
	Flags: None
*/
function register(var_1089a5f3)
{
	elem = new cself_respawn();
	[[ elem ]]->setup_clientfields(var_1089a5f3);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"self_respawn"]))
	{
		level.var_ae746e8f[#"self_respawn"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"self_respawn"]))
	{
		level.var_ae746e8f[#"self_respawn"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"self_respawn"]))
	{
		level.var_ae746e8f[#"self_respawn"] = array(level.var_ae746e8f[#"self_respawn"]);
	}
	level.var_ae746e8f[#"self_respawn"][level.var_ae746e8f[#"self_respawn"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: self_respawn
	Checksum: 0xFE2FF996
	Offset: 0x260
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new cself_respawn();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: self_respawn
	Checksum: 0xD796C27F
	Offset: 0x2A0
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
	Namespace: self_respawn
	Checksum: 0xCC475B03
	Offset: 0x2C8
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
	Namespace: self_respawn
	Checksum: 0x99547063
	Offset: 0x2F0
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: set_percent
	Namespace: self_respawn
	Checksum: 0xD0D8B6EE
	Offset: 0x318
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_percent(localclientnum, value)
{
	[[ self ]]->set_percent(localclientnum, value);
}

