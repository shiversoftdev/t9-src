#using scripts\core_common\serverfield_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace status_effect_suppress;

/*
	Name: __init__system__
	Namespace: status_effect_suppress
	Checksum: 0x91C45BBB
	Offset: 0x98
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"status_effect_suppress", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: status_effect_suppress
	Checksum: 0xC832D3F2
	Offset: 0xE0
	Size: 0x2C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	serverfield::register("status_effect_suppress_field", 1, 5, "int");
}

