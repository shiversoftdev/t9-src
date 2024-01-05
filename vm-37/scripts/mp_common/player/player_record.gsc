#using scripts\mp_common\player\player_loadout.gsc;
#using scripts\mp_common\gametypes\globallogic.gsc;
#using scripts\mp_common\gametypes\globallogic_score.gsc;
#using scripts\core_common\persistence_shared.gsc;
#using scripts\core_common\player\player_role.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\player\player_loadout.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\rank_shared.gsc;
#using scripts\core_common\contracts_shared.gsc;
#using scripts\core_common\bb_shared.gsc;

#namespace player_record;

/*
	Name: function_685505ce
	Namespace: player_record
	Checksum: 0xFB892DE0
	Offset: 0x330
	Size: 0x8C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_685505ce(inputarray)
{
	targetstring = "";
	if(!isdefined(inputarray))
	{
		return targetstring;
	}
	for(i = 0; i < inputarray.size; i++)
	{
		if(isdefined(inputarray[i]))
		{
			targetstring = targetstring + inputarray[i];
			if(i != (inputarray.size - 1))
			{
				targetstring = targetstring + ",";
			}
		}
	}
	return targetstring;
}

/*
	Name: function_96d38b95
	Namespace: player_record
	Checksum: 0xB858E7FF
	Offset: 0x3C8
	Size: 0x10AC
	Parameters: 1
	Flags: Linked
*/
function function_96d38b95(result)
{
	if(!isdefined(self) || !isdefined(self.pers))
	{
		return;
	}
	player = self;
	lpselfnum = player getentitynumber();
	lpxuid = player getxuid(1);
	var_18f134e3 = sessionmodeismultiplayergame() && sessionmodeisonlinegame();
	bb::function_e0dfa262(player.name, lpselfnum, lpxuid);
	weeklyacontractid = 0;
	weeklyacontracttarget = 0;
	weeklyacontractcurrent = 0;
	weeklyacontractcompleted = 0;
	weeklybcontractid = 0;
	weeklybcontracttarget = 0;
	weeklybcontractcurrent = 0;
	weeklybcontractcompleted = 0;
	dailycontractid = 0;
	dailycontracttarget = 0;
	dailycontractcurrent = 0;
	dailycontractcompleted = 0;
	specialcontractid = 0;
	specialcontracttarget = 0;
	specialcontractcurent = 0;
	specialcontractcompleted = 0;
	if(isbot(player) || !var_18f134e3)
	{
		currxp = 0;
		prevxp = 0;
	}
	else
	{
		currxp = player rank::getrankxp();
		prevxp = player.pers[#"rankxp"];
		if(globallogic_score::canupdateweaponcontractstats())
		{
			specialcontractid = 1;
			specialcontracttarget = getdvarint(#"weapon_contract_target_value", 100);
			specialcontractcurent = player stats::get_stat(#"weaponcontractdata", #"currentvalue");
			if((isdefined(player stats::get_stat(#"weaponcontractdata", #"completetimestamp")) ? player stats::get_stat(#"weaponcontractdata", #"completetimestamp") : 0) != 0)
			{
				specialcontractcompleted = 1;
			}
		}
	}
	if(var_18f134e3 && !isdefined(prevxp))
	{
		return;
	}
	resultstr = result;
	if(isdefined(player.team) && result == player.team)
	{
		resultstr = #"win";
	}
	else if(result == #"allies" || result == #"axis")
	{
		resultstr = #"lose";
	}
	xpearned = currxp - prevxp;
	perkstr = function_685505ce(player getperks());
	primaryweaponname = #"";
	primaryweaponattachstr = "";
	secondaryweaponname = #"";
	secondaryweaponattachstr = "";
	grenadeprimaryname = #"";
	grenadesecondaryname = #"";
	if(loadout::function_87bcb1b())
	{
		primary_weapon = player loadout::function_18a77b37("primary");
		if(isdefined(primary_weapon))
		{
			primaryweaponname = primary_weapon.name;
			primaryweaponattachstr = function_685505ce(getarraykeys(primary_weapon.attachments));
		}
		secondary_weapon = player loadout::function_18a77b37("secondary");
		if(isdefined(secondary_weapon))
		{
			secondaryweaponname = secondary_weapon.name;
			secondaryweaponattachstr = function_685505ce(getarraykeys(secondary_weapon.attachments));
		}
		loadout = player loadout::get_loadout_slot("primarygrenade");
		if(isdefined(loadout))
		{
			grenadeprimaryname = loadout.weapon.name;
		}
		loadout = player loadout::get_loadout_slot("secondarygrenade");
		if(isdefined(loadout))
		{
			grenadesecondaryname = loadout.weapon.name;
		}
	}
	killstreakstr = "";
	if(isdefined(player.killstreak))
	{
		killstreakstr = function_685505ce(player.killstreak);
	}
	gamelength = float(game.timepassed) / 1000;
	timeplayed = player globallogic::gettotaltimeplayed(gamelength);
	totalkills = player stats::get_stat_global(#"kills");
	totalhits = player stats::get_stat_global(#"hits");
	totaldeaths = player stats::get_stat_global(#"deaths");
	totalwins = player stats::get_stat_global(#"wins");
	totalxp = player stats::get_stat_global(#"rankxp");
	killcount = 0;
	hitcount = 0;
	if(level.mpcustommatch)
	{
		killcount = player.kills;
		hitcount = player.pers[#"shotshit"];
	}
	else
	{
		if(isdefined(player.startkills))
		{
			killcount = totalkills - player.startkills;
		}
		if(isdefined(player.starthits))
		{
			hitcount = totalhits - player.starthits;
		}
	}
	bestscore = "0";
	if(isdefined(player.pers[#"lasthighestscore"]) && player.score > player.pers[#"lasthighestscore"])
	{
		bestscore = "1";
	}
	bestkills = "0";
	if(isdefined(player.pers[#"lasthighestkills"]) && killcount > player.pers[#"lasthighestkills"])
	{
		bestkills = "1";
	}
	totalmatchshots = 0;
	if(isdefined(player.totalmatchshots))
	{
		totalmatchshots = player.totalmatchshots;
	}
	deaths = player.deaths;
	if(deaths == 0)
	{
		deaths = 1;
	}
	kdratio = (player.kills * 1000) / deaths;
	bestkdratio = "0";
	if(isdefined(player.pers[#"lasthighestkdratio"]) && kdratio > player.pers[#"lasthighestkdratio"])
	{
		bestkdratio = "1";
	}
	showcaseweapon = player getplayershowcaseweapon();
	startingteam = 0;
	if(isdefined(player.startingteam))
	{
		startingteam = player.startingteam;
	}
	var_48220f4f = 0;
	if(isdefined(player.team))
	{
		var_48220f4f = player.team;
	}
	var_906bdcf3 = spawnstruct();
	var_906bdcf3.session_mode = currentsessionmode();
	var_906bdcf3.game_type = hash(level.gametype);
	var_906bdcf3.private_match = sessionmodeisprivate();
	var_906bdcf3.esports_flag = level.leaguematch;
	var_906bdcf3.ranked_play_flag = level.arenamatch;
	var_906bdcf3.game_map = util::get_map_name();
	var_906bdcf3.player_xuid = player getxuid(1);
	var_906bdcf3.player_ip = player getipaddress();
	var_906bdcf3.season_pass_owned = player hasseasonpass(0);
	var_906bdcf3.dlc_owned = player getdlcavailable();
	var_906bdcf3.var_3e56d6b9 = startingteam;
	var_906bdcf3.var_8476fd9b = var_48220f4f;
	var_811ed119 = spawnstruct();
	var_811ed119.match_kills = killcount;
	var_811ed119.match_deaths = player.deaths;
	var_811ed119.match_xp = xpearned;
	var_811ed119.match_score = player.score;
	var_811ed119.match_streak = player.pers[#"best_kill_streak"];
	var_811ed119.match_captures = player.pers[#"captures"];
	var_811ed119.match_defends = player.pers[#"defends"];
	var_811ed119.match_headshots = player.pers[#"headshots"];
	var_811ed119.match_longshots = player.pers[#"longshots"];
	var_811ed119.match_objtime = player.pers[#"objtime"];
	var_811ed119.match_plants = player.pers[#"plants"];
	var_811ed119.match_defuses = player.pers[#"defuses"];
	var_811ed119.match_throws = player.pers[#"throws"];
	var_811ed119.match_carries = player.pers[#"carries"];
	var_811ed119.match_returns = player.pers[#"returns"];
	var_811ed119.match_result = resultstr;
	var_811ed119.match_duration = int(timeplayed);
	var_811ed119.match_shots = totalmatchshots;
	var_811ed119.match_hits = hitcount;
	var_811ed119.prestige_max = player.pers[#"plevel"];
	var_811ed119.level_max = player.pers[#"rank"];
	var_811ed119.specialist_kills = player.heavyweaponkillcount;
	var_a14ea2be = spawnstruct();
	var_a14ea2be.player_gender = player getplayergendertype(currentsessionmode());
	var_a14ea2be.specialist_used = function_b14806c6(player player_role::get(), currentsessionmode());
	var_a14ea2be.loadout_perks = perkstr;
	var_a14ea2be.loadout_lethal = grenadeprimaryname;
	var_a14ea2be.loadout_tactical = grenadesecondaryname;
	var_a14ea2be.loadout_scorestreaks = killstreakstr;
	var_a14ea2be.loadout_primary_weapon = primaryweaponname;
	var_a14ea2be.loadout_secondary_weapon = secondaryweaponname;
	var_a14ea2be.loadout_primary_attachments = primaryweaponattachstr;
	var_a14ea2be.loadout_secondary_attachments = secondaryweaponattachstr;
	var_b65d83f5 = spawnstruct();
	var_b65d83f5.best_score = bestscore;
	var_b65d83f5.best_kills = bestkills;
	var_b65d83f5.best_kd = bestkdratio;
	var_b65d83f5.total_kills = totalkills;
	var_b65d83f5.total_deaths = totaldeaths;
	var_b65d83f5.total_wins = totalwins;
	var_b65d83f5.total_xp = totalxp;
	var_6e81e3c3 = spawnstruct();
	var_6e81e3c3.daily_contract_id = dailycontractid;
	var_6e81e3c3.daily_contract_target = dailycontracttarget;
	var_6e81e3c3.daily_contract_current = dailycontractcurrent;
	var_6e81e3c3.daily_contract_completed = dailycontractcompleted;
	var_6e81e3c3.weeklya_contract_id = weeklyacontractid;
	var_6e81e3c3.weeklya_contract_target = weeklyacontracttarget;
	var_6e81e3c3.weeklya_contract_current = weeklyacontractcurrent;
	var_6e81e3c3.weeklya_contract_completed = weeklyacontractcompleted;
	var_6e81e3c3.weeklyb_contract_id = weeklybcontractid;
	var_6e81e3c3.weeklyb_contract_target = weeklybcontracttarget;
	var_6e81e3c3.weeklyb_contract_current = weeklybcontractcurrent;
	var_6e81e3c3.weeklyb_contract_completed = weeklybcontractcompleted;
	var_6e81e3c3.special_contract_id = specialcontractid;
	var_6e81e3c3.special_contract_target = specialcontracttarget;
	var_6e81e3c3.special_contract_curent = specialcontractcurent;
	var_6e81e3c3.special_contract_completed = specialcontractcompleted;
	var_8607894c = spawnstruct();
	var_8607894c.var_3cc73d67 = player function_5d23af5b();
	var_8607894c.specialist_head = player function_44a7328f();
	var_8607894c.specialist_legs = player function_cde23658();
	var_8607894c.var_ef44bb8b = player function_92ea4100();
	var_8607894c.specialist_showcase = showcaseweapon.weapon.name;
	function_92d1707f(#"hash_4c5946fa1191bc64", #"hash_71960e91f80c3365", var_906bdcf3, #"hash_4682ee0eb5071d2", var_811ed119, #"hash_209c80d657442a83", var_a14ea2be, #"hash_43cb38816354c3aa", var_b65d83f5, #"hash_11fcb8f188ed5050", var_6e81e3c3, #"hash_78a6c018d9f82184", var_8607894c);
}

/*
	Name: record_special_move_data_for_life
	Namespace: player_record
	Checksum: 0xB59920DC
	Offset: 0x1480
	Size: 0x204
	Parameters: 1
	Flags: Linked
*/
function record_special_move_data_for_life(killer)
{
	if(!isdefined(self.lastwallrunstarttime) || !isdefined(self.lastdoublejumpstarttime) || !isdefined(self.timespentwallrunninginlife) || !isdefined(self.numberofdoublejumpsinlife) || !isdefined(self.numberofslidesinlife))
	{
		/#
			println("");
		#/
		return;
	}
	if(isdefined(killer))
	{
		if(!isdefined(killer.lastwallrunstarttime) || !isdefined(killer.lastdoublejumpstarttime))
		{
			/#
				println("");
			#/
			return;
		}
		loc_0000156E:
		loc_000015B6:
		matchrecordlogspecialmovedataforlife(self, (isdefined(self.lastswimmingstarttime) ? self.lastswimmingstarttime : 0), self.lastwallrunstarttime, self.lastslidestarttime, self.lastdoublejumpstarttime, (isdefined(self.timespentswimminginlife) ? self.timespentswimminginlife : 0), self.timespentwallrunninginlife, self.numberofdoublejumpsinlife, self.numberofslidesinlife, killer, killer.lastswimmingstarttime, killer.lastwallrunstarttime, (isdefined(killer.lastslidestarttime) ? killer.lastslidestarttime : 0), killer.lastdoublejumpstarttime);
	}
	else
	{
		loc_00001632:
		loc_00001652:
		matchrecordlogspecialmovedataforlife(self, (isdefined(self.lastswimmingstarttime) ? self.lastswimmingstarttime : 0), self.lastwallrunstarttime, (isdefined(self.lastslidestarttime) ? self.lastslidestarttime : 0), self.lastdoublejumpstarttime, (isdefined(self.timespentswimminginlife) ? self.timespentswimminginlife : 0), self.timespentwallrunninginlife, self.numberofdoublejumpsinlife, self.numberofslidesinlife);
	}
}

/*
	Name: record_global_mp_stats_for_player_at_match_start
	Namespace: player_record
	Checksum: 0x30BECE8E
	Offset: 0x1690
	Size: 0x38C
	Parameters: 0
	Flags: Linked
*/
function record_global_mp_stats_for_player_at_match_start()
{
	if(isdefined(level.disablestattracking) && level.disablestattracking == 1)
	{
		return;
	}
	startkills = self stats::get_stat_global(#"kills");
	startdeaths = self stats::get_stat_global(#"deaths");
	startwins = self stats::get_stat_global(#"wins");
	startlosses = self stats::get_stat_global(#"losses");
	starthits = self stats::get_stat_global(#"hits");
	startmisses = self stats::get_stat_global(#"misses");
	starttimeplayedtotal = self stats::get_stat_global(#"time_played_total");
	startscore = self stats::get_stat_global(#"score");
	startprestige = self stats::get_stat_global(#"plevel");
	startunlockpoints = self stats::get_stat(#"unlocks", 0);
	ties = self stats::get_stat_global(#"ties");
	startgamesplayed = (startwins + startlosses) + ties;
	self.startkills = startkills;
	self.starthits = starthits;
	self.totalmatchshots = 0;
	recordplayerstats(self, "start_kills", startkills);
	recordplayerstats(self, "start_deaths", startdeaths);
	recordplayerstats(self, "start_wins", startwins);
	recordplayerstats(self, "start_losses", startlosses);
	recordplayerstats(self, "start_hits", starthits);
	recordplayerstats(self, "start_misses", startmisses);
	recordplayerstats(self, "start_total_time_played_s", starttimeplayedtotal);
	recordplayerstats(self, "start_score", startscore);
	recordplayerstats(self, "start_prestige", startprestige);
	recordplayerstats(self, "start_unlock_points", startunlockpoints);
	recordplayerstats(self, "start_games_played", startgamesplayed);
}

/*
	Name: record_global_mp_stats_for_player_at_match_end
	Namespace: player_record
	Checksum: 0xB3FC3AAD
	Offset: 0x1A28
	Size: 0x364
	Parameters: 0
	Flags: Linked
*/
function record_global_mp_stats_for_player_at_match_end()
{
	if(isdefined(level.disablestattracking) && level.disablestattracking == 1)
	{
		return;
	}
	endkills = self stats::get_stat_global(#"kills");
	enddeaths = self stats::get_stat_global(#"deaths");
	endwins = self stats::get_stat_global(#"wins");
	endlosses = self stats::get_stat_global(#"losses");
	endhits = self stats::get_stat_global(#"hits");
	endmisses = self stats::get_stat_global(#"misses");
	endtimeplayedtotal = self stats::get_stat_global(#"time_played_total");
	endscore = self stats::get_stat_global(#"score");
	endprestige = self stats::get_stat_global(#"plevel");
	endunlockpoints = self stats::get_stat(#"unlocks", 0);
	ties = self stats::get_stat_global(#"ties");
	endgamesplayed = (endwins + endlosses) + ties;
	recordplayerstats(self, "end_kills", endkills);
	recordplayerstats(self, "end_deaths", enddeaths);
	recordplayerstats(self, "end_wins", endwins);
	recordplayerstats(self, "end_losses", endlosses);
	recordplayerstats(self, "end_hits", endhits);
	recordplayerstats(self, "end_misses", endmisses);
	recordplayerstats(self, "end_total_time_played_s", endtimeplayedtotal);
	recordplayerstats(self, "end_score", endscore);
	recordplayerstats(self, "end_prestige", endprestige);
	recordplayerstats(self, "end_unlock_points", endunlockpoints);
	recordplayerstats(self, "end_games_played", endgamesplayed);
}

/*
	Name: record_misc_player_stats
	Namespace: player_record
	Checksum: 0x4748FB3A
	Offset: 0x1D98
	Size: 0x304
	Parameters: 0
	Flags: Linked
*/
function record_misc_player_stats()
{
	if(isdefined(level.disablestattracking) && level.disablestattracking == 1)
	{
		return;
	}
	recordplayerstats(self, "utc_disconnect_time_s", getutc());
	if(isdefined(self.weaponpickupscount))
	{
		recordplayerstats(self, "weaponPickupsCount", self.weaponpickupscount);
	}
	if(isdefined(self.killcamsskipped))
	{
		recordplayerstats(self, "totalKillcamsSkipped", self.killcamsskipped);
	}
	killsdenied = self globallogic_score::getpersstat(#"killsdenied");
	if(isdefined(killsdenied))
	{
		recordplayerstats(self, "killsDenied", killsdenied);
	}
	killsconfirmed = self globallogic_score::getpersstat(#"killsconfirmed");
	if(isdefined(killsconfirmed))
	{
		recordplayerstats(self, "killsConfirmed", killsconfirmed);
	}
	if(self.objtime)
	{
		recordplayerstats(self, "objectiveTime", self.objtime);
	}
	escorts = self globallogic_score::getpersstat(#"escorts");
	if(isdefined(escorts))
	{
		recordplayerstats(self, "escortTime", escorts);
	}
	if(isdefined(level.rankedmatch) && level.rankedmatch && isdefined(self.pers) && isdefined(self.pers[#"summary"]))
	{
		recordplayerstats(self, "challenge_xp", self.pers[#"summary"][#"challenge"]);
		recordplayerstats(self, "score_xp", self.pers[#"summary"][#"score"]);
		recordplayerstats(self, "misc_xp", self.pers[#"summary"][#"misc"]);
	}
}

/*
	Name: function_ea5da381
	Namespace: player_record
	Checksum: 0x2CED342F
	Offset: 0x20A8
	Size: 0x104
	Parameters: 0
	Flags: Linked
*/
function function_ea5da381()
{
	if(!isdefined(self.pers[#"hash_76fbbcf94dab5536"]))
	{
		self persistence::function_acac764e();
	}
	if(sessionmodeiswarzonegame())
	{
		self persistence::set_recent_stat(0, 0, #"placement_team", self.pers[#"placement_team"]);
		self persistence::set_recent_stat(0, 0, #"placement_player", self.pers[#"placement_player"]);
		self persistence::set_recent_stat(0, 0, #"timeplayed", self.timeplayed[#"total"]);
	}
}

/*
	Name: function_7569c0fb
	Namespace: player_record
	Checksum: 0xC628956D
	Offset: 0x21B8
	Size: 0x83A
	Parameters: 0
	Flags: Linked
*/
function function_7569c0fb()
{
	if(!isdefined(self.pers[#"hash_76fbbcf94dab5536"]))
	{
		self persistence::function_acac764e();
	}
	self persistence::set_recent_stat(0, 0, #"valid", 1);
	self persistence::set_recent_stat(0, 0, #"ekia", self.ekia);
	self persistence::set_recent_stat(0, 0, #"deaths", self.deaths);
	self persistence::set_recent_stat(0, 0, #"kills", self.kills);
	self persistence::set_recent_stat(0, 0, #"outcome", self.pers[#"outcome"]);
	self persistence::set_recent_stat(0, 0, #"timeplayed", self.pers[#"totaltimeplayed"]);
	self persistence::set_recent_stat(0, 0, #"score", self.pers[#"score"]);
	self persistence::set_recent_stat(0, 0, #"damage", self.pers[#"damagedone"]);
	self persistence::set_recent_stat(0, 0, #"objectiveekia", self.pers[#"objectiveekia"]);
	self persistence::set_recent_stat(0, 0, #"objectivescore", self.pers[#"objectivescore"]);
	self persistence::set_recent_stat(0, 0, #"objectivedefends", self.pers[#"objectivedefends"]);
	self persistence::set_recent_stat(0, 0, #"objectivetime", self.pers[#"objectivetime"]);
	self function_ea5da381();
	self stats::function_81f5c0fe(self.pers[#"outcome"], 1);
	self stats::function_81f5c0fe(#"timeplayed", self.pers[#"totaltimeplayed"]);
	self stats::function_81f5c0fe(#"gamesplayed", 1);
	switch(level.gametype)
	{
		case "control":
		case "sd":
		case "control_bb":
		case "control_hc":
		case "hash_1f03b546a8317f1d":
		case "hash_2561ffe336f1f9e3":
		case "dom_hc":
		case "dom_bb":
		case "hash_2dee5072d8b3cbe8":
		case "dom_snipe_bb":
		case "hash_35e9174ce58d5bc2":
		case "escort":
		case "fireteam_dirty_bomb":
		case "ctf_bb_hc":
		case "dom":
		case "bounty":
		case "hash_55786ad6106fde1c":
		case "hash_594c4ab1d31aa150":
		case "hash_5a63e4bb11fd4fa8":
		case "hash_5cb44bd4d87aa317":
		case "war":
		case "hash_5fd7317230bb0fac":
		case "dom_bb_hc":
		case "vip":
		case "escort_bb":
		case "hash_7020e89c237486d0":
		case "clean":
		case "clean_bb":
		case "ctf":
		case "sd_bb":
		case "sd_hc":
		case "ctf_hc":
		case "ctf_bb":
		{
			self stats::function_81f5c0fe(#"stat1", self.pers[#"objectivescore"]);
			self stats::function_81f5c0fe(#"stat2", self.ekia);
			break;
		}
		case "koth":
		case "hash_35a6541d081acef5":
		case "koth_bb":
		case "dropkick":
		case "hash_5ad222bb812ce35d":
		{
			self stats::function_81f5c0fe(#"stat1", self.pers[#"objectivetime"]);
			self stats::function_81f5c0fe(#"stat2", self.ekia);
			break;
		}
		case "dm":
		case "conf":
		case "hash_c5acc1898a61b54":
		case "hash_ff071780b17ebd4":
		case "oic":
		case "tdm_bb":
		case "tdm_hc":
		case "conf_hc":
		case "conf_bb":
		case "dm_bb":
		case "tdm_snipe_bb":
		case "tdm":
		case "gunfight":
		case "tdm_bb_hc":
		case "infect":
		{
			self stats::function_81f5c0fe(#"stat1", self.ekia);
			self stats::function_81f5c0fe(#"stat2", self.deaths);
			break;
		}
		default:
		{
			break;
		}
	}
}

