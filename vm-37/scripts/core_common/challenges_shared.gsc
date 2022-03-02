#using script_2dc48f46bfeac894;
#using script_40fc784c60f9fa7b;
#using script_47fb62300ac0bd60;
#using script_545a0bac37bda541;
#using script_56ca01b3b31455b5;
#using script_57f7003580bb15e0;
#using script_67ce8e728d8f37ba;
#using script_6c8abe14025b47c4;
#using script_70a43d6ba27cff6a;
#using script_7133a4d461308099;
#using script_7a8059ca02b7b09e;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\contracts_shared.gsc;
#using scripts\core_common\drown.gsc;
#using scripts\core_common\rank_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;

#namespace challenges;

/*
	Name: function_89f2df9
	Namespace: challenges
	Checksum: 0x373AAAFE
	Offset: 0x480
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"challenges_shared", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: challenges
	Checksum: 0x460242CB
	Offset: 0x4C8
	Size: 0x1C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level thread function_57d8515c();
}

/*
	Name: init_shared
	Namespace: challenges
	Checksum: 0x80F724D1
	Offset: 0x4F0
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function init_shared()
{
}

/*
	Name: pickedupballisticknife
	Namespace: challenges
	Checksum: 0x2A74ADA5
	Offset: 0x500
	Size: 0x10
	Parameters: 0
	Flags: None
*/
function pickedupballisticknife()
{
	self.retreivedblades++;
}

/*
	Name: trackassists
	Namespace: challenges
	Checksum: 0xD9014116
	Offset: 0x518
	Size: 0x94
	Parameters: 3
	Flags: Linked
*/
function trackassists(attacker, damage, isflare)
{
	if(!isplayer(damage))
	{
		return;
	}
	if(!isdefined(self.flareattackerdamage))
	{
		self.flareattackerdamage = [];
	}
	if(isdefined(isflare) && isflare == 1)
	{
		self.flareattackerdamage[damage.clientid] = 1;
	}
	else
	{
		self.flareattackerdamage[damage.clientid] = 0;
	}
}

