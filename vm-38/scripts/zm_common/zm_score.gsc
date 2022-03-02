#using script_14f4a3c583c77d4b;
#using script_27d214e32f50853d;
#using script_3f9e0dc8454d98e1;
#using script_47fb62300ac0bd60;
#using script_6e3c826b1814cab6;
#using script_ab890501c40b73c;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\rank_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm_common\zm_bgb.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace zm_score;

/*
	Name: function_53b607b5
	Namespace: zm_score
	Checksum: 0x4AA89953
	Offset: 0x300
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_53b607b5()
{
	level notify(1669004051);
}

/*
	Name: function_89f2df9
	Namespace: zm_score
	Checksum: 0x494C25BA
	Offset: 0x320
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"zm_score", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_score
	Checksum: 0xB9E25F17
	Offset: 0x378
	Size: 0x200
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.var_697c8943 = array(90, 80, 70, 60, 50, 40, 30, 20, 10);
	level.var_d6031813 = 1;
	foreach(subdivision in level.var_697c8943)
	{
		score_cf_register_info("damage" + subdivision, 1, 7);
	}
	score_cf_register_info("death_head", 1, 3);
	score_cf_register_info("death_melee", 1, 3);
	score_cf_register_info("transform_kill", 1, 3);
	clientfield::function_a8bbc967("hudItems.doublePointsActive", 1, 1, "int");
	callback::on_spawned(&player_on_spawned);
	callback::function_10a4dd0a(&function_10a4dd0a);
	level callback::on_ai_killed(&function_a3d16ee5);
	level.score_total = 0;
	level.a_func_score_events = [];
	level.var_c44113ca = [];
}

/*
	Name: function_8ac3bea9
	Namespace: zm_score
	Checksum: 0x80F724D1
	Offset: 0x580
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ac3bea9()
{
}

/*
	Name: function_610e9242
	Namespace: zm_score
	Checksum: 0xFA262FF5
	Offset: 0x590
	Size: 0xDA
	Parameters: 6
	Flags: None
*/
function function_610e9242(event, player, victim, descvalue, weapon, var_36f23f1f)
{
	score = var_36f23f1f rank::getscoreinfovalue(weapon);
	/#
		assert(isdefined(score));
	#/
	xp = var_36f23f1f rank::getscoreinfoxp(weapon);
	/#
		assert(isdefined(xp));
	#/
	label = rank::getscoreinfolabel(weapon);
	return score;
}

/*
	Name: register_score_event
	Namespace: zm_score
	Checksum: 0xA411A745
	Offset: 0x678
	Size: 0x24
	Parameters: 2
	Flags: None
*/
function register_score_event(str_event, func_callback)
{
	level.a_func_score_events[str_event] = func_callback;
}

/*
	Name: function_e5d6e6dd
	Namespace: zm_score
	Checksum: 0x1FE4D142
	Offset: 0x6A8
	Size: 0x24
	Parameters: 2
	Flags: Linked
*/
function function_e5d6e6dd(str_archetype, n_score)
{
	level.var_c44113ca[str_archetype] = n_score;
}

