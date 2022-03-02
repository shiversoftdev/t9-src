#using script_27c22e1d8df4d852;
#using script_6021ce59143452c3;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\zm_common\callbacks.gsc;
#using scripts\zm_common\zm_weapons.gsc;

#namespace namespace_a7aeae56;

/*
	Name: function_89f2df9
	Namespace: namespace_a7aeae56
	Checksum: 0xB89A7DA7
	Offset: 0x90
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_3932b346c9af0dde", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_a7aeae56
	Checksum: 0xBCD7A768
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
	zm_trial::register_challenge(#"hash_32bd34ef989ddd03", &function_d1de6a85, &function_9e7b3f4d);
}

/*
	Name: function_d1de6a85
	Namespace: namespace_a7aeae56
	Checksum: 0x5EC9FB40
	Offset: 0x140
	Size: 0x108
	Parameters: 1
	Flags: Private
*/
function private function_d1de6a85(n_count)
{
	callback::function_aebeafc0(&function_aebeafc0);
	level.var_195590fb = zm_trial::function_5769f26a(n_count);
	foreach(player in getplayers())
	{
		player.var_92cd5237 = [];
		player namespace_b22c99a5::function_c2cd0cba(level.var_195590fb);
		player namespace_b22c99a5::function_2190356a(0);
	}
}

/*
	Name: function_9e7b3f4d
	Namespace: namespace_a7aeae56
	Checksum: 0x33CD89F3
	Offset: 0x250
	Size: 0x1EC
	Parameters: 1
	Flags: Private
*/
function private function_9e7b3f4d(round_reset)
{
	foreach(player in getplayers())
	{
		player namespace_b22c99a5::function_f3aacffb();
	}
	if(!round_reset)
	{
		var_57807cdc = [];
		foreach(player in getplayers())
		{
			if(player.var_92cd5237.size < level.var_195590fb)
			{
				array::add(var_57807cdc, player, 0);
			}
			player.var_f8c35ed5 = undefined;
		}
		if(var_57807cdc.size == 1)
		{
			zm_trial::fail(#"hash_6dbd3c476c903f66", var_57807cdc);
		}
		else if(var_57807cdc.size > 1)
		{
			zm_trial::fail(#"hash_59d734dda39935cf", var_57807cdc);
		}
	}
	level.var_195590fb = undefined;
	callback::function_3e2ed898(&function_aebeafc0);
}

/*
	Name: function_aebeafc0
	Namespace: namespace_a7aeae56
	Checksum: 0x150E053D
	Offset: 0x448
	Size: 0xEC
	Parameters: 1
	Flags: Private
*/
function private function_aebeafc0(upgraded_weapon)
{
	w_base = zm_weapons::get_base_weapon(upgraded_weapon);
	if(!isdefined(self.var_92cd5237))
	{
		self.var_92cd5237 = [];
	}
	else if(!isarray(self.var_92cd5237))
	{
		self.var_92cd5237 = array(self.var_92cd5237);
	}
	if(!isinarray(self.var_92cd5237, w_base))
	{
		self.var_92cd5237[self.var_92cd5237.size] = w_base;
	}
	if(self.var_92cd5237.size <= level.var_195590fb)
	{
		namespace_b22c99a5::function_2190356a(self.var_92cd5237.size);
	}
}

