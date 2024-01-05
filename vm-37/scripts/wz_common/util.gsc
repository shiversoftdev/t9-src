#using script_1cc417743d7c262d;
#using scripts\core_common\globallogic\globallogic_player.gsc;
#using scripts\core_common\death_circle.gsc;

#namespace util;

/*
	Name: function_8076d591
	Namespace: util
	Checksum: 0x1D7C2B89
	Offset: 0x88
	Size: 0x54
	Parameters: 2
	Flags: None
*/
function function_8076d591(event, params)
{
	if(isdefined(params))
	{
		globallogic_audio::leader_dialog(event, params.team);
	}
	else
	{
		globallogic_audio::leader_dialog(event);
	}
}

/*
	Name: function_de15dc32
	Namespace: util
	Checksum: 0xC60F53ED
	Offset: 0xE8
	Size: 0x282
	Parameters: 2
	Flags: None
*/
function function_de15dc32(killed_player, disconnected_player)
{
	player_count = {#alive:0, #total:0};
	var_77cfc33d = game.state == #"pregame" || function_47851c07();
	foreach(team in level.teams)
	{
		players = getplayers(team);
		if(players.size == 0)
		{
			continue;
		}
		var_40073db2 = 0;
		var_ead60f69 = 0;
		foreach(player in players)
		{
			if(disconnected_player === player)
			{
				continue;
			}
			player_count.total++;
			if(isalive(player))
			{
				var_40073db2++;
				continue;
			}
			if(player.sessionstate != "playing" || killed_player === player)
			{
				if(player globallogic_player::function_38527849())
				{
					var_ead60f69++;
				}
			}
		}
		player_count.alive = player_count.alive + var_40073db2;
		if(var_77cfc33d && level.spawnsystem.var_c2cc011f && var_40073db2 > 0)
		{
			player_count.alive = player_count.alive + var_ead60f69;
		}
	}
	return player_count;
}

/*
	Name: function_47851c07
	Namespace: util
	Checksum: 0xB803CAF9
	Offset: 0x378
	Size: 0x13A
	Parameters: 0
	Flags: None
*/
function function_47851c07()
{
	if(game.state != #"playing")
	{
		return false;
	}
	if(is_true(level.spawnsystem.deathcirclerespawn))
	{
		var_3db6ed91 = level.deathcircles.size - 2;
		if(var_3db6ed91 < 0)
		{
			var_3db6ed91 = 0;
		}
		if((isdefined(level.var_78442886) ? level.var_78442886 : 0) >= var_3db6ed91)
		{
			return false;
		}
		if(isdefined(level.var_78442886) && isdefined(level.var_245d4af9) && level.var_78442886 >= level.var_245d4af9)
		{
			return false;
		}
	}
	if(is_true(level.wave_spawn) && (death_circle::function_9956f107() || (isdefined(level.var_75db41a7) && gettime() > level.var_75db41a7)))
	{
		return false;
	}
	return true;
}

