#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\dev_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\battlechatter.gsc;

#namespace heatseekingmissile;

/*
	Name: function_13e9ee89
	Namespace: heatseekingmissile
	Checksum: 0x4371D80E
	Offset: 0x198
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_13e9ee89()
{
	level notify(-1103497450);
}

/*
	Name: init_shared
	Namespace: heatseekingmissile
	Checksum: 0x80C06D39
	Offset: 0x1B8
	Size: 0xAC
	Parameters: 0
	Flags: Linked
*/
function init_shared()
{
	game.var_f4787795 = getgametypesetting(#"hash_1346ebfec214d724", 0);
	game.locking_on_sound = "uin_alert_lockon_start";
	game.locked_on_sound = "uin_alert_lockon";
	callback::on_spawned(&on_player_spawned);
	level.fx_flare = #"hash_409b85809816c79b";
	/#
		setdvar(#"scr_freelock", 0);
	#/
}

/*
	Name: on_player_spawned
	Namespace: heatseekingmissile
	Checksum: 0xAF8A28DE
	Offset: 0x270
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function on_player_spawned()
{
	self endon(#"disconnect");
	self clearirtarget();
	self callback::on_weapon_change(&on_weapon_change);
}

/*
	Name: clearirtarget
	Namespace: heatseekingmissile
	Checksum: 0x5FEC1926
	Offset: 0x2C8
	Size: 0x1F4
	Parameters: 0
	Flags: Linked
*/
function clearirtarget()
{
	self notify(#"stop_lockon_sound");
	self notify(#"stop_locked_sound");
	self.stingerlocksound = undefined;
	self stoprumble("stinger_lock_rumble");
	self.stingerlockstarttime = 0;
	self.stingerlockstarted = 0;
	self.stingerlockfinalized = 0;
	self.stingerlockdetected = 0;
	if(isdefined(self.stingertarget))
	{
		self.stingertarget notify(#"missile_unlocked");
		clientnum = self getentitynumber();
		if((self.stingertarget.locked_on & (1 << clientnum)) != 0)
		{
			self notify(#"hash_41e93a518427847c");
		}
		self lockingon(self.stingertarget, 0);
		self lockedon(self.stingertarget, 0);
		self.var_bf109916 = gettime();
	}
	self.stingertarget = undefined;
	self.stingersubtarget = undefined;
	self weaponlockfree();
	self weaponlocktargettooclose(0);
	self weaponlocknoclearance(0);
	self stoplocalsound(game.locking_on_sound);
	self stoplocalsound(game.locked_on_sound);
	/#
		self destroylockoncanceledmessage();
	#/
}

/*
	Name: function_5e6cd0ab
	Namespace: heatseekingmissile
	Checksum: 0x3602974
	Offset: 0x4C8
	Size: 0x84
	Parameters: 2
	Flags: Linked
*/
function function_5e6cd0ab(weapon, attacker)
{
	params = {#attacker:attacker, #weapon:weapon};
	self notify(#"missile_lock", params);
	self callback::callback(#"missile_lock", params);
}

/*
	Name: function_a439ae56
	Namespace: heatseekingmissile
	Checksum: 0xE743C6AE
	Offset: 0x558
	Size: 0x9C
	Parameters: 3
	Flags: Linked
*/
function function_a439ae56(missile, weapon, attacker)
{
	params = {#attacker:attacker, #weapon:weapon, #projectile:missile};
	self notify(#"stinger_fired_at_me", params);
	self callback::callback(#"hash_1a32e0fdeb70a76b", params);
}

/*
	Name: function_a3d258b6
	Namespace: heatseekingmissile
	Checksum: 0x7F3D5754
	Offset: 0x600
	Size: 0x124
	Parameters: 1
	Flags: Event
*/
event function_a3d258b6(eventstruct)
{
	missile = eventstruct.projectile;
	weapon = eventstruct.weapon;
	target = eventstruct.target;
	/#
		if(getdvarint(#"scr_debug_missile", 0) != 0)
		{
			thread debug_missile(missile);
		}
	#/
	if(weapon.lockontype == "Legacy Single")
	{
		if(isplayer(self) && isdefined(self.stingertarget) && self.stingerlockfinalized)
		{
			self.stingertarget function_a439ae56(missile, weapon, self);
		}
		else if(isdefined(target))
		{
			target function_a439ae56(missile, weapon, self);
		}
	}
}

/*
	Name: debug_missile
	Namespace: heatseekingmissile
	Checksum: 0xDA5B9A0A
	Offset: 0x730
	Size: 0x21A
	Parameters: 1
	Flags: None
*/
function debug_missile(missile)
{
	/#
		level notify(#"debug_missile");
		level endon(#"debug_missile");
		level.debug_missile_dots = [];
		while(true)
		{
			if(isdefined(missile))
			{
				missile_info = spawnstruct();
				missile_info.origin = missile.origin;
				target = missile missile_gettarget();
				missile_info.targetentnum = (isdefined(target) ? target getentitynumber() : undefined);
				if(!isdefined(level.debug_missile_dots))
				{
					level.debug_missile_dots = [];
				}
				else if(!isarray(level.debug_missile_dots))
				{
					level.debug_missile_dots = array(level.debug_missile_dots);
				}
				level.debug_missile_dots[level.debug_missile_dots.size] = missile_info;
			}
			foreach(missile_info in level.debug_missile_dots)
			{
				dot_color = (isdefined(missile_info.targetentnum) ? (1, 0, 0) : (0, 1, 0));
				dev::debug_sphere(missile_info.origin, 10, dot_color, 0.66, 1);
			}
			waitframe(1);
		}
	#/
}

/*
	Name: getappropriateplayerweapon
	Namespace: heatseekingmissile
	Checksum: 0x5EC0BBF7
	Offset: 0x958
	Size: 0xB2
	Parameters: 1
	Flags: Linked
*/
function getappropriateplayerweapon(currentweapon)
{
	appropriateweapon = currentweapon;
	if(self.usingvehicle)
	{
		vehicleseatposition = (isdefined(self.vehicleposition) ? self.vehicleposition : 0);
		vehicleentity = self.viewlockedentity;
		if(isdefined(vehicleentity) && isvehicle(vehicleentity))
		{
			appropriateweapon = vehicleentity seatgetweapon(vehicleseatposition);
			if(!isdefined(appropriateweapon))
			{
				appropriateweapon = currentweapon;
			}
		}
	}
	return appropriateweapon;
}

/*
	Name: stingerwaitforads
	Namespace: heatseekingmissile
	Checksum: 0x53768BAE
	Offset: 0xA18
	Size: 0x98
	Parameters: 0
	Flags: Linked
*/
function stingerwaitforads()
{
	while(!self playerstingerads())
	{
		waitframe(1);
		currentweapon = self getcurrentweapon();
		weapon = getappropriateplayerweapon(currentweapon);
		if(weapon.lockontype != "Legacy Single" || weapon.noadslockoncheck)
		{
			return false;
		}
	}
	return true;
}

/*
	Name: on_weapon_change
	Namespace: heatseekingmissile
	Checksum: 0xCB237F21
	Offset: 0xAB8
	Size: 0x208
	Parameters: 1
	Flags: Linked
*/
function on_weapon_change(params)
{
	self endon(#"death", #"disconnect");
	weapon = self getappropriateplayerweapon(params.weapon);
	while(weapon.lockontype == "Legacy Single")
	{
		weaponammoclip = self getweaponammoclip(weapon);
		if(weaponammoclip == 0 && !weapon.unlimitedammo)
		{
			waitframe(1);
			currentweapon = self getcurrentweapon();
			weapon = self getappropriateplayerweapon(params.weapon);
			continue;
		}
		if(!weapon.noadslockoncheck && !stingerwaitforads())
		{
			break;
		}
		self thread stingerirtloop(weapon);
		if(weapon.noadslockoncheck)
		{
			waitresult = undefined;
			waitresult = self waittill(#"weapon_change");
			weapon = self getappropriateplayerweapon(waitresult.weapon);
		}
		else
		{
			while(self playerstingerads())
			{
				waitframe(1);
			}
			currweap = self getcurrentweapon();
			weapon = self getappropriateplayerweapon(currweap);
		}
		self notify(#"stinger_irt_off");
		self clearirtarget();
	}
}

/*
	Name: stingerirtloop
	Namespace: heatseekingmissile
	Checksum: 0xA198BA3B
	Offset: 0xCC8
	Size: 0x800
	Parameters: 1
	Flags: Linked
*/
function stingerirtloop(weapon)
{
	self endon(#"disconnect", #"death", #"stinger_irt_off");
	locklength = self getlockonspeed();
	if(!isdefined(self.stingerlockfinalized))
	{
		self.stingerlockfinalized = 0;
	}
	for(;;)
	{
		waitframe(1);
		if(!self hasweapon(weapon))
		{
			return;
		}
		currentweapon = self getcurrentweapon();
		currentplayerweapon = self getappropriateplayerweapon(currentweapon);
		if(currentplayerweapon !== weapon)
		{
			continue;
		}
		if(is_true(self.stingerlockfinalized))
		{
			passed = softsighttest(1);
			if(!passed)
			{
				continue;
			}
			if(!self isstillvalidtarget(self.stingertarget, weapon) || self insidestingerreticlelocked(self.stingertarget, self.stingersubtarget, weapon) == 0)
			{
				self setweaponlockonpercent(weapon, 0);
				self clearirtarget();
				continue;
			}
			if(!self.stingertarget.locked_on)
			{
				self.stingertarget function_5e6cd0ab(self getcurrentweapon(), self);
			}
			self lockingon(self.stingertarget, 0);
			self lockedon(self.stingertarget, 1);
			if(isdefined(weapon))
			{
				setfriendlyflags(weapon, self.stingertarget);
			}
			thread looplocallocksound(game.locked_on_sound, 0.75);
			continue;
		}
		if(is_true(self.stingerlockstarted))
		{
			if(!self isstillvalidtarget(self.stingertarget, weapon) || self insidestingerreticlelocked(self.stingertarget, self.stingersubtarget, weapon) == 0)
			{
				self setweaponlockonpercent(weapon, 0);
				self clearirtarget();
				continue;
			}
			self lockingon(self.stingertarget, 1);
			self lockedon(self.stingertarget, 0);
			if(isdefined(weapon))
			{
				setfriendlyflags(weapon, self.stingertarget);
			}
			passed = softsighttest(1);
			if(!passed)
			{
				continue;
			}
			timepassed = gettime() - self.stingerlockstarttime;
			if(isdefined(weapon))
			{
				lockpct = 1;
				if(locklength > 0)
				{
					lockpct = timepassed / locklength;
				}
				self setweaponlockonpercent(weapon, lockpct * 100);
				setfriendlyflags(weapon, self.stingertarget);
			}
			if(timepassed < locklength)
			{
				continue;
			}
			/#
				assert(isdefined(self.stingertarget));
			#/
			self notify(#"stop_lockon_sound");
			self.stingerlockfinalized = 1;
			self weaponlockfinalize(self.stingertarget, 0, self.stingersubtarget);
			continue;
		}
		if(isdefined(self.var_bf109916) && isdefined(weapon.var_3daded88) && (self.var_bf109916 + (int(weapon.var_3daded88 * 1000))) > gettime())
		{
			/#
				self displaylockoncanceledmessage();
			#/
			continue;
		}
		result = self getbeststingertarget(weapon);
		besttarget = result[#"target"];
		bestsubtarget = result[#"subtarget"];
		if(!isdefined(besttarget) || (isdefined(self.stingertarget) && self.stingertarget != besttarget))
		{
			/#
				self destroylockoncanceledmessage();
			#/
			if(self.stingerlockdetected == 1)
			{
				self weaponlockfree();
				self.stingerlockdetected = 0;
			}
			continue;
		}
		if(!self locksighttest(besttarget))
		{
			/#
				self destroylockoncanceledmessage();
			#/
			continue;
		}
		if(isdefined(besttarget.lockondelay) && besttarget.lockondelay)
		{
			/#
				self displaylockoncanceledmessage();
			#/
			continue;
		}
		if(!targetwithinrangeofplayspace(besttarget))
		{
			/#
				self displaylockoncanceledmessage();
			#/
			continue;
		}
		if(!function_1b76fb42(besttarget, weapon))
		{
			/#
				self displaylockoncanceledmessage();
			#/
			continue;
		}
		/#
			self destroylockoncanceledmessage();
		#/
		if(self insidestingerreticlelocked(besttarget, bestsubtarget, weapon) == 0)
		{
			if(self.stingerlockdetected == 0)
			{
				self weaponlockdetect(besttarget, 0, bestsubtarget);
			}
			self.stingerlockdetected = 1;
			if(isdefined(weapon))
			{
				setfriendlyflags(weapon, besttarget);
			}
			continue;
		}
		self.stingerlockdetected = 0;
		initlockfield(besttarget);
		self.stingertarget = besttarget;
		self.stingersubtarget = bestsubtarget;
		self.stingerlockstarttime = gettime();
		self.stingerlockstarted = 1;
		self.stingerlostsightlinetime = 0;
		self weaponlockstart(besttarget, 0, bestsubtarget);
		self thread looplocalseeksound(game.locking_on_sound, 0.6);
	}
}

/*
	Name: targetwithinrangeofplayspace
	Namespace: heatseekingmissile
	Checksum: 0x51A6C0D0
	Offset: 0x14D0
	Size: 0x176
	Parameters: 1
	Flags: Linked
*/
function targetwithinrangeofplayspace(target)
{
	/#
		if(getdvarint(#"scr_missilelock_playspace_extra_radius_override_enabled", 0) > 0)
		{
			extraradiusdvar = getdvarint(#"scr_missilelock_playspace_extra_radius", 5000);
			if(extraradiusdvar != (isdefined(level.missilelockplayspacecheckextraradius) ? level.missilelockplayspacecheckextraradius : 0))
			{
				level.missilelockplayspacecheckextraradius = extraradiusdvar;
				level.missilelockplayspacecheckradiussqr = undefined;
			}
		}
	#/
	if(level.missilelockplayspacecheckenabled === 1)
	{
		if(!isdefined(target))
		{
			return false;
		}
		if(!isdefined(level.playspacecenter))
		{
			level.playspacecenter = util::getplayspacecenter();
		}
		if(!isdefined(level.missilelockplayspacecheckradiussqr))
		{
			level.missilelockplayspacecheckradiussqr = sqr((util::getplayspacemaxwidth() * 0.5) + level.missilelockplayspacecheckextraradius);
		}
		if(distance2dsquared(target.origin, level.playspacecenter) > level.missilelockplayspacecheckradiussqr)
		{
			return false;
		}
	}
	return true;
}

/*
	Name: destroylockoncanceledmessage
	Namespace: heatseekingmissile
	Checksum: 0x93B4C41F
	Offset: 0x1650
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function destroylockoncanceledmessage()
{
	/#
		if(isdefined(self.lockoncanceledmessage))
		{
			self.lockoncanceledmessage destroy();
		}
	#/
}

/*
	Name: displaylockoncanceledmessage
	Namespace: heatseekingmissile
	Checksum: 0x617E4189
	Offset: 0x1688
	Size: 0x144
	Parameters: 0
	Flags: None
*/
function displaylockoncanceledmessage()
{
	/#
		if(isdefined(self.lockoncanceledmessage))
		{
			return;
		}
		self.lockoncanceledmessage = newdebughudelem(self);
		self.lockoncanceledmessage.fontscale = 1.25;
		self.lockoncanceledmessage.x = 0;
		self.lockoncanceledmessage.y = 50;
		self.lockoncanceledmessage.alignx = "";
		self.lockoncanceledmessage.aligny = "";
		self.lockoncanceledmessage.horzalign = "";
		self.lockoncanceledmessage.vertalign = "";
		self.lockoncanceledmessage.foreground = 1;
		self.lockoncanceledmessage.hidewheninmenu = 1;
		self.lockoncanceledmessage.archived = 0;
		self.lockoncanceledmessage.alpha = 1;
		self.lockoncanceledmessage settext(#"hash_31537402e7b1c369");
	#/
}

/*
	Name: function_d656e945
	Namespace: heatseekingmissile
	Checksum: 0x6B12AA24
	Offset: 0x17D8
	Size: 0xC6
	Parameters: 1
	Flags: Linked, Private
*/
function private function_d656e945(team)
{
	if(!isdefined(self.team))
	{
		return false;
	}
	vehicle_team = self.team;
	if(vehicle_team == #"neutral")
	{
		if(is_true(game.var_f4787795))
		{
			return false;
		}
		driver = self getseatoccupant(0);
		if(isdefined(driver))
		{
			vehicle_team = driver.team;
		}
	}
	if(util::function_fbce7263(vehicle_team, team))
	{
		return true;
	}
	return false;
}

/*
	Name: getbeststingertarget
	Namespace: heatseekingmissile
	Checksum: 0x67298E90
	Offset: 0x18A8
	Size: 0x4AC
	Parameters: 1
	Flags: Linked
*/
function getbeststingertarget(weapon)
{
	result = [];
	targetsall = [];
	if(isdefined(self.get_stinger_target_override))
	{
		targetsall = self [[self.get_stinger_target_override]]();
	}
	else
	{
		targetsall = target_getarray();
	}
	targetsvalid = [];
	subtargetsvalid = [];
	for(idx = 0; idx < targetsall.size; idx++)
	{
		/#
			if(getdvarint(#"scr_freelock", 0) == 1)
			{
				if(self insidestingerreticlenolock(targetsall[idx], undefined, weapon))
				{
					targetsvalid[targetsvalid.size] = targetsall[idx];
				}
				continue;
			}
		#/
		target = targetsall[idx];
		if(!isdefined(target))
		{
			continue;
		}
		subtargets = target_getsubtargets(target);
		for(sidx = 0; sidx < subtargets.size; sidx++)
		{
			subtarget = subtargets[sidx];
			if(isdefined(target))
			{
				if(level.teambased || level.use_team_based_logic_for_locking_on === 1)
				{
					if(target function_d656e945(self.team))
					{
						if(self insidestingerreticledetect(target, subtarget, weapon))
						{
							if(!isdefined(self.is_valid_target_for_stinger_override) || self [[self.is_valid_target_for_stinger_override]](target))
							{
								if(!isentity(target) || isalive(target))
								{
									hascamo = isdefined(target.camo_state) && target.camo_state == 1 && !self hasperk(#"specialty_showenemyequipment");
									if(!hascamo)
									{
										targetsvalid[targetsvalid.size] = target;
										subtargetsvalid[subtargetsvalid.size] = subtarget;
									}
								}
							}
						}
					}
					continue;
				}
				if(self insidestingerreticledetect(target, subtarget, weapon))
				{
					if(isdefined(target.owner) && self != target.owner || (isplayer(target) && self != target))
					{
						if(!isdefined(self.is_valid_target_for_stinger_override) || self [[self.is_valid_target_for_stinger_override]](target))
						{
							if(!isentity(target) || isalive(target))
							{
								targetsvalid[targetsvalid.size] = target;
								subtargetsvalid[subtargetsvalid.size] = subtarget;
							}
						}
					}
				}
			}
		}
	}
	if(targetsvalid.size == 0)
	{
		return result;
	}
	besttarget = targetsvalid[0];
	bestsubtarget = subtargetsvalid[0];
	if(targetsvalid.size > 1)
	{
		closestratio = 0;
		foreach(target in targetsvalid)
		{
			ratio = ratiodistancefromscreencenter(target, subtarget, weapon);
			if(ratio > closestratio)
			{
				closestratio = ratio;
				besttarget = target;
			}
		}
	}
	result[#"target"] = besttarget;
	result[#"subtarget"] = bestsubtarget;
	return result;
}

/*
	Name: calclockonradius
	Namespace: heatseekingmissile
	Checksum: 0x2D6FC324
	Offset: 0x1D60
	Size: 0xF0
	Parameters: 3
	Flags: Linked
*/
function calclockonradius(target, subtarget, weapon)
{
	radius = self getlockonradius();
	if(isdefined(weapon) && isdefined(weapon.lockonscreenradius) && weapon.lockonscreenradius > radius)
	{
		radius = weapon.lockonscreenradius;
	}
	if(isdefined(level.lockoncloserange) && isdefined(level.lockoncloseradiusscaler))
	{
		dist2 = distancesquared(subtarget.origin, self.origin);
		if(dist2 < level.lockoncloserange * level.lockoncloserange)
		{
			radius = radius * level.lockoncloseradiusscaler;
		}
	}
	return radius;
}

/*
	Name: calclockonlossradius
	Namespace: heatseekingmissile
	Checksum: 0x25393210
	Offset: 0x1E58
	Size: 0xF0
	Parameters: 3
	Flags: Linked
*/
function calclockonlossradius(target, subtarget, weapon)
{
	radius = self getlockonlossradius();
	if(isdefined(weapon) && isdefined(weapon.lockonscreenradius) && weapon.lockonscreenradius > radius)
	{
		radius = weapon.lockonscreenradius;
	}
	if(isdefined(level.lockoncloserange) && isdefined(level.lockoncloseradiusscaler))
	{
		dist2 = distancesquared(subtarget.origin, self.origin);
		if(dist2 < level.lockoncloserange * level.lockoncloserange)
		{
			radius = radius * level.lockoncloseradiusscaler;
		}
	}
	return radius;
}

/*
	Name: ratiodistancefromscreencenter
	Namespace: heatseekingmissile
	Checksum: 0x7E9AF4FE
	Offset: 0x1F50
	Size: 0x62
	Parameters: 3
	Flags: Linked
*/
function ratiodistancefromscreencenter(target, subtarget, weapon)
{
	radius = calclockonradius(target, subtarget, weapon);
	return target_scaleminmaxradius(target, self, 65, 0, radius, subtarget);
}

/*
	Name: insidestingerreticledetect
	Namespace: heatseekingmissile
	Checksum: 0x4A44172A
	Offset: 0x1FC0
	Size: 0x62
	Parameters: 3
	Flags: Linked
*/
function insidestingerreticledetect(target, subtarget, weapon)
{
	radius = calclockonradius(target, subtarget, weapon);
	return target_isincircle(target, self, 65, radius, 0, subtarget);
}

/*
	Name: insidestingerreticlenolock
	Namespace: heatseekingmissile
	Checksum: 0xC7526F6C
	Offset: 0x2030
	Size: 0x62
	Parameters: 3
	Flags: None
*/
function insidestingerreticlenolock(target, subtarget, weapon)
{
	radius = calclockonradius(target, subtarget, weapon);
	return target_isincircle(target, self, 65, radius, 0, subtarget);
}

/*
	Name: insidestingerreticlelocked
	Namespace: heatseekingmissile
	Checksum: 0xF05B9C75
	Offset: 0x20A0
	Size: 0x62
	Parameters: 3
	Flags: Linked
*/
function insidestingerreticlelocked(target, subtarget, weapon)
{
	radius = calclockonlossradius(target, subtarget, weapon);
	return target_isincircle(target, self, 65, radius, 0, subtarget);
}

/*
	Name: isstillvalidtarget
	Namespace: heatseekingmissile
	Checksum: 0xA216B667
	Offset: 0x2110
	Size: 0x12A
	Parameters: 3
	Flags: Linked
*/
function isstillvalidtarget(ent, weapon, var_7929b469)
{
	if(!isdefined(var_7929b469))
	{
		var_7929b469 = 1;
	}
	if(!isdefined(ent))
	{
		return 0;
	}
	if(isentity(ent) && !isalive(ent))
	{
		return 0;
	}
	if(isdefined(ent.is_still_valid_target_for_stinger_override))
	{
		return self [[ent.is_still_valid_target_for_stinger_override]](ent, weapon);
	}
	if(isdefined(self.is_still_valid_target_for_stinger_override))
	{
		return self [[self.is_still_valid_target_for_stinger_override]](ent, weapon);
	}
	if(!target_istarget(ent) && (!(isdefined(ent.allowcontinuedlockonafterinvis) && ent.allowcontinuedlockonafterinvis)))
	{
		return 0;
	}
	if(var_7929b469 && !function_1b76fb42(ent, weapon))
	{
		return 0;
	}
	return 1;
}

/*
	Name: function_1b76fb42
	Namespace: heatseekingmissile
	Checksum: 0xC0269E7A
	Offset: 0x2248
	Size: 0x98
	Parameters: 2
	Flags: Linked
*/
function function_1b76fb42(ent, weapon)
{
	var_91c7ae51 = distance2dsquared(self.origin, ent.origin);
	if(weapon.lockonminrange > 0)
	{
		if(var_91c7ae51 < weapon.lockonminrange * weapon.lockonminrange)
		{
			return false;
		}
	}
	if(weapon.lockonmaxrange > 0)
	{
		if(var_91c7ae51 > weapon.lockonmaxrange * weapon.lockonmaxrange)
		{
			return false;
		}
	}
	return true;
}

/*
	Name: playerstingerads
	Namespace: heatseekingmissile
	Checksum: 0x5FC391DC
	Offset: 0x22E8
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function playerstingerads()
{
	return self playerads() == 1;
}

/*
	Name: looplocalseeksound
	Namespace: heatseekingmissile
	Checksum: 0x899CD230
	Offset: 0x2318
	Size: 0xAC
	Parameters: 2
	Flags: Linked
*/
function looplocalseeksound(alias, interval)
{
	self endon(#"stop_lockon_sound", #"disconnect", #"death", #"enter_vehicle", #"exit_vehicle");
	for(;;)
	{
		self playsoundforlocalplayer(alias);
		self playrumbleonentity("stinger_lock_rumble");
		wait(interval / 2);
	}
}

/*
	Name: playsoundforlocalplayer
	Namespace: heatseekingmissile
	Checksum: 0xA44C308C
	Offset: 0x23D0
	Size: 0x7C
	Parameters: 1
	Flags: Linked
*/
function playsoundforlocalplayer(alias)
{
	if(self isinvehicle())
	{
		sound_target = self getvehicleoccupied();
		if(isdefined(sound_target))
		{
			sound_target playsoundtoplayer(alias, self);
		}
	}
	else
	{
		self playlocalsound(alias);
	}
}

/*
	Name: looplocallocksound
	Namespace: heatseekingmissile
	Checksum: 0x16A8EE42
	Offset: 0x2458
	Size: 0x172
	Parameters: 2
	Flags: Linked
*/
function looplocallocksound(alias, interval)
{
	self endon(#"stop_locked_sound", #"disconnect", #"death", #"enter_vehicle", #"exit_vehicle");
	if(isdefined(self.stingerlocksound))
	{
		return;
	}
	self.stingerlocksound = 1;
	for(;;)
	{
		self playsoundforlocalplayer(alias);
		self playrumbleonentity("stinger_lock_rumble");
		wait(interval / 6);
		self playsoundforlocalplayer(alias);
		self playrumbleonentity("stinger_lock_rumble");
		wait(interval / 6);
		self playsoundforlocalplayer(alias);
		self playrumbleonentity("stinger_lock_rumble");
		wait(interval / 6);
		self stoprumble("stinger_lock_rumble");
	}
	self.stingerlocksound = undefined;
}

/*
	Name: locksighttest
	Namespace: heatseekingmissile
	Checksum: 0x9FA5AB51
	Offset: 0x25D8
	Size: 0x176
	Parameters: 3
	Flags: Linked
*/
function locksighttest(target, subtarget, var_27cdcb1)
{
	if(!isdefined(var_27cdcb1))
	{
		var_27cdcb1 = 0;
	}
	camerapos = self getplayercamerapos();
	if(!isdefined(target))
	{
		return false;
	}
	if(is_true(target.var_e8ec304d))
	{
		return false;
	}
	targetorigin = target_getorigin(target, subtarget);
	if(bullettracepassed(camerapos, targetorigin, 0, target, target.parent, var_27cdcb1))
	{
		return true;
	}
	front = target getpointinbounds(1, 0, 0);
	if(bullettracepassed(camerapos, front, 0, target, target.parent, var_27cdcb1))
	{
		return true;
	}
	back = target getpointinbounds(-1, 0, 0);
	if(bullettracepassed(camerapos, back, 0, target, target.parent, var_27cdcb1))
	{
		return true;
	}
	return false;
}

/*
	Name: softsighttest
	Namespace: heatseekingmissile
	Checksum: 0xAE796EAA
	Offset: 0x2758
	Size: 0xBC
	Parameters: 1
	Flags: Linked
*/
function softsighttest(var_27cdcb1)
{
	if(!isdefined(var_27cdcb1))
	{
		var_27cdcb1 = 0;
	}
	lost_sight_limit = 500;
	if(self locksighttest(self.stingertarget, self.stingersubtarget, var_27cdcb1))
	{
		self.stingerlostsightlinetime = 0;
		return true;
	}
	if(self.stingerlostsightlinetime == 0)
	{
		self.stingerlostsightlinetime = gettime();
	}
	timepassed = gettime() - self.stingerlostsightlinetime;
	if(timepassed >= lost_sight_limit)
	{
		self clearirtarget();
		return false;
	}
	return true;
}

/*
	Name: initlockfield
	Namespace: heatseekingmissile
	Checksum: 0x550AFEDE
	Offset: 0x2820
	Size: 0x42
	Parameters: 1
	Flags: Linked
*/
function initlockfield(target)
{
	if(isdefined(target.locking_on))
	{
		return;
	}
	target.locking_on = 0;
	target.locked_on = 0;
	target.locking_on_hacking = 0;
}

/*
	Name: lockingon
	Namespace: heatseekingmissile
	Checksum: 0x6E5A2B46
	Offset: 0x2870
	Size: 0x19E
	Parameters: 2
	Flags: Linked
*/
function lockingon(target, lock)
{
	/#
		assert(isdefined(target.locking_on));
	#/
	clientnum = self getentitynumber();
	if(lock)
	{
		if((target.locking_on & (1 << clientnum)) == 0)
		{
			target.locking_on = target.locking_on | (1 << clientnum);
			target notify(#"locking on");
			self thread watchclearlockingon(target, clientnum);
			if(!isdefined(target.team) || (!isdefined(target.killstreaktype) && util::function_fbce7263(self.team, target.team) && !is_true(target.var_9ee835dc)))
			{
				target.var_9ee835dc = 1;
				self battlechatter::playkillstreakthreat(target.killstreaktype);
			}
		}
	}
	else
	{
		self notify(#"locking_on_cleared");
		target.locking_on = target.locking_on & (~(1 << clientnum));
	}
}

/*
	Name: watchclearlockingon
	Namespace: heatseekingmissile
	Checksum: 0x302CE149
	Offset: 0x2A18
	Size: 0x82
	Parameters: 2
	Flags: Linked
*/
function watchclearlockingon(target, clientnum)
{
	target endon(#"death");
	self endon(#"locking_on_cleared");
	self waittill(#"death", #"disconnect");
	target.locking_on = target.locking_on & (~(1 << clientnum));
}

/*
	Name: lockedon
	Namespace: heatseekingmissile
	Checksum: 0x2B40F521
	Offset: 0x2AA8
	Size: 0x1B0
	Parameters: 2
	Flags: Linked
*/
function lockedon(target, lock)
{
	/#
		assert(isdefined(target.locked_on));
	#/
	clientnum = self getentitynumber();
	if(lock)
	{
		if(!target enemylockedon())
		{
			if(isdefined(target.var_eb66cfc6))
			{
				target [[target.var_eb66cfc6]]();
			}
		}
		if((target.locked_on & (1 << clientnum)) == 0)
		{
			target.locked_on = target.locked_on | (1 << clientnum);
			self notify(#"lock_on_acquired");
			self thread watchclearlockedon(target, clientnum);
			if(isdefined(self.var_96e63c65))
			{
				self [[self.var_96e63c65]]();
			}
		}
	}
	else
	{
		self notify(#"locked_on_cleared");
		if(isdefined(self.var_ce532710))
		{
			self [[self.var_ce532710]]();
		}
		target.locked_on = target.locked_on & (~(1 << clientnum));
		if(!target enemylockedon())
		{
			if(isdefined(target.var_43384efb))
			{
				target [[target.var_43384efb]]();
			}
		}
	}
}

/*
	Name: enemyislocking
	Namespace: heatseekingmissile
	Checksum: 0x99C3F4CB
	Offset: 0x2C60
	Size: 0x1A
	Parameters: 0
	Flags: Linked
*/
function enemyislocking()
{
	return is_true(self.locking_on);
}

/*
	Name: enemylockedon
	Namespace: heatseekingmissile
	Checksum: 0xCF9395EC
	Offset: 0x2C88
	Size: 0x1A
	Parameters: 0
	Flags: Linked
*/
function enemylockedon()
{
	return is_true(self.locked_on);
}

/*
	Name: playlockonsoundsthread
	Namespace: heatseekingmissile
	Checksum: 0xCEE90E86
	Offset: 0x2CB0
	Size: 0x1C8
	Parameters: 3
	Flags: Linked
*/
function playlockonsoundsthread(player, var_df318bbf, var_4edd2f28)
{
	player endon(#"disconnect");
	self endon(#"death", #"crashing", #"leaving");
	self.locksounds = spawn("script_model", self.origin);
	self.locksounds thread function_c8b14330(self);
	self.locksounds linkto(self, "tag_origin");
	while(true)
	{
		self waittill(#"locking on");
		while(true)
		{
			if(self enemyislocking())
			{
				self.locksounds playsoundtoplayer(var_df318bbf, player);
				wait(0.125);
			}
			if(self enemylockedon())
			{
				self.locksounds playsoundtoplayer(var_4edd2f28, player);
				wait(0.125);
			}
			if(!self enemyislocking() && !self enemylockedon())
			{
				self.locksounds stopsounds();
				break;
			}
		}
	}
}

/*
	Name: function_c8b14330
	Namespace: heatseekingmissile
	Checksum: 0xC2EE26AA
	Offset: 0x2E80
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function function_c8b14330(vehicle)
{
	self endon(#"death");
	vehicle waittill(#"death");
	self delete();
}

/*
	Name: targetinghacking
	Namespace: heatseekingmissile
	Checksum: 0x67CEE0F6
	Offset: 0x2ED8
	Size: 0xE6
	Parameters: 2
	Flags: None
*/
function targetinghacking(target, lock)
{
	/#
		assert(isdefined(target.locking_on_hacking));
	#/
	clientnum = self getentitynumber();
	if(lock)
	{
		target notify(#"locking on hacking");
		target.locking_on_hacking = target.locking_on_hacking | (1 << clientnum);
		self thread watchclearhacking(target, clientnum);
	}
	else
	{
		self notify(#"locking_on_hacking_cleared");
		target.locking_on_hacking = target.locking_on_hacking & (~(1 << clientnum));
	}
}

/*
	Name: watchclearhacking
	Namespace: heatseekingmissile
	Checksum: 0x251CECFA
	Offset: 0x2FC8
	Size: 0x82
	Parameters: 2
	Flags: Linked
*/
function watchclearhacking(target, clientnum)
{
	target endon(#"death");
	self endon(#"locking_on_hacking_cleared");
	self waittill(#"death", #"disconnect");
	target.locking_on_hacking = target.locking_on_hacking & (~(1 << clientnum));
}

/*
	Name: setfriendlyflags
	Namespace: heatseekingmissile
	Checksum: 0xC15386F
	Offset: 0x3058
	Size: 0x5AC
	Parameters: 2
	Flags: Linked
*/
function setfriendlyflags(weapon, target)
{
	if(!self isinvehicle())
	{
		self setfriendlyhacking(weapon, target);
		self setfriendlytargetting(weapon, target);
		self setfriendlytargetlocked(weapon, target);
		if(isdefined(level.killstreakmaxhealthfunction))
		{
			if(isdefined(target.usevtoltime) && isdefined(level.vtol))
			{
				killstreakendtime = level.vtol.killstreakendtime;
				if(isdefined(killstreakendtime))
				{
					self settargetedentityendtime(weapon, int(killstreakendtime));
				}
			}
			else
			{
				if(isdefined(target.killstreakendtime))
				{
					self settargetedentityendtime(weapon, int(target.killstreakendtime));
				}
				else
				{
					if(isdefined(target.parentstruct) && isdefined(target.parentstruct.killstreakendtime))
					{
						self settargetedentityendtime(weapon, int(target.parentstruct.killstreakendtime));
					}
					else
					{
						self settargetedentityendtime(weapon, 0);
					}
				}
			}
			self settargetedmissilesremaining(weapon, 0);
			killstreaktype = target.killstreaktype;
			if(!isdefined(target.killstreaktype) && isdefined(target.parentstruct) && isdefined(target.parentstruct.killstreaktype))
			{
				killstreaktype = target.parentstruct.killstreaktype;
			}
			else if(isdefined(target.usevtoltime) && isdefined(level.vtol.killstreaktype))
			{
				killstreaktype = level.vtol.killstreaktype;
			}
			if(isdefined(killstreaktype))
			{
				if(isdefined(target.forceonemissile))
				{
					self settargetedmissilesremaining(weapon, 1);
				}
				else
				{
					if(isdefined(target.usevtoltime) && isdefined(level.vtol) && isdefined(level.vtol.totalrockethits) && isdefined(level.vtol.missiletodestroy))
					{
						self settargetedmissilesremaining(weapon, level.vtol.missiletodestroy - level.vtol.totalrockethits);
					}
					else
					{
						maxhealth = [[level.killstreakmaxhealthfunction]](killstreaktype);
						damagetaken = target.damagetaken;
						if(!isdefined(damagetaken) && isdefined(target.parentstruct))
						{
							damagetaken = target.parentstruct.damagetaken;
						}
						if(isdefined(target.missiletrackdamage))
						{
							damagetaken = target.missiletrackdamage;
						}
						if(isdefined(damagetaken) && isdefined(maxhealth))
						{
							bundle = killstreaks::get_script_bundle(killstreaktype);
							rocketstokill = bundle.ksrocketstokill;
							if(level.var_71c35c9f && isdefined(bundle.var_391f7118) && bundle.var_391f7118 > 0)
							{
								rocketstokill = bundle.var_391f7118;
							}
							if(isdefined(rocketstokill) && rocketstokill > 0)
							{
								damageperrocket = (maxhealth / rocketstokill) + 1;
								remaininghealth = maxhealth - damagetaken;
								if(remaininghealth > 0)
								{
									missilesremaining = int(ceil(remaininghealth / damageperrocket));
									if(isdefined(target.numflares) && target.numflares > 0)
									{
										missilesremaining = missilesremaining + target.numflares;
									}
									if(isdefined(target.flak_drone))
									{
										missilesremaining = missilesremaining + 1;
									}
									self settargetedmissilesremaining(weapon, int(min(missilesremaining, 7)));
								}
							}
						}
					}
				}
			}
		}
		else if(isdefined(level.callback_set_missiles_remaining))
		{
			self settargetedmissilesremaining(weapon, [[level.callback_set_missiles_remaining]](weapon, target));
		}
	}
}

/*
	Name: setfriendlyhacking
	Namespace: heatseekingmissile
	Checksum: 0x49EA9FFD
	Offset: 0x3610
	Size: 0xCC
	Parameters: 2
	Flags: Linked
*/
function setfriendlyhacking(weapon, target)
{
	if(level.teambased)
	{
		friendlyhackingmask = target.locking_on_hacking;
		if(isdefined(friendlyhackingmask) && self hasweapon(weapon))
		{
			friendlyhacking = 0;
			clientnum = self getentitynumber();
			friendlyhackingmask = friendlyhackingmask & (~(1 << clientnum));
			if(friendlyhackingmask != 0)
			{
				friendlyhacking = 1;
			}
			self setweaponfriendlyhacking(weapon, friendlyhacking);
		}
	}
}

/*
	Name: setfriendlytargetting
	Namespace: heatseekingmissile
	Checksum: 0xC2D54DA0
	Offset: 0x36E8
	Size: 0xCC
	Parameters: 2
	Flags: Linked
*/
function setfriendlytargetting(weapon, target)
{
	if(level.teambased)
	{
		friendlytargetingmask = target.locking_on;
		if(isdefined(friendlytargetingmask) && self hasweapon(weapon))
		{
			friendlytargeting = 0;
			clientnum = self getentitynumber();
			friendlytargetingmask = friendlytargetingmask & (~(1 << clientnum));
			if(friendlytargetingmask != 0)
			{
				friendlytargeting = 1;
			}
			self setweaponfriendlytargeting(weapon, friendlytargeting);
		}
	}
}

/*
	Name: setfriendlytargetlocked
	Namespace: heatseekingmissile
	Checksum: 0x94536123
	Offset: 0x37C0
	Size: 0xE4
	Parameters: 2
	Flags: Linked
*/
function setfriendlytargetlocked(weapon, target)
{
	if(level.teambased)
	{
		friendlytargetlocked = 0;
		friendlylockingonmask = target.locked_on;
		if(isdefined(friendlylockingonmask))
		{
			friendlytargetlocked = 0;
			clientnum = self getentitynumber();
			friendlylockingonmask = friendlylockingonmask & (~(1 << clientnum));
			if(friendlylockingonmask != 0)
			{
				friendlytargetlocked = 1;
			}
		}
		if(friendlytargetlocked == 0)
		{
			friendlytargetlocked = target missiletarget_isotherplayermissileincoming(self);
		}
		self setweaponfriendlytargetlocked(weapon, friendlytargetlocked);
	}
}

/*
	Name: watchclearlockedon
	Namespace: heatseekingmissile
	Checksum: 0xA71DF274
	Offset: 0x38B0
	Size: 0xA8
	Parameters: 2
	Flags: Linked
*/
function watchclearlockedon(target, clientnum)
{
	self endon(#"locked_on_cleared");
	self waittill(#"death", #"disconnect");
	if(isdefined(target))
	{
		target.locked_on = target.locked_on & (~(1 << clientnum));
		if(!target enemylockedon())
		{
			if(isdefined(target.var_43384efb))
			{
				target [[target.var_43384efb]]();
			}
		}
	}
}

/*
	Name: missiletarget_lockonmonitor
	Namespace: heatseekingmissile
	Checksum: 0x1C229659
	Offset: 0x3960
	Size: 0x250
	Parameters: 3
	Flags: None
*/
function missiletarget_lockonmonitor(player, endon1, endon2)
{
	self endon(#"death");
	if(isdefined(endon1))
	{
		self endon(endon1);
	}
	if(isdefined(endon2))
	{
		self endon(endon2);
	}
	for(;;)
	{
		if(target_istarget(self))
		{
			if(self missiletarget_ismissileincoming())
			{
				self clientfield::set("heli_warn_fired", 1);
				self clientfield::set("heli_warn_locked", 0);
				self clientfield::set("heli_warn_targeted", 0);
			}
			else
			{
				if(isdefined(self.locked_on) && self.locked_on)
				{
					self clientfield::set("heli_warn_locked", 1);
					self clientfield::set("heli_warn_fired", 0);
					self clientfield::set("heli_warn_targeted", 0);
				}
				else
				{
					if(isdefined(self.locking_on) && self.locking_on)
					{
						self clientfield::set("heli_warn_targeted", 1);
						self clientfield::set("heli_warn_fired", 0);
						self clientfield::set("heli_warn_locked", 0);
					}
					else
					{
						self clientfield::set("heli_warn_fired", 0);
						self clientfield::set("heli_warn_targeted", 0);
						self clientfield::set("heli_warn_locked", 0);
					}
				}
			}
		}
		wait(0.1);
	}
}

/*
	Name: _incomingmissile
	Namespace: heatseekingmissile
	Checksum: 0x4762AFE
	Offset: 0x3BB8
	Size: 0x104
	Parameters: 2
	Flags: Linked
*/
function _incomingmissile(missile, attacker)
{
	if(!isdefined(self.incoming_missile))
	{
		self.incoming_missile = 0;
	}
	if(!isdefined(self.incoming_missile_owner))
	{
		self.incoming_missile_owner = [];
	}
	attacker_entnum = attacker getentitynumber();
	if(!isdefined(self.incoming_missile_owner[attacker_entnum]))
	{
		self.incoming_missile_owner[attacker_entnum] = 0;
	}
	self.incoming_missile++;
	self.incoming_missile_owner[attacker_entnum]++;
	if(isplayer(attacker))
	{
		attacker lockedon(self, 1);
	}
	self thread _incomingmissiletracker(missile, attacker);
	self thread _targetmissiletracker(missile, attacker);
}

/*
	Name: _targetmissiletracker
	Namespace: heatseekingmissile
	Checksum: 0x319D4D2A
	Offset: 0x3CC8
	Size: 0x84
	Parameters: 2
	Flags: Linked
*/
function _targetmissiletracker(missile, attacker)
{
	missile endon(#"death");
	self waittill(#"death");
	if(isdefined(attacker) && isplayer(attacker) && isdefined(self))
	{
		attacker lockedon(self, 0);
	}
}

/*
	Name: _incomingmissiletracker
	Namespace: heatseekingmissile
	Checksum: 0xC7BB01B2
	Offset: 0x3D58
	Size: 0xFC
	Parameters: 2
	Flags: Linked
*/
function _incomingmissiletracker(missile, attacker)
{
	self endon(#"death");
	attacker_entnum = attacker getentitynumber();
	missile waittill(#"death");
	self.incoming_missile--;
	self.incoming_missile_owner[attacker_entnum]--;
	if(self.incoming_missile_owner[attacker_entnum] == 0)
	{
		self.incoming_missile_owner[attacker_entnum] = undefined;
	}
	if(isdefined(attacker) && isplayer(attacker))
	{
		attacker lockedon(self, 0);
	}
	/#
		assert(self.incoming_missile >= 0);
	#/
}

/*
	Name: missiletarget_ismissileincoming
	Namespace: heatseekingmissile
	Checksum: 0x2B102F53
	Offset: 0x3E60
	Size: 0x26
	Parameters: 0
	Flags: Linked
*/
function missiletarget_ismissileincoming()
{
	if(!isdefined(self.incoming_missile))
	{
		return false;
	}
	if(self.incoming_missile)
	{
		return true;
	}
	return false;
}

/*
	Name: missiletarget_isotherplayermissileincoming
	Namespace: heatseekingmissile
	Checksum: 0xCA9ED301
	Offset: 0x3E90
	Size: 0x80
	Parameters: 1
	Flags: Linked
*/
function missiletarget_isotherplayermissileincoming(attacker)
{
	if(!isdefined(self.incoming_missile_owner))
	{
		return false;
	}
	if(self.incoming_missile_owner.size == 0)
	{
		return false;
	}
	attacker_entnum = attacker getentitynumber();
	if(self.incoming_missile_owner.size == 1 && isdefined(self.incoming_missile_owner[attacker_entnum]))
	{
		return false;
	}
	return true;
}

/*
	Name: missiletarget_handleincomingmissile
	Namespace: heatseekingmissile
	Checksum: 0xB8DB66C3
	Offset: 0x3F18
	Size: 0xF6
	Parameters: 4
	Flags: Linked
*/
function missiletarget_handleincomingmissile(responsefunc, endon1, endon2, allowdirectdamage)
{
	level endon(#"game_ended");
	self endon(#"death");
	if(isdefined(endon1))
	{
		self endon(endon1);
	}
	if(isdefined(endon2))
	{
		self endon(endon2);
	}
	for(;;)
	{
		waitresult = undefined;
		waitresult = self waittill(#"stinger_fired_at_me");
		_incomingmissile(waitresult.projectile, waitresult.attacker);
		if(isdefined(responsefunc))
		{
			self thread [[responsefunc]](waitresult.projectile, waitresult.attacker, waitresult.weapon, endon1, endon2, allowdirectdamage);
		}
	}
}

/*
	Name: missiletarget_proximitydetonateincomingmissile
	Namespace: heatseekingmissile
	Checksum: 0xD0549B3
	Offset: 0x4018
	Size: 0xE4
	Parameters: 4
	Flags: Linked
*/
function missiletarget_proximitydetonateincomingmissile(killstreakbundle, endon1, endon2, allowdirectdamage)
{
	if(isarray(level.var_2d90c17e))
	{
		foreach(func in level.var_2d90c17e)
		{
			self [[func]](killstreakbundle);
		}
	}
	missiletarget_handleincomingmissile(&missiletarget_proximitydetonate, endon1, endon2, allowdirectdamage);
}

/*
	Name: _missiledetonate
	Namespace: heatseekingmissile
	Checksum: 0x4CC50253
	Offset: 0x4108
	Size: 0x21C
	Parameters: 6
	Flags: Linked
*/
function _missiledetonate(attacker, weapon, range, mindamage, maxdamage, allowdirectdamage)
{
	origin = self.origin;
	target = self missile_gettarget();
	self detonate();
	if(isdefined(target.origin))
	{
		var_5289435c = 0;
		if(is_true(self.var_30dc969d))
		{
			var_5289435c = 1;
		}
		else if(allowdirectdamage === 1)
		{
			mindistsq = (isdefined(target.locked_missile_min_distsq) ? target.locked_missile_min_distsq : sqr(range));
			distsq = distancesquared(self.origin, target.origin);
			if(distsq < mindistsq)
			{
				var_5289435c = 1;
			}
		}
		if(var_5289435c)
		{
			target dodamage(maxdamage, origin, attacker, self, "none", "MOD_PROJECTILE", 0, weapon);
		}
	}
	attackerentity = attacker;
	if(function_3132f113(attacker) || (isdefined(attacker) && !isplayer(attacker) && !isalive(attacker)))
	{
		attackerentity = undefined;
	}
	radiusdamage(origin, range, maxdamage, mindamage, attackerentity, "MOD_PROJECTILE_SPLASH", weapon);
}

/*
	Name: missiletarget_proximitydetonate
	Namespace: heatseekingmissile
	Checksum: 0xB912D96E
	Offset: 0x4330
	Size: 0x3A8
	Parameters: 6
	Flags: Linked
*/
function missiletarget_proximitydetonate(missile, attacker, weapon, endon1, endon2, allowdirectdamage)
{
	self endon(#"death");
	level endon(#"game_ended");
	missile endon(#"death");
	if(isdefined(endon1))
	{
		self endon(endon1);
	}
	if(isdefined(endon2))
	{
		self endon(endon2);
	}
	mindist = distancesquared(missile.origin, self.origin);
	lastcenter = self.origin;
	var_77fe49d5 = 0;
	missile missile_settarget(self, (isdefined(target_getoffset(self)) ? target_getoffset(self) : (0, 0, 0)));
	if(isdefined(self.missiletargetmissdistance))
	{
		misseddistancesq = self.missiletargetmissdistance * self.missiletargetmissdistance;
	}
	else
	{
		misseddistancesq = 250000;
	}
	flaredistancesq = 12250000;
	for(;;)
	{
		if(!isdefined(self))
		{
			center = lastcenter;
		}
		else
		{
			center = self.origin;
		}
		lastcenter = center;
		curdist = distancesquared(missile.origin, center);
		if(!is_true(missile.var_b324d423) && curdist < flaredistancesq && isdefined(self.numflares) && self.numflares > 0)
		{
			self.numflares--;
			self thread missiletarget_playflarefx();
			self challenges::trackassists(attacker, 0, 1);
			newtarget = self missiletarget_deployflares(missile.origin, missile.angles);
			missile missile_settarget(newtarget, (isdefined(target_getoffset(newtarget)) ? target_getoffset(newtarget) : (0, 0, 0)));
			missiletarget = newtarget;
			scoreevents::processscoreevent(#"flare_assist", attacker, undefined, weapon);
			self notify(#"flare_deployed");
			return;
		}
		if(curdist < mindist)
		{
			var_77fe49d5 = 1;
			mindist = curdist;
		}
		if(var_77fe49d5 && curdist > mindist)
		{
			if(!is_true(missile.var_30dc969d) && curdist > misseddistancesq)
			{
				return;
			}
			missile thread _missiledetonate(attacker, weapon, 500, 600, 600, allowdirectdamage);
			return;
		}
		waitframe(1);
	}
}

/*
	Name: missiletarget_playflarefx
	Namespace: heatseekingmissile
	Checksum: 0x4995A434
	Offset: 0x46E0
	Size: 0x104
	Parameters: 2
	Flags: Linked
*/
function missiletarget_playflarefx(flare_fx, tag_origin)
{
	if(!isdefined(self))
	{
		return;
	}
	if(!isdefined(flare_fx))
	{
		if(isdefined(self.fx_flare))
		{
			flare_fx = self.fx_flare;
		}
		else
		{
			flare_fx = level.fx_flare;
		}
	}
	if(!isdefined(tag_origin))
	{
		tag_origin = "tag_origin";
	}
	if(isdefined(self.flare_ent))
	{
		playfxontag(flare_fx, self.flare_ent, tag_origin);
	}
	else
	{
		playfxontag(flare_fx, self, tag_origin);
	}
	if(isdefined(self.owner))
	{
		self playsoundtoplayer(#"hash_470978b5aa6302ba", self.owner);
	}
	self playsound(#"hash_470978b5aa6302ba");
}

/*
	Name: missiletarget_deployflares
	Namespace: heatseekingmissile
	Checksum: 0x88E44297
	Offset: 0x47F0
	Size: 0x290
	Parameters: 2
	Flags: Linked
*/
function missiletarget_deployflares(origin, angles)
{
	vec_toforward = anglestoforward(self.angles);
	vec_toright = anglestoright(self.angles);
	vec_tomissileforward = anglestoforward(angles);
	delta = self.origin - origin;
	dot = vectordot(vec_tomissileforward, vec_toright);
	sign = 1;
	if(dot > 0)
	{
		sign = -1;
	}
	flare_dir = vectornormalize((vectorscale(vec_toforward, -0.5)) + vectorscale(vec_toright, sign));
	velocity = vectorscale(flare_dir, randomintrange(200, 400));
	velocity = (velocity[0], velocity[1], velocity[2] - randomintrange(10, 100));
	flareorigin = self.origin;
	flareorigin = flareorigin + vectorscale(flare_dir, randomintrange(600, 800));
	flareorigin = flareorigin + vectorscale((0, 0, 1), 500);
	if(isdefined(self.flareoffset))
	{
		flareorigin = flareorigin + self.flareoffset;
	}
	flareobject = spawn("script_origin", flareorigin);
	flareobject.angles = self.angles;
	flareobject setmodel(#"tag_origin");
	flareobject movegravity(velocity, 5);
	flareobject thread util::deleteaftertime(5);
	/#
		self thread debug_tracker(flareobject);
	#/
	return flareobject;
}

/*
	Name: debug_tracker
	Namespace: heatseekingmissile
	Checksum: 0x9140D569
	Offset: 0x4A88
	Size: 0x5E
	Parameters: 1
	Flags: None
*/
function debug_tracker(target)
{
	/#
		target endon(#"death");
		while(true)
		{
			dev::debug_sphere(target.origin, 10, (1, 0, 0), 1, 1);
			waitframe(1);
		}
	#/
}

