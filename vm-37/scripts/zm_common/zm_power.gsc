#using script_3f9e0dc8454d98e1;
#using script_6e3c826b1814cab6;
#using script_ab890501c40b73c;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\demo_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\popups_shared.gsc;
#using scripts\core_common\potm_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm_common\util.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm_blockers.gsc;
#using scripts\zm_common\zm_perks.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace zm_power;

/*
	Name: function_89f2df9
	Namespace: zm_power
	Checksum: 0x32259FE7
	Offset: 0x240
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"zm_power", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_power
	Checksum: 0xBC5C9F1B
	Offset: 0x298
	Size: 0x1C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.powered_items = [];
	level.local_power = [];
}

/*
	Name: function_8ac3bea9
	Namespace: zm_power
	Checksum: 0xC210F1BD
	Offset: 0x2C0
	Size: 0x44
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ac3bea9()
{
	thread standard_powered_items();
	level thread electric_switch_init();
	/#
		thread debug_powered_items();
	#/
}

/*
	Name: debug_powered_items
	Namespace: zm_power
	Checksum: 0x44F5CC36
	Offset: 0x310
	Size: 0xF2
	Parameters: 0
	Flags: None
*/
function debug_powered_items()
{
	/#
		while(true)
		{
			if(getdvarint(#"zombie_equipment_health", 0))
			{
				if(isdefined(level.local_power))
				{
					foreach(localpower in level.local_power)
					{
						circle(localpower.origin, localpower.radius, (1, 0, 0), 0, 1, 1);
					}
				}
			}
			waitframe(1);
		}
	#/
}

/*
	Name: electric_switch_init
	Namespace: zm_power
	Checksum: 0xD04E3948
	Offset: 0x410
	Size: 0x84
	Parameters: 0
	Flags: Linked
*/
function electric_switch_init()
{
	trigs = getentarray("use_elec_switch", "targetname");
	if(isdefined(level.temporary_power_switch_logic))
	{
		array::thread_all(trigs, level.temporary_power_switch_logic, trigs);
	}
	else
	{
		array::thread_all(trigs, &electric_switch);
	}
}

/*
	Name: electric_switch
	Namespace: zm_power
	Checksum: 0x73C09C42
	Offset: 0x4A0
	Size: 0x810
	Parameters: 0
	Flags: Linked
*/
function electric_switch()
{
	self endon(#"hash_21e36726a7f30458");
	if(!isdefined(self))
	{
		return;
	}
	if(isdefined(self.target))
	{
		ent_parts = getentarray(self.target, "targetname");
		struct_parts = struct::get_array(self.target, "targetname");
		foreach(ent in ent_parts)
		{
			if(isdefined(ent.script_noteworthy))
			{
				master_switch = ent;
				switch(ent.script_noteworthy)
				{
					case "elec_switch":
					{
						break;
					}
					case "hash_47bde376753a03c9":
					{
						break;
					}
					case "artifact_mind":
					{
						break;
					}
				}
			}
		}
		foreach(struct in struct_parts)
		{
			if(isdefined(struct.script_noteworthy) && struct.script_noteworthy == "elec_switch_fx")
			{
				fx_pos = struct;
			}
		}
	}
	while(isdefined(self))
	{
		if(isdefined(master_switch) && isdefined(master_switch.script_noteworthy) && !is_true(self.var_1d2fecd6))
		{
			switch(master_switch.script_noteworthy)
			{
				case "elec_switch":
				{
					self sethintstring(#"hash_5d8ba3059b5e82e4");
					break;
				}
				case "hash_47bde376753a03c9":
				{
					self sethintstring(#"hash_5d8ba3059b5e82e4");
					break;
				}
				case "artifact_mind":
				{
					level waittill(#"player_spawned");
					self sethintstring(#"hash_60e4802baafefe56");
					break;
				}
			}
		}
		else if(!is_true(self.var_1d2fecd6))
		{
			self sethintstring(#"hash_5d8ba3059b5e82e4");
		}
		self setvisibletoall();
		waitresult = undefined;
		waitresult = self waittill(#"trigger");
		user = waitresult.activator;
		if(is_true(self.var_b9eb2dbb))
		{
			self.var_1d2fecd6 = 1;
			waitframe(1);
			continue;
		}
		self setinvisibletoall();
		power_zone = undefined;
		if(isdefined(self.script_int))
		{
			power_zone = self.script_int;
		}
		level thread zm_perks::perk_unpause_all_perks(power_zone);
		if(isdefined(master_switch) && isdefined(master_switch.script_noteworthy))
		{
			switch(master_switch.script_noteworthy)
			{
				case "elec_switch":
				{
					elec_switch_on(master_switch, fx_pos);
					break;
				}
				case "hash_47bde376753a03c9":
				{
					function_9d9892d2(master_switch);
					break;
				}
				case "artifact_mind":
				{
					artifact_mind_on(master_switch, fx_pos, user);
					break;
				}
			}
		}
		user zm_stats::increment_challenge_stat(#"hash_7d4064a8d03e0606");
		user contracts::function_5b88297d(#"hash_464acc5cd524989");
		level turn_power_on_and_open_doors(power_zone);
		user playrumbleonentity("damage_light");
		switchentnum = self getentitynumber();
		if(isdefined(switchentnum) && isdefined(user))
		{
			user recordmapevent(17, gettime(), user.origin, level.round_number, switchentnum);
		}
		if(isplayer(user))
		{
			user util::delay(1, "death", &zm_audio::create_and_play_dialog, #"power_switch", #"activate", undefined, 2);
			level thread popups::displayteammessagetoteam(#"hash_160c9d3a45e6c88c", user, user.team);
		}
		if(!isdefined(self.script_noteworthy) || self.script_noteworthy != "allow_power_off")
		{
			self delete();
			return;
		}
		if(isdefined(master_switch) && isdefined(master_switch.script_noteworthy))
		{
			switch(master_switch.script_noteworthy)
			{
				case "elec_switch":
				{
					break;
				}
			}
		}
		self setvisibletoall();
		waitresult = undefined;
		waitresult = self waittill(#"trigger");
		user = waitresult.activator;
		self setinvisibletoall();
		level thread zm_perks::perk_pause_all_perks(power_zone);
		if(isdefined(master_switch) && isdefined(master_switch.script_noteworthy))
		{
			switch(master_switch.script_noteworthy)
			{
				case "elec_switch":
				{
					elec_switch_off(master_switch);
					break;
				}
			}
		}
		if(isdefined(switchentnum) && isdefined(user))
		{
			user recordmapevent(18, gettime(), user.origin, level.round_number, switchentnum);
		}
		level turn_power_off_and_close_doors(power_zone);
	}
}

/*
	Name: elec_switch_on
	Namespace: zm_power
	Checksum: 0x2FEE5B56
	Offset: 0xCB8
	Size: 0xC4
	Parameters: 2
	Flags: Linked
*/
function elec_switch_on(master_switch, fx_pos)
{
	master_switch rotateroll(-90, 0.3);
	master_switch playsound(#"zmb_switch_flip");
	master_switch waittill(#"rotatedone");
	master_switch playsound(#"zmb_turn_on");
	if(isdefined(fx_pos))
	{
		playfx(level._effect[#"switch_sparks"], fx_pos.origin);
	}
}

/*
	Name: elec_switch_off
	Namespace: zm_power
	Checksum: 0xA0566F9D
	Offset: 0xD88
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function elec_switch_off(master_switch)
{
	master_switch rotateroll(90, 0.3);
	master_switch waittill(#"rotatedone");
}

/*
	Name: function_9d9892d2
	Namespace: zm_power
	Checksum: 0x12F8A7A5
	Offset: 0xDD8
	Size: 0x74
	Parameters: 1
	Flags: Linked
*/
function function_9d9892d2(master_switch)
{
	if(isdefined(master_switch.model_on))
	{
		master_switch setmodel(master_switch.model_on);
	}
	if(isdefined(master_switch.bundle))
	{
		master_switch thread scene::play(master_switch.bundle, "ON", master_switch);
	}
}

/*
	Name: artifact_mind_on
	Namespace: zm_power
	Checksum: 0x2BA1EC0E
	Offset: 0xE58
	Size: 0x48
	Parameters: 3
	Flags: Linked
*/
function artifact_mind_on(master_switch, fx_pos, user)
{
	level notify(#"hash_3e80d503318a5674", {#player:user});
}

/*
	Name: watch_global_power
	Namespace: zm_power
	Checksum: 0xF1F6B463
	Offset: 0xEA8
	Size: 0x80
	Parameters: 0
	Flags: Linked
*/
function watch_global_power()
{
	while(true)
	{
		level flag::wait_till("power_on");
		level thread set_global_power(1);
		level flag::wait_till_clear("power_on");
		level thread set_global_power(0);
	}
}

/*
	Name: standard_powered_items
	Namespace: zm_power
	Checksum: 0x5259ED40
	Offset: 0xF30
	Size: 0x384
	Parameters: 0
	Flags: Linked
*/
function standard_powered_items()
{
	level flag::wait_till("start_zombie_round_logic");
	vending_machines = zm_perks::get_perk_machines();
	foreach(trigger in vending_machines)
	{
		powered_on = zm_perks::get_perk_machine_start_state(trigger.script_notify);
		powered_perk = add_powered_item(&perk_power_on, &perk_power_off, &perk_range, &cost_low_if_local, 0, powered_on, trigger);
		if(isdefined(trigger.script_int))
		{
			powered_perk thread zone_controlled_perk(trigger.script_int);
		}
	}
	if(namespace_59ff1d6c::function_901b751c(#"hash_29004a67830922b6") != 0)
	{
		zombie_doors = getentarray("zombie_door", "targetname");
		foreach(door in zombie_doors)
		{
			if(isdefined(door.script_noteworthy) && (door.script_noteworthy == "electric_door" || door.script_noteworthy == "electric_buyable_door"))
			{
				add_powered_item(&door_power_on, &door_power_off, &door_range, &cost_door, 0, 0, door);
				continue;
			}
			if(isdefined(door.script_noteworthy) && door.script_noteworthy == "local_electric_door")
			{
				power_sources = 0;
				if(!is_true(level.power_local_doors_globally))
				{
					power_sources = 1;
				}
				add_powered_item(&door_local_power_on, &door_local_power_off, &door_range, &cost_door, power_sources, 0, door);
			}
		}
	}
	thread watch_global_power();
}

/*
	Name: zone_controlled_perk
	Namespace: zm_power
	Checksum: 0xCBF0DFA5
	Offset: 0x12C0
	Size: 0x90
	Parameters: 1
	Flags: Linked
*/
function zone_controlled_perk(zone)
{
	while(true)
	{
		power_flag = "power_on" + zone;
		level flag::wait_till(power_flag);
		self thread perk_power_on();
		level flag::wait_till_clear(power_flag);
		self thread perk_power_off();
	}
}

/*
	Name: add_powered_item
	Namespace: zm_power
	Checksum: 0x2220DD5E
	Offset: 0x1358
	Size: 0xEC
	Parameters: 7
	Flags: Linked
*/
function add_powered_item(power_on_func, power_off_func, range_func, cost_func, power_sources, self_powered, target)
{
	powered = spawnstruct();
	powered.power_on_func = power_on_func;
	powered.power_off_func = power_off_func;
	powered.range_func = range_func;
	powered.power_sources = power_sources;
	powered.self_powered = self_powered;
	powered.target = target;
	powered.cost_func = cost_func;
	powered.power = self_powered;
	powered.powered_count = self_powered;
	powered.depowered_count = 0;
	level.powered_items[level.powered_items.size] = powered;
	return powered;
}

/*
	Name: remove_powered_item
	Namespace: zm_power
	Checksum: 0xB3E65DA6
	Offset: 0x1450
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function remove_powered_item(powered)
{
	arrayremovevalue(level.powered_items, powered, 0);
}

/*
	Name: add_temp_powered_item
	Namespace: zm_power
	Checksum: 0x932A3DAF
	Offset: 0x1488
	Size: 0x190
	Parameters: 7
	Flags: None
*/
function add_temp_powered_item(power_on_func, power_off_func, range_func, cost_func, power_sources, self_powered, target)
{
	powered = add_powered_item(power_on_func, power_off_func, range_func, cost_func, power_sources, self_powered, target);
	if(isdefined(level.local_power))
	{
		foreach(localpower in level.local_power)
		{
			if(powered [[powered.range_func]](1, localpower.origin, localpower.radius))
			{
				powered change_power(1, localpower.origin, localpower.radius);
				if(!isdefined(localpower.added_list))
				{
					localpower.added_list = [];
				}
				localpower.added_list[localpower.added_list.size] = powered;
			}
		}
	}
	thread watch_temp_powered_item(powered);
	return powered;
}

/*
	Name: watch_temp_powered_item
	Namespace: zm_power
	Checksum: 0xB4A5E65F
	Offset: 0x1620
	Size: 0x118
	Parameters: 1
	Flags: Linked
*/
function watch_temp_powered_item(powered)
{
	powered.target waittill(#"death");
	remove_powered_item(powered);
	if(isdefined(level.local_power))
	{
		foreach(localpower in level.local_power)
		{
			if(isdefined(localpower.added_list))
			{
				arrayremovevalue(localpower.added_list, powered, 0);
			}
			if(isdefined(localpower.enabled_list))
			{
				arrayremovevalue(localpower.enabled_list, powered, 0);
			}
		}
	}
}

/*
	Name: change_power_in_radius
	Namespace: zm_power
	Checksum: 0x8387A2AF
	Offset: 0x1740
	Size: 0xCC
	Parameters: 3
	Flags: Linked
*/
function change_power_in_radius(delta, origin, radius)
{
	changed_list = [];
	for(i = 0; i < level.powered_items.size; i++)
	{
		powered = level.powered_items[i];
		if(powered.power_sources != 2 && powered [[powered.range_func]](delta, origin, radius))
		{
			powered change_power(delta, origin, radius);
			changed_list[changed_list.size] = powered;
		}
	}
	return changed_list;
}

/*
	Name: change_power
	Namespace: zm_power
	Checksum: 0x7567F3E1
	Offset: 0x1818
	Size: 0xA8
	Parameters: 3
	Flags: Linked
*/
function change_power(delta, origin, radius)
{
	if(delta > 0)
	{
		if(!self.power)
		{
			self.power = 1;
			self [[self.power_on_func]](origin, radius);
		}
		self.powered_count++;
	}
	else if(delta < 0)
	{
		if(self.power)
		{
			self.power = 0;
			self [[self.power_off_func]](origin, radius);
		}
		self.depowered_count++;
	}
}

/*
	Name: revert_power_to_list
	Namespace: zm_power
	Checksum: 0x3EEB0C2C
	Offset: 0x18C8
	Size: 0x74
	Parameters: 4
	Flags: Linked
*/
function revert_power_to_list(delta, origin, radius, powered_list)
{
	for(i = 0; i < powered_list.size; i++)
	{
		powered = powered_list[i];
		powered revert_power(delta, origin, radius);
	}
}

/*
	Name: revert_power
	Namespace: zm_power
	Checksum: 0xF4432848
	Offset: 0x1948
	Size: 0x130
	Parameters: 4
	Flags: Linked
*/
function revert_power(delta, origin, radius, powered_list)
{
	if(origin > 0)
	{
		self.depowered_count--;
		/#
			assert(self.depowered_count >= 0, "");
		#/
		if(self.depowered_count == 0 && self.powered_count > 0 && !self.power)
		{
			self.power = 1;
			self [[self.power_on_func]](radius, powered_list);
		}
	}
	else if(origin < 0)
	{
		self.powered_count--;
		/#
			assert(self.powered_count >= 0, "");
		#/
		if(self.powered_count == 0 && self.power)
		{
			self.power = 0;
			self [[self.power_off_func]](radius, powered_list);
		}
	}
}

/*
	Name: add_local_power
	Namespace: zm_power
	Checksum: 0xA200C7E0
	Offset: 0x1A80
	Size: 0xC8
	Parameters: 2
	Flags: None
*/
function add_local_power(origin, radius)
{
	localpower = spawnstruct();
	/#
		println(((("" + origin) + "") + radius) + "");
	#/
	localpower.origin = origin;
	localpower.radius = radius;
	localpower.enabled_list = change_power_in_radius(1, origin, radius);
	level.local_power[level.local_power.size] = localpower;
	return localpower;
}

/*
	Name: move_local_power
	Namespace: zm_power
	Checksum: 0xC953EE40
	Offset: 0x1B50
	Size: 0x1A6
	Parameters: 2
	Flags: None
*/
function move_local_power(localpower, origin)
{
	changed_list = [];
	for(i = 0; i < level.powered_items.size; i++)
	{
		powered = level.powered_items[i];
		if(powered.power_sources == 2)
		{
			continue;
		}
		waspowered = isinarray(localpower.enabled_list, powered);
		ispowered = powered [[powered.range_func]](1, origin, localpower.radius);
		if(ispowered && !waspowered)
		{
			powered change_power(1, origin, localpower.radius);
			localpower.enabled_list[localpower.enabled_list.size] = powered;
			continue;
		}
		if(!ispowered && waspowered)
		{
			powered revert_power(-1, localpower.origin, localpower.radius, localpower.enabled_list);
			arrayremovevalue(localpower.enabled_list, powered, 0);
		}
	}
	localpower.origin = origin;
	return localpower;
}

/*
	Name: end_local_power
	Namespace: zm_power
	Checksum: 0x1B47B8AF
	Offset: 0x1D00
	Size: 0x104
	Parameters: 1
	Flags: None
*/
function end_local_power(localpower)
{
	/#
		println(((("" + localpower.origin) + "") + localpower.radius) + "");
	#/
	if(isdefined(localpower.enabled_list))
	{
		revert_power_to_list(-1, localpower.origin, localpower.radius, localpower.enabled_list);
	}
	localpower.enabled_list = undefined;
	if(isdefined(localpower.added_list))
	{
		revert_power_to_list(-1, localpower.origin, localpower.radius, localpower.added_list);
	}
	localpower.added_list = undefined;
	arrayremovevalue(level.local_power, localpower, 0);
}

/*
	Name: has_local_power
	Namespace: zm_power
	Checksum: 0x43CC2C18
	Offset: 0x1E10
	Size: 0xC4
	Parameters: 1
	Flags: None
*/
function has_local_power(origin)
{
	if(isdefined(level.local_power))
	{
		foreach(localpower in level.local_power)
		{
			if(distancesquared(localpower.origin, origin) < localpower.radius * localpower.radius)
			{
				return true;
			}
		}
	}
	return false;
}

/*
	Name: get_powered_item_cost
	Namespace: zm_power
	Checksum: 0x7CFEB569
	Offset: 0x1EE0
	Size: 0xA0
	Parameters: 0
	Flags: Linked
*/
function get_powered_item_cost()
{
	if(!is_true(self.power))
	{
		return 0;
	}
	if(is_true(level._power_global) && !self.power_sources == 1)
	{
		return 0;
	}
	cost = [[self.cost_func]]();
	power_sources = self.powered_count;
	if(power_sources < 1)
	{
		power_sources = 1;
	}
	return cost / power_sources;
}

/*
	Name: get_local_power_cost
	Namespace: zm_power
	Checksum: 0x9F86F7A3
	Offset: 0x1F88
	Size: 0x160
	Parameters: 1
	Flags: None
*/
function get_local_power_cost(localpower)
{
	cost = 0;
	if(isdefined(localpower) && isdefined(localpower.enabled_list))
	{
		foreach(powered in localpower.enabled_list)
		{
			cost = cost + powered get_powered_item_cost();
		}
	}
	if(isdefined(localpower) && isdefined(localpower.added_list))
	{
		foreach(powered in localpower.added_list)
		{
			cost = cost + powered get_powered_item_cost();
		}
	}
	return cost;
}

/*
	Name: set_global_power
	Namespace: zm_power
	Checksum: 0x3C40FD33
	Offset: 0x20F0
	Size: 0xFC
	Parameters: 1
	Flags: Linked
*/
function set_global_power(on_off)
{
	demo::bookmark(#"zm_power", gettime(), undefined, undefined, 1);
	potm::bookmark(#"zm_power", gettime(), undefined, undefined, 1);
	level._power_global = on_off;
	for(i = 0; i < level.powered_items.size; i++)
	{
		powered = level.powered_items[i];
		if(isdefined(powered.target) && powered.power_sources != 1)
		{
			powered global_power(on_off);
			util::wait_network_frame();
		}
	}
}

/*
	Name: global_power
	Namespace: zm_power
	Checksum: 0x652BBC9E
	Offset: 0x21F8
	Size: 0xFC
	Parameters: 1
	Flags: Linked
*/
function global_power(on_off)
{
	if(on_off)
	{
		/#
			println("");
		#/
		if(!self.power)
		{
			self.power = 1;
			self [[self.power_on_func]]();
		}
		self.powered_count++;
	}
	else
	{
		/#
			println("");
		#/
		self.powered_count--;
		/#
			assert(self.powered_count >= 0, "");
		#/
		if(self.powered_count == 0 && self.power)
		{
			self.power = 0;
			self [[self.power_off_func]]();
		}
	}
}

/*
	Name: never_power_on
	Namespace: zm_power
	Checksum: 0x295574F0
	Offset: 0x2300
	Size: 0x14
	Parameters: 2
	Flags: None
*/
function never_power_on(origin, radius)
{
}

/*
	Name: never_power_off
	Namespace: zm_power
	Checksum: 0xC56451CB
	Offset: 0x2320
	Size: 0x14
	Parameters: 2
	Flags: None
*/
function never_power_off(origin, radius)
{
}

/*
	Name: cost_negligible
	Namespace: zm_power
	Checksum: 0x24EF5DB0
	Offset: 0x2340
	Size: 0x32
	Parameters: 0
	Flags: None
*/
function cost_negligible()
{
	if(isdefined(self.one_time_cost))
	{
		cost = self.one_time_cost;
		self.one_time_cost = undefined;
		return cost;
	}
	return 0;
}

/*
	Name: cost_low_if_local
	Namespace: zm_power
	Checksum: 0xD0BAFD6A
	Offset: 0x2380
	Size: 0x70
	Parameters: 0
	Flags: Linked
*/
function cost_low_if_local()
{
	if(isdefined(self.one_time_cost))
	{
		cost = self.one_time_cost;
		self.one_time_cost = undefined;
		return cost;
	}
	if(is_true(level._power_global) || is_true(self.self_powered))
	{
		return 0;
	}
	return 1;
}

/*
	Name: cost_high
	Namespace: zm_power
	Checksum: 0x15F1BA95
	Offset: 0x23F8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function cost_high()
{
	if(isdefined(self.one_time_cost))
	{
		cost = self.one_time_cost;
		self.one_time_cost = undefined;
		return cost;
	}
	return 10;
}

/*
	Name: door_range
	Namespace: zm_power
	Checksum: 0xEF18DD41
	Offset: 0x2438
	Size: 0x5C
	Parameters: 3
	Flags: Linked
*/
function door_range(delta, origin, radius)
{
	if(delta < 0)
	{
		return false;
	}
	if(distancesquared(self.target.origin, origin) < radius * radius)
	{
		return true;
	}
	return false;
}

/*
	Name: door_power_on
	Namespace: zm_power
	Checksum: 0x1A40D03B
	Offset: 0x24A0
	Size: 0x5C
	Parameters: 2
	Flags: Linked
*/
function door_power_on(origin, radius)
{
	/#
		println("");
	#/
	self.target.power_on = 1;
	self.target notify(#"power_on");
}

/*
	Name: door_power_off
	Namespace: zm_power
	Checksum: 0xAE80789B
	Offset: 0x2508
	Size: 0x5E
	Parameters: 2
	Flags: Linked
*/
function door_power_off(origin, radius)
{
	/#
		println("");
	#/
	self.target notify(#"power_off");
	self.target.power_on = 0;
}

/*
	Name: door_local_power_on
	Namespace: zm_power
	Checksum: 0x57A0F6EB
	Offset: 0x2570
	Size: 0x5C
	Parameters: 2
	Flags: Linked
*/
function door_local_power_on(origin, radius)
{
	/#
		println("");
	#/
	self.target.local_power_on = 1;
	self.target notify(#"local_power_on");
}

/*
	Name: door_local_power_off
	Namespace: zm_power
	Checksum: 0xC54AFA01
	Offset: 0x25D8
	Size: 0x5E
	Parameters: 2
	Flags: Linked
*/
function door_local_power_off(origin, radius)
{
	/#
		println("");
	#/
	self.target notify(#"local_power_off");
	self.target.local_power_on = 0;
}

/*
	Name: cost_door
	Namespace: zm_power
	Checksum: 0x8F9F959C
	Offset: 0x2640
	Size: 0x92
	Parameters: 0
	Flags: Linked
*/
function cost_door()
{
	if(isdefined(self.target.power_cost))
	{
		if(!isdefined(self.one_time_cost))
		{
			self.one_time_cost = 0;
		}
		self.one_time_cost = self.one_time_cost + self.target.power_cost;
		self.target.power_cost = 0;
	}
	if(isdefined(self.one_time_cost))
	{
		cost = self.one_time_cost;
		self.one_time_cost = undefined;
		return cost;
	}
	return 0;
}

/*
	Name: zombie_range
	Namespace: zm_power
	Checksum: 0xE9B4EDA2
	Offset: 0x26E0
	Size: 0x7E
	Parameters: 3
	Flags: None
*/
function zombie_range(delta, origin, radius)
{
	if(delta > 0)
	{
		return false;
	}
	self.zombies = array::get_all_closest(origin, zombie_utility::get_round_enemy_array(), undefined, undefined, radius);
	if(!isdefined(self.zombies))
	{
		return false;
	}
	self.power = 1;
	return true;
}

/*
	Name: zombie_power_off
	Namespace: zm_power
	Checksum: 0xE21A4119
	Offset: 0x2768
	Size: 0x82
	Parameters: 2
	Flags: None
*/
function zombie_power_off(origin, radius)
{
	/#
		println("");
	#/
	for(i = 0; i < self.zombies.size; i++)
	{
		self.zombies[i] thread stun_zombie();
		waitframe(1);
	}
}

/*
	Name: stun_zombie
	Namespace: zm_power
	Checksum: 0xCCFAAFA1
	Offset: 0x27F8
	Size: 0x9E
	Parameters: 0
	Flags: Linked
*/
function stun_zombie()
{
	self notify(#"stun_zombie");
	self endon(#"death", #"stun_zombie");
	if(self.health <= 0)
	{
		/#
			iprintln("");
		#/
		return;
	}
	if(is_true(self.ignore_inert))
	{
		return;
	}
	if(isdefined(self.stun_zombie))
	{
		self thread [[self.stun_zombie]]();
		return;
	}
}

/*
	Name: perk_range
	Namespace: zm_power
	Checksum: 0x7462D64F
	Offset: 0x28A0
	Size: 0xDC
	Parameters: 3
	Flags: Linked
*/
function perk_range(delta, origin, radius)
{
	if(isdefined(self.target))
	{
		perkorigin = self.target.origin;
		if(is_true(self.target.trigger_off))
		{
			perkorigin = self.target.realorigin;
		}
		else if(is_true(self.target.disabled))
		{
			perkorigin = perkorigin + vectorscale((0, 0, 1), 10000);
		}
		if(distancesquared(perkorigin, origin) < radius * radius)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: perk_power_on
	Namespace: zm_power
	Checksum: 0xE016E076
	Offset: 0x2988
	Size: 0x9C
	Parameters: 2
	Flags: Linked
*/
function perk_power_on(origin, radius)
{
	/#
		println(("" + self.target zm_perks::getvendingmachinenotify()) + "");
	#/
	level notify(self.target zm_perks::getvendingmachinenotify() + "_on");
	zm_perks::perk_unpause(self.target.script_notify);
}

/*
	Name: perk_power_off
	Namespace: zm_power
	Checksum: 0xCE04A9DD
	Offset: 0x2A30
	Size: 0x17A
	Parameters: 2
	Flags: Linked
*/
function perk_power_off(origin, radius)
{
	notify_name = self.target zm_perks::getvendingmachinenotify();
	if(isdefined(notify_name) && notify_name == "revive")
	{
		if(level flag::exists("solo_game") && level flag::get("solo_game"))
		{
			return;
		}
	}
	/#
		println(("" + self.target zm_perks::getvendingmachinenotify()) + "");
	#/
	self.target notify(#"death");
	self.target thread zm_perks::vending_trigger_think();
	if(isdefined(self.target.perk_hum))
	{
		self.target.perk_hum delete();
	}
	zm_perks::perk_pause(self.target.script_notify);
	level notify(self.target zm_perks::getvendingmachinenotify() + "_off");
}

/*
	Name: turn_power_on_and_open_doors
	Namespace: zm_power
	Checksum: 0x51633BCC
	Offset: 0x2BB8
	Size: 0x354
	Parameters: 1
	Flags: Linked
*/
function turn_power_on_and_open_doors(power_zone)
{
	level.local_doors_stay_open = 1;
	level.power_local_doors_globally = 1;
	if(!isdefined(power_zone))
	{
		level flag::set("power_on");
		level clientfield::set("zombie_power_on", 1);
	}
	else
	{
		level flag::set("power_on" + power_zone);
		level clientfield::set("zombie_power_on", power_zone + 1);
	}
	foreach(player in level.players)
	{
		player zm_stats::function_8f10788e("boas_power_turnedon");
	}
	if(namespace_59ff1d6c::function_901b751c(#"hash_29004a67830922b6") != 0)
	{
		zombie_doors = getentarray("zombie_door", "targetname");
		foreach(door in zombie_doors)
		{
			if(!isdefined(door.script_noteworthy))
			{
				continue;
			}
			if(!isdefined(power_zone) && (door.script_noteworthy == "electric_door" || door.script_noteworthy == "electric_buyable_door"))
			{
				door notify(#"power_on");
				continue;
			}
			if(isdefined(door.script_int) && door.script_int == power_zone && (door.script_noteworthy == "electric_door" || door.script_noteworthy == "electric_buyable_door"))
			{
				door notify(#"power_on");
				if(isdefined(level.temporary_power_switch_logic))
				{
					door.power_on = 1;
				}
				continue;
			}
			if(isdefined(door.script_int) && door.script_int == power_zone && door.script_noteworthy === "local_electric_door")
			{
				door notify(#"local_power_on");
			}
		}
	}
}

/*
	Name: turn_power_off_and_close_doors
	Namespace: zm_power
	Checksum: 0xFF24A67D
	Offset: 0x2F18
	Size: 0x2EC
	Parameters: 1
	Flags: Linked
*/
function turn_power_off_and_close_doors(power_zone)
{
	level.local_doors_stay_open = 0;
	level.power_local_doors_globally = 0;
	if(!isdefined(power_zone))
	{
		level flag::clear("power_on");
		level clientfield::set("zombie_power_off", 0);
	}
	else
	{
		level flag::clear("power_on" + power_zone);
		level clientfield::set("zombie_power_off", power_zone);
	}
	if(namespace_59ff1d6c::function_901b751c(#"hash_29004a67830922b6") != 0)
	{
		zombie_doors = getentarray("zombie_door", "targetname");
		foreach(door in zombie_doors)
		{
			if(!isdefined(door.script_noteworthy))
			{
				continue;
			}
			if(!isdefined(power_zone) && (door.script_noteworthy == "electric_door" || door.script_noteworthy == "electric_buyable_door"))
			{
				door notify(#"power_on");
				continue;
			}
			if(isdefined(door.script_int) && door.script_int == power_zone && (door.script_noteworthy == "electric_door" || door.script_noteworthy == "electric_buyable_door"))
			{
				door notify(#"power_on");
				if(isdefined(level.temporary_power_switch_logic))
				{
					door.power_on = 0;
					door sethintstring(#"hash_71158766520dc432");
					door notify(#"kill_door_think");
					door thread zm_blockers::door_think();
				}
				continue;
			}
			if(isdefined(door.script_noteworthy) && door.script_noteworthy == "local_electric_door")
			{
				door notify(#"local_power_on");
			}
		}
	}
}

/*
	Name: wait_for_power
	Namespace: zm_power
	Checksum: 0x6D0C74FD
	Offset: 0x3210
	Size: 0x80
	Parameters: 1
	Flags: Linked
*/
function wait_for_power(hintstring)
{
	self endon(#"death");
	level flag::wait_till("power_on");
	self.script_noteworthy = undefined;
	self.trigger sethintstring(hintstring);
	if(isdefined(self.var_49d94d8a))
	{
		self [[self.var_49d94d8a]]();
	}
}

