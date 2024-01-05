#using script_5552bd756afee443;
#using script_3dc93ca9902a9cda;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_ce2d072f;

/*
	Name: function_80763da
	Namespace: namespace_ce2d072f
	Checksum: 0x5AE716CA
	Offset: 0x88
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_80763da()
{
	level notify(-1217246153);
}

#namespace snd;

/*
	Name: function_669c57bc
	Namespace: snd
	Checksum: 0x64C55D1
	Offset: 0xA8
	Size: 0x154
	Parameters: 7
	Flags: None
*/
function function_669c57bc(posx, posy, text, color, alpha, scale, duration)
{
	/#
		if(isdefined(text) == 0 || text == "")
		{
			return;
		}
		color = function_ea2f17d1(color, (1, 1, 1));
		alpha = function_ea2f17d1(alpha, 1);
		scale = function_ea2f17d1(scale, 1);
		duration = function_ea2f17d1(duration, 1);
		if(isscriptfunctionptr(level.var_44a79f1b) == 1)
		{
			[[level.var_44a79f1b]](posx, posy, text, color, alpha, scale, duration);
		}
		else
		{
			debug2dtext((posx, posy, 0), text, color, alpha, (0, 0, 0), 0, scale, duration);
		}
	#/
}

/*
	Name: function_9f4eb444
	Namespace: snd
	Checksum: 0xB317AF6F
	Offset: 0x208
	Size: 0x132
	Parameters: 2
	Flags: None
*/
function function_9f4eb444(text, scale)
{
	/#
		/#
			assert(isdefined(text));
		#/
		if(isdefined(scale) == 0)
		{
			scale = 1;
		}
		var_1790a507 = function_827811b5();
		var_38c41a5e = var_1790a507[0];
		var_c13d121d = var_1790a507[1];
		var_50813ca = text.size;
		var_d94c3e22 = (var_50813ca * 11) * scale;
		var_2cfe365a = (var_38c41a5e * 0.5) - (var_d94c3e22 * 0.5);
		var_fac551e9 = (var_c13d121d * 0.5) - 12;
		center = array(var_2cfe365a, var_fac551e9);
		return center;
	#/
}

/*
	Name: function_409c06e5
	Namespace: snd
	Checksum: 0x7DC8FC41
	Offset: 0x348
	Size: 0xA2
	Parameters: 2
	Flags: None
*/
function function_409c06e5(text, scale)
{
	/#
		centerpos = function_9f4eb444(text, scale);
		var_fad221f1 = centerpos[0];
		var_ec8f856c = centerpos[1];
		var_ec8f856c = (var_ec8f856c * 0.5) + 12;
		var_6411df1b = array(var_fad221f1, var_ec8f856c);
		return var_6411df1b;
	#/
}

/*
	Name: function_ac3c5285
	Namespace: snd
	Checksum: 0xDCCA15CE
	Offset: 0x3F8
	Size: 0x41C
	Parameters: 7
	Flags: Private
*/
function private function_ac3c5285(posx, posy, text, color, scale, var_24ea4e17, var_45b08b81)
{
	/#
		var_d6f54187 = 24 * scale;
		frametime = function_6cfa7975();
		var_48c93ed9 = int(var_24ea4e17 / frametime);
		framecount = 0;
		var_1c57e012 = int(var_45b08b81 / frametime);
		var_9a0d8dab = 1;
		var_206c3ebf = 0;
		if(is_true(level._snd.var_8c37ff34))
		{
			var_9a0d8dab = 2;
		}
		if(isarray(level.var_89c4a5f0) == 0)
		{
			level.var_89c4a5f0 = array();
		}
		/#
			assert(isarray(level.var_89c4a5f0));
		#/
		if(level.var_89c4a5f0.size > 0)
		{
			foreach(row in level.var_89c4a5f0)
			{
				if(isinarray(level.var_89c4a5f0, posy) == 1)
				{
					posy = posy + var_d6f54187;
					continue;
				}
				break;
			}
		}
		level.var_89c4a5f0[level.var_89c4a5f0.size] = posy;
		while(framecount < var_48c93ed9)
		{
			if(framecount < var_1c57e012)
			{
				var_78aff59a = int(float(framecount) / float(var_9a0d8dab));
				var_78aff59a = var_78aff59a % 2;
				if(var_78aff59a)
				{
					framecount = framecount + 1;
					waitframe(1);
					continue;
				}
			}
			var_53d7cee7 = float(framecount) / float(var_48c93ed9);
			var_53d7cee7 = math::clamp(var_53d7cee7, 0, 1);
			alpha = function_b918d683(1 - var_53d7cee7, "");
			var_8b9208e = alpha * alpha;
			colorscale = function_2677a7e2(color, alpha);
			function_65bb0ccd(text, posx, posy, scale, "", colorscale, alpha, (0, 0, 0), var_8b9208e, (1, 1, 1), var_8b9208e, 1);
			framecount = framecount + 1;
			waitframe(1);
		}
		if(isarray(level.var_89c4a5f0))
		{
			arrayremovevalue(level.var_89c4a5f0, posy);
		}
	#/
}

