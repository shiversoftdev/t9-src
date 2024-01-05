#using scripts\core_common\struct.csc;

#namespace territory;

/*
	Name: function_c0de0601
	Namespace: territory
	Checksum: 0x9A89638
	Offset: 0x70
	Size: 0x32
	Parameters: 0
	Flags: Linked
*/
function function_c0de0601()
{
	return isdefined(level.territory) && level.territory.name != "";
}

/*
	Name: get_center
	Namespace: territory
	Checksum: 0x73CE3F
	Offset: 0xB0
	Size: 0xF6
	Parameters: 1
	Flags: None
*/
function get_center(territory)
{
	if(!isdefined(territory))
	{
		territory = level.territory;
	}
	center = (0, 0, 0);
	if(!function_c0de0601() || territory.bounds.size <= 0)
	{
		return center;
	}
	foreach(boundary in territory.bounds)
	{
		center = center + boundary.origin;
	}
	return center / territory.bounds.size;
}

/*
	Name: get_radius
	Namespace: territory
	Checksum: 0x860C3701
	Offset: 0x1B0
	Size: 0x230
	Parameters: 1
	Flags: None
*/
function get_radius(territory)
{
	if(!isdefined(territory))
	{
		territory = level.territory;
	}
	absmins = [];
	absmaxs = [];
	if(!isstruct(territory) || !isarray(territory.bounds))
	{
		return;
	}
	foreach(bound in territory.bounds)
	{
		var_f3ba0cb3 = bound.origin + bound.mins;
		var_cd8bd6d = bound.origin + bound.maxs;
		for(i = 0; i < 3; i++)
		{
			if(!isdefined(absmins[i]))
			{
				absmins[i] = var_f3ba0cb3[i];
			}
			if(!isdefined(absmaxs[i]))
			{
				absmaxs[i] = var_cd8bd6d[i];
			}
			absmins[i] = min(absmins[i], var_f3ba0cb3[i]);
			absmaxs[i] = max(absmaxs[i], var_cd8bd6d[i]);
		}
	}
	var_e39d7c94 = (absmins[0], absmins[1], 0);
	var_51941864 = (absmaxs[0], absmaxs[1], 0);
	return distance2d(var_e39d7c94, var_51941864) / 2;
}

/*
	Name: is_inside
	Namespace: territory
	Checksum: 0x9BF3E36F
	Offset: 0x3E8
	Size: 0x18A
	Parameters: 3
	Flags: Linked
*/
function is_inside(point, var_73362d27, territory)
{
	if(!isdefined(var_73362d27))
	{
		var_73362d27 = 0;
	}
	if(!isdefined(territory))
	{
		territory = level.territory;
	}
	if(!function_c0de0601())
	{
		return true;
	}
	if(!isvec(point))
	{
		/#
			assert(0);
		#/
		return false;
	}
	if(!isdefined(territory.bounds) || territory.bounds.size == 0)
	{
		return true;
	}
	foreach(boundary in territory.bounds)
	{
		testpoint = point;
		if(var_73362d27)
		{
			testpoint = (testpoint[0], testpoint[1], boundary.origin[2]);
		}
		if(boundary istouching(testpoint))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: is_valid
	Namespace: territory
	Checksum: 0x2F598B4A
	Offset: 0x580
	Size: 0x6A
	Parameters: 2
	Flags: Linked
*/
function is_valid(object, territory)
{
	if(!isdefined(territory))
	{
		territory = level.territory;
	}
	if(isdefined(territory.var_87da0e2c) && isdefined(object.var_87da0e2c) && territory.var_87da0e2c != object.var_87da0e2c)
	{
		return false;
	}
	return true;
}

/*
	Name: function_b3791221
	Namespace: territory
	Checksum: 0x76346873
	Offset: 0x5F8
	Size: 0x2DC
	Parameters: 2
	Flags: None
*/
function function_b3791221(maxattempts, territory)
{
	if(!isdefined(maxattempts))
	{
		maxattempts = 10;
	}
	if(!isdefined(territory))
	{
		territory = level.territory;
	}
	if(!function_c0de0601())
	{
		return;
	}
	absmins = [];
	absmaxs = [];
	if(!isstruct(territory) || !isarray(territory.bounds))
	{
		return;
	}
	foreach(bound in territory.bounds)
	{
		var_f3ba0cb3 = bound.origin + bound.mins;
		var_cd8bd6d = bound.origin + bound.maxs;
		for(i = 0; i < 3; i++)
		{
			if(!isdefined(absmins[i]))
			{
				absmins[i] = var_f3ba0cb3[i];
			}
			if(!isdefined(absmaxs[i]))
			{
				absmaxs[i] = var_cd8bd6d[i];
			}
			absmins[i] = min(absmins[i], var_f3ba0cb3[i]);
			absmaxs[i] = max(absmaxs[i], var_cd8bd6d[i]);
		}
	}
	if(absmins.size <= 0 || absmaxs.size <= 0)
	{
		return;
	}
	for(index = 0; index < maxattempts; index++)
	{
		point = [];
		for(i = 0; i < 3; i++)
		{
			point[i] = randomfloatrange(absmins[i], absmaxs[i]);
		}
		randompoint = (point[0], point[1], point[2]);
		if(is_inside(randompoint, undefined, territory))
		{
			return randompoint;
		}
	}
}

/*
	Name: get_struct_array
	Namespace: territory
	Checksum: 0xEAD2DB42
	Offset: 0x8E0
	Size: 0x6A
	Parameters: 3
	Flags: Linked
*/
function get_struct_array(name, key, territory)
{
	if(!isdefined(territory))
	{
		territory = level.territory;
	}
	structs = struct::get_array(name, key);
	return function_39dd704c(structs, territory);
}

/*
	Name: function_39dd704c
	Namespace: territory
	Checksum: 0x73E29B66
	Offset: 0x958
	Size: 0x19E
	Parameters: 2
	Flags: Linked
*/
function function_39dd704c(objects, territory)
{
	validobjects = [];
	if(!isdefined(territory) || !isdefined(territory.name) || territory.name == "")
	{
		foreach(object in objects)
		{
			if(!isdefined(object.var_87da0e2c))
			{
				validobjects[validobjects.size] = object;
			}
		}
	}
	else
	{
		foreach(object in objects)
		{
			if(!is_valid(object, territory))
			{
				continue;
			}
			if(!is_inside(object.origin, undefined, territory))
			{
				continue;
			}
			validobjects[validobjects.size] = object;
		}
	}
	return validobjects;
}

