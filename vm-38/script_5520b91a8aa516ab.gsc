#using scripts\core_common\lui_shared.csc;

class class_24ac3512 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_24ac3512
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
		Namespace: namespace_24ac3512
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
		Namespace: namespace_24ac3512
		Checksum: 0x381D3921
		Offset: 0x5B8
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function open(localclientnum)
	{
		namespace_6aaccc24::open(localclientnum);
	}

	/*
		Name: function_2ecbc83c
		Namespace: namespace_24ac3512
		Checksum: 0x7128B02C
		Offset: 0x620
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_2ecbc83c(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "target_locked", value);
	}

	/*
		Name: function_3b7b386a
		Namespace: namespace_24ac3512
		Checksum: 0xAECB0FC3
		Offset: 0x5E8
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_3b7b386a(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "clientnum", value);
	}

	/*
		Name: function_505f092a
		Namespace: namespace_24ac3512
		Checksum: 0xB2C7AAEC
		Offset: 0x658
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_505f092a(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "isHawkTag", value);
	}

	/*
		Name: function_5c1bb138
		Namespace: namespace_24ac3512
		Checksum: 0x27922D22
		Offset: 0x4D8
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("remote_missile_target_lockon");
	}

	/*
		Name: function_7c227f6d
		Namespace: namespace_24ac3512
		Checksum: 0xE32DD631
		Offset: 0x6C8
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_7c227f6d(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "isVehicle", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_24ac3512
		Checksum: 0xB8AD493D
		Offset: 0x488
		Size: 0x44
		Parameters: 5
		Flags: Linked
	*/
	function setup_clientfields(var_c05c67e2, var_486334bd, var_683d075d, killedcallback, var_f1a86fa1)
	{
		namespace_6aaccc24::setup_clientfields("remote_missile_target_lockon");
	}

	/*
		Name: function_b9d6aaa7
		Namespace: namespace_24ac3512
		Checksum: 0x611430A2
		Offset: 0x690
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_b9d6aaa7(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "killed", value);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_24ac3512
		Checksum: 0x49AB1470
		Offset: 0x500
		Size: 0xB0
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
		[[ self ]]->function_d7d2fcce(localclientnum, "clientnum", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "target_locked", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "isHawkTag", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "killed", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "isVehicle", 0);
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
	level notify(717191568);
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
	elem = new class_24ac3512();
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
	Name: function_5c1bb138
	Namespace: remote_missile_target_lockon
	Checksum: 0xE5308EF6
	Offset: 0x2C0
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_24ac3512();
	[[ elem ]]->function_5c1bb138();
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
	Name: function_3b7b386a
	Namespace: remote_missile_target_lockon
	Checksum: 0xF737D4B0
	Offset: 0x378
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_3b7b386a(localclientnum, value)
{
	[[ self ]]->function_3b7b386a(localclientnum, value);
}

/*
	Name: function_2ecbc83c
	Namespace: remote_missile_target_lockon
	Checksum: 0xEA343FCB
	Offset: 0x3A8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_2ecbc83c(localclientnum, value)
{
	[[ self ]]->function_2ecbc83c(localclientnum, value);
}

/*
	Name: function_505f092a
	Namespace: remote_missile_target_lockon
	Checksum: 0x7BF8C5CF
	Offset: 0x3D8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_505f092a(localclientnum, value)
{
	[[ self ]]->function_505f092a(localclientnum, value);
}

/*
	Name: function_b9d6aaa7
	Namespace: remote_missile_target_lockon
	Checksum: 0xB703E743
	Offset: 0x408
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_b9d6aaa7(localclientnum, value)
{
	[[ self ]]->function_b9d6aaa7(localclientnum, value);
}

/*
	Name: function_7c227f6d
	Namespace: remote_missile_target_lockon
	Checksum: 0xBE7A798A
	Offset: 0x438
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_7c227f6d(localclientnum, value)
{
	[[ self ]]->function_7c227f6d(localclientnum, value);
}

