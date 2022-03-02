#using script_57f7003580bb15e0;
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
	Name: function_89f2df9
	Namespace: status_effect_shock
	Checksum: 0x6389FC17
	Offset: 0xC8
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
	Checksum: 0xDF406D8D
	Offset: 0x110
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
	Checksum: 0xD0F8927B
	Offset: 0x188
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
	Checksum: 0xFE9AA38
	Offset: 0x2E0
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
	Checksum: 0x8B7A168E
	Offset: 0x3B0
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

