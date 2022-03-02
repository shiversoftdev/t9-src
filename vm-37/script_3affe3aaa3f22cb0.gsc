#using script_54f593f5beb1464a;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_fa6b9ef8;

/*
	Name: function_89f2df9
	Namespace: namespace_fa6b9ef8
	Checksum: 0x136E537
	Offset: 0x98
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_1fd69f0c10bde41c", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_fa6b9ef8
	Checksum: 0x8031C63A
	Offset: 0xE0
	Size: 0x10
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	level.var_7d8da246 = [];
}

/*
	Name: function_82330491
	Namespace: namespace_fa6b9ef8
	Checksum: 0x126FFB83
	Offset: 0xF8
	Size: 0x1E8
	Parameters: 5
	Flags: Variadic
*/
function function_82330491(var_79cf244b, var_933cd28f, item, var_f27097cc, ...)
{
	/#
		assert(vararg.size > 0, "");
	#/
	var_9ba1646c = {#activation_func:undefined, #hash_849d923d:var_f27097cc, #hash_3845495:[], #hash_a531c26d:item, #hash_2b469a7d:var_933cd28f};
	for(i = 0; i < vararg.size; i++)
	{
		if(!isdefined(var_9ba1646c.var_3845495))
		{
			var_9ba1646c.var_3845495 = [];
		}
		else if(!isarray(var_9ba1646c.var_3845495))
		{
			var_9ba1646c.var_3845495 = array(var_9ba1646c.var_3845495);
		}
		var_9ba1646c.var_3845495[var_9ba1646c.var_3845495.size] = vararg[i];
	}
	if(!isdefined(var_9ba1646c.var_3845495))
	{
		var_9ba1646c.var_3845495 = [];
	}
	else if(!isarray(var_9ba1646c.var_3845495))
	{
		var_9ba1646c.var_3845495 = array(var_9ba1646c.var_3845495);
	}
	var_9ba1646c.var_3845495[var_9ba1646c.var_3845495.size] = #"hash_3f07579f66b464e8";
	level.var_7d8da246[var_79cf244b] = var_9ba1646c;
}

/*
	Name: function_90ee7a97
	Namespace: namespace_fa6b9ef8
	Checksum: 0xA13B2376
	Offset: 0x2E8
	Size: 0xAA
	Parameters: 2
	Flags: None
*/
function function_90ee7a97(var_79cf244b, activation_func)
{
	var_9ba1646c = level.var_7d8da246[var_79cf244b];
	if(!isdefined(var_9ba1646c))
	{
		/#
			/#
				assertmsg(("" + function_9e72a96(var_79cf244b)) + "");
			#/
		#/
		return;
	}
	if(!isdefined(activation_func))
	{
		/#
			/#
				assertmsg("");
			#/
		#/
		return;
	}
	var_9ba1646c.activation_func = activation_func;
}

/*
	Name: function_c67a5089
	Namespace: namespace_fa6b9ef8
	Checksum: 0xFB86094A
	Offset: 0x3A0
	Size: 0x6D0
	Parameters: 0
	Flags: None
*/
function function_c67a5089()
{
	if(!isdefined(level.var_7d8da246) || level.var_7d8da246.size == 0)
	{
		return;
	}
	level.var_4c71ec6c = [];
	foreach(var_79cf244b, var_9ba1646c in level.var_7d8da246)
	{
		array::add_sorted(level.var_4c71ec6c, var_79cf244b, 0, &function_f53ec921);
	}
	var_743d50f5 = [];
	foreach(var_79cf244b in level.var_4c71ec6c)
	{
		if(!isdefined(level.var_7d8da246[var_79cf244b]))
		{
			continue;
		}
		var_9ba1646c = level.var_7d8da246[var_79cf244b];
		if(isdefined(var_9ba1646c.var_849d923d) && [[var_9ba1646c.var_849d923d]]())
		{
			if(!isdefined(var_743d50f5))
			{
				var_743d50f5 = [];
			}
			else if(!isarray(var_743d50f5))
			{
				var_743d50f5 = array(var_743d50f5);
			}
			var_743d50f5[var_743d50f5.size] = var_79cf244b;
		}
	}
	level.var_755e455a = [];
	level.var_c70f02d7 = undefined;
	if(is_true(getgametypesetting(#"hash_58981ece00ffa6bc")))
	{
		var_f279f28f = [];
		for(i = 0; i < var_743d50f5.size; i++)
		{
			if(var_743d50f5[i] == #"hash_de683235345aa4b" || var_743d50f5[i] == #"hash_7c61b9fd505b42dc" || var_743d50f5[i] == #"hash_4dcc9053e0685c94" || var_743d50f5[i] == #"hash_77a2176db1d8a05c" || var_743d50f5[i] == "#dempsey_unlock" || var_743d50f5[i] == #"hash_4bb047708704a065" || var_743d50f5[i] == #"hash_7993541af41c24ec" || var_743d50f5[i] == #"hash_3e631def73c3efa8")
			{
				if(!isdefined(var_f279f28f))
				{
					var_f279f28f = [];
				}
				else if(!isarray(var_f279f28f))
				{
					var_f279f28f = array(var_f279f28f);
				}
				var_f279f28f[var_f279f28f.size] = var_743d50f5[i];
			}
		}
		if(var_f279f28f.size > 0)
		{
			random_index = function_d59c2d03(var_f279f28f.size);
			if(!isdefined(level.var_755e455a))
			{
				level.var_755e455a = [];
			}
			else if(!isarray(level.var_755e455a))
			{
				level.var_755e455a = array(level.var_755e455a);
			}
			level.var_755e455a[level.var_755e455a.size] = var_f279f28f[random_index];
			level.var_c70f02d7 = var_f279f28f[random_index];
		}
	}
	while(var_743d50f5.size > 0 && level.var_755e455a.size < (isdefined(getgametypesetting(#"hash_221008a2c793dfa1")) ? getgametypesetting(#"hash_221008a2c793dfa1") : 14))
	{
		var_b844743b = function_d59c2d03(var_743d50f5.size);
		if(!isdefined(level.var_755e455a))
		{
			level.var_755e455a = [];
		}
		else if(!isarray(level.var_755e455a))
		{
			level.var_755e455a = array(level.var_755e455a);
		}
		level.var_755e455a[level.var_755e455a.size] = var_743d50f5[var_b844743b];
		arrayremoveindex(var_743d50f5, var_b844743b);
	}
	foreach(var_79cf244b in level.var_4c71ec6c)
	{
		if(!isdefined(level.var_7d8da246[var_79cf244b]))
		{
			continue;
		}
		var_9ba1646c = level.var_7d8da246[var_79cf244b];
		enabled = 0;
		if(isinarray(level.var_755e455a, var_79cf244b))
		{
			enabled = 1;
		}
		if(gamemodeismode(1) || gamemodeismode(7))
		{
			enabled = 0;
		}
		if(!enabled)
		{
			item_name = var_9ba1646c.var_a531c26d;
			var_a6762160 = getscriptbundle(item_name);
			if(isdefined(var_a6762160))
			{
				namespace_b0722f43::function_63bfe27(item_name);
			}
		}
		if(isdefined(var_9ba1646c.activation_func))
		{
			level [[var_9ba1646c.activation_func]](enabled);
		}
	}
}

/*
	Name: function_f53ec921
	Namespace: namespace_fa6b9ef8
	Checksum: 0xD57B39D6
	Offset: 0xA78
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_f53ec921(a, b)
{
	return int(a) < int(b);
}

