#using scripts\zm_common\zm_trial.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\math_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace namespace_a6aea2c6;

/*
	Name: __init__system__
	Namespace: namespace_a6aea2c6
	Checksum: 0xBD64BD32
	Offset: 0xC8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_2c983afcd92a9970", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_a6aea2c6
	Checksum: 0xC2AF4E60
	Offset: 0x110
	Size: 0x15C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!zm_trial::is_trial_mode())
	{
		return;
	}
	clientfield::register("toplayer", "" + #"hash_b905d796914b710", 14000, 1, "int", &function_1e14a14e, 0, 0);
	clientfield::register("toplayer", "" + #"hash_1b9477ddcf30191f", 16000, 1, "int", &function_b5ea67f1, 0, 0);
	clientfield::register("toplayer", "" + #"hash_52347bec3f1339fd", 16000, 4, "int", &function_cc4c5d4b, 0, 0);
	zm_trial::register_challenge(#"hash_6c768f3c15d55377", &on_begin, &on_end);
}

/*
	Name: on_begin
	Namespace: namespace_a6aea2c6
	Checksum: 0xFBB74764
	Offset: 0x278
	Size: 0xB2
	Parameters: 2
	Flags: Linked, Private
*/
function private on_begin(localclientnum, a_params)
{
	level.var_4ecf5754 = (isdefined(a_params[0]) ? a_params[0] : #"silent_film");
	switch(level.var_4ecf5754)
	{
		case "silent_film":
		{
			break;
		}
		case "hash_5a202c5d6f53d672":
		{
			break;
		}
		case "perk_drunk":
		{
			level thread function_777d7ba2();
			break;
		}
	}
}

/*
	Name: on_end
	Namespace: namespace_a6aea2c6
	Checksum: 0x9557E0FD
	Offset: 0x338
	Size: 0x5E
	Parameters: 1
	Flags: Linked, Private
*/
function private on_end(localclientnum)
{
	switch(level.var_4ecf5754)
	{
		case "silent_film":
		{
			break;
		}
		case "hash_5a202c5d6f53d672":
		{
			break;
		}
	}
	level.var_4ecf5754 = undefined;
}

/*
	Name: function_777d7ba2
	Namespace: namespace_a6aea2c6
	Checksum: 0xD31D2CDE
	Offset: 0x3A0
	Size: 0x94
	Parameters: 0
	Flags: Linked
*/
function function_777d7ba2()
{
	self notify("1da5c1009913aa99");
	self endon("1da5c1009913aa99");
	setdvar(#"slide_blur_enabled", 0);
	level waittill(#"end_game", #"hash_7646638df88a3656");
	setdvar(#"slide_blur_enabled", 1);
}

/*
	Name: is_active
	Namespace: namespace_a6aea2c6
	Checksum: 0xEC7A5C9B
	Offset: 0x440
	Size: 0x72
	Parameters: 1
	Flags: Linked
*/
function is_active(var_4ecf5754)
{
	if(!isdefined(var_4ecf5754))
	{
		var_4ecf5754 = #"silent_film";
	}
	s_challenge = zm_trial::function_a36e8c38(#"hash_6c768f3c15d55377");
	if(isdefined(s_challenge) && level.var_4ecf5754 === var_4ecf5754)
	{
		return true;
	}
	return false;
}

/*
	Name: function_1e14a14e
	Namespace: namespace_a6aea2c6
	Checksum: 0xDD878476
	Offset: 0x4C0
	Size: 0x8C
	Parameters: 7
	Flags: Linked, Private
*/
function private function_1e14a14e(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self postfx::playpostfxbundle(#"hash_2caf3cb56ac5fd8f");
	}
	else
	{
		self postfx::stoppostfxbundle(#"hash_2caf3cb56ac5fd8f");
	}
}

/*
	Name: function_b5ea67f1
	Namespace: namespace_a6aea2c6
	Checksum: 0xB3955F47
	Offset: 0x558
	Size: 0x114
	Parameters: 7
	Flags: Linked
*/
function function_b5ea67f1(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	if(bwastimejump)
	{
		if(self util::function_50ed1561(fieldname))
		{
			self thread function_9cf0edbf(fieldname, 0);
			self playsound(fieldname, #"hash_2b366662bb232751");
		}
	}
	else if(self util::function_50ed1561(fieldname))
	{
		self thread function_9cf0edbf(fieldname, 1);
		self playsound(fieldname, #"hash_499fa328163cfa80");
	}
}

/*
	Name: function_9cf0edbf
	Namespace: namespace_a6aea2c6
	Checksum: 0xAAC9EA2B
	Offset: 0x678
	Size: 0x1B2
	Parameters: 2
	Flags: Linked
*/
function function_9cf0edbf(localclientnum, b_show)
{
	self notify(#"hash_3dec19d02cb07e9b");
	self endon(#"hash_3dec19d02cb07e9b", #"death");
	level endon(#"hash_7646638df88a3656");
	while(true)
	{
		a_ai = getentarraybytype(localclientnum, 15);
		a_vh = getentarraybytype(localclientnum, 12);
		a_ai = arraycombine(a_ai, a_vh, 0, 0);
		foreach(ai in a_ai)
		{
			if(ai.team == #"axis")
			{
				if(b_show && !is_true(ai.var_d8b9c4bf))
				{
					ai show();
					continue;
				}
				ai hide();
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_cc4c5d4b
	Namespace: namespace_a6aea2c6
	Checksum: 0xFF602514
	Offset: 0x838
	Size: 0x1E6
	Parameters: 7
	Flags: Linked
*/
function function_cc4c5d4b(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		var_f18c8464 = math::clamp(bwastimejump, 1, 7);
		n_blur_amount = var_f18c8464 / 16;
		n_inner_radius = var_f18c8464 / 16;
		n_outer_radius = 1 - (var_f18c8464 / 16);
		enablespeedblur(fieldname, n_blur_amount, n_inner_radius, n_outer_radius);
		self setblur(var_f18c8464 * 2, 1);
		if(!isdefined(self.var_7c82d805))
		{
			self playsound(fieldname, #"hash_1fa4be2474b0c451");
			self.var_7c82d805 = self playloopsound(#"hash_509328253e0c2b81");
		}
	}
	else
	{
		disablespeedblur(fieldname);
		self setblur(0, 0);
		if(isdefined(self.var_7c82d805))
		{
			self playsound(fieldname, #"hash_4b8d428c3bccb4d4");
			self stoploopsound(self.var_7c82d805);
			self.var_7c82d805 = undefined;
		}
	}
}

