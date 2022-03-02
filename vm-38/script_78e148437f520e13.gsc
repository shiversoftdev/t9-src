#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\zm_common\zm_powerups.csc;

#namespace zm_powerup_weapon_minigun;

/*
	Name: function_16ea5870
	Namespace: zm_powerup_weapon_minigun
	Checksum: 0xD8DC68A1
	Offset: 0x98
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_16ea5870()
{
	level notify(1189040263);
}

/*
	Name: function_89f2df9
	Namespace: zm_powerup_weapon_minigun
	Checksum: 0x7DAD2F37
	Offset: 0xB8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"zm_powerup_weapon_minigun", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_powerup_weapon_minigun
	Checksum: 0x393654AA
	Offset: 0x100
	Size: 0x4C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	zm_powerups::include_zombie_powerup("minigun");
	if(zm_powerups::function_cc33adc8())
	{
		zm_powerups::add_zombie_powerup("minigun", "powerup_mini_gun");
	}
}

