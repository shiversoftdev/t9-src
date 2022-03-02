#using script_14f4a3c583c77d4b;
#using script_6021ce59143452c3;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_76908a4b;

/*
	Name: function_89f2df9
	Namespace: namespace_76908a4b
	Checksum: 0xBA5C5785
	Offset: 0x80
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_58e2298d0db8b6aa", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_76908a4b
	Checksum: 0x5C6E8292
	Offset: 0xC8
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
	zm_trial::register_challenge(#"hash_58e2298d0db8b6aa", &function_d1de6a85, &function_9e7b3f4d);
}

/*
	Name: function_d1de6a85
	Namespace: namespace_76908a4b
	Checksum: 0x80F724D1
	Offset: 0x130
	Size: 0x4
	Parameters: 0
	Flags: Private
*/
function private function_d1de6a85()
{
}

/*
	Name: function_9e7b3f4d
	Namespace: namespace_76908a4b
	Checksum: 0x191A9F0F
	Offset: 0x140
	Size: 0xA8
	Parameters: 1
	Flags: Private
*/
function private function_9e7b3f4d(round_reset)
{
	if(round_reset)
	{
		foreach(e_player in level.players)
		{
			e_player gadgetpowerset(level.var_a53a05b5, 100);
		}
	}
}

