#using script_256b8879317373de;
#using script_7dc3a36c222eaf22;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace spectating;

/*
	Name: function_36cf5805
	Namespace: spectating
	Checksum: 0xCB9937EB
	Offset: 0xC0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_36cf5805()
{
	level notify(2119833321);
}

/*
	Name: function_89f2df9
	Namespace: spectating
	Checksum: 0xC380929C
	Offset: 0xE0
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
	Checksum: 0x3ED30B85
	Offset: 0x128
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
	Checksum: 0x58808533
	Offset: 0x1D8
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
	Checksum: 0x6506E0A1
	Offset: 0x278
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
	Checksum: 0xFCF92D3
	Offset: 0x320
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
	Checksum: 0x451A70D
	Offset: 0x3F8
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
	Checksum: 0x5AAF028
	Offset: 0x4B8
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
	Checksum: 0x955AF766
	Offset: 0xB10
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
	Checksum: 0x64AEAA19
	Offset: 0xC28
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
	Checksum: 0x1928C77F
	Offset: 0xC48
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
	Checksum: 0x20840445
	Offset: 0xC68
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
	Checksum: 0x6831F9CC
	Offset: 0xD28
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
	Checksum: 0x350F53EB
	Offset: 0xEE8
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
	Checksum: 0x7F23924E
	Offset: 0x1060
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
	Checksum: 0xB97B192B
	Offset: 0x1168
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
	Checksum: 0x8BA9E92B
	Offset: 0x1270
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
	Checksum: 0x4123287C
	Offset: 0x1300
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
	Checksum: 0x1FB2F913
	Offset: 0x1400
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
	Checksum: 0xD013D8E8
	Offset: 0x1478
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
	Checksum: 0x5A730864
	Offset: 0x14C0
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
	Checksum: 0xD2122AF3
	Offset: 0x1528
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
	Checksum: 0xE5839A35
	Offset: 0x15E8
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
	Checksum: 0x402D4D0A
	Offset: 0x16D8
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
	Checksum: 0x21D2957B
	Offset: 0x1738
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
	Checksum: 0x34BD622
	Offset: 0x1828
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
	Checksum: 0x44F1AC9
	Offset: 0x18A8
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
	Checksum: 0xD1809427
	Offset: 0x1988
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
	Checksum: 0xCCFE01ED
	Offset: 0x1A20
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
	Checksum: 0x30129DE9
	Offset: 0x1AF8
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
	Checksum: 0xC5FCEE14
	Offset: 0x1B70
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
	Checksum: 0x382C696A
	Offset: 0x1C48
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

