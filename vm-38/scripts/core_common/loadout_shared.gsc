#namespace loadout_shared;

/*
	Name: function_dc3b704b
	Namespace: loadout_shared
	Checksum: 0xEA5B8AF1
	Offset: 0x90
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_dc3b704b()
{
	level notify(332587434);
}

#namespace loadout;

/*
	Name: is_warlord_perk
	Namespace: loadout
	Checksum: 0xC6A5C016
	Offset: 0xB0
	Size: 0xE
	Parameters: 1
	Flags: Linked
*/
function is_warlord_perk(itemindex)
{
	return false;
}

/*
	Name: is_item_excluded
	Namespace: loadout
	Checksum: 0x1CEF9F30
	Offset: 0xC8
	Size: 0x6E
	Parameters: 1
	Flags: Linked
*/
function is_item_excluded(itemindex)
{
	if(!level.onlinegame)
	{
		return false;
	}
	numexclusions = level.itemexclusions.size;
	for(exclusionindex = 0; exclusionindex < numexclusions; exclusionindex++)
	{
		if(itemindex == level.itemexclusions[exclusionindex])
		{
			return true;
		}
	}
	return false;
}

/*
	Name: getloadoutitemfromddlstats
	Namespace: loadout
	Checksum: 0xF211E132
	Offset: 0x140
	Size: 0x72
	Parameters: 2
	Flags: Linked
*/
function getloadoutitemfromddlstats(customclassnum, loadoutslot)
{
	itemindex = self getloadoutitem(customclassnum, loadoutslot);
	if(is_item_excluded(itemindex) && !is_warlord_perk(itemindex))
	{
		return 0;
	}
	return itemindex;
}

/*
	Name: initweaponattachments
	Namespace: loadout
	Checksum: 0x67BD555F
	Offset: 0x1C0
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function initweaponattachments(weapon)
{
	self.currentweaponstarttime = gettime();
	self.currentweapon = weapon;
}

/*
	Name: isprimarydamage
	Namespace: loadout
	Checksum: 0x594BADE9
	Offset: 0x1F0
	Size: 0x2A
	Parameters: 1
	Flags: Linked
*/
function isprimarydamage(meansofdeath)
{
	return meansofdeath == "MOD_RIFLE_BULLET" || meansofdeath == "MOD_PISTOL_BULLET";
}

/*
	Name: cac_modified_vehicle_damage
	Namespace: loadout
	Checksum: 0xDF11F95A
	Offset: 0x228
	Size: 0x1EA
	Parameters: 6
	Flags: Linked
*/
function cac_modified_vehicle_damage(victim, attacker, damage, meansofdeath, weapon, inflictor)
{
	if(!isdefined(attacker) || !isdefined(damage) || !isplayer(damage))
	{
		return meansofdeath;
	}
	if(!isdefined(meansofdeath) || !isdefined(weapon) || !isdefined(inflictor))
	{
		return meansofdeath;
	}
	old_damage = meansofdeath;
	final_damage = meansofdeath;
	if(damage hasperk(#"specialty_bulletdamage") && isprimarydamage(weapon))
	{
		final_damage = (meansofdeath * (100 + level.cac_bulletdamage_data)) / 100;
		/#
			if(getdvarint(#"scr_perkdebug", 0))
			{
				println(("" + damage.name) + "");
			}
		#/
	}
	else
	{
		final_damage = old_damage;
	}
	/#
		if(getdvarint(#"scr_perkdebug", 0))
		{
			println((((("" + (final_damage / old_damage)) + "") + old_damage) + "") + final_damage);
		}
	#/
	return int(final_damage);
}

/*
	Name: function_3ba6ee5d
	Namespace: loadout
	Checksum: 0xB5CE7DBC
	Offset: 0x420
	Size: 0xB4
	Parameters: 2
	Flags: Linked
*/
function function_3ba6ee5d(weapon, amount)
{
	if(weapon.iscliponly)
	{
		self setweaponammoclip(weapon, amount);
	}
	else
	{
		self setweaponammoclip(weapon, amount);
		diff = amount - self getweaponammoclip(weapon);
		/#
			assert(diff >= 0);
		#/
		self setweaponammostock(weapon, diff);
	}
}

