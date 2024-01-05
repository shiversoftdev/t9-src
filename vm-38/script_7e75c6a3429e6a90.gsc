#using scripts\core_common\lui_shared.csc;

class csr_weapon_upgrade_menu : cluielem
{

	/*
		Name: constructor
		Namespace: csr_weapon_upgrade_menu
		Checksum: 0x4D8CCE20
		Offset: 0x350
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
		Checksum: 0x80A4509F
		Offset: 0x4A0
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
		Checksum: 0xF3C11441
		Offset: 0x438
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function open(localclientnum)
	{
		cluielem::open(localclientnum);
	}

	/*
		Name: register_clientside
		Namespace: csr_weapon_upgrade_menu
		Checksum: 0x52775501
		Offset: 0x3C8
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function register_clientside()
	{
		cluielem::register_clientside("sr_weapon_upgrade_menu");
	}

	/*
		Name: set_cannotammomod
		Namespace: csr_weapon_upgrade_menu
		Checksum: 0xA6E1C4B4
		Offset: 0x468
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_cannotammomod(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "cannotAmmoMod", value);
	}

	/*
		Name: setup_clientfields
		Namespace: csr_weapon_upgrade_menu
		Checksum: 0xD2CB957E
		Offset: 0x370
		Size: 0x4C
		Parameters: 1
		Flags: Linked
	*/
	function setup_clientfields(var_52c93aa0)
	{
		cluielem::setup_clientfields("sr_weapon_upgrade_menu");
		cluielem::add_clientfield("cannotAmmoMod", 16000, 1, "int", var_52c93aa0);
	}

	/*
		Name: function_fa582112
		Namespace: csr_weapon_upgrade_menu
		Checksum: 0xAEA28EB7
		Offset: 0x3F0
		Size: 0x40
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
		[[ self ]]->set_data(localclientnum, "cannotAmmoMod", 0);
	}

}

#namespace sr_weapon_upgrade_menu;

/*
	Name: function_873533ca
	Namespace: sr_weapon_upgrade_menu
	Checksum: 0x8C93E2AC
	Offset: 0xC8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_873533ca()
{
	level notify(-2116681697);
}

/*
	Name: register
	Namespace: sr_weapon_upgrade_menu
	Checksum: 0x9D55E2F9
	Offset: 0xE8
	Size: 0x176
	Parameters: 1
	Flags: Linked
*/
function register(var_52c93aa0)
{
	elem = new csr_weapon_upgrade_menu();
	[[ elem ]]->setup_clientfields(var_52c93aa0);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"sr_weapon_upgrade_menu"]))
	{
		level.var_ae746e8f[#"sr_weapon_upgrade_menu"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"sr_weapon_upgrade_menu"]))
	{
		level.var_ae746e8f[#"sr_weapon_upgrade_menu"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"sr_weapon_upgrade_menu"]))
	{
		level.var_ae746e8f[#"sr_weapon_upgrade_menu"] = array(level.var_ae746e8f[#"sr_weapon_upgrade_menu"]);
	}
	level.var_ae746e8f[#"sr_weapon_upgrade_menu"][level.var_ae746e8f[#"sr_weapon_upgrade_menu"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: sr_weapon_upgrade_menu
	Checksum: 0xD2D46173
	Offset: 0x268
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new csr_weapon_upgrade_menu();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: sr_weapon_upgrade_menu
	Checksum: 0xAB7C1ABF
	Offset: 0x2A8
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function open(player)
{
	[[ self ]]->open(player);
}

/*
	Name: close
	Namespace: sr_weapon_upgrade_menu
	Checksum: 0x2C2BB37
	Offset: 0x2D0
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function close(player)
{
	[[ self ]]->close(player);
}

/*
	Name: is_open
	Namespace: sr_weapon_upgrade_menu
	Checksum: 0x71B19878
	Offset: 0x2F8
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: set_cannotammomod
	Namespace: sr_weapon_upgrade_menu
	Checksum: 0xA6BBA6A6
	Offset: 0x320
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_cannotammomod(localclientnum, value)
{
	[[ self ]]->set_cannotammomod(localclientnum, value);
}

