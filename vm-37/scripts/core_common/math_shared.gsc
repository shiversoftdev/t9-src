#using scripts\core_common\util_shared.gsc;

#namespace math;

/*
	Name: cointoss
	Namespace: math
	Checksum: 0x2DFB5958
	Offset: 0x88
	Size: 0x38
	Parameters: 1
	Flags: Linked
*/
function cointoss(n_chance)
{
	if(!isdefined(n_chance))
	{
		n_chance = 50;
	}
	return function_21a3a673(1, 100) <= n_chance;
}

/*
	Name: clamp
	Namespace: math
	Checksum: 0x96F6D76F
	Offset: 0xC8
	Size: 0x54
	Parameters: 3
	Flags: Linked
*/
function clamp(val, val_min, val_max)
{
	if(!isdefined(val_max))
	{
		val_max = val;
	}
	if(val < val_min)
	{
		val = val_min;
	}
	else if(val > val_max)
	{
		val = val_max;
	}
	return val;
}

/*
	Name: lag
	Namespace: math
	Checksum: 0x99CF0742
	Offset: 0x128
	Size: 0x92
	Parameters: 4
	Flags: None
*/
function lag(desired, curr, k, dt)
{
	r = 0;
	if((k * dt) >= 1 || k <= 0)
	{
		r = desired;
	}
	else
	{
		err = desired - curr;
		r = curr + ((k * err) * dt);
	}
	return r;
}

/*
	Name: find_box_center
	Namespace: math
	Checksum: 0x405B6681
	Offset: 0x1C8
	Size: 0x66
	Parameters: 2
	Flags: Linked
*/
function find_box_center(mins, maxs)
{
	center = (0, 0, 0);
	center = maxs - mins;
	center = (center[0] / 2, center[1] / 2, center[2] / 2) + mins;
	return center;
}

/*
	Name: expand_mins
	Namespace: math
	Checksum: 0x3A0E0406
	Offset: 0x238
	Size: 0xA4
	Parameters: 2
	Flags: Linked
*/
function expand_mins(mins, point)
{
	if(mins[0] > point[0])
	{
		mins = (point[0], mins[1], mins[2]);
	}
	if(mins[1] > point[1])
	{
		mins = (mins[0], point[1], mins[2]);
	}
	if(mins[2] > point[2])
	{
		mins = (mins[0], mins[1], point[2]);
	}
	return mins;
}

/*
	Name: expand_maxs
	Namespace: math
	Checksum: 0xCC0DD1EA
	Offset: 0x2E8
	Size: 0xA4
	Parameters: 2
	Flags: Linked
*/
function expand_maxs(maxs, point)
{
	if(maxs[0] < point[0])
	{
		maxs = (point[0], maxs[1], maxs[2]);
	}
	if(maxs[1] < point[1])
	{
		maxs = (maxs[0], point[1], maxs[2]);
	}
	if(maxs[2] < point[2])
	{
		maxs = (maxs[0], maxs[1], point[2]);
	}
	return maxs;
}

/*
	Name: vector_compare
	Namespace: math
	Checksum: 0xB5C2475A
	Offset: 0x398
	Size: 0x9E
	Parameters: 2
	Flags: None
*/
function vector_compare(vec1, vec2)
{
	return (abs(vec1[0] - vec2[0])) < 0.001 && (abs(vec1[1] - vec2[1])) < 0.001 && (abs(vec1[2] - vec2[2])) < 0.001;
}

/*
	Name: random_vector
	Namespace: math
	Checksum: 0x6F640B19
	Offset: 0x440
	Size: 0x6C
	Parameters: 1
	Flags: None
*/
function random_vector(max_length)
{
	return (randomfloatrange(-1 * max_length, max_length), randomfloatrange(-1 * max_length, max_length), randomfloatrange(-1 * max_length, max_length));
}

