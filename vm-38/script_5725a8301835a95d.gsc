#using script_340a2e805e35f7a2;
#using script_7fc996fe8678852;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace namespace_1ab3fb7b;

/*
	Name: function_7c41e210
	Namespace: namespace_1ab3fb7b
	Checksum: 0xBFE855B3
	Offset: 0xE0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_7c41e210()
{
	level notify(1122012342);
}

/*
	Name: function_89f2df9
	Namespace: namespace_1ab3fb7b
	Checksum: 0xB7B3ACAD
	Offset: 0x100
	Size: 0x54
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_4e995bd55f8098d6", &function_70a657d8, undefined, &finalize, #"hash_f81b9dea74f0ee");
}

/*
	Name: function_70a657d8
	Namespace: namespace_1ab3fb7b
	Checksum: 0x1A6CCF29
	Offset: 0x160
	Size: 0x7C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	namespace_8b6a9d79::function_b3464a7c("harvest_essence", &function_a4cec352);
	namespace_8b6a9d79::function_b3464a7c("harvest_essence_small", &function_225965a4);
	namespace_8b6a9d79::function_b3464a7c("harvest_scrap", &function_7a918a3f);
}

/*
	Name: finalize
	Namespace: namespace_1ab3fb7b
	Checksum: 0x863BC0FA
	Offset: 0x1E8
	Size: 0x1C
	Parameters: 0
	Flags: Linked, Private
*/
function private finalize()
{
	/#
		level thread function_2085db3b();
	#/
}

