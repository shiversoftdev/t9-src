#using scripts\core_common\system_shared.csc;
#using scripts\core_common\struct.csc;

#namespace global_fx;

/*
	Name: function_56c32ac5
	Namespace: global_fx
	Checksum: 0x258E8189
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_56c32ac5()
{
	level notify(-1913316617);
}

/*
	Name: __init__system__
	Namespace: global_fx
	Checksum: 0x2A6FA748
	Offset: 0x90
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
	Offset: 0xE8
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
	Checksum: 0x480DCD99
	Offset: 0xF8
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
	Checksum: 0x699ACF7D
	Offset: 0x128
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
	Checksum: 0x43D1D9EA
	Offset: 0x160
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

