#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace zm_trial_survive;

/*
	Name: __init__system__
	Namespace: zm_trial_survive
	Checksum: 0x98BA0EC4
	Offset: 0x70
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_trial_survive", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_trial_survive
	Checksum: 0x61733CA9
	Offset: 0xB8
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
	zm_trial::register_challenge(#"survive", &on_begin, &on_end);
}

/*
	Name: on_begin
	Namespace: zm_trial_survive
	Checksum: 0x80F724D1
	Offset: 0x120
	Size: 0x4
	Parameters: 0
	Flags: Private
*/
function private on_begin()
{
}

/*
	Name: on_end
	Namespace: zm_trial_survive
	Checksum: 0xF5603B6C
	Offset: 0x130
	Size: 0xC
	Parameters: 1
	Flags: Private
*/
function private on_end(round_reset)
{
}

