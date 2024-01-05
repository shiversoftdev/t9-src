#using scripts\zm_common\zm_powerups.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\struct.csc;

#namespace zm_powerup_bonus_points_player;

/*
	Name: __init__system__
	Namespace: zm_powerup_bonus_points_player
	Checksum: 0x2083C510
	Offset: 0xB0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_powerup_bonus_points_player", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_powerup_bonus_points_player
	Checksum: 0x1CB0A05C
	Offset: 0xF8
	Size: 0x64
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	zm_powerups::include_zombie_powerup("bonus_points_player");
	zm_powerups::add_zombie_powerup("bonus_points_player");
	zm_powerups::include_zombie_powerup("bonus_points_player_shared");
	zm_powerups::add_zombie_powerup("bonus_points_player_shared");
}

