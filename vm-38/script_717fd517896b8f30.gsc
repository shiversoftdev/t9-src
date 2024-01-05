#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_3c6f8637;

/*
	Name: function_3d77c310
	Namespace: namespace_3c6f8637
	Checksum: 0xAB32D18
	Offset: 0x78
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_3d77c310()
{
	level notify(-1928583849);
}

#namespace zm_trial_randomize_perks;

/*
	Name: __init__system__
	Namespace: zm_trial_randomize_perks
	Checksum: 0xC3D448CE
	Offset: 0x98
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_24dadafee669bfbe", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_trial_randomize_perks
	Checksum: 0x4A993D69
	Offset: 0xE0
	Size: 0x5C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(!zm_trial::is_trial_mode())
	{
		return;
	}
	zm_trial::register_challenge(#"hash_45ef12aaa7c1d585", &on_begin, &on_end);
}

/*
	Name: on_begin
	Namespace: zm_trial_randomize_perks
	Checksum: 0x4C4788AE
	Offset: 0x148
	Size: 0xD0
	Parameters: 2
	Flags: Private
*/
function private on_begin(var_e38c7612, var_2d4ba9d4)
{
	self.var_e38c7612 = zm_trial::function_5769f26a(var_e38c7612);
	self.var_2d4ba9d4 = isdefined(var_2d4ba9d4);
	foreach(player in getplayers())
	{
		player thread function_e4c3443c(self);
	}
}

/*
	Name: on_end
	Namespace: zm_trial_randomize_perks
	Checksum: 0x9EBF5CCE
	Offset: 0x220
	Size: 0x194
	Parameters: 1
	Flags: Private
*/
function private on_end(round_reset)
{
	if(!round_reset)
	{
		var_696c3b4 = [];
		foreach(player in getplayers())
		{
			if(!is_true(player.var_167bc422))
			{
				if(!isdefined(var_696c3b4))
				{
					var_696c3b4 = [];
				}
				else if(!isarray(var_696c3b4))
				{
					var_696c3b4 = array(var_696c3b4);
				}
				var_696c3b4[var_696c3b4.size] = player;
			}
			player.var_167bc422 = undefined;
			player zm_trial_util::function_f3aacffb();
		}
		if(var_696c3b4.size)
		{
			if(is_true(self.var_2d4ba9d4))
			{
				var_ded5d2ed = #"hash_192dc062b9c5de31";
			}
			else
			{
				var_ded5d2ed = #"hash_26f44827b2b24825";
			}
			zm_trial::fail(var_ded5d2ed, var_696c3b4);
		}
	}
}

/*
	Name: is_active
	Namespace: zm_trial_randomize_perks
	Checksum: 0xD4278AD9
	Offset: 0x3C0
	Size: 0x3A
	Parameters: 1
	Flags: None
*/
function is_active(var_34f09024)
{
	challenge = zm_trial::function_a36e8c38(#"hash_45ef12aaa7c1d585");
	return isdefined(challenge);
}

/*
	Name: function_e4c3443c
	Namespace: zm_trial_randomize_perks
	Checksum: 0x55E18ABD
	Offset: 0x408
	Size: 0x1EE
	Parameters: 1
	Flags: Private
*/
function private function_e4c3443c(s_challenge)
{
	level endon(#"hash_7646638df88a3656");
	self endon(#"disconnect");
	while(true)
	{
		if(is_true(s_challenge.var_2d4ba9d4))
		{
			if(!is_true(self.var_167bc422) && self.score < s_challenge.var_e38c7612)
			{
				self zm_trial_util::function_63060af4(1);
				self.var_167bc422 = 1;
			}
			else if(is_true(self.var_167bc422) && self.score >= s_challenge.var_e38c7612)
			{
				self zm_trial_util::function_63060af4(0);
				self.var_167bc422 = undefined;
			}
		}
		else
		{
			if(!is_true(self.var_167bc422) && self.score >= s_challenge.var_e38c7612)
			{
				self zm_trial_util::function_63060af4(1);
				self.var_167bc422 = 1;
			}
			else if(is_true(self.var_167bc422) && self.score < s_challenge.var_e38c7612)
			{
				self zm_trial_util::function_63060af4(0);
				self.var_167bc422 = undefined;
			}
		}
		self waittill(#"earned_points", #"spent_points", #"reduced_points");
	}
}

