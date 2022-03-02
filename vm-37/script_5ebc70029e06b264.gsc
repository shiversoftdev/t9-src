#using scripts\core_common\system_shared.gsc;

#namespace namespace_e7bd6188;

/*
	Name: ignore_systems
	Namespace: namespace_e7bd6188
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

