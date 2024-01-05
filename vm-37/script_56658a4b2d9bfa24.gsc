#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\player\player_shared.gsc;
#using scripts\core_common\dev_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\bots\bot_action.gsc;
#using scripts\core_common\bots\bot.gsc;

#namespace namespace_1f0cb9eb;

/*
	Name: __init__system__
	Namespace: namespace_1f0cb9eb
	Checksum: 0xA1FD004C
	Offset: 0x578
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_6540387fe939dd65", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_1f0cb9eb
	Checksum: 0x8EA9743C
	Offset: 0x5C0
	Size: 0x14C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(isshipbuild() || currentsessionmode() == 4 || currentsessionmode() == 2)
	{
		return;
	}
	callback::on_connect(&on_player_connect);
	callback::on_disconnect(&on_player_disconnect);
	callback::on_spawned(&on_player_spawned);
	callback::add_callback(#"hash_6efb8cec1ca372dc", &function_ac5215a9);
	callback::add_callback(#"hash_6280ac8ed281ce3c", &function_8d1480e9);
	/#
		level thread function_d3901b82();
	#/
	level thread devgui_loop();
}

/*
	Name: on_player_connect
	Namespace: namespace_1f0cb9eb
	Checksum: 0x850685F6
	Offset: 0x718
	Size: 0x34
	Parameters: 0
	Flags: Linked, Private
*/
function private on_player_connect()
{
	if(!isbot(self))
	{
		return;
	}
	self thread add_bot_devgui_menu();
}

/*
	Name: on_player_disconnect
	Namespace: namespace_1f0cb9eb
	Checksum: 0xBF89C10E
	Offset: 0x758
	Size: 0x24
	Parameters: 0
	Flags: Linked, Private
*/
function private on_player_disconnect()
{
	if(isdefined(self.bot))
	{
		self thread clear_bot_devgui_menu();
	}
}

