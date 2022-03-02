#using script_6021ce59143452c3;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_e3447716;

/*
	Name: function_89f2df9
	Namespace: namespace_e3447716
	Checksum: 0x98BA0EC4
	Offset: 0x70
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_6d08a8a99b71d29e", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_e3447716
	Checksum: 0x61733CA9
	Offset: 0xB8
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
	zm_trial::register_challenge(#"survive", &function_d1de6a85, &function_9e7b3f4d);
}

/*
	Name: function_d1de6a85
	Namespace: namespace_e3447716
	Checksum: 0x80F724D1
	Offset: 0x120
	Size: 0x4
	Parameters: 0
	Flags: Private
*/
function private function_d1de6a85()
{
}

/*
	Name: function_9e7b3f4d
	Namespace: namespace_e3447716
	Checksum: 0xF5603B6C
	Offset: 0x130
	Size: 0xC
	Parameters: 1
	Flags: Private
*/
function private function_9e7b3f4d(round_reset)
{
}

