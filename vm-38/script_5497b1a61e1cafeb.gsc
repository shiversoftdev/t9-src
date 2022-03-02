#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace high_value_target;

/*
	Name: function_aca0e7b1
	Namespace: high_value_target
	Checksum: 0x291176C1
	Offset: 0xA0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_aca0e7b1()
{
	level notify(1749995396);
}

/*
	Name: function_89f2df9
	Namespace: high_value_target
	Checksum: 0xCFF4FF14
	Offset: 0xC0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"high_value_target", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: high_value_target
	Checksum: 0x9F5A0A62
	Offset: 0x108
	Size: 0x3C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("allplayers", "high_value_target", 1, 1, "int", undefined, 0, 0);
}

