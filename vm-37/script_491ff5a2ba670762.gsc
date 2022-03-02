#using script_7d712f77ab8d0c16;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\influencers_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace spawning;

/*
	Name: function_d9deb7d7
	Namespace: spawning
	Checksum: 0x18BD4F06
	Offset: 0xB8
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function function_d9deb7d7()
{
	level.var_8a38cf55 = sessionmodeismultiplayergame() || function_f99d2668();
	if(!isdefined(level.var_e1a685a6))
	{
		level.var_e1a685a6 = [];
	}
}

/*
	Name: function_76a18acc
	Namespace: spawning
	Checksum: 0x8AB58CB2
	Offset: 0x118
	Size: 0x2F8
	Parameters: 1
	Flags: Linked
*/
function function_76a18acc(var_8fb24641)
{
	if(!isdefined(var_8fb24641.var_ee89b13f))
	{
		return undefined;
	}
	typename = var_8fb24641.var_ee89b13f;
	var_e1a8ec1c = function_1dbc6a6(typename);
	var_571293f = [];
	foreach(var_8ad31d96 in var_e1a8ec1c)
	{
		team = (isdefined(var_8ad31d96.team) ? var_8ad31d96.team : #"none");
		if(team == #"none")
		{
			continue;
		}
		var_4272167e = (typename + "_") + team;
		if(!isdefined(var_571293f[var_4272167e]))
		{
			spawnfilter = spawnstruct();
			spawnfilter.handle = function_4589fcae(var_4272167e);
			spawnfilter.team = team;
			var_571293f[var_4272167e] = spawnfilter;
		}
		else
		{
			spawnfilter = var_571293f[var_4272167e];
		}
		function_de7ee873(spawnfilter.handle, var_8ad31d96.id);
	}
	foreach(spawnfilter in var_571293f)
	{
		if(isdefined(var_8fb24641.var_a9fb697a))
		{
			spawnfilter.var_a9fb697a = influencers::create_friendly_influencer(var_8fb24641.var_a9fb697a, (0, 0, 0), spawnfilter.team);
			function_964b011(spawnfilter.var_a9fb697a, spawnfilter.handle);
		}
		if(isdefined(var_8fb24641.var_a9fb697a))
		{
			spawnfilter.var_39a3f6e1 = influencers::create_enemy_influencer(var_8fb24641.var_39a3f6e1, (0, 0, 0), spawnfilter.team);
			function_964b011(spawnfilter.var_39a3f6e1, spawnfilter.handle);
		}
	}
}

/*
	Name: function_fbff01ea
	Namespace: spawning
	Checksum: 0xF3C5C40B
	Offset: 0x418
	Size: 0x11A
	Parameters: 0
	Flags: Linked
*/
function function_fbff01ea()
{
	if(!is_true(level.var_8a38cf55))
	{
		return;
	}
	var_8f0eb1d9 = function_fe8b3d2e();
	if(!isdefined(var_8f0eb1d9))
	{
		return;
	}
	var_37b279dd = getscriptbundlelist(var_8f0eb1d9);
	if(!isdefined(var_37b279dd))
	{
		return;
	}
	foreach(var_2354b422 in var_37b279dd)
	{
		spawnfilter = getscriptbundle(var_2354b422);
		var_571293f = function_76a18acc(spawnfilter);
	}
}

/*
	Name: function_9b36f6dc
	Namespace: spawning
	Checksum: 0xB2510697
	Offset: 0x540
	Size: 0x19C
	Parameters: 2
	Flags: Linked
*/
function function_9b36f6dc(spawnfilter, team)
{
	if(team == #"none" || team == #"neutral")
	{
		if(isdefined(spawnfilter.var_a9fb697a))
		{
			enableinfluencer(spawnfilter.var_a9fb697a, 0);
		}
		if(isdefined(spawnfilter.var_39a3f6e1))
		{
			enableinfluencer(spawnfilter.var_39a3f6e1, 0);
		}
		if(isdefined(spawnfilter.var_c9150907))
		{
			enableinfluencer(spawnfilter.var_c9150907, 1);
		}
	}
	else
	{
		if(isdefined(spawnfilter.var_a9fb697a))
		{
			enableinfluencer(spawnfilter.var_a9fb697a, 1);
			function_a32c3352(spawnfilter.var_a9fb697a, team, 0);
		}
		if(isdefined(spawnfilter.var_39a3f6e1))
		{
			enableinfluencer(spawnfilter.var_39a3f6e1, 1);
			function_a32c3352(spawnfilter.var_39a3f6e1, team, 1);
		}
		if(isdefined(spawnfilter.var_c9150907))
		{
			enableinfluencer(spawnfilter.var_c9150907, 0);
		}
	}
}

/*
	Name: function_245cb231
	Namespace: spawning
	Checksum: 0x82D7389F
	Offset: 0x6E8
	Size: 0x304
	Parameters: 2
	Flags: Linked
*/
function function_245cb231(var_8fb24641, objectiveid)
{
	spawnfilter = spawnstruct();
	typename = var_8fb24641.var_ee89b13f;
	spawnfilter.var_e1a8ec1c = function_1dbc6a6(typename);
	if(!isdefined(spawnfilter.var_e1a8ec1c))
	{
		return;
	}
	spawnfilter.handle = function_4589fcae(typename);
	/#
		assert(isdefined(spawnfilter.handle));
	#/
	if(!isdefined(spawnfilter.handle))
	{
		return;
	}
	foreach(var_8ad31d96 in spawnfilter.var_e1a8ec1c)
	{
		function_de7ee873(spawnfilter.handle, var_8ad31d96.id);
	}
	var_7c69bb09 = objective_team(objectiveid);
	if(isdefined(var_8fb24641.var_a9fb697a))
	{
		spawnfilter.var_a9fb697a = influencers::create_friendly_influencer(var_8fb24641.var_a9fb697a, (0, 0, 0), var_7c69bb09);
		function_964b011(spawnfilter.var_a9fb697a, spawnfilter.handle);
	}
	if(isdefined(var_8fb24641.var_39a3f6e1))
	{
		spawnfilter.var_39a3f6e1 = influencers::create_enemy_influencer(var_8fb24641.var_39a3f6e1, (0, 0, 0), var_7c69bb09);
		function_964b011(spawnfilter.var_39a3f6e1, spawnfilter.handle);
	}
	if(isdefined(var_8fb24641.var_c9150907))
	{
		spawnfilter.var_c9150907 = influencers::create_influencer_generic(var_8fb24641.var_c9150907, (0, 0, 0), #"all");
		function_964b011(spawnfilter.var_c9150907, spawnfilter.handle);
	}
	if(isdefined(var_8fb24641.var_1efc9a1c) && isdefined(var_8fb24641.var_f85ab167))
	{
		function_f5c3a4c5(spawnfilter.handle, var_8fb24641.var_f85ab167);
	}
	if(!isdefined(level.var_e1a685a6))
	{
		level.var_e1a685a6 = [];
	}
	level.var_e1a685a6[objectiveid] = spawnfilter;
	function_9b36f6dc(spawnfilter, var_7c69bb09);
}

/*
	Name: function_89e9e213
	Namespace: spawning
	Checksum: 0x6105AF54
	Offset: 0x9F8
	Size: 0x12C
	Parameters: 0
	Flags: None
*/
function function_89e9e213()
{
	if(!isdefined(level.var_e1a685a6) || !level.var_8a38cf55)
	{
		return;
	}
	foreach(spawnfilter in level.var_e1a685a6)
	{
		foreach(var_8ad31d96 in spawnfilter.var_e1a8ec1c)
		{
			function_de7ee873(spawnfilter.handle, var_8ad31d96.id);
		}
	}
}

/*
	Name: function_74cfa0e
	Namespace: spawning
	Checksum: 0x5AE7474D
	Offset: 0xB30
	Size: 0x84
	Parameters: 1
	Flags: Event
*/
event function_74cfa0e(eventstruct)
{
	if(!level.var_8a38cf55)
	{
		return;
	}
	var_2354b422 = function_6fc9795b(eventstruct.objectiveindex);
	if(!isdefined(var_2354b422))
	{
		return;
	}
	spawnfilter = getscriptbundle(var_2354b422);
	function_245cb231(spawnfilter, eventstruct.objectiveindex);
}

/*
	Name: function_8e8c3fcc
	Namespace: spawning
	Checksum: 0x861BFF49
	Offset: 0xBC0
	Size: 0x64
	Parameters: 1
	Flags: Event
*/
event function_8e8c3fcc(eventstruct)
{
	if(!level.var_8a38cf55)
	{
		return;
	}
	spawnfilter = level.var_e1a685a6[eventstruct.objectiveindex];
	if(!isdefined(spawnfilter))
	{
		return;
	}
	function_9b36f6dc(spawnfilter, eventstruct.team);
}

