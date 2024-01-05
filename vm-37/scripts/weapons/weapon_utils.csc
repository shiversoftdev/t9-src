#namespace weapons;

/*
	Name: ispistol
	Namespace: weapons
	Checksum: 0xEFDEB404
	Offset: 0x70
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function ispistol(weapon)
{
	return weapon.weapclass === #"pistol";
}

/*
	Name: isflashorstunweapon
	Namespace: weapons
	Checksum: 0x7E3193A9
	Offset: 0xA0
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function isflashorstunweapon(weapon)
{
	return weapon.isflash || weapon.isstun;
}

/*
	Name: ispunch
	Namespace: weapons
	Checksum: 0x2CBE897B
	Offset: 0xD0
	Size: 0x3E
	Parameters: 1
	Flags: Linked
*/
function ispunch(weapon)
{
	return weapon.type == "melee" && weapon.statname == #"bare_hands";
}

/*
	Name: isknife
	Namespace: weapons
	Checksum: 0xA8653849
	Offset: 0x118
	Size: 0x70
	Parameters: 1
	Flags: None
*/
function isknife(weapon)
{
	return weapon.type == "melee" && (weapon.rootweapon.name == #"knife_loadout" || weapon.rootweapon.name == #"knife_held");
}

/*
	Name: isnonbarehandsmelee
	Namespace: weapons
	Checksum: 0xB23D3D1D
	Offset: 0x190
	Size: 0x46
	Parameters: 1
	Flags: Linked
*/
function isnonbarehandsmelee(weapon)
{
	return weapon.type == "melee" && weapon.rootweapon.name != #"bare_hands";
}

