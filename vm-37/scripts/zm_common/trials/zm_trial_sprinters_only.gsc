#using script_444bc5b4fa0fe14f;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_10ecac2c;

/*
	Name: __init__system__
	Namespace: namespace_10ecac2c
	Checksum: 0x63CE723
	Offset: 0x88
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
	Checksum: 0xC63678EC
	Offset: 0xD0
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
	Checksum: 0x8EDD2659
	Offset: 0x138
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
	Checksum: 0xA1C936D6
	Offset: 0x198
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

