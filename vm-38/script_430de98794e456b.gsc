#using script_41123605e9d4d6ac;
#using scripts\core_common\beam_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_b7a7e548;

/*
	Name: function_7f8843bd
	Namespace: namespace_b7a7e548
	Checksum: 0x3217D866
	Offset: 0x148
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_7f8843bd()
{
	level notify(1020402015);
}

#namespace namespace_e5d0906e;

/*
	Name: init
	Namespace: namespace_e5d0906e
	Checksum: 0x9FAADE40
	Offset: 0x168
	Size: 0x2D4
	Parameters: 0
	Flags: Linked
*/
function init()
{
	clientfield::register("world", "" + #"hash_1c7fca29ab341f83", 16000, 3, "int", &function_9f1f304b, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_2800af14ecd6c20c", 16000, 1, "int", &function_ea74c7dc, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_7a2578157328cf2b", 16000, getminbitcountfornum(3), "int", &function_773a9730, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_112d67305f861fe", 16000, 1, "int", &function_3bab499f, 0, 0);
	clientfield::register("world", "" + #"hash_d36f73b86a1e0b4", 16000, 3, "int", &function_b4140818, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_3ce728c2f6b351eb", 16000, 1, "int", &function_f68e78d1, 0, 0);
	clientfield::register("actor", "" + #"hash_ebf3c511bdc3a01", 16000, 1, "counter", &function_81fad569, 0, 0);
	clientfield::register("toplayer", "" + #"hash_441fa29cf6f39e0a", 16000, 1, "counter", &function_5dab9c6d, 0, 0);
}

/*
	Name: function_9f1f304b
	Namespace: namespace_e5d0906e
	Checksum: 0x93279A
	Offset: 0x448
	Size: 0x19C
	Parameters: 7
	Flags: Linked
*/
function function_9f1f304b(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	switch(bwastimejump)
	{
		case 0:
		{
			if(isdefined(level.var_e2a95e85))
			{
				stopfx(fieldname, level.var_e2a95e85);
				level.var_e2a95e85 = undefined;
			}
			return;
		}
		case 1:
		default:
		{
			str_loc = #"hash_4036f38ad60f61f";
			break;
		}
		case 2:
		{
			str_loc = #"hash_4037038ad60f7d2";
			break;
		}
		case 3:
		{
			str_loc = #"hash_4037138ad60f985";
			break;
		}
	}
	s_loc = struct::get(str_loc);
	level.var_e2a95e85 = playfx(fieldname, #"hash_530080cfd8b5d707", s_loc.origin, anglestoup(s_loc.angles + vectorscale((1, 0, 0), 90)));
}

/*
	Name: function_ea74c7dc
	Namespace: namespace_e5d0906e
	Checksum: 0x81469C9E
	Offset: 0x5F0
	Size: 0x1B4
	Parameters: 7
	Flags: Linked, Private
*/
function private function_ea74c7dc(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		self playsound(fieldname, #"hash_44071fbabf0a1211");
		level.var_66477fdf = playfx(fieldname, #"hash_38c212dea1c32d51", self.origin + vectorscale((0, 0, 1), 7000), anglestoforward(self.angles), anglestoup(self.angles + vectorscale((1, 0, 0), 90)));
		level.var_636214dd = playfx(fieldname, #"hash_3a2680041b2dde0c", self.origin, anglestoforward(self.angles), anglestoup(self.angles));
	}
	else
	{
		if(isdefined(level.var_66477fdf))
		{
			stopfx(fieldname, level.var_66477fdf);
		}
		if(isdefined(level.var_636214dd))
		{
			stopfx(fieldname, level.var_636214dd);
		}
	}
}

/*
	Name: function_773a9730
	Namespace: namespace_e5d0906e
	Checksum: 0x7DCAA894
	Offset: 0x7B0
	Size: 0x1E4
	Parameters: 7
	Flags: Linked
*/
function function_773a9730(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump <= 0)
	{
		if(isdefined(level.var_c05f7f6))
		{
			beam::kill(level.var_c05f7f6, "tag_origin", self, "j_head_mouth_scale", "beam9_zm_control_point_orda_attack");
			level.var_c05f7f6 delete();
			level.var_c05f7f6 = undefined;
		}
		return;
	}
	a_s_origins = struct::get_array(#"hash_1825c81c13f9ebf6");
	foreach(s_origin in a_s_origins)
	{
		if(s_origin.script_int == bwastimejump)
		{
			break;
		}
	}
	if(!isdefined(s_origin))
	{
		return;
	}
	level.var_c05f7f6 = util::spawn_model(fieldname, #"tag_origin", s_origin.origin + vectorscale((0, 0, 1), 96));
	beam::launch(level.var_c05f7f6, "tag_origin", self, "j_head_mouth_scale", "beam9_zm_control_point_orda_attack", 1);
}

/*
	Name: function_3bab499f
	Namespace: namespace_e5d0906e
	Checksum: 0x2352B34F
	Offset: 0x9A0
	Size: 0x196
	Parameters: 7
	Flags: Linked
*/
function function_3bab499f(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump)
	{
		if(!isdefined(self.var_fa63b371))
		{
			self playsound(fieldname, #"hash_4b620f72a399de7e");
			self.var_fa63b371 = playfx(fieldname, #"hash_57ae7e6f9140093f", self.origin, anglestoforward(self.angles), anglestoup(self.angles));
		}
	}
	else if(isdefined(self.var_fa63b371))
	{
		self playsound(fieldname, #"hash_7ab1d427d19ae56a");
		playfx(fieldname, #"hash_2786498a222adb04", self.origin, anglestoforward(self.angles), anglestoup(self.angles));
		killfx(fieldname, self.var_fa63b371);
		self.var_fa63b371 = undefined;
	}
}

/*
	Name: function_81fad569
	Namespace: namespace_e5d0906e
	Checksum: 0xBD2C1E5B
	Offset: 0xB40
	Size: 0x104
	Parameters: 7
	Flags: Linked
*/
function function_81fad569(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	v_origin = self.origin;
	v_forward = anglestoforward(self.angles);
	v_up = anglestoup(self.angles);
	n_fx = playfx(bwasdemojump, #"hash_6c4153052b14bf8b", v_origin, v_forward, v_up);
	wait(1);
	playfx(bwasdemojump, #"hash_4d69a24c0a6648e0", v_origin, v_forward, v_up);
	killfx(bwasdemojump, n_fx);
}

/*
	Name: function_b4140818
	Namespace: namespace_e5d0906e
	Checksum: 0xC79EEF31
	Offset: 0xC50
	Size: 0x400
	Parameters: 7
	Flags: Linked
*/
function function_b4140818(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	var_792c2b75 = array((-1303, -12365, 7365));
	var_f901ab1e = array((1147, -15229, 7409));
	var_b684feb = array((-2603, -15245, 7502));
	if(bwasdemojump === 1)
	{
		foreach(loc in var_792c2b75)
		{
			soundloopemitter("evt_gold_alarm_oneshot", loc);
		}
	}
	else
	{
		if(bwasdemojump === 2)
		{
			foreach(loc in var_f901ab1e)
			{
				soundloopemitter("evt_gold_alarm_oneshot", loc);
			}
		}
		else
		{
			if(bwasdemojump === 3)
			{
				foreach(loc in var_b684feb)
				{
					soundloopemitter("evt_gold_alarm_oneshot", loc);
				}
			}
			else
			{
				if(isdefined(var_792c2b75))
				{
					foreach(loc in var_792c2b75)
					{
						soundstoploopemitter("evt_gold_alarm_oneshot", loc);
					}
				}
				if(isdefined(var_f901ab1e))
				{
					foreach(loc in var_f901ab1e)
					{
						soundstoploopemitter("evt_gold_alarm_oneshot", loc);
					}
				}
				if(isdefined(var_b684feb))
				{
					foreach(loc in var_b684feb)
					{
						soundstoploopemitter("evt_gold_alarm_oneshot", loc);
					}
				}
			}
		}
	}
}

/*
	Name: function_f68e78d1
	Namespace: namespace_e5d0906e
	Checksum: 0x802DA87A
	Offset: 0x1058
	Size: 0xA4
	Parameters: 7
	Flags: Linked
*/
function function_f68e78d1(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump == 1)
	{
		self function_bf9d3071("rob_orda_dissolve");
	}
	else
	{
		self function_5d482e78("rob_orda_dissolve");
	}
	self thread namespace_cc727a3b::function_5565725d(fieldname, bwasdemojump, "rob_orda_dissolve");
}

/*
	Name: function_5dab9c6d
	Namespace: namespace_e5d0906e
	Checksum: 0xF1D653CB
	Offset: 0x1108
	Size: 0x6C
	Parameters: 7
	Flags: Linked
*/
function function_5dab9c6d(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump)
	{
		self playrumbleonentity(fieldname, #"hash_3346eab49e855d23");
	}
}

