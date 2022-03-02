#using script_1029986e2bc8ca8e;
#using script_5a525a75a8f1f7e4;
#using script_7224d61ed502ea07;
#using script_7b1cd3908a825fdd;
#using script_7d7ac1f663edcdc8;
#using script_7fc996fe8678852;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm_common\zm_magicbox.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace namespace_b57ebf44;

/*
	Name: function_89f2df9
	Namespace: namespace_b57ebf44
	Checksum: 0x955A3085
	Offset: 0x100
	Size: 0x54
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_110e3595fef1adb7", &function_70a657d8, undefined, &finalize, #"hash_f81b9dea74f0ee");
}

/*
	Name: function_70a657d8
	Namespace: namespace_b57ebf44
	Checksum: 0xEA622852
	Offset: 0x160
	Size: 0x5C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	level.var_7d45d0d4.var_70a657d8 = 0;
	level flag::init(#"hash_3c2081a03635c78", 0);
	level.var_7de6c9f = undefined;
	function_f2379036();
}

/*
	Name: finalize
	Namespace: namespace_b57ebf44
	Checksum: 0x972363
	Offset: 0x1C8
	Size: 0x2C
	Parameters: 0
	Flags: Private
*/
function private finalize()
{
	if(!zm_utility::function_c200446c())
	{
		level thread function_1975f7db();
	}
}

