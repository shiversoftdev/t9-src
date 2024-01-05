#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace namespace_11abec5a;

/*
	Name: __init__system__
	Namespace: namespace_11abec5a
	Checksum: 0x9505E462
	Offset: 0xB8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_53a5a75770adb550", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_11abec5a
	Checksum: 0x4E275236
	Offset: 0x100
	Size: 0x5C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(!zm_trial::is_trial_mode())
	{
		return;
	}
	zm_trial::register_challenge(#"hash_53a5a75770adb550", &on_begin, &on_end);
}

/*
	Name: on_begin
	Namespace: namespace_11abec5a
	Checksum: 0xFF199B1
	Offset: 0x168
	Size: 0x3C8
	Parameters: 7
	Flags: Private
*/
function private on_begin(var_8a72a00b, var_49d8a02c, var_325ff213, var_dd2fad64, var_873a1b70, var_957937ee, var_9c56c5a9)
{
	switch(getplayers().size)
	{
		case 1:
		{
			level.var_b4a6cec6 = zm_trial::function_5769f26a(var_8a72a00b);
			break;
		}
		case 2:
		{
			level.var_b4a6cec6 = zm_trial::function_5769f26a(var_49d8a02c);
			break;
		}
		case 3:
		{
			level.var_b4a6cec6 = zm_trial::function_5769f26a(var_325ff213);
			break;
		}
		case 4:
		{
			level.var_b4a6cec6 = zm_trial::function_5769f26a(var_dd2fad64);
			break;
		}
	}
	if(isdefined(var_873a1b70))
	{
		if(!isdefined(level.var_692c062e))
		{
			level.var_692c062e = [];
		}
		else if(!isarray(level.var_692c062e))
		{
			level.var_692c062e = array(level.var_692c062e);
		}
		level.var_692c062e[level.var_692c062e.size] = getweapon(var_873a1b70);
	}
	if(isdefined(var_957937ee))
	{
		if(!isdefined(level.var_692c062e))
		{
			level.var_692c062e = [];
		}
		else if(!isarray(level.var_692c062e))
		{
			level.var_692c062e = array(level.var_692c062e);
		}
		level.var_692c062e[level.var_692c062e.size] = getweapon(var_957937ee);
	}
	if(isdefined(var_9c56c5a9))
	{
		if(!isdefined(level.var_692c062e))
		{
			level.var_692c062e = [];
		}
		else if(!isarray(level.var_692c062e))
		{
			level.var_692c062e = array(level.var_692c062e);
		}
		level.var_692c062e[level.var_692c062e.size] = getweapon(var_9c56c5a9);
	}
	callback::on_ai_killed(&on_ai_killed);
	foreach(player in getplayers())
	{
		player.var_b4a6cec6 = 0;
		player zm_trial_util::function_c2cd0cba(level.var_b4a6cec6);
		player zm_trial_util::function_2190356a(player.var_b4a6cec6);
	}
}

/*
	Name: on_end
	Namespace: namespace_11abec5a
	Checksum: 0x88904F7A
	Offset: 0x538
	Size: 0x1DA
	Parameters: 1
	Flags: Private
*/
function private on_end(round_reset)
{
	callback::remove_on_ai_killed(&on_ai_killed);
	if(!round_reset)
	{
		var_696c3b4 = [];
		foreach(player in getplayers())
		{
			if(player.var_b4a6cec6 < level.var_b4a6cec6)
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
			zm_trial::fail(#"hash_73f632514ab7d15", var_696c3b4);
		}
	}
	foreach(player in getplayers())
	{
		player zm_trial_util::function_f3aacffb();
	}
	level.var_b4a6cec6 = undefined;
}

/*
	Name: on_ai_killed
	Namespace: namespace_11abec5a
	Checksum: 0xCEC72B04
	Offset: 0x720
	Size: 0x1AC
	Parameters: 1
	Flags: Private
*/
function private on_ai_killed(params)
{
	w_root = zm_weapons::function_386dacbc(params.weapon);
	b_valid_weapon = 0;
	if(isinarray(level.var_692c062e, w_root))
	{
		b_valid_weapon = 1;
	}
	else if(w_root === getweapon(#"zhield_zpear_dw") && (params.smeansofdeath === "MOD_PROJECTILE" || params.smeansofdeath === "MOD_PROJECTILE_SPLASH"))
	{
		b_valid_weapon = 1;
	}
	if(isplayer(params.eattacker) && b_valid_weapon)
	{
		params.eattacker.var_b4a6cec6++;
		if(params.eattacker.var_b4a6cec6 < level.var_b4a6cec6)
		{
			params.eattacker zm_trial_util::function_c2cd0cba(level.var_b4a6cec6);
			params.eattacker zm_trial_util::function_2190356a(params.eattacker.var_b4a6cec6);
		}
		if(params.eattacker.var_b4a6cec6 == level.var_b4a6cec6)
		{
			params.eattacker zm_trial_util::function_63060af4(1);
		}
	}
}

/*
	Name: is_active
	Namespace: namespace_11abec5a
	Checksum: 0xB5E4FD4F
	Offset: 0x8D8
	Size: 0x96
	Parameters: 1
	Flags: None
*/
function is_active(var_a75461b4)
{
	s_challenge = zm_trial::function_a36e8c38(#"hash_53a5a75770adb550");
	if(isdefined(var_a75461b4))
	{
		if(isdefined(s_challenge) && isarray(level.var_692c062e) && isinarray(level.var_692c062e, var_a75461b4))
		{
			return 1;
		}
		return 0;
	}
	return isdefined(s_challenge);
}

