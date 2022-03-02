#using scripts\core_common\hud_message_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\zm_common\gametypes\globallogic_score.gsc;
#using scripts\zm_common\gametypes\hostmigration.gsc;

#namespace globallogic_utils;

/*
	Name: function_1536fff0
	Namespace: globallogic_utils
	Checksum: 0x400CF81E
	Offset: 0xA0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_1536fff0()
{
	level notify(1474731365);
}

/*
	Name: testshock
	Namespace: globallogic_utils
	Checksum: 0x530C38EB
	Offset: 0xC0
	Size: 0xB8
	Parameters: 0
	Flags: None
*/
function testshock()
{
	self endon(#"death", #"disconnect");
	for(;;)
	{
		wait(3);
		numshots = randomint(6);
		for(i = 0; i < numshots; i++)
		{
			iprintlnbold(numshots);
			self shellshock(#"frag_grenade_mp", 0.2);
			wait(0.1);
		}
	}
}

/*
	Name: timeuntilroundend
	Namespace: globallogic_utils
	Checksum: 0xDCC9EE06
	Offset: 0x180
	Size: 0xE4
	Parameters: 0
	Flags: None
*/
function timeuntilroundend()
{
	if(level.gameended)
	{
		timepassed = (gettime() - level.gameendtime) / 1000;
		timeremaining = level.postroundtime - timepassed;
		if(timeremaining < 0)
		{
			return 0;
		}
		return timeremaining;
	}
	if(level.inovertime)
	{
		return undefined;
	}
	if(level.timelimit <= 0)
	{
		return undefined;
	}
	if(!isdefined(level.starttime))
	{
		return undefined;
	}
	timepassed = (gettimepassed() - level.starttime) / 1000;
	timeremaining = (level.timelimit * 60) - timepassed;
	return timeremaining + level.postroundtime;
}

/*
	Name: gettimeremaining
	Namespace: globallogic_utils
	Checksum: 0x19F3AECF
	Offset: 0x270
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function gettimeremaining()
{
	if(!isdefined(level.timelimit))
	{
		level.timelimit = 0;
	}
	return ((level.timelimit * 60) * 1000) - gettimepassed();
}

/*
	Name: registerpostroundevent
	Namespace: globallogic_utils
	Checksum: 0x132D68F9
	Offset: 0x2C8
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function registerpostroundevent(eventfunc)
{
	if(!isdefined(level.postroundevents))
	{
		level.postroundevents = [];
	}
	level.postroundevents[level.postroundevents.size] = eventfunc;
}

/*
	Name: executepostroundevents
	Namespace: globallogic_utils
	Checksum: 0x763A41FE
	Offset: 0x318
	Size: 0x56
	Parameters: 0
	Flags: None
*/
function executepostroundevents()
{
	if(!isdefined(level.postroundevents))
	{
		return;
	}
	for(i = 0; i < level.postroundevents.size; i++)
	{
		[[level.postroundevents[i]]]();
	}
}

/*
	Name: getvalueinrange
	Namespace: globallogic_utils
	Checksum: 0xBD0BC23F
	Offset: 0x378
	Size: 0x44
	Parameters: 3
	Flags: None
*/
function getvalueinrange(value, minvalue, maxvalue)
{
	if(value > maxvalue)
	{
		return maxvalue;
	}
	if(value < minvalue)
	{
		return minvalue;
	}
	return value;
}

/*
	Name: assertproperplacement
	Namespace: globallogic_utils
	Checksum: 0xF3AF1811
	Offset: 0x3C8
	Size: 0x1B8
	Parameters: 0
	Flags: None
*/
function assertproperplacement()
{
	/#
		numplayers = level.placement[#"all"].size;
		for(i = 0; i < numplayers - 1; i++)
		{
			if(isdefined(level.placement[#"all"][i]) && isdefined(level.placement[#"all"][i + 1]))
			{
				if(level.placement[#"all"][i].score < level.placement[#"all"][i + 1].score)
				{
					println("");
					for(i = 0; i < numplayers; i++)
					{
						player = level.placement[#"all"][i];
						println((((("" + i) + "") + player.name) + "") + player.score);
					}
					/#
						assertmsg("");
					#/
					break;
				}
			}
		}
	#/
}

/*
	Name: isvalidclass
	Namespace: globallogic_utils
	Checksum: 0xDF9AE564
	Offset: 0x588
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function isvalidclass(vclass)
{
	return isdefined(vclass) && vclass != "";
}

/*
	Name: playtickingsound
	Namespace: globallogic_utils
	Checksum: 0x3628EC19
	Offset: 0x5B8
	Size: 0x118
	Parameters: 1
	Flags: None
*/
function playtickingsound(gametype_tick_sound)
{
	self endon(#"death", #"stop_ticking");
	level endon(#"game_ended");
	time = level.bombtimer;
	while(true)
	{
		self playsound(gametype_tick_sound);
		if(time > 10)
		{
			time = time - 1;
			wait(1);
		}
		else
		{
			if(time > 4)
			{
				time = time - 0.5;
				wait(0.5);
			}
			else
			{
				if(time > 1)
				{
					time = time - 0.4;
					wait(0.4);
				}
				else
				{
					time = time - 0.3;
					wait(0.3);
				}
			}
		}
		hostmigration::waittillhostmigrationdone();
	}
}

/*
	Name: stoptickingsound
	Namespace: globallogic_utils
	Checksum: 0x562DF85B
	Offset: 0x6D8
	Size: 0x16
	Parameters: 0
	Flags: None
*/
function stoptickingsound()
{
	self notify(#"stop_ticking");
}

/*
	Name: gametimer
	Namespace: globallogic_utils
	Checksum: 0x88C8FE4
	Offset: 0x6F8
	Size: 0xEC
	Parameters: 0
	Flags: Linked
*/
function gametimer()
{
	level endon(#"game_ended");
	level waittill(#"prematch_over");
	level.starttime = gettime();
	level.discardtime = 0;
	if(isdefined(game.roundmillisecondsalreadypassed))
	{
		level.starttime = level.starttime - game.roundmillisecondsalreadypassed;
		game.roundmillisecondsalreadypassed = undefined;
	}
	prevtime = gettime();
	while(game.state == "playing")
	{
		if(!level.timerstopped)
		{
			game.timepassed = game.timepassed + (gettime() - prevtime);
		}
		prevtime = gettime();
		wait(1);
	}
}

/*
	Name: gettimepassed
	Namespace: globallogic_utils
	Checksum: 0xE88906A9
	Offset: 0x7F0
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function gettimepassed()
{
	if(!isdefined(level.starttime))
	{
		return 0;
	}
	if(level.timerstopped)
	{
		return (level.timerpausetime - level.starttime) - level.discardtime;
	}
	return (gettime() - level.starttime) - level.discardtime;
}

/*
	Name: pausetimer
	Namespace: globallogic_utils
	Checksum: 0xB17D87DF
	Offset: 0x860
	Size: 0x30
	Parameters: 0
	Flags: None
*/
function pausetimer()
{
	if(level.timerstopped)
	{
		return;
	}
	level.timerstopped = 1;
	level.timerpausetime = gettime();
}

/*
	Name: resumetimer
	Namespace: globallogic_utils
	Checksum: 0x1CDB4F6E
	Offset: 0x898
	Size: 0x44
	Parameters: 0
	Flags: None
*/
function resumetimer()
{
	if(!level.timerstopped)
	{
		return;
	}
	level.timerstopped = 0;
	level.discardtime = level.discardtime + (gettime() - level.timerpausetime);
}

/*
	Name: getscoreremaining
	Namespace: globallogic_utils
	Checksum: 0xF88DAF1E
	Offset: 0x8E8
	Size: 0x9C
	Parameters: 1
	Flags: Linked
*/
function getscoreremaining(team)
{
	/#
		assert(isplayer(self) || isdefined(team));
	#/
	scorelimit = level.scorelimit;
	if(isplayer(self))
	{
		return scorelimit - globallogic_score::_getplayerscore(self);
	}
	return scorelimit - getteamscore(team);
}

/*
	Name: getscoreperminute
	Namespace: globallogic_utils
	Checksum: 0xCA6985F5
	Offset: 0x990
	Size: 0xE8
	Parameters: 1
	Flags: Linked
*/
function getscoreperminute(team)
{
	/#
		assert(isplayer(self) || isdefined(team));
	#/
	scorelimit = level.scorelimit;
	timelimit = level.timelimit;
	minutespassed = (gettimepassed() / 60000) + 0.0001;
	if(isplayer(self))
	{
		return globallogic_score::_getplayerscore(self) / minutespassed;
	}
	return getteamscore(team) / minutespassed;
}

/*
	Name: getestimatedtimeuntilscorelimit
	Namespace: globallogic_utils
	Checksum: 0x71EB87C5
	Offset: 0xA88
	Size: 0x96
	Parameters: 1
	Flags: Linked
*/
function getestimatedtimeuntilscorelimit(team)
{
	/#
		assert(isplayer(self) || isdefined(team));
	#/
	scoreperminute = self getscoreperminute(team);
	scoreremaining = self getscoreremaining(team);
	if(!scoreperminute)
	{
		return 999999;
	}
	return scoreremaining / scoreperminute;
}

/*
	Name: rumbler
	Namespace: globallogic_utils
	Checksum: 0xCE66739B
	Offset: 0xB28
	Size: 0x48
	Parameters: 0
	Flags: None
*/
function rumbler()
{
	self endon(#"disconnect");
	while(true)
	{
		wait(0.1);
		self playrumbleonentity("damage_heavy");
	}
}

/*
	Name: waitfortimeornotify
	Namespace: globallogic_utils
	Checksum: 0x4722DE7A
	Offset: 0xB78
	Size: 0x24
	Parameters: 2
	Flags: Linked
*/
function waitfortimeornotify(time, notifyname)
{
	self endon(notifyname);
	wait(time);
}

/*
	Name: waitfortimeornotifynoartillery
	Namespace: globallogic_utils
	Checksum: 0xB26A4202
	Offset: 0xBA8
	Size: 0x60
	Parameters: 2
	Flags: None
*/
function waitfortimeornotifynoartillery(time, notifyname)
{
	self endon(notifyname);
	wait(time);
	while(isdefined(level.artilleryinprogress))
	{
		/#
			assert(level.artilleryinprogress);
		#/
		wait(0.25);
	}
}

/*
	Name: gethitlocheight
	Namespace: globallogic_utils
	Checksum: 0xC521CA61
	Offset: 0xC10
	Size: 0x166
	Parameters: 1
	Flags: None
*/
function gethitlocheight(shitloc)
{
	switch(shitloc)
	{
		case "head":
		case "helmet":
		case "neck":
		{
			return 60;
		}
		case "left_arm_lower":
		case "left_arm_upper":
		case "torso_upper":
		case "right_arm_lower":
		case "left_hand":
		case "right_arm_upper":
		case "gun":
		case "right_hand":
		{
			return 48;
		}
		case "torso_lower":
		{
			return 40;
		}
		case "right_leg_upper":
		case "left_leg_upper":
		{
			return 32;
		}
		case "left_leg_lower":
		case "right_leg_lower":
		{
			return 10;
		}
		case "left_foot":
		case "right_foot":
		{
			return 5;
		}
	}
	return 48;
}

/*
	Name: debugline
	Namespace: globallogic_utils
	Checksum: 0xB66AD44C
	Offset: 0xD80
	Size: 0x5A
	Parameters: 2
	Flags: None
*/
function debugline(start, end)
{
	/#
		for(i = 0; i < 50; i++)
		{
			line(start, end);
			waitframe(1);
		}
	#/
}

/*
	Name: logteamwinstring
	Namespace: globallogic_utils
	Checksum: 0x21DA9363
	Offset: 0xDE8
	Size: 0x10C
	Parameters: 2
	Flags: Linked
*/
function logteamwinstring(wintype, winner)
{
	/#
		log_string = wintype;
		if(isdefined(winner))
		{
			log_string = (log_string + "") + winner;
		}
		foreach(team, str_team in level.teams)
		{
			log_string = (((log_string + "") + str_team) + "") + game.stat[#"teamscores"][team];
		}
		print(log_string);
	#/
}

