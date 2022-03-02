#using script_57f7003580bb15e0;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_dafacbee;

/*
	Name: function_89f2df9
	Namespace: namespace_dafacbee
	Checksum: 0x8F1D8032
	Offset: 0x80
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_221a828ea2610a47", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_dafacbee
	Checksum: 0xEA073B87
	Offset: 0xC8
	Size: 0x4C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	status_effect::function_6f4eaf88(function_4d1e7b48("movement"));
	status_effect::function_5bae5120(8, &function_f7e9c0bb);
}

/*
	Name: function_f7e9c0bb
	Namespace: namespace_dafacbee
	Checksum: 0x80F724D1
	Offset: 0x120
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function function_f7e9c0bb()
{
}

