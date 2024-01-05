#using script_13114d8a31c6152a;
#using scripts\cp_common\util.gsc;
#using script_4ccd0c3512b52a10;
#using script_35ae72be7b4fec10;
#using script_1478fbd17fe393cf;
#using script_32399001bdb550da;
#using scripts\cp_common\gametypes\loadout.gsc;
#using scripts\cp_common\gametypes\globallogic_player.gsc;
#using scripts\cp_common\gametypes\globallogic.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\spectating.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\player\player_shared.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\hud_util_shared.gsc;
#using scripts\core_common\hud_message_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using script_4194df57536e11ed;
#using script_25db7030b1397730;

#namespace globallogic_ui;

/*
	Name: init
	Namespace: globallogic_ui
	Checksum: 0xD5CC8FC8
	Offset: 0x668
	Size: 0x124
	Parameters: 0
	Flags: None
*/
function init()
{
	level.var_36a4cf75 = &function_760546ce;
	level.var_84bcc5b0 = &function_75788ef4;
	level.var_e30ae574 = &function_2793ce76;
	level.var_659c87ff = &function_760546ce;
	level flag::init("all_players_class_choice_completed");
	thread function_1cb458b4();
	callback::add_callback(#"on_player_spawned", &on_player_spawn);
	clientfield::register_clientuimodel("hudItems.playerInCombat", 1, 1, "int");
	clientfield::register_clientuimodel("hudItems.serverDifficulty", 1, 3, "int");
	function_11bcbb57();
}

/*
	Name: function_11bcbb57
	Namespace: globallogic_ui
	Checksum: 0xEED626AA
	Offset: 0x798
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function function_11bcbb57()
{
	lui::add_luimenu("cpChyron", &cp_chyron::register);
}

/*
	Name: on_player_spawn
	Namespace: globallogic_ui
	Checksum: 0x5CE703A7
	Offset: 0x7D0
	Size: 0xE4
	Parameters: 0
	Flags: None
*/
function on_player_spawn()
{
	self thread function_36e052();
	self thread watch_player_in_combat();
	if(!is_true(level.do_delayed_class_choice) || isbot(self))
	{
		self update_class_choice_flags();
	}
	/#
		assert(isdefined(level.gameskill));
	#/
	self clientfield::set_player_uimodel("hudItems.serverDifficulty", level.gameskill);
	self setclientuivisibilityflag("radar_client", 1);
}

/*
	Name: function_36e052
	Namespace: globallogic_ui
	Checksum: 0x9DBEFD1F
	Offset: 0x8C0
	Size: 0x84
	Parameters: 0
	Flags: Private
*/
function private function_36e052()
{
	self endon(#"death");
	while(true)
	{
		ent_num = self function_f053dcd4("hudItems.crosshairEntity");
		if(isdefined(ent_num))
		{
			level.var_7315ba31 = getentbynum(ent_num);
		}
		else
		{
			level.var_7315ba31 = undefined;
		}
		waitframe(1);
	}
}

/*
	Name: function_1cb458b4
	Namespace: globallogic_ui
	Checksum: 0xC82EE808
	Offset: 0x950
	Size: 0x1BC
	Parameters: 0
	Flags: Private
*/
function private function_1cb458b4()
{
	function_3e57e536();
	thread function_109202c3(1);
	while(true)
	{
		level waittill(#"save_restore");
		level flag::set(#"hash_321357f5b78401ef");
		level.var_6ca9b5fe = gettime();
		function_3e57e536(1);
		function_3f278444();
		player = getplayers()[0];
		foreach(luimenu in level.luimenus)
		{
			var_5f6d4251 = luimenu.var_779239b4 && !player flag::get(luimenu.var_6fba7045);
			if([[ luimenu ]]->function_7bfd10e6(player))
			{
				[[ luimenu ]]->close_luielem(player);
			}
			if(var_5f6d4251)
			{
				player thread function_5e65cc6f(luimenu);
			}
		}
	}
}

/*
	Name: function_5e65cc6f
	Namespace: globallogic_ui
	Checksum: 0x4EC3C2B7
	Offset: 0xB18
	Size: 0x74
	Parameters: 1
	Flags: None
*/
function function_5e65cc6f(luimenu)
{
	util::wait_network_frame(2);
	if(!is_true(luimenu.var_779239b4) && !self flag::get(luimenu.var_6fba7045))
	{
		[[ luimenu ]]->open_luielem(self);
	}
}

/*
	Name: function_760546ce
	Namespace: globallogic_ui
	Checksum: 0x27FEAE58
	Offset: 0xB98
	Size: 0xD4
	Parameters: 0
	Flags: None
*/
function function_760546ce()
{
	level flag::set("restoring_ui_models");
	level flag::set("level_restarting");
	level.var_815395f5 = 1;
	namespace_61e6d095::remove_all();
	namespace_96850e69::remove_all();
	waitframe(1);
	function_3e57e536(1);
	savegame::get_mission_data(#"transient").var_c42c3d = [];
	level flag::clear("restoring_ui_models");
}

/*
	Name: function_3e57e536
	Namespace: globallogic_ui
	Checksum: 0x8720D97F
	Offset: 0xC78
	Size: 0x41C
	Parameters: 1
	Flags: Private
*/
function private function_3e57e536(set)
{
	if(is_true(set))
	{
		level flag::set("restoring_ui_models");
		function_9ed5232e("hudItems.cpObjectiveUiData.compassMessage", #"", 1, undefined, undefined, undefined, undefined, 1);
		function_9ed5232e("hudItems.cpObjectiveUiData.compassState", 0, 1, undefined, undefined, undefined, undefined, 1);
		function_9ed5232e("hudItems.cpObjectiveUiData.showHideHint", 0, 1, undefined, undefined, undefined, undefined, 1);
		function_9ed5232e("hudItems.cpObjectiveUiData.splash", 0, 1, undefined, undefined, undefined, undefined, 1);
		function_9ed5232e("hudItems.cpObjectiveUiData.updateList", 0, 1, undefined, undefined, undefined, undefined, 1);
		function_9ed5232e("hudItems.subtitles.noAutoHide", 0, undefined, undefined, undefined, undefined, 1);
		function_9ed5232e("hudItems.cpHudFadeControl.doFadeOut", 0, undefined, undefined, undefined, undefined, undefined, 1);
		function_9ed5232e("hudItems.hideWaypoints", 0, undefined, undefined, undefined, undefined, undefined, 1);
		function_9ed5232e("ActorOverheadNames.0.overrideName", "", undefined, undefined, undefined, undefined, undefined, 1);
		function_9ed5232e("ActorOverheadNames.0.overrideTeam", 0, undefined, undefined, undefined, undefined, undefined, 1);
		function_9ed5232e("ActorOverheadNames.0.hidden", 0, undefined, undefined, undefined, undefined, undefined, 1);
		setuimodelvalue(getuimodel(function_90d058e8(#"spy_camera"), "active"), 0);
		setuimodelvalue(getuimodel(function_90d058e8(#"hash_3d93adfe2bc1e980"), "active"), 0);
		setuimodelvalue(getuimodel(function_90d058e8(#"lockpick"), "active"), 0);
		level flag::clear("restoring_ui_models");
	}
	else
	{
		function_52da41bb("hudItems.cpObjectiveUiData.compassMessage", #"", 1);
		function_52da41bb("hudItems.cpObjectiveUiData.compassState", 0, 1);
		function_52da41bb("hudItems.cpObjectiveUiData.showHideHint", 0, 1);
		function_52da41bb("hudItems.cpObjectiveUiData.splash", 0, 1);
		function_52da41bb("hudItems.cpObjectiveUiData.updateList", 0, 1);
		function_52da41bb("hudItems.subtitles.noAutoHide", 0);
		function_52da41bb("hudItems.cpHudFadeControl.doFadeOut", 0);
		function_52da41bb("hudItems.hideWaypoints", 0);
	}
}

/*
	Name: function_52da41bb
	Namespace: globallogic_ui
	Checksum: 0xCF40D545
	Offset: 0x10A0
	Size: 0x19A
	Parameters: 5
	Flags: Private
*/
function private function_52da41bb(model_name, var_832d6681, var_ec71f60a, var_2226bd51, created)
{
	if(level flag::get("restoring_ui_models"))
	{
		return;
	}
	transient = savegame::get_mission_data(#"transient");
	if(!isdefined(transient.var_c42c3d))
	{
		transient.var_c42c3d = [];
	}
	if(!isdefined(transient.var_c42c3d[model_name]))
	{
		transient.var_c42c3d[model_name] = spawnstruct();
	}
	transient.var_c42c3d[model_name].name = model_name;
	transient.var_c42c3d[model_name].value = var_832d6681;
	transient.var_c42c3d[model_name].global = is_true(var_ec71f60a);
	transient.var_c42c3d[model_name].var_2226bd51 = is_true(var_2226bd51);
	transient.var_c42c3d[model_name].created = is_true(transient.var_c42c3d[model_name].created) || is_true(created);
}

/*
	Name: function_3f278444
	Namespace: globallogic_ui
	Checksum: 0xE37A7AD2
	Offset: 0x1248
	Size: 0x12C
	Parameters: 0
	Flags: None
*/
function function_3f278444()
{
	level flag::set("restoring_ui_models");
	transient = savegame::get_mission_data(#"transient");
	if(!isdefined(transient.var_c42c3d))
	{
		transient.var_c42c3d = [];
	}
	foreach(model_data in transient.var_c42c3d)
	{
		function_9ed5232e(model_data.name, model_data.value, model_data.global, 1, undefined, undefined, model_data.var_2226bd51);
	}
	level flag::clear("restoring_ui_models");
}

/*
	Name: function_2ec075a9
	Namespace: globallogic_ui
	Checksum: 0x3266571C
	Offset: 0x1380
	Size: 0x1C8
	Parameters: 2
	Flags: None
*/
function function_2ec075a9(model_name, var_c15ae58d)
{
	level notify("removing_ui_model_data_" + model_name);
	if(level flag::get("restoring_ui_models"))
	{
		return;
	}
	transient = savegame::get_mission_data(#"transient");
	if(!isdefined(transient.var_c42c3d))
	{
		transient.var_c42c3d = [];
	}
	arrayremoveindex(transient.var_c42c3d, model_name, 1);
	if(is_true(var_c15ae58d))
	{
		if(ishash(model_name))
		{
			model_name = string(model_name, 16);
		}
		foreach(val in transient.var_c42c3d)
		{
			if(strstartswith(val.name, model_name))
			{
				level notify("removing_ui_model_data_" + val.name);
				arrayremoveindex(transient.var_c42c3d, val.name, 1);
			}
		}
	}
}

/*
	Name: function_4e49c51d
	Namespace: globallogic_ui
	Checksum: 0x21AEBF03
	Offset: 0x1550
	Size: 0x2B8
	Parameters: 8
	Flags: None
*/
function function_4e49c51d(title, description, var_c7f36d1c, var_92c0faf8, cancel_callback, var_21a58cc0, var_380e2def, var_c9ec8cda)
{
	if(!isdefined(title))
	{
		title = #"";
	}
	if(!isdefined(description))
	{
		description = #"";
	}
	if(!isdefined(var_c7f36d1c))
	{
		var_c7f36d1c = 0;
	}
	if(!isdefined(var_380e2def))
	{
		var_380e2def = #"";
	}
	if(!isdefined(var_c9ec8cda))
	{
		var_c9ec8cda = #"";
	}
	function_9ed5232e("cp_confirm_overlay" + ".title", title);
	function_9ed5232e("cp_confirm_overlay" + ".description", description);
	function_9ed5232e("cp_confirm_overlay" + ".disableCancel", var_c7f36d1c);
	function_9ed5232e("cp_confirm_overlay" + ".confirmText", var_380e2def);
	function_9ed5232e("cp_confirm_overlay" + ".cancelText", var_c9ec8cda);
	function_e299661a(hash("InGameConfirmOverlay"));
	function_2ec075a9("cp_confirm_overlay");
	do
	{
		waitresult = undefined;
		waitresult = self waittill(#"menuresponse");
		menu = waitresult.menu;
		response = waitresult.response;
		intpayload = waitresult.intpayload;
		if(menu == "InGameConfirmOverlay" && response == "confirmresponse" && intpayload == 1)
		{
			if(isdefined(var_92c0faf8))
			{
				self [[var_92c0faf8]](var_21a58cc0);
			}
			return true;
		}
		waitframe(1);
	}
	while(menu != "InGameConfirmOverlay" || response != "confirmresponse");
	if(isdefined(cancel_callback))
	{
		self [[cancel_callback]](var_21a58cc0);
	}
	return false;
}

/*
	Name: function_e299661a
	Namespace: globallogic_ui
	Checksum: 0xE496B6C3
	Offset: 0x1810
	Size: 0x64
	Parameters: 1
	Flags: None
*/
function function_e299661a(var_8e4097ab)
{
	/#
		assert(ishash(var_8e4097ab));
	#/
	function_9ed5232e("ScriptedWidgetData.overlay", var_8e4097ab);
	function_2ec075a9("ScriptedWidgetData.overlay");
}

/*
	Name: isanyaiattackingtheplayer
	Namespace: globallogic_ui
	Checksum: 0x1D0FD584
	Offset: 0x1880
	Size: 0x1BE
	Parameters: 1
	Flags: None
*/
function isanyaiattackingtheplayer(playerent)
{
	ais = getaiteamarray(util::getotherteam(playerent.team));
	ais = arraycombine(ais, getaiteamarray(#"team3"), 0, 0);
	foreach(ai in ais)
	{
		if(issentient(ai))
		{
			if(ai attackedrecently(playerent, 10))
			{
				return true;
			}
			if(ai.enemy === playerent && isdefined(ai.weapon) && ai.weapon.name === "none" && distancesquared(ai.origin, playerent.origin) < sqr(240))
			{
				return true;
			}
		}
	}
	return false;
}

/*
	Name: isanyaiawareofplayer
	Namespace: globallogic_ui
	Checksum: 0x574333EC
	Offset: 0x1A48
	Size: 0x12C
	Parameters: 1
	Flags: None
*/
function isanyaiawareofplayer(playerent)
{
	ais = getaiteamarray(util::getotherteam(playerent.team));
	ais = arraycombine(ais, getaiteamarray(#"team3"), 0, 0);
	foreach(ai in ais)
	{
		if(issentient(ai))
		{
			if((ai lastknowntime(playerent) + 4000) >= gettime())
			{
				return true;
			}
		}
	}
	return false;
}

/*
	Name: isplayerhurt
	Namespace: globallogic_ui
	Checksum: 0xB3DB8C2C
	Offset: 0x1B80
	Size: 0x20
	Parameters: 1
	Flags: None
*/
function isplayerhurt(playerent)
{
	return playerent.health < playerent.maxhealth;
}

/*
	Name: watch_player_in_combat
	Namespace: globallogic_ui
	Checksum: 0x9A62D176
	Offset: 0x1BA8
	Size: 0xD8
	Parameters: 0
	Flags: None
*/
function watch_player_in_combat()
{
	self notify(#"kill_watch_player_in_combat");
	self endon(#"kill_watch_player_in_combat", #"disconnect");
	while(true)
	{
		if(isplayerhurt(self) || isanyaiattackingtheplayer(self))
		{
			self clientfield::set_player_uimodel("hudItems.playerInCombat", 1);
		}
		else
		{
			self clientfield::set_player_uimodel("hudItems.playerInCombat", 0);
		}
		wait(randomfloatrange(0.3333333, 0.6666667));
	}
}

/*
	Name: setupcallbacks
	Namespace: globallogic_ui
	Checksum: 0x35AD402B
	Offset: 0x1C88
	Size: 0x94
	Parameters: 0
	Flags: None
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
	Checksum: 0xC85E30DF
	Offset: 0x1D28
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
	Checksum: 0x3D374C77
	Offset: 0x1FB0
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
	Checksum: 0x199CABC3
	Offset: 0x2070
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
	Checksum: 0x74C86763
	Offset: 0x2140
	Size: 0x38C
	Parameters: 1
	Flags: None
*/
function menuautoassign(comingfrommenu)
{
	self closemenus();
	assignment = #"allies";
	if(isdefined(self.botteam) && self.botteam != "autoassign")
	{
		assignment = self.botteam;
	}
	fields = getmapfields();
	if(isdefined(fields) && isdefined(fields.playerteam))
	{
		assignment = fields.playerteam;
	}
	if(level.teambased)
	{
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
	if(assignment != self.pers[#"team"] && (self.sessionstate == "playing" || self.sessionstate == "dead"))
	{
		self.switching_teams = 1;
		self.switchedteamsresetgadgets = 1;
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
	Checksum: 0x55C46763
	Offset: 0x24D8
	Size: 0xCC
	Parameters: 0
	Flags: None
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
	Checksum: 0x811FA9D8
	Offset: 0x25B0
	Size: 0xBE
	Parameters: 0
	Flags: None
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
	Checksum: 0x7B048508
	Offset: 0x2678
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
	Name: get_splitscreen_team
	Namespace: globallogic_ui
	Checksum: 0xDD1C2FE
	Offset: 0x2700
	Size: 0xCA
	Parameters: 0
	Flags: None
*/
function get_splitscreen_team()
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
	Checksum: 0xD2631F13
	Offset: 0x27D8
	Size: 0xDC
	Parameters: 0
	Flags: None
*/
function updateobjectivetext()
{
	if(sessionmodeiszombiesgame() || self.pers[#"team"] == "spectator")
	{
		self setclientcgobjectivetext("");
		return;
	}
	if(level.scorelimit > 0)
	{
		self setclientcgobjectivetext(util::getobjectivescoretext(self.pers[#"team"]));
	}
	else
	{
		self setclientcgobjectivetext(util::getobjectivetext(self.pers[#"team"]));
	}
}

/*
	Name: closemenus
	Namespace: globallogic_ui
	Checksum: 0x23265BC1
	Offset: 0x28C0
	Size: 0x1C
	Parameters: 0
	Flags: None
*/
function closemenus()
{
	self closeingamemenu();
}

/*
	Name: beginclasschoice
	Namespace: globallogic_ui
	Checksum: 0xA8B4772B
	Offset: 0x28E8
	Size: 0x3B4
	Parameters: 0
	Flags: None
*/
function beginclasschoice()
{
	/#
		assert(isdefined(level.teams[self.pers[#"team"]]));
	#/
	team = self.pers[#"team"];
	self closemenu(game.menu[#"menu_start_menu"]);
	if(isbot(self))
	{
		self closemenu(game.menu[#"menu_changeclass"]);
		self openmenu(game.menu["menu_changeclass_" + level.teams[team]]);
		return;
	}
	if(!getdvarint(#"art_review", 0))
	{
		self thread function_ac6e682a();
	}
	b_disable_cac = getdvarint(#"force_no_cac", 0);
	if(!getdvarint(#"force_cac", 0) || b_disable_cac)
	{
		if(isdefined(world.var_f2c8b0cb))
		{
			if(isdefined(world.var_f2c8b0cb[self.name]))
			{
				self savegame::set_player_data("playerClass", world.var_f2c8b0cb[self.name]);
				self thread spawn_player(world.var_f2c8b0cb[self.name]);
				if(level flag::get(#"all_players_class_choice_completed"))
				{
					world.var_f2c8b0cb = undefined;
				}
				level notify(#"class_choice_completed");
				self update_class_choice_flags();
				return;
			}
		}
		prevclass = self savegame::get_player_data("playerClass", undefined);
		if(isdefined(prevclass) || b_disable_cac || is_class_selection_disabled() || getdvarint(#"migration_soak", 0) == 1 || getdvarint(#"art_review", 0))
		{
			self thread spawn_player(prevclass);
			self update_class_choice_flags();
			return;
		}
	}
	self closemenu(game.menu[#"menu_changeclass"]);
	self openmenu(game.menu["menu_changeclass_" + level.teams[team]]);
}

/*
	Name: is_class_selection_disabled
	Namespace: globallogic_ui
	Checksum: 0xB863BB10
	Offset: 0x2CA8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function is_class_selection_disabled()
{
	return is_true(level.disableclassselection) || is_true(self.disableclassselection);
}

/*
	Name: spawn_player
	Namespace: globallogic_ui
	Checksum: 0x71CD9B6F
	Offset: 0x2CE8
	Size: 0xFC
	Parameters: 1
	Flags: None
*/
function spawn_player(prevclass)
{
	self endon(#"disconnect");
	selectedclass = self stats::get_stat(#"selectedcustomclass");
	if(!isdefined(selectedclass))
	{
		selectedclass = 0;
	}
	self.curclass = "default";
	self.pers[#"class"] = self.curclass;
	waitframe(1);
	if(self.sessionstate != "playing" && game.state == "playing")
	{
		self thread [[level.spawnclient]]();
	}
	globallogic::updateteamstatus();
	self thread spectating::set_permissions_for_machine();
}

/*
	Name: update_class_choice_flags
	Namespace: globallogic_ui
	Checksum: 0x37FE45D7
	Offset: 0x2DF0
	Size: 0x16C
	Parameters: 0
	Flags: None
*/
function update_class_choice_flags()
{
	if(self flag::get(#"class_choice_completed"))
	{
		return;
	}
	self flag::set(#"class_choice_completed");
	if(!isbot(self))
	{
		level flag::set(#"first_player_class_choice_completed");
	}
	b_all_players_chose_class = 1;
	a_players = getplayers();
	foreach(player in a_players)
	{
		if(!player flag::get(#"class_choice_completed"))
		{
			b_all_players_chose_class = 0;
			break;
		}
	}
	if(b_all_players_chose_class)
	{
		level flag::set("all_players_class_choice_completed");
	}
}

/*
	Name: function_cdbb5c49
	Namespace: globallogic_ui
	Checksum: 0x53F31587
	Offset: 0x2F68
	Size: 0x7C
	Parameters: 2
	Flags: None
*/
function function_cdbb5c49(show, persistent)
{
	player = getplayers()[0];
	if(is_true(show))
	{
		util::function_1690fd42(player, persistent);
	}
	else
	{
		util::function_cd98604b(player);
	}
}

/*
	Name: function_ac6e682a
	Namespace: globallogic_ui
	Checksum: 0xA8A81930
	Offset: 0x2FF0
	Size: 0x5AC
	Parameters: 0
	Flags: None
*/
function function_ac6e682a()
{
	self endon(#"disconnect");
	initial_black = lui::get_luimenu("InitialBlack");
	initial_black.var_6fba7045 = #"kill_initial_black";
	self val::set(#"initial_black", "disable_oob", 1);
	while(self isloadingcinematicplaying())
	{
		waitframe(1);
	}
	self val::set(#"initial_black", "show_hud", 0);
	function_cdbb5c49(1, 1);
	if(!self.hasspawned)
	{
		self waittill(#"spawned");
	}
	self val::set(#"initial_black", "freezecontrols");
	self val::set(#"initial_black", "disable_weapons");
	self val::set(#"initial_black", "takedamage", 0);
	self val::set(#"initial_black", "allowdeath", 0);
	self val::set(#"initial_black", "hide");
	b_hot_joining = level flag::get(#"loaded");
	level flag::wait_till(#"loaded");
	waitframe(1);
	if(isdefined(level.str_level_start_flag) || isdefined(level.str_player_start_flag))
	{
		init_start_flags();
		if(isdefined(level.str_level_start_flag))
		{
			level flag::wait_till(level.str_level_start_flag);
		}
		if(isdefined(level.str_player_start_flag))
		{
			self flag::wait_till(level.str_player_start_flag);
		}
	}
	self flag::wait_till("loadout_given");
	do
	{
		waitframe(1);
	}
	while(self flag::get(#"chyron_menu_open") || level flag::get(#"waitting_for_igc_ready"));
	waitframe(1);
	level flag::wait_till_clear("streamer_waits");
	self flag::set(#"kill_initial_black");
	self lui::screen_fade_out(0, "black");
	util::wait_network_frame(2);
	function_cdbb5c49(0);
	self val::reset(#"initial_black", "show_hud");
	self val::reset(#"initial_black", "freezecontrols");
	self val::reset(#"initial_black", "disable_weapons");
	self val::reset(#"initial_black", "hide");
	level clientfield::set("gameplay_started", 1);
	level flag::set(#"gameplay_started");
	if(!isdefined(level.var_cb4dca51))
	{
		level.var_cb4dca51 = 0.05;
	}
	if(!isdefined(level.var_c0c469ea))
	{
		level.var_c0c469ea = 0.3;
	}
	self util::delay(level.var_cb4dca51, "disconnect", &lui::screen_fade_in, level.var_c0c469ea, (0, 0, 0));
	/#
		streamerskiptodebug(getskiptos());
	#/
	self val::reset(#"initial_black", "takedamage");
	self val::reset(#"initial_black", "allowdeath");
	self val::reset(#"initial_black", "disable_oob");
}

/*
	Name: init_start_flags
	Namespace: globallogic_ui
	Checksum: 0xEE203DC1
	Offset: 0x35A8
	Size: 0xB4
	Parameters: 0
	Flags: None
*/
function init_start_flags()
{
	if(isdefined(level.str_player_start_flag) && !self flag::exists(level.str_player_start_flag))
	{
		self flag::init(level.str_player_start_flag);
	}
	if(isdefined(level.str_level_start_flag) && !level flag::exists(level.str_level_start_flag))
	{
		level flag::init(level.str_level_start_flag);
	}
}

/*
	Name: showmainmenuforteam
	Namespace: globallogic_ui
	Checksum: 0xC883F6EC
	Offset: 0x3668
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
	Checksum: 0x8656B725
	Offset: 0x3710
	Size: 0x54
	Parameters: 0
	Flags: None
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
	Checksum: 0xA8386D26
	Offset: 0x3770
	Size: 0x244
	Parameters: 1
	Flags: None
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
			self.switchedteamsresetgadgets = 1;
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
		if(!level.rankedmatch && !level.leaguematch)
		{
			self.sessionstate = "spectator";
		}
		self.sessionteam = team;
		self player::function_466d8a4b(1);
		self notify(#"end_respawn");
	}
	self beginclasschoice();
}

/*
	Name: menupositiondraft
	Namespace: globallogic_ui
	Checksum: 0xD433E7E
	Offset: 0x39C0
	Size: 0x14
	Parameters: 2
	Flags: None
*/
function menupositiondraft(response, intpayload)
{
}

/*
	Name: menuspectator
	Namespace: globallogic_ui
	Checksum: 0x80F724D1
	Offset: 0x39E0
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function menuspectator()
{
}

/*
	Name: menuclass
	Namespace: globallogic_ui
	Checksum: 0x194CDCFF
	Offset: 0x39F0
	Size: 0x14
	Parameters: 2
	Flags: None
*/
function menuclass(response, intpayload)
{
}

/*
	Name: removespawnmessageshortly
	Namespace: globallogic_ui
	Checksum: 0x19CC3670
	Offset: 0x3A10
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
	Name: weakpoint_anim_watch
	Namespace: globallogic_ui
	Checksum: 0x4B695A69
	Offset: 0x3A70
	Size: 0x148
	Parameters: 1
	Flags: None
*/
function weakpoint_anim_watch(precachedbonename)
{
	self endon(#"death", #"weakpoint_destroyed");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"weakpoint_update");
		bonename = waitresult.bone_name;
		event = waitresult.event;
		if(bonename == precachedbonename)
		{
			if(event == "damage")
			{
				luinotifyevent(#"weakpoint_update", 3, 2, self getentitynumber(), precachedbonename);
			}
			else if(event == "repulse")
			{
				luinotifyevent(#"weakpoint_update", 3, 3, self getentitynumber(), precachedbonename);
			}
			wait(0.5);
		}
	}
}

/*
	Name: destroyweakpointwidget
	Namespace: globallogic_ui
	Checksum: 0xA5D8C3B4
	Offset: 0x3BC0
	Size: 0x56
	Parameters: 1
	Flags: None
*/
function destroyweakpointwidget(precachedbonename)
{
	luinotifyevent(#"weakpoint_update", 3, 0, self getentitynumber(), precachedbonename);
	self notify(#"weakpoint_destroyed");
}

/*
	Name: createweakpointwidget
	Namespace: globallogic_ui
	Checksum: 0xDEB88A74
	Offset: 0x3C20
	Size: 0xF4
	Parameters: 3
	Flags: None
*/
function createweakpointwidget(precachedbonename, closestatemaxdistance, mediumstatemaxdistance)
{
	if(!isdefined(closestatemaxdistance))
	{
		closestatemaxdistance = undefined;
	}
	if(!isdefined(mediumstatemaxdistance))
	{
		mediumstatemaxdistance = undefined;
	}
	if(!isdefined(closestatemaxdistance))
	{
		closestatemaxdistance = getdvarint(#"ui_weakpointindicatornear", 1050);
	}
	if(!isdefined(mediumstatemaxdistance))
	{
		mediumstatemaxdistance = getdvarint(#"ui_weakpointindicatormedium", 1900);
	}
	luinotifyevent(#"weakpoint_update", 5, 1, self getentitynumber(), precachedbonename, closestatemaxdistance, mediumstatemaxdistance);
	self thread weakpoint_anim_watch(precachedbonename);
}

/*
	Name: triggerweakpointdamage
	Namespace: globallogic_ui
	Checksum: 0xA637845B
	Offset: 0x3D20
	Size: 0x46
	Parameters: 1
	Flags: None
*/
function triggerweakpointdamage(precachedbonename)
{
	self notify(#"weakpoint_update", {#event:"damage", #bone_name:precachedbonename});
}

/*
	Name: triggerweakpointrepulsed
	Namespace: globallogic_ui
	Checksum: 0xA2B5E872
	Offset: 0x3D70
	Size: 0x46
	Parameters: 1
	Flags: None
*/
function triggerweakpointrepulsed(precachedbonename)
{
	self notify(#"weakpoint_update", {#event:"repulse", #bone_name:precachedbonename});
}

/*
	Name: show_objective_text_ui
	Namespace: globallogic_ui
	Checksum: 0xFCF789D7
	Offset: 0x3DC0
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function show_objective_text_ui()
{
	clientfield::set_player_uimodel("hudItems.showCPNotificationText", 1);
}

/*
	Name: hide_objective_text_ui
	Namespace: globallogic_ui
	Checksum: 0xD076773E
	Offset: 0x3DF0
	Size: 0x1C
	Parameters: 0
	Flags: None
*/
function hide_objective_text_ui()
{
	clientfield::set_player_uimodel("hudItems.showCPNotificationText", 0);
}

/*
	Name: show_instruction_text_ui
	Namespace: globallogic_ui
	Checksum: 0xE282E406
	Offset: 0x3E18
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function show_instruction_text_ui(str_instruction)
{
	clientfield::set_player_uimodel("hudItems.cpInstructionText", getlocalizedstringindex(str_instruction));
}

/*
	Name: hide_instruction_text_ui
	Namespace: globallogic_ui
	Checksum: 0xC1C0573D
	Offset: 0x3E60
	Size: 0x3C
	Parameters: 0
	Flags: None
*/
function hide_instruction_text_ui()
{
	clientfield::set_player_uimodel("hudItems.cpInstructionText", getlocalizedstringindex(#""));
}

/*
	Name: do_chyron_text
	Namespace: globallogic_ui
	Checksum: 0xB87CDA95
	Offset: 0x3EA8
	Size: 0x144
	Parameters: 2
	Flags: None
*/
function do_chyron_text(var_4146002e, var_d76d90ac)
{
	if(!isdefined(var_4146002e))
	{
		var_4146002e = 1;
	}
	if(!isdefined(var_d76d90ac))
	{
		var_d76d90ac = 0;
	}
	level.chyron_text_active = 1;
	level flag::set(#"chyron_active");
	foreach(player in getplayers())
	{
		if(!isbot(player))
		{
			player thread player_do_chyron_text(var_4146002e, var_d76d90ac);
		}
	}
	level waittill(#"chyron_menu_closed");
	level.chyron_text_active = undefined;
	level flag::clear(#"chyron_active");
}

/*
	Name: player_do_chyron_text
	Namespace: globallogic_ui
	Checksum: 0xD4D4EAFD
	Offset: 0x3FF8
	Size: 0x334
	Parameters: 2
	Flags: Private
*/
function private player_do_chyron_text(var_4146002e, var_d76d90ac)
{
	if(!isdefined(var_4146002e))
	{
		var_4146002e = 1;
	}
	if(!isdefined(var_d76d90ac))
	{
		var_d76d90ac = 0;
	}
	self endon(#"disconnect");
	self notify("4b3a4ddb2ac4d6ba");
	self endon("4b3a4ddb2ac4d6ba");
	self flag::set(#"chyron_menu_open");
	level flag::wait_till(#"hash_60361de05624e591");
	/#
		assert(var_d76d90ac >= 0);
	#/
	/#
		assert(var_d76d90ac <= 15);
	#/
	cp_chyron = lui::get_luimenu("cpChyron");
	cp_chyron cp_chyron::set_index(self, var_d76d90ac);
	cp_chyron cp_chyron::close(self);
	cp_chyron cp_chyron::open(self);
	if(var_4146002e)
	{
		self val::set(#"chyron", "takedamage", 0);
		self val::set(#"chyron", "freezecontrols", 1);
		self val::set(#"chyron", "disable_weapons", 1);
		self val::set(#"chyron", "ignoreme", 1);
	}
	waittillframeend();
	level notify(#"chyron_menu_open");
	self waittilltimeout(15, {#response:#"closed", #menu:#"cp_chyron"}, #"menuresponse");
	cp_chyron.var_779239b4 = 0;
	self notify(#"chyron_menu_closed");
	level notify(#"chyron_menu_closed");
	self flag::clear(#"chyron_menu_open");
	waitframe(1);
	level flag::wait_till_clear("waitting_for_igc_ready");
	self val::reset_all(#"chyron");
	wait(10);
	cp_chyron cp_chyron::close(self);
}

/*
	Name: function_75788ef4
	Namespace: globallogic_ui
	Checksum: 0x2FBF6246
	Offset: 0x4338
	Size: 0x228
	Parameters: 1
	Flags: None
*/
function function_75788ef4(var_22323d67)
{
	var_b263f6a2 = getscriptbundle(var_22323d67.m_s_bundle.var_b263f6a2);
	settings = getscriptbundle(var_b263f6a2.var_b263f6a2[var_22323d67.var_6dfc35a].minigame);
	descriptions = settings.descriptions;
	prompts = settings.prompts;
	if(isdefined(prompts))
	{
		foreach(prompt in prompts)
		{
			namespace_c8e236da::function_ebf737f8(prompt.prompt);
		}
	}
	if(isdefined(descriptions))
	{
		player = getplayers()[0];
		foreach(description in descriptions)
		{
			if(player gamepadusedlast())
			{
				hint_tutorial::function_4c2d4fc4(description.description);
			}
			else
			{
				hint_tutorial::function_4c2d4fc4(description.var_35251d9e);
			}
			wait(3);
			hint_tutorial::function_9f427d88();
		}
	}
}

/*
	Name: function_2793ce76
	Namespace: globallogic_ui
	Checksum: 0xF7E8D189
	Offset: 0x4568
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function function_2793ce76(var_22323d67)
{
	namespace_c8e236da::function_c27f93d5();
}

/*
	Name: function_909d9a15
	Namespace: globallogic_ui
	Checksum: 0x564F6BF8
	Offset: 0x4590
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function function_909d9a15(player)
{
	level flag::wait_till(#"hash_321357f5b78401ef");
}

/*
	Name: function_5b3d23d5
	Namespace: globallogic_ui
	Checksum: 0xF958F3A0
	Offset: 0x45C8
	Size: 0xE2
	Parameters: 3
	Flags: None
*/
function function_5b3d23d5(model_name, var_f566006a, var_1f7d0ca0)
{
	function_909d9a15();
	parent_model = undefined;
	if(is_true(var_f566006a))
	{
		parent_model = getglobaluimodel();
	}
	else
	{
		parent_model = function_5c2e399f();
	}
	if(is_true(var_1f7d0ca0))
	{
		model_name = (string(#"hash_34625569b2422261", 16) + ".") + model_name;
	}
	return getuimodel(parent_model, model_name);
}

/*
	Name: function_f053dcd4
	Namespace: globallogic_ui
	Checksum: 0xB8A91FA
	Offset: 0x46B8
	Size: 0x5E
	Parameters: 3
	Flags: None
*/
function function_f053dcd4(model_name, var_f566006a, var_1f7d0ca0)
{
	model = function_5b3d23d5(model_name, var_f566006a, var_1f7d0ca0);
	if(isdefined(model))
	{
		return getuimodelvalue(model);
	}
	return undefined;
}

/*
	Name: function_9ed5232e
	Namespace: globallogic_ui
	Checksum: 0x9341C257
	Offset: 0x4720
	Size: 0x1C4
	Parameters: 8
	Flags: None
*/
function function_9ed5232e(model_name, var_832d6681, var_f566006a, var_80d5359e, var_1f7d0ca0, var_7b030046, var_2226bd51, var_cb887047)
{
	if(!level flag::get("level_restarting") || is_true(var_cb887047))
	{
		model = function_5b3d23d5(model_name, var_f566006a, var_1f7d0ca0);
		created = 0;
		if(!isdefined(model))
		{
			if(is_true(var_1f7d0ca0))
			{
				model_name = (string(#"hash_34625569b2422261", 16) + ".") + model_name;
			}
			if(is_true(var_f566006a))
			{
				model = createuimodel(getglobaluimodel(), model_name);
			}
			else
			{
				model = createuimodel(function_5c2e399f(), model_name);
			}
			created = 1;
		}
		thread function_5b537ee3(model, model_name, var_832d6681, var_80d5359e, var_7b030046, var_2226bd51);
		function_52da41bb(model_name, var_832d6681, var_f566006a, var_2226bd51, created);
	}
}

/*
	Name: function_5b537ee3
	Namespace: globallogic_ui
	Checksum: 0x66110A18
	Offset: 0x48F0
	Size: 0x134
	Parameters: 6
	Flags: Private
*/
function private function_5b537ee3(model, model_name, var_832d6681, var_80d5359e, var_7b030046, var_2226bd51)
{
	if(is_true(var_2226bd51))
	{
		level notify("set_ui_model_" + model_name);
		level endon("set_ui_model_" + model_name, "removing_ui_model_data_" + model_name, #"level_restarting");
		waittillframeend();
	}
	notified = 0;
	if(isdefined(var_832d6681))
	{
		if(is_true(var_7b030046))
		{
			notified = function_8543bf5e(model, var_832d6681);
		}
		else
		{
			notified = setuimodelvalue(model, var_832d6681);
		}
	}
	if(!notified && is_true(var_80d5359e))
	{
		forcenotifyuimodel(model);
	}
}

/*
	Name: function_d9f3d3b4
	Namespace: globallogic_ui
	Checksum: 0xF1F1EE5B
	Offset: 0x4A30
	Size: 0x5C
	Parameters: 3
	Flags: None
*/
function function_d9f3d3b4(model_name, var_f566006a, var_1f7d0ca0)
{
	model = function_5b3d23d5(model_name, var_f566006a, var_1f7d0ca0);
	if(isdefined(model))
	{
		forcenotifyuimodel(model);
	}
}

/*
	Name: function_a8d716c5
	Namespace: globallogic_ui
	Checksum: 0x4842337D
	Offset: 0x4A98
	Size: 0x9A
	Parameters: 5
	Flags: None
*/
function function_a8d716c5(var_d98decb5, index, model_name, var_f566006a, var_1f7d0ca0)
{
	if(ishash(var_d98decb5))
	{
		var_d98decb5 = string(var_d98decb5, 16);
	}
	return function_5b3d23d5((((var_d98decb5 + ".") + index) + ".") + model_name, var_f566006a, var_1f7d0ca0);
}

/*
	Name: function_596db691
	Namespace: globallogic_ui
	Checksum: 0xFF2D2D01
	Offset: 0x4B40
	Size: 0x9A
	Parameters: 5
	Flags: None
*/
function function_596db691(var_d98decb5, index, model_name, var_f566006a, var_1f7d0ca0)
{
	if(ishash(var_d98decb5))
	{
		var_d98decb5 = string(var_d98decb5, 16);
	}
	return function_f053dcd4((((var_d98decb5 + ".") + index) + ".") + model_name, var_f566006a, var_1f7d0ca0);
}

/*
	Name: function_8954fa13
	Namespace: globallogic_ui
	Checksum: 0x35F88482
	Offset: 0x4BE8
	Size: 0x12C
	Parameters: 8
	Flags: None
*/
function function_8954fa13(var_d98decb5, index, model_name, var_832d6681, var_f566006a, var_1f7d0ca0, var_7b030046, var_2226bd51)
{
	if(ishash(var_d98decb5))
	{
		var_d98decb5 = string(var_d98decb5, 16);
	}
	if(!isdefined(function_5b3d23d5((var_d98decb5 + ".") + index, var_f566006a, var_1f7d0ca0)))
	{
		function_9ed5232e((((var_d98decb5 + ".") + index) + ".") + "listIndex", index, var_f566006a, 0, var_1f7d0ca0, var_7b030046, var_2226bd51);
	}
	function_9ed5232e((((var_d98decb5 + ".") + index) + ".") + model_name, var_832d6681, var_f566006a, 0, var_1f7d0ca0, var_7b030046);
}

/*
	Name: function_6db5e620
	Namespace: globallogic_ui
	Checksum: 0x950D4855
	Offset: 0x4D20
	Size: 0x154
	Parameters: 4
	Flags: None
*/
function function_6db5e620(var_d98decb5, index, var_f566006a, reset)
{
	if(!isdefined(var_f566006a))
	{
		var_f566006a = 0;
	}
	if(ishash(var_d98decb5))
	{
		var_d98decb5 = string(var_d98decb5, 16);
	}
	model = function_5b3d23d5((var_d98decb5 + ".") + index, var_f566006a);
	if(isdefined(model))
	{
		if(!is_true(function_f053dcd4(((var_d98decb5 + ".") + index) + ".remove", var_f566006a)))
		{
			function_9ed5232e(((var_d98decb5 + ".") + index) + ".remove", 1, undefined, undefined, undefined, undefined, undefined, reset);
		}
		function_2ec075a9((var_d98decb5 + ".") + index, 1);
		return true;
	}
	return false;
}

/*
	Name: function_ec25f500
	Namespace: globallogic_ui
	Checksum: 0x5A05F6AC
	Offset: 0x4E80
	Size: 0x64
	Parameters: 2
	Flags: None
*/
function function_ec25f500(name, team)
{
	if(!isdefined(team))
	{
		team = 0;
	}
	level.var_da53c8c9 = self;
	function_9ed5232e("ActorOverheadNames.0.overrideName", name);
	function_9ed5232e("ActorOverheadNames.0.overrideTeam", team);
}

/*
	Name: function_109202c3
	Namespace: globallogic_ui
	Checksum: 0xC1B060B4
	Offset: 0x4EF0
	Size: 0x7E
	Parameters: 1
	Flags: None
*/
function function_109202c3(force)
{
	if(level.var_da53c8c9 === self || is_true(force))
	{
		function_9ed5232e("ActorOverheadNames.0.overrideName", "");
		function_9ed5232e("ActorOverheadNames.0.overrideTeam", 0);
		level.var_da53c8c9 = undefined;
	}
}

/*
	Name: function_d0a59ab9
	Namespace: globallogic_ui
	Checksum: 0xB6FB6C38
	Offset: 0x4F78
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_d0a59ab9()
{
	function_9ed5232e("cp_hud_data.hideNoReticleDot", 1);
}

/*
	Name: function_16b7aa78
	Namespace: globallogic_ui
	Checksum: 0x43614360
	Offset: 0x4FA8
	Size: 0x1C
	Parameters: 0
	Flags: None
*/
function function_16b7aa78()
{
	function_9ed5232e("cp_hud_data.hideNoReticleDot", 0);
}

