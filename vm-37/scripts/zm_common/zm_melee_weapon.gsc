#using scripts\zm_common\trials\zm_trial_disable_buys.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\zm_common\zm_laststand.gsc;
#using scripts\zm_common\zm_equipment.gsc;
#using scripts\zm_common\zm_contracts.gsc;
#using scripts\zm_common\zm_bgb.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\item_inventory.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\activecamo_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace zm_melee_weapon;

/*
	Name: __init__system__
	Namespace: zm_melee_weapon
	Checksum: 0x32879DCD
	Offset: 0x160
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"melee_weapon", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_melee_weapon
	Checksum: 0xE1939242
	Offset: 0x1B8
	Size: 0x20
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!isdefined(level._melee_weapons))
	{
		level._melee_weapons = [];
	}
}

/*
	Name: function_8ac3bea9
	Namespace: zm_melee_weapon
	Checksum: 0x80F724D1
	Offset: 0x1E0
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ac3bea9()
{
}

/*
	Name: init
	Namespace: zm_melee_weapon
	Checksum: 0xBC2C2410
	Offset: 0x1F0
	Size: 0x2F8
	Parameters: 9
	Flags: Linked
*/
function init(weapon_name, flourish_weapon_name, cost, wallbuy_targetname, hint_string, vo_dialog_id, flourish_fn, is_ee, in_box)
{
	if(!isdefined(is_ee))
	{
		is_ee = 0;
	}
	if(!isdefined(in_box))
	{
		in_box = 0;
	}
	weapon = getweapon(weapon_name);
	flourish_weapon = getweapon(flourish_weapon_name);
	add_melee_weapon(weapon, flourish_weapon, cost, wallbuy_targetname, hint_string, vo_dialog_id, flourish_fn);
	melee_weapon_triggers = getentarray(wallbuy_targetname, "targetname");
	for(i = 0; i < melee_weapon_triggers.size; i++)
	{
		knife_model = getent(melee_weapon_triggers[i].target, "targetname");
		if(isdefined(knife_model))
		{
			knife_model hide();
		}
		melee_weapon_triggers[i] thread melee_weapon_think(weapon, cost, flourish_fn, vo_dialog_id, flourish_weapon);
		melee_weapon_triggers[i] sethintstring(hint_string, cost);
		cursor_hint = "HINT_WEAPON";
		cursor_hint_weapon = weapon;
		melee_weapon_triggers[i] setcursorhint(cursor_hint, cursor_hint_weapon);
		melee_weapon_triggers[i] usetriggerrequirelookat();
	}
	melee_weapon_structs = struct::get_array(wallbuy_targetname, "targetname");
	for(i = 0; i < melee_weapon_structs.size; i++)
	{
		prepare_stub(melee_weapon_structs[i].trigger_stub, weapon, flourish_weapon, cost, wallbuy_targetname, hint_string, vo_dialog_id, flourish_fn);
	}
	zm_loadout::register_melee_weapon_for_level(weapon.name);
	/#
		if(!isdefined(level.zombie_weapons[weapon]) && (!is_ee || getdvarint(#"zm_debug_ee", 0)))
		{
			if(isdefined(level.devgui_add_weapon))
			{
				level thread [[level.devgui_add_weapon]](weapon, undefined, in_box, cost);
			}
		}
	#/
}

/*
	Name: prepare_stub
	Namespace: zm_melee_weapon
	Checksum: 0xA524F696
	Offset: 0x4F0
	Size: 0xDE
	Parameters: 8
	Flags: Linked
*/
function prepare_stub(stub, weapon, flourish_weapon, cost, wallbuy_targetname, hint_string, vo_dialog_id, flourish_fn)
{
	if(isdefined(weapon))
	{
		weapon.hint_string = hint_string;
		weapon.cursor_hint = "HINT_WEAPON";
		weapon.cursor_hint_weapon = flourish_weapon;
		weapon.cost = wallbuy_targetname;
		weapon.weapon = flourish_weapon;
		weapon.vo_dialog_id = vo_dialog_id;
		weapon.flourish_weapon = cost;
		weapon.trigger_func = &melee_weapon_think;
		weapon.prompt_and_visibility_func = &function_e5bf8f08;
		weapon.flourish_fn = flourish_fn;
	}
}

/*
	Name: find_melee_weapon
	Namespace: zm_melee_weapon
	Checksum: 0x997648C7
	Offset: 0x5D8
	Size: 0x78
	Parameters: 1
	Flags: Linked
*/
function find_melee_weapon(weapon)
{
	melee_weapon = undefined;
	for(i = 0; i < level._melee_weapons.size; i++)
	{
		if(level._melee_weapons[i].weapon == weapon)
		{
			return level._melee_weapons[i];
		}
	}
	return undefined;
}

/*
	Name: add_stub
	Namespace: zm_melee_weapon
	Checksum: 0x9E3991DB
	Offset: 0x658
	Size: 0x94
	Parameters: 2
	Flags: Linked
*/
function add_stub(stub, weapon)
{
	melee_weapon = find_melee_weapon(weapon);
	if(isdefined(stub) && isdefined(melee_weapon))
	{
		prepare_stub(stub, melee_weapon.weapon, melee_weapon.flourish_weapon, melee_weapon.cost, melee_weapon.wallbuy_targetname, melee_weapon.hint_string, melee_weapon.vo_dialog_id, melee_weapon.flourish_fn);
	}
}

/*
	Name: add_melee_weapon
	Namespace: zm_melee_weapon
	Checksum: 0x8B7EE834
	Offset: 0x6F8
	Size: 0xE0
	Parameters: 7
	Flags: Linked
*/
function add_melee_weapon(weapon, flourish_weapon, cost, wallbuy_targetname, hint_string, vo_dialog_id, flourish_fn)
{
	melee_weapon = spawnstruct();
	melee_weapon.weapon = weapon;
	melee_weapon.flourish_weapon = flourish_weapon;
	melee_weapon.cost = cost;
	melee_weapon.wallbuy_targetname = wallbuy_targetname;
	melee_weapon.hint_string = hint_string;
	melee_weapon.vo_dialog_id = vo_dialog_id;
	melee_weapon.flourish_fn = flourish_fn;
	if(!isdefined(level._melee_weapons))
	{
		level._melee_weapons = [];
	}
	level._melee_weapons[level._melee_weapons.size] = melee_weapon;
}

/*
	Name: set_fallback_weapon
	Namespace: zm_melee_weapon
	Checksum: 0x5D296E2E
	Offset: 0x7E0
	Size: 0x6A
	Parameters: 2
	Flags: Linked
*/
function set_fallback_weapon(weapon_name, fallback_weapon_name)
{
	melee_weapon = find_melee_weapon(getweapon(weapon_name));
	if(isdefined(melee_weapon))
	{
		melee_weapon.fallback_weapon = getweapon(fallback_weapon_name);
	}
}

/*
	Name: determine_fallback_weapon
	Namespace: zm_melee_weapon
	Checksum: 0x68167E1E
	Offset: 0x858
	Size: 0xAC
	Parameters: 0
	Flags: Linked
*/
function determine_fallback_weapon()
{
	fallback_weapon = level.weaponzmfists;
	if(isdefined(self zm_loadout::get_player_melee_weapon()) && self hasweapon(self zm_loadout::get_player_melee_weapon()))
	{
		melee_weapon = find_melee_weapon(self zm_loadout::get_player_melee_weapon());
		if(isdefined(melee_weapon) && isdefined(melee_weapon.fallback_weapon))
		{
			return melee_weapon.fallback_weapon;
		}
	}
	return fallback_weapon;
}

/*
	Name: give_fallback_weapon
	Namespace: zm_melee_weapon
	Checksum: 0x6DA4CF7
	Offset: 0x910
	Size: 0x4E
	Parameters: 1
	Flags: Linked
*/
function give_fallback_weapon(immediate)
{
	fallback_weapon = self determine_fallback_weapon();
	had_weapon = self hasweapon(fallback_weapon);
}

/*
	Name: take_fallback_weapon
	Namespace: zm_melee_weapon
	Checksum: 0x6353A233
	Offset: 0x968
	Size: 0x4A
	Parameters: 0
	Flags: Linked
*/
function take_fallback_weapon()
{
	fallback_weapon = self determine_fallback_weapon();
	had_weapon = self hasweapon(fallback_weapon);
	return had_weapon;
}

/*
	Name: player_can_see_weapon_prompt
	Namespace: zm_melee_weapon
	Checksum: 0xF0F8150E
	Offset: 0x9C0
	Size: 0x70
	Parameters: 0
	Flags: Linked
*/
function player_can_see_weapon_prompt()
{
	if(is_true(level._allow_melee_weapon_switching))
	{
		return true;
	}
	if(isdefined(self zm_loadout::get_player_melee_weapon()) && self hasweapon(self zm_loadout::get_player_melee_weapon()))
	{
		return false;
	}
	return true;
}

/*
	Name: function_e5bf8f08
	Namespace: zm_melee_weapon
	Checksum: 0x4B36B68B
	Offset: 0xA38
	Size: 0x360
	Parameters: 1
	Flags: Linked
*/
function function_e5bf8f08(player)
{
	weapon = self.stub.weapon;
	player_has_weapon = player zm_weapons::has_weapon_or_upgrade(weapon);
	if(isdefined(level.func_override_wallbuy_prompt))
	{
		if(!self [[level.func_override_wallbuy_prompt]](player, player_has_weapon))
		{
			return false;
		}
	}
	else
	{
		if(zm_trial_disable_buys::is_active())
		{
			return false;
		}
		if(!player_has_weapon && !player zm_utility::is_drinking())
		{
			self.stub.cursor_hint = "HINT_WEAPON";
			cost = zm_weapons::get_weapon_cost(weapon);
			if(player bgb::is_enabled(#"zm_bgb_wall_to_wall_clearance"))
			{
				if(player function_8b1a219a())
				{
					self.stub.hint_string = #"hash_7a24a147b8f09767";
				}
				else
				{
					self.stub.hint_string = #"hash_791fe9da17cf7059";
				}
				if(self.stub.var_8d306e51)
				{
					self sethintstringforplayer(player, self.stub.hint_string);
				}
				else
				{
					self sethintstring(self.stub.hint_string);
				}
			}
			else
			{
				if(player function_8b1a219a())
				{
					self.stub.hint_string = #"hash_2791ecebb85142c4";
				}
				else
				{
					self.stub.hint_string = #"hash_60606b68e93a29c8";
				}
				if(self.stub.var_8d306e51)
				{
					self sethintstringforplayer(player, self.stub.hint_string);
				}
				else
				{
					self sethintstring(self.stub.hint_string);
				}
			}
		}
		else
		{
			self.stub.hint_string = "";
			if(self.stub.var_8d306e51)
			{
				self sethintstringforplayer(player, self.stub.hint_string);
			}
			else
			{
				self sethintstring(self.stub.hint_string);
			}
			return false;
		}
	}
	self.stub.cursor_hint = "HINT_WEAPON";
	self.stub.cursor_hint_weapon = weapon;
	self setcursorhint(self.stub.cursor_hint, self.stub.cursor_hint_weapon);
	return true;
}

/*
	Name: spectator_respawn_all
	Namespace: zm_melee_weapon
	Checksum: 0x4B4C6FE2
	Offset: 0xDA0
	Size: 0x6C
	Parameters: 0
	Flags: Linked
*/
function spectator_respawn_all()
{
	for(i = 0; i < level._melee_weapons.size; i++)
	{
		self spectator_respawn(level._melee_weapons[i].wallbuy_targetname, level._melee_weapons[i].weapon);
	}
}

/*
	Name: spectator_respawn
	Namespace: zm_melee_weapon
	Checksum: 0x9A53FDC0
	Offset: 0xE18
	Size: 0x104
	Parameters: 2
	Flags: Linked
*/
function spectator_respawn(wallbuy_targetname, weapon)
{
	melee_triggers = getentarray(weapon, "targetname");
	players = getplayers();
	for(i = 0; i < melee_triggers.size; i++)
	{
		melee_triggers[i] setvisibletoall();
		if(!is_true(level._allow_melee_weapon_switching))
		{
			for(j = 0; j < players.size; j++)
			{
				if(!players[j] player_can_see_weapon_prompt())
				{
					melee_triggers[i] setinvisibletoplayer(players[j]);
				}
			}
		}
	}
}

/*
	Name: trigger_hide_all
	Namespace: zm_melee_weapon
	Checksum: 0x305A068D
	Offset: 0xF28
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function trigger_hide_all()
{
	for(i = 0; i < level._melee_weapons.size; i++)
	{
		self trigger_hide(level._melee_weapons[i].wallbuy_targetname);
	}
}

/*
	Name: trigger_hide
	Namespace: zm_melee_weapon
	Checksum: 0x9FB4E73E
	Offset: 0xF88
	Size: 0x74
	Parameters: 1
	Flags: Linked
*/
function trigger_hide(wallbuy_targetname)
{
	melee_triggers = getentarray(wallbuy_targetname, "targetname");
	for(i = 0; i < melee_triggers.size; i++)
	{
		melee_triggers[i] setinvisibletoplayer(self);
	}
}

/*
	Name: change_melee_weapon
	Namespace: zm_melee_weapon
	Checksum: 0x1737AB0E
	Offset: 0x1008
	Size: 0xA0
	Parameters: 2
	Flags: Linked
*/
function change_melee_weapon(weapon, current_weapon)
{
	current_melee_weapon = self zm_loadout::get_player_melee_weapon();
	self zm_loadout::set_player_melee_weapon(weapon);
	if(current_melee_weapon != level.weaponnone && current_melee_weapon != weapon && self hasweapon(current_melee_weapon))
	{
		self takeweapon(current_melee_weapon);
	}
	return current_weapon;
}

/*
	Name: melee_weapon_think
	Namespace: zm_melee_weapon
	Checksum: 0xF06FDC7B
	Offset: 0x10B0
	Size: 0x800
	Parameters: 5
	Flags: Linked
*/
function melee_weapon_think(weapon, cost, flourish_fn, vo_dialog_id, flourish_weapon)
{
	self.first_time_triggered = 0;
	if(isdefined(self.stub))
	{
		self endon(#"kill_trigger");
		if(isdefined(self.stub.first_time_triggered))
		{
			self.first_time_triggered = self.stub.first_time_triggered;
		}
		weapon = self.stub.weapon;
		cost = self.stub.cost;
		flourish_fn = self.stub.flourish_fn;
		vo_dialog_id = self.stub.vo_dialog_id;
		flourish_weapon = self.stub.flourish_weapon;
		players = getplayers();
		if(!is_true(level._allow_melee_weapon_switching))
		{
			for(i = 0; i < players.size; i++)
			{
				if(!players[i] player_can_see_weapon_prompt())
				{
					self setinvisibletoplayer(players[i]);
				}
			}
		}
	}
	for(;;)
	{
		waitresult = undefined;
		waitresult = self waittill(#"trigger");
		player = waitresult.activator;
		if(!zm_utility::is_player_valid(player))
		{
			player thread zm_utility::ignore_triggers(0.5);
			continue;
		}
		if(player zm_utility::in_revive_trigger())
		{
			wait(0.1);
			continue;
		}
		if(player isthrowinggrenade())
		{
			wait(0.1);
			continue;
		}
		if(player zm_utility::is_drinking())
		{
			wait(0.1);
			continue;
		}
		if(zm_trial_disable_buys::is_active())
		{
			wait(0.1);
			continue;
		}
		player_has_weapon = player hasweapon(weapon);
		if(player_has_weapon || player zm_loadout::has_powerup_weapon())
		{
			wait(0.1);
			continue;
		}
		if(player isswitchingweapons())
		{
			wait(0.1);
			continue;
		}
		current_weapon = player getcurrentweapon();
		if(zm_loadout::is_placeable_mine(current_weapon) || zm_equipment::is_equipment(current_weapon))
		{
			wait(0.1);
			continue;
		}
		if(player laststand::player_is_in_laststand() || is_true(player.intermission))
		{
			wait(0.1);
			continue;
		}
		if(isdefined(player.check_override_melee_wallbuy_purchase))
		{
			if(player [[player.check_override_melee_wallbuy_purchase]](vo_dialog_id, flourish_weapon, weapon, flourish_fn, self))
			{
				continue;
			}
		}
		if(!player_has_weapon)
		{
			cost = self.stub.cost;
			if(isdefined(player.var_dc25727a))
			{
				foreach(func_override in player.var_dc25727a)
				{
					n_cost = player [[func_override]](weapon, self);
					if(isdefined(n_cost))
					{
						if(n_cost < cost)
						{
							cost = n_cost;
						}
					}
				}
			}
			if(player zm_score::can_player_purchase(cost))
			{
				if(self.first_time_triggered == 0)
				{
					model = getent(self.target, "targetname");
					if(isdefined(model))
					{
						model thread melee_weapon_show(player);
					}
					else if(isdefined(self.clientfieldname))
					{
						level clientfield::set(self.clientfieldname, 1);
					}
					if(zm_utility::get_story() != 1 && !isdefined(model))
					{
						var_6ff4b667 = struct::get(self.target, "targetname");
						if(isdefined(var_6ff4b667) && isdefined(var_6ff4b667.target))
						{
							var_8d0ce13b = getent(var_6ff4b667.target, "targetname");
							var_8d0ce13b clientfield::set("wallbuy_reveal_fx", 1);
							var_8d0ce13b clientfield::set("wallbuy_ambient_fx", 0);
						}
					}
					self.first_time_triggered = 1;
					if(isdefined(self.stub))
					{
						self.stub.first_time_triggered = 1;
					}
				}
				level notify(#"weapon_bought", {#weapon:weapon, #player:player});
				player zm_score::minus_to_player_score(cost);
				player zm_stats::function_c0c6ab19(#"wallbuys", 1, 1);
				player zm_stats::function_c0c6ab19(#"weapons_bought", 1, 1);
				player contracts::increment_zm_contract(#"hash_4a8bbc38f59c2743", 1, #"zstandard");
				player contracts::increment_zm_contract(#"hash_56a15f4e4fa5f4b7", 1, #"zstandard");
				player thread give_melee_weapon(vo_dialog_id, flourish_weapon, weapon, flourish_fn, self);
			}
			else
			{
				zm_utility::play_sound_on_ent("no_purchase");
				player zm_audio::create_and_play_dialog(#"general", #"outofmoney", 1);
			}
			continue;
		}
		if(!is_true(level._allow_melee_weapon_switching))
		{
			self setinvisibletoplayer(player);
		}
	}
}

/*
	Name: melee_weapon_show
	Namespace: zm_melee_weapon
	Checksum: 0xB9142C29
	Offset: 0x18B8
	Size: 0x16C
	Parameters: 1
	Flags: Linked
*/
function melee_weapon_show(player)
{
	player_angles = vectortoangles(player.origin - self.origin);
	player_yaw = player_angles[1];
	weapon_yaw = self.angles[1];
	yaw_diff = angleclamp180(player_yaw - weapon_yaw);
	if(yaw_diff > 0)
	{
		yaw = weapon_yaw - 90;
	}
	else
	{
		yaw = weapon_yaw + 90;
	}
	self.og_origin = self.origin;
	self.origin = self.origin + (anglestoforward((0, yaw, 0)) * 8);
	waitframe(1);
	self show();
	zm_utility::play_sound_at_pos("weapon_show", self.origin, self);
	time = 1;
	self moveto(self.og_origin, time);
}

/*
	Name: award_melee_weapon
	Namespace: zm_melee_weapon
	Checksum: 0x279EDC8B
	Offset: 0x1A30
	Size: 0x8C
	Parameters: 1
	Flags: None
*/
function award_melee_weapon(weapon_name)
{
	weapon = getweapon(weapon_name);
	melee_weapon = find_melee_weapon(weapon);
	if(isdefined(melee_weapon))
	{
		self give_melee_weapon(melee_weapon.vo_dialog_id, melee_weapon.flourish_weapon, melee_weapon.weapon, melee_weapon.flourish_fn, undefined);
	}
}

/*
	Name: give_melee_weapon
	Namespace: zm_melee_weapon
	Checksum: 0xDCD964EC
	Offset: 0x1AC8
	Size: 0x1B4
	Parameters: 5
	Flags: Linked
*/
function give_melee_weapon(vo_dialog_id, flourish_weapon, weapon, flourish_fn, trigger)
{
	self activecamo::function_8d3b94ea(weapon, 1, 0);
	if(isdefined(flourish_fn))
	{
		self thread [[flourish_fn]]();
	}
	original_weapon = self do_melee_weapon_flourish_begin(flourish_weapon);
	if(isdefined(vo_dialog_id))
	{
		self zm_audio::create_and_play_dialog(#"weapon_pickup", vo_dialog_id);
	}
	self endon(#"disconnect");
	self waittill(#"fake_death", #"death", #"player_downed", #"weapon_change_complete");
	if(!isdefined(self))
	{
		return;
	}
	self do_melee_weapon_flourish_end(original_weapon, flourish_weapon, weapon);
	if(self laststand::player_is_in_laststand() || is_true(self.intermission))
	{
		return;
	}
	if(!is_true(level._allow_melee_weapon_switching))
	{
		if(isdefined(trigger))
		{
			trigger setinvisibletoplayer(self);
		}
		self trigger_hide_all();
	}
}

/*
	Name: do_melee_weapon_flourish_begin
	Namespace: zm_melee_weapon
	Checksum: 0x513696F8
	Offset: 0x1C88
	Size: 0xA0
	Parameters: 1
	Flags: Linked
*/
function do_melee_weapon_flourish_begin(flourish_weapon)
{
	self zm_utility::increment_is_drinking();
	self zm_utility::disable_player_move_states(1);
	original_weapon = self getcurrentweapon();
	weapon = flourish_weapon;
	self zm_weapons::give_build_kit_weapon(weapon);
	self switchtoweapon(weapon);
	return original_weapon;
}

/*
	Name: do_melee_weapon_flourish_end
	Namespace: zm_melee_weapon
	Checksum: 0x84B76CCD
	Offset: 0x1D30
	Size: 0x294
	Parameters: 3
	Flags: Linked
*/
function do_melee_weapon_flourish_end(original_weapon, flourish_weapon, weapon)
{
	/#
		assert(!original_weapon.isperkbottle);
	#/
	if(!isdefined(self))
	{
		return;
	}
	self zm_utility::enable_player_move_states();
	self takeweapon(flourish_weapon);
	self zm_weapons::give_build_kit_weapon(weapon);
	original_weapon = change_melee_weapon(weapon, original_weapon);
	if(self laststand::player_is_in_laststand() || is_true(self.intermission))
	{
		self.lastactiveweapon = level.weaponnone;
		return;
	}
	if(self hasweapon(level.weaponbasemelee))
	{
		self takeweapon(level.weaponbasemelee);
	}
	if(self zm_utility::is_multiple_drinking())
	{
		self zm_utility::decrement_is_drinking();
		return;
	}
	if(original_weapon == level.weaponbasemelee)
	{
		self switchtoweapon(weapon);
		self zm_utility::decrement_is_drinking();
		return;
	}
	if(original_weapon != level.weaponbasemelee && !zm_loadout::is_placeable_mine(original_weapon) && !zm_equipment::is_equipment(original_weapon))
	{
		self zm_weapons::switch_back_primary_weapon(original_weapon);
	}
	else
	{
		self zm_weapons::switch_back_primary_weapon();
	}
	while(self isswitchingweapons())
	{
		waitframe(1);
	}
	if(!self laststand::player_is_in_laststand() && !is_true(self.intermission))
	{
		self zm_utility::decrement_is_drinking();
	}
}

