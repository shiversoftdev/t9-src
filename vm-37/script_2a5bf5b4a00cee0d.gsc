#using script_164a456ce05c3483;
#using script_17dcb1172e441bf6;
#using script_1a9763988299e68d;
#using script_1b01e95a6b5270fd;
#using script_1b0b07ff57d1dde3;
#using script_1ee011cd0961afd7;
#using script_2a5bf5b4a00cee0d;
#using script_40f967ad5d18ea74;
#using script_47851dbeea22fe66;
#using script_4d748e58ce25b60c;
#using script_5701633066d199f2;
#using script_5f20d3b434d24884;
#using script_74a56359b7d02ab6;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\hud_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace namespace_ec06fe4a;

/*
	Name: function_ae010bb4
	Namespace: namespace_ec06fe4a
	Checksum: 0x67DE855
	Offset: 0x2C0
	Size: 0xCC
	Parameters: 1
	Flags: Linked
*/
function function_ae010bb4(player)
{
	/#
		assert(isdefined(self), "");
	#/
	/#
		assert(isdefined(player), "");
	#/
	/#
		assert(isplayer(player), "");
	#/
	self endon(#"death");
	player waittill(#"disconnect");
	if(isdefined(self))
	{
		self function_52afe5df(0.05);
	}
}

/*
	Name: function_8ff7f92c
	Namespace: namespace_ec06fe4a
	Checksum: 0x74CB00EF
	Offset: 0x398
	Size: 0x52
	Parameters: 1
	Flags: Linked
*/
function function_8ff7f92c(myteam)
{
	if(!isdefined(myteam))
	{
		myteam = "allies";
	}
	team = util::getotherteam(myteam);
	return getaiteamarray(team);
}

/*
	Name: getclosestenemy
	Namespace: namespace_ec06fe4a
	Checksum: 0xE3D90EDB
	Offset: 0x3F8
	Size: 0x8C
	Parameters: 1
	Flags: Linked
*/
function getclosestenemy(myteam)
{
	if(!isdefined(myteam))
	{
		myteam = "allies";
	}
	team = util::getotherteam(myteam);
	enemy = getaiteamarray(team);
	guys = arraysortclosest(enemy, self.origin);
	return guys[0];
}

/*
	Name: function_fe0a86bb
	Namespace: namespace_ec06fe4a
	Checksum: 0x92A19
	Offset: 0x490
	Size: 0x60
	Parameters: 1
	Flags: Linked
*/
function function_fe0a86bb(ent)
{
	arrayremovevalue(level.doa.var_af6d47dd, undefined);
	level.doa.var_af6d47dd[level.doa.var_af6d47dd.size] = ent;
}

/*
	Name: getclosestpoi
	Namespace: namespace_ec06fe4a
	Checksum: 0xD076C605
	Offset: 0x4F8
	Size: 0x19E
	Parameters: 2
	Flags: Linked
*/
function getclosestpoi(origin, var_5e23c42a)
{
	if(!isdefined(var_5e23c42a))
	{
		var_5e23c42a = sqr(200);
	}
	arrayremovevalue(level.doa.var_af6d47dd, undefined);
	if(level.doa.var_af6d47dd.size > 0)
	{
		pois = arraysortclosest(level.doa.var_af6d47dd, origin);
		foreach(poi in pois)
		{
			var_5e23c42a = (isdefined(poi.var_7f3187c5) ? poi.var_7f3187c5 : var_5e23c42a);
			distsq = distancesquared(poi.origin, origin);
			if(distsq < var_5e23c42a)
			{
				if(!isdefined(poi.var_860a34b9))
				{
					poi.var_860a34b9 = getclosestpointonnavmesh(poi.origin, 128, 30);
				}
				return poi;
			}
		}
	}
	return undefined;
}

/*
	Name: function_fb4eb048
	Namespace: namespace_ec06fe4a
	Checksum: 0x8BFE0019
	Offset: 0x6A0
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function function_fb4eb048(team)
{
	return getaiteamarray(team).size;
}

/*
	Name: function_38de0ce8
	Namespace: namespace_ec06fe4a
	Checksum: 0xEBD3DB3E
	Offset: 0x6D0
	Size: 0x14
	Parameters: 0
	Flags: Linked
*/
function function_38de0ce8()
{
	return getaiarray().size;
}

/*
	Name: function_9788bacc
	Namespace: namespace_ec06fe4a
	Checksum: 0xE7FB8863
	Offset: 0x6F0
	Size: 0x156
	Parameters: 1
	Flags: Linked
*/
function function_9788bacc(myteam)
{
	if(!isdefined(myteam))
	{
		myteam = "allies";
	}
	team = util::getotherteam(myteam);
	teamsize = 0;
	if(isdefined(level.doa.var_e2e8967b))
	{
		if(level.doa.var_e2e8967b.size)
		{
			arrayremovevalue(level.doa.var_e2e8967b, undefined);
		}
		foreach(guy in level.doa.var_e2e8967b)
		{
			if(guy.oldteam === team)
			{
				teamsize++;
			}
		}
	}
	teamsize = teamsize + getaiteamarray(team).size;
	return teamsize;
}

/*
	Name: function_52afe5df
	Namespace: namespace_ec06fe4a
	Checksum: 0x7C182C83
	Offset: 0x850
	Size: 0xCC
	Parameters: 1
	Flags: Linked
*/
function function_52afe5df(time)
{
	self endon(#"death");
	if(isdefined(time) && time > 0)
	{
		wait(time);
	}
	self notify(#"hash_717d9188a95b458f");
	if(isdefined(self.anchor))
	{
		self.anchor delete();
	}
	if(isdefined(self.pickup))
	{
		self.pickup = undefined;
	}
	if(isdefined(self.trigger))
	{
		self.trigger delete();
	}
	self deletedelay();
}

/*
	Name: function_b6b79fd1
	Namespace: namespace_ec06fe4a
	Checksum: 0x5951B08C
	Offset: 0x928
	Size: 0x22
	Parameters: 0
	Flags: Linked
*/
function function_b6b79fd1()
{
	while(function_9788bacc() > 0)
	{
		waitframe(1);
	}
}

/*
	Name: function_3b3bb5c
	Namespace: namespace_ec06fe4a
	Checksum: 0x6835B015
	Offset: 0x958
	Size: 0x58
	Parameters: 2
	Flags: None
*/
function function_3b3bb5c(var_687ec70b, dmg)
{
	self endon(#"death");
	while(true)
	{
		wait(var_687ec70b);
		self dodamage(dmg, self.origin);
	}
}

/*
	Name: function_de70888a
	Namespace: namespace_ec06fe4a
	Checksum: 0x9FE542FA
	Offset: 0x9B8
	Size: 0x19E
	Parameters: 1
	Flags: Linked
*/
function function_de70888a(var_c91f42eb)
{
	if(!isdefined(var_c91f42eb))
	{
		var_c91f42eb = 1;
	}
	level.doa.var_1b8c7044 = 1;
	while(function_9788bacc() > 0)
	{
		level.doa.var_dcbded2 = [];
		enemies = function_8ff7f92c();
		foreach(badguy in enemies)
		{
			if(is_true(badguy.boss) && var_c91f42eb == 0)
			{
				continue;
			}
			if(isdefined(badguy.var_d1fac34a))
			{
				badguy.var_d1fac34a.count++;
				arrayremovevalue(badguy.var_d1fac34a.var_2b5ed682, badguy);
				badguy.var_d1fac34a = undefined;
			}
			badguy thread function_570729f0(0);
		}
		waitframe(1);
	}
	level.doa.var_1b8c7044 = 0;
}

/*
	Name: function_a4b3f184
	Namespace: namespace_ec06fe4a
	Checksum: 0x5659E73F
	Offset: 0xB60
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function function_a4b3f184(frozen)
{
	if(!isdefined(frozen))
	{
		frozen = 1;
	}
	self.doa.var_a5eb0385 = frozen;
	self freezecontrols(frozen);
}

/*
	Name: function_445bad70
	Namespace: namespace_ec06fe4a
	Checksum: 0x58C9104B
	Offset: 0xBB0
	Size: 0xD0
	Parameters: 1
	Flags: Linked
*/
function function_445bad70(frozen)
{
	if(!isdefined(frozen))
	{
		frozen = 1;
	}
	players = namespace_7f5aeb59::function_23e1f90f();
	foreach(player in players)
	{
		player function_a4b3f184(frozen);
		player setlowready(frozen);
	}
}

/*
	Name: function_570729f0
	Namespace: namespace_ec06fe4a
	Checksum: 0xD2DA6644
	Offset: 0xC88
	Size: 0x16E
	Parameters: 4
	Flags: Linked
*/
function function_570729f0(time, attacker, mod, weapon)
{
	if(!isdefined(time))
	{
		time = 0;
	}
	if(!isdefined(mod))
	{
		mod = "MOD_HIT_BY_OBJECT";
	}
	/#
		assert(!isplayer(self));
	#/
	self endon(#"death");
	self.marked_for_death = 1;
	if(time > 0)
	{
		wait(time);
	}
	else
	{
		util::wait_network_frame();
	}
	self.takedamage = 1;
	self.allowdeath = 1;
	if(isdefined(attacker))
	{
		self dodamage(self.health, self.origin, attacker, attacker, "none", mod, 0, (isdefined(weapon) ? weapon : getweapon("none")));
	}
	else
	{
		self dodamage(self.health, self.origin);
	}
	self.marked_for_death = undefined;
}

/*
	Name: function_5678f0d
	Namespace: namespace_ec06fe4a
	Checksum: 0x3EE70D6F
	Offset: 0xE00
	Size: 0x174
	Parameters: 4
	Flags: Linked
*/
function function_5678f0d(dir, var_594fccd3, var_f44be073, attacker)
{
	if(!isdefined(var_594fccd3))
	{
		var_594fccd3 = 100;
	}
	if(!isdefined(var_f44be073))
	{
		var_f44be073 = 0.1;
	}
	if(!isdefined(self) || isplayer(self))
	{
		return;
	}
	self thread function_570729f0(var_f44be073, attacker, "MOD_EXPLOSIVE", level.doa.default_weapon);
	if(is_true(self.no_ragdoll))
	{
		return;
	}
	namespace_1e25ad94::debugmsg((("ragdolling entity:" + self getentitynumber()) + " of type:") + self.classname);
	self endon(#"death");
	self setplayercollision(0);
	self startragdoll();
	if(isdefined(dir))
	{
		dir = vectornormalize(dir);
		self launchragdoll(dir * var_594fccd3);
	}
}

/*
	Name: function_592e0d6b
	Namespace: namespace_ec06fe4a
	Checksum: 0x8E6153A1
	Offset: 0xF80
	Size: 0xFC
	Parameters: 0
	Flags: Linked
*/
function function_592e0d6b()
{
	self notify("44984378ade0fcc");
	self endon("44984378ade0fcc");
	while(true)
	{
		wait(1);
		corpse_array = getcorpsearray();
		foreach(corpse in corpse_array)
		{
			if(!isdefined(corpse.var_b0d4cf4b))
			{
				corpse.var_b0d4cf4b = 5;
				corpse thread function_52afe5df(corpse.var_b0d4cf4b);
			}
		}
	}
}

/*
	Name: clearallcorpses
	Namespace: namespace_ec06fe4a
	Checksum: 0x835453CE
	Offset: 0x1088
	Size: 0xDC
	Parameters: 1
	Flags: Linked
*/
function clearallcorpses(num)
{
	if(!isdefined(num))
	{
		num = 99;
	}
	level thread function_592e0d6b();
	corpse_array = getcorpsearray();
	if(num == 99)
	{
		total = corpse_array.size;
	}
	else
	{
		total = num;
	}
	for(i = 0; i < total; i++)
	{
		if(is_true(corpse_array[i].var_931f033a))
		{
			continue;
		}
		if(isdefined(corpse_array[i]))
		{
			corpse_array[i] delete();
		}
	}
}

/*
	Name: function_d55f042c
	Namespace: namespace_ec06fe4a
	Checksum: 0xDE90E40A
	Offset: 0x1170
	Size: 0xFC
	Parameters: 2
	Flags: Linked
*/
function function_d55f042c(other, note)
{
	if(!isdefined(other))
	{
		return;
	}
	self endon(#"death");
	killnote = function_7fcca25d("DeleteNote");
	self thread function_719951d3(other, killnote);
	if(isplayer(other))
	{
		if(note == "disconnect")
		{
			other waittill(note, killnote);
		}
		else
		{
			other waittill(note, #"disconnect", killnote);
		}
	}
	else
	{
		other waittill(note, killnote);
	}
	if(isdefined(self))
	{
		self function_52afe5df(0);
	}
}

/*
	Name: function_203591b7
	Namespace: namespace_ec06fe4a
	Checksum: 0xDA726A4B
	Offset: 0x1278
	Size: 0xF6
	Parameters: 3
	Flags: Linked
*/
function function_203591b7(other, note, var_df2b8649)
{
	if(!isdefined(other))
	{
		return;
	}
	self endon(#"death");
	killnote = function_7fcca25d("DeleteNote");
	self thread function_719951d3(other, killnote);
	if(isplayer(other))
	{
		if(note == "disconnect")
		{
			other waittill(note, killnote);
		}
		else
		{
			other waittill(note, #"disconnect", killnote);
		}
	}
	else
	{
		other waittill(note, killnote);
	}
	if(isdefined(self))
	{
		self notify(var_df2b8649);
	}
}

/*
	Name: function_719951d3
	Namespace: namespace_ec06fe4a
	Checksum: 0x995E3D26
	Offset: 0x1378
	Size: 0x5C
	Parameters: 2
	Flags: Linked
*/
function function_719951d3(other, note)
{
	self endon(note);
	other endon(#"death");
	self waittill(#"death");
	if(isdefined(other))
	{
		other notify(note);
	}
}

/*
	Name: function_ad852085
	Namespace: namespace_ec06fe4a
	Checksum: 0xA81F6D5F
	Offset: 0x13E0
	Size: 0x124
	Parameters: 2
	Flags: Linked
*/
function function_ad852085(other, note)
{
	if(!isdefined(other))
	{
		return;
	}
	self endon(#"death");
	killnote = function_7fcca25d("killNote");
	self thread function_719951d3(other, killnote);
	if(isplayer(other))
	{
		if(note == "disconnect")
		{
			other waittill(note, killnote);
		}
		else
		{
			other waittill(note, #"disconnect", killnote);
		}
	}
	else
	{
		other waittill(note, killnote);
	}
	if(isdefined(self))
	{
		self notify(killnote);
		self.aioverridedamage = undefined;
		self.takedamage = 1;
		self.allowdeath = 1;
		self thread function_570729f0(0);
	}
}

/*
	Name: deletemeonnotify
	Namespace: namespace_ec06fe4a
	Checksum: 0x93FBD640
	Offset: 0x1510
	Size: 0x5C
	Parameters: 2
	Flags: Linked
*/
function deletemeonnotify(note, delay)
{
	if(!isdefined(delay))
	{
		delay = 1;
	}
	self endon(#"death");
	self waittill(note);
	self thread function_52afe5df(delay);
}

/*
	Name: function_7fcca25d
	Namespace: namespace_ec06fe4a
	Checksum: 0x40D71DE7
	Offset: 0x1578
	Size: 0x60
	Parameters: 1
	Flags: Linked
*/
function function_7fcca25d(note)
{
	if(!isdefined(level.doa.var_3898afe7))
	{
		level.doa.var_3898afe7 = 0;
	}
	level.doa.var_3898afe7++;
	return note + level.doa.var_3898afe7;
}

/*
	Name: function_3390402b
	Namespace: namespace_ec06fe4a
	Checksum: 0x8AB74145
	Offset: 0x15E0
	Size: 0x58
	Parameters: 0
	Flags: Linked
*/
function function_3390402b()
{
	if(!isdefined(level.doa.var_8f229afa))
	{
		level.doa.var_8f229afa = 0;
	}
	level.doa.var_8f229afa++;
	return "doa_dynamic_" + level.doa.var_8f229afa;
}

/*
	Name: velocity_to_mph
	Namespace: namespace_ec06fe4a
	Checksum: 0xCA94D98D
	Offset: 0x1640
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function velocity_to_mph(vel)
{
	return length(vel) * 0.05681818;
}

/*
	Name: function_f506b4c7
	Namespace: namespace_ec06fe4a
	Checksum: 0x20C696F
	Offset: 0x1678
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function function_f506b4c7(time)
{
	if(!isdefined(time))
	{
		time = 4;
	}
	self thread function_2d920b3c(time);
}

/*
	Name: function_2d920b3c
	Namespace: namespace_ec06fe4a
	Checksum: 0x308A98AD
	Offset: 0x16B8
	Size: 0xCE
	Parameters: 2
	Flags: Linked
*/
function function_2d920b3c(var_bf710acd, clockwise)
{
	if(!isdefined(var_bf710acd))
	{
		var_bf710acd = 0.6;
	}
	if(!isdefined(clockwise))
	{
		clockwise = 1;
	}
	self endon(#"death", #"hash_7bf2519960a3852a");
	angle = (clockwise ? vectorscale((0, 1, 0), 180) : vectorscale((0, -1, 0), 180));
	while(isdefined(self))
	{
		self.var_c9f66f0d = self.angles + angle;
		self rotateto(self.var_c9f66f0d, var_bf710acd);
		wait(var_bf710acd);
	}
}

/*
	Name: function_8b1ae345
	Namespace: namespace_ec06fe4a
	Checksum: 0xF03AB944
	Offset: 0x1790
	Size: 0x166
	Parameters: 3
	Flags: Linked
*/
function function_8b1ae345(time, dist, killnote)
{
	if(!isdefined(time))
	{
		time = 2;
	}
	if(!isdefined(dist))
	{
		dist = 24;
	}
	self endon(#"death");
	if(isdefined(killnote))
	{
		self endon(killnote);
	}
	cycle_time = time;
	var_c421a5fd = dist;
	var_e9fa66c6 = cycle_time / 2;
	start_origin = self.origin;
	top = self.origin + (0, 0, var_c421a5fd);
	bottom = self.origin - (0, 0, var_c421a5fd);
	while(true)
	{
		self moveto(top, var_e9fa66c6, 0.2, 0.2);
		wait(var_e9fa66c6);
		self moveto(bottom, var_e9fa66c6, 0.2, 0.2);
		wait(var_e9fa66c6);
	}
}

/*
	Name: function_1ebe83a7
	Namespace: namespace_ec06fe4a
	Checksum: 0x98F82EA3
	Offset: 0x1900
	Size: 0xD6
	Parameters: 3
	Flags: Linked
*/
function function_1ebe83a7(startscale, var_4dad59c0, timems)
{
	if(!isdefined(var_4dad59c0))
	{
		var_4dad59c0 = 1;
	}
	if(!isdefined(timems))
	{
		timems = 3000;
	}
	self endon(#"death");
	curscale = startscale;
	var_c7fbfa53 = (var_4dad59c0 - startscale) / (timems / 50);
	endtime = gettime() + timems;
	while(isdefined(self) && gettime() < endtime)
	{
		curscale = curscale + var_c7fbfa53;
		self setscale(curscale);
		waitframe(1);
	}
}

/*
	Name: getyawtospot
	Namespace: namespace_ec06fe4a
	Checksum: 0xDB05CC47
	Offset: 0x19E0
	Size: 0x62
	Parameters: 1
	Flags: None
*/
function getyawtospot(spot)
{
	pos = spot;
	yaw = self.angles[1] - getyaw(pos);
	yaw = angleclamp180(yaw);
	return yaw;
}

/*
	Name: getyawtoenemy
	Namespace: namespace_ec06fe4a
	Checksum: 0xF49C42BE
	Offset: 0x1A50
	Size: 0xCA
	Parameters: 0
	Flags: Linked
*/
function getyawtoenemy()
{
	pos = undefined;
	if(isvalidenemy(self.enemy))
	{
		pos = self.enemy.origin;
	}
	else
	{
		forward = anglestoforward(self.angles);
		forward = vectorscale(forward, 150);
		pos = self.origin + forward;
	}
	yaw = self.angles[1] - getyaw(pos);
	yaw = angleclamp180(yaw);
	return yaw;
}

/*
	Name: isvalidenemy
	Namespace: namespace_ec06fe4a
	Checksum: 0x55081247
	Offset: 0x1B28
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function isvalidenemy(enemy)
{
	if(!isdefined(enemy))
	{
		return false;
	}
	return true;
}

/*
	Name: getyaw
	Namespace: namespace_ec06fe4a
	Checksum: 0xBBA418ED
	Offset: 0x1B50
	Size: 0x3E
	Parameters: 1
	Flags: Linked
*/
function getyaw(org)
{
	angles = vectortoangles(org - self.origin);
	return angles[1];
}

/*
	Name: getyaw2d
	Namespace: namespace_ec06fe4a
	Checksum: 0x442DE31B
	Offset: 0x1B98
	Size: 0x66
	Parameters: 1
	Flags: Linked
*/
function getyaw2d(org)
{
	angles = vectortoangles((org[0], org[1], 0) - (self.origin[0], self.origin[1], 0));
	return angles[1];
}

/*
	Name: absyawtoenemy
	Namespace: namespace_ec06fe4a
	Checksum: 0x4984DCA4
	Offset: 0x1C08
	Size: 0xA2
	Parameters: 0
	Flags: Linked
*/
function absyawtoenemy()
{
	/#
		assert(isvalidenemy(self.enemy));
	#/
	yaw = self.angles[1] - getyaw(self.enemy.origin);
	yaw = angleclamp180(yaw);
	if(yaw < 0)
	{
		yaw = -1 * yaw;
	}
	return yaw;
}

/*
	Name: absyawtoenemy2d
	Namespace: namespace_ec06fe4a
	Checksum: 0x181A96B
	Offset: 0x1CB8
	Size: 0xA2
	Parameters: 0
	Flags: None
*/
function absyawtoenemy2d()
{
	/#
		assert(isvalidenemy(self.enemy));
	#/
	yaw = self.angles[1] - getyaw2d(self.enemy.origin);
	yaw = angleclamp180(yaw);
	if(yaw < 0)
	{
		yaw = -1 * yaw;
	}
	return yaw;
}

/*
	Name: absyawtoorigin
	Namespace: namespace_ec06fe4a
	Checksum: 0x44B355D4
	Offset: 0x1D68
	Size: 0x6A
	Parameters: 1
	Flags: None
*/
function absyawtoorigin(org)
{
	yaw = self.angles[1] - getyaw(org);
	yaw = angleclamp180(yaw);
	if(yaw < 0)
	{
		yaw = -1 * yaw;
	}
	return yaw;
}

/*
	Name: absyawtoangles
	Namespace: namespace_ec06fe4a
	Checksum: 0x71848418
	Offset: 0x1DE0
	Size: 0x5A
	Parameters: 1
	Flags: None
*/
function absyawtoangles(angles)
{
	yaw = self.angles[1] - angles;
	yaw = angleclamp180(yaw);
	if(yaw < 0)
	{
		yaw = -1 * yaw;
	}
	return yaw;
}

/*
	Name: getyawfromorigin
	Namespace: namespace_ec06fe4a
	Checksum: 0xBF763B02
	Offset: 0x1E48
	Size: 0x3E
	Parameters: 2
	Flags: Linked
*/
function getyawfromorigin(org, start)
{
	angles = vectortoangles(org - start);
	return angles[1];
}

/*
	Name: getyawtotag
	Namespace: namespace_ec06fe4a
	Checksum: 0x5C50C7E5
	Offset: 0x1E90
	Size: 0x7A
	Parameters: 2
	Flags: None
*/
function getyawtotag(tag, org)
{
	yaw = self gettagangles(tag)[1] - getyawfromorigin(org, self gettagorigin(tag));
	yaw = angleclamp180(yaw);
	return yaw;
}

/*
	Name: getyawtoorigin
	Namespace: namespace_ec06fe4a
	Checksum: 0x937CF6C5
	Offset: 0x1F18
	Size: 0x52
	Parameters: 1
	Flags: None
*/
function getyawtoorigin(org)
{
	yaw = self.angles[1] - getyaw(org);
	yaw = angleclamp180(yaw);
	return yaw;
}

/*
	Name: geteyeyawtoorigin
	Namespace: namespace_ec06fe4a
	Checksum: 0xB044CEB0
	Offset: 0x1F78
	Size: 0x6A
	Parameters: 1
	Flags: None
*/
function geteyeyawtoorigin(org)
{
	yaw = self gettagangles("TAG_EYE")[1] - getyaw(org);
	yaw = angleclamp180(yaw);
	return yaw;
}

/*
	Name: getcovernodeyawtoorigin
	Namespace: namespace_ec06fe4a
	Checksum: 0xC2ACF76A
	Offset: 0x1FF0
	Size: 0x82
	Parameters: 1
	Flags: None
*/
function getcovernodeyawtoorigin(org)
{
	yaw = (self.covernode.angles[1] + self.animarray[#"angle_step_out"][self.a.cornermode]) - getyaw(org);
	yaw = angleclamp180(yaw);
	return yaw;
}

/*
	Name: function_f1e8ce76
	Namespace: namespace_ec06fe4a
	Checksum: 0x3B8D26CD
	Offset: 0x2080
	Size: 0x98
	Parameters: 2
	Flags: Linked
*/
function function_f1e8ce76(vector, angle)
{
	return ((vector[0] * cos(angle)) - (vector[1] * sin(angle)), (vector[0] * sin(angle)) + (vector[1] * cos(angle)), vector[2]);
}

/*
	Name: function_65ee50ba
	Namespace: namespace_ec06fe4a
	Checksum: 0xC2C37583
	Offset: 0x2120
	Size: 0x86
	Parameters: 3
	Flags: Linked
*/
function function_65ee50ba(start, var_e22b9651, var_51a8354e)
{
	if(!isdefined(var_e22b9651))
	{
		var_e22b9651 = 48;
	}
	if(!isdefined(var_51a8354e))
	{
		var_51a8354e = -1024;
	}
	s_trace = groundtrace(start + (0, 0, var_e22b9651), start + (0, 0, var_51a8354e), 0, self);
	return s_trace[#"position"];
}

/*
	Name: function_1a117d29
	Namespace: namespace_ec06fe4a
	Checksum: 0x4F1D041
	Offset: 0x21B0
	Size: 0x136
	Parameters: 2
	Flags: Linked
*/
function function_1a117d29(location, timesec)
{
	if(!isdefined(timesec))
	{
		timesec = 1;
	}
	self notify(#"hash_1a927c82f4391e40");
	self endon(#"hash_1a927c82f4391e40");
	self endon(#"death");
	if(isplayer(self))
	{
		self endon(#"disconnect");
	}
	if(timesec <= 0)
	{
		timesec = 1;
	}
	frame = 1000 / function_60d95f53();
	increment = (self.origin - location) / (timesec * 20);
	var_5b560b0d = gettime() + (timesec * 1000);
	while(gettime() < var_5b560b0d)
	{
		self.origin = self.origin - increment;
		waitframe(1);
	}
	self notify(#"movedone");
}

/*
	Name: function_ecec1794
	Namespace: namespace_ec06fe4a
	Checksum: 0xA68E3467
	Offset: 0x22F0
	Size: 0x10C
	Parameters: 0
	Flags: Linked
*/
function function_ecec1794()
{
	self endon(#"death");
	sticks = 0;
	lastorigin = self.origin;
	var_566fb668 = self.angles;
	while(sticks < 20)
	{
		waitframe(1);
		var_bcb6ea2 = lengthsquared(var_566fb668 - self.angles);
		var_4d6917c7 = distancesquared(lastorigin, self.origin);
		if(var_4d6917c7 < sqr(4) && var_bcb6ea2 < 0.1)
		{
			sticks++;
		}
		else
		{
			lastorigin = self.origin;
			var_566fb668 = self.angles;
			sticks = 0;
		}
	}
}

/*
	Name: function_8c808737
	Namespace: namespace_ec06fe4a
	Checksum: 0x516C33EA
	Offset: 0x2408
	Size: 0x42
	Parameters: 0
	Flags: Linked
*/
function function_8c808737()
{
	if(isdefined(self))
	{
		self notify(#"hash_5251ab0953e7989f");
		self ghost();
		self.var_cd7dffa1 = 1;
	}
}

/*
	Name: function_4f72130c
	Namespace: namespace_ec06fe4a
	Checksum: 0x140D8F28
	Offset: 0x2458
	Size: 0x2E
	Parameters: 0
	Flags: Linked
*/
function function_4f72130c()
{
	if(isdefined(self))
	{
		self show();
		self.var_cd7dffa1 = 0;
	}
}

/*
	Name: function_6eacecf5
	Namespace: namespace_ec06fe4a
	Checksum: 0x6836F53
	Offset: 0x2490
	Size: 0x6C
	Parameters: 2
	Flags: Linked
*/
function function_6eacecf5(origin, dist)
{
	if(!isdefined(dist))
	{
		dist = 1024;
	}
	players = getplayers();
	closest = arraysortclosest(players, origin, 1, 0, dist);
	return closest[0];
}

/*
	Name: function_bd3709ce
	Namespace: namespace_ec06fe4a
	Checksum: 0x2C86F006
	Offset: 0x2508
	Size: 0x6C
	Parameters: 2
	Flags: Linked
*/
function function_bd3709ce(origin, dist)
{
	if(!isdefined(dist))
	{
		dist = 1024;
	}
	actors = getactorarray();
	closest = arraysortclosest(actors, origin, 1, 0, dist);
	return closest[0];
}

/*
	Name: function_f3eab80e
	Namespace: namespace_ec06fe4a
	Checksum: 0x88E97725
	Offset: 0x2580
	Size: 0xA0
	Parameters: 2
	Flags: Linked
*/
function function_f3eab80e(origin, dist)
{
	if(!isdefined(dist))
	{
		dist = 1024;
	}
	ents = arraycombine(getplayers(), getactorarray());
	closest = arraysortclosest(ents, origin, 1, 0, dist);
	if(!closest.size)
	{
		return;
	}
	return closest[0];
}

/*
	Name: function_87612422
	Namespace: namespace_ec06fe4a
	Checksum: 0x5C0B6D34
	Offset: 0x2628
	Size: 0x9C
	Parameters: 5
	Flags: Linked
*/
function function_87612422(spot, angles, priority, lifetime, var_9045aedc)
{
	if(!isdefined(priority))
	{
		priority = 1;
	}
	if(!isdefined(lifetime))
	{
		lifetime = 3;
	}
	if(!isdefined(var_9045aedc))
	{
		var_9045aedc = 0;
	}
	/#
		assert(isdefined(spot));
	#/
	if(isdefined(spot))
	{
		level util::create_streamer_hint(spot, angles, priority, lifetime, var_9045aedc);
	}
}

/*
	Name: function_2f4b0f9
	Namespace: namespace_ec06fe4a
	Checksum: 0xE8270529
	Offset: 0x26D0
	Size: 0xFC
	Parameters: 5
	Flags: Linked
*/
function function_2f4b0f9(health, eattacker, var_799e18e5, idamage, var_5f32808d)
{
	if(health <= 0)
	{
		health = 0;
	}
	else
	{
		health = (health / self.maxhealth) * ((1 << 8) - 1);
	}
	self clientfield::set("set_health_bar", int(health));
	self clientfield::set("show_health_bar", 1);
	if(isdefined(eattacker) && idamage > 0)
	{
		hud::function_c9800094(eattacker, var_799e18e5, int(idamage / 10), var_5f32808d);
	}
}

/*
	Name: spawnorigin
	Namespace: namespace_ec06fe4a
	Checksum: 0xD85260ED
	Offset: 0x27D8
	Size: 0x52
	Parameters: 1
	Flags: Linked
*/
function spawnorigin(origin)
{
	if(!mayspawnentity())
	{
		return;
	}
	if(!function_3238d10d(origin))
	{
		return;
	}
	return spawn("script_origin", origin);
}

/*
	Name: function_e22ae9b3
	Namespace: namespace_ec06fe4a
	Checksum: 0xA9717896
	Offset: 0x2838
	Size: 0xEA
	Parameters: 4
	Flags: Linked
*/
function function_e22ae9b3(origin, modelname, angles, targetname)
{
	if(!isdefined(modelname))
	{
		modelname = "tag_origin";
	}
	if(!mayspawnentity())
	{
		return;
	}
	if(!isdefined(origin) || !function_3238d10d(origin))
	{
		return;
	}
	mdl = spawn("script_model", origin);
	if(isdefined(mdl))
	{
		if(isdefined(modelname))
		{
			mdl setmodel(modelname);
		}
		if(isdefined(angles))
		{
			mdl.angles = angles;
		}
		if(isdefined(targetname))
		{
			mdl.targetname = targetname;
		}
	}
	return mdl;
}

/*
	Name: spawntrigger
	Namespace: namespace_ec06fe4a
	Checksum: 0xC99828B3
	Offset: 0x2930
	Size: 0x118
	Parameters: 6
	Flags: Linked
*/
function spawntrigger(triggertype, origin, flags, var_bacb72c4, height, width)
{
	if(!isdefined(flags))
	{
		flags = 1;
	}
	if(!mayspawnfakeentity())
	{
		return;
	}
	if(!function_3238d10d(origin))
	{
		return;
	}
	if(triggertype == "trigger_radius" || triggertype == "trigger_radius_use")
	{
		trigger = spawn(triggertype, origin, flags, var_bacb72c4, height);
	}
	else
	{
		if(triggertype == "trigger_box")
		{
			trigger = spawn(triggertype, origin, flags, var_bacb72c4, width, height);
		}
		else
		{
			/#
				assert(0, "");
			#/
		}
	}
	return trigger;
}

/*
	Name: is_facing
	Namespace: namespace_ec06fe4a
	Checksum: 0x4F1EB4C3
	Offset: 0x2A50
	Size: 0x124
	Parameters: 2
	Flags: Linked
*/
function is_facing(facee, requireddot)
{
	if(!isdefined(requireddot))
	{
		requireddot = 0.9;
	}
	orientation = self getplayerangles();
	forwardvec = anglestoforward(orientation);
	forwardvec2d = (forwardvec[0], forwardvec[1], 0);
	unitforwardvec2d = vectornormalize(forwardvec2d);
	tofaceevec = facee.origin - self.origin;
	tofaceevec2d = (tofaceevec[0], tofaceevec[1], 0);
	unittofaceevec2d = vectornormalize(tofaceevec2d);
	dotproduct = vectordot(unitforwardvec2d, unittofaceevec2d);
	return dotproduct > requireddot;
}

/*
	Name: is_explosive_damage
	Namespace: namespace_ec06fe4a
	Checksum: 0x7B030DE2
	Offset: 0x2B80
	Size: 0x7E
	Parameters: 1
	Flags: Linked
*/
function is_explosive_damage(mod)
{
	if(!isdefined(mod))
	{
		return false;
	}
	if(mod == "MOD_GRENADE" || mod == "MOD_GRENADE_SPLASH" || mod == "MOD_PROJECTILE" || mod == "MOD_PROJECTILE_SPLASH" || mod == "MOD_EXPLOSIVE")
	{
		return true;
	}
	return false;
}

/*
	Name: function_2017393e
	Namespace: namespace_ec06fe4a
	Checksum: 0x146C26B1
	Offset: 0x2C08
	Size: 0x16A
	Parameters: 2
	Flags: None
*/
function function_2017393e(array, weights)
{
	/#
		assert(array.size == weights.size);
	#/
	if(array.size > 0)
	{
		var_766a145f = 0;
		keys = getarraykeys(array);
		foreach(key in keys)
		{
			var_766a145f = var_766a145f + weights[key];
		}
		var_ca23d24f = function_7ae7bf61(0, var_766a145f);
		var_da00fb33 = keys[0];
		for(i = 0; i < keys.size && var_ca23d24f >= 0; i++)
		{
			var_da00fb33 = keys[i];
			var_ca23d24f = var_ca23d24f - weights[var_da00fb33];
		}
		return array[var_da00fb33];
	}
	return undefined;
}

/*
	Name: function_73d79e7d
	Namespace: namespace_ec06fe4a
	Checksum: 0x9D2CD69B
	Offset: 0x2D80
	Size: 0xF0
	Parameters: 3
	Flags: Linked
*/
function function_73d79e7d(parent, onlyz, offset)
{
	if(!isdefined(onlyz))
	{
		onlyz = 0;
	}
	if(!isdefined(offset))
	{
		offset = (0, 0, 0);
	}
	self notify("3925a912a7e03269");
	self endon("3925a912a7e03269");
	self endon(#"death", #"unlink");
	while(isdefined(parent))
	{
		if(onlyz)
		{
			self.origin = (self.origin[0], self.origin[1], parent.origin[2]);
		}
		else
		{
			self.origin = parent.origin;
		}
		self.origin = self.origin + offset;
		waitframe(1);
	}
}

