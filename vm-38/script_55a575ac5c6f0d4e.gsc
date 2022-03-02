#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_3f19542;

/*
	Name: function_5f0c7fad
	Namespace: namespace_3f19542
	Checksum: 0xE0380DA9
	Offset: 0x78
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_5f0c7fad()
{
	level notify(1892312741);
}

/*
	Name: function_89f2df9
	Namespace: namespace_3f19542
	Checksum: 0xA3072FD3
	Offset: 0x98
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_2565a71514aa2b10", &function_70a657d8, undefined, undefined, #"killstreaks");
}

/*
	Name: function_70a657d8
	Namespace: namespace_3f19542
	Checksum: 0x80F724D1
	Offset: 0xE8
	Size: 0x4
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
}

/*
	Name: function_b9c8f3cf
	Namespace: namespace_3f19542
	Checksum: 0xCC8EA141
	Offset: 0xF8
	Size: 0x3C
	Parameters: 7
	Flags: Private
*/
function private function_b9c8f3cf(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
}

