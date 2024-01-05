#using scripts\core_common\rank_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace persistence;

/*
	Name: __init__system__
	Namespace: persistence
	Checksum: 0x27B522A0
	Offset: 0xA0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"persistence", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: persistence
	Checksum: 0x3A3388EA
	Offset: 0xE8
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
	Namespace: persistence
	Checksum: 0x2298C4EB
	Offset: 0x118
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function init()
{
	level.persistentdatainfo = [];
	level.maxrecentstats = 10;
	level.maxhitlocations = 19;
	level thread initialize_stat_tracking();
}

/*
	Name: initialize_stat_tracking
	Namespace: persistence
	Checksum: 0xDF85AE41
	Offset: 0x168
	Size: 0x1FC
	Parameters: 0
	Flags: Linked
*/
function initialize_stat_tracking()
{
	level.globalexecutions = 0;
	level.globalchallenges = 0;
	level.globalsharepackages = 0;
	level.globalcontractsfailed = 0;
	level.globalcontractspassed = 0;
	level.globalcontractscppaid = 0;
	level.globalkillstreakscalled = 0;
	level.globalkillstreaksdestroyed = 0;
	level.globalkillstreaksdeathsfrom = 0;
	level.globallarryskilled = 0;
	level.globalbuzzkills = 0;
	level.globalrevives = 0;
	level.globalafterlifes = 0;
	level.globalcomebacks = 0;
	level.globalpaybacks = 0;
	level.globalbackstabs = 0;
	level.globalbankshots = 0;
	level.globalskewered = 0;
	level.globalteammedals = 0;
	level.globalfeetfallen = 0;
	level.globaldistancesprinted = 0;
	level.globaldembombsprotected = 0;
	level.globaldembombsdestroyed = 0;
	level.globalbombsdestroyed = 0;
	level.globalfraggrenadesfired = 0;
	level.globalsatchelchargefired = 0;
	level.globalshotsfired = 0;
	level.globalcrossbowfired = 0;
	level.globalcarsdestroyed = 0;
	level.globalbarrelsdestroyed = 0;
	level.globalbombsdestroyedbyteam = [];
	foreach(team, _ in level.teams)
	{
		level.globalbombsdestroyedbyteam[team] = 0;
	}
}

