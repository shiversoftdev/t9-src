#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace zm_trial_disable_hud;

/*
	Name: __init__system__
	Namespace: zm_trial_disable_hud
	Checksum: 0x215A1FC8
	Offset: 0xB8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_trial_disable_hud", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_trial_disable_hud
	Checksum: 0x50F18CE9
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
	zm_trial::register_challenge(#"disable_hud", &on_begin, &on_end);
}

/*
	Name: on_begin
	Namespace: zm_trial_disable_hud
	Checksum: 0x4F0A6DCB
	Offset: 0x168
	Size: 0x1C
	Parameters: 0
	Flags: Private
*/
function private on_begin()
{
	level thread function_afe4a356();
}

/*
	Name: function_afe4a356
	Namespace: zm_trial_disable_hud
	Checksum: 0x2FE5165B
	Offset: 0x190
	Size: 0x110
	Parameters: 0
	Flags: None
*/
function function_afe4a356()
{
	level endon(#"hash_7646638df88a3656", #"end_game");
	wait(12);
	level.var_dc60105c = 1;
	level clientfield::set_world_uimodel("ZMHudGlobal.trials.hudDeactivated", 1);
	foreach(player in getplayers())
	{
		player function_e0c7d69(0);
		player playsoundtoplayer(#"hash_79fced3c02a68283", player);
	}
}

/*
	Name: on_end
	Namespace: zm_trial_disable_hud
	Checksum: 0xA347C605
	Offset: 0x2A8
	Size: 0x130
	Parameters: 1
	Flags: Private
*/
function private on_end(round_reset)
{
	level clientfield::set_world_uimodel("ZMHudGlobal.trials.hudDeactivated", 0);
	level.var_dc60105c = undefined;
	if(level flag::get("round_reset") || level flag::get(#"trial_failed"))
	{
		return;
	}
	foreach(player in getplayers())
	{
		player function_e0c7d69(1);
		player playsoundtoplayer(#"hash_18aab7ffde259877", player);
	}
}

