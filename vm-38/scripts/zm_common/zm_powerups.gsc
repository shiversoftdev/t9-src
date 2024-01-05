#using scripts\zm_common\trials\zm_trial_headshots_only.gsc;
#using scripts\zm_common\trials\zm_trial_no_powerups.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_vo.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_net.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\zm_common\zm_customgame.gsc;
#using scripts\zm_common\zm_contracts.gsc;
#using scripts\zm_common\zm_bgb.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\bb.gsc;
#using scripts\zm_common\ai\zm_ai_utility.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\potm_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\demo_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace zm_powerups;

/*
	Name: function_150cc6d5
	Namespace: zm_powerups
	Checksum: 0x25395267
	Offset: 0x558
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_150cc6d5()
{
	level notify(-2122317332);
}

/*
	Name: init
	Namespace: zm_powerups
	Checksum: 0xB4807FC9
	Offset: 0x578
	Size: 0x5CC
	Parameters: 0
	Flags: Linked
*/
function init()
{
	zmsettings = zm_utility::function_10e38d86();
	zombie_utility::set_zombie_var(#"zombie_insta_kill", zmsettings.var_bb2f1a7c, 0, 1);
	zombie_utility::set_zombie_var(#"zombie_drop_item", zmsettings.var_bd48955e, 0);
	zombie_utility::set_zombie_var(#"zombie_timer_offset", zmsettings.var_3238aebf, 0);
	zombie_utility::set_zombie_var(#"zombie_timer_offset_interval", zmsettings.var_c2b35bc5, 0);
	zombie_utility::set_zombie_var(#"zombie_powerup_fire_sale_on", zmsettings.var_ca3c1d57, 0);
	zombie_utility::set_zombie_var(#"zombie_powerup_fire_sale_time", zmsettings.var_efb01ee5, 0);
	zombie_utility::set_zombie_var(#"zombie_powerup_bonfire_sale_on", zmsettings.var_b2f1a4e9, 0);
	zombie_utility::set_zombie_var(#"zombie_powerup_bonfire_sale_time", zmsettings.var_b0874dd1, 0);
	zombie_utility::set_zombie_var(#"zombie_powerup_insta_kill_on", zmsettings.var_1c4757c1, 0, 1);
	zombie_utility::set_zombie_var(#"zombie_powerup_insta_kill_time", zmsettings.var_f02d07a4, 0, 1);
	zombie_utility::set_zombie_var(#"zombie_powerup_double_points_on", zmsettings.var_f9a5cccc, 0, 1);
	zombie_utility::set_zombie_var(#"zombie_powerup_double_points_time", zmsettings.var_282fb094, 0, 1);
	if(zm_custom::function_901b751c(#"zmpowerupsislimitedround"))
	{
		zombie_utility::set_zombie_var(#"zombie_powerup_drop_max_per_round", zm_custom::function_901b751c(#"hash_d46a4e7a41e005c"), 0);
	}
	else
	{
		zombie_utility::set_zombie_var(#"zombie_powerup_drop_max_per_round", zmsettings.var_37f4ff3e, 0);
	}
	zombie_utility::set_zombie_var(#"hash_604cac237ec8cd3", zmsettings.var_d968651d, 0);
	zombie_utility::set_zombie_var(#"hash_8b7fc80184dc451", zmsettings.var_c2746a4a, 0);
	zombie_utility::set_zombie_var(#"hash_604cbc237ec8e86", zmsettings.var_167fdf43, 0);
	zombie_utility::set_zombie_var(#"hash_8b7f980184dbf38", zmsettings.var_a8bb36d8, 0);
	zombie_utility::set_zombie_var(#"hash_604ccc237ec9039", zmsettings.var_20daf3f9, 0);
	zombie_utility::set_zombie_var(#"hash_8b7fa80184dc0eb", zmsettings.var_5fe12525, 0);
	zombie_utility::set_zombie_var(#"hash_604cdc237ec91ec", zmsettings.var_59ffe642, 0);
	zombie_utility::set_zombie_var(#"hash_8b7ff80184dc96a", zmsettings.var_ae3f41e0, 0);
	zombie_utility::set_zombie_var(#"hash_604cec237ec939f", zmsettings.var_4447bad2, 0);
	zombie_utility::set_zombie_var(#"hash_8b80080184dcb1d", zmsettings.var_d9a798b0, 0);
	zombie_utility::set_zombie_var(#"hash_4d2cc817490bcca", zmsettings.var_1a3fd396, 0);
	zombie_utility::set_zombie_var(#"hash_4edd68174a79580", zmsettings.var_1e290818, 0);
	if(!isdefined(level.zombie_powerups))
	{
		level.zombie_powerups = [];
	}
	level._effect[#"powerup_off"] = #"zombie/fx_powerup_off_green_zmb";
	init_powerups();
	if(!level.enable_magic || !zm_custom::function_901b751c(#"zmpowerupsactive"))
	{
		return;
	}
	thread watch_for_drop();
}

/*
	Name: init_powerups
	Namespace: zm_powerups
	Checksum: 0x7012941D
	Offset: 0xB50
	Size: 0x27C
	Parameters: 0
	Flags: Linked
*/
function init_powerups()
{
	level flag::init("zombie_drop_powerups");
	if(is_true(level.enable_magic) && is_true(zm_custom::function_901b751c(#"zmpowerupsactive")))
	{
		level flag::set("zombie_drop_powerups");
	}
	if(!isdefined(level.active_powerups))
	{
		level.active_powerups = [];
	}
	add_zombie_powerup("insta_kill_ug", "zombie_skull", #"hash_1784640b956f2f85", &func_should_never_drop, 1, 0, 0, undefined, "powerup_instant_kill_ug", "zombie_powerup_insta_kill_ug_time", "zombie_powerup_insta_kill_ug_on", 1);
	if(isdefined(level.level_specific_init_powerups))
	{
		[[level.level_specific_init_powerups]]();
	}
	randomize_powerups();
	level.zombie_powerup_index = 0;
	randomize_powerups();
	level.rare_powerups_active = 0;
	level.zm_genesis_robot_pay_towardsreactswordstart = randomintrange(zombie_utility::function_d2dfacfd(#"hash_4d2cc817490bcca"), zombie_utility::function_d2dfacfd(#"hash_4edd68174a79580"));
	level.firesale_vox_firstime = 0;
	level thread powerup_hud_monitor();
	clientfield::register("scriptmover", "powerup_fx", 1, 3, "int");
	clientfield::register("scriptmover", "powerup_intro_fx", 1, 3, "int");
	clientfield::register("scriptmover", "powerup_grabbed_fx", 1, 3, "int");
}

/*
	Name: set_weapon_ignore_max_ammo
	Namespace: zm_powerups
	Checksum: 0x62B85CD3
	Offset: 0xDD8
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function set_weapon_ignore_max_ammo(weapon)
{
	if(!isdefined(level.zombie_weapons_no_max_ammo))
	{
		level.zombie_weapons_no_max_ammo = [];
	}
	level.zombie_weapons_no_max_ammo[weapon] = 1;
}

/*
	Name: powerup_hud_monitor
	Namespace: zm_powerups
	Checksum: 0xF64C89D
	Offset: 0xE20
	Size: 0x600
	Parameters: 0
	Flags: Linked
*/
function powerup_hud_monitor()
{
	level endon(#"end_game");
	level flag::wait_till("start_zombie_round_logic");
	if(is_true(level.var_64e71357))
	{
		return;
	}
	flashing_timers = [];
	flashing_values = [];
	flashing_timer = 10;
	flashing_delta_time = 0;
	flashing_is_on = 0;
	flashing_value = 3;
	flashing_min_timer = 0.15;
	while(flashing_timer >= flashing_min_timer)
	{
		if(flashing_timer < 5)
		{
			flashing_delta_time = 0.1;
		}
		else
		{
			flashing_delta_time = 0.2;
		}
		if(flashing_is_on)
		{
			flashing_timer = (flashing_timer - flashing_delta_time) - 0.05;
			flashing_value = 2;
		}
		else
		{
			flashing_timer = flashing_timer - flashing_delta_time;
			flashing_value = 3;
		}
		flashing_timers[flashing_timers.size] = flashing_timer;
		flashing_values[flashing_values.size] = flashing_value;
		flashing_is_on = !flashing_is_on;
	}
	client_fields = [];
	powerup_keys = getarraykeys(level.zombie_powerups);
	for(powerup_key_index = 0; powerup_key_index < powerup_keys.size; powerup_key_index++)
	{
		if(isdefined(level.zombie_powerups[powerup_keys[powerup_key_index]].client_field_name))
		{
			powerup_name = powerup_keys[powerup_key_index];
			client_fields[powerup_name] = spawnstruct();
			client_fields[powerup_name].client_field_name = level.zombie_powerups[powerup_name].client_field_name;
			client_fields[powerup_name].var_b79536ad = level.zombie_powerups[powerup_name].var_b79536ad;
			client_fields[powerup_name].only_affects_grabber = level.zombie_powerups[powerup_name].only_affects_grabber;
			client_fields[powerup_name].time_name = level.zombie_powerups[powerup_name].time_name;
			client_fields[powerup_name].on_name = level.zombie_powerups[powerup_name].on_name;
		}
	}
	client_field_keys = getarraykeys(client_fields);
	while(true)
	{
		waittillframeend();
		players = getplayers();
		active_powerup = 0;
		for(playerindex = 0; playerindex < players.size; playerindex++)
		{
			player = players[playerindex];
			if(!isplayer(player))
			{
				continue;
			}
			/#
				if(isbot(player))
				{
					continue;
				}
			#/
			if(player.team === #"spectator")
			{
				continue;
			}
			if(isdefined(level.powerup_player_valid))
			{
				if(![[level.powerup_player_valid]](player))
				{
					continue;
				}
			}
			for(client_field_key_index = 0; client_field_key_index < client_field_keys.size; client_field_key_index++)
			{
				client_field_name = client_fields[client_field_keys[client_field_key_index]].client_field_name;
				var_b79536ad = client_fields[client_field_keys[client_field_key_index]].var_b79536ad;
				time_name = client_fields[client_field_keys[client_field_key_index]].time_name;
				on_name = client_fields[client_field_keys[client_field_key_index]].on_name;
				powerup_timer = undefined;
				powerup_on = undefined;
				if(client_fields[client_field_keys[client_field_key_index]].only_affects_grabber && isdefined(player zombie_utility::function_73061b82(time_name)) && isdefined(player zombie_utility::function_73061b82(on_name)))
				{
					powerup_timer = player.zombie_vars[time_name];
					powerup_on = player.zombie_vars[on_name];
				}
				else
				{
					if(isdefined(zombie_utility::function_6403cf83(time_name, player.team)))
					{
						powerup_timer = zombie_utility::function_6403cf83(time_name, player.team);
						powerup_on = zombie_utility::function_6403cf83(on_name, player.team);
					}
					else if(isdefined(zombie_utility::function_d2dfacfd(time_name)))
					{
						powerup_timer = zombie_utility::function_d2dfacfd(time_name);
						powerup_on = zombie_utility::function_d2dfacfd(on_name);
					}
				}
				if(isdefined(powerup_timer) && isdefined(powerup_on))
				{
					active_powerup = active_powerup | powerup_on;
					player set_clientfield_powerups(client_field_name, var_b79536ad, powerup_timer, powerup_on, flashing_timers, flashing_values);
					continue;
				}
				player clientfield::set_player_uimodel(client_field_name, 0);
			}
			waitframe(1);
		}
		if(!active_powerup)
		{
			level waittill(#"hash_7a941ba8e576862e");
		}
	}
}

/*
	Name: set_clientfield_powerups
	Namespace: zm_powerups
	Checksum: 0x27CF35B7
	Offset: 0x1428
	Size: 0x16C
	Parameters: 6
	Flags: Linked
*/
function set_clientfield_powerups(clientfield_name, var_b79536ad, powerup_timer, powerup_on, &flashing_timers, &flashing_values)
{
	if(powerup_on && !is_true(self.var_9414a188))
	{
		self clientfield::set_player_uimodel(var_b79536ad, int(ceil(powerup_timer)));
		if(powerup_timer < 10)
		{
			flashing_value = 3;
			for(i = flashing_timers.size - 1; i > 0; i--)
			{
				if(powerup_timer < flashing_timers[i])
				{
					flashing_value = flashing_values[i];
					break;
				}
			}
			self clientfield::set_player_uimodel(clientfield_name, flashing_value);
		}
		else
		{
			self clientfield::set_player_uimodel(clientfield_name, 1);
		}
	}
	else
	{
		self clientfield::set_player_uimodel(clientfield_name, 0);
		self clientfield::set_player_uimodel(var_b79536ad, 0);
	}
}

/*
	Name: randomize_powerups
	Namespace: zm_powerups
	Checksum: 0x53C7867C
	Offset: 0x15A0
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function randomize_powerups()
{
	level.zombie_powerup_array = array::randomize(level.zombie_powerup_array);
}

/*
	Name: get_next_powerup
	Namespace: zm_powerups
	Checksum: 0x4DC976C7
	Offset: 0x15D0
	Size: 0x98
	Parameters: 0
	Flags: Linked
*/
function get_next_powerup()
{
	if(isdefined(level.var_ab5b85bf))
	{
		powerup = level.var_ab5b85bf;
		level.var_ab5b85bf = undefined;
	}
	else
	{
		powerup = level.zombie_powerup_array[level.zombie_powerup_index];
		level.zombie_powerup_index++;
		if(level.zombie_powerup_index >= level.zombie_powerup_array.size)
		{
			level.zombie_powerup_index = 0;
			randomize_powerups();
		}
	}
	return powerup;
}

/*
	Name: get_valid_powerup
	Namespace: zm_powerups
	Checksum: 0xE5EE292F
	Offset: 0x1670
	Size: 0x122
	Parameters: 0
	Flags: Linked
*/
function get_valid_powerup()
{
	/#
		if(isdefined(level.zombie_devgui_power) && level.zombie_devgui_power == 1)
		{
			level.zombie_devgui_power = 0;
			return level.zombie_powerup_array[level.zombie_powerup_index];
		}
	#/
	if(isdefined(level.zombie_powerup_boss))
	{
		i = level.zombie_powerup_boss;
		level.zombie_powerup_boss = undefined;
		return level.zombie_powerup_array[i];
	}
	if(isdefined(level.zombie_powerup_ape))
	{
		str_powerup = level.zombie_powerup_ape;
		level.zombie_powerup_ape = undefined;
		return str_powerup;
	}
	while(true)
	{
		str_powerup = get_next_powerup();
		if(isdefined(level.zombie_powerups[str_powerup]) && [[level.zombie_powerups[str_powerup].func_should_drop_with_regular_powerups]]())
		{
			return str_powerup;
		}
	}
}

/*
	Name: function_70bd1ec9
	Namespace: zm_powerups
	Checksum: 0x2B8EBADC
	Offset: 0x17A0
	Size: 0xC4
	Parameters: 0
	Flags: Linked
*/
function function_70bd1ec9()
{
	if(!level.zombie_powerups.size)
	{
		return false;
	}
	foreach(str_powerup in level.zombie_powerup_array)
	{
		if(isdefined(level.zombie_powerups[str_powerup]) && [[level.zombie_powerups[str_powerup].func_should_drop_with_regular_powerups]]())
		{
			return true;
		}
	}
	return false;
}

/*
	Name: minigun_no_drop
	Namespace: zm_powerups
	Checksum: 0x8142BC41
	Offset: 0x1870
	Size: 0xDA
	Parameters: 0
	Flags: None
*/
function minigun_no_drop()
{
	players = getplayers();
	for(i = 0; i < players.size; i++)
	{
		if(players[i].zombie_vars[#"zombie_powerup_minigun_on"] == 1)
		{
			return true;
		}
	}
	if(!level flag::get("power_on"))
	{
		if(level flag::get("solo_game"))
		{
			if(!isdefined(level.solo_lives_given) || level.solo_lives_given == 0)
			{
				return true;
			}
		}
		else
		{
			return true;
		}
	}
	return false;
}

/*
	Name: watch_for_drop
	Namespace: zm_powerups
	Checksum: 0x21A21400
	Offset: 0x1958
	Size: 0x168
	Parameters: 0
	Flags: Linked
*/
function watch_for_drop()
{
	level endon(#"end_game");
	level flag::wait_till("start_zombie_round_logic");
	if(!zm_utility::is_survival() && !zm_utility::function_c200446c())
	{
		level flag::wait_till("begin_spawning");
	}
	waitframe(1);
	level.var_1dce56cc = function_2ff352cc();
	if(!isdefined(level.n_total_kills))
	{
		level.n_total_kills = 0;
	}
	while(true)
	{
		level flag::wait_till("zombie_drop_powerups");
		if(level.n_total_kills >= level.var_1dce56cc)
		{
			level function_a7a5570e();
			level.var_1dce56cc = level.n_total_kills + function_2ff352cc();
			zombie_utility::set_zombie_var(#"zombie_drop_item", 1);
		}
		wait(0.5);
	}
}

/*
	Name: function_2ff352cc
	Namespace: zm_powerups
	Checksum: 0xB13D8D7D
	Offset: 0x1AC8
	Size: 0x180
	Parameters: 0
	Flags: Linked
*/
function function_2ff352cc()
{
	a_e_players = getplayers();
	if(!isdefined(a_e_players) || !a_e_players.size)
	{
		n_players = 1;
	}
	else
	{
		n_players = a_e_players.size;
	}
	n_kill_count = function_21a3a673(zombie_utility::function_d2dfacfd(#"hash_434b3261c607850" + n_players), zombie_utility::function_d2dfacfd(#"zombie_powerup_drop_max_" + n_players));
	if(zm_custom::function_901b751c(#"zmpowerupfrequency") == 0)
	{
		n_kill_count = n_kill_count * 2;
	}
	else if(zm_custom::function_901b751c(#"zmpowerupfrequency") == 2)
	{
		n_kill_count = floor(n_kill_count / 2);
	}
	if(zm_trial_no_powerups::is_active())
	{
		n_kill_count = n_kill_count / zm_trial_no_powerups::function_2fc5f13();
	}
	if(n_kill_count < 1)
	{
		n_kill_count = 1;
	}
	return n_kill_count;
}

/*
	Name: function_a7a5570e
	Namespace: zm_powerups
	Checksum: 0x163DBCD9
	Offset: 0x1C50
	Size: 0x13C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_a7a5570e()
{
	for(i = 1; i <= 4; i++)
	{
		zombie_utility::set_zombie_var(#"hash_434b3261c607850" + i, int(min(990, (zombie_utility::function_d2dfacfd(#"hash_434b3261c607850" + i)) + 1)));
		zombie_utility::set_zombie_var(#"zombie_powerup_drop_max_" + i, int(min(999, (zombie_utility::function_d2dfacfd(#"zombie_powerup_drop_max_" + i)) + 1)));
	}
}

/*
	Name: zombie_can_drop_powerups
	Namespace: zm_powerups
	Checksum: 0x5EEE01FE
	Offset: 0x1D98
	Size: 0x242
	Parameters: 1
	Flags: Linked
*/
function zombie_can_drop_powerups(weapon)
{
	if(zm_trial_no_powerups::is_active() && isdefined(weapon) && (is_true(weapon.isriotshield) || is_true(weapon.isheroweapon)))
	{
		return true;
	}
	if(zm_loadout::is_tactical_grenade(weapon) || !level flag::get("zombie_drop_powerups"))
	{
		return false;
	}
	if(is_true(level.no_powerups) || is_true(self.no_powerups) || (isdefined(weapon) && is_true(weapon.isheroweapon)))
	{
		return false;
	}
	if(is_true(level.use_powerup_volumes))
	{
		volumes = getentarray("no_powerups", "targetname");
		foreach(volume in volumes)
		{
			if(self istouching(volume))
			{
				return false;
			}
		}
	}
	if(!zm_utility::is_survival() && !zm_utility::function_c200446c() && !self zm_utility::is_point_inside_enabled_zone(self.origin))
	{
		return false;
	}
	return true;
}

/*
	Name: function_b753385f
	Namespace: zm_powerups
	Checksum: 0x6758AA6E
	Offset: 0x1FE8
	Size: 0x24C
	Parameters: 1
	Flags: Linked
*/
function function_b753385f(weapon)
{
	var_385d71c3 = 0;
	if(zombie_utility::function_d2dfacfd(#"zombie_drop_item"))
	{
		var_385d71c3 = 1;
		var_4e31704a = 1;
	}
	else if(isdefined(weapon) && weaponhasattachment(weapon, "suppressed") && math::cointoss(1))
	{
		var_385d71c3 = 1;
		var_4e31704a = 0;
	}
	if(var_385d71c3 && self zombie_can_drop_powerups(weapon))
	{
		if(is_true(self.in_the_ground))
		{
			trace = bullettrace(self.origin + vectorscale((0, 0, 1), 100), self.origin + (vectorscale((0, 0, -1), 100)), 0, undefined);
		}
		else
		{
			trace = groundtrace(self.origin + vectorscale((0, 0, 1), 5), self.origin + (vectorscale((0, 0, -1), 300)), 0, undefined);
		}
		origin = trace[#"position"];
		hit_ent = trace[#"entity"];
		var_d13d4980 = undefined;
		if(isdefined(hit_ent) && hit_ent ismovingplatform())
		{
			var_d13d4980 = spawn("script_model", origin + vectorscale((0, 0, 1), 40));
			var_d13d4980 linkto(hit_ent);
		}
		level thread powerup_drop(origin, var_d13d4980, var_4e31704a);
	}
}

/*
	Name: get_random_powerup_name
	Namespace: zm_powerups
	Checksum: 0x31819573
	Offset: 0x2240
	Size: 0x44
	Parameters: 0
	Flags: None
*/
function get_random_powerup_name()
{
	powerup_keys = getarraykeys(level.zombie_powerups);
	powerup_keys = array::randomize(powerup_keys);
	return powerup_keys[0];
}

/*
	Name: get_regular_random_powerup_name
	Namespace: zm_powerups
	Checksum: 0x7CF62D77
	Offset: 0x2290
	Size: 0x8C
	Parameters: 0
	Flags: None
*/
function get_regular_random_powerup_name()
{
	powerup_keys = getarraykeys(level.zombie_powerups);
	powerup_keys = array::randomize(powerup_keys);
	for(i = 0; i < powerup_keys.size; i++)
	{
		if([[level.zombie_powerups[powerup_keys[i]].func_should_drop_with_regular_powerups]]())
		{
			return powerup_keys[i];
		}
	}
	return powerup_keys[0];
}

/*
	Name: function_cc33adc8
	Namespace: zm_powerups
	Checksum: 0x598EA386
	Offset: 0x2328
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function function_cc33adc8()
{
	return util::get_game_type() != "zcleansed";
}

/*
	Name: add_zombie_powerup
	Namespace: zm_powerups
	Checksum: 0x769932C8
	Offset: 0x2350
	Size: 0x56C
	Parameters: 13
	Flags: Linked
*/
function add_zombie_powerup(powerup_name, model_name, hint, func_should_drop_with_regular_powerups, only_affects_grabber, any_team, zombie_grabbable, fx, client_field_name, time_name, on_name, clientfield_version, player_specific)
{
	if(!isdefined(clientfield_version))
	{
		clientfield_version = 1;
	}
	if(!isdefined(player_specific))
	{
		player_specific = 0;
	}
	if(isdefined(level.zombie_include_powerups) && !is_true(level.zombie_include_powerups[powerup_name]))
	{
		return;
	}
	switch(powerup_name)
	{
		case "small_ammo":
		{
			var_f530d747 = "";
			break;
		}
		case "full_ammo":
		{
			var_f530d747 = "zmPowerupMaxAmmo";
			break;
		}
		case "fire_sale":
		{
			var_f530d747 = "zmPowerupFireSale";
			break;
		}
		case "bonus_points_player_shared":
		case "bonus_points_player":
		case "bonus_points_team":
		{
			var_f530d747 = "zmPowerupChaosPoints";
			break;
		}
		case "free_perk":
		{
			var_f530d747 = "zmPowerupFreePerk";
			break;
		}
		case "nuke":
		{
			var_f530d747 = "zmPowerupNuke";
			break;
		}
		case "hero_weapon_power":
		{
			var_f530d747 = "zmPowerupSpecialWeapon";
			break;
		}
		case "insta_kill":
		{
			var_f530d747 = "zmPowerupInstakill";
			break;
		}
		case "double_points":
		{
			var_f530d747 = "zmPowerupDouble";
			break;
		}
		case "carpenter":
		{
			var_f530d747 = "zmPowerupCarpenter";
			break;
		}
		case "shield_charge":
		{
			var_f530d747 = "";
			break;
		}
		default:
		{
			var_f530d747 = "";
		}
	}
	if(var_f530d747 != "" && !is_true(zm_custom::function_901b751c(var_f530d747)))
	{
		return;
	}
	if(!isdefined(level.zombie_powerup_array))
	{
		level.zombie_powerup_array = [];
	}
	else if(!isarray(level.zombie_powerup_array))
	{
		level.zombie_powerup_array = array(level.zombie_powerup_array);
	}
	struct = spawnstruct();
	struct.powerup_name = powerup_name;
	struct.model_name = model_name;
	struct.weapon_classname = "script_model";
	struct.hint = hint;
	struct.func_should_drop_with_regular_powerups = func_should_drop_with_regular_powerups;
	struct.only_affects_grabber = only_affects_grabber;
	struct.any_team = any_team;
	struct.zombie_grabbable = zombie_grabbable;
	struct.var_33c87f51 = function_129f6487(powerup_name);
	struct.player_specific = player_specific;
	struct.can_pick_up_in_last_stand = 1;
	if(isdefined(fx))
	{
		struct.fx = fx;
	}
	level.zombie_powerups[powerup_name] = struct;
	if(!isdefined(level.zombie_powerup_array))
	{
		level.zombie_powerup_array = [];
	}
	else if(!isarray(level.zombie_powerup_array))
	{
		level.zombie_powerup_array = array(level.zombie_powerup_array);
	}
	level.zombie_powerup_array[level.zombie_powerup_array.size] = powerup_name;
	add_zombie_special_drop(powerup_name);
	if(isdefined(client_field_name))
	{
		var_4e6e65fa = ("hudItems.zmPowerUps." + client_field_name) + ".state";
		var_d75767cb = ("hudItems.zmPowerUps." + client_field_name) + ".timeRemaining";
		clientfield::register_clientuimodel(var_4e6e65fa, clientfield_version, 2, "int");
		clientfield::register_clientuimodel(var_d75767cb, clientfield_version, 8, "int");
		struct.client_field_name = var_4e6e65fa;
		struct.var_b79536ad = var_d75767cb;
		struct.time_name = time_name;
		struct.on_name = on_name;
	}
	if(isdefined(powerup_name) && powerup_name == #"full_ammo")
	{
		level.var_aebef29d = gettime() / 1000;
	}
}

/*
	Name: powerup_set_can_pick_up_in_last_stand
	Namespace: zm_powerups
	Checksum: 0xF62E90BE
	Offset: 0x28C8
	Size: 0x2E
	Parameters: 2
	Flags: None
*/
function powerup_set_can_pick_up_in_last_stand(powerup_name, b_can_pick_up)
{
	level.zombie_powerups[powerup_name].can_pick_up_in_last_stand = b_can_pick_up;
}

/*
	Name: powerup_set_prevent_pick_up_if_drinking
	Namespace: zm_powerups
	Checksum: 0x46E59441
	Offset: 0x2900
	Size: 0x2E
	Parameters: 2
	Flags: None
*/
function powerup_set_prevent_pick_up_if_drinking(powerup_name, b_prevent_pick_up)
{
	level._custom_powerups[powerup_name].prevent_pick_up_if_drinking = b_prevent_pick_up;
}

/*
	Name: powerup_set_player_specific
	Namespace: zm_powerups
	Checksum: 0x76109DC3
	Offset: 0x2938
	Size: 0x3E
	Parameters: 2
	Flags: None
*/
function powerup_set_player_specific(powerup_name, b_player_specific)
{
	if(!isdefined(b_player_specific))
	{
		b_player_specific = 1;
	}
	level.zombie_powerups[powerup_name].player_specific = b_player_specific;
}

/*
	Name: powerup_set_statless_powerup
	Namespace: zm_powerups
	Checksum: 0xC0A674BA
	Offset: 0x2980
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function powerup_set_statless_powerup(powerup_name)
{
	if(!isdefined(level.zombie_statless_powerups))
	{
		level.zombie_statless_powerups = [];
	}
	level.zombie_statless_powerups[powerup_name] = 1;
}

/*
	Name: add_zombie_special_drop
	Namespace: zm_powerups
	Checksum: 0xA64C2F30
	Offset: 0x29C8
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function add_zombie_special_drop(powerup_name)
{
	if(!isdefined(level.zombie_special_drop_array))
	{
		level.zombie_special_drop_array = [];
	}
	level.zombie_special_drop_array[level.zombie_special_drop_array.size] = powerup_name;
}

/*
	Name: include_zombie_powerup
	Namespace: zm_powerups
	Checksum: 0xB2FD6CFC
	Offset: 0x2A18
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function include_zombie_powerup(powerup_name)
{
	if(!isdefined(level.zombie_include_powerups))
	{
		level.zombie_include_powerups = [];
	}
	level.zombie_include_powerups[powerup_name] = 1;
}

/*
	Name: powerup_remove_from_regular_drops
	Namespace: zm_powerups
	Checksum: 0xEA6396D6
	Offset: 0x2A60
	Size: 0x5A
	Parameters: 1
	Flags: Linked
*/
function powerup_remove_from_regular_drops(powerup_name)
{
	if(!isdefined(level.zombie_powerups) || !isdefined(level.zombie_powerups[powerup_name]))
	{
		return;
	}
	level.zombie_powerups[powerup_name].func_should_drop_with_regular_powerups = &func_should_never_drop;
}

/*
	Name: function_74b8ec6b
	Namespace: zm_powerups
	Checksum: 0xC77DA9F4
	Offset: 0x2AC8
	Size: 0xAA
	Parameters: 1
	Flags: None
*/
function function_74b8ec6b(powerup_name)
{
	if(!isdefined(level.zombie_powerups) || !isdefined(level.zombie_powerups[powerup_name]) || isdefined(level.zombie_powerups[powerup_name].var_d92b8001))
	{
		return;
	}
	level.zombie_powerups[powerup_name].var_d92b8001 = level.zombie_powerups[powerup_name].func_should_drop_with_regular_powerups;
	level.zombie_powerups[powerup_name].func_should_drop_with_regular_powerups = &func_should_never_drop;
}

/*
	Name: function_41cedb05
	Namespace: zm_powerups
	Checksum: 0x4D41B051
	Offset: 0x2B80
	Size: 0x9A
	Parameters: 1
	Flags: None
*/
function function_41cedb05(powerup_name)
{
	if(!isdefined(level.zombie_powerups) || !isdefined(level.zombie_powerups[powerup_name]) || !isdefined(level.zombie_powerups[powerup_name].var_d92b8001))
	{
		return;
	}
	level.zombie_powerups[powerup_name].func_should_drop_with_regular_powerups = level.zombie_powerups[powerup_name].var_d92b8001;
	level.zombie_powerups[powerup_name].var_d92b8001 = undefined;
}

/*
	Name: powerup_round_start
	Namespace: zm_powerups
	Checksum: 0x32425488
	Offset: 0x2C28
	Size: 0x10
	Parameters: 0
	Flags: Linked
*/
function powerup_round_start()
{
	level.powerup_drop_count = 0;
}

/*
	Name: function_5326bd06
	Namespace: zm_powerups
	Checksum: 0xCBC69C
	Offset: 0x2C40
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function function_5326bd06(e_powerup)
{
	if(isdefined(e_powerup))
	{
		e_powerup delete();
	}
}

/*
	Name: powerup_drop
	Namespace: zm_powerups
	Checksum: 0x97A65DAE
	Offset: 0x2C78
	Size: 0x480
	Parameters: 4
	Flags: Linked
*/
function powerup_drop(drop_point, powerup, var_4e31704a, var_efbe1684)
{
	if(!isdefined(var_efbe1684))
	{
		var_efbe1684 = 1;
	}
	if(zm_custom::function_e1f04ede())
	{
		function_5326bd06(var_4e31704a);
		return;
	}
	if(isdefined(level.custom_zombie_powerup_drop))
	{
		b_outcome = [[level.custom_zombie_powerup_drop]](powerup);
		if(is_true(b_outcome))
		{
			return;
		}
	}
	if(!zm_utility::is_survival() && !zm_utility::function_c200446c() && level.powerup_drop_count >= zombie_utility::function_d2dfacfd(#"zombie_powerup_drop_max_per_round"))
	{
		/#
			println("");
		#/
		function_5326bd06(var_4e31704a);
		return;
	}
	zombie_utility::set_zombie_var(#"zombie_drop_item", 0);
	level.powerup_drop_count++;
	if(!isdefined(var_4e31704a))
	{
		var_4e31704a = zm_net::network_safe_spawn("powerup", 1, "script_model", powerup + vectorscale((0, 0, 1), 40));
	}
	var_4e31704a setmodel(#"tag_origin");
	if(!isdefined(level.zombie_include_powerups) || level.zombie_include_powerups.size == 0 || !function_70bd1ec9())
	{
		function_5326bd06(var_4e31704a);
		level.powerup_drop_count--;
		zombie_utility::set_zombie_var(#"zombie_drop_item", 1);
		return;
	}
	valid_drop = 1;
	if(!zm_utility::is_survival() && !zm_utility::function_c200446c())
	{
		valid_drop = function_37e79fb6(var_4e31704a);
	}
	if(var_efbe1684 && valid_drop && level.rare_powerups_active)
	{
		pos = (powerup[0], powerup[1], powerup[2] + 42);
		if(check_for_rare_drop_override(pos))
		{
			valid_drop = 0;
		}
	}
	if(!valid_drop)
	{
		level.powerup_drop_count--;
		var_4e31704a delete();
		zombie_utility::set_zombie_var(#"zombie_drop_item", 1);
		return;
	}
	var_4e31704a powerup_setup(undefined, undefined, powerup);
	/#
		if(var_efbe1684)
		{
			str_debug = "";
		}
		else
		{
			str_debug = "";
		}
		print_powerup_drop(var_4e31704a.powerup_name, str_debug);
	#/
	bb::logpowerupevent(var_4e31704a, undefined, "_dropped");
	var_4e31704a thread powerup_timeout();
	var_4e31704a thread powerup_wobble();
	var_4e31704a util::delay(0.1, "powerup_timedout", &powerup_grab);
	var_4e31704a thread powerup_emp();
	level notify(#"powerup_dropped", {#powerup:var_4e31704a});
}

/*
	Name: function_37e79fb6
	Namespace: zm_powerups
	Checksum: 0x7787D155
	Offset: 0x3100
	Size: 0x22E
	Parameters: 1
	Flags: Linked
*/
function function_37e79fb6(powerup)
{
	if(zm_utility::function_21f4ac36() && !isdefined(level.var_a2a9b2de))
	{
		level.var_a2a9b2de = getnodearray("player_region", "script_noteworthy");
	}
	if(zm_utility::function_c85ebbbc() && !isdefined(level.playable_area))
	{
		level.playable_area = getentarray("player_volume", "script_noteworthy");
	}
	if(zm_ai_utility::function_54054394(powerup))
	{
		return false;
	}
	if(isdefined(level.playable_area))
	{
		var_12ed21a1 = function_72d3bca6(level.playable_area, powerup.origin, undefined, undefined, level.var_603981f1);
		foreach(area in var_12ed21a1)
		{
			if(powerup istouching(area))
			{
				return true;
			}
		}
	}
	if(isdefined(level.var_a2a9b2de))
	{
		if(isdefined(level.var_61afcb81))
		{
			node = function_52c1730(powerup.origin, level.var_a2a9b2de, level.var_61afcb81);
		}
		else
		{
			node = function_52c1730(powerup.origin, level.var_a2a9b2de, 500);
		}
		if(isdefined(node))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_27437dae
	Namespace: zm_powerups
	Checksum: 0xA4A39E74
	Offset: 0x3338
	Size: 0x244
	Parameters: 0
	Flags: Linked
*/
function function_27437dae()
{
	self endon(#"death", #"powerup_timedout", #"powerup_grabbed");
	if(!zm_utility::function_21f4ac36() || !isdefined(level.var_a2a9b2de))
	{
		return;
	}
	wait(1);
	var_1a7af6f3 = arraysortclosest(level.var_a2a9b2de, self.origin);
	foreach(var_30d9be5a in var_1a7af6f3)
	{
		if(zm_zonemgr::zone_is_enabled(var_30d9be5a.targetname))
		{
			nd_closest = var_30d9be5a;
			break;
		}
	}
	if(!isdefined(nd_closest))
	{
		return;
	}
	var_f55f0704 = nd_closest.origin + vectorscale((0, 0, 1), 40);
	var_8a69f8c0 = distancesquared(var_f55f0704, self.origin);
	n_travel_time = mapfloat(100, 250000, 0.1, 3, var_8a69f8c0);
	if(n_travel_time <= (0.25 * 2))
	{
		n_accel = 0;
	}
	else
	{
		n_accel = 0.25;
	}
	self moveto(var_f55f0704, n_travel_time, n_accel, n_accel);
}

/*
	Name: specific_powerup_drop
	Namespace: zm_powerups
	Checksum: 0xF918846E
	Offset: 0x3588
	Size: 0x4DA
	Parameters: 10
	Flags: Linked
*/
function specific_powerup_drop(var_5a63971, powerup_location, powerup_team, pickup_delay, powerup_player, b_stay_forever, var_6f4cb533, var_a6d11a96, var_73b4ca3f, var_45eaa114)
{
	if(!isdefined(pickup_delay))
	{
		pickup_delay = 0.1;
	}
	if(!isdefined(var_6f4cb533))
	{
		var_6f4cb533 = 0;
	}
	if(!isdefined(var_73b4ca3f))
	{
		var_73b4ca3f = 1;
	}
	if(!var_6f4cb533 && zm_custom::function_e1f04ede() || !zm_custom::function_901b751c(#"zmpowerupsactive"))
	{
		return;
	}
	if(isactor(self) && !level flag::get("zombie_drop_powerups"))
	{
		return;
	}
	if(isarray(var_5a63971))
	{
		var_5a63971 = array::random(var_5a63971);
	}
	switch(var_5a63971)
	{
		case "full_ammo":
		{
			var_f530d747 = "zmPowerupMaxAmmo";
			break;
		}
		case "fire_sale":
		{
			var_f530d747 = "zmPowerupFireSale";
			break;
		}
		case "bonus_points_player_shared":
		case "bonus_points_player":
		case "bonus_points_team":
		{
			var_f530d747 = "zmPowerupChaosPoints";
			break;
		}
		case "free_perk":
		{
			var_f530d747 = "zmPowerupFreePerk";
			break;
		}
		case "nuke":
		{
			var_f530d747 = "zmPowerupNuke";
			break;
		}
		case "hero_weapon_power":
		{
			var_f530d747 = "zmPowerupSpecialWeapon";
			break;
		}
		case "insta_kill":
		{
			var_f530d747 = "zmPowerupInstakill";
			break;
		}
		case "double_points":
		{
			var_f530d747 = "zmPowerupDouble";
			break;
		}
		case "carpenter":
		{
			var_f530d747 = "zmPowerupCarpenter";
			break;
		}
		default:
		{
			var_f530d747 = "";
		}
	}
	if(var_f530d747 != "" && !is_true(zm_custom::function_901b751c(var_f530d747)))
	{
		return;
	}
	if(!var_73b4ca3f && isdefined(level.zombie_powerups[var_5a63971]))
	{
		if(![[level.zombie_powerups[var_5a63971].func_should_drop_with_regular_powerups]]())
		{
			return;
		}
	}
	s_trace = physicstrace(powerup_location + vectorscale((0, 0, 1), 10), powerup_location + (vectorscale((0, 0, -1), 100)), (0, 0, 0), (0, 0, 0), undefined, 2 | 16);
	hit_ent = s_trace[#"entity"];
	if(isdefined(hit_ent) && hit_ent ismovingplatform())
	{
		powerup = spawn("script_model", powerup_location + vectorscale((0, 0, 1), 40));
		powerup linkto(hit_ent);
	}
	else
	{
		powerup = zm_net::network_safe_spawn("powerup", 1, "script_model", powerup_location + vectorscale((0, 0, 1), 40));
	}
	powerup setmodel(#"tag_origin");
	powerup_location = powerup.origin;
	level notify(#"powerup_dropped", {#powerup:powerup});
	return powerup_init(powerup, var_5a63971, powerup_team, powerup_location, pickup_delay, powerup_player, b_stay_forever, var_a6d11a96, var_45eaa114);
}

/*
	Name: powerup_init
	Namespace: zm_powerups
	Checksum: 0x6B617ADE
	Offset: 0x3A70
	Size: 0x18A
	Parameters: 9
	Flags: Linked
*/
function powerup_init(powerup, str_powerup, powerup_team, powerup_location, pickup_delay, powerup_player, b_stay_forever, var_a6d11a96, var_45eaa114)
{
	if(!isdefined(pickup_delay))
	{
		pickup_delay = 0.1;
	}
	if(isdefined(powerup))
	{
		powerup powerup_setup(str_powerup, powerup_team, powerup_location, powerup_player, undefined, var_a6d11a96);
		if(is_true(var_45eaa114) && !function_37e79fb6(powerup))
		{
			powerup thread function_27437dae();
		}
		if(!is_true(b_stay_forever))
		{
			powerup thread powerup_timeout();
		}
		powerup thread powerup_wobble();
		if(isdefined(pickup_delay) && pickup_delay < 0.1)
		{
			pickup_delay = 0.1;
		}
		powerup util::delay(pickup_delay, "powerup_timedout", &powerup_grab, powerup_team);
		powerup thread powerup_emp();
		return powerup;
	}
}

/*
	Name: function_14b7208c
	Namespace: zm_powerups
	Checksum: 0xE99082BD
	Offset: 0x3C08
	Size: 0x174
	Parameters: 4
	Flags: Linked
*/
function function_14b7208c(str_powerup, powerup_team, powerup_location, powerup_player)
{
	var_ce95e926 = 60;
	var_f9f778c1 = 120;
	var_d2057007 = 6;
	if(powerup_player === "nuke")
	{
		name = string(randomint(2147483647));
		origin = self.origin;
		badplace_cylinder(name, 0, origin, var_ce95e926, var_f9f778c1, #"allies");
		while(isdefined(self))
		{
			if(distance2dsquared(origin, self.origin) > sqr(var_d2057007))
			{
				origin = self.origin;
				badplace_cylinder(name, 0, origin, var_ce95e926, var_f9f778c1, #"allies");
			}
			wait(1);
		}
		badplace_delete(name);
	}
}

/*
	Name: powerup_setup
	Namespace: zm_powerups
	Checksum: 0x39E94D53
	Offset: 0x3D88
	Size: 0x484
	Parameters: 6
	Flags: Linked
*/
function powerup_setup(powerup_override, powerup_team, powerup_location, powerup_player, shouldplaysound, var_a6d11a96)
{
	powerup = undefined;
	if(!isdefined(powerup_team))
	{
		powerup = get_valid_powerup();
	}
	else
	{
		powerup = powerup_team;
		if("tesla" == powerup && tesla_powerup_active())
		{
			powerup = "minigun";
		}
	}
	struct = level.zombie_powerups[powerup];
	if(isdefined(powerup_location))
	{
		self.powerup_team = powerup_location;
	}
	if(isdefined(powerup_player))
	{
		self.powerup_location = powerup_player;
	}
	if(isdefined(shouldplaysound))
	{
		self.powerup_player = shouldplaysound;
	}
	else
	{
		/#
			assert(!is_true(struct.player_specific), "");
		#/
	}
	self.powerup_name = struct.powerup_name;
	self.hint = struct.hint;
	self.client_field_name = struct.client_field_name;
	self.only_affects_grabber = struct.only_affects_grabber;
	self.any_team = struct.any_team;
	self.zombie_grabbable = struct.zombie_grabbable;
	self.func_should_drop_with_regular_powerups = struct.func_should_drop_with_regular_powerups;
	if(isdefined(level._custom_powerups) && isdefined(level._custom_powerups[powerup]) && isdefined(level._custom_powerups[powerup].setup_powerup))
	{
		self [[level._custom_powerups[powerup].setup_powerup]]();
	}
	else
	{
		self function_76678c8d(powerup_player, struct, var_a6d11a96);
	}
	if(powerup == "full_ammo")
	{
		level.zm_genesis_robot_pay_towardsreactswordstart = randomintrange(zombie_utility::function_d2dfacfd(#"hash_4d2cc817490bcca"), zombie_utility::function_d2dfacfd(#"hash_4edd68174a79580"));
	}
	else if(!isdefined(powerup_team))
	{
		level.zm_genesis_robot_pay_towardsreactswordstart--;
	}
	demo::bookmark(#"zm_powerup_dropped", gettime(), undefined, undefined, 1);
	potm::bookmark(#"zm_powerup_dropped", gettime(), undefined, undefined, 1);
	if(isdefined(struct.fx))
	{
		self.fx = struct.fx;
	}
	if(isdefined(struct.can_pick_up_in_last_stand))
	{
		self.can_pick_up_in_last_stand = struct.can_pick_up_in_last_stand;
	}
	var_b9dc5e9 = (isdefined(struct.var_184f74ef) ? struct.var_184f74ef : 0);
	if(!var_b9dc5e9)
	{
		if(isdefined(level.var_bec5bf67))
		{
			var_b9dc5e9 = self [[level.var_bec5bf67]](self.powerup_name);
		}
	}
	if(!is_true(var_b9dc5e9))
	{
		if(isdefined(struct.var_6029fea3))
		{
			self playsound(struct.var_6029fea3.var_64ae47e);
			self playloopsound(struct.var_6029fea3.var_9c464736);
		}
		else
		{
			self playsound(#"hash_52de50e5184d1c7");
			self playloopsound(#"hash_601ae32339098104");
		}
	}
	level.active_powerups[level.active_powerups.size] = self;
	self thread function_14b7208c(powerup, powerup_location, powerup_player, shouldplaysound);
}

/*
	Name: powerup_zombie_grab_trigger_cleanup
	Namespace: zm_powerups
	Checksum: 0x9EEC01C3
	Offset: 0x4218
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function powerup_zombie_grab_trigger_cleanup(trigger)
{
	self waittill(#"powerup_timedout", #"powerup_grabbed", #"hacked");
	trigger delete();
}

/*
	Name: powerup_zombie_grab
	Namespace: zm_powerups
	Checksum: 0x9084069A
	Offset: 0x4278
	Size: 0x392
	Parameters: 1
	Flags: Linked
*/
function powerup_zombie_grab(powerup_team)
{
	self endon(#"powerup_timedout", #"powerup_grabbed", #"hacked");
	zombie_grab_trigger = spawn("trigger_radius", self.origin - vectorscale((0, 0, 1), 40), (512 | 1) + 8, 32, 72);
	zombie_grab_trigger enablelinkto();
	zombie_grab_trigger linkto(self);
	zombie_grab_trigger setteamfortrigger(level.zombie_team);
	self thread powerup_zombie_grab_trigger_cleanup(zombie_grab_trigger);
	poi_dist = 300;
	if(isdefined(level._zombie_grabbable_poi_distance_override))
	{
		poi_dist = level._zombie_grabbable_poi_distance_override;
	}
	zombie_grab_trigger zm_utility::create_zombie_point_of_interest(poi_dist, 2, 0, 1, undefined, undefined, powerup_team);
	while(isdefined(self))
	{
		waitresult = undefined;
		waitresult = zombie_grab_trigger waittill(#"trigger");
		who = waitresult.activator;
		if(isdefined(level._powerup_grab_check))
		{
			if(!self [[level._powerup_grab_check]](who))
			{
				continue;
			}
		}
		else if(!isdefined(who) || !isai(who))
		{
			continue;
		}
		self clientfield::set("powerup_grabbed_fx", 3);
		self stoploopsound();
		if(isdefined(level._custom_powerups) && isdefined(level._custom_powerups[self.powerup_name]) && isdefined(level._custom_powerups[self.powerup_name].grab_powerup))
		{
			b_continue = self [[level._custom_powerups[self.powerup_name].grab_powerup]](who);
			if(is_true(b_continue))
			{
				continue;
			}
		}
		else
		{
			if(isdefined(level._zombiemode_powerup_zombie_grab))
			{
				level thread [[level._zombiemode_powerup_zombie_grab]](self);
			}
			if(isdefined(level._game_mode_powerup_zombie_grab))
			{
				level thread [[level._game_mode_powerup_zombie_grab]](self, who);
			}
			else
			{
				/#
					println("");
				#/
			}
		}
		level thread zm_vo::function_8abe0568(self.powerup_name);
		wait(0.1);
		self thread powerup_delete_delayed();
		self notify(#"powerup_grabbed", {#e_grabber:who});
	}
}

/*
	Name: powerup_grab
	Namespace: zm_powerups
	Checksum: 0xDAE71C1
	Offset: 0x4618
	Size: 0xB64
	Parameters: 1
	Flags: Linked
*/
function powerup_grab(powerup_team)
{
	if(isdefined(self) && self.zombie_grabbable)
	{
		self thread powerup_zombie_grab(powerup_team);
		return;
	}
	self endon(#"powerup_timedout", #"powerup_grabbed");
	if(isdefined(self.var_5c6f6051))
	{
		range_squared = sqr(self.var_5c6f6051);
	}
	else
	{
		range_squared = 4096;
	}
	while(isdefined(self))
	{
		if(isdefined(self.powerup_player))
		{
			grabbers = [];
			grabbers[0] = self.powerup_player;
		}
		else
		{
			if(isdefined(level.powerup_grab_get_players_override))
			{
				grabbers = [[level.powerup_grab_get_players_override]]();
			}
			else
			{
				grabbers = getplayers();
			}
		}
		for(i = 0; i < grabbers.size; i++)
		{
			grabber = grabbers[i];
			if(isalive(grabber.owner) && isplayer(grabber.owner))
			{
				player = grabber.owner;
			}
			else if(isplayer(grabber))
			{
				player = grabber;
			}
			if(!isdefined(self))
			{
				break;
			}
			if(self.only_affects_grabber && !isdefined(player))
			{
				continue;
			}
			if(player zm_utility::is_drinking() && isdefined(level._custom_powerups) && isdefined(level._custom_powerups[self.powerup_name]) && is_true(level._custom_powerups[self.powerup_name].prevent_pick_up_if_drinking))
			{
				continue;
			}
			if(self.powerup_name == "minigun" || self.powerup_name == "tesla" || self.powerup_name == "random_weapon" || self.powerup_name == "meat_stink" && (!isplayer(grabber) || player laststand::player_is_in_laststand() || (player usebuttonpressed() && player zm_utility::in_revive_trigger()) || player bgb::is_enabled(#"zm_bgb_disorderly_combat")))
			{
				continue;
			}
			if(!is_true(self.can_pick_up_in_last_stand) && player laststand::player_is_in_laststand())
			{
				continue;
			}
			ignore_range = 0;
			if(grabber.ignore_range_powerup === self)
			{
				grabber.ignore_range_powerup = undefined;
				ignore_range = 1;
			}
			if(isalive(grabber) && (distancesquared(grabber.origin, self.origin) < range_squared || ignore_range))
			{
				if(isdefined(level._powerup_grab_check))
				{
					if(!self [[level._powerup_grab_check]](player))
					{
						continue;
					}
				}
				if(zm_trial_no_powerups::is_active())
				{
					var_57807cdc = [];
					array::add(var_57807cdc, player, 0);
					zm_trial::fail(#"hash_2619fd380423798b", var_57807cdc);
					self thread powerup_delete_delayed();
					self notify(#"powerup_grabbed", {#e_grabber:player});
					return;
				}
				if(isdefined(level._custom_powerups) && isdefined(level._custom_powerups[self.powerup_name]) && isdefined(level._custom_powerups[self.powerup_name].grab_powerup))
				{
					b_continue = self [[level._custom_powerups[self.powerup_name].grab_powerup]](player);
					if(is_true(b_continue))
					{
						continue;
					}
				}
				else
				{
					switch(self.powerup_name)
					{
						case "teller_withdrawl":
						{
							level thread teller_withdrawl(self, player);
							break;
						}
						default:
						{
							if(isdefined(level._zombiemode_powerup_grab))
							{
								level thread [[level._zombiemode_powerup_grab]](self, player);
							}
							else
							{
								/#
									println("");
								#/
							}
							break;
						}
					}
				}
				demo::bookmark(#"zm_player_powerup_grabbed", gettime(), player);
				potm::bookmark(#"zm_player_powerup_grabbed", gettime(), player);
				bb::logpowerupevent(self, player, "_grabbed");
				if(isdefined(self.var_33c87f51))
				{
					player recordmapevent(23, gettime(), grabber.origin, level.round_number, self.var_33c87f51);
				}
				if(should_award_stat(self.powerup_name) && isplayer(player))
				{
					player zm_stats::increment_client_stat("drops");
					player zm_stats::increment_player_stat("drops");
					player zm_stats::function_8f10788e("boas_drops");
					player zm_stats::increment_client_stat(self.powerup_name + "_pickedup");
					player zm_stats::increment_player_stat(self.powerup_name + "_pickedup");
					player zm_stats::increment_challenge_stat(#"survivalist_powerup");
					player zm_stats::function_8f10788e(("boas_" + self.powerup_name) + "_pickedup");
					player contracts::increment_zm_contract(#"hash_456b19c561097c1b");
					if(zm_utility::is_standard())
					{
						player zm_stats::increment_challenge_stat(#"hash_35ab7dfe675d26e9");
						player zm_stats::function_c0c6ab19(#"rush_powerups");
					}
				}
				if(isdefined(level.var_50b95271))
				{
					self thread [[level.var_50b95271]]();
				}
				else
				{
					var_f79dc259 = self function_d5b6ce91();
					self clientfield::set("powerup_grabbed_fx", var_f79dc259);
				}
				if(is_true(self.stolen))
				{
					level notify(#"monkey_see_monkey_dont_achieved");
				}
				if(isdefined(self.grabbed_level_notify))
				{
					level notify(self.grabbed_level_notify);
				}
				var_3a786e29 = level.zombie_powerups[self.powerup_name];
				if(isdefined(var_3a786e29.var_6029fea3))
				{
					player playsound(var_3a786e29.var_6029fea3.var_721ec012);
				}
				else
				{
					b_ignore = 0;
					if(isdefined(level.var_bec5bf67))
					{
						b_ignore = self [[level.var_bec5bf67]](self.powerup_name);
					}
					if(!b_ignore)
					{
						player playsound(#"hash_9dbd105c3060c91");
					}
				}
				self.claimed = 1;
				self.power_up_grab_player = player;
				wait(0.1);
				if(!isdefined(self))
				{
					break;
				}
				self stoploopsound();
				self hide();
				if(self.powerup_name != "fire_sale")
				{
					if(isdefined(self.power_up_grab_player))
					{
						if(isdefined(level.powerup_intro_vox))
						{
							level thread [[level.powerup_intro_vox]](self);
							return;
						}
						if(isdefined(level.powerup_vo_available))
						{
							can_say_vo = [[level.powerup_vo_available]]();
							if(!can_say_vo)
							{
								self thread powerup_delete_delayed();
								self notify(#"powerup_grabbed", {#e_grabber:player});
								return;
							}
						}
					}
				}
				if(is_true(self.only_affects_grabber))
				{
					player thread zm_vo::function_8abe0568(self.powerup_name);
				}
				else
				{
					level thread zm_vo::function_8abe0568(self.powerup_name);
				}
				self thread powerup_delete_delayed();
				self notify(#"powerup_grabbed", {#e_grabber:player});
			}
		}
		wait(0.1);
	}
}

/*
	Name: function_c1963295
	Namespace: zm_powerups
	Checksum: 0x71DF3A82
	Offset: 0x5188
	Size: 0x112
	Parameters: 2
	Flags: Linked
*/
function function_c1963295(var_4c20edd5, var_a6d11a96)
{
	e_player = zm_utility::get_closest_player(var_4c20edd5);
	if(is_true(level.var_ec45f213) || is_true(var_a6d11a96))
	{
		return 0.1;
	}
	if(!isdefined(e_player))
	{
		return 1.5;
	}
	n_distance = distance(e_player.origin, var_4c20edd5);
	if(n_distance > 128)
	{
		return 0.1;
	}
	if(n_distance < 8)
	{
		return 1.5;
	}
	n_delay = mapfloat(8, 128, 1.5, 0, n_distance);
	return n_delay;
}

/*
	Name: function_76678c8d
	Namespace: zm_powerups
	Checksum: 0x49D536F
	Offset: 0x52A8
	Size: 0xDC
	Parameters: 3
	Flags: Linked
*/
function function_76678c8d(var_41c62074, s_powerup, var_a6d11a96)
{
	self endon(#"powerup_grabbed");
	if(isdefined(level.powerup_intro_fx_func))
	{
		self thread [[level.powerup_intro_fx_func]]();
	}
	else
	{
		var_f79dc259 = self function_d5b6ce91();
		self clientfield::set("powerup_intro_fx", var_f79dc259);
	}
	var_e886efeb = function_c1963295(var_41c62074, var_a6d11a96);
	wait(var_e886efeb);
	self setmodel(s_powerup.model_name);
}

/*
	Name: get_closest_window_repair
	Namespace: zm_powerups
	Checksum: 0x3DC928A0
	Offset: 0x5390
	Size: 0x10A
	Parameters: 2
	Flags: None
*/
function get_closest_window_repair(windows, origin)
{
	current_window = undefined;
	shortest_distance = undefined;
	for(i = 0; i < windows.size; i++)
	{
		if(zm_utility::all_chunks_intact(windows, windows[i].barrier_chunks))
		{
			continue;
		}
		if(!isdefined(current_window))
		{
			current_window = windows[i];
			shortest_distance = distancesquared(current_window.origin, origin);
			continue;
		}
		if(distancesquared(windows[i].origin, origin) < shortest_distance)
		{
			current_window = windows[i];
			shortest_distance = distancesquared(windows[i].origin, origin);
		}
	}
	return current_window;
}

/*
	Name: powerup_vo
	Namespace: zm_powerups
	Checksum: 0xEFA79DD
	Offset: 0x54A8
	Size: 0x10C
	Parameters: 1
	Flags: Linked
*/
function powerup_vo(type)
{
	self endon(#"disconnect");
	if(!isplayer(self))
	{
		return;
	}
	if(isdefined(level.powerup_vo_available))
	{
		if(![[level.powerup_vo_available]]())
		{
			return;
		}
	}
	if(type == "tesla")
	{
		wait(randomfloatrange(3.5, 4.5));
		self zm_audio::create_and_play_dialog(#"weapon_pickup", type);
	}
	else
	{
		wait(0.5);
		self zm_audio::create_and_play_dialog(#"powerup", type, undefined, 2);
	}
	if(isdefined(level.custom_powerup_vo_response))
	{
		level [[level.custom_powerup_vo_response]](self, type);
	}
}

/*
	Name: function_f0eb47d8
	Namespace: zm_powerups
	Checksum: 0xF0CF4ED6
	Offset: 0x55C0
	Size: 0x52
	Parameters: 2
	Flags: None
*/
function function_f0eb47d8(var_f0de9b92, b_disable)
{
	if(!isdefined(b_disable))
	{
		b_disable = 1;
	}
	if(isdefined(level.zombie_powerups[var_f0de9b92]))
	{
		level.zombie_powerups[var_f0de9b92].var_cad40b46 = b_disable;
	}
}

/*
	Name: function_80b4c5e0
	Namespace: zm_powerups
	Checksum: 0x1F99FFA
	Offset: 0x5620
	Size: 0x52
	Parameters: 2
	Flags: None
*/
function function_80b4c5e0(var_f0de9b92, b_disable)
{
	if(!isdefined(b_disable))
	{
		b_disable = 1;
	}
	if(isdefined(level.zombie_powerups[var_f0de9b92]))
	{
		level.zombie_powerups[var_f0de9b92].var_184f74ef = b_disable;
	}
}

/*
	Name: function_59f7f2c6
	Namespace: zm_powerups
	Checksum: 0xED352A7C
	Offset: 0x5680
	Size: 0xFE
	Parameters: 4
	Flags: Linked
*/
function function_59f7f2c6(var_f0de9b92, var_64ae47e, var_9c464736, var_721ec012)
{
	if(!isdefined(var_64ae47e))
	{
		var_64ae47e = #"hash_52de50e5184d1c7";
	}
	if(!isdefined(var_9c464736))
	{
		var_9c464736 = #"hash_601ae32339098104";
	}
	if(!isdefined(var_721ec012))
	{
		var_721ec012 = #"hash_9dbd105c3060c91";
	}
	if(isdefined(level.zombie_powerups[var_f0de9b92]))
	{
		level.zombie_powerups[var_f0de9b92].var_6029fea3 = spawnstruct();
		level.zombie_powerups[var_f0de9b92].var_6029fea3.var_64ae47e = var_64ae47e;
		level.zombie_powerups[var_f0de9b92].var_6029fea3.var_9c464736 = var_9c464736;
		level.zombie_powerups[var_f0de9b92].var_6029fea3.var_721ec012 = var_721ec012;
	}
}

/*
	Name: powerup_wobble_fx
	Namespace: zm_powerups
	Checksum: 0x97F432E7
	Offset: 0x5788
	Size: 0x84
	Parameters: 0
	Flags: Linked
*/
function powerup_wobble_fx()
{
	self endon(#"death");
	if(!isdefined(self))
	{
		return;
	}
	if(isdefined(level.powerup_fx_func))
	{
		self thread [[level.powerup_fx_func]]();
		return;
	}
	var_f79dc259 = self function_d5b6ce91();
	self clientfield::set("powerup_fx", var_f79dc259);
}

/*
	Name: function_d5b6ce91
	Namespace: zm_powerups
	Checksum: 0x167A8B98
	Offset: 0x5818
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function function_d5b6ce91()
{
	if(self.only_affects_grabber)
	{
		return 2;
	}
	if(self.any_team)
	{
		return 4;
	}
	if(self.zombie_grabbable)
	{
		return 3;
	}
	return 1;
}

/*
	Name: powerup_wobble
	Namespace: zm_powerups
	Checksum: 0xC617EC40
	Offset: 0x5868
	Size: 0x1F0
	Parameters: 0
	Flags: Linked
*/
function powerup_wobble()
{
	self endon(#"powerup_grabbed", #"powerup_timedout");
	if(isdefined(level.zombie_powerups[self.powerup_name]) && is_true(level.zombie_powerups[self.powerup_name].var_cad40b46))
	{
		return;
	}
	self thread powerup_wobble_fx();
	while(isdefined(self))
	{
		waittime = randomfloatrange(2.5, 5);
		yaw = randomint(360);
		if(yaw > 300)
		{
			yaw = 300;
		}
		else if(yaw < 60)
		{
			yaw = 60;
		}
		yaw = self.angles[1] + yaw;
		new_angles = (-60 + randomint(120), yaw, -45 + randomint(90));
		self rotateto(new_angles, waittime, waittime * 0.5, waittime * 0.5);
		if(isdefined(self.worldgundw))
		{
			self.worldgundw rotateto(new_angles, waittime, waittime * 0.5, waittime * 0.5);
		}
		wait(randomfloat(waittime - 0.1));
	}
}

/*
	Name: function_e3f30b
	Namespace: zm_powerups
	Checksum: 0xBD6D7F3
	Offset: 0x5A60
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_e3f30b()
{
	if(isdefined(self))
	{
		self ghost();
		if(isdefined(self.worldgundw))
		{
			self.worldgundw ghost();
		}
	}
}

/*
	Name: powerup_show
	Namespace: zm_powerups
	Checksum: 0xC78FC67A
	Offset: 0x5AB8
	Size: 0xD4
	Parameters: 0
	Flags: Linked
*/
function powerup_show()
{
	if(isdefined(self))
	{
		self show();
		if(isdefined(self.worldgundw))
		{
			self.worldgundw show();
		}
		if(isdefined(self.powerup_player))
		{
			self setinvisibletoall();
			self setvisibletoplayer(self.powerup_player);
			if(isdefined(self.worldgundw))
			{
				self.worldgundw setinvisibletoall();
				self.worldgundw setvisibletoplayer(self.powerup_player);
			}
		}
	}
}

/*
	Name: powerup_timeout
	Namespace: zm_powerups
	Checksum: 0xE6B59623
	Offset: 0x5B98
	Size: 0x18C
	Parameters: 0
	Flags: Linked
*/
function powerup_timeout()
{
	if(isdefined(level._powerup_timeout_override) && !isdefined(self.powerup_team))
	{
		self thread [[level._powerup_timeout_override]]();
		return;
	}
	self endon(#"powerup_grabbed", #"death", #"powerup_reset");
	self powerup_show();
	wait_time = 15;
	if(isdefined(level._powerup_timeout_custom_time))
	{
		time = [[level._powerup_timeout_custom_time]](self);
		if(time == 0)
		{
			return;
		}
		wait_time = time;
	}
	if(bgb::is_team_enabled(#"zm_bgb_temporal_gift"))
	{
		wait_time = wait_time + 30;
	}
	wait(wait_time);
	self hide_and_show(&function_e3f30b, &powerup_show);
	self notify(#"powerup_timedout");
	bb::logpowerupevent(self, undefined, "_timedout");
	self powerup_delete();
}

/*
	Name: hide_and_show
	Namespace: zm_powerups
	Checksum: 0x5AAC5EAE
	Offset: 0x5D30
	Size: 0x9C
	Parameters: 2
	Flags: Linked
*/
function hide_and_show(hide_func, show_func)
{
	for(i = 0; i < 40; i++)
	{
		if(i % 2)
		{
			self [[hide_func]]();
		}
		else
		{
			self [[show_func]]();
		}
		if(i < 15)
		{
			wait(0.5);
			continue;
		}
		if(i < 25)
		{
			wait(0.25);
			continue;
		}
		wait(0.1);
	}
}

/*
	Name: powerup_delete
	Namespace: zm_powerups
	Checksum: 0x8666ACF7
	Offset: 0x5DD8
	Size: 0x6C
	Parameters: 0
	Flags: Linked
*/
function powerup_delete()
{
	if(isdefined(self))
	{
		arrayremovevalue(level.active_powerups, self, 0);
		if(isdefined(self.worldgundw))
		{
			self.worldgundw delete();
		}
		self delete();
	}
}

/*
	Name: powerup_delete_delayed
	Namespace: zm_powerups
	Checksum: 0xA0174B59
	Offset: 0x5E50
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function powerup_delete_delayed(time)
{
	if(isdefined(time))
	{
		wait(time);
	}
	else
	{
		wait(0.01);
	}
	self powerup_delete();
}

/*
	Name: function_bcfcc27e
	Namespace: zm_powerups
	Checksum: 0x30579619
	Offset: 0x5E98
	Size: 0xA
	Parameters: 0
	Flags: Linked
*/
function function_bcfcc27e()
{
	return "wpn_t9_zm_perk_can_powerup";
}

/*
	Name: is_insta_kill_active
	Namespace: zm_powerups
	Checksum: 0xEFFBDE53
	Offset: 0x5EB0
	Size: 0xA0
	Parameters: 0
	Flags: Linked
*/
function is_insta_kill_active()
{
	if(is_true(zombie_utility::function_6403cf83(#"zombie_insta_kill", self.team)) || is_true(self zombie_utility::function_73061b82(#"zombie_insta_kill")) || is_true(self.personal_instakill))
	{
		return true;
	}
	return false;
}

/*
	Name: function_a4e210c7
	Namespace: zm_powerups
	Checksum: 0x816BB21C
	Offset: 0x5F58
	Size: 0x80
	Parameters: 0
	Flags: Linked
*/
function function_a4e210c7()
{
	if(is_true(zombie_utility::function_6403cf83(#"zombie_powerup_double_points_on", self.team)) || is_true(self zombie_utility::function_6403cf83(#"zombie_powerup_double_points_on")))
	{
		return true;
	}
	return false;
}

/*
	Name: function_fe6d6eac
	Namespace: zm_powerups
	Checksum: 0x36FB2225
	Offset: 0x5FE0
	Size: 0x340
	Parameters: 5
	Flags: Linked
*/
function function_fe6d6eac(player, mod, hit_location, weapon, damage)
{
	if(!("head" == hit_location || "helmet" == hit_location || "neck" == hit_location) && (is_true(level.headshots_only) || zm_trial_headshots_only::is_active()))
	{
		return damage;
	}
	switch(weapon.statname)
	{
		case "eq_slow_grenade":
		{
			return damage;
		}
	}
	if(isdefined(player) && isalive(player) && isdefined(level.check_for_instakill_override))
	{
		if(!self [[level.check_for_instakill_override]](player))
		{
			return damage;
		}
		if(!is_true(self.no_gib))
		{
			self zombie_utility::zombie_head_gib();
		}
		self.health = 1;
		return self.health + self.maxhealth;
	}
	if(isdefined(player) && isalive(player) && player is_insta_kill_active())
	{
		if(self.var_6f84b820 === #"special")
		{
			damage = damage * 5;
		}
		else
		{
			if(self.var_6f84b820 === #"elite")
			{
				damage = damage * 2.5;
			}
			else if(self.var_6f84b820 === #"boss")
			{
				damage = damage * 2.5;
			}
		}
		if(zm_utility::is_magic_bullet_shield_enabled(self))
		{
			return damage;
		}
		if(isdefined(self.instakill_func))
		{
			b_result = self [[self.instakill_func]](player, mod, hit_location);
			if(is_true(b_result))
			{
				return damage;
			}
		}
		if(!level flag::get("special_round") && !is_true(self.no_gib))
		{
			self zombie_utility::zombie_head_gib();
		}
		if(self.var_6f84b820 === #"normal")
		{
			self.health = 1;
			return self.health + self.maxhealth;
		}
		return damage;
	}
	return damage;
}

/*
	Name: function_16c2586a
	Namespace: zm_powerups
	Checksum: 0x853A921F
	Offset: 0x6328
	Size: 0x20
	Parameters: 3
	Flags: Linked
*/
function function_16c2586a(player, mod, shitloc)
{
	return true;
}

/*
	Name: point_doubler_on_hud
	Namespace: zm_powerups
	Checksum: 0x85EB1600
	Offset: 0x6350
	Size: 0xB4
	Parameters: 2
	Flags: None
*/
function point_doubler_on_hud(drop_item, player_team)
{
	self endon(#"disconnect");
	if(zombie_utility::function_6403cf83(#"zombie_powerup_double_points_on", player_team))
	{
		zombie_utility::function_c7ab6cbc(#"zombie_powerup_double_points_time", player_team, 30);
		return;
	}
	zombie_utility::function_c7ab6cbc(#"zombie_powerup_double_points_on", player_team, 1);
	level thread time_remaining_on_point_doubler_powerup(player_team);
}

/*
	Name: time_remaining_on_point_doubler_powerup
	Namespace: zm_powerups
	Checksum: 0x8E7F764
	Offset: 0x6410
	Size: 0x1B4
	Parameters: 1
	Flags: Linked
*/
function time_remaining_on_point_doubler_powerup(player_team)
{
	temp_ent = spawn("script_origin", (0, 0, 0));
	temp_ent playloopsound(#"zmb_double_point_loop");
	while(zombie_utility::function_6403cf83(#"zombie_powerup_double_points_time", player_team) >= 0)
	{
		waitframe(1);
		zombie_utility::function_c7ab6cbc(#"zombie_powerup_double_points_time", player_team, zombie_utility::function_6403cf83(#"zombie_powerup_double_points_time", player_team) - 0.05);
	}
	zombie_utility::function_c7ab6cbc(#"zombie_powerup_double_points_on", player_team, 0);
	players = getplayers(player_team);
	for(i = 0; i < players.size; i++)
	{
		players[i] playsound(#"zmb_points_loop_off");
	}
	temp_ent stoploopsound(2);
	zombie_utility::function_c7ab6cbc(#"zombie_powerup_double_points_time", player_team, 30);
	temp_ent delete();
}

/*
	Name: devil_dialog_delay
	Namespace: zm_powerups
	Checksum: 0xB9234461
	Offset: 0x65D0
	Size: 0xC
	Parameters: 0
	Flags: None
*/
function devil_dialog_delay()
{
	wait(1);
}

/*
	Name: check_for_rare_drop_override
	Namespace: zm_powerups
	Checksum: 0xF6778579
	Offset: 0x65E8
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function check_for_rare_drop_override(pos)
{
	if(level flag::get(#"ape_round"))
	{
		return false;
	}
	return false;
}

/*
	Name: tesla_powerup_active
	Namespace: zm_powerups
	Checksum: 0xCCF988FF
	Offset: 0x6628
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function tesla_powerup_active()
{
	players = getplayers();
	for(i = 0; i < players.size; i++)
	{
		if(players[i].zombie_vars[#"zombie_powerup_tesla_on"])
		{
			return true;
		}
	}
	return false;
}

/*
	Name: print_powerup_drop
	Namespace: zm_powerups
	Checksum: 0x2E274E28
	Offset: 0x6698
	Size: 0x18C
	Parameters: 2
	Flags: None
*/
function print_powerup_drop(powerup, type)
{
	/#
		if(!isdefined(level.powerup_drop_time))
		{
			level.powerup_drop_time = 0;
			level.powerup_random_count = 0;
			level.var_27b063df = 0;
		}
		time = (gettime() - level.powerup_drop_time) * 0.001;
		level.powerup_drop_time = gettime();
		if(type == "")
		{
			level.powerup_random_count++;
		}
		else
		{
			level.var_27b063df++;
		}
		println("");
		println("" + powerup);
		println("" + type);
		println("");
		println("" + time);
		println("");
		println("" + level.var_27b063df);
		println("");
	#/
}

/*
	Name: register_carpenter_node
	Namespace: zm_powerups
	Checksum: 0x1965F7DA
	Offset: 0x6830
	Size: 0x58
	Parameters: 2
	Flags: None
*/
function register_carpenter_node(node, callback)
{
	if(!isdefined(level._additional_carpenter_nodes))
	{
		level._additional_carpenter_nodes = [];
	}
	node._post_carpenter_callback = callback;
	level._additional_carpenter_nodes[level._additional_carpenter_nodes.size] = node;
}

/*
	Name: func_should_never_drop
	Namespace: zm_powerups
	Checksum: 0xA5B38F31
	Offset: 0x6890
	Size: 0x6
	Parameters: 0
	Flags: Linked
*/
function func_should_never_drop()
{
	return false;
}

/*
	Name: func_should_always_drop
	Namespace: zm_powerups
	Checksum: 0x738176A6
	Offset: 0x68A0
	Size: 0x8
	Parameters: 0
	Flags: Linked
*/
function func_should_always_drop()
{
	return true;
}

/*
	Name: powerup_emp
	Namespace: zm_powerups
	Checksum: 0x20E791B
	Offset: 0x68B0
	Size: 0x102
	Parameters: 0
	Flags: Linked
*/
function powerup_emp()
{
	self endon(#"powerup_timedout", #"powerup_grabbed");
	if(!zm_utility::should_watch_for_emp())
	{
		return;
	}
	while(true)
	{
		waitresult = undefined;
		waitresult = level waittill(#"emp_detonate");
		if(distancesquared(waitresult.position, self.origin) < waitresult.radius * waitresult.radius)
		{
			playfx(level._effect[#"powerup_off"], self.origin);
			self thread powerup_delete_delayed();
			self notify(#"powerup_timedout");
		}
	}
}

/*
	Name: get_powerups
	Namespace: zm_powerups
	Checksum: 0xFCC3CA18
	Offset: 0x69C0
	Size: 0xEA
	Parameters: 2
	Flags: Linked
*/
function get_powerups(origin, radius)
{
	if(isdefined(origin) && isdefined(radius))
	{
		powerups = [];
		foreach(powerup in level.active_powerups)
		{
			if(distancesquared(origin, powerup.origin) < radius * radius)
			{
				powerups[powerups.size] = powerup;
			}
		}
		return powerups;
	}
	return level.active_powerups;
}

/*
	Name: should_award_stat
	Namespace: zm_powerups
	Checksum: 0x29E945FD
	Offset: 0x6AB8
	Size: 0xA6
	Parameters: 1
	Flags: Linked
*/
function should_award_stat(powerup_name)
{
	switch(powerup_name)
	{
		case "blue_monkey":
		case "bonus_points_player_shared":
		case "teller_withdrawl":
		case "small_ammo":
		{
			return false;
		}
	}
	if(isdefined(level.zombie_statless_powerups) && isdefined(level.zombie_statless_powerups[powerup_name]) && level.zombie_statless_powerups[powerup_name])
	{
		return false;
	}
	return true;
}

/*
	Name: teller_withdrawl
	Namespace: zm_powerups
	Checksum: 0xC9F8176B
	Offset: 0x6B68
	Size: 0x34
	Parameters: 2
	Flags: Linked
*/
function teller_withdrawl(powerup, player)
{
	player zm_score::add_to_player_score(powerup.value);
}

/*
	Name: function_cfd04802
	Namespace: zm_powerups
	Checksum: 0xC3F6E19
	Offset: 0x6BA8
	Size: 0x50
	Parameters: 1
	Flags: Linked
*/
function function_cfd04802(str_powerup)
{
	if(isdefined(level.zombie_powerups[str_powerup]) && is_true(level.zombie_powerups[str_powerup].only_affects_grabber))
	{
		return true;
	}
	return false;
}

/*
	Name: function_5091b029
	Namespace: zm_powerups
	Checksum: 0x275A4B5D
	Offset: 0x6C00
	Size: 0x148
	Parameters: 2
	Flags: Linked
*/
function function_5091b029(str_powerup, time)
{
	if(!isdefined(time))
	{
		time = 30;
	}
	self endon(#"disconnect");
	str_index_on = ("zombie_powerup_" + str_powerup) + "_on";
	str_index_time = ("zombie_powerup_" + str_powerup) + "_time";
	self zombie_utility::function_826f5e98(str_index_time, time);
	if(self bgb::is_enabled(#"zm_bgb_temporal_gift"))
	{
		self zombie_utility::function_826f5e98(str_index_time, time * 2);
	}
	if(is_true(self zombie_utility::function_73061b82(str_index_on)))
	{
		return;
	}
	self zombie_utility::function_826f5e98(str_index_on, 1);
	self thread function_de41121d(str_powerup, time);
	level notify(#"hash_7a941ba8e576862e");
}

/*
	Name: function_de41121d
	Namespace: zm_powerups
	Checksum: 0xE73D8030
	Offset: 0x6D50
	Size: 0x15C
	Parameters: 2
	Flags: Linked
*/
function function_de41121d(str_powerup, time)
{
	if(!isdefined(time))
	{
		time = 30;
	}
	self endon(#"disconnect");
	str_index_on = ("zombie_powerup_" + str_powerup) + "_on";
	str_index_time = ("zombie_powerup_" + str_powerup) + "_time";
	str_sound_off = ("zmb_powerup_" + str_powerup) + "_timeout";
	while(zombie_utility::function_73061b82(str_index_time) >= 0)
	{
		waitframe(1);
		self zombie_utility::function_826f5e98(str_index_time, zombie_utility::function_73061b82(str_index_time) - (float(function_60d95f53()) / 1000));
	}
	self zombie_utility::function_826f5e98(str_index_on, 0);
	self playsoundtoplayer(str_sound_off, self);
	zombie_utility::function_826f5e98(str_index_time, time);
}

/*
	Name: show_on_hud
	Namespace: zm_powerups
	Checksum: 0x8BB4F649
	Offset: 0x6EB8
	Size: 0x160
	Parameters: 3
	Flags: Linked
*/
function show_on_hud(player_team, str_powerup, time)
{
	if(!isdefined(time))
	{
		time = 30;
	}
	self endon(#"disconnect");
	str_index_on = ("zombie_powerup_" + str_powerup) + "_on";
	str_index_time = ("zombie_powerup_" + str_powerup) + "_time";
	if(zombie_utility::function_6403cf83(str_index_on, player_team))
	{
		zombie_utility::function_c7ab6cbc(str_index_time, player_team, time);
		if(bgb::is_team_enabled(#"zm_bgb_temporal_gift"))
		{
			zombie_utility::function_c7ab6cbc(str_index_time, player_team, zombie_utility::function_6403cf83(str_index_time, player_team) + time);
		}
		return;
	}
	zombie_utility::function_c7ab6cbc(str_index_on, player_team, 1);
	level thread time_remaining_on_powerup(player_team, str_powerup, time);
	level notify(#"hash_7a941ba8e576862e");
}

/*
	Name: time_remaining_on_powerup
	Namespace: zm_powerups
	Checksum: 0x47B9D040
	Offset: 0x7020
	Size: 0x1CC
	Parameters: 3
	Flags: Linked
*/
function time_remaining_on_powerup(player_team, str_powerup, time)
{
	if(!isdefined(time))
	{
		time = 30;
	}
	str_index_on = ("zombie_powerup_" + str_powerup) + "_on";
	str_index_time = ("zombie_powerup_" + str_powerup) + "_time";
	str_sound_off = ("zmb_powerup_" + str_powerup) + "_timeout";
	if(bgb::is_team_enabled(#"zm_bgb_temporal_gift"))
	{
		zombie_utility::function_c7ab6cbc(str_index_time, player_team, zombie_utility::function_6403cf83(str_index_time, player_team) + time);
	}
	while(zombie_utility::function_6403cf83(str_index_time, player_team) >= 0)
	{
		waitframe(1);
		zombie_utility::function_c7ab6cbc(str_index_time, player_team, zombie_utility::function_6403cf83(str_index_time, player_team) - 0.05);
	}
	zombie_utility::function_c7ab6cbc(str_index_on, player_team, 0);
	e_player = getplayers()[0];
	if(isplayer(e_player))
	{
		e_player playsoundtoteam(str_sound_off, player_team);
	}
	zombie_utility::function_c7ab6cbc(str_index_time, player_team, time);
}

/*
	Name: weapon_powerup
	Namespace: zm_powerups
	Checksum: 0x187A4CF5
	Offset: 0x71F8
	Size: 0x1CC
	Parameters: 4
	Flags: None
*/
function weapon_powerup(ent_player, time, str_weapon, allow_cycling)
{
	if(!isdefined(allow_cycling))
	{
		allow_cycling = 0;
	}
	str_weapon_on = ("zombie_powerup_" + str_weapon) + "_on";
	str_weapon_time_over = str_weapon + "_time_over";
	ent_player notify(#"replace_weapon_powerup");
	ent_player._show_solo_hud = 1;
	ent_player.has_specific_powerup_weapon[str_weapon] = 1;
	ent_player.has_powerup_weapon = 1;
	ent_player zm_utility::increment_is_drinking();
	if(allow_cycling)
	{
		ent_player enableweaponcycling();
	}
	ent_player._zombie_weapon_before_powerup[str_weapon] = ent_player getcurrentweapon();
	ent_player giveweapon(level.zombie_powerup_weapon[str_weapon]);
	ent_player switchtoweapon(level.zombie_powerup_weapon[str_weapon]);
	ent_player.zombie_vars[str_weapon_on] = 1;
	level thread weapon_powerup_countdown(ent_player, str_weapon_time_over, time, str_weapon);
	level thread weapon_powerup_replace(ent_player, str_weapon_time_over, str_weapon);
	level thread weapon_powerup_change(ent_player, str_weapon_time_over, str_weapon);
}

/*
	Name: weapon_powerup_change
	Namespace: zm_powerups
	Checksum: 0x1FDEAFF9
	Offset: 0x73D0
	Size: 0xDC
	Parameters: 3
	Flags: Linked
*/
function weapon_powerup_change(ent_player, str_gun_return_notify, str_weapon)
{
	ent_player endon(#"death", #"player_downed", str_gun_return_notify, #"replace_weapon_powerup");
	while(true)
	{
		waitresult = undefined;
		waitresult = ent_player waittill(#"weapon_change");
		if(waitresult.weapon != level.weaponnone && waitresult.weapon != level.zombie_powerup_weapon[str_weapon])
		{
			break;
		}
	}
	level thread weapon_powerup_remove(ent_player, str_gun_return_notify, str_weapon, 0);
}

/*
	Name: weapon_powerup_countdown
	Namespace: zm_powerups
	Checksum: 0xB9AE3D03
	Offset: 0x74B8
	Size: 0x114
	Parameters: 4
	Flags: Linked
*/
function weapon_powerup_countdown(ent_player, str_gun_return_notify, time, str_weapon)
{
	ent_player endon(#"death", #"player_downed", str_gun_return_notify, #"replace_weapon_powerup");
	str_weapon_time = ("zombie_powerup_" + str_weapon) + "_time";
	ent_player.zombie_vars[str_weapon_time] = time;
	if(bgb::is_team_enabled(#"zm_bgb_temporal_gift"))
	{
		ent_player.zombie_vars[str_weapon_time] = ent_player.zombie_vars[str_weapon_time] + 30;
	}
	[[level._custom_powerups[str_weapon].weapon_countdown]](ent_player, str_weapon_time);
	level thread weapon_powerup_remove(ent_player, str_gun_return_notify, str_weapon, 1);
}

/*
	Name: weapon_powerup_replace
	Namespace: zm_powerups
	Checksum: 0xB9C63DB2
	Offset: 0x75D8
	Size: 0xE4
	Parameters: 3
	Flags: Linked
*/
function weapon_powerup_replace(ent_player, str_gun_return_notify, str_weapon)
{
	ent_player endon(#"death", #"player_downed", str_gun_return_notify);
	str_weapon_on = ("zombie_powerup_" + str_weapon) + "_on";
	ent_player waittill(#"replace_weapon_powerup");
	ent_player takeweapon(level.zombie_powerup_weapon[str_weapon]);
	ent_player.zombie_vars[str_weapon_on] = 0;
	ent_player.has_specific_powerup_weapon[str_weapon] = 0;
	ent_player.has_powerup_weapon = 0;
	ent_player zm_utility::decrement_is_drinking();
}

/*
	Name: weapon_powerup_remove
	Namespace: zm_powerups
	Checksum: 0x7338A2E7
	Offset: 0x76C8
	Size: 0x12C
	Parameters: 4
	Flags: Linked
*/
function weapon_powerup_remove(ent_player, str_gun_return_notify, str_weapon, b_switch_back_weapon)
{
	if(!isdefined(b_switch_back_weapon))
	{
		b_switch_back_weapon = 1;
	}
	ent_player endon(#"death", #"player_downed");
	str_weapon_on = ("zombie_powerup_" + str_weapon) + "_on";
	ent_player takeweapon(level.zombie_powerup_weapon[str_weapon]);
	ent_player.zombie_vars[str_weapon_on] = 0;
	ent_player._show_solo_hud = 0;
	ent_player.has_specific_powerup_weapon[str_weapon] = 0;
	ent_player.has_powerup_weapon = 0;
	ent_player notify(str_gun_return_notify);
	ent_player zm_utility::decrement_is_drinking();
	if(b_switch_back_weapon)
	{
		ent_player zm_weapons::switch_back_primary_weapon(ent_player._zombie_weapon_before_powerup[str_weapon]);
	}
}

/*
	Name: weapon_watch_gunner_downed
	Namespace: zm_powerups
	Checksum: 0x8D6EEC0C
	Offset: 0x7800
	Size: 0x13E
	Parameters: 1
	Flags: None
*/
function weapon_watch_gunner_downed(str_weapon)
{
	str_notify = str_weapon + "_time_over";
	str_weapon_on = ("zombie_powerup_" + str_weapon) + "_on";
	if(!isdefined(self.has_specific_powerup_weapon) || !is_true(self.has_specific_powerup_weapon[str_weapon]))
	{
		return;
	}
	primaryweapons = self getweaponslistprimaries();
	for(i = 0; i < primaryweapons.size; i++)
	{
		if(primaryweapons[i] == level.zombie_powerup_weapon[str_weapon])
		{
			self takeweapon(level.zombie_powerup_weapon[str_weapon]);
		}
	}
	self notify(str_notify);
	self.zombie_vars[str_weapon_on] = 0;
	self._show_solo_hud = 0;
	waitframe(1);
	self.has_specific_powerup_weapon[str_weapon] = 0;
	self.has_powerup_weapon = 0;
}

/*
	Name: register_powerup
	Namespace: zm_powerups
	Checksum: 0xC983DB39
	Offset: 0x7948
	Size: 0xCE
	Parameters: 3
	Flags: Linked
*/
function register_powerup(str_powerup, func_grab_powerup, func_setup)
{
	/#
		assert(isdefined(str_powerup), "");
	#/
	_register_undefined_powerup(str_powerup);
	if(isdefined(func_grab_powerup))
	{
		if(!isdefined(level._custom_powerups[str_powerup].grab_powerup))
		{
			level._custom_powerups[str_powerup].grab_powerup = func_grab_powerup;
		}
	}
	if(isdefined(func_setup))
	{
		if(!isdefined(level._custom_powerups[str_powerup].setup_powerup))
		{
			level._custom_powerups[str_powerup].setup_powerup = func_setup;
		}
	}
}

/*
	Name: _register_undefined_powerup
	Namespace: zm_powerups
	Checksum: 0x4738D524
	Offset: 0x7A20
	Size: 0x74
	Parameters: 1
	Flags: Linked
*/
function _register_undefined_powerup(str_powerup)
{
	if(!isdefined(level._custom_powerups))
	{
		level._custom_powerups = [];
	}
	if(!isdefined(level._custom_powerups[str_powerup]))
	{
		level._custom_powerups[str_powerup] = spawnstruct();
		include_zombie_powerup(str_powerup);
	}
}

/*
	Name: register_powerup_weapon
	Namespace: zm_powerups
	Checksum: 0xD25D8A6B
	Offset: 0x7AA0
	Size: 0x8A
	Parameters: 2
	Flags: None
*/
function register_powerup_weapon(str_powerup, func_countdown)
{
	/#
		assert(isdefined(str_powerup), "");
	#/
	_register_undefined_powerup(str_powerup);
	if(isdefined(func_countdown))
	{
		if(!isdefined(level._custom_powerups[str_powerup].weapon_countdown))
		{
			level._custom_powerups[str_powerup].weapon_countdown = func_countdown;
		}
	}
}

