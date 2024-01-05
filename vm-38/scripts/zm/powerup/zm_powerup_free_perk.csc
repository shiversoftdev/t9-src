#using scripts\zm_common\zm_powerups.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\struct.csc;

#namespace zm_powerup_free_perk;

/*
	Name: function_dcb5d2d4
	Namespace: zm_powerup_free_perk
	Checksum: 0x3436792F
	Offset: 0x88
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_dcb5d2d4()
{
	level notify(-316667860);
}

/*
	Name: __init__system__
	Namespace: zm_powerup_free_perk
	Checksum: 0x2B5F2499
	Offset: 0xA8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_powerup_free_perk", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_powerup_free_perk
	Checksum: 0x8B338208
	Offset: 0xF0
	Size: 0x34
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	zm_powerups::include_zombie_powerup("free_perk");
	zm_powerups::add_zombie_powerup("free_perk");
}

