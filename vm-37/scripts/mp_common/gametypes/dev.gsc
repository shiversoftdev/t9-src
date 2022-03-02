#using script_2255a7ad3edc838f;
#using script_269e356734524812;
#using script_3fda550bc6e1089a;
#using script_68d2ee1489345a1d;
#using script_6c8abe14025b47c4;
#using script_788472602edbe3b9;
#using script_7d712f77ab8d0c16;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\bots\bot_action.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\dev_shared.gsc;
#using scripts\core_common\killcam_shared.gsc;
#using scripts\core_common\perks.gsc;
#using scripts\core_common\potm_shared.gsc;
#using scripts\core_common\sound_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\mp_common\devgui.gsc;
#using scripts\mp_common\gametypes\dev_class.gsc;
#using scripts\mp_common\gametypes\globallogic.gsc;
#using scripts\mp_common\gametypes\globallogic_score.gsc;
#using scripts\mp_common\gametypes\globallogic_utils.gsc;
#using scripts\mp_common\util.gsc;

#namespace dev;

/*
	Name: function_89f2df9
	Namespace: dev
	Checksum: 0xDC1ABAF7
	Offset: 0x120
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	/#
		system::register(#"dev", &function_70a657d8, undefined, undefined, #"spawning_shared");
	#/
}

/*
	Name: function_70a657d8
	Namespace: dev
	Checksum: 0xF872FAC
	Offset: 0x178
	Size: 0x5C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	callback::on_start_gametype(&init);
	callback::on_connect(&on_player_connected);
	/#
		level.devongetormakebot = &getormakebot;
	#/
}

/*
	Name: init
	Namespace: dev
	Checksum: 0xACB9DFC3
	Offset: 0x1E0
	Size: 0x3A8
	Parameters: 0
	Flags: Linked
*/
function init()
{
	/#
		if(getdvarstring(#"scr_show_hq_spawns") == "")
		{
			setdvar(#"scr_show_hq_spawns", "");
		}
		if(!isdefined(getdvar(#"scr_testscriptruntimeerror")))
		{
			setdvar(#"scr_testscriptruntimeerror", "");
		}
		if(getdvarstring(#"hash_42bc2c660a3d2ecd") == "")
		{
			setdvar(#"hash_42bc2c660a3d2ecd", "");
		}
		thread testscriptruntimeerror();
		thread testdvars();
		thread addenemyheli();
		thread addtestcarepackage();
		thread devhelipathdebugdraw();
		thread devstraferunpathdebugdraw();
		thread dev_class::dev_cac_init();
		thread namespace_af53555a::function_d8049496();
		thread globallogic_score::setplayermomentumdebug();
		setdvar(#"scr_giveperk", "");
		setdvar(#"scr_forceevent", "");
		setdvar(#"scr_draw_triggers", 0);
		setdvar(#"hash_69042953f03fb8a4", "");
		thread engagement_distance_debug_toggle();
		thread equipment_dev_gui();
		thread grenade_dev_gui();
		setdvar(#"debug_dynamic_ai_spawning", 0);
		level.dem_spawns = [];
		if(level.gametype == "")
		{
			extra_spawns = [];
			extra_spawns[0] = "";
			extra_spawns[1] = "";
			extra_spawns[2] = "";
			extra_spawns[3] = "";
			for(i = 0; i < extra_spawns.size; i++)
			{
				points = getentarray(extra_spawns[i], "");
				if(isdefined(points) && points.size > 0)
				{
					level.dem_spawns = arraycombine(level.dem_spawns, points, 1, 0);
				}
			}
		}
		for(;;)
		{
			updatedevsettings();
			wait(0.5);
		}
	#/
}

/*
	Name: on_player_connected
	Namespace: dev
	Checksum: 0xCC42E85D
	Offset: 0x590
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function on_player_connected()
{
	/#
		if(is_true(level.devgui_unlimited_ammo))
		{
			wait(1);
			self thread devgui_unlimited_ammo();
		}
	#/
}

/*
	Name: updatehardpoints
	Namespace: dev
	Checksum: 0x623AC644
	Offset: 0x5E0
	Size: 0x3D8
	Parameters: 0
	Flags: None
*/
function updatehardpoints()
{
	/#
		foreach(streak in level.killstreaks)
		{
			dvar = streak.devdvar;
			enemydvar = streak.devenemydvar;
			host = util::gethostplayer();
			if(isdefined(dvar) && getdvarint(dvar, 0) == 1)
			{
				foreach(player in level.players)
				{
					if(is_true(level.usingmomentum) && is_true(level.usingscorestreaks))
					{
						player killstreaks::give(key);
						continue;
					}
					if(isbot(player))
					{
						player.bot[#"killstreaks"] = [];
						player.bot[#"killstreaks"][0] = killstreaks::get_menu_name(key);
						killstreakweapon = killstreaks::get_killstreak_weapon(key);
						player killstreaks::give_weapon(killstreakweapon, 1);
						globallogic_score::_setplayermomentum(player, 2000);
						continue;
					}
					player killstreaks::give(key);
				}
				setdvar(dvar, 0);
			}
			if(isdefined(enemydvar) && getdvarint(enemydvar, 0) == 1)
			{
				team = "";
				player = util::gethostplayer();
				if(isdefined(player.team))
				{
					team = util::getotherteam(player.team);
				}
				ent = getormakebot(team);
				if(!isdefined(ent))
				{
					println("");
					continue;
				}
				wait(1);
				if(isdefined(ent))
				{
					ent killstreaks::give(key);
					ent bot_action::function_d6318084(streak.weapon);
					ent bot_action::function_32020adf(3);
				}
				setdvar(enemydvar, 0);
			}
		}
	#/
}

/*
	Name: warpalltohost
	Namespace: dev
	Checksum: 0x46BBF599
	Offset: 0x9C0
	Size: 0x64
	Parameters: 1
	Flags: None
*/
function warpalltohost(team)
{
	/#
		host = util::gethostplayer();
		players = getplayers();
		function_30d59c86(team, host, players);
	#/
}

/*
	Name: warpalltoplayer
	Namespace: dev
	Checksum: 0x7EDF6A6C
	Offset: 0xA30
	Size: 0xA4
	Parameters: 2
	Flags: None
*/
function warpalltoplayer(team, player)
{
	/#
		players = getplayers();
		target = undefined;
		for(i = 0; i < players.size; i++)
		{
			if(players[i].name == player)
			{
				target = players[i];
				break;
			}
		}
		function_30d59c86(team, player, players);
	#/
}

/*
	Name: function_9758857b
	Namespace: dev
	Checksum: 0xD026C306
	Offset: 0xAE0
	Size: 0x3C
	Parameters: 0
	Flags: None
*/
function function_9758857b()
{
	/#
		host = util::gethostplayer();
		function_e8b29265(host);
	#/
}

/*
	Name: function_e8b29265
	Namespace: dev
	Checksum: 0xC25CB6E
	Offset: 0xB28
	Size: 0x15C
	Parameters: 1
	Flags: None
*/
function function_e8b29265(player)
{
	/#
		players = [];
		foreach(team in level.teams)
		{
			players_on_team = getplayers(team);
			foreach(person in players_on_team)
			{
				if(isalive(person))
				{
					players[players.size] = person;
					break;
				}
			}
		}
		function_30d59c86(undefined, player, players);
	#/
}

/*
	Name: function_30d59c86
	Namespace: dev
	Checksum: 0xF2A35586
	Offset: 0xC90
	Size: 0x40C
	Parameters: 3
	Flags: None
*/
function function_30d59c86(team, target, players)
{
	/#
		if(isdefined(target))
		{
			origin = target.origin;
			nodes = getnodesinradius(origin, 128, 32, 128, #"path");
			angles = target getplayerangles();
			yaw = (0, angles[1], 0);
			forward = anglestoforward(yaw);
			spawn_origin = (origin + (forward * 128)) + vectorscale((0, 0, 1), 16);
			spiral = undefined;
			if(!bullettracepassed(target geteye(), spawn_origin, 0, target))
			{
				spawn_origin = undefined;
			}
			else
			{
				spiral = function_a4ccb933(spawn_origin, angleclamp180(angles[1] + 180));
			}
			foreach(player in players)
			{
				if(player == target)
				{
					continue;
				}
				if(isdefined(team))
				{
					if(strstartswith(team, "") && target.team == player.team)
					{
						continue;
					}
					if(strstartswith(team, "") && target.team != player.team)
					{
						continue;
					}
				}
				goal = undefined;
				if(isdefined(spiral))
				{
					origin = function_98c05766(spiral);
					angle = function_4783f10c(spiral);
					function_df0b6f84(spiral);
					player setorigin(origin);
					player setplayerangles((0, angle, 0));
					goal = origin;
				}
				else
				{
					if(nodes.size > 0)
					{
						node = array::random(nodes);
						player setorigin(node.origin);
						goal = node;
					}
					else
					{
						player setorigin(origin);
						goal = origin;
					}
				}
				if(isdefined(goal) && isbot(player))
				{
					player setgoal(goal, 1);
				}
			}
		}
		setdvar(#"scr_playerwarp", "");
	#/
}

/*
	Name: updatedevsettingszm
	Namespace: dev
	Checksum: 0x1596C82
	Offset: 0x10A8
	Size: 0x424
	Parameters: 0
	Flags: None
*/
function updatedevsettingszm()
{
	/#
		if(level.players.size > 0)
		{
			if(getdvarint(#"r_streamdumpdistance", 0) == 3)
			{
				if(!isdefined(level.streamdumpteamindex))
				{
					level.streamdumpteamindex = 0;
				}
				else
				{
					level.streamdumpteamindex++;
				}
				numpoints = 0;
				spawnpoints = [];
				location = level.scr_zm_map_start_location;
				if(location == "" || location == "" && isdefined(level.default_start_location))
				{
					location = level.default_start_location;
				}
				match_string = (level.scr_zm_ui_gametype + "") + location;
				if(level.streamdumpteamindex < level.teams.size)
				{
					structs = struct::get_array("", "");
					if(isdefined(structs))
					{
						foreach(struct in structs)
						{
							if(isdefined(struct.script_string))
							{
								tokens = strtok(struct.script_string, "");
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
						spawnpoints = struct::get_array("", "");
					}
					if(isdefined(spawnpoints))
					{
						numpoints = spawnpoints.size;
					}
				}
				if(numpoints == 0)
				{
					setdvar(#"r_streamdumpdistance", 0);
					level.streamdumpteamindex = -1;
				}
				else
				{
					averageorigin = (0, 0, 0);
					averageangles = (0, 0, 0);
					foreach(spawnpoint in spawnpoints)
					{
						averageorigin = averageorigin + (spawnpoint.origin / numpoints);
						averageangles = averageangles + (spawnpoint.angles / numpoints);
					}
					level.players[0] setplayerangles(averageangles);
					level.players[0] setorigin(averageorigin);
					wait(5);
					setdvar(#"r_streamdumpdistance", 2);
				}
			}
		}
	#/
}

/*
	Name: updatedevsettings
	Namespace: dev
	Checksum: 0x27790F2A
	Offset: 0x14D8
	Size: 0x25EC
	Parameters: 0
	Flags: None
*/
function updatedevsettings()
{
	/#
		player = util::gethostplayer();
		updateminimapsetting();
		if(level.players.size > 0)
		{
			updatehardpoints();
			playerwarp_string = getdvarstring(#"scr_playerwarp");
			if(playerwarp_string == "")
			{
				warpalltohost();
			}
			else
			{
				if(playerwarp_string == "")
				{
					warpalltohost(playerwarp_string);
				}
				else
				{
					if(playerwarp_string == "")
					{
						warpalltohost(playerwarp_string);
					}
					else
					{
						if(playerwarp_string == "")
						{
							function_9758857b();
						}
						else
						{
							if(strstartswith(playerwarp_string, ""))
							{
								name = getsubstr(playerwarp_string, 8);
								warpalltoplayer(playerwarp_string, name);
							}
							else
							{
								if(strstartswith(playerwarp_string, ""))
								{
									name = getsubstr(playerwarp_string, 11);
									warpalltoplayer(playerwarp_string, name);
								}
								else
								{
									if(strstartswith(playerwarp_string, ""))
									{
										name = getsubstr(playerwarp_string, 4);
										warpalltoplayer(undefined, name);
									}
									else
									{
										if(playerwarp_string == "")
										{
											players = getplayers();
											setdvar(#"scr_playerwarp", "");
											if(!isdefined(level.devgui_start_spawn_index))
											{
												level.devgui_start_spawn_index = 0;
											}
											player = util::gethostplayer();
											spawns = level.spawn_start[player.pers[#"team"]];
											if(!isdefined(spawns) || spawns.size <= 0)
											{
												return;
											}
											for(i = 0; i < players.size; i++)
											{
												players[i] setorigin(spawns[level.devgui_start_spawn_index].origin);
												players[i] setplayerangles(spawns[level.devgui_start_spawn_index].angles);
											}
											level.devgui_start_spawn_index++;
											if(level.devgui_start_spawn_index >= spawns.size)
											{
												level.devgui_start_spawn_index = 0;
											}
										}
										else
										{
											if(playerwarp_string == "")
											{
												players = getplayers();
												setdvar(#"scr_playerwarp", "");
												if(!isdefined(level.devgui_start_spawn_index))
												{
													level.devgui_start_spawn_index = 0;
												}
												player = util::gethostplayer();
												spawns = level.spawn_start[player.pers[#"team"]];
												if(!isdefined(spawns) || spawns.size <= 0)
												{
													return;
												}
												for(i = 0; i < players.size; i++)
												{
													players[i] setorigin(spawns[level.devgui_start_spawn_index].origin);
													players[i] setplayerangles(spawns[level.devgui_start_spawn_index].angles);
												}
												level.devgui_start_spawn_index--;
												if(level.devgui_start_spawn_index < 0)
												{
													level.devgui_start_spawn_index = spawns.size - 1;
												}
											}
											else
											{
												if(playerwarp_string == "")
												{
													players = getplayers();
													setdvar(#"scr_playerwarp", "");
													if(!isdefined(level.devgui_spawn_index))
													{
														level.devgui_spawn_index = 0;
													}
													spawns = (isdefined(level.var_3da2623a) ? level.var_3da2623a : level.spawnpoints);
													spawns = arraycombine(spawns, level.dem_spawns, 1, 0);
													if(!isdefined(spawns) || spawns.size <= 0)
													{
														return;
													}
													for(i = 0; i < players.size; i++)
													{
														players[i] setorigin(spawns[level.devgui_spawn_index].origin);
														players[i] setplayerangles(spawns[level.devgui_spawn_index].angles);
													}
													level.devgui_spawn_index++;
													if(level.devgui_spawn_index >= spawns.size)
													{
														level.devgui_spawn_index = 0;
													}
												}
												else
												{
													if(playerwarp_string == "")
													{
														players = getplayers();
														setdvar(#"scr_playerwarp", "");
														if(!isdefined(level.devgui_spawn_index))
														{
															level.devgui_spawn_index = 0;
														}
														spawns = (isdefined(level.var_3da2623a) ? level.var_3da2623a : level.spawnpoints);
														spawns = arraycombine(spawns, level.dem_spawns, 1, 0);
														if(!isdefined(spawns) || spawns.size <= 0)
														{
															return;
														}
														for(i = 0; i < players.size; i++)
														{
															players[i] setorigin(spawns[level.devgui_spawn_index].origin);
															players[i] setplayerangles(spawns[level.devgui_spawn_index].angles);
														}
														level.devgui_spawn_index--;
														if(level.devgui_spawn_index < 0)
														{
															level.devgui_spawn_index = spawns.size - 1;
														}
													}
													else
													{
														if(getdvarstring(#"scr_devgui_spawn") != "")
														{
															player = util::gethostplayer();
															if(!isdefined(player.devgui_spawn_active))
															{
																player.devgui_spawn_active = 0;
															}
															if(!player.devgui_spawn_active)
															{
																iprintln("");
																iprintln("");
																player.devgui_spawn_active = 1;
																player thread spawning::devgui_spawn_think();
															}
															else
															{
																player notify(#"devgui_spawn_think");
																player.devgui_spawn_active = 0;
																player setactionslot(3, "");
															}
															setdvar(#"scr_devgui_spawn", "");
														}
														else
														{
															if(getdvarstring(#"hash_c9f8ff06a656024") != "")
															{
																if(!isdefined(level.var_31922da4))
																{
																	level.var_31922da4 = 0;
																}
																player = level.players[0];
																if(!level.var_31922da4)
																{
																	iprintln("");
																	iprintln("");
																	level.var_31922da4 = 1;
																	player thread spawning::function_48a6b85();
																}
																else
																{
																	level notify(#"hash_47f3d9a9e91670d1");
																	level.var_31922da4 = 0;
																	player setactionslot(3, "");
																}
																setdvar(#"hash_c9f8ff06a656024", "");
															}
															else
															{
																if(getdvarstring(#"scr_player_ammo") != "")
																{
																	players = getplayers();
																	if(!isdefined(level.devgui_unlimited_ammo))
																	{
																		level.devgui_unlimited_ammo = 1;
																	}
																	else
																	{
																		level.devgui_unlimited_ammo = !level.devgui_unlimited_ammo;
																	}
																	if(level.devgui_unlimited_ammo)
																	{
																		iprintln("");
																	}
																	else
																	{
																		iprintln("");
																	}
																	for(i = 0; i < players.size; i++)
																	{
																		if(level.devgui_unlimited_ammo)
																		{
																			players[i] thread devgui_unlimited_ammo();
																			continue;
																		}
																		players[i] notify(#"devgui_unlimited_ammo");
																	}
																	setdvar(#"scr_player_ammo", "");
																}
																else
																{
																	if(getdvarstring(#"scr_player_momentum") != "")
																	{
																		if(!isdefined(level.devgui_unlimited_momentum))
																		{
																			level.devgui_unlimited_momentum = 1;
																		}
																		else
																		{
																			level.devgui_unlimited_momentum = !level.devgui_unlimited_momentum;
																		}
																		if(level.devgui_unlimited_momentum)
																		{
																			iprintln("");
																			level thread devgui_unlimited_momentum();
																		}
																		else
																		{
																			iprintln("");
																			level notify(#"devgui_unlimited_momentum");
																		}
																		setdvar(#"scr_player_momentum", "");
																	}
																	else
																	{
																		if(getdvarstring(#"scr_give_player_score") != "")
																		{
																			level thread devgui_increase_momentum(getdvarint(#"scr_give_player_score", 0));
																			setdvar(#"scr_give_player_score", "");
																		}
																		else
																		{
																			if(getdvarstring(#"hash_7d7add0fb8d419c8") != "")
																			{
																				level thread function_e88bdbcf();
																				setdvar(#"hash_7d7add0fb8d419c8", "");
																			}
																			else
																			{
																				if(getdvarstring(#"scr_player_zero_ammo") != "")
																				{
																					players = getplayers();
																					for(i = 0; i < players.size; i++)
																					{
																						player = players[i];
																						weapons = player getweaponslist();
																						arrayremovevalue(weapons, level.weaponbasemelee);
																						for(j = 0; j < weapons.size; j++)
																						{
																							if(weapons[j] == level.weaponnone)
																							{
																								continue;
																							}
																							player setweaponammostock(weapons[j], 0);
																							player setweaponammoclip(weapons[j], 0);
																						}
																					}
																					setdvar(#"scr_player_zero_ammo", "");
																				}
																				else
																				{
																					if(getdvarstring(#"scr_emp_jammed") != "")
																					{
																						players = getplayers();
																						for(i = 0; i < players.size; i++)
																						{
																							player = players[i];
																							player setempjammed(getdvarint(#"scr_emp_jammed", 0));
																						}
																						setdvar(#"scr_emp_jammed", "");
																					}
																					else
																					{
																						if(getdvarstring(#"scr_round_pause") != "")
																						{
																							if(!level.timerstopped)
																							{
																								iprintln("");
																								globallogic_utils::pausetimer();
																							}
																							else
																							{
																								iprintln("");
																								globallogic_utils::resumetimer();
																							}
																							setdvar(#"scr_round_pause", "");
																						}
																						else
																						{
																							if(getdvarstring(#"scr_round_end") != "")
																							{
																								level globallogic::forceend();
																								setdvar(#"scr_round_end", "");
																							}
																							else
																							{
																								if(getdvarint(#"scr_health_debug", 0))
																								{
																									players = getplayers();
																									host = util::gethostplayer();
																									if(!isdefined(host.devgui_health_debug))
																									{
																										host.devgui_health_debug = 0;
																									}
																									if(host.devgui_health_debug)
																									{
																										host.devgui_health_debug = 0;
																										for(i = 0; i < players.size; i++)
																										{
																											players[i] notify(#"devgui_health_debug");
																											if(isdefined(players[i].debug_health_bar))
																											{
																												players[i].debug_health_bar destroy();
																												players[i].debug_health_text destroy();
																												players[i].debug_health_bar = undefined;
																												players[i].debug_health_text = undefined;
																											}
																										}
																									}
																									else
																									{
																										host.devgui_health_debug = 1;
																										for(i = 0; i < players.size; i++)
																										{
																											players[i] thread devgui_health_debug();
																										}
																									}
																									setdvar(#"scr_health_debug", 0);
																								}
																								else if(getdvarstring(#"scr_show_hq_spawns") != "")
																								{
																									if(!isdefined(level.devgui_show_hq))
																									{
																										level.devgui_show_hq = 0;
																									}
																									if(level.gametype == "" && isdefined(level.radios))
																									{
																										if(!level.devgui_show_hq)
																										{
																											for(i = 0; i < level.radios.size; i++)
																											{
																												color = (1, 0, 0);
																												level namespace_af53555a::showonespawnpoint(level.radios[i], color, "", 32, "");
																											}
																										}
																										else
																										{
																											level notify(#"hide_hq_points");
																										}
																										level.devgui_show_hq = !level.devgui_show_hq;
																									}
																									setdvar(#"scr_show_hq_spawns", "");
																								}
																							}
																						}
																					}
																				}
																			}
																		}
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
			if(getdvarint(#"r_streamdumpdistance", 0) == 3)
			{
				if(!isdefined(level.streamdumpteamindex))
				{
					level.streamdumpteamindex = 0;
				}
				else
				{
					level.streamdumpteamindex++;
				}
				numpoints = 0;
				if(level.streamdumpteamindex < level.teams.size)
				{
					teamname = getarraykeys(level.teams)[level.streamdumpteamindex];
					if(isdefined(level.spawn_start[teamname]))
					{
						numpoints = level.spawn_start[teamname].size;
					}
				}
				if(numpoints == 0)
				{
					setdvar(#"r_streamdumpdistance", 0);
					level.streamdumpteamindex = -1;
				}
				else
				{
					averageorigin = (0, 0, 0);
					averageangles = (0, 0, 0);
					foreach(spawnpoint in level.spawn_start[teamname])
					{
						averageorigin = averageorigin + (spawnpoint.origin / numpoints);
						averageangles = averageangles + (spawnpoint.angles / numpoints);
					}
					level.players[0] setplayerangles(averageangles);
					level.players[0] setorigin(averageorigin);
					wait(5);
					setdvar(#"r_streamdumpdistance", 2);
				}
			}
		}
		if(getdvarstring(#"scr_giveperk") == "")
		{
			players = getplayers();
			iprintln("");
			for(i = 0; i < players.size; i++)
			{
				players[i] clearperks();
				players[i].extraperks = undefined;
			}
			setdvar(#"scr_giveperk", "");
		}
		if(getdvarstring(#"scr_giveperk") != "")
		{
			perk = getdvarstring(#"scr_giveperk");
			specialties = strtok(perk, "");
			players = getplayers();
			iprintln(("" + perk) + "");
			for(i = 0; i < players.size; i++)
			{
				for(j = 0; j < specialties.size; j++)
				{
					players[i] perks::function_7637bafa(specialties[j]);
					players[i].extraperks[specialties[j]] = 1;
				}
			}
			setdvar(#"scr_giveperk", "");
		}
		if(getdvarstring(#"hash_2d9131ec76baa766") == "")
		{
			players = getplayers();
			iprintln("");
			foreach(player in players)
			{
				if(!isdefined(player))
				{
					continue;
				}
				player function_e6f9e3cd();
				player loadout::function_3d16577a(player.team, player.curclass);
			}
			setdvar(#"hash_2d9131ec76baa766", "");
		}
		if(getdvarstring(#"hash_2d9131ec76baa766") != "")
		{
			talentname = getdvarstring(#"hash_2d9131ec76baa766");
			var_2fe3f7e3 = hash(talentname);
			players = getplayers();
			iprintln(("" + talentname) + "");
			foreach(player in players)
			{
				if(!isdefined(player))
				{
					continue;
				}
				player function_b5feff95(var_2fe3f7e3);
				player loadout::function_3d16577a(player.team, player.curclass);
			}
			setdvar(#"hash_2d9131ec76baa766", "");
		}
		if(getdvarstring(#"hash_5b311cf6da67afb") == "")
		{
			players = getplayers();
			iprintln("");
			foreach(player in players)
			{
				if(!isdefined(player))
				{
					continue;
				}
				player function_e6f9e3cd();
				player loadout::function_3d16577a(player.team, player.curclass);
			}
			setdvar(#"hash_5b311cf6da67afb", "");
		}
		if(getdvarstring(#"hash_5b311cf6da67afb") != "")
		{
			talentname = getdvarstring(#"hash_5b311cf6da67afb");
			var_2fe3f7e3 = hash(talentname);
			players = getplayers();
			iprintln(("" + talentname) + "");
			foreach(player in players)
			{
				if(!isdefined(player))
				{
					continue;
				}
				player function_b5feff95(var_2fe3f7e3);
				player loadout::function_3d16577a(player.team, player.curclass);
			}
			setdvar(#"hash_5b311cf6da67afb", "");
		}
		if(getdvarstring(#"scr_forcegrenade") != "")
		{
			force_grenade_throw(getweapon(getdvarstring(#"scr_forcegrenade")));
			setdvar(#"scr_forcegrenade", "");
		}
		if(getdvarstring(#"scr_forceevent") != "")
		{
			event = getdvarstring(#"scr_forceevent");
			player = util::gethostplayer();
			forward = anglestoforward(player.angles);
			right = anglestoright(player.angles);
			if(event == "")
			{
				player dodamage(1, player.origin + forward);
			}
			else
			{
				if(event == "")
				{
					player dodamage(1, player.origin - forward);
				}
				else
				{
					if(event == "")
					{
						player dodamage(1, player.origin - right);
					}
					else if(event == "")
					{
						player dodamage(1, player.origin + right);
					}
				}
			}
			setdvar(#"scr_forceevent", "");
		}
		if(getdvarstring(#"scr_takeperk") != "")
		{
			perk = getdvarstring(#"scr_takeperk");
			for(i = 0; i < level.players.size; i++)
			{
				level.players[i] perks::function_45d12554(perk);
				level.players[i].extraperks[perk] = undefined;
			}
			setdvar(#"scr_takeperk", "");
		}
		if(getdvarstring(#"scr_x_kills_y") != "")
		{
			nametokens = strtok(getdvarstring(#"scr_x_kills_y"), "");
			if(nametokens.size > 1)
			{
				thread xkillsy(nametokens[0], nametokens[1]);
			}
			setdvar(#"scr_x_kills_y", "");
		}
		if(getdvarstring(#"scr_usedogs") != "")
		{
			ownername = getdvarstring(#"scr_usedogs");
			setdvar(#"scr_usedogs", "");
			owner = undefined;
			for(index = 0; index < level.players.size; index++)
			{
				if(level.players[index].name == ownername)
				{
					owner = level.players[index];
				}
			}
			if(isdefined(owner))
			{
				owner killstreaks::trigger_killstreak("");
			}
		}
		if(getdvarstring(#"scr_entdebug") != "")
		{
			ents = getentarray();
			level.entarray = [];
			level.entcounts = [];
			level.entgroups = [];
			for(index = 0; index < ents.size; index++)
			{
				classname = ents[index].classname;
				if(!issubstr(classname, ""))
				{
					curent = ents[index];
					level.entarray[level.entarray.size] = curent;
					if(!isdefined(level.entcounts[classname]))
					{
						level.entcounts[classname] = 0;
					}
					level.entcounts[classname]++;
					if(!isdefined(level.entgroups[classname]))
					{
						level.entgroups[classname] = [];
					}
					level.entgroups[classname][level.entgroups[classname].size] = curent;
				}
			}
		}
		if(getdvarint(#"debug_dynamic_ai_spawning", 0) && !isdefined(level.larry))
		{
			thread larry_thread();
		}
		else if(!getdvarint(#"debug_dynamic_ai_spawning", 0))
		{
			level notify(#"kill_larry");
		}
		if(getdvarint(#"scr_force_finalkillcam", 0) == 1)
		{
			level thread killcam::do_final_killcam();
			level thread waitthennotifyfinalkillcam();
		}
		if(getdvarint(#"scr_force_roundkillcam", 0) == 1)
		{
			level thread killcam::do_final_killcam();
			level thread waitthennotifyroundkillcam();
		}
		potm::debugupdate();
	#/
}

/*
	Name: waitthennotifyroundkillcam
	Namespace: dev
	Checksum: 0x66B80A2
	Offset: 0x3AD0
	Size: 0x44
	Parameters: 0
	Flags: None
*/
function waitthennotifyroundkillcam()
{
	/#
		waitframe(1);
		level notify(#"play_final_killcam");
		setdvar(#"scr_force_roundkillcam", 0);
	#/
}

/*
	Name: waitthennotifyfinalkillcam
	Namespace: dev
	Checksum: 0xE4BDB450
	Offset: 0x3B20
	Size: 0x4C
	Parameters: 0
	Flags: None
*/
function waitthennotifyfinalkillcam()
{
	/#
		waitframe(1);
		level notify(#"play_final_killcam");
		waitframe(1);
		setdvar(#"scr_force_finalkillcam", 0);
	#/
}

/*
	Name: devgui_unlimited_ammo
	Namespace: dev
	Checksum: 0xCB3F079B
	Offset: 0x3B78
	Size: 0x1D0
	Parameters: 0
	Flags: None
*/
function devgui_unlimited_ammo()
{
	/#
		if(!isdefined(self))
		{
			return;
		}
		self notify(#"devgui_unlimited_ammo");
		self endon(#"devgui_unlimited_ammo");
		self endon(#"disconnect");
		for(;;)
		{
			wait(1);
			if(!isdefined(self) || !isalive(self))
			{
				continue;
			}
			primary_weapons = self getweaponslistprimaries();
			offhand_weapons_and_alts = array::exclude(self getweaponslist(1), primary_weapons);
			weapons = arraycombine(primary_weapons, offhand_weapons_and_alts, 0, 0);
			arrayremovevalue(weapons, level.weaponbasemelee);
			for(i = 0; i < weapons.size; i++)
			{
				weapon = weapons[i];
				if(weapon == level.weaponnone)
				{
					continue;
				}
				if(killstreaks::is_killstreak_weapon(weapon))
				{
					continue;
				}
				if(weapon.iscliponly)
				{
					continue;
				}
				if(self getfractionmaxammo(weapon) == 1)
				{
					continue;
				}
				self givemaxammo(weapon);
			}
		}
	#/
}

/*
	Name: devgui_unlimited_momentum
	Namespace: dev
	Checksum: 0xE6CF5E1
	Offset: 0x3D50
	Size: 0x11C
	Parameters: 0
	Flags: None
*/
function devgui_unlimited_momentum()
{
	/#
		level notify(#"devgui_unlimited_momentum");
		level endon(#"devgui_unlimited_momentum");
		for(;;)
		{
			wait(1);
			players = getplayers();
			foreach(player in players)
			{
				if(!isdefined(player))
				{
					continue;
				}
				if(!isalive(player))
				{
					continue;
				}
				if(player.sessionstate != "")
				{
					continue;
				}
				globallogic_score::_setplayermomentum(player, 5000);
			}
		}
	#/
}

/*
	Name: devgui_increase_momentum
	Namespace: dev
	Checksum: 0xB8C55E4F
	Offset: 0x3E78
	Size: 0x100
	Parameters: 1
	Flags: None
*/
function devgui_increase_momentum(score)
{
	/#
		players = getplayers();
		foreach(player in players)
		{
			if(!isdefined(player))
			{
				continue;
			}
			if(!isalive(player))
			{
				continue;
			}
			if(player.sessionstate != "")
			{
				continue;
			}
			player globallogic_score::giveplayermomentumnotification(score, #"kill", "");
		}
	#/
}

/*
	Name: function_e88bdbcf
	Namespace: dev
	Checksum: 0xC7A6D853
	Offset: 0x3F80
	Size: 0xE8
	Parameters: 1
	Flags: None
*/
function function_e88bdbcf(score)
{
	/#
		players = getplayers();
		foreach(player in players)
		{
			if(isdefined(player) && isalive(player) && player.sessionstate == "")
			{
				player globallogic_score::function_49c10afe();
			}
		}
	#/
}

/*
	Name: devgui_health_debug
	Namespace: dev
	Checksum: 0x191A2AE4
	Offset: 0x4070
	Size: 0x320
	Parameters: 0
	Flags: None
*/
function devgui_health_debug()
{
	/#
		self notify(#"devgui_health_debug");
		self endon(#"devgui_health_debug");
		self endon(#"disconnect");
		x = 80;
		y = 40;
		self.debug_health_bar = newdebughudelem(self);
		self.debug_health_bar.x = x + 80;
		self.debug_health_bar.y = y + 2;
		self.debug_health_bar.alignx = "";
		self.debug_health_bar.aligny = "";
		self.debug_health_bar.horzalign = "";
		self.debug_health_bar.vertalign = "";
		self.debug_health_bar.alpha = 1;
		self.debug_health_bar.foreground = 1;
		self.debug_health_bar setshader(#"black", 1, 8);
		self.debug_health_text = newdebughudelem(self);
		self.debug_health_text.x = x + 80;
		self.debug_health_text.y = y;
		self.debug_health_text.alignx = "";
		self.debug_health_text.aligny = "";
		self.debug_health_text.horzalign = "";
		self.debug_health_text.vertalign = "";
		self.debug_health_text.alpha = 1;
		self.debug_health_text.fontscale = 1;
		self.debug_health_text.foreground = 1;
		if(!isdefined(self.maxhealth) || self.maxhealth <= 0)
		{
			self.maxhealth = 100;
		}
		for(;;)
		{
			waitframe(1);
			width = (self.health / self.maxhealth) * 300;
			width = int(max(width, 1));
			self.debug_health_bar setshader(#"black", width, 8);
			self.debug_health_text setvalue(self.health);
		}
	#/
}

/*
	Name: giveextraperks
	Namespace: dev
	Checksum: 0xDA0EACE5
	Offset: 0x4398
	Size: 0xAC
	Parameters: 0
	Flags: None
*/
function giveextraperks()
{
	/#
		if(!isdefined(self.extraperks))
		{
			return;
		}
		perks = getarraykeys(self.extraperks);
		for(i = 0; i < perks.size; i++)
		{
			/#
				println(((("" + self.name) + "") + perks[i]) + "");
			#/
			self perks::function_7637bafa(perks[i]);
		}
	#/
}

/*
	Name: xkillsy
	Namespace: dev
	Checksum: 0xC85480E9
	Offset: 0x4450
	Size: 0x148
	Parameters: 2
	Flags: None
*/
function xkillsy(attackername, victimname)
{
	/#
		attacker = undefined;
		victim = undefined;
		for(index = 0; index < level.players.size; index++)
		{
			if(level.players[index].name == attackername)
			{
				attacker = level.players[index];
				continue;
			}
			if(level.players[index].name == victimname)
			{
				victim = level.players[index];
			}
		}
		if(!isalive(attacker) || !isalive(victim))
		{
			return;
		}
		victim thread [[level.callbackplayerdamage]](attacker, attacker, 1000, 0, "", level.weaponnone, (0, 0, 0), (0, 0, 0), "", (0, 0, 0), 0, 0, (1, 0, 0));
	#/
}

/*
	Name: testscriptruntimeerrorassert
	Namespace: dev
	Checksum: 0xA8DC3FA2
	Offset: 0x45A0
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
	Name: testscriptruntimeassertmsgassert
	Namespace: dev
	Checksum: 0x5F2F55A7
	Offset: 0x45D0
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function testscriptruntimeassertmsgassert()
{
	/#
		wait(1);
		/#
			assertmsg("");
		#/
	#/
}

/*
	Name: testscriptruntimeerrormsgassert
	Namespace: dev
	Checksum: 0x4ADD38A0
	Offset: 0x4608
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function testscriptruntimeerrormsgassert()
{
	/#
		wait(1);
		/#
			errormsg("");
		#/
	#/
}

/*
	Name: testscriptruntimeerror2
	Namespace: dev
	Checksum: 0x2A89042D
	Offset: 0x4640
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
	Namespace: dev
	Checksum: 0xA482FF11
	Offset: 0x4690
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
	Namespace: dev
	Checksum: 0xA43B7B68
	Offset: 0x46B8
	Size: 0x12C
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
			if(myerror == "")
			{
				testscriptruntimeassertmsgassert();
			}
			else
			{
				if(myerror == "")
				{
					testscriptruntimeerrormsgassert();
				}
				else
				{
					testscriptruntimeerror1();
				}
			}
		}
		thread testscriptruntimeerror();
	#/
}

/*
	Name: testdvars
	Namespace: dev
	Checksum: 0x5E4683DD
	Offset: 0x47F0
	Size: 0xFC
	Parameters: 0
	Flags: None
*/
function testdvars()
{
	/#
		wait(5);
		for(;;)
		{
			if(getdvarstring(#"scr_testdvar") != "")
			{
				break;
			}
			wait(1);
		}
		tokens = strtok(getdvarstring(#"scr_testdvar"), "");
		dvarname = tokens[0];
		dvarvalue = tokens[1];
		setdvar(dvarname, dvarvalue);
		setdvar(#"scr_testdvar", "");
		thread testdvars();
	#/
}

/*
	Name: addenemyheli
	Namespace: dev
	Checksum: 0x6FE69B8A
	Offset: 0x48F8
	Size: 0x22C
	Parameters: 0
	Flags: None
*/
function addenemyheli()
{
	/#
		wait(5);
		for(;;)
		{
			if(getdvarint(#"scr_spawnenemyheli", 0) > 0)
			{
				break;
			}
			wait(1);
		}
		enemyheli = getdvarint(#"scr_spawnenemyheli", 0);
		setdvar(#"scr_spawnenemyheli", 0);
		team = "";
		player = util::gethostplayer();
		if(isdefined(player.pers[#"team"]))
		{
			team = util::getotherteam(player.pers[#"team"]);
		}
		ent = getormakebot(team);
		if(!isdefined(ent))
		{
			println("");
			wait(1);
			thread addenemyheli();
			return;
		}
		switch(enemyheli)
		{
			case 1:
			{
				level.helilocation = ent.origin;
				ent thread helicopter::usekillstreakhelicopter("");
				wait(0.5);
				ent notify(#"confirm_location", {#position:level.helilocation});
				break;
			}
			case 2:
			{
				break;
			}
		}
		thread addenemyheli();
	#/
}

/*
	Name: getormakebot
	Namespace: dev
	Checksum: 0x2804A840
	Offset: 0x4B30
	Size: 0xF6
	Parameters: 1
	Flags: None
*/
function getormakebot(team)
{
	/#
		for(i = 0; i < level.players.size; i++)
		{
			if(level.players[i].team == team)
			{
				if(isbot(level.players[i]))
				{
					return level.players[i];
				}
			}
		}
		ent = bot::add_bot(team);
		if(isdefined(ent))
		{
			sound::play_on_players("");
			ent waittill(#"spawned_player");
			ent.ignoreall = 1;
		}
		return ent;
	#/
}

/*
	Name: addtestcarepackage
	Namespace: dev
	Checksum: 0xFC21FC4
	Offset: 0x4C30
	Size: 0x8
	Parameters: 0
	Flags: None
*/
function addtestcarepackage()
{
	/#
	#/
}

/*
	Name: print3duntilnotified
	Namespace: dev
	Checksum: 0x9587DBC7
	Offset: 0x4C40
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
	Namespace: dev
	Checksum: 0xF8182918
	Offset: 0x4CB8
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
	Name: engagement_distance_debug_toggle
	Namespace: dev
	Checksum: 0xC0BABE9D
	Offset: 0x4D28
	Size: 0x184
	Parameters: 0
	Flags: None
*/
function engagement_distance_debug_toggle()
{
	/#
		level endon(#"kill_engage_dist_debug_toggle_watcher");
		if(!isdefined(getdvarint(#"debug_engage_dists", 0)))
		{
			setdvar(#"debug_engage_dists", 0);
		}
		laststate = getdvarint(#"debug_engage_dists", 0);
		while(true)
		{
			currentstate = getdvarint(#"debug_engage_dists", 0);
			if(dvar_turned_on(currentstate) && !dvar_turned_on(laststate))
			{
				weapon_engage_dists_init();
				thread debug_realtime_engage_dist();
				laststate = currentstate;
			}
			else if(!dvar_turned_on(currentstate) && dvar_turned_on(laststate))
			{
				level notify(#"kill_all_engage_dist_debug");
				laststate = currentstate;
			}
			wait(0.3);
		}
	#/
}

/*
	Name: dvar_turned_on
	Namespace: dev
	Checksum: 0x8D640989
	Offset: 0x4EB8
	Size: 0x28
	Parameters: 1
	Flags: None
*/
function dvar_turned_on(val)
{
	/#
		if(val <= 0)
		{
			return false;
		}
		return true;
	#/
}

/*
	Name: engagement_distance_debug_init
	Namespace: dev
	Checksum: 0x904F9406
	Offset: 0x4EF0
	Size: 0x3D0
	Parameters: 0
	Flags: None
*/
function engagement_distance_debug_init()
{
	/#
		level.debug_xpos = -50;
		level.debug_ypos = 250;
		level.debug_yinc = 18;
		level.debug_fontscale = 1.5;
		level.white = (1, 1, 1);
		level.green = (0, 1, 0);
		level.yellow = (1, 1, 0);
		level.red = (1, 0, 0);
		level.realtimeengagedist = newdebughudelem();
		level.realtimeengagedist.alignx = "";
		level.realtimeengagedist.fontscale = level.debug_fontscale;
		level.realtimeengagedist.x = level.debug_xpos;
		level.realtimeengagedist.y = level.debug_ypos;
		level.realtimeengagedist.color = level.white;
		level.realtimeengagedist settext("");
		xpos = level.debug_xpos + 245;
		level.realtimeengagedist_value = newdebughudelem();
		level.realtimeengagedist_value.alignx = "";
		level.realtimeengagedist_value.fontscale = level.debug_fontscale;
		level.realtimeengagedist_value.x = xpos;
		level.realtimeengagedist_value.y = level.debug_ypos;
		level.realtimeengagedist_value.color = level.white;
		level.realtimeengagedist_value setvalue(0);
		xpos = xpos + 37;
		level.realtimeengagedist_middle = newdebughudelem();
		level.realtimeengagedist_middle.alignx = "";
		level.realtimeengagedist_middle.fontscale = level.debug_fontscale;
		level.realtimeengagedist_middle.x = xpos;
		level.realtimeengagedist_middle.y = level.debug_ypos;
		level.realtimeengagedist_middle.color = level.white;
		level.realtimeengagedist_middle settext("");
		xpos = xpos + 105;
		level.realtimeengagedist_offvalue = newdebughudelem();
		level.realtimeengagedist_offvalue.alignx = "";
		level.realtimeengagedist_offvalue.fontscale = level.debug_fontscale;
		level.realtimeengagedist_offvalue.x = xpos;
		level.realtimeengagedist_offvalue.y = level.debug_ypos;
		level.realtimeengagedist_offvalue.color = level.white;
		level.realtimeengagedist_offvalue setvalue(0);
		hudobjarray = [];
		hudobjarray[0] = level.realtimeengagedist;
		hudobjarray[1] = level.realtimeengagedist_value;
		hudobjarray[2] = level.realtimeengagedist_middle;
		hudobjarray[3] = level.realtimeengagedist_offvalue;
		return hudobjarray;
	#/
}

/*
	Name: engage_dist_debug_hud_destroy
	Namespace: dev
	Checksum: 0x8311C8C7
	Offset: 0x52D0
	Size: 0x5C
	Parameters: 2
	Flags: None
*/
function engage_dist_debug_hud_destroy(hudarray, killnotify)
{
	/#
		level waittill(killnotify);
		for(i = 0; i < hudarray.size; i++)
		{
			hudarray[i] destroy();
		}
	#/
}

/*
	Name: weapon_engage_dists_init
	Namespace: dev
	Checksum: 0xEDB45A48
	Offset: 0x5338
	Size: 0x684
	Parameters: 0
	Flags: None
*/
function weapon_engage_dists_init()
{
	/#
		level.engagedists = [];
		genericpistol = spawnstruct();
		genericpistol.engagedistmin = 125;
		genericpistol.engagedistoptimal = 225;
		genericpistol.engagedistmulligan = 50;
		genericpistol.engagedistmax = 400;
		shotty = spawnstruct();
		shotty.engagedistmin = 50;
		shotty.engagedistoptimal = 200;
		shotty.engagedistmulligan = 75;
		shotty.engagedistmax = 350;
		genericsmg = spawnstruct();
		genericsmg.engagedistmin = 100;
		genericsmg.engagedistoptimal = 275;
		genericsmg.engagedistmulligan = 100;
		genericsmg.engagedistmax = 500;
		genericlmg = spawnstruct();
		genericlmg.engagedistmin = 325;
		genericlmg.engagedistoptimal = 550;
		genericlmg.engagedistmulligan = 150;
		genericlmg.engagedistmax = 850;
		genericriflesa = spawnstruct();
		genericriflesa.engagedistmin = 325;
		genericriflesa.engagedistoptimal = 550;
		genericriflesa.engagedistmulligan = 150;
		genericriflesa.engagedistmax = 850;
		genericriflebolt = spawnstruct();
		genericriflebolt.engagedistmin = 350;
		genericriflebolt.engagedistoptimal = 600;
		genericriflebolt.engagedistmulligan = 150;
		genericriflebolt.engagedistmax = 900;
		generichmg = spawnstruct();
		generichmg.engagedistmin = 390;
		generichmg.engagedistoptimal = 600;
		generichmg.engagedistmulligan = 100;
		generichmg.engagedistmax = 900;
		genericsniper = spawnstruct();
		genericsniper.engagedistmin = 950;
		genericsniper.engagedistoptimal = 1700;
		genericsniper.engagedistmulligan = 300;
		genericsniper.engagedistmax = 3000;
		engage_dists_add("", genericpistol);
		engage_dists_add("", genericpistol);
		engage_dists_add("", genericpistol);
		engage_dists_add("", genericpistol);
		engage_dists_add("", genericsmg);
		engage_dists_add("", genericsmg);
		engage_dists_add("", genericsmg);
		engage_dists_add("", genericsmg);
		engage_dists_add("", genericsmg);
		engage_dists_add("", genericsmg);
		engage_dists_add("", genericsmg);
		engage_dists_add("", shotty);
		engage_dists_add("", genericlmg);
		engage_dists_add("", genericlmg);
		engage_dists_add("", genericlmg);
		engage_dists_add("", genericlmg);
		engage_dists_add("", genericlmg);
		engage_dists_add("", genericlmg);
		engage_dists_add("", genericlmg);
		engage_dists_add("", genericlmg);
		engage_dists_add("", genericlmg);
		engage_dists_add("", genericlmg);
		engage_dists_add("", genericriflesa);
		engage_dists_add("", genericriflesa);
		engage_dists_add("", genericriflesa);
		engage_dists_add("", genericriflesa);
		engage_dists_add("", genericriflebolt);
		engage_dists_add("", genericriflebolt);
		engage_dists_add("", genericriflebolt);
		engage_dists_add("", genericriflebolt);
		engage_dists_add("", genericriflebolt);
		engage_dists_add("", generichmg);
		engage_dists_add("", generichmg);
		engage_dists_add("", generichmg);
		engage_dists_add("", generichmg);
		engage_dists_add("", genericsniper);
		engage_dists_add("", genericsniper);
		engage_dists_add("", genericsniper);
		engage_dists_add("", genericsniper);
		engage_dists_add("", genericsniper);
		engage_dists_add("", genericsniper);
		level thread engage_dists_watcher();
	#/
}

/*
	Name: engage_dists_add
	Namespace: dev
	Checksum: 0xB35DC6D8
	Offset: 0x59C8
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function engage_dists_add(weaponname, values)
{
	/#
		level.engagedists[getweapon(weaponname)] = values;
	#/
}

/*
	Name: get_engage_dists
	Namespace: dev
	Checksum: 0x27F7B4F3
	Offset: 0x5A10
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function get_engage_dists(weapon)
{
	/#
		if(isdefined(level.engagedists[weapon]))
		{
			return level.engagedists[weapon];
		}
		return undefined;
	#/
}

/*
	Name: engage_dists_watcher
	Namespace: dev
	Checksum: 0x23859A33
	Offset: 0x5A58
	Size: 0x108
	Parameters: 0
	Flags: None
*/
function engage_dists_watcher()
{
	/#
		level endon(#"kill_all_engage_dist_debug");
		level endon(#"kill_engage_dists_watcher");
		while(true)
		{
			player = util::gethostplayer();
			playerweapon = player getcurrentweapon();
			if(!isdefined(player.lastweapon))
			{
				player.lastweapon = playerweapon;
			}
			else if(player.lastweapon == playerweapon)
			{
				waitframe(1);
				continue;
			}
			values = get_engage_dists(playerweapon);
			if(isdefined(values))
			{
				level.weaponengagedistvalues = values;
			}
			else
			{
				level.weaponengagedistvalues = undefined;
			}
			player.lastweapon = playerweapon;
			waitframe(1);
		}
	#/
}

/*
	Name: debug_realtime_engage_dist
	Namespace: dev
	Checksum: 0xEAF617F4
	Offset: 0x5B68
	Size: 0x466
	Parameters: 0
	Flags: None
*/
function debug_realtime_engage_dist()
{
	/#
		level endon(#"kill_all_engage_dist_debug");
		level endon(#"kill_realtime_engagement_distance_debug");
		hudobjarray = engagement_distance_debug_init();
		level thread engage_dist_debug_hud_destroy(hudobjarray, "");
		level.debugrtengagedistcolor = level.green;
		player = util::gethostplayer();
		while(true)
		{
			lasttracepos = (0, 0, 0);
			direction = player getplayerangles();
			direction_vec = anglestoforward(direction);
			eye = player geteye();
			eye = (eye[0], eye[1], eye[2] + 20);
			trace = bullettrace(eye, eye + vectorscale(direction_vec, 100000), 1, player);
			tracepoint = trace[#"position"];
			tracenormal = trace[#"normal"];
			tracedist = int(distance(eye, tracepoint));
			if(tracepoint != lasttracepos)
			{
				lasttracepos = tracepoint;
				if(!isdefined(level.weaponengagedistvalues))
				{
					hudobj_changecolor(hudobjarray, level.white);
					hudobjarray engagedist_hud_changetext("", tracedist);
				}
				else
				{
					engagedistmin = level.weaponengagedistvalues.engagedistmin;
					engagedistoptimal = level.weaponengagedistvalues.engagedistoptimal;
					engagedistmulligan = level.weaponengagedistvalues.engagedistmulligan;
					engagedistmax = level.weaponengagedistvalues.engagedistmax;
					if(tracedist >= engagedistmin && tracedist <= engagedistmax)
					{
						if(tracedist >= (engagedistoptimal - engagedistmulligan) && tracedist <= (engagedistoptimal + engagedistmulligan))
						{
							hudobjarray engagedist_hud_changetext("", tracedist);
							hudobj_changecolor(hudobjarray, level.green);
						}
						else
						{
							hudobjarray engagedist_hud_changetext("", tracedist);
							hudobj_changecolor(hudobjarray, level.yellow);
						}
					}
					else
					{
						if(tracedist < engagedistmin)
						{
							hudobj_changecolor(hudobjarray, level.red);
							hudobjarray engagedist_hud_changetext("", tracedist);
						}
						else if(tracedist > engagedistmax)
						{
							hudobj_changecolor(hudobjarray, level.red);
							hudobjarray engagedist_hud_changetext("", tracedist);
						}
					}
				}
			}
			thread util::function_6844bea4(1, 5, 0.05, level.debugrtengagedistcolor, tracepoint, tracenormal);
			thread util::function_6844bea4(1, 1, 0.05, level.debugrtengagedistcolor, tracepoint, tracenormal);
			waitframe(1);
		}
	#/
}

/*
	Name: hudobj_changecolor
	Namespace: dev
	Checksum: 0x84A341BE
	Offset: 0x5FD8
	Size: 0x78
	Parameters: 2
	Flags: None
*/
function hudobj_changecolor(hudobjarray, newcolor)
{
	/#
		for(i = 0; i < hudobjarray.size; i++)
		{
			hudobj = hudobjarray[i];
			if(hudobj.color != newcolor)
			{
				hudobj.color = newcolor;
				level.debugrtengagedistcolor = newcolor;
			}
		}
	#/
}

/*
	Name: engagedist_hud_changetext
	Namespace: dev
	Checksum: 0x93D9B595
	Offset: 0x6058
	Size: 0x2EC
	Parameters: 2
	Flags: None
*/
function engagedist_hud_changetext(engagedisttype, units)
{
	/#
		if(!isdefined(level.lastdisttype))
		{
			level.lastdisttype = "";
		}
		if(engagedisttype == "")
		{
			self[1] setvalue(units);
			self[2] settext("");
			self[3].alpha = 0;
		}
		else
		{
			if(engagedisttype == "")
			{
				self[1] setvalue(units);
				self[2] settext("");
				self[3].alpha = 0;
			}
			else
			{
				if(engagedisttype == "")
				{
					amountunder = level.weaponengagedistvalues.engagedistmin - units;
					self[1] setvalue(units);
					self[3] setvalue(amountunder);
					self[3].alpha = 1;
					if(level.lastdisttype != engagedisttype)
					{
						self[2] settext("");
					}
				}
				else
				{
					if(engagedisttype == "")
					{
						amountover = units - level.weaponengagedistvalues.engagedistmax;
						self[1] setvalue(units);
						self[3] setvalue(amountover);
						self[3].alpha = 1;
						if(level.lastdisttype != engagedisttype)
						{
							self[2] settext("");
						}
					}
					else if(engagedisttype == "")
					{
						self[1] setvalue(units);
						self[2] settext("");
						self[3].alpha = 0;
					}
				}
			}
		}
		level.lastdisttype = engagedisttype;
	#/
}

/*
	Name: larry_thread
	Namespace: dev
	Checksum: 0x6A65997D
	Offset: 0x6350
	Size: 0x14E
	Parameters: 0
	Flags: None
*/
function larry_thread()
{
	/#
		level.larry = spawnstruct();
		player = util::gethostplayer();
		player thread larry_init(level.larry);
		level waittill(#"kill_larry");
		larry_hud_destroy(level.larry);
		if(isdefined(level.larry.model))
		{
			level.larry.model delete();
		}
		if(isdefined(level.larry.ai))
		{
			for(i = 0; i < level.larry.ai.size; i++)
			{
				kick(level.larry.ai[i] getentitynumber());
			}
		}
		level.larry = undefined;
	#/
}

/*
	Name: larry_init
	Namespace: dev
	Checksum: 0x45257BF2
	Offset: 0x64A8
	Size: 0x244
	Parameters: 1
	Flags: None
*/
function larry_init(larry)
{
	/#
		level endon(#"kill_larry");
		larry_hud_init(larry);
		larry.model = spawn("", (0, 0, 0));
		larry.model setmodel(#"defaultactor");
		larry.ai = [];
		wait(0.1);
		for(;;)
		{
			waitframe(1);
			if(larry.ai.size > 0)
			{
				larry.model hide();
				continue;
			}
			direction = self getplayerangles();
			direction_vec = anglestoforward(direction);
			eye = self geteye();
			trace = bullettrace(eye, eye + vectorscale(direction_vec, 8000), 0, undefined);
			dist = distance(eye, trace[#"position"]);
			position = eye + (vectorscale(direction_vec, dist - 64));
			larry.model.origin = position;
			larry.model.angles = self.angles + vectorscale((0, 1, 0), 180);
			if(self usebuttonpressed())
			{
				self larry_ai(larry);
				while(self usebuttonpressed())
				{
					waitframe(1);
				}
			}
		}
	#/
}

/*
	Name: larry_ai
	Namespace: dev
	Checksum: 0x8F4B380F
	Offset: 0x66F8
	Size: 0x23C
	Parameters: 1
	Flags: None
*/
function larry_ai(larry)
{
	/#
		var_572bc68e = "";
		if(level.teambased)
		{
			foreach(team in level.teams)
			{
				if(team != self.team)
				{
					var_572bc68e = team;
					break;
				}
			}
		}
		else
		{
			foreach(team in level.teams)
			{
				if(getplayers(team).size == 0)
				{
					var_572bc68e = team;
					break;
				}
			}
		}
		bot = bot::add_fixed_spawn_bot(var_572bc68e, larry.model.origin, larry.model.angles[1]);
		larry.ai[larry.ai.size] = bot;
		i = larry.ai.size - 1;
		larry.ai[i] thread larry_ai_thread(larry);
		larry.ai[i] thread larry_ai_damage(larry);
		larry.ai[i] thread larry_ai_health(larry);
	#/
}

/*
	Name: larry_ai_thread
	Namespace: dev
	Checksum: 0x7D0C2A21
	Offset: 0x6940
	Size: 0x170
	Parameters: 1
	Flags: None
*/
function larry_ai_thread(larry)
{
	/#
		level endon(#"kill_larry");
		for(;;)
		{
			self waittill(#"spawned_player");
			larry.menu[larry.menu_health] setvalue(self.health);
			larry.menu[larry.menu_damage] settext("");
			larry.menu[larry.menu_range] settext("");
			larry.menu[larry.menu_hitloc] settext("");
			larry.menu[larry.menu_weapon] settext("");
			larry.menu[larry.menu_perks] settext("");
			self clearperks();
		}
	#/
}

/*
	Name: larry_ai_damage
	Namespace: dev
	Checksum: 0x53BCE511
	Offset: 0x6AB8
	Size: 0x270
	Parameters: 1
	Flags: None
*/
function larry_ai_damage(larry)
{
	/#
		level endon(#"kill_larry");
		for(;;)
		{
			waitresult = undefined;
			waitresult = self waittill(#"damage");
			attacker = waitresult.attacker;
			damage = waitresult.amount;
			point = waitresult.position;
			if(!isdefined(attacker))
			{
				continue;
			}
			player = util::gethostplayer();
			if(!isdefined(player))
			{
				continue;
			}
			if(attacker != player)
			{
				continue;
			}
			eye = player geteye();
			range = int(distance(eye, point));
			larry.menu[larry.menu_health] setvalue(self.health);
			larry.menu[larry.menu_damage] setvalue(damage);
			larry.menu[larry.menu_range] setvalue(range);
			if(isdefined(self.cac_debug_location))
			{
				larry.menu[larry.menu_hitloc] settext(self.cac_debug_location);
			}
			else
			{
				larry.menu[larry.menu_hitloc] settext("");
			}
			if(isdefined(self.cac_debug_weapon))
			{
				larry.menu[larry.menu_weapon] settext(self.cac_debug_weapon);
				continue;
			}
			larry.menu[larry.menu_weapon] settext("");
		}
	#/
}

/*
	Name: larry_ai_health
	Namespace: dev
	Checksum: 0x961A364C
	Offset: 0x6D30
	Size: 0x58
	Parameters: 1
	Flags: None
*/
function larry_ai_health(larry)
{
	/#
		level endon(#"kill_larry");
		for(;;)
		{
			waitframe(1);
			larry.menu[larry.menu_health] setvalue(self.health);
		}
	#/
}

/*
	Name: larry_hud_init
	Namespace: dev
	Checksum: 0x5408A09B
	Offset: 0x6D90
	Size: 0x4C4
	Parameters: 1
	Flags: None
*/
function larry_hud_init(larry)
{
	/#
		/#
			x = -45;
			y = 275;
			menu_name = "";
			larry.hud = new_hud(menu_name, undefined, x, y, 1);
			larry.hud setshader(#"white", 135, 65);
			larry.hud.alignx = "";
			larry.hud.aligny = "";
			larry.hud.sort = 10;
			larry.hud.alpha = 0.6;
			larry.hud.color = vectorscale((0, 0, 1), 0.5);
			larry.menu[0] = new_hud(menu_name, "", x + 5, y + 10, 1);
			larry.menu[1] = new_hud(menu_name, "", x + 5, y + 20, 1);
			larry.menu[2] = new_hud(menu_name, "", x + 5, y + 30, 1);
			larry.menu[3] = new_hud(menu_name, "", x + 5, y + 40, 1);
			larry.menu[4] = new_hud(menu_name, "", x + 5, y + 50, 1);
			larry.cleartextmarker = newdebughudelem();
			larry.cleartextmarker.alpha = 0;
			larry.cleartextmarker settext("");
			larry.menu_health = larry.menu.size;
			larry.menu_damage = larry.menu.size + 1;
			larry.menu_range = larry.menu.size + 2;
			larry.menu_hitloc = larry.menu.size + 3;
			larry.menu_weapon = larry.menu.size + 4;
			larry.menu_perks = larry.menu.size + 5;
			x_offset = 70;
			larry.menu[larry.menu_health] = new_hud(menu_name, "", x + x_offset, y + 10, 1);
			larry.menu[larry.menu_damage] = new_hud(menu_name, "", x + x_offset, y + 20, 1);
			larry.menu[larry.menu_range] = new_hud(menu_name, "", x + x_offset, y + 30, 1);
			larry.menu[larry.menu_hitloc] = new_hud(menu_name, "", x + x_offset, y + 40, 1);
			larry.menu[larry.menu_weapon] = new_hud(menu_name, "", x + x_offset, y + 50, 1);
			larry.menu[larry.menu_perks] = new_hud(menu_name, "", x + x_offset, y + 60, 1);
		#/
	#/
}

/*
	Name: larry_hud_destroy
	Namespace: dev
	Checksum: 0x11B172E0
	Offset: 0x7260
	Size: 0x9C
	Parameters: 1
	Flags: None
*/
function larry_hud_destroy(larry)
{
	/#
		if(isdefined(larry.hud))
		{
			larry.hud destroy();
			for(i = 0; i < larry.menu.size; i++)
			{
				larry.menu[i] destroy();
			}
			larry.cleartextmarker destroy();
		}
	#/
}

/*
	Name: new_hud
	Namespace: dev
	Checksum: 0x21FCCAF0
	Offset: 0x7308
	Size: 0xC2
	Parameters: 5
	Flags: None
*/
function new_hud(hud_name, msg, x, y, scale)
{
	/#
		if(!isdefined(level.hud_array))
		{
			level.hud_array = [];
		}
		if(!isdefined(level.hud_array[hud_name]))
		{
			level.hud_array[hud_name] = [];
		}
		hud = set_hudelem(msg, x, y, scale);
		level.hud_array[hud_name][level.hud_array[hud_name].size] = hud;
		return hud;
	#/
}

/*
	Name: set_hudelem
	Namespace: dev
	Checksum: 0xE71DB926
	Offset: 0x73D8
	Size: 0x140
	Parameters: 7
	Flags: None
*/
function set_hudelem(text, x, y, scale, alpha, sort, debug_hudelem)
{
	/#
		/#
			if(!isdefined(sort))
			{
				sort = 1;
			}
			if(!isdefined(alpha))
			{
				alpha = 1;
			}
			if(!isdefined(debug_hudelem))
			{
				debug_hudelem = 20;
			}
			hud = newdebughudelem();
			hud.debug_hudelem = 1;
			hud.location = 0;
			hud.alignx = "";
			hud.aligny = "";
			hud.foreground = 1;
			hud.fontscale = alpha;
			hud.sort = debug_hudelem;
			hud.alpha = sort;
			hud.x = y;
			hud.y = scale;
			hud.og_scale = alpha;
			if(isdefined(x))
			{
				hud settext(x);
			}
			return hud;
		#/
	#/
}

/*
	Name: print_weapon_name
	Namespace: dev
	Checksum: 0x273D7954
	Offset: 0x7528
	Size: 0x154
	Parameters: 0
	Flags: None
*/
function print_weapon_name()
{
	/#
		/#
			self notify(#"print_weapon_name");
			self endon(#"print_weapon_name");
			wait(0.2);
			if(self isswitchingweapons())
			{
				waitresult = undefined;
				waitresult = self waittill(#"weapon_change_complete");
				fail_safe = 0;
				while(waitresult.weapon == level.weaponnone)
				{
					waitresult = undefined;
					waitresult = self waittill(#"weapon_change_complete");
					waitframe(1);
					fail_safe++;
					if(fail_safe > 120)
					{
						break;
					}
				}
			}
			else
			{
				weapon = self getcurrentweapon();
			}
			printweaponname = getdvarint(#"scr_print_weapon_name", 1);
			if(printweaponname)
			{
				iprintlnbold(function_a16a090d(weapon));
			}
		#/
	#/
}

/*
	Name: set_equipment_list
	Namespace: dev
	Checksum: 0x7960E4D6
	Offset: 0x7688
	Size: 0x2C8
	Parameters: 0
	Flags: None
*/
function set_equipment_list()
{
	/#
		if(isdefined(level.dev_equipment))
		{
			return;
		}
		level.dev_equipment = [];
		level.dev_equipment[1] = getweapon(#"acoustic_sensor");
		level.dev_equipment[2] = getweapon(#"camera_spike");
		level.dev_equipment[3] = getweapon(#"claymore");
		level.dev_equipment[4] = getweapon(#"satchel_charge");
		level.dev_equipment[5] = getweapon(#"scrambler");
		level.dev_equipment[6] = getweapon(#"tactical_insertion");
		level.dev_equipment[7] = getweapon(#"bouncingbetty");
		level.dev_equipment[8] = getweapon(#"trophy_system");
		level.dev_equipment[9] = getweapon(#"pda_hack");
		level.dev_equipment[10] = getweapon(#"threat_detector");
		level.dev_equipment[11] = getweapon(#"armor_station");
		level.dev_equipment[12] = getweapon(#"land_mine");
		level.dev_equipment[13] = getweapon(#"missile_turret");
		level.dev_equipment[14] = getweapon(#"weapon_armor");
	#/
}

/*
	Name: set_grenade_list
	Namespace: dev
	Checksum: 0x9D25CE74
	Offset: 0x7958
	Size: 0x298
	Parameters: 0
	Flags: None
*/
function set_grenade_list()
{
	/#
		if(isdefined(level.dev_grenade))
		{
			return;
		}
		level.dev_grenade = [];
		level.dev_grenade[1] = getweapon(#"frag_grenade");
		level.dev_grenade[2] = getweapon(#"sticky_grenade");
		level.dev_grenade[3] = getweapon(#"hatchet");
		level.dev_grenade[4] = getweapon(#"willy_pete");
		level.dev_grenade[5] = getweapon(#"proximity_grenade");
		level.dev_grenade[6] = getweapon(#"flash_grenade");
		level.dev_grenade[7] = getweapon(#"concussion_grenade");
		level.dev_grenade[8] = getweapon(#"nightingale");
		level.dev_grenade[9] = getweapon(#"emp_grenade");
		level.dev_grenade[10] = getweapon(#"sensor_grenade");
		level.dev_grenade[11] = getweapon(#"incendiary_grenade");
		level.dev_grenade[12] = getweapon(#"sprint_boost_grenade");
		level.dev_grenade[13] = getweapon(#"hash_5287190a1612cbd2");
	#/
}

/*
	Name: take_all_grenades_and_equipment
	Namespace: dev
	Checksum: 0x789C896
	Offset: 0x7BF8
	Size: 0xAC
	Parameters: 1
	Flags: None
*/
function take_all_grenades_and_equipment(player)
{
	/#
		for(i = 0; i < level.dev_equipment.size; i++)
		{
			player takeweapon(level.dev_equipment[i + 1]);
		}
		for(i = 0; i < level.dev_grenade.size; i++)
		{
			player takeweapon(level.dev_grenade[i + 1]);
		}
	#/
}

/*
	Name: equipment_dev_gui
	Namespace: dev
	Checksum: 0x96B78B46
	Offset: 0x7CB0
	Size: 0x148
	Parameters: 0
	Flags: None
*/
function equipment_dev_gui()
{
	/#
		set_equipment_list();
		set_grenade_list();
		setdvar(#"scr_give_equipment", "");
		while(true)
		{
			wait(0.5);
			devgui_int = getdvarint(#"scr_give_equipment", 0);
			if(devgui_int != 0)
			{
				for(i = 0; i < level.players.size; i++)
				{
					take_all_grenades_and_equipment(level.players[i]);
					level.players[i] devgui::devgui_give_weapon(function_a16a090d(level.dev_equipment[devgui_int]));
				}
				setdvar(#"scr_give_equipment", 0);
			}
		}
	#/
}

/*
	Name: grenade_dev_gui
	Namespace: dev
	Checksum: 0xDE5B8CB0
	Offset: 0x7E00
	Size: 0x148
	Parameters: 0
	Flags: None
*/
function grenade_dev_gui()
{
	/#
		set_equipment_list();
		set_grenade_list();
		setdvar(#"scr_give_grenade", "");
		while(true)
		{
			wait(0.5);
			devgui_int = getdvarint(#"scr_give_grenade", 0);
			if(devgui_int != 0)
			{
				for(i = 0; i < level.players.size; i++)
				{
					take_all_grenades_and_equipment(level.players[i]);
					level.players[i] devgui::devgui_give_weapon(function_a16a090d(level.dev_grenade[devgui_int]));
				}
				setdvar(#"scr_give_grenade", 0);
			}
		}
	#/
}

/*
	Name: force_grenade_throw
	Namespace: dev
	Checksum: 0x7CEA8BB8
	Offset: 0x7F50
	Size: 0x1CC
	Parameters: 1
	Flags: None
*/
function force_grenade_throw(weapon)
{
	/#
		if(weapon == level.weaponnone)
		{
			return;
		}
		host = util::gethostplayer();
		if(!isdefined(host.team))
		{
			iprintln("");
			return;
		}
		bot = getormakebot(util::getotherteam(host.team));
		if(!isdefined(bot))
		{
			iprintln("");
			return;
		}
		angles = host getplayerangles();
		angles = (0, angles[1], 0);
		dir = anglestoforward(angles);
		dir = vectornormalize(dir);
		origin = host geteye() + vectorscale(dir, 256);
		velocity = vectorscale(dir, -1024);
		grenade = bot magicgrenadeplayer(weapon, origin, velocity);
		grenade setteam(bot.team);
		grenade setowner(bot);
	#/
}

/*
	Name: devstraferunpathdebugdraw
	Namespace: dev
	Checksum: 0x326577E3
	Offset: 0x8128
	Size: 0x456
	Parameters: 0
	Flags: None
*/
function devstraferunpathdebugdraw()
{
	/#
		white = (1, 1, 1);
		red = (1, 0, 0);
		green = (0, 1, 0);
		blue = (0, 0, 1);
		violet = (0.4, 0, 0.6);
		maxdrawtime = 10;
		drawtime = maxdrawtime;
		origintextoffset = vectorscale((0, 0, -1), 50);
		endonmsg = "";
		while(true)
		{
			if(killstreaks::should_draw_debug("") > 0)
			{
				nodes = [];
				end = 0;
				node = getvehiclenode("", "");
				if(!isdefined(node))
				{
					println("");
					setdvar(#"scr_devstraferunpathdebugdraw", 0);
					continue;
				}
				while(isdefined(node.target))
				{
					new_node = getvehiclenode(node.target, "");
					foreach(n in nodes)
					{
						if(n == new_node)
						{
							end = 1;
						}
					}
					textscale = 30;
					if(drawtime == maxdrawtime)
					{
						node thread drawpathsegment(new_node, violet, violet, 1, textscale, origintextoffset, drawtime, endonmsg);
					}
					if(isdefined(node.script_noteworthy))
					{
						textscale = 10;
						switch(node.script_noteworthy)
						{
							case "strafe_start":
							{
								textcolor = green;
								textalpha = 1;
								break;
							}
							case "strafe_stop":
							{
								textcolor = red;
								textalpha = 1;
								break;
							}
							case "strafe_leave":
							{
								textcolor = white;
								textalpha = 1;
								break;
							}
						}
						switch(node.script_noteworthy)
						{
							case "strafe_stop":
							case "strafe_leave":
							case "strafe_start":
							{
								sides = 10;
								radius = 100;
								if(drawtime == maxdrawtime)
								{
									sphere(node.origin, radius, textcolor, textalpha, 1, sides, int(drawtime * 1000));
								}
								node draworiginlines();
								node drawnoteworthytext(textcolor, textalpha, textscale);
								break;
							}
						}
					}
					if(end)
					{
						break;
					}
					nodes[nodes.size] = new_node;
					node = new_node;
				}
				drawtime = drawtime - 0.05;
				if(drawtime < 0)
				{
					drawtime = maxdrawtime;
				}
				waitframe(1);
			}
			else
			{
				wait(1);
			}
		}
	#/
}

/*
	Name: devhelipathdebugdraw
	Namespace: dev
	Checksum: 0x37181AED
	Offset: 0x8588
	Size: 0x3BC
	Parameters: 0
	Flags: None
*/
function devhelipathdebugdraw()
{
	/#
		white = (1, 1, 1);
		red = (1, 0, 0);
		green = (0, 1, 0);
		blue = (0, 0, 1);
		textcolor = white;
		textalpha = 1;
		textscale = 1;
		maxdrawtime = 10;
		drawtime = maxdrawtime;
		origintextoffset = vectorscale((0, 0, -1), 50);
		endonmsg = "";
		while(true)
		{
			if(getdvarint(#"scr_devhelipathsdebugdraw", 0) > 0)
			{
				script_origins = getentarray("", "");
				foreach(ent in script_origins)
				{
					if(isdefined(ent.targetname))
					{
						switch(ent.targetname)
						{
							case "heli_start":
							{
								textcolor = blue;
								textalpha = 1;
								textscale = 3;
								break;
							}
							case "heli_loop_start":
							{
								textcolor = green;
								textalpha = 1;
								textscale = 3;
								break;
							}
							case "heli_attack_area":
							{
								textcolor = red;
								textalpha = 1;
								textscale = 3;
								break;
							}
							case "heli_leave":
							{
								textcolor = white;
								textalpha = 1;
								textscale = 3;
								break;
							}
						}
						switch(ent.targetname)
						{
							case "heli_leave":
							case "heli_attack_area":
							case "heli_start":
							case "heli_loop_start":
							{
								if(drawtime == maxdrawtime)
								{
									ent thread drawpath(textcolor, white, textalpha, textscale, origintextoffset, drawtime, endonmsg);
								}
								ent draworiginlines();
								ent drawtargetnametext(textcolor, textalpha, textscale);
								ent draworigintext(textcolor, textalpha, textscale, origintextoffset);
								break;
							}
						}
					}
				}
				drawtime = drawtime - 0.05;
				if(drawtime < 0)
				{
					drawtime = maxdrawtime;
				}
			}
			if(getdvarint(#"scr_devhelipathsdebugdraw", 0) == 0)
			{
				level notify(endonmsg);
				drawtime = maxdrawtime;
				wait(1);
			}
			waitframe(1);
		}
	#/
}

/*
	Name: draworiginlines
	Namespace: dev
	Checksum: 0x37799548
	Offset: 0x8950
	Size: 0xFC
	Parameters: 0
	Flags: None
*/
function draworiginlines()
{
	/#
		red = (1, 0, 0);
		green = (0, 1, 0);
		blue = (0, 0, 1);
		line(self.origin, self.origin + (anglestoforward(self.angles) * 10), red);
		line(self.origin, self.origin + (anglestoright(self.angles) * 10), green);
		line(self.origin, self.origin + (anglestoup(self.angles) * 10), blue);
	#/
}

/*
	Name: drawtargetnametext
	Namespace: dev
	Checksum: 0xEC2998C1
	Offset: 0x8A58
	Size: 0x64
	Parameters: 4
	Flags: None
*/
function drawtargetnametext(textcolor, textalpha, textscale, textoffset)
{
	/#
		if(!isdefined(textoffset))
		{
			textoffset = (0, 0, 0);
		}
		print3d(self.origin + textoffset, self.targetname, textcolor, textalpha, textscale);
	#/
}

/*
	Name: drawnoteworthytext
	Namespace: dev
	Checksum: 0x4A665CA8
	Offset: 0x8AC8
	Size: 0x64
	Parameters: 4
	Flags: None
*/
function drawnoteworthytext(textcolor, textalpha, textscale, textoffset)
{
	/#
		if(!isdefined(textoffset))
		{
			textoffset = (0, 0, 0);
		}
		print3d(self.origin + textoffset, self.script_noteworthy, textcolor, textalpha, textscale);
	#/
}

/*
	Name: draworigintext
	Namespace: dev
	Checksum: 0xB07FC5F7
	Offset: 0x8B38
	Size: 0xBC
	Parameters: 4
	Flags: None
*/
function draworigintext(textcolor, textalpha, textscale, textoffset)
{
	/#
		if(!isdefined(textoffset))
		{
			textoffset = (0, 0, 0);
		}
		originstring = ((((("" + self.origin[0]) + "") + self.origin[1]) + "") + self.origin[2]) + "";
		print3d(self.origin + textoffset, originstring, textcolor, textalpha, textscale);
	#/
}

/*
	Name: drawspeedacceltext
	Namespace: dev
	Checksum: 0x630A6568
	Offset: 0x8C00
	Size: 0xCC
	Parameters: 4
	Flags: None
*/
function drawspeedacceltext(textcolor, textalpha, textscale, textoffset)
{
	/#
		if(isdefined(self.script_airspeed))
		{
			print3d(self.origin + (0, 0, textoffset[2] * 2), "" + self.script_airspeed, textcolor, textalpha, textscale);
		}
		if(isdefined(self.script_accel))
		{
			print3d(self.origin + (0, 0, textoffset[2] * 3), "" + self.script_accel, textcolor, textalpha, textscale);
		}
	#/
}

/*
	Name: drawpath
	Namespace: dev
	Checksum: 0x3EF75A96
	Offset: 0x8CD8
	Size: 0x11E
	Parameters: 7
	Flags: None
*/
function drawpath(linecolor, textcolor, textalpha, textscale, textoffset, drawtime, endonmsg)
{
	/#
		level endon(endonmsg);
		ent = self;
		entfirsttarget = ent.targetname;
		while(isdefined(ent.target))
		{
			enttarget = getent(ent.target, "");
			ent thread drawpathsegment(enttarget, linecolor, textcolor, textalpha, textscale, textoffset, drawtime, endonmsg);
			if(ent.targetname == "")
			{
				entfirsttarget = ent.target;
			}
			else if(ent.target == entfirsttarget)
			{
				break;
			}
			ent = enttarget;
			waitframe(1);
		}
	#/
}

/*
	Name: drawpathsegment
	Namespace: dev
	Checksum: 0x6025E23F
	Offset: 0x8E00
	Size: 0x116
	Parameters: 8
	Flags: None
*/
function drawpathsegment(enttarget, linecolor, textcolor, textalpha, textscale, textoffset, drawtime, endonmsg)
{
	/#
		level endon(endonmsg);
		while(drawtime > 0)
		{
			if(isdefined(self.targetname) && self.targetname == "")
			{
				print3d(self.origin + textoffset, self.targetname, textcolor, textalpha, textscale);
			}
			line(self.origin, enttarget.origin, linecolor);
			self drawspeedacceltext(textcolor, textalpha, textscale, textoffset);
			drawtime = drawtime - 0.05;
			waitframe(1);
		}
	#/
}

