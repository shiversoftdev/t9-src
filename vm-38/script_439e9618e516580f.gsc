#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_94abfc09 : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_94abfc09
		Checksum: 0x73DB3AF2
		Offset: 0x2B8
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
		Checksum: 0xB57AEE1B
		Offset: 0x558
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
		Checksum: 0xDDB0B92B
		Offset: 0x3A0
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
		Checksum: 0x13346B8E
		Offset: 0x468
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
		Checksum: 0x31AEC37
		Offset: 0x3E8
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
		Checksum: 0x8E12965
		Offset: 0x4B8
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
		Checksum: 0xC9D54D55
		Offset: 0x418
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
		Checksum: 0xCCF59D18
		Offset: 0x2D8
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
		Checksum: 0x28FE9C55
		Offset: 0x508
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
	Name: function_58d66f79
	Namespace: cp_skip_scene_menu
	Checksum: 0x157E6499
	Offset: 0x108
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_58d66f79()
{
	level notify(1924459257);
}

/*
	Name: register
	Namespace: cp_skip_scene_menu
	Checksum: 0x51DB7C91
	Offset: 0x128
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
	Checksum: 0x22B7D0A0
	Offset: 0x168
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
	Checksum: 0xBEEC1AC2
	Offset: 0x1A8
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
	Checksum: 0xD0CA6291
	Offset: 0x1D0
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
	Checksum: 0xFB954B4
	Offset: 0x1F8
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
	Checksum: 0x1AADA54
	Offset: 0x228
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
	Checksum: 0xDB5AA0A
	Offset: 0x258
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
	Checksum: 0x7CD7496D
	Offset: 0x288
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_dad9a8ef(player, value)
{
	[[ self ]]->function_dad9a8ef(player, value);
}

