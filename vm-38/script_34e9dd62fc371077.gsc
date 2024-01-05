#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class conslaught_hud : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: conslaught_hud
		Checksum: 0xBAB192EE
		Offset: 0x3F8
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: conslaught_hud
		Checksum: 0x6D118871
		Offset: 0x8F0
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: conslaught_hud
		Checksum: 0xC046B94E
		Offset: 0x5A8
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
		Name: set_showbossalert
		Namespace: conslaught_hud
		Checksum: 0xC2D23C39
		Offset: 0x850
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_showbossalert(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "showBossAlert", value);
	}

	/*
		Name: set_score3points
		Namespace: conslaught_hud
		Checksum: 0x2C39C34F
		Offset: 0x6C0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_score3points(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "score3Points", value);
	}

	/*
		Name: close
		Namespace: conslaught_hud
		Checksum: 0xCE6DBD82
		Offset: 0x5F0
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
		Namespace: conslaught_hud
		Checksum: 0xDFC46045
		Offset: 0x418
		Size: 0x184
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("onslaught_hud");
		cluielem::function_dcb34c80("string", "bossAlertText", 1);
		cluielem::function_dcb34c80("string", "objective2Text", 1);
		cluielem::add_clientfield("score3Points", 1, 8, "int");
		cluielem::function_dcb34c80("string", "objectiveText", 1);
		cluielem::add_clientfield("showEndScore", 1, 1, "int");
		cluielem::add_clientfield("showScore", 1, 1, "int");
		cluielem::add_clientfield("showObjective", 1, 1, "int");
		cluielem::add_clientfield("showBossAlert", 1, 1, "int");
		cluielem::add_clientfield("showObjective2", 1, 1, "int");
	}

	/*
		Name: set_showendscore
		Namespace: conslaught_hud
		Checksum: 0x2F984854
		Offset: 0x760
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_showendscore(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "showEndScore", value);
	}

	/*
		Name: set_objective2text
		Namespace: conslaught_hud
		Checksum: 0x977B85E9
		Offset: 0x670
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_objective2text(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "objective2Text", value);
	}

	/*
		Name: set_bossalerttext
		Namespace: conslaught_hud
		Checksum: 0x316901CC
		Offset: 0x620
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_bossalerttext(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "bossAlertText", value);
	}

	/*
		Name: set_showobjective
		Namespace: conslaught_hud
		Checksum: 0x1E5327C8
		Offset: 0x800
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_showobjective(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "showObjective", value);
	}

	/*
		Name: set_showobjective2
		Namespace: conslaught_hud
		Checksum: 0x23B0F8C2
		Offset: 0x8A0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_showobjective2(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "showObjective2", value);
	}

	/*
		Name: set_showscore
		Namespace: conslaught_hud
		Checksum: 0x9AE5E094
		Offset: 0x7B0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_showscore(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "showScore", value);
	}

	/*
		Name: set_objectivetext
		Namespace: conslaught_hud
		Checksum: 0x4A69492A
		Offset: 0x710
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_objectivetext(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "objectiveText", value);
	}

}

#namespace onslaught_hud;

/*
	Name: function_d812c2fd
	Namespace: onslaught_hud
	Checksum: 0x12D0CFD3
	Offset: 0x158
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_d812c2fd()
{
	level notify(775371542);
}

/*
	Name: register
	Namespace: onslaught_hud
	Checksum: 0x5A6CAE71
	Offset: 0x178
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new conslaught_hud();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: onslaught_hud
	Checksum: 0xF79EBB64
	Offset: 0x1B8
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
	Namespace: onslaught_hud
	Checksum: 0x8223FA61
	Offset: 0x1F8
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
	Namespace: onslaught_hud
	Checksum: 0xC4970C2C
	Offset: 0x220
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: set_bossalerttext
	Namespace: onslaught_hud
	Checksum: 0xEF78D088
	Offset: 0x248
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_bossalerttext(player, value)
{
	[[ self ]]->set_bossalerttext(player, value);
}

/*
	Name: set_objective2text
	Namespace: onslaught_hud
	Checksum: 0xA5EAC571
	Offset: 0x278
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_objective2text(player, value)
{
	[[ self ]]->set_objective2text(player, value);
}

/*
	Name: set_score3points
	Namespace: onslaught_hud
	Checksum: 0x377F4D4
	Offset: 0x2A8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_score3points(player, value)
{
	[[ self ]]->set_score3points(player, value);
}

/*
	Name: set_objectivetext
	Namespace: onslaught_hud
	Checksum: 0xEC9E6F73
	Offset: 0x2D8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_objectivetext(player, value)
{
	[[ self ]]->set_objectivetext(player, value);
}

/*
	Name: set_showendscore
	Namespace: onslaught_hud
	Checksum: 0xCE595CE0
	Offset: 0x308
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_showendscore(player, value)
{
	[[ self ]]->set_showendscore(player, value);
}

/*
	Name: set_showscore
	Namespace: onslaught_hud
	Checksum: 0xF4D3CD8
	Offset: 0x338
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_showscore(player, value)
{
	[[ self ]]->set_showscore(player, value);
}

/*
	Name: set_showobjective
	Namespace: onslaught_hud
	Checksum: 0xC00B4800
	Offset: 0x368
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_showobjective(player, value)
{
	[[ self ]]->set_showobjective(player, value);
}

/*
	Name: set_showbossalert
	Namespace: onslaught_hud
	Checksum: 0xA7D1E647
	Offset: 0x398
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_showbossalert(player, value)
{
	[[ self ]]->set_showbossalert(player, value);
}

/*
	Name: set_showobjective2
	Namespace: onslaught_hud
	Checksum: 0x95E27CE0
	Offset: 0x3C8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_showobjective2(player, value)
{
	[[ self ]]->set_showobjective2(player, value);
}

