#using scripts\core_common\lui_shared.csc;

class cremote_missile_target_lockon : cluielem
{

	/*
		Name: constructor
		Namespace: cremote_missile_target_lockon
		Checksum: 0x5075BD65
		Offset: 0x468
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
		Checksum: 0x6631B5CC
		Offset: 0x700
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
		Checksum: 0x381D3921
		Offset: 0x5B8
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
		Checksum: 0x7128B02C
		Offset: 0x620
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
		Checksum: 0xAECB0FC3
		Offset: 0x5E8
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
		Checksum: 0xB2C7AAEC
		Offset: 0x658
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
		Checksum: 0x27922D22
		Offset: 0x4D8
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
		Checksum: 0xE32DD631
		Offset: 0x6C8
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
		Checksum: 0xB8AD493D
		Offset: 0x488
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
		Checksum: 0x611430A2
		Offset: 0x690
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
		Checksum: 0x49AB1470
		Offset: 0x500
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
	Name: function_2bd4f39c
	Namespace: remote_missile_target_lockon
	Checksum: 0x4F23383F
	Offset: 0xF8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_2bd4f39c()
{
	level notify(-717191568);
}

/*
	Name: register
	Namespace: remote_missile_target_lockon
	Checksum: 0x21E6D9A0
	Offset: 0x118
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
	Checksum: 0xE5308EF6
	Offset: 0x2C0
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
	Checksum: 0x875E5960
	Offset: 0x300
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
	Checksum: 0x8A22208E
	Offset: 0x328
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
	Checksum: 0x1CFC583F
	Offset: 0x350
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
	Checksum: 0xF737D4B0
	Offset: 0x378
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
	Checksum: 0xEA343FCB
	Offset: 0x3A8
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
	Checksum: 0x7BF8C5CF
	Offset: 0x3D8
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
	Checksum: 0xB703E743
	Offset: 0x408
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
	Checksum: 0xBE7A798A
	Offset: 0x438
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_isvehicle(localclientnum, value)
{
	[[ self ]]->set_isvehicle(localclientnum, value);
}

