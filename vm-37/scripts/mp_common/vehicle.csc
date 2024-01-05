#using scripts\core_common\vehicle_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace vehicle;

/*
	Name: __init__system__
	Namespace: vehicle
	Checksum: 0x32A3AC15
	Offset: 0x70
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"vehicle", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: vehicle
	Checksum: 0x939F59C1
	Offset: 0xB8
	Size: 0x30
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!isdefined(level._effect))
	{
		level._effect = [];
	}
	level.vehicles_inited = 1;
}

/*
	Name: vehicle_variants
	Namespace: vehicle
	Checksum: 0xAE746E26
	Offset: 0xF0
	Size: 0xC
	Parameters: 1
	Flags: None
*/
function vehicle_variants(localclientnum)
{
}

