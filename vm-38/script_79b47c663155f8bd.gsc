#using script_2255a7ad3edc838f;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace namespace_ffbf548b;

/*
	Name: function_2141b5de
	Namespace: namespace_ffbf548b
	Checksum: 0xBB4D58B7
	Offset: 0xA0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_2141b5de()
{
	level notify(1100333895);
}

/*
	Name: function_70a657d8
	Namespace: namespace_ffbf548b
	Checksum: 0x921F23B2
	Offset: 0xC0
	Size: 0x1A8
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	if(util::function_3f165ee8())
	{
		return;
	}
	callback::on_start_gametype(&on_start_gametype);
	level.var_f5c1fb9d = [];
	level.var_8a530af5 = [];
	if(!function_59116c33())
	{
		var_c93ad421 = getdvarint(#"hash_688c3ba84e378e53", 0);
		if(var_c93ad421 > 0)
		{
			level.var_fa9f5bab = var_c93ad421;
			return;
		}
	}
	foreach(var_ad8edaa8 in level.teams)
	{
		var_77e770bb = getgametypesetting(#"hash_43e6eb8f9fd14f92" + var_ad8edaa8, 0);
		level.var_8a530af5[team] = var_77e770bb;
		count = getdvarint(#"bot_" + var_ad8edaa8, 0);
		level.var_f5c1fb9d[team] = count;
	}
}

/*
	Name: on_start_gametype
	Namespace: namespace_ffbf548b
	Checksum: 0x7307ECE3
	Offset: 0x270
	Size: 0x6C
	Parameters: 0
	Flags: Linked, Private
*/
function private on_start_gametype()
{
	if(is_true(level.rankedmatch))
	{
		return;
	}
	botsoak = getdvarint(#"sv_botsoak", 0);
	level thread function_31a989f7(!botsoak);
}

/*
	Name: function_8958c312
	Namespace: namespace_ffbf548b
	Checksum: 0x309E7F8B
	Offset: 0x2E8
	Size: 0x174
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8958c312()
{
	/#
		if(function_7373cc35())
		{
			return;
		}
	#/
	if(level.teambased)
	{
		foreach(team in level.teams)
		{
			level.var_f5c1fb9d[team] = (is_true(level.var_8a530af5[team]) ? getplayers(team).size : function_b16926ea(team).size);
		}
	}
	else
	{
		level.var_f5c1fb9d[#"allies"] = (is_true(level.var_8a530af5[#"allies"]) ? getplayers().size : function_b16926ea().size);
	}
}

/*
	Name: function_ba1ef25b
	Namespace: namespace_ffbf548b
	Checksum: 0xAC18A3D3
	Offset: 0x468
	Size: 0x134
	Parameters: 1
	Flags: Linked, Private
*/
function private function_ba1ef25b(maxplayers)
{
	if(level.teambased)
	{
		teamsize = maxplayers / level.teams.size;
		/#
			assert((teamsize - int(teamsize)) == 0);
		#/
		foreach(team in level.teams)
		{
			level.var_f5c1fb9d[team] = teamsize;
			level.var_8a530af5[team] = 1;
		}
	}
	else
	{
		level.var_f5c1fb9d[#"allies"] = maxplayers;
		level.var_8a530af5[#"allies"] = 1;
	}
}

/*
	Name: function_31a989f7
	Namespace: namespace_ffbf548b
	Checksum: 0x44C538A9
	Offset: 0x5A8
	Size: 0x254
	Parameters: 1
	Flags: Linked, Private
*/
function private function_31a989f7(waitforplayers)
{
	if(!isdefined(waitforplayers))
	{
		waitforplayers = 1;
	}
	level endon(#"game_ended");
	if(waitforplayers)
	{
		level flag::wait_till("all_players_connected");
	}
	waitframe(1);
	if(!function_59116c33())
	{
		if(isdefined(level.var_fa9f5bab) && level.var_fa9f5bab > 0)
		{
			bot::add_bots(level.var_fa9f5bab);
			return;
		}
	}
	maxplayers = getgametypesetting(#"maxplayers");
	if(is_true(getgametypesetting(#"hash_c6a2e6c3e86125a")))
	{
		level function_ba1ef25b(maxplayers);
	}
	else
	{
		level function_8958c312();
	}
	if(level.teambased)
	{
		foreach(count in level.var_f5c1fb9d)
		{
			if(count > 0)
			{
				level thread function_bbeb8bbe(maxplayers);
				break;
			}
		}
	}
	else
	{
		var_8a291590 = (isdefined(level.var_f5c1fb9d[#"allies"]) ? level.var_f5c1fb9d[#"allies"] : 0);
		if(var_8a291590 > 0)
		{
			level thread function_9bead880(var_8a291590, maxplayers);
		}
	}
}

/*
	Name: function_bbeb8bbe
	Namespace: namespace_ffbf548b
	Checksum: 0x77E47B27
	Offset: 0x808
	Size: 0x8E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_bbeb8bbe(maxplayers)
{
	level endon(#"game_ended");
	while(true)
	{
		playercount = getplayers().size;
		if(playercount > maxplayers)
		{
			level function_e88d0cf4();
		}
		else if(playercount < maxplayers)
		{
			level function_38a06234();
		}
		waitframe(1);
	}
}

/*
	Name: function_9bead880
	Namespace: namespace_ffbf548b
	Checksum: 0x9C6B965A
	Offset: 0x8A0
	Size: 0xF6
	Parameters: 2
	Flags: Linked, Private
*/
function private function_9bead880(var_8a291590, maxplayers)
{
	level endon(#"game_ended");
	while(true)
	{
		players = getplayers();
		bots = function_b16926ea();
		if(players.size > maxplayers)
		{
			level function_f992463c(bots);
		}
		else if(players.size < maxplayers && players.size < level.teams.size && bots.size < var_8a291590)
		{
			level bot::add_bot();
		}
		waitframe(1);
	}
}

/*
	Name: function_38a06234
	Namespace: namespace_ffbf548b
	Checksum: 0x529329B9
	Offset: 0x9A0
	Size: 0x18E
	Parameters: 0
	Flags: Linked, Private
*/
function private function_38a06234()
{
	var_4ec52f78 = undefined;
	var_dd1b756e = undefined;
	foreach(team, count in level.var_f5c1fb9d)
	{
		if(!isdefined(count) || count <= 0)
		{
			continue;
		}
		players = getplayers(team);
		if(isdefined(var_dd1b756e) && players.size >= var_dd1b756e)
		{
			continue;
		}
		if(is_true(level.var_8a530af5[team]) && players.size >= count)
		{
			continue;
		}
		bots = function_b16926ea(team);
		if(bots.size >= count)
		{
			continue;
		}
		var_4ec52f78 = team;
		var_dd1b756e = players.size;
	}
	if(!isdefined(var_4ec52f78))
	{
		return;
	}
	bot = bot::add_bot(var_4ec52f78);
}

/*
	Name: function_e88d0cf4
	Namespace: namespace_ffbf548b
	Checksum: 0x8BE2F563
	Offset: 0xB38
	Size: 0x1E4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_e88d0cf4()
{
	var_c1e10c7d = undefined;
	var_a6dba815 = undefined;
	var_e019b1bb = undefined;
	largestcount = undefined;
	foreach(team, count in level.var_f5c1fb9d)
	{
		bots = function_b16926ea(team);
		if(bots.size <= 0)
		{
			continue;
		}
		players = getplayers(team);
		if(!isdefined(largestcount) || players.size > largestcount)
		{
			var_e019b1bb = team;
			largestcount = players.size;
		}
		var_83858f99 = players.size - (isdefined(count) ? count : 0);
		if(var_83858f99 > 0)
		{
			if(!isdefined(var_c1e10c7d) || var_83858f99 > var_a6dba815)
			{
				var_c1e10c7d = team;
				var_a6dba815 = var_83858f99;
			}
		}
	}
	var_a22b08a1 = undefined;
	if(isdefined(var_c1e10c7d))
	{
		var_a22b08a1 = var_c1e10c7d;
	}
	else if(isdefined(var_e019b1bb))
	{
		var_a22b08a1 = var_e019b1bb;
	}
	if(!isdefined(var_a22b08a1))
	{
		return;
	}
	bots = function_b16926ea(var_a22b08a1);
	level function_f992463c(bots);
}

/*
	Name: function_f992463c
	Namespace: namespace_ffbf548b
	Checksum: 0x80D99340
	Offset: 0xD28
	Size: 0xFC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_f992463c(bots)
{
	var_6ddda2cf = undefined;
	var_be6d09d1 = undefined;
	foreach(bot in bots)
	{
		if(function_2dd2fa57(bot))
		{
			continue;
		}
		if(!isdefined(var_6ddda2cf) || bot.score < var_be6d09d1)
		{
			var_6ddda2cf = bot;
			var_be6d09d1 = bot.score;
		}
	}
	if(isdefined(var_6ddda2cf))
	{
		bot::remove_bot(var_6ddda2cf);
	}
}

