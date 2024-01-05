#using scripts\zm_common\zm_bgb_pack.gsc;
#using scripts\zm_common\zm_bgb.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace zm_trial_disable_bgbs;

/*
	Name: __init__system__
	Namespace: zm_trial_disable_bgbs
	Checksum: 0xF1FDB10A
	Offset: 0x80
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_trial_disable_bgbs", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_trial_disable_bgbs
	Checksum: 0x592AA161
	Offset: 0xC8
	Size: 0x5C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!zm_trial::is_trial_mode())
	{
		return;
	}
	zm_trial::register_challenge(#"disable_bgbs", &on_begin, &on_end);
}

/*
	Name: on_begin
	Namespace: zm_trial_disable_bgbs
	Checksum: 0x81954A41
	Offset: 0x130
	Size: 0xD8
	Parameters: 0
	Flags: Linked, Private
*/
function private on_begin()
{
	level zm_trial::function_2b3a3307(1);
	level zm_trial::function_19a1098f(1);
	foreach(player in getplayers())
	{
		player bgb::take();
		player bgb_pack::function_ac9cb612(1);
	}
}

/*
	Name: on_end
	Namespace: zm_trial_disable_bgbs
	Checksum: 0xFDD94551
	Offset: 0x210
	Size: 0xC8
	Parameters: 1
	Flags: Linked, Private
*/
function private on_end(round_reset)
{
	level zm_trial::function_2b3a3307(0);
	level zm_trial::function_19a1098f(0);
	foreach(player in getplayers())
	{
		player bgb_pack::function_ac9cb612(0);
	}
}

/*
	Name: is_active
	Namespace: zm_trial_disable_bgbs
	Checksum: 0x1A28AAE9
	Offset: 0x2E0
	Size: 0x32
	Parameters: 0
	Flags: Linked
*/
function is_active()
{
	challenge = zm_trial::function_a36e8c38(#"disable_bgbs");
	return isdefined(challenge);
}

