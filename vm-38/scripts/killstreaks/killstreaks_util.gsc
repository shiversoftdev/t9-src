#using scripts\abilities\ability_util.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace namespace_fbd7dbd0;

/*
	Name: function_d857d98c
	Namespace: namespace_fbd7dbd0
	Checksum: 0xA3128C68
	Offset: 0x110
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_d857d98c()
{
	level notify(924803243);
}

#namespace killstreaks;

/*
	Name: switch_to_last_non_killstreak_weapon
	Namespace: killstreaks
	Checksum: 0x24835AE
	Offset: 0x130
	Size: 0x428
	Parameters: 3
	Flags: Linked
*/
function switch_to_last_non_killstreak_weapon(immediate, awayfromball, gameended)
{
	if(self.sessionstate === "disconnected")
	{
		return 0;
	}
	ball = getweapon(#"ball");
	if(isdefined(ball) && self hasweapon(ball) && !is_true(awayfromball))
	{
		self switchtoweaponimmediate(ball);
		self disableweaponcycling();
		self disableoffhandweapons();
	}
	else
	{
		if(is_true(self.laststand))
		{
			if(isdefined(self.laststandpistol) && self hasweapon(self.laststandpistol))
			{
				self switchtoweapon(self.laststandpistol);
			}
		}
		else
		{
			if(isdefined(self.lastnonkillstreakweapon) && self hasweapon(self.lastnonkillstreakweapon) && self getcurrentweapon() != self.lastnonkillstreakweapon)
			{
				if(ability_util::is_hero_weapon(self.lastnonkillstreakweapon))
				{
					if(self.lastnonkillstreakweapon.gadget_heroversion_2_0)
					{
						if(self.lastnonkillstreakweapon.isgadget && self getammocount(self.lastnonkillstreakweapon) > 0)
						{
							slot = self gadgetgetslot(self.lastnonkillstreakweapon);
							if(self util::gadget_is_in_use(slot))
							{
								return self switchtoweapon(self.lastnonkillstreakweapon);
							}
							return 1;
						}
					}
					else if(self getammocount(self.lastnonkillstreakweapon) > 0)
					{
						return self switchtoweapon(self.lastnonkillstreakweapon);
					}
					if(is_true(awayfromball) && isdefined(self.lastdroppableweapon) && self hasweapon(self.lastdroppableweapon))
					{
						self switchtoweapon(self.lastdroppableweapon);
					}
					else
					{
						self switchtoweapon();
					}
					return 1;
				}
				if(is_true(immediate))
				{
					self switchtoweaponimmediate(self.lastnonkillstreakweapon, is_true(gameended));
				}
				else
				{
					self switchtoweapon(self.lastnonkillstreakweapon);
				}
			}
			else
			{
				if(isdefined(self.lastdroppableweapon) && self hasweapon(self.lastdroppableweapon) && self getcurrentweapon() != self.lastdroppableweapon)
				{
					self switchtoweapon(self.lastdroppableweapon);
				}
				else
				{
					return 0;
				}
			}
		}
	}
	return 1;
}

/*
	Name: hasuav
	Namespace: killstreaks
	Checksum: 0xB475C3A7
	Offset: 0x560
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function hasuav(team_or_entnum)
{
	if(!isdefined(level.activeuavs))
	{
		return 1;
	}
	if(!isdefined(level.activeuavs[team_or_entnum]))
	{
		return 0;
	}
	return level.activeuavs[team_or_entnum] > 0;
}

/*
	Name: hassatellite
	Namespace: killstreaks
	Checksum: 0x37E2D786
	Offset: 0x5B8
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function hassatellite(team_or_entnum)
{
	if(!isdefined(level.activesatellites))
	{
		return 1;
	}
	return level.activesatellites[team_or_entnum] > 0;
}

/*
	Name: function_f479a2ff
	Namespace: killstreaks
	Checksum: 0xB659FE61
	Offset: 0x5F8
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function function_f479a2ff(weapon)
{
	if(isdefined(level.var_3ff1b984) && isdefined(level.var_3ff1b984[weapon]))
	{
		return true;
	}
	return false;
}

/*
	Name: function_e3a30c69
	Namespace: killstreaks
	Checksum: 0x7C3A61EA
	Offset: 0x640
	Size: 0x8C
	Parameters: 1
	Flags: None
*/
function function_e3a30c69(weapon)
{
	/#
		assert(isdefined(isdefined(level.killstreakweapons[weapon])));
	#/
	killstreak = level.killstreaks[level.killstreakweapons[weapon]];
	return true;
}

/*
	Name: is_killstreak_weapon
	Namespace: killstreaks
	Checksum: 0x23E1A0AE
	Offset: 0x6D8
	Size: 0x70
	Parameters: 1
	Flags: Linked
*/
function is_killstreak_weapon(weapon)
{
	if(!isdefined(weapon))
	{
		return false;
	}
	if(weapon == level.weaponnone || weapon.notkillstreak)
	{
		return false;
	}
	if(weapon.isspecificuse || is_weapon_associated_with_killstreak(weapon))
	{
		return true;
	}
	return false;
}

/*
	Name: get_killstreak_weapon
	Namespace: killstreaks
	Checksum: 0xD364A8B7
	Offset: 0x750
	Size: 0x5A
	Parameters: 1
	Flags: Linked
*/
function get_killstreak_weapon(killstreak)
{
	if(!isdefined(killstreak))
	{
		return level.weaponnone;
	}
	/#
		assert(isdefined(level.killstreaks[killstreak]));
	#/
	return level.killstreaks[killstreak].weapon;
}

/*
	Name: function_c5927b3f
	Namespace: killstreaks
	Checksum: 0x5DF52C4F
	Offset: 0x7B8
	Size: 0x1E
	Parameters: 1
	Flags: Linked
*/
function function_c5927b3f(weapon)
{
	return isdefined(level.var_b1dfdc3b[weapon]);
}

/*
	Name: is_weapon_associated_with_killstreak
	Namespace: killstreaks
	Checksum: 0x8000797B
	Offset: 0x7E0
	Size: 0x1E
	Parameters: 1
	Flags: Linked
*/
function is_weapon_associated_with_killstreak(weapon)
{
	return isdefined(level.killstreakweapons[weapon]);
}

/*
	Name: function_4a1fb0f
	Namespace: killstreaks
	Checksum: 0x1E0D6BE9
	Offset: 0x808
	Size: 0xA2
	Parameters: 0
	Flags: None
*/
function function_4a1fb0f()
{
	onkillstreak = 0;
	if(!isdefined(self.pers[#"kill_streak_before_death"]))
	{
		self.pers[#"kill_streak_before_death"] = 0;
	}
	streakplusone = self.pers[#"kill_streak_before_death"] + 1;
	if(self.pers[#"kill_streak_before_death"] >= 5)
	{
		onkillstreak = 1;
	}
	return onkillstreak;
}

/*
	Name: get_killstreak_team_kill_penalty_scale
	Namespace: killstreaks
	Checksum: 0x473C5925
	Offset: 0x8B8
	Size: 0x7E
	Parameters: 1
	Flags: None
*/
function get_killstreak_team_kill_penalty_scale(weapon)
{
	killstreak = get_killstreak_for_weapon(weapon);
	if(!isdefined(killstreak))
	{
		return 1;
	}
	return (isdefined(level.killstreaks[killstreak].teamkillpenaltyscale) ? level.killstreaks[killstreak].teamkillpenaltyscale : 1);
}

/*
	Name: get_killstreak_for_weapon
	Namespace: killstreaks
	Checksum: 0xF411094B
	Offset: 0x940
	Size: 0x5C
	Parameters: 1
	Flags: Linked
*/
function get_killstreak_for_weapon(weapon)
{
	if(!isdefined(level.killstreakweapons))
	{
		return undefined;
	}
	if(isdefined(level.killstreakweapons[weapon]))
	{
		return level.killstreakweapons[weapon];
	}
	return level.killstreakweapons[weapon.rootweapon];
}

/*
	Name: function_73b4659
	Namespace: killstreaks
	Checksum: 0x94CDE01D
	Offset: 0x9A8
	Size: 0x62
	Parameters: 1
	Flags: Linked
*/
function function_73b4659(killstreak)
{
	if(isdefined(killstreak))
	{
		prefix = "inventory_";
		if(strstartswith(killstreak, prefix))
		{
			killstreak = getsubstr(killstreak, prefix.size);
		}
	}
	return killstreak;
}

/*
	Name: get_killstreak_for_weapon_for_stats
	Namespace: killstreaks
	Checksum: 0x20AD3993
	Offset: 0xA18
	Size: 0x42
	Parameters: 1
	Flags: Linked
*/
function get_killstreak_for_weapon_for_stats(weapon)
{
	killstreak = get_killstreak_for_weapon(weapon);
	return function_73b4659(killstreak);
}

/*
	Name: function_a2c375bb
	Namespace: killstreaks
	Checksum: 0x55865677
	Offset: 0xA68
	Size: 0x108
	Parameters: 1
	Flags: Linked
*/
function function_a2c375bb(killstreaktype)
{
	if(!isdefined(killstreaktype))
	{
		return undefined;
	}
	if(self.usingkillstreakfrominventory === 1)
	{
		return 3;
	}
	killstreak_weapon = get_killstreak_weapon(killstreaktype);
	keys = getarraykeys(self.killstreak);
	foreach(key in keys)
	{
		if(self.killstreak[key] === killstreak_weapon.rootweapon.name)
		{
			return key;
		}
	}
	return undefined;
}

/*
	Name: function_fde227c6
	Namespace: killstreaks
	Checksum: 0x771D0DA9
	Offset: 0xB78
	Size: 0xCA
	Parameters: 2
	Flags: Linked
*/
function function_fde227c6(weapon, stat_weapon)
{
	/#
		assert(weapon.iscarriedkillstreak);
	#/
	/#
		assert(stat_weapon.iscarriedkillstreak);
	#/
	if(weapon.var_6f41c2a9)
	{
		/#
			assert(isdefined(level.var_6110cb51[stat_weapon]));
		#/
		/#
			assert(level.var_6110cb51[stat_weapon] != level.weaponnone);
		#/
		return level.var_6110cb51[stat_weapon];
	}
	return stat_weapon;
}

/*
	Name: function_fa6e0467
	Namespace: killstreaks
	Checksum: 0xE5064FAF
	Offset: 0xC50
	Size: 0xD4
	Parameters: 1
	Flags: Linked
*/
function function_fa6e0467(weapon)
{
	if(weapon.iscliponly)
	{
		self setweaponammoclip(weapon, self.pers[#"held_killstreak_ammo_count"][weapon]);
	}
	else
	{
		self setweaponammoclip(weapon, self.pers[#"held_killstreak_clip_count"][weapon]);
		self setweaponammostock(weapon, self.pers[#"held_killstreak_ammo_count"][weapon] - self.pers[#"held_killstreak_clip_count"][weapon]);
	}
}

/*
	Name: function_43f4782d
	Namespace: killstreaks
	Checksum: 0xD263C69E
	Offset: 0xD30
	Size: 0xAA
	Parameters: 0
	Flags: Linked
*/
function function_43f4782d()
{
	airsupport_height = struct::get("air_support_height", "targetname");
	if(isdefined(airsupport_height))
	{
		height = airsupport_height.origin[2];
	}
	else
	{
		/#
			println("");
		#/
		height = 1000;
		if(isdefined(level.mapcenter))
		{
			height = height + level.mapcenter[2];
		}
	}
	return height;
}

/*
	Name: function_a021023d
	Namespace: killstreaks
	Checksum: 0x3FA4D39D
	Offset: 0xDE8
	Size: 0x14C
	Parameters: 6
	Flags: Linked, Private
*/
function private function_a021023d(rotator, angle, radius, var_b468418b, rotation_direction, roll)
{
	radiusoffset = radius + (var_b468418b == 0 ? 0 : randomint(var_b468418b));
	xoffset = cos(angle) * radiusoffset;
	yoffset = sin(angle) * radiusoffset;
	anglevector = vectornormalize((xoffset, yoffset, 0));
	anglevector = anglevector * radius;
	anglevector = (anglevector[0], anglevector[1], 0);
	angle_offset = 90 * (rotation_direction < 0 ? -1 : 1);
	self linkto(rotator, "tag_origin", anglevector, (0, angle + angle_offset, roll));
}

/*
	Name: function_67d553c4
	Namespace: killstreaks
	Checksum: 0x1AD77CC1
	Offset: 0xF40
	Size: 0x84
	Parameters: 5
	Flags: None
*/
function function_67d553c4(rotator, radius, var_b468418b, rotation_direction, roll)
{
	if(!isdefined(roll))
	{
		roll = 0;
	}
	angle = randomint(360);
	self function_a021023d(rotator, angle, radius, var_b468418b, rotation_direction, roll);
}

/*
	Name: function_d7123898
	Namespace: killstreaks
	Checksum: 0xD871C76D
	Offset: 0xFD0
	Size: 0xE4
	Parameters: 4
	Flags: None
*/
function function_d7123898(rotator, var_4fb9010a, rotation_direction, roll)
{
	if(!isdefined(roll))
	{
		roll = 0;
	}
	originoffset = (var_4fb9010a[0], var_4fb9010a[1], rotator.origin[2]) - rotator.origin;
	angle = vectortoangles(originoffset)[1] - rotator.angles[1];
	radius = length(originoffset);
	self function_a021023d(rotator, angle, radius, 0, rotation_direction, roll);
}

/*
	Name: function_f3875fb0
	Namespace: killstreaks
	Checksum: 0x171EE72B
	Offset: 0x10C0
	Size: 0x188
	Parameters: 5
	Flags: None
*/
function function_f3875fb0(var_d22c85cf, height_offset, var_b6417305, rotation_direction, var_e690ed4e)
{
	if(!isdefined(var_e690ed4e))
	{
		var_e690ed4e = 0;
	}
	height = int(function_43f4782d()) + height_offset;
	var_564cfb64 = ((isdefined(var_d22c85cf[0]) ? var_d22c85cf[0] : level.mapcenter[0]), (isdefined(var_d22c85cf[1]) ? var_d22c85cf[1] : level.mapcenter[1]), height);
	rotator = spawn("script_model", var_564cfb64);
	rotator setmodel(#"tag_origin");
	rotator.angles = vectorscale((0, 1, 0), 115);
	rotator hide();
	rotator thread function_1ddb2653(var_b6417305, rotation_direction);
	if(var_e690ed4e)
	{
		rotator thread function_8294e9b3();
	}
	rotator setforcenocull();
	return rotator;
}

/*
	Name: function_1ddb2653
	Namespace: killstreaks
	Checksum: 0xB3C25DCF
	Offset: 0x1250
	Size: 0x66
	Parameters: 2
	Flags: Linked
*/
function function_1ddb2653(seconds, direction)
{
	self endon(#"death");
	for(;;)
	{
		self rotateyaw(360 * (direction < 0 ? -1 : 1), seconds);
		wait(seconds);
	}
}

/*
	Name: function_8294e9b3
	Namespace: killstreaks
	Checksum: 0xB97B01A7
	Offset: 0x12C0
	Size: 0x11E
	Parameters: 0
	Flags: Linked
*/
function function_8294e9b3()
{
	self endon(#"death");
	centerorigin = self.origin;
	for(;;)
	{
		z = randomintrange(-200, -100);
		time = randomintrange(3, 6);
		self moveto(centerorigin + (0, 0, z), time, 1, 1);
		wait(time);
		z = randomintrange(100, 200);
		time = randomintrange(3, 6);
		self moveto(centerorigin + (0, 0, z), time, 1, 1);
		wait(time);
	}
}

/*
	Name: function_5a7ecb6b
	Namespace: killstreaks
	Checksum: 0x809300D3
	Offset: 0x13E8
	Size: 0xC4
	Parameters: 1
	Flags: Linked
*/
function function_5a7ecb6b(var_56422be)
{
	if(!isdefined(var_56422be))
	{
		var_56422be = 0.01;
	}
	self endon(#"death");
	scale = 0.1;
	var_e78462ea = 0.1;
	while(scale < 1)
	{
		self setscale(scale);
		waitframe(1);
		scale = scale + var_e78462ea;
		if(var_e78462ea > var_56422be + 0.01)
		{
			var_e78462ea = var_e78462ea - var_56422be;
		}
	}
	self setscale(1);
}

/*
	Name: function_3696d106
	Namespace: killstreaks
	Checksum: 0x5E05CB03
	Offset: 0x14B8
	Size: 0x11C
	Parameters: 1
	Flags: Linked
*/
function function_3696d106(var_56422be)
{
	if(!isdefined(var_56422be))
	{
		var_56422be = 0.001;
	}
	self endon(#"death");
	if(target_istarget(self))
	{
		target_remove(self);
	}
	if(issentient(self))
	{
		self function_60d50ea4();
	}
	scale = 0.99;
	var_e78462ea = 0.01;
	while(scale > 0.01)
	{
		self setscale(scale);
		waitframe(1);
		scale = scale - var_e78462ea;
		if(var_e78462ea < 0.1)
		{
			var_e78462ea = var_e78462ea + var_56422be;
		}
	}
	self hide();
}

/*
	Name: function_e729ccee
	Namespace: killstreaks
	Checksum: 0x1328040C
	Offset: 0x15E0
	Size: 0x7E
	Parameters: 2
	Flags: Linked
*/
function function_e729ccee(attacker, weapon)
{
	killstreaktype = get_killstreak_for_weapon(weapon);
	if(isdefined(killstreaktype) && (killstreaktype == "planemortar" || killstreaktype == "remote_missile"))
	{
		attacker.(killstreaktype + "_hitconfirmed") = 1;
	}
}

/*
	Name: function_59e2c378
	Namespace: killstreaks
	Checksum: 0x70D8B24E
	Offset: 0x1668
	Size: 0x40
	Parameters: 0
	Flags: Linked
*/
function function_59e2c378()
{
	if(is_true(level.var_e80a117f) && self arecontrolsfrozen())
	{
		return false;
	}
	return true;
}

/*
	Name: function_eb52ba7
	Namespace: killstreaks
	Checksum: 0x1D6C7706
	Offset: 0x16B0
	Size: 0x1BC
	Parameters: 3
	Flags: Linked
*/
function function_eb52ba7(killstreaktype, team, killstreak_id)
{
	var_88dc634d = hash(killstreaktype);
	if(isdefined(self.var_9fa3bd36[killstreak_id]) || isdefined(self.var_63fa6458[var_88dc634d]))
	{
		return;
	}
	session = {#hash_6e1d768e:#"", #end_reason:#"hash_49690d3b97372410", #kills:0, #team:team, #endtime:0, #starttime:function_f8d53445(), #name:var_88dc634d, #spawnid:getplayerspawnid(self)};
	weapon = get_killstreak_weapon(killstreaktype);
	if(weapon.iscarriedkillstreak === 1)
	{
		if(!isdefined(self.var_63fa6458))
		{
			self.var_63fa6458 = [];
		}
		self.var_63fa6458[var_88dc634d] = session;
	}
	else
	{
		if(!isdefined(self.var_9fa3bd36))
		{
			self.var_9fa3bd36 = [];
		}
		self.var_9fa3bd36[killstreak_id] = session;
	}
}

/*
	Name: function_fda235cf
	Namespace: killstreaks
	Checksum: 0xD6358529
	Offset: 0x1878
	Size: 0xCE
	Parameters: 3
	Flags: Linked
*/
function function_fda235cf(killstreaktype, killstreak_id, end_reason)
{
	var_571c684 = function_73b4659(killstreaktype);
	if(isdefined(level.var_11e725c2[var_571c684]))
	{
		var_4fbb4b53 = level.var_11e725c2[var_571c684];
	}
	else
	{
		var_4fbb4b53 = &function_79e49b15;
	}
	params = {#end_reason:end_reason, #killstreak_id:killstreak_id, #killstreaktype:var_571c684};
	[[var_4fbb4b53]](params);
}

/*
	Name: function_79e49b15
	Namespace: killstreaks
	Checksum: 0x86512091
	Offset: 0x1950
	Size: 0x22C
	Parameters: 1
	Flags: Linked
*/
function function_79e49b15(params)
{
	killstreaktype = params.killstreaktype;
	killstreak_id = params.killstreak_id;
	end_reason = params.end_reason;
	weapon = get_killstreak_weapon(killstreaktype);
	if(weapon.iscarriedkillstreak === 1)
	{
		var_88dc634d = hash(killstreaktype);
		if(isdefined(self.var_63fa6458[var_88dc634d]))
		{
			self.var_63fa6458[var_88dc634d].endtime = function_f8d53445();
			self.var_63fa6458[var_88dc634d].end_reason = (isdefined(end_reason) ? end_reason : self.var_63fa6458[var_88dc634d].end_reason);
			var_8756d70f = function_16a1f9b6();
			self function_678f57c8(var_8756d70f, self.var_63fa6458[var_88dc634d]);
			self.var_63fa6458[var_88dc634d] = undefined;
		}
	}
	else if(isdefined(self.var_9fa3bd36[killstreak_id]))
	{
		self.var_9fa3bd36[killstreak_id].endtime = function_f8d53445();
		self.var_9fa3bd36[killstreak_id].end_reason = (isdefined(end_reason) ? end_reason : self.var_9fa3bd36[killstreak_id].end_reason);
		var_8756d70f = function_16a1f9b6();
		self function_678f57c8(var_8756d70f, self.var_9fa3bd36[killstreak_id]);
		self.var_9fa3bd36[killstreak_id] = undefined;
	}
}

/*
	Name: function_ef1303ba
	Namespace: killstreaks
	Checksum: 0xFFFC71EC
	Offset: 0x1B88
	Size: 0x1E2
	Parameters: 2
	Flags: None
*/
function function_ef1303ba(end_time, end_reason)
{
	if(isdefined(self.var_63fa6458))
	{
		foreach(session in self.var_63fa6458)
		{
			session.endtime = end_time;
			session.end_reason = (isdefined(end_reason) ? end_reason : session.end_reason);
			var_8756d70f = function_16a1f9b6();
			self function_678f57c8(var_8756d70f, session);
		}
		self.var_63fa6458 = [];
	}
	if(isdefined(self.var_9fa3bd36))
	{
		foreach(session in self.var_9fa3bd36)
		{
			session.endtime = end_time;
			session.end_reason = (isdefined(end_reason) ? end_reason : session.end_reason);
			var_8756d70f = function_16a1f9b6();
			self function_678f57c8(var_8756d70f, session);
		}
		self.var_9fa3bd36 = [];
	}
}

/*
	Name: function_16a1f9b6
	Namespace: killstreaks
	Checksum: 0x9FDF9975
	Offset: 0x1D78
	Size: 0x4A
	Parameters: 0
	Flags: Linked
*/
function function_16a1f9b6()
{
	if(sessionmodeiszombiesgame())
	{
		var_8756d70f = #"hash_5c02726a4663b7dd";
	}
	else
	{
		var_8756d70f = #"hash_25d8f7d855b13f45";
	}
	return var_8756d70f;
}

/*
	Name: function_cb0594d5
	Namespace: killstreaks
	Checksum: 0x8B01FAB3
	Offset: 0x1DD0
	Size: 0x4A
	Parameters: 0
	Flags: Linked
*/
function function_cb0594d5()
{
	if(sessionmodeiszombiesgame())
	{
		var_8756d70f = #"hash_45468d6066fbc34e";
	}
	else
	{
		var_8756d70f = #"hash_710b205b26e46446";
	}
	return var_8756d70f;
}

/*
	Name: function_e9873ef7
	Namespace: killstreaks
	Checksum: 0xA86BDAC8
	Offset: 0x1E28
	Size: 0x112
	Parameters: 3
	Flags: Linked
*/
function function_e9873ef7(killstreaktype, killstreak_id, end_reason)
{
	weapon = get_killstreak_weapon(killstreaktype);
	if(weapon.iscarriedkillstreak === 1)
	{
		var_88dc634d = hash(killstreaktype);
		if(isdefined(self.var_63fa6458[var_88dc634d]))
		{
			self.var_63fa6458[var_88dc634d].end_reason = (isdefined(end_reason) ? end_reason : self.var_63fa6458[var_88dc634d].end_reason);
		}
	}
	else if(isdefined(self.var_9fa3bd36[killstreak_id]))
	{
		self.var_9fa3bd36[killstreak_id].end_reason = (isdefined(end_reason) ? end_reason : self.var_9fa3bd36[killstreak_id].end_reason);
	}
}

/*
	Name: function_4aad9803
	Namespace: killstreaks
	Checksum: 0x696823E
	Offset: 0x1F48
	Size: 0xE2
	Parameters: 3
	Flags: Linked
*/
function function_4aad9803(killstreaktype, killstreak_id, var_6e1d768e)
{
	if(!isdefined(var_6e1d768e))
	{
		return;
	}
	weapon = get_killstreak_weapon(killstreaktype);
	if(weapon.iscarriedkillstreak === 1)
	{
		var_88dc634d = hash(killstreaktype);
		if(isdefined(self.var_63fa6458[var_88dc634d]))
		{
			self.var_63fa6458[var_88dc634d].var_6e1d768e = var_6e1d768e.name;
		}
	}
	else if(isdefined(self.var_9fa3bd36[killstreak_id]))
	{
		self.var_9fa3bd36[killstreak_id].var_6e1d768e = var_6e1d768e.name;
	}
}

/*
	Name: function_1e016087
	Namespace: killstreaks
	Checksum: 0xC96EDA16
	Offset: 0x2038
	Size: 0x40
	Parameters: 2
	Flags: Linked
*/
function function_1e016087(killstreaktype, var_5c980521)
{
	if(!isdefined(level.var_11e725c2))
	{
		level.var_11e725c2 = [];
	}
	level.var_11e725c2[killstreaktype] = var_5c980521;
}

