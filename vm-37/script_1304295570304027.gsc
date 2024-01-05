#using scripts\mp_common\util.gsc;
#using scripts\mp_common\gametypes\round.gsc;
#using scripts\mp_common\gametypes\globallogic_utils.gsc;
#using scripts\mp_common\gametypes\globallogic_score.gsc;
#using script_1cc417743d7c262d;
#using scripts\mp_common\gametypes\globallogic.gsc;
#using scripts\mp_common\gametypes\gametype.gsc;
#using scripts\mp_common\bb.gsc;
#using scripts\core_common\util_shared.gsc;
#using script_7a8059ca02b7b09e;
#using scripts\core_common\trigger_shared.gsc;
#using script_3d703ef87a841fe4;
#using script_75da5547b1822294;
#using script_d9b5c8b1ad38ef5;
#using script_306215d6cfd5f1f4;
#using script_7d712f77ab8d0c16;
#using script_44b0b8420eabacad;
#using scripts\core_common\spawning_shared.gsc;
#using script_335d0650ed05d36d;
#using script_3e196d275a6fb180;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\popups_shared.gsc;
#using scripts\core_common\potm_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\influencers_shared.gsc;
#using scripts\core_common\hostmigration_shared.gsc;
#using script_1435f3c9fc699e04;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\demo_shared.gsc;
#using scripts\core_common\contracts_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\battlechatter.gsc;

#namespace namespace_5c32f369;

/*
	Name: codecallback_menuresponse
	Namespace: namespace_5c32f369
	Checksum: 0x33F556BF
	Offset: 0x7D0
	Size: 0xAC
	Parameters: 1
	Flags: Event
*/
event codecallback_menuresponse(eventstruct)
{
	var_53227942 = self;
	menu = eventstruct.menu;
	response = eventstruct.response;
	if(!isdefined(menu))
	{
		menu = "";
	}
	if(!isdefined(response))
	{
		response = "";
	}
	if(menu == "Hud_NavigableUI")
	{
		if(response == "spectateObjective")
		{
			var_53227942 function_5ca9806b(eventstruct.intpayload);
		}
	}
}

/*
	Name: init
	Namespace: namespace_5c32f369
	Checksum: 0xAEC164D5
	Offset: 0x888
	Size: 0x114
	Parameters: 0
	Flags: None
*/
function init()
{
	level.onstartgametype = &onstartgametype;
	level.var_f5a73a96 = 1;
	level.var_ce802423 = 1;
	level.onroundswitch = &on_round_switch;
	level.var_5c32f369 = spawnstruct();
	function_daaeaa95();
	level.var_10c0e6bb = &function_b4b9ba12;
	spawning::addsupportedspawnpointtype("dom");
	/#
		spawning::function_a860c440(&function_8d90ce2e);
	#/
	callback::on_game_playing(&on_game_playing);
	callback::on_spawned(&on_player_spawned);
}

