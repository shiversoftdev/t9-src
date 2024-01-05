#using script_309ce7f5a9a023de;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\array_shared.csc;

#namespace character_unlock_fixup;

/*
	Name: set_lock_on_target
	Namespace: character_unlock_fixup
	Checksum: 0x2933B5A2
	Offset: 0x98
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec set_lock_on_target()
{
	level notify(-1936968699);
}

/*
	Name: __init__system__
	Namespace: character_unlock_fixup
	Checksum: 0x8F8D426C
	Offset: 0xB8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"character_unlock_fixup", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: character_unlock_fixup
	Checksum: 0xABD2B192
	Offset: 0x100
	Size: 0x10
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	level.var_7d8da246 = [];
}

/*
	Name: register_character_unlock
	Namespace: character_unlock_fixup
	Checksum: 0x3EB5FB09
	Offset: 0x118
	Size: 0x1E8
	Parameters: 5
	Flags: Variadic
*/
function register_character_unlock(unlock_name, unlock_stat, item, var_f27097cc, ...)
{
	/#
		assert(vararg.size > 0, "");
	#/
	var_9ba1646c = {#activation_func:undefined, #hash_849d923d:var_f27097cc, #hash_3845495:[], #required_item:item, #hash_2b469a7d:unlock_stat};
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
	level.var_7d8da246[unlock_name] = var_9ba1646c;
}

/*
	Name: function_90ee7a97
	Namespace: character_unlock_fixup
	Checksum: 0x95C29BA3
	Offset: 0x308
	Size: 0xAA
	Parameters: 2
	Flags: None
*/
function function_90ee7a97(unlock_name, activation_func)
{
	var_9ba1646c = level.var_7d8da246[unlock_name];
	if(!isdefined(var_9ba1646c))
	{
		/#
			/#
				assertmsg(("" + function_9e72a96(unlock_name)) + "");
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
	Namespace: character_unlock_fixup
	Checksum: 0x2D7A7EAD
	Offset: 0x3C0
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
	foreach(unlock_name, var_9ba1646c in level.var_7d8da246)
	{
		array::add_sorted(level.var_4c71ec6c, unlock_name, 0, &function_f53ec921);
	}
	var_743d50f5 = [];
	foreach(unlock_name in level.var_4c71ec6c)
	{
		if(!isdefined(level.var_7d8da246[unlock_name]))
		{
			continue;
		}
		var_9ba1646c = level.var_7d8da246[unlock_name];
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
			var_743d50f5[var_743d50f5.size] = unlock_name;
		}
	}
	level.var_755e455a = [];
	level.var_c70f02d7 = undefined;
	if(is_true(getgametypesetting(#"wzblightfather")))
	{
		var_f279f28f = [];
		for(i = 0; i < var_743d50f5.size; i++)
		{
			if(var_743d50f5[i] == #"stanton_unlock" || var_743d50f5[i] == #"scarlett_unlock" || var_743d50f5[i] == #"diego_unlock" || var_743d50f5[i] == #"bruno_unlock" || var_743d50f5[i] == "#dempsey_unlock" || var_743d50f5[i] == #"nikolai_unlock" || var_743d50f5[i] == #"richtofen_unlock" || var_743d50f5[i] == #"takeo_unlock")
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
	foreach(unlock_name in level.var_4c71ec6c)
	{
		if(!isdefined(level.var_7d8da246[unlock_name]))
		{
			continue;
		}
		var_9ba1646c = level.var_7d8da246[unlock_name];
		enabled = 0;
		if(isinarray(level.var_755e455a, unlock_name))
		{
			enabled = 1;
		}
		if(gamemodeismode(1) || gamemodeismode(7))
		{
			enabled = 0;
		}
		if(!enabled)
		{
			item_name = var_9ba1646c.required_item;
			var_a6762160 = getscriptbundle(item_name);
			if(isdefined(var_a6762160))
			{
				item_world_fixup::remove_item(item_name);
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
	Namespace: character_unlock_fixup
	Checksum: 0xC4D991F1
	Offset: 0xA98
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_f53ec921(a, b)
{
	return int(a) < int(b);
}

