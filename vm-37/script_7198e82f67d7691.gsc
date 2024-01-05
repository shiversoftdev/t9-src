#using scripts\core_common\lui_shared.csc;

class cevidence_board_mission_preview : cluielem
{

	/*
		Name: constructor
		Namespace: cevidence_board_mission_preview
		Checksum: 0xC831514C
		Offset: 0x508
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
		Checksum: 0x539F82DD
		Offset: 0x9A0
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
		Checksum: 0x4BE837CC
		Offset: 0x7E8
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		cluielem::open(localclientnum);
	}

	/*
		Name: set_lvldescriptionshort
		Namespace: cevidence_board_mission_preview
		Checksum: 0x8B04B43A
		Offset: 0x8F8
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_lvldescriptionshort(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "lvlDescriptionShort", value);
	}

	/*
		Name: set_lvldescriptionlong
		Namespace: cevidence_board_mission_preview
		Checksum: 0xDF2D5372
		Offset: 0x930
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_lvldescriptionlong(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "lvlDescriptionLong", value);
	}

	/*
		Name: set_lvlprogress
		Namespace: cevidence_board_mission_preview
		Checksum: 0x9551C29C
		Offset: 0x968
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_lvlprogress(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "lvlProgress", value);
	}

	/*
		Name: set_activestate
		Namespace: cevidence_board_mission_preview
		Checksum: 0xDB43D53C
		Offset: 0x850
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_activestate(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "activeState", value);
	}

	/*
		Name: register_clientside
		Namespace: cevidence_board_mission_preview
		Checksum: 0x7B7F0E49
		Offset: 0x6A0
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function register_clientside()
	{
		cluielem::register_clientside("evidence_board_mission_preview");
	}

	/*
		Name: setup_clientfields
		Namespace: cevidence_board_mission_preview
		Checksum: 0xAF245C9A
		Offset: 0x528
		Size: 0x16C
		Parameters: 7
		Flags: None
	*/
	function setup_clientfields(var_5a7b4b38, var_ce679737, var_21c9fb3e, var_370e913b, var_4682a952, var_72328549, var_8c8b5d16)
	{
		cluielem::setup_clientfields("evidence_board_mission_preview");
		cluielem::add_clientfield("entNum", 1, 10, "int", var_370e913b);
		cluielem::add_clientfield("activeState", 1, 2, "int", var_4682a952);
		cluielem::add_clientfield("lvlYear", 1, 11, "int", var_72328549);
		cluielem::function_dcb34c80("string", "lvlName", 1);
		cluielem::function_dcb34c80("string", "lvlDescriptionShort", 1);
		cluielem::function_dcb34c80("string", "lvlDescriptionLong", 1);
		cluielem::add_clientfield("lvlProgress", 1, 4, "float", var_8c8b5d16);
	}