/*
	Name: destroyedequipment
	Namespace: challenges
	Checksum: 0x8606BB3F
	Offset: 0x5B8
	Size: 0x254
	Parameters: 1
	Flags: Linked
*/
function destroyedequipment(weapon)
{
	if(sessionmodeiszombiesgame() || sessionmodeiscampaigngame())
	{
		return;
	}
	if(!isplayer(self))
	{
		return;
	}
	if(isdefined(weapon) && weapon.isemp)
	{
		if(self util::is_item_purchased(#"emp_grenade"))
		{
			self stats::function_dad108fa(#"destroy_equipment_with_emp_grenade", 1);
		}
		self function_be7a08a8(weapon, 1);
		if(self util::has_hacker_perk_purchased_and_equipped())
		{
			self stats::function_dad108fa(#"destroy_equipment_with_emp_engineer", 1);
			self stats::function_dad108fa(#"destroy_equipment_engineer", 1);
		}
	}
	else if(self util::has_hacker_perk_purchased_and_equipped())
	{
		self stats::function_dad108fa(#"destroy_equipment_engineer", 1);
	}
	self stats::function_dad108fa(#"destroy_equipment", 1);
	if(isdefined(weapon))
	{
		self stats::function_e24eec31(weapon, #"destroy_any", 1);
		self stats::function_e24eec31(weapon, #"hash_497df827743010c3", 1);
		self stats::function_e24eec31(weapon, #"hash_67536f932f6aeb36", 1);
	}
	self hackedordestroyedequipment();
}

/*
	Name: destroyedtacticalinsert
	Namespace: challenges
	Checksum: 0x9461AE31
	Offset: 0x818
	Size: 0xB4
	Parameters: 0
	Flags: None
*/
function destroyedtacticalinsert()
{
	if(!isdefined(self.pers[#"tacticalinsertsdestroyed"]))
	{
		self.pers[#"tacticalinsertsdestroyed"] = 0;
	}
	self.pers[#"tacticalinsertsdestroyed"]++;
	if(self.pers[#"tacticalinsertsdestroyed"] >= 5)
	{
		self.pers[#"tacticalinsertsdestroyed"] = 0;
		self stats::function_dad108fa(#"destroy_5_tactical_inserts", 1);
	}
}

/*
	Name: addflyswatterstat
	Namespace: challenges
	Checksum: 0x33BE00AF
	Offset: 0x8D8
	Size: 0x1D8
	Parameters: 2
	Flags: Linked
*/
function addflyswatterstat(weapon, aircraft)
{
	if(!isdefined(self.pers[#"flyswattercount"]))
	{
		self.pers[#"flyswattercount"] = 0;
	}
	self stats::function_e24eec31(weapon, #"destroyed_aircraft", 1);
	self.pers[#"flyswattercount"]++;
	if(self.pers[#"flyswattercount"] == 5)
	{
		self stats::function_e24eec31(weapon, #"destroyed_5_aircraft", 1);
	}
	if(isdefined(aircraft) && isdefined(aircraft.birthtime))
	{
		if(gettime() - aircraft.birthtime < 20000)
		{
			self stats::function_e24eec31(weapon, #"destroyed_aircraft_under20s", 1);
		}
	}
	if(!isdefined(self.destroyedaircrafttime))
	{
		self.destroyedaircrafttime = [];
	}
	if(isdefined(self.destroyedaircrafttime[weapon]) && (gettime() - self.destroyedaircrafttime[weapon]) < 10000)
	{
		self stats::function_e24eec31(weapon, #"destroyed_2aircraft_quickly", 1);
		self.destroyedaircrafttime[weapon] = undefined;
	}
	else
	{
		self.destroyedaircrafttime[weapon] = gettime();
	}
}

/*
	Name: canprocesschallenges
	Namespace: challenges
	Checksum: 0xBC4032C9
	Offset: 0xAB8
	Size: 0xA0
	Parameters: 0
	Flags: None
*/
function canprocesschallenges()
{
	/#
		if(getdvarint(#"hash_4cc2d974d4e9d2d6", 0) > 0)
		{
			return true;
		}
	#/
	if(getdvarint(#"hash_4a5c76bca8b0e3d8", 0) > 0)
	{
		return false;
	}
	if(level.rankedmatch || level.arenamatch || sessionmodeiscampaigngame())
	{
		return true;
	}
	return false;
}

/*
	Name: initteamchallenges
	Namespace: challenges
	Checksum: 0xE9AD9416
	Offset: 0xB60
	Size: 0xD2
	Parameters: 1
	Flags: None
*/
function initteamchallenges(team)
{
	if(!isdefined(game.challenge))
	{
		game.challenge = [];
	}
	if(!isdefined(game.challenge[team]))
	{
		game.challenge[team] = [];
		game.challenge[team][#"plantedbomb"] = 0;
		game.challenge[team][#"destroyedbombsite"] = 0;
		game.challenge[team][#"capturedflag"] = 0;
	}
	game.challenge[team][#"allalive"] = 1;
}

/*
	Name: registerchallengescallback
	Namespace: challenges
	Checksum: 0x811BF4B9
	Offset: 0xC40
	Size: 0x7A
	Parameters: 2
	Flags: Linked
*/
function registerchallengescallback(callback, func)
{
	if(!isdefined(level.challengescallbacks))
	{
		level.challengescallbacks = [];
	}
	if(!isdefined(level.challengescallbacks[callback]))
	{
		level.challengescallbacks[callback] = [];
	}
	level.challengescallbacks[callback][level.challengescallbacks[callback].size] = func;
}

/*
	Name: dochallengecallback
	Namespace: challenges
	Checksum: 0x730B0707
	Offset: 0xCC8
	Size: 0x12E
	Parameters: 2
	Flags: Linked
*/
function dochallengecallback(var_838fbbf5, data)
{
	callbacks = level.challengescallbacks[var_838fbbf5];
	if(!isdefined(callbacks))
	{
		return;
	}
	if(isdefined(data))
	{
		foreach(var_2a6ba2ea in callbacks)
		{
			thread [[var_2a6ba2ea]](data);
		}
	}
	else
	{
		foreach(var_2a6ba2ea in callbacks)
		{
			thread [[var_2a6ba2ea]]();
		}
	}
}

/*
	Name: on_player_connect
	Namespace: challenges
	Checksum: 0x44EF8C13
	Offset: 0xE00
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function on_player_connect()
{
	self thread initchallengedata();
	self thread spawnwatcher();
}

/*
	Name: initchallengedata
	Namespace: challenges
	Checksum: 0x1E353B64
	Offset: 0xE40
	Size: 0x3E
	Parameters: 0
	Flags: Linked
*/
function initchallengedata()
{
	self.pers[#"stickexplosivekill"] = 0;
	self.pers[#"carepackagescalled"] = 0;
	self.explosiveinfo = [];
}

/*
	Name: isdamagefromplayercontrolledaitank
	Namespace: challenges
	Checksum: 0x5BBE9989
	Offset: 0xE88
	Size: 0xD4
	Parameters: 3
	Flags: None
*/
function isdamagefromplayercontrolledaitank(eattacker, einflictor, weapon)
{
	if(weapon.name == #"ai_tank_drone_gun")
	{
		if(isdefined(eattacker) && isdefined(eattacker.remoteweapon) && isdefined(einflictor))
		{
			if(is_true(einflictor.controlled))
			{
				if(eattacker.remoteweapon == einflictor)
				{
					return true;
				}
			}
		}
	}
	else if(weapon.name == #"ai_tank_drone_rocket")
	{
		if(isdefined(einflictor) && !isdefined(einflictor.from_ai))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: isdamagefromplayercontrolledsentry
	Namespace: challenges
	Checksum: 0x5159EE58
	Offset: 0xF68
	Size: 0x96
	Parameters: 3
	Flags: None
*/
function isdamagefromplayercontrolledsentry(eattacker, einflictor, weapon)
{
	if(weapon.name == #"auto_gun_turret")
	{
		if(isdefined(eattacker) && isdefined(eattacker.remoteweapon) && isdefined(einflictor))
		{
			if(eattacker.remoteweapon == einflictor)
			{
				if(is_true(einflictor.controlled))
				{
					return true;
				}
			}
		}
	}
	return false;
}

/*
	Name: perkkills
	Namespace: challenges
	Checksum: 0xB1F2EE11
	Offset: 0x1008
	Size: 0x6D4
	Parameters: 3
	Flags: None
*/
function perkkills(victim, isstunned, time)
{
	player = self;
	if(player hasperk(#"specialty_movefaster"))
	{
		player stats::function_dad108fa(#"perk_movefaster_kills", 1);
	}
	if(player hasperk(#"specialty_noname"))
	{
		player stats::function_dad108fa(#"perk_noname_kills", 1);
	}
	if(player hasperk(#"specialty_quieter"))
	{
		player stats::function_dad108fa(#"perk_quieter_kills", 1);
	}
	if(player hasperk(#"specialty_longersprint"))
	{
		if(isdefined(player.lastsprinttime) && (gettime() - player.lastsprinttime) < 2500)
		{
			player stats::function_dad108fa(#"perk_longersprint", 1);
		}
	}
	if(player hasperk(#"specialty_fastmantle"))
	{
		if(isdefined(player.lastsprinttime) && (gettime() - player.lastsprinttime) < 2500 && player playerads() >= 1)
		{
			player stats::function_dad108fa(#"perk_fastmantle_kills", 1);
		}
	}
	if(player hasperk(#"specialty_loudenemies"))
	{
		player stats::function_dad108fa(#"perk_loudenemies_kills", 1);
	}
	if(isstunned == 1 && player hasperk(#"specialty_stunprotection"))
	{
		player stats::function_dad108fa(#"perk_protection_stun_kills", 1);
	}
	activeenemyemp = 0;
	activecuav = 0;
	if(level.teambased)
	{
		foreach(team, _ in level.teams)
		{
			/#
				assert(isdefined(level.activecounteruavs[team]));
			#/
			/#
				assert(isdefined(level.var_707cab08.activeemps[team]));
			#/
			if(team == player.team)
			{
				continue;
			}
			if(level.activecounteruavs[team] > 0)
			{
				activecuav = 1;
			}
			if(level.var_707cab08.activeemps[team] > 0)
			{
				activeenemyemp = 1;
			}
		}
	}
	else
	{
		/#
			assert(isdefined(level.activecounteruavs[victim.entnum]));
		#/
		/#
			assert(isdefined(level.var_707cab08.activeemps[victim.entnum]));
		#/
		players = level.players;
		for(i = 0; i < players.size; i++)
		{
			if(players[i] != player)
			{
				if(isdefined(level.activecounteruavs[players[i].entnum]) && level.activecounteruavs[players[i].entnum] > 0)
				{
					activecuav = 1;
				}
				if(isdefined(level.var_707cab08.activeemps[players[i].entnum]) && level.var_707cab08.activeemps[players[i].entnum] > 0)
				{
					activeenemyemp = 1;
				}
			}
		}
	}
	if(activecuav == 1 || activeenemyemp == 1)
	{
		if(player hasperk(#"specialty_immunecounteruav"))
		{
			player stats::function_dad108fa(#"perk_immune_cuav_kills", 1);
		}
	}
	activeuavvictim = 0;
	if(isdefined(level.activeuavs[victim.team]) && level.activeuavs[victim.team] > 0)
	{
		if(player hasperk(#"specialty_gpsjammer"))
		{
			player stats::function_dad108fa(#"perk_gpsjammer_immune_kills", 1);
		}
	}
	if(player.lastweaponchange + 5000 > time)
	{
		if(player hasperk(#"specialty_fastweaponswitch"))
		{
			player stats::function_dad108fa(#"perk_fastweaponswitch_kill_after_swap", 1);
		}
	}
	if(player.scavenged == 1)
	{
		if(player hasperk(#"specialty_scavenger"))
		{
			player stats::function_dad108fa(#"perk_scavenger_kills_after_resupply", 1);
		}
	}
}

/*
	Name: flakjacketprotected
	Namespace: challenges
	Checksum: 0x8DF726F5
	Offset: 0x16E8
	Size: 0x86
	Parameters: 2
	Flags: None
*/
function flakjacketprotected(weapon, attacker)
{
	if(weapon.name == #"claymore")
	{
		self.flakjacketclaymore[attacker.clientid] = 1;
	}
	self stats::function_dad108fa(#"survive_with_flak", 1);
	self.challenge_lastsurvivewithflakfrom = attacker;
	self.challenge_lastsurvivewithflaktime = gettime();
}

/*
	Name: earnedkillstreak
	Namespace: challenges
	Checksum: 0x9A36C727
	Offset: 0x1778
	Size: 0x106
	Parameters: 0
	Flags: None
*/
function earnedkillstreak()
{
	gear = self function_b958b70d(self.class_num, "tacticalgear");
	if(gear === #"gear_scorestreakcharge")
	{
		self stats::function_dad108fa(#"hash_656a2ab7e777796b", 1);
		if(isdefined(self.var_ea1458aa))
		{
			if(!isdefined(self.var_ea1458aa.var_829c3e81))
			{
				self.var_ea1458aa.var_829c3e81 = 0;
			}
			self.var_ea1458aa.var_829c3e81++;
			if(self.var_ea1458aa.var_829c3e81 == 5)
			{
				self stats::function_dad108fa(#"hash_1dd0ef4785aa4084", 1);
				self.var_ea1458aa.var_829c3e81 = 0;
			}
		}
	}
}

/*
	Name: genericbulletkill
	Namespace: challenges
	Checksum: 0x669C270
	Offset: 0x1888
	Size: 0x9C
	Parameters: 3
	Flags: None
*/
function genericbulletkill(data, victim, weapon)
{
	player = self;
	time = weapon.time;
	if(weapon.victim.idflagstime == time)
	{
		if(weapon.victim.idflags & 8)
		{
			player stats::function_dad108fa(#"hash_2df2ce58360b7c03", 1);
		}
	}
}

/*
	Name: ishighestscoringplayer
	Namespace: challenges
	Checksum: 0xE37B69B8
	Offset: 0x1930
	Size: 0x158
	Parameters: 1
	Flags: None
*/
function ishighestscoringplayer(player)
{
	if(!isdefined(player.score) || player.score < 1)
	{
		return false;
	}
	players = level.players;
	if(level.teambased)
	{
		team = player.pers[#"team"];
	}
	else
	{
		team = "all";
	}
	highscore = player.score;
	for(i = 0; i < players.size; i++)
	{
		if(!isdefined(players[i].score))
		{
			continue;
		}
		if(players[i] == player)
		{
			continue;
		}
		if(players[i].score < 1)
		{
			continue;
		}
		if(team != "all" && players[i].pers[#"team"] != team)
		{
			continue;
		}
		if(players[i].score >= highscore)
		{
			return false;
		}
	}
	return true;
}

/*
	Name: spawnwatcher
	Namespace: challenges
	Checksum: 0xB2DE01C3
	Offset: 0x1A90
	Size: 0x148
	Parameters: 0
	Flags: Linked
*/
function spawnwatcher()
{
	self endon(#"disconnect", #"killspawnmonitor");
	self.pers[#"stickexplosivekill"] = 0;
	self.pers[#"pistolheadshot"] = 0;
	self.pers[#"assaultrifleheadshot"] = 0;
	self.pers[#"killnemesis"] = 0;
	while(true)
	{
		self waittill(#"spawned_player");
		self.pers[#"longshotsperlife"] = 0;
		self.weaponkills = [];
		self.attachmentkills = [];
		self.retreivedblades = 0;
		self.lastreloadtime = 0;
		self.crossbowclipkillcount = 0;
		self thread watchfordtp();
		self thread watchformantle();
		self thread monitor_player_sprint();
	}
}

/*
	Name: watchfordtp
	Namespace: challenges
	Checksum: 0xC9EA9350
	Offset: 0x1BE0
	Size: 0x76
	Parameters: 0
	Flags: Linked
*/
function watchfordtp()
{
	self endon(#"disconnect", #"death", #"killdtpmonitor");
	self.dtptime = 0;
	while(true)
	{
		self waittill(#"dtp_end");
		self.dtptime = gettime() + 4000;
	}
}

/*
	Name: watchformantle
	Namespace: challenges
	Checksum: 0xBD725B8A
	Offset: 0x1C60
	Size: 0x82
	Parameters: 0
	Flags: Linked
*/
function watchformantle()
{
	self endon(#"disconnect", #"death", #"killmantlemonitor");
	self.mantletime = 0;
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"mantle_start");
		self.mantletime = waitresult.end_time;
	}
}

/*
	Name: disarmedhackedcarepackage
	Namespace: challenges
	Checksum: 0x9D676FC1
	Offset: 0x1CF0
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function disarmedhackedcarepackage()
{
	self stats::function_dad108fa(#"disarm_hacked_carepackage", 1);
}

/*
	Name: destroyed_car
	Namespace: challenges
	Checksum: 0x3CF5FB8C
	Offset: 0x1D28
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function destroyed_car()
{
	if(!isdefined(self) || !isplayer(self))
	{
		return;
	}
	self stats::function_dad108fa(#"destroy_car", 1);
}

/*
	Name: killednemesis
	Namespace: challenges
	Checksum: 0x68BAEFC1
	Offset: 0x1D88
	Size: 0xB4
	Parameters: 0
	Flags: Linked
*/
function killednemesis()
{
	if(!isdefined(self.pers[#"killnemesis"]))
	{
		self.pers[#"killnemesis"] = 0;
	}
	self.pers[#"killnemesis"]++;
	if(self.pers[#"killnemesis"] >= 5)
	{
		self.pers[#"killnemesis"] = 0;
		self stats::function_dad108fa(#"kill_nemesis", 1);
	}
}

/*
	Name: killwhiledamagingwithhpm
	Namespace: challenges
	Checksum: 0x7128B589
	Offset: 0x1E48
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function killwhiledamagingwithhpm()
{
	self stats::function_dad108fa(#"kill_while_damaging_with_microwave_turret", 1);
}

/*
	Name: longdistancehatchetkill
	Namespace: challenges
	Checksum: 0xD6A57F7F
	Offset: 0x1E80
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function longdistancehatchetkill()
{
	self stats::function_dad108fa(#"long_distance_hatchet_kill", 1);
}

/*
	Name: blockedsatellite
	Namespace: challenges
	Checksum: 0xDE2B81E6
	Offset: 0x1EB8
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function blockedsatellite()
{
	self stats::function_dad108fa(#"activate_cuav_while_enemy_satelite_active", 1);
}

/*
	Name: longdistancekill
	Namespace: challenges
	Checksum: 0x1FBA38B2
	Offset: 0x1EF0
	Size: 0x7C
	Parameters: 0
	Flags: None
*/
function longdistancekill()
{
	self.pers[#"longshotsperlife"]++;
	if(self.pers[#"longshotsperlife"] >= 3)
	{
		self.pers[#"longshotsperlife"] = 0;
		self stats::function_dad108fa(#"longshot_3_onelife", 1);
	}
}

/*
	Name: challengeroundend
	Namespace: challenges
	Checksum: 0x7E1A062C
	Offset: 0x1F78
	Size: 0x182
	Parameters: 1
	Flags: None
*/
function challengeroundend(data)
{
	player = data.player;
	winner = data.winner;
	if(endedearly(winner, winner == "tie"))
	{
		return;
	}
	if(level.teambased)
	{
		winnerscore = game.stat[#"teamscores"][winner];
		loserscore = getlosersteamscores(winner);
	}
	switch(level.gametype)
	{
		case "sd":
		{
			if(player.team == winner)
			{
				if(game.challenge[winner][#"allalive"])
				{
					player stats::function_d40764f3(#"round_win_no_deaths", 1);
				}
				if(isdefined(player.lastmansddefeat3enemies))
				{
					player stats::function_d40764f3(#"last_man_defeat_3_enemies", 1);
				}
			}
			break;
		}
		default:
		{
			break;
		}
	}
}

/*
	Name: last_man_defeat_3_enemies
	Namespace: challenges
	Checksum: 0xDE50D19D
	Offset: 0x2108
	Size: 0x84
	Parameters: 1
	Flags: None
*/
function last_man_defeat_3_enemies(team)
{
	if(function_a1ef346b(team).size == 1)
	{
		player = function_a1ef346b(team)[0];
		if(isdefined(player.var_66cfa07f))
		{
			player stats::function_bb7eedf0(#"last_man_defeat_3_enemies", 1);
		}
	}
}

/*
	Name: roundend
	Namespace: challenges
	Checksum: 0x49C94E6F
	Offset: 0x2198
	Size: 0x11C
	Parameters: 1
	Flags: Linked
*/
function roundend(winner)
{
	waitframe(1);
	data = spawnstruct();
	data.time = gettime();
	if(level.teambased)
	{
		if(isdefined(winner) && isdefined(level.teams[winner]))
		{
			data.winner = winner;
		}
	}
	else if(isdefined(winner))
	{
		data.winner = winner;
	}
	for(index = 0; index < level.placement[#"all"].size; index++)
	{
		data.player = level.placement[#"all"][index];
		if(isdefined(data.player))
		{
			data.place = index;
			dochallengecallback("roundEnd", data);
		}
	}
}

/*
	Name: function_90185171
	Namespace: challenges
	Checksum: 0x30DFD843
	Offset: 0x22C0
	Size: 0x814
	Parameters: 1
	Flags: Linked
*/
function function_90185171(totaltimeplayed)
{
	if(!sessionmodeisonlinegame() || !is_true(level.rankedmatch))
	{
		return;
	}
	player = self;
	if(!isdefined(player) || !isplayer(player) || isbot(player))
	{
		return;
	}
	/#
		println("" + player.name);
	#/
	/#
		println("" + (isdefined(totaltimeplayed) ? totaltimeplayed : ""));
	#/
	/#
		println("" + (isdefined(player.pers[#"participation"]) ? player.pers[#"participation"] : ""));
	#/
	var_e521cb78 = 0;
	if(!isdefined(totaltimeplayed) || totaltimeplayed <= 0)
	{
		return;
	}
	var_e521cb78 = totaltimeplayed;
	var_e521cb78 = int(var_e521cb78 * (isdefined(level.var_b4320b5b[#"hash_2873049796893c2"]) ? level.var_b4320b5b[#"hash_2873049796893c2"] : 1));
	if(!isdedicated())
	{
		if(ispc())
		{
			var_e521cb78 = int(var_e521cb78 * (isdefined(level.var_b4320b5b[#"hash_164e590374876a39"]) ? level.var_b4320b5b[#"hash_164e590374876a39"] : 1));
		}
		else
		{
			var_e521cb78 = int(var_e521cb78 * (isdefined(level.var_b4320b5b[#"hash_5873106a43bbf0a9"]) ? level.var_b4320b5b[#"hash_5873106a43bbf0a9"] : 1));
		}
	}
	/#
		var_8cfed04 = getdvarint(#"hash_4b14d2bc8d560a47", 0);
		if(var_8cfed04 > 0)
		{
			var_e521cb78 = var_8cfed04;
			player.timeplayed[#"total"]++;
			player.pers[#"participation"]++;
		}
	#/
	if(!isdefined(player.pers[#"participation"]) || player.pers[#"participation"] < 1)
	{
		if(!function_f99d2668())
		{
			/#
				println(player.name + "");
			#/
			return;
		}
	}
	if(!function_f99d2668() && isdefined(player.pers[#"controllerparticipation"]))
	{
		if(is_true(player.pers[#"controllerparticipationchecks"]))
		{
			if(player.pers[#"controllerparticipationchecks"] >= level.var_42dca1dd)
			{
				var_7be1e671 = player.pers[#"controllerparticipation"] / player.pers[#"controllerparticipationchecks"];
				if(var_7be1e671 < level.var_8e1c2aa1)
				{
					self.pers[#"controllerparticipationendgameresult"] = 0;
					/#
						println(((((player.name + "") + var_7be1e671) + "") + level.var_8e1c2aa1) + "");
					#/
					return;
				}
				self.pers[#"controllerparticipationendgameresult"] = 1;
			}
		}
	}
	if(var_e521cb78 > 0)
	{
		if(sessionmodeismultiplayergame() || function_f99d2668() && getdvarint(#"hash_2f8caf73a89c7179", 1))
		{
			var_ae857992 = getdvarint(#"hash_60d812bef0f782fb", 1);
			var_f406f7e3 = getdvarstring(#"hash_714f877764f473ea", "");
			total_time = int(var_e521cb78 * getdvarfloat(#"hash_4a9ebeef00abd6cb", 1));
			var_93480888 = int(player function_c52bcf79() * 100);
			if(var_f406f7e3 != "")
			{
				if(getdvarint(#"hash_69ce13758f53923d", 1))
				{
					currxp = player rank::getrankxp();
					xpearned = 0;
					if(isdefined(player.pers[#"hash_43ad5d1b08145b1f"]))
					{
						xpearned = currxp - player.pers[#"hash_43ad5d1b08145b1f"];
					}
					player.pers[#"hash_43ad5d1b08145b1f"] = currxp;
					/#
						println((("" + total_time) + "") + xpearned);
					#/
					player function_cce105c8(hash(var_f406f7e3), 1, int(var_ae857992), 2, total_time, 3, var_93480888, 4, xpearned);
				}
				else
				{
					/#
						println("" + total_time);
					#/
					player function_cce105c8(hash(var_f406f7e3), 1, int(var_ae857992), 2, total_time, 3, var_93480888);
				}
			}
		}
	}
}

/*
	Name: function_659f7dc
	Namespace: challenges
	Checksum: 0xEA837D79
	Offset: 0x2AE0
	Size: 0x8C
	Parameters: 1
	Flags: Linked
*/
function function_659f7dc(var_3e34c8a4)
{
	self util::function_22bf0a4a();
	if(isdefined(var_3e34c8a4) && var_3e34c8a4 > 0)
	{
		var_5024088b = float(var_3e34c8a4) / 1000;
		if(var_5024088b > 0)
		{
			self function_90185171(var_5024088b);
		}
	}
}

/*
	Name: function_d6f929d6
	Namespace: challenges
	Checksum: 0x3B8E0D75
	Offset: 0x2B78
	Size: 0x104
	Parameters: 0
	Flags: Linked, Private
*/
function private function_d6f929d6()
{
	wait(2);
	level.var_4f654f3a = 1;
	foreach(player in level.players)
	{
		if(isdefined(player.pers[#"hash_150795bee4d46ce4"]))
		{
			var_28ee869a = gettime() - player.pers[#"hash_150795bee4d46ce4"];
			player function_659f7dc(var_28ee869a);
		}
	}
	function_f4f6d8a1();
}

/*
	Name: gameend
	Namespace: challenges
	Checksum: 0x9F9D003E
	Offset: 0x2C88
	Size: 0x1DC
	Parameters: 2
	Flags: Linked
*/
function gameend(winner, var_c1e98979)
{
	waitframe(1);
	data = spawnstruct();
	data.time = gettime();
	if(level.teambased)
	{
		if(isdefined(var_c1e98979) && isdefined(level.teams[var_c1e98979]))
		{
			data.winner = var_c1e98979;
		}
	}
	else if(isdefined(var_c1e98979) && isplayer(var_c1e98979))
	{
		data.winner = var_c1e98979;
	}
	for(index = 0; index < level.placement[#"all"].size; index++)
	{
		data.player = level.placement[#"all"][index];
		data.place = index;
		if(isdefined(data.player))
		{
			dochallengecallback("gameEnd", data);
		}
	}
	if(sessionmodeismultiplayergame() && sessionmodeisonlinegame() && level.rankedmatch)
	{
		if(getdvarint(#"hash_7902ca2d14eb933b", 0) == 1)
		{
			level.var_4f654f3a = 1;
			function_f4f6d8a1();
		}
		else
		{
			thread function_d6f929d6();
		}
	}
}

/*
	Name: function_1e064861
	Namespace: challenges
	Checksum: 0x7123BF8A
	Offset: 0x2E70
	Size: 0xD4
	Parameters: 2
	Flags: Linked
*/
function function_1e064861(type, var_a7674114)
{
	if(type == self.pers[#"hash_4a01db5796cf12b1"])
	{
		self.pers[#"hash_3b7fc8c62a7d4420"]++;
	}
	else
	{
		self.pers[#"hash_3b7fc8c62a7d4420"] = 1;
		self.pers[#"hash_4a01db5796cf12b1"] = type;
	}
	if(self.pers[#"hash_3b7fc8c62a7d4420"] > self.pers[var_a7674114])
	{
		self.pers[var_a7674114] = self.pers[#"hash_3b7fc8c62a7d4420"];
	}
}

/*
	Name: function_fd112605
	Namespace: challenges
	Checksum: 0x360C1B9E
	Offset: 0x2F50
	Size: 0x40
	Parameters: 0
	Flags: Linked
*/
function function_fd112605()
{
	if(is_true(self.var_4c45f505))
	{
		return true;
	}
	if(self.sessionstate != "playing")
	{
		return true;
	}
	return false;
}

/*
	Name: function_ca7c50ce
	Namespace: challenges
	Checksum: 0xF72E5C19
	Offset: 0x2F98
	Size: 0x4E
	Parameters: 0
	Flags: Linked
*/
function function_ca7c50ce()
{
	return (self.pers[#"controllerparticipation"] / self.pers[#"controllerparticipationchecks"]) + self.pers[#"hash_2013e34fb3c104e9"];
}

/*
	Name: function_354f257f
	Namespace: challenges
	Checksum: 0x43C51DCF
	Offset: 0x2FF0
	Size: 0x338
	Parameters: 0
	Flags: Linked
*/
function function_354f257f()
{
	if(!isdefined(self))
	{
		return false;
	}
	if(!isdefined(self.pers[#"controllerparticipationchecksskipped"]))
	{
		self.pers[#"controllerparticipationchecksskipped"] = 0;
	}
	if(isdedicated() && getdvarint(#"hash_2167ce61af5dc0b0", 1) == 0)
	{
		return false;
	}
	if(function_fd112605())
	{
		self.pers[#"controllerparticipationchecksskipped"]++;
		return false;
	}
	self.pers[#"controllerparticipationchecks"]++;
	var_51ba979b = #"failure";
	var_a7674114 = "controllerParticipationConsecutiveFailureMax";
	var_fb144707 = self function_1bc04df9();
	if(var_fb144707 >= level.var_5b7e9056)
	{
		self.pers[#"controllerparticipation"]++;
		var_51ba979b = #"success";
		var_a7674114 = "controllerParticipationConsecutiveSuccessMax";
		if(self.pers[#"controllerparticipationinactivitywarnings"])
		{
			var_9c06c7d1 = function_ca7c50ce();
			difference = level.var_b6752258 - var_9c06c7d1;
			if(difference > 0)
			{
				difference = difference + 0.02;
				self.pers[#"hash_2013e34fb3c104e9"] = difference;
			}
			self.pers[#"controllerparticipationsuccessafterinactivitywarning"] = 1;
		}
	}
	self function_1e064861(var_51ba979b, var_a7674114);
	if(self.pers[#"controllerparticipationchecks"] >= level.var_5d96cc20)
	{
		var_b06a954d = function_ca7c50ce();
		if(var_b06a954d < level.var_b6752258)
		{
			if(!self.pers[#"controllerparticipationinactivitywarnings"])
			{
				self.pers[#"controllerparticipationinactivitywarnings"]++;
				self iprintlnbold(#"hash_59bd89e170a924ac");
			}
			else
			{
				self.pers[#"controllerparticipationendgameresult"] = -2;
				if(isdefined(level.gamehistoryplayerkicked))
				{
					self thread [[level.gamehistoryplayerkicked]]();
				}
				kick(self getentitynumber(), "GAME/DROPPEDFORINACTIVITY");
			}
		}
	}
	return true;
}

/*
	Name: function_57d8515c
	Namespace: challenges
	Checksum: 0x1E6664C4
	Offset: 0x3330
	Size: 0x38E
	Parameters: 0
	Flags: Linked
*/
function function_57d8515c()
{
	if(!sessionmodeisonlinegame() || !is_true(level.rankedmatch))
	{
		return;
	}
	var_37c0d246 = 25;
	level.var_5b7e9056 = (isdefined(getgametypesetting(#"hash_410c5c7c1e60b534")) ? getgametypesetting(#"hash_410c5c7c1e60b534") : 0);
	level.var_df437ed2 = (isdefined(getgametypesetting(#"hash_451245a24412d90f")) ? getgametypesetting(#"hash_451245a24412d90f") : 0);
	level.var_42dca1dd = (isdefined(getgametypesetting(#"hash_6ae29c8144cb7659")) ? getgametypesetting(#"hash_6ae29c8144cb7659") : 0);
	level.var_8e1c2aa1 = (isdefined(getgametypesetting(#"hash_35e9fc8eee6881e0")) ? getgametypesetting(#"hash_35e9fc8eee6881e0") : 0);
	level.var_5d96cc20 = (isdefined(getgametypesetting(#"hash_7adb62a64c6d963")) ? getgametypesetting(#"hash_7adb62a64c6d963") : 0);
	level.var_b6752258 = (isdefined(getgametypesetting(#"hash_1df445b9d1af641f")) ? getgametypesetting(#"hash_1df445b9d1af641f") : 0);
	level waittill(#"hash_313ad43b34e74e96");
	for(;;)
	{
		wait(level.var_df437ed2);
		var_a3b5975e = 0;
		players = getplayers();
		foreach(player in players)
		{
			if(!isdefined(player) || !isplayer(player) || isbot(player))
			{
				continue;
			}
			if(player function_354f257f())
			{
				var_a3b5975e++;
			}
			if(12 <= var_a3b5975e)
			{
				waitframe(1);
			}
		}
	}
}

/*
	Name: getfinalkill
	Namespace: challenges
	Checksum: 0xE00F2F64
	Offset: 0x36C8
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function getfinalkill(player)
{
	if(isplayer(player))
	{
		player stats::function_dad108fa(#"get_final_kill", 1);
	}
}

/*
	Name: function_1d2c16bb
	Namespace: challenges
	Checksum: 0xBCBB19D9
	Offset: 0x3720
	Size: 0xDC
	Parameters: 3
	Flags: Linked
*/
function function_1d2c16bb(weapon, vehicle, var_734a4410)
{
	if(!isplayer(self) || !isdefined(weapon))
	{
		return;
	}
	controlled = (isdefined(vehicle.controlled) ? vehicle.controlled : 1);
	self destroyscorestreak(weapon, controlled, 1, 1, vehicle);
	if(weapon.rootweapon.name == "hatchet" && isdefined(var_734a4410))
	{
		self stats::function_dad108fa(var_734a4410, 1);
	}
}

/*
	Name: capturedcrate
	Namespace: challenges
	Checksum: 0x8AEB7AE5
	Offset: 0x3808
	Size: 0x114
	Parameters: 1
	Flags: None
*/
function capturedcrate(owner)
{
	if(isdefined(self.lastrescuedby) && isdefined(self.lastrescuedtime))
	{
		if(self.lastrescuedtime + 5000 > gettime())
		{
			self.lastrescuedby stats::function_dad108fa(#"defend_teammate_who_captured_package", 1);
		}
	}
	if(owner == self)
	{
		self stats::function_dad108fa(#"hash_26662af4f77f01fe", 1);
	}
	else if(level.teambased && owner.team != self.team || !level.teambased)
	{
		self stats::function_dad108fa(#"capture_enemy_carepackage", 1);
	}
	self contracts::function_a54e2068(#"hash_3cdc6d90fcaff928");
}

/*
	Name: destroyscorestreak
	Namespace: challenges
	Checksum: 0x6A2B621A
	Offset: 0x3928
	Size: 0x774
	Parameters: 5
	Flags: Linked
*/
function destroyscorestreak(weapon, playercontrolled, groundbased, countaskillstreakvehicle, var_ba3b7192)
{
	if(!isdefined(countaskillstreakvehicle))
	{
		countaskillstreakvehicle = 1;
	}
	if(!isplayer(self) || !isdefined(weapon))
	{
		return;
	}
	if(groundbased)
	{
		self stats::function_dad108fa(#"hash_436bb8e11434ff63", 1);
		self stats::function_e24eec31(weapon, #"destroy_vehicle_ground", 1);
	}
	else
	{
		self stats::function_e24eec31(weapon, #"destroy_vehicle_air", 1);
	}
	if(isdefined(level.killstreakweapons[weapon]))
	{
		if(level.killstreakweapons[weapon] == "dart")
		{
			self stats::function_dad108fa(#"destroy_scorestreak_with_dart", 1);
		}
		self stats::function_dad108fa(#"hash_e085a5f8fda7fec", 1);
	}
	else
	{
		if(weapon.var_b76e0a09)
		{
			self stats::function_dad108fa(#"destroy_scorestreak_with_specialist", 1);
		}
		else
		{
			weaponclass = util::getweaponclass(weapon);
			if(isdefined(weaponclass) && weaponclass == #"weapon_launcher")
			{
				self stats::function_dad108fa(#"hash_be93d1227e6db1", 1);
			}
		}
	}
	if(playercontrolled === 1)
	{
		self stats::function_dad108fa(#"hash_56bb9eba7da13617", 1);
	}
	else
	{
		if(self function_6c32d092(#"talent_coldblooded"))
		{
			self stats::function_dad108fa(#"destroy_ai_scorestreak_coldblooded", 1);
		}
		if(self util::has_cold_blooded_perk_purchased_and_equipped())
		{
			if(self util::has_blind_eye_perk_purchased_and_equipped())
			{
				if(groundbased)
				{
					self.pers[#"challenge_destroyed_ground"]++;
				}
				else
				{
					self.pers[#"challenge_destroyed_air"]++;
				}
				if(self.pers[#"challenge_destroyed_ground"] > 0 && self.pers[#"challenge_destroyed_air"] > 0)
				{
					self stats::function_dad108fa(#"destroy_air_and_ground_blindeye_coldblooded", 1);
					self.pers[#"challenge_destroyed_air"] = 0;
					self.pers[#"challenge_destroyed_ground"] = 0;
				}
			}
		}
	}
	if(!isdefined(self.pers[#"challenge_destroyed_killstreak"]))
	{
		self.pers[#"challenge_destroyed_killstreak"] = 0;
	}
	self.pers[#"challenge_destroyed_killstreak"]++;
	if(self.pers[#"challenge_destroyed_killstreak"] >= 5)
	{
		self.pers[#"challenge_destroyed_killstreak"] = 0;
		self stats::function_e24eec31(weapon, #"destroy_5_killstreak", 1);
		self stats::function_e24eec31(weapon, #"destroy_5_killstreak_vehicle", 1);
	}
	self stats::function_e24eec31(weapon, #"destroy_any", 1);
	self stats::function_e24eec31(weapon, #"hash_497df827743010c3", 1);
	self stats::function_e24eec31(weapon, #"hash_67536f932f6aeb36", 1);
	self function_38ad2427(#"hash_450f99ce50083544", 1);
	self stats::function_dad108fa(#"hash_5d209f828d9bbd96", 1);
	self stats::function_dad108fa(#"hash_55becb3a18f3c612", 1);
	if(self function_6c32d092(#"talent_engineer"))
	{
		self stats::function_dad108fa(#"hash_481f9ede13340c00", 1);
	}
	if(isdefined(weapon.attachments) && weapon.attachments.size > 0)
	{
		if(isdefined(weaponclass) && weaponclass == #"weapon_launcher")
		{
			if(self weaponhasattachmentandunlocked(weapon, "fastreload"))
			{
				self stats::function_dad108fa(#"hash_4b19afce40dfc918", 1);
			}
		}
	}
	var_d9906cca = level.killstreaks[var_ba3b7192.killstreaktype].script_bundle;
	if(!(isdefined(var_d9906cca.var_192bb442) ? var_d9906cca.var_192bb442 : 0))
	{
		if((isdefined(level.var_72df16fd[var_ba3b7192.killstreakid]) ? level.var_72df16fd[var_ba3b7192.killstreakid] : 0) == 0)
		{
			self stats::function_dad108fa(#"hash_760e917a4024491a", 1);
		}
	}
	if(isdefined(level.var_c8de519d) && isdefined(level.var_c8de519d.var_ec391d55))
	{
		self [[level.var_c8de519d.var_ec391d55]](weapon, playercontrolled, groundbased, countaskillstreakvehicle);
	}
	self thread watchforrapiddestroy(weapon);
}

/*
	Name: function_24db0c33
	Namespace: challenges
	Checksum: 0x7461DE01
	Offset: 0x40A8
	Size: 0x21C
	Parameters: 2
	Flags: Linked
*/
function function_24db0c33(weapon, destroyedobject)
{
	weaponclass = util::getweaponclass(weapon);
	weaponpickedup = 0;
	if(isdefined(self.pickedupweapons) && isdefined(self.pickedupweapons[weapon]))
	{
		weaponpickedup = 1;
	}
	self stats::function_eec52333(weapon, #"destroyed", 1, self.class_num, weaponpickedup);
	if(self function_6c32d092(#"talent_engineer"))
	{
		self stats::function_dad108fa(#"hash_481f9ede13340c00", 1);
	}
	if(isdefined(weaponclass) && weaponclass == #"weapon_launcher")
	{
		self stats::function_dad108fa(#"hash_be93d1227e6db1", 1);
		if(isdefined(weapon.attachments) && weapon.attachments.size > 0)
		{
			if(self weaponhasattachmentandunlocked(weapon, "fastreload"))
			{
				self stats::function_dad108fa(#"hash_4b19afce40dfc918", 1);
			}
		}
	}
	if(destroyedobject.var_62c1bfaa === 1)
	{
		if(isdefined(weapon) && weapon.isbulletweapon && (sessionmodeismultiplayergame() || function_f99d2668()))
		{
			self stats::function_dad108fa(#"hash_6cc53905c5a9ce6f", 1);
		}
	}
}

/*
	Name: watchforrapiddestroy
	Namespace: challenges
	Checksum: 0xF7062A36
	Offset: 0x42D0
	Size: 0xBC
	Parameters: 1
	Flags: Linked
*/
function watchforrapiddestroy(weapon)
{
	self endon(#"disconnect");
	if(!isdefined(self.challenge_previousdestroyweapon) || self.challenge_previousdestroyweapon != weapon)
	{
		self.challenge_previousdestroyweapon = weapon;
		self.challenge_previousdestroycount = 0;
	}
	else
	{
		self.challenge_previousdestroycount++;
	}
	self waittilltimeoutordeath(4);
	if(self.challenge_previousdestroycount > 1)
	{
		self stats::function_e24eec31(weapon, #"destroy_2_killstreaks_rapidly", 1);
	}
}

/*
	Name: function_783313d8
	Namespace: challenges
	Checksum: 0x7DC6BA11
	Offset: 0x4398
	Size: 0xB6
	Parameters: 1
	Flags: None
*/
function function_783313d8(player)
{
	player.var_7998aa31 = undefined;
	if(player isinvehicle())
	{
		vehicle = player getvehicleoccupied();
		var_ef743cda = (isdefined(vehicle player_vehicle::get_vehicle_driver()) ? vehicle player_vehicle::get_vehicle_driver() : vehicle.var_735382e);
	}
	else
	{
		var_ef743cda = player.var_c0f5ab51;
	}
	if(isdefined(var_ef743cda))
	{
		player.var_7998aa31 = var_ef743cda;
	}
}

/*
	Name: capturedobjective
	Namespace: challenges
	Checksum: 0x462B296E
	Offset: 0x4458
	Size: 0x3B6
	Parameters: 2
	Flags: None
*/
function capturedobjective(capturetime, objective)
{
	if(isdefined(self.smokegrenadetime) && isdefined(self.smokegrenadeposition))
	{
		if(self.smokegrenadetime + 14000 > capturetime)
		{
			distsq = distancesquared(self.smokegrenadeposition, self.origin);
			if(distsq < 57600)
			{
				if(self util::is_item_purchased(#"willy_pete"))
				{
					scoreevents::processscoreevent(#"hash_1782d884df525a0e", self);
				}
				self stats::function_622feb0d(#"willy_pete", #"hash_7542f0d7d9ea6e78", 1);
				self stats::function_6fb0b113(#"willy_pete", #"hash_434a5a95d07bf751");
				self stats::function_622feb0d(#"willy_pete", #"hash_45ef9ed5d55c6e43", 1);
			}
		}
	}
	if(isdefined(level.var_30c87520))
	{
		var_e059391f = self [[level.var_30c87520]](self.team);
		if(isdefined(var_e059391f.owner))
		{
			var_e059391f.owner stats::function_622feb0d(#"willy_pete", #"hash_52fbd3f855752244", 1);
		}
	}
	if(isdefined(objective))
	{
		if(isdefined(level.capturedobjectivefunction) && isdefined(capturetime))
		{
			self [[level.capturedobjectivefunction]](objective, capturetime);
		}
		if(self.challenge_objectivedefensive === objective)
		{
			if((isdefined(self.challenge_objectivedefensivekillcount) ? self.challenge_objectivedefensivekillcount : 0) > 0 && ((isdefined(self.recentkillcount) ? self.recentkillcount : 0) > 2 || self.challenge_objectivedefensivetriplekillmedalorbetterearned === 1))
			{
				self stats::function_dad108fa(#"triple_kill_defenders_and_capture", 1);
			}
			self.challenge_objectivedefensivekillcount = 0;
			self.challenge_objectivedefensive = undefined;
			self.challenge_objectivedefensivetriplekillmedalorbetterearned = undefined;
		}
	}
	if(isdefined(self.var_7998aa31))
	{
		if(self isinvehicle() || (isdefined(self.var_3a76b3aa) && (self.var_3a76b3aa + 5000) >= gettime()))
		{
			if(self.var_7998aa31 == self)
			{
				scoreevents::processscoreevent(#"infil", self);
			}
			else
			{
				scoreevents::processscoreevent(#"hash_18efe678457ab4e9", self.var_7998aa31);
			}
		}
		self.var_7998aa31 = undefined;
	}
	self notify(#"capturedobjective", {#hash_eced93f5:objective, #capturetime:capturetime});
}

/*
	Name: hackedordestroyedequipment
	Namespace: challenges
	Checksum: 0x9255FB37
	Offset: 0x4818
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function hackedordestroyedequipment()
{
	if(self util::has_hacker_perk_purchased_and_equipped())
	{
		self stats::function_dad108fa(#"perk_hacker_destroy", 1);
	}
}

/*
	Name: bladekill
	Namespace: challenges
	Checksum: 0x61A0656
	Offset: 0x4868
	Size: 0xB4
	Parameters: 0
	Flags: None
*/
function bladekill()
{
	if(!isdefined(self.pers[#"bladekills"]))
	{
		self.pers[#"bladekills"] = 0;
	}
	self.pers[#"bladekills"]++;
	if(self.pers[#"bladekills"] >= 15)
	{
		self.pers[#"bladekills"] = 0;
		self stats::function_dad108fa(#"kill_15_with_blade", 1);
	}
}

/*
	Name: destroyedexplosive
	Namespace: challenges
	Checksum: 0xB408DC3A
	Offset: 0x4928
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function destroyedexplosive(weapon)
{
	self destroyedequipment(weapon);
	self stats::function_dad108fa(#"destroy_explosive", 1);
}

/*
	Name: assisted
	Namespace: challenges
	Checksum: 0xEE74AAE9
	Offset: 0x4980
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function assisted()
{
	self stats::function_dad108fa(#"assist", 1);
}

/*
	Name: earnedmicrowaveassistscore
	Namespace: challenges
	Checksum: 0xB67450A7
	Offset: 0x49B8
	Size: 0xF4
	Parameters: 1
	Flags: None
*/
function earnedmicrowaveassistscore(score)
{
	self stats::function_dad108fa(#"assist_score_microwave_turret", score);
	self stats::function_dad108fa(#"assist_score_killstreak", score);
	self stats::function_e24eec31(getweapon(#"microwave_turret_deploy"), #"assists", 1);
	self stats::function_e24eec31(getweapon(#"microwave_turret_deploy"), #"assist_score", score);
	self contracts::function_a54e2068(#"hash_4840654e4b2597a5", score);
}

/*
	Name: earnedcuavassistscore
	Namespace: challenges
	Checksum: 0x839FC814
	Offset: 0x4AB8
	Size: 0xF4
	Parameters: 1
	Flags: None
*/
function earnedcuavassistscore(score)
{
	self stats::function_dad108fa(#"assist_score_cuav", score);
	self stats::function_dad108fa(#"assist_score_killstreak", score);
	self stats::function_e24eec31(getweapon(#"counteruav"), #"assists", 1);
	self stats::function_e24eec31(getweapon(#"counteruav"), #"assist_score", score);
	self contracts::function_a54e2068(#"hash_4840654e4b2597a5", score);
}

/*
	Name: earneduavassistscore
	Namespace: challenges
	Checksum: 0x74F5AF1C
	Offset: 0x4BB8
	Size: 0xF4
	Parameters: 1
	Flags: None
*/
function earneduavassistscore(score)
{
	self stats::function_dad108fa(#"assist_score_uav", score);
	self stats::function_dad108fa(#"assist_score_killstreak", score);
	self stats::function_e24eec31(getweapon(#"uav"), #"assists", 1);
	self stats::function_e24eec31(getweapon(#"uav"), #"assist_score", score);
	self contracts::function_a54e2068(#"hash_4840654e4b2597a5", score);
}

/*
	Name: earnedsatelliteassistscore
	Namespace: challenges
	Checksum: 0x92BBCE4F
	Offset: 0x4CB8
	Size: 0xF4
	Parameters: 1
	Flags: None
*/
function earnedsatelliteassistscore(score)
{
	self stats::function_dad108fa(#"assist_score_satellite", score);
	self stats::function_dad108fa(#"assist_score_killstreak", score);
	self stats::function_e24eec31(getweapon(#"satellite"), #"assists", 1);
	self stats::function_e24eec31(getweapon(#"satellite"), #"assist_score", score);
	self contracts::function_a54e2068(#"hash_4840654e4b2597a5", score);
}

/*
	Name: earnedempassistscore
	Namespace: challenges
	Checksum: 0x430985B1
	Offset: 0x4DB8
	Size: 0xF4
	Parameters: 1
	Flags: None
*/
function earnedempassistscore(score)
{
	self stats::function_dad108fa(#"assist_score_emp", score);
	self stats::function_dad108fa(#"assist_score_killstreak", score);
	self stats::function_e24eec31(getweapon(#"emp_turret"), #"assists", 1);
	self stats::function_e24eec31(getweapon(#"emp_turret"), #"assist_score", score);
	self contracts::function_a54e2068(#"hash_4840654e4b2597a5", score);
}

/*
	Name: teamcompletedchallenge
	Namespace: challenges
	Checksum: 0xB0F7F65F
	Offset: 0x4EB8
	Size: 0x9C
	Parameters: 2
	Flags: Linked
*/
function teamcompletedchallenge(team, challenge)
{
	players = getplayers();
	for(i = 0; i < players.size; i++)
	{
		if(isdefined(players[i].team) && players[i].team == team)
		{
			players[i] stats::function_d40764f3(challenge, 1);
		}
	}
}

/*
	Name: endedearly
	Namespace: challenges
	Checksum: 0xFB41384C
	Offset: 0x4F60
	Size: 0x52
	Parameters: 2
	Flags: Linked
*/
function endedearly(winner, tie)
{
	if(level.hostforcedend)
	{
		return true;
	}
	if(!isdefined(winner))
	{
		return true;
	}
	if(level.teambased)
	{
		if(tie)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: getlosersteamscores
	Namespace: challenges
	Checksum: 0xC5A0E241
	Offset: 0x4FC0
	Size: 0xBC
	Parameters: 1
	Flags: Linked
*/
function getlosersteamscores(winner)
{
	teamscores = 0;
	foreach(_ in level.teams)
	{
		if(team == winner)
		{
			continue;
		}
		teamscores = teamscores + game.stat[#"teamscores"][team];
	}
	return teamscores;
}

/*
	Name: didloserfailchallenge
	Namespace: challenges
	Checksum: 0x76E652AB
	Offset: 0x5088
	Size: 0xB2
	Parameters: 2
	Flags: None
*/
function didloserfailchallenge(winner, challenge)
{
	foreach(_ in level.teams)
	{
		if(team == winner)
		{
			continue;
		}
		if(game.challenge[team][challenge])
		{
			return false;
		}
	}
	return true;
}

/*
	Name: challengegameend
	Namespace: challenges
	Checksum: 0xBC616637
	Offset: 0x5148
	Size: 0xB6
	Parameters: 1
	Flags: None
*/
function challengegameend(data)
{
	player = data.player;
	winner = data.winner;
	if(endedearly(winner, winner == "tie"))
	{
		return;
	}
	if(level.teambased)
	{
		winnerscore = game.stat[#"teamscores"][winner];
		loserscore = getlosersteamscores(winner);
	}
}

/*
	Name: multikill
	Namespace: challenges
	Checksum: 0x1C75E6C2
	Offset: 0x5208
	Size: 0x218
	Parameters: 2
	Flags: None
*/
function multikill(killcount, weapon)
{
	if(!sessionmodeismultiplayergame() && !function_f99d2668())
	{
		return;
	}
	self stats::function_dad108fa(#"hash_31aba70cdac22dab", 1);
	doublekill = int(killcount / 2);
	if(doublekill > 0)
	{
		if(weapon.isheavyweapon)
		{
			self stats::function_dad108fa(#"multikill_2_with_heroweapon", doublekill);
		}
	}
	triplekill = int(killcount / 3);
	if(triplekill > 0)
	{
		if(isdefined(self.lastkillwheninjured))
		{
			if(self.lastkillwheninjured + 5000 > gettime())
			{
				self stats::function_dad108fa(#"multikill_3_near_death", 1);
			}
		}
		if(weapon.isheavyweapon)
		{
			self stats::function_dad108fa(#"multikill_3_with_heroweapon", triplekill);
		}
	}
	if(isdefined(self.var_ea1458aa))
	{
		if(!isdefined(self.var_ea1458aa.var_e0bfa611))
		{
			self.var_ea1458aa.var_e0bfa611 = 0;
		}
		self.var_ea1458aa.var_e0bfa611++;
		self function_a4db0a4c();
	}
	if(isdefined(level.var_c8de519d.multikill))
	{
		self [[level.var_c8de519d.multikill]](killcount, weapon, globallogic_score::function_3cbc4c6c(weapon.var_2e4a8800));
	}
}

/*
	Name: function_a4db0a4c
	Namespace: challenges
	Checksum: 0xABE59787
	Offset: 0x5428
	Size: 0xAA
	Parameters: 0
	Flags: Linked
*/
function function_a4db0a4c()
{
	if(!isdefined(self.var_ea1458aa.var_e0bfa611))
	{
		return;
	}
	if(!isdefined(self.var_ea1458aa.var_2bad4cbb))
	{
		return;
	}
	if(self.var_ea1458aa.var_e0bfa611 > 0 && self.var_ea1458aa.var_2bad4cbb > 0)
	{
		self stats::function_dad108fa(#"hash_5803a1b332accd42", 1);
		self.var_ea1458aa.var_e0bfa611 = undefined;
		self.var_ea1458aa.var_2bad4cbb = undefined;
	}
}

/*
	Name: domattackermultikill
	Namespace: challenges
	Checksum: 0x39A4F083
	Offset: 0x54E0
	Size: 0x34
	Parameters: 1
	Flags: None
*/
function domattackermultikill(killcount)
{
	self stats::function_d40764f3(#"kill_2_enemies_capturing_your_objective", 1);
}

/*
	Name: totaldomination
	Namespace: challenges
	Checksum: 0x84BD6FA0
	Offset: 0x5520
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function totaldomination(team)
{
	teamcompletedchallenge(team, "control_3_points_3_minutes");
}

/*
	Name: holdflagentirematch
	Namespace: challenges
	Checksum: 0xE365464B
	Offset: 0x5558
	Size: 0xBC
	Parameters: 2
	Flags: None
*/
function holdflagentirematch(team, label)
{
	switch(label)
	{
		case "_a":
		{
			event = "hold_a_entire_match";
			break;
		}
		case "_b":
		{
			event = "hold_b_entire_match";
			break;
		}
		case "_c":
		{
			event = "hold_c_entire_match";
			break;
		}
		default:
		{
			return;
		}
	}
	teamcompletedchallenge(team, event);
}

/*
	Name: function_f96312cb
	Namespace: challenges
	Checksum: 0x9DF2079B
	Offset: 0x5620
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function function_f96312cb()
{
	self stats::function_d40764f3(#"capture_b_first_minute", 1);
}

/*
	Name: controlzoneentirely
	Namespace: challenges
	Checksum: 0x7DF37CFE
	Offset: 0x5658
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function controlzoneentirely(team)
{
	teamcompletedchallenge(team, "control_zone_entirely");
}

/*
	Name: multi_lmg_smg_kill
	Namespace: challenges
	Checksum: 0x93954F1A
	Offset: 0x5690
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function multi_lmg_smg_kill()
{
	self stats::function_dad108fa(#"multikill_3_lmg_or_smg_hip_fire", 1);
}

/*
	Name: killedzoneattacker
	Namespace: challenges
	Checksum: 0x8BAE14A2
	Offset: 0x56C8
	Size: 0x74
	Parameters: 1
	Flags: None
*/
function killedzoneattacker(weapon)
{
	if(weapon.statname == #"planemortar" || weapon.statname == "remote_missile_missile" || weapon.name == #"remote_missile_bomblet")
	{
		self thread updatezonemultikills();
	}
}

/*
	Name: killeddog
	Namespace: challenges
	Checksum: 0xE24F0642
	Offset: 0x5748
	Size: 0x11C
	Parameters: 0
	Flags: None
*/
function killeddog()
{
	origin = self.origin;
	if(level.teambased)
	{
		teammates = function_a1ef346b(self.team);
		foreach(player in teammates)
		{
			if(player == self)
			{
				continue;
			}
			distsq = distancesquared(origin, player.origin);
			if(distsq < 57600)
			{
				self stats::function_dad108fa(#"killed_dog_close_to_teammate", 1);
				break;
			}
		}
	}
}

/*
	Name: updatezonemultikills
	Namespace: challenges
	Checksum: 0xA1097A1D
	Offset: 0x5870
	Size: 0xB6
	Parameters: 0
	Flags: Linked
*/
function updatezonemultikills()
{
	self endon(#"disconnect");
	level endon(#"game_ended");
	self notify(#"updaterecentzonekills");
	self endon(#"updaterecentzonekills");
	if(!isdefined(self.recentzonekillcount))
	{
		self.recentzonekillcount = 0;
	}
	self.recentzonekillcount++;
	wait(4);
	if(self.recentzonekillcount > 1)
	{
		self stats::function_dad108fa(#"multikill_2_zone_attackers", 1);
	}
	self.recentzonekillcount = 0;
}

/*
	Name: multi_rcbomb_kill
	Namespace: challenges
	Checksum: 0xFEF10DD5
	Offset: 0x5930
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function multi_rcbomb_kill()
{
	self stats::function_dad108fa(#"multikill_2_with_rcbomb", 1);
}

/*
	Name: function_46754062
	Namespace: challenges
	Checksum: 0x46C4C115
	Offset: 0x5968
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function function_46754062()
{
	self stats::function_dad108fa(#"hash_709699a31c8f89f7", 1);
}

/*
	Name: multi_remotemissile_kill
	Namespace: challenges
	Checksum: 0x84F0E02
	Offset: 0x59A0
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function multi_remotemissile_kill()
{
	self stats::function_dad108fa(#"multikill_3_remote_missile", 1);
}

/*
	Name: multi_mgl_kill
	Namespace: challenges
	Checksum: 0x734CB511
	Offset: 0x59D8
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function multi_mgl_kill()
{
	self stats::function_dad108fa(#"multikill_3_with_mgl", 1);
}

/*
	Name: immediatecapture
	Namespace: challenges
	Checksum: 0x9B50C2BA
	Offset: 0x5A10
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function immediatecapture()
{
	self stats::function_d40764f3(#"immediate_capture", 1);
}

/*
	Name: killedlastcontester
	Namespace: challenges
	Checksum: 0x920D136D
	Offset: 0x5A48
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function killedlastcontester()
{
	self stats::function_d40764f3(#"contest_then_capture", 1);
}

/*
	Name: bothbombsdetonatewithintime
	Namespace: challenges
	Checksum: 0x6B0FBBAE
	Offset: 0x5A80
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function bothbombsdetonatewithintime()
{
	self stats::function_d40764f3(#"both_bombs_detonate_10_seconds", 1);
}

/*
	Name: calledincarepackage
	Namespace: challenges
	Checksum: 0xF3FECE20
	Offset: 0x5AB8
	Size: 0x7C
	Parameters: 0
	Flags: None
*/
function calledincarepackage()
{
	self.pers[#"carepackagescalled"]++;
	if(self.pers[#"carepackagescalled"] >= 3)
	{
		self stats::function_dad108fa(#"call_in_3_care_packages", 1);
		self.pers[#"carepackagescalled"] = 0;
	}
}

/*
	Name: destroyedhelicopter
	Namespace: challenges
	Checksum: 0x50EC7785
	Offset: 0x5B40
	Size: 0xB4
	Parameters: 5
	Flags: None
*/
function destroyedhelicopter(attacker, weapon, damagetype, playercontrolled, vehicle)
{
	if(!isplayer(attacker))
	{
		return;
	}
	attacker destroyedaircraft(attacker, weapon, playercontrolled, vehicle);
	if(isdefined(damagetype) && (damagetype == "MOD_RIFLE_BULLET" || damagetype == "MOD_PISTOL_BULLET"))
	{
		attacker stats::function_dad108fa(#"destroyed_helicopter_with_bullet", 1);
	}
}

/*
	Name: destroyedqrdrone
	Namespace: challenges
	Checksum: 0xC96ED03A
	Offset: 0x5C00
	Size: 0xCC
	Parameters: 3
	Flags: None
*/
function destroyedqrdrone(damagetype, weapon, drone)
{
	self destroyscorestreak(weapon, 1, 0, 1, drone);
	self stats::function_dad108fa(#"destroy_qrdrone", 1);
	if(damagetype == "MOD_RIFLE_BULLET" || damagetype == "MOD_PISTOL_BULLET")
	{
		self stats::function_dad108fa(#"destroyed_qrdrone_with_bullet", 1);
	}
	self destroyedplayercontrolledaircraft();
}

/*
	Name: destroyedplayercontrolledaircraft
	Namespace: challenges
	Checksum: 0x5569B08F
	Offset: 0x5CD8
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function destroyedplayercontrolledaircraft()
{
	if(self hasperk(#"specialty_noname"))
	{
		self stats::function_dad108fa(#"destroy_helicopter", 1);
	}
}

/*
	Name: destroyedaircraft
	Namespace: challenges
	Checksum: 0x29F58A4
	Offset: 0x5D30
	Size: 0x2E4
	Parameters: 4
	Flags: Linked
*/
function destroyedaircraft(attacker, weapon, playercontrolled, vehicle)
{
	if(!isplayer(attacker))
	{
		return;
	}
	attacker destroyscorestreak(weapon, playercontrolled, 0, 1, vehicle);
	attacker stats::function_dad108fa(#"hash_7a62575cacc70aab", 1);
	attacker contracts::function_a54e2068(#"hash_e8dfae9aa3ccf27");
	if(isdefined(weapon))
	{
		if(weapon.name == #"emp" && attacker util::is_item_purchased(#"killstreak_emp"))
		{
			attacker stats::function_dad108fa(#"destroy_aircraft_with_emp", 1);
		}
		else
		{
			if(weapon.name == #"missile_drone_projectile" || weapon.name == #"missile_drone")
			{
				attacker stats::function_dad108fa(#"destroy_aircraft_with_missile_drone", 1);
			}
			else
			{
				if(weapon.isbulletweapon)
				{
					attacker stats::function_dad108fa(#"shoot_aircraft", 1);
				}
				else if(weapon.statname == #"hash_2de6f2fb4eb1529")
				{
					attacker contracts::function_a54e2068(#"hash_189a19dfebc71184");
				}
			}
		}
	}
	if(attacker util::has_blind_eye_perk_purchased_and_equipped())
	{
		attacker stats::function_dad108fa(#"perk_nottargetedbyairsupport_destroy_aircraft", 1);
	}
	attacker stats::function_dad108fa(#"destroy_aircraft", 1);
	attacker stats::function_dad108fa(#"hash_7dab2161d3681f85", 1);
	if(isdefined(playercontrolled) && playercontrolled == 0)
	{
		if(attacker util::has_blind_eye_perk_purchased_and_equipped())
		{
			attacker stats::function_dad108fa(#"destroy_ai_aircraft_using_blindeye", 1);
		}
	}
}

/*
	Name: killstreakten
	Namespace: challenges
	Checksum: 0x986B269F
	Offset: 0x6020
	Size: 0x1A4
	Parameters: 0
	Flags: None
*/
function killstreakten()
{
	if(!isdefined(self.class_num))
	{
		return;
	}
	primary = self getloadoutitem(self.class_num, "primary");
	if(primary != 0)
	{
		return;
	}
	secondary = self getloadoutitem(self.class_num, "secondary");
	if(secondary != 0)
	{
		return;
	}
	primarygrenade = self getloadoutitem(self.class_num, "primarygrenade");
	if(primarygrenade != 0)
	{
		return;
	}
	specialgrenade = self getloadoutitem(self.class_num, "specialgrenade");
	if(specialgrenade != 0)
	{
		return;
	}
	for(numspecialties = 0; numspecialties < level.maxspecialties; numspecialties++)
	{
		perk = self getloadoutitem(self.class_num, "specialty" + (numspecialties + 1));
		if(perk != 0)
		{
			return;
		}
	}
	self stats::function_dad108fa(#"killstreak_10_no_weapons_perks", 1);
}

/*
	Name: scavengedgrenade
	Namespace: challenges
	Checksum: 0x929660AD
	Offset: 0x61D0
	Size: 0xC0
	Parameters: 1
	Flags: Linked
*/
function scavengedgrenade(weapon)
{
	self endon(#"disconnect", #"death");
	self notify("62107e2f94a16aec");
	self endon("62107e2f94a16aec");
	self callback::callback(#"scavenged_primary_grenade", {#weapon:weapon});
	for(;;)
	{
		self waittill(#"lethalgrenadekill");
		self stats::function_dad108fa(#"kill_with_resupplied_lethal_grenade", 1);
	}
}

/*
	Name: stunnedtankwithempgrenade
	Namespace: challenges
	Checksum: 0x6645620
	Offset: 0x6298
	Size: 0xC
	Parameters: 1
	Flags: None
*/
function stunnedtankwithempgrenade(attacker)
{
}

/*
	Name: playerkilled
	Namespace: challenges
	Checksum: 0x47CFF9A0
	Offset: 0x62B0
	Size: 0x1720
	Parameters: 9
	Flags: None
*/
function playerkilled(einflictor, attacker, idamage, smeansofdeath, weapon, shitloc, attackerstance, bledout, var_f3c114a7)
{
	pixbeginevent();
	self.anglesondeath = self getplayerangles();
	if(isdefined(attacker) && isplayer(attacker))
	{
		attacker.anglesonkill = attacker getplayerangles();
	}
	if(!isdefined(weapon))
	{
		weapon = level.weaponnone;
	}
	self endon(#"disconnect");
	data = spawnstruct();
	data.results = spawnstruct();
	var_5fceefd4 = self getplayerangles();
	victim = self;
	data.victim = victim;
	victim.var_1318544a = data;
	data.victimorigin = self.origin;
	data.var_5fceefd4 = var_5fceefd4;
	data.victimforward = anglestoforward(var_5fceefd4);
	data.victimstance = self getstance();
	data.einflictor = einflictor;
	data.attacker = attacker;
	data.attackerstance = attackerstance;
	data.idamage = idamage;
	data.smeansofdeath = smeansofdeath;
	data.weapon = weapon;
	data.shitloc = shitloc;
	data.time = gettime();
	data.bledout = 0;
	if(isdefined(bledout))
	{
		data.bledout = bledout;
	}
	waslockingon = 0;
	washacked = 0;
	if(isdefined(einflictor))
	{
		if(isdefined(einflictor.lastweaponbeforetoss))
		{
			data.lastweaponbeforetoss = einflictor.lastweaponbeforetoss;
		}
		if(isdefined(einflictor.ownerweaponatlaunch))
		{
			data.ownerweaponatlaunch = einflictor.ownerweaponatlaunch;
		}
		if(isdefined(einflictor.locking_on))
		{
			waslockingon = waslockingon | einflictor.locking_on;
		}
		if(isdefined(einflictor.locked_on))
		{
			waslockingon = waslockingon | einflictor.locked_on;
		}
		washacked = einflictor util::ishacked();
		if(isdefined(einflictor.stucktoplayer) && isdefined(einflictor.originalowner) && einflictor.stucktoplayer == self && einflictor.originalowner == attacker)
		{
			data.var_c274d62f = 1;
		}
	}
	victimentnum = victim getentitynumber();
	waslockingon = waslockingon & (1 << victimentnum);
	if(waslockingon != 0)
	{
		data.waslockingon = 1;
	}
	else
	{
		data.waslockingon = 0;
	}
	data.washacked = washacked;
	data.wasplanting = victim.isplanting;
	data.wasunderwater = victim isplayerunderwater();
	data.var_e828179e = victim depthinwater();
	if(!isdefined(data.wasplanting))
	{
		data.wasplanting = 0;
	}
	data.wasdefusing = victim.isdefusing;
	if(!isdefined(data.wasdefusing))
	{
		data.wasdefusing = 0;
	}
	data.var_f0b3c772 = victim playerads();
	data.var_bd10969 = [];
	if(isarray(self.var_121392a1))
	{
		foreach(effect in self.var_121392a1)
		{
			struct = spawnstruct();
			if(isdefined(effect.var_4f6b79a4))
			{
				struct.var_2e4a8800 = effect.var_4f6b79a4.var_2e4a8800;
			}
			struct.var_4b22e697 = effect.var_4b22e697;
			struct.var_3d1ed4bd = effect.var_3d1ed4bd;
			struct.name = effect.var_3cf2d21;
			if(!isdefined(data.var_bd10969))
			{
				data.var_bd10969 = [];
			}
			else if(!isarray(data.var_bd10969))
			{
				data.var_bd10969 = array(data.var_bd10969);
			}
			data.var_bd10969[data.var_bd10969.size] = struct;
		}
	}
	if(isdefined(victim.var_ea1458aa))
	{
		data.var_6799f1da = victim.var_ea1458aa.var_6799f1da;
	}
	if(isdefined(victim.var_9cd2c51d))
	{
		data.var_70763083 = victim.var_9cd2c51d.var_c54af9a9;
	}
	data.victimweapon = victim.currentweapon;
	data.victimonground = victim isonground();
	data.victimlaststunnedby = victim.laststunnedby;
	data.var_da9749ea = victim.laststunnedtime;
	data.var_642d3a64 = victim.lastfiretime;
	data.victimelectrifiedby = victim.electrifiedby;
	data.victimwasinslamstate = victim isslamming();
	data.victimwaslungingwitharmblades = victim isgadgetmeleecharging();
	data.var_9fb5719b = victim function_90fe764c();
	data.victimwasheatwavestunned = victim isheatwavestunned();
	data.victimpowerarmorlasttookdamagetime = victim.power_armor_last_took_damage_time;
	data.victimgadgetwasactivelastdamage = victim.gadget_was_active_last_damage;
	data.var_893d5683 = victim.var_ae639436;
	data.var_59b78db0 = victim.var_700a5910;
	data.var_59a8c5c7 = victim.var_9cd2c51d.var_a063d754;
	data.var_5fa4aeed = isdefined(victim.lastattackedshieldtime) && (victim.lastattackedshieldtime + 500) > gettime();
	data.var_90795a2c = victim util::function_14e61d05();
	if(isdefined(data.victimweapon))
	{
		slot = victim gadgetgetslot(data.victimweapon);
		if(slot != -1)
		{
			data.victimgadgetpower = victim gadgetpowerget(slot);
		}
	}
	if(isdefined(victim.var_43c0c1a8) && victim.var_43c0c1a8 || (isdefined(victim.var_2118ca55) && victim.var_2118ca55))
	{
		data.var_ab4f5741 = 1;
	}
	data.var_504c7a2f = victim.var_43c0c1a8;
	data.var_7006e4f4 = victim.var_fd0be7bd;
	data.var_af1b39cb = victim.lastflashedby;
	data.var_e020b97e = victim isflashbanged();
	data.var_ac7c0ef7 = victim function_6c32d092(#"talent_resistance");
	data.var_a79760b1 = victim status_effect::function_4617032e(5);
	data.var_dd195b6b = victim.var_a7679005;
	data.var_31310133 = victim.var_7ef2427c;
	data.var_9084d6e = victim status_effect::function_4617032e(2);
	data.var_157f4d3b = victim.var_a010bd8f;
	data.var_f048a359 = victim.var_9060b065;
	var_8e0c4587 = (isdefined(victim getvehicleoccupied()) ? victim getvehicleoccupied() : victim.var_156bf46e);
	if(isdefined(var_8e0c4587) && !var_8e0c4587 isremotecontrol() && !var_8e0c4587.vehicleclass === "artillery")
	{
		if(victim.vehicleposition === 0)
		{
			data.var_8099aa99 = 1;
		}
		else
		{
			var_e082d5c = var_8e0c4587 seatgetweapon(victim.vehicleposition);
			if(is_true(var_e082d5c.var_29d24e37))
			{
				data.var_58ecc225 = 1;
			}
		}
		data.var_89187b46 = 1;
		data.var_8e0c4587 = var_8e0c4587;
	}
	data.var_31d0fbf5 = victim.var_4dcf932b;
	data.var_f91a4dd6 = victim.recentkillcountsameweapon;
	data.var_8e5d0c71 = victim issprinting();
	data.victim_jump_begin = victim.challenge_jump_begin;
	data.victim_jump_end = victim.challenge_jump_end;
	data.victim_swimming_begin = victim.challenge_swimming_begin;
	data.victim_swimming_end = victim.challenge_swimming_end;
	data.victim_slide_begin = victim.challenge_slide_begin;
	data.victim_slide_end = victim.challenge_slide_end;
	data.var_e05c79a4 = isplayer(victim) && victim isplayerswimming();
	if(isdefined(victim.activeproximitygrenades))
	{
		data.victimactiveproximitygrenades = [];
		arrayremovevalue(victim.activeproximitygrenades, undefined);
		foreach(proximitygrenade in victim.activeproximitygrenades)
		{
			proximitygrenadeinfo = spawnstruct();
			proximitygrenadeinfo.origin = proximitygrenade.origin;
			data.victimactiveproximitygrenades[data.victimactiveproximitygrenades.size] = proximitygrenadeinfo;
		}
	}
	if(isdefined(victim.activebouncingbetties))
	{
		data.victimactivebouncingbetties = [];
		arrayremovevalue(victim.activebouncingbetties, undefined);
		foreach(bouncingbetty in victim.activebouncingbetties)
		{
			bouncingbettyinfo = spawnstruct();
			bouncingbettyinfo.origin = bouncingbetty.origin;
			data.victimactivebouncingbetties[data.victimactivebouncingbetties.size] = bouncingbettyinfo;
		}
	}
	data.var_a99236f2 = victim.var_ead9cdbf;
	if(isplayer(attacker))
	{
		data.attackerorigin = attacker.origin;
		data.var_83634238 = attacker.anglesonkill;
		data.attackerforward = anglestoforward(attacker.anglesonkill);
		data.attackeronground = attacker isonground();
		data.var_406186a6 = attacker function_8a220d80();
		data.attackertraversing = attacker istraversing();
		data.attackersliding = attacker issliding();
		data.var_1fa3e8cc = attacker function_104d7b4d();
		data.var_8556c722 = attacker isusingoffhand();
		data.killstreaktype = killstreaks::get_from_weapon(weapon);
		if(weapon.iscarriedkillstreak === 1 && isdefined(attacker.var_8e94d71c[weapon]))
		{
			data.var_18db7a57 = attacker.var_8e94d71c[weapon];
		}
		else
		{
			data.var_18db7a57 = level.var_72df16fd[einflictor.killstreakid];
		}
		data.var_4c540e11 = attacker playerads();
		data.attackerwasflashed = ((isdefined(attacker.flashendtime) ? attacker.flashendtime : 0) + 1200) > gettime() && attacker status_effect::function_3c54ae98(1) < 0.5;
		data.attackerlastflashedby = attacker.lastflashedby;
		data.var_1c4553e5 = attacker.var_ba6bbd30;
		data.var_c3782b05 = (isdefined(attacker.var_23ed81d6) ? attacker.var_23ed81d6 : 0) > gettime() && attacker status_effect::function_3c54ae98(2) < 0.5;
		data.var_c2cdb4a1 = attacker.var_9060b065;
		data.attackerlaststunnedby = attacker.laststunnedby;
		data.attackerlaststunnedtime = attacker.laststunnedtime;
		data.attackerwasconcussed = (isdefined(attacker.concussionendtime) ? attacker.concussionendtime : 0) > gettime();
		data.attackerwasheatwavestunned = attacker isheatwavestunned();
		data.attackerwasunderwater = attacker isplayerunderwater();
		data.attackerlastfastreloadtime = attacker.lastfastreloadtime;
		data.attackerwassliding = attacker issliding();
		data.attackerwassprinting = attacker issprinting();
		data.var_b0985dfc = attacker isholdingbreath();
		data.attackerstance = attacker getstance();
		data.var_911b9b40 = attacker isremotecontrolling();
		data.var_be469b25 = attacker isgrappling() || (isdefined(attacker.var_700a5910) && (attacker.var_700a5910 + 2000) > gettime());
		data.var_a15d12b0 = attacker util::function_14e61d05();
		data.var_2f59a6b8 = attacker hasperk("specialty_equipmentrecharge");
		data.attacker_jump_begin = attacker.challenge_jump_begin;
		data.attacker_jump_end = attacker.challenge_jump_end;
		data.attacker_swimming_begin = attacker.challenge_swimming_begin;
		data.attacker_swimming_end = attacker.challenge_swimming_end;
		data.attacker_slide_begin = attacker.challenge_slide_begin;
		data.attacker_slide_end = attacker.challenge_slide_end;
		data.attacker_sprint_end = attacker.challenge_sprint_end;
		data.var_26aed950 = attacker function_65776b07();
		if(isdefined(level.var_d92c4db3))
		{
			data.var_84f2a49b = attacker [[level.var_d92c4db3]]();
		}
		if(isdefined(level.var_de946e0))
		{
			data.var_18e4956e = attacker [[level.var_de946e0]]();
		}
		if(isdefined(attacker.var_ea1458aa))
		{
			if(isdefined(attacker.var_ea1458aa.var_8f7ff7ed))
			{
				data.var_58b48038 = attacker.var_ea1458aa.var_8f7ff7ed[victimentnum];
			}
		}
		if(isdefined(attacker.var_9cd2c51d))
		{
			data.var_e5241328 = attacker.var_9cd2c51d.var_c54af9a9;
			data.var_cc8f0762 = attacker.var_9cd2c51d.var_6e219f3c;
		}
		if(isdefined(attacker.var_2ba4c892) && isdefined(attacker.var_2ba4c892[victim getentitynumber()]))
		{
			data.var_7117b104 = attacker.var_2ba4c892[victim getentitynumber()];
		}
		data.var_d6553aa9 = attacker function_ac8c1222(victim);
		if(isdefined(level.var_81286410))
		{
			data.var_807875bc = attacker [[level.var_81286410]]();
			data.var_a73da413 = victim.var_e5a19e3d;
			data.var_5f1818be = victim.var_50703880;
			data.var_c23ee432 = victim.var_3ab8ccc9;
			data.var_dbbf805a = victim.var_5550488a;
			data.var_9c16cd22 = victim.var_bb20a522;
			data.var_5d9be0a1 = victim.var_8c3b7f1a;
		}
		var_284da85d = attacker getvehicleoccupied();
		if(isentity(var_284da85d) && !isdefined(getentbynum(var_284da85d getentitynumber())))
		{
			var_284da85d = undefined;
		}
		if(isdefined(var_284da85d) && !isvehicle(var_284da85d))
		{
			var_284da85d = undefined;
		}
		if(isdefined(var_284da85d))
		{
			data.var_4e8a56b1 = 1;
			data.var_ee70dcab = isairborne(var_284da85d);
			data.var_1ebff6a5 = var_284da85d getoccupantseat(attacker);
			data.var_123eada = data.var_1ebff6a5 === var_284da85d.var_260e3593;
			data.var_b840fc2a = var_284da85d.scriptvehicletype;
		}
		if(!isdefined(var_284da85d))
		{
			groundent = attacker getgroundent();
			if(isvehicle(groundent))
			{
				var_284da85d = groundent;
				data.var_3f8dd192 = 1;
			}
		}
		if(isdefined(var_284da85d))
		{
			data.var_8badc7f8 = var_284da85d.isphysicsvehicle;
			data.var_adb68654 = var_284da85d player_vehicle::get_vehicle_driver();
		}
	}
	else
	{
		data.attackeronground = 0;
		data.attackertraversing = 0;
		data.attackersliding = 0;
		data.attackerwasflashed = 0;
		data.attackerwasconcussed = 0;
		data.attackerstance = "stand";
		data.attackerwasunderwater = 0;
		data.attackerwassprinting = 0;
		data.attacker_sprint_end = 0;
	}
	if(isdefined(einflictor))
	{
		if(isdefined(einflictor.iscooked))
		{
			data.inflictoriscooked = einflictor.iscooked;
		}
		else
		{
			data.inflictoriscooked = 0;
		}
		if(isdefined(einflictor.throwback))
		{
			data.var_dc8c6b51 = einflictor.throwback;
			data.var_74f23861 = einflictor.previousowner;
		}
		else
		{
			data.var_dc8c6b51 = 0;
		}
		if(isdefined(einflictor.challenge_hatchettosscount))
		{
			data.inflictorchallenge_hatchettosscount = einflictor.challenge_hatchettosscount;
		}
		else
		{
			data.inflictorchallenge_hatchettosscount = 0;
		}
		if(isdefined(einflictor.ownerwassprinting))
		{
			data.inflictorownerwassprinting = einflictor.ownerwassprinting;
		}
		else
		{
			data.inflictorownerwassprinting = 0;
		}
		if(isdefined(einflictor.playerhasengineerperk))
		{
			data.inflictorplayerhasengineerperk = einflictor.playerhasengineerperk;
		}
		else
		{
			data.inflictorplayerhasengineerperk = 0;
		}
	}
	else
	{
		data.inflictoriscooked = 0;
		data.inflictorchallenge_hatchettosscount = 0;
		data.inflictorownerwassprinting = 0;
		data.inflictorplayerhasengineerperk = 0;
	}
	if(level.var_268c70a7 === 1)
	{
		data.var_91610392 = attacker.isbombcarrier === 1 || (isdefined(attacker.touchtriggers) && attacker.touchtriggers.size > 0);
		data.var_30db4425 = victim.isbombcarrier === 1 || (isdefined(victim.touchtriggers) && victim.touchtriggers.size > 0);
	}
	pixendevent();
	if(var_f3c114a7 === 1)
	{
		return data;
	}
	waitandprocessplayerkilledcallback(data);
	if(isdefined(attacker))
	{
		attacker notify(#"playerkilledchallengesprocessed");
	}
}

/*
	Name: function_ee74d44
	Namespace: challenges
	Checksum: 0x66BBBE84
	Offset: 0x79D8
	Size: 0x70
	Parameters: 2
	Flags: None
*/
function function_ee74d44(data, bledout)
{
	attacker = data.attacker;
	if(isdefined(bledout))
	{
		data.bledout = bledout;
	}
	waitandprocessplayerkilledcallback(data);
	if(isdefined(attacker))
	{
		attacker notify(#"playerkilledchallengesprocessed");
	}
}

/*
	Name: waitandprocessplayerkilledcallback
	Namespace: challenges
	Checksum: 0x773FE345
	Offset: 0x7A50
	Size: 0x12C
	Parameters: 1
	Flags: Linked
*/
function waitandprocessplayerkilledcallback(data)
{
	if(isdefined(data.attacker))
	{
		data.attacker endon(#"disconnect");
	}
	level thread telemetry::function_18135b72(#"hash_6602db5bc859fcd9", data);
	waitframe(1);
	util::waittillslowprocessallowed();
	if(isdefined(data.weapon) && data.weapon != level.weaponnone && isdefined(data.attacker) && isplayer(data.attacker))
	{
		level thread dochallengecallback("playerKilled", data);
	}
	level thread scoreevents::doscoreeventcallback("playerKilled", data);
	level thread telemetry::function_18135b72(#"hash_fc0d1250fc48d49", data);
}

/*
	Name: function_730144c6
	Namespace: challenges
	Checksum: 0x479FE057
	Offset: 0x7B88
	Size: 0x94
	Parameters: 1
	Flags: Linked
*/
function function_730144c6(data)
{
	if(isdefined(data.attacker))
	{
		data.attacker endon(#"disconnect");
	}
	level thread telemetry::function_18135b72(#"hash_6602db5bc859fcd9", data);
	waitframe(1);
	util::waittillslowprocessallowed();
	level thread telemetry::function_18135b72(#"hash_fc0d1250fc48d49", data);
}

/*
	Name: function_c3b411f6
	Namespace: challenges
	Checksum: 0xC4E7D048
	Offset: 0x7C28
	Size: 0x130
	Parameters: 1
	Flags: None
*/
function function_c3b411f6(smeansofdeath)
{
	attacker = self;
	data = spawnstruct();
	data.results = spawnstruct();
	data.suicide = 1;
	victim = self;
	data.victim = victim;
	var_5fceefd4 = self getplayerangles();
	data.victimorigin = self.origin;
	data.var_5fceefd4 = var_5fceefd4;
	data.victimstance = victim getstance();
	data.var_f0b3c772 = victim playerads();
	data.smeansofdeath = smeansofdeath;
	data.victimweapon = victim.currentweapon;
	function_730144c6(data);
	if(isdefined(attacker))
	{
		attacker notify(#"playerkilledchallengesprocessed");
	}
}

/*
	Name: function_cbfdab8f
	Namespace: challenges
	Checksum: 0x8DF81713
	Offset: 0x7D60
	Size: 0x1C8
	Parameters: 8
	Flags: None
*/
function function_cbfdab8f(einflictor, attacker, idamage, smeansofdeath, weapon, shitloc, attackerstance, bledout)
{
	data = spawnstruct();
	data.results = spawnstruct();
	data.var_b845651e = 1;
	var_5fceefd4 = self getplayerangles();
	victim = self;
	data.victim = victim;
	data.victimorigin = self.origin;
	data.var_5fceefd4 = var_5fceefd4;
	data.victimstance = victim getstance();
	data.var_f0b3c772 = victim playerads();
	data.smeansofdeath = weapon;
	data.weapon = shitloc;
	data.shitloc = attackerstance;
	data.time = gettime();
	data.victimweapon = victim.currentweapon;
	data.einflictor = idamage;
	data.attacker = smeansofdeath;
	data.attackerstance = bledout;
	if(isdefined(smeansofdeath))
	{
		data.var_4c540e11 = smeansofdeath playerads();
	}
	function_730144c6(data);
	if(isdefined(smeansofdeath))
	{
		smeansofdeath notify(#"playerkilledchallengesprocessed");
	}
}

/*
	Name: weaponisknife
	Namespace: challenges
	Checksum: 0x67F832F5
	Offset: 0x7F30
	Size: 0x66
	Parameters: 1
	Flags: None
*/
function weaponisknife(weapon)
{
	if(weapon == level.weaponbasemelee || weapon == level.weaponbasemeleeheld || weapon.rootweapon.statname == level.weaponballisticknife.statname)
	{
		return true;
	}
	return false;
}

/*
	Name: eventreceived
	Namespace: challenges
	Checksum: 0x408EE3C6
	Offset: 0x7FA0
	Size: 0x4A2
	Parameters: 1
	Flags: None
*/
function eventreceived(eventname)
{
	self endon(#"disconnect");
	util::waittillslowprocessallowed();
	switch(level.gametype)
	{
		case "tdm":
		{
			if(eventname == "killstreak_10")
			{
				self stats::function_d40764f3(#"killstreak_10", 1);
			}
			else
			{
				if(eventname == "killstreak_15")
				{
					self stats::function_d40764f3(#"killstreak_15", 1);
				}
				else
				{
					if(eventname == "killstreak_20")
					{
						self stats::function_d40764f3(#"killstreak_20", 1);
					}
					else
					{
						if(eventname == "multikill_3")
						{
							self stats::function_d40764f3(#"multikill_3", 1);
						}
						else
						{
							if(eventname == "kill_enemy_who_killed_teammate")
							{
								self stats::function_d40764f3(#"kill_enemy_who_killed_teammate", 1);
							}
							else if(eventname == "kill_enemy_injuring_teammate")
							{
								self stats::function_d40764f3(#"kill_enemy_injuring_teammate", 1);
							}
						}
					}
				}
			}
			break;
		}
		case "dm":
		{
			if(eventname == "killstreak_10")
			{
				self stats::function_d40764f3(#"killstreak_10", 1);
			}
			else
			{
				if(eventname == "killstreak_15")
				{
					self stats::function_d40764f3(#"killstreak_15", 1);
				}
				else
				{
					if(eventname == "killstreak_20")
					{
						self stats::function_d40764f3(#"killstreak_20", 1);
					}
					else if(eventname == "killstreak_30")
					{
						self stats::function_d40764f3(#"killstreak_30", 1);
					}
				}
			}
			break;
		}
		case "sd":
		{
			if(eventname == "defused_bomb_last_man_alive")
			{
				self stats::function_d40764f3(#"defused_bomb_last_man_alive", 1);
			}
			else
			{
				if(eventname == "elimination_and_last_player_alive")
				{
					self stats::function_d40764f3(#"elimination_and_last_player_alive", 1);
				}
				else
				{
					if(eventname == "killed_bomb_planter")
					{
						self stats::function_d40764f3(#"killed_bomb_planter", 1);
					}
					else if(eventname == "killed_bomb_defuser")
					{
						self stats::function_d40764f3(#"killed_bomb_defuser", 1);
					}
				}
			}
			break;
		}
		case "ctf":
		{
			if(eventname == "kill_flag_carrier")
			{
				self stats::function_d40764f3(#"kill_flag_carrier", 1);
			}
			else if(eventname == "defend_flag_carrier")
			{
				self stats::function_d40764f3(#"defend_flag_carrier", 1);
			}
			break;
		}
		case "dem":
		{
			if(eventname == "killed_bomb_planter")
			{
				self stats::function_d40764f3(#"killed_bomb_planter", 1);
			}
			else if(eventname == "killed_bomb_defuser")
			{
				self stats::function_d40764f3(#"killed_bomb_defuser", 1);
			}
			break;
		}
		default:
		{
			break;
		}
	}
}

/*
	Name: monitor_player_sprint
	Namespace: challenges
	Checksum: 0xA8E14CD6
	Offset: 0x8450
	Size: 0x8A
	Parameters: 0
	Flags: Linked
*/
function monitor_player_sprint()
{
	self endon(#"disconnect", #"killplayersprintmonitor", #"death");
	self.lastsprinttime = undefined;
	while(true)
	{
		self waittill(#"sprint_begin");
		self waittill(#"sprint_end");
		self.lastsprinttime = gettime();
	}
}

/*
	Name: isflashbanged
	Namespace: challenges
	Checksum: 0x7A421E85
	Offset: 0x84E8
	Size: 0x1E
	Parameters: 0
	Flags: Linked
*/
function isflashbanged()
{
	return isdefined(self.flashendtime) && gettime() < self.flashendtime;
}

/*
	Name: isheatwavestunned
	Namespace: challenges
	Checksum: 0x4226D4EC
	Offset: 0x8510
	Size: 0x1E
	Parameters: 0
	Flags: Linked
*/
function isheatwavestunned()
{
	return isdefined(self._heat_wave_stuned_end) && gettime() < self._heat_wave_stuned_end;
}

/*
	Name: trophy_defense
	Namespace: challenges
	Checksum: 0x2BD06A51
	Offset: 0x8538
	Size: 0x1B4
	Parameters: 2
	Flags: None
*/
function trophy_defense(origin, radius)
{
	if(level.challenge_scorestreaksenabled === 1)
	{
		entities = getdamageableentarray(origin, radius);
		foreach(entity in entities)
		{
			if(isdefined(entity.challenge_isscorestreak))
			{
				self stats::function_dad108fa(#"hash_580b295b38c0ee38", 1);
				break;
			}
			weapon = entity.weapon;
			if(isdefined(weapon))
			{
				should_award = 0;
				if(weapon.var_b76e0a09)
				{
					should_award = 1;
				}
				else if(weapon.var_76ce72e8)
				{
					scoreevents = globallogic_score::function_3cbc4c6c(weapon.var_2e4a8800);
					should_award = isdefined(scoreevents) && scoreevents.var_fcd2ff3a === 1;
				}
				if(should_award)
				{
					self stats::function_dad108fa(#"hash_580b295b38c0ee38", 1);
					break;
				}
			}
		}
	}
}

/*
	Name: waittilltimeoutordeath
	Namespace: challenges
	Checksum: 0x46143403
	Offset: 0x86F8
	Size: 0x26
	Parameters: 1
	Flags: Linked
*/
function waittilltimeoutordeath(timeout)
{
	self endon(#"death");
	wait(timeout);
}

/*
	Name: function_45615fac
	Namespace: challenges
	Checksum: 0x54285CAA
	Offset: 0x8728
	Size: 0x162
	Parameters: 2
	Flags: Linked
*/
function function_45615fac(var_32220397, item_info)
{
	var_20cab030 = tablelookuprownum(var_32220397, 5, item_info.itemgroupname);
	if(isint(var_20cab030) && var_20cab030 != -1 && function_7a600918(item_info.var_3cf2d21))
	{
		row_info = tablelookuprow(var_32220397, var_20cab030);
		var_39cd8305 = row_info[10] === 1;
		if(var_39cd8305)
		{
			var_c358ec1 = self stats::function_1bb1c57c(row_info[6], item_info.var_3cf2d21, row_info[7], #"challengetier");
		}
		else
		{
			var_c358ec1 = self stats::get_stat(row_info[6], item_info.var_3cf2d21, row_info[7], #"challengetier");
		}
		return var_c358ec1 > 0;
	}
	return undefined;
}

/*
	Name: function_b3e4bd8
	Namespace: challenges
	Checksum: 0x1C7E6CBB
	Offset: 0x8898
	Size: 0x16A
	Parameters: 2
	Flags: Linked
*/
function function_b3e4bd8(var_32220397, item_info)
{
	var_326177c1 = tablelookuprownum(var_32220397, 1, #"expert");
	if(isint(var_326177c1) && var_326177c1 != -1 && function_7a600918(item_info.var_3cf2d21))
	{
		row_info = tablelookuprow(var_32220397, var_326177c1);
		var_39cd8305 = row_info[10] === 1;
		if(var_39cd8305)
		{
			var_ebbef18a = self stats::function_1bb1c57c(row_info[6], item_info.var_3cf2d21, row_info[7], #"challengetier");
		}
		else
		{
			var_ebbef18a = self stats::get_stat(row_info[6], item_info.var_3cf2d21, row_info[7], #"challengetier");
		}
		return var_ebbef18a > 0;
	}
	return undefined;
}

/*
	Name: function_4e40694d
	Namespace: challenges
	Checksum: 0xDA5085CE
	Offset: 0x8A10
	Size: 0x184
	Parameters: 2
	Flags: Linked
*/
function function_4e40694d(var_104294f6, eventstruct)
{
	if(!isdefined(eventstruct))
	{
		return;
	}
	if(!isplayer(self))
	{
		return;
	}
	var_9776a65f = self function_b17c1957(eventstruct.item_index) === 1;
	if(!var_9776a65f)
	{
		return;
	}
	item_info = getunlockableiteminfofromindex(eventstruct.item_index, 0);
	if(!isdefined(item_info))
	{
		return;
	}
	if(item_info.itemgroupname == "")
	{
		return;
	}
	var_853b9f7b = self function_45615fac(var_104294f6, item_info);
	if(var_853b9f7b !== 1)
	{
		return;
	}
	var_e6673dba = function_b3e4bd8(var_104294f6, item_info);
	if(var_e6673dba !== 1)
	{
		return;
	}
	weapon = getweapon(item_info.var_3cf2d21);
	if(weapon != level.weaponnone)
	{
		self stats::function_e24eec31(weapon, #"hash_5a2ba340560103b3", 1);
	}
}

/*
	Name: function_d43316bd
	Namespace: challenges
	Checksum: 0xBC952D29
	Offset: 0x8BA0
	Size: 0x174
	Parameters: 2
	Flags: Linked
*/
function function_d43316bd(var_f737f85f, eventstruct)
{
	if(!isplayer(self))
	{
		return;
	}
	var_d0170b84 = tablelookuprownum(var_f737f85f, 1, #"marksman");
	if(var_d0170b84 == -1)
	{
		return;
	}
	var_df333125 = tablelookupcolumnforrow(var_f737f85f, var_d0170b84, 3);
	if(!isint(var_df333125))
	{
		return;
	}
	item_info = getunlockableiteminfofromindex(eventstruct.item_index, 0);
	if(!isdefined(item_info))
	{
		return;
	}
	weapon = getweapon(item_info.var_3cf2d21);
	if(weapon == level.weaponnone)
	{
		return;
	}
	pickedup = isdefined(self.pickedupweapons[weapon]);
	self addrankxp(#"hash_5343520320b2abd6", 2, weapon, self.class_num, var_df333125, pickedup, 1);
}

/*
	Name: function_38ad2427
	Namespace: challenges
	Checksum: 0xD1B305B
	Offset: 0x8D20
	Size: 0x74
	Parameters: 2
	Flags: Linked
*/
function function_38ad2427(var_b7b748b7, amount)
{
	gated = 0;
	if(getdvarint(#"hash_f46d80ea72f539c", 0) != 0)
	{
		gated = 1;
	}
	if(gated)
	{
		return;
	}
	self stats::function_dad108fa(var_b7b748b7, amount);
}

