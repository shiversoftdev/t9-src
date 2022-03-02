#using scripts\core_common\lui_shared.csc;

class class_fb1bfa12 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_fb1bfa12
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
		Namespace: namespace_fb1bfa12
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
		Namespace: namespace_fb1bfa12
		Checksum: 0x4BE837CC
		Offset: 0x7E8
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		namespace_6aaccc24::open(localclientnum);
	}

	/*
		Name: function_10415bce
		Namespace: namespace_fb1bfa12
		Checksum: 0x8B04B43A
		Offset: 0x8F8
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_10415bce(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "lvlDescriptionShort", value);
	}

	/*
		Name: function_275127c2
		Namespace: namespace_fb1bfa12
		Checksum: 0xDF2D5372
		Offset: 0x930
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_275127c2(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "lvlDescriptionLong", value);
	}

	/*
		Name: function_3d5ae5d4
		Namespace: namespace_fb1bfa12
		Checksum: 0x9551C29C
		Offset: 0x968
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_3d5ae5d4(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "lvlProgress", value);
	}

	/*
		Name: function_57d3362b
		Namespace: namespace_fb1bfa12
		Checksum: 0xDB43D53C
		Offset: 0x850
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_57d3362b(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "activeState", value);
	}

	/*
		Name: function_5c1bb138
		Namespace: namespace_fb1bfa12
		Checksum: 0x7B7F0E49
		Offset: 0x6A0
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("evidence_board_mission_preview");
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_fb1bfa12
		Checksum: 0xAF245C9A
		Offset: 0x528
		Size: 0x16C
		Parameters: 7
		Flags: None
	*/
	function setup_clientfields(var_5a7b4b38, var_ce679737, var_21c9fb3e, var_370e913b, var_4682a952, var_72328549, var_8c8b5d16)
	{
		namespace_6aaccc24::setup_clientfields("evidence_board_mission_preview");
		namespace_6aaccc24::function_da693cbe("entNum", 1, 10, "int", var_370e913b);
		namespace_6aaccc24::function_da693cbe("activeState", 1, 2, "int", var_4682a952);
		namespace_6aaccc24::function_da693cbe("lvlYear", 1, 11, "int", var_72328549);
		namespace_6aaccc24::function_dcb34c80("string", "lvlName", 1);
		namespace_6aaccc24::function_dcb34c80("string", "lvlDescriptionShort", 1);
		namespace_6aaccc24::function_dcb34c80("string", "lvlDescriptionLong", 1);
		namespace_6aaccc24::function_da693cbe("lvlProgress", 1, 4, "float", var_8c8b5d16);
	}

	/*
		Name: function_c063a71c
		Namespace: namespace_fb1bfa12
		Checksum: 0x6D5AE5BF
		Offset: 0x8C0
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_c063a71c(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "lvlName", value);
	}

	/*
		Name: function_c2c6a8c3
		Namespace: namespace_fb1bfa12
		Checksum: 0x45509C18
		Offset: 0x888
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_c2c6a8c3(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "lvlYear", value);
	}

	/*
		Name: function_c8350e33
		Namespace: namespace_fb1bfa12
		Checksum: 0xE80B36E9
		Offset: 0x818
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_c8350e33(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "entNum", value);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_fb1bfa12
		Checksum: 0x6BBE8AC4
		Offset: 0x6C8
		Size: 0x118
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
		[[ self ]]->function_d7d2fcce(localclientnum, "entNum", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "activeState", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "lvlYear", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "lvlName", #"");
		[[ self ]]->function_d7d2fcce(localclientnum, "lvlDescriptionShort", #"");
		[[ self ]]->function_d7d2fcce(localclientnum, "lvlDescriptionLong", #"");
		[[ self ]]->function_d7d2fcce(localclientnum, "lvlProgress", 0);
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
	elem = new class_fb1bfa12();
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
	Name: function_5c1bb138
	Namespace: evidence_board_mission_preview
	Checksum: 0x8BF30B61
	Offset: 0x300
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_fb1bfa12();
	[[ elem ]]->function_5c1bb138();
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
	Name: function_c8350e33
	Namespace: evidence_board_mission_preview
	Checksum: 0xF7976071
	Offset: 0x3B8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_c8350e33(localclientnum, value)
{
	[[ self ]]->function_c8350e33(localclientnum, value);
}

/*
	Name: function_57d3362b
	Namespace: evidence_board_mission_preview
	Checksum: 0x18FB0CD3
	Offset: 0x3E8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_57d3362b(localclientnum, value)
{
	[[ self ]]->function_57d3362b(localclientnum, value);
}

/*
	Name: function_c2c6a8c3
	Namespace: evidence_board_mission_preview
	Checksum: 0xD84A3B4B
	Offset: 0x418
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_c2c6a8c3(localclientnum, value)
{
	[[ self ]]->function_c2c6a8c3(localclientnum, value);
}

/*
	Name: function_c063a71c
	Namespace: evidence_board_mission_preview
	Checksum: 0xD3C4BFF
	Offset: 0x448
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_c063a71c(localclientnum, value)
{
	[[ self ]]->function_c063a71c(localclientnum, value);
}

/*
	Name: function_10415bce
	Namespace: evidence_board_mission_preview
	Checksum: 0xE9560F61
	Offset: 0x478
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_10415bce(localclientnum, value)
{
	[[ self ]]->function_10415bce(localclientnum, value);
}

/*
	Name: function_275127c2
	Namespace: evidence_board_mission_preview
	Checksum: 0x8690F216
	Offset: 0x4A8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_275127c2(localclientnum, value)
{
	[[ self ]]->function_275127c2(localclientnum, value);
}

/*
	Name: function_3d5ae5d4
	Namespace: evidence_board_mission_preview
	Checksum: 0x2510AF64
	Offset: 0x4D8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_3d5ae5d4(localclientnum, value)
{
	[[ self ]]->function_3d5ae5d4(localclientnum, value);
}

