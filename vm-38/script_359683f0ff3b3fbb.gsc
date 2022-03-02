#using scripts\core_common\lui_shared.csc;

class class_8a452bea : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_8a452bea
		Checksum: 0x71CDD2ED
		Offset: 0x668
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_8a452bea
		Checksum: 0xADAEE530
		Offset: 0xC80
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_8a452bea
		Checksum: 0x1F9C49E2
		Offset: 0xA20
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function open(localclientnum)
	{
		namespace_6aaccc24::open(localclientnum);
	}

	/*
		Name: function_1b05e380
		Namespace: namespace_8a452bea
		Checksum: 0x70683764
		Offset: 0xC48
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_1b05e380(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "active_obj_progress_visibility", value);
	}

	/*
		Name: function_1bd6077e
		Namespace: namespace_8a452bea
		Checksum: 0xC2519BD8
		Offset: 0xC10
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_1bd6077e(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "active_objective_progress", value);
	}

	/*
		Name: function_1f1846cf
		Namespace: namespace_8a452bea
		Checksum: 0xFF5AAAFE
		Offset: 0xAF8
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_1f1846cf(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "fail_fanfare_visibility", value);
	}

	/*
		Name: function_4dfb5783
		Namespace: namespace_8a452bea
		Checksum: 0xF319F9BC
		Offset: 0xBD8
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_4dfb5783(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "objective_retrieval", value);
	}

	/*
		Name: function_4e0e26c8
		Namespace: namespace_8a452bea
		Checksum: 0x905903D7
		Offset: 0xA88
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_4e0e26c8(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "objective_prompt_visibility", value);
	}

	/*
		Name: function_5c1bb138
		Namespace: namespace_8a452bea
		Checksum: 0x2A0EE71F
		Offset: 0x890
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("prototype_hud");
	}

	/*
		Name: function_7491d6c5
		Namespace: namespace_8a452bea
		Checksum: 0xF65659CA
		Offset: 0xB68
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_7491d6c5(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "main_objective_string", value);
	}

	/*
		Name: function_817e4d10
		Namespace: namespace_8a452bea
		Checksum: 0x5007CD23
		Offset: 0xBA0
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_817e4d10(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "active_obj_visibility", value);
	}

	/*
		Name: function_8c3b3ce6
		Namespace: namespace_8a452bea
		Checksum: 0x25F61916
		Offset: 0xB30
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_8c3b3ce6(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "new_obj_fanfare_visibility", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_8a452bea
		Checksum: 0x27BA6F89
		Offset: 0x688
		Size: 0x1FC
		Parameters: 10
		Flags: Linked
	*/
	function setup_clientfields(var_532cdc1a, var_7a99f2e1, var_b5ae72b8, var_2b966169, var_f16d8f66, var_8b49b908, var_e16cbdb9, var_ac373a00, var_2bc363b1, var_560b5364)
	{
		namespace_6aaccc24::setup_clientfields("prototype_hud");
		namespace_6aaccc24::function_dcb34c80("string", "active_objective_string", 1);
		namespace_6aaccc24::function_da693cbe("objective_prompt_visibility", 1, 1, "int", var_b5ae72b8);
		namespace_6aaccc24::function_da693cbe("fanfare_visibility", 1, 1, "int", var_2b966169);
		namespace_6aaccc24::function_da693cbe("fail_fanfare_visibility", 1, 1, "int", var_f16d8f66);
		namespace_6aaccc24::function_da693cbe("new_obj_fanfare_visibility", 1, 1, "int", var_8b49b908);
		namespace_6aaccc24::function_dcb34c80("string", "main_objective_string", 1);
		namespace_6aaccc24::function_da693cbe("active_obj_visibility", 1, 1, "int", var_e16cbdb9);
		namespace_6aaccc24::function_da693cbe("objective_retrieval", 1, 1, "int", var_ac373a00);
		namespace_6aaccc24::function_da693cbe("active_objective_progress", 1, 6, "float", var_2bc363b1);
		namespace_6aaccc24::function_da693cbe("active_obj_progress_visibility", 1, 1, "int", var_560b5364);
	}

	/*
		Name: function_953da284
		Namespace: namespace_8a452bea
		Checksum: 0x634EE866
		Offset: 0xA50
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_953da284(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "active_objective_string", value);
	}

	/*
		Name: function_cbcd8e48
		Namespace: namespace_8a452bea
		Checksum: 0xC508167F
		Offset: 0xAC0
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_cbcd8e48(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "fanfare_visibility", value);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_8a452bea
		Checksum: 0x11309891
		Offset: 0x8B8
		Size: 0x15C
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
		[[ self ]]->function_d7d2fcce(localclientnum, "active_objective_string", #"");
		[[ self ]]->function_d7d2fcce(localclientnum, "objective_prompt_visibility", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "fanfare_visibility", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "fail_fanfare_visibility", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "new_obj_fanfare_visibility", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "main_objective_string", #"");
		[[ self ]]->function_d7d2fcce(localclientnum, "active_obj_visibility", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "objective_retrieval", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "active_objective_progress", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "active_obj_progress_visibility", 0);
	}

}

#namespace prototype_hud;

/*
	Name: function_c68ba5e0
	Namespace: prototype_hud
	Checksum: 0xFBF26E67
	Offset: 0x1D8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_c68ba5e0()
{
	level notify(410781052);
}

/*
	Name: register
	Namespace: prototype_hud
	Checksum: 0x585C33DB
	Offset: 0x1F8
	Size: 0x1CE
	Parameters: 10
	Flags: Linked
*/
function register(var_532cdc1a, var_7a99f2e1, var_b5ae72b8, var_2b966169, var_f16d8f66, var_8b49b908, var_e16cbdb9, var_ac373a00, var_2bc363b1, var_560b5364)
{
	elem = new class_8a452bea();
	[[ elem ]]->setup_clientfields(var_532cdc1a, var_7a99f2e1, var_b5ae72b8, var_2b966169, var_f16d8f66, var_8b49b908, var_e16cbdb9, var_ac373a00, var_2bc363b1, var_560b5364);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"prototype_hud"]))
	{
		level.var_ae746e8f[#"prototype_hud"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"prototype_hud"]))
	{
		level.var_ae746e8f[#"prototype_hud"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"prototype_hud"]))
	{
		level.var_ae746e8f[#"prototype_hud"] = array(level.var_ae746e8f[#"prototype_hud"]);
	}
	level.var_ae746e8f[#"prototype_hud"][level.var_ae746e8f[#"prototype_hud"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: prototype_hud
	Checksum: 0xCDFF1153
	Offset: 0x3D0
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_8a452bea();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: prototype_hud
	Checksum: 0x145B9D2B
	Offset: 0x410
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
	Namespace: prototype_hud
	Checksum: 0x98E325CB
	Offset: 0x438
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
	Namespace: prototype_hud
	Checksum: 0xE2B9CD1C
	Offset: 0x460
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: function_953da284
	Namespace: prototype_hud
	Checksum: 0x40719737
	Offset: 0x488
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_953da284(localclientnum, value)
{
	[[ self ]]->function_953da284(localclientnum, value);
}

/*
	Name: function_4e0e26c8
	Namespace: prototype_hud
	Checksum: 0x8E0F95FE
	Offset: 0x4B8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_4e0e26c8(localclientnum, value)
{
	[[ self ]]->function_4e0e26c8(localclientnum, value);
}

/*
	Name: function_cbcd8e48
	Namespace: prototype_hud
	Checksum: 0x916DFFD4
	Offset: 0x4E8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_cbcd8e48(localclientnum, value)
{
	[[ self ]]->function_cbcd8e48(localclientnum, value);
}

/*
	Name: function_1f1846cf
	Namespace: prototype_hud
	Checksum: 0x8B5DB8FA
	Offset: 0x518
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_1f1846cf(localclientnum, value)
{
	[[ self ]]->function_1f1846cf(localclientnum, value);
}

/*
	Name: function_8c3b3ce6
	Namespace: prototype_hud
	Checksum: 0xB7FF678
	Offset: 0x548
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_8c3b3ce6(localclientnum, value)
{
	[[ self ]]->function_8c3b3ce6(localclientnum, value);
}

/*
	Name: function_7491d6c5
	Namespace: prototype_hud
	Checksum: 0xA024A50C
	Offset: 0x578
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_7491d6c5(localclientnum, value)
{
	[[ self ]]->function_7491d6c5(localclientnum, value);
}

/*
	Name: function_817e4d10
	Namespace: prototype_hud
	Checksum: 0x5EB9C1A6
	Offset: 0x5A8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_817e4d10(localclientnum, value)
{
	[[ self ]]->function_817e4d10(localclientnum, value);
}

/*
	Name: function_4dfb5783
	Namespace: prototype_hud
	Checksum: 0x76FB013C
	Offset: 0x5D8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_4dfb5783(localclientnum, value)
{
	[[ self ]]->function_4dfb5783(localclientnum, value);
}

/*
	Name: function_1bd6077e
	Namespace: prototype_hud
	Checksum: 0x7EE8B06A
	Offset: 0x608
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_1bd6077e(localclientnum, value)
{
	[[ self ]]->function_1bd6077e(localclientnum, value);
}

/*
	Name: function_1b05e380
	Namespace: prototype_hud
	Checksum: 0x62ADC04D
	Offset: 0x638
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_1b05e380(localclientnum, value)
{
	[[ self ]]->function_1b05e380(localclientnum, value);
}

