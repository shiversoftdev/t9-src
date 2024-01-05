#using scripts\core_common\status_effects\status_effect_util.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\values_shared.gsc;

#namespace status_effect_shock;

/*
	Name: function_4189e79
	Namespace: status_effect_shock
	Checksum: 0x1C02DF10
	Offset: 0xA8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_4189e79()
{
	level notify(580130798);
}

/*
	Name: __init__system__
	Namespace: status_effect_shock
	Checksum: 0x6389FC17
	Offset: 0xC8
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
	Checksum: 0xDF406D8D
	Offset: 0x110
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
	Checksum: 0xD0F8927B
	Offset: 0x188
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
	Checksum: 0xFE9AA38
	Offset: 0x2E0
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
	Checksum: 0x8B7A168E
	Offset: 0x3B0
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

