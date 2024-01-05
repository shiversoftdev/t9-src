#using script_68d08b784c92da95;
#using script_7e3221b6c80d8cc4;
#using script_912160eeb6a2d51;
#using script_6c5ee33879e077f8;
#using script_139ae0bb0a87141c;
#using script_4f58b276cb938e94;
#using script_3eb3df5aef50b41c;
#using script_5450c003e8a913b7;
#using scripts\cp_common\util.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\flag_shared.gsc;

#namespace utility;

/*
	Name: scalevolume
	Namespace: utility
	Checksum: 0x376272A3
	Offset: 0x2C8
	Size: 0x14
	Parameters: 2
	Flags: None
*/
function scalevolume(ent, vol)
{
}

#namespace namespace_979752dc;

/*
	Name: get_group
	Namespace: namespace_979752dc
	Checksum: 0x4B4D49FB
	Offset: 0x2E8
	Size: 0x5A
	Parameters: 1
	Flags: None
*/
function get_group(name)
{
	if(!isdefined(level.stealth.groupdata.groups[name]))
	{
		return undefined;
	}
	return level.stealth.groupdata.groups[name].members;
}

/*
	Name: group_flag_clear
	Namespace: namespace_979752dc
	Checksum: 0x46E7EC9D
	Offset: 0x350
	Size: 0x17C
	Parameters: 2
	Flags: Linked
*/
function group_flag_clear(f, group)
{
	name = get_group_flagname(f, group);
	level flag::clear(name);
	array = level.stealth.group.flags[f];
	clear = 1;
	foreach(value in array)
	{
		if(!issubstr(value, "allies") && level flag::get(value))
		{
			return;
		}
	}
	if(level flag::get(name) && self != level)
	{
		self notify(f);
	}
	level flag::clear(f);
}

/*
	Name: group_flag_set
	Namespace: namespace_979752dc
	Checksum: 0x5BD7B293
	Offset: 0x4D8
	Size: 0xBC
	Parameters: 1
	Flags: Linked
*/
function group_flag_set(f)
{
	/#
		assert(issentient(self), "");
	#/
	name = self get_group_flagname(f);
	if(!level flag::get(name) && self != level)
	{
		self notify(f);
	}
	level flag::set(name);
	level flag::set(f);
}

/*
	Name: group_flag
	Namespace: namespace_979752dc
	Checksum: 0x70FD3379
	Offset: 0x5A0
	Size: 0x72
	Parameters: 1
	Flags: None
*/
function group_flag(f)
{
	/#
		assert(issentient(self), "");
	#/
	name = self get_group_flagname(f);
	return level flag::get(name);
}

/*
	Name: get_group_flagname
	Namespace: namespace_979752dc
	Checksum: 0x76AC0976
	Offset: 0x620
	Size: 0x7A
	Parameters: 2
	Flags: Linked
*/
function get_group_flagname(f, group)
{
	if(!isdefined(group))
	{
		/#
			assert(issentient(self), "");
		#/
		group = self.script_stealthgroup;
	}
	name = (f + ("-Group:")) + group;
	return name;
}

/*
	Name: group_flag_wait
	Namespace: namespace_979752dc
	Checksum: 0xD883FA16
	Offset: 0x6A8
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function group_flag_wait(f)
{
	name = get_group_flagname(f);
	level flag::wait_till(name);
}

/*
	Name: group_flag_waitopen
	Namespace: namespace_979752dc
	Checksum: 0x3DF87F75
	Offset: 0x6F8
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function group_flag_waitopen(f)
{
	name = get_group_flagname(f);
	level flag::wait_till_clear(name);
}

/*
	Name: function_9b4d5512
	Namespace: namespace_979752dc
	Checksum: 0x5A81354C
	Offset: 0x748
	Size: 0x54
	Parameters: 2
	Flags: None
*/
function function_9b4d5512(f, timer)
{
	name = get_group_flagname(f);
	level flag::wait_till_timeout(timer, name);
}

/*
	Name: group_flag_waitopen_or_timeout
	Namespace: namespace_979752dc
	Checksum: 0xF3572916
	Offset: 0x7A8
	Size: 0x54
	Parameters: 2
	Flags: None
*/
function group_flag_waitopen_or_timeout(f, timer)
{
	name = get_group_flagname(f);
	level flag::wait_till_clear_timeout(timer, name);
}

/*
	Name: group_flag_init
	Namespace: namespace_979752dc
	Checksum: 0x5C351D34
	Offset: 0x808
	Size: 0x1BA
	Parameters: 1
	Flags: Linked
*/
function group_flag_init(f)
{
	/#
		assert(issentient(self), "");
	#/
	if(isdefined(self.script_stealthgroup))
	{
		self.script_stealthgroup = string(self.script_stealthgroup);
	}
	else
	{
		self.script_stealthgroup = "default";
	}
	if(self.team == "allies")
	{
		self.script_stealthgroup = self.script_stealthgroup + "allies";
	}
	if(!level flag::exists(f))
	{
		level flag::init(f);
	}
	name = self get_group_flagname(f);
	if(!level flag::exists(name))
	{
		level flag::init(name);
		if(!isdefined(level.stealth.group.flags[f]))
		{
			level.stealth.group.flags[f] = [];
		}
		level.stealth.group.flags[f][level.stealth.group.flags[f].size] = name;
	}
	return name;
}

/*
	Name: function_740dbf99
	Namespace: namespace_979752dc
	Checksum: 0xDCD5B6C0
	Offset: 0x9D0
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function function_740dbf99()
{
	level flag::clear("stealth_spotted");
	level flag::clear("stealth_meter_combat_alerted");
}

/*
	Name: group_setcombatgoalradius
	Namespace: namespace_979752dc
	Checksum: 0xEA523F5C
	Offset: 0xA20
	Size: 0x74
	Parameters: 2
	Flags: None
*/
function group_setcombatgoalradius(group, goalradius)
{
	/#
		assert(isdefined(level.stealth));
	#/
	if(!isdefined(level.stealth.combat_goalradius))
	{
		level.stealth.combat_goalradius = [];
	}
	level.stealth.combat_goalradius[group] = goalradius;
}

