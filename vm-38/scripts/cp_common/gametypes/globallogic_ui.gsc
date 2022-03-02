#using script_13114d8a31c6152a;
#using script_1478fbd17fe393cf;
#using script_256b8879317373de;
#using script_25db7030b1397730;
#using script_32399001bdb550da;
#using script_35ae72be7b4fec10;
#using script_4194df57536e11ed;
#using script_47fb62300ac0bd60;
#using script_4ccd0c3512b52a10;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\hud_message_shared.gsc;
#using scripts\core_common\hud_util_shared.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\spectating.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\cp_common\gametypes\globallogic.gsc;
#using scripts\cp_common\gametypes\globallogic_player.gsc;
#using scripts\cp_common\gametypes\loadout.gsc;
#using scripts\cp_common\util.gsc;

#namespace globallogic_ui;

/*
	Name: function_c5ab174a
	Namespace: globallogic_ui
	Checksum: 0xB2758BB8
	Offset: 0x6A0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_c5ab174a()
{
	level notify(1629428178);
}

/*
	Name: init
	Namespace: globallogic_ui
	Checksum: 0x884D90D7
	Offset: 0x6C0
	Size: 0x154
	Parameters: 0
	Flags: Linked
*/
function init()
{
	level.var_36a4cf75 = &function_760546ce;
	level.var_84bcc5b0 = &function_75788ef4;
	level.var_e30ae574 = &function_2793ce76;
	level.var_659c87ff = &function_760546ce;
	transient = savegame::get_mission_data(#"transient");
	transient.var_c42c3d = [];
	level flag::init("all_players_class_choice_completed");
	thread function_1cb458b4();
	callback::add_callback(#"on_player_spawned", &on_player_spawn);
	clientfield::function_a8bbc967("hudItems.playerInCombat", 1, 1, "int");
	clientfield::function_a8bbc967("hudItems.serverDifficulty", 1, 3, "int");
	function_11bcbb57();
}

/*
	Name: function_11bcbb57
	Namespace: globallogic_ui
	Checksum: 0x54D10317
	Offset: 0x820
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function function_11bcbb57()
{
	lui::function_b95a3ba5("cpChyron", &cp_chyron::register);
}

/*
	Name: on_player_spawn
	Namespace: globallogic_ui
	Checksum: 0x124C8EEE
	Offset: 0x858
	Size: 0xE4
	Parameters: 0
	Flags: Linked
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
	Checksum: 0x6F4073B4
	Offset: 0x948
	Size: 0x84
	Parameters: 0
	Flags: Linked, Private
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
	Checksum: 0x11D07BC9
	Offset: 0x9D8
	Size: 0x1EC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_1cb458b4()
{
	function_3e57e536();
	thread function_109202c3(1);
	while(true)
	{
		level waittill(#"save_restore");
		setdvar(#"hash_54488b7c651bd0ec", 0);
		level flag::set(#"hash_321357f5b78401ef");
		level.var_6ca9b5fe = gettime();
		function_3e57e536(1);
		function_3f278444();
		player = getplayers()[0];
		foreach(alias, luimenu in level.luimenus)
		{
			if(alias != "InitialBlack")
			{
				var_5f6d4251 = luimenu.var_779239b4 && !player flag::get(luimenu.var_6fba7045);
				if([[ luimenu ]]->function_7bfd10e6(player))
				{
					[[ luimenu ]]->function_a68f6e20(player);
				}
				if(var_5f6d4251)
				{
					player thread function_5e65cc6f(luimenu);
				}
			}
		}
	}
}

/*
	Name: function_5e65cc6f
	Namespace: globallogic_ui
	Checksum: 0x377A7C71
	Offset: 0xBD0
	Size: 0x74
	Parameters: 1
	Flags: Linked
*/
function function_5e65cc6f(luimenu)
{
	util::wait_network_frame(2);
	if(!is_true(luimenu.var_779239b4) && !self flag::get(luimenu.var_6fba7045))
	{
		[[ luimenu ]]->function_8b8089ba(self);
	}
}

/*
	Name: function_760546ce
	Namespace: globallogic_ui
	Checksum: 0xEF3E98B
	Offset: 0xC50
	Size: 0x1C4
	Parameters: 0
	Flags: Linked
*/
function function_760546ce()
{
	level flag::set("restoring_ui_models");
	level flag::set("level_restarting");
	level.var_815395f5 = 1;
	player = getplayers()[0];
	if(isdefined(player))
	{
		player flag::set("level_restarting");
	}
	namespace_61e6d095::remove_all();
	namespace_96850e69::remove_all();
	waitframe(1);
	function_3e57e536(1);
	savegame::get_mission_data(#"transient").var_c42c3d = [];
	if(isdefined(player.var_c341be0e))
	{
		player setluimenudata(player.var_c341be0e, #"hash_6437862a5ea9ee0d", #"");
		player setluimenudata(player.var_c341be0e, #"hash_76be1320dd574b24", #"");
		player closemenu("CPMissionFailed");
	}
	level flag::clear("restoring_ui_models");
}

/*
	Name: function_3e57e536
	Namespace: globallogic_ui
	Checksum: 0x25FC9611
	Offset: 0xE20
	Size: 0x4BC
	Parameters: 1
	Flags: Linked, Private
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
		setuimodelvalue(getuimodel(function_90d058e8(#"hash_3b49d2db23128dc5"), "active"), 0);
		setuimodelvalue(getuimodel(function_90d058e8(#"hash_3b49d2db23128dc5"), "stream"), 0);
		setuimodelvalue(getuimodel(function_90d058e8(#"hash_3d93adfe2bc1e980"), "active"), 0);
		setuimodelvalue(getuimodel(function_90d058e8(#"lockpick"), "active"), 0);
		setuimodelvalue(getuimodel(function_90d058e8(#"lockpick"), "stream"), 0);
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
	Checksum: 0xEF92C95E
	Offset: 0x12E8
	Size: 0x19A
	Parameters: 5
	Flags: Linked, Private
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
	Checksum: 0xC07C0811
	Offset: 0x1490
	Size: 0x12C
	Parameters: 0
	Flags: Linked
*/
function function_3f278444()
{
	level flag::set("restoring_ui_models");
	transient = savegame::get_mission_data(#"transient");
	if(!isdefined(transient.var_c42c3d))
	{
		transient.var_c42c3d = [];
	}
	foreach(var_24112f50 in transient.var_c42c3d)
	{
		function_9ed5232e(var_24112f50.name, var_24112f50.value, var_24112f50.global, 1, undefined, undefined, var_24112f50.var_2226bd51);
	}
	level flag::clear("restoring_ui_models");
}

/*
	Name: function_2ec075a9
	Namespace: globallogic_ui
	Checksum: 0xC566DDDE
	Offset: 0x15C8
	Size: 0x1C8
	Parameters: 2
	Flags: Linked
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
		if(function_7a600918(model_name))
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
	Checksum: 0xFFB3AD79
	Offset: 0x1798
	Size: 0x2B8
	Parameters: 8
	Flags: Linked
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
	Checksum: 0x28110552
	Offset: 0x1A58
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function function_e299661a(var_8e4097ab)
{
	/#
		assert(function_7a600918(var_8e4097ab));
	#/
	function_9ed5232e("ScriptedWidgetData.overlay", var_8e4097ab);
	function_2ec075a9("ScriptedWidgetData.overlay");
}

/*
	Name: isanyaiattackingtheplayer
	Namespace: globallogic_ui
	Checksum: 0xA3D082D7
	Offset: 0x1AC8
	Size: 0x1BE
	Parameters: 1
	Flags: Linked
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
	Checksum: 0x769B8788
	Offset: 0x1C90
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
	Checksum: 0xDD39318F
	Offset: 0x1DC8
	Size: 0x20
	Parameters: 1
	Flags: Linked
*/
function isplayerhurt(playerent)
{
	return playerent.health < playerent.maxhealth;
}

/*
	Name: watch_player_in_combat
	Namespace: globallogic_ui
	Checksum: 0x86928FBC
	Offset: 0x1DF0
	Size: 0xD8
	Parameters: 0
	Flags: Linked
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
	Checksum: 0xAAF0D521
	Offset: 0x1ED0
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
	Checksum: 0xA8D04D62
	Offset: 0x1F70
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
	Checksum: 0xED635113
	Offset: 0x21F8
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
	Checksum: 0xC21B917A
	Offset: 0x22B8
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
	Checksum: 0x54781D8E
	Offset: 0x2388
	Size: 0x38C
	Parameters: 1
	Flags: Linked
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
	Checksum: 0x675AD255
	Offset: 0x2720
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
	Checksum: 0xDD6C302B
	Offset: 0x27F8
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
	Checksum: 0xE1DA1BD3
	Offset: 0x28C0
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
	Checksum: 0x2F1F91CD
	Offset: 0x2948
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
	Checksum: 0x5D3DE58C
	Offset: 0x2A20
	Size: 0xDC
	Parameters: 0
	Flags: Linked
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
	Checksum: 0x8E06F4D9
	Offset: 0x2B08
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
	Checksum: 0xDF8F256A
	Offset: 0x2B30
	Size: 0x3B4
	Parameters: 0
	Flags: Linked
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
	Checksum: 0xE5F20DFE
	Offset: 0x2EF0
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function is_class_selection_disabled()
{
	return is_true(level.disableclassselection) || is_true(self.disableclassselection);
}

/*
	Name: spawn_player
	Namespace: globallogic_ui
	Checksum: 0x66A894FD
	Offset: 0x2F30
	Size: 0xFC
	Parameters: 1
	Flags: Linked
*/
function spawn_player(prevclass)
{
	self endon(#"disconnect");
	selectedclass = self stats::get_stat(#"hash_2a738807be622e31");
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
	Checksum: 0x1938BCD1
	Offset: 0x3038
	Size: 0x16C
	Parameters: 0
	Flags: Linked
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
	Checksum: 0xB9D29EDF
	Offset: 0x31B0
	Size: 0x7C
	Parameters: 2
	Flags: Linked
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
	Checksum: 0xED3D5A64
	Offset: 0x3238
	Size: 0x5AC
	Parameters: 0
	Flags: Linked
*/
function function_ac6e682a()
{
	self endon(#"disconnect");
	initial_black = lui::function_e810a527("InitialBlack");
	initial_black.var_6fba7045 = #"kill_initial_black";
	self val::set(#"initial_black", "disable_oob", 1);
	function_cdbb5c49(1, 1);
	while(self isloadingcinematicplaying())
	{
		waitframe(1);
	}
	self val::set(#"initial_black", "show_hud", 0);
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
	Checksum: 0xDF9B1D37
	Offset: 0x37F0
	Size: 0xB4
	Parameters: 0
	Flags: Linked
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
	Checksum: 0x8146A239
	Offset: 0x38B0
	Size: 0x9C
	Parameters: 0
	Flags: Linked
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
	Checksum: 0xC23EAE94
	Offset: 0x3958
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
	Checksum: 0xD17C9362
	Offset: 0x39B8
	Size: 0x244
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
	Checksum: 0x166BF1F3
	Offset: 0x3C08
	Size: 0x14
	Parameters: 2
	Flags: Linked
*/
function menupositiondraft(response, intpayload)
{
}

/*
	Name: menuspectator
	Namespace: globallogic_ui
	Checksum: 0x80F724D1
	Offset: 0x3C28
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function menuspectator()
{
}

/*
	Name: menuclass
	Namespace: globallogic_ui
	Checksum: 0xDF71665F
	Offset: 0x3C38
	Size: 0x14
	Parameters: 2
	Flags: Linked
*/
function menuclass(response, intpayload)
{
}

/*
	Name: removespawnmessageshortly
	Namespace: globallogic_ui
	Checksum: 0x36DEF397
	Offset: 0x3C58
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
	Name: weakpoint_anim_watch
	Namespace: globallogic_ui
	Checksum: 0xCDEBCEBA
	Offset: 0x3CB8
	Size: 0x148
	Parameters: 1
	Flags: Linked
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
	Checksum: 0x8C1EC61E
	Offset: 0x3E08
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
	Checksum: 0x1982DBFD
	Offset: 0x3E68
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
	Checksum: 0x3835C5DD
	Offset: 0x3F68
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
	Checksum: 0xC2447694
	Offset: 0x3FB8
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
	Checksum: 0x420C5432
	Offset: 0x4008
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
	Checksum: 0x59150815
	Offset: 0x4038
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
	Checksum: 0x5605341E
	Offset: 0x4060
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function show_instruction_text_ui(str_instruction)
{
	clientfield::set_player_uimodel("hudItems.cpInstructionText", getlocalizedstringindex(str_instruction));
}

/*
	Name: hide_instruction_text_ui
	Namespace: globallogic_ui
	Checksum: 0xA5A767CF
	Offset: 0x40A8
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function hide_instruction_text_ui()
{
	clientfield::set_player_uimodel("hudItems.cpInstructionText", getlocalizedstringindex(#""));
}

/*
	Name: do_chyron_text
	Namespace: globallogic_ui
	Checksum: 0x8FC7FCBB
	Offset: 0x40F0
	Size: 0x144
	Parameters: 2
	Flags: Linked
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
	Checksum: 0x95E2DDDC
	Offset: 0x4240
	Size: 0x334
	Parameters: 2
	Flags: Linked, Private
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
	self notify("641c2040237d352a");
	self endon("641c2040237d352a");
	self flag::set(#"chyron_menu_open");
	level flag::wait_till(#"hash_60361de05624e591");
	/#
		assert(var_d76d90ac >= 0);
	#/
	/#
		assert(var_d76d90ac <= 15);
	#/
	cp_chyron = lui::function_e810a527("cpChyron");
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
	Checksum: 0xA1818C5E
	Offset: 0x4580
	Size: 0x228
	Parameters: 1
	Flags: Linked
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
				namespace_fe8e9929::function_4c2d4fc4(description.description);
			}
			else
			{
				namespace_fe8e9929::function_4c2d4fc4(description.var_35251d9e);
			}
			wait(3);
			namespace_fe8e9929::function_9f427d88();
		}
	}
}

/*
	Name: function_2793ce76
	Namespace: globallogic_ui
	Checksum: 0xB35D3A3D
	Offset: 0x47B0
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function function_2793ce76(var_22323d67)
{
	namespace_c8e236da::function_c27f93d5();
}

/*
	Name: function_909d9a15
	Namespace: globallogic_ui
	Checksum: 0x382CA70C
	Offset: 0x47D8
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function function_909d9a15(player)
{
	level flag::wait_till(#"hash_321357f5b78401ef");
}

/*
	Name: function_5b3d23d5
	Namespace: globallogic_ui
	Checksum: 0x184C5B3C
	Offset: 0x4810
	Size: 0xE2
	Parameters: 3
	Flags: Linked
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
	Checksum: 0x723F748E
	Offset: 0x4900
	Size: 0x5E
	Parameters: 3
	Flags: Linked
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
	Checksum: 0xC41C8A5
	Offset: 0x4968
	Size: 0x1C4
	Parameters: 8
	Flags: Linked
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
	Checksum: 0xCEC5F453
	Offset: 0x4B38
	Size: 0x134
	Parameters: 6
	Flags: Linked, Private
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
		function_9a227103(model);
	}
}

/*
	Name: function_d9f3d3b4
	Namespace: globallogic_ui
	Checksum: 0x34FB2D42
	Offset: 0x4C78
	Size: 0x5C
	Parameters: 3
	Flags: Linked
*/
function function_d9f3d3b4(model_name, var_f566006a, var_1f7d0ca0)
{
	model = function_5b3d23d5(model_name, var_f566006a, var_1f7d0ca0);
	if(isdefined(model))
	{
		function_9a227103(model);
	}
}

/*
	Name: function_a8d716c5
	Namespace: globallogic_ui
	Checksum: 0xA4F5AC80
	Offset: 0x4CE0
	Size: 0x9A
	Parameters: 5
	Flags: Linked
*/
function function_a8d716c5(var_d98decb5, index, model_name, var_f566006a, var_1f7d0ca0)
{
	if(function_7a600918(var_d98decb5))
	{
		var_d98decb5 = string(var_d98decb5, 16);
	}
	return function_5b3d23d5((((var_d98decb5 + ".") + index) + ".") + model_name, var_f566006a, var_1f7d0ca0);
}

/*
	Name: function_596db691
	Namespace: globallogic_ui
	Checksum: 0x417F2B6C
	Offset: 0x4D88
	Size: 0x9A
	Parameters: 5
	Flags: Linked
*/
function function_596db691(var_d98decb5, index, model_name, var_f566006a, var_1f7d0ca0)
{
	if(function_7a600918(var_d98decb5))
	{
		var_d98decb5 = string(var_d98decb5, 16);
	}
	return function_f053dcd4((((var_d98decb5 + ".") + index) + ".") + model_name, var_f566006a, var_1f7d0ca0);
}

/*
	Name: function_8954fa13
	Namespace: globallogic_ui
	Checksum: 0x869FB064
	Offset: 0x4E30
	Size: 0x12C
	Parameters: 8
	Flags: Linked
*/
function function_8954fa13(var_d98decb5, index, model_name, var_832d6681, var_f566006a, var_1f7d0ca0, var_7b030046, var_2226bd51)
{
	if(function_7a600918(var_d98decb5))
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
	Checksum: 0xFBB74DB9
	Offset: 0x4F68
	Size: 0x154
	Parameters: 4
	Flags: Linked
*/
function function_6db5e620(var_d98decb5, index, var_f566006a, reset)
{
	if(!isdefined(var_f566006a))
	{
		var_f566006a = 0;
	}
	if(function_7a600918(var_d98decb5))
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
	Checksum: 0xCC8317EF
	Offset: 0x50C8
	Size: 0x64
	Parameters: 2
	Flags: Linked
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
	Checksum: 0xD33B30C1
	Offset: 0x5138
	Size: 0x7E
	Parameters: 1
	Flags: Linked
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
	Name: function_68bb2f48
	Namespace: globallogic_ui
	Checksum: 0xE56B208F
	Offset: 0x51C0
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_68bb2f48()
{
	function_9ed5232e("ForceClearSubtitles", 1, 0, 1);
}

/*
	Name: function_d0a59ab9
	Namespace: globallogic_ui
	Checksum: 0x8297044E
	Offset: 0x51F0
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
	Checksum: 0xCB69DE0B
	Offset: 0x5220
	Size: 0x1C
	Parameters: 0
	Flags: None
*/
function function_16b7aa78()
{
	function_9ed5232e("cp_hud_data.hideNoReticleDot", 0);
}

