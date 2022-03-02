#using scripts\core_common\fx_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;

#namespace global_fx;

/*
	Name: function_8504881f
	Namespace: global_fx
	Checksum: 0x2E4DE227
	Offset: 0x78
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_8504881f()
{
	level notify(204610842);
}

/*
	Name: function_89f2df9
	Namespace: global_fx
	Checksum: 0x2A6FA748
	Offset: 0x98
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"global_fx", &function_70a657d8, &main, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: global_fx
	Checksum: 0x80F724D1
	Offset: 0xF0
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
	Offset: 0x100
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
	Offset: 0x130
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
	Offset: 0x168
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

