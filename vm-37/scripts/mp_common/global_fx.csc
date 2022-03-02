#using scripts\core_common\system_shared.csc;

#namespace global_fx;

/*
	Name: function_89f2df9
	Namespace: global_fx
	Checksum: 0x866B5167
	Offset: 0x68
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
	Offset: 0xC0
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
	Checksum: 0x2F3A55C
	Offset: 0xD0
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function main()
{
	function_94923bb0();
	function_41acd565();
	check_for_wind_override();
}

/*
	Name: function_94923bb0
	Namespace: global_fx
	Checksum: 0x7BEDDF0D
	Offset: 0x110
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function function_94923bb0()
{
	function_3385d776(#"hash_14608c97d9d192a1", -1);
}

/*
	Name: function_41acd565
	Namespace: global_fx
	Checksum: 0xCCEA2028
	Offset: 0x148
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
	Checksum: 0x9DC6785
	Offset: 0x180
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

