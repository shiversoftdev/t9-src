#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\zm_common\zm_powerups.csc;

#namespace namespace_b6737b02;

/*
	Name: function_89f2df9
	Namespace: namespace_b6737b02
	Checksum: 0x6A00827A
	Offset: 0x88
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_2a62a00449e2e702", &__init__, undefined, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_b6737b02
	Checksum: 0x3745DE77
	Offset: 0xD0
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function __init__()
{
	zm_powerups::include_zombie_powerup("small_ammo");
	if(zm_powerups::function_cc33adc8())
	{
		zm_powerups::add_zombie_powerup("small_ammo");
	}
}

