#using scripts\zm_common\zm_bgb_pack.gsc;
#using scripts\zm_common\zm_bgb.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace zm_trial_disable_bgbs;

/*
	Name: function_93b3ef54
	Namespace: zm_trial_disable_bgbs
	Checksum: 0x6BAEF6C
	Offset: 0x80
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_93b3ef54()
{
	level notify(-1332455713);
}

/*
	Name: __init__system__
	Namespace: zm_trial_disable_bgbs
	Checksum: 0x5ED2167E
	Offset: 0xA0
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
	Checksum: 0x84E0CF04
	Offset: 0xE8
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
	Checksum: 0x83A294D0
	Offset: 0x150
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
	Checksum: 0x7A40BE99
	Offset: 0x230
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
	Checksum: 0x6BC3F029
	Offset: 0x300
	Size: 0x32
	Parameters: 0
	Flags: Linked
*/
function is_active()
{
	challenge = zm_trial::function_a36e8c38(#"disable_bgbs");
	return isdefined(challenge);
}

