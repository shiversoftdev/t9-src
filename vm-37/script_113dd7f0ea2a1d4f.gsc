#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_8a452bea : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_8a452bea
		Checksum: 0x4F5EDDEA
		Offset: 0x4C8
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_8a452bea
		Checksum: 0xAB743808
		Offset: 0xAB0
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_8a452bea
		Checksum: 0x388131E2
		Offset: 0x6C8
		Size: 0x3C
		Parameters: 2
		Flags: Linked
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
		Name: function_1b05e380
		Namespace: namespace_8a452bea
		Checksum: 0x16E872DD
		Offset: 0xA60
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_1b05e380(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "active_obj_progress_visibility", value);
	}

	/*
		Name: function_1bd6077e
		Namespace: namespace_8a452bea
		Checksum: 0x64E4581B
		Offset: 0xA10
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_1bd6077e(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "active_objective_progress", value);
	}

	/*
		Name: function_1f1846cf
		Namespace: namespace_8a452bea
		Checksum: 0x73611316
		Offset: 0x830
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_1f1846cf(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "fail_fanfare_visibility", value);
	}

	/*
		Name: function_4dfb5783
		Namespace: namespace_8a452bea
		Checksum: 0x16B37E05
		Offset: 0x970
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_4dfb5783(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "objective_retrieval", value);
	}

	/*
		Name: function_4e0e26c8
		Namespace: namespace_8a452bea
		Checksum: 0x2B5E36B0
		Offset: 0x790
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_4e0e26c8(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "objective_prompt_visibility", value);
	}

	/*
		Name: close
		Namespace: namespace_8a452bea
		Checksum: 0x665BBD9B
		Offset: 0x710
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function close(player)
	{
		namespace_6aaccc24::function_a68f6e20(player);
	}

	/*
		Name: function_7491d6c5
		Namespace: namespace_8a452bea
		Checksum: 0xF4A5A881
		Offset: 0x8D0
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_7491d6c5(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "main_objective_string", value);
	}

	/*
		Name: function_817e4d10
		Namespace: namespace_8a452bea
		Checksum: 0xE14E1E6C
		Offset: 0x920
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_817e4d10(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "active_obj_visibility", value);
	}

	/*
		Name: function_8c3b3ce6
		Namespace: namespace_8a452bea
		Checksum: 0x2EC3E3D2
		Offset: 0x880
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_8c3b3ce6(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "new_obj_fanfare_visibility", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_8a452bea
		Checksum: 0x3671BF2C
		Offset: 0x4E8
		Size: 0x1D4
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("prototype_hud");
		namespace_6aaccc24::function_dcb34c80("string", "active_objective_string", 1);
		namespace_6aaccc24::function_da693cbe("objective_prompt_visibility", 1, 1, "int");
		namespace_6aaccc24::function_da693cbe("fanfare_visibility", 1, 1, "int");
		namespace_6aaccc24::function_da693cbe("fail_fanfare_visibility", 1, 1, "int");
		namespace_6aaccc24::function_da693cbe("new_obj_fanfare_visibility", 1, 1, "int");
		namespace_6aaccc24::function_dcb34c80("string", "main_objective_string", 1);
		namespace_6aaccc24::function_da693cbe("active_obj_visibility", 1, 1, "int");
		namespace_6aaccc24::function_da693cbe("objective_retrieval", 1, 1, "int");
		namespace_6aaccc24::function_da693cbe("show_secure", 1, 1, "int");
		namespace_6aaccc24::function_da693cbe("active_objective_progress", 1, 6, "float");
		namespace_6aaccc24::function_da693cbe("active_obj_progress_visibility", 1, 1, "int");
	}

	/*
		Name: function_953da284
		Namespace: namespace_8a452bea
		Checksum: 0x4AB174C8
		Offset: 0x740
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_953da284(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "active_objective_string", value);
	}

	/*
		Name: function_cbcd8e48
		Namespace: namespace_8a452bea
		Checksum: 0x4ECF5B9A
		Offset: 0x7E0
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_cbcd8e48(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "fanfare_visibility", value);
	}

	/*
		Name: function_da4fba84
		Namespace: namespace_8a452bea
		Checksum: 0x75CAD2BE
		Offset: 0x9C0
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_da4fba84(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "show_secure", value);
	}

}

#namespace prototype_hud;

/*
	Name: register
	Namespace: prototype_hud
	Checksum: 0xAA2A64F4
	Offset: 0x1E8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_8a452bea();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: prototype_hud
	Checksum: 0x66AF6895
	Offset: 0x228
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
	Namespace: prototype_hud
	Checksum: 0xCF4D1283
	Offset: 0x268
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
	Namespace: prototype_hud
	Checksum: 0xD7BC2ED4
	Offset: 0x290
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: function_953da284
	Namespace: prototype_hud
	Checksum: 0x2DD05CA5
	Offset: 0x2B8
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_953da284(player, value)
{
	[[ self ]]->function_953da284(player, value);
}

/*
	Name: function_4e0e26c8
	Namespace: prototype_hud
	Checksum: 0x24E283ED
	Offset: 0x2E8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_4e0e26c8(player, value)
{
	[[ self ]]->function_4e0e26c8(player, value);
}

/*
	Name: function_cbcd8e48
	Namespace: prototype_hud
	Checksum: 0xEFB3CE9C
	Offset: 0x318
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_cbcd8e48(player, value)
{
	[[ self ]]->function_cbcd8e48(player, value);
}

/*
	Name: function_1f1846cf
	Namespace: prototype_hud
	Checksum: 0x86443B99
	Offset: 0x348
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_1f1846cf(player, value)
{
	[[ self ]]->function_1f1846cf(player, value);
}

/*
	Name: function_8c3b3ce6
	Namespace: prototype_hud
	Checksum: 0xAB5EDED9
	Offset: 0x378
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_8c3b3ce6(player, value)
{
	[[ self ]]->function_8c3b3ce6(player, value);
}

/*
	Name: function_7491d6c5
	Namespace: prototype_hud
	Checksum: 0xCDDAF9C4
	Offset: 0x3A8
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_7491d6c5(player, value)
{
	[[ self ]]->function_7491d6c5(player, value);
}

/*
	Name: function_817e4d10
	Namespace: prototype_hud
	Checksum: 0x74CFC66B
	Offset: 0x3D8
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_817e4d10(player, value)
{
	[[ self ]]->function_817e4d10(player, value);
}

/*
	Name: function_4dfb5783
	Namespace: prototype_hud
	Checksum: 0xBD11BDE8
	Offset: 0x408
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_4dfb5783(player, value)
{
	[[ self ]]->function_4dfb5783(player, value);
}

/*
	Name: function_da4fba84
	Namespace: prototype_hud
	Checksum: 0x940D428C
	Offset: 0x438
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_da4fba84(player, value)
{
	[[ self ]]->function_da4fba84(player, value);
}

/*
	Name: function_1bd6077e
	Namespace: prototype_hud
	Checksum: 0x6E50815F
	Offset: 0x468
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_1bd6077e(player, value)
{
	[[ self ]]->function_1bd6077e(player, value);
}

/*
	Name: function_1b05e380
	Namespace: prototype_hud
	Checksum: 0x2B5BF8E2
	Offset: 0x498
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_1b05e380(player, value)
{
	[[ self ]]->function_1b05e380(player, value);
}

