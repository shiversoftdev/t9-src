#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\math_shared.gsc;

#namespace easing;

/*
	Name: __init__system__
	Namespace: easing
	Checksum: 0xFD8B17DB
	Offset: 0x78
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"easing", &function_810d6d3a, undefined, undefined, undefined);
}

/*
	Name: function_810d6d3a
	Namespace: easing
	Checksum: 0x11D95C8
	Offset: 0xC0
	Size: 0x1EC
	Parameters: 0
	Flags: None
*/
function function_810d6d3a()
{
	level.var_b649495c = [];
	level.var_b649495c[#"linear"] = &function_a9f5c57d;
	level.var_b649495c[#"power"] = &function_492ef475;
	level.var_b649495c[#"quadratic"] = &function_db98dad1;
	level.var_b649495c[#"cubic"] = &function_237ad8ca;
	level.var_b649495c[#"quartic"] = &function_79315b1d;
	level.var_b649495c[#"hash_2080bcb1cad7945c"] = &function_858ecd2d;
	level.var_b649495c[#"exponential"] = &function_95a842a;
	level.var_b649495c[#"hash_2de1684e2167ada4"] = &function_eec2a804;
	level.var_b649495c[#"sine"] = &function_aab5c503;
	level.var_b649495c[#"back"] = &function_da7df29;
	level.var_b649495c[#"hash_77881ce206b89ce8"] = &function_d912ff48;
	level.var_b649495c[#"bounce"] = &function_6aeb681d;
}

/*
	Name: function_a9f5c57d
	Namespace: easing
	Checksum: 0x5A9E0562
	Offset: 0x2B8
	Size: 0x46
	Parameters: 5
	Flags: None
*/
function function_a9f5c57d(start, end, pct, var_7cbb9c6a, var_1e24f51b)
{
	return ((1 - var_1e24f51b) * pct) + (var_1e24f51b * var_7cbb9c6a);
}

/*
	Name: function_492ef475
	Namespace: easing
	Checksum: 0x3D5762C8
	Offset: 0x308
	Size: 0x72
	Parameters: 6
	Flags: None
*/
function function_492ef475(start, end, pct, var_7cbb9c6a, var_1e24f51b, power)
{
	pct = easepower(pct, power, var_7cbb9c6a, var_1e24f51b);
	return ((1 - pct) * start) + (pct * end);
}

/*
	Name: function_db98dad1
	Namespace: easing
	Checksum: 0x52C0E2ED
	Offset: 0x388
	Size: 0x6A
	Parameters: 5
	Flags: None
*/
function function_db98dad1(start, end, pct, var_7cbb9c6a, var_1e24f51b)
{
	pct = easepower(pct, 2, var_7cbb9c6a, var_1e24f51b);
	return ((1 - pct) * start) + (pct * end);
}

/*
	Name: function_237ad8ca
	Namespace: easing
	Checksum: 0xCDD8E979
	Offset: 0x400
	Size: 0x6A
	Parameters: 5
	Flags: None
*/
function function_237ad8ca(start, end, pct, var_7cbb9c6a, var_1e24f51b)
{
	pct = easepower(pct, 3, var_7cbb9c6a, var_1e24f51b);
	return ((1 - pct) * start) + (pct * end);
}

/*
	Name: function_79315b1d
	Namespace: easing
	Checksum: 0x2CD43970
	Offset: 0x478
	Size: 0x6A
	Parameters: 5
	Flags: None
*/
function function_79315b1d(start, end, pct, var_7cbb9c6a, var_1e24f51b)
{
	pct = easepower(pct, 4, var_7cbb9c6a, var_1e24f51b);
	return ((1 - pct) * start) + (pct * end);
}

/*
	Name: function_858ecd2d
	Namespace: easing
	Checksum: 0xEFEB0131
	Offset: 0x4F0
	Size: 0x6A
	Parameters: 5
	Flags: None
*/
function function_858ecd2d(start, end, pct, var_7cbb9c6a, var_1e24f51b)
{
	pct = easepower(pct, 5, var_7cbb9c6a, var_1e24f51b);
	return ((1 - pct) * start) + (pct * end);
}

/*
	Name: function_95a842a
	Namespace: easing
	Checksum: 0xA7FEDC2C
	Offset: 0x568
	Size: 0x72
	Parameters: 6
	Flags: None
*/
function function_95a842a(start, end, pct, var_7cbb9c6a, var_1e24f51b, scale)
{
	pct = easeexponential(pct, scale, var_7cbb9c6a, var_1e24f51b);
	return ((1 - pct) * start) + (pct * end);
}

/*
	Name: function_eec2a804
	Namespace: easing
	Checksum: 0xE20A7CE
	Offset: 0x5E8
	Size: 0x72
	Parameters: 6
	Flags: None
*/
function function_eec2a804(start, end, pct, var_7cbb9c6a, var_1e24f51b, var_18da63b)
{
	pct = easelogarithmic(pct, var_18da63b, var_7cbb9c6a, var_1e24f51b);
	return ((1 - pct) * start) + (pct * end);
}

/*
	Name: function_aab5c503
	Namespace: easing
	Checksum: 0xC7C452F4
	Offset: 0x668
	Size: 0x62
	Parameters: 5
	Flags: None
*/
function function_aab5c503(start, end, pct, var_7cbb9c6a, var_1e24f51b)
{
	pct = easesine(pct, var_7cbb9c6a, var_1e24f51b);
	return ((1 - pct) * start) + (pct * end);
}

/*
	Name: function_da7df29
	Namespace: easing
	Checksum: 0x10BE4209
	Offset: 0x6D8
	Size: 0x7A
	Parameters: 7
	Flags: None
*/
function function_da7df29(start, end, pct, var_7cbb9c6a, var_1e24f51b, var_2d741986, power)
{
	pct = easeback(pct, var_2d741986, power, var_7cbb9c6a, var_1e24f51b);
	return ((1 - pct) * start) + (pct * end);
}

/*
	Name: function_d912ff48
	Namespace: easing
	Checksum: 0x791362DC
	Offset: 0x760
	Size: 0x82
	Parameters: 8
	Flags: None
*/
function function_d912ff48(start, end, pct, var_7cbb9c6a, var_1e24f51b, amplitude, frequency, var_6fe616d0)
{
	pct = easeelastic(pct, amplitude, frequency, var_6fe616d0, var_7cbb9c6a, var_1e24f51b);
	return ((1 - pct) * start) + (pct * end);
}

/*
	Name: function_6aeb681d
	Namespace: easing
	Checksum: 0x3C1DE48
	Offset: 0x7F0
	Size: 0x7A
	Parameters: 7
	Flags: None
*/
function function_6aeb681d(start, end, pct, var_7cbb9c6a, var_1e24f51b, bounces, var_574c3289)
{
	pct = easebounce(pct, bounces, var_574c3289, var_7cbb9c6a, var_1e24f51b);
	return ((1 - pct) * start) + (pct * end);
}

/*
	Name: function_8ff186e5
	Namespace: easing
	Checksum: 0xD9230CA8
	Offset: 0x878
	Size: 0x74
	Parameters: 3
	Flags: None
*/
function function_8ff186e5(var_b3160f0, dvar, var_c7ec7d60)
{
	if(is_true(var_c7ec7d60))
	{
		setsaveddvar(dvar, var_b3160f0.var_872a88cd);
	}
	else
	{
		setdvar(dvar, var_b3160f0.var_872a88cd);
	}
}

/*
	Name: function_54354e4e
	Namespace: easing
	Checksum: 0x7DBF9455
	Offset: 0x8F8
	Size: 0x112
	Parameters: 2
	Flags: None
*/
function function_54354e4e(var_b3160f0, axis)
{
	switch(axis)
	{
		case 0:
		{
			self.origin = (var_b3160f0.var_872a88cd, self.origin[1], self.origin[2]);
			break;
		}
		case 1:
		{
			self.origin = (self.origin[0], var_b3160f0.var_872a88cd, self.origin[2]);
			break;
		}
		case 2:
		{
			self.origin = (self.origin[0], self.origin[1], var_b3160f0.var_872a88cd);
			break;
		}
		default:
		{
			self.origin = var_b3160f0.var_872a88cd;
			break;
		}
	}
}

/*
	Name: function_92b063ff
	Namespace: easing
	Checksum: 0xA517EFDD
	Offset: 0xA18
	Size: 0xFA
	Parameters: 2
	Flags: None
*/
function function_92b063ff(var_b3160f0, axis)
{
	switch(axis)
	{
		case 0:
		{
			self.origin = self.origin + (var_b3160f0.delta, 0, 0);
			break;
		}
		case 1:
		{
			self.origin = self.origin + (0, var_b3160f0.delta, 0);
			break;
		}
		case 2:
		{
			self.origin = self.origin + (0, 0, var_b3160f0.delta);
			break;
		}
		default:
		{
			self.origin = self.origin + var_b3160f0.delta;
			break;
		}
	}
}

/*
	Name: function_3b3f9801
	Namespace: easing
	Checksum: 0xCDA29CAD
	Offset: 0xB20
	Size: 0x104
	Parameters: 2
	Flags: None
*/
function function_3b3f9801(var_b3160f0, axis)
{
	var_cad5b24d = float(function_60d95f53()) / 1000;
	angles = var_b3160f0.var_872a88cd;
	switch(axis)
	{
		case 0:
		{
			angles = (angles, 0, 0);
			break;
		}
		case 1:
		{
			angles = (0, angles, 0);
			break;
		}
		case 2:
		{
			angles = (0, 0, angles);
			break;
		}
	}
	self rotateto(var_b3160f0.var_872a88cd, var_cad5b24d);
}

/*
	Name: function_faea843b
	Namespace: easing
	Checksum: 0x9FCF5C0F
	Offset: 0xC30
	Size: 0x16E
	Parameters: 2
	Flags: None
*/
function function_faea843b(var_b3160f0, axis)
{
	switch(axis)
	{
		case 0:
		{
			self.angles = self.angles + (var_b3160f0.delta, 0, 0);
			break;
		}
		case 1:
		{
			self.angles = self.angles + (0, var_b3160f0.delta, 0);
			break;
		}
		case 2:
		{
			self.angles = self.angles + (0, 0, var_b3160f0.delta);
			break;
		}
		default:
		{
			self.angles = self.angles + var_b3160f0.delta;
			break;
		}
	}
	if(var_b3160f0.var_37e98bce)
	{
		self.angles = (angleclamp180(self.angles[0]), angleclamp180(self.angles[1]), angleclamp180(self.angles[2]));
	}
}

