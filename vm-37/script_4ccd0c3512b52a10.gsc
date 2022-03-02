#using script_1478fbd17fe393cf;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\cp_common\gametypes\globallogic_ui.gsc;
#using scripts\cp_common\objectives.gsc;

#namespace namespace_96850e69;

/*
	Name: function_89f2df9
	Namespace: namespace_96850e69
	Checksum: 0x99C2C230
	Offset: 0x348
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_3ee5d3ee068a8cc", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_96850e69
	Checksum: 0x8FB5F496
	Offset: 0x390
	Size: 0x7C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	temp = #"hash_147e5fa1e7f7cd06";
	temp = #"hash_850d28553336ed0";
	temp = #"hash_3537e7d6b8dc612b";
	temp = #"hash_147fefcf7bb5023c";
	clientfield::register("toplayer", "show_objectives", 1, 2, "int");
}

/*
	Name: show_objectives
	Namespace: namespace_96850e69
	Checksum: 0x33C0310C
	Offset: 0x418
	Size: 0x9C
	Parameters: 1
	Flags: None
*/
function show_objectives(var_e9791619)
{
	if(!isdefined(var_e9791619))
	{
		var_e9791619 = 1;
	}
	self notify("5651785c71962c50");
	self endon("5651785c71962c50");
	if(var_e9791619)
	{
		clientfield::set_to_player("show_objectives", 2);
	}
	else
	{
		waittillframeend();
		clientfield::set_to_player("show_objectives", 1);
	}
	waitframe(1);
	clientfield::set_to_player("show_objectives", 0);
}

