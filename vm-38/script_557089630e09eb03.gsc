#using scripts\core_common\lui_shared.csc;

class conslaught_hud : cluielem
{

	/*
		Name: constructor
		Namespace: conslaught_hud
		Checksum: 0x4A682455
		Offset: 0x5A8
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
		Checksum: 0x55EBEC7F
		Offset: 0xB40
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
		Checksum: 0x7CAB8911
		Offset: 0x918
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		cluielem::open(localclientnum);
	}

	/*
		Name: set_showbossalert
		Namespace: conslaught_hud
		Checksum: 0x929A79AF
		Offset: 0xAD0
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_showbossalert(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "showBossAlert", value);
	}

	/*
		Name: set_score3points
		Namespace: conslaught_hud
		Checksum: 0x22BE4351
		Offset: 0x9B8
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_score3points(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "score3Points", value);
	}

	/*
		Name: register_clientside
		Namespace: conslaught_hud
		Checksum: 0x689B5E8D
		Offset: 0x7A0
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function register_clientside()
	{
		cluielem::register_clientside("onslaught_hud");
	}

	/*
		Name: setup_clientfields
		Namespace: conslaught_hud
		Checksum: 0xEBFA1DD8
		Offset: 0x5C8
		Size: 0x1CC
		Parameters: 9
		Flags: None
	*/
	function setup_clientfields(var_ef8933e3, var_61963aa5, var_964ac54, var_a584bc49, var_52a170c, var_4e7bf429, var_9a88505e, var_e805c474, var_f1a2774e)
	{
		cluielem::setup_clientfields("onslaught_hud");
		cluielem::function_dcb34c80("string", "bossAlertText", 1);
		cluielem::function_dcb34c80("string", "objective2Text", 1);
		cluielem::add_clientfield("score3Points", 1, 8, "int", var_a584bc49);
		cluielem::function_dcb34c80("string", "objectiveText", 1);
		cluielem::add_clientfield("showEndScore", 1, 1, "int", var_52a170c);
		cluielem::add_clientfield("showScore", 1, 1, "int", var_4e7bf429);
		cluielem::add_clientfield("showObjective", 1, 1, "int", var_9a88505e);
		cluielem::add_clientfield("showBossAlert", 1, 1, "int", var_e805c474);
		cluielem::add_clientfield("showObjective2", 1, 1, "int", var_f1a2774e);
	}