/*
	Name: function_e5ca5733
	Namespace: zm_score
	Checksum: 0x33062CDC
	Offset: 0x6D8
	Size: 0x110
	Parameters: 0
	Flags: Linked
*/
function function_e5ca5733()
{
	if(isdefined(self.var_716c0cc9[#"kill"]) && isdefined(level.scoreinfo[self.var_716c0cc9[#"kill"]][#"sp"]) && level.scoreinfo[self.var_716c0cc9[#"kill"]][#"sp"] > 0)
	{
		return level.scoreinfo[self.var_716c0cc9[#"kill"]][#"sp"];
	}
	if(isdefined(self.archetype) && isdefined(level.var_c44113ca[self.archetype]))
	{
		return level.var_c44113ca[self.archetype];
	}
	return 0;
}

/*
	Name: function_a3d16ee5
	Namespace: zm_score
	Checksum: 0xB24F9A31
	Offset: 0x7F0
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function function_a3d16ee5(s_params)
{
	if(isdefined(self.score_event) && isplayer(s_params.eattacker))
	{
		scoreevents::processscoreevent(self.score_event, s_params.eattacker, undefined, s_params.weapon);
	}
}

/*
	Name: player_on_spawned
	Namespace: zm_score
	Checksum: 0xEEE18F4B
	Offset: 0x860
	Size: 0x2A
	Parameters: 0
	Flags: Linked
*/
function player_on_spawned()
{
	util::wait_network_frame();
	if(isdefined(self))
	{
		self.ready_for_score_events = 1;
	}
}

/*
	Name: score_cf_register_info
	Namespace: zm_score
	Checksum: 0x59DF1C1F
	Offset: 0x898
	Size: 0x8C
	Parameters: 3
	Flags: Linked
*/
function score_cf_register_info(name, version, max_count)
{
	for(i = 0; i < 5; i++)
	{
		clientfield::function_5b7d846d((("PlayerList.client" + i) + ".score_cf_") + name, version, getminbitcountfornum(max_count), "counter");
	}
}

/*
	Name: score_cf_increment_info
	Namespace: zm_score
	Checksum: 0xAEC052E2
	Offset: 0x930
	Size: 0x7C
	Parameters: 2
	Flags: Linked
*/
function score_cf_increment_info(name, var_ce49f2dd)
{
	if(!isdefined(var_ce49f2dd))
	{
		var_ce49f2dd = 0;
	}
	if(!var_ce49f2dd && self bgb::function_69b88b5())
	{
		clientfield::increment_world_uimodel((("PlayerList.client" + self.entity_num) + ".score_cf_") + name);
	}
}

/*
	Name: player_add_points
	Namespace: zm_score
	Checksum: 0x1B8382A9
	Offset: 0x9B8
	Size: 0x7A0
	Parameters: 8
	Flags: Linked
*/
function player_add_points(event, mod, hit_location, e_target, zombie_team, damage_weapon, var_96054e3, var_e6e61503)
{
	if(!isdefined(var_e6e61503))
	{
		var_e6e61503 = 0;
	}
	if(level.intermission)
	{
		return;
	}
	if(!zm_utility::is_player_valid(self, 0, var_96054e3))
	{
		return;
	}
	player_points = 0;
	multiplier = get_points_multiplier(self);
	if(isdefined(level.a_func_score_events[event]))
	{
		player_points = [[level.a_func_score_events[event]]](event, mod, hit_location, zombie_team, damage_weapon);
	}
	else
	{
		switch(event)
		{
			case "rebuild_board":
			case "carpenter_powerup":
			case "nuke_powerup":
			case "reviver":
			case "oracle_boon":
			case "bonus_points_powerup":
			{
				player_points = mod;
				break;
			}
			case "bonus_points_powerup_shared":
			{
				player_points = mod;
				multiplier = 1;
				break;
			}
			case "damage_points":
			{
				switch(mod)
				{
					case 10:
					case 20:
					case 30:
					case 40:
					case 50:
					case 60:
					case 70:
					case 80:
					case 90:
					case 100:
					case 110:
					case 120:
					case 130:
					case 140:
					case 150:
					case 160:
					case 170:
					case 180:
					case 190:
					case 200:
					{
						player_points = mod;
						if(!function_e31cf9d5(event))
						{
							if(mod > 90)
							{
								self score_cf_increment_info("damage" + 90, var_e6e61503);
							}
							else
							{
								self score_cf_increment_info("damage" + mod, var_e6e61503);
							}
						}
					}
				}
				break;
			}
			case "death":
			{
				player_points = e_target.var_f256a4d9;
				if(!isdefined(player_points))
				{
					player_points = 0;
				}
				var_dd71ee3e = player_points;
				var_dc75a3a1 = 0;
				while(var_dd71ee3e > 0)
				{
					while(var_dc75a3a1 < level.var_697c8943.size && var_dd71ee3e < level.var_697c8943[var_dc75a3a1])
					{
						var_dc75a3a1++;
					}
					if(var_dc75a3a1 == level.var_697c8943.size)
					{
						break;
					}
					var_dd71ee3e = var_dd71ee3e - level.var_697c8943[var_dc75a3a1];
					if(!function_e31cf9d5(event))
					{
						self score_cf_increment_info("damage" + level.var_697c8943[var_dc75a3a1], var_e6e61503);
					}
				}
				if(!function_e31cf9d5(event))
				{
					player_points = self player_add_points_kill_bonus(mod, hit_location, damage_weapon, player_points, var_e6e61503);
				}
				if(mod == "MOD_GRENADE" || mod == "MOD_GRENADE_SPLASH")
				{
					self zm_stats::increment_client_stat("grenade_kills");
					self zm_stats::increment_player_stat("grenade_kills");
				}
				break;
			}
			case "riotshield_fling":
			{
				player_points = mod;
				if(!var_e6e61503)
				{
					scoreevents::processscoreevent("kill_rbz_zombie", self, undefined, damage_weapon);
				}
				break;
			}
			case "transform_kill":
			{
				self score_cf_increment_info("transform_kill", var_e6e61503);
				if(!var_e6e61503)
				{
					scoreevents::processscoreevent("transform_kill", self, undefined, damage_weapon);
				}
				player_points = zombie_utility::function_d2dfacfd(#"hash_68aa9b4c8de33261");
				break;
			}
			default:
			{
				/#
					assert(0, "");
				#/
				break;
			}
		}
	}
	if(isdefined(level.player_score_override))
	{
		player_points = self [[level.player_score_override]](damage_weapon, player_points);
	}
	player_points = multiplier * zm_utility::round_up_score(player_points);
	if(isdefined(self.point_split_receiver) && event == "death")
	{
		split_player_points = player_points - (zm_utility::round_up_score(player_points * self.point_split_keep_percent));
		self.point_split_receiver add_to_player_score(split_player_points);
		player_points = player_points - split_player_points;
	}
	if(event === "rebuild_board")
	{
		level notify(#"rebuild_board", {#points:player_points, #player:self});
	}
	self add_to_player_score(player_points, 1, event, var_e6e61503);
	if(var_e6e61503 || is_true(level.var_894a83d8) || function_e31cf9d5(event))
	{
		return;
	}
	self.pers[#"score"] = self.score;
	if(isdefined(level._game_module_point_adjustment))
	{
		level [[level._game_module_point_adjustment]](self, zombie_team, player_points);
	}
}

/*
	Name: function_e31cf9d5
	Namespace: zm_score
	Checksum: 0x42005700
	Offset: 0x1160
	Size: 0x54
	Parameters: 1
	Flags: Linked, Private
*/
function private function_e31cf9d5(str_score_event)
{
	if(namespace_32623e1c::is_active(1) && (str_score_event === "death" || str_score_event === "damage_points"))
	{
		return true;
	}
	return false;
}

/*
	Name: get_points_multiplier
	Namespace: zm_score
	Checksum: 0x9BB14D63
	Offset: 0x11C0
	Size: 0xEE
	Parameters: 1
	Flags: Linked
*/
function get_points_multiplier(player)
{
	multiplier = (isdefined(player zombie_utility::function_73061b82(#"zombie_point_scalar")) ? player zombie_utility::function_73061b82(#"zombie_point_scalar") : zombie_utility::function_6403cf83(#"zombie_point_scalar", player.team));
	if(isdefined(level.current_game_module) && level.current_game_module == 2)
	{
		if(isdefined(level._race_team_double_points) && level._race_team_double_points == player._race_team)
		{
			return multiplier;
		}
		return 1;
	}
	return multiplier;
}

/*
	Name: player_add_points_kill_bonus
	Namespace: zm_score
	Checksum: 0x611F9440
	Offset: 0x12B8
	Size: 0x2D6
	Parameters: 5
	Flags: Linked
*/
function player_add_points_kill_bonus(mod, hit_location, weapon, player_points, var_e6e61503)
{
	if(!isdefined(player_points))
	{
		player_points = undefined;
	}
	if(!isdefined(var_e6e61503))
	{
		var_e6e61503 = 0;
	}
	if(mod != "MOD_MELEE" && !is_true(level.is_survival))
	{
		if("head" == hit_location || "helmet" == hit_location || "neck" == hit_location)
		{
			scoreevents::processscoreevent("headshot", self, undefined, weapon);
		}
		else
		{
			scoreevents::processscoreevent("kill_rbz_zombie", self, undefined, weapon);
		}
	}
	if(isdefined(level.player_score_override))
	{
		new_points = self [[level.player_score_override]](weapon, player_points);
		if(new_points > 0 && new_points != player_points)
		{
			return new_points;
		}
	}
	if(mod == "MOD_MELEE" && (!isdefined(weapon) || (!weapon.isriotshield && !zm_loadout::is_hero_weapon(weapon))))
	{
		self score_cf_increment_info("death_melee", var_e6e61503);
		if(!is_true(level.is_survival))
		{
			scoreevents::processscoreevent("melee_kill", self, undefined, weapon);
		}
		return zombie_utility::function_d2dfacfd(#"zombie_score_bonus_melee");
	}
	if(isdefined(player_points))
	{
		score = player_points;
	}
	else
	{
		score = 0;
	}
	if(isdefined(hit_location))
	{
		switch(hit_location)
		{
			case "head":
			case "helmet":
			case "neck":
			{
				self score_cf_increment_info("death_head", var_e6e61503);
				score = zombie_utility::function_d2dfacfd(#"zombie_score_bonus_head");
				break;
			}
			default:
			{
				break;
			}
		}
	}
	return score;
}

/*
	Name: player_reduce_points
	Namespace: zm_score
	Checksum: 0x5CB69E2C
	Offset: 0x1598
	Size: 0x4E6
	Parameters: 2
	Flags: Linked
*/
function player_reduce_points(event, n_amount)
{
	if(level.intermission || zm_utility::is_standard())
	{
		return;
	}
	points = 0;
	switch(event)
	{
		case "take_all":
		{
			points = self.score;
			break;
		}
		case "take_half":
		{
			points = int(self.score / 2);
			break;
		}
		case "take_specified":
		{
			points = n_amount;
			break;
		}
		case "no_revive_penalty":
		{
			if(namespace_59ff1d6c::function_901b751c(#"hash_64291919b16c489a"))
			{
				percent = namespace_59ff1d6c::function_901b751c(#"hash_64291919b16c489a") / 100;
				points = self.score * percent;
			}
			else if(level.round_number >= 50)
			{
				percent = zombie_utility::function_d2dfacfd(#"penalty_no_revive");
				points = self.score * percent;
			}
			break;
		}
		case "died":
		{
			if(namespace_59ff1d6c::function_901b751c(#"hash_1158d006a3913ef6"))
			{
				percent = namespace_59ff1d6c::function_901b751c(#"hash_1158d006a3913ef6") / 100;
				points = self.score * percent;
			}
			else if(level.round_number >= 50)
			{
				percent = zombie_utility::function_d2dfacfd(#"penalty_died");
				points = self.score * percent;
			}
			break;
		}
		case "downed":
		{
			if(level.round_number < 50 && !namespace_59ff1d6c::function_901b751c(#"hash_1fed0d9afc0b0040"))
			{
				percent = 0;
			}
			else
			{
				if(namespace_59ff1d6c::function_901b751c(#"hash_1fed0d9afc0b0040"))
				{
					percent = namespace_59ff1d6c::function_901b751c(#"hash_1fed0d9afc0b0040") / 100;
				}
				else
				{
					percent = zombie_utility::function_d2dfacfd(#"penalty_downed");
					step = zombie_utility::function_d2dfacfd(#"hash_3037a1f286b662e6");
					if(step > 0)
					{
						percent = percent * (int(self.score / step));
					}
					if(percent > 0.5)
					{
						percent = 0.5;
					}
				}
			}
			self notify(#"i_am_down");
			points = self.score * percent;
			self.score_lost_when_downed = zm_utility::round_up_to_ten(int(points));
			break;
		}
		case "points_lost_on_hit_percent":
		{
			points = self.score * n_amount;
			break;
		}
		case "points_lost_on_hit_value":
		{
			points = n_amount;
			break;
		}
		default:
		{
			/#
				assert(0, "");
			#/
			break;
		}
	}
	points = self.score - zm_utility::round_up_to_ten(int(points));
	if(points < 0)
	{
		points = 0;
	}
	if(points > 4000000)
	{
		points = 4000000;
	}
	self.score = points;
	self notify(#"hash_733a824fa6229915", {#str_reason:event});
}

/*
	Name: add_to_player_score
	Namespace: zm_score
	Checksum: 0x64C89516
	Offset: 0x1A88
	Size: 0x31E
	Parameters: 4
	Flags: Linked
*/
function add_to_player_score(points, b_add_to_total, str_awarded_by, var_e6e61503)
{
	if(!isdefined(b_add_to_total))
	{
		b_add_to_total = 1;
	}
	if(!isdefined(str_awarded_by))
	{
		str_awarded_by = "";
	}
	if(!isdefined(var_e6e61503))
	{
		var_e6e61503 = 0;
	}
	if(!isdefined(points) || level.intermission || !is_true(level.var_d6031813))
	{
		return;
	}
	/#
		assert(isplayer(self), "");
	#/
	points = zm_utility::round_up_score(points);
	if(is_true(level.var_894a83d8) || var_e6e61503 || function_e31cf9d5(str_awarded_by))
	{
	}
	else
	{
		n_points_to_add_to_currency = bgb::add_to_player_score_override(points, str_awarded_by);
		self.score = self.score + n_points_to_add_to_currency;
		if(self.score > 4000000)
		{
			self.score = 4000000;
		}
		self.pers[#"score"] = self.score;
		self incrementplayerstat("scoreEarned", n_points_to_add_to_currency);
		self zm_stats::function_301c4be2("boas_scoreEarned", n_points_to_add_to_currency);
		self zm_stats::function_c0c6ab19(#"zearned", n_points_to_add_to_currency, 1);
		level notify(#"earned_points", {#points:points, #player:self});
		self contracts::function_5b88297d(#"hash_781e103e02826009", n_points_to_add_to_currency, #"zstandard");
		if(zm_utility::is_standard())
		{
			self zm_stats::function_c0c6ab19(#"hash_61d61f092d2739eb", n_points_to_add_to_currency);
		}
		if(b_add_to_total)
		{
			self.score_total = self.score_total + points;
			level.score_total = level.score_total + points;
		}
		self notify(#"earned_points", {#str_awarded_by:str_awarded_by, #n_points:points});
	}
}

/*
	Name: minus_to_player_score
	Namespace: zm_score
	Checksum: 0x88C7A305
	Offset: 0x1DB0
	Size: 0x1FE
	Parameters: 2
	Flags: Linked
*/
function minus_to_player_score(points, b_forced)
{
	if(!isdefined(b_forced))
	{
		b_forced = 0;
	}
	if(!isdefined(points) || level.intermission)
	{
		return;
	}
	if(self bgb::is_enabled(#"zm_bgb_shopping_free") && !b_forced)
	{
		self notify(#"hash_14b0ad44336160bc");
		self bgb::do_one_shot_use();
		self playsoundtoplayer(#"zmb_bgb_shoppingfree_coinreturn", self);
		return;
	}
	if(zm_utility::is_standard() && !b_forced)
	{
		return;
	}
	if(!b_forced)
	{
		self contracts::function_5b88297d(#"hash_257283d6c7065a1e", points);
	}
	self.score = self.score - points;
	self stats::function_dad108fa(#"hash_59d8674357c2b6de", points);
	self.pers[#"score"] = self.score;
	self incrementplayerstat("scoreSpent", points);
	self zm_stats::function_301c4be2("boas_scoreSpent", points);
	level notify(#"spent_points", {#points:points, #player:self});
	self notify(#"spent_points", {#points:points});
}

/*
	Name: add_to_team_score
	Namespace: zm_score
	Checksum: 0xEA83639D
	Offset: 0x1FB8
	Size: 0xC
	Parameters: 1
	Flags: None
*/
function add_to_team_score(points)
{
}

/*
	Name: minus_to_team_score
	Namespace: zm_score
	Checksum: 0xAE292E99
	Offset: 0x1FD0
	Size: 0xC
	Parameters: 1
	Flags: None
*/
function minus_to_team_score(points)
{
}

/*
	Name: player_died_penalty
	Namespace: zm_score
	Checksum: 0x2FD78DFA
	Offset: 0x1FE8
	Size: 0xE8
	Parameters: 0
	Flags: Linked
*/
function player_died_penalty()
{
	players = getplayers(self.team);
	foreach(player in players)
	{
		if(!isdefined(player))
		{
			continue;
		}
		if(player == self)
		{
			continue;
		}
		if(is_true(player.is_zombie))
		{
			continue;
		}
		player player_reduce_points("no_revive_penalty");
	}
}

/*
	Name: player_downed_penalty
	Namespace: zm_score
	Checksum: 0x2F12C085
	Offset: 0x20D8
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function player_downed_penalty()
{
	/#
		println("");
	#/
	self player_reduce_points("downed");
}

/*
	Name: can_player_purchase
	Namespace: zm_score
	Checksum: 0x9640A125
	Offset: 0x2128
	Size: 0x8A
	Parameters: 2
	Flags: Linked
*/
function can_player_purchase(n_cost, var_1c65f833)
{
	if(!isdefined(var_1c65f833))
	{
		var_1c65f833 = 0;
	}
	if(self.score >= n_cost)
	{
		return true;
	}
	if(self bgb::is_enabled(#"zm_bgb_shopping_free"))
	{
		return true;
	}
	if(zm_utility::is_standard() && !var_1c65f833)
	{
		return true;
	}
	return false;
}

/*
	Name: function_10a4dd0a
	Namespace: zm_score
	Checksum: 0x5DAC7254
	Offset: 0x21C0
	Size: 0x1B2
	Parameters: 1
	Flags: Linked
*/
function function_10a4dd0a(s_params)
{
	var_a6762160 = s_params.item.var_a6762160;
	if(var_a6762160.itemtype === #"hash_910bf9605abbcea")
	{
		if(isplayer(self))
		{
			e_player = self;
		}
		else
		{
			e_player = s_params.player;
		}
		switch(var_a6762160.name)
		{
			case "hash_6ac270ce2416deb3":
			{
				level scoreevents::doscoreeventcallback("scoreEventZM", {#scoreevent:"essence_pickup_medium", #attacker:e_player});
				break;
			}
			case "hash_682698368e3a043":
			case "hash_69a628368f8263f":
			{
				level scoreevents::doscoreeventcallback("scoreEventZM", {#scoreevent:"essence_pickup_large", #attacker:e_player});
				break;
			}
			default:
			{
				level scoreevents::doscoreeventcallback("scoreEventZM", {#scoreevent:"essence_pickup_small", #attacker:e_player});
				break;
			}
		}
	}
}

/*
	Name: function_5f41330c
	Namespace: zm_score
	Checksum: 0x7438E0B6
	Offset: 0x2380
	Size: 0x98
	Parameters: 0
	Flags: Linked
*/
function function_5f41330c()
{
	return isdefined(self.var_716c0cc9[#"assist"]) && isdefined(level.scoreinfo[self.var_716c0cc9[#"assist"]][#"sp"]) && level.scoreinfo[self.var_716c0cc9[#"assist"]][#"sp"] > 0;
}

/*
	Name: function_82732ced
	Namespace: zm_score
	Checksum: 0xB19F957A
	Offset: 0x2420
	Size: 0x116
	Parameters: 0
	Flags: Linked
*/
function function_82732ced()
{
	if(isdefined(self.var_17a22c08))
	{
		var_7afe66bc = self.var_17a22c08;
	}
	else
	{
		var_7afe66bc = self function_e5ca5733();
		if(!var_7afe66bc && !self function_5f41330c())
		{
			/#
				assert(var_7afe66bc, ("" + function_9e72a96(self.archetype)) + "");
			#/
		}
	}
	self.var_f256a4d9 = var_7afe66bc;
	self.var_d8caf335 = (var_7afe66bc != 0 ? max(1, int(self.maxhealth / (var_7afe66bc * 0.1))) : 1);
	self.var_8d5c706f = [];
}

/*
	Name: function_89db94b3
	Namespace: zm_score
	Checksum: 0xE790872E
	Offset: 0x2540
	Size: 0x2A8
	Parameters: 3
	Flags: None
*/
function function_89db94b3(e_attacker, n_damage, e_inflictor)
{
	if(!isplayer(e_attacker) || !isdefined(self.var_8d5c706f) || is_true(self.marked_for_death))
	{
		return;
	}
	n_index = e_attacker.entity_num;
	if(!isdefined(n_index))
	{
		return;
	}
	if(!isdefined(self.var_8d5c706f[n_index]))
	{
		self.var_8d5c706f[n_index] = 0;
	}
	var_20701980 = self.var_8d5c706f[n_index];
	var_810a69da = var_20701980 + n_damage;
	var_86e74a5c = int(var_20701980 / self.var_d8caf335);
	var_6fb77dc8 = int(var_810a69da / self.var_d8caf335);
	n_points = (var_6fb77dc8 - var_86e74a5c) * 10;
	if(n_points > self.var_f256a4d9)
	{
		n_points = self.var_f256a4d9;
	}
	if(is_true(e_attacker zombie_utility::function_73061b82(#"zombie_insta_kill")) || is_true(zombie_utility::function_6403cf83(#"zombie_insta_kill", e_attacker.team)))
	{
		n_points = self.var_f256a4d9;
	}
	if(n_points)
	{
		if(isdefined(e_inflictor) && e_inflictor.var_9fde8624 === #"hash_44aa977896e18e7f")
		{
			e_attacker player_add_points("damage_points", 10, undefined, undefined, undefined, undefined, undefined, self.var_12745932);
			self.var_f256a4d9 = self.var_f256a4d9 - n_points;
		}
		else
		{
			e_attacker player_add_points("damage_points", n_points, undefined, undefined, undefined, undefined, undefined, self.var_12745932);
			self.var_f256a4d9 = self.var_f256a4d9 - n_points;
		}
	}
	self.var_8d5c706f[n_index] = var_810a69da;
}

/*
	Name: function_acaab828
	Namespace: zm_score
	Checksum: 0x893FD904
	Offset: 0x27F0
	Size: 0x32
	Parameters: 1
	Flags: Linked
*/
function function_acaab828(b_disabled)
{
	if(!isdefined(b_disabled))
	{
		b_disabled = 1;
	}
	if(isdefined(self))
	{
		self.var_12745932 = b_disabled;
	}
}

/*
	Name: function_ffc2d0bc
	Namespace: zm_score
	Checksum: 0xA2DBCE92
	Offset: 0x2830
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function function_ffc2d0bc()
{
	return self.pers[#"score"];
}

/*
	Name: function_c1f146ff
	Namespace: zm_score
	Checksum: 0x40310E2E
	Offset: 0x2858
	Size: 0x32
	Parameters: 1
	Flags: Linked
*/
function function_c1f146ff(score)
{
	self.pers[#"score"] = score;
	self.score = score;
}

/*
	Name: function_bc9de425
	Namespace: zm_score
	Checksum: 0x546371EA
	Offset: 0x2898
	Size: 0x2CA
	Parameters: 1
	Flags: Linked
*/
function function_bc9de425(b_lowest_first)
{
	if(!isdefined(b_lowest_first))
	{
		b_lowest_first = 0;
	}
	var_5e8a44f9 = [];
	var_e8d2685c = 0;
	foreach(player in getplayers())
	{
		if(!isdefined(player.var_9fc3ee66))
		{
			player.var_9fc3ee66 = -1;
		}
		if(!isdefined(player.var_a8da9faf))
		{
			player.var_a8da9faf = -1;
		}
		if(!isdefined(var_5e8a44f9))
		{
			var_5e8a44f9 = [];
		}
		else if(!isarray(var_5e8a44f9))
		{
			var_5e8a44f9 = array(var_5e8a44f9);
		}
		var_5e8a44f9[var_5e8a44f9.size] = player.score;
		if(player.score > 0)
		{
			var_e8d2685c = 1;
		}
	}
	var_5e8a44f9 = array::sort_by_value(var_5e8a44f9, b_lowest_first);
	var_51639 = 0;
	var_694faff0 = -1;
	foreach(var_f0c1d3c2 in var_5e8a44f9)
	{
		if(var_e8d2685c && var_f0c1d3c2 != var_694faff0)
		{
			var_694faff0 = var_f0c1d3c2;
			var_51639++;
		}
		else
		{
			continue;
		}
		foreach(player in getplayers())
		{
			if(player.score == var_f0c1d3c2)
			{
				player.var_a8da9faf = player.var_9fc3ee66;
				player.var_9fc3ee66 = var_51639;
				continue;
			}
			continue;
		}
	}
	return var_5e8a44f9;
}

