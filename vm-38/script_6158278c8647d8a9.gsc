#using script_2255a7ad3edc838f;
#using scripts\core_common\ai_shared.gsc;

#namespace namespace_b20b4885;

/*
	Name: function_f88a4de6
	Namespace: namespace_b20b4885
	Checksum: 0x39E129F8
	Offset: 0xD8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_f88a4de6()
{
	level notify(495053207);
}

/*
	Name: function_70a657d8
	Namespace: namespace_b20b4885
	Checksum: 0x61475DB6
	Offset: 0xF8
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	/#
		level.var_51a0bf0 = [];
		level thread function_7e6af638();
	#/
}

/*
	Name: startup
	Namespace: namespace_b20b4885
	Checksum: 0x12DDF2C3
	Offset: 0x130
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function startup()
{
	self thread handle_path_failed();
}

/*
	Name: shutdown
	Namespace: namespace_b20b4885
	Checksum: 0xF4484CFE
	Offset: 0x158
	Size: 0x12
	Parameters: 0
	Flags: Linked
*/
function shutdown()
{
	self.bot.var_aa94cd1b = undefined;
}

/*
	Name: handle_path_failed
	Namespace: namespace_b20b4885
	Checksum: 0x137CA58F
	Offset: 0x178
	Size: 0x164
	Parameters: 0
	Flags: Linked, Private
*/
function private handle_path_failed()
{
	self endon(#"death", #"hash_3525e39d3694d0a9");
	level endon(#"game_ended");
	while(true)
	{
		params = undefined;
		params = self waittill(#"bot_path_failed");
		switch(params.reason)
		{
			case 1:
			case 2:
			case 3:
			{
				self function_5c6265b3();
				break;
			}
			case 4:
			case 5:
			case 6:
			{
				self function_ea3bf04e();
				break;
			}
			case 7:
			case 8:
			default:
			{
				self function_f894a675();
				break;
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_5c6265b3
	Namespace: namespace_b20b4885
	Checksum: 0xB06E157B
	Offset: 0x2E8
	Size: 0xB4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_5c6265b3()
{
	clamped = self function_96f55844();
	/#
		if(clamped)
		{
			self function_b39b0b55(self.origin, (1, 1, 0), #"hash_759d0bab7057dad5");
		}
		else
		{
			self function_b39b0b55(self.origin, (1, 0, 0), #"hash_4470e824a8beb9f");
			self function_8a8380d0();
		}
	#/
}

/*
	Name: function_ea3bf04e
	Namespace: namespace_b20b4885
	Checksum: 0x33050A1A
	Offset: 0x3A8
	Size: 0xFC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_ea3bf04e()
{
	info = self function_4794d6a3();
	if(isdefined(info.overridegoalpos))
	{
		self function_d4c687c9();
		/#
			self function_b39b0b55(self.origin, (1, 0, 0), #"hash_66a35a43ea2dfb1a");
			self function_8a8380d0(info.overridegoalpos);
		#/
	}
	else
	{
		/#
			self function_b39b0b55(self.origin, (1, 0, 0), #"hash_3d76685a084ca723");
			self function_8a8380d0(info.goalpos);
		#/
	}
}

/*
	Name: function_f894a675
	Namespace: namespace_b20b4885
	Checksum: 0xB454A89
	Offset: 0x4B0
	Size: 0xFC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_f894a675()
{
	info = self function_4794d6a3();
	if(isdefined(info.overridegoalpos))
	{
		self function_d4c687c9();
		/#
			self function_b39b0b55(self.origin, (1, 0, 0), #"hash_65622b578ee28d25");
			self function_8a8380d0(info.overridegoalpos);
		#/
	}
	else
	{
		/#
			self function_b39b0b55(self.origin, (1, 0, 0), #"hash_5ff132f70af932cc");
			self function_8a8380d0(info.overridegoalpos);
		#/
	}
}

/*
	Name: think
	Namespace: namespace_b20b4885
	Checksum: 0xC49D69BC
	Offset: 0x5B8
	Size: 0x5AE
	Parameters: 0
	Flags: Linked
*/
function think()
{
	pixbeginevent();
	if(self botundermanualcontrol())
	{
		pixendevent();
		return;
	}
	info = self function_4794d6a3();
	if(info.goalforced)
	{
		pixendevent();
		return;
	}
	if(is_true(self.bot.var_6bea1d82) || self.bot.flashed || self isinexecutionvictim() || self isinexecutionattack() || self isplayinganimscripted() || self arecontrolsfrozen() || self function_5972c3cf())
	{
		if(!is_true(info.var_9e404264))
		{
			self set_position(self.origin, #"hold");
		}
		pixendevent();
		return;
	}
	if(isdefined(info.overridegoalpos) && self function_e6f05ab6(info.overridegoalpos))
	{
		self.bot.var_aa94cd1b = undefined;
		self function_d4c687c9();
		info = self function_4794d6a3();
	}
	var_4edd60e2 = 0;
	if(self bot::function_e5d7f472())
	{
		trigger = self bot::function_85bfe6d3();
		var_4edd60e2 = self function_794e2efa(trigger, info.overridegoalpos) || self function_f14a768c(trigger, #"revive");
	}
	else
	{
		if(isdefined(self.bot.var_36df6398))
		{
			trigger = self.bot.var_36df6398.trigger;
			var_4edd60e2 = self function_794e2efa(trigger, info.overridegoalpos) || self function_f14a768c(trigger, #"hash_2a9ea4b3ae3653b1");
		}
		else if(isdefined(self.bot.var_538135ed))
		{
			trigger = self.bot.var_538135ed.gameobject.trigger;
			var_4edd60e2 = self function_794e2efa(trigger, info.overridegoalpos) || self function_f14a768c(trigger, #"hash_1dff7a8b83fc563c");
		}
	}
	if(var_4edd60e2)
	{
		pixendevent();
		return;
	}
	if(self.bot.var_e8c84f98)
	{
		if(!self point_in_goal(info.overridegoalpos, info) || is_true(info.var_9e404264))
		{
			if(!self function_7832483e(info))
			{
				self function_d45bace(info);
			}
		}
		else
		{
			goalpoint = function_ad6356f5(info.overridegoalpos);
			if(isdefined(goalpoint))
			{
				if(!self function_de0e95b7(goalpoint))
				{
					self function_7832483e(info);
				}
			}
		}
	}
	else
	{
		if(!self point_in_goal(info.overridegoalpos, info))
		{
			self function_d45bace(info);
		}
		else if(is_true(info.var_9e404264))
		{
			if(isdefined(self.bot.var_aa94cd1b))
			{
				if(!isdefined(self.bot.var_aa94cd1b) || self.bot.var_aa94cd1b <= gettime())
				{
					self function_d45bace(info);
				}
			}
			else
			{
				self.bot.var_aa94cd1b = gettime() + (int(randomfloatrange(3, 7) * 1000));
			}
		}
	}
	info = self function_4794d6a3();
	if(!isdefined(info.overridegoalpos))
	{
		self set_position(self.origin, #"fallback");
	}
	pixendevent();
}

/*
	Name: point_in_goal
	Namespace: namespace_b20b4885
	Checksum: 0x96492723
	Offset: 0xB70
	Size: 0x134
	Parameters: 2
	Flags: Linked, Private
*/
function private point_in_goal(point, info)
{
	if(!isdefined(point))
	{
		return 0;
	}
	if(isdefined(info.var_151c9dda))
	{
		tpoint = function_ad6356f5(point);
		return isdefined(tpoint) && info.var_151c9dda == tpoint.region;
	}
	if(isdefined(info.goalvolume))
	{
		return self function_794e2efa(info.goalvolume, point);
	}
	goalorigin = info.goalpos;
	distsq = distance2dsquared(point, goalorigin);
	return distsq < (info.goalradius * info.goalradius) && point[2] < (goalorigin[2] + info.goalheight) && point[2] > (goalorigin[2] - info.goalheight);
}

/*
	Name: function_794e2efa
	Namespace: namespace_b20b4885
	Checksum: 0xAC8BBB16
	Offset: 0xCB0
	Size: 0xE2
	Parameters: 2
	Flags: Linked, Private
*/
function private function_794e2efa(trigger, point)
{
	if(!isdefined(point))
	{
		return 0;
	}
	midpoint = point + vectorscale((0, 0, 1), 36);
	if(!isdefined(point) || !trigger istouching(midpoint, vectorscale((0, 0, 1), 36)))
	{
		return 0;
	}
	if(trigger.classname != #"trigger_radius_use")
	{
		return 1;
	}
	radius = trigger getmaxs()[0] + -32;
	return distance2dsquared(trigger.origin, point) < (radius * radius);
}

/*
	Name: function_de0e95b7
	Namespace: namespace_b20b4885
	Checksum: 0x4F3460BE
	Offset: 0xDA0
	Size: 0xF4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_de0e95b7(tpoint)
{
	var_63e5d5aa = self.enemy getcentroid();
	if(issentient(self.enemy))
	{
		var_63e5d5aa = self.enemy geteye();
	}
	if(!function_96c81b85(tpoint, var_63e5d5aa))
	{
		/#
			if(self function_b39b0b55(tpoint.origin, (1, 0, 0), #"hash_53dde4c9c6077ed0"))
			{
				recordline(tpoint.origin + vectorscale((0, 0, 1), 70), var_63e5d5aa, (1, 0, 0), "", self);
			}
		#/
		return false;
	}
	return true;
}

/*
	Name: function_96f55844
	Namespace: namespace_b20b4885
	Checksum: 0x68E72E56
	Offset: 0xEA0
	Size: 0xC0
	Parameters: 0
	Flags: Linked, Private
*/
function private function_96f55844()
{
	navmeshpoint = function_13796beb(self.origin);
	if(!isdefined(navmeshpoint))
	{
		return false;
	}
	var_5245725e = (navmeshpoint[0], navmeshpoint[1], self.origin[2]);
	self setorigin(var_5245725e);
	velocity = self getvelocity();
	self setvelocity((0, 0, velocity[2]));
	return true;
}

/*
	Name: function_13796beb
	Namespace: namespace_b20b4885
	Checksum: 0x67126A6B
	Offset: 0xF68
	Size: 0x3A
	Parameters: 1
	Flags: Linked
*/
function function_13796beb(point)
{
	return getclosestpointonnavmesh(point, 64, 16);
}

/*
	Name: function_f14a768c
	Namespace: namespace_b20b4885
	Checksum: 0x38510AF4
	Offset: 0xFB0
	Size: 0x1B8
	Parameters: 2
	Flags: Linked, Private
*/
function private function_f14a768c(trigger, var_e125ba43)
{
	pixbeginevent();
	dir = trigger.origin - self.origin;
	dist = distance2d(trigger.origin, self.origin);
	radius = self getpathfindingradius();
	tracepoint = checknavmeshdirection(self.origin, dir, dist, radius);
	if(isdefined(tracepoint) && self function_794e2efa(trigger, tracepoint))
	{
		pixendevent();
		return self set_position(tracepoint, var_e125ba43);
	}
	var_1ccbeeaa = self function_13796beb(trigger.origin);
	if(isdefined(var_1ccbeeaa) && self function_794e2efa(trigger, var_1ccbeeaa))
	{
		pixendevent();
		return self set_position(var_1ccbeeaa, var_e125ba43);
	}
	/#
		self function_b39b0b55(trigger.origin, (1, 0, 0), var_e125ba43 + function_9e72a96(#"hash_7d1aa4caccc3dd42"));
	#/
	pixendevent();
	return 0;
}

/*
	Name: function_7832483e
	Namespace: namespace_b20b4885
	Checksum: 0x1F75C4CA
	Offset: 0x1178
	Size: 0xA4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_7832483e(info)
{
	pixbeginevent();
	points = self function_7b48fb52(info);
	if(points.size <= 0)
	{
		pixendevent();
		return 0;
	}
	point = points[randomint(points.size)];
	pixendevent();
	return self set_position(point.origin, #"hash_3d15ff2161690e3c");
}

/*
	Name: function_d45bace
	Namespace: namespace_b20b4885
	Checksum: 0x44510C95
	Offset: 0x1228
	Size: 0xA4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_d45bace(info)
{
	pixbeginevent();
	points = self function_a59f8a5d(info);
	if(points.size <= 0)
	{
		pixendevent();
		return 0;
	}
	point = points[randomint(points.size)];
	pixendevent();
	return self set_position(point.origin, #"goal");
}

/*
	Name: set_position
	Namespace: namespace_b20b4885
	Checksum: 0xA0FF72BA
	Offset: 0x12D8
	Size: 0x168
	Parameters: 2
	Flags: Linked, Private
*/
function private set_position(point, var_e125ba43)
{
	navmeshpoint = function_13796beb(point);
	if(!isdefined(navmeshpoint))
	{
		/#
			self function_b39b0b55(point, (1, 0, 0), var_e125ba43 + function_9e72a96(#"hash_7d1aa4caccc3dd42"));
			if(self bot::should_record(#"hash_6356356a050dc83d"))
			{
				recordline(self.origin, point, (1, 0, 0), "", self);
			}
		#/
		return false;
	}
	self function_a57c34b7(navmeshpoint);
	self.bot.var_aa94cd1b = undefined;
	/#
		self function_b39b0b55(navmeshpoint, (0, 1, 0), var_e125ba43);
		if(self bot::should_record(#"hash_6356356a050dc83d"))
		{
			recordline(self.origin, navmeshpoint, (0, 1, 0), "", self);
		}
	#/
	return true;
}

/*
	Name: function_a59f8a5d
	Namespace: namespace_b20b4885
	Checksum: 0x7F9F4E95
	Offset: 0x1448
	Size: 0x170
	Parameters: 1
	Flags: Linked, Private
*/
function private function_a59f8a5d(info)
{
	points = undefined;
	if(isdefined(info.var_151c9dda))
	{
		points = tacticalquery(#"hash_5c2d9f19faff9f7", info.var_151c9dda, self);
	}
	else
	{
		if(isdefined(info.goalvolume))
		{
			points = tacticalquery(#"hash_4a8bfda269e51b5a", info.goalvolume, self);
		}
		else
		{
			center = ai::t_cylinder(info.goalpos, info.goalradius, info.goalheight);
			points = tacticalquery(#"hash_4a8bfda269e51b5a", center, self);
		}
	}
	/#
		if(points.size > 0)
		{
			self function_70eeee8d(points, (0, 1, 0));
		}
		else
		{
			self function_b39b0b55(info.goalpos, (1, 0, 0), #"hash_519149e897eccbb");
		}
	#/
	return points;
}

/*
	Name: function_7d01d83b
	Namespace: namespace_b20b4885
	Checksum: 0x7DA3D76E
	Offset: 0x15C0
	Size: 0x170
	Parameters: 1
	Flags: Private
*/
function private function_7d01d83b(info)
{
	points = undefined;
	if(isdefined(info.var_151c9dda))
	{
		points = tacticalquery(#"hash_db073a01c2b4177", info.var_151c9dda, self);
	}
	else
	{
		if(isdefined(info.goalvolume))
		{
			points = tacticalquery(#"hash_17e23e3f768245da", info.goalvolume, self);
		}
		else
		{
			center = ai::t_cylinder(info.goalpos, info.goalradius, info.goalheight);
			points = tacticalquery(#"hash_17e23e3f768245da", center, self);
		}
	}
	/#
		if(points.size > 0)
		{
			self function_70eeee8d(points, (0, 1, 0));
		}
		else
		{
			self function_b39b0b55(info.goalpos, (1, 0, 0), #"hash_10472c83480d9e82");
		}
	#/
	return points;
}

/*
	Name: function_7b48fb52
	Namespace: namespace_b20b4885
	Checksum: 0x74AF8A88
	Offset: 0x1738
	Size: 0x1B8
	Parameters: 1
	Flags: Linked, Private
*/
function private function_7b48fb52(info)
{
	points = undefined;
	var_27c6a11e = self.enemy;
	if(!issentient(var_27c6a11e))
	{
		var_27c6a11e = var_27c6a11e getcentroid();
	}
	if(isdefined(info.var_151c9dda))
	{
		points = tacticalquery(#"hash_74a4ccc745696184", info.var_151c9dda, self, var_27c6a11e);
	}
	else
	{
		if(isdefined(info.goalvolume))
		{
			points = tacticalquery(#"hash_187dca4a1ed267ab", info.goalvolume, self, var_27c6a11e);
		}
		else
		{
			center = ai::t_cylinder(info.goalpos, info.goalradius, info.goalheight);
			points = tacticalquery(#"hash_187dca4a1ed267ab", center, self, var_27c6a11e);
		}
	}
	/#
		if(points.size > 0)
		{
			self function_70eeee8d(points, (0, 1, 0));
		}
		else
		{
			self function_b39b0b55(info.goalpos, (1, 0, 0), #"hash_531b7e55313019f3");
		}
	#/
	return points;
}

/*
	Name: function_b39b0b55
	Namespace: namespace_b20b4885
	Checksum: 0x549CA214
	Offset: 0x18F8
	Size: 0xE0
	Parameters: 3
	Flags: Private
*/
function private function_b39b0b55(origin, color, label)
{
	/#
		if(!self bot::should_record(#"hash_6356356a050dc83d"))
		{
			return false;
		}
		top = origin + (0, 0, 128);
		recordline(origin, top, color, "", self);
		if(isdefined(label))
		{
			record3dtext(function_9e72a96(label), top, (1, 1, 1), "", self, 0.5);
		}
		return true;
	#/
}

/*
	Name: function_70eeee8d
	Namespace: namespace_b20b4885
	Checksum: 0xF52DC19A
	Offset: 0x19E8
	Size: 0xD0
	Parameters: 2
	Flags: Private
*/
function private function_70eeee8d(points, color)
{
	/#
		if(!self bot::should_record(#"hash_6356356a050dc83d"))
		{
			return;
		}
		foreach(point in points)
		{
			recordstar(point.origin, color, "", self);
		}
	#/
}

/*
	Name: function_7e6af638
	Namespace: namespace_b20b4885
	Checksum: 0x17392763
	Offset: 0x1AC0
	Size: 0x26A
	Parameters: 0
	Flags: Private
*/
function private function_7e6af638()
{
	/#
		level endon(#"game_ended");
		failures = level.var_51a0bf0;
		while(true)
		{
			if(!getdvarint(#"hash_36fb3796a7eca97a", 0))
			{
				waitframe(1);
				continue;
			}
			foreach(failure in failures)
			{
				if(isdefined(failure.end))
				{
					print3d(failure.end, function_9e72a96(#"failed"), (1, 0, 1), 1, 2.5, 1, 1);
					angles = vectortoangles(failure.end - failure.start);
					circle(failure.end, 15, (1, 0, 1), 0, 1);
					line(failure.start, failure.end, (1, 0, 1));
					continue;
				}
				print3d(failure.start, function_9e72a96(#"failed"), (1, 0, 1), 1, 2.5, 1, 1);
				box(failure.start, vectorscale((-1, -1, 0), 15), (15, 15, 72), 0, (1, 0, 1));
			}
			waitframe(1);
		}
	#/
}

/*
	Name: function_8a8380d0
	Namespace: namespace_b20b4885
	Checksum: 0x44B37C18
	Offset: 0x1D38
	Size: 0x8C
	Parameters: 1
	Flags: Private
*/
function private function_8a8380d0(end)
{
	/#
		failures = level.var_51a0bf0;
		failures[failures.size] = {#end:end, #start:self.origin};
		if(failures.size > 100)
		{
			arrayremoveindex(failures, 0);
		}
	#/
}

