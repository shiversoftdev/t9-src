#using script_75da5547b1822294;
#using script_7d712f77ab8d0c16;
#using script_335d0650ed05d36d;
#using script_44b0b8420eabacad;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\oob.gsc;
#using scripts\core_common\influencers_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace spawning;

/*
	Name: function_f210e027
	Namespace: spawning
	Checksum: 0x30C4682B
	Offset: 0x188
	Size: 0x40C
	Parameters: 0
	Flags: Linked
*/
function function_f210e027()
{
	level.spawnentitytypes = [];
	array::add(level.spawnentitytypes, {#group_index:0, #spawntype:1, #entityname:"mp_t8_spawn_point", #team:"all"});
	if(level.gametype === #"dom")
	{
		array::add(level.spawnentitytypes, {#group_index:1, #spawntype:1, #entityname:"mp_t8_spawn_point", #team:#"allies"});
		array::add(level.spawnentitytypes, {#group_index:2, #spawntype:1, #entityname:"mp_t8_spawn_point", #team:#"axis"});
	}
	array::add(level.spawnentitytypes, {#group_index:1, #spawntype:1, #entityname:"mp_t8_spawn_point_allies", #team:#"allies"});
	array::add(level.spawnentitytypes, {#group_index:2, #spawntype:1, #entityname:"mp_t8_spawn_point_axis", #team:#"axis"});
	array::add(level.spawnentitytypes, {#hash_b8543545:1, #group_index:2, #spawntype:0, #entityname:"mp_tdm_spawn_axis_start", #team:#"axis"});
	array::add(level.spawnentitytypes, {#hash_b8543545:1, #group_index:1, #spawntype:0, #entityname:"mp_tdm_spawn_allies_start", #team:#"allies"});
	array::add(level.spawnentitytypes, {#hash_b8543545:0, #group_index:0, #spawntype:0, #entityname:"mp_tdm_spawn", #team:#"axis"});
}

/*
	Name: function_361ca7c0
	Namespace: spawning
	Checksum: 0xEBC7759F
	Offset: 0x5A0
	Size: 0x11C
	Parameters: 1
	Flags: Linked
*/
function function_361ca7c0(var_a824fb90)
{
	if(function_5abfedf7("auto_normal"))
	{
		return;
	}
	rawspawns = struct::get_array(var_a824fb90.entityname, "targetname");
	foreach(spawn in rawspawns)
	{
		spawn.group_index = var_a824fb90.group_index;
		spawn.tdm = 1;
		spawn._human_were = (isdefined(var_a824fb90.var_b8543545) ? var_a824fb90.var_b8543545 : 0);
	}
	function_beae80f9(rawspawns);
}

/*
	Name: function_ce9f81ee
	Namespace: spawning
	Checksum: 0x9BAE9733
	Offset: 0x6C8
	Size: 0xE4
	Parameters: 1
	Flags: Linked
*/
function function_ce9f81ee(var_4a1d0f50)
{
	if(function_5abfedf7("auto_normal"))
	{
		return;
	}
	rawspawns = struct::get_array(var_4a1d0f50.entityname, "targetname");
	foreach(spawn in rawspawns)
	{
		spawn.group_index = var_4a1d0f50.group_index;
	}
	function_beae80f9(rawspawns);
}

/*
	Name: function_100e84f
	Namespace: spawning
	Checksum: 0xC06B91EC
	Offset: 0x7B8
	Size: 0x10E
	Parameters: 0
	Flags: Linked
*/
function function_100e84f()
{
	if(!isdefined(level.spawnentitytypes))
	{
		level.spawnentitytypes = [];
	}
	foreach(spawnentitytype in level.spawnentitytypes)
	{
		switch(spawnentitytype.spawntype)
		{
			case 0:
			{
				function_361ca7c0(spawnentitytype);
				break;
			}
			case 1:
			{
				function_ce9f81ee(spawnentitytype);
				break;
			}
			default:
			{
				break;
			}
		}
	}
}

/*
	Name: function_d400d613
	Namespace: spawning
	Checksum: 0x3243369B
	Offset: 0x8D0
	Size: 0x21E
	Parameters: 2
	Flags: None
*/
function function_d400d613(targetname, typesarray)
{
	returnarray = [];
	rawspawns = struct::get_array(targetname, "targetname");
	rawspawns = function_b404fc61(rawspawns);
	foreach(spawn in rawspawns)
	{
		foreach(supportedspawntype in typesarray)
		{
			if(!function_82ca1565(spawn, supportedspawntype))
			{
				continue;
			}
			if(oob::chr_party(spawn.origin) && territory::is_inside(spawn.origin))
			{
				break;
			}
			if(!isdefined(returnarray[supportedspawntype]))
			{
				returnarray[supportedspawntype] = [];
			}
			if(!isdefined(returnarray[supportedspawntype]))
			{
				returnarray[supportedspawntype] = [];
			}
			else if(!isarray(returnarray[supportedspawntype]))
			{
				returnarray[supportedspawntype] = array(returnarray[supportedspawntype]);
			}
			returnarray[supportedspawntype][returnarray[supportedspawntype].size] = spawn;
		}
	}
	return returnarray;
}

