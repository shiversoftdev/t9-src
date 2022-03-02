#using script_164a456ce05c3483;
#using script_17dcb1172e441bf6;
#using script_1a9763988299e68d;
#using script_1b01e95a6b5270fd;
#using script_1b0b07ff57d1dde3;
#using script_1ee011cd0961afd7;
#using script_2a5bf5b4a00cee0d;
#using script_40f967ad5d18ea74;
#using script_47851dbeea22fe66;
#using script_4d748e58ce25b60c;
#using script_5701633066d199f2;
#using script_5f20d3b434d24884;
#using script_74a56359b7d02ab6;
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

#namespace namespace_1e25ad94;

/*
	Name: init
	Namespace: namespace_1e25ad94
	Checksum: 0xBC8D2C4E
	Offset: 0x118
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function init()
{
	level.doa.var_62f60f27 = [];
	level thread function_99069e31();
}

/*
	Name: debugcircle
	Namespace: namespace_1e25ad94
	Checksum: 0x2B404046
	Offset: 0x150
	Size: 0x94
	Parameters: 4
	Flags: Linked
*/
function debugcircle(origin, radius, seconds, color)
{
	/#
		if(!isdefined(seconds))
		{
			seconds = 1;
		}
		if(!isdefined(color))
		{
			color = (1, 0, 0);
		}
		frames = int(20 * seconds);
		circle(origin, radius, color, 0, 1, frames);
	#/
}

/*
	Name: debugline
	Namespace: namespace_1e25ad94
	Checksum: 0xEA261355
	Offset: 0x1F0
	Size: 0x64
	Parameters: 4
	Flags: Linked
*/
function debugline(p1, p2, seconds, color)
{
	/#
		line(p1, p2, color, 1, 0, int(seconds * 20));
	#/
}

