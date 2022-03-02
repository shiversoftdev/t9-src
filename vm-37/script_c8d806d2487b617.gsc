#using scripts\core_common\util_shared.gsc;

#namespace namespace_956bd4dd;

/*
	Name: function_f45ee99d
	Namespace: namespace_956bd4dd
	Checksum: 0xA881C997
	Offset: 0x78
	Size: 0x4A
	Parameters: 0
	Flags: Linked
*/
function function_f45ee99d()
{
	if(isdefined(level.radiation))
	{
		return;
	}
	level.radiation = {};
	level.radiation.levels = [];
	level.radiation.sickness = [];
}

/*
	Name: function_df1ecefe
	Namespace: namespace_956bd4dd
	Checksum: 0x10BC8BB1
	Offset: 0xD0
	Size: 0x10C
	Parameters: 4
	Flags: None
*/
function function_df1ecefe(maxhealth, var_1263c72f, var_9653dad7, var_21a59205)
{
	if(!isdefined(var_9653dad7))
	{
		var_9653dad7 = 0;
	}
	if(!isdefined(var_21a59205))
	{
		var_21a59205 = 2147483647;
	}
	if(!function_ab99e60c())
	{
		return;
	}
	function_f45ee99d();
	radiationlevel = spawnstruct();
	radiationlevel.maxhealth = maxhealth;
	radiationlevel.sickness = [];
	radiationlevel.var_e8f27947 = int(var_1263c72f * 1000);
	radiationlevel.var_9653dad7 = var_9653dad7;
	radiationlevel.var_21a59205 = var_21a59205;
	level.radiation.levels[level.radiation.levels.size] = radiationlevel;
}

/*
	Name: function_1cb3c52d
	Namespace: namespace_956bd4dd
	Checksum: 0x7E28BD1B
	Offset: 0x1E8
	Size: 0x1DC
	Parameters: 4
	Flags: None
*/
function function_1cb3c52d(name, radiationlevel, duration, var_4267b283)
{
	if(!isdefined(var_4267b283))
	{
		var_4267b283 = #"hash_4ae27316c3f95575";
	}
	if(!function_ab99e60c())
	{
		return;
	}
	function_f45ee99d();
	if(!isint(radiationlevel) || !isint(duration) || !function_7a600918(name))
	{
		/#
			assert(0);
		#/
		return;
	}
	if(level.radiation.levels.size <= radiationlevel)
	{
		/#
			assertmsg(("" + radiationlevel) + "");
		#/
		return;
	}
	radiation = level.radiation.levels[radiationlevel];
	if(isdefined(radiation.sickness[name]))
	{
		/#
			assertmsg(("" + name) + "");
		#/
		return;
	}
	var_46bdb64c = spawnstruct();
	var_46bdb64c.duration = int(duration * 1000);
	var_46bdb64c.var_4bd5611f = var_4267b283;
	radiation.sickness[name] = var_46bdb64c;
}

/*
	Name: function_6b384c0f
	Namespace: namespace_956bd4dd
	Checksum: 0x835A34FD
	Offset: 0x3D0
	Size: 0x94
	Parameters: 2
	Flags: Linked
*/
function function_6b384c0f(radiationlevel, sickness)
{
	var_7720923c = level.radiation.levels[radiationlevel];
	keys = getarraykeys(var_7720923c.sickness);
	for(index = 0; index < keys.size; index++)
	{
		if(keys[index] == sickness)
		{
			return index;
		}
	}
}

/*
	Name: function_ab99e60c
	Namespace: namespace_956bd4dd
	Checksum: 0x7965DEFD
	Offset: 0x470
	Size: 0x84
	Parameters: 0
	Flags: Linked
*/
function function_ab99e60c()
{
	if(util::function_3f165ee8())
	{
		return 0;
	}
	return currentsessionmode() != 4 && is_true((isdefined(getgametypesetting("wzRadiation")) ? getgametypesetting("wzRadiation") : 0));
}