	/*
		Name: set_showendscore
		Namespace: conslaught_hud
		Checksum: 0xF4609480
		Offset: 0xA28
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_showendscore(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "showEndScore", value);
	}

	/*
		Name: set_objective2text
		Namespace: conslaught_hud
		Checksum: 0x669A972E
		Offset: 0x980
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_objective2text(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "objective2Text", value);
	}

	/*
		Name: set_bossalerttext
		Namespace: conslaught_hud
		Checksum: 0xA83CB26A
		Offset: 0x948
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_bossalerttext(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "bossAlertText", value);
	}

	/*
		Name: set_showobjective
		Namespace: conslaught_hud
		Checksum: 0x1F9DE9F8
		Offset: 0xA98
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_showobjective(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "showObjective", value);
	}

	/*
		Name: set_showobjective2
		Namespace: conslaught_hud
		Checksum: 0xD488BEC0
		Offset: 0xB08
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_showobjective2(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "showObjective2", value);
	}

	/*
		Name: set_showscore
		Namespace: conslaught_hud
		Checksum: 0xCF5D754B
		Offset: 0xA60
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_showscore(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "showScore", value);
	}

	/*
		Name: set_objectivetext
		Namespace: conslaught_hud
		Checksum: 0x5198F88C
		Offset: 0x9F0
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_objectivetext(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "objectiveText", value);
	}

	/*
		Name: function_fa582112
		Namespace: conslaught_hud
		Checksum: 0x2558728E
		Offset: 0x7C8
		Size: 0x148
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
		[[ self ]]->set_data(localclientnum, "bossAlertText", #"");
		[[ self ]]->set_data(localclientnum, "objective2Text", #"");
		[[ self ]]->set_data(localclientnum, "score3Points", 0);
		[[ self ]]->set_data(localclientnum, "objectiveText", #"");
		[[ self ]]->set_data(localclientnum, "showEndScore", 0);
		[[ self ]]->set_data(localclientnum, "showScore", 0);
		[[ self ]]->set_data(localclientnum, "showObjective", 0);
		[[ self ]]->set_data(localclientnum, "showBossAlert", 0);
		[[ self ]]->set_data(localclientnum, "showObjective2", 0);
	}

}

#namespace onslaught_hud;

/*
	Name: function_cfde5db8
	Namespace: onslaught_hud
	Checksum: 0x4B14E769
	Offset: 0x150
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_cfde5db8()
{
	level notify(220928970);
}

/*
	Name: register
	Namespace: onslaught_hud
	Checksum: 0x10D31DD7
	Offset: 0x170
	Size: 0x1C6
	Parameters: 9
	Flags: None
*/
function register(var_ef8933e3, var_61963aa5, var_964ac54, var_a584bc49, var_52a170c, var_4e7bf429, var_9a88505e, var_e805c474, var_f1a2774e)
{
	elem = new conslaught_hud();
	[[ elem ]]->setup_clientfields(var_ef8933e3, var_61963aa5, var_964ac54, var_a584bc49, var_52a170c, var_4e7bf429, var_9a88505e, var_e805c474, var_f1a2774e);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"onslaught_hud"]))
	{
		level.var_ae746e8f[#"onslaught_hud"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"onslaught_hud"]))
	{
		level.var_ae746e8f[#"onslaught_hud"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"onslaught_hud"]))
	{
		level.var_ae746e8f[#"onslaught_hud"] = array(level.var_ae746e8f[#"onslaught_hud"]);
	}
	level.var_ae746e8f[#"onslaught_hud"][level.var_ae746e8f[#"onslaught_hud"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: onslaught_hud
	Checksum: 0x480D0A60
	Offset: 0x340
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new conslaught_hud();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: onslaught_hud
	Checksum: 0x1257DD63
	Offset: 0x380
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
	Namespace: onslaught_hud
	Checksum: 0x6A3E091A
	Offset: 0x3A8
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
	Checksum: 0xA95BCC95
	Offset: 0x3D0
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: set_bossalerttext
	Namespace: onslaught_hud
	Checksum: 0x50137A27
	Offset: 0x3F8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_bossalerttext(localclientnum, value)
{
	[[ self ]]->set_bossalerttext(localclientnum, value);
}

/*
	Name: set_objective2text
	Namespace: onslaught_hud
	Checksum: 0x944ED90D
	Offset: 0x428
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_objective2text(localclientnum, value)
{
	[[ self ]]->set_objective2text(localclientnum, value);
}

/*
	Name: set_score3points
	Namespace: onslaught_hud
	Checksum: 0x513D7EF9
	Offset: 0x458
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_score3points(localclientnum, value)
{
	[[ self ]]->set_score3points(localclientnum, value);
}

/*
	Name: set_objectivetext
	Namespace: onslaught_hud
	Checksum: 0xE2148DAD
	Offset: 0x488
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_objectivetext(localclientnum, value)
{
	[[ self ]]->set_objectivetext(localclientnum, value);
}

/*
	Name: set_showendscore
	Namespace: onslaught_hud
	Checksum: 0xAD91BDB0
	Offset: 0x4B8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_showendscore(localclientnum, value)
{
	[[ self ]]->set_showendscore(localclientnum, value);
}

/*
	Name: set_showscore
	Namespace: onslaught_hud
	Checksum: 0x6EA531AC
	Offset: 0x4E8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_showscore(localclientnum, value)
{
	[[ self ]]->set_showscore(localclientnum, value);
}

/*
	Name: set_showobjective
	Namespace: onslaught_hud
	Checksum: 0x7FC5FD3A
	Offset: 0x518
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_showobjective(localclientnum, value)
{
	[[ self ]]->set_showobjective(localclientnum, value);
}

/*
	Name: set_showbossalert
	Namespace: onslaught_hud
	Checksum: 0xEC44DAC3
	Offset: 0x548
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_showbossalert(localclientnum, value)
{
	[[ self ]]->set_showbossalert(localclientnum, value);
}

/*
	Name: set_showobjective2
	Namespace: onslaught_hud
	Checksum: 0x66D5D07B
	Offset: 0x578
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_showobjective2(localclientnum, value)
{
	[[ self ]]->set_showobjective2(localclientnum, value);
}

