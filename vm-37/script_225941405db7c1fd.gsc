#using script_27c22e1d8df4d852;
#using script_6021ce59143452c3;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\zm_common\zm_weapons.gsc;

#namespace namespace_67797245;

/*
	Name: function_89f2df9
	Namespace: namespace_67797245
	Checksum: 0x87EAFD78
	Offset: 0x90
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_6f183f9fa707c247", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_67797245
	Checksum: 0xE58ED8BF
	Offset: 0xD8
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
	zm_trial::register_challenge(#"hash_29ed25a648820a10", &function_d1de6a85, &function_9e7b3f4d);
}

/*
	Name: function_d1de6a85
	Namespace: namespace_67797245
	Checksum: 0xC190F9AA
	Offset: 0x140
	Size: 0x84
	Parameters: 0
	Flags: Private
*/
function private function_d1de6a85()
{
	self.var_42fe565a = level.var_c739ead9;
	self.var_c98099cd = level.var_cfbc34ae;
	self.var_3ab281b2 = level.var_5a59b382;
	self.var_c7f3b69b = level.var_97850f30;
	level.var_c739ead9 = 2;
	level.var_cfbc34ae = 2;
	level.var_5a59b382 = 2;
	level.var_97850f30 = 2;
}

/*
	Name: function_9e7b3f4d
	Namespace: namespace_67797245
	Checksum: 0x71ED3629
	Offset: 0x1D0
	Size: 0x4C
	Parameters: 1
	Flags: Private
*/
function private function_9e7b3f4d(round_reset)
{
	level.var_c739ead9 = self.var_42fe565a;
	level.var_cfbc34ae = self.var_c98099cd;
	level.var_5a59b382 = self.var_3ab281b2;
	level.var_97850f30 = self.var_c7f3b69b;
}

/*
	Name: is_active
	Namespace: namespace_67797245
	Checksum: 0x3D290BEF
	Offset: 0x228
	Size: 0x32
	Parameters: 0
	Flags: None
*/
function is_active()
{
	challenge = zm_trial::function_a36e8c38(#"hash_29ed25a648820a10");
	return isdefined(challenge);
}

