#using script_57f7003580bb15e0;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_74862d2d;

/*
	Name: function_89f2df9
	Namespace: namespace_74862d2d
	Checksum: 0x293A11D6
	Offset: 0x98
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_48046696e6c2176f", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_74862d2d
	Checksum: 0x6342B1FF
	Offset: 0xE0
	Size: 0x2C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	status_effect::function_6f4eaf88(function_4d1e7b48("explosive_damage"));
}

