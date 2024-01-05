#using scripts\cp_common\util.gsc;
#using scripts\cp_common\skipto.gsc;
#using scripts\cp_common\load.gsc;
#using script_32399001bdb550da;
#using script_35ae72be7b4fec10;
#using scripts\cp_common\gametypes\globallogic_ui.gsc;
#using scripts\cp_common\gametypes\globallogic.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\rank_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace menus;

/*
	Name: __init__system__
	Namespace: menus
	Checksum: 0xBF99D560
	Offset: 0x3E0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"menus", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: menus
	Checksum: 0xFBB0B072
	Offset: 0x428
	Size: 0x44
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	callback::on_start_gametype(&init);
	callback::on_connect(&on_player_connect);
}

/*
	Name: init
	Namespace: menus
	Checksum: 0x667B7C7F
	Offset: 0x478
	Size: 0x1BC
	Parameters: 0
	Flags: None
*/
function init()
{
	game.menu = [];
	game.menu[#"menu_team"] = "ChangeTeam";
	game.menu[#"menu_start_menu"] = "StartMenu_Main";
	game.menu[#"menu_class"] = "class";
	game.menu[#"menu_changeclass"] = "mobile_armory_loadout";
	game.menu[#"menu_changeclass_offline"] = "mobile_armory_loadout";
	game.menu[#"menu_draft"] = "PositionDraft";
	foreach(str_team in level.teams)
	{
		game.menu["menu_changeclass_" + str_team] = "mobile_armory_loadout";
	}
	game.menu[#"menu_controls"] = "ingame_controls";
	game.menu[#"menu_options"] = "ingame_options";
	game.menu[#"menu_leavegame"] = "popup_leavegame";
}

/*
	Name: on_player_connect
	Namespace: menus
	Checksum: 0x9263EF05
	Offset: 0x640
	Size: 0x1C
	Parameters: 0
	Flags: None
*/
function on_player_connect()
{
	self thread on_menu_response();
}

/*
	Name: on_menu_response
	Namespace: menus
	Checksum: 0x424BCBC5
	Offset: 0x668
	Size: 0x8E8
	Parameters: 0
	Flags: None
*/
function on_menu_response()
{
	self endon(#"disconnect");
	for(;;)
	{
		waitresult = undefined;
		waitresult = self waittill(#"menuresponse");
		menu = waitresult.menu;
		response = waitresult.response;
		intpayload = waitresult.intpayload;
		if(response == "menu_opened")
		{
			if(menu == "StartMenu_Main")
			{
				util::function_62e48a();
			}
		}
		if(response == "back")
		{
			self closeingamemenu();
			if(level.console)
			{
				if(menu == game.menu[#"menu_changeclass"] || menu == game.menu[#"menu_changeclass_offline"] || menu == game.menu[#"menu_team"] || menu == game.menu[#"menu_controls"])
				{
					if(isdefined(level.teams[self.pers[#"team"]]))
					{
						self openmenu(game.menu_start_menu);
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
		if(response == "endgame")
		{
			if(level.splitscreen)
			{
				level.skipvote = 1;
				if(!level.gameended)
				{
					level thread globallogic::forceend();
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
			if(!level.gameended)
			{
				self closeingamemenu();
				uploadstats();
				level thread globallogic::forceend();
			}
			else
			{
				self closeingamemenu();
				self iprintln(#"hash_6e4cedc56165f367");
			}
			continue;
		}
		if(response == #"first_snapshot")
		{
			if(level flag::get(#"hash_321357f5b78401ef"))
			{
				/#
					globallogic_ui::function_3f278444();
				#/
			}
			level flag::set(#"hash_321357f5b78401ef");
			continue;
		}
		if(response == #"restartmission")
		{
			level function_c35a1bfc();
			continue;
		}
		if(response == #"hash_4bb052c957debdfa")
		{
			level function_d7c2965();
			continue;
		}
		if(response == #"hash_30abbfec4597c191")
		{
			skipto::function_cfb483b7();
			continue;
		}
		if(response == "autocontrol")
		{
			self [[level.autocontrolplayer]]();
			continue;
		}
		if(response == "typing_complete")
		{
			level notify(#"typing_complete", {#line:intpayload});
			continue;
		}
		if(response == "personnel_profile_closed")
		{
			level notify(#"personnel_profile_closed", {#isconfirmed:intpayload});
			continue;
		}
		if(response == "note_closed")
		{
			level notify(#"note_closed");
			continue;
		}
		if(response == "evidence_board_option_selected")
		{
			level notify(#"evidence_board_option_selected", {#hash_70b35161:intpayload});
			continue;
		}
		if(response == "mission_option_selected")
		{
			level notify(#"mission_option_selected", {#hash_70b35161:intpayload});
			continue;
		}
		if(response == "dialog_tree_option_selected")
		{
			level notify(#"dialog_tree_option_selected", {#hash_70b35161:intpayload});
			continue;
		}
		if(response == "dialog_tree_kbm_key_selected")
		{
			level notify(#"dialog_tree_kbm_key_selected", {#hash_70b35161:intpayload});
			continue;
		}
		if(response == "lui_unpause_game")
		{
			level notify(#"lui_unpause_game", {#success:intpayload == 1});
			continue;
		}
		if(response == "objective_splash" && intpayload === 0)
		{
			level notify(#"hash_4df0c0f18673f6c3");
			continue;
		}
		if(response == #"hash_4c6480245891f16a")
		{
			level notify(#"hash_4c6480245891f16a", {#button:"" + intpayload});
			continue;
		}
		if(menu == game.menu[#"menu_team"] && level.allow_teamchange)
		{
			switch(response)
			{
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
				default:
				{
					self [[level.teammenu]](response);
					break;
				}
			}
			continue;
		}
		if(menu == game.menu[#"menu_draft"])
		{
			self [[level.draftmenu]](response, intpayload);
			continue;
		}
		if(menu == game.menu[#"menu_changeclass"] || menu == game.menu[#"menu_changeclass_offline"])
		{
			if(response != "back" && response != "cancel" && (!isdefined(self.disableclasscallback) || !self.disableclasscallback))
			{
				self closeingamemenu();
				self.selectedclass = 1;
				self [[level.curclass]](response);
			}
			else
			{
				self [[level.curclass]](response);
			}
			continue;
		}
		if(menu == "spectate")
		{
			player = util::getplayerfromclientnum(waitresult.intpayload);
			if(isdefined(player))
			{
				self setcurrentspectatorclient(player);
			}
		}
	}
}

/*
	Name: function_c35a1bfc
	Namespace: menus
	Checksum: 0x29D30611
	Offset: 0xF58
	Size: 0x394
	Parameters: 0
	Flags: Private
*/
function private function_c35a1bfc()
{
	self notify("6dfd273785998fbf");
	self endon("6dfd273785998fbf");
	player = getplayers()[0];
	player endon(#"disconnect");
	globallogic_ui::function_cdbb5c49(1, 1);
	player = getplayers()[0];
	player val::set(#"hash_1828a61368b4014c", "show_crosshair", 0);
	player val::set(#"hash_1828a61368b4014c", "freezecontrols", 1);
	player val::set(#"hash_1828a61368b4014c", "takedamage", 0);
	player val::set(#"hash_1828a61368b4014c", "allowdeath", 0);
	player function_2be6e08d(1);
	util::wait_network_frame(1);
	player savegame::set_player_data("saved_weapon", undefined);
	player savegame::set_player_data("saved_weapon_attachemnts", undefined);
	player savegame::set_player_data("saved_weapondata", undefined);
	player savegame::set_player_data("lives", undefined);
	player savegame::set_player_data("savegame_score", undefined);
	player savegame::set_player_data("savegame_kills", undefined);
	player savegame::set_player_data("savegame_assists", undefined);
	player savegame::set_player_data("savegame_incaps", undefined);
	player savegame::set_player_data("savegame_revives", undefined);
	player savegame::clear_mission_data(#"transient");
	player clearallnoncheckpointdata();
	world.var_b86bf11e = undefined;
	globallogic_ui::function_760546ce();
	var_1fdcd030 = savegame::get_mission_name();
	var_65792f8b = function_2717b55f(var_1fdcd030);
	if(isdefined(var_65792f8b) && isdefined(var_65792f8b.var_a04dfce6))
	{
		var_a04dfce6 = var_65792f8b.var_a04dfce6;
		if(var_a04dfce6 != "")
		{
			skipto::set_current_skipto(var_a04dfce6, 1);
			map_restart();
		}
	}
	else
	{
		missionrestart();
	}
}

/*
	Name: function_d7c2965
	Namespace: menus
	Checksum: 0xCB6D4D54
	Offset: 0x12F8
	Size: 0x1BC
	Parameters: 0
	Flags: Private
*/
function private function_d7c2965()
{
	self notify("7e0d5496ba6c674");
	self endon("7e0d5496ba6c674");
	player = getplayers()[0];
	player endon(#"death");
	globallogic_ui::function_cdbb5c49(1, 1);
	level.var_5be43b2d = 1;
	player val::set(#"hash_69a35e48bb13280c", "show_crosshair", 0);
	player val::set(#"hash_69a35e48bb13280c", "freezecontrols", 1);
	player val::set(#"hash_69a35e48bb13280c", "takedamage", 0);
	player val::set(#"hash_69a35e48bb13280c", "allowdeath", 0);
	player function_2be6e08d(1);
	if(gettime() - (isdefined(level.var_6ca9b5fe) ? level.var_6ca9b5fe : 0) < 3000)
	{
		wait(0.33);
	}
	globallogic_ui::function_760546ce();
	if(isdefined(player))
	{
		player stopanimscripted(undefined, 1);
	}
	checkpointrestart();
}

