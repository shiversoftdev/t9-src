#using scripts\core_common\system_shared.csc;
#using scripts\core_common\fx_shared.csc;
#using scripts\core_common\struct.csc;

#namespace global_fx;

/*
	Name: __init__system__
	Namespace: global_fx
	Checksum: 0x866B5167
	Offset: 0x78
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
	Offset: 0xD0
	Size: 0x4
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
}

/*
	Name: main
	Namespace: global_fx
	Checksum: 0x11D887F6
	Offset: 0xE0
	Size: 0x14
	Parameters: 0
	Flags: None
*/
function main()
{
	check_for_wind_override();
}

/*
	Name: check_for_wind_override
	Namespace: global_fx
	Checksum: 0xD88205CD
	Offset: 0x100
	Size: 0x28
	Parameters: 0
	Flags: None
*/
function check_for_wind_override()
{
	if(isdefined(level.custom_wind_callback))
	{
		level thread [[level.custom_wind_callback]]();
	}
}

