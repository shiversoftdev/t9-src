#using scripts\core_common\system_shared.csc;
#using scripts\zm_common\zm_powerups.csc;

#namespace zm_powerup_shield_charge;

/*
	Name: function_20e23221
	Namespace: zm_powerup_shield_charge
	Checksum: 0x90403B52
	Offset: 0x88
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_20e23221()
{
	level notify(62587683);
}

/*
	Name: function_89f2df9
	Namespace: zm_powerup_shield_charge
	Checksum: 0xB068C112
	Offset: 0xA8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"zm_powerup_shield_charge", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_powerup_shield_charge
	Checksum: 0x2AC428FB
	Offset: 0xF0
	Size: 0x34
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	zm_powerups::include_zombie_powerup("shield_charge");
	zm_powerups::add_zombie_powerup("shield_charge");
}

