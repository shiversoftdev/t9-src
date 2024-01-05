#using script_7cc5fb39b97494c4;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\doors_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace namespace_64f6ea7a;

/*
	Name: function_d194fd4d
	Namespace: namespace_64f6ea7a
	Checksum: 0x81432CD4
	Offset: 0x188
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_d194fd4d()
{
	level notify(-1882863456);
}

/*
	Name: function_e9823650
	Namespace: namespace_64f6ea7a
	Checksum: 0xE03A1442
	Offset: 0x1A8
	Size: 0x6
	Parameters: 0
	Flags: None
*/
function function_e9823650()
{
	return false;
}

/*
	Name: function_1bf7f7e5
	Namespace: namespace_64f6ea7a
	Checksum: 0x21F298C5
	Offset: 0x1B8
	Size: 0x8
	Parameters: 0
	Flags: None
*/
function function_1bf7f7e5()
{
	return 12;
}

/*
	Name: function_cecca69c
	Namespace: namespace_64f6ea7a
	Checksum: 0x5944B774
	Offset: 0x1C8
	Size: 0xA
	Parameters: 0
	Flags: None
*/
function function_cecca69c()
{
	return 1;
}

/*
	Name: init_max_yaws
	Namespace: namespace_64f6ea7a
	Checksum: 0xF93929B8
	Offset: 0x1E0
	Size: 0x7E
	Parameters: 0
	Flags: None
*/
function init_max_yaws()
{
	self.var_15695d13 = undefined;
	self.var_ca91d615 = undefined;
	/#
		self.traces = undefined;
	#/
	self get_max_yaw(1);
	if(self.m_s_bundle.door_open_method == "swing_away_from_player")
	{
		self get_max_yaw(0);
	}
	else
	{
		i = 0;
	}
}

/*
	Name: get_max_yaw
	Namespace: namespace_64f6ea7a
	Checksum: 0x67530A6D
	Offset: 0x268
	Size: 0x1F6
	Parameters: 1
	Flags: Private
*/
function private get_max_yaw(var_b6cc4c20)
{
	var_e4214597 = 70;
	var_1e45bf81 = 30;
	var_2a162980 = 5;
	var_533884d6 = math::sign(self.m_s_bundle.door_swing_angle);
	if(var_b6cc4c20)
	{
		if(isdefined(self.var_a2f96f78.var_bed36372))
		{
			/#
				assert(self.var_a2f96f78.var_bed36372 > 0, ("" + self.m_e_door.origin) + "");
			#/
			self.var_15695d13 = self.var_a2f96f78.var_bed36372 * var_533884d6;
			return;
		}
	}
	else if(isdefined(self.var_a2f96f78.var_f3a85f58))
	{
		/#
			assert(self.var_a2f96f78.var_f3a85f58 > 0, ("" + self.m_e_door.origin) + "");
		#/
		self.var_ca91d615 = (self.var_a2f96f78.var_f3a85f58 * var_533884d6) * -1;
		return;
	}
	var_f58bf66c = get_max_yaw_internal(var_e4214597, var_1e45bf81, var_b6cc4c20);
	var_f58bf66c = var_f58bf66c + var_2a162980;
	var_c3277087 = get_max_yaw_internal(var_f58bf66c, var_2a162980, var_b6cc4c20);
	if(var_b6cc4c20)
	{
		self.var_15695d13 = var_c3277087 * var_533884d6;
	}
	else
	{
		self.var_ca91d615 = (var_c3277087 * var_533884d6) * -1;
	}
}

