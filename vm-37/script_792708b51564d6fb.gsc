#using scripts\core_common\serverfield_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace namespace_2cce9002;

/*
	Name: function_89f2df9
	Namespace: namespace_2cce9002
	Checksum: 0x91C45BBB
	Offset: 0x98
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_53e2d15cdf3290ad", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_2cce9002
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

