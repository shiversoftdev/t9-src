#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace antipersonnelguidance;

/*
	Name: function_d9c6e09d
	Namespace: antipersonnelguidance
	Checksum: 0x79A00E75
	Offset: 0xB0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_d9c6e09d()
{
	level notify(95912596);
}

#namespace singlelockap_guidance;

/*
	Name: function_89f2df9
	Namespace: singlelockap_guidance
	Checksum: 0x1B961633
	Offset: 0xD0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"singlelockap_guidance", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: singlelockap_guidance
	Checksum: 0x73787166
	Offset: 0x118
	Size: 0x24
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	callback::on_spawned(&on_player_spawned);
}

/*
	Name: on_player_spawned
	Namespace: singlelockap_guidance
	Checksum: 0xDA4E63C4
	Offset: 0x148
	Size: 0x3C
	Parameters: 0
	Flags: None
*/
function on_player_spawned()
{
	self endon(#"disconnect");
	self clearaptarget();
	thread aptoggleloop();
}

/*
	Name: clearaptarget
	Namespace: singlelockap_guidance
	Checksum: 0xB6B6EE5E
	Offset: 0x190
	Size: 0x214
	Parameters: 2
	Flags: None
*/
function clearaptarget(weapon, whom)
{
	if(!isdefined(self.multilocklist))
	{
		self.multilocklist = [];
	}
	if(isdefined(whom))
	{
		for(i = 0; i < self.multilocklist.size; i++)
		{
			if(whom.aptarget == self.multilocklist[i].aptarget)
			{
				self.multilocklist[i].aptarget notify(#"missile_unlocked");
				self notify("stop_sound" + whom.apsoundid);
				self weaponlockremoveslot(i);
				arrayremovevalue(self.multilocklist, whom, 0);
				break;
			}
		}
	}
	else
	{
		for(i = 0; i < self.multilocklist.size; i++)
		{
			self.multilocklist[i].aptarget notify(#"missile_unlocked");
			self notify("stop_sound" + self.multilocklist[i].apsoundid);
		}
		self.multilocklist = [];
	}
	if(self.multilocklist.size == 0)
	{
		self stoprumble("stinger_lock_rumble");
		self weaponlockremoveslot(-1);
		if(isdefined(weapon))
		{
			if(isdefined(weapon.lockonseekersearchsound))
			{
				self stoplocalsound(weapon.lockonseekersearchsound);
			}
			if(isdefined(weapon.lockonseekerlockedsound))
			{
				self stoplocalsound(weapon.lockonseekerlockedsound);
			}
		}
	}
}

/*
	Name: function_dc710809
	Namespace: singlelockap_guidance
	Checksum: 0x1D3950E0
	Offset: 0x3B0
	Size: 0x140
	Parameters: 1
	Flags: Event
*/
event function_dc710809(eventstruct)
{
	if(!isplayer(self))
	{
		return;
	}
	missile = eventstruct.projectile;
	weapon = eventstruct.weapon;
	if(weapon.lockontype == "AP Single")
	{
		foreach(target in self.multilocklist)
		{
			if(isdefined(target.aptarget) && target.aplockfinalized)
			{
				target.aptarget notify(#"stinger_fired_at_me", {#attacker:self, #weapon:weapon, #projectile:missile});
			}
		}
	}
}

/*
	Name: aptoggleloop
	Namespace: singlelockap_guidance
	Checksum: 0xA1CAE28E
	Offset: 0x4F8
	Size: 0x17E
	Parameters: 0
	Flags: None
*/
function aptoggleloop()
{
	self endon(#"death");
	for(;;)
	{
		waitresult = undefined;
		waitresult = self waittill(#"weapon_change");
		weapon = waitresult.weapon;
		while(weapon.lockontype == "AP Single")
		{
			abort = 0;
			while(!self playerads() == 1)
			{
				waitframe(1);
				currentweapon = self getcurrentweapon();
				if(currentweapon.lockontype != "AP Single")
				{
					abort = 1;
					break;
				}
			}
			if(abort)
			{
				break;
			}
			self thread aplockloop(weapon);
			while(self playerads() == 1)
			{
				waitframe(1);
			}
			self notify(#"ap_off");
			self clearaptarget(weapon);
			weapon = self getcurrentweapon();
		}
	}
}

/*
	Name: aplockloop
	Namespace: singlelockap_guidance
	Checksum: 0x7DEE5DF2
	Offset: 0x680
	Size: 0x4C8
	Parameters: 1
	Flags: None
*/
function aplockloop(weapon)
{
	self endon(#"disconnect", #"death", #"ap_off");
	locklength = self getlockonspeed();
	self.multilocklist = [];
	for(;;)
	{
		waitframe(1);
		do
		{
			done = 1;
			foreach(target in self.multilocklist)
			{
				if(target.aplockfinalized)
				{
					if(!isstillvalidtarget(weapon, target.aptarget))
					{
						self clearaptarget(weapon, target);
						done = 0;
						break;
					}
				}
			}
		}
		while(!done);
		inlockingstate = 0;
		do
		{
			done = 1;
			for(i = 0; i < self.multilocklist.size; i++)
			{
				target = self.multilocklist[i];
				if(target.aplocking)
				{
					if(!isstillvalidtarget(weapon, target.aptarget))
					{
						self clearaptarget(weapon, target);
						done = 0;
						break;
					}
					inlockingstate = 1;
					timepassed = gettime() - target.aplockstarttime;
					if(timepassed < locklength)
					{
						continue;
					}
					/#
						assert(isdefined(target.aptarget));
					#/
					target.aplockfinalized = 1;
					target.aplocking = 0;
					target.aplockpending = 0;
					self weaponlockfinalize(target.aptarget, i);
					self thread seekersound(weapon.lockonseekerlockedsound, weapon.lockonseekerlockedsoundloops, target.apsoundid);
					target.aptarget notify(#"missile_lock", {#weapon:weapon, #attacker:self});
				}
			}
		}
		while(!done);
		if(!inlockingstate)
		{
			do
			{
				done = 1;
				for(i = 0; i < self.multilocklist.size; i++)
				{
					target = self.multilocklist[i];
					if(target.aplockpending)
					{
						if(!isstillvalidtarget(weapon, target.aptarget))
						{
							self clearaptarget(weapon, target);
							done = 0;
							break;
						}
						target.aplockstarttime = gettime();
						target.aplockfinalized = 0;
						target.aplockpending = 0;
						target.aplocking = 1;
						self thread seekersound(weapon.lockonseekersearchsound, weapon.lockonseekersearchsoundloops, target.apsoundid);
						done = 1;
						break;
					}
				}
			}
			while(!done);
		}
		if(self.multilocklist.size >= 1)
		{
			continue;
		}
		besttarget = self getbesttarget(weapon);
		if(!isdefined(besttarget) && self.multilocklist.size == 0)
		{
			continue;
		}
		if(isdefined(besttarget) && self.multilocklist.size < 1)
		{
			self weaponlockstart(besttarget.aptarget, self.multilocklist.size);
			self.multilocklist[self.multilocklist.size] = besttarget;
		}
	}
}

/*
	Name: getbesttarget
	Namespace: singlelockap_guidance
	Checksum: 0x7FE3DFC4
	Offset: 0xB50
	Size: 0x48E
	Parameters: 1
	Flags: None
*/
function getbesttarget(weapon)
{
	playertargets = getplayers();
	vehicletargets = target_getarray();
	targetsall = getaiteamarray();
	targetsall = arraycombine(targetsall, playertargets, 0, 0);
	targetsall = arraycombine(targetsall, vehicletargets, 0, 0);
	targetsvalid = [];
	for(idx = 0; idx < targetsall.size; idx++)
	{
		if(level.teambased)
		{
			if(isdefined(targetsall[idx].team) && targetsall[idx].team != self.team)
			{
				if(self insideapreticlenolock(targetsall[idx]))
				{
					if(self locksighttest(targetsall[idx]))
					{
						targetsvalid[targetsvalid.size] = targetsall[idx];
					}
				}
			}
			continue;
		}
		if(self insideapreticlenolock(targetsall[idx]))
		{
			if(isdefined(targetsall[idx].owner) && self != targetsall[idx].owner)
			{
				if(self locksighttest(targetsall[idx]))
				{
					targetsvalid[targetsvalid.size] = targetsall[idx];
				}
			}
		}
	}
	if(targetsvalid.size == 0)
	{
		return undefined;
	}
	playerforward = anglestoforward(self getplayerangles());
	dots = [];
	for(i = 0; i < targetsvalid.size; i++)
	{
		newitem = spawnstruct();
		newitem.index = i;
		newitem.dot = vectordot(playerforward, vectornormalize(targetsvalid[i].origin - self.origin));
		array::add_sorted(dots, newitem, 0, &targetinsertionsortcompare);
	}
	index = 0;
	foreach(dot in dots)
	{
		found = 0;
		foreach(lock in self.multilocklist)
		{
			if(lock.aptarget == targetsvalid[dot.index])
			{
				found = 1;
			}
		}
		if(found)
		{
			continue;
		}
		newentry = spawnstruct();
		newentry.aptarget = targetsvalid[dot.index];
		newentry.aplockstarttime = gettime();
		newentry.aplockpending = 1;
		newentry.aplocking = 0;
		newentry.aplockfinalized = 0;
		newentry.aplostsightlinetime = 0;
		newentry.apsoundid = randomint(2147483647);
		return newentry;
	}
	return undefined;
}

/*
	Name: targetinsertionsortcompare
	Namespace: singlelockap_guidance
	Checksum: 0xC5DF6CC8
	Offset: 0xFE8
	Size: 0x4E
	Parameters: 2
	Flags: None
*/
function targetinsertionsortcompare(a, b)
{
	if(a.dot < b.dot)
	{
		return -1;
	}
	if(a.dot > b.dot)
	{
		return 1;
	}
	return 0;
}

/*
	Name: insideapreticlenolock
	Namespace: singlelockap_guidance
	Checksum: 0x7AEBBCED
	Offset: 0x1040
	Size: 0x4A
	Parameters: 1
	Flags: None
*/
function insideapreticlenolock(target)
{
	radius = self getlockonradius();
	return target_isincircle(target, self, 65, radius);
}

/*
	Name: insideapreticlelocked
	Namespace: singlelockap_guidance
	Checksum: 0xD64505A9
	Offset: 0x1098
	Size: 0x4A
	Parameters: 1
	Flags: None
*/
function insideapreticlelocked(target)
{
	radius = self getlockonlossradius();
	return target_isincircle(target, self, 65, radius);
}

/*
	Name: isstillvalidtarget
	Namespace: singlelockap_guidance
	Checksum: 0x8DE0B117
	Offset: 0x10F0
	Size: 0x6E
	Parameters: 2
	Flags: None
*/
function isstillvalidtarget(weapon, ent)
{
	if(!isdefined(ent))
	{
		return false;
	}
	if(!insideapreticlelocked(ent))
	{
		return false;
	}
	if(!isalive(ent))
	{
		return false;
	}
	if(!locksighttest(ent))
	{
		return false;
	}
	return true;
}

/*
	Name: seekersound
	Namespace: singlelockap_guidance
	Checksum: 0x932A1BCF
	Offset: 0x1168
	Size: 0xEC
	Parameters: 3
	Flags: None
*/
function seekersound(alias, looping, id)
{
	self notify("stop_sound" + id);
	self endon("stop_sound" + id, #"disconnect", #"death");
	if(isdefined(alias))
	{
		self playrumbleonentity("stinger_lock_rumble");
		time = soundgetplaybacktime(alias) * 0.001;
		do
		{
			self playlocalsound(alias);
			wait(time);
		}
		while(looping);
		self stoprumble("stinger_lock_rumble");
	}
}

/*
	Name: locksighttest
	Namespace: singlelockap_guidance
	Checksum: 0xAA3C1938
	Offset: 0x1260
	Size: 0x176
	Parameters: 1
	Flags: None
*/
function locksighttest(target)
{
	eyepos = self geteye();
	if(!isdefined(target))
	{
		return false;
	}
	if(!isalive(target))
	{
		return false;
	}
	if(is_true(target.var_e8ec304d))
	{
		return false;
	}
	pos = target getshootatpos();
	if(isdefined(pos))
	{
		passed = bullettracepassed(eyepos, pos, 0, target, undefined, 1, 1);
		if(passed)
		{
			return true;
		}
	}
	pos = target getcentroid();
	if(isdefined(pos))
	{
		passed = bullettracepassed(eyepos, pos, 0, target, undefined, 1, 1);
		if(passed)
		{
			return true;
		}
	}
	pos = target.origin;
	passed = bullettracepassed(eyepos, pos, 0, target, undefined, 1, 1);
	if(passed)
	{
		return true;
	}
	return false;
}

