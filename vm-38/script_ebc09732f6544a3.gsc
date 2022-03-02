#using script_751513c609504a42;
#using scripts\core_common\util_shared.gsc;

#namespace target;

/*
	Name: function_5283be6a
	Namespace: target
	Checksum: 0x94C61ACB
	Offset: 0x90
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_5283be6a()
{
	level notify(475919650);
}

#namespace ai_target;

/*
	Name: function_d15dd929
	Namespace: ai_target
	Checksum: 0xACB5107F
	Offset: 0xB0
	Size: 0x8A
	Parameters: 2
	Flags: None
*/
function function_d15dd929(radius, origin)
{
	result = function_9cc082d2(origin + vectorscale((0, 0, 1), 100), 200);
	if(isdefined(result) && isdefined(result[#"hash_556255be476284b3"]) && result[#"hash_556255be476284b3"] & 2)
	{
		return false;
	}
	return true;
}

/*
	Name: is_target_valid
	Namespace: ai_target
	Checksum: 0xDD55530F
	Offset: 0x148
	Size: 0x204
	Parameters: 1
	Flags: None
*/
function is_target_valid(target)
{
	if(!isdefined(target))
	{
		return false;
	}
	if(!isalive(target))
	{
		return false;
	}
	if(isplayer(target) && target.sessionstate == "spectator")
	{
		return false;
	}
	if(isplayer(target) && target.sessionstate == "intermission")
	{
		return false;
	}
	if(is_true(level.intermission))
	{
		return false;
	}
	if(is_true(target.ignoreme))
	{
		return false;
	}
	if(target isnotarget())
	{
		return false;
	}
	if(issentient(target) && self function_ce6d3545(target))
	{
		return false;
	}
	if(!util::function_fbce7263(self.team, target.team))
	{
		return false;
	}
	if(isplayer(target))
	{
		if(target isplayerswimming())
		{
			return false;
		}
		waterdepth = target depthofplayerinwater();
		if(waterdepth > 2)
		{
			return false;
		}
		radius = self getpathfindingradius();
		if(!function_d15dd929(radius, target.origin))
		{
			return false;
		}
	}
	if(target depthinwater() >= 10)
	{
		return false;
	}
	return true;
}

/*
	Name: get_targets
	Namespace: ai_target
	Checksum: 0xA002261D
	Offset: 0x358
	Size: 0x13A
	Parameters: 0
	Flags: None
*/
function get_targets()
{
	targets = [];
	targets = arraycombine(getplayers(), getactorarray(), 0, 0);
	valid_targets = [];
	foreach(target in targets)
	{
		if(!is_target_valid(target))
		{
			continue;
		}
		if(!isdefined(valid_targets))
		{
			valid_targets = [];
		}
		else if(!isarray(valid_targets))
		{
			valid_targets = array(valid_targets);
		}
		valid_targets[valid_targets.size] = target;
	}
	return valid_targets;
}

/*
	Name: function_84235351
	Namespace: ai_target
	Checksum: 0x745EBF38
	Offset: 0x4A0
	Size: 0x30A
	Parameters: 2
	Flags: None
*/
function function_84235351(var_ff716a93, var_edc20efd)
{
	targets = self get_targets();
	var_e0c224a4 = var_edc20efd * var_edc20efd;
	least_hunted = undefined;
	closest_target_dist_squared = undefined;
	foreach(target in targets)
	{
		if(!isdefined(target.hunted_by))
		{
			target.hunted_by = 0;
		}
		attackedrecently = 0;
		if(issentient(target))
		{
			attackedrecently = target attackedrecently(self, 3);
			if(is_true(attackedrecently))
			{
				return target;
			}
		}
		if(self function_ce6d3545(target))
		{
			continue;
		}
		if(isplayer(target) && target isgrappling())
		{
			continue;
		}
		if(!isdefined(getclosestpointonnavmesh(target.origin, 200, 1.2 * self getpathfindingradius())))
		{
			continue;
		}
		dist_squared = distancesquared(var_ff716a93, target.origin);
		var_e294ac7d = (isplayer(target) ? target function_d730727f() : 1);
		var_97f7ad10 = var_e0c224a4 * var_e294ac7d;
		if(dist_squared > var_97f7ad10)
		{
			continue;
		}
		if(!self is_target_valid(least_hunted))
		{
			least_hunted = target;
		}
		if(target.hunted_by <= least_hunted.hunted_by && (!isdefined(closest_target_dist_squared) || dist_squared < closest_target_dist_squared))
		{
			least_hunted = target;
			closest_target_dist_squared = dist_squared;
		}
	}
	if(!self is_target_valid(least_hunted))
	{
		return undefined;
	}
	least_hunted.hunted_by = least_hunted.hunted_by + 1;
	return least_hunted;
}

/*
	Name: function_a13468f5
	Namespace: ai_target
	Checksum: 0x80925E91
	Offset: 0x7B8
	Size: 0x152
	Parameters: 2
	Flags: None
*/
function function_a13468f5(var_ff716a93, var_edc20efd)
{
	targets = self get_targets();
	valid_targets = [];
	var_e0c224a4 = var_edc20efd * var_edc20efd;
	foreach(target in targets)
	{
		dist_squared = distancesquared(var_ff716a93, target.origin);
		if(dist_squared > var_e0c224a4)
		{
			continue;
		}
		if(self function_ce6d3545(target))
		{
			continue;
		}
		if(self is_target_valid(target))
		{
			valid_targets[valid_targets.size] = target;
		}
	}
	if(valid_targets.size)
	{
		return valid_targets[0];
	}
	return undefined;
}

