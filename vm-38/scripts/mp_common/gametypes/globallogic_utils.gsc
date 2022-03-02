#using script_68d2ee1489345a1d;
#using script_6c8abe14025b47c4;
#using script_7f6cd71c43c45c57;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\hostmigration_shared.gsc;
#using scripts\core_common\hud_message_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\mp_common\gametypes\globallogic_score.gsc;
#using scripts\mp_common\gametypes\hostmigration.gsc;
#using scripts\mp_common\gametypes\hud_message.gsc;
#using scripts\mp_common\gametypes\round.gsc;

#namespace globallogic_utils;

/*
	Name: function_e478e7a5
	Namespace: globallogic_utils
	Checksum: 0x8C64DAE1
	Offset: 0xD8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_e478e7a5()
{
	level notify(2094921089);
}

/*
	Name: is_winner
	Namespace: globallogic_utils
	Checksum: 0x451E158C
	Offset: 0xF8
	Size: 0xBA
	Parameters: 2
	Flags: None
*/
function is_winner(outcome, var_512330f1)
{
	if(isplayer(var_512330f1))
	{
		if(outcome.players.size && outcome.players[0] == var_512330f1)
		{
			return true;
		}
		if(isdefined(outcome.team) && outcome.team == var_512330f1.team)
		{
			return true;
		}
	}
	else if(isdefined(outcome.team) && outcome.team == var_512330f1)
	{
		return true;
	}
	return false;
}

/*
	Name: testshock
	Namespace: globallogic_utils
	Checksum: 0xD193563D
	Offset: 0x1C0
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
	Checksum: 0x61731CE2
	Offset: 0x280
	Size: 0x10E
	Parameters: 0
	Flags: Linked
*/
function timeuntilroundend()
{
	if(level.gameended)
	{
		timepassed = (float(gettime() - level.gameendtime)) / 1000;
		timeremaining = level.roundenddelay[3] - timepassed;
		if(timeremaining < 0)
		{
			return 0;
		}
		return timeremaining;
	}
	if(level.timelimit <= 0)
	{
		return undefined;
	}
	if(!isdefined(level.starttime))
	{
		return undefined;
	}
	timepassed = (float(gettimepassed() - level.starttime)) / 1000;
	timeremaining = (level.timelimit * 60) - timepassed;
	return timeremaining + level.roundenddelay[3];
}

