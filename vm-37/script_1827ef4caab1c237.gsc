#using script_444bc5b4fa0fe14f;
#using script_6021ce59143452c3;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_10ecac2c;

/*
	Name: function_89f2df9
	Namespace: namespace_10ecac2c
	Checksum: 0x63CE723
	Offset: 0x88
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_6850ba7908370033", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_10ecac2c
	Checksum: 0xC63678EC
	Offset: 0xD0
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
	zm_trial::register_challenge(#"hash_647805dc769488c2", &function_d1de6a85, &function_9e7b3f4d);
}

/*
	Name: function_d1de6a85
	Namespace: namespace_10ecac2c
	Checksum: 0x8EDD2659
	Offset: 0x138
	Size: 0x56
	Parameters: 0
	Flags: Private
*/
function private function_d1de6a85()
{
	level.var_43fb4347 = "sprint";
	level.var_102b1301 = "sprint";
	level.var_b38bb71 = 1;
	level.var_ef0aada0 = 1;
}

/*
	Name: function_9e7b3f4d
	Namespace: namespace_10ecac2c
	Checksum: 0xA1C936D6
	Offset: 0x198
	Size: 0x3C
	Parameters: 1
	Flags: Private
*/
function private function_9e7b3f4d(round_reset)
{
	level.var_43fb4347 = undefined;
	level.var_102b1301 = undefined;
	level.var_b38bb71 = 0;
	level.var_ef0aada0 = 0;
}

