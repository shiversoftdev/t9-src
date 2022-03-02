#using script_7f6cd71c43c45c57;
#using scripts\core_common\hud_message_shared.gsc;
#using scripts\core_common\weapons_shared.gsc;

#namespace globallogic_utils;

/*
	Name: testshock
	Namespace: globallogic_utils
	Checksum: 0x3E8516E1
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
	Checksum: 0x190901AC
	Offset: 0x180
	Size: 0xF8
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
	timepassed = (float(gettimepassed() - level.starttime)) / 1000;
	timeremaining = (level.timelimit * 60) - timepassed;
	return timeremaining + level.postroundtime;
}

/*
	Name: gettimeremaining
	Namespace: globallogic_utils
	Checksum: 0x2BD6D9DD
	Offset: 0x280
	Size: 0x44
	Parameters: 0
	Flags: None
*/
function gettimeremaining()
{
	if(level.timelimit == 0)
	{
		return undefined;
	}
	return ((level.timelimit * 60) * 1000) - gettimepassed();
}

/*
	Name: registerpostroundevent
	Namespace: globallogic_utils
	Checksum: 0xE886398F
	Offset: 0x2D0
	Size: 0x44
	Parameters: 1
	Flags: None
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
	Checksum: 0x310CBA23
	Offset: 0x320
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
	Checksum: 0xB65CD834
	Offset: 0x380
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
	Checksum: 0xE1A4EAE
	Offset: 0x3D0
	Size: 0x2A0
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
		else
		{
			for(i = 0; i < numplayers - 1; i++)
			{
				if(level.placement[#"all"][i].pointstowin < level.placement[#"all"][i + 1].pointstowin)
				{
					println("");
					for(i = 0; i < numplayers; i++)
					{
						player = level.placement[#"all"][i];
						println((((("" + i) + "") + player.name) + "") + player.pointstowin);
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
	Checksum: 0x78A7C019
	Offset: 0x678
	Size: 0x6A
	Parameters: 1
	Flags: None
*/
function isvalidclass(c)
{
	if(level.oldschool || sessionmodeiszombiesgame())
	{
		/#
			assert(!isdefined(c));
		#/
		return 1;
	}
	return isdefined(c) && c != "";
}

/*
	Name: playtickingsound
	Namespace: globallogic_utils
	Checksum: 0xFF496B0C
	Offset: 0x6F0
	Size: 0x104
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
	}
}

/*
	Name: stoptickingsound
	Namespace: globallogic_utils
	Checksum: 0xA8AF6B10
	Offset: 0x800
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
	Checksum: 0x2F28BD55
	Offset: 0x820
	Size: 0xEC
	Parameters: 0
	Flags: None
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
	Checksum: 0x6CD596AB
	Offset: 0x918
	Size: 0x64
	Parameters: 0
	Flags: None
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
	Checksum: 0xF892A3AB
	Offset: 0x988
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
	Checksum: 0xF217CD62
	Offset: 0x9C0
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
	Checksum: 0xBCF449A
	Offset: 0xA10
	Size: 0x16
	Parameters: 1
	Flags: None
*/
function getscoreremaining(team)
{
	return level.scorelimit;
}

/*
	Name: getteamscoreforround
	Namespace: globallogic_utils
	Checksum: 0xA909007B
	Offset: 0xA30
	Size: 0xE
	Parameters: 1
	Flags: None
*/
function getteamscoreforround(team)
{
	return false;
}

/*
	Name: getscoreperminute
	Namespace: globallogic_utils
	Checksum: 0xEF088BE8
	Offset: 0xA48
	Size: 0xE
	Parameters: 1
	Flags: None
*/
function getscoreperminute(team)
{
	return false;
}

/*
	Name: getestimatedtimeuntilscorelimit
	Namespace: globallogic_utils
	Checksum: 0xC68AA094
	Offset: 0xA60
	Size: 0x96
	Parameters: 1
	Flags: None
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
	Checksum: 0xD305B09D
	Offset: 0xB00
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
	Checksum: 0xDAB81418
	Offset: 0xB50
	Size: 0x24
	Parameters: 2
	Flags: None
*/
function waitfortimeornotify(time, notifyname)
{
	self endon(notifyname);
	wait(time);
}

/*
	Name: waitfortimeornotifynoartillery
	Namespace: globallogic_utils
	Checksum: 0xB5F07144
	Offset: 0xB80
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
	Name: isheadshot
	Namespace: globallogic_utils
	Checksum: 0xF5F523A1
	Offset: 0xBE8
	Size: 0xFE
	Parameters: 4
	Flags: None
*/
function isheadshot(weapon, shitloc, smeansofdeath, einflictor)
{
	if(smeansofdeath != "head" && smeansofdeath != "helmet")
	{
		return false;
	}
	switch(einflictor)
	{
		case "mod_melee_weapon_butt":
		case "mod_melee_assassinate":
		case "mod_melee":
		{
			return false;
		}
		case "mod_impact":
		{
			baseweapon = weapons::getbaseweapon(shitloc);
			if(!shitloc.isballisticknife && baseweapon != level.weaponspecialcrossbow && baseweapon != level.var_9e188c0b)
			{
				return false;
			}
		}
	}
	return true;
}

/*
	Name: gethitlocheight
	Namespace: globallogic_utils
	Checksum: 0x2DCB9028
	Offset: 0xCF0
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
	Checksum: 0x1C0CC878
	Offset: 0xE60
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
	Checksum: 0x87FBFDBD
	Offset: 0xEC8
	Size: 0x10C
	Parameters: 2
	Flags: None
*/
function logteamwinstring(wintype, winner)
{
	log_string = wintype;
	if(isdefined(winner))
	{
		log_string = (log_string + ", win: ") + winner;
	}
	foreach(team, str_team in level.teams)
	{
		log_string = (((log_string + ", ") + str_team) + ": ") + game.stat[#"teamscores"][team];
	}
	/#
		print(log_string);
	#/
}

