#using scripts\core_common\lui_shared.csc;

class class_fb1bfa12 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_fb1bfa12
		Checksum: 0x8037B073
		Offset: 0x528
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
		Checksum: 0x291BE1E8
		Offset: 0x9C0
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
		Checksum: 0x18C5B0D0
		Offset: 0x808
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
		Checksum: 0x1AC9397E
		Offset: 0x918
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
		Checksum: 0x5E687928
		Offset: 0x950
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
		Checksum: 0xB8F77B3E
		Offset: 0x988
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
		Checksum: 0xF0D3F5AE
		Offset: 0x870
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
		Checksum: 0x6B7EFFC2
		Offset: 0x6C0
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
		Checksum: 0xDA3D5BED
		Offset: 0x548
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
		Checksum: 0x9384DC91
		Offset: 0x8E0
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
		Checksum: 0x9C4D499
		Offset: 0x8A8
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
		Checksum: 0xF598FB24
		Offset: 0x838
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
		Checksum: 0x8DDC08E9
		Offset: 0x6E8
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
	Name: function_5190815f
	Namespace: evidence_board_mission_preview
	Checksum: 0xC73F831F
	Offset: 0x140
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_5190815f()
{
	level notify(1699795143);
}

/*
	Name: register
	Namespace: evidence_board_mission_preview
	Checksum: 0x6E29F710
	Offset: 0x160
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
	Checksum: 0x6B1C2D71
	Offset: 0x320
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
	Checksum: 0x9B201F4C
	Offset: 0x360
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
	Checksum: 0xD999FF9B
	Offset: 0x388
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
	Checksum: 0xDABE1528
	Offset: 0x3B0
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
	Checksum: 0x45DE3893
	Offset: 0x3D8
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
	Checksum: 0x7A0D5C4
	Offset: 0x408
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
	Checksum: 0xE50C0D79
	Offset: 0x438
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
	Checksum: 0xF4E863DA
	Offset: 0x468
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
	Checksum: 0xD7AEAA9C
	Offset: 0x498
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
	Checksum: 0xDB793EC4
	Offset: 0x4C8
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
	Checksum: 0xECF99C89
	Offset: 0x4F8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_3d5ae5d4(localclientnum, value)
{
	[[ self ]]->function_3d5ae5d4(localclientnum, value);
}

