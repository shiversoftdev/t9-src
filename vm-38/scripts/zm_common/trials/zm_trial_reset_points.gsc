#using scripts\zm_common\zm_bgb.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_laststand.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace zm_trial_reset_points;

/*
	Name: function_c57674d3
	Namespace: zm_trial_reset_points
	Checksum: 0x5240BDC5
	Offset: 0x90
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_c57674d3()
{
	level notify(226547962);
}

/*
	Name: __init__system__
	Namespace: zm_trial_reset_points
	Checksum: 0x37970B4E
	Offset: 0xB0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_trial_reset_points", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_trial_reset_points
	Checksum: 0x7D6792D0
	Offset: 0xF8
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
	zm_trial::register_challenge(#"reset_points", &on_begin, &on_end);
}

/*
	Name: on_begin
	Namespace: zm_trial_reset_points
	Checksum: 0x4967FD0
	Offset: 0x160
	Size: 0xD0
	Parameters: 1
	Flags: Private
*/
function private on_begin(var_899c6d17)
{
	if(isdefined(var_899c6d17))
	{
		var_899c6d17 = zm_trial::function_5769f26a(var_899c6d17);
	}
	else
	{
		var_899c6d17 = 0;
	}
	wait(6);
	foreach(player in getplayers())
	{
		player thread reset_points(var_899c6d17);
	}
}

/*
	Name: reset_points
	Namespace: zm_trial_reset_points
	Checksum: 0x40941CEC
	Offset: 0x238
	Size: 0x8C
	Parameters: 1
	Flags: Private
*/
function private reset_points(var_899c6d17)
{
	if(self bgb::is_enabled(#"zm_bgb_shopping_free"))
	{
		self bgb::do_one_shot_use();
		self playsoundtoplayer(#"zmb_bgb_shoppingfree_coinreturn", self);
		return;
	}
	self.score = var_899c6d17;
	self.pers[#"score"] = var_899c6d17;
}

/*
	Name: on_end
	Namespace: zm_trial_reset_points
	Checksum: 0x14246399
	Offset: 0x2D0
	Size: 0xC
	Parameters: 1
	Flags: Private
*/
function private on_end(round_reset)
{
}

