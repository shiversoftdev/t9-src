#using scripts\mp_common\gametypes\globallogic_utils.gsc;
#using scripts\weapons\weapons.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\popups_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\loadout_shared.gsc;
#using scripts\killstreaks\killstreaks_util.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using script_4721de209091b1a6;
#using scripts\killstreaks\killstreakrules_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace killstreak_weapons;

/*
	Name: function_b39f970e
	Namespace: killstreak_weapons
	Checksum: 0xF202351D
	Offset: 0x118
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b39f970e()
{
	level notify(1464397558);
}

/*
	Name: init
	Namespace: killstreak_weapons
	Checksum: 0x45DDDBCD
	Offset: 0x138
	Size: 0x44
	Parameters: 0
	Flags: None
*/
function init()
{
	callback::on_spawned(&on_player_spawned);
	setdvar(#"scr_heldkillstreak_penalty", 0);
}

/*
	Name: on_player_spawned
	Namespace: killstreak_weapons
	Checksum: 0x8709D235
	Offset: 0x188
	Size: 0xA4
	Parameters: 0
	Flags: Linked
*/
function on_player_spawned()
{
	self endon(#"disconnect");
	self.firedkillstreakweapon = 0;
	self.usingkillstreakheldweapon = undefined;
	if(!util::isfirstround() && !util::isoneround())
	{
		if(level.roundstartkillstreakdelay > float(globallogic_utils::gettimepassed()) / 1000)
		{
			self thread function_d75d084a();
		}
	}
}

/*
	Name: function_d75d084a
	Namespace: killstreak_weapons
	Checksum: 0xF2A5DF5D
	Offset: 0x238
	Size: 0x1E0
	Parameters: 0
	Flags: Linked
*/
function function_d75d084a()
{
	self endon(#"death");
	while(true)
	{
		currentweapon = self getcurrentweapon();
		waitresult = undefined;
		waitresult = self waittill(#"weapon_change");
		newweapon = waitresult.weapon;
		if(level.roundstartkillstreakdelay < float(globallogic_utils::gettimepassed()) / 1000)
		{
			return;
		}
		if(!killstreaks::is_killstreak_weapon(newweapon))
		{
			wait(0.5);
			continue;
		}
		killstreak = killstreaks::get_killstreak_for_weapon(newweapon);
		if(killstreaks::is_delayable_killstreak(killstreak) && newweapon.iscarriedkillstreak)
		{
			timeleft = int(level.roundstartkillstreakdelay - (float(globallogic_utils::gettimepassed()) / 1000));
			if(!timeleft)
			{
				timeleft = 1;
			}
			self iprintlnbold(#"hash_55a79f95e07a10bc", (" " + timeleft) + " ", #"hash_79a58948c3b976f5");
			self switchtoweapon(currentweapon);
			wait(0.5);
		}
	}
}

/*
	Name: function_82ea8e15
	Namespace: killstreak_weapons
	Checksum: 0x5CCC3F3C
	Offset: 0x420
	Size: 0x66C
	Parameters: 1
	Flags: None
*/
function function_82ea8e15(hardpointtype)
{
	if(!isdefined(hardpointtype))
	{
		return false;
	}
	if(self killstreakrules::iskillstreakallowed(hardpointtype, self.team) == 0)
	{
		self switchtoweapon(self.lastdroppableweapon);
		return false;
	}
	currentweapon = self getcurrentweapon();
	killstreakweapon = killstreaks::get_killstreak_weapon(hardpointtype);
	if(killstreakweapon == level.weaponnone)
	{
		return false;
	}
	level weapons::add_limited_weapon(killstreakweapon, self, 3);
	if(issubstr(hardpointtype, "inventory"))
	{
		isfrominventory = 1;
	}
	else
	{
		isfrominventory = 0;
	}
	currentammo = self getammocount(killstreakweapon);
	if(hardpointtype == "minigun" || hardpointtype == "inventory_minigun" && !is_true(self.minigunstart) || (hardpointtype == "m32" || hardpointtype == "inventory_m32" && !is_true(self.m32start)))
	{
		if(hardpointtype == "minigun" || hardpointtype == "inventory_minigun")
		{
			self.minigunstart = 1;
		}
		else
		{
			self.m32start = 1;
		}
		self namespace_f9b02f80::play_killstreak_start_dialog(hardpointtype, self.team, 1);
		self stats::function_e24eec31(killstreakweapon, #"used", 1);
		level thread popups::displayteammessagetoall(level.killstreaks[hardpointtype].script_bundle.var_667c638e, self);
		self.pers[#"held_killstreak_clip_count"][killstreakweapon] = (killstreakweapon.clipsize > currentammo ? currentammo : killstreakweapon.clipsize);
		if(isfrominventory == 0)
		{
			if(self.pers[#"killstreak_quantity"][killstreakweapon] > 0)
			{
				self.pers[#"held_killstreak_ammo_count"][killstreakweapon] = killstreakweapon.maxammo;
			}
			self killstreaks::function_fa6e0467(killstreakweapon);
		}
	}
	if(hardpointtype == "minigun" || hardpointtype == "inventory_minigun")
	{
		if(!is_true(self.minigunactive))
		{
			killstreak_id = self killstreakrules::killstreakstart(hardpointtype, self.team, 0, 0);
			if(hardpointtype == "inventory_minigun")
			{
				killstreak_id = self.pers[#"killstreak_unique_id"][self.pers[#"killstreak_unique_id"].size - 1];
			}
			self.minigunid = killstreak_id;
			self.minigunactive = 1;
		}
		else
		{
			killstreak_id = self.minigunid;
		}
	}
	else
	{
		if(!is_true(self.m32active))
		{
			killstreak_id = self killstreakrules::killstreakstart(hardpointtype, self.team, 0, 0);
			if(hardpointtype == "inventory_m32")
			{
				killstreak_id = self.pers[#"killstreak_unique_id"][self.pers[#"killstreak_unique_id"].size - 1];
			}
			self.m32id = killstreak_id;
			self.m32active = 1;
		}
		else
		{
			killstreak_id = self.m32id;
		}
	}
	/#
		assert(killstreak_id != -1);
	#/
	self.firedkillstreakweapon = 0;
	self setblockweaponpickup(killstreakweapon, 1);
	if(isfrominventory)
	{
		self setweaponammoclip(killstreakweapon, self.pers[#"held_killstreak_clip_count"][killstreakweapon]);
		self setweaponammostock(killstreakweapon, (self.pers[#"killstreak_ammo_count"][self.pers[#"killstreak_ammo_count"].size - 1]) - self.pers[#"held_killstreak_clip_count"][killstreakweapon]);
	}
	notifystring = "killstreakWeapon_" + killstreakweapon.name;
	self notify(notifystring);
	self thread watchkillstreakweaponswitch(killstreakweapon, killstreak_id, isfrominventory);
	self thread watchkillstreakweapondeath(killstreakweapon, killstreak_id, isfrominventory);
	self thread watchkillstreakroundchange(isfrominventory, killstreak_id);
	self thread watchplayerdeath(killstreakweapon);
	if(isfrominventory)
	{
		self thread watchkillstreakremoval(hardpointtype, killstreak_id);
	}
	self.usingkillstreakheldweapon = 1;
	return false;
}

/*
	Name: usekillstreakweaponfromcrate
	Namespace: killstreak_weapons
	Checksum: 0xD5889576
	Offset: 0xA98
	Size: 0x166
	Parameters: 1
	Flags: Linked
*/
function usekillstreakweaponfromcrate(hardpointtype)
{
	if(!isdefined(hardpointtype))
	{
		return false;
	}
	killstreakweapon = killstreaks::get_killstreak_weapon(hardpointtype);
	if(killstreakweapon == level.weaponnone)
	{
		return false;
	}
	self.firedkillstreakweapon = 0;
	self setblockweaponpickup(killstreakweapon, 1);
	killstreak_id = self killstreakrules::killstreakstart(hardpointtype, self.team, 0, 0);
	/#
		assert(killstreak_id != -1);
	#/
	if(issubstr(hardpointtype, "inventory"))
	{
		isfrominventory = 1;
	}
	else
	{
		isfrominventory = 0;
	}
	self thread watchkillstreakweaponswitch(killstreakweapon, killstreak_id, isfrominventory);
	self thread watchkillstreakweapondeath(killstreakweapon, killstreak_id, isfrominventory);
	if(isfrominventory)
	{
		self thread watchkillstreakremoval(hardpointtype, killstreak_id);
	}
	self.usingkillstreakheldweapon = 1;
	return true;
}

/*
	Name: watchkillstreakweaponswitch
	Namespace: killstreak_weapons
	Checksum: 0x68D8C798
	Offset: 0xC08
	Size: 0x4C4
	Parameters: 3
	Flags: Linked
*/
function watchkillstreakweaponswitch(killstreakweapon, killstreak_id, isfrominventory)
{
	self endon(#"death");
	noneweapon = getweapon(#"none");
	minigunweapon = getweapon(#"minigun");
	miniguninventoryweapon = getweapon(#"inventory_minigun");
	while(true)
	{
		currentweapon = self getcurrentweapon();
		waitresult = undefined;
		waitresult = self waittill(#"weapon_change");
		newweapon = waitresult.weapon;
		if(level.infinalkillcam)
		{
			continue;
		}
		if(newweapon == noneweapon)
		{
			continue;
		}
		currentammo = self getammocount(killstreakweapon);
		currentammoinclip = self getweaponammoclip(killstreakweapon);
		if(isfrominventory && currentammo > 0)
		{
			killstreakindex = self killstreaks::get_killstreak_index_by_id(killstreak_id);
			if(isdefined(killstreakindex))
			{
				self.pers[#"killstreak_ammo_count"][killstreakindex] = currentammo;
				self.pers[#"held_killstreak_clip_count"][killstreakweapon] = currentammoinclip;
			}
		}
		if(killstreaks::is_killstreak_weapon(newweapon) && !newweapon.iscarriedkillstreak)
		{
			continue;
		}
		if(newweapon.isgameplayweapon)
		{
			continue;
		}
		if(newweapon == self.lastnonkillstreakweapon && newweapon.iscarriedkillstreak)
		{
			continue;
		}
		killstreakid = killstreaks::get_top_killstreak_unique_id();
		self.pers[#"held_killstreak_ammo_count"][killstreakweapon] = currentammo;
		self.pers[#"held_killstreak_clip_count"][killstreakweapon] = currentammoinclip;
		if(killstreak_id != -1)
		{
			self notify(#"killstreak_weapon_switch");
		}
		self.firedkillstreakweapon = 0;
		self.usingkillstreakheldweapon = undefined;
		waittillframeend();
		if(currentammo == 0 || self.pers[#"killstreak_quantity"][killstreakweapon] > 0 || (isfrominventory && isdefined(killstreakid) && killstreakid != killstreak_id))
		{
			killstreakrules::killstreakstop(killstreaks::get_killstreak_for_weapon(killstreakweapon), self.team, killstreak_id);
			if(killstreakweapon == miniguninventoryweapon || killstreakweapon == minigunweapon)
			{
				self.minigunstart = 0;
				self.minigunactive = 0;
			}
			else
			{
				self.m32start = 0;
				self.m32active = 0;
			}
			if(self.pers[#"killstreak_quantity"][killstreakweapon] > 0)
			{
				self.pers[#"held_killstreak_ammo_count"][killstreakweapon] = killstreakweapon.maxammo;
				self loadout::function_3ba6ee5d(killstreakweapon, self.pers[#"held_killstreak_ammo_count"][killstreakweapon]);
				self.pers[#"killstreak_quantity"][killstreakweapon]--;
			}
		}
		if(isfrominventory && currentammo == 0)
		{
			self takeweapon(killstreakweapon);
			self killstreaks::remove_used_killstreak(killstreaks::get_killstreak_for_weapon(killstreakweapon), killstreak_id);
			self killstreaks::activate_next();
		}
		break;
	}
}

/*
	Name: watchkillstreakweapondeath
	Namespace: killstreak_weapons
	Checksum: 0x60BBA9D2
	Offset: 0x10D8
	Size: 0x4A6
	Parameters: 3
	Flags: Linked
*/
function watchkillstreakweapondeath(killstreakweapon, killstreak_id, isfrominventory)
{
	self endon(#"disconnect", #"killstreak_weapon_switch");
	if(killstreak_id == -1)
	{
		return;
	}
	oldteam = self.team;
	self waittill(#"death");
	penalty = getdvarfloat(#"scr_heldkillstreak_penalty", 0.5);
	maxammo = killstreakweapon.maxammo;
	currentammo = self getammocount(killstreakweapon);
	currentammoinclip = self getweaponammoclip(killstreakweapon);
	if(self.pers[#"killstreak_quantity"].size == 0)
	{
		currentammo = 0;
		currentammoinclip = 0;
	}
	maxclipsize = killstreakweapon.clipsize;
	newammo = int(currentammo - (maxammo * penalty));
	killstreakid = killstreaks::get_top_killstreak_unique_id();
	if(self.lastnonkillstreakweapon == killstreakweapon)
	{
		if(newammo < 0)
		{
			self.pers[#"held_killstreak_ammo_count"][killstreakweapon] = 0;
			self.pers[#"held_killstreak_clip_count"][killstreakweapon] = 0;
		}
		else
		{
			self.pers[#"held_killstreak_ammo_count"][killstreakweapon] = newammo;
			self.pers[#"held_killstreak_clip_count"][killstreakweapon] = (maxclipsize <= newammo ? maxclipsize : newammo);
		}
	}
	self.usingkillstreakheldweapon = 0;
	killstreaktype = killstreaks::get_killstreak_for_weapon(killstreakweapon);
	if(newammo <= 0 || self.pers[#"killstreak_quantity"][killstreakweapon] > 0 || (isfrominventory && isdefined(killstreakid) && killstreakid != killstreak_id))
	{
		killstreakrules::killstreakstop(killstreaktype, oldteam, killstreak_id);
		if(killstreaktype == "minigun" || killstreaktype == "inventory_minigun")
		{
			self.minigunstart = 0;
			self.minigunactive = 0;
		}
		else
		{
			self.m32start = 0;
			self.m32active = 0;
		}
		if(isdefined(self.pers[#"killstreak_quantity"][killstreakweapon]) && self.pers[#"killstreak_quantity"][killstreakweapon] > 0)
		{
			self.pers[#"held_killstreak_ammo_count"][killstreakweapon] = maxammo;
			self.pers[#"held_killstreak_clip_count"][killstreakweapon] = maxclipsize;
			self killstreaks::function_fa6e0467(killstreakweapon);
			self.pers[#"killstreak_quantity"][killstreakweapon]--;
		}
	}
	if(isfrominventory && newammo <= 0)
	{
		self takeweapon(killstreakweapon);
		self killstreaks::remove_used_killstreak(killstreaktype, killstreak_id);
		self killstreaks::activate_next();
	}
	else if(isfrominventory)
	{
		killstreakindex = self killstreaks::get_killstreak_index_by_id(killstreak_id);
		if(isdefined(killstreakindex))
		{
			self.pers[#"killstreak_ammo_count"][killstreakindex] = self.pers[#"held_killstreak_ammo_count"][killstreakweapon];
		}
	}
}

/*
	Name: watchplayerdeath
	Namespace: killstreak_weapons
	Checksum: 0x79737CE7
	Offset: 0x1588
	Size: 0xBE
	Parameters: 1
	Flags: Linked
*/
function watchplayerdeath(killstreakweapon)
{
	self endon(#"disconnect");
	endonweaponstring = "killstreakWeapon_" + killstreakweapon.name;
	self endon(endonweaponstring);
	self waittill(#"death");
	currentammo = self getammocount(killstreakweapon);
	self.pers[#"held_killstreak_clip_count"][killstreakweapon] = (killstreakweapon.clipsize <= currentammo ? killstreakweapon.clipsize : currentammo);
}

/*
	Name: watchkillstreakremoval
	Namespace: killstreak_weapons
	Checksum: 0x5C4A8F98
	Offset: 0x1650
	Size: 0x116
	Parameters: 2
	Flags: Linked
*/
function watchkillstreakremoval(killstreaktype, killstreak_id)
{
	self endon(#"disconnect", #"death", #"killstreak_weapon_switch");
	waitresult = undefined;
	waitresult = self waittill(#"oldest_killstreak_removed");
	removedkillstreaktype = waitresult.type;
	removed_id = waitresult.id;
	if(killstreaktype == removedkillstreaktype && killstreak_id == removed_id)
	{
		removedkillstreakweapon = killstreaks::get_killstreak_weapon(removedkillstreaktype);
		if(removedkillstreakweapon.name == "inventory_minigun")
		{
			self.minigunstart = 0;
			self.minigunactive = 0;
		}
		else
		{
			self.m32start = 0;
			self.m32active = 0;
		}
	}
}

/*
	Name: watchkillstreakroundchange
	Namespace: killstreak_weapons
	Checksum: 0x7D0FFB60
	Offset: 0x1770
	Size: 0x196
	Parameters: 2
	Flags: Linked
*/
function watchkillstreakroundchange(isfrominventory, killstreak_id)
{
	self endon(#"disconnect", #"death", #"killstreak_weapon_switch");
	self waittill(#"round_ended");
	currentweapon = self getcurrentweapon();
	if(!currentweapon.iscarriedkillstreak)
	{
		return;
	}
	currentammo = self getammocount(currentweapon);
	maxclipsize = currentweapon.clipsize;
	if(isfrominventory && currentammo > 0)
	{
		killstreakindex = self killstreaks::get_killstreak_index_by_id(killstreak_id);
		if(isdefined(killstreakindex))
		{
			self.pers[#"killstreak_ammo_count"][killstreakindex] = currentammo;
			self.pers[#"held_killstreak_clip_count"][currentweapon] = (maxclipsize <= currentammo ? maxclipsize : currentammo);
		}
	}
	else
	{
		self.pers[#"held_killstreak_ammo_count"][currentweapon] = currentammo;
		self.pers[#"held_killstreak_clip_count"][currentweapon] = (maxclipsize <= currentammo ? maxclipsize : currentammo);
	}
}

/*
	Name: checkifswitchableweapon
	Namespace: killstreak_weapons
	Checksum: 0x4EF21853
	Offset: 0x1910
	Size: 0x1FC
	Parameters: 4
	Flags: None
*/
function checkifswitchableweapon(currentweapon, newweapon, killstreakweapon, currentkillstreakid)
{
	switchableweapon = 1;
	topkillstreak = killstreaks::get_top_killstreak();
	killstreakid = killstreaks::get_top_killstreak_unique_id();
	if(!isdefined(killstreakid))
	{
		killstreakid = -1;
	}
	if(self hasweapon(killstreakweapon) && !self getammocount(killstreakweapon))
	{
		switchableweapon = 1;
	}
	else
	{
		if(self.firedkillstreakweapon && newweapon == killstreakweapon && currentweapon.iscarriedkillstreak)
		{
			switchableweapon = 1;
		}
		else
		{
			if(newweapon.isequipment)
			{
				switchableweapon = 1;
			}
			else
			{
				if(isdefined(level.grenade_array[newweapon]))
				{
					switchableweapon = 0;
				}
				else
				{
					if(newweapon.iscarriedkillstreak && currentweapon.iscarriedkillstreak && (!isdefined(currentkillstreakid) || currentkillstreakid != killstreakid))
					{
						switchableweapon = 1;
					}
					else
					{
						if(killstreaks::is_killstreak_weapon(newweapon))
						{
							switchableweapon = 0;
						}
						else
						{
							if(newweapon.isgameplayweapon)
							{
								switchableweapon = 0;
							}
							else
							{
								if(self.firedkillstreakweapon)
								{
									switchableweapon = 1;
								}
								else
								{
									if(self.lastnonkillstreakweapon == killstreakweapon)
									{
										switchableweapon = 0;
									}
									else if(isdefined(topkillstreak) && topkillstreak == killstreakweapon && currentkillstreakid == killstreakid)
									{
										switchableweapon = 0;
									}
								}
							}
						}
					}
				}
			}
		}
	}
	return switchableweapon;
}

/*
	Name: onplayerkilled
	Namespace: killstreak_weapons
	Checksum: 0x29CE1D99
	Offset: 0x1B18
	Size: 0x3F8
	Parameters: 9
	Flags: Linked
*/
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration)
{
	if(!isdefined(self.pers[#"held_killstreak_ammo_count"]))
	{
		return;
	}
	var_e3daecef = getarraykeys(self.pers[#"held_killstreak_ammo_count"]);
	foreach(deathanimduration in var_e3daecef)
	{
		if(!isdefined(deathanimduration))
		{
			continue;
		}
		ammocount = self.pers[#"held_killstreak_ammo_count"][deathanimduration];
		killstreaktype = killstreaks::get_killstreak_for_weapon(deathanimduration);
		bundle = level.killstreaks[killstreaktype].script_bundle;
		if(bundle.var_6f079d9a === 1 && deathanimduration.maxammo == ammocount && ammocount > 0)
		{
			continue;
		}
		var_a24558f6 = ammocount;
		var_c1265b8d = (isdefined(bundle.var_d88d50b8) ? bundle.var_d88d50b8 : 0);
		var_9a1bcbe = int(floor((deathanimduration.maxammo * var_c1265b8d) / 100));
		if(ammocount < var_9a1bcbe)
		{
			ammocount = 0;
		}
		else
		{
			var_3e7b9084 = (isdefined(bundle.var_877cedde) ? bundle.var_877cedde : 0);
			var_6deff896 = int(floor((deathanimduration.maxammo * var_3e7b9084) / 100));
			ammocount = ammocount - var_6deff896;
		}
		if(ammocount < 0)
		{
			ammocount = 0;
		}
		self.pers[#"held_killstreak_ammo_count"][deathanimduration] = ammocount;
		if(var_a24558f6 > 0 && ammocount == 0)
		{
			if(deathanimduration.var_6f41c2a9)
			{
				self killstreaks::remove_used_killstreak(killstreaktype);
			}
			if(!self killstreaks::function_55e3fed6(killstreaktype))
			{
				if(isdefined(level.var_1d971504) && self.currentweapon != deathanimduration)
				{
					[[level.var_1d971504]](psoffsettime, self, deathanimduration);
				}
				killstreakslot = killstreaks::function_a2c375bb(killstreaktype);
				if(isdefined(killstreakslot))
				{
					self function_6bf621ea(#"hash_2e64558432f8b5b2", 2, self getentitynumber(), killstreakslot);
				}
				self thread function_11a9ad5(killstreaktype, deathanimduration);
			}
		}
	}
}

/*
	Name: function_11a9ad5
	Namespace: killstreak_weapons
	Checksum: 0x32CD1D0E
	Offset: 0x1F18
	Size: 0x34
	Parameters: 2
	Flags: Linked
*/
function function_11a9ad5(killstreaktype, weapon)
{
	self killstreaks::function_ea21be29(killstreaktype, weapon, 1);
}

