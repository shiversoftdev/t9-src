#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class ccp_skip_scene_menu : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: ccp_skip_scene_menu
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
		Namespace: ccp_skip_scene_menu
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
		Namespace: ccp_skip_scene_menu
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
		cluielem::open_luielem(player, flags);
	}

	/*
		Name: set_hostisskipping
		Namespace: ccp_skip_scene_menu
		Checksum: 0x13346B8E
		Offset: 0x468
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_hostisskipping(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "hostIsSkipping", value);
	}

	/*
		Name: close
		Namespace: ccp_skip_scene_menu
		Checksum: 0x31AEC37
		Offset: 0x3E8
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function close(player)
	{
		cluielem::close_luielem(player);
	}

	/*
		Name: set_votedtoskip
		Namespace: ccp_skip_scene_menu
		Checksum: 0x8E12965
		Offset: 0x4B8
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_votedtoskip(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "votedToSkip", value);
	}

	/*
		Name: set_showskipbutton
		Namespace: ccp_skip_scene_menu
		Checksum: 0xC9D54D55
		Offset: 0x418
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_showskipbutton(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "showSkipButton", value);
	}

	/*
		Name: setup_clientfields
		Namespace: ccp_skip_scene_menu
		Checksum: 0xCCF59D18
		Offset: 0x2D8
		Size: 0xBC
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("cp_skip_scene_menu");
		cluielem::add_clientfield("showSkipButton", 1, 2, "int");
		cluielem::add_clientfield("hostIsSkipping", 1, 1, "int");
		cluielem::add_clientfield("votedToSkip", 1, 1, "int");
		cluielem::add_clientfield("sceneSkipEndTime", 1, 3, "int");
	}

	/*
		Name: set_sceneskipendtime
		Namespace: ccp_skip_scene_menu
		Checksum: 0x28FE9C55
		Offset: 0x508
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_sceneskipendtime(player, value)
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
	level notify(-1924459257);
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
	elem = new ccp_skip_scene_menu();
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
	Name: set_showskipbutton
	Namespace: cp_skip_scene_menu
	Checksum: 0xFB954B4
	Offset: 0x1F8
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_showskipbutton(player, value)
{
	[[ self ]]->set_showskipbutton(player, value);
}

/*
	Name: set_hostisskipping
	Namespace: cp_skip_scene_menu
	Checksum: 0x1AADA54
	Offset: 0x228
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_hostisskipping(player, value)
{
	[[ self ]]->set_hostisskipping(player, value);
}

/*
	Name: set_votedtoskip
	Namespace: cp_skip_scene_menu
	Checksum: 0xDB5AA0A
	Offset: 0x258
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_votedtoskip(player, value)
{
	[[ self ]]->set_votedtoskip(player, value);
}

/*
	Name: set_sceneskipendtime
	Namespace: cp_skip_scene_menu
	Checksum: 0x7CD7496D
	Offset: 0x288
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_sceneskipendtime(player, value)
{
	[[ self ]]->set_sceneskipendtime(player, value);
}

