#using scripts\core_common\audio_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\struct.csc;

#namespace skipto;

/*
	Name: __init__system__
	Namespace: skipto
	Checksum: 0xDC1C5467
	Offset: 0x190
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"skipto", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: skipto
	Checksum: 0x342ECF10
	Offset: 0x1E8
	Size: 0x184
	Parameters: 0
	Flags: Private
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
	load_mission_table(#"hash_42982af1920b8bfd", util::get_map_name());
	level thread watch_players_connect();
	level thread function_17cc9832();
}

/*
	Name: function_8ac3bea9
	Namespace: skipto
	Checksum: 0xA8D65066
	Offset: 0x378
	Size: 0x1C
	Parameters: 0
	Flags: Private
*/
function private function_8ac3bea9()
{
	level thread handle();
}

/*
	Name: add
	Namespace: skipto
	Checksum: 0xE590B201
	Offset: 0x3A0
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
	Checksum: 0x6233134E
	Offset: 0x700
	Size: 0x354
	Parameters: 8
	Flags: None
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
	Checksum: 0x3A70E2C7
	Offset: 0xA60
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
	Checksum: 0x4938C271
	Offset: 0xB48
	Size: 0xC8
	Parameters: 8
	Flags: None
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
	Checksum: 0x4A7B843F
	Offset: 0xC18
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
	Checksum: 0x7F3BF06C
	Offset: 0xDA8
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
	Checksum: 0xF5B63F0C
	Offset: 0xDD0
	Size: 0x1B2
	Parameters: 8
	Flags: None
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
	Checksum: 0xF9CA20A9
	Offset: 0xF90
	Size: 0x6D4
	Parameters: 0
	Flags: None
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
	Checksum: 0xB3A81C57
	Offset: 0x1670
	Size: 0x60
	Parameters: 1
	Flags: None
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
	Checksum: 0x44B4F289
	Offset: 0x16D8
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
	Checksum: 0x9B908A8D
	Offset: 0x1708
	Size: 0x62
	Parameters: 0
	Flags: None
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
	Checksum: 0x81248516
	Offset: 0x1778
	Size: 0x1D0
	Parameters: 0
	Flags: None
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
		skiptos = get_current_skiptos();
		set_level_objective(skiptos, 0);
	}
}

/*
	Name: set_cleanup_func
	Namespace: skipto
	Checksum: 0x89D7C7D8
	Offset: 0x1950
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
	Checksum: 0x55EE8431
	Offset: 0x1978
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
	Checksum: 0xCFB181F6
	Offset: 0x19A0
	Size: 0xF4
	Parameters: 3
	Flags: None
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
	Checksum: 0xBC9B1C48
	Offset: 0x1AA0
	Size: 0x152
	Parameters: 3
	Flags: None
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
	Offset: 0x1C00
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function load_mission_init()
{
}

/*
	Name: wait_for_first_player
	Namespace: skipto
	Checksum: 0xA6ACBD08
	Offset: 0x1C10
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function wait_for_first_player()
{
	level flag::wait_till("skipto_player_connected");
}

/*
	Name: watch_players_connect
	Namespace: skipto
	Checksum: 0x38093AD
	Offset: 0x1C40
	Size: 0x74
	Parameters: 0
	Flags: None
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
	Checksum: 0x57F1080F
	Offset: 0x1CC0
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function on_player_connect(localclientnum)
{
	level flag::set("skipto_player_connected");
}

/*
	Name: set_level_objective
	Namespace: skipto
	Checksum: 0xA18F08A8
	Offset: 0x1CF8
	Size: 0x2B0
	Parameters: 2
	Flags: None
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
	level notify(#"objective_changed", {#objectives:level.skipto_current_objective});
	level.skipto_current_objective = objectives;
}

/*
	Name: run_initial_logic
	Namespace: skipto
	Checksum: 0x9EA46872
	Offset: 0x1FB0
	Size: 0xCC
	Parameters: 1
	Flags: None
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
	Checksum: 0x79B95BFE
	Offset: 0x2088
	Size: 0x1EC
	Parameters: 2
	Flags: None
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
	Checksum: 0xE6DF9C10
	Offset: 0x2280
	Size: 0x94
	Parameters: 2
	Flags: Private
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
	Checksum: 0xA8BE4990
	Offset: 0x2320
	Size: 0x82
	Parameters: 0
	Flags: None
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
	Checksum: 0xD75F1B6B
	Offset: 0x23B0
	Size: 0x29C
	Parameters: 2
	Flags: None
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
	Checksum: 0x25891992
	Offset: 0x2658
	Size: 0x7C
	Parameters: 7
	Flags: None
*/
function set_last_map_dvar(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	var_1fdcd030 = util::get_map_name();
	setdvar(#"last_map", var_1fdcd030);
}

/*
	Name: standard_objective_init
	Namespace: skipto
	Checksum: 0x45C98872
	Offset: 0x26E0
	Size: 0x14
	Parameters: 2
	Flags: Private
*/
function private standard_objective_init(objective, starting)
{
}

/*
	Name: standard_objective_done
	Namespace: skipto
	Checksum: 0x70792D25
	Offset: 0x2700
	Size: 0x14
	Parameters: 2
	Flags: Private
*/
function private standard_objective_done(objective, starting)
{
}

/*
	Name: catch_up_transition
	Namespace: skipto
	Checksum: 0x8D0451F7
	Offset: 0x2720
	Size: 0x5C
	Parameters: 7
	Flags: None
*/
function catch_up_transition(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	postfx::playpostfxbundle(#"hash_4c8b84239d3d1056");
}

/*
	Name: function_17cc9832
	Namespace: skipto
	Checksum: 0x99B0C69A
	Offset: 0x2788
	Size: 0x1C
	Parameters: 0
	Flags: None
*/
function function_17cc9832()
{
	level waittill(#"aar");
}

