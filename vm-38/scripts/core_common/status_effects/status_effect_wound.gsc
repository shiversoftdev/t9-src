#using scripts\core_common\status_effects\status_effect_util.gsc;
#using scripts\core_common\player\player_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace status_effect_wound;

/*
	Name: function_58fe3594
	Namespace: status_effect_wound
	Checksum: 0x742352B5
	Offset: 0xA8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_58fe3594()
{
	level notify(-1381330092);
}

/*
	Name: __init__system__
	Namespace: status_effect_wound
	Checksum: 0x3AD8FEEF
	Offset: 0xC8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"status_effect_wound", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: status_effect_wound
	Checksum: 0xFABA60C9
	Offset: 0x110
	Size: 0x6C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	status_effect::register_status_effect_callback_apply(6, &wound_apply);
	status_effect::function_5bae5120(6, &wound_end);
	status_effect::function_6f4eaf88(getstatuseffect("wound"));
}

/*
	Name: wound_apply
	Namespace: status_effect_wound
	Checksum: 0x786997D6
	Offset: 0x188
	Size: 0x1EC
	Parameters: 3
	Flags: Linked
*/
function wound_apply(var_756fda07, weapon, applicant)
{
	self.var_f031d238 = applicant.var_6406d0cd;
	self.var_4a3f5865 = applicant.var_18d16a6b;
	if(!isdefined(applicant.var_752c0834))
	{
		return;
	}
	var_9e04a872 = applicant.var_752c0834;
	if(self.owner.maxhealth - var_9e04a872 < applicant.var_8ea635df)
	{
		var_9e04a872 = self.owner.maxhealth - applicant.var_8ea635df;
	}
	var_da1d7911 = [];
	var_da1d7911[0] = {#hash_b861a047:undefined, #name:"cleanse_buff"};
	if(self.owner.health > 0)
	{
		self.owner player::function_2a67df65(self.var_4a3f5865, var_9e04a872 * -1, var_da1d7911);
	}
	self.var_18d16a6b = applicant.var_18d16a6b;
	if(self.owner.health > self.owner.var_66cb03ad)
	{
		var_1a197232 = !isdefined(self.owner.var_abe2db87);
		if(var_1a197232)
		{
			self.owner.health = self.owner.var_66cb03ad;
		}
	}
	if(self.endtime > 0)
	{
		self thread function_f6fec56f();
		self thread function_a54d41f7(self.endtime - self.duration);
	}
}

/*
	Name: function_a54d41f7
	Namespace: status_effect_wound
	Checksum: 0x50506BF7
	Offset: 0x380
	Size: 0xCA
	Parameters: 1
	Flags: Linked
*/
function function_a54d41f7(starttime)
{
	self notify(#"hash_77a943337c92549a");
	self endon(#"hash_77a943337c92549a", #"endstatuseffect");
	var_1420e67b = self.endtime;
	while(self.endtime > gettime())
	{
		waitframe(1);
		if(self.endtime != var_1420e67b)
		{
			var_3a8a4c13 = gettime() - starttime;
			self.owner function_eb1cd20(starttime, self.duration + var_3a8a4c13, self.namehash);
			var_1420e67b = self.endtime;
		}
	}
}

/*
	Name: function_f6fec56f
	Namespace: status_effect_wound
	Checksum: 0x6491A2ED
	Offset: 0x458
	Size: 0xF0
	Parameters: 0
	Flags: Linked, Private
*/
function private function_f6fec56f()
{
	self notify(#"hash_35c63d8ef4b4825");
	self endon(#"hash_35c63d8ef4b4825", #"endstatuseffect");
	while(true)
	{
		waitresult = undefined;
		waitresult = self.owner waittill(#"fully_healed", #"death", #"disconnect", #"healing_disabled");
		if(waitresult._notify != "fully_healed")
		{
			return;
		}
		if(isdefined(self.var_f031d238))
		{
			self.owner playsoundtoplayer(self.var_f031d238, self.owner);
		}
	}
}

/*
	Name: wound_end
	Namespace: status_effect_wound
	Checksum: 0xF62D449F
	Offset: 0x550
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function wound_end()
{
	self.owner player::function_b933de24(self.var_4a3f5865);
}

