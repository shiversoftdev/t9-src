#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace namespace_5b1144e;

/*
	Name: function_7353d272
	Namespace: namespace_5b1144e
	Checksum: 0x697CD3C2
	Offset: 0x98
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_7353d272()
{
	level notify(-1446905279);
}

/*
	Name: __init__system__
	Namespace: namespace_5b1144e
	Checksum: 0x31EF873D
	Offset: 0xB8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_1e8eafe505e52c51", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_5b1144e
	Checksum: 0x4FE92A50
	Offset: 0x100
	Size: 0x84
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("scriptmover", "" + #"hash_dfecc4e02f58398", 1, 3, "int");
	clientfield::register("zbarrier", "" + #"hash_dfecc4e02f58398", 1, 2, "int");
}

/*
	Name: function_9e0598bb
	Namespace: namespace_5b1144e
	Checksum: 0x603FF538
	Offset: 0x190
	Size: 0x8C
	Parameters: 1
	Flags: Linked
*/
function function_9e0598bb(id)
{
	/#
		/#
			assert(isentity(self), "");
		#/
	#/
	if(!isentity(self))
	{
		return;
	}
	self clientfield::set("" + #"hash_dfecc4e02f58398", id);
}

/*
	Name: function_550247bd
	Namespace: namespace_5b1144e
	Checksum: 0x5EB6D37B
	Offset: 0x228
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function function_550247bd(id)
{
	/#
		/#
			assert(id > 10, "");
		#/
	#/
	function_9e0598bb(id - 10);
}

