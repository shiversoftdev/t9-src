#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace zm_trial_survive;

/*
	Name: function_6cd5f7a5
	Namespace: zm_trial_survive
	Checksum: 0xF20A2907
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_6cd5f7a5()
{
	level notify(1461170711);
}

/*
	Name: __init__system__
	Namespace: zm_trial_survive
	Checksum: 0x3795A9B0
	Offset: 0x90
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
	Checksum: 0xBCB952CC
	Offset: 0xD8
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
	Offset: 0x140
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
	Checksum: 0x69C59D6F
	Offset: 0x150
	Size: 0xC
	Parameters: 1
	Flags: Private
*/
function private on_end(round_reset)
{
}

