#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace high_value_target;

/*
	Name: function_89f2df9
	Namespace: high_value_target
	Checksum: 0x46F51AA4
	Offset: 0xA0
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
	Checksum: 0x88D82E63
	Offset: 0xE8
	Size: 0x3C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("allplayers", "high_value_target", 1, 1, "int", undefined, 0, 0);
}