/*
	Name: function_f2379036
	Namespace: namespace_b57ebf44
	Checksum: 0xA51B9191
	Offset: 0x200
	Size: 0x4C
	Parameters: 0
	Flags: Private
*/
function private function_f2379036()
{
	level.var_cbcc3ba = [];
	level.var_cbcc3ba[#"hash_1cc277407eed9c27"] = "wz_forest";
	level.var_cbcc3ba[#"hash_2d1de2a0a5c25bd9"] = "wz_sanatorium";
}

/*
	Name: function_123b048f
	Namespace: namespace_b57ebf44
	Checksum: 0x927A1670
	Offset: 0x258
	Size: 0x7A
	Parameters: 1
	Flags: None
*/
function function_123b048f(var_8a952bed)
{
	/#
		assert(isdefined(var_8a952bed), "");
	#/
	/#
		assert(var_8a952bed.variantname == #"hash_313be7fccc870cdd", "");
	#/
	level.var_7d45d0d4.var_5f2429b1 = var_8a952bed;
}

/*
	Name: function_2e165386
	Namespace: namespace_b57ebf44
	Checksum: 0xAF15E261
	Offset: 0x2E0
	Size: 0x16
	Parameters: 0
	Flags: None
*/
function function_2e165386()
{
	return level.var_7d45d0d4.var_d60029a6;
}

/*
	Name: function_f3be07d7
	Namespace: namespace_b57ebf44
	Checksum: 0x1D8198B0
	Offset: 0x300
	Size: 0x16A
	Parameters: 1
	Flags: None
*/
function function_f3be07d7(destination)
{
	if(!isdefined(level.var_7d45d0d4.nextobjective))
	{
		objective_manager::function_b06af8e3(destination);
	}
	var_9200b8df = level.var_7d45d0d4.nextobjective.spawn_list;
	if(isdefined(var_9200b8df))
	{
		var_f281f968 = array::random(strtok(var_9200b8df, ","));
		var_58b02068 = function_85e09141(level.var_7d45d0d4.nextobjective, var_f281f968);
	}
	if(!isdefined(var_58b02068))
	{
		var_58b02068 = namespace_8b6a9d79::function_31e8da78(destination, #"start_spawn");
	}
	level.var_7d45d0d4.var_994ca8b9 = var_58b02068;
	level flag::set(#"hash_10679ff0bf4d6c8d");
	a_spawn_points = namespace_8b6a9d79::function_f703a5a(var_58b02068);
	return array::randomize(a_spawn_points);
}

/*
	Name: function_85e09141
	Namespace: namespace_b57ebf44
	Checksum: 0x8E679EC7
	Offset: 0x478
	Size: 0x204
	Parameters: 2
	Flags: None
*/
function function_85e09141(instance, var_f281f968)
{
	locations = array::randomize(namespace_8b6a9d79::function_f703a5a(instance.location.destination));
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
		instances = array::randomize(namespace_8b6a9d79::function_f703a5a(location));
		foreach(instance in instances)
		{
			if(instance.content_script_name === #"start_spawn" && instance.script_int === var_f281f968)
			{
				return instance;
			}
		}
	}
}

/*
	Name: function_6f9efb66
	Namespace: namespace_b57ebf44
	Checksum: 0xB763CCF1
	Offset: 0x688
	Size: 0x114
	Parameters: 0
	Flags: Private
*/
function private function_6f9efb66()
{
	var_4f146e5d = [];
	var_910d7951 = level.var_7d45d0d4.destinations;
	var_4f146e5d = [];
	foreach(var_8a952bed in var_910d7951)
	{
		if(is_true(var_8a952bed.var_8d629117))
		{
			continue;
		}
		var_4f146e5d = function_f3be07d7(var_8a952bed);
		if(var_4f146e5d.size)
		{
			var_9b06d3e2 = var_8a952bed.targetname;
			break;
		}
	}
	if(isdefined(var_8a952bed))
	{
		function_123b048f(var_8a952bed);
	}
}

/*
	Name: function_1975f7db
	Namespace: namespace_b57ebf44
	Checksum: 0xB2385CD0
	Offset: 0x7A8
	Size: 0x3AC
	Parameters: 0
	Flags: Private
*/
function private function_1975f7db()
{
	destinations = [];
	categories = [];
	objective_manager::function_ef3a1d04(destinations, categories);
	objective_manager::function_c700a68b(categories);
	var_4191df0e = getdvarint(#"hash_688e3b3254c8a895", 0);
	if(!var_4191df0e)
	{
		function_6f9efb66();
	}
	if(isdefined(level.var_7d45d0d4.var_64a75da7))
	{
		[[level.var_7d45d0d4.var_64a75da7]]();
	}
	/#
		if(getdvarint(#"hash_33b0be96bf3cd69a", 0))
		{
			return;
		}
	#/
	if(!isdefined(level.var_7d45d0d4.var_d60029a6))
	{
		var_92a668db = getdvarint(#"hash_6c0d94ade91b07a8", 0);
		if(!var_92a668db || var_92a668db > level.var_7d45d0d4.destinations.size)
		{
			var_92a668db = level.var_7d45d0d4.destinations.size;
		}
		var_a3c51b07[0] = level.var_7d45d0d4.var_5f2429b1;
		arrayremovevalue(destinations, var_a3c51b07[0]);
		for(i = 1; i < var_92a668db; i++)
		{
			var_918869fb = var_a3c51b07[i - 1].adjacencies;
			if(!isdefined(var_918869fb))
			{
				var_918869fb = arraycopy(destinations);
			}
			while(destinations.size && var_918869fb.size)
			{
				var_c0335359 = array::random(var_918869fb);
				if(!isdefined(var_c0335359.var_e859e591) || !var_c0335359.var_e859e591.size || isinarray(var_a3c51b07, var_c0335359))
				{
					arrayremovevalue(var_918869fb, var_c0335359);
					continue;
				}
				else
				{
					break;
				}
			}
			if(!destinations.size)
			{
				break;
			}
			arrayremovevalue(destinations, var_c0335359);
			var_a3c51b07[i] = var_c0335359;
		}
		last_destination = var_a3c51b07[i - 1];
		if(isdefined(last_destination.var_e859e591[#"final_battle"]))
		{
			last_destination.final_battle = 1;
		}
		level.var_7d45d0d4.var_d60029a6 = var_a3c51b07;
		if(var_4191df0e)
		{
			function_6f9efb66();
		}
	}
	level thread function_786a9f4d(level.var_7d45d0d4.var_d60029a6);
	level flag::set(#"hash_7ace2c0d668c5128");
}

/*
	Name: function_786a9f4d
	Namespace: namespace_b57ebf44
	Checksum: 0x255C68E5
	Offset: 0xB60
	Size: 0x366
	Parameters: 1
	Flags: None
*/
function function_786a9f4d(destinations)
{
	level endon(#"game_ended");
	level.var_7d45d0d4.destinationindex = 0;
	while(destinations.size)
	{
		var_388b6d6c = destinations;
		var_26a5f658 = getfirstarraykey(var_388b6d6c);
		if(isdefined(var_26a5f658))
		{
			var_dcfff47a = getarraykeyindex(var_26a5f658);
			destination = getarrayvalue(var_26a5f658);
			var_7692405 = getnextarraykey(var_26a5f658);
			level thread activate(destination);
			s_result = undefined;
			s_result = level waittill(#"hash_69090774fec4a17b");
			if(s_result.completed === 0)
			{
				if(isdefined(level.var_7d45d0d4.var_4824f1b9) && [[level.var_7d45d0d4.var_4824f1b9]]())
				{
					return;
				}
			}
			if(isdefined(level.var_7d45d0d4.var_314d6e9b))
			{
				[[level.var_7d45d0d4.var_314d6e9b]](destination);
			}
			level thread namespace_591b4396::function_7c05a985(destination);
			level.var_7d45d0d4.destinationindex++;
			if(level.var_7d45d0d4.destinationindex >= destinations.size)
			{
				level.var_7d45d0d4.destinationindex = 0;
			}
			level waittill(#"hash_345e9169ebba28fb");
			level callback::callback(#"hash_345e9169ebba28fb");
			locations = destination.locations;
			foreach(location in locations)
			{
				foreach(instance in location.instances)
				{
					instance callback::callback(#"hash_345e9169ebba28fb");
				}
			}
			level callback::callback(#"hash_1c1f524243c91729");
			deactivate(destination);
			load_next_map(destination);
			return;
		}
	}
}

/*
	Name: load_next_map
	Namespace: namespace_b57ebf44
	Checksum: 0x54CA1249
	Offset: 0xED0
	Size: 0x64
	Parameters: 1
	Flags: Private
*/
function private load_next_map(destination)
{
	targetname = destination.targetname;
	if(isdefined(targetname) && isdefined(level.var_cbcc3ba[targetname]))
	{
		namespace_553954de::function_1aa044d3(level.var_cbcc3ba[targetname]);
	}
}

/*
	Name: function_c62829da
	Namespace: namespace_b57ebf44
	Checksum: 0x3B8C2344
	Offset: 0xF40
	Size: 0xA6
	Parameters: 1
	Flags: Private
*/
function private function_c62829da(destination)
{
	if(function_d71c83a7())
	{
		if(isdefined(destination.var_fe2612fe[#"hash_3460aae6bb799a99"]))
		{
			var_6c486d1a = destination.var_fe2612fe[#"hash_3460aae6bb799a99"][0];
			if(isdefined(var_6c486d1a))
			{
				var_f6b2bc6f = getent(var_6c486d1a.targetname, "target");
				if(isdefined(var_f6b2bc6f))
				{
					return var_f6b2bc6f;
				}
			}
		}
	}
	return undefined;
}

/*
	Name: function_ab94c270
	Namespace: namespace_b57ebf44
	Checksum: 0x526FEE63
	Offset: 0xFF0
	Size: 0x114
	Parameters: 1
	Flags: None
*/
function function_ab94c270(destination)
{
	if(level flag::get(#"hash_3c2081a03635c78"))
	{
		return;
	}
	ent = function_c62829da(destination);
	if(level.var_7de6c9f === ent)
	{
		return;
	}
	if(isdefined(ent))
	{
		level flag::set(#"hash_3c2081a03635c78");
		level.var_7de6c9f = undefined;
		var_ada19974 = function_dbe9e22e(ent);
		while(var_ada19974.size > 0)
		{
			var_ada19974 = function_8abb2f1a(var_ada19974);
			waitframe(1);
		}
		level flag::clear(#"hash_3c2081a03635c78");
		level.var_7de6c9f = ent;
	}
}

/*
	Name: activate
	Namespace: namespace_b57ebf44
	Checksum: 0xEEF9239
	Offset: 0x1110
	Size: 0x1E4
	Parameters: 1
	Flags: None
*/
function activate(destination)
{
	level.var_7d45d0d4.currentdestination = destination;
	level callback::callback(#"hash_4ac56c023c88537f", {#destination:destination});
	level thread function_ab94c270(destination);
	level flag::wait_till_clear(#"hash_3c2081a03635c78");
	if(isdefined(level.var_7d45d0d4.var_a3205267))
	{
		[[level.var_7d45d0d4.var_a3205267]](destination);
	}
	if(!getdvarint(#"hash_4fd21096bcb24e82", 0) && !getdvarint(#"hash_33b0be96bf3cd69a", 0))
	{
		objective_manager::spawn_objective();
	}
	if(isdefined(level.var_7d45d0d4.var_62a42ce))
	{
		[[level.var_7d45d0d4.var_62a42ce]](destination);
	}
	level thread zm_magicbox::function_2dcb5cea(destination);
	level thread zm_wallbuy::function_669a830(destination);
	level thread namespace_c09ae6c3::spawn_ammo_cache(destination);
	level callback::callback(#"hash_7cdee03c16eb684a", {#destination:destination});
}

/*
	Name: deactivate
	Namespace: namespace_b57ebf44
	Checksum: 0x1A0D5C85
	Offset: 0x1300
	Size: 0x68
	Parameters: 1
	Flags: None
*/
function deactivate(destination)
{
	level callback::callback(#"hash_565739346fc951ae", {#destination:destination});
	namespace_8b6a9d79::function_690c4abe();
	level notify(#"hash_3b28fcaa0b9b4489");
}

/*
	Name: function_506afb9e
	Namespace: namespace_b57ebf44
	Checksum: 0x7F7A758E
	Offset: 0x1370
	Size: 0x21E
	Parameters: 2
	Flags: None
*/
function function_506afb9e(destination, var_2371bf)
{
	names = var_2371bf;
	if(isstring(var_2371bf) || function_7a600918(var_2371bf))
	{
		names = [0:var_2371bf];
	}
	var_526e473a = [];
	foreach(location in destination.locations)
	{
		foreach(instance in location.instances)
		{
			if(!isinarray(names, name))
			{
				continue;
			}
			foreach(group in instance.var_fe2612fe)
			{
				var_526e473a = arraycombine(var_526e473a, function_66ec9032(group), 0, 0);
			}
		}
	}
	return var_526e473a;
}

/*
	Name: function_66ec9032
	Namespace: namespace_b57ebf44
	Checksum: 0xEBDF8ECA
	Offset: 0x1598
	Size: 0x156
	Parameters: 1
	Flags: None
*/
function function_66ec9032(struct_array)
{
	var_526e473a = [];
	if(!struct_array.size)
	{
		return var_526e473a;
	}
	foreach(struct in struct_array)
	{
		if(struct.var_fe2612fe.size)
		{
			foreach(group in struct.var_fe2612fe)
			{
				var_526e473a = arraycombine(var_526e473a, function_66ec9032(group), 0, 0);
			}
		}
		var_526e473a[var_526e473a.size] = struct;
	}
	return var_526e473a;
}

