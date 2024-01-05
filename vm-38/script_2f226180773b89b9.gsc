#using scripts\core_common\lui_shared.csc;

class cself_revive_visuals_rush : cluielem
{

	/*
		Name: constructor
		Namespace: cself_revive_visuals_rush
		Checksum: 0x4D8CCE20
		Offset: 0x350
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cself_revive_visuals_rush
		Checksum: 0x672A1259
		Offset: 0x4A0
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: cself_revive_visuals_rush
		Checksum: 0xA7BA79EA
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
		Namespace: cself_revive_visuals_rush
		Checksum: 0xB732F866
		Offset: 0x3C8
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function register_clientside()
	{
		cluielem::register_clientside("self_revive_visuals_rush");
	}

	/*
		Name: setup_clientfields
		Namespace: cself_revive_visuals_rush
		Checksum: 0x6AEC6C4E
		Offset: 0x370
		Size: 0x4C
		Parameters: 1
		Flags: None
	*/
	function setup_clientfields(var_2e62cab3)
	{
		cluielem::setup_clientfields("self_revive_visuals_rush");
		cluielem::add_clientfield("revive_time", 1, 4, "int", var_2e62cab3);
	}

	/*
		Name: set_revive_time
		Namespace: cself_revive_visuals_rush
		Checksum: 0xCFC5B43F
		Offset: 0x468
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_revive_time(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "revive_time", value);
	}

	/*
		Name: function_fa582112
		Namespace: cself_revive_visuals_rush
		Checksum: 0xCE57D110
		Offset: 0x3F0
		Size: 0x40
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
		[[ self ]]->set_data(localclientnum, "revive_time", 0);
	}

}

#namespace self_revive_visuals_rush;

/*
	Name: function_c5ae037d
	Namespace: self_revive_visuals_rush
	Checksum: 0xFC82861B
	Offset: 0xC8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_c5ae037d()
{
	level notify(-1616775891);
}

/*
	Name: register
	Namespace: self_revive_visuals_rush
	Checksum: 0xD8B33847
	Offset: 0xE8
	Size: 0x176
	Parameters: 1
	Flags: None
*/
function register(var_2e62cab3)
{
	elem = new cself_revive_visuals_rush();
	[[ elem ]]->setup_clientfields(var_2e62cab3);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"self_revive_visuals_rush"]))
	{
		level.var_ae746e8f[#"self_revive_visuals_rush"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"self_revive_visuals_rush"]))
	{
		level.var_ae746e8f[#"self_revive_visuals_rush"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"self_revive_visuals_rush"]))
	{
		level.var_ae746e8f[#"self_revive_visuals_rush"] = array(level.var_ae746e8f[#"self_revive_visuals_rush"]);
	}
	level.var_ae746e8f[#"self_revive_visuals_rush"][level.var_ae746e8f[#"self_revive_visuals_rush"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: self_revive_visuals_rush
	Checksum: 0xBD958212
	Offset: 0x268
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new cself_revive_visuals_rush();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: self_revive_visuals_rush
	Checksum: 0xAB7C1ABF
	Offset: 0x2A8
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
	Namespace: self_revive_visuals_rush
	Checksum: 0x2C2BB37
	Offset: 0x2D0
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
	Namespace: self_revive_visuals_rush
	Checksum: 0x71B19878
	Offset: 0x2F8
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: set_revive_time
	Namespace: self_revive_visuals_rush
	Checksum: 0xA4B7668F
	Offset: 0x320
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_revive_time(localclientnum, value)
{
	[[ self ]]->set_revive_time(localclientnum, value);
}

