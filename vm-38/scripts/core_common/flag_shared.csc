#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace flag_shared;

/*
	Name: function_e7283420
	Namespace: flag_shared
	Checksum: 0xCDA30577
	Offset: 0x98
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_e7283420()
{
	level notify(910207069);
}

#namespace flag;

/*
	Name: init_dvar
	Namespace: flag
	Checksum: 0xE9F257F5
	Offset: 0xB8
	Size: 0x34
	Parameters: 1
	Flags: None
*/
function init_dvar(str_dvar)
{
	util::init_dvar(str_dvar, 0, &function_4a18565a);
}

/*
	Name: function_4a18565a
	Namespace: flag
	Checksum: 0x55C96B39
	Offset: 0xF8
	Size: 0x54
	Parameters: 1
	Flags: Linked, Private
*/
function private function_4a18565a(params)
{
	level set_val(params.name, is_true(int(params.value)));
}

/*
	Name: init
	Namespace: flag
	Checksum: 0xF898D18A
	Offset: 0x158
	Size: 0xC8
	Parameters: 2
	Flags: Linked
*/
function init(str_flag, b_val)
{
	if(!isdefined(b_val))
	{
		b_val = 0;
	}
	if(!isdefined(self.flag))
	{
		self.flag = [];
	}
	if(!isdefined(self.var_491938f6))
	{
		self.var_491938f6 = [];
	}
	/#
		if(!isdefined(level.first_frame))
		{
			/#
				assert(!isdefined(self.flag[str_flag]), ("" + str_flag) + "");
			#/
		}
	#/
	self.flag[str_flag] = b_val;
	self.var_491938f6[str_flag] = 1;
}

/*
	Name: exists
	Namespace: flag
	Checksum: 0x43CC52D4
	Offset: 0x228
	Size: 0x26
	Parameters: 1
	Flags: Linked
*/
function exists(str_flag)
{
	return isdefined(self.flag) && isdefined(self.flag[str_flag]);
}

/*
	Name: delete
	Namespace: flag
	Checksum: 0x61C25BE
	Offset: 0x258
	Size: 0x74
	Parameters: 1
	Flags: None
*/
function delete(str_flag)
{
	if(isdefined(self.var_491938f6) && isdefined(self.var_491938f6[str_flag]))
	{
		self.var_491938f6[str_flag] = undefined;
	}
	if(isdefined(self.var_491938f6) && self.var_491938f6.size == 0)
	{
		self.var_491938f6 = undefined;
	}
	clear(str_flag);
}

/*
	Name: delay_set
	Namespace: flag
	Checksum: 0x60D38BAF
	Offset: 0x2D8
	Size: 0x34
	Parameters: 3
	Flags: None
*/
function delay_set(n_delay, str_flag, str_cancel)
{
	self thread _delay_set(n_delay, str_flag, str_cancel);
}

