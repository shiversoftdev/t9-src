#using script_1a9763988299e68d;
#using script_2a5bf5b4a00cee0d;
#using script_40f967ad5d18ea74;
#using script_47851dbeea22fe66;
#using script_164a456ce05c3483;
#using script_4d748e58ce25b60c;
#using script_5f20d3b434d24884;
#using script_1b0b07ff57d1dde3;
#using script_1ee011cd0961afd7;
#using script_5701633066d199f2;
#using script_1b01e95a6b5270fd;
#using script_17dcb1172e441bf6;
#using script_74a56359b7d02ab6;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\hud_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_ec06fe4a;

/*
	Name: function_ee068490
	Namespace: namespace_ec06fe4a
	Checksum: 0xB8788324
	Offset: 0x2D8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ee068490()
{
	level notify(-253245323);
}

/*
	Name: function_ae010bb4
	Namespace: namespace_ec06fe4a
	Checksum: 0x73C28121
	Offset: 0x2F8
	Size: 0xCC
	Parameters: 1
	Flags: None
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
	Checksum: 0xC442F72D
	Offset: 0x3D0
	Size: 0x52
	Parameters: 1
	Flags: None
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
	Checksum: 0x8E51504D
	Offset: 0x430
	Size: 0x8C
	Parameters: 1
	Flags: None
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
	Name: addpoi
	Namespace: namespace_ec06fe4a
	Checksum: 0x9455EDCE
	Offset: 0x4C8
	Size: 0x60
	Parameters: 1
	Flags: None
*/
function addpoi(ent)
{
	arrayremovevalue(level.doa.var_af6d47dd, undefined);
	level.doa.var_af6d47dd[level.doa.var_af6d47dd.size] = ent;
}

/*
	Name: getclosestpoi
	Namespace: namespace_ec06fe4a
	Checksum: 0x6C68503C
	Offset: 0x530
	Size: 0x19E
	Parameters: 2
	Flags: None
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
	Checksum: 0xA5BF7029
	Offset: 0x6D8
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function function_fb4eb048(team)
{
	return getaiteamarray(team).size;
}

/*
	Name: function_38de0ce8
	Namespace: namespace_ec06fe4a
	Checksum: 0xB52DD65A
	Offset: 0x708
	Size: 0x14
	Parameters: 0
	Flags: None
*/
function function_38de0ce8()
{
	return getaiarray().size;
}

