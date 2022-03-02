#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_4c6a0e72 : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_4c6a0e72
		Checksum: 0xE96616AC
		Offset: 0x308
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_4c6a0e72
		Checksum: 0xC6D26DC6
		Offset: 0x698
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: function_6b7b6e4
		Namespace: namespace_4c6a0e72
		Checksum: 0xDD08D88D
		Offset: 0x558
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_6b7b6e4(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "line3", value);
	}

	/*
		Name: open
		Namespace: namespace_4c6a0e72
		Checksum: 0x18EE378
		Offset: 0x440
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
		Name: function_147e5271
		Namespace: namespace_4c6a0e72
		Checksum: 0x48AAAE22
		Offset: 0x508
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_147e5271(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "line2", value);
	}

	/*
		Name: function_2a377de3
		Namespace: namespace_4c6a0e72
		Checksum: 0x75036974
		Offset: 0x5F8
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_2a377de3(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "line5", value);
	}

	/*
		Name: function_4b584028
		Namespace: namespace_4c6a0e72
		Checksum: 0xD3CD3B16
		Offset: 0x4B8
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_4b584028(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "line1", value);
	}

	/*
		Name: close
		Namespace: namespace_4c6a0e72
		Checksum: 0x569AB6A6
		Offset: 0x488
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function close(player)
	{
		namespace_6aaccc24::function_a68f6e20(player);
	}

	/*
		Name: set_index
		Namespace: namespace_4c6a0e72
		Checksum: 0x5065F1C0
		Offset: 0x648
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_index(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "index", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_4c6a0e72
		Checksum: 0xB5E615E1
		Offset: 0x328
		Size: 0x10C
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("cp_chyron");
		namespace_6aaccc24::function_dcb34c80("string", "line1", 1);
		namespace_6aaccc24::function_dcb34c80("string", "line2", 1);
		namespace_6aaccc24::function_dcb34c80("string", "line3", 1);
		namespace_6aaccc24::function_dcb34c80("string", "line4", 1);
		namespace_6aaccc24::function_dcb34c80("string", "line5", 1);
		namespace_6aaccc24::function_da693cbe("index", 1, 4, "int");
	}

	/*
		Name: function_b7f01956
		Namespace: namespace_4c6a0e72
		Checksum: 0x66CAEBFE
		Offset: 0x5A8
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_b7f01956(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "line4", value);
	}

}

#namespace cp_chyron;

/*
	Name: function_6a365764
	Namespace: cp_chyron
	Checksum: 0x167F68BE
	Offset: 0xF8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_6a365764()
{
	level notify(124712190);
}

/*
	Name: register
	Namespace: cp_chyron
	Checksum: 0x32EFB638
	Offset: 0x118
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function register()
{
	elem = new class_4c6a0e72();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: cp_chyron
	Checksum: 0x22B7D0A0
	Offset: 0x158
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
	Namespace: cp_chyron
	Checksum: 0xBEEC1AC2
	Offset: 0x198
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function close(player)
{
	[[ self ]]->close(player);
}

/*
	Name: is_open
	Namespace: cp_chyron
	Checksum: 0xD0CA6291
	Offset: 0x1C0
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: function_4b584028
	Namespace: cp_chyron
	Checksum: 0x56D0C164
	Offset: 0x1E8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_4b584028(player, value)
{
	[[ self ]]->function_4b584028(player, value);
}

/*
	Name: function_147e5271
	Namespace: cp_chyron
	Checksum: 0x6E7C272F
	Offset: 0x218
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_147e5271(player, value)
{
	[[ self ]]->function_147e5271(player, value);
}

/*
	Name: function_6b7b6e4
	Namespace: cp_chyron
	Checksum: 0x7B0F9619
	Offset: 0x248
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_6b7b6e4(player, value)
{
	[[ self ]]->function_6b7b6e4(player, value);
}

/*
	Name: function_b7f01956
	Namespace: cp_chyron
	Checksum: 0x726D27F7
	Offset: 0x278
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_b7f01956(player, value)
{
	[[ self ]]->function_b7f01956(player, value);
}

/*
	Name: function_2a377de3
	Namespace: cp_chyron
	Checksum: 0x12C3D66
	Offset: 0x2A8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_2a377de3(player, value)
{
	[[ self ]]->function_2a377de3(player, value);
}

/*
	Name: set_index
	Namespace: cp_chyron
	Checksum: 0x2401A9EC
	Offset: 0x2D8
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_index(player, value)
{
	[[ self ]]->set_index(player, value);
}

