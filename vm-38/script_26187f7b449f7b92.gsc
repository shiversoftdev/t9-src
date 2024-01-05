#using script_1a9763988299e68d;
#using script_2a5bf5b4a00cee0d;
#using script_40f967ad5d18ea74;
#using script_47851dbeea22fe66;
#using script_164a456ce05c3483;
#using script_4d748e58ce25b60c;
#using script_5f20d3b434d24884;
#using script_6b6510e124bad778;
#using script_1b0b07ff57d1dde3;
#using script_1ee011cd0961afd7;
#using script_350cffecd05ef6cf;
#using script_5701633066d199f2;
#using script_1b01e95a6b5270fd;
#using script_17dcb1172e441bf6;
#using script_74a56359b7d02ab6;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_11d7d604;

/*
	Name: function_bcc09b96
	Namespace: namespace_11d7d604
	Checksum: 0x5704F0CB
	Offset: 0x378
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_bcc09b96()
{
	level notify(1103181961);
}

#namespace namespace_4ff32993;

/*
	Name: init
	Namespace: namespace_4ff32993
	Checksum: 0xE8ADBECB
	Offset: 0x398
	Size: 0x3A
	Parameters: 0
	Flags: Linked
*/
function init()
{
	level.doa.var_69216afe = [];
	level.doa.var_44b1769d = getweapon("zombietron_lmg");
}

