#using script_1478fbd17fe393cf;
#using scripts\cp_common\objectives.gsc;
#using scripts\cp_common\gametypes\globallogic_ui.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace namespace_96850e69;

/*
	Name: function_a63717d4
	Namespace: namespace_96850e69
	Checksum: 0xC2F8939
	Offset: 0x360
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_a63717d4()
{
	level notify(-1754123440);
}

/*
	Name: __init__system__
	Namespace: namespace_96850e69
	Checksum: 0x15E9ED35
	Offset: 0x380
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_3ee5d3ee068a8cc", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_96850e69
	Checksum: 0x77CCC127
	Offset: 0x3C8
	Size: 0x7C
	Parameters: 0
	Flags: Linked, Private
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
	Checksum: 0xBBDB6962
	Offset: 0x450
	Size: 0x9C
	Parameters: 1
	Flags: Linked
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
	Checksum: 0xE0495BB2
	Offset: 0x4F8
	Size: 0x9C
	Parameters: 0
	Flags: Linked
*/
function function_49ebaad2()
{
	player = getplayers()[0];
	if(isdefined(player))
	{
		timeout = 5;
		notify_str = "show_objectives";
		player thread function_d18e2e61(timeout, notify_str);
		player thread hint_tutorial::function_4c2d4fc4(#"hash_30ae598288c72637", undefined, undefined, undefined, 2, timeout, notify_str, 0);
	}
}

/*
	Name: function_d18e2e61
	Namespace: namespace_96850e69
	Checksum: 0x66C6DD44
	Offset: 0x5A0
	Size: 0x7C
	Parameters: 2
	Flags: Linked, Private
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
	Checksum: 0x85492039
	Offset: 0x628
	Size: 0x64
	Parameters: 0
	Flags: Linked
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
	Checksum: 0x1C6003EF
	Offset: 0x698
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function function_79ed6d2(var_8eaad3c1)
{
	globallogic_ui::function_9ed5232e("hudItems.cpObjectiveUiData.showHideHint", var_8eaad3c1, 1, 1, 0, 0, 1);
}

/*
	Name: function_b6d41b41
	Namespace: namespace_96850e69
	Checksum: 0xDCAA4B82
	Offset: 0x6E0
	Size: 0x64
	Parameters: 2
	Flags: Linked
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
	Checksum: 0xA17AB07C
	Offset: 0x750
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function function_be5b472b()
{
	globallogic_ui::function_9ed5232e("hudItems.cpObjectiveUiData.compassMessage", #"", 1);
	globallogic_ui::function_9ed5232e("hudItems.cpObjectiveUiData.compassState", 0, 1);
}

/*
	Name: function_49dec5b
	Namespace: namespace_96850e69
	Checksum: 0xAED80C7A
	Offset: 0x7B0
	Size: 0xAC
	Parameters: 3
	Flags: Linked
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
	Checksum: 0x9B782E47
	Offset: 0x868
	Size: 0xAC
	Parameters: 3
	Flags: Linked
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
	Checksum: 0x9321D08
	Offset: 0x920
	Size: 0xAC
	Parameters: 3
	Flags: Linked
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
	Checksum: 0xE9C1125
	Offset: 0x9D8
	Size: 0xB4
	Parameters: 3
	Flags: Linked
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
	Checksum: 0xF1763705
	Offset: 0xA98
	Size: 0x104
	Parameters: 3
	Flags: Linked
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
	Checksum: 0xF2515279
	Offset: 0xBA8
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_bfdab223(obj_id, desc)
{
	globallogic_ui::function_8954fa13("_DataSources.cp_objectives_list", obj_id, "description", desc);
}

/*
	Name: get_state
	Namespace: namespace_96850e69
	Checksum: 0x72C54E22
	Offset: 0xBF0
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
	Checksum: 0xE38B65DA
	Offset: 0xC30
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function set_state(obj_id, state)
{
	globallogic_ui::function_8954fa13("_DataSources.cp_objectives_list", obj_id, "state", state);
}

/*
	Name: set_parent
	Namespace: namespace_96850e69
	Checksum: 0x3FE7AA62
	Offset: 0xC78
	Size: 0xB4
	Parameters: 3
	Flags: Linked
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
	Name: function_6a43edf3
	Namespace: namespace_96850e69
	Checksum: 0xEF47256D
	Offset: 0xD38
	Size: 0x8C
	Parameters: 2
	Flags: Linked
*/
function function_6a43edf3(obj_id, var_e68e38b0)
{
	if(!isdefined(var_e68e38b0))
	{
		var_e68e38b0 = 1;
	}
	if(isdefined(obj_id))
	{
		globallogic_ui::function_8954fa13("_DataSources.cp_objectives_list", obj_id, "isEndObjective", var_e68e38b0);
		model_name = ("objectives_info." + obj_id) + ".isEndObjective";
		globallogic_ui::function_9ed5232e(model_name, var_e68e38b0);
	}
}

/*
	Name: function_572778b9
	Namespace: namespace_96850e69
	Checksum: 0x10CCD92B
	Offset: 0xDD0
	Size: 0x8C
	Parameters: 2
	Flags: Linked
*/
function function_572778b9(obj_id, var_b2a9edc5)
{
	if(!isdefined(var_b2a9edc5))
	{
		var_b2a9edc5 = 1;
	}
	if(isdefined(obj_id))
	{
		globallogic_ui::function_8954fa13("_DataSources.cp_objectives_list", obj_id, "isOptional", var_b2a9edc5);
		model_name = ("objectives_info." + obj_id) + ".isOptional";
		globallogic_ui::function_9ed5232e(model_name, var_b2a9edc5);
	}
}

/*
	Name: function_8d9f9a22
	Namespace: namespace_96850e69
	Checksum: 0xFE356E00
	Offset: 0xE68
	Size: 0xA4
	Parameters: 1
	Flags: Linked
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
	Checksum: 0x63898433
	Offset: 0xF18
	Size: 0x8C
	Parameters: 1
	Flags: Linked
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
	Name: set_progress
	Namespace: namespace_96850e69
	Checksum: 0xF4A76A4
	Offset: 0xFB0
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function set_progress(obj_id, progress)
{
	globallogic_ui::function_8954fa13("_DataSources.cp_objectives_list", obj_id, "progress", progress);
}

/*
	Name: function_97d05398
	Namespace: namespace_96850e69
	Checksum: 0xA06FB54F
	Offset: 0xFF8
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_97d05398(obj_id, count)
{
	globallogic_ui::function_8954fa13("_DataSources.cp_objectives_list", obj_id, "currentCount", count);
}

/*
	Name: function_302128de
	Namespace: namespace_96850e69
	Checksum: 0x699D7367
	Offset: 0x1040
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_302128de(obj_id, count)
{
	globallogic_ui::function_8954fa13("_DataSources.cp_objectives_list", obj_id, "targetCount", count);
}

/*
	Name: function_bacd9b1f
	Namespace: namespace_96850e69
	Checksum: 0x32C86BF3
	Offset: 0x1088
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_bacd9b1f(obj_id, show)
{
	globallogic_ui::function_8954fa13("_DataSources.cp_objectives_list", obj_id, "showCounts", show);
}

/*
	Name: function_1fe5876a
	Namespace: namespace_96850e69
	Checksum: 0x2030A6C5
	Offset: 0x10D0
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function function_1fe5876a(obj_id)
{
	return isdefined(globallogic_ui::function_a8d716c5("_DataSources.cp_objectives_list", obj_id, "description"));
}

/*
	Name: function_80af6d
	Namespace: namespace_96850e69
	Checksum: 0x145AD8DF
	Offset: 0x1110
	Size: 0x6C
	Parameters: 1
	Flags: Linked
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
	Checksum: 0x6112022B
	Offset: 0x1188
	Size: 0xAC
	Parameters: 0
	Flags: Linked
*/
function remove_all()
{
	for(i = 0; i < 64; i++)
	{
		globallogic_ui::function_6db5e620("_DataSources.cp_objectives_list", i, undefined, 1);
		objective_delete(i);
	}
	globallogic_ui::function_9ed5232e("hudItems.cpObjectiveUiData.updateList", 1, 1, 1, 0, 0, 1, 1);
	function_bb708c99(-1, 1);
}

/*
	Name: function_bb708c99
	Namespace: namespace_96850e69
	Checksum: 0x35500D36
	Offset: 0x1240
	Size: 0x4C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_bb708c99(obj_id, var_cb887047)
{
	globallogic_ui::function_9ed5232e("objectives_info." + "removedObjective", obj_id, 0, 1, undefined, undefined, undefined, var_cb887047);
}

