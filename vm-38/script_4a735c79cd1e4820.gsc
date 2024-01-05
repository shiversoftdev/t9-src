#using scripts\cp_common\util.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace namespace_845d1a97;

/*
	Name: function_bdb085de
	Namespace: namespace_845d1a97
	Checksum: 0xA356FDF3
	Offset: 0x88
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_bdb085de()
{
	level notify(395732500);
}

/*
	Name: __init__
	Namespace: namespace_845d1a97
	Checksum: 0x7E99FBA3
	Offset: 0xA8
	Size: 0x5C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__()
{
	/#
		function_5ac4dc99("", 0);
		function_5ac4dc99("", 0);
		function_5ac4dc99("", -1);
	#/
}

/*
	Name: function_80d28d77
	Namespace: namespace_845d1a97
	Checksum: 0x618BD06C
	Offset: 0x110
	Size: 0x696
	Parameters: 16
	Flags: None
*/
function function_80d28d77(localclientnum, var_7b70989a, var_4b30f907, var_9cb23c3, endnotify, tracenormal, tracedist, var_b6a0baae, culldist, var_1d1675b, var_d500b38d, var_d06c0cef, var_434f3a56, var_740a6a07, var_17e9e56c, var_40f7123c)
{
	self endon(#"death", #"hash_63c6fa848f448e22");
	if(isdefined(endnotify))
	{
		self endon(endnotify);
	}
	if(!isdefined(tracedist))
	{
		tracedist = 500;
	}
	if(!isdefined(tracenormal))
	{
		tracenormal = (0, 0, -1);
	}
	else
	{
		tracenormal = vectornormalize(tracenormal);
	}
	var_1daf2286 = tracenormal * tracedist;
	if(!isdefined(var_b6a0baae))
	{
		if(isdefined(self.vehicletype))
		{
			var_b6a0baae = 0.8660254;
		}
		else
		{
			var_b6a0baae = 0.5;
		}
	}
	else
	{
		var_b6a0baae = cos(var_b6a0baae);
	}
	if(!isdefined(culldist))
	{
		culldist = 1000;
	}
	if(!isdefined(var_1d1675b))
	{
		var_1d1675b = 1;
	}
	if(!isdefined(var_d500b38d))
	{
		var_d500b38d = 1;
	}
	if(!isdefined(var_d06c0cef))
	{
		var_d06c0cef = -1;
	}
	if(!isdefined(var_434f3a56))
	{
		var_434f3a56 = 1;
	}
	if(!isdefined(var_740a6a07))
	{
		var_740a6a07 = -1;
	}
	if(!isdefined(var_17e9e56c))
	{
		var_17e9e56c = 1;
	}
	if(!isdefined(var_40f7123c))
	{
		var_40f7123c = -1;
	}
	/#
		assert(var_4b30f907 > 0);
	#/
	wait_time = 1 / var_4b30f907;
	var_70bdcaa = int(max(0.016 / wait_time, 1));
	wait_time = 0.016 * (int(max(wait_time / 0.016, 1)));
	while(true)
	{
		/#
			if((getdvarfloat(#"hash_366b9410b5385383", -1)) >= 0)
			{
				culldist = getdvarfloat(#"hash_366b9410b5385383", -1);
			}
		#/
		playereyepos = getlocalclienteyepos(localclientnum);
		playerangles = getlocalclientangles(localclientnum);
		playerorigin = getlocalclientpos(localclientnum);
		playerfov = getlocalclientfov(localclientnum);
		var_c760e88e = playerfov * 0.5;
		bounds = function_c440d28e(self.model);
		var_a6448197 = self function_4b2f0374(playereyepos, playerangles, var_c760e88e, culldist);
		if(var_a6448197)
		{
			for(i = 0; i < var_70bdcaa; i++)
			{
				randx = randomfloatrange(var_d06c0cef, var_d500b38d);
				randy = randomfloatrange(var_740a6a07, var_434f3a56);
				var_d13bdc2a = randomfloatrange(var_40f7123c, var_17e9e56c);
				point = self getpointinbounds(randx, randy, var_d13bdc2a);
				start = point - var_1daf2286;
				end = point + var_1daf2286;
				trace = bullettrace(start, end, 1, undefined);
				/#
					var_9207bc91 = (1, 0, 0);
				#/
				if(trace[#"entity"] === self)
				{
					dot = vectordot(tracenormal, trace[#"normal"]) * -1;
					if(dot >= var_b6a0baae)
					{
						if(isarray(var_7b70989a))
						{
							fx = var_7b70989a[randomintrange(0, var_7b70989a.size)];
						}
						else
						{
							fx = var_7b70989a;
						}
						self thread function_7355defa(localclientnum, fx, var_9cb23c3, trace[#"position"], trace[#"normal"], var_1d1675b);
						/#
							var_9207bc91 = (0, 1, 1);
						#/
					}
				}
				/#
					if(getdvarint(#"hash_8d6bf09ce80eeff", 0))
					{
						line(start, trace[#"position"], var_9207bc91, 1, 1, 60);
					}
				#/
			}
		}
		/#
			if(getdvarint(#"hash_22fbca6d98944c80", 0))
			{
				function_f63efb32(var_d500b38d, var_d06c0cef, var_434f3a56, var_740a6a07, var_17e9e56c, var_40f7123c);
			}
		#/
		wait(wait_time);
	}
}

/*
	Name: function_adb04672
	Namespace: namespace_845d1a97
	Checksum: 0x104A2925
	Offset: 0x7B0
	Size: 0x16
	Parameters: 0
	Flags: None
*/
function function_adb04672()
{
	self notify(#"hash_63c6fa848f448e22");
}

/*
	Name: function_7355defa
	Namespace: namespace_845d1a97
	Checksum: 0xF02BA0F4
	Offset: 0x7D0
	Size: 0x11C
	Parameters: 6
	Flags: Private
*/
function private function_7355defa(localclientnum, var_7b70989a, var_9cb23c3, var_c5e0ca9e, hitnormal, var_1d1675b)
{
	if(!isdefined(self))
	{
		return;
	}
	if(!is_true(var_1d1675b))
	{
		playfx(localclientnum, var_7b70989a, var_c5e0ca9e, hitnormal);
		return;
	}
	impact = util::spawn_model(localclientnum, "tag_origin", var_c5e0ca9e, vectortoangles(hitnormal));
	if(!isdefined(impact))
	{
		return;
	}
	impact linkto(self);
	waitframe(1);
	util::playfxontag(localclientnum, var_7b70989a, impact, "tag_origin");
	wait(var_9cb23c3);
	impact delete();
}

/*
	Name: function_f63efb32
	Namespace: namespace_845d1a97
	Checksum: 0xFC849F6A
	Offset: 0x8F8
	Size: 0x19C
	Parameters: 6
	Flags: Private
*/
function private function_f63efb32(var_d500b38d, var_d06c0cef, var_434f3a56, var_740a6a07, var_17e9e56c, var_40f7123c)
{
	/#
		bounds = function_c440d28e(self.model);
		box(self.origin, bounds.mins, bounds.maxs, absangleclamp360(self.angles[1]), vectorscale((0, 1, 0), 0.25), 1, 1, 1);
		var_4fe68d11 = bounds.maxs - bounds.mins;
		halfsize = var_4fe68d11 * 0.5;
		midpoint = bounds.mins + halfsize;
		var_276e4d7e = midpoint + (halfsize * (var_d06c0cef, var_740a6a07, var_40f7123c));
		var_f106b31 = midpoint + (halfsize * (var_d500b38d, var_434f3a56, var_17e9e56c));
		box(self.origin, var_276e4d7e, var_f106b31, absangleclamp360(self.angles[1]), (0, 1, 0), 1, 1, 1);
	#/
}

