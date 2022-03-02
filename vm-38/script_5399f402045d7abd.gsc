#namespace weapon_utils;

/*
	Name: function_8db8d53f
	Namespace: weapon_utils
	Checksum: 0x48C1C948
	Offset: 0x150
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_8db8d53f()
{
	level notify(483050614);
}

#namespace weapons;

/*
	Name: ispistol
	Namespace: weapons
	Checksum: 0x5027906A
	Offset: 0x170
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
	Checksum: 0xD1ABD740
	Offset: 0x1D8
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
	Checksum: 0x3DD8C412
	Offset: 0x200
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
	Checksum: 0x5429BA7F
	Offset: 0x230
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
	Checksum: 0xA94BE0D8
	Offset: 0x288
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
	Checksum: 0xB544C6C3
	Offset: 0x2D0
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
	Checksum: 0x902AF87B
	Offset: 0x350
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
	Checksum: 0x25CAC6A
	Offset: 0x398
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
	Checksum: 0xFCF1DD0A
	Offset: 0x410
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
	Checksum: 0x20F4358C
	Offset: 0x460
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
	Checksum: 0x6723B85E
	Offset: 0x4A8
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
	Checksum: 0x4C2B605D
	Offset: 0x528
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
	Checksum: 0x5A666550
	Offset: 0x5D0
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

