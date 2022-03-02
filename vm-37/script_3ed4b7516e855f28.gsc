#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace abilities;

/*
	Name: function_89f2df9
	Namespace: abilities
	Checksum: 0x3BBE063B
	Offset: 0x98
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_4652e389efb9751f", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: abilities
	Checksum: 0x93215AAF
	Offset: 0xE0
	Size: 0x54
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	clientfield::function_a8bbc967("playerAbilities.inRange", #"hash_3107ca3e77102da5", #"inrange", 1, 1, "int", undefined, 0, 0);
}