/*
	Name: get_max_yaw_internal
	Namespace: namespace_64f6ea7a
	Checksum: 0xDB38C79D
	Offset: 0x468
	Size: 0x198
	Parameters: 3
	Flags: Private
*/
function private get_max_yaw_internal(var_85b47952, increment, var_b6cc4c20)
{
	self.m_e_door endon(#"entitydeleted");
	var_5f70cf61 = 0;
	finished = 0;
	cycles = 0;
	contents = (65536 | 1) | 268435456;
	var_338875fc = 179;
	if(isdefined(self.m_s_bundle.door_swing_angle))
	{
		var_338875fc = abs(self.m_s_bundle.door_swing_angle);
	}
	while(!finished)
	{
		if(var_85b47952 > var_338875fc)
		{
			return var_338875fc;
		}
		var_dd88fc59 = self yaw_collision_check(var_85b47952, var_b6cc4c20, contents);
		if(var_dd88fc59)
		{
			if(var_5f70cf61)
			{
				finish = 1;
			}
			var_85b47952 = var_85b47952 + increment;
		}
		else
		{
			if(!var_5f70cf61)
			{
				var_5f70cf61 = 1;
			}
			var_85b47952 = var_85b47952 - increment;
			finished = 1;
		}
		cycles++;
		if(cycles == 3)
		{
			cycles = 0;
			wait(0.05);
		}
	}
	/#
		assert(var_85b47952 >= 0);
	#/
	return var_85b47952;
}

/*
	Name: yaw_collision_check
	Namespace: namespace_64f6ea7a
	Checksum: 0x29688E17
	Offset: 0x608
	Size: 0x6BE
	Parameters: 3
	Flags: Private
*/
function private yaw_collision_check(yaw, var_b6cc4c20, var_43119537)
{
	var_3b412bef = vectorscale((0, 0, 1), 10);
	var_ded121f8 = self.var_85f2454d.origin + var_3b412bef;
	if(var_43119537)
	{
		trace_angles = [[ self ]]->function_d36318ad(0, 1, 0, self.m_s_bundle.var_16a4e229, self.m_s_bundle.var_16e3e29b, var_b6cc4c20, 1);
	}
	else
	{
		trace_angles = [[ self ]]->function_d36318ad(0, 1, 1, self.m_s_bundle.var_16a4e229, self.m_s_bundle.var_16e3e29b, var_b6cc4c20, 1);
	}
	var_39764a55 = max(self.var_e9da41b9 * 0.2, 16);
	start = var_ded121f8 + (self doors::function_eea7cdb4(trace_angles) * var_39764a55);
	end = var_ded121f8 + (self doors::function_eea7cdb4(1) * self.var_e9da41b9);
	mins = vectorscale((-1, -1, 0), 6);
	maxs = (6, 6, 40);
	var_84a65cf6 = physicstrace(start, end, mins, maxs, self.m_e_door, 1 | 8);
	var_fe34498d = distance2d(start, var_84a65cf6[#"position"]);
	/#
		if(getdvarint(#"hash_5171254138328d84") == 2)
		{
			var_816ef68c = 200;
			if(!isdefined(self.traces))
			{
				self.traces = 1;
			}
			else
			{
				self.traces++;
			}
			color = (1, 1, 1);
			if(var_fe34498d > 50)
			{
				color = (0, 1, 0);
			}
			else
			{
				if(var_fe34498d < 3)
				{
					color = (1, 0, 0);
				}
				else if(var_fe34498d < 50)
				{
					color = (1, 1, 0);
				}
			}
			var_5bdd16d1 = var_ded121f8 + (self doors::function_eea7cdb4(trace_angles) * self.var_e9da41b9);
			line(var_ded121f8, var_5bdd16d1, (1, 1, 1), 1, 0, var_816ef68c);
			print3d(var_5bdd16d1, var_b6cc4c20 + "", color, 1, 0.05, var_816ef68c);
			line(start, var_84a65cf6[#"position"], color, 0.5, 0, var_816ef68c);
			if(var_84a65cf6[#"fraction"] < 1)
			{
				line(var_84a65cf6[#"position"], end, color * 0.3, 0.5, 0, var_816ef68c);
			}
			print3d(start, "" + self.traces, color, 1, 0.05, var_816ef68c);
		}
	#/
	if(var_fe34498d > 3)
	{
		start = var_ded121f8 + ((self doors::function_eea7cdb4(trace_angles) * self.var_e9da41b9) * 0.9);
		var_5124c314 = physicstrace(start, end, mins, maxs, self.m_e_door, 1 | 8);
		var_17a48baf = distance2d(start, var_5124c314[#"position"]);
		/#
			if(getdvarint(#"hash_5171254138328d84") == 2)
			{
				self.traces++;
				color = (1, 1, 1);
				if(var_17a48baf > 50)
				{
					color = (0, 1, 0);
				}
				else
				{
					if(var_17a48baf < 5)
					{
						color = (1, 0, 0);
					}
					else if(var_17a48baf < 50)
					{
						color = (1, 1, 0);
					}
				}
				line(start, var_5124c314[#"position"], color, 0.5, 0, var_816ef68c);
				if(var_5124c314[#"fraction"] < 1)
				{
					line(var_5124c314[#"position"], end, color * 0.3, 0.5, 0, var_816ef68c);
				}
				print3d(start, "" + self.traces, color, 1, 0.05, var_816ef68c);
			}
		#/
		if(var_17a48baf > 5)
		{
			return true;
		}
	}
	/#
		if(getdvarint(#"hash_5171254138328d84", 0))
		{
			println((((("" + self.m_e_door getentitynumber()) + "") + var_43119537) + "") + self.m_e_door.origin);
		}
	#/
	return false;
}

/*
	Name: draw_max_yaw
	Namespace: namespace_64f6ea7a
	Checksum: 0xB4C1B5B4
	Offset: 0xCD0
	Size: 0x194
	Parameters: 1
	Flags: None
*/
function draw_max_yaw(var_b6cc4c20)
{
	/#
		trace_angles = undefined;
		color = undefined;
		if(var_b6cc4c20)
		{
			trace_angles = [[ self ]]->function_d36318ad(0, 1, 0, self.m_s_bundle.var_16a4e229, self.m_s_bundle.var_16e3e29b);
			color = (0, 1, 1);
		}
		else
		{
			trace_angles = [[ self ]]->function_d36318ad(0, 1, 1, self.m_s_bundle.var_16a4e229, self.m_s_bundle.var_16e3e29b);
			color = (0, 0.5, 0.5);
		}
		start = self.var_85f2454d.origin;
		line_end = start + (self doors::function_eea7cdb4(trace_angles) * self.var_e9da41b9);
		line(start, line_end, color, 1, 0, 1);
		angle = [[ self ]]->function_85fe0c35(!var_b6cc4c20);
		print3d(line_end, angle + "", color, 1, 0.05);
	#/
}

/*
	Name: monitor_door_push
	Namespace: namespace_64f6ea7a
	Checksum: 0xF887A141
	Offset: 0xE70
	Size: 0x188
	Parameters: 1
	Flags: None
*/
function monitor_door_push(delay)
{
	if(!self function_9d109db6())
	{
		return;
	}
	self endon(#"hash_6162e3d94ad294c7");
	self.m_e_door notify(#"door_closing");
	self.m_e_door endon(#"entitydeleted");
	if(!isdefined(delay))
	{
		delay = 0.5;
	}
	if(delay > 0)
	{
		wait(delay);
	}
	self thread door_ease_in_open_input();
	while(true)
	{
		var_b7f42cd3 = self interact_door_ispushentclose();
		if(isdefined(var_b7f42cd3))
		{
			self push_door(var_b7f42cd3, 0);
		}
		else if(is_true(self.isplayingpushsound))
		{
			self.isplayingpushsound = 0;
			self notify(#"hash_751895912b6e081d");
		}
		if(self flag::get("open") == 0)
		{
			[[ self ]]->function_f657b618(1);
			self notify(#"hash_6162e3d94ad294c7");
		}
		waitframe(1);
	}
}

/*
	Name: door_ease_in_open_input
	Namespace: namespace_64f6ea7a
	Checksum: 0xD25C2749
	Offset: 0x1000
	Size: 0xAE
	Parameters: 0
	Flags: Private
*/
function private door_ease_in_open_input()
{
	self.m_e_door endon(#"entitydeleted");
	maxtime = 1;
	time = maxtime;
	self.masterdoorratescale = 0;
	while(true)
	{
		if(!isdefined(self) || time <= 0)
		{
			break;
		}
		self.masterdoorratescale = 1 - (time / maxtime);
		wait(0.05);
		time = time - 0.05;
	}
	self.masterdoorratescale = 1;
}

/*
	Name: interact_door_ispushentclose
	Namespace: namespace_64f6ea7a
	Checksum: 0xE5A88443
	Offset: 0x10B8
	Size: 0x1EE
	Parameters: 0
	Flags: Private
*/
function private interact_door_ispushentclose()
{
	team = self.script_team;
	if(!isdefined(team))
	{
		team = #"all";
	}
	pushents = getplayers(team);
	if(isdefined(self.var_d0ca7119))
	{
		pushents = arraycombine(pushents, self.var_d0ca7119);
	}
	foreach(var_b7f42cd3 in pushents)
	{
		if(isdefined(var_b7f42cd3) && isalive(var_b7f42cd3))
		{
			if(is_true(self.var_81f24576) && isplayer(var_b7f42cd3))
			{
				continue;
			}
			z = abs(var_b7f42cd3.origin[2] - self.m_e_door.origin[2]);
			if(z < 40)
			{
				endpoint = interact_door_get_endpoint();
				d = distancesquared(var_b7f42cd3.origin, endpoint);
				if(d < 2500)
				{
					return var_b7f42cd3;
				}
			}
		}
	}
	return undefined;
}

/*
	Name: interact_door_get_endpoint
	Namespace: namespace_64f6ea7a
	Checksum: 0x7B4D23FA
	Offset: 0x12B0
	Size: 0x2E
	Parameters: 0
	Flags: Private
*/
function private interact_door_get_endpoint()
{
	return self.m_e_door.origin + (self doors::function_eea7cdb4() * self.var_e9da41b9);
}

/*
	Name: push_door
	Namespace: namespace_64f6ea7a
	Checksum: 0xB631C003
	Offset: 0x12E8
	Size: 0x872
	Parameters: 2
	Flags: None
*/
function push_door(e_who, var_5991aa24)
{
	if(is_true(self.var_2ec65fe))
	{
		return;
	}
	if(self.m_s_bundle.door_open_method != "swing_away_from_player" && self.m_s_bundle.door_open_method != "swing")
	{
		return;
	}
	var_9ae92efb = 0;
	var_22fc16ba = 0;
	self.m_e_door endon(#"entitydeleted");
	var_b7f42cd3 = e_who;
	if(isplayer(var_b7f42cd3))
	{
		var_9ae92efb = var_5991aa24;
	}
	else
	{
		var_9ae92efb = 1;
	}
	if(var_5991aa24 == 0)
	{
		self.var_c4c3fa39 = 0;
	}
	if(!var_9ae92efb)
	{
		var_cd167873 = self function_c152a0ca(var_b7f42cd3);
		if(!isdefined(var_cd167873))
		{
			self notify(#"hash_751895912b6e081d");
			return;
		}
	}
	else
	{
		var_cd167873 = [[ self ]]->function_61d3d3da(var_b7f42cd3);
	}
	amount = 0;
	if(var_9ae92efb)
	{
		amount = 9999;
		if(isactor(var_b7f42cd3))
		{
			var_22fc16ba = 1;
		}
	}
	else
	{
		max_dist = 50;
		min_dist = 0;
		var_62563bd1 = 50;
		endpoint = interact_door_get_endpoint();
		dist = distance2d(var_b7f42cd3.origin, endpoint);
		percent = mapfloat(min_dist, max_dist, 0, 1, dist);
		amount = var_62563bd1 * (1 - percent);
		amount = amount * self.masterdoorratescale;
	}
	if(abs(amount) < 0.001)
	{
		return;
	}
	target_angles = undefined;
	var_12d56c89 = spawnstruct();
	if(var_cd167873 > 0)
	{
		target_angles = [[ self ]]->function_d36318ad(0, 1, 0, self.m_s_bundle.var_16a4e229, self.m_s_bundle.var_16e3e29b, amount, var_22fc16ba, var_12d56c89);
	}
	else
	{
		target_angles = [[ self ]]->function_d36318ad(0, 1, 1, self.m_s_bundle.var_16a4e229, self.m_s_bundle.var_16e3e29b, amount, var_22fc16ba, var_12d56c89);
	}
	[[ self ]]->set_player_who_opened(var_b7f42cd3);
	if(var_12d56c89.var_e6d945ba)
	{
		return;
	}
	self.var_2ec65fe = 1;
	if(amount > 0.4)
	{
		self thread try_push_sound();
		if(!self flag::get("door_second_interact"))
		{
			self flag::set("door_second_interact");
		}
	}
	else if(is_true(self.isplayingpushsound))
	{
		self.isplayingpushsound = 0;
		self notify(#"hash_751895912b6e081d");
	}
	if(var_5991aa24 || var_9ae92efb)
	{
		var_cebf7d8f = undefined;
		var_9d74f501 = undefined;
		if(var_12d56c89.var_672b7d83 == "closed")
		{
			var_9d74f501 = var_12d56c89.var_f626de4;
		}
		else
		{
			var_9d74f501 = 1 - var_12d56c89.var_f626de4;
		}
		if(var_5991aa24)
		{
			if(isdefined(self.m_s_bundle.var_cebf7d8f))
			{
				self.m_e_door playsound(self.m_s_bundle.var_cebf7d8f);
			}
			open_time = mapfloat(0, 1, 0, self.m_s_bundle.var_f275e953, var_9d74f501);
		}
		else
		{
			open_time = mapfloat(0, 1, 0, self.m_s_bundle.door_open_time, var_9d74f501);
		}
		physicsexplosionsphere(self.m_e_door.origin, 64, 0, 0);
		self.m_e_door setforcenocull();
		self.m_e_door rotateto(target_angles, open_time);
		self.m_e_door waittill(#"rotatedone");
		self.m_e_door removeforcenocull();
		physicsexplosionsphere(self.m_e_door.origin, 64, 0, 0);
		if(isdefined(var_b7f42cd3))
		{
			var_b7f42cd3 notify(#"hash_7a96e443b93cd211");
		}
	}
	else
	{
		self.m_e_door notify(#"rotatedone");
		self.m_e_door.angles = target_angles;
	}
	self.var_2ec65fe = undefined;
	if(var_12d56c89.var_672b7d83 == "closed")
	{
		[[ self ]]->close();
		self notify(#"hash_6162e3d94ad294c7");
	}
	else
	{
		if(var_12d56c89.var_672b7d83 == "open_completely" || var_12d56c89.var_672b7d83 == "open_completely_reverse")
		{
			self flag::set("door_fully_open");
			[[ self ]]->update_use_message();
			[[ self ]]->function_f657b618(1);
			[[ self ]]->function_f584b243(1);
			if(0)
			{
				self notify(#"hash_6162e3d94ad294c7");
			}
		}
		else
		{
			if(self flag::get("door_fully_open"))
			{
				self flag::clear("door_fully_open");
				if(0)
				{
					[[ self ]]->function_f584b243(0);
				}
			}
			if(1)
			{
				if(door_is_open_at_least(60))
				{
					[[ self ]]->function_f584b243(1);
				}
				else
				{
					[[ self ]]->function_f584b243(0);
				}
			}
			[[ self ]]->function_f657b618(0);
		}
	}
	var_8a5f85a2 = self door_is_half_open();
	if(var_8a5f85a2 != is_true(self.was_opened_halfway))
	{
		if(var_8a5f85a2)
		{
			var_da3e0b97 = isdefined(var_b7f42cd3) && isplayer(var_b7f42cd3);
			self thread suspicious_door_stealth_check(var_da3e0b97);
		}
	}
	self.was_opened_halfway = var_8a5f85a2;
}

/*
	Name: door_is_half_open
	Namespace: namespace_64f6ea7a
	Checksum: 0x6F20C30A
	Offset: 0x1B68
	Size: 0x122
	Parameters: 0
	Flags: Private
*/
function private door_is_half_open()
{
	var_e17e8d14 = self doors::get_door_angles() - self doors::get_door_angles(1);
	var_e17e8d14 = angleclamp180(var_e17e8d14);
	angle_diff = (var_e17e8d14[0] + var_e17e8d14[1]) + var_e17e8d14[2];
	if(math::sign(angle_diff) == math::sign(self.var_15695d13))
	{
		if(angle_diff > 0)
		{
			return angle_diff >= (self.var_15695d13 / 2);
		}
		return angle_diff <= (self.var_15695d13 / 2);
	}
	if(angle_diff > 0)
	{
		return angle_diff >= (self.var_ca91d615 / 2);
	}
	return angle_diff <= (self.var_ca91d615 / 2);
}

/*
	Name: door_is_open_at_least
	Namespace: namespace_64f6ea7a
	Checksum: 0x43F7190D
	Offset: 0x1C98
	Size: 0xE6
	Parameters: 1
	Flags: None
*/
function door_is_open_at_least(var_d9acc9e2)
{
	/#
		assert(var_d9acc9e2 >= 0, ("" + var_d9acc9e2) + "");
	#/
	var_e17e8d14 = self doors::get_door_angles() - self doors::get_door_angles(1);
	var_e17e8d14 = angleclamp180(var_e17e8d14);
	angle_diff = (var_e17e8d14[0] + var_e17e8d14[1]) + var_e17e8d14[2];
	if(angle_diff > 0)
	{
		return angle_diff >= var_d9acc9e2;
	}
	return angle_diff <= -1 * var_d9acc9e2;
}

/*
	Name: suspicious_door_stealth_check
	Namespace: namespace_64f6ea7a
	Checksum: 0x5CF3259F
	Offset: 0x1D90
	Size: 0xD4
	Parameters: 1
	Flags: None
*/
function suspicious_door_stealth_check(var_ffd1df9a)
{
	if(!isdefined(level.stealth))
	{
		return;
	}
	if(!getdvarint(#"hash_4e997f8f5fb7bc59", 0) || !isdefined(level.stealth))
	{
		return;
	}
	if(var_ffd1df9a)
	{
		level.stealth.suspicious_door.doors[level.stealth.suspicious_door.doors.size] = self;
	}
	else
	{
		arrayremovevalue(level.stealth.suspicious_door.doors, self);
	}
}

/*
	Name: try_push_sound
	Namespace: namespace_64f6ea7a
	Checksum: 0x3B9AF740
	Offset: 0x1E70
	Size: 0x44
	Parameters: 0
	Flags: Private
*/
function private try_push_sound()
{
	if(!isdefined(self.isplayingpushsound))
	{
		self.isplayingpushsound = 0;
	}
	if(!self.isplayingpushsound)
	{
		self.isplayingpushsound = 1;
		self thread door_creak_sound();
	}
}

/*
	Name: door_creak_sound
	Namespace: namespace_64f6ea7a
	Checksum: 0x9BD3EA6D
	Offset: 0x1EC0
	Size: 0x104
	Parameters: 2
	Flags: Private
*/
function private door_creak_sound(var_aecae07, scale_time)
{
	self.m_e_door endon(#"entitydeleted");
	self notify(#"hash_751ece30abc106fd");
	alias = self.m_s_bundle.var_69358708;
	if(!isdefined(alias))
	{
		alias = self.m_s_bundle.door_loop_sound;
	}
	if(isentity(self.m_e_door) && isdefined(alias) && soundexists(alias))
	{
		self.m_e_door playloopsound(alias);
		self waittill(#"hash_751895912b6e081d", #"hash_6162e3d94ad294c7");
		self thread door_creak_sound_stop();
	}
}

/*
	Name: door_creak_sound_stop
	Namespace: namespace_64f6ea7a
	Checksum: 0xF0F871FA
	Offset: 0x1FD0
	Size: 0x64
	Parameters: 0
	Flags: Private
*/
function private door_creak_sound_stop()
{
	if(isdefined(self.m_e_door))
	{
		self.m_e_door endon(#"entitydeleted");
	}
	self endon(#"hash_751ece30abc106fd");
	wait(0.55);
	if(isdefined(self.m_e_door))
	{
		self.m_e_door stoploopsound();
	}
}

/*
	Name: angle_diff
	Namespace: namespace_64f6ea7a
	Checksum: 0x22C053E4
	Offset: 0x2040
	Size: 0x3A
	Parameters: 2
	Flags: Private
*/
function private angle_diff(value1, value2)
{
	diff = angleclamp180(value1 - value2);
	return diff;
}

/*
	Name: function_9670a4a4
	Namespace: namespace_64f6ea7a
	Checksum: 0x675829D2
	Offset: 0x2088
	Size: 0x402
	Parameters: 5
	Flags: None
*/
function function_9670a4a4(var_f700d5eb, b_reverse, var_d6cc2350, var_58c4c830, var_b0a715f2)
{
	/#
		assert(!isdefined(var_d6cc2350) || var_d6cc2350 > 0, "");
	#/
	var_f626de4 = undefined;
	var_672b7d83 = undefined;
	var_e6d945ba = 0;
	var_f29beb60 = undefined;
	var_7630ab93 = undefined;
	var_9c7b53b4 = math::sign(self.m_s_bundle.door_swing_angle);
	var_812c62a6 = var_d6cc2350 * var_9c7b53b4;
	if(b_reverse)
	{
		var_812c62a6 = var_812c62a6 * -1;
	}
	var_d5f7cb0e = [[ self ]]->function_85fe0c35(!b_reverse);
	if(var_f700d5eb < var_d5f7cb0e)
	{
		var_7630ab93 = var_d5f7cb0e;
		var_f29beb60 = var_f700d5eb;
	}
	else
	{
		var_7630ab93 = var_f700d5eb;
		var_f29beb60 = var_d5f7cb0e;
	}
	var_62959515 = undefined;
	if(var_58c4c830)
	{
		var_62959515 = 0;
	}
	else
	{
		var_b2d627ee = angleclamp180(function_74618a4f(self.var_85f2454d.angles));
		var_2e5af146 = combineangles(self.m_e_door.angles, var_b2d627ee);
		var_2e5af146 = angleclamp180((var_2e5af146[0], var_2e5af146[1], var_2e5af146[2]));
		var_62959515 = (var_2e5af146[0] + var_2e5af146[1]) + var_2e5af146[2];
	}
	var_7701b65e = var_62959515 + var_812c62a6;
	var_2c0a512d = undefined;
	if(var_62959515 > 0.01 && var_7701b65e < -0.01)
	{
		var_672b7d83 = "closed";
		var_2c0a512d = 0;
		var_f626de4 = var_62959515 / var_d5f7cb0e;
	}
	else
	{
		if(var_62959515 < -0.01 && var_7701b65e > 0.01)
		{
			var_672b7d83 = "closed";
			var_2c0a512d = 0;
			var_f626de4 = var_62959515 / var_d5f7cb0e;
		}
		else
		{
			if(var_7701b65e > var_7630ab93 || var_7701b65e < var_f29beb60)
			{
				if(b_reverse)
				{
					var_672b7d83 = "open_completely_reverse";
				}
				else
				{
					var_672b7d83 = "open_completely";
				}
				var_2c0a512d = var_f700d5eb;
				var_f626de4 = var_62959515 / var_f700d5eb;
			}
			else
			{
				var_2c0a512d = var_7701b65e;
				if(abs(var_7701b65e) > abs(var_62959515))
				{
					var_672b7d83 = "opening_partially";
					var_f626de4 = var_62959515 / var_f700d5eb;
				}
				else
				{
					var_672b7d83 = "closing_partially";
					var_f626de4 = var_62959515 / var_d5f7cb0e;
				}
			}
		}
	}
	if(var_672b7d83 != "closing_partially" && var_672b7d83 != "opening_partially")
	{
		var_e6d945ba = (abs(abs(var_62959515) - abs(var_2c0a512d))) < 0.01;
	}
	if(isdefined(var_b0a715f2))
	{
		var_b0a715f2.var_672b7d83 = var_672b7d83;
		var_b0a715f2.var_f626de4 = var_f626de4;
		var_b0a715f2.var_e6d945ba = var_e6d945ba;
	}
	return var_2c0a512d;
}

/*
	Name: function_c152a0ca
	Namespace: namespace_64f6ea7a
	Checksum: 0x816FF1FF
	Offset: 0x2498
	Size: 0x23C
	Parameters: 1
	Flags: None
*/
function function_c152a0ca(user)
{
	var_cd167873 = 1;
	if(!isdefined(user))
	{
		return undefined;
	}
	var_903d67c4 = self doors::function_fb354714();
	var_6209ecfe = self interact_door_get_endpoint() - user.origin;
	var_4443000b = (var_6209ecfe[0], var_6209ecfe[1], 0);
	var_4443000b = vectornormalize(var_4443000b);
	var_79467049 = vectordot(var_4443000b, var_903d67c4);
	v_movement = undefined;
	var_86c03756 = math::sign(var_79467049);
	if(isplayer(user))
	{
		v_stick = user getnormalizedmovement();
		v_stick = (v_stick[0], v_stick[1] * -1, 0);
		v_movement = rotatepoint(v_stick, user.angles);
		v_movement = vectornormalize(v_movement);
	}
	else
	{
		v_movement = user getvelocity();
		v_movement = (v_movement[0], v_movement[1], 0);
		v_movement = vectornormalize(v_movement);
	}
	if(lengthsquared(v_movement) < 0.01)
	{
		return undefined;
	}
	var_cd167873 = vectordot(var_903d67c4, v_movement);
	if(math::sign(var_cd167873) != var_86c03756)
	{
		return undefined;
	}
	return var_cd167873;
}

/*
	Name: function_9d109db6
	Namespace: namespace_64f6ea7a
	Checksum: 0x98569FB8
	Offset: 0x26E0
	Size: 0x144
	Parameters: 1
	Flags: None
*/
function function_9d109db6(var_9a84e695)
{
	if(!isdefined(var_9a84e695))
	{
		var_9a84e695 = 0;
	}
	if(!is_true(self.m_s_bundle.door_use_trigger))
	{
		return false;
	}
	if(isdefined(self.var_f97eab64))
	{
		if(!self.var_f97eab64)
		{
			return false;
		}
	}
	else if(!is_true(self.m_s_bundle.var_7bbc4039))
	{
		return false;
	}
	if(var_9a84e695)
	{
		if(!isdefined(self.var_9b9642be) || !isplayer(self.var_9b9642be))
		{
			return false;
		}
	}
	if(self.m_s_bundle.door_open_method == "swing")
	{
		var_cd167873 = [[ self ]]->function_61d3d3da(self.var_9b9642be);
		if(var_cd167873 <= 0)
		{
			return false;
		}
		return true;
	}
	if(self.m_s_bundle.door_open_method == "swing_away_from_player")
	{
		return true;
	}
	return false;
}

