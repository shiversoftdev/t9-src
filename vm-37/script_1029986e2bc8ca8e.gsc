#using script_193d6fcd3b319d05;
#using script_5961deb533dad533;
#using scripts\zm_common\zm_utility.gsc;
#using script_7d7ac1f663edcdc8;
#using scripts\zm_common\zm_player.gsc;
#using scripts\zm_common\zm_laststand.gsc;
#using script_1cc417743d7c262d;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using script_7fc996fe8678852;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using script_113dd7f0ea2a1d4f;

#namespace objective_manager;

/*
	Name: __init__system__
	Namespace: objective_manager
	Checksum: 0x70B01070
	Offset: 0x248
	Size: 0x54
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"objective_manager", &function_70a657d8, undefined, &finalize, #"hash_f81b9dea74f0ee");
}

/*
	Name: function_70a657d8
	Namespace: objective_manager
	Checksum: 0x75F03290
	Offset: 0x2A8
	Size: 0x1CC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("actor", "" + #"hash_501374858f77990b", 1, 1, "int");
	clientfield::register("actor", "objective_cf_callout_rob", 1, 2, "int");
	clientfield::register("toplayer", "sr_defend_timer", 18000, getminbitcountfornum(540), "int");
	clientfield::register("scriptmover", "" + #"hash_501374858f77990b", 1, 1, "int");
	clientfield::register("scriptmover", "objective_cf_callout_rob", 1, 2, "int");
	clientfield::register("vehicle", "objective_cf_callout_rob", 1, 2, "int");
	clientfield::function_5b7d846d("hudItems.warzone.objectiveTotal", 1, 5, "int");
	clientfield::function_5b7d846d("hudItems.warzone.objectivesCompleted", 1, 5, "int");
	level.var_cf558bf = 0;
	level.var_4f12f6d0 = sr_objective_timer::register();
}

/*
	Name: finalize
	Namespace: objective_manager
	Checksum: 0xBFFBF3E6
	Offset: 0x480
	Size: 0x1C
	Parameters: 0
	Flags: Linked, Private
*/
function private finalize()
{
	/#
		level thread init_devgui();
	#/
}

/*
	Name: function_b3464a7c
	Namespace: objective_manager
	Checksum: 0x11976515
	Offset: 0x4A8
	Size: 0x192
	Parameters: 9
	Flags: Linked
*/
function function_b3464a7c(scriptname, spawncallback, startcallback, category, waypoint, var_4b7d58a, var_b4fae213, var_3fc9b09f, var_549cb6f6)
{
	if(!isdefined(var_3fc9b09f))
	{
		var_3fc9b09f = #"hash_248bfcefe7e51481";
	}
	if(!isdefined(var_549cb6f6))
	{
		var_549cb6f6 = undefined;
	}
	/#
		assert(isstring(scriptname) || ishash(scriptname));
	#/
	/#
		assert(isfunctionptr(startcallback));
	#/
	/#
		assert(ishash(category));
	#/
	script = namespace_8b6a9d79::function_b3464a7c(scriptname, (isdefined(var_549cb6f6) ? var_549cb6f6 : &function_4e8b29ac));
	script.var_32523552 = spawncallback;
	script.var_11dcc37e = startcallback;
	script.objectivecategory = category;
	script.var_4b7d58a = var_4b7d58a;
	script.var_b4fae213 = var_b4fae213;
	script.var_331b7cc3 = waypoint;
	script.var_9ddbb7c = var_3fc9b09f;
}

