#using scripts\core_common\util_shared.csc;

#namespace ai_shared;

/*
	Name: main
	Namespace: ai_shared
	Checksum: 0x61FB5198
	Offset: 0x70
	Size: 0x34
	Parameters: 0
	Flags: AutoExec
*/
function autoexec main()
{
	level._customactorcbfunc = &ai::spawned_callback;
	level.var_9d3b5cf9 = &ai::function_b1897fe1;
}

#namespace ai;

/*
	Name: add_ai_spawn_function
	Namespace: ai
	Checksum: 0xB1B4A105
	Offset: 0xB0
	Size: 0x128
	Parameters: 2
	Flags: Linked, Variadic
*/
function add_ai_spawn_function(func_spawn, ...)
{
	if(!isdefined(level.var_71b23817))
	{
		level.var_71b23817 = [];
	}
	else if(!isarray(level.var_71b23817))
	{
		level.var_71b23817 = array(level.var_71b23817);
	}
	var_e45a16f3 = {#params:vararg, #func:func_spawn};
	if(!isdefined(level.var_71b23817))
	{
		level.var_71b23817 = [];
	}
	else if(!isarray(level.var_71b23817))
	{
		level.var_71b23817 = array(level.var_71b23817);
	}
	level.var_71b23817[level.var_71b23817.size] = var_e45a16f3;
}

/*
	Name: function_932006d1
	Namespace: ai
	Checksum: 0x3E8851BD
	Offset: 0x1E0
	Size: 0xC2
	Parameters: 1
	Flags: None
*/
function function_932006d1(func_spawn)
{
	if(!isdefined(level.var_71b23817))
	{
		return;
	}
	foreach(var_e45a16f3 in level.var_71b23817)
	{
		if(var_e45a16f3.func == func_spawn)
		{
			arrayremovevalue(level.var_71b23817, var_e45a16f3);
			return;
		}
	}
}

/*
	Name: function_2315ecfa
	Namespace: ai
	Checksum: 0x3D3C897B
	Offset: 0x2B0
	Size: 0x128
	Parameters: 2
	Flags: Linked, Variadic
*/
function function_2315ecfa(func_spawn, ...)
{
	if(!isdefined(level.var_e851abcc))
	{
		level.var_e851abcc = [];
	}
	else if(!isarray(level.var_e851abcc))
	{
		level.var_e851abcc = array(level.var_e851abcc);
	}
	var_3518f423 = {#params:vararg, #func:func_spawn};
	if(!isdefined(level.var_e851abcc))
	{
		level.var_e851abcc = [];
	}
	else if(!isarray(level.var_e851abcc))
	{
		level.var_e851abcc = array(level.var_e851abcc);
	}
	level.var_e851abcc[level.var_e851abcc.size] = var_3518f423;
}

/*
	Name: function_26fc775a
	Namespace: ai
	Checksum: 0xF1D009C8
	Offset: 0x3E0
	Size: 0xC2
	Parameters: 1
	Flags: None
*/
function function_26fc775a(func_spawn)
{
	if(!isdefined(level.var_e851abcc))
	{
		return;
	}
	foreach(var_3518f423 in level.var_e851abcc)
	{
		if(var_3518f423.func == func_spawn)
		{
			arrayremovevalue(level.var_e851abcc, var_3518f423);
			return;
		}
	}
}

/*
	Name: add_archetype_spawn_function
	Namespace: ai
	Checksum: 0x97EC464
	Offset: 0x4B0
	Size: 0x1C2
	Parameters: 3
	Flags: Linked, Variadic
*/
function add_archetype_spawn_function(str_archetype, func_spawn, ...)
{
	if(!isdefined(level.var_c18b23c1))
	{
		level.var_c18b23c1 = [];
	}
	else if(!isarray(level.var_c18b23c1))
	{
		level.var_c18b23c1 = array(level.var_c18b23c1);
	}
	if(!isdefined(level.var_c18b23c1[str_archetype]))
	{
		level.var_c18b23c1[str_archetype] = [];
	}
	else if(!isarray(level.var_c18b23c1[str_archetype]))
	{
		level.var_c18b23c1[str_archetype] = array(level.var_c18b23c1[str_archetype]);
	}
	var_6d69c0bf = {#params:vararg, #func:func_spawn};
	if(!isdefined(level.var_c18b23c1[str_archetype]))
	{
		level.var_c18b23c1[str_archetype] = [];
	}
	else if(!isarray(level.var_c18b23c1[str_archetype]))
	{
		level.var_c18b23c1[str_archetype] = array(level.var_c18b23c1[str_archetype]);
	}
	level.var_c18b23c1[str_archetype][level.var_c18b23c1[str_archetype].size] = var_6d69c0bf;
}

/*
	Name: spawned_callback
	Namespace: ai
	Checksum: 0xD394E8A6
	Offset: 0x680
	Size: 0x260
	Parameters: 1
	Flags: Linked
*/
function spawned_callback(localclientnum)
{
	if(isdefined(level.var_71b23817))
	{
		foreach(var_e45a16f3 in level.var_71b23817)
		{
			a_args = arraycombine(array(localclientnum), var_e45a16f3.params, 1, 0);
			util::single_func_argarray(self, var_e45a16f3.func, a_args);
		}
	}
	if(isdefined(level.var_c18b23c1) && isdefined(level.var_c18b23c1[self.archetype]))
	{
		foreach(var_6d69c0bf in level.var_c18b23c1[self.archetype])
		{
			a_args = arraycombine(array(localclientnum), var_6d69c0bf.params, 1, 0);
			util::single_func_argarray(self, var_6d69c0bf.func, a_args);
		}
	}
	if(!sessionmodeiscampaigngame())
	{
		if(!isdefined(level.var_213c4d20))
		{
			level.var_213c4d20 = [];
		}
		if(isdefined(self.aitype) && !isdefined(level.var_213c4d20[self.aitype]))
		{
			function_cae618b4(self.aitype);
			level.var_213c4d20[self.aitype] = 1;
		}
	}
}

/*
	Name: function_b1897fe1
	Namespace: ai
	Checksum: 0x10D9BC56
	Offset: 0x8E8
	Size: 0xE8
	Parameters: 1
	Flags: Linked
*/
function function_b1897fe1(localclientnum)
{
	if(isdefined(level.var_e851abcc))
	{
		foreach(var_3518f423 in level.var_e851abcc)
		{
			a_args = arraycombine(array(localclientnum), var_3518f423.params, 1, 0);
			util::single_func_argarray(self, var_3518f423.func, a_args);
		}
	}
}

/*
	Name: shouldregisterclientfieldforarchetype
	Namespace: ai
	Checksum: 0x3CC9C4EA
	Offset: 0x9D8
	Size: 0x4A
	Parameters: 1
	Flags: None
*/
function shouldregisterclientfieldforarchetype(archetype)
{
	if(is_true(level.clientfieldaicheck) && !isarchetypeloaded(archetype))
	{
		return false;
	}
	return true;
}

/*
	Name: function_9139c839
	Namespace: ai
	Checksum: 0x8CEADFB4
	Offset: 0xA30
	Size: 0xE4
	Parameters: 0
	Flags: Linked
*/
function function_9139c839()
{
	if(!isdefined(self.var_76167463))
	{
		if(isdefined(self.aisettingsbundle))
		{
			settingsbundle = self.aisettingsbundle;
		}
		else if(isdefined(self.scriptbundlesettings))
		{
			settingsbundle = getscriptbundle(self.scriptbundlesettings).aisettingsbundle;
		}
		if(!isdefined(settingsbundle))
		{
			return undefined;
		}
		self.var_76167463 = settingsbundle;
		if(!isdefined(level.var_e3a467cf))
		{
			level.var_e3a467cf = [];
		}
		if(!isdefined(level.var_e3a467cf[self.var_76167463]))
		{
			level.var_e3a467cf[self.var_76167463] = getscriptbundle(self.var_76167463);
		}
	}
	return level.var_e3a467cf[self.var_76167463];
}

/*
	Name: function_71919555
	Namespace: ai
	Checksum: 0x932A9973
	Offset: 0xB20
	Size: 0xD6
	Parameters: 3
	Flags: None
*/
function function_71919555(var_45302432, fieldname, archetype)
{
	if(!isdefined(level.var_e3a467cf))
	{
		level.var_e3a467cf = [];
	}
	if(!isdefined(level.var_e3a467cf[var_45302432]))
	{
		level.var_e3a467cf[var_45302432] = getscriptbundle(var_45302432);
	}
	if(isdefined(level.var_e3a467cf[var_45302432]))
	{
		if(isdefined(archetype))
		{
			return level.var_e3a467cf[var_45302432].((archetype + "_") + fieldname);
		}
		return level.var_e3a467cf[var_45302432].(fieldname);
	}
	return undefined;
}

