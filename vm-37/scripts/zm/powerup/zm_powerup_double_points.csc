#using scripts\zm_common\zm_powerups.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\struct.csc;

#namespace zm_powerup_double_points;

/*
	Name: __init__system__
	Namespace: zm_powerup_double_points
	Checksum: 0x82C2F363
	Offset: 0xA8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_powerup_double_points", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_powerup_double_points
	Checksum: 0x56F7C877
	Offset: 0xF0
	Size: 0x4C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	zm_powerups::include_zombie_powerup("double_points");
	if(zm_powerups::function_cc33adc8())
	{
		zm_powerups::add_zombie_powerup("double_points", "powerup_double_points");
	}
}

