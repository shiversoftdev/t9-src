#using script_139ae0bb0a87141c;
#using script_1883fa4e60abbf9f;
#using script_7b68dad851540de;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace debug;

/*
	Name: function_e35bafc1
	Namespace: debug
	Checksum: 0x3D6B5E83
	Offset: 0x90
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_e35bafc1()
{
	level notify(543938470);
}

/*
	Name: scalevolume
	Namespace: debug
	Checksum: 0xB928678A
	Offset: 0xB0
	Size: 0x14
	Parameters: 2
	Flags: None
*/
function scalevolume(ent, vol)
{
}

#namespace stealth_debug;

/*
	Name: function_4334ac55
	Namespace: stealth_debug
	Checksum: 0x8F50FAAB
	Offset: 0xD0
	Size: 0x210
	Parameters: 0
	Flags: None
*/
function function_4334ac55()
{
	/#
		function_5ac4dc99("", "");
		function_5ac4dc99("", "");
		function_5ac4dc99("", "");
		function_5ac4dc99("", -1);
		function_5ac4dc99("", "");
		function_5ac4dc99("", "");
		function_5ac4dc99("", "");
		thread function_f5dd6400();
		while(true)
		{
			waitframe(1);
			function_613009e2();
			if(!debug_enabled())
			{
				continue;
			}
			function_84811192("", "");
			function_84811192("", "" + level flag::get(""));
			function_84811192("", "" + level flag::get(""));
			function_ea707af9("");
			function_6a467cff();
			function_5a47b49c();
		}
	#/
}