	/*
		Name: set_lvlname
		Namespace: cevidence_board_mission_preview
		Checksum: 0x6D5AE5BF
		Offset: 0x8C0
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_lvlname(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "lvlName", value);
	}

	/*
		Name: set_lvlyear
		Namespace: cevidence_board_mission_preview
		Checksum: 0x45509C18
		Offset: 0x888
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_lvlyear(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "lvlYear", value);
	}

	/*
		Name: set_entnum
		Namespace: cevidence_board_mission_preview
		Checksum: 0xE80B36E9
		Offset: 0x818
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_entnum(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "entNum", value);
	}

	/*
		Name: function_fa582112
		Namespace: cevidence_board_mission_preview
		Checksum: 0x6BBE8AC4
		Offset: 0x6C8
		Size: 0x118
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
		[[ self ]]->set_data(localclientnum, "entNum", 0);
		[[ self ]]->set_data(localclientnum, "activeState", 0);
		[[ self ]]->set_data(localclientnum, "lvlYear", 0);
		[[ self ]]->set_data(localclientnum, "lvlName", #"");
		[[ self ]]->set_data(localclientnum, "lvlDescriptionShort", #"");
		[[ self ]]->set_data(localclientnum, "lvlDescriptionLong", #"");
		[[ self ]]->set_data(localclientnum, "lvlProgress", 0);
	}

}

#namespace evidence_board_mission_preview;

/*
	Name: register
	Namespace: evidence_board_mission_preview
	Checksum: 0x6A00262E
	Offset: 0x140
	Size: 0x1B6
	Parameters: 7
	Flags: None
*/
function register(var_5a7b4b38, var_ce679737, var_21c9fb3e, var_370e913b, var_4682a952, var_72328549, var_8c8b5d16)
{
	elem = new cevidence_board_mission_preview();
	[[ elem ]]->setup_clientfields(var_5a7b4b38, var_ce679737, var_21c9fb3e, var_370e913b, var_4682a952, var_72328549, var_8c8b5d16);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"evidence_board_mission_preview"]))
	{
		level.var_ae746e8f[#"evidence_board_mission_preview"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"evidence_board_mission_preview"]))
	{
		level.var_ae746e8f[#"evidence_board_mission_preview"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"evidence_board_mission_preview"]))
	{
		level.var_ae746e8f[#"evidence_board_mission_preview"] = array(level.var_ae746e8f[#"evidence_board_mission_preview"]);
	}
	level.var_ae746e8f[#"evidence_board_mission_preview"][level.var_ae746e8f[#"evidence_board_mission_preview"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: evidence_board_mission_preview
	Checksum: 0x8BF30B61
	Offset: 0x300
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new cevidence_board_mission_preview();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: evidence_board_mission_preview
	Checksum: 0x412DD474
	Offset: 0x340
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function open(player)
{
	[[ self ]]->open(player);
}

/*
	Name: close
	Namespace: evidence_board_mission_preview
	Checksum: 0x7509CF12
	Offset: 0x368
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
	Checksum: 0xE90724BB
	Offset: 0x390
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: set_entnum
	Namespace: evidence_board_mission_preview
	Checksum: 0xF7976071
	Offset: 0x3B8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_entnum(localclientnum, value)
{
	[[ self ]]->set_entnum(localclientnum, value);
}

/*
	Name: set_activestate
	Namespace: evidence_board_mission_preview
	Checksum: 0x18FB0CD3
	Offset: 0x3E8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_activestate(localclientnum, value)
{
	[[ self ]]->set_activestate(localclientnum, value);
}

/*
	Name: set_lvlyear
	Namespace: evidence_board_mission_preview
	Checksum: 0xD84A3B4B
	Offset: 0x418
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_lvlyear(localclientnum, value)
{
	[[ self ]]->set_lvlyear(localclientnum, value);
}

/*
	Name: set_lvlname
	Namespace: evidence_board_mission_preview
	Checksum: 0xD3C4BFF
	Offset: 0x448
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_lvlname(localclientnum, value)
{
	[[ self ]]->set_lvlname(localclientnum, value);
}

/*
	Name: set_lvldescriptionshort
	Namespace: evidence_board_mission_preview
	Checksum: 0xE9560F61
	Offset: 0x478
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_lvldescriptionshort(localclientnum, value)
{
	[[ self ]]->set_lvldescriptionshort(localclientnum, value);
}

/*
	Name: set_lvldescriptionlong
	Namespace: evidence_board_mission_preview
	Checksum: 0x8690F216
	Offset: 0x4A8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_lvldescriptionlong(localclientnum, value)
{
	[[ self ]]->set_lvldescriptionlong(localclientnum, value);
}

/*
	Name: set_lvlprogress
	Namespace: evidence_board_mission_preview
	Checksum: 0x2510AF64
	Offset: 0x4D8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_lvlprogress(localclientnum, value)
{
	[[ self ]]->set_lvlprogress(localclientnum, value);
}

