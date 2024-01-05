#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_d579463e;

/*
	Name: __init__system__
	Namespace: namespace_d579463e
	Checksum: 0xD8316961
	Offset: 0x88
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_5993cb43cbe55c17", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_d579463e
	Checksum: 0xC1D0F9D0
	Offset: 0xD0
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
	zm_trial::register_challenge(#"turn_on_power", &on_begin, &on_end);
}

/*
	Name: on_begin
	Namespace: namespace_d579463e
	Checksum: 0xB4444B9F
	Offset: 0x138
	Size: 0x3C
	Parameters: 1
	Flags: Private
*/
function private on_begin(weapon_name)
{
	zm_trial_util::function_7d32b7d0(0);
	level thread function_83b71e7c();
}

/*
	Name: on_end
	Namespace: namespace_d579463e
	Checksum: 0x908D9506
	Offset: 0x180
	Size: 0xAC
	Parameters: 1
	Flags: Private
*/
function private on_end(round_reset)
{
	zm_trial_util::function_f3dbeda7();
	if(!round_reset)
	{
		if(!level flag::get(level.var_5bfd847e))
		{
			if(zm_utility::get_story() == 1)
			{
				zm_trial::fail(#"hash_ad3c47f53414b85");
			}
			else
			{
				zm_trial::fail(#"hash_765b6a6e9523c15a");
			}
		}
	}
}

/*
	Name: function_83b71e7c
	Namespace: namespace_d579463e
	Checksum: 0xBD88ED97
	Offset: 0x238
	Size: 0xA8
	Parameters: 0
	Flags: Private
*/
function private function_83b71e7c()
{
	level endon(#"hash_7646638df88a3656");
	self endon(#"death");
	while(true)
	{
		level flag::wait_till(level.var_5bfd847e);
		zm_trial_util::function_7d32b7d0(1);
		level flag::wait_till_clear(level.var_5bfd847e);
		zm_trial_util::function_7d32b7d0(0);
	}
}

