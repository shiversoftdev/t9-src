#using scripts\abilities\ability_player.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace ability_util;

/*
	Name: gadget_is_type
	Namespace: ability_util
	Checksum: 0x27CA02EA
	Offset: 0x88
	Size: 0x58
	Parameters: 2
	Flags: Linked
*/
function gadget_is_type(slot, type)
{
	if(!isdefined(self._gadgets_player) || !isdefined(self._gadgets_player[slot]))
	{
		return 0;
	}
	return self._gadgets_player[slot].gadget_type == type;
}

/*
	Name: gadget_slot_for_type
	Namespace: ability_util
	Checksum: 0x713E5139
	Offset: 0xE8
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function gadget_slot_for_type(type)
{
	invalid = 3;
	for(i = 0; i < 3; i++)
	{
		if(!self gadget_is_type(i, type))
		{
			continue;
		}
		return i;
	}
	return invalid;
}

/*
	Name: gadget_combat_efficiency_enabled
	Namespace: ability_util
	Checksum: 0xB77FACE1
	Offset: 0x160
	Size: 0x1A
	Parameters: 0
	Flags: Linked
*/
function gadget_combat_efficiency_enabled()
{
	if(isdefined(self._gadget_combat_efficiency))
	{
		return self._gadget_combat_efficiency;
	}
	return 0;
}

/*
	Name: function_43cda488
	Namespace: ability_util
	Checksum: 0x5B79481E
	Offset: 0x188
	Size: 0xC2
	Parameters: 0
	Flags: None
*/
function function_43cda488()
{
	if(isdefined(self.team))
	{
		teammates = getplayers(self.team);
		foreach(player in teammates)
		{
			if(player gadget_combat_efficiency_enabled())
			{
				return true;
			}
		}
	}
	return false;
}

/*
	Name: function_f71ec759
	Namespace: ability_util
	Checksum: 0xC822EFBA
	Offset: 0x258
	Size: 0x10C
	Parameters: 2
	Flags: None
*/
function function_f71ec759(&suppliers, var_5ce08260)
{
	if(isdefined(self.team))
	{
		teammates = getplayers(self.team);
		foreach(teammate in teammates)
		{
			if(!isdefined(teammate))
			{
				continue;
			}
			if(teammate == self && var_5ce08260)
			{
				continue;
			}
			if(teammate gadget_combat_efficiency_enabled())
			{
				suppliers[teammate getentitynumber()] = teammate;
			}
		}
	}
}

