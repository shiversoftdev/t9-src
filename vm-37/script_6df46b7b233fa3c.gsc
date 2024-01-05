#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class cpip_menu : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: cpip_menu
		Checksum: 0xF481D593
		Offset: 0x288
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cpip_menu
		Checksum: 0x26CD9CF6
		Offset: 0x528
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: set_moviename
		Namespace: cpip_menu
		Checksum: 0x9CFED939
		Offset: 0x3E8
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_moviename(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "movieName", value);
	}

	/*
		Name: open
		Namespace: cpip_menu
		Checksum: 0xCE4263
		Offset: 0x370
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
		cluielem::open_luielem(player, flags);
	}

	/*
		Name: set_additive
		Namespace: cpip_menu
		Checksum: 0x82C8A66C
		Offset: 0x4D8
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_additive(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "additive", value);
	}

	/*
		Name: close
		Namespace: cpip_menu
		Checksum: 0x1B9DE64C
		Offset: 0x3B8
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function close(player)
	{
		cluielem::close_luielem(player);
	}

	/*
		Name: set_looping
		Namespace: cpip_menu
		Checksum: 0xC770306E
		Offset: 0x488
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_looping(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "looping", value);
	}

	/*
		Name: set_showblackscreen
		Namespace: cpip_menu
		Checksum: 0x3D19809E
		Offset: 0x438
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_showblackscreen(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "showBlackScreen", value);
	}

	/*
		Name: setup_clientfields
		Namespace: cpip_menu
		Checksum: 0xD1C74C3D
		Offset: 0x2A8
		Size: 0xBC
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("pip_menu");
		cluielem::function_dcb34c80("moviefile", "movieName", 1);
		cluielem::add_clientfield("showBlackScreen", 1, 1, "int");
		cluielem::add_clientfield("looping", 1, 1, "int");
		cluielem::add_clientfield("additive", 1, 1, "int");
	}

}

#namespace pip_menu;

/*
	Name: register
	Namespace: pip_menu
	Checksum: 0xF392A1B4
	Offset: 0xF8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new cpip_menu();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: pip_menu
	Checksum: 0xA54E9789
	Offset: 0x138
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
	Namespace: pip_menu
	Checksum: 0x86736221
	Offset: 0x178
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
	Namespace: pip_menu
	Checksum: 0x7D032A4E
	Offset: 0x1A0
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: set_moviename
	Namespace: pip_menu
	Checksum: 0x10442B63
	Offset: 0x1C8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_moviename(player, value)
{
	[[ self ]]->set_moviename(player, value);
}

/*
	Name: set_showblackscreen
	Namespace: pip_menu
	Checksum: 0xBE2B6F54
	Offset: 0x1F8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_showblackscreen(player, value)
{
	[[ self ]]->set_showblackscreen(player, value);
}

/*
	Name: set_looping
	Namespace: pip_menu
	Checksum: 0xC0047BC8
	Offset: 0x228
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_looping(player, value)
{
	[[ self ]]->set_looping(player, value);
}

/*
	Name: set_additive
	Namespace: pip_menu
	Checksum: 0x94A18612
	Offset: 0x258
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_additive(player, value)
{
	[[ self ]]->set_additive(player, value);
}

