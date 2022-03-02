#using scripts\core_common\lui_shared.gsc;

class class_ec90ce81 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_ec90ce81
		Checksum: 0x928FF90A
		Offset: 0x180
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_ec90ce81
		Checksum: 0x1463279F
		Offset: 0x240
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_ec90ce81
		Checksum: 0x2CCA2BF4
		Offset: 0x1C8
		Size: 0x3C
		Parameters: 2
		Flags: Linked
	*/
	function open(player, flags)
	{
		if(!isdefined(flags))
		{
			flags = 0;
		}
		namespace_6aaccc24::function_8b8089ba(player, flags);
	}

	/*
		Name: close
		Namespace: namespace_ec90ce81
		Checksum: 0x4FDBFC39
		Offset: 0x210
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function close(player)
	{
		namespace_6aaccc24::function_a68f6e20(player);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_ec90ce81
		Checksum: 0x18BACB35
		Offset: 0x1A0
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("sr_weapon_upgrade_menu");
	}

}

#namespace sr_weapon_upgrade_menu;

/*
	Name: register
	Namespace: sr_weapon_upgrade_menu
	Checksum: 0x4391FD1D
	Offset: 0xB0
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function register()
{
	elem = new class_ec90ce81();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: sr_weapon_upgrade_menu
	Checksum: 0x34E39DA0
	Offset: 0xF0
	Size: 0x38
	Parameters: 2
	Flags: Linked
*/
function open(player, flags)
{
	if(!isdefined(flags))
	{
		flags = 0;
	}
	[[ self ]]->open(player, flags);
}

/*
	Name: close
	Namespace: sr_weapon_upgrade_menu
	Checksum: 0x74CB4E3A
	Offset: 0x130
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function close(player)
{
	[[ self ]]->close(player);
}

/*
	Name: is_open
	Namespace: sr_weapon_upgrade_menu
	Checksum: 0xA9AD379B
	Offset: 0x158
	Size: 0x1A
	Parameters: 1
	Flags: Linked
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