/*
	Name: adjust_recent_stats
	Namespace: persistence
	Checksum: 0x65E6B6C2
	Offset: 0x370
	Size: 0x74
	Parameters: 0
	Flags: Linked
*/
function adjust_recent_stats()
{
	/#
		if(getdvarint(#"scr_writeconfigstrings", 0) == 1 || getdvarint(#"scr_hostmigrationtest", 0) == 1)
		{
			return;
		}
	#/
	initialize_match_stats();
}

/*
	Name: function_acac764e
	Namespace: persistence
	Checksum: 0x925CEFEE
	Offset: 0x3F0
	Size: 0xDC
	Parameters: 0
	Flags: Linked
*/
function function_acac764e()
{
	index = self stats::get_stat(#"playerstatsbygametype", level.var_12323003, #"prevscoreindex");
	if(!isdefined(index))
	{
		return;
	}
	if(index < 0 || index > 9)
	{
		return;
	}
	newindex = (index + 1) % 10;
	self.pers[#"hash_76fbbcf94dab5536"] = newindex;
	self stats::set_stat(#"playerstatsbygametype", level.var_12323003, #"prevscoreindex", newindex);
}

/*
	Name: get_recent_stat
	Namespace: persistence
	Checksum: 0x4D8DE970
	Offset: 0x4D8
	Size: 0xBA
	Parameters: 3
	Flags: Linked
*/
function get_recent_stat(isglobal, index, statname)
{
	if(!isdefined(index))
	{
		return;
	}
	if(isglobal)
	{
		modename = level.var_12323003;
		return self stats::get_stat(#"gamehistory", modename, #"matchhistory", index, statname);
	}
	return self stats::get_stat(#"playerstatsbygametype", level.var_12323003, #"prevscores", index, statname);
}

/*
	Name: set_recent_stat
	Namespace: persistence
	Checksum: 0x285E3DEB
	Offset: 0x5A0
	Size: 0x15C
	Parameters: 4
	Flags: Linked
*/
function set_recent_stat(isglobal, index, statname, value)
{
	if(!isglobal)
	{
		index = self stats::get_stat(#"playerstatsbygametype", level.var_12323003, #"prevscoreindex");
		if(!isdefined(index))
		{
			return;
		}
		if(index < 0 || index > 9)
		{
			return;
		}
	}
	if(isdefined(level.nopersistence) && level.nopersistence)
	{
		return;
	}
	if(!isdefined(index))
	{
		return;
	}
	if(isglobal)
	{
		modename = level.var_12323003;
		self stats::set_stat(#"gamehistory", modename, #"matchhistory", "" + index, statname, value);
	}
	else
	{
		self stats::set_stat(#"playerstatsbygametype", level.var_12323003, #"prevscores", index, statname, value);
	}
}

/*
	Name: add_recent_stat
	Namespace: persistence
	Checksum: 0x77AF1D0A
	Offset: 0x708
	Size: 0x10C
	Parameters: 4
	Flags: Linked
*/
function add_recent_stat(isglobal, index, statname, value)
{
	if(isdefined(level.nopersistence) && level.nopersistence)
	{
		return;
	}
	if(!isglobal)
	{
		index = self stats::get_stat(#"playerstatsbygametype", level.var_12323003, #"prevscoreindex");
		if(!isdefined(index))
		{
			return;
		}
		if(index < 0 || index > 9)
		{
			return;
		}
	}
	if(!isdefined(index))
	{
		return;
	}
	currstat = get_recent_stat(isglobal, index, statname);
	if(isdefined(currstat))
	{
		set_recent_stat(isglobal, index, statname, currstat + value);
	}
}

/*
	Name: set_match_history_stat
	Namespace: persistence
	Checksum: 0xD62E8331
	Offset: 0x820
	Size: 0x84
	Parameters: 2
	Flags: None
*/
function set_match_history_stat(statname, value)
{
	modename = level.var_12323003;
	historyindex = self stats::get_stat(#"gamehistory", modename, #"currentmatchhistoryindex");
	set_recent_stat(1, historyindex, statname, value);
}

/*
	Name: add_match_history_stat
	Namespace: persistence
	Checksum: 0x94AA490C
	Offset: 0x8B0
	Size: 0x84
	Parameters: 2
	Flags: None
*/
function add_match_history_stat(statname, value)
{
	modename = level.var_12323003;
	historyindex = self stats::get_stat(#"gamehistory", modename, #"currentmatchhistoryindex");
	add_recent_stat(1, historyindex, statname, value);
}

/*
	Name: initialize_match_stats
	Namespace: persistence
	Checksum: 0x2CB20975
	Offset: 0x940
	Size: 0x1E4
	Parameters: 0
	Flags: Linked
*/
function initialize_match_stats()
{
	self endon(#"disconnect");
	if(isdefined(level.nopersistence) && level.nopersistence)
	{
		return;
	}
	if(!level.onlinegame)
	{
		return;
	}
	if(!(level.rankedmatch || level.leaguematch))
	{
		return;
	}
	if(sessionmodeiswarzonegame() || sessionmodeismultiplayergame())
	{
		self stats::function_bb7eedf0(#"total_games_played", 1);
		if(is_true(level.hardcoremode))
		{
			hc_games_played = self stats::get_stat(#"playerstatslist", #"hc_games_played", #"statvalue") + 1;
			self stats::set_stat(#"playerstatslist", #"hc_games_played", #"statvalue", hc_games_played);
		}
	}
	if(isdefined(level.var_12323003))
	{
		self gamehistorystartmatch(level.var_12323003);
	}
	else
	{
		level.var_12323003 = level.gametype;
		self gamehistorystartmatch(getgametypeenumfromname(level.gametype, level.hardcoremode));
	}
}

/*
	Name: codecallback_challengecomplete
	Namespace: persistence
	Checksum: 0x1926552F
	Offset: 0xB30
	Size: 0x8C
	Parameters: 1
	Flags: Event
*/
event codecallback_challengecomplete(eventstruct)
{
	if(sessionmodeiscampaigngame())
	{
		if(isdefined(self.challenge_callback_cp))
		{
			[[self.challenge_callback_cp]](eventstruct.reward, eventstruct.max, eventstruct.row, eventstruct.table_number, eventstruct.challenge_type, eventstruct.item_index, eventstruct.challenge_index);
		}
		return;
	}
	self thread challenge_complete(eventstruct);
}

/*
	Name: function_6020a116
	Namespace: persistence
	Checksum: 0xC711D57C
	Offset: 0xBC8
	Size: 0x78
	Parameters: 0
	Flags: Linked
*/
function function_6020a116()
{
	if(!isdefined(level.var_697b1d55))
	{
		level.var_697b1d55 = 0;
	}
	if(!isdefined(level.var_445b1bca))
	{
		level.var_445b1bca = 0;
	}
	while(level.var_697b1d55 == gettime() || level.var_445b1bca == gettime())
	{
		waitframe(1);
	}
	level.var_697b1d55 = gettime();
}

/*
	Name: challenge_complete
	Namespace: persistence
	Checksum: 0x1BB2C9D4
	Offset: 0xC48
	Size: 0x7C4
	Parameters: 1
	Flags: Linked
*/
function challenge_complete(eventstruct)
{
	self endon(#"disconnect");
	function_6020a116();
	callback::callback(#"on_challenge_complete", eventstruct);
	rewardxp = eventstruct.reward;
	maxval = eventstruct.max;
	row = eventstruct.row;
	tablenumber = eventstruct.table_number;
	challengetype = eventstruct.challenge_type;
	itemindex = eventstruct.item_index;
	challengeindex = eventstruct.challenge_index;
	var_c4e9517b = tablenumber + 1;
	if(currentsessionmode() == 0)
	{
		tablename = ((#"gamedata/stats/zm/statsmilestones") + var_c4e9517b) + ".csv";
		if(var_c4e9517b == 2)
		{
			var_a05af556 = tablelookupcolumnforrow(tablename, row, 9);
			if(var_a05af556 === #"")
			{
				return;
			}
			if(getdvarint(#"hash_730fab929626f598", 0) == 0)
			{
				if(var_a05af556 === #"camo_gold" || var_a05af556 === #"camo_diamond" || var_a05af556 === #"camo_darkmatter")
				{
					return;
				}
			}
		}
	}
	else
	{
		tablename = ((#"gamedata/stats/mp/statsmilestones") + var_c4e9517b) + ".csv";
	}
	var_eb67c133 = tablelookupcolumnforrow(tablename, row, 5);
	if(isdefined(var_eb67c133) && (var_eb67c133 == #"hash_5a619f94abe000b" || var_eb67c133 == #"hash_4a80d584aac2e7d0"))
	{
		return;
	}
	/#
		var_54b50d64 = getdvarstring(#"hash_5f6f875e3935912a", "");
		if(var_54b50d64 != "")
		{
			challengecategory = tablelookupcolumnforrow(tablename, row, 16);
			if(challengecategory !== var_54b50d64)
			{
				return;
			}
		}
		var_5d5d13c3 = getdvarstring(#"hash_5941150fef84419c", "");
		if(var_5d5d13c3 != "")
		{
			challengestat = tablelookupcolumnforrow(tablename, row, 4);
			var_40fdd9a5 = (ishash(challengestat) ? function_9e72a96(challengestat) : challengestat);
			if(!issubstr(tolower(var_40fdd9a5), tolower(var_5d5d13c3)))
			{
				return;
			}
		}
	#/
	self luinotifyevent(#"challenge_complete", 7, challengeindex, itemindex, challengetype, tablenumber, row, maxval, rewardxp);
	self function_8ba40d2f(#"challenge_complete", 7, challengeindex, itemindex, challengetype, tablenumber, row, maxval, rewardxp);
	challengetier = int(tablelookupcolumnforrow(tablename, row, 1));
	matchrecordlogchallengecomplete(self, var_c4e9517b, challengetier, itemindex, var_eb67c133);
	var_c710a35a = level.var_faccd7d4[var_eb67c133];
	if(isdefined(var_c710a35a))
	{
		self [[var_c710a35a]](eventstruct);
	}
	/#
		if(getdvarint(#"hash_4cc2d974d4e9d2d6", 0) != 0)
		{
			challengestring = makelocalizedstring(var_eb67c133);
			tiertext = challengetier + 1;
			var_33b913f5 = "";
			if(challengetype == 0)
			{
				var_33b913f5 = "";
			}
			else if(challengetype == 1)
			{
				iteminfo = getunlockableiteminfofromindex(itemindex, 1);
				if(isdefined(iteminfo))
				{
					var_33b913f5 = makelocalizedstring(iteminfo.displayname);
				}
			}
			if(issubstr(challengestring, ""))
			{
				if(challengetype == 3)
				{
					challengestring = strreplace(challengestring, "", "" + function_60394171(#"challenge", 3, itemindex));
					var_33b913f5 = "";
				}
			}
			if(issubstr(challengestring, ""))
			{
				challengestring = strreplace(challengestring, "", "" + tiertext);
			}
			if(var_33b913f5 == "")
			{
				var_fb76383b = 1;
				var_fb76383b++;
			}
			msg = (((var_33b913f5 + "") + challengestring) + "") + maxval;
			if(getdvarint(#"hash_4cc2d974d4e9d2d6", 0) == 1)
			{
				iprintlnbold(msg);
			}
			else
			{
				if(getdvarint(#"hash_4cc2d974d4e9d2d6", 0) == 2)
				{
					self iprintlnbold(msg);
				}
				else if(getdvarint(#"hash_4cc2d974d4e9d2d6", 0) == 3)
				{
					iprintln(msg);
				}
			}
			println(msg);
		}
	#/
}

/*
	Name: codecallback_gunchallengecomplete
	Namespace: persistence
	Checksum: 0x991693A3
	Offset: 0x1418
	Size: 0x17C
	Parameters: 1
	Flags: Event
*/
event codecallback_gunchallengecomplete(eventstruct)
{
	rewardxp = eventstruct.reward;
	attachmentindex = eventstruct.attachment_index;
	itemindex = eventstruct.item_index;
	rankid = eventstruct.rank_id;
	islastrank = eventstruct.is_lastrank;
	if(sessionmodeiscampaigngame())
	{
		self notify(#"gun_level_complete", {#is_last_rank:islastrank, #rank:rankid, #item_index:itemindex, #attachment_index:attachmentindex, #reward_xp:rewardxp});
		return;
	}
	if(islastrank)
	{
		self thread challenges::dochallengecallback(#"gun_level_complete_last_rank", eventstruct);
	}
	self luinotifyevent(#"gun_level_complete", 5, rankid, itemindex, attachmentindex, rewardxp, islastrank);
	self function_8ba40d2f(#"gun_level_complete", 5, rankid, itemindex, attachmentindex, rewardxp, islastrank);
}

/*
	Name: upload_stats_soon
	Namespace: persistence
	Checksum: 0x5BD6D95B
	Offset: 0x15A0
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function upload_stats_soon()
{
	self notify(#"upload_stats_soon");
	self endon(#"upload_stats_soon", #"disconnect");
	wait(1);
	uploadstats(self);
}

