#using scripts\core_common\system_shared.csc;
#using scripts\core_common\vehicle_shared.csc;

#namespace vehicle;

/*
	Name: function_3e1cb51d
	Namespace: vehicle
	Checksum: 0x355E609
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_3e1cb51d()
{
	level notify(233860547);
}

/*
	Name: function_89f2df9
	Namespace: vehicle
	Checksum: 0x9D8C0B61
	Offset: 0x90
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"vehicle", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: vehicle
	Checksum: 0x50586971
	Offset: 0xD8
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
	Checksum: 0x35AD1A28
	Offset: 0x110
	Size: 0xC
	Parameters: 1
	Flags: None
*/
function vehicle_variants(localclientnum)
{
}

