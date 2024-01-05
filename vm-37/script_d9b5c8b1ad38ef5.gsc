#using scripts\core_common\util_shared.gsc;
#using script_75da5547b1822294;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\oob.gsc;
#using scripts\core_common\compass.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace territory;

/*
	Name: __init__system__
	Namespace: territory
	Checksum: 0xCED6E103
	Offset: 0x108
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"territory", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: territory
	Checksum: 0x7C6CBAD
	Offset: 0x150
	Size: 0x3D0
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("world", "territory_id", 1, 4, "int");
	territories = struct::get_array("territory", "variantName");
	for(index = 1; index <= territories.size; index++)
	{
		territories[index - 1].id = index;
	}
	var_97191da8 = getdvarstring(#"hash_31435ea827fda47b", "");
	var_45072867 = strtok(var_97191da8, " ");
	var_45072867 = array::randomize(var_45072867);
	foreach(var_8f246125 in var_45072867)
	{
		level.territory = struct::get(var_8f246125, "targetname");
		if(isdefined(level.territory))
		{
			break;
		}
	}
	if(!isdefined(level.territory))
	{
		var_97191da8 = "";
	}
	if(!isdefined(level.territory))
	{
		level.territory = {};
	}
	level.territory.name = var_97191da8;
	if(level.territory.name == "")
	{
		if(territories.size > 0)
		{
			level.territory = array::random(territories);
			level.territory.name = (isdefined(level.territory.targetname) ? level.territory.targetname : (isdefined(level.territory.target) ? level.territory.target : ""));
		}
	}
	if(level.territory.name != "")
	{
		level thread function_7904ef68(level.territory);
	}
	/#
		mapname = util::get_map_name();
		foreach(territory in territories)
		{
			adddebugcommand(((((("" + mapname) + "") + territory.targetname) + "") + territory.targetname) + "");
		}
	#/
}

/*
	Name: function_49695e98
	Namespace: territory
	Checksum: 0xF73832A6
	Offset: 0x528
	Size: 0x156
	Parameters: 4
	Flags: Linked, Private
*/
function private function_49695e98(center, mins, maxs, origin)
{
	if(mins[0] + origin[0] < center.mins[0])
	{
		center.mins = (mins[0] + origin[0], center.mins[1], 0);
	}
	if(mins[1] + origin[1] < center.mins[1])
	{
		center.mins = (center.mins[0], mins[1] + origin[1], 0);
	}
	if(maxs[0] + origin[0] > center.maxs[0])
	{
		center.maxs = (maxs[0] + origin[0], center.maxs[1], 0);
	}
	if(maxs[1] + origin[1] > center.maxs[1])
	{
		center.maxs = (center.maxs[0], maxs[1] + origin[1], 0);
	}
}

/*
	Name: function_7904ef68
	Namespace: territory
	Checksum: 0x8E255DC9
	Offset: 0x688
	Size: 0x45A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_7904ef68(territory)
{
	if(!isdefined(territory))
	{
		/#
			assert(0);
		#/
		return;
	}
	while(!function_6a6f39a2(territory.name))
	{
		waitframe(1);
	}
	level clientfield::set("territory_id", territory.id);
	territory.bounds = [];
	if(isdefined(territory.target))
	{
		entities = getentarray(territory.target, "targetname");
		center = spawnstruct();
		center.mins = vectorscale((1, 1, 0), 2.147484E+09);
		center.maxs = vectorscale((-1, -1, 0), 2.147484E+09);
		foreach(entity in entities)
		{
			if(isdefined(entity.classname) && entity.classname == #"trigger_within_bounds")
			{
				territory.bounds[territory.bounds.size] = entity;
				function_49695e98(center, entity.mins, entity.maxs, entity.origin);
			}
		}
		center.origin = ((center.mins[0] + center.maxs[0]) / 2, (center.mins[1] + center.maxs[1]) / 2, 0);
		if(territory.bounds.size > 0)
		{
			oob::function_5e18416d(territory.bounds);
		}
		structs = struct::get_array(territory.target, "targetname");
		foreach(struct in structs)
		{
			if(isdefined(struct.variantname) && struct.variantname == "territory_circle")
			{
				territory.circle = struct;
				oob::function_376ddafd(struct.origin, struct.radius);
				halfwidth = struct.radius * 1.02;
				compass::function_d6cba2e9("", struct.origin[0] - halfwidth, struct.origin[1] + halfwidth, struct.origin[0] + halfwidth, struct.origin[1] - halfwidth);
				center.origin = struct.origin;
				center.mins = center.origin - (struct.radius, struct.radius, 0);
				center.maxs = center.origin + (struct.radius, struct.radius, 0);
				break;
			}
		}
		level.territory.var_f1dda100 = center;
	}
}

/*
	Name: function_1deaf019
	Namespace: territory
	Checksum: 0x85EA30BB
	Offset: 0xAF0
	Size: 0x122
	Parameters: 3
	Flags: Linked
*/
function function_1deaf019(name, key, territory)
{
	if(!isdefined(territory))
	{
		territory = level.territory;
	}
	validentities = [];
	entities = getentarray(name, key);
	foreach(entity in entities)
	{
		if(!is_valid(entity, territory))
		{
			continue;
		}
		if(is_inside(entity.origin, undefined, territory))
		{
			validentities[validentities.size] = entity;
		}
	}
	return validentities;
}

/*
	Name: get_ent_array
	Namespace: territory
	Checksum: 0x967E51AA
	Offset: 0xC20
	Size: 0x7A
	Parameters: 3
	Flags: Linked
*/
function get_ent_array(name, key, territory)
{
	if(!isdefined(key))
	{
		key = "targetname";
	}
	if(!isdefined(territory))
	{
		territory = level.territory;
	}
	entities = getentarray(name, key);
	return function_39dd704c(entities, territory);
}

