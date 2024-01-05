#using scripts\zm_common\zm_powerups.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\struct.csc;

#namespace zm_powerup_fire_sale;

/*
	Name: function_5f4ad683
	Namespace: zm_powerup_fire_sale
	Checksum: 0x15DD0E9E
	Offset: 0xA0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_5f4ad683()
{
	level notify(1544136118);
}

/*
	Name: __init__system__
	Namespace: zm_powerup_fire_sale
	Checksum: 0x3CC9412D
	Offset: 0xC0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_powerup_fire_sale", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_powerup_fire_sale
	Checksum: 0x29114F74
	Offset: 0x108
	Size: 0x4C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	zm_powerups::include_zombie_powerup("fire_sale");
	if(zm_powerups::function_cc33adc8())
	{
		zm_powerups::add_zombie_powerup("fire_sale", "powerup_fire_sale");
	}
}

