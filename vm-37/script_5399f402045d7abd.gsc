#namespace weapons;

/*
	Name: ispistol
	Namespace: weapons
	Checksum: 0x98A3AF53
	Offset: 0x150
	Size: 0x5A
	Parameters: 2
	Flags: Linked
*/
function ispistol(weapon, var_d3511cd9)
{
	if(!isdefined(var_d3511cd9))
	{
		var_d3511cd9 = 0;
	}
	if(var_d3511cd9)
	{
		return weapon.weapclass === #"pistol";
	}
	return isdefined(level.side_arm_array[weapon]);
}

/*
	Name: islauncher
	Namespace: weapons
	Checksum: 0x94DF85F5
	Offset: 0x1B8
	Size: 0x20
	Parameters: 1
	Flags: None
*/
function islauncher(weapon)
{
	return weapon.weapclass == "rocketlauncher";
}

/*
	Name: isflashorstunweapon
	Namespace: weapons
	Checksum: 0xE5ABF377
	Offset: 0x1E0
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function isflashorstunweapon(weapon)
{
	return weapon.isflash || weapon.isstun;
}

/*
	Name: isflashorstundamage
	Namespace: weapons
	Checksum: 0x53826BF1
	Offset: 0x210
	Size: 0x50
	Parameters: 2
	Flags: None
*/
function isflashorstundamage(weapon, meansofdeath)
{
	return isflashorstunweapon(weapon) && (meansofdeath == "MOD_GRENADE_SPLASH" || meansofdeath == "MOD_GAS");
}

/*
	Name: ismeleemod
	Namespace: weapons
	Checksum: 0xC79FC969
	Offset: 0x268
	Size: 0x3E
	Parameters: 1
	Flags: Linked
*/
function ismeleemod(mod)
{
	return mod === "MOD_MELEE" || mod === "MOD_MELEE_WEAPON_BUTT" || mod === "MOD_MELEE_ASSASSINATE";
}

/*
	Name: isexplosivedamage
	Namespace: weapons
	Checksum: 0xC2681079
	Offset: 0x2B0
	Size: 0x74
	Parameters: 1
	Flags: Linked
*/
function isexplosivedamage(meansofdeath)
{
	switch(meansofdeath)
	{
		case "mod_explosive":
		case "mod_grenade":
		case "mod_projectile":
		case "mod_grenade_splash":
		case "mod_projectile_splash":
		{
			return true;
		}
	}
	return false;
}

/*
	Name: ispunch
	Namespace: weapons
	Checksum: 0x5F553F4
	Offset: 0x330
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
	Checksum: 0xA9CDBF4A
	Offset: 0x378
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
	Checksum: 0x62584E74
	Offset: 0x3F0
	Size: 0x46
	Parameters: 1
	Flags: Linked
*/
function isnonbarehandsmelee(weapon)
{
	return weapon.type == "melee" && weapon.rootweapon.name != #"bare_hands";
}

/*
	Name: isbulletdamage
	Namespace: weapons
	Checksum: 0x9C5FA8F4
	Offset: 0x440
	Size: 0x3E
	Parameters: 1
	Flags: Linked
*/
function isbulletdamage(meansofdeath)
{
	return meansofdeath == "MOD_RIFLE_BULLET" || meansofdeath == "MOD_PISTOL_BULLET" || meansofdeath == "MOD_HEAD_SHOT";
}

/*
	Name: isfiredamage
	Namespace: weapons
	Checksum: 0xE5F9A2F6
	Offset: 0x488
	Size: 0x78
	Parameters: 2
	Flags: None
*/
function isfiredamage(weapon, meansofdeath)
{
	if(weapon.doesfiredamage && (meansofdeath == "MOD_BURNED" || meansofdeath == "MOD_GRENADE" || meansofdeath == "MOD_GRENADE_SPLASH" || meansofdeath == "MOD_DOT"))
	{
		return true;
	}
	return false;
}

/*
	Name: function_a9a8aed8
	Namespace: weapons
	Checksum: 0x20F114FD
	Offset: 0x508
	Size: 0x9C
	Parameters: 1
	Flags: None
*/
function function_a9a8aed8(primaryoffhand)
{
	if(primaryoffhand.gadget_type == 0)
	{
		if(!self hasweapon(level.var_34d27b26))
		{
			self giveweapon(level.var_34d27b26);
		}
	}
	else if(self hasweapon(level.var_34d27b26))
	{
		self takeweapon(level.var_34d27b26);
	}
}

/*
	Name: isheadshot
	Namespace: weapons
	Checksum: 0xB57E8D17
	Offset: 0x5B0
	Size: 0x80
	Parameters: 3
	Flags: Linked
*/
function isheadshot(weapon, shitloc, smeansofdeath)
{
	if(weapon.var_dd7bbf23)
	{
		return false;
	}
	if(ismeleemod(smeansofdeath))
	{
		return false;
	}
	if(isdefined(shitloc) && (shitloc == "head" || shitloc == "helmet"))
	{
		return true;
	}
	return false;
}

