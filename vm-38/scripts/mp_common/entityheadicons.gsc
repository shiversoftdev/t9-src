#using scripts\core_common\entityheadicons_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace entityheadicons;

/*
	Name: function_3aa3c7db
	Namespace: entityheadicons
	Checksum: 0x7AAE33D9
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_3aa3c7db()
{
	level notify(1754805390);
}

/*
	Name: function_89f2df9
	Namespace: entityheadicons
	Checksum: 0x4C5E4256
	Offset: 0x90
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"entityheadicons", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: entityheadicons
	Checksum: 0x98B8C2B9
	Offset: 0xD8
	Size: 0x14
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	init_shared();
}

