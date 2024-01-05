#using scripts\zm_common\zm_powerups.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\struct.csc;

#namespace zm_powerup_insta_kill;

/*
	Name: function_80fe2b00
	Namespace: zm_powerup_insta_kill
	Checksum: 0x56B1B979
	Offset: 0xA0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_80fe2b00()
{
	level notify(-1544653050);
}

/*
	Name: __init__system__
	Namespace: zm_powerup_insta_kill
	Checksum: 0xA170A794
	Offset: 0xC0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_powerup_insta_kill", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_powerup_insta_kill
	Checksum: 0xE1D254E0
	Offset: 0x108
	Size: 0x4C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	zm_powerups::include_zombie_powerup("insta_kill");
	if(zm_powerups::function_cc33adc8())
	{
		zm_powerups::add_zombie_powerup("insta_kill", "powerup_instant_kill");
	}
}

