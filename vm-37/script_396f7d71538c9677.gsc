#using scripts\weapons\weapon_utils.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace battlechatter;

/*
	Name: dialog_chance
	Namespace: battlechatter
	Checksum: 0x77EB9B6F
	Offset: 0x1A8
	Size: 0x80
	Parameters: 1
	Flags: Linked
*/
function dialog_chance(chancekey)
{
	dialogchance = mpdialog_value(chancekey);
	if(!isdefined(dialogchance) || dialogchance <= 0)
	{
		return 0;
	}
	if(dialogchance >= 100)
	{
		return 1;
	}
	return randomint(100) < dialogchance;
}

/*
	Name: mpdialog_value
	Namespace: battlechatter
	Checksum: 0x377C8966
	Offset: 0x230
	Size: 0xA2
	Parameters: 2
	Flags: Linked
*/
function mpdialog_value(mpdialogkey, defaultvalue)
{
	if(!isdefined(mpdialogkey))
	{
		return defaultvalue;
	}
	if(!isdefined(level.var_36301b61))
	{
		level.var_36301b61 = getscriptbundle("mpdialog_default");
	}
	mpdialog = level.var_36301b61;
	if(!isdefined(mpdialog))
	{
		return defaultvalue;
	}
	structvalue = mpdialog.(mpdialogkey);
	if(!isdefined(structvalue))
	{
		return defaultvalue;
	}
	return structvalue;
}

/*
	Name: function_e05060f0
	Namespace: battlechatter
	Checksum: 0x657138D8
	Offset: 0x2E0
	Size: 0x42
	Parameters: 1
	Flags: Linked
*/
function function_e05060f0(player)
{
	playerbundle = function_58c93260(player);
	if(!isdefined(playerbundle))
	{
		return undefined;
	}
	return playerbundle.voiceprefix;
}

