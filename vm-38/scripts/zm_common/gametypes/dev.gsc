#using scripts\zm_common\util.gsc;
#using scripts\zm_common\gametypes\globallogic_utils.gsc;
#using scripts\zm_common\gametypes\globallogic_score.gsc;
#using scripts\zm_common\gametypes\globallogic.gsc;
#using scripts\zm_common\gametypes\dev_class.gsc;
#using scripts\killstreaks\killstreaks_util.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\sound_shared.gsc;
#using scripts\core_common\potm_shared.gsc;
#using scripts\core_common\hud_message_shared.gsc;
#using scripts\core_common\dev_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace dev;

/*
	Name: function_a31ccfd5
	Namespace: dev
	Checksum: 0xE6CF9208
	Offset: 0xE0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_a31ccfd5()
{
	level notify(-1909627981);
}

/*
	Name: __init__system__
	Namespace: dev
	Checksum: 0x775AFB45
	Offset: 0x100
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	/#
		system::register(#"dev", &function_70a657d8, undefined, undefined, #"spawnlogic");
	#/
}

/*
	Name: function_70a657d8
	Namespace: dev
	Checksum: 0x1FF2225
	Offset: 0x158
	Size: 0x2C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	/#
		callback::on_start_gametype(&init);
	#/
}

/*
	Name: init
	Namespace: dev
	Checksum: 0x4E9A2340
	Offset: 0x190
	Size: 0x308
	Parameters: 0
	Flags: None
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
		thread testscriptruntimeerror();
		thread testdvars();
		thread devhelipathdebugdraw();
		thread devstraferunpathdebugdraw();
		thread globallogic_score::setplayermomentumdebug();
		thread dev_class::dev_cac_init();
		setdvar(#"scr_giveperk", "");
		setdvar(#"scr_forceevent", "");
		setdvar(#"scr_draw_triggers", 0);
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
		callback::on_connect(&on_player_connect);
		for(;;)
		{
			updatedevsettings();
			wait(0.5);
		}
	#/
}

/*
	Name: on_player_connect
	Namespace: dev
	Checksum: 0x6FC85FD1
	Offset: 0x4A0
	Size: 0x8
	Parameters: 0
	Flags: None
*/
function on_player_connect()
{
	/#
	#/
}

/*
	Name: updatehardpoints
	Namespace: dev
	Checksum: 0x3E7C5432
	Offset: 0x4B0
	Size: 0x2A8
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
		}
	#/
}

/*
	Name: warpalltohost
	Namespace: dev
	Checksum: 0x632B9AC7
	Offset: 0x760
	Size: 0x4C
	Parameters: 1
	Flags: None
*/
function warpalltohost(team)
{
	/#
		host = util::gethostplayer();
		warpalltoplayer(team, host.name);
	#/
}