/*
	Name: function_3ba3cecb
	Namespace: snd
	Checksum: 0x2BD59671
	Offset: 0x820
	Size: 0x1A4
	Parameters: 7
	Flags: None
*/
function function_3ba3cecb(text, posx, posy, color, scale, var_24ea4e17, var_45b08b81)
{
	/#
		/#
			assert(isdefined(text) == 1);
		#/
		color = function_ea2f17d1(color, (1, 0.5, 0.5));
		scale = function_ea2f17d1(scale, 1.75);
		var_24ea4e17 = function_ea2f17d1(var_24ea4e17, 4);
		var_45b08b81 = function_ea2f17d1(var_45b08b81, 1);
		if(isdefined(posx) == 0 || isdefined(posy) == 0)
		{
			var_6411df1b = function_409c06e5(text, scale);
			if(isdefined(posx) == 0)
			{
				posx = var_6411df1b[0];
			}
			if(isdefined(posy) == 0)
			{
				posy = var_6411df1b[1];
			}
		}
		level thread function_ac3c5285(posx, posy, text, color, scale, var_24ea4e17, var_45b08b81);
		println(text);
	#/
}

/*
	Name: function_fa8480e6
	Namespace: snd
	Checksum: 0x8041CB65
	Offset: 0x9D0
	Size: 0x64
	Parameters: 7
	Flags: None
*/
function function_fa8480e6(origin, text, color, alpha, scale, duration, centered)
{
	/#
		print3d(origin, text, color, alpha, scale, duration, centered);
	#/
}

/*
	Name: function_4e22152d
	Namespace: snd
	Checksum: 0x691A9B8A
	Offset: 0xA40
	Size: 0x64
	Parameters: 7
	Flags: None
*/
function function_4e22152d(origin, text, color, alpha, scale, duration, right)
{
	/#
		print3d(text, color, alpha, scale, duration, right, 1);
	#/
}

/*
	Name: function_65bb0ccd
	Namespace: snd
	Checksum: 0x26C5B635
	Offset: 0xAB0
	Size: 0x3C4
	Parameters: 12
	Flags: None
*/
function function_65bb0ccd(text, x, y, scale, justify, color, alpha, var_44982be2, var_7389333f, var_2aee873b, var_c16d003f, duration)
{
	/#
		color = function_ea2f17d1(color, (1, 1, 1));
		alpha = function_ea2f17d1(alpha, 1);
		scale = function_ea2f17d1(scale, 1);
		justify = function_ea2f17d1(justify, "");
		duration = function_ea2f17d1(duration, 1);
		offset = (0, 0, 0);
		width = (11 * scale) * text.size;
		switch(justify)
		{
			case 0:
			case "left":
			case "l":
			default:
			{
				break;
			}
			case 1:
			case "c":
			case "centered":
			case "center":
			{
				offset = offset + (width * -0.5, 0, 0);
				break;
			}
			case 2:
			case "r":
			case "right":
			{
				offset = offset + (width * -1, 0, 0);
				break;
			}
		}
		if(isdefined(var_44982be2) == 1)
		{
			var_9aa20b4e = 1;
			if(!isdefined(var_7389333f))
			{
				var_7389333f = alpha * 0.7333;
			}
			position = (x + (1 * scale), y + (1 * scale), 0) + offset;
			function_669c57bc(position[0], position[1], text, var_44982be2, var_7389333f, scale, duration);
		}
		if(isdefined(var_2aee873b) == 1)
		{
			if(!isdefined(var_c16d003f))
			{
				var_c16d003f = alpha * 0.7333;
			}
			position = (x + -0.666 * scale, y + -0.666 * scale, 0) + offset;
			function_669c57bc(position[0], position[1], text, var_2aee873b, var_c16d003f, scale, duration);
		}
		position = (x, y, 0) + offset;
		function_669c57bc(position[0], position[1], text, color, alpha, scale, duration);
	#/
}

