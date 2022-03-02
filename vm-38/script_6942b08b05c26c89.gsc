#using script_19c6c147c637b960;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;

#namespace territory;

/*
	Name: function_1726fab1
	Namespace: territory
	Checksum: 0xF3A1C097
	Offset: 0x138
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_1726fab1()
{
	level notify(1806992019);
}

/*
	Name: function_89f2df9
	Namespace: territory
	Checksum: 0xF1F9F335
	Offset: 0x158
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"territory", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: territory
	Checksum: 0xE49CEC03
	Offset: 0x1A0
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
	Checksum: 0xF575D133
	Offset: 0x288
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
	Checksum: 0x8A69D7F4
	Offset: 0x5A0
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
	Checksum: 0x8E571C6F
	Offset: 0x6D0
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
	Checksum: 0x683EF3A
	Offset: 0x748
	Size: 0x1C4
	Parameters: 3
	Flags: Linked, Private
*/
function private function_36a1028e(localclientnum, origin, radius)
{
	circle = spawn(localclientnum, origin, "script_model");
	circle = spawn(localclientnum, origin, "script_model");
	circle setmodel("p9_territory_cylinder");
	circle function_bf9d3071(#"hash_43d22d2a5ec27460");
	modelscale = radius / 150000;
	circle function_78233d29(#"hash_43d22d2a5ec27460", "", "Scale", modelscale);
	circle setcompassicon("minimap_collapse_ring");
	circle function_a5edb367(#"hash_4964cfaa74d2a1ac");
	circle function_811196d1(0);
	circle function_95bc465d(1);
	circle function_5e00861(0, 1);
	circle function_60212003(1);
	var_70aac56d = radius * 2;
	circle function_5e00861(var_70aac56d, 1);
}

