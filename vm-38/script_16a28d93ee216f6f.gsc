#using script_1883fa4e60abbf9f;
#using script_2d443451ce681a;
#using script_5450c003e8a913b7;
#using scripts\core_common\flag_shared.gsc;
#using scripts\cp_common\util.gsc;

#namespace corpse;

/*
	Name: function_9073f90b
	Namespace: corpse
	Checksum: 0x4FE25FAD
	Offset: 0xF0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_9073f90b()
{
	level notify(997453509);
}

/*
	Name: scalevolume
	Namespace: corpse
	Checksum: 0x503E29D0
	Offset: 0x110
	Size: 0x14
	Parameters: 2
	Flags: None
*/
function scalevolume(ent, vol)
{
}

#namespace stealth_corpse;

/*
	Name: corpse_init_entity
	Namespace: stealth_corpse
	Checksum: 0xB2EE8469
	Offset: 0x130
	Size: 0x42
	Parameters: 0
	Flags: Linked
*/
function corpse_init_entity()
{
	/#
		assert(isdefined(self.stealth));
	#/
	self.stealth.corpse = spawnstruct();
}

/*
	Name: corpse_init_level
	Namespace: stealth_corpse
	Checksum: 0x57DE38F9
	Offset: 0x180
	Size: 0xE4
	Parameters: 0
	Flags: Linked
*/
function corpse_init_level()
{
	if(isdefined(level.stealth) && isdefined(level.stealth.corpse))
	{
		return;
	}
	level.stealth.corpse = spawnstruct();
	level.stealth.corpse.reset_time = 30;
	level.fngetcorpsearrayfunc = &ai::function_4f84c3ed;
	level namespace_979752dc::set_stealth_func("saw_corpse", &corpse_seen);
	level namespace_979752dc::set_stealth_func("found_corpse", &corpse_found);
	set_corpse_ranges_default();
}

