#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\ai\zm_ai_utility.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\bots\bot.gsc;
#using scripts\core_common\ai_shared.gsc;

#namespace zm_bot;

/*
	Name: function_1446b351
	Namespace: zm_bot
	Checksum: 0x96C4DB22
	Offset: 0xE8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_1446b351()
{
	level notify(-1421993146);
}

/*
	Name: __init__system__
	Namespace: zm_bot
	Checksum: 0x8A823906
	Offset: 0x108
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_bot", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_bot
	Checksum: 0x46D2D38C
	Offset: 0x150
	Size: 0x8C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	callback::on_connect(&on_player_connect);
	level.var_df0a0911 = "bot_tacstate_zm_default";
	level.var_258cdebb = "bot_tacstate_zm_laststand";
	level.var_34eb792d = &handleplayerfasttravel;
	level.zm_bots_scale = getdvarint(#"zm_bots_scale", 1);
}

/*
	Name: on_player_connect
	Namespace: zm_bot
	Checksum: 0x662642D5
	Offset: 0x1E8
	Size: 0x1E
	Parameters: 0
	Flags: Linked
*/
function on_player_connect()
{
}

/*
	Name: function_e16b5033
	Namespace: zm_bot
	Checksum: 0xA75051F1
	Offset: 0x210
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function function_e16b5033(actor)
{
	base_health = (isdefined(actor.basehealth) ? actor.basehealth : 99);
	max_health = actor zm_ai_utility::function_f7014c3d(base_health);
	return (max_health / base_health) * 1;
}

/*
	Name: function_1f9de69d
	Namespace: zm_bot
	Checksum: 0xE2BF0198
	Offset: 0x288
	Size: 0xEC
	Parameters: 1
	Flags: Linked
*/
function function_1f9de69d(var_40b86c4b)
{
	if(!isdefined(var_40b86c4b))
	{
		return false;
	}
	players = getplayers();
	foreach(player in players)
	{
		if(isbot(player))
		{
			continue;
		}
		currentzone = player zm_utility::get_current_zone();
		if(currentzone === var_40b86c4b)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: handleplayerfasttravel
	Namespace: zm_bot
	Checksum: 0xF279D404
	Offset: 0x380
	Size: 0x208
	Parameters: 2
	Flags: Linked
*/
function handleplayerfasttravel(player, var_12230d08)
{
	player endon(#"death");
	level notify(#"handleplayerfasttravel");
	level endon(#"handleplayerfasttravel");
	if(!isdefined(var_12230d08))
	{
		return;
	}
	wait(3);
	currentzone = player zm_utility::get_current_zone();
	currentorigin = player.origin;
	if(!isdefined(currentzone))
	{
		return;
	}
	players = getplayers();
	foreach(player in players)
	{
		if(!isbot(player))
		{
			continue;
		}
		var_40b86c4b = player zm_utility::get_current_zone();
		if(var_40b86c4b === currentzone)
		{
			continue;
		}
		if(function_1f9de69d(var_40b86c4b))
		{
			continue;
		}
		if(isdefined(level.var_1dbf5163) && ![[level.var_1dbf5163]](player))
		{
			continue;
		}
		if(isdefined(level.var_3c84697b))
		{
			player thread [[level.var_3c84697b]](var_12230d08);
			continue;
		}
		player setorigin(currentorigin);
		player dontinterpolate();
	}
}