/*
	Name: warpalltoplayer
	Namespace: dev
	Checksum: 0x81D5A2A9
	Offset: 0x7B8
	Size: 0x31C
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
		if(isdefined(target))
		{
			origin = target.origin;
			nodes = getnodesinradius(origin, 128, 32, 128, #"path");
			angles = target getplayerangles();
			yaw = (0, angles[1], 0);
			forward = anglestoforward(yaw);
			spawn_origin = (origin + (forward * 128)) + vectorscale((0, 0, 1), 16);
			if(!bullettracepassed(target geteye(), spawn_origin, 0, target))
			{
				spawn_origin = undefined;
			}
			for(i = 0; i < players.size; i++)
			{
				if(players[i] == target)
				{
					continue;
				}
				if(isdefined(team))
				{
					if(strstartswith(team, "") && target.team == players[i].team)
					{
						continue;
					}
					if(strstartswith(team, "") && target.team != players[i].team)
					{
						continue;
					}
				}
				if(isdefined(spawn_origin))
				{
					players[i] setorigin(spawn_origin);
					continue;
				}
				if(nodes.size > 0)
				{
					node = array::random(nodes);
					players[i] setorigin(node.origin);
					continue;
				}
				players[i] setorigin(origin);
			}
		}
		setdvar(#"scr_playerwarp", "");
	#/
}

/*
	Name: updatedevsettingszm
	Namespace: dev
	Checksum: 0x8D719057
	Offset: 0xAE0
	Size: 0x424
	Parameters: 0
	Flags: None
*/
function updatedevsettingszm()
{
	/#
		if(level.players.size > 0)
		{
			if(getdvarint(#"hash_6efff55aa118c517", 0) == 3)
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
					setdvar(#"hash_6efff55aa118c517", 0);
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
					waitframe(1);
					setdvar(#"hash_6efff55aa118c517", 2);
				}
			}
		}
	#/
}

/*
	Name: updatedevsettings
	Namespace: dev
	Checksum: 0x5A8AC7E5
	Offset: 0xF10
	Size: 0x1604
	Parameters: 0
	Flags: None
*/
function updatedevsettings()
{
	/#
		show_spawns = getdvarint(#"scr_showspawns", 0);
		show_start_spawns = getdvarint(#"scr_showstartspawns", 0);
		player = util::gethostplayer();
		if(show_spawns >= 1)
		{
			show_spawns = 1;
		}
		else
		{
			show_spawns = 0;
		}
		if(show_start_spawns >= 1)
		{
			show_start_spawns = 1;
		}
		else
		{
			show_start_spawns = 0;
		}
		if(!isdefined(level.show_spawns) || level.show_spawns != show_spawns)
		{
			level.show_spawns = show_spawns;
			setdvar(#"scr_showspawns", level.show_spawns);
			if(level.show_spawns)
			{
				showspawnpoints();
			}
			else
			{
				hidespawnpoints();
			}
		}
		if(!isdefined(level.show_start_spawns) || level.show_start_spawns != show_start_spawns)
		{
			level.show_start_spawns = show_start_spawns;
			setdvar(#"scr_showstartspawns", level.show_start_spawns);
			if(level.show_start_spawns)
			{
				showstartspawnpoints();
			}
			else
			{
				hidestartspawnpoints();
			}
		}
		updateminimapsetting();
		if(level.players.size > 0)
		{
			updatehardpoints();
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
													level showonespawnpoint(level.radios[i], color, "", 32, "");
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
			if(getdvarint(#"hash_6efff55aa118c517", 0) == 3)
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
					setdvar(#"hash_6efff55aa118c517", 0);
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
					waitframe(1);
					setdvar(#"hash_6efff55aa118c517", 2);
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
			}
			setdvar(#"scr_giveperk", "");
		}
		if(getdvarstring(#"scr_giveperk") != "")
		{
			perk = getdvarstring(#"scr_giveperk");
			specialties = strtok(perk, "");
			players = getplayers();
			iprintln(("" + perk) + "");
			foreach(player in players)
			{
				foreach(specialty in specialties)
				{
					player setperk(specialty);
					if(!isdefined(player.extraperks))
					{
						player.extraperks = [];
					}
					player.extraperks[specialty] = 1;
				}
			}
			setdvar(#"scr_giveperk", "");
		}
		if(getdvarstring(#"scr_toggleperk") != "")
		{
			perk = getdvarstring(#"scr_toggleperk");
			specialties = strtok(perk, "");
			players = getplayers();
			iprintln(("" + perk) + "");
			foreach(player in players)
			{
				foreach(specialty in specialties)
				{
					if(!isdefined(player.extraperks))
					{
						player.extraperks = [];
					}
					if(player hasperk(specialty))
					{
						player unsetperk(specialty);
						player.extraperks[specialty] = 0;
						continue;
					}
					player setperk(specialty);
					player.extraperks[specialty] = 1;
				}
			}
			setdvar(#"scr_toggleperk", "");
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
				level.players[i] unsetperk(perk);
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
		potm::debugupdate();
	#/
}

/*
	Name: devgui_spawn_think
	Namespace: dev
	Checksum: 0x252173D6
	Offset: 0x2520
	Size: 0x1B6
	Parameters: 0
	Flags: None
*/
function devgui_spawn_think()
{
	/#
		self notify(#"devgui_spawn_think");
		self endon(#"devgui_spawn_think", #"disconnect");
		dpad_left = 0;
		dpad_right = 0;
		for(;;)
		{
			self setactionslot(3, "");
			self setactionslot(4, "");
			if(!dpad_left && self buttonpressed(""))
			{
				setdvar(#"scr_playerwarp", "");
				dpad_left = 1;
			}
			else if(!self buttonpressed(""))
			{
				dpad_left = 0;
			}
			if(!dpad_right && self buttonpressed(""))
			{
				setdvar(#"scr_playerwarp", "");
				dpad_right = 1;
			}
			else if(!self buttonpressed(""))
			{
				dpad_right = 0;
			}
			waitframe(1);
		}
	#/
}

/*
	Name: devgui_unlimited_ammo
	Namespace: dev
	Checksum: 0xDE76E85E
	Offset: 0x26E0
	Size: 0x148
	Parameters: 0
	Flags: None
*/
function devgui_unlimited_ammo()
{
	/#
		self notify(#"devgui_unlimited_ammo");
		self endon(#"devgui_unlimited_ammo", #"disconnect");
		for(;;)
		{
			wait(1);
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
				self givemaxammo(weapon);
			}
		}
	#/
}

/*
	Name: devgui_unlimited_momentum
	Namespace: dev
	Checksum: 0x79DDB5E2
	Offset: 0x2830
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
	Checksum: 0xC0CFB0A8
	Offset: 0x2958
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
			player globallogic_score::giveplayermomentumnotification(score, #"testplayerscorefortan", "", 0);
		}
	#/
}

/*
	Name: devgui_health_debug
	Namespace: dev
	Checksum: 0x517A6B7A
	Offset: 0x2A60
	Size: 0x320
	Parameters: 0
	Flags: None
*/
function devgui_health_debug()
{
	/#
		self notify(#"devgui_health_debug");
		self endon(#"devgui_health_debug", #"disconnect");
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
	Checksum: 0xF652A7B7
	Offset: 0x2D88
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
			self setperk(perks[i]);
		}
	#/
}

/*
	Name: xkillsy
	Namespace: dev
	Checksum: 0xB97999A1
	Offset: 0x2E40
	Size: 0x140
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
		victim thread [[level.callbackplayerdamage]](attacker, attacker, 1000, 0, "", level.weaponnone, (0, 0, 0), (0, 0, 0), "", 0, 0);
	#/
}

/*
	Name: testscriptruntimeerrorassert
	Namespace: dev
	Checksum: 0xA79927D1
	Offset: 0x2F88
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
	Namespace: dev
	Checksum: 0xB5BF1A2D
	Offset: 0x2FB8
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
	Checksum: 0x3539258
	Offset: 0x3008
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
	Checksum: 0x5395F537
	Offset: 0x3030
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
	Name: testdvars
	Namespace: dev
	Checksum: 0x69B78A85
	Offset: 0x3118
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
	Name: showonespawnpoint
	Namespace: dev
	Checksum: 0x400C2C50
	Offset: 0x3220
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
	Name: showspawnpoints
	Namespace: dev
	Checksum: 0x87AA3C95
	Offset: 0x36D8
	Size: 0xD4
	Parameters: 0
	Flags: None
*/
function showspawnpoints()
{
	/#
		if(isdefined(level.spawnpoints))
		{
			color = (1, 1, 1);
			for(spawn_point_index = 0; spawn_point_index < level.spawnpoints.size; spawn_point_index++)
			{
				showonespawnpoint(level.spawnpoints[spawn_point_index], color, "");
			}
		}
		for(i = 0; i < level.dem_spawns.size; i++)
		{
			color = (0, 1, 0);
			showonespawnpoint(level.dem_spawns[i], color, "");
		}
	#/
}

/*
	Name: hidespawnpoints
	Namespace: dev
	Checksum: 0x54098D82
	Offset: 0x37B8
	Size: 0x20
	Parameters: 0
	Flags: None
*/
function hidespawnpoints()
{
	/#
		level notify(#"hide_spawnpoints");
	#/
}

/*
	Name: showstartspawnpoints
	Namespace: dev
	Checksum: 0x84B378EA
	Offset: 0x37E8
	Size: 0x23C
	Parameters: 0
	Flags: None
*/
function showstartspawnpoints()
{
	/#
		if(!level.teambased)
		{
			return;
		}
		if(!isdefined(level.spawn_start))
		{
			return;
		}
		team_colors = [];
		team_colors[#"axis"] = (1, 0, 1);
		team_colors[#"allies"] = (0, 1, 1);
		team_colors[#"team3"] = (1, 1, 0);
		team_colors[#"team4"] = (0, 1, 0);
		team_colors[#"team5"] = (0, 0, 1);
		team_colors[#"team6"] = (1, 0.7, 0);
		team_colors[#"team7"] = (0.25, 0.25, 1);
		team_colors[#"team8"] = (0.88, 0, 1);
		foreach(team, _ in level.teams)
		{
			color = team_colors[team];
			foreach(spawnpoint in level.spawn_start[team])
			{
				showonespawnpoint(spawnpoint, color, "");
			}
		}
	#/
}

/*
	Name: hidestartspawnpoints
	Namespace: dev
	Checksum: 0xFDF73ECE
	Offset: 0x3A30
	Size: 0x20
	Parameters: 0
	Flags: None
*/
function hidestartspawnpoints()
{
	/#
		level notify(#"hide_startspawnpoints");
	#/
}

/*
	Name: print3duntilnotified
	Namespace: dev
	Checksum: 0x84EDDEE9
	Offset: 0x3A60
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
	Checksum: 0xCD60D61A
	Offset: 0x3AD8
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
	Name: dvar_turned_on
	Namespace: dev
	Checksum: 0x37658750
	Offset: 0x3B48
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
	Name: new_hud
	Namespace: dev
	Checksum: 0x5E5A86A6
	Offset: 0x3B80
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
	Checksum: 0x49D9D4C7
	Offset: 0x3C50
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
	Checksum: 0xD4FC384D
	Offset: 0x3DA0
	Size: 0x14C
	Parameters: 0
	Flags: None
*/
function print_weapon_name()
{
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
			iprintlnbold(weapon.name);
		}
	#/
}

/*
	Name: set_equipment_list
	Namespace: dev
	Checksum: 0x3A16DA46
	Offset: 0x3EF8
	Size: 0x1D8
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
	#/
}

/*
	Name: set_grenade_list
	Namespace: dev
	Checksum: 0x86863EF7
	Offset: 0x40D8
	Size: 0x208
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
	#/
}

/*
	Name: take_all_grenades_and_equipment
	Namespace: dev
	Checksum: 0x947C8238
	Offset: 0x42E8
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
	Checksum: 0x12DCE554
	Offset: 0x43A0
	Size: 0x138
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
					level.players[i] giveweapon(level.dev_equipment[devgui_int]);
				}
				setdvar(#"scr_give_equipment", 0);
			}
		}
	#/
}

/*
	Name: grenade_dev_gui
	Namespace: dev
	Checksum: 0x9146923D
	Offset: 0x44E0
	Size: 0x138
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
					level.players[i] giveweapon(level.dev_grenade[devgui_int]);
				}
				setdvar(#"scr_give_grenade", 0);
			}
		}
	#/
}

/*
	Name: devstraferunpathdebugdraw
	Namespace: dev
	Checksum: 0x5CF49E09
	Offset: 0x4620
	Size: 0x44E
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
			if(getdvarint(#"scr_devstraferunpathdebugdraw", 0) > 0)
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
									sphere(node.origin, radius, textcolor, textalpha, 1, sides, drawtime * 1000);
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
	Checksum: 0x2B9414F
	Offset: 0x4A78
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
	Checksum: 0x74FE71E0
	Offset: 0x4E40
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
	Checksum: 0x64265EF8
	Offset: 0x4F48
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
	Checksum: 0x6729BBF7
	Offset: 0x4FB8
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
	Checksum: 0x661C2A03
	Offset: 0x5028
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
	Checksum: 0xC73CA48A
	Offset: 0x50F0
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
	Checksum: 0x4A6FBE47
	Offset: 0x51C8
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
	Checksum: 0xF354D2A2
	Offset: 0x52F0
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

