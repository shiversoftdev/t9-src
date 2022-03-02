#using script_6021ce59143452c3;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_7499819f;

/*
	Name: function_89f2df9
	Namespace: namespace_7499819f
	Checksum: 0x92E92ED3
	Offset: 0x80
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
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
	if(!zm_trial::function_b47f6aba())
	{
		return;
	}
	zm_trial::register_challenge(#"hash_b143bd998abdd27", &function_d1de6a85, &function_9e7b3f4d);
}

/*
	Name: function_d1de6a85
	Namespace: namespace_7499819f
	Checksum: 0x2CCFCB62
	Offset: 0x130
	Size: 0x98
	Parameters: 0
	Flags: Private
*/
function private function_d1de6a85()
{
	foreach(player in getplayers())
	{
		player callback::on_laststand(&on_player_laststand);
	}
}

/*
	Name: function_9e7b3f4d
	Namespace: namespace_7499819f
	Checksum: 0x7D9147B7
	Offset: 0x1D0
	Size: 0xA0
	Parameters: 1
	Flags: Private
*/
function private function_9e7b3f4d(round_reset)
{
	foreach(player in getplayers())
	{
		player callback::function_53888e7f(&on_player_laststand);
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

