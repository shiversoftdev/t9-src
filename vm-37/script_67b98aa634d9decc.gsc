#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\zm_common\zm_powerups.csc;

#namespace zm_powerup_free_perk;

/*
	Name: function_89f2df9
	Namespace: zm_powerup_free_perk
	Checksum: 0x12323381
	Offset: 0x88
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"zm_powerup_free_perk", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_powerup_free_perk
	Checksum: 0xEBE69F5A
	Offset: 0xD0
	Size: 0x34
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	zm_powerups::include_zombie_powerup("free_perk");
	zm_powerups::add_zombie_powerup("free_perk");
}
