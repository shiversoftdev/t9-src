#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class cprototype_hud : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: cprototype_hud
		Checksum: 0x4F5EDDEA
		Offset: 0x4C8
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
		Checksum: 0xAB743808
		Offset: 0xAB0
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
		Checksum: 0x388131E2
		Offset: 0x6C8
		Size: 0x3C
		Parameters: 2
		Flags: Linked
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
		Name: set_active_obj_progress_visibility
		Namespace: cprototype_hud
		Checksum: 0x16E872DD
		Offset: 0xA60
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_active_obj_progress_visibility(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "active_obj_progress_visibility", value);
	}

	/*
		Name: set_active_objective_progress
		Namespace: cprototype_hud
		Checksum: 0x64E4581B
		Offset: 0xA10
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_active_objective_progress(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "active_objective_progress", value);
	}

	/*
		Name: set_fail_fanfare_visibility
		Namespace: cprototype_hud
		Checksum: 0x73611316
		Offset: 0x830
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_fail_fanfare_visibility(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "fail_fanfare_visibility", value);
	}

	/*
		Name: set_objective_retrieval
		Namespace: cprototype_hud
		Checksum: 0x16B37E05
		Offset: 0x970
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_objective_retrieval(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "objective_retrieval", value);
	}

	/*
		Name: set_objective_prompt_visibility
		Namespace: cprototype_hud
		Checksum: 0x2B5E36B0
		Offset: 0x790
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_objective_prompt_visibility(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "objective_prompt_visibility", value);
	}

	/*
		Name: close
		Namespace: cprototype_hud
		Checksum: 0x665BBD9B
		Offset: 0x710
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function close(player)
	{
		cluielem::close_luielem(player);
	}

	/*
		Name: set_main_objective_string
		Namespace: cprototype_hud
		Checksum: 0xF4A5A881
		Offset: 0x8D0
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_main_objective_string(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "main_objective_string", value);
	}

	/*
		Name: set_active_obj_visibility
		Namespace: cprototype_hud
		Checksum: 0xE14E1E6C
		Offset: 0x920
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_active_obj_visibility(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "active_obj_visibility", value);
	}

	/*
		Name: set_new_obj_fanfare_visibility
		Namespace: cprototype_hud
		Checksum: 0x2EC3E3D2
		Offset: 0x880
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_new_obj_fanfare_visibility(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "new_obj_fanfare_visibility", value);
	}

	/*
		Name: setup_clientfields
		Namespace: cprototype_hud
		Checksum: 0x3671BF2C
		Offset: 0x4E8
		Size: 0x1D4
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("prototype_hud");
		cluielem::function_dcb34c80("string", "active_objective_string", 1);
		cluielem::add_clientfield("objective_prompt_visibility", 1, 1, "int");
		cluielem::add_clientfield("fanfare_visibility", 1, 1, "int");
		cluielem::add_clientfield("fail_fanfare_visibility", 1, 1, "int");
		cluielem::add_clientfield("new_obj_fanfare_visibility", 1, 1, "int");
		cluielem::function_dcb34c80("string", "main_objective_string", 1);
		cluielem::add_clientfield("active_obj_visibility", 1, 1, "int");
		cluielem::add_clientfield("objective_retrieval", 1, 1, "int");
		cluielem::add_clientfield("show_secure", 1, 1, "int");
		cluielem::add_clientfield("active_objective_progress", 1, 6, "float");
		cluielem::add_clientfield("active_obj_progress_visibility", 1, 1, "int");
	}

	/*
		Name: set_active_objective_string
		Namespace: cprototype_hud
		Checksum: 0x4AB174C8
		Offset: 0x740
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_active_objective_string(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "active_objective_string", value);
	}

	/*
		Name: set_fanfare_visibility
		Namespace: cprototype_hud
		Checksum: 0x4ECF5B9A
		Offset: 0x7E0
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_fanfare_visibility(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "fanfare_visibility", value);
	}

	/*
		Name: function_da4fba84
		Namespace: cprototype_hud
		Checksum: 0x75CAD2BE
		Offset: 0x9C0
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_da4fba84(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "show_secure", value);
	}

}

#namespace prototype_hud;

/*
	Name: register
	Namespace: prototype_hud
	Checksum: 0xAA2A64F4
	Offset: 0x1E8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new cprototype_hud();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: prototype_hud
	Checksum: 0x66AF6895
	Offset: 0x228
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
	Namespace: prototype_hud
	Checksum: 0xCF4D1283
	Offset: 0x268
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
	Checksum: 0xD7BC2ED4
	Offset: 0x290
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: set_active_objective_string
	Namespace: prototype_hud
	Checksum: 0x2DD05CA5
	Offset: 0x2B8
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_active_objective_string(player, value)
{
	[[ self ]]->set_active_objective_string(player, value);
}

/*
	Name: set_objective_prompt_visibility
	Namespace: prototype_hud
	Checksum: 0x24E283ED
	Offset: 0x2E8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_objective_prompt_visibility(player, value)
{
	[[ self ]]->set_objective_prompt_visibility(player, value);
}

/*
	Name: set_fanfare_visibility
	Namespace: prototype_hud
	Checksum: 0xEFB3CE9C
	Offset: 0x318
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_fanfare_visibility(player, value)
{
	[[ self ]]->set_fanfare_visibility(player, value);
}

/*
	Name: set_fail_fanfare_visibility
	Namespace: prototype_hud
	Checksum: 0x86443B99
	Offset: 0x348
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_fail_fanfare_visibility(player, value)
{
	[[ self ]]->set_fail_fanfare_visibility(player, value);
}

/*
	Name: set_new_obj_fanfare_visibility
	Namespace: prototype_hud
	Checksum: 0xAB5EDED9
	Offset: 0x378
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_new_obj_fanfare_visibility(player, value)
{
	[[ self ]]->set_new_obj_fanfare_visibility(player, value);
}

/*
	Name: set_main_objective_string
	Namespace: prototype_hud
	Checksum: 0xCDDAF9C4
	Offset: 0x3A8
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_main_objective_string(player, value)
{
	[[ self ]]->set_main_objective_string(player, value);
}

/*
	Name: set_active_obj_visibility
	Namespace: prototype_hud
	Checksum: 0x74CFC66B
	Offset: 0x3D8
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_active_obj_visibility(player, value)
{
	[[ self ]]->set_active_obj_visibility(player, value);
}

/*
	Name: set_objective_retrieval
	Namespace: prototype_hud
	Checksum: 0xBD11BDE8
	Offset: 0x408
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_objective_retrieval(player, value)
{
	[[ self ]]->set_objective_retrieval(player, value);
}

/*
	Name: function_da4fba84
	Namespace: prototype_hud
	Checksum: 0x940D428C
	Offset: 0x438
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_da4fba84(player, value)
{
	[[ self ]]->function_da4fba84(player, value);
}

/*
	Name: set_active_objective_progress
	Namespace: prototype_hud
	Checksum: 0x6E50815F
	Offset: 0x468
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_active_objective_progress(player, value)
{
	[[ self ]]->set_active_objective_progress(player, value);
}

/*
	Name: set_active_obj_progress_visibility
	Namespace: prototype_hud
	Checksum: 0x2B5BF8E2
	Offset: 0x498
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_active_obj_progress_visibility(player, value)
{
	[[ self ]]->set_active_obj_progress_visibility(player, value);
}

