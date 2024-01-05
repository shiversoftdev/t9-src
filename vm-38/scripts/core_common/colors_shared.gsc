#using scripts\core_common\struct.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\ai\archetype_utility.gsc;
#using scripts\core_common\ai_shared.gsc;

#namespace colors_shared;

/*
	Name: function_7af779fe
	Namespace: colors_shared
	Checksum: 0x888936D9
	Offset: 0x198
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_7af779fe()
{
	level notify(2049410562);
}

#namespace colors;

/*
	Name: __init__system__
	Namespace: colors
	Checksum: 0xCF03E250
	Offset: 0x1B8
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"colors", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: colors
	Checksum: 0xC6FDA811
	Offset: 0x210
	Size: 0xAEC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	nodes = getallnodes();
	level flag::init("player_looks_away_from_spawner");
	level flag::init("friendly_spawner_locked");
	level flag::init("respawn_friendlies");
	level.arrays_of_colorcoded_nodes = [];
	level.arrays_of_colorcoded_nodes[#"axis"] = [];
	level.arrays_of_colorcoded_nodes[#"allies"] = [];
	level.arrays_of_colorcoded_nodes[#"team3"] = [];
	level.colorcoded_volumes = [];
	level.colorcoded_volumes[#"axis"] = [];
	level.colorcoded_volumes[#"allies"] = [];
	level.colorcoded_volumes[#"team3"] = [];
	volumes = getentarray("info_volume", "classname");
	for(i = 0; i < nodes.size; i++)
	{
		if(isdefined(nodes[i].script_color_allies))
		{
			nodes[i] add_node_to_global_arrays(nodes[i].script_color_allies, #"allies");
		}
		if(isdefined(nodes[i].script_color_axis))
		{
			nodes[i] add_node_to_global_arrays(nodes[i].script_color_axis, #"axis");
		}
		if(isdefined(nodes[i].var_15eb6ad5))
		{
			nodes[i] add_node_to_global_arrays(nodes[i].var_15eb6ad5, #"team3");
		}
	}
	for(i = 0; i < volumes.size; i++)
	{
		if(isdefined(volumes[i].script_color_allies))
		{
			volumes[i] add_volume_to_global_arrays(volumes[i].script_color_allies, #"allies");
		}
		if(isdefined(volumes[i].script_color_axis))
		{
			volumes[i] add_volume_to_global_arrays(volumes[i].script_color_axis, #"axis");
		}
		if(isdefined(volumes[i].var_15eb6ad5))
		{
			volumes[i] add_volume_to_global_arrays(volumes[i].var_15eb6ad5, #"team3");
		}
	}
	/#
		level.colornodes_debug_array = [];
		level.colornodes_debug_array[#"allies"] = [];
		level.colornodes_debug_array[#"axis"] = [];
		level.colornodes_debug_array[#"team3"] = [];
	#/
	level.color_node_type_function = [];
	add_cover_node(#"bad node");
	add_cover_node(#"cover stand");
	add_cover_node(#"cover crouch");
	add_cover_node(#"cover prone");
	add_cover_node(#"cover crouch window");
	add_cover_node(#"cover right");
	add_cover_node(#"cover left");
	add_cover_node(#"hash_22a0cbc4c551a678");
	add_cover_node(#"hash_4c95cba4aba377ad");
	add_cover_node(#"cover pillar");
	add_cover_node(#"conceal stand");
	add_cover_node(#"conceal crouch");
	add_cover_node(#"conceal prone");
	add_cover_node(#"reacquire");
	add_cover_node(#"balcony");
	add_cover_node(#"scripted");
	add_cover_node(#"begin");
	add_cover_node(#"end");
	add_cover_node(#"turret");
	add_path_node(#"guard");
	add_path_node(#"exposed");
	add_path_node(#"path");
	level.colorlist = [];
	level.colorlist[level.colorlist.size] = "r";
	level.colorlist[level.colorlist.size] = "b";
	level.colorlist[level.colorlist.size] = "y";
	level.colorlist[level.colorlist.size] = "c";
	level.colorlist[level.colorlist.size] = "g";
	level.colorlist[level.colorlist.size] = "p";
	level.colorlist[level.colorlist.size] = "o";
	level.colorchecklist[#"red"] = "r";
	level.colorchecklist[#"r"] = "r";
	level.colorchecklist[#"blue"] = "b";
	level.colorchecklist[#"b"] = "b";
	level.colorchecklist[#"yellow"] = "y";
	level.colorchecklist[#"y"] = "y";
	level.colorchecklist[#"cyan"] = "c";
	level.colorchecklist[#"c"] = "c";
	level.colorchecklist[#"green"] = "g";
	level.colorchecklist[#"g"] = "g";
	level.colorchecklist[#"purple"] = "p";
	level.colorchecklist[#"p"] = "p";
	level.colorchecklist[#"orange"] = "o";
	level.colorchecklist[#"o"] = "o";
	level.currentcolorforced = [];
	level.currentcolorforced[#"allies"] = [];
	level.currentcolorforced[#"axis"] = [];
	level.currentcolorforced[#"team3"] = [];
	level.lastcolorforced = [];
	level.lastcolorforced[#"allies"] = [];
	level.lastcolorforced[#"axis"] = [];
	level.lastcolorforced[#"team3"] = [];
	for(i = 0; i < level.colorlist.size; i++)
	{
		level.arrays_of_colorforced_ai[#"allies"][level.colorlist[i]] = [];
		level.arrays_of_colorforced_ai[#"axis"][level.colorlist[i]] = [];
		level.arrays_of_colorforced_ai[#"team3"][level.colorlist[i]] = [];
		level.currentcolorforced[#"allies"][level.colorlist[i]] = undefined;
		level.currentcolorforced[#"axis"][level.colorlist[i]] = undefined;
		level.currentcolorforced[#"team3"][level.colorlist[i]] = undefined;
	}
	/#
		thread debugdvars();
		thread debugcolorfriendlies();
	#/
	level.var_a6112e7 = 8;
}

/*
	Name: function_8ac3bea9
	Namespace: colors
	Checksum: 0x334626C5
	Offset: 0xD08
	Size: 0x120
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ac3bea9()
{
	foreach(trig in trigger::get_all())
	{
		if(isdefined(trig.script_color_allies))
		{
			trig thread trigger_issues_orders(trig.script_color_allies, #"allies");
		}
		if(isdefined(trig.script_color_axis))
		{
			trig thread trigger_issues_orders(trig.script_color_axis, #"axis");
		}
		if(isdefined(trig.var_15eb6ad5))
		{
			trig thread trigger_issues_orders(trig.var_15eb6ad5, #"team3");
		}
	}
}

/*
	Name: debugdvars
	Namespace: colors
	Checksum: 0xB3182557
	Offset: 0xE30
	Size: 0x56
	Parameters: 0
	Flags: None
*/
function debugdvars()
{
	/#
		while(true)
		{
			if(getdvar(#"debug_colornodes", 0) > 0)
			{
				thread debug_colornodes();
			}
			waitframe(1);
		}
	#/
}

/*
	Name: get_team_substr
	Namespace: colors
	Checksum: 0x26A8CCC0
	Offset: 0xE90
	Size: 0x88
	Parameters: 0
	Flags: None
*/
function get_team_substr()
{
	/#
		if(self.team == #"allies")
		{
			if(!isdefined(self.node.script_color_allies_old))
			{
				return;
			}
			return self.node.script_color_allies_old;
		}
		if(self.team == #"axis")
		{
			if(!isdefined(self.node.script_color_axis_old))
			{
				return;
			}
			return self.node.script_color_axis_old;
		}
	#/
}

/*
	Name: try_to_draw_line_to_node
	Namespace: colors
	Checksum: 0xF0124EAB
	Offset: 0xF20
	Size: 0x11C
	Parameters: 0
	Flags: None
*/
function try_to_draw_line_to_node()
{
	/#
		if(!isdefined(self.node))
		{
			return;
		}
		if(!isdefined(self.script_forcecolor))
		{
			return;
		}
		substr = get_team_substr();
		if(!isdefined(substr))
		{
			return;
		}
		if(!issubstr(substr, self.script_forcecolor))
		{
			return;
		}
		recordline(self.origin + vectorscale((0, 0, 1), 25), self.node.origin, _get_debug_color(self.script_forcecolor), "", self);
		line(self.origin + vectorscale((0, 0, 1), 25), self.node.origin, _get_debug_color(self.script_forcecolor));
	#/
}

/*
	Name: _get_debug_color
	Namespace: colors
	Checksum: 0x76199EFA
	Offset: 0x1048
	Size: 0x1A2
	Parameters: 1
	Flags: None
*/
function _get_debug_color(str_color)
{
	/#
		switch(str_color)
		{
			case "red":
			case "r":
			{
				return (1, 0, 0);
				break;
			}
			case "green":
			case "g":
			{
				return (0, 1, 0);
				break;
			}
			case "b":
			case "blue":
			{
				return (0, 0, 1);
				break;
			}
			case "yellow":
			case "y":
			{
				return (1, 1, 0);
				break;
			}
			case "orange":
			case "o":
			{
				return (1, 0.5, 0);
				break;
			}
			case "c":
			case "cyan":
			{
				return (0, 1, 1);
				break;
			}
			case "purple":
			case "p":
			{
				return (1, 0, 1);
				break;
			}
			default:
			{
				println(("" + str_color) + "");
				return (0, 0, 0);
				break;
			}
		}
	#/
}

/*
	Name: debug_colornodes
	Namespace: colors
	Checksum: 0x9C8B35A9
	Offset: 0x11F8
	Size: 0x2A4
	Parameters: 0
	Flags: None
*/
function debug_colornodes()
{
	/#
		array = [];
		array[#"axis"] = [];
		array[#"allies"] = [];
		array[#"team3"] = [];
		aiarray = arraycombine(getplayers(), getaiarray(), 0, 0);
		foreach(ai in aiarray)
		{
			if(!isdefined(ai.currentcolorcode) || (!isai(ai) && !isbot(ai)) || !isdefined(array[ai.team]))
			{
				continue;
			}
			array[ai.team][ai.currentcolorcode] = 1;
			color = (1, 1, 1);
			if(isdefined(ai.script_forcecolor))
			{
				color = _get_debug_color(ai.script_forcecolor);
			}
			recordenttext(ai.currentcolorcode, ai, color, "");
			print3d(ai.origin + vectorscale((0, 0, 1), 25), ai.currentcolorcode, color, 1, 0.7);
			ai try_to_draw_line_to_node();
		}
		draw_colornodes(array, #"allies");
		draw_colornodes(array, #"axis");
		draw_colornodes(array, #"team3");
	#/
}

/*
	Name: draw_colornodes
	Namespace: colors
	Checksum: 0xB5DC990A
	Offset: 0x14A8
	Size: 0x2C0
	Parameters: 2
	Flags: None
*/
function draw_colornodes(array, team)
{
	/#
		foreach(v in array[team])
		{
			color = _get_debug_color(function_9e72a96(k)[0]);
			if(isdefined(level.colornodes_debug_array[team][k]))
			{
				a_team_nodes = level.colornodes_debug_array[team][k];
				for(p = 0; p < a_team_nodes.size; p++)
				{
					print3d(a_team_nodes[p].origin, "" + function_9e72a96(k), color, 1, 0.7);
					if(getdvar(#"debug_colornodes", 0) == 2 && isdefined(a_team_nodes[p].script_color_allies_old))
					{
						if(isdefined(a_team_nodes[p].color_user) && isalive(a_team_nodes[p].color_user) && isdefined(a_team_nodes[p].color_user.script_forcecolor))
						{
							print3d(a_team_nodes[p].origin + (vectorscale((0, 0, -1), 5)), "" + a_team_nodes[p].script_color_allies_old, _get_debug_color(a_team_nodes[p].color_user.script_forcecolor), 0.5, 0.4);
							continue;
						}
						print3d(a_team_nodes[p].origin + (vectorscale((0, 0, -1), 5)), "" + a_team_nodes[p].script_color_allies_old, color, 0.5, 0.4);
					}
				}
			}
		}
	#/
}

/*
	Name: debugcolorfriendlies
	Namespace: colors
	Checksum: 0xEA3B79F4
	Offset: 0x1770
	Size: 0x60
	Parameters: 0
	Flags: None
*/
function debugcolorfriendlies()
{
	/#
		level.debug_color_friendlies = [];
		level.debug_color_huds = [];
		level thread debugcolorfriendliestogglewatch();
		for(;;)
		{
			level waittill(#"updated_color_friendlies");
			draw_color_friendlies();
		}
	#/
}

/*
	Name: debugcolorfriendliestogglewatch
	Namespace: colors
	Checksum: 0x8E96C231
	Offset: 0x17D8
	Size: 0xE8
	Parameters: 0
	Flags: None
*/
function debugcolorfriendliestogglewatch()
{
	/#
		just_turned_on = 0;
		just_turned_off = 0;
		while(true)
		{
			if(getdvar(#"debug_colornodes", 0) == 1 && !just_turned_on)
			{
				just_turned_on = 1;
				just_turned_off = 0;
				draw_color_friendlies();
			}
			if(getdvar(#"debug_colornodes", 0) != 1 && !just_turned_off)
			{
				just_turned_off = 1;
				just_turned_on = 0;
				draw_color_friendlies();
			}
			wait(0.25);
		}
	#/
}

/*
	Name: get_script_palette
	Namespace: colors
	Checksum: 0x57C769C9
	Offset: 0x18C8
	Size: 0xD4
	Parameters: 0
	Flags: None
*/
function get_script_palette()
{
	/#
		rgb = [];
		rgb[#"r"] = (1, 0, 0);
		rgb[#"o"] = (1, 0.5, 0);
		rgb[#"y"] = (1, 1, 0);
		rgb[#"g"] = (0, 1, 0);
		rgb[#"c"] = (0, 1, 1);
		rgb[#"b"] = (0, 0, 1);
		rgb[#"p"] = (1, 0, 1);
		return rgb;
	#/
}

/*
	Name: draw_color_friendlies
	Namespace: colors
	Checksum: 0x662E7114
	Offset: 0x19A8
	Size: 0x34A
	Parameters: 0
	Flags: None
*/
function draw_color_friendlies()
{
	/#
		level endon(#"updated_color_friendlies");
		colored_friendlies = [];
		colors = [];
		colors[colors.size] = "";
		colors[colors.size] = "";
		colors[colors.size] = "";
		colors[colors.size] = "";
		colors[colors.size] = "";
		colors[colors.size] = "";
		colors[colors.size] = "";
		rgb = get_script_palette();
		for(i = 0; i < colors.size; i++)
		{
			colored_friendlies[colors[i]] = 0;
		}
		foreach(color in level.debug_color_friendlies)
		{
			colored_friendlies[color]++;
		}
		for(i = 0; i < level.debug_color_huds.size; i++)
		{
			level.debug_color_huds[i] destroy();
		}
		level.debug_color_huds = [];
		if(getdvar(#"debug_colornodes", 0) != 1)
		{
			return;
		}
		y = 365;
		for(i = 0; i < colors.size; i++)
		{
			if(colored_friendlies[colors[i]] <= 0)
			{
				continue;
			}
			for(p = 0; p < colored_friendlies[colors[i]]; p++)
			{
				overlay = newdebughudelem();
				overlay.x = 15 + (25 * p);
				overlay.y = y;
				overlay setshader(#"white", 16, 16);
				overlay.alignx = "";
				overlay.aligny = "";
				overlay.alpha = 1;
				overlay.color = rgb[colors[i]];
				level.debug_color_huds[level.debug_color_huds.size] = overlay;
			}
			y = y + 25;
		}
	#/
}

/*
	Name: player_init_color_grouping
	Namespace: colors
	Checksum: 0x1448711B
	Offset: 0x1D00
	Size: 0x14
	Parameters: 0
	Flags: None
*/
function player_init_color_grouping()
{
	thread player_color_node();
}

/*
	Name: convert_color_to_short_string
	Namespace: colors
	Checksum: 0xD4F37C5D
	Offset: 0x1D20
	Size: 0x1E
	Parameters: 0
	Flags: None
*/
function convert_color_to_short_string()
{
	self.script_forcecolor = level.colorchecklist[self.script_forcecolor];
}

/*
	Name: goto_current_colorindex
	Namespace: colors
	Checksum: 0x1F356B90
	Offset: 0x1D48
	Size: 0x294
	Parameters: 0
	Flags: Linked
*/
function goto_current_colorindex()
{
	if(!isdefined(self.currentcolorcode))
	{
		return;
	}
	nodes = level.arrays_of_colorcoded_nodes[self.team][self.currentcolorcode];
	if(!isdefined(nodes))
	{
		nodes = [];
	}
	else if(!isarray(nodes))
	{
		nodes = array(nodes);
	}
	nodes[nodes.size] = level.colorcoded_volumes[self.team][self.currentcolorcode];
	self left_color_node();
	if(!isalive(self))
	{
		return;
	}
	if(!has_color())
	{
		return;
	}
	selectednode = undefined;
	if(nodes.size >= 1 && isdefined(nodes[0].classname) && nodes[0].classname == "info_volume")
	{
		selectednode = nodes[randomint(nodes.size)];
	}
	else
	{
		for(i = 0; i < nodes.size; i++)
		{
			node = nodes[i];
			if(isalive(node.color_user) && !isplayer(node.color_user))
			{
				continue;
			}
			selectednode = node;
			break;
		}
	}
	if(isdefined(selectednode))
	{
		self thread ai_sets_goal_with_delay(selectednode);
		thread decrementcolorusers(selectednode);
		return;
	}
	/#
		if(isbot(self))
		{
			println(("" + self.name) + "");
		}
		else
		{
			println(("" + self.export) + "");
		}
	#/
}

/*
	Name: function_4156cb7d
	Namespace: colors
	Checksum: 0x9CA0691
	Offset: 0x1FE8
	Size: 0x1AE
	Parameters: 2
	Flags: None
*/
function function_4156cb7d(var_e6f7de4c, str_team)
{
	color = undefined;
	foreach(color in level.colorlist)
	{
		if(issubstr(var_e6f7de4c, color))
		{
			break;
		}
		color = undefined;
	}
	/#
		assert(isdefined(color), ("" + str_team) + "");
	#/
	level.currentcolorforced[str_team][var_e6f7de4c] = undefined;
	level.lastcolorforced[str_team][var_e6f7de4c] = undefined;
	ai = level.arrays_of_colorforced_ai[str_team][var_e6f7de4c];
	foreach(guy in ai)
	{
		if(isdefined(guy) && isalive(guy))
		{
			guy.currentcolorcode = undefined;
		}
	}
}

/*
	Name: get_color_list
	Namespace: colors
	Checksum: 0x70333887
	Offset: 0x21A0
	Size: 0xA2
	Parameters: 0
	Flags: Linked
*/
function get_color_list()
{
	colorlist = [];
	colorlist[colorlist.size] = "r";
	colorlist[colorlist.size] = "b";
	colorlist[colorlist.size] = "y";
	colorlist[colorlist.size] = "c";
	colorlist[colorlist.size] = "g";
	colorlist[colorlist.size] = "p";
	colorlist[colorlist.size] = "o";
	return colorlist;
}

/*
	Name: get_colorcodes_from_trigger
	Namespace: colors
	Checksum: 0xD2B5C0EC
	Offset: 0x2250
	Size: 0x26C
	Parameters: 2
	Flags: Linked
*/
function get_colorcodes_from_trigger(color_team, team)
{
	colorcodes = strtok(color_team, " ");
	colors = [];
	colorcodesbycolorindex = [];
	usable_colorcodes = [];
	colorlist = get_color_list();
	for(i = 0; i < colorcodes.size; i++)
	{
		var_e28d72e9 = "";
		if(strstartswith(colorcodes[i], "pf"))
		{
			var_e28d72e9 = "_";
		}
		color = undefined;
		for(p = 0; p < colorlist.size; p++)
		{
			if(issubstr(colorcodes[i], var_e28d72e9 + colorlist[p]))
			{
				color = colorlist[p];
				break;
			}
		}
		if(!isdefined(level.arrays_of_colorcoded_nodes[team][colorcodes[i]]) && !isdefined(level.colorcoded_volumes[team][colorcodes[i]]))
		{
			continue;
		}
		/#
			assert(isdefined(color), (("" + self getorigin()) + "") + colorcodes[i]);
		#/
		colorcodesbycolorindex[color] = colorcodes[i];
		colors[colors.size] = color;
		usable_colorcodes[usable_colorcodes.size] = colorcodes[i];
	}
	colorcodes = usable_colorcodes;
	array = [];
	array[#"colorcodes"] = colorcodes;
	array[#"colorcodesbycolorindex"] = colorcodesbycolorindex;
	array[#"colors"] = colors;
	return array;
}

/*
	Name: trigger_issues_orders
	Namespace: colors
	Checksum: 0xC23A2F3
	Offset: 0x24C8
	Size: 0x140
	Parameters: 2
	Flags: Linked
*/
function trigger_issues_orders(color_team, team)
{
	self endon(#"death");
	array = get_colorcodes_from_trigger(color_team, team);
	colorcodes = array[#"colorcodes"];
	colorcodesbycolorindex = array[#"colorcodesbycolorindex"];
	colors = array[#"colors"];
	for(;;)
	{
		self waittill(#"trigger");
		if(isdefined(self.activated_color_trigger))
		{
			self.activated_color_trigger = undefined;
			continue;
		}
		if(!isdefined(self.color_enabled) || (isdefined(self.color_enabled) && self.color_enabled))
		{
			activate_color_trigger_internal(colorcodes, colors, team, colorcodesbycolorindex);
		}
		waittillframeend();
		trigger_auto_disable();
	}
}

/*
	Name: trigger_auto_disable
	Namespace: colors
	Checksum: 0xD92E77C1
	Offset: 0x2610
	Size: 0x62
	Parameters: 0
	Flags: Linked
*/
function trigger_auto_disable()
{
	if(!isdefined(self.script_color_stay_on))
	{
		self.script_color_stay_on = 0;
	}
	if(!isdefined(self.color_enabled))
	{
		if(is_true(self.script_color_stay_on))
		{
			self.color_enabled = 1;
		}
		else
		{
			self.color_enabled = 0;
		}
	}
}

/*
	Name: %ai_crouch_exposed_turn_135l
	Namespace: colors
	Checksum: 0x2F8A0D19
	Offset: 0x2680
	Size: 0xB4
	Parameters: 1
	Flags: None
*/
function %ai_crouch_exposed_turn_135l(var_cc966c56)
{
	switch(var_cc966c56)
	{
		case "allies":
		{
			str_color = self.script_color_allies;
			break;
		}
		case "axis":
		{
			str_color = self.script_color_axis;
			break;
		}
		case "team3":
		{
			str_color = self.var_15eb6ad5;
			break;
		}
		default:
		{
			return;
		}
	}
	self thread get_colorcodes_and_activate_trigger(str_color, var_cc966c56);
}

/*
	Name: get_colorcodes_and_activate_trigger
	Namespace: colors
	Checksum: 0xD6A42294
	Offset: 0x2740
	Size: 0xAC
	Parameters: 2
	Flags: Linked
*/
function get_colorcodes_and_activate_trigger(color_team, team)
{
	array = get_colorcodes_from_trigger(color_team, team);
	colorcodes = array[#"colorcodes"];
	colorcodesbycolorindex = array[#"colorcodesbycolorindex"];
	colors = array[#"colors"];
	activate_color_trigger_internal(colorcodes, colors, team, colorcodesbycolorindex);
}

/*
	Name: activate_color_trigger_internal
	Namespace: colors
	Checksum: 0xF4C33872
	Offset: 0x27F8
	Size: 0x344
	Parameters: 4
	Flags: Linked
*/
function activate_color_trigger_internal(colorcodes, colors, team, colorcodesbycolorindex)
{
	for(i = 0; i < colorcodes.size; i++)
	{
		if(!isdefined(level.arrays_of_colorcoded_spawners[team][colorcodes[i]]))
		{
			continue;
		}
		arrayremovevalue(level.arrays_of_colorcoded_spawners[team][colorcodes[i]], undefined);
		for(p = 0; p < level.arrays_of_colorcoded_spawners[team][colorcodes[i]].size; p++)
		{
			level.arrays_of_colorcoded_spawners[team][colorcodes[i]][p].currentcolorcode = colorcodes[i];
		}
	}
	for(i = 0; i < colors.size; i++)
	{
		function_1eaaceab(level.arrays_of_colorforced_ai[team][colors[i]]);
		level.lastcolorforced[team][colors[i]] = level.currentcolorforced[team][colors[i]];
		level.currentcolorforced[team][colors[i]] = colorcodesbycolorindex[colors[i]];
		/#
			/#
				assert(isdefined(level.arrays_of_colorcoded_nodes[team][level.currentcolorforced[team][colors[i]]]) || isdefined(level.colorcoded_volumes[team][level.currentcolorforced[team][colors[i]]]), ((("" + colors[i]) + "") + team) + "");
			#/
		#/
	}
	ai_array = [];
	for(i = 0; i < colorcodes.size; i++)
	{
		if(same_color_code_as_last_time(team, colors[i]))
		{
			continue;
		}
		colorcode = colorcodes[i];
		if(!isdefined(level.arrays_of_colorcoded_ai[team][colorcode]))
		{
			continue;
		}
		ai_array[colorcode] = issue_leave_node_order_to_ai_and_get_ai(colorcode, colors[i], team);
	}
	for(i = 0; i < colorcodes.size; i++)
	{
		colorcode = colorcodes[i];
		if(!isdefined(ai_array[colorcode]))
		{
			continue;
		}
		if(same_color_code_as_last_time(team, colors[i]))
		{
			continue;
		}
		if(!isdefined(level.arrays_of_colorcoded_ai[team][colorcode]))
		{
			continue;
		}
		issue_color_order_to_ai(colorcode, colors[i], team, ai_array[colorcode]);
	}
}

/*
	Name: same_color_code_as_last_time
	Namespace: colors
	Checksum: 0x25ECEE8F
	Offset: 0x2B48
	Size: 0x54
	Parameters: 2
	Flags: Linked
*/
function same_color_code_as_last_time(team, color)
{
	if(!isdefined(level.lastcolorforced[team][color]))
	{
		return 0;
	}
	return level.lastcolorforced[team][color] == level.currentcolorforced[team][color];
}

/*
	Name: function_f06ea88
	Namespace: colors
	Checksum: 0x99F30DA4
	Offset: 0x2BA8
	Size: 0xFC
	Parameters: 3
	Flags: Linked
*/
function function_f06ea88(node, var_f9350db6, var_cc966c56)
{
	switch(var_cc966c56)
	{
		case "allies":
		{
			str_color = node.script_color_allies;
			break;
		}
		case "axis":
		{
			str_color = node.script_color_axis;
			break;
		}
		case "team3":
		{
			str_color = node.var_15eb6ad5;
			break;
		}
		default:
		{
			return;
		}
	}
	if(issubstr(str_color, var_f9350db6))
	{
		self.cover_nodes_last[self.cover_nodes_last.size] = node;
	}
	else
	{
		self.cover_nodes_first[self.cover_nodes_first.size] = node;
	}
}

/*
	Name: process_cover_node
	Namespace: colors
	Checksum: 0x40FE0020
	Offset: 0x2CB0
	Size: 0x34
	Parameters: 3
	Flags: Linked
*/
function process_cover_node(node, var_f9350db6, var_cc966c56)
{
	self.cover_nodes_first[self.cover_nodes_first.size] = var_cc966c56;
}

/*
	Name: process_path_node
	Namespace: colors
	Checksum: 0xA302E520
	Offset: 0x2CF0
	Size: 0x34
	Parameters: 3
	Flags: Linked
*/
function process_path_node(node, var_f9350db6, var_cc966c56)
{
	self.path_nodes[self.path_nodes.size] = var_cc966c56;
}

/*
	Name: prioritize_colorcoded_nodes
	Namespace: colors
	Checksum: 0xDA018E20
	Offset: 0x2D30
	Size: 0x1BA
	Parameters: 3
	Flags: Linked
*/
function prioritize_colorcoded_nodes(team, colorcode, color)
{
	nodes = level.arrays_of_colorcoded_nodes[team][colorcode];
	if(!isdefined(nodes))
	{
		return;
	}
	ent = spawnstruct();
	ent.path_nodes = [];
	ent.cover_nodes_first = [];
	ent.cover_nodes_last = [];
	lastcolorforced_exists = isdefined(level.lastcolorforced[team][color]);
	for(i = 0; i < nodes.size; i++)
	{
		node = nodes[i];
		ent [[level.color_node_type_function[node.type][lastcolorforced_exists]]](node, level.lastcolorforced[team][color], team);
	}
	ent.cover_nodes_first = array::randomize(ent.cover_nodes_first);
	nodes = ent.cover_nodes_first;
	for(i = 0; i < ent.cover_nodes_last.size; i++)
	{
		nodes[nodes.size] = ent.cover_nodes_last[i];
	}
	for(i = 0; i < ent.path_nodes.size; i++)
	{
		nodes[nodes.size] = ent.path_nodes[i];
	}
	level.arrays_of_colorcoded_nodes[team][colorcode] = nodes;
}

/*
	Name: get_prioritized_colorcoded_nodes
	Namespace: colors
	Checksum: 0xACCA3033
	Offset: 0x2EF8
	Size: 0xBE
	Parameters: 3
	Flags: Linked
*/
function get_prioritized_colorcoded_nodes(team, colorcode, color)
{
	if(isdefined(level.arrays_of_colorcoded_nodes[colorcode][color]))
	{
		return level.arrays_of_colorcoded_nodes[colorcode][color];
	}
	if(isdefined(level.colorcoded_volumes[colorcode][color]))
	{
		if(!isarray(level.colorcoded_volumes[colorcode][color]))
		{
			return [0:level.colorcoded_volumes[colorcode][color]];
		}
		return level.colorcoded_volumes[colorcode][color];
	}
	return [];
}

/*
	Name: issue_leave_node_order_to_ai_and_get_ai
	Namespace: colors
	Checksum: 0x71D89BA2
	Offset: 0x2FC0
	Size: 0x148
	Parameters: 3
	Flags: Linked
*/
function issue_leave_node_order_to_ai_and_get_ai(colorcode, color, team)
{
	function_1eaaceab(level.arrays_of_colorcoded_ai[team][colorcode]);
	ai = level.arrays_of_colorcoded_ai[team][colorcode];
	ai = arraycombine(ai, level.arrays_of_colorforced_ai[team][color], 1, 0);
	newarray = [];
	for(i = 0; i < ai.size; i++)
	{
		if(isdefined(ai[i].currentcolorcode) && ai[i].currentcolorcode == colorcode)
		{
			continue;
		}
		newarray[newarray.size] = ai[i];
	}
	ai = newarray;
	if(!ai.size)
	{
		return;
	}
	for(i = 0; i < ai.size; i++)
	{
		ai[i] left_color_node();
	}
	return ai;
}

/*
	Name: issue_color_order_to_ai
	Namespace: colors
	Checksum: 0x98DCF28
	Offset: 0x3110
	Size: 0x2EC
	Parameters: 4
	Flags: Linked
*/
function issue_color_order_to_ai(colorcode, color, team, ai)
{
	original_ai_array = ai;
	stack = isdefined(self.script_stack);
	if(!stack)
	{
		prioritize_colorcoded_nodes(team, colorcode, color);
	}
	nodes = get_prioritized_colorcoded_nodes(team, colorcode, color);
	if(isdefined(nodes) && nodes.size >= 1 && !ispathnode(nodes[0]))
	{
		for(i = 0; i < ai.size; i++)
		{
			ai[i] take_color_node(nodes[i % nodes.size], colorcode, self, i);
		}
		return;
	}
	/#
		level.colornodes_debug_array[team][colorcode] = nodes;
		if(nodes.size < ai.size)
		{
			println(((("" + ai.size) + "") + nodes.size) + "");
		}
	#/
	if(stack)
	{
		var_a18ec7bc = struct::get(self.target, "targetname");
		nodes = arraysort(nodes, var_a18ec7bc.origin, 1);
	}
	counter = 0;
	ai_count = ai.size;
	for(i = 0; i < nodes.size; i++)
	{
		node = nodes[i];
		if(isalive(node.color_user))
		{
			continue;
		}
		closestai = arraysort(ai, node.origin, 1, 1)[0];
		/#
			assert(isalive(closestai));
		#/
		arrayremovevalue(ai, closestai);
		closestai take_color_node(node, colorcode, self, counter);
		counter++;
		if(!ai.size)
		{
			return;
		}
	}
}

/*
	Name: take_color_node
	Namespace: colors
	Checksum: 0xB99E2CAC
	Offset: 0x3408
	Size: 0x5C
	Parameters: 4
	Flags: Linked
*/
function take_color_node(node, colorcode, trigger, counter)
{
	self notify(#"stop_color_move");
	self.currentcolorcode = colorcode;
	self thread process_color_order_to_ai(node, trigger, counter);
}

/*
	Name: player_color_node
	Namespace: colors
	Checksum: 0x84C4D29A
	Offset: 0x3470
	Size: 0xB0
	Parameters: 0
	Flags: Linked
*/
function player_color_node()
{
	for(;;)
	{
		playernode = undefined;
		if(!isdefined(self.node))
		{
			waitframe(1);
			continue;
		}
		olduser = self.node.color_user;
		playernode = self.node;
		playernode.color_user = self;
		for(;;)
		{
			if(!isdefined(self.node))
			{
				break;
			}
			if(self.node != playernode)
			{
				break;
			}
			waitframe(1);
		}
		playernode.color_user = undefined;
		playernode color_node_finds_a_user();
	}
}

/*
	Name: color_node_finds_a_user
	Namespace: colors
	Checksum: 0x987BBAF6
	Offset: 0x3528
	Size: 0xAC
	Parameters: 0
	Flags: Linked
*/
function color_node_finds_a_user()
{
	if(isdefined(self.script_color_allies))
	{
		color_node_finds_user_from_colorcodes(self.script_color_allies, #"allies");
	}
	if(isdefined(self.script_color_axis))
	{
		color_node_finds_user_from_colorcodes(self.script_color_axis, #"axis");
	}
	if(isdefined(self.var_15eb6ad5))
	{
		color_node_finds_user_from_colorcodes(self.var_15eb6ad5, #"team3");
	}
}

/*
	Name: color_node_finds_user_from_colorcodes
	Namespace: colors
	Checksum: 0x686CF0F0
	Offset: 0x35E0
	Size: 0x6C
	Parameters: 2
	Flags: Linked
*/
function color_node_finds_user_from_colorcodes(colorcodestring, team)
{
	if(isdefined(self.color_user))
	{
		return;
	}
	colorcodes = strtok(colorcodestring, " ");
	array::thread_all_ents(colorcodes, &color_node_finds_user_for_colorcode, team);
}

/*
	Name: color_node_finds_user_for_colorcode
	Namespace: colors
	Checksum: 0xDD010EF4
	Offset: 0x3658
	Size: 0x136
	Parameters: 2
	Flags: Linked
*/
function color_node_finds_user_for_colorcode(colorcode, team)
{
	color = colorcode[0];
	/#
		assert(colorislegit(color), ("" + color) + "");
	#/
	if(!isdefined(level.currentcolorforced[team][color]))
	{
		return;
	}
	if(level.currentcolorforced[team][color] != colorcode)
	{
		return;
	}
	ai = get_force_color_guys(team, color);
	if(!ai.size)
	{
		return;
	}
	for(i = 0; i < ai.size; i++)
	{
		guy = ai[i];
		if(guy occupies_colorcode(colorcode))
		{
			continue;
		}
		guy take_color_node(self, colorcode);
		return;
	}
}

/*
	Name: occupies_colorcode
	Namespace: colors
	Checksum: 0x674C2AF2
	Offset: 0x3798
	Size: 0x28
	Parameters: 1
	Flags: Linked
*/
function occupies_colorcode(colorcode)
{
	if(!isdefined(self.currentcolorcode))
	{
		return 0;
	}
	return self.currentcolorcode == colorcode;
}

/*
	Name: ai_sets_goal_with_delay
	Namespace: colors
	Checksum: 0xF3A74624
	Offset: 0x37C8
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function ai_sets_goal_with_delay(node)
{
	self endon(#"death");
	delay = my_current_node_delays();
	if(delay)
	{
		wait(delay);
	}
	ai_sets_goal(node);
}

/*
	Name: ai_sets_goal
	Namespace: colors
	Checksum: 0xD4DD9F86
	Offset: 0x3838
	Size: 0x94
	Parameters: 1
	Flags: Linked
*/
function ai_sets_goal(node)
{
	self notify(#"stop_going_to_node");
	set_goal_and_volume(node);
	if(is_true(self.script_careful))
	{
		volume = level.colorcoded_volumes[self.team][self.currentcolorcode];
		self thread function_e4e541a8(node, volume);
	}
}

/*
	Name: set_goal_and_volume
	Namespace: colors
	Checksum: 0xD035BA9B
	Offset: 0x38D8
	Size: 0x172
	Parameters: 1
	Flags: Linked
*/
function set_goal_and_volume(node)
{
	if(isdefined(self._colors_go_line))
	{
		self notify(#"colors_go_line_done");
		self._colors_go_line = undefined;
	}
	if(is_true(node.radius))
	{
		self.goalradius = node.radius;
	}
	else if(isdefined(level.var_a6112e7))
	{
		self.goalradius = level.var_a6112e7;
	}
	if(is_true(node.script_forcegoal))
	{
		self thread color_force_goal(node);
	}
	else
	{
		self ai::set_goal_node(node);
	}
	volume = level.colorcoded_volumes[self.team][self.currentcolorcode];
	if(isdefined(volume))
	{
		self ai::set_goal_ent(volume);
	}
	if(isdefined(node.fixednodesaferadius))
	{
		self.fixednodesaferadius = node.fixednodesaferadius;
	}
	else
	{
		if(isdefined(level.fixednodesaferadius_default))
		{
			self.fixednodesaferadius = level.fixednodesaferadius_default;
		}
		else
		{
			self.fixednodesaferadius = 64;
		}
	}
}

/*
	Name: color_force_goal
	Namespace: colors
	Checksum: 0x7BE4D37E
	Offset: 0x3A58
	Size: 0x86
	Parameters: 1
	Flags: Linked
*/
function color_force_goal(node)
{
	self endon(#"death");
	self thread ai::force_goal(node, 1, "stop_color_forcegoal", 1);
	self waittill(#"goal", #"stop_color_move");
	self notify(#"stop_color_forcegoal");
}

/*
	Name: my_current_node_delays
	Namespace: colors
	Checksum: 0x232B069
	Offset: 0x3AE8
	Size: 0x2A
	Parameters: 0
	Flags: Linked
*/
function my_current_node_delays()
{
	if(!isdefined(self.node))
	{
		return 0;
	}
	return self.node util::script_delay();
}

/*
	Name: process_color_order_to_ai
	Namespace: colors
	Checksum: 0x4F2F559E
	Offset: 0x3B20
	Size: 0x1EA
	Parameters: 3
	Flags: Linked
*/
function process_color_order_to_ai(node, trigger, counter)
{
	thread decrementcolorusers(node);
	self endon(#"stop_color_move", #"death");
	if(isdefined(trigger))
	{
		trigger util::script_delay();
	}
	if(isdefined(trigger))
	{
		if(isdefined(trigger.script_flag_wait))
		{
			level flag::wait_till(trigger.script_flag_wait);
		}
	}
	if(!my_current_node_delays())
	{
		if(isdefined(counter))
		{
			wait(counter * randomfloatrange(0.2, 0.35));
		}
	}
	self ai_sets_goal(node);
	self.color_ordered_node_assignment = node;
	if(!ispathnode(node))
	{
		return;
	}
	self childthread function_4120bbac(node);
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"node_relinquished");
		waitframe(1);
		nodeowner = getnodeowner(node);
		if(self.prevnode !== node || !isdefined(nodeowner) || !isplayer(nodeowner))
		{
			continue;
		}
		node = self function_a328c372();
	}
}

/*
	Name: function_a328c372
	Namespace: colors
	Checksum: 0xD504CEE6
	Offset: 0x3D18
	Size: 0xFE
	Parameters: 0
	Flags: Linked, Private
*/
function private function_a328c372()
{
	node = get_best_available_new_colored_node();
	if(isdefined(node))
	{
		/#
			assert(!isalive(node.color_user), "");
		#/
		if(isalive(self.color_node.color_user) && self.color_node.color_user == self)
		{
			self.color_node.color_user = undefined;
		}
		self.color_node = node;
		node.color_user = self;
		self ai_sets_goal(node);
	}
	if(!isdefined(node))
	{
		node = self.node;
	}
	if(!isdefined(node))
	{
		node = self.prevnode;
	}
	return node;
}

/*
	Name: function_4120bbac
	Namespace: colors
	Checksum: 0xC93EF1D2
	Offset: 0x3E20
	Size: 0x5C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_4120bbac(node)
{
	while(true)
	{
		if(!aiutility::function_f557fb8b(self, node.origin))
		{
			node = self function_a328c372();
		}
		wait(1);
	}
}

/*
	Name: get_best_available_colored_node
	Namespace: colors
	Checksum: 0xC4909E75
	Offset: 0x3E88
	Size: 0x14E
	Parameters: 0
	Flags: None
*/
function get_best_available_colored_node()
{
	/#
		assert(self.team != #"neutral");
	#/
	/#
		assert(isdefined(self.script_forcecolor), ("" + self.export) + "");
	#/
	colorcode = level.currentcolorforced[self.team][self.script_forcecolor];
	nodes = get_prioritized_colorcoded_nodes(self.team, colorcode, self.script_forcecolor);
	/#
		assert(nodes.size > 0, ((("" + self.export) + "") + self.script_forcecolor) + "");
	#/
	for(i = 0; i < nodes.size; i++)
	{
		if(!isalive(nodes[i].color_user))
		{
			return nodes[i];
		}
	}
}

/*
	Name: get_best_available_new_colored_node
	Namespace: colors
	Checksum: 0xF16DD63C
	Offset: 0x3FE0
	Size: 0x1F2
	Parameters: 0
	Flags: Linked
*/
function get_best_available_new_colored_node()
{
	/#
		assert(self.team != #"neutral");
	#/
	/#
		assert(isdefined(self.script_forcecolor), ("" + self.export) + "");
	#/
	colorcode = level.currentcolorforced[self.team][self.script_forcecolor];
	nodes = get_prioritized_colorcoded_nodes(self.team, colorcode, self.script_forcecolor);
	/#
		assert(nodes.size > 0, ((("" + self.export) + "") + self.script_forcecolor) + "");
	#/
	nodes = arraysort(nodes, self.origin);
	node = undefined;
	backupnode = undefined;
	for(i = 0; i < nodes.size; i++)
	{
		if(!isalive(nodes[i].color_user))
		{
			if(aiutility::function_f557fb8b(self, nodes[i].origin))
			{
				node = nodes[i];
				break;
				continue;
			}
			if(!isdefined(backupnode))
			{
				backupnode = nodes[i];
			}
		}
	}
	if(isdefined(node))
	{
		return node;
	}
	if(isdefined(backupnode))
	{
		return backupnode;
	}
}

/*
	Name: process_stop_short_of_node
	Namespace: colors
	Checksum: 0x40797F34
	Offset: 0x41E0
	Size: 0xCC
	Parameters: 1
	Flags: None
*/
function process_stop_short_of_node(node)
{
	self endon(#"stopscript", #"death");
	if(isdefined(self.node))
	{
		return;
	}
	if(distancesquared(node.origin, self.origin) < 1024)
	{
		reached_node_but_could_not_claim_it(node);
		return;
	}
	currenttime = gettime();
	wait_for_killanimscript_or_time(1);
	newtime = gettime();
	if((newtime - currenttime) >= 1000)
	{
		reached_node_but_could_not_claim_it(node);
	}
}

/*
	Name: wait_for_killanimscript_or_time
	Namespace: colors
	Checksum: 0x8E7960F2
	Offset: 0x42B8
	Size: 0x26
	Parameters: 1
	Flags: Linked
*/
function wait_for_killanimscript_or_time(timer)
{
	self endon(#"killanimscript");
	wait(timer);
}

/*
	Name: reached_node_but_could_not_claim_it
	Namespace: colors
	Checksum: 0xCD8C4798
	Offset: 0x42E8
	Size: 0xB6
	Parameters: 1
	Flags: Linked
*/
function reached_node_but_could_not_claim_it(node)
{
	ai = getaiarray();
	for(i = 0; i < ai.size; i++)
	{
		if(!isdefined(ai[i].node))
		{
			continue;
		}
		if(ai[i].node != node)
		{
			continue;
		}
		ai[i] notify(#"eject_from_my_node");
		wait(1);
		self notify(#"eject_from_my_node");
		return true;
	}
	return false;
}

/*
	Name: decrementcolorusers
	Namespace: colors
	Checksum: 0xCCC757FF
	Offset: 0x43A8
	Size: 0x76
	Parameters: 1
	Flags: Linked
*/
function decrementcolorusers(node)
{
	node.color_user = self;
	self.color_node = node;
	/#
		self.color_node_debug_val = 1;
	#/
	self endon(#"stop_color_move");
	self waittill(#"death");
	if(isdefined(self.color_node))
	{
		self.color_node.color_user = undefined;
	}
}

/*
	Name: colorislegit
	Namespace: colors
	Checksum: 0x69B84F87
	Offset: 0x4428
	Size: 0x52
	Parameters: 1
	Flags: None
*/
function colorislegit(color)
{
	for(i = 0; i < level.colorlist.size; i++)
	{
		if(color == level.colorlist[i])
		{
			return true;
		}
	}
	return false;
}

/*
	Name: add_volume_to_global_arrays
	Namespace: colors
	Checksum: 0x6D6DDEC
	Offset: 0x4488
	Size: 0x126
	Parameters: 2
	Flags: Linked
*/
function add_volume_to_global_arrays(colorcode, team)
{
	colors = strtok(colorcode, " ");
	for(p = 0; p < colors.size; p++)
	{
		/#
			assert(!isdefined(level.colorcoded_volumes[team][colors[p]]), "" + colors[p]);
		#/
		level.colorcoded_volumes[team][colors[p]] = self;
		if(!isdefined(level.arrays_of_colorcoded_ai[team][colors[p]]))
		{
			level.arrays_of_colorcoded_ai[team][colors[p]] = [];
		}
		if(!isdefined(level.arrays_of_colorcoded_spawners[team][colors[p]]))
		{
			level.arrays_of_colorcoded_spawners[team][colors[p]] = [];
		}
	}
}

/*
	Name: add_node_to_global_arrays
	Namespace: colors
	Checksum: 0x1F786C70
	Offset: 0x45B8
	Size: 0x1BE
	Parameters: 2
	Flags: Linked
*/
function add_node_to_global_arrays(colorcode, team)
{
	self.color_user = undefined;
	colors = strtok(colorcode, " ");
	for(p = 0; p < colors.size; p++)
	{
		if(isdefined(level.arrays_of_colorcoded_nodes[team]) && isdefined(level.arrays_of_colorcoded_nodes[team][colors[p]]))
		{
			if(!isdefined(level.arrays_of_colorcoded_nodes[team][colors[p]]))
			{
				level.arrays_of_colorcoded_nodes[team][colors[p]] = [];
			}
			else if(!isarray(level.arrays_of_colorcoded_nodes[team][colors[p]]))
			{
				level.arrays_of_colorcoded_nodes[team][colors[p]] = array(level.arrays_of_colorcoded_nodes[team][colors[p]]);
			}
			level.arrays_of_colorcoded_nodes[team][colors[p]][level.arrays_of_colorcoded_nodes[team][colors[p]].size] = self;
			continue;
		}
		level.arrays_of_colorcoded_nodes[team][colors[p]][0] = self;
		level.arrays_of_colorcoded_ai[team][colors[p]] = [];
		level.arrays_of_colorcoded_spawners[team][colors[p]] = [];
	}
}

/*
	Name: left_color_node
	Namespace: colors
	Checksum: 0xADF98D21
	Offset: 0x4780
	Size: 0x76
	Parameters: 0
	Flags: Linked
*/
function left_color_node()
{
	/#
		self.color_node_debug_val = undefined;
	#/
	if(!isdefined(self.color_node))
	{
		return;
	}
	if(isdefined(self.color_node.color_user) && self.color_node.color_user == self)
	{
		self.color_node.color_user = undefined;
	}
	self.color_node = undefined;
	self notify(#"stop_color_move");
}

/*
	Name: removespawnerfromcolornumberarray
	Namespace: colors
	Checksum: 0x83B94FB9
	Offset: 0x4800
	Size: 0x114
	Parameters: 0
	Flags: None
*/
function removespawnerfromcolornumberarray()
{
	switch(self.team)
	{
		case "allies":
		{
			str_color = self.script_color_allies;
			break;
		}
		case "axis":
		{
			str_color = self.script_color_axis;
			break;
		}
		case "team3":
		{
			str_color = self.var_15eb6ad5;
			break;
		}
		default:
		{
			return;
		}
	}
	if(!isdefined(str_color))
	{
		return;
	}
	var_9986d9d6 = strtok(str_color, " ");
	for(i = 0; i < var_9986d9d6.size; i++)
	{
		arrayremovevalue(level.arrays_of_colorcoded_spawners[self.team][var_9986d9d6[i]], self);
	}
}

/*
	Name: add_cover_node
	Namespace: colors
	Checksum: 0x7205FD07
	Offset: 0x4920
	Size: 0x4E
	Parameters: 1
	Flags: Linked
*/
function add_cover_node(type)
{
	level.color_node_type_function[type][1] = &function_f06ea88;
	level.color_node_type_function[type][0] = &process_cover_node;
}

/*
	Name: add_path_node
	Namespace: colors
	Checksum: 0x47331764
	Offset: 0x4978
	Size: 0x4E
	Parameters: 1
	Flags: Linked
*/
function add_path_node(type)
{
	level.color_node_type_function[type][1] = &process_path_node;
	level.color_node_type_function[type][0] = &process_path_node;
}

/*
	Name: colornode_spawn_reinforcement
	Namespace: colors
	Checksum: 0x28946ABD
	Offset: 0x49D0
	Size: 0x310
	Parameters: 2
	Flags: Linked
*/
function colornode_spawn_reinforcement(classname, fromcolor)
{
	level endon(#"kill_color_replacements");
	friendly_spawners_type = getclasscolorhash(classname, fromcolor);
	while(level.friendly_spawners_types[friendly_spawners_type] > 0)
	{
		spawn = undefined;
		for(;;)
		{
			if(!level flag::get("respawn_friendlies"))
			{
				if(!isdefined(level.friendly_respawn_vision_checker_thread))
				{
					thread friendly_spawner_vision_checker();
				}
				for(;;)
				{
					level flag::wait_till_any(array("player_looks_away_from_spawner", "respawn_friendlies"));
					level flag::wait_till_clear("friendly_spawner_locked");
					if(level flag::get("player_looks_away_from_spawner") || level flag::get("respawn_friendlies"))
					{
						break;
					}
				}
				level flag::set("friendly_spawner_locked");
			}
			spawner = get_color_spawner(classname, fromcolor);
			spawner.count = 1;
			level.friendly_spawners_types[friendly_spawners_type] = level.friendly_spawners_types[friendly_spawners_type] - 1;
			spawner util::script_wait();
			spawn = spawner spawner::spawn();
			if(spawner::spawn_failed(spawn))
			{
				thread lock_spawner_for_awhile();
				wait(1);
				continue;
			}
			level notify(#"reinforcement_spawned", {#entity:spawn});
			break;
		}
		for(;;)
		{
			if(!isdefined(fromcolor))
			{
				break;
			}
			if(get_color_from_order(fromcolor, level.current_color_order) == "none")
			{
				break;
			}
			fromcolor = level.current_color_order[fromcolor];
		}
		if(isdefined(fromcolor))
		{
			spawn set_force_color(fromcolor);
		}
		thread lock_spawner_for_awhile();
		if(isdefined(level.friendly_startup_thread))
		{
			spawn thread [[level.friendly_startup_thread]]();
		}
		spawn thread colornode_replace_on_death();
	}
}

/*
	Name: colornode_replace_on_death
	Namespace: colors
	Checksum: 0xED58A7EC
	Offset: 0x4CE8
	Size: 0x3DA
	Parameters: 0
	Flags: Linked
*/
function colornode_replace_on_death()
{
	level endon(#"kill_color_replacements");
	/#
		assert(isalive(self), "");
	#/
	self endon(#"_disable_reinforcement");
	if(self.team == #"axis")
	{
		return;
	}
	if(isdefined(self.replace_on_death))
	{
		return;
	}
	self.replace_on_death = 1;
	/#
		assert(!isdefined(self.respawn_on_death), ("" + self.export) + "");
	#/
	classname = self.classname;
	color = self.script_forcecolor;
	waittillframeend();
	if(isalive(self))
	{
		self waittill(#"death");
	}
	color_order = level.current_color_order;
	if(!isdefined(self.script_forcecolor))
	{
		return;
	}
	friendly_spawners_type = getclasscolorhash(classname, self.script_forcecolor);
	if(!isdefined(level.friendly_spawners_types) || !isdefined(level.friendly_spawners_types[friendly_spawners_type]) || level.friendly_spawners_types[friendly_spawners_type] <= 0)
	{
		level.friendly_spawners_types[friendly_spawners_type] = 1;
		thread colornode_spawn_reinforcement(classname, self.script_forcecolor);
	}
	else
	{
		level.friendly_spawners_types[friendly_spawners_type] = level.friendly_spawners_types[friendly_spawners_type] + 1;
	}
	if(isdefined(self) && isdefined(self.script_forcecolor))
	{
		color = self.script_forcecolor;
	}
	if(isdefined(self) && isdefined(self.origin))
	{
		origin = self.origin;
	}
	for(;;)
	{
		if(get_color_from_order(color, color_order) == "none")
		{
			return;
		}
		correct_colored_friendlies = get_force_color_guys(#"allies", color_order[color]);
		correct_colored_friendlies = array::filter_classname(correct_colored_friendlies, 1, classname);
		if(!correct_colored_friendlies.size)
		{
			wait(2);
			continue;
		}
		players = getplayers();
		correct_colored_guy = arraysort(correct_colored_friendlies, players[0].origin, 1)[0];
		/#
			assert(correct_colored_guy.script_forcecolor != color, ("" + color) + "");
		#/
		waittillframeend();
		if(!isalive(correct_colored_guy))
		{
			continue;
		}
		correct_colored_guy set_force_color(color);
		if(isdefined(level.friendly_promotion_thread))
		{
			correct_colored_guy [[level.friendly_promotion_thread]](color);
		}
		color = color_order[color];
	}
}

/*
	Name: get_color_from_order
	Namespace: colors
	Checksum: 0xA7BABCD5
	Offset: 0x50D0
	Size: 0x4E
	Parameters: 2
	Flags: Linked
*/
function get_color_from_order(color, color_order)
{
	if(!isdefined(color))
	{
		return "none";
	}
	if(!isdefined(color_order))
	{
		return "none";
	}
	if(!isdefined(color_order[color]))
	{
		return "none";
	}
	return color_order[color];
}

/*
	Name: friendly_spawner_vision_checker
	Namespace: colors
	Checksum: 0xEA5038D4
	Offset: 0x5128
	Size: 0x208
	Parameters: 0
	Flags: Linked
*/
function friendly_spawner_vision_checker()
{
	level.friendly_respawn_vision_checker_thread = 1;
	successes = 0;
	for(;;)
	{
		level flag::wait_till_clear("respawn_friendlies");
		wait(1);
		if(!isdefined(level.respawn_spawner))
		{
			continue;
		}
		spawner = level.respawn_spawner;
		players = getplayers();
		player_sees_spawner = 0;
		for(q = 0; q < players.size; q++)
		{
			difference_vec = players[q].origin - spawner.origin;
			if(length(difference_vec) < 200)
			{
				player_sees_spawner();
				player_sees_spawner = 1;
				break;
			}
			forward = anglestoforward((0, players[q] getplayerangles()[1], 0));
			difference = vectornormalize(difference_vec);
			dot = vectordot(forward, difference);
			if(dot < 0.2)
			{
				player_sees_spawner();
				player_sees_spawner = 1;
				break;
			}
			successes++;
			if(successes < 3)
			{
				continue;
			}
		}
		if(player_sees_spawner)
		{
			continue;
		}
		level flag::set("player_looks_away_from_spawner");
	}
}

/*
	Name: get_color_spawner
	Namespace: colors
	Checksum: 0x5B876084
	Offset: 0x5338
	Size: 0x242
	Parameters: 2
	Flags: Linked
*/
function get_color_spawner(classname, fromcolor)
{
	specificfromcolor = 0;
	if(isdefined(level.respawn_spawners_specific) && isdefined(level.respawn_spawners_specific[fromcolor]))
	{
		specificfromcolor = 1;
	}
	if(!isdefined(level.respawn_spawner))
	{
		if(!isdefined(fromcolor) || !specificfromcolor)
		{
			/#
				assertmsg("");
			#/
		}
	}
	if(!isdefined(classname))
	{
		if(isdefined(fromcolor) && specificfromcolor)
		{
			return level.respawn_spawners_specific[fromcolor];
		}
		return level.respawn_spawner;
	}
	spawners = getentarray("color_spawner", "targetname");
	class_spawners = [];
	for(i = 0; i < spawners.size; i++)
	{
		class_spawners[spawners[i].classname] = spawners[i];
	}
	spawner = undefined;
	keys = getarraykeys(class_spawners);
	for(i = 0; i < keys.size; i++)
	{
		if(!issubstr(class_spawners[keys[i]].classname, classname))
		{
			continue;
		}
		spawner = class_spawners[keys[i]];
		break;
	}
	if(!isdefined(spawner))
	{
		if(isdefined(fromcolor) && specificfromcolor)
		{
			return level.respawn_spawners_specific[fromcolor];
		}
		return level.respawn_spawner;
	}
	if(isdefined(fromcolor) && specificfromcolor)
	{
		spawner.origin = level.respawn_spawners_specific[fromcolor].origin;
	}
	else
	{
		spawner.origin = level.respawn_spawner.origin;
	}
	return spawner;
}

/*
	Name: getclasscolorhash
	Namespace: colors
	Checksum: 0xE0E0CE94
	Offset: 0x5588
	Size: 0x46
	Parameters: 2
	Flags: Linked
*/
function getclasscolorhash(classname, fromcolor)
{
	classcolorhash = classname;
	if(isdefined(fromcolor))
	{
		classcolorhash = classcolorhash + ("##" + fromcolor);
	}
	return classcolorhash;
}

/*
	Name: lock_spawner_for_awhile
	Namespace: colors
	Checksum: 0x4790A936
	Offset: 0x55D8
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function lock_spawner_for_awhile()
{
	level flag::set("friendly_spawner_locked");
	wait(2);
	level flag::clear("friendly_spawner_locked");
}

/*
	Name: player_sees_spawner
	Namespace: colors
	Checksum: 0xBAD7F2E3
	Offset: 0x5628
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function player_sees_spawner()
{
	level flag::clear("player_looks_away_from_spawner");
}

/*
	Name: kill_color_replacements
	Namespace: colors
	Checksum: 0x26741491
	Offset: 0x5658
	Size: 0x7C
	Parameters: 0
	Flags: None
*/
function kill_color_replacements()
{
	level flag::clear("friendly_spawner_locked");
	level notify(#"kill_color_replacements");
	level.friendly_spawners_types = undefined;
	ai = getaiarray();
	array::thread_all(ai, &remove_replace_on_death);
}

/*
	Name: remove_replace_on_death
	Namespace: colors
	Checksum: 0xB1E5C072
	Offset: 0x56E0
	Size: 0xE
	Parameters: 0
	Flags: Linked
*/
function remove_replace_on_death()
{
	self.replace_on_death = undefined;
}

/*
	Name: set_force_color
	Namespace: colors
	Checksum: 0x99FB7487
	Offset: 0x56F8
	Size: 0x26C
	Parameters: 1
	Flags: Linked
*/
function set_force_color(_color)
{
	color = shortencolor(_color);
	/#
		assert(colorislegit(color), "" + color);
	#/
	if(!isactor(self) && !isbot(self))
	{
		set_force_color_spawner(color);
		return;
	}
	/#
		assert(isalive(self), "");
	#/
	self.script_color_axis = undefined;
	self.script_color_allies = undefined;
	self.old_forcecolor = undefined;
	if(isdefined(self.script_forcecolor))
	{
		arrayremovevalue(level.arrays_of_colorforced_ai[self.team][self.script_forcecolor], self);
	}
	self.script_forcecolor = color;
	if(!isdefined(level.arrays_of_colorforced_ai[self.team][self.script_forcecolor]))
	{
		level.arrays_of_colorforced_ai[self.team][self.script_forcecolor] = [];
	}
	else if(!isarray(level.arrays_of_colorforced_ai[self.team][self.script_forcecolor]))
	{
		level.arrays_of_colorforced_ai[self.team][self.script_forcecolor] = array(level.arrays_of_colorforced_ai[self.team][self.script_forcecolor]);
	}
	level.arrays_of_colorforced_ai[self.team][self.script_forcecolor][level.arrays_of_colorforced_ai[self.team][self.script_forcecolor].size] = self;
	level thread remove_colorforced_ai_when_dead(self);
	self thread new_color_being_set(color);
}

/*
	Name: remove_colorforced_ai_when_dead
	Namespace: colors
	Checksum: 0x9E5230FA
	Offset: 0x5970
	Size: 0x74
	Parameters: 1
	Flags: Linked
*/
function remove_colorforced_ai_when_dead(ai)
{
	script_forcecolor = ai.script_forcecolor;
	team = ai.team;
	ai waittill(#"death");
	arrayremovevalue(level.arrays_of_colorforced_ai[team][script_forcecolor], undefined);
}

/*
	Name: shortencolor
	Namespace: colors
	Checksum: 0x63DF8471
	Offset: 0x59F0
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function shortencolor(color)
{
	/#
		assert(isdefined(level.colorchecklist[tolower(color)]), "" + color);
	#/
	return level.colorchecklist[tolower(color)];
}

/*
	Name: set_force_color_spawner
	Namespace: colors
	Checksum: 0xBEEF1D
	Offset: 0x5A68
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function set_force_color_spawner(color)
{
	self.script_forcecolor = color;
	self.old_forcecolor = undefined;
}

/*
	Name: new_color_being_set
	Namespace: colors
	Checksum: 0x553A2A50
	Offset: 0x5A98
	Size: 0xD4
	Parameters: 1
	Flags: Linked
*/
function new_color_being_set(color)
{
	self notify(#"new_color_being_set");
	self.new_force_color_being_set = 1;
	left_color_node();
	self endon(#"new_color_being_set", #"death");
	waittillframeend();
	waittillframeend();
	if(isdefined(self.script_forcecolor))
	{
		self.currentcolorcode = level.currentcolorforced[self.team][self.script_forcecolor];
		self thread goto_current_colorindex();
	}
	self.new_force_color_being_set = undefined;
	self notify(#"done_setting_new_color");
	/#
		update_debug_friendlycolor();
	#/
}

/*
	Name: update_debug_friendlycolor_on_death
	Namespace: colors
	Checksum: 0xB4AE7CD4
	Offset: 0x5B78
	Size: 0x120
	Parameters: 0
	Flags: Linked
*/
function update_debug_friendlycolor_on_death()
{
	self notify(#"debug_color_update");
	self endon(#"debug_color_update");
	self waittill(#"death");
	/#
		foreach(n_key, v in level.debug_color_friendlies)
		{
			ai = getentbynum(n_key);
			if(!isalive(ai))
			{
				arrayremoveindex(level.debug_color_friendlies, n_key, 1);
			}
		}
	#/
	level notify(#"updated_color_friendlies");
}

/*
	Name: update_debug_friendlycolor
	Namespace: colors
	Checksum: 0x2DB2F454
	Offset: 0x5CA0
	Size: 0x80
	Parameters: 0
	Flags: None
*/
function update_debug_friendlycolor()
{
	self thread update_debug_friendlycolor_on_death();
	if(isdefined(self.script_forcecolor))
	{
		level.debug_color_friendlies[self getentitynumber()] = self.script_forcecolor;
	}
	else
	{
		level.debug_color_friendlies[self getentitynumber()] = undefined;
	}
	level notify(#"updated_color_friendlies");
}

/*
	Name: has_color
	Namespace: colors
	Checksum: 0xB4E68B43
	Offset: 0x5D28
	Size: 0xAA
	Parameters: 0
	Flags: Linked
*/
function has_color()
{
	if(self.team == #"allies")
	{
		return isdefined(self.script_color_allies) || isdefined(self.script_forcecolor);
	}
	if(self.team == #"axis")
	{
		return isdefined(self.script_color_axis) || isdefined(self.script_forcecolor);
	}
	if(self.team == #"team3")
	{
		return isdefined(self.var_15eb6ad5) || isdefined(self.script_forcecolor);
	}
	return 0;
}

/*
	Name: get_force_color
	Namespace: colors
	Checksum: 0x78D88925
	Offset: 0x5DE0
	Size: 0x1A
	Parameters: 0
	Flags: Linked
*/
function get_force_color()
{
	color = self.script_forcecolor;
	return color;
}

/*
	Name: get_force_color_guys
	Namespace: colors
	Checksum: 0x1334331A
	Offset: 0x5E08
	Size: 0xB0
	Parameters: 2
	Flags: Linked
*/
function get_force_color_guys(team, color)
{
	ai = getaiteamarray(team);
	guys = [];
	for(i = 0; i < ai.size; i++)
	{
		guy = ai[i];
		if(!isdefined(guy.script_forcecolor))
		{
			continue;
		}
		if(guy.script_forcecolor != color)
		{
			continue;
		}
		guys[guys.size] = guy;
	}
	return guys;
}

/*
	Name: get_all_force_color_friendlies
	Namespace: colors
	Checksum: 0xDBFC310B
	Offset: 0x5EC0
	Size: 0x90
	Parameters: 0
	Flags: None
*/
function get_all_force_color_friendlies()
{
	ai = getaiteamarray(#"allies");
	guys = [];
	for(i = 0; i < ai.size; i++)
	{
		guy = ai[i];
		if(!isdefined(guy.script_forcecolor))
		{
			continue;
		}
		guys[guys.size] = guy;
	}
	return guys;
}

/*
	Name: disable
	Namespace: colors
	Checksum: 0x6BDE8574
	Offset: 0x5F58
	Size: 0xE4
	Parameters: 0
	Flags: Linked
*/
function disable()
{
	if(isdefined(self.new_force_color_being_set))
	{
		self endon(#"death");
		self waittill(#"done_setting_new_color");
	}
	if(!isdefined(self.script_forcecolor))
	{
		return;
	}
	/#
		assert(!isdefined(self.old_forcecolor), "");
	#/
	self.old_forcecolor = self.script_forcecolor;
	arrayremovevalue(level.arrays_of_colorforced_ai[self.team][self.script_forcecolor], self);
	left_color_node();
	self.script_forcecolor = undefined;
	self.currentcolorcode = undefined;
	/#
		update_debug_friendlycolor();
	#/
}

/*
	Name: enable
	Namespace: colors
	Checksum: 0x9DC9F316
	Offset: 0x6048
	Size: 0x46
	Parameters: 0
	Flags: Linked
*/
function enable()
{
	if(isdefined(self.script_forcecolor))
	{
		return;
	}
	if(!isdefined(self.old_forcecolor))
	{
		return;
	}
	set_force_color(self.old_forcecolor);
	self.old_forcecolor = undefined;
}

/*
	Name: is_color_ai
	Namespace: colors
	Checksum: 0xB87F95E6
	Offset: 0x6098
	Size: 0x1A
	Parameters: 0
	Flags: None
*/
function is_color_ai()
{
	return isdefined(self.script_forcecolor) || isdefined(self.old_forcecolor);
}

/*
	Name: function_e4e541a8
	Namespace: colors
	Checksum: 0xBC67C311
	Offset: 0x60C0
	Size: 0xE0
	Parameters: 2
	Flags: Linked, Private
*/
function private function_e4e541a8(node, volume)
{
	self endon(#"death", #"stop_being_careful", #"stop_going_to_node");
	if(!isdefined(self.var_69acdce1))
	{
		self.var_69acdce1 = self.fixednode;
	}
	thread recover_from_careful_disable(node);
	for(;;)
	{
		wait_until_an_enemy_is_in_safe_area(node, volume);
		function_7960438b(node, volume);
		function_39d66928(node, volume);
		self.fixednode = self.var_69acdce1;
		set_goal_and_volume(node);
	}
}

/*
	Name: recover_from_careful_disable
	Namespace: colors
	Checksum: 0x9A5C655A
	Offset: 0x61A8
	Size: 0x6C
	Parameters: 1
	Flags: Linked, Private
*/
function private recover_from_careful_disable(node)
{
	self endon(#"death", #"stop_going_to_node");
	self waittill(#"stop_being_careful");
	self.fixednode = self.var_69acdce1;
	self.var_69acdce1 = undefined;
	set_goal_and_volume(node);
}

/*
	Name: function_7960438b
	Namespace: colors
	Checksum: 0x7D0CBFB0
	Offset: 0x6220
	Size: 0x72
	Parameters: 2
	Flags: Linked, Private
*/
function private function_7960438b(node, volume)
{
	self setgoal(self.origin);
	if(isdefined(level.var_e81d9a30))
	{
		self.goalradius = level.var_e81d9a30;
	}
	else
	{
		self.goalradius = 1024;
	}
	self.fixednode = 0;
}

/*
	Name: wait_until_an_enemy_is_in_safe_area
	Namespace: colors
	Checksum: 0x1E853AC3
	Offset: 0x62A0
	Size: 0x3A
	Parameters: 2
	Flags: Linked, Private
*/
function private wait_until_an_enemy_is_in_safe_area(node, volume)
{
	for(;;)
	{
		if(function_c73b2e00(node, volume))
		{
			return;
		}
		wait(1);
	}
}

/*
	Name: function_39d66928
	Namespace: colors
	Checksum: 0x5033D14
	Offset: 0x62E8
	Size: 0x3A
	Parameters: 2
	Flags: Linked, Private
*/
function private function_39d66928(node, volume)
{
	for(;;)
	{
		if(!function_c73b2e00(node, volume))
		{
			return;
		}
		wait(1);
	}
}

/*
	Name: function_c73b2e00
	Namespace: colors
	Checksum: 0x47BDE337
	Offset: 0x6330
	Size: 0x88
	Parameters: 2
	Flags: Linked, Private
*/
function private function_c73b2e00(node, volume)
{
	/#
		assert(isdefined(node));
	#/
	if(self isknownenemyinradius(node.origin, self.fixednodesaferadius))
	{
		return true;
	}
	if(isdefined(volume) && self isknownenemyinvolume(volume))
	{
		return true;
	}
	return false;
}

/*
	Name: insure_player_does_not_set_forcecolor_twice_in_one_frame
	Namespace: colors
	Checksum: 0x874F79A5
	Offset: 0x63C0
	Size: 0x6A
	Parameters: 0
	Flags: None
*/
function insure_player_does_not_set_forcecolor_twice_in_one_frame()
{
	/#
		/#
			assert(!isdefined(self.setforcecolor), "");
		#/
		self.setforcecolor = 1;
		waittillframeend();
		if(!isalive(self))
		{
			return;
		}
		self.setforcecolor = undefined;
	#/
}

