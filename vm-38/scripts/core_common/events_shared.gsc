#using scripts\core_common\util_shared.gsc;

#namespace namespace_ac6a9eb4;

/*
	Name: function_51314ad4
	Namespace: namespace_ac6a9eb4
	Checksum: 0x7DF73BA0
	Offset: 0x68
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_51314ad4()
{
	level notify(187607928);
}

#namespace events;

/*
	Name: add_timed_event
	Namespace: events
	Checksum: 0x7C2DA131
	Offset: 0x88
	Size: 0x6C
	Parameters: 3
	Flags: None
*/
function add_timed_event(seconds, notify_string, client_notify_string)
{
	/#
		assert(seconds >= 0);
	#/
	if(level.timelimit > 0)
	{
		level thread timed_event_monitor(seconds, notify_string, client_notify_string);
	}
}

/*
	Name: timed_event_monitor
	Namespace: events
	Checksum: 0xD8C87683
	Offset: 0x100
	Size: 0xA2
	Parameters: 3
	Flags: None
*/
function timed_event_monitor(seconds, notify_string, client_notify_string)
{
	for(;;)
	{
		wait(0.5);
		if(!isdefined(level.starttime))
		{
			continue;
		}
		millisecs_remaining = [[level.gettimeremaining]]();
		seconds_remaining = float(millisecs_remaining) / 1000;
		if(seconds_remaining <= seconds)
		{
			event_notify(notify_string, client_notify_string);
			return;
		}
	}
}

/*
	Name: add_score_event
	Namespace: events
	Checksum: 0x49A853A9
	Offset: 0x1B0
	Size: 0x94
	Parameters: 3
	Flags: None
*/
function add_score_event(score, notify_string, client_notify_string)
{
	/#
		assert(score >= 0);
	#/
	if(level.scorelimit > 0)
	{
		if(level.teambased)
		{
			level thread score_team_event_monitor(score, notify_string, client_notify_string);
		}
		else
		{
			level thread score_event_monitor(score, notify_string, client_notify_string);
		}
	}
}

/*
	Name: add_round_score_event
	Namespace: events
	Checksum: 0xF2E40375
	Offset: 0x250
	Size: 0xBC
	Parameters: 3
	Flags: None
*/
function add_round_score_event(score, notify_string, client_notify_string)
{
	/#
		assert(score >= 0);
	#/
	if(level.roundscorelimit > 0)
	{
		roundscoretobeat = (level.roundscorelimit * game.roundsplayed) + score;
		if(level.teambased)
		{
			level thread score_team_event_monitor(roundscoretobeat, notify_string, client_notify_string);
		}
		else
		{
			level thread score_event_monitor(roundscoretobeat, notify_string, client_notify_string);
		}
	}
}

/*
	Name: any_team_reach_score
	Namespace: events
	Checksum: 0xAD5BB174
	Offset: 0x318
	Size: 0xAC
	Parameters: 1
	Flags: None
*/
function any_team_reach_score(score)
{
	foreach(team, _ in level.teams)
	{
		if(game.stat[#"teamscores"][team] >= score)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: score_team_event_monitor
	Namespace: events
	Checksum: 0x5F5B184C
	Offset: 0x3D0
	Size: 0x5A
	Parameters: 3
	Flags: None
*/
function score_team_event_monitor(score, notify_string, client_notify_string)
{
	for(;;)
	{
		wait(0.5);
		if(any_team_reach_score(score))
		{
			event_notify(notify_string, client_notify_string);
			return;
		}
	}
}

/*
	Name: score_event_monitor
	Namespace: events
	Checksum: 0x220DCF59
	Offset: 0x438
	Size: 0xAA
	Parameters: 3
	Flags: None
*/
function score_event_monitor(score, notify_string, client_notify_string)
{
	for(;;)
	{
		wait(0.5);
		players = getplayers();
		for(i = 0; i < players.size; i++)
		{
			if(isdefined(players[i].score) && players[i].score >= score)
			{
				event_notify(notify_string, client_notify_string);
				return;
			}
		}
	}
}

/*
	Name: event_notify
	Namespace: events
	Checksum: 0x6E32686D
	Offset: 0x4F0
	Size: 0x44
	Parameters: 2
	Flags: None
*/
function event_notify(notify_string, client_notify_string)
{
	if(isdefined(notify_string))
	{
		level notify(notify_string);
	}
	if(isdefined(client_notify_string))
	{
		util::clientnotify(client_notify_string);
	}
}

