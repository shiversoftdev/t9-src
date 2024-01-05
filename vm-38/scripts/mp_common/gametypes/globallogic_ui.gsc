#using scripts\abilities\ability_player.gsc;
#using scripts\mp_common\util.gsc;
#using scripts\mp_common\userspawnselection.gsc;
#using scripts\mp_common\teams\team_assignment.gsc;
#using scripts\mp_common\player\player_loadout.gsc;
#using scripts\mp_common\player\player.gsc;
#using scripts\mp_common\gametypes\globallogic.gsc;
#using scripts\mp_common\draft.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using script_3d703ef87a841fe4;
#using script_45fdb6cec5580007;
#using scripts\core_common\spectating.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\player\player_shared.gsc;
#using scripts\core_common\player\player_role.gsc;
#using scripts\core_common\player\player_loadout.gsc;
#using scripts\core_common\hud_util_shared.gsc;
#using scripts\core_common\hud_message_shared.gsc;
#using script_32c8b5b0eb2854f3;

#namespace globallogic_ui;

/*
	Name: function_839afd8
	Namespace: globallogic_ui
	Checksum: 0x7B6E383A
	Offset: 0x1A0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_839afd8()
{
	level notify(-1957111712);
}

/*
	Name: init
	Namespace: globallogic_ui
	Checksum: 0x80F724D1
	Offset: 0x1C0
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function init()
{
}

/*
	Name: setupcallbacks
	Namespace: globallogic_ui
	Checksum: 0xC4DD1B91
	Offset: 0x1D0
	Size: 0x94
	Parameters: 0
	Flags: Linked
*/
function setupcallbacks()
{
	level.autoassign = &menuautoassign;
	level.spectator = &menuspectator;
	level.curclass = &menuclass;
	level.teammenu = &menuteam;
	level.draftmenu = &menupositiondraft;
	level.autocontrolplayer = &menuautocontrolplayer;
}

