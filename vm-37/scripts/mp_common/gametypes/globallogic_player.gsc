#using script_68d2ee1489345a1d;
#using script_6c8abe14025b47c4;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace globallogic_player;

/*
	Name: function_89f2df9
	Namespace: globallogic_player
	Checksum: 0x862DBDD7
	Offset: 0x80
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"globallogic_player", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: globallogic_player
	Checksum: 0x40E21C86
	Offset: 0xC8
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
	Checksum: 0x4EE0F2AD
	Offset: 0x110
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
	Checksum: 0x7EE85E8C
	Offset: 0x168
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

