#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace namespace_7f22227a;

/*
	Name: function_e76e6429
	Namespace: namespace_7f22227a
	Checksum: 0xF3ED2B49
	Offset: 0x80
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_e76e6429()
{
	level notify(271052830);
}

/*
	Name: __init__system__
	Namespace: namespace_7f22227a
	Checksum: 0x6577D329
	Offset: 0xA0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_57d25af0f70db5a0", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_7f22227a
	Checksum: 0x698FC6A3
	Offset: 0xE8
	Size: 0xBC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(util::is_frontend_map())
	{
		return;
	}
	if(currentsessionmode() == 4 || currentsessionmode() == 2)
	{
		return;
	}
	callback::on_connect(&on_player_connect);
	callback::add_callback(#"hash_730d00ef91d71acf", &function_8481733a);
	/#
		level thread function_3dd3f3b6();
	#/
}

/*
	Name: on_player_connect
	Namespace: namespace_7f22227a
	Checksum: 0xE1EC078C
	Offset: 0x1B0
	Size: 0x9C
	Parameters: 0
	Flags: Linked, Private
*/
function private on_player_connect()
{
	if(!isbot(self) || isautocontrolledplayer(self) || is_true(self.pers[#"hash_6dcf8b0dc38e9166"]))
	{
		return;
	}
	self function_293c5838(0);
	self.pers[#"hash_6dcf8b0dc38e9166"] = 1;
}

/*
	Name: function_8481733a
	Namespace: namespace_7f22227a
	Checksum: 0x90DDBD7D
	Offset: 0x258
	Size: 0x1AC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8481733a()
{
	if(!isbot(self) || isautocontrolledplayer(self))
	{
		return;
	}
	if(is_true(level.disablecustomcac) || is_true(level.disableclassselection))
	{
		return;
	}
	if(!isstruct(self.bot) || !isstruct(self.bot.difficulty) || !isarray(self.bot.difficulty.var_ded0efe5) || self.bot.difficulty.var_ded0efe5.size <= 0)
	{
		return;
	}
	var_543fda24 = self.bot.difficulty.var_ded0efe5;
	var_3ea84edb = var_543fda24[randomint(var_543fda24.size)];
	if(isdefined(var_3ea84edb))
	{
		var_3b0cd6f4 = function_d55845e(var_3ea84edb.name);
		if(isdefined(var_3b0cd6f4))
		{
			function_5d3cc643(0, var_3b0cd6f4);
		}
	}
}

/*
	Name: function_293c5838
	Namespace: namespace_7f22227a
	Checksum: 0x4DA78DF7
	Offset: 0x410
	Size: 0xCC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_293c5838(var_87ee1a5d)
{
	loadouts = function_798e35b8();
	if(isstruct(loadouts) && isarray(loadouts.defaultloadouts) && loadouts.defaultloadouts.size > 0)
	{
		defaultindex = randomint(loadouts.defaultloadouts.size);
		self function_6692a2a5(var_87ee1a5d, loadouts.defaultloadouts[defaultindex], loadouts.killstreaks);
	}
}

/*
	Name: function_798e35b8
	Namespace: namespace_7f22227a
	Checksum: 0x61DB9245
	Offset: 0x4E8
	Size: 0x7E
	Parameters: 0
	Flags: Linked, Private
*/
function private function_798e35b8()
{
	sessionmode = currentsessionmode();
	if(sessionmode == 1)
	{
		return getscriptbundle(#"mp_default_loadouts");
	}
	if(sessionmode == 3)
	{
		return getscriptbundle(#"wz_default_loadouts");
	}
	return undefined;
}

/*
	Name: function_6692a2a5
	Namespace: namespace_7f22227a
	Checksum: 0xE9E2C542
	Offset: 0x570
	Size: 0x1C4
	Parameters: 3
	Flags: Linked, Private
*/
function private function_6692a2a5(var_87ee1a5d, loadout, killstreaks)
{
	self function_b4a1d42a(var_87ee1a5d);
	self function_3d2e4133(var_87ee1a5d, loadout.primary, loadout.primaryattachments, &function_29b482e0, &function_9d5e1230);
	self function_3d2e4133(var_87ee1a5d, loadout.secondary, loadout.secondaryattachments, &function_7db40dda, &function_25ac8c68);
	self function_cbd58d72(var_87ee1a5d, loadout.primarygrenade, loadout.var_1c89585f, &function_9a75f033);
	self function_cbd58d72(var_87ee1a5d, loadout.secondarygrenade, loadout.var_285151c1, &function_ac5568db);
	self function_cbd58d72(var_87ee1a5d, loadout.specialgrenade, loadout.var_919cf3d3, &function_493daf47);
	self function_64f67be5(var_87ee1a5d, loadout.talents);
	self function_29b0ec15(var_87ee1a5d, loadout.bonuscards);
	self function_9d82de06(var_87ee1a5d, killstreaks);
}

/*
	Name: function_3d2e4133
	Namespace: namespace_7f22227a
	Checksum: 0x6EB3A70A
	Offset: 0x740
	Size: 0x12A
	Parameters: 5
	Flags: Linked, Private
*/
function private function_3d2e4133(var_87ee1a5d, weaponname, attachments, var_c2575532, var_1b426c77)
{
	if(!isdefined(weaponname) || isitemrestricted(weaponname))
	{
		return;
	}
	self [[var_c2575532]](var_87ee1a5d, weaponname);
	if(isdefined(attachments))
	{
		foreach(attachment in attachments)
		{
			attachmentname = attachment.attachment;
			if(isdefined(attachmentname) && !function_d10c5729(weaponname, attachmentname))
			{
				self [[var_1b426c77]](var_87ee1a5d, attachmentname, i);
			}
		}
	}
}

/*
	Name: function_cbd58d72
	Namespace: namespace_7f22227a
	Checksum: 0x8CEBCEEC
	Offset: 0x878
	Size: 0x6C
	Parameters: 4
	Flags: Linked, Private
*/
function private function_cbd58d72(var_87ee1a5d, grenadename, extragrenade, var_632ae174)
{
	if(!isdefined(grenadename) || isitemrestricted(grenadename))
	{
		return;
	}
	if(!isdefined(extragrenade))
	{
		extragrenade = 0;
	}
	self [[var_632ae174]](var_87ee1a5d, grenadename, extragrenade);
}

/*
	Name: function_64f67be5
	Namespace: namespace_7f22227a
	Checksum: 0x5E90DB1C
	Offset: 0x8F0
	Size: 0xC0
	Parameters: 2
	Flags: Linked, Private
*/
function private function_64f67be5(var_87ee1a5d, talents)
{
	if(!isdefined(talents))
	{
		return;
	}
	foreach(talent in talents)
	{
		talentname = talent.talent;
		if(isdefined(talentname))
		{
			self function_5a385365(var_87ee1a5d, talentname, i);
		}
	}
}

/*
	Name: function_29b0ec15
	Namespace: namespace_7f22227a
	Checksum: 0xCC945C98
	Offset: 0x9B8
	Size: 0xC0
	Parameters: 2
	Flags: Linked, Private
*/
function private function_29b0ec15(var_87ee1a5d, bonuscards)
{
	if(!isdefined(bonuscards))
	{
		return;
	}
	foreach(bonuscard in bonuscards)
	{
		var_9177262a = bonuscard.bonuscard;
		if(isdefined(var_9177262a))
		{
			self function_f9b438ba(var_87ee1a5d, var_9177262a, i);
		}
	}
}

/*
	Name: function_9d82de06
	Namespace: namespace_7f22227a
	Checksum: 0x2A7606F3
	Offset: 0xA80
	Size: 0xD8
	Parameters: 2
	Flags: Linked, Private
*/
function private function_9d82de06(var_87ee1a5d, killstreaks)
{
	if(!isdefined(killstreaks))
	{
		return;
	}
	foreach(killstreak in killstreaks)
	{
		killstreakname = killstreak.killstreak;
		if(isdefined(killstreakname) || isitemrestricted(killstreakname))
		{
			self function_60c5f1d4(var_87ee1a5d, killstreakname, i);
		}
	}
}

/*
	Name: function_d55845e
	Namespace: namespace_7f22227a
	Checksum: 0xEC256FAB
	Offset: 0xB60
	Size: 0x2A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_d55845e(var_581102ed)
{
	if(!isdefined(var_581102ed))
	{
		return undefined;
	}
	return getscriptbundle(var_581102ed);
}

/*
	Name: function_5d3cc643
	Namespace: namespace_7f22227a
	Checksum: 0x7B076AC4
	Offset: 0xB98
	Size: 0x814
	Parameters: 2
	Flags: Linked, Private
*/
function private function_5d3cc643(var_87ee1a5d, var_3b0cd6f4)
{
	self function_b4a1d42a(var_87ee1a5d);
	bonuses = spawnstruct();
	bonuscards = function_20d254c4(var_3b0cd6f4.bonuscards, 6, #"hash_6400e1885e5d8aba");
	self function_73e20080(var_87ee1a5d, bonuscards, 1, bonuses);
	primaryweapons = function_20d254c4(var_3b0cd6f4.primaryweapons, 1, #"hash_5b5f44e15bfa8dee");
	secondaryweapons = function_20d254c4(var_3b0cd6f4.secondaryweapons, 1, #"hash_41674514bd7e81e2");
	var_6c866ac3 = function_ef026df8(var_3b0cd6f4.primaryattachments, #"hash_27073088eb9a1e37");
	var_1084a9e2 = function_ef026df8(var_3b0cd6f4.secondaryattachments, #"hash_1b2fbf16c3b98c7b");
	var_bc1ac364 = 5;
	if(is_true(bonuses.var_e22b188d))
	{
		var_bc1ac364 = 8;
	}
	var_81b9e082 = 0;
	if(is_true(bonuses.var_c38351d8))
	{
		var_81b9e082 = randomint(3);
	}
	switch(var_81b9e082)
	{
		case 1:
		{
			self function_fccfb0af(var_87ee1a5d, primaryweapons, var_6c866ac3, var_bc1ac364, &function_29b482e0, &function_9d5e1230);
			self function_fccfb0af(var_87ee1a5d, primaryweapons, var_6c866ac3, 5, &function_7db40dda, &function_25ac8c68);
			break;
		}
		case 2:
		{
			self function_fccfb0af(var_87ee1a5d, secondaryweapons, var_1084a9e2, var_bc1ac364, &function_29b482e0, &function_9d5e1230);
			self function_fccfb0af(var_87ee1a5d, secondaryweapons, var_1084a9e2, 5, &function_7db40dda, &function_25ac8c68);
			break;
		}
		default:
		{
			self function_fccfb0af(var_87ee1a5d, primaryweapons, var_6c866ac3, var_bc1ac364, &function_29b482e0, &function_9d5e1230);
			self function_fccfb0af(var_87ee1a5d, secondaryweapons, var_1084a9e2, 5, &function_7db40dda, &function_25ac8c68);
			break;
		}
	}
	var_414c7d4d = function_20d254c4(var_3b0cd6f4.var_414c7d4d, 1, #"hash_5c063c13c25c3b6a");
	self function_4426827d(var_87ee1a5d, var_414c7d4d, bonuses.var_1c89585f, &function_9a75f033);
	var_6a79474d = function_20d254c4(var_3b0cd6f4.var_6a79474d, 1, #"hash_60b994f55d1226dd");
	self function_4426827d(var_87ee1a5d, var_6a79474d, 0, &function_ac5568db);
	specialgrenades = function_20d254c4(var_3b0cd6f4.specialgrenades, 1, #"hash_539a0aed726d68e0");
	self function_4426827d(var_87ee1a5d, specialgrenades, 0, &function_493daf47);
	var_378cddbe = function_20d254c4(var_3b0cd6f4.var_378cddbe, 5, #"hash_7e8686a7207f1d0f");
	var_455c795d = function_20d254c4(var_3b0cd6f4.var_455c795d, 5, #"hash_7e8687a7207f1ec2");
	var_4c2986fb = function_20d254c4(var_3b0cd6f4.var_4c2986fb, 5, #"hash_7e8688a7207f2075");
	if(is_true(bonuses.var_65dd1449))
	{
		alltalents = arraycombine(var_378cddbe, var_455c795d);
		alltalents = arraycombine(alltalents, var_4c2986fb);
		self function_db9633ae(var_87ee1a5d, alltalents, 0, &function_5a385365);
		self function_db9633ae(var_87ee1a5d, alltalents, 1, &function_5a385365);
		self function_db9633ae(var_87ee1a5d, alltalents, 2, &function_5a385365);
	}
	else
	{
		if(is_true(bonuses.extraperks))
		{
			self function_db9633ae(var_87ee1a5d, var_378cddbe, 0, &function_5a385365);
			self function_db9633ae(var_87ee1a5d, var_378cddbe, 1, &function_5a385365);
			self function_db9633ae(var_87ee1a5d, var_455c795d, 2, &function_5a385365);
			self function_db9633ae(var_87ee1a5d, var_455c795d, 3, &function_5a385365);
			self function_db9633ae(var_87ee1a5d, var_4c2986fb, 4, &function_5a385365);
			self function_db9633ae(var_87ee1a5d, var_4c2986fb, 5, &function_5a385365);
		}
		else
		{
			self function_db9633ae(var_87ee1a5d, var_378cddbe, 0, &function_5a385365);
			self function_db9633ae(var_87ee1a5d, var_455c795d, 1, &function_5a385365);
			self function_db9633ae(var_87ee1a5d, var_4c2986fb, 2, &function_5a385365);
		}
	}
	killstreaks = function_20d254c4(var_3b0cd6f4.killstreaks, 1, #"hash_510ea418ef874618");
	for(i = 0; i < 3; i++)
	{
		self function_db9633ae(var_87ee1a5d, killstreaks, i, &function_60c5f1d4);
	}
}

/*
	Name: function_fccfb0af
	Namespace: namespace_7f22227a
	Checksum: 0x303F03BE
	Offset: 0x13B8
	Size: 0x2A0
	Parameters: 6
	Flags: Linked, Private
*/
function private function_fccfb0af(var_87ee1a5d, &weaponnames, var_38e0e278, count, var_c2575532, var_1b426c77)
{
	weaponname = function_ec884214(weaponnames);
	if(!isdefined(weaponname))
	{
		return;
	}
	if(!self [[var_c2575532]](var_87ee1a5d, weaponname))
	{
		return;
	}
	var_c1b02801 = [];
	foreach(groupname, attachments in var_38e0e278)
	{
		if(groupname != #"none")
		{
			var_c1b02801[var_c1b02801.size] = groupname;
		}
	}
	var_b8a59e38 = 0;
	var_41a600fd = 0;
	while(var_b8a59e38 < count && var_c1b02801.size > 0)
	{
		groupindex = randomint(var_c1b02801.size);
		groupname = var_c1b02801[groupindex];
		attachments = var_38e0e278[groupname];
		attachment = self function_ec884214(attachments);
		if(function_d10c5729(weaponname, attachment))
		{
			if(attachments.size <= 0)
			{
				arrayremoveindex(var_c1b02801, groupindex, 0);
			}
			continue;
		}
		attachmentindex = var_b8a59e38;
		if(groupname == #"optic")
		{
			attachmentindex = 0;
		}
		else if(!var_41a600fd)
		{
			attachmentindex++;
		}
		if(self [[var_1b426c77]](var_87ee1a5d, attachment, attachmentindex))
		{
			var_b8a59e38++;
			var_41a600fd = var_41a600fd | groupname == #"optic";
			arrayremoveindex(var_c1b02801, groupindex, 0);
		}
		else if(attachments.size <= 0)
		{
			arrayremoveindex(var_c1b02801, groupindex, 0);
		}
	}
}

/*
	Name: function_4426827d
	Namespace: namespace_7f22227a
	Checksum: 0x2AEC9D15
	Offset: 0x1660
	Size: 0x72
	Parameters: 4
	Flags: Linked, Private
*/
function private function_4426827d(var_87ee1a5d, &var_4e165b9c, extragrenade, var_632ae174)
{
	grenadename = function_ec884214(var_4e165b9c);
	if(!isdefined(grenadename))
	{
		return;
	}
	if(!isdefined(extragrenade))
	{
		extragrenade = 0;
	}
	self [[var_632ae174]](var_87ee1a5d, grenadename, extragrenade);
}

/*
	Name: function_db9633ae
	Namespace: namespace_7f22227a
	Checksum: 0xED540A07
	Offset: 0x16E0
	Size: 0x64
	Parameters: 4
	Flags: Linked, Private
*/
function private function_db9633ae(var_87ee1a5d, &var_1f96cb8e, itemindex, var_9fe65064)
{
	name = function_ec884214(var_1f96cb8e);
	if(!isdefined(name))
	{
		return;
	}
	self [[var_9fe65064]](var_87ee1a5d, name, itemindex);
}

/*
	Name: function_73e20080
	Namespace: namespace_7f22227a
	Checksum: 0x9B1B7295
	Offset: 0x1750
	Size: 0xB0
	Parameters: 4
	Flags: Linked, Private
*/
function private function_73e20080(var_87ee1a5d, &var_44518c47, count, bonuses)
{
	var_b8a59e38 = 0;
	while(var_b8a59e38 < count && var_44518c47.size > 0)
	{
		bonuscard = function_ec884214(var_44518c47);
		if(self function_f9b438ba(var_87ee1a5d, bonuscard, var_b8a59e38))
		{
			var_b8a59e38++;
			function_13aa0d3(bonuscard, bonuses);
		}
	}
}

/*
	Name: function_13aa0d3
	Namespace: namespace_7f22227a
	Checksum: 0x482B43D8
	Offset: 0x1808
	Size: 0xB2
	Parameters: 2
	Flags: Linked, Private
*/
function private function_13aa0d3(bonuscard, bonuses)
{
	switch(bonuscard)
	{
		case "hash_44e17bf715d7ac82":
		{
			bonuses.var_1c89585f = 1;
			break;
		}
		case "hash_639ebbcda56447e7":
		{
			bonuses.var_c38351d8 = 1;
			bonuses.var_3f5d0ded = 1;
			break;
		}
		case "bonuscard_primary_gunfighter":
		{
			bonuses.var_e22b188d = 1;
			break;
		}
		case "hash_4c417275f7523978":
		{
			bonuses.extraperks = 1;
			break;
		}
	}
}

/*
	Name: function_20d254c4
	Namespace: namespace_7f22227a
	Checksum: 0xE3618EBB
	Offset: 0x18C8
	Size: 0x22A
	Parameters: 3
	Flags: Linked, Private
*/
function private function_20d254c4(var_543fda24, var_e91f2e90, overridedvar)
{
	if(!isdefined(overridedvar))
	{
		overridedvar = undefined;
	}
	/#
		if(isdefined(overridedvar))
		{
			dvarstr = getdvarstring(overridedvar, "");
			if(dvarstr == #"none")
			{
				return [];
			}
			names = strtok(dvarstr, "");
			if(names.size > 0)
			{
				return names;
			}
		}
	#/
	if(!isdefined(var_543fda24))
	{
		return [];
	}
	names = [];
	foreach(item in var_543fda24)
	{
		if(!isdefined(item.name))
		{
			names[names.size] = #"none";
			continue;
		}
		if(function_f83425a6(item.name) && !isitemrestricted(item.name))
		{
			itemindex = getitemindexfromref(item.name);
			if(itemindex > 0)
			{
				iteminfo = getunlockableiteminfofromindex(itemindex, var_e91f2e90);
				if(!is_true(iteminfo.hideinmenu))
				{
					names[names.size] = item.name;
				}
			}
		}
	}
	return names;
}

/*
	Name: function_ec884214
	Namespace: namespace_7f22227a
	Checksum: 0x745A4946
	Offset: 0x1B00
	Size: 0x70
	Parameters: 1
	Flags: Linked, Private
*/
function private function_ec884214(&names)
{
	if(names.size <= 0)
	{
		return undefined;
	}
	i = randomint(names.size);
	name = names[i];
	arrayremoveindex(names, i);
	return name;
}

/*
	Name: function_ef026df8
	Namespace: namespace_7f22227a
	Checksum: 0x6C672A02
	Offset: 0x1B78
	Size: 0x1BC
	Parameters: 2
	Flags: Linked, Private
*/
function private function_ef026df8(attachments, overridedvar)
{
	if(!isdefined(overridedvar))
	{
		overridedvar = undefined;
	}
	/#
		if(isdefined(overridedvar))
		{
			dvarstr = getdvarstring(overridedvar, "");
			if(dvarstr == #"none")
			{
				return [];
			}
			names = strtok(dvarstr, "");
			if(names.size > 0)
			{
				attachments = names;
			}
		}
	#/
	if(!isdefined(attachments))
	{
		return [];
	}
	names = strtok(attachments, " ");
	groups = [];
	foreach(name in names)
	{
		groupname = function_788fb3bd(name);
		if(isdefined(groupname))
		{
			if(!isdefined(groups[groupname]))
			{
				groups[groupname] = [];
			}
			group = groups[groupname];
			group[group.size] = name;
		}
	}
	return groups;
}

/*
	Name: function_3dd3f3b6
	Namespace: namespace_7f22227a
	Checksum: 0xDF5410AD
	Offset: 0x1D40
	Size: 0x54A
	Parameters: 0
	Flags: Private
*/
function private function_3dd3f3b6()
{
	/#
		level endon(#"game_ended");
		var_ec9c0769 = [#"killstreak":4, #"bonuscard":3, #"talent":6];
		while(true)
		{
			slot = getdvarstring(#"hash_601d0ce91dfa4b22", "");
			if(slot == "")
			{
				waitframe(1);
				continue;
			}
			bots = function_b16926ea();
			teamcounts = [];
			foreach(bot in bots)
			{
				if(!isdefined(level.teams[bot.team]))
				{
					continue;
				}
				slotcount = teamcounts[bot.team];
				if(!isdefined(slotcount))
				{
					slotcount = [];
					teamcounts[bot.team] = slotcount;
				}
				var_4deb6126 = var_ec9c0769[slot];
				if(isdefined(var_4deb6126))
				{
					for(i = 1; i <= var_4deb6126; i++)
					{
						var_bed036f1 = slot + i;
						itemname = bot function_b958b70d(0, var_bed036f1);
						if(!isdefined(slotcount[var_bed036f1][itemname]))
						{
							slotcount[var_bed036f1][itemname] = 0;
						}
						slotcount[var_bed036f1][itemname]++;
					}
					continue;
				}
				itemname = bot function_b958b70d(0, slot);
				if(!isdefined(slotcount[slot][itemname]))
				{
					slotcount[slot][itemname] = 0;
				}
				slotcount[slot][itemname]++;
			}
			x = 30;
			foreach(slotcount in teamcounts)
			{
				y = 30;
				debug2dtext((x, y, 0), function_9e72a96(team), undefined, undefined, undefined, 1);
				y = y + 22;
				x = x + 20;
				foreach(var_1f96cb8e in slotcount)
				{
					debug2dtext((x, y, 0), function_9e72a96(slot), undefined, undefined, undefined, 1);
					y = y + 22;
					x = x + 20;
					foreach(count in var_1f96cb8e)
					{
						debug2dtext((x, y, 0), (function_9e72a96(itemname) + "") + count, undefined, undefined, undefined, 1);
						y = y + 22;
					}
					x = x - 20;
				}
				x = x - 20;
				x = x + 300;
			}
			waitframe(1);
		}
	#/
}

