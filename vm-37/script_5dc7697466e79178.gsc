#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace location;

/*
	Name: function_89f2df9
	Namespace: location
	Checksum: 0xC6B9EF73
	Offset: 0x88
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"location", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: location
	Checksum: 0xDE79E0E1
	Offset: 0xD0
	Size: 0x24
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	level.locations = [];
	function_d1b7504e();
}

/*
	Name: function_d1b7504e
	Namespace: location
	Checksum: 0x8CE1AEE3
	Offset: 0x100
	Size: 0x10C
	Parameters: 0
	Flags: None
*/
function function_d1b7504e()
{
	var_74fed7b1 = struct::get_array("map_location");
	foreach(map_location in var_74fed7b1)
	{
		if(!isdefined(level.location))
		{
			level.location = [];
		}
		else if(!isarray(level.location))
		{
			level.location = array(level.location);
		}
		level.location[level.location.size] = map_location;
	}
}

/*
	Name: function_18dac968
	Namespace: location
	Checksum: 0x73EF6C9F
	Offset: 0x218
	Size: 0xFC
	Parameters: 4
	Flags: None
*/
function function_18dac968(origin, height, width, radius)
{
	location = {#radius:radius, #width:width, #height:height, #origin:origin};
	if(!isdefined(level.location))
	{
		level.location = [];
	}
	else if(!isarray(level.location))
	{
		level.location = array(level.location);
	}
	level.location[level.location.size] = location;
	return location;
}

/*
	Name: function_2e7ce8a0
	Namespace: location
	Checksum: 0xBB954042
	Offset: 0x320
	Size: 0x1A
	Parameters: 0
	Flags: None
*/
function function_2e7ce8a0()
{
	return array::random(level.location);
}

/*
	Name: function_98eed213
	Namespace: location
	Checksum: 0x3E156C3C
	Offset: 0x348
	Size: 0x108
	Parameters: 1
	Flags: None
*/
function function_98eed213(location)
{
	xoffset = 0;
	yoffset = 0;
	if(location.width > 0)
	{
		halfwidth = location.width / 2;
		xoffset = randomfloatrange(halfwidth * -1, halfwidth);
	}
	if(location.height > 0)
	{
		halfheight = location.height / 2;
		yoffset = randomfloatrange(halfheight * -1, halfheight);
	}
	origin = (location.origin[0] + xoffset, location.origin[1] + yoffset, location.origin[2]);
	return origin;
}

