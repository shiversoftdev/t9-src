#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\rank_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\battlechatter.gsc;

#namespace rank;

/*
	Name: __init__system__
	Namespace: rank
	Checksum: 0xA2825805
	Offset: 0xE8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"rank", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: rank
	Checksum: 0xFF132253
	Offset: 0x130
	Size: 0x24
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	callback::on_start_gametype(&init);
}

/*
	Name: init
	Namespace: rank
	Checksum: 0xFC5519CD
	Offset: 0x160
	Size: 0x1C4
	Parameters: 0
	Flags: Linked
*/
function init()
{
	level.scoreinfo = [];
	level.usingmomentum = 1;
	level.usingscorestreaks = getdvarint(#"scr_scorestreaks", 0) != 0;
	level.scorestreaksmaxstacking = 1000;
	level.maxinventoryscorestreaks = getdvarint(#"scr_maxinventory_scorestreaks", 3);
	level.usingrampage = !isdefined(level.usingscorestreaks) || !level.usingscorestreaks;
	level.rampagebonusscale = getdvarfloat(#"scr_rampagebonusscale", 0);
	if(sessionmodeiscampaigngame())
	{
		level.xpscale = getdvarfloat(#"scr_xpscalecp", 0);
	}
	else
	{
		if(sessionmodeiszombiesgame())
		{
			level.xpscale = getdvarfloat(#"scr_xpscalezm", 0);
		}
		else
		{
			level.xpscale = getdvarfloat(#"scr_xpscalemp", 0);
		}
	}
	initscoreinfo();
	callback::on_connect(&on_player_connect);
}

/*
	Name: initscoreinfo
	Namespace: rank
	Checksum: 0xC8E8FA63
	Offset: 0x330
	Size: 0x524
	Parameters: 0
	Flags: Linked
*/
function initscoreinfo()
{
	scoreinfotablename = scoreevents::getscoreeventtablename(level.gametype);
	rowcount = tablelookuprowcount(scoreinfotablename);
	if(sessionmodeismultiplayergame() && rowcount === 0)
	{
		scoreinfotablename = #"hash_44588d37c7fe1bf3" + "_base.csv";
		rowcount = tablelookuprowcount(scoreinfotablename);
	}
	for(row = 0; row < rowcount; row++)
	{
		type = tablelookupcolumnforrow(scoreinfotablename, row, 0);
		if(isdefined(type) && type != "")
		{
			labelstring = tablelookupcolumnforrow(scoreinfotablename, row, 9);
			label = undefined;
			if(labelstring != "")
			{
				label = tablelookup(scoreinfotablename, 0, type, 9);
			}
			lp = int(tablelookupcolumnforrow(scoreinfotablename, row, 1));
			xp = int(tablelookupcolumnforrow(scoreinfotablename, row, 2));
			sp = int(tablelookupcolumnforrow(scoreinfotablename, row, 3));
			hs = int(tablelookupcolumnforrow(scoreinfotablename, row, 4));
			res = float(tablelookupcolumnforrow(scoreinfotablename, row, 5));
			dp = int(tablelookupcolumnforrow(scoreinfotablename, row, 7));
			is_objective = tablelookupcolumnforrow(scoreinfotablename, row, 8);
			medalname = tablelookupcolumnforrow(scoreinfotablename, row, 11);
			var_b6cc2245 = tablelookupcolumnforrow(scoreinfotablename, row, 12);
			is_deprecated = tablelookupcolumnforrow(scoreinfotablename, row, 21);
			bounty_reward = tablelookupcolumnforrow(scoreinfotablename, row, 22);
			var_65181181 = int((isdefined(tablelookupcolumnforrow(scoreinfotablename, row, 24)) ? tablelookupcolumnforrow(scoreinfotablename, row, 24) : 0));
			registerscoreinfo(type, row, lp, xp, sp, hs, res, dp, is_objective, label, medalname, var_b6cc2245, is_deprecated, bounty_reward, var_65181181);
			if(!isdefined(game.scoreinfoinitialized))
			{
				setddlstat = var_b6cc2245;
				addplayerstat = 0;
				if(setddlstat)
				{
					addplayerstat = 1;
				}
				ismedal = 0;
				var_9750677a = tablelookup(scoreinfotablename, 0, type, 10);
				var_9f6af7ed = tablelookup(scoreinfotablename, 0, type, 11);
				if(isdefined(var_9750677a) && var_9750677a != #"" && (isdefined(var_9f6af7ed) && var_9f6af7ed != #""))
				{
					ismedal = 1;
				}
				registerxp(type, xp, addplayerstat, ismedal, dp, row, var_65181181);
			}
		}
	}
	game.scoreinfoinitialized = 1;
}

/*
	Name: registerscoreinfo
	Namespace: rank
	Checksum: 0x1044E91D
	Offset: 0x860
	Size: 0x602
	Parameters: 15
	Flags: Linked
*/
function registerscoreinfo(type, row, lp, xp, sp, hs, res, dp, is_obj, label, medalname, var_b6cc2245, is_deprecated, bounty_reward, var_65181181)
{
	overridedvar = (("scr_" + level.gametype) + "_score_") + type;
	if(getdvarstring(overridedvar) != "")
	{
		value = getdvarint(overridedvar, 0);
	}
	if(!sessionmodeismultiplayergame() || type == #"ekia")
	{
		if(is_true(xp))
		{
			level.scoreinfo[type][#"xp"] = xp;
		}
	}
	if(is_true(sp))
	{
		level.scoreinfo[type][#"sp"] = sp;
	}
	if(isdefined(medalname) && medalname != #"")
	{
		level.scoreinfo[type][#"medalnamehash"] = medalname;
	}
	if(is_true(var_b6cc2245))
	{
		level.scoreinfo[type][#"hash_2ecf46b14fe1efc9"] = var_b6cc2245;
	}
	if(sessionmodeismultiplayergame() || sessionmodeiswarzonegame())
	{
		level.scoreinfo[type][#"row"] = row;
		if(is_true(lp))
		{
			level.scoreinfo[type][#"lp"] = lp;
		}
		if(is_true(hs))
		{
			level.scoreinfo[type][#"hs"] = hs;
		}
		if(is_true(res))
		{
			level.scoreinfo[type][#"res"] = res;
		}
		if(is_true(dp))
		{
			level.scoreinfo[type][#"dp"] = dp;
		}
		if(is_true(is_obj))
		{
			level.scoreinfo[type][#"isobj"] = is_obj;
		}
		if(isdefined(medalname))
		{
			if(type == "kill" || type == "ekia")
			{
				multiplier = getgametypesetting(#"killeventscoremultiplier");
				if(multiplier > 0)
				{
					if(is_true(level.scoreinfo[type][#"sp"]))
					{
						level.scoreinfo[type][#"sp"] = int(multiplier * level.scoreinfo[type][#"sp"]);
					}
				}
			}
		}
		if(isdefined(label))
		{
			level.scoreinfo[type][#"label"] = label;
		}
		if(is_true(is_deprecated))
		{
			level.scoreinfo[type][#"is_deprecated"] = is_deprecated;
		}
		if(is_true(bounty_reward))
		{
			level.scoreinfo[type][#"bounty_reward"] = bounty_reward;
		}
		if(is_true(var_65181181))
		{
			level.scoreinfo[type][#"hash_691aeaca4a1866e3"] = var_65181181;
		}
	}
	else
	{
		if(sessionmodeiscampaigngame())
		{
			if(is_true(res))
			{
				level.scoreinfo[type][#"res"] = res;
			}
		}
		else if(sessionmodeiszombiesgame())
		{
			if(is_true(res))
			{
				level.scoreinfo[type][#"res"] = res;
			}
			if(isdefined(label))
			{
				level.scoreinfo[type][#"label"] = label;
			}
		}
	}
}

/*
	Name: getscoreinfovalue
	Namespace: rank
	Checksum: 0xC63A08B0
	Offset: 0xE70
	Size: 0x11E
	Parameters: 1
	Flags: Linked
*/
function getscoreinfovalue(type)
{
	playerrole = getrole();
	if(isdefined(level.scoreinfo[type]))
	{
		n_score = (isdefined(level.scoreinfo[type][#"sp"]) ? level.scoreinfo[type][#"sp"] : 0);
		if(isdefined(level.scoremodifiercallback) && isdefined(n_score))
		{
			n_score = [[level.scoremodifiercallback]](type, n_score);
		}
		/#
			var_1eb7c454 = getdvarfloat(#"hash_eae9a8ee387705d", 1);
			n_score = int(n_score * var_1eb7c454);
		#/
		return n_score;
	}
	return 0;
}

/*
	Name: function_4587103
	Namespace: rank
	Checksum: 0xFD3CB12E
	Offset: 0xF98
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function function_4587103(type)
{
	return int(0);
}

/*
	Name: getrole
	Namespace: rank
	Checksum: 0xFB2B69B7
	Offset: 0xFC8
	Size: 0xA
	Parameters: 0
	Flags: Linked
*/
function getrole()
{
	return "prc_mp_slayer";
}

/*
	Name: getscoreinfoposition
	Namespace: rank
	Checksum: 0xAAEC8883
	Offset: 0xFE0
	Size: 0xCE
	Parameters: 1
	Flags: None
*/
function getscoreinfoposition(type)
{
	playerrole = getrole();
	if(isdefined(level.scoreinfo[type]))
	{
		n_pos = (isdefined(level.scoreinfo[type][#"hash_7c1f7c7897445706"]) ? level.scoreinfo[type][#"hash_7c1f7c7897445706"] : 0);
		if(isdefined(level.scoremodifiercallback) && isdefined(n_pos))
		{
			n_resource = [[level.scoremodifiercallback]](type, n_pos);
		}
		return n_pos;
	}
	return 0;
}

/*
	Name: getscoreinforesource
	Namespace: rank
	Checksum: 0x7C0793E
	Offset: 0x10B8
	Size: 0xC6
	Parameters: 1
	Flags: None
*/
function getscoreinforesource(type)
{
	playerrole = getrole();
	if(isdefined(level.scoreinfo[type]))
	{
		n_resource = (isdefined(level.scoreinfo[type][#"res"]) ? level.scoreinfo[type][#"res"] : 0);
		if(isdefined(level.resourcemodifiercallback) && isdefined(n_resource))
		{
			n_resource = [[level.resourcemodifiercallback]](type, n_resource);
		}
		return n_resource;
	}
	return 0;
}

/*
	Name: getscoreinfoxp
	Namespace: rank
	Checksum: 0x198FF577
	Offset: 0x1188
	Size: 0xC6
	Parameters: 1
	Flags: Linked
*/
function getscoreinfoxp(type)
{
	playerrole = getrole();
	if(isdefined(level.scoreinfo[type]))
	{
		n_xp = (isdefined(level.scoreinfo[type][#"xp"]) ? level.scoreinfo[type][#"xp"] : 0);
		if(isdefined(level.xpmodifiercallback) && isdefined(n_xp))
		{
			n_xp = [[level.xpmodifiercallback]](type, n_xp);
		}
		return n_xp;
	}
	return 0;
}

/*
	Name: shouldskipmomentumdisplay
	Namespace: rank
	Checksum: 0x6BBE699
	Offset: 0x1258
	Size: 0x2E
	Parameters: 1
	Flags: None
*/
function shouldskipmomentumdisplay(type)
{
	if(is_true(level.disablemomentum))
	{
		return true;
	}
	return false;
}

/*
	Name: getscoreinfolabel
	Namespace: rank
	Checksum: 0x26873E66
	Offset: 0x1290
	Size: 0x2A
	Parameters: 1
	Flags: Linked
*/
function getscoreinfolabel(type)
{
	return level.scoreinfo[type][#"label"];
}

/*
	Name: getcombatefficiencyevent
	Namespace: rank
	Checksum: 0xB7E51C04
	Offset: 0x12C8
	Size: 0x2A
	Parameters: 1
	Flags: None
*/
function getcombatefficiencyevent(type)
{
	return level.scoreinfo[type][#"combat_efficiency_event"];
}

/*
	Name: function_f7b5d9fa
	Namespace: rank
	Checksum: 0xC67E099B
	Offset: 0x1300
	Size: 0x84
	Parameters: 1
	Flags: None
*/
function function_f7b5d9fa(type)
{
	playerrole = getrole();
	if(isdefined(level.scoreinfo[type]))
	{
		return true;
	}
	return false;
}

/*
	Name: shouldkickbyrank
	Namespace: rank
	Checksum: 0xA7B9888A
	Offset: 0x1390
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function shouldkickbyrank()
{
	if(self ishost())
	{
		return false;
	}
	return false;
}

/*
	Name: getarenapointsstat
	Namespace: rank
	Checksum: 0x3FC5C656
	Offset: 0x13C0
	Size: 0x70
	Parameters: 0
	Flags: Linked
*/
function getarenapointsstat()
{
	arenaslot = arenagetslot();
	arenapoints = self stats::get_stat(#"arenastats", arenaslot, #"hash_ca4c97bc6c2963b", #"points");
	return arenapoints + 1;
}

/*
	Name: getrankxp
	Namespace: rank
	Checksum: 0x84248564
	Offset: 0x1438
	Size: 0x7C
	Parameters: 0
	Flags: Linked
*/
function getrankxp()
{
	/#
		assert(isplayer(self));
	#/
	if(isplayer(self))
	{
		xp = self function_2f2051c9();
		if(!isdefined(xp))
		{
			xp = 0;
		}
		return xp;
	}
	return 0;
}

/*
	Name: function_5b197def
	Namespace: rank
	Checksum: 0x370546CD
	Offset: 0x14C0
	Size: 0x84
	Parameters: 1
	Flags: Linked
*/
function function_5b197def(var_9169ac47)
{
	/#
		assert(isplayer(self));
	#/
	if(isplayer(self))
	{
		xp = self function_2f2051c9(var_9169ac47);
		if(!isdefined(xp))
		{
			xp = 0;
		}
		return xp;
	}
	return 0;
}

/*
	Name: getrank
	Namespace: rank
	Checksum: 0x7C48B5C9
	Offset: 0x1550
	Size: 0x6E
	Parameters: 0
	Flags: Linked
*/
function getrank()
{
	/#
		assert(isplayer(self));
	#/
	if(isplayer(self))
	{
		return getrankforxp(getrankxp());
	}
	return 0;
}

/*
	Name: function_f2363c2d
	Namespace: rank
	Checksum: 0x417C46F4
	Offset: 0x15C8
	Size: 0x6E
	Parameters: 0
	Flags: Linked
*/
function function_f2363c2d()
{
	/#
		assert(isplayer(self));
	#/
	if(isplayer(self))
	{
		return function_a470b201(getrankxp());
	}
	return 0;
}

/*
	Name: on_player_connect
	Namespace: rank
	Checksum: 0xA204676A
	Offset: 0x1640
	Size: 0x5DC
	Parameters: 0
	Flags: Linked
*/
function on_player_connect()
{
	if(!isdefined(self.pers[#"participation"]))
	{
		self.pers[#"participation"] = 0;
	}
	if(!isdefined(self.pers[#"controllerparticipation"]))
	{
		self.pers[#"controllerparticipation"] = 0;
	}
	if(!isdefined(self.pers[#"controllerparticipationchecks"]))
	{
		self.pers[#"controllerparticipationchecks"] = 0;
	}
	if(!isdefined(self.pers[#"controllerparticipationchecksskipped"]))
	{
		self.pers[#"controllerparticipationchecksskipped"] = 0;
	}
	if(!isdefined(self.pers[#"controllerparticipationconsecutivesuccessmax"]))
	{
		self.pers[#"controllerparticipationconsecutivesuccessmax"] = 0;
	}
	if(!isdefined(self.pers[#"controllerparticipationconsecutivefailuremax"]))
	{
		self.pers[#"controllerparticipationconsecutivefailuremax"] = 0;
	}
	if(!isdefined(self.pers[#"hash_3b7fc8c62a7d4420"]))
	{
		self.pers[#"hash_3b7fc8c62a7d4420"] = 0;
	}
	if(!isdefined(self.pers[#"hash_4a01db5796cf12b1"]))
	{
		self.pers[#"hash_4a01db5796cf12b1"] = #"none";
	}
	if(!isdefined(self.pers[#"controllerparticipationendgameresult"]))
	{
		self.pers[#"controllerparticipationendgameresult"] = -1;
	}
	if(!isdefined(self.pers[#"controllerparticipationinactivitywarnings"]))
	{
		self.pers[#"controllerparticipationinactivitywarnings"] = 0;
	}
	if(!isdefined(self.pers[#"controllerparticipationsuccessafterinactivitywarning"]))
	{
		self.pers[#"controllerparticipationsuccessafterinactivitywarning"] = 0;
	}
	if(!isdefined(self.pers[#"hash_2013e34fb3c104e9"]))
	{
		self.pers[#"hash_2013e34fb3c104e9"] = 0;
	}
	self.pers[#"rankxp"] = self getrankxp();
	self.pers[#"rank"] = getrank();
	self.cur_ranknum = self.pers[#"rank"];
	self.rankupdatetotal = 0;
	self.pers[#"plevel"] = function_f2363c2d();
	self setrank(self.pers[#"rank"], self.pers[#"plevel"]);
	self.pers[#"hash_43ad5d1b08145b1f"] = self.pers[#"rankxp"];
	if(self shouldkickbyrank())
	{
		kick(self getentitynumber());
		return;
	}
	if(!isdefined(self.pers[#"summary"]))
	{
		self.pers[#"summary"] = [];
		self.pers[#"summary"][#"xp"] = 0;
		self.pers[#"summary"][#"score"] = 0;
		self.pers[#"summary"][#"challenge"] = 0;
		self.pers[#"summary"][#"match"] = 0;
		self.pers[#"summary"][#"misc"] = 0;
	}
	if(gamemodeisarena() && !isbot(self))
	{
		arenapoints = self getarenapointsstat();
		arenapoints = int(min(arenapoints, 100));
		self.pers[#"arenapoints"] = arenapoints;
		self setarenapoints(arenapoints);
	}
	self.explosivekills[0] = 0;
}

/*
	Name: atleastoneplayeroneachteam
	Namespace: rank
	Checksum: 0x49F3F1F2
	Offset: 0x1C28
	Size: 0x90
	Parameters: 0
	Flags: None
*/
function atleastoneplayeroneachteam()
{
	foreach(team, _ in level.teams)
	{
		if(!level.playercount[team])
		{
			return false;
		}
	}
	return true;
}

/*
	Name: round_this_number
	Namespace: rank
	Checksum: 0x2458620C
	Offset: 0x1CC0
	Size: 0x32
	Parameters: 1
	Flags: None
*/
function round_this_number(value)
{
	value = int(value + 0.5);
	return value;
}

/*
	Name: updaterank
	Namespace: rank
	Checksum: 0x16603E07
	Offset: 0x1D00
	Size: 0x138
	Parameters: 0
	Flags: None
*/
function updaterank()
{
	newrankid = self getrank();
	if(newrankid == self.pers[#"rank"])
	{
		return false;
	}
	oldrank = self.pers[#"rank"];
	rankid = self.pers[#"rank"];
	self.pers[#"rank"] = newrankid;
	while(rankid <= newrankid)
	{
		rankid++;
	}
	/#
		print((((("" + oldrank) + "") + newrankid) + "") + self stats::get_stat_global(#"time_played_total"));
	#/
	self setrank(newrankid);
	return true;
}

/*
	Name: codecallback_rankup
	Namespace: rank
	Checksum: 0x7BDABF98
	Offset: 0x1E40
	Size: 0x144
	Parameters: 1
	Flags: Event
*/
event codecallback_rankup(eventstruct)
{
	self.pers[#"rank"] = eventstruct.rank;
	if(sessionmodeiswarzonegame())
	{
		self stats::function_62b271d8(#"rank", self.pers[#"rank"]);
		self stats::function_62b271d8(#"plevel", self.pers[#"plevel"]);
	}
	else
	{
		self luinotifyevent(#"rank_up", 3, eventstruct.rank, eventstruct.prestige, eventstruct.unlock_tokens_added);
		self function_8ba40d2f(#"rank_up", 3, eventstruct.rank, eventstruct.prestige, eventstruct.unlock_tokens_added);
		self thread battlechatter::function_f5b398b6();
	}
}

/*
	Name: getitemindex
	Namespace: rank
	Checksum: 0x77A39796
	Offset: 0x1F90
	Size: 0x68
	Parameters: 1
	Flags: None
*/
function getitemindex(refstring)
{
	itemindex = getitemindexfromref(refstring);
	/#
		assert(itemindex > 0, (("" + refstring) + "") + itemindex);
	#/
	return itemindex;
}

/*
	Name: endgameupdate
	Namespace: rank
	Checksum: 0xA62112E1
	Offset: 0x2000
	Size: 0x12
	Parameters: 0
	Flags: None
*/
function endgameupdate()
{
	player = self;
}

/*
	Name: getspm
	Namespace: rank
	Checksum: 0x5C512EE6
	Offset: 0x2020
	Size: 0x44
	Parameters: 0
	Flags: None
*/
function getspm()
{
	ranklevel = self getrank() + 1;
	return (3 + (ranklevel * 0.5)) * 10;
}

/*
	Name: function_bcb5e246
	Namespace: rank
	Checksum: 0xF5D843D0
	Offset: 0x2070
	Size: 0x62
	Parameters: 1
	Flags: None
*/
function function_bcb5e246(type)
{
	var_920d60e7 = 0;
	if(isdefined(level.scoreinfo[type][#"bounty_reward"]))
	{
		var_920d60e7 = level.scoreinfo[type][#"bounty_reward"];
	}
	return var_920d60e7;
}

