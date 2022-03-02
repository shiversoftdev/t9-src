#using script_27c22e1d8df4d852;
#using script_6021ce59143452c3;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_765ad6b;

/*
	Name: function_89f2df9
	Namespace: namespace_765ad6b
	Checksum: 0x99DBA82C
	Offset: 0x78
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_2a44818de310b04f", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_765ad6b
	Checksum: 0x527861E2
	Offset: 0xC0
	Size: 0x5C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(!zm_trial::function_b47f6aba())
	{
		return;
	}
	zm_trial::register_challenge(#"hash_4778040558791d02", &function_d1de6a85, &function_9e7b3f4d);
}

/*
	Name: function_d1de6a85
	Namespace: namespace_765ad6b
	Checksum: 0x12A4E808
	Offset: 0x128
	Size: 0x14
	Parameters: 0
	Flags: Private
*/
function private function_d1de6a85()
{
	level.var_2d307e50 = 1;
}

/*
	Name: function_9e7b3f4d
	Namespace: namespace_765ad6b
	Checksum: 0x30606341
	Offset: 0x148
	Size: 0x16
	Parameters: 1
	Flags: Private
*/
function private function_9e7b3f4d(round_reset)
{
	level.var_2d307e50 = undefined;
}

