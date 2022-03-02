#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_b6739d61 : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_b6739d61
		Checksum: 0xBAB192EE
		Offset: 0x3F8
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
		Checksum: 0x6D118871
		Offset: 0x8F0
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
		Checksum: 0xC046B94E
		Offset: 0x5A8
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
		Checksum: 0xC2D23C39
		Offset: 0x850
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
		Checksum: 0x2C39C34F
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
		Name: close
		Namespace: namespace_b6739d61
		Checksum: 0xCE6DBD82
		Offset: 0x5F0
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
		Checksum: 0xDFC46045
		Offset: 0x418
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
		Checksum: 0x2F984854
		Offset: 0x760
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
		Checksum: 0x977B85E9
		Offset: 0x670
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
		Checksum: 0x316901CC
		Offset: 0x620
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
		Checksum: 0x1E5327C8
		Offset: 0x800
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
		Checksum: 0x23B0F8C2
		Offset: 0x8A0
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
		Checksum: 0x9AE5E094
		Offset: 0x7B0
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
		Checksum: 0x4A69492A
		Offset: 0x710
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
	Name: function_d812c2fd
	Namespace: namespace_6abbc37c
	Checksum: 0x12D0CFD3
	Offset: 0x158
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_d812c2fd()
{
	level notify(775371542);
}

/*
	Name: register
	Namespace: namespace_6abbc37c
	Checksum: 0x5A6CAE71
	Offset: 0x178
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
	Checksum: 0xF79EBB64
	Offset: 0x1B8
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
	Checksum: 0x8223FA61
	Offset: 0x1F8
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
	Checksum: 0xC4970C2C
	Offset: 0x220
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
	Checksum: 0xEF78D088
	Offset: 0x248
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
	Checksum: 0xA5EAC571
	Offset: 0x278
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
	Checksum: 0x377F4D4
	Offset: 0x2A8
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
	Checksum: 0xEC9E6F73
	Offset: 0x2D8
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
	Checksum: 0xCE595CE0
	Offset: 0x308
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
	Checksum: 0xF4D3CD8
	Offset: 0x338
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
	Checksum: 0xC00B4800
	Offset: 0x368
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
	Checksum: 0xA7D1E647
	Offset: 0x398
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
	Checksum: 0x95E27CE0
	Offset: 0x3C8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_d6b5fdc4(player, value)
{
	[[ self ]]->function_d6b5fdc4(player, value);
}

