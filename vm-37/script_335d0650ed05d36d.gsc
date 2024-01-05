#using script_75da5547b1822294;
#using script_3e196d275a6fb180;
#using script_491ff5a2ba670762;
#using script_335d0650ed05d36d;
#using script_44b0b8420eabacad;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\map.gsc;
#using scripts\core_common\influencers_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\oob.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace spawning;

/*
	Name: function_d0149d6b
	Namespace: spawning
	Checksum: 0xD9B0E8CE
	Offset: 0x130
	Size: 0xD4
	Parameters: 0
	Flags: Linked
*/
function function_d0149d6b()
{
	/#
		assert(isdefined(level.spawnsystem));
	#/
	if(!isdefined(level.spawnsystem.var_bfd7cd96))
	{
		level.spawnsystem.var_bfd7cd96 = &function_4fe2525a;
	}
	if(!isdefined(level.supportedspawntypes))
	{
		level.supportedspawntypes = [];
	}
	var_65792f8b = map::get_script_bundle();
	if(isdefined(var_65792f8b) && isdefined(var_65792f8b.var_2feed9e4))
	{
		setdvar(#"spawnsystem_sight_check_max_distance", var_65792f8b.var_2feed9e4);
	}
}

/*
	Name: clear_spawn_points
	Namespace: spawning
	Checksum: 0x80F724D1
	Offset: 0x210
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function clear_spawn_points()
{
}

/*
	Name: function_32b97d1b
	Namespace: spawning
	Checksum: 0x96048AE4
	Offset: 0x220
	Size: 0x4A
	Parameters: 1
	Flags: None
*/
function function_32b97d1b(callbackfunction)
{
	if(!isdefined(level.spawnsystem))
	{
		level.spawnsystem = spawnstruct();
	}
	level.spawnsystem.var_bfd7cd96 = callbackfunction;
}

/*
	Name: function_adbbb58a
	Namespace: spawning
	Checksum: 0xC8E78F02
	Offset: 0x278
	Size: 0x4A
	Parameters: 1
	Flags: None
*/
function function_adbbb58a(callbackfunction)
{
	if(!isdefined(level.spawnsystem))
	{
		level.spawnsystem = spawnstruct();
	}
	level.spawnsystem.var_adbbb58a = callbackfunction;
}

/*
	Name: function_c40af6fa
	Namespace: spawning
	Checksum: 0x89603AB1
	Offset: 0x2D0
	Size: 0x10
	Parameters: 0
	Flags: None
*/
function function_c40af6fa()
{
	level.supportedspawntypes = [];
}

/*
	Name: function_d3d4ff67
	Namespace: spawning
	Checksum: 0xF5E3BCB0
	Offset: 0x2E8
	Size: 0xB2
	Parameters: 1
	Flags: None
*/
function function_d3d4ff67(spawn)
{
	foreach(var_a24ffdcc in level.supportedspawntypes)
	{
		supportedspawntype = var_a24ffdcc.type;
		if(function_82ca1565(spawn, supportedspawntype))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_7309b6b3
	Namespace: spawning
	Checksum: 0xABF928EC
	Offset: 0x3A8
	Size: 0xD2
	Parameters: 1
	Flags: Linked
*/
function function_7309b6b3(spawn)
{
	if(!isdefined(level.supportedspawntypes))
	{
		level.supportedspawntypes = [];
	}
	foreach(var_a24ffdcc in level.supportedspawntypes)
	{
		supportedspawntype = var_a24ffdcc.type;
		if(function_82ca1565(spawn, supportedspawntype))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: addsupportedspawnpointtype
	Namespace: spawning
	Checksum: 0xEAC21CD3
	Offset: 0x488
	Size: 0x8C
	Parameters: 2
	Flags: None
*/
function addsupportedspawnpointtype(spawnpointtype, team)
{
	if(!isdefined(level.supportedspawntypes))
	{
		level.supportedspawntypes = [];
	}
	var_79942a82 = spawnstruct();
	var_79942a82.type = spawnpointtype;
	if(isdefined(team))
	{
		var_79942a82.team = team;
	}
	array::add(level.supportedspawntypes, var_79942a82);
}

/*
	Name: function_b404fc61
	Namespace: spawning
	Checksum: 0xBC068303
	Offset: 0x520
	Size: 0xD2
	Parameters: 1
	Flags: Linked
*/
function function_b404fc61(rawspawns)
{
	if(isdefined(level.spawnsystem.var_adbbb58a))
	{
		validspawns = [];
		foreach(spawn in rawspawns)
		{
			if(![[level.spawnsystem.var_adbbb58a]](spawn))
			{
				validspawns[validspawns.size] = spawn;
			}
		}
		rawspawns = validspawns;
	}
	return rawspawns;
}

/*
	Name: function_4fe2525a
	Namespace: spawning
	Checksum: 0x50F8FDB3
	Offset: 0x600
	Size: 0x22
	Parameters: 0
	Flags: Linked
*/
function function_4fe2525a()
{
	return struct::get_array("mp_spawn_point", "targetname");
}

/*
	Name: function_beae80f9
	Namespace: spawning
	Checksum: 0xB65BC43E
	Offset: 0x630
	Size: 0x294
	Parameters: 1
	Flags: Linked
*/
function function_beae80f9(rawspawns)
{
	rawspawns = function_b404fc61(rawspawns);
	var_2014d551 = [];
	var_f152fde5 = [];
	var_22a1f7c8 = [];
	foreach(spawn in rawspawns)
	{
		if(!isdefined(spawn.group_index))
		{
			spawn.group_index = 0;
		}
		if(!function_7309b6b3(spawn))
		{
			continue;
		}
		if(oob::chr_party(spawn.origin) && territory::is_inside(spawn.origin))
		{
			continue;
		}
		if(!isdefined(var_2014d551[spawn.group_index]))
		{
			var_2014d551[spawn.group_index] = [];
		}
		if(!isdefined(var_f152fde5[spawn.group_index]))
		{
			var_f152fde5[spawn.group_index] = [];
		}
		if(!isdefined(var_22a1f7c8[spawn.group_index]))
		{
			var_22a1f7c8[spawn.group_index] = [];
		}
		if(is_true(spawn._human_were))
		{
			array::add(var_f152fde5[spawn.group_index], spawn);
		}
		else
		{
			array::add(var_2014d551[spawn.group_index], spawn);
		}
		if(is_true(spawn.var_4a7883fa))
		{
			array::add(var_22a1f7c8[spawn.group_index], spawn);
		}
	}
	function_4277fa85(var_2014d551, "auto_normal");
	function_4277fa85(var_f152fde5, "start_spawn");
	function_4277fa85(var_22a1f7c8, "hq");
}

/*
	Name: function_4277fa85
	Namespace: spawning
	Checksum: 0x1EC4CEBF
	Offset: 0x8D0
	Size: 0xF8
	Parameters: 2
	Flags: Linked, Private
*/
function private function_4277fa85(spawnpoints, var_6de73ddb)
{
	spawngroups = getarraykeys(spawnpoints);
	foreach(groupindex in spawngroups)
	{
		function_923afc2e(spawnpoints[groupindex]);
		var_4a4a963a = function_3ea24e49(groupindex);
		addspawnpoints(var_4a4a963a, spawnpoints[groupindex], var_6de73ddb);
	}
}

/*
	Name: addspawns
	Namespace: spawning
	Checksum: 0xF6753E77
	Offset: 0x9D0
	Size: 0xE4
	Parameters: 0
	Flags: None
*/
function addspawns()
{
	clearspawnpoints("auto_normal");
	clearspawnpoints("fallback");
	rawspawns = [[level.spawnsystem.var_bfd7cd96]]();
	if(isdefined(rawspawns))
	{
		function_beae80f9(rawspawns);
	}
	function_100e84f();
	function_fbff01ea();
	calculate_map_center();
	spawnpoint = get_random_intermission_point();
	setdemointermissionpoint(spawnpoint.origin, spawnpoint.angles);
}

/*
	Name: function_b4f071cd
	Namespace: spawning
	Checksum: 0x64E347F2
	Offset: 0xAC0
	Size: 0x1D4
	Parameters: 0
	Flags: None
*/
function function_b4f071cd()
{
	var_ba7cd990 = struct::get(#"hash_3ccb068cc20d10fb");
	var_3ab559fb = struct::get(#"hash_2a16a120d7d497f0");
	if(!isdefined(var_ba7cd990) || !isdefined(var_3ab559fb))
	{
		/#
			println("");
		#/
		return;
	}
	spawns = getspawnpoints("start_spawn", #"allies");
	if(spawns.size == 0)
	{
		/#
			println("");
		#/
		return;
	}
	var_bbd0ce18 = distancesquared(spawns[0].origin, var_ba7cd990.origin);
	var_1f5969dc = distancesquared(spawns[0].origin, var_3ab559fb.origin);
	if(var_bbd0ce18 < var_1f5969dc)
	{
		var_ba7cd990.team = #"allies";
		var_3ab559fb.team = #"axis";
	}
	else
	{
		var_3ab559fb.team = #"allies";
		var_ba7cd990.team = #"axis";
	}
	util::function_c77e4851(var_ba7cd990.team, var_3ab559fb.team);
}

