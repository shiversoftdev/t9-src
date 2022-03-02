#using script_2255a7ad3edc838f;
#using script_7b68dad851540de;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\colors_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;

#namespace spawner;

/*
	Name: function_89f2df9
	Namespace: spawner
	Checksum: 0x11DF0CA4
	Offset: 0x1D8
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"spawner", &function_70a657d8, undefined, &finalize, undefined);
}

/*
	Name: function_70a657d8
	Namespace: spawner
	Checksum: 0xB9F77BC
	Offset: 0x228
	Size: 0x294
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level._ai_group = [];
	level.missionfailed = 0;
	level.deathflags = [];
	level.go_to_node_arrays = [];
	level.global_spawn_timer = 0;
	level.global_spawn_count = 0;
	level.var_aa384fe2[#"origin"] = &get_target_ents;
	level.var_aa384fe2[#"ent"] = &get_target_ents;
	level.var_aa384fe2[#"node"] = &get_target_nodes;
	level.var_aa384fe2[#"struct"] = &get_target_structs;
	level.var_c4e6faf2[#"origin"] = &go_to_node_set_goal_pos;
	level.var_c4e6faf2[#"ent"] = &go_to_node_set_goal_ent;
	level.var_c4e6faf2[#"struct"] = &function_890856aa;
	level.var_c4e6faf2[#"node"] = &go_to_node_set_goal_node;
	spawners = getspawnerarray();
	for(i = 0; i < spawners.size; i++)
	{
		spawners[i] thread spawn_prethink();
	}
	level.ai = [];
	add_global_spawn_function(#"axis", &global_ai_array);
	add_global_spawn_function(#"allies", &global_ai_array);
	add_global_spawn_function(#"team3", &global_ai_array);
	/#
		level thread function_fe02300();
	#/
}

/*
	Name: finalize
	Namespace: spawner
	Checksum: 0x41C6E2C5
	Offset: 0x4C8
	Size: 0xF4
	Parameters: 0
	Flags: Linked, Private
*/
function private finalize()
{
	ai = getaispeciesarray("all");
	array::thread_all(ai, &living_ai_prethink);
	foreach(ai_guy in ai)
	{
		if(isalive(ai_guy))
		{
			ai_guy thread spawn_think();
		}
	}
	level thread spawn_throttle_reset();
}

