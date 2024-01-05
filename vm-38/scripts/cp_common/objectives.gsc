#using scripts\cp_common\gametypes\globallogic_ui.gsc;
#using script_4ccd0c3512b52a10;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\flag_shared.gsc;

#namespace objectives;

/*
	Name: function_4c28b9ac
	Namespace: objectives
	Checksum: 0x6CD2F179
	Offset: 0x100
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_4c28b9ac()
{
	level notify(-1099172488);
}

/*
	Name: __init__system__
	Namespace: objectives
	Checksum: 0x45032D4C
	Offset: 0x120
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"objectives", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: objectives
	Checksum: 0x3F210AB0
	Offset: 0x168
	Size: 0x1C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	mission.var_c68f10d0 = [];
	mission.var_ac8e2ff9 = [];
}

/*
	Name: set
	Namespace: objectives
	Checksum: 0x7D62791B
	Offset: 0x190
	Size: 0x514
	Parameters: 8
	Flags: Linked
*/
function set(str_objective, a_targets, var_8c7ec5ce, var_4cfa0710, var_690561dc, var_87dc4de8, show_waypoint, var_bfcac307)
{
	if(!isdefined(var_4cfa0710))
	{
		var_4cfa0710 = str_objective;
	}
	if(!isdefined(var_87dc4de8))
	{
		var_87dc4de8 = 1;
	}
	if(!isdefined(show_waypoint))
	{
		show_waypoint = 1;
	}
	level flag::wait_till(#"gameplay_started");
	if(isdefined(a_targets))
	{
		if(!isdefined(a_targets))
		{
			a_targets = [];
		}
		else if(!isarray(a_targets))
		{
			a_targets = array(a_targets);
		}
		if(a_targets.size > 1)
		{
			scripted(var_4cfa0710, undefined, var_690561dc, var_87dc4de8, var_bfcac307);
			set_counter(var_4cfa0710, undefined, 0, a_targets.size);
		}
		foreach(target in a_targets)
		{
			n_obj_id = gameobjects::get_next_obj_id();
			var_ff48959 = target;
			if(isvec(target))
			{
				mission.var_c68f10d0[var_4cfa0710] = n_obj_id;
			}
			else
			{
				if(!isdefined(target.a_n_objective_ids))
				{
					target.a_n_objective_ids = [];
				}
				target.a_n_objective_ids[var_4cfa0710] = n_obj_id;
				if(!isentity(target) && isdefined(target.origin))
				{
					var_ff48959 = target.origin;
				}
				if(is_true(var_8c7ec5ce) && isentity(target))
				{
					target thread function_aa8c2bb2(var_4cfa0710, a_targets);
				}
			}
			objective_add(n_obj_id, "active", var_ff48959, str_objective);
			function_6da98133(n_obj_id);
			if(a_targets.size == 1)
			{
				if(isdefined(var_690561dc))
				{
					namespace_96850e69::function_bfdab223(n_obj_id, var_690561dc);
					namespace_96850e69::set_state(n_obj_id, 0);
				}
				if(isdefined(var_bfcac307))
				{
					namespace_96850e69::function_bacd9b1f(n_obj_id, var_bfcac307);
				}
			}
			if(show_waypoint)
			{
				thread namespace_96850e69::function_f3ac479c(n_obj_id);
			}
			namespace_96850e69::function_572778b9(n_obj_id, 0);
			namespace_96850e69::function_6a43edf3(n_obj_id, 0);
		}
	}
	else
	{
		n_obj_id = gameobjects::get_next_obj_id();
		mission.var_c68f10d0[var_4cfa0710] = n_obj_id;
		objective_add(n_obj_id, "active", (0, 0, 0), str_objective);
		function_6da98133(n_obj_id);
		if(isdefined(var_690561dc))
		{
			namespace_96850e69::function_bfdab223(n_obj_id, var_690561dc);
			namespace_96850e69::set_state(n_obj_id, 0);
		}
		if(isdefined(var_bfcac307))
		{
			namespace_96850e69::function_bacd9b1f(n_obj_id, var_bfcac307);
		}
		if(show_waypoint)
		{
			thread namespace_96850e69::function_f3ac479c(n_obj_id);
		}
		namespace_96850e69::function_572778b9(n_obj_id, 0);
		namespace_96850e69::function_6a43edf3(n_obj_id, 0);
	}
	if(var_87dc4de8 && isdefined(var_690561dc))
	{
		thread namespace_96850e69::function_8d9f9a22(n_obj_id);
		thread namespace_96850e69::function_1c6b4aeb();
	}
	player = getplayers()[0];
	if(isdefined(player) && show_waypoint)
	{
		player thread namespace_96850e69::show_objectives(0);
	}
}

/*
	Name: follow
	Namespace: objectives
	Checksum: 0x9EDD800B
	Offset: 0x6B0
	Size: 0x84
	Parameters: 6
	Flags: Linked
*/
function follow(var_4cfa0710, var_b3177bd9, var_690561dc, var_87dc4de8, show_waypoint, var_c3056ba3)
{
	if(!isdefined(show_waypoint))
	{
		show_waypoint = 0;
	}
	if(!isdefined(var_c3056ba3))
	{
		var_c3056ba3 = #"hash_f71affaf9c403ac";
	}
	set(var_c3056ba3, var_b3177bd9, 1, var_4cfa0710, var_690561dc, var_87dc4de8, show_waypoint);
}

/*
	Name: kill
	Namespace: objectives
	Checksum: 0xED2B57A0
	Offset: 0x740
	Size: 0x7C
	Parameters: 7
	Flags: None
*/
function kill(var_4cfa0710, var_3829dccf, var_690561dc, var_87dc4de8, show_waypoint, var_bfcac307, var_c3056ba3)
{
	if(!isdefined(var_c3056ba3))
	{
		var_c3056ba3 = #"hash_5c90265e62b1f975";
	}
	set(var_c3056ba3, var_3829dccf, 1, var_4cfa0710, var_690561dc, var_87dc4de8, show_waypoint, var_bfcac307);
}

/*
	Name: area
	Namespace: objectives
	Checksum: 0xE90C45C8
	Offset: 0x7C8
	Size: 0xF4
	Parameters: 8
	Flags: None
*/
function area(var_4cfa0710, var_8343acf6, radius, var_690561dc, var_87dc4de8, show_waypoint, var_bfcac307, var_c3056ba3)
{
	if(!isdefined(var_c3056ba3))
	{
		var_c3056ba3 = #"hash_4a026a0a4473d478";
	}
	set(var_c3056ba3, undefined, 0, var_4cfa0710, var_690561dc, var_87dc4de8, show_waypoint, var_bfcac307);
	if(isentity(var_8343acf6))
	{
		update_position(var_4cfa0710, var_8343acf6.origin);
	}
	else
	{
		update_position(var_4cfa0710, var_8343acf6);
	}
	function_64eaa790(var_4cfa0710, var_8343acf6, radius);
}

/*
	Name: goto
	Namespace: objectives
	Checksum: 0xEA58E9F9
	Offset: 0x8C8
	Size: 0xA4
	Parameters: 6
	Flags: Linked
*/
function goto(var_4cfa0710, position, var_690561dc, var_87dc4de8, show_waypoint, var_c3056ba3)
{
	if(!isdefined(var_c3056ba3))
	{
		var_c3056ba3 = #"cp_waypoint_breadcrumb";
	}
	if(isdefined(mission.var_c68f10d0[var_4cfa0710]))
	{
		update_position(var_4cfa0710, position);
	}
	else
	{
		set(var_c3056ba3, position, 0, var_4cfa0710, var_690561dc, var_87dc4de8, show_waypoint);
	}
}

/*
	Name: function_4eb5c04a
	Namespace: objectives
	Checksum: 0x5590638
	Offset: 0x978
	Size: 0x6C
	Parameters: 6
	Flags: Linked
*/
function function_4eb5c04a(var_4cfa0710, position, var_690561dc, var_87dc4de8, show_waypoint, var_c3056ba3)
{
	if(!isdefined(var_c3056ba3))
	{
		var_c3056ba3 = #"hash_6d05b1cec06f98c";
	}
	goto(var_4cfa0710, position, var_690561dc, var_87dc4de8, show_waypoint, var_c3056ba3);
}

/*
	Name: scripted
	Namespace: objectives
	Checksum: 0xC7EA85F8
	Offset: 0x9F0
	Size: 0x64
	Parameters: 5
	Flags: Linked
*/
function scripted(var_4cfa0710, a_ents, var_690561dc, var_87dc4de8, var_bfcac307)
{
	set(#"hash_75de14e1b11e62fd", a_ents, 1, var_4cfa0710, var_690561dc, var_87dc4de8, 0, var_bfcac307);
}

/*
	Name: convert
	Namespace: objectives
	Checksum: 0xDB122A37
	Offset: 0xA60
	Size: 0x5C
	Parameters: 2
	Flags: None
*/
function convert(var_4cfa0710, var_c3056ba3)
{
	if(isdefined(mission.var_c68f10d0[var_4cfa0710]))
	{
		objective_add(mission.var_c68f10d0[var_4cfa0710], "active", (0, 0, 0), var_c3056ba3);
	}
}

/*
	Name: remove
	Namespace: objectives
	Checksum: 0xFB60C2EC
	Offset: 0xAC8
	Size: 0x1D4
	Parameters: 2
	Flags: Linked
*/
function remove(str_objective, a_targets)
{
	if(isdefined(a_targets))
	{
		if(!isdefined(a_targets))
		{
			a_targets = [];
		}
		else if(!isarray(a_targets))
		{
			a_targets = array(a_targets);
		}
		foreach(target in a_targets)
		{
			if(target function_31679256(str_objective))
			{
				n_obj_id = target.a_n_objective_ids[str_objective];
				target.a_n_objective_ids[str_objective] = undefined;
				namespace_96850e69::function_80af6d(n_obj_id);
				objective_delete(n_obj_id);
				gameobjects::release_obj_id(n_obj_id);
			}
		}
	}
	else if(isdefined(mission.var_c68f10d0[str_objective]))
	{
		n_obj_id = mission.var_c68f10d0[str_objective];
		mission.var_c68f10d0[str_objective] = undefined;
		namespace_96850e69::function_80af6d(n_obj_id);
		objective_delete(n_obj_id);
		gameobjects::release_obj_id(n_obj_id);
	}
}

/*
	Name: update_position
	Namespace: objectives
	Checksum: 0x8235CC4B
	Offset: 0xCA8
	Size: 0x16C
	Parameters: 2
	Flags: Linked
*/
function update_position(str_objective, position)
{
	if(isdefined(mission.var_c68f10d0[str_objective]))
	{
		if(isentity(position))
		{
			objective_onentity(mission.var_c68f10d0[str_objective], position);
		}
		else
		{
			objective_clearentity(mission.var_c68f10d0[str_objective]);
			objective_setposition(mission.var_c68f10d0[str_objective], position);
		}
		if(objective_state(mission.var_c68f10d0[str_objective]) == "done")
		{
			objective_setstate(mission.var_c68f10d0[str_objective], "active");
			namespace_96850e69::set_state(mission.var_c68f10d0[str_objective], 0);
			thread namespace_96850e69::function_f4a32e0b(str_objective, undefined, 1);
		}
		thread namespace_96850e69::function_6b177efc(str_objective);
	}
}

/*
	Name: function_64eaa790
	Namespace: objectives
	Checksum: 0x633A9014
	Offset: 0xE20
	Size: 0x11C
	Parameters: 4
	Flags: Linked
*/
function function_64eaa790(str_objective, var_8343acf6, radius, var_4003470b)
{
	if(!isdefined(var_4003470b))
	{
		var_4003470b = 1;
	}
	target = undefined;
	if(self !== level)
	{
		target = self;
	}
	objid = function_285e460(str_objective, target);
	if(isdefined(objid))
	{
		if(isentity(var_8343acf6))
		{
			if(!isdefined(radius))
			{
				thread function_b6b76073(str_objective, var_8343acf6, var_4003470b);
			}
			else
			{
				thread function_634c16ef(str_objective, var_8343acf6, radius, var_4003470b);
			}
		}
		else
		{
			if(isdefined(radius))
			{
				thread function_37cf9b17(str_objective, var_8343acf6, radius, var_4003470b);
			}
			else
			{
				/#
					assertmsg("");
				#/
			}
		}
	}
}

/*
	Name: complete
	Namespace: objectives
	Checksum: 0x63BFE765
	Offset: 0xF48
	Size: 0x2FC
	Parameters: 3
	Flags: Linked
*/
function complete(str_objective, a_targets, var_834e72f6)
{
	if(!isdefined(var_834e72f6))
	{
		var_834e72f6 = 0;
	}
	if(isdefined(a_targets))
	{
		if(!isdefined(a_targets))
		{
			a_targets = [];
		}
		else if(!isarray(a_targets))
		{
			a_targets = array(a_targets);
		}
		foreach(target in a_targets)
		{
			if(target function_31679256(str_objective))
			{
				function_45951a55(str_objective);
				n_obj_id = target.a_n_objective_ids[str_objective];
				objective_setstate(n_obj_id, "done");
				if(namespace_96850e69::function_1fe5876a(n_obj_id))
				{
					namespace_96850e69::set_state(n_obj_id, 1);
					if(var_834e72f6)
					{
						namespace_96850e69::function_79ed6d2(1);
					}
				}
				else
				{
					gameobjects::release_obj_id(n_obj_id);
					target.a_n_objective_ids[str_objective] = undefined;
					if(var_834e72f6 && isdefined(mission.var_c68f10d0[str_objective]) && namespace_96850e69::function_1fe5876a(mission.var_c68f10d0[str_objective]))
					{
						namespace_96850e69::function_79ed6d2(1);
					}
				}
				target notify("complete_objective_" + str_objective);
			}
		}
	}
	else if(isdefined(mission.var_c68f10d0[str_objective]))
	{
		n_obj_id = mission.var_c68f10d0[str_objective];
		objective_setstate(n_obj_id, "done");
		if(namespace_96850e69::function_1fe5876a(n_obj_id))
		{
			namespace_96850e69::set_state(n_obj_id, 1);
			if(var_834e72f6)
			{
				namespace_96850e69::function_79ed6d2(var_834e72f6);
			}
		}
		else
		{
			gameobjects::release_obj_id(n_obj_id);
			mission.var_c68f10d0[str_objective] = undefined;
		}
	}
}

/*
	Name: function_aa8c2bb2
	Namespace: objectives
	Checksum: 0x93287EFD
	Offset: 0x1250
	Size: 0x6C
	Parameters: 2
	Flags: Linked
*/
function function_aa8c2bb2(str_objective, a_targets)
{
	self endon(#"deleted", "complete_objective_" + a_targets);
	self waittill(#"death", #"hash_26d74c393e63d809");
	thread complete(a_targets, self);
}

/*
	Name: show
	Namespace: objectives
	Checksum: 0x3BD228F6
	Offset: 0x12C8
	Size: 0xE0
	Parameters: 3
	Flags: Linked
*/
function show(str_objective, a_targets, e_player)
{
	a_n_objective_ids = get_id_array(str_objective, a_targets);
	foreach(n_objective_id in a_n_objective_ids)
	{
		if(isdefined(e_player))
		{
			objective_setvisibletoplayer(n_objective_id, e_player);
			continue;
		}
		objective_setvisibletoall(n_objective_id);
	}
}

/*
	Name: hide
	Namespace: objectives
	Checksum: 0x145DB200
	Offset: 0x13B0
	Size: 0xE0
	Parameters: 3
	Flags: Linked
*/
function hide(str_objective, a_targets, e_player)
{
	a_n_objective_ids = get_id_array(str_objective, a_targets);
	foreach(n_objective_id in a_n_objective_ids)
	{
		if(isdefined(e_player))
		{
			objective_setinvisibletoplayer(n_objective_id, e_player);
			continue;
		}
		objective_setinvisibletoall(n_objective_id);
	}
}

/*
	Name: function_9dfb43fc
	Namespace: objectives
	Checksum: 0xEC85C3D
	Offset: 0x1498
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_9dfb43fc()
{
	globallogic_ui::function_9ed5232e("hudItems.hideWaypoints", 1);
}

/*
	Name: function_4279fd02
	Namespace: objectives
	Checksum: 0x6221105D
	Offset: 0x14C8
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function function_4279fd02()
{
	globallogic_ui::function_9ed5232e("hudItems.hideWaypoints", 0);
}

/*
	Name: set_progress
	Namespace: objectives
	Checksum: 0x5F61F13E
	Offset: 0x14F0
	Size: 0xD8
	Parameters: 3
	Flags: None
*/
function set_progress(str_objective, a_targets, n_progress)
{
	a_n_objective_ids = get_id_array(str_objective, a_targets);
	foreach(n_objective_id in a_n_objective_ids)
	{
		objective_setprogress(n_objective_id, n_progress);
		namespace_96850e69::set_progress(n_objective_id, n_progress);
	}
}

/*
	Name: set_game_mode_flags
	Namespace: objectives
	Checksum: 0x9D89C7D5
	Offset: 0x15D0
	Size: 0xC0
	Parameters: 3
	Flags: None
*/
function set_game_mode_flags(str_objective, a_targets, var_4f8b76db)
{
	a_n_objective_ids = get_id_array(str_objective, a_targets);
	foreach(n_objective_id in a_n_objective_ids)
	{
		objective_setgamemodeflags(n_objective_id, var_4f8b76db);
	}
}

/*
	Name: set_counter
	Namespace: objectives
	Checksum: 0xE7122EDD
	Offset: 0x1698
	Size: 0x154
	Parameters: 4
	Flags: Linked
*/
function set_counter(str_objective, a_targets, var_177f646b, var_d126f60d)
{
	a_n_objective_ids = get_id_array(str_objective, a_targets);
	foreach(n_objective_id in a_n_objective_ids)
	{
		if(isdefined(var_177f646b))
		{
			objective_setuimodelvalue(n_objective_id, "obj_x", var_177f646b);
			namespace_96850e69::function_97d05398(n_objective_id, var_177f646b);
		}
		if(isdefined(var_d126f60d))
		{
			objective_setuimodelvalue(n_objective_id, "obj_y", var_d126f60d);
			namespace_96850e69::function_302128de(n_objective_id, var_d126f60d);
		}
	}
	if(isdefined(mission.var_c68f10d0[str_objective]))
	{
		mission.var_ac8e2ff9[str_objective] = var_177f646b;
	}
}

/*
	Name: function_45951a55
	Namespace: objectives
	Checksum: 0xB33F278F
	Offset: 0x17F8
	Size: 0xB4
	Parameters: 1
	Flags: Linked
*/
function function_45951a55(str_objective)
{
	if(isdefined(mission.var_c68f10d0[str_objective]) && isdefined(mission.var_ac8e2ff9[str_objective]))
	{
		mission.var_ac8e2ff9[str_objective]++;
		objective_id = mission.var_c68f10d0[str_objective];
		objective_setuimodelvalue(objective_id, "obj_x", mission.var_ac8e2ff9[str_objective]);
		namespace_96850e69::function_97d05398(objective_id, mission.var_ac8e2ff9[str_objective]);
	}
}

/*
	Name: function_3595a59d
	Namespace: objectives
	Checksum: 0xA645DCC7
	Offset: 0x18B8
	Size: 0xB4
	Parameters: 1
	Flags: None
*/
function function_3595a59d(str_objective)
{
	if(isdefined(mission.var_c68f10d0[str_objective]) && isdefined(mission.var_ac8e2ff9[str_objective]))
	{
		mission.var_ac8e2ff9[str_objective]--;
		objective_id = mission.var_c68f10d0[str_objective];
		objective_setuimodelvalue(objective_id, "obj_x", mission.var_ac8e2ff9[str_objective]);
		namespace_96850e69::function_97d05398(objective_id, mission.var_ac8e2ff9[str_objective]);
	}
}

/*
	Name: set_value
	Namespace: objectives
	Checksum: 0xFDE51020
	Offset: 0x1978
	Size: 0xE0
	Parameters: 4
	Flags: None
*/
function set_value(str_objective, a_targets, var_9922f839, n_value)
{
	a_n_objective_ids = get_id_array(str_objective, a_targets);
	foreach(n_objective_id in a_n_objective_ids)
	{
		objective_setuimodelvalue(n_objective_id, var_9922f839, n_value);
		namespace_96850e69::function_302128de(n_objective_id, n_value);
	}
}

/*
	Name: function_6a43edf3
	Namespace: objectives
	Checksum: 0xAF178AF0
	Offset: 0x1A60
	Size: 0xB8
	Parameters: 2
	Flags: None
*/
function function_6a43edf3(str_objective, a_targets)
{
	a_n_objective_ids = get_id_array(str_objective, a_targets);
	foreach(n_objective_id in a_n_objective_ids)
	{
		namespace_96850e69::function_6a43edf3(n_objective_id);
	}
}

/*
	Name: function_572778b9
	Namespace: objectives
	Checksum: 0x1DC37C68
	Offset: 0x1B20
	Size: 0x4C
	Parameters: 1
	Flags: None
*/
function function_572778b9(str_objective)
{
	obj_id = function_285e460(str_objective);
	if(isdefined(obj_id))
	{
		namespace_96850e69::function_572778b9(obj_id);
	}
}

/*
	Name: set_parent
	Namespace: objectives
	Checksum: 0xB6503B77
	Offset: 0x1B78
	Size: 0x108
	Parameters: 5
	Flags: None
*/
function set_parent(str_objective, a_target, var_f4089be9, var_52710aa4, var_834e72f6)
{
	if(!isdefined(var_834e72f6))
	{
		var_834e72f6 = 1;
	}
	parent_id = function_285e460(var_f4089be9, var_52710aa4);
	if(isdefined(parent_id))
	{
		a_n_objective_ids = get_id_array(str_objective, a_target);
		foreach(n_objective_id in a_n_objective_ids)
		{
			namespace_96850e69::set_parent(n_objective_id, parent_id, var_834e72f6);
		}
	}
}

/*
	Name: function_5d6a7294
	Namespace: objectives
	Checksum: 0x598412FB
	Offset: 0x1C88
	Size: 0xC0
	Parameters: 2
	Flags: None
*/
function function_5d6a7294(str_objective, a_targets)
{
	a_n_objective_ids = get_id_array(str_objective, a_targets);
	foreach(n_objective_id in a_n_objective_ids)
	{
		namespace_96850e69::set_parent(n_objective_id, -1);
	}
}

/*
	Name: set_state
	Namespace: objectives
	Checksum: 0xDC31A866
	Offset: 0x1D50
	Size: 0xC0
	Parameters: 3
	Flags: None
*/
function set_state(str_objective, a_targets, str_state)
{
	a_n_objective_ids = get_id_array(str_objective, a_targets);
	foreach(n_objective_id in a_n_objective_ids)
	{
		objective_setstate(n_objective_id, str_state);
	}
}

/*
	Name: function_67f87f80
	Namespace: objectives
	Checksum: 0xA387EFF5
	Offset: 0x1E18
	Size: 0x104
	Parameters: 3
	Flags: Linked
*/
function function_67f87f80(str_objective, a_targets, text)
{
	if(isdefined(a_targets))
	{
		if(!isdefined(a_targets))
		{
			a_targets = [];
		}
		else if(!isarray(a_targets))
		{
			a_targets = array(a_targets);
		}
		foreach(target in a_targets)
		{
			thread namespace_96850e69::function_49dec5b(str_objective, target, text);
		}
	}
	else
	{
		thread namespace_96850e69::function_49dec5b(str_objective, undefined, text);
	}
}

/*
	Name: function_fb65245c
	Namespace: objectives
	Checksum: 0x1D4D6A0D
	Offset: 0x1F28
	Size: 0x104
	Parameters: 3
	Flags: None
*/
function function_fb65245c(str_objective, a_targets, icon)
{
	if(isdefined(a_targets))
	{
		if(!isdefined(a_targets))
		{
			a_targets = [];
		}
		else if(!isarray(a_targets))
		{
			a_targets = array(a_targets);
		}
		foreach(target in a_targets)
		{
			thread namespace_96850e69::function_fdeb5e85(str_objective, target, icon);
		}
	}
	else
	{
		thread namespace_96850e69::function_fdeb5e85(str_objective, undefined, icon);
	}
}

/*
	Name: run_objective_func
	Namespace: objectives
	Checksum: 0x714B6307
	Offset: 0x2038
	Size: 0x108
	Parameters: 4
	Flags: Variadic
*/
function run_objective_func(str_objective, a_targets, func_objective, ...)
{
	a_n_objective_ids = get_id_array(str_objective, a_targets);
	foreach(n_objective_id in a_n_objective_ids)
	{
		a_args = arraycombine(array(n_objective_id), vararg, 1, 0);
		util::single_func_argarray(undefined, func_objective, a_args);
	}
}

/*
	Name: function_285e460
	Namespace: objectives
	Checksum: 0x7724C063
	Offset: 0x2148
	Size: 0xA4
	Parameters: 3
	Flags: Linked
*/
function function_285e460(str_objective, target, var_be4d91fa)
{
	if(!isdefined(var_be4d91fa))
	{
		var_be4d91fa = 0;
	}
	if(isdefined(target))
	{
		if(target function_31679256(str_objective))
		{
			return target.a_n_objective_ids[str_objective];
		}
	}
	var_be4d91fa = var_be4d91fa || !isdefined(target);
	if(var_be4d91fa && isdefined(mission.var_c68f10d0[str_objective]))
	{
		return mission.var_c68f10d0[str_objective];
	}
	return undefined;
}

/*
	Name: get_id_array
	Namespace: objectives
	Checksum: 0x5487368
	Offset: 0x21F8
	Size: 0x1EC
	Parameters: 2
	Flags: Linked
*/
function get_id_array(str_objective, a_targets)
{
	a_n_objective_ids = [];
	if(isdefined(a_targets))
	{
		if(!isdefined(a_targets))
		{
			a_targets = [];
		}
		else if(!isarray(a_targets))
		{
			a_targets = array(a_targets);
		}
		foreach(target in a_targets)
		{
			if(isdefined(target) && !function_3132f113(target) && target function_31679256(str_objective))
			{
				if(!isdefined(a_n_objective_ids))
				{
					a_n_objective_ids = [];
				}
				else if(!isarray(a_n_objective_ids))
				{
					a_n_objective_ids = array(a_n_objective_ids);
				}
				a_n_objective_ids[a_n_objective_ids.size] = target.a_n_objective_ids[str_objective];
			}
		}
	}
	else if(isdefined(mission.var_c68f10d0[str_objective]))
	{
		if(!isdefined(a_n_objective_ids))
		{
			a_n_objective_ids = [];
		}
		else if(!isarray(a_n_objective_ids))
		{
			a_n_objective_ids = array(a_n_objective_ids);
		}
		a_n_objective_ids[a_n_objective_ids.size] = mission.var_c68f10d0[str_objective];
	}
	return a_n_objective_ids;
}

/*
	Name: function_31679256
	Namespace: objectives
	Checksum: 0xBF59E649
	Offset: 0x23F0
	Size: 0x28
	Parameters: 1
	Flags: Linked, Private
*/
function private function_31679256(str_objective)
{
	return isdefined(self.a_n_objective_ids) && isdefined(self.a_n_objective_ids[str_objective]);
}

/*
	Name: function_5f2c6084
	Namespace: objectives
	Checksum: 0x2859B13B
	Offset: 0x2420
	Size: 0xD4
	Parameters: 3
	Flags: Linked, Private
*/
function private function_5f2c6084(var_75de6891, str_objective, var_4003470b)
{
	target = undefined;
	if(self !== level)
	{
		target = self;
	}
	if(var_75de6891)
	{
		hide(str_objective, target);
	}
	else if(isdefined(str_objective))
	{
		show(str_objective, target);
	}
	if(var_4003470b)
	{
		if(var_75de6891)
		{
			namespace_96850e69::function_b6d41b41(#"hash_55ff57573b3951ef", 1);
		}
		else
		{
			namespace_96850e69::function_be5b472b();
		}
	}
}

/*
	Name: function_b6b76073
	Namespace: objectives
	Checksum: 0xAF51BC77
	Offset: 0x2500
	Size: 0x1CC
	Parameters: 3
	Flags: Linked, Private
*/
function private function_b6b76073(str_objective, ent, var_4003470b)
{
	level notify("objective_search_area_" + str_objective);
	if(var_4003470b)
	{
		level endoncallback(&function_d5874fcc, "objective_search_area_" + str_objective);
	}
	target = undefined;
	if(self !== level)
	{
		target = self;
		if(isentity(target))
		{
			target endon(#"death");
		}
	}
	objid = function_285e460(str_objective, target);
	player = getplayers()[0];
	player endon(#"death");
	in_area = 0;
	while(isdefined(objid) && objective_state(objid) == "active")
	{
		if(!in_area && player istouching(ent) || (in_area && !player istouching(ent)))
		{
			in_area = !in_area;
			function_5f2c6084(in_area, str_objective, var_4003470b);
		}
		waitframe(1);
	}
	if(var_4003470b)
	{
		function_d5874fcc();
	}
}

/*
	Name: function_634c16ef
	Namespace: objectives
	Checksum: 0xB9A6022
	Offset: 0x26D8
	Size: 0x22C
	Parameters: 4
	Flags: Linked, Private
*/
function private function_634c16ef(str_objective, ent, radius, var_4003470b)
{
	level notify("objective_search_area_" + str_objective);
	if(var_4003470b)
	{
		level endoncallback(&function_d5874fcc, "objective_search_area_" + str_objective);
	}
	target = undefined;
	if(self !== level)
	{
		target = self;
		if(isentity(target))
		{
			target endon(#"death");
		}
	}
	objid = function_285e460(str_objective, target);
	player = getplayers()[0];
	player endon(#"death");
	if(isentity(ent))
	{
		ent endon(#"death");
	}
	radius_squared = radius * radius;
	in_area = 0;
	while(isdefined(objid) && objective_state(objid) == "active")
	{
		if(!in_area && distancesquared(player.origin, ent.origin) <= radius_squared || (in_area && distancesquared(player.origin, ent.origin) > radius_squared))
		{
			in_area = !in_area;
			function_5f2c6084(in_area, str_objective, var_4003470b);
		}
		waitframe(1);
	}
	if(var_4003470b)
	{
		function_d5874fcc();
	}
}

/*
	Name: function_37cf9b17
	Namespace: objectives
	Checksum: 0xE3B18E45
	Offset: 0x2910
	Size: 0x1FC
	Parameters: 4
	Flags: Linked, Private
*/
function private function_37cf9b17(str_objective, pos, radius, var_4003470b)
{
	level notify("objective_search_area_" + str_objective);
	if(var_4003470b)
	{
		level endoncallback(&function_d5874fcc, "objective_search_area_" + str_objective);
	}
	target = undefined;
	if(self !== level)
	{
		target = self;
		if(isentity(target))
		{
			target endon(#"death");
		}
	}
	objid = function_285e460(str_objective, target);
	player = getplayers()[0];
	player endon(#"death");
	radius_squared = radius * radius;
	in_area = 0;
	while(isdefined(objid) && objective_state(objid) == "active")
	{
		if(!in_area && distancesquared(player.origin, pos) <= radius_squared || (in_area && distancesquared(player.origin, pos) > radius_squared))
		{
			in_area = !in_area;
			function_5f2c6084(in_area, str_objective, var_4003470b);
		}
		waitframe(1);
	}
	if(var_4003470b)
	{
		function_d5874fcc();
	}
}

/*
	Name: function_d5874fcc
	Namespace: objectives
	Checksum: 0xF79FAE8E
	Offset: 0x2B18
	Size: 0x1C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_d5874fcc(var_201c5b1f)
{
	namespace_96850e69::function_be5b472b();
}

