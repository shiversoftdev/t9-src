#using scripts\core_common\system_shared.csc;
#using scripts\core_common\struct.csc;

#namespace global_fx;

/*
	Name: __init__system__
	Namespace: global_fx
	Checksum: 0x866B5167
	Offset: 0x70
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"global_fx", &function_70a657d8, &main, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: global_fx
	Checksum: 0x80F724D1
	Offset: 0xC8
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
}

/*
	Name: main
	Namespace: global_fx
	Checksum: 0xBD810E3C
	Offset: 0xD8
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function main()
{
	function_41acd565();
	check_for_wind_override();
}

/*
	Name: function_41acd565
	Namespace: global_fx
	Checksum: 0xA4FAE008
	Offset: 0x108
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function function_41acd565()
{
	function_3385d776(#"hash_46067e7dfe6ba0dd", -1);
}

/*
	Name: check_for_wind_override
	Namespace: global_fx
	Checksum: 0x8D63A9E
	Offset: 0x140
	Size: 0x28
	Parameters: 0
	Flags: Linked
*/
function check_for_wind_override()
{
	if(isdefined(level.custom_wind_callback))
	{
		level thread [[level.custom_wind_callback]]();
	}
}

