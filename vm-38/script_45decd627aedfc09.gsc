#namespace state;

/*
	Name: function_3796123a
	Namespace: state
	Checksum: 0x9608E120
	Offset: 0x60
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_3796123a()
{
	level notify(938164102);
}

#namespace ai_state;

/*
	Name: function_e9b061a8
	Namespace: ai_state
	Checksum: 0x76F1AC4
	Offset: 0x80
	Size: 0xD4
	Parameters: 8
	Flags: None
*/
function function_e9b061a8(state, start, var_2ae5a795, end, var_5d31deb6, var_edc20efd, var_ff716a93, var_a1891b01)
{
	level.extra_screen_electricity_.functions[state] = {#hash_a1891b01:var_a1891b01, #hash_ff716a93:var_ff716a93, #hash_edc20efd:var_edc20efd, #hash_5d31deb6:var_5d31deb6, #end:end, #hash_2ae5a795:var_2ae5a795, #start:start};
}

/*
	Name: function_7c534b09
	Namespace: ai_state
	Checksum: 0xE5E66DB0
	Offset: 0x160
	Size: 0x78
	Parameters: 0
	Flags: None
*/
function function_7c534b09()
{
	if(isdefined(self.ai.state) && isdefined(level.extra_screen_electricity_.functions[self.ai.state].start))
	{
		self thread [[level.extra_screen_electricity_.functions[self.ai.state].start]]();
	}
}

/*
	Name: function_4e845c24
	Namespace: ai_state
	Checksum: 0x41A0F48
	Offset: 0x1E0
	Size: 0x78
	Parameters: 0
	Flags: None
*/
function function_4e845c24()
{
	if(isdefined(self.ai.state) && isdefined(level.extra_screen_electricity_.functions[self.ai.state].end))
	{
		self thread [[level.extra_screen_electricity_.functions[self.ai.state].end]]();
	}
}

/*
	Name: function_e8e7cf45
	Namespace: ai_state
	Checksum: 0x6C3C9596
	Offset: 0x260
	Size: 0x78
	Parameters: 0
	Flags: None
*/
function function_e8e7cf45()
{
	if(isdefined(self.ai.state) && isdefined(level.extra_screen_electricity_.functions[self.ai.state].var_2ae5a795))
	{
		self [[level.extra_screen_electricity_.functions[self.ai.state].var_2ae5a795]]();
	}
}

/*
	Name: function_e0e1a7fc
	Namespace: ai_state
	Checksum: 0xA76A61CB
	Offset: 0x2E0
	Size: 0x78
	Parameters: 0
	Flags: None
*/
function function_e0e1a7fc()
{
	if(isdefined(self.ai.state) && isdefined(level.extra_screen_electricity_.functions[self.ai.state].var_5d31deb6))
	{
		self [[level.extra_screen_electricity_.functions[self.ai.state].var_5d31deb6]]();
	}
}

/*
	Name: function_4af1ff64
	Namespace: ai_state
	Checksum: 0x60AED796
	Offset: 0x360
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
	Checksum: 0xEF747D63
	Offset: 0x3E8
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
	Checksum: 0x8CF585CB
	Offset: 0x470
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
			function_4e845c24();
		}
		self.ai.state = state;
		function_7c534b09();
		self notify(#"state_changed", state);
		/#
			self thread function_3a57bb58();
		#/
	}
}

/*
	Name: is_state
	Namespace: ai_state
	Checksum: 0x82338207
	Offset: 0x560
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
	Checksum: 0xBEEF84FA
	Offset: 0x588
	Size: 0x64
	Parameters: 0
	Flags: None
*/
function function_c1d2ede8()
{
	/#
		if(isdefined(level.extra_screen_electricity_.functions[self.ai.state].var_a1891b01))
		{
			self [[level.extra_screen_electricity_.functions[self.ai.state].var_a1891b01]]();
		}
	#/
}

/*
	Name: function_3a57bb58
	Namespace: ai_state
	Checksum: 0x1ED16193
	Offset: 0x5F8
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