/*
	Name: function_58c93260
	Namespace: battlechatter
	Checksum: 0x9654EA63
	Offset: 0x330
	Size: 0x130
	Parameters: 2
	Flags: Linked
*/
function function_58c93260(player, meansofdeath)
{
	if(!isplayer(player))
	{
		return undefined;
	}
	bundlename = player getmpdialogname();
	if(!isdefined(bundlename))
	{
		return undefined;
	}
	if(isdefined(meansofdeath) && meansofdeath == "MOD_META" && isdefined(self.pers) && (isdefined(self.pers[#"changed_specialist"]) ? self.pers[#"changed_specialist"] : 0))
	{
		bundlename = self.var_89c4a60f;
	}
	if(!isdefined(level.var_acb08231))
	{
		level.var_acb08231 = [];
	}
	if(!isdefined(level.var_acb08231[bundlename]))
	{
		level.var_acb08231[bundlename] = getscriptbundle(bundlename);
	}
	return level.var_acb08231[bundlename];
}

/*
	Name: function_cdd81094
	Namespace: battlechatter
	Checksum: 0xCF1E0474
	Offset: 0x468
	Size: 0xB0
	Parameters: 1
	Flags: Linked
*/
function function_cdd81094(weapon)
{
	/#
		assert(isdefined(weapon));
	#/
	if(!isdefined(weapon.var_5c238c21))
	{
		return undefined;
	}
	if(!isdefined(level.var_acb08231))
	{
		level.var_acb08231 = [];
	}
	if(!isdefined(level.var_acb08231[weapon.var_5c238c21]))
	{
		level.var_acb08231[weapon.var_5c238c21] = getscriptbundle(weapon.var_5c238c21);
	}
	return level.var_acb08231[weapon.var_5c238c21];
}

/*
	Name: function_e1983f22
	Namespace: battlechatter
	Checksum: 0x93E79CA7
	Offset: 0x520
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function function_e1983f22()
{
	return sessionmodeismultiplayergame() || sessionmodeiszombiesgame();
}

/*
	Name: function_d804d2f0
	Namespace: battlechatter
	Checksum: 0x52E326B2
	Offset: 0x558
	Size: 0x196
	Parameters: 3
	Flags: Linked
*/
function function_d804d2f0(speakingplayer, player, allyradiussq)
{
	if(!isdefined(player) || !isdefined(player.origin) || !isdefined(speakingplayer) || !isdefined(speakingplayer.origin) || !isalive(player) || player.sessionstate != "playing" || player.playingdialog || player isplayerunderwater() || player isremotecontrolling() || player isinvehicle() || player isweaponviewonlylinked() || player == speakingplayer || player.team != speakingplayer.team || player.playerrole == speakingplayer.playerrole || player hasperk(#"specialty_quieter"))
	{
		return false;
	}
	distsq = distancesquared(speakingplayer.origin, player.origin);
	if(distsq > allyradiussq)
	{
		return false;
	}
	return true;
}

/*
	Name: function_5d15920e
	Namespace: battlechatter
	Checksum: 0x3AB4FDE
	Offset: 0x6F8
	Size: 0x152
	Parameters: 2
	Flags: Linked
*/
function function_5d15920e(dialogkey, playerbundle)
{
	if(dialogkey === playerbundle.exertdeathdrowned)
	{
		return "MOD_DROWN";
	}
	if(dialogkey === playerbundle.var_44d86dec)
	{
		return "MOD_EXPLOSIVE";
	}
	if(dialogkey === playerbundle.exertdeathburned)
	{
		return "MOD_BURNED";
	}
	if(dialogkey === playerbundle.var_207908de)
	{
		return "MOD_HEAD_SHOT";
	}
	if(dialogkey === playerbundle.var_1dfcabbd)
	{
		return "MOD_FALLING";
	}
	if(dialogkey === playerbundle.exertdeath)
	{
		return "MOD_UNKNOWN";
	}
	if(dialogkey === playerbundle.var_48305ed9)
	{
		return "MOD_DOT_SELF";
	}
	if(dialogkey === playerbundle.var_f8b4bcc1)
	{
		return "MOD_DOT";
	}
	if(dialogkey === playerbundle.exertdeathstabbed)
	{
		return "MOD_MELEE_ASSASSINATE";
	}
	if(dialogkey === playerbundle.exertdeathelectrocuted)
	{
		return "MOD_ELECTROCUTED";
	}
	if(dialogkey === playerbundle.var_53f25688)
	{
		return "MOD_MELEE_WEAPON_BUTT";
	}
	if(dialogkey === playerbundle.var_7a45f37b)
	{
		return "MOD_GAS";
	}
	if(dialogkey === playerbundle.var_35f92256)
	{
		return "MOD_CRUSH";
	}
	return "MOD_UNKNOWN";
}

/*
	Name: get_closest_player_ally
	Namespace: battlechatter
	Checksum: 0xF804CFFB
	Offset: 0x858
	Size: 0x102
	Parameters: 1
	Flags: Linked
*/
function get_closest_player_ally(teamonly)
{
	if(!level.teambased)
	{
		return undefined;
	}
	players = self get_friendly_players();
	players = arraysort(players, self.origin);
	foreach(player in players)
	{
		if(player == self || !player can_play_dialog(teamonly))
		{
			continue;
		}
		return player;
	}
	return undefined;
}

/*
	Name: get_closest_player_enemy
	Namespace: battlechatter
	Checksum: 0x3D1FCAF7
	Offset: 0x968
	Size: 0xFE
	Parameters: 2
	Flags: None
*/
function get_closest_player_enemy(origin, teamonly)
{
	if(!isdefined(self.team))
	{
		return undefined;
	}
	if(!isdefined(origin))
	{
		origin = self.origin;
	}
	players = self get_enemy_players();
	players = arraysort(players, origin);
	foreach(player in players)
	{
		if(!player can_play_dialog(teamonly))
		{
			continue;
		}
		return player;
	}
	return undefined;
}

/*
	Name: can_play_dialog
	Namespace: battlechatter
	Checksum: 0xD6955C1C
	Offset: 0xA70
	Size: 0x100
	Parameters: 1
	Flags: Linked
*/
function can_play_dialog(teamonly)
{
	if(!isplayer(self) || !isalive(self) || self.playingdialog === 1 || self isplayerunderwater() || self isremotecontrolling() || self isinvehicle() || self isweaponviewonlylinked())
	{
		return false;
	}
	if(isdefined(teamonly) && !teamonly && self hasperk(#"specialty_quieter"))
	{
		return false;
	}
	return true;
}

/*
	Name: get_friendly_players
	Namespace: battlechatter
	Checksum: 0x6D0ADC4B
	Offset: 0xB78
	Size: 0xC8
	Parameters: 0
	Flags: Linked
*/
function get_friendly_players()
{
	players = [];
	if(level.teambased && isdefined(self.team))
	{
		foreach(player in function_a1ef346b(self.team))
		{
			players[players.size] = player;
		}
	}
	else
	{
		players[0] = self;
	}
	return players;
}

/*
	Name: get_enemy_players
	Namespace: battlechatter
	Checksum: 0xEA1578E2
	Offset: 0xC48
	Size: 0x1BE
	Parameters: 0
	Flags: Linked
*/
function get_enemy_players()
{
	players = [];
	if(level.teambased)
	{
		foreach(team, _ in level.teams)
		{
			if(team == self.team)
			{
				continue;
			}
			foreach(player in function_a1ef346b(team))
			{
				players[players.size] = player;
			}
		}
	}
	else
	{
		foreach(player in function_a1ef346b())
		{
			if(player != self)
			{
				players[players.size] = player;
			}
		}
	}
	return players;
}

/*
	Name: function_94b5718c
	Namespace: battlechatter
	Checksum: 0x6077178F
	Offset: 0xE10
	Size: 0xFA
	Parameters: 1
	Flags: None
*/
function function_94b5718c(entity)
{
	selfeye = self geteyeapprox();
	foreach(enemy in get_enemy_players())
	{
		if(!isdefined(enemy))
		{
			continue;
		}
		enemyeye = enemy geteyeapprox();
		if(sighttracepassed(selfeye, enemyeye, 0, enemy))
		{
			return enemy;
		}
	}
	return undefined;
}

/*
	Name: get_random_key
	Namespace: battlechatter
	Checksum: 0x9AAF5103
	Offset: 0xF18
	Size: 0xB4
	Parameters: 1
	Flags: None
*/
function get_random_key(dialogkey)
{
	bundlename = self getmpdialogname();
	if(!isdefined(bundlename))
	{
		return undefined;
	}
	if(!isdefined(level.var_f53efe5c[bundlename]) || !isdefined(level.var_f53efe5c[bundlename][dialogkey]) || level.var_f53efe5c[bundlename][dialogkey] == 0)
	{
		return dialogkey;
	}
	return dialogkey + randomint(level.var_f53efe5c[bundlename][dialogkey]);
}

/*
	Name: get_player_dialog_alias
	Namespace: battlechatter
	Checksum: 0xD6A710CC
	Offset: 0xFD8
	Size: 0x1F0
	Parameters: 2
	Flags: Linked
*/
function get_player_dialog_alias(dialogkey, meansofdeath)
{
	if(!isplayer(self))
	{
		return undefined;
	}
	bundlename = self getmpdialogname();
	if(isdefined(meansofdeath) && meansofdeath == "MOD_META" && (isdefined(self.pers[#"changed_specialist"]) ? self.pers[#"changed_specialist"] : 0))
	{
		bundlename = self.var_89c4a60f;
	}
	if(!isdefined(bundlename))
	{
		return undefined;
	}
	playerbundle = getscriptbundle(bundlename);
	if(!isdefined(playerbundle))
	{
		return undefined;
	}
	if(!isdefined(playerbundle) || !isdefined(dialogkey))
	{
		return undefined;
	}
	if(ishash(dialogkey))
	{
		if(isdefined(level.var_4edd846))
		{
			dialogalias = self [[level.var_4edd846]](playerbundle, dialogkey);
		}
		else
		{
			/#
				iprintlnbold(("" + function_9e72a96(dialogkey)) + "");
			#/
		}
	}
	else
	{
		dialogalias = playerbundle.(dialogkey);
	}
	if(!isdefined(dialogalias))
	{
		return;
	}
	if(!ishash(dialogalias))
	{
		voiceprefix = playerbundle.voiceprefix;
		if(isdefined(voiceprefix))
		{
			dialogalias = voiceprefix + dialogalias;
		}
	}
	return dialogalias;
}

/*
	Name: function_db89c38f
	Namespace: battlechatter
	Checksum: 0x24D8CBCF
	Offset: 0x11D0
	Size: 0x102
	Parameters: 2
	Flags: None
*/
function function_db89c38f(speakingplayer, allyradiussq)
{
	allies = [];
	foreach(player in level.players)
	{
		if(!function_d804d2f0(speakingplayer, player, allyradiussq))
		{
			continue;
		}
		allies[allies.size] = player;
	}
	allies = arraysort(allies, speakingplayer.origin);
	if(!isdefined(allies) || allies.size == 0)
	{
		return undefined;
	}
	return allies[0];
}

/*
	Name: pick_boost_players
	Namespace: battlechatter
	Checksum: 0x91C63005
	Offset: 0x12E0
	Size: 0x6C
	Parameters: 2
	Flags: Linked
*/
function pick_boost_players(player1, player2)
{
	player1 clientfield::set("play_boost", 1);
	player2 clientfield::set("play_boost", 2);
	game.boostplayerspicked[player1.team] = 1;
}

