#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace zm_trial_activate_hazards;

/*
	Name: function_284bd147
	Namespace: zm_trial_activate_hazards
	Checksum: 0xD0AC21A1
	Offset: 0x78
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_284bd147()
{
	level notify(-2146291385);
}

/*
	Name: __init__system__
	Namespace: zm_trial_activate_hazards
	Checksum: 0x36F40F58
	Offset: 0x98
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_trial_activate_hazards", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_trial_activate_hazards
	Checksum: 0x8FB20F87
	Offset: 0xE0
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
	zm_trial::register_challenge(#"activate_hazards", &on_begin, &on_end);
}

/*
	Name: on_begin
	Namespace: zm_trial_activate_hazards
	Checksum: 0xAFC2D417
	Offset: 0x148
	Size: 0x14
	Parameters: 0
	Flags: Private
*/
function private on_begin()
{
	level.var_2d307e50 = 1;
}

/*
	Name: on_end
	Namespace: zm_trial_activate_hazards
	Checksum: 0x27EC1289
	Offset: 0x168
	Size: 0x16
	Parameters: 1
	Flags: Private
*/
function private on_end(round_reset)
{
	level.var_2d307e50 = undefined;
}

