#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class cevidence_board_mission_preview : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: cevidence_board_mission_preview
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
		Namespace: cevidence_board_mission_preview
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
		Namespace: cevidence_board_mission_preview
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
		cluielem::open_luielem(player, flags);
	}

	/*
		Name: set_lvldescriptionshort
		Namespace: cevidence_board_mission_preview
		Checksum: 0x41F7115F
		Offset: 0x6C0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_lvldescriptionshort(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "lvlDescriptionShort", value);
	}

	/*
		Name: set_lvldescriptionlong
		Namespace: cevidence_board_mission_preview
		Checksum: 0x5B16A4CB
		Offset: 0x710
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_lvldescriptionlong(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "lvlDescriptionLong", value);
	}

	/*
		Name: set_lvlprogress
		Namespace: cevidence_board_mission_preview
		Checksum: 0xE64A1857
		Offset: 0x760
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_lvlprogress(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "lvlProgress", value);
	}

	/*
		Name: set_activestate
		Namespace: cevidence_board_mission_preview
		Checksum: 0x2F3B80FF
		Offset: 0x5D0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_activestate(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "activeState", value);
	}

	/*
		Name: close
		Namespace: cevidence_board_mission_preview
		Checksum: 0xD706DACB
		Offset: 0x550
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function close(player)
	{
		cluielem::close_luielem(player);
	}

	/*
		Name: setup_clientfields
		Namespace: cevidence_board_mission_preview
		Checksum: 0x2D3B45AA
		Offset: 0x3C8
		Size: 0x134
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("evidence_board_mission_preview");
		cluielem::add_clientfield("entNum", 1, 10, "int");
		cluielem::add_clientfield("activeState", 1, 2, "int");
		cluielem::add_clientfield("lvlYear", 1, 11, "int");
		cluielem::function_dcb34c80("string", "lvlName", 1);
		cluielem::function_dcb34c80("string", "lvlDescriptionShort", 1);
		cluielem::function_dcb34c80("string", "lvlDescriptionLong", 1);
		cluielem::add_clientfield("lvlProgress", 1, 4, "float");
	}

	/*
		Name: set_lvlname
		Namespace: cevidence_board_mission_preview
		Checksum: 0x6775F5FE
		Offset: 0x670
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_lvlname(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "lvlName", value);
	}

	/*
		Name: set_lvlyear
		Namespace: cevidence_board_mission_preview
		Checksum: 0xBD55EB01
		Offset: 0x620
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_lvlyear(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "lvlYear", value);
	}

	/*
		Name: set_entnum
		Namespace: cevidence_board_mission_preview
		Checksum: 0x5C4EA05C
		Offset: 0x580
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_entnum(player, value)
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
	set_lvlname(player, var_ba420c60.levelname);
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
	elem = new cevidence_board_mission_preview();
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
	Name: set_entnum
	Namespace: evidence_board_mission_preview
	Checksum: 0x64C2C02C
	Offset: 0x258
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_entnum(player, value)
{
	[[ self ]]->set_entnum(player, value);
}

/*
	Name: set_activestate
	Namespace: evidence_board_mission_preview
	Checksum: 0xD9F7E4FD
	Offset: 0x288
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_activestate(player, value)
{
	[[ self ]]->set_activestate(player, value);
}

/*
	Name: set_lvlyear
	Namespace: evidence_board_mission_preview
	Checksum: 0x9AE3F629
	Offset: 0x2B8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_lvlyear(player, value)
{
	[[ self ]]->set_lvlyear(player, value);
}

/*
	Name: set_lvlname
	Namespace: evidence_board_mission_preview
	Checksum: 0xB1E9CF09
	Offset: 0x2E8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_lvlname(player, value)
{
	[[ self ]]->set_lvlname(player, value);
}

/*
	Name: set_lvldescriptionshort
	Namespace: evidence_board_mission_preview
	Checksum: 0x86577C8E
	Offset: 0x318
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_lvldescriptionshort(player, value)
{
	[[ self ]]->set_lvldescriptionshort(player, value);
}

/*
	Name: set_lvldescriptionlong
	Namespace: evidence_board_mission_preview
	Checksum: 0xFD6D1C18
	Offset: 0x348
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_lvldescriptionlong(player, value)
{
	[[ self ]]->set_lvldescriptionlong(player, value);
}

/*
	Name: set_lvlprogress
	Namespace: evidence_board_mission_preview
	Checksum: 0x9E30177C
	Offset: 0x378
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_lvlprogress(player, value)
{
	[[ self ]]->set_lvlprogress(player, value);
}

