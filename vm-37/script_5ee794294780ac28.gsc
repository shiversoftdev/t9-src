#using script_14f4a3c583c77d4b;
#using script_27c22e1d8df4d852;
#using script_6021ce59143452c3;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_weapons.gsc;

#namespace namespace_919f68ad;

/*
	Name: function_89f2df9
	Namespace: namespace_919f68ad
	Checksum: 0x2EF73EC7
	Offset: 0x98
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_37398b26e502cdde", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_919f68ad
	Checksum: 0x55CF9999
	Offset: 0xE0
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
	zm_trial::register_challenge(#"hash_2bec904229ece9ed", &function_d1de6a85, &function_9e7b3f4d);
}

/*
	Name: function_d1de6a85
	Namespace: namespace_919f68ad
	Checksum: 0x6D47CC3F
	Offset: 0x148
	Size: 0x10C
	Parameters: 1
	Flags: Private
*/
function private function_d1de6a85(var_49106f6b)
{
	level.var_60aa7ebf = zm_trial::function_5769f26a(var_49106f6b);
	foreach(player in getplayers())
	{
		player.var_e47444a5 = [];
		player namespace_b22c99a5::function_2190356a(0);
		player namespace_b22c99a5::function_c2cd0cba(level.var_60aa7ebf);
	}
	callback::on_ai_killed(&on_ai_killed);
}

/*
	Name: function_9e7b3f4d
	Namespace: namespace_919f68ad
	Checksum: 0x918FC3CF
	Offset: 0x260
	Size: 0x1E0
	Parameters: 1
	Flags: Private
*/
function private function_9e7b3f4d(round_reset)
{
	if(!round_reset)
	{
		var_696c3b4 = [];
		foreach(player in getplayers())
		{
			if(player.var_e47444a5.size < level.var_60aa7ebf)
			{
				if(!isdefined(var_696c3b4))
				{
					var_696c3b4 = [];
				}
				else if(!isarray(var_696c3b4))
				{
					var_696c3b4 = array(var_696c3b4);
				}
				var_696c3b4[var_696c3b4.size] = player;
			}
		}
		if(var_696c3b4.size)
		{
			zm_trial::fail(#"hash_2ad223a26dff12a0", var_696c3b4);
		}
	}
	callback::remove_on_ai_killed(&on_ai_killed);
	level.var_60aa7ebf = undefined;
	foreach(player in getplayers())
	{
		player namespace_b22c99a5::function_f3aacffb();
	}
}

/*
	Name: is_active
	Namespace: namespace_919f68ad
	Checksum: 0x3BE8CE1D
	Offset: 0x448
	Size: 0x32
	Parameters: 0
	Flags: None
*/
function is_active()
{
	challenge = zm_trial::function_a36e8c38(#"hash_2bec904229ece9ed");
	return isdefined(challenge);
}

/*
	Name: on_ai_killed
	Namespace: namespace_919f68ad
	Checksum: 0xE71BD78C
	Offset: 0x488
	Size: 0x2A4
	Parameters: 1
	Flags: Private
*/
function private on_ai_killed(params)
{
	if(isplayer(params.eattacker))
	{
		player = params.eattacker;
	}
	else if(isplayer(params.einflictor))
	{
		player = params.einflictor;
	}
	if(!isdefined(player) || isai(params.einflictor))
	{
		return;
	}
	if(player.var_e47444a5.size >= level.var_60aa7ebf)
	{
		return;
	}
	if(zm_utility::is_mini_turret(params.weapon, 1))
	{
		w_root = getweapon(#"mini_turret");
	}
	else
	{
		if(zm_utility::function_850e7499(params.weapon, 1))
		{
			w_root = getweapon(#"hash_c78156ba6aeda14");
		}
		else
		{
			w_root = zm_weapons::function_93cd8e76(params.weapon, 1);
		}
	}
	if(isdefined(level.var_a601d6a6))
	{
		w_root = player [[level.var_a601d6a6]](w_root);
	}
	if(!isinarray(player.var_e47444a5, w_root))
	{
		if(!isdefined(player.var_e47444a5))
		{
			player.var_e47444a5 = [];
		}
		else if(!isarray(player.var_e47444a5))
		{
			player.var_e47444a5 = array(player.var_e47444a5);
		}
		player.var_e47444a5[player.var_e47444a5.size] = w_root;
		if(player.var_e47444a5.size == level.var_60aa7ebf)
		{
			player namespace_b22c99a5::function_63060af4(1);
		}
		else
		{
			player namespace_b22c99a5::function_2190356a(player.var_e47444a5.size);
			player namespace_b22c99a5::function_c2cd0cba(level.var_60aa7ebf);
		}
	}
}

