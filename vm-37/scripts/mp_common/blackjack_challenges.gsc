#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\player\player_role.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace blackjack_challenges;

/*
	Name: __init__system__
	Namespace: blackjack_challenges
	Checksum: 0x72D48134
	Offset: 0xF8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"blackjack_challenges", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: blackjack_challenges
	Checksum: 0xB9E11196
	Offset: 0x140
	Size: 0x24
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	callback::on_start_gametype(&start_gametype);
}

/*
	Name: start_gametype
	Namespace: blackjack_challenges
	Checksum: 0x64563C35
	Offset: 0x170
	Size: 0xEC
	Parameters: 0
	Flags: None
*/
function start_gametype()
{
	if(!isdefined(level.challengescallbacks))
	{
		level.challengescallbacks = [];
	}
	waittillframeend();
	if(challenges::canprocesschallenges())
	{
		challenges::registerchallengescallback("playerKilled", &challenge_kills);
		challenges::registerchallengescallback("roundEnd", &challenge_round_ended);
		challenges::registerchallengescallback("gameEnd", &challenge_game_ended);
		scoreevents::register_hero_ability_kill_event(&on_hero_ability_kill);
	}
	callback::on_connect(&on_player_connect);
}

/*
	Name: on_player_connect
	Namespace: blackjack_challenges
	Checksum: 0x2C0990F
	Offset: 0x268
	Size: 0x19C
	Parameters: 0
	Flags: None
*/
function on_player_connect()
{
	player = self;
	if(challenges::canprocesschallenges())
	{
		specialistindex = player player_role::get();
		isblackjack = specialistindex == 9;
		if(isblackjack)
		{
			player thread track_blackjack_consumable();
			if(!isdefined(self.pers[#"blackjack_challenge_active"]))
			{
				remaining_time = player consumableget("blackjack", "awarded") - player consumableget("blackjack", "consumed");
				if(remaining_time > 0)
				{
					special_card_earned = player get_challenge_stat("special_card_earned");
					if(!special_card_earned)
					{
						player.pers[#"blackjack_challenge_active"] = 1;
						player.pers[#"blackjack_unique_specialist_kills"] = 0;
						player.pers[#"blackjack_specialist_kills"] = 0;
						player.pers[#"blackjack_unique_weapon_mask"] = 0;
						player.pers[#"blackjack_unique_ability_mask"] = 0;
					}
				}
			}
		}
	}
}

/*
	Name: is_challenge_active
	Namespace: blackjack_challenges
	Checksum: 0x70E2329A
	Offset: 0x410
	Size: 0x22
	Parameters: 0
	Flags: None
*/
function is_challenge_active()
{
	return self.pers[#"blackjack_challenge_active"] === 1;
}

/*
	Name: on_hero_ability_kill
	Namespace: blackjack_challenges
	Checksum: 0x73A3E1BD
	Offset: 0x440
	Size: 0x14C
	Parameters: 2
	Flags: None
*/
function on_hero_ability_kill(ability, victimability)
{
	player = self;
	if(!isdefined(player) || !isplayer(player))
	{
		return;
	}
	if(!isdefined(player.isroulette) || !player.isroulette)
	{
		return;
	}
	if(player is_challenge_active())
	{
		player.pers[#"blackjack_specialist_kills"]++;
		currentheroabilitymask = player.pers[#"blackjack_unique_ability_mask"];
		heroabilitymask = get_hero_ability_mask(victimability);
		newheroabilitymask = heroabilitymask | currentheroabilitymask;
		if(newheroabilitymask != currentheroabilitymask)
		{
			player.pers[#"blackjack_unique_specialist_kills"]++;
			player.pers[#"blackjack_unique_ability_mask"] = newheroabilitymask;
		}
		player check_blackjack_challenge();
	}
}

/*
	Name: debug_print_already_earned
	Namespace: blackjack_challenges
	Checksum: 0x683DE474
	Offset: 0x598
	Size: 0x4C
	Parameters: 0
	Flags: None
*/
function debug_print_already_earned()
{
	/#
		if(getdvarint(#"scr_blackjack_sidebet_debug", 0) == 0)
		{
			return;
		}
		iprintln("");
	#/
}

/*
	Name: debug_print_kill_info
	Namespace: blackjack_challenges
	Checksum: 0x845F34AA
	Offset: 0x5F0
	Size: 0x94
	Parameters: 0
	Flags: None
*/
function debug_print_kill_info()
{
	/#
		if(getdvarint(#"scr_blackjack_sidebet_debug", 0) == 0)
		{
			return;
		}
		player = self;
		iprintln((("" + player.pers[#"blackjack_specialist_kills"]) + "") + player.pers[#"blackjack_unique_specialist_kills"]);
	#/
}

/*
	Name: debug_print_earned
	Namespace: blackjack_challenges
	Checksum: 0xC157748D
	Offset: 0x690
	Size: 0x4C
	Parameters: 0
	Flags: None
*/
function debug_print_earned()
{
	/#
		if(getdvarint(#"scr_blackjack_sidebet_debug", 0) == 0)
		{
			return;
		}
		iprintln("");
	#/
}

/*
	Name: check_blackjack_challenge
	Namespace: blackjack_challenges
	Checksum: 0x31F2F73C
	Offset: 0x6E8
	Size: 0x11C
	Parameters: 0
	Flags: None
*/
function check_blackjack_challenge()
{
	player = self;
	/#
		debug_print_kill_info();
	#/
	special_card_earned = player get_challenge_stat("special_card_earned");
	if(special_card_earned)
	{
		/#
			debug_print_already_earned();
		#/
		return;
	}
	if(player.pers[#"blackjack_specialist_kills"] >= 4 && player.pers[#"blackjack_unique_specialist_kills"] >= 2)
	{
		player set_challenge_stat("special_card_earned", 1);
		player stats::function_dad108fa(#"blackjack_challenge", 1);
		/#
			debug_print_earned();
		#/
	}
}

/*
	Name: challenge_kills
	Namespace: blackjack_challenges
	Checksum: 0xEB3BD69
	Offset: 0x810
	Size: 0x204
	Parameters: 1
	Flags: None
*/
function challenge_kills(data)
{
	attackeristhief = data.attackeristhief;
	attackerisroulette = data.attackerisroulette;
	attackeristhieforroulette = attackeristhief || attackerisroulette;
	if(!attackeristhieforroulette)
	{
		return;
	}
	victim = data.victim;
	attacker = data.attacker;
	player = attacker;
	weapon = data.weapon;
	if(!isdefined(weapon) || weapon == level.weaponnone)
	{
		return;
	}
	if(!isdefined(player) || !isplayer(player))
	{
		return;
	}
	if(attackeristhief)
	{
		if(weapon.isheroweapon === 1)
		{
			if(player is_challenge_active())
			{
				player.pers[#"blackjack_specialist_kills"]++;
				currentheroweaponmask = player.pers[#"blackjack_unique_weapon_mask"];
				heroweaponmask = get_hero_weapon_mask(attacker, weapon);
				newheroweaponmask = heroweaponmask | currentheroweaponmask;
				if(newheroweaponmask != currentheroweaponmask)
				{
					player.pers[#"blackjack_unique_specialist_kills"] = player.pers[#"blackjack_unique_specialist_kills"] + 1;
					player.pers[#"blackjack_unique_weapon_mask"] = newheroweaponmask;
				}
				player check_blackjack_challenge();
			}
		}
	}
}

/*
	Name: get_challenge_stat
	Namespace: blackjack_challenges
	Checksum: 0x5EB2B986
	Offset: 0xA20
	Size: 0x2A
	Parameters: 1
	Flags: None
*/
function get_challenge_stat(stat_name)
{
	return self stats::get_stat(#"tenthspecialistcontract", stat_name);
}

/*
	Name: set_challenge_stat
	Namespace: blackjack_challenges
	Checksum: 0xB634462
	Offset: 0xA58
	Size: 0x3A
	Parameters: 2
	Flags: None
*/
function set_challenge_stat(stat_name, stat_value)
{
	return self stats::set_stat(#"tenthspecialistcontract", stat_name, stat_value);
}

/*
	Name: get_hero_weapon_mask
	Namespace: blackjack_challenges
	Checksum: 0xA474DD86
	Offset: 0xAA0
	Size: 0x182
	Parameters: 2
	Flags: None
*/
function get_hero_weapon_mask(attacker, weapon)
{
	if(!isdefined(weapon))
	{
		return 0;
	}
	switch(weapon.name)
	{
		case "hero_minigun":
		{
			return 1;
			break;
		}
		case "hero_flamethrower":
		{
			return 2;
			break;
		}
		case "hero_lightninggun":
		case "hero_lightninggun_arc":
		{
			return 4;
			break;
		}
		case "hero_firefly_swarm":
		case "hero_chemicalgelgun":
		{
			return 8;
			break;
		}
		case "hero_pineapple_grenade":
		case "hero_pineapplegun":
		{
			return 16;
			break;
		}
		case "hero_bowlauncher2":
		case "hero_bowlauncher3":
		case "hero_bowlauncher4":
		case "hero_bowlauncher":
		{
			return 64;
			break;
		}
		case "hero_gravityspikes":
		{
			return 128;
			break;
		}
		case "hero_annihilator":
		{
			return 256;
			break;
		}
		default:
		{
			return 0;
		}
	}
}

/*
	Name: get_hero_ability_mask
	Namespace: blackjack_challenges
	Checksum: 0x6520A065
	Offset: 0xC30
	Size: 0x11A
	Parameters: 1
	Flags: None
*/
function get_hero_ability_mask(ability)
{
	if(!isdefined(ability))
	{
		return 0;
	}
	switch(ability.name)
	{
		case "gadget_clone":
		{
			return 1;
			break;
		}
		case "gadget_heat_wave":
		{
			return 2;
			break;
		}
		case "gadget_resurrect":
		{
			return 8;
			break;
		}
		case "gadget_armor":
		{
			return 16;
			break;
		}
		case "gadget_camo":
		{
			return 32;
			break;
		}
		case "gadget_vision_pulse":
		{
			return 64;
			break;
		}
		case "gadget_speed_burst":
		{
			return 128;
			break;
		}
		case "gadget_combat_efficiency":
		{
			return 256;
			break;
		}
		default:
		{
			return 0;
		}
	}
}

/*
	Name: challenge_game_ended
	Namespace: blackjack_challenges
	Checksum: 0x36DD7466
	Offset: 0xD58
	Size: 0x94
	Parameters: 1
	Flags: None
*/
function challenge_game_ended(data)
{
	if(!isdefined(data))
	{
		return;
	}
	player = data.player;
	if(!isdefined(player))
	{
		return;
	}
	if(!isplayer(player))
	{
		return;
	}
	if(isbot(player))
	{
		return;
	}
	if(!player is_challenge_active())
	{
		return;
	}
	player report_consumable();
}

/*
	Name: challenge_round_ended
	Namespace: blackjack_challenges
	Checksum: 0xD557215F
	Offset: 0xDF8
	Size: 0x94
	Parameters: 1
	Flags: None
*/
function challenge_round_ended(data)
{
	if(!isdefined(data))
	{
		return;
	}
	player = data.player;
	if(!isdefined(player))
	{
		return;
	}
	if(!isplayer(player))
	{
		return;
	}
	if(isbot(player))
	{
		return;
	}
	if(!player is_challenge_active())
	{
		return;
	}
	player report_consumable();
}

/*
	Name: track_blackjack_consumable
	Namespace: blackjack_challenges
	Checksum: 0x6D337E91
	Offset: 0xE98
	Size: 0xF0
	Parameters: 0
	Flags: None
*/
function track_blackjack_consumable()
{
	level endon(#"game_ended");
	self notify(#"track_blackjack_consumable_singleton");
	self endon(#"track_blackjack_consumable_singleton", #"disconnect");
	player = self;
	if(!isdefined(player.last_blackjack_consumable_time))
	{
		player.last_blackjack_consumable_time = 0;
	}
	while(isdefined(player))
	{
		random_wait_time = getdvarfloat(#"mp_blackjack_consumable_wait", 20) + (randomfloatrange(-5, 5));
		wait(random_wait_time);
		player report_consumable();
	}
}

/*
	Name: report_consumable
	Namespace: blackjack_challenges
	Checksum: 0xCE0A85CE
	Offset: 0xF90
	Size: 0x152
	Parameters: 0
	Flags: None
*/
function report_consumable()
{
	player = self;
	if(!isdefined(player))
	{
		return;
	}
	if(!isdefined(player.timeplayed) || !isdefined(player.timeplayed[#"total"]))
	{
		return;
	}
	current_time_played = player.timeplayed[#"total"];
	time_to_report = current_time_played - player.last_blackjack_consumable_time;
	if(time_to_report > 0)
	{
		max_time_to_report = player consumableget("blackjack", "awarded") - player consumableget("blackjack", "consumed");
		consumable_increment = int(min(time_to_report, max_time_to_report));
		if(consumable_increment > 0)
		{
			player consumableincrement("blackjack", "consumed", consumable_increment);
		}
	}
	player.last_blackjack_consumable_time = current_time_played;
}

