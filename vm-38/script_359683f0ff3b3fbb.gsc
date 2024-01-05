#using scripts\core_common\lui_shared.csc;

class cprototype_hud : cluielem
{

	/*
		Name: constructor
		Namespace: cprototype_hud
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
		Namespace: cprototype_hud
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
		Namespace: cprototype_hud
		Checksum: 0x1F9C49E2
		Offset: 0xA20
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function open(localclientnum)
	{
		cluielem::open(localclientnum);
	}

	/*
		Name: set_active_obj_progress_visibility
		Namespace: cprototype_hud
		Checksum: 0x70683764
		Offset: 0xC48
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_active_obj_progress_visibility(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "active_obj_progress_visibility", value);
	}

	/*
		Name: set_active_objective_progress
		Namespace: cprototype_hud
		Checksum: 0xC2519BD8
		Offset: 0xC10
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_active_objective_progress(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "active_objective_progress", value);
	}

	/*
		Name: set_fail_fanfare_visibility
		Namespace: cprototype_hud
		Checksum: 0xFF5AAAFE
		Offset: 0xAF8
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_fail_fanfare_visibility(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "fail_fanfare_visibility", value);
	}

	/*
		Name: set_objective_retrieval
		Namespace: cprototype_hud
		Checksum: 0xF319F9BC
		Offset: 0xBD8
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_objective_retrieval(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "objective_retrieval", value);
	}

	/*
		Name: set_objective_prompt_visibility
		Namespace: cprototype_hud
		Checksum: 0x905903D7
		Offset: 0xA88
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_objective_prompt_visibility(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "objective_prompt_visibility", value);
	}

	/*
		Name: register_clientside
		Namespace: cprototype_hud
		Checksum: 0x2A0EE71F
		Offset: 0x890
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function register_clientside()
	{
		cluielem::register_clientside("prototype_hud");
	}

	/*
		Name: set_main_objective_string
		Namespace: cprototype_hud
		Checksum: 0xF65659CA
		Offset: 0xB68
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_main_objective_string(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "main_objective_string", value);
	}

	/*
		Name: set_active_obj_visibility
		Namespace: cprototype_hud
		Checksum: 0x5007CD23
		Offset: 0xBA0
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_active_obj_visibility(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "active_obj_visibility", value);
	}

	/*
		Name: set_new_obj_fanfare_visibility
		Namespace: cprototype_hud
		Checksum: 0x25F61916
		Offset: 0xB30
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_new_obj_fanfare_visibility(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "new_obj_fanfare_visibility", value);
	}

	/*
		Name: setup_clientfields
		Namespace: cprototype_hud
		Checksum: 0x27BA6F89
		Offset: 0x688
		Size: 0x1FC
		Parameters: 10
		Flags: Linked
	*/
	function setup_clientfields(var_532cdc1a, var_7a99f2e1, var_b5ae72b8, var_2b966169, var_f16d8f66, var_8b49b908, var_e16cbdb9, var_ac373a00, var_2bc363b1, var_560b5364)
	{
		cluielem::setup_clientfields("prototype_hud");
		cluielem::function_dcb34c80("string", "active_objective_string", 1);
		cluielem::add_clientfield("objective_prompt_visibility", 1, 1, "int", var_b5ae72b8);
		cluielem::add_clientfield("fanfare_visibility", 1, 1, "int", var_2b966169);
		cluielem::add_clientfield("fail_fanfare_visibility", 1, 1, "int", var_f16d8f66);
		cluielem::add_clientfield("new_obj_fanfare_visibility", 1, 1, "int", var_8b49b908);
		cluielem::function_dcb34c80("string", "main_objective_string", 1);
		cluielem::add_clientfield("active_obj_visibility", 1, 1, "int", var_e16cbdb9);
		cluielem::add_clientfield("objective_retrieval", 1, 1, "int", var_ac373a00);
		cluielem::add_clientfield("active_objective_progress", 1, 6, "float", var_2bc363b1);
		cluielem::add_clientfield("active_obj_progress_visibility", 1, 1, "int", var_560b5364);
	}