/*
	Name: _delay_set
	Namespace: flag
	Checksum: 0x91E1A198
	Offset: 0x318
	Size: 0x5C
	Parameters: 3
	Flags: Linked, Private
*/
function private _delay_set(n_delay, str_flag, str_cancel)
{
	if(isdefined(str_cancel))
	{
		self endon(str_cancel);
	}
	self endon(#"death");
	wait(n_delay);
	set(str_flag);
}

/*
	Name: set
	Namespace: flag
	Checksum: 0x7B1FFA79
	Offset: 0x380
	Size: 0x60
	Parameters: 1
	Flags: Linked
*/
function set(str_flag)
{
	if(!isdefined(self.flag))
	{
		self.flag = [];
	}
	self.flag[str_flag] = 1;
	self notify(str_flag);
	if(isdefined(level.var_53af20e))
	{
		[[level.var_53af20e]](str_flag);
	}
}

/*
	Name: set_val
	Namespace: flag
	Checksum: 0x32F1E047
	Offset: 0x3E8
	Size: 0x6C
	Parameters: 2
	Flags: Linked
*/
function set_val(str_flag, b_val)
{
	/#
		assert(isdefined(b_val), "");
	#/
	if(b_val)
	{
		set(str_flag);
	}
	else
	{
		clear(str_flag);
	}
}

/*
	Name: increment
	Namespace: flag
	Checksum: 0xF895C404
	Offset: 0x460
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function increment(str_flag)
{
	if(!isdefined(self.flag_count))
	{
		self.flag_count = [];
	}
	if(!isdefined(self.flag_count[str_flag]))
	{
		self.flag_count[str_flag] = 0;
	}
	self.flag_count[str_flag]++;
	set(str_flag);
}

/*
	Name: decrement
	Namespace: flag
	Checksum: 0x4194833C
	Offset: 0x4D8
	Size: 0x94
	Parameters: 1
	Flags: Linked
*/
function decrement(str_flag)
{
	/#
		assert(isdefined(self.flag_count[str_flag]) && self.flag_count[str_flag] > 0, "");
	#/
	self.flag_count[str_flag]--;
	if(self.flag_count[str_flag] == 0)
	{
		clear(str_flag);
	}
}

/*
	Name: set_for_time
	Namespace: flag
	Checksum: 0xE4078B52
	Offset: 0x578
	Size: 0x64
	Parameters: 2
	Flags: None
*/
function set_for_time(n_time, str_flag)
{
	self notify("__flag::set_for_time__" + str_flag);
	self endon("__flag::set_for_time__" + str_flag);
	set(str_flag);
	wait(n_time);
	clear(str_flag);
}

/*
	Name: clear
	Namespace: flag
	Checksum: 0xA3323D96
	Offset: 0x5E8
	Size: 0xA0
	Parameters: 1
	Flags: Linked
*/
function clear(str_flag)
{
	if(is_true(self.flag[str_flag]))
	{
		if(is_true(self.var_491938f6[str_flag]))
		{
			self.flag[str_flag] = 0;
		}
		else
		{
			self.flag[str_flag] = undefined;
		}
		self notify(str_flag);
		if(isdefined(level.var_53af20e))
		{
			[[level.var_53af20e]](str_flag);
		}
	}
}

/*
	Name: function_c58ecb49
	Namespace: flag
	Checksum: 0x534DB7F7
	Offset: 0x690
	Size: 0x48
	Parameters: 1
	Flags: None
*/
function function_c58ecb49(str_flag)
{
	clear(str_flag);
	if(isdefined(self.flag_count[str_flag]))
	{
		self.flag_count[str_flag] = 0;
	}
}

/*
	Name: toggle
	Namespace: flag
	Checksum: 0x67C8A41D
	Offset: 0x6E0
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function toggle(str_flag)
{
	set_val(str_flag, !get(str_flag));
}

/*
	Name: get
	Namespace: flag
	Checksum: 0xE8570870
	Offset: 0x728
	Size: 0x2A
	Parameters: 1
	Flags: Linked
*/
function get(str_flag)
{
	return is_true(self.flag[str_flag]);
}

/*
	Name: get_any
	Namespace: flag
	Checksum: 0x50B9BF9B
	Offset: 0x760
	Size: 0x9A
	Parameters: 1
	Flags: None
*/
function get_any(&array)
{
	foreach(str_flag in array)
	{
		if(get(str_flag))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: get_all
	Namespace: flag
	Checksum: 0x428EA7A9
	Offset: 0x808
	Size: 0x9A
	Parameters: 1
	Flags: None
*/
function get_all(&array)
{
	foreach(str_flag in array)
	{
		if(!get(str_flag))
		{
			return false;
		}
	}
	return true;
}

/*
	Name: wait_till
	Namespace: flag
	Checksum: 0xF90ADF4F
	Offset: 0x8B0
	Size: 0x46
	Parameters: 1
	Flags: Linked
*/
function wait_till(str_flag)
{
	self endon(#"death");
	while(!get(str_flag))
	{
		self waittill(str_flag);
	}
}

/*
	Name: wait_till_timeout
	Namespace: flag
	Checksum: 0xF367B03B
	Offset: 0x900
	Size: 0x7C
	Parameters: 2
	Flags: None
*/
function wait_till_timeout(n_timeout, str_flag)
{
	if(isdefined(n_timeout))
	{
		__s = spawnstruct();
		__s endon(#"timeout");
		__s util::delay_notify(n_timeout, "timeout");
	}
	wait_till(str_flag);
}

/*
	Name: wait_till_all
	Namespace: flag
	Checksum: 0xDADE5DE8
	Offset: 0x988
	Size: 0x7A
	Parameters: 1
	Flags: Linked
*/
function wait_till_all(a_flags)
{
	self endon(#"death");
	for(i = 0; i < a_flags.size; i++)
	{
		str_flag = a_flags[i];
		if(!get(str_flag))
		{
			self waittill(str_flag);
			i = -1;
		}
	}
}

/*
	Name: wait_till_all_timeout
	Namespace: flag
	Checksum: 0x7125AEAF
	Offset: 0xA10
	Size: 0x7C
	Parameters: 2
	Flags: None
*/
function wait_till_all_timeout(n_timeout, a_flags)
{
	if(isdefined(n_timeout))
	{
		__s = spawnstruct();
		__s endon(#"timeout");
		__s util::delay_notify(n_timeout, "timeout");
	}
	wait_till_all(a_flags);
}

/*
	Name: wait_till_any
	Namespace: flag
	Checksum: 0xF9A94A7B
	Offset: 0xA98
	Size: 0xC4
	Parameters: 1
	Flags: Linked
*/
function wait_till_any(a_flags)
{
	self endon(#"death");
	foreach(flag in a_flags)
	{
		if(get(flag))
		{
			return {#_notify:flag};
		}
	}
	return self waittill(a_flags);
}

/*
	Name: wait_till_any_timeout
	Namespace: flag
	Checksum: 0xE86EB15D
	Offset: 0xB68
	Size: 0x7C
	Parameters: 2
	Flags: None
*/
function wait_till_any_timeout(n_timeout, a_flags)
{
	if(isdefined(n_timeout))
	{
		__s = spawnstruct();
		__s endon(#"timeout");
		__s util::delay_notify(n_timeout, "timeout");
	}
	wait_till_any(a_flags);
}

/*
	Name: wait_till_clear
	Namespace: flag
	Checksum: 0x590863A0
	Offset: 0xBF0
	Size: 0x46
	Parameters: 1
	Flags: Linked
*/
function wait_till_clear(str_flag)
{
	self endon(#"death");
	while(get(str_flag))
	{
		self waittill(str_flag);
	}
}

/*
	Name: wait_till_clear_timeout
	Namespace: flag
	Checksum: 0x26CE4DF7
	Offset: 0xC40
	Size: 0x94
	Parameters: 2
	Flags: Linked
*/
function wait_till_clear_timeout(n_timeout, str_flag)
{
	self endon(#"death");
	if(isdefined(n_timeout))
	{
		__s = spawnstruct();
		__s endon(#"timeout");
		__s util::delay_notify(n_timeout, "timeout");
	}
	wait_till_clear(str_flag);
}

/*
	Name: wait_till_clear_all
	Namespace: flag
	Checksum: 0xDE5AEEEB
	Offset: 0xCE0
	Size: 0x7A
	Parameters: 1
	Flags: Linked
*/
function wait_till_clear_all(a_flags)
{
	self endon(#"death");
	for(i = 0; i < a_flags.size; i++)
	{
		str_flag = a_flags[i];
		if(get(str_flag))
		{
			self waittill(str_flag);
			i = -1;
		}
	}
}

/*
	Name: function_4bf6d64f
	Namespace: flag
	Checksum: 0xD02B1CBD
	Offset: 0xD68
	Size: 0x3E2
	Parameters: 2
	Flags: None
*/
function function_4bf6d64f(var_5d544245, var_44bd221)
{
	self endon(#"death");
	foreach(flag in var_5d544245)
	{
		if(get(flag))
		{
			return {#_notify:flag};
		}
	}
	foreach(flag in var_44bd221)
	{
		if(!get(flag))
		{
			return {#_notify:flag};
		}
	}
	var_b1f5a9d1 = arraycombine(var_5d544245, var_44bd221, 1);
	var_36b86152 = [];
	foreach(flag in var_5d544245)
	{
		if(!isdefined(var_36b86152))
		{
			var_36b86152 = [];
		}
		else if(!isarray(var_36b86152))
		{
			var_36b86152 = array(var_36b86152);
		}
		var_36b86152[var_36b86152.size] = hash(flag);
	}
	var_c50f1f7b = [];
	foreach(flag in var_44bd221)
	{
		if(!isdefined(var_c50f1f7b))
		{
			var_c50f1f7b = [];
		}
		else if(!isarray(var_c50f1f7b))
		{
			var_c50f1f7b = array(var_c50f1f7b);
		}
		var_c50f1f7b[var_c50f1f7b.size] = hash(flag);
	}
	while(true)
	{
		result = undefined;
		result = self waittill(var_b1f5a9d1);
		flag = result._notify;
		if(isinarray(var_36b86152, flag) && get(flag))
		{
			return {#_notify:flag};
		}
		if(isinarray(var_c50f1f7b, flag) && !get(flag))
		{
			return {#_notify:flag};
		}
	}
}

/*
	Name: function_5f02becb
	Namespace: flag
	Checksum: 0x7A26D86F
	Offset: 0x1158
	Size: 0x104
	Parameters: 1
	Flags: None
*/
function function_5f02becb(n_timeout)
{
	if(isdefined(n_timeout) && n_timeout > 0)
	{
		if(isdefined(n_timeout))
		{
			__s = spawnstruct();
			__s endon(#"timeout");
			__s util::delay_notify(n_timeout, "timeout");
		}
	}
	if(isdefined(self.script_flag_true))
	{
		var_ed5ed076 = util::create_flags_and_return_tokens(self.script_flag_true);
		level wait_till_all(var_ed5ed076);
	}
	if(isdefined(self.script_flag_false))
	{
		var_b1418b4 = util::create_flags_and_return_tokens(self.script_flag_false);
		level wait_till_clear_all(var_b1418b4);
	}
}

/*
	Name: wait_till_clear_all_timeout
	Namespace: flag
	Checksum: 0xEBB67258
	Offset: 0x1268
	Size: 0x7C
	Parameters: 2
	Flags: None
*/
function wait_till_clear_all_timeout(n_timeout, a_flags)
{
	if(isdefined(n_timeout))
	{
		__s = spawnstruct();
		__s endon(#"timeout");
		__s util::delay_notify(n_timeout, "timeout");
	}
	wait_till_clear_all(a_flags);
}

/*
	Name: wait_till_clear_any
	Namespace: flag
	Checksum: 0x4456F208
	Offset: 0x12F0
	Size: 0xD2
	Parameters: 1
	Flags: Linked
*/
function wait_till_clear_any(a_flags)
{
	self endon(#"death");
	if(1)
	{
		foreach(flag in a_flags)
		{
			if(!get(flag))
			{
				return {#_notify:flag};
			}
		}
		return self waittill(a_flags);
	}
}

/*
	Name: wait_till_clear_any_timeout
	Namespace: flag
	Checksum: 0x7AB77FEC
	Offset: 0x13D0
	Size: 0x7C
	Parameters: 2
	Flags: None
*/
function wait_till_clear_any_timeout(n_timeout, a_flags)
{
	if(isdefined(n_timeout))
	{
		__s = spawnstruct();
		__s endon(#"timeout");
		__s util::delay_notify(n_timeout, "timeout");
	}
	wait_till_clear_any(a_flags);
}

/*
	Name: script_flag_wait
	Namespace: flag
	Checksum: 0x9D582FC4
	Offset: 0x1458
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function script_flag_wait()
{
	if(isdefined(self.script_flag_wait))
	{
		self wait_till(self.script_flag_wait);
		return true;
	}
	return false;
}

