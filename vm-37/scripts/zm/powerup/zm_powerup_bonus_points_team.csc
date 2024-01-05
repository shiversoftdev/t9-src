#using scripts\zm_common\zm_powerups.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\struct.csc;

#namespace zm_powerup_bonus_points_team;

/*
	Name: __init__system__
	Namespace: zm_powerup_bonus_points_team
	Checksum: 0x93D6218F
	Offset: 0x90
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_powerup_bonus_points_team", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_powerup_bonus_points_team
	Checksum: 0xEBE69F5A
	Offset: 0xD8
	Size: 0x34
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	zm_powerups::include_zombie_powerup("bonus_points_team");
	zm_powerups::add_zombie_powerup("bonus_points_team");
}

