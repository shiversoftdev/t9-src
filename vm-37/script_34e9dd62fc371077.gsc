#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_b6739d61 : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_b6739d61
		Checksum: 0x84312C65
		Offset: 0x3D8
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
		Checksum: 0xD9CCA883
		Offset: 0x8D0
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
		Checksum: 0xC9B701FF
		Offset: 0x588
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
		Name: function_1c28d7c2
		Namespace: namespace_b6739d61
		Checksum: 0xC3087949
		Offset: 0x830
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_1c28d7c2(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "showBossAlert", value);
	}

	/*
		Name: function_2a0b1f84
		Namespace: namespace_b6739d61
		Checksum: 0xBA359301
		Offset: 0x6A0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_2a0b1f84(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "score3Points", value);
	}

	/*
		Name: close
		Namespace: namespace_b6739d61
		Checksum: 0xC26D231C
		Offset: 0x5D0
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
		Namespace: namespace_b6739d61
		Checksum: 0xEA02F946
		Offset: 0x3F8
		Size: 0x184
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("onslaught_hud");
		namespace_6aaccc24::function_dcb34c80("string", "bossAlertText", 1);
		namespace_6aaccc24::function_dcb34c80("string", "objective2Text", 1);
		namespace_6aaccc24::function_da693cbe("score3Points", 1, 8, "int");
		namespace_6aaccc24::function_dcb34c80("string", "objectiveText", 1);
		namespace_6aaccc24::function_da693cbe("showEndScore", 1, 1, "int");
		namespace_6aaccc24::function_da693cbe("showScore", 1, 1, "int");
		namespace_6aaccc24::function_da693cbe("showObjective", 1, 1, "int");
		namespace_6aaccc24::function_da693cbe("showBossAlert", 1, 1, "int");
		namespace_6aaccc24::function_da693cbe("showObjective2", 1, 1, "int");
	}

	/*
		Name: function_9b5f8a75
		Namespace: namespace_b6739d61
		Checksum: 0xE775000
		Offset: 0x740
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_9b5f8a75(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "showEndScore", value);
	}

	/*
		Name: function_9c1c0811
		Namespace: namespace_b6739d61
		Checksum: 0xE02A1954
		Offset: 0x650
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_9c1c0811(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "objective2Text", value);
	}

	/*
		Name: function_b73d2d7c
		Namespace: namespace_b6739d61
		Checksum: 0x4C92E49D
		Offset: 0x600
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_b73d2d7c(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "bossAlertText", value);
	}

	/*
		Name: function_d0a02472
		Namespace: namespace_b6739d61
		Checksum: 0xF279D539
		Offset: 0x7E0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_d0a02472(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "showObjective", value);
	}

	/*
		Name: function_d6b5fdc4
		Namespace: namespace_b6739d61
		Checksum: 0x88A69D3
		Offset: 0x880
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_d6b5fdc4(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "showObjective2", value);
	}

	/*
		Name: function_da96c24e
		Namespace: namespace_b6739d61
		Checksum: 0xA0C62627
		Offset: 0x790
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_da96c24e(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "showScore", value);
	}

	/*
		Name: function_eab3d36f
		Namespace: namespace_b6739d61
		Checksum: 0x1DDF3EE2
		Offset: 0x6F0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_eab3d36f(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "objectiveText", value);
	}

}

#namespace namespace_6abbc37c;

/*
	Name: register
	Namespace: namespace_6abbc37c
	Checksum: 0xA9ECB270
	Offset: 0x158
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_b6739d61();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: namespace_6abbc37c
	Checksum: 0xA54E9789
	Offset: 0x198
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
	Namespace: namespace_6abbc37c
	Checksum: 0x86736221
	Offset: 0x1D8
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
	Checksum: 0x7D032A4E
	Offset: 0x200
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: function_b73d2d7c
	Namespace: namespace_6abbc37c
	Checksum: 0x3296401
	Offset: 0x228
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_b73d2d7c(player, value)
{
	[[ self ]]->function_b73d2d7c(player, value);
}

/*
	Name: function_9c1c0811
	Namespace: namespace_6abbc37c
	Checksum: 0x36060E25
	Offset: 0x258
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_9c1c0811(player, value)
{
	[[ self ]]->function_9c1c0811(player, value);
}

/*
	Name: function_2a0b1f84
	Namespace: namespace_6abbc37c
	Checksum: 0x6C37A2A2
	Offset: 0x288
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_2a0b1f84(player, value)
{
	[[ self ]]->function_2a0b1f84(player, value);
}

/*
	Name: function_eab3d36f
	Namespace: namespace_6abbc37c
	Checksum: 0xF2306C4
	Offset: 0x2B8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_eab3d36f(player, value)
{
	[[ self ]]->function_eab3d36f(player, value);
}

/*
	Name: function_9b5f8a75
	Namespace: namespace_6abbc37c
	Checksum: 0xF1BA6380
	Offset: 0x2E8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_9b5f8a75(player, value)
{
	[[ self ]]->function_9b5f8a75(player, value);
}

/*
	Name: function_da96c24e
	Namespace: namespace_6abbc37c
	Checksum: 0x9B42DF62
	Offset: 0x318
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_da96c24e(player, value)
{
	[[ self ]]->function_da96c24e(player, value);
}

/*
	Name: function_d0a02472
	Namespace: namespace_6abbc37c
	Checksum: 0x2961B2D2
	Offset: 0x348
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_d0a02472(player, value)
{
	[[ self ]]->function_d0a02472(player, value);
}

/*
	Name: function_1c28d7c2
	Namespace: namespace_6abbc37c
	Checksum: 0x5945AFDC
	Offset: 0x378
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_1c28d7c2(player, value)
{
	[[ self ]]->function_1c28d7c2(player, value);
}

/*
	Name: function_d6b5fdc4
	Namespace: namespace_6abbc37c
	Checksum: 0xB6110AF7
	Offset: 0x3A8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_d6b5fdc4(player, value)
{
	[[ self ]]->function_d6b5fdc4(player, value);
}