/*
	Name: function_8d90ce2e
	Namespace: namespace_5c32f369
	Checksum: 0x2A15F4C6
	Offset: 0x9A8
	Size: 0x15C
	Parameters: 0
	Flags: None
*/
function function_8d90ce2e()
{
	/#
		spawning::function_25e7711a("", #"none", "", "");
		spawning::function_25e7711a("", #"none", "", "");
		spawning::function_25e7711a("", #"none", "", "");
		spawning::function_25e7711a("", #"none", "", "");
		spawning::function_25e7711a("", #"none", "", "");
		spawning::function_25e7711a("", #"none", "", "");
	#/
}

/*
	Name: function_fdbc620d
	Namespace: namespace_5c32f369
	Checksum: 0x591E6509
	Offset: 0xB10
	Size: 0xB8
	Parameters: 0
	Flags: None
*/
function function_fdbc620d()
{
	var_bd4d0f54 = getentarray("flag_primary", "targetname");
	foreach(zone in var_bd4d0f54)
	{
		zone setmodel("tag_origin");
	}
}

/*
	Name: function_4480f87e
	Namespace: namespace_5c32f369
	Checksum: 0x6CC9DBAC
	Offset: 0xBD0
	Size: 0xB2
	Parameters: 1
	Flags: None
*/
function function_4480f87e(capturearea)
{
	capturearea.onuse = &on_use;
	capturearea.onbeginuse = &on_begin_use;
	capturearea.onuseupdate = &on_use_update;
	capturearea.onenduse = &on_end_use;
	capturearea.onupdateuserate = &function_bcaf6836;
	capturearea.ondecaycomplete = &on_decay_complete;
	capturearea.ontouchuse = &on_touch_use;
}

/*
	Name: function_dbba0e25
	Namespace: namespace_5c32f369
	Checksum: 0xEFB5F587
	Offset: 0xC90
	Size: 0x38
	Parameters: 0
	Flags: None
*/
function function_dbba0e25()
{
	var_bd4d0f54 = getentarray("flag_primary", "targetname");
	return var_bd4d0f54.size > 0;
}

/*
	Name: setup_capture_zones
	Namespace: namespace_5c32f369
	Checksum: 0xC79554BC
	Offset: 0xCD0
	Size: 0x61A
	Parameters: 1
	Flags: None
*/
function setup_capture_zones(var_6c9e0594)
{
	flag_capture_rate_increase = (isdefined(getgametypesetting(#"flagcapturerateincrease")) ? getgametypesetting(#"flagcapturerateincrease") : 0);
	decay_progress = (isdefined(getgametypesetting(#"decayprogress")) ? getgametypesetting(#"decayprogress") : 0);
	var_3bf7dda = (isdefined(getgametypesetting(#"autodecaytime")) ? getgametypesetting(#"autodecaytime") : undefined);
	var_1c72bdec = getgametypesetting(#"capturetime");
	var_17cc111a = getgametypesetting(#"hash_130d127406ab976e");
	var_49e24f2 = getgametypesetting(#"hash_4df429f326400c0f");
	if(level.flagcanbeneutralized)
	{
		var_1c72bdec = var_1c72bdec / 2;
		var_17cc111a = var_17cc111a / 2;
	}
	var_bd4d0f54 = getentarray("flag_primary", "targetname");
	if(var_bd4d0f54.size == 0)
	{
		/#
			for(index = 0; index < 20; index++)
			{
				println("");
			}
		#/
		callback::abort_level();
		return [];
	}
	var_3a0ebe3c = function_fa8f5fda(var_bd4d0f54);
	var_b96c9514 = [];
	foreach(trigger in var_3a0ebe3c)
	{
		visuals = [];
		visuals[0] = trigger.visual;
		name = #"dom" + trigger.visual.script_label;
		var_6b67c295 = gameobjects::create_use_object(#"none", trigger, visuals, (0, 0, 0), name);
		var_6b67c295 gameobjects::allow_use(#"hash_33c49a99551acae7");
		var_6b67c295 gameobjects::set_use_text(#"hash_12e5f9d3793fc759");
		var_6b67c295 gameobjects::set_visible(#"hash_5ccfd7bbbf07c770");
		var_6b67c295 gameobjects::set_owner_team(#"neutral");
		var_6b67c295 gameobjects::set_objective_entity(visuals[0]);
		var_6b67c295.label = var_6b67c295 gameobjects::get_label();
		var_6b67c295 gameobjects::function_5ea37c7c(&gameobjects::function_83eda4c0);
		var_6b67c295 gameobjects::set_use_time(var_1c72bdec);
		var_6b67c295 gameobjects::function_3dc7107c(var_49e24f2);
		var_6b67c295 gameobjects::function_e887a9d0(var_17cc111a);
		var_6b67c295.var_45438686 = 1;
		var_6b67c295.var_d1c3006c = 1;
		var_6b67c295.hasbeencaptured = 0;
		var_6b67c295.flagindex = trigger.visual.script_index;
		var_6b67c295.var_56d394cd = 0;
		var_6b67c295.var_a0ff5eb8 = !flag_capture_rate_increase;
		var_6b67c295.decayprogress = decay_progress;
		var_6b67c295.autodecaytime = var_3bf7dda;
		if(var_6b67c295.decayprogress)
		{
			var_6b67c295 gameobjects::must_maintain_claim(0);
			var_6b67c295 gameobjects::set_decay_time(var_1c72bdec);
		}
		/#
			assert(isdefined(var_6c9e0594));
		#/
		[[var_6c9e0594]](var_6b67c295);
		var_6b67c295.var_249009fd = [];
		function_229b384c(var_6b67c295);
		var_6b67c295.var_c851244c = 0;
		if(isdefined(var_6b67c295.data.var_95afd88f))
		{
			var_6b67c295.var_c851244c = namespace_99c84a33::function_99652b58(var_6b67c295.data.var_95afd88f, var_6b67c295.objectiveid);
		}
		trigger.gameobject = var_6b67c295;
		if(!isdefined(var_b96c9514))
		{
			var_b96c9514 = [];
		}
		else if(!isarray(var_b96c9514))
		{
			var_b96c9514 = array(var_b96c9514);
		}
		var_b96c9514[var_b96c9514.size] = var_6b67c295;
	}
	return var_b96c9514;
}

/*
	Name: function_229b384c
	Namespace: namespace_5c32f369
	Checksum: 0xB26F3C5D
	Offset: 0x12F8
	Size: 0x32E
	Parameters: 1
	Flags: None
*/
function function_229b384c(zone)
{
	data = {};
	label = zone gameobjects::get_label();
	switch(label)
	{
		case "_a":
		{
			data.var_1629d8a0 = #"hash_3ff1c88b4360ea84";
			data.var_44e9bd00 = #"hash_5b47de31c97a49ff";
			data.spawnlist = "spl1";
			data.var_bd674032 = 1;
			data.var_95afd88f = "dom_a_cam";
			break;
		}
		case "_b":
		{
			data.var_1629d8a0 = #"hash_dd6191acefd6847";
			data.var_44e9bd00 = #"hash_481e5e34f798331e";
			data.var_bd674032 = 2;
			data.spawnlist = "spl2";
			data.var_ecee1402 = 1;
			data.var_95afd88f = "dom_b_cam";
			break;
		}
		case "_c":
		{
			data.var_1629d8a0 = #"hash_25a2a0aff40c76aa";
			data.var_44e9bd00 = #"hash_6a0c2383d37849bd";
			data.spawnlist = "spl3";
			data.var_bd674032 = 3;
			data.var_95afd88f = "dom_c_cam";
			break;
		}
		case "_d":
		{
			data.var_1629d8a0 = #"hash_2bcd7171f9aae4a5";
			data.var_44e9bd00 = #"hash_5079687d6a87790c";
			data.spawnlist = "spl4";
			data.var_bd674032 = 4;
			data.var_95afd88f = "dom_d_cam";
			break;
		}
		case "_e":
		{
			data.var_1629d8a0 = #"hash_5334d65b46b55660";
			data.var_44e9bd00 = #"hash_78e2a90cf85daa3b";
			data.spawnlist = "spl5";
			data.var_bd674032 = 5;
			data.var_95afd88f = "dom_d_cam";
			break;
		}
		case "_f":
		{
			data.var_1629d8a0 = #"hash_6848900356c78b93";
			data.var_44e9bd00 = #"hash_cd72c0a5ba856da";
			data.spawnlist = "spl6";
			data.var_bd674032 = 6;
			data.var_95afd88f = "dom_f_cam";
			break;
		}
		default:
		{
			break;
		}
	}
	data.dialog_key = "objective" + label;
	zone.data = data;
}

/*
	Name: function_669e3110
	Namespace: namespace_5c32f369
	Checksum: 0x8BAEBE32
	Offset: 0x1630
	Size: 0x22A
	Parameters: 0
	Flags: None
*/
function function_669e3110()
{
	var_9a6d57c4 = territory::function_1deaf019("headquarter", "targetname");
	if(var_9a6d57c4.size == 0)
	{
		return [];
	}
	headquarters = [];
	foreach(headquarter in var_9a6d57c4)
	{
		if(!isdefined(level.teams[headquarter.script_team]))
		{
			continue;
		}
		headquarter.objectiveid = gameobjects::get_next_obj_id();
		headquarter.var_c851244c = 0;
		objective_add(headquarter.objectiveid, "active", headquarter, "dom_headquarter");
		objective_setteam(headquarter.objectiveid, headquarter.script_team);
		function_4339912c(headquarter.objectiveid);
		function_29ef32ee(headquarter.objectiveid, headquarter.script_team);
		headquarter.var_95afd88f = ("dom_" + headquarter.script_team) + "_hq_cam";
		headquarter.var_c851244c = namespace_99c84a33::function_99652b58(headquarter.var_95afd88f, headquarter.objectiveid, headquarter.script_team);
		if(!isdefined(headquarters))
		{
			headquarters = [];
		}
		else if(!isarray(headquarters))
		{
			headquarters = array(headquarters);
		}
		headquarters[headquarters.size] = headquarter;
	}
	return headquarters;
}

/*
	Name: function_daaeaa95
	Namespace: namespace_5c32f369
	Checksum: 0x48279DEA
	Offset: 0x1868
	Size: 0x534
	Parameters: 0
	Flags: None
*/
function function_daaeaa95()
{
	game.dialog[#"securing_a"] = "domFriendlySecuringA";
	game.dialog[#"securing_b"] = "domFriendlySecuringB";
	game.dialog[#"securing_c"] = "domFriendlySecuringC";
	game.dialog[#"securing_d"] = "domFriendlySecuringD";
	game.dialog[#"securing_e"] = "domFriendlySecuringE";
	game.dialog[#"securing_f"] = "domFriendlySecuringF";
	game.dialog[#"secured_a"] = "domFriendlySecuredA";
	game.dialog[#"secured_b"] = "domFriendlySecuredB";
	game.dialog[#"secured_c"] = "domFriendlySecuredC";
	game.dialog[#"secured_d"] = "domFriendlySecuredD";
	game.dialog[#"secured_e"] = "domFriendlySecuredE";
	game.dialog[#"secured_f"] = "domFriendlySecuredF";
	game.dialog[#"secured_all"] = "domFriendlySecuredAll";
	game.dialog[#"losing_a"] = "domEnemySecuringA";
	game.dialog[#"losing_b"] = "domEnemySecuringB";
	game.dialog[#"losing_c"] = "domEnemySecuringC";
	game.dialog[#"losing_d"] = "domEnemySecuringD";
	game.dialog[#"losing_e"] = "domEnemySecuringE";
	game.dialog[#"losing_f"] = "domEnemySecuringF";
	game.dialog[#"lost_a"] = "domEnemySecuredA";
	game.dialog[#"lost_b"] = "domEnemySecuredB";
	game.dialog[#"lost_c"] = "domEnemySecuredC";
	game.dialog[#"lost_d"] = "domEnemySecuredD";
	game.dialog[#"lost_e"] = "domEnemySecuredE";
	game.dialog[#"lost_f"] = "domEnemySecuredF";
	game.dialog[#"lost_all"] = "domEnemySecuredAll";
	game.dialog[#"enemy_a"] = "domEnemyHasA";
	game.dialog[#"enemy_b"] = "domEnemyHasB";
	game.dialog[#"enemy_c"] = "domEnemyHasC";
	game.dialog[#"enemy_d"] = "domEnemyHasD";
	game.dialog[#"enemy_e"] = "domEnemyHasE";
	game.dialog[#"enemy_f"] = "domEnemyHasF";
	game.dialogtime = [];
	game.dialogtime[#"securing_a"] = 0;
	game.dialogtime[#"securing_b"] = 0;
	game.dialogtime[#"securing_c"] = 0;
	game.dialogtime[#"securing_d"] = 0;
	game.dialogtime[#"securing_e"] = 0;
	game.dialogtime[#"securing_f"] = 0;
	game.dialogtime[#"losing_a"] = 0;
	game.dialogtime[#"losing_b"] = 0;
	game.dialogtime[#"losing_c"] = 0;
	game.dialogtime[#"losing_d"] = 0;
	game.dialogtime[#"losing_e"] = 0;
	game.dialogtime[#"losing_f"] = 0;
}

/*
	Name: function_fa8f5fda
	Namespace: namespace_5c32f369
	Checksum: 0x1E3B4836
	Offset: 0x1DA8
	Size: 0x394
	Parameters: 1
	Flags: Private
*/
function private function_fa8f5fda(var_bd4d0f54)
{
	var_3a0ebe3c = [];
	foreach(var_68adb4a4 in var_bd4d0f54)
	{
		if(!var_68adb4a4 territory::is_inside(var_68adb4a4.origin))
		{
			continue;
		}
		if(isdefined(var_68adb4a4.target))
		{
			var_68adb4a4 setmodel("tag_origin");
			triggers = territory::function_1deaf019(var_68adb4a4.target, "targetname");
			/#
				var_99db19f5 = "";
				if(isdefined(level.territory) && isdefined(level.territory.targetname))
				{
					var_99db19f5 = ("" + level.territory.targetname) + "";
				}
				/#
					assert(triggers.size == 1, ((("" + var_68adb4a4.target) + "") + triggers.size) + var_99db19f5);
				#/
			#/
			trigger = triggers[0];
			trigger trigger::add_flags(16);
			if(isdefined(trigger))
			{
				trigger.visual = var_68adb4a4;
				trigger.script_label = var_68adb4a4.script_label;
			}
			else
			{
				/#
					util::error((("" + var_68adb4a4.script_label) + "") + var_68adb4a4.target);
				#/
			}
		}
		else
		{
			/#
				util::error("" + var_68adb4a4.script_label);
			#/
		}
		if(trigger.script_label == "_a")
		{
			var_3a0ebe3c[0] = trigger;
			continue;
		}
		if(trigger.script_label == "_b")
		{
			var_3a0ebe3c[1] = trigger;
			continue;
		}
		if(trigger.script_label == "_c")
		{
			var_3a0ebe3c[2] = trigger;
			continue;
		}
		if(trigger.script_label == "_d")
		{
			var_3a0ebe3c[3] = trigger;
			continue;
		}
		if(trigger.script_label == "_e")
		{
			var_3a0ebe3c[4] = trigger;
			continue;
		}
		if(trigger.script_label == "_f")
		{
			var_3a0ebe3c[5] = trigger;
			continue;
		}
		/#
			util::error("" + trigger.script_label);
		#/
	}
	return var_3a0ebe3c;
}

/*
	Name: function_c6b70aba
	Namespace: namespace_5c32f369
	Checksum: 0x4ADC1487
	Offset: 0x2148
	Size: 0x66
	Parameters: 1
	Flags: Private
*/
function private function_c6b70aba(dialog)
{
	dialogtime = game.dialogtime[dialog];
	if(isdefined(dialogtime))
	{
		time = gettime();
		if(dialogtime > time)
		{
			return true;
		}
		game.dialogtime[dialog] = time + 10000;
	}
	return false;
}

/*
	Name: function_32f614e2
	Namespace: namespace_5c32f369
	Checksum: 0xD9F74344
	Offset: 0x21B8
	Size: 0x2E
	Parameters: 1
	Flags: Private
*/
function private function_32f614e2(objectivekey)
{
	if(isdefined(objectivekey))
	{
		if(objectivekey != "objective_all")
		{
			return "domPointDialogBuffer";
		}
	}
	return undefined;
}

/*
	Name: function_ea620e62
	Namespace: namespace_5c32f369
	Checksum: 0x560F83CD
	Offset: 0x21F0
	Size: 0x84
	Parameters: 3
	Flags: None
*/
function function_ea620e62(dialog, players, objectivekey)
{
	if(function_c6b70aba(dialog))
	{
		return;
	}
	dialogbufferkey = function_32f614e2(objectivekey);
	globallogic_audio::function_61e17de0(game.dialog[dialog], players, objectivekey, undefined, dialogbufferkey);
}

/*
	Name: function_66d7165e
	Namespace: namespace_5c32f369
	Checksum: 0x97BDBEB8
	Offset: 0x2280
	Size: 0x22
	Parameters: 1
	Flags: None
*/
function function_66d7165e(user)
{
	return getplayers(user);
}

/*
	Name: function_67e581be
	Namespace: namespace_5c32f369
	Checksum: 0x6827B0D2
	Offset: 0x22B0
	Size: 0x32
	Parameters: 1
	Flags: None
*/
function function_67e581be(team)
{
	user = team;
	return function_66d7165e(user);
}

/*
	Name: function_1575fa8b
	Namespace: namespace_5c32f369
	Checksum: 0xC66E48F
	Offset: 0x22F0
	Size: 0x22
	Parameters: 1
	Flags: None
*/
function function_1575fa8b(user)
{
	return getenemyplayers(user);
}

/*
	Name: function_843bafab
	Namespace: namespace_5c32f369
	Checksum: 0x6D6DCDF2
	Offset: 0x2320
	Size: 0x32
	Parameters: 1
	Flags: None
*/
function function_843bafab(team)
{
	user = team;
	return function_1575fa8b(user);
}

/*
	Name: on_begin_use
	Namespace: namespace_5c32f369
	Checksum: 0x9860C5B3
	Offset: 0x2360
	Size: 0x7E
	Parameters: 1
	Flags: None
*/
function on_begin_use(sentient)
{
	self.didstatusnotify = 0;
	if(!self gameobjects::function_abb86400())
	{
		function_ea620e62("securing" + self.label, function_67e581be(sentient.team), "objective" + self.label);
		return;
	}
}

/*
	Name: on_end_use
	Namespace: namespace_5c32f369
	Checksum: 0xE3A59D45
	Offset: 0x23E8
	Size: 0x74
	Parameters: 3
	Flags: None
*/
function on_end_use(var_98fb2758, player, success)
{
	if(!success)
	{
		globallogic_audio::flush_objective_dialog("objective" + self.label);
	}
	self.var_d1c3006c = 1;
	player thread function_4242921c(self, success);
}

/*
	Name: function_5eef5cf4
	Namespace: namespace_5c32f369
	Checksum: 0x9219B26A
	Offset: 0x2468
	Size: 0xAA
	Parameters: 1
	Flags: Private
*/
function private function_5eef5cf4(var_77efb18)
{
	foreach(user in self.users)
	{
		if(key == var_77efb18)
		{
			continue;
		}
		if(user.touching.players.size > 0)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: on_decay_complete
	Namespace: namespace_5c32f369
	Checksum: 0xD407D971
	Offset: 0x2520
	Size: 0x160
	Parameters: 0
	Flags: None
*/
function on_decay_complete()
{
	user = self gameobjects::function_167d3a40();
	if(self gameobjects::get_num_touching(user) > 0 && !function_5eef5cf4(user))
	{
		self.var_670f7a7f = 1;
		touchlist = arraycopy(self.users[user].touching.players);
		foreach(st in touchlist)
		{
			player_from_touchlist = gameobjects::function_73944efe(touchlist, st);
			if(!isdefined(player_from_touchlist))
			{
				continue;
			}
			scoreevents::processscoreevent(#"hash_7edabe01ed05afa3", player_from_touchlist, undefined, undefined);
		}
	}
}

/*
	Name: on_touch_use
	Namespace: namespace_5c32f369
	Checksum: 0x2393C7A0
	Offset: 0x2688
	Size: 0xF4
	Parameters: 1
	Flags: None
*/
function on_touch_use(sentient)
{
	if(isplayer(sentient))
	{
		if((isdefined(self.contested) ? self.contested : 0))
		{
			if((isdefined(sentient.var_c8d27c06) ? sentient.var_c8d27c06 : 0) < gettime())
			{
				sentient playsoundtoplayer(#"hash_78e92d9f21eef6d1", sentient);
				sentient.var_c8d27c06 = gettime() + 5000;
			}
		}
		else if(sentient.team !== self gameobjects::get_owner_team())
		{
			battlechatter::function_98898d14(sentient, self);
		}
		challenges::function_783313d8(sentient);
	}
}

/*
	Name: on_use_update
	Namespace: namespace_5c32f369
	Checksum: 0xC148F7FA
	Offset: 0x2788
	Size: 0x372
	Parameters: 3
	Flags: None
*/
function on_use_update(var_98fb2758, progress, change)
{
	if(change > 0)
	{
		self gameobjects::set_flags((var_98fb2758 == "allies" ? 1 : 2));
	}
	if(progress > 0.05 && change && !self.didstatusnotify)
	{
		if(!self gameobjects::function_abb86400())
		{
			var_e6d916f3 = function_66d7165e(var_98fb2758);
			function_ea620e62("securing" + self.label, var_e6d916f3, "objective" + self.label);
		}
		else
		{
			var_53a985f3 = function_66d7165e(self gameobjects::function_167d3a40());
			var_e6d916f3 = function_66d7165e(var_98fb2758);
			function_ea620e62("losing" + self.label, var_53a985f3, "objective" + self.label);
			function_ea620e62("securing" + self.label, var_e6d916f3, "objective" + self.label);
			globallogic_audio::flush_objective_dialog("objective_all");
		}
		self.didstatusnotify = 1;
	}
	if(change > 0 && self.var_d1c3006c)
	{
		self.var_d1c3006c = 0;
		var_53a985f3 = function_66d7165e(self gameobjects::function_167d3a40());
		var_e6d916f3 = function_66d7165e(var_98fb2758);
		foreach(player in var_e6d916f3)
		{
			player playsoundtoplayer(#"hash_5739d2bc3554b3f9", player);
		}
		foreach(player in var_53a985f3)
		{
			player playsoundtoplayer(#"hash_3d00e79976c2e9da", player);
		}
	}
	else if(change == 0 && !self.var_d1c3006c)
	{
		self.var_d1c3006c = 1;
	}
}

/*
	Name: function_bcaf6836
	Namespace: namespace_5c32f369
	Checksum: 0xE1B35A59
	Offset: 0x2B08
	Size: 0x252
	Parameters: 0
	Flags: None
*/
function function_bcaf6836()
{
	if(!isdefined(self.contested))
	{
		self.contested = 0;
	}
	var_1694a3a1 = self gameobjects::get_num_touching(self.var_a4926509);
	var_7e132a67 = self gameobjects::function_3a7a2963(self.var_a4926509);
	previousstate = self.contested;
	if(var_1694a3a1 > 0 && var_7e132a67 > 0)
	{
		if(previousstate == 0)
		{
			foreach(user in self.users)
			{
				foreach(struct in user.touching.players)
				{
					player = struct.player;
					if(isdefined(player) && isplayer(player) && (isdefined(player.var_c8d27c06) ? player.var_c8d27c06 : 0) < gettime())
					{
						player playsoundtoplayer(#"hash_78e92d9f21eef6d1", player);
						player.var_c8d27c06 = gettime() + 5000;
					}
				}
			}
		}
		self.contested = 1;
	}
	else
	{
		if(previousstate == 1)
		{
			self notify(#"contest_over");
		}
		self.contested = 0;
	}
}

/*
	Name: function_ef42f0bd
	Namespace: namespace_5c32f369
	Checksum: 0xB71D4020
	Offset: 0x2D68
	Size: 0x98
	Parameters: 0
	Flags: None
*/
function function_ef42f0bd()
{
	foreach(zone in level.domflags)
	{
		globallogic_audio::flush_objective_dialog(zone.data.dialog_key);
	}
}

/*
	Name: function_88134907
	Namespace: namespace_5c32f369
	Checksum: 0xB529DFF2
	Offset: 0x2E08
	Size: 0xB0
	Parameters: 1
	Flags: Private
*/
function private function_88134907(team)
{
	score = 0;
	foreach(capture_zone in level.domflags)
	{
		if(capture_zone gameobjects::get_owner_team() == team)
		{
			score++;
		}
	}
	return score;
}

/*
	Name: function_48b377
	Namespace: namespace_5c32f369
	Checksum: 0x21CF06F0
	Offset: 0x2EC0
	Size: 0x4A
	Parameters: 1
	Flags: None
*/
function function_48b377(team)
{
	count = function_88134907(team);
	if(count == level.domflags.size)
	{
		return true;
	}
	return false;
}

/*
	Name: function_95470569
	Namespace: namespace_5c32f369
	Checksum: 0x772A6AE5
	Offset: 0x2F18
	Size: 0xCE
	Parameters: 0
	Flags: None
*/
function function_95470569()
{
	players = [];
	foreach(_ in level.teams)
	{
		if(function_88134907(team) == 0)
		{
			players = arraycombine(players, getplayers(team));
		}
	}
	return players;
}

/*
	Name: function_7d0692bc
	Namespace: namespace_5c32f369
	Checksum: 0xD71D20B5
	Offset: 0x2FF0
	Size: 0xDC
	Parameters: 4
	Flags: None
*/
function function_7d0692bc(user, var_24672ed6, string, var_81b74b24)
{
	if(is_true(getgametypesetting(#"hash_5362566b7e897067")))
	{
		self thread function_ef09febd(self.users[user].contributors, self.users[user].touching.players, string, var_24672ed6, var_81b74b24, 0);
	}
	else
	{
		thread give_capture_credit(self.users[user].touching.players, string, var_24672ed6, var_81b74b24, 1);
	}
}

/*
	Name: capture_flag
	Namespace: namespace_5c32f369
	Checksum: 0x9E384E2F
	Offset: 0x30D8
	Size: 0x1A4
	Parameters: 2
	Flags: None
*/
function capture_flag(var_5e54cb59, var_24672ed6)
{
	user = gameobjects::function_4e3386a8(var_5e54cb59);
	var_d89c1031 = var_5e54cb59;
	if(level.flagcanbeneutralized && !var_24672ed6)
	{
		level notify(#"flag_neutralized");
		string = self.data.var_1629d8a0;
		var_d89c1031 = #"neutral";
		thread give_neutralized_credit(self.users[user].touching.players, string, var_24672ed6);
	}
	else
	{
		level notify(#"flag_captured");
		function_7d0692bc(user, var_24672ed6, self.data.var_44e9bd00, is_true(self.var_ecee1402));
		if(!isdefined(self.var_249009fd))
		{
			self.var_249009fd = [];
		}
		else if(!isarray(self.var_249009fd))
		{
			self.var_249009fd = array(self.var_249009fd);
		}
		self.var_249009fd[self.var_249009fd.size] = gettime() - self.var_56d394cd;
	}
	self gameobjects::set_owner_team(var_d89c1031);
}

/*
	Name: function_bb3152b7
	Namespace: namespace_5c32f369
	Checksum: 0xA7CF7889
	Offset: 0x3288
	Size: 0x114
	Parameters: 2
	Flags: None
*/
function function_bb3152b7(var_d89c1031, var_b4950c2b)
{
	if(var_d89c1031 == #"neutral")
	{
		return;
	}
	var_50782ea4 = function_67e581be(var_d89c1031);
	if(var_b4950c2b)
	{
		function_ea620e62("secured_all", var_50782ea4, "objective_all");
		function_ef42f0bd();
	}
	else
	{
		function_ea620e62("secured" + self.label, var_50782ea4, self.data.dialog_key);
		globallogic_audio::flush_objective_dialog("objective_all");
	}
	thread util::function_f0b75565(var_50782ea4, "mpl_dom_captured_by_friendly");
	globallogic_audio::function_abf21f69("mpl_dom_captured_by_friendly", var_50782ea4);
}

/*
	Name: function_91cdcd1e
	Namespace: namespace_5c32f369
	Checksum: 0x6FAE96A8
	Offset: 0x33A8
	Size: 0x15E
	Parameters: 3
	Flags: None
*/
function function_91cdcd1e(enemy_players, var_24672ed6, var_b4950c2b)
{
	if(var_b4950c2b)
	{
		function_ea620e62("lost_all", enemy_players, "objective_all");
		function_ef42f0bd();
	}
	else
	{
		if(!var_24672ed6)
		{
			var_56fa1097 = (randomint(2) ? "lost" + self.label : #"enemy" + self.label);
		}
		else
		{
			var_56fa1097 = #"enemy" + self.label;
		}
		function_ea620e62(var_56fa1097, enemy_players, self.data.dialog_key);
		globallogic_audio::flush_objective_dialog("objective_all");
	}
	thread util::function_f0b75565(enemy_players, "mpl_dom_captured_by_enemy");
	globallogic_audio::function_abf21f69("mpl_dom_captured_by_enemy", enemy_players);
	if(!var_24672ed6)
	{
		self.var_45438686 = 0;
	}
}

/*
	Name: on_use
	Namespace: namespace_5c32f369
	Checksum: 0x6AA9BFDC
	Offset: 0x3510
	Size: 0x244
	Parameters: 1
	Flags: None
*/
function on_use(sentient)
{
	var_5e54cb59 = sentient.team;
	/#
		assert(var_5e54cb59 != #"neutral");
	#/
	/#
		print("" + self.label);
	#/
	var_24672ed6 = !self gameobjects::function_abb86400();
	enemy_players = function_1575fa8b(var_5e54cb59);
	self capture_flag(var_5e54cb59, var_24672ed6);
	var_d89c1031 = self gameobjects::function_167d3a40();
	var_b4950c2b = function_48b377(var_5e54cb59);
	self function_bb3152b7(var_d89c1031, var_b4950c2b);
	self function_91cdcd1e(enemy_players, var_24672ed6, var_b4950c2b);
	self.var_56d394cd = gettime();
	spawning::function_7a87efaa();
	if(dominated_challenge_check())
	{
		level thread function_1bcd5536(var_5e54cb59);
		util::function_a3f7de13(25, var_5e54cb59);
	}
	else if(!var_24672ed6)
	{
		util::function_a3f7de13(20, var_5e54cb59, -1, self.data.var_bd674032);
	}
	self update_spawn_influencers(self gameobjects::get_owner_team());
	bb::function_95a5b5c2("dom_capture", self gameobjects::get_label(), var_5e54cb59, sentient.origin);
}

/*
	Name: update_caps_per_minute
	Namespace: namespace_5c32f369
	Checksum: 0xC0BE87E0
	Offset: 0x3760
	Size: 0x13E
	Parameters: 1
	Flags: None
*/
function update_caps_per_minute(var_24672ed6)
{
	if(!isdefined(self.capsperminute))
	{
		self.numcaps = 0;
		self.capsperminute = 0;
	}
	if(var_24672ed6)
	{
		return;
	}
	self.numcaps++;
	minutespassed = float(globallogic_utils::gettimepassed()) / 60000;
	if(isplayer(self) && isdefined(self.timeplayed[#"total"]))
	{
		minutespassed = self.timeplayed[#"total"] / 60;
	}
	if((isdefined(minutespassed) ? minutespassed : 0) > 0)
	{
		self.capsperminute = self.numcaps / minutespassed;
	}
	else
	{
		self.capsperminute = self.numcaps;
	}
	if(self.capsperminute > self.numcaps)
	{
		self.capsperminute = self.numcaps;
	}
}

/*
	Name: give_neutralized_credit
	Namespace: namespace_5c32f369
	Checksum: 0x6252397D
	Offset: 0x38A8
	Size: 0x298
	Parameters: 3
	Flags: None
*/
function give_neutralized_credit(touchlist, string, var_24672ed6)
{
	time = gettime();
	waitframe(1);
	util::waittillslowprocessallowed();
	foreach(touch in touchlist)
	{
		player_from_touchlist = gameobjects::function_73944efe(touchlist, touch);
		if(!isdefined(player_from_touchlist))
		{
			continue;
		}
		player_from_touchlist update_caps_per_minute(var_24672ed6);
		if(!is_score_boosting(player_from_touchlist, self))
		{
			scoreevents::processscoreevent(#"dom_point_neutralized_neutralizing", player_from_touchlist, undefined, undefined);
			player_from_touchlist recordgameevent("neutralized");
			level thread telemetry::function_18135b72(#"hash_540cddd637f71a5e", {#eventtype:#"neutralized", #player:player_from_touchlist});
			if(isdefined(player_from_touchlist.pers[#"neutralizes"]))
			{
				player_from_touchlist.pers[#"neutralizes"]++;
				player_from_touchlist.captures = player_from_touchlist.pers[#"neutralizes"];
			}
			demo::bookmark(#"event", gettime(), player_from_touchlist);
			potm::bookmark(#"event", gettime(), player_from_touchlist);
		}
		else
		{
			/#
				player_from_touchlist iprintlnbold("");
			#/
		}
		level thread popups::displayteammessagetoall(string, player_from_touchlist);
	}
}

/*
	Name: give_capture_credit
	Namespace: namespace_5c32f369
	Checksum: 0x1FD01733
	Offset: 0x3B48
	Size: 0x128
	Parameters: 5
	Flags: None
*/
function give_capture_credit(touchlist, string, var_24672ed6, var_81b74b24, neutralizing)
{
	time = gettime();
	waitframe(1);
	util::waittillslowprocessallowed();
	self update_caps_per_minute(var_24672ed6);
	foreach(touch in touchlist)
	{
		player_from_touchlist = gameobjects::function_73944efe(touchlist, touch);
		if(!isdefined(player_from_touchlist))
		{
			continue;
		}
		credit_player(player_from_touchlist, string, var_24672ed6, var_81b74b24, neutralizing, time, 0, 1);
	}
}

/*
	Name: credit_player
	Namespace: namespace_5c32f369
	Checksum: 0x7EB154F2
	Offset: 0x3C78
	Size: 0x4D4
	Parameters: 8
	Flags: None
*/
function credit_player(player, string, var_24672ed6, var_81b74b24, neutralizing, time, var_a84f97bf, var_af8f6146)
{
	player update_caps_per_minute(var_24672ed6);
	if(!is_score_boosting(player, self))
	{
		player challenges::capturedobjective(time, self.trigger);
		battlechatter::function_924699f4(player, self);
		if(var_24672ed6 && neutralizing && is_true(self.hasbeencaptured))
		{
			scoreevents::processscoreevent(#"dom_point_secured_neutralizing", player, level.weaponnone, undefined);
		}
		else
		{
			if(var_24672ed6)
			{
				if(var_81b74b24)
				{
					scoreevents::processscoreevent(#"hash_40d073eb367b9e75", player, level.weaponnone, undefined);
					player stats::function_dad108fa(#"hash_60545a50ce7c9791", 1);
				}
				else
				{
					scoreevents::processscoreevent(#"dom_point_neutral_secured", player, level.weaponnone, undefined);
				}
			}
			else
			{
				scoreevents::processscoreevent(#"dom_point_secured", player, level.weaponnone, undefined);
			}
		}
		self.hasbeencaptured = 1;
		player recordgameevent("capture");
		level thread telemetry::function_18135b72(#"hash_540cddd637f71a5e", {#eventtype:#"capture", #player:player});
		if(var_81b74b24)
		{
			level notify(#"hash_3809ea07643ef10e", {#player:player});
		}
		if(isdefined(player.pers[#"captures"]))
		{
			player.pers[#"captures"]++;
			player.captures = player.pers[#"captures"];
		}
		player.pers[#"objectives"]++;
		player.objectives = player.pers[#"objectives"];
		demo::bookmark(#"event", gettime(), player);
		potm::bookmark(#"event", gettime(), player);
		player stats::function_bb7eedf0(#"captures", 1);
		player globallogic_score::incpersstat(#"objectivescore", 1, 0, 1);
		if(is_true(getgametypesetting(#"hash_5362566b7e897067")))
		{
			player luinotifyevent(#"hash_289bacbf80b953c9", 2, self.objectiveid, player.var_759a143b);
			player.var_759a143b = undefined;
		}
		if(var_af8f6146)
		{
			player stats::function_dad108fa(#"hash_2f1df496791a2f5f", 1);
			player contracts::increment_contract(#"hash_4fa0008b60deaab4");
		}
	}
	else
	{
		/#
			player iprintlnbold("");
		#/
	}
	if(var_a84f97bf)
	{
		level thread popups::displayteammessagetoall(string, player);
	}
}

/*
	Name: dominated_challenge_check
	Namespace: namespace_5c32f369
	Checksum: 0xFEEFB760
	Offset: 0x4158
	Size: 0xC4
	Parameters: 0
	Flags: None
*/
function dominated_challenge_check()
{
	var_e9954a42 = undefined;
	foreach(capture_zone in level.domflags)
	{
		var_62d0eda0 = capture_zone gameobjects::function_167d3a40();
		if(!isdefined(var_e9954a42))
		{
			var_e9954a42 = var_62d0eda0;
		}
		if(var_62d0eda0 != var_e9954a42)
		{
			return false;
		}
	}
	return true;
}

/*
	Name: function_1bcd5536
	Namespace: namespace_5c32f369
	Checksum: 0xF093D85B
	Offset: 0x4228
	Size: 0x4C
	Parameters: 1
	Flags: None
*/
function function_1bcd5536(team)
{
	level endon(#"flag_captured", #"game_ended");
	wait(180);
	challenges::totaldomination(team);
}

/*
	Name: function_ef09febd
	Namespace: namespace_5c32f369
	Checksum: 0x588E6908
	Offset: 0x4280
	Size: 0x39C
	Parameters: 6
	Flags: None
*/
function function_ef09febd(var_1dbb2b2b, var_6d7ae157, string, var_24672ed6, var_81b74b24, neutralizing)
{
	time = gettime();
	waitframe(1);
	util::waittillslowprocessallowed();
	self update_caps_per_minute(var_24672ed6);
	var_b4613aa2 = [];
	earliestplayer = undefined;
	foreach(contribution in var_1dbb2b2b)
	{
		if(isdefined(contribution))
		{
			contributor = contribution.player;
			if(isdefined(contributor) && isdefined(contribution.contribution))
			{
				percentage = (100 * contribution.contribution) / self.usetime;
				contributor.var_759a143b = int(0.5 + percentage);
				contributor.var_1aea8209 = contribution.starttime;
				if(percentage < getgametypesetting(#"contributionmin"))
				{
					continue;
				}
				if(contribution.var_e22ea52b && (!isdefined(earliestplayer) || contributor.var_1aea8209 < earliestplayer.var_1aea8209))
				{
					earliestplayer = contributor;
				}
				if(!isdefined(var_b4613aa2))
				{
					var_b4613aa2 = [];
				}
				else if(!isarray(var_b4613aa2))
				{
					var_b4613aa2 = array(var_b4613aa2);
				}
				var_b4613aa2[var_b4613aa2.size] = contributor;
			}
		}
	}
	foreach(player in var_b4613aa2)
	{
		var_a84f97bf = earliestplayer === player;
		var_af8f6146 = 0;
		foreach(touch in var_6d7ae157)
		{
			if(!isdefined(touch))
			{
				continue;
			}
			if(touch.player === player)
			{
				var_af8f6146 = 1;
				break;
			}
		}
		credit_player(player, string, var_24672ed6, var_81b74b24, neutralizing, time, var_a84f97bf, var_af8f6146);
	}
	self gameobjects::function_bd47b0c7();
}

/*
	Name: function_a059441e
	Namespace: namespace_5c32f369
	Checksum: 0xC17EC712
	Offset: 0x4628
	Size: 0x148
	Parameters: 0
	Flags: None
*/
function function_a059441e()
{
	if(function_5995018a() > 0)
	{
		return;
	}
	round_score_limit = util::get_current_round_score_limit();
	var_91766e40 = 0;
	var_c9949377 = level.teams;
	var_f7ad20df = &teams::function_7f8faff9;
	var_bc3edf78 = &function_88134907;
	foreach(_ in var_c9949377)
	{
		if([[var_f7ad20df]](var_60f7478) == (round_score_limit - 1) && [[var_bc3edf78]](var_60f7478) > 0)
		{
			var_91766e40++;
		}
	}
	if(var_91766e40 > 1)
	{
		level.clampscorelimit = 0;
	}
}

/*
	Name: function_ce1f2f60
	Namespace: namespace_5c32f369
	Checksum: 0xB9AC4CFE
	Offset: 0x4778
	Size: 0xF4
	Parameters: 3
	Flags: None
*/
function function_ce1f2f60(var_77d0878c, var_6d179b9d, var_947c5f58)
{
	if(util::islastround() || util::isoneround())
	{
		nearwinning = "nearWinningFinal";
		nearlosing = "nearLosingFinal";
	}
	else
	{
		nearwinning = "nearWinning";
		nearlosing = "nearLosing";
	}
	if(var_947c5f58)
	{
		neardrawing = "nearDrawing";
		globallogic_audio::function_61e17de0(neardrawing, var_77d0878c);
	}
	else
	{
		globallogic_audio::function_61e17de0(nearwinning, var_77d0878c);
	}
	globallogic_audio::function_61e17de0(nearlosing, var_6d179b9d);
}

/*
	Name: function_c2b3568d
	Namespace: namespace_5c32f369
	Checksum: 0xF83CDC42
	Offset: 0x4878
	Size: 0x290
	Parameters: 1
	Flags: None
*/
function function_c2b3568d(var_a7c860e6)
{
	var_9124ae8e = 0;
	var_c9949377 = level.teams;
	var_f7ad20df = &teams::function_7f8faff9;
	var_6e5994f6 = &getplayers;
	var_b47a98a8 = [];
	var_947c5f58 = 0;
	foreach(var_60f7478, _ in var_c9949377)
	{
		score = [[var_f7ad20df]](var_60f7478);
		var_b47a98a8[var_60f7478] = score;
		if(score > var_9124ae8e)
		{
			var_9124ae8e = score;
			var_37bafbf8 = var_60f7478;
		}
	}
	if(var_9124ae8e < var_a7c860e6)
	{
		return false;
	}
	if(isdefined(var_37bafbf8))
	{
		var_77d0878c = [];
		var_6d179b9d = [];
		var_77d0878c = [[var_6e5994f6]](var_37bafbf8);
		foreach(_ in var_c9949377)
		{
			if(var_37bafbf8 == loser)
			{
				continue;
			}
			if(var_9124ae8e - var_b47a98a8[loser] < 2)
			{
				var_947c5f58 = 1;
				var_77d0878c = arraycombine(var_77d0878c, [[var_6e5994f6]](loser));
				continue;
			}
			var_6d179b9d = arraycombine(var_6d179b9d, [[var_6e5994f6]](loser));
		}
		function_ce1f2f60(var_77d0878c, var_6d179b9d, var_947c5f58);
		level notify(#"hash_15b8b6edc4ed3032", {#hash_7090bf53:0});
		return true;
	}
	return false;
}

/*
	Name: function_3201d5d3
	Namespace: namespace_5c32f369
	Checksum: 0xC67A88F9
	Offset: 0x4B10
	Size: 0x114
	Parameters: 0
	Flags: None
*/
function function_3201d5d3()
{
	numownedflags = 0;
	var_2fc17e92 = level.teams;
	var_f7ad20df = &globallogic_score::giveteamscoreforobjective_delaypostprocessing;
	var_bc3edf78 = &function_88134907;
	foreach(_ in var_2fc17e92)
	{
		numflags = [[var_bc3edf78]](user);
		numownedflags = numownedflags + numflags;
		if(numflags)
		{
			[[var_f7ad20df]](user, numflags);
		}
	}
	if(numownedflags)
	{
		globallogic_score::postprocessteamscores();
	}
}

/*
	Name: function_5995018a
	Namespace: namespace_5c32f369
	Checksum: 0x118970E2
	Offset: 0x4C30
	Size: 0x22
	Parameters: 0
	Flags: None
*/
function function_5995018a()
{
	return function_88134907(#"neutral");
}

/*
	Name: function_1932f845
	Namespace: namespace_5c32f369
	Checksum: 0xFDC6C0AD
	Offset: 0x4C60
	Size: 0x1CC
	Parameters: 0
	Flags: None
*/
function function_1932f845()
{
	if(level.domflags.size == 0)
	{
		return false;
	}
	var_bac44d7f = (level.teamscoreperkill ? 0 : 1);
	/#
		if(getdvarint(#"hash_697b325da5b79b83", 0) > 0)
		{
			var_bac44d7f = 0;
		}
	#/
	if(!var_bac44d7f)
	{
		return false;
	}
	var_da0f2c7b = function_5995018a();
	if(var_da0f2c7b == 0)
	{
		return false;
	}
	var_16dc5e49 = math::clamp(level.domflags.size - var_da0f2c7b, 2, level.domflags.size);
	var_cce15e08 = (var_16dc5e49 * 90) + (var_16dc5e49 * (float(level.domflags[0].usetime) / 1000));
	timepassed = float(globallogic_utils::gettimepassed()) / 1000;
	if(timepassed > var_cce15e08 && gamemodeismode(0))
	{
		round::set_flag("tie");
		thread globallogic::end_round(0);
		return true;
	}
	return false;
}

/*
	Name: function_7bc4ede8
	Namespace: namespace_5c32f369
	Checksum: 0xEE996A51
	Offset: 0x4E38
	Size: 0x190
	Parameters: 0
	Flags: None
*/
function function_7bc4ede8()
{
	warningscore = 0;
	currentround = game.roundsplayed + 1;
	var_60f7888c = (floor((level.domflags.size / 2) + 0.5)) * 6;
	if(!level.timelimit)
	{
		if(level.roundscorelimit)
		{
			warningscore = max(0, (level.roundscorelimit * currentround) - var_60f7888c);
		}
		else if(level.scorelimit)
		{
			warningscore = max(0, level.scorelimit - var_60f7888c);
		}
	}
	playednearendvo = 0;
	while(!level.gameended)
	{
		function_a059441e();
		function_3201d5d3();
		if(function_1932f845())
		{
			return;
		}
		if(warningscore && !playednearendvo)
		{
			playednearendvo = function_c2b3568d(warningscore);
		}
		wait(5);
		hostmigration::waittillhostmigrationdone();
	}
}

/*
	Name: update_settings
	Namespace: namespace_5c32f369
	Checksum: 0x90DEAF43
	Offset: 0x4FD0
	Size: 0xCC
	Parameters: 0
	Flags: None
*/
function update_settings()
{
	level.playercapturelpm = getgametypesetting(#"maxplayereventsperminute");
	level.flagcapturelpm = getgametypesetting(#"maxobjectiveeventsperminute");
	level.playeroffensivemax = getgametypesetting(#"maxplayeroffensive");
	level.playerdefensivemax = getgametypesetting(#"maxplayerdefensive");
	level.flagcanbeneutralized = getgametypesetting(#"flagcanbeneutralized");
}

/*
	Name: onstartgametype
	Namespace: namespace_5c32f369
	Checksum: 0x14C40CAF
	Offset: 0x50A8
	Size: 0x84
	Parameters: 0
	Flags: None
*/
function onstartgametype()
{
	level.b_allow_vehicle_proximity_pickup = 1;
	update_settings();
	function_de560341();
	if(!getgametypesetting(#"hash_4e8cafe9a4470898"))
	{
		setup_zones();
	}
	else
	{
		function_fdbc620d();
	}
}

/*
	Name: function_de560341
	Namespace: namespace_5c32f369
	Checksum: 0x22FDCE2B
	Offset: 0x5138
	Size: 0x784
	Parameters: 0
	Flags: None
*/
function function_de560341()
{
	spawning::function_c40af6fa();
	spawning::addsupportedspawnpointtype("dom");
	spawning::function_32b97d1b(&spawning::function_90dee50d);
	spawning::function_adbbb58a(&spawning::function_c24e290c);
	spawning::addspawns();
	var_273a84a9 = [];
	if(!isdefined(var_273a84a9))
	{
		var_273a84a9 = [];
	}
	else if(!isarray(var_273a84a9))
	{
		var_273a84a9 = array(var_273a84a9);
	}
	var_273a84a9[var_273a84a9.size] = "dom_flag_a";
	if(!isdefined(var_273a84a9))
	{
		var_273a84a9 = [];
	}
	else if(!isarray(var_273a84a9))
	{
		var_273a84a9 = array(var_273a84a9);
	}
	var_273a84a9[var_273a84a9.size] = "dom_flag_b";
	if(!isdefined(var_273a84a9))
	{
		var_273a84a9 = [];
	}
	else if(!isarray(var_273a84a9))
	{
		var_273a84a9 = array(var_273a84a9);
	}
	var_273a84a9[var_273a84a9.size] = "dom_flag_c";
	if(!isdefined(var_273a84a9))
	{
		var_273a84a9 = [];
	}
	else if(!isarray(var_273a84a9))
	{
		var_273a84a9 = array(var_273a84a9);
	}
	var_273a84a9[var_273a84a9.size] = "dom_flag_d";
	if(!isdefined(var_273a84a9))
	{
		var_273a84a9 = [];
	}
	else if(!isarray(var_273a84a9))
	{
		var_273a84a9 = array(var_273a84a9);
	}
	var_273a84a9[var_273a84a9.size] = "dom_flag_e";
	if(!isdefined(var_273a84a9))
	{
		var_273a84a9 = [];
	}
	else if(!isarray(var_273a84a9))
	{
		var_273a84a9 = array(var_273a84a9);
	}
	var_273a84a9[var_273a84a9.size] = "dom_flag_f";
	flagspawns = spawning::function_d400d613(#"mp_spawn_point", var_273a84a9);
	foreach(var_de435199 in flagspawns)
	{
		foreach(spawn in var_de435199)
		{
			if(!isdefined(spawn.enabled))
			{
				spawn.enabled = -1;
			}
		}
	}
	if(isdefined(flagspawns))
	{
		if(isdefined(flagspawns[#"dom_flag_a"]))
		{
			addspawnpoints(#"allies", flagspawns[#"dom_flag_a"], "spl1");
			addspawnpoints(#"axis", flagspawns[#"dom_flag_a"], "spl1");
		}
		if(isdefined(flagspawns[#"dom_flag_b"]))
		{
			addspawnpoints(#"allies", flagspawns[#"dom_flag_b"], "spl2");
			addspawnpoints(#"axis", flagspawns[#"dom_flag_b"], "spl2");
		}
		if(isdefined(flagspawns[#"dom_flag_c"]))
		{
			addspawnpoints(#"allies", flagspawns[#"dom_flag_c"], "spl3");
			addspawnpoints(#"axis", flagspawns[#"dom_flag_c"], "spl3");
		}
		if(isdefined(flagspawns[#"dom_flag_d"]))
		{
			addspawnpoints(#"allies", flagspawns[#"dom_flag_d"], "spl4");
			addspawnpoints(#"axis", flagspawns[#"dom_flag_d"], "spl4");
		}
		if(isdefined(flagspawns[#"dom_flag_e"]))
		{
			addspawnpoints(#"allies", flagspawns[#"dom_flag_e"], "spl5");
			addspawnpoints(#"axis", flagspawns[#"dom_flag_e"], "spl5");
		}
		if(isdefined(flagspawns[#"dom_flag_f"]))
		{
			addspawnpoints(#"allies", flagspawns[#"dom_flag_f"], "spl6");
			addspawnpoints(#"axis", flagspawns[#"dom_flag_f"], "spl6");
		}
	}
	spawning::add_default_spawnlist("spl1");
	spawning::add_default_spawnlist("spl2");
	spawning::add_default_spawnlist("spl3");
	spawning::add_default_spawnlist("spl4");
	spawning::add_default_spawnlist("spl5");
	spawning::add_default_spawnlist("spl6");
}

/*
	Name: setup_zones
	Namespace: namespace_5c32f369
	Checksum: 0xE7940AA9
	Offset: 0x58C8
	Size: 0xCC
	Parameters: 0
	Flags: None
*/
function setup_zones()
{
	level.domflags = setup_capture_zones(&function_4480f87e);
	foreach(capture_zone in level.domflags)
	{
		capture_zone createflagspawninfluencers();
	}
	level.headquarters = function_669e3110();
}

/*
	Name: on_game_playing
	Namespace: namespace_5c32f369
	Checksum: 0x323B379D
	Offset: 0x59A0
	Size: 0x4C
	Parameters: 0
	Flags: None
*/
function on_game_playing()
{
	if(getgametypesetting(#"hash_4e8cafe9a4470898"))
	{
		setup_zones();
	}
	thread function_7bc4ede8();
}

/*
	Name: on_player_spawned
	Namespace: namespace_5c32f369
	Checksum: 0x12042324
	Offset: 0x59F8
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function on_player_spawned()
{
	self function_2ba2d8e5("");
}

/*
	Name: on_round_switch
	Namespace: namespace_5c32f369
	Checksum: 0xBFF7AF26
	Offset: 0x5A28
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function on_round_switch()
{
	gametype::on_round_switch();
	if(level.scoreroundwinbased)
	{
		globallogic_score::function_9779ac61();
	}
}

/*
	Name: is_score_boosting
	Namespace: namespace_5c32f369
	Checksum: 0x967CE71D
	Offset: 0x5A68
	Size: 0x5E
	Parameters: 2
	Flags: None
*/
function is_score_boosting(player, flag)
{
	if(!level.rankedmatch)
	{
		return false;
	}
	if(player.capsperminute > level.playercapturelpm)
	{
		return true;
	}
	if(flag.capsperminute > level.flagcapturelpm)
	{
		return true;
	}
	return false;
}

/*
	Name: onscoreclosemusic
	Namespace: namespace_5c32f369
	Checksum: 0x2BE5320B
	Offset: 0x5AD0
	Size: 0x70
	Parameters: 0
	Flags: None
*/
function onscoreclosemusic()
{
	if(!isdefined(level.sndhalfway))
	{
		level.sndhalfway = 0;
	}
	if(!level.sndhalfway && function_5d57c045())
	{
		level notify(#"sndmusichalfway");
		level.sndhalfway = 1;
	}
}

/*
	Name: function_5d57c045
	Namespace: namespace_5c32f369
	Checksum: 0xB2891663
	Offset: 0x5B48
	Size: 0x8A
	Parameters: 0
	Flags: None
*/
function function_5d57c045()
{
	halfwayscore = level.scorelimit * 0.5;
	if(isdefined(level.roundscorelimit))
	{
		halfwayscore = level.roundscorelimit * 0.5;
		if(game.roundsplayed == 1)
		{
			halfwayscore = halfwayscore + level.roundscorelimit;
		}
	}
	return teams::function_712e3ba6(halfwayscore);
}

/*
	Name: createflagspawninfluencers
	Namespace: namespace_5c32f369
	Checksum: 0xDBC38371
	Offset: 0x5BE0
	Size: 0x1F4
	Parameters: 0
	Flags: None
*/
function createflagspawninfluencers()
{
	ss = level.spawnsystem;
	self.owned_flag_influencer = self influencers::create_influencer("dom_friendly", self.trigger.origin, 0);
	self.neutral_flag_influencer = self influencers::create_influencer("dom_neutral", self.trigger.origin, 0);
	self.enemy_flag_influencer = self influencers::create_influencer("dom_enemy", self.trigger.origin, 0);
	var_4b91b8a4 = self function_58306805();
	if(isdefined(var_4b91b8a4))
	{
		self.var_7f85bfce = self influencers::create_influencer("dom_flag_spawn_friendly", self.trigger.origin, 0);
		function_8b51d4df(self.var_7f85bfce, var_4b91b8a4);
		self.var_b56facb1 = self influencers::create_influencer("dom_flag_spawn_enemy", self.trigger.origin, 0);
		function_8b51d4df(self.var_b56facb1, var_4b91b8a4);
		self.var_b0f6f826 = self influencers::create_influencer("dom_flag_spawn_neutral", self.trigger.origin, 0);
		function_8b51d4df(self.var_b0f6f826, var_4b91b8a4);
	}
	self update_spawn_influencers(#"neutral");
}

/*
	Name: update_spawn_influencers
	Namespace: namespace_5c32f369
	Checksum: 0xEC39E386
	Offset: 0x5DE0
	Size: 0x2CC
	Parameters: 1
	Flags: None
*/
function update_spawn_influencers(team)
{
	/#
		assert(isdefined(self.neutral_flag_influencer));
	#/
	/#
		assert(isdefined(self.owned_flag_influencer));
	#/
	/#
		assert(isdefined(self.enemy_flag_influencer));
	#/
	if(team == #"neutral")
	{
		enableinfluencer(self.neutral_flag_influencer, 1);
		enableinfluencer(self.owned_flag_influencer, 0);
		enableinfluencer(self.enemy_flag_influencer, 0);
		if(isdefined(self function_58306805()))
		{
			enableinfluencer(self.var_b0f6f826, 1);
			enableinfluencer(self.var_7f85bfce, 0);
			enableinfluencer(self.var_b56facb1, 0);
		}
	}
	else
	{
		enableinfluencer(self.neutral_flag_influencer, 0);
		enableinfluencer(self.owned_flag_influencer, 1);
		enableinfluencer(self.enemy_flag_influencer, 1);
		if(isdefined(self function_58306805()))
		{
			enableinfluencer(self.var_b0f6f826, 0);
			enableinfluencer(self.var_7f85bfce, 1);
			enableinfluencer(self.var_b56facb1, 1);
			setinfluencerteammask(self.var_7f85bfce, util::getteammask(team));
			setinfluencerteammask(self.var_b56facb1, util::getotherteamsmask(team));
		}
		setinfluencerteammask(self.owned_flag_influencer, util::getteammask(team));
		setinfluencerteammask(self.enemy_flag_influencer, util::getotherteamsmask(team));
	}
}

/*
	Name: function_58306805
	Namespace: namespace_5c32f369
	Checksum: 0xB5B6C87E
	Offset: 0x60B8
	Size: 0x12
	Parameters: 0
	Flags: None
*/
function function_58306805()
{
	return self.data.spawnlist;
}

/*
	Name: function_5ca9806b
	Namespace: namespace_5c32f369
	Checksum: 0xC4CA400B
	Offset: 0x60D8
	Size: 0x1C2
	Parameters: 1
	Flags: None
*/
function function_5ca9806b(var_e9670377)
{
	if(self.sessionstate === "playing")
	{
		return;
	}
	foreach(capture_zone in level.domflags)
	{
		if(is_true(capture_zone.var_c851244c) && capture_zone.objectiveid == var_e9670377)
		{
			if(self.team == capture_zone gameobjects::get_owner_team())
			{
				self namespace_99c84a33::function_99c84a33(capture_zone.objectiveid);
			}
			return;
		}
	}
	foreach(headquarter in level.headquarters)
	{
		if(is_true(headquarter.var_c851244c) && headquarter.objectiveid == var_e9670377)
		{
			if(self.team == headquarter.script_team)
			{
				self namespace_99c84a33::function_99c84a33(headquarter.objectiveid);
			}
			return;
		}
	}
}

/*
	Name: function_b4b9ba12
	Namespace: namespace_5c32f369
	Checksum: 0x37C71B8E
	Offset: 0x62A8
	Size: 0x6C
	Parameters: 2
	Flags: None
*/
function function_b4b9ba12(gameobject, starting)
{
	if(!isdefined(starting))
	{
		starting = 0;
	}
	if(!isdefined(self))
	{
		return;
	}
	if(!isdefined(gameobject))
	{
		return;
	}
	if(starting)
	{
		self thread function_15cbf89(gameobject);
	}
	else
	{
		self thread function_4242921c(gameobject);
	}
}

/*
	Name: function_15cbf89
	Namespace: namespace_5c32f369
	Checksum: 0xA3652A45
	Offset: 0x6320
	Size: 0x33E
	Parameters: 1
	Flags: None
*/
function function_15cbf89(gameobject)
{
	self notify("ef85952014218d3");
	self endon("ef85952014218d3");
	self endon(#"death", #"disconnect", #"hash_580789b91ba9f984");
	gameobject.trigger endon(#"destroyed", #"death");
	level endon(#"game_ended");
	waitframe(1);
	while(true)
	{
		currentprogress = gameobject.curprogress;
		var_f802a6b1 = gameobject.usetime;
		var_e672537f = currentprogress / var_f802a6b1;
		var_5b37f77b = gameobject.var_a4926509;
		iscontested = (isdefined(gameobject.contested) ? gameobject.contested : 0);
		if(iscontested)
		{
			self function_d24432a4("cap_contested");
			self function_2ba2d8e5("cap_contested");
		}
		else
		{
			if(isdefined(gameobject.ownerteam) && gameobject.ownerteam === self.team)
			{
				if(self.var_a022edea === "cap_contested")
				{
					self function_2ba2d8e5("cap_exit");
				}
				else
				{
					self function_2ba2d8e5("");
				}
				self.var_b3890fdf = 0;
			}
			else
			{
				if(var_5b37f77b != self.team)
				{
					self function_d24432a4("cap_drain");
					self function_2ba2d8e5("cap_drain");
				}
				else
				{
					if(var_e672537f >= 0.66)
					{
						self function_d24432a4("cap_high");
						self function_2ba2d8e5("cap_high");
					}
					else
					{
						if(var_e672537f >= 0.33)
						{
							self function_d24432a4("cap_mid");
							self function_2ba2d8e5("cap_mid");
						}
						else if(var_e672537f >= 0)
						{
							self function_d24432a4("cap_low");
							self function_2ba2d8e5("cap_low");
						}
					}
				}
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_4242921c
	Namespace: namespace_5c32f369
	Checksum: 0xEEADFC31
	Offset: 0x6668
	Size: 0x112
	Parameters: 2
	Flags: None
*/
function function_4242921c(gameobject, success)
{
	if(!isdefined(success))
	{
		success = 0;
	}
	if(!isdefined(self))
	{
		return;
	}
	if(isdefined(gameobject.ownerteam) && gameobject.ownerteam === self.team)
	{
		if(self.var_a022edea != "cap_contested")
		{
			self function_2ba2d8e5("");
			self notify(#"hash_580789b91ba9f984");
			self.var_b3890fdf = 0;
			return;
		}
	}
	if(success)
	{
		self function_2ba2d8e5("cap_success");
	}
	else
	{
		self function_2ba2d8e5("cap_exit");
		self notify(#"hash_580789b91ba9f984");
		self.var_b3890fdf = 0;
	}
}

/*
	Name: function_2ba2d8e5
	Namespace: namespace_5c32f369
	Checksum: 0xE61E9393
	Offset: 0x6788
	Size: 0x84
	Parameters: 1
	Flags: None
*/
function function_2ba2d8e5(state)
{
	if(!isdefined(self))
	{
		return;
	}
	if(!isdefined(self.var_a022edea))
	{
		self.var_a022edea = "";
	}
	if(is_true(level.var_2179a6bf))
	{
		return;
	}
	if(state != self.var_a022edea)
	{
		self.var_a022edea = state;
		globallogic_audio::function_c246758e(state);
	}
}

/*
	Name: function_d24432a4
	Namespace: namespace_5c32f369
	Checksum: 0xE8778A97
	Offset: 0x6818
	Size: 0x1F4
	Parameters: 1
	Flags: None
*/
function function_d24432a4(state)
{
	if(!isdefined(self.var_b3890fdf))
	{
		self.var_b3890fdf = 0;
	}
	if(game.state != #"playing")
	{
		return;
	}
	str_alias = undefined;
	switch(state)
	{
		case "cap_low":
		{
			str_alias = #"hash_1c5192b85675532d";
			n_waittime = 1.25;
			break;
		}
		case "cap_mid":
		{
			str_alias = #"hash_1c5191b85675517a";
			n_waittime = 1.25;
			break;
		}
		case "cap_high":
		{
			str_alias = #"hash_1c518cb8567548fb";
			n_waittime = 1.25;
			break;
		}
		case "cap_drain":
		{
			str_alias = #"hash_1c518fb856754e14";
			n_waittime = 1.25;
			break;
		}
		case "cap_contested":
		{
			str_alias = #"hash_43014e1f7354354f";
			n_waittime = 1.25;
			break;
		}
	}
	if(isdefined(str_alias))
	{
		var_bb0c6711 = gettime();
		if(self.var_b3890fdf <= var_bb0c6711)
		{
			if(self.var_b3890fdf === 0)
			{
				self.var_b3890fdf = var_bb0c6711 - 50;
			}
			self.var_b3890fdf = self.var_b3890fdf + (int(n_waittime * 1000));
			self playlocalsound(str_alias);
		}
	}
}