/*
	Name: group_add
	Namespace: namespace_979752dc
	Checksum: 0xF2B72F6E
	Offset: 0xAA0
	Size: 0xE2
	Parameters: 0
	Flags: Linked
*/
function group_add()
{
	/#
		assert(issentient(self), "");
	#/
	if(!isdefined(level.stealth.group.groups[self.script_stealthgroup]))
	{
		level.stealth.group.groups[self.script_stealthgroup] = [];
		level.stealth.group notify(self.script_stealthgroup);
	}
	level.stealth.group.groups[self.script_stealthgroup][level.stealth.group.groups[self.script_stealthgroup].size] = self;
}

/*
	Name: group_spotted_flag
	Namespace: namespace_979752dc
	Checksum: 0xB4706F51
	Offset: 0xB90
	Size: 0x82
	Parameters: 0
	Flags: Linked
*/
function group_spotted_flag()
{
	/#
		assert(self.team != "", "");
	#/
	/#
		assert(isdefined(self.stealth.var_103386e8));
	#/
	return level flag::get(self.stealth.var_103386e8);
}

/*
	Name: any_groups_in_combat
	Namespace: namespace_979752dc
	Checksum: 0x41519FFA
	Offset: 0xC20
	Size: 0x10A
	Parameters: 1
	Flags: Linked
*/
function any_groups_in_combat(stealthgroups)
{
	if(!level flag::get("stealth_enabled"))
	{
		return false;
	}
	foreach(group in level.stealth.groupdata.groups)
	{
		if(isdefined(stealthgroups) && !array::contains(stealthgroups, group.name))
		{
			continue;
		}
		if(stealth_group::group_anyoneincombat(group.name))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: get_stealth_state
	Namespace: namespace_979752dc
	Checksum: 0xA74107F4
	Offset: 0xD38
	Size: 0x82
	Parameters: 0
	Flags: Linked
*/
function get_stealth_state()
{
	switch(self.stealth.state)
	{
		case 0:
		{
			return "normal";
		}
		case 1:
		{
			return "warning";
		}
		case 2:
		{
			return "warning";
		}
		case 3:
		{
			return "attack";
		}
	}
}

/*
	Name: set_stealth_state
	Namespace: namespace_979752dc
	Checksum: 0xD1F8E84A
	Offset: 0xDC8
	Size: 0xA6
	Parameters: 1
	Flags: Linked
*/
function set_stealth_state(msg)
{
	switch(msg)
	{
		case "attack":
		{
			num = 3;
			break;
		}
		case "warning2":
		{
			num = 2;
			break;
		}
		case "warning1":
		{
			num = 1;
			break;
		}
		default:
		{
			num = 0;
			break;
		}
	}
	self.stealth.state = num;
}

/*
	Name: check_stealth
	Namespace: namespace_979752dc
	Checksum: 0x1E5DCB7D
	Offset: 0xE78
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function check_stealth()
{
	/#
		assert(isdefined(self.stealth), "" + self.origin);
	#/
}

/*
	Name: alertlevel_init_map
	Namespace: namespace_979752dc
	Checksum: 0x8BC9B8F
	Offset: 0xEB8
	Size: 0x1F4
	Parameters: 0
	Flags: Linked
*/
function alertlevel_init_map()
{
	level.stealth.alert_levels_exe = [];
	level.stealth.alert_levels_exe[#"normal"] = "noncombat";
	level.stealth.alert_levels_exe[#"reset"] = "noncombat";
	level.stealth.alert_levels_exe[#"warning1"] = "low_alert";
	level.stealth.alert_levels_exe[#"warning2"] = "high_alert";
	level.stealth.alert_levels_exe[#"combat_hunt"] = "high_alert";
	level.stealth.alert_levels_exe[#"attack"] = "combat";
	level.stealth.alert_levels_int = [];
	level.stealth.alert_levels_int[#"normal"] = 0;
	level.stealth.alert_levels_int[#"reset"] = 0;
	level.stealth.alert_levels_int[#"warning1"] = 2;
	level.stealth.alert_levels_int[#"warning2"] = 3;
	level.stealth.alert_levels_int[#"combat_hunt"] = 3;
	level.stealth.alert_levels_int[#"attack"] = 4;
	level.stealth.alert_levels_exe[#"combat"] = 4;
}

/*
	Name: alertlevel_script_to_exe
	Namespace: namespace_979752dc
	Checksum: 0x95CA3292
	Offset: 0x10B8
	Size: 0x46
	Parameters: 1
	Flags: Linked
*/
function alertlevel_script_to_exe(alertlevel)
{
	if(isdefined(level.stealth.alert_levels_exe[alertlevel]))
	{
		return level.stealth.alert_levels_exe[alertlevel];
	}
	return alertlevel;
}

/*
	Name: function_7211414e
	Namespace: namespace_979752dc
	Checksum: 0xC0E7A88
	Offset: 0x1108
	Size: 0x46
	Parameters: 1
	Flags: Linked
*/
function function_7211414e(alertlevel)
{
	if(isdefined(level.stealth.alert_levels_int[alertlevel]))
	{
		return level.stealth.alert_levels_int[alertlevel];
	}
	return -1;
}

/*
	Name: set_detect_ranges
	Namespace: namespace_979752dc
	Checksum: 0x55283BF8
	Offset: 0x1158
	Size: 0x5C
	Parameters: 2
	Flags: Linked
*/
function set_detect_ranges(hidden, spotted)
{
	if(!isdefined(hidden) && !isdefined(spotted))
	{
		/#
			assertmsg("");
		#/
	}
	namespace_393f6012::set_detect_ranges_internal(hidden, spotted);
}

/*
	Name: set_min_detect_range_darkness
	Namespace: namespace_979752dc
	Checksum: 0x3BDD714E
	Offset: 0x11C0
	Size: 0x206
	Parameters: 2
	Flags: Linked
*/
function set_min_detect_range_darkness(hidden, spotted)
{
	if(!isdefined(hidden) && !isdefined(spotted))
	{
		/#
			assertmsg("");
		#/
	}
	if(isdefined(hidden))
	{
		level.stealth.detect.minrangedarkness[#"hidden"][#"prone"] = hidden[#"prone"];
		level.stealth.detect.minrangedarkness[#"hidden"][#"crouch"] = hidden[#"crouch"];
		level.stealth.detect.minrangedarkness[#"hidden"][#"stand"] = hidden[#"stand"];
	}
	if(isdefined(spotted))
	{
		level.stealth.detect.minrangedarkness[#"spotted"][#"prone"] = spotted[#"prone"];
		level.stealth.detect.minrangedarkness[#"spotted"][#"crouch"] = spotted[#"crouch"];
		level.stealth.detect.minrangedarkness[#"spotted"][#"stand"] = spotted[#"stand"];
	}
}

/*
	Name: do_stealth
	Namespace: namespace_979752dc
	Checksum: 0x9DB66271
	Offset: 0x13D0
	Size: 0xA2
	Parameters: 0
	Flags: Linked
*/
function do_stealth()
{
	switch(self.team)
	{
		case "axis":
		case "team3":
		{
			self thread namespace_f1f700ac::main();
			break;
		}
		case "allies":
		{
			self thread namespace_32a4062b::main();
			break;
		}
		case "neutral":
		{
			self thread namespace_578db516::main();
			break;
		}
	}
}

/*
	Name: save_last_goal
	Namespace: namespace_979752dc
	Checksum: 0x3D792ED
	Offset: 0x1480
	Size: 0x180
	Parameters: 0
	Flags: Linked
*/
function save_last_goal()
{
	if(isdefined(self.stealth.last_goal))
	{
		return "exists";
	}
	result = "goal";
	self.saved_script_forcegoal = self.script_forcegoal;
	if(isdefined(self.last_set_goalnode))
	{
		self.stealth.last_goal = self.last_set_goalnode;
	}
	else
	{
		if(isdefined(self.last_set_goalent))
		{
			self.stealth.last_goal = self.last_set_goalent.origin;
		}
		else
		{
			if(isdefined(self.last_set_goalpos))
			{
				self.stealth.last_goal = self.last_set_goalpos;
			}
			else
			{
				if(isdefined(self.go_to_node))
				{
					self.stealth.last_goal = self spawner::function_461ce3e9();
					result = "go_to_node";
				}
				else
				{
					self.stealth.last_goal = spawnstruct();
					self.stealth.last_goal.origin = self.origin;
					self.stealth.last_goal.angles = self.angles;
				}
			}
		}
	}
	if(isdefined(self.stealth.last_goal))
	{
		return result;
	}
	return undefined;
}

/*
	Name: set_patrol_move_loop_anim
	Namespace: namespace_979752dc
	Checksum: 0x3CB94AFE
	Offset: 0x1608
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function set_patrol_move_loop_anim(animoverride)
{
	/#
		assertmsg("");
	#/
}

/*
	Name: set_default_patrol_style
	Namespace: namespace_979752dc
	Checksum: 0x13DF5181
	Offset: 0x1640
	Size: 0x5C
	Parameters: 1
	Flags: None
*/
function set_default_patrol_style(style)
{
	self.stealth.default_patrol_style = style;
	if(isdefined(self.stealth.default_patrol_style))
	{
		self set_patrol_style(self.stealth.default_patrol_style);
	}
}

/*
	Name: get_patrol_react_magnitude_int
	Namespace: namespace_979752dc
	Checksum: 0xC0CB6C4
	Offset: 0x16A8
	Size: 0x8C
	Parameters: 1
	Flags: Linked
*/
function get_patrol_react_magnitude_int(style)
{
	switch(style)
	{
		case "small":
		{
			return 0;
		}
		case "small_medium":
		{
			return 1;
		}
		case "medium":
		{
			return 2;
		}
		case "large":
		{
			return 3;
		}
	}
	/#
		assertmsg("");
	#/
}

/*
	Name: set_patrol_style
	Namespace: namespace_979752dc
	Checksum: 0xC0E9569F
	Offset: 0x1740
	Size: 0x144
	Parameters: 4
	Flags: Linked
*/
function set_patrol_style(style, allowreact, var_10547fe1, magnitude)
{
	if(style == "unaware")
	{
		style = "patrol";
	}
	var_70fd8440 = -1;
	/#
		var_70fd8440 = getdvarint(#"hash_4aa9c88072661ef2", -1);
	#/
	if(var_70fd8440 < 0)
	{
		self ai::set_behavior_attribute("demeanor", style);
	}
	self.stealth.var_458bda8 = style;
	if(style == "cqb")
	{
		var_68c74e4f = 60;
		if(isdefined(self.stealth.hunt_speed))
		{
			var_68c74e4f = self.stealth.hunt_speed;
		}
		self set_movement_speed(var_68c74e4f);
	}
	if(is_true(allowreact))
	{
		self set_patrol_react(var_10547fe1, magnitude, style);
	}
}

/*
	Name: get_patrol_style
	Namespace: namespace_979752dc
	Checksum: 0xFD4C5113
	Offset: 0x1890
	Size: 0x32
	Parameters: 0
	Flags: Linked
*/
function get_patrol_style()
{
	/#
		assert(isdefined(self.stealth));
	#/
	return self.stealth.var_458bda8;
}

/*
	Name: get_patrol_style_default
	Namespace: namespace_979752dc
	Checksum: 0x4C241692
	Offset: 0x18D0
	Size: 0x3E
	Parameters: 0
	Flags: Linked
*/
function get_patrol_style_default()
{
	default_patrol_style = self.stealth.default_patrol_style;
	if(!isdefined(default_patrol_style))
	{
		default_patrol_style = level.stealth.default_patrol_style;
	}
	return default_patrol_style;
}

/*
	Name: function_2b21025e
	Namespace: namespace_979752dc
	Checksum: 0x7CBB3D3D
	Offset: 0x1918
	Size: 0x76
	Parameters: 1
	Flags: Linked
*/
function function_2b21025e(position)
{
	if(!isdefined(self.stealth.var_d54b515e))
	{
		self.stealth.var_d54b515e = spawnstruct();
	}
	self.stealth.var_d54b515e.position = position;
	self.stealth.var_d54b515e.settime = gettime();
}

/*
	Name: function_b0c91323
	Namespace: namespace_979752dc
	Checksum: 0xD2BA3743
	Offset: 0x1998
	Size: 0xC2
	Parameters: 1
	Flags: Linked
*/
function function_b0c91323(var_affacce)
{
	if(!isdefined(var_affacce))
	{
		var_affacce = 0;
	}
	if(!isdefined(self.stealth.var_d54b515e.position))
	{
		return false;
	}
	currenttime = gettime();
	if(currenttime > self.stealth.var_d54b515e.settime + 100)
	{
		return false;
	}
	if(var_affacce)
	{
		if(isdefined(self.stealth.var_d54b515e.var_868dbad) && currenttime == self.stealth.var_d54b515e.var_868dbad)
		{
			return false;
		}
	}
	return true;
}

/*
	Name: function_ab75abf3
	Namespace: namespace_979752dc
	Checksum: 0xAF2EFAC0
	Offset: 0x1A68
	Size: 0x1E
	Parameters: 0
	Flags: Linked
*/
function function_ab75abf3()
{
	self.stealth.var_d54b515e.var_868dbad = gettime();
}

/*
	Name: set_patrol_react
	Namespace: namespace_979752dc
	Checksum: 0x384F0271
	Offset: 0x1A90
	Size: 0x254
	Parameters: 3
	Flags: Linked
*/
function set_patrol_react(position, magnitude, style)
{
	if(!isdefined(style) || style != "combat")
	{
		if(isdefined(self.stealth.var_5cc4aa60) && self.stealth.var_5cc4aa60 > gettime())
		{
			return;
		}
	}
	if(isdefined(self.stealth.breacting))
	{
		if(get_patrol_react_magnitude_int(self.stealth.breacting) >= get_patrol_react_magnitude_int(magnitude))
		{
			return;
		}
	}
	/#
		/#
			assert(magnitude == "" || magnitude == "" || magnitude == "" || magnitude == "");
		#/
	#/
	if(self.alertlevel == "combat" && magnitude != "large")
	{
		magnitude = "large";
	}
	self.stealth.patrol_react_magnitude = magnitude;
	self.stealth.patrol_react_pos = position;
	self.stealth.patrol_react_time = gettime();
	self.stealth.var_527ef51c = self haspath();
	if(self isinscriptedstate() && is_true(self._scene_object._s.var_b1ca85fc) && !self flag::get("in_action"))
	{
		[[ self._scene_object._o_scene ]]->stop();
	}
	self setblackboardattribute("_react_magnitude", self.stealth.patrol_react_magnitude);
}

/*
	Name: set_goal
	Namespace: namespace_979752dc
	Checksum: 0xEB4999E6
	Offset: 0x1CF0
	Size: 0x180
	Parameters: 3
	Flags: Linked
*/
function set_goal(goal, faceangles, goalradius)
{
	if(!isdefined(goalradius))
	{
		goalradius = 16;
	}
	result = 1;
	if(self flag::get("stealth_goal_override"))
	{
		return;
	}
	self.keepclaimednode = 0;
	self.keepclaimednodeifvalid = 0;
	if(isdefined(faceangles))
	{
		goalstruct = spawnstruct();
		if(isvec(goal))
		{
			goalstruct.origin = goal;
		}
		else
		{
			goalstruct.origin = goal.origin;
		}
		goalstruct.angles = faceangles;
		goal = goalstruct;
	}
	self setgoal(goal);
	if(ispathnode(goal))
	{
		result = self usecovernode(goal);
	}
	else
	{
		self usecovernode(undefined);
	}
	if(goalradius <= 0)
	{
		goalradius = undefined;
	}
	self set_goal_radius(goalradius);
	return result;
}

/*
	Name: set_goal_radius
	Namespace: namespace_979752dc
	Checksum: 0xC6245E2C
	Offset: 0x1E78
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function set_goal_radius(newradius)
{
	if(isdefined(newradius))
	{
		self val::set(#"stealth", "goalradius", newradius);
	}
	else
	{
		self val::reset(#"stealth", "goalradius");
	}
}

/*
	Name: alert_delay_distance_time
	Namespace: namespace_979752dc
	Checksum: 0x785B9CAB
	Offset: 0x1EF0
	Size: 0x1B2
	Parameters: 1
	Flags: Linked
*/
function alert_delay_distance_time(other)
{
	maxwait = 2;
	if(isdefined(self.stealth.maxalertdelay))
	{
		maxwait = self.stealth.maxalertdelay;
	}
	if(self [[self.fnisinstealthinvestigate]]())
	{
		maxwait = min(1.5, maxwait);
	}
	else if(self [[self.fnisinstealthhunt]]())
	{
		maxwait = min(1, maxwait);
	}
	var_fc45584 = 0.1;
	minwait = 0.4;
	mindist = 64;
	maxdist = 1024;
	dist2d = distance2d(self.origin, other.origin);
	if(dist2d < mindist)
	{
		timefactor = mapfloat(0, mindist, 0, mindist, dist2d);
		waittime = lerpfloat(var_fc45584, minwait, timefactor);
	}
	else
	{
		timefactor = mapfloat(mindist, maxdist, mindist, maxdist, dist2d);
		waittime = lerpfloat(minwait, maxwait, timefactor);
	}
	return waittime;
}

/*
	Name: set_path_dist
	Namespace: namespace_979752dc
	Checksum: 0xBEF9942C
	Offset: 0x20B0
	Size: 0x3A
	Parameters: 1
	Flags: None
*/
function set_path_dist(ent)
{
	ent.distsqrd = get_path_dist_sq(self.origin, ent.origin, self);
}

/*
	Name: get_path_dist_sq
	Namespace: namespace_979752dc
	Checksum: 0xE396DD32
	Offset: 0x20F8
	Size: 0xB4
	Parameters: 3
	Flags: Linked
*/
function get_path_dist_sq(from, to, var_58924346)
{
	path = self findpath(from, to);
	if(isdefined(var_58924346))
	{
		var_58924346.path = path;
	}
	distsq = 0;
	for(i = 1; i < path.size; i++)
	{
		distsq = distsq + (distancesquared(path[i - 1], path[i]));
	}
	return distsq;
}

/*
	Name: remove_path_dist
	Namespace: namespace_979752dc
	Checksum: 0x861ED2BD
	Offset: 0x21B8
	Size: 0x16
	Parameters: 0
	Flags: None
*/
function remove_path_dist()
{
	self.path = undefined;
	self.distsqrd = undefined;
}

/*
	Name: is_visible
	Namespace: namespace_979752dc
	Checksum: 0x8184E8FF
	Offset: 0x21D8
	Size: 0xC6
	Parameters: 1
	Flags: Linked
*/
function is_visible(other)
{
	if(isplayer(self))
	{
		if(util::within_fov(self.origin, self.angles, other.origin, 0.766))
		{
			if(isdefined(other.tagging_visible) || self tagging_shield())
			{
				return 1;
			}
			if(util::can_see_ai(self, other, 250))
			{
				return 1;
			}
		}
	}
	else
	{
		return self cansee(other);
	}
	return 0;
}

/*
	Name: tagging_shield
	Namespace: namespace_979752dc
	Checksum: 0xE35B899A
	Offset: 0x22A8
	Size: 0x38
	Parameters: 0
	Flags: Linked
*/
function tagging_shield()
{
	return isdefined(self.offhandshield) && isdefined(self.offhandshield.active) && self.offhandshield.active;
}

/*
	Name: getcorpseorigin
	Namespace: namespace_979752dc
	Checksum: 0x56656D2E
	Offset: 0x22E8
	Size: 0x9A
	Parameters: 0
	Flags: Linked
*/
function getcorpseorigin()
{
	if(isdefined(level.stealth))
	{
		if(isdefined(level.stealth.additional_corpse) && isdefined(level.stealth.additional_corpse[self getentitynumber()]))
		{
			return self.origin;
		}
		if(isdefined(level.stealth.fngetcorpseorigin))
		{
			return [[level.stealth.fngetcorpseorigin]]();
		}
	}
	return self.origin;
}

/*
	Name: setbattlechatter
	Namespace: namespace_979752dc
	Checksum: 0xF6123A2F
	Offset: 0x2390
	Size: 0x50
	Parameters: 1
	Flags: Linked
*/
function setbattlechatter(state)
{
	if(isdefined(level.stealth) && isdefined(level.stealth.fnsetbattlechatter))
	{
		return [[level.stealth.fnsetbattlechatter]](state);
	}
}

/*
	Name: function_f5f4416f
	Namespace: namespace_979752dc
	Checksum: 0x58CB608A
	Offset: 0x23E8
	Size: 0x88
	Parameters: 6
	Flags: Linked
*/
function function_f5f4416f(eventaction, eventtype, modifier, delay, eventstruct, force)
{
	if(isdefined(level.stealth) && isdefined(level.stealth.fnaddeventplaybcs))
	{
		[[level.stealth.fnaddeventplaybcs]](eventaction, eventtype, modifier, delay, eventstruct, force, 1);
	}
}

/*
	Name: addeventplaybcs
	Namespace: namespace_979752dc
	Checksum: 0xFE1F1F3D
	Offset: 0x2478
	Size: 0x84
	Parameters: 6
	Flags: Linked
*/
function addeventplaybcs(eventaction, eventtype, modifier, delay, eventstruct, force)
{
	if(isdefined(level.stealth) && isdefined(level.stealth.fnaddeventplaybcs))
	{
		[[level.stealth.fnaddeventplaybcs]](eventaction, eventtype, modifier, delay, eventstruct, force, 0);
	}
}

/*
	Name: stealth_music
	Namespace: namespace_979752dc
	Checksum: 0x6EA7980E
	Offset: 0x2508
	Size: 0x204
	Parameters: 2
	Flags: Linked
*/
function stealth_music(var_901d9fb2, var_4a9f6f96)
{
	self notify(#"stealth_music");
	self endon(#"stealth_music");
	self thread stealth_music_pause_monitor();
	while(true)
	{
		level flag::wait_till("stealth_enabled");
		level flag::wait_till_clear("stealth_spotted");
		level flag::wait_till_clear("stealth_music_pause");
		foreach(player in getplayers())
		{
			player thread stealth_music_transition(var_901d9fb2);
		}
		level flag::wait_till("stealth_spotted");
		level flag::wait_till_clear("stealth_music_pause");
		foreach(player in getplayers())
		{
			player thread stealth_music_transition(var_4a9f6f96);
		}
	}
}

/*
	Name: stealth_music_stop
	Namespace: namespace_979752dc
	Checksum: 0x65A790DB
	Offset: 0x2718
	Size: 0xB8
	Parameters: 0
	Flags: Linked
*/
function stealth_music_stop()
{
	self notify(#"stealth_music");
	self notify(#"stealth_music_pause_monitor");
	foreach(player in getplayers())
	{
		player thread stealth_music_transition(undefined);
	}
}

/*
	Name: stealth_music_pause_monitor
	Namespace: namespace_979752dc
	Checksum: 0xA44CEC95
	Offset: 0x27D8
	Size: 0x23C
	Parameters: 2
	Flags: Linked
*/
function stealth_music_pause_monitor(var_901d9fb2, var_4a9f6f96)
{
	self notify(#"stealth_music_pause_monitor");
	self endon(#"stealth_music_pause_monitor");
	while(true)
	{
		level flag::wait_till("stealth_music_pause");
		foreach(player in getplayers())
		{
			player thread stealth_music_transition(undefined);
		}
		level flag::wait_till_clear("stealth_music_pause");
		if(level flag::get("stealth_spotted"))
		{
			foreach(player in getplayers())
			{
				player thread stealth_music_transition(var_4a9f6f96);
			}
		}
		else
		{
			foreach(player in getplayers())
			{
				player thread stealth_music_transition(var_901d9fb2);
			}
		}
	}
}

/*
	Name: stealth_music_transition
	Namespace: namespace_979752dc
	Checksum: 0x9746ED4
	Offset: 0x2A20
	Size: 0x28
	Parameters: 1
	Flags: Linked
*/
function stealth_music_transition(var_73b39a)
{
	if(isdefined(self.fnstealthmusictransition))
	{
		return [[self.fnstealthmusictransition]](var_73b39a);
	}
}

/*
	Name: update_light_meter
	Namespace: namespace_979752dc
	Checksum: 0xA47B04FD
	Offset: 0x2A50
	Size: 0x20
	Parameters: 0
	Flags: Linked
*/
function update_light_meter()
{
	if(isdefined(self.fnupdatelightmeter))
	{
		return [[self.fnupdatelightmeter]]();
	}
}

/*
	Name: set_disguised
	Namespace: namespace_979752dc
	Checksum: 0x5CB7FA30
	Offset: 0x2A78
	Size: 0x40
	Parameters: 1
	Flags: Linked
*/
function set_disguised(disguised)
{
	if(isdefined(level.stealth.fnsetdisguised))
	{
		self [[level.stealth.fnsetdisguised]](disguised);
	}
}

/*
	Name: set_disguised_default
	Namespace: namespace_979752dc
	Checksum: 0x54D2A338
	Offset: 0x2AC0
	Size: 0x350
	Parameters: 1
	Flags: Linked
*/
function set_disguised_default(disguised)
{
	if(!isdefined(disguised))
	{
		disguised = 0;
	}
	if(disguised)
	{
		level.stealth.disguised = 1;
		level.stealth.threatsightratescale = 0.5;
		level.stealth.threatsightdistscale = 0.5;
		level.stealth.proximity_combat_radius_bump = 0;
		level.stealth.proximity_combat_radius_sight = 0;
		level.stealth.proximity_combat_radius_fake_sight = 0;
		setsaveddvar(#"hash_12c53cd4a01caff3", 0.25);
		setsaveddvar(#"hash_5edb3c8437c5990e", cos(90));
		setsaveddvar(#"hash_30eedc859ec98ad", 0.025);
		setsaveddvar(#"hash_5aaea648688ff01e", 0.25);
	}
	else
	{
		level.stealth.disguised = undefined;
		level.stealth.threatsightratescale = undefined;
		level.stealth.threatsightdistscale = undefined;
		level.stealth.proximity_combat_radius_bump = 50;
		level.stealth.proximity_combat_radius_sight = 100;
		level.stealth.proximity_combat_radius_fake_sight = 60;
		setsaveddvar(#"hash_12c53cd4a01caff3", 0.5);
		setsaveddvar(#"hash_5edb3c8437c5990e", cos(180));
		setsaveddvar(#"hash_30eedc859ec98ad", 0.01);
		setsaveddvar(#"hash_5aaea648688ff01e", 0.1);
	}
	ailist = getactorarray();
	foreach(ai in ailist)
	{
		if(!isalive(ai))
		{
			continue;
		}
		if(isdefined(ai.stealth) && isdefined(ai.stealth.threat_sight_state))
		{
			ai namespace_6c0cd084::threat_sight_set_state_parameters();
		}
	}
}

/*
	Name: stealth_override_goal
	Namespace: namespace_979752dc
	Checksum: 0x974D643F
	Offset: 0x2E18
	Size: 0x14A
	Parameters: 1
	Flags: None
*/
function stealth_override_goal(override)
{
	/#
		assert(isdefined(self.stealth));
	#/
	if(!isdefined(override))
	{
		override = 0;
	}
	if(override)
	{
		self.remove_from_animloop = 1;
		self flag::set("stealth_override_goal");
		self namespace_f1f700ac::set_blind(0);
		self.last_set_goalent = undefined;
	}
	else
	{
		self flag::clear("stealth_override_goal");
	}
	if(override)
	{
		var_29020f90 = self spawner::function_461ce3e9();
		if(!isdefined(self.stealth.var_29020f90))
		{
			self.stealth.var_29020f90 = var_29020f90;
		}
	}
	else if(isdefined(self.stealth.var_29020f90))
	{
		self thread spawner::go_to_node(self.stealth.var_29020f90);
		self.stealth.var_29020f90 = undefined;
	}
}

/*
	Name: stealth_behavior_active
	Namespace: namespace_979752dc
	Checksum: 0xC4107316
	Offset: 0x2F70
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function stealth_behavior_active()
{
	return self flag::exists("stealth_override_goal") && self flag::get("stealth_override_goal");
}

/*
	Name: stealth_behavior_wait
	Namespace: namespace_979752dc
	Checksum: 0x94C8DA2F
	Offset: 0x2FC0
	Size: 0x3C
	Parameters: 0
	Flags: None
*/
function stealth_behavior_wait()
{
	if(self stealth_behavior_active())
	{
		self flag::wait_till_clear("stealth_override_goal");
	}
}

/*
	Name: disable_stealth_system
	Namespace: namespace_979752dc
	Checksum: 0xA0504C8A
	Offset: 0x3008
	Size: 0x224
	Parameters: 0
	Flags: Linked
*/
function disable_stealth_system()
{
	level flag::clear("stealth_enabled");
	ais = getactorteamarray("axis", "allies", "team3", "neutral");
	foreach(ai in ais)
	{
		ai enable_stealth_for_ai(0);
	}
	foreach(player in getplayers())
	{
		player.maxvisibledist = 8192;
		if(player flag::exists("stealth_enabled"))
		{
			player flag::clear("stealth_enabled");
		}
		if(isdefined(player.stealth))
		{
			var_3d8a1086 = player get_group_flagname("stealth_spotted");
			level flag::clear(var_3d8a1086);
		}
	}
	namespace_393f6012::event_change("spotted");
	level thread function_740dbf99();
}

/*
	Name: enable_stealth_system
	Namespace: namespace_979752dc
	Checksum: 0x5DA7F15F
	Offset: 0x3238
	Size: 0x180
	Parameters: 0
	Flags: None
*/
function enable_stealth_system()
{
	level flag::set("stealth_enabled");
	ais = getaiarray();
	foreach(ai in ais)
	{
		ai enable_stealth_for_ai(1);
	}
	foreach(player in getplayers())
	{
		if(player flag::exists("stealth_enabled"))
		{
			player flag::set("stealth_enabled");
		}
	}
}

/*
	Name: enable_stealth_for_ai
	Namespace: namespace_979752dc
	Checksum: 0x87110E24
	Offset: 0x33C0
	Size: 0x1FC
	Parameters: 2
	Flags: Linked
*/
function enable_stealth_for_ai(enabled, var_6f52290c)
{
	if(!isdefined(var_6f52290c))
	{
		var_6f52290c = 0;
	}
	if(!enabled)
	{
		self.maxvisibledist = 8192;
		if(self flag::exists("stealth_enabled") && self flag::get("stealth_enabled") && self.team == "axis")
		{
			player = getplayers()[0];
			var_819ce53c = spawnstruct();
			var_819ce53c.origin = player.origin;
			var_819ce53c.investigate_point = player.origin;
			var_819ce53c.investigate_pos = player.origin;
			var_819ce53c.type = "combat";
			var_819ce53c.typeorig = "attack";
			if(var_6f52290c)
			{
				var_819ce53c.entity = player;
			}
			self.dontevershoot = 0;
			self.dontattackme = 0;
			self namespace_f1f700ac::bt_event_combat(var_819ce53c);
			stealth_group::function_b6ebd4af(self);
			self namespace_6c0cd084::function_60514e0b();
		}
	}
	if(self flag::exists("stealth_enabled"))
	{
		if(enabled)
		{
			self flag::set("stealth_enabled");
		}
		else
		{
			self flag::clear("stealth_enabled");
		}
	}
}

/*
	Name: custom_state_functions
	Namespace: namespace_979752dc
	Checksum: 0x1D915DB7
	Offset: 0x35C8
	Size: 0xB4
	Parameters: 1
	Flags: None
*/
function custom_state_functions(array)
{
	/#
		assert(!isdefined(self.stealth), "");
	#/
	if(isdefined(array[#"spotted"]))
	{
		self.stealth_state_func[#"spotted"] = array[#"spotted"];
	}
	if(isdefined(array[#"hidden"]))
	{
		self.stealth_state_func[#"hidden"] = array[#"hidden"];
	}
}

/*
	Name: set_stealth_func
	Namespace: namespace_979752dc
	Checksum: 0xEC7DBAC7
	Offset: 0x3688
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_stealth_func(type, func)
{
	self.stealth.funcs[type] = func;
}

/*
	Name: set_event_override
	Namespace: namespace_979752dc
	Checksum: 0x3737A3A6
	Offset: 0x36B8
	Size: 0x64
	Parameters: 2
	Flags: None
*/
function set_event_override(eventtype, var_27c856cd)
{
	if(isdefined(eventtype) && isdefined(self.stealth) && isdefined(self.stealth.funcs))
	{
		self.stealth.funcs["event_" + eventtype] = var_27c856cd;
	}
}

/*
	Name: function_bc54026c
	Namespace: namespace_979752dc
	Checksum: 0x9291F293
	Offset: 0x3728
	Size: 0x58
	Parameters: 1
	Flags: None
*/
function function_bc54026c(eventtype)
{
	if(isdefined(eventtype) && isdefined(self.stealth) && isdefined(self.stealth.funcs))
	{
		self.stealth.funcs["event_" + eventtype] = undefined;
	}
}

/*
	Name: bcisincombat
	Namespace: namespace_979752dc
	Checksum: 0xCFDAD5F2
	Offset: 0x3788
	Size: 0x58
	Parameters: 0
	Flags: Linked
*/
function bcisincombat()
{
	self endon(#"death");
	if(!isdefined(self.fnisinstealthcombat) || self [[self.fnisinstealthcombat]]())
	{
		return true;
	}
	if(!isdefined(self.stealth))
	{
		return true;
	}
	return false;
}

/*
	Name: function_2baa2568
	Namespace: namespace_979752dc
	Checksum: 0xC0B97E86
	Offset: 0x37E8
	Size: 0x2E
	Parameters: 0
	Flags: Linked
*/
function function_2baa2568()
{
	if(level flag::get("stealth_spotted"))
	{
		return false;
	}
	return true;
}

/*
	Name: waittill_true_goal
	Namespace: namespace_979752dc
	Checksum: 0x5FB48FD3
	Offset: 0x3820
	Size: 0x88
	Parameters: 2
	Flags: None
*/
function waittill_true_goal(origin, radius)
{
	self endon(#"death");
	if(!isdefined(radius))
	{
		radius = self.goalradius;
	}
	while(true)
	{
		self waittill(#"goal");
		if(distance(self.origin, origin) < radius + 10)
		{
			break;
		}
	}
}

/*
	Name: function_133b86af
	Namespace: namespace_979752dc
	Checksum: 0x3768D2FB
	Offset: 0x38B0
	Size: 0x46
	Parameters: 0
	Flags: Linked
*/
function function_133b86af()
{
	result = getclosestpointonnavmesh(self.origin, 500, 16);
	if(!isdefined(result))
	{
		result = self.origin;
	}
	return result;
}

/*
	Name: assign_unique_id
	Namespace: namespace_979752dc
	Checksum: 0x1A012319
	Offset: 0x3900
	Size: 0x4A
	Parameters: 0
	Flags: Linked
*/
function assign_unique_id()
{
	if(!isdefined(level.ai_number))
	{
		level.ai_number = 0;
	}
	self.unique_id = "ai" + level.ai_number;
	level.ai_number++;
	return self.unique_id;
}

/*
	Name: set_movement_speed
	Namespace: namespace_979752dc
	Checksum: 0x6831603D
	Offset: 0x3958
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function set_movement_speed(desiredspeed)
{
	self function_2ce879d2(desiredspeed);
}

/*
	Name: clear_movement_speed
	Namespace: namespace_979752dc
	Checksum: 0x83005EE8
	Offset: 0x3988
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function clear_movement_speed()
{
	self function_9ae1c50();
}

/*
	Name: ignore_corpse
	Namespace: namespace_979752dc
	Checksum: 0x7982BB92
	Offset: 0x39B0
	Size: 0x52
	Parameters: 0
	Flags: Linked
*/
function ignore_corpse()
{
	waitresult = undefined;
	waitresult = self waittill(#"actor_corpse");
	if(isdefined(waitresult.corpse))
	{
		waitresult.corpse.found = 1;
	}
}

/*
	Name: function_bf1fb16f
	Namespace: namespace_979752dc
	Checksum: 0x66E6C980
	Offset: 0x3A10
	Size: 0x12
	Parameters: 0
	Flags: None
*/
function function_bf1fb16f()
{
	self.fovcosinez = 0;
}

/*
	Name: function_569a126
	Namespace: namespace_979752dc
	Checksum: 0x92B43008
	Offset: 0x3A30
	Size: 0x76
	Parameters: 2
	Flags: None
*/
function function_569a126(enabled, distance)
{
	if(!isdefined(distance))
	{
		distance = 2000;
	}
	/#
		assert(isdefined(level.stealth));
	#/
	if(enabled)
	{
		level.stealth.var_6fd6463b = distance * distance;
	}
	else
	{
		level.stealth.var_6fd6463b = undefined;
	}
}

/*
	Name: function_2324f175
	Namespace: namespace_979752dc
	Checksum: 0x2B42BF6E
	Offset: 0x3AB0
	Size: 0x32
	Parameters: 1
	Flags: Linked
*/
function function_2324f175(enabled)
{
	self.var_6eed8aea = enabled;
	self.var_210e35f8 = enabled;
	self.var_dbc362ae = enabled;
}

/*
	Name: function_3249d5ff
	Namespace: namespace_979752dc
	Checksum: 0x97E294CE
	Offset: 0x3AF0
	Size: 0x6C
	Parameters: 0
	Flags: Linked
*/
function function_3249d5ff()
{
	self.stealth.var_f4926fd9 = 1;
	self namespace_6c0cd084::threat_sight_set_state_parameters("investigate_grace_period");
	self.awarenesslevelcurrent = "high_alert";
	if(self flashlight::function_47df32b8())
	{
		self thread flashlight::function_8d59ee47(1);
	}
}

/*
	Name: function_64608a78
	Namespace: namespace_979752dc
	Checksum: 0xD7FDA31E
	Offset: 0x3B68
	Size: 0x7C
	Parameters: 0
	Flags: Linked
*/
function function_64608a78()
{
	self.stealth.var_f4926fd9 = 0;
	self.stealth.var_3bf603d9 = gettime();
	self namespace_6c0cd084::threat_sight_set_state_parameters("investigate");
	self.awarenesslevelcurrent = "low_alert";
	if(self flashlight::function_3aec1b7())
	{
		self thread flashlight::function_8d59ee47(0);
	}
}

/*
	Name: function_196ad164
	Namespace: namespace_979752dc
	Checksum: 0x1203310C
	Offset: 0x3BF0
	Size: 0x22
	Parameters: 0
	Flags: Linked
*/
function function_196ad164()
{
	return is_true(self.stealth.var_f4926fd9);
}

/*
	Name: function_b60a878a
	Namespace: namespace_979752dc
	Checksum: 0xA8AE4694
	Offset: 0x3C20
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_b60a878a()
{
	return level.var_6eed8aea !== 0 && self.var_6eed8aea !== 0;
}

/*
	Name: function_d58e1c1c
	Namespace: namespace_979752dc
	Checksum: 0x9207041A
	Offset: 0x3C50
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_d58e1c1c()
{
	return level.var_210e35f8 !== 0 && self.var_210e35f8 !== 0;
}

/*
	Name: function_a54113fb
	Namespace: namespace_979752dc
	Checksum: 0xAAFF73AA
	Offset: 0x3C80
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_a54113fb()
{
	return level.var_dbc362ae !== 0 && self.var_dbc362ae !== 0;
}

/*
	Name: function_57972217
	Namespace: namespace_979752dc
	Checksum: 0x35E3FE85
	Offset: 0x3CB0
	Size: 0x4A
	Parameters: 2
	Flags: None
*/
function function_57972217(var_45007919, var_ac53cd2c)
{
	self.var_e6b70cdb = cos(var_45007919);
	self.fovcosineperiph = cos(var_ac53cd2c);
}

/*
	Name: function_6a3b08d0
	Namespace: namespace_979752dc
	Checksum: 0x7F2AEB5C
	Offset: 0x3D08
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_6a3b08d0()
{
	var_39dc2c21 = 1 / 999;
	self function_678d90a1(var_39dc2c21);
}

