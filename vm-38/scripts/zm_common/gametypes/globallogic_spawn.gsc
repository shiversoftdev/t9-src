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
	Name: function_9cc5a884
	Namespace: globallogic_spawn
	Checksum: 0xD6AB138E
	Offset: 0x268
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_9cc5a884()
{
	level notify(7303174);
}

/*
	Name: timeuntilspawn
	Namespace: globallogic_spawn
	Checksum: 0x14DB99EA
	Offset: 0x288
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
	Checksum: 0xD22C02C1
	Offset: 0x360
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
	Checksum: 0x2A72EF89
	Offset: 0x3F8
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
	Checksum: 0x935EC75B
	Offset: 0x598
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
	Checksum: 0x37B084FF
	Offset: 0x748
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
	Checksum: 0x25B7D14E
	Offset: 0x798
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
	Checksum: 0xE0DC0914
	Offset: 0x880
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
	Checksum: 0xCFBA460E
	Offset: 0xD28
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
	Checksum: 0x20470A79
	Offset: 0xEB8
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
	Checksum: 0x534A373
	Offset: 0xF10
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
	Checksum: 0x8942686
	Offset: 0xF48
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
	Checksum: 0xBF718C3
	Offset: 0x1098
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
	Checksum: 0x3D496DFF
	Offset: 0x10F8
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
	Checksum: 0x68BC9584
	Offset: 0x1200
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
	Checksum: 0x9E5A41D1
	Offset: 0x1270
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
	Checksum: 0xA3B7D563
	Offset: 0x1450
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
	Checksum: 0x3B0EC036
	Offset: 0x1490
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
	Checksum: 0xDF59EC78
	Offset: 0x15A8
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
	Checksum: 0xC9B38838
	Offset: 0x1700
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
	Checksum: 0xB40E58AC
	Offset: 0x17B0
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
	Checksum: 0xF8B1E25A
	Offset: 0x18E8
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
	Checksum: 0xC6CAD752
	Offset: 0x19C8
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
	Checksum: 0xBC77459A
	Offset: 0x1A40
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
	Checksum: 0x922FEF29
	Offset: 0x1A78
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
	Checksum: 0x3768EF47
	Offset: 0x1AA8
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
	Checksum: 0x73A3626F
	Offset: 0x1C00
	Size: 0x3FC
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
	if(isdefined(level.var_4e1e5411))
	{
		if(self [[level.var_4e1e5411]]())
		{
			self thread [[level.spawnplayer]]();
		}
	}
	else
	{
		self thread [[level.spawnplayer]]();
	}
	self hud_message::clearlowermessage();
}

/*
	Name: waitrespawnorsafespawnbutton
	Namespace: globallogic_spawn
	Checksum: 0x9C4526B0
	Offset: 0x2008
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
	Checksum: 0xC2B47257
	Offset: 0x2068
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
	Checksum: 0xBDFBA487
	Offset: 0x2130
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

