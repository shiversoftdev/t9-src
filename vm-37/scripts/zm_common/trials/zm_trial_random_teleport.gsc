#using scripts\zm_common\bgbs\zm_bgb_anywhere_but_here.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace zm_trial_random_teleport;

/*
	Name: __init__system__
	Namespace: zm_trial_random_teleport
	Checksum: 0x5A56EC5C
	Offset: 0xB8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_trial_random_teleport", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_trial_random_teleport
	Checksum: 0x8D55ED9B
	Offset: 0x100
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
	zm_trial::register_challenge(#"random_teleport", &on_begin, &on_end);
}

/*
	Name: on_begin
	Namespace: zm_trial_random_teleport
	Checksum: 0x544E4BF3
	Offset: 0x168
	Size: 0xE0
	Parameters: 2
	Flags: Private
*/
function private on_begin(n_min_time, n_max_time)
{
	level.var_935c100a = zm_trial::function_5769f26a(n_min_time);
	level.var_33146b2e = zm_trial::function_5769f26a(n_max_time);
	foreach(player in getplayers())
	{
		player thread function_6a04c6e6();
	}
}

/*
	Name: on_end
	Namespace: zm_trial_random_teleport
	Checksum: 0x1FFD9F84
	Offset: 0x250
	Size: 0xE8
	Parameters: 1
	Flags: Private
*/
function private on_end(round_reset)
{
	level notify(#"hash_34f9cf7500b33c6b");
	foreach(player in getplayers())
	{
		player val::reset(#"hash_7d2b25df35ca5b3", "freezecontrols");
		player val::reset(#"hash_7d2b25df35ca5b3", "ignoreme");
	}
}

/*
	Name: is_active
	Namespace: zm_trial_random_teleport
	Checksum: 0xF45EB430
	Offset: 0x340
	Size: 0x32
	Parameters: 0
	Flags: None
*/
function is_active()
{
	challenge = zm_trial::function_a36e8c38(#"random_teleport");
	return isdefined(challenge);
}

/*
	Name: function_6a04c6e6
	Namespace: zm_trial_random_teleport
	Checksum: 0x93AFD656
	Offset: 0x380
	Size: 0xC8
	Parameters: 0
	Flags: Private
*/
function private function_6a04c6e6()
{
	self endon(#"disconnect");
	level endon(#"hash_34f9cf7500b33c6b", #"end_game");
	while(true)
	{
		wait(randomfloatrange(level.var_935c100a, level.var_33146b2e));
		if(isalive(self))
		{
			if(self isusingoffhand())
			{
				self forceoffhandend();
			}
			self zm_bgb_anywhere_but_here::activation(0);
		}
	}
}

