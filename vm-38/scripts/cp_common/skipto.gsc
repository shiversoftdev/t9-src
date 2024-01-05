#using script_1292451e284848cc;
#using scripts\cp_common\collectibles.gsc;
#using script_267e1d16ae28392b;
#using scripts\cp_common\util.gsc;
#using script_4ae261b2785dda9f;
#using scripts\cp_common\load.gsc;
#using script_32399001bdb550da;
#using scripts\cp_common\gametypes\globallogic_ui.gsc;
#using scripts\cp_common\gametypes\globallogic_player.gsc;
#using scripts\cp_common\gametypes\globallogic.gsc;
#using scripts\cp_common\challenges.gsc;
#using scripts\cp_common\bb.gsc;
#using script_7b4396f5e8e35b28;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\traps_deployable.gsc;
#using scripts\core_common\teleport_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using script_44b0b8420eabacad;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\rank_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\player\player_shared.gsc;
#using scripts\core_common\music_shared.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\load_shared.gsc;
#using scripts\core_common\hud_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using script_272c4fcff156116d;

#namespace skipto;

/*
	Name: function_735ef6d8
	Namespace: skipto
	Checksum: 0x65BDB286
	Offset: 0x7F8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_735ef6d8()
{
	level notify(1785039909);
}

/*
	Name: __init__system__
	Namespace: skipto
	Checksum: 0x179F378A
	Offset: 0x818
	Size: 0x54
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"skipto", &function_70a657d8, &function_8ac3bea9, &on_finalize_initialization, undefined);
}

/*
	Name: function_70a657d8
	Namespace: skipto
	Checksum: 0xC5D6AAFC
	Offset: 0x878
	Size: 0x2E4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level flag::init("start_skiptos");
	level flag::init("level_has_skiptos");
	level flag::init("level_has_skipto_branches");
	level flag::init("skipto_spawns_ready");
	level flag::init("final_level");
	level flag::init("_exit");
	clientfield::register("toplayer", "catch_up_transition", 1, 1, "counter");
	clientfield::register("world", "set_last_map_dvar", 1, 1, "counter");
	level.map_name = getrootmapname();
	level.mission_name = getmissionname();
	level.var_2b1b0a8b = &objective_completed;
	level.var_f1eb9fe4 = &set_current_skipto;
	fields = getmapfields();
	world.var_82105eb4 = undefined;
	level.default_skipto = "_default";
	add_internal("_default");
	add_internal("no_game", &nogame);
	load_mission_table(#"hash_42982af1920b8bfd", level.script);
	level.a_s_spawn_points = arraycombine(struct::get_array("cp_coop_spawn", "targetname"), struct::get_array("cp_coop_respawn", "targetname"), 0, 0);
	spawning::function_754c78a6(&function_f3d2a1c3);
	callback::on_spawned(&on_player_spawn);
	callback::on_connect(&on_player_connect);
}

/*
	Name: function_8ac3bea9
	Namespace: skipto
	Checksum: 0xC59F5D06
	Offset: 0xB68
	Size: 0x34
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ac3bea9()
{
	level thread entity_mover_main();
	level thread handle();
}

/*
	Name: function_228558fd
	Namespace: skipto
	Checksum: 0xF156EC7A
	Offset: 0xBA8
	Size: 0x150
	Parameters: 2
	Flags: Linked
*/
function function_228558fd(var_f2d4fd10, var_7a646627)
{
	if(!isdefined(var_f2d4fd10))
	{
		var_f2d4fd10 = 0;
	}
	if(!isdefined(var_7a646627))
	{
		var_7a646627 = 0;
	}
	var_6bf31125 = [];
	for(i = 0; i < 99; i++)
	{
		mapname = getmapatindex(i);
		if(!isdefined(mapname))
		{
			break;
		}
		var_65792f8b = function_2717b55f(mapname);
		if(isdefined(var_65792f8b))
		{
			if(is_true(var_65792f8b.var_32a51de2))
			{
				if(var_f2d4fd10)
				{
					array::add(var_6bf31125, mapname);
				}
				continue;
			}
			if(is_true(var_65792f8b.var_beb20e53))
			{
				if(var_7a646627)
				{
					array::add(var_6bf31125, mapname);
				}
				continue;
			}
			array::add(var_6bf31125, mapname);
		}
	}
	return var_6bf31125;
}

/*
	Name: function_fb89516e
	Namespace: skipto
	Checksum: 0xC38259E0
	Offset: 0xD00
	Size: 0x22
	Parameters: 1
	Flags: None
*/
function function_fb89516e(str_skipto)
{
	return level flag::get(str_skipto);
}

/*
	Name: function_fbae1b12
	Namespace: skipto
	Checksum: 0xF38394AD
	Offset: 0xD30
	Size: 0x2A
	Parameters: 1
	Flags: None
*/
function function_fbae1b12(str_skipto)
{
	return level flag::get(str_skipto + "_completed");
}

/*
	Name: function_9a209ed9
	Namespace: skipto
	Checksum: 0xB242DF8D
	Offset: 0xD68
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function function_9a209ed9(str_skipto)
{
	level flag::wait_till(str_skipto + "_completed");
}

/*
	Name: function_c0f982ff
	Namespace: skipto
	Checksum: 0xA9871B6B
	Offset: 0xDA0
	Size: 0x1A
	Parameters: 0
	Flags: None
*/
function function_c0f982ff()
{
	return arraycopy(level.skipto_current_objective);
}

/*
	Name: add
	Namespace: skipto
	Checksum: 0x7BCA370
	Offset: 0xDC8
	Size: 0x35C
	Parameters: 7
	Flags: Linked
*/
function add(skipto, var_e784b061, var_dde96e3b, str_name, cleanup_func, var_e5301d70, var_4444a90d)
{
	if(!isdefined(var_4444a90d))
	{
		var_4444a90d = 0;
	}
	if(is_dev(skipto))
	{
		/#
			errormsg("");
		#/
		return;
	}
	if(isdefined(level.last_skipto))
	{
		if(isdefined(level.skipto_settings[level.last_skipto]))
		{
			if(!isdefined(level.skipto_settings[level.last_skipto].end_before))
			{
				level.skipto_settings[level.last_skipto].end_before = [];
			}
			else if(!isarray(level.skipto_settings[level.last_skipto].end_before))
			{
				level.skipto_settings[level.last_skipto].end_before = array(level.skipto_settings[level.last_skipto].end_before);
			}
			level.skipto_settings[level.last_skipto].end_before[level.skipto_settings[level.last_skipto].end_before.size] = skipto;
		}
		launch_after = level.last_skipto;
	}
	else
	{
		if(isdefined(level.skipto_settings[level.default_skipto]))
		{
			if(!isdefined(level.skipto_settings[level.default_skipto].end_before))
			{
				level.skipto_settings[level.default_skipto].end_before = [];
			}
			else if(!isarray(level.skipto_settings[level.default_skipto].end_before))
			{
				level.skipto_settings[level.default_skipto].end_before = array(level.skipto_settings[level.default_skipto].end_before);
			}
			level.skipto_settings[level.default_skipto].end_before[level.skipto_settings[level.default_skipto].end_before.size] = skipto;
		}
		launch_after = level.default_skipto;
	}
	level.last_skipto = skipto;
	/#
		assert(isdefined(var_e784b061), "");
	#/
	struct = add_internal(skipto, var_e784b061, var_dde96e3b, str_name, cleanup_func, launch_after, undefined, var_4444a90d, var_e5301d70);
	struct.public = 1;
	level flag::set("level_has_skiptos");
}

/*
	Name: function_eb91535d
	Namespace: skipto
	Checksum: 0xAB82FED3
	Offset: 0x1130
	Size: 0x5E
	Parameters: 6
	Flags: Linked
*/
function function_eb91535d(skipto, var_e784b061, var_dde96e3b, str_name, cleanup_func, var_e5301d70)
{
	struct = add(skipto, var_e784b061, var_dde96e3b, str_name, cleanup_func, var_e5301d70, 1);
}

/*
	Name: add_branch
	Namespace: skipto
	Checksum: 0x6F6C6E27
	Offset: 0x1198
	Size: 0x328
	Parameters: 7
	Flags: Linked
*/
function add_branch(skipto, var_e784b061, var_dde96e3b, str_name, cleanup_func, launch_after, end_before)
{
	if(is_dev(skipto))
	{
		/#
			errormsg("");
		#/
		return;
	}
	if(!isdefined(launch_after))
	{
		if(isdefined(level.skipto_settings[level.default_skipto]))
		{
			if(!isdefined(level.skipto_settings[level.default_skipto].end_before))
			{
				level.skipto_settings[level.default_skipto].end_before = [];
			}
			else if(!isarray(level.skipto_settings[level.default_skipto].end_before))
			{
				level.skipto_settings[level.default_skipto].end_before = array(level.skipto_settings[level.default_skipto].end_before);
			}
			level.skipto_settings[level.default_skipto].end_before[level.skipto_settings[level.default_skipto].end_before.size] = skipto;
		}
		launch_after = level.default_skipto;
	}
	else if(isdefined(level.skipto_settings[launch_after]))
	{
		if(!isdefined(level.skipto_settings[launch_after].end_before))
		{
			level.skipto_settings[launch_after].end_before = [];
		}
		else if(!isarray(level.skipto_settings[launch_after].end_before))
		{
			level.skipto_settings[launch_after].end_before = array(level.skipto_settings[launch_after].end_before);
		}
		level.skipto_settings[launch_after].end_before[level.skipto_settings[launch_after].end_before.size] = skipto;
	}
	level.last_skipto = skipto;
	if(!isdefined(var_e784b061))
	{
		/#
			assert(isdefined(var_e784b061), "");
		#/
	}
	struct = add_internal(skipto, var_e784b061, var_dde96e3b, str_name, cleanup_func, launch_after, end_before);
	struct.public = 1;
	level flag::set("level_has_skiptos");
	level flag::set("level_has_skipto_branches");
	return struct;
}

/*
	Name: function_faeed11
	Namespace: skipto
	Checksum: 0xA0A156FB
	Offset: 0x14C8
	Size: 0x7A
	Parameters: 7
	Flags: None
*/
function function_faeed11(skipto, var_e784b061, var_dde96e3b, str_name, cleanup_func, launch_after, end_before)
{
	struct = add_branch(skipto, var_e784b061, var_dde96e3b, str_name, cleanup_func, launch_after, end_before);
	if(isdefined(struct))
	{
		struct.looping = 1;
	}
}

/*
	Name: add_dev
	Namespace: skipto
	Checksum: 0x79D95E05
	Offset: 0x1550
	Size: 0xBC
	Parameters: 8
	Flags: None
*/
function add_dev(skipto, var_e784b061, var_dde96e3b, str_name, cleanup_func, launch_after, end_before, var_e5301d70)
{
	if(is_dev(skipto))
	{
		struct = add_internal(skipto, var_e784b061, var_dde96e3b, str_name, cleanup_func, launch_after, end_before, 0, var_e5301d70);
		struct.dev_skipto = 1;
		return;
	}
	/#
		errormsg("");
	#/
}

