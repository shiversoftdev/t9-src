#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_94abfc09 : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_94abfc09
		Checksum: 0xCEDEB3B5
		Offset: 0x298
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_94abfc09
		Checksum: 0xADA37EC3
		Offset: 0x538
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_94abfc09
		Checksum: 0x4F6014D8
		Offset: 0x380
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
		Name: function_300eba00
		Namespace: namespace_94abfc09
		Checksum: 0xCD94B2D0
		Offset: 0x448
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_300eba00(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "hostIsSkipping", value);
	}

	/*
		Name: close
		Namespace: namespace_94abfc09
		Checksum: 0xFEB9083
		Offset: 0x3C8
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function close(player)
	{
		namespace_6aaccc24::function_a68f6e20(player);
	}

	/*
		Name: function_5d0d17fd
		Namespace: namespace_94abfc09
		Checksum: 0x61798F24
		Offset: 0x498
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_5d0d17fd(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "votedToSkip", value);
	}

	/*
		Name: function_6c680730
		Namespace: namespace_94abfc09
		Checksum: 0xF5CAC5EF
		Offset: 0x3F8
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_6c680730(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "showSkipButton", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_94abfc09
		Checksum: 0x7FD2D38
		Offset: 0x2B8
		Size: 0xBC
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("cp_skip_scene_menu");
		namespace_6aaccc24::function_da693cbe("showSkipButton", 1, 2, "int");
		namespace_6aaccc24::function_da693cbe("hostIsSkipping", 1, 1, "int");
		namespace_6aaccc24::function_da693cbe("votedToSkip", 1, 1, "int");
		namespace_6aaccc24::function_da693cbe("sceneSkipEndTime", 1, 3, "int");
	}

	/*
		Name: function_dad9a8ef
		Namespace: namespace_94abfc09
		Checksum: 0x8A2F2921
		Offset: 0x4E8
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_dad9a8ef(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "sceneSkipEndTime", value);
	}

}

#namespace cp_skip_scene_menu;

/*
	Name: register
	Namespace: cp_skip_scene_menu
	Checksum: 0x501CC121
	Offset: 0x108
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function register()
{
	elem = new class_94abfc09();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: cp_skip_scene_menu
	Checksum: 0xB2724536
	Offset: 0x148
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
	Namespace: cp_skip_scene_menu
	Checksum: 0xA6D7C1EF
	Offset: 0x188
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
	Namespace: cp_skip_scene_menu
	Checksum: 0x3D187C10
	Offset: 0x1B0
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: function_6c680730
	Namespace: cp_skip_scene_menu
	Checksum: 0x66596B85
	Offset: 0x1D8
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_6c680730(player, value)
{
	[[ self ]]->function_6c680730(player, value);
}

/*
	Name: function_300eba00
	Namespace: cp_skip_scene_menu
	Checksum: 0x74756D46
	Offset: 0x208
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_300eba00(player, value)
{
	[[ self ]]->function_300eba00(player, value);
}

/*
	Name: function_5d0d17fd
	Namespace: cp_skip_scene_menu
	Checksum: 0x4DBFFF4C
	Offset: 0x238
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_5d0d17fd(player, value)
{
	[[ self ]]->function_5d0d17fd(player, value);
}

/*
	Name: function_dad9a8ef
	Namespace: cp_skip_scene_menu
	Checksum: 0xEC52EFAB
	Offset: 0x268
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_dad9a8ef(player, value)
{
	[[ self ]]->function_dad9a8ef(player, value);
}

