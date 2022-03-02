#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_fb1bfa12 : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_fb1bfa12
		Checksum: 0x16266B8D
		Offset: 0x3A8
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
		Checksum: 0xD6EBDCA
		Offset: 0x7B0
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
		Checksum: 0xE60E78FD
		Offset: 0x508
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
		Checksum: 0x41F7115F
		Offset: 0x6C0
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
		Checksum: 0x5B16A4CB
		Offset: 0x710
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
		Checksum: 0xE64A1857
		Offset: 0x760
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
		Checksum: 0x2F3B80FF
		Offset: 0x5D0
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
		Checksum: 0xD706DACB
		Offset: 0x550
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
		Checksum: 0x2D3B45AA
		Offset: 0x3C8
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
		Checksum: 0x6775F5FE
		Offset: 0x670
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
		Checksum: 0xBD55EB01
		Offset: 0x620
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
		Checksum: 0x5C4EA05C
		Offset: 0x580
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
	Name: set_display_info
	Namespace: evidence_board_mission_preview
	Checksum: 0x781F27F1
	Offset: 0x148
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
	Checksum: 0x15F8278F
	Offset: 0x188
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
	Checksum: 0xD71B69F
	Offset: 0x1C8
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
	Checksum: 0x94D28CCF
	Offset: 0x208
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
	Checksum: 0xCDFE3C8F
	Offset: 0x230
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
	Checksum: 0x64C2C02C
	Offset: 0x258
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
	Checksum: 0xD9F7E4FD
	Offset: 0x288
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
	Checksum: 0x9AE3F629
	Offset: 0x2B8
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
	Checksum: 0xB1E9CF09
	Offset: 0x2E8
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
	Checksum: 0x86577C8E
	Offset: 0x318
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
	Checksum: 0xFD6D1C18
	Offset: 0x348
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
	Checksum: 0x9E30177C
	Offset: 0x378
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_3d5ae5d4(player, value)
{
	[[ self ]]->function_3d5ae5d4(player, value);
}

