#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class cfull_screen_movie : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: cfull_screen_movie
		Checksum: 0xEE630D67
		Offset: 0x368
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cfull_screen_movie
		Checksum: 0xECA9671F
		Offset: 0x770
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: set_moviename
		Namespace: cfull_screen_movie
		Checksum: 0xB87CF950
		Offset: 0x540
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_moviename(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "movieName", value);
	}

	/*
		Name: open
		Namespace: cfull_screen_movie
		Checksum: 0x26425A5C
		Offset: 0x4C8
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
		Name: set_moviekey
		Namespace: cfull_screen_movie
		Checksum: 0xAB7DC210
		Offset: 0x720
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_moviekey(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "movieKey", value);
	}

	/*
		Name: set_playoutromovie
		Namespace: cfull_screen_movie
		Checksum: 0xB389CA66
		Offset: 0x680
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_playoutromovie(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "playOutroMovie", value);
	}

	/*
		Name: set_additive
		Namespace: cfull_screen_movie
		Checksum: 0xF49B8821
		Offset: 0x630
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_additive(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "additive", value);
	}

	/*
		Name: close
		Namespace: cfull_screen_movie
		Checksum: 0x986D1152
		Offset: 0x510
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function close(player)
	{
		cluielem::close_luielem(player);
	}

	/*
		Name: set_looping
		Namespace: cfull_screen_movie
		Checksum: 0x51C66473
		Offset: 0x5E0
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_looping(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "looping", value);
	}

	/*
		Name: registerplayer_callout_traversal
		Namespace: cfull_screen_movie
		Checksum: 0x786E13F3
		Offset: 0x6D0
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function registerplayer_callout_traversal(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "skippable", value);
	}

	/*
		Name: set_showblackscreen
		Namespace: cfull_screen_movie
		Checksum: 0x429BEE62
		Offset: 0x590
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_showblackscreen(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "showBlackScreen", value);
	}

	/*
		Name: setup_clientfields
		Namespace: cfull_screen_movie
		Checksum: 0xC5C8E9B
		Offset: 0x388
		Size: 0x134
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("full_screen_movie");
		cluielem::function_dcb34c80("moviefile", "movieName", 1);
		cluielem::add_clientfield("showBlackScreen", 1, 1, "int");
		cluielem::add_clientfield("looping", 1, 1, "int");
		cluielem::add_clientfield("additive", 1, 1, "int");
		cluielem::add_clientfield("playOutroMovie", 1, 1, "int");
		cluielem::add_clientfield("skippable", 1, 1, "int");
		cluielem::function_dcb34c80("moviefile", "movieKey", 1);
	}

}

#namespace full_screen_movie;

/*
	Name: function_201d17ac
	Namespace: full_screen_movie
	Checksum: 0x39394F31
	Offset: 0x128
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_201d17ac()
{
	level notify(1425551709);
}

/*
	Name: register
	Namespace: full_screen_movie
	Checksum: 0xC18B6147
	Offset: 0x148
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function register()
{
	elem = new cfull_screen_movie();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: full_screen_movie
	Checksum: 0x584B4B43
	Offset: 0x188
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
	Namespace: full_screen_movie
	Checksum: 0x5189623B
	Offset: 0x1C8
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
	Namespace: full_screen_movie
	Checksum: 0xC3D6EA8D
	Offset: 0x1F0
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
	Namespace: full_screen_movie
	Checksum: 0x6526A4AA
	Offset: 0x218
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
	Namespace: full_screen_movie
	Checksum: 0x9F03516A
	Offset: 0x248
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
	Namespace: full_screen_movie
	Checksum: 0x952E4D97
	Offset: 0x278
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
	Namespace: full_screen_movie
	Checksum: 0xFF68E418
	Offset: 0x2A8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_additive(player, value)
{
	[[ self ]]->set_additive(player, value);
}

/*
	Name: set_playoutromovie
	Namespace: full_screen_movie
	Checksum: 0x73EB31A
	Offset: 0x2D8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_playoutromovie(player, value)
{
	[[ self ]]->set_playoutromovie(player, value);
}

/*
	Name: registerplayer_callout_traversal
	Namespace: full_screen_movie
	Checksum: 0x1F65BB17
	Offset: 0x308
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function registerplayer_callout_traversal(player, value)
{
	[[ self ]]->registerplayer_callout_traversal(player, value);
}

/*
	Name: set_moviekey
	Namespace: full_screen_movie
	Checksum: 0x931FD0EA
	Offset: 0x338
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_moviekey(player, value)
{
	[[ self ]]->set_moviekey(player, value);
}

