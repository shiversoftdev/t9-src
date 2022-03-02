#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\math_shared.gsc;

#namespace tickets;

/*
	Name: __init__
	Namespace: tickets
	Checksum: 0x9B30B2DD
	Offset: 0x70
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
	Checksum: 0xF7AA488C
	Offset: 0xA0
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
	Checksum: 0xAE6C32A0
	Offset: 0x100
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
	Checksum: 0x9D400150
	Offset: 0x200
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
	Checksum: 0x218001F7
	Offset: 0x2B8
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
	Checksum: 0x34A29E45
	Offset: 0x320
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
	Checksum: 0x8D60EE78
	Offset: 0x388
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
	Checksum: 0xEFF0F998
	Offset: 0x3F8
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
	Checksum: 0xC2B8956C
	Offset: 0x590
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
	Checksum: 0x7DAF9779
	Offset: 0x5B8
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
	Checksum: 0x541F452E
	Offset: 0x6E0
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
	Checksum: 0x3F04A3D9
	Offset: 0x758
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
	Checksum: 0xDB4422D4
	Offset: 0x808
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
	Checksum: 0x3D6A7F8D
	Offset: 0x8B8
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
	Checksum: 0x241613A4
	Offset: 0xA50
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
	Checksum: 0x7DDAD8C1
	Offset: 0xAB8
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
	Checksum: 0x917C2462
	Offset: 0xB30
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
	Checksum: 0x9246C9B9
	Offset: 0xB98
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
	Checksum: 0xF91AC69
	Offset: 0xC08
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
	Checksum: 0x9CD2334
	Offset: 0xC60
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
	Checksum: 0x5F29FF3E
	Offset: 0xCC0
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
	Checksum: 0xEC47FF53
	Offset: 0xD40
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

