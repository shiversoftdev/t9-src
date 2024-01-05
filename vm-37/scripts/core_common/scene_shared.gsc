#using script_24c15fbbb838c794;
#using script_439e9618e516580f;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\teleport_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\scene_debug_shared.gsc;
#using scripts\core_common\scene_objects_shared.gsc;
#using scripts\core_common\music_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace scene_shared;

/*
	Name: function_e0a8e4ba
	Namespace: scene_shared
	Checksum: 0x575245D7
	Offset: 0x6C8
	Size: 0x23C
	Parameters: 1
	Flags: Linked, Private, Event
*/
event private function_e0a8e4ba(struct)
{
	foreach(k in [1:"scriptgroup_playscenes", 0:"scriptgroup_initscenes"])
	{
		if(!isdefined(level.var_41204f29))
		{
			level.var_41204f29 = [];
		}
		else if(!isarray(level.var_41204f29))
		{
			level.var_41204f29 = array(level.var_41204f29);
		}
		if(!isinarray(level.var_41204f29, tolower(k)))
		{
			level.var_41204f29[level.var_41204f29.size] = tolower(k);
		}
	}
	level.var_5e990e96 = arraycopy(level.var_41204f29);
	if(isdefined(level.struct))
	{
		temp = arraycopy(level.struct);
		level.struct = [];
		foreach(struct in temp)
		{
			struct::init(struct);
		}
	}
	function_6c07201b("CreateStruct", &function_e0a8e4ba);
}

#namespace scene;

/*
	Name: __init__system__
	Namespace: scene
	Checksum: 0x297E12B9
	Offset: 0x910
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"scene", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: scene
	Checksum: 0xA5E90EC7
	Offset: 0x968
	Size: 0x544
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!isdefined(level.scene_streamer_ignore))
	{
		level.scene_streamer_ignore = [];
	}
	level.scenedefs = getscriptbundlenames("scene");
	level.scene_sequence_names = getscriptbundlenames("scenesequence");
	level.active_scenes = [];
	level.inactive_scenes = [];
	level.active_scenes = [];
	level.sceneskippedcount = 0;
	lui::add_luimenu("cp_skip_scene_menu", &cp_skip_scene_menu::register);
	streamerrequest("clear");
	function_17fbdc5c("gamedata/weapons/common/scene_weapon_blacklist.csv");
	foreach(s_scenedef in getscriptbundles("scene"))
	{
		var_50477704 = s_scenedef.name + "_scene_done";
		level flag::init(var_50477704);
		if(s_scenedef.vmtype === "client")
		{
			continue;
		}
		if(s_scenedef.vmtype === "both" && !s_scenedef is_igc())
		{
			n_clientbits = 3;
			clientfield::register("world", s_scenedef.name, 1, n_clientbits, "int");
		}
	}
	switch(currentsessionmode())
	{
		case 2:
		{
			var_a093876d = 1;
			break;
		}
		case 1:
		{
			var_a093876d = 24;
			break;
		}
		case 0:
		{
			var_a093876d = 4;
			break;
		}
		case 3:
		{
			var_a093876d = 40;
			break;
		}
		default:
		{
			var_a093876d = 24;
			break;
		}
	}
	if(util::is_frontend_map())
	{
		var_a093876d = 24;
	}
	var_a093876d = int(min(32, var_a093876d));
	clientfield::register("toplayer", "postfx_igc", 1, 2, "counter");
	clientfield::register("world", "in_igc", 1, var_a093876d, "int");
	clientfield::register("toplayer", "postfx_cateye", 1, 1, "int");
	clientfield::register("toplayer", "player_scene_skip_completed", 1, 2, "counter");
	clientfield::register("toplayer", "player_pbg_bank_scene_system", 1, getminbitcountfornum(3), "int");
	clientfield::register("allplayers", "player_scene_animation_skip", 1, 2, "counter");
	clientfield::register("actor", "player_scene_animation_skip", 1, 2, "counter");
	clientfield::register("vehicle", "player_scene_animation_skip", 1, 2, "counter");
	clientfield::register("scriptmover", "player_scene_animation_skip", 1, 2, "counter");
	if(sessionmodeiscampaigngame())
	{
		level.interactive_shot = interactive_shot::register();
	}
	callback::on_disconnect(&on_player_disconnect);
}

/*
	Name: function_17fbdc5c
	Namespace: scene
	Checksum: 0xD44262E8
	Offset: 0xEB8
	Size: 0x132
	Parameters: 1
	Flags: Linked
*/
function function_17fbdc5c(table)
{
	index = 0;
	row = tablelookuprow(table, index);
	while(isdefined(row))
	{
		str_weapon_name = row[0];
		if(isdefined(str_weapon_name) && str_weapon_name != "")
		{
			if(!isdefined(level.var_b6405fbf))
			{
				level.var_b6405fbf = [];
			}
			else if(!isarray(level.var_b6405fbf))
			{
				level.var_b6405fbf = array(level.var_b6405fbf);
			}
			if(!isinarray(level.var_b6405fbf, str_weapon_name))
			{
				level.var_b6405fbf[level.var_b6405fbf.size] = str_weapon_name;
			}
		}
		index++;
		row = tablelookuprow(table, index);
	}
}

/*
	Name: function_585fb738
	Namespace: scene
	Checksum: 0x2E49F0D9
	Offset: 0xFF8
	Size: 0x1FC
	Parameters: 0
	Flags: Linked
*/
function function_585fb738()
{
	if(function_7aa3d2c6(self.name))
	{
		self.igc = 1;
		return;
	}
	foreach(s_object in self.objects)
	{
		if(!is_true(s_object.disabled) && !is_true(s_object.showhud))
		{
			if(isdefined(s_object.shots))
			{
				foreach(s_shot in s_object.shots)
				{
					if(isdefined(s_shot.entry))
					{
						foreach(s_entry in s_shot.entry)
						{
							if(isdefined(s_entry.cameraswitcher))
							{
								self.igc = 1;
								return;
							}
						}
					}
				}
			}
		}
	}
}

/*
	Name: get_all_shot_names
	Namespace: scene
	Checksum: 0x7D235A4B
	Offset: 0x1200
	Size: 0x250
	Parameters: 2
	Flags: Linked
*/
function get_all_shot_names(str_scenedef, var_8c4d2266)
{
	if(!isdefined(var_8c4d2266))
	{
		var_8c4d2266 = 0;
	}
	s_scenedef = get_scenedef(str_scenedef);
	if(isdefined(s_scenedef.a_str_shot_names))
	{
		a_shots = arraycopy(s_scenedef.a_str_shot_names);
		if(var_8c4d2266)
		{
			arrayremovevalue(a_shots, "init");
		}
		return a_shots;
	}
	a_shots = [];
	foreach(s_object in s_scenedef.objects)
	{
		if(!is_true(s_object.disabled))
		{
			foreach(s_shot in s_object.shots)
			{
				if(!isdefined(a_shots))
				{
					a_shots = [];
				}
				else if(!isarray(a_shots))
				{
					a_shots = array(a_shots);
				}
				if(!isinarray(a_shots, s_shot.name))
				{
					a_shots[a_shots.size] = s_shot.name;
				}
			}
		}
	}
	s_scenedef.a_str_shot_names = a_shots;
	if(var_8c4d2266)
	{
		arrayremovevalue(a_shots, "init");
	}
	return a_shots;
}

/*
	Name: function_c3a1b36a
	Namespace: scene
	Checksum: 0x8D295373
	Offset: 0x1458
	Size: 0x62
	Parameters: 1
	Flags: Linked
*/
function function_c3a1b36a(str_scenedef)
{
	a_shots = arraycopy(get_all_shot_names(str_scenedef));
	arrayremovevalue(a_shots, "init");
	return a_shots[0];
}

/*
	Name: function_c9770402
	Namespace: scene
	Checksum: 0x184B498D
	Offset: 0x14C8
	Size: 0x96
	Parameters: 1
	Flags: Linked
*/
function function_c9770402(str_scenedef)
{
	s_scenedef = get_scenedef(str_scenedef);
	if(isdefined(s_scenedef.str_final_bundle))
	{
		return s_scenedef.str_final_bundle;
	}
	if(isdefined(s_scenedef.var_418c40ac))
	{
		return s_scenedef.var_418c40ac;
	}
	a_shots = get_all_shot_names(str_scenedef);
	return a_shots[a_shots.size - 1];
}

/*
	Name: function_24f8cfb5
	Namespace: scene
	Checksum: 0xAA9076B1
	Offset: 0x1568
	Size: 0x84
	Parameters: 2
	Flags: None
*/
function function_24f8cfb5(str_scenedef, str_shot)
{
	a_shots = get_all_shot_names(str_scenedef);
	if(str_shot == "init")
	{
		return false;
	}
	arrayremovevalue(a_shots, "init");
	if(a_shots[0] === str_shot)
	{
		return true;
	}
	return false;
}

/*
	Name: function_b260bdcc
	Namespace: scene
	Checksum: 0x5D2FC571
	Offset: 0x15F8
	Size: 0x7C
	Parameters: 2
	Flags: Linked
*/
function function_b260bdcc(str_scenedef, str_shot)
{
	var_418c40ac = function_c9770402(str_scenedef);
	s_scenedef = get_scenedef(str_scenedef);
	if(str_shot !== "init" && str_shot === var_418c40ac)
	{
		return true;
	}
	return false;
}

/*
	Name: function_9503138e
	Namespace: scene
	Checksum: 0x8E897E59
	Offset: 0x1680
	Size: 0x70
	Parameters: 1
	Flags: Linked
*/
function function_9503138e(object)
{
	if(!isdefined(object))
	{
		object = self;
	}
	if(object.classname === "scriptbundle_scene")
	{
		return true;
	}
	if(object.classname === "scriptbundle_fxanim")
	{
		return true;
	}
	if(object.variantname === "smart_object")
	{
		return true;
	}
	return false;
}

/*
	Name: function_bf1f4951
	Namespace: scene
	Checksum: 0xA84DF5A
	Offset: 0x16F8
	Size: 0x38
	Parameters: 1
	Flags: Linked
*/
function function_bf1f4951(s_instance)
{
	if(!isdefined(s_instance))
	{
		s_instance = self;
	}
	if(s_instance.classname === "scriptbundle_scenesequence")
	{
		return true;
	}
	return false;
}

/*
	Name: function_6a0b0afe
	Namespace: scene
	Checksum: 0xC3D7A24F
	Offset: 0x1738
	Size: 0x36
	Parameters: 1
	Flags: Linked
*/
function function_6a0b0afe(str_mode)
{
	if(issubstr(str_mode, "single"))
	{
		return true;
	}
	return false;
}

/*
	Name: function_8ac3bea9
	Namespace: scene
	Checksum: 0x78BF9636
	Offset: 0x1778
	Size: 0x4E4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ac3bea9()
{
	a_instances = arraycombine(struct::get_array("scriptbundle_scene", "classname"), struct::get_array("scriptbundle_fxanim", "classname"), 0, 0);
	a_instances = arraycombine(a_instances, struct::get_array("smart_object", "variantname"), 0, 0);
	function_d4c74ab3();
	foreach(s_instance in a_instances)
	{
		s_scenedef = getscriptbundle(s_instance.scriptbundlename);
		/#
			/#
				assert(isdefined(s_scenedef), ("" + function_9e72a96(s_instance.scriptbundlename)) + "");
			#/
		#/
		if(s_scenedef.vmtype === "client")
		{
			continue;
		}
		if(isdefined(s_instance.linkto))
		{
			s_instance thread _scene_link();
		}
		if(isdefined(s_instance.script_flag_set))
		{
			level flag::init(s_instance.script_flag_set);
		}
		if(isdefined(s_instance.scriptgroup_initscenes))
		{
			foreach(trig in getentarray(s_instance.scriptgroup_initscenes, "scriptgroup_initscenes"))
			{
				s_instance thread _trigger_init(trig);
			}
		}
		if(isdefined(s_instance.scriptgroup_playscenes))
		{
			foreach(trig in getentarray(s_instance.scriptgroup_playscenes, "scriptgroup_playscenes"))
			{
				s_instance thread _trigger_play(trig);
			}
		}
		if(isdefined(s_instance.scriptgroup_stopscenes))
		{
			foreach(trig in getentarray(s_instance.scriptgroup_stopscenes, "scriptgroup_stopscenes"))
			{
				s_instance thread _trigger_stop(trig);
			}
		}
		s_instance function_846ffeda();
		/#
			if(!isdefined(level.scene_roots))
			{
				level.scene_roots = [];
			}
			else if(!isarray(level.scene_roots))
			{
				level.scene_roots = array(level.scene_roots);
			}
			if(!isinarray(level.scene_roots, s_instance))
			{
				level.scene_roots[level.scene_roots.size] = s_instance;
			}
		#/
	}
	level thread on_load_wait();
	level thread run_instances();
}

/*
	Name: function_6f9a9e07
	Namespace: scene
	Checksum: 0x32B5E6C2
	Offset: 0x1C68
	Size: 0xC8
	Parameters: 0
	Flags: Linked
*/
function function_6f9a9e07()
{
	if(isdefined(self.script_scene_nodes))
	{
		self.var_bf4dc147 = getnodearray(self.script_scene_nodes, "script_scene_nodes");
		foreach(node in self.var_bf4dc147)
		{
			setenablenode(node, 1);
		}
	}
}

/*
	Name: function_846ffeda
	Namespace: scene
	Checksum: 0xB84E0DB4
	Offset: 0x1D38
	Size: 0xC0
	Parameters: 0
	Flags: Linked
*/
function function_846ffeda()
{
	if(isdefined(self.script_scene_nodes))
	{
		self.var_bf4dc147 = getnodearray(self.script_scene_nodes, "script_scene_nodes");
		foreach(node in self.var_bf4dc147)
		{
			setenablenode(node, 0);
		}
	}
}

/*
	Name: function_7cda7776
	Namespace: scene
	Checksum: 0xF30BE358
	Offset: 0x1E00
	Size: 0x23E
	Parameters: 1
	Flags: Linked
*/
function function_7cda7776(var_faa74cb)
{
	if(self function_9503138e() || self function_bf1f4951() && isdefined(self.script_scene_entities) && !isdefined(self get_active_scene(self.scriptbundlename)))
	{
		if(!isdefined(var_faa74cb))
		{
			var_faa74cb = [];
		}
		else if(!isarray(var_faa74cb))
		{
			var_faa74cb = array(var_faa74cb);
		}
		var_d3e0f43e = [];
		if(!isdefined(self.scene_ents))
		{
			var_d3e0f43e = getentarray(self.script_scene_entities, "script_scene_entities");
			arrayremovevalue(var_d3e0f43e, undefined);
			foreach(ent in arraycopy(var_d3e0f43e))
			{
				if(isspawner(ent) && ent.count === 0 || isactor(ent) || isvehicle(ent))
				{
					ent.script_scene_entities = undefined;
					arrayremovevalue(var_d3e0f43e, ent, 1);
				}
			}
		}
		a_ents = arraycombine(var_faa74cb, var_d3e0f43e, 0, 0);
	}
	else
	{
		a_ents = var_faa74cb;
	}
	return a_ents;
}

/*
	Name: function_d4c74ab3
	Namespace: scene
	Checksum: 0x124C8962
	Offset: 0x2048
	Size: 0x248
	Parameters: 0
	Flags: Linked
*/
function function_d4c74ab3()
{
	/#
		a_triggers = trigger::get_all();
		foreach(trig in a_triggers)
		{
			if(isdefined(trig.targetname))
			{
				str_trig_name = ("" + trig.targetname) + "";
			}
			else
			{
				str_trig_name = ("" + trig getentitynumber()) + "";
			}
			if(isdefined(trig.scriptgroup_initscenes))
			{
				a_instances = struct::get_array(trig.scriptgroup_initscenes, "");
				/#
					assert(a_instances.size, (("" + str_trig_name) + "") + trig.scriptgroup_initscenes);
				#/
			}
			if(isdefined(trig.scriptgroup_playscenes))
			{
				a_instances = struct::get_array(trig.scriptgroup_playscenes, "");
				/#
					assert(a_instances.size, (("" + str_trig_name) + "") + trig.scriptgroup_playscenes);
				#/
			}
			if(isdefined(trig.scriptgroup_stopscenes))
			{
				a_instances = struct::get_array(trig.scriptgroup_stopscenes, "");
				/#
					assert(a_instances.size, (("" + str_trig_name) + "") + trig.scriptgroup_stopscenes);
				#/
			}
		}
	#/
}

