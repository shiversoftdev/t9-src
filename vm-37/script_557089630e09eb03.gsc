#using scripts\core_common\lui_shared.csc;

class class_b6739d61 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_b6739d61
		Checksum: 0xA5C76D1B
		Offset: 0x588
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_b6739d61
		Checksum: 0xA570F0CF
		Offset: 0xB20
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_b6739d61
		Checksum: 0xBDEE19E0
		Offset: 0x8F8
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		namespace_6aaccc24::open(localclientnum);
	}

	/*
		Name: function_1c28d7c2
		Namespace: namespace_b6739d61
		Checksum: 0xC379AD8
		Offset: 0xAB0
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_1c28d7c2(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "showBossAlert", value);
	}

	/*
		Name: function_2a0b1f84
		Namespace: namespace_b6739d61
		Checksum: 0x8C30426A
		Offset: 0x998
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_2a0b1f84(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "score3Points", value);
	}

	/*
		Name: function_5c1bb138
		Namespace: namespace_b6739d61
		Checksum: 0x3A195FF9
		Offset: 0x780
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("onslaught_hud");
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_b6739d61
		Checksum: 0x4BB4BA59
		Offset: 0x5A8
		Size: 0x1CC
		Parameters: 9
		Flags: None
	*/
	function setup_clientfields(var_ef8933e3, var_61963aa5, var_964ac54, var_a584bc49, var_52a170c, var_4e7bf429, var_9a88505e, var_e805c474, var_f1a2774e)
	{
		namespace_6aaccc24::setup_clientfields("onslaught_hud");
		namespace_6aaccc24::function_dcb34c80("string", "bossAlertText", 1);
		namespace_6aaccc24::function_dcb34c80("string", "objective2Text", 1);
		namespace_6aaccc24::function_da693cbe("score3Points", 1, 8, "int", var_a584bc49);
		namespace_6aaccc24::function_dcb34c80("string", "objectiveText", 1);
		namespace_6aaccc24::function_da693cbe("showEndScore", 1, 1, "int", var_52a170c);
		namespace_6aaccc24::function_da693cbe("showScore", 1, 1, "int", var_4e7bf429);
		namespace_6aaccc24::function_da693cbe("showObjective", 1, 1, "int", var_9a88505e);
		namespace_6aaccc24::function_da693cbe("showBossAlert", 1, 1, "int", var_e805c474);
		namespace_6aaccc24::function_da693cbe("showObjective2", 1, 1, "int", var_f1a2774e);
	}

	/*
		Name: function_9b5f8a75
		Namespace: namespace_b6739d61
		Checksum: 0x2D2FADE8
		Offset: 0xA08
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_9b5f8a75(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "showEndScore", value);
	}

	/*
		Name: function_9c1c0811
		Namespace: namespace_b6739d61
		Checksum: 0x73BB16D
		Offset: 0x960
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_9c1c0811(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "objective2Text", value);
	}

	/*
		Name: function_b73d2d7c
		Namespace: namespace_b6739d61
		Checksum: 0x26B29B2E
		Offset: 0x928
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_b73d2d7c(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "bossAlertText", value);
	}

	/*
		Name: function_d0a02472
		Namespace: namespace_b6739d61
		Checksum: 0xD06082DC
		Offset: 0xA78
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_d0a02472(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "showObjective", value);
	}

	/*
		Name: function_d6b5fdc4
		Namespace: namespace_b6739d61
		Checksum: 0xB603656F
		Offset: 0xAE8
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_d6b5fdc4(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "showObjective2", value);
	}

	/*
		Name: function_da96c24e
		Namespace: namespace_b6739d61
		Checksum: 0x9E6A70C7
		Offset: 0xA40
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_da96c24e(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "showScore", value);
	}

	/*
		Name: function_eab3d36f
		Namespace: namespace_b6739d61
		Checksum: 0x5015CA7D
		Offset: 0x9D0
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_eab3d36f(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "objectiveText", value);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_b6739d61
		Checksum: 0xB51788B9
		Offset: 0x7A8
		Size: 0x148
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
		[[ self ]]->function_d7d2fcce(localclientnum, "bossAlertText", #"");
		[[ self ]]->function_d7d2fcce(localclientnum, "objective2Text", #"");
		[[ self ]]->function_d7d2fcce(localclientnum, "score3Points", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "objectiveText", #"");
		[[ self ]]->function_d7d2fcce(localclientnum, "showEndScore", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "showScore", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "showObjective", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "showBossAlert", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "showObjective2", 0);
	}

}

#namespace namespace_6abbc37c;

/*
	Name: register
	Namespace: namespace_6abbc37c
	Checksum: 0xB6668B5D
	Offset: 0x150
	Size: 0x1C6
	Parameters: 9
	Flags: None
*/
function register(var_ef8933e3, var_61963aa5, var_964ac54, var_a584bc49, var_52a170c, var_4e7bf429, var_9a88505e, var_e805c474, var_f1a2774e)
{
	elem = new class_b6739d61();
	[[ elem ]]->setup_clientfields(var_ef8933e3, var_61963aa5, var_964ac54, var_a584bc49, var_52a170c, var_4e7bf429, var_9a88505e, var_e805c474, var_f1a2774e);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"hash_1a527bffc9fc6f74"]))
	{
		level.var_ae746e8f[#"hash_1a527bffc9fc6f74"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"hash_1a527bffc9fc6f74"]))
	{
		level.var_ae746e8f[#"hash_1a527bffc9fc6f74"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"hash_1a527bffc9fc6f74"]))
	{
		level.var_ae746e8f[#"hash_1a527bffc9fc6f74"] = array(level.var_ae746e8f[#"hash_1a527bffc9fc6f74"]);
	}
	level.var_ae746e8f[#"hash_1a527bffc9fc6f74"][level.var_ae746e8f[#"hash_1a527bffc9fc6f74"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: namespace_6abbc37c
	Checksum: 0x17412FF3
	Offset: 0x320
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_b6739d61();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: namespace_6abbc37c
	Checksum: 0x729F94C4
	Offset: 0x360
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
	Namespace: namespace_6abbc37c
	Checksum: 0xD0FEA9AB
	Offset: 0x388
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
	Namespace: namespace_6abbc37c
	Checksum: 0x2F103458
	Offset: 0x3B0
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: function_b73d2d7c
	Namespace: namespace_6abbc37c
	Checksum: 0x78266B9C
	Offset: 0x3D8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_b73d2d7c(localclientnum, value)
{
	[[ self ]]->function_b73d2d7c(localclientnum, value);
}

/*
	Name: function_9c1c0811
	Namespace: namespace_6abbc37c
	Checksum: 0xC48F0998
	Offset: 0x408
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_9c1c0811(localclientnum, value)
{
	[[ self ]]->function_9c1c0811(localclientnum, value);
}

/*
	Name: function_2a0b1f84
	Namespace: namespace_6abbc37c
	Checksum: 0xA8D8FC46
	Offset: 0x438
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_2a0b1f84(localclientnum, value)
{
	[[ self ]]->function_2a0b1f84(localclientnum, value);
}

/*
	Name: function_eab3d36f
	Namespace: namespace_6abbc37c
	Checksum: 0xD4864274
	Offset: 0x468
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_eab3d36f(localclientnum, value)
{
	[[ self ]]->function_eab3d36f(localclientnum, value);
}

/*
	Name: function_9b5f8a75
	Namespace: namespace_6abbc37c
	Checksum: 0x125C18FF
	Offset: 0x498
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_9b5f8a75(localclientnum, value)
{
	[[ self ]]->function_9b5f8a75(localclientnum, value);
}

/*
	Name: function_da96c24e
	Namespace: namespace_6abbc37c
	Checksum: 0x23BCD9BD
	Offset: 0x4C8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_da96c24e(localclientnum, value)
{
	[[ self ]]->function_da96c24e(localclientnum, value);
}

/*
	Name: function_d0a02472
	Namespace: namespace_6abbc37c
	Checksum: 0xD9E26CB8
	Offset: 0x4F8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_d0a02472(localclientnum, value)
{
	[[ self ]]->function_d0a02472(localclientnum, value);
}

/*
	Name: function_1c28d7c2
	Namespace: namespace_6abbc37c
	Checksum: 0x87478518
	Offset: 0x528
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_1c28d7c2(localclientnum, value)
{
	[[ self ]]->function_1c28d7c2(localclientnum, value);
}

/*
	Name: function_d6b5fdc4
	Namespace: namespace_6abbc37c
	Checksum: 0x63E2E4EA
	Offset: 0x558
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_d6b5fdc4(localclientnum, value)
{
	[[ self ]]->function_d6b5fdc4(localclientnum, value);
}