/*
	Name: angle_dif
	Namespace: math
	Checksum: 0xD8E6714D
	Offset: 0x4B8
	Size: 0x68
	Parameters: 2
	Flags: Linked
*/
function angle_dif(oldangle, newangle)
{
	outvalue = (oldangle - newangle) % 360;
	if(outvalue < 0)
	{
		outvalue = outvalue + 360;
	}
	if(outvalue > 180)
	{
		outvalue = (outvalue - 360) * -1;
	}
	return outvalue;
}

/*
	Name: sign
	Namespace: math
	Checksum: 0x255ED03
	Offset: 0x528
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function sign(x)
{
	return (x >= 0 ? 1 : -1);
}

/*
	Name: randomsign
	Namespace: math
	Checksum: 0x3D3428B0
	Offset: 0x558
	Size: 0x2E
	Parameters: 0
	Flags: Linked
*/
function randomsign()
{
	return ((randomintrange(-1, 1)) >= 0 ? 1 : -1);
}

/*
	Name: get_dot_direction
	Namespace: math
	Checksum: 0x9B14F08F
	Offset: 0x590
	Size: 0x35A
	Parameters: 5
	Flags: Linked
*/
function get_dot_direction(v_point, b_ignore_z, b_normalize, str_direction, b_use_eye)
{
	/#
		assert(isdefined(v_point), "");
	#/
	if(!isdefined(b_ignore_z))
	{
		b_ignore_z = 0;
	}
	if(!isdefined(b_normalize))
	{
		b_normalize = 1;
	}
	if(!isdefined(str_direction))
	{
		str_direction = "forward";
	}
	if(!isdefined(b_use_eye))
	{
		b_use_eye = 0;
		if(isplayer(self))
		{
			b_use_eye = 1;
		}
	}
	v_angles = self.angles;
	v_origin = self.origin;
	if(b_use_eye)
	{
		v_origin = self util::get_eye();
	}
	if(isplayer(self))
	{
		v_angles = self getplayerangles();
		if(level.wiiu)
		{
			v_angles = self getgunangles();
		}
	}
	if(b_ignore_z)
	{
		v_angles = (v_angles[0], v_angles[1], 0);
		v_point = (v_point[0], v_point[1], 0);
		v_origin = (v_origin[0], v_origin[1], 0);
	}
	switch(str_direction)
	{
		case "forward":
		{
			v_direction = anglestoforward(v_angles);
			break;
		}
		case "backward":
		{
			v_direction = anglestoforward(v_angles) * -1;
			break;
		}
		case "right":
		{
			v_direction = anglestoright(v_angles);
			break;
		}
		case "left":
		{
			v_direction = anglestoright(v_angles) * -1;
			break;
		}
		case "up":
		{
			v_direction = anglestoup(v_angles);
			break;
		}
		case "down":
		{
			v_direction = anglestoup(v_angles) * -1;
			break;
		}
		default:
		{
			/#
				assertmsg(str_direction + "");
			#/
			v_direction = anglestoforward(v_angles);
			break;
		}
	}
	v_to_point = v_point - v_origin;
	if(b_normalize)
	{
		v_to_point = vectornormalize(v_to_point);
	}
	n_dot = vectordot(v_direction, v_to_point);
	return n_dot;
}

/*
	Name: get_dot_right
	Namespace: math
	Checksum: 0x6331A3F2
	Offset: 0x8F8
	Size: 0x6A
	Parameters: 3
	Flags: None
*/
function get_dot_right(v_point, b_ignore_z, b_normalize)
{
	/#
		assert(isdefined(v_point), "");
	#/
	n_dot = get_dot_direction(v_point, b_ignore_z, b_normalize, "right");
	return n_dot;
}

/*
	Name: get_dot_up
	Namespace: math
	Checksum: 0x25434A86
	Offset: 0x970
	Size: 0x6A
	Parameters: 3
	Flags: None
*/
function get_dot_up(v_point, b_ignore_z, b_normalize)
{
	/#
		assert(isdefined(v_point), "");
	#/
	n_dot = get_dot_direction(v_point, b_ignore_z, b_normalize, "up");
	return n_dot;
}