/*
	Name: function_9788bacc
	Namespace: namespace_ec06fe4a
	Checksum: 0xFA677215
	Offset: 0x728
	Size: 0x156
	Parameters: 1
	Flags: None
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
	Checksum: 0x59F6185D
	Offset: 0x888
	Size: 0xCC
	Parameters: 1
	Flags: None
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
	Checksum: 0x1F8C0F17
	Offset: 0x960
	Size: 0x22
	Parameters: 0
	Flags: None
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
	Checksum: 0x9F8B7886
	Offset: 0x990
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
	Checksum: 0x1F1DDFF5
	Offset: 0x9F0
	Size: 0x21E
	Parameters: 2
	Flags: None
*/
function function_de70888a(bosskills, var_f906062a)
{
	if(!isdefined(bosskills))
	{
		bosskills = 1;
	}
	if(!isdefined(var_f906062a))
	{
		var_f906062a = 0;
	}
	self notify("4e507d4af597c36");
	self endon("4e507d4af597c36");
	level.doa.var_1b8c7044 = 1;
	numleft = function_9788bacc();
	while(numleft > 0)
	{
		level.doa.var_dcbded2 = [];
		numleft = function_9788bacc();
		enemies = function_8ff7f92c();
		foreach(badguy in enemies)
		{
			numleft--;
			if(is_true(badguy.boss) && bosskills == 0)
			{
				continue;
			}
			if(is_true(badguy.var_f906062a) && var_f906062a)
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
	Checksum: 0xC5CDA57F
	Offset: 0xC18
	Size: 0x44
	Parameters: 1
	Flags: None
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
	Checksum: 0x5A515430
	Offset: 0xC68
	Size: 0xD0
	Parameters: 1
	Flags: None
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
	Checksum: 0xEBCDFD2D
	Offset: 0xD40
	Size: 0x16C
	Parameters: 4
	Flags: None
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
		self dodamage(self.health + 187, self.origin);
	}
}

/*
	Name: function_5678f0d
	Namespace: namespace_ec06fe4a
	Checksum: 0xDBF837E7
	Offset: 0xEB8
	Size: 0x174
	Parameters: 4
	Flags: None
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
	Checksum: 0x6EA9CBD9
	Offset: 0x1038
	Size: 0xFC
	Parameters: 0
	Flags: None
*/
function function_592e0d6b()
{
	self notify("2636eb3817fe7e70");
	self endon("2636eb3817fe7e70");
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
	Checksum: 0xAAD0C2F2
	Offset: 0x1140
	Size: 0xDC
	Parameters: 1
	Flags: None
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
	Checksum: 0xBAE1448D
	Offset: 0x1228
	Size: 0xFC
	Parameters: 2
	Flags: None
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
	Checksum: 0xDB36BE9
	Offset: 0x1330
	Size: 0xF6
	Parameters: 3
	Flags: None
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
	Checksum: 0x38B66228
	Offset: 0x1430
	Size: 0x5C
	Parameters: 2
	Flags: None
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
	Checksum: 0x259B1DB3
	Offset: 0x1498
	Size: 0x124
	Parameters: 2
	Flags: None
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
	Checksum: 0xC613463C
	Offset: 0x15C8
	Size: 0x5C
	Parameters: 2
	Flags: None
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
	Checksum: 0xAB034848
	Offset: 0x1630
	Size: 0x60
	Parameters: 1
	Flags: None
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
	Checksum: 0x9D5E63D3
	Offset: 0x1698
	Size: 0x58
	Parameters: 0
	Flags: None
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
	Checksum: 0xC9FAD4D7
	Offset: 0x16F8
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function velocity_to_mph(vel)
{
	return length(vel) * 0.05681818;
}

/*
	Name: function_f506b4c7
	Namespace: namespace_ec06fe4a
	Checksum: 0xE0815D43
	Offset: 0x1730
	Size: 0x34
	Parameters: 1
	Flags: None
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
	Checksum: 0x3D9E0FA1
	Offset: 0x1770
	Size: 0xCE
	Parameters: 2
	Flags: None
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
	Checksum: 0x68F8A03E
	Offset: 0x1848
	Size: 0x166
	Parameters: 3
	Flags: None
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
	Checksum: 0x5A030D15
	Offset: 0x19B8
	Size: 0xD6
	Parameters: 3
	Flags: None
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
	Checksum: 0xC886EA95
	Offset: 0x1A98
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
	Checksum: 0x4B0F0F96
	Offset: 0x1B08
	Size: 0xCA
	Parameters: 0
	Flags: None
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
	Checksum: 0x59C21A2C
	Offset: 0x1BE0
	Size: 0x1C
	Parameters: 1
	Flags: None
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
	Checksum: 0x971F8108
	Offset: 0x1C08
	Size: 0x3E
	Parameters: 1
	Flags: None
*/
function getyaw(org)
{
	angles = vectortoangles(org - self.origin);
	return angles[1];
}

/*
	Name: getyaw2d
	Namespace: namespace_ec06fe4a
	Checksum: 0x1E231454
	Offset: 0x1C50
	Size: 0x66
	Parameters: 1
	Flags: None
*/
function getyaw2d(org)
{
	angles = vectortoangles((org[0], org[1], 0) - (self.origin[0], self.origin[1], 0));
	return angles[1];
}

/*
	Name: absyawtoenemy
	Namespace: namespace_ec06fe4a
	Checksum: 0xF33304E6
	Offset: 0x1CC0
	Size: 0xA2
	Parameters: 0
	Flags: None
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
	Checksum: 0x965D98DE
	Offset: 0x1D70
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
	Checksum: 0x7EC73A68
	Offset: 0x1E20
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
	Checksum: 0x4AAFFBC5
	Offset: 0x1E98
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
	Checksum: 0x3457AFA6
	Offset: 0x1F00
	Size: 0x3E
	Parameters: 2
	Flags: None
*/
function getyawfromorigin(org, start)
{
	angles = vectortoangles(org - start);
	return angles[1];
}

/*
	Name: getyawtotag
	Namespace: namespace_ec06fe4a
	Checksum: 0x5F1D9F8C
	Offset: 0x1F48
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
	Checksum: 0xE317ABD9
	Offset: 0x1FD0
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
	Checksum: 0x1E7D15FC
	Offset: 0x2030
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
	Checksum: 0x16C08BEE
	Offset: 0x20A8
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
	Checksum: 0xFEAF9CA1
	Offset: 0x2138
	Size: 0x98
	Parameters: 2
	Flags: None
*/
function function_f1e8ce76(vector, angle)
{
	return ((vector[0] * cos(angle)) - (vector[1] * sin(angle)), (vector[0] * sin(angle)) + (vector[1] * cos(angle)), vector[2]);
}

/*
	Name: function_65ee50ba
	Namespace: namespace_ec06fe4a
	Checksum: 0xA8266718
	Offset: 0x21D8
	Size: 0x86
	Parameters: 3
	Flags: None
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
	Checksum: 0xEE6539A2
	Offset: 0x2268
	Size: 0x136
	Parameters: 2
	Flags: None
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
	Checksum: 0xBC1D95AD
	Offset: 0x23A8
	Size: 0x10C
	Parameters: 0
	Flags: None
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
	Checksum: 0x51A914DA
	Offset: 0x24C0
	Size: 0x42
	Parameters: 0
	Flags: None
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
	Checksum: 0x1786E915
	Offset: 0x2510
	Size: 0x2E
	Parameters: 0
	Flags: None
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
	Checksum: 0xD39AD3FA
	Offset: 0x2548
	Size: 0x6C
	Parameters: 2
	Flags: None
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
	Checksum: 0xD7261E2B
	Offset: 0x25C0
	Size: 0x6C
	Parameters: 2
	Flags: None
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
	Checksum: 0x7E096747
	Offset: 0x2638
	Size: 0xA0
	Parameters: 2
	Flags: None
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
	Checksum: 0x219BF00A
	Offset: 0x26E0
	Size: 0x9C
	Parameters: 5
	Flags: None
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
	Checksum: 0x36B04AE6
	Offset: 0x2788
	Size: 0x16C
	Parameters: 5
	Flags: None
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
		if(!isdefined(eattacker.pers[#"damagedone"]))
		{
			eattacker.pers[#"damagedone"] = 0;
		}
		eattacker.pers[#"damagedone"] = eattacker.pers[#"damagedone"] + idamage;
	}
}

/*
	Name: spawnorigin
	Namespace: namespace_ec06fe4a
	Checksum: 0x6963CA4B
	Offset: 0x2900
	Size: 0x52
	Parameters: 1
	Flags: None
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
	Checksum: 0xFAC60026
	Offset: 0x2960
	Size: 0xEA
	Parameters: 4
	Flags: None
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
	Checksum: 0x9665F886
	Offset: 0x2A58
	Size: 0x118
	Parameters: 6
	Flags: None
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
	Checksum: 0xA527BB2B
	Offset: 0x2B78
	Size: 0x124
	Parameters: 2
	Flags: None
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
	Checksum: 0x3D0AE5E6
	Offset: 0x2CA8
	Size: 0x7E
	Parameters: 1
	Flags: None
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
	Checksum: 0x9317C75E
	Offset: 0x2D30
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
	Checksum: 0xA336D089
	Offset: 0x2EA8
	Size: 0xF0
	Parameters: 3
	Flags: None
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
	self notify("75eb2be542fc62de");
	self endon("75eb2be542fc62de");
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

