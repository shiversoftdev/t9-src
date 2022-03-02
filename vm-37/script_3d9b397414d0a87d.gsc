#using script_18f0d22c75b141a7;
#using script_7a8059ca02b7b09e;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\mp_common\gametypes\globallogic.gsc;
#using scripts\mp_common\gametypes\round.gsc;
#using scripts\mp_common\scoreevents.gsc;

#namespace namespace_4b798cb0;

/*
	Name: function_89f2df9
	Namespace: namespace_4b798cb0
	Checksum: 0x1DB01EAA
	Offset: 0x228
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_4b859fe530bf291d", &function_70a657d8, undefined, undefined, #"hash_53528dbbf6cd15c4");
}

/*
	Name: function_70a657d8
	Namespace: namespace_4b798cb0
	Checksum: 0x4BA02808
	Offset: 0x278
	Size: 0x5CC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(getdvarint(#"hash_43b642374f5b1f22", 0) == 0)
	{
		return;
	}
	level.var_73f51b52 = {};
	level.var_73f51b52.teams = [];
	level.var_268c70a7 = 1;
	level.map_name = util::function_53bbf9d2();
	telemetry::add_callback(#"on_start_gametype", &on_start_gametype);
	telemetry::add_callback(#"hash_361e06db4b210e", &function_e2603d58);
	telemetry::add_callback(#"hash_3ca80e35288a78d0", &function_84b3ab79);
	telemetry::add_callback(#"on_end_game", &function_a6efe6c9);
	telemetry::add_callback(#"on_player_connect", &function_5a676b2c);
	telemetry::add_callback(#"on_player_disconnect", &function_42fa3a5c);
	telemetry::add_callback(#"on_player_spawned", &on_player_spawned);
	telemetry::function_98df8818(#"hash_fc0d1250fc48d49", &on_player_killed);
	telemetry::add_callback(#"on_loadout", &function_e2162733);
	telemetry::add_callback(#"hash_7de173a0523c27c9", &function_d5aacfd7);
	switch(level.basegametype)
	{
		case "koth":
		{
			level.var_ab8dd45a = {#hash_c1f04374:&function_99b4929d, #hash_284ea17f:#"hash_75fa0382e49cdd2f"};
			level.var_86d47028 = {#hash_c1f04374:&function_6607b43f, #hash_284ea17f:#"hash_4f85fe047c18a6f2"};
			level.var_8d67cbd8 = {#hash_c1f04374:&function_712f816a, #hash_284ea17f:#"hash_57af555874ed0050"};
			level.var_46fc4fdb = &function_4dc75f1b;
			break;
		}
		case "sd":
		{
			level.var_ab8dd45a = {#hash_c1f04374:&function_39e8afcf, #hash_284ea17f:#"hash_d9870c3e6c1e3c5"};
			level.var_86d47028 = {#hash_c1f04374:&function_9555b8d2, #hash_284ea17f:#"hash_63c6c30aa3ff880"};
			level.var_8d67cbd8 = {#hash_c1f04374:&function_150786f3, #hash_284ea17f:#"hash_628978e8b4daa872"};
			level.var_46fc4fdb = &function_86398c9c;
			break;
		}
		case "control":
		{
			level.var_ab8dd45a = {#hash_c1f04374:&function_91a0716f, #hash_284ea17f:#"hash_22a8e3365d654f5b"};
			level.var_86d47028 = {#hash_c1f04374:&function_b16086a1, #hash_284ea17f:#"hash_740ef2b9ec63f1fe"};
			level.var_8d67cbd8 = {#hash_c1f04374:&function_cdce904b, #hash_284ea17f:#"hash_145e373d3b0196c4"};
			level.var_46fc4fdb = &function_979f0cb4;
			break;
		}
	}
	level thread function_1296760e();
}

/*
	Name: function_8d2c5f27
	Namespace: namespace_4b798cb0
	Checksum: 0xA1D2095D
	Offset: 0x850
	Size: 0x60
	Parameters: 1
	Flags: Linked
*/
function function_8d2c5f27(array)
{
	new_array = [];
	for(i = 0; i < array.size; i++)
	{
		new_array[i] = hash(array[i]);
	}
	return new_array;
}

