#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_8b6a9d79;

/*
	Name: __init__system__
	Namespace: namespace_8b6a9d79
	Checksum: 0x2FA2C613
	Offset: 0xD8
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_f81b9dea74f0ee", &function_70a657d8, undefined, &finalize, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_8b6a9d79
	Checksum: 0x25614633
	Offset: 0x128
	Size: 0x42
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.var_7d45d0d4 = spawnstruct();
	level.var_7d45d0d4.var_405f83af = [];
	level.var_7d45d0d4.var_ef2adaf8 = [];
}

/*
	Name: finalize
	Namespace: namespace_8b6a9d79
	Checksum: 0x68887ED7
	Offset: 0x178
	Size: 0x54
	Parameters: 0
	Flags: Linked, Private
*/
function private finalize()
{
	function_81d05c4f();
	function_e97ef0d4();
	level.var_7d45d0d4.var_5eba96b3 = [];
	/#
		level thread init_devgui();
	#/
}

/*
	Name: function_b3464a7c
	Namespace: namespace_8b6a9d79
	Checksum: 0x1A62DCE5
	Offset: 0x1D8
	Size: 0x1D0
	Parameters: 3
	Flags: Linked
*/
function function_b3464a7c(scriptname, spawncallback, var_99021fa0)
{
	if(!isdefined(var_99021fa0))
	{
		var_99021fa0 = 0;
	}
	/#
		assert(isstring(scriptname) || ishash(scriptname));
	#/
	/#
		assert(isfunctionptr(spawncallback));
	#/
	var_405f83af = level.var_7d45d0d4.var_405f83af;
	/#
		assert(!isdefined(var_405f83af[scriptname]));
	#/
	script = {#spawncallback:spawncallback, #scriptname:scriptname};
	var_405f83af[scriptname] = script;
	if(var_99021fa0)
	{
		if(!isdefined(level.var_7d45d0d4.var_ab00156))
		{
			level.var_7d45d0d4.var_ab00156 = [];
		}
		else if(!isarray(level.var_7d45d0d4.var_ab00156))
		{
			level.var_7d45d0d4.var_ab00156 = array(level.var_7d45d0d4.var_ab00156);
		}
		level.var_7d45d0d4.var_ab00156[level.var_7d45d0d4.var_ab00156.size] = scriptname;
	}
	return script;
}

/*
	Name: function_85255d0f
	Namespace: namespace_8b6a9d79
	Checksum: 0x3D3744B4
	Offset: 0x3B0
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function function_85255d0f(scriptname)
{
	/#
		assert(isstring(scriptname) || ishash(scriptname));
	#/
	return level.var_7d45d0d4.var_405f83af[scriptname];
}

/*
	Name: function_4485ab6d
	Namespace: namespace_8b6a9d79
	Checksum: 0x7343E514
	Offset: 0x420
	Size: 0x62
	Parameters: 2
	Flags: Linked
*/
function function_4485ab6d(key, value)
{
	/#
		assert(isstring(key));
	#/
	return function_7b8e26b3(level.var_7d45d0d4.var_405f83af, value, key);
}

/*
	Name: function_31e8da78
	Namespace: namespace_8b6a9d79
	Checksum: 0xA408D958
	Offset: 0x490
	Size: 0x1DE
	Parameters: 2
	Flags: None
*/
function function_31e8da78(destination, var_100faab4)
{
	locations = array::randomize(function_f703a5a(destination));
	for(i = 0; i < locations.size; i++)
	{
		if(locations[i].variantname !== #"hash_4807866fcc400c90")
		{
			arrayremoveindex(locations, i, 1);
		}
	}
	arrayremovevalue(locations, undefined);
	foreach(location in locations)
	{
		instances = array::randomize(function_f703a5a(location));
		foreach(instance in instances)
		{
			if(instance.content_script_name === var_100faab4)
			{
				return instance;
			}
		}
	}
}

/*
	Name: function_81d05c4f
	Namespace: namespace_8b6a9d79
	Checksum: 0xDC797B9
	Offset: 0x678
	Size: 0x40A
	Parameters: 0
	Flags: Linked, Private
*/
function private function_81d05c4f()
{
	var_f5ae494f = struct::get_array(#"hash_313be7fccc870cdd", "variantname");
	destinations = [];
	level.var_7d45d0d4.destinations = destinations;
	foreach(destination in var_f5ae494f)
	{
		/#
			assert(isdefined(destination.targetname));
		#/
		/#
			assert(!isdefined(destinations[destination.targetname]));
		#/
		destinations[destination.targetname] = destination;
		function_656a32f0(destination);
		locations = [];
		destination.locations = locations;
		children = function_f703a5a(destination);
		foreach(child in children)
		{
			if(child.variantname != #"hash_4807866fcc400c90")
			{
				continue;
			}
			/#
				assert(isdefined(child.targetname));
			#/
			/#
				assert(!isdefined(locations[child.targetname]));
			#/
			locations[child.targetname] = child;
		}
	}
	var_e5f80f4e = getmapfields(util::get_map_name());
	if(isdefined(var_e5f80f4e.var_dd9e5316))
	{
		foreach(destination in var_e5f80f4e.var_dd9e5316)
		{
			struct::get(destination.targetname).var_8d629117 = !is_true(destination.var_a15fd6d3);
			if(!isdefined(destination.var_7774bfaf))
			{
				continue;
			}
			enabled = getgametypesetting(destination.var_7774bfaf);
			/#
				assert(isdefined(enabled), ("" + destination.var_7774bfaf) + "");
			#/
			if(is_false(enabled))
			{
				arrayremovevalue(destinations, struct::get(destination.targetname));
			}
		}
	}
	level.var_7d45d0d4.destinations = array::randomize(destinations);
}

/*
	Name: function_316bd0e6
	Namespace: namespace_8b6a9d79
	Checksum: 0x38185944
	Offset: 0xA90
	Size: 0x144
	Parameters: 2
	Flags: None
*/
function function_316bd0e6(str_destination, var_2d26f85c)
{
	/#
		assert(isdefined(level.var_7d45d0d4.destinations[str_destination]) && isdefined("" + str_destination));
	#/
	i = 0;
	foreach(var_fc091632 in var_2d26f85c)
	{
		adjacency = struct::get(var_fc091632);
		/#
			assert(isdefined(adjacency) && isdefined("" + var_fc091632));
		#/
		level.var_7d45d0d4.destinations[str_destination].adjacencies[i] = adjacency;
		i++;
	}
}

/*
	Name: function_fe9fb6fd
	Namespace: namespace_8b6a9d79
	Checksum: 0xD72CD6F
	Offset: 0xBE0
	Size: 0x9E
	Parameters: 1
	Flags: Linked
*/
function function_fe9fb6fd(location)
{
	/#
		assert(isstruct(location));
	#/
	/#
		assert(location.variantname == #"hash_4807866fcc400c90");
	#/
	var_e599dbfd = isarray(location.var_5eba96b3) && location.var_5eba96b3.size > 0;
	return var_e599dbfd;
}

/*
	Name: function_e97ef0d4
	Namespace: namespace_8b6a9d79
	Checksum: 0x6FB3D18A
	Offset: 0xC88
	Size: 0x2BA
	Parameters: 0
	Flags: Linked, Private
*/
function private function_e97ef0d4()
{
	var_b8a20df4 = struct::get_array(#"hash_4807866fcc400c90", "variantname");
	locations = [];
	level.var_7d45d0d4.locations = locations;
	foreach(location in var_b8a20df4)
	{
		/#
			assert(isdefined(location.targetname));
		#/
		/#
			assert(!isdefined(locations[location.targetname]));
		#/
		locations[location.targetname] = location;
		if(isdefined(location.target))
		{
			parent = struct::get(location.target);
			if(parent.variantname == #"hash_313be7fccc870cdd")
			{
				location.destination = parent;
			}
		}
		function_656a32f0(location);
		instances = [];
		location.instances = instances;
		children = function_f703a5a(location);
		foreach(child in children)
		{
			if(child.variantname != #"hash_60feba77d317eb4")
			{
				continue;
			}
			/#
				assert(isdefined(child.content_script_name));
			#/
			/#
				assert(!isdefined(instances[child.content_script_name]));
			#/
			instances[child.content_script_name] = child;
			child.location = location;
		}
	}
}

/*
	Name: function_20d7e9c7
	Namespace: namespace_8b6a9d79
	Checksum: 0xA1E7F56E
	Offset: 0xF50
	Size: 0x164
	Parameters: 1
	Flags: Linked
*/
function function_20d7e9c7(instance)
{
	/#
		assert(isstruct(instance));
	#/
	/#
		assert(instance.variantname == #"hash_60feba77d317eb4");
	#/
	/#
		assert(isstring(instance.content_script_name) || ishash(instance.content_script_name));
	#/
	/#
		assert(isstruct(instance.location));
	#/
	function_656a32f0(instance);
	script = level.var_7d45d0d4.var_405f83af[instance.content_script_name];
	if(isdefined(script.spawncallback))
	{
		level thread [[script.spawncallback]](instance);
	}
	function_130f0da3(instance);
}

/*
	Name: function_1c78a45d
	Namespace: namespace_8b6a9d79
	Checksum: 0x80D6F854
	Offset: 0x10C0
	Size: 0xFC
	Parameters: 1
	Flags: None
*/
function function_1c78a45d(instance)
{
	/#
		assert(isstruct(instance));
	#/
	/#
		assert(instance.variantname == #"hash_60feba77d317eb4");
	#/
	/#
		assert(isstring(instance.content_script_name) || ishash(instance.content_script_name));
	#/
	/#
		assert(isstruct(instance.location));
	#/
	return !function_fe9fb6fd(instance.location);
}

/*
	Name: function_130f0da3
	Namespace: namespace_8b6a9d79
	Checksum: 0xE21580F0
	Offset: 0x11C8
	Size: 0xFE
	Parameters: 1
	Flags: Linked, Private
*/
function private function_130f0da3(instance)
{
	/#
		assert(isarray(level.var_7d45d0d4.var_5eba96b3));
	#/
	if(!isdefined(instance.location.var_5eba96b3))
	{
		instance.location.var_5eba96b3 = [];
	}
	instance.location.var_5eba96b3[instance.location.var_5eba96b3.size] = instance;
	var_5eba96b3 = level.var_7d45d0d4.var_5eba96b3;
	if(!isdefined(var_5eba96b3[instance.content_script_name]))
	{
		var_5eba96b3[instance.content_script_name] = [];
	}
	instances = var_5eba96b3[instance.content_script_name];
	instances[instances.size] = instance;
}

/*
	Name: function_76c93f39
	Namespace: namespace_8b6a9d79
	Checksum: 0x266E5ABF
	Offset: 0x12D0
	Size: 0x152
	Parameters: 4
	Flags: None
*/
function function_76c93f39(var_832fa4bc, usecallback, hintstring, radius)
{
	/#
		assert(isarray(var_832fa4bc));
	#/
	/#
		assert(isfunctionptr(usecallback));
	#/
	/#
		assert(ishash(hintstring));
	#/
	triggers = [];
	foreach(struct in var_832fa4bc)
	{
		trigger = function_214737c7(struct, usecallback, hintstring, undefined, radius);
		triggers[trigger.size] = trigger;
	}
	return triggers;
}

/*
	Name: function_214737c7
	Namespace: namespace_8b6a9d79
	Checksum: 0xE1A1C3A9
	Offset: 0x1430
	Size: 0x24E
	Parameters: 9
	Flags: Linked
*/
function function_214737c7(struct, usecallback, hintstring, var_e0355bdc, radius, height, centered, offset, var_499de507)
{
	if(!isdefined(radius))
	{
		radius = 64;
	}
	if(!isdefined(height))
	{
		height = 128;
	}
	if(!isdefined(centered))
	{
		centered = 1;
	}
	if(!isdefined(offset))
	{
		offset = (0, 0, 0);
	}
	/#
		assert(isstruct(struct));
	#/
	/#
		assert(isfunctionptr(usecallback));
	#/
	/#
		assert(ishash(hintstring));
	#/
	if(isdefined(struct.radius))
	{
		radius = struct.radius;
	}
	usetrigger = spawn("trigger_radius_use", struct.origin + offset, 0, radius, height, centered);
	usetrigger triggerignoreteam();
	usetrigger setcursorhint("HINT_NOICON");
	usetrigger usetriggerrequirelookat();
	if(isdefined(var_e0355bdc) && isdefined(var_499de507))
	{
		usetrigger sethintstring(hintstring, var_e0355bdc, var_499de507);
	}
	else
	{
		if(isdefined(var_e0355bdc))
		{
			usetrigger sethintstring(hintstring, var_e0355bdc);
		}
		else
		{
			usetrigger sethintstring(hintstring);
		}
	}
	usetrigger callback::on_trigger(usecallback);
	struct.trigger = usetrigger;
	return usetrigger;
}

/*
	Name: function_cfa4f1a0
	Namespace: namespace_8b6a9d79
	Checksum: 0x33A6AEB2
	Offset: 0x1688
	Size: 0xF2
	Parameters: 4
	Flags: None
*/
function function_cfa4f1a0(var_832fa4bc, modelname, var_bfbc537c, var_619a5c20)
{
	if(!isdefined(var_bfbc537c))
	{
		var_bfbc537c = 0;
	}
	if(!isdefined(var_619a5c20))
	{
		var_619a5c20 = 1;
	}
	models = [];
	foreach(struct in var_832fa4bc)
	{
		model = spawn_script_model(struct, modelname, var_bfbc537c, var_619a5c20);
		models[models.size] = model;
	}
	return models;
}

/*
	Name: spawn_script_model
	Namespace: namespace_8b6a9d79
	Checksum: 0xE62EDA1C
	Offset: 0x1788
	Size: 0x1F2
	Parameters: 4
	Flags: Linked
*/
function spawn_script_model(struct, modelname, var_bfbc537c, var_619a5c20)
{
	if(!isdefined(var_bfbc537c))
	{
		var_bfbc537c = 0;
	}
	if(!isdefined(var_619a5c20))
	{
		var_619a5c20 = 1;
	}
	model = util::spawn_model(modelname, struct.origin, struct.angles);
	if(isdefined(struct.targetname))
	{
		model.targetname = struct.targetname;
	}
	if(isdefined(struct.script_noteworthy))
	{
		model.script_noteworthy = struct.script_noteworthy;
	}
	if(var_bfbc537c)
	{
		model disconnectpaths();
	}
	if(var_619a5c20)
	{
		model function_619a5c20();
	}
	parent = struct;
	while(true)
	{
		if(parent.variantname === #"hash_60feba77d317eb4")
		{
			if(!isdefined(parent.a_models))
			{
				parent.a_models = [];
			}
			else if(!isarray(parent.a_models))
			{
				parent.a_models = array(parent.a_models);
			}
			if(!isinarray(parent.a_models, model))
			{
				parent.a_models[parent.a_models.size] = model;
			}
			break;
		}
		parent = struct::get(parent.target);
		if(!isdefined(parent))
		{
			break;
		}
	}
	return model;
}

/*
	Name: function_94974eef
	Namespace: namespace_8b6a9d79
	Checksum: 0x5B0EFDA0
	Offset: 0x1988
	Size: 0x182
	Parameters: 3
	Flags: Linked
*/
function function_94974eef(struct, var_145b9057, var_e546275c)
{
	if(!isdefined(var_e546275c))
	{
		var_e546275c = 0;
	}
	zbarrier = spawn(var_145b9057, struct.origin);
	zbarrier.angles = struct.angles;
	if(var_e546275c)
	{
		zbarrier disconnectpaths();
	}
	parent = struct;
	while(true)
	{
		if(parent.variantname === #"hash_60feba77d317eb4")
		{
			if(!isdefined(parent.a_models))
			{
				parent.a_models = [];
			}
			else if(!isarray(parent.a_models))
			{
				parent.a_models = array(parent.a_models);
			}
			if(!isinarray(parent.a_models, zbarrier))
			{
				parent.a_models[parent.a_models.size] = zbarrier;
			}
			break;
		}
		parent = struct::get(parent.target);
		if(!isdefined(parent))
		{
			break;
		}
	}
	return zbarrier;
}

/*
	Name: function_690c4abe
	Namespace: namespace_8b6a9d79
	Checksum: 0x706B9CB4
	Offset: 0x1B18
	Size: 0x3BC
	Parameters: 0
	Flags: None
*/
function function_690c4abe()
{
	level notify(#"hash_4a140b223cb0019d");
	var_ca537a1a = 0;
	foreach(group in level.var_7d45d0d4.var_5eba96b3)
	{
		foreach(instance in group)
		{
			if(isdefined(instance.a_models))
			{
				foreach(model in instance.a_models)
				{
					if(isdefined(model))
					{
						if(isdefined(model.trigger))
						{
							model.trigger delete();
						}
						if(isdefined(model.var_e55c8b4e))
						{
							if(isdefined(level.var_49f8cef4))
							{
								[[level.var_49f8cef4]](model.var_e55c8b4e);
							}
							else
							{
								objective_delete(model.var_e55c8b4e);
								gameobjects::release_obj_id(model.var_e55c8b4e);
							}
						}
						if(isdefined(model.objectiveid))
						{
							if(isdefined(level.var_49f8cef4))
							{
								[[level.var_49f8cef4]](model.objectiveid);
							}
							else
							{
								objective_delete(model.objectiveid);
								gameobjects::release_obj_id(model.objectiveid);
							}
						}
						model scene::stop();
						model delete();
						var_ca537a1a = var_ca537a1a + 1;
						if((var_ca537a1a % 10) == 0)
						{
							waitframe(1);
						}
					}
				}
				arrayremovevalue(instance.a_models, undefined);
			}
			arrayremovevalue(group, instance, 1);
			arrayremovevalue(instance.location.var_5eba96b3, instance, 1);
		}
		arrayremovevalue(group, undefined);
		arrayremovevalue(level.var_7d45d0d4.var_5eba96b3, group, 1);
	}
	arrayremovevalue(level.var_7d45d0d4.var_5eba96b3, undefined);
}

/*
	Name: function_656a32f0
	Namespace: namespace_8b6a9d79
	Checksum: 0x45D49D64
	Offset: 0x1EE0
	Size: 0x120
	Parameters: 1
	Flags: Linked, Private
*/
function private function_656a32f0(parent)
{
	children = function_f703a5a(parent);
	var_fe2612fe = function_bedd4c47(children);
	parent.var_fe2612fe = var_fe2612fe;
	foreach(child in children)
	{
		if(child.variantname != #"hash_ef6acc1408a8e86" || !isdefined(child.content_key))
		{
			continue;
		}
		child.parent = parent;
		function_656a32f0(child);
	}
}

/*
	Name: function_bedd4c47
	Namespace: namespace_8b6a9d79
	Checksum: 0x23D0E33
	Offset: 0x2008
	Size: 0x10A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_bedd4c47(children)
{
	groups = [];
	foreach(child in children)
	{
		if(child.variantname != #"hash_ef6acc1408a8e86" || !isdefined(child.content_key))
		{
			continue;
		}
		if(!isdefined(groups[child.content_key]))
		{
			groups[child.content_key] = [];
		}
		group = groups[child.content_key];
		group[group.size] = child;
	}
	return groups;
}

/*
	Name: function_f703a5a
	Namespace: namespace_8b6a9d79
	Checksum: 0x7FF37D80
	Offset: 0x2120
	Size: 0x42
	Parameters: 1
	Flags: Linked
*/
function function_f703a5a(parent)
{
	if(!isdefined(parent.targetname))
	{
		return [];
	}
	return struct::get_array(parent.targetname, "target");
}

/*
	Name: init_devgui
	Namespace: namespace_8b6a9d79
	Checksum: 0x4259B535
	Offset: 0x2170
	Size: 0x3DC
	Parameters: 0
	Flags: Private
*/
function private init_devgui()
{
	/#
		util::waittill_can_add_debug_command();
		adddebugcommand("");
		util::add_devgui(devgui_path("", 0), "");
		foreach(destination in level.var_7d45d0d4.destinations)
		{
			foreach(location in destination.locations)
			{
				foreach(instance in location.instances)
				{
					var_4eb7bd13 = (location.targetname + "") + instance.content_script_name;
					path = devgui_path("", 1, destination.targetname, location.targetname, instance.content_script_name);
					util::add_devgui(path, "" + var_4eb7bd13);
				}
			}
		}
		foreach(location in level.var_7d45d0d4.locations)
		{
			foreach(instance in location.instances)
			{
				var_4eb7bd13 = (location.targetname + "") + instance.content_script_name;
				path = devgui_path("", 2, location.targetname, instance.content_script_name);
				util::add_devgui(path, "" + var_4eb7bd13);
			}
		}
		level thread debug_draw();
		level thread function_b3843ca7();
	#/
}

/*
	Name: devgui_path
	Namespace: namespace_8b6a9d79
	Checksum: 0x48CC83ED
	Offset: 0x2558
	Size: 0xD6
	Parameters: 1
	Flags: Variadic
*/
function devgui_path(...)
{
	/#
		path = "";
		foreach(arg in vararg)
		{
			if(isint(arg))
			{
				path = path + "";
			}
			else
			{
				path = path + "";
			}
			path = path + arg;
		}
		return path;
	#/
}

/*
	Name: function_b3843ca7
	Namespace: namespace_8b6a9d79
	Checksum: 0xAC8E9541
	Offset: 0x2638
	Size: 0x158
	Parameters: 0
	Flags: Private
*/
function private function_b3843ca7()
{
	/#
		while(true)
		{
			setdvar(#"hash_6d5a45dcdc3af9b5", "");
			waitframe(1);
			var_4eb7bd13 = getdvarstring(#"hash_6d5a45dcdc3af9b5", "");
			if(var_4eb7bd13 == "")
			{
				continue;
			}
			keys = strtok(var_4eb7bd13, "");
			if(keys.size != 2)
			{
				continue;
			}
			location = level.var_7d45d0d4.locations[keys[0]];
			if(!isdefined(location))
			{
				continue;
			}
			if(isdefined(location.var_dcb924fd))
			{
				continue;
			}
			instance = location.instances[keys[1]];
			if(!isdefined(instance))
			{
				continue;
			}
			function_20d7e9c7(instance);
		}
	#/
}

/*
	Name: debug_draw
	Namespace: namespace_8b6a9d79
	Checksum: 0x72D0D694
	Offset: 0x2798
	Size: 0x162
	Parameters: 0
	Flags: Private
*/
function private debug_draw()
{
	/#
		while(true)
		{
			if(getdvarint(#"hash_55e098bf3549b14d", 0))
			{
				foreach(destination in level.var_7d45d0d4.destinations)
				{
					function_930df82f(destination);
				}
				foreach(location in level.var_7d45d0d4.locations)
				{
					function_540bcd15(location, location.destination);
				}
			}
			waitframe(1);
		}
	#/
}

/*
	Name: function_930df82f
	Namespace: namespace_8b6a9d79
	Checksum: 0x395F0618
	Offset: 0x2908
	Size: 0x34
	Parameters: 1
	Flags: None
*/
function function_930df82f(destination)
{
	/#
		function_56a6441e(destination, (0, 1, 0), undefined, destination.targetname);
	#/
}

/*
	Name: function_540bcd15
	Namespace: namespace_8b6a9d79
	Checksum: 0x2BCFF17D
	Offset: 0x2948
	Size: 0xE0
	Parameters: 2
	Flags: None
*/
function function_540bcd15(location, destination)
{
	/#
		if(!isdefined(destination))
		{
			destination = undefined;
		}
		function_56a6441e(location, (0, 1, 1), destination, location.targetname);
		foreach(instance in location.instances)
		{
			function_c01c2807(instance, location);
		}
	#/
}

/*
	Name: function_c01c2807
	Namespace: namespace_8b6a9d79
	Checksum: 0xBB12013
	Offset: 0x2A30
	Size: 0x5C
	Parameters: 2
	Flags: None
*/
function function_c01c2807(instance, location)
{
	/#
		if(!isdefined(location))
		{
			location = undefined;
		}
		function_56a6441e(instance, (0, 0, 1), location);
		function_b2b08c09(instance);
	#/
}

/*
	Name: function_b2b08c09
	Namespace: namespace_8b6a9d79
	Checksum: 0xF7C49A6A
	Offset: 0x2A98
	Size: 0x13C
	Parameters: 1
	Flags: None
*/
function function_b2b08c09(node)
{
	/#
		if(isarray(node.var_fe2612fe))
		{
			foreach(group in node.var_fe2612fe)
			{
				foreach(child in group)
				{
					function_56a6441e(child, (1, 0, 1), node);
					function_b2b08c09(child);
				}
			}
		}
	#/
}

/*
	Name: function_56a6441e
	Namespace: namespace_8b6a9d79
	Checksum: 0xADEDE4F4
	Offset: 0x2BE0
	Size: 0x13C
	Parameters: 4
	Flags: None
*/
function function_56a6441e(struct, color, parent, var_f5b09155)
{
	/#
		if(!isdefined(parent))
		{
			parent = undefined;
		}
		if(!isdefined(var_f5b09155))
		{
			var_f5b09155 = undefined;
		}
		var_acfd36dc = undefined;
		var_acfd36dc = function_4636f4cb(var_acfd36dc, struct.variantname);
		var_acfd36dc = function_4636f4cb(var_acfd36dc, struct.content_script_name);
		var_acfd36dc = function_4636f4cb(var_acfd36dc, struct.content_key);
		var_acfd36dc = function_4636f4cb(var_acfd36dc, var_f5b09155);
		if(isdefined(parent))
		{
			line(struct.origin, parent.origin, color);
		}
		sphere(struct.origin, 8, color);
		print3d(struct.origin, var_acfd36dc);
	#/
}

/*
	Name: function_4636f4cb
	Namespace: namespace_8b6a9d79
	Checksum: 0x41083DED
	Offset: 0x2D28
	Size: 0x78
	Parameters: 2
	Flags: None
*/
function function_4636f4cb(str, append)
{
	/#
		if(ishash(append))
		{
			append = function_9e72a96(append);
		}
		if(!isdefined(str))
		{
			return append;
		}
		if(isdefined(append))
		{
			return (str + "") + append;
		}
		return str;
	#/
}