/*
	Name: freegameplayhudelems
	Namespace: globallogic_ui
	Checksum: 0x53611123
	Offset: 0x270
	Size: 0x284
	Parameters: 0
	Flags: None
*/
function freegameplayhudelems()
{
	/#
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
		#/
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
	Name: function_34a60b2f
	Namespace: globallogic_ui
	Checksum: 0x1B7E1966
	Offset: 0x500
	Size: 0x100
	Parameters: 2
	Flags: Linked, Private
*/
function private function_34a60b2f(original_team, var_5002c793)
{
	if(!isdefined(original_team) || original_team == #"spectator" || !isdefined(var_5002c793))
	{
		return;
	}
	if(isdefined(game.everexisted) && is_true(game.everexisted[original_team]) && !is_true(game.everexisted[var_5002c793]) && is_true(level.playerlives[original_team]))
	{
		game.everexisted[original_team] = 0;
		level.everexisted[original_team] = 0;
		level.teameliminated[original_team] = 0;
	}
}

/*
	Name: menuautoassign
	Namespace: globallogic_ui
	Checksum: 0x49EBB9E9
	Offset: 0x608
	Size: 0x47C
	Parameters: 3
	Flags: Linked
*/
function menuautoassign(comingfrommenu, var_4c542e39, var_432c77c2)
{
	original_team = self.pers[#"team"];
	self luinotifyevent(#"clear_notification_queue");
	if(level.teambased)
	{
		assignment = teams::function_d22a4fbb(comingfrommenu, var_4c542e39, var_432c77c2);
		if(assignment === self.pers[#"team"] && (self.sessionstate === "playing" || self.sessionstate === "dead"))
		{
			self beginclasschoice(0);
			if(assignment === #"spectator")
			{
				self player::function_6f6c29e(comingfrommenu);
			}
			return;
		}
	}
	else
	{
		assignment = teams::function_b55ab4b3(comingfrommenu, var_4c542e39);
	}
	/#
		assignmentoverride = getdvarstring(#"autoassignteam");
		if(assignmentoverride != "" && (assignmentoverride != #"spectator" || !isbot(self)))
		{
			assignment = assignmentoverride;
		}
	#/
	if(!isdefined(assignment))
	{
		assignment = var_4c542e39;
	}
	/#
		assert(isdefined(assignment));
	#/
	if(assignment === #"spectator" && !level.forceautoassign)
	{
		self teams::function_dc7eaabd(assignment);
		self player::function_6f6c29e(comingfrommenu);
		return;
	}
	if(assignment !== self.pers[#"team"] && (self.sessionstate == "playing" || self.sessionstate == "dead"))
	{
		self.switching_teams = 1;
		self.switchedteamsresetgadgets = 1;
		self.joining_team = assignment;
		self.leaving_team = self.pers[#"team"];
		self suicide();
	}
	self.pers[#"class"] = "";
	self.curclass = "";
	self.pers[#"weapon"] = undefined;
	self.pers[#"savedmodel"] = undefined;
	self teams::function_dc7eaabd(assignment);
	self squads::function_c70b26ea(var_432c77c2);
	distribution = teams::function_7d93567f();
	self updateobjectivetext();
	if(!isalive(self))
	{
		self.statusicon = "hud_status_dead";
	}
	function_34a60b2f(original_team, assignment);
	self player::function_466d8a4b(comingfrommenu, assignment);
	if(level.var_b3c4b7b7 === 1)
	{
		draft::assign_remaining_players(self);
	}
	else
	{
		self notify(#"end_respawn");
		self beginclasschoice(comingfrommenu);
	}
	/#
		self teams::function_58b6d2c9();
	#/
}

/*
	Name: updateobjectivetext
	Namespace: globallogic_ui
	Checksum: 0xF93133C2
	Offset: 0xA90
	Size: 0x1B4
	Parameters: 0
	Flags: Linked
*/
function updateobjectivetext()
{
	if(self.pers[#"team"] == #"spectator" || !isdefined(level.teams[self.pers[#"team"]]))
	{
		self setclientcgobjectivetext("");
		return;
	}
	if(level.scorelimit > 0 || level.roundscorelimit > 0)
	{
		if(isdefined(util::getobjectivescoretext(self.pers[#"team"])))
		{
			self setclientcgobjectivetext(util::getobjectivescoretext(self.pers[#"team"]));
		}
		else
		{
			self setclientcgobjectivetext("");
		}
	}
	else
	{
		if(isdefined(util::getobjectivetext(self.pers[#"team"])))
		{
			self setclientcgobjectivetext(util::getobjectivetext(self.pers[#"team"]));
		}
		else
		{
			self setclientcgobjectivetext("");
		}
	}
}

/*
	Name: closemenus
	Namespace: globallogic_ui
	Checksum: 0xBE3C5628
	Offset: 0xC50
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
	Checksum: 0x90D25914
	Offset: 0xC78
	Size: 0x134
	Parameters: 1
	Flags: Linked
*/
function beginclasschoice(comingfrommenu)
{
	if(isbot(self))
	{
		return;
	}
	if(self.pers[#"team"] == #"spectator")
	{
		return;
	}
	/#
		assert(isdefined(level.teams[self.pers[#"team"]]));
	#/
	team = self.pers[#"team"];
	if(level.disableclassselection == 1 || getdvarint(#"migration_soak", 0) == 1)
	{
		level thread globallogic::updateteamstatus();
		self thread spectating::set_permissions_for_machine();
		return;
	}
	self function_bc2eb1b8();
}

/*
	Name: showmainmenuforteam
	Namespace: globallogic_ui
	Checksum: 0xEB225DDA
	Offset: 0xDB8
	Size: 0x8C
	Parameters: 0
	Flags: Linked
*/
function showmainmenuforteam()
{
	/#
		assert(isdefined(level.teams[self.pers[#"team"]]));
	#/
	team = self.pers[#"team"];
	[[level.spawnspectator]]();
	self draft::open();
}

/*
	Name: menuteam
	Namespace: globallogic_ui
	Checksum: 0xA3E5E625
	Offset: 0xE50
	Size: 0x314
	Parameters: 1
	Flags: Linked
*/
function menuteam(team)
{
	if(!level.console && !level.allow_teamchange && (isdefined(self.hasdonecombat) && self.hasdonecombat))
	{
		return;
	}
	if(self.pers[#"team"] != team)
	{
		function_34a60b2f(self.pers[#"team"], team);
		if(level.ingraceperiod && (!isdefined(self.hasdonecombat) || !self.hasdonecombat))
		{
			self.hasspawned = 0;
		}
		if(self.sessionstate == "playing")
		{
			self.switching_teams = 1;
			self.switchedteamsresetgadgets = 1;
			self.joining_team = team;
			self.leaving_team = self.pers[#"team"];
			self suicide();
		}
		self userspawnselection::closespawnselect();
		self userspawnselection::clearcacheforplayer();
		self luinotifyevent(#"clear_notification_queue");
		self.pers[#"team"] = team;
		self.team = team;
		if(level.var_d1455682.var_67bfde2a === 1)
		{
			var_9168605c = self player_role::function_2a911680();
			player_role::set(var_9168605c, 1);
		}
		self.pers[#"class"] = "";
		self.curclass = "";
		self.pers[#"weapon"] = undefined;
		self.pers[#"savedmodel"] = undefined;
		self updateobjectivetext();
		if(!level.rankedmatch && !level.leaguematch)
		{
			self.sessionstate = "spectator";
		}
		self.sessionteam = team;
		self player::function_466d8a4b(1, team);
		self notify(#"end_respawn");
	}
	self beginclasschoice(1);
}

/*
	Name: menuspectator
	Namespace: globallogic_ui
	Checksum: 0xB9C1DBF4
	Offset: 0x1170
	Size: 0x1D4
	Parameters: 0
	Flags: Linked
*/
function menuspectator()
{
	self closemenus();
	if(self.pers[#"team"] != #"spectator")
	{
		if(isalive(self))
		{
			self.switching_teams = 1;
			self.switchedteamsresetgadgets = 1;
			self.joining_team = #"spectator";
			self.leaving_team = self.pers[#"team"];
			self suicide();
		}
		self.pers[#"team"] = #"spectator";
		self.team = #"spectator";
		self.pers[#"class"] = "";
		self.curclass = "";
		self.pers[#"weapon"] = undefined;
		self.pers[#"savedmodel"] = undefined;
		self updateobjectivetext();
		self.sessionteam = #"spectator";
		[[level.spawnspectator]]();
		self thread player::spectate_player_watcher();
		self player::function_6f6c29e(1);
	}
}

/*
	Name: menuclass
	Namespace: globallogic_ui
	Checksum: 0xD985C2CB
	Offset: 0x1350
	Size: 0x8C0
	Parameters: 4
	Flags: Linked
*/
function menuclass(response, forcedclass, updatecharacterindex, var_632376a3)
{
	if(!isdefined(self.pers[#"team"]) || !isdefined(level.teams[self.pers[#"team"]]))
	{
		return false;
	}
	if(!loadout::function_87bcb1b())
	{
		if(game.state == #"pregame" || game.state == #"playing" && self.sessionstate != "playing")
		{
			self thread [[level.spawnclient]](0);
		}
		return;
	}
	if(!isdefined(updatecharacterindex))
	{
		playerclass = self loadout::function_97d216fa(forcedclass);
	}
	else
	{
		playerclass = updatecharacterindex;
	}
	if(!isdefined(playerclass))
	{
		return false;
	}
	if(is_true(level.disablecustomcac) && issubstr(playerclass, "CLASS_CUSTOM") && isarray(level.classtoclassnum) && level.classtoclassnum.size > 0)
	{
		defaultclasses = [];
		foreach(classname in level.var_8e1db8ee)
		{
			if(issubstr(classname, "CLASS_"))
			{
				defaultclasses[classnum] = classname;
			}
		}
		defaultclasses = getarraykeys(defaultclasses);
		playerclass = level.var_8e1db8ee[defaultclasses[randomint(defaultclasses.size)]];
	}
	if(!isdefined(playerclass))
	{
		return false;
	}
	self loadout::function_d7c205b9(playerclass);
	if(!player_role::is_valid(self player_role::get()))
	{
		characterindex = player_role::function_965ea244();
		self draft::select_character(characterindex, 1);
	}
	if(isdefined(self.pers[#"class"]) && self.pers[#"class"] == playerclass)
	{
		return true;
	}
	self.pers[#"changed_class"] = !isdefined(self.curclass) || self.curclass != playerclass;
	var_8d7a946 = !isdefined(self.curclass) || self.curclass == "";
	self.pers[#"class"] = playerclass;
	self.curclass = playerclass;
	self loadout::function_d7c205b9(playerclass);
	self.pers[#"weapon"] = undefined;
	self notify(#"changed_class");
	if(gamestate::is_game_over())
	{
		return false;
	}
	if(isbot(self))
	{
		self thread [[level.spawnclient]](undefined);
	}
	else if(self.sessionstate != "playing")
	{
		if(self.sessionstate != "spectator")
		{
			if(self isinvehicle())
			{
				return false;
			}
			if(self isremotecontrolling())
			{
				return false;
			}
			if(self isweaponviewonlylinked())
			{
				return false;
			}
		}
		if(self.sessionstate != "dead" || !self.hasspawned)
		{
			timepassed = undefined;
			if(!is_true(level.var_d0252074) || !is_true(self.hasspawned))
			{
				if(isdefined(self.respawntimerstarttime))
				{
					/#
						println(("" + self.name) + "");
					#/
					timepassed = (float(gettime() - self.respawntimerstarttime)) / 1000;
				}
				self thread [[level.spawnclient]](timepassed);
				self.respawntimerstarttime = undefined;
			}
		}
		else if(!var_8d7a946 && self.pers[#"changed_class"] && !is_true(level.var_f46d16f0))
		{
			function_4538a730(playerclass);
		}
	}
	if(self.sessionstate == "playing")
	{
		supplystationclasschange = isdefined(self.usingsupplystation) && self.usingsupplystation;
		self.usingsupplystation = 0;
		if(!is_true(self.var_e8c7d324) && (is_true(level.ingraceperiod) && !is_true(self.hasdonecombat) || is_true(supplystationclasschange) || var_632376a3 === 1 || (self.pers[#"time_played_alive"] < level.graceperiod && !is_true(self.hasdonecombat))))
		{
			self loadout::function_53b62db1(self.pers[#"class"]);
			self.tag_stowed_back = undefined;
			self.tag_stowed_hip = undefined;
			self ability_player::gadgets_save_power(0);
			self loadout::give_loadout(self.pers[#"team"], self.pers[#"class"], var_632376a3);
			self killstreaks::give_owned();
			if(var_632376a3 === 1 && isdefined(level.var_f830a9db))
			{
				self thread [[level.var_f830a9db]]();
			}
		}
		else if(!var_8d7a946 && self.pers[#"changed_class"] && !is_true(level.var_f46d16f0))
		{
			function_4538a730(playerclass);
		}
	}
	level thread globallogic::updateteamstatus();
	self thread spectating::set_permissions_for_machine();
	return true;
}

/*
	Name: function_4538a730
	Namespace: globallogic_ui
	Checksum: 0xA2B45FA8
	Offset: 0x1C18
	Size: 0x5C
	Parameters: 1
	Flags: Linked
*/
function function_4538a730(playerclass)
{
	loadoutindex = self loadout::function_6972fdbb(playerclass);
	self luinotifyevent(#"hash_6b67aa04e378d681", 2, 6, loadoutindex);
}

/*
	Name: menuautocontrolplayer
	Namespace: globallogic_ui
	Checksum: 0x7300BD3D
	Offset: 0x1C80
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function menuautocontrolplayer()
{
	self closemenus();
	if(self.pers[#"team"] != #"spectator")
	{
		toggleplayercontrol(self);
	}
}

/*
	Name: menupositiondraft
	Namespace: globallogic_ui
	Checksum: 0x15F324F9
	Offset: 0x1CE8
	Size: 0x16C
	Parameters: 2
	Flags: Linked
*/
function menupositiondraft(response, intpayload)
{
	if(intpayload == "changecharacter")
	{
		if(self draft::function_904deeb2())
		{
			self player_role::clear();
		}
	}
	else
	{
		if(intpayload == "randomcharacter")
		{
			self player_role::clear();
			draft::assign_remaining_players(self);
			if(!is_true(level.inprematchperiod))
			{
				self draft::close();
				if(!self function_8b1a219a())
				{
					self closeingamemenu();
				}
			}
		}
		else
		{
			if(intpayload == "ready")
			{
				self draft::client_ready();
			}
			else
			{
				if(intpayload == "opendraft")
				{
					self draft::open();
				}
				else if(intpayload == "closedraft")
				{
					self draft::close();
				}
			}
		}
	}
}

/*
	Name: removespawnmessageshortly
	Namespace: globallogic_ui
	Checksum: 0x7195C000
	Offset: 0x1E60
	Size: 0x54
	Parameters: 1
	Flags: Linked
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
	Checksum: 0xED95E369
	Offset: 0x1EC0
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
	Checksum: 0x8C551993
	Offset: 0x1EF0
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_f8f38932()
{
	self luinotifyevent(#"hash_6994832352c6262b");
}

