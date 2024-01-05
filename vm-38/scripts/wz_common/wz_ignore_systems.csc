#using scripts\core_common\system_shared.csc;

#namespace wz_ignore_systems;

/*
	Name: function_f9452cab
	Namespace: wz_ignore_systems
	Checksum: 0x841D2494
	Offset: 0x68
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_f9452cab()
{
	level notify(-2134946101);
}

/*
	Name: ignore_systems
	Namespace: wz_ignore_systems
	Checksum: 0x336A1922
	Offset: 0x88
	Size: 0x24
	Parameters: 0
	Flags: AutoExec
*/
function autoexec ignore_systems()
{
	system::ignore(#"armor_station");
}

