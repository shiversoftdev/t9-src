#using scripts\zm_common\zm_powerups.csc;
#using scripts\core_common\system_shared.csc;

#namespace namespace_65320816;

/*
	Name: __init__system__
	Namespace: namespace_65320816
	Checksum: 0xDFE0241D
	Offset: 0xA0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_2209575d9ead0b63", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_65320816
	Checksum: 0x56F7C877
	Offset: 0xE8
	Size: 0x4C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	zm_powerups::include_zombie_powerup("cranked_pause");
	if(zm_powerups::function_cc33adc8())
	{
		zm_powerups::add_zombie_powerup("cranked_pause", "powerup_cranked_pause");
	}
}

