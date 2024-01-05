#using scripts\core_common\system_shared.csc;

#namespace wz_ignore_systems;

/*
	Name: ignore_systems
	Namespace: wz_ignore_systems
	Checksum: 0xC190C9FC
	Offset: 0x68
	Size: 0x24
	Parameters: 0
	Flags: AutoExec
*/
function autoexec ignore_systems()
{
	system::ignore(#"armor_station");
}

