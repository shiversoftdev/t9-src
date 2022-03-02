#using scripts\core_common\lui_shared.csc;

class class_5c5263e2 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_5c5263e2
		Checksum: 0xCFEB7292
		Offset: 0x420
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
		Checksum: 0xE390816E
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
		Namespace: namespace_5c5263e2
		Checksum: 0x2F5F7F5D
		Offset: 0x5F0
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
		Checksum: 0xA92E0B86
		Offset: 0x620
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
		Checksum: 0xCDCFF202
		Offset: 0x528
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
		Checksum: 0xBE3861D1
		Offset: 0x690
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
		Checksum: 0xB7A83FAB
		Offset: 0x440
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
		Checksum: 0xDE90946F
		Offset: 0x658
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
		Checksum: 0xF4988883
		Offset: 0x6C8
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
		Checksum: 0x963EA72B
		Offset: 0x550
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
	Name: register
	Namespace: remote_missile_targets
	Checksum: 0x258770FE
	Offset: 0x108
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
	Checksum: 0xF7FB098D
	Offset: 0x2A8
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
	Checksum: 0xAE58960E
	Offset: 0x2E8
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
	Checksum: 0xDFE520B6
	Offset: 0x310
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
	Checksum: 0x850E16A8
	Offset: 0x338
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
	Checksum: 0xDC0742BC
	Offset: 0x360
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
	Checksum: 0x33667506
	Offset: 0x390
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
	Checksum: 0x150BA87
	Offset: 0x3C0
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
	Checksum: 0xC4AE300D
	Offset: 0x3F0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_ec1de198(localclientnum, value)
{
	[[ self ]]->function_ec1de198(localclientnum, value);
}

