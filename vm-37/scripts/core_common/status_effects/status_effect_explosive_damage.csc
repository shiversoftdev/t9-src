#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace status_effect_explosive_damage;

/*
	Name: __init__system__
	Namespace: status_effect_explosive_damage
	Checksum: 0xEA863153
	Offset: 0x70
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"status_effect_explosive_damage", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: status_effect_explosive_damage
	Checksum: 0x80F724D1
	Offset: 0xB8
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
}