/*
	Name: function_1d1f2c26
	Namespace: namespace_1e25ad94
	Checksum: 0x6585E6C5
	Offset: 0x260
	Size: 0x1AE
	Parameters: 4
	Flags: Linked
*/
function function_1d1f2c26(point, timesec, size, color)
{
	/#
		self endon(#"hash_20de371f231f3e8a");
		end = gettime() + (timesec * 1000);
		halfwidth = int(size / 2);
		l1 = point + (halfwidth * -1, 0, 0);
		l2 = point + (halfwidth, 0, 0);
		var_74d6c120 = point + (0, halfwidth * -1, 0);
		var_be7dd479 = point + (0, halfwidth, 0);
		h1 = point + (0, 0, halfwidth * -1);
		h2 = point + (0, 0, halfwidth);
		while(end > gettime())
		{
			line(l1, l2, color, 1, 0, 1);
			line(var_74d6c120, var_be7dd479, color, 1, 0, 1);
			line(h1, h2, color, 1, 0, 1);
			waitframe(1);
		}
	#/
}

/*
	Name: debugorigin
	Namespace: namespace_1e25ad94
	Checksum: 0x5BFD90FD
	Offset: 0x418
	Size: 0x1C6
	Parameters: 3
	Flags: Linked
*/
function debugorigin(timesec, size, color)
{
	/#
		self endon(#"hash_60eabc6ae83239fe");
		end = gettime() + (timesec * 1000);
		halfwidth = int(size / 2);
		while(isdefined(self) && end > gettime())
		{
			point = self.origin;
			l1 = point + (halfwidth * -1, 0, 0);
			l2 = point + (halfwidth, 0, 0);
			var_74d6c120 = point + (0, halfwidth * -1, 0);
			var_be7dd479 = point + (0, halfwidth, 0);
			h1 = point + (0, 0, halfwidth * -1);
			h2 = point + (0, 0, halfwidth);
			line(l1, l2, color, 1, 0, 1);
			line(var_74d6c120, var_be7dd479, color, 1, 0, 1);
			line(h1, h2, color, 1, 0, 1);
			waitframe(1);
		}
	#/
}

/*
	Name: debugmsg
	Namespace: namespace_1e25ad94
	Checksum: 0x80F79DBD
	Offset: 0x5E8
	Size: 0xC8
	Parameters: 2
	Flags: Linked
*/
function debugmsg(txt, critical)
{
	if(!isdefined(critical))
	{
		critical = 0;
	}
	/#
		if(critical == 0)
		{
			println("" + txt);
		}
		else
		{
			text = (("" + gettime()) + "") + txt;
			println("" + text);
			level.doa.var_62f60f27[level.doa.var_62f60f27.size] = text;
		}
	#/
}

/*
	Name: function_75ebaff2
	Namespace: namespace_1e25ad94
	Checksum: 0x3805A361
	Offset: 0x6B8
	Size: 0x9E
	Parameters: 3
	Flags: None
*/
function function_75ebaff2(txt, timesec, entity)
{
	/#
		end = gettime() + (timesec * 1000);
		origin = namespace_7f5aeb59::function_23e1f90f()[0].origin;
		while(end > gettime())
		{
			if(isdefined(entity))
			{
				origin = entity.origin;
			}
			print3d(origin, txt);
			waitframe(1);
		}
	#/
}

/*
	Name: debugbox
	Namespace: namespace_1e25ad94
	Checksum: 0xAFCA9914
	Offset: 0x760
	Size: 0x11E
	Parameters: 7
	Flags: Linked
*/
function debugbox(var_f893e8d1, yaw, length, width, height, timesec, color)
{
	if(!isdefined(timesec))
	{
		timesec = 1;
	}
	if(!isdefined(color))
	{
		color = (1, 0, 0);
	}
	/#
		end = gettime() + (timesec * 1000);
		mins = ((length * -1) / 2, (width * -1) / 2, (height * -1) / 2);
		maxs = (length / 2, width / 2, height / 2);
		while(end > gettime())
		{
			box(var_f893e8d1, mins, maxs, yaw, color, 1, 0, 1);
			waitframe(1);
		}
	#/
}

/*
	Name: function_67127ba2
	Namespace: namespace_1e25ad94
	Checksum: 0x893D16FC
	Offset: 0x888
	Size: 0x126
	Parameters: 7
	Flags: None
*/
function function_67127ba2(entity, yaw, length, width, height, timesec, color)
{
	if(!isdefined(timesec))
	{
		timesec = 1;
	}
	if(!isdefined(color))
	{
		color = (1, 0, 0);
	}
	/#
		end = gettime() + (timesec * 1000);
		mins = ((length * -1) / 2, (width * -1) / 2, (height * -1) / 2);
		maxs = (length / 2, width / 2, height / 2);
		while(end > gettime())
		{
			box(entity.origin, mins, maxs, yaw, color, 1, 0, 1);
			waitframe(1);
		}
	#/
}

/*
	Name: function_99069e31
	Namespace: namespace_1e25ad94
	Checksum: 0x288A01CC
	Offset: 0x9B8
	Size: 0xE0
	Parameters: 0
	Flags: Linked
*/
function function_99069e31()
{
	/#
		while(true)
		{
			waitframe(1);
			if(level.doa.var_62f60f27.size && isdefined(level.doa.var_39e3fa99))
			{
				if(level.doa.world_state == 4)
				{
					origin = namespace_7f5aeb59::function_23e1f90f()[0].origin;
				}
				else
				{
					origin = [[ level.doa.var_39e3fa99 ]]->function_ffcf1d1();
				}
				print3d(origin, "" + level.doa.var_62f60f27.size);
			}
		}
	#/
}

/*
	Name: function_d88064ec
	Namespace: namespace_1e25ad94
	Checksum: 0x7D99144E
	Offset: 0xAA0
	Size: 0xD4
	Parameters: 1
	Flags: Linked
*/
function function_d88064ec(clear)
{
	if(!isdefined(clear))
	{
		clear = 1;
	}
	/#
		foreach(msg in level.doa.var_62f60f27)
		{
			println("" + msg);
		}
	#/
	if(clear)
	{
		function_8225da57();
	}
}

/*
	Name: function_8225da57
	Namespace: namespace_1e25ad94
	Checksum: 0x18DF7C42
	Offset: 0xB80
	Size: 0x16
	Parameters: 0
	Flags: Linked
*/
function function_8225da57()
{
	level.doa.var_62f60f27 = [];
}

/*
	Name: function_72f01f3f
	Namespace: namespace_1e25ad94
	Checksum: 0xDB873DD
	Offset: 0xBA0
	Size: 0x1D0
	Parameters: 4
	Flags: None
*/
function function_72f01f3f(origin, radius, time, color)
{
	if(!isdefined(color))
	{
		color = (0, 1, 0);
	}
	/#
		level endon(#"hash_54ce4a6a8260618e");
		self endon(#"death");
		hangtime = 0.05;
		circleres = 16;
		hemires = circleres / 2;
		circleinc = 360 / circleres;
		circleres++;
		timer = gettime() + (time * 1000);
		while(gettime() < timer)
		{
			plotpoints = [];
			rad = 0;
			wait(hangtime);
			players = getplayers();
			angletoplayer = vectortoangles(origin - players[0].origin);
			for(i = 0; i < circleres; i++)
			{
				plotpoints[plotpoints.size] = (origin + (vectorscale(anglestoforward(angletoplayer + (rad, 90, 0)), radius))) + vectorscale((0, 0, 1), 12);
				rad = rad + circleinc;
			}
			function_f8c6064(plotpoints, color, hangtime);
		}
	#/
}

/*
	Name: function_f8c6064
	Namespace: namespace_1e25ad94
	Checksum: 0x25D263BF
	Offset: 0xD78
	Size: 0xCC
	Parameters: 3
	Flags: None
*/
function function_f8c6064(plotpoints, var_2bd0b8bf, server_frames)
{
	if(!isdefined(server_frames))
	{
		server_frames = 1;
	}
	/#
		if(plotpoints.size == 0)
		{
			return;
		}
		lastpoint = plotpoints[0];
		for(server_frames = int(server_frames); server_frames; server_frames--)
		{
			for(i = 1; i < plotpoints.size; i++)
			{
				line(lastpoint, plotpoints[i], var_2bd0b8bf, 1, server_frames);
				lastpoint = plotpoints[i];
			}
			waitframe(1);
		}
	#/
}

/*
	Name: function_e8f2d12c
	Namespace: namespace_1e25ad94
	Checksum: 0xC2EBB9CF
	Offset: 0xE50
	Size: 0x2B2
	Parameters: 5
	Flags: Linked
*/
function function_e8f2d12c(pos, rad, height, server_frames, color)
{
	if(!isdefined(server_frames))
	{
		server_frames = 1;
	}
	if(!isdefined(color))
	{
		color = (0, 0, 0);
	}
	/#
		self endon(#"stop_cylinder");
		self endon(#"death");
		currad = rad;
		curheight = height;
		for(server_frames = int(server_frames); server_frames; server_frames--)
		{
			for(r = 0; r < 20; r++)
			{
				theta = (r / 20) * 360;
				theta2 = ((r + 1) / 20) * 360;
				line(pos + (cos(theta) * currad, sin(theta) * currad, 0), pos + (cos(theta2) * currad, sin(theta2) * currad, 0), color);
				line(pos + (cos(theta) * currad, sin(theta) * currad, curheight), pos + (cos(theta2) * currad, sin(theta2) * currad, curheight), color);
				line(pos + (cos(theta) * currad, sin(theta) * currad, 0), pos + (cos(theta) * currad, sin(theta) * currad, curheight), color);
			}
			waitframe(1);
		}
	#/
}

/*
	Name: function_ee689179
	Namespace: namespace_1e25ad94
	Checksum: 0xA4268326
	Offset: 0x1110
	Size: 0x6C
	Parameters: 0
	Flags: None
*/
function function_ee689179()
{
	self.fading = 1;
	while(self.alpha > 0)
	{
		self.alpha = self.alpha - 0.01;
		waitframe(1);
	}
	arrayremovevalue(level.doa.var_3843f782, self);
}

/*
	Name: function_8f04a649
	Namespace: namespace_1e25ad94
	Checksum: 0x54E66EF0
	Offset: 0x1188
	Size: 0x1AA
	Parameters: 0
	Flags: Linked
*/
function function_8f04a649()
{
	/#
		self notify("");
		self endon("");
		while(level.doa.var_3843f782.size)
		{
			var_4c600979 = 800;
			time = gettime();
			foreach(line in level.doa.var_3843f782)
			{
				if(time > line.expire && !isdefined(line.fading))
				{
					line thread function_ee689179();
				}
				line.y = var_4c600979;
				var_4c600979 = var_4c600979 + (int(20 * line.scale));
				debug2dtext((line.x, line.y, 0), line.text, line.color, line.alpha, (0, 0, 0), 0, line.scale, 1);
			}
			waitframe(1);
		}
	#/
}

/*
	Name: function_4e3cfad
	Namespace: namespace_1e25ad94
	Checksum: 0x7E0FD51F
	Offset: 0x1340
	Size: 0x14C
	Parameters: 5
	Flags: Linked
*/
function function_4e3cfad(text, color, alpha, scale, duration)
{
	if(!isdefined(color))
	{
		color = (1, 1, 1);
	}
	if(!isdefined(alpha))
	{
		alpha = 1;
	}
	if(!isdefined(scale))
	{
		scale = 1;
	}
	if(!isdefined(duration))
	{
		duration = 3;
	}
	if(!isdefined(level.doa.var_3843f782))
	{
		level.doa.var_3843f782 = [];
	}
	struct = spawnstruct();
	struct.x = 40;
	struct.text = text;
	struct.color = color;
	struct.alpha = alpha;
	struct.scale = scale;
	struct.expire = gettime() + (duration * 1000);
	level.doa.var_3843f782[level.doa.var_3843f782.size] = struct;
	level thread function_8f04a649();
}

/*
	Name: function_70e370a
	Namespace: namespace_1e25ad94
	Checksum: 0x32A755D4
	Offset: 0x1498
	Size: 0x10C
	Parameters: 7
	Flags: Linked
*/
function function_70e370a(posx, posy, text, color, alpha, scale, durationsec)
{
	if(!isdefined(color))
	{
		color = (1, 1, 1);
	}
	if(!isdefined(alpha))
	{
		alpha = 1;
	}
	if(!isdefined(scale))
	{
		scale = 1;
	}
	if(!isdefined(durationsec))
	{
		durationsec = 3;
	}
	/#
		if(!isdefined(text) || text == "")
		{
			return;
		}
		frames = int(durationsec * 20);
		if(frames < 1)
		{
			frames = 1;
		}
		debug2dtext((posx, posy, 0), text, color, alpha, (0, 0, 0), 0, scale, frames);
	#/
}

