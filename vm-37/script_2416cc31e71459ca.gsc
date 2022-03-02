#using script_3f9e54c7a9a7e1e2;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\wz_common\hud.gsc;

#namespace teams;

/*
	Name: function_74a8f2ed
	Namespace: teams
	Checksum: 0xF7174ECF
	Offset: 0xA0
	Size: 0x62
	Parameters: 2
	Flags: Private
*/
function private function_74a8f2ed(var_d3ba512b, var_c0856555)
{
	if(var_d3ba512b.score > var_c0856555.score)
	{
		return 1;
	}
	if(var_c0856555.score > var_d3ba512b.score)
	{
		return 0;
	}
	return function_39971b81(var_d3ba512b, var_c0856555);
}

/*
	Name: function_f1394038
	Namespace: teams
	Checksum: 0x1EC51377
	Offset: 0x110
	Size: 0x2BC
	Parameters: 0
	Flags: None
*/
function function_f1394038()
{
	var_17616452 = [];
	foreach(team, _ in level.teams)
	{
		if(function_9dd75dad(team) && !is_true(level.var_606becce[team]) && !isdefined(level.var_eed7c027[team]))
		{
			players = getplayers(team);
			team_score = [[level._getteamscore]](team);
			team_kills = function_7e309c84(team, players);
			damage_done = function_3915e148(team, players);
			if(!isdefined(var_17616452))
			{
				var_17616452 = [];
			}
			else if(!isarray(var_17616452))
			{
				var_17616452 = array(var_17616452);
			}
			var_17616452[var_17616452.size] = {#score:team_score, #damage:damage_done, #kills:team_kills, #last_alive:undefined, #players:players, #team:team};
		}
	}
	var_ec950e92 = array::merge_sort(var_17616452, &function_74a8f2ed);
	placement = 1;
	foreach(team in var_ec950e92)
	{
		level.var_eed7c027[team.team] = placement;
		placement++;
	}
}

/*
	Name: function_94203702
	Namespace: teams
	Checksum: 0x15E6BFF8
	Offset: 0x3D8
	Size: 0xE6
	Parameters: 2
	Flags: None
*/
function function_94203702(team, players)
{
	var_b7771cfa = 0;
	last_player = undefined;
	foreach(player in players)
	{
		if(is_true(player.teamkilled))
		{
			continue;
		}
		if(player.deathtime > var_b7771cfa)
		{
			var_b7771cfa = player.deathtime;
			last_player = player;
		}
	}
	return last_player;
}

/*
	Name: function_7e309c84
	Namespace: teams
	Checksum: 0xA8155AE7
	Offset: 0x4C8
	Size: 0xA4
	Parameters: 2
	Flags: None
*/
function function_7e309c84(team, players)
{
	team_kills = 0;
	foreach(player in players)
	{
		team_kills = team_kills + player.kills;
	}
	return team_kills;
}

/*
	Name: function_3915e148
	Namespace: teams
	Checksum: 0x57F409C9
	Offset: 0x578
	Size: 0xA4
	Parameters: 2
	Flags: None
*/
function function_3915e148(team, players)
{
	damage_done = 0;
	foreach(player in players)
	{
		damage_done = damage_done + player.damagedone;
	}
	return damage_done;
}

/*
	Name: function_39971b81
	Namespace: teams
	Checksum: 0x29E8F657
	Offset: 0x628
	Size: 0x14E
	Parameters: 2
	Flags: None
*/
function function_39971b81(var_d3ba512b, var_c0856555)
{
	if(isdefined(var_d3ba512b.last_alive) && !isdefined(var_c0856555.last_alive))
	{
		return true;
	}
	if(isdefined(var_c0856555.last_alive) && !isdefined(var_d3ba512b.last_alive))
	{
		return false;
	}
	if(isdefined(var_d3ba512b.last_alive) && var_d3ba512b.last_alive.deathtime > var_c0856555.last_alive.deathtime)
	{
		return true;
	}
	if(isdefined(var_d3ba512b.last_alive) && var_c0856555.last_alive.deathtime > var_d3ba512b.last_alive.deathtime)
	{
		return false;
	}
	if(var_d3ba512b.kills > var_c0856555.kills)
	{
		return true;
	}
	if(var_c0856555.kills > var_d3ba512b.kills)
	{
		return false;
	}
	if(var_d3ba512b.damage > var_c0856555.damage)
	{
		return true;
	}
	if(var_c0856555.damage > var_d3ba512b.damage)
	{
		return false;
	}
	return true;
}

/*
	Name: function_c7eae573
	Namespace: teams
	Checksum: 0x2834E7BF
	Offset: 0x780
	Size: 0x1E2
	Parameters: 0
	Flags: None
*/
function function_c7eae573()
{
	var_d72df62 = [];
	foreach(team, _ in level.teams)
	{
		if(function_9dd75dad(team) && !is_true(level.var_606becce[team]) && is_all_dead(team))
		{
			players = getplayers(team);
			last_alive = function_94203702(team, players);
			team_kills = function_7e309c84(team, players);
			damage_done = function_3915e148(team, players);
			var_d72df62[var_d72df62.size] = {#damage:damage_done, #kills:team_kills, #last_alive:last_alive, #players:players, #team:team};
		}
	}
	var_ec950e92 = array::merge_sort(var_d72df62, &function_39971b81);
	return var_ec950e92;
}

/*
	Name: function_c2f2fb84
	Namespace: teams
	Checksum: 0xE7E8C626
	Offset: 0x970
	Size: 0x4A
	Parameters: 1
	Flags: None
*/
function function_c2f2fb84(var_d72df62)
{
	if(var_d72df62.size == 0)
	{
		return undefined;
	}
	if(var_d72df62.size == 1)
	{
		return var_d72df62[0].team;
	}
	return var_d72df62[0].team;
}

/*
	Name: function_5fed3908
	Namespace: teams
	Checksum: 0x4334F9C6
	Offset: 0x9C8
	Size: 0x100
	Parameters: 1
	Flags: None
*/
function function_5fed3908(team)
{
	if(!isdefined(team))
	{
		return;
	}
	callback::callback(#"hash_677c43609aa6ce47", team);
	players = getplayers(team);
	foreach(player in players)
	{
		if(player function_8b1a219a())
		{
			player clientfield::set_to_player("RGB_keyboard_manager", 1);
		}
	}
}

/*
	Name: team_eliminated
	Namespace: teams
	Checksum: 0xB08962FE
	Offset: 0xAD0
	Size: 0x170
	Parameters: 2
	Flags: None
*/
function team_eliminated(team, var_293493b)
{
	level.var_606becce[team] = 1;
	callback::callback(#"hash_1019ab4b81d07b35", {#hash_293493b:var_293493b, #team:team});
	level hud::function_22df4165();
	level thread function_9498e451(team);
	var_3aef38fd = getplayers(team);
	foreach(teammember in var_3aef38fd)
	{
		teammember notify(#"end_respawn");
		teammember luinotifyevent(#"team_eliminated", 1, var_293493b);
	}
	level.var_eed7c027[team] = var_293493b;
}

/*
	Name: function_9498e451
	Namespace: teams
	Checksum: 0xC8FA0DAB
	Offset: 0xC48
	Size: 0x38
	Parameters: 1
	Flags: None
*/
function function_9498e451(team)
{
	wait(1);
	while(is_true(level.var_fec861a7))
	{
		waitframe(1);
	}
}

