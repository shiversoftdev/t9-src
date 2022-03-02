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
	Name: is_winner
	Namespace: globallogic_utils
	Checksum: 0x230ED997
	Offset: 0xD8
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
	Checksum: 0x45498907
	Offset: 0x1A0
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
	Checksum: 0xCAC7D445
	Offset: 0x260
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
	Checksum: 0x1E4E3F52
	Offset: 0x378
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
	Checksum: 0xC69B73D
	Offset: 0x3C0
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
	Checksum: 0xFFA7F96
	Offset: 0x410
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
	Checksum: 0x35049E35
	Offset: 0x470
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
	Checksum: 0x378E731D
	Offset: 0x4C0
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
	Checksum: 0x345EFF76
	Offset: 0x770
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
	Checksum: 0x593A2275
	Offset: 0x7A0
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
	Checksum: 0x8BC73EF2
	Offset: 0x8C0
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
	Checksum: 0xDA170F78
	Offset: 0x8E8
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
	Checksum: 0xC1945E4E
	Offset: 0xA10
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
	Checksum: 0xF0D49BED
	Offset: 0xA98
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
	Checksum: 0xC88B1369
	Offset: 0xAF8
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
	Checksum: 0x9C2842E9
	Offset: 0xBA8
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
	Checksum: 0xEDA87BE8
	Offset: 0xC18
	Size: 0x54
	Parameters: 1
	Flags: None
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
	Checksum: 0xC1DCDBB
	Offset: 0xC78
	Size: 0x50
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
	level.playabletimerstopped = 0;
	level.discardtime = level.discardtime + (gettime() - level.timerpausetime);
}

/*
	Name: resumetimerdiscardoverride
	Namespace: globallogic_utils
	Checksum: 0x5F1754A7
	Offset: 0xCD0
	Size: 0x38
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
	level.discardtime = discardtime;
}

/*
	Name: getscoreremaining
	Namespace: globallogic_utils
	Checksum: 0x1A8546D6
	Offset: 0xD10
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
	Checksum: 0x5E0C1C8D
	Offset: 0xD38
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
	Checksum: 0x2D474977
	Offset: 0xD90
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
	Checksum: 0x356A28E9
	Offset: 0xDF0
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
	Checksum: 0x5213A504
	Offset: 0xE68
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
	Checksum: 0xF5D4F713
	Offset: 0xEB8
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
	Checksum: 0xDA83A21C
	Offset: 0xEE8
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
	Checksum: 0x4A04D181
	Offset: 0xF50
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
	Checksum: 0xDDE7024E
	Offset: 0x10C0
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
	Checksum: 0xB0E216C4
	Offset: 0x1128
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
	Checksum: 0x34248C4D
	Offset: 0x1158
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
	Checksum: 0x153F29A7
	Offset: 0x13A0
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
	Checksum: 0xC27C8B25
	Offset: 0x13F0
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
	Checksum: 0xC8B31659
	Offset: 0x14D8
	Size: 0x22
	Parameters: 0
	Flags: Linked
*/
function function_308e3379()
{
	return strendswith(level.gametype, "_bb");
}

