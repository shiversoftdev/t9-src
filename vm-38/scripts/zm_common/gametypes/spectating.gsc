#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace spectating;

/*
	Name: function_339bd73e
	Namespace: spectating
	Checksum: 0x6FD2CE52
	Offset: 0xB0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_339bd73e()
{
	level notify(1471719578);
}

/*
	Name: function_89f2df9
	Namespace: spectating
	Checksum: 0x790F4C11
	Offset: 0xD0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"zm_spectating", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: spectating
	Checksum: 0x5E165CB9
	Offset: 0x118
	Size: 0x24
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	callback::on_start_gametype(&main);
}

/*
	Name: main
	Namespace: spectating
	Checksum: 0xE039C96
	Offset: 0x148
	Size: 0xB4
	Parameters: 0
	Flags: Linked
*/
function main()
{
	foreach(team, _ in level.teams)
	{
		level.spectateoverride[team] = spawnstruct();
	}
	callback::on_connecting(&on_player_connecting);
}

/*
	Name: on_player_connecting
	Namespace: spectating
	Checksum: 0xD02C8804
	Offset: 0x208
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function on_player_connecting()
{
	callback::on_joined_team(&on_joined_team);
	callback::on_spawned(&on_player_spawned);
	callback::on_joined_spectate(&on_joined_spectate);
}

/*
	Name: on_player_spawned
	Namespace: spectating
	Checksum: 0x84F4E8
	Offset: 0x278
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function on_player_spawned()
{
	self endon(#"disconnect");
	self setspectatepermissions();
}

/*
	Name: on_joined_team
	Namespace: spectating
	Checksum: 0x5CE2F40B
	Offset: 0x2B0
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function on_joined_team(params)
{
	self endon(#"disconnect");
	self setspectatepermissionsformachine();
}

/*
	Name: on_joined_spectate
	Namespace: spectating
	Checksum: 0x30EA9CF1
	Offset: 0x2F0
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function on_joined_spectate(params)
{
	self endon(#"disconnect");
	self setspectatepermissionsformachine();
}

/*
	Name: updatespectatesettings
	Namespace: spectating
	Checksum: 0x172479CB
	Offset: 0x330
	Size: 0x64
	Parameters: 0
	Flags: None
*/
function updatespectatesettings()
{
	level endon(#"game_ended");
	for(index = 0; index < level.players.size; index++)
	{
		level.players[index] setspectatepermissions();
	}
}

/*
	Name: getsplitscreenteam
	Namespace: spectating
	Checksum: 0x309E4549
	Offset: 0x3A0
	Size: 0xCA
	Parameters: 0
	Flags: Linked
*/
function getsplitscreenteam()
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
		if(team != "spectator")
		{
			return team;
		}
	}
	return self.sessionteam;
}

/*
	Name: otherlocalplayerstillalive
	Namespace: spectating
	Checksum: 0x804F5FE3
	Offset: 0x478
	Size: 0xB6
	Parameters: 0
	Flags: Linked
*/
function otherlocalplayerstillalive()
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
	Name: allowspectateallteams
	Namespace: spectating
	Checksum: 0xDC7FAC96
	Offset: 0x538
	Size: 0x98
	Parameters: 1
	Flags: Linked
*/
function allowspectateallteams(allow)
{
	foreach(team, _ in level.teams)
	{
		self allowspectateteam(team, allow);
	}
}

/*
	Name: allowspectateallteamsexceptteam
	Namespace: spectating
	Checksum: 0x22B18772
	Offset: 0x5D8
	Size: 0xB0
	Parameters: 2
	Flags: Linked
*/
function allowspectateallteamsexceptteam(skip_team, allow)
{
	foreach(team, _ in level.teams)
	{
		if(team == skip_team)
		{
			continue;
		}
		self allowspectateteam(team, allow);
	}
}

/*
	Name: setspectatepermissions
	Namespace: spectating
	Checksum: 0x3EA66633
	Offset: 0x690
	Size: 0x54C
	Parameters: 0
	Flags: Linked
*/
function setspectatepermissions()
{
	team = self.sessionteam;
	if(team == "spectator")
	{
		if(self issplitscreen() && !level.splitscreen)
		{
			team = getsplitscreenteam();
		}
		if(team == "spectator")
		{
			self allowspectateallteams(1);
			self allowspectateteam("freelook", 0);
			self allowspectateteam("none", 1);
			self allowspectateteam("localplayers", 1);
			return;
		}
	}
	spectatetype = level.spectatetype;
	switch(spectatetype)
	{
		case 0:
		{
			self allowspectateallteams(0);
			self allowspectateteam("freelook", 0);
			self allowspectateteam("none", 1);
			self allowspectateteam("localplayers", 0);
			break;
		}
		case 3:
		{
			if(self issplitscreen() && self otherlocalplayerstillalive())
			{
				self allowspectateallteams(0);
				self allowspectateteam("none", 0);
				self allowspectateteam("freelook", 0);
				self allowspectateteam("localplayers", 1);
				break;
			}
		}
		case 1:
		{
			if(!level.teambased)
			{
				self allowspectateallteams(1);
				self allowspectateteam("none", 1);
				self allowspectateteam("freelook", 0);
				self allowspectateteam("localplayers", 1);
			}
			else
			{
				if(isdefined(team) && isdefined(level.teams[team]))
				{
					self allowspectateteam(team, 1);
					self allowspectateallteamsexceptteam(team, 0);
					self allowspectateteam("freelook", 0);
					self allowspectateteam("none", 0);
					self allowspectateteam("localplayers", 1);
				}
				else
				{
					self allowspectateallteams(0);
					self allowspectateteam("freelook", 0);
					self allowspectateteam("none", 0);
					self allowspectateteam("localplayers", 1);
				}
			}
			break;
		}
		case 2:
		{
			self allowspectateallteams(1);
			self allowspectateteam("freelook", 1);
			self allowspectateteam("none", 1);
			self allowspectateteam("localplayers", 1);
			break;
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
			self allowspectateallteamsexceptteam(team, 1);
		}
	}
}

/*
	Name: setspectatepermissionsformachine
	Namespace: spectating
	Checksum: 0xD3501E7A
	Offset: 0xBE8
	Size: 0xDC
	Parameters: 0
	Flags: Linked
*/
function setspectatepermissionsformachine()
{
	self setspectatepermissions();
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
		level.players[index] setspectatepermissions();
	}
}

