#using script_7bafaa95bb1b427e;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\weapons_shared.gsc;

#namespace weapons;

/*
	Name: function_effce9c5
	Namespace: weapons
	Checksum: 0x16F8A790
	Offset: 0x90
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_effce9c5()
{
	level notify(1502402270);
}

/*
	Name: function_89f2df9
	Namespace: weapons
	Checksum: 0x9AEF2E4B
	Offset: 0xB0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"weapons", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: weapons
	Checksum: 0x2500669F
	Offset: 0xF8
	Size: 0xC4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!isdefined(level.var_3a0bbaea))
	{
		level.var_3a0bbaea = 1;
	}
	if(getgametypesetting(#"disableweapondrop") || getdvarint(#"hash_37e8c9da26638608", 0))
	{
		level.var_3a0bbaea = 0;
	}
	init_shared();
	if(getdvarint(#"hash_4b9236f918e3e6f3", 0) == 0)
	{
		function_6916626d();
	}
}

/*
	Name: bestweapon_init
	Namespace: weapons
	Checksum: 0x96144296
	Offset: 0x1C8
	Size: 0xE4
	Parameters: 2
	Flags: None
*/
function bestweapon_init(weapon, options)
{
	weapon_data = [];
	weapon_data[#"weapon"] = weapon;
	weapon_data[#"options"] = options;
	weapon_data[#"kill_count"] = 0;
	weapon_data[#"spawned_with"] = 0;
	key = self.pers[#"bestweapon"][weapon.name].size;
	self.pers[#"bestweapon"][weapon.name][key] = weapon_data;
	return key;
}

/*
	Name: bestweapon_find
	Namespace: weapons
	Checksum: 0x9363BC24
	Offset: 0x2B8
	Size: 0x16E
	Parameters: 2
	Flags: None
*/
function bestweapon_find(weapon, options)
{
	if(!isdefined(self.pers[#"bestweapon"]))
	{
		self.pers[#"bestweapon"] = [];
	}
	if(!isdefined(self.pers[#"bestweapon"][weapon.name]))
	{
		self.pers[#"bestweapon"][weapon.name] = [];
	}
	name = weapon.name;
	size = self.pers[#"bestweapon"][name].size;
	for(index = 0; index < size; index++)
	{
		if(self.pers[#"bestweapon"][name][index][#"weapon"] == weapon && self.pers[#"bestweapon"][name][index][#"options"] == options)
		{
			return index;
		}
	}
	return undefined;
}

/*
	Name: bestweapon_get
	Namespace: weapons
	Checksum: 0x42C018BC
	Offset: 0x430
	Size: 0x200
	Parameters: 0
	Flags: None
*/
function bestweapon_get()
{
	most_kills = 0;
	most_spawns = 0;
	if(!isdefined(self.pers[#"bestweapon"]))
	{
		return;
	}
	best_key = 0;
	best_index = 0;
	weapon_keys = getarraykeys(self.pers[#"bestweapon"]);
	for(key_index = 0; key_index < weapon_keys.size; key_index++)
	{
		key = weapon_keys[key_index];
		size = self.pers[#"bestweapon"][key].size;
		for(index = 0; index < size; index++)
		{
			kill_count = self.pers[#"bestweapon"][key][index][#"kill_count"];
			spawned_with = self.pers[#"bestweapon"][key][index][#"spawned_with"];
			if(kill_count > most_kills)
			{
				best_index = index;
				best_key = key;
				most_kills = kill_count;
				most_spawns = spawned_with;
				continue;
			}
			if(kill_count == most_kills && spawned_with > most_spawns)
			{
				best_index = index;
				best_key = key;
				most_kills = kill_count;
				most_spawns = spawned_with;
			}
		}
	}
	return self.pers[#"bestweapon"][best_key][best_index];
}

/*
	Name: showcaseweapon_get
	Namespace: weapons
	Checksum: 0xD4925249
	Offset: 0x638
	Size: 0x1DC
	Parameters: 0
	Flags: None
*/
function showcaseweapon_get()
{
	showcaseweapondata = self getplayershowcaseweapon();
	if(!isdefined(showcaseweapondata))
	{
		return undefined;
	}
	showcase_weapon = [];
	showcase_weapon[#"weapon"] = showcaseweapondata.weapon;
	attachmentnames = [];
	for(index = 0; index < 7; index++)
	{
		attachmentnames[attachmentnames.size] = "none";
	}
	tokenizedattachmentinfo = strtok(showcaseweapondata.attachmentinfo, "+");
	for(index = 0; index < tokenizedattachmentinfo.size; index++)
	{
		attachmentnames[index] = tokenizedattachmentinfo[index];
	}
	camoindex = 0;
	paintjobslot = 15;
	showpaintshop = 0;
	tokenizedweaponrenderoptions = strtok(showcaseweapondata.weaponrenderoptions, ",");
	if(tokenizedweaponrenderoptions.size > 2)
	{
		camoindex = int(tokenizedweaponrenderoptions[0]);
		paintjobslot = int(tokenizedweaponrenderoptions[1]);
		showpaintshop = paintjobslot != 15;
	}
	showcase_weapon[#"options"] = self function_6eff28b5(camoindex, 0, showpaintshop, 1);
	return showcase_weapon;
}

