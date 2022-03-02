#using scripts\core_common\util_shared.csc;

#namespace ai_shared;

/*
	Name: function_64da4c6c
	Namespace: ai_shared
	Checksum: 0xAE65BCDB
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_64da4c6c()
{
	level notify(39365704);
}

/*
	Name: main
	Namespace: ai_shared
	Checksum: 0xCA5972B9
	Offset: 0x90
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
	Checksum: 0x81AEE686
	Offset: 0xD0
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
	Checksum: 0x2AC22DE6
	Offset: 0x200
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
	Checksum: 0x3BFB45C4
	Offset: 0x2D0
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
	Checksum: 0x7091566F
	Offset: 0x400
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
	Checksum: 0x7B0705BF
	Offset: 0x4D0
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
	Checksum: 0x73A35B58
	Offset: 0x6A0
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
	Checksum: 0xC19818AD
	Offset: 0x908
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
	Checksum: 0x796A70A7
	Offset: 0x9F8
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
	Checksum: 0xD7702454
	Offset: 0xA50
	Size: 0xE4
	Parameters: 0
	Flags: Linked
*/
function function_9139c839()
{
	if(!isdefined(self.var_76167463))
	{
		if(isdefined(self.var_ae8ec545))
		{
			var_51d5c26f = self.var_ae8ec545;
		}
		else if(isdefined(self.scriptbundlesettings))
		{
			var_51d5c26f = getscriptbundle(self.scriptbundlesettings).var_ae8ec545;
		}
		if(!isdefined(var_51d5c26f))
		{
			return undefined;
		}
		self.var_76167463 = var_51d5c26f;
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
	Checksum: 0xA2053FFC
	Offset: 0xB40
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