/*
	Name: get_dot_forward
	Namespace: math
	Checksum: 0x74E8D5AA
	Offset: 0x9E8
	Size: 0x6A
	Parameters: 3
	Flags: None
*/
function get_dot_forward(v_point, b_ignore_z, b_normalize)
{
	/#
		assert(isdefined(v_point), "");
	#/
	n_dot = get_dot_direction(v_point, b_ignore_z, b_normalize, "forward");
	return n_dot;
}

/*
	Name: get_dot_from_eye
	Namespace: math
	Checksum: 0x709091E3
	Offset: 0xA60
	Size: 0xD2
	Parameters: 4
	Flags: None
*/
function get_dot_from_eye(v_point, b_ignore_z, b_normalize, str_direction)
{
	/#
		assert(isdefined(v_point), "");
	#/
	/#
		assert(isplayer(self) || isai(self), ("" + self.classname) + "");
	#/
	n_dot = get_dot_direction(v_point, b_ignore_z, b_normalize, str_direction, 1);
	return n_dot;
}

/*
	Name: array_average
	Namespace: math
	Checksum: 0x18A41CD1
	Offset: 0xB40
	Size: 0x98
	Parameters: 1
	Flags: None
*/
function array_average(array)
{
	/#
		assert(isarray(array));
	#/
	/#
		assert(array.size > 0);
	#/
	total = 0;
	for(i = 0; i < array.size; i++)
	{
		total = total + array[i];
	}
	return total / array.size;
}

/*
	Name: array_std_deviation
	Namespace: math
	Checksum: 0x114120D2
	Offset: 0xBE0
	Size: 0xFA
	Parameters: 2
	Flags: None
*/
function array_std_deviation(array, mean)
{
	/#
		assert(isarray(array));
	#/
	/#
		assert(array.size > 0);
	#/
	tmp = [];
	for(i = 0; i < array.size; i++)
	{
		tmp[i] = (array[i] - mean) * (array[i] - mean);
	}
	total = 0;
	for(i = 0; i < tmp.size; i++)
	{
		total = total + tmp[i];
	}
	return sqrt(total / array.size);
}

/*
	Name: random_normal_distribution
	Namespace: math
	Checksum: 0x24395046
	Offset: 0xCE8
	Size: 0x16C
	Parameters: 4
	Flags: None
*/
function random_normal_distribution(mean, std_deviation, lower_bound, upper_bound)
{
	x1 = 0;
	x2 = 0;
	w = 1;
	y1 = 0;
	while(w >= 1)
	{
		x1 = (2 * randomfloatrange(0, 1)) - 1;
		x2 = (2 * randomfloatrange(0, 1)) - 1;
		w = (x1 * x1) + (x2 * x2);
	}
	w = sqrt(-2 * log(w) / w);
	y1 = x1 * w;
	number = mean + (y1 * std_deviation);
	if(isdefined(lower_bound) && number < lower_bound)
	{
		number = lower_bound;
	}
	if(isdefined(upper_bound) && number > upper_bound)
	{
		number = upper_bound;
	}
	return number;
}

/*
	Name: point_on_sphere_even_distribution
	Namespace: math
	Checksum: 0x5579A7CB
	Offset: 0xE60
	Size: 0x136
	Parameters: 3
	Flags: Linked
*/
function point_on_sphere_even_distribution(pitchrange, index, numberofpoints)
{
	zrange = mapfloat(0, 180, 1, -1, pitchrange);
	golden_angle = 180 * (3 - sqrt(5));
	theta = index * golden_angle;
	z = mapfloat(0, numberofpoints - 1, 1, zrange, index);
	r = sqrt(1 - sqr(z));
	dir = (r * cos(theta), r * sin(theta), z);
	return dir;
}

