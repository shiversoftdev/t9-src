#using scripts\zm_common\zm_loadout.gsc;
#using scripts\zm_common\util.gsc;
#using scripts\zm_common\gametypes\spectating.gsc;
#using scripts\zm_common\gametypes\globallogic_player.gsc;
#using scripts\zm_common\gametypes\globallogic.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\player\player_shared.gsc;
#using scripts\core_common\hud_util_shared.gsc;
#using scripts\core_common\hud_message_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace globallogic_ui;

/*
	Name: function_2f26617a
	Namespace: globallogic_ui
	Checksum: 0x5D4A5099
	Offset: 0x120
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_2f26617a()
{
	level notify(651835169);
}

/*
	Name: __init__system__
	Namespace: globallogic_ui
	Checksum: 0x77BA18E3
	Offset: 0x140
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"globallogic_ui", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: globallogic_ui
	Checksum: 0x80F724D1
	Offset: 0x188
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
}

/*
	Name: setupcallbacks
	Namespace: globallogic_ui
	Checksum: 0x8857D635
	Offset: 0x198
	Size: 0x7C
	Parameters: 0
	Flags: None
*/
function setupcallbacks()
{
	level.autoassign = &menuautoassign;
	level.spectator = &menuspectator;
	level.curclass = &zm_loadout::menuclass;
	level.teammenu = &menuteam;
	level.autocontrolplayer = &menuautocontrolplayer;
}

/*
	Name: freegameplayhudelems
	Namespace: globallogic_ui
	Checksum: 0x3C164DD6
	Offset: 0x220
	Size: 0x27C
	Parameters: 0
	Flags: None
*/
function freegameplayhudelems()
{
	/#
		if(isdefined(self.perkicon))
		{
			for(numspecialties = 0; numspecialties < level.maxspecialties; numspecialties++)
			{
				if(isdefined(self.perkicon[numspecialties]))
				{
					self.perkicon[numspecialties] hud::destroyelem();
					self.perkname[numspecialties] hud::destroyelem();
				}
			}
		}
		if(isdefined(self.perkhudelem))
		{
			self.perkhudelem hud::destroyelem();
		}
		if(isdefined(self.killstreakicon))
		{
			if(isdefined(self.killstreakicon[0]))
			{
				self.killstreakicon[0] hud::destroyelem();
			}
			if(isdefined(self.killstreakicon[1]))
			{
				self.killstreakicon[1] hud::destroyelem();
			}
			if(isdefined(self.killstreakicon[2]))
			{
				self.killstreakicon[2] hud::destroyelem();
			}
			if(isdefined(self.killstreakicon[3]))
			{
				self.killstreakicon[3] hud::destroyelem();
			}
			if(isdefined(self.killstreakicon[4]))
			{
				self.killstreakicon[4] hud::destroyelem();
			}
		}
		if(isdefined(self.lowermessage))
		{
			self.lowermessage hud::destroyelem();
		}
		if(isdefined(self.lowertimer))
		{
			self.lowertimer hud::destroyelem();
		}
		if(isdefined(self.proxbar))
		{
			self.proxbar hud::destroyelem();
		}
		if(isdefined(self.proxbartext))
		{
			self.proxbartext hud::destroyelem();
		}
		if(isdefined(self.carryicon))
		{
			self.carryicon hud::destroyelem();
		}
	#/
}

/*
	Name: teamplayercountsequal
	Namespace: globallogic_ui
	Checksum: 0x60DEE5F2
	Offset: 0x4A8
	Size: 0xB6
	Parameters: 1
	Flags: None
*/
function teamplayercountsequal(playercounts)
{
	count = undefined;
	foreach(_ in level.teams)
	{
		if(!isdefined(count))
		{
			count = playercounts[team];
			continue;
		}
		if(count != playercounts[team])
		{
			return false;
		}
	}
	return true;
}

/*
	Name: teamwithlowestplayercount
	Namespace: globallogic_ui
	Checksum: 0xFED1895A
	Offset: 0x568
	Size: 0xC4
	Parameters: 2
	Flags: None
*/
function teamwithlowestplayercount(playercounts, ignore_team)
{
	count = 9999;
	lowest_team = undefined;
	foreach(team, _ in level.teams)
	{
		if(count > ignore_team[team])
		{
			count = ignore_team[team];
			lowest_team = team;
		}
	}
	return lowest_team;
}

