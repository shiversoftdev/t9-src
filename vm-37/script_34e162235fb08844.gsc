#using script_2255a7ad3edc838f;
#using script_6158278c8647d8a9;
#using scripts\core_common\bots\bot_action.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace namespace_255a2b21;

/*
	Name: function_70a657d8
	Namespace: namespace_255a2b21
	Checksum: 0x5CD3B25F
	Offset: 0x80
	Size: 0x114
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	if(currentsessionmode() == 4 || !(isdefined(getgametypesetting(#"hash_7ab596bf4932361d")) ? getgametypesetting(#"hash_7ab596bf4932361d") : 0))
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
	Checksum: 0x75F54B78
	Offset: 0x1A0
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
	Checksum: 0xF7F080D6
	Offset: 0x1D0
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
	Checksum: 0x34A565DC
	Offset: 0x230
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
	Checksum: 0xE4937531
	Offset: 0x268
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
	Checksum: 0xD4E495DA
	Offset: 0x2D0
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
	Checksum: 0x732C9D84
	Offset: 0x300
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
			navmeshpoint = namespace_b20b4885::function_13796beb(player.origin);
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
				var_65c8979b = namespace_b20b4885::function_13796beb(bot.origin);
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