/*
	Name: closest_point_on_line
	Namespace: math
	Checksum: 0xC2B58B42
	Offset: 0xFA0
	Size: 0x17A
	Parameters: 3
	Flags: Linked
*/
function closest_point_on_line(point, linestart, lineend)
{
	linemagsqrd = lengthsquared(lineend - linestart);
	t = (point[0] - linestart[0]) * (lineend[0] - linestart[0]) + (point[1] - linestart[1]) * (lineend[1] - linestart[1]) + (point[2] - linestart[2]) * (lineend[2] - linestart[2]) / linemagsqrd;
	if(t < 0)
	{
		return linestart;
	}
	if(t > 1)
	{
		return lineend;
	}
	start_x = linestart[0] + (t * (lineend[0] - linestart[0]));
	start_y = linestart[1] + (t * (lineend[1] - linestart[1]));
	start_z = linestart[2] + (t * (lineend[2] - linestart[2]));
	return (start_x, start_y, start_z);
}

/*
	Name: function_8dd4c3c5
	Namespace: math
	Checksum: 0xA9AAD433
	Offset: 0x1128
	Size: 0xB8
	Parameters: 3
	Flags: Linked
*/
function function_8dd4c3c5(linestart, lineend, point)
{
	var_6dbcbbd = distancesquared(linestart, point);
	var_eb2bcaa0 = distancesquared(lineend, point);
	var_fc3c6223 = lengthsquared(lineend - linestart);
	if(var_6dbcbbd > var_fc3c6223 || var_eb2bcaa0 > var_fc3c6223)
	{
		point = (var_6dbcbbd < var_eb2bcaa0 ? linestart : lineend);
	}
	return point;
}

/*
	Name: function_d3de8415
	Namespace: math
	Checksum: 0x7B89BC5E
	Offset: 0x11E8
	Size: 0x1A2
	Parameters: 5
	Flags: None
*/
function function_d3de8415(var_17a1aca9, var_9522f5ec, var_e5dbc91e, var_815dce62, clamp)
{
	var_776dc374 = var_9522f5ec - var_17a1aca9;
	var_747cbd92 = var_815dce62 - var_e5dbc91e;
	var_62e81a69 = var_e5dbc91e - var_17a1aca9;
	var_b36ea470 = vectordot(var_776dc374, var_776dc374);
	var_ccfa5787 = vectordot(var_776dc374, var_747cbd92);
	var_d6bc6b0b = vectordot(var_776dc374, var_62e81a69);
	var_d0cdde0e = vectordot(var_747cbd92, var_747cbd92);
	var_1861ed41 = vectordot(var_747cbd92, var_62e81a69);
	denom = (var_b36ea470 * var_d0cdde0e) - (var_ccfa5787 * var_ccfa5787);
	if(denom == 0)
	{
		return undefined;
	}
	t = ((var_ccfa5787 * -1) * var_1861ed41) + (var_d6bc6b0b * var_d0cdde0e) / (var_b36ea470 * var_d0cdde0e) - (var_ccfa5787 * var_ccfa5787);
	point = var_17a1aca9 + (var_776dc374 * t);
	if(clamp)
	{
		point = function_8dd4c3c5(var_17a1aca9, var_9522f5ec, point);
	}
	return point;
}

