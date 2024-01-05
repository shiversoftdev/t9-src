#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace zm_trial_special_enemy;

/*
	Name: function_49bcca87
	Namespace: zm_trial_special_enemy
	Checksum: 0x7647B65B
	Offset: 0x98
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_49bcca87()
{
	level notify(792466073);
}

/*
	Name: __init__system__
	Namespace: zm_trial_special_enemy
	Checksum: 0xADE61F38
	Offset: 0xB8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_trial_special_enemy", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_trial_special_enemy
	Checksum: 0xCEC6AB1E
	Offset: 0x100
	Size: 0x5C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!zm_trial::is_trial_mode())
	{
		return;
	}
	zm_trial::register_challenge(#"special_enemy", &on_begin, &on_end);
}

/*
	Name: on_begin
	Namespace: zm_trial_special_enemy
	Checksum: 0xFD75B85E
	Offset: 0x168
	Size: 0x1AC
	Parameters: 5
	Flags: Linked, Private
*/
function private on_begin(enemy_type, var_6b96eb7b, var_46cce0c5, var_6ad4e7c6, var_44445188)
{
	if(getplayers().size > 1)
	{
		self.enemy_count = zm_trial::function_5769f26a(var_46cce0c5);
	}
	else
	{
		self.enemy_count = zm_trial::function_5769f26a(var_6b96eb7b);
	}
	level.var_9a0fbcb9 = 0;
	self.enemy_type = enemy_type;
	self.enemies_killed = 0;
	level.zombie_total = self.enemy_count;
	level.var_efbb07e = level.var_ef1a71b3;
	level.var_ef1a71b3 = &get_zombie_count_for_round;
	level.var_dc22f98 = level.fn_custom_round_ai_spawn;
	level.fn_custom_round_ai_spawn = &spawn_enemy;
	level.var_692420f3 = level.var_ab84adee;
	level.var_ab84adee = 1;
	level.var_44445188 = var_44445188;
	callback::on_ai_killed(&on_ai_killed);
	if(isdefined(var_6ad4e7c6))
	{
		level.var_d0be33a6 = 1;
		zm_trial_util::function_2976fa44(self.enemy_count);
		zm_trial_util::function_dace284(self.enemies_killed);
	}
}

/*
	Name: on_end
	Namespace: zm_trial_special_enemy
	Checksum: 0x3B5EBF4F
	Offset: 0x320
	Size: 0x9C
	Parameters: 1
	Flags: Linked, Private
*/
function private on_end(round_reset)
{
	level.var_9a0fbcb9 = undefined;
	level.var_44445188 = undefined;
	level.var_d0be33a6 = undefined;
	level.var_ef1a71b3 = level.var_efbb07e;
	level.fn_custom_round_ai_spawn = level.var_dc22f98;
	level.var_ab84adee = level.var_692420f3;
	zm_trial_util::function_f3dbeda7();
	callback::remove_on_ai_killed(&on_ai_killed);
}

/*
	Name: on_ai_killed
	Namespace: zm_trial_special_enemy
	Checksum: 0xAAF6AA0B
	Offset: 0x3C8
	Size: 0x17C
	Parameters: 1
	Flags: Linked, Private
*/
function private on_ai_killed(params)
{
	challenge = zm_trial::function_a36e8c38(#"special_enemy");
	/#
		assert(isdefined(challenge), "");
	#/
	if(challenge.enemy_type !== self.archetype)
	{
		return;
	}
	if(is_true(self.var_e700d5e2))
	{
		return;
	}
	if(level.var_44445188 === #"no_headshots" && isplayer(params.eattacker) && zm_utility::is_headshot(params.weapon, params.shitloc, params.smeansofdeath))
	{
		zm_trial::fail(#"hash_11e532a4f9c3e482", array(params.eattacker));
		return;
	}
	challenge.enemies_killed++;
	if(is_true(level.var_d0be33a6))
	{
		zm_trial_util::function_dace284(challenge.enemies_killed);
	}
}

/*
	Name: get_zombie_count_for_round
	Namespace: zm_trial_special_enemy
	Checksum: 0x15C2980
	Offset: 0x550
	Size: 0x1E
	Parameters: 2
	Flags: Linked, Private
*/
function private get_zombie_count_for_round(round_number, player_count)
{
	return level.zombie_total;
}

/*
	Name: spawn_enemy
	Namespace: zm_trial_special_enemy
	Checksum: 0x910C4A3D
	Offset: 0x578
	Size: 0x22C
	Parameters: 0
	Flags: Linked, Private
*/
function private spawn_enemy()
{
	var_f63f3454 = zm_trial::function_a36e8c38(#"defend_area");
	if(isdefined(var_f63f3454))
	{
		var_47ab7d31 = function_a1ef346b().size;
		var_f55dd0ac = 0;
		foreach(player in function_a1ef346b())
		{
			if(is_true(player.var_4cb0b91f))
			{
				var_f55dd0ac++;
			}
		}
		if(var_f55dd0ac < var_47ab7d31)
		{
			return true;
		}
	}
	challenge = zm_trial::function_a36e8c38(#"special_enemy");
	/#
		assert(isdefined(challenge));
	#/
	/#
		/#
			assert(isdefined(level.var_1cc18005));
		#/
		/#
			assert(isdefined(level.var_1cc18005[challenge.enemy_type]), "" + function_9e72a96(challenge.enemy_type));
		#/
	#/
	spawn_callback = level.var_1cc18005[challenge.enemy_type];
	spawn_success = [[spawn_callback]]();
	if(is_true(spawn_success))
	{
		level.zombie_total--;
	}
	return true;
}

/*
	Name: function_95c1dd81
	Namespace: zm_trial_special_enemy
	Checksum: 0xF74CBE77
	Offset: 0x7B0
	Size: 0x8C
	Parameters: 2
	Flags: Linked
*/
function function_95c1dd81(name, spawn_callback)
{
	if(!zm_trial::is_trial_mode())
	{
		return;
	}
	if(!isdefined(level.var_1cc18005))
	{
		level.var_1cc18005 = [];
	}
	/#
		assert(!isdefined(level.var_1cc18005[name]), "" + name);
	#/
	level.var_1cc18005[name] = spawn_callback;
}

/*
	Name: is_active
	Namespace: zm_trial_special_enemy
	Checksum: 0xDFCFE7FB
	Offset: 0x848
	Size: 0x32
	Parameters: 0
	Flags: None
*/
function is_active()
{
	challenge = zm_trial::function_a36e8c38(#"special_enemy");
	return isdefined(challenge);
}

