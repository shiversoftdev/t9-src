#using scripts\core_common\status_effects\status_effect_util.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\values_shared.gsc;

#namespace status_effect_shock;

/*
	Name: __init__system__
	Namespace: status_effect_shock
	Checksum: 0xCCA65B63
	Offset: 0xA8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
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
	status_effect::function_5bae5120(5, &shock_end);
	status_effect::function_6f4eaf88(getstatuseffect("shock"));
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
function shock_apply(var_756fda07, weapon, applicant)
{
	if((isdefined(applicant.var_120475e6) ? applicant.var_120475e6 : 0))
	{
		self.owner setlowready(1);
		self.owner val::set(#"shock", "freezecontrols");
	}
	self.var_52b189ce = 1;
	if(isdefined(applicant))
	{
		self.var_52b189ce = (isdefined(applicant.var_52b189ce) ? applicant.var_52b189ce : 1);
	}
	if(self.var_52b189ce)
	{
		self.owner setelectrifiedstate(1);
		self thread shock_rumble_loop(float(self.duration) / 1000);
		self.owner playsound(#"hash_7d53dd7b886b60ae");
	}
}

/*
	Name: shock_end
	Namespace: status_effect_shock
	Checksum: 0xF7A6B950
	Offset: 0x2C0
	Size: 0xC4
	Parameters: 0
	Flags: Linked
*/
function shock_end()
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
	Name: shock_rumble_loop
	Namespace: status_effect_shock
	Checksum: 0x780185F9
	Offset: 0x390
	Size: 0xD6
	Parameters: 1
	Flags: Linked, Private
*/
function private shock_rumble_loop(duration)
{
	self notify(#"shock_rumble_loop");
	self endon(#"shock_rumble_loop", #"endstatuseffect");
	self.owner endon(#"disconnect", #"death");
	goaltime = gettime() + (int(duration * 1000));
	while(gettime() < goaltime && isdefined(self.owner))
	{
		self.owner playrumbleonentity("proximity_grenade");
		wait(1);
	}
}

