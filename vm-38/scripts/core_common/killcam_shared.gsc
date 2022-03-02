#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\hud_shared.gsc;
#using scripts\core_common\potm_shared.gsc;
#using scripts\core_common\spectating.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\visionset_mgr_shared.gsc;

#namespace killcam_shared;

/*
	Name: function_4e890181
	Namespace: killcam_shared
	Checksum: 0x7730004
	Offset: 0x1A0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_4e890181()
{
	level notify(1635166538);
}

#namespace killcam;

/*
	Name: function_89f2df9
	Namespace: killcam
	Checksum: 0x80068A14
	Offset: 0x1C0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"killcam", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: killcam
	Checksum: 0x3954219
	Offset: 0x208
	Size: 0x24
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	callback::on_start_gametype(&init);
}

/*
	Name: init
	Namespace: killcam
	Checksum: 0x97D04E45
	Offset: 0x238
	Size: 0xD4
	Parameters: 0
	Flags: Linked
*/
function init()
{
	level.killcammode = getgametypesetting(#"killcammode");
	level.finalkillcam = getgametypesetting(#"allowfinalkillcam");
	level.killcamtime = getgametypesetting(#"killcamtime");
	level.var_a95350da = getgametypesetting(#"hash_154db5a1b2e9d757");
	level.var_7abccc83 = !function_f99d2668();
	init_final_killcam();
}

/*
	Name: end_killcam
	Namespace: killcam
	Checksum: 0x85BDBE51
	Offset: 0x318
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function end_killcam()
{
	self.spectatorclient = -1;
	self notify(#"end_killcam");
	self setmodellodbias(0);
}

/*
	Name: function_2f7579f
	Namespace: killcam
	Checksum: 0x1B3D1993
	Offset: 0x360
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function function_2f7579f(var_167baaa)
{
	if(!isdefined(level.var_ef3352fc))
	{
		level.var_ef3352fc = [];
	}
	level.var_ef3352fc[var_167baaa] = 1;
}

/*
	Name: get_killcam_entity_start_time
	Namespace: killcam
	Checksum: 0x3512CEA0
	Offset: 0x3A8
	Size: 0x60
	Parameters: 1
	Flags: Linked
*/
function get_killcam_entity_start_time(killcamentity)
{
	killcamentitystarttime = 0;
	if(isdefined(killcamentity))
	{
		if(isdefined(killcamentity.starttime))
		{
			killcamentitystarttime = killcamentity.starttime;
		}
		else
		{
			killcamentitystarttime = killcamentity.birthtime;
		}
		if(!isdefined(killcamentitystarttime))
		{
			killcamentitystarttime = 0;
		}
	}
	return killcamentitystarttime;
}

/*
	Name: store_killcam_entity_on_entity
	Namespace: killcam
	Checksum: 0x3A05D17
	Offset: 0x410
	Size: 0x5A
	Parameters: 1
	Flags: Linked
*/
function store_killcam_entity_on_entity(killcam_entity)
{
	/#
		assert(isdefined(killcam_entity));
	#/
	self.killcamentitystarttime = get_killcam_entity_start_time(killcam_entity);
	self.killcamentityindex = killcam_entity getentitynumber();
}

/*
	Name: init_final_killcam
	Namespace: killcam
	Checksum: 0xE462AFEA
	Offset: 0x478
	Size: 0xCE
	Parameters: 0
	Flags: Linked
*/
function init_final_killcam()
{
	level.finalkillcamsettings = [];
	init_final_killcam_team(#"none");
	foreach(_ in level.teams)
	{
		init_final_killcam_team(team);
	}
	level.finalkillcam_winner = undefined;
	level.finalkillcam_winnerpicked = undefined;
}

/*
	Name: init_final_killcam_team
	Namespace: killcam
	Checksum: 0x93BB3FEE
	Offset: 0x550
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function init_final_killcam_team(team)
{
	level.finalkillcamsettings[team] = spawnstruct();
	clear_final_killcam_team(team);
}

/*
	Name: clear_final_killcam_team
	Namespace: killcam
	Checksum: 0xA57ED0B6
	Offset: 0x598
	Size: 0x116
	Parameters: 1
	Flags: Linked
*/
function clear_final_killcam_team(team)
{
	level.finalkillcamsettings[team].spectatorclient = undefined;
	level.finalkillcamsettings[team].weapon = undefined;
	level.finalkillcamsettings[team].meansofdeath = undefined;
	level.finalkillcamsettings[team].deathtime = undefined;
	level.finalkillcamsettings[team].deathtimeoffset = undefined;
	level.finalkillcamsettings[team].offsettime = undefined;
	level.finalkillcamsettings[team].killcam_entity_info = undefined;
	level.finalkillcamsettings[team].targetentityindex = undefined;
	level.finalkillcamsettings[team].perks = undefined;
	level.finalkillcamsettings[team].killstreaks = undefined;
	level.finalkillcamsettings[team].attacker = undefined;
}

/*
	Name: record_settings
	Namespace: killcam
	Checksum: 0x7FCAF9B6
	Offset: 0x6B8
	Size: 0x36E
	Parameters: 11
	Flags: None
*/
function record_settings(spectatorclient, targetentityindex, killcam_entity_info, weapon, meansofdeath, deathtime, deathtimeoffset, offsettime, perks, killstreaks, attacker)
{
	if(!isdefined(level.finalkillcamsettings))
	{
		return;
	}
	if(isdefined(attacker) && (isdefined(attacker.team) && isdefined(level.teams[attacker.team])))
	{
		team = attacker.team;
		level.finalkillcamsettings[team].spectatorclient = spectatorclient;
		level.finalkillcamsettings[team].weapon = weapon;
		level.finalkillcamsettings[team].meansofdeath = meansofdeath;
		level.finalkillcamsettings[team].deathtime = deathtime;
		level.finalkillcamsettings[team].deathtimeoffset = deathtimeoffset;
		level.finalkillcamsettings[team].offsettime = offsettime;
		level.finalkillcamsettings[team].killcam_entity_info = killcam_entity_info;
		level.finalkillcamsettings[team].targetentityindex = targetentityindex;
		level.finalkillcamsettings[team].perks = perks;
		level.finalkillcamsettings[team].killstreaks = killstreaks;
		level.finalkillcamsettings[team].attacker = attacker;
	}
	level.finalkillcamsettings[#"none"].spectatorclient = spectatorclient;
	level.finalkillcamsettings[#"none"].weapon = weapon;
	level.finalkillcamsettings[#"none"].meansofdeath = meansofdeath;
	level.finalkillcamsettings[#"none"].deathtime = deathtime;
	level.finalkillcamsettings[#"none"].deathtimeoffset = deathtimeoffset;
	level.finalkillcamsettings[#"none"].offsettime = offsettime;
	level.finalkillcamsettings[#"none"].killcam_entity_info = killcam_entity_info;
	level.finalkillcamsettings[#"none"].targetentityindex = targetentityindex;
	level.finalkillcamsettings[#"none"].perks = perks;
	level.finalkillcamsettings[#"none"].killstreaks = killstreaks;
	level.finalkillcamsettings[#"none"].attacker = attacker;
}

/*
	Name: function_eb3deeec
	Namespace: killcam
	Checksum: 0x1621DC22
	Offset: 0xA30
	Size: 0x14E
	Parameters: 11
	Flags: None
*/
function function_eb3deeec(spectatorclient, targetentityindex, killcam_entity_info, weapon, meansofdeath, deathtime, deathtimeoffset, offsettime, perks, killstreaks, attacker)
{
	player = self;
	if(spectatorclient == -1)
	{
		spectatorclient = player getentitynumber();
	}
	player.var_e59bd911 = {#attacker:attacker, #killstreaks:killstreaks, #perks:perks, #targetentityindex:targetentityindex, #killcam_entity_info:killcam_entity_info, #offsettime:offsettime, #deathtimeoffset:deathtimeoffset, #deathtime:deathtime, #meansofdeath:meansofdeath, #weapon:weapon, #spectatorclient:spectatorclient};
}

/*
	Name: function_2c8aa45e
	Namespace: killcam
	Checksum: 0x37E2A9B5
	Offset: 0xB88
	Size: 0xC
	Parameters: 0
	Flags: Linked
*/
function function_2c8aa45e()
{
	return isdefined(self.var_e59bd911);
}

/*
	Name: start_deathcam
	Namespace: killcam
	Checksum: 0x96ECAD37
	Offset: 0xBA0
	Size: 0xA8
	Parameters: 0
	Flags: None
*/
function start_deathcam()
{
	if(!self function_2c8aa45e())
	{
		self.sessionstate = "spectator";
		self.spectatorclient = -1;
		self.killcamentity = -1;
		self.archivetime = 0;
		self.psoffsettime = 0;
		self.spectatekillcam = 0;
		return false;
	}
	if(is_true(self.var_e5681505))
	{
		return false;
	}
	self thread deathcam(self);
	return true;
}

/*
	Name: deathcam
	Namespace: killcam
	Checksum: 0xC12E18A2
	Offset: 0xC50
	Size: 0x1DE
	Parameters: 1
	Flags: Linked
*/
function deathcam(victim)
{
	self endon(#"disconnect");
	self.var_e5681505 = 1;
	self clientfield::set_player_uimodel("hudItems.killcamActive", 1);
	s = victim.var_e59bd911;
	self killcam(s.spectatorclient, s.targetentityindex, s.killcam_entity_info, s.weapon, s.meansofdeath, s.deathtime, s.deathtimeoffset, s.offsettime, 0, undefined, s.perks, s.killstreaks, s.attacker, 0);
	var_9a73aefe = self.currentspectatingclient;
	self function_223716c();
	if(var_9a73aefe >= 0)
	{
		var_e1f8d08d = getentbynum(var_9a73aefe);
		if(isdefined(var_e1f8d08d))
		{
			self setcurrentspectatorclient(var_e1f8d08d);
		}
	}
	self.sessionstate = "dead";
	self.spectatorclient = -1;
	self.killcamentity = -1;
	self.archivetime = 0;
	self.psoffsettime = 0;
	self.spectatekillcam = 0;
	self luinotifyevent(#"hash_5b2d65a026de792d", 0);
	self clientfield::set_player_uimodel("hudItems.killcamActive", 0);
	self.var_e5681505 = undefined;
}

/*
	Name: erase_final_killcam
	Namespace: killcam
	Checksum: 0x2DA191E5
	Offset: 0xE38
	Size: 0xBE
	Parameters: 0
	Flags: None
*/
function erase_final_killcam()
{
	clear_final_killcam_team(#"none");
	foreach(_ in level.teams)
	{
		clear_final_killcam_team(team);
	}
	level.finalkillcam_winner = undefined;
	level.finalkillcam_winnerpicked = undefined;
}

/*
	Name: final_killcam_waiter
	Namespace: killcam
	Checksum: 0x3F48407
	Offset: 0xF00
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function final_killcam_waiter()
{
	if(level.finalkillcam_winnerpicked === 1 && level.infinalkillcam === 1)
	{
		level waittill(#"final_killcam_done");
	}
}

/*
	Name: post_round_final_killcam
	Namespace: killcam
	Checksum: 0x42F62D38
	Offset: 0xF50
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function post_round_final_killcam()
{
	if(!level.finalkillcam)
	{
		return;
	}
	level notify(#"play_final_killcam");
	final_killcam_waiter();
}

/*
	Name: function_a26057ee
	Namespace: killcam
	Checksum: 0x78C4C08C
	Offset: 0xF98
	Size: 0x4C
	Parameters: 0
	Flags: None
*/
function function_a26057ee()
{
	if(potm::function_ec01de3())
	{
		/#
			println("");
		#/
		return;
	}
	post_round_final_killcam();
}

/*
	Name: function_de2b637d
	Namespace: killcam
	Checksum: 0x85561F07
	Offset: 0xFF0
	Size: 0x70
	Parameters: 1
	Flags: Linked
*/
function function_de2b637d(winner)
{
	if(!isdefined(winner))
	{
		return #"none";
	}
	if(isentity(winner))
	{
		return (isdefined(winner.team) ? winner.team : #"none");
	}
	return winner;
}

/*
	Name: do_final_killcam
	Namespace: killcam
	Checksum: 0x7ED39549
	Offset: 0x1068
	Size: 0x26C
	Parameters: 0
	Flags: None
*/
function do_final_killcam()
{
	level waittill(#"play_final_killcam");
	setslowmotion(1, 1, 0);
	level.infinalkillcam = 1;
	winner = #"none";
	if(isdefined(level.finalkillcam_winner))
	{
		winner = level.finalkillcam_winner;
	}
	winning_team = function_de2b637d(winner);
	if(!isdefined(level.finalkillcamsettings[winning_team].targetentityindex))
	{
		level.infinalkillcam = 0;
		level notify(#"final_killcam_done");
		return;
	}
	attacker = level.finalkillcamsettings[winning_team].attacker;
	if(isdefined(attacker) && isdefined(attacker.archetype) && attacker.archetype == "mannequin")
	{
		level.infinalkillcam = 0;
		level notify(#"final_killcam_done");
		return;
	}
	if(isdefined(attacker))
	{
		challenges::getfinalkill(attacker);
	}
	visionsetnaked("default", 0);
	players = level.players;
	for(index = 0; index < players.size; index++)
	{
		player = players[index];
		if(!player function_8b1a219a())
		{
			player closeingamemenu();
		}
		player thread final_killcam(winner);
	}
	wait(0.1);
	while(are_any_players_watching())
	{
		waitframe(1);
	}
	level notify(#"final_killcam_done");
	level.infinalkillcam = 0;
}

/*
	Name: are_any_players_watching
	Namespace: killcam
	Checksum: 0xADB4B314
	Offset: 0x12E0
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function are_any_players_watching()
{
	players = level.players;
	for(index = 0; index < players.size; index++)
	{
		player = players[index];
		if(isdefined(player.killcam))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: watch_for_skip_killcam
	Namespace: killcam
	Checksum: 0xDAAA9478
	Offset: 0x1350
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function watch_for_skip_killcam()
{
	self endon(#"begin_killcam");
	self waittill(#"disconnect", #"spawned");
	waitframe(1);
	level.numplayerswaitingtoenterkillcam--;
}

/*
	Name: killcam
	Namespace: killcam
	Checksum: 0x2A676A58
	Offset: 0x13A8
	Size: 0x7F2
	Parameters: 14
	Flags: Linked
*/
function killcam(attackernum, targetnum, killcam_entity_info, weapon, meansofdeath, deathtime, deathtimeoffset, offsettime, respawn, maxtime, perks, killstreaks, attacker, keep_deathcam)
{
	self endon(#"disconnect", #"spawned", #"game_ended");
	if(meansofdeath < 0)
	{
		return;
	}
	self thread watch_for_skip_killcam();
	self callback::function_52ac9652(#"on_end_game", &on_end_game, undefined, 1);
	self callback::function_d8abfc3d(#"on_end_game", &on_end_game);
	level.numplayerswaitingtoenterkillcam++;
	if(level.numplayerswaitingtoenterkillcam > 1)
	{
		/#
			println("");
		#/
		waitframe(level.numplayerswaitingtoenterkillcam - 1);
	}
	waitframe(1);
	level.numplayerswaitingtoenterkillcam--;
	if(!function_7f088568())
	{
		/#
			println("");
		#/
		while(!function_7f088568())
		{
			waitframe(1);
		}
	}
	/#
		assert(level.numplayerswaitingtoenterkillcam > -1);
	#/
	postdeathdelay = (float(gettime() - maxtime)) / 1000;
	predelay = postdeathdelay + perks;
	killcamentitystarttime = get_killcam_entity_info_starttime(deathtimeoffset);
	camtime = calc_time(offsettime, killcamentitystarttime, predelay, attacker, deathtimeoffset.var_30f79181, respawn);
	postdelay = calc_post_delay();
	killcamlength = camtime + postdelay;
	if(isdefined(attacker) && killcamlength > attacker)
	{
		if(attacker < 2)
		{
			return;
		}
		if((attacker - camtime) >= 1)
		{
			postdelay = attacker - camtime;
		}
		else
		{
			postdelay = 1;
			camtime = attacker - 1;
		}
		killcamlength = camtime + postdelay;
	}
	killcamoffset = camtime + predelay;
	self notify(#"begin_killcam", {#start_time:gettime()});
	if(isdefined(offsettime) && offsettime.name === #"straferun_rockets")
	{
		self setmodellodbias(8);
	}
	self util::clientnotify("sndDEDe");
	killcamstarttime = gettime() - (int(killcamoffset * 1000));
	self.sessionstate = "spectator";
	self.spectatekillcam = 1;
	self.spectatorclient = meansofdeath;
	self.killcamentity = -1;
	self thread set_killcam_entities(deathtimeoffset, killcamstarttime);
	self.killcamtargetentity = deathtime;
	self.killcamweapon = offsettime;
	self.killcammod = respawn;
	self.archivetime = killcamoffset;
	self.killcamlength = killcamlength;
	self.psoffsettime = killstreaks;
	/#
		if((getdvarfloat(#"hash_475a5a67154785d", -1)) >= 0)
		{
			self.killcamlength = max(0.5, min(self.killcamlength, getdvarfloat(#"hash_475a5a67154785d", -1)));
		}
	#/
	foreach(team, _ in level.teams)
	{
		self allowspectateteam(team, 1);
	}
	self allowspectateteam("freelook", 1);
	self allowspectateteam(#"none", 1);
	waitframe(1);
	if(self.archivetime <= predelay)
	{
		self.sessionstate = "dead";
		self.spectatorclient = -1;
		self.killcamentity = -1;
		self.archivetime = 0;
		self.psoffsettime = 0;
		self.spectatekillcam = 0;
		self end_killcam();
		return;
	}
	self thread check_for_abrupt_end();
	self.killcam = 1;
	/#
		if(!self issplitscreen() && level.perksenabled == 1)
		{
			self hud::showperks();
		}
	#/
	self thread spawned_killcam_cleanup();
	self thread wait_skip_killcam_button();
	self thread function_fa405b23();
	self thread wait_team_change_end_killcam();
	self thread wait_killcam_time();
	if(isdefined(level.var_60ac2c9))
	{
		self thread [[level.var_60ac2c9]]();
	}
	self waittill(#"end_killcam");
	self end(0);
	if(is_true(keep_deathcam))
	{
		return;
	}
	self.sessionstate = "dead";
	self.spectatorclient = -1;
	self.killcamentity = -1;
	self.archivetime = 0;
	self.psoffsettime = 0;
	self.spectatekillcam = 0;
}

/*
	Name: set_entity
	Namespace: killcam
	Checksum: 0xDD87572F
	Offset: 0x1BA8
	Size: 0x7A
	Parameters: 2
	Flags: Linked
*/
function set_entity(killcamentityindex, delayms)
{
	self endon(#"disconnect", #"end_killcam", #"spawned");
	if(delayms > 0)
	{
		wait(float(delayms) / 1000);
	}
	self.killcamentity = killcamentityindex;
}

/*
	Name: set_killcam_entities
	Namespace: killcam
	Checksum: 0x4267B0BC
	Offset: 0x1C30
	Size: 0x92
	Parameters: 2
	Flags: Linked
*/
function set_killcam_entities(entity_info, killcamstarttime)
{
	for(index = 0; index < entity_info.entity_indexes.size; index++)
	{
		delayms = (entity_info.entity_spawntimes[index] - killcamstarttime) - 100;
		thread set_entity(entity_info.entity_indexes[index], delayms);
		if(delayms <= 0)
		{
			return;
		}
	}
}

/*
	Name: wait_killcam_time
	Namespace: killcam
	Checksum: 0x77D7BDB9
	Offset: 0x1CD0
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function wait_killcam_time()
{
	self endon(#"disconnect", #"end_killcam", #"begin_killcam");
	wait(self.killcamlength - 0.05);
	self end_killcam();
}

/*
	Name: wait_final_killcam_slowdown
	Namespace: killcam
	Checksum: 0xB2CC2A06
	Offset: 0x1D38
	Size: 0x134
	Parameters: 2
	Flags: Linked
*/
function wait_final_killcam_slowdown(deathtime, starttime)
{
	self endon(#"disconnect", #"end_killcam");
	secondsuntildeath = (float(deathtime - starttime)) / 1000;
	deathtime = gettime() + (int(secondsuntildeath * 1000));
	waitbeforedeath = 2;
	wait(max(0, secondsuntildeath - waitbeforedeath));
	util::setclientsysstate("levelNotify", "sndFKsl");
	setslowmotion(1, 0.25, waitbeforedeath);
	wait(waitbeforedeath + 0.5);
	setslowmotion(0.25, 1, 1);
	wait(0.5);
}

/*
	Name: function_875fc588
	Namespace: killcam
	Checksum: 0xCA85A22D
	Offset: 0x1E78
	Size: 0x7C
	Parameters: 0
	Flags: Linked
*/
function function_875fc588()
{
	if(!isdefined(self.killcamsskipped))
	{
		self.killcamsskipped = 0;
	}
	self.killcamsskipped++;
	self clientfield::set_player_uimodel("hudItems.killcamActive", 0);
	self end_killcam();
	self util::clientnotify("fkce");
}

/*
	Name: wait_skip_killcam_button
	Namespace: killcam
	Checksum: 0xE2CACA44
	Offset: 0x1F00
	Size: 0x9C
	Parameters: 0
	Flags: Linked
*/
function wait_skip_killcam_button()
{
	self endon(#"disconnect", #"end_killcam");
	while(self usebuttonpressed())
	{
		waitframe(1);
	}
	while(!self usebuttonpressed())
	{
		waitframe(1);
	}
	if(!is_true(self.var_eca4c67f))
	{
		function_875fc588();
	}
}

/*
	Name: function_fa405b23
	Namespace: killcam
	Checksum: 0xEE5710F2
	Offset: 0x1FA8
	Size: 0x9C
	Parameters: 0
	Flags: Linked
*/
function function_fa405b23()
{
	self endon(#"disconnect", #"end_killcam");
	while(self jumpbuttonpressed())
	{
		waitframe(1);
	}
	while(!self jumpbuttonpressed())
	{
		waitframe(1);
	}
	if(!is_true(self.var_eca4c67f))
	{
		function_875fc588();
	}
}

/*
	Name: wait_team_change_end_killcam
	Namespace: killcam
	Checksum: 0xC96C80E2
	Offset: 0x2050
	Size: 0x74
	Parameters: 0
	Flags: Linked
*/
function wait_team_change_end_killcam()
{
	self endon(#"disconnect", #"end_killcam");
	self waittill(#"changed_class", #"joined_team");
	end(0);
	self end_killcam();
}

/*
	Name: wait_skip_killcam_safe_spawn_button
	Namespace: killcam
	Checksum: 0xA73B2732
	Offset: 0x20D0
	Size: 0x8C
	Parameters: 0
	Flags: None
*/
function wait_skip_killcam_safe_spawn_button()
{
	self endon(#"disconnect", #"end_killcam");
	while(self fragbuttonpressed())
	{
		waitframe(1);
	}
	while(!self fragbuttonpressed())
	{
		waitframe(1);
	}
	self.wantsafespawn = 1;
	self end_killcam();
}

/*
	Name: end
	Namespace: killcam
	Checksum: 0x59203227
	Offset: 0x2168
	Size: 0x8C
	Parameters: 1
	Flags: Linked
*/
function end(final)
{
	self.killcam = undefined;
	self callback::function_52ac9652(#"on_end_game", &on_end_game);
	self callback::function_52ac9652(#"on_end_game", &function_f5f2d8e6);
	self thread spectating::set_permissions();
}

/*
	Name: check_for_abrupt_end
	Namespace: killcam
	Checksum: 0xE8094982
	Offset: 0x2200
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function check_for_abrupt_end()
{
	self endon(#"disconnect", #"end_killcam");
	while(true)
	{
		if(self.archivetime <= 0)
		{
			break;
		}
		waitframe(1);
	}
	self end_killcam();
}

/*
	Name: spawned_killcam_cleanup
	Namespace: killcam
	Checksum: 0xF96FEC9D
	Offset: 0x2270
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function spawned_killcam_cleanup()
{
	self endon(#"end_killcam", #"disconnect");
	self waittill(#"spawned");
	self end(0);
}

/*
	Name: spectator_killcam_cleanup
	Namespace: killcam
	Checksum: 0x8CE626D2
	Offset: 0x22D0
	Size: 0xBC
	Parameters: 1
	Flags: None
*/
function spectator_killcam_cleanup(attacker)
{
	self endon(#"end_killcam", #"disconnect");
	attacker endon(#"disconnect");
	waitresult = undefined;
	waitresult = attacker waittill(#"begin_killcam");
	waittime = max(0, (waitresult.start_time - self.deathtime) - 50);
	wait(waittime);
	self end(0);
}

/*
	Name: on_end_game
	Namespace: killcam
	Checksum: 0xDF955A2C
	Offset: 0x2398
	Size: 0x50
	Parameters: 0
	Flags: Linked
*/
function on_end_game()
{
	if(level.var_7abccc83)
	{
		self notify(#"game_ended");
		self end(0);
		self [[level.spawnspectator]](0);
	}
}

/*
	Name: function_f5f2d8e6
	Namespace: killcam
	Checksum: 0x94D523C3
	Offset: 0x23F0
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function function_f5f2d8e6()
{
	self notify(#"game_ended");
	self end(1);
}

/*
	Name: cancel_use_button
	Namespace: killcam
	Checksum: 0xE147F70F
	Offset: 0x2428
	Size: 0x1A
	Parameters: 0
	Flags: Linked
*/
function cancel_use_button()
{
	return self usebuttonpressed();
}

/*
	Name: cancel_safe_spawn_button
	Namespace: killcam
	Checksum: 0x96A2E4DE
	Offset: 0x2450
	Size: 0x1A
	Parameters: 0
	Flags: None
*/
function cancel_safe_spawn_button()
{
	return self fragbuttonpressed();
}

/*
	Name: cancel_callback
	Namespace: killcam
	Checksum: 0xF708D606
	Offset: 0x2478
	Size: 0x12
	Parameters: 0
	Flags: Linked
*/
function cancel_callback()
{
	self.cancelkillcam = 1;
}

/*
	Name: cancel_safe_spawn_callback
	Namespace: killcam
	Checksum: 0xEFB27ED
	Offset: 0x2498
	Size: 0x1E
	Parameters: 0
	Flags: None
*/
function cancel_safe_spawn_callback()
{
	self.cancelkillcam = 1;
	self.wantsafespawn = 1;
}

/*
	Name: cancel_on_use
	Namespace: killcam
	Checksum: 0x85261692
	Offset: 0x24C0
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function cancel_on_use()
{
	self thread cancel_on_use_specific_button(&cancel_use_button, &cancel_callback);
}

/*
	Name: cancel_on_use_specific_button
	Namespace: killcam
	Checksum: 0xED4E8D93
	Offset: 0x2500
	Size: 0x120
	Parameters: 2
	Flags: Linked
*/
function cancel_on_use_specific_button(pressingbuttonfunc, finishedfunc)
{
	self endon(#"death_delay_finished", #"disconnect", #"game_ended");
	for(;;)
	{
		if(!self [[pressingbuttonfunc]]())
		{
			waitframe(1);
			continue;
		}
		buttontime = 0;
		while(self [[pressingbuttonfunc]]())
		{
			buttontime = buttontime + 0.05;
			waitframe(1);
		}
		if(buttontime >= 0.5)
		{
			continue;
		}
		buttontime = 0;
		while(!self [[pressingbuttonfunc]]() && buttontime < 0.5)
		{
			buttontime = buttontime + 0.05;
			waitframe(1);
		}
		if(buttontime >= 0.5)
		{
			continue;
		}
		self [[finishedfunc]]();
		return;
	}
}

/*
	Name: final_killcam_internal
	Namespace: killcam
	Checksum: 0xFB2BE995
	Offset: 0x2628
	Size: 0x3D2
	Parameters: 1
	Flags: Linked
*/
function final_killcam_internal(winner)
{
	winning_team = function_de2b637d(winner);
	killcamsettings = level.finalkillcamsettings[winning_team];
	postdeathdelay = (float(gettime() - killcamsettings.deathtime)) / 1000;
	predelay = postdeathdelay + killcamsettings.deathtimeoffset;
	killcamentitystarttime = get_killcam_entity_info_starttime(killcamsettings.killcam_entity_info);
	camtime = calc_time(killcamsettings.weapon, killcamentitystarttime, predelay, undefined, killcamsettings.killcam_entity_info.var_30f79181);
	postdelay = calc_post_delay();
	killcamoffset = camtime + predelay;
	killcamlength = (camtime + postdelay) - 0.05;
	killcamstarttime = gettime() - (int(killcamoffset * 1000));
	self notify(#"begin_killcam", {#start_time:gettime()});
	util::setclientsysstate("levelNotify", "sndFKs");
	self.sessionstate = "spectator";
	self.spectatorclient = killcamsettings.spectatorclient;
	self.killcamentity = -1;
	self thread set_killcam_entities(killcamsettings.killcam_entity_info, killcamstarttime);
	self.killcamtargetentity = killcamsettings.targetentityindex;
	self.killcamweapon = killcamsettings.weapon;
	self.killcammod = killcamsettings.meansofdeath;
	self.archivetime = killcamoffset;
	self.killcamlength = killcamlength;
	self.psoffsettime = killcamsettings.offsettime;
	self allowspectateallteams(1);
	self allowspectateteam("freelook", 1);
	self allowspectateteam(#"none", 1);
	self callback::function_d8abfc3d(#"on_end_game", &function_f5f2d8e6);
	waitframe(1);
	if(self.archivetime <= predelay)
	{
		self.spectatorclient = -1;
		self.killcamentity = -1;
		self.archivetime = 0;
		self.psoffsettime = 0;
		self.spectatekillcam = 0;
		self end_killcam();
		return;
	}
	self thread check_for_abrupt_end();
	self.killcam = 1;
	self thread wait_killcam_time();
	self thread wait_final_killcam_slowdown(level.finalkillcamsettings[winning_team].deathtime, killcamstarttime);
	self waittill(#"end_killcam");
}

/*
	Name: final_killcam
	Namespace: killcam
	Checksum: 0xB121B397
	Offset: 0x2A08
	Size: 0x29C
	Parameters: 1
	Flags: Linked
*/
function final_killcam(winner)
{
	self endon(#"disconnect");
	level endon(#"game_ended");
	if(util::waslastround())
	{
		setmatchflag("final_killcam", 1);
		setmatchflag("round_end_killcam", 0);
	}
	else
	{
		setmatchflag("final_killcam", 0);
		setmatchflag("round_end_killcam", 1);
	}
	/#
		if(getdvarint(#"scr_force_finalkillcam", 0) == 1)
		{
			setmatchflag("", 1);
			setmatchflag("", 0);
		}
	#/
	/#
		while(getdvarint(#"scr_endless_finalkillcam", 0) == 1)
		{
			final_killcam_internal(winner);
		}
	#/
	luinotifyevent(#"hash_4448c66c7f84aa68");
	luinotifyevent(#"hash_6bb70498f448d405");
	final_killcam_internal(winner);
	util::setclientsysstate("levelNotify", "sndFKe");
	luinotifyevent(#"post_killcam_transition");
	self val::set(#"killcam", "freezecontrols", 1);
	self end(1);
	setmatchflag("final_killcam", 0);
	setmatchflag("round_end_killcam", 0);
	self spawn_end_of_final_killcam();
}

/*
	Name: spawn_end_of_final_killcam
	Namespace: killcam
	Checksum: 0x6F185F76
	Offset: 0x2CB0
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function spawn_end_of_final_killcam()
{
	self visionset_mgr::player_shutdown();
}

/*
	Name: is_entity_weapon
	Namespace: killcam
	Checksum: 0x169805D
	Offset: 0x2CD8
	Size: 0x30
	Parameters: 1
	Flags: Linked
*/
function is_entity_weapon(weapon)
{
	if(weapon.statname == #"planemortar")
	{
		return true;
	}
	return false;
}

/*
	Name: calc_time
	Namespace: killcam
	Checksum: 0xB0E75CF0
	Offset: 0x2D10
	Size: 0x1A6
	Parameters: 6
	Flags: Linked
*/
function calc_time(weapon, entitystarttime, predelay, maxtime, var_30f79181, meansofdeath)
{
	camtime = 0;
	if(getdvarstring(#"scr_killcam_time") == "")
	{
		if(meansofdeath == "MOD_EXECUTION")
		{
			camtime = getdvarfloat(#"hash_239216bd62cd21a6", level.killcamtime);
		}
		else
		{
			if(is_entity_weapon(weapon) || var_30f79181 === 1 && entitystarttime > 0)
			{
				camtime = (((float(gettime() - entitystarttime)) / 1000) - predelay) - 0.1;
			}
			else
			{
				if(weapon.isgrenadeweapon)
				{
					camtime = level.var_a95350da;
				}
				else
				{
					camtime = level.killcamtime;
				}
			}
		}
	}
	else
	{
		camtime = getdvarfloat(#"scr_killcam_time", 0);
	}
	if(isdefined(maxtime))
	{
		if(camtime > maxtime)
		{
			camtime = maxtime;
		}
		if(camtime < 0.05)
		{
			camtime = 0.05;
		}
	}
	return camtime;
}

/*
	Name: calc_post_delay
	Namespace: killcam
	Checksum: 0xD24A2A61
	Offset: 0x2EC0
	Size: 0x8E
	Parameters: 0
	Flags: Linked
*/
function calc_post_delay()
{
	postdelay = 0;
	if(getdvarstring(#"scr_killcam_posttime") == "")
	{
		postdelay = 2;
	}
	else
	{
		postdelay = getdvarfloat(#"scr_killcam_posttime", 0);
		if(postdelay < 0.05)
		{
			postdelay = 0.05;
		}
	}
	return postdelay;
}

/*
	Name: get_closest_killcam_entity
	Namespace: killcam
	Checksum: 0x6A169D29
	Offset: 0x2F58
	Size: 0x1DA
	Parameters: 3
	Flags: Linked
*/
function get_closest_killcam_entity(attacker, killcamentities, depth)
{
	if(!isdefined(depth))
	{
		depth = 0;
	}
	closestkillcament = undefined;
	closestkillcamentindex = undefined;
	closestkillcamentdist = undefined;
	origin = undefined;
	foreach(killcamentindex, killcament in killcamentities)
	{
		if(killcament == attacker)
		{
			continue;
		}
		origin = killcament.origin;
		if(isdefined(killcament.offsetpoint))
		{
			origin = origin + killcament.offsetpoint;
		}
		dist = distancesquared(self.origin, origin);
		if(!isdefined(closestkillcament) || dist < closestkillcamentdist)
		{
			closestkillcament = killcament;
			closestkillcamentdist = dist;
			closestkillcamentindex = killcamentindex;
		}
	}
	if(depth < 3 && isdefined(closestkillcament))
	{
		if(!bullettracepassed(closestkillcament.origin, self.origin, 0, self))
		{
			killcamentities[closestkillcamentindex] = undefined;
			betterkillcament = get_closest_killcam_entity(attacker, killcamentities, depth + 1);
			if(isdefined(betterkillcament))
			{
				closestkillcament = betterkillcament;
			}
		}
	}
	return closestkillcament;
}

/*
	Name: get_killcam_entity
	Namespace: killcam
	Checksum: 0x4A18E9C6
	Offset: 0x3140
	Size: 0x3E0
	Parameters: 3
	Flags: Linked
*/
function get_killcam_entity(attacker, einflictor, weapon)
{
	if(!isdefined(einflictor))
	{
		return undefined;
	}
	if(isdefined(self.killcamkilledbyent))
	{
		return self.killcamkilledbyent;
	}
	if(isdefined(level.var_93a0cd8f[weapon.name]))
	{
		var_3808f6bd = level [[level.var_93a0cd8f[weapon.name]]](attacker, einflictor);
		if(isdefined(var_3808f6bd))
		{
			return var_3808f6bd;
		}
	}
	if(einflictor == attacker)
	{
		if(isai(einflictor))
		{
			return einflictor;
		}
		if(isvehicle(einflictor) && isdefined(einflictor.killcament))
		{
			return einflictor.killcament;
		}
		if(!isdefined(einflictor.ismagicbullet))
		{
			return undefined;
		}
		if(isdefined(einflictor.ismagicbullet) && !einflictor.ismagicbullet)
		{
			return undefined;
		}
	}
	else if(isdefined(level.levelspecifickillcam))
	{
		levelspecifickillcament = self [[level.levelspecifickillcam]]();
		if(isdefined(levelspecifickillcament))
		{
			return levelspecifickillcament;
		}
	}
	if(weapon.name == #"hero_gravityspikes")
	{
		return undefined;
	}
	if(isdefined(attacker) && isplayer(attacker) && attacker isremotecontrolling() && (einflictor.controlled === 1 || einflictor.occupied === 1))
	{
		if(weapon.name == #"sentinel_turret" || weapon.name == #"amws_gun_turret_mp_player" || weapon.name == #"auto_gun_turret")
		{
			return undefined;
		}
	}
	if(weapon.name == #"dart")
	{
		return undefined;
	}
	if(isdefined(einflictor.killcament))
	{
		if(einflictor.killcament == attacker || is_true(attacker.var_5c5fca5))
		{
			return undefined;
		}
		return einflictor.killcament;
	}
	if(isdefined(einflictor.killcamentities))
	{
		return get_closest_killcam_entity(attacker, einflictor.killcamentities);
	}
	if(isdefined(einflictor.script_gameobjectname) && einflictor.script_gameobjectname == "bombzone")
	{
		return einflictor.killcament;
	}
	if(isai(attacker))
	{
		return attacker;
	}
	if(isplayer(attacker) && isvehicle(einflictor))
	{
		if(attacker getvehicleoccupied() === einflictor)
		{
			if(!attacker isremotecontrolling() || is_true(attacker.var_5c5fca5))
			{
				return undefined;
			}
		}
	}
	return einflictor;
}

/*
	Name: get_secondary_killcam_entity
	Namespace: killcam
	Checksum: 0xBDC5C1A8
	Offset: 0x3528
	Size: 0x70
	Parameters: 2
	Flags: Linked
*/
function get_secondary_killcam_entity(entity, entity_info)
{
	if(!isdefined(entity) || !isdefined(entity.killcamentityindex))
	{
		return;
	}
	entity_info.entity_indexes[entity_info.entity_indexes.size] = entity.killcamentityindex;
	entity_info.entity_spawntimes[entity_info.entity_spawntimes.size] = entity.killcamentitystarttime;
}

/*
	Name: get_primary_killcam_entity
	Namespace: killcam
	Checksum: 0x11A8225F
	Offset: 0x35A0
	Size: 0x1D4
	Parameters: 4
	Flags: Linked
*/
function get_primary_killcam_entity(attacker, einflictor, weapon, entity_info)
{
	killcamentity = self get_killcam_entity(attacker, einflictor, weapon);
	if(isdefined(level.var_ef3352fc) && isdefined(level.var_ef3352fc[weapon.name]))
	{
		if(isdefined(einflictor) && isdefined(einflictor.owner) && isdefined(einflictor.owner.killcament))
		{
			killcamentity store_killcam_entity_on_entity(einflictor.owner.killcament);
		}
	}
	killcamentitystarttime = get_killcam_entity_start_time(killcamentity);
	killcamentityindex = -1;
	if(isdefined(killcamentity))
	{
		killcamentityindex = killcamentity getentitynumber();
	}
	else
	{
		var_a5dd317c = self function_af5b3411();
		if(isdefined(var_a5dd317c))
		{
			killcamentityindex = var_a5dd317c;
			killcamentitystarttime = self function_cefc1515() - 750;
			if(killcamentitystarttime < 0)
			{
				killcamentitystarttime = 0;
			}
			entity_info.var_30f79181 = 1;
		}
	}
	entity_info.entity_indexes[entity_info.entity_indexes.size] = killcamentityindex;
	entity_info.entity_spawntimes[entity_info.entity_spawntimes.size] = killcamentitystarttime;
	get_secondary_killcam_entity(killcamentity, entity_info);
}

/*
	Name: get_killcam_entity_info
	Namespace: killcam
	Checksum: 0x1B4D6E51
	Offset: 0x3780
	Size: 0x70
	Parameters: 3
	Flags: Linked
*/
function get_killcam_entity_info(attacker, einflictor, weapon)
{
	entity_info = spawnstruct();
	entity_info.entity_indexes = [];
	entity_info.entity_spawntimes = [];
	get_primary_killcam_entity(attacker, einflictor, weapon, entity_info);
	return entity_info;
}

/*
	Name: get_killcam_entity_info_starttime
	Namespace: killcam
	Checksum: 0xDFC8C19
	Offset: 0x37F8
	Size: 0x40
	Parameters: 1
	Flags: Linked
*/
function get_killcam_entity_info_starttime(entity_info)
{
	if(entity_info.entity_spawntimes.size == 0)
	{
		return 0;
	}
	return entity_info.entity_spawntimes[entity_info.entity_spawntimes.size - 1];
}

/*
	Name: function_4789a39a
	Namespace: killcam
	Checksum: 0xC0BD2B7A
	Offset: 0x3840
	Size: 0x24
	Parameters: 2
	Flags: None
*/
function function_4789a39a(weaponname, func)
{
	level.var_93a0cd8f[weaponname] = func;
}

