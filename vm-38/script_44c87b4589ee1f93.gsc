#using scripts\core_common\postfx_shared.csc;
#using scripts\abilities\gadgets\gadget_jammer_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\audio_shared.csc;
#using scripts\core_common\ai_shared.csc;

#namespace zombie_dog_toxic_cloud;

/*
	Name: function_f203995b
	Namespace: zombie_dog_toxic_cloud
	Checksum: 0xDD6558FE
	Offset: 0x130
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_f203995b()
{
	level notify(-1871914716);
}

/*
	Name: __init__system__
	Namespace: zombie_dog_toxic_cloud
	Checksum: 0x254B7AFC
	Offset: 0x150
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_33449a50d9656246", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zombie_dog_toxic_cloud
	Checksum: 0xE947366B
	Offset: 0x1A8
	Size: 0x154
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("actor", "" + #"hash_584428de7fdfefe2", 1, 1, "int", &function_3c2a50f4, 0, 0);
	clientfield::register("toplayer", "" + #"hash_313a6af163e4bef1", 1, 1, "counter", &function_d89c5699, 0, 0);
	clientfield::register("toplayer", "" + #"hash_10eff6a8464fb235", 1, 1, "counter", &function_29b682f8, 0, 0);
	clientfield::register("actor", "pustule_pulse_plague", 1, 1, "int", &function_a17af3df, 0, 0);
}

/*
	Name: function_8ac3bea9
	Namespace: zombie_dog_toxic_cloud
	Checksum: 0x80F724D1
	Offset: 0x308
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ac3bea9()
{
}

/*
	Name: function_d89c5699
	Namespace: zombie_dog_toxic_cloud
	Checksum: 0x20B1E319
	Offset: 0x318
	Size: 0x142
	Parameters: 7
	Flags: Linked
*/
function function_d89c5699(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	util::waittill_dobj(bwastimejump);
	if(!isdefined(self))
	{
		return;
	}
	if(!isdefined(self.time_to_wait))
	{
		self.time_to_wait = 0;
	}
	if(isdefined(self.time_to_wait) && self.time_to_wait < gettime())
	{
		if(!isdefined(self.var_bb7d3361))
		{
			self playsound(bwastimejump, #"hash_77703efabee7dabc");
			self.var_bb7d3361 = self playloopsound(#"hash_35083568f87ab28a");
		}
		self thread postfx::playpostfxbundle(#"hash_15272b37ec3c6110");
		self thread function_bdc0d799(bwastimejump);
	}
	else
	{
		self.time_to_wait = gettime() + 1000;
	}
}

/*
	Name: function_29b682f8
	Namespace: zombie_dog_toxic_cloud
	Checksum: 0xA3501E41
	Offset: 0x468
	Size: 0x18C
	Parameters: 7
	Flags: Linked
*/
function function_29b682f8(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	util::waittill_dobj(bwasdemojump);
	if(!isdefined(self))
	{
		return;
	}
	if(!isdefined(self.time_to_wait))
	{
		self.time_to_wait = 0;
	}
	if(isdefined(self.time_to_wait) && self.time_to_wait < gettime())
	{
		if(!isdefined(self.var_bb7d3361))
		{
			self playsound(bwasdemojump, #"hash_77703efabee7dabc");
			self.var_bb7d3361 = self playloopsound(#"hash_35083568f87ab28a");
		}
		self thread postfx::playpostfxbundle(#"hash_15272b37ec3c6110");
		self thread function_bdc0d799(bwasdemojump);
	}
	else
	{
		self.time_to_wait = gettime() + 1000;
	}
	self playrumbleonentity(bwasdemojump, "zm_plague_hound_bite_rumble");
	self playsound(bwasdemojump, #"hash_34a8404fc3e64767");
}

/*
	Name: function_bdc0d799
	Namespace: zombie_dog_toxic_cloud
	Checksum: 0x212EF316
	Offset: 0x600
	Size: 0xFA
	Parameters: 1
	Flags: Linked
*/
function function_bdc0d799(localclientnum)
{
	self endon(#"death");
	self.time_to_wait = gettime() + 1000;
	while(true)
	{
		if(isdefined(self.time_to_wait) && self.time_to_wait < gettime())
		{
			self.time_to_wait = 0;
			break;
		}
		else
		{
			if(isdefined(self.var_bb7d3361))
			{
				self playsound(localclientnum, #"hash_64112ddcbb607d69");
				self stoploopsound(self.var_bb7d3361);
				self.var_bb7d3361 = undefined;
			}
			self thread postfx::stoppostfxbundle(#"hash_15272b37ec3c6110");
			break;
		}
		wait(1);
	}
}

/*
	Name: function_3c2a50f4
	Namespace: zombie_dog_toxic_cloud
	Checksum: 0x55B44045
	Offset: 0x708
	Size: 0xA6
	Parameters: 7
	Flags: Linked
*/
function function_3c2a50f4(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!isdefined(self))
	{
		return;
	}
	if(bwastimejump)
	{
		self thread function_87a4de18(fieldname);
	}
	else if(bwastimejump === 0)
	{
		if(isdefined(self.var_348db091))
		{
			stopfx(fieldname, self.var_348db091);
			self.var_348db091 = undefined;
		}
	}
}

/*
	Name: function_87a4de18
	Namespace: zombie_dog_toxic_cloud
	Checksum: 0x1793515E
	Offset: 0x7B8
	Size: 0x11C
	Parameters: 1
	Flags: Linked
*/
function function_87a4de18(localclientnum)
{
	if(!isdefined(self))
	{
		return;
	}
	var_348db091 = playfx(localclientnum, "zm_ai/fx9_hound_plague_dth_aoe", self.origin + vectorscale((0, 0, 1), 18), anglestoup(self.angles));
	var_18407835 = self.origin + vectorscale((0, 0, 1), 18);
	self playsound(localclientnum, #"hash_1cbebe710791b56c");
	audio::playloopat(#"hash_155791cb3cba6094", var_18407835);
	wait(3.9);
	stopfx(localclientnum, var_348db091);
	audio::stoploopat(#"hash_155791cb3cba6094", var_18407835);
}

/*
	Name: function_a17af3df
	Namespace: zombie_dog_toxic_cloud
	Checksum: 0x2DA538C
	Offset: 0x8E0
	Size: 0xBC
	Parameters: 7
	Flags: Linked
*/
function function_a17af3df(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	util::waittill_dobj(fieldname);
	if(!isdefined(self))
	{
		return;
	}
	if(bwastimejump)
	{
		self playrenderoverridebundle(#"hash_254bc28c3959a2ec");
		self callback::on_shutdown(&function_c88acbea);
	}
	else
	{
		function_c88acbea();
	}
}

/*
	Name: function_c88acbea
	Namespace: zombie_dog_toxic_cloud
	Checksum: 0x23CDBDF1
	Offset: 0x9A8
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function function_c88acbea(params)
{
	self stoprenderoverridebundle(#"hash_254bc28c3959a2ec");
}

