#using script_19367cd29a4485db;
#using script_27347f09888ad15;
#using script_3357acf79ce92f4b;
#using script_3411bb48d41bd3b;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace namespace_ce1f29cc;

/*
	Name: function_b73863e
	Namespace: namespace_ce1f29cc
	Checksum: 0x9F0958AF
	Offset: 0x160
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b73863e()
{
	level notify(1655065346);
}

/*
	Name: function_6b885d72
	Namespace: namespace_ce1f29cc
	Checksum: 0xAB98DD0D
	Offset: 0x180
	Size: 0x2A4
	Parameters: 1
	Flags: Linked
*/
function function_6b885d72(destination)
{
	if(!getdvarint(#"hash_7f960fed9c1533f", 1))
	{
		return;
	}
	/#
		assert(!isdefined(level.var_f804b293));
	#/
	if(!isdefined(level.var_f804b293))
	{
		level.var_f804b293 = [];
	}
	if(!isdefined(level.var_3b4ee947))
	{
		level.var_3b4ee947 = [];
	}
	if(!isdefined(level.var_39b4b1e2))
	{
		level.var_39b4b1e2 = [];
	}
	if(!isdefined(level.var_f5909b7))
	{
		level.var_f5909b7 = [];
	}
	level flag::wait_till(#"hash_39574fd530246717");
	foreach(s_location in destination.locations)
	{
		var_f804b293 = struct::get_array(s_location.targetname, "target");
		var_f804b293 = function_7b8e26b3(var_f804b293, "hotzone", "variantname");
		var_f804b293 = function_61f56bb6(var_f804b293);
		foreach(var_d194d219 in var_f804b293)
		{
			function_4aca4e83(var_d194d219);
			waitframe(1);
		}
		level.var_f804b293 = arraycombine(level.var_f804b293, var_f804b293, 0, 0);
	}
	level flag::clear(#"hash_39574fd530246717");
}

/*
	Name: function_61f56bb6
	Namespace: namespace_ce1f29cc
	Checksum: 0x880686C3
	Offset: 0x430
	Size: 0x292
	Parameters: 1
	Flags: Linked
*/
function function_61f56bb6(var_f804b293)
{
	var_be6053fa = [];
	var_c6d0eb25 = [];
	foreach(var_d194d219 in var_f804b293)
	{
		if(!isdefined(var_d194d219.var_c43420a))
		{
			var_be6053fa[var_be6053fa.size] = var_d194d219;
			continue;
		}
		if(!isdefined(var_c6d0eb25[var_d194d219.var_c43420a]))
		{
			var_c6d0eb25[var_d194d219.var_c43420a] = [];
		}
		else if(!isarray(var_c6d0eb25[var_d194d219.var_c43420a]))
		{
			var_c6d0eb25[var_d194d219.var_c43420a] = array(var_c6d0eb25[var_d194d219.var_c43420a]);
		}
		var_c6d0eb25[var_d194d219.var_c43420a][var_c6d0eb25[var_d194d219.var_c43420a].size] = var_d194d219;
	}
	foreach(group in var_c6d0eb25)
	{
		group = array::randomize(group);
		var_7e24bb5a = group[0].var_d3455e4;
		/#
			assert(var_7e24bb5a <= group.size);
		#/
		for(i = 0; i < var_7e24bb5a; i++)
		{
			var_be6053fa[var_be6053fa.size] = array::pop_front(group, 0);
		}
	}
	if(isdefined(level.var_7d45d0d4.var_994ca8b9))
	{
		var_be6053fa = arraysortclosest(var_be6053fa, level.var_7d45d0d4.var_994ca8b9.origin, undefined, 2000);
	}
	return var_be6053fa;
}

/*
	Name: function_4aca4e83
	Namespace: namespace_ce1f29cc
	Checksum: 0x60572919
	Offset: 0x6D0
	Size: 0x13C
	Parameters: 1
	Flags: Linked
*/
function function_4aca4e83(var_89bd79c0)
{
	tunables = getscriptbundle(var_89bd79c0.scriptbundlename);
	var_89bd79c0.instance = {};
	function_8ff3e9d(var_89bd79c0, tunables);
	function_c43e2960(var_89bd79c0, tunables);
	var_89bd79c0.instance.tier = 1;
	var_89bd79c0.instance.active_ai = [];
	var_89bd79c0.instance.var_4188d7c8 = 0;
	var_89bd79c0.instance.spawned_ai = 0;
	var_89bd79c0.instance.priority = 0;
	var_89bd79c0.instance.var_bb0c9afd = [];
	var_89bd79c0.instance.var_ee69e628 = [];
	var_89bd79c0.instance.var_ac7b2365 = [];
	/#
		var_89bd79c0.instance.var_b4e1804a = [];
	#/
	function_3c977c4f(var_89bd79c0, 0);
}

/*
	Name: function_8ff3e9d
	Namespace: namespace_ce1f29cc
	Checksum: 0x8115F9F6
	Offset: 0x818
	Size: 0x72
	Parameters: 2
	Flags: Linked
*/
function function_8ff3e9d(var_89bd79c0, tunables)
{
	if(!isdefined(var_89bd79c0.var_117ccd5c))
	{
		var_89bd79c0.var_117ccd5c = function_65c306e7(tunables.var_d5ae73b2);
	}
	if(!isdefined(var_89bd79c0.var_192fb9a2))
	{
		var_89bd79c0.var_192fb9a2 = function_65c306e7(tunables.var_1d67b7db);
	}
}

/*
	Name: function_65c306e7
	Namespace: namespace_ce1f29cc
	Checksum: 0x4B580D1E
	Offset: 0x898
	Size: 0x9E
	Parameters: 1
	Flags: Linked
*/
function function_65c306e7(var_71398223)
{
	list = [];
	foreach(struct in var_71398223)
	{
		list[list.size] = struct.ailist;
	}
	return list;
}

/*
	Name: function_c43e2960
	Namespace: namespace_ce1f29cc
	Checksum: 0xDF1D1C71
	Offset: 0x940
	Size: 0x54C
	Parameters: 2
	Flags: Linked
*/
function function_c43e2960(var_89bd79c0, tunables)
{
	if(isdefined(var_89bd79c0.instance.initial_spawn_points) && isdefined(var_89bd79c0.instance.var_d9c7b945))
	{
		return;
	}
	if(!isdefined(var_89bd79c0.var_9b178666))
	{
		var_89bd79c0.var_9b178666 = var_89bd79c0.radius;
	}
	spawn_points = struct::get_array(var_89bd79c0.targetname, "target");
	initial_spawn_points = function_7b8e26b3(spawn_points, "hotzone_spawn_point_initial", "variantname");
	function_ba8b8ba3(initial_spawn_points);
	initial_spawn_points = function_3759eaa0(var_89bd79c0, initial_spawn_points, (isdefined(tunables.var_e4de985f) ? tunables.var_e4de985f : 0) + ((isdefined(tunables.var_e4de985f) ? tunables.var_e4de985f : 0) * (isdefined(tunables.var_4dc06056) ? tunables.var_4dc06056 : 0) * 3));
	var_d9c7b945 = function_7b8e26b3(spawn_points, "hotzone_spawn_point_hot", "variantname");
	function_ba8b8ba3(var_d9c7b945);
	var_d9c7b945 = function_3759eaa0(var_89bd79c0, var_d9c7b945, (isdefined(tunables.var_783fc5e) ? tunables.var_783fc5e : 0));
	var_89bd79c0.instance.initial_spawn_points = array::randomize(initial_spawn_points);
	var_89bd79c0.instance.var_d9c7b945 = array::randomize(var_d9c7b945);
	var_89bd79c0.instance.var_968f26a5 = [];
	foreach(spawn_point in var_89bd79c0.instance.initial_spawn_points)
	{
		if(isdefined(spawn_point.aitype))
		{
			if(!isdefined(var_89bd79c0.instance.var_968f26a5[spawn_point.aitype]))
			{
				var_89bd79c0.instance.var_968f26a5[spawn_point.aitype] = 0;
			}
		}
	}
	foreach(spawn_point in var_89bd79c0.instance.var_d9c7b945)
	{
		if(isdefined(spawn_point.aitype))
		{
			if(!isdefined(var_89bd79c0.instance.var_968f26a5[spawn_point.aitype]))
			{
				var_89bd79c0.instance.var_968f26a5[spawn_point.aitype] = 0;
			}
		}
	}
	var_89bd79c0.instance.var_f2be2673 = [];
	foreach(spawn_point in var_89bd79c0.instance.initial_spawn_points)
	{
		if(isdefined(spawn_point.archetype))
		{
			if(!isdefined(var_89bd79c0.instance.var_f2be2673[spawn_point.archetype]))
			{
				var_89bd79c0.instance.var_f2be2673[spawn_point.archetype] = 0;
			}
		}
	}
	foreach(spawn_point in var_89bd79c0.instance.var_d9c7b945)
	{
		if(isdefined(spawn_point.archetype))
		{
			if(!isdefined(var_89bd79c0.instance.var_f2be2673[spawn_point.archetype]))
			{
				var_89bd79c0.instance.var_f2be2673[spawn_point.archetype] = 0;
			}
		}
	}
}

/*
	Name: function_ba8b8ba3
	Namespace: namespace_ce1f29cc
	Checksum: 0x227B57A9
	Offset: 0xE98
	Size: 0xC6
	Parameters: 1
	Flags: Linked
*/
function function_ba8b8ba3(&spawn_points)
{
	foreach(point in spawn_points)
	{
		if(point.var_90d0c0ff === #"hash_2f639d4c8601817f")
		{
			point.var_90d0c0ff = undefined;
		}
		if(point.archetype === #"hash_2f639d4c8601817f")
		{
			point.archetype = undefined;
		}
	}
}

/*
	Name: function_3759eaa0
	Namespace: namespace_ce1f29cc
	Checksum: 0x30AC50FD
	Offset: 0xF68
	Size: 0x14A
	Parameters: 3
	Flags: Linked
*/
function function_3759eaa0(var_89bd79c0, var_9b694d6c, var_36a2355b)
{
	if(var_9b694d6c.size <= var_36a2355b)
	{
		if(!is_true(var_89bd79c0.var_19e89e4e))
		{
			var_53911b23 = namespace_85745671::function_e4791424(var_89bd79c0.origin, var_36a2355b - var_9b694d6c.size, var_89bd79c0.var_48d0f926, var_89bd79c0.var_9b178666, var_89bd79c0.var_243d78a7, 0, 1);
		}
		else
		{
			var_53911b23 = namespace_85745671::function_7a1b21f6(var_89bd79c0.origin, var_89bd79c0.angles, var_36a2355b - var_9b694d6c.size, var_89bd79c0.var_499035e2, var_89bd79c0.var_81314a61, var_89bd79c0.var_48d0f926, 0, 1);
		}
		/#
			if(!isarray(var_53911b23))
			{
				println("" + var_89bd79c0.target);
			}
		#/
		if(!isdefined(var_53911b23))
		{
			var_53911b23 = [];
		}
		var_9b694d6c = arraycombine(var_9b694d6c, var_53911b23, 0, 0);
	}
	return var_9b694d6c;
}

/*
	Name: function_617f5d43
	Namespace: namespace_ce1f29cc
	Checksum: 0x35D7100B
	Offset: 0x10C0
	Size: 0x27C
	Parameters: 1
	Flags: Linked
*/
function function_617f5d43(params)
{
	if(!getdvarint(#"hash_7f960fed9c1533f", 1))
	{
		return;
	}
	level notify(#"hash_1a8453d57fb3fe48");
	level flag::wait_till_clear("update_hotzone_states");
	level flag::set("deactivate_hotzones");
	/#
		assert(isdefined(params.destination), "");
	#/
	/#
		assert(isarray(params.destination.locations), "");
	#/
	foreach(s_location in params.destination.locations)
	{
		var_f804b293 = struct::get_array(s_location.targetname, "target");
		var_f804b293 = function_7b8e26b3(var_f804b293, "variantname", "hotzone");
		foreach(var_d194d219 in var_f804b293)
		{
			function_ea2997e4(var_d194d219);
			waitframe(1);
		}
	}
	level.var_f804b293 = undefined;
	level.var_3b4ee947 = undefined;
	level flag::clear("deactivate_hotzones");
}

/*
	Name: function_ea2997e4
	Namespace: namespace_ce1f29cc
	Checksum: 0x91E9F29
	Offset: 0x1348
	Size: 0xE2
	Parameters: 1
	Flags: Linked
*/
function function_ea2997e4(var_89bd79c0)
{
	if(is_true(var_89bd79c0.instance.var_4188d7c8))
	{
		function_e5786b9a(var_89bd79c0);
	}
	foreach(ai in var_89bd79c0.instance.active_ai)
	{
		if(isdefined(ai))
		{
			ai delete();
		}
	}
	var_89bd79c0.instance = undefined;
}

/*
	Name: function_3c977c4f
	Namespace: namespace_ce1f29cc
	Checksum: 0xF68E2104
	Offset: 0x1438
	Size: 0x1FE
	Parameters: 2
	Flags: Linked
*/
function function_3c977c4f(var_d194d219, state)
{
	if(var_d194d219.instance.current_state !== state)
	{
		var_d194d219.instance.spawn_point_index = 0;
		var_d194d219.instance.tier = level.var_f534e0;
		/#
			if(getdvarint(#"hash_15ed4f1fab002e20", 0))
			{
				var_d194d219.instance.tier = getdvarint(#"hash_15ed4f1fab002e20", 0);
			}
		#/
		var_d194d219.instance.var_1fb426c4 = get_max_active_ai(var_d194d219.scriptbundlename, state);
		var_d194d219.instance.var_735d3a6b = function_d0e4a026(var_d194d219.scriptbundlename);
		var_29459a31 = function_47ae367f(var_d194d219, var_d194d219.instance.tier, state);
		if(isdefined(var_29459a31))
		{
			if(!isdefined(var_d194d219.instance.var_bb0c9afd[state]))
			{
				var_d194d219.instance.var_bb0c9afd[state] = namespace_679a22ba::function_77be8a83(var_29459a31);
			}
		}
		var_d194d219.instance.var_d36a24ed = var_d194d219.instance.var_bb0c9afd[state];
		var_d194d219.instance.var_98957c00 = undefined;
		if(var_d194d219.instance.current_state === 2)
		{
			var_d194d219.instance.var_ee69e628 = [];
		}
	}
	var_d194d219.instance.current_state = state;
}

/*
	Name: function_fac3e87c
	Namespace: namespace_ce1f29cc
	Checksum: 0xF5F40595
	Offset: 0x1640
	Size: 0x10E
	Parameters: 0
	Flags: None
*/
function function_fac3e87c()
{
	if(!isdefined(level.var_f804b293))
	{
		/#
			println("");
		#/
		return [];
	}
	spawns = [];
	foreach(var_d194d219 in level.var_f804b293)
	{
		if(!isdefined(var_d194d219.targetname))
		{
			continue;
		}
		spawn_points = struct::get_array(var_d194d219.targetname, "target");
		spawns = arraycombine(spawn_points, spawns);
	}
	return spawns;
}

/*
	Name: function_e24de31c
	Namespace: namespace_ce1f29cc
	Checksum: 0x8BDD4475
	Offset: 0x1758
	Size: 0x130
	Parameters: 1
	Flags: None
*/
function function_e24de31c(params)
{
	if(!getdvarint(#"hash_7f960fed9c1533f", 1))
	{
		return;
	}
	level notify(#"hash_1a8453d57fb3fe48");
	foreach(var_d194d219 in level.var_f804b293)
	{
		if(is_true(var_d194d219.instance.var_4188d7c8))
		{
			function_e5786b9a(var_d194d219);
		}
		function_fb4091d0(var_d194d219);
		function_3c977c4f(var_d194d219, 3);
	}
}

/*
	Name: function_368a7cde
	Namespace: namespace_ce1f29cc
	Checksum: 0x7387C48B
	Offset: 0x1890
	Size: 0xB8
	Parameters: 0
	Flags: Linked
*/
function function_368a7cde()
{
	if(!getdvarint(#"hash_7f960fed9c1533f", 1))
	{
		return;
	}
	foreach(var_d194d219 in level.var_f804b293)
	{
		function_87f604a(var_d194d219);
	}
}

/*
	Name: function_c981b20b
	Namespace: namespace_ce1f29cc
	Checksum: 0x99DB44F0
	Offset: 0x1950
	Size: 0xF0
	Parameters: 2
	Flags: Linked
*/
function function_c981b20b(origin, radius)
{
	if(!getdvarint(#"hash_7f960fed9c1533f", 1))
	{
		return;
	}
	var_ea21a801 = function_72d3bca6(level.var_f804b293, origin, undefined, 0, radius);
	foreach(var_d194d219 in var_ea21a801)
	{
		function_87f604a(var_d194d219);
	}
}

/*
	Name: function_12c2f41f
	Namespace: namespace_ce1f29cc
	Checksum: 0xFF4DCD1
	Offset: 0x1A48
	Size: 0x148
	Parameters: 2
	Flags: Linked
*/
function function_12c2f41f(origin, radius)
{
	if(!getdvarint(#"hash_7f960fed9c1533f", 1))
	{
		return;
	}
	level notify(#"hash_1a8453d57fb3fe48");
	var_ea21a801 = function_72d3bca6(level.var_f804b293, origin, undefined, 0, radius);
	foreach(var_d194d219 in var_ea21a801)
	{
		function_ea2997e4(var_d194d219);
		arrayremovevalue(level.var_3b4ee947, var_d194d219);
		arrayremovevalue(level.var_f804b293, var_d194d219);
	}
}

/*
	Name: function_87f604a
	Namespace: namespace_ce1f29cc
	Checksum: 0xD75F9144
	Offset: 0x1B98
	Size: 0x9C
	Parameters: 1
	Flags: Linked
*/
function function_87f604a(var_d194d219)
{
	level notify(#"hash_1a8453d57fb3fe48");
	var_d194d219.instance.disabled = 1;
	function_3c977c4f(var_d194d219, 0);
	if(is_true(var_d194d219.instance.var_4188d7c8))
	{
		function_e5786b9a(var_d194d219);
	}
	function_fb4091d0(var_d194d219);
}

/*
	Name: function_fca72198
	Namespace: namespace_ce1f29cc
	Checksum: 0x88CD2260
	Offset: 0x1C40
	Size: 0xB8
	Parameters: 0
	Flags: Linked
*/
function function_fca72198()
{
	if(!getdvarint(#"hash_7f960fed9c1533f", 1))
	{
		return;
	}
	foreach(var_d194d219 in level.var_f804b293)
	{
		function_33cf33f9(var_d194d219);
	}
}

/*
	Name: function_1724f4ac
	Namespace: namespace_ce1f29cc
	Checksum: 0x8A077B11
	Offset: 0x1D00
	Size: 0xF0
	Parameters: 2
	Flags: Linked
*/
function function_1724f4ac(origin, radius)
{
	if(!getdvarint(#"hash_7f960fed9c1533f", 1))
	{
		return;
	}
	var_ea21a801 = function_72d3bca6(level.var_f804b293, origin, undefined, 0, radius);
	foreach(var_d194d219 in var_ea21a801)
	{
		function_33cf33f9(var_d194d219);
	}
}

/*
	Name: function_33cf33f9
	Namespace: namespace_ce1f29cc
	Checksum: 0xA4A12452
	Offset: 0x1DF8
	Size: 0x32
	Parameters: 1
	Flags: Linked
*/
function function_33cf33f9(var_d194d219)
{
	level notify(#"hash_1a8453d57fb3fe48");
	var_d194d219.instance.disabled = undefined;
}

/*
	Name: function_15bf0b91
	Namespace: namespace_ce1f29cc
	Checksum: 0x9B59D0E6
	Offset: 0x1E38
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function function_15bf0b91(tier)
{
	level.var_f534e0 = tier;
}

/*
	Name: add_archetype_spawn_function
	Namespace: namespace_ce1f29cc
	Checksum: 0x2349D318
	Offset: 0x1E60
	Size: 0x5E
	Parameters: 2
	Flags: Linked
*/
function add_archetype_spawn_function(archetype, func)
{
	if(!isdefined(level.var_f5909b7[archetype]))
	{
		level.var_f5909b7[archetype] = [];
	}
	level.var_f5909b7[archetype][level.var_f5909b7[archetype].size] = func;
}

/*
	Name: function_ddccdffa
	Namespace: namespace_ce1f29cc
	Checksum: 0xAE364634
	Offset: 0x1EC8
	Size: 0x64
	Parameters: 2
	Flags: None
*/
function function_ddccdffa(archetype, func)
{
	if(!isdefined(level.var_f5909b7[archetype]))
	{
		level.var_f5909b7[archetype] = [];
	}
	arrayremovevalue(level.var_f5909b7[archetype], func);
}

/*
	Name: get_max_active_ai
	Namespace: namespace_ce1f29cc
	Checksum: 0xE6111204
	Offset: 0x1F38
	Size: 0x112
	Parameters: 2
	Flags: Linked
*/
function get_max_active_ai(var_f4a682a0, state)
{
	tunables = getscriptbundle(var_f4a682a0);
	var_1fb426c4 = 0;
	if(state == 1)
	{
		var_1fb426c4 = namespace_679a22ba::function_b9ea4226((isdefined(tunables.var_e4de985f) ? tunables.var_e4de985f : 0), (isdefined(tunables.var_4dc06056) ? tunables.var_4dc06056 : 0));
	}
	else if(state == 2)
	{
		var_1fb426c4 = namespace_679a22ba::function_b9ea4226((isdefined(tunables.var_b8fc9deb) ? tunables.var_b8fc9deb : 0), (isdefined(tunables.var_a1208a9a) ? tunables.var_a1208a9a : 0));
	}
	return var_1fb426c4;
}

/*
	Name: function_d0e4a026
	Namespace: namespace_ce1f29cc
	Checksum: 0x9435BE6D
	Offset: 0x2058
	Size: 0x82
	Parameters: 1
	Flags: Linked
*/
function function_d0e4a026(var_f4a682a0)
{
	tunables = getscriptbundle(var_f4a682a0);
	return namespace_679a22ba::function_b9ea4226((isdefined(tunables.var_735d3a6b) ? tunables.var_735d3a6b : 0), (isdefined(tunables.var_d961aeb3) ? tunables.var_d961aeb3 : 0));
}

/*
	Name: function_47ae367f
	Namespace: namespace_ce1f29cc
	Checksum: 0x3CB20F69
	Offset: 0x20E8
	Size: 0xDE
	Parameters: 3
	Flags: Linked
*/
function function_47ae367f(var_d194d219, tier, state)
{
	if(state == 1)
	{
		index = int(min(var_d194d219.var_117ccd5c.size - 1, tier - 1));
		return var_d194d219.var_117ccd5c[index];
	}
	if(state == 2)
	{
		index = int(min(var_d194d219.var_192fb9a2.size - 1, tier - 1));
		return var_d194d219.var_192fb9a2[index];
	}
}

/*
	Name: function_6d39329f
	Namespace: namespace_ce1f29cc
	Checksum: 0x20D3D38F
	Offset: 0x21D0
	Size: 0x58
	Parameters: 2
	Flags: Linked
*/
function function_6d39329f(var_d194d219, state)
{
	if(state == 1)
	{
		return var_d194d219.instance.initial_spawn_points;
	}
	if(state == 2)
	{
		return var_d194d219.instance.var_d9c7b945;
	}
}

/*
	Name: function_6b51cc65
	Namespace: namespace_ce1f29cc
	Checksum: 0x42AA7A30
	Offset: 0x2230
	Size: 0xFA
	Parameters: 3
	Flags: Linked
*/
function function_6b51cc65(&var_e592e473, var_8437e990, aitype)
{
	var_2a3ffa2e = function_7b8e26b3(var_e592e473, aitype, "aitype");
	if(var_2a3ffa2e.size)
	{
		for(i = 0; i < var_2a3ffa2e.size; i++)
		{
			var_8437e990.var_968f26a5[aitype] = (var_8437e990.var_968f26a5[aitype] + 1) % var_2a3ffa2e.size;
			spawn_point = var_2a3ffa2e[var_8437e990.var_968f26a5[aitype]];
			if(getplayers(undefined, spawn_point.origin, 256).size)
			{
				continue;
			}
			/#
				assert(isdefined(spawn_point));
			#/
			return spawn_point;
		}
	}
}

/*
	Name: function_1e745fc0
	Namespace: namespace_ce1f29cc
	Checksum: 0x41FA5106
	Offset: 0x2338
	Size: 0xFA
	Parameters: 3
	Flags: Linked
*/
function function_1e745fc0(&var_e592e473, var_8437e990, archetype)
{
	var_630a610f = function_7b8e26b3(var_e592e473, archetype, "archetype");
	if(var_630a610f.size)
	{
		for(i = 0; i < var_630a610f.size; i++)
		{
			var_8437e990.var_f2be2673[archetype] = (var_8437e990.var_f2be2673[archetype] + 1) % var_630a610f.size;
			spawn_point = var_630a610f[var_8437e990.var_f2be2673[archetype]];
			if(getplayers(undefined, spawn_point.origin, 256).size)
			{
				continue;
			}
			/#
				assert(isdefined(spawn_point));
			#/
			return spawn_point;
		}
	}
}

/*
	Name: function_89116a1e
	Namespace: namespace_ce1f29cc
	Checksum: 0xA1EA2AB6
	Offset: 0x2440
	Size: 0x18A
	Parameters: 3
	Flags: Linked
*/
function function_89116a1e(&var_e592e473, var_8437e990, aitype)
{
	if(isdefined(aitype))
	{
		spawn_point = function_6b51cc65(var_e592e473, var_8437e990, aitype);
		if(isdefined(spawn_point))
		{
			return spawn_point;
		}
		archetype = getarchetypefromclassname(aitype);
		spawn_point = function_1e745fc0(var_e592e473, var_8437e990, archetype);
		if(isdefined(spawn_point))
		{
			return spawn_point;
		}
	}
	for(i = 0; i < var_e592e473.size; i++)
	{
		var_8437e990.spawn_point_index = (var_8437e990.spawn_point_index + 1) % var_e592e473.size;
		spawn_point = var_e592e473[var_8437e990.spawn_point_index];
		if(getplayers(undefined, spawn_point.origin, 256).size || (isdefined(aitype) && isdefined(spawn_point.var_90d0c0ff) && !function_ee71d10f(aitype, spawn_point.var_90d0c0ff)))
		{
			continue;
		}
		/#
			assert(isdefined(spawn_point));
		#/
		return spawn_point;
	}
	return array::random(var_e592e473);
}

/*
	Name: function_ffbebde3
	Namespace: namespace_ce1f29cc
	Checksum: 0x35C60F11
	Offset: 0x25D8
	Size: 0x4AC
	Parameters: 1
	Flags: Linked
*/
function function_ffbebde3(&var_f804b293)
{
	level endon(#"hash_1a8453d57fb3fe48");
	/#
		if(is_true(level.var_70da9652.var_780e31de))
		{
			return;
		}
	#/
	foreach(var_d194d219 in var_f804b293)
	{
		var_d194d219.instance.var_8fa06b8e = 0;
		/#
			var_d194d219.instance.var_19b23216 = [];
		#/
	}
	players = getplayers();
	fake_players = [];
	foreach(player in players)
	{
		fake_players[fake_players.size] = {#angles:player.angles, #origin:player.origin};
	}
	foreach(var_d194d219 in var_f804b293)
	{
		if(var_d194d219.instance.current_state == 3 || is_true(var_d194d219.instance.disabled))
		{
			continue;
		}
		var_1414fb7f = function_72d3bca6(fake_players, var_d194d219.origin, undefined, undefined, 10000);
		if(!var_1414fb7f.size)
		{
			continue;
		}
		proximity = function_3e21a60b(var_d194d219, var_1414fb7f);
		/#
			var_d194d219.instance.var_19b23216[#"proximity"] = proximity;
		#/
		var_d194d219.instance.var_8fa06b8e = var_d194d219.instance.var_8fa06b8e + proximity;
		facing = function_b6a93fcd(var_d194d219, var_1414fb7f);
		/#
			var_d194d219.instance.var_19b23216[#"facing"] = facing;
		#/
		var_d194d219.instance.var_8fa06b8e = var_d194d219.instance.var_8fa06b8e + facing;
		state = function_df47d6e7(var_d194d219);
		/#
			var_d194d219.instance.var_19b23216[#"state"] = state;
		#/
		var_d194d219.instance.var_8fa06b8e = var_d194d219.instance.var_8fa06b8e + state;
		waitframe(1);
	}
	for(index = 0; index < var_f804b293.size; index++)
	{
		var_d194d219 = var_f804b293[index];
		var_d194d219.instance.priority = var_d194d219.instance.var_8fa06b8e;
		var_d194d219.instance.var_8fa06b8e = undefined;
		/#
			var_d194d219.instance.var_b4e1804a = var_d194d219.instance.var_19b23216;
			var_d194d219.instance.var_19b23216 = undefined;
		#/
	}
	array::function_b63fcb3(var_f804b293, &function_d4dbf960);
}

/*
	Name: function_d4dbf960
	Namespace: namespace_ce1f29cc
	Checksum: 0x77B5EB58
	Offset: 0x2A90
	Size: 0x38
	Parameters: 2
	Flags: Linked, Private
*/
function private function_d4dbf960(left, right)
{
	return right.instance.priority < left.instance.priority;
}

/*
	Name: function_3e21a60b
	Namespace: namespace_ce1f29cc
	Checksum: 0x5A719211
	Offset: 0x2AD0
	Size: 0x1DC
	Parameters: 2
	Flags: Linked
*/
function function_3e21a60b(var_d194d219, &player_array)
{
	score = 0;
	radius = var_d194d219.radius;
	radiussq = sqr(radius);
	for(player_index = player_array.size - 1; player_index >= 0; player_index--)
	{
		player = player_array[player_index];
		if(player.origin[2] > var_d194d219.origin[2] && player.origin[2] < (var_d194d219.origin[2] + var_d194d219.height) && distance2dsquared(player.origin, var_d194d219.origin) <= radiussq)
		{
			score = score + 100;
			continue;
		}
		if(player.origin[2] > (var_d194d219.origin[2] - 2000) && player.origin[2] < ((var_d194d219.origin[2] + var_d194d219.height) + 2000))
		{
			score = score + mapfloat(radius, 10000, 100, 0, distance2d(player.origin, var_d194d219.origin));
		}
	}
	return score;
}

/*
	Name: function_b6a93fcd
	Namespace: namespace_ce1f29cc
	Checksum: 0xDA529AF1
	Offset: 0x2CB8
	Size: 0x168
	Parameters: 2
	Flags: Linked
*/
function function_b6a93fcd(var_d194d219, &player_array)
{
	score = 0;
	fov = cos(45);
	foreach(player in player_array)
	{
		normal = vectornormalize(var_d194d219.origin - player.origin);
		forward = anglestoforward(player.angles);
		dot = vectordot(forward, normal);
		if(dot < fov)
		{
			continue;
		}
		score = score + mapfloat(fov, 1, 0, 25, dot);
	}
	return score;
}

/*
	Name: function_df47d6e7
	Namespace: namespace_ce1f29cc
	Checksum: 0xE29E21A0
	Offset: 0x2E28
	Size: 0x78
	Parameters: 1
	Flags: Linked
*/
function function_df47d6e7(var_d194d219)
{
	if(var_d194d219.instance.current_state == 2)
	{
		if(!isdefined(var_d194d219.instance.var_ac7b2365[#"chase"]))
		{
			return 50;
		}
		return 400;
	}
	if(var_d194d219.instance.current_state == 1)
	{
		return 30;
	}
	return 0;
}

/*
	Name: function_5edfba39
	Namespace: namespace_ce1f29cc
	Checksum: 0x597ED90C
	Offset: 0x2EA8
	Size: 0x588
	Parameters: 0
	Flags: Linked
*/
function function_5edfba39()
{
	if(!getdvarint(#"hash_7f960fed9c1533f", 1))
	{
		return;
	}
	level endon(#"game_ended");
	while(true)
	{
		level flag::clear("update_hotzone_states");
		waitframe(1);
		level flag::wait_till_clear("deactivate_hotzones");
		if(!(isdefined(level.var_f804b293) && isdefined(level.var_3b4ee947)))
		{
			continue;
		}
		level flag::set("update_hotzone_states");
		var_d8ee487e = [];
		function_ffbebde3(level.var_f804b293);
		waitframe(1);
		if(!isdefined(level.var_f804b293))
		{
			continue;
		}
		for(index = 0; index < level.var_f804b293.size; index++)
		{
			var_d194d219 = level.var_f804b293[index];
			if(var_d8ee487e.size >= getdvarint(#"hash_7c3872b765911891", 4))
			{
				break;
			}
			if(is_true(var_d194d219.instance.var_4188d7c8))
			{
				function_e5786b9a(var_d194d219);
				function_a3ad37ef(var_d194d219);
			}
			if(var_d194d219.instance.current_state == 3 || is_true(var_d194d219.instance.disabled))
			{
				continue;
			}
			var_d8ee487e[var_d8ee487e.size] = var_d194d219;
		}
		waitframe(1);
		foreach(var_d194d219 in var_d8ee487e)
		{
			switch(var_d194d219.instance.current_state)
			{
				case 0:
				{
					function_3c977c4f(var_d194d219, 1);
					break;
				}
				case 1:
				{
					if(function_64a303c6(var_d194d219))
					{
						function_3c977c4f(var_d194d219, 2);
					}
					break;
				}
				case 2:
				{
					if(function_64a303c6(var_d194d219) || function_e923faaf(var_d194d219))
					{
						var_d194d219.instance.var_c80ba91c = undefined;
					}
					else
					{
						if(isdefined(var_d194d219.instance.var_c80ba91c) && var_d194d219.instance.var_c80ba91c < gettime())
						{
							function_3c977c4f(var_d194d219, 1);
							function_947f6f99(var_d194d219);
						}
						else if(!isdefined(var_d194d219.instance.var_c80ba91c))
						{
							var_d194d219.instance.var_c80ba91c = gettime() + (int(10 * 1000));
						}
					}
					break;
				}
			}
			if(isinarray(level.var_3b4ee947, var_d194d219))
			{
				arrayremovevalue(level.var_3b4ee947, var_d194d219, 0);
			}
		}
		foreach(var_d194d219 in level.var_3b4ee947)
		{
			if(is_true(var_d194d219.instance.disabled))
			{
				continue;
			}
			switch(var_d194d219.instance.current_state)
			{
				case 1:
				case 2:
				{
					function_fb4091d0(var_d194d219);
					function_3c977c4f(var_d194d219, 0);
					break;
				}
			}
		}
		level.var_3b4ee947 = var_d8ee487e;
	}
}

/*
	Name: function_9e0aba37
	Namespace: namespace_ce1f29cc
	Checksum: 0x1E71A4C0
	Offset: 0x3438
	Size: 0x4FC
	Parameters: 0
	Flags: Linked
*/
function function_9e0aba37()
{
	if(!getdvarint(#"hash_7f960fed9c1533f", 1))
	{
		return;
	}
	level endon(#"game_ended");
	level.var_71c1e90a = 0;
	while(true)
	{
		waitframe(1);
		if(getaicount() >= getailimit() || !isdefined(level.var_3b4ee947))
		{
			continue;
		}
		level flag::wait_till(#"spawn_zombies");
		foreach(var_d194d219 in level.var_3b4ee947)
		{
			instance = var_d194d219.instance;
			if(is_true(var_d194d219.instance.var_4188d7c8))
			{
				function_e5786b9a(var_d194d219);
				function_a3ad37ef(var_d194d219);
			}
			if(!level flag::get(#"spawn_zombies"))
			{
				break;
			}
			if(is_true(instance.var_98957c00) || instance.spawned_ai >= instance.var_735d3a6b || (instance.current_state == 1 && level.var_71c1e90a >= 30))
			{
				continue;
			}
			if(instance.active_ai.size < instance.var_1fb426c4)
			{
				var_944250d2 = spawn_ai(var_d194d219);
				if(!isdefined(var_944250d2))
				{
					continue;
				}
				instance.active_ai[instance.active_ai.size] = var_944250d2;
				namespace_679a22ba::function_266ee075(var_944250d2.var_29459a31, var_944250d2.var_89592ba7);
				instance.spawned_ai++;
				if(var_d194d219.instance.current_state == 1)
				{
					var_944250d2.var_722e942 = 1;
					level.var_71c1e90a++;
					var_13a8c4ed = instance.active_ai.size;
					foreach(ai in instance.active_ai)
					{
						if(is_true(ai.var_f3723430))
						{
							var_13a8c4ed--;
						}
					}
					if(var_13a8c4ed >= instance.var_1fb426c4)
					{
						instance.var_98957c00 = 1;
					}
				}
				else if(var_d194d219.instance.current_state == 2)
				{
					if(var_d194d219.instance.var_ee69e628.size)
					{
						var_32ba732d = array::randomize(var_d194d219.instance.var_ee69e628);
						for(i = 0; i < var_32ba732d.size; i++)
						{
							if(!isalive(var_32ba732d[i].entity))
							{
								continue;
							}
							event = {#position:var_32ba732d[i].entity.origin, #type:0};
							var_944250d2 callback::function_d8abfc3d(#"hash_790882ac8688cee5", &function_a007a803, undefined, array(event, var_32ba732d[i].entity));
							break;
						}
					}
				}
				break;
			}
		}
	}
}

/*
	Name: spawn_ai
	Namespace: namespace_ce1f29cc
	Checksum: 0x9F983C2B
	Offset: 0x3940
	Size: 0x40A
	Parameters: 1
	Flags: Linked
*/
function spawn_ai(var_d194d219)
{
	/#
		assert(var_d194d219.instance.current_state == 1 || var_d194d219.instance.current_state == 2, "");
	#/
	instance = var_d194d219.instance;
	var_29459a31 = function_47ae367f(var_d194d219, instance.tier, instance.current_state);
	var_e592e473 = function_6d39329f(var_d194d219, instance.current_state);
	if(!var_e592e473.size)
	{
		return undefined;
	}
	spawn_info = namespace_679a22ba::function_ca209564(var_29459a31, instance.var_d36a24ed);
	if(!isdefined(spawn_info))
	{
		return;
	}
	spawn_point = function_89116a1e(var_e592e473, instance, spawn_info.var_990b33df);
	var_944250d2 = spawnactor(spawn_info.var_990b33df, spawn_point.origin, spawn_point.angles, undefined, 1);
	if(isdefined(var_944250d2))
	{
		var_944250d2.spawn_point = spawn_point;
		var_944250d2.var_29459a31 = spawn_info.var_29459a31;
		var_944250d2.var_89592ba7 = instance.var_d36a24ed;
		var_944250d2.var_341387d5 = var_d194d219.origin;
		var_944250d2.var_b518f045 = 3000;
		var_944250d2.var_c37d7f3b = 4000;
		var_944250d2.var_d194d219 = var_d194d219;
		if(isdefined(spawn_point.var_90d0c0ff) && function_ee71d10f(spawn_info.var_990b33df, spawn_point.var_90d0c0ff))
		{
			var_944250d2.var_c9b11cb3 = spawn_point.var_90d0c0ff;
		}
		var_944250d2 callback::function_d8abfc3d(#"on_ai_killed", &function_2b886fac, undefined, [0:var_d194d219]);
		var_944250d2 callback::function_d8abfc3d(#"on_entity_deleted", &function_95899b5c, undefined, [0:var_d194d219]);
		var_944250d2 callback::function_d8abfc3d(#"hash_7d2e38b28c894e5a", &function_95899b5c, undefined, [0:var_d194d219]);
		var_944250d2 callback::function_d8abfc3d(#"hash_4afe635f36531659", &function_18c143e6);
		var_944250d2 callback::function_d8abfc3d(#"hash_540e54ba804a87b9", &function_527d149a);
		var_944250d2 thread function_8967ab54();
		if(isarray(level.var_f5909b7[var_944250d2.archetype]))
		{
			foreach(func in level.var_f5909b7[var_944250d2.archetype])
			{
				var_944250d2 [[func]]();
			}
		}
	}
	return var_944250d2;
}

/*
	Name: function_fb4091d0
	Namespace: namespace_ce1f29cc
	Checksum: 0x789F60F8
	Offset: 0x3D58
	Size: 0x1B0
	Parameters: 2
	Flags: Linked
*/
function function_fb4091d0(var_d194d219, &var_e1e8316f)
{
	if(!isdefined(var_e1e8316f))
	{
		var_e1e8316f = undefined;
	}
	if(!isdefined(var_e1e8316f))
	{
		var_e1e8316f = &var_d194d219.instance.active_ai;
	}
	foreach(ai in var_e1e8316f)
	{
		if(isalive(ai) && !is_true(ai.var_f3723430))
		{
			if(isdefined(level.var_7d45d0d4.var_3385b421) && distance2dsquared(ai.origin, level.var_7d45d0d4.var_3385b421.origin) <= sqr(2000))
			{
				ai thread namespace_85745671::function_b7e28ade(level.var_7d45d0d4.var_3385b421.origin, 2000);
				continue;
			}
			ai.var_f3723430 = 1;
			ai callback::callback(#"hash_10ab46b52df7967a");
		}
	}
}

/*
	Name: function_947f6f99
	Namespace: namespace_ce1f29cc
	Checksum: 0x72036FEF
	Offset: 0x3F10
	Size: 0x32C
	Parameters: 1
	Flags: Linked
*/
function function_947f6f99(var_d194d219)
{
	instance = var_d194d219.instance;
	var_3d1dc91f = function_47ae367f(var_d194d219, instance.tier, 2);
	var_d21da46f = function_47ae367f(var_d194d219, instance.tier, 1);
	var_c794a75 = [];
	if(var_3d1dc91f !== var_d21da46f)
	{
		var_8d31964e = namespace_679a22ba::function_3e7317ca(var_3d1dc91f);
		var_77391339 = namespace_679a22ba::function_3e7317ca(var_d21da46f);
		var_ea96ab6d = array::exclude(var_8d31964e, var_77391339);
		if(var_ea96ab6d.size > 0)
		{
			foreach(ai in var_d194d219.instance.active_ai)
			{
				if(isinarray(var_ea96ab6d, hash(ai.aitype)))
				{
					if(!isdefined(var_c794a75))
					{
						var_c794a75 = [];
					}
					else if(!isarray(var_c794a75))
					{
						var_c794a75 = array(var_c794a75);
					}
					var_c794a75[var_c794a75.size] = ai;
				}
			}
		}
	}
	var_a9c2ddd5 = 0;
	var_c21cdef8 = int(get_max_active_ai(var_d194d219.scriptbundlename, 1));
	var_a9c2ddd5 = max(0, (var_d194d219.instance.active_ai.size - var_c21cdef8) - var_c794a75.size);
	for(i = 0; var_a9c2ddd5 > 0 && i < var_d194d219.instance.active_ai.size; i++)
	{
		if(!isinarray(var_c794a75, var_d194d219.instance.active_ai[i]))
		{
			var_c794a75[var_c794a75.size] = var_d194d219.instance.active_ai[i];
			var_a9c2ddd5 = var_a9c2ddd5 - 1;
		}
	}
	function_fb4091d0(var_d194d219, var_c794a75);
}

/*
	Name: function_418ab095
	Namespace: namespace_ce1f29cc
	Checksum: 0xC1B1B856
	Offset: 0x4248
	Size: 0x22C
	Parameters: 2
	Flags: Linked
*/
function function_418ab095(ai, var_d194d219)
{
	ai callback::function_d8abfc3d(#"on_ai_killed", &function_2b886fac, undefined, [0:var_d194d219]);
	ai callback::function_d8abfc3d(#"on_entity_deleted", &function_95899b5c, undefined, [0:var_d194d219]);
	ai callback::function_d8abfc3d(#"hash_7d2e38b28c894e5a", &function_95899b5c, undefined, [0:var_d194d219]);
	ai callback::function_d8abfc3d(#"hash_4afe635f36531659", &function_18c143e6);
	ai callback::function_d8abfc3d(#"hash_540e54ba804a87b9", &function_527d149a);
	ai.var_d194d219 = var_d194d219;
	ai function_18c143e6();
	if(ai.current_state.name === #"chase" && isdefined(ai.favoriteenemy) && ai.favoriteenemy.team !== level.zombie_team)
	{
		self function_11efa003(var_d194d219, ai.favoriteenemy);
	}
	else
	{
		ai thread function_8967ab54();
	}
	var_d194d219.instance.active_ai[var_d194d219.instance.active_ai.size] = ai;
	if(ai.var_722e942 === 1)
	{
		level.var_71c1e90a++;
	}
}

/*
	Name: function_2b886fac
	Namespace: namespace_ce1f29cc
	Checksum: 0xF031F249
	Offset: 0x4480
	Size: 0x1C6
	Parameters: 3
	Flags: Linked
*/
function function_2b886fac(params, var_d194d219, var_679c4943)
{
	if(!isdefined(var_679c4943))
	{
		var_679c4943 = 0;
	}
	var_d194d219.instance.var_4188d7c8 = 1;
	if(is_true(self.var_8f7ba187))
	{
		return;
	}
	self function_527d149a();
	if(self.var_722e942 === 1 && !is_true(self.var_39f7f68))
	{
		level.var_71c1e90a--;
		self.var_39f7f68 = 1;
	}
	var_26b5ea9d = var_679c4943;
	if(!var_26b5ea9d && isdefined(self.var_813a079f))
	{
		var_26b5ea9d = self [[self.var_813a079f]](params, var_d194d219);
	}
	else if(!var_26b5ea9d && isdefined(params) && !isplayer(params.eattacker) && (isdefined(self.var_29459a31) && isdefined(self.var_89592ba7)) && !is_true(self.var_7a68cd0c))
	{
		var_26b5ea9d = 1;
	}
	if(var_26b5ea9d)
	{
		namespace_679a22ba::function_898aced0(self.var_29459a31, self.var_89592ba7);
		var_d194d219.instance.spawned_ai--;
		var_d194d219.instance.var_98957c00 = 0;
	}
	self.var_8f7ba187 = 1;
}

/*
	Name: function_95899b5c
	Namespace: namespace_ce1f29cc
	Checksum: 0xBFC8B4BE
	Offset: 0x4650
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function function_95899b5c(var_d194d219)
{
	function_2b886fac(undefined, var_d194d219, 1);
}

/*
	Name: function_a007a803
	Namespace: namespace_ce1f29cc
	Checksum: 0x20A99F2
	Offset: 0x4688
	Size: 0xB4
	Parameters: 3
	Flags: Linked
*/
function function_a007a803(params, event, enemy)
{
	if(isalive(enemy))
	{
		event.position = enemy.origin;
	}
	awareness::function_1db27761(self, event);
	self.var_3eaac485 = gettime() + (int(3 * 1000));
	self callback::function_52ac9652(#"hash_790882ac8688cee5", &function_a007a803);
}

/*
	Name: function_18c143e6
	Namespace: namespace_ce1f29cc
	Checksum: 0x6CBDE691
	Offset: 0x4748
	Size: 0xA6
	Parameters: 1
	Flags: Linked
*/
function function_18c143e6(params)
{
	if(!isdefined(self.var_d194d219.instance))
	{
		return;
	}
	if(!isdefined(self.var_d194d219.instance.var_ac7b2365[self.current_state.name]))
	{
		self.var_d194d219.instance.var_ac7b2365[self.current_state.name] = 0;
	}
	self.var_d194d219.instance.var_ac7b2365[self.current_state.name]++;
}

/*
	Name: function_527d149a
	Namespace: namespace_ce1f29cc
	Checksum: 0xB5E2274D
	Offset: 0x47F8
	Size: 0xEC
	Parameters: 1
	Flags: Linked
*/
function function_527d149a(params)
{
	if(!isdefined(self.var_d194d219.instance))
	{
		return;
	}
	if(!isdefined(self.var_d194d219.instance.var_ac7b2365[self.current_state.name]))
	{
		return;
	}
	self.var_d194d219.instance.var_ac7b2365[self.current_state.name]--;
	if(self.var_d194d219.instance.var_ac7b2365[self.current_state.name] <= 0)
	{
		arrayremoveindex(self.var_d194d219.instance.var_ac7b2365, self.current_state.name, 1);
	}
}

/*
	Name: function_e923faaf
	Namespace: namespace_ce1f29cc
	Checksum: 0xCA6FCBD3
	Offset: 0x48F0
	Size: 0xE2
	Parameters: 1
	Flags: Linked
*/
function function_e923faaf(var_d194d219)
{
	var_be320827 = [1:#"idle", 0:#"wander"];
	foreach(__ in var_d194d219.instance.var_ac7b2365)
	{
		if(!isinarray(var_be320827, key))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_8967ab54
	Namespace: namespace_ce1f29cc
	Checksum: 0xE65CC0F5
	Offset: 0x49E0
	Size: 0x9C
	Parameters: 0
	Flags: Linked
*/
function function_8967ab54()
{
	self notify("4b25305a52bb139c");
	self endon("4b25305a52bb139c");
	self endon(#"death", #"deleted");
	level endon(#"game_ended");
	waitresult = undefined;
	waitresult = self waittill(#"hash_151828d1d5e024ee");
	self function_11efa003(self.var_d194d219, waitresult.enemy);
}

/*
	Name: function_11efa003
	Namespace: namespace_ce1f29cc
	Checksum: 0xD1361516
	Offset: 0x4A88
	Size: 0xBE
	Parameters: 2
	Flags: Linked
*/
function function_11efa003(var_d194d219, enemy)
{
	if(!isdefined(var_d194d219.instance.var_ee69e628[enemy getentitynumber()]))
	{
		var_d194d219.instance.var_ee69e628[enemy getentitynumber()] = {#entity:enemy, #count:0};
		/#
			var_d194d219.instance.var_ee69e628[enemy getentitynumber()].entities = [];
		#/
	}
}

/*
	Name: function_e5786b9a
	Namespace: namespace_ce1f29cc
	Checksum: 0xD5BE7F63
	Offset: 0x4B50
	Size: 0x3E
	Parameters: 1
	Flags: Linked
*/
function function_e5786b9a(var_d194d219)
{
	function_1eaaceab(var_d194d219.instance.active_ai);
	var_d194d219.instance.var_4188d7c8 = 0;
}

/*
	Name: function_a3ad37ef
	Namespace: namespace_ce1f29cc
	Checksum: 0xB8DE4F2B
	Offset: 0x4B98
	Size: 0x14C
	Parameters: 1
	Flags: Linked
*/
function function_a3ad37ef(var_d194d219)
{
	if(!isdefined(var_d194d219.instance.var_d36a24ed))
	{
		return;
	}
	if(var_d194d219.instance.active_ai.size)
	{
		return;
	}
	if(!is_true(var_d194d219.instance.var_98957c00) && var_d194d219.instance.spawned_ai < var_d194d219.instance.var_735d3a6b)
	{
		spawn_list = function_47ae367f(var_d194d219, var_d194d219.instance.tier, var_d194d219.instance.current_state);
		var_b47234f1 = namespace_679a22ba::function_ce65eab6(var_d194d219.instance.var_d36a24ed);
		if(var_b47234f1.var_cffbc08 == -1 || var_b47234f1.spawned < var_b47234f1.var_cffbc08)
		{
			return;
		}
	}
	function_3c977c4f(var_d194d219, 3);
}

/*
	Name: function_64a303c6
	Namespace: namespace_ce1f29cc
	Checksum: 0x4A5F7C3
	Offset: 0x4CF0
	Size: 0x10E
	Parameters: 1
	Flags: Linked
*/
function function_64a303c6(var_d194d219)
{
	if(!var_d194d219.instance.active_ai.size || !getplayers(undefined, var_d194d219.origin, 3000).size)
	{
		return false;
	}
	foreach(ai in var_d194d219.instance.active_ai)
	{
		if(isdefined(ai.current_state) && ai.current_state.name == #"chase")
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_ee71d10f
	Namespace: namespace_ce1f29cc
	Checksum: 0xC1D53B28
	Offset: 0x4E08
	Size: 0x8A
	Parameters: 2
	Flags: Linked
*/
function function_ee71d10f(aitype, alias)
{
	if(!isdefined(level.var_39b4b1e2[alias]))
	{
		level.var_39b4b1e2[alias] = [];
	}
	if(!isdefined(level.var_39b4b1e2[alias][aitype]))
	{
		level.var_39b4b1e2[alias][aitype] = function_c4cb6239(aitype, alias);
	}
	return level.var_39b4b1e2[alias][aitype];
}

/*
	Name: function_9b928fad
	Namespace: namespace_ce1f29cc
	Checksum: 0xA9A3138F
	Offset: 0x4EA0
	Size: 0xCBC
	Parameters: 0
	Flags: None
*/
function function_9b928fad()
{
	/#
		if(!getdvarint(#"hash_7f960fed9c1533f", 1))
		{
			return;
		}
		while(!canadddebugcommand())
		{
			waitframe(1);
		}
		level.var_70da9652 = {};
		function_5ac4dc99("", 0);
		function_5ac4dc99("", "");
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand("");
		var_46903069 = (isdefined(var_46903069) ? var_46903069 : -1) + 1;
		adddebugcommand((((("" + "") + "") + var_46903069) + "") + "");
		var_46903069++;
		var_46903069 = (isdefined(var_46903069) ? var_46903069 : -1) + 1;
		adddebugcommand((((("" + "") + "") + var_46903069) + "") + "");
		var_46903069 = (isdefined(var_46903069) ? var_46903069 : -1) + 1;
		adddebugcommand((((("" + "") + "") + var_46903069) + "") + "");
		var_46903069 = (isdefined(var_46903069) ? var_46903069 : -1) + 1;
		adddebugcommand((((("" + "") + "") + var_46903069) + "") + "");
		var_46903069 = (isdefined(var_46903069) ? var_46903069 : -1) + 1;
		adddebugcommand(((((("" + "") + "") + var_46903069) + "") + "") + "");
		var_46903069 = (isdefined(var_46903069) ? var_46903069 : -1) + 1;
		adddebugcommand(((((("" + "") + "") + var_46903069) + "") + "") + "");
		var_46903069 = (isdefined(var_46903069) ? var_46903069 : -1) + 1;
		adddebugcommand(((((("" + "") + "") + var_46903069) + "") + "") + "");
		var_46903069 = (isdefined(var_46903069) ? var_46903069 : -1) + 1;
		adddebugcommand(((((("" + "") + "") + var_46903069) + "") + "") + "");
		var_46903069 = (isdefined(var_46903069) ? var_46903069 : -1) + 1;
		adddebugcommand(((((("" + "") + "") + var_46903069) + "") + "") + "");
		var_46903069 = (isdefined(var_46903069) ? var_46903069 : -1) + 1;
		adddebugcommand(((((("" + "") + "") + var_46903069) + "") + "") + "");
		var_46903069 = (isdefined(var_46903069) ? var_46903069 : -1) + 1;
		adddebugcommand(((((("" + "") + "") + var_46903069) + "") + "") + "");
		var_525602a9 = (isdefined(var_525602a9) ? var_525602a9 : -1) + 1;
		adddebugcommand((((("" + "") + "") + var_525602a9) + "") + "");
		var_525602a9 = (isdefined(var_525602a9) ? var_525602a9 : -1) + 1;
		adddebugcommand((((("" + "") + "") + var_525602a9) + "") + "");
		var_525602a9 = (isdefined(var_525602a9) ? var_525602a9 : -1) + 1;
		adddebugcommand(((((("" + "") + "") + var_525602a9) + "") + "") + "");
		var_525602a9 = (isdefined(var_525602a9) ? var_525602a9 : -1) + 1;
		adddebugcommand(((((("" + "") + "") + var_525602a9) + "") + "") + "");
		var_525602a9 = (isdefined(var_525602a9) ? var_525602a9 : -1) + 1;
		adddebugcommand(((((("" + "") + "") + var_525602a9) + "") + "") + "");
		var_525602a9 = (isdefined(var_525602a9) ? var_525602a9 : -1) + 1;
		adddebugcommand(((((("" + "") + "") + var_525602a9) + "") + "") + "");
		var_525602a9 = (isdefined(var_525602a9) ? var_525602a9 : -1) + 1;
		adddebugcommand(((((("" + "") + "") + var_525602a9) + "") + "") + "");
		var_525602a9 = (isdefined(var_525602a9) ? var_525602a9 : -1) + 1;
		adddebugcommand(((((("" + "") + "") + var_525602a9) + "") + "") + "");
		var_525602a9 = (isdefined(var_525602a9) ? var_525602a9 : -1) + 1;
		adddebugcommand(((((("" + "") + "") + var_525602a9) + "") + "") + "");
		var_525602a9 = (isdefined(var_525602a9) ? var_525602a9 : -1) + 1;
		adddebugcommand(((((("" + "") + "") + var_525602a9) + "") + "") + "");
		var_525602a9 = (isdefined(var_525602a9) ? var_525602a9 : -1) + 1;
		adddebugcommand(((((("" + "") + "") + var_525602a9) + "") + "") + "");
		var_525602a9 = (isdefined(var_525602a9) ? var_525602a9 : -1) + 1;
		adddebugcommand(((((("" + "") + "") + var_525602a9) + "") + "") + "");
		var_525602a9 = (isdefined(var_525602a9) ? var_525602a9 : -1) + 1;
		adddebugcommand(((((("" + "") + "") + var_525602a9) + "") + "") + "");
		var_525602a9 = (isdefined(var_525602a9) ? var_525602a9 : -1) + 1;
		adddebugcommand(((((("" + "") + "") + var_525602a9) + "") + "") + "");
		var_525602a9 = (isdefined(var_525602a9) ? var_525602a9 : -1) + 1;
		adddebugcommand(((((("" + "") + "") + var_525602a9) + "") + "") + "");
		var_525602a9 = (isdefined(var_525602a9) ? var_525602a9 : -1) + 1;
		adddebugcommand(((((("" + "") + "") + var_525602a9) + "") + "") + "");
		var_525602a9 = (isdefined(var_525602a9) ? var_525602a9 : -1) + 1;
		adddebugcommand(((((("" + "") + "") + var_525602a9) + "") + "") + "");
		function_cd140ee9("", &function_3fbd8696);
		function_cd140ee9("", &function_542b33bf);
	#/
}

/*
	Name: function_3fbd8696
	Namespace: namespace_ce1f29cc
	Checksum: 0xA28062BA
	Offset: 0x5B68
	Size: 0xC2
	Parameters: 1
	Flags: None
*/
function function_3fbd8696(dvar)
{
	/#
		switch(dvar.value)
		{
			case 0:
			{
				level notify(#"hash_7ef679d3b9fffd3f");
				break;
			}
			case 1:
			{
				level thread function_3de1c8ac(&function_c3eed624);
				break;
			}
			case 2:
			{
				level thread function_3de1c8ac(&function_bf876de8);
				break;
			}
		}
	#/
}

/*
	Name: function_542b33bf
	Namespace: namespace_ce1f29cc
	Checksum: 0xD41E8904
	Offset: 0x5C38
	Size: 0x7FC
	Parameters: 1
	Flags: None
*/
function function_542b33bf(dvar)
{
	/#
		switch(dvar.value)
		{
			case "hash_35a3b819e2c0441d":
			{
				level.var_70da9652.var_4b72bf24 = !is_true(level.var_70da9652.var_4b72bf24);
				break;
			}
			case "hash_1a6ac45da64a952e":
			{
				level.var_70da9652.var_42f5dda4 = !is_true(level.var_70da9652.var_42f5dda4);
				break;
			}
			case "hash_4a89612f4c29723c":
			{
				level.var_70da9652.var_22a4a482 = !is_true(level.var_70da9652.var_22a4a482);
				break;
			}
			case "hash_9980be38b90805c":
			{
				level.var_70da9652.var_5ff49272 = !is_true(level.var_70da9652.var_5ff49272);
				break;
			}
			case "hash_70840771b862a3e":
			{
				level.var_70da9652.var_4bff9c78 = !is_true(level.var_70da9652.var_4bff9c78);
				break;
			}
			case "hash_2bf9ed47f334d3d6":
			{
				level.var_70da9652.var_b3795227 = !is_true(level.var_70da9652.var_b3795227);
				break;
			}
			case "hash_2d98dc88067eb39b":
			{
				level.var_70da9652.var_3eef4d41 = !is_true(level.var_70da9652.var_3eef4d41);
				break;
			}
			case "hash_2bdd64b5fe882d98":
			{
				level.var_70da9652.var_4e02b047 = !is_true(level.var_70da9652.var_4e02b047);
				break;
			}
			case "hash_46b8b4503ce24c31":
			{
				level.var_70da9652.var_26ba38c4 = !is_true(level.var_70da9652.var_26ba38c4);
				break;
			}
			case "hash_7ba17de60e0b4f0d":
			{
				level.var_70da9652.var_5cdd46ee = !is_true(level.var_70da9652.var_5cdd46ee);
				break;
			}
			case "hash_45c58b02a981f2bd":
			{
				level.var_70da9652.var_419cf6f8 = !is_true(level.var_70da9652.var_419cf6f8);
				break;
			}
			case "hash_759ea2f57b13650e":
			{
				level.var_70da9652.var_780e31de = !is_true(level.var_70da9652.var_780e31de);
				if(is_true(level.var_70da9652.var_780e31de))
				{
					level.var_70da9652.var_2269342d = {};
					foreach(player in getplayers())
					{
						if(!isdefined(level.var_70da9652.var_2269342d.player_info))
						{
							level.var_70da9652.var_2269342d.player_info = [];
						}
						else if(!isarray(level.var_70da9652.var_2269342d.player_info))
						{
							level.var_70da9652.var_2269342d.player_info = array(level.var_70da9652.var_2269342d.player_info);
						}
						level.var_70da9652.var_2269342d.player_info[level.var_70da9652.var_2269342d.player_info.size] = {#angles:player.angles, #origin:player.origin};
					}
				}
				else
				{
					level.var_70da9652.var_2269342d = undefined;
				}
				break;
			}
			case "hash_5401bac31bdc67":
			case "hash_18e3d1b23392828e":
			{
				level.var_70da9652.var_c5d20e33 = dvar.value;
				break;
			}
			case "hash_4f3a0e609d3f7e2b":
			{
				function_bc437ca0();
				break;
			}
			case "hash_125f47c25f63a021":
			{
				function_e24de31c();
				break;
			}
			case "hash_155d8615abc8b3f5":
			{
				spawns = function_fac3e87c();
				level thread namespace_420b39d3::function_46997bdf(&spawns, "");
				break;
			}
			case "hash_635a7b13408b9567":
			{
				spawns = function_fac3e87c();
				namespace_420b39d3::function_70e877d7(&spawns);
				break;
			}
			case "hash_2a330edd1205dc06":
			{
				level.var_70da9652.var_bf84a5e9 = !is_true(level.var_70da9652.var_bf84a5e9);
				break;
			}
			case "hash_6832c8f3ef9fb279":
			{
				level.var_70da9652.var_cb0c00c7 = !is_true(level.var_70da9652.var_cb0c00c7);
				break;
			}
			case "hash_7f507f57d1cfb17":
			{
				level.var_70da9652.var_9da890d8 = !is_true(level.var_70da9652.var_9da890d8);
				break;
			}
			case "hash_278df421cdf19ebe":
			{
				level.var_70da9652.var_bd4a2cac = !is_true(level.var_70da9652.var_bd4a2cac);
			}
			default:
			{
				break;
			}
		}
		if(dvar.value != "")
		{
			setdvar(dvar.name, "");
		}
	#/
}

/*
	Name: function_bc437ca0
	Namespace: namespace_ce1f29cc
	Checksum: 0x7441167F
	Offset: 0x6440
	Size: 0xC0
	Parameters: 0
	Flags: None
*/
function function_bc437ca0()
{
	/#
		waittillframeend();
		level notify(#"hash_1a8453d57fb3fe48");
		foreach(var_d194d219 in level.var_f804b293)
		{
			function_ea2997e4(var_d194d219);
			function_4aca4e83(var_d194d219);
		}
	#/
}

/*
	Name: function_d78228f7
	Namespace: namespace_ce1f29cc
	Checksum: 0xA07C74B4
	Offset: 0x6508
	Size: 0x6A
	Parameters: 0
	Flags: None
*/
function function_d78228f7()
{
	/#
		level.var_70da9652.var_b74207be = getdvarint(#"hash_3de4c46e91e294cc", 0);
		level.var_70da9652.var_84a7284e = getdvarint(#"hash_3558c135587c5d42", 0);
	#/
}

/*
	Name: function_c3eed624
	Namespace: namespace_ce1f29cc
	Checksum: 0xAD65D191
	Offset: 0x6580
	Size: 0x22
	Parameters: 0
	Flags: None
*/
function function_c3eed624()
{
	/#
		return getplayers()[0].origin;
	#/
}

/*
	Name: function_bf876de8
	Namespace: namespace_ce1f29cc
	Checksum: 0xCFF4A002
	Offset: 0x65B0
	Size: 0x166
	Parameters: 0
	Flags: None
*/
function function_bf876de8()
{
	/#
		player = getplayers()[0];
		direction = player getplayerangles();
		direction_vec = anglestoforward(direction);
		eye = player geteye();
		direction_vec = (direction_vec[0] * 20000, direction_vec[1] * 20000, direction_vec[2] * 20000);
		trace = bullettrace(eye, eye + direction_vec, 0, undefined);
		circle(trace[#"position"], 16, (1, 0.5, 0), 1, 1, 1);
		debugstar(trace[#"position"], 1, (1, 0.5, 0));
		return trace[#"position"];
	#/
}

/*
	Name: function_3de1c8ac
	Namespace: namespace_ce1f29cc
	Checksum: 0xE210F202
	Offset: 0x6720
	Size: 0x3EE
	Parameters: 1
	Flags: None
*/
function function_3de1c8ac(var_2da12984)
{
	/#
		level endon(#"game_ended", #"hash_7ef679d3b9fffd3f");
		self notify("");
		self endon("");
		while(true)
		{
			waitframe(1);
			if(!isdefined(level.var_f804b293))
			{
				continue;
			}
			function_d78228f7();
			origin = getplayers()[0].origin;
			options = level.var_70da9652;
			var_3bd2fa1f = arraysortclosest(level.var_f804b293, [[var_2da12984]](), options.var_b74207be);
			var_f804b293 = level.var_f804b293;
			if(isdefined(options.var_c5d20e33))
			{
				if(options.var_c5d20e33 === "")
				{
					function_c981b20b([[var_2da12984]](), 2000);
				}
				else
				{
					function_1724f4ac([[var_2da12984]](), 2000);
				}
				level.var_70da9652.var_c5d20e33 = undefined;
			}
			foreach(var_d194d219 in level.var_f804b293)
			{
				scale = 0.7;
				distance = distance(var_d194d219.origin, origin);
				if(distance > 400)
				{
					scale = distance * 0.002;
				}
				if(!isinarray(var_3bd2fa1f, var_d194d219))
				{
					function_a5ea005d(var_d194d219, index, scale);
					continue;
				}
				function_1a530376(var_d194d219, index, scale);
			}
			if(isarray(options.var_2269342d.player_info))
			{
				foreach(info in options.var_2269342d.player_info)
				{
					function_af647be2(info);
				}
			}
			if(is_true(options.var_bf84a5e9))
			{
				scale = 0.85;
				offset = 75;
				debug2dtext((105, offset * scale, 0), "" + level.var_71c1e90a, (1, 1, 0), undefined, vectorscale((1, 1, 1), 0.4), 0.9, scale);
				offset = offset + 22;
			}
		}
	#/
}

/*
	Name: function_a5ea005d
	Namespace: namespace_ce1f29cc
	Checksum: 0x83AF1EEB
	Offset: 0x6B18
	Size: 0xEC
	Parameters: 3
	Flags: None
*/
function function_a5ea005d(var_d194d219, array_index, scale)
{
	/#
		index = 0;
		options = level.var_70da9652;
		var_a7c842b3 = function_6320ae1d(var_d194d219, options);
		if(is_true(options.var_419cf6f8))
		{
			index = function_af798ce8(index, scale, 1, var_a7c842b3, array_index, var_d194d219);
			return;
		}
		line(var_d194d219.origin, var_d194d219.origin + vectorscale((0, 0, 1), 300), var_a7c842b3, 1);
	#/
}

/*
	Name: function_1a530376
	Namespace: namespace_ce1f29cc
	Checksum: 0xE7202BC9
	Offset: 0x6C10
	Size: 0x634
	Parameters: 3
	Flags: None
*/
function function_1a530376(var_d194d219, array_index, scale)
{
	/#
		index = 0;
		options = level.var_70da9652;
		var_a7c842b3 = function_6320ae1d(var_d194d219, options);
		debugstar(var_d194d219.origin, 1, var_a7c842b3);
		if(is_true(options.var_419cf6f8))
		{
			index = function_af798ce8(index, scale, 1, var_a7c842b3, array_index, var_d194d219);
		}
		print3d(var_d194d219.origin + (0, 0, index), (function_89a74781(var_d194d219) + "") + var_d194d219.instance.tier, var_a7c842b3, 1, scale * 0.8, 1);
		index = index + ((17 * scale) * 0.8);
		print3d(var_d194d219.origin + (0, 0, index), function_9e72a96(var_d194d219.scriptbundlename), var_a7c842b3, 1, scale * 1, 1);
		index = index + ((17 * scale) * 1);
		print3d(var_d194d219.origin + (0, 0, index), (is_true(var_d194d219.instance.disabled) ? "" : ""), (is_true(var_d194d219.instance.disabled) ? (1, 0, 1) : (0, 1, 1)), 1, scale * 1, 1);
		index = index + ((17 * scale) * 1);
		if(is_true(options.var_5cdd46ee))
		{
			index = function_42926dcf(index, scale, 1, var_d194d219);
		}
		if(is_true(options.var_4e02b047))
		{
			index = function_d937ea12(index, scale, 1, var_a7c842b3, var_d194d219, options);
		}
		if(is_true(options.var_9da890d8))
		{
			index = function_11ba669e(index, scale, 1, var_a7c842b3, var_d194d219, options);
		}
		if(is_true(options.var_bd4a2cac))
		{
			index = function_22dd41d8(index, scale, 1, var_a7c842b3, var_d194d219, options);
		}
		if(is_true(options.var_4b72bf24))
		{
			function_9c8936c1(var_d194d219.instance.initial_spawn_points, var_d194d219.origin, (0, 1, 1));
		}
		if(is_true(options.var_42f5dda4))
		{
			function_9c8936c1(var_d194d219.instance.var_d9c7b945, var_d194d219.origin, (1, 0, 0));
		}
		if(is_true(options.var_5ff49272))
		{
			draw_cylinder(var_d194d219.origin, var_d194d219.radius, var_d194d219.height, (1, 0, 1), 1);
		}
		if(is_true(options.var_4bff9c78))
		{
			if(var_d194d219.instance.current_state !== 0)
			{
				draw_cylinder(var_d194d219.origin, 3000, var_d194d219.height, (1, 0.5, 0), 1);
			}
		}
		if(is_true(options.var_b3795227))
		{
			if(var_d194d219.instance.current_state !== 0)
			{
				draw_cylinder(var_d194d219.origin, 4000, var_d194d219.height, vectorscale((1, 1, 1), 0.4), 1);
			}
		}
		if(is_true(options.var_3eef4d41) && !is_true(var_d194d219.var_19e89e4e))
		{
			draw_cylinder(var_d194d219.origin, var_d194d219.var_9b178666, var_d194d219.var_48d0f926, (1, 1, 0), 1);
		}
		else if(is_true(options.var_3eef4d41) && is_true(var_d194d219.var_19e89e4e))
		{
			draw_box(var_d194d219.origin, var_d194d219.angles, var_d194d219.var_499035e2, var_d194d219.var_81314a61, var_d194d219.var_48d0f926, (1, 1, 0));
		}
	#/
}

/*
	Name: function_af798ce8
	Namespace: namespace_ce1f29cc
	Checksum: 0xFC3F828C
	Offset: 0x7250
	Size: 0x310
	Parameters: 6
	Flags: None
*/
function function_af798ce8(index, scale, alpha, color, var_5ab1a705, var_d194d219)
{
	/#
		if(!var_d194d219.instance.priority)
		{
			line(var_d194d219.origin, var_d194d219.origin + vectorscale((0, 0, 1), 300), color);
			return index;
		}
		print3d(var_d194d219.origin + (0, 0, index), "" + var_d194d219.instance.priority, color, alpha, scale * 1, 1);
		index = index + ((17 * scale) * 1);
		foreach(value in var_d194d219.instance.var_b4e1804a)
		{
			print3d(var_d194d219.origin + (0, 0, index), (function_9e72a96(key) + "") + value, color, alpha, scale * 1, 1);
			index = index + ((17 * scale) * 1);
		}
		if(!level.var_f804b293[0].instance.priority)
		{
			var_2a5f3b00 = mapfloat(0, level.var_f804b293.size, 0, 1, var_5ab1a705);
		}
		else
		{
			var_2a5f3b00 = mapfloat(0, level.var_f804b293[0].instance.priority, 0, 1, var_d194d219.instance.priority);
		}
		height = 300 + (1000 * var_2a5f3b00);
		line(var_d194d219.origin, var_d194d219.origin + (0, 0, height), color);
		print3d(var_d194d219.origin + (0, 0, height), var_5ab1a705, color, 1, scale * 2);
		return index;
	#/
}

/*
	Name: function_d937ea12
	Namespace: namespace_ce1f29cc
	Checksum: 0x63D4CDE9
	Offset: 0x7570
	Size: 0x58E
	Parameters: 6
	Flags: None
*/
function function_d937ea12(index, scale, alpha, color, var_d194d219, options)
{
	/#
		var_29459a31 = function_47ae367f(var_d194d219, var_d194d219.instance.tier, var_d194d219.instance.current_state);
		print3d(var_d194d219.origin + (0, 0, index), "" + (is_true(var_d194d219.instance.var_98957c00) ? "" : ""), color, alpha, scale * 0.75, 1);
		index = index + ((17 * scale) * 0.75);
		print3d(var_d194d219.origin + (0, 0, index), "" + (is_true(var_d194d219.instance.var_4188d7c8) ? "" : ""), color, alpha, scale * 0.75, 1);
		index = index + ((17 * scale) * 0.75);
		print3d(var_d194d219.origin + (0, 0, index), (("" + var_d194d219.instance.active_ai.size) + "") + var_d194d219.instance.var_1fb426c4, color, alpha, scale * 0.75, 1);
		index = index + ((17 * scale) * 0.75);
		print3d(var_d194d219.origin + (0, 0, index), (("" + var_d194d219.instance.spawned_ai) + "") + var_d194d219.instance.var_735d3a6b, color, alpha, scale * 0.75, 1);
		index = index + ((17 * scale) * 0.75);
		index = index + ((17 * scale) * 0.75);
		if(isdefined(var_d194d219.instance.var_d36a24ed))
		{
			spawn_info = namespace_679a22ba::function_ce65eab6(var_d194d219.instance.var_d36a24ed);
			print3d(var_d194d219.origin + (0, 0, index), (("" + spawn_info.spawned) + "") + (spawn_info.var_cffbc08 == -1 ? "" : spawn_info.var_cffbc08), color, alpha, scale * 0.75, 1);
			index = index + ((17 * scale) * 0.75);
			if(is_true(options.var_26ba38c4))
			{
				for(i = var_d194d219.instance.var_d36a24ed.var_7c88c117.size - 1; i >= 0; i--)
				{
					entry = var_d194d219.instance.var_d36a24ed.var_7c88c117[i];
					print3d(var_d194d219.origin + (0, 0, index), (((("" + entry.name) + "") + entry.spawned) + "") + (entry.var_cffbc08 == -1 ? "" : entry.var_cffbc08), color, alpha, scale * 0.75, 1);
					index = index + ((17 * scale) * 0.75);
				}
			}
		}
		print3d(var_d194d219.origin + (0, 0, index), "" + (isdefined(var_29459a31) ? var_29459a31 : ""), (0, 1, 1), alpha, scale * 0.75, 1);
		index = index + ((17 * scale) * 0.75);
		return index;
	#/
}

/*
	Name: function_11ba669e
	Namespace: namespace_ce1f29cc
	Checksum: 0x74EEA36E
	Offset: 0x7B08
	Size: 0x266
	Parameters: 6
	Flags: None
*/
function function_11ba669e(index, scale, alpha, var_a7c842b3, var_d194d219, options)
{
	/#
		foreach(ent_num, var_687dacb8 in options.instance.var_ee69e628)
		{
			print3d(options.origin + (0, 0, scale), (("" + ent_num) + "") + var_687dacb8.count, var_d194d219, var_a7c842b3, alpha * 0.75, 1);
			scale = scale + ((17 * alpha) * 0.75);
			foreach(ai in var_687dacb8.entities)
			{
				if(!isalive(ai))
				{
					continue;
				}
				line(ai.origin + (0, 0, ai function_6a9ae71()), var_687dacb8.entity.origin, (1, 0, 1));
			}
		}
		print3d(options.origin + (0, 0, scale), "", var_d194d219, var_a7c842b3, alpha * 0.75, 1);
		scale = scale + ((17 * alpha) * 0.75);
		return scale;
	#/
}

/*
	Name: function_22dd41d8
	Namespace: namespace_ce1f29cc
	Checksum: 0xF7FEF7E
	Offset: 0x7D78
	Size: 0x1AE
	Parameters: 6
	Flags: None
*/
function function_22dd41d8(index, scale, alpha, var_a7c842b3, var_d194d219, options)
{
	/#
		scale = scale + ((17 * alpha) * 0.75);
		foreach(count in options.instance.var_ac7b2365)
		{
			print3d(options.origin + (0, 0, scale), (("" + function_9e72a96(state_name)) + "") + count, var_d194d219, var_a7c842b3, alpha * 0.75, 1);
			scale = scale + ((17 * alpha) * 0.75);
		}
		print3d(options.origin + (0, 0, scale), "", var_d194d219, var_a7c842b3, alpha * 0.75, 1);
		scale = scale + ((17 * alpha) * 0.75);
		return scale;
	#/
}

/*
	Name: function_42926dcf
	Namespace: namespace_ce1f29cc
	Checksum: 0xDBF0B5FD
	Offset: 0x7F30
	Size: 0xC6
	Parameters: 4
	Flags: None
*/
function function_42926dcf(index, scale, alpha, var_d194d219)
{
	/#
		if(!isdefined(var_d194d219.var_c43420a))
		{
			return index;
		}
		print3d(var_d194d219.origin + (0, 0, index), (("" + var_d194d219.var_c43420a) + "") + var_d194d219.var_d3455e4, (1, 0, 1), alpha, scale * 0.75, 1);
		index = index + ((17 * scale) * 0.75);
		return index;
	#/
}

/*
	Name: function_6320ae1d
	Namespace: namespace_ce1f29cc
	Checksum: 0x86DCE44F
	Offset: 0x8000
	Size: 0x16A
	Parameters: 2
	Flags: None
*/
function function_6320ae1d(var_d194d219, options)
{
	/#
		if(is_true(options.var_419cf6f8))
		{
			if(!level.var_f804b293[0].instance.priority)
			{
				return (1, 0, 0);
			}
			var_2a5f3b00 = mapfloat(0, level.var_f804b293[0].instance.priority, 0, 1, var_d194d219.instance.priority);
			return vectorlerp((1, 0, 0), (0, 1, 0), var_2a5f3b00);
		}
		switch(var_d194d219.instance.current_state)
		{
			case 0:
			{
				return (1, 0, 0);
				break;
			}
			case 1:
			{
				return (0, 1, 0);
				break;
			}
			case 2:
			{
				return (1, 0.5, 0);
				break;
			}
			default:
			{
				return vectorscale((1, 1, 1), 0.3);
				break;
			}
		}
	#/
}

/*
	Name: function_89a74781
	Namespace: namespace_ce1f29cc
	Checksum: 0xA9624CA
	Offset: 0x8178
	Size: 0xFA
	Parameters: 1
	Flags: None
*/
function function_89a74781(var_d194d219)
{
	/#
		switch(var_d194d219.instance.current_state)
		{
			case 0:
			{
				return "";
				break;
			}
			case 1:
			{
				return "";
				break;
			}
			case 2:
			{
				if(!isdefined(var_d194d219.instance.var_c80ba91c))
				{
					return "";
				}
				else
				{
					return "" + ((float(var_d194d219.instance.var_c80ba91c - gettime())) / 1000);
				}
				break;
			}
			default:
			{
				return "";
				break;
			}
		}
	#/
}

/*
	Name: draw_cylinder
	Namespace: namespace_ce1f29cc
	Checksum: 0x6E0B678C
	Offset: 0x8280
	Size: 0xB4
	Parameters: 5
	Flags: None
*/
function draw_cylinder(origin, radius, height, color, depthtest)
{
	/#
		circle(origin, radius, color, depthtest, 1, 1);
		circle(origin + (0, 0, height), radius, color, depthtest, 1, 1);
		line(origin, origin + (0, 0, height), color, 1, depthtest, 1);
	#/
}

/*
	Name: draw_box
	Namespace: namespace_ce1f29cc
	Checksum: 0x4A50AEA5
	Offset: 0x8340
	Size: 0xFC
	Parameters: 7
	Flags: None
*/
function draw_box(origin, angles, width, length, height, color, centered)
{
	/#
		if(!isdefined(centered))
		{
			centered = 0;
		}
		mins = (-0.5 * width, -0.5 * length, (centered ? height / -2 : 0));
		maxs = (0.5 * width, 0.5 * length, (centered ? height / 2 : height));
		box(origin, mins, maxs, angles, color, 1, 1, 1);
	#/
}

/*
	Name: function_9c8936c1
	Namespace: namespace_ce1f29cc
	Checksum: 0x997646C2
	Offset: 0x8448
	Size: 0x236
	Parameters: 3
	Flags: None
*/
function function_9c8936c1(&var_af4acf6e, origin, color)
{
	/#
		foreach(point in var_af4acf6e)
		{
			index = 0;
			debugstar(point.origin, 1, color);
			line(point.origin, origin, color);
			if(is_true(level.var_70da9652.var_22a4a482) && isdefined(point.var_90d0c0ff))
			{
				draw_box(point.origin, point.angles, 8, 8, 8, (1, 0.7529412, 0.7960784), 1);
				index = function_774fd83c(point, color, index, 0.75, 1);
			}
			if(is_true(level.var_70da9652.var_cb0c00c7) && isdefined(point.archetype))
			{
				print3d(point.origin + (0, 0, index), point.archetype, color, 1, 0.75 * 0.75, 1, 1);
				index = index + ((17 * 0.75) * 0.75);
			}
		}
	#/
}

/*
	Name: function_774fd83c
	Namespace: namespace_ce1f29cc
	Checksum: 0x9AF4B9F4
	Offset: 0x8688
	Size: 0xF8
	Parameters: 5
	Flags: None
*/
function function_774fd83c(spawn_point, color, index, scale, alpha)
{
	/#
		print3d(spawn_point.origin + (0, 0, index), spawn_point.var_90d0c0ff, color, alpha, scale * scale, 1, 1);
		index = index + ((17 * scale) * scale);
		draw_arrow(spawn_point.origin, spawn_point.origin + (anglestoforward(spawn_point.angles) * 15), (1, 0.7529412, 0.7960784), 6);
		return index;
	#/
}

/*
	Name: function_af647be2
	Namespace: namespace_ce1f29cc
	Checksum: 0xD0DE0C7
	Offset: 0x8790
	Size: 0x1FC
	Parameters: 1
	Flags: None
*/
function function_af647be2(player)
{
	/#
		line(player.origin + vectorscale((0, 0, 1), 72), player.origin + vectorscale((0, 0, 1), 572), (0, 1, 1));
		draw_box(player.origin, player.angles, 32, 32, 72, (0, 1, 1));
		var_9029dbde = rotatepointaroundaxis(vectorscale((1, 0, 0), 256), (0, 0, 1), angleclamp180(player.angles[1] + 45));
		var_9029dbde = var_9029dbde + player.origin;
		line(player.origin, var_9029dbde, (1, 0.5, 0));
		var_a9e71ad4 = rotatepointaroundaxis(vectorscale((1, 0, 0), 256), (0, 0, 1), angleclamp180(player.angles[1] - 45));
		var_a9e71ad4 = var_a9e71ad4 + player.origin;
		line(player.origin, var_a9e71ad4, (1, 0.5, 0));
		line(player.origin, player.origin + (anglestoforward(player.angles) * 256), (1, 1, 0));
	#/
}

/*
	Name: draw_arrow
	Namespace: namespace_ce1f29cc
	Checksum: 0xC8BC9A70
	Offset: 0x8998
	Size: 0x164
	Parameters: 4
	Flags: None
*/
function draw_arrow(start, end, color, var_6c0bdd43)
{
	/#
		angles = vectortoangles(end - start);
		var_7df0eab3 = var_6c0bdd43 / sqrt(2);
		var_697b6725 = var_6c0bdd43 / sqrt(2);
		line(start, end, color);
		var_52defcab = rotatepoint((-1 * var_697b6725, -1 * var_7df0eab3, 0), angles);
		var_2ded77 = rotatepoint((-1 * var_697b6725, var_7df0eab3, 0), angles);
		line(end, end + var_52defcab, color);
		line(end, end + var_2ded77, color);
	#/
}

