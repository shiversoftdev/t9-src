#using scripts\core_common\lui_shared.csc;

class cremote_missile_target_lockon : cluielem
{

	/*
		Name: constructor
		Namespace: cremote_missile_target_lockon
		Checksum: 0xCF392755
		Offset: 0x448
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cremote_missile_target_lockon
		Checksum: 0x694E78A8
		Offset: 0x6E0
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: cremote_missile_target_lockon
		Checksum: 0xC84E5076
		Offset: 0x598
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function open(localclientnum)
	{
		cluielem::open(localclientnum);
	}

	/*
		Name: set_target_locked
		Namespace: cremote_missile_target_lockon
		Checksum: 0x19D3DB91
		Offset: 0x600
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_target_locked(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "target_locked", value);
	}

	/*
		Name: set_clientnum
		Namespace: cremote_missile_target_lockon
		Checksum: 0x365EB355
		Offset: 0x5C8
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_clientnum(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "clientnum", value);
	}

	/*
		Name: set_ishawktag
		Namespace: cremote_missile_target_lockon
		Checksum: 0x64959C46
		Offset: 0x638
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_ishawktag(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "isHawkTag", value);
	}

	/*
		Name: register_clientside
		Namespace: cremote_missile_target_lockon
		Checksum: 0x419FD66E
		Offset: 0x4B8
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function register_clientside()
	{
		cluielem::register_clientside("remote_missile_target_lockon");
	}

	/*
		Name: set_isvehicle
		Namespace: cremote_missile_target_lockon
		Checksum: 0x3E082E86
		Offset: 0x6A8
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_isvehicle(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "isVehicle", value);
	}

	/*
		Name: setup_clientfields
		Namespace: cremote_missile_target_lockon
		Checksum: 0xFEAF59BF
		Offset: 0x468
		Size: 0x44
		Parameters: 5
		Flags: Linked
	*/
	function setup_clientfields(var_c05c67e2, var_486334bd, var_683d075d, killedcallback, var_f1a86fa1)
	{
		cluielem::setup_clientfields("remote_missile_target_lockon");
	}

	/*
		Name: set_killed
		Namespace: cremote_missile_target_lockon
		Checksum: 0xAC3E8083
		Offset: 0x670
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_killed(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "killed", value);
	}

	/*
		Name: function_fa582112
		Namespace: cremote_missile_target_lockon
		Checksum: 0x5958C152
		Offset: 0x4E0
		Size: 0xB0
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
		[[ self ]]->set_data(localclientnum, "clientnum", 0);
		[[ self ]]->set_data(localclientnum, "target_locked", 0);
		[[ self ]]->set_data(localclientnum, "isHawkTag", 0);
		[[ self ]]->set_data(localclientnum, "killed", 0);
		[[ self ]]->set_data(localclientnum, "isVehicle", 0);
	}

}

#namespace remote_missile_target_lockon;

/*
	Name: register
	Namespace: remote_missile_target_lockon
	Checksum: 0x6AA71046
	Offset: 0xF8
	Size: 0x19E
	Parameters: 5
	Flags: Linked
*/
function register(var_c05c67e2, var_486334bd, var_683d075d, killedcallback, var_f1a86fa1)
{
	elem = new cremote_missile_target_lockon();
	[[ elem ]]->setup_clientfields(var_c05c67e2, var_486334bd, var_683d075d, killedcallback, var_f1a86fa1);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"remote_missile_target_lockon"]))
	{
		level.var_ae746e8f[#"remote_missile_target_lockon"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"remote_missile_target_lockon"]))
	{
		level.var_ae746e8f[#"remote_missile_target_lockon"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"remote_missile_target_lockon"]))
	{
		level.var_ae746e8f[#"remote_missile_target_lockon"] = array(level.var_ae746e8f[#"remote_missile_target_lockon"]);
	}
	level.var_ae746e8f[#"remote_missile_target_lockon"][level.var_ae746e8f[#"remote_missile_target_lockon"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: remote_missile_target_lockon
	Checksum: 0xDFDA30CE
	Offset: 0x2A0
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new cremote_missile_target_lockon();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: remote_missile_target_lockon
	Checksum: 0xFC54D539
	Offset: 0x2E0
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
	Namespace: remote_missile_target_lockon
	Checksum: 0x7810E512
	Offset: 0x308
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
	Namespace: remote_missile_target_lockon
	Checksum: 0xCE5DE73D
	Offset: 0x330
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: set_clientnum
	Namespace: remote_missile_target_lockon
	Checksum: 0x4BF1D10D
	Offset: 0x358
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_clientnum(localclientnum, value)
{
	[[ self ]]->set_clientnum(localclientnum, value);
}

/*
	Name: set_target_locked
	Namespace: remote_missile_target_lockon
	Checksum: 0xCD10DBAE
	Offset: 0x388
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_target_locked(localclientnum, value)
{
	[[ self ]]->set_target_locked(localclientnum, value);
}

/*
	Name: set_ishawktag
	Namespace: remote_missile_target_lockon
	Checksum: 0x7B77FC40
	Offset: 0x3B8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_ishawktag(localclientnum, value)
{
	[[ self ]]->set_ishawktag(localclientnum, value);
}

/*
	Name: set_killed
	Namespace: remote_missile_target_lockon
	Checksum: 0x81CB14D7
	Offset: 0x3E8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_killed(localclientnum, value)
{
	[[ self ]]->set_killed(localclientnum, value);
}

/*
	Name: set_isvehicle
	Namespace: remote_missile_target_lockon
	Checksum: 0x1A7619ED
	Offset: 0x418
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_isvehicle(localclientnum, value)
{
	[[ self ]]->set_isvehicle(localclientnum, value);
}

