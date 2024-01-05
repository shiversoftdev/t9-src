#namespace ai_state;

/*
	Name: function_e9b061a8
	Namespace: ai_state
	Checksum: 0x3B193949
	Offset: 0x60
	Size: 0xD4
	Parameters: 8
	Flags: None
*/
function function_e9b061a8(state, start, update_goal, end, update_enemy, var_edc20efd, var_ff716a93, update_debug)
{
	level.extra_screen_electricity_.functions[state] = {#update_debug:update_debug, #hash_ff716a93:var_ff716a93, #hash_edc20efd:var_edc20efd, #update_enemy:update_enemy, #end:end, #update_goal:update_goal, #start:start};
}

/*
	Name: callback_start
	Namespace: ai_state
	Checksum: 0xF47F58F4
	Offset: 0x140
	Size: 0x78
	Parameters: 0
	Flags: None
*/
function callback_start()
{
	if(isdefined(self.ai.state) && isdefined(level.extra_screen_electricity_.functions[self.ai.state].start))
	{
		self thread [[level.extra_screen_electricity_.functions[self.ai.state].start]]();
	}
}

/*
	Name: callback_end
	Namespace: ai_state
	Checksum: 0x25CC8CF0
	Offset: 0x1C0
	Size: 0x78
	Parameters: 0
	Flags: None
*/
function callback_end()
{
	if(isdefined(self.ai.state) && isdefined(level.extra_screen_electricity_.functions[self.ai.state].end))
	{
		self thread [[level.extra_screen_electricity_.functions[self.ai.state].end]]();
	}
}

/*
	Name: function_e8e7cf45
	Namespace: ai_state
	Checksum: 0x21360FEB
	Offset: 0x240
	Size: 0x78
	Parameters: 0
	Flags: None
*/
function function_e8e7cf45()
{
	if(isdefined(self.ai.state) && isdefined(level.extra_screen_electricity_.functions[self.ai.state].update_goal))
	{
		self [[level.extra_screen_electricity_.functions[self.ai.state].update_goal]]();
	}
}

/*
	Name: function_e0e1a7fc
	Namespace: ai_state
	Checksum: 0x4AC27CEA
	Offset: 0x2C0
	Size: 0x78
	Parameters: 0
	Flags: None
*/
function function_e0e1a7fc()
{
	if(isdefined(self.ai.state) && isdefined(level.extra_screen_electricity_.functions[self.ai.state].update_enemy))
	{
		self [[level.extra_screen_electricity_.functions[self.ai.state].update_enemy]]();
	}
}

/*
	Name: function_4af1ff64
	Namespace: ai_state
	Checksum: 0x257404E4
	Offset: 0x340
	Size: 0x7A
	Parameters: 0
	Flags: None
*/
function function_4af1ff64()
{
	if(isdefined(self.ai.state) && isdefined(level.extra_screen_electricity_.functions[self.ai.state].var_edc20efd))
	{
		return self [[level.extra_screen_electricity_.functions[self.ai.state].var_edc20efd]]();
	}
	return 0;
}

/*
	Name: function_a78474f2
	Namespace: ai_state
	Checksum: 0x7BB9592F
	Offset: 0x3C8
	Size: 0x7A
	Parameters: 0
	Flags: None
*/
function function_a78474f2()
{
	if(isdefined(self.ai.state) && isdefined(level.extra_screen_electricity_.functions[self.ai.state].var_ff716a93))
	{
		return self [[level.extra_screen_electricity_.functions[self.ai.state].var_ff716a93]]();
	}
	return undefined;
}

/*
	Name: set_state
	Namespace: ai_state
	Checksum: 0x91A4E153
	Offset: 0x450
	Size: 0xE4
	Parameters: 1
	Flags: None
*/
function set_state(state)
{
	if(!isdefined(self.ai))
	{
		self.ai = {#state:undefined};
	}
	if(!isdefined(self.ai.state) || self.ai.state != state)
	{
		if(isdefined(self.ai.state))
		{
			callback_end();
		}
		self.ai.state = state;
		callback_start();
		self notify(#"state_changed", state);
		/#
			self thread function_3a57bb58();
		#/
	}
}

/*
	Name: is_state
	Namespace: ai_state
	Checksum: 0x839EA954
	Offset: 0x540
	Size: 0x20
	Parameters: 1
	Flags: None
*/
function is_state(state)
{
	return self.ai.state === state;
}

/*
	Name: function_c1d2ede8
	Namespace: ai_state
	Checksum: 0x90457C85
	Offset: 0x568
	Size: 0x64
	Parameters: 0
	Flags: None
*/
function function_c1d2ede8()
{
	/#
		if(isdefined(level.extra_screen_electricity_.functions[self.ai.state].update_debug))
		{
			self [[level.extra_screen_electricity_.functions[self.ai.state].update_debug]]();
		}
	#/
}

/*
	Name: function_3a57bb58
	Namespace: ai_state
	Checksum: 0x27AA7366
	Offset: 0x5D8
	Size: 0x5E
	Parameters: 0
	Flags: None
*/
function function_3a57bb58()
{
	/#
		self notify("");
		self endon("");
		self endon(#"death");
		while(true)
		{
			self function_c1d2ede8();
			waitframe(1);
		}
	#/
}

