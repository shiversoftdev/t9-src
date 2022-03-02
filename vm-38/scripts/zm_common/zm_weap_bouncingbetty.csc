#using script_70aa5f5f0b09ad1a;
#using scripts\core_common\system_shared.csc;

#namespace namespace_78b43a28;

/*
	Name: function_cfbd32a1
	Namespace: namespace_78b43a28
	Checksum: 0x5DED4077
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_cfbd32a1()
{
	level notify(191275669);
}

#namespace bouncingbetty;

/*
	Name: function_89f2df9
	Namespace: bouncingbetty
	Checksum: 0xF60BF781
	Offset: 0x90
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"bouncingbetty", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: bouncingbetty
	Checksum: 0x98B8C2B9
	Offset: 0xD8
	Size: 0x14
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	init_shared();
}

