#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace spectating;

/*
	Name: function_89f2df9
	Namespace: spectating
	Checksum: 0x617570F
	Offset: 0xB0
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
	Checksum: 0x8AF05B3B
	Offset: 0xF8
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
	Checksum: 0x5E0306F9
	Offset: 0x128
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
	Checksum: 0xC304D840
	Offset: 0x1E8
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
	Checksum: 0xF365D434
	Offset: 0x258
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
	Checksum: 0xED83CF0F
	Offset: 0x290
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
	Checksum: 0xFFCC259B
	Offset: 0x2D0
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
	Checksum: 0x88CC4BF6
	Offset: 0x310
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
	Checksum: 0x228BE9A9
	Offset: 0x380
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
	Checksum: 0xA5166BAB
	Offset: 0x458
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
	Checksum: 0x5435EB7B
	Offset: 0x518
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
	Checksum: 0x57F7C28E
	Offset: 0x5B8
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
	Checksum: 0x7429512E
	Offset: 0x670
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
	Checksum: 0x95F3EB1D
	Offset: 0xBC8
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

