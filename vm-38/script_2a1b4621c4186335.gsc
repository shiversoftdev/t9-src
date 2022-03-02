#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace namespace_c2bb938a;

/*
	Name: function_1cd91ac2
	Namespace: namespace_c2bb938a
	Checksum: 0xF48652FD
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_1cd91ac2()
{
	level notify(1891958414);
}

/*
	Name: function_89f2df9
	Namespace: namespace_c2bb938a
	Checksum: 0xBF6F4D24
	Offset: 0x90
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_258dcc370de6f9c5", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_c2bb938a
	Checksum: 0x1E1A2A6B
	Offset: 0xD8
	Size: 0x18
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(level.var_f2814a96 !== 0)
	{
		return;
	}
}