/*
	Name: _scene_link
	Namespace: scene
	Checksum: 0x3CAEEE0
	Offset: 0x2298
	Size: 0xBC
	Parameters: 0
	Flags: Linked
*/
function _scene_link()
{
	self.e_scene_link = util::spawn_model("tag_origin", self.origin, self.angles);
	e_linkto = getent(self.linkto, "linkname");
	self.e_scene_link linkto(e_linkto);
	util::waittill_any_ents_two(self, "death", e_linkto, "death");
	self.e_scene_link delete();
}

/*
	Name: on_load_wait
	Namespace: scene
	Checksum: 0x93D7CE5C
	Offset: 0x2360
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function on_load_wait()
{
	util::wait_network_frame();
	util::wait_network_frame();
	level flag::set(#"scene_on_load_wait");
}

/*
	Name: run_instances
	Namespace: scene
	Checksum: 0x78027EDD
	Offset: 0x23B0
	Size: 0x210
	Parameters: 0
	Flags: Linked
*/
function run_instances()
{
	foreach(s_instance in struct::get_script_bundle_instances("scene"))
	{
		if(getscriptbundle(s_instance.scriptbundlename).vmtype === "client")
		{
			s_instance struct::delete();
			continue;
		}
		if(isdefined(s_instance.spawnflags) && (s_instance.spawnflags & 2) == 2)
		{
			s_instance thread play();
			continue;
		}
		if(isdefined(s_instance.spawnflags) && (s_instance.spawnflags & 1) == 1)
		{
			s_instance thread init();
		}
	}
	foreach(s_instance in struct::get_script_bundle_instances("scenesequence"))
	{
		if(isdefined(s_instance.spawnflags) && (s_instance.spawnflags & 2) == 2)
		{
			s_instance thread play();
		}
	}
}

