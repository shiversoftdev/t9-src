#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class conslaught_hud : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: conslaught_hud
		Checksum: 0x84312C65
		Offset: 0x3D8
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
		Checksum: 0xD9CCA883
		Offset: 0x8D0
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
		Checksum: 0xC9B701FF
		Offset: 0x588
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
		Checksum: 0xC3087949
		Offset: 0x830
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
		Checksum: 0xBA359301
		Offset: 0x6A0
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
		Checksum: 0xC26D231C
		Offset: 0x5D0
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
		Checksum: 0xEA02F946
		Offset: 0x3F8
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
		Checksum: 0xE775000
		Offset: 0x740
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
		Checksum: 0xE02A1954
		Offset: 0x650
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
		Checksum: 0x4C92E49D
		Offset: 0x600
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
		Checksum: 0xF279D539
		Offset: 0x7E0
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
		Checksum: 0x88A69D3
		Offset: 0x880
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
		Checksum: 0xA0C62627
		Offset: 0x790
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
		Checksum: 0x1DDF3EE2
		Offset: 0x6F0
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
	Name: register
	Namespace: onslaught_hud
	Checksum: 0xA9ECB270
	Offset: 0x158
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
	Checksum: 0xA54E9789
	Offset: 0x198
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
	Checksum: 0x86736221
	Offset: 0x1D8
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
	Checksum: 0x7D032A4E
	Offset: 0x200
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
	Checksum: 0x3296401
	Offset: 0x228
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
	Checksum: 0x36060E25
	Offset: 0x258
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
	Checksum: 0x6C37A2A2
	Offset: 0x288
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
	Checksum: 0xF2306C4
	Offset: 0x2B8
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
	Checksum: 0xF1BA6380
	Offset: 0x2E8
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
	Checksum: 0x9B42DF62
	Offset: 0x318
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
	Checksum: 0x2961B2D2
	Offset: 0x348
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
	Checksum: 0x5945AFDC
	Offset: 0x378
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
	Checksum: 0xB6110AF7
	Offset: 0x3A8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_showobjective2(player, value)
{
	[[ self ]]->set_showobjective2(player, value);
}

