#using scripts\zm_common\zm_loadout.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace zm_trial_kill_with_special;

/*
	Name: function_94979309
	Namespace: zm_trial_kill_with_special
	Checksum: 0x3C8C1568
	Offset: 0x80
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_94979309()
{
	level notify(-359079414);
}

/*
	Name: __init__system__
	Namespace: zm_trial_kill_with_special
	Checksum: 0x1573F0F1
	Offset: 0xA0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"kill_with_special", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_trial_kill_with_special
	Checksum: 0x81A4ECF7
	Offset: 0xE8
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
	zm_trial::register_challenge(#"kill_with_special", &on_begin, &on_end);
}

/*
	Name: on_begin
	Namespace: zm_trial_kill_with_special
	Checksum: 0x80F724D1
	Offset: 0x150
	Size: 0x4
	Parameters: 0
	Flags: Private
*/
function private on_begin()
{
}

/*
	Name: on_end
	Namespace: zm_trial_kill_with_special
	Checksum: 0x8C4031D7
	Offset: 0x160
	Size: 0xA8
	Parameters: 1
	Flags: Private
*/
function private on_end(round_reset)
{
	if(round_reset)
	{
		foreach(e_player in level.players)
		{
			e_player gadgetpowerset(level.var_a53a05b5, 100);
		}
	}
}