/*
	Name: set_corpse_ranges_default
	Namespace: stealth_corpse
	Checksum: 0xA68F3D83
	Offset: 0x270
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function set_corpse_ranges_default()
{
	array[#"sight_dist"] = 600;
	array[#"detect_dist"] = 300;
	array[#"found_dist"] = 100;
	set_corpse_ranges(array);
}

/*
	Name: set_corpse_ranges
	Namespace: stealth_corpse
	Checksum: 0xAB4D29AA
	Offset: 0x2E0
	Size: 0x66
	Parameters: 1
	Flags: Linked
*/
function set_corpse_ranges(array)
{
	if(!isdefined(array[#"hash_67ecb968e26f1dee"]))
	{
		array[#"hash_67ecb968e26f1dee"] = array[#"found_dist"];
	}
	level.stealth.corpse.var_4fc967d0 = array;
}

/*
	Name: set_corpse_ignore
	Namespace: stealth_corpse
	Checksum: 0x3D795D7B
	Offset: 0x350
	Size: 0x74
	Parameters: 0
	Flags: None
*/
function set_corpse_ignore()
{
	/#
		assert(isdefined(level.stealth));
	#/
	/#
		assert(isentity(self));
	#/
	level.stealth.ignore_corpse[self getentitynumber()] = self.origin;
}

/*
	Name: set_corpse_entity
	Namespace: stealth_corpse
	Checksum: 0x34ACB71A
	Offset: 0x3D0
	Size: 0x74
	Parameters: 0
	Flags: None
*/
function set_corpse_entity()
{
	/#
		assert(isdefined(level.stealth));
	#/
	/#
		assert(isentity(self));
	#/
	level.stealth.additional_corpse[self getentitynumber()] = self;
}

/*
	Name: corpse_check_shadow
	Namespace: stealth_corpse
	Checksum: 0x3A636A36
	Offset: 0x450
	Size: 0x152
	Parameters: 1
	Flags: Linked
*/
function corpse_check_shadow(origin)
{
	if(!isdefined(self.in_shadow_origin) || distancesquared(self.in_shadow_origin, origin) > 1)
	{
		self.in_shadow = undefined;
		if(isdefined(level.var_5ca45f26) && isdefined(level.var_5ca45f26[#"hash_772784d4b2054007"]))
		{
			foreach(trigger in level.var_5ca45f26[#"hash_772784d4b2054007"])
			{
				if(isdefined(trigger) && trigger istouching(origin))
				{
					self.in_shadow = 1;
					break;
				}
			}
		}
		self.in_shadow_origin = origin;
	}
	return is_true(self.in_shadow);
}

/*
	Name: corpse_sight
	Namespace: stealth_corpse
	Checksum: 0xAAEDCF90
	Offset: 0x5B0
	Size: 0x874
	Parameters: 0
	Flags: Linked
*/
function corpse_sight()
{
	if(isdefined(self.stealth.corpse_nexttime) && gettime() < self.stealth.corpse_nexttime)
	{
		return;
	}
	if(level.stealth.var_69fc8bf2 >= 1)
	{
		return;
	}
	if(self flag::get("stealth_hold_position"))
	{
		return;
	}
	if(self.ignoreall)
	{
		return;
	}
	if(is_true(self.stealth.corpse.investigating))
	{
		return;
	}
	if(isdefined(self.stealth.corpse.ent))
	{
		self.stealth.corpse_nexttime = gettime() + 200;
	}
	else
	{
		self.stealth.corpse_nexttime = gettime() + 1500;
	}
	found_dist = level.stealth.corpse.var_4fc967d0[#"found_dist"];
	if(isdefined(self.stealth.override_corpse_found_dist))
	{
		found_dist = self.stealth.override_corpse_found_dist;
	}
	sight_dist = level.stealth.corpse.var_4fc967d0[#"sight_dist"];
	if(isdefined(self.stealth.override_corpse_sight_dist))
	{
		sight_dist = self.stealth.override_corpse_sight_dist;
	}
	detect_dist = level.stealth.corpse.var_4fc967d0[#"detect_dist"];
	if(isdefined(self.stealth.override_corpse_detect_dist))
	{
		detect_dist = self.stealth.override_corpse_detect_dist;
	}
	var_9f3728b2 = sqr(found_dist);
	var_1adb66c8 = sqr(sight_dist);
	var_3ff1021a = sqr(detect_dist);
	check_dist = max(found_dist, max(sight_dist, detect_dist));
	corpses = [];
	if(isdefined(level.fngetcorpsearrayfunc))
	{
		corpses = [[level.fngetcorpsearrayfunc]](self.origin, check_dist);
	}
	level.stealth.var_69fc8bf2++;
	found_corpse = undefined;
	saw_corpse = undefined;
	foreach(corpse in corpses)
	{
		var_2501cbe2 = corpse namespace_979752dc::getcorpseorigin();
		var_4ac4d617 = corpse getentitynumber();
		if(isdefined(level.stealth.ignore_corpse) && isdefined(level.stealth.ignore_corpse[var_4ac4d617]) && distancesquared(level.stealth.ignore_corpse[var_4ac4d617], var_2501cbe2) < sqr(100))
		{
			level.stealth.ignore_corpse[var_4ac4d617] = undefined;
			corpse.found = 1;
		}
		if(isdefined(corpse.found))
		{
			continue;
		}
		distsq = distancesquared(self.origin, var_2501cbe2);
		if(corpse corpse_check_shadow(var_2501cbe2))
		{
			/#
				assert(level.stealth.corpse.var_4fc967d0[#"hash_67ecb968e26f1dee"] <= check_dist);
			#/
			var_1adb66c8 = sqr(level.stealth.corpse.var_4fc967d0[#"hash_67ecb968e26f1dee"]);
			var_3ff1021a = var_1adb66c8;
		}
		if(distsq < var_9f3728b2)
		{
			if(abs(self.origin[2] - var_2501cbe2[2]) < 60)
			{
				found_corpse = corpse;
				break;
			}
		}
		if(isdefined(self.stealth.corpse.ent))
		{
			if(self.stealth.corpse.ent == corpse)
			{
				continue;
			}
			var_db8d2405 = self.stealth.corpse.ent namespace_979752dc::getcorpseorigin();
			var_2a0fe92a = distancesquared(self.origin, var_db8d2405);
			if(var_2a0fe92a <= distsq)
			{
				continue;
			}
		}
		if(distsq > var_1adb66c8)
		{
			continue;
		}
		if(var_2501cbe2[2] - self.origin[2] > 128)
		{
			continue;
		}
		if(distsq < var_3ff1021a)
		{
			if(!isdefined(corpse.seen) && self cansee(corpse))
			{
				saw_corpse = corpse;
				break;
			}
		}
		sight = anglestoforward(self gettagangles("tag_eye"));
		vec_to_corpse = vectornormalize((var_2501cbe2 + vectorscale((0, 0, 1), 30)) - self geteye());
		if(vectordot(sight, vec_to_corpse) > 0.55)
		{
			if(!isdefined(corpse.seen) && self cansee(corpse))
			{
				saw_corpse = corpse;
				break;
			}
		}
	}
	if(isdefined(found_corpse))
	{
		found_corpse.found = 1;
		if(is_true(found_corpse.seen) && isdefined(self.stealth.corpse.ent) && self.stealth.corpse.ent == found_corpse)
		{
			self.stealth.patrol_react_last = gettime();
		}
		self function_a3fcf9e0("found_corpse", found_corpse, found_corpse namespace_979752dc::getcorpseorigin());
	}
	else if(isdefined(saw_corpse))
	{
		self thread corpse_seen_claim(saw_corpse);
		self function_a3fcf9e0("saw_corpse", saw_corpse, saw_corpse namespace_979752dc::getcorpseorigin());
	}
}

/*
	Name: corpse_found
	Namespace: stealth_corpse
	Checksum: 0x3F3466E0
	Offset: 0xE30
	Size: 0x11C
	Parameters: 1
	Flags: Linked
*/
function corpse_found(event)
{
	self notify(#"corpse_found");
	self endon(#"corpse_found");
	self endon(#"death");
	corpse = event.entity;
	var_2501cbe2 = corpse namespace_979752dc::getcorpseorigin();
	if(isdefined(self.stealth.corpse.ent))
	{
		self.stealth.corpse.ent.seen = undefined;
	}
	self.stealth.corpse.ent = corpse;
	self.stealth.bexaminerequested = 1;
	if(isdefined(level.fnsetcorpseremovetimerfunc))
	{
		corpse [[level.fnsetcorpseremovetimerfunc]](level.stealth.corpse.reset_time);
	}
}

/*
	Name: corpse_seen
	Namespace: stealth_corpse
	Checksum: 0xAE0FF27A
	Offset: 0xF58
	Size: 0x84
	Parameters: 1
	Flags: Linked
*/
function corpse_seen(event)
{
	corpse = event.entity;
	var_2501cbe2 = corpse namespace_979752dc::getcorpseorigin();
	self.stealth.corpse.origin = var_2501cbe2;
	self.stealth.bexaminerequested = 1;
	self thread corpse_seen_claim(corpse);
}

/*
	Name: corpse_seen_claim
	Namespace: stealth_corpse
	Checksum: 0x31F650F7
	Offset: 0xFE8
	Size: 0xDC
	Parameters: 1
	Flags: Linked
*/
function corpse_seen_claim(corpse)
{
	self notify(#"corpse_seen_claim");
	self endon(#"corpse_seen_claim");
	if(isdefined(self.stealth.corpse.ent))
	{
		self.stealth.corpse.ent.seen = undefined;
	}
	corpse.seen = 1;
	self.stealth.corpse.ent = corpse;
	self waittill(#"death");
	if(isdefined(corpse))
	{
		corpse.seen = undefined;
	}
	if(isdefined(self))
	{
		self thread corpse_clear();
	}
}

/*
	Name: corpse_clear
	Namespace: stealth_corpse
	Checksum: 0x22536FF7
	Offset: 0x10D0
	Size: 0x82
	Parameters: 0
	Flags: Linked
*/
function corpse_clear()
{
	if(isdefined(self.stealth.corpse))
	{
		if(isdefined(self.stealth.corpse.ent))
		{
			self.stealth.corpse.ent.seen = undefined;
		}
		self.stealth.corpse.ent = undefined;
		self.stealth.corpse.investigating = undefined;
	}
}

/*
	Name: suspicious_door_sighting
	Namespace: stealth_corpse
	Checksum: 0xACD89FDF
	Offset: 0x1160
	Size: 0x644
	Parameters: 0
	Flags: None
*/
function suspicious_door_sighting()
{
	if(!isdefined(self.stealth.suspicious_door))
	{
		self.stealth.suspicious_door = spawnstruct();
	}
	if(isdefined(self.stealth.suspicious_door.nexttime) && gettime() < self.stealth.suspicious_door.nexttime)
	{
		return;
	}
	if(self flag::get("stealth_hold_position"))
	{
		return;
	}
	if(self.ignoreall)
	{
		return;
	}
	if(is_true(self.stealth.suspicious_door.investigating))
	{
		return;
	}
	if(isdefined(self.stealth.suspicious_door.ent))
	{
		self.stealth.suspicious_door.nexttime = gettime() + 100;
	}
	else
	{
		self.stealth.suspicious_door.nexttime = gettime() + 1000;
	}
	doors = level.stealth.suspicious_door.doors;
	var_e51f89c2 = undefined;
	var_cc3596e8 = undefined;
	door = undefined;
	foreach(door in doors)
	{
		var_ed1e6fa2 = door getentitynumber();
		if(isdefined(door.found))
		{
			continue;
		}
		var_715a5cbd = door.origin;
		distsq = distancesquared(self.origin, var_715a5cbd);
		var_9f3728b2 = level.stealth.suspicious_door.found_distsqrd;
		var_1adb66c8 = level.stealth.suspicious_door.sight_distsqrd;
		var_3ff1021a = level.stealth.suspicious_door.detect_distsqrd;
		if(distsq < var_9f3728b2)
		{
			if(abs(self.origin[2] - var_715a5cbd[2]) < 60)
			{
				var_e51f89c2 = door;
				break;
			}
		}
		if(isdefined(self.stealth.suspicious_door.ent))
		{
			if(self.stealth.suspicious_door.ent == door)
			{
				continue;
			}
			var_7e90842d = self.stealth.suspicious_door.ent.origin;
			var_2a0fe92a = distancesquared(self.origin, var_7e90842d);
			if(var_2a0fe92a <= distsq)
			{
				continue;
			}
		}
		if(distsq > var_1adb66c8)
		{
			continue;
		}
		if(var_715a5cbd[2] - self.origin[2] > 128)
		{
			continue;
		}
		if(distsq < var_3ff1021a)
		{
			if(!isdefined(door.seen) && self cansee(door) && util::function_30d3b9ff(door.origin, self, 250, getplayers()[0]))
			{
				var_cc3596e8 = door;
				break;
			}
		}
		sight = anglestoforward(self gettagangles("tag_eye"));
		var_385f9620 = vectornormalize((var_715a5cbd + vectorscale((0, 0, 1), 30)) - self geteye());
		if(vectordot(sight, var_385f9620) > 0.55)
		{
			if(!isdefined(door.seen) && self cansee(door) && util::function_30d3b9ff(door.origin, self, 250, getplayers()[0]))
			{
				var_cc3596e8 = door;
				break;
			}
		}
	}
	if(isdefined(var_e51f89c2))
	{
		var_e51f89c2.found = 1;
		spot = undefined;
		if(is_true(var_e51f89c2.seen) && isdefined(self.stealth.suspicious_door.ent) && self.stealth.suspicious_door.ent == var_e51f89c2)
		{
			self.stealth.patrol_react_last = gettime();
		}
		if(isdefined(door.cam_structs))
		{
			spot = door.cam_structs[0].origin;
		}
		else
		{
			spot = door.origin;
		}
		self function_a3fcf9e0("suspicious_door", var_e51f89c2, spot);
	}
}

/*
	Name: suspicious_door_found
	Namespace: stealth_corpse
	Checksum: 0xF0CB03C1
	Offset: 0x17B0
	Size: 0x16C
	Parameters: 1
	Flags: Linked
*/
function suspicious_door_found(event)
{
	door = event.entity;
	if(isdefined(door.aiopener))
	{
		return;
	}
	door.aiopener = self;
	if(isdefined(door.cam_structs) && isdefined(door.cam_structs[0]))
	{
		spot = door.cam_structs[0].origin;
	}
	else
	{
		spot = door.origin;
	}
	point = getclosestpointonnavmesh(spot, 500, 16);
	if(!isdefined(point))
	{
		point = spot;
	}
	event.origin = spot + (anglestoforward((0, randomfloatrange(0, 360), 0)) * 75);
	event.investigate_pos = getclosestpointonnavmesh(event.origin, 500, 16);
	if(!isdefined(event.investigate_pos))
	{
		event.investigate_pos = event.origin;
	}
	self namespace_f1f700ac::bt_set_stealth_state("investigate", event);
}

