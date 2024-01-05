#using script_18077945bb84ede7;
#using scripts\core_common\player\player_stats.gsc;
#using script_36f4be19da8eb6d0;
#using scripts\zm_common\zm_ui_inventory.gsc;
#using script_6fc2be37feeb317b;
#using script_7a5293d92c61c788;
#using script_3751b21462a54a7d;
#using script_4ccfb58a9443a60b;
#using scripts\zm_common\rat.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_turned.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_round_logic.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_player.gsc;
#using scripts\zm_common\zm_placeable_mine.gsc;
#using scripts\zm_common\zm_perks.gsc;
#using scripts\zm_common\zm_pack_a_punch_util.gsc;
#using scripts\zm_common\zm_melee_weapon.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\zm_common\zm_laststand.gsc;
#using scripts\zm_common\zm_equipment.gsc;
#using script_62caa307a394c18c;
#using scripts\zm_common\zm_characters.gsc;
#using scripts\zm_common\zm_behavior.gsc;
#using scripts\zm_common\zm_blockers.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\zm_common\util.gsc;
#using script_522aeb6ae906391e;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\ai\zombie_shared.gsc;
#using scripts\core_common\ai\zombie_death.gsc;
#using script_7f6cd71c43c45c57;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\rank_shared.gsc;
#using scripts\core_common\popups_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\item_inventory.gsc;
#using scripts\core_common\gestures.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\dev_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\bots\bot.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\aat_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace zm_devgui;

/*
	Name: __init__system__
	Namespace: zm_devgui
	Checksum: 0x5939C5A5
	Offset: 0x208
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	/#
		system::register(#"zm_devqui", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
	#/
}

/*
	Name: function_70a657d8
	Namespace: zm_devgui
	Checksum: 0x4CB693E5
	Offset: 0x260
	Size: 0x2AC
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	/#
		setdvar(#"zombie_devgui", "");
		setdvar(#"scr_force_weapon", "");
		setdvar(#"scr_zombie_dogs", 1);
		setdvar(#"scr_spawn_tesla", "");
		setdvar(#"scr_zombie_variant_type", -1);
		util::init_dvar(#"scr_zombie_spawn_in_view", 0, &function_f1be4492);
		level.devgui_add_weapon = &devgui_add_weapon;
		level.devgui_add_ability = &devgui_add_ability;
		if(!zm_utility::is_survival())
		{
			level.var_37778628 = &zombie_devgui_goto_round;
		}
		level thread zombie_devgui_think();
		thread zombie_weapon_devgui_think();
		thread function_3b534f9c();
		thread function_1e285ac2();
		thread devgui_zombie_healthbar();
		thread dev::devgui_test_chart_think();
		if(!isdefined(getdvar(#"scr_testscriptruntimeerror")))
		{
			setdvar(#"scr_testscriptruntimeerror", "");
		}
		level thread dev::body_customization_devgui(0);
		thread testscriptruntimeerror();
		callback::on_connect(&player_on_connect);
		add_custom_devgui_callback(&function_2f5772bf);
		spawner::add_ai_spawn_function(&function_a4eebdf3);
		thread init_debug_center_screen();
	#/
}

/*
	Name: function_8ac3bea9
	Namespace: zm_devgui
	Checksum: 0xF0A9DE20
	Offset: 0x518
	Size: 0xF4
	Parameters: 0
	Flags: Private
*/
function private function_8ac3bea9()
{
	/#
		level thread zombie_devgui_player_commands();
		level thread zombie_devgui_validation_commands();
		level thread function_358c899d();
		level thread function_5ac8947e();
		level thread function_8817dd98();
		level thread function_e9b89aac();
		level thread function_38184bf8();
		level thread function_b5d522f8();
		level thread function_300dfb68();
		level thread namespace_42457a0::function_5dbd7c2a();
	#/
}

