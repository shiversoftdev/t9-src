#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace zm_trial_crawlers_only;

/*
	Name: function_db3c3682
	Namespace: zm_trial_crawlers_only
	Checksum: 0xEACEE0FB
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_db3c3682()
{
	level notify(-1026489861);
}

/*
	Name: __init__system__
	Namespace: zm_trial_crawlers_only
	Checksum: 0x799D9DA9
	Offset: 0x90
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_trial_crawlers_only", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_trial_crawlers_only
	Checksum: 0xBDADD78E
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
	zm_trial::register_challenge(#"crawlers_only", &on_begin, &on_end);
}

/*
	Name: on_begin
	Namespace: zm_trial_crawlers_only
	Checksum: 0x254725DD
	Offset: 0x140
	Size: 0x52
	Parameters: 0
	Flags: Private
*/
function private on_begin()
{
	level.var_6d8a8e47 = 1;
	level.var_b38bb71 = 1;
	level.var_ef0aada0 = 1;
	level.var_d1b3ec4e = level.var_9b91564e;
	level.var_9b91564e = undefined;
}

/*
	Name: on_end
	Namespace: zm_trial_crawlers_only
	Checksum: 0xFA1EC527
	Offset: 0x1A0
	Size: 0x4E
	Parameters: 1
	Flags: Private
*/
function private on_end(round_reset)
{
	level.var_6d8a8e47 = 0;
	level.var_b38bb71 = 0;
	level.var_ef0aada0 = 0;
	level.var_9b91564e = level.var_d1b3ec4e;
	level.var_d1b3ec4e = undefined;
}