/*
	Name: on_player_spawned
	Namespace: namespace_1f0cb9eb
	Checksum: 0xCB697B41
	Offset: 0x788
	Size: 0x8C
	Parameters: 0
	Flags: Linked, Private
*/
function private on_player_spawned()
{
	if(!isbot(self))
	{
		return;
	}
	if(getdvarint(#"bots_invulnerable", 0))
	{
		self val::set(#"devgui", "takedamage", 0);
	}
	self function_78a14db2();
}

/*
	Name: function_ac5215a9
	Namespace: namespace_1f0cb9eb
	Checksum: 0x166554F6
	Offset: 0x820
	Size: 0x1C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_ac5215a9()
{
	self thread add_bot_devgui_menu();
}

/*
	Name: function_8d1480e9
	Namespace: namespace_1f0cb9eb
	Checksum: 0x203C4586
	Offset: 0x848
	Size: 0x1C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8d1480e9()
{
	self thread clear_bot_devgui_menu();
}

/*
	Name: function_40dbe923
	Namespace: namespace_1f0cb9eb
	Checksum: 0x931BE1A2
	Offset: 0x870
	Size: 0x728
	Parameters: 1
	Flags: Linked, Private
*/
function private function_40dbe923(dvarstr)
{
	args = strtok(dvarstr, " ");
	host = util::gethostplayerforbots();
	switch(args[0])
	{
		case "spawn_enemy":
		{
			level function_5aef57f5(host, #"enemy");
			break;
		}
		case "spawn_friendly":
		{
			level function_5aef57f5(host, #"friendly");
			break;
		}
		case "add":
		{
			level devgui_add_bots(host, args[1], int(args[2]));
			break;
		}
		case "remove":
		{
			level devgui_remove_bots(host, args[1]);
			break;
		}
		case "kill":
		{
			level devgui_kill_bots(host, args[1]);
			break;
		}
		case "invulnerable":
		{
			level devgui_invulnerable(host, args[1], args[2]);
			break;
		}
		case "ignoreall":
		{
			level devgui_ignoreall(host, args[1], int(args[2]));
			break;
		}
		case "force_press_button":
		{
			level function_6a4a272b(host, args[1], int(args[2]), 0);
			break;
		}
		case "force_toggle_button":
		{
			level function_6a4a272b(host, args[1], int(args[2]), 1);
			break;
		}
		case "clear_forced_buttons":
		{
			level function_baee1142(host, args[1]);
			break;
		}
		case "force_offhand_primary":
		{
			level function_8bb94cab(host, args[1], #"offhand", #"hash_3b288af170017d79");
			break;
		}
		case "force_offhand_secondary":
		{
			level function_8bb94cab(host, args[1], #"offhand", #"hash_25feaf2bb82d08a");
			break;
		}
		case "force_offhand_special":
		{
			level function_8bb94cab(host, args[1], "ability", #"special");
			break;
		}
		case "force_scorestreak":
		{
			level function_9a65e59a(host, args[1]);
			break;
		}
		case "tpose":
		{
			level devgui_tpose(host, args[1]);
			break;
		}
	}
	if(isdefined(host))
	{
		switch(args[0])
		{
			case "add_fixed_spawn":
			{
				host devgui_add_fixed_spawn_bots(args[1], args[2], args[3]);
				break;
			}
			case "hash_218217dc7d667f07":
			{
				host function_57d0759d(args[1], undefined, args[2], (float(args[3]), float(args[4]), float(args[5])), float(args[6]));
				break;
			}
			case "set_target":
			{
				host devgui_set_target(args[1], args[2]);
				break;
			}
			case "goal":
			{
				host devgui_goal(args[1], args[2]);
				break;
			}
			case "force_aim_copy":
			{
				host function_30f27f9f(args[1]);
				break;
				break;
			}
			case "force_aim_freeze":
			{
				host function_b037d12d(args[1]);
				break;
			}
			case "force_aim_clear":
			{
				host function_f419ffae(args[1]);
				break;
			}
			case "hash_7d471b297adb925d":
			{
				host function_263ca697();
				break;
			}
			case "warp":
			{
				host function_fbdf36c1(args[1]);
				break;
			}
		}
	}
	level notify(#"devgui_bot", {#args:args, #host:host});
}

/*
	Name: devgui_loop
	Namespace: namespace_1f0cb9eb
	Checksum: 0x92233D93
	Offset: 0xFA0
	Size: 0xB8
	Parameters: 0
	Flags: Linked, Private
*/
function private devgui_loop()
{
	while(true)
	{
		waitframe(1);
		dvarstr = getdvarstring(#"devgui_bot", "");
		if(dvarstr == "")
		{
			continue;
		}
		/#
			println(dvarstr);
		#/
		setdvar(#"devgui_bot", "");
		self thread function_40dbe923(dvarstr);
	}
}

/*
	Name: function_9a819607
	Namespace: namespace_1f0cb9eb
	Checksum: 0xF3D65AD
	Offset: 0x1060
	Size: 0x1A6
	Parameters: 2
	Flags: Linked, Private
*/
function private function_9a819607(host, botarg)
{
	if(strisnumber(botarg))
	{
		ent = getentbynum(int(botarg));
		if(isbot(ent))
		{
			return [0:ent];
		}
		return [];
	}
	if(botarg == "all")
	{
		return get_bots();
	}
	if(isdefined(level.teams[botarg]))
	{
		return function_a0f5b7f5(level.teams[botarg]);
	}
	if(isdefined(host))
	{
		if(botarg == "friendly")
		{
			return host get_friendly_bots();
		}
		if(botarg == "enemy")
		{
			return host get_enemy_bots();
		}
	}
	if(botarg == "friendly")
	{
		return function_a0f5b7f5(#"allies");
	}
	if(botarg == "enemy")
	{
		return function_a0f5b7f5(#"axis");
	}
	return [];
}

/*
	Name: get_bots
	Namespace: namespace_1f0cb9eb
	Checksum: 0xAAE2C450
	Offset: 0x1210
	Size: 0xC2
	Parameters: 0
	Flags: Linked
*/
function get_bots()
{
	players = getplayers();
	bots = [];
	foreach(player in players)
	{
		if(isbot(player))
		{
			bots[bots.size] = player;
		}
	}
	return bots;
}

/*
	Name: get_friendly_bots
	Namespace: namespace_1f0cb9eb
	Checksum: 0x386A41C6
	Offset: 0x12E0
	Size: 0xCE
	Parameters: 0
	Flags: Linked
*/
function get_friendly_bots()
{
	players = getplayers(self.team);
	bots = [];
	foreach(player in players)
	{
		if(!isbot(player))
		{
			continue;
		}
		bots[bots.size] = player;
	}
	return bots;
}

/*
	Name: get_enemy_bots
	Namespace: namespace_1f0cb9eb
	Checksum: 0x841F0C2D
	Offset: 0x13B8
	Size: 0xEA
	Parameters: 0
	Flags: Linked
*/
function get_enemy_bots()
{
	players = getplayers();
	bots = [];
	foreach(player in players)
	{
		if(!isbot(player))
		{
			continue;
		}
		if(util::function_fbce7263(player.team, self.team))
		{
			bots[bots.size] = player;
		}
	}
	return bots;
}

/*
	Name: function_a0f5b7f5
	Namespace: namespace_1f0cb9eb
	Checksum: 0x63D8771E
	Offset: 0x14B0
	Size: 0xD6
	Parameters: 1
	Flags: Linked
*/
function function_a0f5b7f5(team)
{
	players = getplayers(team);
	bots = [];
	foreach(player in players)
	{
		if(!isbot(player))
		{
			continue;
		}
		bots[bots.size] = player;
	}
	return bots;
}

/*
	Name: function_d3901b82
	Namespace: namespace_1f0cb9eb
	Checksum: 0x7A3FC450
	Offset: 0x1590
	Size: 0x220
	Parameters: 0
	Flags: Private
*/
function private function_d3901b82()
{
	/#
		level endon(#"game_ended");
		sessionmode = currentsessionmode();
		if(sessionmode != 4)
		{
			var_48c9cde3 = getallcharacterbodies(sessionmode);
			foreach(index in var_48c9cde3)
			{
				if(index == 0)
				{
					continue;
				}
				displayname = makelocalizedstring(getcharacterdisplayname(index, sessionmode));
				assetname = function_9e72a96(getcharacterassetname(index, sessionmode));
				name = ((displayname + "") + assetname) + "";
				cmd = ((((("" + name) + "") + index) + "") + index) + "";
				util::add_debug_command(cmd);
				cmd = ((((("" + name) + "") + index) + "") + index) + "";
				util::add_debug_command(cmd);
			}
		}
	#/
}

/*
	Name: add_bot_devgui_menu
	Namespace: namespace_1f0cb9eb
	Checksum: 0xB2EF4EF
	Offset: 0x17B8
	Size: 0x620
	Parameters: 0
	Flags: Linked, Private
*/
function private add_bot_devgui_menu()
{
	self endon(#"disconnect");
	entnum = self getentitynumber();
	if(entnum >= 16)
	{
		return;
	}
	i = 0;
	self add_bot_devgui_cmd(entnum, ("Ignore All:" + i) + ("/On"), 0, "ignoreall", "1");
	self add_bot_devgui_cmd(entnum, ("Ignore All:" + i) + ("/Off"), 1, "ignoreall", "0");
	i++;
	self add_bot_devgui_cmd(entnum, ("Set Target:" + i) + ("/From Crosshair"), 0, "set_target", "crosshair");
	self add_bot_devgui_cmd(entnum, ("Set Target:" + i) + ("/Attack Me"), 1, "set_target", "me");
	self add_bot_devgui_cmd(entnum, ("Set Target:" + i) + ("/Clear"), 2, "set_target", "clear");
	i++;
	self add_bot_devgui_cmd(entnum, ("Set Goal:" + i) + ("/Force"), 0, "goal", "force");
	self add_bot_devgui_cmd(entnum, ("Set Goal:" + i) + ("/Add Forced"), 1, "goal", "add_forced");
	self add_bot_devgui_cmd(entnum, ("Set Goal:" + i) + ("/Clear Forced"), 2, "goal", "clear");
	self add_bot_devgui_cmd(entnum, ("Set Goal:" + i) + ("/Radius"), 3, "goal", "set");
	self add_bot_devgui_cmd(entnum, ("Set Goal:" + i) + ("/Region"), 4, "goal", "set_region");
	self add_bot_devgui_cmd(entnum, ("Set Goal:" + i) + ("/Follow Me"), 5, "goal", "me");
	i++;
	i++;
	if(!is_true(level.var_fa5cacde))
	{
		self function_ade411a3(entnum, i);
		i++;
		self add_bot_devgui_cmd(entnum, ("Force Aim:" + i) + ("/Copy Me"), 0, "force_aim_copy");
		self add_bot_devgui_cmd(entnum, ("Force Aim:" + i) + ("/Freeze "), 1, "force_aim_freeze");
		self add_bot_devgui_cmd(entnum, ("Force Aim:" + i) + ("/Clear "), 2, "force_aim_clear");
		i++;
		self add_bot_devgui_cmd(entnum, ("Force Use:" + i) + ("/Lethal"), 0, "force_offhand_primary");
		self add_bot_devgui_cmd(entnum, ("Force Use:" + i) + ("/Tactical"), 1, "force_offhand_secondary");
		self add_bot_devgui_cmd(entnum, ("Force Use:" + i) + ("/Field Upgrade"), 2, "force_offhand_special");
		self add_bot_devgui_cmd(entnum, ("Force Use:" + i) + ("/Inventory Scorestreak"), 3, "force_scorestreak");
		i++;
	}
	self add_bot_devgui_cmd(entnum, ("Invulnerable:" + i) + ("/On"), 0, "invulnerable", "on");
	self add_bot_devgui_cmd(entnum, ("Invulnerable:" + i) + ("/Off"), 1, "invulnerable", "off");
	i++;
	self add_bot_devgui_cmd(entnum, "Warp to Crosshair", i, "warp");
	i++;
	self add_bot_devgui_cmd(entnum, "T-Pose", i, "tpose");
	i++;
	self add_bot_devgui_cmd(entnum, "Kill", i, "kill");
	i++;
	self add_bot_devgui_cmd(entnum, "Remove", i, "remove");
	i++;
}

/*
	Name: add_bot_devgui_cmd
	Namespace: namespace_1f0cb9eb
	Checksum: 0xD3773514
	Offset: 0x1DE0
	Size: 0xE4
	Parameters: 5
	Flags: Linked, Private
*/
function private add_bot_devgui_cmd(entnum, path, sortkey, devguiarg, cmdargs)
{
	if(!isdefined(cmdargs))
	{
		cmdargs = "";
	}
	cmd = ((((((((((((((("devgui_cmd \"Bots/") + entnum) + " ") + self.name) + ":") + entnum) + ("/") + path) + ":") + sortkey) + "\" \"set devgui_bot ") + devguiarg) + " ") + entnum) + " ") + cmdargs) + "\"";
	util::add_debug_command(cmd);
}

/*
	Name: function_f105dc20
	Namespace: namespace_1f0cb9eb
	Checksum: 0xDEC21588
	Offset: 0x1ED0
	Size: 0xDC
	Parameters: 5
	Flags: Linked, Private
*/
function private function_f105dc20(entnum, var_eeb5e4bd, var_8a5cf3f4, var_1e443b4, buttonbit)
{
	self add_bot_devgui_cmd(entnum, (((("Force Button:" + var_eeb5e4bd) + ("/") + var_8a5cf3f4) + ":") + var_1e443b4) + ("/Press"), 0, "force_press_button", buttonbit);
	self add_bot_devgui_cmd(entnum, (((("Force Button:" + var_eeb5e4bd) + ("/") + var_8a5cf3f4) + ":") + var_1e443b4) + ("/Toggle"), 1, "force_toggle_button", buttonbit);
}

/*
	Name: function_ade411a3
	Namespace: namespace_1f0cb9eb
	Checksum: 0x77C7BB9E
	Offset: 0x1FB8
	Size: 0x32C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_ade411a3(entnum, var_eeb5e4bd)
{
	i = 0;
	self function_f105dc20(entnum, var_eeb5e4bd, "Fire", i, 0);
	i++;
	self function_f105dc20(entnum, var_eeb5e4bd, "Sprint", i, 1);
	i++;
	self function_f105dc20(entnum, var_eeb5e4bd, "ADS", i, 11);
	i++;
	self function_f105dc20(entnum, var_eeb5e4bd, "Jump", i, 10);
	i++;
	self function_f105dc20(entnum, var_eeb5e4bd, "Change Seat", i, 28);
	i++;
	self function_f105dc20(entnum, var_eeb5e4bd, "Reload", i, 4);
	i++;
	self function_f105dc20(entnum, var_eeb5e4bd, "Activate", i, 3);
	i++;
	self function_f105dc20(entnum, var_eeb5e4bd, "Use | Reload", i, 5);
	i++;
	self function_f105dc20(entnum, var_eeb5e4bd, "Melee", i, 2);
	i++;
	self function_f105dc20(entnum, var_eeb5e4bd, "Offhand Secondary", i, 15);
	i++;
	self function_f105dc20(entnum, var_eeb5e4bd, "Vehicle Fire", i, 34);
	i++;
	self function_f105dc20(entnum, var_eeb5e4bd, "Vehicle Fire 2", i, 35);
	i++;
	self function_f105dc20(entnum, var_eeb5e4bd, "Increment ADS Zoom Select", i, 31);
	i++;
	self function_f105dc20(entnum, var_eeb5e4bd, "Increment ADS Zoom Smooth", i, 32);
	i++;
	self function_f105dc20(entnum, var_eeb5e4bd, "Decrement ADS Zoom Smooth", i, 33);
	i++;
	self add_bot_devgui_cmd(entnum, ("Force Button:" + var_eeb5e4bd) + ("/Clear All"), 500, "clear_forced_buttons");
}

/*
	Name: clear_bot_devgui_menu
	Namespace: namespace_1f0cb9eb
	Checksum: 0x5FD394E6
	Offset: 0x22F0
	Size: 0x7C
	Parameters: 0
	Flags: Linked
*/
function clear_bot_devgui_menu()
{
	entnum = self getentitynumber();
	if(entnum >= 16)
	{
		return;
	}
	cmd = (((("devgui_remove \"Bots/") + entnum) + " ") + self.name) + "\"";
	util::add_debug_command(cmd);
}

/*
	Name: devgui_add_bots
	Namespace: namespace_1f0cb9eb
	Checksum: 0x9E0E56F3
	Offset: 0x2378
	Size: 0xC4
	Parameters: 3
	Flags: Linked, Private
*/
function private devgui_add_bots(host, botarg, count)
{
	team = function_881d3aa(host, botarg);
	if(!isdefined(team))
	{
		return;
	}
	players = getplayers(team);
	max_players = player::function_d36b6597();
	if(players.size < max_players || max_players == 0)
	{
		level thread bot::add_bots(count, team);
	}
}

/*
	Name: function_5aef57f5
	Namespace: namespace_1f0cb9eb
	Checksum: 0x1B23EF13
	Offset: 0x2448
	Size: 0x96
	Parameters: 2
	Flags: Linked, Private
*/
function private function_5aef57f5(host, botarg)
{
	level endon(#"game_ended");
	team = function_881d3aa(host, botarg);
	if(!isdefined(team))
	{
		return;
	}
	bot = bot::add_bot(team);
	bot.ignoreall = 1;
	bot.bot.var_261b9ab3 = 1;
}

/*
	Name: devgui_add_fixed_spawn_bots
	Namespace: namespace_1f0cb9eb
	Checksum: 0x9692C482
	Offset: 0x24E8
	Size: 0x39C
	Parameters: 3
	Flags: Linked, Private
*/
function private devgui_add_fixed_spawn_bots(botarg, var_b27e53da, countarg)
{
	team = function_881d3aa(self, botarg);
	if(!isdefined(team))
	{
		return;
	}
	if(!isdefined(countarg))
	{
		countarg = 1;
	}
	original_count = max(int(countarg), 1);
	count = original_count;
	players = getplayers(team);
	max_players = player::function_d36b6597();
	if(max_players > 0)
	{
		count = min(count, max_players - players.size);
	}
	if(count <= 0)
	{
		return;
	}
	if(!isdefined(var_b27e53da))
	{
		var_b27e53da = -1;
	}
	roleindex = int(var_b27e53da);
	trace = self eye_trace(0, 1);
	spawndir = self.origin - trace[#"position"];
	spawnangles = vectortoangles(spawndir);
	offset = vectorscale((0, 0, 1), 5);
	origin = trace[#"position"] + offset;
	bots = function_bd48ef10(team, count, origin, spawnangles[1], roleindex);
	vehicle = trace[#"entity"];
	if(isvehicle(vehicle))
	{
		pos = trace[#"position"];
		seatindex = vehicle function_eee09f16(pos);
		if(isdefined(seatindex))
		{
			foreach(bot in bots)
			{
				bot bot::function_bcc79b86(vehicle, seatindex);
			}
		}
	}
	/#
		println((((((((((("" + botarg) + "") + original_count) + "") + origin[0]) + "") + origin[1]) + "") + origin[2]) + "") + spawnangles[1]);
	#/
}

/*
	Name: function_57d0759d
	Namespace: namespace_1f0cb9eb
	Checksum: 0xFF1D29F
	Offset: 0x2890
	Size: 0x196
	Parameters: 5
	Flags: Linked, Private
*/
function private function_57d0759d(botarg, var_b27e53da, countarg, origin, angle)
{
	team = function_881d3aa(self, botarg);
	if(!isdefined(team))
	{
		return;
	}
	if(!isdefined(countarg))
	{
		countarg = 1;
	}
	count = max(int(countarg), 1);
	players = getplayers(team);
	max_players = player::function_d36b6597();
	if(max_players > 0)
	{
		count = min(count, max_players - players.size);
	}
	if(count <= 0)
	{
		return;
	}
	if(!isdefined(var_b27e53da))
	{
		var_b27e53da = -1;
	}
	roleindex = int(var_b27e53da);
	offset = vectorscale((0, 0, 1), 5);
	origin = origin + offset;
	bots = function_bd48ef10(team, count, origin, angle, roleindex);
}

/*
	Name: function_bd48ef10
	Namespace: namespace_1f0cb9eb
	Checksum: 0x1E933FF9
	Offset: 0x2A30
	Size: 0x1AA
	Parameters: 5
	Flags: Linked, Private
*/
function private function_bd48ef10(team, count, origin, yaw, roleindex)
{
	bots = [];
	if(!isdefined(bots))
	{
		bots = [];
	}
	else if(!isarray(bots))
	{
		bots = array(bots);
	}
	bots[bots.size] = self bot::add_fixed_spawn_bot(team, origin, yaw, roleindex);
	/#
		spiral = dev::function_a4ccb933(origin, yaw);
		for(i = 0; i < count - 1; i++)
		{
			dev::function_df0b6f84(spiral);
			origin = dev::function_98c05766(spiral);
			angle = dev::function_4783f10c(spiral);
			if(!isdefined(bots))
			{
				bots = [];
			}
			else if(!isarray(bots))
			{
				bots = array(bots);
			}
			bots[bots.size] = self bot::add_fixed_spawn_bot(team, origin, angle, roleindex);
		}
	#/
	return bots;
}

/*
	Name: function_881d3aa
	Namespace: namespace_1f0cb9eb
	Checksum: 0xF5023151
	Offset: 0x2BE8
	Size: 0xD2
	Parameters: 2
	Flags: Linked, Private
*/
function private function_881d3aa(host, botarg)
{
	if(botarg == "all")
	{
		return #"none";
	}
	if(isdefined(level.teams[botarg]))
	{
		return level.teams[botarg];
	}
	friendlyteam = #"allies";
	if(isdefined(host) && host.team != #"spectator")
	{
		friendlyteam = host.team;
	}
	if(botarg == "friendly")
	{
		return friendlyteam;
	}
	return function_8dbb49c0(friendlyteam);
}

/*
	Name: function_8dbb49c0
	Namespace: namespace_1f0cb9eb
	Checksum: 0x243C9831
	Offset: 0x2CC8
	Size: 0x100
	Parameters: 1
	Flags: Linked, Private
*/
function private function_8dbb49c0(ignoreteam)
{
	/#
		assert(isdefined(ignoreteam));
	#/
	maxteamplayers = player::function_d36b6597();
	foreach(team, _ in level.teams)
	{
		if(team == ignoreteam)
		{
			continue;
		}
		players = getplayers(team);
		if(maxteamplayers > 0 && players.size < maxteamplayers)
		{
			return team;
		}
	}
	return undefined;
}

/*
	Name: devgui_remove_bots
	Namespace: namespace_1f0cb9eb
	Checksum: 0x7DA05DD5
	Offset: 0x2DD0
	Size: 0xB8
	Parameters: 2
	Flags: Linked, Private
*/
function private devgui_remove_bots(host, botarg)
{
	bots = function_9a819607(host, botarg);
	foreach(bot in bots)
	{
		level thread bot::remove_bot(bot);
	}
}

/*
	Name: devgui_ignoreall
	Namespace: namespace_1f0cb9eb
	Checksum: 0xFACA56DD
	Offset: 0x2E90
	Size: 0xB6
	Parameters: 3
	Flags: Linked, Private
*/
function private devgui_ignoreall(host, botarg, cmdarg)
{
	bots = function_9a819607(host, botarg);
	foreach(bot in bots)
	{
		bot.ignoreall = cmdarg;
	}
}

/*
	Name: devgui_set_target
	Namespace: namespace_1f0cb9eb
	Checksum: 0xB44888BD
	Offset: 0x2F50
	Size: 0x190
	Parameters: 2
	Flags: Linked, Private
*/
function private devgui_set_target(botarg, cmdarg)
{
	target = undefined;
	switch(cmdarg)
	{
		case "crosshair":
		{
			target = self function_59842621();
			break;
		}
		case "me":
		{
			target = self;
			break;
		}
		case "clear":
		{
			break;
		}
		default:
		{
			return;
		}
	}
	bots = function_9a819607(self, botarg);
	foreach(bot in bots)
	{
		if(isdefined(target))
		{
			if(target != bot)
			{
				bot setentitytarget(target);
				bot getperfectinfo(target, 1);
			}
			continue;
		}
		bot clearentitytarget();
	}
}

/*
	Name: devgui_goal
	Namespace: namespace_1f0cb9eb
	Checksum: 0x48086D69
	Offset: 0x30E8
	Size: 0x132
	Parameters: 2
	Flags: Linked, Private
*/
function private devgui_goal(botarg, cmdarg)
{
	switch(cmdarg)
	{
		case "set":
		{
			self set_goal(botarg, 0);
			return;
		}
		case "set_region":
		{
			self function_417ef9e7(botarg);
			return;
		}
		case "force":
		{
			self set_goal(botarg, 1);
			return;
		}
		case "add_forced":
		{
			self function_93996ae6(botarg);
			return;
		}
		case "me":
		{
			self set_goal_ent(botarg, self);
			return;
		}
		case "clear":
		{
			self function_be8f790e(botarg);
			return;
		}
	}
}

/*
	Name: set_goal
	Namespace: namespace_1f0cb9eb
	Checksum: 0xB206A69D
	Offset: 0x3228
	Size: 0x2D8
	Parameters: 2
	Flags: Linked, Private
*/
function private set_goal(botarg, force)
{
	if(!isdefined(force))
	{
		force = 0;
	}
	trace = self eye_trace(1);
	pos = trace[#"position"];
	if(force)
	{
		pos = getclosestpointonnavmesh(pos, 16, 16);
		if(!isdefined(pos))
		{
			return;
		}
	}
	bots = function_9a819607(self, botarg);
	vehicle = (isvehicle(trace[#"entity"]) ? trace[#"entity"] : undefined);
	foreach(bot in bots)
	{
		bot notify(#"hash_7597caa242064632");
		bot botreleasemanualcontrol();
		bot setgoal(pos, force);
		bot.goalradius = 512;
		if(bot isinvehicle())
		{
			currentvehicle = bot getvehicleoccupied();
			if(vehicle === currentvehicle)
			{
				seatindex = vehicle function_d1409e38(pos);
				if(!vehicle isvehicleseatoccupied(seatindex))
				{
					vehicle function_1090ca(bot, seatindex);
				}
			}
			else
			{
				var_c3eee21b = currentvehicle getoccupantseat(bot);
				currentvehicle usevehicle(bot, var_c3eee21b);
			}
			continue;
		}
		if(isdefined(vehicle))
		{
			seatindex = vehicle function_eee09f16(pos);
			if(isdefined(seatindex))
			{
				vehicle usevehicle(bot, seatindex);
			}
		}
	}
}

/*
	Name: function_417ef9e7
	Namespace: namespace_1f0cb9eb
	Checksum: 0x6E1C04D6
	Offset: 0x3508
	Size: 0x148
	Parameters: 1
	Flags: Linked, Private
*/
function private function_417ef9e7(botarg)
{
	trace = self eye_trace(1);
	bots = function_9a819607(self, botarg);
	pos = trace[#"position"];
	point = getclosesttacpoint(pos);
	if(!isdefined(point))
	{
		return;
	}
	foreach(bot in bots)
	{
		bot notify(#"hash_7597caa242064632");
		bot botreleasemanualcontrol();
		bot setgoal(point.region);
	}
}

/*
	Name: set_goal_ent
	Namespace: namespace_1f0cb9eb
	Checksum: 0x30BFC0C6
	Offset: 0x3658
	Size: 0x160
	Parameters: 2
	Flags: Linked, Private
*/
function private set_goal_ent(botarg, ent)
{
	bots = function_9a819607(self, botarg);
	foreach(bot in bots)
	{
		bot notify(#"hash_7597caa242064632");
		bot botreleasemanualcontrol();
		bot setgoal(ent);
		bot.goalradius = 96;
		if(bot isinvehicle())
		{
			vehicle = bot getvehicleoccupied();
			seatindex = vehicle getoccupantseat(bot);
			vehicle usevehicle(bot, seatindex);
		}
	}
}

/*
	Name: function_be8f790e
	Namespace: namespace_1f0cb9eb
	Checksum: 0x84AFF78E
	Offset: 0x37C0
	Size: 0xC0
	Parameters: 1
	Flags: Linked, Private
*/
function private function_be8f790e(botarg)
{
	bots = function_9a819607(self, botarg);
	foreach(bot in bots)
	{
		bot notify(#"hash_7597caa242064632");
		bot clearforcedgoal();
	}
}

/*
	Name: function_93996ae6
	Namespace: namespace_1f0cb9eb
	Checksum: 0x47249F57
	Offset: 0x3888
	Size: 0x1D0
	Parameters: 1
	Flags: Linked, Private
*/
function private function_93996ae6(botarg)
{
	trace = self eye_trace(1);
	pos = trace[#"position"];
	pos = getclosestpointonnavmesh(pos, 16, 16);
	if(!isdefined(pos))
	{
		return;
	}
	bots = function_9a819607(self, botarg);
	foreach(bot in bots)
	{
		bot botreleasemanualcontrol();
		goals = bot.bot.var_bdb21e1f;
		if(isdefined(goals))
		{
			goals[goals.size] = pos;
			continue;
		}
		goals = [];
		bot.bot.var_bdb21e1f = goals;
		info = bot function_4794d6a3();
		if(info.goalforced)
		{
			goals[goals.size] = info.goalpos;
		}
		goals[goals.size] = pos;
		bot function_cc8c642a(goals);
	}
}

/*
	Name: function_cc8c642a
	Namespace: namespace_1f0cb9eb
	Checksum: 0xCD4C830C
	Offset: 0x3A60
	Size: 0xBC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_cc8c642a(&goals)
{
	self endoncallback(&function_bc3bbe26, #"death", #"hash_7597caa242064632");
	i = 0;
	while(true)
	{
		self setgoal(goals[i], 1);
		while(goals.size <= 1)
		{
			waitframe(1);
		}
		self waittill(#"goal");
		i = (i + 1) % goals.size;
	}
}

/*
	Name: function_bc3bbe26
	Namespace: namespace_1f0cb9eb
	Checksum: 0xB69CAA4E
	Offset: 0x3B28
	Size: 0x1A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_bc3bbe26(notifyhash)
{
	self.bot.var_bdb21e1f = undefined;
}

/*
	Name: function_6a4a272b
	Namespace: namespace_1f0cb9eb
	Checksum: 0x417FADA0
	Offset: 0x3B50
	Size: 0x140
	Parameters: 4
	Flags: Linked, Private
*/
function private function_6a4a272b(host, botarg, cmdarg, toggle)
{
	bots = function_9a819607(host, botarg);
	foreach(bot in bots)
	{
		if(!isdefined(bot.bot.var_458ddbc0))
		{
			bot.bot.var_458ddbc0 = [];
		}
		var_c3974b2d = bot.bot.var_458ddbc0;
		if(toggle)
		{
			var_c3974b2d[cmdarg] = (is_true(var_c3974b2d[cmdarg]) ? undefined : 1);
			continue;
		}
		var_c3974b2d[cmdarg] = 2;
	}
}

/*
	Name: function_baee1142
	Namespace: namespace_1f0cb9eb
	Checksum: 0x4C2D5BEC
	Offset: 0x3C98
	Size: 0xB6
	Parameters: 2
	Flags: Linked, Private
*/
function private function_baee1142(host, botarg)
{
	bots = function_9a819607(host, botarg);
	foreach(bot in bots)
	{
		bot.bot.var_458ddbc0 = [];
	}
}

/*
	Name: function_8bb94cab
	Namespace: namespace_1f0cb9eb
	Checksum: 0xA90A7FEA
	Offset: 0x3D58
	Size: 0x120
	Parameters: 4
	Flags: Linked, Private
*/
function private function_8bb94cab(host, botarg, inventorytype, offhandslot)
{
	bots = function_9a819607(host, botarg);
	foreach(bot in bots)
	{
		weapon = bot function_b24b9a1e(inventorytype, offhandslot);
		if(isdefined(weapon))
		{
			bot givemaxammo(weapon);
			bot bot_action::function_d6318084(weapon);
			bot bot_action::function_32020adf(3);
		}
	}
}

/*
	Name: function_b24b9a1e
	Namespace: namespace_1f0cb9eb
	Checksum: 0xF3F29539
	Offset: 0x3E80
	Size: 0xD2
	Parameters: 2
	Flags: Linked, Private
*/
function private function_b24b9a1e(inventorytype, offhandslot)
{
	weapons = self getweaponslist();
	foreach(weapon in weapons)
	{
		if(weapon.inventorytype == inventorytype && weapon.offhandslot == offhandslot)
		{
			return weapon;
		}
	}
	return undefined;
}

/*
	Name: function_9a65e59a
	Namespace: namespace_1f0cb9eb
	Checksum: 0xDD354A6C
	Offset: 0x3F60
	Size: 0xF8
	Parameters: 2
	Flags: Linked, Private
*/
function private function_9a65e59a(host, botarg)
{
	bots = function_9a819607(host, botarg);
	foreach(bot in bots)
	{
		weapon = bot function_ef14f060();
		if(isdefined(weapon))
		{
			bot bot_action::function_d6318084(weapon);
			bot bot_action::function_32020adf(3);
		}
	}
}

/*
	Name: function_ef14f060
	Namespace: namespace_1f0cb9eb
	Checksum: 0xF09D0A16
	Offset: 0x4060
	Size: 0x1DC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_ef14f060()
{
	weapons = self getweaponslist();
	foreach(weapon in weapons)
	{
		if(weapon.inventorytype != #"item" || self getweaponammoclip(weapon) <= 0)
		{
			continue;
		}
		foreach(name in self.killstreak)
		{
			if(weapon.name == name)
			{
				continue;
			}
		}
		foreach(killstreak in level.killstreaks)
		{
			if(killstreak.weapon == weapon)
			{
				return weapon;
			}
		}
	}
	return undefined;
}

/*
	Name: function_fbdf36c1
	Namespace: namespace_1f0cb9eb
	Checksum: 0xE31A193C
	Offset: 0x4248
	Size: 0x1A8
	Parameters: 1
	Flags: Linked, Private
*/
function private function_fbdf36c1(botarg)
{
	bots = function_9a819607(self, botarg);
	yaw = absangleclamp360(self.angles[1] + 180);
	angle = (0, yaw, 0);
	trace = self eye_trace(1, 1);
	pos = trace[#"position"];
	foreach(bot in bots)
	{
		bot dontinterpolate();
		bot setplayerangles(angle);
		bot setorigin(pos);
		if(bot function_4794d6a3().goalforced)
		{
			bot setgoal(pos, 1);
		}
	}
}

/*
	Name: function_30f27f9f
	Namespace: namespace_1f0cb9eb
	Checksum: 0xCF9D4C63
	Offset: 0x43F8
	Size: 0xB0
	Parameters: 1
	Flags: Linked, Private
*/
function private function_30f27f9f(botarg)
{
	bots = function_9a819607(self, botarg);
	foreach(bot in bots)
	{
		bot thread function_2e08087e(self);
	}
}

/*
	Name: function_b037d12d
	Namespace: namespace_1f0cb9eb
	Checksum: 0xB937998B
	Offset: 0x44B0
	Size: 0xCE
	Parameters: 1
	Flags: Linked, Private
*/
function private function_b037d12d(botarg)
{
	bots = function_9a819607(self, botarg);
	foreach(bot in bots)
	{
		bot notify(#"hash_1fc88ab5756d805");
		bot.bot.var_5efe88e4 = bot getplayerangles();
	}
}

/*
	Name: function_f419ffae
	Namespace: namespace_1f0cb9eb
	Checksum: 0x1571F8E8
	Offset: 0x4588
	Size: 0xBE
	Parameters: 1
	Flags: Linked, Private
*/
function private function_f419ffae(botarg)
{
	bots = function_9a819607(self, botarg);
	foreach(bot in bots)
	{
		bot notify(#"hash_1fc88ab5756d805");
		bot.bot.var_5efe88e4 = undefined;
	}
}

/*
	Name: function_2e08087e
	Namespace: namespace_1f0cb9eb
	Checksum: 0xEE550C4F
	Offset: 0x4650
	Size: 0x11A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_2e08087e(player)
{
	self endon(#"death", #"disconnect", #"hash_1fc88ab5756d805", #"hash_6280ac8ed281ce3c");
	while(isdefined(player) && isalive(player))
	{
		angles = player getplayerangles();
		var_944f41ea = getdvarint(#"hash_68c18f3309126669", 0) * 15;
		var_6cd5d6b6 = angles + (0, var_944f41ea, 0);
		self.bot.var_5efe88e4 = angleclamp180(var_6cd5d6b6);
		waitframe(1);
	}
	self.bot.var_5efe88e4 = undefined;
}

/*
	Name: devgui_tpose
	Namespace: namespace_1f0cb9eb
	Checksum: 0x6AF2F51B
	Offset: 0x4778
	Size: 0xE8
	Parameters: 2
	Flags: Linked
*/
function devgui_tpose(host, botarg)
{
	bots = function_9a819607(host, botarg);
	foreach(bot in bots)
	{
		setdvar(#"bg_boastenabled", 1);
		bot function_c6775cf9("dev_boast_tpose");
	}
}

/*
	Name: devgui_invulnerable
	Namespace: namespace_1f0cb9eb
	Checksum: 0x5E7CC911
	Offset: 0x4868
	Size: 0x118
	Parameters: 3
	Flags: Linked, Private
*/
function private devgui_invulnerable(host, botarg, cmdarg)
{
	bots = function_9a819607(host, botarg);
	foreach(bot in bots)
	{
		if(cmdarg == "on")
		{
			bot val::set(#"devgui", "takedamage", 0);
			continue;
		}
		bot val::reset(#"devgui", "takedamage");
	}
}

/*
	Name: devgui_kill_bots
	Namespace: namespace_1f0cb9eb
	Checksum: 0xB3A0A164
	Offset: 0x4988
	Size: 0x140
	Parameters: 2
	Flags: Linked, Private
*/
function private devgui_kill_bots(host, botarg)
{
	bots = function_9a819607(host, botarg);
	foreach(bot in bots)
	{
		if(!isalive(bot))
		{
			continue;
		}
		bot val::set(#"devgui_kill", "takedamage", 1);
		bot dodamage(bot.health + 1000, bot.origin);
		bot val::reset(#"devgui_kill", "takedamage");
	}
}

/*
	Name: function_263ca697
	Namespace: namespace_1f0cb9eb
	Checksum: 0x1BCA05A8
	Offset: 0x4AD0
	Size: 0x180
	Parameters: 0
	Flags: Linked, Private
*/
function private function_263ca697()
{
	weapon = self getcurrentweapon();
	weaponoptions = self function_ade49959(weapon);
	var_e91aba42 = self function_8cbd254d(weapon);
	/#
		setdvar(#"bot_spawn_weapon", function_a16a090d(weapon.rootweapon));
		setdvar(#"hash_c6e51858c88a5ee", util::function_2146bd83(weapon));
	#/
	bots = get_bots();
	foreach(bot in bots)
	{
		bot function_35e77034(weapon, weaponoptions, var_e91aba42);
	}
}

/*
	Name: function_78a14db2
	Namespace: namespace_1f0cb9eb
	Checksum: 0x1CABB5BC
	Offset: 0x4C58
	Size: 0xBC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_78a14db2()
{
	weapon = undefined;
	if(getdvarstring(#"bot_spawn_weapon", "") != "")
	{
		weapon = util::get_weapon_by_name(getdvarstring(#"bot_spawn_weapon"), getdvarstring(#"hash_c6e51858c88a5ee"));
		if(isdefined(weapon))
		{
			self function_35e77034(weapon);
		}
	}
}

/*
	Name: function_35e77034
	Namespace: namespace_1f0cb9eb
	Checksum: 0x77765297
	Offset: 0x4D20
	Size: 0xB4
	Parameters: 3
	Flags: Linked, Private
*/
function private function_35e77034(weapon, weaponoptions, var_e91aba42)
{
	if(!isdefined(weapon) || weapon == level.weaponnone)
	{
		return;
	}
	self function_85e7342b();
	self giveweapon(weapon, weaponoptions, var_e91aba42);
	self givemaxammo(weapon);
	self switchtoweaponimmediate(weapon);
	self setspawnweapon(weapon);
}

/*
	Name: function_85e7342b
	Namespace: namespace_1f0cb9eb
	Checksum: 0xE2183553
	Offset: 0x4DE0
	Size: 0xA8
	Parameters: 0
	Flags: Linked, Private
*/
function private function_85e7342b()
{
	weapons = self getweaponslistprimaries();
	foreach(weapon in weapons)
	{
		self takeweapon(weapon);
	}
}

/*
	Name: eye_trace
	Namespace: namespace_1f0cb9eb
	Checksum: 0x82D90FBF
	Offset: 0x4E90
	Size: 0xEA
	Parameters: 2
	Flags: Linked, Private
*/
function private eye_trace(hitents, var_18daeece)
{
	if(!isdefined(hitents))
	{
		hitents = 0;
	}
	if(!isdefined(var_18daeece))
	{
		var_18daeece = 0;
	}
	angles = self getplayerangles();
	fwd = anglestoforward(angles);
	eyeheight = self getplayerviewheight();
	eye = self.origin + (0, 0, eyeheight);
	end = eye + (fwd * 8000);
	return bullettrace(eye, end, hitents, self, var_18daeece);
}

/*
	Name: function_59842621
	Namespace: namespace_1f0cb9eb
	Checksum: 0x604642CF
	Offset: 0x4F88
	Size: 0x46
	Parameters: 0
	Flags: Linked, Private
*/
function private function_59842621()
{
	trace = self eye_trace(1);
	targetentity = trace[#"entity"];
	return targetentity;
}

/*
	Name: function_eee09f16
	Namespace: namespace_1f0cb9eb
	Checksum: 0xEE8EB843
	Offset: 0x4FD8
	Size: 0x118
	Parameters: 1
	Flags: Linked, Private
*/
function private function_eee09f16(pos)
{
	seatindex = undefined;
	var_d64c5caf = undefined;
	for(i = 0; i < 11; i++)
	{
		if(self function_dcef0ba1(i))
		{
			var_3693c73b = self function_defc91b2(i);
			if(isdefined(var_3693c73b) && var_3693c73b >= 0 && !self isvehicleseatoccupied(i))
			{
				dist = distance(pos, self function_5051cc0c(i));
				if(!isdefined(seatindex) || var_d64c5caf > dist)
				{
					seatindex = i;
					var_d64c5caf = dist;
				}
			}
		}
	}
	return seatindex;
}

/*
	Name: function_d1409e38
	Namespace: namespace_1f0cb9eb
	Checksum: 0x87515CB4
	Offset: 0x50F8
	Size: 0xF8
	Parameters: 1
	Flags: Linked, Private
*/
function private function_d1409e38(pos)
{
	seatindex = undefined;
	var_d64c5caf = undefined;
	for(i = 0; i < 11; i++)
	{
		if(self function_dcef0ba1(i))
		{
			var_3693c73b = self function_defc91b2(i);
			if(isdefined(var_3693c73b) && var_3693c73b >= 0)
			{
				dist = distance(pos, self function_5051cc0c(i));
				if(!isdefined(seatindex) || var_d64c5caf > dist)
				{
					seatindex = i;
					var_d64c5caf = dist;
				}
			}
		}
	}
	return seatindex;
}

