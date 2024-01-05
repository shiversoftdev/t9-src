#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class cfull_screen_movie : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: cfull_screen_movie
		Checksum: 0xEA8AE624
		Offset: 0x348
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
		Checksum: 0x6CEF88F0
		Offset: 0x750
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
		Checksum: 0x7EE8FBAB
		Offset: 0x520
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
		Checksum: 0x771C2426
		Offset: 0x4A8
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
		Checksum: 0xEC8779E
		Offset: 0x700
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
		Checksum: 0x53F4E0DE
		Offset: 0x660
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
		Checksum: 0x90909634
		Offset: 0x610
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
		Checksum: 0xB0A64EB8
		Offset: 0x4F0
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
		Checksum: 0x5F2BD100
		Offset: 0x5C0
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
		Checksum: 0x438D15A6
		Offset: 0x6B0
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
		Checksum: 0xB57B3F67
		Offset: 0x570
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
		Checksum: 0x6E03C7C6
		Offset: 0x368
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
	Name: register
	Namespace: full_screen_movie
	Checksum: 0x5BFF25B6
	Offset: 0x128
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
	Checksum: 0x66AF6895
	Offset: 0x168
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
	Checksum: 0xCF4D1283
	Offset: 0x1A8
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
	Checksum: 0xD7BC2ED4
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
	Name: set_moviename
	Namespace: full_screen_movie
	Checksum: 0xD76CFA47
	Offset: 0x1F8
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
	Checksum: 0x973442C3
	Offset: 0x228
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
	Checksum: 0xF5332BC0
	Offset: 0x258
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
	Checksum: 0xF9743B58
	Offset: 0x288
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
	Checksum: 0xEA46C068
	Offset: 0x2B8
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
	Checksum: 0x76EA4CC9
	Offset: 0x2E8
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
	Checksum: 0x3B0BFD22
	Offset: 0x318
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_moviekey(player, value)
{
	[[ self ]]->set_moviekey(player, value);
}

