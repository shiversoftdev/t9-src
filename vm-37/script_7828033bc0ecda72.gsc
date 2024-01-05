#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_7499819f;

/*
	Name: __init__system__
	Namespace: namespace_7499819f
	Checksum: 0x92E92ED3
	Offset: 0x80
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_3887e77731340f48", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_7499819f
	Checksum: 0xDE7BE24B
	Offset: 0xC8
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
	zm_trial::register_challenge(#"hash_b143bd998abdd27", &on_begin, &on_end);
}

/*
	Name: on_begin
	Namespace: namespace_7499819f
	Checksum: 0x2CCFCB62
	Offset: 0x130
	Size: 0x98
	Parameters: 0
	Flags: Private
*/
function private on_begin()
{
	foreach(player in getplayers())
	{
		player callback::on_laststand(&on_player_laststand);
	}
}

/*
	Name: on_end
	Namespace: namespace_7499819f
	Checksum: 0x7D9147B7
	Offset: 0x1D0
	Size: 0xA0
	Parameters: 1
	Flags: Private
*/
function private on_end(round_reset)
{
	foreach(player in getplayers())
	{
		player callback::remove_on_laststand(&on_player_laststand);
	}
}

/*
	Name: on_player_laststand
	Namespace: namespace_7499819f
	Checksum: 0x27226C81
	Offset: 0x278
	Size: 0x4C
	Parameters: 0
	Flags: Private
*/
function private on_player_laststand()
{
	var_57807cdc = [];
	array::add(var_57807cdc, self, 0);
	zm_trial::fail(#"hash_272fae998263208b", var_57807cdc);
}