/*
	Name: _trigger_init
	Namespace: scene
	Checksum: 0xE3A9183D
	Offset: 0x25C8
	Size: 0xA4
	Parameters: 1
	Flags: Linked
*/
function _trigger_init(trig)
{
	trig endon(#"death");
	trig trigger::wait_till();
	a_ents = [];
	if(get_player_count(self.scriptbundlename) > 0)
	{
		if(isplayer(trig.who))
		{
			a_ents[0] = trig.who;
		}
	}
	self thread init(a_ents);
}

/*
	Name: _trigger_play
	Namespace: scene
	Checksum: 0x82122030
	Offset: 0x2678
	Size: 0xD6
	Parameters: 1
	Flags: Linked
*/
function _trigger_play(trig)
{
	trig endon(#"death");
	do
	{
		trig trigger::wait_till();
		a_ents = [];
		if(get_player_count(self.scriptbundlename) > 0)
		{
			if(isplayer(trig.who))
			{
				a_ents[0] = trig.who;
			}
		}
		self thread play(a_ents);
	}
	while(is_true(getscriptbundle(self.scriptbundlename).looping));
}

/*
	Name: _trigger_stop
	Namespace: scene
	Checksum: 0x3912CF8D
	Offset: 0x2758
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function _trigger_stop(trig)
{
	trig endon(#"death");
	trig trigger::wait_till();
	self thread stop();
}

/*
	Name: add_scene_func
	Namespace: scene
	Checksum: 0xA1831651
	Offset: 0x27B0
	Size: 0x1D4
	Parameters: 4
	Flags: Linked, Variadic
*/
function add_scene_func(str_scenedef, func, var_e21c4c4c, ...)
{
	if(!isdefined(var_e21c4c4c))
	{
		var_e21c4c4c = "play";
	}
	/#
		/#
			assert(isdefined(getscriptbundle(str_scenedef)), ("" + function_9e72a96(str_scenedef)) + "");
		#/
	#/
	if(!isdefined(level.scene_funcs))
	{
		level.scene_funcs = [];
	}
	if(!isdefined(level.scene_funcs[str_scenedef]))
	{
		level.scene_funcs[str_scenedef] = [];
	}
	var_e21c4c4c = tolower(var_e21c4c4c);
	str_shot = function_c776e5bd(str_scenedef, var_e21c4c4c);
	if(!isdefined(level.scene_funcs[str_scenedef][str_shot]))
	{
		level.scene_funcs[str_scenedef][str_shot] = [];
	}
	if(var_e21c4c4c === "play" && str_shot !== "play")
	{
		array::add(level.scene_funcs[str_scenedef][str_shot], array(func, vararg, 1), 0);
	}
	else
	{
		array::add(level.scene_funcs[str_scenedef][str_shot], array(func, vararg), 0);
	}
}

/*
	Name: function_d0d7d9f7
	Namespace: scene
	Checksum: 0x20C506E
	Offset: 0x2990
	Size: 0xC0
	Parameters: 2
	Flags: None
*/
function function_d0d7d9f7(str_scenedef, func)
{
	a_str_shots = get_all_shot_names(str_scenedef, 0);
	foreach(str_shot in a_str_shots)
	{
		add_scene_func(str_scenedef, func, str_shot, str_shot);
	}
}

/*
	Name: function_d8a83a50
	Namespace: scene
	Checksum: 0x113A0CA0
	Offset: 0x2A58
	Size: 0x1D4
	Parameters: 4
	Flags: Linked, Variadic
*/
function function_d8a83a50(str_scenedef, func, var_e21c4c4c, ...)
{
	if(!isdefined(var_e21c4c4c))
	{
		var_e21c4c4c = "play";
	}
	/#
		/#
			assert(isdefined(getscriptbundle(str_scenedef)), ("" + function_9e72a96(str_scenedef)) + "");
		#/
	#/
	if(!isdefined(level.var_4247a0d6))
	{
		level.var_4247a0d6 = [];
	}
	if(!isdefined(level.var_4247a0d6[str_scenedef]))
	{
		level.var_4247a0d6[str_scenedef] = [];
	}
	var_e21c4c4c = tolower(var_e21c4c4c);
	str_shot = function_c776e5bd(str_scenedef, var_e21c4c4c);
	if(!isdefined(level.var_4247a0d6[str_scenedef][str_shot]))
	{
		level.var_4247a0d6[str_scenedef][str_shot] = [];
	}
	if(var_e21c4c4c === "play" && str_shot !== "play")
	{
		array::add(level.var_4247a0d6[str_scenedef][str_shot], array(func, vararg, 1), 0);
	}
	else
	{
		array::add(level.var_4247a0d6[str_scenedef][str_shot], array(func, vararg), 0);
	}
}

/*
	Name: function_497689f6
	Namespace: scene
	Checksum: 0x4304A871
	Offset: 0x2C38
	Size: 0x6C
	Parameters: 5
	Flags: None
*/
function function_497689f6(str_scenedef, var_4ebc26aa, var_822d3bf5, var_7e21e745, var_e21c4c4c)
{
	if(!isdefined(var_e21c4c4c))
	{
		var_e21c4c4c = "play";
	}
	add_scene_func(str_scenedef, &function_f61e64e8, var_e21c4c4c, var_4ebc26aa, var_822d3bf5, var_7e21e745);
}

/*
	Name: function_f61e64e8
	Namespace: scene
	Checksum: 0x276231C8
	Offset: 0x2CB0
	Size: 0x164
	Parameters: 4
	Flags: Linked, Private
*/
function private function_f61e64e8(a_ents, var_4ebc26aa, var_822d3bf5, var_7e21e745)
{
	var_ebf8b537 = getentarray(var_7e21e745, "targetname");
	if(isdefined(a_ents[var_4ebc26aa]) && var_ebf8b537.size)
	{
		foreach(ent in var_ebf8b537)
		{
			ent linkto(a_ents[var_4ebc26aa], var_822d3bf5, (0, 0, 0), (0, 0, 0));
		}
		/#
			if(var_ebf8b537.size)
			{
				level thread function_41dc295(a_ents[var_4ebc26aa], var_822d3bf5, self.scriptbundlename);
			}
		#/
	}
	else
	{
		/#
			println((("" + var_4ebc26aa) + "") + var_7e21e745);
		#/
	}
}

/*
	Name: function_41dc295
	Namespace: scene
	Checksum: 0xCE569B2E
	Offset: 0x2E20
	Size: 0x1E6
	Parameters: 3
	Flags: Private
*/
function private function_41dc295(e_scene_object, var_822d3bf5, str_scene_name)
{
	/#
		e_scene_object endon(#"death");
		if(isdefined(str_scene_name))
		{
			level endon(str_scene_name + "");
		}
		if(!isdefined(var_822d3bf5))
		{
			var_822d3bf5 = "";
		}
		while(true)
		{
			if(getdvarint(#"hash_3a787cfe7207f59", 0))
			{
				org = e_scene_object gettagorigin(var_822d3bf5);
				angles = e_scene_object gettagangles(var_822d3bf5);
				print3d(org, toupper(var_822d3bf5), (0, 1, 0), undefined, 0.25);
				originendpoint = org + vectorscale(anglestoforward(angles), 6);
				originrightpoint = org + (vectorscale(anglestoright(angles), -1 * 6));
				originuppoint = org + vectorscale(anglestoup(angles), 6);
				line(org, originendpoint, (1, 0, 0));
				line(org, originrightpoint, (0, 1, 0));
				line(org, originuppoint, (0, 0, 1));
			}
			waitframe(1);
		}
	#/
}

/*
	Name: remove_scene_func
	Namespace: scene
	Checksum: 0xA1A2ACB3
	Offset: 0x3010
	Size: 0x23C
	Parameters: 3
	Flags: Linked
*/
function remove_scene_func(str_scenedef, func, var_e21c4c4c)
{
	if(!isdefined(var_e21c4c4c))
	{
		var_e21c4c4c = "play";
	}
	/#
		/#
			assert(isdefined(getscriptbundle(str_scenedef)), ("" + str_scenedef) + "");
		#/
	#/
	if(!isdefined(level.scene_funcs))
	{
		level.scene_funcs = [];
	}
	if(!isdefined(level.var_4247a0d6))
	{
		level.var_4247a0d6 = [];
	}
	var_e21c4c4c = tolower(var_e21c4c4c);
	str_shot = function_c776e5bd(str_scenedef, var_e21c4c4c);
	if(isdefined(level.scene_funcs[str_scenedef]) && isdefined(level.scene_funcs[str_scenedef][str_shot]))
	{
		for(i = level.scene_funcs[str_scenedef][str_shot].size - 1; i >= 0; i--)
		{
			if(level.scene_funcs[str_scenedef][str_shot][i][0] == func)
			{
				arrayremoveindex(level.scene_funcs[str_scenedef][str_shot], i);
			}
		}
	}
	if(isdefined(level.var_4247a0d6[str_scenedef]) && isdefined(level.var_4247a0d6[str_scenedef][str_shot]))
	{
		for(i = level.var_4247a0d6[str_scenedef][str_shot].size - 1; i >= 0; i--)
		{
			if(level.var_4247a0d6[str_scenedef][str_shot][i][0] == func)
			{
				arrayremoveindex(level.var_4247a0d6[str_scenedef][str_shot], i);
			}
		}
	}
}

/*
	Name: function_c776e5bd
	Namespace: scene
	Checksum: 0xAE4BF2A
	Offset: 0x3258
	Size: 0x92
	Parameters: 2
	Flags: Linked, Private
*/
function private function_c776e5bd(str_scenedef, str_state)
{
	str_shot = str_state;
	if(str_state == "init")
	{
		str_shot = function_de6a7579(str_scenedef, "init");
	}
	else if(str_state == "play")
	{
		str_shot = function_de6a7579(str_scenedef, "play");
	}
	return str_shot;
}

/*
	Name: get_scenedef
	Namespace: scene
	Checksum: 0xF1583911
	Offset: 0x32F8
	Size: 0xC8
	Parameters: 1
	Flags: Linked
*/
function get_scenedef(str_scenedef)
{
	s_scriptbundle = getscriptbundle(str_scenedef);
	/#
		/#
			assert(isdefined(s_scriptbundle), ("" + function_9e72a96(str_scenedef)) + "");
		#/
	#/
	/#
		/#
			assert(isdefined(s_scriptbundle.objects), ("" + function_9e72a96(str_scenedef)) + "");
		#/
	#/
	return s_scriptbundle;
}

/*
	Name: get_scenedefs
	Namespace: scene
	Checksum: 0x233F5350
	Offset: 0x33C8
	Size: 0x12A
	Parameters: 1
	Flags: None
*/
function get_scenedefs(str_type)
{
	if(!isdefined(str_type))
	{
		str_type = "scene";
	}
	a_scenedefs = [];
	foreach(s_scenedef in getscriptbundles("scene"))
	{
		if(s_scenedef.scenetype === str_type && s_scenedef.vmtype !== "client")
		{
			if(!isdefined(a_scenedefs))
			{
				a_scenedefs = [];
			}
			else if(!isarray(a_scenedefs))
			{
				a_scenedefs = array(a_scenedefs);
			}
			a_scenedefs[a_scenedefs.size] = s_scenedef;
		}
	}
	return a_scenedefs;
}

/*
	Name: spawn
	Namespace: scene
	Checksum: 0xC394A9E8
	Offset: 0x3500
	Size: 0x168
	Parameters: 5
	Flags: None
*/
function spawn(arg1, arg2, arg3, arg4, b_test_run)
{
	str_scenedef = arg1;
	/#
		assert(isdefined(str_scenedef), "");
	#/
	if(isvec(arg2))
	{
		v_origin = arg2;
		v_angles = arg3;
		a_ents = arg4;
	}
	else
	{
		a_ents = arg2;
		v_origin = arg3;
		v_angles = arg4;
	}
	s_instance = spawnstruct();
	s_instance.origin = (isdefined(v_origin) ? v_origin : (0, 0, 0));
	s_instance.angles = (isdefined(v_angles) ? v_angles : (0, 0, 0));
	s_instance.classname = "scriptbundle_scene";
	s_instance.scriptbundlename = str_scenedef;
	struct::init(s_instance);
	s_instance init(str_scenedef, a_ents, undefined, b_test_run);
	return s_instance;
}

/*
	Name: init
	Namespace: scene
	Checksum: 0xC7D39B83
	Offset: 0x3670
	Size: 0x2C4
	Parameters: 4
	Flags: Linked
*/
function init(arg1, arg2, arg3, b_test_run)
{
	self flag::clear("scene_ents_ready");
	self thread play(arg1, arg2, arg3, b_test_run, "init");
	if(self == level)
	{
		if(isstring(arg1) && issubstr(arg1, ","))
		{
			a_toks = strtok(arg1, ",");
			str_value = a_toks[0];
			str_key = a_toks[1];
			if(isstring(arg2))
			{
				str_shot = tolower(arg2);
				a_ents = arg3;
			}
			else
			{
				a_ents = arg2;
			}
		}
		else
		{
			if(isinarray(level.scenedefs, hash(arg1)))
			{
				str_scenedef = arg1;
				var_583db6f0 = 1;
			}
			else
			{
				str_value = arg1;
				str_key = "targetname";
			}
		}
		a_instances = _get_scene_instances(str_value, str_key, str_scenedef);
		if(a_instances.size)
		{
			foreach(s_instance in a_instances)
			{
				s_instance flag::wait_till_timeout(2, "scene_ents_ready");
			}
		}
		else
		{
			self flag::wait_till_timeout(2, "scene_ents_ready");
		}
	}
	else
	{
		self flag::wait_till_timeout(2, "scene_ents_ready");
	}
}

/*
	Name: function_27f5972e
	Namespace: scene
	Checksum: 0x2EC31FB5
	Offset: 0x3940
	Size: 0xF8
	Parameters: 3
	Flags: Linked
*/
function function_27f5972e(str_scenedef, var_a068ac72, var_cdab6c2c)
{
	if(self == level)
	{
		array::run_all(level.players, &forcestreambundle, str_scenedef, var_a068ac72, var_cdab6c2c);
	}
	else
	{
		self forcestreambundle(str_scenedef, var_a068ac72, var_cdab6c2c);
	}
	if(!isdefined(self.var_cb8ed5f0))
	{
		self.var_cb8ed5f0 = [];
	}
	else if(!isarray(self.var_cb8ed5f0))
	{
		self.var_cb8ed5f0 = array(self.var_cb8ed5f0);
	}
	if(!isinarray(self.var_cb8ed5f0, str_scenedef))
	{
		self.var_cb8ed5f0[self.var_cb8ed5f0.size] = str_scenedef;
	}
}

/*
	Name: function_f81475ae
	Namespace: scene
	Checksum: 0xC24F7BE0
	Offset: 0x3A40
	Size: 0x9C
	Parameters: 3
	Flags: Linked
*/
function function_f81475ae(str_scenedef, var_a068ac72, var_cdab6c2c)
{
	if(!isdefined(self.var_cb8ed5f0))
	{
		self.var_cb8ed5f0 = [];
	}
	if(self == level)
	{
		array::run_all(level.players, &function_66b6e720, var_cdab6c2c);
	}
	else
	{
		self function_66b6e720(var_cdab6c2c);
	}
	arrayremovevalue(self.var_cb8ed5f0, var_cdab6c2c);
}

/*
	Name: function_cef06dcb
	Namespace: scene
	Checksum: 0x10D5ED0A
	Offset: 0x3AE8
	Size: 0xA0
	Parameters: 0
	Flags: None
*/
function function_cef06dcb()
{
	if(!isdefined(self.var_cb8ed5f0))
	{
		self.var_cb8ed5f0 = [];
	}
	foreach(str_scenedef in self.var_cb8ed5f0)
	{
		level function_f81475ae(str_scenedef);
	}
}

/*
	Name: init_streamer
	Namespace: scene
	Checksum: 0x3CA8DB73
	Offset: 0x3B90
	Size: 0x6CC
	Parameters: 4
	Flags: Linked
*/
function init_streamer(str_scenedef, var_1b38cf1d, var_b6213032, b_invulnerable)
{
	if(!isdefined(var_b6213032))
	{
		var_b6213032 = 0;
	}
	if(!isdefined(b_invulnerable))
	{
		b_invulnerable = 1;
	}
	s_scenedef = get_scenedef(str_scenedef);
	var_2924e369 = util::get_team_mapping("sidea");
	var_3b6e87fc = util::get_team_mapping("sideb");
	if(isstring(var_1b38cf1d) || ishash(var_1b38cf1d))
	{
		var_1b38cf1d = util::get_team_mapping(var_1b38cf1d);
	}
	if(sessionmodeiscampaigngame())
	{
		level flag::wait_till("all_players_connected");
	}
	a_players = [];
	if(isarray(var_1b38cf1d))
	{
		if(!var_1b38cf1d.size)
		{
			return;
		}
		foreach(player in var_1b38cf1d)
		{
			if(player.team === var_2924e369 && isdefined(s_scenedef.var_a6da2039))
			{
				player thread function_1f9e783e(s_scenedef.var_a6da2039, str_scenedef);
				if(!isdefined(a_players))
				{
					a_players = [];
				}
				else if(!isarray(a_players))
				{
					a_players = array(a_players);
				}
				a_players[a_players.size] = player;
				continue;
			}
			if(player.team === var_3b6e87fc && isdefined(s_scenedef.var_991a84ba))
			{
				player thread function_1f9e783e(s_scenedef.var_991a84ba, str_scenedef);
				if(!isdefined(a_players))
				{
					a_players = [];
				}
				else if(!isarray(a_players))
				{
					a_players = array(a_players);
				}
				a_players[a_players.size] = player;
				continue;
			}
			if(player.team !== var_2924e369 && player.team !== var_3b6e87fc && isdefined(s_scenedef.var_a6da2039))
			{
				player thread function_1f9e783e(s_scenedef.var_a6da2039, str_scenedef);
				if(!isdefined(a_players))
				{
					a_players = [];
				}
				else if(!isarray(a_players))
				{
					a_players = array(a_players);
				}
				a_players[a_players.size] = player;
			}
		}
	}
	else
	{
		if(var_1b38cf1d == var_2924e369 && isdefined(s_scenedef.var_a6da2039))
		{
			a_players = getplayers(var_2924e369);
			array::thread_all(a_players, &function_1f9e783e, s_scenedef.var_a6da2039, str_scenedef);
		}
		else
		{
			if(var_1b38cf1d == var_3b6e87fc && isdefined(s_scenedef.var_991a84ba))
			{
				a_players = getplayers(var_3b6e87fc);
				array::thread_all(a_players, &function_1f9e783e, s_scenedef.var_991a84ba, str_scenedef);
			}
			else
			{
				if(isstring(var_1b38cf1d) || ishash(var_1b38cf1d) && isdefined(s_scenedef.var_a6da2039))
				{
					a_players = getplayers(var_1b38cf1d);
					array::thread_all(a_players, &function_1f9e783e, s_scenedef.var_a6da2039, str_scenedef);
				}
				else
				{
					return;
				}
			}
		}
	}
	/#
		iprintln("" + function_9e72a96(str_scenedef));
	#/
	if(sessionmodeismultiplayergame() || sessionmodeiswarzonegame())
	{
		var_b6213032 = 0;
		b_invulnerable = 0;
	}
	if(var_b6213032)
	{
		array::thread_all(a_players, &val::set, "init_streamer", "freezecontrols", 1);
		array::thread_all(a_players, &lui::screen_fade_out, 0, undefined, "init_streamer");
	}
	if(b_invulnerable)
	{
		array::thread_all(a_players, &val::set, "init_streamer", "takedamage", 0);
	}
	array::wait_till(a_players, "init_streamer_done", 10);
	if(var_b6213032)
	{
		array::thread_all(a_players, &val::reset, "init_streamer", "freezecontrols");
		array::thread_all(a_players, &util::delay, 0.2, "disconnect", &lui::screen_fade_in, 1, undefined, "init_streamer");
	}
	if(b_invulnerable)
	{
		array::thread_all(a_players, &val::reset, "init_streamer", "takedamage");
	}
}

/*
	Name: function_1f9e783e
	Namespace: scene
	Checksum: 0x966F0368
	Offset: 0x4268
	Size: 0x10E
	Parameters: 2
	Flags: Linked, Private
*/
function private function_1f9e783e(var_5c8c4fbc, str_scenedef)
{
	self endon(#"disconnect");
	self flag::set(#"player_streamer_loading");
	if(!isdefined(self.var_231881b1))
	{
		self.var_231881b1 = [];
	}
	if(!isdefined(self.var_16672042))
	{
		self.var_16672042 = [];
	}
	self.var_231881b1[str_scenedef] = var_5c8c4fbc;
	self.var_16672042[str_scenedef] = self playerstreamerrequest("set", var_5c8c4fbc);
	self util::streamer_wait(self.var_16672042[str_scenedef], undefined, 30, undefined, str_scenedef);
	self flag::clear(#"player_streamer_loading");
	self notify(#"init_streamer_done");
}

/*
	Name: function_15be7db9
	Namespace: scene
	Checksum: 0x7921797A
	Offset: 0x4380
	Size: 0x47C
	Parameters: 3
	Flags: Linked
*/
function function_15be7db9(str_scenedef, str_shot, var_aed95ca8)
{
	/#
		assert(isstruct(self));
	#/
	/#
		assert(isstring(str_scenedef) || ishash(str_scenedef));
	#/
	if(isdefined(var_aed95ca8))
	{
		var_aed95ca8 = tolower(var_aed95ca8);
	}
	if(isdefined(str_shot))
	{
		str_shot = tolower(str_shot);
	}
	loc_000044E0:
	key = ((str_scenedef + "_") + (isdefined(str_shot) ? str_shot : "_") + "_") + (isdefined(var_aed95ca8) ? var_aed95ca8 : "_");
	if(!isdefined(self.scene_reach))
	{
		self.scene_reach = [];
	}
	if(isdefined(self.scene_reach[key]))
	{
		return self.scene_reach[key];
	}
	self.scene_reach[key] = self;
	o_scene = _init_instance(str_scenedef);
	if(isdefined(o_scene._a_objects))
	{
		o_object = undefined;
		foreach(obj in o_scene._a_objects)
		{
			if(!isdefined(var_aed95ca8) || tolower(obj._str_name) == var_aed95ca8)
			{
				o_object = obj;
				break;
			}
		}
		if(isdefined(o_object._s.shots))
		{
			foreach(s_shot in o_object._s.shots)
			{
				if(isdefined(s_shot.entry) && s_shot.entry.size > 0 && (!isdefined(str_shot) || tolower(s_shot.name) == str_shot))
				{
					o_object.var_55b4f21e = s_shot;
					[[ o_object ]]->update_alignment();
					/#
						assert(isdefined(o_object.m_align));
					#/
					animation = s_shot.entry[0].anim;
					if(isdefined(animation))
					{
						result = spawnstruct();
						result.origin = getstartorigin(o_object.m_align.origin, o_object.m_align.angles, animation);
						result.angles = getstartangles(o_object.m_align.origin, o_object.m_align.angles, animation);
						/#
							result.var_93d6832 = result.origin;
						#/
						result.origin = getclosestpointonnavmesh(result.origin);
						self.scene_reach[key] = result;
					}
					break;
				}
			}
		}
	}
	return self.scene_reach[key];
}

/*
	Name: _init_instance
	Namespace: scene
	Checksum: 0x4AE9A73D
	Offset: 0x4808
	Size: 0x21C
	Parameters: 3
	Flags: Linked
*/
function _init_instance(str_scenedef, a_ents, b_test_run)
{
	if(!isdefined(b_test_run))
	{
		b_test_run = 0;
	}
	level flag::wait_till("scene_on_load_wait");
	if(!isdefined(str_scenedef))
	{
		str_scenedef = self.scriptbundlename;
	}
	/#
		if(array().size && !isinarray(array(), str_scenedef))
		{
			return;
		}
	#/
	s_bundle = get_scenedef((isdefined(self.var_e87a94f3) ? self.var_e87a94f3 : str_scenedef));
	if(!function_6f382548(s_bundle, str_scenedef))
	{
		return;
	}
	/#
		/#
			assert(isdefined(str_scenedef), ("" + (isdefined(self.origin) ? self.origin : "")) + "");
		#/
		/#
			assert(isdefined(s_bundle), ((("" + (isdefined(self.origin) ? self.origin : "")) + "") + str_scenedef) + "");
		#/
	#/
	if(!is_true(self.var_146935c1))
	{
		o_scene = get_active_scene(str_scenedef);
	}
	if(!isdefined(o_scene))
	{
		o_scene = new cscene();
		[[ o_scene ]]->init(str_scenedef, s_bundle, self, a_ents, b_test_run);
	}
	return o_scene;
}

/*
	Name: function_6f382548
	Namespace: scene
	Checksum: 0x86AC6FEF
	Offset: 0x4A30
	Size: 0x1CC
	Parameters: 2
	Flags: Linked
*/
function function_6f382548(struct, str_scene_name)
{
	if(!isdefined(struct.disableinsplitscreen) || !(getdvarint(#"splitscreen_playercount", 1) > 1))
	{
		return true;
	}
	if(struct.disableinsplitscreen == 2 && getdvarint(#"splitscreen_playercount", 1) > 1 || (struct.disableinsplitscreen == 3 && getdvarint(#"splitscreen_playercount", 1) > 2) || (struct.disableinsplitscreen == 4 && getdvarint(#"splitscreen_playercount", 1) > 3))
	{
		/#
			if(struct.type === "")
			{
				str_debug = ("" + function_9e72a96(str_scene_name)) + "";
			}
			else
			{
				str_debug = ((("" + function_9e72a96(struct.name)) + "") + str_scene_name) + "";
			}
			println(str_debug);
		#/
		return false;
	}
	return true;
}

/*
	Name: _load_female_scene
	Namespace: scene
	Checksum: 0x13E71949
	Offset: 0x4C08
	Size: 0x250
	Parameters: 2
	Flags: None
*/
function _load_female_scene(s_bundle, a_ents)
{
	b_has_player = 0;
	foreach(s_object in s_bundle.objects)
	{
		if(!isdefined(s_object))
		{
			continue;
		}
		if(s_object.type === "player")
		{
			b_has_player = 1;
			break;
		}
	}
	if(b_has_player)
	{
		e_player = undefined;
		if(isplayer(a_ents))
		{
			e_player = a_ents;
		}
		else if(isarray(a_ents))
		{
			foreach(ent in a_ents)
			{
				if(isplayer(ent))
				{
					e_player = ent;
					break;
				}
			}
		}
		if(!isdefined(e_player) && isdefined(function_a1ef346b()))
		{
			e_player = function_a1ef346b()[0];
		}
		if(isplayer(e_player) && e_player util::is_female())
		{
			if(isdefined(s_bundle.femalebundle))
			{
				s_female_bundle = getscriptbundle(s_bundle.femalebundle);
				if(isdefined(s_female_bundle))
				{
					return s_female_bundle;
				}
			}
		}
	}
	return s_bundle;
}

/*
	Name: function_de6a7579
	Namespace: scene
	Checksum: 0x193014B7
	Offset: 0x4E60
	Size: 0x106
	Parameters: 2
	Flags: Linked
*/
function function_de6a7579(str_scenedef, str_mode)
{
	a_shots = get_all_shot_names(str_scenedef);
	if(a_shots.size == 0)
	{
		return "play";
	}
	if(str_mode !== "init")
	{
		if(a_shots[0] !== "init")
		{
			str_shot = a_shots[0];
		}
		else if(a_shots.size > 1)
		{
			str_shot = a_shots[1];
		}
	}
	else if(str_mode === "init")
	{
		if(isinarray(a_shots, "init"))
		{
			str_shot = "init";
		}
		else
		{
			str_shot = a_shots[0];
		}
	}
	if(!isdefined(str_shot))
	{
		str_shot = "play";
	}
	return str_shot;
}

/*
	Name: play
	Namespace: scene
	Checksum: 0x45112D4B
	Offset: 0x4F70
	Size: 0x8B4
	Parameters: 7
	Flags: Linked
*/
function play(arg1, arg2, arg3, b_test_run, str_mode, n_time, var_f7d56e76)
{
	if(!isdefined(b_test_run))
	{
		b_test_run = 0;
	}
	if(!isdefined(str_mode))
	{
		str_mode = "";
	}
	/#
		if(getdvarint(#"debug_scene", 0) > 0)
		{
			if(isdefined(arg1) && (isstring(arg1) || ishash(arg1)))
			{
				printtoprightln("" + function_9e72a96(arg1));
			}
			else
			{
				printtoprightln("");
			}
		}
	#/
	s_tracker = spawnstruct();
	s_tracker.n_scene_count = 0;
	if(self == level)
	{
		a_instances = [];
		if(isstring(arg1) || ishash(arg1))
		{
			if(isstring(arg1) && issubstr(arg1, ","))
			{
				a_toks = strtok(arg1, ",");
				str_value = a_toks[0];
				str_key = a_toks[1];
				if(isstring(arg2))
				{
					str_shot = tolower(arg2);
					a_ents = arg3;
				}
				else
				{
					a_ents = arg2;
				}
			}
			else
			{
				if(isinarray(level.scenedefs, hash(arg1)))
				{
					str_scenedef = arg1;
					var_583db6f0 = 1;
				}
				else
				{
					if(isinarray(level.scene_sequence_names, hash(arg1)))
					{
						str_scenedef = arg1;
						var_db1c5518 = 1;
					}
					else
					{
						str_value = arg1;
						str_key = "targetname";
					}
				}
			}
			if(isstring(arg2))
			{
				if(isinarray(array("targetname", "script_noteworthy"), arg2))
				{
					str_key = arg2;
				}
				else
				{
					str_shot = tolower(arg2);
					var_5b51581a = 1;
				}
				a_ents = arg3;
			}
			else
			{
				a_ents = arg2;
			}
			a_instances = _get_scene_instances(str_value, str_key, str_scenedef);
			if(a_instances.size)
			{
				s_tracker.n_scene_count = a_instances.size;
				foreach(s_instance in a_instances)
				{
					if(isdefined(s_instance))
					{
						if(str_mode !== "init" && s_instance function_c8dd0fee())
						{
							s_instance.var_538fcf13 = 1;
							s_instance function_845e67f0((isdefined(s_instance.script_notify) ? s_instance.script_notify : s_instance.script_wait), (isdefined(s_instance.script_waittill) ? s_instance.script_waittill : s_instance.script_timer), var_f7d56e76);
							return;
						}
						if(!is_true(var_583db6f0) && !is_true(var_db1c5518))
						{
							str_scenedef = s_instance.scriptbundlename;
							if(s_instance function_bf1f4951())
							{
								var_db1c5518 = 1;
							}
						}
						if(!is_true(var_5b51581a) && !is_true(var_db1c5518))
						{
							str_shot = function_de6a7579(str_scenedef, str_mode);
						}
						else if(is_true(var_5b51581a))
						{
							/#
								if(str_mode === "")
								{
									iprintlnbold("");
									println("");
								}
							#/
							if(str_mode === "loop")
							{
								str_mode = "single_loop";
							}
							else if(str_mode !== "init" && !issubstr(str_mode, "play_from_time") && !strstartswith(str_mode, "capture"))
							{
								str_mode = "single";
							}
						}
						var_a810addd = s_instance function_7cda7776(a_ents);
						if(is_true(var_db1c5518))
						{
							s_instance thread function_2fd8d9a3(s_tracker, str_scenedef, a_ents);
							continue;
						}
						s_instance thread _play_instance(s_tracker, str_scenedef, var_a810addd, b_test_run, str_shot, str_mode, n_time, var_5b51581a);
					}
				}
			}
			else
			{
				if(str_mode !== "init" && self function_c8dd0fee())
				{
					self.var_538fcf13 = 1;
					self function_845e67f0((isdefined(self.script_notify) ? self.script_notify : self.script_wait), (isdefined(self.script_waittill) ? self.script_waittill : self.script_timer), var_f7d56e76);
					return;
				}
				_play_on_self(s_tracker, arg1, arg2, arg3, b_test_run, str_mode, n_time);
			}
		}
	}
	else
	{
		if(str_mode !== "init" && self function_c8dd0fee())
		{
			self.var_538fcf13 = 1;
			self function_845e67f0((isdefined(self.script_notify) ? self.script_notify : self.script_wait), (isdefined(self.script_waittill) ? self.script_waittill : self.script_timer), var_f7d56e76);
			return;
		}
		_play_on_self(s_tracker, arg1, arg2, arg3, b_test_run, str_mode, n_time);
	}
	if(s_tracker.n_scene_count > 0)
	{
		s_tracker waittill(#"scenes_done", #"death", #"hash_694043bb3252702");
	}
}

/*
	Name: function_7c6c9843
	Namespace: scene
	Checksum: 0x9A44667F
	Offset: 0x5830
	Size: 0x380
	Parameters: 4
	Flags: Linked
*/
function function_7c6c9843(str_scene, str_shot, a_ents, n_rate)
{
	if(!isdefined(n_rate))
	{
		n_rate = 1;
	}
	if(self == level)
	{
		var_de0ccf29 = (0, 0, 0);
		var_514ca983 = (0, 0, 0);
	}
	else
	{
		var_de0ccf29 = self.origin;
		var_514ca983 = self.angles;
	}
	if(isdefined(str_shot))
	{
		s_bundle = getscriptbundle(str_scene);
		if(!isdefined(a_ents))
		{
			a_ents = [];
		}
		else if(!isarray(a_ents))
		{
			a_ents = array(a_ents);
		}
		var_773f6e2a = 0;
		foreach(obj in s_bundle.objects)
		{
			foreach(s_shot in obj.shots)
			{
				if(s_shot.name === str_shot)
				{
					str_anim = s_shot.entry[0].anim;
					break;
				}
			}
			if(isdefined(str_anim))
			{
				a_ents[index] animscripted(str_anim, var_de0ccf29, var_514ca983, str_anim, "normal", "root", n_rate, 0);
				n_anim_length = getanimlength(str_anim);
				if(n_anim_length > var_773f6e2a)
				{
					var_773f6e2a = n_anim_length;
					var_7758510f = a_ents[index];
					var_89e93728 = str_anim;
				}
			}
		}
		s_bundle = undefined;
		s_waitresult = undefined;
		s_waitresult = var_7758510f waittilltimeout(var_773f6e2a, {#notetrack:"end"}, var_89e93728);
	}
	else
	{
		a_str_shot_names = get_all_shot_names(str_scene, 1);
		foreach(str_shot in a_str_shot_names)
		{
			if(isdefined(self))
			{
				self function_7c6c9843(str_scene, str_shot, a_ents, n_rate);
			}
		}
	}
}

/*
	Name: function_c8dd0fee
	Namespace: scene
	Checksum: 0xB72FC3B1
	Offset: 0x5BB8
	Size: 0xC0
	Parameters: 0
	Flags: Linked
*/
function function_c8dd0fee()
{
	if(!isdefined(self))
	{
		return false;
	}
	if(self function_bf1f4951())
	{
		return false;
	}
	if(self function_9503138e() && isdefined(self.scriptbundlename))
	{
		if(!is_true(self.var_538fcf13) && function_9730988a(self.scriptbundlename, "breach_init") && function_9730988a(self.scriptbundlename, "breach_play"))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_1d2f3816
	Namespace: scene
	Checksum: 0xD32805F3
	Offset: 0x5C80
	Size: 0x4C
	Parameters: 4
	Flags: None
*/
function function_1d2f3816(arg1, arg2, arg3, var_f7d56e76)
{
	self play(arg1, arg2, arg3, undefined, undefined, undefined, var_f7d56e76);
}

/*
	Name: function_845e67f0
	Namespace: scene
	Checksum: 0x666B15
	Offset: 0x5CD8
	Size: 0x276
	Parameters: 3
	Flags: Linked
*/
function function_845e67f0(var_b93683c, var_3667c53d, var_f7d56e76)
{
	if(!isdefined(var_b93683c))
	{
		var_b93683c = 0;
	}
	if(!isdefined(var_3667c53d))
	{
		var_3667c53d = 4;
	}
	if(!isdefined(var_f7d56e76))
	{
		var_f7d56e76 = array();
	}
	self thread play("breach_init");
	if(isstring(var_b93683c) || ishash(var_b93683c))
	{
		level waittill(var_b93683c);
	}
	else
	{
		wait(var_b93683c);
	}
	a_ai = [];
	foreach(ent in self.scene_ents)
	{
		if(isai(ent) && !ent util::is_on_side(#"allies"))
		{
			array::add(a_ai, ent, 0);
		}
	}
	a_ai = arraycombine(a_ai, var_f7d56e76, 0, 0);
	self thread function_9bf1aeb9(a_ai);
	self thread breach_slow_time(var_3667c53d);
	self play("breach_play");
	self waittill(#"breach_done");
	if(function_9730988a(self.scriptbundlename, "breach_end"))
	{
		self play("breach_end");
	}
	if(is_true(self.script_play_multiple))
	{
		self.var_538fcf13 = undefined;
	}
}

/*
	Name: breach_slow_time
	Namespace: scene
	Checksum: 0xA83FB57F
	Offset: 0x5F58
	Size: 0x21E
	Parameters: 1
	Flags: Linked
*/
function breach_slow_time(var_3667c53d)
{
	setslowmotion(1, 0.3, 0.3);
	foreach(e_player in getplayers())
	{
		e_player setmovespeedscale(0.3);
	}
	wait(0.3);
	if(isstring(var_3667c53d) || ishash(var_3667c53d))
	{
		util::waittill_any_ents(self, "breach_cleared", level, var_3667c53d);
	}
	else
	{
		var_a1288aec = var_3667c53d * 0.3;
		self waittilltimeout(var_a1288aec, #"breach_cleared");
	}
	setslowmotion(0.3, 1, 0.3);
	foreach(e_player in getplayers())
	{
		e_player setmovespeedscale(1);
	}
	self notify(#"breach_done");
}

/*
	Name: function_9bf1aeb9
	Namespace: scene
	Checksum: 0x6FA5D0E2
	Offset: 0x6180
	Size: 0x76
	Parameters: 1
	Flags: Linked
*/
function function_9bf1aeb9(a_ai)
{
	self endon(#"breach_done");
	function_1eaaceab(a_ai);
	if(a_ai.size > 0)
	{
		ai::waittill_dead(a_ai);
	}
	else
	{
		wait(0.5);
	}
	self notify(#"breach_cleared");
}

/*
	Name: function_1e327c20
	Namespace: scene
	Checksum: 0xC7AC030
	Offset: 0x6200
	Size: 0x4C8
	Parameters: 4
	Flags: Linked
*/
function function_1e327c20(a_str_scenes, var_b6213032, var_d8b95786, var_964a6420)
{
	if(!isdefined(var_b6213032))
	{
		var_b6213032 = 0;
	}
	if(!isdefined(var_d8b95786))
	{
		var_d8b95786 = 0;
	}
	if(!isdefined(var_964a6420))
	{
		var_964a6420 = 0;
	}
	a_flags = [];
	if(!isdefined(a_str_scenes))
	{
		a_str_scenes = [];
	}
	else if(!isarray(a_str_scenes))
	{
		a_str_scenes = array(a_str_scenes);
	}
	if(var_b6213032)
	{
		foreach(str_scene in a_str_scenes)
		{
			s_scenedef = getscriptbundle(str_scene);
			str_team = util::get_team_mapping(s_scenedef.team);
			function_d8a83a50(str_scene, &function_cae579da, "done", str_team);
			s_scenedef = undefined;
		}
		if(var_d8b95786)
		{
			level.var_7ddd2b02 = 0;
		}
	}
	foreach(str_scene in a_str_scenes)
	{
		s_scenedef = getscriptbundle(str_scene);
		str_team = util::get_team_mapping(s_scenedef.team);
		if(getplayers(str_team).size || var_964a6420)
		{
			self thread play(str_scene);
			if(!isdefined(a_flags))
			{
				a_flags = [];
			}
			else if(!isarray(a_flags))
			{
				a_flags = array(a_flags);
			}
			if(!isinarray(a_flags, str_scene + "_scene_done"))
			{
				a_flags[a_flags.size] = str_scene + "_scene_done";
			}
		}
		s_scenedef = undefined;
	}
	level flag::wait_till_all(a_flags);
	waittillframeend();
	if(var_b6213032)
	{
		util::wait_network_frame();
		foreach(str_scene in a_str_scenes)
		{
			remove_scene_func(str_scene, &function_cae579da, "done");
		}
		a_players = getplayers();
		foreach(player in a_players)
		{
			player val::reset(#"hash_65d8adb275cb2ece", "freezecontrols");
			if(!var_d8b95786)
			{
				player util::delay(0.1, "disconnect", &lui::screen_fade_in, 1, undefined, "scene_system");
			}
		}
	}
}

/*
	Name: function_cae579da
	Namespace: scene
	Checksum: 0x8E3F8F40
	Offset: 0x66D0
	Size: 0xE8
	Parameters: 1
	Flags: Linked
*/
function function_cae579da(str_team)
{
	a_players = getplayers(str_team);
	foreach(player in a_players)
	{
		player val::set(#"hash_65d8adb275cb2ece", "freezecontrols", 1);
		player thread lui::screen_fade_out(0, undefined, "scene_system");
	}
}

/*
	Name: _play_on_self
	Namespace: scene
	Checksum: 0xAA056F1F
	Offset: 0x67C0
	Size: 0x3AC
	Parameters: 7
	Flags: Linked, Private
*/
function private _play_on_self(s_tracker, arg1, arg2, arg3, b_test_run, str_mode, n_time)
{
	if(!isdefined(b_test_run))
	{
		b_test_run = 0;
	}
	if(!isdefined(str_mode))
	{
		str_mode = "";
	}
	if(isstring(arg1) || ishash(arg1))
	{
		if(isinarray(level.scenedefs, hash(arg1)) || isinarray(level.scene_sequence_names, hash(arg1)))
		{
			str_scenedef = arg1;
			if(isstring(arg2))
			{
				str_shot = tolower(arg2);
				a_ents = arg3;
			}
			else
			{
				a_ents = arg2;
			}
		}
		else
		{
			str_shot = tolower(arg1);
			a_ents = arg2;
		}
	}
	else
	{
		if(isarray(arg1) || isentity(arg1))
		{
			str_scenedef = self.scriptbundlename;
			a_ents = arg1;
		}
		else
		{
			str_scenedef = self.scriptbundlename;
		}
	}
	if(isdefined(str_scenedef) && isinarray(level.scene_sequence_names, hash(str_scenedef)))
	{
		var_db1c5518 = 1;
	}
	s_tracker.n_scene_count = 1;
	if(!isdefined(str_shot) && isdefined(str_scenedef) && !is_true(var_db1c5518))
	{
		str_shot = function_de6a7579(str_scenedef, str_mode);
	}
	else if(isdefined(str_shot) && !is_true(var_db1c5518))
	{
		/#
			if(str_mode === "")
			{
				iprintlnbold("");
				println("");
			}
		#/
		if(str_mode !== "init" && !issubstr(str_mode, "play_from_time"))
		{
			str_mode = "single";
		}
		var_5b51581a = 1;
	}
	var_a810addd = self function_7cda7776(a_ents);
	if(is_true(var_db1c5518))
	{
		self thread function_2fd8d9a3(s_tracker, str_scenedef, var_a810addd);
	}
	else
	{
		self thread _play_instance(s_tracker, str_scenedef, var_a810addd, b_test_run, str_shot, str_mode, n_time, var_5b51581a);
	}
}

/*
	Name: _play_instance
	Namespace: scene
	Checksum: 0x61F3D7F4
	Offset: 0x6B78
	Size: 0x6DE
	Parameters: 8
	Flags: Linked, Private
*/
function private _play_instance(s_tracker, str_scenedef, a_ents, b_test_run, str_shot, str_mode, n_time, var_5b51581a)
{
	if(!isdefined(b_test_run))
	{
		b_test_run = 0;
	}
	if(!isdefined(str_shot))
	{
		str_shot = "play";
	}
	if(!isdefined(str_scenedef))
	{
		str_scenedef = self.scriptbundlename;
	}
	if(isdefined(n_time) && issubstr(str_mode, "play_from_time"))
	{
		var_8b21886e = function_d1abba8b(str_scenedef, str_shot, str_mode, n_time, var_5b51581a);
		str_shot = var_8b21886e.var_ef711d04;
		var_dd2b75b = var_8b21886e.var_3486c904;
		str_mode = str_mode + (":" + var_dd2b75b);
	}
	if(str_mode === "init")
	{
		str_shot = function_de6a7579(str_scenedef, str_mode);
	}
	/#
		if(array().size && !isinarray(array(), str_scenedef))
		{
			return;
		}
	#/
	if(level flag::get(str_scenedef + "_scene_done"))
	{
		level flag::clear(str_scenedef + "_scene_done");
		var_d43c0257 = getscriptbundle(str_scenedef);
	}
	b_play = 1;
	if(str_mode !== "init" && !is_true(self.var_135bd649))
	{
		util::function_35840de8(self.script_delay);
	}
	if(self.scriptbundlename === str_scenedef)
	{
		if(!is_true(self.script_play_multiple))
		{
			if(!isdefined(self.scene_played))
			{
				self.scene_played = [];
			}
			if(is_true(self.scene_played[str_shot]) && !b_test_run)
			{
				waittillframeend();
				while(is_playing(str_scenedef, str_shot))
				{
					waitframe(1);
				}
				b_play = 0;
				/#
					println(("" + str_scenedef) + "");
				#/
			}
		}
		if(str_mode == "init")
		{
			self.scene_played[str_shot] = 0;
		}
		else
		{
			self.scene_played[str_shot] = 1;
		}
	}
	if(b_play)
	{
		if(isdefined(self.script_teleport_location))
		{
			self teleport::function_ff8a7a3();
		}
		o_scene = _init_instance(str_scenedef, a_ents, b_test_run);
		/#
			function_8ee42bf(o_scene);
		#/
		if(isdefined(o_scene))
		{
			thread [[ o_scene ]]->play(str_shot, a_ents, b_test_run, str_mode);
			if(isdefined(o_scene._a_objects) && o_scene._a_objects.size)
			{
				o_scene waittill(str_shot, #"hash_27297a73bc597607", #"scene_stop");
			}
		}
		if(isdefined(self))
		{
			if(isdefined(self.scriptbundlename) && is_true(getscriptbundle(self.scriptbundlename).looping))
			{
				self.scene_played[str_shot] = 0;
			}
		}
	}
	var_f62e21cb = function_c9770402(str_scenedef);
	if(isdefined(var_f62e21cb) && str_shot != "init" && !function_6a0b0afe(str_mode) && str_mode != "init")
	{
		var_41c1a1b7 = getscriptbundle(str_scenedef);
		var_8701de52 = getscriptbundle(var_f62e21cb);
		if(isdefined(var_8701de52) && var_8701de52.type === "scene" && var_8701de52 !== var_41c1a1b7)
		{
			var_8c2eecb3 = var_41c1a1b7.name;
			level waittill(var_41c1a1b7.str_final_bundle + "_done");
			if(str_shot == "play")
			{
				level flag::set(var_8c2eecb3 + "_scene_done");
			}
		}
		else if(!function_b260bdcc(str_scenedef, str_shot))
		{
			if(isdefined(o_scene) && !is_true(o_scene.scene_stopping))
			{
				o_scene waittill(#"scene_done", #"scene_stop", #"scene_skip_completed");
			}
		}
	}
	s_tracker.n_scene_count--;
	if(s_tracker.n_scene_count == 0)
	{
		if(str_mode !== "init")
		{
			level flag::set(str_scenedef + "_scene_done");
			if(isdefined(self.script_flag_set))
			{
				level flag::set(self.script_flag_set);
			}
		}
		/#
			function_8ee42bf(o_scene);
		#/
		s_tracker notify(#"scenes_done");
		if(isdefined(self))
		{
			self notify(#"scenes_done");
		}
	}
}

/*
	Name: delete_scene_spawned_ents
	Namespace: scene
	Checksum: 0xEF004813
	Offset: 0x7260
	Size: 0x23C
	Parameters: 1
	Flags: None
*/
function delete_scene_spawned_ents(arg1)
{
	if(self == level)
	{
		a_instances = [];
		if(isstring(arg1) || ishash(arg1))
		{
			if(isstring(arg1) && issubstr(arg1, ","))
			{
				a_toks = strtok(arg1, ",");
				str_value = a_toks[0];
				str_key = a_toks[1];
			}
			else
			{
				if(isinarray(level.scenedefs, hash(arg1)))
				{
					str_scenedef = arg1;
				}
				else
				{
					str_value = arg1;
					str_key = "targetname";
				}
			}
			a_instances = _get_scene_instances(str_value, str_key, str_scenedef, 1);
			if(a_instances.size)
			{
				foreach(instance in a_instances)
				{
					instance _delete_scene_spawned_ents(str_scenedef);
				}
			}
		}
	}
	else
	{
		if(isstring(arg1) || ishash(arg1))
		{
			str_scenedef = arg1;
		}
		self _delete_scene_spawned_ents(str_scenedef);
	}
}

/*
	Name: _delete_scene_spawned_ents
	Namespace: scene
	Checksum: 0xE8F3DD51
	Offset: 0x74A8
	Size: 0xDC
	Parameters: 1
	Flags: Linked
*/
function _delete_scene_spawned_ents(str_scene)
{
	if(isdefined(self.scene_ents))
	{
		foreach(ent in self.scene_ents)
		{
			if(isdefined(ent) && isdefined(ent.scene_spawned))
			{
				ent delete();
			}
		}
		/#
			if(isdefined(str_scene))
			{
				update_debug_state(str_scene, "");
			}
		#/
	}
}

/*
	Name: update_debug_state
	Namespace: scene
	Checksum: 0x8CE0D29B
	Offset: 0x7590
	Size: 0x88
	Parameters: 2
	Flags: None
*/
function update_debug_state(str_scene, str_state)
{
	if(!strendswith(self.last_scene_state_instance[str_scene], str_state))
	{
		level.last_scene_state[str_scene] = level.last_scene_state[str_scene] + ("," + str_state);
		self.last_scene_state_instance[str_scene] = self.last_scene_state_instance[str_scene] + ("," + str_state);
	}
}

/*
	Name: _get_scene_instances
	Namespace: scene
	Checksum: 0xF392CD7C
	Offset: 0x7620
	Size: 0x1AA
	Parameters: 4
	Flags: Linked
*/
function _get_scene_instances(str_value, str_key, str_scenedef, b_include_inactive)
{
	if(!isdefined(str_key))
	{
		str_key = "targetname";
	}
	if(!isdefined(b_include_inactive))
	{
		b_include_inactive = 0;
	}
	a_instances = [];
	if(isdefined(str_value))
	{
		a_instances = struct::get_array(str_value, str_key);
		/#
			/#
				assert(a_instances.size, (("" + str_key) + "") + function_9e72a96(str_value) + "");
			#/
		#/
	}
	if(isdefined(str_scenedef))
	{
		a_instances_by_scenedef = struct::get_array(str_scenedef, "scriptbundlename");
		a_instances = arraycombine(a_instances_by_scenedef, a_instances, 0, 0);
		a_active_instances = get_active_scenes(str_scenedef);
		a_instances = arraycombine(a_active_instances, a_instances, 0, 0);
		if(b_include_inactive)
		{
			a_inactive_instances = get_inactive_scenes(str_scenedef);
			a_instances = arraycombine(a_inactive_instances, a_instances, 0, 0);
		}
	}
	return a_instances;
}

/*
	Name: skipto_end
	Namespace: scene
	Checksum: 0x15D97A5F
	Offset: 0x77D8
	Size: 0x74
	Parameters: 5
	Flags: None
*/
function skipto_end(arg1, arg2, arg3, n_time, b_include_players)
{
	if(!isdefined(b_include_players))
	{
		b_include_players = 1;
	}
	n_time = (isdefined(n_time) ? n_time : 1);
	play_from_time(arg1, arg2, arg3, n_time, 1, undefined, b_include_players);
}

/*
	Name: play_from_time
	Namespace: scene
	Checksum: 0x8701E1E2
	Offset: 0x7858
	Size: 0x14C
	Parameters: 8
	Flags: Linked
*/
function play_from_time(arg1, arg2, arg3, n_time, var_c9d6bbb, var_20dda4d1, b_include_players, var_2250555)
{
	if(!isdefined(var_c9d6bbb))
	{
		var_c9d6bbb = 1;
	}
	if(!isdefined(var_20dda4d1))
	{
		var_20dda4d1 = 0;
	}
	if(!isdefined(b_include_players))
	{
		b_include_players = 1;
	}
	if(!isdefined(var_2250555))
	{
		var_2250555 = 1;
	}
	if(var_c9d6bbb)
	{
		str_mode = "play_from_time_normalized";
	}
	else
	{
		str_mode = "play_from_time_elapsed";
	}
	if(function_d3e3e0c7(arg1) || function_d3e3e0c7(arg2) && var_20dda4d1)
	{
		str_mode = str_mode + "_single";
	}
	if(!b_include_players)
	{
		str_mode = str_mode + "_noplayers";
	}
	if(!var_2250555)
	{
		str_mode = str_mode + "_noai";
	}
	play(arg1, arg2, arg3, 0, str_mode, n_time);
}

/*
	Name: function_d3e3e0c7
	Namespace: scene
	Checksum: 0x76E47D85
	Offset: 0x79B0
	Size: 0x9A
	Parameters: 1
	Flags: Linked
*/
function function_d3e3e0c7(arg)
{
	if(isstring(arg) && !isinarray(level.scenedefs, hash(arg)) && !isinarray(array("targetname", "script_noteworthy"), arg))
	{
		return true;
	}
	return false;
}

/*
	Name: function_d1abba8b
	Namespace: scene
	Checksum: 0x174C57C4
	Offset: 0x7A58
	Size: 0x19A
	Parameters: 5
	Flags: Linked
*/
function function_d1abba8b(str_scenedef, str_shot, str_mode, n_time, var_5b51581a)
{
	if(!isdefined(var_5b51581a))
	{
		var_5b51581a = 0;
	}
	var_8b21886e = spawnstruct();
	if(issubstr(str_mode, "play_from_time_normalized"))
	{
		if(var_5b51581a)
		{
			var_8b21886e.var_ef711d04 = str_shot;
			var_8b21886e.var_3486c904 = float(n_time);
			return var_8b21886e;
		}
		var_f3f679dd = float(n_time) * function_12479eba(str_scenedef);
	}
	else if(issubstr(str_mode, "play_from_time_elapsed"))
	{
		if(var_5b51581a)
		{
			var_c74251a4 = function_8582657c(str_scenedef, str_shot);
			var_8b21886e.var_ef711d04 = str_shot;
			var_8b21886e.var_3486c904 = float(n_time) / var_c74251a4;
			return var_8b21886e;
		}
		var_f3f679dd = float(n_time);
	}
	var_8b21886e = function_dde5f483(str_scenedef, var_f3f679dd);
	return var_8b21886e;
}

/*
	Name: function_1eab8670
	Namespace: scene
	Checksum: 0xE41EF401
	Offset: 0x7C00
	Size: 0x222
	Parameters: 2
	Flags: Linked
*/
function function_1eab8670(obj, str_shot)
{
	var_5a162d58 = 0;
	n_anim_length = 0;
	if(isdefined(obj.shots))
	{
		foreach(s_shot in obj.shots)
		{
			if(is_true(s_shot.var_51093f2d))
			{
				continue;
			}
			if(s_shot.name === tolower(str_shot) && isdefined(s_shot.entry))
			{
				foreach(s_entry in s_shot.entry)
				{
					if(isdefined(s_entry.cameraswitcher))
					{
						var_5a162d58 = var_5a162d58 + (float(getcamanimtime(s_entry.cameraswitcher)) / 1000);
						continue;
					}
					if(isdefined(s_entry.anim))
					{
						n_anim_length = n_anim_length + getanimlength(s_entry.anim);
					}
				}
				break;
			}
		}
	}
	n_length = max(var_5a162d58, n_anim_length);
	return n_length;
}

/*
	Name: function_dde5f483
	Namespace: scene
	Checksum: 0x2DFE1D8F
	Offset: 0x7E30
	Size: 0x23A
	Parameters: 2
	Flags: Linked
*/
function function_dde5f483(str_scenedef, n_elapsed_time)
{
	s_scenedef = get_scenedef(str_scenedef);
	a_shots = get_all_shot_names(str_scenedef, 1);
	var_7a2504a = 0;
	var_8b21886e = spawnstruct();
	foreach(str_shot in a_shots)
	{
		var_958bccd3 = 0;
		foreach(obj in s_scenedef.objects)
		{
			var_657b76cc = function_1eab8670(obj, str_shot);
			if(var_657b76cc > var_958bccd3)
			{
				var_958bccd3 = var_657b76cc;
			}
		}
		var_219aac3f = var_7a2504a;
		var_68790830 = var_219aac3f + var_958bccd3;
		if(n_elapsed_time >= var_219aac3f && n_elapsed_time < var_68790830)
		{
			var_8b21886e.var_ef711d04 = str_shot;
			var_8b21886e.var_3486c904 = (n_elapsed_time - var_219aac3f) / var_958bccd3;
			return var_8b21886e;
		}
		var_7a2504a = var_7a2504a + var_958bccd3;
	}
	var_8b21886e.var_ef711d04 = a_shots[a_shots.size - 1];
	var_8b21886e.var_3486c904 = 0.99;
	return var_8b21886e;
}

/*
	Name: function_8582657c
	Namespace: scene
	Checksum: 0x39CE9585
	Offset: 0x8078
	Size: 0x126
	Parameters: 2
	Flags: Linked
*/
function function_8582657c(var_b9a72490, str_shot)
{
	if(isstring(var_b9a72490) || ishash(var_b9a72490))
	{
		s_scenedef = get_scenedef(var_b9a72490);
	}
	else
	{
		s_scenedef = var_b9a72490;
	}
	var_a0c66830 = 0;
	foreach(obj in s_scenedef.objects)
	{
		var_657b76cc = function_1eab8670(obj, str_shot);
		if(var_657b76cc > var_a0c66830)
		{
			var_a0c66830 = var_657b76cc;
		}
	}
	return var_a0c66830;
}

/*
	Name: function_12479eba
	Namespace: scene
	Checksum: 0xC4681873
	Offset: 0x81A8
	Size: 0xF8
	Parameters: 1
	Flags: Linked
*/
function function_12479eba(str_scenedef)
{
	s_scenedef = get_scenedef(str_scenedef);
	a_shots = get_all_shot_names(str_scenedef, 1);
	var_9d90ef8b = 0;
	foreach(str_shot in a_shots)
	{
		var_9d90ef8b = var_9d90ef8b + function_8582657c(s_scenedef, str_shot);
	}
	return var_9d90ef8b;
}

/*
	Name: skipto_end_noai
	Namespace: scene
	Checksum: 0x209110C5
	Offset: 0x82A8
	Size: 0x5C
	Parameters: 4
	Flags: None
*/
function skipto_end_noai(arg1, arg2, arg3, n_time)
{
	n_time = (isdefined(n_time) ? n_time : 1);
	play_from_time(arg1, arg2, arg3, n_time, 1, 0, 0);
}

/*
	Name: stop
	Namespace: scene
	Checksum: 0xC2DF821B
	Offset: 0x8310
	Size: 0x27C
	Parameters: 3
	Flags: Linked
*/
function stop(arg1, arg2, arg3)
{
	if(self == level)
	{
		if(isstring(arg1) || ishash(arg1))
		{
			if(isstring(arg2))
			{
				str_value = arg1;
				str_key = arg2;
				b_clear = arg3;
			}
			else
			{
				str_value = arg1;
				b_clear = arg2;
			}
			if(isdefined(str_key))
			{
				a_instances = struct::get_array(str_value, str_key);
				/#
					/#
						assert(a_instances.size, ((("" + str_key) + "") + str_value) + "");
					#/
				#/
				str_value = undefined;
			}
			else
			{
				a_instances = struct::get_array(str_value, "targetname");
				if(!a_instances.size)
				{
					a_instances = get_active_scenes(str_value);
				}
				else
				{
					str_value = undefined;
				}
			}
			foreach(s_instance in arraycopy(a_instances))
			{
				if(isdefined(s_instance))
				{
					s_instance _stop_instance(b_clear, str_value);
				}
			}
		}
	}
	else
	{
		if(isstring(arg1) || ishash(arg1))
		{
			_stop_instance(arg2, arg1);
		}
		else
		{
			_stop_instance(arg1);
		}
	}
}

/*
	Name: _stop_instance
	Namespace: scene
	Checksum: 0xEC531533
	Offset: 0x8598
	Size: 0xF0
	Parameters: 2
	Flags: Linked
*/
function _stop_instance(b_clear, str_scenedef)
{
	if(!isdefined(b_clear))
	{
		b_clear = 0;
	}
	if(isdefined(self.scenes))
	{
		foreach(o_scene in arraycopy(self.scenes))
		{
			str_scene_name = o_scene._str_name;
			if(!isdefined(str_scenedef) || str_scene_name == str_scenedef)
			{
				thread [[ o_scene ]]->stop(b_clear);
			}
		}
	}
}

/*
	Name: has_init_state
	Namespace: scene
	Checksum: 0x1EE5DC41
	Offset: 0x8690
	Size: 0x3A
	Parameters: 1
	Flags: Linked
*/
function has_init_state(str_scenedef)
{
	return isinarray(get_all_shot_names(str_scenedef), "init");
}

/*
	Name: function_9730988a
	Namespace: scene
	Checksum: 0x98AD8CE8
	Offset: 0x86D8
	Size: 0x3A
	Parameters: 2
	Flags: Linked
*/
function function_9730988a(str_scenedef, str_shotname)
{
	return isinarray(get_all_shot_names(str_scenedef), str_shotname);
}

/*
	Name: get_prop_count
	Namespace: scene
	Checksum: 0xD18997E
	Offset: 0x8720
	Size: 0x22
	Parameters: 1
	Flags: None
*/
function get_prop_count(str_scenedef)
{
	return _get_type_count("prop", str_scenedef);
}

/*
	Name: get_vehicle_count
	Namespace: scene
	Checksum: 0x367B4B75
	Offset: 0x8750
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function get_vehicle_count(str_scenedef)
{
	return _get_type_count("vehicle", str_scenedef);
}

/*
	Name: get_actor_count
	Namespace: scene
	Checksum: 0x96EED0CF
	Offset: 0x8780
	Size: 0x22
	Parameters: 1
	Flags: None
*/
function get_actor_count(str_scenedef)
{
	return _get_type_count("actor", str_scenedef);
}

/*
	Name: function_7aa3d2c6
	Namespace: scene
	Checksum: 0x130C601B
	Offset: 0x87B0
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function function_7aa3d2c6(str_scenedef)
{
	return _get_type_count("sharedplayer", str_scenedef);
}

/*
	Name: get_player_count
	Namespace: scene
	Checksum: 0xECFF5715
	Offset: 0x87E0
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function get_player_count(str_scenedef)
{
	return _get_type_count("player", str_scenedef);
}

/*
	Name: function_afb927e7
	Namespace: scene
	Checksum: 0x7A4278D5
	Offset: 0x8810
	Size: 0x22
	Parameters: 1
	Flags: None
*/
function function_afb927e7(str_scenedef)
{
	return _get_type_count(undefined, str_scenedef);
}

/*
	Name: _get_type_count
	Namespace: scene
	Checksum: 0x64562DCE
	Offset: 0x8840
	Size: 0x12C
	Parameters: 2
	Flags: Linked
*/
function _get_type_count(str_type, str_scenedef)
{
	s_scenedef = (isdefined(str_scenedef) ? getscriptbundle(str_scenedef) : getscriptbundle(self.scriptbundlename));
	if(!isdefined(str_type))
	{
		return s_scenedef.objects.size;
	}
	n_count = 0;
	foreach(s_obj in s_scenedef.objects)
	{
		if(isdefined(s_obj.type))
		{
			if(tolower(s_obj.type) == tolower(str_type))
			{
				n_count++;
			}
		}
	}
	return n_count;
}

/*
	Name: function_128f0294
	Namespace: scene
	Checksum: 0xEB408864
	Offset: 0x8978
	Size: 0x126
	Parameters: 1
	Flags: None
*/
function function_128f0294(var_37fa9b04)
{
	if(!isdefined(self._scene_object) || !isdefined(self.var_5b7900ec))
	{
		return true;
	}
	foreach(s_shot in self._scene_object._s.shots)
	{
		if(is_true(self.var_5b7900ec[s_shot.name]))
		{
			continue;
		}
		if(self._scene_object csceneobject::function_f12c5e67(s_shot) && !self._scene_object csceneobject::function_128f0294(s_shot, var_37fa9b04))
		{
			return false;
		}
	}
	return true;
}

/*
	Name: is_active
	Namespace: scene
	Checksum: 0x32B12D23
	Offset: 0x8AA8
	Size: 0x4C
	Parameters: 1
	Flags: None
*/
function is_active(str_scenedef)
{
	if(self == level)
	{
		return get_active_scenes(str_scenedef).size > 0;
	}
	return isdefined(get_active_scene(str_scenedef));
}

/*
	Name: is_playing
	Namespace: scene
	Checksum: 0xE6D477F0
	Offset: 0x8B00
	Size: 0x8A
	Parameters: 2
	Flags: Linked
*/
function is_playing(str_scenedef, str_shot)
{
	if(!isdefined(str_shot))
	{
		str_shot = "play";
	}
	if(!isdefined(str_scenedef))
	{
		str_scenedef = self.scriptbundlename;
	}
	o_scene = get_active_scene(str_scenedef);
	if(isdefined(o_scene._str_shot))
	{
		return o_scene._str_shot === str_shot;
	}
	if(isdefined(o_scene))
	{
		return 1;
	}
	return 0;
}

/*
	Name: is_ready
	Namespace: scene
	Checksum: 0xDBEDE9D1
	Offset: 0x8B98
	Size: 0x96
	Parameters: 1
	Flags: None
*/
function is_ready(str_scenedef)
{
	if(self == level)
	{
		return level flag::get(str_scenedef + "_ready");
	}
	if(!isdefined(str_scenedef))
	{
		str_scenedef = self.scriptbundlename;
	}
	o_scene = get_active_scene(str_scenedef);
	if(isdefined(o_scene))
	{
		return o_scene flag::get(#"ready");
	}
	return 0;
}

/*
	Name: get_active_scenes
	Namespace: scene
	Checksum: 0xA0B9D62A
	Offset: 0x8C38
	Size: 0xEE
	Parameters: 1
	Flags: Linked
*/
function get_active_scenes(str_scenedef)
{
	if(isdefined(str_scenedef))
	{
		return (isdefined(level.active_scenes[str_scenedef]) ? level.active_scenes[str_scenedef] : []);
	}
	a_scenes = [];
	foreach(str_scenedef, _ in level.active_scenes)
	{
		a_scenes = arraycombine(a_scenes, level.active_scenes[str_scenedef], 0, 0);
	}
	return a_scenes;
}

/*
	Name: get_inactive_scenes
	Namespace: scene
	Checksum: 0x2CC5E8A9
	Offset: 0x8D30
	Size: 0x106
	Parameters: 1
	Flags: Linked
*/
function get_inactive_scenes(str_scenedef)
{
	if(!isdefined(level.inactive_scenes))
	{
		level.inactive_scenes = [];
	}
	if(isdefined(str_scenedef))
	{
		return (isdefined(level.inactive_scenes[str_scenedef]) ? level.inactive_scenes[str_scenedef] : []);
	}
	a_scenes = [];
	foreach(str_scenedef, _ in level.inactive_scenes)
	{
		a_scenes = arraycombine(a_scenes, level.inactive_scenes[str_scenedef], 0, 0);
	}
	return a_scenes;
}

/*
	Name: get_active_scene
	Namespace: scene
	Checksum: 0x50552EC0
	Offset: 0x8E40
	Size: 0xAA
	Parameters: 1
	Flags: Linked
*/
function get_active_scene(str_scenedef)
{
	if(isdefined(str_scenedef) && isdefined(self.scenes))
	{
		foreach(o_scene in self.scenes)
		{
			if(o_scene._str_name == str_scenedef)
			{
				return o_scene;
			}
		}
	}
}

/*
	Name: delete_scene_data
	Namespace: scene
	Checksum: 0xAD70EBC5
	Offset: 0x8EF8
	Size: 0xC
	Parameters: 1
	Flags: None
*/
function delete_scene_data(str_scenename)
{
}

/*
	Name: is_igc
	Namespace: scene
	Checksum: 0x6906C3C4
	Offset: 0x8F10
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function is_igc()
{
	return is_true(self.igc) || isstring(self.cameraswitcher) || ishash(self.cameraswitcher);
}

/*
	Name: scene_disable_player_stuff
	Namespace: scene
	Checksum: 0x5FCA68F4
	Offset: 0x8F70
	Size: 0x206
	Parameters: 2
	Flags: Linked
*/
function scene_disable_player_stuff(s_scenedef, s_objectdef)
{
	self endon(#"disconnect");
	/#
		if(getdvarint(#"debug_scene", 0) > 0)
		{
			printtoprightln("");
		}
	#/
	if(!isplayer(self))
	{
		return;
	}
	self notify(#"scene_disable_player_stuff");
	self notify(#"kill_hint_text");
	self val::set(#"scene_system", "disable_offhand_weapons", 1);
	self val::set(#"scene_system", "disable_offhand_special", 1);
	self val::set(#"scene_system", "disable_oob", 1);
	self val::set(#"scene_system", "freezecontrols", 1);
	self val::set(#"scene_system", "allow_jump", 0);
	if(isdefined(s_objectdef))
	{
		if(!is_true(s_objectdef.showhud))
		{
			self val::set(#"scene_system", "show_hud", 0);
			util::wait_network_frame();
			self notify(#"hash_5af33713e88a6df7");
		}
	}
}

/*
	Name: scene_enable_player_stuff
	Namespace: scene
	Checksum: 0x3B843D6D
	Offset: 0x9180
	Size: 0x1DC
	Parameters: 3
	Flags: Linked
*/
function scene_enable_player_stuff(s_scenedef, s_objectdef, e_scene_root)
{
	/#
		if(getdvarint(#"debug_scene", 0) > 0)
		{
			printtoprightln("");
		}
	#/
	if(!isplayer(self))
	{
		return;
	}
	self endon(#"scene_disable_player_stuff", #"disconnect");
	waitframe(0);
	if(isdefined(s_scenedef))
	{
		self function_777f32c4(e_scene_root, s_scenedef);
	}
	waitframe(10);
	self val::reset(#"scene_system", "disable_offhand_weapons");
	self val::reset(#"scene_system", "disable_offhand_special");
	self val::reset(#"scene_system", "disable_oob");
	self val::reset(#"scene_system", "freezecontrols");
	self val::reset(#"scene_system", "allow_jump");
	if(isdefined(s_objectdef))
	{
		if(!is_true(s_objectdef.showhud))
		{
			self val::reset(#"scene_system", "show_hud");
		}
	}
}

/*
	Name: function_777f32c4
	Namespace: scene
	Checksum: 0x82A97B80
	Offset: 0x9368
	Size: 0x5C
	Parameters: 2
	Flags: Linked
*/
function function_777f32c4(e_scene_root, s_scenedef)
{
	self endon(#"disconnect");
	if(isdefined(s_scenedef) && isdefined(s_scenedef.script_teleport_location))
	{
		s_scenedef teleport::player(self);
	}
}

/*
	Name: function_37592f67
	Namespace: scene
	Checksum: 0xE6D2F3C8
	Offset: 0x93D0
	Size: 0x54
	Parameters: 2
	Flags: Linked
*/
function function_37592f67(e_scene_root, s_scenedef)
{
	waitframe(0);
	if(isdefined(s_scenedef))
	{
		if(isdefined(e_scene_root) && isdefined(e_scene_root.script_teleport_location))
		{
			e_scene_root teleport::hero(self);
		}
	}
}

/*
	Name: updateigcviewtime
	Namespace: scene
	Checksum: 0x5DE6DEE7
	Offset: 0x9430
	Size: 0x14A
	Parameters: 1
	Flags: Linked
*/
function updateigcviewtime(b_in_igc)
{
	if(b_in_igc && !isdefined(level.igcstarttime))
	{
		level.igcstarttime = gettime();
	}
	else if(!b_in_igc && isdefined(level.igcstarttime))
	{
		igcviewtimesec = gettime() - level.igcstarttime;
		level.igcstarttime = undefined;
		foreach(player in getplayers())
		{
			if(!isdefined(player.totaligcviewtime))
			{
				player.totaligcviewtime = 0;
			}
			player.totaligcviewtime = player.totaligcviewtime + (int(float(igcviewtimesec) / 1000));
		}
	}
}

/*
	Name: set_igc_active
	Namespace: scene
	Checksum: 0xBE5FD7F4
	Offset: 0x9588
	Size: 0xE8
	Parameters: 1
	Flags: Linked
*/
function set_igc_active(b_in_igc)
{
	n_ent_num = self getentitynumber();
	n_players_in_igc_field = level clientfield::get("in_igc");
	if(b_in_igc)
	{
		n_players_in_igc_field = n_players_in_igc_field | (1 << n_ent_num);
	}
	else
	{
		n_players_in_igc_field = n_players_in_igc_field & (~(1 << n_ent_num));
	}
	updateigcviewtime(b_in_igc);
	level clientfield::set("in_igc", n_players_in_igc_field);
	self flag::set_val("in_igc", b_in_igc);
	/#
	#/
}

/*
	Name: is_igc_active
	Namespace: scene
	Checksum: 0x409BABC8
	Offset: 0x9678
	Size: 0x5E
	Parameters: 0
	Flags: Linked
*/
function is_igc_active()
{
	n_players_in_igc = level clientfield::get("in_igc");
	n_entnum = self getentitynumber();
	return n_players_in_igc & (1 << n_entnum);
}

/*
	Name: function_871087b6
	Namespace: scene
	Checksum: 0x2AA83B06
	Offset: 0x96E0
	Size: 0x1A
	Parameters: 0
	Flags: None
*/
function function_871087b6()
{
	return is_true(self.var_7136e83);
}

/*
	Name: get_scene_shot
	Namespace: scene
	Checksum: 0x57938999
	Offset: 0x9708
	Size: 0xC4
	Parameters: 1
	Flags: None
*/
function get_scene_shot(str_scene)
{
	foreach(o_scene in self.scenes)
	{
		if(o_scene._str_name === str_scene)
		{
			return o_scene._str_shot;
		}
	}
	/#
		assert(("" + str_scene) + "");
	#/
}

/*
	Name: is_capture_mode
	Namespace: scene
	Checksum: 0x411135BC
	Offset: 0x97D8
	Size: 0x80
	Parameters: 1
	Flags: None
*/
function is_capture_mode(str_mode)
{
	if(!isdefined(str_mode))
	{
		str_mode = getdvarstring(#"scene_menu_mode", "default");
	}
	if(issubstr(str_mode, "capture") || function_a4dedc63(1))
	{
		return true;
	}
	return false;
}

/*
	Name: should_spectate_on_join
	Namespace: scene
	Checksum: 0x3B866668
	Offset: 0x9860
	Size: 0x1A
	Parameters: 0
	Flags: None
*/
function should_spectate_on_join()
{
	return is_true(level.scene_should_spectate_on_hot_join);
}

/*
	Name: wait_until_spectate_on_join_completes
	Namespace: scene
	Checksum: 0x2D2803A7
	Offset: 0x9888
	Size: 0x28
	Parameters: 0
	Flags: None
*/
function wait_until_spectate_on_join_completes()
{
	while(is_true(level.scene_should_spectate_on_hot_join))
	{
		waitframe(1);
	}
}

/*
	Name: function_a4dedc63
	Namespace: scene
	Checksum: 0xBB195F9C
	Offset: 0x98B8
	Size: 0xA8
	Parameters: 1
	Flags: Linked
*/
function function_a4dedc63(var_2875c7e7)
{
	if(!isdefined(var_2875c7e7))
	{
		var_2875c7e7 = 0;
	}
	if(var_2875c7e7)
	{
		if(getdvarint(#"hash_6a54249f0cc48945", 0))
		{
			return true;
		}
	}
	else if(getdvarint(#"hash_1ac735c6e28a2f7a", 0) || getdvarint(#"hash_6a54249f0cc48945", 0))
	{
		return true;
	}
	return false;
}

/*
	Name: function_46546b5c
	Namespace: scene
	Checksum: 0xDB24D2A6
	Offset: 0x9968
	Size: 0xAE
	Parameters: 1
	Flags: Linked
*/
function function_46546b5c(str_scenedef)
{
	if(!sessionmodeiscampaigngame())
	{
		return false;
	}
	if(function_a4dedc63())
	{
		return false;
	}
	if(getdvarint(#"hash_862358d532e674c", 0) === 1)
	{
		var_41c1a1b7 = getscriptbundle(str_scenedef);
		if(is_true(var_41c1a1b7.var_2af733c9))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_a63b9bca
	Namespace: scene
	Checksum: 0x91B67ED8
	Offset: 0x9A20
	Size: 0x96
	Parameters: 1
	Flags: Linked
*/
function function_a63b9bca(str_scenedef)
{
	if(!sessionmodeiscampaigngame())
	{
		return false;
	}
	if(getdvarint(#"hash_862358d532e674c", 0) === 2)
	{
		var_41c1a1b7 = getscriptbundle(str_scenedef);
		if(is_true(var_41c1a1b7.var_2af733c9))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_a4ad0308
	Namespace: scene
	Checksum: 0x40A70E81
	Offset: 0x9AC0
	Size: 0xA20
	Parameters: 1
	Flags: Linked
*/
function function_a4ad0308(o_scene)
{
	if(getdvarint(#"hash_12bb279f3cc30d88", 1) == 0 || is_true(o_scene._s.disablesceneskipping) && !function_46546b5c(o_scene._str_name))
	{
		return;
	}
	self notify(#"hash_f7c1e0e8fb935d5");
	self endoncallback(&function_63033fc3, #"hash_f7c1e0e8fb935d5", #"disconnect");
	o_scene endoncallback(&function_63033fc3, #"scene_done", #"scene_stop", #"scene_skip_completed", #"hash_63783193d9ac5bfc");
	level endoncallback(&function_63033fc3, #"hash_7a8cd7f6a20dde3e");
	b_skip_scene = 0;
	self clear_scene_skipping_ui();
	waitframe(1);
	if(function_46546b5c(o_scene._str_name))
	{
		var_6b859e8c = 1;
		var_d60120 = 0;
	}
	else
	{
		var_6b859e8c = 0;
		var_d60120 = 2500;
	}
	self.skip_scene_menu_handle = lui::get_luimenu("cp_skip_scene_menu");
	self.skip_scene_menu_handle cp_skip_scene_menu::open(self);
	self.skip_scene_menu_handle cp_skip_scene_menu::set_showskipbutton(self, 0);
	self.skip_scene_menu_handle cp_skip_scene_menu::set_hostisskipping(self, 0);
	self.skip_scene_menu_handle cp_skip_scene_menu::set_votedtoskip(self, 0);
	self.skip_scene_menu_handle cp_skip_scene_menu::set_sceneskipendtime(self, 0);
	while(true)
	{
		if(is_true(self.var_fc92900f) && isdefined(self.skip_scene_menu_handle))
		{
			self.skip_scene_menu_handle cp_skip_scene_menu::set_votedtoskip(self, 1);
			self.skip_scene_menu_handle cp_skip_scene_menu::set_showskipbutton(self, 2);
			self.scene_skip_timer = undefined;
			p_host = util::gethostplayer();
			if(isdefined(p_host) && isdefined(p_host.skip_scene_menu_handle))
			{
				p_host.skip_scene_menu_handle cp_skip_scene_menu::set_votedtoskip(p_host, 1);
			}
		}
		else
		{
			if(self any_button_pressed() && function_1c87e68f())
			{
				if(!isdefined(self.scene_skip_timer) && isdefined(self.skip_scene_menu_handle))
				{
					self.skip_scene_menu_handle cp_skip_scene_menu::set_showskipbutton(self, 1);
				}
				self.scene_skip_timer = gettime();
			}
			else if(isdefined(self.scene_skip_timer) && isdefined(self.skip_scene_menu_handle))
			{
				if(gettime() - self.scene_skip_timer > var_d60120)
				{
					self.skip_scene_menu_handle cp_skip_scene_menu::set_showskipbutton(self, 2);
					self.scene_skip_timer = undefined;
				}
			}
		}
		var_8133fe2b = 0;
		if(var_6b859e8c || self primarybuttonpressedlocal() || (is_false(self gamepadusedlast()) ? self attackbuttonpressed() : self jumpbuttonpressed()))
		{
			var_8133fe2b = 1;
		}
		if(var_8133fe2b && function_1c87e68f())
		{
			if(!isdefined(self.scene_skip_start_time) && isdefined(self.skip_scene_menu_handle))
			{
				self.skip_scene_menu_handle cp_skip_scene_menu::set_sceneskipendtime(self, gettime() + var_d60120);
				self.scene_skip_start_time = gettime();
				if(self ishost())
				{
					foreach(player in getplayers())
					{
						if(isdefined(player.skip_scene_menu_handle) && !player ishost())
						{
							player.skip_scene_menu_handle cp_skip_scene_menu::set_hostisskipping(player, 1);
						}
					}
				}
			}
			else if(isdefined(self.scene_skip_start_time) && (gettime() - self.scene_skip_start_time) > var_d60120)
			{
				if(self ishost())
				{
					b_skip_scene = 1;
					break;
				}
				else
				{
					self.var_fc92900f = 1;
					var_4ca048a2 = 0;
					foreach(player in getplayers())
					{
						if(is_true(player.var_fc92900f))
						{
							var_4ca048a2++;
						}
					}
					if(var_4ca048a2 > 1)
					{
						b_skip_scene = 1;
						break;
					}
				}
			}
		}
		else if(isdefined(self.scene_skip_start_time) && isdefined(self.skip_scene_menu_handle))
		{
			self.skip_scene_menu_handle cp_skip_scene_menu::set_sceneskipendtime(self, 0);
			self.scene_skip_start_time = undefined;
			if(self ishost())
			{
				foreach(player in getplayers())
				{
					if(isdefined(player.skip_scene_menu_handle) && !player ishost())
					{
						player.skip_scene_menu_handle cp_skip_scene_menu::set_hostisskipping(player, 0);
					}
				}
			}
		}
		if(is_true(level.chyron_text_active))
		{
			while(is_true(level.chyron_text_active))
			{
				waitframe(1);
			}
			wait(3);
		}
		waitframe(1);
	}
	if(b_skip_scene)
	{
		self clear_scene_skipping_ui();
		self playsound(#"uin_igc_skip");
		self notify(#"scene_being_skipped");
		music::setmusicstatebyteam("death", self.team);
		start_scene_skip(o_scene);
		foreach(player in getplayers())
		{
			if(isdefined(player._scene_object) && isdefined(player._scene_object._o_scene) && player._scene_object._o_scene != o_scene)
			{
				var_bf6b1ad2 = player._scene_object._o_scene;
				if(var_bf6b1ad2._s is_igc())
				{
					start_scene_skip(var_bf6b1ad2);
					break;
				}
			}
		}
		level notify(#"hash_7a8cd7f6a20dde3e");
	}
}

/*
	Name: start_scene_skip
	Namespace: scene
	Checksum: 0x128DE91B
	Offset: 0xA4E8
	Size: 0x38
	Parameters: 1
	Flags: Linked
*/
function start_scene_skip(o_scene)
{
	o_scene.skipping_scene = 1;
	o_scene.b_player_scene = 1;
	thread [[ o_scene ]]->skip_scene(0);
}

/*
	Name: function_1c87e68f
	Namespace: scene
	Checksum: 0xD6444F90
	Offset: 0xA528
	Size: 0x8C
	Parameters: 0
	Flags: Linked
*/
function function_1c87e68f()
{
	if(is_true(level.chyron_text_active))
	{
		return false;
	}
	if(is_true(level.var_d89799d7) && (level flag::exists("switchmap_preload_finished") && !level flag::get("switchmap_preload_finished")))
	{
		return false;
	}
	return true;
}

/*
	Name: clear_scene_skipping_ui
	Namespace: scene
	Checksum: 0xFF32A06A
	Offset: 0xA5C0
	Size: 0x6E
	Parameters: 0
	Flags: Linked
*/
function clear_scene_skipping_ui()
{
	if(isdefined(self.scene_skip_timer))
	{
		self.scene_skip_timer = undefined;
	}
	if(isdefined(self.scene_skip_start_time))
	{
		self.scene_skip_start_time = undefined;
	}
	if(isdefined(self.skip_scene_menu_handle))
	{
		self.skip_scene_menu_handle cp_skip_scene_menu::close(self);
		self.skip_scene_menu_handle = undefined;
	}
	self.var_fc92900f = undefined;
}

/*
	Name: function_63033fc3
	Namespace: scene
	Checksum: 0x7D9F3CA1
	Offset: 0xA638
	Size: 0x94
	Parameters: 1
	Flags: Linked
*/
function function_63033fc3(str_notify)
{
	if(isclass(self) || self == level)
	{
		array::thread_all(getplayers(), &clear_scene_skipping_ui);
	}
	else if(isplayer(self))
	{
		self clear_scene_skipping_ui();
	}
}

/*
	Name: any_button_pressed
	Namespace: scene
	Checksum: 0x10E2C840
	Offset: 0xA6D8
	Size: 0x1A6
	Parameters: 0
	Flags: Linked
*/
function any_button_pressed()
{
	if(self actionslotonebuttonpressed())
	{
		return true;
	}
	if(self actionslottwobuttonpressed())
	{
		return true;
	}
	if(self actionslotthreebuttonpressed())
	{
		return true;
	}
	if(self actionslotfourbuttonpressed())
	{
		return true;
	}
	if(self jumpbuttonpressed())
	{
		return true;
	}
	if(self stancebuttonpressed())
	{
		return true;
	}
	if(self weaponswitchbuttonpressed())
	{
		return true;
	}
	if(self reloadbuttonpressed())
	{
		return true;
	}
	if(self fragbuttonpressed())
	{
		return true;
	}
	if(self throwbuttonpressed())
	{
		return true;
	}
	if(self attackbuttonpressed())
	{
		return true;
	}
	if(self secondaryoffhandbuttonpressed())
	{
		return true;
	}
	if(self meleebuttonpressed())
	{
		return true;
	}
	return false;
}

/*
	Name: on_player_disconnect
	Namespace: scene
	Checksum: 0x4EEA211D
	Offset: 0xA888
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function on_player_disconnect()
{
	if(is_false(level.gameended))
	{
		self set_igc_active(0);
	}
}

/*
	Name: add_scene_ordered_notetrack
	Namespace: scene
	Checksum: 0xC71F8D9D
	Offset: 0xA8C8
	Size: 0xC4
	Parameters: 2
	Flags: None
*/
function add_scene_ordered_notetrack(group_name, str_note)
{
	if(!isdefined(level.scene_ordered_notetracks))
	{
		level.scene_ordered_notetracks = [];
	}
	group_obj = level.scene_ordered_notetracks[group_name];
	if(!isdefined(group_obj))
	{
		group_obj = spawnstruct();
		group_obj.count = 0;
		group_obj.current_count = 0;
		level.scene_ordered_notetracks[group_name] = group_obj;
	}
	group_obj.count++;
	self thread _wait_for_ordered_notify(group_obj.count - 1, group_obj, group_name, str_note);
}

/*
	Name: _wait_for_ordered_notify
	Namespace: scene
	Checksum: 0x73D56126
	Offset: 0xA998
	Size: 0x1E4
	Parameters: 4
	Flags: Linked
*/
function _wait_for_ordered_notify(id, group_obj, group_name, str_note)
{
	self waittill(str_note);
	if(group_obj.current_count == id)
	{
		group_obj.current_count++;
		self notify("scene_" + str_note);
		waitframe(1);
		if(group_obj.current_count == group_obj.count)
		{
			group_obj.pending_notifies = undefined;
			level.scene_ordered_notetracks[group_name] = undefined;
		}
		else if(isdefined(group_obj.pending_notifies) && (group_obj.current_count + group_obj.pending_notifies.size) == group_obj.count)
		{
			self thread _fire_ordered_notitifes(group_obj, group_name);
		}
	}
	else
	{
		if(!isdefined(group_obj.pending_notifies))
		{
			group_obj.pending_notifies = [];
		}
		notetrack = spawnstruct();
		notetrack.id = id;
		notetrack.str_note = str_note;
		for(i = 0; i < group_obj.pending_notifies.size && group_obj.pending_notifies[i].id < id; i++)
		{
		}
		arrayinsert(group_obj.pending_notifies, notetrack, i);
		if((group_obj.current_count + group_obj.pending_notifies.size) == group_obj.count)
		{
			self thread _fire_ordered_notitifes(group_obj, group_name);
		}
	}
}

/*
	Name: _fire_ordered_notitifes
	Namespace: scene
	Checksum: 0x905F4F5D
	Offset: 0xAB88
	Size: 0x98
	Parameters: 2
	Flags: Linked
*/
function _fire_ordered_notitifes(group_obj, group_name)
{
	if(isdefined(group_obj.pending_notifies))
	{
		while(group_obj.pending_notifies.size > 0)
		{
			self notify("scene_" + group_obj.pending_notifies[0].str_note);
			arrayremoveindex(group_obj.pending_notifies, 0);
			waitframe(1);
		}
	}
	group_obj.pending_notifies = undefined;
	level.scene_ordered_notetracks[group_name] = undefined;
}

/*
	Name: add_wait_for_streamer_hint_scene
	Namespace: scene
	Checksum: 0xC555C411
	Offset: 0xAC28
	Size: 0x44
	Parameters: 1
	Flags: None
*/
function add_wait_for_streamer_hint_scene(str_scene_name)
{
	if(!isdefined(level.wait_for_streamer_hint_scenes))
	{
		level.wait_for_streamer_hint_scenes = [];
	}
	array::add(level.wait_for_streamer_hint_scenes, str_scene_name);
}

/*
	Name: get_existing_ent
	Namespace: scene
	Checksum: 0x1EAC45E2
	Offset: 0xAC78
	Size: 0x214
	Parameters: 4
	Flags: Linked
*/
function get_existing_ent(str_name, b_spawner_only, b_nodes_and_structs, str_scene)
{
	if(!isdefined(b_spawner_only))
	{
		b_spawner_only = 0;
	}
	if(!isdefined(b_nodes_and_structs))
	{
		b_nodes_and_structs = 0;
	}
	e = undefined;
	if(b_spawner_only)
	{
		e_array = getspawnerarray(str_name, "script_animname");
		if(e_array.size == 0)
		{
			e_array = getspawnerarray(str_name, "targetname");
		}
		/#
			assert(e_array.size <= 1, "");
		#/
		foreach(ent in e_array)
		{
			if(!isdefined(ent.isdying))
			{
				e = ent;
				break;
			}
		}
	}
	else
	{
		e = get_existing_ent_by_targetname(str_name, str_scene);
		if(!is_valid_ent(e) && b_nodes_and_structs)
		{
			e = getnode(str_name, "targetname");
			if(!is_valid_ent(e))
			{
				e = struct::get(str_name, "targetname");
			}
		}
	}
	if(is_valid_ent(e))
	{
		return e;
	}
}

/*
	Name: get_existing_ent_by_targetname
	Namespace: scene
	Checksum: 0xC72F09F1
	Offset: 0xAE98
	Size: 0x7A
	Parameters: 2
	Flags: Linked
*/
function get_existing_ent_by_targetname(str_name, str_scene)
{
	e = _get_existing_ent(str_name, "targetname", 1, str_scene);
	if(!is_valid_ent(e))
	{
		e = _get_existing_ent(str_name, "targetname", undefined, str_scene);
	}
	return e;
}

/*
	Name: _get_existing_ent
	Namespace: scene
	Checksum: 0xE53D17B4
	Offset: 0xAF20
	Size: 0xDA
	Parameters: 4
	Flags: Linked
*/
function _get_existing_ent(val, key, b_ignore_spawners, str_scene)
{
	if(!isdefined(b_ignore_spawners))
	{
		b_ignore_spawners = 0;
	}
	a_ents = getentarray(val, key, b_ignore_spawners);
	/#
		if(!isdefined(str_scene))
		{
			str_scene = "";
		}
		/#
			assert(a_ents.size <= 1, (("" + function_9e72a96(val)) + "") + function_9e72a96(str_scene) + "");
		#/
	#/
	return a_ents[0];
}

/*
	Name: is_valid_ent
	Namespace: scene
	Checksum: 0xE23C735C
	Offset: 0xB008
	Size: 0x5C
	Parameters: 1
	Flags: Linked
*/
function is_valid_ent(ent)
{
	return isdefined(ent) && (!isdefined(ent.isdying) && !ent ai::is_dead_sentient() || self._s.ignorealivecheck === 1);
}

/*
	Name: synced_delete
	Namespace: scene
	Checksum: 0xF1C6AA1B
	Offset: 0xB070
	Size: 0x1AC
	Parameters: 1
	Flags: Linked
*/
function synced_delete(str_scene)
{
	self endon(#"death");
	self.isdying = 1;
	self.var_a6ddd958 = str_scene;
	if(!isplayer(self))
	{
		sethideonclientwhenscriptedanimcompleted(self);
		self animation::stop(0);
		waitframe(1);
		self val::set(#"synced_delete", "hide");
	}
	else
	{
		waitframe(1);
		self val::set(#"synced_delete", "hide", 2);
	}
	self notsolid();
	if(isalive(self))
	{
		if(issentient(self))
		{
			self val::set(#"synced_delete", "ignoreall", 1);
		}
		if(isactor(self))
		{
			self pathmode("dont move");
		}
	}
	wait(1);
	self delete();
}

/*
	Name: error_on_screen
	Namespace: scene
	Checksum: 0xEE02DC79
	Offset: 0xB228
	Size: 0x11C
	Parameters: 1
	Flags: None
*/
function error_on_screen(str_msg)
{
	/#
		str_msg = function_9e72a96(str_msg);
		if(str_msg != "")
		{
			if(!isdefined(level.scene_error_hud))
			{
				level.scene_error_hud = newdebughudelem();
			}
			level.scene_error_hud.alignx = "";
			level.scene_error_hud.aligny = "";
			level.scene_error_hud.horzalign = "";
			level.scene_error_hud.y = 30;
			level.scene_error_hud.fontscale = 1;
			level.scene_error_hud.color = (1, 0, 0);
			level.scene_error_hud settext(str_msg);
			self thread _destroy_error_on_screen();
		}
	#/
}

/*
	Name: _destroy_error_on_screen
	Namespace: scene
	Checksum: 0x8C0BAC24
	Offset: 0xB350
	Size: 0x86
	Parameters: 0
	Flags: None
*/
function _destroy_error_on_screen()
{
	/#
		level notify(#"_destroy_error_on_screen");
		level endon(#"_destroy_error_on_screen");
		self waittilltimeout(5, #"scene_stop", #"scene_done");
		level.scene_error_hud destroy();
		level.scene_error_hud = undefined;
	#/
}

/*
	Name: warning_on_screen
	Namespace: scene
	Checksum: 0xFCB9C66F
	Offset: 0xB3E0
	Size: 0x11C
	Parameters: 1
	Flags: None
*/
function warning_on_screen(str_msg)
{
	/#
		str_msg = function_9e72a96(str_msg);
		if(str_msg != "")
		{
			if(!isdefined(level.scene_warning_hud))
			{
				level.scene_warning_hud = newdebughudelem();
			}
			level.scene_warning_hud.alignx = "";
			level.scene_warning_hud.aligny = "";
			level.scene_warning_hud.horzalign = "";
			level.scene_warning_hud.y = 70;
			level.scene_warning_hud.fontscale = 1;
			level.scene_warning_hud.color = (1, 1, 0);
			level.scene_warning_hud settext(str_msg);
			self thread _destroy_warning_on_screen();
		}
	#/
}

/*
	Name: _destroy_warning_on_screen
	Namespace: scene
	Checksum: 0x93C9BA0C
	Offset: 0xB508
	Size: 0x86
	Parameters: 0
	Flags: None
*/
function _destroy_warning_on_screen()
{
	/#
		level notify(#"_destroy_warning_on_screen");
		level endon(#"_destroy_warning_on_screen");
		self waittilltimeout(5, #"scene_stop", #"scene_done");
		level.scene_warning_hud destroy();
		level.scene_warning_hud = undefined;
	#/
}

/*
	Name: wait_server_time
	Namespace: scene
	Checksum: 0x66DEE947
	Offset: 0xB598
	Size: 0xC4
	Parameters: 2
	Flags: Linked
*/
function wait_server_time(n_time, n_start_time)
{
	if(!isdefined(n_start_time))
	{
		n_start_time = 0;
	}
	n_len = n_time - (n_time * n_start_time);
	n_len = n_len / (float(function_60d95f53()) / 1000);
	n_len_int = int(n_len);
	if(n_len_int != n_len)
	{
		n_len = floor(n_len);
	}
	waitframe(int(n_len));
}

/*
	Name: check_team
	Namespace: scene
	Checksum: 0xFEC163AE
	Offset: 0xB668
	Size: 0xB6
	Parameters: 2
	Flags: Linked
*/
function check_team(str_team1, str_team2)
{
	if(!isdefined(str_team1))
	{
		str_team1 = #"any";
	}
	if(!isdefined(str_team2))
	{
		str_team2 = #"any";
	}
	str_team1 = util::get_team_mapping(str_team1);
	str_team2 = util::get_team_mapping(str_team2);
	if(str_team1 == #"any" || str_team2 == #"any")
	{
		return 1;
	}
	return str_team1 == str_team2;
}

/*
	Name: function_c935c42
	Namespace: scene
	Checksum: 0x31D4210
	Offset: 0xB728
	Size: 0x18
	Parameters: 0
	Flags: Linked
*/
function function_c935c42()
{
	if(isdefined(self._scene_object))
	{
		return true;
	}
	return false;
}

/*
	Name: function_787434e2
	Namespace: scene
	Checksum: 0x6598EFEF
	Offset: 0xB748
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_787434e2()
{
	self flag::clear(#"hash_2d4a7625f4fde7eb");
}

/*
	Name: function_4f5268c8
	Namespace: scene
	Checksum: 0x7635A02E
	Offset: 0xB778
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_4f5268c8()
{
	self flag::set(#"hash_2d4a7625f4fde7eb");
}

/*
	Name: function_268bfc72
	Namespace: scene
	Checksum: 0xA43127E5
	Offset: 0xB7A8
	Size: 0x2E
	Parameters: 0
	Flags: Linked
*/
function function_268bfc72()
{
	if(self flag::get(#"hash_2d4a7625f4fde7eb"))
	{
		return false;
	}
	return true;
}

/*
	Name: function_e96379a5
	Namespace: scene
	Checksum: 0x2DD1F9D7
	Offset: 0xB7E0
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_e96379a5()
{
	self flag::set(#"hash_960b6b7a9f62393");
}

/*
	Name: function_2987f9bd
	Namespace: scene
	Checksum: 0x1E052701
	Offset: 0xB810
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_2987f9bd()
{
	self flag::clear(#"hash_960b6b7a9f62393");
}

/*
	Name: function_6d361d2d
	Namespace: scene
	Checksum: 0xF034A90D
	Offset: 0xB840
	Size: 0x2E
	Parameters: 0
	Flags: Linked
*/
function function_6d361d2d()
{
	if(self flag::get(#"hash_960b6b7a9f62393"))
	{
		return true;
	}
	return false;
}

/*
	Name: function_84b01fa4
	Namespace: scene
	Checksum: 0x64FE979F
	Offset: 0xB878
	Size: 0x38
	Parameters: 2
	Flags: None
*/
function function_84b01fa4(var_9e9be14d, var_2bd02bb5)
{
	if(!isdefined(self.var_9b882ef5))
	{
		self.var_9b882ef5 = [];
	}
	self.var_9b882ef5[var_9e9be14d] = var_2bd02bb5;
}

/*
	Name: function_1a1f1be7
	Namespace: scene
	Checksum: 0x65184244
	Offset: 0xB8B8
	Size: 0x72
	Parameters: 1
	Flags: None
*/
function function_1a1f1be7(var_8826a030)
{
	if(!isdefined(self.var_8826a030))
	{
		self.var_8826a030 = [];
	}
	if(!isdefined(var_8826a030))
	{
		var_8826a030 = [];
	}
	else if(!isarray(var_8826a030))
	{
		var_8826a030 = array(var_8826a030);
	}
	self.var_8826a030 = var_8826a030;
}

/*
	Name: function_61635c87
	Namespace: scene
	Checksum: 0xAFDE5E06
	Offset: 0xB938
	Size: 0x5C
	Parameters: 1
	Flags: None
*/
function function_61635c87(b_enable)
{
	if(b_enable)
	{
		self flag::set(#"hash_6ce14241f77af1e7");
	}
	else
	{
		self flag::clear(#"hash_6ce14241f77af1e7");
	}
}

/*
	Name: function_3d35d3ca
	Namespace: scene
	Checksum: 0x7A37A487
	Offset: 0xB9A0
	Size: 0x16A
	Parameters: 1
	Flags: Linked
*/
function function_3d35d3ca(str_team)
{
	var_36db66e0 = [];
	a_players = getplayers(str_team);
	foreach(player in a_players)
	{
		if(isarray(player.registerlodscalerigid_init) && isdefined(self._o_scene) && isinarray(player.registerlodscalerigid_init, hash(self._o_scene._str_name)))
		{
			continue;
		}
		if(!isdefined(var_36db66e0))
		{
			var_36db66e0 = [];
		}
		else if(!isarray(var_36db66e0))
		{
			var_36db66e0 = array(var_36db66e0);
		}
		var_36db66e0[var_36db66e0.size] = player;
	}
	return var_36db66e0;
}

/*
	Name: function_e941ea66
	Namespace: scene
	Checksum: 0x5B930379
	Offset: 0xBB18
	Size: 0x16A
	Parameters: 1
	Flags: Linked
*/
function function_e941ea66(str_team)
{
	var_36db66e0 = [];
	a_players = function_a1ef346b(str_team);
	foreach(player in a_players)
	{
		if(isarray(player.registerlodscalerigid_init) && isdefined(self._o_scene) && isinarray(player.registerlodscalerigid_init, hash(self._o_scene._str_name)))
		{
			continue;
		}
		if(!isdefined(var_36db66e0))
		{
			var_36db66e0 = [];
		}
		else if(!isarray(var_36db66e0))
		{
			var_36db66e0 = array(var_36db66e0);
		}
		var_36db66e0[var_36db66e0.size] = player;
	}
	return var_36db66e0;
}

/*
	Name: function_8b06792
	Namespace: scene
	Checksum: 0xC9D48488
	Offset: 0xBC90
	Size: 0x16C
	Parameters: 1
	Flags: None
*/
function function_8b06792(var_18835bcc)
{
	if(!isdefined(var_18835bcc))
	{
		var_18835bcc = [];
	}
	else if(!isarray(var_18835bcc))
	{
		var_18835bcc = array(var_18835bcc);
	}
	foreach(str_scene in var_18835bcc)
	{
		if(!isdefined(self.registerlodscalerigid_init))
		{
			self.registerlodscalerigid_init = [];
		}
		else if(!isarray(self.registerlodscalerigid_init))
		{
			self.registerlodscalerigid_init = array(self.registerlodscalerigid_init);
		}
		if(!isinarray(self.registerlodscalerigid_init, hash(str_scene)))
		{
			self.registerlodscalerigid_init[self.registerlodscalerigid_init.size] = hash(str_scene);
		}
	}
}

/*
	Name: anim_reach
	Namespace: scene
	Checksum: 0x20B67412
	Offset: 0xBE08
	Size: 0xC8
	Parameters: 3
	Flags: Linked
*/
function anim_reach(str_scene_name, str_shot, ai)
{
	/#
		assert(isactor(ai));
	#/
	o_scene = _init_instance(str_scene_name);
	/#
		assert(isclass(o_scene._a_objects[0]));
	#/
	var_8d01ee50 = o_scene._a_objects[0];
	[[ var_8d01ee50 ]]->function_47bd9bac(ai, str_shot);
}

/*
	Name: function_2fd8d9a3
	Namespace: scene
	Checksum: 0xB040EE4F
	Offset: 0xBED8
	Size: 0x284
	Parameters: 3
	Flags: Linked, Private
*/
function private function_2fd8d9a3(s_tracker, var_cfeeef61, a_ents)
{
	/#
		assert(isinarray(level.scene_sequence_names, hash(var_cfeeef61)), ("" + var_cfeeef61) + "");
	#/
	if(!isdefined(level.var_25a8c888[var_cfeeef61]))
	{
		level.var_25a8c888[var_cfeeef61] = [];
		s_bundle = getscriptbundle(var_cfeeef61);
		foreach(s_node in s_bundle.var_4ff9da64)
		{
			level.var_25a8c888[var_cfeeef61][s_node.name] = s_node;
		}
	}
	var_c1a775f3 = arraycopy(level.var_25a8c888[var_cfeeef61]);
	foreach(var_ff90ecdb in var_c1a775f3)
	{
		if(is_true(var_ff90ecdb.var_6507df35))
		{
			self function_a6fc0988(var_cfeeef61, var_c1a775f3, var_ff90ecdb, a_ents);
			s_tracker.n_scene_count--;
			if(s_tracker.n_scene_count == 0)
			{
				s_tracker notify(#"hash_694043bb3252702");
			}
			return;
		}
	}
	/#
		assertmsg(("" + var_cfeeef61) + "");
	#/
}

/*
	Name: function_a6fc0988
	Namespace: scene
	Checksum: 0x1FF0E13D
	Offset: 0xC168
	Size: 0x1AE
	Parameters: 4
	Flags: Linked, Private
*/
function private function_a6fc0988(var_cfeeef61, var_c1a775f3, var_840fe719, a_ents)
{
	var_2f3f4731 = var_840fe719;
	while(true)
	{
		s_waitresult = function_8fc96d1b(var_cfeeef61, var_2f3f4731, a_ents, var_2f3f4731.n_blend);
		if(isdefined(s_waitresult.var_cc000a39))
		{
			var_e6336354 = s_waitresult.var_cc000a39[0].var_99a313b2;
			a_ents = [];
			if(isarray(s_waitresult.var_cc000a39[0].var_7698819c))
			{
				foreach(var_9b685a51 in s_waitresult.var_cc000a39[0].var_7698819c)
				{
					a_ents[var_9b685a51.var_db32441] = var_2f3f4731.a_ents[tolower(var_9b685a51.var_db32441)];
				}
			}
			var_2f3f4731 = var_c1a775f3[var_e6336354];
			a_ents = s_waitresult.a_ents;
			var_2f3f4731.n_blend = s_waitresult.var_cc000a39[0].blend;
		}
		else
		{
			break;
		}
	}
}

/*
	Name: function_8fc96d1b
	Namespace: scene
	Checksum: 0x70A92E3E
	Offset: 0xC320
	Size: 0x50E
	Parameters: 4
	Flags: Linked, Private
*/
function private function_8fc96d1b(var_cfeeef61, var_2f3f4731, a_ents, n_blend)
{
	var_db632007 = 0;
	if(isarray(a_ents.var_d6cfa700))
	{
		foreach(s_node in a_ents.var_d6cfa700)
		{
			if(isdefined(s_node.var_b1299ae4))
			{
				var_db632007 = 1;
				break;
			}
		}
	}
	if(var_db632007)
	{
		if(isarray(self.scene_ents))
		{
			arrayremovevalue(self.scene_ents, undefined, 1);
		}
		if(a_ents.shot === "init")
		{
			self init(a_ents.scene, n_blend);
		}
		else
		{
			self thread play(a_ents.scene, a_ents.shot, n_blend);
		}
		s_tracker = spawnstruct();
		foreach(var_db087283 in a_ents.var_d6cfa700)
		{
			switch(var_db087283.name)
			{
				case "death":
				{
					foreach(ent in self.scene_ents)
					{
						s_tracker thread function_100bb0ad(var_db087283, ent);
					}
					break;
				}
				case "react_r":
				case "react_l":
				case "react_b":
				case "react_f":
				{
					foreach(ent in self.scene_ents)
					{
						s_tracker thread function_ac41a9e4(var_db087283, ent);
					}
					break;
				}
			}
		}
		foreach(o_scene in self.scenes)
		{
			s_tracker thread function_84533a09(o_scene);
		}
		s_waitresult = undefined;
		s_waitresult = s_tracker waittill(#"hash_52bd91230328f58f");
		function_1eaaceab(self.scene_ents, 1);
		arrayremovevalue(self.scene_ents, undefined, 1);
		s_waitresult.a_ents = self.scene_ents;
		return s_waitresult;
	}
	self stop(a_ents.scene);
	if(a_ents.shot === "init")
	{
		self init(a_ents.scene, n_blend);
	}
	else
	{
		self play(a_ents.scene, a_ents.shot, n_blend);
	}
	return undefined;
}

/*
	Name: function_84533a09
	Namespace: scene
	Checksum: 0xCD3C279A
	Offset: 0xC838
	Size: 0x46
	Parameters: 1
	Flags: Linked, Private
*/
function private function_84533a09(o_scene)
{
	self endon(#"hash_52bd91230328f58f");
	o_scene waittill(#"scene_stop");
	self notify(#"hash_52bd91230328f58f");
}

/*
	Name: function_100bb0ad
	Namespace: scene
	Checksum: 0xA5CFF737
	Offset: 0xC888
	Size: 0x6E
	Parameters: 2
	Flags: Linked, Private
*/
function private function_100bb0ad(var_db087283, ent)
{
	self endon(#"hash_52bd91230328f58f");
	ent waittill(var_db087283.name);
	self notify(#"hash_52bd91230328f58f", {#hash_cc000a39:var_db087283.var_b1299ae4});
}

/*
	Name: function_ac41a9e4
	Namespace: scene
	Checksum: 0xFE6F5DA3
	Offset: 0xC900
	Size: 0x28E
	Parameters: 2
	Flags: Linked, Private
*/
function private function_ac41a9e4(var_db087283, ent)
{
	self endon(#"hash_52bd91230328f58f");
	while(isalive(ent))
	{
		a_players = getplayers("all", ent.origin, 300);
		foreach(player in a_players)
		{
			var_2231bfef = vectornormalize(player.origin - ent.origin);
			v_forward = anglestoforward(ent.angles);
			n_dot_fwd = vectordot(var_2231bfef, v_forward);
			v_right = anglestoright(ent.angles);
			n_dot_right = vectordot(var_2231bfef, v_right);
			if(n_dot_fwd >= 0.7 && var_db087283.name === "react_f" || (n_dot_fwd <= -0.7 && var_db087283.name === "react_b") || (n_dot_right <= -0.7 && var_db087283.name === "react_l") || (n_dot_right >= 0.7 && var_db087283.name === "react_r"))
			{
				self notify(#"hash_52bd91230328f58f", {#hash_cc000a39:var_db087283.var_b1299ae4});
				return;
			}
		}
		waitframe(1);
	}
}

