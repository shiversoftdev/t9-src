#using scripts\core_common\array_shared.csc;
#using scripts\core_common\audio_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace skipto;

/*
	Name: function_b63bf986
	Namespace: skipto
	Checksum: 0x9008FA52
	Offset: 0x190
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b63bf986()
{
	level notify(142083565);
}

/*
	Name: function_89f2df9
	Namespace: skipto
	Checksum: 0xCCEBA3BF
	Offset: 0x1B0
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"skipto", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: skipto
	Checksum: 0xC0C47970
	Offset: 0x208
	Size: 0x184
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level flag::init("level_has_skiptos");
	level flag::init("level_has_skipto_branches");
	level.skipto_current_objective = [];
	clientfield::register("toplayer", "catch_up_transition", 1, 1, "counter", &catch_up_transition, 0, 0);
	clientfield::register("world", "set_last_map_dvar", 1, 1, "counter", &set_last_map_dvar, 0, 0);
	level.default_skipto = "_default";
	add_internal("_default");
	add_internal("no_game");
	load_mission_table(#"hash_42982af1920b8bfd", util::function_53bbf9d2());
	level thread watch_players_connect();
	level thread function_17cc9832();
}

/*
	Name: function_8ac3bea9
	Namespace: skipto
	Checksum: 0xE25C242C
	Offset: 0x398
	Size: 0x1C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ac3bea9()
{
	level thread handle();
}

/*
	Name: add
	Namespace: skipto
	Checksum: 0x8215C453
	Offset: 0x3C0
	Size: 0x354
	Parameters: 6
	Flags: None
*/
function add(skipto, var_e784b061, var_dde96e3b, var_48a6b9bd, loc_string, cleanup_func)
{
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
	if(!isdefined(var_e784b061))
	{
		/#
			assert(isdefined(var_e784b061), "");
		#/
	}
	struct = add_internal(skipto, var_e784b061, var_dde96e3b, var_48a6b9bd, loc_string, cleanup_func, launch_after, undefined);
	struct.public = 1;
	level flag::set("level_has_skiptos");
}

/*
	Name: add_branch
	Namespace: skipto
	Checksum: 0x8BC8702A
	Offset: 0x720
	Size: 0x354
	Parameters: 8
	Flags: Linked
*/
function add_branch(skipto, var_e784b061, var_dde96e3b, var_48a6b9bd, loc_string, cleanup_func, launch_after, end_before)
{
	if(!isdefined(level.default_skipto))
	{
		level.default_skipto = skipto;
	}
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
	struct = add_internal(skipto, var_e784b061, var_dde96e3b, var_48a6b9bd, loc_string, cleanup_func, launch_after, end_before);
	struct.public = 1;
	level flag::set("level_has_skiptos");
	level flag::set("level_has_skipto_branches");
}

/*
	Name: add_dev
	Namespace: skipto
	Checksum: 0x5484A92B
	Offset: 0xA80
	Size: 0xDC
	Parameters: 8
	Flags: None
*/
function add_dev(skipto, var_e784b061, var_dde96e3b, var_48a6b9bd, loc_string, cleanup_func, launch_after, end_before)
{
	if(!isdefined(level.default_skipto))
	{
		level.default_skipto = skipto;
	}
	if(is_dev(skipto))
	{
		struct = add_internal(skipto, var_e784b061, var_dde96e3b, var_48a6b9bd, loc_string, cleanup_func, launch_after, end_before);
		struct.dev_skipto = 1;
		return;
	}
	/#
		errormsg("");
	#/
}

/*
	Name: add_internal
	Namespace: skipto
	Checksum: 0xE0B8292F
	Offset: 0xB68
	Size: 0xC8
	Parameters: 8
	Flags: Linked
*/
function add_internal(msg, var_e784b061, var_dde96e3b, var_48a6b9bd, loc_string, cleanup_func, launch_after, end_before)
{
	/#
		assert(!isdefined(level._loadstarted), "");
	#/
	msg = tolower(msg);
	struct = add_construct(msg, var_e784b061, var_dde96e3b, var_48a6b9bd, loc_string, cleanup_func, launch_after, end_before);
	level.skipto_settings[msg] = struct;
	return struct;
}

