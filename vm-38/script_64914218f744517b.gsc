#using scripts\core_common\lui_shared.csc;

class class_94abfc09 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_94abfc09
		Checksum: 0x6E3CD15D
		Offset: 0x438
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
		Checksum: 0x14FCCADB
		Offset: 0x718
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
		Checksum: 0x1380A2
		Offset: 0x608
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
		Checksum: 0x74CF307A
		Offset: 0x670
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
		Checksum: 0x41BA8186
		Offset: 0x540
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
		Checksum: 0x474DE9BA
		Offset: 0x6A8
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
		Checksum: 0x5294685D
		Offset: 0x638
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
		Checksum: 0x23AB83A9
		Offset: 0x458
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
		Checksum: 0xC815E775
		Offset: 0x6E0
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
		Checksum: 0x4AD6346B
		Offset: 0x568
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
	Name: function_8a470108
	Namespace: cp_skip_scene_menu
	Checksum: 0x344A51CF
	Offset: 0x100
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_8a470108()
{
	level notify(1136838362);
}

/*
	Name: register
	Namespace: cp_skip_scene_menu
	Checksum: 0xB289A5F6
	Offset: 0x120
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
	Checksum: 0xFF46A488
	Offset: 0x2C0
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
	Checksum: 0x45AA40A9
	Offset: 0x300
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
	Checksum: 0xD9341892
	Offset: 0x328
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
	Checksum: 0x443BE584
	Offset: 0x350
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
	Checksum: 0x633D084D
	Offset: 0x378
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
	Checksum: 0xE94C82FC
	Offset: 0x3A8
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
	Checksum: 0x4FDEE030
	Offset: 0x3D8
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
	Checksum: 0xC9208761
	Offset: 0x408
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_dad9a8ef(localclientnum, value)
{
	[[ self ]]->function_dad9a8ef(localclientnum, value);
}

