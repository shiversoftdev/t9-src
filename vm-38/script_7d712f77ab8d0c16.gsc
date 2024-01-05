#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\influencers_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_797605b0;

/*
	Name: function_af337d3a
	Namespace: namespace_797605b0
	Checksum: 0x845BEB10
	Offset: 0xA8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_af337d3a()
{
	level notify(-1877745472);
}

#namespace spawning;

/*
	Name: function_a860c440
	Namespace: spawning
	Checksum: 0x30A2E227
	Offset: 0xC8
	Size: 0x20
	Parameters: 1
	Flags: None
*/
function function_a860c440(var_ef54e156)
{
	/#
		level.var_c99a6ece = var_ef54e156;
	#/
}

/*
	Name: spawnpoint_debug
	Namespace: spawning
	Checksum: 0x5B0E1DE5
	Offset: 0xF0
	Size: 0x3C8
	Parameters: 0
	Flags: None
*/
function spawnpoint_debug()
{
	/#
		a_spawnlists = getspawnlists();
		index = 0;
		foreach(s_list in a_spawnlists)
		{
			adddebugcommand(((("" + s_list) + "") + index) + "");
			index++;
		}
		adddebugcommand(("" + "") + "");
		adddebugcommand("");
		adddebugcommand("");
		while(true)
		{
			spawnsystem_debug_command = getdvarstring(#"spawnsystem_debug_command");
			switch(spawnsystem_debug_command)
			{
				case "next_best":
				{
					selectedplayerindex = getdvarint(#"spawnsystem_debug_current_player", 0);
					foreach(player in level.players)
					{
						if(player getentitynumber() == selectedplayerindex)
						{
							selectedplayer = player;
							break;
						}
					}
					if(!isdefined(selectedplayer))
					{
						continue;
					}
					point_team = selectedplayer.pers[#"team"];
					influencer_team = selectedplayer.pers[#"team"];
					vis_team_mask = util::getotherteamsmask(selectedplayer.pers[#"team"]);
					nextbestspawnpoint = getbestspawnpoint(point_team, influencer_team, vis_team_mask, selectedplayer, 0);
					selectedplayer setorigin(nextbestspawnpoint[#"origin"]);
					selectedplayer setplayerangles(nextbestspawnpoint[#"angles"]);
					break;
				}
				case "refresh":
				{
					level flag::set(#"spawnpoints_dirty");
					break;
				}
			}
			setdvar(#"spawnsystem_debug_command", "");
			wait(0.5);
		}
	#/
}

/*
	Name: function_df47057f
	Namespace: spawning
	Checksum: 0xF30FC024
	Offset: 0x4C0
	Size: 0x11C
	Parameters: 4
	Flags: None
*/
function function_df47057f(team, label, var_2f64048d, spawnpoints)
{
	/#
		if(!spawnpoints.size)
		{
			return;
		}
		var_2e980658 = spawnstruct();
		var_2e980658.name = label + var_2f64048d;
		var_2e980658.spawns = spawnpoints;
		if(!isdefined(level.var_94f4ca81.dataset))
		{
			level.var_94f4ca81.dataset = [];
		}
		else if(!isarray(level.var_94f4ca81.dataset))
		{
			level.var_94f4ca81.dataset = array(level.var_94f4ca81.dataset);
		}
		level.var_94f4ca81.dataset[level.var_94f4ca81.dataset.size] = var_2e980658;
	#/
}

/*
	Name: function_25e7711a
	Namespace: spawning
	Checksum: 0xBB7CA74A
	Offset: 0x5E8
	Size: 0x6C
	Parameters: 4
	Flags: None
*/
function function_25e7711a(var_2ccead42, team, label, var_2f64048d)
{
	/#
		spawnpoints = getspawnpoints(var_2ccead42, team);
		function_df47057f(team, label, var_2f64048d, spawnpoints);
	#/
}

/*
	Name: function_48a6b85
	Namespace: spawning
	Checksum: 0xF51AB269
	Offset: 0x660
	Size: 0x9F6
	Parameters: 0
	Flags: None
*/
function function_48a6b85()
{
	/#
		level endon(#"hash_47f3d9a9e91670d1");
		self endon(#"disconnect");
		dpad_left = 0;
		dpad_right = 0;
		dpad_up = 0;
		dpad_down = 0;
		if(!isdefined(level.var_94f4ca81))
		{
			level.var_94f4ca81 = spawnstruct();
			level.var_94f4ca81.dataset = [];
			var_975467b9 = "";
			function_25e7711a("", #"none", var_975467b9, "");
			foreach(team_name in level.teams)
			{
				function_25e7711a("", team, var_975467b9, team_name);
			}
			var_96a18257 = "";
			foreach(team_name in level.teams)
			{
				function_25e7711a("", team, var_96a18257, team_name);
			}
			if(isdefined(level.var_c99a6ece))
			{
				[[level.var_c99a6ece]]();
			}
		}
		level.var_94f4ca81.var_89266507 = "";
		level.var_94f4ca81.var_1fde6598 = 0;
		level.var_94f4ca81.var_64799f7 = 0;
		var_f94a23 = 0;
		while(true)
		{
			self setactionslot(3, "");
			self setactionslot(4, "");
			if(!dpad_up && (self buttonpressed("") || self buttonpressed("")))
			{
				level.var_94f4ca81.var_1fde6598++;
				if(level.var_94f4ca81.var_1fde6598 >= level.var_94f4ca81.dataset.size)
				{
					level.var_94f4ca81.var_1fde6598 = 0;
				}
				level.var_94f4ca81.var_64799f7 = 0;
				dpad_up = 1;
				var_f94a23 = 1;
			}
			else if(!self buttonpressed("") || self buttonpressed(""))
			{
				dpad_up = 0;
			}
			if(!dpad_down && (self buttonpressed("") || self buttonpressed("")))
			{
				level.var_94f4ca81.var_1fde6598--;
				if(level.var_94f4ca81.var_1fde6598 < 0)
				{
					level.var_94f4ca81.var_1fde6598 = level.var_94f4ca81.dataset.size - 1;
				}
				level.var_94f4ca81.var_64799f7 = 0;
				var_f94a23 = 1;
				dpad_down = 1;
			}
			else if(!self buttonpressed("") || self buttonpressed(""))
			{
				dpad_down = 0;
			}
			if(!dpad_left && (self buttonpressed("") || self buttonpressed("")))
			{
				while(true)
				{
					level.var_94f4ca81.var_64799f7--;
					if(level.var_94f4ca81.var_64799f7 < 0)
					{
						level.var_94f4ca81.var_64799f7 = level.var_94f4ca81.dataset[level.var_94f4ca81.var_1fde6598].spawns.size - 1;
					}
					if(!is_true(level.var_94f4ca81.dataset[level.var_94f4ca81.var_1fde6598].spawns[level.var_94f4ca81.var_64799f7].ct))
					{
						break;
					}
				}
				var_f94a23 = 1;
				dpad_left = 1;
			}
			else if(!self buttonpressed("") || self buttonpressed(""))
			{
				dpad_left = 0;
			}
			if(!dpad_right && (self buttonpressed("") || self buttonpressed("")))
			{
				while(true)
				{
					level.var_94f4ca81.var_64799f7++;
					if(level.var_94f4ca81.var_64799f7 >= level.var_94f4ca81.dataset[level.var_94f4ca81.var_1fde6598].spawns.size)
					{
						level.var_94f4ca81.var_64799f7 = 0;
					}
					if(!is_true(level.var_94f4ca81.dataset[level.var_94f4ca81.var_1fde6598].spawns[level.var_94f4ca81.var_64799f7].ct))
					{
						break;
					}
				}
				var_f94a23 = 1;
				dpad_right = 1;
			}
			else if(!self buttonpressed("") || self buttonpressed(""))
			{
				dpad_right = 0;
			}
			if(var_f94a23 && level.var_94f4ca81.dataset[level.var_94f4ca81.var_1fde6598].spawns.size > 0)
			{
				origin = level.var_94f4ca81.dataset[level.var_94f4ca81.var_1fde6598].spawns[level.var_94f4ca81.var_64799f7].origin;
				angles = level.var_94f4ca81.dataset[level.var_94f4ca81.var_1fde6598].spawns[level.var_94f4ca81.var_64799f7].angles;
				println("" + level.var_94f4ca81.dataset[level.var_94f4ca81.var_1fde6598].name);
				self setorigin(origin);
				self setplayerangles(angles);
				var_f94a23 = 0;
			}
			debug2dtext((100, 750, 0), "" + level.var_94f4ca81.dataset[level.var_94f4ca81.var_1fde6598].name, (1, 0, 0));
			debug2dtext((100, 800, 0), (("" + string(level.var_94f4ca81.var_64799f7)) + "") + string(level.var_94f4ca81.dataset[level.var_94f4ca81.var_1fde6598].spawns.size), (1, 0, 0));
			waitframe(1);
		}
	#/
}

/*
	Name: devgui_spawn_think
	Namespace: spawning
	Checksum: 0x8EAEE1B1
	Offset: 0x1060
	Size: 0x3E8
	Parameters: 0
	Flags: None
*/
function devgui_spawn_think()
{
	/#
		self notify(#"devgui_spawn_think");
		self endon(#"devgui_spawn_think");
		self endon(#"disconnect");
		dpad_left = 0;
		dpad_right = 0;
		dpad_up = 0;
		dpad_down = 0;
		for(;;)
		{
			self setactionslot(3, "");
			self setactionslot(4, "");
			if(!dpad_left && (self buttonpressed("") || self buttonpressed("")))
			{
				setdvar(#"scr_playerwarp", "");
				dpad_left = 1;
			}
			else if(!self buttonpressed("") || self buttonpressed(""))
			{
				dpad_left = 0;
			}
			if(!dpad_right && (self buttonpressed("") || self buttonpressed("")))
			{
				setdvar(#"scr_playerwarp", "");
				dpad_right = 1;
			}
			else if(!self buttonpressed("") || self buttonpressed(""))
			{
				dpad_right = 0;
			}
			if(!dpad_up && (self buttonpressed("") || self buttonpressed("")))
			{
				setdvar(#"scr_playerwarp", "");
				dpad_up = 1;
			}
			else if(!self buttonpressed("") || self buttonpressed(""))
			{
				dpad_up = 0;
			}
			if(!dpad_down && (self buttonpressed("") || self buttonpressed("")))
			{
				setdvar(#"scr_playerwarp", "");
				dpad_down = 1;
			}
			else if(!self buttonpressed("") || self buttonpressed(""))
			{
				dpad_down = 0;
			}
			waitframe(1);
		}
	#/
}

