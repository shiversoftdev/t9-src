#using scripts\core_common\lui_shared.csc;

class ccp_skip_scene_menu : cluielem
{

	/*
		Name: constructor
		Namespace: ccp_skip_scene_menu
		Checksum: 0x1BB06103
		Offset: 0x418
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: ccp_skip_scene_menu
		Checksum: 0x796DC5F0
		Offset: 0x6F8
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: ccp_skip_scene_menu
		Checksum: 0xA3F7BB42
		Offset: 0x5E8
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function open(localclientnum)
	{
		cluielem::open(localclientnum);
	}

	/*
		Name: set_hostisskipping
		Namespace: ccp_skip_scene_menu
		Checksum: 0x66E61648
		Offset: 0x650
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_hostisskipping(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "hostIsSkipping", value);
	}

	/*
		Name: register_clientside
		Namespace: ccp_skip_scene_menu
		Checksum: 0x3B726D35
		Offset: 0x520
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function register_clientside()
	{
		cluielem::register_clientside("cp_skip_scene_menu");
	}

	/*
		Name: set_votedtoskip
		Namespace: ccp_skip_scene_menu
		Checksum: 0x73FE5A4F
		Offset: 0x688
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_votedtoskip(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "votedToSkip", value);
	}

	/*
		Name: set_showskipbutton
		Namespace: ccp_skip_scene_menu
		Checksum: 0x2B102967
		Offset: 0x618
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_showskipbutton(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "showSkipButton", value);
	}

	/*
		Name: setup_clientfields
		Namespace: ccp_skip_scene_menu
		Checksum: 0x6EBCC49
		Offset: 0x438
		Size: 0xDC
		Parameters: 4
		Flags: Linked
	*/
	function setup_clientfields(var_792f3702, var_69bfc3be, var_b2a12719, var_266fe805)
	{
		cluielem::setup_clientfields("cp_skip_scene_menu");
		cluielem::add_clientfield("showSkipButton", 1, 2, "int", var_792f3702);
		cluielem::add_clientfield("hostIsSkipping", 1, 1, "int", var_69bfc3be);
		cluielem::add_clientfield("votedToSkip", 1, 1, "int", var_b2a12719);
		cluielem::add_clientfield("sceneSkipEndTime", 1, 3, "int", var_266fe805);
	}

	/*
		Name: set_sceneskipendtime
		Namespace: ccp_skip_scene_menu
		Checksum: 0xF9D6315B
		Offset: 0x6C0
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_sceneskipendtime(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "sceneSkipEndTime", value);
	}

	/*
		Name: function_fa582112
		Namespace: ccp_skip_scene_menu
		Checksum: 0x3344D0B3
		Offset: 0x548
		Size: 0x94
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
		[[ self ]]->set_data(localclientnum, "showSkipButton", 0);
		[[ self ]]->set_data(localclientnum, "hostIsSkipping", 0);
		[[ self ]]->set_data(localclientnum, "votedToSkip", 0);
		[[ self ]]->set_data(localclientnum, "sceneSkipEndTime", 0);
	}

}

#namespace cp_skip_scene_menu;

/*
	Name: register
	Namespace: cp_skip_scene_menu
	Checksum: 0x60778EAB
	Offset: 0x100
	Size: 0x196
	Parameters: 4
	Flags: Linked
*/
function register(var_792f3702, var_69bfc3be, var_b2a12719, var_266fe805)
{
	elem = new ccp_skip_scene_menu();
	[[ elem ]]->setup_clientfields(var_792f3702, var_69bfc3be, var_b2a12719, var_266fe805);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"cp_skip_scene_menu"]))
	{
		level.var_ae746e8f[#"cp_skip_scene_menu"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"cp_skip_scene_menu"]))
	{
		level.var_ae746e8f[#"cp_skip_scene_menu"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"cp_skip_scene_menu"]))
	{
		level.var_ae746e8f[#"cp_skip_scene_menu"] = array(level.var_ae746e8f[#"cp_skip_scene_menu"]);
	}
	level.var_ae746e8f[#"cp_skip_scene_menu"][level.var_ae746e8f[#"cp_skip_scene_menu"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: cp_skip_scene_menu
	Checksum: 0xD3C93C74
	Offset: 0x2A0
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new ccp_skip_scene_menu();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: cp_skip_scene_menu
	Checksum: 0x69968C05
	Offset: 0x2E0
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
	Namespace: cp_skip_scene_menu
	Checksum: 0x1E8D0E83
	Offset: 0x308
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
	Namespace: cp_skip_scene_menu
	Checksum: 0x472A22B8
	Offset: 0x330
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: set_showskipbutton
	Namespace: cp_skip_scene_menu
	Checksum: 0x7A5A2EDE
	Offset: 0x358
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_showskipbutton(localclientnum, value)
{
	[[ self ]]->set_showskipbutton(localclientnum, value);
}

/*
	Name: set_hostisskipping
	Namespace: cp_skip_scene_menu
	Checksum: 0xE4182462
	Offset: 0x388
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_hostisskipping(localclientnum, value)
{
	[[ self ]]->set_hostisskipping(localclientnum, value);
}

/*
	Name: set_votedtoskip
	Namespace: cp_skip_scene_menu
	Checksum: 0x60284281
	Offset: 0x3B8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_votedtoskip(localclientnum, value)
{
	[[ self ]]->set_votedtoskip(localclientnum, value);
}

/*
	Name: set_sceneskipendtime
	Namespace: cp_skip_scene_menu
	Checksum: 0xC96E742B
	Offset: 0x3E8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_sceneskipendtime(localclientnum, value)
{
	[[ self ]]->set_sceneskipendtime(localclientnum, value);
}