/*
	Name: function_ac033c46
	Namespace: snd
	Checksum: 0x745C490
	Offset: 0xE80
	Size: 0x6B4
	Parameters: 11
	Flags: None
*/
function function_ac033c46(text, origin, scale, justify, color, alpha, var_44982be2, var_7389333f, var_2aee873b, var_c16d003f, duration)
{
	/#
		color = function_ea2f17d1(color, (1, 1, 1));
		alpha = function_ea2f17d1(alpha, 1);
		scale = function_ea2f17d1(scale, 1);
		justify = function_ea2f17d1(justify, "");
		duration = int(function_ea2f17d1(duration, 1));
		var_b69585e4 = scale < 0;
		scale = abs(scale);
		textsize = text.size;
		if(issubstr(text, ""))
		{
			lines = strtok(text, "");
			if(isarray(lines) && lines.size > 1)
			{
				longest = 0;
				foreach(line in lines)
				{
					if(line.size > longest)
					{
						longest = line.size;
					}
				}
				textsize = longest;
			}
		}
		var_e9588a4 = (1, 0, 0);
		var_3e836530 = (0, 0, 1);
		players = function_2b2b83dc();
		if(isarray(players) == 1 && isdefined(players[0]))
		{
			player = players[0];
			vieworigin = player function_efda2d6d();
			viewangles = player function_3d31768f();
			var_e9588a4 = anglestoright(viewangles);
			var_3e836530 = anglestoup(viewangles);
			if(var_b69585e4)
			{
				dist = distance(origin, vieworigin);
				var_7295dcac = dist * 0.001333333;
				scale = scale * var_7295dcac;
			}
		}
		width = (11 * scale) * textsize;
		offset = (0, 0, (1 * scale) * -1);
		var_fbe7ba4a = var_e9588a4 * offset[0];
		var_24962759 = var_3e836530 * offset[2];
		centered = 0;
		switch(justify)
		{
			case 0:
			case "left":
			case "l":
			default:
			{
				break;
			}
			case 1:
			case "c":
			case "centered":
			case "center":
			{
				centered = 1;
				break;
			}
			case 2:
			case "r":
			case "right":
			{
				offset = offset + (width * -1, 0, 0);
				break;
			}
		}
		if(isdefined(var_44982be2) == 1)
		{
			if(!isdefined(var_7389333f))
			{
				var_7389333f = alpha * 0.72974;
			}
			var_9aa20b4e = (var_e9588a4 * (1 * scale)) + (var_3e836530 * -1 * scale);
			position = (origin + (var_e9588a4 * offset[0])) + (var_3e836530 * offset[2]);
			position = position + var_9aa20b4e;
			print3d(position, text, var_44982be2, var_7389333f, scale, duration, centered);
		}
		if(isdefined(var_2aee873b) == 1)
		{
			if(!isdefined(var_c16d003f))
			{
				var_c16d003f = alpha * 0.72974;
			}
			var_6a4ad33c = (var_e9588a4 * -0.666 * scale) + (var_3e836530 * (0.666 * scale));
			position = (origin + (var_e9588a4 * offset[0])) + (var_3e836530 * offset[2]);
			position = position + var_6a4ad33c;
			print3d(position, text, var_2aee873b, var_c16d003f, scale, duration, centered);
		}
		position = (origin + (var_e9588a4 * offset[0])) + (var_3e836530 * offset[2]);
		print3d(position, text, color, alpha, scale, duration, centered);
	#/
}

