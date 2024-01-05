#using scripts\killstreaks\killstreaks_shared.gsc;
#using script_32399001bdb550da;
#using scripts\cp_common\gametypes\loadout.gsc;
#using scripts\cp_common\gametypes\globallogic_utils.gsc;
#using scripts\cp_common\gametypes\globallogic_ui.gsc;
#using scripts\cp_common\gametypes\globallogic_player.gsc;
#using scripts\cp_common\gametypes\globallogic_defaults.gsc;
#using scripts\cp_common\gametypes\globallogic.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\spectating.gsc;
#using script_44b0b8420eabacad;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\player\player_shared.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\hud_shared.gsc;
#using scripts\core_common\hud_message_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace globallogic_spawn;

/*
	Name: timeuntilspawn
	Namespace: globallogic_spawn
	Checksum: 0x78842BB3
	Offset: 0x260
	Size: 0x488
	Parameters: 1
	Flags: None
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
			if(is_true(self.diedonvehicle) && isdefined(level.var_cf393bff))
			{
				self.var_84c0402e = undefined;
				self.bleedout_time = undefined;
				respawndelay = level.var_cf393bff;
			}
			else
			{
				if(isdefined(level.var_a4107aed))
				{
					respawndelay = level.var_a4107aed;
				}
				else
				{
					if(self.team === #"allies" && isdefined(level.var_6e5e9604))
					{
						respawndelay = level.var_6e5e9604;
					}
					else
					{
						if(self.team === #"axis" && isdefined(level.var_c260c3bd))
						{
							respawndelay = level.var_c260c3bd;
						}
						else
						{
							respawndelay = level.playerrespawndelay;
						}
					}
				}
			}
		}
		if(isdefined(self.lastspawntime) && isdefined(level.var_1cac200a) && (gettime() - self.var_88f8dfe3) <= (level.var_1cac200a * 1000))
		{
			if(!isdefined(self.var_4999cc5d))
			{
				self.var_4999cc5d = 0;
			}
			else
			{
				self.var_4999cc5d = self.var_4999cc5d + 1;
			}
		}
		else
		{
			self.var_4999cc5d = 0;
		}
		if(isplayer(self) && !isbot(self) && isdefined(level.var_a164210a))
		{
			var_7415756f = level.var_a164210a * self.var_4999cc5d;
			respawndelay = respawndelay + var_7415756f;
			if(isdefined(level.var_a6a26da0) && respawndelay > level.var_a6a26da0)
			{
				respawndelay = level.var_a6a26da0;
			}
			if(var_7415756f > 0)
			{
				var_1581b0a8 = (isdefined(var_7415756f) ? "" + var_7415756f : "");
				/#
					debug2dtext((900, 500, 0), var_1581b0a8 + "", (1, 1, 1), 1, (0, 0, 0), 0.5, 1, 80);
				#/
			}
		}
		if(is_true(self.suicide) && level.suicidespawndelay > 0)
		{
			respawndelay = respawndelay + level.suicidespawndelay;
		}
		if(is_true(self.teamkilled) && level.teamkilledspawndelay > 0)
		{
			respawndelay = respawndelay + level.teamkilledspawndelay;
		}
		if(includeteamkilldelay && is_true(self.teamkillpunish))
		{
			respawndelay = respawndelay + globallogic_player::teamkilldelay();
		}
		if(isdefined(self.bleedout_time) && isdefined(self.var_84c0402e))
		{
			/#
				assert(self.bleedout_time >= 0);
			#/
			/#
				assert(self.bleedout_time <= self.var_84c0402e);
			#/
			respawndelay = respawndelay - (self.var_84c0402e - self.bleedout_time);
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
	Checksum: 0xCBCFA3AE
	Offset: 0x6F0
	Size: 0x90
	Parameters: 0
	Flags: None
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
	Checksum: 0xC2E2512A
	Offset: 0x788
	Size: 0x176
	Parameters: 0
	Flags: None
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
	if(is_true(self.inhibit_respawn))
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
		if(!self.pers[#"lives"])
		{
			return false;
		}
		if(gamehasstarted)
		{
			if(!level.ingraceperiod && !self.hasspawned)
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
	Checksum: 0x7F471552
	Offset: 0x908
	Size: 0x118
	Parameters: 1
	Flags: None
*/
function timeuntilwavespawn(minimumwait)
{
	earliestspawntime = gettime() + (minimumwait * 1000);
	lastwavetime = level.lastwave[self.pers[#"team"]];
	wavedelay = level.wavedelay[self.pers[#"team"]] * 1000;
	if(wavedelay == 0)
	{
		return 0;
	}
	numwavespassedearliestspawntime = (earliestspawntime - lastwavetime) / wavedelay;
	numwaves = ceil(numwavespassedearliestspawntime);
	timeofspawn = lastwavetime + (numwaves * wavedelay);
	if(isdefined(self.wavespawnindex))
	{
		timeofspawn = timeofspawn + (50 * self.wavespawnindex);
	}
	return (timeofspawn - gettime()) / 1000;
}

/*
	Name: stoppoisoningandflareonspawn
	Namespace: globallogic_spawn
	Checksum: 0xC97DFBFA
	Offset: 0xA28
	Size: 0x32
	Parameters: 0
	Flags: None
*/
function stoppoisoningandflareonspawn()
{
	self.inpoisonarea = 0;
	self.inburnarea = 0;
	self.inflarevisionarea = 0;
	self.ingroundnapalm = 0;
}

/*
	Name: spawnplayerprediction
	Namespace: globallogic_spawn
	Checksum: 0xE83BE06
	Offset: 0xA68
	Size: 0x84
	Parameters: 0
	Flags: None
*/
function spawnplayerprediction()
{
	self endon(#"disconnect", #"end_respawn", #"game_ended", #"joined_spectators", #"spawned");
	while(true)
	{
		wait(0.5);
		self [[level.onspawnplayer]](1);
	}
}

/*
	Name: spawnplayer
	Namespace: globallogic_spawn
	Checksum: 0xC40D095B
	Offset: 0xAF8
	Size: 0x7FC
	Parameters: 0
	Flags: None
*/
function spawnplayer()
{
	pixbeginevent();
	self endon(#"disconnect", #"joined_spectators");
	hadspawned = self.hasspawned;
	self player::spawn_player();
	self setcharacterbodytype(0);
	self setcharacteroutfit(0);
	self hud_message::clearlowermessage();
	self.nextkillstreakfree = undefined;
	self.activeuavs = 0;
	self.activecounteruavs = 0;
	self.activesatellites = 0;
	self.deathmachinekills = 0;
	self.diedonvehicle = undefined;
	self.disable_score_events = 1;
	self function_64df4ea3(1);
	if(is_false(self.wasaliveatmatchstart))
	{
		if(level.ingraceperiod || globallogic_utils::gettimepassed() < 20000)
		{
			self.wasaliveatmatchstart = 1;
		}
	}
	pixbeginevent();
	self [[level.onspawnplayer]](0);
	if(isdefined(level.playerspawnedcb))
	{
		self [[level.playerspawnedcb]]();
	}
	pixendevent();
	pixendevent();
	globallogic::updateteamstatus();
	self stoppoisoningandflareonspawn();
	self.sensorgrenadedata = undefined;
	if(!isdefined(self.curclass))
	{
		waitframe(1);
	}
	pixbeginevent();
	/#
		assert(globallogic_utils::isvalidclass(self.curclass) || isbot(self));
	#/
	self loadout::setclass(self.curclass);
	var_db3f2906 = self savegame::get_player_data("altPlayerID", undefined);
	altplayer = undefined;
	if(isdefined(var_db3f2906))
	{
		foreach(var_88ad84f4 in level.players)
		{
			if(var_88ad84f4 getxuid() === var_db3f2906)
			{
				altplayer = var_88ad84f4;
				break;
			}
		}
		if(!isdefined(altplayer))
		{
			self savegame::set_player_data("altPlayerID", undefined);
		}
	}
	self thread loadout::giveloadout(self.team, self.curclass, altplayer);
	if(is_true(self.var_c071a13e))
	{
		self.var_c071a13e = undefined;
	}
	else
	{
		self lui::screen_close_menu();
	}
	if(level.inprematchperiod)
	{
		self val::set(#"prematch", "ignoreme", 1);
		team = self.pers[#"team"];
	}
	else
	{
		self val::reset(#"prematch", "freezecontrols");
		self enableweapons();
		if(!hadspawned && game.state == "playing")
		{
			team = self.team;
		}
	}
	self val::reset(#"roundend", "freezecontrols");
	self val::reset(#"suicide", "freezecontrols");
	if(!isdefined(getdvar(#"scr_showperksonspawn")))
	{
		setdvar(#"scr_showperksonspawn", 0);
	}
	if(level.hardcoremode)
	{
		setdvar(#"scr_showperksonspawn", 0);
	}
	/#
		if(getdvarint(#"scr_showperksonspawn", 0) == 1 && game.state != "")
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
	self setnosunshadow();
	waitframe(1);
	self notify(#"spawned_player");
	if(!getdvarint(#"art_review", 0))
	{
		self.var_913d3fca = 0;
		self.last_damaged_time = 0;
		self.var_63a30c1 = 0;
		self.var_7e008e0c = 0;
		callback::callback(#"on_player_spawned");
		if(isdefined(self.var_f8271fa3))
		{
			self.var_f8271fa3 delete();
			self.var_f8271fa3 = undefined;
		}
	}
	/#
		print(((((("" + self.origin[0]) + "") + self.origin[1]) + "") + self.origin[2]) + "");
	#/
	setdvar(#"scr_selecting_location", "");
	self thread vehicledeathwaiter();
	self util::set_lighting_state();
	self util::set_sun_shadow_split_distance();
	self.firstspawn = 0;
	self.var_88f8dfe3 = gettime();
	self thread util::cleanup_fancycam();
}

/*
	Name: vehicledeathwaiter
	Namespace: globallogic_spawn
	Checksum: 0x9D25E548
	Offset: 0x1300
	Size: 0x92
	Parameters: 0
	Flags: None
*/
function vehicledeathwaiter()
{
	self notify(#"vehicledeathwaiter");
	self endon(#"vehicledeathwaiter", #"disconnect");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"vehicle_death");
		if(waitresult.vehicle_died)
		{
			self.diedonvehicle = 1;
		}
		else
		{
			self.diedonturret = 1;
		}
	}
}

/*
	Name: spawnspectator
	Namespace: globallogic_spawn
	Checksum: 0xE84D8981
	Offset: 0x13A0
	Size: 0x5C
	Parameters: 2
	Flags: None
*/
function spawnspectator(origin, angles)
{
	self notify(#"spawned");
	self notify(#"end_respawn");
	self notify(#"spawned_spectator");
	in_spawnspectator(origin, angles);
}

/*
	Name: respawn_asspectator
	Namespace: globallogic_spawn
	Checksum: 0x6C39865D
	Offset: 0x1408
	Size: 0x7A
	Parameters: 2
	Flags: None
*/
function respawn_asspectator(origin, angles)
{
	in_spawnspectator(origin, angles);
}

/*
	Name: in_spawnspectator
	Namespace: globallogic_spawn
	Checksum: 0x48A8AD53
	Offset: 0x1490
	Size: 0x134
	Parameters: 2
	Flags: None
*/
function in_spawnspectator(origin, angles)
{
	pixmarker("BEGIN: in_spawnSpectator");
	self player::set_spawn_variables();
	self.sessionstate = "spectator";
	self.spectatorclient = -1;
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
	spectating::set_permissions_for_machine();
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
	Checksum: 0xBAF7EBAC
	Offset: 0x15D0
	Size: 0x5A
	Parameters: 0
	Flags: None
*/
function spectatorthirdpersonness()
{
	self endon(#"disconnect", #"spawned");
	self notify(#"spectator_thirdperson_thread");
	self endon(#"spectator_thirdperson_thread");
	self.spectatingthirdperson = 0;
}

/*
	Name: forcespawn
	Namespace: globallogic_spawn
	Checksum: 0x199F4DE
	Offset: 0x1638
	Size: 0x128
	Parameters: 1
	Flags: None
*/
function forcespawn(time)
{
	self endon(#"death", #"hash_54543f163347573c", #"spawned");
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
	self globallogic_ui::closemenus();
	self thread [[level.spawnclient]]();
}

/*
	Name: kickifdontspawn
	Namespace: globallogic_spawn
	Checksum: 0x49848BD3
	Offset: 0x1768
	Size: 0x64
	Parameters: 0
	Flags: None
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
	Checksum: 0x8FB10698
	Offset: 0x17D8
	Size: 0x21C
	Parameters: 0
	Flags: None
*/
function kickifidontspawninternal()
{
	self endon(#"death", #"disconnect", #"spawned");
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
	timepassed = (float(gettime() - starttime)) / 1000;
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
	if(!mayspawn())
	{
		return;
	}
	globallogic::gamehistoryplayerkicked();
	kick(self getentitynumber());
}

/*
	Name: kickwait
	Namespace: globallogic_spawn
	Checksum: 0xE6E765D3
	Offset: 0x1A00
	Size: 0x22
	Parameters: 1
	Flags: None
*/
function kickwait(waittime)
{
	level endon(#"game_ended");
}

/*
	Name: spawninterroundintermission
	Namespace: globallogic_spawn
	Checksum: 0x12D2785D
	Offset: 0x1A30
	Size: 0x104
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
	Checksum: 0x5C937C0D
	Offset: 0x1B40
	Size: 0x104
	Parameters: 1
	Flags: None
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
	self clientfield::set_to_player("player_dof_settings", 2);
}

/*
	Name: spawnqueuedclientonteam
	Namespace: globallogic_spawn
	Checksum: 0x2DB72347
	Offset: 0x1C50
	Size: 0xB8
	Parameters: 1
	Flags: None
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
		player_to_spawn globallogic_ui::closemenus();
		player_to_spawn thread [[level.spawnclient]]();
	}
}

/*
	Name: spawnqueuedclient
	Namespace: globallogic_spawn
	Checksum: 0xEBC82D67
	Offset: 0x1D10
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
	Checksum: 0x95CCDDB2
	Offset: 0x1E48
	Size: 0xD6
	Parameters: 0
	Flags: None
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
	Checksum: 0x5CEDA7FB
	Offset: 0x1F28
	Size: 0x6E
	Parameters: 0
	Flags: None
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
	Checksum: 0xFBA75A61
	Offset: 0x1FA0
	Size: 0x44
	Parameters: 0
	Flags: None
*/
function default_spawnmessage()
{
	hud_message::setlowermessage(game.strings[#"spawn_next_round"]);
	self thread globallogic_ui::removespawnmessageshortly(3);
}

/*
	Name: showspawnmessage
	Namespace: globallogic_spawn
	Checksum: 0xC8353714
	Offset: 0x1FF0
	Size: 0x28
	Parameters: 0
	Flags: None
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
	Checksum: 0x7616DA1
	Offset: 0x2020
	Size: 0x150
	Parameters: 1
	Flags: None
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
	self waitandspawnclient(timealreadypassed);
	if(isdefined(self))
	{
		self.waitingtospawn = 0;
	}
	pixendevent();
}

/*
	Name: waitandspawnclient
	Namespace: globallogic_spawn
	Checksum: 0xF515E02E
	Offset: 0x2178
	Size: 0x810
	Parameters: 1
	Flags: None
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
	if(is_true(level.var_41cd8311) && is_true(self.var_30a1aeee))
	{
		if(isdefined(level.var_31c6ebd4))
		{
			self [[level.var_31c6ebd4]]();
		}
	}
	if(is_true(self.teamkillpunish))
	{
		teamkilldelay = globallogic_player::teamkilldelay();
		if(teamkilldelay > timealreadypassed)
		{
			teamkilldelay = teamkilldelay - timealreadypassed;
			timealreadypassed = 0;
		}
		else
		{
			timealreadypassed = timealreadypassed - teamkilldelay;
			teamkilldelay = 0;
		}
		if(teamkilldelay > 0)
		{
			hud_message::setlowermessage(#"hash_7d1a0e5bd191fce", teamkilldelay);
			self thread respawn_asspectator(self.origin + vectorscale((0, 0, 1), 60), self.angles);
			spawnedasspectator = 1;
			wait(teamkilldelay);
		}
		self.teamkillpunish = 0;
	}
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
				spawnpoint = spawning::get_random_intermission_point();
				if(isdefined(spawnpoint))
				{
					spawnorigin = spawnpoint.origin;
					spawnangles = spawnpoint.angles;
				}
			}
			self thread respawn_asspectator(spawnorigin, spawnangles);
		}
		spawnedasspectator = 1;
		if(timeuntilspawn >= 0.3 && !isbot(self))
		{
			var_4dff964a = (timeuntilspawn - 0.3) - 0.2;
			self thread function_bb88905b(var_4dff964a);
		}
		self waittilltimeout(timeuntilspawn, #"force_spawn");
		self notify(#"stop_wait_safe_spawn_button");
	}
	if(isdefined(level.gametypespawnwaiter))
	{
		if(isdefined(level.var_84a50edd) && !spawnedasspectator)
		{
			spawnedasspectator = self [[level.var_84a50edd]]();
		}
		if(!spawnedasspectator)
		{
			self thread respawn_asspectator(self.origin + vectorscale((0, 0, 1), 60), self.angles);
		}
		spawnedasspectator = 1;
		if(!self [[level.gametypespawnwaiter]]())
		{
			self.waitingtospawn = 0;
			self hud_message::clearlowermessage();
			self.wavespawnindex = undefined;
			self.respawntimerstarttime = undefined;
			return;
		}
	}
	system::function_c11b0642();
	level flag::wait_till("all_players_connected");
	if(level.players.size > 0)
	{
		if(scene::should_spectate_on_join())
		{
			if(!spawnedasspectator)
			{
				self thread respawn_asspectator(self.origin + vectorscale((0, 0, 1), 60), self.angles);
			}
			spawnedasspectator = 1;
			scene::wait_until_spectate_on_join_completes();
		}
	}
	wavebased = level.waverespawndelay > 0;
	if(!level.playerforcerespawn && self.hasspawned && !wavebased && !self.wantsafespawn && !level.playerqueuedrespawn && !spawnedasspectator)
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
	self hud_message::clearlowermessage();
	self.wavespawnindex = undefined;
	self.respawntimerstarttime = undefined;
	if(is_true(self.var_8fc85657))
	{
		self waittill(#"end_killcam");
	}
	self notify(#"hash_4bd20f5c626eb3f0");
	if(isdefined(self.var_ca00be20))
	{
		self.var_ca00be20.alpha = 0;
	}
	self.var_30a1aeee = undefined;
	self.var_8fc85657 = undefined;
	self.var_2a0475c3 = undefined;
	self.var_941a2b2b = undefined;
	self.killcamweapon = getweapon(#"none");
	self.var_5ff1f21c = undefined;
	self.var_f9870df6 = undefined;
	if(is_true(level.var_ba2a141))
	{
		level waittill(#"forever");
	}
	if(!isdefined(self.firstspawn))
	{
		self.firstspawn = 1;
		savegame::checkpoint_save();
	}
	if(!isbot(self))
	{
		self function_eb0dd56(2);
	}
	self thread [[level.spawnplayer]]();
}

/*
	Name: function_bb88905b
	Namespace: globallogic_spawn
	Checksum: 0x5CBED034
	Offset: 0x2990
	Size: 0x21E
	Parameters: 1
	Flags: None
*/
function function_bb88905b(var_4dff964a)
{
	self endon(#"disconnect");
	if(is_true(self.var_bb88905b))
	{
		return;
	}
	self.var_bb88905b = 1;
	s_notify = undefined;
	s_notify = self waittilltimeout(var_4dff964a, #"force_spawn", #"scene");
	if(s_notify._notify == "timeout")
	{
		lui::screen_fade_out(0.3, (1, 1, 1), "spectate_spawn");
	}
	else
	{
		lui::screen_fade_out(0, (1, 1, 1), "spectate_spawn");
	}
	[[ level.var_ad332481[#"fullscreenblack"] ]]->close(self);
	[[ level.var_ad332481[#"fullscreenblack"] ]]->open(self, 1);
	if(s_notify._notify == "timeout")
	{
		while(self.sessionstate !== "playing")
		{
			util::wait_network_frame();
		}
		lui::screen_fade_out(0, (1, 1, 1), "spectate_spawn");
	}
	util::wait_network_frame(2);
	[[ level.var_ad332481[#"fullscreenblack"] ]]->close(self);
	util::wait_network_frame(2);
	lui::screen_fade_in(0.3, (1, 1, 1), "spectate_spawn");
	self.var_bb88905b = 0;
}

/*
	Name: waitrespawnorsafespawnbutton
	Namespace: globallogic_spawn
	Checksum: 0x80351641
	Offset: 0x2BB8
	Size: 0x54
	Parameters: 0
	Flags: None
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
	Checksum: 0x48D42C4F
	Offset: 0x2C18
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
	Checksum: 0x414906A0
	Offset: 0x2CE0
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

