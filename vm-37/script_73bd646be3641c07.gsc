#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace namespace_5b1144e;

/*
	Name: __init__system__
	Namespace: namespace_5b1144e
	Checksum: 0x49DD8930
	Offset: 0x98
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
	Checksum: 0x819D6C0
	Offset: 0xE0
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
	Checksum: 0x27246E21
	Offset: 0x170
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
	Checksum: 0x17130C88
	Offset: 0x208
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

