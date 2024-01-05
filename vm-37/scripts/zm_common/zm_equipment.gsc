#using script_2cb831533cab2794;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_laststand.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\util.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\abilities\ability_player.gsc;
#using scripts\core_common\struct.gsc;

#namespace zm_equipment;

/*
	Name: __init__system__
	Namespace: zm_equipment
	Checksum: 0x1E80D680
	Offset: 0x1D0
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_equipment", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_equipment
	Checksum: 0x9B13C935
	Offset: 0x228
	Size: 0xB4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.buildable_piece_count = 24;
	/#
		level.abilities_devgui_add_gadgets_custom = &abilities_devgui_add_gadgets_custom;
	#/
	level.placeable_equipment_destroy_fn = [];
	if(!is_true(level._no_equipment_activated_clientfield))
	{
		clientfield::register("scriptmover", "equipment_activated", 1, 4, "int");
	}
	level.zm_hint_text = zm_hint_text::register();
	level.var_1f5cc2b4 = &function_dfaf0bad;
}

/*
	Name: function_8ac3bea9
	Namespace: zm_equipment
	Checksum: 0xC18CF998
	Offset: 0x2E8
	Size: 0x14
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ac3bea9()
{
	init_upgrade();
}

/*
	Name: function_dfaf0bad
	Namespace: zm_equipment
	Checksum: 0xBFB7778E
	Offset: 0x308
	Size: 0xEA
	Parameters: 0
	Flags: Linked
*/
function function_dfaf0bad()
{
	if(!isplayer(self))
	{
		return;
	}
	if(isdefined(self.var_6489500a))
	{
		if(gettime() - self.var_6489500a > int(10 * 1000))
		{
			self show_hint_text(#"hash_46304d37db90bf5b");
			if(isplayer(self))
			{
				self.var_6489500a = gettime();
			}
		}
	}
	else
	{
		self show_hint_text(#"hash_46304d37db90bf5b");
		if(isplayer(self))
		{
			self.var_6489500a = gettime();
		}
	}
}

/*
	Name: abilities_devgui_add_gadgets_custom
	Namespace: zm_equipment
	Checksum: 0x582283BC
	Offset: 0x400
	Size: 0xD48
	Parameters: 4
	Flags: None
*/
function abilities_devgui_add_gadgets_custom(root, pname, pid, menu_index)
{
	/#
		var_61b8f8fb = "";
		add_cmd_with_root = (("" + var_61b8f8fb) + pname) + "";
		a_abilities = [];
		arrayinsert(a_abilities, getweapon(#"eq_frag_grenade"), 0);
		arrayinsert(a_abilities, getweapon(#"incendiary_grenade"), 0);
		arrayinsert(a_abilities, getweapon(#"sticky_grenade"), 0);
		arrayinsert(a_abilities, getweapon(#"proximity_grenade"), 0);
		arrayinsert(a_abilities, getweapon(#"incendiary_fire"), 0);
		arrayinsert(a_abilities, getweapon(#"concussion_grenade"), 0);
		arrayinsert(a_abilities, getweapon(#"flash_grenade"), 0);
		arrayinsert(a_abilities, getweapon(#"emp_grenade"), 0);
		arrayinsert(a_abilities, getweapon(#"cymbal_monkey"), 0);
		arrayinsert(a_abilities, getweapon(#"tesla_coil"), 0);
		arrayinsert(a_abilities, getweapon(#"tomahawk_t8"), 0);
		ability_player::function_174037fe(add_cmd_with_root, pid, a_abilities, "", menu_index);
		var_ab290760 = [];
		arrayinsert(var_ab290760, getweapon(#"hero_gravityspikes"), 0);
		arrayinsert(var_ab290760, getweapon(#"hero_lightninggun"), 0);
		arrayinsert(var_ab290760, getweapon(#"hero_minigun"), 0);
		arrayinsert(var_ab290760, getweapon(#"hero_pineapplegun"), 0);
		arrayinsert(var_ab290760, getweapon(#"hero_chemicalgelgun"), 0);
		arrayinsert(var_ab290760, getweapon(#"hero_bowlauncher"), 0);
		arrayinsert(var_ab290760, getweapon(#"hero_armblade"), 0);
		arrayinsert(var_ab290760, getweapon(#"hero_annihilator"), 0);
		arrayinsert(var_ab290760, getweapon(#"hero_flamethrower"), 0);
		arrayinsert(var_ab290760, getweapon(#"hero_chakram_lv1"), 0);
		arrayinsert(var_ab290760, getweapon(#"hero_chakram_lv2"), 0);
		arrayinsert(var_ab290760, getweapon(#"hero_chakram_lv3"), 0);
		arrayinsert(var_ab290760, getweapon(#"hero_hammer_lv1"), 0);
		arrayinsert(var_ab290760, getweapon(#"hero_hammer_lv2"), 0);
		arrayinsert(var_ab290760, getweapon(#"hero_hammer_lv3"), 0);
		arrayinsert(var_ab290760, getweapon(#"hero_scepter_lv1"), 0);
		arrayinsert(var_ab290760, getweapon(#"hero_scepter_lv2"), 0);
		arrayinsert(var_ab290760, getweapon(#"hero_scepter_lv3"), 0);
		arrayinsert(var_ab290760, getweapon(#"hero_sword_pistol_lv1"), 0);
		arrayinsert(var_ab290760, getweapon(#"hero_sword_pistol_lv2"), 0);
		arrayinsert(var_ab290760, getweapon(#"hero_sword_pistol_lv3"), 0);
		arrayinsert(var_ab290760, getweapon(#"hero_chakram_lv1"), 0);
		arrayinsert(var_ab290760, getweapon(#"hero_chakram_lv2"), 0);
		arrayinsert(var_ab290760, getweapon(#"hero_chakram_lv3"), 0);
		arrayinsert(var_ab290760, getweapon(#"hero_hammer_lv1"), 0);
		arrayinsert(var_ab290760, getweapon(#"hero_hammer_lv2"), 0);
		arrayinsert(var_ab290760, getweapon(#"hero_hammer_lv3"), 0);
		arrayinsert(var_ab290760, getweapon(#"hero_scepter_lv1"), 0);
		arrayinsert(var_ab290760, getweapon(#"hero_scepter_lv2"), 0);
		arrayinsert(var_ab290760, getweapon(#"hero_scepter_lv3"), 0);
		arrayinsert(var_ab290760, getweapon(#"hero_sword_pistol_lv1"), 0);
		arrayinsert(var_ab290760, getweapon(#"hero_sword_pistol_lv2"), 0);
		arrayinsert(var_ab290760, getweapon(#"hero_sword_pistol_lv3"), 0);
		arrayinsert(var_ab290760, getweapon(#"hero_flamethrower_t8_lv1"), 0);
		arrayinsert(var_ab290760, getweapon(#"hero_flamethrower_t8_lv2"), 0);
		arrayinsert(var_ab290760, getweapon(#"hero_flamethrower_t8_lv3"), 0);
		arrayinsert(var_ab290760, getweapon(#"hero_gravityspikes_t8_lv1"), 0);
		arrayinsert(var_ab290760, getweapon(#"hero_gravityspikes_t8_lv2"), 0);
		arrayinsert(var_ab290760, getweapon(#"hero_gravityspikes_t8_lv3"), 0);
		arrayinsert(var_ab290760, getweapon(#"hero_katana_t8_lv1"), 0);
		arrayinsert(var_ab290760, getweapon(#"hero_katana_t8_lv2"), 0);
		arrayinsert(var_ab290760, getweapon(#"hero_katana_t8_lv3"), 0);
		arrayinsert(var_ab290760, getweapon(#"hero_minigun_t8_lv1"), 0);
		arrayinsert(var_ab290760, getweapon(#"hero_minigun_t8_lv2"), 0);
		arrayinsert(var_ab290760, getweapon(#"hero_minigun_t8_lv3"), 0);
		ability_player::function_a40d04ca(add_cmd_with_root, pid, var_ab290760, "", menu_index);
		menu_index++;
		menu_index = ability_player::abilities_devgui_add_power(add_cmd_with_root, pid, menu_index);
		menu_index = ability_player::function_2e0162e9(add_cmd_with_root, pid, menu_index);
		adddebugcommand("");
		return menu_index;
	#/
}

/*
	Name: signal_activated
	Namespace: zm_equipment
	Checksum: 0xC810D45A
	Offset: 0x1158
	Size: 0xBC
	Parameters: 1
	Flags: None
*/
function signal_activated(val)
{
	if(!isdefined(val))
	{
		val = 1;
	}
	if(is_true(level._no_equipment_activated_clientfield))
	{
		return;
	}
	self endon(#"death");
	self clientfield::set("equipment_activated", val);
	for(i = 0; i < 2; i++)
	{
		util::wait_network_frame();
	}
	self clientfield::set("equipment_activated", 0);
}

/*
	Name: register
	Namespace: zm_equipment
	Checksum: 0x446353F1
	Offset: 0x1220
	Size: 0x1B4
	Parameters: 5
	Flags: None
*/
function register(equipment_name, hint, howto_hint, hint_icon, equipmentvo)
{
	equipment = getweapon(equipment_name);
	struct = spawnstruct();
	if(!isdefined(level.zombie_equipment))
	{
		level.zombie_equipment = [];
	}
	struct.equipment = equipment;
	struct.hint = hint;
	struct.howto_hint = howto_hint;
	struct.hint_icon = hint_icon;
	struct.vox = equipmentvo;
	struct.triggers = [];
	struct.models = [];
	struct.notify_strings = spawnstruct();
	struct.notify_strings.activate = equipment.name + "_activate";
	struct.notify_strings.deactivate = equipment.name + "_deactivate";
	struct.notify_strings.taken = equipment.name + "_taken";
	struct.notify_strings.pickup = equipment.name + "_pickup";
	level.zombie_equipment[equipment] = struct;
	/#
		level thread function_1d34b98d(equipment);
	#/
}

/*
	Name: register_slot_watcher_override
	Namespace: zm_equipment
	Checksum: 0x5AF8BA7D
	Offset: 0x13E0
	Size: 0x24
	Parameters: 2
	Flags: None
*/
function register_slot_watcher_override(str_equipment, func_slot_watcher_override)
{
	level.a_func_equipment_slot_watcher_override[str_equipment] = func_slot_watcher_override;
}

/*
	Name: is_included
	Namespace: zm_equipment
	Checksum: 0x3C247F66
	Offset: 0x1410
	Size: 0x62
	Parameters: 1
	Flags: None
*/
function is_included(equipment)
{
	if(!isdefined(level.zombie_include_equipment))
	{
		return 0;
	}
	if(isstring(equipment))
	{
		equipment = getweapon(equipment);
	}
	return isdefined(level.zombie_include_equipment[equipment.rootweapon]);
}

/*
	Name: include
	Namespace: zm_equipment
	Checksum: 0x1AA9F219
	Offset: 0x1480
	Size: 0x4C
	Parameters: 1
	Flags: None
*/
function include(equipment_name)
{
	if(!isdefined(level.zombie_include_equipment))
	{
		level.zombie_include_equipment = [];
	}
	level.zombie_include_equipment[getweapon(equipment_name)] = 1;
}

/*
	Name: set_ammo_driven
	Namespace: zm_equipment
	Checksum: 0xADF3CE8D
	Offset: 0x14D8
	Size: 0xA6
	Parameters: 3
	Flags: None
*/
function set_ammo_driven(equipment_name, start, refill_max_ammo)
{
	if(!isdefined(refill_max_ammo))
	{
		refill_max_ammo = 0;
	}
	level.zombie_equipment[getweapon(equipment_name)].notake = 1;
	level.zombie_equipment[getweapon(equipment_name)].start_ammo = start;
	level.zombie_equipment[getweapon(equipment_name)].refill_max_ammo = refill_max_ammo;
}

/*
	Name: limit
	Namespace: zm_equipment
	Checksum: 0x71250C1
	Offset: 0x1588
	Size: 0x94
	Parameters: 2
	Flags: None
*/
function limit(equipment_name, limited)
{
	if(!isdefined(level._limited_equipment))
	{
		level._limited_equipment = [];
	}
	if(limited)
	{
		level._limited_equipment[level._limited_equipment.size] = getweapon(equipment_name);
	}
	else
	{
		arrayremovevalue(level._limited_equipment, getweapon(equipment_name), 0);
	}
}

/*
	Name: init_upgrade
	Namespace: zm_equipment
	Checksum: 0x976257F8
	Offset: 0x1628
	Size: 0x144
	Parameters: 0
	Flags: Linked
*/
function init_upgrade()
{
	equipment_spawns = [];
	equipment_spawns = getentarray("zombie_equipment_upgrade", "targetname");
	for(i = 0; i < equipment_spawns.size; i++)
	{
		equipment_spawns[i].equipment = getweapon(equipment_spawns[i].zombie_equipment_upgrade);
		hint_string = get_hint(equipment_spawns[i].equipment);
		equipment_spawns[i] sethintstring(hint_string);
		equipment_spawns[i] setcursorhint("HINT_NOICON");
		equipment_spawns[i] usetriggerrequirelookat();
		equipment_spawns[i] add_to_trigger_list(equipment_spawns[i].equipment);
		equipment_spawns[i] thread equipment_spawn_think();
	}
}

/*
	Name: get_hint
	Namespace: zm_equipment
	Checksum: 0x97783367
	Offset: 0x1778
	Size: 0x5A
	Parameters: 1
	Flags: Linked
*/
function get_hint(equipment)
{
	/#
		assert(isdefined(level.zombie_equipment[equipment]), equipment.name + "");
	#/
	return level.zombie_equipment[equipment].hint;
}

/*
	Name: get_howto_hint
	Namespace: zm_equipment
	Checksum: 0x6B31CC31
	Offset: 0x17E0
	Size: 0x5A
	Parameters: 1
	Flags: Linked
*/
function get_howto_hint(equipment)
{
	/#
		assert(isdefined(level.zombie_equipment[equipment]), equipment.name + "");
	#/
	return level.zombie_equipment[equipment].howto_hint;
}

/*
	Name: get_icon
	Namespace: zm_equipment
	Checksum: 0xADC6423D
	Offset: 0x1848
	Size: 0x5A
	Parameters: 1
	Flags: None
*/
function get_icon(equipment)
{
	/#
		assert(isdefined(level.zombie_equipment[equipment]), equipment.name + "");
	#/
	return level.zombie_equipment[equipment].hint_icon;
}

/*
	Name: get_notify_strings
	Namespace: zm_equipment
	Checksum: 0x809C2721
	Offset: 0x18B0
	Size: 0x5A
	Parameters: 1
	Flags: Linked
*/
function get_notify_strings(equipment)
{
	/#
		assert(isdefined(level.zombie_equipment[equipment]), equipment.name + "");
	#/
	return level.zombie_equipment[equipment].notify_strings;
}

/*
	Name: add_to_trigger_list
	Namespace: zm_equipment
	Checksum: 0x8FDFD79C
	Offset: 0x1918
	Size: 0xCC
	Parameters: 1
	Flags: Linked
*/
function add_to_trigger_list(equipment)
{
	/#
		assert(isdefined(level.zombie_equipment[equipment]), equipment.name + "");
	#/
	level.zombie_equipment[equipment].triggers[level.zombie_equipment[equipment].triggers.size] = self;
	level.zombie_equipment[equipment].models[level.zombie_equipment[equipment].models.size] = getent(self.target, "targetname");
}

/*
	Name: equipment_spawn_think
	Namespace: zm_equipment
	Checksum: 0x6EAC8BB4
	Offset: 0x19F0
	Size: 0x1AC
	Parameters: 0
	Flags: Linked
*/
function equipment_spawn_think()
{
	for(;;)
	{
		waitresult = undefined;
		waitresult = self waittill(#"trigger");
		player = waitresult.activator;
		if(player zm_utility::in_revive_trigger() || player zm_utility::is_drinking())
		{
			wait(0.1);
			continue;
		}
		if(!is_limited(self.equipment) || !limited_in_use(self.equipment))
		{
			if(is_limited(self.equipment))
			{
				player setup_limited(self.equipment);
				if(isdefined(level.hacker_tool_positions))
				{
					new_pos = array::random(level.hacker_tool_positions);
					self.origin = new_pos.trigger_org;
					model = getent(self.target, "targetname");
					model.origin = new_pos.model_org;
					model.angles = new_pos.model_ang;
				}
			}
			player give(self.equipment);
			continue;
		}
		wait(0.1);
	}
}

/*
	Name: set_equipment_invisibility_to_player
	Namespace: zm_equipment
	Checksum: 0x64E8E41B
	Offset: 0x1BA8
	Size: 0xDC
	Parameters: 2
	Flags: Linked
*/
function set_equipment_invisibility_to_player(equipment, invisible)
{
	triggers = level.zombie_equipment[equipment].triggers;
	for(i = 0; i < triggers.size; i++)
	{
		if(isdefined(triggers[i]))
		{
			triggers[i] setinvisibletoplayer(self, invisible);
		}
	}
	models = level.zombie_equipment[equipment].models;
	for(i = 0; i < models.size; i++)
	{
		if(isdefined(models[i]))
		{
			models[i] setinvisibletoplayer(self, invisible);
		}
	}
}

/*
	Name: take
	Namespace: zm_equipment
	Checksum: 0xB9D2AC0B
	Offset: 0x1C90
	Size: 0x2CC
	Parameters: 1
	Flags: Linked
*/
function take(equipment)
{
	if(!isdefined(equipment))
	{
		equipment = self get_player_equipment();
	}
	if(!isdefined(equipment))
	{
		return;
	}
	if(equipment == level.weaponnone)
	{
		return;
	}
	if(!self has_player_equipment(equipment))
	{
		return;
	}
	current = 0;
	current_weapon = 0;
	if(isdefined(self get_player_equipment()) && equipment == self get_player_equipment())
	{
		current = 1;
	}
	if(equipment == self getcurrentweapon())
	{
		current_weapon = 1;
	}
	/#
		println((("" + self.name) + "") + function_a16a090d(equipment) + "");
	#/
	notify_strings = get_notify_strings(equipment);
	if(is_true(self.current_equipment_active[equipment]))
	{
		self.current_equipment_active[equipment] = 0;
		self notify(notify_strings.deactivate);
	}
	self notify(notify_strings.taken);
	if(!is_limited(equipment) || (is_limited(equipment) && !limited_in_use(equipment)))
	{
		self set_equipment_invisibility_to_player(equipment, 0);
	}
	if(current)
	{
		self set_player_equipment(level.weaponnone);
		self setactionslot(2, "");
	}
	else
	{
		arrayremovevalue(self.deployed_equipment, equipment);
	}
	if(self hasweapon(equipment))
	{
		self takeweapon(equipment);
	}
	if(current_weapon)
	{
		self zm_weapons::switch_back_primary_weapon();
	}
}

/*
	Name: give
	Namespace: zm_equipment
	Checksum: 0xF04064FF
	Offset: 0x1F68
	Size: 0x1EE
	Parameters: 1
	Flags: Linked
*/
function give(equipment)
{
	if(!isdefined(equipment))
	{
		return;
	}
	if(!isdefined(level.zombie_equipment[equipment]))
	{
		return;
	}
	if(self has_player_equipment(equipment))
	{
		return;
	}
	/#
		println((("" + self.name) + "") + function_a16a090d(equipment) + "");
	#/
	curr_weapon = self getcurrentweapon();
	curr_weapon_was_curr_equipment = self is_player_equipment(curr_weapon);
	self take();
	self set_player_equipment(equipment);
	self giveweapon(equipment);
	self start_ammo(equipment);
	self thread show_hint(equipment);
	self set_equipment_invisibility_to_player(equipment, 1);
	self setactionslot(2, "weapon", equipment);
	self thread slot_watcher(equipment);
	self zm_audio::create_and_play_dialog(#"weapon_pickup", level.zombie_equipment[equipment].vox);
	self notify(#"player_given", equipment);
}

/*
	Name: buy
	Namespace: zm_equipment
	Checksum: 0x99CD8497
	Offset: 0x2160
	Size: 0x134
	Parameters: 1
	Flags: None
*/
function buy(equipment)
{
	if(isstring(equipment))
	{
		equipment = getweapon(equipment);
	}
	/#
		println((("" + self.name) + "") + function_a16a090d(equipment) + "");
	#/
	if(isdefined(self.current_equipment) && equipment != self.current_equipment && self.current_equipment != level.weaponnone)
	{
		self take(self.current_equipment);
	}
	self notify(#"player_bought", equipment);
	self give(equipment);
	if(equipment.isriotshield && isdefined(self.player_shield_reset_health))
	{
		self [[self.player_shield_reset_health]](equipment);
	}
}

/*
	Name: slot_watcher
	Namespace: zm_equipment
	Checksum: 0x25591E24
	Offset: 0x22A0
	Size: 0x204
	Parameters: 1
	Flags: Linked
*/
function slot_watcher(equipment)
{
	self notify(#"kill_equipment_slot_watcher");
	self endon(#"kill_equipment_slot_watcher", #"disconnect");
	notify_strings = get_notify_strings(equipment);
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"weapon_change");
		prev_weapon = waitresult.last_weapon;
		curr_weapon = waitresult.weapon;
		self.prev_weapon_before_equipment_change = undefined;
		if(isdefined(prev_weapon) && level.weaponnone != prev_weapon)
		{
			prev_weapon_type = prev_weapon.inventorytype;
			if("primary" == prev_weapon_type || "altmode" == prev_weapon_type)
			{
				self.prev_weapon_before_equipment_change = prev_weapon;
			}
		}
		if(!isdefined(level.a_func_equipment_slot_watcher_override))
		{
			level.a_func_equipment_slot_watcher_override = [];
		}
		if(isdefined(level.a_func_equipment_slot_watcher_override[equipment.name]))
		{
			self [[level.a_func_equipment_slot_watcher_override[equipment.name]]](equipment, curr_weapon, prev_weapon, notify_strings);
		}
		else
		{
			if(curr_weapon == equipment && !self.current_equipment_active[equipment])
			{
				self notify(notify_strings.activate);
				self.current_equipment_active[equipment] = 1;
			}
			else if(curr_weapon != equipment && self.current_equipment_active[equipment])
			{
				self notify(notify_strings.deactivate);
				self.current_equipment_active[equipment] = 0;
			}
		}
	}
}

/*
	Name: is_limited
	Namespace: zm_equipment
	Checksum: 0x115013E5
	Offset: 0x24B0
	Size: 0x66
	Parameters: 1
	Flags: Linked
*/
function is_limited(equipment)
{
	if(isdefined(level._limited_equipment))
	{
		for(i = 0; i < level._limited_equipment.size; i++)
		{
			if(level._limited_equipment[i] == equipment)
			{
				return true;
			}
		}
	}
	return false;
}

/*
	Name: limited_in_use
	Namespace: zm_equipment
	Checksum: 0xE7617AAF
	Offset: 0x2520
	Size: 0xB0
	Parameters: 1
	Flags: Linked
*/
function limited_in_use(equipment)
{
	players = getplayers();
	for(i = 0; i < players.size; i++)
	{
		current_equipment = players[i] get_player_equipment();
		if(isdefined(current_equipment) && current_equipment == equipment)
		{
			return true;
		}
	}
	if(isdefined(level.dropped_equipment) && isdefined(level.dropped_equipment[equipment]))
	{
		return true;
	}
	return false;
}

/*
	Name: setup_limited
	Namespace: zm_equipment
	Checksum: 0x8EB735F3
	Offset: 0x25D8
	Size: 0x94
	Parameters: 1
	Flags: Linked
*/
function setup_limited(equipment)
{
	players = getplayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] set_equipment_invisibility_to_player(equipment, 1);
	}
	self thread release_limited_on_disconnect(equipment);
	self thread release_limited_on_taken(equipment);
}

/*
	Name: release_limited_on_taken
	Namespace: zm_equipment
	Checksum: 0xF6CBB292
	Offset: 0x2678
	Size: 0xB4
	Parameters: 1
	Flags: Linked
*/
function release_limited_on_taken(equipment)
{
	self endon(#"disconnect");
	notify_strings = get_notify_strings(equipment);
	self waittill(notify_strings.taken, #"spawned_spectator");
	players = getplayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] set_equipment_invisibility_to_player(equipment, 0);
	}
}

/*
	Name: release_limited_on_disconnect
	Namespace: zm_equipment
	Checksum: 0xDDC213BE
	Offset: 0x2738
	Size: 0xC4
	Parameters: 1
	Flags: Linked
*/
function release_limited_on_disconnect(equipment)
{
	notify_strings = get_notify_strings(equipment);
	self endon(notify_strings.taken);
	self waittill(#"disconnect");
	players = getplayers();
	for(i = 0; i < players.size; i++)
	{
		if(isalive(players[i]))
		{
			players[i] set_equipment_invisibility_to_player(equipment, 0);
		}
	}
}

/*
	Name: is_active
	Namespace: zm_equipment
	Checksum: 0xC39119E1
	Offset: 0x2808
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function is_active(equipment)
{
	if(!isdefined(self.current_equipment_active) || !isdefined(self.current_equipment_active[equipment]))
	{
		return 0;
	}
	return self.current_equipment_active[equipment];
}

/*
	Name: init_hint_hudelem
	Namespace: zm_equipment
	Checksum: 0xCE09DC88
	Offset: 0x2858
	Size: 0x8A
	Parameters: 6
	Flags: None
*/
function init_hint_hudelem(x, y, alignx, aligny, fontscale, alpha)
{
	self.x = x;
	self.y = y;
	self.alignx = alignx;
	self.aligny = aligny;
	self.fontscale = fontscale;
	self.alpha = alpha;
	self.sort = 20;
}

/*
	Name: setup_client_hintelem
	Namespace: zm_equipment
	Checksum: 0x198AD573
	Offset: 0x28F0
	Size: 0x184
	Parameters: 2
	Flags: None
*/
function setup_client_hintelem(ypos, font_scale)
{
	/#
		if(!isdefined(ypos))
		{
			ypos = 220;
		}
		if(!isdefined(font_scale))
		{
			font_scale = 1.25;
		}
		self endon(#"death");
		if(!isdefined(self.hintelem))
		{
			self.hintelem = newdebughudelem(self);
		}
		if(self issplitscreen())
		{
			if(getdvarint(#"splitscreen_playercount", 0) >= 3)
			{
				self.hintelem init_hint_hudelem(160, 90, "", "", font_scale * 0.8, 1);
			}
			else
			{
				self.hintelem init_hint_hudelem(160, 90, "", "", font_scale, 1);
			}
		}
		else
		{
			self.hintelem init_hint_hudelem(320, ypos, "", "", font_scale, 1);
		}
	#/
}

/*
	Name: show_hint
	Namespace: zm_equipment
	Checksum: 0x55D6F3BA
	Offset: 0x2A80
	Size: 0x9C
	Parameters: 1
	Flags: Linked
*/
function show_hint(equipment)
{
	self notify(#"kill_previous_show_equipment_hint_thread");
	self endon(#"kill_previous_show_equipment_hint_thread", #"death");
	if(is_true(self.do_not_display_equipment_pickup_hint))
	{
		return;
	}
	wait(0.5);
	text = get_howto_hint(equipment);
	self show_hint_text(text);
}

/*
	Name: show_hint_text
	Namespace: zm_equipment
	Checksum: 0xD4BFFEBD
	Offset: 0x2B28
	Size: 0x234
	Parameters: 4
	Flags: Linked
*/
function show_hint_text(text, show_for_time, font_scale, ypos)
{
	if(!isdefined(ypos))
	{
		ypos = 3.2;
	}
	if(!isdefined(self) || !isplayer(self))
	{
		return;
	}
	self notify("7e9f80d0029d1241");
	self endon("7e9f80d0029d1241");
	self endon(#"disconnect");
	level endoncallback(&function_57fbff5c, #"end_game");
	if(!level.zm_hint_text zm_hint_text::is_open(self))
	{
		level.zm_hint_text zm_hint_text::open(self);
	}
	level.zm_hint_text zm_hint_text::set_text(self, font_scale);
	level.zm_hint_text zm_hint_text::set_state(self, #"visible");
	time = undefined;
	time = self waittilltimeout(ypos, #"hide_equipment_hint_text", #"death", #"disconnect");
	if(isdefined(time) && isdefined(self) && level.zm_hint_text zm_hint_text::is_open(self))
	{
		level.zm_hint_text zm_hint_text::set_state(self, #"defaultstate");
		self waittilltimeout(1, #"hide_equipment_hint_text");
	}
	if(isdefined(self) && level.zm_hint_text zm_hint_text::is_open(self))
	{
		level.zm_hint_text zm_hint_text::close(self);
	}
}

/*
	Name: function_57fbff5c
	Namespace: zm_equipment
	Checksum: 0x15D7F179
	Offset: 0x2D68
	Size: 0xC0
	Parameters: 1
	Flags: Linked
*/
function function_57fbff5c(str_notify)
{
	foreach(player in level.players)
	{
		if(isdefined(player) && level.zm_hint_text zm_hint_text::is_open(player))
		{
			level.zm_hint_text zm_hint_text::close(player);
		}
	}
}

/*
	Name: start_ammo
	Namespace: zm_equipment
	Checksum: 0x8D5979D9
	Offset: 0x2E30
	Size: 0xC6
	Parameters: 1
	Flags: Linked
*/
function start_ammo(equipment)
{
	if(self hasweapon(equipment))
	{
		maxammo = 1;
		if(is_true(level.zombie_equipment[equipment].notake))
		{
			maxammo = level.zombie_equipment[equipment].start_ammo;
		}
		self setweaponammoclip(equipment, maxammo);
		self notify(#"equipment_ammo_changed", {#equipment:equipment});
		return maxammo;
	}
	return 0;
}

/*
	Name: change_ammo
	Namespace: zm_equipment
	Checksum: 0xD6485043
	Offset: 0x2F00
	Size: 0x136
	Parameters: 2
	Flags: None
*/
function change_ammo(equipment, change)
{
	if(self hasweapon(equipment))
	{
		oldammo = self getweaponammoclip(equipment);
		maxammo = 1;
		if(is_true(level.zombie_equipment[equipment].notake))
		{
			maxammo = level.zombie_equipment[equipment].start_ammo;
		}
		newammo = int(min(maxammo, max(0, oldammo + change)));
		self setweaponammoclip(equipment, newammo);
		self notify(#"equipment_ammo_changed", {#equipment:equipment});
		return newammo;
	}
	return 0;
}

/*
	Name: register_for_level
	Namespace: zm_equipment
	Checksum: 0xFEC3FAEB
	Offset: 0x3040
	Size: 0x74
	Parameters: 1
	Flags: None
*/
function register_for_level(weaponname)
{
	weapon = getweapon(weaponname);
	if(is_equipment(weapon))
	{
		return;
	}
	if(!isdefined(level.zombie_equipment_list))
	{
		level.zombie_equipment_list = [];
	}
	level.zombie_equipment_list[weapon] = weapon;
}

/*
	Name: is_equipment
	Namespace: zm_equipment
	Checksum: 0x175A47AA
	Offset: 0x30C0
	Size: 0x3E
	Parameters: 1
	Flags: Linked
*/
function is_equipment(weapon)
{
	if(!isdefined(weapon) || !isdefined(level.zombie_equipment_list))
	{
		return 0;
	}
	return isdefined(level.zombie_equipment_list[weapon]);
}

/*
	Name: is_equipment_that_blocks_purchase
	Namespace: zm_equipment
	Checksum: 0xBEA018D6
	Offset: 0x3108
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function is_equipment_that_blocks_purchase(weapon)
{
	return is_equipment(weapon);
}

/*
	Name: is_player_equipment
	Namespace: zm_equipment
	Checksum: 0x677E0597
	Offset: 0x3138
	Size: 0x38
	Parameters: 1
	Flags: Linked
*/
function is_player_equipment(weapon)
{
	if(!isdefined(weapon) || !isdefined(self.current_equipment))
	{
		return 0;
	}
	return self.current_equipment == weapon;
}

/*
	Name: has_deployed_equipment
	Namespace: zm_equipment
	Checksum: 0xBE228CAC
	Offset: 0x3178
	Size: 0x86
	Parameters: 1
	Flags: Linked
*/
function has_deployed_equipment(weapon)
{
	if(!isdefined(weapon) || !isdefined(self.deployed_equipment) || self.deployed_equipment.size < 1)
	{
		return false;
	}
	for(i = 0; i < self.deployed_equipment.size; i++)
	{
		if(self.deployed_equipment[i] == weapon)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: has_player_equipment
	Namespace: zm_equipment
	Checksum: 0x5233E985
	Offset: 0x3208
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function has_player_equipment(weapon)
{
	return self is_player_equipment(weapon) || self has_deployed_equipment(weapon);
}

/*
	Name: get_player_equipment
	Namespace: zm_equipment
	Checksum: 0x3BF97BA
	Offset: 0x3250
	Size: 0x36
	Parameters: 0
	Flags: Linked
*/
function get_player_equipment()
{
	equipment = level.weaponnone;
	if(isdefined(self.current_equipment))
	{
		equipment = self.current_equipment;
	}
	return equipment;
}

/*
	Name: hacker_active
	Namespace: zm_equipment
	Checksum: 0xE5A6DD38
	Offset: 0x3290
	Size: 0x32
	Parameters: 0
	Flags: Linked
*/
function hacker_active()
{
	return self is_active(getweapon(#"equip_hacker"));
}

/*
	Name: set_player_equipment
	Namespace: zm_equipment
	Checksum: 0xD3FFD3FF
	Offset: 0x32D0
	Size: 0x92
	Parameters: 1
	Flags: Linked
*/
function set_player_equipment(weapon)
{
	if(!isdefined(self.current_equipment_active))
	{
		self.current_equipment_active = [];
	}
	if(isdefined(weapon))
	{
		self.current_equipment_active[weapon] = 0;
	}
	if(!isdefined(self.equipment_got_in_round))
	{
		self.equipment_got_in_round = [];
	}
	if(isdefined(weapon))
	{
		self.equipment_got_in_round[weapon] = level.round_number;
	}
	self notify(#"new_equipment", weapon);
	self.current_equipment = weapon;
}

/*
	Name: init_player_equipment
	Namespace: zm_equipment
	Checksum: 0xFE11E7DB
	Offset: 0x3370
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function init_player_equipment()
{
	self set_player_equipment(level.zombie_equipment_player_init);
}

/*
	Name: function_7d948481
	Namespace: zm_equipment
	Checksum: 0xFAF28E23
	Offset: 0x33A0
	Size: 0xFA
	Parameters: 4
	Flags: None
*/
function function_7d948481(n_boss, var_5765a72a, var_d5866834, n_basic)
{
	if(!isdefined(n_boss))
	{
		n_boss = 0.1;
	}
	if(!isdefined(var_5765a72a))
	{
		var_5765a72a = 0.25;
	}
	if(!isdefined(var_d5866834))
	{
		var_d5866834 = 0.5;
	}
	if(!isdefined(n_basic))
	{
		n_basic = 1;
	}
	if(!isdefined(self.var_6f84b820))
	{
		return 1;
	}
	switch(self.var_6f84b820)
	{
		case "boss":
		{
			return n_boss;
		}
		case "elite":
		{
			return var_5765a72a;
		}
		case "special":
		{
			return var_d5866834;
		}
		default:
		{
			return n_basic;
		}
	}
}

/*
	Name: function_739fbb72
	Namespace: zm_equipment
	Checksum: 0x835CB20
	Offset: 0x34A8
	Size: 0x1AA
	Parameters: 5
	Flags: Linked
*/
function function_739fbb72(n_base_damage, var_177ec733, var_b68e56de, var_1ca50bbc, var_3bab801d)
{
	if(!isdefined(var_177ec733))
	{
		var_177ec733 = 1;
	}
	if(!isdefined(var_b68e56de))
	{
		var_b68e56de = 0.15;
	}
	if(!isdefined(var_1ca50bbc))
	{
		var_1ca50bbc = 2;
	}
	if(!isdefined(var_3bab801d))
	{
		var_3bab801d = 7;
	}
	var_b48509f9 = zm_utility::function_e3025ca5();
	if(var_b48509f9 < var_1ca50bbc)
	{
		return n_base_damage;
	}
	var_b663540c = zm_utility::get_round_number();
	var_694e2cee = zm_utility::get_round_number(var_1ca50bbc);
	var_6d65f883 = zm_utility::get_round_number(var_3bab801d);
	var_5d7b4163 = n_base_damage * var_177ec733;
	if(var_1ca50bbc > 1)
	{
		var_b17d02d8 = var_694e2cee - (zm_utility::get_round_number(var_1ca50bbc - 1));
	}
	var_7379fe99 = math::clamp(var_b663540c, var_694e2cee, var_6d65f883) - var_b17d02d8;
	for(i = 0; i < var_7379fe99; i++)
	{
		var_5d7b4163 = var_5d7b4163 + (var_5d7b4163 * var_b68e56de);
	}
	return int(var_5d7b4163);
}

/*
	Name: function_379f6b5d
	Namespace: zm_equipment
	Checksum: 0x7F1F9ACF
	Offset: 0x3660
	Size: 0x12A
	Parameters: 5
	Flags: Linked
*/
function function_379f6b5d(n_base_damage, var_177ec733, var_b68e56de, var_694e2cee, var_6d65f883)
{
	if(!isdefined(var_177ec733))
	{
		var_177ec733 = 1;
	}
	if(!isdefined(var_b68e56de))
	{
		var_b68e56de = 0.15;
	}
	if(!isdefined(var_694e2cee))
	{
		var_694e2cee = 3;
	}
	if(!isdefined(var_6d65f883))
	{
		var_6d65f883 = 34;
	}
	if(level.round_number < var_694e2cee)
	{
		return n_base_damage;
	}
	var_5d7b4163 = n_base_damage * var_177ec733;
	var_b17d02d8 = 0;
	if(var_694e2cee > 1)
	{
		var_b17d02d8 = var_694e2cee - 1;
	}
	var_7379fe99 = math::clamp(level.round_number, var_694e2cee, var_6d65f883) - var_b17d02d8;
	for(i = 0; i < var_7379fe99; i++)
	{
		var_5d7b4163 = var_5d7b4163 + (var_5d7b4163 * var_b68e56de);
	}
	return int(var_5d7b4163);
}

/*
	Name: function_e418901e
	Namespace: zm_equipment
	Checksum: 0xF41A9BC
	Offset: 0x3798
	Size: 0x1DE
	Parameters: 0
	Flags: None
*/
function function_e418901e()
{
	/#
		setdvar(#"give_equipment", "");
		waitframe(1);
		level flag::wait_till("");
		waitframe(1);
		str_cmd = ("" + "") + "";
		adddebugcommand(str_cmd);
		while(true)
		{
			equipment_id = getdvarstring(#"give_equipment");
			if(equipment_id != "")
			{
				foreach(player in getplayers())
				{
					if(equipment_id == "")
					{
						player take();
						continue;
					}
					if(is_included(equipment_id))
					{
						player buy(equipment_id);
					}
				}
				setdvar(#"give_equipment", "");
			}
			waitframe(1);
		}
	#/
}

/*
	Name: function_1d34b98d
	Namespace: zm_equipment
	Checksum: 0x69A98DA2
	Offset: 0x3980
	Size: 0xA4
	Parameters: 1
	Flags: None
*/
function function_1d34b98d(equipment)
{
	/#
		waitframe(1);
		level flag::wait_till("");
		waitframe(1);
		if(isdefined(equipment))
		{
			equipment_id = function_a16a090d(equipment);
			str_cmd = ((("" + equipment_id) + "") + equipment_id) + "";
			adddebugcommand(str_cmd);
		}
	#/
}

