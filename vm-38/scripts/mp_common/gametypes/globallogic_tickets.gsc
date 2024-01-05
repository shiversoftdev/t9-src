#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace globallogic_tickets;

/*
	Name: function_98e6ab48
	Namespace: globallogic_tickets
	Checksum: 0xB8F7F4A3
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_98e6ab48()
{
	level notify(-519540818);
}

#namespace tickets;

/*
	Name: __init__
	Namespace: tickets
	Checksum: 0xB735A03
	Offset: 0x90
	Size: 0x24
	Parameters: 0
	Flags: AutoExec
*/
function autoexec __init__()
{
	callback::on_player_killed(&on_player_killed);
}

/*
	Name: reset_match_start
	Namespace: tickets
	Checksum: 0xF7DF659F
	Offset: 0xC0
	Size: 0x54
	Parameters: 1
	Flags: None
*/
function reset_match_start(total_stages)
{
	if(game.tickets_initialized === 1)
	{
		return;
	}
	reset_stages(total_stages);
	reset_tickets();
	game.tickets_initialized = 1;
}

/*
	Name: reset_stages
	Namespace: tickets
	Checksum: 0xAF0E1840
	Offset: 0x120
	Size: 0xF4
	Parameters: 1
	Flags: Linked
*/
function reset_stages(total_stages)
{
	game.stat[#"stagetickets"] = [];
	foreach(team, _ in level.teams)
	{
		game.stat[#"stagetickets"][team] = [];
		for(stage = 0; stage < total_stages; stage++)
		{
			game.stat[#"stagetickets"][team][stage] = 0;
		}
	}
}

/*
	Name: reset_tickets
	Namespace: tickets
	Checksum: 0x7967F637
	Offset: 0x220
	Size: 0xAA
	Parameters: 0
	Flags: Linked
*/
function reset_tickets()
{
	game.stat[#"tickets"] = [];
	foreach(team, _ in level.teams)
	{
		game.stat[#"tickets"][team] = 0;
	}
}

/*
	Name: setup_mission_ticket_logic
	Namespace: tickets
	Checksum: 0x9C6770E8
	Offset: 0x2D8
	Size: 0x5C
	Parameters: 2
	Flags: None
*/
function setup_mission_ticket_logic(team, zone_index)
{
	setup_stage_start_tickets(team, zone_index);
	thread setup_death_penalties(team);
	thread watch_time_penalties(team);
}

/*
	Name: setup_stage_start_tickets
	Namespace: tickets
	Checksum: 0x97F58757
	Offset: 0x340
	Size: 0x5C
	Parameters: 2
	Flags: Linked
*/
function setup_stage_start_tickets(team, zone_index)
{
	reset_tickets();
	zone_start_tickets = get_zone_start_tickets(zone_index);
	set_tickets(team, zone_start_tickets);
}

/*
	Name: get_zone_start_tickets
	Namespace: tickets
	Checksum: 0xBA7AF6A4
	Offset: 0x3A8
	Size: 0x68
	Parameters: 1
	Flags: Linked
*/
function get_zone_start_tickets(zone_index)
{
	return true;
}

/*
	Name: watch_time_penalties
	Namespace: tickets
	Checksum: 0x5FE033E3
	Offset: 0x418
	Size: 0x190
	Parameters: 1
	Flags: Linked
*/
function watch_time_penalties(team)
{
	level notify(#"tickets_watch_time_penalties");
	level endon(#"tickets_watch_time_penalties", #"mission_ended", #"game_ended");
	while(true)
	{
		penalty_interval = (isdefined(getgametypesetting(#"ticketslostontimeinterval")) ? getgametypesetting(#"ticketslostontimeinterval") : 0);
		if(penalty_interval <= 0)
		{
			wait(0.5);
			continue;
		}
		frames_to_wait = int(ceil(penalty_interval / (float(function_60d95f53()) / 1000)));
		waitframe(frames_to_wait);
		lose_tickets(team, (isdefined(getgametypesetting(#"ticketslostontimeamount")) ? getgametypesetting(#"ticketslostontimeamount") : 0));
	}
}

/*
	Name: setup_death_penalties
	Namespace: tickets
	Checksum: 0xA623E60E
	Offset: 0x5B0
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function setup_death_penalties(team)
{
	level.ticket_death_penalty_team = team;
}

/*
	Name: on_player_killed
	Namespace: tickets
	Checksum: 0x17A83E08
	Offset: 0x5D8
	Size: 0x120
	Parameters: 1
	Flags: Linked
*/
function on_player_killed(params)
{
	player = self;
	if(!isplayer(player))
	{
		return;
	}
	if(!isdefined(player.team))
	{
		return;
	}
	if(!isdefined(level.ticket_death_penalty_team))
	{
		return;
	}
	if(level.ticket_death_penalty_team == player.team)
	{
		death_penalty = (isdefined(getgametypesetting(#"ticketslostondeath")) ? getgametypesetting(#"ticketslostondeath") : 0);
		if(death_penalty > 0)
		{
			lose_tickets(player.team, death_penalty);
			level notify(#"ticket_death", {#team:player.team});
		}
	}
}

/*
	Name: set_tickets
	Namespace: tickets
	Checksum: 0x6FA18AEA
	Offset: 0x700
	Size: 0x6C
	Parameters: 2
	Flags: Linked
*/
function set_tickets(team, tickets)
{
	original_total = game.stat[#"tickets"][team];
	game.stat[#"tickets"][team] = tickets;
	notify_tickets_updated(team, original_total);
}

/*
	Name: earn_tickets
	Namespace: tickets
	Checksum: 0x311BD5F
	Offset: 0x778
	Size: 0xA4
	Parameters: 2
	Flags: Linked
*/
function earn_tickets(team, tickets)
{
	original_total = game.stat[#"tickets"][team];
	game.stat[#"tickets"][team] = game.stat[#"tickets"][team] + tickets;
	clamp_tickets(team);
	notify_tickets_updated(team, original_total);
}

/*
	Name: lose_tickets
	Namespace: tickets
	Checksum: 0xAF838F22
	Offset: 0x828
	Size: 0xA4
	Parameters: 2
	Flags: Linked
*/
function lose_tickets(team, tickets)
{
	original_total = game.stat[#"tickets"][team];
	game.stat[#"tickets"][team] = game.stat[#"tickets"][team] - tickets;
	clamp_tickets(team);
	notify_tickets_updated(team, original_total);
}

/*
	Name: notify_tickets_updated
	Namespace: tickets
	Checksum: 0xB66C4423
	Offset: 0x8D8
	Size: 0x18C
	Parameters: 2
	Flags: Linked
*/
function notify_tickets_updated(team, original_total)
{
	if(original_total != game.stat[#"tickets"][team])
	{
		level notify(#"tickets_updated", {#total_tickets:game.stat[#"tickets"][team], #team:team});
		low_ticket_threshold = 30;
		very_low_ticket_threshold = 10;
		/#
			if(getdvarint(#"scr_disable_war_score_limits", 0) > 0)
			{
				low_ticket_threshold = -1;
				very_low_ticket_threshold = -1;
			}
		#/
		low_tickets_enabled = level.low_tickets_enabled === 1;
		level.low_ticket_count = game.stat[#"tickets"][team] <= low_ticket_threshold && !level.inprematchperiod && low_tickets_enabled;
		level.very_low_ticket_count = game.stat[#"tickets"][team] <= very_low_ticket_threshold && !level.inprematchperiod && low_tickets_enabled;
	}
}

/*
	Name: clamp_tickets
	Namespace: tickets
	Checksum: 0x7B51C0D7
	Offset: 0xA70
	Size: 0x5E
	Parameters: 1
	Flags: Linked, Private
*/
function private clamp_tickets(team)
{
	game.stat[#"tickets"][team] = math::clamp(game.stat[#"tickets"][team], 0, 2147483647);
}

/*
	Name: commit_tickets
	Namespace: tickets
	Checksum: 0x9D9F128D
	Offset: 0xAD8
	Size: 0x6C
	Parameters: 2
	Flags: None
*/
function commit_tickets(team, stage)
{
	game.stat[#"stagetickets"][team][stage] = game.stat[#"tickets"][team];
	notify_stage_tickets_updated(team, stage);
}

/*
	Name: award_stage_win
	Namespace: tickets
	Checksum: 0x850C2D5D
	Offset: 0xB50
	Size: 0x5C
	Parameters: 2
	Flags: None
*/
function award_stage_win(team, stage)
{
	earned_tickets = get_stage_win_tickets(stage);
	if(earned_tickets > 0)
	{
		earn_tickets(team, earned_tickets);
	}
}

/*
	Name: get_stage_win_tickets
	Namespace: tickets
	Checksum: 0xD1E21AA9
	Offset: 0xBB8
	Size: 0x68
	Parameters: 1
	Flags: Linked
*/
function get_stage_win_tickets(stage)
{
	return true;
}

/*
	Name: get_tickets
	Namespace: tickets
	Checksum: 0x6384FA6A
	Offset: 0xC28
	Size: 0x4E
	Parameters: 1
	Flags: None
*/
function get_tickets(team)
{
	if(!isdefined(game.tickets_initialized) || !game.tickets_initialized)
	{
		return 0;
	}
	return game.stat[#"tickets"][team];
}

/*
	Name: get_stage_tickets
	Namespace: tickets
	Checksum: 0xCED4DC22
	Offset: 0xC80
	Size: 0x58
	Parameters: 2
	Flags: Linked
*/
function get_stage_tickets(team, stage)
{
	if(!isdefined(game.tickets_initialized) || !game.tickets_initialized)
	{
		return 0;
	}
	return game.stat[#"stagetickets"][team][stage];
}

/*
	Name: notify_stage_tickets_updated
	Namespace: tickets
	Checksum: 0x5727B4F0
	Offset: 0xCE0
	Size: 0x78
	Parameters: 2
	Flags: Linked
*/
function notify_stage_tickets_updated(team, stage)
{
	level notify(#"tickets_stage_updated", {#total_tickets:game.stat[#"stagetickets"][team][stage], #zone_number:stage, #team:team});
}

/*
	Name: get_total_tickets
	Namespace: tickets
	Checksum: 0x9D834018
	Offset: 0xD60
	Size: 0x64
	Parameters: 2
	Flags: None
*/
function get_total_tickets(team, total_stages)
{
	team_total = 0;
	for(i = 0; i < total_stages; i++)
	{
		team_total = team_total + get_stage_tickets(team, i);
	}
	return team_total;
}

