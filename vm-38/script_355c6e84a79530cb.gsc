#using script_1029986e2bc8ca8e;
#using script_1cc417743d7c262d;
#using script_23ffc3f9567be80c;
#using script_25be5471a9c31833;
#using script_2618e0f3e5e11649;
#using script_340a2e805e35f7a2;
#using script_4ccfb58a9443a60b;
#using script_6b2d896ac43eb90;
#using script_6fc2be37feeb317b;
#using script_7a5293d92c61c788;
#using script_7fc996fe8678852;
#using scripts\core_common\armor.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace namespace_73df937d;

/*
	Name: function_eefe9674
	Namespace: namespace_73df937d
	Checksum: 0x96283A71
	Offset: 0x250
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_eefe9674()
{
	level notify(573308556);
}

/*
	Name: function_89f2df9
	Namespace: namespace_73df937d
	Checksum: 0x199FFDBA
	Offset: 0x270
	Size: 0x54
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_5ff56dba9074b0b4", &function_70a657d8, undefined, &finalize, #"hash_f81b9dea74f0ee");
}

/*
	Name: function_70a657d8
	Namespace: namespace_73df937d
	Checksum: 0xEE63D56D
	Offset: 0x2D0
	Size: 0xC4
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	namespace_8b6a9d79::function_b3464a7c("safehouse", &function_d0e7af66);
	level clientfield::register("scriptmover", "safehouse_claim_fx", 1, 1, "int");
	callback::add_callback(#"objective_started", &function_83b6d24a);
	callback::add_callback(#"hash_69090774fec4a17b", &function_2b1da4a6);
}

/*
	Name: finalize
	Namespace: namespace_73df937d
	Checksum: 0x7137DCA7
	Offset: 0x3A0
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function finalize()
{
	level.var_7d45d0d4.var_a4bccdb2 = [];
	level.var_7d45d0d4.var_bb7e7804 = 1;
	level thread function_9d178321();
	/#
		level thread function_2085db3b();
	#/
}

/*
	Name: function_de302547
	Namespace: namespace_73df937d
	Checksum: 0x482F8B89
	Offset: 0x408
	Size: 0x21A
	Parameters: 1
	Flags: Linked
*/
function function_de302547(destination)
{
	var_3007472f = level.var_7d45d0d4.var_1d9d92ba.var_d5b937da;
	if(isdefined(var_3007472f))
	{
		var_df889249 = array::random(strtok(var_3007472f, ","));
	}
	var_85065ec2 = [];
	foreach(location in destination.locations)
	{
		safehouse = location.instances[#"safehouse"];
		if(isdefined(safehouse))
		{
			var_5838bf4c = safehouse;
			if(!isdefined(var_df889249) || var_df889249 === safehouse.script_int)
			{
				if(!isdefined(var_85065ec2))
				{
					var_85065ec2 = [];
				}
				else if(!isarray(var_85065ec2))
				{
					var_85065ec2 = array(var_85065ec2);
				}
				var_85065ec2[var_85065ec2.size] = safehouse;
			}
		}
	}
	safehouse = array::random(var_85065ec2);
	if(!isdefined(var_5838bf4c))
	{
		safehouse = var_5838bf4c;
	}
	if(isdefined(safehouse))
	{
		objective_manager::function_9d4e6125(safehouse.content_script_name);
		namespace_8b6a9d79::function_20d7e9c7(safehouse);
		level.var_7d45d0d4.var_c4181ea = safehouse;
	}
}

/*
	Name: function_d0e7af66
	Namespace: namespace_73df937d
	Checksum: 0x960E6B69
	Offset: 0x630
	Size: 0x15C
	Parameters: 1
	Flags: Linked
*/
function function_d0e7af66(instance)
{
	/#
		assert(isarray(instance.var_fe2612fe[#"hash_71b89bdce48d11f6"]), "");
	#/
	/#
		assert(instance.var_fe2612fe[#"hash_71b89bdce48d11f6"].size == 1, "");
	#/
	namespace_ce1f29cc::function_12c2f41f(instance.origin, 2500);
	var_f86415a9 = arraysortclosest(getentarray("ambush_trigger", "targetname"), instance.origin, undefined, undefined, 2500);
	array::delete_all(var_f86415a9);
	var_7d0e37f8 = instance.var_fe2612fe[#"hash_71b89bdce48d11f6"][0];
	function_e9bd72e8(var_7d0e37f8, instance);
}

/*
	Name: function_2b0784c1
	Namespace: namespace_73df937d
	Checksum: 0xFA41940D
	Offset: 0x798
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_2b0784c1()
{
	self luinotifyevent(#"hash_5159e35a62fb7083", 3, 1, 0, 0);
}

/*
	Name: function_d9ea0e09
	Namespace: namespace_73df937d
	Checksum: 0x6B25308B
	Offset: 0x7D8
	Size: 0x30C
	Parameters: 1
	Flags: Linked
*/
function function_d9ea0e09(eventstruct)
{
	/#
		assert(isdefined(self.instance), "");
	#/
	if(flag::get("objective_locked"))
	{
		return;
	}
	player = eventstruct.activator;
	instance = self.instance;
	scriptmodel = self.scriptmodel;
	if(isplayer(player) && player zm_score::can_player_purchase(0) && !is_true(self.var_c1e1d9cb))
	{
		foreach(spectator in getplayers())
		{
			if(spectator.sessionstate === "spectator")
			{
				spectator notify(#"force_spawn");
			}
		}
		self.var_c1e1d9cb = 1;
		scriptmodel clientfield::set("safehouse_claim_fx", 0);
		level thread function_e1fab6a9(instance, scriptmodel.origin);
		level thread function_98715738(instance);
		playrumbleonposition("sr_prototype_safehouse_rumble", self.origin);
		player thread function_2b0784c1();
		player zm_score::minus_to_player_score(0);
		objid = instance.objectiveid;
		objective_setinvisibletoall(objid);
		waittillframeend();
		util::wait_network_frame();
		level notify(#"hash_581a9d913f67821a");
		if(isdefined(self))
		{
			if(isdefined(scriptmodel))
			{
				scriptmodel delete();
			}
			self delete();
		}
	}
	else
	{
		playsoundatposition(#"hash_331360fb3bc61a2e", scriptmodel.origin + vectorscale((0, 0, 1), 50));
	}
}

/*
	Name: function_e1fab6a9
	Namespace: namespace_73df937d
	Checksum: 0xCEEF1EAF
	Offset: 0xAF0
	Size: 0x1B0
	Parameters: 2
	Flags: Linked
*/
function function_e1fab6a9(instance, v_center)
{
	/#
		assert(isdefined(instance), "");
	#/
	a_machines = namespace_8b6a9d79::function_f703a5a(instance);
	a_machines = arraysortclosest(a_machines, v_center);
	n_time_elapsed = 0;
	wait(2.4);
	foreach(s_machine in a_machines)
	{
		n_dist = distance(s_machine.origin, v_center);
		n_wait = (((n_dist / 600) * 1.5) - n_time_elapsed) - 0.1;
		if(n_wait > 0 && n_time_elapsed < 1.5)
		{
			wait(n_wait);
			n_time_elapsed = n_time_elapsed + n_wait;
		}
		level thread function_ae44cb3d(instance, s_machine.content_key);
	}
}

/*
	Name: function_ae44cb3d
	Namespace: namespace_73df937d
	Checksum: 0xC02DB32D
	Offset: 0xCA8
	Size: 0x1D2
	Parameters: 2
	Flags: Linked
*/
function function_ae44cb3d(instance, var_eece1f6a)
{
	switch(var_eece1f6a)
	{
		case "hash_6217ef2a3d7d895b":
		{
			if(zm_utility::is_survival())
			{
				var_78a3e26a = #"hash_6e47d6576612543c";
			}
			else
			{
				var_78a3e26a = #"p9_fxanim_zm_gp_wunderfizz_on_xmodel";
			}
			namespace_82b4c2d1::function_999594fe(instance.var_fe2612fe[#"hash_6217ef2a3d7d895b"], #"hash_4af85251966549b8", var_78a3e26a, #"hash_3eac5ec7a888ddfb", 0);
			break;
		}
		case "hash_629e563c2ebf707a":
		{
			namespace_dd7e54e3::function_1cbc3614(instance.var_fe2612fe[#"hash_629e563c2ebf707a"]);
			break;
		}
		case "crafting_table":
		{
			namespace_1cc7b406::function_7dddb953(instance.var_fe2612fe[#"crafting_table"]);
			break;
		}
		case "hash_448adaf187bbb953":
		{
			namespace_4b9fccd8::function_cb9d309b(instance.var_fe2612fe[#"hash_448adaf187bbb953"]);
			break;
		}
		case "beacon":
		{
			namespace_dbb31ff3::function_67dce9cd(instance.var_fe2612fe[#"beacon"]);
			break;
		}
	}
}

/*
	Name: function_f1bc8a08
	Namespace: namespace_73df937d
	Checksum: 0x58888A84
	Offset: 0xE88
	Size: 0x17A
	Parameters: 1
	Flags: None
*/
function function_f1bc8a08(player)
{
	self endon(#"death");
	if(isdefined(player.armortier))
	{
		switch(player.armortier)
		{
			case 0:
			{
				self sethintstring(#"hash_5a07d4e777cd962a", "Armor Lv. 1", 500);
				break;
			}
			case 1:
			{
				self sethintstring(#"hash_5a07d4e777cd962a", "Armor Lv. 2", 1000);
				break;
			}
			case 2:
			{
				self sethintstring(#"hash_5a07d4e777cd962a", "Armor Lv. 3", 1500);
				break;
			}
			case 3:
			{
				if(player armor::at_peak_armor_bars())
				{
					self sethintstring(#"hash_7dfea1c8f4ee103");
				}
				else
				{
					self sethintstring(#"hash_3ed2de51f2aea0ff", 1000);
				}
				break;
			}
		}
	}
}

/*
	Name: function_e9bd72e8
	Namespace: namespace_73df937d
	Checksum: 0xBFEABE93
	Offset: 0x1010
	Size: 0x17A
	Parameters: 2
	Flags: Linked
*/
function function_e9bd72e8(var_7d0e37f8, instance)
{
	scriptmodel = namespace_8b6a9d79::spawn_script_model(var_7d0e37f8, "tag_origin");
	scriptmodel.origin = scriptmodel.origin + vectorscale((0, 0, 1), 40);
	scriptmodel clientfield::set("safehouse_claim_fx", 1);
	scriptmodel.targetname = "unclaimed_safehouse";
	trigger = namespace_8b6a9d79::function_214737c7(var_7d0e37f8, &function_d9ea0e09, #"hash_5ecd49cccca29d87", 0, undefined, undefined, undefined, vectorscale((0, 0, 1), 40));
	trigger.instance = instance;
	trigger.scriptmodel = scriptmodel;
	if(!isdefined(instance.objectiveid))
	{
		objid = zm_utility::function_f5a222a8(#"hash_5eb3b916fdb77012", scriptmodel);
		instance.objectiveid = objid;
		scriptmodel zm_utility::function_747180ea(objid, undefined, trigger);
	}
	else
	{
		objective_setvisibletoall(instance.objectiveid);
	}
	var_7d0e37f8.claimtrigger = trigger;
}

/*
	Name: function_83b6d24a
	Namespace: namespace_73df937d
	Checksum: 0xC3298C7
	Offset: 0x1198
	Size: 0x120
	Parameters: 0
	Flags: Linked
*/
function function_83b6d24a()
{
	foreach(location in level.var_7d45d0d4.locations)
	{
		safehouse = location.instances[#"safehouse"];
		if(isdefined(safehouse.var_fe2612fe[#"hash_71b89bdce48d11f6"][0].claimtrigger))
		{
			trigger = safehouse.var_fe2612fe[#"hash_71b89bdce48d11f6"][0].claimtrigger;
			trigger sethintstring(#"hash_6d645426c03ab096");
		}
	}
}

/*
	Name: function_2b1da4a6
	Namespace: namespace_73df937d
	Checksum: 0x6ED3FD79
	Offset: 0x12C0
	Size: 0x120
	Parameters: 0
	Flags: Linked
*/
function function_2b1da4a6()
{
	foreach(location in level.var_7d45d0d4.locations)
	{
		safehouse = location.instances[#"safehouse"];
		if(isdefined(safehouse.var_fe2612fe[#"hash_71b89bdce48d11f6"][0].claimtrigger))
		{
			trigger = safehouse.var_fe2612fe[#"hash_71b89bdce48d11f6"][0].claimtrigger;
			trigger sethintstring(#"hash_5ecd49cccca29d87", 0);
		}
	}
}

/*
	Name: function_7fa49a26
	Namespace: namespace_73df937d
	Checksum: 0xFB4E0016
	Offset: 0x13E8
	Size: 0x22
	Parameters: 2
	Flags: None
*/
function function_7fa49a26(instance, var_56fa2ec1)
{
	instance.var_1dab08f1 = var_56fa2ec1;
}

/*
	Name: function_9d178321
	Namespace: namespace_73df937d
	Checksum: 0x1271F3AD
	Offset: 0x1418
	Size: 0x1DE
	Parameters: 0
	Flags: Linked, Private
*/
function private function_9d178321()
{
	level flag::wait_till(#"hash_7ace2c0d668c5128");
	foreach(location in level.var_7d45d0d4.locations)
	{
		safehouse = location.instances[#"safehouse"];
		if(isdefined(safehouse))
		{
			a_structs = struct::get_array(safehouse.targetname, "target");
			foreach(struct in a_structs)
			{
				if(struct.content_key === #"hash_4e5c1619877bed34")
				{
					safehouse.var_8947b368 = namespace_8b6a9d79::spawn_script_model(struct, #"toy_stuffed_animal_monkey_01");
					safehouse.var_8947b368 val::set(#"hash_4e5c1619877bed34", "allowdeath", 0);
					return;
				}
			}
		}
	}
}

/*
	Name: function_98715738
	Namespace: namespace_73df937d
	Checksum: 0x2D975B80
	Offset: 0x1600
	Size: 0x304
	Parameters: 1
	Flags: Linked, Private
*/
function private function_98715738(instance)
{
	var_8947b368 = instance.var_8947b368;
	s_ee = instance.var_fe2612fe[#"hash_4e5c1619877bed34"][0];
	if(!isdefined(var_8947b368))
	{
		if(isdefined(s_ee))
		{
			foreach(location in level.var_7d45d0d4.locations)
			{
				safehouse = location.instances[#"safehouse"];
				if(isdefined(safehouse.var_8947b368))
				{
					safehouse.var_8947b368 delete();
					break;
				}
			}
			var_8947b368 = namespace_8b6a9d79::spawn_script_model(s_ee, #"toy_stuffed_animal_monkey_01");
			var_8947b368 val::set(#"hash_4e5c1619877bed34", "allowdeath", 0);
		}
		else
		{
			return;
		}
	}
	if(isdefined(var_8947b368) && isdefined(s_ee))
	{
		var_8947b368 val::set(#"hash_4e5c1619877bed34", "takedamage", 1);
		s_result = undefined;
		s_result = var_8947b368 waittill(#"damage", #"death");
		player = s_result.attacker;
		if(isplayer(player) && player getstance() === "crouch")
		{
			weapon = player getcurrentweapon();
			wait(5);
			if(isalive(player) && player getstance() === "prone" && weapon !== player getcurrentweapon())
			{
				s_ee.angles = s_ee.angles + vectorscale((0, 1, 0), 90);
				s_ee thread namespace_65181344::function_fd87c780(#"hash_14887a623002c3ff", 1, 2);
			}
		}
	}
}

/*
	Name: function_2085db3b
	Namespace: namespace_73df937d
	Checksum: 0xDF641E74
	Offset: 0x1910
	Size: 0x84
	Parameters: 0
	Flags: None
*/
function function_2085db3b()
{
	/#
		util::waittill_can_add_debug_command();
		level thread function_dab40c5f();
		adddebugcommand("");
		util::function_e2e9d901(namespace_8b6a9d79::function_7956c7ac("", 105), "");
	#/
}

/*
	Name: function_dab40c5f
	Namespace: namespace_73df937d
	Checksum: 0xC3BD2626
	Offset: 0x19A0
	Size: 0x124
	Parameters: 0
	Flags: None
*/
function function_dab40c5f()
{
	/#
		while(true)
		{
			if(getdvarint(#"hash_112f254e6d461fd6", 0))
			{
				setdvar(#"hash_112f254e6d461fd6", 0);
				instance = level.var_7d45d0d4.var_c4181ea;
				if(isdefined(instance))
				{
					foreach(player in getplayers())
					{
						player setorigin(instance.origin);
					}
				}
			}
			wait(0.1);
		}
	#/
}

