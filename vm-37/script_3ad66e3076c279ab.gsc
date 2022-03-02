#using scripts\core_common\flag_shared.gsc;

#namespace namespace_b2b86d39;

/*
	Name: init_callbacks
	Namespace: namespace_b2b86d39
	Checksum: 0x1085E5A2
	Offset: 0x138
	Size: 0x154
	Parameters: 0
	Flags: None
*/
function init_callbacks()
{
	level.global_callbacks = [];
	foreach(callback in [3:"_idle_call_idle_func", 2:"_spawner_stealth_default", 1:"_patrol_endon_spotted_flag", 0:"_autosave_stealthcheck"])
	{
		level.global_callbacks[callback] = &global_empty_callback;
	}
	level flag::init("stealth_spotted");
	level flag::init("stealth_enabled");
	level flag::init("stealth_meter_combat_alerted");
	level flag::init("stealth_music_pause");
}

/*
	Name: global_empty_callback
	Namespace: namespace_b2b86d39
	Checksum: 0xEC75A960
	Offset: 0x298
	Size: 0x4C
	Parameters: 5
	Flags: Linked
*/
function global_empty_callback(empty1, empty2, empty3, var_193fea34, var_b034dbb)
{
	/#
		assertmsg("");
	#/
}

/*
	Name: stealth_get_func
	Namespace: namespace_b2b86d39
	Checksum: 0xB8C43F86
	Offset: 0x2F0
	Size: 0xA4
	Parameters: 1
	Flags: Linked
*/
function stealth_get_func(type)
{
	if(isdefined(self.stealth) && isdefined(self.stealth.funcs) && isdefined(self.stealth.funcs[type]))
	{
		return self.stealth.funcs[type];
	}
	if(isdefined(level.stealth) && isdefined(level.stealth.funcs))
	{
		return level.stealth.funcs[type];
	}
	return undefined;
}

/*
	Name: stealth_call
	Namespace: namespace_b2b86d39
	Checksum: 0xF47C4612
	Offset: 0x3A0
	Size: 0xBA
	Parameters: 4
	Flags: Linked
*/
function stealth_call(type, parm1, parm2, parm3)
{
	func = stealth_get_func(type);
	if(isdefined(func))
	{
		if(isdefined(parm3))
		{
			return self [[func]](parm1, parm2, parm3);
		}
		if(isdefined(parm2))
		{
			return self [[func]](parm1, parm2);
		}
		if(isdefined(parm1))
		{
			return self [[func]](parm1);
		}
		return self [[func]]();
	}
	return undefined;
}

/*
	Name: stealth_call_thread
	Namespace: namespace_b2b86d39
	Checksum: 0xC978337C
	Offset: 0x468
	Size: 0xBA
	Parameters: 4
	Flags: Linked
*/
function stealth_call_thread(type, parm1, parm2, parm3)
{
	func = stealth_get_func(type);
	if(isdefined(func))
	{
		if(isdefined(parm3))
		{
			return self thread [[func]](parm1, parm2, parm3);
		}
		if(isdefined(parm2))
		{
			return self thread [[func]](parm1, parm2);
		}
		if(isdefined(parm1))
		{
			return self thread [[func]](parm1);
		}
		return self thread [[func]]();
	}
	return undefined;
}

