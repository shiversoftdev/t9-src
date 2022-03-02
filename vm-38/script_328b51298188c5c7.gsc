#using scripts\core_common\system_shared.gsc;

#namespace namespace_80c07c34;

/*
	Name: function_e7e3d56
	Namespace: namespace_80c07c34
	Checksum: 0xCEB663FF
	Offset: 0x68
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_e7e3d56()
{
	level notify(421659012);
}

/*
	Name: function_89f2df9
	Namespace: namespace_80c07c34
	Checksum: 0x2AA9D3BB
	Offset: 0x88
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_75bfc88140adb680", &function_c7f33cce, &function_fa076c68, undefined, undefined);
}

/*
	Name: function_c7f33cce
	Namespace: namespace_80c07c34
	Checksum: 0xC6D9E4B6
	Offset: 0xE0
	Size: 0x44
	Parameters: 0
	Flags: Linked, Private
*/
function private function_c7f33cce()
{
	function_ad272ef4();
	function_90ceecf8();
	function_7c9b0132();
	function_bc948200();
}

/*
	Name: function_fa076c68
	Namespace: namespace_80c07c34
	Checksum: 0x80F724D1
	Offset: 0x130
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_fa076c68()
{
}

/*
	Name: function_ad272ef4
	Namespace: namespace_80c07c34
	Checksum: 0x55E34EB0
	Offset: 0x140
	Size: 0x20
	Parameters: 0
	Flags: Linked, Private
*/
function private function_ad272ef4()
{
	if(!isdefined(level._fx))
	{
		level._fx = {};
	}
}

/*
	Name: function_90ceecf8
	Namespace: namespace_80c07c34
	Checksum: 0x80F724D1
	Offset: 0x168
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_90ceecf8()
{
}

/*
	Name: function_7c9b0132
	Namespace: namespace_80c07c34
	Checksum: 0x80F724D1
	Offset: 0x178
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_7c9b0132()
{
}

/*
	Name: function_bc948200
	Namespace: namespace_80c07c34
	Checksum: 0x80F724D1
	Offset: 0x188
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_bc948200()
{
}