/*
	Name: gettimeremaining
	Namespace: globallogic_utils
	Checksum: 0x3DC9A282
	Offset: 0x398
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function gettimeremaining()
{
	return (level.timelimit * (int(60 * 1000))) - gettimepassed();
}

/*
	Name: registerpostroundevent
	Namespace: globallogic_utils
	Checksum: 0xDD42A5FF
	Offset: 0x3E0
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
	Checksum: 0x5DE604A0
	Offset: 0x430
	Size: 0x56
	Parameters: 0
	Flags: Linked
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
	Checksum: 0xA13B8664
	Offset: 0x490
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
	Checksum: 0xF6F4F7E9
	Offset: 0x4E0
	Size: 0x2A8
	Parameters: 0
	Flags: None
*/
function assertproperplacement()
{
	/#
		numplayers = level.placement[#"all"].size;
		if(level.teambased)
		{
			for(i = 0; i < numplayers - 1; i++)
			{
				if(level.placement[#"all"][i].score < level.placement[#"all"][i + 1].score)
				{
					println("");
					for(j = 0; j < numplayers; j++)
					{
						player = level.placement[#"all"][j];
						println((((("" + j) + "") + player.name) + "") + player.score);
					}
					/#
						assertmsg("");
					#/
					break;
				}
			}
		}
		else
		{
			for(i = 0; i < numplayers - 1; i++)
			{
				if(level.placement[#"all"][i].pointstowin < level.placement[#"all"][i + 1].pointstowin)
				{
					println("");
					for(j = 0; j < numplayers; j++)
					{
						player = level.placement[#"all"][j];
						println((((("" + j) + "") + player.name) + "") + player.pointstowin);
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
	Checksum: 0x4CA64F7B
	Offset: 0x790
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function isvalidclass(c)
{
	return isdefined(c) && c != "";
}

/*
	Name: playtickingsound
	Namespace: globallogic_utils
	Checksum: 0xA4640BA8
	Offset: 0x7C0
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
	Checksum: 0x43B488F3
	Offset: 0x8E0
	Size: 0x1E
	Parameters: 0
	Flags: None
*/
function stoptickingsound()
{
	if(isdefined(self))
	{
		self notify(#"stop_ticking");
	}
}

/*
	Name: gametimer
	Namespace: globallogic_utils
	Checksum: 0x1A79E0DD
	Offset: 0x908
	Size: 0x11C
	Parameters: 0
	Flags: Linked
*/
function gametimer()
{
	level endon(#"game_ended");
	level.var_8a3a9ca4.roundstart = gettime();
	level.starttime = gettime();
	level.discardtime = 0;
	if(isdefined(game.roundmillisecondsalreadypassed))
	{
		level.starttime = level.starttime - game.roundmillisecondsalreadypassed;
		game.roundmillisecondsalreadypassed = undefined;
	}
	prevtime = gettime() - 1000;
	while(game.state == #"playing")
	{
		if(!level.timerstopped)
		{
			game.timepassed = game.timepassed + (gettime() - prevtime);
		}
		if(!level.playabletimerstopped)
		{
			game.playabletimepassed = game.playabletimepassed + (gettime() - prevtime);
		}
		prevtime = gettime();
		wait(1);
	}
}

/*
	Name: disableplayerroundstartdelay
	Namespace: globallogic_utils
	Checksum: 0x8BA2103
	Offset: 0xA30
	Size: 0x7C
	Parameters: 0
	Flags: Linked
*/
function disableplayerroundstartdelay()
{
	player = self;
	player endon(#"death", #"disconnect");
	if(getroundstartdelay())
	{
		wait(getroundstartdelay());
	}
	player disableroundstartdelay();
}

/*
	Name: getroundstartdelay
	Namespace: globallogic_utils
	Checksum: 0x5C0FD5E4
	Offset: 0xAB8
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function getroundstartdelay()
{
	waittime = level.roundstartexplosivedelay - (float([[level.gettimepassed]]()) / 1000);
	if(waittime > 0)
	{
		return waittime;
	}
	return 0;
}

/*
	Name: applyroundstartdelay
	Namespace: globallogic_utils
	Checksum: 0x27FD4F9A
	Offset: 0xB18
	Size: 0xA4
	Parameters: 0
	Flags: Linked
*/
function applyroundstartdelay()
{
	self endon(#"disconnect", #"joined_spectators", #"death");
	if(game.state == #"pregame")
	{
		level waittill(#"hash_313ad43b34e74e96");
	}
	else
	{
		waitframe(1);
	}
	self enableroundstartdelay();
	self thread disableplayerroundstartdelay();
}

/*
	Name: gettimepassed
	Namespace: globallogic_utils
	Checksum: 0x43F5156B
	Offset: 0xBC8
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
	Checksum: 0x5242D31
	Offset: 0xC38
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function pausetimer(pauseplayabletimer)
{
	if(!isdefined(pauseplayabletimer))
	{
		pauseplayabletimer = 0;
	}
	level.playabletimerstopped = pauseplayabletimer;
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
	Checksum: 0x15E0B91B
	Offset: 0xC98
	Size: 0x60
	Parameters: 0
	Flags: Linked
*/
function resumetimer()
{
	if(!level.timerstopped)
	{
		return;
	}
	level.timerstopped = 0;
	level.playabletimerstopped = 0;
	if(isdefined(level.discardtime))
	{
		level.discardtime = level.discardtime + (gettime() - level.timerpausetime);
	}
}

/*
	Name: resumetimerdiscardoverride
	Namespace: globallogic_utils
	Checksum: 0x5E41099E
	Offset: 0xD00
	Size: 0x44
	Parameters: 1
	Flags: None
*/
function resumetimerdiscardoverride(discardtime)
{
	if(!level.timerstopped)
	{
		return;
	}
	level.timerstopped = 0;
	level.discardtime = discardtime + level.var_9d348da1;
}

/*
	Name: getscoreremaining
	Namespace: globallogic_utils
	Checksum: 0x6E367979
	Offset: 0xD50
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function getscoreremaining(score)
{
	return level.scorelimit - score;
}

/*
	Name: function_fd90317f
	Namespace: globallogic_utils
	Checksum: 0xAFEAF995
	Offset: 0xD78
	Size: 0x50
	Parameters: 2
	Flags: Linked
*/
function function_fd90317f(user, var_b393387d)
{
	if(level.cumulativeroundscores && isdefined(game.lastroundscore[user]))
	{
		return var_b393387d - game.lastroundscore[user];
	}
	return var_b393387d;
}

/*
	Name: getscoreperminute
	Namespace: globallogic_utils
	Checksum: 0x35A26EBE
	Offset: 0xDD0
	Size: 0x56
	Parameters: 1
	Flags: Linked
*/
function getscoreperminute(var_d0266750)
{
	minutespassed = (gettimepassed() / (int(60 * 1000))) + 0.0001;
	return var_d0266750 / minutespassed;
}

/*
	Name: getestimatedtimeuntilscorelimit
	Namespace: globallogic_utils
	Checksum: 0x74CA1F1F
	Offset: 0xE30
	Size: 0x6E
	Parameters: 2
	Flags: Linked
*/
function getestimatedtimeuntilscorelimit(total_score, var_d0266750)
{
	scoreperminute = self getscoreperminute(var_d0266750);
	scoreremaining = self getscoreremaining(total_score);
	if(!scoreperminute)
	{
		return 999999;
	}
	return scoreremaining / scoreperminute;
}

/*
	Name: rumbler
	Namespace: globallogic_utils
	Checksum: 0xC2A039C2
	Offset: 0xEA8
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
	Checksum: 0xEB561703
	Offset: 0xEF8
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
	Checksum: 0xB0384710
	Offset: 0xF28
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
	Checksum: 0x599A5A41
	Offset: 0xF90
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
	Checksum: 0xD3A3B75A
	Offset: 0x1100
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
	Name: function_4aa8d809
	Namespace: globallogic_utils
	Checksum: 0xC0040D95
	Offset: 0x1168
	Size: 0x24
	Parameters: 2
	Flags: Linked
*/
function function_4aa8d809(index, string)
{
	level.var_336c35f1[index] = string;
}

/*
	Name: function_8d61a6c2
	Namespace: globallogic_utils
	Checksum: 0x826D07E3
	Offset: 0x1198
	Size: 0x23C
	Parameters: 1
	Flags: Linked
*/
function function_8d61a6c2(var_c1e98979)
{
	/#
		/#
			assert(isdefined(var_c1e98979));
		#/
		/#
			assert(isdefined(level.var_336c35f1[var_c1e98979]));
		#/
		log_string = level.var_336c35f1[var_c1e98979];
		winner = round::function_9b24638f();
		if(isplayer(winner))
		{
			print(((("" + winner getxuid()) + "") + winner.name) + "");
		}
		if(isdefined(winner))
		{
			if(isplayer(winner))
			{
				log_string = (((log_string + "") + winner getxuid() + "") + winner.name) + "";
			}
			else
			{
				log_string = (log_string + "") + winner;
			}
		}
		foreach(team, str_team in level.teams)
		{
			log_string = (((log_string + "") + str_team) + "") + game.stat[#"teamscores"][team];
		}
		print(log_string);
	#/
}

/*
	Name: add_map_error
	Namespace: globallogic_utils
	Checksum: 0xBF8EBAFC
	Offset: 0x13E0
	Size: 0x44
	Parameters: 1
	Flags: None
*/
function add_map_error(msg)
{
	if(!isdefined(level.maperrors))
	{
		level.maperrors = [];
	}
	level.maperrors[level.maperrors.size] = msg;
}

/*
	Name: print_map_errors
	Namespace: globallogic_utils
	Checksum: 0x570F0037
	Offset: 0x1430
	Size: 0xDC
	Parameters: 0
	Flags: None
*/
function print_map_errors()
{
	if(isdefined(level.maperrors) && level.maperrors.size > 0)
	{
		/#
			println("");
			for(i = 0; i < level.maperrors.size; i++)
			{
				println("" + level.maperrors[i]);
			}
			println("");
			util::error("");
		#/
		callback::abort_level();
		return true;
	}
	return false;
}

/*
	Name: function_308e3379
	Namespace: globallogic_utils
	Checksum: 0x6E8A6132
	Offset: 0x1518
	Size: 0x22
	Parameters: 0
	Flags: Linked
*/
function function_308e3379()
{
	return strendswith(level.gametype, "_bb");
}

