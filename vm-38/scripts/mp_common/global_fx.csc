#using scripts\core_common\system_shared.csc;

#namespace global_fx;

/*
	Name: function_8f8fefbf
	Namespace: global_fx
	Checksum: 0x6F83BBFE
	Offset: 0x68
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_8f8fefbf()
{
	level notify(691995124);
}

/*
	Name: __init__system__
	Namespace: global_fx
	Checksum: 0x2A6FA748
	Offset: 0x88
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
	Offset: 0xE0
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
	Checksum: 0x88148FF6
	Offset: 0xF0
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
	Checksum: 0xEF04F13F
	Offset: 0x130
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
	Checksum: 0x2A2D7A5F
	Offset: 0x168
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
	Checksum: 0xB577A994
	Offset: 0x1A0
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

