#using script_5ce3a97e77bb8a9f;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace remotemissile;

/*
	Name: function_89f2df9
	Namespace: remotemissile
	Checksum: 0x26A3EFED
	Offset: 0x90
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"remotemissile", &function_70a657d8, undefined, undefined, #"killstreaks");
}

/*
	Name: function_70a657d8
	Namespace: remotemissile
	Checksum: 0x137EBADF
	Offset: 0xE0
	Size: 0x6C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("world", "" + #"hash_59ec82b1a72deb72", 1, 1, "int", &function_c668b489, 0, 0);
	init_shared();
}

/*
	Name: function_c668b489
	Namespace: remotemissile
	Checksum: 0x7810C2F7
	Offset: 0x158
	Size: 0xCC
	Parameters: 7
	Flags: Linked
*/
function function_c668b489(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		function_3385d776(#"hash_320dd60f8482919f");
		function_3385d776(#"hash_55c5552fc2e0f419");
	}
	else
	{
		function_c22a1ca2(#"hash_320dd60f8482919f");
		function_c22a1ca2(#"hash_55c5552fc2e0f419");
	}
}

