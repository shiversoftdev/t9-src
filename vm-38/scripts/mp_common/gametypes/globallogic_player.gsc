#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\killstreaks\killstreaks_util.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;

#namespace globallogic_player;

/*
	Name: function_df110115
	Namespace: globallogic_player
	Checksum: 0xA11DD20D
	Offset: 0x80
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_df110115()
{
	level notify(409816889);
}

/*
	Name: __init__system__
	Namespace: globallogic_player
	Checksum: 0x29021AA3
	Offset: 0xA0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"globallogic_player", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: globallogic_player
	Checksum: 0x14DD5BF1
	Offset: 0xE8
	Size: 0x3C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.var_aadc08f8 = &function_4b7bb02c;
	callback::on_disconnect(&on_player_disconnect);
}

/*
	Name: function_4b7bb02c
	Namespace: globallogic_player
	Checksum: 0x7BFC4C1
	Offset: 0x130
	Size: 0x4E
	Parameters: 1
	Flags: Linked
*/
function function_4b7bb02c(weapon)
{
	if(!killstreaks::is_killstreak_weapon(weapon))
	{
		return true;
	}
	if(killstreaks::is_killstreak_weapon_assist_allowed(weapon))
	{
		return true;
	}
	return false;
}

/*
	Name: on_player_disconnect
	Namespace: globallogic_player
	Checksum: 0xC3554E0F
	Offset: 0x188
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function on_player_disconnect()
{
	if(sessionmodeismultiplayergame())
	{
		uploadstats();
	}
}

