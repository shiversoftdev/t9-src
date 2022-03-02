#using script_164a456ce05c3483;
#using script_17dcb1172e441bf6;
#using script_1a9763988299e68d;
#using script_1b01e95a6b5270fd;
#using script_1b0b07ff57d1dde3;
#using script_1ee011cd0961afd7;
#using script_2a5bf5b4a00cee0d;
#using script_350cffecd05ef6cf;
#using script_40f967ad5d18ea74;
#using script_47851dbeea22fe66;
#using script_4d748e58ce25b60c;
#using script_5701633066d199f2;
#using script_5f20d3b434d24884;
#using script_74a56359b7d02ab6;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace namespace_4ff32993;

/*
	Name: init
	Namespace: namespace_4ff32993
	Checksum: 0x5C128C73
	Offset: 0x2C0
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
	Checksum: 0x8C2FC175
	Offset: 0x308
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
	Checksum: 0x75E84403
	Offset: 0x550
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
	Checksum: 0xD9636E13
	Offset: 0x5B8
	Size: 0x568
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
		foreach(chicken in self.doa.var_20c63763)
		{
			if(!isdefined(chicken))
			{
				continue;
			}
			if(!is_true(chicken.special))
			{
				chicken notify(#"spin_out");
				break;
			}
		}
	}
	orb thread function_a083a332(self);
	orb thread function_1284a4d7(self);
	orb thread function_723d0c4c(self);
	orb thread function_26d43617(self);
	orb thread function_a5d7e43d();
	orb thread function_e4dfa7dc();
	orb thread function_9d0fe581(self);
	orb thread function_5d7057fa();
	return orb;
}

/*
	Name: function_f30a62f4
	Namespace: namespace_4ff32993
	Checksum: 0xF54543A
	Offset: 0xB28
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
	Checksum: 0x9568180B
	Offset: 0xC00
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
	Checksum: 0xC1137F26
	Offset: 0xC88
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
	Checksum: 0xADE87760
	Offset: 0xD78
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
	Checksum: 0x84AB5B67
	Offset: 0xDC8
	Size: 0x324
	Parameters: 1
	Flags: Linked
*/
function function_1284a4d7(player)
{
	self notify("989b5b40c4d53f5");
	self endon("989b5b40c4d53f5");
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
	Name: function_30bf476d
	Namespace: namespace_4ff32993
	Checksum: 0xF41B0B11
	Offset: 0x10F8
	Size: 0x6E
	Parameters: 2
	Flags: Linked
*/
function function_30bf476d(&follow_points, num_follow_points)
{
	origin = (isdefined(self.var_ce3eecd4) ? self.var_ce3eecd4.origin : self.origin);
	for(i = 0; i < num_follow_points; i++)
	{
		follow_points[i] = origin;
	}
}

/*
	Name: function_9d0fe581
	Namespace: namespace_4ff32993
	Checksum: 0x79108AD2
	Offset: 0x1170
	Size: 0x2B6
	Parameters: 1
	Flags: Linked
*/
function function_9d0fe581(player)
{
	self endon(#"death");
	self endon(#"spinning_out");
	player endon(#"disconnect");
	follow_index = 0;
	next_index = follow_index + 1;
	num_follow_points = 5;
	follow_points = [];
	player.var_85f8774c = 1;
	while(true)
	{
		if(is_true(player.var_85f8774c))
		{
			self function_30bf476d(follow_points, num_follow_points);
			next_index++;
			next_index = next_index % num_follow_points;
			self moveto(follow_points[next_index], 0.15, 0, 0);
			waitframe(1);
			player.var_85f8774c = 0;
		}
		if(isdefined(self.var_ce3eecd4))
		{
			angles = player.angles;
			self.angles = (angles[0], angles[1], 0);
			self.bird.angles = player.angles;
			self.is_moving = 0;
			if(distance2dsquared(self.var_ce3eecd4.origin, follow_points[follow_index]) > sqr(4))
			{
				follow_pt = self.var_ce3eecd4.origin;
				if(isplayer(self.var_ce3eecd4))
				{
					if(is_true(self.var_ce3eecd4.doa.var_3e81d24c) || isdefined(self.var_706dd25e))
					{
						z = 20;
					}
					else
					{
						z = 30;
					}
					follow_pt = follow_pt + (0, 0, z);
				}
				follow_points[next_index] = follow_pt;
				follow_index = next_index;
				next_index++;
				next_index = next_index % num_follow_points;
				self.is_moving = 1;
				self moveto(follow_points[next_index], 0.15, 0, 0);
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_723d0c4c
	Namespace: namespace_4ff32993
	Checksum: 0x8F18BF9F
	Offset: 0x1430
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
		timesec = timesec + 30;
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
	Checksum: 0xF4F2F584
	Offset: 0x15D8
	Size: 0x7E
	Parameters: 1
	Flags: Linked
*/
function function_26c8b67(player)
{
	if(is_true(level.var_4bf9ea19))
	{
		weapon = player getcurrentweapon();
	}
	else
	{
		weapon = [[ player.doa.var_6a86da57 ]]->function_91c18b19(player.doa.weaponlevel);
	}
	return weapon;
}

/*
	Name: function_56f05e91
	Namespace: namespace_4ff32993
	Checksum: 0xD43FC7CE
	Offset: 0x1660
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
	Checksum: 0x171E0C4E
	Offset: 0x17A8
	Size: 0x110
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
		weapon = self function_26c8b67(player);
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
	Checksum: 0xD284ED78
	Offset: 0x18C0
	Size: 0x24C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_ecec052c(player, weapon)
{
	if(isdefined(player) && is_true(player.doa.var_3e81d24c))
	{
		viewangles = player getplayerangles();
		angles = (viewangles[0], self.angles[1], 0);
	}
	else
	{
		angles = (self.angles[0], self.angles[1], 0);
	}
	forward = anglestoforward(angles);
	offset = (forward * 12) + vectorscale((0, 0, 1), 6);
	start = self.bird.origin + offset;
	if(getdvarint(#"hash_688eef6045c14ea9", 0))
	{
		level thread namespace_1e25ad94::function_1d1f2c26(start, 5, 20, (1, 0, 0));
		level thread namespace_1e25ad94::debugline(start, self.origin + (forward * 1000), 5, (1, 0, 0));
	}
	if(weapon != level.weaponnone)
	{
		if(level.doa.var_69216afe.size && isinarray(level.doa.var_69216afe, weapon))
		{
			weapon = level.doa.var_44b1769d;
		}
		projectile = magicbullet(weapon, start, start + (forward * 1000), self.bird);
		if(isdefined(projectile))
		{
			projectile thread namespace_ec06fe4a::function_52afe5df(10);
		}
	}
}

/*
	Name: function_e4dfa7dc
	Namespace: namespace_4ff32993
	Checksum: 0x89433B6A
	Offset: 0x1B18
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
	Checksum: 0xDD9404F6
	Offset: 0x1BB8
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
	Checksum: 0x43D41A35
	Offset: 0x1C30
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
	Checksum: 0xE96602E4
	Offset: 0x1D78
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
	Checksum: 0xAE0A8EB1
	Offset: 0x1E68
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