/*
	Name: function_bfdce45f
	Namespace: snd
	Checksum: 0x53916600
	Offset: 0x1540
	Size: 0x184
	Parameters: 4
	Flags: Private
*/
function private function_bfdce45f(color, depthtest, var_5c8bd7d0, offset)
{
	/#
		if(var_5c8bd7d0.size < 2)
		{
			return;
		}
		var_ef1b3d6b = var_5c8bd7d0.size - 1;
		alpha = 1;
		var_4aa962c3 = 1 / var_ef1b3d6b;
		colorscale = color;
		while(var_ef1b3d6b > 0)
		{
			var_4612448 = var_5c8bd7d0[var_ef1b3d6b];
			var_c64078a7 = var_5c8bd7d0[var_ef1b3d6b - 1];
			if(isvec(var_4612448) == 1 && isvec(var_c64078a7) == 1 && var_4612448 != var_c64078a7)
			{
				if(isvec(offset) == 1)
				{
					var_4612448 = var_4612448 + offset;
					var_c64078a7 = var_c64078a7 + offset;
				}
				line(var_4612448, var_c64078a7, colorscale, alpha, depthtest, 1);
			}
			colorscale = vectorscale(color, alpha * 1.5);
			alpha = alpha - var_4aa962c3;
			var_ef1b3d6b--;
		}
	#/
}

