#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;

#namespace globallogic_vehicle;

/*
	Name: function_30eee235
	Namespace: globallogic_vehicle
	Checksum: 0x56C22399
	Offset: 0x78
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_30eee235()
{
	level notify(1941821127);
}

#namespace vehicles;

/*
	Name: function_89f2df9
	Namespace: vehicles
	Checksum: 0xAE1414FF
	Offset: 0x98
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"globallogic_vehicle", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: vehicles
	Checksum: 0x80F724D1
	Offset: 0xE0
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
}

