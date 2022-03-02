#using scripts\core_common\lui_shared.csc;

class class_5c5263e2 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_5c5263e2
		Checksum: 0x742D7204
		Offset: 0x440
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_5c5263e2
		Checksum: 0xDAB67A13
		Offset: 0x720
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_5c5263e2
		Checksum: 0x1960C79
		Offset: 0x610
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function open(localclientnum)
	{
		namespace_6aaccc24::open(localclientnum);
	}

	/*
		Name: function_46609401
		Namespace: namespace_5c5263e2
		Checksum: 0x9687247D
		Offset: 0x640
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_46609401(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "player_target_active", value);
	}

	/*
		Name: function_5c1bb138
		Namespace: namespace_5c5263e2
		Checksum: 0x6FDE43E
		Offset: 0x548
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("remote_missile_targets");
	}

	/*
		Name: function_808f0a7c
		Namespace: namespace_5c5263e2
		Checksum: 0x7516D72A
		Offset: 0x6B0
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_808f0a7c(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "extra_target_2", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_5c5263e2
		Checksum: 0x4EC9301D
		Offset: 0x460
		Size: 0xDC
		Parameters: 4
		Flags: Linked
	*/
	function setup_clientfields(var_9318c80d, var_82a5247c, var_afbc846a, var_4c87c083)
	{
		namespace_6aaccc24::setup_clientfields("remote_missile_targets");
		namespace_6aaccc24::function_da693cbe("player_target_active", 1, 16, "int", var_9318c80d);
		namespace_6aaccc24::function_da693cbe("extra_target_1", 1, 10, "int", var_82a5247c);
		namespace_6aaccc24::function_da693cbe("extra_target_2", 1, 10, "int", var_afbc846a);
		namespace_6aaccc24::function_da693cbe("extra_target_3", 1, 10, "int", var_4c87c083);
	}

	/*
		Name: function_d798388d
		Namespace: namespace_5c5263e2
		Checksum: 0xE2A4EFE6
		Offset: 0x678
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_d798388d(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "extra_target_1", value);
	}

	/*
		Name: function_ec1de198
		Namespace: namespace_5c5263e2
		Checksum: 0xCCE590D0
		Offset: 0x6E8
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_ec1de198(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "extra_target_3", value);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_5c5263e2
		Checksum: 0xC995359D
		Offset: 0x570
		Size: 0x94
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
		[[ self ]]->function_d7d2fcce(localclientnum, "player_target_active", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "extra_target_1", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "extra_target_2", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "extra_target_3", 0);
	}

}

#namespace remote_missile_targets;

/*
	Name: function_261d5245
	Namespace: remote_missile_targets
	Checksum: 0x783CD869
	Offset: 0x108
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_261d5245()
{
	level notify(2118167551);
}

/*
	Name: register
	Namespace: remote_missile_targets
	Checksum: 0x417452D7
	Offset: 0x128
	Size: 0x196
	Parameters: 4
	Flags: Linked
*/
function register(var_9318c80d, var_82a5247c, var_afbc846a, var_4c87c083)
{
	elem = new class_5c5263e2();
	[[ elem ]]->setup_clientfields(var_9318c80d, var_82a5247c, var_afbc846a, var_4c87c083);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"remote_missile_targets"]))
	{
		level.var_ae746e8f[#"remote_missile_targets"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"remote_missile_targets"]))
	{
		level.var_ae746e8f[#"remote_missile_targets"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"remote_missile_targets"]))
	{
		level.var_ae746e8f[#"remote_missile_targets"] = array(level.var_ae746e8f[#"remote_missile_targets"]);
	}
	level.var_ae746e8f[#"remote_missile_targets"][level.var_ae746e8f[#"remote_missile_targets"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: remote_missile_targets
	Checksum: 0x3E1E1DF9
	Offset: 0x2C8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_5c5263e2();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: remote_missile_targets
	Checksum: 0x2E334AF
	Offset: 0x308
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
	Namespace: remote_missile_targets
	Checksum: 0x571D34BF
	Offset: 0x330
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
	Namespace: remote_missile_targets
	Checksum: 0xD4D680BC
	Offset: 0x358
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: function_46609401
	Namespace: remote_missile_targets
	Checksum: 0xE1EF70A3
	Offset: 0x380
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_46609401(localclientnum, value)
{
	[[ self ]]->function_46609401(localclientnum, value);
}

/*
	Name: function_d798388d
	Namespace: remote_missile_targets
	Checksum: 0x6E2067C6
	Offset: 0x3B0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_d798388d(localclientnum, value)
{
	[[ self ]]->function_d798388d(localclientnum, value);
}

/*
	Name: function_808f0a7c
	Namespace: remote_missile_targets
	Checksum: 0xDFFD0201
	Offset: 0x3E0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_808f0a7c(localclientnum, value)
{
	[[ self ]]->function_808f0a7c(localclientnum, value);
}

/*
	Name: function_ec1de198
	Namespace: remote_missile_targets
	Checksum: 0x8C2A2191
	Offset: 0x410
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_ec1de198(localclientnum, value)
{
	[[ self ]]->function_ec1de198(localclientnum, value);
}

