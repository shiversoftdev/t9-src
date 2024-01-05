#using scripts\zm_common\zm_powerups.csc;
#using scripts\core_common\system_shared.csc;

#namespace zm_powerup_shield_charge;

/*
	Name: __init__system__
	Namespace: zm_powerup_shield_charge
	Checksum: 0xCF70DA0C
	Offset: 0x88
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_powerup_shield_charge", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_powerup_shield_charge
	Checksum: 0xB86EC671
	Offset: 0xD0
	Size: 0x34
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	zm_powerups::include_zombie_powerup("shield_charge");
	zm_powerups::add_zombie_powerup("shield_charge");
}

