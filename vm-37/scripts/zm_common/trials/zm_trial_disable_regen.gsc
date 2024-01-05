#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\player\player_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace zm_trial_disable_regen;

/*
	Name: __init__system__
	Namespace: zm_trial_disable_regen
	Checksum: 0xD84E68D1
	Offset: 0xB8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_trial_disable_regen", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_trial_disable_regen
	Checksum: 0xDD9847E4
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
	zm_trial::register_challenge(#"disable_regen", &on_begin, &on_end);
}

/*
	Name: on_begin
	Namespace: zm_trial_disable_regen
	Checksum: 0x2851B49E
	Offset: 0x168
	Size: 0xA0
	Parameters: 0
	Flags: Private
*/
function private on_begin()
{
	foreach(player in getplayers())
	{
		player val::set("trials_disable_regen", "health_regen", 0);
	}
}

/*
	Name: on_end
	Namespace: zm_trial_disable_regen
	Checksum: 0xCB445E42
	Offset: 0x210
	Size: 0xA8
	Parameters: 1
	Flags: Private
*/
function private on_end(round_reset)
{
	foreach(player in getplayers())
	{
		player val::reset("trials_disable_regen", "health_regen");
	}
}

/*
	Name: is_active
	Namespace: zm_trial_disable_regen
	Checksum: 0x54456A6E
	Offset: 0x2C0
	Size: 0x3A
	Parameters: 1
	Flags: None
*/
function is_active(var_34f09024)
{
	challenge = zm_trial::function_a36e8c38(#"disable_regen");
	return isdefined(challenge);
}