/*
	Name: function_a4cec352
	Namespace: namespace_1ab3fb7b
	Checksum: 0xDAFEFB24
	Offset: 0x210
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function function_a4cec352(instance)
{
	function_871649b9(instance, #"hash_797f22647c9675c5", #"hash_48180c936f74c980", 5);
}

/*
	Name: function_225965a4
	Namespace: namespace_1ab3fb7b
	Checksum: 0xB47422F5
	Offset: 0x260
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function function_225965a4(instance)
{
	function_871649b9(instance, #"hash_1f16d05c9834eacd", #"hash_3c7dd21773d294f4", 25, vectorscale((0, 0, -1), 12));
}

/*
	Name: function_7a918a3f
	Namespace: namespace_1ab3fb7b
	Checksum: 0x698ECA37
	Offset: 0x2B8
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function function_7a918a3f(instance)
{
	function_871649b9(instance, #"hash_773e201984b53b32", #"hash_50291762896b25c8", 5);
}

/*
	Name: function_871649b9
	Namespace: namespace_1ab3fb7b
	Checksum: 0xFE3250AD
	Offset: 0x308
	Size: 0x384
	Parameters: 5
	Flags: Linked, Private
*/
function private function_871649b9(instance, var_eece1f6a, var_f8dfa2cf, n_spawns, v_offset)
{
	if(!isdefined(v_offset))
	{
		v_offset = (0, 0, 0);
	}
	level flag::wait_till(#"gameplay_started");
	instance flag::wait_till_clear(#"hash_788aaa9d57c1fa71");
	a_spawns = array::randomize((isdefined(instance.var_fe2612fe[var_eece1f6a]) ? instance.var_fe2612fe[var_eece1f6a] : []));
	if(!a_spawns.size)
	{
		return;
	}
	/#
		if(getdvarint(#"hash_3a6e54c134a6a916", 0) || n_spawns == -1)
		{
			n_spawns = a_spawns.size;
		}
	#/
	a_items = [];
	for(i = 0; i < n_spawns; i++)
	{
		if(isdefined(a_spawns[i]))
		{
			var_7acb5180 = a_spawns[i] namespace_65181344::function_fd87c780(var_f8dfa2cf, 1);
			if(isdefined(var_7acb5180[0]))
			{
				var_1a517f12 = getscriptbundle(var_7acb5180[0].var_a6762160.name);
				var_7adcadc1 = var_1a517f12.var_7adcadc1;
				var_6731866b = var_1a517f12.var_6731866b;
				var_e6ac0592 = var_1a517f12.var_e6ac0592;
				var_ada071fe = var_1a517f12.var_ada071fe;
				var_5ab74bb1 = var_1a517f12.var_5ab74bb1;
				var_50773731 = var_1a517f12.var_50773731;
				if(!isdefined(var_7adcadc1))
				{
					var_7adcadc1 = 0;
				}
				if(!isdefined(var_6731866b))
				{
					var_6731866b = 0;
				}
				if(!isdefined(var_e6ac0592))
				{
					var_e6ac0592 = 0;
				}
				if(!isdefined(var_ada071fe))
				{
					var_ada071fe = 0;
				}
				if(!isdefined(var_5ab74bb1))
				{
					var_5ab74bb1 = 0;
				}
				if(!isdefined(var_50773731))
				{
					var_50773731 = 0;
				}
				var_7acb5180[0].origin = (a_spawns[i].origin + (var_ada071fe, var_5ab74bb1, var_50773731)) + v_offset;
				var_7acb5180[0].angles = a_spawns[i].angles + (var_7adcadc1, var_6731866b, var_e6ac0592);
				/#
					a_spawns[i].var_b215c441 = 1;
				#/
				a_items = arraycombine(a_items, var_7acb5180);
			}
		}
	}
	instance.a_items = a_items;
	instance callback::function_d8abfc3d(#"hash_345e9169ebba28fb", &function_149da5dd);
	/#
		level util::delay(1, undefined, &function_95da1d88, instance, function_9e72a96(var_eece1f6a), var_f8dfa2cf);
	#/
}

/*
	Name: function_149da5dd
	Namespace: namespace_1ab3fb7b
	Checksum: 0x289B3147
	Offset: 0x698
	Size: 0x1CC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_149da5dd()
{
	self flag::set(#"hash_788aaa9d57c1fa71");
	self callback::function_52ac9652(#"hash_345e9169ebba28fb", &function_149da5dd);
	/#
		a_spawns = struct::get_array(self.targetname, "");
		foreach(spawn in a_spawns)
		{
			spawn.var_b215c441 = undefined;
		}
	#/
	if(isdefined(self.a_items))
	{
		foreach(item in self.a_items)
		{
			/#
				self.var_b215c441 = undefined;
			#/
			if(isdefined(item))
			{
				item delete();
				waitframe(1);
			}
		}
		self.a_items = undefined;
	}
	self flag::clear(#"hash_788aaa9d57c1fa71");
}

/*
	Name: function_2085db3b
	Namespace: namespace_1ab3fb7b
	Checksum: 0xC7E09174
	Offset: 0x870
	Size: 0x13C
	Parameters: 0
	Flags: Private
*/
function private function_2085db3b()
{
	/#
		util::waittill_can_add_debug_command();
		util::function_e2e9d901("", "");
		util::function_e2e9d901("", "");
		util::function_e2e9d901("", "");
		util::function_e2e9d901("", "");
		util::function_e2e9d901("", "");
		util::function_e2e9d901("", "");
		util::function_e2e9d901("", "");
		util::function_e2e9d901("", "");
		util::function_e2e9d901("", "");
	#/
}

/*
	Name: function_95da1d88
	Namespace: namespace_1ab3fb7b
	Checksum: 0xB9203FC9
	Offset: 0x9B8
	Size: 0x41E
	Parameters: 3
	Flags: Private
*/
function private function_95da1d88(instance, var_eece1f6a, var_f8dfa2cf)
{
	/#
		instance notify(#"hash_554bb5d130031f06");
		instance endon(#"hash_554bb5d130031f06");
		a_spawns = (isdefined(instance.var_fe2612fe[var_eece1f6a]) ? instance.var_fe2612fe[var_eece1f6a] : []);
		if(!a_spawns.size)
		{
			return;
		}
		n_spawn = 0;
		var_9911be33 = "" + var_eece1f6a;
		while(true)
		{
			n_debug = getdvarint(var_9911be33, 0);
			if(n_debug)
			{
				if(n_debug == 2)
				{
					setdvar(var_9911be33, 1);
					iprintlnbold(("" + function_9e72a96(var_eece1f6a)) + "");
					if(var_9911be33 == "")
					{
						v_offset = vectorscale((0, 0, -1), 12);
					}
					else
					{
						v_offset = (0, 0, 0);
					}
					instance function_149da5dd();
					function_871649b9(instance, var_eece1f6a, var_f8dfa2cf, -1, v_offset);
					iprintlnbold("");
				}
				foreach(spawn in a_spawns)
				{
					if(is_true(spawn.var_b215c441))
					{
						str_color = (1, 0.5, 0);
					}
					else
					{
						str_color = vectorscale((1, 1, 1), 0.75);
					}
					n_radius = 64;
					n_dist = distance(spawn.origin, getplayers()[0].origin);
					n_radius = n_radius * (n_dist / 3000);
					sphere(spawn.origin, n_radius, str_color, 1, 0, 7, 5);
				}
				if(n_debug == 3)
				{
					setdvar(var_9911be33, 1);
					if(n_spawn >= (a_spawns.size - 1))
					{
						n_spawn = 0;
					}
					s_spawn = a_spawns[n_spawn];
					if(isdefined(s_spawn))
					{
						foreach(player in function_a1ef346b())
						{
							player setorigin(s_spawn.origin);
						}
						n_spawn++;
					}
				}
			}
			waitframe(5);
		}
	#/
}

