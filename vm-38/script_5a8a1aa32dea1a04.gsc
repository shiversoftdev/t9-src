#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class csr_weapon_upgrade_menu : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: csr_weapon_upgrade_menu
		Checksum: 0x7DB406EC
		Offset: 0x1F0
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: csr_weapon_upgrade_menu
		Checksum: 0xFD685574
		Offset: 0x328
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: csr_weapon_upgrade_menu
		Checksum: 0xB22913EC
		Offset: 0x260
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
		cluielem::open_luielem(player, flags);
	}

	/*
		Name: close
		Namespace: csr_weapon_upgrade_menu
		Checksum: 0x40CEC21A
		Offset: 0x2A8
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function close(player)
	{
		cluielem::close_luielem(player);
	}

	/*
		Name: set_cannotammomod
		Namespace: csr_weapon_upgrade_menu
		Checksum: 0x8A14E737
		Offset: 0x2D8
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_cannotammomod(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "cannotAmmoMod", value);
	}

	/*
		Name: setup_clientfields
		Namespace: csr_weapon_upgrade_menu
		Checksum: 0x1E00A198
		Offset: 0x210
		Size: 0x44
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("sr_weapon_upgrade_menu");
		cluielem::add_clientfield("cannotAmmoMod", 16000, 1, "int");
	}

}

#namespace sr_weapon_upgrade_menu;

/*
	Name: function_5f4e9270
	Namespace: sr_weapon_upgrade_menu
	Checksum: 0x47339B99
	Offset: 0xD0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_5f4e9270()
{
	level notify(-53323069);
}

/*
	Name: register
	Namespace: sr_weapon_upgrade_menu
	Checksum: 0xB438B474
	Offset: 0xF0
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function register()
{
	elem = new csr_weapon_upgrade_menu();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: sr_weapon_upgrade_menu
	Checksum: 0x40D59CB0
	Offset: 0x130
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
	Checksum: 0x6221B1B7
	Offset: 0x170
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
	Checksum: 0xD7920DB2
	Offset: 0x198
	Size: 0x1A
	Parameters: 1
	Flags: Linked
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: set_cannotammomod
	Namespace: sr_weapon_upgrade_menu
	Checksum: 0xD0C609E6
	Offset: 0x1C0
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_cannotammomod(player, value)
{
	[[ self ]]->set_cannotammomod(player, value);
}

