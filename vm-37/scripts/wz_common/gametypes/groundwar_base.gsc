#using script_bf0c2c69ce5745e;
#using script_b9a55edd207e4ca;
#using scripts\mp_common\util.gsc;
#using scripts\mp_common\player\player_utils.gsc;
#using script_1304295570304027;
#using scripts\mp_common\gametypes\overtime.gsc;
#using scripts\mp_common\gametypes\globallogic_utils.gsc;
#using script_1cc417743d7c262d;
#using scripts\mp_common\gametypes\globallogic.gsc;
#using scripts\mp_common\challenges.gsc;
#using scripts\killstreaks\planemortar_shared.gsc;
#using script_7a8059ca02b7b09e;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\sound_shared.gsc;
#using script_44b0b8420eabacad;
#using script_335d0650ed05d36d;
#using scripts\core_common\potm_shared.gsc;
#using scripts\core_common\popups_shared.gsc;
#using scripts\core_common\medals_shared.gsc;
#using scripts\core_common\hostmigration_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\demo_shared.gsc;

#namespace groundwar_base;

/*
	Name: main
	Namespace: groundwar_base
	Checksum: 0xC4E3427
	Offset: 0x300
	Size: 0x11C
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	namespace_2938acdc::init();
	spawning::function_c40af6fa();
	spawning::addsupportedspawnpointtype("base");
	level.onstartgametype = &onstartgametype;
	callback::on_spawned(&onspawnplayer);
	callback::on_game_playing(&function_3a7ee360);
	player::function_cf3aa03d(&onplayerkilled);
	level.ddbombmodel = [];
	level.var_3cf1b85 = "bombzone";
	level.var_cd008cab = &function_c5764b12;
	level.var_fd30a287 = &function_4d528908;
	gameobjects::register_allowed_gameobject(level.var_3cf1b85);
}

/*
	Name: onstartgametype
	Namespace: groundwar_base
	Checksum: 0x7F18818
	Offset: 0x428
	Size: 0xDC
	Parameters: 0
	Flags: None
*/
function onstartgametype()
{
	setbombtimer("A", 0);
	setmatchflag("bomb_timer_a", 0);
	setbombtimer("B", 0);
	setmatchflag("bomb_timer_b", 0);
	level._effect[#"bombexplosion"] = #"hash_5146504768c835f";
	bombzones = getentarray(level.var_3cf1b85, "targetname");
	thread updategametypedvars();
	thread bombs();
}

/*
	Name: function_3a7ee360
	Namespace: groundwar_base
	Checksum: 0x5A77620
	Offset: 0x510
	Size: 0xF4
	Parameters: 0
	Flags: None
*/
function function_3a7ee360()
{
	foreach(bombzone in level.bombzones)
	{
		if(!is_true(bombzone.var_a9ecfe20))
		{
			setup_doors(bombzone);
		}
	}
	namespace_5c32f369::update_settings();
	if(namespace_5c32f369::function_dbba0e25())
	{
		level.domflags = namespace_5c32f369::setup_capture_zones(&function_b4ab93bd);
	}
}

/*
	Name: function_c521ddc8
	Namespace: groundwar_base
	Checksum: 0x27817671
	Offset: 0x610
	Size: 0x94
	Parameters: 2
	Flags: None
*/
function function_c521ddc8(door, bombzone)
{
	door waittill(#"broken", #"death");
	if(!bombzone.var_49957ef3)
	{
		bombzone.var_49957ef3 = 1;
		bombzone gameobjects::allow_use(#"hash_33c49a99551acae7");
		bombzone.trigger setcursorhint("HINT_INTERACTIVE_PROMPT");
	}
}

/*
	Name: setup_doors
	Namespace: groundwar_base
	Checksum: 0xC5D4DD5D
	Offset: 0x6B0
	Size: 0xB0
	Parameters: 1
	Flags: None
*/
function setup_doors(bombzone)
{
	foreach(door in bombzone.doors)
	{
		door setcandamage(1);
		thread function_c521ddc8(door, bombzone);
	}
}

/*
	Name: onspawnplayer
	Namespace: groundwar_base
	Checksum: 0x255EBB28
	Offset: 0x768
	Size: 0x26
	Parameters: 0
	Flags: None
*/
function onspawnplayer()
{
	self.isplanting = 0;
	self.isdefusing = 0;
	self.isbombcarrier = 0;
}

/*
	Name: onplayerkilled
	Namespace: groundwar_base
	Checksum: 0x265F127
	Offset: 0x798
	Size: 0x37C
	Parameters: 9
	Flags: None
*/
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration)
{
	bombzone = undefined;
	for(index = 0; index < level.bombzones.size; index++)
	{
		if(!isdefined(level.bombzones[index].bombexploded) || !level.bombzones[index].bombexploded)
		{
			dist = distance2dsquared(self.origin, level.bombzones[index].curorigin);
			if(dist < level.defaultoffenseradiussq)
			{
				bombzone = level.bombzones[index];
				break;
			}
			dist = distance2dsquared(psoffsettime.origin, level.bombzones[index].curorigin);
			if(dist < level.defaultoffenseradiussq)
			{
				inbombzone = 1;
				break;
			}
		}
	}
	if(isdefined(bombzone) && isplayer(psoffsettime) && psoffsettime.pers[#"team"] != self.pers[#"team"])
	{
		if(bombzone gameobjects::get_owner_team() != psoffsettime.team)
		{
			if(!isdefined(psoffsettime.var_c6ebcbd7))
			{
				psoffsettime.var_c6ebcbd7 = 0;
			}
			psoffsettime.var_c6ebcbd7++;
			if(level.playeroffensivemax >= psoffsettime.var_c6ebcbd7)
			{
				psoffsettime medals::offenseglobalcount();
				psoffsettime thread challenges::killedbasedefender(bombzone.trigger);
			}
			else
			{
				/#
					psoffsettime iprintlnbold("");
				#/
			}
		}
		else
		{
			if(!isdefined(psoffsettime.var_80aeaf59))
			{
				psoffsettime.var_80aeaf59 = 0;
			}
			psoffsettime.var_80aeaf59++;
			if(level.playerdefensivemax >= psoffsettime.var_80aeaf59)
			{
				if(isdefined(psoffsettime.pers[#"defends"]))
				{
					psoffsettime.pers[#"defends"]++;
					psoffsettime.defends = psoffsettime.pers[#"defends"];
				}
				psoffsettime medals::defenseglobalcount();
				psoffsettime thread challenges::killedbaseoffender(bombzone.trigger, deathanimduration, shitloc);
			}
			else
			{
				/#
					psoffsettime iprintlnbold("");
				#/
			}
		}
	}
}

/*
	Name: end_round
	Namespace: groundwar_base
	Checksum: 0x1D61750D
	Offset: 0xB20
	Size: 0xC4
	Parameters: 2
	Flags: None
*/
function end_round(winningteam, var_c1e98979)
{
	foreach(bombzone in level.bombzones)
	{
		bombzone gameobjects::set_visible(#"hash_161f03feaadc9b8f");
	}
	thread globallogic::function_a3e3bd39(winningteam, var_c1e98979);
}

/*
	Name: updategametypedvars
	Namespace: groundwar_base
	Checksum: 0x4AA5518F
	Offset: 0xBF0
	Size: 0x1BC
	Parameters: 0
	Flags: None
*/
function updategametypedvars()
{
	level.planttime = getgametypesetting(#"planttime");
	level.defusetime = getgametypesetting(#"defusetime");
	level.bombtimer = getgametypesetting(#"bombtimer");
	level.extratime = getgametypesetting(#"extratime");
	level.overtimetimelimit = getgametypesetting(#"overtimetimelimit");
	level.teamkillpenaltymultiplier = getgametypesetting(#"teamkillpenalty");
	level.teamkillscoremultiplier = getgametypesetting(#"teamkillscore");
	level.playereventslpm = getgametypesetting(#"maxplayereventsperminute");
	level.bombeventslpm = getgametypesetting(#"maxobjectiveeventsperminute");
	level.playeroffensivemax = getgametypesetting(#"maxplayeroffensive");
	level.playerdefensivemax = getgametypesetting(#"maxplayerdefensive");
}

/*
	Name: resetbombzone
	Namespace: groundwar_base
	Checksum: 0xAE589FB8
	Offset: 0xDB8
	Size: 0x1E2
	Parameters: 0
	Flags: None
*/
function resetbombzone()
{
	if(overtime::is_overtime_round())
	{
		self gameobjects::set_owner_team(#"neutral");
		self gameobjects::allow_use(#"hash_5ccfd7bbbf07c770");
	}
	else
	{
		self gameobjects::allow_use(#"hash_33c49a99551acae7");
	}
	self gameobjects::set_use_time(level.planttime);
	self gameobjects::set_use_text(#"hash_1fd43fb1addaf0aa");
	self gameobjects::set_use_hint_text(#"hash_10c61997a0f3235");
	self gameobjects::set_2d_icon(#"hash_150a20fa4efc5c7a", "waypoint_defend" + self.label);
	self gameobjects::set_3d_icon(#"hash_150a20fa4efc5c7a", "waypoint_defend" + self.label);
	self gameobjects::set_2d_icon(#"hash_33c49a99551acae7", "waypoint_target" + self.label);
	self gameobjects::set_3d_icon(#"hash_33c49a99551acae7", "waypoint_target" + self.label);
	self gameobjects::set_visible(#"hash_5ccfd7bbbf07c770");
	self.useweapon = getweapon(#"briefcase_bomb");
}

/*
	Name: setupfordefusing
	Namespace: groundwar_base
	Checksum: 0xF552697A
	Offset: 0xFA8
	Size: 0xA4
	Parameters: 0
	Flags: None
*/
function setupfordefusing()
{
	self gameobjects::allow_use(#"hash_150a20fa4efc5c7a");
	self gameobjects::set_use_time(level.defusetime);
	self gameobjects::set_use_text(#"hash_c01b634e9ce264c");
	self gameobjects::set_use_hint_text(#"hash_754b795109a2bbba");
	self gameobjects::set_visible(#"hash_5ccfd7bbbf07c770");
}

/*
	Name: bombs
	Namespace: groundwar_base
	Checksum: 0xA8A66A9B
	Offset: 0x1058
	Size: 0x676
	Parameters: 0
	Flags: None
*/
function bombs()
{
	level.bombaplanted = 0;
	level.bombbplanted = 0;
	level.bombplanted = 0;
	level.bombzones = [];
	level.var_9fb20124 = [];
	bombzones = getentarray(level.var_3cf1b85, "targetname");
	for(index = 0; index < bombzones.size; index++)
	{
		trigger = bombzones[index];
		scriptlabel = trigger.script_label;
		clipbrushes = getentarray("bombzone_clip" + scriptlabel, "targetname");
		visuals = getentarray(bombzones[index].target, "targetname");
		bombsiteteamowner = trigger.script_team;
		name = #"base" + scriptlabel;
		bombzone = gameobjects::create_use_object(bombsiteteamowner, trigger, visuals, (0, 0, 0), name, 1, 1);
		bombzone gameobjects::set_use_time(level.planttime);
		bombzone gameobjects::set_use_text(#"hash_1fd43fb1addaf0aa");
		bombzone gameobjects::set_visible(#"hash_5ccfd7bbbf07c770");
		if(scriptlabel == "_c")
		{
			level.var_9fb20124[trigger.script_team] = bombzone;
			bombzone.var_a9ecfe20 = 1;
			bombzone gameobjects::hide_waypoint();
		}
		bombzone.var_49957ef3 = 0;
		bombzone.trigger = trigger;
		bombzone.team = trigger.script_team;
		bombzone.label = scriptlabel;
		bombzone.index = index;
		bombzone.onbeginuse = &onbeginuse;
		bombzone.onenduse = &onenduse;
		bombzone.onuse = &onuseobject;
		bombzone.oncantuse = &oncantuse;
		bombzone.useweapon = getweapon(#"briefcase_bomb");
		bombzone.visuals[0].killcament = spawn("script_model", bombzone.visuals[0].origin + vectorscale((0, 0, 1), 128));
		if(isdefined(level.bomb_zone_fixup))
		{
			[[level.bomb_zone_fixup]](bombzone);
		}
		for(i = 0; i < visuals.size; i++)
		{
			if(isdefined(visuals[i].script_exploder))
			{
				bombzone.exploderindex = visuals[i].script_exploder;
				break;
			}
		}
		foreach(visual in bombzone.visuals)
		{
			visual.team = #"neutral";
		}
		level.bombzones[level.bombzones.size] = bombzone;
		defusetrig = getent(visuals[0].target, "targetname");
		bombzone.bombdefusetrig = defusetrig;
		/#
			assert(isdefined(bombzone.bombdefusetrig));
		#/
		bombzone.bombdefusetrig.origin = bombzone.bombdefusetrig.origin + (vectorscale((0, 0, -1), 10000));
		bombzone.bombdefusetrig.label = scriptlabel;
		doors = getentarray(defusetrig.target, "targetname");
		bombzone.doors = doors;
		foreach(door in doors)
		{
			door setcandamage(0);
			door.bombzone = bombzone;
		}
		team_mask = util::getteammask(game.attackers);
	}
	for(index = 0; index < level.bombzones.size; index++)
	{
		array = [];
		for(otherindex = 0; otherindex < level.bombzones.size; otherindex++)
		{
			if(otherindex != index)
			{
				array[array.size] = level.bombzones[otherindex];
			}
		}
		level.bombzones[index].otherbombzones = array;
	}
}

/*
	Name: setbomboverheatingafterweaponchange
	Namespace: groundwar_base
	Checksum: 0xC46258DD
	Offset: 0x16D8
	Size: 0xBC
	Parameters: 3
	Flags: None
*/
function setbomboverheatingafterweaponchange(useobject, overheated, heat)
{
	self endon(#"death", #"disconnect", #"joined_team", #"joined_spectators");
	waitresult = undefined;
	waitresult = self waittill(#"weapon_change");
	if(waitresult.weapon == useobject.useweapon)
	{
		self setweaponoverheating(overheated, heat, waitresult.weapon);
	}
}

/*
	Name: function_208ed5d5
	Namespace: groundwar_base
	Checksum: 0x311B5CCA
	Offset: 0x17A0
	Size: 0x88
	Parameters: 1
	Flags: None
*/
function function_208ed5d5(team)
{
	team = util::get_team_mapping(team);
	if(!level.teambased)
	{
		return true;
	}
	owner_team = self gameobjects::get_owner_team();
	if(owner_team == #"any")
	{
		return true;
	}
	if(owner_team == team)
	{
		return true;
	}
	return false;
}

/*
	Name: onbeginuse
	Namespace: groundwar_base
	Checksum: 0x7FF5B573
	Offset: 0x1830
	Size: 0x25C
	Parameters: 1
	Flags: None
*/
function onbeginuse(player)
{
	timeremaining = globallogic_utils::gettimeremaining();
	if(timeremaining <= (int(level.planttime * 1000)))
	{
		globallogic_utils::pausetimer();
		level.haspausedtimer = 1;
	}
	if(self function_208ed5d5(player.pers[#"team"]))
	{
		player playsound(#"mpl_sd_bomb_defuse");
		player.isdefusing = 1;
		player thread setbomboverheatingafterweaponchange(self, 0, 0);
		bestdistance = 9000000;
		closestbomb = undefined;
		if(isdefined(level.ddbombmodel))
		{
			keys = getarraykeys(level.ddbombmodel);
			for(bomblabel = 0; bomblabel < keys.size; bomblabel++)
			{
				bomb = level.ddbombmodel[keys[bomblabel]];
				if(!isdefined(bomb))
				{
					continue;
				}
				dist = distancesquared(player.origin, bomb.origin);
				if(dist < bestdistance)
				{
					bestdistance = dist;
					closestbomb = bomb;
				}
			}
			/#
				assert(isdefined(closestbomb));
			#/
			player.defusing = closestbomb;
			closestbomb hide();
		}
	}
	else
	{
		player.isplanting = 1;
		player thread setbomboverheatingafterweaponchange(self, 0, 0);
	}
	player playsound(#"fly_bomb_raise_plr");
}

/*
	Name: onenduse
	Namespace: groundwar_base
	Checksum: 0xE603789B
	Offset: 0x1A98
	Size: 0xF4
	Parameters: 3
	Flags: None
*/
function onenduse(team, player, result)
{
	if(!isdefined(player))
	{
		return;
	}
	if(!level.bombaplanted && !level.bombbplanted)
	{
		globallogic_utils::resumetimer();
		level.haspausedtimer = 0;
	}
	player.isdefusing = 0;
	player.isplanting = 0;
	player notify(#"event_ended");
	if(self function_208ed5d5(player.pers[#"team"]))
	{
		if(isdefined(player.defusing) && !result)
		{
			player.defusing show();
		}
	}
}

/*
	Name: oncantuse
	Namespace: groundwar_base
	Checksum: 0xAFAAC2D
	Offset: 0x1B98
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function oncantuse(player)
{
	player iprintlnbold(#"hash_480e9067f6524bf");
}

/*
	Name: onuseobject
	Namespace: groundwar_base
	Checksum: 0xD6EB25DA
	Offset: 0x1BD0
	Size: 0x55C
	Parameters: 1
	Flags: None
*/
function onuseobject(player)
{
	team = player.team;
	self updateeventsperminute();
	player updateeventsperminute();
	if(!self function_208ed5d5(team))
	{
		self gameobjects::set_flags(1);
		level thread bombplanted(self, player);
		/#
			print("" + self.label);
		#/
		player notify(#"bomb_planted");
		if(isdefined(player.pers[#"plants"]))
		{
			player.pers[#"plants"]++;
			player.plants = player.pers[#"plants"];
		}
		player.pers[#"objectives"]++;
		player.objectives = player.pers[#"objectives"];
		if(!isscoreboosting(player, self))
		{
			demo::bookmark(#"event", gettime(), player);
			potm::bookmark(#"event", gettime(), player);
			player stats::function_bb7eedf0(#"plants", 1);
			player stats::function_dad108fa(#"plants_defuses", 1);
			player recordgameevent("plant");
			level thread telemetry::function_18135b72(#"hash_540cddd637f71a5e", {#eventtype:#"plant", #player:player});
		}
		else
		{
			/#
				player iprintlnbold("");
			#/
		}
		level thread popups::displayteammessagetoall(#"hash_12473d7e6ed6e752", player);
		globallogic_audio::leader_dialog("bombPlanted");
	}
	else
	{
		self gameobjects::set_flags(0);
		player notify(#"bomb_defused");
		/#
			print("" + self.label);
		#/
		self thread bombdefused(player);
		self resetbombzone();
		if(isdefined(player.pers[#"defuses"]))
		{
			player.pers[#"defuses"]++;
			player.defuses = player.pers[#"defuses"];
		}
		player.pers[#"objectives"]++;
		player.objectives = player.pers[#"objectives"];
		if(!isscoreboosting(player, self))
		{
			demo::bookmark(#"event", gettime(), player);
			player stats::function_bb7eedf0(#"defuses", 1);
			player stats::function_dad108fa(#"plants_defuses", 1);
			player recordgameevent("defuse");
			level thread telemetry::function_18135b72(#"hash_540cddd637f71a5e", {#eventtype:#"defuse", #player:player});
		}
		else
		{
			/#
				player iprintlnbold("");
			#/
		}
		level thread popups::displayteammessagetoall(#"hash_53c3f7bb9aec1bcc", player);
		globallogic_audio::leader_dialog("bombDefused");
	}
}

/*
	Name: ondrop
	Namespace: groundwar_base
	Checksum: 0xA3BF7E96
	Offset: 0x2138
	Size: 0xF4
	Parameters: 1
	Flags: None
*/
function ondrop(player)
{
	if(!level.bombplanted)
	{
		globallogic_audio::leader_dialog("bombFriendlyDropped", player.pers[#"team"]);
		/#
			if(isdefined(player))
			{
				print("");
			}
			else
			{
				print("");
			}
		#/
	}
	player notify(#"event_ended");
	self gameobjects::set_3d_icon(#"hash_150a20fa4efc5c7a", "waypoint_bomb");
	sound::play_on_players(game.bomb_dropped_sound, game.attackers);
}

/*
	Name: onreset
	Namespace: groundwar_base
	Checksum: 0x80F724D1
	Offset: 0x2238
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function onreset()
{
}

/*
	Name: bombreset
	Namespace: groundwar_base
	Checksum: 0xE27C939D
	Offset: 0x2248
	Size: 0x10C
	Parameters: 2
	Flags: None
*/
function bombreset(label, reason)
{
	if(reason == "_a" || reason == "_c")
	{
		reason = "_a";
		level.bombaplanted = 0;
		setbombtimer("A", 0);
	}
	else
	{
		level.bombbplanted = 0;
		setbombtimer("B", 0);
	}
	setmatchflag("bomb_timer" + reason, 0);
	if(!level.bombaplanted && !level.bombbplanted)
	{
		globallogic_utils::resumetimer();
	}
	self.visuals[0] globallogic_utils::stoptickingsound();
}

/*
	Name: dropbombmodel
	Namespace: groundwar_base
	Checksum: 0xD7900F40
	Offset: 0x2360
	Size: 0x25C
	Parameters: 2
	Flags: None
*/
function dropbombmodel(player, site)
{
	trace = bullettrace(player.origin + vectorscale((0, 0, 1), 20), player.origin - vectorscale((0, 0, 1), 2000), 0, player);
	tempangle = randomfloat(360);
	forward = (cos(tempangle), sin(tempangle), 0);
	forward = vectornormalize(forward - vectorscale(trace[#"normal"], vectordot(forward, trace[#"normal"])));
	dropangles = vectortoangles(forward);
	if(isdefined(trace[#"surfacetype"]) && trace[#"surfacetype"] == "water")
	{
		phystrace = playerphysicstrace(player.origin + vectorscale((0, 0, 1), 20), player.origin - vectorscale((0, 0, 1), 2000));
		if(isdefined(phystrace))
		{
			trace[#"position"] = phystrace;
		}
	}
	level.ddbombmodel[site] = spawn("script_model", trace[#"position"]);
	level.ddbombmodel[site].angles = dropangles;
	level.ddbombmodel[site] setmodel(#"p7_mp_suitcase_bomb");
}

/*
	Name: bombplanted
	Namespace: groundwar_base
	Checksum: 0x47E29E0B
	Offset: 0x25C8
	Size: 0x764
	Parameters: 2
	Flags: None
*/
function bombplanted(destroyedobj, player)
{
	level endon(#"game_ended");
	destroyedobj endon(#"bomb_defused");
	team = player.team;
	game.challenge[team][#"plantedbomb"] = 1;
	globallogic_utils::pausetimer();
	destroyedobj.bombplanted = 1;
	player setweaponoverheating(1, 100, destroyedobj.useweapon);
	player playbombplant();
	destroyedobj.visuals[0] thread globallogic_utils::playtickingsound("mpl_sab_ui_suitcasebomb_timer");
	destroyedobj.tickingobject = destroyedobj.visuals[0];
	label = destroyedobj.label;
	detonatetime = gettime() + (int(level.bombtimer * 1000));
	updatebombtimers(label, detonatetime);
	destroyedobj.detonatetime = detonatetime;
	trace = bullettrace(player.origin + vectorscale((0, 0, 1), 20), player.origin - vectorscale((0, 0, 1), 2000), 0, player);
	self dropbombmodel(player, destroyedobj.label);
	destroyedobj gameobjects::allow_use(#"hash_161f03feaadc9b8f");
	destroyedobj gameobjects::set_visible(#"hash_161f03feaadc9b8f");
	if(overtime::is_overtime_round())
	{
		destroyedobj gameobjects::set_owner_team(util::getotherteam(player.team));
	}
	destroyedobj setupfordefusing();
	player.isbombcarrier = 0;
	game.challenge[team][#"plantedbomb"] = 1;
	destroyedobj waitlongdurationwithbombtimeupdate(label, level.bombtimer);
	destroyedobj bombreset(label, "bomb_exploded");
	if(level.gameended)
	{
		return;
	}
	destroyedobj.bombexploded = 1;
	explosionorigin = destroyedobj.curorigin;
	level.ddbombmodel[destroyedobj.label] delete();
	clips = getentarray("bombzone_clip" + destroyedobj.label, "targetname");
	foreach(clip in clips)
	{
		clip delete();
	}
	if(isdefined(player))
	{
		destroyedobj.visuals[0] radiusdamage(explosionorigin, 512, 200, 20, player, "MOD_EXPLOSIVE", getweapon(#"briefcase_bomb"));
		level thread popups::displayteammessagetoall(#"hash_74fa1e5aa0983f9", player);
	}
	else
	{
		destroyedobj.visuals[0] radiusdamage(explosionorigin, 512, 200, 20, undefined, "MOD_EXPLOSIVE", getweapon(#"briefcase_bomb"));
	}
	rot = randomfloat(360);
	explosioneffect = spawnfx(level._effect[#"bombexplosion"], explosionorigin + vectorscale((0, 0, 1), 50), (0, 0, 1), (cos(rot), sin(rot), 0));
	triggerfx(explosioneffect);
	thread sound::play_in_space("mpl_sd_exp_suitcase_bomb_main", explosionorigin);
	if(isdefined(destroyedobj.exploderindex))
	{
		exploder::exploder(destroyedobj.exploderindex);
	}
	bombzonesleft = 0;
	for(index = 0; index < level.bombzones.size; index++)
	{
		if(!isdefined(level.bombzones[index].bombexploded) || !level.bombzones[index].bombexploded && level.bombzones[index].team == destroyedobj.team)
		{
			bombzonesleft++;
		}
	}
	destroyedobj gameobjects::disable_object();
	if(bombzonesleft == 0)
	{
		globallogic_utils::pausetimer();
		level.haspausedtimer = 1;
		setgameendtime(0);
		wait(3);
		end_round(team, 1);
	}
	else if(bombzonesleft == 1)
	{
		setup_doors(level.var_9fb20124[destroyedobj.team]);
		level.var_9fb20124[destroyedobj.team] gameobjects::show_waypoint();
	}
}

/*
	Name: waitlongdurationwithbombtimeupdate
	Namespace: groundwar_base
	Checksum: 0x5CA6A659
	Offset: 0x2D38
	Size: 0x188
	Parameters: 2
	Flags: None
*/
function waitlongdurationwithbombtimeupdate(whichbomb, duration)
{
	if(duration == 0)
	{
		return;
	}
	/#
		assert(duration > 0);
	#/
	starttime = gettime();
	endtime = gettime() + (int(duration * 1000));
	while(gettime() < endtime)
	{
		hostmigration::waittillhostmigrationstarts((float(endtime - gettime())) / 1000);
		while(isdefined(level.hostmigrationtimer))
		{
			endtime = endtime + 250;
			updatebombtimers(whichbomb, endtime);
			wait(0.25);
		}
	}
	/#
		if(gettime() != endtime)
		{
			println((("" + gettime()) + "") + endtime);
		}
	#/
	while(isdefined(level.hostmigrationtimer))
	{
		endtime = endtime + 250;
		updatebombtimers(whichbomb, endtime);
		wait(0.25);
	}
	return gettime() - starttime;
}

/*
	Name: updatebombtimers
	Namespace: groundwar_base
	Checksum: 0x1444CDFD
	Offset: 0x2EC8
	Size: 0xF4
	Parameters: 2
	Flags: None
*/
function updatebombtimers(whichbomb, detonatetime)
{
	if(whichbomb == "_a" || whichbomb == "_c")
	{
		whichbomb = "_a";
		level.bombaplanted = 1;
		setbombtimer("A", int(detonatetime));
	}
	else
	{
		level.bombbplanted = 1;
		setbombtimer("B", int(detonatetime));
	}
	setmatchflag("bomb_timer" + whichbomb, int(detonatetime));
}

/*
	Name: bombdefused
	Namespace: groundwar_base
	Checksum: 0xD587AC5
	Offset: 0x2FC8
	Size: 0xF4
	Parameters: 1
	Flags: None
*/
function bombdefused(player)
{
	self.tickingobject globallogic_utils::stoptickingsound();
	self gameobjects::allow_use(#"hash_161f03feaadc9b8f");
	self gameobjects::set_visible(#"hash_161f03feaadc9b8f");
	self.bombdefused = 1;
	self notify(#"bomb_defused");
	self.bombplanted = 0;
	self bombreset(self.label, "bomb_defused");
	player setweaponoverheating(1, 100, self.useweapon);
	player playbombdefuse();
}

/*
	Name: updateeventsperminute
	Namespace: groundwar_base
	Checksum: 0x8FAF7478
	Offset: 0x30C8
	Size: 0xFA
	Parameters: 0
	Flags: None
*/
function updateeventsperminute()
{
	if(!isdefined(self.eventsperminute))
	{
		self.numbombevents = 0;
		self.eventsperminute = 0;
	}
	self.numbombevents++;
	minutespassed = float(globallogic_utils::gettimepassed()) / 60000;
	if(isplayer(self) && isdefined(self.timeplayed[#"total"]))
	{
		minutespassed = self.timeplayed[#"total"] / 60;
	}
	self.eventsperminute = self.numbombevents / minutespassed;
	if(self.eventsperminute > self.numbombevents)
	{
		self.eventsperminute = self.numbombevents;
	}
}

/*
	Name: isscoreboosting
	Namespace: groundwar_base
	Checksum: 0xBFD832B
	Offset: 0x31D0
	Size: 0x5E
	Parameters: 2
	Flags: None
*/
function isscoreboosting(player, flag)
{
	if(!level.rankedmatch)
	{
		return false;
	}
	if(player.eventsperminute > level.playereventslpm)
	{
		return true;
	}
	if(flag.eventsperminute > level.bombeventslpm)
	{
		return true;
	}
	return false;
}

/*
	Name: function_c5764b12
	Namespace: groundwar_base
	Checksum: 0xCF20D25A
	Offset: 0x3238
	Size: 0x276
	Parameters: 0
	Flags: None
*/
function function_c5764b12()
{
	if(!isdefined(level.bombzones) || level.bombzones.size <= 0)
	{
		return;
	}
	level.baseorigin = [];
	var_be04e61 = [];
	foreach(bombzone in level.bombzones)
	{
		team = bombzone.team;
		if(!isdefined(level.baseorigin[team]))
		{
			level.baseorigin[team] = (0, 0, 0);
			var_be04e61[team] = 0;
		}
		level.baseorigin[team] = level.baseorigin[team] + bombzone.origin;
		var_be04e61[team] = var_be04e61[team] + 1;
	}
	/#
		assert(level.baseorigin.size == var_be04e61.size);
	#/
	foreach(team, origin in level.baseorigin)
	{
		level.baseorigin[team] = origin / var_be04e61[team];
	}
	var_7ed8b321 = (0, 0, 0);
	foreach(origin in level.baseorigin)
	{
		var_7ed8b321 = var_7ed8b321 + origin;
	}
	var_7ed8b321 = var_7ed8b321 / level.baseorigin.size;
	return var_7ed8b321;
}

/*
	Name: function_4d528908
	Namespace: groundwar_base
	Checksum: 0x91DD387E
	Offset: 0x34B8
	Size: 0xD2
	Parameters: 0
	Flags: None
*/
function function_4d528908()
{
	if(!isdefined(level.baseorigin) || level.baseorigin.size <= 1)
	{
		return;
	}
	keys = getarraykeys(level.baseorigin);
	direction = level.baseorigin[keys[0]] - level.baseorigin[keys[1]];
	angles = vectortoangles(vectornormalize(direction));
	return angles[1] + 0;
}

/*
	Name: function_b4ab93bd
	Namespace: groundwar_base
	Checksum: 0x49E6D677
	Offset: 0x3598
	Size: 0xB2
	Parameters: 1
	Flags: None
*/
function function_b4ab93bd(capturearea)
{
	capturearea.onuse = &function_b8ddeed6;
	capturearea.onbeginuse = &function_cf31144e;
	capturearea.onuseupdate = &function_8643ae79;
	capturearea.onenduse = &function_65acf0d;
	capturearea.onupdateuserate = &function_b7965582;
	capturearea.ondecaycomplete = &function_1428c0d;
	capturearea.ontouchuse = &function_894b7236;
}

/*
	Name: function_b8ddeed6
	Namespace: groundwar_base
	Checksum: 0xBC198379
	Offset: 0x3658
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function function_b8ddeed6(sentient)
{
	namespace_5c32f369::on_use(sentient);
}

/*
	Name: function_cf31144e
	Namespace: groundwar_base
	Checksum: 0x1A33EEBD
	Offset: 0x3688
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function function_cf31144e(sentient)
{
	namespace_5c32f369::on_begin_use(sentient);
}

/*
	Name: function_894b7236
	Namespace: groundwar_base
	Checksum: 0xFBA327F3
	Offset: 0x36B8
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function function_894b7236(sentient)
{
	namespace_5c32f369::on_touch_use(sentient);
}

/*
	Name: function_8643ae79
	Namespace: groundwar_base
	Checksum: 0x9EA929B9
	Offset: 0x36E8
	Size: 0x34
	Parameters: 3
	Flags: None
*/
function function_8643ae79(var_98fb2758, progress, change)
{
	namespace_5c32f369::on_use_update(var_98fb2758, progress, change);
}

/*
	Name: function_65acf0d
	Namespace: groundwar_base
	Checksum: 0xC6C39953
	Offset: 0x3728
	Size: 0xAC
	Parameters: 3
	Flags: None
*/
function function_65acf0d(var_98fb2758, player, success)
{
	if(success)
	{
		if(self.label == "_d")
		{
			function_7d1ea7e8();
		}
		else
		{
			if(self.label == "_e")
			{
				function_bba6497c(player);
			}
			else
			{
			}
		}
	}
	namespace_5c32f369::on_end_use(var_98fb2758, player, success);
}

/*
	Name: function_b7965582
	Namespace: groundwar_base
	Checksum: 0x943EC344
	Offset: 0x37E0
	Size: 0x14
	Parameters: 0
	Flags: None
*/
function function_b7965582()
{
	namespace_5c32f369::function_bcaf6836();
}

/*
	Name: function_1428c0d
	Namespace: groundwar_base
	Checksum: 0x247D14C7
	Offset: 0x3800
	Size: 0x14
	Parameters: 0
	Flags: None
*/
function function_1428c0d()
{
	namespace_5c32f369::on_decay_complete();
}

/*
	Name: function_7d1ea7e8
	Namespace: groundwar_base
	Checksum: 0xD49A2A4
	Offset: 0x3820
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_7d1ea7e8()
{
	level thread item_supply_drop::drop_supply_drop(self.origin, 1, 1, "vehicle_t8_mil_tank_wz_base_mg");
}

/*
	Name: function_bba6497c
	Namespace: groundwar_base
	Checksum: 0x2AD39EC9
	Offset: 0x3860
	Size: 0x4C
	Parameters: 1
	Flags: None
*/
function function_bba6497c(player)
{
	locations = function_f8a7c512(player);
	player thread planemortar::doplanemortar(locations, player.team);
}

/*
	Name: function_f8a7c512
	Namespace: groundwar_base
	Checksum: 0x11878C53
	Offset: 0x38B8
	Size: 0x146
	Parameters: 1
	Flags: None
*/
function function_f8a7c512(player)
{
	locations = [];
	foreach(base in level.bombzones)
	{
		if(base.team != player.team)
		{
			locationinfo = spawnstruct();
			locationinfo.origin = base.origin + (-320, -600, 0);
			locationinfo.yaw = 0;
			locations[locations.size] = locationinfo;
			locationinfo = spawnstruct();
			locationinfo.origin = base.origin + (320, -600, 0);
			locationinfo.yaw = 0;
			locations[locations.size] = locationinfo;
		}
	}
	return locations;
}

