#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace location;

/*
	Name: function_279d9f12
	Namespace: location
	Checksum: 0xEE09E64E
	Offset: 0x88
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_279d9f12()
{
	level notify(-623456989);
}

/*
	Name: __init__system__
	Namespace: location
	Checksum: 0x69964807
	Offset: 0xA8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"location", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: location
	Checksum: 0xCF75D6E0
	Offset: 0xF0
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
	Checksum: 0xCEDABE75
	Offset: 0x120
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
	Checksum: 0x845717AD
	Offset: 0x238
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
	Checksum: 0x57028C90
	Offset: 0x340
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
	Checksum: 0x393346DC
	Offset: 0x368
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