/*
	Name: function_4dc75f1b
	Namespace: namespace_4b798cb0
	Checksum: 0xD2566019
	Offset: 0x8B8
	Size: 0x12E
	Parameters: 2
	Flags: Linked
*/
function function_4dc75f1b(var_a504287b, var_bc31168d)
{
	var_a504287b.var_20546359 = (isdefined(var_bc31168d[#"hash_15d08de09ca7c066"]) ? var_bc31168d[#"hash_15d08de09ca7c066"] : 0);
	var_a504287b.var_c9ac1b25 = (isdefined(var_bc31168d[#"hash_15d08ee09ca7c219"]) ? var_bc31168d[#"hash_15d08ee09ca7c219"] : 0);
	var_a504287b.var_17cc6b98 = (isdefined(var_bc31168d[#"hash_15d08be09ca7bd00"]) ? var_bc31168d[#"hash_15d08be09ca7bd00"] : 0);
	var_a504287b.var_e6110dd7 = (isdefined(var_bc31168d[#"hash_15d08ce09ca7beb3"]) ? var_bc31168d[#"hash_15d08ce09ca7beb3"] : 0);
	var_a504287b.var_1993c7d2 = (isdefined(var_bc31168d[#"hash_15d091e09ca7c732"]) ? var_bc31168d[#"hash_15d091e09ca7c732"] : 0);
}

/*
	Name: function_86398c9c
	Namespace: namespace_4b798cb0
	Checksum: 0xA3494D46
	Offset: 0x9F0
	Size: 0x86
	Parameters: 2
	Flags: Linked
*/
function function_86398c9c(var_a504287b, var_bc31168d)
{
	var_a504287b.var_f177bc0c = (isdefined(var_bc31168d[#"bombplanted"]) ? var_bc31168d[#"bombplanted"] : 0);
	var_a504287b.var_8a69e593 = (isdefined(var_bc31168d[#"bombdefused"]) ? var_bc31168d[#"bombdefused"] : 0);
}

/*
	Name: function_979f0cb4
	Namespace: namespace_4b798cb0
	Checksum: 0xEBF009D0
	Offset: 0xA80
	Size: 0x2E
	Parameters: 2
	Flags: Linked
*/
function function_979f0cb4(var_a504287b, var_bc31168d)
{
	var_a504287b.var_a6134363 = var_bc31168d[#"hash_156cd38474282f8d"];
}

/*
	Name: function_9f07d120
	Namespace: namespace_4b798cb0
	Checksum: 0x16A52F44
	Offset: 0xAB8
	Size: 0x20E
	Parameters: 0
	Flags: Linked
*/
function function_9f07d120()
{
	foreach(player in self.players)
	{
		if(player.team != #"spectator")
		{
			var_bc31168d = player.pers;
			var_a504287b = {};
			var_a504287b.kills = var_bc31168d[#"kills"];
			var_a504287b.deaths = var_bc31168d[#"deaths"];
			var_a504287b.assists = var_bc31168d[#"assists"];
			var_a504287b.damage_done = var_bc31168d[#"damagedone"];
			var_a504287b.highest_killstreak = 0;
			var_a504287b.multikills = var_bc31168d[#"hash_104ec9727c3d4ef7"];
			var_a504287b.var_fc1e4ef3 = 0;
			var_a504287b.time_alive = var_bc31168d[#"time_played_alive"];
			var_a504287b.score = var_bc31168d[#"score"];
			var_a504287b.shots_hit = var_bc31168d[#"shotshit"];
			var_a504287b.shots_fired = var_bc31168d[#"shotsfired"];
			var_a504287b.var_d75d8ad2 = var_bc31168d[#"hash_27ec70548b00de5"];
			var_a504287b.objective_time = var_bc31168d[#"objtime"];
			if(isdefined(level.var_46fc4fdb))
			{
				self [[level.var_46fc4fdb]](var_a504287b, var_bc31168d);
			}
			player.var_a504287b = var_a504287b;
		}
	}
}

/*
	Name: function_1674a96a
	Namespace: namespace_4b798cb0
	Checksum: 0x148D2530
	Offset: 0xCD0
	Size: 0x68
	Parameters: 1
	Flags: Linked
*/
function function_1674a96a(var_67d23bd8)
{
	if(!isdefined(level.var_73f51b52.teams[var_67d23bd8]))
	{
		level.var_73f51b52.teams[var_67d23bd8] = function_638671f1(var_67d23bd8);
	}
	return level.var_73f51b52.teams[var_67d23bd8];
}

/*
	Name: function_ce7dd3eb
	Namespace: namespace_4b798cb0
	Checksum: 0x23C87AFE
	Offset: 0xD40
	Size: 0x42
	Parameters: 0
	Flags: Linked
*/
function function_ce7dd3eb()
{
	var_64e8f5a4 = 0;
	while(!isdefined(self.var_b2ca7b2b))
	{
		wait(0.1);
		var_64e8f5a4++;
		if(var_64e8f5a4 >= 10)
		{
			break;
		}
	}
}

/*
	Name: function_3d01c1b3
	Namespace: namespace_4b798cb0
	Checksum: 0x1F997267
	Offset: 0xD90
	Size: 0x152
	Parameters: 0
	Flags: Linked
*/
function function_3d01c1b3()
{
	var_c1e98979 = round::function_3624d032();
	switch(var_c1e98979)
	{
		case 0:
		{
			return "dnf";
		}
		case 1:
		{
			return "completed";
		}
		case 2:
		{
			return "time limit";
		}
		case 3:
		{
			return "scorelimit";
		}
		case 4:
		{
			return "roundscorelimit";
		}
		case 5:
		{
			return "roundlimit";
		}
		case 6:
		{
			return "team eliminated";
		}
		case 7:
		{
			return "forfeit";
		}
		case 8:
		{
			return "ended game";
		}
		case 9:
		{
			return "host ended game";
		}
		case 10:
		{
			return "host ended sucks";
		}
		case 11:
		{
			return "gamemode-specific";
		}
	}
}

/*
	Name: function_d757edb5
	Namespace: namespace_4b798cb0
	Checksum: 0x58BF64D
	Offset: 0xEF0
	Size: 0x12C
	Parameters: 0
	Flags: Linked
*/
function function_d757edb5()
{
	winning_team = round::get_winning_team();
	if(winning_team == game.attackers)
	{
		return {#hash_c7a20fbb:game.defenders, #hash_9bfeafed:winning_team, #side:#"attack"};
	}
	if(winning_team == game.defenders)
	{
		return {#hash_c7a20fbb:game.attackers, #hash_9bfeafed:winning_team, #side:#"defense"};
	}
	return {#hash_c7a20fbb:#"none", #hash_9bfeafed:winning_team, #side:#"none"};
}

/*
	Name: function_ddf02547
	Namespace: namespace_4b798cb0
	Checksum: 0x776E1863
	Offset: 0x1028
	Size: 0x48
	Parameters: 0
	Flags: Linked
*/
function function_ddf02547()
{
	zoneindex = array::find(level.zones, level.active_zones[0]) + 1;
	return "point_" + zoneindex;
}

/*
	Name: function_a6f108b5
	Namespace: namespace_4b798cb0
	Checksum: 0x3883E413
	Offset: 0x1078
	Size: 0x52
	Parameters: 0
	Flags: Linked
*/
function function_a6f108b5()
{
	if(isdefined(self.label))
	{
		if(self.label == "_a")
		{
			return "point_a";
		}
		if(self.label == "_b")
		{
			return "point_b";
		}
	}
	return "bomb";
}

/*
	Name: function_d4ad62c7
	Namespace: namespace_4b798cb0
	Checksum: 0xD69393DB
	Offset: 0x10D8
	Size: 0x46
	Parameters: 0
	Flags: Linked
*/
function function_d4ad62c7()
{
	if(self.var_f23c87bd == "control_0")
	{
		return "point_a";
	}
	if(self.var_f23c87bd == "control_1")
	{
		return "point_b";
	}
	return self.var_f23c87bd;
}

/*
	Name: function_9ad755c5
	Namespace: namespace_4b798cb0
	Checksum: 0x9FAF18F4
	Offset: 0x1128
	Size: 0x7E
	Parameters: 0
	Flags: Linked
*/
function function_9ad755c5()
{
	var_c6af8b83 = float(self.pers[#"hash_20464b40eeb9b465"]);
	time_played_moving = float(self.pers[#"time_played_moving"]);
	return true;
}

/*
	Name: function_e2603d58
	Namespace: namespace_4b798cb0
	Checksum: 0x29EB79D9
	Offset: 0x11B0
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function function_e2603d58()
{
	self function_9f07d120();
	if(util::isfirstround())
	{
		self function_72c32279();
	}
}

/*
	Name: function_84b3ab79
	Namespace: namespace_4b798cb0
	Checksum: 0x948756E4
	Offset: 0x1200
	Size: 0x6C
	Parameters: 0
	Flags: Linked
*/
function function_84b3ab79()
{
	util::function_64ebd94d();
	self function_189f87c1();
	if(util::isoneround() || util::waslastround())
	{
		self function_d519e318();
	}
}

/*
	Name: function_a6efe6c9
	Namespace: namespace_4b798cb0
	Checksum: 0x278C0301
	Offset: 0x1278
	Size: 0x8C
	Parameters: 0
	Flags: Linked
*/
function function_a6efe6c9()
{
	if(self.team == #"spectator")
	{
		return;
	}
	util::function_64ebd94d();
	self function_2d28a3b3();
	if(util::isoneround() || util::waslastround())
	{
		self function_f0ffff28();
	}
}

/*
	Name: function_5a676b2c
	Namespace: namespace_4b798cb0
	Checksum: 0xCAFE3F88
	Offset: 0x1310
	Size: 0xEA
	Parameters: 0
	Flags: Linked, Private
*/
function private function_5a676b2c()
{
	self endon(#"disconnect");
	player_team = self.pers[#"team"];
	var_64e8f5a4 = 0;
	while(!isdefined(player_team) || isdefined(self.pers[#"needteam"]))
	{
		wait(0.1);
		player_team = self.pers[#"team"];
		if(player_team == #"spectator")
		{
			return;
		}
		var_64e8f5a4++;
		if(var_64e8f5a4 >= 10)
		{
			break;
		}
	}
	self.var_7a967a71 = {};
	self.var_b2ca7b2b = function_1674a96a(player_team);
}

/*
	Name: function_42fa3a5c
	Namespace: namespace_4b798cb0
	Checksum: 0x24A687D9
	Offset: 0x1408
	Size: 0xCC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_42fa3a5c()
{
	if(self.team == #"spectator" || !isdefined(self.var_7a967a71) || game.state == #"pregame")
	{
		return;
	}
	var_66e1aeea = self.var_7a967a71;
	if(var_66e1aeea.round_end !== 1)
	{
		self function_2d28a3b3();
	}
	if(var_66e1aeea.match_end !== 1)
	{
		self function_f0ffff28();
	}
	self on_player_disconnect();
}

/*
	Name: function_1296760e
	Namespace: namespace_4b798cb0
	Checksum: 0x5CEDFD90
	Offset: 0x14E0
	Size: 0x4EC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_1296760e()
{
	self endon(#"death");
	level endon(#"game_ended");
	while(true)
	{
		var_477c313e = [];
		foreach(player in level.players)
		{
			if(!isdefined(player) || player.team == #"spectator")
			{
				continue;
			}
			var_c3f958f5 = player function_896d20da();
			player.pers[#"hash_c9752eb3c681b24"] = player.pers[#"hash_c9752eb3c681b24"] + var_c3f958f5;
			player.pers[#"hash_567d2891c00748f7"] = player.pers[#"hash_567d2891c00748f7"] + 1;
			var_fb5fbbb8 = {#hash_c3f958f5:var_c3f958f5, #player:player.name, #objective_time:player.pers[#"objtime"], #hash_d75d8ad2:player.pers[#"hash_655e50439f6ad919"], #shots_hit:player.pers[#"shotshit"], #shots_fired:player.pers[#"shotsfired"], #score:player.pers[#"score"], #hash_fc1e4ef3:player.pers[#"highestmultikill"], #multikills:player.pers[#"hash_104ec9727c3d4ef7"], #highest_killstreak:player.pers[#"best_kill_streak"], #hash_c6267937:player.pers[#"cur_kill_streak"], #kills:player.pers[#"kills"], #deaths:player.pers[#"deaths"], #assists:player.pers[#"assists"], #damage_dealt:player.pers[#"damagedone"]};
			var_99f319a8 = {#event:var_fb5fbbb8, #player:player};
			if(!isdefined(var_477c313e))
			{
				var_477c313e = [];
			}
			else if(!isarray(var_477c313e))
			{
				var_477c313e = array(var_477c313e);
			}
			var_477c313e[var_477c313e.size] = var_99f319a8;
		}
		foreach(var_99f319a8 in var_477c313e)
		{
			player = var_99f319a8.player;
			if(!isdefined(player))
			{
				continue;
			}
			player function_678f57c8(#"hash_38e3c906bd8063c0", var_99f319a8.event);
			waitframe(1);
		}
		wait(5);
	}
}

/*
	Name: on_start_gametype
	Namespace: namespace_4b798cb0
	Checksum: 0xC8DE02F4
	Offset: 0x19D8
	Size: 0xCC
	Parameters: 0
	Flags: Linked
*/
function on_start_gametype()
{
	if(util::isfirstround())
	{
		var_fb5fbbb8 = {#hash_16d89ef:function_1674a96a(game.defenders), #hash_53efd038:function_1674a96a(game.attackers), #map_name:level.map_name, #game_type:level.gametype};
		function_92d1707f(#"hash_1f4373b70b30be60", var_fb5fbbb8);
	}
}

/*
	Name: function_72c32279
	Namespace: namespace_4b798cb0
	Checksum: 0xC8929E56
	Offset: 0x1AB0
	Size: 0xBC
	Parameters: 0
	Flags: Linked
*/
function function_72c32279()
{
	var_fb5fbbb8 = {#hash_16d89ef:function_1674a96a(game.defenders), #hash_53efd038:function_1674a96a(game.attackers), #map_name:level.map_name, #game_type:level.gametype};
	function_92d1707f(#"hash_60026644979e3672", var_fb5fbbb8);
}

/*
	Name: function_d519e318
	Namespace: namespace_4b798cb0
	Checksum: 0x2CEC07FB
	Offset: 0x1B78
	Size: 0x1C4
	Parameters: 0
	Flags: Linked
*/
function function_d519e318()
{
	team1 = game.attackers;
	team2 = game.defenders;
	var_d21c921d = game.stat[#"teamscores"];
	var_9bfeafed = function_1674a96a(round::get_winning_team());
	var_fb5fbbb8 = {#map_name:level.map_name, #game_type:level.gametype, #hash_9bfeafed:(isdefined(var_9bfeafed) ? var_9bfeafed : "draw"), #hash_a41f3c35:var_d21c921d[team2], #hash_16d89ef:function_1674a96a(team2), #hash_9953c424:var_d21c921d[team1], #hash_53efd038:function_1674a96a(team1), #hash_e394d7c0:game.roundsplayed, #match_time:function_f8d53445()};
	function_92d1707f(#"hash_59d78dad912aed7", var_fb5fbbb8);
}

/*
	Name: function_99b4929d
	Namespace: namespace_4b798cb0
	Checksum: 0xE804C057
	Offset: 0x1D48
	Size: 0xCE
	Parameters: 1
	Flags: Linked
*/
function function_99b4929d(var_fb5fbbb8)
{
	var_fb5fbbb8.var_5fb8d45b = self.pers[#"objtime"];
	var_fb5fbbb8.var_20546359 = self.pers[#"hash_15d08de09ca7c066"];
	var_fb5fbbb8.var_c9ac1b25 = self.pers[#"hash_15d08ee09ca7c219"];
	var_fb5fbbb8.var_17cc6b98 = self.pers[#"hash_15d08be09ca7bd00"];
	var_fb5fbbb8.var_e6110dd7 = self.pers[#"hash_15d08ce09ca7beb3"];
	var_fb5fbbb8.var_1993c7d2 = self.pers[#"hash_15d091e09ca7c732"];
}

/*
	Name: function_39e8afcf
	Namespace: namespace_4b798cb0
	Checksum: 0xBC99CEC4
	Offset: 0x1E20
	Size: 0x6E
	Parameters: 1
	Flags: Linked
*/
function function_39e8afcf(var_fb5fbbb8)
{
	var_fb5fbbb8.var_5fb8d45b = self.pers[#"objtime"];
	var_fb5fbbb8.var_f177bc0c = self.pers[#"bombplanted"];
	var_fb5fbbb8.var_8a69e593 = self.pers[#"bombdefused"];
}

/*
	Name: function_91a0716f
	Namespace: namespace_4b798cb0
	Checksum: 0x6DA5518C
	Offset: 0x1E98
	Size: 0x4E
	Parameters: 1
	Flags: Linked
*/
function function_91a0716f(var_fb5fbbb8)
{
	var_fb5fbbb8.var_b675fed3 = self.pers[#"captures"];
	var_fb5fbbb8.var_79714d9b = self.pers[#"hash_156cd38474282f8d"];
}

/*
	Name: function_f0ffff28
	Namespace: namespace_4b798cb0
	Checksum: 0x77FA1ED6
	Offset: 0x1EF0
	Size: 0x366
	Parameters: 0
	Flags: Linked
*/
function function_f0ffff28()
{
	var_bc31168d = self.pers;
	var_1bed336c = 0;
	var_f5a2d10c = var_bc31168d[#"hash_567d2891c00748f7"];
	if(var_f5a2d10c > 0)
	{
		var_1bed336c = var_bc31168d[#"hash_c9752eb3c681b24"] / var_f5a2d10c;
	}
	var_fb5fbbb8 = {#hash_4ac15e1d:var_1bed336c, #hash_e394d7c0:game.roundsplayed, #hash_fc1e4ef3:var_bc31168d[#"highestmultikill"], #hash_f66612f0:var_bc31168d[#"hash_104ec9727c3d4ef7"], #total_shots_hit:var_bc31168d[#"shotshit"], #hash_e36aba01:var_bc31168d[#"hash_27ec70548b00de5"], #total_shots_fired:var_bc31168d[#"shotsfired"], #hash_d568c84:var_bc31168d[#"suicides"], #hash_5bda8eec:var_bc31168d[#"time_played_moving"], #average_speed_during_match:self function_9ad755c5(), #hash_2e369569:var_bc31168d[#"damagedone"], #hash_3426c422:var_bc31168d[#"total_distance_travelled"], #hash_62f25812:var_bc31168d[#"time_played_alive"], #total_headshots:var_bc31168d[#"headshots"], #total_deaths:var_bc31168d[#"deaths"], #hash_ef5017c7:var_bc31168d[#"best_kill_streak"], #total_kills:var_bc31168d[#"kills"], #hash_229e9030:var_bc31168d[#"assists"], #total_score:var_bc31168d[#"score"], #player:self.name};
	var_284ea17f = #"hash_467c6c9bd786ed0d";
	if(isdefined(level.var_ab8dd45a))
	{
		var_284ea17f = level.var_ab8dd45a.var_284ea17f;
		self [[level.var_ab8dd45a.var_c1f04374]](var_fb5fbbb8);
	}
	self function_678f57c8(var_284ea17f, var_fb5fbbb8);
	self.var_7a967a71.match_end = 1;
}

/*
	Name: on_player_spawned
	Namespace: namespace_4b798cb0
	Checksum: 0xC669FD37
	Offset: 0x2260
	Size: 0x15C
	Parameters: 0
	Flags: Linked
*/
function on_player_spawned()
{
	player_position = self.origin;
	player_angles = self getplayerangles();
	var_fb5fbbb8 = {#hash_e88b9d9:player_angles[2], #hash_c91e5a:player_angles[1], #hash_231262ec:player_angles[0], #hash_58c899fa:player_position[2], #hash_6e78c55a:player_position[1], #hash_ef0c4683:player_position[0], #match_time:function_f8d53445(), #player:self.name};
	if(!isdefined(self.var_b2ca7b2b))
	{
		self function_ce7dd3eb();
	}
	var_fb5fbbb8.player_team = self.var_b2ca7b2b;
	self function_678f57c8(#"hash_1bc66812d8d53094", var_fb5fbbb8);
}

/*
	Name: on_player_killed
	Namespace: namespace_4b798cb0
	Checksum: 0x18E05357
	Offset: 0x23C8
	Size: 0x524
	Parameters: 1
	Flags: Linked
*/
function on_player_killed(data)
{
	attacker = data.attacker;
	victim = data.victim;
	results = data.results;
	if(isplayer(attacker))
	{
		attackerposition = data.attackerorigin;
		var_83634238 = data.var_83634238;
		attackerweapon = data.weapon;
		var_c4b07a31 = {#weapon_attachments:function_8d2c5f27(attackerweapon.attachments), #weapon:attackerweapon.name, #hash_e88b9d9:var_83634238[2], #hash_c91e5a:var_83634238[1], #hash_231262ec:var_83634238[0], #hash_58c899fa:attackerposition[2], #hash_6e78c55a:attackerposition[1], #hash_ef0c4683:attackerposition[0], #team:attacker.var_b2ca7b2b, #name:attacker.name};
		var_ebf88f4 = {#hash_4aca04c6:data.var_91610392, #is_flashed:data.attackerwasflashed, #is_ads:data.var_4c540e11 > 0.5};
		var_15b3531 = {#hash_905bd140:results.var_905bd140 === 1, #hash_a5aabf71:results.var_a5aabf71 === 1, #hash_91b86b21:results.var_91b86b21 === 1};
	}
	else
	{
		var_c4b07a31 = {};
		var_ebf88f4 = {};
		var_15b3531 = {};
	}
	var_48dd40c2 = data.victimorigin;
	var_5fceefd4 = data.var_5fceefd4;
	victimweapon = data.victimweapon;
	var_6d0087b5 = {#weapon_attachments:function_8d2c5f27(victimweapon.attachments), #weapon:victimweapon.name, #hash_e88b9d9:var_5fceefd4[2], #hash_c91e5a:var_5fceefd4[1], #hash_231262ec:var_5fceefd4[0], #hash_58c899fa:var_48dd40c2[2], #hash_6e78c55a:var_48dd40c2[1], #hash_ef0c4683:var_48dd40c2[0], #team:victim.var_b2ca7b2b, #name:victim.name};
	var_61e89f84 = {#hash_4aca04c6:data.var_30db4425, #is_flashed:data.var_e020b97e, #is_ads:data.var_f0b3c772 > 0.5};
	var_ce72ff21 = {#hash_cc573225:(isdefined(results.var_adfa5654) ? results.var_adfa5654 : 0), #means_of_death:data.smeansofdeath, #match_time:function_f8d53445()};
	victim function_678f57c8(#"hash_36ba9c8216e49683", #"info", var_ce72ff21, #"attacker", var_c4b07a31, #"hash_22188ea5740f5555", var_ebf88f4, #"victim", var_6d0087b5, #"hash_11d3bd3693fea440", var_61e89f84, #"hash_77050fd9e402347d", var_15b3531);
}

/*
	Name: on_player_disconnect
	Namespace: namespace_4b798cb0
	Checksum: 0x265F8F11
	Offset: 0x28F8
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function on_player_disconnect()
{
	var_fb5fbbb8 = {#player:self.name};
	self function_678f57c8(#"hash_75c1498f60e0b0f0", var_fb5fbbb8);
}

/*
	Name: function_e2162733
	Namespace: namespace_4b798cb0
	Checksum: 0x76741528
	Offset: 0x2950
	Size: 0x3B4
	Parameters: 0
	Flags: Linked
*/
function function_e2162733()
{
	if(isdefined(self.lastclass) && self.curclass == self.lastclass)
	{
		return;
	}
	self.lastclass = self.curclass;
	primary_weapon = self loadout::function_18a77b37("primary");
	secondary_weapon = self loadout::function_18a77b37("secondary");
	primary_grenade = self loadout::function_18a77b37("primarygrenade");
	secondary_grenade = self loadout::function_18a77b37("secondarygrenade");
	field_upgrade = self loadout::function_18a77b37("specialgrenade");
	var_992d253 = self loadout::function_18a77b37("herogadget");
	var_7078908d = self loadout::function_18a77b37("ultimate");
	class_num = self.class_num;
	tactical_gear = self function_d78e0e04(class_num);
	scorestreaks = self.killstreak;
	perks = self function_4a9f1384(class_num);
	wildcards = self function_6f2c0492(class_num);
	loc_00002C12:
	var_fb5fbbb8 = {#wildcards:wildcards, #perks:perks, #scorestreaks:scorestreaks, #tactical_gear:tactical_gear, #hash_7078908d:var_7078908d.name, #hash_992d253:var_992d253.name, #field_upgrade:field_upgrade.name, #secondary_grenade:secondary_grenade.name, #primary_grenade:primary_grenade.name, #hash_85aac3ff:function_8d2c5f27((isdefined(secondary_weapon.attachments) ? secondary_weapon.attachments : [])), #secondary_weapon:secondary_weapon.name, #primary_weapon_attachments:function_8d2c5f27((isdefined(primary_weapon.attachments) ? primary_weapon.attachments : [])), #primary_weapon:primary_weapon.name, #match_time:function_f8d53445(), #player:self.name};
	self function_678f57c8(#"hash_8443c9b69d1ef55", var_fb5fbbb8);
}

/*
	Name: function_189f87c1
	Namespace: namespace_4b798cb0
	Checksum: 0xC80F4248
	Offset: 0x2D10
	Size: 0x12C
	Parameters: 0
	Flags: Linked
*/
function function_189f87c1()
{
	var_48c6ec2e = function_d757edb5();
	var_fb5fbbb8 = {#hash_c7a20fbb:function_1674a96a(var_48c6ec2e.var_c7a20fbb), #hash_9bfeafed:function_1674a96a(var_48c6ec2e.var_9bfeafed), #map_name:level.map_name, #game_type:level.gametype, #match_time:function_f8d53445(), #hash_77a9bf99:var_48c6ec2e.side, #result:function_3d01c1b3()};
	function_92d1707f(#"hash_1d858c5e8f79303a", var_fb5fbbb8);
}

/*
	Name: function_6607b43f
	Namespace: namespace_4b798cb0
	Checksum: 0xA57836C3
	Offset: 0x2E48
	Size: 0x1CA
	Parameters: 1
	Flags: Linked
*/
function function_6607b43f(var_fb5fbbb8)
{
	var_a504287b = self.var_a504287b;
	var_bc31168d = self.pers;
	objective_time = var_bc31168d[#"objtime"];
	var_20546359 = var_bc31168d[#"hash_15d08de09ca7c066"];
	var_c9ac1b25 = var_bc31168d[#"hash_15d08ee09ca7c219"];
	var_17cc6b98 = var_bc31168d[#"hash_15d08be09ca7bd00"];
	var_e6110dd7 = var_bc31168d[#"hash_15d08ce09ca7beb3"];
	var_1993c7d2 = var_bc31168d[#"hash_15d091e09ca7c732"];
	var_fb5fbbb8.objective_time = (isdefined(objective_time) ? objective_time - var_a504287b.objective_time : 0);
	var_fb5fbbb8.var_20546359 = (isdefined(var_20546359) ? var_20546359 - var_a504287b.var_20546359 : 0);
	var_fb5fbbb8.var_c9ac1b25 = (isdefined(var_c9ac1b25) ? var_c9ac1b25 - var_a504287b.var_c9ac1b25 : 0);
	var_fb5fbbb8.var_17cc6b98 = (isdefined(var_17cc6b98) ? var_17cc6b98 - var_a504287b.var_17cc6b98 : 0);
	var_fb5fbbb8.var_e6110dd7 = (isdefined(var_e6110dd7) ? var_e6110dd7 - var_a504287b.var_e6110dd7 : 0);
	var_fb5fbbb8.var_1993c7d2 = (isdefined(var_1993c7d2) ? var_1993c7d2 - var_a504287b.var_1993c7d2 : 0);
}

/*
	Name: function_9555b8d2
	Namespace: namespace_4b798cb0
	Checksum: 0xEB5042AF
	Offset: 0x3020
	Size: 0xFE
	Parameters: 1
	Flags: Linked
*/
function function_9555b8d2(var_fb5fbbb8)
{
	var_a504287b = self.var_a504287b;
	var_bc31168d = self.pers;
	objective_time = var_bc31168d[#"objtime"];
	var_f177bc0c = var_bc31168d[#"bombplanted"];
	var_8a69e593 = var_bc31168d[#"bombdefused"];
	var_fb5fbbb8.objective_time = (isdefined(objective_time) ? objective_time - var_a504287b.objective_time : 0);
	var_fb5fbbb8.var_f177bc0c = (isdefined(var_f177bc0c) ? var_f177bc0c - var_a504287b.var_f177bc0c : 0);
	var_fb5fbbb8.var_8a69e593 = (isdefined(var_8a69e593) ? var_8a69e593 - var_a504287b.var_8a69e593 : 0);
}

/*
	Name: function_b16086a1
	Namespace: namespace_4b798cb0
	Checksum: 0x2F6D9725
	Offset: 0x3128
	Size: 0xA6
	Parameters: 1
	Flags: Linked
*/
function function_b16086a1(var_fb5fbbb8)
{
	var_a504287b = self.var_a504287b;
	objective_time = self.pers[#"objtime"];
	var_a6134363 = self.pers[#"hash_156cd38474282f8d"];
	var_fb5fbbb8.objective_time = (isdefined(objective_time) ? objective_time - var_a504287b.objective_time : 0);
	var_fb5fbbb8.var_a6134363 = (isdefined(var_a6134363) ? var_a6134363 - var_a504287b.var_a6134363 : 0);
}

/*
	Name: function_2d28a3b3
	Namespace: namespace_4b798cb0
	Checksum: 0xF66D0485
	Offset: 0x31D8
	Size: 0x2FE
	Parameters: 0
	Flags: Linked
*/
function function_2d28a3b3()
{
	var_a504287b = self.var_a504287b;
	var_bc31168d = self.pers;
	var_ec6fc02d = util::getroundswon(self.team);
	if(!isdefined(var_a504287b))
	{
		return;
	}
	var_fb5fbbb8 = {#player:self.name, #hash_d75d8ad2:var_bc31168d[#"hash_27ec70548b00de5"] - var_a504287b.var_d75d8ad2, #shots_hit:var_bc31168d[#"shotshit"] - var_a504287b.shots_hit, #shots_fired:var_bc31168d[#"shotsfired"] - var_a504287b.shots_fired, #score:var_bc31168d[#"score"] - var_a504287b.score, #hash_ec6fc02d:(isdefined(var_ec6fc02d) ? var_ec6fc02d : 0), #hash_e394d7c0:game.roundsplayed, #time_alive:var_bc31168d[#"time_played_alive"] - var_a504287b.time_alive, #hash_a0380c47:var_a504287b.var_fc1e4ef3, #multikills:var_bc31168d[#"hash_104ec9727c3d4ef7"] - var_a504287b.multikills, #highest_killstreak:var_a504287b.highest_killstreak, #damage_dealt:var_bc31168d[#"damagedone"] - var_a504287b.damage_done, #deaths:var_bc31168d[#"assists"] - var_a504287b.assists, #assists:var_bc31168d[#"deaths"] - var_a504287b.deaths, #kills:var_bc31168d[#"kills"] - var_a504287b.kills};
	var_284ea17f = #"hash_15b84d837906d158";
	if(isdefined(level.var_86d47028))
	{
		var_284ea17f = level.var_86d47028.var_284ea17f;
		self [[level.var_86d47028.var_c1f04374]](var_fb5fbbb8);
	}
	self function_678f57c8(var_284ea17f, var_fb5fbbb8);
	self.var_7a967a71.round_end = 1;
}

/*
	Name: function_712f816a
	Namespace: namespace_4b798cb0
	Checksum: 0xF4D32050
	Offset: 0x34E0
	Size: 0x8E
	Parameters: 2
	Flags: Linked
*/
function function_712f816a(var_fb5fbbb8, player)
{
	var_fb5fbbb8.var_943dace9 = self.var_a4926509 != #"none";
	var_fb5fbbb8.var_7407eb67 = self.iscontested;
	var_fb5fbbb8.obj_name = function_ddf02547();
	if(!isdefined(player))
	{
		var_fb5fbbb8.player = "none";
	}
	else
	{
		var_fb5fbbb8.player = player.name;
	}
}

/*
	Name: function_150786f3
	Namespace: namespace_4b798cb0
	Checksum: 0x38C3C55F
	Offset: 0x3578
	Size: 0x92
	Parameters: 2
	Flags: Linked
*/
function function_150786f3(var_fb5fbbb8, player)
{
	if(!isdefined(player))
	{
		var_fb5fbbb8.player = "none";
		var_fb5fbbb8.var_f4f5d0fd = 0;
	}
	else
	{
		var_fb5fbbb8.player = player.name;
		var_fb5fbbb8.var_f4f5d0fd = player.isbombcarrier;
	}
	var_fb5fbbb8.obj_name = function_a6f108b5();
	var_fb5fbbb8.var_f04ca204 = level.bombplanted;
	var_fb5fbbb8.var_72f6a393 = level.bombdefused;
}

/*
	Name: function_cdce904b
	Namespace: namespace_4b798cb0
	Checksum: 0xACD28E83
	Offset: 0x3618
	Size: 0xB6
	Parameters: 2
	Flags: Linked
*/
function function_cdce904b(var_fb5fbbb8, player)
{
	var_fb5fbbb8.player = player.name;
	var_fb5fbbb8.obj_name = function_d4ad62c7();
	var_fb5fbbb8.var_943dace9 = self.var_a4926509 != #"none";
	var_fb5fbbb8.var_7407eb67 = self.contested;
	var_fb5fbbb8.var_b910ed34 = game.lives[#"allies"];
	var_fb5fbbb8.var_33a590ba = game.lives[#"axis"];
}

/*
	Name: function_d5aacfd7
	Namespace: namespace_4b798cb0
	Checksum: 0xB5F51E6C
	Offset: 0x36D8
	Size: 0x154
	Parameters: 1
	Flags: Linked
*/
function function_d5aacfd7(credit_player)
{
	origin = self.origin;
	var_fb5fbbb8 = {#match_time:function_f8d53445(), #hash_7b99e470:function_1674a96a((isdefined(credit_player.team) ? credit_player.team : self.var_a4926509)), #hash_94d1ee7a:origin[2], #hash_830acac0:origin[1], #hash_94e96e7d:origin[0]};
	var_284ea17f = #"hash_3cb91ecb4b176d16";
	if(isdefined(level.var_8d67cbd8))
	{
		var_284ea17f = level.var_8d67cbd8.var_284ea17f;
		self [[level.var_8d67cbd8.var_c1f04374]](var_fb5fbbb8, credit_player);
	}
	function_92d1707f(var_284ea17f, var_fb5fbbb8);
}

