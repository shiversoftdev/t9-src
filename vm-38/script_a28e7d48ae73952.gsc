#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\zm_common\zm_powerups.csc;

#namespace zm_powerup_bonus_points_player;

/*
	Name: function_c4e8f51e
	Namespace: zm_powerup_bonus_points_player
	Checksum: 0xD713E545
	Offset: 0xB0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_c4e8f51e()
{
	level notify(2027891397);
}

/*
	Name: function_89f2df9
	Namespace: zm_powerup_bonus_points_player
	Checksum: 0x19EED208
	Offset: 0xD0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"zm_powerup_bonus_points_player", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_powerup_bonus_points_player
	Checksum: 0x91DFF6F7
	Offset: 0x118
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

