#using script_1029986e2bc8ca8e;
#using script_5a525a75a8f1f7e4;
#using script_7224d61ed502ea07;
#using script_7b1cd3908a825fdd;
#using script_7d7ac1f663edcdc8;
#using script_7fc996fe8678852;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm_common\zm_magicbox.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace namespace_b57ebf44;

/*
	Name: function_11956762
	Namespace: namespace_b57ebf44
	Checksum: 0x69BE9B17
	Offset: 0xE8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_11956762()
{
	level notify(1690370135);
}

/*
	Name: function_89f2df9
	Namespace: namespace_b57ebf44
	Checksum: 0x42D7749C
	Offset: 0x108
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
	Checksum: 0x4350B4B3
	Offset: 0x168
	Size: 0x46
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.var_7d45d0d4.var_70a657d8 = 0;
	level flag::init(#"hash_3c2081a03635c78", 0);
	level.var_7de6c9f = undefined;
}

/*
	Name: finalize
	Namespace: namespace_b57ebf44
	Checksum: 0x257420CE
	Offset: 0x1B8
	Size: 0x2C
	Parameters: 0
	Flags: Linked, Private
*/
function private finalize()
{
	if(!zm_utility::function_c200446c())
	{
		level thread function_1975f7db();
	}
}

/*
	Name: function_123b048f
	Namespace: namespace_b57ebf44
	Checksum: 0x2C4024C5
	Offset: 0x1F0
	Size: 0x7A
	Parameters: 1
	Flags: Linked
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
	Checksum: 0xBED0A082
	Offset: 0x278
	Size: 0x16
	Parameters: 0
	Flags: Linked
*/
function function_2e165386()
{
	return level.var_7d45d0d4.var_d60029a6;
}

/*
	Name: function_f3be07d7
	Namespace: namespace_b57ebf44
	Checksum: 0x56BD1322
	Offset: 0x298
	Size: 0x1DA
	Parameters: 1
	Flags: Linked
*/
function function_f3be07d7(destination)
{
	if(isdefined(level.var_490ade6))
	{
		objective_manager::function_b06af8e3(destination, 1, level.var_490ade6, level.var_c73744cc);
	}
	else if(!isdefined(level.var_7d45d0d4.nextobjective))
	{
		objective_manager::function_a8ad6895(destination);
	}
	var_9200b8df = level.var_7d45d0d4.nextobjective.spawn_list;
	if(isdefined(var_9200b8df))
	{
		var_f281f968 = array::random(strtok(var_9200b8df, ","));
		var_58b02068 = function_e4254bac(destination, var_f281f968);
	}
	/#
		var_f281f968 = getdvarint(#"hash_445bd141a460ff3a", 0);
		if(var_f281f968)
		{
			var_58b02068 = function_e4254bac(destination, var_f281f968);
		}
	#/
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
	Name: function_e4254bac
	Namespace: namespace_b57ebf44
	Checksum: 0x2A30DE73
	Offset: 0x480
	Size: 0x1FC
	Parameters: 2
	Flags: Linked
*/
function function_e4254bac(destination, var_f281f968)
{
	locations = array::randomize(namespace_8b6a9d79::function_f703a5a(destination));
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
	Checksum: 0xBC45C592
	Offset: 0x688
	Size: 0x114
	Parameters: 0
	Flags: Linked, Private
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
	Checksum: 0xF0F95CE8
	Offset: 0x7A8
	Size: 0x3CC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_1975f7db()
{
	destinations = [];
	categories = [];
	objective_manager::function_ef3a1d04(destinations, categories);
	objective_manager::function_c700a68b(categories);
	callback::callback(#"hash_276921163232533");
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
	Checksum: 0x59C524B9
	Offset: 0xB80
	Size: 0x366
	Parameters: 1
	Flags: Linked
*/
function function_786a9f4d(destinations)
{
	level endon(#"game_ended");
	level.var_7d45d0d4.destinationindex = 0;
	while(destinations.size)
	{
		var_69e45021 = destinations;
		var_94b9529d = getfirstarraykey(var_69e45021);
		if(isdefined(var_94b9529d))
		{
			var_839f4186 = getarraykeyindex(var_94b9529d);
			destination = getarrayvalue(var_94b9529d);
			var_7719033f = getnextarraykey(var_94b9529d);
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
	Checksum: 0x8177BAB9
	Offset: 0xEF0
	Size: 0x224
	Parameters: 1
	Flags: Linked
*/
function load_next_map(destination)
{
	/#
		level.var_3d1ef3ae = getdvar(#"hash_2f8775fbdde23a15");
	#/
	if(level.var_7d45d0d4.var_dc858a58.list[level.var_7d45d0d4.var_dc858a58.index] === level.script)
	{
		level.var_7d45d0d4.var_dc858a58.index = (level.var_7d45d0d4.var_dc858a58.index + 1) % level.var_7d45d0d4.var_dc858a58.list.size;
	}
	if(isdefined(level.var_c73744cc))
	{
		level.var_7d45d0d4.var_9614b1d2[level.var_490ade6].index = (level.var_7d45d0d4.var_9614b1d2[level.var_490ade6].index + 1) % level.var_7d45d0d4.var_9614b1d2[level.var_490ade6].list.size;
	}
	level.var_7d45d0d4.var_407236bf.index = (level.var_7d45d0d4.var_407236bf.index + 1) % level.var_7d45d0d4.var_407236bf.list.size;
	var_112acc94 = (isdefined(level.var_3d1ef3ae) ? level.var_3d1ef3ae : level.var_7d45d0d4.var_dc858a58.list[level.var_7d45d0d4.var_dc858a58.index]);
	if(isdefined(var_112acc94))
	{
		namespace_553954de::function_1aa044d3(var_112acc94);
	}
}

/*
	Name: function_c62829da
	Namespace: namespace_b57ebf44
	Checksum: 0xACF60BBD
	Offset: 0x1120
	Size: 0xA6
	Parameters: 1
	Flags: Linked, Private
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
	Checksum: 0x9F24A2C8
	Offset: 0x11D0
	Size: 0x114
	Parameters: 1
	Flags: Linked
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
	Checksum: 0x26410B0C
	Offset: 0x12F0
	Size: 0x1E4
	Parameters: 1
	Flags: Linked
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
	Checksum: 0x7AE779A6
	Offset: 0x14E0
	Size: 0x68
	Parameters: 1
	Flags: Linked
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
	Checksum: 0x849E373C
	Offset: 0x1550
	Size: 0x21E
	Parameters: 2
	Flags: Linked
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
	Checksum: 0x1E5DED75
	Offset: 0x1778
	Size: 0x156
	Parameters: 1
	Flags: Linked
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