/*
	Name: menuautoassign
	Namespace: globallogic_ui
	Checksum: 0xB700D07A
	Offset: 0x638
	Size: 0x564
	Parameters: 1
	Flags: Linked
*/
function menuautoassign(comingfrommenu)
{
	teamkeys = getarraykeys(level.teams);
	assignment = teamkeys[randomint(teamkeys.size)];
	self closemenus();
	if(isdefined(level.forceallallies) && level.forceallallies)
	{
		assignment = #"allies";
	}
	else
	{
		if(level.teambased)
		{
			if(getdvarint(#"party_autoteams", 0) == 1)
			{
				if(level.allow_teamchange && (self.hasspawned || comingfrommenu))
				{
					assignment = "";
				}
				else
				{
					team = getassignedteam(self);
					switch(team)
					{
						case 1:
						{
							assignment = teamkeys[1];
							break;
						}
						case 2:
						{
							assignment = teamkeys[0];
							break;
						}
						case 3:
						{
							assignment = teamkeys[2];
							break;
						}
						case 4:
						{
							if(!isdefined(level.forceautoassign) || !level.forceautoassign)
							{
								return;
							}
						}
						default:
						{
							assignment = "";
							if(isdefined(level.teams[team]))
							{
								assignment = team;
							}
							else if(team == "spectator" && !level.forceautoassign)
							{
								return;
							}
						}
					}
				}
			}
			if(assignment == "" || getdvarint(#"party_autoteams", 0) == 0)
			{
				assignment = #"allies";
			}
			if(assignment == self.pers[#"team"] && (self.sessionstate == "playing" || self.sessionstate == "dead"))
			{
				self beginclasschoice();
				return;
			}
		}
		else if(getdvarint(#"party_autoteams", 0) == 1)
		{
			if(!level.allow_teamchange || (!self.hasspawned && !comingfrommenu))
			{
				team = getassignedteam(self);
				if(isdefined(level.teams[team]))
				{
					assignment = team;
				}
				else if(team == "spectator" && !level.forceautoassign)
				{
					return;
				}
			}
		}
	}
	if(isdefined(self.botteam) && self.botteam != "autoassign")
	{
		assignment = self.botteam;
	}
	if(assignment != self.pers[#"team"] && (self.sessionstate == "playing" || self.sessionstate == "dead"))
	{
		self.switching_teams = 1;
		self.joining_team = assignment;
		self.leaving_team = self.pers[#"team"];
		self suicide();
	}
	self.pers[#"team"] = assignment;
	self.team = assignment;
	self.pers[#"class"] = undefined;
	self.curclass = undefined;
	self.pers[#"weapon"] = undefined;
	self.pers[#"savedmodel"] = undefined;
	self updateobjectivetext();
	self.sessionteam = assignment;
	if(!isalive(self))
	{
		self.statusicon = "hud_status_dead";
	}
	self player::function_466d8a4b(comingfrommenu);
	self notify(#"end_respawn");
	self beginclasschoice();
}

/*
	Name: teamscoresequal
	Namespace: globallogic_ui
	Checksum: 0x95244082
	Offset: 0xBA8
	Size: 0xCC
	Parameters: 0
	Flags: Linked
*/
function teamscoresequal()
{
	score = undefined;
	foreach(_ in level.teams)
	{
		if(!isdefined(score))
		{
			score = getteamscore(team);
			continue;
		}
		if(score != getteamscore(team))
		{
			return false;
		}
	}
	return true;
}

/*
	Name: teamwithlowestscore
	Namespace: globallogic_ui
	Checksum: 0xF4521BDC
	Offset: 0xC80
	Size: 0xBE
	Parameters: 0
	Flags: Linked
*/
function teamwithlowestscore()
{
	score = 99999999;
	lowest_team = undefined;
	foreach(team, _ in level.teams)
	{
		if(score > getteamscore(team))
		{
			lowest_team = team;
		}
	}
	return lowest_team;
}

/*
	Name: pickteamfromscores
	Namespace: globallogic_ui
	Checksum: 0xF1B514E9
	Offset: 0xD48
	Size: 0x7A
	Parameters: 1
	Flags: None
*/
function pickteamfromscores(teams)
{
	assignment = #"allies";
	if(teamscoresequal())
	{
		assignment = teams[randomint(teams.size)];
	}
	else
	{
		assignment = teamwithlowestscore();
	}
	return assignment;
}

/*
	Name: getsplitscreenteam
	Namespace: globallogic_ui
	Checksum: 0x220F39E5
	Offset: 0xDD0
	Size: 0xCA
	Parameters: 0
	Flags: None
*/
function getsplitscreenteam()
{
	for(index = 0; index < level.players.size; index++)
	{
		if(!isdefined(level.players[index]))
		{
			continue;
		}
		if(level.players[index] == self)
		{
			continue;
		}
		if(!self isplayeronsamemachine(level.players[index]))
		{
			continue;
		}
		team = level.players[index].sessionteam;
		if(team != "spectator")
		{
			return team;
		}
	}
	return "";
}

/*
	Name: updateobjectivetext
	Namespace: globallogic_ui
	Checksum: 0xA212B80C
	Offset: 0xEA8
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function updateobjectivetext()
{
	self setclientcgobjectivetext("");
}

/*
	Name: closemenus
	Namespace: globallogic_ui
	Checksum: 0x66C105C2
	Offset: 0xED8
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function closemenus()
{
	self closeingamemenu();
}

/*
	Name: beginclasschoice
	Namespace: globallogic_ui
	Checksum: 0x648F25F6
	Offset: 0xF00
	Size: 0xFC
	Parameters: 1
	Flags: Linked
*/
function beginclasschoice(forcenewchoice)
{
	/#
		assert(isdefined(level.teams[self.pers[#"team"]]));
	#/
	team = self.pers[#"team"];
	self.pers[#"class"] = level.defaultclass;
	self.curclass = level.defaultclass;
	if(self.sessionstate != "playing" && game.state == "playing")
	{
		self thread [[level.spawnclient]]();
	}
	self thread spectating::setspectatepermissionsformachine();
}

/*
	Name: showmainmenuforteam
	Namespace: globallogic_ui
	Checksum: 0x8A06683F
	Offset: 0x1008
	Size: 0x9C
	Parameters: 0
	Flags: None
*/
function showmainmenuforteam()
{
	/#
		assert(isdefined(level.teams[self.pers[#"team"]]));
	#/
	team = self.pers[#"team"];
	self openmenu(game.menu["menu_changeclass_" + level.teams[team]]);
}

/*
	Name: menuautocontrolplayer
	Namespace: globallogic_ui
	Checksum: 0x6A7F0CC2
	Offset: 0x10B0
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function menuautocontrolplayer()
{
	self closemenus();
	if(self.pers[#"team"] != "spectator")
	{
		toggleplayercontrol(self);
	}
}

/*
	Name: menuteam
	Namespace: globallogic_ui
	Checksum: 0xE30F0998
	Offset: 0x1110
	Size: 0x204
	Parameters: 1
	Flags: Linked
*/
function menuteam(team)
{
	self closemenus();
	if(!level.console && !level.allow_teamchange && (isdefined(self.hasdonecombat) && self.hasdonecombat))
	{
		return;
	}
	if(self.pers[#"team"] != team)
	{
		if(level.ingraceperiod && (!isdefined(self.hasdonecombat) || !self.hasdonecombat))
		{
			self.hasspawned = 0;
		}
		if(self.sessionstate == "playing")
		{
			self.switching_teams = 1;
			self.joining_team = team;
			self.leaving_team = self.pers[#"team"];
			self suicide();
		}
		self.pers[#"team"] = team;
		self.team = team;
		self.pers[#"class"] = undefined;
		self.curclass = undefined;
		self.pers[#"weapon"] = undefined;
		self.pers[#"savedmodel"] = undefined;
		self updateobjectivetext();
		self.sessionteam = team;
		self player::function_466d8a4b(1);
		self notify(#"end_respawn");
	}
	self beginclasschoice();
}

/*
	Name: menuspectator
	Namespace: globallogic_ui
	Checksum: 0x17088635
	Offset: 0x1320
	Size: 0x18E
	Parameters: 0
	Flags: Linked
*/
function menuspectator()
{
	self closemenus();
	if(self.pers[#"team"] != "spectator")
	{
		if(isalive(self))
		{
			self.switching_teams = 1;
			self.joining_team = "spectator";
			self.leaving_team = self.pers[#"team"];
			self suicide();
		}
		self.pers[#"team"] = "spectator";
		self.team = "spectator";
		self.pers[#"class"] = undefined;
		self.curclass = undefined;
		self.pers[#"weapon"] = undefined;
		self.pers[#"savedmodel"] = undefined;
		self updateobjectivetext();
		self.sessionteam = "spectator";
		[[level.spawnspectator]]();
		self thread globallogic_player::spectate_player_watcher();
		self notify(#"joined_spectators");
	}
}

/*
	Name: menuclass
	Namespace: globallogic_ui
	Checksum: 0xBDD22B5F
	Offset: 0x14B8
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function menuclass(response)
{
	self closemenus();
}

/*
	Name: removespawnmessageshortly
	Namespace: globallogic_ui
	Checksum: 0x1906F894
	Offset: 0x14E8
	Size: 0x54
	Parameters: 1
	Flags: None
*/
function removespawnmessageshortly(delay)
{
	self endon(#"disconnect");
	waittillframeend();
	self endon(#"end_respawn");
	wait(delay);
	self hud_message::clearlowermessage();
}

/*
	Name: function_bc2eb1b8
	Namespace: globallogic_ui
	Checksum: 0xC301F190
	Offset: 0x1548
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_bc2eb1b8()
{
	self luinotifyevent(#"hash_3ab41287e432bf6c");
}

/*
	Name: function_f8f38932
	Namespace: globallogic_ui
	Checksum: 0xE7234A96
	Offset: 0x1578
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_f8f38932()
{
	self luinotifyevent(#"hash_6994832352c6262b");
}