/*
	Name: change
	Namespace: skipto
	Checksum: 0xE406823F
	Offset: 0xC38
	Size: 0x182
	Parameters: 8
	Flags: None
*/
function change(msg, var_e784b061, var_dde96e3b, var_48a6b9bd, loc_string, cleanup_func, launch_after, end_before)
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
	if(isdefined(var_48a6b9bd))
	{
		struct.var_48a6b9bd = var_48a6b9bd;
	}
	if(isdefined(loc_string))
	{
		struct.skipto_loc_string = loc_string;
	}
	if(isdefined(cleanup_func))
	{
		struct.cleanup_func = cleanup_func;
	}
	if(isdefined(launch_after))
	{
		if(!isdefined(struct.launch_after))
		{
			struct.launch_after = [];
		}
		else if(!isarray(struct.launch_after))
		{
			struct.launch_after = array(struct.launch_after);
		}
		struct.launch_after[struct.launch_after.size] = launch_after;
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
	Checksum: 0xC4AA48E0
	Offset: 0xDC8
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
	Checksum: 0xB2AF4CA5
	Offset: 0xDF0
	Size: 0x1B2
	Parameters: 8
	Flags: Linked
*/
function add_construct(msg, var_e784b061, var_dde96e3b, var_48a6b9bd, loc_string, cleanup_func, launch_after, end_before)
{
	struct = spawnstruct();
	struct.name = msg;
	struct.var_2c183249 = var_e784b061;
	struct.var_4c644f8d = var_dde96e3b;
	struct.var_48a6b9bd = var_48a6b9bd;
	struct.skipto_loc_string = loc_string;
	struct.cleanup_func = cleanup_func;
	struct.next = [];
	struct.prev = [];
	struct.completion_conditions = "";
	struct.launch_after = [];
	if(isdefined(launch_after))
	{
		if(!isdefined(struct.launch_after))
		{
			struct.launch_after = [];
		}
		else if(!isarray(struct.launch_after))
		{
			struct.launch_after = array(struct.launch_after);
		}
		struct.launch_after[struct.launch_after.size] = launch_after;
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
	Name: build_objective_tree
	Namespace: skipto
	Checksum: 0xFE9FB5D6
	Offset: 0xFB0
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
	Name: is_dev
	Namespace: skipto
	Checksum: 0x783AB360
	Offset: 0x1690
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
	Name: level_has_skipto_points
	Namespace: skipto
	Checksum: 0x13BD705C
	Offset: 0x16F8
	Size: 0x22
	Parameters: 0
	Flags: None
*/
function level_has_skipto_points()
{
	return level flag::get("level_has_skiptos");
}

/*
	Name: get_current_skiptos
	Namespace: skipto
	Checksum: 0x49A6FE64
	Offset: 0x1728
	Size: 0x62
	Parameters: 0
	Flags: Linked
*/
function get_current_skiptos()
{
	skiptos = tolower(getskiptos());
	result = strtok(skiptos, ",");
	return result;
}

/*
	Name: handle
	Namespace: skipto
	Checksum: 0x88192E51
	Offset: 0x1798
	Size: 0x1C0
	Parameters: 0
	Flags: Linked
*/
function handle()
{
	wait_for_first_player();
	build_objective_tree();
	run_initial_logic();
	skiptos = get_current_skiptos();
	foreach(str_skipto in skiptos)
	{
		if(isdefined(level.skipto_settings[str_skipto]))
		{
			var_48a6b9bd = level.skipto_settings[str_skipto].var_48a6b9bd;
			if(isdefined(var_48a6b9bd) && !isinarray(skiptos, var_48a6b9bd))
			{
				if(!isdefined(skiptos))
				{
					skiptos = [];
				}
				else if(!isarray(skiptos))
				{
					skiptos = array(skiptos);
				}
				skiptos[skiptos.size] = var_48a6b9bd;
			}
		}
	}
	set_level_objective(skiptos, 1);
	while(true)
	{
		level waittill(#"skiptos_changed");
		level thread function_4fcf7c1();
	}
}

/*
	Name: function_4fcf7c1
	Namespace: skipto
	Checksum: 0x6A89D6BC
	Offset: 0x1960
	Size: 0x3C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_4fcf7c1()
{
	waitframe(1);
	skiptos = get_current_skiptos();
	set_level_objective(skiptos, 0);
}

/*
	Name: set_cleanup_func
	Namespace: skipto
	Checksum: 0xB3DD339C
	Offset: 0x19A8
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
	Checksum: 0x4CD348D2
	Offset: 0x19D0
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
	Checksum: 0x655D0D25
	Offset: 0x19F8
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
	Checksum: 0x293A0B4A
	Offset: 0x1AF8
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
	Offset: 0x1C58
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function load_mission_init()
{
}

/*
	Name: wait_for_first_player
	Namespace: skipto
	Checksum: 0x3BA49402
	Offset: 0x1C68
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function wait_for_first_player()
{
	level flag::wait_till("skipto_player_connected");
}

/*
	Name: watch_players_connect
	Namespace: skipto
	Checksum: 0x25AC8289
	Offset: 0x1C98
	Size: 0x74
	Parameters: 0
	Flags: Linked
*/
function watch_players_connect()
{
	if(!level flag::exists("skipto_player_connected"))
	{
		level flag::init("skipto_player_connected");
	}
	callback::add_callback(#"on_localclient_connect", &on_player_connect);
}

/*
	Name: on_player_connect
	Namespace: skipto
	Checksum: 0xDD75D0C9
	Offset: 0x1D18
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function on_player_connect(localclientnum)
{
	level flag::set("skipto_player_connected");
}

/*
	Name: set_level_objective
	Namespace: skipto
	Checksum: 0x3604FD2F
	Offset: 0x1D50
	Size: 0x2B0
	Parameters: 2
	Flags: Linked
*/
function set_level_objective(objectives, starting)
{
	clear_recursion();
	if(starting)
	{
		foreach(objective in objectives)
		{
			if(isdefined(level.skipto_settings[objective]))
			{
				stop_objective_logic(level.skipto_settings[objective].prev, starting);
			}
		}
	}
	else
	{
		foreach(skipto in level.skipto_settings)
		{
			if(is_true(skipto.objective_running) && !isinarray(objectives, skipto.name))
			{
				stop_objective_logic(skipto.name, starting);
			}
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
	level.skipto_current_objective = objectives;
	level notify(#"objective_changed", {#objectives:level.skipto_current_objective});
}

/*
	Name: run_initial_logic
	Namespace: skipto
	Checksum: 0x537F7CF0
	Offset: 0x2008
	Size: 0xCC
	Parameters: 1
	Flags: Linked
*/
function run_initial_logic(objectives)
{
	foreach(skipto in level.skipto_settings)
	{
		if(!is_true(skipto.logic_running))
		{
			skipto.logic_running = 1;
			if(isdefined(skipto.logic_func))
			{
				thread [[skipto.logic_func]](skipto.name);
			}
		}
	}
}

/*
	Name: start_objective_logic
	Namespace: skipto
	Checksum: 0x92C66FF9
	Offset: 0x20E0
	Size: 0x1EC
	Parameters: 2
	Flags: Linked
*/
function start_objective_logic(name, starting)
{
	if(isarray(name))
	{
		foreach(element in name)
		{
			start_objective_logic(element, starting);
		}
	}
	else if(isdefined(level.skipto_settings[name]))
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
			standard_objective_init(name, starting);
			level thread function_b7e9926c(name, starting);
		}
	}
}

/*
	Name: function_b7e9926c
	Namespace: skipto
	Checksum: 0xFF47BD45
	Offset: 0x22D8
	Size: 0x94
	Parameters: 2
	Flags: Linked, Private
*/
function private function_b7e9926c(name, starting)
{
	if(starting)
	{
		if(isdefined(level.skipto_settings[name].var_4c644f8d))
		{
			[[level.skipto_settings[name].var_4c644f8d]](name);
		}
	}
	if(isdefined(level.skipto_settings[name].var_2c183249))
	{
		[[level.skipto_settings[name].var_2c183249]](name);
	}
}

/*
	Name: clear_recursion
	Namespace: skipto
	Checksum: 0xACC2CC5
	Offset: 0x2378
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
	Checksum: 0x6B68E2E1
	Offset: 0x2408
	Size: 0x29C
	Parameters: 2
	Flags: Linked
*/
function stop_objective_logic(name, starting)
{
	if(isarray(name))
	{
		foreach(element in name)
		{
			stop_objective_logic(element, starting);
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
			if(isdefined(level.skipto_settings[name].cleanup_func))
			{
				thread [[level.skipto_settings[name].cleanup_func]](name, starting);
			}
			standard_objective_done(name, starting);
			level notify(name + "_terminate");
		}
		if(starting && !is_true(level.skipto_settings[name].cleanup_recursion))
		{
			level.skipto_settings[name].cleanup_recursion = 1;
			stop_objective_logic(level.skipto_settings[name].prev, starting);
			if(!cleaned)
			{
				if(isdefined(level.skipto_settings[name].cleanup_func))
				{
					thread [[level.skipto_settings[name].cleanup_func]](name, starting);
				}
				standard_objective_done(name, starting);
			}
		}
	}
}

/*
	Name: set_last_map_dvar
	Namespace: skipto
	Checksum: 0xEB20CAA6
	Offset: 0x26B0
	Size: 0x7C
	Parameters: 7
	Flags: Linked
*/
function set_last_map_dvar(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	var_1fdcd030 = util::function_53bbf9d2();
	setdvar(#"last_map", var_1fdcd030);
}

/*
	Name: standard_objective_init
	Namespace: skipto
	Checksum: 0xB69BA8C1
	Offset: 0x2738
	Size: 0x14
	Parameters: 2
	Flags: Linked, Private
*/
function private standard_objective_init(objective, starting)
{
}

/*
	Name: standard_objective_done
	Namespace: skipto
	Checksum: 0xB71A53E2
	Offset: 0x2758
	Size: 0x14
	Parameters: 2
	Flags: Linked, Private
*/
function private standard_objective_done(objective, starting)
{
}

/*
	Name: catch_up_transition
	Namespace: skipto
	Checksum: 0x5473DF0A
	Offset: 0x2778
	Size: 0x5C
	Parameters: 7
	Flags: Linked
*/
function catch_up_transition(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	postfx::playpostfxbundle(#"hash_4c8b84239d3d1056");
}

/*
	Name: function_17cc9832
	Namespace: skipto
	Checksum: 0xA7AF597D
	Offset: 0x27E0
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function function_17cc9832()
{
	level waittill(#"aar");
}

