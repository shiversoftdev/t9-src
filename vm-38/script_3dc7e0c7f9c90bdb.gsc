#using scripts\zm_common\zm_utility.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace namespace_63c7213c;

/*
	Name: function_a598c747
	Namespace: namespace_63c7213c
	Checksum: 0xB2A978E0
	Offset: 0x168
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_a598c747()
{
	level notify(1094115409);
}

/*
	Name: __init__system__
	Namespace: namespace_63c7213c
	Checksum: 0x85D36A22
	Offset: 0x188
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_3c43448fdb77ea73", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_63c7213c
	Checksum: 0xAC2BCEFA
	Offset: 0x1D0
	Size: 0x160
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	if(!zm_utility::is_survival())
	{
		return;
	}
	if(!is_true(getgametypesetting(#"hash_1e2b95e15661dad")) && !getdvarint(#"hash_730311c63805303a", 0))
	{
		return;
	}
	clientfield::register("actor", "soul_capture_zombie_fire", 1, 1, "int", &function_ad278032, 0, 0);
	clientfield::register("scriptmover", "soul_capture_leave", 1, 1, "int", &function_ddc6498d, 0, 0);
	clientfield::register("scriptmover", "soul_capture_timer", 1, 1, "int", &function_86bba240, 0, 0);
	level.var_1ffd81e8 = [];
}

/*
	Name: function_ad278032
	Namespace: namespace_63c7213c
	Checksum: 0x1765A216
	Offset: 0x338
	Size: 0xBE
	Parameters: 7
	Flags: Linked
*/
function function_ad278032(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		if(!isdefined(self.var_f6a6e73d))
		{
			self.var_f6a6e73d = util::playfxontag(fieldname, #"hash_5a09c40118c2df6e", self, "j_spine4");
		}
	}
	else if(isdefined(self.var_f6a6e73d))
	{
		stopfx(fieldname, self.var_f6a6e73d);
		self.var_f6a6e73d = undefined;
	}
}

/*
	Name: function_ddc6498d
	Namespace: namespace_63c7213c
	Checksum: 0x9E94EBA2
	Offset: 0x400
	Size: 0x1E4
	Parameters: 7
	Flags: Linked
*/
function function_ddc6498d(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		if(!isdefined(self.n_fx))
		{
			var_70609425 = self.origin + vectorscale((0, 0, 1), 5000);
			self.b_success = 1;
			self.var_c2310a57 = playfx(fieldname, #"zm_ai/fx9_orda_spawn_portal_c", var_70609425, (1, 0, 0), (0, 0, 1));
			self playrumbleonentity(fieldname, "sr_world_event_soul_capture_crystal_leave_rumble");
		}
		if(!isdefined(self.var_b8f825a3))
		{
			self.var_b8f825a3 = self.origin;
			playsound(fieldname, #"hash_46461ba72b8ab7a2", self.var_b8f825a3);
			soundloopemitter("evt_sur_we_portal_common_lp", self.var_b8f825a3);
		}
	}
	else
	{
		if(isdefined(self.var_c2310a57))
		{
			stopfx(fieldname, self.var_c2310a57);
		}
		if(isdefined(self.var_b8f825a3))
		{
			playsound(fieldname, #"hash_3c03699766f040c7", self.var_b8f825a3);
			soundstoploopemitter("evt_sur_we_portal_common_lp", self.var_b8f825a3);
			self.var_b8f825a3 = undefined;
		}
		self stoprumble(fieldname, "sr_world_event_soul_capture_crystal_leave_rumble");
	}
}

/*
	Name: function_86bba240
	Namespace: namespace_63c7213c
	Checksum: 0xED470086
	Offset: 0x5F0
	Size: 0x1CC
	Parameters: 7
	Flags: Linked
*/
function function_86bba240(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(self.model === #"hash_26730916f0bb7003")
	{
		if(bwastimejump)
		{
			self playrenderoverridebundle(#"hash_5e190029d2c86444");
			self function_78233d29(#"hash_5e190029d2c86444", "", "Brightness", 1);
			self function_78233d29(#"hash_5e190029d2c86444", "", "Threshold", 1);
		}
		else
		{
			self thread function_d0b587e2(fieldname);
		}
	}
	else
	{
		if(bwastimejump)
		{
			self.var_59419da4[fieldname] = playfx(fieldname, #"hash_37652ead88a2ed5e", self.origin, anglestoforward(self.angles), anglestoup(self.angles));
		}
		else if(isdefined(self.var_59419da4[fieldname]))
		{
			stopfx(fieldname, self.var_59419da4[fieldname]);
			self.var_59419da4[fieldname] = undefined;
		}
	}
}

/*
	Name: function_d0b587e2
	Namespace: namespace_63c7213c
	Checksum: 0x5B0A811E
	Offset: 0x7C8
	Size: 0xD4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_d0b587e2(localclientnum)
{
	self endon(#"death");
	n_percent = 1;
	n_increment = 1 / 50;
	while(n_percent > 0)
	{
		self function_78233d29(#"hash_5e190029d2c86444", "", "Threshold", n_percent);
		n_percent = n_percent - n_increment;
		wait(1);
	}
	self function_78233d29(#"hash_5e190029d2c86444", "", "Threshold", 0);
}

