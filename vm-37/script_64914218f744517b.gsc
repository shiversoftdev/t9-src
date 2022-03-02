#using scripts\core_common\lui_shared.csc;

class class_94abfc09 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_94abfc09
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
		Namespace: namespace_94abfc09
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
		Namespace: namespace_94abfc09
		Checksum: 0xA3F7BB42
		Offset: 0x5E8
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function open(localclientnum)
	{
		namespace_6aaccc24::open(localclientnum);
	}

	/*
		Name: function_300eba00
		Namespace: namespace_94abfc09
		Checksum: 0x66E61648
		Offset: 0x650
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_300eba00(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "hostIsSkipping", value);
	}

	/*
		Name: function_5c1bb138
		Namespace: namespace_94abfc09
		Checksum: 0x3B726D35
		Offset: 0x520
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("cp_skip_scene_menu");
	}

	/*
		Name: function_5d0d17fd
		Namespace: namespace_94abfc09
		Checksum: 0x73FE5A4F
		Offset: 0x688
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_5d0d17fd(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "votedToSkip", value);
	}

	/*
		Name: function_6c680730
		Namespace: namespace_94abfc09
		Checksum: 0x2B102967
		Offset: 0x618
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_6c680730(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "showSkipButton", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_94abfc09
		Checksum: 0x6EBCC49
		Offset: 0x438
		Size: 0xDC
		Parameters: 4
		Flags: Linked
	*/
	function setup_clientfields(var_792f3702, var_69bfc3be, var_b2a12719, var_266fe805)
	{
		namespace_6aaccc24::setup_clientfields("cp_skip_scene_menu");
		namespace_6aaccc24::function_da693cbe("showSkipButton", 1, 2, "int", var_792f3702);
		namespace_6aaccc24::function_da693cbe("hostIsSkipping", 1, 1, "int", var_69bfc3be);
		namespace_6aaccc24::function_da693cbe("votedToSkip", 1, 1, "int", var_b2a12719);
		namespace_6aaccc24::function_da693cbe("sceneSkipEndTime", 1, 3, "int", var_266fe805);
	}

	/*
		Name: function_dad9a8ef
		Namespace: namespace_94abfc09
		Checksum: 0xF9D6315B
		Offset: 0x6C0
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_dad9a8ef(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "sceneSkipEndTime", value);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_94abfc09
		Checksum: 0x3344D0B3
		Offset: 0x548
		Size: 0x94
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
		[[ self ]]->function_d7d2fcce(localclientnum, "showSkipButton", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "hostIsSkipping", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "votedToSkip", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "sceneSkipEndTime", 0);
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
	elem = new class_94abfc09();
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
	Name: function_5c1bb138
	Namespace: cp_skip_scene_menu
	Checksum: 0xD3C93C74
	Offset: 0x2A0
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_94abfc09();
	[[ elem ]]->function_5c1bb138();
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
	Name: function_6c680730
	Namespace: cp_skip_scene_menu
	Checksum: 0x7A5A2EDE
	Offset: 0x358
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_6c680730(localclientnum, value)
{
	[[ self ]]->function_6c680730(localclientnum, value);
}

/*
	Name: function_300eba00
	Namespace: cp_skip_scene_menu
	Checksum: 0xE4182462
	Offset: 0x388
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_300eba00(localclientnum, value)
{
	[[ self ]]->function_300eba00(localclientnum, value);
}

/*
	Name: function_5d0d17fd
	Namespace: cp_skip_scene_menu
	Checksum: 0x60284281
	Offset: 0x3B8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_5d0d17fd(localclientnum, value)
{
	[[ self ]]->function_5d0d17fd(localclientnum, value);
}

/*
	Name: function_dad9a8ef
	Namespace: cp_skip_scene_menu
	Checksum: 0xC96E742B
	Offset: 0x3E8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_dad9a8ef(localclientnum, value)
{
	[[ self ]]->function_dad9a8ef(localclientnum, value);
}

