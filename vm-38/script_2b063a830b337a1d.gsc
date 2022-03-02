#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_fb1bfa12 : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_fb1bfa12
		Checksum: 0x5550228F
		Offset: 0x3C8
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_fb1bfa12
		Checksum: 0xF55CF60
		Offset: 0x7D0
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_fb1bfa12
		Checksum: 0x4FC5C24F
		Offset: 0x528
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
		namespace_6aaccc24::function_8b8089ba(player, flags);
	}

	/*
		Name: function_10415bce
		Namespace: namespace_fb1bfa12
		Checksum: 0x3972053B
		Offset: 0x6E0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_10415bce(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "lvlDescriptionShort", value);
	}

	/*
		Name: function_275127c2
		Namespace: namespace_fb1bfa12
		Checksum: 0xC710C33E
		Offset: 0x730
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_275127c2(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "lvlDescriptionLong", value);
	}

	/*
		Name: function_3d5ae5d4
		Namespace: namespace_fb1bfa12
		Checksum: 0x68389C78
		Offset: 0x780
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_3d5ae5d4(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "lvlProgress", value);
	}

	/*
		Name: function_57d3362b
		Namespace: namespace_fb1bfa12
		Checksum: 0x29A3DC03
		Offset: 0x5F0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_57d3362b(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "activeState", value);
	}

	/*
		Name: close
		Namespace: namespace_fb1bfa12
		Checksum: 0x4A2ABF33
		Offset: 0x570
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function close(player)
	{
		namespace_6aaccc24::function_a68f6e20(player);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_fb1bfa12
		Checksum: 0x7CAF82CE
		Offset: 0x3E8
		Size: 0x134
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("evidence_board_mission_preview");
		namespace_6aaccc24::function_da693cbe("entNum", 1, 10, "int");
		namespace_6aaccc24::function_da693cbe("activeState", 1, 2, "int");
		namespace_6aaccc24::function_da693cbe("lvlYear", 1, 11, "int");
		namespace_6aaccc24::function_dcb34c80("string", "lvlName", 1);
		namespace_6aaccc24::function_dcb34c80("string", "lvlDescriptionShort", 1);
		namespace_6aaccc24::function_dcb34c80("string", "lvlDescriptionLong", 1);
		namespace_6aaccc24::function_da693cbe("lvlProgress", 1, 4, "float");
	}

	/*
		Name: function_c063a71c
		Namespace: namespace_fb1bfa12
		Checksum: 0x415CFE1F
		Offset: 0x690
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_c063a71c(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "lvlName", value);
	}

	/*
		Name: function_c2c6a8c3
		Namespace: namespace_fb1bfa12
		Checksum: 0x1096ABCC
		Offset: 0x640
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_c2c6a8c3(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "lvlYear", value);
	}

	/*
		Name: function_c8350e33
		Namespace: namespace_fb1bfa12
		Checksum: 0x1CAD3E8D
		Offset: 0x5A0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_c8350e33(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "entNum", value);
	}

}

#namespace evidence_board_mission_preview;

/*
	Name: function_be23586f
	Namespace: evidence_board_mission_preview
	Checksum: 0x59163BBE
	Offset: 0x148
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_be23586f()
{
	level notify(1121885646);
}

/*
	Name: set_display_info
	Namespace: evidence_board_mission_preview
	Checksum: 0x53D0FB53
	Offset: 0x168
	Size: 0x34
	Parameters: 2
	Flags: None
*/
function set_display_info(player, var_ba420c60)
{
	function_c063a71c(player, var_ba420c60.levelname);
}

/*
	Name: register
	Namespace: evidence_board_mission_preview
	Checksum: 0x6887D3F4
	Offset: 0x1A8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_fb1bfa12();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: evidence_board_mission_preview
	Checksum: 0xC011AF55
	Offset: 0x1E8
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
	Namespace: evidence_board_mission_preview
	Checksum: 0xD61D11A3
	Offset: 0x228
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
	Namespace: evidence_board_mission_preview
	Checksum: 0xEA7A8B61
	Offset: 0x250
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: function_c8350e33
	Namespace: evidence_board_mission_preview
	Checksum: 0xFA4CD9FB
	Offset: 0x278
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_c8350e33(player, value)
{
	[[ self ]]->function_c8350e33(player, value);
}

/*
	Name: function_57d3362b
	Namespace: evidence_board_mission_preview
	Checksum: 0xC666C165
	Offset: 0x2A8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_57d3362b(player, value)
{
	[[ self ]]->function_57d3362b(player, value);
}

/*
	Name: function_c2c6a8c3
	Namespace: evidence_board_mission_preview
	Checksum: 0x553506B9
	Offset: 0x2D8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_c2c6a8c3(player, value)
{
	[[ self ]]->function_c2c6a8c3(player, value);
}

/*
	Name: function_c063a71c
	Namespace: evidence_board_mission_preview
	Checksum: 0x32FA7012
	Offset: 0x308
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_c063a71c(player, value)
{
	[[ self ]]->function_c063a71c(player, value);
}

/*
	Name: function_10415bce
	Namespace: evidence_board_mission_preview
	Checksum: 0x638C5FC1
	Offset: 0x338
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_10415bce(player, value)
{
	[[ self ]]->function_10415bce(player, value);
}

/*
	Name: function_275127c2
	Namespace: evidence_board_mission_preview
	Checksum: 0x6E737854
	Offset: 0x368
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_275127c2(player, value)
{
	[[ self ]]->function_275127c2(player, value);
}

/*
	Name: function_3d5ae5d4
	Namespace: evidence_board_mission_preview
	Checksum: 0xA7BBBA90
	Offset: 0x398
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_3d5ae5d4(player, value)
{
	[[ self ]]->function_3d5ae5d4(player, value);
}

