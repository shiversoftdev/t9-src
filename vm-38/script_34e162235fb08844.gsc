#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\bots\bot_position.gsc;
#using scripts\core_common\bots\bot_action.gsc;
#using scripts\core_common\bots\bot.gsc;

#namespace namespace_255a2b21;

/*
	Name: function_5923e3d3
	Namespace: namespace_255a2b21
	Checksum: 0x77DC8DFC
	Offset: 0x80
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_5923e3d3()
{
	level notify(2101746504);
}

/*
	Name: function_70a657d8
	Namespace: namespace_255a2b21
	Checksum: 0x4D209F19
	Offset: 0xA0
	Size: 0x114
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	if(currentsessionmode() == 4 || !(isdefined(getgametypesetting(#"allowlaststandforactiveclients")) ? getgametypesetting(#"allowlaststandforactiveclients") : 0))
	{
		return;
	}
	callback::on_spawned(&on_player_spawned);
	callback::on_laststand(&on_player_laststand);
	callback::on_revived(&on_player_revived);
	callback::on_player_killed(&on_player_killed);
	callback::on_disconnect(&on_player_disconnect);
}

/*
	Name: on_player_spawned
	Namespace: namespace_255a2b21
	Checksum: 0xA672F194
	Offset: 0x1C0
	Size: 0x24
	Parameters: 0
	Flags: Linked, Private
*/
function private on_player_spawned()
{
	level function_301f229d(self.team);
}

/*
	Name: on_player_laststand
	Namespace: namespace_255a2b21
	Checksum: 0x261C4875
	Offset: 0x1F0
	Size: 0x54
	Parameters: 0
	Flags: Linked, Private
*/
function private on_player_laststand()
{
	if(isbot(self))
	{
		self bot::clear_revive_target();
	}
	waitframe(1);
	level function_301f229d(self.team);
}

/*
	Name: on_player_revived
	Namespace: namespace_255a2b21
	Checksum: 0x436277B8
	Offset: 0x250
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private on_player_revived(params)
{
	level function_301f229d(self.team);
}

/*
	Name: on_player_killed
	Namespace: namespace_255a2b21
	Checksum: 0xBDE33BEF
	Offset: 0x288
	Size: 0x5C
	Parameters: 1
	Flags: Linked, Private
*/
function private on_player_killed(params)
{
	level function_301f229d(self.team);
	if(isbot(self))
	{
		self bot::clear_revive_target();
	}
}

/*
	Name: on_player_disconnect
	Namespace: namespace_255a2b21
	Checksum: 0x3C801C28
	Offset: 0x2F0
	Size: 0x24
	Parameters: 0
	Flags: Linked, Private
*/
function private on_player_disconnect()
{
	level function_301f229d(self.team);
}

/*
	Name: function_301f229d
	Namespace: namespace_255a2b21
	Checksum: 0x8E2F4D49
	Offset: 0x320
	Size: 0x700
	Parameters: 1
	Flags: Linked, Private
*/
function private function_301f229d(team)
{
	var_9e7013f = [];
	var_52e61055 = [];
	players = getplayers(team);
	foreach(player in players)
	{
		if(!isalive(player))
		{
			continue;
		}
		if(isdefined(player.revivetrigger))
		{
			if(!is_true(player.revivetrigger.beingrevived))
			{
				var_9e7013f[var_9e7013f.size] = player;
			}
			continue;
		}
		if(isbot(player))
		{
			if(!player.ignoreall && !player isplayinganimscripted() && !player arecontrolsfrozen() && !player function_5972c3cf() && !player isinvehicle())
			{
				if(!isdefined(player.bot.revivetarget) || !isdefined(player.bot.revivetarget.revivetrigger) || !is_true(player.is_reviving_any))
				{
					var_52e61055[var_52e61055.size] = player;
				}
			}
		}
	}
	assignments = [];
	foreach(bot in var_52e61055)
	{
		radius = bot getpathfindingradius();
		foreach(player in var_9e7013f)
		{
			distance = undefined;
			if(bot istouching(player.revivetrigger))
			{
				distance = distance(bot.origin, player.origin);
				arrayinsert(assignments, {#distance:distance, #target:player, #bot:bot}, 0);
				continue;
			}
			navmeshpoint = bot_position::function_13796beb(player.origin);
			if(!isdefined(navmeshpoint))
			{
				continue;
			}
			if(tracepassedonnavmesh(bot.origin, navmeshpoint, 15))
			{
				distance = distance2d(bot.origin, navmeshpoint);
			}
			else
			{
				var_65c8979b = bot_position::function_13796beb(bot.origin);
				if(!isdefined(var_65c8979b))
				{
					continue;
				}
				path = generatenavmeshpath(var_65c8979b, navmeshpoint, bot);
				if(!isdefined(path) || !isdefined(path.pathpoints) || path.pathpoints.size == 0)
				{
					continue;
				}
				distance = path.pathdistance;
			}
			if(distance > 2000)
			{
				continue;
			}
			for(i = 0; i < assignments.size; i++)
			{
				if(distance < assignments[i].distance)
				{
					break;
				}
			}
			arrayinsert(assignments, {#distance:distance, #target:player, #bot:bot}, i);
		}
	}
	for(i = 0; i < assignments.size; i++)
	{
		assignment = assignments[i];
		if(assignment.bot bot::get_revive_target() !== assignment.target)
		{
			assignment.bot bot::set_revive_target(assignment.target);
		}
		arrayremovevalue(var_52e61055, assignment.bot);
		j = i + 1;
		while(j < assignments.size)
		{
			var_ecf75b21 = assignments[j];
			if(var_ecf75b21.bot == assignment.bot || var_ecf75b21.target == assignment.target)
			{
				arrayremoveindex(assignments, j);
				continue;
			}
			j++;
		}
	}
	foreach(bot in var_52e61055)
	{
		if(isdefined(bot bot::get_revive_target()))
		{
			bot bot::clear_revive_target();
		}
	}
}

