#using scripts\core_common\system_shared.csc;
#using scripts\zm_common\zm_powerups.csc;

#namespace namespace_65320816;

/*
	Name: function_f9e018b7
	Namespace: namespace_65320816
	Checksum: 0x58191A18
	Offset: 0xA0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_f9e018b7()
{
	level notify(21815357);
}

/*
	Name: function_89f2df9
	Namespace: namespace_65320816
	Checksum: 0x56E1C1AD
	Offset: 0xC0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_2209575d9ead0b63", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_65320816
	Checksum: 0x226953E8
	Offset: 0x108
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

