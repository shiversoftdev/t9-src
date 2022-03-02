#using scripts\core_common\lui_shared.csc;

class class_600b033d : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_600b033d
		Checksum: 0x8B23F4C
		Offset: 0x330
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_600b033d
		Checksum: 0xF4AB71D2
		Offset: 0x480
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_600b033d
		Checksum: 0xEA9C63EA
		Offset: 0x418
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
		Namespace: namespace_600b033d
		Checksum: 0x300ABFB0
		Offset: 0x3A8
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("self_revive_visuals_rush");
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_600b033d
		Checksum: 0x9730B397
		Offset: 0x350
		Size: 0x4C
		Parameters: 1
		Flags: None
	*/
	function setup_clientfields(var_2e62cab3)
	{
		namespace_6aaccc24::setup_clientfields("self_revive_visuals_rush");
		namespace_6aaccc24::function_da693cbe("revive_time", 1, 4, "int", var_2e62cab3);
	}

	/*
		Name: set_revive_time
		Namespace: namespace_600b033d
		Checksum: 0xBA3A529C
		Offset: 0x448
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_revive_time(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "revive_time", value);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_600b033d
		Checksum: 0x4D5FC9F6
		Offset: 0x3D0
		Size: 0x40
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
		[[ self ]]->function_d7d2fcce(localclientnum, "revive_time", 0);
	}

}

#namespace self_revive_visuals_rush;

/*
	Name: register
	Namespace: self_revive_visuals_rush
	Checksum: 0x2CFE7F8B
	Offset: 0xC8
	Size: 0x176
	Parameters: 1
	Flags: None
*/
function register(var_2e62cab3)
{
	elem = new class_600b033d();
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
	Name: function_5c1bb138
	Namespace: self_revive_visuals_rush
	Checksum: 0xC6213D2
	Offset: 0x248
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_600b033d();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: self_revive_visuals_rush
	Checksum: 0xA013B51C
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
	Namespace: self_revive_visuals_rush
	Checksum: 0x26818F9B
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
	Namespace: self_revive_visuals_rush
	Checksum: 0x4631A662
	Offset: 0x2D8
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
	Checksum: 0x267E0C91
	Offset: 0x300
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_revive_time(localclientnum, value)
{
	[[ self ]]->set_revive_time(localclientnum, value);
}

