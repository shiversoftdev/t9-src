#using script_7b1cd3908a825fdd;
#using script_5b2a3c052bf17d0e;
#using script_2618e0f3e5e11649;
#using script_355c6e84a79530cb;
#using script_176597095ddfaa17;
#using script_16b1b77a76492c6a;
#using script_13d5d0aa9140d362;
#using scripts\zm_common\zm_vo.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using script_7d7ac1f663edcdc8;
#using script_437ce686d29bb81b;
#using script_799de24f8ad427f7;
#using script_4ce5d94e8c797350;
#using script_1029986e2bc8ca8e;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\flag_shared.gsc;
#using script_7fc996fe8678852;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_18bbc38e;

/*
	Name: function_a573b718
	Namespace: namespace_18bbc38e
	Checksum: 0x26889002
	Offset: 0x218
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_a573b718()
{
	level notify(1970402965);
}

/*
	Name: __init__system__
	Namespace: namespace_18bbc38e
	Checksum: 0xEF16C586
	Offset: 0x238
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_5bcba15330839867", &function_70a657d8, undefined, undefined, #"zm_destination_manager");
}

/*
	Name: function_70a657d8
	Namespace: namespace_18bbc38e
	Checksum: 0xCCE1788F
	Offset: 0x288
	Size: 0x104
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.var_7d45d0d4.var_64a75da7 = &function_64a75da7;
	level.var_7d45d0d4.var_dbc06c4b = &function_4824f1b9;
	level.var_7d45d0d4.var_314d6e9b = &function_314d6e9b;
	level.var_7d45d0d4.var_a3205267 = &function_a3205267;
	level.var_7d45d0d4.var_62a42ce = &function_62a42ce;
	level callback::add_callback(#"hash_565739346fc951ae", &function_74c76da9);
	level callback::add_callback(#"hash_276921163232533", &function_85e8bf9e);
}

/*
	Name: function_64a75da7
	Namespace: namespace_18bbc38e
	Checksum: 0x9B6DF724
	Offset: 0x398
	Size: 0x232
	Parameters: 0
	Flags: Linked, Private
*/
function private function_64a75da7()
{
	/#
		if(getdvarint(#"hash_33b0be96bf3cd69a", 0))
		{
			level.var_7d45d0d4.var_d60029a6 = array(level.var_7d45d0d4.var_5f2429b1);
			level.var_7d45d0d4.currentdestination = level.var_7d45d0d4.var_5f2429b1;
			level flag::set(#"hash_7ace2c0d668c5128");
			level zm_destination_manager::activate(level.var_7d45d0d4.var_5f2429b1);
			level flag::wait_till(#"all_players_spawned");
			if(!isdefined(level.var_7d45d0d4.var_c4181ea))
			{
				level namespace_73df937d::function_de302547(level.var_7d45d0d4.var_5f2429b1);
				foreach(player in getplayers())
				{
					player setorigin(level.var_7d45d0d4.var_c4181ea.origin);
				}
			}
			level waittill(#"hash_581a9d913f67821a");
			level thread namespace_591b4396::function_7c05a985(level.var_7d45d0d4.var_5f2429b1);
			return;
		}
	#/
	level.var_7d45d0d4.var_d60029a6 = function_d4de820e();
}

/*
	Name: function_4824f1b9
	Namespace: namespace_18bbc38e
	Checksum: 0xB8B9C0AF
	Offset: 0x5D8
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_4824f1b9()
{
	if(getdvarint(#"hash_15b141da1584bd0d", 1))
	{
		namespace_553954de::end_match(0);
		return true;
	}
	return false;
}

/*
	Name: function_314d6e9b
	Namespace: namespace_18bbc38e
	Checksum: 0x88BB1DF
	Offset: 0x630
	Size: 0x9C
	Parameters: 1
	Flags: Linked
*/
function function_314d6e9b(destination)
{
	level endon(#"game_ended");
	level flag::wait_till_timeout(30, #"hash_1460b3afd614fb6c");
	level thread namespace_73df937d::function_de302547(destination);
	level flag::clear(#"hash_1460b3afd614fb6c");
	level waittill(#"hash_581a9d913f67821a");
}

/*
	Name: function_a3205267
	Namespace: namespace_18bbc38e
	Checksum: 0x6778685C
	Offset: 0x6D8
	Size: 0xEC
	Parameters: 1
	Flags: Linked
*/
function function_a3205267(destination)
{
	level flag::wait_till(#"hash_10679ff0bf4d6c8d");
	level thread namespace_ce1f29cc::function_6b885d72(destination);
	level thread function_cef826da(destination);
	if(is_true(getgametypesetting(#"hash_59854c1f30538261")))
	{
		announce = objective_manager::function_7bfeebe3() > 0;
		namespace_d0ab5955::function_d4dec4e8(destination, announce);
	}
	level flag::wait_till(#"intro_scene_done");
}

/*
	Name: function_62a42ce
	Namespace: namespace_18bbc38e
	Checksum: 0xF7D5BFFB
	Offset: 0x7D0
	Size: 0x9C
	Parameters: 1
	Flags: Linked
*/
function function_62a42ce(destination)
{
	level thread namespace_e51c1e80::spawn_vehicles(destination);
	function_f169181c(destination);
	namespace_957938f0::function_4317fa79(destination);
	namespace_f0b43eb5::function_2b436554(destination);
	level thread namespace_2c949ef8::function_c0966bb1(destination);
	function_b3dda48(destination);
}

/*
	Name: function_74c76da9
	Namespace: namespace_18bbc38e
	Checksum: 0x4197C884
	Offset: 0x878
	Size: 0x74
	Parameters: 1
	Flags: Linked
*/
function function_74c76da9(destination)
{
	level thread namespace_ce1f29cc::function_617f5d43(destination);
	namespace_d0ab5955::function_f1ad7968(destination);
	namespace_553954de::function_7c97e961(level.var_b48509f9 + 1);
	level thread namespace_e51c1e80::function_c772bd2c(destination);
}

/*
	Name: function_cef826da
	Namespace: namespace_18bbc38e
	Checksum: 0xC8CBF171
	Offset: 0x8F8
	Size: 0x2B4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_cef826da(destination)
{
	var_df4a4d76 = destination.locations;
	if(isdefined(level.var_7d45d0d4.var_994ca8b9))
	{
		var_df4a4d76 = arraysortclosest(var_df4a4d76, level.var_7d45d0d4.var_994ca8b9.origin);
	}
	foreach(location in var_df4a4d76)
	{
		var_7ca1bc80 = location.instances[#"explore_chests_large"];
		if(isdefined(var_7ca1bc80))
		{
			namespace_8b6a9d79::function_20d7e9c7(var_7ca1bc80);
		}
		var_20780a3a = location.instances[#"explore_chests"];
		if(isdefined(var_20780a3a))
		{
			namespace_8b6a9d79::function_20d7e9c7(var_20780a3a);
		}
		var_20780a3a = location.instances[#"explore_chests_small"];
		if(isdefined(var_20780a3a))
		{
			namespace_8b6a9d79::function_20d7e9c7(var_20780a3a);
		}
		var_bf74f01b = location.instances[#"loot_pods"];
		if(isdefined(var_bf74f01b))
		{
			namespace_8b6a9d79::function_20d7e9c7(var_bf74f01b);
		}
		var_c3d93d9f = location.instances[#"harvest_essence"];
		if(isdefined(var_c3d93d9f))
		{
			namespace_8b6a9d79::function_20d7e9c7(var_c3d93d9f);
		}
		var_c3d93d9f = location.instances[#"harvest_essence_small"];
		if(isdefined(var_c3d93d9f))
		{
			namespace_8b6a9d79::function_20d7e9c7(var_c3d93d9f);
		}
		var_a1f9a8cd = location.instances[#"harvest_scrap"];
		if(isdefined(var_a1f9a8cd))
		{
			namespace_8b6a9d79::function_20d7e9c7(var_a1f9a8cd);
		}
		util::wait_network_frame();
	}
	level flag::set(#"hash_5aca8d24a1f56ee1");
}

/*
	Name: function_f169181c
	Namespace: namespace_18bbc38e
	Checksum: 0x77BC9538
	Offset: 0xBB8
	Size: 0x16C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_f169181c(destination)
{
	level.var_3ed04e02 = [];
	var_90e97a54 = level.var_7d45d0d4.var_ab00156;
	n_to_spawn = function_21a3a673(2, 3);
	n_spawned = 0;
	while(var_90e97a54.size)
	{
		str_type = var_90e97a54[randomint(var_90e97a54.size)];
		arrayremovevalue(var_90e97a54, str_type, 0);
		b_spawned = function_9b9c7696(destination, str_type);
		if(is_true(b_spawned))
		{
			n_spawned++;
		}
		if(n_spawned >= n_to_spawn && !getdvarint(#"hash_730311c63805303a", 0))
		{
			break;
		}
	}
	function_66855ea6(destination, #"demented_echo");
	function_66855ea6(destination, #"hash_38cc1135684934da");
}

/*
	Name: function_66855ea6
	Namespace: namespace_18bbc38e
	Checksum: 0x873380F8
	Offset: 0xD30
	Size: 0x1D2
	Parameters: 2
	Flags: Linked, Private
*/
function private function_66855ea6(destination, str_type)
{
	var_df4a4d76 = arraycopy(destination.locations);
	while(var_df4a4d76.size)
	{
		location = array::function_a3b0f814(var_df4a4d76);
		var_97aab885 = location.instances[str_type];
		if(isdefined(var_97aab885))
		{
			var_e7f5b3e0 = 1;
			if(!getdvarint(#"hash_730311c63805303a", 0))
			{
				if(isdefined(var_97aab885.var_501bc8c9))
				{
					var_2685dd6d = strtok(var_97aab885.var_501bc8c9, ", ");
					foreach(var_a2593226 in var_2685dd6d)
					{
						if(level.var_7d45d0d4.var_1fcbdf50 === var_a2593226)
						{
							var_e7f5b3e0 = 0;
							break;
						}
					}
				}
			}
			if(var_e7f5b3e0)
			{
				namespace_8b6a9d79::function_20d7e9c7(var_97aab885);
			}
			/#
				if(getdvarint(#"hash_730311c63805303a", 0))
				{
					continue;
				}
			#/
			break;
		}
	}
}

/*
	Name: function_9b9c7696
	Namespace: namespace_18bbc38e
	Checksum: 0x5341D68B
	Offset: 0xF10
	Size: 0x4A2
	Parameters: 2
	Flags: Linked, Private
*/
function private function_9b9c7696(destination, str_type)
{
	var_ba9835cd = [];
	if(!isdefined(level.var_3ed04e02))
	{
		level.var_3ed04e02 = [];
	}
	s_player_start = level.var_7767cea8[0];
	foreach(s_location in destination.locations)
	{
		s_instance = s_location.instances[str_type];
		if(isdefined(s_instance))
		{
			var_e7f5b3e0 = 1;
			if(!getdvarint(#"hash_730311c63805303a", 0))
			{
				if(isdefined(s_instance.var_501bc8c9))
				{
					var_2685dd6d = strtok(s_instance.var_501bc8c9, ", ");
					foreach(var_a2593226 in var_2685dd6d)
					{
						if(level.var_7d45d0d4.var_1fcbdf50 === var_a2593226)
						{
							var_e7f5b3e0 = 0;
							break;
						}
					}
				}
				foreach(var_6be26b52 in level.var_3ed04e02)
				{
					if(distancesquared(s_instance.origin, var_6be26b52.origin) < sqr(10000))
					{
						var_e7f5b3e0 = 0;
						break;
					}
				}
				if(var_e7f5b3e0 && isdefined(s_player_start) && distancesquared(s_player_start.origin, s_instance.origin) < sqr(5000))
				{
					var_e7f5b3e0 = 0;
				}
			}
			if(var_e7f5b3e0)
			{
				if(!isdefined(var_ba9835cd))
				{
					var_ba9835cd = [];
				}
				else if(!isarray(var_ba9835cd))
				{
					var_ba9835cd = array(var_ba9835cd);
				}
				var_ba9835cd[var_ba9835cd.size] = s_instance;
			}
		}
	}
	var_ba9835cd = array::randomize(var_ba9835cd);
	b_spawned = 0;
	foreach(s_instance in var_ba9835cd)
	{
		if(isdefined(s_instance))
		{
			namespace_8b6a9d79::function_20d7e9c7(s_instance);
			if(!isdefined(level.var_3ed04e02))
			{
				level.var_3ed04e02 = [];
			}
			else if(!isarray(level.var_3ed04e02))
			{
				level.var_3ed04e02 = array(level.var_3ed04e02);
			}
			level.var_3ed04e02[level.var_3ed04e02.size] = s_instance;
			b_spawned = 1;
			if(!getdvarint(#"hash_730311c63805303a", 0))
			{
				break;
			}
		}
	}
	return b_spawned;
}

/*
	Name: function_d4de820e
	Namespace: namespace_18bbc38e
	Checksum: 0xD7F0F2A
	Offset: 0x13C0
	Size: 0x4D2
	Parameters: 0
	Flags: Linked, Private
*/
function private function_d4de820e()
{
	if(is_true(getdvarint(#"hash_688e3b3254c8a895", 0)))
	{
		var_89d7bd4 = [];
		var_eef00fc6 = getdvarstring(#"hash_68a0047e00d7d34c");
		if(var_eef00fc6 !== "")
		{
			var_89d7bd4[var_89d7bd4.size] = var_eef00fc6;
		}
		var_53975913 = getdvarstring(#"hash_68a0077e00d7d865");
		if(var_53975913 !== "")
		{
			var_89d7bd4[var_89d7bd4.size] = var_53975913;
		}
		var_6155748f = getdvarstring(#"hash_68a0067e00d7d6b2");
		if(var_6155748f !== "")
		{
			var_89d7bd4[var_89d7bd4.size] = var_6155748f;
		}
		var_18386256 = getdvarstring(#"hash_68a0017e00d7ce33");
		if(var_18386256 !== "")
		{
			var_89d7bd4[var_89d7bd4.size] = var_18386256;
		}
		var_4607bdf4 = getdvarstring(#"hash_68a0007e00d7cc80");
		if(var_4607bdf4 !== "")
		{
			var_89d7bd4[var_89d7bd4.size] = var_4607bdf4;
		}
		var_2b588ed4 = 3;
	}
	else
	{
		var_2b588ed4 = (isdefined(getgametypesetting(#"hash_352d47f1b1b17cc5")) ? getgametypesetting(#"hash_352d47f1b1b17cc5") : 0);
	}
	if(var_2b588ed4)
	{
		switch(var_2b588ed4)
		{
			case 1:
			{
				var_13f49a56 = array("kill_hvt_zoo_avogadro", "objective_ski_defend_lodge", "objective_sanatorium_payload_teleport");
				break;
			}
			case 2:
			{
				var_13f49a56 = array("objective_sanatorium_defend_console", "objective_zoo_retrieval", "kill_hvt_ski_raz");
				break;
			}
			case 3:
			{
				var_13f49a56 = var_89d7bd4;
				break;
			}
			default:
			{
				return;
			}
		}
		var_a3c51b07 = [];
		for(i = 0; i < var_13f49a56.size; i++)
		{
			instance = struct::get(var_13f49a56[i]);
			location = struct::get(instance.target);
			destination = struct::get(location.target);
			/#
				assert(destination.variantname == #"hash_313be7fccc870cdd");
			#/
			script = namespace_8b6a9d79::function_85255d0f(instance.content_script_name);
			category = script.objectivecategory;
			destination.var_e859e591 = [];
			destination.var_e859e591[category] = array(instance);
			var_a3c51b07[i] = destination;
		}
		a_spawns = zm_destination_manager::function_f3be07d7(var_a3c51b07[0]);
		var_58b02068 = struct::get(a_spawns[0].target, "targetname");
		level.var_7767cea8 = array(var_58b02068);
		level.var_7767cea8[0].spawns = a_spawns;
		zm_destination_manager::function_123b048f(var_a3c51b07[0]);
		return var_a3c51b07;
	}
}

/*
	Name: function_b3dda48
	Namespace: namespace_18bbc38e
	Checksum: 0xC0CD1ECB
	Offset: 0x18A0
	Size: 0x17C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_b3dda48(s_destination)
{
	if(!zm_utility::is_ee_enabled())
	{
		return;
	}
	var_ba9835cd = [];
	foreach(s_location in s_destination.locations)
	{
		if(namespace_8b6a9d79::function_fe9fb6fd(s_location))
		{
			continue;
		}
		if(isdefined(s_location.instances[#"hash_1f5e56ff4b3c50e2"]))
		{
			if(!isdefined(var_ba9835cd))
			{
				var_ba9835cd = [];
			}
			else if(!isarray(var_ba9835cd))
			{
				var_ba9835cd = array(var_ba9835cd);
			}
			var_ba9835cd[var_ba9835cd.size] = s_location.instances[#"hash_1f5e56ff4b3c50e2"];
		}
	}
	s_instance = array::random(var_ba9835cd);
	if(isdefined(s_instance))
	{
		namespace_8b6a9d79::function_20d7e9c7(s_instance);
	}
}

/*
	Name: function_8e64a2b1
	Namespace: namespace_18bbc38e
	Checksum: 0xE75B7AB5
	Offset: 0x1A28
	Size: 0xEC
	Parameters: 3
	Flags: None
*/
function function_8e64a2b1(var_6e542c1a, var_a3b3f1b, var_8f08f2fe)
{
	if(!isdefined(var_8f08f2fe))
	{
		var_8f08f2fe = #"";
	}
	/#
		assert(isdefined(var_6e542c1a) && isdefined(var_a3b3f1b), "");
	#/
	level.var_3d1ef3ae = var_6e542c1a;
	level.var_edb2bb69 = (ishash(var_a3b3f1b) ? hash(var_a3b3f1b) : var_a3b3f1b);
	level.var_1b2466fe = (ishash(var_8f08f2fe) ? hash(var_8f08f2fe) : var_8f08f2fe);
}

/*
	Name: function_85e8bf9e
	Namespace: namespace_18bbc38e
	Checksum: 0x4E85CF6A
	Offset: 0x1B20
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function function_85e8bf9e(params)
{
	function_e97f828e();
}

/*
	Name: function_bd104a73
	Namespace: namespace_18bbc38e
	Checksum: 0x27878012
	Offset: 0x1B48
	Size: 0x4AA
	Parameters: 0
	Flags: Linked
*/
function function_bd104a73()
{
	var_775479a4 = [];
	foreach(map in [2:{#hash_19a686ca:#"hash_15e3cdab677aed", #name:"wz_ski_slopes"}, 1:{#hash_19a686ca:#"hash_d9c18f112ff4552", #name:"wz_golova"}, 0:{#hash_19a686ca:#"hash_45f866da7af3a609", #name:"wz_forest"}])
	{
		if(is_true(getgametypesetting(map.var_19a686ca)) && map.name !== level.script)
		{
			var_775479a4[var_775479a4.size] = map.name;
		}
	}
	var_775479a4 = array::randomize(var_775479a4);
	arrayinsert(var_775479a4, level.script, 0);
	var_433a73b4 = [];
	var_dfe29608 = [];
	foreach(objective in level.var_1d153516)
	{
		var_877f4c5 = 1;
		structs = namespace_8b6a9d79::function_4485ab6d("objectiveCategory", objective);
		foreach(script_struct in structs)
		{
			if(isdefined(script_struct.var_4b7d58a))
			{
				var_877f4c5 = var_877f4c5 & (is_true(getgametypesetting(script_struct.var_4b7d58a)) || is_true(getdvarint(script_struct.var_4b7d58a, 0)));
			}
		}
		if(!var_877f4c5)
		{
			continue;
		}
		var_433a73b4[var_433a73b4.size] = objective;
		if(isdefined(level.var_f8197880[objective]))
		{
			var_ac58e8e0 = {#index:0, #list:array::randomize(level.var_f8197880[objective])};
			var_dfe29608[objective] = var_ac58e8e0;
		}
	}
	var_433a73b4 = array::randomize(var_433a73b4);
	level.var_7d45d0d4.var_dc858a58 = {#index:0, #list:arraycopy(var_775479a4)};
	level.var_7d45d0d4.var_407236bf = {#index:0, #list:var_433a73b4};
	level.var_7d45d0d4.var_9614b1d2 = var_dfe29608;
}

/*
	Name: function_eb705b60
	Namespace: namespace_18bbc38e
	Checksum: 0x674DC3E6
	Offset: 0x2000
	Size: 0x6E
	Parameters: 0
	Flags: Linked
*/
function function_eb705b60()
{
	level.var_7d45d0d4.var_dc858a58 = namespace_cf6efd05::function_8864b117();
	var_54187df8 = namespace_cf6efd05::function_b12c9424();
	level.var_7d45d0d4.var_407236bf = var_54187df8.var_407236bf;
	level.var_7d45d0d4.var_9614b1d2 = var_54187df8.var_f203d5e2;
}

/*
	Name: function_369007bb
	Namespace: namespace_18bbc38e
	Checksum: 0x5DC9C47D
	Offset: 0x2078
	Size: 0x2E0
	Parameters: 0
	Flags: Linked
*/
function function_369007bb()
{
	if(isarray(level.var_7d45d0d4.destinations))
	{
		destination = undefined;
		foreach(destination in level.var_7d45d0d4.destinations)
		{
			if(isdefined(destination))
			{
				break;
			}
		}
		if(!isdefined(destination))
		{
			return;
		}
		var_1776e253 = 0;
		for(i = 0; i < level.var_7d45d0d4.var_407236bf.list.size; i++)
		{
			next_objective = level.var_7d45d0d4.var_407236bf.list[level.var_7d45d0d4.var_407236bf.index];
			var_1776e253 = objective_exists(destination, next_objective);
			if(var_1776e253)
			{
				break;
			}
			level.var_7d45d0d4.var_407236bf.index = (level.var_7d45d0d4.var_407236bf.index + 1) % level.var_7d45d0d4.var_407236bf.list.size;
		}
		/#
			println("");
		#/
		if(isdefined(next_objective))
		{
			var_8b66998e = level.var_7d45d0d4.var_9614b1d2[next_objective];
			if(isdefined(var_8b66998e))
			{
				var_6da361da = undefined;
				for(j = 0; j < var_8b66998e.list.size; j++)
				{
					if(objective_exists(destination, next_objective, var_8b66998e.list[var_8b66998e.index]))
					{
						var_6da361da = var_8b66998e.list[var_8b66998e.index];
						break;
					}
					var_8b66998e.index = (var_8b66998e.index + 1) % var_8b66998e.list.size;
				}
				level.var_490ade6 = next_objective;
				level.var_c73744cc = var_6da361da;
			}
			else
			{
				level.var_490ade6 = next_objective;
			}
		}
	}
}

/*
	Name: function_e97f828e
	Namespace: namespace_18bbc38e
	Checksum: 0x94F8E4C3
	Offset: 0x2360
	Size: 0xFC
	Parameters: 0
	Flags: Linked
*/
function function_e97f828e()
{
	if(!namespace_cf6efd05::function_85b812c9())
	{
		function_bd104a73();
	}
	else
	{
		function_eb705b60();
	}
	if(getdvarstring(#"hash_4c7a7b0813c6765d") !== "")
	{
		level.var_7d45d0d4.var_407236bf = {#index:0, #list:array(getdvarstring(#"hash_4c7a7b0813c6765d"))};
	}
	function_63b54d8c();
	function_369007bb();
}

/*
	Name: objective_exists
	Namespace: namespace_18bbc38e
	Checksum: 0xB497B397
	Offset: 0x2468
	Size: 0xD6
	Parameters: 3
	Flags: Linked
*/
function objective_exists(destination, var_a3b3f1b, variant)
{
	instances = destination.var_e859e591[var_a3b3f1b];
	if(!isdefined(instances))
	{
		return false;
	}
	if(isdefined(variant))
	{
		foreach(instance in instances)
		{
			if(instance.variant === variant)
			{
				return true;
			}
		}
		return false;
	}
	return true;
}

/*
	Name: function_63b54d8c
	Namespace: namespace_18bbc38e
	Checksum: 0xB9F0F5CE
	Offset: 0x2548
	Size: 0x3A6
	Parameters: 0
	Flags: Linked
*/
function function_63b54d8c()
{
	if(level.var_b48509f9 === 1 && level.var_7d45d0d4.var_407236bf.list[0] === #"hunt")
	{
		if(isdefined(level.var_7d45d0d4.var_9614b1d2[#"hunt"]))
		{
			arrayremovevalue(level.var_7d45d0d4.var_9614b1d2[#"hunt"].list, #"hunt_steiner");
			arrayremovevalue(level.var_7d45d0d4.var_9614b1d2[#"hunt"].list, #"hash_45f927c8af6cf356");
			arrayinsert(level.var_7d45d0d4.var_9614b1d2[#"hunt"].list, #"hunt_steiner", function_21a3a673(1, level.var_7d45d0d4.var_9614b1d2[#"hunt"].list.size));
		}
	}
	else
	{
		if(level.var_b48509f9 === 2 && level.var_7d45d0d4.var_407236bf.list[1] === #"hunt")
		{
			if(isdefined(level.var_7d45d0d4.var_9614b1d2[#"hunt"]))
			{
				arrayremovevalue(level.var_7d45d0d4.var_9614b1d2[#"hunt"].list, #"hash_45f927c8af6cf356");
				arrayinsert(level.var_7d45d0d4.var_9614b1d2[#"hunt"].list, #"hash_45f927c8af6cf356", function_21a3a673(2, level.var_7d45d0d4.var_9614b1d2[#"hunt"].list.size));
			}
		}
		else if(level.var_b48509f9 === 1 && level.var_7d45d0d4.var_407236bf.list[0] === #"payload")
		{
			if(isdefined(level.var_7d45d0d4.var_9614b1d2.list[#"payload"]))
			{
				level.var_7d45d0d4.var_9614b1d2[#"payload"].list = [1:#"payload_teleport", 0:#"payload_noteleport"];
			}
		}
	}
}

