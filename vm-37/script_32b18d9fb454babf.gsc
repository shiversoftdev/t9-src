#using script_1029986e2bc8ca8e;
#using script_13d5d0aa9140d362;
#using script_1520735551406676;
#using script_16b1b77a76492c6a;
#using script_176597095ddfaa17;
#using script_2618e0f3e5e11649;
#using script_355c6e84a79530cb;
#using script_5b2a3c052bf17d0e;
#using script_799de24f8ad427f7;
#using script_7b1cd3908a825fdd;
#using script_7d7ac1f663edcdc8;
#using script_7fc996fe8678852;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace namespace_18bbc38e;

/*
	Name: function_89f2df9
	Namespace: namespace_18bbc38e
	Checksum: 0xFEA04D51
	Offset: 0x1C8
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_5bcba15330839867", &function_70a657d8, undefined, undefined, #"hash_110e3595fef1adb7");
}

/*
	Name: function_70a657d8
	Namespace: namespace_18bbc38e
	Checksum: 0x82AD0124
	Offset: 0x218
	Size: 0xD4
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	level.var_7d45d0d4.var_64a75da7 = &function_64a75da7;
	level.var_7d45d0d4.var_dbc06c4b = &function_4824f1b9;
	level.var_7d45d0d4.var_314d6e9b = &function_314d6e9b;
	level.var_7d45d0d4.var_a3205267 = &function_a3205267;
	level.var_7d45d0d4.var_62a42ce = &function_62a42ce;
	level callback::add_callback(#"hash_565739346fc951ae", &function_74c76da9);
}

/*
	Name: function_64a75da7
	Namespace: namespace_18bbc38e
	Checksum: 0xDAC09EE8
	Offset: 0x2F8
	Size: 0x232
	Parameters: 0
	Flags: Private
*/
function private function_64a75da7()
{
	/#
		if(getdvarint(#"hash_33b0be96bf3cd69a", 0))
		{
			level.var_7d45d0d4.var_d60029a6 = array(level.var_7d45d0d4.var_5f2429b1);
			level.var_7d45d0d4.currentdestination = level.var_7d45d0d4.var_5f2429b1;
			level flag::set(#"hash_7ace2c0d668c5128");
			level namespace_b57ebf44::activate(level.var_7d45d0d4.var_5f2429b1);
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
	Checksum: 0x1DB61CE8
	Offset: 0x538
	Size: 0x4C
	Parameters: 0
	Flags: None
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
	Checksum: 0xA36EC827
	Offset: 0x590
	Size: 0x54
	Parameters: 1
	Flags: None
*/
function function_314d6e9b(destination)
{
	level endon(#"game_ended");
	level thread namespace_73df937d::function_de302547(destination);
	level waittill(#"hash_581a9d913f67821a");
}

/*
	Name: function_a3205267
	Namespace: namespace_18bbc38e
	Checksum: 0x4E526AA3
	Offset: 0x5F0
	Size: 0x7C
	Parameters: 1
	Flags: None
*/
function function_a3205267(destination)
{
	level thread namespace_ce1f29cc::function_6b885d72(destination);
	level thread function_cef826da(destination);
	level flag::wait_till_all(array(#"hash_10679ff0bf4d6c8d", #"intro_scene_done"));
}

/*
	Name: function_62a42ce
	Namespace: namespace_18bbc38e
	Checksum: 0xE945492E
	Offset: 0x678
	Size: 0xF4
	Parameters: 1
	Flags: None
*/
function function_62a42ce(destination)
{
	level thread namespace_e51c1e80::spawn_vehicles(destination);
	function_13e266a2(destination);
	namespace_957938f0::function_4317fa79(destination);
	namespace_25297a8a::function_8adcc97a(destination);
	level thread namespace_2c949ef8::function_c0966bb1(destination);
	if(is_true(getgametypesetting(#"hash_59854c1f30538261")))
	{
		announce = objective_manager::function_7bfeebe3() > 0;
		namespace_d0ab5955::function_d4dec4e8(destination, announce);
	}
}

/*
	Name: function_74c76da9
	Namespace: namespace_18bbc38e
	Checksum: 0xA7B39A32
	Offset: 0x778
	Size: 0x74
	Parameters: 1
	Flags: None
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
	Checksum: 0x4A6DF1AB
	Offset: 0x7F8
	Size: 0x290
	Parameters: 1
	Flags: Private
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
		var_c3d93d9f = location.instances[#"hash_5181ae906252ee6b"];
		if(isdefined(var_c3d93d9f))
		{
			namespace_8b6a9d79::function_20d7e9c7(var_c3d93d9f);
		}
		var_c3d93d9f = location.instances[#"hash_3f6682051a5f4b83"];
		if(isdefined(var_c3d93d9f))
		{
			namespace_8b6a9d79::function_20d7e9c7(var_c3d93d9f);
		}
		var_a1f9a8cd = location.instances[#"hash_5123950c4e4bbbcc"];
		if(isdefined(var_a1f9a8cd))
		{
			namespace_8b6a9d79::function_20d7e9c7(var_a1f9a8cd);
		}
		util::wait_network_frame();
	}
}

/*
	Name: function_13e266a2
	Namespace: namespace_18bbc38e
	Checksum: 0x4DADA22B
	Offset: 0xA90
	Size: 0x12A
	Parameters: 1
	Flags: Private
*/
function private function_13e266a2(destination)
{
	level.var_3ed04e02 = [];
	var_90e97a54 = level.var_7d45d0d4.var_ab00156;
	n_to_spawn = function_21a3a673(2, 3);
	n_spawned = 0;
	while(var_90e97a54.size)
	{
		str_type = var_90e97a54[randomint(var_90e97a54.size)];
		arrayremovevalue(var_90e97a54, str_type, 0);
		b_spawned = function_72e456e3(destination, str_type);
		if(is_true(b_spawned))
		{
			n_spawned++;
		}
		if(n_spawned >= n_to_spawn && !getdvarint(#"hash_730311c63805303a", 0))
		{
			break;
		}
	}
}

/*
	Name: function_72e456e3
	Namespace: namespace_18bbc38e
	Checksum: 0x1805DA92
	Offset: 0xBC8
	Size: 0x432
	Parameters: 2
	Flags: Private
*/
function private function_72e456e3(destination, str_type)
{
	var_ba9835cd = [];
	if(!isdefined(level.var_3ed04e02))
	{
		level.var_3ed04e02 = [];
	}
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
						if(isdefined(destination.var_cd5ba489[var_a2593226]))
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
	Checksum: 0x2987A19A
	Offset: 0x1008
	Size: 0x4D2
	Parameters: 0
	Flags: Private
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
			category = script.var_eef6eb91;
			destination.var_e859e591 = [];
			destination.var_e859e591[category] = array(instance);
			var_a3c51b07[i] = destination;
		}
		a_spawns = namespace_b57ebf44::function_f3be07d7(var_a3c51b07[0]);
		var_58b02068 = struct::get(a_spawns[0].target, "targetname");
		level.var_7767cea8 = array(var_58b02068);
		level.var_7767cea8[0].spawns = a_spawns;
		namespace_b57ebf44::function_123b048f(var_a3c51b07[0]);
		return var_a3c51b07;
	}
}

/*
	Name: function_b3dda48
	Namespace: namespace_18bbc38e
	Checksum: 0x2BF535C1
	Offset: 0x14E8
	Size: 0x17C
	Parameters: 1
	Flags: Private
*/
function private function_b3dda48(s_destination)
{
	if(!zm_utility::function_e51dc2d8())
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

