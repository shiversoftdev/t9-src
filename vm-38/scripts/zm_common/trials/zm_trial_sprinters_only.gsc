#using script_444bc5b4fa0fe14f;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_10ecac2c;

/*
	Name: function_9f5b5814
	Namespace: namespace_10ecac2c
	Checksum: 0x99B77A51
	Offset: 0x88
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_9f5b5814()
{
	level notify(988995949);
}

/*
	Name: __init__system__
	Namespace: namespace_10ecac2c
	Checksum: 0x8F3D0293
	Offset: 0xA8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_6850ba7908370033", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_10ecac2c
	Checksum: 0xE9E94B06
	Offset: 0xF0
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
	zm_trial::register_challenge(#"sprinters_only", &on_begin, &on_end);
}

/*
	Name: on_begin
	Namespace: namespace_10ecac2c
	Checksum: 0x78DD0E45
	Offset: 0x158
	Size: 0x56
	Parameters: 0
	Flags: Private
*/
function private on_begin()
{
	level.var_43fb4347 = "sprint";
	level.var_102b1301 = "sprint";
	level.var_b38bb71 = 1;
	level.var_ef0aada0 = 1;
}

/*
	Name: on_end
	Namespace: namespace_10ecac2c
	Checksum: 0xE8A1952E
	Offset: 0x1B8
	Size: 0x3C
	Parameters: 1
	Flags: Private
*/
function private on_end(round_reset)
{
	level.var_43fb4347 = undefined;
	level.var_102b1301 = undefined;
	level.var_b38bb71 = 0;
	level.var_ef0aada0 = 0;
}