/*
	Name: function_6ee9efa7
	Namespace: snd
	Checksum: 0xDBE6DF7E
	Offset: 0x16D0
	Size: 0x1FA
	Parameters: 4
	Flags: Private
*/
function private function_6ee9efa7(color, depthtest, duration, offset)
{
	/#
		/#
			assert(isdefined(self.origin) == 1, "");
		#/
		/#
			assert(isvec(color) == 1, "");
		#/
		/#
			assert(isdefined(duration) == 1, "");
		#/
		framecount = 0;
		var_5c8bd7d0 = array();
		var_5c8bd7d0[0] = self.origin;
		self endon(#"hash_2605f8ddd93ed8f9");
		while(var_5c8bd7d0.size > 0)
		{
			var_c6150a06 = array();
			if(framecount >= duration)
			{
				for(i = 1; i < var_5c8bd7d0.size; i++)
				{
					var_c6150a06[i - 1] = var_5c8bd7d0[i];
				}
			}
			else
			{
				var_c6150a06 = var_5c8bd7d0;
			}
			if(isdefined(self) == 1 && isdefined(self.origin) == 1 && function_3132f113(self) == 0)
			{
				var_c6150a06[var_c6150a06.size] = self.origin;
			}
			var_5c8bd7d0 = var_c6150a06;
			function_bfdce45f(color, depthtest, var_5c8bd7d0, offset);
			framecount++;
			waitframe(1);
		}
	#/
}

/*
	Name: function_31d6fc52
	Namespace: snd
	Checksum: 0xB7DFC480
	Offset: 0x18D8
	Size: 0x15C
	Parameters: 5
	Flags: None
*/
function function_31d6fc52(var_9632a625, color, depthtest, duration, offset)
{
	/#
		color = function_ea2f17d1(color, (1, 1, 1));
		depthtest = function_ea2f17d1(depthtest, 0);
		duration = function_ea2f17d1(duration, 5);
		if(function_81fac19d(!isdefined(var_9632a625), ""))
		{
			return;
		}
		if(is_true(level._snd.var_8c37ff34))
		{
			duration = int(60 * duration);
		}
		else
		{
			duration = int(20 * duration);
		}
		/#
			assert(duration > 2, "");
		#/
		var_9632a625 thread function_6ee9efa7(color, depthtest, duration, offset);
	#/
}

/*
	Name: function_a787fe30
	Namespace: snd
	Checksum: 0x8AD4B588
	Offset: 0x1A40
	Size: 0x404
	Parameters: 7
	Flags: None
*/
function function_a787fe30(origin, angles, extents, color, alpha, depthtest, duration)
{
	/#
		half = extents * 0.5;
		var_95483828 = (half, half, half);
		mins = origin - var_95483828;
		maxs = origin + var_95483828;
		side1[0] = (maxs[0], maxs[1], maxs[2]);
		side1[1] = (maxs[0], maxs[1], mins[2]);
		side1[2] = (mins[0], maxs[1], mins[2]);
		side1[3] = (mins[0], maxs[1], maxs[2]);
		side2[0] = (maxs[0], mins[1], maxs[2]);
		side2[1] = (maxs[0], mins[1], mins[2]);
		side2[2] = (mins[0], mins[1], mins[2]);
		side2[3] = (mins[0], mins[1], maxs[2]);
		if(angles != (0, 0, 0))
		{
			side1[0] = origin + (rotatepoint(origin - side1[0], angles));
			side1[1] = origin + (rotatepoint(origin - side1[1], angles));
			side1[2] = origin + (rotatepoint(origin - side1[2], angles));
			side1[3] = origin + (rotatepoint(origin - side1[3], angles));
			side2[0] = origin + (rotatepoint(origin - side2[0], angles));
			side2[1] = origin + (rotatepoint(origin - side2[1], angles));
			side2[2] = origin + (rotatepoint(origin - side2[2], angles));
			side2[3] = origin + (rotatepoint(origin - side2[3], angles));
		}
		for(i = 0; i < 4; i++)
		{
			j = i + 1;
			if(j == 4)
			{
				j = 0;
			}
			line(side1[i], side1[j], color, alpha, depthtest, duration);
			line(side2[i], side2[j], color, alpha, depthtest, duration);
			line(side1[i], side2[i], color, alpha, depthtest, duration);
		}
	#/
}

/*
	Name: cube
	Namespace: snd
	Checksum: 0x9A76F413
	Offset: 0x1E50
	Size: 0x64
	Parameters: 7
	Flags: None
*/
function cube(origin, angles, var_81cc59c8, color, alpha, depthtest, duration)
{
	/#
		function_a787fe30(origin, angles, var_81cc59c8, color, alpha, depthtest, duration);
	#/
}

/*
	Name: function_81183b3
	Namespace: snd
	Checksum: 0x274E5B09
	Offset: 0x1EC0
	Size: 0x2AC
	Parameters: 7
	Flags: None
*/
function function_81183b3(origin, size, angles, color, alpha, depthtest, duration)
{
	/#
		forward = (1, 0, 0);
		right = (0, 1, 0);
		up = (0, 0, 1);
		size = function_ea2f17d1(size, 16);
		angles = function_ea2f17d1(angles, (0, 0, 0));
		color = function_ea2f17d1(color, (1, 1, 1));
		alpha = function_ea2f17d1(alpha, 1);
		depthtest = function_ea2f17d1(depthtest, 0);
		duration = function_ea2f17d1(duration, 1);
		if(angles != (0, 0, 0))
		{
			forward = anglestoforward(angles);
			right = anglestoright(angles) * -1;
			up = anglestoup(angles);
		}
		half = size * 0.5;
		forward = forward * half;
		right = right * half;
		up = up * half;
		var_d805968e = 0.333;
		var_ec1abeec = (var_d805968e, var_d805968e, var_d805968e);
		var_b278259c = (color * var_ec1abeec) + (1, 0, 0);
		var_7a8ab5a2 = (color * var_ec1abeec) + (0, 1, 0);
		colb = (color * var_ec1abeec) + (0, 0, 1);
		line(origin - forward, origin + forward, var_b278259c, alpha, depthtest, duration);
		line(origin - right, origin + right, var_7a8ab5a2, alpha, depthtest, duration);
		line(origin - up, origin + up, colb, alpha, depthtest, duration);
	#/
}

/*
	Name: function_8aaa798e
	Namespace: snd
	Checksum: 0xDE28DDAA
	Offset: 0x2178
	Size: 0x384
	Parameters: 8
	Flags: None
*/
function function_8aaa798e(origin, angles, length, var_e3c3c3d9, color, alpha, depthtest, duration)
{
	/#
		/#
			assert(isvec(origin));
		#/
		/#
			assert(isvec(angles));
		#/
		length = function_ea2f17d1(length, 12);
		var_e3c3c3d9 = function_ea2f17d1(var_e3c3c3d9, 4);
		color = function_ea2f17d1(color, (1, 1, 1));
		alpha = function_ea2f17d1(alpha, 1);
		depthtest = function_ea2f17d1(depthtest, 0);
		duration = int(function_ea2f17d1(duration, 1));
		arrow_forward = anglestoforward(angles);
		arrowhead_forward = arrow_forward;
		arrowhead_right = anglestoright(angles);
		var_54ff912b = anglestoup(angles);
		var_feb4bec6 = var_54ff912b;
		arrow_forward = vectorscale(arrow_forward, length);
		arrowhead_forward = vectorscale(arrowhead_forward, length - var_e3c3c3d9);
		arrowhead_right = vectorscale(arrowhead_right, var_e3c3c3d9);
		var_54ff912b = vectorscale(var_54ff912b, var_e3c3c3d9);
		var_feb4bec6 = vectorscale(var_feb4bec6, -1 * var_e3c3c3d9);
		o = origin;
		a = o + arrow_forward;
		b = (o + arrowhead_forward) - arrowhead_right;
		c = (o + arrowhead_forward) + arrowhead_right;
		d = (o + arrowhead_forward) + var_54ff912b;
		e = (o + arrowhead_forward) + var_feb4bec6;
		line(o, a, color, alpha, depthtest, duration);
		line(a, b, color, alpha, depthtest, duration);
		line(b, c, color, alpha, depthtest, duration);
		line(c, a, color, alpha, depthtest, duration);
		line(a, d, color, alpha, depthtest, duration);
		line(d, e, color, alpha, depthtest, duration);
		line(e, a, color, alpha, depthtest, duration);
	#/
}

/*
	Name: function_79f31114
	Namespace: snd
	Checksum: 0xDA089E8E
	Offset: 0x2508
	Size: 0x26
	Parameters: 1
	Flags: Linked
*/
function function_79f31114(var_9ea95be0)
{
	var_bfd4f22d = 480 / var_9ea95be0;
	return var_bfd4f22d;
}

/*
	Name: function_df9f894b
	Namespace: snd
	Checksum: 0xD0525F8B
	Offset: 0x2538
	Size: 0xCA
	Parameters: 2
	Flags: Linked
*/
function function_df9f894b(coordinates, var_1734a02c)
{
	var_1734a02c = function_ea2f17d1(var_1734a02c, function_827811b5());
	var_bfd4f22d = function_79f31114(var_1734a02c[1]);
	var_a6a4856f = coordinates[0] * var_bfd4f22d;
	var_81ae8d4d = coordinates[1] * var_bfd4f22d;
	return array(int(var_a6a4856f), int(var_81ae8d4d));
}

/*
	Name: function_da7b7c0e
	Namespace: snd
	Checksum: 0xCF8267C0
	Offset: 0x2610
	Size: 0x10A
	Parameters: 2
	Flags: Linked
*/
function function_da7b7c0e(coordinates, var_1734a02c)
{
	var_1734a02c = function_ea2f17d1(var_1734a02c, function_827811b5());
	var_bfd4f22d = function_79f31114(var_1734a02c[1]);
	var_11ea799a = coordinates[0] * var_bfd4f22d;
	var_39fdd05 = coordinates[1] * var_bfd4f22d;
	var_63960741 = var_1734a02c[0] / var_1734a02c[1];
	var_73ea373d = var_63960741 * 480;
	var_d8976fdf = -0.5 * (var_73ea373d - 640);
	var_11ea799a = var_11ea799a + var_d8976fdf;
	return array(var_11ea799a, var_39fdd05);
}

