#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_7ca06143 : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_7ca06143
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
		Namespace: namespace_7ca06143
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
		Name: function_87bb24
		Namespace: namespace_7ca06143
		Checksum: 0x7EE8FBAB
		Offset: 0x520
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
		namespace_6aaccc24::function_8b8089ba(player, flags);
	}

	/*
		Name: function_251fc818
		Namespace: namespace_7ca06143
		Checksum: 0xEC8779E
		Offset: 0x700
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
		Checksum: 0x53F4E0DE
		Offset: 0x660
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
		Checksum: 0x90909634
		Offset: 0x610
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
		Checksum: 0xB0A64EB8
		Offset: 0x4F0
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
		Checksum: 0x5F2BD100
		Offset: 0x5C0
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
		Name: function_8f7a8b9c
		Namespace: namespace_7ca06143
		Checksum: 0xB57B3F67
		Offset: 0x570
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
		Checksum: 0x6E03C7C6
		Offset: 0x368
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
	elem = new class_7ca06143();
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
	Name: function_87bb24
	Namespace: full_screen_movie
	Checksum: 0xD76CFA47
	Offset: 0x1F8
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
	Checksum: 0x973442C3
	Offset: 0x228
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
	Checksum: 0xF5332BC0
	Offset: 0x258
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
	Checksum: 0xF9743B58
	Offset: 0x288
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
	Checksum: 0xEA46C068
	Offset: 0x2B8
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
	Name: function_251fc818
	Namespace: full_screen_movie
	Checksum: 0x3B0BFD22
	Offset: 0x318
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_251fc818(player, value)
{
	[[ self ]]->function_251fc818(player, value);
}

