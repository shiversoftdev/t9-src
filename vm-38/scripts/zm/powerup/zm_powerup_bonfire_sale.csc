#using scripts\zm_common\zm_powerups.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\struct.csc;

#namespace zm_powerup_bonfire_sale;

/*
	Name: function_89dd16cc
	Namespace: zm_powerup_bonfire_sale
	Checksum: 0xD3396234
	Offset: 0xA0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_89dd16cc()
{
	level notify(-1237853382);
}

/*
	Name: __init__system__
	Namespace: zm_powerup_bonfire_sale
	Checksum: 0x1F4B0691
	Offset: 0xC0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_powerup_bonfire_sale", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_powerup_bonfire_sale
	Checksum: 0x7DDA9A13
	Offset: 0x108
	Size: 0x4C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	zm_powerups::include_zombie_powerup("bonfire_sale");
	if(zm_powerups::function_cc33adc8())
	{
		zm_powerups::add_zombie_powerup("bonfire_sale", "powerup_bon_fire");
	}
}