/*
	Name: debug_player
	Namespace: stealth_debug
	Checksum: 0x6E4916A2
	Offset: 0x2E8
	Size: 0x550
	Parameters: 0
	Flags: None
*/
function debug_player()
{
	/#
		self endon(#"death");
		hudelem = newdebughudelem(self);
		hudelem.x = -50;
		hudelem.y = 450;
		hudelem.color = (0.5, 1, 0.5);
		hudelem settext("");
		z = 0;
		space = 10;
		tab = "";
		while(true)
		{
			if(debug_enabled() && getplayers().size > 0)
			{
				player = getplayers()[0];
				if(!isdefined(player.stealth) || !player flag::get(""))
				{
					hudelem.alpha = 0;
				}
				else
				{
					hudelem.alpha = 1;
				}
				function_84811192("", "");
				function_84811192("", "" + self.script_stealthgroup);
				function_84811192("", tab + "");
				keys = getarraykeys(self.stealth.spotted_list);
				ais = level.stealth.enemies[#"allies"];
				foreach(ai in ais)
				{
					if(!isalive(ai))
					{
						continue;
					}
					foreach(key in keys)
					{
						if(ai.unique_id == key)
						{
							msg = ((tab + "") + self getentitynumber() + "") + self.stealth.spotted_list[key];
							function_84811192("", msg);
						}
					}
				}
				function_84811192("", "" + player.maxvisibledist);
				if(getplayers()[0] flag::get(""))
				{
					function_84811192("", "");
				}
				if(getplayers()[0] isnotarget())
				{
					function_84811192("", "");
				}
				if(is_true(getplayers()[0].ignoreme))
				{
					function_84811192("", "");
				}
				if(isdefined(getplayers()[0].stealth.var_f6c2537d) && getplayers()[0].stealth.var_f6c2537d.size > 0)
				{
					function_84811192("", "");
				}
			}
			else
			{
				hudelem.alpha = 0;
			}
			function_ea707af9("");
			wait(0.05);
		}
	#/
}

/*
	Name: function_b4d10409
	Namespace: stealth_debug
	Checksum: 0x60DDEBEA
	Offset: 0x840
	Size: 0x118
	Parameters: 0
	Flags: None
*/
function function_b4d10409()
{
	/#
		self endon(#"death");
		function_5ac4dc99("", "");
		while(true)
		{
			if(debug_enabled())
			{
				space = 10;
				count = 0;
				if(self flag::get(""))
				{
					print3d(self.origin + (0, 0, (count * space) * -1), "", (0.2, 1, 0.2), 1, 0.5);
				}
				count++;
				self function_5e5487bf("");
			}
			wait(0.05);
		}
	#/
}

/*
	Name: function_8c76fdc5
	Namespace: stealth_debug
	Checksum: 0x5FD5A2A9
	Offset: 0x960
	Size: 0x100
	Parameters: 0
	Flags: None
*/
function function_8c76fdc5()
{
	/#
		self endon(#"death");
		function_5ac4dc99("", "");
		function_5ac4dc99("", "");
		while(true)
		{
			if(is_true(self.in_melee_death))
			{
				return;
			}
			if(debug_enabled())
			{
				function_d0c3b413();
			}
			num = function_f7282bd9();
			if(num == self getentitynumber())
			{
				function_48f1fd1c();
			}
			wait(0.05);
		}
	#/
}

/*
	Name: debug_enabled
	Namespace: stealth_debug
	Checksum: 0xE8C682FA
	Offset: 0xA68
	Size: 0x52
	Parameters: 0
	Flags: None
*/
function debug_enabled()
{
	/#
		dvar = getdvarstring(#"debug_stealth", "");
		return int(dvar);
	#/
}

/*
	Name: function_f7282bd9
	Namespace: stealth_debug
	Checksum: 0x7C40719C
	Offset: 0xAC8
	Size: 0x52
	Parameters: 0
	Flags: None
*/
function function_f7282bd9()
{
	/#
		dvar = getdvarstring(#"hash_1d243583f36b0230", "");
		return int(dvar);
	#/
}

/*
	Name: function_579409ff
	Namespace: stealth_debug
	Checksum: 0x1799361A
	Offset: 0xB28
	Size: 0x52
	Parameters: 0
	Flags: None
*/
function function_579409ff()
{
	/#
		dvar = getdvarstring(#"hash_447f76d8e8bca45a", "");
		return int(dvar);
	#/
}

/*
	Name: function_467590e0
	Namespace: stealth_debug
	Checksum: 0x56D0EE37
	Offset: 0xB88
	Size: 0x52
	Parameters: 0
	Flags: None
*/
function function_467590e0()
{
	/#
		dvar = getdvarstring(#"hash_41f17bf6a4d5df10", "");
		return int(dvar);
	#/
}

/*
	Name: function_bc93e0c7
	Namespace: stealth_debug
	Checksum: 0x2EFEC3B9
	Offset: 0xBE8
	Size: 0x52
	Parameters: 0
	Flags: None
*/
function function_bc93e0c7()
{
	/#
		dvar = getdvarstring(#"hash_5edfe6f0786c6c47", "");
		return int(dvar);
	#/
}

/*
	Name: function_5c17f559
	Namespace: stealth_debug
	Checksum: 0xEA6175D8
	Offset: 0xC48
	Size: 0x52
	Parameters: 0
	Flags: None
*/
function function_5c17f559()
{
	/#
		dvar = getdvarstring(#"hash_6ec105f47827e22a", "");
		return int(dvar);
	#/
}

/*
	Name: function_57295e02
	Namespace: stealth_debug
	Checksum: 0xC279354E
	Offset: 0xCA8
	Size: 0x52
	Parameters: 0
	Flags: None
*/
function function_57295e02()
{
	/#
		dvar = getdvarstring(#"hash_85ac7cbf1863d36", "");
		return int(dvar);
	#/
}

/*
	Name: function_9570f40e
	Namespace: stealth_debug
	Checksum: 0x3B77FB39
	Offset: 0xD08
	Size: 0x52
	Parameters: 0
	Flags: None
*/
function function_9570f40e()
{
	/#
		dvar = getdvarstring(#"hash_7a5dba75329d3032", "");
		return int(dvar);
	#/
}

/*
	Name: function_ce9fa82d
	Namespace: stealth_debug
	Checksum: 0xEDF3BADB
	Offset: 0xD68
	Size: 0x32
	Parameters: 0
	Flags: None
*/
function function_ce9fa82d()
{
	/#
		return getdvarstring(#"hash_7f779674ec8b206d", "");
	#/
}

/*
	Name: function_27daaa5f
	Namespace: stealth_debug
	Checksum: 0x93B6B0BF
	Offset: 0xDA8
	Size: 0x9C
	Parameters: 3
	Flags: None
*/
function function_27daaa5f(start, end, color)
{
	/#
		num = 3;
		for(i = 0; i < num; i++)
		{
			start = start + (0, 0, num * 0.05);
			end = end + (0, 0, num * 0.05);
			line(start, end, color);
		}
	#/
}

/*
	Name: function_13f746ef
	Namespace: stealth_debug
	Checksum: 0x9CAC5A48
	Offset: 0xE50
	Size: 0xC4
	Parameters: 4
	Flags: None
*/
function function_13f746ef(start, end, radius, color)
{
	/#
		num = 3;
		for(i = 0; i < num; i++)
		{
			start = start + (0, 0, num * 0.05);
			end = end + (0, 0, num * 0.05);
			util::drawcylinder(start, radius, abs(end[2] - start[2]), 1, undefined, color);
		}
	#/
}

/*
	Name: function_a8d5dec6
	Namespace: stealth_debug
	Checksum: 0x3DD24649
	Offset: 0xF20
	Size: 0x184
	Parameters: 1
	Flags: None
*/
function function_a8d5dec6(msg)
{
	/#
		if(!level flag::get(""))
		{
			return;
		}
		type = undefined;
		name = undefined;
		if(isdefined(self.script_noteworthy))
		{
			type = "";
			name = self.script_noteworthy;
		}
		else if(isdefined(self.targetname))
		{
			type = "";
			name = self.targetname;
		}
		actor = (((("" + self getentitynumber()) + "") + self.unique_id) + "") + self.export;
		if(isdefined(type))
		{
			actor = actor + ((("" + type) + "") + name);
		}
		txt = (("" + actor) + "") + msg;
		println(txt);
		if(getdvarint(#"hash_24e197c870156a5d", 0) == 1)
		{
			self thread function_bd9767df(msg);
		}
	#/
}

/*
	Name: function_84811192
	Namespace: stealth_debug
	Checksum: 0xA3B78146
	Offset: 0x10B0
	Size: 0x14E
	Parameters: 2
	Flags: None
*/
function function_84811192(type, msg)
{
	/#
		if(!isdefined(level.stealth.debug.screen[type]))
		{
			level.stealth.debug.screen[type] = 0;
		}
		x = 10;
		if(type == "")
		{
			y = 50;
		}
		else
		{
			if(type == "")
			{
				y = 150;
			}
			else
			{
				if(type == "")
				{
					y = 250;
				}
				else
				{
					y = 350;
				}
			}
		}
		y = y + (level.stealth.debug.screen[type] * 15);
		debug2dtext((x, y, 0), msg, (1, 1, 1), 1.25);
		level.stealth.debug.screen[type]++;
	#/
}

/*
	Name: function_ea707af9
	Namespace: stealth_debug
	Checksum: 0xB31B7898
	Offset: 0x1208
	Size: 0x30
	Parameters: 1
	Flags: None
*/
function function_ea707af9(type)
{
	/#
		level.stealth.debug.screen[type] = 0;
	#/
}

/*
	Name: function_bf41d34b
	Namespace: stealth_debug
	Checksum: 0xEA239E25
	Offset: 0x1240
	Size: 0x124
	Parameters: 2
	Flags: None
*/
function function_bf41d34b(points, endonevent)
{
	/#
		if(!debug_enabled())
		{
			return;
		}
		self endon(#"death");
		self endon(endonevent);
		while(true)
		{
			foreach(point in points)
			{
				if(isdefined(point.used_time))
				{
					print3d(point.origin, "" + point.used_time);
					line(point.origin, self.origin);
				}
			}
			wait(0.05);
		}
	#/
}

/*
	Name: function_690312e5
	Namespace: stealth_debug
	Checksum: 0x179C4481
	Offset: 0x1370
	Size: 0x1A0
	Parameters: 1
	Flags: None
*/
function function_690312e5(type)
{
	/#
		if(!debug_enabled())
		{
			return;
		}
		self endon(#"death");
		self notify(#"hash_4a838a1d085f0c60");
		self endon(#"hash_4a838a1d085f0c60");
		color = (0.2, 1, 0.2);
		msg = "";
		if(type == "")
		{
			color = (1, 1, 0);
			msg = "";
		}
		else
		{
			if(type == "")
			{
				color = (1, 0.5, 0.25);
				msg = "";
			}
			else
			{
				if(type == "")
				{
					color = (1, 0, 0);
					msg = "";
				}
				else if(type == "")
				{
					color = (1, 0, 0);
					msg = "";
				}
			}
		}
		timer = gettime() + 5000;
		while(gettime() < timer)
		{
			wait(0.05);
			print3d(self.origin + vectorscale((0, 0, 1), 72), msg, color, 1, 3);
		}
	#/
}

/*
	Name: function_7a968b6a
	Namespace: stealth_debug
	Checksum: 0x80489D06
	Offset: 0x1518
	Size: 0x5C
	Parameters: 4
	Flags: None
*/
function function_7a968b6a(msg, offset, scale, color)
{
	/#
		if(!isdefined(color))
		{
			color = (1, 1, 1);
		}
		function_314b7255(msg, color, 1, scale, offset);
	#/
}

/*
	Name: function_314b7255
	Namespace: stealth_debug
	Checksum: 0x8424BF0E
	Offset: 0x1580
	Size: 0x4B0
	Parameters: 6
	Flags: None
*/
function function_314b7255(text, color, alpha, scale, offset, life)
{
	/#
		if(!debug_enabled())
		{
			return;
		}
		if(!isdefined(text))
		{
			return;
		}
		if(!isdefined(offset))
		{
			offset = vectorscale((0, 0, 1), 92);
		}
		if(!isdefined(scale))
		{
			scale = 0.5;
		}
		if(!isdefined(life))
		{
			life = 3;
		}
		spacing = 10 * scale;
		riserate = 0;
		start = gettime();
		if(!isdefined(self.stealth.debug_rising))
		{
			self.stealth.debug_rising = [];
			self.stealth.debug_rising_idx = -1;
		}
		self.stealth.debug_rising_idx++;
		myid = self.stealth.debug_rising_idx;
		self.stealth.debug_rising[myid] = offset;
		previd = myid - 1;
		while(isdefined(self.stealth.debug_rising[previd]))
		{
			delta = self.stealth.debug_rising[previd][2] - (self.stealth.debug_rising[previd + 1][2]);
			if(delta >= spacing)
			{
				break;
			}
			self.stealth.debug_rising[previd] = (self.stealth.debug_rising[previd][0], self.stealth.debug_rising[previd][1], ((self.stealth.debug_rising[previd + 1][2]) + spacing) + delta);
			previd = previd - 1;
		}
		draworigin = self.stealth.debug_rising[myid];
		while(gettime() - start < life * 1000)
		{
			wait(0.05);
			if(isdefined(self) && isalive(self) && isdefined(self.stealth) && isdefined(self.stealth.debug_rising) && isdefined(self.stealth.debug_rising[myid]))
			{
				draworigin = self.origin + self.stealth.debug_rising[myid];
			}
			print3d(draworigin, text, color, alpha, scale, 1);
			draworigin = (draworigin[0], draworigin[1], draworigin[2] + riserate);
			if(isdefined(self) && isalive(self) && isdefined(self.stealth) && isdefined(self.stealth.debug_rising) && isdefined(self.stealth.debug_rising[myid]))
			{
				self.stealth.debug_rising[myid] = (self.stealth.debug_rising[myid][0], self.stealth.debug_rising[myid][1], self.stealth.debug_rising[myid][2] + riserate);
			}
		}
		if(isdefined(self) && isalive(self) && isdefined(self.stealth) && isdefined(self.stealth.debug_rising) && isdefined(self.stealth.debug_rising[myid]))
		{
			self.stealth.debug_rising[myid] = undefined;
		}
	#/
}

/*
	Name: function_5e5487bf
	Namespace: stealth_debug
	Checksum: 0xC69B1D14
	Offset: 0x1A38
	Size: 0x1E0
	Parameters: 2
	Flags: None
*/
function function_5e5487bf(team, offset)
{
	/#
		enemies = getactorteamarray(offset);
		if(offset == "")
		{
			enemies[enemies.size] = getplayers()[0];
		}
		yellow = (1, 1, 0);
		green = (0, 1, 0);
		red = (1, 0, 0);
		foreach(enemy in enemies)
		{
			var_cd8b4d58 = sqr(enemy.maxvisibledist + 200);
			vis_dist = sqr(enemy.maxvisibledist);
			distsqrd = distancesquared(enemy.origin, self.origin);
			if(distsqrd < vis_dist)
			{
				color = red;
			}
			else
			{
				if(distsqrd < var_cd8b4d58)
				{
					color = yellow;
				}
				else
				{
					color = green;
				}
			}
			line(self.origin, enemy.origin, color);
		}
	#/
}

/*
	Name: function_d0c3b413
	Namespace: stealth_debug
	Checksum: 0x492664AA
	Offset: 0x1C20
	Size: 0x65C
	Parameters: 0
	Flags: None
*/
function function_d0c3b413()
{
	/#
		space = 10;
		count = 0;
		size = 0.5;
		white = (1, 1, 1);
		red = (1, 0, 0);
		yellow = (1, 1, 0);
		if(function_467590e0())
		{
			self draw_fov();
		}
		var_a6b57aa4 = "";
		var_49cc65bc = self namespace_979752dc::get_patrol_style();
		if(isdefined(var_49cc65bc))
		{
			var_a6b57aa4 = var_49cc65bc;
		}
		if(self ai::has_behavior_attribute(""))
		{
			var_a6b57aa4 = self ai::get_behavior_attribute("");
		}
		var_b2d4b874 = "";
		var_4fa3c3e0 = "";
		var_5ccca8b0 = 0;
		groupdata = stealth_group::getgroup(self.script_stealthgroup);
		pod = stealth_group::group_findpod(groupdata, self);
		if(isdefined(self.stealth.bsmstate))
		{
			switch(self.stealth.bsmstate)
			{
				case 0:
				{
					var_b2d4b874 = "";
					break;
				}
				case 1:
				{
					var_b2d4b874 = "";
					if(isdefined(level.stealth.investigate_volumes[self.script_stealthgroup]))
					{
						var_5ccca8b0 = 1;
					}
					break;
				}
				case 2:
				{
					var_b2d4b874 = "";
					if(isdefined(level.stealth.hunt_volumes[self.script_stealthgroup]))
					{
						var_5ccca8b0 = 1;
					}
					if(!is_true(pod.bhunkering))
					{
						var_4fa3c3e0 = "";
					}
					else
					{
						var_4fa3c3e0 = "";
					}
					break;
				}
				case 3:
				{
					var_b2d4b874 = "";
					if(isdefined(level.stealth.combat_volumes[self.script_stealthgroup]))
					{
						var_5ccca8b0 = 1;
					}
					break;
				}
			}
		}
		print3d(self.origin - (0, 0, count * space), ((self getentitynumber() + "") + var_b2d4b874) + var_4fa3c3e0, white, 1, size);
		count++;
		print3d(self.origin - (0, 0, count * space), "" + var_a6b57aa4, white, 1, size);
		count++;
		var_6a0e4d9a = "";
		if(isdefined(self.enemy))
		{
			var_6a0e4d9a = var_6a0e4d9a + (("" + self.enemy getentitynumber()) + "");
		}
		if(var_5ccca8b0)
		{
			var_6a0e4d9a = var_6a0e4d9a + "";
		}
		if(var_6a0e4d9a.size > 0)
		{
			print3d(self.origin - (0, 0, count * space), var_6a0e4d9a, yellow, 1, size);
			count++;
		}
		if(isdefined(self.lightmeter))
		{
			print3d(self.origin - (0, 0, count * space), "" + self.lightmeter, red, 1, size);
			count++;
		}
		group = "";
		if(isdefined(self.script_stealthgroup))
		{
			group = ("" + self.script_stealthgroup) + "";
		}
		if(group.size > 0)
		{
			print3d(self.origin - (0, 0, count * space), group, white, 1, size);
			count++;
		}
		if(getplayers().size > 0 && self cansee(getplayers()[0]))
		{
			print3d(self.origin - (0, 0, count * space), "", red, 1, size);
			count++;
		}
		if(isdefined(self.shootposoverride))
		{
			line(self geteye(), self.shootposoverride, (1, 1, 0));
		}
		var_9c9fde23 = self.origin + vectorscale((0, 0, 1), 8);
		var_8f5850f9 = (self.origin + vectorscale((0, 0, 1), 8)) + (anglestoforward(self.angles) * 36);
		line(var_9c9fde23, var_8f5850f9, (0, 0, 1));
	#/
}

/*
	Name: function_3e6e06ae
	Namespace: stealth_debug
	Checksum: 0x191D2A50
	Offset: 0x2288
	Size: 0xAC
	Parameters: 3
	Flags: None
*/
function function_3e6e06ae(baseangles, angle, var_875fcd86)
{
	/#
		if(var_875fcd86 == 0)
		{
			return anglestoforward(baseangles + (angle, 0, 0));
		}
		if(var_875fcd86 == 1)
		{
			return anglestoforward(baseangles + (0, angle, 0));
		}
		if(var_875fcd86 == 2)
		{
			return anglestoforward(baseangles + (0, 0, angle));
		}
	#/
}

/*
	Name: function_391d248f
	Namespace: stealth_debug
	Checksum: 0xEFED9505
	Offset: 0x2340
	Size: 0x16C
	Parameters: 8
	Flags: None
*/
function function_391d248f(origin, startangle, endangle, baseangles, len, var_875fcd86, var_6246c419, color)
{
	/#
		/#
			assert(startangle < endangle);
		#/
		var_4b9eed7f = origin + (len * function_3e6e06ae(baseangles, startangle, var_875fcd86));
		var_ae402dfe = var_4b9eed7f;
		line(origin, var_4b9eed7f, color);
		angledelta = (endangle - startangle) / var_6246c419;
		for(i = 1; i < var_6246c419 + 1; i++)
		{
			angle = startangle + (angledelta * i);
			var_ae402dfe = origin + (len * function_3e6e06ae(baseangles, angle, var_875fcd86));
			line(var_4b9eed7f, var_ae402dfe, color);
			var_4b9eed7f = var_ae402dfe;
		}
		line(origin, var_ae402dfe, color);
	#/
}

/*
	Name: draw_fov
	Namespace: stealth_debug
	Checksum: 0xF9C2AE01
	Offset: 0x24B8
	Size: 0x38C
	Parameters: 0
	Flags: None
*/
function draw_fov()
{
	/#
		dot = self.fovcosine;
		if(isdefined(self.enemy))
		{
			dot = self.fovcosinebusy;
		}
		color = (1, 0, 0);
		var_7f663bfb = acos(dot);
		if(isai(self))
		{
			var_62729df5 = self gettagangles("")[1];
		}
		else
		{
			var_62729df5 = self gettagangles("")[1];
		}
		viewdist = getplayers()[0].maxvisibledist;
		if(isai(self))
		{
			start = self gettagorigin("");
		}
		else
		{
			start = self gettagorigin("");
		}
		var_16d2c066 = 10;
		function_391d248f(start, -1 * var_7f663bfb, var_7f663bfb, (0, var_62729df5, 0), viewdist, 1, var_16d2c066, color);
		if(self.fovcosinez > dot)
		{
			color = color * 0.5;
			var_3deb2d7d = acos(self.fovcosinez);
			var_8b97ee98 = 0;
			function_391d248f(start, -1 * var_3deb2d7d, var_3deb2d7d, (var_8b97ee98, var_62729df5, 0), viewdist, 0, var_16d2c066, color);
		}
		var_346c7ea3 = acos(self.fovcosineperiph);
		function_391d248f(start, -1 * var_346c7ea3, var_346c7ea3, (0, var_62729df5, 0), sqrt(self.fovcosineperiphmaxdistsq), 1, var_16d2c066, vectorscale((1, 1, 0), 0.5));
		if(is_true(self.flashlight.on))
		{
			start = self gettagorigin(self.flashlight.tag);
			yaw = self gettagangles(self.flashlight.tag)[1];
			if(isdefined(start) && isdefined(yaw))
			{
				var_7f663bfb = 30 * 0.5;
				function_391d248f(start, -1 * var_7f663bfb, var_7f663bfb, (0, yaw, 0), (isdefined(self.var_1c936867) ? self.var_1c936867 : 850), 1, var_16d2c066, (1, 1, 0));
			}
		}
	#/
}

/*
	Name: function_48f1fd1c
	Namespace: stealth_debug
	Checksum: 0x41804C42
	Offset: 0x2850
	Size: 0x34C
	Parameters: 0
	Flags: None
*/
function function_48f1fd1c()
{
	/#
		tab = "";
		function_84811192("", ("" + self getentitynumber()) + "");
		function_84811192("", "" + self.script_stealthgroup);
		function_84811192("", "" + self.alertlevel);
		function_84811192("", "" + self.stealth.state);
		if(isdefined(self.enemy))
		{
			enemy = self.enemy getentitynumber();
		}
		else
		{
			enemy = "";
		}
		function_84811192("", "" + enemy);
		function_84811192("", "" + self.stealth.ai_event);
		if(self.team == "")
		{
			team = "";
		}
		else
		{
			team = "";
		}
		enemies = getactorteamarray(team);
		if(team == "")
		{
			enemies[enemies.size] = getplayers()[0];
		}
		foreach(enemy in enemies)
		{
			if(!isdefined(enemy.stealth))
			{
				continue;
			}
			if(!isdefined(enemy.stealth.spotted_list))
			{
				continue;
			}
			if(isdefined(enemy.stealth.spotted_list[self.unique_id]))
			{
				function_84811192("", tab + "");
				msg = ((tab + "") + enemy getentitynumber() + "") + enemy.stealth.spotted_list[self.unique_id];
				function_84811192("", msg);
			}
		}
		function_ea707af9("");
	#/
}

/*
	Name: function_f5dd6400
	Namespace: stealth_debug
	Checksum: 0x819CB48F
	Offset: 0x2BA8
	Size: 0x304
	Parameters: 0
	Flags: None
*/
function function_f5dd6400()
{
	/#
		var_9d1f58f3 = 30000;
		level.stealth.var_8f448777 = [];
		level.stealth.var_855b67ea = 0;
		level.stealth.var_42d9f5df = 0;
		var_b5a9b1ac = 50;
		var_c6f9544b = 340;
		var_1dccd487 = 17;
		var_4c0b606b = 1;
		textcolor = (1, 1, 1);
		var_1caac9f9 = level.stealth;
		while(true)
		{
			if(function_bc93e0c7())
			{
				var_12febe81 = gettime() - var_9d1f58f3;
				if(var_1caac9f9.var_42d9f5df > 0)
				{
					cury = var_c6f9544b;
					var_fe8e6e30 = var_1caac9f9.var_855b67ea;
					for(var_1ea0399e = 0; var_1ea0399e < var_1caac9f9.var_42d9f5df; var_1ea0399e++)
					{
						if(!isdefined(var_1caac9f9.var_8f448777[var_fe8e6e30]) || var_1caac9f9.var_8f448777[var_fe8e6e30].time > var_12febe81)
						{
							text = "";
							if(isstring(var_1caac9f9.var_8f448777[var_fe8e6e30].speaker))
							{
								text = text + var_1caac9f9.var_8f448777[var_fe8e6e30].speaker;
							}
							else
							{
								foreach(speaker in var_1caac9f9.var_8f448777[var_fe8e6e30].speaker)
								{
									if(isdefined(speaker))
									{
										text = text + ("" + speaker getentitynumber());
									}
								}
								var_1caac9f9.var_8f448777[var_fe8e6e30].speaker = text;
							}
							text = text + ("" + var_1caac9f9.var_8f448777[var_fe8e6e30].text);
							debug2dtext((var_b5a9b1ac, cury, 0), text, textcolor, 1, undefined, undefined, var_4c0b606b);
							cury = cury + var_1dccd487;
						}
						var_fe8e6e30 = (var_fe8e6e30 + 1) % 16;
					}
				}
			}
			waitframe(1);
		}
	#/
}

/*
	Name: function_65b21ab8
	Namespace: stealth_debug
	Checksum: 0xD8E80E76
	Offset: 0x2EB8
	Size: 0x1E4
	Parameters: 2
	Flags: None
*/
function function_65b21ab8(speaker, line)
{
	/#
		stealth = level.stealth;
		var_e4b759ea = (stealth.var_855b67ea + stealth.var_42d9f5df) % 16;
		curtime = gettime();
		var_e4434c3b = var_e4b759ea - 1;
		if(var_e4434c3b < 0)
		{
			var_e4434c3b = 16 - 1;
		}
		if(isdefined(stealth.var_8f448777[var_e4434c3b]) && stealth.var_8f448777[var_e4434c3b].time == curtime && stealth.var_8f448777[var_e4434c3b].text == line)
		{
			stealth.var_8f448777[var_e4434c3b].speaker[stealth.var_8f448777[var_e4434c3b].speaker.size] = speaker;
			return;
		}
		s = spawnstruct();
		s.speaker = [0:speaker];
		s.text = line;
		s.time = curtime;
		stealth.var_8f448777[var_e4b759ea] = s;
		if(var_e4b759ea == stealth.var_855b67ea && stealth.var_42d9f5df > 0)
		{
			stealth.var_855b67ea = (stealth.var_855b67ea + 1) % 16;
		}
		else
		{
			stealth.var_42d9f5df++;
		}
		/#
			assert(stealth.var_42d9f5df <= 16);
		#/
	#/
}

/*
	Name: function_bd9767df
	Namespace: stealth_debug
	Checksum: 0x2DA5A96
	Offset: 0x30A8
	Size: 0xDC
	Parameters: 2
	Flags: None
*/
function function_bd9767df(message, duration)
{
	/#
		self notify(#"hash_60765f522d73ffeb");
		self endon(#"hash_60765f522d73ffeb");
		self endon(#"death");
		if(!isdefined(duration))
		{
			duration = 5;
		}
		for(time = 0; time < duration * 20; time++)
		{
			print3d(self.origin + vectorscale((0, 0, 1), 45), message, (0.48, 9.4, 0.76), 0.85);
			wait(0.05);
		}
	#/
}

/*
	Name: draw_axis
	Namespace: stealth_debug
	Checksum: 0x633BDD7A
	Offset: 0x3190
	Size: 0x104
	Parameters: 3
	Flags: None
*/
function draw_axis(origin, angles, length)
{
	/#
		var_413e029e = anglestoaxis(angles);
		forward = var_413e029e.forward * length;
		right = var_413e029e.right * length;
		up = var_413e029e.up * length;
		line(origin - forward, origin + forward, (1, 0, 0), 1);
		line(origin - up, origin + up, (0, 1, 0), 1);
		line(origin - right, origin + right, (0, 0, 1), 1);
	#/
}

/*
	Name: function_613009e2
	Namespace: stealth_debug
	Checksum: 0x5CD9C422
	Offset: 0x32A0
	Size: 0x3E8
	Parameters: 0
	Flags: None
*/
function function_613009e2()
{
	/#
		if(!isdefined(level.smartobjectpoints))
		{
			return;
		}
		var_cfd8b974 = function_5c17f559();
		if(var_cfd8b974 == 0)
		{
			return;
		}
		colorgreen = (0.5, 0.7, 0.5);
		colorred = (0.7, 0.1, 0.1);
		var_4de0746b = vectorscale((1, 1, 1), 0.7);
		foreach(obj in level.smartobjectpoints)
		{
			angles = (0, 0, 0);
			if(isdefined(obj.angles))
			{
				angles = obj.angles;
			}
			canuse = smart_object::can_use(obj);
			claimed = isdefined(obj.claimer);
			color = var_4de0746b;
			if(claimed)
			{
				color = colorgreen;
			}
			else if(!canuse)
			{
				color = colorred;
			}
			draw_axis(obj.origin, angles, 12);
			print3d(obj.origin - vectorscale((0, 0, 1), 12), function_9e72a96(obj.scriptbundlename), color, 1, 0.3, 1);
			if(!canuse)
			{
				print3d(obj.origin - vectorscale((0, 0, 1), 20), "" + (obj.nextusetime - gettime()), color, 1, 0.3, 1);
			}
			print3d(obj.origin - vectorscale((0, 0, 1), 28), "" + obj.var_dd0284ce, color, 1, 0.3, 1);
			if(isdefined(obj.var_2edb5d76) && canuse)
			{
				r = sqrt(obj.var_2edb5d76);
				function_391d248f(obj.origin, 0, 360, angles, r, 1, 8, color);
			}
			if(claimed)
			{
				print3d(obj.origin - vectorscale((0, 0, 1), 18), "" + obj.claimer getentitynumber(), color, 1, 0.3, 1);
				line(obj.origin, obj.claimer.origin, color, 1, 0, 1);
			}
		}
	#/
}

/*
	Name: function_6a467cff
	Namespace: stealth_debug
	Checksum: 0xA11107C
	Offset: 0x3690
	Size: 0x3EC
	Parameters: 0
	Flags: None
*/
function function_6a467cff()
{
	/#
		var_331da3eb = function_57295e02();
		if(var_331da3eb == 0)
		{
			return;
		}
		if(!isdefined(level.stealth.hunt_stealth_group_region_sets))
		{
			return;
		}
		var_f10172cb = function_ce9fa82d();
		foreach(var_462028a0 in level.stealth.hunt_stealth_group_region_sets)
		{
			if(var_f10172cb != group && var_f10172cb != "")
			{
				continue;
			}
			foreach(region in var_462028a0.hunt_regions)
			{
				for(i = 1; i < region.route_points.size; i++)
				{
					p0 = region.route_points[i - 1];
					p1 = region.route_points[i];
					line(p0.origin, p1.origin, vectorscale((0, 1, 0), 0.7), 1, 0, 1);
				}
				foreach(smart_object in region.smart_objects)
				{
					function_391d248f(smart_object.origin, 0, 360, smart_object.angles, 10, 1, 3, vectorscale((1, 0, 0), 0.7));
				}
				foreach(point in region.transition_points)
				{
					foreach(transition_point in point.transitions)
					{
						line(point.origin, transition_point.origin, vectorscale((1, 1, 0), 0.7), 1, 0, 1);
					}
				}
			}
		}
	#/
}

/*
	Name: function_5a47b49c
	Namespace: stealth_debug
	Checksum: 0x594C7910
	Offset: 0x3A88
	Size: 0x500
	Parameters: 0
	Flags: None
*/
function function_5a47b49c()
{
	/#
		var_191afba9 = function_9570f40e();
		if(var_191afba9 == 0)
		{
			return;
		}
		if(!isdefined(level.stealth.hunt_stealth_group_region_sets))
		{
			return;
		}
		var_f10172cb = function_ce9fa82d();
		foreach(var_462028a0 in level.stealth.hunt_stealth_group_region_sets)
		{
			if(var_f10172cb != group && var_f10172cb != "")
			{
				continue;
			}
			var_7010df74 = [];
			foreach(region in var_462028a0.hunt_regions)
			{
				/#
					assert(isdefined(region.approx_location));
				#/
				space = 10;
				count = 0;
				size = 0.5;
				white = (1, 1, 1);
				print3d(region.approx_location - (0, 0, count * space), "" + region.index, white, 1, size);
				count++;
				print3d(region.approx_location - (0, 0, count * space), "" + region.bfs_score, white, 1, size);
				count++;
				print3d(region.approx_location - (0, 0, count * space), "" + region.shared_data.bfs_assigned, white, 1, size);
				count++;
				print3d(region.approx_location - (0, 0, count * space), "" + region.shared_data.in_region, white, 1, size);
				count++;
				print3d(region.approx_location - (0, 0, count * space), "" + region.stealth_group, white, 1, size);
				var_fa6f8c7e = region.shared_data.bfs_cooldown - gettime();
				if(var_fa6f8c7e > 0)
				{
					count++;
					print3d(region.approx_location - (0, 0, count * space), "" + var_fa6f8c7e, white, 1, size);
				}
			}
			foreach(region in var_462028a0.hunt_regions)
			{
				foreach(link in region.region_links)
				{
					var_35b60bb6 = link.region;
					line(region.approx_location, var_35b60bb6.approx_location, vectorscale((0, 0, 1), 0.7), 1, 0, 1);
				}
			}
		}
	#/
}