/*
	Name: function_f16fbd66
	Namespace: math
	Checksum: 0x1B230C74
	Offset: 0x1398
	Size: 0x254
	Parameters: 5
	Flags: None
*/
function function_f16fbd66(var_17a1aca9, var_9522f5ec, var_e5dbc91e, var_815dce62, clamp)
{
	var_776dc374 = var_9522f5ec - var_17a1aca9;
	var_747cbd92 = var_815dce62 - var_e5dbc91e;
	var_62e81a69 = var_e5dbc91e - var_17a1aca9;
	var_b36ea470 = vectordot(var_776dc374, var_776dc374);
	var_ccfa5787 = vectordot(var_776dc374, var_747cbd92);
	var_d6bc6b0b = vectordot(var_776dc374, var_62e81a69);
	var_d0cdde0e = vectordot(var_747cbd92, var_747cbd92);
	var_1861ed41 = vectordot(var_747cbd92, var_62e81a69);
	var_a3676a4c = (var_b36ea470 * var_d0cdde0e) - (var_ccfa5787 * var_ccfa5787);
	var_75358de9 = (var_b36ea470 * var_d0cdde0e) - (var_ccfa5787 * var_ccfa5787);
	if(var_a3676a4c == 0 || var_75358de9 == 0)
	{
		return undefined;
	}
	ta = ((var_ccfa5787 * -1) * var_1861ed41) + (var_d6bc6b0b * var_d0cdde0e) / (var_b36ea470 * var_d0cdde0e) - (var_ccfa5787 * var_ccfa5787);
	tb = (var_ccfa5787 * var_d6bc6b0b) - (var_1861ed41 * var_b36ea470) / (var_b36ea470 * var_d0cdde0e) - (var_ccfa5787 * var_ccfa5787);
	pointa = var_17a1aca9 + (var_776dc374 * ta);
	pointb = var_e5dbc91e + (var_747cbd92 * tb);
	if(clamp)
	{
		pointa = function_8dd4c3c5(var_17a1aca9, var_9522f5ec, pointa);
		pointb = function_8dd4c3c5(var_e5dbc91e, var_815dce62, pointb);
	}
	pointstruct = {#pointb:pointb, #pointa:pointa};
	return pointstruct;
}

/*
	Name: get_2d_yaw
	Namespace: math
	Checksum: 0x41BFFAFE
	Offset: 0x15F8
	Size: 0x5A
	Parameters: 2
	Flags: Linked
*/
function get_2d_yaw(start, end)
{
	vector = (end[0] - start[0], end[1] - start[1], 0);
	return vec_to_angles(vector);
}

/*
	Name: vec_to_angles
	Namespace: math
	Checksum: 0x40D18D10
	Offset: 0x1660
	Size: 0xD0
	Parameters: 1
	Flags: Linked
*/
function vec_to_angles(vector)
{
	yaw = 0;
	vecx = vector[0];
	vecy = vector[1];
	if(vecx == 0 && vecy == 0)
	{
		return 0;
	}
	if(vecy < 0.001 && vecy > -0.001)
	{
		vecy = 0.001;
	}
	yaw = atan(vecx / vecy);
	if(vecy < 0)
	{
		yaw = yaw + 180;
	}
	return 90 - yaw;
}

/*
	Name: pow
	Namespace: math
	Checksum: 0x850DEFF
	Offset: 0x1738
	Size: 0x68
	Parameters: 2
	Flags: Linked
*/
function pow(base, exp)
{
	if(exp == 0)
	{
		return 1;
	}
	result = base;
	for(i = 0; i < exp - 1; i++)
	{
		result = result * base;
	}
	return result;
}

/*
	Name: function_b1820790
	Namespace: math
	Checksum: 0x407C354B
	Offset: 0x17A8
	Size: 0x76
	Parameters: 4
	Flags: None
*/
function function_b1820790(a, b, c, var_2bff268f)
{
	var_9f942cf4 = var_2bff268f * 0.01745329;
	radius = b + (a * (pow(var_9f942cf4, 1 / c)));
	return radius;
}

/*
	Name: normalize_value
	Namespace: math
	Checksum: 0xB1E5EEBB
	Offset: 0x1828
	Size: 0xC2
	Parameters: 3
	Flags: Linked
*/
function normalize_value(var_71129b42, var_83593fcf, var_7e18701b)
{
	if(var_71129b42 > var_83593fcf)
	{
		upper = var_71129b42;
		var_71129b42 = var_83593fcf;
		var_83593fcf = upper;
	}
	if(var_7e18701b > var_83593fcf)
	{
		return 1;
	}
	if(var_7e18701b < var_71129b42)
	{
		return 0;
	}
	if(var_71129b42 == var_83593fcf)
	{
		/#
			assertmsg(((("" + var_71129b42) + "") + var_83593fcf) + "");
		#/
	}
	return (var_7e18701b - var_71129b42) / (var_83593fcf - var_71129b42);
}

/*
	Name: factor_value
	Namespace: math
	Checksum: 0xF7B8AAA5
	Offset: 0x18F8
	Size: 0x34
	Parameters: 3
	Flags: Linked
*/
function factor_value(min_val, max_val, var_d3fd1d40)
{
	return (max_val * var_d3fd1d40) + (min_val * (1 - var_d3fd1d40));
}

