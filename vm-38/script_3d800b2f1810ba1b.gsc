#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using script_120938d3a8d642ae;

#namespace namespace_54dfb21;

/*
	Name: function_bfbd44cf
	Namespace: namespace_54dfb21
	Checksum: 0x17C9959E
	Offset: 0x160
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_bfbd44cf()
{
	level notify(-1754443621);
}

#namespace namespace_1e5d913d;

/*
	Name: __init__system__
	Namespace: namespace_1e5d913d
	Checksum: 0xD09C7984
	Offset: 0x180
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_9fe6dae6d685563", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_1e5d913d
	Checksum: 0xD8D7D885
	Offset: 0x1C8
	Size: 0x1AC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.var_8a1c2b55 = spawnstruct();
	level.var_8a1c2b55.var_6a01400c = 0;
	level.var_8a1c2b55.var_f782e821 = [];
	level.var_8a1c2b55.templates = [];
	var_2fe0d693 = getentarray("script_model_augmented_impact_fx", "variantname");
	if(var_2fe0d693.size > 0)
	{
		array::thread_all(var_2fe0d693, &_think);
		/#
			setdvar(#"hash_3f5a3042d616052b", 0);
			setdvar(#"hash_168747d9fbaa6a48", 0);
			setdvar(#"hash_312f96d76ca3d249", 0);
			setdvar(#"hash_4e3253d6c90615ea", 0);
			setdvar(#"hash_5b0267c7f7e8d42", 0);
			setdvar(#"hash_2a6bc2c12ee6a9b4", 0);
			setdvar(#"hash_4557e9caba02e597", 0);
			thread function_5a46c509(var_2fe0d693);
		#/
	}
}

/*
	Name: function_5a46c509
	Namespace: namespace_1e5d913d
	Checksum: 0xF7C650
	Offset: 0x380
	Size: 0x30E
	Parameters: 1
	Flags: Private
*/
function private function_5a46c509(var_2fe0d693)
{
	/#
		infovolumedebuginit();
		old_value = getdvarint(#"hash_5b0267c7f7e8d42", 0);
		while(true)
		{
			if(old_value != getdvarint(#"hash_5b0267c7f7e8d42", 0))
			{
				old_value = getdvarint(#"hash_5b0267c7f7e8d42", 0);
				setdvar(#"g_drawdebuginfovolumes", old_value);
				if(old_value)
				{
					foreach(ent in var_2fe0d693)
					{
						foreach(info_volume in ent.var_8a1c2b55.var_afb7f7ec)
						{
							showinfovolume(info_volume getentitynumber(), (1, 0.5, 0.5), 0.5);
						}
					}
				}
				else
				{
					foreach(ent in var_2fe0d693)
					{
						foreach(info_volume in ent.var_8a1c2b55.var_afb7f7ec)
						{
							hideinfovolume(info_volume getentitynumber());
						}
					}
				}
			}
			waitframe(1);
		}
	#/
}

/*
	Name: _think
	Namespace: namespace_1e5d913d
	Checksum: 0xCAA28C53
	Offset: 0x698
	Size: 0x3A0
	Parameters: 0
	Flags: Linked, Private
*/
function private _think()
{
	self endon(#"death", #"deleted", #"hash_44a5d69960a8b32c", #"hash_7cc4a540f68c1e3f");
	if(!isdefined(self.var_1e5d913d))
	{
		/#
			println((((("" + self.origin[0]) + "") + self.origin[1]) + "") + self.origin[2]);
		#/
		return;
	}
	data = spawnstruct();
	self setcandamage(1);
	if(!isdefined(self.var_ac2c4043))
	{
		self.var_ac2c4043 = vectorscale((1, 1, 1), 0.75);
	}
	else if(!isvec(self.var_ac2c4043))
	{
		self.var_ac2c4043 = (self.var_ac2c4043, self.var_ac2c4043, self.var_ac2c4043);
	}
	data.var_afb7f7ec = [];
	if(isdefined(self.target))
	{
		data.var_afb7f7ec = getentarray(self.target, "targetname");
	}
	if(isdefined(self.var_9a3478b5) && !isdefined(level.var_8a1c2b55.templates[self.var_9a3478b5]))
	{
		var_4edf0398 = spawnstruct();
		var_4edf0398.var_1e4697f4 = getentarray(self.var_9a3478b5, "targetname");
		var_4edf0398.var_4ecc769d = (0, 0, 0);
		var_4edf0398.reference_angles = (0, 0, 0);
		level.var_8a1c2b55.templates[self.var_9a3478b5] = var_4edf0398;
		waitframe(1);
		foreach(ent in var_4edf0398.var_1e4697f4)
		{
			if(ent.model !== #"")
			{
				var_4edf0398.var_4ecc769d = ent.origin;
				var_4edf0398.reference_angles = ent.angles;
				arrayremoveindex(var_4edf0398.var_1e4697f4, index);
				ent delete();
				break;
			}
		}
	}
	data.var_33c88c75 = [];
	self.var_8a1c2b55 = data;
	self thread function_8f050823();
	while(true)
	{
		self.health = 999999;
		damage_data = undefined;
		damage_data = self waittill(#"damage");
		self function_2138c62(self.var_1e5d913d, damage_data);
	}
}

/*
	Name: function_8f050823
	Namespace: namespace_1e5d913d
	Checksum: 0x7EFBE3B4
	Offset: 0xA40
	Size: 0x55E
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8f050823()
{
	var_2cc6e886 = getscriptbundle(self.var_1e5d913d);
	if((isdefined(var_2cc6e886.var_d85a87b) ? var_2cc6e886.var_d85a87b : 0) > 0)
	{
		data = self.var_8a1c2b55;
		maxs = self getmaxs();
		mins = self getmins();
		bounds = maxs - mins;
		while(bounds == (0, 0, 0))
		{
			waitframe(1);
			maxs = self getmaxs();
			mins = self getmins();
			bounds = maxs - mins;
		}
		bounds = bounds * self.var_ac2c4043;
		data.var_141b25f = (abs((bounds[0] * bounds[1]) * bounds[2])) / 231;
		data.var_78e64a1a = data.var_141b25f;
		while(data.var_78e64a1a > var_2cc6e886.var_3efc3a35 || data.var_33c88c75.size > 0)
		{
			data.var_78e64a1a = data.var_78e64a1a - ((var_2cc6e886.var_d85a87b / 60) * (float(function_60d95f53()) / 1000) * data.var_33c88c75.size);
			var_bed2bab8 = data.var_78e64a1a / data.var_141b25f;
			/#
				if(getdvarint(#"hash_2a6bc2c12ee6a9b4", 0))
				{
					str_array = strtok("" + data.var_78e64a1a, "");
					var_78e64a1a = str_array[0];
					var_5d8d813a = "";
					if(str_array.size > 1)
					{
						var_5d8d813a = getsubstr(str_array[1], 0, 1);
					}
					str_array = strtok("" + data.var_141b25f, "");
					var_141b25f = str_array[0];
					var_68be928f = "";
					if(str_array.size > 1)
					{
						var_68be928f = getsubstr(str_array[1], 0, 1);
					}
					print3d(self.origin + (0, 0, bounds[2] + 12), (((((("" + var_78e64a1a) + "") + var_5d8d813a) + "") + var_141b25f) + "") + var_68be928f, undefined, undefined, 0.1);
				}
				if(getdvarint(#"hash_4557e9caba02e597", 0))
				{
					if(isdefined(self.var_6020a9fa))
					{
						z_offset = (0, 0, bounds[2] * self.var_6020a9fa);
						box(self.origin, (mins * self.var_ac2c4043) + z_offset, (maxs * self.var_ac2c4043) + z_offset, self.angles[1]);
					}
					else
					{
						box(self.origin, mins * self.var_ac2c4043, maxs * self.var_ac2c4043, self.angles[1]);
					}
				}
			#/
			foreach(var_3fbe54a4 in data.var_33c88c75)
			{
				if(var_3fbe54a4 >= data.var_78e64a1a)
				{
					self notify("augmented_impact_fx_" + var_3fbe54a4);
				}
			}
			waitframe(1);
		}
		self notify(#"hash_7cc4a540f68c1e3f");
	}
}

/*
	Name: function_93b52d75
	Namespace: namespace_1e5d913d
	Checksum: 0x6245AFA5
	Offset: 0xFA8
	Size: 0x106
	Parameters: 1
	Flags: Linked, Private
*/
function private function_93b52d75(damage_data)
{
	data = self.var_8a1c2b55;
	if(isdefined(data.var_141b25f))
	{
		maxs = self getabsmaxs();
		mins = self getabsmins();
		height = (maxs[2] - mins[2]) * self.var_ac2c4043[2];
		if(isdefined(self.var_6020a9fa))
		{
			mins = mins + (0, 0, height * self.var_6020a9fa);
		}
		return max(0, (data.var_141b25f * (damage_data.position[2] - mins[2])) / height);
	}
	return 0;
}

/*
	Name: function_e7eb6310
	Namespace: namespace_1e5d913d
	Checksum: 0x60FCFC3C
	Offset: 0x10B8
	Size: 0x8C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_e7eb6310(damage_data)
{
	data = self.var_8a1c2b55;
	if(!isdefined(data.var_78e64a1a))
	{
		return 1;
	}
	var_2cc6e886 = getscriptbundle(self.var_1e5d913d);
	if(var_2cc6e886.var_aa7874b1)
	{
		return damage_data.var_7c5043e3 < data.var_78e64a1a;
	}
	return data.var_78e64a1a > 0;
}

/*
	Name: function_2138c62
	Namespace: namespace_1e5d913d
	Checksum: 0x5986A0F2
	Offset: 0x1150
	Size: 0x158C
	Parameters: 3
	Flags: Linked, Private
*/
function private function_2138c62(var_1e5d913d, damage_data, var_b33be77)
{
	if(level.var_8a1c2b55.var_6a01400c >= 50)
	{
		/#
			if(getdvarint(#"hash_312f96d76ca3d249", 0))
			{
				println(((((((("" + var_1e5d913d) + "") + "") + self.origin[0]) + "") + self.origin[1]) + "") + self.origin[2]);
			}
		#/
		return;
	}
	if(!isplayer(damage_data.attacker) || (damage_data.mod != "MOD_PISTOL_BULLET" && damage_data.mod != "MOD_RIFLE_BULLET" && damage_data.mod != "MOD_GRENADE_SPLASH" && damage_data.mod != "MOD_PROJECTILE" && damage_data.mod != "MOD_PROJECTILE_SPLASH"))
	{
		/#
			if(getdvarint(#"hash_312f96d76ca3d249", 0))
			{
				if(!isplayer(damage_data.attacker))
				{
					println((((((((("" + damage_data.attacker) + "") + var_1e5d913d) + "") + self.origin[0]) + "") + self.origin[1]) + "") + self.origin[2]);
				}
				else
				{
					println((((((((("" + damage_data.mod) + "") + var_1e5d913d) + "") + self.origin[0]) + "") + self.origin[1]) + "") + self.origin[2]);
				}
			}
		#/
		return;
	}
	if(isdefined(var_1e5d913d))
	{
		var_2cc6e886 = getscriptbundle(var_1e5d913d);
		if(!isdefined(level.var_8a1c2b55.var_f782e821[var_1e5d913d]))
		{
			level.var_8a1c2b55.var_f782e821[var_1e5d913d] = [];
		}
	}
	if(!isdefined(var_2cc6e886))
	{
		/#
			if(getdvarint(#"hash_312f96d76ca3d249", 0) && !isdefined(var_b33be77))
			{
				println((((("" + self.origin[0]) + "") + self.origin[1]) + "") + self.origin[2]);
			}
		#/
		return;
	}
	if((isdefined(var_2cc6e886.effect) ? var_2cc6e886.effect : "") == "")
	{
		/#
			if(getdvarint(#"hash_312f96d76ca3d249", 0))
			{
				println((((((("" + var_1e5d913d) + "") + self.origin[0]) + "") + self.origin[1]) + "") + self.origin[2]);
			}
		#/
		return;
	}
	data = self.var_8a1c2b55;
	if(!isdefined(data.var_33c88c75[var_1e5d913d]))
	{
		data.var_33c88c75[var_1e5d913d] = 0;
	}
	if(!isdefined(var_b33be77))
	{
		var_b33be77 = [];
	}
	var_b33be77[var_b33be77.size] = var_1e5d913d;
	if(data.var_33c88c75[var_1e5d913d] < (isdefined(var_2cc6e886.var_9d47943c) ? var_2cc6e886.var_9d47943c : 1) && level.var_8a1c2b55.var_f782e821[var_1e5d913d].size < (isdefined(var_2cc6e886.var_404a7d1) ? var_2cc6e886.var_404a7d1 : 1))
	{
		var_caa96e8a = 1;
		dist = (isdefined(var_2cc6e886.distance) ? var_2cc6e886.distance : 0);
		if((isdefined(var_2cc6e886.var_403e0972) ? var_2cc6e886.var_403e0972 : 0) > 0)
		{
			dist = dist + (randomfloatrange(var_2cc6e886.var_403e0972 * -1, var_2cc6e886.var_403e0972));
		}
		dist_squared = dist * dist;
		foreach(var_b935e60d in var_b33be77)
		{
			foreach(var_7aa37d9f in level.var_8a1c2b55.var_f782e821[var_b935e60d])
			{
				if(distancesquared(damage_data.position, var_7aa37d9f.position) < dist_squared)
				{
					var_caa96e8a = 0;
					break;
				}
			}
			if(!var_caa96e8a)
			{
				/#
					if(getdvarint(#"hash_312f96d76ca3d249", 0))
					{
						println((((((((("" + dist) + "") + var_1e5d913d) + "") + self.origin[0]) + "") + self.origin[1]) + "") + self.origin[2]);
					}
				#/
				self function_2138c62(var_2cc6e886.var_fff670ab, damage_data, var_b33be77);
				return;
			}
		}
		if(damage_data.mod == "MOD_GRENADE_SPLASH" || damage_data.mod == "MOD_PROJECTILE_SPLASH")
		{
			var_f6bb7260 = self.var_ac2c4043;
			var_e5cdf905 = self getpointinbounds(randomfloatrange(var_f6bb7260[0] * -1, var_f6bb7260[0]), randomfloatrange(var_f6bb7260[1] * -1, var_f6bb7260[1]), randomfloatrange(var_f6bb7260[2] * -1, var_f6bb7260[2]));
			dir = vectornormalize(var_e5cdf905 - damage_data.position);
			trace_result = bullettrace(damage_data.position + dir, var_e5cdf905 + (dir * 12), 0, undefined);
			if(!isdefined(trace_result[#"entity"]) || trace_result[#"entity"] != self)
			{
				/#
					if(getdvarfloat(#"hash_4e3253d6c90615ea", 0) > 0)
					{
						line(damage_data.position + dir, trace_result[#"position"], (1, 0, 0), 1, 0, int(getdvarfloat(#"hash_4e3253d6c90615ea", 0) / (float(function_60d95f53()) / 1000)));
					}
					if(getdvarint(#"hash_312f96d76ca3d249", 0))
					{
						println((((((("" + var_1e5d913d) + "") + self.origin[0]) + "") + self.origin[1]) + "") + self.origin[2]);
					}
				#/
				return;
			}
			/#
				if(getdvarfloat(#"hash_4e3253d6c90615ea", 0) > 0)
				{
					line(damage_data.position + dir, trace_result[#"position"], (1, 1, 1), 1, 0, int(getdvarfloat(#"hash_4e3253d6c90615ea", 0) / (float(function_60d95f53()) / 1000)));
				}
			#/
			damage_data.position = trace_result[#"position"];
		}
		else
		{
			trace_result = bullettrace(damage_data.position - damage_data.direction, damage_data.position + (damage_data.direction * 6), 0, undefined);
		}
		var_7670388f = 1;
		if(!isdefined(var_2cc6e886.max_angle))
		{
			var_2cc6e886.max_angle = 0;
		}
		if(!isdefined(var_2cc6e886.min_angle))
		{
			var_2cc6e886.min_angle = 0;
		}
		if(var_2cc6e886.min_angle > 0 || var_2cc6e886.max_angle < 180)
		{
			angle = acos(vectordot(trace_result[#"normal"], (0, 0, 1)));
			var_7670388f = angle >= var_2cc6e886.min_angle && angle <= var_2cc6e886.max_angle;
		}
		if(!var_7670388f)
		{
			/#
				if(getdvarint(#"hash_312f96d76ca3d249", 0))
				{
					println((((((((("" + angle) + "") + var_1e5d913d) + "") + self.origin[0]) + "") + self.origin[1]) + "") + self.origin[2]);
				}
			#/
			self function_2138c62(var_2cc6e886.var_fff670ab, damage_data, var_b33be77);
			return;
		}
		var_6175aa99 = 1;
		foreach(var_efd324db in data.var_afb7f7ec)
		{
			if(var_efd324db istouching(damage_data.position))
			{
				var_6175aa99 = 0;
				break;
			}
		}
		if(var_6175aa99 && isdefined(self.var_9a3478b5))
		{
			var_4edf0398 = level.var_8a1c2b55.templates[self.var_9a3478b5];
			position = var_4edf0398.var_4ecc769d + (rotatepoint((damage_data.position - self.origin) / self getscale(), var_4edf0398.reference_angles - self.angles));
			foreach(var_efd324db in var_4edf0398.var_1e4697f4)
			{
				if(var_efd324db istouching(position))
				{
					var_6175aa99 = 0;
					break;
				}
			}
		}
		var_2d85b8d = 1;
		if(var_6175aa99)
		{
			damage_data.var_7c5043e3 = self function_93b52d75(damage_data);
			var_2d85b8d = self function_e7eb6310(damage_data);
			if(!var_2cc6e886.var_aa7874b1)
			{
				damage_data.var_7c5043e3 = 0;
			}
		}
		if(var_6175aa99 && var_2d85b8d)
		{
			level.var_8a1c2b55.var_6a01400c++;
			level.var_8a1c2b55.var_f782e821[var_1e5d913d][level.var_8a1c2b55.var_f782e821[var_1e5d913d].size] = damage_data;
			data.var_33c88c75[data.var_33c88c75.size] = damage_data.var_7c5043e3;
			loc_000021EC:
			forward = function_f80632da((isdefined(var_2cc6e886.var_39f04272) ? var_2cc6e886.var_39f04272 : 0), cos((isdefined(var_2cc6e886.var_ef1ee44c) ? var_2cc6e886.var_ef1ee44c : 0)), damage_data.attacker, damage_data.position, trace_result[#"normal"]);
			if((isdefined(var_2cc6e886.var_f9ac1f46) ? var_2cc6e886.var_f9ac1f46 : 0) > 0 && forward == trace_result[#"normal"])
			{
				offset = forward + (perpendicularvector(forward) * tan(var_2cc6e886.var_f9ac1f46)) * randomfloat(1);
				offset = rotatepointaroundaxis(offset, forward, randomfloatrange(0, 360));
				forward = vectornormalize(offset);
				/#
					if(getdvarint(#"hash_168747d9fbaa6a48", 0))
					{
						iprintlnbold(acos(vectordot(trace_result[#"normal"], forward)));
					}
				#/
			}
			fx_ent = spawnfx(var_2cc6e886.effect, damage_data.position, forward);
			triggerfx(fx_ent);
			lifetime = (isdefined(var_2cc6e886.lifetime) ? var_2cc6e886.lifetime : 0);
			if((isdefined(var_2cc6e886.var_3478ebdf) ? var_2cc6e886.var_3478ebdf : 0) > 0)
			{
				lifetime = lifetime + randomfloat(var_2cc6e886.var_3478ebdf);
			}
			self thread function_479d351(var_2cc6e886.start_sound, var_2cc6e886.loop_sound, var_2cc6e886.end_sound, damage_data.position, lifetime, var_2cc6e886.var_d560194f);
			self thread function_7f273dfd(var_2cc6e886.var_fc9e755a, damage_data.position, forward, lifetime);
			self thread namespace_e64042f6::do_damage(var_2cc6e886.var_a744e12b, damage_data.position, forward, lifetime);
			if(lifetime > 0)
			{
				self thread function_a4507e23(fx_ent, var_1e5d913d, lifetime, damage_data);
				if(isdefined(var_2cc6e886.end_effect) && isdefined(var_2cc6e886.var_4241f357))
				{
					self thread function_9dce67f(var_2cc6e886.end_effect, var_2cc6e886.var_4241f357, lifetime + (isdefined(var_2cc6e886.var_3ee57e0e) ? var_2cc6e886.var_3ee57e0e : 0), damage_data.position, forward);
				}
			}
			if(is_true(self.send_notify))
			{
				self notify(#"hash_49d7b379138ff899", {#fx_ent:fx_ent, #forward:forward, #position:damage_data.position});
			}
			if((isdefined(var_2cc6e886.debounce) ? var_2cc6e886.debounce : 0) > 0)
			{
				wait(var_2cc6e886.debounce);
			}
		}
	}
	else
	{
		/#
			println((((((("" + var_1e5d913d) + "") + self.origin[0]) + "") + self.origin[1]) + "") + self.origin[2]);
		#/
		if(getdvarint(#"hash_312f96d76ca3d249", 0))
		{
		}
		self function_2138c62(var_2cc6e886.var_fff670ab, damage_data, var_b33be77);
	}
}

/*
	Name: function_a4507e23
	Namespace: namespace_1e5d913d
	Checksum: 0xA55B5003
	Offset: 0x26E8
	Size: 0x124
	Parameters: 4
	Flags: Linked, Private
*/
function private function_a4507e23(fx_ent, var_1e5d913d, lifetime, damage_data)
{
	if(lifetime > float(function_60d95f53()) / 1000)
	{
		wait(lifetime);
	}
	if(isdefined(fx_ent) && !function_3132f113(fx_ent))
	{
		fx_ent delete();
	}
	level.var_8a1c2b55.var_6a01400c--;
	arrayremovevalue(level.var_8a1c2b55.var_f782e821[var_1e5d913d], damage_data, 0);
	if(isdefined(self) && !function_3132f113(self))
	{
		arrayremovevalue(self.var_8a1c2b55.var_33c88c75, damage_data.var_7c5043e3, 0);
	}
}

/*
	Name: function_479d351
	Namespace: namespace_1e5d913d
	Checksum: 0xB0BFA3E8
	Offset: 0x2818
	Size: 0x264
	Parameters: 6
	Flags: Linked, Private
*/
function private function_479d351(start_sound, loop_sound, end_sound, position, lifetime, fade_time)
{
	if((isdefined(start_sound) ? start_sound : "") != "")
	{
		sound_ent = spawn("script_origin", position);
		sound_ent playsound(start_sound);
	}
	if((isdefined(loop_sound) ? loop_sound : "") != "")
	{
		if(!isdefined(sound_ent))
		{
			sound_ent = spawn("script_origin", position);
		}
		sound_ent playloopsound(loop_sound);
	}
	if(lifetime > 0)
	{
		wait(lifetime);
		if((isdefined(start_sound) ? start_sound : "") != "")
		{
			sound_ent stopsound(start_sound);
		}
		if((isdefined(loop_sound) ? loop_sound : "") != "")
		{
			if(isdefined(fade_time))
			{
				sound_ent stoploopsound(fade_time);
			}
			else
			{
				sound_ent stoploopsound();
			}
		}
		if((isdefined(end_sound) ? end_sound : "") != "")
		{
			if(!isdefined(sound_ent))
			{
				sound_ent = spawn("script_origin", position);
			}
			sound_ent playsoundwithnotify(end_sound, "sound_end");
			sound_ent waittill(#"sound_end");
			waitframe(1);
			sound_ent delete();
		}
		else if(isdefined(sound_ent))
		{
			waitframe(1);
			sound_ent delete();
		}
	}
}

/*
	Name: function_9dce67f
	Namespace: namespace_1e5d913d
	Checksum: 0x92F93CF5
	Offset: 0x2A88
	Size: 0xB4
	Parameters: 5
	Flags: Linked, Private
*/
function private function_9dce67f(end_effect, var_4241f357, delay, position, forward)
{
	if(delay > float(function_60d95f53()) / 1000)
	{
		wait(delay);
	}
	var_d0ee869b = spawnfx(end_effect, position, forward);
	triggerfx(var_d0ee869b);
	wait(var_4241f357);
	var_d0ee869b delete();
}

/*
	Name: function_f80632da
	Namespace: namespace_1e5d913d
	Checksum: 0xBF31697C
	Offset: 0x2B48
	Size: 0x17C
	Parameters: 5
	Flags: Linked, Private
*/
function private function_f80632da(range, var_2b88ddd3, attacker, position, forward)
{
	if(range > 0)
	{
		var_ff38f326 = attacker getenemiesinradius(position, range);
		foreach(var_f39b1a24 in var_ff38f326)
		{
			mins = var_f39b1a24 getabsmins();
			maxs = var_f39b1a24 getabsmaxs();
			var_4ead9840 = (mins + maxs) / 2;
			var_80b482af = vectornormalize(var_4ead9840 - position);
			dot = vectordot(forward, var_80b482af);
			if(dot > var_2b88ddd3)
			{
				return var_80b482af;
			}
		}
	}
	return forward;
}

/*
	Name: function_7f273dfd
	Namespace: namespace_1e5d913d
	Checksum: 0xEBF4FDE4
	Offset: 0x2CD0
	Size: 0x17C
	Parameters: 4
	Flags: Linked, Private
*/
function private function_7f273dfd(var_f5411e2, position, normal, lifetime)
{
	if(isdefined(var_f5411e2))
	{
		var_fc9e755a = getscriptbundle(var_f5411e2);
		if(isdefined(var_fc9e755a) && isdefined(var_fc9e755a.settings) && var_fc9e755a.settings.size > 0)
		{
			if(!isdefined(var_fc9e755a.delay))
			{
				var_fc9e755a.delay = 0;
			}
			if(var_fc9e755a.delay > 0)
			{
				wait(var_fc9e755a.delay);
				lifetime = lifetime - var_fc9e755a.delay;
			}
			var_917c5c76 = undefined;
			foreach(settings in var_fc9e755a.settings)
			{
				var_917c5c76 = function_db7de647(var_917c5c76, settings, position, normal, lifetime);
			}
			if(isdefined(var_917c5c76))
			{
				var_917c5c76 delete();
			}
		}
	}
}

/*
	Name: function_db7de647
	Namespace: namespace_1e5d913d
	Checksum: 0x37623AA
	Offset: 0x2E58
	Size: 0x384
	Parameters: 5
	Flags: Linked, Private
*/
function private function_db7de647(var_917c5c76, settings, position, normal, var_9861703a)
{
	if(!isdefined(settings.time))
	{
		settings.time = 0;
	}
	if(!isdefined(settings.lerp_time))
	{
		settings.lerp_time = 0;
	}
	if(!isdefined(settings.radius))
	{
		settings.radius = 0;
	}
	if(!isdefined(settings.var_a20a7474))
	{
		settings.var_a20a7474 = 0;
	}
	if(!isdefined(settings.z_offset))
	{
		settings.z_offset = 0;
	}
	if(!isdefined(var_917c5c76))
	{
		var_917c5c76 = spawn("script_origin", (position + (normal * settings.var_a20a7474)) + (0, 0, settings.z_offset));
		var_917c5c76.radius = settings.radius;
		/#
			var_917c5c76 thread function_1a4bd745();
		#/
	}
	else if(settings.lerp_time > float(function_60d95f53()) / 1000)
	{
		var_917c5c76 moveto((position + (normal * settings.var_a20a7474)) + (0, 0, settings.z_offset), settings.lerp_time);
		var_e91b68d1 = var_917c5c76.radius;
		time = 0;
		while(time <= settings.lerp_time)
		{
			var_917c5c76.radius = lerpfloat(var_e91b68d1, settings.radius, time / settings.lerp_time);
			fxblocksight(var_917c5c76, var_917c5c76.radius);
			waitframe(1);
			time = time + (float(function_60d95f53()) / 1000);
		}
		var_917c5c76.radius = settings.radius;
		fxblocksight(var_917c5c76, var_917c5c76.radius);
	}
	var_917c5c76.origin = (position + (normal * settings.var_a20a7474)) + (0, 0, settings.z_offset);
	var_917c5c76.radius = settings.radius;
	fxblocksight(var_917c5c76, var_917c5c76.radius);
	end_time = (is_true(settings.var_6e390e3c) ? settings.time * var_9861703a : settings.time) - settings.lerp_time;
	if(end_time >= (float(function_60d95f53()) / 1000))
	{
		wait(end_time);
	}
	return var_917c5c76;
}

/*
	Name: function_1a4bd745
	Namespace: namespace_1e5d913d
	Checksum: 0x213B3B8A
	Offset: 0x31E8
	Size: 0xB6
	Parameters: 0
	Flags: Private
*/
function private function_1a4bd745()
{
	/#
		self endon(#"deleted");
		while(isdefined(self) && !function_3132f113(self))
		{
			if(getdvarint(#"hash_3f5a3042d616052b", 0))
			{
				if(self.radius > 0)
				{
					sphere(self.origin, self.radius, (0, 0, 1), 0.5, 0, 20, 1);
				}
			}
			waitframe(1);
		}
	#/
}

