#using scripts\core_common\array_shared.gsc;

#namespace namespace_b637a3ed;

/*
	Name: function_5cb89c64
	Namespace: namespace_b637a3ed
	Checksum: 0x9B73C5A3
	Offset: 0x68
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_5cb89c64()
{
	level notify(412648136);
}

/*
	Name: drop_item
	Namespace: namespace_b637a3ed
	Checksum: 0x16FD67A5
	Offset: 0x88
	Size: 0x210
	Parameters: 7
	Flags: Linked
*/
function drop_item(index, origin, angles, var_98c867cd, random_yaw, origin_offset, var_b3f3cd0d)
{
	if(!isdefined(random_yaw))
	{
		random_yaw = 1;
	}
	if(!isdefined(origin_offset))
	{
		origin_offset = undefined;
	}
	if(!isdefined(var_b3f3cd0d))
	{
		var_b3f3cd0d = undefined;
	}
	min_angle = 0;
	max_angle = 360;
	height = 0;
	var_66694b96 = self function_350c0e2b(index, origin, angles, var_98c867cd);
	self.origin = var_66694b96.start_origin;
	self.angles = var_66694b96.start_angles;
	if(random_yaw)
	{
		yaw = randomint(360);
		self.angles = (var_66694b96.start_angles[0], angleclamp180(var_66694b96.start_angles[1] + yaw), var_66694b96.start_angles[2]);
	}
	if(isdefined(var_b3f3cd0d))
	{
		self.angles = var_b3f3cd0d;
	}
	if(!isdefined(origin_offset))
	{
		origin_offset = (0, 0, 0);
	}
	time = self function_3579cbe7(var_66694b96.start_origin, var_66694b96.start_angles, var_66694b96.end_origin + origin_offset, self.angles);
	/#
		var_ad49c795 = getdvarint(#"hash_730e73fdf6a44e00", 0);
		if(var_ad49c795)
		{
			self thread function_f6480a82(time);
		}
	#/
	return time;
}

/*
	Name: function_350c0e2b
	Namespace: namespace_b637a3ed
	Checksum: 0x9A4E6B79
	Offset: 0x2A0
	Size: 0x1AC
	Parameters: 4
	Flags: Linked
*/
function function_350c0e2b(index, origin, angles, var_98c867cd)
{
	ignore_entity = (isentity(self) ? self : undefined);
	if(var_98c867cd == 3 || var_98c867cd == 4)
	{
		if(index % 2 > 0)
		{
			yaw = -25;
		}
		else
		{
			yaw = 25;
		}
		yaw = yaw + (randomfloatrange(-10, 10));
		dist = (35 + ((index / 2) * 25)) + (randomfloatrange(-5, 5));
		return function_9345a4f7(var_98c867cd, index, origin, angles, undefined, yaw, dist, 1);
	}
	if(var_98c867cd == 2)
	{
		return function_9345a4f7(var_98c867cd, index, origin, angles, ignore_entity, undefined, undefined, 1);
	}
	if(var_98c867cd == 5)
	{
		return function_fb72164f(index, origin, angles, ignore_entity, 1);
	}
	/#
		assert(0);
	#/
}

/*
	Name: function_9345a4f7
	Namespace: namespace_b637a3ed
	Checksum: 0x955955E5
	Offset: 0x458
	Size: 0x99C
	Parameters: 8
	Flags: Linked
*/
function function_9345a4f7(var_98c867cd, index, baseorigin, baseangles, ignoreent, var_8c967549, var_a17c7804, traces)
{
	if(!isdefined(traces))
	{
		traces = 1;
	}
	/#
		assert(!isdefined(ignoreent) || isentity(ignoreent));
	#/
	var_13406a7f = traces;
	var_ad49c795 = getdvarint(#"hash_730e73fdf6a44e00", 0);
	var_5b5e9cdb = 13;
	var_a9c62ebc = 50;
	var_7e266d2a = 40;
	var_b5b1872d = -5;
	var_c2fd0740 = 5;
	var_f4c981a5 = 10;
	var_54ba6233 = 360 / var_5b5e9cdb;
	var_45875de2 = -5;
	var_af26a7db = 5;
	var_d0a44618 = 20;
	var_172c8bf4 = 60;
	var_f3e8e50d = -6;
	var_7def9f0 = 16;
	var_3512e170 = -18;
	var_d0a43e8b = 0;
	if(var_98c867cd == 4)
	{
		var_d0a44618 = 0;
		var_d0a43e8b = 5;
	}
	var_5d9d83c2 = 0;
	ring = int(index / var_5b5e9cdb);
	slot = index - (ring * var_5b5e9cdb);
	yaw = (baseangles[1] + (slot * var_54ba6233) + (ring * var_f4c981a5)) + randomfloatrange(var_45875de2, var_af26a7db);
	dist = (var_a9c62ebc + (ring * var_7e266d2a)) + randomfloatrange(var_b5b1872d, var_c2fd0740);
	if(isdefined(var_8c967549))
	{
		yaw = baseangles[1] + var_8c967549;
	}
	if(isdefined(var_a17c7804))
	{
		dist = var_a17c7804;
	}
	angles = (0, yaw, 0);
	dir = anglestoforward(angles);
	var_118985a1 = baseorigin + (dir * var_d0a43e8b);
	origin = var_118985a1 + (dir * dist);
	var_ef1cacd6 = (dir * -1) * var_3512e170;
	ignoreents = getentitiesinradius(self.origin, 500, 12);
	if(var_13406a7f)
	{
		if(isdefined(ignoreent))
		{
			if(!isdefined(ignoreents))
			{
				ignoreents = [];
			}
			else if(!isarray(ignoreents))
			{
				ignoreents = array(ignoreents);
			}
			ignoreents[ignoreents.size] = ignoreent;
		}
		tracestart = var_118985a1 + (0, 0, var_d0a44618);
		traceend = (origin + (0, 0, var_d0a44618)) + var_ef1cacd6;
		traceresults = physicstraceex(tracestart, traceend, (0, 0, 0), (0, 0, 0), ignoreents, 1);
		/#
			if(var_ad49c795)
			{
				function_7289b47(index, "", tracestart, traceend, traceresults);
			}
		#/
		if(traceresults[#"fraction"] < 1)
		{
			origin = traceresults[#"position"];
			origin = origin + (dir * var_3512e170);
		}
		else
		{
			origin = traceend - var_ef1cacd6;
		}
		tracestart = origin;
		traceend = origin + (0, 0, var_172c8bf4);
		traceresults = physicstraceex(tracestart, traceend, (0, 0, 0), (0, 0, 0), ignoreents, 1);
		/#
			if(var_ad49c795)
			{
				function_7289b47(index, "", tracestart + (0, 1, 0), traceend + (0, 1, 0), traceresults);
			}
		#/
		if(traceresults[#"fraction"] < 1)
		{
			origin = traceresults[#"position"] + (0, 0, var_f3e8e50d);
		}
		else
		{
			origin = traceend;
		}
		tracestart = origin;
		var_c99af8d9 = -1 * getdvarfloat(#"hash_52c51de092ea7057", 2000);
		traceend = origin + (0, 0, var_c99af8d9);
		traceresults = physicstraceex(tracestart, traceend, (0, 0, 0), (0, 0, 0), ignoreents, 1);
		/#
			if(var_ad49c795)
			{
				function_7289b47(index, "", tracestart, traceend, traceresults);
			}
		#/
		if(traceresults[#"fraction"] < 1)
		{
			origin = traceresults[#"position"] + (0, 0, var_7def9f0);
		}
		else
		{
			origin = (0, 0, 0);
			var_5d9d83c2 = 1;
		}
	}
	else
	{
		origin = origin + (0, 0, var_7def9f0);
	}
	if(var_98c867cd == 4)
	{
		start_origin = var_118985a1;
	}
	else
	{
		start_origin = var_118985a1 + vectorscale((0, 0, 1), 40);
	}
	if((isdefined(getgametypesetting(#"hash_69df7093cd32f107")) ? getgametypesetting(#"hash_69df7093cd32f107") : 0))
	{
		var_d69d1a6d = getclosestpointonnavmesh(origin, 48, 6);
		if(isdefined(var_d69d1a6d) && var_13406a7f)
		{
			traceoffset = vectorscale((0, 0, 1), 60);
			traceresults = physicstraceex(var_d69d1a6d + traceoffset, var_d69d1a6d - traceoffset, (0, 0, 0), (0, 0, 0), ignoreents, 1);
			if(traceresults[#"fraction"] < 1)
			{
				origin = traceresults[#"position"] + (0, 0, var_7def9f0);
			}
			else
			{
				origin = var_d69d1a6d + (0, 0, var_7def9f0);
			}
		}
	}
	switch(var_98c867cd)
	{
		case 2:
		{
			offset = getdvarint(#"hash_50b18a791b1b5d34", 0);
			origin = (origin[0], origin[1], origin[2] + offset);
			break;
		}
		case 3:
		{
			offset = getdvarint(#"hash_6e5f4d21ec1124ec", 0);
			origin = (origin[0], origin[1], origin[2] + offset);
			break;
		}
	}
	return {#end_angles:angles, #end_origin:origin, #start_angles:angles, #start_origin:start_origin};
}

/*
	Name: function_fb72164f
	Namespace: namespace_b637a3ed
	Checksum: 0x58F9EFC3
	Offset: 0xE00
	Size: 0x2DC
	Parameters: 5
	Flags: Linked
*/
function function_fb72164f(index, baseorigin, baseangles, ignoreent, traces)
{
	if(!isdefined(traces))
	{
		traces = 1;
	}
	/#
		assert(!isdefined(ignoreent) || isentity(ignoreent));
	#/
	var_ad49c795 = getdvarint(#"hash_730e73fdf6a44e00", 0);
	var_7def9f0 = 16;
	var_5d9d83c2 = 0;
	ignoreents = getentitiesinradius(self.origin, 500, 12);
	if(isdefined(ignoreent))
	{
		if(!isdefined(ignoreents))
		{
			ignoreents = [];
		}
		else if(!isarray(ignoreents))
		{
			ignoreents = array(ignoreents);
		}
		ignoreents[ignoreents.size] = ignoreent;
	}
	origin = baseorigin;
	if(traces)
	{
		var_c99af8d9 = -1 * getdvarfloat(#"hash_52c51de092ea7057", 2000);
		traceend = baseorigin + (0, 0, var_c99af8d9);
		traceresults = physicstraceex(baseorigin, traceend, (0, 0, 0), (0, 0, 0), ignoreents, 1);
		/#
			if(var_ad49c795)
			{
				function_7289b47(index, "", baseorigin, traceend, traceresults);
			}
		#/
		if(traceresults[#"fraction"] < 1)
		{
			origin = traceresults[#"position"] + (0, 0, var_7def9f0);
		}
		else
		{
			origin = (0, 0, 0);
			var_5d9d83c2 = 1;
		}
	}
	start_origin = baseorigin + vectorscale((0, 0, 1), 40);
	return {#end_angles:baseangles, #end_origin:origin, #start_angles:baseangles, #start_origin:start_origin};
}

/*
	Name: function_7289b47
	Namespace: namespace_b637a3ed
	Checksum: 0x7518FAA6
	Offset: 0x10E8
	Size: 0x214
	Parameters: 5
	Flags: None
*/
function function_7289b47(index, name, start, end, traceresults)
{
	/#
		var_e011538a = 2000;
		if(traceresults[#"fraction"] < 1)
		{
			line(start, traceresults[#"position"], (1, 0, 0), 1, 0, var_e011538a);
			debugaxis(traceresults[#"position"], (0, 0, 0), 10, 1, 1, var_e011538a);
			println((("" + start) + "") + traceresults[#"position"]);
			if(isdefined(traceresults[#"entity"]))
			{
				var_1143776a = traceresults[#"entity"];
				println((((((("" + index) + "") + name) + "") + traceresults[#"fraction"]) + "") + var_1143776a.name);
			}
			else
			{
				println((((("" + index) + "") + name) + "") + traceresults[#"fraction"]);
			}
		}
		else
		{
			line(start, end, (1, 1, 1), 1, 0, var_e011538a);
		}
	#/
}

/*
	Name: function_f6480a82
	Namespace: namespace_b637a3ed
	Checksum: 0xCBDE8733
	Offset: 0x1308
	Size: 0xBA
	Parameters: 1
	Flags: None
*/
function function_f6480a82(time)
{
	/#
		var_e011538a = 2000;
		self endon(#"death");
		last_origin = self.origin;
		end_time = gettime() + (int(time * 1000));
		while(gettime() < end_time)
		{
			waitframe(1);
			line(last_origin, self.origin, (0, 1, 0), 1, 1, var_e011538a);
			last_origin = self.origin;
		}
	#/
}