/*
	Name: objective_leave_incomplete
	Namespace: skipto
	Checksum: 0x40344C0A
	Offset: 0x1618
	Size: 0xF8
	Parameters: 1
	Flags: None
*/
function objective_leave_incomplete(skipto)
{
	if(!isdefined(level.skipto_settings[skipto]))
	{
		/#
			assertmsg(("" + skipto) + "");
		#/
		return;
	}
	level.skipto_settings[skipto].objective_mark_complete = 0;
	foreach(player in level.players)
	{
		bb::logobjectivestatuschange(skipto, player, "leave_incomplete");
	}
}

/*
	Name: add_billboard
	Namespace: skipto
	Checksum: 0xCA311A6C
	Offset: 0x1718
	Size: 0x70
	Parameters: 5
	Flags: None
*/
function add_billboard(skipto, event_name, event_type, event_size, event_state)
{
	if(!isdefined(level.billboards))
	{
		level.billboards = [];
	}
	level.billboards[skipto] = array(event_name, event_type, event_size, event_state);
}

/*
	Name: add_internal
	Namespace: skipto
	Checksum: 0x2A8471B6
	Offset: 0x1790
	Size: 0x108
	Parameters: 9
	Flags: Linked
*/
function add_internal(msg, var_e784b061, var_dde96e3b, str_name, cleanup_func, launch_after, end_before, var_4444a90d, var_e5301d70)
{
	/#
		assert(!isdefined(level._loadstarted), "");
	#/
	msg = tolower(msg);
	struct = add_construct(msg, var_e784b061, var_dde96e3b, str_name, cleanup_func, launch_after, end_before, var_4444a90d, var_e5301d70);
	level.skipto_settings[msg] = struct;
	level flag::init(msg);
	level flag::init(msg + "_completed");
	return struct;
}

/*
	Name: change
	Namespace: skipto
	Checksum: 0x348E8EC6
	Offset: 0x18A0
	Size: 0x10A
	Parameters: 7
	Flags: None
*/
function change(msg, var_e784b061, var_dde96e3b, str_name, cleanup_func, launch_after, end_before)
{
	struct = level.skipto_settings[msg];
	if(isdefined(var_e784b061))
	{
		struct.var_2c183249 = var_e784b061;
	}
	if(isdefined(var_dde96e3b))
	{
		struct.var_4c644f8d = var_dde96e3b;
	}
	if(isdefined(str_name))
	{
		struct.str_name = str_name;
	}
	if(isdefined(cleanup_func))
	{
		struct.cleanup_func = cleanup_func;
	}
	if(isdefined(launch_after))
	{
		struct.completion_conditions = struct parse_launch_after(launch_after);
	}
	if(isdefined(end_before))
	{
		struct.end_before = strtok(end_before, ",");
		struct.next = struct.end_before;
	}
}

/*
	Name: set_skipto_cleanup_func
	Namespace: skipto
	Checksum: 0x64E4CD41
	Offset: 0x19B8
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function set_skipto_cleanup_func(func)
{
	level.func_skipto_cleanup = func;
}

/*
	Name: add_construct
	Namespace: skipto
	Checksum: 0x9E90C3B8
	Offset: 0x19E0
	Size: 0x192
	Parameters: 9
	Flags: Linked
*/
function add_construct(msg, var_e784b061, var_dde96e3b, str_name, cleanup_func, launch_after, end_before, var_4444a90d, var_e5301d70)
{
	if(!isdefined(var_4444a90d))
	{
		var_4444a90d = 0;
	}
	struct = spawnstruct();
	struct.name = msg;
	struct.code_index = registerskipto(msg);
	struct.var_2c183249 = var_e784b061;
	struct.var_4c644f8d = var_dde96e3b;
	struct.str_name = str_name;
	struct.cleanup_func = cleanup_func;
	struct.next = [];
	struct.prev = [];
	struct.completion_conditions = "";
	struct.launch_after = [];
	struct.var_4444a90d = var_4444a90d;
	struct.var_e5301d70 = var_e5301d70;
	if(isdefined(launch_after))
	{
		struct.completion_conditions = struct parse_launch_after(launch_after);
	}
	struct.end_before = [];
	if(isdefined(end_before))
	{
		struct.end_before = strtok(end_before, ",");
		struct.next = struct.end_before;
	}
	struct.ent_movers = [];
	return struct;
}

/*
	Name: level_has_skipto_points
	Namespace: skipto
	Checksum: 0x65088A6D
	Offset: 0x1B80
	Size: 0x22
	Parameters: 0
	Flags: None
*/
function level_has_skipto_points()
{
	return level flag::get("level_has_skiptos");
}