/*
	Name: global_ai_array
	Namespace: spawner
	Checksum: 0x8D759AA0
	Offset: 0x5C8
	Size: 0x2B0
	Parameters: 0
	Flags: Linked
*/
function global_ai_array()
{
	if(!isdefined(level.ai[self.team]))
	{
		level.ai[self.team] = [];
	}
	else if(!isarray(level.ai[self.team]))
	{
		level.ai[self.team] = array(level.ai[self.team]);
	}
	level.ai[self.team][level.ai[self.team].size] = self;
	self waittill(#"death");
	if(isdefined(self))
	{
		if(isdefined(level.ai) && isdefined(level.ai[self.team]) && isinarray(level.ai[self.team], self))
		{
			arrayremovevalue(level.ai[self.team], self);
		}
		else
		{
			foreach(aiarray in level.ai)
			{
				if(isinarray(aiarray, self))
				{
					arrayremovevalue(aiarray, self);
					break;
				}
			}
		}
	}
	else
	{
		foreach(array in level.ai)
		{
			for(i = array.size - 1; i >= 0; i--)
			{
				if(!isdefined(array[i]))
				{
					arrayremoveindex(array, i);
				}
			}
		}
	}
}

/*
	Name: spawn_throttle_reset
	Namespace: spawner
	Checksum: 0x5F834759
	Offset: 0x880
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function spawn_throttle_reset()
{
	while(true)
	{
		util::wait_network_frame();
		level.global_spawn_count = 0;
	}
}

/*
	Name: global_spawn_throttle
	Namespace: spawner
	Checksum: 0x497E1521
	Offset: 0x8B8
	Size: 0x5C
	Parameters: 1
	Flags: Linked
*/
function global_spawn_throttle(n_count_per_network_frame)
{
	if(!isdefined(n_count_per_network_frame))
	{
		n_count_per_network_frame = 4;
	}
	if(!is_true(level.first_frame))
	{
		while(level.global_spawn_count >= n_count_per_network_frame)
		{
			waitframe(1);
		}
		level.global_spawn_count++;
	}
}

/*
	Name: spawn_prethink
	Namespace: spawner
	Checksum: 0xEA4F7DD1
	Offset: 0x920
	Size: 0xDC
	Parameters: 0
	Flags: Linked
*/
function spawn_prethink()
{
	/#
		assert(self != level);
	#/
	if(isdefined(self.script_aigroup))
	{
		aigroup_init(self.script_aigroup, self);
	}
	if(isdefined(self.script_delete))
	{
		array_size = 0;
		if(isdefined(level._ai_delete))
		{
			if(isdefined(level._ai_delete[self.script_delete]))
			{
				array_size = level._ai_delete[self.script_delete].size;
			}
		}
		level._ai_delete[self.script_delete][array_size] = self;
	}
	if(isdefined(self.target))
	{
		crawl_through_targets_to_init_flags();
	}
}

/*
	Name: spawn_think
	Namespace: spawner
	Checksum: 0x2C25713F
	Offset: 0xA08
	Size: 0x2C4
	Parameters: 1
	Flags: Linked
*/
function spawn_think(spawner)
{
	self endon(#"death");
	if(isdefined(self.spawn_think_thread_active))
	{
		return;
	}
	self.spawn_think_thread_active = 1;
	/#
		assert(isactor(self) || isvehicle(self), "" + "");
	#/
	if(!isvehicle(self))
	{
		if(!isalive(self))
		{
			return;
		}
		self.maxhealth = self.health;
	}
	self.script_animname = undefined;
	if(isdefined(self.script_aigroup))
	{
		level flag::set(self.script_aigroup + "_spawning");
		self thread aigroup_think(level._ai_group[self.script_aigroup]);
	}
	if(isdefined(spawner) && isdefined(spawner.script_dropammo))
	{
		self.disableammodrop = !spawner.script_dropammo;
	}
	else if(isdefined(self.script_dropammo))
	{
		self.disableammodrop = !self.script_dropammo;
	}
	if(isdefined(spawner.var_86f65a6))
	{
		self.fixednode = spawner.var_86f65a6;
	}
	else if(isdefined(self.var_86f65a6))
	{
		self.fixednode = self.var_86f65a6;
	}
	if(isdefined(spawner) && isdefined(spawner.var_9d17efa5))
	{
		self.script_accuracy = spawner.var_9d17efa5;
	}
	else if(isdefined(self.var_9d17efa5))
	{
		self.script_accuracy = self.var_9d17efa5;
	}
	if(isdefined(spawner) && isdefined(spawner.spawn_funcs))
	{
		self.spawn_funcs = spawner.spawn_funcs;
	}
	if(isai(self))
	{
		spawn_think_action(spawner);
		/#
			assert(isalive(self));
		#/
		/#
			assert(isdefined(self.team));
		#/
	}
	self thread run_spawn_functions();
}

/*
	Name: run_spawn_functions
	Namespace: spawner
	Checksum: 0xF348F32B
	Offset: 0xCD8
	Size: 0x3C6
	Parameters: 0
	Flags: Linked
*/
function run_spawn_functions()
{
	self endon(#"death");
	if(!isdefined(level.spawn_funcs))
	{
		return;
	}
	if(isdefined(level.spawn_funcs[#"all"]))
	{
		for(i = 0; i < level.spawn_funcs[#"all"].size; i++)
		{
			func = level.spawn_funcs[#"all"][i];
			util::single_thread_argarray(self, func[#"function"], func[#"params"]);
		}
	}
	if(isdefined(self.archetype) && isdefined(level.spawn_funcs[self.archetype]))
	{
		for(i = 0; i < level.spawn_funcs[self.archetype].size; i++)
		{
			func = level.spawn_funcs[self.archetype][i];
			util::single_thread_argarray(self, func[#"function"], func[#"params"]);
		}
	}
	waittillframeend();
	callback::callback(#"on_ai_spawned");
	if(isdefined(level.spawn_funcs[self.team]))
	{
		for(i = 0; i < level.spawn_funcs[self.team].size; i++)
		{
			func = level.spawn_funcs[self.team][i];
			util::single_thread_argarray(self, func[#"function"], func[#"params"]);
		}
	}
	if(isdefined(self.spawn_funcs))
	{
		for(i = 0; i < self.spawn_funcs.size; i++)
		{
			func = self.spawn_funcs[i];
			util::single_thread_argarray(self, func[#"function"], func[#"params"]);
		}
		/#
			var_f9bfb16c = self.spawn_funcs;
		#/
		self.spawn_funcs = undefined;
		/#
			self.spawn_funcs = var_f9bfb16c;
		#/
	}
	if(isdefined(self.archetype) && isdefined(level.spawn_funcs[self.archetype + "_post"]))
	{
		for(i = 0; i < level.spawn_funcs[self.archetype + "_post"].size; i++)
		{
			func = level.spawn_funcs[self.archetype + "_post"][i];
			util::single_thread_argarray(self, func[#"function"], func[#"params"]);
		}
	}
	self.finished_spawning = 1;
	self notify(#"hash_a8d38936f5f8fa4");
}

/*
	Name: living_ai_prethink
	Namespace: spawner
	Checksum: 0x6090BC46
	Offset: 0x10A8
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function living_ai_prethink()
{
	if(isdefined(self.target))
	{
		crawl_through_targets_to_init_flags();
	}
}

/*
	Name: crawl_through_targets_to_init_flags
	Namespace: spawner
	Checksum: 0x137DE7B4
	Offset: 0x10D8
	Size: 0x9C
	Parameters: 0
	Flags: Linked
*/
function crawl_through_targets_to_init_flags()
{
	array = get_node_funcs_based_on_target();
	if(isdefined(array))
	{
		targets = array[#"node"];
		get_func = array[#"get_target_func"];
		for(i = 0; i < targets.size; i++)
		{
			crawl_target_and_init_flags(targets[i], get_func);
		}
	}
}

/*
	Name: remove_spawner_values
	Namespace: spawner
	Checksum: 0x52EBE193
	Offset: 0x1180
	Size: 0x16
	Parameters: 0
	Flags: Linked
*/
function remove_spawner_values()
{
	self.spawner_number = undefined;
	self.script_scene_entities = undefined;
}

/*
	Name: spawn_think_action
	Namespace: spawner
	Checksum: 0x6D2886BF
	Offset: 0x11A0
	Size: 0x3C4
	Parameters: 1
	Flags: Linked
*/
function spawn_think_action(spawner)
{
	remove_spawner_values();
	if(isdefined(spawner))
	{
		if(!isdefined(self.targetname))
		{
			self.targetname = spawner.targetname;
		}
	}
	if(isdefined(spawner) && isdefined(spawner.script_animname))
	{
		self.animname = spawner.script_animname;
	}
	else if(isdefined(self.script_animname))
	{
		self.animname = self.script_animname;
	}
	if(isdefined(self.script_forcecolor))
	{
		colors::set_force_color(self.script_forcecolor);
	}
	if(isdefined(self.script_ignoreme))
	{
		/#
			assert(self.script_ignoreme == 1, "");
		#/
		self val::function_3e65ae71("ignoreme", 1);
	}
	if(isdefined(self.script_ignoreall))
	{
		/#
			assert(self.script_ignoreall == 1, "");
		#/
		self val::function_3e65ae71("ignoreall", 1);
	}
	if(isdefined(self.script_grenades))
	{
		self.grenadeammo = self.script_grenades;
	}
	if(isdefined(self.script_pacifist))
	{
		self.pacifist = 1;
	}
	if(isdefined(self.script_allowdeath))
	{
		self.allowdeath = self.script_allowdeath;
	}
	if(isdefined(self.script_forcegib))
	{
		self.force_gib = 1;
	}
	if(isdefined(self.var_1d78e529))
	{
		self.delete_on_path_end = 1;
	}
	if(isdefined(spawner.script_demeanor))
	{
		self.script_demeanor = spawner.script_demeanor;
	}
	if(isdefined(spawner.var_b1d64777))
	{
		self function_c0aa3e93(1);
	}
	if(isdefined(self.target) && !isdefined(self.script_disable_spawn_targeting))
	{
		var_8e8b0300 = 0;
		a_s_targets = struct::get_array(self.target);
		foreach(s_target in a_s_targets)
		{
			if(s_target.classname === "scriptbundle_scene")
			{
				self thread function_27fb21d8(s_target);
				var_8e8b0300 = 1;
				break;
			}
		}
		if(!var_8e8b0300)
		{
			e_goal = getent(self.target, "targetname");
			if(isdefined(e_goal) && e_goal.classname !== "info_volume")
			{
				self setgoal(e_goal);
			}
			else
			{
				self thread go_to_node();
			}
		}
	}
	else
	{
		self thread function_5c5e2093();
	}
}

/*
	Name: function_27fb21d8
	Namespace: spawner
	Checksum: 0xF568C3F8
	Offset: 0x1570
	Size: 0xF4
	Parameters: 1
	Flags: Linked
*/
function function_27fb21d8(s_scene)
{
	self endon(#"death");
	waittillframeend();
	s_scene scene::play(self);
	if(self flag::get("in_action"))
	{
		return;
	}
	e_goal = getent(self.target, "targetname");
	if(isdefined(e_goal))
	{
		self setgoal(e_goal);
	}
	else
	{
		if(isdefined(s_scene.target))
		{
			self ai::set_goal(s_scene.target);
		}
		else
		{
			self thread go_to_node();
		}
	}
}

/*
	Name: get_target_ents
	Namespace: spawner
	Checksum: 0xAFFC6E3E
	Offset: 0x1670
	Size: 0x2A
	Parameters: 1
	Flags: Linked
*/
function get_target_ents(target)
{
	return getentarray(target, "targetname");
}

/*
	Name: get_target_nodes
	Namespace: spawner
	Checksum: 0xCFC5944C
	Offset: 0x16A8
	Size: 0x2A
	Parameters: 1
	Flags: Linked
*/
function get_target_nodes(target)
{
	return getnodearray(target, "targetname");
}

/*
	Name: get_target_structs
	Namespace: spawner
	Checksum: 0x284EB41F
	Offset: 0x16E0
	Size: 0x2A
	Parameters: 1
	Flags: Linked
*/
function get_target_structs(target)
{
	return struct::get_array(target, "targetname");
}

/*
	Name: node_has_radius
	Namespace: spawner
	Checksum: 0xEDFAA59B
	Offset: 0x1718
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function node_has_radius(node)
{
	return isdefined(node.radius) && node.radius != 0;
}

/*
	Name: go_to_origin
	Namespace: spawner
	Checksum: 0xB4A72734
	Offset: 0x1750
	Size: 0x34
	Parameters: 2
	Flags: None
*/
function go_to_origin(origin, optional_arrived_at_node_func)
{
	self go_to_node(origin, "origin", optional_arrived_at_node_func);
}

/*
	Name: go_to_struct
	Namespace: spawner
	Checksum: 0xCD6BBAE5
	Offset: 0x1790
	Size: 0x34
	Parameters: 2
	Flags: None
*/
function go_to_struct(struct, optional_arrived_at_node_func)
{
	self go_to_node(struct, "struct", optional_arrived_at_node_func);
}

/*
	Name: go_to_node
	Namespace: spawner
	Checksum: 0x7BA8EA8C
	Offset: 0x17D0
	Size: 0xAC
	Parameters: 3
	Flags: Linked
*/
function go_to_node(node, goal_type, optional_arrived_at_node_func)
{
	self endon(#"death");
	array = get_node_funcs_based_on_target(node, goal_type);
	if(!isdefined(array))
	{
		self notify(#"reached_path_end");
		return;
	}
	if(!isdefined(optional_arrived_at_node_func))
	{
		optional_arrived_at_node_func = &util::void;
	}
	go_to_node_using_funcs(array[#"node"], optional_arrived_at_node_func);
}

/*
	Name: function_461ce3e9
	Namespace: spawner
	Checksum: 0x5C78EFB1
	Offset: 0x1888
	Size: 0x2A
	Parameters: 0
	Flags: None
*/
function function_461ce3e9()
{
	var_e0e751a9 = self.go_to_node;
	self notify(#"stop_going_to_node");
	return var_e0e751a9;
}

/*
	Name: get_least_used_from_array
	Namespace: spawner
	Checksum: 0x2182F328
	Offset: 0x18C0
	Size: 0x124
	Parameters: 1
	Flags: Linked, Private
*/
function private get_least_used_from_array(array)
{
	/#
		assert(array.size > 0, "");
	#/
	if(array.size == 1)
	{
		return array[0];
	}
	targetname = array[0].targetname;
	if(!isdefined(level.go_to_node_arrays[targetname]))
	{
		level.go_to_node_arrays[targetname] = array;
	}
	array = level.go_to_node_arrays[targetname];
	first = array[0];
	newarray = [];
	for(i = 0; i < array.size - 1; i++)
	{
		newarray[i] = array[i + 1];
	}
	newarray[array.size - 1] = array[0];
	level.go_to_node_arrays[targetname] = newarray;
	return first;
}

/*
	Name: function_b6317f7e
	Namespace: spawner
	Checksum: 0x3CFE2D57
	Offset: 0x19F0
	Size: 0x16E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_b6317f7e(node)
{
	if(!isdefined(node.target))
	{
		return true;
	}
	if(node util::function_de0e7bbd())
	{
		return true;
	}
	if(isdefined(node.script_flag_wait) || node util::function_e387bcd())
	{
		return true;
	}
	targetnode = getnode(node.target, "targetname");
	if(isdefined(targetnode) && node_has_radius(targetnode))
	{
		if(distancesquared(node.origin, targetnode.origin) < sqr(targetnode.radius))
		{
			return true;
		}
	}
	targetent = getent(node.target, "targetname");
	if(isdefined(targetent) && targetent.classname === "info_volume")
	{
		if(istouching(node.origin, targetent))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: go_to_node_using_funcs
	Namespace: spawner
	Checksum: 0xA1C156F9
	Offset: 0x1B68
	Size: 0x9CC
	Parameters: 3
	Flags: Linked, Private
*/
function private go_to_node_using_funcs(node, optional_arrived_at_node_func, require_player_dist)
{
	self endoncallback(&function_e63d4581, #"stop_going_to_node", #"death");
	startnode = undefined;
	for(;;)
	{
		node = get_least_used_from_array(node);
		if(!isdefined(startnode))
		{
			startnode = node;
			if(!is_true(startnode.var_de28b066))
			{
				if(ai::has_behavior_attribute("disablearrivals"))
				{
					ai::set_behavior_attribute("disablearrivals", 1);
				}
			}
		}
		if(function_b6317f7e(node))
		{
			if(ai::has_behavior_attribute("disablearrivals"))
			{
				ai::set_behavior_attribute("disablearrivals", 0);
			}
		}
		if(isdefined(node.scriptbundlename))
		{
			s_bundle = scene::get_scenedef(node.scriptbundlename);
			if(isdefined(s_bundle) && isdefined(s_bundle.objects))
			{
				self.var_b8b2cd98 = 0;
				foreach(object in s_bundle.objects)
				{
					if(object.type === "actor" && is_true(object.disablearrivalinreach))
					{
						self.var_b8b2cd98 = 1;
					}
				}
				if(self.var_b8b2cd98 && ai::has_behavior_attribute("disablearrivals"))
				{
					ai::set_behavior_attribute("disablearrivals", 1);
				}
			}
		}
		array = get_node_funcs_based_on_target(node);
		get_target_func = array[#"get_target_func"];
		set_goal_func_quits = array[#"set_goal_func_quits"];
		self.goalradius = 16;
		if(isdefined(node) && isdefined(node.target))
		{
			self.patroller = 1;
		}
		self.go_to_node = node;
		player_wait_dist = require_player_dist;
		if(isdefined(node.script_requires_player))
		{
			if(node.script_requires_player > 1)
			{
				player_wait_dist = node.script_requires_player;
			}
			else
			{
				player_wait_dist = 256;
			}
			node.script_requires_player = 0;
		}
		self function_5c5e2093(node);
		if(isdefined(node.height))
		{
			self.goalheight = node.height;
		}
		goalpoint = node function_d0bfad14(self);
		if(is_true(self.script_forcegoal) || (isdefined(node) && is_true(node.script_forcegoal)))
		{
			self thread ai::force_goal(goalpoint);
		}
		else
		{
			[[set_goal_func_quits]](goalpoint);
		}
		self waittill(#"goal");
		[[optional_arrived_at_node_func]](node);
		if(isdefined(node.script_notify))
		{
			self notify(node.script_notify);
			level notify(node.script_notify);
		}
		if(isdefined(node.script_flag_set))
		{
			if(!level flag::exists(node.script_flag_set))
			{
				level flag::init(node.script_flag_set);
			}
			level flag::set(node.script_flag_set);
		}
		if(isdefined(node.script_flag_clear))
		{
			if(!level flag::exists(node.script_flag_clear))
			{
				level flag::init(node.script_flag_clear);
			}
			level flag::clear(node.script_flag_clear);
		}
		if(isdefined(node.script_ent_flag_set))
		{
			if(!self flag::exists(node.script_ent_flag_set))
			{
				self flag::init(node.script_ent_flag_set);
			}
			self flag::set(node.script_ent_flag_set);
		}
		if(isdefined(node.script_ent_flag_clear))
		{
			if(!self flag::exists(node.script_ent_flag_clear))
			{
				self flag::init(node.script_ent_flag_clear);
			}
			self flag::clear(node.script_ent_flag_clear);
		}
		if(smart_object::function_1631909f(node) || isdefined(node.scriptbundlename))
		{
			if(smart_object::function_1631909f(node))
			{
				if(smart_object::can_use(node))
				{
					node smart_object::play(self);
				}
			}
			else if(isdefined(node.scriptbundlename))
			{
				if(4 < self.goalradius)
				{
					self.goalradius = 4;
					self waittill(#"goal");
				}
				if(node util::function_e387bcd())
				{
					node thread scene::play(node.scriptbundlename, self);
				}
				else
				{
					node scene::play(node.scriptbundlename, self);
				}
			}
		}
		node util::script_wait();
		if(isdefined(node.script_flag_wait))
		{
			level flag::wait_till(node.script_flag_wait);
		}
		if(isdefined(node.var_8e71979c))
		{
			var_91cfb325 = strtok(node.var_8e71979c, " ");
			level flag::wait_till_all(var_91cfb325);
		}
		if(isdefined(node.var_a421c52c))
		{
			var_b177ca91 = strtok(node.var_a421c52c, " ");
			level flag::wait_till_any(var_b177ca91);
		}
		while(isdefined(node.script_requires_player))
		{
			node.script_requires_player = 0;
			if(self go_to_node_wait_for_player(node, get_target_func, player_wait_dist))
			{
				node.script_requires_player = 1;
				node notify(#"script_requires_player");
				break;
			}
			wait(0.1);
		}
		if(isdefined(node.script_aigroup))
		{
			waittill_ai_group_cleared(node.script_aigroup);
		}
		node util::script_delay();
		if(isdefined(node.var_9ec34b3))
		{
			node scene::play(node.var_9ec34b3, self);
		}
		if(!isdefined(node.target))
		{
			break;
		}
		nextnode_array = function_eb7a5643(node);
		if(!nextnode_array.size)
		{
			break;
		}
		node = nextnode_array;
	}
	if(isdefined(self.arrived_at_end_node_func))
	{
		[[self.arrived_at_end_node_func]](node);
	}
	self notify(#"reached_path_end");
	if(isdefined(self.delete_on_path_end))
	{
		self deletedelay();
	}
	self function_e63d4581();
}

/*
	Name: function_eb7a5643
	Namespace: spawner
	Checksum: 0x5A3537D1
	Offset: 0x2540
	Size: 0x152
	Parameters: 2
	Flags: Linked, Private
*/
function private function_eb7a5643(node, startnode)
{
	if(!isdefined(startnode))
	{
		startnode = node;
	}
	nextnode_array = update_target_array(node.target);
	if(!isdefined(nextnode_array))
	{
		nextnode_array = [];
	}
	else if(!isarray(nextnode_array))
	{
		nextnode_array = array(nextnode_array);
	}
	for(i = nextnode_array.size - 1; i >= 0; i--)
	{
		if(smart_object::function_1631909f(nextnode_array[i]) && !smart_object::can_use(nextnode_array[i]))
		{
			if(nextnode_array.size == 1)
			{
				if(nextnode_array[0] == startnode)
				{
					return nextnode_array;
				}
				return function_eb7a5643(nextnode_array[0], startnode);
			}
			nextnode_array = arrayremoveindex(nextnode_array, i);
		}
	}
	return nextnode_array;
}

/*
	Name: function_d0bfad14
	Namespace: spawner
	Checksum: 0xED5E1FF7
	Offset: 0x26A0
	Size: 0x86
	Parameters: 1
	Flags: Linked, Private
*/
function private function_d0bfad14(ent)
{
	if(smart_object::function_1631909f(self))
	{
		ent thread smart_object::function_2677ed08(self);
		return self smart_object::get_goal();
	}
	if(isdefined(self.scriptbundlename))
	{
		return self scene::function_15be7db9(self.scriptbundlename);
	}
	return self;
}

/*
	Name: function_e63d4581
	Namespace: spawner
	Checksum: 0x67A38CA4
	Offset: 0x2730
	Size: 0x54
	Parameters: 1
	Flags: Linked, Private
*/
function private function_e63d4581(params)
{
	self.patroller = undefined;
	self.go_to_node = undefined;
	if(ai::has_behavior_attribute("disablearrivals"))
	{
		ai::set_behavior_attribute("disablearrivals", 0);
	}
}

/*
	Name: go_to_node_wait_for_player
	Namespace: spawner
	Checksum: 0x95F43FB2
	Offset: 0x2790
	Size: 0x2B2
	Parameters: 3
	Flags: Linked, Private
*/
function private go_to_node_wait_for_player(node, get_target_func, dist)
{
	players = getplayers();
	for(i = 0; i < players.size; i++)
	{
		player = players[i];
		if(distancesquared(player.origin, node.origin) < distancesquared(self.origin, node.origin))
		{
			return true;
		}
	}
	vec = anglestoforward(self.angles);
	if(isdefined(node.target))
	{
		temp = [[get_target_func]](node.target);
		if(temp.size == 1)
		{
			vec = vectornormalize(temp[0].origin - node.origin);
		}
		else if(isdefined(node.angles))
		{
			vec = anglestoforward(node.angles);
		}
	}
	else if(isdefined(node.angles))
	{
		vec = anglestoforward(node.angles);
	}
	vec2 = [];
	for(i = 0; i < players.size; i++)
	{
		player = players[i];
		vec2[vec2.size] = vectornormalize(player.origin - self.origin);
	}
	for(i = 0; i < vec2.size; i++)
	{
		value = vec2[i];
		if(vectordot(vec, value) > 0)
		{
			return true;
		}
	}
	dist2rd = dist * dist;
	for(i = 0; i < players.size; i++)
	{
		player = players[i];
		if(distancesquared(player.origin, self.origin) < dist2rd)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: go_to_node_set_goal_ent
	Namespace: spawner
	Checksum: 0xA5648901
	Offset: 0x2A50
	Size: 0x24
	Parameters: 1
	Flags: Linked, Private
*/
function private go_to_node_set_goal_ent(ent)
{
	self ai::set_goal_ent(ent);
}

/*
	Name: go_to_node_set_goal_pos
	Namespace: spawner
	Checksum: 0x808CB49E
	Offset: 0x2A80
	Size: 0x44
	Parameters: 1
	Flags: Linked, Private
*/
function private go_to_node_set_goal_pos(ent)
{
	self setgoal(ent.origin);
	self ai::function_54115a91(ent);
}

/*
	Name: function_890856aa
	Namespace: spawner
	Checksum: 0x5A1D9D54
	Offset: 0x2AD0
	Size: 0xD4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_890856aa(struct)
{
	goalradius = undefined;
	if(isactor(self) && isdefined(struct.goalradius))
	{
		goalradius = struct.goalradius;
	}
	if(is_true(struct.var_1e38e46d))
	{
		self setgoal(struct.origin, undefined, goalradius);
	}
	else
	{
		self setgoal(struct.origin, undefined, goalradius, undefined, struct.angles);
	}
	self ai::function_54115a91(struct);
}

/*
	Name: go_to_node_set_goal_node
	Namespace: spawner
	Checksum: 0x58784333
	Offset: 0x2BB0
	Size: 0x24
	Parameters: 1
	Flags: Linked, Private
*/
function private go_to_node_set_goal_node(node)
{
	self ai::set_goal_node(node);
}

/*
	Name: remove_crawled
	Namespace: spawner
	Checksum: 0xFAA7F5D
	Offset: 0x2BE0
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function remove_crawled(ent)
{
	waittillframeend();
	if(isdefined(ent))
	{
		ent.crawled = undefined;
	}
}

/*
	Name: crawl_target_and_init_flags
	Namespace: spawner
	Checksum: 0xF9FEB2FF
	Offset: 0x2C10
	Size: 0x15E
	Parameters: 2
	Flags: Linked
*/
function crawl_target_and_init_flags(ent, get_func)
{
	targets = [];
	index = 0;
	for(;;)
	{
		if(!isdefined(ent.crawled))
		{
			ent.crawled = 1;
			level thread remove_crawled(ent);
			if(isdefined(ent.script_flag_set))
			{
				if(!isdefined(level.flag[ent.script_flag_set]))
				{
					level flag::init(ent.script_flag_set);
				}
			}
			if(isdefined(ent.script_flag_wait))
			{
				if(!isdefined(level.flag[ent.script_flag_wait]))
				{
					level flag::init(ent.script_flag_wait);
				}
			}
			if(isdefined(ent.target))
			{
				new_targets = [[get_func]](ent.target);
				array::add(targets, new_targets);
			}
		}
		index++;
		if(index >= targets.size)
		{
			break;
		}
		ent = targets[index];
	}
}

/*
	Name: get_node_funcs_based_on_target
	Namespace: spawner
	Checksum: 0xE09B2199
	Offset: 0x2D78
	Size: 0x264
	Parameters: 2
	Flags: Linked
*/
function get_node_funcs_based_on_target(node, goal_type)
{
	if(!isdefined(goal_type) && isdefined(node))
	{
		goal_type = "origin";
		if(ispathnode(node))
		{
			goal_type = "node";
		}
		else
		{
			if(isstruct(node))
			{
				goal_type = "struct";
			}
			else if(isentity(node))
			{
				goal_type = "ent";
			}
		}
	}
	array = [];
	if(isdefined(node))
	{
		array[#"node"][0] = node;
	}
	else
	{
		if(!isdefined(self.target))
		{
			/#
				assertmsg("");
			#/
			return;
		}
		node = getentarray(self.target, "targetname");
		if(node.size > 0)
		{
			if(issubstr(node[0].classname, "volume"))
			{
				goal_type = "ent";
			}
			else
			{
				goal_type = "origin";
			}
		}
		if(!isdefined(goal_type) || goal_type == "node")
		{
			goal_type = "node";
			node = getnodearray(self.target, "targetname");
			if(!node.size)
			{
				node = struct::get_array(self.target, "targetname");
				if(!node.size)
				{
					return;
				}
				goal_type = "struct";
			}
		}
		array[#"node"] = node;
	}
	array[#"get_target_func"] = level.var_aa384fe2[goal_type];
	array[#"set_goal_func_quits"] = level.var_c4e6faf2[goal_type];
	return array;
}

/*
	Name: update_target_array
	Namespace: spawner
	Checksum: 0x3EA47B17
	Offset: 0x2FE8
	Size: 0xB6
	Parameters: 1
	Flags: Linked
*/
function update_target_array(str_target)
{
	a_nd_target = getnodearray(str_target, "targetname");
	if(a_nd_target.size)
	{
		return a_nd_target;
	}
	a_s_target = struct::get_array(str_target, "targetname");
	if(a_s_target.size)
	{
		return a_s_target;
	}
	a_e_target = getentarray(str_target, "targetname");
	if(a_e_target.size)
	{
		return a_e_target;
	}
}

/*
	Name: function_5c5e2093
	Namespace: spawner
	Checksum: 0xC8F7B9F7
	Offset: 0x30A8
	Size: 0x72
	Parameters: 1
	Flags: Linked
*/
function function_5c5e2093(node)
{
	self endon(#"death");
	waittillframeend();
	if(isdefined(self.script_radius))
	{
		self.goalradius = self.script_radius;
	}
	else if(isdefined(node) && node_has_radius(node))
	{
		self.goalradius = node.radius;
	}
}

/*
	Name: get_goal
	Namespace: spawner
	Checksum: 0xEBABE844
	Offset: 0x3128
	Size: 0xBA
	Parameters: 2
	Flags: None
*/
function get_goal(str_goal, str_key)
{
	if(!isdefined(str_key))
	{
		str_key = "targetname";
	}
	a_goals = arraycombine(getnodearray(str_goal, str_key), getentarray(str_goal, str_key));
	a_goals = arraycombine(a_goals, struct::get_array(str_goal, str_key));
	return array::random(a_goals);
}

/*
	Name: function_fe02300
	Namespace: spawner
	Checksum: 0x1B6AEFEB
	Offset: 0x31F0
	Size: 0x99A
	Parameters: 0
	Flags: None
*/
function function_fe02300()
{
	/#
		var_e7463378 = [];
		a_spawners = getspawnerarray();
		foreach(spawner in a_spawners)
		{
			if(isdefined(spawner.script_aigroup) && !isinarray(var_e7463378, spawner.script_aigroup))
			{
				array::add(var_e7463378, spawner.script_aigroup, 0);
			}
		}
		foreach(aigroup in var_e7463378)
		{
			cmd = ((("" + aigroup) + "") + aigroup) + "";
			adddebugcommand(cmd);
		}
		cmd = ((("" + "") + "") + "") + "";
		adddebugcommand(cmd);
		while(true)
		{
			var_d4f26db9 = getdvarstring(#"hash_c7bb03f6ed72246", "");
			var_c708e6e1 = 120;
			if(var_d4f26db9 != "")
			{
				debug2dtext((150, var_c708e6e1, 0), "", (0, 1, 1), 1, (0, 0, 0), 0.9, 1, 1);
				var_c708e6e1 = var_c708e6e1 + 22;
				if(isdefined(level._ai_group) && isdefined(level._ai_group[var_d4f26db9]) && isdefined(level._ai_group[var_d4f26db9].ai))
				{
					ais = get_ai_group_ai(var_d4f26db9);
					spawners = get_ai_group_spawner_count(var_d4f26db9);
					debug2dtext((150, var_c708e6e1, 0), "" + var_d4f26db9, (1, 1, 1), 1, (0, 0, 0), 0.9, 1, 1);
					var_c708e6e1 = var_c708e6e1 + 22;
					debug2dtext((150, var_c708e6e1, 0), "", (0, 1, 1), 1, (0, 0, 0), 0.9, 1, 1);
					var_c708e6e1 = var_c708e6e1 + 22;
					debug2dtext((150, var_c708e6e1, 0), "" + ais.size, (1, 1, 0), 1, (0, 0, 0), 0.9, 1, 1);
					var_c708e6e1 = var_c708e6e1 + 22;
					debug2dtext((150, var_c708e6e1, 0), "" + spawners, (1, 0, 0), 1, (0, 0, 0), 0.9, 1, 1);
					var_c708e6e1 = var_c708e6e1 + 22;
					if(isdefined(level.flag[var_d4f26db9 + ""]))
					{
						flag = level flag::get(var_d4f26db9 + "");
						if(flag)
						{
							debug2dtext((150, var_c708e6e1, 0), "", (1, 0.5, 0), 1, (0, 0, 0), 0.9, 1, 1);
						}
						else
						{
							debug2dtext((150, var_c708e6e1, 0), "", (0, 1, 0), 1, (0, 0, 0), 0.9, 1, 1);
						}
						var_c708e6e1 = var_c708e6e1 + 22;
					}
					if(isdefined(level.flag[var_d4f26db9 + ""]))
					{
						flag = level flag::get(var_d4f26db9 + "");
						if(flag)
						{
							debug2dtext((150, var_c708e6e1, 0), "", (1, 0.5, 0), 1, (0, 0, 0), 0.9, 1, 1);
						}
						else
						{
							debug2dtext((150, var_c708e6e1, 0), "", (0, 1, 0), 1, (0, 0, 0), 0.9, 1, 1);
						}
						var_c708e6e1 = var_c708e6e1 + 22;
					}
					debug2dtext((150, var_c708e6e1, 0), "", (0, 1, 1), 1, (0, 0, 0), 0.9, 1, 1);
					var_c708e6e1 = var_c708e6e1 + 22;
					foreach(ai in ais)
					{
						sphere(ai.origin + vectorscale((0, 0, 1), 72), 4, (1, 1, 0), 1, 0, 8, 1);
						line(ai.origin + vectorscale((0, 0, 1), 72), ai.origin + vectorscale((0, 0, 1), 92), (1, 1, 0), 1, 1);
					}
					foreach(spawner in level._ai_group[var_d4f26db9].spawners)
					{
						if(isdefined(spawner) && spawner.count > 0)
						{
							sphere(spawner.origin + vectorscale((0, 0, 1), 10), 4, (1, 0, 0), 1, 0, 8, 1);
							line(spawner.origin + vectorscale((0, 0, 1), 10), spawner.origin + vectorscale((0, 0, 1), 50), (1, 0, 0), 1, 1);
							print3d(spawner.origin + vectorscale((0, 0, 1), 20), function_9e72a96(spawner.archetype), (1, 0, 0), 1, 0.4, 1);
							print3d(spawner.origin + vectorscale((0, 0, 1), 30), "" + spawner.count, (1, 0, 0), 1, 0.4, 1);
						}
					}
				}
			}
			waitframe(1);
		}
	#/
}

/*
	Name: aigroup_init
	Namespace: spawner
	Checksum: 0x931980C7
	Offset: 0x3B98
	Size: 0x29C
	Parameters: 2
	Flags: Linked
*/
function aigroup_init(aigroup, spawner)
{
	if(!isdefined(level._ai_group[aigroup]))
	{
		level._ai_group[aigroup] = spawnstruct();
		level._ai_group[aigroup].aigroup = aigroup;
		level._ai_group[aigroup].aicount = 0;
		level._ai_group[aigroup].killed_count = 0;
		level._ai_group[aigroup].ai = [];
		level._ai_group[aigroup].spawners = [];
		level._ai_group[aigroup].cleared_count = 0;
		if(!isdefined(level.flag[aigroup + "_cleared"]))
		{
			level flag::init(aigroup + "_cleared");
		}
		if(!isdefined(level.flag[aigroup + "_spawning"]))
		{
			level flag::init(aigroup + "_spawning");
		}
		level thread set_ai_group_cleared_flag(level._ai_group[aigroup]);
	}
	if(isdefined(spawner))
	{
		if(!isdefined(level._ai_group[aigroup].spawners))
		{
			level._ai_group[aigroup].spawners = [];
		}
		else if(!isarray(level._ai_group[aigroup].spawners))
		{
			level._ai_group[aigroup].spawners = array(level._ai_group[aigroup].spawners);
		}
		level._ai_group[aigroup].spawners[level._ai_group[aigroup].spawners.size] = spawner;
		spawner thread aigroup_spawner_death(level._ai_group[aigroup]);
	}
}

/*
	Name: aigroup_spawner_death
	Namespace: spawner
	Checksum: 0xD774A487
	Offset: 0x3E40
	Size: 0x50
	Parameters: 1
	Flags: Linked
*/
function aigroup_spawner_death(tracker)
{
	self waittill(#"death", #"hash_4f7ebd2a17a44113");
	waitframe(1);
	tracker notify(#"update_aigroup");
}

/*
	Name: aigroup_think
	Namespace: spawner
	Checksum: 0x8743A855
	Offset: 0x3E98
	Size: 0xB4
	Parameters: 1
	Flags: Linked
*/
function aigroup_think(tracker)
{
	tracker.aicount++;
	tracker.ai[tracker.ai.size] = self;
	tracker notify(#"update_aigroup");
	self waittill(#"death");
	waitframe(1);
	tracker.aicount--;
	tracker.killed_count++;
	tracker notify(#"update_aigroup");
	waitframe(1);
	arrayremovevalue(tracker.ai, undefined);
}

/*
	Name: set_ai_group_cleared_flag
	Namespace: spawner
	Checksum: 0x896C34C1
	Offset: 0x3F58
	Size: 0x94
	Parameters: 1
	Flags: Linked
*/
function set_ai_group_cleared_flag(tracker)
{
	waittillframeend();
	while(tracker.aicount + get_ai_group_spawner_count(tracker.aigroup) > tracker.cleared_count)
	{
		tracker waittill(#"update_aigroup");
		waitframe(1);
	}
	level flag::set(tracker.aigroup + "_cleared");
}

/*
	Name: trigger_requires_player
	Namespace: spawner
	Checksum: 0x45E758B3
	Offset: 0x3FF8
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function trigger_requires_player(trigger)
{
	if(!isdefined(trigger))
	{
		return 0;
	}
	return isdefined(trigger.script_requires_player);
}

/*
	Name: spawn
	Namespace: spawner
	Checksum: 0x49D16DCD
	Offset: 0x4028
	Size: 0xDAC
	Parameters: 5
	Flags: Linked
*/
function spawn(b_force, str_targetname, v_origin, v_angles, bignorespawninglimit)
{
	if(!isdefined(b_force))
	{
		b_force = 0;
	}
	self endon(#"death");
	e_spawned = undefined;
	force_spawn = 0;
	var_82818228 = 0;
	makeroom = 0;
	infinitespawn = 0;
	deleteonzerocount = 0;
	if(!check_player_requirements())
	{
		return;
	}
	if(isdefined(self.spawnflags) && (self.spawnflags & 64) == 64)
	{
		infinitespawn = 1;
	}
	if(is_true(bignorespawninglimit))
	{
		infinitespawn = 1;
	}
	var_5d24e75f = !infinitespawn && (isdefined(self.count) && self.count <= 0);
	while(true)
	{
		if(!var_5d24e75f && !is_true(self.ignorespawninglimit))
		{
			global_spawn_throttle();
		}
		if(isdefined(self.lastspawntime) && self.lastspawntime >= gettime())
		{
			waitframe(1);
			continue;
		}
		break;
	}
	if(isactorspawner(self))
	{
		if(isdefined(self.spawnflags) && (self.spawnflags & 2) == 2)
		{
			makeroom = 1;
		}
		if(isdefined(self.spawnflags) && (self.spawnflags & 128) == 128)
		{
			deleteonzerocount = 1;
		}
	}
	else if(isvehiclespawner(self))
	{
		if(isdefined(self.spawnflags) && (self.spawnflags & 8) == 8)
		{
			makeroom = 1;
		}
	}
	if(b_force || (isdefined(self.spawnflags) && (self.spawnflags & 16) == 16) || isdefined(self.script_forcespawn))
	{
		force_spawn = 1;
	}
	if(isdefined(self.script_drone) && self.script_drone != 0)
	{
		var_82818228 = 1;
	}
	if(isdefined(self.script_accuracy))
	{
		/#
			assertmsg("");
		#/
	}
	/#
		var_ca330541 = self.classname === "";
		var_cff301a5 = !is_true(var_ca330541) || !is_true(level.var_3313aeb2);
		if(isdefined(level.archetype_spawners) && isarray(level.archetype_spawners) && var_cff301a5)
		{
			archetype = undefined;
			archetype_spawner = undefined;
			if(self.team == #"axis")
			{
				archetype = getdvarstring(#"feature_ai_enemy_archetype");
				if(getdvarstring(#"feature_ai_archetype_override") == #"enemy")
				{
					archetype = getdvarstring(#"feature_ai_enemy_archetype");
				}
				archetype_spawner = level.archetype_spawners[archetype];
			}
			else
			{
				if(self.team == #"allies")
				{
					archetype = getdvarstring(#"feature_ai_ally_archetype");
					if(getdvarstring(#"feature_ai_archetype_override") == "")
					{
						archetype = getdvarstring(#"feature_ai_ally_archetype");
					}
					archetype_spawner = level.archetype_spawners[archetype];
				}
				else if(self.team == #"team3")
				{
					if(getdvarstring(#"feature_ai_archetype_override") == #"enemy")
					{
						archetype = getdvarstring(#"feature_ai_enemy_archetype");
					}
					else
					{
						if(getdvarstring(#"feature_ai_archetype_override") == "")
						{
							archetype = getdvarstring(#"feature_ai_ally_archetype");
						}
						else
						{
							archetype = getdvarstring(#"feature_ai_enemy_archetype");
						}
					}
					archetype_spawner = level.archetype_spawners[archetype];
					if(!isdefined(archetype_spawner))
					{
						archetype = getdvarstring(#"feature_ai_ally_archetype");
						archetype_spawner = level.archetype_spawners[archetype];
					}
				}
			}
			if(isspawner(archetype_spawner))
			{
				while(isdefined(archetype_spawner.lastspawntime) && archetype_spawner.lastspawntime >= gettime())
				{
					waitframe(1);
				}
				originalorigin = archetype_spawner.origin;
				originalangles = archetype_spawner.angles;
				originaltarget = archetype_spawner.target;
				originaltargetname = archetype_spawner.targetname;
				archetype_spawner.target = self.target;
				archetype_spawner.targetname = self.targetname;
				archetype_spawner.script_noteworthy = self.script_noteworthy;
				archetype_spawner.script_string = self.script_string;
				archetype_spawner.origin = self.origin;
				archetype_spawner.angles = self.angles;
				e_spawned = archetype_spawner spawnfromspawner(str_targetname, force_spawn, makeroom, infinitespawn);
				if(!isdefined(str_targetname))
				{
					e_spawned.targetname = archetype_spawner.targetname;
				}
				archetype_spawner.target = originaltarget;
				archetype_spawner.targetname = originaltargetname;
				archetype_spawner.origin = originalorigin;
				archetype_spawner.angles = originalangles;
				if(isdefined(archetype_spawner.spawnflags) && (archetype_spawner.spawnflags & 64) == 64)
				{
					archetype_spawner.count++;
				}
				archetype_spawner.lastspawntime = gettime();
			}
			else if(archetype === "")
			{
				bot = bot::add_bot(self.team);
				if(isdefined(bot))
				{
					bot.botremoveondeath = 1;
					bot bot::function_bab12815(self.origin, self.angles[1]);
					bot bot::function_39d30bb6(is_true(self.script_forcegoal));
					bot waittill(#"spawned_player");
					bot.sessionteam = self.team;
					bot setteam(self.team);
					if(isdefined(bot.pers))
					{
						bot.pers[#"team"] = self.team;
					}
					bot.target = self.target;
					bot.targetname = self.targetname + "";
					bot.script_noteworthy = self.script_noteworthy;
					bot.script_string = self.script_string;
					return bot;
				}
			}
		}
	#/
	if(!isdefined(e_spawned))
	{
		use_female = randomint(100) < level.female_percent;
		if(level.dont_use_female_replacements === 1)
		{
			use_female = 0;
		}
		if(use_female && isdefined(self.aitypevariant))
		{
			e_spawned = self spawnfromspawner(str_targetname, force_spawn, makeroom, infinitespawn, self.aitypevariant);
		}
		else
		{
			override_aitype = undefined;
			/#
				if(currentsessionmode() === 2 && getdvarint(#"hash_99ad36e628f93d0", 0))
				{
					if(isdefined(self) && isactorspawner(self))
					{
						if(self.team == #"allies")
						{
							override_aitype = "";
						}
						else if(self.team == #"axis")
						{
							override_aitype = "";
						}
					}
				}
			#/
			if(isdefined(level.override_spawned_aitype_func))
			{
				override_aitype = [[level.override_spawned_aitype_func]](self);
			}
			if(isdefined(override_aitype))
			{
				e_spawned = self spawnfromspawner(str_targetname, force_spawn, makeroom, infinitespawn, override_aitype, 0, var_82818228);
			}
			else
			{
				e_spawned = self spawnfromspawner(str_targetname, force_spawn, makeroom, infinitespawn, undefined, 0, var_82818228);
			}
		}
	}
	if(var_82818228 && isdefined(e_spawned))
	{
		if(is_true(self.var_60a43fc7))
		{
			e_spawned makesentient();
		}
	}
	if(isdefined(e_spawned))
	{
		if(isdefined(level.run_custom_function_on_ai))
		{
			if(isdefined(archetype_spawner))
			{
				e_spawned thread [[level.run_custom_function_on_ai]](archetype_spawner, str_targetname, force_spawn);
			}
			else
			{
				e_spawned thread [[level.run_custom_function_on_ai]](self, str_targetname, force_spawn);
			}
		}
		if(isdefined(v_origin) || isdefined(v_angles))
		{
			e_spawned teleport_spawned(v_origin, v_angles);
		}
		self.lastspawntime = gettime();
	}
	var_e331297b = isdefined(self.count) && self.count <= 0;
	if(var_e331297b && isdefined(self.script_aigroup))
	{
		self notify(#"hash_4f7ebd2a17a44113");
	}
	if(deleteonzerocount || is_true(self.script_delete_on_zero) && var_e331297b)
	{
		self thread function_d4a13039();
	}
	if(issentient(e_spawned) && !var_82818228)
	{
		result = spawn_failed(e_spawned);
		if(isdefined(result) && result == 0)
		{
			if(isdefined(self.radius))
			{
				goalvolume = e_spawned getgoalvolume();
				if(isdefined(goalvolume))
				{
					/#
						assertmsg((("" + self.origin) + "") + goalvolume getentnum());
					#/
				}
				e_spawned val::set(#"spawn", "goalradius", self.radius);
			}
			self notify(#"hash_66551cac93d16401");
			return e_spawned;
		}
	}
	else
	{
		self notify(#"hash_66551cac93d16401");
		return e_spawned;
	}
}

/*
	Name: function_d4a13039
	Namespace: spawner
	Checksum: 0xC46312C6
	Offset: 0x4DE0
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function function_d4a13039()
{
	self endon(#"death");
	self waittill(#"hash_66551cac93d16401");
	waittillframeend();
	self delete();
}

/*
	Name: teleport_spawned
	Namespace: spawner
	Checksum: 0xC7F425EE
	Offset: 0x4E30
	Size: 0xA2
	Parameters: 3
	Flags: Linked
*/
function teleport_spawned(v_origin, v_angles, b_reset_entity)
{
	if(!isdefined(b_reset_entity))
	{
		b_reset_entity = 1;
	}
	if(!isdefined(v_origin))
	{
		v_origin = self.origin;
	}
	if(!isdefined(v_angles))
	{
		v_angles = self.angles;
	}
	if(isactor(self))
	{
		self forceteleport(v_origin, v_angles, 1, b_reset_entity);
	}
	else
	{
		self.origin = v_origin;
		self.angles = v_angles;
	}
}

/*
	Name: check_player_requirements
	Namespace: spawner
	Checksum: 0x3B548412
	Offset: 0x4EE0
	Size: 0xEC
	Parameters: 0
	Flags: Linked
*/
function check_player_requirements()
{
	if(isdefined(level.players) && level.players.size > 0)
	{
		n_player_count = level.players.size;
	}
	else
	{
		n_player_count = getnumexpectedplayers();
	}
	if(isdefined(self.script_minplayers))
	{
		if(n_player_count < self.script_minplayers)
		{
			self delete();
			return false;
		}
	}
	if(isdefined(self.script_numplayers))
	{
		if(n_player_count < self.script_numplayers)
		{
			self delete();
			return false;
		}
	}
	if(isdefined(self.script_maxplayers))
	{
		if(n_player_count > self.script_maxplayers)
		{
			self delete();
			return false;
		}
	}
	return true;
}

/*
	Name: spawn_failed
	Namespace: spawner
	Checksum: 0x3A49EEB6
	Offset: 0x4FD8
	Size: 0x7E
	Parameters: 1
	Flags: Linked
*/
function spawn_failed(spawn)
{
	if(isalive(spawn))
	{
		spawn endon(#"death");
		if(!isdefined(spawn.finished_spawning))
		{
			spawn waittill(#"hash_a8d38936f5f8fa4");
		}
		waittillframeend();
		if(isalive(spawn))
		{
			return false;
		}
	}
	return true;
}

/*
	Name: kill_spawnernum
	Namespace: spawner
	Checksum: 0x21DCBDE7
	Offset: 0x5060
	Size: 0xB0
	Parameters: 1
	Flags: None
*/
function kill_spawnernum(number)
{
	foreach(sp in getspawnerarray("" + number, "script_killspawner"))
	{
		sp delete();
	}
}

/*
	Name: set_ai_group_cleared_count
	Namespace: spawner
	Checksum: 0x9200BB27
	Offset: 0x5118
	Size: 0x46
	Parameters: 2
	Flags: None
*/
function set_ai_group_cleared_count(aigroup, count)
{
	aigroup_init(aigroup);
	level._ai_group[aigroup].cleared_count = count;
}

/*
	Name: waittill_ai_group_cleared
	Namespace: spawner
	Checksum: 0xF507B17D
	Offset: 0x5168
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function waittill_ai_group_cleared(aigroup)
{
	/#
		assert(isdefined(level._ai_group[aigroup]), ("" + aigroup) + "");
	#/
	level flag::wait_till(aigroup + "_cleared");
}

/*
	Name: waittill_ai_group_count
	Namespace: spawner
	Checksum: 0x83B28CDE
	Offset: 0x51E0
	Size: 0x6A
	Parameters: 2
	Flags: None
*/
function waittill_ai_group_count(aigroup, count)
{
	while(get_ai_group_spawner_count(aigroup) + level._ai_group[aigroup].aicount > count)
	{
		level._ai_group[aigroup] waittill(#"update_aigroup");
	}
}

/*
	Name: waittill_ai_group_ai_count
	Namespace: spawner
	Checksum: 0xE4AB712E
	Offset: 0x5258
	Size: 0x5A
	Parameters: 2
	Flags: None
*/
function waittill_ai_group_ai_count(aigroup, count)
{
	while(level._ai_group[aigroup].aicount > count)
	{
		level._ai_group[aigroup] waittill(#"update_aigroup");
	}
}

/*
	Name: waittill_ai_group_spawner_count
	Namespace: spawner
	Checksum: 0x8FF00FFB
	Offset: 0x52C0
	Size: 0x5A
	Parameters: 2
	Flags: None
*/
function waittill_ai_group_spawner_count(aigroup, count)
{
	while(get_ai_group_spawner_count(aigroup) > count)
	{
		level._ai_group[aigroup] waittill(#"update_aigroup");
	}
}

/*
	Name: waittill_ai_group_amount_killed
	Namespace: spawner
	Checksum: 0x6E503ABB
	Offset: 0x5328
	Size: 0xF2
	Parameters: 3
	Flags: None
*/
function waittill_ai_group_amount_killed(aigroup, amount_killed, timeout)
{
	if(isdefined(timeout))
	{
		__s = spawnstruct();
		__s endon(#"timeout");
		__s util::delay_notify(timeout, "timeout");
	}
	/#
		assert(isdefined(level._ai_group[aigroup]), ("" + aigroup) + "");
	#/
	while(level._ai_group[aigroup].killed_count < amount_killed)
	{
		level._ai_group[aigroup] waittill(#"update_aigroup");
	}
}

/*
	Name: get_ai_group_count
	Namespace: spawner
	Checksum: 0x1B0CE310
	Offset: 0x5428
	Size: 0x38
	Parameters: 1
	Flags: None
*/
function get_ai_group_count(aigroup)
{
	return get_ai_group_spawner_count(aigroup) + level._ai_group[aigroup].aicount;
}

/*
	Name: get_ai_group_sentient_count
	Namespace: spawner
	Checksum: 0xF2904F01
	Offset: 0x5468
	Size: 0x22
	Parameters: 1
	Flags: None
*/
function get_ai_group_sentient_count(aigroup)
{
	return level._ai_group[aigroup].aicount;
}

/*
	Name: get_ai_group_spawner_count
	Namespace: spawner
	Checksum: 0x3BEEBA32
	Offset: 0x5498
	Size: 0xC4
	Parameters: 1
	Flags: Linked
*/
function get_ai_group_spawner_count(aigroup)
{
	n_count = 0;
	foreach(sp in level._ai_group[aigroup].spawners)
	{
		if(isdefined(sp) && sp.count > 0)
		{
			n_count = n_count + sp.count;
		}
	}
	return n_count;
}

/*
	Name: get_ai_group_ai
	Namespace: spawner
	Checksum: 0xCA378577
	Offset: 0x5568
	Size: 0xA8
	Parameters: 1
	Flags: None
*/
function get_ai_group_ai(aigroup)
{
	aiset = [];
	for(index = 0; index < level._ai_group[aigroup].ai.size; index++)
	{
		if(!isalive(level._ai_group[aigroup].ai[index]))
		{
			continue;
		}
		aiset[aiset.size] = level._ai_group[aigroup].ai[index];
	}
	return aiset;
}

/*
	Name: add_global_spawn_function
	Namespace: spawner
	Checksum: 0x58D92601
	Offset: 0x5618
	Size: 0x13A
	Parameters: 3
	Flags: Linked, Variadic
*/
function add_global_spawn_function(team, spawn_func, ...)
{
	if(!isdefined(level.spawn_funcs))
	{
		level.spawn_funcs = [];
	}
	if(!isdefined(level.spawn_funcs[team]))
	{
		level.spawn_funcs[team] = [];
	}
	func = [];
	func[#"function"] = spawn_func;
	func[#"params"] = vararg;
	if(!isdefined(level.spawn_funcs[team]))
	{
		level.spawn_funcs[team] = [];
	}
	else if(!isarray(level.spawn_funcs[team]))
	{
		level.spawn_funcs[team] = array(level.spawn_funcs[team]);
	}
	level.spawn_funcs[team][level.spawn_funcs[team].size] = func;
}

/*
	Name: add_ai_spawn_function
	Namespace: spawner
	Checksum: 0xFF38425F
	Offset: 0x5760
	Size: 0x176
	Parameters: 2
	Flags: Linked, Variadic
*/
function add_ai_spawn_function(spawn_func, ...)
{
	if(!isdefined(level.spawn_funcs))
	{
		level.spawn_funcs = [];
	}
	if(!isdefined(level.spawn_funcs[#"all"]))
	{
		level.spawn_funcs[#"all"] = [];
	}
	func = [];
	func[#"function"] = spawn_func;
	func[#"params"] = vararg;
	if(!isdefined(level.spawn_funcs[#"all"]))
	{
		level.spawn_funcs[#"all"] = [];
	}
	else if(!isarray(level.spawn_funcs[#"all"]))
	{
		level.spawn_funcs[#"all"] = array(level.spawn_funcs[#"all"]);
	}
	level.spawn_funcs[#"all"][level.spawn_funcs[#"all"].size] = func;
}

/*
	Name: function_932006d1
	Namespace: spawner
	Checksum: 0x79C8B8A5
	Offset: 0x58E0
	Size: 0xFC
	Parameters: 1
	Flags: None
*/
function function_932006d1(func)
{
	if(isdefined(level.spawn_funcs) && isdefined(level.spawn_funcs[#"all"]))
	{
		array = [];
		for(i = 0; i < level.spawn_funcs[#"all"].size; i++)
		{
			if(level.spawn_funcs[#"all"][i][#"function"] != func)
			{
				array[array.size] = level.spawn_funcs[#"all"][i];
			}
		}
		level.spawn_funcs[#"all"] = array;
	}
}

/*
	Name: add_archetype_spawn_function
	Namespace: spawner
	Checksum: 0xCF4D598A
	Offset: 0x59E8
	Size: 0x13A
	Parameters: 3
	Flags: Linked, Variadic
*/
function add_archetype_spawn_function(archetype, spawn_func, ...)
{
	if(!isdefined(level.spawn_funcs))
	{
		level.spawn_funcs = [];
	}
	if(!isdefined(level.spawn_funcs[archetype]))
	{
		level.spawn_funcs[archetype] = [];
	}
	func = [];
	func[#"function"] = spawn_func;
	func[#"params"] = vararg;
	if(!isdefined(level.spawn_funcs[archetype]))
	{
		level.spawn_funcs[archetype] = [];
	}
	else if(!isarray(level.spawn_funcs[archetype]))
	{
		level.spawn_funcs[archetype] = array(level.spawn_funcs[archetype]);
	}
	level.spawn_funcs[archetype][level.spawn_funcs[archetype].size] = func;
}

/*
	Name: function_89a2cd87
	Namespace: spawner
	Checksum: 0x2F0C8111
	Offset: 0x5B30
	Size: 0x192
	Parameters: 3
	Flags: Linked, Variadic
*/
function function_89a2cd87(archetype, spawn_func, ...)
{
	if(!isdefined(level.spawn_funcs))
	{
		level.spawn_funcs = [];
	}
	if(!isdefined(level.spawn_funcs[archetype + "_post"]))
	{
		level.spawn_funcs[archetype + "_post"] = [];
	}
	func = [];
	func[#"function"] = spawn_func;
	func[#"params"] = vararg;
	if(!isdefined(level.spawn_funcs[archetype + "_post"]))
	{
		level.spawn_funcs[archetype + "_post"] = [];
	}
	else if(!isarray(level.spawn_funcs[archetype + "_post"]))
	{
		level.spawn_funcs[archetype + "_post"] = array(level.spawn_funcs[archetype + "_post"]);
	}
	level.spawn_funcs[archetype + "_post"][level.spawn_funcs[archetype + "_post"].size] = func;
}

/*
	Name: remove_global_spawn_function
	Namespace: spawner
	Checksum: 0xD3FC0C70
	Offset: 0x5CD0
	Size: 0xC8
	Parameters: 2
	Flags: None
*/
function remove_global_spawn_function(team, func)
{
	if(isdefined(level.spawn_funcs) && isdefined(level.spawn_funcs[team]))
	{
		array = [];
		for(i = 0; i < level.spawn_funcs[team].size; i++)
		{
			if(level.spawn_funcs[team][i][#"function"] != func)
			{
				array[array.size] = level.spawn_funcs[team][i];
			}
		}
		level.spawn_funcs[team] = array;
	}
}

/*
	Name: add_spawn_function
	Namespace: spawner
	Checksum: 0xDD4DE48C
	Offset: 0x5DA0
	Size: 0xC0
	Parameters: 2
	Flags: Linked, Variadic
*/
function add_spawn_function(spawn_func, ...)
{
	/#
		assert(!isdefined(level._loadstarted) || !isalive(self), "");
	#/
	func = [];
	func[#"function"] = spawn_func;
	func[#"params"] = vararg;
	if(!isdefined(self.spawn_funcs))
	{
		self.spawn_funcs = [];
	}
	self.spawn_funcs[self.spawn_funcs.size] = func;
}

/*
	Name: remove_spawn_function
	Namespace: spawner
	Checksum: 0x4B27B9F1
	Offset: 0x5E68
	Size: 0x10A
	Parameters: 1
	Flags: Linked
*/
function remove_spawn_function(func)
{
	/#
		assert(!isdefined(level._loadstarted) || !isalive(self), "");
	#/
	if(isdefined(self.spawn_funcs))
	{
		array = [];
		for(i = 0; i < self.spawn_funcs.size; i++)
		{
			if(self.spawn_funcs[i][#"function"] != func)
			{
				array[array.size] = self.spawn_funcs[i];
			}
		}
		/#
			assert(self.spawn_funcs.size != array.size, "");
		#/
		self.spawn_funcs = array;
	}
}

/*
	Name: add_spawn_function_group
	Namespace: spawner
	Checksum: 0x5B990F52
	Offset: 0x5F80
	Size: 0xE4
	Parameters: 8
	Flags: None
*/
function add_spawn_function_group(str_value, str_key, func_spawn, param_1, param_2, param_3, param_4, param_5)
{
	if(!isdefined(str_key))
	{
		str_key = "targetname";
	}
	/#
		assert(isdefined(str_value), "");
	#/
	/#
		assert(isdefined(func_spawn), "");
	#/
	a_spawners = getspawnerarray(str_value, str_key);
	array::run_all(a_spawners, &add_spawn_function, func_spawn, param_1, param_2, param_3, param_4, param_5);
}

/*
	Name: function_ec9f109a
	Namespace: spawner
	Checksum: 0x103FA30F
	Offset: 0x6070
	Size: 0xB4
	Parameters: 3
	Flags: None
*/
function function_ec9f109a(str_value, str_key, func_spawn)
{
	if(!isdefined(str_key))
	{
		str_key = "targetname";
	}
	/#
		assert(isdefined(str_value), "");
	#/
	/#
		assert(isdefined(func_spawn), "");
	#/
	a_spawners = getspawnerarray(str_value, str_key);
	array::run_all(a_spawners, &remove_spawn_function, func_spawn);
}

/*
	Name: add_spawn_function_ai_group
	Namespace: spawner
	Checksum: 0xD28AC513
	Offset: 0x6130
	Size: 0xD4
	Parameters: 7
	Flags: None
*/
function add_spawn_function_ai_group(str_aigroup, func_spawn, param_1, param_2, param_3, param_4, param_5)
{
	/#
		assert(isdefined(str_aigroup), "");
	#/
	/#
		assert(isdefined(func_spawn), "");
	#/
	a_spawners = getspawnerarray(str_aigroup, "script_aigroup");
	array::run_all(a_spawners, &add_spawn_function, func_spawn, param_1, param_2, param_3, param_4, param_5);
}

/*
	Name: remove_spawn_function_ai_group
	Namespace: spawner
	Checksum: 0x45BE93A
	Offset: 0x6210
	Size: 0xCC
	Parameters: 7
	Flags: None
*/
function remove_spawn_function_ai_group(str_aigroup, func_spawn, param_1, param_2, param_3, param_4, param_5)
{
	/#
		assert(isdefined(param_4), "");
	#/
	/#
		assert(isdefined(param_5), "");
	#/
	a_spawners = getspawnerarray(param_4, "script_aigroup");
	array::run_all(a_spawners, &remove_spawn_function, param_5);
}

/*
	Name: simple_spawn
	Namespace: spawner
	Checksum: 0xEE4265D7
	Offset: 0x62E8
	Size: 0x202
	Parameters: 3
	Flags: Linked, Variadic
*/
function simple_spawn(name_or_spawners, spawn_func, ...)
{
	spawners = [];
	if(isstring(name_or_spawners))
	{
		spawners = getspawnerarray(name_or_spawners, "targetname");
		/#
			assert(spawners.size, ("" + name_or_spawners) + "");
		#/
	}
	else
	{
		if(!isdefined(name_or_spawners))
		{
			name_or_spawners = [];
		}
		else if(!isarray(name_or_spawners))
		{
			name_or_spawners = array(name_or_spawners);
		}
		spawners = name_or_spawners;
	}
	a_spawned = [];
	bforcespawn = vararg[5];
	foreach(sp in spawners)
	{
		e_spawned = sp spawn(bforcespawn);
		if(isdefined(e_spawned))
		{
			if(isdefined(spawn_func))
			{
				util::single_thread_argarray(e_spawned, spawn_func, vararg);
			}
			if(!isdefined(a_spawned))
			{
				a_spawned = [];
			}
			else if(!isarray(a_spawned))
			{
				a_spawned = array(a_spawned);
			}
			a_spawned[a_spawned.size] = e_spawned;
		}
	}
	return a_spawned;
}

/*
	Name: simple_spawn_single
	Namespace: spawner
	Checksum: 0x65D0DFF
	Offset: 0x64F8
	Size: 0xC6
	Parameters: 3
	Flags: Variadic
*/
function simple_spawn_single(name_or_spawner, spawn_func, ...)
{
	a_args = arraycombine(array(name_or_spawner, spawn_func), vararg, 1, 0);
	ai = util::single_func_argarray(undefined, &simple_spawn, a_args);
	/#
		assert(ai.size <= 1, "");
	#/
	if(ai.size)
	{
		return ai[0];
	}
}

/*
	Name: init_female_spawn
	Namespace: spawner
	Checksum: 0x6D343B78
	Offset: 0x65C8
	Size: 0x24
	Parameters: 0
	Flags: AutoExec
*/
function autoexec init_female_spawn()
{
	level.female_percent = 0;
	set_female_percent(30);
}

/*
	Name: set_female_percent
	Namespace: spawner
	Checksum: 0x3462C0AD
	Offset: 0x65F8
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function set_female_percent(percent)
{
	level.female_percent = percent;
}

