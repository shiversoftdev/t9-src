#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\zm_common\zm_utility.csc;

#namespace namespace_9c181b10;

/*
	Name: function_cef988d5
	Namespace: namespace_9c181b10
	Checksum: 0xA501ACAB
	Offset: 0xD0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_cef988d5()
{
	level notify(1423562426);
}

#namespace namespace_7ec6ae9f;

/*
	Name: function_89f2df9
	Namespace: namespace_7ec6ae9f
	Checksum: 0xDE2A4BE7
	Offset: 0xF0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_2ff0859bce056c66", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_7ec6ae9f
	Checksum: 0x61D3F89
	Offset: 0x138
	Size: 0x11C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(!zm_utility::is_survival())
	{
		return;
	}
	if(!is_true(getgametypesetting(#"hash_4bf87ef3ad101bb4")) && !getdvarint(#"hash_730311c63805303a", 0))
	{
		return;
	}
	clientfield::register("allplayers", "phase_rift_player_fx", 1, 2, "int", &function_5a246a9f, 0, 0);
	clientfield::register("toplayer", "" + #"hash_1b01e37683714902", 1, 1, "int", &function_1f107cad, 0, 0);
}

/*
	Name: function_5a246a9f
	Namespace: namespace_7ec6ae9f
	Checksum: 0x2C8A420C
	Offset: 0x260
	Size: 0x1BC
	Parameters: 7
	Flags: None
*/
function function_5a246a9f(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!isdefined(self) || !self hasdobj(fieldname))
	{
		return;
	}
	if(bwastimejump == 1)
	{
		v_loc = self gettagorigin("j_spine4");
		v_ang = self gettagangles("j_spine4");
		if(isdefined(v_ang))
		{
			v_forward = anglestoforward(v_ang);
		}
		if(isdefined(v_loc) && isdefined(v_forward))
		{
			self.var_c9e8cfb3 = playfx(fieldname, #"hash_2563ac540861f176", v_loc, v_forward);
		}
	}
	else
	{
		if(bwastimejump == 2)
		{
			if(isdefined(self.var_c9e8cfb3))
			{
				stopfx(fieldname, self.var_c9e8cfb3);
			}
			self.var_c9e8cfb3 = util::playfxontag(fieldname, #"hash_486b7f0cb02282b4", self, "j_spine4");
		}
		else if(isdefined(self.var_c9e8cfb3))
		{
			stopfx(fieldname, self.var_c9e8cfb3);
		}
	}
}

/*
	Name: function_1f107cad
	Namespace: namespace_7ec6ae9f
	Checksum: 0xE63E7322
	Offset: 0x428
	Size: 0x10C
	Parameters: 7
	Flags: Private
*/
function private function_1f107cad(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		if(!isdefined(self.var_b1f90780))
		{
			self playsound(fieldname, #"hash_704c327b669dff9e");
			self.var_b1f90780 = self playloopsound(#"hash_4cc35edd344bf722");
		}
	}
	else if(isdefined(self.var_b1f90780))
	{
		self stoploopsound(self.var_b1f90780);
		self.var_b1f90780 = undefined;
		self playsound(fieldname, #"hash_55d8e246e77e9026");
	}
}

