#namespace math_shared;

/*
	Name: function_60b8033
	Namespace: math_shared
	Checksum: 0x8DD83960
	Offset: 0x60
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_60b8033()
{
	level notify(1557606703);
}

#namespace math;

/*
	Name: clamp
	Namespace: math
	Checksum: 0x13D9E559
	Offset: 0x80
	Size: 0x44
	Parameters: 3
	Flags: Linked
*/
function clamp(val, val_min, val_max)
{
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
	Checksum: 0xCD76AA72
	Offset: 0xD0
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
	Name: array_average
	Namespace: math
	Checksum: 0x8176EFD8
	Offset: 0x170
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
	Checksum: 0x9E2B3F56
	Offset: 0x210
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
	Name: vector_compare
	Namespace: math
	Checksum: 0xCB6014D9
	Offset: 0x318
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
	Checksum: 0x2EDA4AD9
	Offset: 0x3C0
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
	Checksum: 0x2B5AD6A0
	Offset: 0x438
	Size: 0x68
	Parameters: 2
	Flags: None
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
	Checksum: 0x4E4C41C1
	Offset: 0x4A8
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function sign(x)
{
	if(x >= 0)
	{
		return 1;
	}
	return -1;
}

/*
	Name: randomsign
	Namespace: math
	Checksum: 0x7682F2D
	Offset: 0x4D8
	Size: 0x2E
	Parameters: 0
	Flags: None
*/
function randomsign()
{
	return ((randomintrange(-1, 1)) >= 0 ? 1 : -1);
}

/*
	Name: cointoss
	Namespace: math
	Checksum: 0x14E4E0F3
	Offset: 0x510
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

