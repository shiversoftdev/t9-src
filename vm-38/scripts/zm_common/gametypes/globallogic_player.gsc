#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_characters.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\zm_common\util.gsc;
#using scripts\zm_common\gametypes\spectating.gsc;
#using scripts\zm_common\gametypes\spawnlogic.gsc;
#using scripts\zm_common\gametypes\spawning.gsc;
#using scripts\zm_common\gametypes\hostmigration.gsc;
#using scripts\zm_common\gametypes\globallogic_utils.gsc;
#using scripts\zm_common\gametypes\globallogic_ui.gsc;
#using scripts\zm_common\gametypes\globallogic_spawn.gsc;
#using scripts\zm_common\gametypes\globallogic_score.gsc;
#using scripts\zm_common\gametypes\globallogic_audio.gsc;
#using scripts\zm_common\gametypes\globallogic.gsc;
#using scripts\core_common\globallogic\globallogic_score.gsc;
#using scripts\core_common\globallogic\globallogic_player.gsc;
#using scripts\weapons\weapon_utils.gsc;
#using scripts\core_common\weapons_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\tweakables_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\player\player_shared.gsc;
#using scripts\core_common\persistence_shared.gsc;
#using scripts\core_common\hud_shared.gsc;
#using scripts\core_common\hud_message_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\demo_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\bb_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace globallogic_player;

