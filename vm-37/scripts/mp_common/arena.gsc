#using scripts\mp_common\gametypes\match.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\system_shared.gsc;
#using script_32c8b5b0eb2854f3;
#using scripts\core_common\callbacks_shared.gsc;

#namespace arena;

/*
	Name: __init__system__
	Namespace: arena
	Checksum: 0x42DC296A
	Offset: 0xB0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"arena", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: arena
	Checksum: 0x15E60BDC
	Offset: 0xF8
	Size: 0x8C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	callback::on_connect(&on_connect);
	callback::on_disconnect(&on_disconnect);
	if(gamemodeisarena())
	{
		callback::on_game_playing(&on_game_playing);
		level.var_a962eeb6 = &function_51203700;
	}
}

/*
	Name: function_51203700
	Namespace: arena
	Checksum: 0x51D492DA
	Offset: 0x190
	Size: 0x6
	Parameters: 0
	Flags: Linked
*/
function function_51203700()
{
	return false;
}

/*
	Name: on_connect
	Namespace: arena
	Checksum: 0xAADB47EC
	Offset: 0x1A0
	Size: 0xCC
	Parameters: 0
	Flags: Linked
*/
function on_connect()
{
	if(!gamemodeisarena() || (isdefined(self.pers[#"arenainit"]) && self.pers[#"arenainit"] == 1))
	{
		return;
	}
	self arenabeginmatch();
	if(function_945560bf() == 0)
	{
		self.pers[#"hash_1b5251cc167039c8"] = self function_a200171d();
	}
	self.pers[#"arenainit"] = 1;
}

/*
	Name: on_game_playing
	Namespace: arena
	Checksum: 0x95C3766E
	Offset: 0x278
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function on_game_playing()
{
	if(gamemodeisarena())
	{
		function_e938380b();
	}
}

/*
	Name: function_b856a952
	Namespace: arena
	Checksum: 0x294F2C73
	Offset: 0x2B0
	Size: 0x184
	Parameters: 1
	Flags: Linked
*/
function function_b856a952(team)
{
	if(gamemodeisarena() && getdvarint(#"hash_6eb6c222bc98b01", 0))
	{
		penalty = function_377f07c2();
		for(index = 0; index < level.players.size; index++)
		{
			player = level.players[index];
			if(isdefined(player.team) && player.team == team && !isdefined(player.pers[#"hash_6dbbb195b62e0dd3"]))
			{
				if(isdefined(player.pers[#"arenainit"]) && player.pers[#"arenainit"] == 1)
				{
					if(isdefined(player.pers[#"hash_1b5251cc167039c8"]))
					{
						player function_ca53535e(penalty);
						player.pers[#"hash_6dbbb195b62e0dd3"] = 1;
					}
				}
			}
		}
	}
}

/*
	Name: on_disconnect
	Namespace: arena
	Checksum: 0xA2F3EA8F
	Offset: 0x440
	Size: 0xF4
	Parameters: 0
	Flags: Linked
*/
function on_disconnect()
{
	if(gamemodeisarena() && isdefined(self.pers[#"arenainit"]) && self.pers[#"arenainit"] == 1)
	{
		if(isdefined(self) && isdefined(self.team) && isdefined(level.playercount) && isdefined(level.playercount[self.team]))
		{
			if(!gamestate::is_game_over() && level.playercount[self.team] <= function_7a0dc792())
			{
				function_b856a952(self.team);
			}
		}
	}
}

/*
	Name: match_end
	Namespace: arena
	Checksum: 0x1A3651CA
	Offset: 0x540
	Size: 0x1C4
	Parameters: 0
	Flags: Linked
*/
function match_end()
{
	if(gamemodeisarena())
	{
		for(index = 0; index < level.players.size; index++)
		{
			player = level.players[index];
			if(isdefined(player.pers[#"arenainit"]) && player.pers[#"arenainit"] == 1)
			{
				var_affb66b5 = undefined;
				if(match::get_flag("tie"))
				{
					var_affb66b5 = 0;
					player arenaendmatch(0);
				}
				else
				{
					if(match::function_a2b53e17(player))
					{
						var_affb66b5 = 1;
						player arenaendmatch(1);
					}
					else
					{
						var_affb66b5 = -1;
						player arenaendmatch(-1);
					}
				}
				if(isdefined(player.pers[#"hash_1b5251cc167039c8"]))
				{
					if(isdefined(var_affb66b5))
					{
						player function_cce105c8(#"hash_45b731f317083a1b", 1, player.pers[#"hash_1b5251cc167039c8"], 2, var_affb66b5);
					}
				}
			}
		}
		function_42e2cd11();
	}
}

/*
	Name: update_arena_challenge_seasons
	Namespace: arena
	Checksum: 0x7D25B77F
	Offset: 0x710
	Size: 0x260
	Parameters: 0
	Flags: None
*/
function update_arena_challenge_seasons()
{
	if(!gamemodeisarena())
	{
		return;
	}
	eventstate = "";
	eventtype = function_945560bf();
	switch(eventtype)
	{
		case 1:
		{
			eventstate = #"hash_ca4c97bc6c2963b";
			break;
		}
		case 0:
		{
			eventstate = #"leagueplaystats";
			break;
		}
		case 4:
		{
			eventstate = #"hash_4986c748eb81d3c5";
			break;
		}
		default:
		{
			return;
		}
	}
	perseasonwins = self stats::get_stat(#"arenaperseasonstats", eventstate, #"matchesstats", #"wins");
	if(perseasonwins >= getdvarint(#"arena_seasonvetchallengewins", 0))
	{
		arenaslot = arenagetslot();
		currentseason = self stats::get_stat(#"arenastats", arenaslot, #"season");
		seasonvetchallengearraycount = self getdstatarraycount("arenaChallengeSeasons");
		for(i = 0; i < seasonvetchallengearraycount; i++)
		{
			challengeseason = self stats::get_stat(#"arenachallengeseasons", i);
			if(challengeseason == currentseason)
			{
				return;
			}
			if(challengeseason == 0)
			{
				self stats::set_stat(#"arenachallengeseasons", i, currentseason);
				break;
			}
		}
	}
}

