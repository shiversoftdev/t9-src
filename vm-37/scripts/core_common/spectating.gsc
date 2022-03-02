#using script_256b8879317373de;
#using script_7dc3a36c222eaf22;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace spectating;

/*
	Name: function_89f2df9
	Namespace: spectating
	Checksum: 0xC1CA0D8A
	Offset: 0xC0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"spectating", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: spectating
	Checksum: 0xE2429F6B
	Offset: 0x108
	Size: 0xA4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	callback::on_start_gametype(&init);
	callback::on_spawned(&set_permissions);
	callback::on_joined_team(&set_permissions_for_machine);
	callback::on_joined_spectate(&set_permissions_for_machine);
	callback::on_player_killed(&on_player_killed);
}

/*
	Name: init
	Namespace: spectating
	Checksum: 0x338C60EC
	Offset: 0x1B8
	Size: 0x94
	Parameters: 0
	Flags: Linked
*/
function init()
{
	foreach(team, _ in level.teams)
	{
		level.spectateoverride[team] = spawnstruct();
	}
}

/*
	Name: update_settings
	Namespace: spectating
	Checksum: 0x1E4E302C
	Offset: 0x258
	Size: 0xA0
	Parameters: 0
	Flags: Linked
*/
function update_settings()
{
	level endon(#"game_ended");
	foreach(player in level.players)
	{
		player set_permissions();
	}
}

/*
	Name: get_splitscreen_team
	Namespace: spectating
	Checksum: 0xF6A15CCF
	Offset: 0x300
	Size: 0xCE
	Parameters: 0
	Flags: Linked
*/
function get_splitscreen_team()
{
	for(index = 0; index < level.players.size; index++)
	{
		if(!isdefined(level.players[index]))
		{
			continue;
		}
		if(level.players[index] == self)
		{
			continue;
		}
		if(!self isplayeronsamemachine(level.players[index]))
		{
			continue;
		}
		team = level.players[index].sessionteam;
		if(team != #"spectator")
		{
			return team;
		}
	}
	return self.sessionteam;
}

/*
	Name: other_local_player_still_alive
	Namespace: spectating
	Checksum: 0xB69B7921
	Offset: 0x3D8
	Size: 0xB6
	Parameters: 0
	Flags: Linked
*/
function other_local_player_still_alive()
{
	for(index = 0; index < level.players.size; index++)
	{
		if(!isdefined(level.players[index]))
		{
			continue;
		}
		if(level.players[index] == self)
		{
			continue;
		}
		if(!self isplayeronsamemachine(level.players[index]))
		{
			continue;
		}
		if(isalive(level.players[index]))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: set_permissions
	Namespace: spectating
	Checksum: 0xD6AA8DC6
	Offset: 0x498
	Size: 0x64C
	Parameters: 0
	Flags: Linked
*/
function set_permissions()
{
	team = self.sessionteam;
	if(team == #"spectator")
	{
		if(self issplitscreen() && !level.splitscreen)
		{
			team = get_splitscreen_team();
		}
		if(team == #"spectator")
		{
			self.var_92e86779 = #"invalid";
			self allowspectateallteams(1);
			self allowspectateteam("freelook", 0);
			self allowspectateteam(#"none", 1);
			self allowspectateteam("localplayers", 1);
			return;
		}
	}
	self allowspectateallteams(0);
	self allowspectateteam("localplayers", 1);
	self allowspectateteam("freelook", 0);
	switch(level.spectatetype)
	{
		case 0:
		{
			self.var_92e86779 = #"invalid";
			self allowspectateteam(#"none", 1);
			self allowspectateteam("localplayers", 0);
			break;
		}
		case 3:
		{
			self.var_92e86779 = #"invalid";
			if(self issplitscreen() && self other_local_player_still_alive())
			{
				self allowspectateteam(#"none", 0);
				break;
			}
		}
		case 1:
		{
			self.var_92e86779 = #"invalid";
			if(!level.teambased)
			{
				self allowspectateallteams(1);
				self allowspectateteam(#"none", 1);
			}
			else
			{
				if(isdefined(team) && isdefined(level.teams[team]))
				{
					self allowspectateteam(team, 1);
					self allowspectateteam(#"none", 0);
				}
				else
				{
					self allowspectateteam(#"none", 0);
				}
			}
			break;
		}
		case 6:
		{
			self.var_92e86779 = team;
			self allowspectateteam(#"none", 0);
			self allowspectateteam(team, 1);
			break;
		}
		case 2:
		{
			self.var_92e86779 = #"invalid";
			self allowspectateteam(#"none", 1);
			self allowspectateallteams(1);
			foreach(team in level.teams)
			{
				if(self.team == team)
				{
					continue;
				}
				self allowspectateteam(team, 1);
			}
			break;
		}
		case 4:
		case 5:
		{
			if(spawning::function_29b859d1())
			{
				self allowspectateteam(#"none", 0);
				self allowspectateteam(team, 1);
			}
			return;
		}
	}
	if(isdefined(team) && isdefined(level.teams[team]))
	{
		if(isdefined(level.spectateoverride[team].allowfreespectate))
		{
			self allowspectateteam("freelook", 1);
		}
		if(isdefined(level.spectateoverride[team].allowenemyspectate))
		{
			if(level.spectateoverride[team].allowenemyspectate == #"all")
			{
				self allowspectateallteams(1);
			}
			else
			{
				self allowspectateallteams(0);
				self allowspectateteam(level.spectateoverride[team].allowenemyspectate, 1);
			}
		}
	}
}

/*
	Name: function_18b8b7e4
	Namespace: spectating
	Checksum: 0xCE755027
	Offset: 0xAF0
	Size: 0x10E
	Parameters: 2
	Flags: Linked
*/
function function_18b8b7e4(players, origin)
{
	if(!isdefined(players) || players.size == 0)
	{
		return undefined;
	}
	sorted_players = arraysort(players, origin);
	foreach(player in sorted_players)
	{
		if(player == self)
		{
			continue;
		}
		if(!isalive(player))
		{
			continue;
		}
		if(player laststand::player_is_in_laststand())
		{
			continue;
		}
		return player;
	}
	return undefined;
}

/*
	Name: function_78d7160b
	Namespace: spectating
	Checksum: 0xEA6A103
	Offset: 0xC08
	Size: 0x16
	Parameters: 1
	Flags: Linked
*/
function function_78d7160b(player)
{
	return player.var_92e86779;
}

/*
	Name: function_44d43a69
	Namespace: spectating
	Checksum: 0x35EF24F0
	Offset: 0xC28
	Size: 0x16
	Parameters: 1
	Flags: Linked
*/
function function_44d43a69(player)
{
	return player.var_ba35b2d2;
}

/*
	Name: function_9c5853f5
	Namespace: spectating
	Checksum: 0x6C4BFB33
	Offset: 0xC48
	Size: 0xB4
	Parameters: 3
	Flags: Linked
*/
function function_9c5853f5(players, var_22b78352, var_89bd5332)
{
	foreach(player in players)
	{
		if(player != self && [[var_22b78352]](player) != var_89bd5332)
		{
			return player;
		}
	}
	return undefined;
}

/*
	Name: function_327e6270
	Namespace: spectating
	Checksum: 0x436B51AA
	Offset: 0xD08
	Size: 0x1B6
	Parameters: 3
	Flags: None
*/
function function_327e6270(players, var_22b78352, var_89bd5332)
{
	if(!isdefined(players) || players.size == 0)
	{
		return self;
	}
	player = function_18b8b7e4(players, self.origin);
	if(isdefined(player))
	{
		/#
			println((((((("" + [[var_22b78352]](player)) + "") + self.name) + "") + [[var_22b78352]](self) + "") + player.name) + "");
		#/
		return player;
	}
	player = function_9c5853f5(players, var_22b78352, var_89bd5332);
	if(isdefined(player))
	{
		/#
			println((((((("" + [[var_22b78352]](player)) + "") + self.name) + "") + [[var_22b78352]](self) + "") + player.name) + "");
		#/
		return player;
	}
	/#
		println(((("" + [[var_22b78352]](self)) + "") + self.name) + "");
	#/
	return self;
}

/*
	Name: function_460b3788
	Namespace: spectating
	Checksum: 0x11EFFD88
	Offset: 0xEC8
	Size: 0x16E
	Parameters: 4
	Flags: Linked
*/
function function_460b3788(players, var_22b78352, var_89bd5332, var_c9fe8766)
{
	if(!isdefined(players) || players.size == 0)
	{
		return undefined;
	}
	var_156b3879 = self function_18b8b7e4(players, self.origin);
	if(isdefined(var_156b3879) && isplayer(var_156b3879))
	{
		return var_156b3879;
	}
	target = function_9c5853f5(players, var_22b78352, var_89bd5332);
	if(isdefined(target))
	{
		return target;
	}
	if(var_c9fe8766)
	{
		teammates = function_a1ef346b(self.team);
		return self function_460b3788(teammates, &function_78d7160b, #"invalid", 0);
	}
	target = array::random(function_a1ef346b());
	if(isdefined(target))
	{
		return target;
	}
	return undefined;
}

/*
	Name: function_4c37bb21
	Namespace: spectating
	Checksum: 0x7A302B1D
	Offset: 0x1040
	Size: 0xFC
	Parameters: 0
	Flags: Linked
*/
function function_4c37bb21()
{
	players = undefined;
	if(self.team != #"spectator")
	{
		players = function_a1ef346b(self.team);
	}
	var_156b3879 = self function_460b3788(players, &function_78d7160b, #"invalid", 0);
	if(isdefined(var_156b3879) && isplayer(var_156b3879))
	{
		self.var_92e86779 = var_156b3879.team;
		if(self.sessionstate !== "playing")
		{
			self setcurrentspectatorclient(var_156b3879);
		}
		return var_156b3879;
	}
	return undefined;
}

/*
	Name: function_10fbd7e5
	Namespace: spectating
	Checksum: 0xA4687EE0
	Offset: 0x1148
	Size: 0xFC
	Parameters: 0
	Flags: Linked
*/
function function_10fbd7e5()
{
	players = undefined;
	if(self.team != #"spectator")
	{
		players = function_a1cff525(self.squad);
	}
	var_156b3879 = self function_460b3788(players, &function_44d43a69, #"invalid", 1);
	if(isdefined(var_156b3879) && isplayer(var_156b3879))
	{
		self.var_92e86779 = var_156b3879.team;
		if(self.sessionstate !== "playing")
		{
			self setcurrentspectatorclient(var_156b3879);
		}
		return var_156b3879;
	}
	return undefined;
}

/*
	Name: function_da128b1
	Namespace: spectating
	Checksum: 0xCBA60249
	Offset: 0x1250
	Size: 0x86
	Parameters: 0
	Flags: Linked
*/
function function_da128b1()
{
	if(level.spectatetype === 5 && self.var_ba35b2d2 !== #"invalid")
	{
		return function_10fbd7e5();
	}
	if(level.spectatetype === 4 && self.var_92e86779 !== #"invalid")
	{
		return function_4c37bb21();
	}
	return undefined;
}

/*
	Name: set_permissions_for_machine
	Namespace: spectating
	Checksum: 0xF69C9F58
	Offset: 0x12E0
	Size: 0xF4
	Parameters: 0
	Flags: Linked
*/
function set_permissions_for_machine()
{
	self function_da128b1();
	self set_permissions();
	if(!self issplitscreen())
	{
		return;
	}
	for(index = 0; index < level.players.size; index++)
	{
		if(!isdefined(level.players[index]))
		{
			continue;
		}
		if(level.players[index] == self)
		{
			continue;
		}
		if(!self isplayeronsamemachine(level.players[index]))
		{
			continue;
		}
		level.players[index] set_permissions();
	}
}

/*
	Name: function_7d15f599
	Namespace: spectating
	Checksum: 0x49AC03FA
	Offset: 0x13E0
	Size: 0x6E
	Parameters: 0
	Flags: Linked
*/
function function_7d15f599()
{
	livesleft = !(level.numlives && !self.pers[#"lives"]);
	if(!function_a1ef346b(self.team).size && !livesleft)
	{
		return false;
	}
	return true;
}

/*
	Name: function_23c5f4f2
	Namespace: spectating
	Checksum: 0xC93D04AB
	Offset: 0x1458
	Size: 0x3C
	Parameters: 0
	Flags: None
*/
function function_23c5f4f2()
{
	self endon(#"disconnect");
	waitframe(1);
	function_493d2e03(#"all");
}

/*
	Name: function_493d2e03
	Namespace: spectating
	Checksum: 0x5CF7AC61
	Offset: 0x14A0
	Size: 0x5C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_493d2e03(team)
{
	if(!self function_7d15f599())
	{
		level.spectateoverride[self.team].allowenemyspectate = team;
		update_settings();
	}
}

/*
	Name: function_34460764
	Namespace: spectating
	Checksum: 0xBA3A0F02
	Offset: 0x1508
	Size: 0xB8
	Parameters: 1
	Flags: None
*/
function function_34460764(team)
{
	players = getplayers(team);
	foreach(player in players)
	{
		player allowspectateallteams(1);
	}
}

/*
	Name: function_ef775048
	Namespace: spectating
	Checksum: 0x39E42A44
	Offset: 0x15C8
	Size: 0xE8
	Parameters: 2
	Flags: None
*/
function function_ef775048(team, var_6f1b46b8)
{
	self endon(#"disconnect");
	waitframe(1);
	if(function_a1ef346b(team).size)
	{
		return;
	}
	players = getplayers(team);
	foreach(player in players)
	{
		player function_493d2e03(var_6f1b46b8);
	}
}

/*
	Name: follow_chain
	Namespace: spectating
	Checksum: 0xAB06E0D0
	Offset: 0x16B8
	Size: 0x56
	Parameters: 1
	Flags: Linked
*/
function follow_chain(var_41349818)
{
	if(!isdefined(var_41349818))
	{
		return;
	}
	while(isdefined(var_41349818) && var_41349818.spectatorclient != -1)
	{
		var_41349818 = getentbynum(var_41349818.spectatorclient);
	}
	return var_41349818;
}

/*
	Name: function_93281015
	Namespace: spectating
	Checksum: 0xDE3CF824
	Offset: 0x1718
	Size: 0xE6
	Parameters: 2
	Flags: Linked
*/
function function_93281015(players, attacker)
{
	if(!isdefined(self) || !isdefined(self.team))
	{
		return undefined;
	}
	var_1178af52 = isdefined(attacker) && isplayer(attacker) && attacker != self && isalive(attacker);
	if(var_1178af52 && attacker.team == self.team)
	{
		return attacker;
	}
	friendly = function_18b8b7e4(players, self.origin);
	if(isdefined(friendly))
	{
		return friendly;
	}
	return undefined;
}

/*
	Name: function_e34c084d
	Namespace: spectating
	Checksum: 0xD2CCF357
	Offset: 0x1808
	Size: 0x78
	Parameters: 2
	Flags: None
*/
function function_e34c084d(players, attacker)
{
	var_1178af52 = isdefined(attacker) && isplayer(attacker) && attacker != self && isalive(attacker);
	if(var_1178af52)
	{
		return attacker;
	}
	return undefined;
}

/*
	Name: function_770d7902
	Namespace: spectating
	Checksum: 0xBE4C811D
	Offset: 0x1888
	Size: 0xD2
	Parameters: 0
	Flags: Linked, Private
*/
function private function_770d7902()
{
	/#
		assert(level.spectatetype == 4 || level.spectatetype == 5);
	#/
	switch(level.spectatetype)
	{
		case 5:
		{
			players = function_a1cff525(self.squad);
			if(players.size > 0)
			{
				return players;
			}
		}
		case 4:
		default:
		{
			return function_a1ef346b(self.team);
		}
	}
}

/*
	Name: function_26c5324a
	Namespace: spectating
	Checksum: 0x50065A0D
	Offset: 0x1968
	Size: 0x8C
	Parameters: 1
	Flags: Linked
*/
function function_26c5324a(var_156b3879)
{
	self.spectatorclient = -1;
	if(!self spawning::function_29b859d1())
	{
		self.var_92e86779 = var_156b3879.team;
	}
	self setcurrentspectatorclient(var_156b3879);
	self callback::callback(#"hash_37840d0d5a10e6b8", {#client:var_156b3879});
}

/*
	Name: function_2b728d67
	Namespace: spectating
	Checksum: 0x2DCD065D
	Offset: 0x1A00
	Size: 0xCC
	Parameters: 1
	Flags: Linked
*/
function function_2b728d67(attacker)
{
	players = function_770d7902();
	var_8447710e = player::figure_out_attacker(attacker);
	var_156b3879 = self function_93281015(players, var_8447710e);
	if(isdefined(var_156b3879))
	{
		function_836ee9ed(var_156b3879);
		return;
	}
	if(!isdefined(level.var_18c9a2d1))
	{
		level.var_18c9a2d1 = &function_7fe9c0d1;
	}
	[[level.var_18c9a2d1]](players, attacker);
}

/*
	Name: function_836ee9ed
	Namespace: spectating
	Checksum: 0x5A325A85
	Offset: 0x1AD8
	Size: 0x6E
	Parameters: 1
	Flags: Linked
*/
function function_836ee9ed(var_156b3879)
{
	var_156b3879 = follow_chain(var_156b3879);
	if(isdefined(var_156b3879) && isplayer(var_156b3879))
	{
		function_26c5324a(var_156b3879);
	}
	else
	{
		self.var_92e86779 = self.team;
	}
}

/*
	Name: function_7fe9c0d1
	Namespace: spectating
	Checksum: 0xCE97B6EB
	Offset: 0x1B50
	Size: 0xCC
	Parameters: 2
	Flags: Linked
*/
function function_7fe9c0d1(players, attacker)
{
	if(self spawning::function_29b859d1())
	{
		return;
	}
	var_1178af52 = isdefined(attacker) && isplayer(attacker) && attacker != self && isalive(attacker);
	if(var_1178af52)
	{
		var_156b3879 = attacker;
	}
	if(!isdefined(var_156b3879))
	{
		var_156b3879 = self function_da128b1();
	}
	function_836ee9ed(var_156b3879);
}

/*
	Name: on_player_killed
	Namespace: spectating
	Checksum: 0x3F2DD327
	Offset: 0x1C28
	Size: 0xB4
	Parameters: 1
	Flags: Linked
*/
function on_player_killed(params)
{
	if(level.spectatetype == 4 || level.spectatetype == 5)
	{
		self thread function_2b728d67(params.eattacker);
		if(level.var_1ba484ad == 2 || self namespace_8a203916::function_500047aa(1))
		{
			self namespace_8a203916::function_86df9236();
		}
		else
		{
			self namespace_8a203916::function_888901cb();
		}
	}
}

