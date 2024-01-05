#using script_6a0921d005260773;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_8a67e6b6;

/*
	Name: function_897fec4f
	Namespace: namespace_8a67e6b6
	Checksum: 0xD485EFEE
	Offset: 0xB0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_897fec4f()
{
	level notify(817335399);
}

/*
	Name: function_a780da8
	Namespace: namespace_8a67e6b6
	Checksum: 0x81802B32
	Offset: 0xD0
	Size: 0x122
	Parameters: 0
	Flags: Linked
*/
function function_a780da8()
{
	self abilities::cybercom_initentityfields();
	if(!isdefined(self._abilities))
	{
		self._abilities = spawnstruct();
	}
	if(!isdefined(self._abilities.lockon))
	{
		self._abilities.lockon = spawnstruct();
	}
	if(!isdefined(self._abilities.lockon.var_1ce9ea0e))
	{
		self._abilities.lockon.var_1ce9ea0e = [];
	}
	if(!isdefined(self._abilities.lockon.lock_targets))
	{
		self._abilities.lockon.lock_targets = [];
	}
	if(!isdefined(self._abilities.lockon.var_4e8096b0))
	{
		self._abilities.lockon.var_4e8096b0 = 0;
	}
}

/*
	Name: weaponlockwatcher
	Namespace: namespace_8a67e6b6
	Checksum: 0xA9F89CB
	Offset: 0x200
	Size: 0xBC
	Parameters: 6
	Flags: None
*/
function weaponlockwatcher(slot, weapon, maxtargets, var_e08793c0, var_efb1ea62, var_8ff7e677)
{
	function_a780da8();
	if(!isdefined(maxtargets))
	{
		maxtargets = getdvarint(#"scr_max_simlocks", 3);
	}
	/#
		assert(maxtargets <= 5, "");
	#/
	self thread function_4b7f8060(slot, weapon, maxtargets, var_e08793c0, var_efb1ea62, var_8ff7e677);
}

/*
	Name: weaponendlockwatcher
	Namespace: namespace_8a67e6b6
	Checksum: 0x3D59F9A
	Offset: 0x2C8
	Size: 0x66
	Parameters: 1
	Flags: Linked
*/
function weaponendlockwatcher(weapon)
{
	self function_b4c3d402(weapon);
	waittillframeend();
	weapon_lock_clearslots(1);
	self function_92c4b561();
	self notify(#"ccom_stop_lock_on");
}

/*
	Name: function_8c4799
	Namespace: namespace_8a67e6b6
	Checksum: 0x7A2E04AE
	Offset: 0x338
	Size: 0xBC
	Parameters: 1
	Flags: Linked
*/
function function_8c4799(weapon)
{
	self endon(#"death");
	self notify(#"weaponendlockwatcher");
	self endon(#"weaponendlockwatcher", #"ccom_stop_lock_on");
	waitresult = undefined;
	waitresult = self waittill(#"gadget_forced_off");
	if(weapon == waitresult.weapon)
	{
		self weaponendlockwatcher(weapon);
	}
	else
	{
		self thread function_8c4799(weapon);
	}
}

/*
	Name: _lock_fired_watcher
	Namespace: namespace_8a67e6b6
	Checksum: 0xF3BD0BDF
	Offset: 0x400
	Size: 0x1BC
	Parameters: 1
	Flags: Linked, Private
*/
function private _lock_fired_watcher(weapon)
{
	self endon(#"disconnect", #"death", #"ccom_stop_lock_on");
	self waittill(weapon.name + "_fired");
	level notify(#"ccom_lock_fired", {#weapon:weapon, #owner:self});
	foreach(item in self._abilities.lockon.lock_targets)
	{
		if(isdefined(item.target))
		{
			item.target notify(#"ccom_lock_fired", {#weapon:weapon, #owner:self});
			if(isdefined(item.target.lockon_owner) && item.target.lockon_owner == self)
			{
				item.target.lockon_owner = undefined;
			}
		}
	}
	self weaponendlockwatcher(weapon);
}

/*
	Name: _lock_sighttest
	Namespace: namespace_8a67e6b6
	Checksum: 0xFF21B342
	Offset: 0x5C8
	Size: 0x560
	Parameters: 2
	Flags: Linked, Private
*/
function private _lock_sighttest(target, var_4f358117)
{
	if(!isdefined(var_4f358117))
	{
		var_4f358117 = 1;
	}
	eyepos = self geteye();
	if(!isdefined(target))
	{
		return 0;
	}
	if(!isalive(target))
	{
		return 0;
	}
	if(target isragdoll())
	{
		return 0;
	}
	if(!isdefined(target._abilities))
	{
		target._abilities = spawnstruct();
	}
	if(!isdefined(target._abilities.lockon))
	{
		target._abilities.lockon = spawnstruct();
	}
	if(!isdefined(target._abilities.lockon.var_61980861))
	{
		target._abilities.lockon.var_61980861 = [];
	}
	pos = target getshootatpos();
	if(isdefined(pos))
	{
		passed = bullettracepassed(eyepos, pos, 0, target, undefined, 1, 1);
		if(passed)
		{
			target._abilities.lockon.var_61980861[self getentitynumber()] = gettime();
			return 1;
		}
	}
	pos = target getcentroid();
	if(isdefined(pos))
	{
		passed = bullettracepassed(eyepos, pos, 0, target, undefined, 1, 1);
		if(passed)
		{
			target._abilities.lockon.var_61980861[self getentitynumber()] = gettime();
			return 1;
		}
	}
	if(var_4f358117)
	{
		mins = target getmins();
		maxs = target getmaxs();
		var_a0e635a9 = (maxs[2] - mins[2]) / 4;
		for(i = 0; i <= 4; i++)
		{
			pos = target.origin + (0, 0, var_a0e635a9 * i);
			passed = bullettracepassed(eyepos, pos, 0, target, undefined, 1, 1);
			if(passed)
			{
				target._abilities.lockon.var_61980861[self getentitynumber()] = gettime();
				return 1;
			}
			pos = target.origin + (mins[0], mins[1], var_a0e635a9 * i);
			passed = bullettracepassed(eyepos, pos, 0, target, undefined, 1, 1);
			if(passed)
			{
				target._abilities.lockon.var_61980861[self getentitynumber()] = gettime();
				return 1;
			}
			pos = target.origin + (maxs[0], maxs[1], var_a0e635a9 * i);
			passed = bullettracepassed(eyepos, pos, 0, target, undefined, 1, 1);
			if(passed)
			{
				target._abilities.lockon.var_61980861[self getentitynumber()] = gettime();
				return 1;
			}
		}
		var_49d986f1 = target._abilities.lockon.var_61980861[self getentitynumber()];
		if(isdefined(var_49d986f1) && (var_49d986f1 + getdvarint(#"hash_592433ab4ddff207", 3000)) > gettime())
		{
			trace = bullettrace(eyepos, pos, 0, target);
			distsq = distancesquared(pos, trace[#"position"]);
			if(distsq <= getdvarint(#"hash_1fd2e213720ddfb3", sqr(315)))
			{
				return 2;
			}
			return 0;
		}
	}
	return 0;
}

/*
	Name: targetisvalid
	Namespace: namespace_8a67e6b6
	Checksum: 0xB3C14B94
	Offset: 0xB30
	Size: 0x22C
	Parameters: 3
	Flags: Linked
*/
function targetisvalid(target, weapon, lockreq)
{
	if(!isdefined(lockreq))
	{
		lockreq = 1;
	}
	result = 1;
	if(!isdefined(target))
	{
		return 0;
	}
	if(!isalive(target))
	{
		return 0;
	}
	if(target isragdoll())
	{
		return 0;
	}
	if(is_true(target.is_disabled))
	{
		return 0;
	}
	if(!is_true(target.takedamage))
	{
		return 0;
	}
	if(isdefined(target._ai_melee_opponent))
	{
		return 0;
	}
	if(isactor(target) && (!target isonground() || isdefined(target.traversestartnode)))
	{
		return 0;
	}
	if(isdefined(target.cybercomtargetstatusoverride))
	{
		if(target.cybercomtargetstatusoverride == 0)
		{
			return 0;
		}
	}
	else
	{
		if(is_true(target.magic_bullet_shield))
		{
			return 0;
		}
		if(isactor(target) && target isinscriptedstate())
		{
			return 0;
		}
	}
	if(lockreq && isdefined(self._abilities) && isdefined(self._abilities.lockon.targetlockrequirementcb))
	{
		result = self [[self._abilities.lockon.targetlockrequirementcb]](target);
	}
	if(result && isdefined(level.var_f320af85))
	{
		result = result & [[level.var_f320af85]](self, target, weapon);
	}
	return result;
}

/*
	Name: weapon_lock_meetsrangerequirement
	Namespace: namespace_8a67e6b6
	Checksum: 0xC8EC74CB
	Offset: 0xD68
	Size: 0x6E
	Parameters: 3
	Flags: Linked
*/
function weapon_lock_meetsrangerequirement(target, maxrange, weapon)
{
	if(isdefined(weapon))
	{
		distancesqr = distancesquared(maxrange.origin, self.origin);
		if(distancesqr > sqr(weapon))
		{
			return false;
		}
	}
	return true;
}

/*
	Name: weapon_lock_meetsrequirement
	Namespace: namespace_8a67e6b6
	Checksum: 0x2B91501B
	Offset: 0xDE0
	Size: 0x258
	Parameters: 5
	Flags: Linked
*/
function weapon_lock_meetsrequirement(target, radius, weapon, maxrange, var_efb1ea62)
{
	result = 1;
	isvalid = self targetisvalid(target, weapon);
	if(!is_true(isvalid))
	{
		self function_a1dd4489(target, 1);
		return 0;
	}
	var_584c7fc2 = target [[var_efb1ea62]](self, weapon);
	if(!is_true(var_584c7fc2))
	{
		self function_a1dd4489(target, 1);
		return 0;
	}
	if(isdefined(maxrange))
	{
		distancesqr = distancesquared(target.origin, self.origin);
		if(distancesqr > sqr(maxrange))
		{
			self function_a1dd4489(target, 3);
			return 0;
		}
	}
	var_a7e5784a = self _lock_sighttest(target);
	if(var_a7e5784a == 0)
	{
		self function_a1dd4489(target, 5);
		return 0;
	}
	if(var_a7e5784a == 2)
	{
		radius = radius * 2;
	}
	if(isdefined(radius))
	{
		distsq = distancesquared(self.origin, target.origin);
		if(distsq > sqr(144))
		{
			result = target_isincircle(target, self, 65, radius);
		}
	}
	if(result == 0)
	{
		self function_a1dd4489(target, 1);
	}
	return result;
}

/*
	Name: function_568e9d1f
	Namespace: namespace_8a67e6b6
	Checksum: 0xBDFC0283
	Offset: 0x1040
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_568e9d1f(a, b)
{
	return a.dot < b.dot;
}

/*
	Name: function_bb2cd3c1
	Namespace: namespace_8a67e6b6
	Checksum: 0x5FC83F2F
	Offset: 0x1070
	Size: 0xE6
	Parameters: 1
	Flags: Linked
*/
function function_bb2cd3c1(target)
{
	if(isdefined(target.lockon_owner) && target.lockon_owner == self)
	{
		function_f9f09e3f(self);
		target.var_7a48f1af = gettime() - target.var_6a1a4bf6;
		target thread function_ddd62d1c();
		target.var_6a1a4bf6 = undefined;
		target.var_784d850f = gettime() + 150;
		target.lockon_owner = undefined;
		target.var_6a1a4bf6 = undefined;
		target.var_3f53671 = undefined;
		self notify(#"hash_5c27ba8c4f6d6d7a");
		self notify(#"ccom_lost_lock", {#target:target});
	}
}

/*
	Name: weapon_lock_clearslot
	Namespace: namespace_8a67e6b6
	Checksum: 0x9AEC270A
	Offset: 0x1160
	Size: 0x10E
	Parameters: 3
	Flags: Linked
*/
function weapon_lock_clearslot(slot, note, clearprogress)
{
	if(isdefined(self._abilities.lockon.lock_targets[slot]))
	{
		item = self._abilities.lockon.lock_targets[slot];
		if(isdefined(item.target))
		{
			if(isdefined(note))
			{
				item.target notify(note);
			}
			self weaponlocknoclearance(0, item.lockslot);
			self weaponlockremoveslot(item.lockslot);
			if(is_true(clearprogress))
			{
				self function_bb2cd3c1(item.target);
			}
			item.target = undefined;
		}
	}
}

/*
	Name: _weapon_lock_targetwatchfordeath
	Namespace: namespace_8a67e6b6
	Checksum: 0x7DC240A3
	Offset: 0x1278
	Size: 0xD4
	Parameters: 1
	Flags: Linked, Private
*/
function private _weapon_lock_targetwatchfordeath(player)
{
	self endon(#"ccom_lost_lock");
	self notify(#"_weapon_lock_targetwatchfordeath");
	self endon(#"_weapon_lock_targetwatchfordeath");
	slot = player weapon_lock_alreadylocked(self);
	self waittill(#"death", #"ccom_lock_fired", #"hash_68de5a70849dff37");
	player weaponlocknoclearance(0, slot);
	player weaponlockremoveslot(slot);
}

/*
	Name: weapon_lock_settargettoslot
	Namespace: namespace_8a67e6b6
	Checksum: 0x2BBBB673
	Offset: 0x1358
	Size: 0x5B4
	Parameters: 5
	Flags: Linked
*/
function weapon_lock_settargettoslot(slot, target, maxrange, weapon, maxtargets)
{
	if(slot == -1 || slot >= maxtargets)
	{
		return;
	}
	if(isdefined(target.var_784d850f) && gettime() < target.var_784d850f)
	{
		return;
	}
	if(isdefined(self._abilities.lockon.lock_targets[slot]))
	{
		self weapon_lock_clearslot(slot, "ccom_lost_lock");
		newitem = self._abilities.lockon.lock_targets[slot];
		newitem.target = target;
	}
	else
	{
		newitem = spawnstruct();
		newitem.target = target;
		newitem.lockslot = slot;
		self._abilities.lockon.lock_targets[slot] = newitem;
	}
	if(isdefined(newitem.target))
	{
		if(isdefined(newitem.target.var_fedddeb8) && isdefined(newitem.target.var_fedddeb8[self._abilities.lockon.lastequipped.name]))
		{
			if(!isdefined(newitem.target.lockon_owner))
			{
				newitem.target.var_6a1a4bf6 = gettime() - newitem.target.var_7a48f1af;
				newitem.target.lockon_owner = self;
				newitem.target notify(#"hash_4e379ec4e6f3cb69");
				var_838217dd = newitem.target.var_7a48f1af / (newitem.target.var_fedddeb8[self._abilities.lockon.lastequipped.name] * 1000);
				function_ea7b2cb3(self, newitem.target.var_fedddeb8[self._abilities.lockon.lastequipped.name], var_838217dd);
				level thread function_eeb4c5eb(self);
			}
			if(isdefined(newitem.target.lockon_owner) && newitem.target.lockon_owner == self)
			{
				newitem.target.var_3f53671 = math::clamp((gettime() - newitem.target.var_6a1a4bf6) / (newitem.target.var_fedddeb8[self._abilities.lockon.lastequipped.name] * 1000), 0, 1);
			}
		}
		self weaponlockstart(newitem.target, newitem.lockslot);
		newitem.inrange = 1;
		if(!self weapon_lock_meetsrangerequirement(newitem.target, maxrange, weapon))
		{
			newitem.inrange = 0;
			self weaponlocknoclearance(1, slot);
		}
		if(isdefined(newitem.target.var_3f53671))
		{
			if(newitem.target.lockon_owner == self)
			{
				if(newitem.target.var_3f53671 != 1)
				{
					newitem.inrange = 2;
					self weaponlocknoclearance(1, slot);
				}
			}
			else
			{
				newitem.inrange = 0;
				self weaponlocknoclearance(1, slot);
			}
		}
		if(newitem.inrange == 1)
		{
			function_f9f09e3f(self);
			self weaponlocknoclearance(0, slot);
			self weaponlockfinalize(newitem.target, newitem.lockslot);
			newitem.target notify(#"ccom_locked_on", self);
			level notify(#"ccom_locked_on", newitem.target, self);
		}
		else
		{
			newitem.target notify(#"ccom_lock_being_targeted", {#hijacking_player:self});
			level notify(#"ccom_lock_being_targeted", {#hijacking_player:self, #target:newitem.target});
		}
		newitem.target thread _weapon_lock_targetwatchfordeath(self);
	}
}

/*
	Name: function_ea7b2cb3
	Namespace: namespace_8a67e6b6
	Checksum: 0x801833E6
	Offset: 0x1918
	Size: 0x9E
	Parameters: 3
	Flags: Linked
*/
function function_ea7b2cb3(hacker, duration, startratio)
{
	val = duration & 31;
	if(startratio > 0)
	{
		cur = math::clamp(startratio, 0, 1);
		offset = (int(cur * 128)) << 5;
		val = val + offset;
	}
}

/*
	Name: function_f9f09e3f
	Namespace: namespace_8a67e6b6
	Checksum: 0xCFE57F23
	Offset: 0x19C0
	Size: 0x14
	Parameters: 1
	Flags: Linked
*/
function function_f9f09e3f(hacker)
{
}

/*
	Name: function_eeb4c5eb
	Namespace: namespace_8a67e6b6
	Checksum: 0xD7DE971A
	Offset: 0x19E0
	Size: 0xAC
	Parameters: 1
	Flags: Linked
*/
function function_eeb4c5eb(hacker)
{
	hacker endon(#"disconnect");
	hacker notify(#"hash_5c27ba8c4f6d6d7a");
	hacker endon(#"hash_5c27ba8c4f6d6d7a");
	hacker waittill(#"death", #"hash_4b778a3139f80d62", #"ccom_lost_lock", #"ccom_locked_on");
	function_f9f09e3f(hacker);
}

/*
	Name: weapon_lock_alreadylocked
	Namespace: namespace_8a67e6b6
	Checksum: 0x48D02B08
	Offset: 0x1A98
	Size: 0xA6
	Parameters: 1
	Flags: Linked
*/
function weapon_lock_alreadylocked(target)
{
	for(i = 0; i < self._abilities.lockon.lock_targets.size; i++)
	{
		if(!isdefined(self._abilities.lockon.lock_targets[i].target))
		{
			continue;
		}
		if(self._abilities.lockon.lock_targets[i].target == target)
		{
			return i;
		}
	}
	return -1;
}

/*
	Name: weapon_lock_getlockedontargets
	Namespace: namespace_8a67e6b6
	Checksum: 0x5316ECB9
	Offset: 0x1B48
	Size: 0xA6
	Parameters: 0
	Flags: None
*/
function weapon_lock_getlockedontargets()
{
	targets = [];
	for(i = 0; i < self._abilities.lockon.lock_targets.size; i++)
	{
		if(!isdefined(self._abilities.lockon.lock_targets[i].target))
		{
			continue;
		}
		targets[targets.size] = self._abilities.lockon.lock_targets[i].target;
	}
	return targets;
}

/*
	Name: weapon_lock_getslot
	Namespace: namespace_8a67e6b6
	Checksum: 0x5FF1A2F4
	Offset: 0x1BF8
	Size: 0x2B2
	Parameters: 2
	Flags: Linked
*/
function weapon_lock_getslot(target, maxtargets)
{
	if(self._abilities.lockon.lock_targets.size < maxtargets)
	{
		return self._abilities.lockon.lock_targets.size;
	}
	playerforward = anglestoforward(self getplayerangles());
	dots = [];
	for(i = 0; i < self._abilities.lockon.lock_targets.size; i++)
	{
		locktarget = self._abilities.lockon.lock_targets[i].target;
		if(!isdefined(locktarget))
		{
			return i;
		}
		newitem = spawnstruct();
		newitem.dot = vectordot(playerforward, vectornormalize(locktarget.origin - self.origin));
		var_3d797059 = (isdefined(self._abilities.lockon.var_3d797059) ? self._abilities.lockon.var_3d797059 : 0.95);
		if(newitem.dot > var_3d797059)
		{
			newitem.target = locktarget;
			array::add_sorted(dots, newitem, 0, &function_568e9d1f);
		}
	}
	newitem = spawnstruct();
	newitem.dot = vectordot(playerforward, vectornormalize(target.origin - self.origin));
	newitem.target = target;
	array::add_sorted(dots, newitem, 0, &function_568e9d1f);
	worsttarget = dots[dots.size - 1].target;
	if(worsttarget == target)
	{
		return -1;
	}
	return self weapon_lock_alreadylocked(worsttarget);
}

/*
	Name: weapon_lock_clearslots
	Namespace: namespace_8a67e6b6
	Checksum: 0x23A84228
	Offset: 0x1EB8
	Size: 0xCE
	Parameters: 1
	Flags: Linked
*/
function weapon_lock_clearslots(clearprogress)
{
	if(!isdefined(clearprogress))
	{
		clearprogress = 0;
	}
	if(isdefined(self._abilities) && isdefined(self._abilities.lockon.lock_targets))
	{
		for(i = 0; i < self._abilities.lockon.lock_targets.size; i++)
		{
			self weapon_lock_clearslot(i, undefined, clearprogress);
		}
	}
	self weaponlockremoveslot(-1);
	self._abilities.lockon.lock_targets = [];
}

/*
	Name: function_ddd62d1c
	Namespace: namespace_8a67e6b6
	Checksum: 0xCA627A5D
	Offset: 0x1F90
	Size: 0xE6
	Parameters: 0
	Flags: Linked
*/
function function_ddd62d1c()
{
	self endon(#"death");
	self notify(#"hash_5527196024cbab2a");
	self endon(#"hash_5527196024cbab2a", #"hash_4e379ec4e6f3cb69");
	var_8c73eccc = int((getdvarfloat(#"hash_20ef93f02210f3f0", 0.25) / 20) * 1000);
	while(self.var_7a48f1af > 0)
	{
		waitframe(1);
		self.var_7a48f1af = self.var_7a48f1af - var_8c73eccc;
		if(self.var_7a48f1af < 0)
		{
			self.var_7a48f1af = 0;
		}
	}
}

/*
	Name: function_92c4b561
	Namespace: namespace_8a67e6b6
	Checksum: 0x95D0D5B7
	Offset: 0x2080
	Size: 0x262
	Parameters: 0
	Flags: Linked
*/
function function_92c4b561()
{
	if(!isdefined(self._abilities.lockon.var_1ce9ea0e) || self._abilities.lockon.var_1ce9ea0e.size == 0)
	{
		return;
	}
	var_1ce9ea0e = [];
	foreach(target in self._abilities.lockon.var_1ce9ea0e)
	{
		if(!isdefined(target))
		{
			continue;
		}
		found = 0;
		if(self._abilities.lockon.lock_targets.size)
		{
			foreach(var_50af7828 in self._abilities.lockon.lock_targets)
			{
				if(!isdefined(var_50af7828.target))
				{
					continue;
				}
				if(var_50af7828.target == target)
				{
					found = 1;
					break;
				}
			}
		}
		if(!found)
		{
			target notify(#"ccom_lost_lock", {#owner:self});
			level notify(#"ccom_lost_lock", {#owner:self, #target:target});
			self function_bb2cd3c1(target);
			continue;
		}
		var_1ce9ea0e[var_1ce9ea0e.size] = target;
	}
	self._abilities.lockon.var_1ce9ea0e = var_1ce9ea0e;
}

/*
	Name: function_a73ea525
	Namespace: namespace_8a67e6b6
	Checksum: 0x956A3382
	Offset: 0x22F0
	Size: 0x10
	Parameters: 1
	Flags: Linked
*/
function function_a73ea525(weapon)
{
	return true;
}

/*
	Name: function_80119fb6
	Namespace: namespace_8a67e6b6
	Checksum: 0xF987008E
	Offset: 0x2308
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function function_80119fb6(weapon)
{
	return self getenemies();
}

/*
	Name: function_d2bc8bb1
	Namespace: namespace_8a67e6b6
	Checksum: 0x51B994E9
	Offset: 0x2338
	Size: 0x32A
	Parameters: 4
	Flags: None
*/
function function_d2bc8bb1(enemies, weapon, var_efb1ea62, var_6fb74c6f)
{
	if(!isdefined(var_6fb74c6f))
	{
		var_6fb74c6f = 0;
	}
	var_5c118373 = [];
	if(!isdefined(enemies) || enemies.size == 0)
	{
		return var_5c118373;
	}
	playerforward = anglestoforward(self getplayerangles());
	var_9c8f2bcc = self gettagorigin("tag_aim");
	foreach(enemy in enemies)
	{
		center = enemy getcentroid();
		dirtotarget = vectornormalize(center - var_9c8f2bcc);
		enemy.var_5425b76c = vectordot(dirtotarget, playerforward);
		var_3d797059 = (isdefined(self._abilities.lockon.var_3d797059) ? self._abilities.lockon.var_3d797059 : 0.95);
		if(enemy.var_5425b76c < var_3d797059)
		{
			continue;
		}
		if(!targetisvalid(enemy, weapon))
		{
			continue;
		}
		if(!self [[var_efb1ea62]](enemy, weapon))
		{
			continue;
		}
		eyepos = self geteye();
		pos = enemy getshootatpos();
		if(isdefined(pos))
		{
			passed = bullettracepassed(eyepos, pos, 0, enemy, undefined, 1, 1);
			if(passed)
			{
				var_5c118373[var_5c118373.size] = enemy;
				if(var_6fb74c6f)
				{
					break;
				}
				continue;
			}
		}
		pos = enemy getcentroid();
		if(isdefined(pos))
		{
			passed = bullettracepassed(eyepos, pos, 0, enemy, undefined, 1, 1);
			if(passed)
			{
				var_5c118373[var_5c118373.size] = enemy;
				if(var_6fb74c6f)
				{
					break;
				}
				continue;
			}
		}
	}
	return var_5c118373;
}

/*
	Name: function_4b7f8060
	Namespace: namespace_8a67e6b6
	Checksum: 0x9729DDC6
	Offset: 0x2670
	Size: 0x90E
	Parameters: 6
	Flags: Linked
*/
function function_4b7f8060(slot, weapon, maxtargets, var_e08793c0, var_efb1ea62, var_8ff7e677)
{
	self notify(#"ccom_stop_lock_on");
	self endon(#"ccom_stop_lock_on", #"disconnect", #"game_ended", #"death");
	radius = self._abilities.lockon.var_4ce73a98;
	if(!isdefined(radius))
	{
		radius = 130;
	}
	self thread _lock_fired_watcher(weapon);
	self thread function_8c4799(weapon);
	if(!isdefined(maxtargets))
	{
		maxtargets = getdvarint(#"scr_max_simlocks", 3);
	}
	if(maxtargets < 1)
	{
		maxtargets = 1;
	}
	if(maxtargets > 5)
	{
		maxtargets = 5;
	}
	maxrange = weapon.lockonmaxrange;
	if(!isdefined(maxrange))
	{
		maxrange = 1500;
	}
	validtargets = [];
	dots = [];
	if(!isdefined(var_8ff7e677))
	{
		var_8ff7e677 = &function_a73ea525;
	}
	if(!isdefined(var_efb1ea62))
	{
		var_efb1ea62 = &function_a73ea525;
	}
	if(!isdefined(var_e08793c0))
	{
		var_e08793c0 = &function_80119fb6;
	}
	while(!self [[var_8ff7e677]](weapon))
	{
		waitframe(1);
	}
	while(self [[var_8ff7e677]](weapon))
	{
		waitframe(1);
		self function_92c4b561();
		self weapon_lock_clearslots();
		self._abilities.lockon.var_4e8096b0 = 0;
		var_56842206 = self._abilities.lockon.var_1ce9ea0e.size;
		enemies = self [[var_e08793c0]](weapon);
		if(!isdefined(enemies) || enemies.size == 0)
		{
			self function_a1dd4489(undefined, 1);
			continue;
		}
		var_7bc97a0f = [];
		playerforward = anglestoforward(self getplayerangles());
		var_9c8f2bcc = self gettagorigin("tag_aim");
		foreach(enemy in enemies)
		{
			center = enemy getcentroid();
			dirtotarget = vectornormalize(center - var_9c8f2bcc);
			enemy.var_5425b76c = vectordot(dirtotarget, playerforward);
			var_3d797059 = (isdefined(self._abilities.lockon.var_3d797059) ? self._abilities.lockon.var_3d797059 : 0.95);
			if(enemy.var_5425b76c > var_3d797059)
			{
				var_7bc97a0f[var_7bc97a0f.size] = enemy;
			}
		}
		if(var_7bc97a0f.size == 0)
		{
			self function_a1dd4489(undefined, 1);
			continue;
		}
		validtargets = [];
		potentialtargets = [];
		foreach(enemy in var_7bc97a0f)
		{
			if(!isdefined(enemy))
			{
				continue;
			}
			if(!self weapon_lock_meetsrequirement(enemy, radius, weapon, maxrange, var_efb1ea62))
			{
				continue;
			}
			validtargets[validtargets.size] = enemy;
		}
		dots = [];
		foreach(target in validtargets)
		{
			newitem = spawnstruct();
			newitem.dot = target.var_5425b76c;
			newitem.target = target;
			array::add_sorted(dots, newitem, 0, &function_568e9d1f);
		}
		if(dots.size)
		{
			i = 0;
			foreach(item in dots)
			{
				i++;
				if(i > maxtargets)
				{
					break;
				}
				if(isdefined(item.target))
				{
					var_58e23156 = self weapon_lock_alreadylocked(item.target);
					if(var_58e23156 != -1)
					{
						continue;
					}
					if(is_true(item.target.var_2285319))
					{
						foreach(other in self._abilities.lockon.var_1ce9ea0e)
						{
							if(other == item.target)
							{
								continue;
							}
							if(is_true(other.var_2285319))
							{
								item.target = undefined;
								break;
							}
						}
					}
					if(!isdefined(item.target))
					{
						continue;
					}
					slot = self weapon_lock_getslot(item.target, maxtargets);
					if(slot == -1)
					{
						continue;
					}
					if(!isinarray(self._abilities.lockon.var_1ce9ea0e, item.target))
					{
						self._abilities.lockon.var_1ce9ea0e[self._abilities.lockon.var_1ce9ea0e.size] = item.target;
					}
					self weapon_lock_settargettoslot(slot, item.target, maxrange, weapon, maxtargets);
				}
			}
			if(var_56842206 < self._abilities.lockon.var_1ce9ea0e.size)
			{
				self playrumbleonentity("damage_light");
			}
		}
	}
	self notify(#"ccom_stop_lock_on");
}

/*
	Name: function_b4c3d402
	Namespace: namespace_8a67e6b6
	Checksum: 0xAC5C02EB
	Offset: 0x2F88
	Size: 0x292
	Parameters: 1
	Flags: Linked
*/
function function_b4c3d402(weapon)
{
	if(self._abilities.lockon.var_4e8096b0 !== 0 && (self._abilities.lockon.lock_targets.size == 0 || self._abilities.lockon.var_4e8096b0 == 8))
	{
		if(self._abilities.lockon.var_4e8096b0 == 2 && isdefined(self._abilities.lockon.var_bf4fab3f))
		{
			var_a7e5784a = self _lock_sighttest(self._abilities.lockon.var_bf4fab3f, 0);
			if(var_a7e5784a == 0)
			{
				self._abilities.lockon.var_4e8096b0 = 1;
			}
		}
		switch(self._abilities.lockon.var_4e8096b0)
		{
			case 2:
			{
				self settargetwrongtypehint(weapon);
				break;
			}
			case 3:
			{
				self settargetoorhint(weapon);
				break;
			}
			case 4:
			{
				self settargetalreadyinusehint(weapon);
				break;
			}
			case 1:
			{
				self setnotargetshint(weapon);
				break;
			}
			case 5:
			{
				self setnolosontargetshint(weapon);
				break;
			}
			case 6:
			{
				self setdisabledtargethint(weapon);
				break;
			}
			case 7:
			{
				self settargetalreadytargetedhint(weapon);
				break;
			}
			case 8:
			{
				self settargetingabortedhint(weapon);
				break;
			}
		}
		self._abilities.lockon.var_4e8096b0 = 0;
	}
}

/*
	Name: function_a1dd4489
	Namespace: namespace_8a67e6b6
	Checksum: 0xF5A1D10
	Offset: 0x3228
	Size: 0x172
	Parameters: 4
	Flags: Linked
*/
function function_a1dd4489(var_bf4fab3f, var_4e8096b0, var_d217d303, priority)
{
	if(!isdefined(var_d217d303))
	{
		var_d217d303 = 1;
	}
	if(!isdefined(priority))
	{
		priority = 1;
	}
	if(!isplayer(self) || !isdefined(self._abilities))
	{
		return;
	}
	if(var_d217d303 && !is_true(self._abilities.lockon.is_primed))
	{
		return;
	}
	if(!is_true(self._abilities.lockon.var_d1052697))
	{
		return;
	}
	if(priority)
	{
		if(var_4e8096b0 > self._abilities.lockon.var_4e8096b0)
		{
			self._abilities.lockon.var_4e8096b0 = var_4e8096b0;
			self._abilities.lockon.var_bf4fab3f = var_bf4fab3f;
		}
	}
	else
	{
		self._abilities.lockon.var_4e8096b0 = var_4e8096b0;
		self._abilities.lockon.var_bf4fab3f = var_bf4fab3f;
	}
}

