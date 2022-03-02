#using scripts\core_common\util_shared.csc;

#namespace namespace_956bd4dd;

/*
	Name: function_5453bbdd
	Namespace: namespace_956bd4dd
	Checksum: 0x7477AD43
	Offset: 0x78
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_5453bbdd()
{
	level notify(1566209669);
}

/*
	Name: function_f45ee99d
	Namespace: namespace_956bd4dd
	Checksum: 0x32C41AAC
	Offset: 0x98
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
	Checksum: 0x2605A8E3
	Offset: 0xF0
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
	Checksum: 0x21C2DBD4
	Offset: 0x208
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
	Checksum: 0xE8AE75B4
	Offset: 0x3F0
	Size: 0x94
	Parameters: 2
	Flags: None
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
	Checksum: 0xD5D40ABF
	Offset: 0x490
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

