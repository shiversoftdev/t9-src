#using scripts\core_common\lui_shared.csc;

class class_ec90ce81 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_ec90ce81
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
		Namespace: namespace_ec90ce81
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
		Namespace: namespace_ec90ce81
		Checksum: 0xF3C11441
		Offset: 0x438
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function open(localclientnum)
	{
		namespace_6aaccc24::open(localclientnum);
	}

	/*
		Name: function_5c1bb138
		Namespace: namespace_ec90ce81
		Checksum: 0x52775501
		Offset: 0x3C8
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("sr_weapon_upgrade_menu");
	}

	/*
		Name: function_83d182e9
		Namespace: namespace_ec90ce81
		Checksum: 0xA6E1C4B4
		Offset: 0x468
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_83d182e9(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "cannotAmmoMod", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_ec90ce81
		Checksum: 0xD2CB957E
		Offset: 0x370
		Size: 0x4C
		Parameters: 1
		Flags: Linked
	*/
	function setup_clientfields(var_52c93aa0)
	{
		namespace_6aaccc24::setup_clientfields("sr_weapon_upgrade_menu");
		namespace_6aaccc24::function_da693cbe("cannotAmmoMod", 16000, 1, "int", var_52c93aa0);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_ec90ce81
		Checksum: 0xAEA28EB7
		Offset: 0x3F0
		Size: 0x40
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
		[[ self ]]->function_d7d2fcce(localclientnum, "cannotAmmoMod", 0);
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
	level notify(2116681697);
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
	elem = new class_ec90ce81();
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
	Name: function_5c1bb138
	Namespace: sr_weapon_upgrade_menu
	Checksum: 0xD2D46173
	Offset: 0x268
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_ec90ce81();
	[[ elem ]]->function_5c1bb138();
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
	Name: function_83d182e9
	Namespace: sr_weapon_upgrade_menu
	Checksum: 0xA6BBA6A6
	Offset: 0x320
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_83d182e9(localclientnum, value)
{
	[[ self ]]->function_83d182e9(localclientnum, value);
}

