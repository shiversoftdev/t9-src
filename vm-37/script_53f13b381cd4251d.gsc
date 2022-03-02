#using script_2255a7ad3edc838f;
#using script_7e59d7bba853fe4b;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace zm_bot;

/*
	Name: function_89f2df9
	Namespace: zm_bot
	Checksum: 0x25AD9E72
	Offset: 0xE8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"zm_bot", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_bot
	Checksum: 0xE5F7DD54
	Offset: 0x130
	Size: 0x8C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	callback::on_connect(&on_player_connect);
	level.var_df0a0911 = "bot_tacstate_zm_default";
	level.var_258cdebb = "bot_tacstate_zm_laststand";
	level.var_34eb792d = &function_80c40052;
	level.var_4804edae = getdvarint(#"hash_69669601e8417252", 1);
}

/*
	Name: on_player_connect
	Namespace: zm_bot
	Checksum: 0xECA1B5C3
	Offset: 0x1C8
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
	Checksum: 0xF8DE3E1D
	Offset: 0x1F0
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function function_e16b5033(actor)
{
	var_88f4c6ec = (isdefined(actor.basehealth) ? actor.basehealth : 99);
	max_health = actor namespace_e0710ee6::function_f7014c3d(var_88f4c6ec);
	return (max_health / var_88f4c6ec) * 1;
}

/*
	Name: function_1f9de69d
	Namespace: zm_bot
	Checksum: 0x2D96926
	Offset: 0x268
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
	Name: function_80c40052
	Namespace: zm_bot
	Checksum: 0xE7514F01
	Offset: 0x360
	Size: 0x208
	Parameters: 2
	Flags: Linked
*/
function function_80c40052(player, var_12230d08)
{
	player endon(#"death");
	level notify(#"hash_4c873500aa6afd3c");
	level endon(#"hash_4c873500aa6afd3c");
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

