#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\struct.csc;

#namespace namespace_85b89288;

/*
	Name: function_8f474823
	Namespace: namespace_85b89288
	Checksum: 0x9089C8FC
	Offset: 0x78
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_8f474823()
{
	level notify(799575934);
}

/*
	Name: __init__system__
	Namespace: namespace_85b89288
	Checksum: 0xEA85A3FD
	Offset: 0x98
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_621e37612030164f", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_85b89288
	Checksum: 0x9A11CD68
	Offset: 0xE0
	Size: 0x44
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(is_true(getgametypesetting(#"hash_1e1a5ebefe2772ba")))
	{
		level.var_53bc31ad = 1;
	}
}

