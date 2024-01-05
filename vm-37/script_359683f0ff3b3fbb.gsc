#using scripts\core_common\lui_shared.csc;

class cprototype_hud : cluielem
{

	/*
		Name: constructor
		Namespace: cprototype_hud
		Checksum: 0xDF0474FC
		Offset: 0x690
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
		Checksum: 0xE0D06EF7
		Offset: 0xD28
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
		Checksum: 0x7052CEC3
		Offset: 0xA90
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
		Checksum: 0x1D3215BB
		Offset: 0xCF0
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
		Checksum: 0xD1D8208F
		Offset: 0xCB8
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
		Checksum: 0xB2EE3133
		Offset: 0xB68
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
		Checksum: 0xD501EDD
		Offset: 0xC48
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
		Checksum: 0xA420C99B
		Offset: 0xAF8
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
		Checksum: 0x8974EB7D
		Offset: 0x8E8
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
		Checksum: 0xB9076475
		Offset: 0xBD8
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
		Checksum: 0xFA029563
		Offset: 0xC10
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
		Checksum: 0xEDF639D2
		Offset: 0xBA0
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
		Checksum: 0x5FF7DAEF
		Offset: 0x6B0
		Size: 0x22C
		Parameters: 11
		Flags: Linked
	*/
	function setup_clientfields(var_532cdc1a, var_7a99f2e1, var_b5ae72b8, var_2b966169, var_f16d8f66, var_8b49b908, var_e16cbdb9, var_ac373a00, var_a491b704, var_2bc363b1, var_560b5364)
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
		cluielem::add_clientfield("show_secure", 1, 1, "int", var_a491b704);
		cluielem::add_clientfield("active_objective_progress", 1, 6, "float", var_2bc363b1);
		cluielem::add_clientfield("active_obj_progress_visibility", 1, 1, "int", var_560b5364);
	}

	/*
		Name: set_active_objective_string
		Namespace: cprototype_hud
		Checksum: 0xBF22E94F
		Offset: 0xAC0
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
		Checksum: 0x128FA00C
		Offset: 0xB30
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_fanfare_visibility(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "fanfare_visibility", value);
	}

	/*
		Name: function_da4fba84
		Namespace: cprototype_hud
		Checksum: 0x3B93976
		Offset: 0xC80
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_da4fba84(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "show_secure", value);
	}

	/*
		Name: function_fa582112
		Namespace: cprototype_hud
		Checksum: 0x60B30D04
		Offset: 0x910
		Size: 0x178
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
		[[ self ]]->set_data(localclientnum, "show_secure", 0);
		[[ self ]]->set_data(localclientnum, "active_objective_progress", 0);
		[[ self ]]->set_data(localclientnum, "active_obj_progress_visibility", 0);
	}

}

#namespace prototype_hud;

/*
	Name: register
	Namespace: prototype_hud
	Checksum: 0x27033CB9
	Offset: 0x1E0
	Size: 0x1DE
	Parameters: 11
	Flags: None
*/
function register(var_532cdc1a, var_7a99f2e1, var_b5ae72b8, var_2b966169, var_f16d8f66, var_8b49b908, var_e16cbdb9, var_ac373a00, var_a491b704, var_2bc363b1, var_560b5364)
{
	elem = new cprototype_hud();
	[[ elem ]]->setup_clientfields(var_532cdc1a, var_7a99f2e1, var_b5ae72b8, var_2b966169, var_f16d8f66, var_8b49b908, var_e16cbdb9, var_ac373a00, var_a491b704, var_2bc363b1, var_560b5364);
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
	Checksum: 0xBCD20250
	Offset: 0x3C8
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
	Checksum: 0xC54C7E5D
	Offset: 0x408
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
	Checksum: 0x85744DF7
	Offset: 0x430
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
	Checksum: 0x92C9CDF
	Offset: 0x458
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
	Checksum: 0x699A1D56
	Offset: 0x480
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
	Checksum: 0x824F778
	Offset: 0x4B0
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
	Checksum: 0x3DC5B33C
	Offset: 0x4E0
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
	Checksum: 0x69B33EDD
	Offset: 0x510
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
	Checksum: 0xB9A1FB9B
	Offset: 0x540
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
	Checksum: 0x64B281F2
	Offset: 0x570
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
	Checksum: 0xE22979BD
	Offset: 0x5A0
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
	Checksum: 0xEF461C28
	Offset: 0x5D0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_objective_retrieval(localclientnum, value)
{
	[[ self ]]->set_objective_retrieval(localclientnum, value);
}

/*
	Name: function_da4fba84
	Namespace: prototype_hud
	Checksum: 0x457B8CB2
	Offset: 0x600
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_da4fba84(localclientnum, value)
{
	[[ self ]]->function_da4fba84(localclientnum, value);
}

/*
	Name: set_active_objective_progress
	Namespace: prototype_hud
	Checksum: 0x24AF5B78
	Offset: 0x630
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
	Checksum: 0x2EA96DF7
	Offset: 0x660
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_active_obj_progress_visibility(localclientnum, value)
{
	[[ self ]]->set_active_obj_progress_visibility(localclientnum, value);
}

