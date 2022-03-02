#using script_229f24b1662651c4;
#using script_68d2ee1489345a1d;
#using script_6c8abe14025b47c4;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\hud_message_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\mp_common\util.gsc;

#namespace player;

/*
	Name: figure_out_friendly_fire
	Namespace: player
	Checksum: 0xAB073F41
	Offset: 0xF0
	Size: 0xFE
	Parameters: 2
	Flags: Linked
*/
function figure_out_friendly_fire(victim, attacker)
{
	if(level.hardcoremode && level.friendlyfire > 0 && isdefined(victim) && victim.is_capturing_own_supply_drop === 1)
	{
		return 2;
	}
	if(killstreaks::is_ricochet_protected(victim))
	{
		return 2;
	}
	if(level.friendlyfire == 4 && isplayer(attacker))
	{
		if(attacker.pers[#"teamkills_nostats"] < level.var_fe3ff9c1)
		{
			return 1;
		}
		return 2;
	}
	if(isdefined(level.figure_out_gametype_friendly_fire))
	{
		return [[level.figure_out_gametype_friendly_fire]](victim);
	}
	return level.friendlyfire;
}

/*
	Name: freeze_player_for_round_end
	Namespace: player
	Checksum: 0xCD4A79B1
	Offset: 0x1F8
	Size: 0xC4
	Parameters: 0
	Flags: Linked
*/
function freeze_player_for_round_end()
{
	self hud_message::clearlowermessage();
	if(!self function_8b1a219a())
	{
		self closeingamemenu();
	}
	function_7be72477(0);
	currentweapon = self getcurrentweapon();
	if(killstreaks::is_killstreak_weapon(currentweapon) && !currentweapon.iscarriedkillstreak)
	{
		self takeweapon(currentweapon);
	}
}

/*
	Name: function_a074b96f
	Namespace: player
	Checksum: 0x5B4E141D
	Offset: 0x2C8
	Size: 0x19C
	Parameters: 1
	Flags: Linked
*/
function function_a074b96f(enabled)
{
	if(enabled)
	{
		if(!is_true(level.var_3d1e480e))
		{
			if(is_true(getgametypesetting(#"hash_1b85ace023e616a1")))
			{
				self val::function_4671dfff(#"spawn_player", 1);
			}
			else
			{
				self val::set(#"spawn_player", "freezecontrols");
				self val::set(#"spawn_player", "disablegadgets");
			}
		}
	}
	else
	{
		if(is_true(getgametypesetting(#"hash_1b85ace023e616a1")))
		{
			self val::function_4671dfff(#"spawn_player", 0);
		}
		else
		{
			self val::reset(#"spawn_player", "freezecontrols");
			self val::reset(#"spawn_player", "disablegadgets");
		}
	}
}

/*
	Name: function_7be72477
	Namespace: player
	Checksum: 0x8B4E41B0
	Offset: 0x470
	Size: 0x17C
	Parameters: 1
	Flags: Linked
*/
function function_7be72477(enabled)
{
	if(enabled)
	{
		if(is_true(getgametypesetting(#"hash_16e0649caf2f76b5")))
		{
			self val::function_5276aede(#"freeze_player_for_round_end", 1);
		}
		else
		{
			self val::set(#"freeze_player_for_round_end", "freezecontrols");
			self val::set(#"freeze_player_for_round_end", "disablegadgets");
		}
	}
	else
	{
		if(is_true(getgametypesetting(#"hash_16e0649caf2f76b5")))
		{
			self val::function_5276aede(#"freeze_player_for_round_end", 0);
		}
		else
		{
			self val::reset(#"freeze_player_for_round_end", "freezecontrols");
			self val::reset(#"freeze_player_for_round_end", "disablegadgets");
		}
	}
}

/*
	Name: function_c49fc862
	Namespace: player
	Checksum: 0xCA1BA9E3
	Offset: 0x5F8
	Size: 0x184
	Parameters: 1
	Flags: Linked
*/
function function_c49fc862(team)
{
	if(level.teamcount <= 2 && is_true(level.takelivesondeath) && is_true(level.teambased) && !is_true(level.var_a5f54d9f))
	{
		if(level.teamindex[team] > level.teamcount)
		{
			return;
		}
		teamid = "team" + level.teamindex[team];
		if(is_true(level.var_61952d8b[team]))
		{
			if(!isdefined(level.playerlives[team]))
			{
				return;
			}
			clientfield::set_world_uimodel(("hudItems." + teamid) + ".livesCount", level.playerlives[team]);
		}
		else
		{
			if(!isdefined(game.lives[team]))
			{
				return;
			}
			clientfield::set_world_uimodel(("hudItems." + teamid) + ".livesCount", game.lives[team]);
		}
	}
}

/*
	Name: function_cf3aa03d
	Namespace: player
	Checksum: 0xC1CF7B52
	Offset: 0x788
	Size: 0x64
	Parameters: 2
	Flags: Linked
*/
function function_cf3aa03d(func, threaded)
{
	if(!isdefined(threaded))
	{
		threaded = 1;
	}
	array::add(level.var_da2045d0, {#threaded:threaded, #callback:func});
}

/*
	Name: function_3c5cc656
	Namespace: player
	Checksum: 0xA0FE244A
	Offset: 0x7F8
	Size: 0x64
	Parameters: 2
	Flags: Linked
*/
function function_3c5cc656(func, threaded)
{
	if(!isdefined(threaded))
	{
		threaded = 1;
	}
	array::add(level.var_fa66fada, {#threaded:threaded, #callback:func});
}

