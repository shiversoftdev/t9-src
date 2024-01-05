#using script_4194df57536e11ed;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_player.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\zm_common\zm_laststand.gsc;
#using scripts\zm_common\zm_game_module.gsc;
#using scripts\zm_common\zm_blockers.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\zm_common\util.gsc;
#using scripts\zm_common\gametypes\spawning.gsc;
#using scripts\zm_common\gametypes\hud_message.gsc;
#using scripts\zm_common\gametypes\globallogic_utils.gsc;
#using scripts\zm_common\gametypes\globallogic_ui.gsc;
#using scripts\zm_common\gametypes\globallogic_spawn.gsc;
#using scripts\zm_common\gametypes\globallogic_score.gsc;
#using scripts\zm_common\gametypes\globallogic_defaults.gsc;
#using scripts\zm_common\gametypes\globallogic.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\player\player_shared.gsc;
#using scripts\core_common\music_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\hud_shared.gsc;
#using script_32c8b5b0eb2854f3;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace zm_gametype;

/*
	Name: function_600aea4e
	Namespace: zm_gametype
	Checksum: 0xE2FA65D
	Offset: 0x5D0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_600aea4e()
{
	level notify(-1436618192);
}

/*
	Name: __init__system__
	Namespace: zm_gametype
	Checksum: 0xFFDAF234
	Offset: 0x5F0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_gametype", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_gametype
	Checksum: 0xD6F738AC
	Offset: 0x638
	Size: 0x24
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	callback::on_connecting(&menu_onplayerconnect);
}

/*
	Name: main
	Namespace: zm_gametype
	Checksum: 0x8150866E
	Offset: 0x668
	Size: 0x5B4
	Parameters: 0
	Flags: Linked
*/
function main()
{
	globallogic::init();
	globallogic_setupdefault_zombiecallbacks();
	menu_init();
	util::registerroundlimit(1, 1);
	util::registertimelimit(0, 0);
	util::registerscorelimit(0, 0);
	util::registerroundwinlimit(0, 0);
	util::registernumlives(1, 1);
	globallogic::registerfriendlyfiredelay(level.gametype, 15, 0, 1440);
	level.takelivesondeath = 1;
	level.teambased = 1;
	level.disablemomentum = 1;
	level.overrideteamscore = 0;
	level.overrideplayerscore = 0;
	level.displayhalftimetext = 0;
	level.displayroundendtext = 0;
	level.allowannouncer = 0;
	level.endgameonscorelimit = 0;
	level.endgameontimelimit = 0;
	level.resetplayerscoreeveryround = 1;
	level.doprematch = 0;
	level.cumulativeroundscores = 1;
	level.forceautoassign = 1;
	level.dontshowendreason = 1;
	level.forceallallies = 1;
	level.allow_teamchange = 0;
	setdvar(#"scr_disable_team_selection", 1);
	setdvar(#"scr_disable_weapondrop", 1);
	level.onstartgametype = &onstartgametype;
	level.onspawnplayer = &globallogic::blank;
	level.onspawnplayerunified = &onspawnplayerunified;
	level.onroundendgame = &onroundendgame;
	level.playermayspawn = &mayspawn;
	game.zm_roundlimit = 1;
	game.zm_scorelimit = 1;
	game._team1_num = 0;
	game._team2_num = 0;
	map_name = level.script;
	mode = util::get_game_type();
	if(!isdefined(mode) || mode == "" && isdefined(level.default_game_mode))
	{
		mode = level.default_game_mode;
	}
	zm_utility::set_gamemode_var_once("mode", mode);
	if(!isdefined(game.side_selection))
	{
		game.side_selection = 1;
	}
	location = level.default_start_location;
	zm_utility::set_gamemode_var_once("location", location);
	zm_utility::set_gamemode_var_once("randomize_mode", getdvarint(#"zm_rand_mode", 0));
	zm_utility::set_gamemode_var_once("randomize_location", getdvarint(#"zm_rand_loc", 0));
	zm_utility::set_gamemode_var_once("team_1_score", 0);
	zm_utility::set_gamemode_var_once("team_2_score", 0);
	zm_utility::set_gamemode_var_once("current_round", 0);
	zm_utility::set_gamemode_var_once("rules_read", 0);
	if(!isdefined(game.switchedsides))
	{
		game.switchedsides = 0;
	}
	gametype = util::get_game_type();
	game.dialog[#"gametype"] = gametype + "_start";
	game.dialog[#"gametype_hardcore"] = gametype + "_start";
	game.dialog[#"offense_obj"] = "generic_boost";
	game.dialog[#"defense_obj"] = "generic_boost";
	zm_utility::set_gamemode_var("pre_init_zombie_spawn_func", undefined);
	zm_utility::set_gamemode_var("post_init_zombie_spawn_func", undefined);
	zm_utility::set_gamemode_var("match_end_notify", undefined);
	zm_utility::set_gamemode_var("match_end_func", undefined);
	callback::on_connect(&onplayerconnect_check_for_hotjoin);
}

/*
	Name: globallogic_setupdefault_zombiecallbacks
	Namespace: zm_gametype
	Checksum: 0xCA2FC7E9
	Offset: 0xC28
	Size: 0x4BC
	Parameters: 0
	Flags: Linked
*/
function globallogic_setupdefault_zombiecallbacks()
{
	level.spawnplayer = &globallogic_spawn::spawnplayer;
	level.spawnplayerprediction = &globallogic_spawn::spawnplayerprediction;
	level.spawnclient = &globallogic_spawn::spawnclient;
	level.spawnspectator = &globallogic_spawn::spawnspectator;
	level.spawnintermission = &globallogic_spawn::spawnintermission;
	level.scoreongiveplayerscore = &globallogic_score::giveplayerscore;
	level.onplayerscore = &globallogic_score::default_onplayerscore;
	level.onteamscore = &globallogic::blank;
	level.wavespawntimer = &globallogic::wavespawntimer;
	level.onspawnplayer = &globallogic::blank;
	level.onspawnplayerunified = &globallogic::blank;
	level.onspawnspectator = &onspawnspectator;
	level.onspawnintermission = &onspawnintermission;
	level.onrespawndelay = &globallogic::blank;
	level.onforfeit = &globallogic::blank;
	level.ontimelimit = &globallogic::blank;
	level.onscorelimit = &globallogic::blank;
	level.ondeadevent = &ondeadevent;
	level.ononeleftevent = &globallogic::blank;
	level.giveteamscore = &globallogic::blank;
	level.gettimepassed = &globallogic_utils::gettimepassed;
	level.gettimeremaining = &globallogic_utils::gettimeremaining;
	level.gettimelimit = &globallogic_defaults::default_gettimelimit;
	level.getteamkillpenalty = &globallogic::blank;
	level.getteamkillscore = &globallogic::blank;
	level.iskillboosting = &globallogic::blank;
	level._setteamscore = &globallogic_score::_setteamscore;
	level._setplayerscore = &globallogic::blank;
	level._getteamscore = &globallogic::blank;
	level._getplayerscore = &globallogic::blank;
	level.onprecachegametype = &globallogic::blank;
	level.onstartgametype = &globallogic::blank;
	level.onplayerconnect = &globallogic::blank;
	level.onplayerdisconnect = &onplayerdisconnect;
	level.onplayerdamage = &globallogic::blank;
	level.onplayerkilled = &globallogic::blank;
	level.onplayerkilledextraunthreadedcbs = [];
	level.onteamoutcomenotify = &globallogic::blank;
	level.onoutcomenotify = &globallogic::blank;
	level.onendgame = &onendgame;
	level.onroundendgame = &globallogic::blank;
	level.onmedalawarded = &globallogic::blank;
	level.dogmanagerongetdogs = &globallogic::blank;
	level.autoassign = &globallogic_ui::menuautoassign;
	level.spectator = &globallogic_ui::menuspectator;
	level.allies = &menuallieszombies;
	level.teammenu = &globallogic_ui::menuteam;
	level.autocontrolplayer = &globallogic_ui::menuautocontrolplayer;
	level.callbackactorkilled = &globallogic::blank;
	level.callbackvehicledamage = &globallogic::blank;
	level.callbackvehiclekilled = &globallogic::blank;
}

/*
	Name: do_game_mode_shellshock
	Namespace: zm_gametype
	Checksum: 0x336F4550
	Offset: 0x10F0
	Size: 0x5E
	Parameters: 0
	Flags: None
*/
function do_game_mode_shellshock()
{
	self endon(#"disconnect");
	self._being_shellshocked = 1;
	self shellshock(#"grief_stab_zm", 0.75);
	wait(0.75);
	self._being_shellshocked = 0;
}

/*
	Name: canplayersuicide
	Namespace: zm_gametype
	Checksum: 0x42354C50
	Offset: 0x1158
	Size: 0x6
	Parameters: 0
	Flags: Linked
*/
function canplayersuicide()
{
	return false;
}

/*
	Name: onplayerdisconnect
	Namespace: zm_gametype
	Checksum: 0x31D1E938
	Offset: 0x1168
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function onplayerdisconnect()
{
	if(gamestate::is_shutting_down())
	{
		return;
	}
	if(isdefined(level.game_mode_custom_onplayerdisconnect))
	{
		level [[level.game_mode_custom_onplayerdisconnect]](self);
	}
	level zm_player::function_8ef51109(self);
}

/*
	Name: ondeadevent
	Namespace: zm_gametype
	Checksum: 0x8A3B5F98
	Offset: 0x11D0
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function ondeadevent(team)
{
	thread globallogic::endgame(level.zombie_team, "");
}

/*
	Name: onspawnintermission
	Namespace: zm_gametype
	Checksum: 0xCF5E90E6
	Offset: 0x1208
	Size: 0xD4
	Parameters: 0
	Flags: Linked
*/
function onspawnintermission()
{
	spawnpointname = "info_intermission";
	spawnpoints = getentarray(spawnpointname, "classname");
	if(spawnpoints.size < 1)
	{
		/#
			println(("" + spawnpointname) + "");
		#/
		return;
	}
	spawnpoint = spawnpoints[randomint(spawnpoints.size)];
	if(isdefined(spawnpoint))
	{
		self spawn(spawnpoint.origin, spawnpoint.angles);
	}
}

/*
	Name: onspawnspectator
	Namespace: zm_gametype
	Checksum: 0x6A571069
	Offset: 0x12E8
	Size: 0x14
	Parameters: 2
	Flags: Linked
*/
function onspawnspectator(origin, angles)
{
}

/*
	Name: mayspawn
	Namespace: zm_gametype
	Checksum: 0x726C0A9F
	Offset: 0x1308
	Size: 0x76
	Parameters: 0
	Flags: Linked
*/
function mayspawn()
{
	if(isdefined(level.custommayspawnlogic))
	{
		return self [[level.custommayspawnlogic]]();
	}
	if(self.pers[#"lives"] === 0)
	{
		level notify(#"player_eliminated");
		self notify(#"player_eliminated");
		return 0;
	}
	return 1;
}

/*
	Name: onstartgametype
	Namespace: zm_gametype
	Checksum: 0xE5BEE6D1
	Offset: 0x1388
	Size: 0x17C
	Parameters: 0
	Flags: Linked
*/
function onstartgametype()
{
	setclientnamemode("auto_change");
	level.spawnmins = (0, 0, 0);
	level.spawnmaxs = (0, 0, 0);
	structs = struct::get_array("player_respawn_point", "targetname");
	foreach(struct in structs)
	{
		level.spawnmins = math::expand_mins(level.spawnmins, struct.origin);
		level.spawnmaxs = math::expand_maxs(level.spawnmaxs, struct.origin);
	}
	level.mapcenter = math::find_box_center(level.spawnmins, level.spawnmaxs);
	setmapcenter(level.mapcenter);
	spawning::create_map_placed_influencers();
}

/*
	Name: onspawnplayerunified
	Namespace: zm_gametype
	Checksum: 0x88CA9C43
	Offset: 0x1510
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function onspawnplayerunified()
{
	onspawnplayer(0);
}

/*
	Name: onfindvalidspawnpoint
	Namespace: zm_gametype
	Checksum: 0xA1A97BA2
	Offset: 0x1538
	Size: 0x2F2
	Parameters: 0
	Flags: Linked
*/
function onfindvalidspawnpoint()
{
	/#
		println("");
	#/
	if(level flag::get("begin_spawning"))
	{
		spawnpoint = zm_player::check_for_valid_spawn_near_team(self, 1);
		/#
			if(!isdefined(spawnpoint))
			{
				println("");
			}
		#/
	}
	if(!isdefined(spawnpoint))
	{
		match_string = "";
		location = level.scr_zm_map_start_location;
		if(location == "default" || location == "" && isdefined(level.default_start_location))
		{
			location = level.default_start_location;
		}
		match_string = (level.scr_zm_ui_gametype + "_") + location;
		spawnpoints = [];
		structs = struct::get_array("initial_spawn", "script_noteworthy");
		if(isdefined(structs))
		{
			foreach(struct in structs)
			{
				if(isdefined(struct.script_string))
				{
					tokens = strtok(struct.script_string, " ");
					foreach(token in tokens)
					{
						if(token == match_string)
						{
							spawnpoints[spawnpoints.size] = struct;
						}
					}
				}
			}
		}
		if(!isdefined(spawnpoints) || spawnpoints.size == 0)
		{
			spawnpoints = struct::get_array("initial_spawn_points", "targetname");
		}
		/#
			assert(isdefined(spawnpoints), "");
		#/
		spawnpoint = zm_player::getfreespawnpoint(spawnpoints, self);
	}
	return spawnpoint;
}

/*
	Name: onspawnplayer
	Namespace: zm_gametype
	Checksum: 0x8D68DF72
	Offset: 0x1838
	Size: 0x3BC
	Parameters: 1
	Flags: Linked
*/
function onspawnplayer(predictedspawn)
{
	if(!isdefined(predictedspawn))
	{
		predictedspawn = 0;
	}
	self.usingobj = undefined;
	self.is_zombie = 0;
	zm_player::updateplayernum(self);
	if(isdefined(level.custom_spawnplayer) && is_true(self.player_initialized))
	{
		self [[level.custom_spawnplayer]]();
		return;
	}
	if(isdefined(level.customspawnlogic))
	{
		/#
			println("");
		#/
		spawnpoint = self [[level.customspawnlogic]](predictedspawn);
		if(predictedspawn)
		{
			return;
		}
	}
	else
	{
		/#
			println("");
		#/
		spawnpoint = self onfindvalidspawnpoint();
		if(predictedspawn)
		{
			self predictspawnpoint(spawnpoint.origin, spawnpoint.angles);
			return;
		}
		self spawn(spawnpoint.origin, spawnpoint.angles, "zsurvival");
	}
	self.entity_num = self getentitynumber();
	self thread zm_player::onplayerspawned();
	self thread zm_player::player_revive_monitor();
	self val::set(#"onspawnplayer", "freezecontrols");
	self val::set(#"onspawnplayer", "disablegadgets");
	self.spectator_respawn = spawnpoint;
	self.score = self globallogic_score::getpersstat(#"score");
	self.pers[#"participation"] = 0;
	/#
		if(getdvarint(#"zombie_cheat", 0) >= 1)
		{
			self.score = 100000;
		}
	#/
	self.score_total = self.score;
	self.old_score = self.score;
	self.player_initialized = 0;
	self.zombification_time = 0;
	self thread zm_blockers::rebuild_barrier_reward_reset();
	if(!is_true(level.host_ended_game))
	{
		self val::reset(#"onspawnplayer", "freezecontrols");
		self val::reset(#"onspawnplayer", "disablegadgets");
		self enableweapons();
	}
	if(isdefined(level.game_mode_spawn_player_logic))
	{
		spawn_in_spectate = [[level.game_mode_spawn_player_logic]]();
		if(spawn_in_spectate)
		{
			self util::delay(0.05, undefined, &zm_player::spawnspectator);
		}
	}
}

/*
	Name: get_player_spawns_for_gametype
	Namespace: zm_gametype
	Checksum: 0x57346054
	Offset: 0x1C00
	Size: 0x202
	Parameters: 0
	Flags: Linked
*/
function get_player_spawns_for_gametype()
{
	a_s_player_spawns = [];
	a_structs = struct::get_array("player_respawn_point", "targetname");
	foreach(struct in a_structs)
	{
		if(isdefined(struct.script_string))
		{
			var_61fc7c84 = strtok(struct.script_string, " ");
			foreach(var_5d975b01 in var_61fc7c84)
			{
				if(var_5d975b01 == level.scr_zm_ui_gametype)
				{
					if(!isdefined(a_s_player_spawns))
					{
						a_s_player_spawns = [];
					}
					else if(!isarray(a_s_player_spawns))
					{
						a_s_player_spawns = array(a_s_player_spawns);
					}
					a_s_player_spawns[a_s_player_spawns.size] = struct;
				}
			}
			continue;
		}
		if(!isdefined(a_s_player_spawns))
		{
			a_s_player_spawns = [];
		}
		else if(!isarray(a_s_player_spawns))
		{
			a_s_player_spawns = array(a_s_player_spawns);
		}
		a_s_player_spawns[a_s_player_spawns.size] = struct;
	}
	return a_s_player_spawns;
}

/*
	Name: onendgame
	Namespace: zm_gametype
	Checksum: 0x8C720548
	Offset: 0x1E10
	Size: 0xC
	Parameters: 1
	Flags: Linked
*/
function onendgame(winningteam)
{
}

/*
	Name: onroundendgame
	Namespace: zm_gametype
	Checksum: 0x8803C1E8
	Offset: 0x1E28
	Size: 0x102
	Parameters: 1
	Flags: Linked
*/
function onroundendgame(roundwinner)
{
	if(game.stat[#"roundswon"][#"allies"] == game.stat[#"roundswon"][#"axis"])
	{
		winner = "tie";
	}
	else
	{
		if(game.stat[#"roundswon"][#"axis"] > game.stat[#"roundswon"][#"allies"])
		{
			winner = #"axis";
		}
		else
		{
			winner = #"allies";
		}
	}
	return winner;
}

/*
	Name: menu_init
	Namespace: zm_gametype
	Checksum: 0x1FDA7ACD
	Offset: 0x1F38
	Size: 0x1EC
	Parameters: 0
	Flags: Linked
*/
function menu_init()
{
	game.menu = [];
	game.menu[#"menu_team"] = "ChangeTeam";
	game.menu[#"menu_changeclass_allies"] = "ChooseClass_InGame";
	game.menu[#"menu_initteam_allies"] = "initteam_marines";
	game.menu[#"menu_changeclass_axis"] = "ChooseClass_InGame";
	game.menu[#"menu_initteam_axis"] = "initteam_opfor";
	game.menu[#"menu_class"] = "class";
	game.menu[#"menu_start_menu"] = "StartMenu_Main";
	game.menu[#"menu_changeclass"] = "PositionDraft";
	game.menu[#"menu_changeclass_offline"] = "PositionDraft";
	game.menu[#"menu_changeclass_custom"] = "PositionDraft";
	game.menu[#"menu_draft"] = "PositionDraft";
	game.menu[#"menu_controls"] = "ingame_controls";
	game.menu[#"menu_options"] = "ingame_options";
	game.menu[#"menu_leavegame"] = "popup_leavegame";
	game.menu[#"menu_restartgamepopup"] = "T7Hud_zm_factory";
}

/*
	Name: menu_onplayerconnect
	Namespace: zm_gametype
	Checksum: 0xA1580D74
	Offset: 0x2130
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function menu_onplayerconnect()
{
	self thread menu_onmenuresponse();
}

/*
	Name: zm_map_restart
	Namespace: zm_gametype
	Checksum: 0x725E2A03
	Offset: 0x2158
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function zm_map_restart()
{
	self endon(#"disconnect");
	while(!function_65f7de49())
	{
		waitframe(1);
	}
	map_restart(1);
}

/*
	Name: menu_onmenuresponse
	Namespace: zm_gametype
	Checksum: 0x471636E4
	Offset: 0x21B0
	Size: 0x8EC
	Parameters: 0
	Flags: Linked
*/
function menu_onmenuresponse()
{
	self endon(#"disconnect");
	for(;;)
	{
		waitresult = undefined;
		waitresult = self waittill(#"menuresponse");
		menu = waitresult.menu;
		response = waitresult.response;
		var_244a2498 = waitresult.intpayload;
		if(response == "back")
		{
			self closeingamemenu();
			if(level.console)
			{
				if(menu == game.menu[#"menu_changeclass"] || menu == game.menu_changeclass_offline || menu == game.menu[#"menu_team"] || menu == game.menu[#"menu_controls"])
				{
					if(self.pers[#"team"] == #"allies")
					{
						self openmenu(game.menu[#"menu_start_menu"]);
					}
					if(self.pers[#"team"] == #"axis")
					{
						self openmenu(game.menu[#"menu_start_menu"]);
					}
				}
			}
			continue;
		}
		if(response == "changeteam" && level.allow_teamchange)
		{
			self closeingamemenu();
			self openmenu(game.menu[#"menu_team"]);
		}
		if(response == "changeclass_marines")
		{
			self closeingamemenu();
			self openmenu(game.menu[#"menu_changeclass_allies"]);
			continue;
		}
		if(response == "changeclass_opfor")
		{
			self closeingamemenu();
			self openmenu(game.menu[#"menu_changeclass_axis"]);
			continue;
		}
		if(response == "changeclass_custom")
		{
			self closeingamemenu();
			self openmenu(game.menu[#"menu_changeclass_custom"]);
			continue;
		}
		if(response == "changeclass_marines_splitscreen")
		{
			self openmenu("changeclass_marines_splitscreen");
		}
		if(response == "changeclass_opfor_splitscreen")
		{
			self openmenu("changeclass_opfor_splitscreen");
		}
		if(response == "endgame")
		{
			if(self issplitscreen())
			{
				level.skipvote = 1;
				if(!is_true(level.gameended))
				{
					self zm_laststand::add_weighted_down();
					self zm_stats::increment_client_stat("deaths");
					self zm_stats::increment_player_stat("deaths");
					level.host_ended_game = 1;
					foreach(player in getplayers())
					{
						player val::set(#"game_end", "freezecontrols");
						player val::set(#"game_end", "disablegadgets");
					}
					level notify(#"end_game");
				}
			}
			continue;
		}
		if(response == "killserverpc")
		{
			level thread globallogic::killserverpc();
			continue;
		}
		if(response == "endround")
		{
			if(!is_true(level.gameended))
			{
				self globallogic::gamehistoryplayerquit();
				self zm_laststand::add_weighted_down();
				self closeingamemenu();
				level.host_ended_game = 1;
				foreach(player in getplayers())
				{
					player val::set(#"game_end", "freezecontrols");
					player val::set(#"game_end", "disablegadgets");
				}
				level notify(#"end_game");
			}
			else
			{
				self closeingamemenu();
				self iprintln(#"hash_6e4cedc56165f367");
			}
			continue;
		}
		if(response == "autocontrol")
		{
			self [[level.autocontrolplayer]]();
			continue;
		}
		if(response == "hide_class_select_slideout")
		{
			self notify(#"hide_class_select_slideout");
		}
		else if(response == "show_class_select_slideout")
		{
			self notify(#"show_class_select_slideout");
		}
		if(menu == game.menu[#"menu_team"] && level.allow_teamchange)
		{
			switch(response)
			{
				case "allies":
				{
					self [[level.allies]]();
					break;
				}
				case "axis":
				{
					self [[level.teammenu]](response);
					break;
				}
				case "autoassign":
				{
					self [[level.autoassign]](1);
					break;
				}
				case "spectator":
				{
					self [[level.spectator]]();
					break;
				}
			}
			continue;
		}
		if(menu == game.menu[#"menu_changeclass"] || menu == game.menu[#"menu_changeclass_offline"] || menu == game.menu[#"menu_changeclass_custom"])
		{
			self closeingamemenu();
			self.selectedclass = 1;
			self [[level.curclass]](response);
		}
	}
}

/*
	Name: menuallieszombies
	Namespace: zm_gametype
	Checksum: 0x1477CA67
	Offset: 0x2AA8
	Size: 0x1EE
	Parameters: 0
	Flags: Linked
*/
function menuallieszombies()
{
	if(!level.console && !level.allow_teamchange && (isdefined(self.hasdonecombat) && self.hasdonecombat))
	{
		return;
	}
	if(self.pers[#"team"] != #"allies")
	{
		if(level.ingraceperiod && (!isdefined(self.hasdonecombat) || !self.hasdonecombat))
		{
			self.hasspawned = 0;
		}
		if(self.sessionstate == "playing")
		{
			self.switching_teams = 1;
			self.joining_team = #"allies";
			self.leaving_team = self.pers[#"team"];
			self suicide();
		}
		self.pers[#"team"] = #"allies";
		self.team = #"allies";
		self.pers[#"class"] = undefined;
		self.curclass = undefined;
		self.pers[#"weapon"] = undefined;
		self.pers[#"savedmodel"] = undefined;
		self.sessionteam = #"allies";
		self player::function_466d8a4b(0);
		self notify(#"end_respawn");
	}
}

/*
	Name: custom_spawn_init_func
	Namespace: zm_gametype
	Checksum: 0x79ADDF65
	Offset: 0x2CA0
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function custom_spawn_init_func()
{
	array::thread_all(level.zombie_spawners, &spawner::add_spawn_function, level._zombies_round_spawn_failsafe);
}

/*
	Name: init
	Namespace: zm_gametype
	Checksum: 0xCDC07908
	Offset: 0x2CE0
	Size: 0x5C
	Parameters: 0
	Flags: None
*/
function init()
{
	level flag::init("pregame");
	level flag::set("pregame");
	level thread onplayerconnect();
}

/*
	Name: onplayerconnect
	Namespace: zm_gametype
	Checksum: 0xE9826210
	Offset: 0x2D48
	Size: 0x78
	Parameters: 0
	Flags: Linked
*/
function onplayerconnect()
{
	for(;;)
	{
		waitresult = undefined;
		waitresult = level waittill(#"connected");
		waitresult.player thread onplayerspawned();
		if(isdefined(level.game_module_onplayerconnect))
		{
			waitresult.player [[level.game_module_onplayerconnect]]();
		}
	}
}

/*
	Name: onplayerspawned
	Namespace: zm_gametype
	Checksum: 0xBC06A320
	Offset: 0x2DC8
	Size: 0x234
	Parameters: 0
	Flags: Linked
*/
function onplayerspawned()
{
	level endon(#"end_game");
	self endon(#"disconnect");
	for(;;)
	{
		self waittill(#"spawned_player", #"fake_spawned_player");
		if(is_true(level.match_is_ending))
		{
			return;
		}
		if(self laststand::player_is_in_laststand())
		{
			self thread zm_laststand::auto_revive(self);
		}
		if(isdefined(level.custom_player_fake_death_cleanup))
		{
			self [[level.custom_player_fake_death_cleanup]]();
		}
		self setstance("stand");
		self.zmbdialogqueue = [];
		self.zmbdialogactive = 0;
		self.zmbdialoggroups = [];
		self.zmbdialoggroup = "";
		self takeallweapons();
		self giveweapon(level.weaponbasemelee);
		if(isdefined(level.onplayerspawned_restore_previous_weapons) && is_true(level.isresetting_grief))
		{
			weapons_restored = self [[level.onplayerspawned_restore_previous_weapons]]();
		}
		if(!is_true(weapons_restored))
		{
			self zm_loadout::give_start_weapon(1);
		}
		weapons_restored = 0;
		if(isdefined(level._team_loadout))
		{
			self giveweapon(level._team_loadout);
			self switchtoweapon(level._team_loadout);
		}
		if(isdefined(level.gamemode_post_spawn_logic))
		{
			self [[level.gamemode_post_spawn_logic]]();
		}
	}
}

/*
	Name: onplayerconnect_check_for_hotjoin
	Namespace: zm_gametype
	Checksum: 0x5CD70696
	Offset: 0x3008
	Size: 0xFC
	Parameters: 0
	Flags: Linked
*/
function onplayerconnect_check_for_hotjoin()
{
	/#
		if(getdvarint(#"zm_instajoin", 0) > 0)
		{
			return;
		}
	#/
	gametype = hash(util::get_game_type());
	if(gametype == #"zsurvival")
	{
		if(isdefined(level.var_7d45d0d4.var_3385b421))
		{
			self thread player_hotjoin();
		}
		return;
	}
	if(level flag::get("start_zombie_round_logic") && !is_true(level.var_e52901a5))
	{
		self thread player_hotjoin();
	}
}

/*
	Name: player_hotjoin
	Namespace: zm_gametype
	Checksum: 0xC85C1DA
	Offset: 0x3110
	Size: 0x2EC
	Parameters: 0
	Flags: Linked
*/
function player_hotjoin()
{
	self endon(#"disconnect");
	self.rebuild_barrier_reward = 1;
	self.is_hotjoining = 1;
	val::set(#"initial_black", "hide");
	val::set(#"initial_black", "takedamage", 0);
	val::set(#"initial_black", "ignoreme");
	val::set(#"initial_black", "freezecontrols");
	wait(0.5);
	self zm_player::spawnspectator();
	music::setmusicstate("none");
	self.is_hotjoining = 0;
	self.is_hotjoin = 1;
	if(is_true(level.intermission) || is_true(level.host_ended_game))
	{
		self setclientthirdperson(0);
		self resetfov();
		self.health = 100;
		self thread [[level.custom_intermission]]();
	}
	self util::streamer_wait(undefined, 0, 30);
	if(isdefined(level.hotjoin_extra_blackscreen_time))
	{
		wait(level.hotjoin_extra_blackscreen_time);
	}
	initialblackend();
	val::reset(#"initial_black", "hide");
	val::reset(#"initial_black", "takedamage");
	val::reset(#"initial_black", "freezecontrols");
	val::reset(#"initial_black", "ignoreme");
	if(zm_utility::is_survival())
	{
		var_2629b314 = globallogic_spawn::timeuntilspawn();
		wait(var_2629b314);
		self zm_player::spectator_respawn_player();
	}
}

/*
	Name: initialblackend
	Namespace: zm_gametype
	Checksum: 0x999D7C60
	Offset: 0x3408
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function initialblackend()
{
	self clientfield::set_player_uimodel("closeLoadingMovie", 1);
}

/*
	Name: function_788fb510
	Namespace: zm_gametype
	Checksum: 0x90C3DF39
	Offset: 0x3438
	Size: 0x20
	Parameters: 1
	Flags: Private
*/
function private function_788fb510(value)
{
	if(!isdefined(value))
	{
		return "";
	}
	return value;
}

