#using script_32c8b5b0eb2854f3;
#using script_47fb62300ac0bd60;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\mp_common\gametypes\match.gsc;

#namespace arena;

/*
	Name: function_85737a30
	Namespace: arena
	Checksum: 0x793F988C
	Offset: 0xB0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_85737a30()
{
	level notify(1404738273);
}

/*
	Name: function_89f2df9
	Namespace: arena
	Checksum: 0xEAB2F411
	Offset: 0xD0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"arena", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: arena
	Checksum: 0xA4E979D3
	Offset: 0x118
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
		callback::function_98a0917d(&function_98a0917d);
		level.var_a962eeb6 = &function_51203700;
	}
}

/*
	Name: function_51203700
	Namespace: arena
	Checksum: 0x40A2F244
	Offset: 0x1B0
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
	Checksum: 0xB2E43E97
	Offset: 0x1C0
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
	Name: function_98a0917d
	Namespace: arena
	Checksum: 0x82864998
	Offset: 0x298
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function function_98a0917d()
{
	if(gamemodeisarena())
	{
		function_e938380b();
	}
}

/*
	Name: function_b856a952
	Namespace: arena
	Checksum: 0x8C9CD217
	Offset: 0x2D0
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
	Checksum: 0xE322235A
	Offset: 0x460
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
	Name: function_77151fd1
	Namespace: arena
	Checksum: 0xEE75E801
	Offset: 0x560
	Size: 0x154
	Parameters: 0
	Flags: Linked
*/
function function_77151fd1()
{
	if(gamemodeisarena() && getdvarint(#"hash_6eb6c222bc98b01", 0))
	{
		penalty = function_377f07c2();
		for(index = 0; index < level.players.size; index++)
		{
			player = level.players[index];
			if(!isdefined(player.pers[#"hash_6dbbb195b62e0dd3"]))
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
	Name: match_end
	Namespace: arena
	Checksum: 0x962DD4BC
	Offset: 0x6C0
	Size: 0x1D4
	Parameters: 0
	Flags: Linked
*/
function match_end()
{
	if(gamemodeisarena())
	{
		function_77151fd1();
		for(index = 0; index < level.players.size; index++)
		{
			player = level.players[index];
			if(isdefined(player.pers[#"arenainit"]) && player.pers[#"arenainit"] == 1)
			{
				var_affb66b5 = undefined;
				if(match::function_5f24faac("tie"))
				{
					var_affb66b5 = 1;
					player arenaendmatch(0);
				}
				else
				{
					if(match::function_a2b53e17(player))
					{
						var_affb66b5 = 2;
						player arenaendmatch(1);
					}
					else
					{
						var_affb66b5 = 0;
						player arenaendmatch(-1);
					}
				}
				if(isdefined(player.pers[#"hash_1b5251cc167039c8"]))
				{
					if(isdefined(var_affb66b5))
					{
						player function_cce105c8(#"hash_4e13b2889185a48d", 1, player.pers[#"hash_1b5251cc167039c8"], 2, var_affb66b5);
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
	Checksum: 0xC64A0E6E
	Offset: 0x8A0
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
			eventstate = #"hash_60f1e9335197f661";
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
	perseasonwins = self stats::get_stat(#"arenaperseasonstats", eventstate, #"hash_2f54ed970fcecc95", #"wins");
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

