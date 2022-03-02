#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_7ca06143 : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_7ca06143
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
		Namespace: namespace_7ca06143
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
		Name: function_87bb24
		Namespace: namespace_7ca06143
		Checksum: 0xB87CF950
		Offset: 0x540
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_87bb24(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "movieName", value);
	}

	/*
		Name: open
		Namespace: namespace_7ca06143
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
		namespace_6aaccc24::function_8b8089ba(player, flags);
	}

	/*
		Name: function_251fc818
		Namespace: namespace_7ca06143
		Checksum: 0xAB7DC210
		Offset: 0x720
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_251fc818(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "movieKey", value);
	}

	/*
		Name: function_3a81612d
		Namespace: namespace_7ca06143
		Checksum: 0xB389CA66
		Offset: 0x680
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_3a81612d(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "playOutroMovie", value);
	}

	/*
		Name: function_493305af
		Namespace: namespace_7ca06143
		Checksum: 0xF49B8821
		Offset: 0x630
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_493305af(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "additive", value);
	}

	/*
		Name: close
		Namespace: namespace_7ca06143
		Checksum: 0x986D1152
		Offset: 0x510
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function close(player)
	{
		namespace_6aaccc24::function_a68f6e20(player);
	}

	/*
		Name: function_5caa21cb
		Namespace: namespace_7ca06143
		Checksum: 0x51C66473
		Offset: 0x5E0
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_5caa21cb(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "looping", value);
	}

	/*
		Name: registerplayer_callout_traversal
		Namespace: namespace_7ca06143
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
		Name: function_8f7a8b9c
		Namespace: namespace_7ca06143
		Checksum: 0x429BEE62
		Offset: 0x590
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_8f7a8b9c(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "showBlackScreen", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_7ca06143
		Checksum: 0xC5C8E9B
		Offset: 0x388
		Size: 0x134
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("full_screen_movie");
		namespace_6aaccc24::function_dcb34c80("moviefile", "movieName", 1);
		namespace_6aaccc24::function_da693cbe("showBlackScreen", 1, 1, "int");
		namespace_6aaccc24::function_da693cbe("looping", 1, 1, "int");
		namespace_6aaccc24::function_da693cbe("additive", 1, 1, "int");
		namespace_6aaccc24::function_da693cbe("playOutroMovie", 1, 1, "int");
		namespace_6aaccc24::function_da693cbe("skippable", 1, 1, "int");
		namespace_6aaccc24::function_dcb34c80("moviefile", "movieKey", 1);
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
	elem = new class_7ca06143();
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
	Name: function_87bb24
	Namespace: full_screen_movie
	Checksum: 0x6526A4AA
	Offset: 0x218
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_87bb24(player, value)
{
	[[ self ]]->function_87bb24(player, value);
}

/*
	Name: function_8f7a8b9c
	Namespace: full_screen_movie
	Checksum: 0x9F03516A
	Offset: 0x248
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_8f7a8b9c(player, value)
{
	[[ self ]]->function_8f7a8b9c(player, value);
}

/*
	Name: function_5caa21cb
	Namespace: full_screen_movie
	Checksum: 0x952E4D97
	Offset: 0x278
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_5caa21cb(player, value)
{
	[[ self ]]->function_5caa21cb(player, value);
}

/*
	Name: function_493305af
	Namespace: full_screen_movie
	Checksum: 0xFF68E418
	Offset: 0x2A8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_493305af(player, value)
{
	[[ self ]]->function_493305af(player, value);
}

/*
	Name: function_3a81612d
	Namespace: full_screen_movie
	Checksum: 0x73EB31A
	Offset: 0x2D8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_3a81612d(player, value)
{
	[[ self ]]->function_3a81612d(player, value);
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
	Name: function_251fc818
	Namespace: full_screen_movie
	Checksum: 0x931FD0EA
	Offset: 0x338
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_251fc818(player, value)
{
	[[ self ]]->function_251fc818(player, value);
}