/*
	Name: function_49ebaad2
	Namespace: namespace_96850e69
	Checksum: 0x1F3A4DFD
	Offset: 0x4C0
	Size: 0x9C
	Parameters: 0
	Flags: None
*/
function function_49ebaad2()
{
	player = getplayers()[0];
	if(isdefined(player))
	{
		timeout = 5;
		notify_str = "show_objectives";
		player thread function_d18e2e61(timeout, notify_str);
		player thread namespace_fe8e9929::function_4c2d4fc4(#"hash_30ae598288c72637", undefined, undefined, undefined, 2, timeout, notify_str);
	}
}

/*
	Name: function_d18e2e61
	Namespace: namespace_96850e69
	Checksum: 0x95EE10CD
	Offset: 0x568
	Size: 0x7C
	Parameters: 2
	Flags: Private
*/
function private function_d18e2e61(timeout, notify_str)
{
	self endon(#"death");
	self notifyonplayercommand(notify_str, "+scores");
	self waittilltimeout(timeout, notify_str);
	self notifyonplayercommandremove(notify_str, "+scores");
}

/*
	Name: function_1c6b4aeb
	Namespace: namespace_96850e69
	Checksum: 0x1EB85806
	Offset: 0x5F0
	Size: 0x64
	Parameters: 0
	Flags: None
*/
function function_1c6b4aeb()
{
	globallogic_ui::function_9ed5232e("hudItems.cpObjectiveUiData.splash", 1, 1, 1, 0, 0, 1);
	waitframe(1);
	globallogic_ui::function_9ed5232e("hudItems.cpObjectiveUiData.splash", 0, 1, 1, 0, 0, 1);
}

/*
	Name: function_79ed6d2
	Namespace: namespace_96850e69
	Checksum: 0x9E18A914
	Offset: 0x660
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function function_79ed6d2(var_8eaad3c1)
{
	globallogic_ui::function_9ed5232e("hudItems.cpObjectiveUiData.showHideHint", var_8eaad3c1, 1, 1, 0, 0, 1);
}

/*
	Name: function_b6d41b41
	Namespace: namespace_96850e69
	Checksum: 0x7DEBAB4C
	Offset: 0x6A8
	Size: 0x64
	Parameters: 2
	Flags: None
*/
function function_b6d41b41(message, state)
{
	if(!isdefined(state))
	{
		state = 0;
	}
	globallogic_ui::function_9ed5232e("hudItems.cpObjectiveUiData.compassMessage", message, 1);
	globallogic_ui::function_9ed5232e("hudItems.cpObjectiveUiData.compassState", state, 1);
}

/*
	Name: function_be5b472b
	Namespace: namespace_96850e69
	Checksum: 0x15B4002D
	Offset: 0x718
	Size: 0x54
	Parameters: 0
	Flags: None
*/
function function_be5b472b()
{
	globallogic_ui::function_9ed5232e("hudItems.cpObjectiveUiData.compassMessage", #"", 1);
	globallogic_ui::function_9ed5232e("hudItems.cpObjectiveUiData.compassState", 0, 1);
}

/*
	Name: function_49dec5b
	Namespace: namespace_96850e69
	Checksum: 0x62CDA19E
	Offset: 0x778
	Size: 0xAC
	Parameters: 3
	Flags: None
*/
function function_49dec5b(str_objective, target, text)
{
	obj_id = objectives::function_285e460(str_objective, target);
	if(isdefined(obj_id))
	{
		globallogic_ui::function_9ed5232e(("objectives_info." + obj_id) + ".waypointText", text);
		globallogic_ui::function_9ed5232e(("objectives_info." + obj_id) + ".forceUpdate", 1, 0, 1, 0, 0, 1);
	}
}

/*
	Name: function_fdeb5e85
	Namespace: namespace_96850e69
	Checksum: 0x2D0A4FDF
	Offset: 0x830
	Size: 0xAC
	Parameters: 3
	Flags: None
*/
function function_fdeb5e85(str_objective, target, icon)
{
	obj_id = objectives::function_285e460(str_objective, target);
	if(isdefined(obj_id))
	{
		globallogic_ui::function_9ed5232e(("objectives_info." + obj_id) + ".waypointIcon", icon);
		globallogic_ui::function_9ed5232e(("objectives_info." + obj_id) + ".forceUpdate", 1, 0, 1, 0, 0, 1);
	}
}

/*
	Name: function_278c15e6
	Namespace: namespace_96850e69
	Checksum: 0x1DAC4FDC
	Offset: 0x8E8
	Size: 0xAC
	Parameters: 3
	Flags: None
*/
function function_278c15e6(str_objective, target, hidden)
{
	obj_id = objectives::function_285e460(str_objective, target, 1);
	if(isdefined(obj_id))
	{
		globallogic_ui::function_9ed5232e(("objectives_info." + obj_id) + ".hideWaypoint", hidden);
		globallogic_ui::function_9ed5232e(("objectives_info." + obj_id) + ".forceUpdate", 1, 0, 1, 0, 0, 1);
	}
}

/*
	Name: function_f4a32e0b
	Namespace: namespace_96850e69
	Checksum: 0xF984F335
	Offset: 0x9A0
	Size: 0xB4
	Parameters: 3
	Flags: None
*/
function function_f4a32e0b(str_objective, target, state)
{
	obj_id = objectives::function_285e460(str_objective, target);
	if(isdefined(obj_id))
	{
		globallogic_ui::function_9ed5232e(("objectives_info." + obj_id) + ".state", state);
		util::wait_network_frame(1);
		globallogic_ui::function_9ed5232e("ForceObjectiveRefresh", 1, 0, 1, 0, 0, 1);
	}
}

/*
	Name: function_6b177efc
	Namespace: namespace_96850e69
	Checksum: 0x4B2A142A
	Offset: 0xA60
	Size: 0x104
	Parameters: 3
	Flags: None
*/
function function_6b177efc(str_objective, target, delay_network_frames)
{
	if(!isdefined(delay_network_frames))
	{
		delay_network_frames = 2;
	}
	if(isdefined(target))
	{
		target endon(#"death");
	}
	level notify("update_waypoint_" + str_objective);
	level endon("update_waypoint_" + str_objective);
	if(delay_network_frames > 0)
	{
		util::wait_network_frame(delay_network_frames);
	}
	obj_id = objectives::function_285e460(str_objective, target);
	if(isdefined(obj_id))
	{
		model_name = ("objectives_info." + obj_id) + ".waypointUpdate";
		globallogic_ui::function_9ed5232e(model_name, 1, 0, 1);
	}
}

/*
	Name: function_bfdab223
	Namespace: namespace_96850e69
	Checksum: 0x44EA65E8
	Offset: 0xB70
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_bfdab223(obj_id, desc)
{
	globallogic_ui::function_8954fa13("_DataSources.cp_objectives_list", obj_id, "description", desc);
}

/*
	Name: get_state
	Namespace: namespace_96850e69
	Checksum: 0xE1C86391
	Offset: 0xBB8
	Size: 0x32
	Parameters: 1
	Flags: None
*/
function get_state(obj_id)
{
	return globallogic_ui::function_596db691("_DataSources.cp_objectives_list", obj_id, "state");
}

/*
	Name: set_state
	Namespace: namespace_96850e69
	Checksum: 0xFAC3AFE1
	Offset: 0xBF8
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function set_state(obj_id, state)
{
	globallogic_ui::function_8954fa13("_DataSources.cp_objectives_list", obj_id, "state", state);
}

/*
	Name: set_parent
	Namespace: namespace_96850e69
	Checksum: 0xDFC3455
	Offset: 0xC40
	Size: 0xB4
	Parameters: 3
	Flags: None
*/
function set_parent(obj_id, parent_id, var_834e72f6)
{
	if(!isdefined(var_834e72f6))
	{
		var_834e72f6 = 1;
	}
	if(function_1fe5876a(obj_id) && function_1fe5876a(parent_id))
	{
		globallogic_ui::function_8954fa13("_DataSources.cp_objectives_list", obj_id, "parent", parent_id);
		if(var_834e72f6)
		{
			thread function_8d9f9a22(parent_id);
			thread function_1c6b4aeb();
		}
	}
}

/*
	Name: function_572778b9
	Namespace: namespace_96850e69
	Checksum: 0xF6EA44DE
	Offset: 0xD00
	Size: 0x74
	Parameters: 1
	Flags: None
*/
function function_572778b9(obj_id)
{
	if(isdefined(obj_id))
	{
		globallogic_ui::function_8954fa13("_DataSources.cp_objectives_list", obj_id, "isOptional", 1);
		model_name = ("objectives_info." + obj_id) + ".isOptional";
		globallogic_ui::function_9ed5232e(model_name, 1);
	}
}

/*
	Name: function_8d9f9a22
	Namespace: namespace_96850e69
	Checksum: 0x90B84242
	Offset: 0xD80
	Size: 0xA4
	Parameters: 1
	Flags: None
*/
function function_8d9f9a22(obj_id)
{
	notify_string = "objective_splash" + obj_id;
	level notify(notify_string);
	level endon(notify_string);
	globallogic_ui::function_8954fa13("_DataSources.cp_objectives_list", obj_id, "newObjective", 1);
	level waittill(#"hash_4df0c0f18673f6c3");
	globallogic_ui::function_8954fa13("_DataSources.cp_objectives_list", obj_id, "newObjective", 0);
}

/*
	Name: function_f3ac479c
	Namespace: namespace_96850e69
	Checksum: 0xA592E905
	Offset: 0xE30
	Size: 0x8C
	Parameters: 1
	Flags: None
*/
function function_f3ac479c(obj_id)
{
	model = ("objectives_info." + obj_id) + ".newObjective";
	level notify(model);
	level endon(model);
	globallogic_ui::function_9ed5232e(model, 1);
	level waittill(#"hash_4df0c0f18673f6c3");
	globallogic_ui::function_9ed5232e(model, 0);
}

/*
	Name: function_affe8f61
	Namespace: namespace_96850e69
	Checksum: 0x9F30514D
	Offset: 0xEC8
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_affe8f61(obj_id, progress)
{
	globallogic_ui::function_8954fa13("_DataSources.cp_objectives_list", obj_id, "progress", progress);
}

/*
	Name: function_97d05398
	Namespace: namespace_96850e69
	Checksum: 0x88C5B2DC
	Offset: 0xF10
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_97d05398(obj_id, count)
{
	globallogic_ui::function_8954fa13("_DataSources.cp_objectives_list", obj_id, "currentCount", count);
}

/*
	Name: function_302128de
	Namespace: namespace_96850e69
	Checksum: 0x5E2770D7
	Offset: 0xF58
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_302128de(obj_id, count)
{
	globallogic_ui::function_8954fa13("_DataSources.cp_objectives_list", obj_id, "targetCount", count);
}

/*
	Name: function_bacd9b1f
	Namespace: namespace_96850e69
	Checksum: 0x4C6E5FC1
	Offset: 0xFA0
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_bacd9b1f(obj_id, show)
{
	globallogic_ui::function_8954fa13("_DataSources.cp_objectives_list", obj_id, "showCounts", show);
}

/*
	Name: function_1fe5876a
	Namespace: namespace_96850e69
	Checksum: 0x563E6C78
	Offset: 0xFE8
	Size: 0x34
	Parameters: 1
	Flags: None
*/
function function_1fe5876a(obj_id)
{
	return isdefined(globallogic_ui::function_a8d716c5("_DataSources.cp_objectives_list", obj_id, "description"));
}

/*
	Name: function_80af6d
	Namespace: namespace_96850e69
	Checksum: 0xF6388CE0
	Offset: 0x1028
	Size: 0x6C
	Parameters: 1
	Flags: None
*/
function function_80af6d(obj_id)
{
	globallogic_ui::function_6db5e620("_DataSources.cp_objectives_list", obj_id);
	globallogic_ui::function_9ed5232e("hudItems.cpObjectiveUiData.updateList", 1, 1, 1, 0, 0, 1);
	function_bb708c99(obj_id);
}

/*
	Name: remove_all
	Namespace: namespace_96850e69
	Checksum: 0x62FABC38
	Offset: 0x10A0
	Size: 0x94
	Parameters: 0
	Flags: None
*/
function remove_all()
{
	for(i = 0; i < 64; i++)
	{
		globallogic_ui::function_6db5e620("_DataSources.cp_objectives_list", i, undefined, 1);
	}
	globallogic_ui::function_9ed5232e("hudItems.cpObjectiveUiData.updateList", 1, 1, 1, 0, 0, 1, 1);
	function_bb708c99(-1);
}

/*
	Name: function_bb708c99
	Namespace: namespace_96850e69
	Checksum: 0x8FCA6AF
	Offset: 0x1140
	Size: 0x2C
	Parameters: 1
	Flags: Private
*/
function private function_bb708c99(obj_id)
{
	globallogic_ui::function_9ed5232e("objective.removedObjective", obj_id, 0, 1);
}

