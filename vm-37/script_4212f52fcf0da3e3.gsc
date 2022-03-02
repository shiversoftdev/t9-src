#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\zm_common\zm_powerups.csc;

#namespace zm_powerup_full_ammo;

/*
	Name: function_89f2df9
	Namespace: zm_powerup_full_ammo
	Checksum: 0xA24C97AF
	Offset: 0x88
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"zm_powerup_full_ammo", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_powerup_full_ammo
	Checksum: 0x56D7A4F9
	Offset: 0xD0
	Size: 0x44
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	zm_powerups::include_zombie_powerup("full_ammo");
	if(zm_powerups::function_cc33adc8())
	{
		zm_powerups::add_zombie_powerup("full_ammo");
	}
}

