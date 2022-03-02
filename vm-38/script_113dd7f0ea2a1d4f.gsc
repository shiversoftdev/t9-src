#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_8a452bea : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_8a452bea
		Checksum: 0x1E5C12F2
		Offset: 0x4B0
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
		Checksum: 0xED76781F
		Offset: 0xA20
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
		Checksum: 0xA8E99D43
		Offset: 0x688
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
		Checksum: 0xAF18EB31
		Offset: 0x9D0
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
		Checksum: 0x668EDAB0
		Offset: 0x980
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
		Checksum: 0x8F785616
		Offset: 0x7F0
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
		Checksum: 0x11138721
		Offset: 0x930
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
		Checksum: 0x4B460ADD
		Offset: 0x750
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
		Checksum: 0x3D101C71
		Offset: 0x6D0
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
		Checksum: 0xB08691DE
		Offset: 0x890
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
		Checksum: 0xD7EEB6A1
		Offset: 0x8E0
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
		Checksum: 0xA7BE8D47
		Offset: 0x840
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
		Checksum: 0x93B6CC98
		Offset: 0x4D0
		Size: 0x1AC
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
		namespace_6aaccc24::function_da693cbe("active_objective_progress", 1, 6, "float");
		namespace_6aaccc24::function_da693cbe("active_obj_progress_visibility", 1, 1, "int");
	}

	/*
		Name: function_953da284
		Namespace: namespace_8a452bea
		Checksum: 0xF7F2959D
		Offset: 0x700
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
		Checksum: 0xE5F16AEA
		Offset: 0x7A0
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_cbcd8e48(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "fanfare_visibility", value);
	}

}

#namespace prototype_hud;

/*
	Name: function_8d67bedc
	Namespace: prototype_hud
	Checksum: 0xD4D8058F
	Offset: 0x1E0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_8d67bedc()
{
	level notify(906440856);
}

/*
	Name: register
	Namespace: prototype_hud
	Checksum: 0xEF594B93
	Offset: 0x200
	Size: 0x34
	Parameters: 0
	Flags: Linked
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
	Checksum: 0x22B7D0A0
	Offset: 0x240
	Size: 0x38
	Parameters: 2
	Flags: Linked
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
	Checksum: 0xBEEC1AC2
	Offset: 0x280
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
	Checksum: 0xD0CA6291
	Offset: 0x2A8
	Size: 0x1A
	Parameters: 1
	Flags: Linked
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: function_953da284
	Namespace: prototype_hud
	Checksum: 0x51F1DB48
	Offset: 0x2D0
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
	Checksum: 0xC663C430
	Offset: 0x300
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
	Checksum: 0xA65D8D22
	Offset: 0x330
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
	Checksum: 0x2D7F5CCB
	Offset: 0x360
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
	Checksum: 0x2315E782
	Offset: 0x390
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
	Checksum: 0xAA648ADD
	Offset: 0x3C0
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
	Checksum: 0xE61D3679
	Offset: 0x3F0
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
	Checksum: 0xE7B159A0
	Offset: 0x420
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_4dfb5783(player, value)
{
	[[ self ]]->function_4dfb5783(player, value);
}

/*
	Name: function_1bd6077e
	Namespace: prototype_hud
	Checksum: 0x25190088
	Offset: 0x450
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
	Checksum: 0x72D163A1
	Offset: 0x480
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_1b05e380(player, value)
{
	[[ self ]]->function_1b05e380(player, value);
}

