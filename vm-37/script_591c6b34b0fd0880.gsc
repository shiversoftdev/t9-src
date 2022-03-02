#using script_57f7003580bb15e0;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\values_shared.gsc;

#namespace status_effect_shock;

/*
	Name: function_89f2df9
	Namespace: status_effect_shock
	Checksum: 0xCCA65B63
	Offset: 0xA8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"status_effect_shock", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: status_effect_shock
	Checksum: 0x54DCE6F3
	Offset: 0xF0
	Size: 0x6C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	status_effect::register_status_effect_callback_apply(5, &shock_apply);
	status_effect::function_5bae5120(5, &function_1eac7817);
	status_effect::function_6f4eaf88(function_4d1e7b48("shock"));
}

/*
	Name: shock_apply
	Namespace: status_effect_shock
	Checksum: 0x235BFF14
	Offset: 0x168
	Size: 0x14C
	Parameters: 3
	Flags: Linked
*/
function shock_apply(var_756fda07, weapon, var_84171a6c)
{
	if((isdefined(var_84171a6c.var_120475e6) ? var_84171a6c.var_120475e6 : 0))
	{
		self.owner setlowready(1);
		self.owner val::set(#"shock", "freezecontrols");
	}
	self.var_52b189ce = 1;
	if(isdefined(var_84171a6c))
	{
		self.var_52b189ce = (isdefined(var_84171a6c.var_52b189ce) ? var_84171a6c.var_52b189ce : 1);
	}
	if(self.var_52b189ce)
	{
		self.owner setelectrifiedstate(1);
		self thread function_51356342(float(self.duration) / 1000);
		self.owner playsound(#"hash_7d53dd7b886b60ae");
	}
}

/*
	Name: function_1eac7817
	Namespace: status_effect_shock
	Checksum: 0xF7A6B950
	Offset: 0x2C0
	Size: 0xC4
	Parameters: 0
	Flags: Linked
*/
function function_1eac7817()
{
	if(isdefined(self))
	{
		if((isdefined(self.var_4f6b79a4.var_120475e6) ? self.var_4f6b79a4.var_120475e6 : 0))
		{
			self.owner setlowready(0);
			self.owner val::reset(#"shock", "freezecontrols");
		}
		if(self.var_52b189ce)
		{
			self.owner stoprumble("proximity_grenade");
			self.owner setelectrifiedstate(0);
		}
	}
}

/*
	Name: function_51356342
	Namespace: status_effect_shock
	Checksum: 0x780185F9
	Offset: 0x390
	Size: 0xD6
	Parameters: 1
	Flags: Linked, Private
*/
function private function_51356342(duration)
{
	self notify(#"hash_50998937b8ffdf86");
	self endon(#"hash_50998937b8ffdf86", #"hash_13d72ca5a7cfd2bd");
	self.owner endon(#"disconnect", #"death");
	goaltime = gettime() + (int(duration * 1000));
	while(gettime() < goaltime && isdefined(self.owner))
	{
		self.owner playrumbleonentity("proximity_grenade");
		wait(1);
	}
}