/*
	Name: parse_error
	Namespace: skipto
	Checksum: 0x90326B9A
	Offset: 0x1BB0
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function parse_error(msg)
{
	/#
		/#
			assertmsg(msg);
		#/
	#/
}

/*
	Name: split_top_level_and_or
	Namespace: skipto
	Checksum: 0xE22557B3
	Offset: 0x1BE8
	Size: 0x2AC
	Parameters: 1
	Flags: Linked
*/
function split_top_level_and_or(instring)
{
	op = "";
	ret = [];
	outindex = 0;
	ret[outindex] = "";
	paren = 0;
	for(i = 0; i < instring.size; i++)
	{
		c = getsubstr(instring, i, i + 1);
		if(c == "(")
		{
			paren++;
			ret[outindex] = ret[outindex] + c;
			continue;
		}
		if(c == ")")
		{
			paren--;
			ret[outindex] = ret[outindex] + c;
			continue;
		}
		if(paren == 0 && c == ("&"))
		{
			if(op == ("|"))
			{
				/#
					parse_error("" + instring);
				#/
			}
			op = "&";
			outindex++;
			ret[outindex] = "";
			continue;
		}
		if(paren == 0 && c == ("|"))
		{
			if(op == ("&"))
			{
				/#
					parse_error("" + instring);
				#/
			}
			op = "|";
			outindex++;
			ret[outindex] = "";
			continue;
		}
		ret[outindex] = ret[outindex] + c;
	}
	if(paren != 0)
	{
		/#
			parse_error("" + instring);
		#/
	}
	for(j = 0; j <= outindex; j++)
	{
		ret[j] = remove_parens(ret[j]);
	}
	if(outindex == 0)
	{
		return ret[outindex];
	}
	ret[#"op"] = op;
	return ret;
}

/*
	Name: remove_parens
	Namespace: skipto
	Checksum: 0x4CB4A8B8
	Offset: 0x1EA0
	Size: 0x160
	Parameters: 1
	Flags: Linked
*/
function remove_parens(instring)
{
	c = getsubstr(instring, 0, 1);
	if(c == "(")
	{
		c2 = getsubstr(instring, instring.size - 1, instring.size);
		if(c2 != ")")
		{
			/#
				parse_error("" + instring);
			#/
		}
		s = getsubstr(instring, 1, instring.size - 1);
		return split_top_level_and_or(s);
	}
	if(!isdefined(self.launch_after))
	{
		self.launch_after = [];
	}
	else if(!isarray(self.launch_after))
	{
		self.launch_after = array(self.launch_after);
	}
	self.launch_after[self.launch_after.size] = instring;
	return instring;
}

/*
	Name: parse_launch_after
	Namespace: skipto
	Checksum: 0x82128D2E
	Offset: 0x2008
	Size: 0x52
	Parameters: 1
	Flags: Linked
*/
function parse_launch_after(launch_after)
{
	retval = split_top_level_and_or(launch_after);
	if(isarray(retval))
	{
		return retval;
	}
	return "";
}

/*
	Name: check_skipto_condition
	Namespace: skipto
	Checksum: 0xF291D2F4
	Offset: 0x2068
	Size: 0x13E
	Parameters: 2
	Flags: Linked
*/
function check_skipto_condition(conditions, adding)
{
	if(!isarray(conditions))
	{
		if(isdefined(level.skipto_settings[conditions]) && (is_true(level.skipto_settings[conditions].objective_running) || isinarray(adding, conditions)))
		{
			return false;
		}
		return true;
	}
	if(conditions[#"op"] == ("|"))
	{
		for(i = 0; i < conditions.size - 1; i++)
		{
			if(check_skipto_condition(conditions[i], adding))
			{
				return true;
			}
		}
		return false;
	}
	for(i = 0; i < conditions.size - 1; i++)
	{
		if(!check_skipto_condition(conditions[i], adding))
		{
			return false;
		}
	}
	return true;
}

/*
	Name: check_skipto_conditions
	Namespace: skipto
	Checksum: 0x5A547C2C
	Offset: 0x21B0
	Size: 0x102
	Parameters: 1
	Flags: Linked
*/
function check_skipto_conditions(objectives)
{
	result = [];
	foreach(name in objectives)
	{
		if(check_skipto_condition(level.skipto_settings[name].completion_conditions, result))
		{
			if(!isdefined(result))
			{
				result = [];
			}
			else if(!isarray(result))
			{
				result = array(result);
			}
			result[result.size] = name;
		}
	}
	return result;
}

/*
	Name: build_objective_tree
	Namespace: skipto
	Checksum: 0x985EB937
	Offset: 0x22C0
	Size: 0x6D4
	Parameters: 0
	Flags: Linked
*/
function build_objective_tree()
{
	foreach(struct in level.skipto_settings)
	{
		if(is_true(struct.public))
		{
			if(struct.launch_after.size)
			{
				foreach(launch_after in struct.launch_after)
				{
					if(isdefined(level.skipto_settings[launch_after]))
					{
						if(!isinarray(level.skipto_settings[launch_after].next, struct.name))
						{
							if(!isdefined(level.skipto_settings[launch_after].next))
							{
								level.skipto_settings[launch_after].next = [];
							}
							else if(!isarray(level.skipto_settings[launch_after].next))
							{
								level.skipto_settings[launch_after].next = array(level.skipto_settings[launch_after].next);
							}
							level.skipto_settings[launch_after].next[level.skipto_settings[launch_after].next.size] = struct.name;
						}
						continue;
					}
					if(!isdefined(level.skipto_settings[#"_default"].next))
					{
						level.skipto_settings[#"_default"].next = [];
					}
					else if(!isarray(level.skipto_settings[#"_default"].next))
					{
						level.skipto_settings[#"_default"].next = array(level.skipto_settings[#"_default"].next);
					}
					level.skipto_settings[#"_default"].next[level.skipto_settings[#"_default"].next.size] = struct.name;
				}
			}
			else
			{
				if(!isdefined(level.skipto_settings[#"_default"].next))
				{
					level.skipto_settings[#"_default"].next = [];
				}
				else if(!isarray(level.skipto_settings[#"_default"].next))
				{
					level.skipto_settings[#"_default"].next = array(level.skipto_settings[#"_default"].next);
				}
				level.skipto_settings[#"_default"].next[level.skipto_settings[#"_default"].next.size] = struct.name;
			}
			foreach(end_before in struct.end_before)
			{
				if(isdefined(level.skipto_settings[end_before]))
				{
					if(!isdefined(level.skipto_settings[end_before].prev))
					{
						level.skipto_settings[end_before].prev = [];
					}
					else if(!isarray(level.skipto_settings[end_before].prev))
					{
						level.skipto_settings[end_before].prev = array(level.skipto_settings[end_before].prev);
					}
					level.skipto_settings[end_before].prev[level.skipto_settings[end_before].prev.size] = struct.name;
				}
			}
		}
	}
	foreach(struct in level.skipto_settings)
	{
		if(is_true(struct.public))
		{
			if(struct.next.size < 1)
			{
				if(!isdefined(struct.next))
				{
					struct.next = [];
				}
				else if(!isarray(struct.next))
				{
					struct.next = array(struct.next);
				}
				struct.next[struct.next.size] = "_exit";
			}
		}
	}
}

/*
	Name: get_next_skiptos
	Namespace: skipto
	Checksum: 0xDB2ED0E6
	Offset: 0x29A0
	Size: 0xB2
	Parameters: 1
	Flags: Linked
*/
function get_next_skiptos(skipto_name)
{
	if(scene::function_a4dedc63())
	{
		return function_f3c37963(skipto_name);
	}
	if(getgametypesetting(#"hash_72a2919d2ac65850"))
	{
		return function_694aaea7(skipto_name);
	}
	if(isdefined(level.skipto_settings[skipto_name]))
	{
		return level.skipto_settings[skipto_name].next;
	}
	return level.skipto_settings[#"_default"].next;
}

/*
	Name: function_694aaea7
	Namespace: skipto
	Checksum: 0x9967B131
	Offset: 0x2A60
	Size: 0xE2
	Parameters: 1
	Flags: Linked
*/
function function_694aaea7(skipto_name)
{
	var_c23e8af7 = [];
	var_c23e8af7[0] = skipto_name;
	while(isdefined(level.skipto_settings[var_c23e8af7[0]]))
	{
		if(level.skipto_settings[var_c23e8af7[0]].next.size)
		{
			var_c23e8af7 = level.skipto_settings[var_c23e8af7[0]].next;
			if(var_c23e8af7.size && !is_true(level.skipto_settings[var_c23e8af7[0]].var_a3d14b6b))
			{
				return var_c23e8af7;
			}
		}
		else
		{
			return var_c23e8af7;
		}
	}
	return level.skipto_settings[#"_default"].next;
}

/*
	Name: function_f3c37963
	Namespace: skipto
	Checksum: 0x8946E8DD
	Offset: 0x2B50
	Size: 0xE2
	Parameters: 1
	Flags: Linked
*/
function function_f3c37963(skipto_name)
{
	var_c23e8af7 = [];
	var_c23e8af7[0] = skipto_name;
	while(isdefined(level.skipto_settings[var_c23e8af7[0]]))
	{
		if(level.skipto_settings[var_c23e8af7[0]].next.size)
		{
			var_c23e8af7 = level.skipto_settings[var_c23e8af7[0]].next;
			if(var_c23e8af7.size && is_true(level.skipto_settings[var_c23e8af7[0]].var_a3d14b6b))
			{
				return var_c23e8af7;
			}
		}
		else
		{
			return var_c23e8af7;
		}
	}
	return level.skipto_settings[#"_default"].next;
}

/*
	Name: skiptos_to_string
	Namespace: skipto
	Checksum: 0x12C4E94E
	Offset: 0x2C40
	Size: 0xC8
	Parameters: 1
	Flags: Linked
*/
function skiptos_to_string(skiptos)
{
	skiptostr = "";
	first = 1;
	foreach(skipto in skiptos)
	{
		if(!first)
		{
			skiptostr = skiptostr + ",";
		}
		first = 0;
		skiptostr = skiptostr + skipto;
	}
	return skiptostr;
}

/*
	Name: get_current_skiptos
	Namespace: skipto
	Checksum: 0x494DEB5C
	Offset: 0x2D10
	Size: 0x17A
	Parameters: 1
	Flags: Linked
*/
function get_current_skiptos(var_7e8557ba)
{
	var_4aaf7303 = getdvarstring(#"skipto_jump");
	if(!isdefined(var_4aaf7303) || var_4aaf7303.size == 0)
	{
		var_4aaf7303 = getdvarstring(#"hash_34af017e5b55f0f3");
	}
	if(isdefined(var_4aaf7303) && var_4aaf7303.size)
	{
		if(var_4aaf7303 == "_default")
		{
			var_4aaf7303 = "";
		}
		skiptos = strtok(var_4aaf7303, ",");
		return skiptos;
	}
	if(is_true(var_7e8557ba))
	{
		skiptos = tolower(getdvarstring(#"hash_1d8621150bcf0c0c"));
	}
	else
	{
		skiptos = tolower(getskiptos());
	}
	result = strtok(skiptos, ",");
	return result;
}

/*
	Name: function_5011fee2
	Namespace: skipto
	Checksum: 0x473FA25C
	Offset: 0x2E98
	Size: 0x6E
	Parameters: 1
	Flags: Linked
*/
function function_5011fee2(var_1fdcd030)
{
	if(!isdefined(var_1fdcd030))
	{
		var_1fdcd030 = savegame::get_mission_name();
	}
	var_65792f8b = function_2717b55f(var_1fdcd030);
	if(isdefined(var_65792f8b) && isdefined(var_65792f8b.var_a04dfce6))
	{
		return var_65792f8b.var_a04dfce6;
	}
	return "";
}

/*
	Name: function_547ca7d2
	Namespace: skipto
	Checksum: 0x97B308EB
	Offset: 0x2F10
	Size: 0x158
	Parameters: 2
	Flags: Linked
*/
function function_547ca7d2(safehouse, var_fc9732a9)
{
	if(!isdefined(var_fc9732a9))
	{
		var_fc9732a9 = 1;
	}
	var_65792f8b = function_2717b55f(safehouse);
	/#
		assert(isdefined(var_65792f8b) && isdefined(var_65792f8b.var_beb20e53));
	#/
	if(safehouse == #"cp_ger_hub_post_cuba" || safehouse == #"cp_ger_hub8")
	{
		var_fc9732a9 = 0;
	}
	if(isdefined(var_65792f8b) && is_true(var_65792f8b.var_beb20e53))
	{
		skipto = "";
		if(safehouse == "cp_ger_hub")
		{
			skipto = "post_takedown";
		}
		else if(isdefined(var_65792f8b) && isdefined(var_65792f8b.var_a04dfce6))
		{
			skipto = var_65792f8b.var_a04dfce6;
		}
		if(var_fc9732a9 && skipto != "")
		{
			skipto = skipto + "_skip_briefing";
		}
	}
	return skipto;
}

/*
	Name: function_3a4ee594
	Namespace: skipto
	Checksum: 0x23F5DCAD
	Offset: 0x3070
	Size: 0x3E
	Parameters: 1
	Flags: None
*/
function function_3a4ee594(skipto_name)
{
	if(!isdefined(level.skipto_settings[skipto_name]))
	{
		return -1;
	}
	return level.skipto_settings[skipto_name].code_index;
}

/*
	Name: function_a002f769
	Namespace: skipto
	Checksum: 0x3FC1DCAE
	Offset: 0x30B8
	Size: 0x52
	Parameters: 0
	Flags: Linked
*/
function function_a002f769()
{
	if(!isdefined(level.skipto_point) || !isdefined(level.skipto_settings[level.skipto_point]))
	{
		return -1;
	}
	return level.skipto_settings[level.skipto_point].code_index;
}

/*
	Name: set_current_skipto
	Namespace: skipto
	Checksum: 0x3912E58C
	Offset: 0x3118
	Size: 0x190
	Parameters: 2
	Flags: Linked
*/
function set_current_skipto(skipto, var_3bac111e)
{
	if(!isdefined(skipto))
	{
		skipto = "";
	}
	if(skipto == "")
	{
		var_209694d6 = array("");
	}
	else
	{
		var_209694d6 = strtok(skipto, ",");
	}
	foreach(str_skipto in var_209694d6)
	{
		if(is_true(var_3bac111e) || (str_skipto != "" && level.skipto_settings[str_skipto].var_4444a90d === 1))
		{
			setskiptos(tolower(str_skipto), 1);
			continue;
		}
		setskiptos(tolower(str_skipto), 0);
	}
}

/*
	Name: set_current_skiptos
	Namespace: skipto
	Checksum: 0x8F29D851
	Offset: 0x32B0
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function set_current_skiptos(skiptos)
{
	set_current_skipto(skiptos_to_string(skiptos));
}

/*
	Name: use_default_skipto
	Namespace: skipto
	Checksum: 0xF39F308D
	Offset: 0x32F0
	Size: 0x3C
	Parameters: 0
	Flags: None
*/
function use_default_skipto()
{
	if(!isdefined(level.default_skipto))
	{
		level.default_skipto = "";
	}
	set_current_skipto(level.default_skipto);
}

/*
	Name: validate_skiptos
	Namespace: skipto
	Checksum: 0x64C85432
	Offset: 0x3338
	Size: 0xEA
	Parameters: 1
	Flags: Linked
*/
function validate_skiptos(skiptos)
{
	done = 0;
	while(isdefined(skiptos) && skiptos.size && !done)
	{
		done = 1;
		foreach(skipto in skiptos)
		{
			if(!isdefined(level.skipto_settings[skipto]))
			{
				arrayremovevalue(skiptos, skipto, 0);
				done = 0;
				break;
			}
		}
	}
	return skiptos;
}

/*
	Name: handle
	Namespace: skipto
	Checksum: 0xA77CD25C
	Offset: 0x3430
	Size: 0x4FC
	Parameters: 0
	Flags: Linked
*/
function handle()
{
	build_objective_tree();
	level flag::wait_till("start_skiptos");
	default_skiptos = get_next_skiptos("_default");
	skiptos = get_current_skiptos(1);
	var_4aaf7303 = getdvarstring(#"skipto_jump");
	if(isdefined(var_4aaf7303) && var_4aaf7303.size)
	{
		setdvar(#"skipto_jump", "");
	}
	var_4aaf7303 = getdvarstring(#"hash_34af017e5b55f0f3");
	if(isdefined(var_4aaf7303) && var_4aaf7303.size)
	{
		setdvar(#"hash_34af017e5b55f0f3", "");
	}
	skiptos = validate_skiptos(skiptos);
	/#
		assert(is_true(level.first_frame), "");
	#/
	if(isdefined(level.skipto_point))
	{
		skiptos = [];
		skiptos[0] = level.skipto_point;
	}
	level.skipto_current_objective = skiptos;
	skipto = skiptos[0];
	if(isdefined(skipto) && isdefined(level.skipto_settings[skipto]))
	{
		level.skipto_point = skipto;
	}
	is_default = 0;
	start = level.skipto_current_objective;
	if(start.size < 1)
	{
		is_default = 1;
		start = default_skiptos;
		if(isdefined(level.default_skipto))
		{
			level.skipto_point = level.default_skipto;
		}
	}
	else
	{
		level thread sndlevelstartduck_shutoff();
	}
	level.skipto_points = start;
	skipto = start[0];
	if(isdefined(skipto) && isdefined(level.skipto_settings[skipto]))
	{
		level.skipto_point = skipto;
	}
	if(start.size < 1)
	{
		level thread sndlevelstartduck_shutoff();
		level thread load::function_eb7b7382();
		return;
	}
	if(!is_default)
	{
		entity_mover_use_objectives(default_skiptos);
	}
	level flag::set(#"scene_on_load_wait");
	s_skipto = level.skipto_settings[start[0]];
	if(s_skipto.code_index != 3)
	{
		level.disableprematchperiod = 1;
	}
	set_level_objective(start, 1);
	callback::callback(#"hash_7177603f5415549b");
	savegame::save();
	currentmission = savegame::get_mission_name();
	var_65792f8b = function_2717b55f(currentmission);
	if(isdefined(var_65792f8b) && !is_true(var_65792f8b.var_32a51de2))
	{
		var_f1036742 = collectibles::function_293d81b4(1, currentmission);
		foreach(collectible in var_f1036742)
		{
			collectibles::function_316c48a3(collectible.var_430d1d6a, collectible.index);
		}
	}
	thread util::function_62e48a();
}

/*
	Name: sndlevelstartduck_shutoff
	Namespace: skipto
	Checksum: 0x4A1093BE
	Offset: 0x3938
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function sndlevelstartduck_shutoff()
{
	level flag::wait_till("all_players_spawned");
	level util::clientnotify("sndLevelStartDuck_Shutoff");
}

/*
	Name: nogame
	Namespace: skipto
	Checksum: 0xF405E51B
	Offset: 0x3988
	Size: 0x84
	Parameters: 0
	Flags: Linked
*/
function nogame()
{
	guys = getaiarray();
	guys = arraycombine(guys, getspawnerarray(), 1, 0);
	for(i = 0; i < guys.size; i++)
	{
		guys[i] delete();
	}
}

/*
	Name: is_dev
	Namespace: skipto
	Checksum: 0xCA2B7EC2
	Offset: 0x3A18
	Size: 0x60
	Parameters: 1
	Flags: Linked
*/
function is_dev(skipto)
{
	substr = tolower(getsubstr(skipto, 0, 4));
	if(substr == "dev_")
	{
		return true;
	}
	return false;
}

/*
	Name: is_current_dev
	Namespace: skipto
	Checksum: 0xC4EE5300
	Offset: 0x3A80
	Size: 0x1A
	Parameters: 0
	Flags: None
*/
function is_current_dev()
{
	return is_dev(level.skipto_point);
}

/*
	Name: is_no_game
	Namespace: skipto
	Checksum: 0x3929B876
	Offset: 0x3AA8
	Size: 0x3A
	Parameters: 0
	Flags: Linked
*/
function is_no_game()
{
	if(!isdefined(level.skipto_point))
	{
		return 0;
	}
	return issubstr(level.skipto_point, "no_game");
}

/*
	Name: do_no_game
	Namespace: skipto
	Checksum: 0xFEB84FB5
	Offset: 0x3AF0
	Size: 0xBC
	Parameters: 0
	Flags: None
*/
function do_no_game()
{
	if(!is_no_game())
	{
		return;
	}
	level.stop_load = 1;
	if(isdefined(level.custom_no_game_setupfunc))
	{
		level [[level.custom_no_game_setupfunc]]();
	}
	level thread load::all_players_spawned();
	array::thread_all(getentarray("water", "targetname"), &load::water_think);
	level waittill(#"eternity");
}

/*
	Name: set_cleanup_func
	Namespace: skipto
	Checksum: 0x5DFFC078
	Offset: 0x3BB8
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function set_cleanup_func(func)
{
	level.func_skipto_cleanup = func;
}

/*
	Name: default_skipto
	Namespace: skipto
	Checksum: 0x88F8191C
	Offset: 0x3BE0
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function default_skipto(skipto)
{
	level.default_skipto = skipto;
}

/*
	Name: convert_token
	Namespace: skipto
	Checksum: 0x1CE9E23C
	Offset: 0x3C08
	Size: 0xF4
	Parameters: 3
	Flags: Linked
*/
function convert_token(str, fromtok, totok)
{
	sarray = strtok(str, fromtok);
	ostr = "";
	first = 1;
	foreach(s in sarray)
	{
		if(!first)
		{
			ostr = ostr + totok;
		}
		first = 0;
		ostr = ostr + s;
	}
	return ostr;
}

/*
	Name: load_mission_table
	Namespace: skipto
	Checksum: 0x80CC1375
	Offset: 0x3D08
	Size: 0x152
	Parameters: 3
	Flags: Linked
*/
function load_mission_table(table, levelname, sublevel)
{
	if(!isdefined(sublevel))
	{
		sublevel = "";
	}
	index = 0;
	row = tablelookuprow(table, index);
	while(isdefined(row))
	{
		if(row[0] == levelname && row[1] == sublevel)
		{
			skipto = row[2];
			launch_after = row[3];
			end_before = row[4];
			end_before = convert_token(end_before, "+", ",");
			locstr = row[5];
			add_branch(skipto, &load_mission_init, locstr, undefined, launch_after, end_before);
		}
		index++;
		row = tablelookuprow(table, index);
	}
}

/*
	Name: load_mission_init
	Namespace: skipto
	Checksum: 0x80F724D1
	Offset: 0x3E68
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function load_mission_init()
{
}

/*
	Name: on_finalize_initialization
	Namespace: skipto
	Checksum: 0xFF789FC5
	Offset: 0x3E78
	Size: 0x24
	Parameters: 0
	Flags: Linked, Private
*/
function private on_finalize_initialization()
{
	level flag::set("start_skiptos");
}

/*
	Name: on_player_spawn
	Namespace: skipto
	Checksum: 0x71253559
	Offset: 0x3EA8
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function on_player_spawn()
{
	if(!level flag::get("level_is_go"))
	{
		self function_cdbc8d16(1);
	}
}

/*
	Name: function_9ef3400f
	Namespace: skipto
	Checksum: 0xB89D5E1E
	Offset: 0x3EF0
	Size: 0x8C
	Parameters: 4
	Flags: Linked
*/
function function_9ef3400f(var_41978c9a, var_8c5dfaf7, var_2f1fe3c5, var_67c0fc30)
{
	var_c4a9921e = 0;
	var_16e96e14 = 0;
	if(isdefined(var_67c0fc30))
	{
		var_16e96e14 = var_67c0fc30;
	}
	if(isdefined(var_2f1fe3c5))
	{
		var_c4a9921e = var_2f1fe3c5;
	}
	var_54b76fa9 = var_16e96e14 - var_c4a9921e;
	self matchrecordsetcheckpointstat(var_8c5dfaf7, var_41978c9a, var_54b76fa9);
}

/*
	Name: function_da5051ef
	Namespace: skipto
	Checksum: 0x365CA860
	Offset: 0x3F88
	Size: 0x6C4
	Parameters: 2
	Flags: Linked
*/
function function_da5051ef(objectivename, player)
{
	if(!isdefined(player.var_62e314f8))
	{
		return;
	}
	objectiveindex = level.skipto_settings[objectivename].code_index;
	player function_9ef3400f("kills_total", objectiveindex, player.var_62e314f8.kills, player.kills);
	totalshots = player stats::get_stat("PlayerStatsList", #"total_shots", #"statvalue");
	totalhits = player stats::get_stat("PlayerStatsList", #"hits", #"statvalue");
	if(isdefined(totalshots))
	{
		player function_9ef3400f("shots_total", objectiveindex, player.var_62e314f8.shots, totalshots);
	}
	if(isdefined(totalhits))
	{
		player function_9ef3400f("hits_total", objectiveindex, player.var_62e314f8.hits, totalhits);
	}
	player function_9ef3400f("incaps_total", objectiveindex, player.var_62e314f8.incaps, player.incaps);
	player function_9ef3400f("deaths_total", objectiveindex, player.var_62e314f8.deaths, player.deaths);
	player function_9ef3400f("revives_total", objectiveindex, player.var_62e314f8.revives, player.revives);
	player function_9ef3400f("headshots_total", objectiveindex, player.var_62e314f8.headshots, player.headshots);
	player function_9ef3400f("duration_total", objectiveindex, player.var_62e314f8.timestamp, gettime());
	player function_9ef3400f("score_total", objectiveindex, player.var_62e314f8.score, player.score);
	player function_9ef3400f("grenades_total", objectiveindex, player.var_62e314f8.grenadesused, player.grenadesused);
	player function_9ef3400f("igcSeconds", objectiveindex, player.var_62e314f8.var_4cf30477, player.totaligcviewtime);
	player function_9ef3400f("secondsPaused", objectiveindex, player.var_62e314f8.var_5b03b99, int(gettotalserverpausetime() / 1000));
	var_313c84fd = 0;
	var_d72847a7 = 0;
	var_17cff347 = 0;
	wallruncount = 0;
	var_1bd74555 = 0;
	if(isdefined(player.movementtracking))
	{
		if(isdefined(player.movementtracking.wallrunning))
		{
			var_d72847a7 = player.movementtracking.wallrunning.distance;
			wallruncount = player.movementtracking.wallrunning.count;
		}
		if(isdefined(player.movementtracking.sprinting))
		{
			var_313c84fd = player.movementtracking.sprinting.distance;
		}
		if(isdefined(player.movementtracking.doublejump))
		{
			var_17cff347 = player.movementtracking.doublejump.distance;
			var_1bd74555 = player.movementtracking.doublejump.count;
		}
	}
	player function_9ef3400f("distance_wallrun", objectiveindex, player.var_62e314f8.distance_wallrun, int(var_d72847a7));
	player function_9ef3400f("distance_sprinted", objectiveindex, player.var_62e314f8.distance_sprinted, int(var_313c84fd));
	player function_9ef3400f("distance_boosted", objectiveindex, player.var_62e314f8.distance_boosted, int(var_17cff347));
	player function_9ef3400f("wallruns_total", objectiveindex, player.var_62e314f8.wallruns_total, int(wallruncount));
	player function_9ef3400f("boosts_total", objectiveindex, player.var_62e314f8.boosts_total, int(var_1bd74555));
	player matchrecordsetcheckpointstat(objectiveindex, "start_difficulty", player.var_62e314f8.difficulty);
	player matchrecordsetcheckpointstat(objectiveindex, "end_difficulty", level.gameskill);
	if(isdefined(level.sceneskippedcount))
	{
		player matchrecordsetcheckpointstat(objectiveindex, "igcSkippedNum", level.sceneskippedcount);
	}
}

/*
	Name: function_7c7195b4
	Namespace: skipto
	Checksum: 0xF10B0349
	Offset: 0x4658
	Size: 0x3FA
	Parameters: 1
	Flags: Linked
*/
function function_7c7195b4(player)
{
	if(!isdefined(player.var_62e314f8))
	{
		player.var_62e314f8 = spawnstruct();
	}
	player.var_62e314f8.kills = player.kills;
	shots = player stats::get_stat("PlayerStatsList", #"total_shots", #"statvalue");
	player.var_62e314f8.shots = (isdefined(shots) ? shots : 0);
	hits = player stats::get_stat("PlayerStatsList", #"hits", #"statvalue");
	player.var_62e314f8.hits = (isdefined(hits) ? hits : 0);
	player.var_62e314f8.incaps = player.incaps;
	player.var_62e314f8.deaths = player.deaths;
	player.var_62e314f8.revives = player.revives;
	player.var_62e314f8.headshots = player.headshots;
	player.var_62e314f8.timestamp = gettime();
	player.var_62e314f8.score = player.score;
	player.var_62e314f8.grenadesused = player.grenadesused;
	player.var_62e314f8.var_4cf30477 = player.totaligcviewtime;
	player.var_62e314f8.var_5b03b99 = int(gettotalserverpausetime() / 1000);
	player.var_62e314f8.difficulty = level.gameskill;
	var_313c84fd = 0;
	var_d72847a7 = 0;
	var_17cff347 = 0;
	wallruncount = 0;
	var_1bd74555 = 0;
	if(isdefined(player.movementtracking))
	{
		if(isdefined(player.movementtracking.wallrunning))
		{
			var_d72847a7 = player.movementtracking.wallrunning.distance;
			wallruncount = player.movementtracking.wallrunning.count;
		}
		if(isdefined(player.movementtracking.sprinting))
		{
			var_313c84fd = player.movementtracking.sprinting.distance;
		}
		if(isdefined(player.movementtracking.doublejump))
		{
			var_17cff347 = player.movementtracking.doublejump.distance;
			var_1bd74555 = player.movementtracking.doublejump.count;
		}
	}
	player.var_62e314f8.distance_wallrun = int(var_d72847a7);
	player.var_62e314f8.distance_sprinted = int(var_313c84fd);
	player.var_62e314f8.distance_boosted = int(var_17cff347);
	player.var_62e314f8.wallruns_total = int(wallruncount);
	player.var_62e314f8.boosts_total = int(var_1bd74555);
}

/*
	Name: on_player_connect
	Namespace: skipto
	Checksum: 0xEC1DB0C8
	Offset: 0x4A60
	Size: 0x5C4
	Parameters: 0
	Flags: Linked
*/
function on_player_connect()
{
	if(is_true(level.deadops))
	{
		return;
	}
	var_74979d0 = getrootmapname();
	if(!isdefined(var_74979d0))
	{
		return;
	}
	if(getdvarint(#"hash_30a8d8634a92b501", 0) == 0)
	{
		if(self ishost())
		{
			var_ea1ac9c = 1;
			if(sessionmodeisonlinegame())
			{
				var_ea1ac9c = is_true(self stats::get_stat(#"hash_46e7db8ceaba5b2f"));
			}
			else
			{
				var_ea1ac9c = is_true(self stats::get_stat(#"hash_d4aef679e9c5e94", 0));
			}
			if(!var_ea1ac9c)
			{
				self savegame::set_player_data("savegame_score", self function_8338f930("SCORE", var_74979d0));
				self savegame::set_player_data("savegame_kills", self function_8338f930("KILLS", var_74979d0));
				self savegame::set_player_data("savegame_assists", self function_8338f930("ASSISTS", var_74979d0));
				self savegame::set_player_data("savegame_incaps", self function_8338f930("INCAPS", var_74979d0));
				self savegame::set_player_data("savegame_revives", self function_8338f930("REVIVES", var_74979d0));
				if(sessionmodeisonlinegame())
				{
					self stats::set_stat(#"hash_46e7db8ceaba5b2f", 1);
				}
				else
				{
					self stats::set_stat(#"hash_d4aef679e9c5e94", 0, 1);
				}
				uploadstats(self);
			}
			if(!isdefined(self savegame::get_player_data("savegame_score")))
			{
				self savegame::set_player_data("savegame_score", 0);
			}
			if(!isdefined(self savegame::get_player_data("savegame_kills")))
			{
				self savegame::set_player_data("savegame_kills", 0);
			}
			if(!isdefined(self savegame::get_player_data("savegame_assists")))
			{
				self savegame::set_player_data("savegame_assists", 0);
			}
			if(!isdefined(self savegame::get_player_data("savegame_incaps")))
			{
				self savegame::set_player_data("savegame_incaps", 0);
			}
			if(!isdefined(self savegame::get_player_data("savegame_revives")))
			{
				self savegame::set_player_data("savegame_revives", 0);
			}
			self.pers[#"score"] = self savegame::get_player_data("savegame_score", 0);
			self.pers[#"kills"] = self savegame::get_player_data("savegame_kills", 0);
			self.pers[#"assists"] = self savegame::get_player_data("savegame_assists", 0);
			self.pers[#"incaps"] = self savegame::get_player_data("savegame_incaps", 0);
			self.pers[#"revives"] = self savegame::get_player_data("savegame_revives", 0);
			self.score = self.pers[#"score"];
			self.kills = self.pers[#"kills"];
			self.assists = self.pers[#"assists"];
			self.incaps = self.pers[#"incaps"];
			self.revives = self.pers[#"revives"];
		}
	}
	function_7c7195b4(self);
}

/*
	Name: objective_completed
	Namespace: skipto
	Checksum: 0xFF02EE27
	Offset: 0x5030
	Size: 0x384
	Parameters: 4
	Flags: Linked
*/
function objective_completed(name, var_28e39919, player, var_ce580a72)
{
	if(!isdefined(var_28e39919))
	{
		var_28e39919 = 1;
	}
	/#
		assert(isdefined(level.skipto_settings[name]), ("" + name) + "");
	#/
	if(level flag::get(name + "_completed"))
	{
		return;
	}
	var_28bddd09 = 0;
	foreach(player in level.players)
	{
		if(isalive(player))
		{
			var_28bddd09 = 1;
			break;
		}
	}
	if(!is_true(var_28bddd09))
	{
		return;
	}
	setdvar(#"hash_328d096ed229649d", 1);
	foreach(var_9eeced56 in level.players)
	{
		if(var_9eeced56 istestclient())
		{
			continue;
		}
		bb::logobjectivestatuschange(name, var_9eeced56, "complete");
		var_9eeced56 globallogic_player::function_4d3e38fb();
	}
	if(isdefined(name))
	{
		if(isdefined(player) && !isdefined(var_ce580a72))
		{
			function_da5051ef(name, player);
		}
		else
		{
			foreach(var_bd93cbe5 in level.players)
			{
				function_da5051ef(name, var_bd93cbe5);
			}
		}
		level stop_objective_logic(name, 0, 1, player);
	}
	if(var_28e39919)
	{
		next = get_next_skiptos(name);
		next = check_skipto_conditions(next);
		if(isdefined(next) && next.size > 0)
		{
			level set_level_objective(next, 0, player);
		}
	}
}

/*
	Name: change_completion_menu
	Namespace: skipto
	Checksum: 0x498CC8BA
	Offset: 0x53C0
	Size: 0x140
	Parameters: 1
	Flags: Linked
*/
function change_completion_menu(objectives)
{
	/#
		rootclear = "";
		adddebugcommand(rootclear);
		rootmenu = "";
		compmenu = rootmenu + "";
		index = 1;
		foreach(objective in objectives)
		{
			name = (objective + "") + index;
			index++;
			adddebugcommand((((((compmenu + name) + "") + "") + "") + objective) + "");
		}
	#/
}

/*
	Name: set_level_objective
	Namespace: skipto
	Checksum: 0x7BDD74ED
	Offset: 0x5508
	Size: 0x2F4
	Parameters: 3
	Flags: Linked
*/
function set_level_objective(objectives, starting, player)
{
	clear_recursion();
	foreach(name in objectives)
	{
		if(isdefined(level.skipto_settings[name]))
		{
			stop_objective_logic(level.skipto_settings[name].prev, starting, 0, player);
		}
	}
	if(isdefined(level.func_skipto_cleanup))
	{
		foreach(name in objectives)
		{
			thread [[level.func_skipto_cleanup]](name);
		}
	}
	start_objective_logic(objectives, starting);
	level.skipto_point = level.skipto_current_objective[0];
	if(!is_true(level.level_ending))
	{
		set_current_skiptos(level.skipto_current_objective);
	}
	level notify(#"objective_changed", {#objectives:level.skipto_current_objective});
	activities::function_59e67711(objectives[0]);
	change_completion_menu(level.skipto_current_objective);
	if(isdefined(player))
	{
		function_7c7195b4(player);
	}
	else
	{
		foreach(var_bd93cbe5 in level.players)
		{
			function_7c7195b4(var_bd93cbe5);
		}
	}
	update_spawn_points(starting);
}

/*
	Name: update_spawn_points
	Namespace: skipto
	Checksum: 0xB186EC82
	Offset: 0x5808
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function update_spawn_points(b_starting)
{
	level.var_cd012e52 = filter_player_spawnpoints();
	level flag::set("skipto_spawns_ready");
}

/*
	Name: start_objective_logic
	Namespace: skipto
	Checksum: 0xC9B7F92E
	Offset: 0x5858
	Size: 0x440
	Parameters: 3
	Flags: Linked
*/
function start_objective_logic(name, starting, var_23522927)
{
	if(!isdefined(var_23522927))
	{
		var_23522927 = 0;
	}
	if(isarray(name))
	{
		if(starting && name.size > 1)
		{
			load::function_ba5622e();
			var_23522927 = 1;
			level flag::init("all_branch_func_starting");
		}
		level flag::wait_till("all_players_connected");
		foreach(element in name)
		{
			start_objective_logic(element, starting, var_23522927);
		}
		if(starting && name.size > 1)
		{
			load::function_eb7b7382();
			level flag::set("all_branch_func_starting");
		}
	}
	else
	{
		if(isdefined(level.skipto_settings[name]))
		{
			if(!is_true(level.skipto_settings[name].objective_running))
			{
				if(!isinarray(level.skipto_current_objective, name))
				{
					if(!isdefined(level.skipto_current_objective))
					{
						level.skipto_current_objective = [];
					}
					else if(!isarray(level.skipto_current_objective))
					{
						level.skipto_current_objective = array(level.skipto_current_objective);
					}
					level.skipto_current_objective[level.skipto_current_objective.size] = name;
				}
				level notify(name + "_init");
				level.skipto_settings[name].objective_running = 1;
				if(!getdvarint(#"art_review", 0))
				{
					standard_objective_init(name, starting);
					level thread function_b7e9926c(name, starting, var_23522927);
					if(is_true(level.skipto_settings[name].var_4444a90d))
					{
						savegame::checkpoint_save(1);
					}
				}
			}
			if(!is_true(level.skipto_settings[name].logic_running) && isdefined(level.skipto_settings[name].logic_func))
			{
				level.skipto_settings[name].logic_running = 1;
				thread [[level.skipto_settings[name].logic_func]](name);
			}
		}
		foreach(player in level.players)
		{
			bb::logobjectivestatuschange(name, player, "start");
		}
	}
}

/*
	Name: function_b7e9926c
	Namespace: skipto
	Checksum: 0xA9C2F8CB
	Offset: 0x5CA0
	Size: 0x168
	Parameters: 3
	Flags: Linked, Private
*/
function private function_b7e9926c(name, starting, var_23522927)
{
	s_skipto = level.skipto_settings[name];
	if(is_true(s_skipto.var_4444a90d))
	{
		savegame::function_7e0e735b();
	}
	if(isdefined(s_skipto.var_e5301d70))
	{
		level districts::function_a7d79fcb(s_skipto.var_e5301d70, 1);
	}
	function_9ab01465();
	if(starting)
	{
		if(!var_23522927)
		{
			load::function_ba5622e();
		}
		if(isdefined(s_skipto.var_4c644f8d))
		{
			[[s_skipto.var_4c644f8d]](name);
		}
		if(!var_23522927)
		{
			load::function_eb7b7382();
			teleport_heroes(name);
		}
		else
		{
			level flag::wait_till("all_branch_func_starting");
		}
	}
	if(isdefined(s_skipto.var_2c183249))
	{
		[[s_skipto.var_2c183249]](name, starting);
	}
}

/*
	Name: function_9ab01465
	Namespace: skipto
	Checksum: 0x76BED706
	Offset: 0x5E10
	Size: 0x98
	Parameters: 0
	Flags: Linked, Private
*/
function private function_9ab01465()
{
	foreach(player in getplayers())
	{
		player function_cdbc8d16(1);
	}
}

/*
	Name: function_cdbc8d16
	Namespace: skipto
	Checksum: 0xEFE5124D
	Offset: 0x5EB0
	Size: 0xEC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_cdbc8d16(frozen)
{
	/#
		assert(isplayer(self));
	#/
	if(is_true(frozen))
	{
		self val::set(#"hash_3d2438fcbc75f543", "freezecontrols", 1);
		self val::set(#"hash_3d2438fcbc75f543", "pre_load_ghost", 1);
		self thread function_3cdc5488();
	}
	else
	{
		self val::reset_all(#"hash_3d2438fcbc75f543");
	}
}

/*
	Name: function_3cdc5488
	Namespace: skipto
	Checksum: 0x9972B390
	Offset: 0x5FA8
	Size: 0x8C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_3cdc5488()
{
	/#
		assert(isplayer(self));
	#/
	self notify("3b7171c23ea95cd9");
	self endon("3b7171c23ea95cd9");
	self endon(#"disconnect");
	level flag::wait_till("level_is_go");
	self function_cdbc8d16(0);
}

/*
	Name: clear_recursion
	Namespace: skipto
	Checksum: 0x9B71C78B
	Offset: 0x6040
	Size: 0x82
	Parameters: 0
	Flags: Linked
*/
function clear_recursion()
{
	foreach(skipto in level.skipto_settings)
	{
		skipto.cleanup_recursion = 0;
	}
}

/*
	Name: stop_objective_logic
	Namespace: skipto
	Checksum: 0x4FCFEEB5
	Offset: 0x60D0
	Size: 0x39C
	Parameters: 4
	Flags: Linked
*/
function stop_objective_logic(name, starting, direct, player)
{
	if(isarray(name))
	{
		foreach(element in name)
		{
			stop_objective_logic(element, starting, direct, player);
		}
	}
	else if(isdefined(level.skipto_settings[name]))
	{
		cleaned = 0;
		if(is_true(level.skipto_settings[name].objective_running))
		{
			cleaned = 1;
			level.skipto_settings[name].objective_running = 0;
			if(isinarray(level.skipto_current_objective, name))
			{
				arrayremovevalue(level.skipto_current_objective, name);
			}
			if(!getdvarint(#"art_review", 0))
			{
				if(isdefined(level.skipto_settings[name].cleanup_func))
				{
					thread [[level.skipto_settings[name].cleanup_func]](name, starting, direct, player);
				}
				standard_objective_done(name, starting, direct, player);
			}
			level notify(name + "_terminate");
		}
		if(!is_true(level.skipto_settings[name].cleanup_recursion))
		{
			level.skipto_settings[name].cleanup_recursion = 1;
			if(!is_true(level.skipto_settings[name].looping))
			{
				prev = level.skipto_settings[name].prev;
				foreach(element in prev)
				{
					stop_objective_logic(element, starting, 0, player);
				}
			}
			if(starting && !cleaned)
			{
				if(!getdvarint(#"art_review", 0))
				{
					if(isdefined(level.skipto_settings[name].cleanup_func))
					{
						thread [[level.skipto_settings[name].cleanup_func]](name, starting, 0, player);
					}
					standard_objective_done(name, starting, 0, player);
				}
			}
		}
	}
}

/*
	Name: function_f3d2a1c3
	Namespace: skipto
	Checksum: 0x38FB088E
	Offset: 0x6478
	Size: 0xB2
	Parameters: 1
	Flags: Linked
*/
function function_f3d2a1c3(e_player)
{
	if(!level flag::get("level_has_skiptos"))
	{
		return "skipto_allies";
	}
	if(!level flag::get("skipto_spawns_ready"))
	{
		return "skipto_allies";
	}
	if(e_player.team === #"axis")
	{
		return "skipto_axis";
	}
	if(e_player.team === #"allies")
	{
		return "skipto_allies";
	}
	return undefined;
}

/*
	Name: filter_player_spawnpoints
	Namespace: skipto
	Checksum: 0xCED6F72
	Offset: 0x6538
	Size: 0x43E
	Parameters: 3
	Flags: Linked
*/
function filter_player_spawnpoints(player, spawnpoints, str_skipto)
{
	objectives = (isdefined(str_skipto) ? str_skipto : level.skipto_current_objective);
	if(!isdefined(objectives) || !objectives.size)
	{
		objectives = get_current_skiptos();
		if(!isdefined(objectives) || !objectives.size)
		{
			objectives = level.default_skipto;
		}
	}
	if(!isarray(objectives) && objectives == "_default")
	{
		objectives = get_next_skiptos("_default");
	}
	filter = [];
	if(!isdefined(objectives))
	{
		objectives = [];
	}
	else if(!isarray(objectives))
	{
		objectives = array(objectives);
	}
	foreach(objective in objectives)
	{
		if(isdefined(level.skipto_settings[objective]))
		{
			if(is_true(level.skipto_settings[objective].public) || is_true(level.skipto_settings[objective].dev_skipto))
			{
				if(!isdefined(filter))
				{
					filter = [];
				}
				else if(!isarray(filter))
				{
					filter = array(filter);
				}
				filter[filter.size] = objective;
			}
		}
	}
	var_52232523 = (isdefined(spawnpoints) ? spawnpoints : level.a_s_spawn_points);
	if(filter.size == 0)
	{
		filter[0] = level.default_skipto;
	}
	if(isdefined(filter) && filter.size > 0)
	{
		anypoints = [];
		retpoints = [];
		foreach(point in var_52232523)
		{
			point.different_skipto = 0;
			if(isdefined(point.script_objective) && isinarray(filter, point.script_objective))
			{
				if(!isdefined(retpoints))
				{
					retpoints = [];
				}
				else if(!isarray(retpoints))
				{
					retpoints = array(retpoints);
				}
				retpoints[retpoints.size] = point;
				continue;
			}
			if(!isdefined(point.script_objective))
			{
				if(!isdefined(anypoints))
				{
					anypoints = [];
				}
				else if(!isarray(anypoints))
				{
					anypoints = array(anypoints);
				}
				anypoints[anypoints.size] = point;
				continue;
			}
			point.different_skipto = 1;
		}
		if(retpoints.size > 0)
		{
			return retpoints;
		}
		if(anypoints.size > 0)
		{
			return anypoints;
		}
	}
	return var_52232523;
}

/*
	Name: delete_start_spawns
	Namespace: skipto
	Checksum: 0x8B85EAE
	Offset: 0x6980
	Size: 0xF0
	Parameters: 1
	Flags: None
*/
function delete_start_spawns(str_skipto)
{
	a_spawns = spawning::get_spawnpoint_array("cp_coop_spawn");
	foreach(spawn_point in a_spawns)
	{
		if(spawn_point.script_objective == str_skipto)
		{
			if(spawn_point.classname !== "script_model")
			{
				spawn_point delete();
				continue;
			}
			spawn_point struct::delete();
		}
	}
}

/*
	Name: teleport_heroes
	Namespace: skipto
	Checksum: 0xF280DB4E
	Offset: 0x6A78
	Size: 0x108
	Parameters: 2
	Flags: Linked
*/
function teleport_heroes(str_skipto, var_dad37549)
{
	if(!isdefined(level.heroes))
	{
		level.heroes = [];
	}
	foreach(ai_hero in level.heroes)
	{
		b_success = teleport::hero(ai_hero, array(str_skipto, "script_objective"), var_dad37549);
		/#
			if(!b_success)
			{
				iprintlnbold("" + str_skipto);
			}
		#/
	}
}

/*
	Name: function_60ca00f5
	Namespace: skipto
	Checksum: 0x16E18C9F
	Offset: 0x6B88
	Size: 0x134
	Parameters: 0
	Flags: Linked
*/
function function_60ca00f5()
{
	if(isdefined(level.var_7c9795bf))
	{
		return level.var_7c9795bf;
	}
	if(isdefined(level.mission_name) && issubstr(tolower(level.mission_name), "cp_gm_"))
	{
		return tolower(level.mission_name);
	}
	var_266acb38 = getmaporder();
	if(var_266acb38 >= 0)
	{
		var_e5f80f4e = getmapfields(getmapatindex(var_266acb38));
		if(isdefined(var_e5f80f4e.var_c9d6f30a) && var_e5f80f4e.var_c9d6f30a.size > 0)
		{
			return var_e5f80f4e.var_c9d6f30a[0].nextmap;
		}
		return getmapatindex(var_266acb38 + 1);
	}
}

/*
	Name: function_455cb6c5
	Namespace: skipto
	Checksum: 0xCA6DA885
	Offset: 0x6CC8
	Size: 0x190
	Parameters: 1
	Flags: Linked
*/
function function_455cb6c5(var_83104433)
{
	if(isdefined(var_83104433))
	{
		var_266acb38 = getmaporder();
		var_74979d0 = getrootmapname(tolower(var_83104433));
		if(var_266acb38 >= 0)
		{
			var_65792f8b = function_2717b55f(savegame::get_mission_name());
			if(isdefined(var_65792f8b) && isdefined(var_65792f8b.var_c9d6f30a))
			{
				foreach(var_5c9a8c92 in var_65792f8b.var_c9d6f30a)
				{
					if(tolower(var_5c9a8c92.nextmap) == var_74979d0)
					{
						return var_5c9a8c92.skipto;
					}
				}
			}
			var_cc500e2b = function_2717b55f(var_83104433);
			if(isdefined(var_cc500e2b) && isdefined(var_cc500e2b.var_a04dfce6))
			{
				return var_cc500e2b.var_a04dfce6;
			}
		}
	}
}

/*
	Name: function_3a9156bf
	Namespace: skipto
	Checksum: 0x56CE0E03
	Offset: 0x6E60
	Size: 0x8A
	Parameters: 1
	Flags: None
*/
function function_3a9156bf(mission_index)
{
	var_9ba5cef7 = savegame::get_player_data("previous_mission", "");
	if(var_9ba5cef7.size == 0)
	{
		var_1fdcd030 = getmapatindex(mission_index - 1);
		if(isdefined(var_1fdcd030) && var_1fdcd030.size != 0)
		{
			var_9ba5cef7 = var_1fdcd030;
		}
	}
	return var_9ba5cef7;
}

/*
	Name: function_6914f647
	Namespace: skipto
	Checksum: 0x851A0C2E
	Offset: 0x6EF8
	Size: 0x266
	Parameters: 0
	Flags: Linked
*/
function function_6914f647()
{
	player = getplayers()[0];
	currentmission = savegame::get_mission_name();
	safehouse = savegame::get_player_data("previous_safehouse", "");
	if(safehouse.size != 0)
	{
		return safehouse;
	}
	missionindex = 0;
	var_4d75d53a = function_2717b55f(currentmission);
	if(isdefined(var_4d75d53a) && is_true(var_4d75d53a.var_32a51de2))
	{
		missionindex = player stats::get_stat(#"hash_1e7fdd28f2a28f78", currentmission, #"missionindex");
	}
	if(!isdefined(missionindex) || missionindex == 0)
	{
		missionindex = getmaporder();
	}
	for(i = missionindex - 1; i >= 0; i--)
	{
		var_1fdcd030 = getmapatindex(i);
		var_65792f8b = function_2717b55f(var_1fdcd030);
		var_8670e6a3 = savegame::get_mission_data(#"persistent", var_1fdcd030);
		if(isdefined(var_65792f8b) && is_true(var_65792f8b.var_beb20e53) && is_true(var_8670e6a3.unlocked) && var_1fdcd030 != #"cp_ger_hub_post_cuba" && var_1fdcd030 != #"cp_ger_hub8")
		{
			return var_1fdcd030;
		}
	}
	return "cp_ger_hub";
}

/*
	Name: function_99ddd76d
	Namespace: skipto
	Checksum: 0x682D8B7F
	Offset: 0x7168
	Size: 0xA6
	Parameters: 0
	Flags: None
*/
function function_99ddd76d()
{
	safehouse = function_6914f647();
	if(safehouse == #"cp_ger_hub_post_yamantau")
	{
		return 1;
	}
	if(safehouse == #"cp_ger_hub_post_kgb")
	{
		return 2;
	}
	/#
		assert(safehouse != #"cp_ger_hub_post_cuba" && safehouse != #"cp_ger_hub8");
	#/
	return 0;
}

/*
	Name: function_cfb483b7
	Namespace: skipto
	Checksum: 0xCCA5BB41
	Offset: 0x7218
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function function_cfb483b7()
{
	safehouse = function_6914f647();
	skipto = function_547ca7d2(safehouse);
	load::function_cc51116c(safehouse, skipto);
}

/*
	Name: function_787007b6
	Namespace: skipto
	Checksum: 0x78548594
	Offset: 0x7278
	Size: 0x104
	Parameters: 2
	Flags: None
*/
function function_787007b6(var_74979d0, stat_name)
{
	if(!isdefined(var_74979d0))
	{
		return;
	}
	var_2102f84a = self function_8338f930(stat_name, var_74979d0);
	var_7176c82c = self savegame::get_player_data("savegame_" + stat_name);
	var_aa0ccaed = self stats::get_stat(#"playerstatsbymap", var_74979d0, #"hash_2f236080a1058999", stat_name);
	var_2fc24ec6 = var_2102f84a - var_7176c82c;
	var_aa0ccaed = var_aa0ccaed + var_2fc24ec6;
	self stats::set_stat(#"playerstatsbymap", var_74979d0, #"hash_2f236080a1058999", stat_name, var_aa0ccaed);
}

/*
	Name: function_16c5b1f7
	Namespace: skipto
	Checksum: 0xB8213A5B
	Offset: 0x7388
	Size: 0xCE
	Parameters: 0
	Flags: Linked
*/
function function_16c5b1f7()
{
	/#
		assert(isdefined(self));
	#/
	/#
		assert(isplayer(self));
	#/
	if(isdefined(self.var_993d990c))
	{
		self closeluimenu(self.var_993d990c);
		if(self ishost())
		{
		}
	}
	level flag::set("credits_done");
	self notify(#"hash_649f3572506356f2", savegame::function_7642d0c9());
}

/*
	Name: function_521de2b3
	Namespace: skipto
	Checksum: 0x7F9A958F
	Offset: 0x7460
	Size: 0x24C
	Parameters: 0
	Flags: Linked
*/
function function_521de2b3()
{
	player = getplayers()[0];
	if(!isdefined(player))
	{
		return;
	}
	currentmission = savegame::get_mission_name();
	persistent = savegame::get_mission_data(#"persistent", currentmission);
	transient = savegame::get_mission_data(#"transient", currentmission);
	persistent.complete = 1;
	player stats::set_stat(#"mapdata", currentmission, #"complete", persistent.complete);
	if(!isdefined(persistent.var_8757a567))
	{
		persistent.var_8757a567 = 0;
	}
	if(!isdefined(transient.gameskilllowest))
	{
		transient.gameskilllowest = 0;
	}
	if(transient.gameskilllowest > persistent.var_8757a567)
	{
		persistent.var_8757a567 = transient.gameskilllowest;
	}
	player stats::set_stat(#"mapdata", currentmission, #"highestdifficulty", persistent.var_8757a567);
	var_f1036742 = collectibles::function_293d81b4(2, currentmission);
	foreach(collectible in var_f1036742)
	{
		collectibles::function_316c48a3(collectible.var_430d1d6a, collectible.index);
	}
	uploadstats(player);
}

/*
	Name: level_completed
	Namespace: skipto
	Checksum: 0x8EEC3E2E
	Offset: 0x76B8
	Size: 0xBAC
	Parameters: 2
	Flags: Linked
*/
function level_completed(var_83104433, var_585e39fb)
{
	if(!isdefined(var_83104433))
	{
		var_83104433 = function_60ca00f5();
	}
	if(!isdefined(var_585e39fb))
	{
		var_585e39fb = function_455cb6c5(var_83104433);
	}
	player = getplayers()[0];
	if(!isplayer(player))
	{
		return;
	}
	/#
		if(isdefined(level.var_62b2e325))
		{
			level thread [[level.var_62b2e325]]();
		}
	#/
	var_8e962e56 = load::function_f97a8023(var_83104433);
	var_8d9ef424 = 0;
	currentmission = savegame::get_mission_name();
	if(!is_final_level())
	{
		var_4d75d53a = function_2717b55f(currentmission);
		is_safehouse = is_true(var_4d75d53a.var_beb20e53);
		var_510f193a = is_true(var_4d75d53a.var_32a51de2);
		var_5e7454e = 0;
		var_9ba5cef7 = savegame::get_player_data("previous_mission", "");
		if(var_9ba5cef7 != "")
		{
			var_43758eae = function_2717b55f(var_9ba5cef7);
			var_5e7454e = is_true(var_43758eae.var_beb20e53) && var_9ba5cef7 != #"cp_ger_hub_post_cuba" && var_9ba5cef7 != #"cp_ger_hub8";
		}
		if(!var_8e962e56)
		{
			if(is_safehouse)
			{
				if(player globallogic_ui::function_4e49c51d(#"hash_3ce5e1167ca8833c", #"hash_13f8ddd8c126fd85", 0, undefined, undefined, undefined, #"hash_30d957f8369ca911", #"hash_5d17f0de4da5d356"))
				{
					return;
				}
				globallogic::function_7b994f00();
			}
			else
			{
				if(player globallogic_ui::function_4e49c51d(#"hash_3ce5e1167ca8833c", #"hash_13f8ddd8c126fd85", 0, undefined, undefined, undefined, #"hash_30d957f8369ca911", #"hash_5d17f0de4da5d356"))
				{
					var_83104433 = function_6914f647();
					var_585e39fb = function_5011fee2(var_83104433);
				}
				else
				{
					var_8d9ef424 = 1;
				}
			}
		}
		else if(var_5e7454e && !is_safehouse && !var_510f193a && savegame::function_ac15668a(currentmission))
		{
			if(player globallogic_ui::function_4e49c51d(#"hash_40bb7b88b33df484", undefined, 0, undefined, undefined, undefined, #"hash_30d957f8369ca911", #"hash_1bcb1daaa79d6c2e"))
			{
				var_83104433 = function_6914f647();
				var_585e39fb = function_547ca7d2(var_83104433);
			}
		}
	}
	if(is_true(level.level_ending))
	{
		return;
	}
	level.level_ending = 1;
	setdvar(#"hash_54488b7c651bd0ec", 1);
	foreach(var_bd93cbe5 in level.players)
	{
		bb::logobjectivestatuschange("_level", var_bd93cbe5, "complete");
		bb::logmatchsummary(var_bd93cbe5);
	}
	matchrecordsetcurrentlevelcomplete();
	matchrecordsetleveldifficultyforindex(1, level.gameskill);
	var_8b2a3a13 = getmapoutromovie();
	if(isdefined(var_8b2a3a13))
	{
		level lui::prime_movie(var_8b2a3a13);
	}
	if(level.var_7ddd2b02 !== 0)
	{
		level lui::screen_fade_out(1);
	}
	level notify(#"game_ended");
	util::wait_network_frame();
	set_current_skipto(var_585e39fb);
	foreach(player in getplayers())
	{
		player player::take_weapons();
		player savegame::set_player_data("saved_weapon", player._current_weapon.rootweapon.name);
		player savegame::set_player_data("saved_weapon_attachments", util::function_2146bd83(player._current_weapon));
		player savegame::set_player_data("saved_weapondata", player._weapons);
		player savegame::set_player_data("lives", player.lives);
		player._weapons = undefined;
		player.gun_removed = undefined;
	}
	player_decision::function_d04c220e();
	player_decision::function_ef22e409();
	savegame::set_player_data("previous_mission", savegame::get_mission_name());
	function_521de2b3();
	if(!is_final_level())
	{
		savegame::save(var_83104433);
	}
	else
	{
		savegame::save();
		function_ec2973c9();
	}
	savegame::clear_mission_data(#"transient");
	world.var_b86bf11e = undefined;
	foreach(player in getplayers())
	{
		player thread achievements::function_f854bc50(player, level.map_name, level.gameskill);
	}
	if(isdefined(var_8b2a3a13))
	{
		level thread lui::play_outro_movie(var_8b2a3a13);
		snd::function_7db65a93("outro_movie");
		player notify(#"menuresponse", {#value:1, #response:#"skippable", #menu:#"full_screen_movie"});
		level flag::wait_till_clear("playing_outro_movie");
	}
	if(!is_final_level())
	{
		if(var_8d9ef424)
		{
			globallogic::function_7b994f00();
		}
		else
		{
			load::next_mission(var_83104433, var_585e39fb);
		}
	}
	else
	{
		foreach(e_player in level.players)
		{
			if(!isbot(e_player))
			{
				world.var_f2c8b0cb[e_player.name] = e_player.curclass;
			}
		}
		level.var_7c9795bf = undefined;
		level flag::init("credits_done");
		level thread function_18193dd4();
		foreach(player in level.players)
		{
			player thread function_e8abcd84();
		}
		level flag::wait_till("credits_done");
		level notify(#"credits_done");
		music::setmusicstate("");
		util::wait_network_frame();
		globallogic::function_7b994f00();
	}
}

/*
	Name: function_e8abcd84
	Namespace: skipto
	Checksum: 0x41162D71
	Offset: 0x8270
	Size: 0x22C
	Parameters: 1
	Flags: Linked
*/
function function_e8abcd84(var_7a179706)
{
	if(!isdefined(var_7a179706))
	{
		var_7a179706 = 0;
	}
	self endon(#"disconnect", #"hash_649f3572506356f2");
	if(isdefined(self))
	{
		if(var_7a179706)
		{
			self lui::open_script_dialog("ThankYouForPlaying");
		}
		else
		{
			self.var_993d990c = self openluimenu("Credit_Fullscreen", 1);
			self val::set(#"credits", "freezecontrols", 1);
			do
			{
				waitresult = undefined;
				waitresult = self waittill(#"menuresponse");
				menu = waitresult.menu;
				response = waitresult.response;
			}
			while(response != "skipCredits");
			self closeluimenu(self.var_993d990c);
			self val::reset(#"credits", "freezecontrols");
			self.var_993d990c = undefined;
			foreach(player in getplayers())
			{
				player function_16c5b1f7();
			}
		}
	}
	else
	{
		level flag::set("credits_done");
	}
}

/*
	Name: function_18193dd4
	Namespace: skipto
	Checksum: 0x5E928C1
	Offset: 0x84A8
	Size: 0x23A
	Parameters: 0
	Flags: Linked
*/
function function_18193dd4()
{
	level endon(#"credits_done");
	var_6396ca45 = [];
	var_6396ca45[0] = [1:194.704, 0:"mp_theme"];
	var_6396ca45[1] = [1:179.428, 0:"kgb_combat"];
	var_6396ca45[2] = [1:278.95, 0:"bells_theme"];
	var_6396ca45[3] = [1:198.512, 0:"titlescreen"];
	var_6396ca45[4] = [1:68.521, 0:"menu_theme_edit"];
	var_6396ca45[5] = [1:10, 0:""];
	while(true)
	{
		foreach(music_state in var_6396ca45)
		{
			state = music_state[0];
			seconds = float(music_state[1]);
			if(isstring(state) && isfloat(seconds) && seconds > 0)
			{
				music::setmusicstate(state);
				wait(seconds);
			}
		}
	}
}

/*
	Name: function_8338f930
	Namespace: skipto
	Checksum: 0xC3A566B0
	Offset: 0x86F0
	Size: 0xFA
	Parameters: 2
	Flags: Linked
*/
function function_8338f930(stat_name, var_74979d0)
{
	if(!isdefined(var_74979d0))
	{
		return 0;
	}
	var_2c4f2782 = self stats::get_stat(#"playerstatsbymap", var_74979d0, #"hash_2f236080a1058999", stat_name);
	var_a1bd2428 = self stats::get_stat(#"playerstatslist", stat_name, #"statvalue");
	if(!isdefined(var_2c4f2782) || !isdefined(var_a1bd2428))
	{
		return 0;
	}
	/#
		assert(var_2c4f2782 <= var_a1bd2428);
	#/
	return int(abs(var_a1bd2428 - var_2c4f2782));
}

/*
	Name: standard_objective_init
	Namespace: skipto
	Checksum: 0xBB2A203D
	Offset: 0x87F8
	Size: 0x70
	Parameters: 2
	Flags: Linked, Private
*/
function private standard_objective_init(skipto, starting)
{
	level flag::set(starting);
	level thread watch_completion(starting);
	/#
		level.current_skipto = starting;
		level notify(#"update_billboard");
	#/
}

/*
	Name: standard_objective_done
	Namespace: skipto
	Checksum: 0x66CC6E3A
	Offset: 0x8870
	Size: 0x244
	Parameters: 4
	Flags: Linked, Private
*/
function private standard_objective_done(skipto, starting, direct, player)
{
	level flag::clear(player);
	level flag::set(player + "_completed");
	if(!isdefined(level.skipto_settings[player]))
	{
		/#
			assertmsg("" + player);
		#/
	}
	waittillframeend();
	if(!is_true(level.preserve_script_objective_ents))
	{
		a_entities = getentarray(player, "script_objective");
		foreach(entity in a_entities)
		{
			if(issentient(entity))
			{
				if(!isdefined(level.heroes) || !isinarray(level.heroes, entity) && entity.scriptvehicletype !== "player_hunter" && entity.scriptvehicletype !== "player_fav")
				{
					entity thread util::auto_delete();
				}
				continue;
			}
			entity delete();
		}
		level thread function_30523221(player);
		level thread function_8ca86687(player);
	}
	level thread traps_deployable::clean_traps(0, player, undefined);
}

/*
	Name: function_30523221
	Namespace: skipto
	Checksum: 0x808A2A26
	Offset: 0x8AC0
	Size: 0x10E
	Parameters: 1
	Flags: Linked
*/
function function_30523221(str_skipto)
{
	var_5ed3cb1c = struct::get_script_bundle_instances("scene", array(str_skipto, "script_objective"));
	foreach(s_scene in var_5ed3cb1c)
	{
		s_scene scene::stop();
		s_scene struct::delete();
		/#
			arrayremovevalue(level.scene_roots, s_scene);
		#/
		waitframe(1);
	}
}

/*
	Name: function_8ca86687
	Namespace: skipto
	Checksum: 0xB5949BF3
	Offset: 0x8BD8
	Size: 0xD0
	Parameters: 1
	Flags: Linked
*/
function function_8ca86687(str_skipto)
{
	a_s_gameobjects = struct::get_array(str_skipto, "script_objective");
	foreach(s_gameobject in a_s_gameobjects)
	{
		if(isdefined(s_gameobject.mdl_gameobject))
		{
			s_gameobject gameobjects::destroy_object(1, 1);
		}
	}
}

/*
	Name: watch_completion
	Namespace: skipto
	Checksum: 0xDF3841EE
	Offset: 0x8CB0
	Size: 0xE0
	Parameters: 1
	Flags: Linked
*/
function watch_completion(name)
{
	first_trigger = undefined;
	objective_triggers = trigger::get_all();
	foreach(trigger in objective_triggers)
	{
		if(trigger.var_4c81bb34 === name)
		{
			if(!isdefined(first_trigger))
			{
				first_trigger = trigger;
			}
			first_trigger thread trigger_wait_completion(trigger, name);
		}
	}
}

/*
	Name: all_players_touching
	Namespace: skipto
	Checksum: 0x88A1CADC
	Offset: 0x8D98
	Size: 0xA2
	Parameters: 1
	Flags: Linked
*/
function all_players_touching(trigger)
{
	foreach(player in getplayers())
	{
		if(!player istouching(trigger))
		{
			return false;
		}
	}
	return true;
}

/*
	Name: trigger_wait_completion
	Namespace: skipto
	Checksum: 0xB07B88C4
	Offset: 0x8E48
	Size: 0x1A4
	Parameters: 2
	Flags: Linked
*/
function trigger_wait_completion(trigger, name)
{
	trigger endon(#"death");
	level endon(name + "_terminate");
	if(trigger.script_noteworthy === "allplayers")
	{
		do
		{
			waitresult = undefined;
			waitresult = trigger waittill(#"trigger");
			player = waitresult.activator;
		}
		while(!all_players_touching(trigger));
	}
	else
	{
		waitresult = undefined;
		waitresult = trigger waittill(#"trigger");
		player = waitresult.activator;
		if(trigger.script_noteworthy === "warpplayers")
		{
			foreach(other_player in level.players)
			{
				if(other_player != player)
				{
					other_player thread catch_up_teleport();
				}
			}
		}
	}
	level thread objective_completed(name, 1, player);
}

/*
	Name: catch_up_teleport
	Namespace: skipto
	Checksum: 0x131B4A11
	Offset: 0x8FF8
	Size: 0x7E
	Parameters: 0
	Flags: Linked
*/
function catch_up_teleport()
{
	self.suicide = 0;
	self.teamkilled = 0;
	timepassed = undefined;
	if(isdefined(self.respawntimerstarttime))
	{
		timepassed = (gettime() - self.respawntimerstarttime) / 1000;
	}
	self notify(#"death");
	self thread [[level.spawnclient]](timepassed);
	self.respawntimerstarttime = undefined;
}

/*
	Name: entity_mover_main
	Namespace: skipto
	Checksum: 0x4C0135FD
	Offset: 0x9080
	Size: 0x218
	Parameters: 0
	Flags: Linked
*/
function entity_mover_main()
{
	entity_movers = struct::get_array("entity_objective_loc");
	foreach(mover in entity_movers)
	{
		if(!isdefined(mover.angles))
		{
			mover.angles = (0, 0, 0);
		}
		if(isdefined(mover.script_objective) && isdefined(level.skipto_settings[mover.script_objective]))
		{
			if(!isdefined(level.skipto_settings[mover.script_objective].ent_movers))
			{
				level.skipto_settings[mover.script_objective].ent_movers = [];
			}
			else if(!isarray(level.skipto_settings[mover.script_objective].ent_movers))
			{
				level.skipto_settings[mover.script_objective].ent_movers = array(level.skipto_settings[mover.script_objective].ent_movers);
			}
			level.skipto_settings[mover.script_objective].ent_movers[level.skipto_settings[mover.script_objective].ent_movers.size] = mover;
		}
	}
	for(;;)
	{
		waitresult = undefined;
		waitresult = level waittill(#"objective_changed");
		entity_mover_use_objectives(waitresult.objectives);
	}
}

/*
	Name: entity_mover_use_objectives
	Namespace: skipto
	Checksum: 0x576B38A7
	Offset: 0x92A0
	Size: 0x10C
	Parameters: 1
	Flags: Linked
*/
function entity_mover_use_objectives(objectives)
{
	foreach(objective in objectives)
	{
		foreach(mover in level.skipto_settings[objective].ent_movers)
		{
			thread apply_mover(mover);
		}
	}
}

/*
	Name: apply_mover
	Namespace: skipto
	Checksum: 0x5D7B4ADC
	Offset: 0x93B8
	Size: 0x48E
	Parameters: 1
	Flags: Linked
*/
function apply_mover(mover)
{
	targets = getentarray(mover.target, "targetname");
	if(isdefined(mover.script_noteworthy) && mover.script_noteworthy == "relative")
	{
		speed = 0;
		if(isdefined(mover.script_int))
		{
			speed = mover.script_int;
		}
		if(speed == 0)
		{
			speed = float(function_60d95f53()) / 1000;
		}
		foreach(target in targets)
		{
			if(!isdefined(target.start_mover))
			{
				target.start_mover = mover;
				target.last_mover = mover;
			}
			else
			{
				start_mover = target.last_mover;
			}
			if(!isdefined(start_mover))
			{
				start_mover = mover;
				speed = float(function_60d95f53()) / 1000;
				continue;
			}
			/#
				assert(start_mover == target.last_mover, "");
			#/
		}
		if(!isdefined(start_mover) || start_mover == mover)
		{
			return;
		}
		script_mover = spawn("script_origin", start_mover.origin);
		script_mover.angles = start_mover.angles;
		foreach(target in targets)
		{
			target linkto(script_mover, "", script_mover worldtolocalcoords(target.origin), target.angles - script_mover.angles);
		}
		util::wait_network_frame();
		script_mover moveto(mover.origin, speed);
		script_mover rotateto(mover.angles, speed);
		script_mover waittill(#"movedone");
		foreach(target in targets)
		{
			target.last_mover = mover;
			target unlink();
		}
		script_mover delete();
	}
	else
	{
		foreach(target in targets)
		{
			target.origin = mover.origin;
			if(isdefined(mover.angles))
			{
				target.angles = mover.angles;
			}
		}
	}
}

/*
	Name: set_final_level
	Namespace: skipto
	Checksum: 0x87E248AF
	Offset: 0x9850
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function set_final_level()
{
	level flag::set("final_level");
}

/*
	Name: is_final_level
	Namespace: skipto
	Checksum: 0x1C7E8CA9
	Offset: 0x9880
	Size: 0x22
	Parameters: 0
	Flags: Linked
*/
function is_final_level()
{
	return level flag::get("final_level");
}

/*
	Name: function_5533c39e
	Namespace: skipto
	Checksum: 0x48F07CD4
	Offset: 0x98B0
	Size: 0x76
	Parameters: 2
	Flags: None
*/
function function_5533c39e(str_skipto, var_5e819c0f)
{
	if(!isdefined(var_5e819c0f))
	{
		var_5e819c0f = 1;
	}
	/#
		assert(isdefined(level.skipto_settings[str_skipto]), "" + str_skipto);
	#/
	level.skipto_settings[str_skipto].var_a3d14b6b = var_5e819c0f;
}