	/*
		Name: set_active_objective_string
		Namespace: cprototype_hud
		Checksum: 0x634EE866
		Offset: 0xA50
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_active_objective_string(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "active_objective_string", value);
	}

	/*
		Name: set_fanfare_visibility
		Namespace: cprototype_hud
		Checksum: 0xC508167F
		Offset: 0xAC0
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_fanfare_visibility(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "fanfare_visibility", value);
	}

	/*
		Name: function_fa582112
		Namespace: cprototype_hud
		Checksum: 0x11309891
		Offset: 0x8B8
		Size: 0x15C
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
		[[ self ]]->set_data(localclientnum, "active_objective_string", #"");
		[[ self ]]->set_data(localclientnum, "objective_prompt_visibility", 0);
		[[ self ]]->set_data(localclientnum, "fanfare_visibility", 0);
		[[ self ]]->set_data(localclientnum, "fail_fanfare_visibility", 0);
		[[ self ]]->set_data(localclientnum, "new_obj_fanfare_visibility", 0);
		[[ self ]]->set_data(localclientnum, "main_objective_string", #"");
		[[ self ]]->set_data(localclientnum, "active_obj_visibility", 0);
		[[ self ]]->set_data(localclientnum, "objective_retrieval", 0);
		[[ self ]]->set_data(localclientnum, "active_objective_progress", 0);
		[[ self ]]->set_data(localclientnum, "active_obj_progress_visibility", 0);
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
	level notify(-410781052);
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
	elem = new cprototype_hud();
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
	Name: register_clientside
	Namespace: prototype_hud
	Checksum: 0xCDFF1153
	Offset: 0x3D0
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new cprototype_hud();
	[[ elem ]]->register_clientside();
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
	Name: set_active_objective_string
	Namespace: prototype_hud
	Checksum: 0x40719737
	Offset: 0x488
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_active_objective_string(localclientnum, value)
{
	[[ self ]]->set_active_objective_string(localclientnum, value);
}

/*
	Name: set_objective_prompt_visibility
	Namespace: prototype_hud
	Checksum: 0x8E0F95FE
	Offset: 0x4B8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_objective_prompt_visibility(localclientnum, value)
{
	[[ self ]]->set_objective_prompt_visibility(localclientnum, value);
}

/*
	Name: set_fanfare_visibility
	Namespace: prototype_hud
	Checksum: 0x916DFFD4
	Offset: 0x4E8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_fanfare_visibility(localclientnum, value)
{
	[[ self ]]->set_fanfare_visibility(localclientnum, value);
}

/*
	Name: set_fail_fanfare_visibility
	Namespace: prototype_hud
	Checksum: 0x8B5DB8FA
	Offset: 0x518
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_fail_fanfare_visibility(localclientnum, value)
{
	[[ self ]]->set_fail_fanfare_visibility(localclientnum, value);
}

/*
	Name: set_new_obj_fanfare_visibility
	Namespace: prototype_hud
	Checksum: 0xB7FF678
	Offset: 0x548
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_new_obj_fanfare_visibility(localclientnum, value)
{
	[[ self ]]->set_new_obj_fanfare_visibility(localclientnum, value);
}

/*
	Name: set_main_objective_string
	Namespace: prototype_hud
	Checksum: 0xA024A50C
	Offset: 0x578
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_main_objective_string(localclientnum, value)
{
	[[ self ]]->set_main_objective_string(localclientnum, value);
}

/*
	Name: set_active_obj_visibility
	Namespace: prototype_hud
	Checksum: 0x5EB9C1A6
	Offset: 0x5A8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_active_obj_visibility(localclientnum, value)
{
	[[ self ]]->set_active_obj_visibility(localclientnum, value);
}

/*
	Name: set_objective_retrieval
	Namespace: prototype_hud
	Checksum: 0x76FB013C
	Offset: 0x5D8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_objective_retrieval(localclientnum, value)
{
	[[ self ]]->set_objective_retrieval(localclientnum, value);
}

/*
	Name: set_active_objective_progress
	Namespace: prototype_hud
	Checksum: 0x7EE8B06A
	Offset: 0x608
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_active_objective_progress(localclientnum, value)
{
	[[ self ]]->set_active_objective_progress(localclientnum, value);
}

/*
	Name: set_active_obj_progress_visibility
	Namespace: prototype_hud
	Checksum: 0x62ADC04D
	Offset: 0x638
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_active_obj_progress_visibility(localclientnum, value)
{
	[[ self ]]->set_active_obj_progress_visibility(localclientnum, value);
}

