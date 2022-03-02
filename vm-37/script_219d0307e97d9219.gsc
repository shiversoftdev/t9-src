#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_e22be003 : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_e22be003
		Checksum: 0xA20EFDAD
		Offset: 0x380
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_e22be003
		Checksum: 0x523C28AA
		Offset: 0x7E8
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_e22be003
		Checksum: 0x39FD5D08
		Offset: 0x508
		Size: 0x3C
		Parameters: 2
		Flags: None
	*/
	function open(player, flags)
	{
		if(!isdefined(flags))
		{
			flags = 0;
		}
		namespace_6aaccc24::function_8b8089ba(player, flags);
	}

	/*
		Name: function_2a0b1f84
		Namespace: namespace_e22be003
		Checksum: 0xE3F0D0C4
		Offset: 0x6C0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_2a0b1f84(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "score3Points", value);
	}

	/*
		Name: function_4b3ad4c4
		Namespace: namespace_e22be003
		Checksum: 0x51B1FC06
		Offset: 0x5D0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_4b3ad4c4(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "scorePoints", value);
	}

	/*
		Name: function_4b560c24
		Namespace: namespace_e22be003
		Checksum: 0xBABBCD54
		Offset: 0x580
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_4b560c24(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "scoreText", value);
	}

	/*
		Name: function_4bfdafeb
		Namespace: namespace_e22be003
		Checksum: 0x70DB3841
		Offset: 0x7A0
		Size: 0x3C
		Parameters: 1
		Flags: None
	*/
	function function_4bfdafeb(player)
	{
		player clientfield::function_bb878fc3(var_d5213cbb, var_bf9c8c95, "moveorb");
	}

	/*
		Name: close
		Namespace: namespace_e22be003
		Checksum: 0xC166C6CC
		Offset: 0x550
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function close(player)
	{
		namespace_6aaccc24::function_a68f6e20(player);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_e22be003
		Checksum: 0x3AF840A6
		Offset: 0x3A0
		Size: 0x15C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("mp_gamemode_onslaught_score_msg");
		namespace_6aaccc24::function_dcb34c80("string", "scoreText", 1);
		namespace_6aaccc24::function_da693cbe("scorePoints", 1, 11, "int");
		namespace_6aaccc24::function_dcb34c80("string", "score2Text", 1);
		namespace_6aaccc24::function_da693cbe("score2Points", 1, 11, "int");
		namespace_6aaccc24::function_da693cbe("score3Points", 1, 8, "int");
		namespace_6aaccc24::function_da693cbe("powerup", 1, 1, "counter");
		namespace_6aaccc24::function_da693cbe("lowpower", 1, 1, "counter");
		namespace_6aaccc24::function_da693cbe("moveorb", 1, 1, "counter");
	}

	/*
		Name: function_94b2b0bd
		Namespace: namespace_e22be003
		Checksum: 0x221F34FD
		Offset: 0x710
		Size: 0x3C
		Parameters: 1
		Flags: None
	*/
	function function_94b2b0bd(player)
	{
		player clientfield::function_bb878fc3(var_d5213cbb, var_bf9c8c95, "powerup");
	}

	/*
		Name: function_955431ec
		Namespace: namespace_e22be003
		Checksum: 0x54EE461A
		Offset: 0x670
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_955431ec(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "score2Points", value);
	}

	/*
		Name: function_d74c17ab
		Namespace: namespace_e22be003
		Checksum: 0xE0E9F45
		Offset: 0x758
		Size: 0x3C
		Parameters: 1
		Flags: None
	*/
	function function_d74c17ab(player)
	{
		player clientfield::function_bb878fc3(var_d5213cbb, var_bf9c8c95, "lowpower");
	}

	/*
		Name: function_fc075317
		Namespace: namespace_e22be003
		Checksum: 0xDFBFF422
		Offset: 0x620
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_fc075317(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "score2Text", value);
	}

}

#namespace mp_gamemode_onslaught_score_msg;

/*
	Name: register
	Namespace: mp_gamemode_onslaught_score_msg
	Checksum: 0xCCDD47A3
	Offset: 0x148
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_e22be003();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: mp_gamemode_onslaught_score_msg
	Checksum: 0x66AF6895
	Offset: 0x188
	Size: 0x38
	Parameters: 2
	Flags: None
*/
function open(player, flags)
{
	if(!isdefined(flags))
	{
		flags = 0;
	}
	[[ self ]]->open(player, flags);
}

/*
	Name: close
	Namespace: mp_gamemode_onslaught_score_msg
	Checksum: 0xCF4D1283
	Offset: 0x1C8
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
	Namespace: mp_gamemode_onslaught_score_msg
	Checksum: 0xD7BC2ED4
	Offset: 0x1F0
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: function_4b560c24
	Namespace: mp_gamemode_onslaught_score_msg
	Checksum: 0xC4FF2DBB
	Offset: 0x218
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_4b560c24(player, value)
{
	[[ self ]]->function_4b560c24(player, value);
}

/*
	Name: function_4b3ad4c4
	Namespace: mp_gamemode_onslaught_score_msg
	Checksum: 0xD7A77799
	Offset: 0x248
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_4b3ad4c4(player, value)
{
	[[ self ]]->function_4b3ad4c4(player, value);
}

/*
	Name: function_fc075317
	Namespace: mp_gamemode_onslaught_score_msg
	Checksum: 0xAD31437
	Offset: 0x278
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_fc075317(player, value)
{
	[[ self ]]->function_fc075317(player, value);
}

/*
	Name: function_955431ec
	Namespace: mp_gamemode_onslaught_score_msg
	Checksum: 0x5BBED2AD
	Offset: 0x2A8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_955431ec(player, value)
{
	[[ self ]]->function_955431ec(player, value);
}

/*
	Name: function_2a0b1f84
	Namespace: mp_gamemode_onslaught_score_msg
	Checksum: 0x3CD83785
	Offset: 0x2D8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_2a0b1f84(player, value)
{
	[[ self ]]->function_2a0b1f84(player, value);
}

/*
	Name: function_94b2b0bd
	Namespace: mp_gamemode_onslaught_score_msg
	Checksum: 0x11CE16F4
	Offset: 0x308
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function function_94b2b0bd(player)
{
	[[ self ]]->function_94b2b0bd(player);
}

/*
	Name: function_d74c17ab
	Namespace: mp_gamemode_onslaught_score_msg
	Checksum: 0x4F734131
	Offset: 0x330
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function function_d74c17ab(player)
{
	[[ self ]]->function_d74c17ab(player);
}

/*
	Name: function_4bfdafeb
	Namespace: mp_gamemode_onslaught_score_msg
	Checksum: 0x8894CDC
	Offset: 0x358
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function function_4bfdafeb(player)
{
	[[ self ]]->function_4bfdafeb(player);
}