/*
	Name: gadget_combat_efficiency_power_drain
	Namespace: ability_util
	Checksum: 0x870E4A3C
	Offset: 0x370
	Size: 0x8C
	Parameters: 1
	Flags: None
*/
function gadget_combat_efficiency_power_drain(score)
{
	powerchange = -1 * score * getdvarfloat(#"scr_combat_efficiency_power_loss_scalar", 0);
	slot = gadget_slot_for_type(12);
	if(slot != 3)
	{
		self gadgetpowerchange(slot, powerchange);
	}
}

/*
	Name: function_e35551d6
	Namespace: ability_util
	Checksum: 0xC84A0B5
	Offset: 0x408
	Size: 0xC0
	Parameters: 0
	Flags: None
*/
function function_e35551d6()
{
	a_weaponlist = self getweaponslist();
	foreach(weapon in a_weaponlist)
	{
		if(isdefined(weapon) && weapon.isgadget)
		{
			self takeweapon(weapon);
		}
	}
}

/*
	Name: ability_give
	Namespace: ability_util
	Checksum: 0xBEAEE5F0
	Offset: 0x4D0
	Size: 0x44
	Parameters: 1
	Flags: None
*/
function ability_give(weapon_name)
{
	weapon = getweapon(weapon_name);
	self giveweapon(weapon);
}

/*
	Name: is_weapon_gadget
	Namespace: ability_util
	Checksum: 0x699F249D
	Offset: 0x520
	Size: 0x1A
	Parameters: 1
	Flags: Linked
*/
function is_weapon_gadget(weapon)
{
	return weapon.gadget_type != 0;
}

/*
	Name: gadget_power_reset
	Namespace: ability_util
	Checksum: 0x51B8B966
	Offset: 0x548
	Size: 0xE4
	Parameters: 1
	Flags: None
*/
function gadget_power_reset(gadgetweapon)
{
	if(isdefined(gadgetweapon))
	{
		slot = self gadgetgetslot(gadgetweapon);
		if(slot >= 0 && slot < 3)
		{
			self gadgetpowerreset(slot);
			self gadgetcharging(slot, 1);
		}
	}
	else
	{
		for(slot = 0; slot < 3; slot++)
		{
			self gadgetpowerreset(slot);
			self gadgetcharging(slot, 1);
		}
	}
}

/*
	Name: function_36a15b60
	Namespace: ability_util
	Checksum: 0x63AA30FF
	Offset: 0x638
	Size: 0xD4
	Parameters: 1
	Flags: Linked
*/
function function_36a15b60(gadgetweapon)
{
	if(isdefined(gadgetweapon))
	{
		slot = self gadgetgetslot(gadgetweapon);
		if(slot >= 0 && slot < 3)
		{
			self gadgetpowerset(slot, 100);
			self gadgetcharging(slot, 0);
		}
	}
	else
	{
		for(slot = 0; slot < 3; slot++)
		{
			self gadgetpowerset(slot, 100);
			self gadgetcharging(slot, 0);
		}
	}
}

/*
	Name: function_1a38f0b0
	Namespace: ability_util
	Checksum: 0x622C4434
	Offset: 0x718
	Size: 0xAC
	Parameters: 1
	Flags: Linked
*/
function function_1a38f0b0(gadgetweapon)
{
	if(isdefined(gadgetweapon))
	{
		slot = self gadgetgetslot(gadgetweapon);
		if(isdefined(slot) && slot >= 0 && slot < 3)
		{
			self function_820a63e9(slot, 0);
		}
	}
	else
	{
		for(slot = 0; slot < 3; slot++)
		{
			self function_820a63e9(slot, 0);
		}
	}
}

/*
	Name: function_e8aa75b8
	Namespace: ability_util
	Checksum: 0x58382A29
	Offset: 0x7D0
	Size: 0xE4
	Parameters: 1
	Flags: Linked
*/
function function_e8aa75b8(gadgetweapon)
{
	if(isdefined(gadgetweapon))
	{
		slot = self gadgetgetslot(gadgetweapon);
		if(slot >= 0 && slot < 3)
		{
			self gadgetpowerreset(slot);
			self function_820a63e9(slot, 1);
		}
	}
	else
	{
		for(slot = 0; slot < 3; slot++)
		{
			self gadgetpowerreset(slot);
			self function_820a63e9(slot, 1);
		}
	}
}

/*
	Name: function_46b37314
	Namespace: ability_util
	Checksum: 0xD21D8F7D
	Offset: 0x8C0
	Size: 0xA4
	Parameters: 1
	Flags: None
*/
function function_46b37314(fill_power)
{
	if(isdefined(self.playerrole) && isdefined(self.playerrole.var_a7e7cb46))
	{
		gadget_weapon = getweapon(self.playerrole.var_a7e7cb46);
		if(isdefined(gadget_weapon))
		{
			self function_1a38f0b0(gadget_weapon);
			if(is_true(fill_power))
			{
				self function_36a15b60(gadget_weapon);
			}
		}
	}
}

/*
	Name: function_ffd29673
	Namespace: ability_util
	Checksum: 0x354A22A
	Offset: 0x970
	Size: 0xA4
	Parameters: 1
	Flags: None
*/
function function_ffd29673(fill_power)
{
	if(isdefined(self.playerrole) && isdefined(self.playerrole.var_c21d61e9))
	{
		gadget_weapon = getweapon(self.playerrole.var_c21d61e9);
		if(isdefined(gadget_weapon))
		{
			self function_1a38f0b0(gadget_weapon);
			if(is_true(fill_power))
			{
				self function_36a15b60(gadget_weapon);
			}
		}
	}
}

/*
	Name: function_b6d7e7e0
	Namespace: ability_util
	Checksum: 0x73D8D4C0
	Offset: 0xA20
	Size: 0xA4
	Parameters: 1
	Flags: None
*/
function function_b6d7e7e0(fill_power)
{
	if(isdefined(self.playerrole) && isdefined(self.playerrole.ultimateweapon))
	{
		gadget_weapon = getweapon(self.playerrole.ultimateweapon);
		if(isdefined(gadget_weapon))
		{
			self function_1a38f0b0(gadget_weapon);
			if(is_true(fill_power))
			{
				self function_36a15b60(gadget_weapon);
			}
		}
	}
}

/*
	Name: function_e5c7425d
	Namespace: ability_util
	Checksum: 0x5E7BA969
	Offset: 0xAD0
	Size: 0x6C
	Parameters: 0
	Flags: None
*/
function function_e5c7425d()
{
	if(isdefined(self.playerrole) && isdefined(self.playerrole.var_a7e7cb46))
	{
		gadget_weapon = getweapon(self.playerrole.var_a7e7cb46);
		if(isdefined(gadget_weapon))
		{
			self function_e8aa75b8(gadget_weapon);
		}
	}
}

/*
	Name: function_2bf97041
	Namespace: ability_util
	Checksum: 0x726C1D40
	Offset: 0xB48
	Size: 0x6C
	Parameters: 0
	Flags: None
*/
function function_2bf97041()
{
	if(isdefined(self.playerrole) && isdefined(self.playerrole.var_c21d61e9))
	{
		gadget_weapon = getweapon(self.playerrole.var_c21d61e9);
		if(isdefined(gadget_weapon))
		{
			self function_e8aa75b8(gadget_weapon);
		}
	}
}

/*
	Name: function_791aef0d
	Namespace: ability_util
	Checksum: 0x7774AE0A
	Offset: 0xBC0
	Size: 0x6C
	Parameters: 0
	Flags: None
*/
function function_791aef0d()
{
	if(isdefined(self.playerrole) && isdefined(self.playerrole.ultimateweapon))
	{
		gadget_weapon = getweapon(self.playerrole.ultimateweapon);
		if(isdefined(gadget_weapon))
		{
			self function_e8aa75b8(gadget_weapon);
		}
	}
}

/*
	Name: gadget_reset
	Namespace: ability_util
	Checksum: 0xD5A916A
	Offset: 0xC38
	Size: 0x654
	Parameters: 5
	Flags: None
*/
function gadget_reset(gadgetweapon, changedclass, roundbased, firstround, changedspecialist)
{
	if(gadgetweapon.gadget_type == 0)
	{
		return;
	}
	if(gadgetweapon.gadget_powerusetype == #"ammo")
	{
		return;
	}
	slot = self gadgetgetslot(gadgetweapon);
	if(slot >= 0 && slot < 3)
	{
		if(isdefined(self.pers[#"held_gadgets_power"]) && isdefined(self.pers[#"held_gadgets_power"][gadgetweapon]))
		{
			self gadgetpowerset(slot, self.pers[#"held_gadgets_power"][gadgetweapon]);
		}
		else
		{
			if(isdefined(self.pers[#"held_gadgets_power"]) && isdefined(self.pers[#"thiefweapon"]) && isdefined(self.pers[#"held_gadgets_power"][self.pers[#"thiefweapon"]]))
			{
				self gadgetpowerset(slot, self.pers[#"held_gadgets_power"][self.pers[#"thiefweapon"]]);
			}
			else if(isdefined(self.pers[#"held_gadgets_power"]) && isdefined(self.pers[#"rouletteweapon"]) && isdefined(self.pers[#"held_gadgets_power"][self.pers[#"rouletteweapon"]]))
			{
				self gadgetpowerset(slot, self.pers[#"held_gadgets_power"][self.pers[#"rouletteweapon"]]);
			}
		}
		if(isdefined(self.pers[#"hash_7a954c017d693f69"]) && isdefined(self.pers[#"hash_7a954c017d693f69"][gadgetweapon]))
		{
			self function_19ed70ca(slot, self.pers[#"hash_7a954c017d693f69"][gadgetweapon]);
		}
		isfirstspawn = (isdefined(self.firstspawn) ? self.firstspawn : 1);
		resetonclasschange = changedclass && gadgetweapon.gadget_power_reset_on_class_change;
		resetonfirstround = isfirstspawn && (!roundbased || firstround);
		resetonroundswitch = roundbased && !firstround && gadgetweapon.gadget_power_reset_on_round_switch;
		resetonteamchanged = !isfirstspawn && is_true(self.switchedteamsresetgadgets) && gadgetweapon.gadget_power_reset_on_team_change;
		var_1a2cf487 = changedspecialist && getdvarint(#"hash_256144ebda864b87", 0) && (!(is_true(level.ingraceperiod) && !is_true(self.hasdonecombat)));
		var_9468eb59 = is_true(self.switchedteamsresetgadgets) && getdvarint(#"hash_8351525729015ab", 0);
		deployed = 0;
		if(isdefined(self.pers[#"hash_68cdf8807cfaabff"]) && is_true(self.pers[#"hash_68cdf8807cfaabff"][gadgetweapon]))
		{
			if(gadgetweapon.var_7b5016a7 || !changedclass && !isfirstspawn)
			{
				deployed = 1;
				self function_ac25fc1f(slot, gadgetweapon);
			}
		}
		if(var_1a2cf487 || var_9468eb59)
		{
			self gadgetpowerset(slot, 0);
			self.pers[#"herogadgetnotified"][slot] = 0;
			if(!deployed)
			{
				self gadgetcharging(slot, 1);
			}
		}
		else if(resetonclasschange || resetonfirstround || resetonroundswitch || resetonteamchanged)
		{
			self gadgetpowerreset(slot, isfirstspawn);
			self.pers[#"herogadgetnotified"][slot] = 0;
			if(!deployed)
			{
				self gadgetcharging(slot, 1);
			}
		}
	}
}

/*
	Name: gadget_power_armor_on
	Namespace: ability_util
	Checksum: 0x87C5230
	Offset: 0x1298
	Size: 0x1A
	Parameters: 0
	Flags: None
*/
function gadget_power_armor_on()
{
	return gadget_is_active(3);
}

/*
	Name: gadget_is_active
	Namespace: ability_util
	Checksum: 0xEE4C98E
	Offset: 0x12C0
	Size: 0x6E
	Parameters: 1
	Flags: Linked
*/
function gadget_is_active(gadgettype)
{
	slot = self gadget_slot_for_type(gadgettype);
	if(slot >= 0 && slot < 3)
	{
		if(self util::gadget_is_in_use(slot))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: gadget_has_type
	Namespace: ability_util
	Checksum: 0x8E9A7B22
	Offset: 0x1338
	Size: 0x52
	Parameters: 1
	Flags: None
*/
function gadget_has_type(gadgettype)
{
	slot = self gadget_slot_for_type(gadgettype);
	if(slot >= 0 && slot < 3)
	{
		return true;
	}
	return false;
}

/*
	Name: aoe_friendlies
	Namespace: ability_util
	Checksum: 0x97990206
	Offset: 0x1398
	Size: 0x394
	Parameters: 2
	Flags: None
*/
function aoe_friendlies(weapon, aoe)
{
	self endon(#"disconnect", aoe.aoe_think_singleton_event);
	start_time = gettime();
	end_time = start_time + aoe.duration;
	if(!isdefined(self) || !isdefined(self.team))
	{
		return;
	}
	profile_script = getdvarint(#"scr_profile_aoe", 0);
	if(profile_script)
	{
		profile_start_time = util::get_start_time();
		profile_elapsed_times = [];
		extra_profile_time = 1000;
		end_time = end_time + extra_profile_time;
	}
	has_reapply_check = isdefined(aoe.check_reapply_time_func);
	aoe_team = self.team;
	aoe_applied = 0;
	frac = 0;
	while(frac < 1 || aoe_applied > 0)
	{
		settings = getscriptbundle(weapon.customsettings);
		frac = (gettime() - start_time) / aoe.duration;
		if(frac > 1)
		{
			frac = 1;
		}
		radius = settings.cleanseradius;
		aoe_applied = 0;
		if(isdefined(self) && isdefined(self.origin))
		{
			aoe_origin = self.origin;
		}
		friendlies_in_radius = getplayers(aoe_team, aoe_origin, radius);
		foreach(player in friendlies_in_radius)
		{
			if(has_reapply_check && player [[aoe.check_reapply_time_func]](aoe))
			{
				continue;
			}
			if(!isalive(player))
			{
				continue;
			}
			if(!isdefined(aoe.can_apply_aoe_func) || [[aoe.can_apply_aoe_func]](player, aoe.origin))
			{
				[[aoe.apply_aoe_func]](player, weapon, aoe);
				aoe_applied++;
				if(aoe_applied >= aoe.max_applies_per_frame)
				{
					break;
				}
			}
		}
		if(profile_script)
		{
			util::record_elapsed_time(profile_start_time, profile_elapsed_times);
			waitframe(1);
			profile_start_time = util::get_start_time();
		}
		else
		{
			waitframe(1);
		}
	}
	if(profile_script)
	{
		util::note_elapsed_times(profile_elapsed_times, "util aoe friendlies");
	}
}

/*
	Name: aoe_trace_entity
	Namespace: ability_util
	Checksum: 0xEFEEA84B
	Offset: 0x1738
	Size: 0x90
	Parameters: 3
	Flags: None
*/
function aoe_trace_entity(entity, origin, trace_z_offset)
{
	entitypoint = entity.origin + (0, 0, trace_z_offset);
	if(!bullettracepassed(origin, entitypoint, 1, self, undefined, 0, 1))
	{
		return false;
	}
	/#
		thread util::draw_debug_line(origin, entitypoint, 1);
	#/
	return true;
}

/*
	Name: is_hero_weapon
	Namespace: ability_util
	Checksum: 0x4EBEDE2E
	Offset: 0x17D0
	Size: 0x46
	Parameters: 1
	Flags: Linked
*/
function is_hero_weapon(gadgetweapon)
{
	if(gadgetweapon.isheavyweapon || gadgetweapon.issignatureweapon && gadgetweapon.gadget_type == 11)
	{
		return true;
	}
	return false;
}

