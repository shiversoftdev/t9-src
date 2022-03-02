#using script_4e53735256f112ac;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_2ab93693;

/*
	Name: function_e6746e82
	Namespace: namespace_2ab93693
	Checksum: 0x4CAB0C1F
	Offset: 0x168
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_e6746e82()
{
	level notify(919060568);
}

/*
	Name: function_89f2df9
	Namespace: namespace_2ab93693
	Checksum: 0x118FB9D4
	Offset: 0x188
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_662c938bd03bd1ad", &function_70a657d8, undefined, undefined, #"hash_13a43d760497b54d");
}

/*
	Name: function_70a657d8
	Namespace: namespace_2ab93693
	Checksum: 0xF097F399
	Offset: 0x1D8
	Size: 0x1BC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("scriptmover", "" + #"hash_142ed640bf2e09b9", 1, 1, "int", &function_9ab6532, 0, 0);
	clientfield::register("actor", "" + #"hash_717ed5a81b281ebd", 1, 1, "counter", &function_49585088, 0, 0);
	clientfield::register("toplayer", "" + #"hash_717ed5a81b281ebd", 1, 1, "int", &function_1408657d, 0, 0);
	clientfield::register("actor", "" + #"hash_177f6b02e0b5436b", 1, 1, "int", &function_c284174e, 0, 0);
	clientfield::register("actor", "" + #"hash_40a7e84c380b9b1a", 1, 1, "int", &function_4d8be86, 0, 0);
}

/*
	Name: function_9ab6532
	Namespace: namespace_2ab93693
	Checksum: 0x3E5F6635
	Offset: 0x3A0
	Size: 0xBE
	Parameters: 7
	Flags: Linked
*/
function function_9ab6532(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		if(!isdefined(self.var_2d4a2068))
		{
			self.var_2d4a2068 = util::playfxontag(fieldname, #"hash_612c96cf772b0fff", self, "tag_origin");
		}
	}
	else if(isdefined(self.var_2d4a2068))
	{
		stopfx(fieldname, self.var_2d4a2068);
		self.var_2d4a2068 = undefined;
	}
}

/*
	Name: function_49585088
	Namespace: namespace_2ab93693
	Checksum: 0xD1CD3604
	Offset: 0x468
	Size: 0x64
	Parameters: 7
	Flags: Linked
*/
function function_49585088(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	util::playfxontag(bwastimejump, #"hash_1c001d6fb3eddb07", self, "tag_origin");
}

/*
	Name: function_1408657d
	Namespace: namespace_2ab93693
	Checksum: 0xAA45052D
	Offset: 0x4D8
	Size: 0x10C
	Parameters: 7
	Flags: Linked
*/
function function_1408657d(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(getdvarint(#"hash_3d552cee64c1f47f", 0))
	{
		var_f7698b89 = #"hash_44c8508c1fd1ef7d";
	}
	else
	{
		var_f7698b89 = #"hash_44a0488c1fb08fd1";
	}
	if(bwastimejump)
	{
		if(self postfx::function_556665f2(var_f7698b89))
		{
			self postfx::stoppostfxbundle(var_f7698b89);
		}
		self postfx::playpostfxbundle(var_f7698b89);
	}
	else if(self postfx::function_556665f2(var_f7698b89))
	{
		self postfx::exitpostfxbundle(var_f7698b89);
	}
}

/*
	Name: function_c284174e
	Namespace: namespace_2ab93693
	Checksum: 0x45EBA370
	Offset: 0x5F0
	Size: 0x1BA
	Parameters: 7
	Flags: Linked
*/
function function_c284174e(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		str_tag = "j_spinelower";
		if(!isdefined(self gettagorigin(str_tag)))
		{
			str_tag = "tag_origin";
		}
		self.var_72ef3ede = util::playfxontag(fieldname, #"hash_396881a795d7d4c8", self, str_tag);
		self thread function_3d9b3a(fieldname);
	}
	else
	{
		self notify(#"hash_75cc1f791bba6c66");
		if(isdefined(self.var_72ef3ede))
		{
			stopfx(fieldname, self.var_72ef3ede);
			self.var_72ef3ede = undefined;
		}
		if(isarray(self.var_19741e6c))
		{
			foreach(n_fx_id in self.var_19741e6c)
			{
				stopfx(fieldname, n_fx_id);
			}
			self.var_19741e6c = undefined;
		}
	}
}

/*
	Name: function_3d9b3a
	Namespace: namespace_2ab93693
	Checksum: 0xC60BD4DB
	Offset: 0x7B8
	Size: 0x1B8
	Parameters: 1
	Flags: Linked, Private
*/
function private function_3d9b3a(localclientnum)
{
	self endon(#"death", #"hash_75cc1f791bba6c66");
	wait(1);
	a_str_tags = [];
	a_str_tags[0] = "j_elbow_le";
	a_str_tags[1] = "j_elbow_ri";
	a_str_tags[2] = "j_knee_ri";
	a_str_tags[3] = "j_knee_le";
	a_str_tags = array::randomize(a_str_tags);
	self.var_19741e6c[0] = util::playfxontag(localclientnum, #"hash_b0b53c54df06f0d", self, a_str_tags[0]);
	wait(1);
	a_str_tags[0] = "j_wrist_ri";
	a_str_tags[1] = "j_wrist_le";
	if(!is_true(self.missinglegs))
	{
		a_str_tags[2] = "j_ankle_ri";
		a_str_tags[3] = "j_ankle_le";
	}
	a_str_tags = array::randomize(a_str_tags);
	self.var_19741e6c[1] = util::playfxontag(localclientnum, #"hash_b0b53c54df06f0d", self, a_str_tags[0]);
	self.var_19741e6c[2] = util::playfxontag(localclientnum, #"hash_b0b53c54df06f0d", self, a_str_tags[1]);
}

/*
	Name: function_4d8be86
	Namespace: namespace_2ab93693
	Checksum: 0xB3C81004
	Offset: 0x978
	Size: 0x106
	Parameters: 7
	Flags: Linked
*/
function function_4d8be86(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump)
	{
		if(isdefined(self.var_53e69fc6))
		{
			stopfx(fieldname, self.var_53e69fc6);
		}
		str_tag = "j_spineupper";
		if(!isdefined(self gettagorigin(str_tag)))
		{
			str_tag = "tag_origin";
		}
		self.var_53e69fc6 = util::playfxontag(fieldname, #"hash_396881a795d7d4c8", self, str_tag);
	}
	else if(isdefined(self.var_53e69fc6))
	{
		stopfx(fieldname, self.var_53e69fc6);
		self.var_53e69fc6 = undefined;
	}
}

