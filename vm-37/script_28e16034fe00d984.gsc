#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using script_65fbfb5ecb1f899e;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace namespace_96850e69;

/*
	Name: __init__system__
	Namespace: namespace_96850e69
	Checksum: 0xAC6D841C
	Offset: 0x140
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_3ee5d3ee068a8cc", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_96850e69
	Checksum: 0x3542C647
	Offset: 0x188
	Size: 0xE4
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	clientfield::register("toplayer", "show_objectives", 1, 2, "int", &show_objectives, 0, 0);
	callback::add_callback(#"on_player_spawned", &on_player_spawned);
	/#
		function_5ac4dc99("", 3);
		function_5ac4dc99("", 2);
		function_5ac4dc99("", 1);
	#/
}

/*
	Name: show_objectives
	Namespace: namespace_96850e69
	Checksum: 0x952BC4C4
	Offset: 0x278
	Size: 0x6E
	Parameters: 7
	Flags: Private
*/
function private show_objectives(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self notify(#"show_objectives", {#hash_3094b3d4:bwastimejump});
	}
}

/*
	Name: on_player_spawned
	Namespace: namespace_96850e69
	Checksum: 0x9C4C5539
	Offset: 0x2F0
	Size: 0x12C
	Parameters: 1
	Flags: Private
*/
function private on_player_spawned(localclientnum)
{
	self.var_4a858373 = createuimodel(createuimodel(function_5f72e972(#"hash_410fe12a68d6e801"), "cpObjectiveUiData"), "showHideHint");
	self.var_e64f428b = createuimodel(function_1df4c3b0(localclientnum, #"hud_items"), "globalWaypointAlpha");
	self.var_f74ea54b = createuimodel(function_1df4c3b0(localclientnum, #"hud_items"), "hideOldObjectives");
	self thread function_5c67d66(localclientnum);
	self thread function_fd86c6ac(localclientnum);
	self thread function_6311c9e8();
}

/*
	Name: function_5c67d66
	Namespace: namespace_96850e69
	Checksum: 0xC9692BCF
	Offset: 0x428
	Size: 0x150
	Parameters: 1
	Flags: Private
*/
function private function_5c67d66(localclientnum)
{
	self endon(#"death");
	setuimodelvalue(self.var_4a858373, 0);
	setuimodelvalue(self.var_e64f428b, 0);
	setuimodelvalue(self.var_f74ea54b, 0);
	while(true)
	{
		ret = undefined;
		ret = self waittill(#"show_objectives");
		if(is_true(self.var_d52a8a6e))
		{
			continue;
		}
		setuimodelvalue(self.var_f74ea54b, ret.var_3094b3d4 === 1);
		self thread easing::function_a037b7c9(localclientnum, self.var_e64f428b, 1, 0, #"linear");
		self thread function_cd9face2(localclientnum, isdefined(ret.var_3094b3d4));
	}
}

/*
	Name: function_cd9face2
	Namespace: namespace_96850e69
	Checksum: 0x1581605F
	Offset: 0x580
	Size: 0x114
	Parameters: 2
	Flags: Private
*/
function private function_cd9face2(localclientnum, var_d17dd25a)
{
	self endon(#"show_objectives", #"hash_3b00cabe4586a186", #"death");
	delay = 3;
	/#
		delay = getdvarfloat(#"hash_6d102de219912e53", delay);
	#/
	if(delay > 0)
	{
		wait(delay);
	}
	if(var_d17dd25a)
	{
		setuimodelvalue(self.var_4a858373, 0);
	}
	/#
		var_d17dd25a = var_d17dd25a || getdvarint(#"hash_c1cc8af3905f35a", 1) == 0;
	#/
	self thread function_aa3ed46f(localclientnum, self.var_e64f428b, var_d17dd25a);
}

/*
	Name: function_fd86c6ac
	Namespace: namespace_96850e69
	Checksum: 0x10C055AD
	Offset: 0x6A0
	Size: 0xB8
	Parameters: 1
	Flags: Private
*/
function private function_fd86c6ac(localclientnum)
{
	self endon(#"death");
	while(true)
	{
		self waittill(#"hash_3b00cabe4586a186");
		if(self postfx::function_556665f2("pstfx_highlight_objectives"))
		{
			self thread postfx::stoppostfxbundle("pstfx_highlight_objectives");
		}
		self thread easing::function_a037b7c9(localclientnum, self.var_e64f428b, 0, 0, #"linear");
	}
}

/*
	Name: function_aa3ed46f
	Namespace: namespace_96850e69
	Checksum: 0x465CE48A
	Offset: 0x760
	Size: 0x154
	Parameters: 3
	Flags: Private
*/
function private function_aa3ed46f(localclientnum, uimodel, var_d17dd25a)
{
	self endon(#"show_objectives", #"hash_3b00cabe4586a186", #"death");
	if(!is_true(var_d17dd25a))
	{
		while(length(self util::function_ca4b4e19(localclientnum, 0)[#"move"]) < 0.2)
		{
			waitframe(1);
		}
	}
	if(self postfx::function_556665f2("pstfx_highlight_objectives"))
	{
		self thread postfx::exitpostfxbundle("pstfx_highlight_objectives");
	}
	fade_time = 2;
	/#
		fade_time = getdvarfloat(#"hash_6cdcdf6a45d1f925", fade_time);
	#/
	self thread easing::function_a037b7c9(localclientnum, uimodel, 0, fade_time, #"linear");
}

/*
	Name: function_6311c9e8
	Namespace: namespace_96850e69
	Checksum: 0xEDE344F7
	Offset: 0x8C0
	Size: 0xB2
	Parameters: 0
	Flags: Private
*/
function private function_6311c9e8()
{
	self endon(#"death");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"menuresponse");
		response = waitresult.response;
		intpayload = waitresult.intpayload;
		if(response == "objective_splash")
		{
			self.var_d52a8a6e = intpayload != 0;
			if(self.var_d52a8a6e)
			{
				self notify(#"hash_3b00cabe4586a186");
			}
		}
	}
}

