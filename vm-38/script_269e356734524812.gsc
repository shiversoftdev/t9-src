#using script_335d0650ed05d36d;
#using script_44b0b8420eabacad;
#using script_7d712f77ab8d0c16;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\mp_common\gametypes\dev.gsc;
#using scripts\mp_common\gametypes\globallogic_spawn.gsc;
#using scripts\mp_common\util.gsc;

#namespace namespace_af53555a;

/*
	Name: function_2e8e3dc
	Namespace: namespace_af53555a
	Checksum: 0x82F3BDEB
	Offset: 0xA8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_2e8e3dc()
{
	level notify(1181012621);
}

/*
	Name: function_d8049496
	Namespace: namespace_af53555a
	Checksum: 0x90B5AD0
	Offset: 0xC8
	Size: 0x7C
	Parameters: 0
	Flags: None
*/
function function_d8049496()
{
	/#
		callback::on_start_gametype(&on_start_gametype);
		setdvar(#"hash_4c1fd51cfe763a2", "");
		setdvar(#"hash_6d53bd520b4f7853", "");
	#/
}

/*
	Name: on_start_gametype
	Namespace: namespace_af53555a
	Checksum: 0xD41D6ACE
	Offset: 0x150
	Size: 0x1C
	Parameters: 0
	Flags: None
*/
function on_start_gametype()
{
	/#
		thread function_3326cf8d();
	#/
}

/*
	Name: function_f084faed
	Namespace: namespace_af53555a
	Checksum: 0x74837D1A
	Offset: 0x178
	Size: 0x484
	Parameters: 0
	Flags: None
*/
function function_f084faed()
{
	/#
		if(!isdefined(level.var_2f11d3e5))
		{
			level.var_2f11d3e5 = [];
			level.var_2f11d3e5[#"dm"] = "";
			level.var_2f11d3e5[#"ffa"] = "";
			level.var_2f11d3e5[#"dem"] = "";
			level.var_2f11d3e5[#"demolition"] = "";
			level.var_2f11d3e5[#"dom"] = "";
			level.var_2f11d3e5[#"domination"] = "";
			level.var_2f11d3e5[#"hash_200088ed1400621f"] = "";
			level.var_2f11d3e5[#"hash_200089ed140063d2"] = "";
			level.var_2f11d3e5[#"hash_754a59ee5b52f897"] = "";
			level.var_2f11d3e5[#"hash_754a5aee5b52fa4a"] = "";
			level.var_2f11d3e5[#"hash_7faa5a704de97213"] = "";
			level.var_2f11d3e5[#"hash_69438a51aacbf824"] = "";
			level.var_2f11d3e5[#"hash_69438d51aacbfd3d"] = "";
			level.var_2f11d3e5[#"hash_16ca7b5aee87513c"] = "";
			level.var_2f11d3e5[#"hash_4bcbc46ff5f13ed4"] = "";
			level.var_2f11d3e5[#"hash_4bcbc76ff5f143ed"] = "";
			level.var_2f11d3e5[#"hash_4bcbc66ff5f1423a"] = "";
			level.var_2f11d3e5[#"hash_4bcbc16ff5f139bb"] = "";
			level.var_2f11d3e5[#"hash_4bcbc06ff5f13808"] = "";
			level.var_2f11d3e5[#"hash_4bcbc36ff5f13d21"] = "";
			level.var_2f11d3e5[#"ctf"] = "";
			level.var_2f11d3e5[#"frontline"] = "";
			level.var_2f11d3e5[#"gun"] = "";
			level.var_2f11d3e5[#"koth"] = "";
			level.var_2f11d3e5[#"infil"] = "";
			level.var_2f11d3e5[#"kc"] = "";
			level.var_2f11d3e5[#"sd"] = "";
			level.var_2f11d3e5[#"control"] = "";
			level.var_2f11d3e5[#"tdm"] = "";
			level.var_2f11d3e5[#"clean"] = "";
			level.var_2f11d3e5[#"ct"] = "";
			level.var_2f11d3e5[#"escort"] = "";
			level.var_2f11d3e5[#"bounty"] = "";
			level.var_2f11d3e5[#"vip"] = "";
			level.var_2f11d3e5[#"dropkick"] = "";
		}
	#/
}

/*
	Name: function_3326cf8d
	Namespace: namespace_af53555a
	Checksum: 0x99332239
	Offset: 0x608
	Size: 0xCE
	Parameters: 0
	Flags: None
*/
function function_3326cf8d()
{
	/#
		while(true)
		{
			var_14d21c2b = getdvarstring(#"hash_35e516df462215b5");
			if(var_14d21c2b != "")
			{
				function_f084faed();
				var_9e1b22d = function_f0b81b80(var_14d21c2b);
				function_bf14041f(var_9e1b22d);
				setdvar(#"hash_35e516df462215b5", "");
			}
			wait(1);
		}
	#/
}

/*
	Name: function_bf14041f
	Namespace: namespace_af53555a
	Checksum: 0xFF5DB7B2
	Offset: 0x6E0
	Size: 0xCC
	Parameters: 1
	Flags: None
*/
function function_bf14041f(var_9e1b22d)
{
	/#
		spawning::clear_spawn_points();
		spawning::function_c40af6fa();
		foreach(spawnflag in var_9e1b22d)
		{
			spawning::addsupportedspawnpointtype(spawnflag);
		}
		spawning::addspawns();
	#/
}

/*
	Name: function_f0b81b80
	Namespace: namespace_af53555a
	Checksum: 0xCC610541
	Offset: 0x7B8
	Size: 0x1CA
	Parameters: 1
	Flags: None
*/
function function_f0b81b80(var_14d21c2b)
{
	/#
		flagset = [];
		tokens = strtok(tolower(var_14d21c2b), "");
		foreach(token in tokens)
		{
			spawnflag = function_423a05a4(token);
			if(isdefined(spawnflag))
			{
				flagset[spawnflag] = 1;
			}
		}
		flags = [];
		foreach(var_f90db79c in flagset)
		{
			if(var_f90db79c)
			{
				if(!isdefined(flags))
				{
					flags = [];
				}
				else if(!isarray(flags))
				{
					flags = array(flags);
				}
				flags[flags.size] = flag;
			}
		}
		return flags;
	#/
}

/*
	Name: function_423a05a4
	Namespace: namespace_af53555a
	Checksum: 0x6146D772
	Offset: 0x990
	Size: 0x20
	Parameters: 1
	Flags: None
*/
function function_423a05a4(var_a7fb3ec0)
{
	/#
		return level.var_2f11d3e5[var_a7fb3ec0];
	#/
}

/*
	Name: function_5650f4ee
	Namespace: namespace_af53555a
	Checksum: 0x5F860710
	Offset: 0x9C0
	Size: 0xF2
	Parameters: 4
	Flags: None
*/
function function_5650f4ee(var_7a594c78, var_55a94d2c, var_9fd9c93b, var_b8543545)
{
	/#
		if(var_55a94d2c == "")
		{
			return true;
		}
		if(var_55a94d2c == "" && !var_b8543545)
		{
			return false;
		}
		if(var_b8543545 && var_55a94d2c != "")
		{
			return false;
		}
		if(var_55a94d2c == "" && var_7a594c78 != #"any")
		{
			if(var_7a594c78 == #"neutral" && isdefined(var_9fd9c93b))
			{
				return false;
			}
			if(!(isdefined(var_9fd9c93b) && var_9fd9c93b == var_7a594c78))
			{
				return false;
			}
		}
		return true;
	#/
}

/*
	Name: function_1b0780eb
	Namespace: namespace_af53555a
	Checksum: 0x820CCF8F
	Offset: 0xAC0
	Size: 0x8
	Parameters: 0
	Flags: None
*/
function function_1b0780eb()
{
	/#
	#/
}

/*
	Name: function_107f44c0
	Namespace: namespace_af53555a
	Checksum: 0x138FEF91
	Offset: 0xAD0
	Size: 0x20
	Parameters: 0
	Flags: None
*/
function function_107f44c0()
{
	/#
		level notify(#"hash_12bbc39c8f50f769");
	#/
}

/*
	Name: hidespawnpoints
	Namespace: namespace_af53555a
	Checksum: 0xDC4D9AFA
	Offset: 0xAF8
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
	Namespace: namespace_af53555a
	Checksum: 0xA39127C1
	Offset: 0xB28
	Size: 0x2D0
	Parameters: 0
	Flags: None
*/
function showstartspawnpoints()
{
	/#
		if(!isdefined(level.spawn_start))
		{
			return;
		}
		if(level.teambased)
		{
			team_colors = [];
			team_colors[#"axis"] = (1, 0, 1);
			team_colors[#"allies"] = (0, 1, 1);
			team_colors[#"team3"] = (1, 1, 0);
			team_colors[#"team4"] = (0, 1, 0);
			team_colors[#"team5"] = (0, 0, 1);
			team_colors[#"team6"] = (1, 0.5, 0);
			team_colors[#"team7"] = (1, 0.7529412, 0.7960784);
			team_colors[#"team8"] = (0.5450981, 0.2705882, 0.07450981);
			foreach(key, color in team_colors)
			{
				if(!isdefined(level.spawn_start[key]))
				{
					continue;
				}
				foreach(spawnpoint in level.spawn_start[key])
				{
					showonespawnpoint(spawnpoint, color, "");
				}
			}
		}
		else
		{
			color = (1, 0, 1);
			foreach(spawnpoint in level.spawn_start)
			{
				showonespawnpoint(spawnpoint, color, "");
			}
		}
	#/
}

/*
	Name: hidestartspawnpoints
	Namespace: namespace_af53555a
	Checksum: 0xBEAB00D1
	Offset: 0xE08
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
	Name: function_8beb6f7d
	Namespace: namespace_af53555a
	Checksum: 0xD938423D
	Offset: 0xE38
	Size: 0x4CC
	Parameters: 4
	Flags: None
*/
function function_8beb6f7d(spawn_point, color, height, var_379ac7cc)
{
	/#
		if(!isdefined(height) || height <= 0)
		{
			height = util::get_player_height();
		}
		if(!isdefined(var_379ac7cc))
		{
			var_379ac7cc = spawn_point.classname;
		}
		depthtest = 0;
		center = spawn_point.origin;
		forward = anglestoforward(spawn_point.angles);
		right = anglestoright(spawn_point.angles);
		forward = vectorscale(forward, 16);
		right = vectorscale(right, 16);
		a = (center + forward) - right;
		b = (center + forward) + right;
		c = (center - forward) + right;
		d = (center - forward) - right;
		line(a, b, color, 0, depthtest);
		line(b, c, color, 0, depthtest);
		line(c, d, color, 0, depthtest);
		line(d, a, color, 0, depthtest);
		line(a, a + (0, 0, height), color, 0, depthtest);
		line(b, b + (0, 0, height), color, 0, depthtest);
		line(c, c + (0, 0, height), color, 0, depthtest);
		line(d, d + (0, 0, height), color, 0, depthtest);
		a = a + (0, 0, height);
		b = b + (0, 0, height);
		c = c + (0, 0, height);
		d = d + (0, 0, height);
		line(a, b, color, 0, depthtest);
		line(b, c, color, 0, depthtest);
		line(c, d, color, 0, depthtest);
		line(d, a, color, 0, depthtest);
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
		line(center, a, color, 0, depthtest);
		line(a, b, color, 0, depthtest);
		line(a, c, color, 0, depthtest);
		if(isdefined(var_379ac7cc) && var_379ac7cc != "")
		{
			print3d(spawn_point.origin + (0, 0, height), var_379ac7cc, color, 1, 1);
		}
	#/
}

/*
	Name: showonespawnpoint
	Namespace: namespace_af53555a
	Checksum: 0xCF789F16
	Offset: 0x1310
	Size: 0x4C4
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
		thread dev::lineuntilnotified(a, b, color, 0, notification);
		thread dev::lineuntilnotified(b, c, color, 0, notification);
		thread dev::lineuntilnotified(c, d, color, 0, notification);
		thread dev::lineuntilnotified(d, a, color, 0, notification);
		thread dev::lineuntilnotified(a, a + (0, 0, height), color, 0, notification);
		thread dev::lineuntilnotified(b, b + (0, 0, height), color, 0, notification);
		thread dev::lineuntilnotified(c, c + (0, 0, height), color, 0, notification);
		thread dev::lineuntilnotified(d, d + (0, 0, height), color, 0, notification);
		a = a + (0, 0, height);
		b = b + (0, 0, height);
		c = c + (0, 0, height);
		d = d + (0, 0, height);
		thread dev::lineuntilnotified(a, b, color, 0, notification);
		thread dev::lineuntilnotified(b, c, color, 0, notification);
		thread dev::lineuntilnotified(c, d, color, 0, notification);
		thread dev::lineuntilnotified(d, a, color, 0, notification);
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
		thread dev::lineuntilnotified(center, a, color, 0, notification);
		thread dev::lineuntilnotified(a, b, color, 0, notification);
		thread dev::lineuntilnotified(a, c, color, 0, notification);
		if(isdefined(print) && print != "")
		{
			thread dev::print3duntilnotified(spawn_point.origin + (0, 0, height), print, color, 1, 1, notification);
		}
	#/
}

