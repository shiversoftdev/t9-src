#using scripts\killstreaks\ai\target.gsc;
#using scripts\killstreaks\ai\escort.gsc;
#using scripts\killstreaks\ai\state.gsc;
#using scripts\core_common\entityheadicons_shared.gsc;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace patrol;

/*
	Name: function_2296c985
	Namespace: patrol
	Checksum: 0x16739AC9
	Offset: 0xA0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_2296c985()
{
	level notify(-736477436);
}

#namespace ai_patrol;

/*
	Name: init
	Namespace: ai_patrol
	Checksum: 0x71FF9BD3
	Offset: 0xC0
	Size: 0x74
	Parameters: 0
	Flags: None
*/
function init()
{
	ai_state::function_e9b061a8(0, &function_42ed4af0, &update_patrol, &function_97a138d5, &update_enemy, &function_4af1ff64, &function_a78474f2);
}

/*
	Name: function_7d8be726
	Namespace: ai_patrol
	Checksum: 0xF6D065AD
	Offset: 0x140
	Size: 0x13A
	Parameters: 10
	Flags: None
*/
function function_7d8be726(patrol_radius, var_edc20efd, var_d73e0c6e, marker_fx, var_36b19b5e, var_861daf20, var_a85cb855, var_52e43a03, var_544ae93d, var_7d9560c1)
{
	/#
		assert(isdefined(self.ai));
	#/
	self.ai.patrol = {#hash_7d9560c1:var_7d9560c1, #hash_544ae93d:var_544ae93d, #hash_52e43a03:var_52e43a03, #hash_a85cb855:var_a85cb855, #hash_861daf20:var_861daf20, #hash_36b19b5e:var_36b19b5e, #marker_fx:marker_fx, #hash_d73e0c6e:var_d73e0c6e, #hash_edc20efd:var_edc20efd, #patrol_radius:patrol_radius, #state:2};
}

/*
	Name: function_d091ff45
	Namespace: ai_patrol
	Checksum: 0xC5E34E40
	Offset: 0x288
	Size: 0x6C
	Parameters: 1
	Flags: None
*/
function function_d091ff45(bundle)
{
	function_7d8be726(bundle.var_a562774d, bundle.var_c9cb1de0, bundle.var_dabf2484, bundle.var_91b6778, bundle.objective, bundle.var_e5ca8662, bundle.var_ee982290, bundle.var_2725e0d9, bundle.var_4b395366, bundle.var_4ac4f036);
}

/*
	Name: function_42ed4af0
	Namespace: ai_patrol
	Checksum: 0x5B317D7
	Offset: 0x300
	Size: 0xC4
	Parameters: 0
	Flags: None
*/
function function_42ed4af0()
{
	self.ai.patrol.var_81f76ce3 = gettime();
	self.goalradius = self.ai.patrol.patrol_radius;
	self function_d4c687c9();
	self.ai.patrol.state = 2;
	if(isdefined(self.script_owner))
	{
		self function_325c6829(self.script_owner.origin);
	}
	else
	{
		self function_325c6829(self.origin);
	}
}

/*
	Name: function_97a138d5
	Namespace: ai_patrol
	Checksum: 0xDCB0F5F9
	Offset: 0x3D0
	Size: 0x1C
	Parameters: 0
	Flags: None
*/
function function_97a138d5()
{
	self function_3ec67269();
}

/*
	Name: function_4af1ff64
	Namespace: ai_patrol
	Checksum: 0xC2448B6
	Offset: 0x3F8
	Size: 0x4E
	Parameters: 0
	Flags: None
*/
function function_4af1ff64()
{
	if(self function_63b383f3())
	{
		return self.ai.patrol.var_edc20efd;
	}
	return self.ai.patrol.var_d73e0c6e;
}

/*
	Name: function_a78474f2
	Namespace: ai_patrol
	Checksum: 0x23B6BC0C
	Offset: 0x450
	Size: 0x3E
	Parameters: 0
	Flags: None
*/
function function_a78474f2()
{
	if(self function_63b383f3())
	{
		return self.ai.patrol.var_9033671b;
	}
	return self.origin;
}

/*
	Name: function_63b383f3
	Namespace: ai_patrol
	Checksum: 0x28CBB56E
	Offset: 0x498
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function function_63b383f3()
{
	if(self.ai.patrol.state == 1)
	{
		return true;
	}
	return false;
}

/*
	Name: function_6f09c87
	Namespace: ai_patrol
	Checksum: 0xB13A4CF4
	Offset: 0x4D0
	Size: 0x4E
	Parameters: 0
	Flags: None
*/
function function_6f09c87()
{
	if(self.ai.patrol.state == 1 || self.ai.patrol.state == 2)
	{
		return true;
	}
	return false;
}

/*
	Name: function_72f5ecf2
	Namespace: ai_patrol
	Checksum: 0x7552E744
	Offset: 0x528
	Size: 0x10E
	Parameters: 2
	Flags: Private
*/
function private function_72f5ecf2(current_point, points)
{
	new_points = [];
	var_ef358bee = self.ai.patrol.var_a85cb855 * self.ai.patrol.var_a85cb855;
	foreach(point in points)
	{
		dist2 = distancesquared(current_point, point.origin);
		if(dist2 < var_ef358bee)
		{
			continue;
		}
		new_points[new_points.size] = point;
	}
	return new_points;
}

/*
	Name: function_cd106dcf
	Namespace: ai_patrol
	Checksum: 0x60668C3B
	Offset: 0x640
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_cd106dcf(left, right)
{
	return left.dot > right.dot;
}

/*
	Name: function_12270700
	Namespace: ai_patrol
	Checksum: 0x7A95F1EC
	Offset: 0x670
	Size: 0xEA
	Parameters: 3
	Flags: Private
*/
function private function_12270700(origin, angles, points)
{
	foreach(point in points)
	{
		point.dot = vectordot(self.var_ffa7c9d, vectornormalize(point.origin - angles));
	}
	return array::merge_sort(points, &function_cd106dcf);
}

/*
	Name: function_6155a7ca
	Namespace: ai_patrol
	Checksum: 0xCC19C479
	Offset: 0x768
	Size: 0x330
	Parameters: 1
	Flags: None
*/
function function_6155a7ca(var_9033671b)
{
	var_d9910e8a = undefined;
	if(isdefined(self.script_owner) && isalive(self.script_owner))
	{
		var_d9910e8a = ai::t_cylinder(self.script_owner.origin, 200, self.ai.patrol.var_52e43a03);
	}
	else
	{
		var_d9910e8a = ai::t_cylinder(var_9033671b, 200, self.ai.patrol.var_52e43a03);
	}
	var_cd26c30e = ai_target::function_a13468f5(var_9033671b, self.ai.patrol.patrol_radius * 1.5);
	tacpoints = undefined;
	if(isdefined(var_cd26c30e) && isdefined(self.ai.patrol.var_7d9560c1))
	{
		closesttacpoint = getclosesttacpoint(var_cd26c30e.origin);
		if(isdefined(closesttacpoint))
		{
			cylinder = ai::t_cylinder(closesttacpoint.origin, 150, self.ai.patrol.var_52e43a03);
			tacpoints = tacticalquery(self.ai.patrol.var_7d9560c1, cylinder, self, var_cd26c30e, var_d9910e8a);
			if(isdefined(tacpoints) && tacpoints.size)
			{
				self.ai.patrol.var_cd26c30e = var_cd26c30e;
			}
		}
	}
	if(!isdefined(tacpoints) || tacpoints.size == 0)
	{
		cylinder = ai::t_cylinder(var_9033671b, self.ai.patrol.patrol_radius, self.ai.patrol.var_52e43a03);
		tacpoints = tacticalquery(self.ai.patrol.var_544ae93d, cylinder, self, var_d9910e8a);
	}
	if(isdefined(tacpoints) && tacpoints.size)
	{
		tacpoints = function_72f5ecf2(self.origin, tacpoints);
		if(!isdefined(var_cd26c30e) && isdefined(tacpoints) && tacpoints.size)
		{
			tacpoints = function_12270700(self.origin, self.angles, tacpoints);
		}
	}
	if(!isdefined(tacpoints) || tacpoints.size == 0)
	{
		return undefined;
	}
	return tacpoints;
}

/*
	Name: function_94d884e4
	Namespace: ai_patrol
	Checksum: 0x1CB40436
	Offset: 0xAA0
	Size: 0x12A
	Parameters: 1
	Flags: None
*/
function function_94d884e4(var_9033671b)
{
	if(!isdefined(self.var_ffa7c9d))
	{
		self.var_ffa7c9d = anglestoforward(self.angles);
	}
	tacpoints = self function_6155a7ca(var_9033671b);
	if(isdefined(tacpoints) && tacpoints.size > 0)
	{
		tacpoints = ai_escort::function_cb4925e3(tacpoints);
		if(isdefined(tacpoints) && tacpoints.size > 0)
		{
			self.var_36299b51 = tacpoints;
			newpos = getclosestpointonnavmesh(tacpoints[0].origin, self.goalradius, self.ai.patrol.var_861daf20);
			if(isdefined(newpos))
			{
				self.var_ffa7c9d = vectornormalize(newpos - self.origin);
				return newpos;
			}
		}
	}
	return undefined;
}

/*
	Name: is_debugging
	Namespace: ai_patrol
	Checksum: 0xF2057004
	Offset: 0xBD8
	Size: 0x36
	Parameters: 1
	Flags: Private
*/
function private is_debugging(dvar)
{
	/#
		if(getdvarint(dvar, 0))
		{
			return true;
		}
		return false;
	#/
}

/*
	Name: function_38d931e7
	Namespace: ai_patrol
	Checksum: 0x47EE5EAF
	Offset: 0xC18
	Size: 0x4C
	Parameters: 0
	Flags: None
*/
function function_38d931e7()
{
	var_1f2328d0 = self function_4794d6a3();
	if(!isdefined(var_1f2328d0.var_9e404264) || var_1f2328d0.var_9e404264)
	{
		return true;
	}
	return false;
}

/*
	Name: function_6b33bfb8
	Namespace: ai_patrol
	Checksum: 0xEB76C86F
	Offset: 0xC70
	Size: 0xAC
	Parameters: 1
	Flags: None
*/
function function_6b33bfb8(radius)
{
	if(self function_38d931e7())
	{
		return true;
	}
	var_1f2328d0 = self function_4794d6a3();
	if(isdefined(var_1f2328d0.overridegoalpos))
	{
		var_fca0ef39 = radius;
		var_1ba37935 = var_fca0ef39 * var_fca0ef39;
		if(distancesquared(var_1f2328d0.overridegoalpos, self.origin) <= var_1ba37935)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: update_patrol
	Namespace: ai_patrol
	Checksum: 0x2108628C
	Offset: 0xD28
	Size: 0x464
	Parameters: 0
	Flags: None
*/
function update_patrol()
{
	if(!self function_6f09c87())
	{
		return;
	}
	if(is_true(self.isarriving))
	{
		return;
	}
	/#
		assert(isdefined(self.ai.patrol.var_9033671b));
	#/
	var_1f2328d0 = self function_4794d6a3();
	if(self.ai.patrol.state == 2)
	{
		self.goalradius = 150;
		if(!isdefined(var_1f2328d0.overridegoalpos))
		{
			newpos = getclosestpointonnavmesh(self.ai.patrol.var_9033671b, self.goalradius, self.ai.patrol.var_861daf20);
			if(isdefined(newpos))
			{
				self.ai.patrol.var_81f76ce3 = gettime() + randomintrange(3000, 4500);
				self function_a57c34b7(newpos);
			}
		}
		var_1fc6a9ae = function_6b33bfb8(self.goalradius);
		if(var_1fc6a9ae)
		{
			self.ai.patrol.var_81f76ce3 = gettime() + randomintrange(2000, 3500);
			self.goalradius = self.ai.patrol.patrol_radius;
			self.ai.patrol.state = 1;
		}
	}
	else if(self.ai.patrol.state == 1)
	{
		var_1d1d42ba = 0;
		var_1fc6a9ae = function_6b33bfb8(20);
		var_cd26c30e = ai_target::function_a13468f5(self.ai.patrol.var_9033671b, self.ai.patrol.patrol_radius * 1.5);
		var_43c8852a = 0;
		if(isdefined(var_cd26c30e))
		{
			if(!isdefined(self.ai.patrol.var_cd26c30e) || self.ai.patrol.var_cd26c30e != var_cd26c30e)
			{
				var_43c8852a = 1;
			}
		}
		if(!isdefined(var_1f2328d0.overridegoalpos) || var_43c8852a)
		{
			var_1d1d42ba = 1;
		}
		else if(var_1fc6a9ae)
		{
			if(gettime() >= self.ai.patrol.var_81f76ce3)
			{
				var_1d1d42ba = 1;
			}
		}
		if(var_1d1d42ba)
		{
			newpos = self function_94d884e4(self.ai.patrol.var_9033671b);
			if(isdefined(newpos))
			{
				self function_a57c34b7(newpos);
			}
		}
	}
	/#
		recordcircle(self.ai.patrol.var_9033671b, self.ai.patrol.patrol_radius, (0, 0, 1), "");
		recordcircle(self.ai.patrol.var_9033671b, self.ai.patrol.var_edc20efd, (1, 0, 0), "");
	#/
}

/*
	Name: update_enemy
	Namespace: ai_patrol
	Checksum: 0x692BF60B
	Offset: 0x1198
	Size: 0x7E
	Parameters: 0
	Flags: None
*/
function update_enemy()
{
	if(is_true(self.ai.hasseenfavoriteenemy))
	{
		self.ai.patrol.state = 0;
	}
	else if(self.ai.patrol.state == 0)
	{
		self.ai.patrol.state = 2;
	}
}

/*
	Name: function_9a61e8fb
	Namespace: ai_patrol
	Checksum: 0x1AE26E80
	Offset: 0x1220
	Size: 0x11C
	Parameters: 1
	Flags: Private
*/
function private function_9a61e8fb(origin)
{
	if(isdefined(self.ai.patrol.var_36b19b5e))
	{
		owner = self.script_owner;
		if(isdefined(owner))
		{
			self.var_e2aca908 = spawn("script_model", origin);
			if(isdefined(self.var_e2aca908))
			{
				self.var_e2aca908.origin = origin;
				self.var_e2aca908 entityheadicons::setentityheadicon(owner.team, owner, self.ai.patrol.var_36b19b5e);
				headiconobjectiveid = self.var_e2aca908.entityheadobjectives[self.var_e2aca908.entityheadobjectives.size - 1];
				objective_setinvisibletoall(headiconobjectiveid);
				objective_setvisibletoplayer(headiconobjectiveid, owner);
			}
		}
	}
}

/*
	Name: function_732c2878
	Namespace: ai_patrol
	Checksum: 0x26D0644A
	Offset: 0x1348
	Size: 0x2C
	Parameters: 0
	Flags: Private
*/
function private function_732c2878()
{
	if(isdefined(self.var_e2aca908))
	{
		self.var_e2aca908 delete();
	}
}

/*
	Name: function_8d4eba95
	Namespace: ai_patrol
	Checksum: 0x517D161E
	Offset: 0x1380
	Size: 0x11C
	Parameters: 1
	Flags: Private
*/
function private function_8d4eba95(origin)
{
	if(isdefined(self.script_owner) && isdefined(self.ai.patrol.marker_fx))
	{
		self.var_74e8fd19 = spawnfx(self.ai.patrol.marker_fx, origin + vectorscale((0, 0, 1), 3), (0, 0, 1), (1, 0, 0));
		self.var_74e8fd19.team = self.team;
		triggerfx(self.var_74e8fd19);
		self.var_74e8fd19 setinvisibletoall();
		self.var_74e8fd19 setvisibletoplayer(self.script_owner);
		self.script_owner playsoundtoplayer(#"uin_mp_combat_bot_guard", self.script_owner);
	}
}

/*
	Name: function_698793f6
	Namespace: ai_patrol
	Checksum: 0x2ED77452
	Offset: 0x14A8
	Size: 0x36
	Parameters: 0
	Flags: Private
*/
function private function_698793f6()
{
	if(isdefined(self.var_74e8fd19))
	{
		self.var_74e8fd19 delete();
		self.var_74e8fd19 = undefined;
	}
}

/*
	Name: function_f037571d
	Namespace: ai_patrol
	Checksum: 0x23BE09A1
	Offset: 0x14E8
	Size: 0x64
	Parameters: 1
	Flags: Private
*/
function private function_f037571d(origin)
{
	self endon(#"death");
	self function_8d4eba95(origin);
	self function_9a61e8fb(origin);
	waitframe(1);
	self thread function_7c779aaf();
}

/*
	Name: function_3ec67269
	Namespace: ai_patrol
	Checksum: 0x40D02397
	Offset: 0x1558
	Size: 0x34
	Parameters: 0
	Flags: Private
*/
function private function_3ec67269()
{
	self function_698793f6();
	self function_732c2878();
}

/*
	Name: function_7c779aaf
	Namespace: ai_patrol
	Checksum: 0x853746F0
	Offset: 0x1598
	Size: 0xCC
	Parameters: 0
	Flags: Private
*/
function private function_7c779aaf()
{
	self notify(#"hash_5824b020cde66d5");
	self endon(#"hash_5824b020cde66d5");
	fx_marker = self.var_74e8fd19;
	hud_marker = self.var_e2aca908;
	self waittill(#"death", #"state_changed");
	if(isdefined(self))
	{
		self function_3ec67269();
	}
	else
	{
		if(isdefined(fx_marker))
		{
			fx_marker delete();
		}
		if(isdefined(hud_marker))
		{
			hud_marker delete();
		}
	}
}

/*
	Name: function_325c6829
	Namespace: ai_patrol
	Checksum: 0x3AB5994
	Offset: 0x1670
	Size: 0x134
	Parameters: 1
	Flags: None
*/
function function_325c6829(origin)
{
	/#
		assert(isdefined(self.ai.patrol));
	#/
	oldorigin = origin;
	if(isdefined(self.script_owner) && isdefined(self.var_2f8f0d5e))
	{
		origin = origin + vectorscale(anglestoforward((0, self.script_owner.angles[1], 0)), self.var_2f8f0d5e);
		origin = getclosestpointonnavmesh(origin, 200, 20);
	}
	if(!isdefined(origin))
	{
		origin = oldorigin;
	}
	self.ai.patrol.var_9033671b = origin;
	self.ai.patrol.starttime = gettime();
	self function_3ec67269();
	self thread function_f037571d(origin);
}