/*
	Name: function_cbb60b7b
	Namespace: globallogic_player
	Checksum: 0x963921F7
	Offset: 0x318
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_cbb60b7b()
{
	level notify(-769447035);
}

/*
	Name: freezeplayerforroundend
	Namespace: globallogic_player
	Checksum: 0xC1507B59
	Offset: 0x338
	Size: 0x84
	Parameters: 0
	Flags: Linked
*/
function freezeplayerforroundend()
{
	self hud_message::clearlowermessage();
	self closeingamemenu();
	self val::set(#"round_end", "freezecontrols");
	self val::set(#"round_end", "disablegadgets");
}

/*
	Name: callback_playerconnect
	Namespace: globallogic_player
	Checksum: 0x7DD87D5B
	Offset: 0x3C8
	Size: 0x11CC
	Parameters: 0
	Flags: Linked
*/
function callback_playerconnect()
{
	if(!is_true(level.var_6877b1e9))
	{
		self thread zm::initialblack();
	}
	thread notifyconnecting();
	self.statusicon = "$default";
	self waittill(#"begin");
	if(isdefined(level.reset_clientdvars))
	{
		self [[level.reset_clientdvars]]();
	}
	waittillframeend();
	self.statusicon = "";
	self.guid = self getguid();
	profilelog_begintiming(4, "ship");
	level notify(#"connected", {#player:self});
	demo::reset_actor_bookmark_kill_times();
	callback::callback(#"on_player_connect");
	if(self ishost())
	{
		self thread globallogic::listenforgameend();
	}
	if(!level.splitscreen && !isdefined(self.pers[#"score"]))
	{
		iprintln(#"mp/connected", self);
	}
	self.pers[#"outcome"] = #"loss";
	if(!isdefined(self.pers[#"score"]))
	{
		if(level.onlinegame && gamemodeismode(0) && !zm_utility::is_survival())
		{
			self.pers[#"lasthighestscore"] = self stats::get_stat(#"higheststats", #"highest_score");
			self thread persistence::adjust_recent_stats();
		}
	}
	if(gamemodeismode(0) && !isdefined(self.pers[#"matchesplayedstatstracked"]))
	{
		gamemode = util::getcurrentgamemode();
		self globallogic::incrementmatchcompletionstat(gamemode, "played", "started");
		if(!isdefined(self.pers[#"matcheshostedstatstracked"]) && self islocaltohost())
		{
			self globallogic::incrementmatchcompletionstat(gamemode, "hosted", "started");
			self.pers[#"matcheshostedstatstracked"] = 1;
		}
		self.pers[#"matchesplayedstatstracked"] = 1;
		self thread persistence::upload_stats_soon();
	}
	lpselfnum = self getentitynumber();
	lpguid = self getguid();
	lpxuid = self getxuid(1);
	bb::function_afcc007d(self.name, lpselfnum, lpxuid);
	if(level.forceradar == 1)
	{
		self.pers[#"hasradar"] = 1;
		level.activeuavs[self getentitynumber()] = 1;
	}
	if(level.forceradar == 2)
	{
		self setclientuivisibilityflag("g_compassShowEnemies", level.forceradar);
	}
	else
	{
		self setclientuivisibilityflag("g_compassShowEnemies", 0);
	}
	self setclientplayersprinttime(level.playersprinttime);
	self setclientnumlives((isdefined(level.numlives) ? level.numlives : 1));
	if(isdefined(level.player_stats_init))
	{
		self [[level.player_stats_init]]();
	}
	self.killedplayerscurrent = [];
	if(!isdefined(self.pers[#"best_kill_streak"]))
	{
		self.pers[#"killed_players"] = [];
		self.pers[#"killed_by"] = [];
		self.pers[#"nemesis_tracking"] = [];
		self.pers[#"artillery_kills"] = 0;
		self.pers[#"dog_kills"] = 0;
		self.pers[#"nemesis_name"] = "";
		self.pers[#"nemesis_rank"] = 0;
		self.pers[#"nemesis_rankicon"] = 0;
		self.pers[#"nemesis_xp"] = 0;
		self.pers[#"nemesis_xuid"] = "";
		self.pers[#"best_kill_streak"] = 0;
	}
	if(!isdefined(self.pers[#"music"]))
	{
		self.pers[#"music"] = spawnstruct();
		self.pers[#"music"].spawn = 0;
		self.pers[#"music"].inque = 0;
		self.pers[#"music"].currentstate = "SILENT";
		self.pers[#"music"].previousstate = "SILENT";
		self.pers[#"music"].nextstate = "UNDERSCORE";
		self.pers[#"music"].returnstate = "UNDERSCORE";
	}
	self.leaderdialogqueue = [];
	self.killstreakdialogqueue = [];
	if(!isdefined(self.pers[#"cur_kill_streak"]))
	{
		self.pers[#"cur_kill_streak"] = 0;
	}
	if(!isdefined(self.pers[#"cur_total_kill_streak"]))
	{
		self.pers[#"cur_total_kill_streak"] = 0;
		self setplayercurrentstreak(0);
	}
	if(!isdefined(self.pers[#"totalkillstreakcount"]))
	{
		self.pers[#"totalkillstreakcount"] = 0;
	}
	if(!isdefined(self.pers[#"killstreaksearnedthiskillstreak"]))
	{
		self.pers[#"killstreaksearnedthiskillstreak"] = 0;
	}
	if(isdefined(level.usingscorestreaks) && level.usingscorestreaks && !isdefined(self.pers[#"killstreak_quantity"]))
	{
		self.pers[#"killstreak_quantity"] = [];
	}
	if(isdefined(level.usingscorestreaks) && level.usingscorestreaks && !isdefined(self.pers[#"held_killstreak_ammo_count"]))
	{
		self.pers[#"held_killstreak_ammo_count"] = [];
	}
	self.prevlastkilltime = 0;
	self.lastkilltime = 0;
	self.cur_death_streak = 0;
	self disabledeathstreak();
	self.death_streak = 0;
	self.kill_streak = 0;
	self.gametype_kill_streak = 0;
	self.spawnqueueindex = -1;
	self.deathtime = 0;
	self.lastgrenadesuicidetime = -1;
	self.teamkillsthisround = 0;
	self.killstreak = [];
	player::init_heal(1, 1);
	if(!isdefined(level.livesdonotreset) || !level.livesdonotreset || !isdefined(self.pers[#"lives"]))
	{
		self.pers[#"lives"] = level.numlives;
	}
	if(!level.teambased)
	{
		self.pers[#"team"] = undefined;
	}
	self.hasspawned = 0;
	self.waitingtospawn = 0;
	self.wantsafespawn = 0;
	self.deathcount = 0;
	self.wasaliveatmatchstart = 0;
	if(level.splitscreen)
	{
		setdvar(#"splitscreen_playernum", level.players.size);
	}
	if(game.state == "postgame")
	{
		self.pers[#"needteam"] = 1;
		self.pers[#"team"] = "spectator";
		self.team = "spectator";
		self.sessionteam = "spectator";
		self setclientuivisibilityflag("hud_visible", 0);
		self [[level.spawnintermission]]();
		self closeingamemenu();
		profilelog_endtiming(4, (("gs=" + game.state) + " zom=") + sessionmodeiszombiesgame());
		return;
	}
	if(self istestclient())
	{
		recordplayerstats(self, "is_bot", 1);
	}
	level endon(#"game_ended");
	if(isdefined(level.hostmigrationtimer))
	{
		self thread hostmigration::hostmigrationtimerthink();
	}
	if(level.oldschool)
	{
		self.pers[#"class"] = undefined;
		self.curclass = self.pers[#"class"];
	}
	if(isdefined(self.pers[#"team"]))
	{
		self.team = self.pers[#"team"];
	}
	if(isdefined(self.pers[#"class"]))
	{
		self.curclass = self.pers[#"class"];
	}
	if(!isdefined(self.pers[#"team"]) || isdefined(self.pers[#"needteam"]))
	{
		self.pers[#"needteam"] = undefined;
		self.pers[#"team"] = "spectator";
		self.team = "spectator";
		self.sessionstate = "dead";
		if(isdefined(level.spawnspectator))
		{
			[[level.spawnspectator]]();
		}
		if(isdefined(level.autoassign))
		{
			if(level.rankedmatch)
			{
				[[level.autoassign]](0);
				self thread globallogic_spawn::kickifdontspawn();
			}
			else
			{
				[[level.autoassign]](0);
			}
		}
		if(self.pers[#"team"] == "spectator")
		{
			self.sessionteam = "spectator";
			self thread spectate_player_watcher();
		}
		if(level.teambased)
		{
			self.sessionteam = self.pers[#"team"];
			if(!isalive(self))
			{
				self.statusicon = "hud_status_dead";
			}
			self thread spectating::setspectatepermissions();
		}
	}
	else
	{
		if(self.pers[#"team"] == "spectator")
		{
			if(isdefined(level.spawnspectator))
			{
				[[level.spawnspectator]]();
			}
			self.sessionteam = "spectator";
			self.sessionstate = "spectator";
			self thread spectate_player_watcher();
		}
		else
		{
			self.sessionteam = self.pers[#"team"];
			self.sessionstate = "dead";
			if(isdefined(level.spawnspectator))
			{
				[[level.spawnspectator]]();
			}
			if(globallogic_utils::isvalidclass(self.pers[#"class"]) && isdefined(level.spawnclient))
			{
				self thread [[level.spawnclient]]();
			}
			self thread spectating::setspectatepermissions();
		}
	}
	if(self.sessionteam != "spectator")
	{
		self thread spawning::onspawnplayer_unified(1);
	}
	if(is_true(level.var_e824f826))
	{
		zm_characters::set_character();
	}
	profilelog_endtiming(4, (("gs=" + game.state) + " zom=") + sessionmodeiszombiesgame());
	if(!isdefined(level.players))
	{
		level.players = [];
	}
	else if(!isarray(level.players))
	{
		level.players = array(level.players);
	}
	if(!isinarray(level.players, self))
	{
		level.players[level.players.size] = self;
	}
	globallogic::updateteamstatus();
}

/*
	Name: spectate_player_watcher
	Namespace: globallogic_player
	Checksum: 0x14952DA2
	Offset: 0x15A0
	Size: 0x284
	Parameters: 0
	Flags: Linked
*/
function spectate_player_watcher()
{
	self endon(#"disconnect");
	self.watchingactiveclient = 1;
	while(true)
	{
		if(self.pers[#"team"] != "spectator" || level.gameended)
		{
			self val::reset(#"spectate", "freezecontrols");
			self.watchingactiveclient = 0;
			break;
		}
		else
		{
			/#
				self hud::showperks();
			#/
			if(!level.splitscreen && !level.hardcoremode && getdvarint(#"scr_showperksonspawn", 0) == 1 && game.state != "" && !isdefined(self.perkhudelem))
			{
				if(level.perksenabled == 1)
				{
				}
			}
			count = 0;
			for(i = 0; i < level.players.size; i++)
			{
				if(level.players[i].team != "spectator")
				{
					count++;
					break;
				}
			}
			if(count > 0)
			{
				if(!self.watchingactiveclient)
				{
					self val::reset(#"spectate", "freezecontrols");
					/#
						println("");
					#/
				}
				self.watchingactiveclient = 1;
			}
			if(self.watchingactiveclient)
			{
				if(isdefined(level.onspawnspectator))
				{
					[[level.onspawnspectator]]();
				}
				self val::set(#"spectate", "freezecontrols", 1);
			}
			else
			{
				self.watchingactiveclient = 0;
			}
			wait(0.5);
		}
	}
}

/*
	Name: callback_playermigrated
	Namespace: globallogic_player
	Checksum: 0x204041B5
	Offset: 0x1830
	Size: 0xD0
	Parameters: 0
	Flags: Linked
*/
function callback_playermigrated()
{
	/#
		println((("" + self.name) + "") + gettime());
	#/
	self thread inform_clientvm_of_migration();
	level.hostmigrationreturnedplayercount++;
	if(level.hostmigrationreturnedplayercount >= ((level.players.size * 2) / 3))
	{
		/#
			println("");
		#/
		level notify(#"hostmigration_enoughplayers", isdefined(self.connected) && self.connected);
	}
}

/*
	Name: inform_clientvm_of_migration
	Namespace: globallogic_player
	Checksum: 0xFD35452D
	Offset: 0x1908
	Size: 0x20
	Parameters: 0
	Flags: Linked
*/
function inform_clientvm_of_migration()
{
	self endon(#"disconnect");
	wait(1);
}

/*
	Name: arraytostring
	Namespace: globallogic_player
	Checksum: 0xC237A7A9
	Offset: 0x1930
	Size: 0x74
	Parameters: 1
	Flags: Linked
*/
function arraytostring(inputarray)
{
	targetstring = "";
	for(i = 0; i < inputarray.size; i++)
	{
		targetstring = targetstring + inputarray[i];
		if(i != (inputarray.size - 1))
		{
			targetstring = targetstring + ",";
		}
	}
	return targetstring;
}

/*
	Name: function_7314957c
	Namespace: globallogic_player
	Checksum: 0x44FCCAE5
	Offset: 0x19B0
	Size: 0x61C
	Parameters: 2
	Flags: Linked
*/
function function_7314957c(player, result)
{
	lpselfnum = player getentitynumber();
	lpxuid = player getxuid(1);
	bb::function_e0dfa262(player.name, lpselfnum, lpxuid);
	primaryweaponname = #"";
	primaryweaponattachstr = "";
	secondaryweaponname = #"";
	secondaryweaponattachstr = "";
	if(isdefined(player.primaryloadoutweapon))
	{
		primaryweaponname = player.primaryloadoutweapon.name;
		primaryweaponattachstr = arraytostring(getarraykeys(player.primaryloadoutweapon.attachments));
	}
	if(isdefined(player.secondaryloadoutweapon))
	{
		secondaryweaponname = player.secondaryloadoutweapon.name;
		secondaryweaponattachstr = arraytostring(getarraykeys(player.secondaryloadoutweapon.attachments));
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
	timeplayed = game.timepassed / 1000;
	var_906bdcf3 = spawnstruct();
	var_906bdcf3.match_id = getdemofileid();
	var_906bdcf3.game_variant = "zm";
	var_906bdcf3.game_mode = level.gametype;
	var_906bdcf3.private_match = sessionmodeisprivate();
	var_906bdcf3.game_map = util::get_map_name();
	var_906bdcf3.player_xuid = player getxuid(1);
	var_906bdcf3.player_ip = player getipaddress();
	var_906bdcf3.season_pass_owned = player hasseasonpass(0);
	var_906bdcf3.dlc_owned = player getdlcavailable();
	var_811ed119 = spawnstruct();
	var_811ed119.match_kills = player.kills;
	var_811ed119.match_deaths = player.deaths;
	var_811ed119.match_score = player.score;
	var_811ed119.match_result = resultstr;
	var_811ed119.match_duration = int(timeplayed);
	var_811ed119.match_hits = player.shotshit;
	var_811ed119.match_streak = player player::function_2abc116("best_kill_streak");
	var_811ed119.match_captures = player player::function_2abc116("captures");
	var_811ed119.match_defends = player player::function_2abc116("defends");
	var_811ed119.match_headshots = player player::function_2abc116("headshots");
	var_811ed119.match_longshots = player player::function_2abc116("longshots");
	var_811ed119.prestige_max = player player::function_2abc116("plevel");
	var_811ed119.level_max = player player::function_2abc116("rank");
	var_a14ea2be = spawnstruct();
	var_a14ea2be.player_gender = (isplayer(player) ? player getplayergendertype() : "male");
	var_a14ea2be.loadout_primary_weapon = primaryweaponname;
	var_a14ea2be.loadout_secondary_weapon = secondaryweaponname;
	var_a14ea2be.loadout_primary_attachments = primaryweaponattachstr;
	var_a14ea2be.loadout_secondary_attachments = secondaryweaponattachstr;
	end_match_zm = spawnstruct();
	end_match_zm.money = player.score;
	end_match_zm.zombie_waves = level.round_number;
	end_match_zm.revives = player player::function_2abc116("revives");
	end_match_zm.doors = player player::function_2abc116("doors_purchased");
	end_match_zm.downs = player player::function_2abc116("downs");
	function_92d1707f(#"hash_4c5946fa1191bc64", #"hash_71960e91f80c3365", var_906bdcf3, #"hash_4682ee0eb5071d2", var_811ed119, #"hash_209c80d657442a83", var_a14ea2be, #"end_match_zm", end_match_zm);
}

/*
	Name: callback_playerdisconnect
	Namespace: globallogic_player
	Checksum: 0x9823956E
	Offset: 0x1FD8
	Size: 0x52C
	Parameters: 0
	Flags: Linked
*/
function callback_playerdisconnect()
{
	profilelog_begintiming(5, "ship");
	if(game.state != "postgame" && !level.gameended)
	{
		gamelength = globallogic::getgamelength();
		self globallogic::bbplayermatchend(gamelength, "MP_PLAYER_DISCONNECT", 0);
	}
	arrayremovevalue(level.players, self);
	if(level.splitscreen)
	{
		players = level.players;
		if(players.size <= 1)
		{
			level thread globallogic::forceend();
		}
		setdvar(#"splitscreen_playernum", (isarray(players) ? players.size : 0));
	}
	if(isdefined(self.score) && isdefined(self.pers) && isdefined(self.pers[#"team"]))
	{
		/#
			print((("" + self.pers[#"team"]) + "") + self.score);
		#/
		level.dropteam = level.dropteam + 1;
	}
	if(isdefined(level.onplayerdisconnect))
	{
		[[level.onplayerdisconnect]]();
	}
	lpselfnum = self getentitynumber();
	function_7314957c(self, #"disconnected");
	for(entry = 0; entry < level.players.size; entry++)
	{
		if(level.players[entry] == self)
		{
			while(entry < level.players.size - 1)
			{
				level.players[entry] = level.players[entry + 1];
				entry++;
			}
			level.players[entry] = undefined;
			break;
		}
	}
	for(entry = 0; entry < level.players.size; entry++)
	{
		if(isdefined(level.players[entry].pers[#"killed_players"][self.name]))
		{
			level.players[entry].pers[#"killed_players"][self.name] = undefined;
		}
		if(isdefined(level.players[entry].killedplayerscurrent[self.name]))
		{
			level.players[entry].killedplayerscurrent[self.name] = undefined;
		}
		if(isdefined(level.players[entry].pers[#"killed_by"][self.name]))
		{
			level.players[entry].pers[#"killed_by"][self.name] = undefined;
		}
		if(isdefined(level.players[entry].pers[#"nemesis_tracking"][self.name]))
		{
			level.players[entry].pers[#"nemesis_tracking"][self.name] = undefined;
		}
		if(level.players[entry].pers[#"nemesis_name"] == self.name)
		{
			level.players[entry] choosenextbestnemesis();
		}
	}
	if(level.gameended)
	{
		self globallogic::removedisconnectedplayerfromplacement();
	}
	globallogic::updateteamstatus();
	profilelog_endtiming(5, (("gs=" + game.state) + " zom=") + sessionmodeiszombiesgame());
}

/*
	Name: callback_playermelee
	Namespace: globallogic_player
	Checksum: 0xDF5CB1DC
	Offset: 0x2510
	Size: 0xB4
	Parameters: 8
	Flags: Linked
*/
function callback_playermelee(eattacker, idamage, weapon, vorigin, vdir, boneindex, shieldhit, frombehind)
{
	hit = 1;
	if(level.teambased && self.team == idamage.team)
	{
		if(level.friendlyfire == 0)
		{
			hit = 0;
		}
	}
	self finishmeleehit(idamage, weapon, vorigin, vdir, boneindex, shieldhit, hit, frombehind);
}

/*
	Name: choosenextbestnemesis
	Namespace: globallogic_player
	Checksum: 0x737EA1C7
	Offset: 0x25D0
	Size: 0x234
	Parameters: 0
	Flags: Linked
*/
function choosenextbestnemesis()
{
	nemesisarray = self.pers[#"nemesis_tracking"];
	nemesisarraykeys = getarraykeys(nemesisarray);
	nemesisamount = 0;
	nemesisname = "";
	if(nemesisarraykeys.size > 0)
	{
		for(i = 0; i < nemesisarraykeys.size; i++)
		{
			nemesisarraykey = nemesisarraykeys[i];
			if(nemesisarray[nemesisarraykey] > nemesisamount)
			{
				nemesisname = nemesisarraykey;
				nemesisamount = nemesisarray[nemesisarraykey];
			}
		}
	}
	self.pers[#"nemesis_name"] = nemesisname;
	if(nemesisname != "")
	{
		for(playerindex = 0; playerindex < level.players.size; playerindex++)
		{
			if(level.players[playerindex].name == nemesisname)
			{
				nemesisplayer = level.players[playerindex];
				self.pers[#"nemesis_rank"] = nemesisplayer.pers[#"rank"];
				self.pers[#"nemesis_rankicon"] = nemesisplayer.pers[#"rankxp"];
				self.pers[#"nemesis_xp"] = nemesisplayer.pers[#"prestige"];
				self.pers[#"nemesis_xuid"] = nemesisplayer getxuid();
				break;
			}
		}
	}
	else
	{
		self.pers[#"nemesis_xuid"] = "";
	}
}

/*
	Name: notifyconnecting
	Namespace: globallogic_player
	Checksum: 0x2B53031A
	Offset: 0x2810
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function notifyconnecting()
{
	waittillframeend();
	if(isdefined(self))
	{
		level notify(#"connecting", {#player:self});
		self callback::callback(#"on_player_connecting");
	}
}

/*
	Name: recordactiveplayersendgamematchrecordstats
	Namespace: globallogic_player
	Checksum: 0x7F506AC1
	Offset: 0x2878
	Size: 0xA8
	Parameters: 0
	Flags: Linked
*/
function recordactiveplayersendgamematchrecordstats()
{
	foreach(player in level.players)
	{
		recordplayermatchend(player);
		recordplayerstats(player, "present_at_end", 1);
	}
}

/*
	Name: figureoutfriendlyfire
	Namespace: globallogic_player
	Checksum: 0x606A5758
	Offset: 0x2928
	Size: 0x1E
	Parameters: 2
	Flags: Linked
*/
function figureoutfriendlyfire(victim, attacker)
{
	return level.friendlyfire;
}

/*
	Name: function_b2873ebe
	Namespace: globallogic_player
	Checksum: 0x6CF150F
	Offset: 0x2950
	Size: 0x2E
	Parameters: 0
	Flags: Linked
*/
function function_b2873ebe()
{
	globallogic::updateteamstatus(1);
	self notify(#"death");
}