/*
	Name: function_a4eebdf3
	Namespace: zm_devgui
	Checksum: 0x411F110E
	Offset: 0x618
	Size: 0x1A4
	Parameters: 0
	Flags: None
*/
function function_a4eebdf3()
{
	/#
		if(self.targetname !== "")
		{
			return;
		}
		if(self.archetype === #"zombie")
		{
			self.custom_location = &function_9960be00;
			self.start_inert = 1;
			var_c5de9c31 = 0;
			if(isdefined(self.spawn_funcs))
			{
				foreach(pair in self.spawn_funcs)
				{
					if(pair[#"function"] === (&zm_behavior::function_d63f6426))
					{
						var_c5de9c31 = 1;
						break;
					}
				}
			}
			self endon(#"death");
			if(!var_c5de9c31)
			{
				waittillframeend();
				self zm_behavior::function_d63f6426();
			}
		}
		if(is_true(level.var_2b46c827))
		{
			waittillframeend();
			self setentitypaused(1);
			level waittill(#"hash_39e4c9a17bf97f7d");
			self setentitypaused(0);
		}
	#/
}

/*
	Name: zombie_devgui_player_commands
	Namespace: zm_devgui
	Checksum: 0x1BCE6C5B
	Offset: 0x7C8
	Size: 0x8
	Parameters: 0
	Flags: None
*/
function zombie_devgui_player_commands()
{
	/#
	#/
}

/*
	Name: function_358c899d
	Namespace: zm_devgui
	Checksum: 0x35AAFE3C
	Offset: 0x7D8
	Size: 0x104
	Parameters: 0
	Flags: None
*/
function function_358c899d()
{
	/#
		test_scores = array(1, 10, 50, 100, 3500, 9999);
		i = 0;
		foreach(score in test_scores)
		{
			adddebugcommand(((((("" + score) + "") + i) + "") + score) + "");
			i++;
		}
	#/
}

/*
	Name: function_5ac8947e
	Namespace: zm_devgui
	Checksum: 0x3150455A
	Offset: 0x8E8
	Size: 0x208
	Parameters: 0
	Flags: None
*/
function function_5ac8947e()
{
	/#
		setdvar(#"zombie_devgui_hud", "");
		while(true)
		{
			cmd = getdvar(#"zombie_devgui_hud", "");
			if(cmd == "")
			{
				wait(0.1);
				continue;
			}
			if(strstartswith(cmd, ""))
			{
				str = strreplace(cmd, "", "");
				score = int(str);
				players = getplayers();
				foreach(player in players)
				{
					if(isplayer(player))
					{
						player luinotifyevent(#"score_event", 2, #"hash_60899927812586a1", score);
						break;
					}
				}
			}
			setdvar(#"zombie_devgui_hud", "");
		}
	#/
}

/*
	Name: player_on_connect
	Namespace: zm_devgui
	Checksum: 0x1CBC8B07
	Offset: 0xAF8
	Size: 0x44
	Parameters: 0
	Flags: None
*/
function player_on_connect()
{
	/#
		level flag::wait_till("");
		wait(1);
		if(isdefined(self))
		{
			zombie_devgui_player_menu(self);
		}
	#/
}

/*
	Name: zombie_devgui_player_menu_clear
	Namespace: zm_devgui
	Checksum: 0x538723E8
	Offset: 0xB48
	Size: 0x44
	Parameters: 1
	Flags: None
*/
function zombie_devgui_player_menu_clear(playername)
{
	/#
		rootclear = ("" + playername) + "";
		adddebugcommand(rootclear);
	#/
}

/*
	Name: function_c7dd7a17
	Namespace: zm_devgui
	Checksum: 0x1596C3D4
	Offset: 0xB98
	Size: 0xB4
	Parameters: 2
	Flags: None
*/
function function_c7dd7a17(archetype, var_9fde8624)
{
	/#
		if(!isdefined(var_9fde8624))
		{
			var_9fde8624 = "";
		}
		displayname = archetype;
		if(isdefined(var_9fde8624) && var_9fde8624 != "")
		{
			displayname = (displayname + "") + var_9fde8624;
		}
		adddebugcommand(((((("" + displayname) + "") + archetype) + "") + var_9fde8624) + "");
	#/
}

/*
	Name: function_2f5772bf
	Namespace: zm_devgui
	Checksum: 0xDF73532F
	Offset: 0xC58
	Size: 0x3B4
	Parameters: 1
	Flags: Private
*/
function private function_2f5772bf(cmd)
{
	/#
		if(strstartswith(cmd, ""))
		{
			player = level.players[0];
			direction = player getplayerangles();
			direction_vec = anglestoforward(direction);
			eye = player geteye();
			direction_vec = (direction_vec[0] * 8000, direction_vec[1] * 8000, direction_vec[2] * 8000);
			trace = bullettrace(eye, eye + direction_vec, 0, undefined);
			ai = undefined;
			ai_info = strreplace(cmd, "", "");
			ai_info = strtok(ai_info, "");
			aitype = ai_info[0];
			if(ai_info.size > 1)
			{
				var_9fde8624 = ai_info[1];
			}
			spawners = getspawnerarray();
			foreach(spawner in spawners)
			{
				if(isdefined(spawner.archetype) && spawner.archetype == aitype && (!isdefined(var_9fde8624) || (isdefined(spawner.var_9fde8624) && spawner.var_9fde8624 == var_9fde8624)))
				{
					ai_spawner = spawner;
					break;
				}
			}
			if(!isdefined(ai_spawner))
			{
				iprintln("" + aitype);
				return;
			}
			ai_spawner.script_forcespawn = 1;
			ai = zombie_utility::spawn_zombie(ai_spawner, undefined, ai_spawner);
			if(isdefined(ai))
			{
				if(ai.team != ai_spawner.team)
				{
					ai.team = ai_spawner.team;
				}
				wait(0.5);
				if(isvehicle(ai))
				{
					ai.origin = trace[#"position"];
					ai function_a57c34b7(trace[#"position"]);
				}
				else
				{
					ai forceteleport(trace[#"position"], player.angles + vectorscale((0, 1, 0), 180));
				}
			}
		}
	#/
}

/*
	Name: zombie_devgui_player_menu
	Namespace: zm_devgui
	Checksum: 0x1EE02ED8
	Offset: 0x1018
	Size: 0x544
	Parameters: 1
	Flags: None
*/
function zombie_devgui_player_menu(player)
{
	/#
		zombie_devgui_player_menu_clear(player.name);
		ip1 = player getentitynumber() + 1;
		adddebugcommand(((((("" + player.name) + "") + ip1) + "") + ip1) + "");
		adddebugcommand(((((("" + player.name) + "") + ip1) + "") + ip1) + "");
		adddebugcommand(((((("" + player.name) + "") + ip1) + "") + ip1) + "");
		adddebugcommand(((((("" + player.name) + "") + ip1) + "") + ip1) + "");
		adddebugcommand(((((("" + player.name) + "") + ip1) + "") + ip1) + "");
		adddebugcommand(((((("" + player.name) + "") + ip1) + "") + ip1) + "");
		adddebugcommand(((((("" + player.name) + "") + ip1) + "") + ip1) + "");
		adddebugcommand(((((("" + player.name) + "") + ip1) + "") + ip1) + "");
		adddebugcommand(((((("" + player.name) + "") + ip1) + "") + ip1) + "");
		adddebugcommand(((((("" + player.name) + "") + ip1) + "") + ip1) + "");
		adddebugcommand(((((("" + player.name) + "") + ip1) + "") + ip1) + "");
		adddebugcommand(((((("" + player.name) + "") + ip1) + "") + ip1) + "");
		adddebugcommand(((((("" + player.name) + "") + ip1) + "") + ip1) + "");
		adddebugcommand(((((("" + player.name) + "") + ip1) + "") + ip1) + "");
		adddebugcommand(((((("" + player.name) + "") + ip1) + "") + ip1) + "");
		if(isdefined(level.var_e2c54606))
		{
			level thread [[level.var_e2c54606]](player, ip1);
		}
		self thread zombie_devgui_player_menu_clear_on_disconnect(player);
	#/
}

/*
	Name: zombie_devgui_player_menu_clear_on_disconnect
	Namespace: zm_devgui
	Checksum: 0xB3E96537
	Offset: 0x1568
	Size: 0x54
	Parameters: 1
	Flags: None
*/
function zombie_devgui_player_menu_clear_on_disconnect(player)
{
	/#
		playername = player.name;
		player waittill(#"disconnect");
		zombie_devgui_player_menu_clear(playername);
	#/
}

/*
	Name: function_38184bf8
	Namespace: zm_devgui
	Checksum: 0x3286C317
	Offset: 0x15C8
	Size: 0x44A
	Parameters: 0
	Flags: None
*/
function function_38184bf8()
{
	/#
		while(true)
		{
			var_c635168c = getdvarint(#"hash_67d19b13a4ab8b94", 0);
			if(var_c635168c >= 0 && isdefined(level.zone_paths[var_c635168c]))
			{
				zone_paths = level.zone_paths[var_c635168c];
				foreach(var_375627f0, zone_path in zone_paths)
				{
					zone = level.zones[var_375627f0];
					print_origin = undefined;
					if(isdefined(zone.nodes[0]))
					{
						print_origin = zone.nodes[0].origin;
					}
					if(!isdefined(print_origin))
					{
						print_origin = zone.volumes[0].origin;
					}
					color = (1, 0, 0);
					if(zone_path.cost < 4)
					{
						color = (0, 1, 0);
					}
					else if(zone_path.cost < 8)
					{
						color = (1, 0.5, 0);
					}
					circle(print_origin, 30, color);
					print3d(print_origin, function_9e72a96(var_375627f0), color, 1, 0.5);
					print3d(print_origin + (vectorscale((0, 0, -1), 10)), "" + zone_path.cost, color, 1, 0.5);
					if(isdefined(zone_path.to_zone))
					{
						to_zone = level.zones[zone_path.to_zone];
						if(isdefined(to_zone.nodes[0]))
						{
							var_fbe06d06 = to_zone.nodes[0].origin;
						}
						if(!isdefined(var_fbe06d06))
						{
							var_fbe06d06 = to_zone.volumes[0].origin;
						}
						line(print_origin, var_fbe06d06, color, 0, 0);
					}
				}
				foreach(zone in level.zones)
				{
					if(!isdefined(zone_paths[zone_name]))
					{
						print_origin = undefined;
						if(isdefined(zone.nodes[0]))
						{
							print_origin = zone.nodes[0].origin;
						}
						if(!isdefined(print_origin))
						{
							print_origin = zone.volumes[0].origin;
						}
						print3d(print_origin, function_9e72a96(zone_name), (1, 0, 0), 1, 0.5);
						circle(print_origin, 30, (1, 0, 0));
						circle(print_origin, 35, (1, 0, 0));
						circle(print_origin, 40, (1, 0, 0));
					}
				}
			}
			waitframe(1);
		}
	#/
}

/*
	Name: function_300dfb68
	Namespace: zm_devgui
	Checksum: 0xC45320DB
	Offset: 0x1A20
	Size: 0x108
	Parameters: 0
	Flags: None
*/
function function_300dfb68()
{
	/#
		setdvar(#"hash_45632f9301da0179", "");
		adddebugcommand("");
		while(true)
		{
			cmd = getdvarstring(#"hash_45632f9301da0179");
			if(cmd != "")
			{
				switch(cmd)
				{
					case "teleport":
					{
						function_1ecbcf72();
						break;
					}
				}
				setdvar(#"hash_45632f9301da0179", "");
			}
			util::wait_network_frame();
		}
	#/
}

/*
	Name: function_1ecbcf72
	Namespace: zm_devgui
	Checksum: 0xBF890F75
	Offset: 0x1B30
	Size: 0x3C
	Parameters: 0
	Flags: None
*/
function function_1ecbcf72()
{
	/#
		params = {#is_dummy:1};
		rat::function_303319e9(params);
	#/
}

/*
	Name: zombie_devgui_validation_commands
	Namespace: zm_devgui
	Checksum: 0x86CC0C7E
	Offset: 0x1B78
	Size: 0x220
	Parameters: 0
	Flags: None
*/
function zombie_devgui_validation_commands()
{
	/#
		setdvar(#"validation_devgui_command", "");
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand("");
		while(true)
		{
			cmd = getdvarstring(#"validation_devgui_command");
			if(cmd != "")
			{
				switch(cmd)
				{
					case "structs":
					{
						thread bunker_entrance_zoned();
						break;
					}
					case "spawner":
					{
						zombie_spawner_validation();
						break;
					}
					case "zone_adj":
					{
						if(!isdefined(level.toggle_zone_adjacencies_validation))
						{
							level.toggle_zone_adjacencies_validation = 1;
						}
						else
						{
							level.toggle_zone_adjacencies_validation = !level.toggle_zone_adjacencies_validation;
						}
						thread zone_adjacencies_validation();
						break;
					}
					case "zone_paths":
					{
						break;
					}
					case "pathing":
					{
						thread zombie_pathing_validation();
					}
					default:
					{
						break;
					}
				}
				setdvar(#"validation_devgui_command", "");
			}
			util::wait_network_frame();
		}
	#/
}

/*
	Name: function_edce7be0
	Namespace: zm_devgui
	Checksum: 0x1EEF3965
	Offset: 0x1DA0
	Size: 0x1B2
	Parameters: 0
	Flags: None
*/
function function_edce7be0()
{
	/#
		spawners = getspawnerarray();
		var_26193d02 = [];
		foreach(spawner in spawners)
		{
			have_spawner = 0;
			foreach(unique_spawner in var_26193d02)
			{
				if(spawner.classname === unique_spawner.classname)
				{
					have_spawner = 1;
					break;
				}
			}
			if(have_spawner)
			{
				continue;
			}
			if(!isdefined(var_26193d02))
			{
				var_26193d02 = [];
			}
			else if(!isarray(var_26193d02))
			{
				var_26193d02 = array(var_26193d02);
			}
			if(!isinarray(var_26193d02, spawner))
			{
				var_26193d02[var_26193d02.size] = spawner;
			}
		}
		return var_26193d02;
	#/
}

/*
	Name: function_6758ede4
	Namespace: zm_devgui
	Checksum: 0x8464B99A
	Offset: 0x1F60
	Size: 0xE0
	Parameters: 1
	Flags: None
*/
function function_6758ede4(zone)
{
	/#
		if(isdefined(zone.nodes))
		{
			foreach(node in zone.nodes)
			{
				node_region = getnoderegion(node);
				if(!isdefined(node_region))
				{
					thread drawvalidation(node.origin, undefined, undefined, undefined, node);
				}
			}
		}
	#/
}

/*
	Name: function_995340b7
	Namespace: zm_devgui
	Checksum: 0x1E9A5D04
	Offset: 0x2048
	Size: 0x164
	Parameters: 2
	Flags: None
*/
function function_995340b7(zone, var_87f65b00)
{
	/#
		if(!isdefined(zone.a_loc_types[#"wait_location"]) || zone.a_loc_types[#"wait_location"].size <= 0)
		{
			if(is_true(var_87f65b00))
			{
				level.validation_errors_count++;
				if(isdefined(zone.nodes) && zone.nodes.size > 0)
				{
					origin = zone.nodes[0].origin + vectorscale((0, 0, 1), 32);
				}
				else
				{
					origin = zone.volumes[0].origin;
				}
				thread drawvalidation(origin, zone.name);
				println("" + zone.name);
				iprintlnbold("" + zone.name);
			}
			return false;
		}
		return true;
	#/
}

/*
	Name: function_1f0bc660
	Namespace: zm_devgui
	Checksum: 0xC308193B
	Offset: 0x21B8
	Size: 0x2E6
	Parameters: 4
	Flags: None
*/
function function_1f0bc660(zone, enemy, spawner, spawn_location)
{
	/#
		if(!isdefined(zone.a_loc_types[spawn_location]))
		{
			return enemy;
		}
		foreach(spawn_point in zone.a_loc_types[spawn_location])
		{
			if(!isdefined(enemy))
			{
				enemy = zombie_utility::spawn_zombie(spawner, spawner.targetname, spawn_point);
			}
			spawn_point_origin = spawn_point.origin;
			if(isdefined(spawn_point.script_string) && spawn_point.script_string != "")
			{
				spawn_point_origin = enemy validate_to_board(spawn_point, spawn_point_origin);
			}
			if(!ispointonnavmesh(spawn_point_origin, enemy getpathfindingradius() + 1))
			{
				new_spawn_point_origin = getclosestpointonnavmesh(spawn_point_origin, 64, enemy getpathfindingradius() + 1);
			}
			else
			{
				new_spawn_point_origin = spawn_point_origin;
			}
			var_d37fcf94 = isdefined(spawn_point.script_noteworthy) && !issubstr(spawn_point.script_noteworthy, "");
			if(is_true(var_d37fcf94) && !isdefined(new_spawn_point_origin) && !is_true(spawn_point.var_f0596bbb))
			{
				level.validation_errors_count++;
				thread drawvalidation(spawn_point_origin);
				println("" + spawn_point_origin);
				iprintlnbold("" + spawn_point_origin);
				spawn_point.var_f0596bbb = 1;
			}
			if(!isdefined(new_spawn_point_origin))
			{
				continue;
			}
			ispath = enemy validate_to_wait_point(zone, new_spawn_point_origin, spawn_point);
		}
		return enemy;
	#/
}

/*
	Name: zombie_spawner_validation
	Namespace: zm_devgui
	Checksum: 0xB44680B
	Offset: 0x24A8
	Size: 0x3B0
	Parameters: 0
	Flags: None
*/
function zombie_spawner_validation()
{
	/#
		level.validation_errors_count = 0;
		if(!isdefined(level.toggle_spawner_validation))
		{
			level.toggle_spawner_validation = 1;
			zombie_devgui_open_sesame();
			spawners = function_edce7be0();
			foreach(zone in level.zones)
			{
				function_6758ede4(zone);
				function_995340b7(zone, 1);
			}
			foreach(spawner in spawners)
			{
				if(!isdefined(spawner.aitype))
				{
					continue;
				}
				archetype = getarchetypefromclassname(spawner.aitype);
				if(!isdefined(archetype))
				{
					continue;
				}
				var_f41ab3f2 = spawner ai::function_9139c839().spawnlocations;
				if(!isdefined(var_f41ab3f2))
				{
					continue;
				}
				var_4d7c27e3 = 0;
				enemy = undefined;
				foreach(zone in level.zones)
				{
					if(!function_995340b7(zone))
					{
						continue;
					}
					foreach(var_37121713 in var_f41ab3f2)
					{
						enemy = function_1f0bc660(zone, enemy, spawner, var_37121713.spawnlocation);
						if(isdefined(enemy))
						{
							var_4d7c27e3 = 1;
						}
					}
				}
				if(!var_4d7c27e3)
				{
					iprintlnbold("" + spawner.aitype);
				}
			}
			println("" + level.validation_errors_count);
			iprintlnbold("" + level.validation_errors_count);
			level.validation_errors_count = undefined;
		}
		else
		{
			level.toggle_spawner_validation = !level.toggle_spawner_validation;
		}
	#/
}

/*
	Name: validate_to_board
	Namespace: zm_devgui
	Checksum: 0xBC08CA0
	Offset: 0x2860
	Size: 0x2A8
	Parameters: 2
	Flags: None
*/
function validate_to_board(spawn_point, spawn_point_origin_backup)
{
	/#
		for(j = 0; j < level.exterior_goals.size; j++)
		{
			if(isdefined(level.exterior_goals[j].script_string) && level.exterior_goals[j].script_string == spawn_point.script_string)
			{
				node = level.exterior_goals[j];
				break;
			}
		}
		if(isdefined(node))
		{
			ispath = self canpath(spawn_point.origin, node.origin);
			if(!ispath)
			{
				level.validation_errors_count++;
				thread drawvalidation(spawn_point_origin_backup, undefined, undefined, node.origin, undefined, self.archetype);
				if(isdefined(self.archetype))
				{
					println((((("" + function_9e72a96(self.archetype)) + "") + spawn_point_origin_backup) + "") + spawn_point.targetname);
					iprintlnbold((((("" + function_9e72a96(self.archetype)) + "") + spawn_point_origin_backup) + "") + spawn_point.targetname);
				}
				else
				{
					println((("" + spawn_point_origin_backup) + "") + spawn_point.targetname);
					iprintlnbold((("" + spawn_point_origin_backup) + "") + spawn_point.targetname);
				}
			}
			nodeforward = anglestoforward(node.angles);
			nodeforward = vectornormalize(nodeforward);
			spawn_point_origin = node.origin + (nodeforward * 100);
			return spawn_point_origin;
		}
		return spawn_point_origin_backup;
	#/
}

/*
	Name: validate_to_wait_point
	Namespace: zm_devgui
	Checksum: 0x34EFC416
	Offset: 0x2B18
	Size: 0x2AE
	Parameters: 3
	Flags: None
*/
function validate_to_wait_point(zone, new_spawn_point_origin, spawn_point)
{
	/#
		foreach(loc in zone.a_loc_types[#"wait_location"])
		{
			if(isdefined(loc))
			{
				wait_point = loc.origin;
				if(isdefined(wait_point))
				{
					new_wait_point = getclosestpointonnavmesh(wait_point, self getpathfindingradius(), 30);
					if(isdefined(new_spawn_point_origin) && isdefined(new_wait_point))
					{
						ispath = self findpath(new_spawn_point_origin, new_wait_point);
						if(ispath)
						{
							return true;
						}
						level.validation_errors_count++;
						thread drawvalidation(new_spawn_point_origin, undefined, new_wait_point, undefined, undefined, self.archetype);
						if(isdefined(self.archetype))
						{
							println((((("" + function_9e72a96(self.archetype)) + "") + new_spawn_point_origin) + "") + spawn_point.targetname);
							iprintlnbold((((("" + function_9e72a96(self.archetype)) + "") + new_spawn_point_origin) + "") + spawn_point.targetname);
						}
						else
						{
							println((("" + new_spawn_point_origin) + "") + spawn_point.targetname);
							iprintlnbold((("" + new_spawn_point_origin) + "") + spawn_point.targetname);
						}
						return false;
					}
				}
			}
		}
		return false;
	#/
}

/*
	Name: drawvalidation
	Namespace: zm_devgui
	Checksum: 0x239D02E9
	Offset: 0x2DD0
	Size: 0x44E
	Parameters: 6
	Flags: None
*/
function drawvalidation(origin, zone_name, nav_mesh_wait_point, boards_point, zone_node, archetype)
{
	/#
		if(!isdefined(zone_name))
		{
			zone_name = undefined;
		}
		if(!isdefined(nav_mesh_wait_point))
		{
			nav_mesh_wait_point = undefined;
		}
		if(!isdefined(boards_point))
		{
			boards_point = undefined;
		}
		if(!isdefined(zone_node))
		{
			zone_node = undefined;
		}
		if(!isdefined(archetype))
		{
			archetype = undefined;
		}
		if(isdefined(archetype))
		{
			archetype = function_9e72a96(archetype);
		}
		while(true)
		{
			if(is_true(level.toggle_spawner_validation))
			{
				if(!isdefined(origin))
				{
					break;
				}
				if(isdefined(zone_name))
				{
					circle(origin, 32, (1, 0, 0));
					print3d(origin, "" + zone_name, (1, 1, 1), 1, 0.5);
				}
				else
				{
					if(isdefined(nav_mesh_wait_point))
					{
						circle(origin, 32, (0, 0, 1));
						if(isdefined(archetype))
						{
							print3d(origin, (archetype + "") + origin, (1, 1, 1), 1, 0.5);
						}
						else
						{
							print3d(origin, "" + origin, (1, 1, 1), 1, 0.5);
						}
						line(origin, nav_mesh_wait_point, (1, 0, 0));
						circle(nav_mesh_wait_point, 32, (1, 0, 0));
						print3d(nav_mesh_wait_point, "" + nav_mesh_wait_point, (1, 1, 1), 1, 0.5);
					}
					else
					{
						if(isdefined(boards_point))
						{
							circle(origin, 32, (0, 0, 1));
							if(isdefined(archetype))
							{
								print3d(origin, (archetype + "") + origin, (1, 1, 1), 1, 0.5);
							}
							else
							{
								print3d(origin, "" + origin, (1, 1, 1), 1, 0.5);
							}
							line(origin, boards_point, (1, 0, 0));
							circle(boards_point, 32, (1, 0, 0));
							print3d(boards_point, "" + boards_point, (1, 1, 1), 1, 0.5);
						}
						else
						{
							if(isdefined(zone_node))
							{
								circle(origin, 32, (1, 0, 0));
								print3d(origin, ((("" + (isdefined(zone_node.targetname) ? zone_node.targetname : "")) + "") + origin) + "", (1, 1, 1), 1, 0.5);
							}
							else
							{
								circle(origin, 32, (0, 0, 1));
								print3d(origin, "" + origin, (1, 1, 1), 1, 0.5);
							}
						}
					}
				}
			}
			waitframe(1);
		}
	#/
}

/*
	Name: zone_adjacencies_validation
	Namespace: zm_devgui
	Checksum: 0xF94E0C4F
	Offset: 0x3228
	Size: 0x2DA
	Parameters: 0
	Flags: None
*/
function zone_adjacencies_validation()
{
	/#
		zombie_devgui_open_sesame();
		while(true)
		{
			if(is_true(level.toggle_zone_adjacencies_validation))
			{
				if(!isdefined(getplayers()[0].zone_name))
				{
					waitframe(1);
					continue;
				}
				str_zone = getplayers()[0].zone_name;
				keys = getarraykeys(level.zones);
				offset = 0;
				foreach(key in keys)
				{
					if(key === str_zone)
					{
						draw_zone_adjacencies_validation(level.zones[key], 2, key);
						continue;
					}
					if(isdefined(level.zones[str_zone].adjacent_zones[key]))
					{
						if(level.zones[str_zone].adjacent_zones[key].is_connected)
						{
							offset = offset + 10;
							draw_zone_adjacencies_validation(level.zones[key], 1, key, level.zones[str_zone], offset);
						}
						else
						{
							draw_zone_adjacencies_validation(level.zones[key], 0, key);
						}
						continue;
					}
					draw_zone_adjacencies_validation(level.zones[key], 0, key);
				}
				foreach(zone in level.zones)
				{
					function_f4669d7b(level.zones, zone);
				}
			}
			waitframe(1);
		}
	#/
}

/*
	Name: draw_zone_adjacencies_validation
	Namespace: zm_devgui
	Checksum: 0xB3BA5AA4
	Offset: 0x3510
	Size: 0x27C
	Parameters: 5
	Flags: None
*/
function draw_zone_adjacencies_validation(zone, status, name, current_zone, offset)
{
	/#
		if(!isdefined(current_zone))
		{
			current_zone = undefined;
		}
		if(!isdefined(offset))
		{
			offset = 0;
		}
		if(!isdefined(zone.volumes[0]) && !isdefined(zone.nodes[0]))
		{
			return;
		}
		if(isdefined(zone.nodes[0]))
		{
			print_origin = zone.nodes[0].origin;
		}
		if(!isdefined(print_origin))
		{
			print_origin = zone.volumes[0].origin;
		}
		if(status == 2)
		{
			circle(print_origin, 30, (0, 1, 0));
			print3d(print_origin, function_9e72a96(name), (0, 1, 0), 1, 0.5);
		}
		else
		{
			if(status == 1)
			{
				circle(print_origin, 30, (0, 0, 1));
				print3d(print_origin, function_9e72a96(name), (0, 0, 1), 1, 0.5);
				if(isdefined(current_zone.nodes[0]))
				{
					print_origin = current_zone.nodes[0].origin;
				}
				if(!isdefined(print_origin))
				{
					print_origin = current_zone.volumes[0].origin;
				}
				print3d(print_origin + (0, 20, offset * -1), function_9e72a96(name), (0, 0, 1), 1, 0.5);
			}
			else
			{
				circle(print_origin, 30, (1, 0, 0));
				print3d(print_origin, function_9e72a96(name), (1, 0, 0), 1, 0.5);
			}
		}
	#/
}

/*
	Name: function_f4669d7b
	Namespace: zm_devgui
	Checksum: 0x7E3D58BD
	Offset: 0x3798
	Size: 0x1D0
	Parameters: 2
	Flags: None
*/
function function_f4669d7b(zones, zone)
{
	/#
		if(!isdefined(zone.volumes[0]) && !isdefined(zone.nodes[0]))
		{
			return;
		}
		if(isdefined(zone.nodes[0]))
		{
			origin = zone.nodes[0].origin;
		}
		if(!isdefined(origin))
		{
			origin = zone.volumes[0].origin;
		}
		foreach(adjacent in zone.adjacent_zones)
		{
			adjacent_zone = zones[var_4c973d00];
			if(adjacent_zone.nodes.size && isdefined(adjacent_zone.nodes[0].origin))
			{
				var_16c82636 = adjacent_zone.nodes[0].origin;
			}
			if(!isdefined(var_16c82636))
			{
				var_16c82636 = adjacent_zone.volumes[0].origin;
			}
			if(adjacent.is_connected)
			{
				line(origin, var_16c82636, (0, 1, 0), 0, 0);
				continue;
			}
			line(origin, var_16c82636, (1, 0, 0), 0, 0);
		}
	#/
}

/*
	Name: zombie_pathing_validation
	Namespace: zm_devgui
	Checksum: 0xDD8857FF
	Offset: 0x3970
	Size: 0x142
	Parameters: 0
	Flags: None
*/
function zombie_pathing_validation()
{
	/#
		if(!isdefined(level.zombie_spawners[0]))
		{
			return;
		}
		if(!isdefined(level.zombie_pathing_validation))
		{
			level.zombie_pathing_validation = 1;
		}
		zombie_devgui_open_sesame();
		setdvar(#"zombie_default_max", 0);
		zombie_devgui_goto_round(20);
		wait(2);
		spawner = level.zombie_spawners[0];
		slums_station = (808, -1856, 544);
		enemy = zombie_utility::spawn_zombie(spawner, spawner.targetname);
		wait(1);
		while(isdefined(enemy) && enemy.completed_emerging_into_playable_area !== 1)
		{
			waitframe(1);
		}
		if(isdefined(enemy))
		{
			enemy forceteleport(slums_station);
			enemy.b_ignore_cleanup = 1;
		}
	#/
}

/*
	Name: function_bcc8843e
	Namespace: zm_devgui
	Checksum: 0xB96A7E13
	Offset: 0x3AC0
	Size: 0xF4
	Parameters: 3
	Flags: None
*/
function function_bcc8843e(weapon_name, up, root)
{
	/#
		util::waittill_can_add_debug_command();
		rootslash = "";
		if(isdefined(root) && root.size)
		{
			rootslash = root + "";
		}
		uppath = "" + up;
		if(up.size < 1)
		{
			uppath = "";
		}
		cmd = ((((("" + rootslash) + weapon_name) + uppath) + "") + weapon_name) + "";
		adddebugcommand(cmd);
	#/
}

/*
	Name: devgui_add_weapon_entry
	Namespace: zm_devgui
	Checksum: 0x683817B7
	Offset: 0x3BC0
	Size: 0x274
	Parameters: 3
	Flags: None
*/
function devgui_add_weapon_entry(weapon, root, n_order)
{
	/#
		weapon_name = function_a16a090d(weapon);
		if(isdefined(root) && root.size)
		{
			adddebugcommand(((((((("" + root) + "") + n_order) + "") + weapon_name) + "") + weapon_name) + "");
		}
		else
		{
			if(getdvarint(#"zm_debug_attachments", 0))
			{
				var_876795bf = weapon.supportedattachments;
				weapon_root = ("" + weapon_name) + "";
				adddebugcommand((((weapon_root + weapon_name) + "") + weapon_name) + "");
				foreach(var_96bc131f in var_876795bf)
				{
					if(var_96bc131f != "" && var_96bc131f != "")
					{
						util::waittill_can_add_debug_command();
						var_29c3a74d = (weapon_name + "") + var_96bc131f;
						adddebugcommand((((weapon_root + var_29c3a74d) + "") + var_29c3a74d) + "");
					}
				}
			}
			else
			{
				adddebugcommand(((("" + weapon_name) + "") + weapon_name) + "");
			}
		}
	#/
}

/*
	Name: devgui_add_weapon
	Namespace: zm_devgui
	Checksum: 0xC9AE8456
	Offset: 0x3E40
	Size: 0x18C
	Parameters: 7
	Flags: None
*/
function devgui_add_weapon(weapon, upgrade, in_box, cost, weaponvo, weaponvoresp, ammo_cost)
{
	/#
		level endon(#"game_ended");
		if(ammo_cost)
		{
			level thread function_bcc8843e(function_a16a090d(weaponvoresp), "", "");
		}
		util::waittill_can_add_debug_command();
		if(zm_loadout::is_offhand_weapon(weaponvoresp) && !zm_loadout::is_melee_weapon(weaponvoresp))
		{
			devgui_add_weapon_entry(weaponvoresp, "", 2);
		}
		else
		{
			if(zm_loadout::is_melee_weapon(weaponvoresp))
			{
				devgui_add_weapon_entry(weaponvoresp, "", 3);
			}
			else
			{
				if(zm_weapons::is_wonder_weapon(weaponvoresp))
				{
					devgui_add_weapon_entry(weaponvoresp, "", 5);
				}
				else
				{
					devgui_add_weapon_entry(weaponvoresp, "", 6);
				}
			}
		}
	#/
}

/*
	Name: function_3b534f9c
	Namespace: zm_devgui
	Checksum: 0x9DA3D441
	Offset: 0x3FD8
	Size: 0x348
	Parameters: 0
	Flags: None
*/
function function_3b534f9c()
{
	/#
		level.zombie_devgui_gun = getdvarstring(#"hash_1c9225f4f6e82068");
		for(;;)
		{
			wait(0.1);
			cmd = getdvarstring(#"hash_1c9225f4f6e82068");
			if(isdefined(cmd) && cmd.size > 0)
			{
				level.zombie_devgui_gun = cmd;
				players = getplayers();
				if(players.size >= 1)
				{
					players[0] thread zombie_devgui_weapon_give(level.zombie_devgui_gun);
				}
				setdvar(#"hash_1c9225f4f6e82068", "");
			}
			wait(0.1);
			cmd = getdvarstring(#"hash_1c9228f4f6e82581");
			if(isdefined(cmd) && cmd.size > 0)
			{
				level.zombie_devgui_gun = cmd;
				players = getplayers();
				if(players.size >= 2)
				{
					players[1] thread zombie_devgui_weapon_give(level.zombie_devgui_gun);
				}
				setdvar(#"hash_1c9228f4f6e82581", "");
			}
			wait(0.1);
			cmd = getdvarstring(#"hash_1c9227f4f6e823ce");
			if(isdefined(cmd) && cmd.size > 0)
			{
				level.zombie_devgui_gun = cmd;
				players = getplayers();
				if(players.size >= 3)
				{
					players[2] thread zombie_devgui_weapon_give(level.zombie_devgui_gun);
				}
				setdvar(#"hash_1c9227f4f6e823ce", "");
			}
			wait(0.1);
			cmd = getdvarstring(#"hash_1c922af4f6e828e7");
			if(isdefined(cmd) && cmd.size > 0)
			{
				level.zombie_devgui_gun = cmd;
				players = getplayers();
				if(players.size >= 4)
				{
					players[3] thread zombie_devgui_weapon_give(level.zombie_devgui_gun);
				}
				setdvar(#"hash_1c922af4f6e828e7", "");
			}
		}
	#/
}

/*
	Name: zombie_weapon_devgui_think
	Namespace: zm_devgui
	Checksum: 0xC6160C43
	Offset: 0x4328
	Size: 0xF0
	Parameters: 0
	Flags: None
*/
function zombie_weapon_devgui_think()
{
	/#
		level.zombie_devgui_gun = getdvarstring(#"zombie_devgui_gun");
		for(;;)
		{
			wait(0.25);
			cmd = getdvarstring(#"zombie_devgui_gun");
			if(isdefined(cmd) && cmd.size > 0)
			{
				level.zombie_devgui_gun = cmd;
				array::thread_all(getplayers(), &zombie_devgui_weapon_give, level.zombie_devgui_gun);
				setdvar(#"zombie_devgui_gun", "");
			}
		}
	#/
}

/*
	Name: zombie_devgui_weapon_give
	Namespace: zm_devgui
	Checksum: 0xCAFB3DA2
	Offset: 0x4420
	Size: 0x214
	Parameters: 1
	Flags: None
*/
function zombie_devgui_weapon_give(weapon_name)
{
	/#
		split = strtok(function_9e72a96(weapon_name), "");
		switch(split.size)
		{
			case 1:
			default:
			{
				weapon = getweapon(split[0]);
				break;
			}
			case 2:
			{
				weapon = getweapon(split[0], split[1]);
				break;
			}
			case 3:
			{
				weapon = getweapon(split[0], split[1], split[2]);
				break;
			}
			case 4:
			{
				weapon = getweapon(split[0], split[1], split[2], split[3]);
				break;
			}
			case 5:
			{
				weapon = getweapon(split[0], split[1], split[2], split[3], split[4]);
				break;
			}
		}
		if(zm_loadout::is_melee_weapon(weapon) && isdefined(zm_melee_weapon::find_melee_weapon(weapon)))
		{
			self zm_melee_weapon::award_melee_weapon(weapon_name);
		}
		else
		{
			self function_2d4d7fd9(weapon);
		}
	#/
}

/*
	Name: function_2d4d7fd9
	Namespace: zm_devgui
	Checksum: 0x3C96A788
	Offset: 0x4640
	Size: 0x74
	Parameters: 1
	Flags: None
*/
function function_2d4d7fd9(weapon)
{
	/#
		if(self hasweapon(weapon, 1))
		{
			self zm_weapons::weapon_take(weapon);
		}
		self thread function_bb54e671(weapon);
		self zm_weapons::weapon_give(weapon);
	#/
}

/*
	Name: function_bb54e671
	Namespace: zm_devgui
	Checksum: 0x250B2558
	Offset: 0x46C0
	Size: 0x184
	Parameters: 1
	Flags: None
*/
function function_bb54e671(weapon)
{
	/#
		self notify(#"hash_7c6363440c125d8b");
		self endon(#"disconnect", #"hash_7c6363440c125d8b");
		if(!isdefined(self.var_8d5839f4))
		{
			self.var_8d5839f4 = [];
		}
		else if(!isarray(self.var_8d5839f4))
		{
			self.var_8d5839f4 = array(self.var_8d5839f4);
		}
		self.var_8d5839f4[self.var_8d5839f4.size] = weapon;
		while(true)
		{
			self waittill(#"weapon_change_complete");
			foreach(weapon in arraycopy(self.var_8d5839f4))
			{
				if(!self hasweapon(weapon))
				{
					arrayremovevalue(self.var_8d5839f4, weapon);
				}
			}
		}
	#/
}

/*
	Name: devgui_add_ability
	Namespace: zm_devgui
	Checksum: 0x942CD4D5
	Offset: 0x4850
	Size: 0x164
	Parameters: 5
	Flags: None
*/
function devgui_add_ability(name, upgrade_active_func, stat_name, stat_desired_value, game_end_reset_if_not_achieved)
{
	/#
		online_game = sessionmodeisonlinegame();
		if(!online_game)
		{
			return;
		}
		if(!is_true(level.devgui_watch_abilities))
		{
			cmd = "";
			adddebugcommand(cmd);
			cmd = "";
			adddebugcommand(cmd);
			level thread zombie_ability_devgui_think();
			level.devgui_watch_abilities = 1;
		}
		cmd = ((("" + game_end_reset_if_not_achieved) + "") + game_end_reset_if_not_achieved) + "";
		adddebugcommand(cmd);
		cmd = ((("" + game_end_reset_if_not_achieved) + "") + game_end_reset_if_not_achieved) + "";
		adddebugcommand(cmd);
	#/
}

/*
	Name: zombie_devgui_ability_give
	Namespace: zm_devgui
	Checksum: 0xA320F7E8
	Offset: 0x49C0
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function zombie_devgui_ability_give(name)
{
	/#
	#/
}

/*
	Name: zombie_devgui_ability_take
	Namespace: zm_devgui
	Checksum: 0xAF6B40ED
	Offset: 0x49D8
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function zombie_devgui_ability_take(name)
{
	/#
	#/
}

/*
	Name: zombie_ability_devgui_think
	Namespace: zm_devgui
	Checksum: 0x3263319C
	Offset: 0x49F0
	Size: 0x200
	Parameters: 0
	Flags: None
*/
function zombie_ability_devgui_think()
{
	/#
		level.zombie_devgui_give_ability = getdvarstring(#"zombie_devgui_give_ability");
		level.zombie_devgui_take_ability = getdvarstring(#"zombie_devgui_take_ability");
		for(;;)
		{
			wait(0.25);
			cmd = getdvarstring(#"zombie_devgui_give_ability");
			if(!isdefined(level.zombie_devgui_give_ability) || level.zombie_devgui_give_ability != cmd)
			{
				if(cmd == "")
				{
					level flag::set("");
				}
				else
				{
					if(cmd == "")
					{
						level flag::clear("");
					}
					else
					{
						level.zombie_devgui_give_ability = cmd;
						array::thread_all(getplayers(), &zombie_devgui_ability_give, level.zombie_devgui_give_ability);
					}
				}
			}
			wait(0.25);
			cmd = getdvarstring(#"zombie_devgui_take_ability");
			if(!isdefined(level.zombie_devgui_take_ability) || level.zombie_devgui_take_ability != cmd)
			{
				level.zombie_devgui_take_ability = cmd;
				array::thread_all(getplayers(), &zombie_devgui_ability_take, level.zombie_devgui_take_ability);
			}
		}
	#/
}

/*
	Name: zombie_healthbar
	Namespace: zm_devgui
	Checksum: 0x99DA771A
	Offset: 0x4BF8
	Size: 0xEC
	Parameters: 2
	Flags: None
*/
function zombie_healthbar(pos, dsquared)
{
	/#
		if(distancesquared(pos, self.origin) > dsquared)
		{
			return;
		}
		rate = 1;
		if(isdefined(self.maxhealth))
		{
			rate = self.health / self.maxhealth;
		}
		color = (1 - rate, rate, 0);
		text = "" + int(self.health);
		print3d(self.origin + (0, 0, 0), text, color, 1, 0.5, 1);
	#/
}

/*
	Name: devgui_zombie_healthbar
	Namespace: zm_devgui
	Checksum: 0x462818C4
	Offset: 0x4CF0
	Size: 0x13A
	Parameters: 0
	Flags: None
*/
function devgui_zombie_healthbar()
{
	/#
		while(true)
		{
			if(getdvarint(#"scr_zombie_healthbars", 0) == 1)
			{
				e_player = getplayers()[0];
				if(isalive(e_player))
				{
					a_ai_zombies = getaispeciesarray("", "");
					foreach(ai_zombie in a_ai_zombies)
					{
						ai_zombie zombie_healthbar(e_player.origin, 360000);
					}
				}
			}
			waitframe(1);
		}
	#/
}

/*
	Name: zombie_devgui_watch_input
	Namespace: zm_devgui
	Checksum: 0x46F787B4
	Offset: 0x4E38
	Size: 0x7C
	Parameters: 0
	Flags: None
*/
function zombie_devgui_watch_input()
{
	/#
		level flag::wait_till("");
		wait(1);
		players = getplayers();
		for(i = 0; i < players.size; i++)
		{
			players[i] thread watch_debug_input();
		}
	#/
}

/*
	Name: damage_player
	Namespace: zm_devgui
	Checksum: 0x36F59A9F
	Offset: 0x4EC0
	Size: 0x5C
	Parameters: 0
	Flags: None
*/
function damage_player()
{
	/#
		self val::set(#"damage_player", "", 1);
		self dodamage(self.health / 2, self.origin);
	#/
}

/*
	Name: kill_player
	Namespace: zm_devgui
	Checksum: 0x44273453
	Offset: 0x4F28
	Size: 0xB4
	Parameters: 0
	Flags: None
*/
function kill_player()
{
	/#
		self val::set(#"kill_player", "", 1);
		death_from = (randomfloatrange(-20, 20), randomfloatrange(-20, 20), randomfloatrange(-20, 20));
		self dodamage(self.health + 666, self.origin + death_from);
	#/
}

/*
	Name: force_drink
	Namespace: zm_devgui
	Checksum: 0x1ED082BC
	Offset: 0x4FE8
	Size: 0x6C
	Parameters: 0
	Flags: None
*/
function force_drink()
{
	/#
		wait(0.01);
		build_weapon = getweapon(#"zombie_builder");
		self thread gestures::function_f3e2696f(self, build_weapon, undefined, 2.5, undefined, undefined, undefined);
	#/
}

/*
	Name: zombie_devgui_dpad_none
	Namespace: zm_devgui
	Checksum: 0x6C2D370B
	Offset: 0x5060
	Size: 0x1C
	Parameters: 0
	Flags: None
*/
function zombie_devgui_dpad_none()
{
	/#
		self thread watch_debug_input();
	#/
}

/*
	Name: zombie_devgui_dpad_death
	Namespace: zm_devgui
	Checksum: 0x71F5C690
	Offset: 0x5088
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function zombie_devgui_dpad_death()
{
	/#
		self thread watch_debug_input(&kill_player);
	#/
}

/*
	Name: zombie_devgui_dpad_damage
	Namespace: zm_devgui
	Checksum: 0xAF714441
	Offset: 0x50C0
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function zombie_devgui_dpad_damage()
{
	/#
		self thread watch_debug_input(&damage_player);
	#/
}

/*
	Name: zombie_devgui_dpad_changeweapon
	Namespace: zm_devgui
	Checksum: 0x4B60197F
	Offset: 0x50F8
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function zombie_devgui_dpad_changeweapon()
{
	/#
		self thread watch_debug_input(&force_drink);
	#/
}

/*
	Name: watch_debug_input
	Namespace: zm_devgui
	Checksum: 0xC23E4256
	Offset: 0x5130
	Size: 0xC2
	Parameters: 1
	Flags: None
*/
function watch_debug_input(callback)
{
	/#
		self endon(#"disconnect");
		self notify(#"watch_debug_input");
		self endon(#"watch_debug_input");
		level.devgui_dpad_watch = 0;
		if(isdefined(callback))
		{
			level.devgui_dpad_watch = 1;
			for(;;)
			{
				if(self actionslottwobuttonpressed())
				{
					self thread [[callback]]();
					while(self actionslottwobuttonpressed())
					{
						waitframe(1);
					}
				}
				waitframe(1);
			}
		}
	#/
}

/*
	Name: zombie_devgui_think
	Namespace: zm_devgui
	Checksum: 0xBB2CADE4
	Offset: 0x5200
	Size: 0x2ED0
	Parameters: 0
	Flags: None
*/
function zombie_devgui_think()
{
	/#
		level notify(#"zombie_devgui_think");
		level endon(#"zombie_devgui_think");
		for(;;)
		{
			cmd = getdvarstring(#"zombie_devgui");
			switch(cmd)
			{
				case "money":
				{
					players = getplayers();
					array::thread_all(players, &zombie_devgui_give_money);
					break;
				}
				case "scrap":
				{
					players = getplayers();
					array::thread_all(players, &function_6de15bb7);
					break;
				}
				case "player1_money":
				{
					players = getplayers();
					if(players.size >= 1)
					{
						players[0] thread zombie_devgui_give_money();
					}
					break;
				}
				case "player2_money":
				{
					players = getplayers();
					if(players.size >= 2)
					{
						players[1] thread zombie_devgui_give_money();
					}
					break;
				}
				case "player3_money":
				{
					players = getplayers();
					if(players.size >= 3)
					{
						players[2] thread zombie_devgui_give_money();
					}
					break;
				}
				case "player4_money":
				{
					players = getplayers();
					if(players.size >= 4)
					{
						players[3] thread zombie_devgui_give_money();
					}
					break;
				}
				case "moneydown":
				{
					players = getplayers();
					array::thread_all(players, &zombie_devgui_take_money);
					break;
				}
				case "player1_moneydown":
				{
					players = getplayers();
					if(players.size >= 1)
					{
						players[0] thread zombie_devgui_take_money();
					}
					break;
				}
				case "player2_moneydown":
				{
					players = getplayers();
					if(players.size >= 2)
					{
						players[1] thread zombie_devgui_take_money();
					}
					break;
				}
				case "player3_moneydown":
				{
					players = getplayers();
					if(players.size >= 3)
					{
						players[2] thread zombie_devgui_take_money();
					}
					break;
				}
				case "player4_moneydown":
				{
					players = getplayers();
					if(players.size >= 4)
					{
						players[3] thread zombie_devgui_take_money();
					}
					break;
				}
				case "ammodown":
				{
					players = getplayers();
					array::thread_all(players, &function_dc7312be);
					break;
				}
				case "hash_428dbd0a89fc5d32":
				{
					players = getplayers();
					if(players.size >= 1)
					{
						players[0] thread function_dc7312be();
					}
					break;
				}
				case "hash_119220b211e16ba9":
				{
					players = getplayers();
					if(players.size >= 2)
					{
						players[1] thread function_dc7312be();
					}
					break;
				}
				case "hash_6cdf097974c7bcd0":
				{
					players = getplayers();
					if(players.size >= 3)
					{
						players[2] thread function_dc7312be();
					}
					break;
				}
				case "hash_5e281497ef267e37":
				{
					players = getplayers();
					if(players.size >= 4)
					{
						players[3] thread function_dc7312be();
					}
					break;
				}
				case "hash_59a96f9816430398":
				{
					players = getplayers();
					if(players.size >= 1)
					{
						players[0] thread zombie_devgui_give_xp(1000);
					}
					break;
				}
				case "hash_423b4f1fbe6391dd":
				{
					players = getplayers();
					if(players.size >= 2)
					{
						players[1] thread zombie_devgui_give_xp(1000);
					}
					break;
				}
				case "hash_50580bf75ed9e65e":
				{
					players = getplayers();
					if(players.size >= 3)
					{
						players[2] thread zombie_devgui_give_xp(1000);
					}
					break;
				}
				case "hash_4e18caaf131ec443":
				{
					players = getplayers();
					if(players.size >= 4)
					{
						players[3] thread zombie_devgui_give_xp(1000);
					}
					break;
				}
				case "hash_1dec476dd3df3678":
				{
					players = getplayers();
					if(players.size >= 1)
					{
						players[0] thread zombie_devgui_give_xp(10000);
					}
					break;
				}
				case "hash_6e595ff08330f5b7":
				{
					players = getplayers();
					if(players.size >= 2)
					{
						players[1] thread zombie_devgui_give_xp(10000);
					}
					break;
				}
				case "hash_5f82c3562c428cea":
				{
					players = getplayers();
					if(players.size >= 3)
					{
						players[2] thread zombie_devgui_give_xp(10000);
					}
					break;
				}
				case "hash_52e4da7d7d47cf69":
				{
					players = getplayers();
					if(players.size >= 4)
					{
						players[3] thread zombie_devgui_give_xp(10000);
					}
					break;
				}
				case "health":
				{
					array::thread_all(getplayers(), &zombie_devgui_give_health);
					break;
				}
				case "player1_health":
				{
					players = getplayers();
					if(players.size >= 1)
					{
						players[0] thread zombie_devgui_give_health();
					}
					break;
				}
				case "player2_health":
				{
					players = getplayers();
					if(players.size >= 2)
					{
						players[1] thread zombie_devgui_give_health();
					}
					break;
				}
				case "player3_health":
				{
					players = getplayers();
					if(players.size >= 3)
					{
						players[2] thread zombie_devgui_give_health();
					}
					break;
				}
				case "player4_health":
				{
					players = getplayers();
					if(players.size >= 4)
					{
						players[3] thread zombie_devgui_give_health();
					}
					break;
				}
				case "minhealth":
				{
					array::thread_all(getplayers(), &zombie_devgui_low_health);
					break;
				}
				case "player1_minhealth":
				{
					players = getplayers();
					if(players.size >= 1)
					{
						players[0] thread zombie_devgui_low_health();
					}
					break;
				}
				case "player2_minhealth":
				{
					players = getplayers();
					if(players.size >= 2)
					{
						players[1] thread zombie_devgui_low_health();
					}
					break;
				}
				case "player3_minhealth":
				{
					players = getplayers();
					if(players.size >= 3)
					{
						players[2] thread zombie_devgui_low_health();
					}
					break;
				}
				case "player4_minhealth":
				{
					players = getplayers();
					if(players.size >= 4)
					{
						players[3] thread zombie_devgui_low_health();
					}
					break;
				}
				case "ammo":
				{
					array::thread_all(getplayers(), &zombie_devgui_toggle_ammo);
					break;
				}
				case "ignore":
				{
					array::thread_all(getplayers(), &zombie_devgui_toggle_ignore);
					break;
				}
				case "player1_ignore":
				{
					players = getplayers();
					if(players.size >= 1)
					{
						players[0] thread zombie_devgui_toggle_ignore();
					}
					break;
				}
				case "player2_ignore":
				{
					players = getplayers();
					if(players.size >= 2)
					{
						players[1] thread zombie_devgui_toggle_ignore();
					}
					break;
				}
				case "player3_ignore":
				{
					players = getplayers();
					if(players.size >= 3)
					{
						players[2] thread zombie_devgui_toggle_ignore();
					}
					break;
				}
				case "player4_ignore":
				{
					players = getplayers();
					if(players.size >= 4)
					{
						players[3] thread zombie_devgui_toggle_ignore();
					}
					break;
				}
				case "invul_on":
				{
					zombie_devgui_invulnerable(undefined, 1);
					break;
				}
				case "invul_off":
				{
					zombie_devgui_invulnerable(undefined, 0);
					break;
				}
				case "player1_invul_on":
				{
					zombie_devgui_invulnerable(0, 1);
					break;
				}
				case "player1_invul_off":
				{
					zombie_devgui_invulnerable(0, 0);
					break;
				}
				case "player2_invul_on":
				{
					zombie_devgui_invulnerable(1, 1);
					break;
				}
				case "player2_invul_off":
				{
					zombie_devgui_invulnerable(1, 0);
					break;
				}
				case "player3_invul_on":
				{
					zombie_devgui_invulnerable(2, 1);
					break;
				}
				case "player3_invul_off":
				{
					zombie_devgui_invulnerable(2, 0);
					break;
				}
				case "player4_invul_on":
				{
					zombie_devgui_invulnerable(3, 1);
					break;
				}
				case "player4_invul_off":
				{
					zombie_devgui_invulnerable(3, 0);
					break;
				}
				case "revive_all":
				{
					array::thread_all(getplayers(), &zombie_devgui_revive);
					break;
				}
				case "player1_revive":
				{
					players = getplayers();
					if(players.size >= 1)
					{
						players[0] thread zombie_devgui_revive();
					}
					break;
				}
				case "player2_revive":
				{
					players = getplayers();
					if(players.size >= 2)
					{
						players[1] thread zombie_devgui_revive();
					}
					break;
				}
				case "player3_revive":
				{
					players = getplayers();
					if(players.size >= 3)
					{
						players[2] thread zombie_devgui_revive();
					}
					break;
				}
				case "player4_revive":
				{
					players = getplayers();
					if(players.size >= 4)
					{
						players[3] thread zombie_devgui_revive();
					}
					break;
				}
				case "player1_kill":
				{
					players = getplayers();
					if(players.size >= 1)
					{
						players[0] thread zombie_devgui_kill();
					}
					break;
				}
				case "player2_kill":
				{
					players = getplayers();
					if(players.size >= 2)
					{
						players[1] thread zombie_devgui_kill();
					}
					break;
				}
				case "player3_kill":
				{
					players = getplayers();
					if(players.size >= 3)
					{
						players[2] thread zombie_devgui_kill();
					}
					break;
				}
				case "player4_kill":
				{
					players = getplayers();
					if(players.size >= 4)
					{
						players[3] thread zombie_devgui_kill();
					}
					break;
				}
				case "hash_7f4d70c7ded8e94a":
				{
					if(zm_utility::get_story() === 2)
					{
						array::random(getplayers()) giveweapon(getweapon(#"homunculus"));
					}
					array::thread_all(getplayers(), &function_8d799ebd);
					break;
				}
				case "hash_505efa1825e2cb99":
				{
					players = getplayers();
					if(players.size >= 1)
					{
						players[0] thread function_8d799ebd();
					}
					break;
				}
				case "hash_15233852e3dc3500":
				{
					players = getplayers();
					if(players.size >= 2)
					{
						players[1] thread function_8d799ebd();
					}
					break;
				}
				case "hash_5cb5edc4858d92f7":
				{
					players = getplayers();
					if(players.size >= 3)
					{
						players[2] thread function_8d799ebd();
					}
					break;
				}
				case "hash_6d57ff86c541a5fe":
				{
					players = getplayers();
					if(players.size >= 4)
					{
						players[3] thread function_8d799ebd();
					}
					break;
				}
				case "hash_2c320318aed843b2":
				{
					array::thread_all(getplayers(), &zm_laststand::function_3d685b5f, 100);
					break;
				}
				case "hash_72783b08840a3ab7":
				{
					players = getplayers();
					if(players.size >= 1)
					{
						players[0] thread zm_laststand::function_3d685b5f(100);
					}
					break;
				}
				case "hash_447712ef48d6ea0":
				{
					players = getplayers();
					if(players.size >= 2)
					{
						players[1] thread zm_laststand::function_3d685b5f(100);
					}
					break;
				}
				case "hash_2a15f60adbba0cf5":
				{
					players = getplayers();
					if(players.size >= 3)
					{
						players[2] thread zm_laststand::function_3d685b5f(100);
					}
					break;
				}
				case "hash_430eb4715f49a5fe":
				{
					players = getplayers();
					if(players.size >= 4)
					{
						players[3] thread zm_laststand::function_3d685b5f(100);
					}
					break;
				}
				case "hash_7f98b3dd3cce95aa":
				{
					level.solo_lives_given = 0;
				}
				case "hash_210097a75bb6c49a":
				case "specialty_additionalprimaryweapon":
				case "hash_4110e6372aa77f7e":
				case "specialty_vultureaid":
				case "specialty_showonradar":
				case "hash_602a1b6107105f07":
				case "specialty_electriccherry":
				case "specialty_phdflopper":
				case "specialty_fastmeleerecovery":
				case "specialty_widowswine":
				{
					zombie_devgui_give_perk(cmd);
					break;
				}
				case "remove_perks":
				{
					zombie_devgui_take_perks(cmd);
					break;
				}
				case "lose_points_team":
				case "naughty_or_nice":
				case "hero_weapon_power":
				case "carpenter":
				case "free_perk":
				case "extra_lives":
				case "tesla":
				case "cranked_pause":
				case "pack_a_punch":
				case "bonus_points_player":
				case "lose_perk":
				case "meat_stink":
				case "full_ammo":
				case "empty_clip":
				case "bonus_points_team":
				case "random_weapon":
				case "nuke":
				case "fire_sale":
				case "insta_kill":
				case "double_points":
				case "minigun":
				case "zmarcade_key":
				case "bonfire_sale":
				{
					zombie_devgui_give_powerup(cmd, 1);
					break;
				}
				case "next_extra_lives":
				case "next_bonus_points_player":
				case "next_insta_kill":
				case "next_lose_perk":
				case "next_lose_points_team":
				case "next_nuke":
				case "next_bonfire_sale":
				case "next_pack_a_punch":
				case "next_meat_stink":
				case "next_bonus_points_team":
				case "hash_49f2171f2a5b4c28":
				case "next_free_perk":
				case "next_minigun":
				case "next_double_points":
				case "next_empty_clip":
				case "next_tesla":
				case "next_full_ammo":
				case "next_fire_sale":
				case "hash_6b6c14b0d315d68f":
				case "next_carpenter":
				case "next_zmarcade_key":
				case "next_random_weapon":
				case "next_hero_weapon_power":
				{
					zombie_devgui_give_powerup(getsubstr(cmd, 5), 0);
					break;
				}
				case "round":
				{
					zombie_devgui_goto_round(getdvarint(#"scr_zombie_round", 0));
					break;
				}
				case "round_next":
				{
					zombie_devgui_goto_round(level.round_number + 1);
					break;
				}
				case "round_prev":
				{
					zombie_devgui_goto_round(level.round_number - 1);
					break;
				}
				case "chest_warp":
				{
					array::thread_all(getplayers(), &function_4bb7eb36);
					break;
				}
				case "pap_warp":
				{
					array::thread_all(getplayers(), &function_84f0a909);
					break;
				}
				case "chest_move":
				{
					if(isdefined(level.chest_accessed))
					{
						level notify(#"devgui_chest_end_monitor");
						level.var_401aaa92 = 1;
					}
					break;
				}
				case "chest_never_move":
				{
					if(isdefined(level.chest_accessed))
					{
						level.var_401aaa92 = 0;
						level thread zombie_devgui_chest_never_move();
					}
					break;
				}
				case "chest":
				{
					if(isdefined(level.zombie_weapons[getweapon(getdvarstring(#"scr_force_weapon"))]))
					{
						if(isdefined(level.zombie_weapons[getweapon(getdvarstring(#"scr_force_weapon"))].var_9d17fab9))
						{
							level.var_f83c8dc2 = level.zombie_weapons[getweapon(getdvarstring(#"scr_force_weapon"))].var_9d17fab9;
						}
					}
					break;
				}
				case "give_claymores":
				{
					array::thread_all(getplayers(), &zombie_devgui_give_placeable_mine, getweapon(#"claymore"));
					break;
				}
				case "give_bouncingbetties":
				{
					array::thread_all(getplayers(), &zombie_devgui_give_placeable_mine, getweapon(#"bouncingbetty"));
					break;
				}
				case "give_frags":
				{
					array::thread_all(getplayers(), &zombie_devgui_give_frags);
					break;
				}
				case "give_sticky":
				{
					array::thread_all(getplayers(), &zombie_devgui_give_sticky);
					break;
				}
				case "give_monkey":
				{
					array::thread_all(getplayers(), &zombie_devgui_give_monkey);
					break;
				}
				case "give_bhb":
				{
					array::thread_all(getplayers(), &zombie_devgui_give_bhb);
					break;
				}
				case "give_quantum":
				{
					array::thread_all(getplayers(), &zombie_devgui_give_qed);
					break;
				}
				case "give_dolls":
				{
					array::thread_all(getplayers(), &zombie_devgui_give_dolls);
					break;
				}
				case "give_emp_bomb":
				{
					array::thread_all(getplayers(), &zombie_devgui_give_emp_bomb);
					break;
				}
				case "dog_round":
				{
					zombie_devgui_dog_round(getdvarint(#"scr_zombie_dogs", 0));
					break;
				}
				case "dog_round_skip":
				{
					zombie_devgui_dog_round_skip();
					break;
				}
				case "print_variables":
				{
					zombie_devgui_dump_zombie_vars();
					break;
				}
				case "pack_current_weapon":
				{
					zombie_devgui_pack_current_weapon();
					break;
				}
				case "hash_f9c9f7dd75a4047":
				{
					function_8c9f2dea();
					break;
				}
				case "hash_5605531ad17b5408":
				{
					function_b7ef4b8();
					break;
				}
				case "hash_2dde14d5c2960aea":
				{
					function_9b4d61fa();
					break;
				}
				case "hash_465e01a5b9f4f28e":
				{
					function_cdc3d061();
					break;
				}
				case "hash_26abd478093a24d0":
				{
					zombie_devgui_repack_current_weapon();
					break;
				}
				case "unpack_current_weapon":
				{
					zombie_devgui_unpack_current_weapon();
					break;
				}
				case "hash_72edcaf35bf3346d":
				{
					function_2a5ce9b1(#"white");
					break;
				}
				case "hash_62c70a71f6331428":
				{
					function_2a5ce9b1(#"green");
					break;
				}
				case "hash_7067e48773d50cbe":
				{
					function_2a5ce9b1(#"blue");
					break;
				}
				case "hash_309cf17674ed6d45":
				{
					function_2a5ce9b1(#"purple");
					break;
				}
				case "hash_166a522b8358b72b":
				{
					function_2a5ce9b1(#"orange");
					break;
				}
				case "hash_3c2b067b1510118c":
				{
					function_c8949116();
					break;
				}
				case "hash_769c6d03952dd107":
				{
					function_9d21f44b();
					break;
				}
				case "hash_68e9afed4aa9c0dd":
				{
					function_e2a97bab();
					break;
				}
				case "hash_3f4888627ed06269":
				{
					function_1a560cfc();
					break;
				}
				case "hash_73ecd8731ecdf6b0":
				{
					function_c8ee84ba();
					break;
				}
				case "hash_49563ad3930e97e4":
				{
					function_c83c6fa();
					break;
				}
				case "reopt_current_weapon":
				{
					zombie_devgui_reopt_current_weapon();
					break;
				}
				case "weapon_take_all_fallback":
				{
					zombie_devgui_take_weapons(1);
					break;
				}
				case "weapon_take_all":
				{
					zombie_devgui_take_weapons(0);
					break;
				}
				case "weapon_take_current":
				{
					zombie_devgui_take_weapon();
					break;
				}
				case "power_on":
				{
					level flag::set("");
					level clientfield::set("", 1);
					power_trigs = getentarray("", "");
					foreach(trig in power_trigs)
					{
						if(isdefined(trig.script_int))
						{
							level flag::set("" + trig.script_int);
							level clientfield::set("", trig.script_int + 1);
						}
					}
					break;
				}
				case "power_off":
				{
					level flag::clear("");
					level clientfield::set("", 0);
					power_trigs = getentarray("", "");
					foreach(trig in power_trigs)
					{
						if(isdefined(trig.script_int))
						{
							level flag::clear("" + trig.script_int);
							level clientfield::set("", trig.script_int);
						}
					}
					break;
				}
				case "zombie_dpad_none":
				{
					array::thread_all(getplayers(), &zombie_devgui_dpad_none);
					break;
				}
				case "zombie_dpad_damage":
				{
					array::thread_all(getplayers(), &zombie_devgui_dpad_damage);
					break;
				}
				case "zombie_dpad_kill":
				{
					array::thread_all(getplayers(), &zombie_devgui_dpad_death);
					break;
				}
				case "zombie_dpad_drink":
				{
					array::thread_all(getplayers(), &zombie_devgui_dpad_changeweapon);
					break;
				}
				case "director_easy":
				{
					zombie_devgui_director_easy();
					break;
				}
				case "open_sesame":
				{
					zombie_devgui_open_sesame();
					break;
				}
				case "allow_fog":
				{
					zombie_devgui_allow_fog();
					break;
				}
				case "disable_kill_thread_toggle":
				{
					zombie_devgui_disable_kill_thread_toggle();
					break;
				}
				case "check_kill_thread_every_frame_toggle":
				{
					zombie_devgui_check_kill_thread_every_frame_toggle();
					break;
				}
				case "kill_thread_test_mode_toggle":
				{
					zombie_devgui_kill_thread_test_mode_toggle();
					break;
				}
				case "zombie_failsafe_debug_flush":
				{
					level notify(#"zombie_failsafe_debug_flush");
					break;
				}
				case "rat_navmesh":
				{
					level thread rat::derriesezombiespawnnavmeshtest(0, 0);
					break;
				}
				case "spawn":
				{
					devgui_zombie_spawn();
					break;
				}
				case "spawn_dummy":
				{
					function_6f066ef();
					break;
				}
				case "spawn_near":
				{
					function_7c17d00f();
					break;
				}
				case "spawn_all":
				{
					devgui_all_spawn();
					break;
				}
				case "crawler":
				{
					devgui_make_crawler();
					break;
				}
				case "toggle_show_spawn_locations":
				{
					devgui_toggle_show_spawn_locations();
					break;
				}
				case "toggle_show_exterior_goals":
				{
					devgui_toggle_show_exterior_goals();
					break;
				}
				case "draw_traversals":
				{
					zombie_devgui_draw_traversals();
					break;
				}
				case "dump_traversals":
				{
					function_bbeaa2da();
					break;
				}
				case "debug_hud":
				{
					array::thread_all(getplayers(), &devgui_debug_hud);
					break;
				}
				case "reverse_carpenter":
				{
					function_f12b8a34();
					break;
				}
				case "keyline_always":
				{
					zombie_devgui_keyline_always();
					break;
				}
				case "hash_1e51dfcdbebdf936":
				{
					robotsupportsovercover_manager_();
					break;
				}
				case "debug_counts":
				{
					function_92523b12();
					break;
				}
				case "hash_604a84ea1690f781":
				{
					thread function_3a5618f8();
					break;
				}
				case "hash_72a10718318ec7ff":
				{
					function_21f1fbf1();
					break;
				}
				case "debug_navmesh_zone":
				{
					function_e395a714();
					break;
				}
				case "hash_28fd3c9a92f22718":
				{
					function_5349e112();
					break;
				}
				case "hash_7fafc507d5398c0b":
				{
					function_567ee21f();
					break;
				}
				case "hash_3ede275f03a4aa2b":
				{
					function_1762ff96();
					break;
				}
				case "hash_74f6277a8a40911e":
				{
					function_e5713258();
					break;
				}
				case "hash_3d647b897ae5dca6":
				{
					function_f298dd5c();
					break;
				}
				case "hash_3f826ccc785705ba":
				{
					function_26417ea7();
					break;
				}
				case "hash_683b625d2ace3726":
				{
					function_fb88b423();
					break;
				}
				case "hash_3f9e70ff9f34194a":
				{
					function_1b531660();
					break;
				}
				case "hash_7883eb109c3e6a94":
				{
					array::thread_all(function_a1ef346b(), &function_1bb72156);
					break;
				}
				case "hash_1d82cb8bcfe16540":
				{
					function_2f0c6f91();
					break;
				}
				case "hash_320b004253fe00b8":
				{
					function_1a4752d0();
					break;
				}
				case 0:
				{
					break;
				}
				default:
				{
					if(isdefined(level.custom_devgui))
					{
						if(isarray(level.custom_devgui))
						{
							foreach(devgui in level.custom_devgui)
							{
								b_result = [[devgui]](cmd);
								if(is_true(b_result))
								{
									break;
								}
							}
						}
						else
						{
							[[level.custom_devgui]](cmd);
						}
					}
					break;
				}
			}
			setdvar(#"zombie_devgui", "");
			wait(0.5);
		}
	#/
}

/*
	Name: add_custom_devgui_callback
	Namespace: zm_devgui
	Checksum: 0x9AE64E5B
	Offset: 0x80D8
	Size: 0x170
	Parameters: 1
	Flags: None
*/
function add_custom_devgui_callback(callback)
{
	/#
		if(isdefined(level.custom_devgui))
		{
			if(!isarray(level.custom_devgui))
			{
				cdgui = level.custom_devgui;
				level.custom_devgui = [];
				if(!isdefined(level.custom_devgui))
				{
					level.custom_devgui = [];
				}
				else if(!isarray(level.custom_devgui))
				{
					level.custom_devgui = array(level.custom_devgui);
				}
				level.custom_devgui[level.custom_devgui.size] = cdgui;
			}
		}
		else
		{
			level.custom_devgui = [];
		}
		if(!isdefined(level.custom_devgui))
		{
			level.custom_devgui = [];
		}
		else if(!isarray(level.custom_devgui))
		{
			level.custom_devgui = array(level.custom_devgui);
		}
		level.custom_devgui[level.custom_devgui.size] = callback;
	#/
}

/*
	Name: devgui_all_spawn
	Namespace: zm_devgui
	Checksum: 0xE0B45FD4
	Offset: 0x8250
	Size: 0x84
	Parameters: 0
	Flags: None
*/
function devgui_all_spawn()
{
	/#
		player = util::gethostplayer();
		for(i = 0; i < 3; i++)
		{
			bot::add_bot(player.team);
			wait(0.1);
		}
		zombie_devgui_goto_round(8);
	#/
}

/*
	Name: devgui_toggle_show_spawn_locations
	Namespace: zm_devgui
	Checksum: 0xAE50E4FB
	Offset: 0x82E0
	Size: 0x44
	Parameters: 0
	Flags: None
*/
function devgui_toggle_show_spawn_locations()
{
	/#
		if(!isdefined(level.toggle_show_spawn_locations))
		{
			level.toggle_show_spawn_locations = 1;
		}
		else
		{
			level.toggle_show_spawn_locations = !level.toggle_show_spawn_locations;
		}
	#/
}

/*
	Name: devgui_toggle_show_exterior_goals
	Namespace: zm_devgui
	Checksum: 0xDF21CDAD
	Offset: 0x8330
	Size: 0x44
	Parameters: 0
	Flags: None
*/
function devgui_toggle_show_exterior_goals()
{
	/#
		if(!isdefined(level.toggle_show_exterior_goals))
		{
			level.toggle_show_exterior_goals = 1;
		}
		else
		{
			level.toggle_show_exterior_goals = !level.toggle_show_exterior_goals;
		}
	#/
}

/*
	Name: function_567ee21f
	Namespace: zm_devgui
	Checksum: 0x4A9F34C1
	Offset: 0x8380
	Size: 0x290
	Parameters: 0
	Flags: None
*/
function function_567ee21f()
{
	/#
		level.var_377c39e4 = !is_true(level.var_377c39e4);
		if(level.var_377c39e4)
		{
			foreach(player in level.players)
			{
				player setclientplayerpushamount(1);
			}
			foreach(ai in getaiteamarray(#"axis"))
			{
				ai pushplayer(1);
			}
		}
		else
		{
			foreach(player in level.players)
			{
				player setclientplayerpushamount(0);
			}
			foreach(ai in getaiteamarray(#"axis"))
			{
				ai pushplayer(0);
			}
		}
	#/
}

/*
	Name: function_9960be00
	Namespace: zm_devgui
	Checksum: 0x5B997185
	Offset: 0x8618
	Size: 0x8
	Parameters: 0
	Flags: None
*/
function function_9960be00()
{
	/#
	#/
}

/*
	Name: function_33825850
	Namespace: zm_devgui
	Checksum: 0xF4653627
	Offset: 0x8630
	Size: 0x52
	Parameters: 4
	Flags: None
*/
function function_33825850(spawner, target_name, spot, round_number)
{
	/#
		guy = spot spawnfromspawner(round_number, 1);
		return guy;
	#/
}

/*
	Name: devgui_zombie_spawn
	Namespace: zm_devgui
	Checksum: 0x9E244CA3
	Offset: 0x8690
	Size: 0x278
	Parameters: 0
	Flags: None
*/
function devgui_zombie_spawn()
{
	/#
		player = getplayers()[0];
		spawnername = undefined;
		spawnername = "";
		direction = player getplayerangles();
		direction_vec = anglestoforward(direction);
		eye = player geteye();
		scale = 8000;
		direction_vec = (direction_vec[0] * scale, direction_vec[1] * scale, direction_vec[2] * scale);
		trace = bullettrace(eye, eye + direction_vec, 0, undefined);
		guy = undefined;
		if(isdefined(level.fn_custom_zombie_spawner_selection))
		{
			spawner = [[level.fn_custom_zombie_spawner_selection]]();
		}
		else
		{
			spawners = getentarray(spawnername, "");
			spawner = array::random(spawners);
		}
		var_f4dd97fd = spawner.script_forcespawn;
		spawner.script_forcespawn = 1;
		var_9e1082b2 = level.overridezombiespawn;
		level.overridezombiespawn = &function_33825850;
		guy = zombie_utility::spawn_zombie(spawner, "");
		level.overridezombiespawn = var_9e1082b2;
		spawner.script_forcespawn = var_f4dd97fd;
		if(isdefined(guy))
		{
			guy.script_string = "";
			guy dontinterpolate();
			guy forceteleport(trace[#"position"], player.angles + vectorscale((0, 1, 0), 180));
		}
		return guy;
	#/
}

/*
	Name: function_6f066ef
	Namespace: zm_devgui
	Checksum: 0x999E9A89
	Offset: 0x8918
	Size: 0xDC
	Parameters: 0
	Flags: None
*/
function function_6f066ef()
{
	/#
		player = getplayers()[0];
		forward = anglestoforward(player.angles);
		spawn = player.origin + (forward * 25);
		guy = devgui_zombie_spawn();
		if(isdefined(guy))
		{
			waitframe(1);
			guy pathmode("");
			guy forceteleport(spawn, player.angles);
		}
	#/
}

/*
	Name: function_7c17d00f
	Namespace: zm_devgui
	Checksum: 0xFFE0061A
	Offset: 0x8A00
	Size: 0xC4
	Parameters: 0
	Flags: None
*/
function function_7c17d00f()
{
	/#
		player = getplayers()[0];
		forward = anglestoforward(player.angles);
		spawn = player.origin + (forward * 100);
		guy = devgui_zombie_spawn();
		if(isdefined(guy))
		{
			guy forceteleport(spawn, player.angles + vectorscale((0, 1, 0), 180));
		}
	#/
}

/*
	Name: devgui_make_crawler
	Namespace: zm_devgui
	Checksum: 0x591C1532
	Offset: 0x8AD0
	Size: 0x1D8
	Parameters: 0
	Flags: None
*/
function devgui_make_crawler()
{
	/#
		zombies = zombie_utility::get_round_enemy_array();
		foreach(zombie in zombies)
		{
			gib_style = [];
			gib_style[gib_style.size] = "";
			gib_style[gib_style.size] = "";
			gib_style[gib_style.size] = "";
			gib_style = array::randomize(gib_style);
			zombie.a.gib_ref = gib_style[0];
			zombie zombie_utility::function_df5afb5e(1);
			zombie allowedstances("");
			zombie setphysparams(15, 0, 24);
			zombie allowpitchangle(1);
			zombie setpitchorient();
			health = zombie.health;
			health = health * 0.1;
			zombie thread zombie_death::do_gib();
		}
	#/
}

/*
	Name: zombie_devgui_open_sesame
	Namespace: zm_devgui
	Checksum: 0x5E1D3859
	Offset: 0x8CB0
	Size: 0x3B4
	Parameters: 0
	Flags: None
*/
function zombie_devgui_open_sesame()
{
	/#
		setdvar(#"zombie_unlock_all", 1);
		level flag::set("");
		level clientfield::set("", 1);
		power_trigs = getentarray("", "");
		foreach(trig in power_trigs)
		{
			if(isdefined(trig.script_int))
			{
				level flag::set("" + trig.script_int);
				level clientfield::set("", trig.script_int + 1);
			}
		}
		players = getplayers();
		array::thread_all(players, &zombie_devgui_give_money);
		zombie_doors = getentarray("", "");
		for(i = 0; i < zombie_doors.size; i++)
		{
			if(!is_true(zombie_doors[i].has_been_opened))
			{
				zombie_doors[i] notify(#"trigger", {#activator:players[0]});
			}
			if(is_true(zombie_doors[i].power_door_ignore_flag_wait))
			{
				zombie_doors[i] notify(#"power_on");
			}
			waitframe(1);
		}
		zombie_airlock_doors = getentarray("", "");
		for(i = 0; i < zombie_airlock_doors.size; i++)
		{
			zombie_airlock_doors[i] notify(#"trigger", {#activator:players[0]});
			waitframe(1);
		}
		zombie_debris = getentarray("", "");
		for(i = 0; i < zombie_debris.size; i++)
		{
			if(isdefined(zombie_debris[i]))
			{
				zombie_debris[i] notify(#"trigger", {#activator:players[0]});
			}
			waitframe(1);
		}
		level notify(#"open_sesame");
		wait(1);
		setdvar(#"zombie_unlock_all", 0);
	#/
}

/*
	Name: any_player_in_noclip
	Namespace: zm_devgui
	Checksum: 0x90D3F5B9
	Offset: 0x9070
	Size: 0xB2
	Parameters: 0
	Flags: None
*/
function any_player_in_noclip()
{
	/#
		foreach(player in getplayers())
		{
			if(player isinmovemode("", ""))
			{
				return true;
			}
		}
		return false;
	#/
}

/*
	Name: diable_fog_in_noclip
	Namespace: zm_devgui
	Checksum: 0x52096740
	Offset: 0x9130
	Size: 0x168
	Parameters: 0
	Flags: None
*/
function diable_fog_in_noclip()
{
	/#
		level.fog_disabled_in_noclip = 1;
		level endon(#"allowfoginnoclip");
		level flag::wait_till("");
		while(true)
		{
			while(!any_player_in_noclip())
			{
				wait(1);
			}
			setdvar(#"scr_fog_disable", 1);
			setdvar(#"r_fog_disable", 1);
			if(isdefined(level.culldist))
			{
				setculldist(0);
			}
			while(any_player_in_noclip())
			{
				wait(1);
			}
			setdvar(#"scr_fog_disable", 0);
			setdvar(#"r_fog_disable", 0);
			if(isdefined(level.culldist))
			{
				setculldist(level.culldist);
			}
		}
	#/
}

/*
	Name: zombie_devgui_allow_fog
	Namespace: zm_devgui
	Checksum: 0xB3F09CCE
	Offset: 0x92A0
	Size: 0x9C
	Parameters: 0
	Flags: None
*/
function zombie_devgui_allow_fog()
{
	/#
		if(is_true(level.fog_disabled_in_noclip))
		{
			level notify(#"allowfoginnoclip");
			level.fog_disabled_in_noclip = 0;
			setdvar(#"scr_fog_disable", 0);
			setdvar(#"r_fog_disable", 0);
		}
		else
		{
			thread diable_fog_in_noclip();
		}
	#/
}

/*
	Name: zombie_devgui_give_money
	Namespace: zm_devgui
	Checksum: 0xF84A4AAC
	Offset: 0x9348
	Size: 0x44
	Parameters: 1
	Flags: None
*/
function zombie_devgui_give_money(var_90c2e203)
{
	/#
		if(!isdefined(var_90c2e203))
		{
			var_90c2e203 = 100000;
		}
		level.devcheater = 1;
		self zm_score::add_to_player_score(var_90c2e203);
	#/
}

/*
	Name: function_6de15bb7
	Namespace: zm_devgui
	Checksum: 0x130D3877
	Offset: 0x9398
	Size: 0x4C
	Parameters: 1
	Flags: None
*/
function function_6de15bb7(var_90c2e203)
{
	/#
		if(!isdefined(var_90c2e203))
		{
			var_90c2e203 = 10000;
		}
		self sr_scrap::function_afab250a(var_90c2e203);
		self sr_scrap::function_a6d4221f(var_90c2e203);
	#/
}

/*
	Name: zombie_devgui_take_money
	Namespace: zm_devgui
	Checksum: 0x9DB3E1E2
	Offset: 0x93F0
	Size: 0xBC
	Parameters: 0
	Flags: None
*/
function zombie_devgui_take_money()
{
	/#
		/#
			assert(isdefined(self));
		#/
		/#
			assert(isplayer(self));
		#/
		/#
			assert(isalive(self));
		#/
		if(self.score > 100)
		{
			self zm_score::player_reduce_points("");
		}
		else
		{
			self zm_score::player_reduce_points("");
		}
	#/
}

/*
	Name: function_dc7312be
	Namespace: zm_devgui
	Checksum: 0x59F4A57A
	Offset: 0x94B8
	Size: 0x1A4
	Parameters: 0
	Flags: None
*/
function function_dc7312be()
{
	/#
		/#
			assert(isdefined(self));
		#/
		/#
			assert(isplayer(self));
		#/
		/#
			assert(isalive(self));
		#/
		if(!self zm_utility::is_drinking())
		{
			weapon = self getcurrentweapon();
			if(weapon != level.weaponnone && weapon != level.weaponzmfists && !is_true(weapon.isflourishweapon))
			{
				ammo = self getweaponammostock(weapon);
				max = weapon.maxammo;
				if(isdefined(max) && isdefined(ammo))
				{
					if(ammo > max / 10)
					{
						self setweaponammostock(weapon, int(ammo / 2));
					}
					else
					{
						self setweaponammostock(weapon, 0);
					}
				}
			}
		}
	#/
}

/*
	Name: zombie_devgui_give_xp
	Namespace: zm_devgui
	Checksum: 0x61B373A5
	Offset: 0x9668
	Size: 0xAC
	Parameters: 1
	Flags: None
*/
function zombie_devgui_give_xp(amount)
{
	/#
		/#
			assert(isdefined(self));
		#/
		/#
			assert(isplayer(self));
		#/
		/#
			assert(isalive(self));
		#/
		self addrankxp("", 0, self.currentweapon, undefined, undefined, amount / 50);
	#/
}

/*
	Name: zombie_devgui_turn_player
	Namespace: zm_devgui
	Checksum: 0xCDBC4963
	Offset: 0x9720
	Size: 0x16C
	Parameters: 1
	Flags: None
*/
function zombie_devgui_turn_player(index)
{
	/#
		players = getplayers();
		if(!isdefined(index) || index >= players.size)
		{
			player = players[0];
		}
		else
		{
			player = players[index];
		}
		/#
			assert(isdefined(player));
		#/
		/#
			assert(isplayer(player));
		#/
		/#
			assert(isalive(player));
		#/
		level.devcheater = 1;
		if(player hasperk(#"specialty_playeriszombie"))
		{
			println("");
			player zm_turned::turn_to_human();
		}
		else
		{
			println("");
			player zm_turned::turn_to_zombie();
		}
	#/
}

/*
	Name: function_4bb7eb36
	Namespace: zm_devgui
	Checksum: 0x8600664C
	Offset: 0x9898
	Size: 0x224
	Parameters: 0
	Flags: None
*/
function function_4bb7eb36()
{
	/#
		if(!isdefined(level.chests) || !isdefined(level.chest_index))
		{
			iprintlnbold("");
			return;
		}
		entnum = self getentitynumber();
		chest = level.chests[level.chest_index];
		origin = chest.zbarrier.origin;
		forward = anglestoforward(chest.zbarrier.angles);
		right = anglestoright(chest.zbarrier.angles);
		var_21f5823e = vectortoangles(right);
		var_916d3dfe = origin - (48 * right);
		switch(entnum)
		{
			case 0:
			{
				var_916d3dfe = var_916d3dfe + (16 * right);
				break;
			}
			case 1:
			{
				var_916d3dfe = var_916d3dfe + (16 * forward);
				break;
			}
			case 2:
			{
				var_916d3dfe = var_916d3dfe - (16 * right);
				break;
			}
			case 3:
			{
				var_916d3dfe = var_916d3dfe - (16 * forward);
				break;
			}
		}
		self setorigin(var_916d3dfe);
		self setplayerangles(var_21f5823e);
	#/
}

/*
	Name: function_84f0a909
	Namespace: zm_devgui
	Checksum: 0xB3F6B2C9
	Offset: 0x9AC8
	Size: 0x1FC
	Parameters: 0
	Flags: None
*/
function function_84f0a909()
{
	/#
		entnum = self getentitynumber();
		paps = getentarray("", "");
		pap = paps[0];
		if(!isdefined(pap))
		{
			return;
		}
		origin = pap.origin;
		forward = anglestoforward(pap.angles);
		right = anglestoright(pap.angles);
		var_21f5823e = vectortoangles(right * -1);
		var_916d3dfe = origin + (72 * right);
		switch(entnum)
		{
			case 0:
			{
				var_916d3dfe = var_916d3dfe - (16 * right);
				break;
			}
			case 1:
			{
				var_916d3dfe = var_916d3dfe + (16 * forward);
				break;
			}
			case 2:
			{
				var_916d3dfe = var_916d3dfe + (16 * right);
				break;
			}
			case 3:
			{
				var_916d3dfe = var_916d3dfe - (16 * forward);
				break;
			}
		}
		self setorigin(var_916d3dfe);
		self setplayerangles(var_21f5823e);
	#/
}

/*
	Name: zombie_devgui_cool_jetgun
	Namespace: zm_devgui
	Checksum: 0x14979CFA
	Offset: 0x9CD0
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function zombie_devgui_cool_jetgun()
{
	/#
		if(isdefined(level.zm_devgui_jetgun_never_overheat))
		{
			self thread [[level.zm_devgui_jetgun_never_overheat]]();
		}
	#/
}

/*
	Name: zombie_devgui_preserve_turbines
	Namespace: zm_devgui
	Checksum: 0x281A73EC
	Offset: 0x9D08
	Size: 0x92
	Parameters: 0
	Flags: None
*/
function zombie_devgui_preserve_turbines()
{
	/#
		self endon(#"disconnect");
		self notify(#"preserve_turbines");
		self endon(#"preserve_turbines");
		if(!is_true(self.preserving_turbines))
		{
			self.preserving_turbines = 1;
			while(true)
			{
				self.turbine_health = 1200;
				wait(1);
			}
		}
		self.preserving_turbines = 0;
	#/
}

/*
	Name: zombie_devgui_equipment_stays_healthy
	Namespace: zm_devgui
	Checksum: 0xC53E9ED9
	Offset: 0x9DA8
	Size: 0x166
	Parameters: 0
	Flags: None
*/
function zombie_devgui_equipment_stays_healthy()
{
	/#
		self endon(#"disconnect");
		self notify(#"preserve_equipment");
		self endon(#"preserve_equipment");
		if(!is_true(self.preserving_equipment))
		{
			self.preserving_equipment = 1;
			while(true)
			{
				self.equipment_damage = [];
				self.shielddamagetaken = 0;
				if(isdefined(level.destructible_equipment))
				{
					foreach(equip in level.destructible_equipment)
					{
						if(isdefined(equip))
						{
							equip.shielddamagetaken = 0;
							equip.damage = 0;
							equip.headchopper_kills = 0;
							equip.springpad_kills = 0;
							equip.subwoofer_kills = 0;
						}
					}
				}
				wait(0.1);
			}
		}
		self.preserving_equipment = 0;
	#/
}

/*
	Name: zombie_devgui_disown_equipment
	Namespace: zm_devgui
	Checksum: 0xCECB5C3D
	Offset: 0x9F18
	Size: 0x12
	Parameters: 0
	Flags: None
*/
function zombie_devgui_disown_equipment()
{
	/#
		self.deployed_equipment = [];
	#/
}

/*
	Name: zombie_devgui_equipment_give
	Namespace: zm_devgui
	Checksum: 0xF386E9F5
	Offset: 0x9F38
	Size: 0xBC
	Parameters: 1
	Flags: None
*/
function zombie_devgui_equipment_give(equipment)
{
	/#
		/#
			assert(isdefined(self));
		#/
		/#
			assert(isplayer(self));
		#/
		/#
			assert(isalive(self));
		#/
		level.devcheater = 1;
		if(zm_equipment::is_included(equipment))
		{
			self zm_equipment::buy(equipment);
		}
	#/
}

/*
	Name: zombie_devgui_give_placeable_mine
	Namespace: zm_devgui
	Checksum: 0xF18DE3D9
	Offset: 0xA000
	Size: 0x15E
	Parameters: 1
	Flags: None
*/
function zombie_devgui_give_placeable_mine(weapon)
{
	/#
		self endon(#"disconnect");
		self notify(#"give_planted_grenade_thread");
		self endon(#"give_planted_grenade_thread");
		/#
			assert(isdefined(self));
		#/
		/#
			assert(isplayer(self));
		#/
		/#
			assert(isalive(self));
		#/
		level.devcheater = 1;
		if(!zm_loadout::is_placeable_mine(weapon))
		{
			return;
		}
		if(isdefined(self zm_loadout::get_player_placeable_mine()))
		{
			self zm_weapons::weapon_take(self zm_loadout::get_player_placeable_mine());
		}
		self thread zm_placeable_mine::setup_for_player(weapon);
		while(true)
		{
			self givemaxammo(weapon);
			wait(1);
		}
	#/
}

/*
	Name: zombie_devgui_give_claymores
	Namespace: zm_devgui
	Checksum: 0x54B5B654
	Offset: 0xA168
	Size: 0x166
	Parameters: 0
	Flags: None
*/
function zombie_devgui_give_claymores()
{
	/#
		self endon(#"disconnect");
		self notify(#"give_planted_grenade_thread");
		self endon(#"give_planted_grenade_thread");
		/#
			assert(isdefined(self));
		#/
		/#
			assert(isplayer(self));
		#/
		/#
			assert(isalive(self));
		#/
		level.devcheater = 1;
		if(isdefined(self zm_loadout::get_player_placeable_mine()))
		{
			self zm_weapons::weapon_take(self zm_loadout::get_player_placeable_mine());
		}
		wpn_type = zm_placeable_mine::get_first_available();
		if(wpn_type != level.weaponnone)
		{
			self thread zm_placeable_mine::setup_for_player(wpn_type);
		}
		while(true)
		{
			self givemaxammo(wpn_type);
			wait(1);
		}
	#/
}

/*
	Name: zombie_devgui_give_lethal
	Namespace: zm_devgui
	Checksum: 0x7F3D0BC4
	Offset: 0xA2D8
	Size: 0x15E
	Parameters: 1
	Flags: None
*/
function zombie_devgui_give_lethal(weapon)
{
	/#
		self endon(#"disconnect");
		self notify(#"give_lethal_grenade_thread");
		self endon(#"give_lethal_grenade_thread");
		/#
			assert(isdefined(self));
		#/
		/#
			assert(isplayer(self));
		#/
		/#
			assert(isalive(self));
		#/
		level.devcheater = 1;
		if(isdefined(self zm_loadout::get_player_lethal_grenade()))
		{
			self takeweapon(self zm_loadout::get_player_lethal_grenade());
		}
		self giveweapon(weapon);
		self zm_loadout::set_player_lethal_grenade(weapon);
		while(true)
		{
			self givemaxammo(weapon);
			wait(1);
		}
	#/
}

/*
	Name: zombie_devgui_give_frags
	Namespace: zm_devgui
	Checksum: 0xA342F0E1
	Offset: 0xA440
	Size: 0x3C
	Parameters: 0
	Flags: None
*/
function zombie_devgui_give_frags()
{
	/#
		zombie_devgui_give_lethal(getweapon(#"eq_frag_grenade"));
	#/
}

/*
	Name: zombie_devgui_give_sticky
	Namespace: zm_devgui
	Checksum: 0x58CCBD5D
	Offset: 0xA488
	Size: 0x3C
	Parameters: 0
	Flags: None
*/
function zombie_devgui_give_sticky()
{
	/#
		zombie_devgui_give_lethal(getweapon(#"sticky_grenade"));
	#/
}

/*
	Name: zombie_devgui_give_monkey
	Namespace: zm_devgui
	Checksum: 0x6F513E5E
	Offset: 0xA4D0
	Size: 0x166
	Parameters: 0
	Flags: None
*/
function zombie_devgui_give_monkey()
{
	/#
		self endon(#"disconnect");
		self notify(#"give_tactical_grenade_thread");
		self endon(#"give_tactical_grenade_thread");
		/#
			assert(isdefined(self));
		#/
		/#
			assert(isplayer(self));
		#/
		/#
			assert(isalive(self));
		#/
		level.devcheater = 1;
		if(isdefined(self zm_loadout::get_player_tactical_grenade()))
		{
			self takeweapon(self zm_loadout::get_player_tactical_grenade());
		}
		if(isdefined(level.zombiemode_devgui_cymbal_monkey_give))
		{
			self [[level.zombiemode_devgui_cymbal_monkey_give]]();
			while(true)
			{
				self givemaxammo(getweapon(#"cymbal_monkey"));
				wait(1);
			}
		}
	#/
}

/*
	Name: zombie_devgui_give_bhb
	Namespace: zm_devgui
	Checksum: 0x32FE3935
	Offset: 0xA640
	Size: 0x14E
	Parameters: 0
	Flags: None
*/
function zombie_devgui_give_bhb()
{
	/#
		self endon(#"disconnect");
		self notify(#"give_tactical_grenade_thread");
		self endon(#"give_tactical_grenade_thread");
		/#
			assert(isdefined(self));
		#/
		/#
			assert(isplayer(self));
		#/
		/#
			assert(isalive(self));
		#/
		level.devcheater = 1;
		if(isdefined(self zm_loadout::get_player_tactical_grenade()))
		{
			self zm_weapons::weapon_take(self zm_loadout::get_player_tactical_grenade());
		}
		if(isdefined(level.zombiemode_devgui_black_hole_bomb_give))
		{
			self [[level.zombiemode_devgui_black_hole_bomb_give]]();
			while(true)
			{
				self givemaxammo(level.w_black_hole_bomb);
				wait(1);
			}
		}
	#/
}

/*
	Name: zombie_devgui_give_qed
	Namespace: zm_devgui
	Checksum: 0x6FFBE4DE
	Offset: 0xA798
	Size: 0x14E
	Parameters: 0
	Flags: None
*/
function zombie_devgui_give_qed()
{
	/#
		self endon(#"disconnect");
		self notify(#"give_tactical_grenade_thread");
		self endon(#"give_tactical_grenade_thread");
		/#
			assert(isdefined(self));
		#/
		/#
			assert(isplayer(self));
		#/
		/#
			assert(isalive(self));
		#/
		level.devcheater = 1;
		if(isdefined(self zm_loadout::get_player_tactical_grenade()))
		{
			self zm_weapons::weapon_take(self zm_loadout::get_player_tactical_grenade());
		}
		if(isdefined(level.zombiemode_devgui_quantum_bomb_give))
		{
			self [[level.zombiemode_devgui_quantum_bomb_give]]();
			while(true)
			{
				self givemaxammo(level.w_quantum_bomb);
				wait(1);
			}
		}
	#/
}

/*
	Name: zombie_devgui_give_dolls
	Namespace: zm_devgui
	Checksum: 0xEB3EAF68
	Offset: 0xA8F0
	Size: 0x14E
	Parameters: 0
	Flags: None
*/
function zombie_devgui_give_dolls()
{
	/#
		self endon(#"disconnect");
		self notify(#"give_tactical_grenade_thread");
		self endon(#"give_tactical_grenade_thread");
		/#
			assert(isdefined(self));
		#/
		/#
			assert(isplayer(self));
		#/
		/#
			assert(isalive(self));
		#/
		level.devcheater = 1;
		if(isdefined(self zm_loadout::get_player_tactical_grenade()))
		{
			self zm_weapons::weapon_take(self zm_loadout::get_player_tactical_grenade());
		}
		if(isdefined(level.zombiemode_devgui_nesting_dolls_give))
		{
			self [[level.zombiemode_devgui_nesting_dolls_give]]();
			while(true)
			{
				self givemaxammo(level.w_nesting_dolls);
				wait(1);
			}
		}
	#/
}

/*
	Name: zombie_devgui_give_emp_bomb
	Namespace: zm_devgui
	Checksum: 0xB61544E
	Offset: 0xAA48
	Size: 0x166
	Parameters: 0
	Flags: None
*/
function zombie_devgui_give_emp_bomb()
{
	/#
		self endon(#"disconnect");
		self notify(#"give_tactical_grenade_thread");
		self endon(#"give_tactical_grenade_thread");
		/#
			assert(isdefined(self));
		#/
		/#
			assert(isplayer(self));
		#/
		/#
			assert(isalive(self));
		#/
		level.devcheater = 1;
		if(isdefined(self zm_loadout::get_player_tactical_grenade()))
		{
			self zm_weapons::weapon_take(self zm_loadout::get_player_tactical_grenade());
		}
		if(isdefined(level.zombiemode_devgui_emp_bomb_give))
		{
			self [[level.zombiemode_devgui_emp_bomb_give]]();
			while(true)
			{
				self givemaxammo(getweapon(#"emp_grenade"));
				wait(1);
			}
		}
	#/
}

/*
	Name: zombie_devgui_invulnerable
	Namespace: zm_devgui
	Checksum: 0x7E12806F
	Offset: 0xABB8
	Size: 0xFC
	Parameters: 2
	Flags: None
*/
function zombie_devgui_invulnerable(playerindex, onoff)
{
	/#
		players = getplayers();
		if(!isdefined(playerindex))
		{
			for(i = 0; i < players.size; i++)
			{
				zombie_devgui_invulnerable(i, onoff);
			}
		}
		else if(players.size > playerindex)
		{
			if(onoff)
			{
				players[playerindex] val::set(#"zombie_devgui", "", 0);
			}
			else
			{
				players[playerindex] val::reset(#"zombie_devgui", "");
			}
		}
	#/
}

/*
	Name: zombie_devgui_kill
	Namespace: zm_devgui
	Checksum: 0x521B29D6
	Offset: 0xACC0
	Size: 0x124
	Parameters: 0
	Flags: None
*/
function zombie_devgui_kill()
{
	/#
		/#
			assert(isdefined(self));
		#/
		/#
			assert(isplayer(self));
		#/
		/#
			assert(isalive(self));
		#/
		self val::set(#"devgui_kill", "", 1);
		death_from = (randomfloatrange(-20, 20), randomfloatrange(-20, 20), randomfloatrange(-20, 20));
		self dodamage(self.health + 666, self.origin + death_from);
	#/
}

/*
	Name: zombie_devgui_toggle_ammo
	Namespace: zm_devgui
	Checksum: 0xD6256296
	Offset: 0xADF0
	Size: 0x2EE
	Parameters: 0
	Flags: None
*/
function zombie_devgui_toggle_ammo()
{
	/#
		/#
			assert(isdefined(self));
		#/
		/#
			assert(isplayer(self));
		#/
		/#
			assert(isalive(self));
		#/
		self notify(#"devgui_toggle_ammo");
		self endon(#"devgui_toggle_ammo");
		self.ammo4evah = !is_true(self.ammo4evah);
		while(isdefined(self) && self.ammo4evah)
		{
			if(!self zm_utility::is_drinking())
			{
				weapon = self getcurrentweapon();
				if(weapon != level.weaponnone && weapon != level.weaponzmfists && !is_true(weapon.isflourishweapon))
				{
					self setweaponoverheating(0, 0);
					max = weapon.maxammo;
					if(isdefined(max))
					{
						self setweaponammostock(weapon, max);
					}
					if(isdefined(self zm_loadout::get_player_tactical_grenade()))
					{
						self givemaxammo(self zm_loadout::get_player_tactical_grenade());
					}
					if(isdefined(self zm_loadout::get_player_lethal_grenade()))
					{
						self givemaxammo(self zm_loadout::get_player_lethal_grenade());
					}
				}
				for(i = 0; i < 3; i++)
				{
					if(isdefined(self._gadgets_player[i]) && self hasweapon(self._gadgets_player[i]))
					{
						if(!self util::gadget_is_in_use(i) && self gadgetcharging(i))
						{
							self gadgetpowerset(i, self._gadgets_player[i].gadget_powermax);
						}
					}
				}
			}
			wait(1);
		}
	#/
}

/*
	Name: zombie_devgui_toggle_ignore
	Namespace: zm_devgui
	Checksum: 0xE7CA8713
	Offset: 0xB0E8
	Size: 0x134
	Parameters: 0
	Flags: None
*/
function zombie_devgui_toggle_ignore()
{
	/#
		/#
			assert(isdefined(self));
		#/
		/#
			assert(isplayer(self));
		#/
		/#
			assert(isalive(self));
		#/
		if(!isdefined(self.devgui_ignoreme))
		{
			self.devgui_ignoreme = 0;
		}
		self.devgui_ignoreme = !self.devgui_ignoreme;
		if(self.devgui_ignoreme)
		{
			self val::set(#"devgui", "");
		}
		else
		{
			self val::reset(#"devgui", "");
		}
		if(self.ignoreme)
		{
			setdvar(#"ai_showfailedpaths", 0);
		}
	#/
}

/*
	Name: zombie_devgui_revive
	Namespace: zm_devgui
	Checksum: 0xF59641FC
	Offset: 0xB228
	Size: 0x6E
	Parameters: 0
	Flags: None
*/
function zombie_devgui_revive()
{
	/#
		/#
			assert(isdefined(self));
		#/
		/#
			assert(isplayer(self));
		#/
		if(laststand::player_is_in_laststand())
		{
			self notify(#"auto_revive");
		}
	#/
}

/*
	Name: zombie_devgui_give_health
	Namespace: zm_devgui
	Checksum: 0x3F9E246B
	Offset: 0xB2A0
	Size: 0x12C
	Parameters: 0
	Flags: None
*/
function zombie_devgui_give_health()
{
	/#
		/#
			assert(isdefined(self));
		#/
		/#
			assert(isplayer(self));
		#/
		/#
			assert(isalive(self));
		#/
		self notify(#"devgui_health");
		self endon(#"devgui_health", #"disconnect", #"death");
		level.devcheater = 1;
		while(true)
		{
			self.maxhealth = 100000;
			self.health = 100000;
			self waittill(#"player_revived", #"perk_used", #"spawned_player");
			wait(2);
		}
	#/
}

/*
	Name: zombie_devgui_low_health
	Namespace: zm_devgui
	Checksum: 0x3F15F6BD
	Offset: 0xB3D8
	Size: 0x12C
	Parameters: 0
	Flags: None
*/
function zombie_devgui_low_health()
{
	/#
		/#
			assert(isdefined(self));
		#/
		/#
			assert(isplayer(self));
		#/
		/#
			assert(isalive(self));
		#/
		self notify(#"devgui_health");
		self endon(#"devgui_health", #"disconnect", #"death");
		level.devcheater = 1;
		while(true)
		{
			self.maxhealth = 10;
			self.health = 10;
			self waittill(#"player_revived", #"perk_used", #"spawned_player");
			wait(2);
		}
	#/
}

/*
	Name: zombie_devgui_give_perk
	Namespace: zm_devgui
	Checksum: 0x1F1BE919
	Offset: 0xB510
	Size: 0x130
	Parameters: 1
	Flags: None
*/
function zombie_devgui_give_perk(perk)
{
	/#
		vending_machines = zm_perks::get_perk_machines();
		level.devcheater = 1;
		if(vending_machines.size < 1)
		{
			return;
		}
		foreach(player in getplayers())
		{
			for(i = 0; i < vending_machines.size; i++)
			{
				if(vending_machines[i].script_noteworthy == perk)
				{
					vending_machines[i] notify(#"trigger", {#activator:player});
					break;
				}
			}
			wait(1);
		}
	#/
}

/*
	Name: zombie_devgui_take_perks
	Namespace: zm_devgui
	Checksum: 0xD31304D1
	Offset: 0xB648
	Size: 0x1AA
	Parameters: 1
	Flags: None
*/
function zombie_devgui_take_perks(cmd)
{
	/#
		vending_machines = zm_perks::get_perk_machines();
		perks = [];
		for(i = 0; i < vending_machines.size; i++)
		{
			perk = vending_machines[i].script_noteworthy;
			if(isdefined(self.perk_purchased) && self.perk_purchased == perk)
			{
				continue;
			}
			perks[perks.size] = perk;
		}
		foreach(player in getplayers())
		{
			foreach(perk in perks)
			{
				perk_str = perk + "";
				player notify(perk_str);
			}
		}
	#/
}

/*
	Name: function_fd6c1b3c
	Namespace: zm_devgui
	Checksum: 0x5FBDB826
	Offset: 0xB800
	Size: 0x34
	Parameters: 1
	Flags: None
*/
function function_fd6c1b3c(cmd)
{
	/#
		if(isdefined(level.perk_random_devgui_callback))
		{
			self [[level.perk_random_devgui_callback]](cmd);
		}
	#/
}

/*
	Name: function_82f7d6a1
	Namespace: zm_devgui
	Checksum: 0x89B1BD4B
	Offset: 0xB840
	Size: 0x34
	Parameters: 1
	Flags: None
*/
function function_82f7d6a1(cmd)
{
	/#
		if(isdefined(level.perk_random_devgui_callback))
		{
			self [[level.perk_random_devgui_callback]](cmd);
		}
	#/
}

/*
	Name: function_68bd1e17
	Namespace: zm_devgui
	Checksum: 0x839BC06B
	Offset: 0xB880
	Size: 0x34
	Parameters: 1
	Flags: None
*/
function function_68bd1e17(cmd)
{
	/#
		if(isdefined(level.perk_random_devgui_callback))
		{
			self [[level.perk_random_devgui_callback]](cmd);
		}
	#/
}

/*
	Name: function_7565dd74
	Namespace: zm_devgui
	Checksum: 0x2FB136F7
	Offset: 0xB8C0
	Size: 0x34
	Parameters: 1
	Flags: None
*/
function function_7565dd74(cmd)
{
	/#
		if(isdefined(level.perk_random_devgui_callback))
		{
			self [[level.perk_random_devgui_callback]](cmd);
		}
	#/
}

/*
	Name: function_87979c2c
	Namespace: zm_devgui
	Checksum: 0x6EA5C192
	Offset: 0xB900
	Size: 0x34
	Parameters: 1
	Flags: None
*/
function function_87979c2c(cmd)
{
	/#
		if(isdefined(level.perk_random_devgui_callback))
		{
			self [[level.perk_random_devgui_callback]](cmd);
		}
	#/
}

/*
	Name: function_2cbcab61
	Namespace: zm_devgui
	Checksum: 0x6F18C871
	Offset: 0xB940
	Size: 0x34
	Parameters: 1
	Flags: None
*/
function function_2cbcab61(cmd)
{
	/#
		if(isdefined(level.perk_random_devgui_callback))
		{
			self [[level.perk_random_devgui_callback]](cmd);
		}
	#/
}

/*
	Name: function_18fc6a29
	Namespace: zm_devgui
	Checksum: 0xCC52D86A
	Offset: 0xB980
	Size: 0x34
	Parameters: 1
	Flags: None
*/
function function_18fc6a29(cmd)
{
	/#
		if(isdefined(level.perk_random_devgui_callback))
		{
			self [[level.perk_random_devgui_callback]](cmd);
		}
	#/
}

/*
	Name: zombie_devgui_give_powerup
	Namespace: zm_devgui
	Checksum: 0x6320A9FD
	Offset: 0xB9C0
	Size: 0x27C
	Parameters: 3
	Flags: None
*/
function zombie_devgui_give_powerup(powerup_name, now, origin)
{
	/#
		player = getplayers()[0];
		found = 0;
		level.devcheater = 1;
		if(isdefined(now) && !now)
		{
			for(i = 0; i < level.zombie_powerup_array.size; i++)
			{
				if(level.zombie_powerup_array[i] == powerup_name)
				{
					level.zombie_powerup_index = i;
					found = 1;
					break;
				}
			}
			if(!found)
			{
				return;
			}
			level.zombie_devgui_power = 1;
			zombie_utility::set_zombie_var(#"zombie_drop_item", 1);
			level.powerup_drop_count = 0;
			return;
		}
		direction = player getplayerangles();
		direction_vec = anglestoforward(direction);
		eye = player geteye();
		scale = 8000;
		direction_vec = (direction_vec[0] * scale, direction_vec[1] * scale, direction_vec[2] * scale);
		trace = bullettrace(eye, eye + direction_vec, 0, undefined);
		if(!isdefined(level.zombie_powerups) || !isdefined(level.zombie_powerups[powerup_name]))
		{
			return;
		}
		if(isdefined(origin))
		{
			level thread zm_powerups::specific_powerup_drop(powerup_name, origin, undefined, undefined, undefined, undefined, undefined, undefined, undefined, 1);
		}
		else
		{
			level thread zm_powerups::specific_powerup_drop(powerup_name, trace[#"position"], undefined, undefined, undefined, undefined, undefined, undefined, undefined, 1);
		}
	#/
}

/*
	Name: zombie_devgui_give_powerup_player
	Namespace: zm_devgui
	Checksum: 0x7224C163
	Offset: 0xBC48
	Size: 0x1F4
	Parameters: 2
	Flags: None
*/
function zombie_devgui_give_powerup_player(powerup_name, now)
{
	/#
		player = self;
		found = 0;
		level.devcheater = 1;
		if(isdefined(now) && !now)
		{
			for(i = 0; i < level.zombie_powerup_array.size; i++)
			{
				if(level.zombie_powerup_array[i] == powerup_name)
				{
					level.zombie_powerup_index = i;
					found = 1;
					break;
				}
			}
			if(!found)
			{
				return;
			}
			level.zombie_devgui_power = 1;
			zombie_utility::set_zombie_var(#"zombie_drop_item", 1);
			level.powerup_drop_count = 0;
			return;
		}
		direction = player getplayerangles();
		direction_vec = anglestoforward(direction);
		eye = player geteye();
		scale = 8000;
		direction_vec = (direction_vec[0] * scale, direction_vec[1] * scale, direction_vec[2] * scale);
		trace = bullettrace(eye, eye + direction_vec, 0, undefined);
		level thread zm_powerups::specific_powerup_drop(powerup_name, trace[#"position"], undefined, undefined, player);
	#/
}

/*
	Name: zombie_devgui_goto_round
	Namespace: zm_devgui
	Checksum: 0x6CF9EFF2
	Offset: 0xBE48
	Size: 0x18C
	Parameters: 1
	Flags: None
*/
function zombie_devgui_goto_round(target_round)
{
	/#
		player = getplayers()[0];
		if(target_round < 1)
		{
			target_round = 1;
		}
		level.devcheater = 1;
		level.zombie_total = 0;
		level.zombie_health = (isdefined(level.var_41dd92fd[#"zombie"].health) ? level.var_41dd92fd[#"zombie"].health : 100);
		zm_round_logic::set_round_number(target_round - 1);
		level notify(#"kill_round");
		wait(1);
		zombies = getaiteamarray(level.zombie_team);
		if(isdefined(zombies))
		{
			for(i = 0; i < zombies.size; i++)
			{
				if(is_true(zombies[i].ignore_devgui_death))
				{
					continue;
				}
				zombies[i] dodamage(zombies[i].health + 666, zombies[i].origin);
			}
		}
	#/
}

/*
	Name: zombie_devgui_monkey_round
	Namespace: zm_devgui
	Checksum: 0xEB298E67
	Offset: 0xBFE0
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function zombie_devgui_monkey_round()
{
	/#
		if(isdefined(level.next_monkey_round))
		{
			zombie_devgui_goto_round(level.next_monkey_round);
		}
	#/
}

/*
	Name: zombie_devgui_thief_round
	Namespace: zm_devgui
	Checksum: 0x482FE7D
	Offset: 0xC020
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function zombie_devgui_thief_round()
{
	/#
		if(isdefined(level.next_thief_round))
		{
			zombie_devgui_goto_round(level.next_thief_round);
		}
	#/
}

/*
	Name: zombie_devgui_dog_round
	Namespace: zm_devgui
	Checksum: 0xD0F506FF
	Offset: 0xC060
	Size: 0xEC
	Parameters: 1
	Flags: None
*/
function zombie_devgui_dog_round(num_dogs)
{
	/#
		if(!isdefined(level.dogs_enabled) || !level.dogs_enabled)
		{
			return;
		}
		if(!isdefined(level.dog_rounds_enabled) || !level.dog_rounds_enabled)
		{
			return;
		}
		if(!isdefined(level.enemy_dog_spawns) || level.enemy_dog_spawns.size < 1)
		{
			return;
		}
		if(!level flag::get(""))
		{
			setdvar(#"force_dogs", num_dogs);
		}
		zombie_devgui_goto_round(level.round_number + 1);
	#/
}

/*
	Name: zombie_devgui_dog_round_skip
	Namespace: zm_devgui
	Checksum: 0x39051BE2
	Offset: 0xC158
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function zombie_devgui_dog_round_skip()
{
	/#
		if(isdefined(level.next_dog_round))
		{
			zombie_devgui_goto_round(level.next_dog_round);
		}
	#/
}

/*
	Name: zombie_devgui_dump_zombie_vars
	Namespace: zm_devgui
	Checksum: 0xEF7F1EDB
	Offset: 0xC198
	Size: 0xF4
	Parameters: 0
	Flags: None
*/
function zombie_devgui_dump_zombie_vars()
{
	/#
		if(!isdefined(level.zombie_vars))
		{
			return;
		}
		if(level.zombie_vars.size > 0)
		{
			println("");
		}
		else
		{
			return;
		}
		var_392d3ebe = getarraykeys(level.zombie_vars);
		for(i = 0; i < level.zombie_vars.size; i++)
		{
			key = var_392d3ebe[i];
			println((key + "") + zombie_utility::function_d2dfacfd(key));
		}
		println("");
	#/
}

/*
	Name: zombie_devgui_pack_current_weapon
	Namespace: zm_devgui
	Checksum: 0xDC51AF16
	Offset: 0xC298
	Size: 0x1A4
	Parameters: 0
	Flags: None
*/
function zombie_devgui_pack_current_weapon()
{
	/#
		players = getplayers();
		level.devcheater = 1;
		for(i = 0; i < players.size; i++)
		{
			if(!players[i] laststand::player_is_in_laststand() && players[i].sessionstate !== "")
			{
				weap = players[i] getcurrentweapon();
				item = players[i] item_inventory::function_230ceec4(weap);
				var_27751b99 = namespace_4b9fccd8::function_ee7e837d(item);
				if(isdefined(item) && var_27751b99 == 0 && item.var_bd027dd9 != 32767)
				{
					players[i] item_inventory::function_73ae3380(item, 1);
					continue;
				}
				if(isdefined(item.var_a8bccf69) && item.var_a8bccf69 < 4)
				{
					var_9be8d39f = item.var_a8bccf69 + 1;
					players[i] item_inventory::function_73ae3380(item, var_9be8d39f);
				}
			}
		}
	#/
}

/*
	Name: zombie_devgui_repack_current_weapon
	Namespace: zm_devgui
	Checksum: 0x82DDB734
	Offset: 0xC448
	Size: 0x134
	Parameters: 0
	Flags: None
*/
function zombie_devgui_repack_current_weapon()
{
	/#
		players = getplayers();
		level.devcheater = 1;
		for(i = 0; i < players.size; i++)
		{
			if(!players[i] laststand::player_is_in_laststand() && players[i].sessionstate !== "")
			{
				weap = players[i] getcurrentweapon();
				item = players[i] item_inventory::function_230ceec4(weap);
				if(isdefined(item.var_a8bccf69) && item.var_a8bccf69 < 4)
				{
					var_9be8d39f = item.var_a8bccf69 + 1;
					players[i] item_inventory::function_73ae3380(item, var_9be8d39f);
				}
			}
		}
	#/
}

/*
	Name: zombie_devgui_unpack_current_weapon
	Namespace: zm_devgui
	Checksum: 0x704EB172
	Offset: 0xC588
	Size: 0x22C
	Parameters: 0
	Flags: None
*/
function zombie_devgui_unpack_current_weapon()
{
	/#
		players = getplayers();
		level.devcheater = 1;
		for(i = 0; i < players.size; i++)
		{
			if(!players[i] laststand::player_is_in_laststand() && players[i].sessionstate !== "")
			{
				weap = players[i] getcurrentweapon();
				item = players[i] item_inventory::function_230ceec4(weap);
				if(isdefined(item.var_a8bccf69) && item.var_a8bccf69 > 1)
				{
					var_9be8d39f = item.var_a8bccf69 - 1;
					players[i] item_inventory::function_73ae3380(item, var_9be8d39f);
					continue;
				}
				if(isdefined(item.var_a6762160) && isdefined(item.var_a6762160.rarity))
				{
					rarity = item.var_a6762160.rarity;
				}
				weapon = self weapons::function_251ec78c(weap, 1);
				players[i] zm_weapons::weapon_take(weap);
				weapon = players[i] zm_weapons::give_build_kit_weapon(weapon);
				players[i] zm_weapons::function_7c5dd4bd(weapon);
				players[i] switchtoweapon(weapon);
				players[i] thread function_3594cd6d(rarity);
			}
		}
	#/
}

/*
	Name: function_3594cd6d
	Namespace: zm_devgui
	Checksum: 0x8308CC6F
	Offset: 0xC7C0
	Size: 0x6C
	Parameters: 1
	Flags: None
*/
function function_3594cd6d(rarity)
{
	/#
		if(!isdefined(rarity))
		{
			rarity = #"white";
		}
		self endon(#"death");
		self waittill(#"weapon_change_complete");
		wait(1);
		self zm_weapons::function_17e9ed37(rarity);
	#/
}

/*
	Name: function_2a5ce9b1
	Namespace: zm_devgui
	Checksum: 0xDD8E5217
	Offset: 0xC838
	Size: 0xB0
	Parameters: 1
	Flags: None
*/
function function_2a5ce9b1(rarity)
{
	/#
		players = getplayers();
		foreach(player in players)
		{
			player zm_weapons::function_17e9ed37(rarity);
		}
	#/
}

/*
	Name: function_55c6dedd
	Namespace: zm_devgui
	Checksum: 0x302871CC
	Offset: 0xC8F0
	Size: 0x74
	Parameters: 2
	Flags: None
*/
function function_55c6dedd(str_weapon, xp)
{
	/#
		if(!str_weapon || !level.onlinegame)
		{
			return;
		}
		if(0 > xp)
		{
			xp = 0;
		}
		self stats::set_stat(#"hash_60e21f66eb3a1f18", str_weapon, #"xp", xp);
	#/
}

/*
	Name: function_335cdac
	Namespace: zm_devgui
	Checksum: 0x35F13FF9
	Offset: 0xC970
	Size: 0xE8
	Parameters: 1
	Flags: None
*/
function function_335cdac(weapon)
{
	/#
		gunlevels = [];
		table = popups::devgui_notif_getgunleveltablename();
		weapon_name = weapon.rootweapon.name;
		for(i = 0; i < 15; i++)
		{
			var_4a3def14 = tablelookup(table, 2, weapon_name, 0, i, 1);
			if("" == var_4a3def14)
			{
				break;
			}
			gunlevels[i] = int(var_4a3def14);
		}
		return gunlevels;
	#/
}

/*
	Name: registerhendricks_under_silo_third_jump_fight_
	Namespace: zm_devgui
	Checksum: 0x746BF5FF
	Offset: 0xCA68
	Size: 0x7C
	Parameters: 2
	Flags: None
*/
function registerhendricks_under_silo_third_jump_fight_(weapon, var_56c1b8d)
{
	/#
		xp = 0;
		gunlevels = function_335cdac(weapon);
		if(gunlevels.size)
		{
			xp = gunlevels[gunlevels.size - 1];
			if(var_56c1b8d < gunlevels.size)
			{
				xp = gunlevels[var_56c1b8d];
			}
		}
		return xp;
	#/
}

/*
	Name: function_af7d932
	Namespace: zm_devgui
	Checksum: 0x2F724B2E
	Offset: 0xCAF0
	Size: 0x60
	Parameters: 1
	Flags: None
*/
function function_af7d932(weapon)
{
	/#
		xp = 0;
		gunlevels = function_335cdac(weapon);
		if(gunlevels.size)
		{
			xp = gunlevels[gunlevels.size - 1];
		}
		return xp;
	#/
}

/*
	Name: function_c8949116
	Namespace: zm_devgui
	Checksum: 0x1AEEE40F
	Offset: 0xCB60
	Size: 0x8
	Parameters: 0
	Flags: None
*/
function function_c8949116()
{
	/#
	#/
}

/*
	Name: function_9d21f44b
	Namespace: zm_devgui
	Checksum: 0x7FBE2BE3
	Offset: 0xCB70
	Size: 0x8
	Parameters: 0
	Flags: None
*/
function function_9d21f44b()
{
	/#
	#/
}

/*
	Name: function_e2a97bab
	Namespace: zm_devgui
	Checksum: 0xA2BD6A1B
	Offset: 0xCB80
	Size: 0x8
	Parameters: 0
	Flags: None
*/
function function_e2a97bab()
{
	/#
	#/
}

/*
	Name: function_1a560cfc
	Namespace: zm_devgui
	Checksum: 0xD8D85276
	Offset: 0xCB90
	Size: 0x8
	Parameters: 0
	Flags: None
*/
function function_1a560cfc()
{
	/#
	#/
}

/*
	Name: function_c8ee84ba
	Namespace: zm_devgui
	Checksum: 0x1BCE6C5B
	Offset: 0xCBA0
	Size: 0x8
	Parameters: 0
	Flags: None
*/
function function_c8ee84ba()
{
	/#
	#/
}

/*
	Name: function_c83c6fa
	Namespace: zm_devgui
	Checksum: 0xC2D40CF5
	Offset: 0xCBB0
	Size: 0x8
	Parameters: 0
	Flags: None
*/
function function_c83c6fa()
{
	/#
	#/
}

/*
	Name: function_cbdab30d
	Namespace: zm_devgui
	Checksum: 0xD13F7BB7
	Offset: 0xCBC0
	Size: 0x124
	Parameters: 1
	Flags: None
*/
function function_cbdab30d(xp)
{
	/#
		if(self.pers[#"rankxp"] > xp)
		{
			self.pers[#"rank"] = 0;
			self setrank(0);
			self stats::set_stat(#"playerstatslist", #"rank", #"statvalue", 0);
		}
		self.pers[#"rankxp"] = xp;
		self rank::updaterank();
		self stats::set_stat(#"playerstatslist", #"rank", #"statvalue", self.pers[#"rank"]);
	#/
}

/*
	Name: function_5c26ad27
	Namespace: zm_devgui
	Checksum: 0xF9654B2
	Offset: 0xCCF0
	Size: 0x12
	Parameters: 1
	Flags: None
*/
function function_5c26ad27(var_56c1b8d)
{
	/#
		return false;
	#/
}

/*
	Name: function_5da832fa
	Namespace: zm_devgui
	Checksum: 0x2686BFDA
	Offset: 0xCD10
	Size: 0x4A
	Parameters: 0
	Flags: None
*/
function function_5da832fa()
{
	/#
		xp = 0;
		if(isdefined(level.ranktable))
		{
			xp = function_5c26ad27(level.ranktable.size - 1);
		}
		return xp;
	#/
}

/*
	Name: function_8c9f2dea
	Namespace: zm_devgui
	Checksum: 0x2EA96F42
	Offset: 0xCD68
	Size: 0xD4
	Parameters: 0
	Flags: None
*/
function function_8c9f2dea()
{
	/#
		players = getplayers();
		level.devcheater = 1;
		for(i = 0; i < players.size; i++)
		{
			player = players[i];
			if(!player laststand::player_is_in_laststand())
			{
				var_56c1b8d = player rank::getrank();
				xp = function_5c26ad27(var_56c1b8d);
				player function_cbdab30d(xp);
			}
		}
	#/
}

/*
	Name: function_b7ef4b8
	Namespace: zm_devgui
	Checksum: 0xD5C0F362
	Offset: 0xCE48
	Size: 0xDC
	Parameters: 0
	Flags: None
*/
function function_b7ef4b8()
{
	/#
		players = getplayers();
		level.devcheater = 1;
		for(i = 0; i < players.size; i++)
		{
			player = players[i];
			if(!player laststand::player_is_in_laststand())
			{
				var_56c1b8d = player rank::getrank();
				xp = function_5c26ad27(var_56c1b8d);
				player function_cbdab30d(xp - 50);
			}
		}
	#/
}

/*
	Name: function_9b4d61fa
	Namespace: zm_devgui
	Checksum: 0x4C87F3AC
	Offset: 0xCF30
	Size: 0xB4
	Parameters: 0
	Flags: None
*/
function function_9b4d61fa()
{
	/#
		players = getplayers();
		level.devcheater = 1;
		for(i = 0; i < players.size; i++)
		{
			player = players[i];
			if(!player laststand::player_is_in_laststand())
			{
				xp = function_5da832fa();
				player function_cbdab30d(xp);
			}
		}
	#/
}

/*
	Name: function_cdc3d061
	Namespace: zm_devgui
	Checksum: 0xBAB07835
	Offset: 0xCFF0
	Size: 0x94
	Parameters: 0
	Flags: None
*/
function function_cdc3d061()
{
	/#
		players = getplayers();
		level.devcheater = 1;
		for(i = 0; i < players.size; i++)
		{
			player = players[i];
			if(!player laststand::player_is_in_laststand())
			{
				player function_cbdab30d(0);
			}
		}
	#/
}

/*
	Name: zombie_devgui_reopt_current_weapon
	Namespace: zm_devgui
	Checksum: 0x3C69BC51
	Offset: 0xD090
	Size: 0x134
	Parameters: 0
	Flags: None
*/
function zombie_devgui_reopt_current_weapon()
{
	/#
		players = getplayers();
		reviver = players[0];
		level.devcheater = 1;
		for(i = 0; i < players.size; i++)
		{
			if(!players[i] laststand::player_is_in_laststand())
			{
				weapon = players[i] getcurrentweapon();
				if(isdefined(players[i].pack_a_punch_weapon_options))
				{
					players[i].pack_a_punch_weapon_options[weapon] = undefined;
				}
				players[i] zm_weapons::weapon_take(weapon);
				weapon = players[i] zm_weapons::give_build_kit_weapon(weapon);
				players[i] zm_weapons::function_7c5dd4bd(weapon);
				players[i] switchtoweapon(weapon);
			}
		}
	#/
}

/*
	Name: zombie_devgui_take_weapon
	Namespace: zm_devgui
	Checksum: 0xE2B77B75
	Offset: 0xD1D0
	Size: 0xD4
	Parameters: 0
	Flags: None
*/
function zombie_devgui_take_weapon()
{
	/#
		players = getplayers();
		reviver = players[0];
		level.devcheater = 1;
		for(i = 0; i < players.size; i++)
		{
			if(!players[i] laststand::player_is_in_laststand())
			{
				players[i] zm_weapons::weapon_take(players[i] getcurrentweapon());
				players[i] zm_weapons::switch_back_primary_weapon(undefined);
			}
		}
	#/
}

/*
	Name: zombie_devgui_take_weapons
	Namespace: zm_devgui
	Checksum: 0xE73CB7F4
	Offset: 0xD2B0
	Size: 0x138
	Parameters: 1
	Flags: None
*/
function zombie_devgui_take_weapons(give_fallback)
{
	/#
		players = getplayers();
		reviver = players[0];
		level.devcheater = 1;
		for(i = 0; i < players.size; i++)
		{
			if(!players[i] laststand::player_is_in_laststand())
			{
				a_weapons = players[i] getweaponslist();
				foreach(weapon in a_weapons)
				{
					players[i] zm_weapons::weapon_take(weapon);
				}
			}
		}
	#/
}

/*
	Name: get_upgrade
	Namespace: zm_devgui
	Checksum: 0x2B76E098
	Offset: 0xD3F0
	Size: 0x7A
	Parameters: 1
	Flags: None
*/
function get_upgrade(weapon)
{
	/#
		if(isdefined(level.zombie_weapons[weapon]) && isdefined(level.zombie_weapons[weapon].upgrade_name))
		{
			return zm_weapons::get_upgrade_weapon(weapon, 0);
		}
		return zm_weapons::get_upgrade_weapon(weapon, 1);
	#/
}

/*
	Name: zombie_devgui_director_easy
	Namespace: zm_devgui
	Checksum: 0x17F0D709
	Offset: 0xD478
	Size: 0x28
	Parameters: 0
	Flags: None
*/
function zombie_devgui_director_easy()
{
	/#
		if(isdefined(level.director_devgui_health))
		{
			[[level.director_devgui_health]]();
		}
	#/
}

/*
	Name: zombie_devgui_chest_never_move
	Namespace: zm_devgui
	Checksum: 0xBEF3C982
	Offset: 0xD4A8
	Size: 0x4A
	Parameters: 0
	Flags: None
*/
function zombie_devgui_chest_never_move()
{
	/#
		level notify(#"devgui_chest_end_monitor");
		level endon(#"devgui_chest_end_monitor");
		for(;;)
		{
			level.chest_accessed = 0;
			wait(5);
		}
	#/
}

/*
	Name: zombie_devgui_disable_kill_thread_toggle
	Namespace: zm_devgui
	Checksum: 0x5E6369DB
	Offset: 0xD500
	Size: 0x44
	Parameters: 0
	Flags: None
*/
function zombie_devgui_disable_kill_thread_toggle()
{
	/#
		if(!is_true(level.disable_kill_thread))
		{
			level.disable_kill_thread = 1;
		}
		else
		{
			level.disable_kill_thread = 0;
		}
	#/
}

/*
	Name: zombie_devgui_check_kill_thread_every_frame_toggle
	Namespace: zm_devgui
	Checksum: 0x157A410E
	Offset: 0xD550
	Size: 0x44
	Parameters: 0
	Flags: None
*/
function zombie_devgui_check_kill_thread_every_frame_toggle()
{
	/#
		if(!is_true(level.check_kill_thread_every_frame))
		{
			level.check_kill_thread_every_frame = 1;
		}
		else
		{
			level.check_kill_thread_every_frame = 0;
		}
	#/
}

/*
	Name: zombie_devgui_kill_thread_test_mode_toggle
	Namespace: zm_devgui
	Checksum: 0x3073BA27
	Offset: 0xD5A0
	Size: 0x44
	Parameters: 0
	Flags: None
*/
function zombie_devgui_kill_thread_test_mode_toggle()
{
	/#
		if(!is_true(level.kill_thread_test_mode))
		{
			level.kill_thread_test_mode = 1;
		}
		else
		{
			level.kill_thread_test_mode = 0;
		}
	#/
}

/*
	Name: showonespawnpoint
	Namespace: zm_devgui
	Checksum: 0xCCECB1C1
	Offset: 0xD5F0
	Size: 0x4AC
	Parameters: 5
	Flags: None
*/
function showonespawnpoint(spawn_point, color, notification, height, print)
{
	/#
		if(!isdefined(height) || height <= 0)
		{
			height = util::get_player_height();
		}
		if(!isdefined(print))
		{
			print = spawn_point.classname;
		}
		center = spawn_point.origin;
		forward = anglestoforward(spawn_point.angles);
		right = anglestoright(spawn_point.angles);
		forward = vectorscale(forward, 16);
		right = vectorscale(right, 16);
		a = (center + forward) - right;
		b = (center + forward) + right;
		c = (center - forward) + right;
		d = (center - forward) - right;
		thread lineuntilnotified(a, b, color, 0, notification);
		thread lineuntilnotified(b, c, color, 0, notification);
		thread lineuntilnotified(c, d, color, 0, notification);
		thread lineuntilnotified(d, a, color, 0, notification);
		thread lineuntilnotified(a, a + (0, 0, height), color, 0, notification);
		thread lineuntilnotified(b, b + (0, 0, height), color, 0, notification);
		thread lineuntilnotified(c, c + (0, 0, height), color, 0, notification);
		thread lineuntilnotified(d, d + (0, 0, height), color, 0, notification);
		a = a + (0, 0, height);
		b = b + (0, 0, height);
		c = c + (0, 0, height);
		d = d + (0, 0, height);
		thread lineuntilnotified(a, b, color, 0, notification);
		thread lineuntilnotified(b, c, color, 0, notification);
		thread lineuntilnotified(c, d, color, 0, notification);
		thread lineuntilnotified(d, a, color, 0, notification);
		center = center + (0, 0, height / 2);
		arrow_forward = anglestoforward(spawn_point.angles);
		arrowhead_forward = anglestoforward(spawn_point.angles);
		arrowhead_right = anglestoright(spawn_point.angles);
		arrow_forward = vectorscale(arrow_forward, 32);
		arrowhead_forward = vectorscale(arrowhead_forward, 24);
		arrowhead_right = vectorscale(arrowhead_right, 8);
		a = center + arrow_forward;
		b = (center + arrowhead_forward) - arrowhead_right;
		c = (center + arrowhead_forward) + arrowhead_right;
		thread lineuntilnotified(center, a, color, 0, notification);
		thread lineuntilnotified(a, b, color, 0, notification);
		thread lineuntilnotified(a, c, color, 0, notification);
		thread print3duntilnotified(spawn_point.origin + (0, 0, height), print, color, 1, 1, notification);
	#/
}

/*
	Name: print3duntilnotified
	Namespace: zm_devgui
	Checksum: 0xAF8E4BAB
	Offset: 0xDAA8
	Size: 0x6E
	Parameters: 6
	Flags: None
*/
function print3duntilnotified(origin, text, color, alpha, scale, notification)
{
	/#
		level endon(notification);
		for(;;)
		{
			print3d(origin, text, color, alpha, scale);
			waitframe(1);
		}
	#/
}

/*
	Name: lineuntilnotified
	Namespace: zm_devgui
	Checksum: 0x559EA46F
	Offset: 0xDB20
	Size: 0x66
	Parameters: 5
	Flags: None
*/
function lineuntilnotified(start, end, color, depthtest, notification)
{
	/#
		level endon(notification);
		for(;;)
		{
			line(start, end, color, depthtest);
			waitframe(1);
		}
	#/
}

/*
	Name: devgui_debug_hud
	Namespace: zm_devgui
	Checksum: 0xD4570E95
	Offset: 0xDB90
	Size: 0x2E4
	Parameters: 0
	Flags: None
*/
function devgui_debug_hud()
{
	/#
		if(isdefined(self zm_loadout::get_player_lethal_grenade()))
		{
			self givemaxammo(self zm_loadout::get_player_lethal_grenade());
		}
		wpn_type = zm_placeable_mine::get_first_available();
		if(wpn_type != level.weaponnone)
		{
			self thread zm_placeable_mine::setup_for_player(wpn_type);
		}
		if(isdefined(level.zombiemode_devgui_cymbal_monkey_give))
		{
			if(isdefined(self zm_loadout::get_player_tactical_grenade()))
			{
				self takeweapon(self zm_loadout::get_player_tactical_grenade());
			}
			self [[level.zombiemode_devgui_cymbal_monkey_give]]();
		}
		else if(isdefined(self zm_loadout::get_player_tactical_grenade()))
		{
			self givemaxammo(self zm_loadout::get_player_tactical_grenade());
		}
		if(isdefined(level.zombie_include_equipment) && !isdefined(self zm_equipment::get_player_equipment()))
		{
			equipment = getarraykeys(level.zombie_include_equipment);
			if(isdefined(equipment[0]))
			{
				self zombie_devgui_equipment_give(equipment[0]);
			}
		}
		for(i = 0; i < 10; i++)
		{
			zombie_devgui_give_powerup("", 1, self.origin);
			wait(0.25);
		}
		zombie_devgui_give_powerup("", 1, self.origin);
		wait(0.25);
		zombie_devgui_give_powerup("", 1, self.origin);
		wait(0.25);
		zombie_devgui_give_powerup("", 1, self.origin);
		wait(0.25);
		zombie_devgui_give_powerup("", 1, self.origin);
		wait(0.25);
		zombie_devgui_give_powerup("", 1, self.origin);
		wait(0.25);
	#/
}

/*
	Name: zombie_devgui_draw_traversals
	Namespace: zm_devgui
	Checksum: 0x91087A3
	Offset: 0xDE80
	Size: 0x44
	Parameters: 0
	Flags: None
*/
function zombie_devgui_draw_traversals()
{
	/#
		if(!isdefined(level.toggle_draw_traversals))
		{
			level.toggle_draw_traversals = 1;
		}
		else
		{
			level.toggle_draw_traversals = !level.toggle_draw_traversals;
		}
	#/
}

/*
	Name: zombie_devgui_keyline_always
	Namespace: zm_devgui
	Checksum: 0xEBBE7CA9
	Offset: 0xDED0
	Size: 0x44
	Parameters: 0
	Flags: None
*/
function zombie_devgui_keyline_always()
{
	/#
		if(!isdefined(level.toggle_keyline_always))
		{
			level.toggle_keyline_always = 1;
		}
		else
		{
			level.toggle_keyline_always = !level.toggle_keyline_always;
		}
	#/
}

/*
	Name: robotsupportsovercover_manager_
	Namespace: zm_devgui
	Checksum: 0x8431AC0F
	Offset: 0xDF20
	Size: 0x94
	Parameters: 0
	Flags: None
*/
function robotsupportsovercover_manager_()
{
	/#
		if(level flag::get(""))
		{
			level flag::clear("");
			iprintln("");
		}
		else
		{
			level flag::set("");
			iprintln("");
		}
	#/
}

/*
	Name: function_92523b12
	Namespace: zm_devgui
	Checksum: 0x7B3DC28D
	Offset: 0xDFC0
	Size: 0x44
	Parameters: 0
	Flags: None
*/
function function_92523b12()
{
	/#
		if(!isdefined(level.var_5171ee4a))
		{
			level.var_5171ee4a = 1;
		}
		else
		{
			level.var_5171ee4a = !level.var_5171ee4a;
		}
	#/
}

/*
	Name: wait_for_zombie
	Namespace: zm_devgui
	Checksum: 0x4C069AD
	Offset: 0xE010
	Size: 0x298
	Parameters: 1
	Flags: None
*/
function wait_for_zombie(crawler)
{
	/#
		nodes = getallnodes();
		while(true)
		{
			ai = getactorarray();
			zombie = ai[0];
			if(isdefined(zombie))
			{
				foreach(node in nodes)
				{
					if(node.type == #"begin" || node.type == #"end" || node.type == #"bad node")
					{
						if(isdefined(node.animscript))
						{
							zombie setblackboardattribute("", "");
							zombie setblackboardattribute("", node.animscript);
							table = "";
							if(is_true(crawler))
							{
								table = "";
							}
							if(isdefined(zombie.debug_traversal_ast))
							{
								table = zombie.debug_traversal_ast;
							}
							anim_results = zombie astsearch(table);
							if(!isdefined(anim_results[#"animation"]))
							{
								if(is_true(crawler))
								{
									node.bad_crawler_traverse = 1;
								}
								else
								{
									node.bad_traverse = 1;
								}
								continue;
							}
							if(anim_results[#"animation"] == "")
							{
								teleport = 1;
							}
						}
					}
				}
				break;
			}
			wait(0.25);
		}
	#/
}

/*
	Name: zombie_draw_traversals
	Namespace: zm_devgui
	Checksum: 0xFB1EE652
	Offset: 0xE2B0
	Size: 0x1FA
	Parameters: 0
	Flags: None
*/
function zombie_draw_traversals()
{
	/#
		level thread wait_for_zombie();
		level thread wait_for_zombie(1);
		nodes = getallnodes();
		while(true)
		{
			if(is_true(level.toggle_draw_traversals))
			{
				foreach(node in nodes)
				{
					if(isdefined(node.animscript))
					{
						txt_color = (0, 0.8, 0.6);
						circle_color = (1, 1, 1);
						if(is_true(node.bad_traverse))
						{
							txt_color = (1, 0, 0);
							circle_color = (1, 0, 0);
						}
						circle(node.origin, 16, circle_color);
						print3d(node.origin, node.animscript, txt_color, 1, 0.5);
						if(is_true(node.bad_crawler_traverse))
						{
							print3d(node.origin + (vectorscale((0, 0, -1), 12)), "", (1, 0, 0), 1, 0.5);
						}
					}
				}
			}
			waitframe(1);
		}
	#/
}

/*
	Name: function_bbeaa2da
	Namespace: zm_devgui
	Checksum: 0xF9DB0777
	Offset: 0xE4B8
	Size: 0x1E4
	Parameters: 0
	Flags: None
*/
function function_bbeaa2da()
{
	/#
		nodes = getallnodes();
		var_43e9aabd = [];
		foreach(node in nodes)
		{
			if(isdefined(node.animscript) && node.animscript != "")
			{
				var_43e9aabd[node.animscript] = 1;
			}
		}
		var_cb16f0db = getarraykeys(var_43e9aabd);
		sortednames = array::sort_by_value(var_cb16f0db, 1);
		println("");
		foreach(name in sortednames)
		{
			println("" + name);
		}
		println("");
	#/
}

/*
	Name: function_e9b89aac
	Namespace: zm_devgui
	Checksum: 0xAA4CA4CC
	Offset: 0xE6A8
	Size: 0x1EE
	Parameters: 0
	Flags: None
*/
function function_e9b89aac()
{
	/#
		while(true)
		{
			if(isdefined(level.zones) && (getdvarint(#"zombiemode_debug_zones", 0) || getdvarint(#"hash_756b3f2accaa1678", 0)))
			{
				foreach(zone in level.zones)
				{
					foreach(node in zone.nodes)
					{
						node_region = getnoderegion(node);
						var_747013f8 = node.targetname;
						if(isdefined(node_region))
						{
							var_747013f8 = (node_region + "") + node.targetname;
						}
						print3d(node.origin + vectorscale((0, 0, 1), 12), var_747013f8, (0, 1, 0), 1, 1);
					}
				}
			}
			waitframe(1);
		}
	#/
}

/*
	Name: function_e395a714
	Namespace: zm_devgui
	Checksum: 0x4BD57004
	Offset: 0xE8A0
	Size: 0xE8
	Parameters: 0
	Flags: None
*/
function function_e395a714()
{
	/#
		if(!isdefined(level.var_9a11ee76))
		{
			level.var_9a11ee76 = 0;
		}
		foreach(player in level.players)
		{
			if(level.var_9a11ee76)
			{
				player notify(#"hash_d592b5d81b7b3a7");
				continue;
			}
			player thread function_fb482cad();
		}
		level.var_9a11ee76 = !level.var_9a11ee76;
	#/
}

/*
	Name: function_2fcf8a4a
	Namespace: zm_devgui
	Checksum: 0xFB1A33BC
	Offset: 0xE990
	Size: 0x3E
	Parameters: 1
	Flags: None
*/
function function_2fcf8a4a(notifyhash)
{
	/#
		if(isdefined(self.var_d35d1d3d))
		{
			self.var_d35d1d3d destroy();
			self.var_d35d1d3d = undefined;
		}
	#/
}

/*
	Name: function_fb482cad
	Namespace: zm_devgui
	Checksum: 0xC7055764
	Offset: 0xE9D8
	Size: 0x186
	Parameters: 0
	Flags: None
*/
function function_fb482cad()
{
	/#
		self notify(#"hash_d592b5d81b7b3a7");
		self endoncallback(&function_2fcf8a4a, #"hash_d592b5d81b7b3a7", #"disconnect");
		while(true)
		{
			if(!isdefined(self.var_d35d1d3d))
			{
				self.var_d35d1d3d = newdebughudelem(self);
				self.var_d35d1d3d.alignx = "";
				self.var_d35d1d3d.horzalign = "";
				self.var_d35d1d3d.aligny = "";
				self.var_d35d1d3d.vertalign = "";
				self.var_d35d1d3d.color = (1, 1, 1);
				self.var_d35d1d3d.alpha = 1;
			}
			debug_text = "";
			if(isdefined(self.cached_zone_volume))
			{
				debug_text = "";
			}
			else if(isdefined(self.var_3b65cdd7))
			{
				debug_text = "";
			}
			self.var_d35d1d3d settext(debug_text);
			self waittill(#"zone_change");
		}
	#/
}

/*
	Name: function_5349e112
	Namespace: zm_devgui
	Checksum: 0xC579A5AB
	Offset: 0xEB68
	Size: 0x218
	Parameters: 0
	Flags: None
*/
function function_5349e112()
{
	/#
		if(!isdefined(level.var_1d432d3))
		{
			level.var_b086a41a = getentarray("", "");
			infovolumedebuginit();
		}
		level.var_1d432d3 = !is_true(level.var_1d432d3);
		if(is_true(level.var_1d432d3))
		{
			setdvar(#"g_drawdebuginfovolumes", 1);
			foreach(area in level.var_b086a41a)
			{
				showinfovolume(area getentitynumber(), (1, 1, 0), 0.5);
			}
		}
		else
		{
			setdvar(#"g_drawdebuginfovolumes", 0);
			foreach(area in level.var_b086a41a)
			{
				hideinfovolume(area getentitynumber());
			}
		}
	#/
}

/*
	Name: function_8817dd98
	Namespace: zm_devgui
	Checksum: 0x5B906B85
	Offset: 0xED88
	Size: 0x226
	Parameters: 0
	Flags: None
*/
function function_8817dd98()
{
	/#
		while(true)
		{
			if(is_true(level.var_5171ee4a))
			{
				if(!isdefined(level.var_fcfab54a))
				{
					level.var_fcfab54a = newdebughudelem();
					level.var_fcfab54a.alignx = "";
					level.var_fcfab54a.x = 2;
					level.var_fcfab54a.y = 160;
					level.var_fcfab54a.fontscale = 1.5;
					level.var_fcfab54a.color = (1, 1, 1);
				}
				zombie_count = zombie_utility::get_current_zombie_count();
				zombie_left = level.zombie_total;
				zombie_runners = 0;
				var_536fd32b = zombie_utility::get_zombie_array();
				foreach(ai_zombie in var_536fd32b)
				{
					if(ai_zombie.zombie_move_speed == "")
					{
						zombie_runners++;
					}
				}
				level.var_fcfab54a settext((((("" + zombie_count) + "") + zombie_left) + "") + zombie_runners);
			}
			else if(isdefined(level.var_fcfab54a))
			{
				level.var_fcfab54a destroy();
			}
			waitframe(1);
		}
	#/
}

/*
	Name: testscriptruntimeerrorassert
	Namespace: zm_devgui
	Checksum: 0xEE58326D
	Offset: 0xEFB8
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function testscriptruntimeerrorassert()
{
	/#
		wait(1);
		/#
			assert(0);
		#/
	#/
}

/*
	Name: testscriptruntimeerror2
	Namespace: zm_devgui
	Checksum: 0x2DCB673D
	Offset: 0xEFE8
	Size: 0x44
	Parameters: 0
	Flags: None
*/
function testscriptruntimeerror2()
{
	/#
		myundefined = "";
		if(myundefined == 1)
		{
			println("");
		}
	#/
}

/*
	Name: testscriptruntimeerror1
	Namespace: zm_devgui
	Checksum: 0x41B3E460
	Offset: 0xF038
	Size: 0x1C
	Parameters: 0
	Flags: None
*/
function testscriptruntimeerror1()
{
	/#
		testscriptruntimeerror2();
	#/
}

/*
	Name: testscriptruntimeerror
	Namespace: zm_devgui
	Checksum: 0x33FD5DF3
	Offset: 0xF060
	Size: 0xDC
	Parameters: 0
	Flags: None
*/
function testscriptruntimeerror()
{
	/#
		wait(5);
		for(;;)
		{
			if(getdvarstring(#"scr_testscriptruntimeerror") != "")
			{
				break;
			}
			wait(1);
		}
		myerror = getdvarstring(#"scr_testscriptruntimeerror");
		setdvar(#"scr_testscriptruntimeerror", "");
		if(myerror == "")
		{
			testscriptruntimeerrorassert();
		}
		else
		{
			testscriptruntimeerror1();
		}
		thread testscriptruntimeerror();
	#/
}

/*
	Name: function_f12b8a34
	Namespace: zm_devgui
	Checksum: 0x76FC2C0F
	Offset: 0xF148
	Size: 0x26E
	Parameters: 0
	Flags: None
*/
function function_f12b8a34()
{
	/#
		barriers = struct::get_array("", "");
		if(isdefined(level._additional_carpenter_nodes))
		{
			barriers = arraycombine(barriers, level._additional_carpenter_nodes, 0, 0);
		}
		foreach(barrier in barriers)
		{
			if(isdefined(barrier.zbarrier))
			{
				a_pieces = barrier.zbarrier getzbarrierpieceindicesinstate("");
				if(isdefined(a_pieces))
				{
					for(xx = 0; xx < a_pieces.size; xx++)
					{
						chunk = a_pieces[xx];
						barrier.zbarrier zbarrierpieceusedefaultmodel(chunk);
						barrier.zbarrier.chunk_health[chunk] = 0;
					}
				}
				for(x = 0; x < barrier.zbarrier getnumzbarrierpieces(); x++)
				{
					barrier.zbarrier setzbarrierpiecestate(x, "");
					barrier.zbarrier showzbarrierpiece(x);
				}
			}
			if(isdefined(barrier.clip))
			{
				barrier.clip triggerenable(1);
				barrier.clip disconnectpaths();
			}
			else
			{
				zm_blockers::blocker_connect_paths(barrier.neg_start, barrier.neg_end);
			}
			waitframe(1);
		}
	#/
}

/*
	Name: function_29dcbd58
	Namespace: zm_devgui
	Checksum: 0x4BDEC34B
	Offset: 0xF3C0
	Size: 0x8A
	Parameters: 0
	Flags: None
*/
function function_29dcbd58()
{
	/#
		var_a6f3b62c = getdvarint(#"hash_1e8ebf0a767981dd", 0);
		return array(array(var_a6f3b62c / 2, 30), array(var_a6f3b62c - 1, 20));
	#/
}

/*
	Name: function_3a5618f8
	Namespace: zm_devgui
	Checksum: 0x2D520176
	Offset: 0xF458
	Size: 0x27C
	Parameters: 0
	Flags: None
*/
function function_3a5618f8()
{
	/#
		self endon(#"hash_63ae1cb168b8e0d7");
		setdvar(#"cg_drawscriptusage", 1);
		var_a6f3b62c = getdvarint(#"hash_1e8ebf0a767981dd", 0);
		timescale = getdvarint(#"hash_7438b7c847f3c0", 0);
		var_59ed21fc = function_29dcbd58();
		setdvar(#"runtime_time_scale", timescale);
		while(level.round_number < var_a6f3b62c)
		{
			foreach(round_info in var_59ed21fc)
			{
				if(level.round_number < round_info[0])
				{
					wait(round_info[1]);
					break;
				}
			}
			ai_enemies = getaiteamarray(#"axis");
			foreach(ai in ai_enemies)
			{
				ai kill();
			}
			adddebugcommand("");
			wait(0.2);
		}
		setdvar(#"runtime_time_scale", 1);
	#/
}

/*
	Name: function_21f1fbf1
	Namespace: zm_devgui
	Checksum: 0x24D1F9CB
	Offset: 0xF6E0
	Size: 0x44
	Parameters: 0
	Flags: None
*/
function function_21f1fbf1()
{
	/#
		self notify(#"hash_63ae1cb168b8e0d7");
		setdvar(#"runtime_time_scale", 1);
	#/
}

/*
	Name: function_1762ff96
	Namespace: zm_devgui
	Checksum: 0x293F1161
	Offset: 0xF730
	Size: 0x80
	Parameters: 0
	Flags: None
*/
function function_1762ff96()
{
	/#
		level.var_afb69372 = !is_true(self.var_afb69372);
		if(is_true(level.var_afb69372))
		{
			level thread function_b7e34647();
		}
		else
		{
			level notify(#"hash_2876f101dd7375df");
		}
	#/
}

/*
	Name: function_b7e34647
	Namespace: zm_devgui
	Checksum: 0x9534B4EE
	Offset: 0xF7B8
	Size: 0x242
	Parameters: 0
	Flags: None
*/
function function_b7e34647()
{
	/#
		level endon(#"hash_2876f101dd7375df");
		while(true)
		{
			zombies = [];
			foreach(archetype in level.var_58903b1f)
			{
				ai = getaiarchetypearray(archetype, level.zombie_team);
				if(ai.size)
				{
					zombies = arraycombine(zombies, ai, 0, 0);
				}
			}
			foreach(zombie in zombies)
			{
				if(is_true(zombie.need_closest_player))
				{
					record3dtext("", zombie.origin + vectorscale((0, 0, 1), 72), (1, 0, 0));
					continue;
				}
				record3dtext("", zombie.origin + vectorscale((0, 0, 1), 72), (0, 1, 0));
				if(isdefined(zombie.var_26f25576))
				{
					record3dtext(gettime() - zombie.var_26f25576, zombie.origin + vectorscale((0, 0, 1), 54), (1, 1, 1));
				}
			}
			waitframe(1);
		}
	#/
}

/*
	Name: function_1e285ac2
	Namespace: zm_devgui
	Checksum: 0x8034F20F
	Offset: 0xFA08
	Size: 0x84
	Parameters: 0
	Flags: None
*/
function function_1e285ac2()
{
	/#
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand("");
		level thread function_c774d870();
	#/
}

/*
	Name: function_c774d870
	Namespace: zm_devgui
	Checksum: 0x46B28761
	Offset: 0xFA98
	Size: 0x298
	Parameters: 0
	Flags: None
*/
function function_c774d870()
{
	/#
		for(;;)
		{
			wait(0.25);
			cmd = getdvarint(#"hash_5b8785c3d6383b3a", 0);
			if(isdefined(cmd) && cmd == 1)
			{
				iprintlnbold("");
				zm::function_1442d44f();
				setdvar(#"hash_5b8785c3d6383b3a", 0);
			}
			cmd = getdvarstring(#"hash_2d9d21912cbffb75");
			if(isdefined(cmd) && cmd == 1)
			{
				iprintlnbold("");
				level.gamedifficulty = 0;
				setdvar(#"hash_2d9d21912cbffb75", 0);
				setdvar(#"hash_5b8785c3d6383b3a", 1);
			}
			cmd = getdvarstring(#"hash_2b205a3ab882058c");
			if(isdefined(cmd) && cmd == 1)
			{
				iprintlnbold("");
				level.gamedifficulty = 1;
				setdvar(#"hash_2b205a3ab882058c", 0);
				setdvar(#"hash_5b8785c3d6383b3a", 1);
			}
			cmd = getdvarstring(#"hash_393960bacf784966");
			if(isdefined(cmd) && cmd == 1)
			{
				iprintlnbold("");
				level.gamedifficulty = 2;
				setdvar(#"hash_393960bacf784966", 0);
				setdvar(#"hash_5b8785c3d6383b3a", 1);
			}
		}
	#/
}

/*
	Name: function_255c7194
	Namespace: zm_devgui
	Checksum: 0xCE32CC9
	Offset: 0xFD38
	Size: 0xA4
	Parameters: 0
	Flags: Private
*/
function private function_255c7194()
{
	/#
		player = getplayers()[0];
		queryresult = positionquery_source_navigation(player.origin, 256, 512, 128, 20);
		if(isdefined(queryresult) && queryresult.data.size > 0)
		{
			return queryresult.data[0];
		}
		return {#origin:player.origin};
	#/
}

/*
	Name: function_b4dcb9ce
	Namespace: zm_devgui
	Checksum: 0x755FE660
	Offset: 0xFDE8
	Size: 0x10C
	Parameters: 0
	Flags: Private
*/
function private function_b4dcb9ce()
{
	/#
		player = getplayers()[0];
		direction = player getplayerangles();
		direction_vec = anglestoforward(direction);
		eye = player geteye();
		scale = 8000;
		direction_vec = (direction_vec[0] * scale, direction_vec[1] * scale, direction_vec[2] * scale);
		trace = bullettrace(eye, eye + direction_vec, 0, player);
		return {#origin:trace[#"position"]};
	#/
}

/*
	Name: spawn_archetype
	Namespace: zm_devgui
	Checksum: 0x2C89170
	Offset: 0xFF00
	Size: 0xDC
	Parameters: 1
	Flags: None
*/
function spawn_archetype(spawner_name)
{
	/#
		spawners = getspawnerarray(spawner_name, "");
		spawn_point = function_b4dcb9ce();
		if(spawners.size == 0)
		{
			iprintln(("" + spawner_name) + "");
			return;
		}
		entity = spawners[0] spawnfromspawner(0, 1);
		if(isdefined(entity))
		{
			entity forceteleport(spawn_point.origin);
		}
	#/
}

/*
	Name: kill_archetype
	Namespace: zm_devgui
	Checksum: 0x1578676B
	Offset: 0xFFE8
	Size: 0xC8
	Parameters: 1
	Flags: None
*/
function kill_archetype(archetype)
{
	/#
		enemies = getaiarchetypearray(archetype);
		foreach(enemy in enemies)
		{
			if(isalive(enemy))
			{
				enemy kill();
			}
		}
	#/
}

/*
	Name: function_8d799ebd
	Namespace: zm_devgui
	Checksum: 0xF02D395
	Offset: 0x100B8
	Size: 0x56C
	Parameters: 0
	Flags: None
*/
function function_8d799ebd()
{
	/#
		self notify("");
		self endon("");
		level.devcheater = 1;
		if(!self laststand::player_is_in_laststand())
		{
			var_d4073f30 = array::randomize(array(#"shotgun_fullauto_t9", #"tr_fastburst_t9", #"sniper_powersemi_t9", #"hash_70cb1c2da27e0190", #"ar_accurate_t9"));
			foreach(w_primary in self getweaponslistprimaries())
			{
				self zm_weapons::weapon_take(w_primary);
			}
			self val::set("", "", 1);
			for(i = 0; i < zm_utility::get_player_weapon_limit(self); i++)
			{
				str_weapon_name = array::random(var_d4073f30);
				arrayremovevalue(var_d4073f30, str_weapon_name);
				weapon = getweapon(str_weapon_name);
				self zm_weapons::weapon_give(weapon, 1, 0, undefined, undefined, array::random(array(#"orange", #"gold")));
				do
				{
					s_waitresult = undefined;
					s_waitresult = self waittill(#"weapon_change_complete");
				}
				while(self item_inventory::function_a33744de(s_waitresult.weapon) == 32767);
				item = self item_inventory::function_230ceec4(s_waitresult.weapon);
				if(isdefined(item) && item.var_bd027dd9 != 32767)
				{
					var_2a2c98f2 = self item_inventory::function_73ae3380(item, 1);
					if(isstruct(var_2a2c98f2) && isdefined(var_2a2c98f2.var_bd027dd9) && var_2a2c98f2.var_bd027dd9 != 32767)
					{
						self item_inventory::function_73ae3380(var_2a2c98f2, 2);
						if(is_true(level.aat_in_use) && !aat::is_exempt_weapon(var_2a2c98f2.var_627c698b))
						{
							var_80c3ca2 = array::random(array("", ""));
							self zm_weapons::function_37e9e0cb(var_2a2c98f2, weapon, var_80c3ca2);
						}
					}
				}
			}
			self val::reset("", "");
			self namespace_dd7e54e3::give_armor(#"hash_7bc70addda19ca00");
			self namespace_791d0451::function_3fecad82(#"hash_7f98b3dd3cce95aa");
			self namespace_791d0451::function_3fecad82(#"hash_5930cf0eb070e35a");
			self namespace_791d0451::function_3fecad82(#"hash_4110e6372aa77f7e");
			self namespace_791d0451::function_3fecad82(#"hash_47d7a8105237c88");
			self namespace_1cc7b406::give_equipment("", 2);
			self namespace_1cc7b406::give_equipment("", 2);
			self namespace_1cc7b406::give_equipment("", 2);
			self namespace_1cc7b406::give_equipment("", 2);
		}
	#/
}

/*
	Name: function_f298dd5c
	Namespace: zm_devgui
	Checksum: 0x4C21E130
	Offset: 0x10630
	Size: 0x60
	Parameters: 0
	Flags: None
*/
function function_f298dd5c()
{
	/#
		/#
			if(!isdefined(level.var_9db63456))
			{
				level.var_9db63456 = 0;
			}
		#/
		if(!isdefined(level.var_9db63456))
		{
			level.var_9db63456 = 1;
		}
		level.var_9db63456 = !level.var_9db63456;
	#/
}

/*
	Name: function_e5713258
	Namespace: zm_devgui
	Checksum: 0xF93DD732
	Offset: 0x10698
	Size: 0x78
	Parameters: 0
	Flags: None
*/
function function_e5713258()
{
	/#
		if(is_true(level.var_33571ef1))
		{
			level notify(#"hash_147174071dbfe31e");
		}
		else
		{
			level thread function_15ee6847();
		}
		level.var_33571ef1 = !is_true(level.var_33571ef1);
	#/
}

/*
	Name: function_15ee6847
	Namespace: zm_devgui
	Checksum: 0xD070FDA4
	Offset: 0x10718
	Size: 0x286
	Parameters: 0
	Flags: None
*/
function function_15ee6847()
{
	/#
		self notify("");
		self endon("");
		level endon(#"hash_147174071dbfe31e");
		while(true)
		{
			teststring = "";
			foreach(player in level.players)
			{
				teststring = teststring + (("" + player getentitynumber()) + "");
				if(player.sessionstate == "")
				{
					teststring = teststring + "";
					continue;
				}
				if(is_true(self.hostmigrationcontrolsfrozen))
				{
					teststring = teststring + "";
					continue;
				}
				if(player zm_player::in_life_brush())
				{
					teststring = teststring + "";
					continue;
				}
				if(player zm_player::in_kill_brush())
				{
					teststring = teststring + "";
					continue;
				}
				if(!player zm_player::in_enabled_playable_area())
				{
					teststring = teststring + "";
					continue;
				}
				if(isdefined(level.player_out_of_playable_area_override) && !is_true(player [[level.player_out_of_playable_area_override]]()))
				{
					teststring = teststring + "";
					continue;
				}
				teststring = teststring + "";
			}
			debug2dtext((400, 100, 0), teststring, (1, 1, 0), undefined, (0, 0, 0), 0.75, 1, 1);
			waitframe(1);
		}
	#/
}

/*
	Name: function_2f0c6f91
	Namespace: zm_devgui
	Checksum: 0x7C472970
	Offset: 0x109A8
	Size: 0x8C
	Parameters: 0
	Flags: None
*/
function function_2f0c6f91()
{
	/#
		if(!isdefined(level.var_df7f30f4))
		{
			level.var_df7f30f4 = 0;
		}
		level.var_df7f30f4 = (level.var_df7f30f4 == 0 ? 1 : 0);
		if(!level.var_df7f30f4)
		{
			level notify(#"hash_21adc62fc2f5bc32");
		}
		else
		{
			level thread function_5ec967f7();
		}
	#/
}

/*
	Name: function_1a4752d0
	Namespace: zm_devgui
	Checksum: 0x62A0D688
	Offset: 0x10A40
	Size: 0x2A4
	Parameters: 0
	Flags: None
*/
function function_1a4752d0()
{
	/#
		if(!isdefined(level.var_d13a2c74))
		{
			level.var_d13a2c74 = 0;
		}
		foreach(location in level.var_7d45d0d4.locations)
		{
			if(isdefined(location.instances[#"wallbuy"]))
			{
				if(isarray(location.instances[#"wallbuy"].var_fe2612fe[#"wallbuy_chalk"]))
				{
					var_d82a99e8 = location.instances[#"wallbuy"].var_fe2612fe[#"wallbuy_chalk"][level.var_d13a2c74];
					player = getplayers()[0];
					forward = anglestoright(var_d82a99e8.angles);
					forward = vectornormalize(forward);
					forward = (forward[0] * 64, forward[1] * 64, forward[2] * 64);
					var_92f819ac = var_d82a99e8.origin + forward;
					player setorigin(var_92f819ac);
					level.var_d13a2c74++;
					if(level.var_d13a2c74 >= location.instances[#"wallbuy"].var_fe2612fe[#"wallbuy_chalk"].size)
					{
						level.var_d13a2c74 = level.var_d13a2c74 >= (location.instances[#"wallbuy"].var_fe2612fe[#"wallbuy_chalk"].size - 1);
					}
				}
			}
		}
	#/
}

/*
	Name: function_5ec967f7
	Namespace: zm_devgui
	Checksum: 0x9C5FED01
	Offset: 0x10CF0
	Size: 0x206
	Parameters: 0
	Flags: None
*/
function function_5ec967f7()
{
	/#
		level endon(#"hash_21adc62fc2f5bc32");
		while(true)
		{
			foreach(location in level.var_7d45d0d4.locations)
			{
				if(isdefined(location.instances[#"wallbuy"]))
				{
					if(isarray(location.instances[#"wallbuy"].var_fe2612fe[#"wallbuy_chalk"]))
					{
						foreach(wallbuy in location.instances[#"wallbuy"].var_fe2612fe[#"wallbuy_chalk"])
						{
							player = getplayers()[0];
							if(player util::is_looking_at(wallbuy.origin))
							{
								sphere(wallbuy.origin, 32, (1, 0, 0), 1, 0, 10, 10);
							}
						}
					}
				}
			}
			waitframe(1);
		}
	#/
}

/*
	Name: function_26417ea7
	Namespace: zm_devgui
	Checksum: 0xBD1C4634
	Offset: 0x10F00
	Size: 0x30
	Parameters: 0
	Flags: None
*/
function function_26417ea7()
{
	/#
		level.var_565d6ce0 = !is_true(level.var_565d6ce0);
	#/
}

/*
	Name: function_fb88b423
	Namespace: zm_devgui
	Checksum: 0x40DF6BA9
	Offset: 0x10F38
	Size: 0xB8
	Parameters: 0
	Flags: None
*/
function function_fb88b423()
{
	/#
		zombies = getaiarray();
		foreach(zombie in zombies)
		{
			zombie zombie_utility::setup_zombie_knockdown(level.players[0]);
		}
	#/
}

/*
	Name: init_debug_center_screen
	Namespace: zm_devgui
	Checksum: 0x728F1881
	Offset: 0x10FF8
	Size: 0x1B8
	Parameters: 0
	Flags: None
*/
function init_debug_center_screen()
{
	/#
		waitframe(1);
		setdvar(#"debug_center_screen", 0);
		level flag::wait_till("");
		zero_idle_movement = 0;
		devgui_base = "";
		adddebugcommand(((devgui_base + "") + "") + "");
		for(;;)
		{
			if(getdvarint(#"debug_center_screen", 0))
			{
				if(!isdefined(level.center_screen_debug_hudelem_active) || level.center_screen_debug_hudelem_active == 0)
				{
					thread debug_center_screen();
					zero_idle_movement = getdvarint(#"zero_idle_movement", 0);
					if(zero_idle_movement == 0)
					{
						setdvar(#"zero_idle_movement", 1);
						zero_idle_movement = 1;
					}
				}
			}
			else
			{
				level notify(#"stop center screen debug");
				if(zero_idle_movement == 1)
				{
					setdvar(#"zero_idle_movement", 0);
					zero_idle_movement = 0;
				}
			}
			wait(0.5);
		}
	#/
}

/*
	Name: debug_center_screen
	Namespace: zm_devgui
	Checksum: 0xBD2FA076
	Offset: 0x111B8
	Size: 0x238
	Parameters: 0
	Flags: None
*/
function debug_center_screen()
{
	/#
		level.center_screen_debug_hudelem_active = 1;
		wait(0.1);
		level.center_screen_debug_hudelem1 = newdebughudelem(level.players[0]);
		level.center_screen_debug_hudelem1.alignx = "";
		level.center_screen_debug_hudelem1.aligny = "";
		level.center_screen_debug_hudelem1.fontscale = 1;
		level.center_screen_debug_hudelem1.alpha = 0.5;
		level.center_screen_debug_hudelem1.x = 320 - 1;
		level.center_screen_debug_hudelem1.y = 240;
		level.center_screen_debug_hudelem1 setshader("", 1000, 1);
		level.center_screen_debug_hudelem2 = newdebughudelem(level.players[0]);
		level.center_screen_debug_hudelem2.alignx = "";
		level.center_screen_debug_hudelem2.aligny = "";
		level.center_screen_debug_hudelem2.fontscale = 1;
		level.center_screen_debug_hudelem2.alpha = 0.5;
		level.center_screen_debug_hudelem2.x = 320 - 1;
		level.center_screen_debug_hudelem2.y = 240;
		level.center_screen_debug_hudelem2 setshader("", 1, 480);
		level waittill(#"stop center screen debug");
		level.center_screen_debug_hudelem1 destroy();
		level.center_screen_debug_hudelem2 destroy();
		level.center_screen_debug_hudelem_active = 0;
	#/
}

/*
	Name: function_b5d522f8
	Namespace: zm_devgui
	Checksum: 0xF14D2051
	Offset: 0x113F8
	Size: 0x270
	Parameters: 0
	Flags: None
*/
function function_b5d522f8()
{
	/#
		self notify("");
		self endon("");
		function_7c9dd642();
		setdvar(#"hash_46eec505e691414c", "");
		setdvar(#"hash_74f1952a0f93d08e", -1);
		while(true)
		{
			wait(0.1);
			var_9261da43 = getdvar(#"hash_46eec505e691414c", "");
			var_10acd4fa = getdvar(#"hash_74f1952a0f93d08e", -1);
			if(var_9261da43 == "" && var_10acd4fa == -1)
			{
				continue;
			}
			player = level.players[0];
			if(isplayer(player))
			{
				if(var_9261da43 != "")
				{
					args = strtok(var_9261da43, "");
					level zm_ui_inventory::function_7df6bb60(args[0], int(args[1]), player);
				}
				if(var_10acd4fa != -1)
				{
					if(var_10acd4fa > 0)
					{
						player zm_ui_inventory::function_d8f1d200(#"hash_336cbe1bb6ff213");
					}
					else
					{
						player zm_ui_inventory::function_d8f1d200(#"");
					}
				}
			}
			setdvar(#"hash_46eec505e691414c", "");
			setdvar(#"hash_74f1952a0f93d08e", -1);
		}
	#/
}

/*
	Name: function_7c9dd642
	Namespace: zm_devgui
	Checksum: 0x962EC109
	Offset: 0x11670
	Size: 0x21C
	Parameters: 0
	Flags: None
*/
function function_7c9dd642()
{
	/#
		while(!isdefined(level.var_a16c38d9))
		{
			wait(0.1);
		}
		path = "";
		cmd = "";
		keys = getarraykeys(level.var_a16c38d9);
		foreach(key in keys)
		{
			mapping = level.var_a16c38d9[key];
			num = pow(2, mapping.numbits);
			for(i = 0; i < num; i++)
			{
				cmdarg = (function_9e72a96(key) + "") + i;
				util::add_devgui(((path + function_9e72a96(key)) + "") + i, cmd + cmdarg);
			}
		}
		var_30a96cf9 = "";
		cmd = "";
		util::add_devgui(var_30a96cf9 + "", cmd + 1);
		util::add_devgui(var_30a96cf9 + "", cmd + 0);
	#/
}

/*
	Name: bunker_entrance_zoned
	Namespace: zm_devgui
	Checksum: 0x854182E9
	Offset: 0x11898
	Size: 0x3D2
	Parameters: 0
	Flags: None
*/
function bunker_entrance_zoned()
{
	/#
		self notify("");
		self endon("");
		if(getdvarint(#"hash_4cebb1d3b0ee545a", 0) == 0)
		{
			setdvar(#"hash_4cebb1d3b0ee545a", 1);
		}
		else
		{
			setdvar(#"hash_4cebb1d3b0ee545a", 0);
			return;
		}
		a_s_key = struct::get_array(1, "");
		a_e_all = getentitiesinradius((0, 0, 0), 640000);
		a_e_key = [];
		foreach(ent in a_e_all)
		{
			if(is_true(ent.var_61330f48))
			{
				array::add(a_e_key, ent);
			}
		}
		a_key = arraycombine(a_s_key, a_e_key, 0, 0);
		while(getdvarint(#"hash_4cebb1d3b0ee545a", 0))
		{
			foreach(key in a_key)
			{
				var_91d1913b = distance2d(level.players[0].origin, key.origin);
				n_radius = 0.015 * var_91d1913b;
				if(n_radius > 768)
				{
					n_radius = 768;
				}
				if(var_91d1913b > 64 && var_91d1913b < 2000)
				{
					v_color = (0, 0, 1);
					if(isdefined(key.targetname))
					{
						str_type = function_9e72a96(key.targetname);
					}
					else
					{
						if(isdefined(key.model))
						{
							str_type = function_9e72a96(key.model);
						}
						else
						{
							str_type = key.origin;
						}
					}
					sphere(key.origin, n_radius, v_color);
					print3d(key.origin + (0, 0, 24), str_type, v_color);
				}
			}
			waitframe(1);
		}
	#/
}

/*
	Name: function_1b531660
	Namespace: zm_devgui
	Checksum: 0xF92FC4CD
	Offset: 0x11C78
	Size: 0x94
	Parameters: 0
	Flags: None
*/
function function_1b531660()
{
	/#
		if(!isdefined(level.var_77e1430c))
		{
			level.var_77e1430c = 0;
		}
		level.var_77e1430c = !level.var_77e1430c;
		if(level.var_77e1430c)
		{
			callback::on_ai_damage(&function_e7321799);
		}
		else
		{
			callback::remove_on_ai_damage(&function_e7321799);
		}
	#/
}

/*
	Name: function_e7321799
	Namespace: zm_devgui
	Checksum: 0x9F2787CE
	Offset: 0x11D18
	Size: 0x10C
	Parameters: 1
	Flags: None
*/
function function_e7321799(params)
{
	/#
		damage = params.idamage;
		location = params.vpoint;
		target = self;
		smeansofdeath = params.smeansofdeath;
		if(smeansofdeath == "" || smeansofdeath == "")
		{
			location = self.origin + vectorscale((0, 0, 1), 60);
		}
		if(damage)
		{
			thread function_2cde0af9("" + damage, (1, 1, 1), location, (randomfloatrange(-1, 1), randomfloatrange(-1, 1), 2), 30);
		}
	#/
}

/*
	Name: function_2cde0af9
	Namespace: zm_devgui
	Checksum: 0x34F0A6A
	Offset: 0x11E30
	Size: 0xBE
	Parameters: 5
	Flags: None
*/
function function_2cde0af9(text, color, start, velocity, frames)
{
	/#
		location = start;
		alpha = 1;
		for(i = 0; i < frames; i++)
		{
			print3d(location, text, color, alpha, 0.6, 1);
			location = location + velocity;
			alpha = alpha - (1 / (frames * 2));
			waitframe(1);
		}
	#/
}

/*
	Name: function_1bb72156
	Namespace: zm_devgui
	Checksum: 0x7ED3D8D4
	Offset: 0x11EF8
	Size: 0x44
	Parameters: 0
	Flags: None
*/
function function_1bb72156()
{
	/#
		weapon = self getcurrentweapon();
		namespace_b376a999::function_96db9f3(weapon, 10000);
	#/
}

/*
	Name: function_f1be4492
	Namespace: zm_devgui
	Checksum: 0xE3FD88BC
	Offset: 0x11F48
	Size: 0x50
	Parameters: 1
	Flags: None
*/
function function_f1be4492(dvar)
{
	/#
		if(dvar.value)
		{
			level thread function_62e3e0a();
		}
		else
		{
			level notify(#"hash_49dd681f2dd51383");
		}
	#/
}

/*
	Name: function_62e3e0a
	Namespace: zm_devgui
	Checksum: 0x92DB9ED6
	Offset: 0x11FA0
	Size: 0x320
	Parameters: 0
	Flags: Private
*/
function private function_62e3e0a()
{
	/#
		self notify("");
		self endon("");
		level endon(#"hash_49dd681f2dd51383");
		while(!isdefined(level.zm_loc_types))
		{
			waitframe(1);
		}
		while(true)
		{
			waitframe(1);
			player = getplayers()[0];
			player_vec = vectornormalize(anglestoforward(player getplayerangles()));
			player_vec_2d = (player_vec[0], player_vec[1], 0);
			foreach(key, array in level.zm_loc_types)
			{
				color = (1, 1, 1);
				key_string = function_9e72a96(key);
				if(key == #"zombie_location")
				{
					color = (1, 0, 0);
				}
				foreach(spot in array)
				{
					player_spawn = vectornormalize(spot.origin - player.origin);
					player_spawn_2d = (player_spawn[0], player_spawn[1], 0);
					dot = vectordot(player_vec_2d, player_spawn_2d);
					dist = distance(spot.origin, player.origin);
					if(dot > 0.707 && dist <= getdvarint(#"scr_zombie_spawn_in_view_dist", 0))
					{
						color = (0, 1, 0);
					}
					debugstar(spot.origin, 1, color, key_string, 0.75);
				}
			}
		}
	#/
}

