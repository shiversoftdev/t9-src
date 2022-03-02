#using script_6021ce59143452c3;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_d7e924ce;

/*
	Name: function_89f2df9
	Namespace: namespace_d7e924ce
	Checksum: 0xD6B23ADD
	Offset: 0x70
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_1bfbd9bd8caea5b8", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_d7e924ce
	Checksum: 0x6067B9EB
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
	zm_trial::register_challenge(#"hash_45315239305b1f03", &function_d1de6a85, &function_9e7b3f4d);
}

/*
	Name: function_d1de6a85
	Namespace: namespace_d7e924ce
	Checksum: 0xA7D6220C
	Offset: 0x120
	Size: 0x52
	Parameters: 0
	Flags: Private
*/
function private function_d1de6a85()
{
	level.var_6d8a8e47 = 1;
	level.var_b38bb71 = 1;
	level.var_ef0aada0 = 1;
	level.var_d1b3ec4e = level.var_9b91564e;
	level.var_9b91564e = undefined;
}

/*
	Name: function_9e7b3f4d
	Namespace: namespace_d7e924ce
	Checksum: 0x58EFA986
	Offset: 0x180
	Size: 0x4E
	Parameters: 1
	Flags: Private
*/
function private function_9e7b3f4d(round_reset)
{
	level.var_6d8a8e47 = 0;
	level.var_b38bb71 = 0;
	level.var_ef0aada0 = 0;
	level.var_9b91564e = level.var_d1b3ec4e;
	level.var_d1b3ec4e = undefined;
}

