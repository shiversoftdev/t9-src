#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class ccp_skip_scene_menu : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: ccp_skip_scene_menu
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
		Namespace: ccp_skip_scene_menu
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
		Namespace: ccp_skip_scene_menu
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
		cluielem::open_luielem(player, flags);
	}

	/*
		Name: set_hostisskipping
		Namespace: ccp_skip_scene_menu
		Checksum: 0xCD94B2D0
		Offset: 0x448
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
		Checksum: 0xFEB9083
		Offset: 0x3C8
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
		Checksum: 0x61798F24
		Offset: 0x498
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
		Checksum: 0xF5CAC5EF
		Offset: 0x3F8
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
		Checksum: 0x7FD2D38
		Offset: 0x2B8
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
		Checksum: 0x8A2F2921
		Offset: 0x4E8
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
	elem = new ccp_skip_scene_menu();
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
	Name: set_showskipbutton
	Namespace: cp_skip_scene_menu
	Checksum: 0x66596B85
	Offset: 0x1D8
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
	Checksum: 0x74756D46
	Offset: 0x208
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
	Checksum: 0x4DBFFF4C
	Offset: 0x238
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
	Checksum: 0xEC52EFAB
	Offset: 0x268
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_sceneskipendtime(player, value)
{
	[[ self ]]->set_sceneskipendtime(player, value);
}

