#using scripts\zm_common\zm_powerups.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\struct.csc;

#namespace zm_powerup_bonus_points_team;

/*
	Name: function_6c1c6c4a
	Namespace: zm_powerup_bonus_points_team
	Checksum: 0x3AFED740
	Offset: 0x90
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_6c1c6c4a()
{
	level notify(-921256400);
}

/*
	Name: __init__system__
	Namespace: zm_powerup_bonus_points_team
	Checksum: 0xAABB3697
	Offset: 0xB0
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
	Checksum: 0x8B338208
	Offset: 0xF8
	Size: 0x34
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	zm_powerups::include_zombie_powerup("bonus_points_team");
	zm_powerups::add_zombie_powerup("bonus_points_team");
}

