#using script_14f4a3c583c77d4b;
#using script_256b8879317373de;
#using script_44b0b8420eabacad;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\hud_message_shared.gsc;
#using scripts\core_common\hud_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\zm_common\gametypes\globallogic.gsc;
#using scripts\zm_common\gametypes\globallogic_audio.gsc;
#using scripts\zm_common\gametypes\globallogic_defaults.gsc;
#using scripts\zm_common\gametypes\globallogic_player.gsc;
#using scripts\zm_common\gametypes\globallogic_score.gsc;
#using scripts\zm_common\gametypes\globallogic_ui.gsc;
#using scripts\zm_common\gametypes\globallogic_utils.gsc;
#using scripts\zm_common\gametypes\hostmigration.gsc;
#using scripts\zm_common\gametypes\spawning.gsc;
#using scripts\zm_common\gametypes\spawnlogic.gsc;
#using scripts\zm_common\gametypes\spectating.gsc;
#using scripts\zm_common\util.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace globallogic_spawn;

/*
	Name: timeuntilspawn
	Namespace: globallogic_spawn
	Checksum: 0x29DEF56B
	Offset: 0x268
	Size: 0xD0
	Parameters: 1
	Flags: Linked
*/
function timeuntilspawn(includeteamkilldelay)
{
	if(level.ingraceperiod && !self.hasspawned)
	{
		return 0;
	}
	respawndelay = 0;
	if(is_true(self.hasspawned))
	{
		result = self [[level.onrespawndelay]]();
		if(isdefined(result))
		{
			respawndelay = result;
		}
		else
		{
			respawndelay = level.playerrespawndelay;
		}
	}
	wavebased = level.waverespawndelay > 0;
	if(wavebased)
	{
		return self timeuntilwavespawn(respawndelay);
	}
	return respawndelay;
}

/*
	Name: allteamshaveexisted
	Namespace: globallogic_spawn
	Checksum: 0x32982263
	Offset: 0x340
	Size: 0x90
	Parameters: 0
	Flags: Linked
*/
function allteamshaveexisted()
{
	foreach(team, _ in level.teams)
	{
		if(!level.everexisted[team])
		{
			return false;
		}
	}
	return true;
}