/*
	Name: objective_ended
	Namespace: objective_manager
	Checksum: 0x24E10E8A
	Offset: 0x648
	Size: 0x244
	Parameters: 2
	Flags: Linked
*/
function objective_ended(instance, completed)
{
	if(!isdefined(completed))
	{
		completed = 1;
	}
	/#
		assert(isstruct(instance));
	#/
	/#
		assert(level.var_7d45d0d4.var_3385b421 == instance);
	#/
	/#
		assert(isint(completed));
	#/
	level.var_7d45d0d4.var_1d9d92ba = level.var_7d45d0d4.var_3385b421;
	level.var_7d45d0d4.var_3385b421 = undefined;
	level flag::clear("objective_locked");
	level.var_cf558bf++;
	function_2fe379cd();
	if(completed)
	{
		level function_dc7dedf9();
	}
	else
	{
		level flag::set("failed_any_objective");
		level function_cad28879();
		if(is_true(instance.var_7a9e6505))
		{
			level thread function_43529cfe();
		}
	}
	level notify(#"objective_ended", {#completed:completed});
	level callback::callback(#"objective_ended", {#completed:completed, #instance:instance});
	instance.success = completed;
	instance notify(#"objective_ended");
	thread function_1571bce9();
}

/*
	Name: function_43529cfe
	Namespace: objective_manager
	Checksum: 0x4A03867B
	Offset: 0x898
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function function_43529cfe()
{
	namespace_553954de::end_match(0);
}

/*
	Name: function_d28e25e7
	Namespace: objective_manager
	Checksum: 0x30099D75
	Offset: 0x8C0
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function function_d28e25e7(var_2e19be37)
{
	/#
		assert(var_2e19be37 <= 32, "");
	#/
	if(clientfield::can_set("hudItems.warzone.objectivesCompleted"))
	{
		level clientfield::set_world_uimodel("hudItems.warzone.objectivesCompleted", var_2e19be37);
	}
}

/*
	Name: function_9f6de950
	Namespace: objective_manager
	Checksum: 0xFF3571D5
	Offset: 0x938
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function function_9f6de950(objectivetotal)
{
	/#
		assert(objectivetotal <= 32, "");
	#/
	if(clientfield::can_set("hudItems.warzone.objectiveTotal"))
	{
		level clientfield::set_world_uimodel("hudItems.warzone.objectiveTotal", objectivetotal);
	}
}

/*
	Name: function_1571bce9
	Namespace: objective_manager
	Checksum: 0xC00E77EC
	Offset: 0x9B0
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function function_1571bce9(n_display_time)
{
	if(!isdefined(n_display_time))
	{
		n_display_time = 10;
	}
	level endon(#"game_ended");
	wait(n_display_time);
	function_9f6de950(0);
	function_d28e25e7(0);
}

/*
	Name: function_db1c6627
	Namespace: objective_manager
	Checksum: 0x6C75E995
	Offset: 0xA20
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_db1c6627()
{
	self clientfield::set("objective_cf_callout_rob", 1);
}

/*
	Name: function_3b0ab786
	Namespace: objective_manager
	Checksum: 0x47E26265
	Offset: 0xA50
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_3b0ab786()
{
	self clientfield::set("objective_cf_callout_rob", 2);
}

/*
	Name: function_811514c3
	Namespace: objective_manager
	Checksum: 0xA319ED99
	Offset: 0xA80
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_811514c3()
{
	self clientfield::set("objective_cf_callout_rob", 0);
}

/*
	Name: function_20f53e16
	Namespace: objective_manager
	Checksum: 0xAA2D979C
	Offset: 0xAB0
	Size: 0x11A
	Parameters: 1
	Flags: Private
*/
function private function_20f53e16(&instances)
{
	level endon(#"game_ended");
	foreach(instance in instances)
	{
		namespace_8b6a9d79::function_20d7e9c7(instance);
		s_result = undefined;
		s_result = level waittill(#"objective_ended");
		if(s_result.completed === 0 && getdvarint(#"hash_15b141da1584bd0d", 1))
		{
			namespace_553954de::end_match(0);
			return;
		}
	}
}

/*
	Name: function_b06af8e3
	Namespace: objective_manager
	Checksum: 0xA724E0F1
	Offset: 0xBD8
	Size: 0x46C
	Parameters: 2
	Flags: Linked
*/
function function_b06af8e3(destination, var_2923cf48)
{
	if(!isdefined(var_2923cf48))
	{
		var_2923cf48 = 0;
	}
	foreach(category in level.var_aaa6544c)
	{
		variant = undefined;
		if(category == #"final_battle" || category == #"exfil" || category == #"ee")
		{
			continue;
		}
		else
		{
			if(category === #"payload_teleport" || category === #"payload_noteleport")
			{
				variant = category;
				category = #"payload";
			}
			else if(category === #"hunt_steiner" || category === #"hash_45f927c8af6cf356" || category === #"hunt_raz")
			{
				variant = category;
				category = #"hunt";
			}
		}
		instances = destination.var_e859e591[category];
		if(!isdefined(instances))
		{
			continue;
		}
		if(isdefined(destination.var_cd5ba489[category]) && !var_2923cf48)
		{
			continue;
		}
		instances = array::randomize(instances);
		if(isdefined(variant))
		{
			category = variant;
			foreach(s_instance in instances)
			{
				if(s_instance.variant === variant)
				{
					instance = s_instance;
					break;
				}
			}
		}
		else if(!var_2923cf48 && level.var_cf558bf < 1 && (category === #"hunt" || category === #"payload"))
		{
			foreach(s_instance in instances)
			{
				if(s_instance.variant !== #"hunt_steiner" && s_instance.variant !== #"hash_45f927c8af6cf356" && s_instance.variant !== #"payload_teleport")
				{
					instance = s_instance;
					break;
				}
			}
		}
		if(!isdefined(instance))
		{
			instance = instances[0];
		}
		arrayremovevalue(level.var_aaa6544c, category);
		level.var_aaa6544c[level.var_aaa6544c.size] = category;
		level.var_7d45d0d4.nextobjective = instance;
		destination.var_cd5ba489[category] = instance;
		return;
	}
	if(!isdefined(instance) && !var_2923cf48)
	{
		function_b06af8e3(destination, 1);
	}
}

/*
	Name: spawn_objective
	Namespace: objective_manager
	Checksum: 0x49D13469
	Offset: 0x1050
	Size: 0x86
	Parameters: 0
	Flags: None
*/
function spawn_objective()
{
	if(!isdefined(level.var_7d45d0d4.nextobjective))
	{
		function_b06af8e3(level.var_7d45d0d4.currentdestination);
	}
	if(isdefined(level.var_7d45d0d4.nextobjective))
	{
		namespace_8b6a9d79::function_20d7e9c7(level.var_7d45d0d4.nextobjective);
		level.var_7d45d0d4.nextobjective = undefined;
	}
}

/*
	Name: function_c700a68b
	Namespace: objective_manager
	Checksum: 0xB55F8AE4
	Offset: 0x10E0
	Size: 0x1EC
	Parameters: 1
	Flags: None
*/
function function_c700a68b(categories)
{
	str_forced_objective = getdvarstring(#"hash_4c7a7b0813c6765d");
	if(str_forced_objective !== "")
	{
		level.var_aaa6544c = array(str_forced_objective);
		return;
	}
	for(index = 0; index < categories.size; index++)
	{
		category = categories[index];
		structs = namespace_8b6a9d79::function_4485ab6d("objectiveCategory", category);
		foreach(script_struct in structs)
		{
			if(isdefined(script_struct.var_4b7d58a))
			{
				if(is_false(getgametypesetting(script_struct.var_4b7d58a)) || is_false(getdvarint(script_struct.var_4b7d58a, 1)))
				{
					categories[index] = "";
					break;
				}
			}
		}
	}
	arrayremovevalue(categories, "");
	level.var_aaa6544c = array::randomize(categories);
}

/*
	Name: function_ac07f9d8
	Namespace: objective_manager
	Checksum: 0x7E56AF23
	Offset: 0x12D8
	Size: 0x16E
	Parameters: 2
	Flags: Private
*/
function private function_ac07f9d8(&destinations, &categories)
{
	destination = destinations[0];
	foreach(category in categories)
	{
		if(category == #"final_battle" || category == #"exfil")
		{
			continue;
		}
		instances = destination.var_e859e591[category];
		if(!isdefined(instances))
		{
			continue;
		}
		instance = instances[randomint(instances.size)];
		namespace_8b6a9d79::function_20d7e9c7(instance);
		destination.var_e859e591 = undefined;
		arrayremovevalue(destinations, destination);
		arrayremovevalue(categories, category);
		categories[categories.size] = category;
		return;
	}
}

/*
	Name: function_f5cd7b55
	Namespace: objective_manager
	Checksum: 0x2601AE00
	Offset: 0x1450
	Size: 0x104
	Parameters: 0
	Flags: Private
*/
function private function_f5cd7b55()
{
	destinations = [];
	categories = [];
	function_ef3a1d04(destinations, categories);
	destinations = array::randomize(destinations);
	categories = array::randomize(categories);
	while(destinations.size > 0)
	{
		foreach(category in categories)
		{
			function_1df85442(destinations, category);
		}
	}
}

/*
	Name: function_ef3a1d04
	Namespace: objective_manager
	Checksum: 0xEB2F3F99
	Offset: 0x1560
	Size: 0x2D6
	Parameters: 2
	Flags: Linked
*/
function function_ef3a1d04(&destinations, &categories)
{
	foreach(destination in level.var_7d45d0d4.destinations)
	{
		var_e859e591 = [];
		foreach(location in destination.locations)
		{
			if(namespace_8b6a9d79::function_fe9fb6fd(location))
			{
				continue;
			}
			foreach(instance in location.instances)
			{
				script = namespace_8b6a9d79::function_85255d0f(scriptname);
				category = script.objectivecategory;
				if(!isdefined(category))
				{
					continue;
				}
				if(!isinarray(categories, category))
				{
					categories[categories.size] = category;
				}
				if(!isdefined(var_e859e591[category]))
				{
					var_e859e591[category] = [];
				}
				instances = var_e859e591[category];
				instances[instances.size] = instance;
			}
		}
		if(var_e859e591.size > 0)
		{
			foreach(category, instances in var_e859e591)
			{
				var_e859e591[category] = array::randomize(instances);
			}
			destination.var_e859e591 = var_e859e591;
			destinations[destinations.size] = destination;
		}
	}
}

/*
	Name: function_1df85442
	Namespace: objective_manager
	Checksum: 0x81453B2B
	Offset: 0x1840
	Size: 0xFA
	Parameters: 2
	Flags: Linked, Private
*/
function private function_1df85442(&destinations, category)
{
	foreach(destination in destinations)
	{
		instances = destination.var_e859e591[category];
		if(!isdefined(instances))
		{
			continue;
		}
		instance = instances[randomint(instances.size)];
		namespace_8b6a9d79::function_20d7e9c7(instance);
		destination.var_e859e591 = undefined;
		arrayremovevalue(destinations, destination);
		return;
	}
}

/*
	Name: function_4e8b29ac
	Namespace: objective_manager
	Checksum: 0xDE50EF72
	Offset: 0x1948
	Size: 0x180
	Parameters: 1
	Flags: Linked, Private
*/
function private function_4e8b29ac(instance)
{
	/#
		assert(isarray(instance.var_fe2612fe[#"hash_3966465c498df3a6"]));
	#/
	/#
		assert(instance.var_fe2612fe[#"hash_3966465c498df3a6"].size == 1);
	#/
	function_9d4e6125(instance.content_script_name);
	var_7d0e37f8 = instance.var_fe2612fe[#"hash_3966465c498df3a6"][0];
	script = namespace_8b6a9d79::function_85255d0f(instance.content_script_name);
	trigger = function_8239a941(var_7d0e37f8, instance, script.var_9ddbb7c);
	function_9751c453(script.var_331b7cc3, trigger.origin, instance);
	var_7d0e37f8 zm_utility::function_747180ea(instance.var_e55c8b4e, undefined, trigger);
	/#
		level.var_d56035 = instance;
	#/
	level thread [[script.var_32523552]](instance);
}

/*
	Name: function_98da2ed1
	Namespace: objective_manager
	Checksum: 0xE1357786
	Offset: 0x1AD0
	Size: 0x14C
	Parameters: 4
	Flags: None
*/
function function_98da2ed1(v_location, str_alias, str_alias_response, n_distance_sq)
{
	if(!isdefined(n_distance_sq))
	{
		n_distance_sq = 4000000;
	}
	self notify("4d4ddfee0c1fb711");
	self endon("4d4ddfee0c1fb711");
	level flag::wait_till("all_players_spawned");
	while(true)
	{
		foreach(player in getplayers())
		{
			if(distancesquared(player.origin, v_location) < n_distance_sq)
			{
				level thread globallogic_audio::leader_dialog(str_alias);
				level thread globallogic_audio::leader_dialog(str_alias_response);
				return;
			}
		}
		wait(1);
	}
}

/*
	Name: function_8239a941
	Namespace: objective_manager
	Checksum: 0x5E8F4361
	Offset: 0x1C28
	Size: 0x18E
	Parameters: 3
	Flags: Linked, Private
*/
function private function_8239a941(struct, instance, hintstring)
{
	var_3be0acae = [];
	var_3be0acae = instance.var_fe2612fe[#"hash_310e58f653ae315d"];
	if(isdefined(var_3be0acae) && var_3be0acae.size > 0)
	{
		foreach(var_528a3a32 in var_3be0acae)
		{
			namespace_8b6a9d79::spawn_script_model(var_528a3a32, var_528a3a32.model, 1);
		}
	}
	scriptmodel = namespace_8b6a9d79::spawn_script_model(struct, #"tag_origin");
	trigger = namespace_8b6a9d79::function_214737c7(struct, &function_cec3c94c, hintstring);
	trigger.origin = trigger.origin + (0, 0, 0);
	trigger.instance = instance;
	trigger.scriptmodel = scriptmodel;
	instance.starttrigger = trigger;
	return trigger;
}

/*
	Name: function_cec3c94c
	Namespace: objective_manager
	Checksum: 0x5A6DF8FC
	Offset: 0x1DC0
	Size: 0x54
	Parameters: 1
	Flags: Linked, Private
*/
function private function_cec3c94c(params)
{
	if(!start_objective(self.instance, params.activator))
	{
		return;
	}
	waittillframeend();
	self.instance.starttrigger = undefined;
	self delete();
}

/*
	Name: start_objective
	Namespace: objective_manager
	Checksum: 0x2555429
	Offset: 0x1E20
	Size: 0x230
	Parameters: 2
	Flags: Linked
*/
function start_objective(instance, activator)
{
	if(!isdefined(activator))
	{
		activator = undefined;
	}
	if(isdefined(level.var_7d45d0d4.var_3385b421))
	{
		return false;
	}
	level.var_7d45d0d4.var_3385b421 = instance;
	level flag::set("objective_locked");
	if(isdefined(instance.var_e55c8b4e))
	{
		var_7d0e37f8 = instance.var_fe2612fe[#"hash_3966465c498df3a6"][0];
		if(isdefined(var_7d0e37f8))
		{
			var_7d0e37f8 zm_utility::function_48d9a9c9();
		}
		zm_utility::function_bc5a54a8(instance.var_e55c8b4e);
		instance.var_e55c8b4e = undefined;
	}
	function_654c5d3b();
	script = namespace_8b6a9d79::function_85255d0f(instance.content_script_name);
	level thread [[script.var_11dcc37e]](instance, activator);
	if(isdefined(activator))
	{
		activator playrumbleonentity(#"hash_5057813c13554518");
	}
	if(instance.content_script_name === #"holdout")
	{
		instance waittill(#"hash_4a46a299d2376baf");
	}
	level notify(#"objective_started");
	level callback::callback(#"objective_started", {#activator:activator, #instance:instance});
	level thread function_fa47c63e(script.scriptname);
	playsoundatposition(#"hash_56dca21276e6d29c", (0, 0, 0));
	return true;
}

/*
	Name: function_c4f169d6
	Namespace: objective_manager
	Checksum: 0x752764F
	Offset: 0x2058
	Size: 0xD8
	Parameters: 0
	Flags: None
*/
function function_c4f169d6()
{
	a_models = level.var_7d45d0d4.var_1d9d92ba.a_models;
	level.var_7d45d0d4.var_1d9d92ba = undefined;
	if(isdefined(a_models))
	{
		foreach(model in a_models)
		{
			if(isdefined(model))
			{
				model delete();
				util::wait_network_frame();
			}
		}
	}
}

/*
	Name: function_1e8b7f8
	Namespace: objective_manager
	Checksum: 0xFC570F0F
	Offset: 0x2138
	Size: 0x158
	Parameters: 1
	Flags: Private
*/
function private function_1e8b7f8(scriptmodel)
{
	scriptmodel endon(#"death");
	toppos = scriptmodel.origin + (0, 0, 4);
	bottompos = scriptmodel.origin - (0, 0, 4);
	while(true)
	{
		scriptmodel moveto(toppos, 0.5, 0.15, 0.15);
		scriptmodel rotateyaw(scriptmodel.angles[2] + 45, 0.5);
		wait(0.5);
		scriptmodel moveto(bottompos, 0.5, 0.15, 0.15);
		scriptmodel rotateyaw(scriptmodel.angles[2] + 45, 0.5);
		wait(0.5);
	}
}

/*
	Name: function_9751c453
	Namespace: objective_manager
	Checksum: 0xD45424A1
	Offset: 0x2298
	Size: 0x4A
	Parameters: 3
	Flags: Linked
*/
function function_9751c453(var_331b7cc3, origin, instance)
{
	objid = zm_utility::function_f5a222a8(var_331b7cc3, origin);
	instance.var_e55c8b4e = objid;
}

/*
	Name: function_654c5d3b
	Namespace: objective_manager
	Checksum: 0x29B65C11
	Offset: 0x22F0
	Size: 0x184
	Parameters: 0
	Flags: Linked, Private
*/
function private function_654c5d3b()
{
	foreach(group in level.var_7d45d0d4.var_5eba96b3)
	{
		foreach(instance in group)
		{
			if(isdefined(instance.var_e55c8b4e))
			{
				objective_setstate(instance.var_e55c8b4e, "invisible");
			}
			if(isdefined(instance.starttrigger))
			{
				instance.starttrigger triggerenable(0);
				if(isdefined(instance.starttrigger.scriptmodel))
				{
					instance.starttrigger.scriptmodel ghost();
				}
			}
		}
	}
}

/*
	Name: function_2fe379cd
	Namespace: objective_manager
	Checksum: 0xABE54F78
	Offset: 0x2480
	Size: 0x184
	Parameters: 0
	Flags: Linked, Private
*/
function private function_2fe379cd()
{
	foreach(group in level.var_7d45d0d4.var_5eba96b3)
	{
		foreach(instance in group)
		{
			if(isdefined(instance.var_e55c8b4e))
			{
				objective_setstate(instance.var_e55c8b4e, "active");
			}
			if(isdefined(instance.starttrigger))
			{
				instance.starttrigger triggerenable(1);
				if(isdefined(instance.starttrigger.scriptmodel))
				{
					instance.starttrigger.scriptmodel show();
				}
			}
		}
	}
}

/*
	Name: function_fa47c63e
	Namespace: objective_manager
	Checksum: 0x68037DD7
	Offset: 0x2610
	Size: 0x118
	Parameters: 1
	Flags: Linked, Private
*/
function private function_fa47c63e(scriptname)
{
	script_struct = namespace_8b6a9d79::function_85255d0f(scriptname);
	objectivenum = (isdefined(script_struct.var_b4fae213) ? script_struct.var_b4fae213 : 0);
	players = getplayers();
	foreach(player in players)
	{
		player luinotifyevent(#"hash_5159e35a62fb7083", 3, 0, objectivenum, level.var_b48509f9);
	}
}

/*
	Name: function_dc7dedf9
	Namespace: objective_manager
	Checksum: 0xBDF612DF
	Offset: 0x2730
	Size: 0x24
	Parameters: 0
	Flags: Linked, Private
*/
function private function_dc7dedf9()
{
	level thread function_fbb3a986(&prototype_hud::set_fanfare_visibility);
}

/*
	Name: function_cad28879
	Namespace: objective_manager
	Checksum: 0x6164B7A1
	Offset: 0x2760
	Size: 0x24
	Parameters: 0
	Flags: Linked, Private
*/
function private function_cad28879()
{
	level thread function_fbb3a986(&prototype_hud::set_fail_fanfare_visibility);
}

/*
	Name: function_fbb3a986
	Namespace: objective_manager
	Checksum: 0x799A3B11
	Offset: 0x2790
	Size: 0x1A4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_fbb3a986(var_aa7aeff5)
{
	flag::wait_till_clear(#"hash_2bd443d05df202fe");
	flag::set(#"hash_2bd443d05df202fe");
	foreach(player in getplayers())
	{
		level.var_31028c5d [[var_aa7aeff5]](player, 1);
	}
	level waittilltimeout(6, #"game_ended");
	flag::clear(#"hash_2bd443d05df202fe");
	foreach(player in getplayers())
	{
		level.var_31028c5d [[var_aa7aeff5]](player, 0);
	}
}

/*
	Name: function_91574ec1
	Namespace: objective_manager
	Checksum: 0x4F6521E
	Offset: 0x2940
	Size: 0x190
	Parameters: 7
	Flags: None
*/
function function_91574ec1(var_d16872ed, xpos, ypos, n_width, end_notify, var_f00ef145, n_num)
{
	if(!isdefined(xpos))
	{
		xpos = 91;
	}
	if(!isdefined(ypos))
	{
		ypos = 420;
	}
	if(!isdefined(n_width))
	{
		n_width = 38;
	}
	if(!isdefined(var_f00ef145))
	{
		var_f00ef145 = 0;
	}
	if(isplayer(self))
	{
		a_players = array(self);
	}
	else
	{
		a_players = getplayers();
	}
	foreach(player in a_players)
	{
		if(isdefined(n_num))
		{
			player thread function_10ad6cbc(var_d16872ed, xpos, ypos, n_width, end_notify, var_f00ef145, n_num);
			continue;
		}
		player thread function_10ad6cbc(var_d16872ed, xpos, ypos, n_width, end_notify, var_f00ef145);
	}
}

/*
	Name: function_10ad6cbc
	Namespace: objective_manager
	Checksum: 0x79D2C85
	Offset: 0x2AD8
	Size: 0x314
	Parameters: 7
	Flags: Linked, Private
*/
function private function_10ad6cbc(var_d16872ed, xpos, ypos, n_width, end_notify, var_f00ef145, n_num)
{
	if(!isdefined(xpos))
	{
		xpos = 91;
	}
	if(!isdefined(ypos))
	{
		ypos = 420;
	}
	if(!isdefined(n_width))
	{
		n_width = 38;
	}
	if(!isdefined(var_f00ef145))
	{
		var_f00ef145 = 0;
	}
	self endon(#"death");
	self thread function_8f481c50(end_notify);
	if(isdefined(self.var_c088c2dd))
	{
		self.var_c088c2dd luielembar::close(self);
		self.var_c088c2dd = undefined;
		waitframe(1);
	}
	if(isdefined(n_num))
	{
		if(!isdefined(self.var_1948045d))
		{
			self.var_1948045d = [];
		}
		self.var_1948045d[n_num] = var_d16872ed;
		self.var_1948045d[n_num] luielembar::open(self);
		self.var_1948045d[n_num] luielembar::set_color(self, 0, 1, 0);
		self.var_1948045d[n_num] luielembar::set_alpha(self, 1);
		self.var_1948045d[n_num] luielembar::set_width(self, n_width);
		self.var_1948045d[n_num] luielembar::set_height(self, 4);
		self.var_1948045d[n_num] luielembar::function_f97e9049(self, xpos, ypos);
		self.var_1948045d[n_num] luielembar::set_bar_percent(self, var_f00ef145);
	}
	else
	{
		self.var_c088c2dd = var_d16872ed;
		self.var_c088c2dd luielembar::open(self);
		self.var_c088c2dd luielembar::set_color(self, 0, 1, 0);
		self.var_c088c2dd luielembar::set_alpha(self, 1);
		self.var_c088c2dd luielembar::set_width(self, n_width);
		self.var_c088c2dd luielembar::set_height(self, 4);
		self.var_c088c2dd luielembar::function_f97e9049(self, xpos, ypos);
		self.var_c088c2dd luielembar::set_bar_percent(self, var_f00ef145);
	}
}

/*
	Name: function_5d1c184
	Namespace: objective_manager
	Checksum: 0xE30E3B75
	Offset: 0x2DF8
	Size: 0x118
	Parameters: 2
	Flags: None
*/
function function_5d1c184(n_frac, n_num)
{
	if(isplayer(self))
	{
		a_players = array(self);
	}
	else
	{
		a_players = getplayers();
	}
	foreach(player in a_players)
	{
		if(isdefined(player))
		{
			if(isdefined(n_num))
			{
				player thread function_b4cb0c5c(n_frac, n_num);
				continue;
			}
			player thread function_b4cb0c5c(n_frac);
		}
	}
}

/*
	Name: function_b4cb0c5c
	Namespace: objective_manager
	Checksum: 0xBD8C9F8D
	Offset: 0x2F18
	Size: 0x16E
	Parameters: 2
	Flags: Linked, Private
*/
function private function_b4cb0c5c(n_frac, n_num)
{
	if(isdefined(n_num) && isdefined(self.var_1948045d))
	{
		self.var_1948045d[n_num] luielembar::set_bar_percent(self, n_frac);
	}
	else if(isdefined(self.var_c088c2dd) && isdefined(self.var_c088c2dd))
	{
		self.var_c088c2dd luielembar::set_bar_percent(self, n_frac);
		if(n_frac <= 0.66 && n_frac > 0.33 && !is_true(self.var_c088c2dd.var_b2ad28ef))
		{
			self.var_c088c2dd luielembar::set_color(self, 1, 1, 0);
			self.var_c088c2dd.var_b2ad28ef = 1;
		}
		else if(n_frac <= 0.33 && !is_true(self.var_c088c2dd.var_38ae4622))
		{
			self.var_c088c2dd luielembar::set_color(self, 1, 0, 0);
			self.var_c088c2dd.var_38ae4622 = 1;
		}
	}
}

/*
	Name: function_8f481c50
	Namespace: objective_manager
	Checksum: 0x186FB8F4
	Offset: 0x3090
	Size: 0x176
	Parameters: 1
	Flags: Linked
*/
function function_8f481c50(end_notify)
{
	self notify("207e45b7ff157454");
	self endon("207e45b7ff157454");
	if(isdefined(end_notify))
	{
		level waittill(end_notify);
	}
	if(isdefined(self) && isdefined(self.var_c088c2dd) && self.var_c088c2dd luielembar::is_open(self))
	{
		self.var_c088c2dd luielembar::close(self);
		self.var_c088c2dd = undefined;
	}
	if(isarray(self.var_1948045d))
	{
		foreach(var_4850b239 in self.var_1948045d)
		{
			if(isdefined(var_4850b239) && var_4850b239 luielembar::is_open(self))
			{
				var_4850b239 luielembar::close(self);
				var_4850b239 = undefined;
			}
		}
		self.var_1948045d = undefined;
	}
}

/*
	Name: start_timer
	Namespace: objective_manager
	Checksum: 0xDC779A41
	Offset: 0x3210
	Size: 0x194
	Parameters: 2
	Flags: Linked
*/
function start_timer(n_seconds, str_label)
{
	if(!isdefined(str_label))
	{
		str_label = #"";
	}
	level endon(#"game_ended", #"timer_stop");
	/#
		assert(n_seconds <= 540);
	#/
	foreach(player in getplayers())
	{
		player clientfield::set_to_player("sr_defend_timer", 0);
		if(!level.var_4f12f6d0 sr_objective_timer::is_open(player))
		{
			level.var_4f12f6d0 sr_objective_timer::open(player, 0);
		}
		player clientfield::set_to_player("sr_defend_timer", n_seconds);
	}
	wait(n_seconds);
	level notify("timer_" + str_label);
	stop_timer();
}

/*
	Name: function_b8278876
	Namespace: objective_manager
	Checksum: 0xE44CA8AE
	Offset: 0x33B0
	Size: 0x12C
	Parameters: 2
	Flags: None
*/
function function_b8278876(n_seconds, str_label)
{
	if(!isdefined(str_label))
	{
		str_label = #"";
	}
	level endon(#"game_ended", #"timer_stop");
	self endon(#"death");
	/#
		assert(n_seconds <= 540);
	#/
	self clientfield::set_to_player("sr_defend_timer", 0);
	if(!level.var_4f12f6d0 sr_objective_timer::is_open(self))
	{
		level.var_4f12f6d0 sr_objective_timer::open(self, 0);
	}
	self clientfield::set_to_player("sr_defend_timer", n_seconds);
	wait(n_seconds);
	self notify("timer_" + str_label);
	stop_timer();
}

/*
	Name: stop_timer
	Namespace: objective_manager
	Checksum: 0xE6166F28
	Offset: 0x34E8
	Size: 0x108
	Parameters: 0
	Flags: Linked
*/
function stop_timer()
{
	foreach(player in getplayers())
	{
		if(level.var_4f12f6d0 sr_objective_timer::is_open(player))
		{
			level.var_4f12f6d0 sr_objective_timer::close(player);
		}
		player clientfield::set_to_player("sr_defend_timer", 0);
	}
	level notify(#"hash_5a7f014b541eb7a6");
	level notify(#"timer_stop");
}

/*
	Name: function_7bfeebe3
	Namespace: objective_manager
	Checksum: 0x4CA75169
	Offset: 0x35F8
	Size: 0xE
	Parameters: 0
	Flags: None
*/
function function_7bfeebe3()
{
	return level.var_cf558bf;
}

/*
	Name: function_9d4e6125
	Namespace: objective_manager
	Checksum: 0x8415E426
	Offset: 0x3610
	Size: 0x100
	Parameters: 1
	Flags: Linked
*/
function function_9d4e6125(scriptname)
{
	wait(5);
	objectivenum = 0;
	if(isdefined(scriptname))
	{
		objectivenum = function_ae039b4(scriptname);
	}
	else
	{
		return;
	}
	players = getplayers();
	foreach(player in players)
	{
		player luinotifyevent(#"hash_5159e35a62fb7083", 3, 2, objectivenum, level.var_b48509f9);
	}
}

/*
	Name: function_ae039b4
	Namespace: objective_manager
	Checksum: 0xD11D3A59
	Offset: 0x3718
	Size: 0x5C
	Parameters: 1
	Flags: Linked
*/
function function_ae039b4(objective)
{
	script_struct = namespace_8b6a9d79::function_85255d0f(objective);
	objectivenum = (isdefined(script_struct.var_b4fae213) ? script_struct.var_b4fae213 : 0);
	return objectivenum;
}

/*
	Name: function_2f9d355c
	Namespace: objective_manager
	Checksum: 0xF34868A9
	Offset: 0x3780
	Size: 0x108
	Parameters: 0
	Flags: None
*/
function function_2f9d355c()
{
	foreach(e_player in getplayers())
	{
		if(e_player inlaststand())
		{
			e_player zm_laststand::revive_force_revive();
			e_player notify(#"player_revived", {#reviver:self});
			continue;
		}
		if(e_player util::is_spectating())
		{
			e_player thread zm_player::spectator_respawn_player();
		}
	}
}

/*
	Name: function_589654ad
	Namespace: objective_manager
	Checksum: 0x5D50368D
	Offset: 0x3890
	Size: 0xD4
	Parameters: 0
	Flags: None
*/
function function_589654ad()
{
	foreach(e_player in getplayers())
	{
		if(e_player inlaststand())
		{
			e_player zm_laststand::revive_force_revive();
			e_player notify(#"player_revived", {#reviver:self});
		}
	}
}

/*
	Name: init_devgui
	Namespace: objective_manager
	Checksum: 0xAA5B452D
	Offset: 0x3970
	Size: 0x2B4
	Parameters: 0
	Flags: None
*/
function init_devgui()
{
	/#
		util::waittill_can_add_debug_command();
		level thread function_7a7ab1a2();
		adddebugcommand("");
		util::add_devgui(namespace_8b6a9d79::devgui_path("", 100), "");
		adddebugcommand("");
		util::add_devgui(namespace_8b6a9d79::devgui_path("", 101), "");
		adddebugcommand("");
		util::add_devgui(namespace_8b6a9d79::devgui_path("", 102), "");
		adddebugcommand("");
		util::add_devgui(namespace_8b6a9d79::devgui_path("", 102), "");
		adddebugcommand("");
		util::add_devgui(namespace_8b6a9d79::devgui_path("", 102), "");
		setdvar(#"hash_5ec9d9c47f22480b", 0);
		adddebugcommand("");
		util::add_devgui(namespace_8b6a9d79::devgui_path("", 103), "");
		function_cd140ee9(#"hash_5ec9d9c47f22480b", &function_a8417c4a);
		adddebugcommand("");
		util::add_devgui(namespace_8b6a9d79::devgui_path("", 104), "");
	#/
}

/*
	Name: function_a8417c4a
	Namespace: objective_manager
	Checksum: 0x939553DD
	Offset: 0x3C30
	Size: 0x50
	Parameters: 1
	Flags: None
*/
function function_a8417c4a(params)
{
	/#
		if(params.value)
		{
			level thread function_67b313bb();
		}
		else
		{
			level notify(#"hash_473116b92ba013b9");
		}
	#/
}

/*
	Name: function_67b313bb
	Namespace: objective_manager
	Checksum: 0x1E8184E5
	Offset: 0x3C88
	Size: 0x3C2
	Parameters: 0
	Flags: None
*/
function function_67b313bb()
{
	/#
		level notify(#"hash_473116b92ba013b9");
		level endon(#"hash_473116b92ba013b9");
		var_b49d430f = array("", "", "", "", "", "", "", "", "", "", "");
		var_9986d9d6 = array((1, 0, 0), (0, 1, 0), (0, 0, 1), (1, 1, 0), (1, 0.5, 0), (0, 1, 1), (1, 0, 1), (0.4392157, 0.5019608, 0.5647059), (0, 0, 0), vectorscale((1, 1, 0), 0.5019608), (0.5450981, 0.2705882, 0.07450981));
		while(true)
		{
			foreach(index, str_objective_type in var_b49d430f)
			{
				v_color = var_9986d9d6[index];
				var_2cd4e005 = struct::get_array(str_objective_type, "");
				foreach(s_objective in var_2cd4e005)
				{
					print3d(s_objective.origin, (("" + str_objective_type) + "") + (isdefined(s_objective.targetname) ? s_objective.targetname : ""), (1, 1, 0), undefined, 1);
					n_distance = distance(getplayers()[0].origin, s_objective.origin);
					var_5d97a083 = (150 * n_distance) * 0.0001;
					var_5d97a083 = max(150 / 1.5, var_5d97a083);
					sphere(s_objective.origin, var_5d97a083, v_color);
				}
				debug2dtext((100, 500 + (25 * index), 0), ((str_objective_type + "") + var_2cd4e005.size) + "", v_color, undefined, undefined, undefined, 1.5);
			}
			waitframe(1);
		}
	#/
}

/*
	Name: function_caba1575
	Namespace: objective_manager
	Checksum: 0x85D73777
	Offset: 0x4058
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function function_caba1575(instance)
{
	/#
		self setorigin(instance.origin);
	#/
}

/*
	Name: function_7a7ab1a2
	Namespace: objective_manager
	Checksum: 0xEE0726E2
	Offset: 0x4090
	Size: 0x47C
	Parameters: 0
	Flags: None
*/
function function_7a7ab1a2()
{
	/#
		while(true)
		{
			if(getdvarint(#"hash_f6faed38fbaaaa5", 0))
			{
				level.var_cf558bf++;
				namespace_553954de::function_7c97e961(level.var_b48509f9 + 1);
				setdvar(#"hash_f6faed38fbaaaa5", 0);
				foreach(player in getplayers())
				{
					player luinotifyevent(#"hash_5b1ff06d07e9002a", 3, 2, level.var_b48509f9, 0);
				}
			}
			if(getdvarint(#"hash_7c2f98129d7c2219", 0))
			{
				level.var_cf558bf--;
				namespace_553954de::function_7c97e961(level.var_b48509f9 - 1);
				setdvar(#"hash_7c2f98129d7c2219", 0);
				foreach(player in getplayers())
				{
					player luinotifyevent(#"hash_5b1ff06d07e9002a", 3, 2, level.var_b48509f9, 0);
				}
			}
			if(getdvarint(#"hash_6b5cf36b6de48f0a", 0))
			{
				setdvar(#"hash_6b5cf36b6de48f0a", 0);
				if(isdefined(level.var_7d45d0d4.var_3385b421))
				{
					objective_ended(level.var_7d45d0d4.var_3385b421, 1);
				}
			}
			else if(getdvarint(#"hash_41c8b0af55de9e31", 0))
			{
				setdvar(#"hash_41c8b0af55de9e31", 0);
				if(isdefined(level.var_7d45d0d4.var_3385b421))
				{
					objective_ended(level.var_7d45d0d4.var_3385b421, 0);
				}
			}
			if(getdvarint(#"hash_56fb5b3dc9a94fb6", 0))
			{
				setdvar(#"hash_56fb5b3dc9a94fb6", 0);
				instance = level.var_7d45d0d4.var_3385b421;
				if(!isdefined(instance))
				{
					instance = level.var_d56035;
				}
				if(isdefined(instance))
				{
					foreach(player in getplayers())
					{
						player function_caba1575(instance);
					}
				}
			}
			wait(0.1);
		}
	#/
}

