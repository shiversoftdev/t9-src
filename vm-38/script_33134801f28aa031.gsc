#namespace weapon_utils;

/*
	Name: function_f808455d
	Namespace: weapon_utils
	Checksum: 0x7B77F173
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_f808455d()
{
	level notify(842496780);
}

#namespace weapons;

/*
	Name: ispistol
	Namespace: weapons
	Checksum: 0xCAABB505
	Offset: 0x90
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
	Checksum: 0xE7CA02B4
	Offset: 0xC0
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
	Checksum: 0xF0412BA8
	Offset: 0xF0
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
	Checksum: 0x82852BB
	Offset: 0x138
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
	Checksum: 0xE978B410
	Offset: 0x1B0
	Size: 0x46
	Parameters: 1
	Flags: Linked
*/
function isnonbarehandsmelee(weapon)
{
	return weapon.type == "melee" && weapon.rootweapon.name != #"bare_hands";
}

