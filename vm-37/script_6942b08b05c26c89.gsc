#using script_19c6c147c637b960;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace territory;

/*
	Name: __init__system__
	Namespace: territory
	Checksum: 0xC894E42D
	Offset: 0x138
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
	Checksum: 0x503E2898
	Offset: 0x180
	Size: 0xDA
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("world", "territory_id", 1, 4, "int", &function_59941838, 1, 0);
	level.territory = {#name:""};
	territories = struct::get_array("territory", "variantName");
	for(index = 1; index <= territories.size; index++)
	{
		territories[index - 1].id = index;
	}
}

/*
	Name: function_59941838
	Namespace: territory
	Checksum: 0xF48C91E0
	Offset: 0x268
	Size: 0x30C
	Parameters: 7
	Flags: Linked, Private
*/
function private function_59941838(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		level.territory = {#name:""};
		territories = struct::get_array("territory", "variantName");
		foreach(territory in territories)
		{
			if(territory.id == bwastimejump)
			{
				level.territory = territory;
				level.territory.name = (isdefined(level.territory.targetname) ? level.territory.targetname : (isdefined(level.territory.target) ? level.territory.target : ""));
				if(isdefined(territory.target))
				{
					triggers = getentarray(fieldname, territory.target, "targetname");
					if(!isdefined(territory.circle))
					{
						structs = struct::get_array(territory.target, "targetname");
						foreach(struct in structs)
						{
							if(isdefined(struct.variantname) && struct.variantname == "territory_circle")
							{
								territory.circle = function_36a1028e(fieldname, struct.origin, struct.radius);
								break;
							}
						}
					}
				}
				break;
			}
		}
		callback::callback(#"territory", fieldname, {#newval:bwastimejump});
	}
}

/*
	Name: function_1deaf019
	Namespace: territory
	Checksum: 0xF0CB8F4E
	Offset: 0x580
	Size: 0x122
	Parameters: 3
	Flags: None
*/
function function_1deaf019(name, key, territory)
{
	if(!isdefined(territory))
	{
		territory = level.territory;
	}
	validentities = [];
	entities = getentarray(0, name, key);
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
	Checksum: 0xA0F130C2
	Offset: 0x6B0
	Size: 0x6A
	Parameters: 3
	Flags: None
*/
function get_ent_array(name, key, territory)
{
	if(!isdefined(territory))
	{
		territory = level.territory;
	}
	entities = getentarray(0, name, key);
	return function_39dd704c(entities, territory);
}

/*
	Name: function_36a1028e
	Namespace: territory
	Checksum: 0x528D097D
	Offset: 0x728
	Size: 0x1C4
	Parameters: 3
	Flags: Linked, Private
*/
function private function_36a1028e(localclientnum, origin, radius)
{
	circle = spawn(localclientnum, origin, "script_model");
	circle = spawn(localclientnum, origin, "script_model");
	circle setmodel("p9_territory_cylinder");
	circle playrenderoverridebundle(#"hash_43d22d2a5ec27460");
	modelscale = radius / 150000;
	circle function_78233d29(#"hash_43d22d2a5ec27460", "", "Scale", modelscale);
	circle setcompassicon("minimap_collapse_ring");
	circle function_a5edb367(#"death_ring");
	circle function_811196d1(0);
	circle function_95bc465d(1);
	circle function_5e00861(0, 1);
	circle function_60212003(1);
	compassscale = radius * 2;
	circle function_5e00861(compassscale, 1);
}