/*
	Name: mayspawn
	Namespace: globallogic_spawn
	Checksum: 0xBEE17E3A
	Offset: 0x3D8
	Size: 0x192
	Parameters: 0
	Flags: Linked
*/
function mayspawn()
{
	if(isdefined(level.playermayspawn) && !self [[level.playermayspawn]]())
	{
		return false;
	}
	if(level.inovertime)
	{
		return false;
	}
	if(level.playerqueuedrespawn && !isdefined(self.allowqueuespawn) && !level.ingraceperiod && !spawning::usestartspawns())
	{
		return false;
	}
	if(level.numlives)
	{
		if(level.teambased)
		{
			gamehasstarted = allteamshaveexisted();
		}
		else
		{
			gamehasstarted = level.maxplayercount > 1 || (!util::isoneround() && !util::isfirstround());
		}
		if(!is_true(self.pers[#"lives"]) && gamehasstarted)
		{
			return false;
		}
		if(gamehasstarted)
		{
			if(!level.ingraceperiod && !self.hasspawned && !isbot(self))
			{
				return false;
			}
		}
	}
	return true;
}

/*
	Name: timeuntilwavespawn
	Namespace: globallogic_spawn
	Checksum: 0xAD886A04
	Offset: 0x578
	Size: 0x1A4
	Parameters: 1
	Flags: Linked
*/
function timeuntilwavespawn(minimumwait)
{
	earliestspawntime = gettime() + (int(minimumwait * 1000));
	lastwavetime = level.lastwave[self.pers[#"team"]];
	wavedelay = int(level.wavedelay[self.pers[#"team"]] * 1000);
	if(wavedelay == 0)
	{
		return 0;
	}
	framedelay = 50;
	var_e0fb0ad5 = framedelay * (isdefined(self.wavespawnindex) ? self.wavespawnindex : 0);
	elapsed = max(0, (earliestspawntime - lastwavetime) - var_e0fb0ad5);
	numwavespassedearliestspawntime = elapsed / wavedelay;
	numwaves = ceil(numwavespassedearliestspawntime);
	timeofspawn = lastwavetime + (numwaves * wavedelay);
	if(isdefined(self.wavespawnindex))
	{
		timeofspawn = timeofspawn + var_e0fb0ad5;
	}
	return (float(timeofspawn - gettime())) / 1000;
}

/*
	Name: stoppoisoningandflareonspawn
	Namespace: globallogic_spawn
	Checksum: 0xB540EA6A
	Offset: 0x728
	Size: 0x46
	Parameters: 0
	Flags: Linked
*/
function stoppoisoningandflareonspawn()
{
	self endon(#"disconnect");
	self.inpoisonarea = 0;
	self.inburnarea = 0;
	self.inflarevisionarea = 0;
	self.ingroundnapalm = 0;
}

/*
	Name: spawnplayerprediction
	Namespace: globallogic_spawn
	Checksum: 0x650BD918
	Offset: 0x778
	Size: 0xDC
	Parameters: 0
	Flags: Linked
*/
function spawnplayerprediction()
{
	self endon(#"disconnect", #"end_respawn", #"game_ended", #"joined_spectators", #"spawned");
	while(true)
	{
		wait(0.5);
		if(isdefined(level.onspawnplayerunified) && getdvarint(#"scr_disableunifiedspawning", 0) == 0)
		{
			spawning::onspawnplayer_unified(1);
		}
		else
		{
			self [[level.onspawnplayer]](1);
		}
	}
}

/*
	Name: spawnplayer
	Namespace: globallogic_spawn
	Checksum: 0x90723545
	Offset: 0x860
	Size: 0x49C
	Parameters: 0
	Flags: Linked
*/
function spawnplayer()
{
	pixbeginevent();
	self endon(#"disconnect", #"joined_spectators");
	hadspawned = self.hasspawned;
	self player::spawn_player();
	if(is_false(self.hasspawned))
	{
		self.underscorechance = 70;
	}
	self.laststand = undefined;
	self.revivingteammate = 0;
	self.burning = undefined;
	self.nextkillstreakfree = undefined;
	self.activeuavs = 0;
	self.activecounteruavs = 0;
	self.activesatellites = 0;
	self.deathmachinekills = 0;
	self.diedonvehicle = undefined;
	if(is_false(self.wasaliveatmatchstart))
	{
		if(level.ingraceperiod || globallogic_utils::gettimepassed() < 20000)
		{
			self.wasaliveatmatchstart = 1;
		}
	}
	pixbeginevent();
	if(isdefined(level.onspawnplayerunified) && getdvarint(#"scr_disableunifiedspawning", 0) == 0)
	{
		self [[level.onspawnplayerunified]]();
	}
	else
	{
		self [[level.onspawnplayer]](0);
	}
	if(isdefined(level.playerspawnedcb))
	{
		self [[level.playerspawnedcb]]();
	}
	pixendevent();
	pixendevent();
	globallogic::updateteamstatus();
	pixbeginevent();
	self thread stoppoisoningandflareonspawn();
	/#
		assert(globallogic_utils::isvalidclass(self.curclass));
	#/
	self zm_loadout::give_loadout();
	if(level.inprematchperiod)
	{
		self val::set(#"prematch_period", "freezecontrols");
		self val::set(#"prematch_period", "disablegadgets");
		self val::set(#"prematch_period", "disable_weapons");
	}
	else if(!hadspawned && game.state == "playing")
	{
		pixbeginevent();
		team = self.team;
		if(isdefined(self.pers[#"music"].spawn) && self.pers[#"music"].spawn == 0)
		{
			self.pers[#"music"].spawn = 1;
		}
		if(level.splitscreen)
		{
			if(isdefined(level.playedstartingmusic))
			{
				music = undefined;
			}
			else
			{
				level.playedstartingmusic = 1;
			}
		}
		pixendevent();
	}
	/#
		if(!level.splitscreen && getdvarint(#"scr_showperksonspawn", 0) == 1 && game.state != "")
		{
			pixbeginevent();
			if(level.perksenabled == 1)
			{
				self hud::showperks();
			}
			pixendevent();
		}
	#/
	if(isdefined(self.pers[#"momentum"]))
	{
		self.momentum = self.pers[#"momentum"];
	}
	pixendevent();
	self thread function_7455b680();
}

/*
	Name: function_7455b680
	Namespace: globallogic_spawn
	Checksum: 0x5B065BCF
	Offset: 0xD08
	Size: 0x184
	Parameters: 0
	Flags: Linked
*/
function function_7455b680()
{
	self endon(#"disconnect", #"joined_spectators");
	waittillframeend();
	self notify(#"spawned_player");
	self callback::callback(#"on_player_spawned");
	/#
		print(((((("" + self.origin[0]) + "") + self.origin[1]) + "") + self.origin[2]) + "");
	#/
	setdvar(#"scr_selecting_location", "");
	self zm_utility::function_e0448fec();
	if(game.state == "postgame")
	{
		/#
			assert(!level.intermission);
		#/
		self globallogic_player::freezeplayerforroundend();
	}
	self util::set_lighting_state();
	self util::set_sun_shadow_split_distance();
}

/*
	Name: spawnspectator
	Namespace: globallogic_spawn
	Checksum: 0x8C5D6DDC
	Offset: 0xE98
	Size: 0x4C
	Parameters: 2
	Flags: Linked
*/
function spawnspectator(origin, angles)
{
	self notify(#"spawned");
	self notify(#"end_respawn");
	in_spawnspectator(origin, angles);
}

/*
	Name: respawn_asspectator
	Namespace: globallogic_spawn
	Checksum: 0x5237E2C4
	Offset: 0xEF0
	Size: 0x2C
	Parameters: 2
	Flags: Linked
*/
function respawn_asspectator(origin, angles)
{
	in_spawnspectator(origin, angles);
}

/*
	Name: in_spawnspectator
	Namespace: globallogic_spawn
	Checksum: 0xF8A9C260
	Offset: 0xF28
	Size: 0x144
	Parameters: 2
	Flags: Linked
*/
function in_spawnspectator(origin, angles)
{
	pixmarker("BEGIN: in_spawnSpectator");
	self player::set_spawn_variables();
	self.sessionstate = "spectator";
	self.spectatorclient = -1;
	self.killcamentity = -1;
	self.archivetime = 0;
	self.psoffsettime = 0;
	self.friendlydamage = undefined;
	if(self.pers[#"team"] == "spectator")
	{
		self.statusicon = "";
	}
	else
	{
		self.statusicon = "hud_status_dead";
	}
	spectating::setspectatepermissionsformachine();
	[[level.onspawnspectator]](origin, angles);
	if(level.teambased && !level.splitscreen)
	{
		self thread spectatorthirdpersonness();
	}
	pixmarker("END: in_spawnSpectator");
}

/*
	Name: spectatorthirdpersonness
	Namespace: globallogic_spawn
	Checksum: 0xC82F4A81
	Offset: 0x1078
	Size: 0x52
	Parameters: 0
	Flags: Linked
*/
function spectatorthirdpersonness()
{
	self notify(#"spectator_thirdperson_thread");
	self endon(#"disconnect", #"spawned", #"spectator_thirdperson_thread");
	self.spectatingthirdperson = 0;
}

/*
	Name: forcespawn
	Namespace: globallogic_spawn
	Checksum: 0xFC71AA01
	Offset: 0x10D8
	Size: 0x100
	Parameters: 1
	Flags: None
*/
function forcespawn(time)
{
	self endon(#"death", #"spawned");
	if(!isdefined(time))
	{
		time = 60;
	}
	wait(time);
	if(is_true(self.hasspawned))
	{
		return;
	}
	if(self.pers[#"team"] == "spectator")
	{
		return;
	}
	if(!globallogic_utils::isvalidclass(self.pers[#"class"]))
	{
		self.pers[#"class"] = "CLASS_CUSTOM1";
		self.curclass = self.pers[#"class"];
	}
	self thread [[level.spawnclient]]();
}

/*
	Name: kickifdontspawn
	Namespace: globallogic_spawn
	Checksum: 0x6160AB20
	Offset: 0x11E0
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function kickifdontspawn()
{
	/#
		if(getdvarint(#"scr_hostmigrationtest", 0) == 1)
		{
			return;
		}
	#/
	if(self ishost())
	{
		return;
	}
	self kickifidontspawninternal();
}

/*
	Name: kickifidontspawninternal
	Namespace: globallogic_spawn
	Checksum: 0x391530AB
	Offset: 0x1250
	Size: 0x1D4
	Parameters: 0
	Flags: Linked
*/
function kickifidontspawninternal()
{
	self endon(#"death", #"spawned");
	waittime = 90;
	if(getdvarstring(#"scr_kick_time") != "")
	{
		waittime = getdvarfloat(#"scr_kick_time", 0);
	}
	mintime = 45;
	if(getdvarstring(#"scr_kick_mintime") != "")
	{
		mintime = getdvarfloat(#"scr_kick_mintime", 0);
	}
	starttime = gettime();
	kickwait(waittime);
	timepassed = (gettime() - starttime) / 1000;
	if(timepassed < (waittime - 0.1) && timepassed < mintime)
	{
		return;
	}
	if(is_true(self.hasspawned))
	{
		return;
	}
	if(sessionmodeisprivate())
	{
		return;
	}
	if(self.pers[#"team"] == "spectator")
	{
		return;
	}
	kick(self getentitynumber());
}

/*
	Name: kickwait
	Namespace: globallogic_spawn
	Checksum: 0x59712A40
	Offset: 0x1430
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function kickwait(waittime)
{
	level endon(#"game_ended");
	hostmigration::waitlongdurationwithhostmigrationpause(waittime);
}

/*
	Name: spawninterroundintermission
	Namespace: globallogic_spawn
	Checksum: 0xB3A9EA8D
	Offset: 0x1470
	Size: 0x10C
	Parameters: 0
	Flags: None
*/
function spawninterroundintermission()
{
	self notify(#"spawned");
	self notify(#"end_respawn");
	self player::set_spawn_variables();
	self hud_message::clearlowermessage();
	self.sessionstate = "spectator";
	self.spectatorclient = -1;
	self.killcamentity = -1;
	self.archivetime = 0;
	self.psoffsettime = 0;
	self.friendlydamage = undefined;
	self globallogic_defaults::default_onspawnintermission();
	self setorigin(self.origin);
	self setplayerangles(self.angles);
	self clientfield::set_to_player("player_dof_settings", 2);
}

/*
	Name: spawnintermission
	Namespace: globallogic_spawn
	Checksum: 0x7C34B9E0
	Offset: 0x1588
	Size: 0x14C
	Parameters: 1
	Flags: Linked
*/
function spawnintermission(usedefaultcallback)
{
	self notify(#"spawned");
	self notify(#"end_respawn");
	self endon(#"disconnect");
	self player::set_spawn_variables();
	self hud_message::clearlowermessage();
	self.sessionstate = "intermission";
	self.spectatorclient = -1;
	self.killcamentity = -1;
	self.archivetime = 0;
	self.psoffsettime = 0;
	self.friendlydamage = undefined;
	if(isdefined(usedefaultcallback) && usedefaultcallback)
	{
		globallogic_defaults::default_onspawnintermission();
	}
	else
	{
		[[level.onspawnintermission]]();
	}
	if(game.state != "postgame")
	{
		self clientfield::set_to_player("player_dof_settings", 2);
	}
}

/*
	Name: spawnqueuedclientonteam
	Namespace: globallogic_spawn
	Checksum: 0x2D9512A6
	Offset: 0x16E0
	Size: 0xA4
	Parameters: 1
	Flags: Linked
*/
function spawnqueuedclientonteam(team)
{
	player_to_spawn = undefined;
	for(i = 0; i < level.deadplayers[team].size; i++)
	{
		player = level.deadplayers[team][i];
		if(player.waitingtospawn)
		{
			continue;
		}
		player_to_spawn = player;
		break;
	}
	if(isdefined(player_to_spawn))
	{
		player_to_spawn.allowqueuespawn = 1;
		player_to_spawn thread [[level.spawnclient]]();
	}
}

/*
	Name: spawnqueuedclient
	Namespace: globallogic_spawn
	Checksum: 0xA84F18EC
	Offset: 0x1790
	Size: 0x130
	Parameters: 2
	Flags: None
*/
function spawnqueuedclient(dead_player_team, killer)
{
	if(!level.playerqueuedrespawn)
	{
		return;
	}
	util::waittillslowprocessallowed();
	spawn_team = undefined;
	if(isdefined(killer) && isdefined(killer.team) && isdefined(level.teams[killer.team]))
	{
		spawn_team = killer.team;
	}
	if(isdefined(spawn_team))
	{
		spawnqueuedclientonteam(spawn_team);
		return;
	}
	foreach(_ in level.teams)
	{
		if(team == dead_player_team)
		{
			continue;
		}
		spawnqueuedclientonteam(team);
	}
}

/*
	Name: allteamsnearscorelimit
	Namespace: globallogic_spawn
	Checksum: 0xFB5ED6FD
	Offset: 0x18C8
	Size: 0xD6
	Parameters: 0
	Flags: Linked
*/
function allteamsnearscorelimit()
{
	if(!level.teambased)
	{
		return false;
	}
	if(level.scorelimit <= 1)
	{
		return false;
	}
	foreach(team, _ in level.teams)
	{
		if(!game.stat[#"teamscores"][team] >= (level.scorelimit - 1))
		{
			return false;
		}
	}
	return true;
}

/*
	Name: shouldshowrespawnmessage
	Namespace: globallogic_spawn
	Checksum: 0x772ABF86
	Offset: 0x19A8
	Size: 0x6E
	Parameters: 0
	Flags: Linked
*/
function shouldshowrespawnmessage()
{
	if(util::waslastround())
	{
		return false;
	}
	if(util::isoneround())
	{
		return false;
	}
	if(isdefined(level.livesdonotreset) && level.livesdonotreset)
	{
		return false;
	}
	if(allteamsnearscorelimit())
	{
		return false;
	}
	return true;
}

/*
	Name: default_spawnmessage
	Namespace: globallogic_spawn
	Checksum: 0x273C0162
	Offset: 0x1A20
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function default_spawnmessage()
{
	hud_message::setlowermessage(game.strings[#"spawn_next_round"]);
}

/*
	Name: showspawnmessage
	Namespace: globallogic_spawn
	Checksum: 0xFB297706
	Offset: 0x1A58
	Size: 0x28
	Parameters: 0
	Flags: Linked
*/
function showspawnmessage()
{
	if(shouldshowrespawnmessage())
	{
		self thread [[level.spawnmessage]]();
	}
}

/*
	Name: spawnclient
	Namespace: globallogic_spawn
	Checksum: 0x9FDAAFFD
	Offset: 0x1A88
	Size: 0x14E
	Parameters: 1
	Flags: Linked
*/
function spawnclient(timealreadypassed)
{
	pixbeginevent();
	/#
		assert(isdefined(self.team));
	#/
	/#
		assert(globallogic_utils::isvalidclass(self.curclass));
	#/
	if(!self mayspawn())
	{
		currentorigin = self.origin;
		currentangles = self.angles;
		self showspawnmessage();
		self thread [[level.spawnspectator]](currentorigin + vectorscale((0, 0, 1), 60), currentangles);
		pixendevent();
		return;
	}
	if(is_true(self.waitingtospawn))
	{
		pixendevent();
		return;
	}
	self.waitingtospawn = 1;
	self.allowqueuespawn = undefined;
	pixendevent();
	self waitandspawnclient(timealreadypassed);
	if(isdefined(self))
	{
		self.waitingtospawn = 0;
	}
}

/*
	Name: waitandspawnclient
	Namespace: globallogic_spawn
	Checksum: 0xF80C276E
	Offset: 0x1BE0
	Size: 0x3BC
	Parameters: 1
	Flags: Linked
*/
function waitandspawnclient(timealreadypassed)
{
	self endon(#"disconnect", #"end_respawn");
	level endon(#"game_ended");
	if(!isdefined(timealreadypassed))
	{
		timealreadypassed = 0;
	}
	spawnedasspectator = 0;
	if(!isdefined(self.wavespawnindex) && isdefined(level.waveplayerspawnindex[self.team]))
	{
		self.wavespawnindex = level.waveplayerspawnindex[self.team];
		level.waveplayerspawnindex[self.team]++;
	}
	timeuntilspawn = timeuntilspawn(0);
	if(timeuntilspawn > timealreadypassed)
	{
		timeuntilspawn = timeuntilspawn - timealreadypassed;
		timealreadypassed = 0;
	}
	else
	{
		timealreadypassed = timealreadypassed - timeuntilspawn;
		timeuntilspawn = 0;
	}
	if(timeuntilspawn > 0)
	{
		if(level.playerqueuedrespawn)
		{
			hud_message::setlowermessage(game.strings[#"you_will_spawn"], timeuntilspawn);
		}
		else
		{
			hud_message::setlowermessage(game.strings[#"waiting_to_spawn"], timeuntilspawn);
		}
		if(!spawnedasspectator)
		{
			spawnorigin = self.origin + vectorscale((0, 0, 1), 60);
			spawnangles = self.angles;
			if(isdefined(level.useintermissionpointsonwavespawn) && [[level.useintermissionpointsonwavespawn]]() == 1)
			{
				spawnpoint = spawnlogic::getrandomintermissionpoint();
				if(isdefined(spawnpoint))
				{
					spawnorigin = spawnpoint.origin;
					spawnangles = spawnpoint.angles;
				}
			}
			self thread respawn_asspectator(spawnorigin, spawnangles);
		}
		spawnedasspectator = 1;
		self globallogic_utils::waitfortimeornotify(timeuntilspawn, "force_spawn");
		if(isdefined(level.var_16918506))
		{
			self [[level.var_16918506]]();
		}
		self notify(#"stop_wait_safe_spawn_button");
	}
	wavebased = level.waverespawndelay > 0;
	if(!level.playerforcerespawn && self.hasspawned && !wavebased && !self.wantsafespawn && !level.playerqueuedrespawn)
	{
		hud_message::setlowermessage(game.strings[#"press_to_spawn"]);
		if(!spawnedasspectator)
		{
			self thread respawn_asspectator(self.origin + vectorscale((0, 0, 1), 60), self.angles);
		}
		spawnedasspectator = 1;
		self waitrespawnorsafespawnbutton();
	}
	self.waitingtospawn = 0;
	self.wavespawnindex = undefined;
	self.respawntimerstarttime = undefined;
	self thread [[level.spawnplayer]]();
	self hud_message::clearlowermessage();
}

/*
	Name: waitrespawnorsafespawnbutton
	Namespace: globallogic_spawn
	Checksum: 0x493F3029
	Offset: 0x1FA8
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function waitrespawnorsafespawnbutton()
{
	self endon(#"disconnect", #"end_respawn");
	while(true)
	{
		if(self usebuttonpressed())
		{
			break;
		}
		waitframe(1);
	}
}

/*
	Name: waitinspawnqueue
	Namespace: globallogic_spawn
	Checksum: 0xF00ABE9E
	Offset: 0x2008
	Size: 0xBA
	Parameters: 0
	Flags: None
*/
function waitinspawnqueue()
{
	self endon(#"disconnect", #"end_respawn");
	if(!level.ingraceperiod && !spawning::usestartspawns())
	{
		currentorigin = self.origin;
		currentangles = self.angles;
		self thread [[level.spawnspectator]](currentorigin + vectorscale((0, 0, 1), 60), currentangles);
		self waittill(#"queue_respawn");
	}
}

/*
	Name: setthirdperson
	Namespace: globallogic_spawn
	Checksum: 0xBE8B6572
	Offset: 0x20D0
	Size: 0xDC
	Parameters: 1
	Flags: None
*/
function setthirdperson(value)
{
	if(!level.console)
	{
		return;
	}
	if(!isdefined(self.spectatingthirdperson) || value != self.spectatingthirdperson)
	{
		self.spectatingthirdperson = value;
		if(value)
		{
			self setclientthirdperson(1);
			self clientfield::set_to_player("player_dof_settings", 2);
		}
		else
		{
			self setclientthirdperson(0);
			self clientfield::set_to_player("player_dof_settings", 1);
		}
		self resetfov();
	}
}

