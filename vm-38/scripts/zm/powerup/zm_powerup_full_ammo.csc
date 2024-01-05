#using scripts\zm_common\zm_powerups.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\struct.csc;

#namespace zm_powerup_full_ammo;

/*
	Name: function_873e88a4
	Namespace: zm_powerup_full_ammo
	Checksum: 0xB1D1A9E7
	Offset: 0x88
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_873e88a4()
{
	level notify(-72884419);
}

/*
	Name: __init__system__
	Namespace: zm_powerup_full_ammo
	Checksum: 0x9B2180B7
	Offset: 0xA8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_powerup_full_ammo", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_powerup_full_ammo
	Checksum: 0x4A229DCB
	Offset: 0xF0
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

