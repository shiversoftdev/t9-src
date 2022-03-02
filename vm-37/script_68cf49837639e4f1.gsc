#using script_14f4a3c583c77d4b;
#using script_27c22e1d8df4d852;
#using script_6021ce59143452c3;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_e7fb1aea;

/*
	Name: function_89f2df9
	Namespace: namespace_e7fb1aea
	Checksum: 0xD15A85C7
	Offset: 0x90
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_6e4fd4c82cd73524", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_e7fb1aea
	Checksum: 0x376850D0
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
	zm_trial::register_challenge(#"hash_6e4fd4c82cd73524", &function_d1de6a85, &function_9e7b3f4d);
}

/*
	Name: function_d1de6a85
	Namespace: namespace_e7fb1aea
	Checksum: 0x9AE4C058
	Offset: 0x140
	Size: 0x134
	Parameters: 1
	Flags: Private
*/
function private function_d1de6a85(n_kill_count)
{
	level.var_f7e95a13 = zm_trial::function_5769f26a(n_kill_count);
	foreach(player in getplayers())
	{
		player.var_76bb4a3e = 0;
		player namespace_b22c99a5::function_c2cd0cba(level.var_f7e95a13);
		player namespace_b22c99a5::function_2190356a(player.var_76bb4a3e);
		player callback::on_death(&on_death);
	}
	callback::on_ai_killed(&on_ai_killed);
}

/*
	Name: function_9e7b3f4d
	Namespace: namespace_e7fb1aea
	Checksum: 0x5730F965
	Offset: 0x280
	Size: 0x336
	Parameters: 1
	Flags: Private
*/
function private function_9e7b3f4d(round_reset)
{
	var_7df0eb27 = level.var_f7e95a13;
	level.var_f7e95a13 = undefined;
	foreach(player in getplayers())
	{
		player namespace_b22c99a5::function_f3aacffb();
		player callback::remove_on_death(&on_death);
	}
	callback::remove_on_ai_killed(&on_ai_killed);
	if(!round_reset)
	{
		var_acba5af0 = [];
		foreach(player in getplayers())
		{
			if(isdefined(player.var_76bb4a3e) && player.var_76bb4a3e < var_7df0eb27)
			{
				if(!isdefined(var_acba5af0))
				{
					var_acba5af0 = [];
				}
				else if(!isarray(var_acba5af0))
				{
					var_acba5af0 = array(var_acba5af0);
				}
				if(!isinarray(var_acba5af0, player))
				{
					var_acba5af0[var_acba5af0.size] = player;
				}
			}
		}
		if(var_acba5af0.size == 1)
		{
			zm_trial::fail(#"hash_18fa90427a117729", var_acba5af0);
			function_d99b4aa5();
		}
		else if(var_acba5af0.size > 1)
		{
			zm_trial::fail(#"hash_68076ef1f7244678", var_acba5af0);
			function_d99b4aa5();
		}
	}
	else
	{
		function_d99b4aa5();
	}
	foreach(player in getplayers())
	{
		player.var_76bb4a3e = undefined;
	}
}

/*
	Name: on_ai_killed
	Namespace: namespace_e7fb1aea
	Checksum: 0x905810D8
	Offset: 0x5C0
	Size: 0x42
	Parameters: 1
	Flags: Private
*/
function private on_ai_killed(params)
{
	e_attacker = params.eattacker;
	if(!isplayer(e_attacker))
	{
		e_attacker = params.einflictor;
	}
}

/*
	Name: function_d99b4aa5
	Namespace: namespace_e7fb1aea
	Checksum: 0xB76E074D
	Offset: 0x610
	Size: 0xA0
	Parameters: 0
	Flags: Private
*/
function private function_d99b4aa5()
{
	foreach(e_player in getplayers())
	{
		e_player gadgetpowerset(level.var_a53a05b5, 100);
	}
}

/*
	Name: on_death
	Namespace: namespace_e7fb1aea
	Checksum: 0xCC3F6042
	Offset: 0x6B8
	Size: 0x64
	Parameters: 1
	Flags: Private
*/
function private on_death(params)
{
	if(isdefined(self.var_76bb4a3e) && self.var_76bb4a3e < level.var_f7e95a13)
	{
		zm_trial::fail(#"hash_18fa90427a117729", array(self));
	}
}