/*
	Name: function_174651ce
	Namespace: namespace_4ff32993
	Checksum: 0x72CB49E5
	Offset: 0x3E0
	Size: 0x23E
	Parameters: 1
	Flags: Linked
*/
function function_174651ce(bird)
{
	bird notify(#"hash_44f0d6121a2adcc6");
	bird endon(#"hash_44f0d6121a2adcc6");
	bird endon(#"death");
	bird useanimtree("generic");
	curanim = "a_chicken_react_up_down";
	lastanim = "a_chicken_idle_peck";
	while(isdefined(bird))
	{
		if(is_true(self.var_89dad306))
		{
			curanim = "a_chicken_react_up_down";
		}
		else
		{
			if(is_true(self.var_e1e5d308))
			{
				curanim = "a_chicken_react_up_down";
			}
			else
			{
				if(is_true(self.var_329aedd))
				{
					curanim = "a_chicken_react_up_down";
					self.var_329aedd = undefined;
				}
				else
				{
					if(is_true(self.var_1ad5202b))
					{
						curanim = "a_chicken_react_to_front_notrans";
					}
					else if(is_true(self.is_moving))
					{
						curanim = "a_chicken_run";
					}
				}
			}
		}
		animlength = getanimlength(curanim);
		bird.angles = self.angles;
		bird thread animation::play(curanim);
		wait(animlength);
		lastanim = curanim;
		switch(randomint(3))
		{
			case 0:
			{
				curanim = "a_chicken_idle_peck";
				break;
			}
			case 1:
			{
				curanim = "a_chicken_idle_a";
				break;
			}
			case 2:
			{
				curanim = "a_chicken_idle";
				break;
			}
		}
	}
}

/*
	Name: chicken_idle
	Namespace: namespace_4ff32993
	Checksum: 0x86BF0846
	Offset: 0x628
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function chicken_idle()
{
	self.angles = (0, self.angles[1], 0);
	self thread function_174651ce(self);
	self namespace_e32bb68::function_3a59ec34("evt_doa_pickup_chicken_squawk");
}

/*
	Name: add_a_chicken
	Namespace: namespace_4ff32993
	Checksum: 0xBA51730F
	Offset: 0x690
	Size: 0x508
	Parameters: 4
	Flags: Linked
*/
function add_a_chicken(model, scale, fated, var_706dd25e)
{
	if(!isdefined(self.doa))
	{
		return;
	}
	if(!mayspawnentity())
	{
		return;
	}
	orb = namespace_ec06fe4a::function_e22ae9b3(self.origin + vectorscale((0, 0, 1), 30), "tag_origin", self.angles);
	if(isdefined(orb))
	{
		orb.targetname = "add_a_chicken";
		orb enablelinkto();
		orb notsolid();
	}
	else
	{
		return;
	}
	bird = namespace_ec06fe4a::function_e22ae9b3(orb.origin, scale, self.angles);
	if(isdefined(bird))
	{
		bird.targetname = "chicken";
		bird linkto(orb, "tag_origin");
		bird notsolid();
		bird setscale(fated);
	}
	else
	{
		orb delete();
		return;
	}
	orb.var_fb8d92c4 = fated;
	orb.bird = bird;
	bird.orb = orb;
	orb.player = self;
	orb.owner = self;
	bird.owner = self;
	bird.var_7b9e42c2 = 1;
	bird.killcount = 0;
	bird.team = self.team;
	bird.donotdamageowner = 1;
	orb.team = self.team;
	orb.special = var_706dd25e;
	orb.var_3e3b0c6e = 0;
	orb.var_7d2d343c = 0;
	arrayremovevalue(self.doa.var_20c63763, undefined);
	orb.var_ce3eecd4 = (self.doa.var_20c63763.size == 0 ? self : self.doa.var_20c63763[self.doa.var_20c63763.size - 1]);
	orb thread function_174651ce(bird);
	if(is_true(orb.special) && self.doa.var_20c63763.size > 0)
	{
		arrayinsert(self.doa.var_20c63763, orb, 0);
		var_62d4927b = self;
		foreach(chicken in self.doa.var_20c63763)
		{
			chicken.var_ce3eecd4 = var_62d4927b;
			var_62d4927b = chicken;
		}
	}
	else
	{
		self.doa.var_20c63763[self.doa.var_20c63763.size] = orb;
	}
	if(self.doa.var_20c63763.size > 5)
	{
		self function_fde39570();
	}
	orb thread function_a083a332(self);
	orb thread function_1284a4d7(self);
	orb thread function_723d0c4c(self);
	orb thread function_26d43617(self);
	orb thread function_a5d7e43d();
	orb thread function_e4dfa7dc();
	orb thread function_9d0fe581(self);
	orb thread function_5d7057fa();
	if(is_true(var_706dd25e))
	{
		orb thread function_8f7ae651();
	}
	return orb;
}

/*
	Name: function_fde39570
	Namespace: namespace_4ff32993
	Checksum: 0x79D699C8
	Offset: 0xBA0
	Size: 0xD0
	Parameters: 0
	Flags: Linked
*/
function function_fde39570()
{
	if(!isdefined(self.doa.var_20c63763))
	{
		return;
	}
	bird = undefined;
	foreach(bird in self.doa.var_20c63763)
	{
		if(is_true(bird.special))
		{
			continue;
		}
		bird notify(#"spin_out", 1);
		break;
	}
}

/*
	Name: function_f30a62f4
	Namespace: namespace_4ff32993
	Checksum: 0x39743437
	Offset: 0xC78
	Size: 0xCC
	Parameters: 0
	Flags: None
*/
function function_f30a62f4()
{
	if(!isdefined(self.doa.var_20c63763))
	{
		return;
	}
	foreach(bird in self.doa.var_20c63763)
	{
		if(is_true(bird.special))
		{
			continue;
		}
		bird notify(#"spin_out", 1);
	}
}

/*
	Name: function_a083a332
	Namespace: namespace_4ff32993
	Checksum: 0xF0384FCC
	Offset: 0xD50
	Size: 0x7E
	Parameters: 1
	Flags: Linked
*/
function function_a083a332(player)
{
	self endon(#"death");
	player waittill(#"disconnect");
	if(is_true(self.special))
	{
		self function_a7be9625();
	}
	else
	{
		self notify(#"spin_out");
	}
}

/*
	Name: function_a7be9625
	Namespace: namespace_4ff32993
	Checksum: 0xE898F0A3
	Offset: 0xDD8
	Size: 0xE6
	Parameters: 0
	Flags: Linked
*/
function function_a7be9625()
{
	if(is_true(self.special))
	{
		self namespace_e32bb68::function_3a59ec34("evt_doa_pickup_chicken_squawk_spinout");
		self namespace_e32bb68::function_3a59ec34("evt_doa_pickup_chicken_explode");
		self.bird namespace_83eb6304::function_3ecfde67("chicken_explode");
		util::wait_network_frame();
		if(isdefined(self.bird))
		{
			self.bird delete();
		}
		self delete();
	}
	else
	{
		self notify(#"spin_out");
	}
}

/*
	Name: function_5d7057fa
	Namespace: namespace_4ff32993
	Checksum: 0xCF17ACC3
	Offset: 0xEC8
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function function_5d7057fa()
{
	self endon(#"death");
	level waittill(#"game_over");
	self function_a7be9625();
}

/*
	Name: function_1284a4d7
	Namespace: namespace_4ff32993
	Checksum: 0x9630713B
	Offset: 0xF18
	Size: 0x33C
	Parameters: 1
	Flags: Linked
*/
function function_1284a4d7(player)
{
	self notify("5374cb0351ab3b5a");
	self endon("5374cb0351ab3b5a");
	self endon(#"death");
	if(is_true(self.special))
	{
		return;
	}
	result = undefined;
	result = self waittill(#"spin_out");
	waittillframeend();
	self notify(#"spinning_out");
	if(isdefined(player))
	{
		arrayremovevalue(player.doa.var_20c63763, self);
	}
	if(!is_true(result.immediate))
	{
		self.var_89dad306 = 1;
		self.spinouttime = 0;
		if(isdefined(player))
		{
			var_92400dd7 = player;
			foreach(chicken in player.doa.var_20c63763)
			{
				chicken.var_ce3eecd4 = var_92400dd7;
				var_92400dd7 = chicken;
			}
			player namespace_7f5aeb59::function_61d74d57();
			weapon = function_26c8b67(player);
			firetime = 0.15;
			self.spinouttime = randomfloatrange(5, 8);
		}
		while(self.spinouttime > 0)
		{
			rotate180time = 1;
			self rotateto(self.angles + vectorscale((0, 1, 0), 180), rotate180time);
			localrotatetime = rotate180time;
			while(localrotatetime > 0)
			{
				self function_ecec052c(player, weapon);
				wait(firetime);
				localrotatetime = localrotatetime - firetime;
			}
			self.spinouttime = self.spinouttime - rotate180time;
		}
	}
	self namespace_e32bb68::function_3a59ec34("evt_doa_pickup_chicken_explode");
	self.bird namespace_83eb6304::function_3ecfde67("chicken_explode");
	util::wait_network_frame();
	if(isdefined(self.bird))
	{
		self.bird delete();
	}
	self delete();
}

/*
	Name: function_a46136b9
	Namespace: namespace_4ff32993
	Checksum: 0x1DF2C842
	Offset: 0x1260
	Size: 0x1EE
	Parameters: 1
	Flags: Linked
*/
function function_a46136b9(leader)
{
	self notify("6ca47f68b4c3e280");
	self endon("6ca47f68b4c3e280");
	self endon(#"death");
	self endon(#"spinning_out");
	var_f07c128e = isplayer(leader);
	if(var_f07c128e)
	{
		leader endon(#"disconnect");
	}
	else
	{
		leader endon(#"death");
		leader endon(#"spinning_out");
	}
	waitframe(1);
	follow_pt = self.origin;
	while(isdefined(leader))
	{
		if(distance2dsquared(leader.origin, follow_pt) > sqr(5))
		{
			follow_pt = leader.origin;
			if(var_f07c128e)
			{
				if(is_true(leader.doa.var_3e81d24c) || isdefined(self.var_706dd25e))
				{
					z = 20;
				}
				else
				{
					z = 30;
				}
				follow_pt = follow_pt + (0, 0, z);
			}
			if(!isdefined(self.follow_points))
			{
				self.follow_points = [];
			}
			else if(!isarray(self.follow_points))
			{
				self.follow_points = array(self.follow_points);
			}
			self.follow_points[self.follow_points.size] = follow_pt;
		}
		waitframe(1);
	}
}

/*
	Name: function_9d0fe581
	Namespace: namespace_4ff32993
	Checksum: 0xC9B60F1C
	Offset: 0x1458
	Size: 0x5DC
	Parameters: 1
	Flags: Linked
*/
function function_9d0fe581(player)
{
	self endon(#"death");
	self endon(#"spinning_out");
	player endon(#"disconnect");
	follow_index = 0;
	self.var_ce3eecd4.var_85f8774c = 1;
	force = 0;
	var_ff7dfde4 = 0;
	var_afc473d1 = sqr(72);
	while(isdefined(self.var_ce3eecd4))
	{
		if(is_true(self.var_ce3eecd4.var_85f8774c))
		{
			self.follow_points = [];
			forward = anglestoforward(self.var_ce3eecd4.angles);
			origin = self.var_ce3eecd4.origin + (forward * -25);
			for(seeds = 5; seeds; seeds--)
			{
				if(!isdefined(self.follow_points))
				{
					self.follow_points = [];
				}
				else if(!isarray(self.follow_points))
				{
					self.follow_points = array(self.follow_points);
				}
				self.follow_points[self.follow_points.size] = origin;
			}
			self.var_ce3eecd4.var_85f8774c = 0;
			self thread function_a46136b9(self.var_ce3eecd4);
			self moveto(origin, 0.25);
			self waittill(#"movedone");
		}
		if(isplayer(self.var_ce3eecd4))
		{
			angles = self.var_ce3eecd4 getplayerangles();
		}
		else
		{
			angles = self.var_ce3eecd4.angles;
		}
		self.angles = (angles[0], angles[1], 0);
		self.bird.angles = self.angles;
		self.bird.origin = self.origin;
		if(self.follow_points.size > 5 || (force && self.follow_points.size > 1))
		{
			point = self.follow_points[0];
			arrayremoveindex(self.follow_points, 0);
			self.movetime = 0.05;
			if(isplayer(self.var_ce3eecd4))
			{
				self.norm_move = length2d(player getnormalizedmovement());
				behind = self.follow_points.size - 5;
				magnitude = math::clamp(self.norm_move + (behind * 0.2), 0, 1);
				self.movetime = mapfloat(0, 1, 0.05, 0.2, 1 - magnitude);
				namespace_1e25ad94::debugmsg((((((("Movement: " + self.norm_move) + "  Magnitude:") + magnitude) + "  Move time:") + self.movetime) + " Behind by:") + behind);
			}
			else if(isdefined(self.var_ce3eecd4.norm_move))
			{
				self.norm_move = self.var_ce3eecd4.norm_move;
				behind = self.follow_points.size - 5;
				magnitude = math::clamp(self.norm_move + (behind * 0.2), 0, 1);
				self.movetime = mapfloat(0, 1, 0.05, 0.2, 1 - magnitude);
			}
			self.is_moving = 1;
			self moveto(point, self.movetime, 0, 0);
			self waittill(#"movedone");
		}
		else
		{
			time = gettime();
			if(time > var_ff7dfde4)
			{
				distsq = distancesquared(self.origin, self.var_ce3eecd4.origin);
				if(distsq > var_afc473d1)
				{
					force = 1;
				}
				else
				{
					var_ff7dfde4 = time + 1000;
					force = 0;
				}
			}
			self.is_moving = 0;
			waitframe(1);
		}
	}
}

/*
	Name: function_723d0c4c
	Namespace: namespace_4ff32993
	Checksum: 0x9F5123B
	Offset: 0x1A40
	Size: 0x19E
	Parameters: 1
	Flags: Linked
*/
function function_723d0c4c(player)
{
	self endon(#"spinning_out");
	self endon(#"death");
	timesec = player doa_fate::function_4808b985(60);
	if(player doa_fate::function_d5b51f1e())
	{
		timesec = timesec + 60;
	}
	time = timesec * 1000;
	while(!doa_pickups::function_f759a457())
	{
		waitframe(1);
	}
	timeout = gettime() + time;
	while(gettime() < timeout)
	{
		if(!isdefined(player) || is_true(player.laststand))
		{
			self notify(#"spin_out");
		}
		if(level flag::get("doa_game_is_over"))
		{
			self notify(#"spin_out");
		}
		wait(0.25);
	}
	while(is_true(self.var_e1e5d308) || is_true(self.var_1ad5202b))
	{
		wait(1);
	}
	self notify(#"spin_out");
}

/*
	Name: function_26c8b67
	Namespace: namespace_4ff32993
	Checksum: 0x7CE312E3
	Offset: 0x1BE8
	Size: 0xCA
	Parameters: 2
	Flags: Linked
*/
function function_26c8b67(player, fated)
{
	if(!isdefined(fated))
	{
		fated = 0;
	}
	if(is_true(level.var_4bf9ea19))
	{
		weapon = player getcurrentweapon();
	}
	else
	{
		/#
			assert(isdefined(player.doa.var_9c7d56c1));
		#/
		if(fated == 0)
		{
			weapon = player.doa.var_9c7d56c1;
		}
		else
		{
			weapon = player.doa.var_4eda72ee;
		}
	}
	return weapon;
}

/*
	Name: function_56f05e91
	Namespace: namespace_4ff32993
	Checksum: 0x9A5BEC9
	Offset: 0x1CC0
	Size: 0x13A
	Parameters: 1
	Flags: Linked
*/
function function_56f05e91(player)
{
	player endon(#"disconnect");
	self endon(#"death");
	while(isdefined(self) && !is_true(self.var_89dad306))
	{
		if(isdefined(player.doa.vehicle))
		{
			msg = undefined;
			msg = player.doa.vehicle waittilltimeout(0.1, #"weapon_fired", #"gunner_weapon_fired", #"death");
		}
		else
		{
			msg = undefined;
			msg = player waittilltimeout(0.1, #"weapon_fired", #"gunner_weapon_fired");
		}
		if(msg._notify != "timeout")
		{
			self notify(#"hash_64f59f3fa314254d");
		}
	}
}

/*
	Name: function_26d43617
	Namespace: namespace_4ff32993
	Checksum: 0x86440543
	Offset: 0x1E08
	Size: 0x118
	Parameters: 1
	Flags: Linked
*/
function function_26d43617(player)
{
	self endon(#"death");
	self endon(#"spinning_out");
	player endon(#"disconnect");
	self thread function_56f05e91(player);
	while(true)
	{
		self waittill(#"hash_64f59f3fa314254d");
		if(is_true(self.var_a446cf09))
		{
			continue;
		}
		weapon = self function_26c8b67(player, self.special);
		self function_ecec052c(player, weapon);
		extrawait = weapon.firetime - 0.05;
		if(extrawait > 0)
		{
			wait(extrawait);
		}
	}
}

/*
	Name: function_ecec052c
	Namespace: namespace_4ff32993
	Checksum: 0x5C164802
	Offset: 0x1F28
	Size: 0x264
	Parameters: 2
	Flags: Linked, Private
*/
function private function_ecec052c(player, weapon)
{
	owner = self.bird;
	angles = (self.angles[0], self.angles[1], 0);
	if(isdefined(player))
	{
		if(is_true(player.doa.var_3e81d24c))
		{
			viewangles = player getplayerangles();
			angles = (viewangles[0], self.angles[1], 0);
		}
	}
	forward = anglestoforward(angles);
	offset = (forward * 12) + vectorscale((0, 0, 1), 6);
	start = self.bird.origin + offset;
	/#
		if(getdvarint(#"hash_688eef6045c14ea9", 0))
		{
			level thread namespace_1e25ad94::function_1d1f2c26(start, 5, 20, (1, 0, 0));
			level thread namespace_1e25ad94::debugline(start, self.origin + (forward * 1000), 5, (1, 0, 0));
		}
	#/
	if(weapon != level.weaponnone)
	{
		if(level.doa.var_69216afe.size && isinarray(level.doa.var_69216afe, weapon))
		{
			weapon = level.doa.var_44b1769d;
		}
		projectile = magicbullet(weapon, start, start + (forward * 1000), owner);
		if(isdefined(projectile))
		{
			projectile thread namespace_ec06fe4a::function_52afe5df(10);
		}
	}
}

/*
	Name: function_e4dfa7dc
	Namespace: namespace_4ff32993
	Checksum: 0x3E0270FE
	Offset: 0x2198
	Size: 0x98
	Parameters: 0
	Flags: Linked
*/
function function_e4dfa7dc()
{
	self endon(#"spinning_out");
	self endon(#"death");
	while(isdefined(self))
	{
		rand = randomintrange(0, 100);
		if(rand > 50)
		{
			self namespace_e32bb68::function_3a59ec34("evt_doa_pickup_chicken_squawk");
		}
		wait(randomfloatrange(1, 3));
	}
}

/*
	Name: function_a5d7e43d
	Namespace: namespace_4ff32993
	Checksum: 0xDC85E55A
	Offset: 0x2238
	Size: 0x70
	Parameters: 0
	Flags: Linked
*/
function function_a5d7e43d()
{
	self endon(#"death");
	self waittill(#"spinning_out");
	while(isdefined(self))
	{
		self namespace_e32bb68::function_3a59ec34("evt_doa_pickup_chicken_squawk_spinout");
		wait(randomfloatrange(0.5, 1));
	}
}

/*
	Name: function_73b8cd81
	Namespace: namespace_4ff32993
	Checksum: 0xC78B91D3
	Offset: 0x22B0
	Size: 0x13C
	Parameters: 0
	Flags: Linked
*/
function function_73b8cd81()
{
	self notify(#"hash_5e13e601fac1829b");
	self endon(#"hash_5e13e601fac1829b");
	msg = undefined;
	msg = self waittill(#"death", #"disconnect", #"hash_5e13e601fac1829b");
	foreach(chicken in self.doa.var_20c63763)
	{
		if(!isdefined(chicken))
		{
			continue;
		}
		if(msg._notify == "disconnect" || !is_true(chicken.special))
		{
			chicken notify(#"spin_out");
		}
	}
}

/*
	Name: function_f69400ca
	Namespace: namespace_4ff32993
	Checksum: 0xDEEADDDA
	Offset: 0x23F8
	Size: 0xE8
	Parameters: 3
	Flags: Linked
*/
function function_f69400ca(model, fated, scale)
{
	if(!isdefined(fated))
	{
		fated = 0;
	}
	if(!isdefined(scale))
	{
		scale = 1;
	}
	if(!isdefined(self.doa.var_20c63763))
	{
		self.doa.var_20c63763 = [];
	}
	self thread function_73b8cd81();
	var_b8bb1cdf = self add_a_chicken(model, scale, fated != 0, fated == 2);
	if(self.doa.var_20c63763.size >= 5)
	{
		self giveachievement(#"hash_7fc3515d8479dc7a");
	}
	return var_b8bb1cdf;
}

/*
	Name: function_13c591b6
	Namespace: namespace_4ff32993
	Checksum: 0x50AD8F3B
	Offset: 0x24E8
	Size: 0xAA
	Parameters: 1
	Flags: None
*/
function function_13c591b6(player)
{
	number = 0;
	foreach(chicken in player.doa.var_20c63763)
	{
		if(chicken == self)
		{
			break;
		}
		number++;
	}
	return number;
}

/*
	Name: function_8f7ae651
	Namespace: namespace_4ff32993
	Checksum: 0xC3F5ED30
	Offset: 0x25A0
	Size: 0x20C
	Parameters: 0
	Flags: Linked
*/
function function_8f7ae651()
{
	self endon(#"spinning_out");
	self endon(#"death");
	var_52acc12f = randomintrange(720, 1800);
	while(var_52acc12f > 0)
	{
		while(level.doa.world_state != 0 || level flag::get("doa_round_paused") || !level flag::get("doa_round_spawning") || is_true(level.hostmigrationtimer))
		{
			waitframe(1);
		}
		wait(1);
		var_52acc12f = var_52acc12f - 1;
		var_52acc12f = var_52acc12f - self.bird.killcount;
		self.bird.killcount = 0;
	}
	roll = randomint(100);
	self.bird thread namespace_6e90e490::function_47e11416(48, 2);
	wait(0.6);
	if(roll > 15)
	{
		def = doa_pickups::function_6265bde4("zombietron_egg");
	}
	else
	{
		def = doa_pickups::function_6265bde4("zombietron_egg_golden");
	}
	doa_pickups::itemspawn(def, self.origin, self.angles, undefined, 1, "none", undefined, undefined, undefined, undefined, 0);
	self thread function_8f7ae651();
}

