#using script_27c22e1d8df4d852;
#using script_6021ce59143452c3;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace namespace_32192f7;

/*
	Name: function_89f2df9
	Namespace: namespace_32192f7
	Checksum: 0x2C9B84C
	Offset: 0x98
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_48e0e8f7de7eaf3c", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_32192f7
	Checksum: 0x130CC57B
	Offset: 0xE0
	Size: 0x5C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!zm_trial::function_b47f6aba())
	{
		return;
	}
	zm_trial::register_challenge(#"hash_79a710e660651843", &function_d1de6a85, &function_9e7b3f4d);
}

/*
	Name: function_d1de6a85
	Namespace: namespace_32192f7
	Checksum: 0x5F8A202B
	Offset: 0x148
	Size: 0x1AC
	Parameters: 5
	Flags: Linked, Private
*/
function private function_d1de6a85(enemy_type, var_6b96eb7b, var_46cce0c5, var_6ad4e7c6, var_44445188)
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
		namespace_b22c99a5::function_2976fa44(self.enemy_count);
		namespace_b22c99a5::function_dace284(self.enemies_killed);
	}
}

/*
	Name: function_9e7b3f4d
	Namespace: namespace_32192f7
	Checksum: 0x507F82EC
	Offset: 0x300
	Size: 0x9C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_9e7b3f4d(round_reset)
{
	level.var_9a0fbcb9 = undefined;
	level.var_44445188 = undefined;
	level.var_d0be33a6 = undefined;
	level.var_ef1a71b3 = level.var_efbb07e;
	level.fn_custom_round_ai_spawn = level.var_dc22f98;
	level.var_ab84adee = level.var_692420f3;
	namespace_b22c99a5::function_f3dbeda7();
	callback::remove_on_ai_killed(&on_ai_killed);
}

/*
	Name: on_ai_killed
	Namespace: namespace_32192f7
	Checksum: 0x93A68D61
	Offset: 0x3A8
	Size: 0x17C
	Parameters: 1
	Flags: Linked, Private
*/
function private on_ai_killed(params)
{
	challenge = zm_trial::function_a36e8c38(#"hash_79a710e660651843");
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
	if(level.var_44445188 === #"hash_6a1ae478973ee12" && isplayer(params.eattacker) && zm_utility::is_headshot(params.weapon, params.shitloc, params.smeansofdeath))
	{
		zm_trial::fail(#"hash_11e532a4f9c3e482", array(params.eattacker));
		return;
	}
	challenge.enemies_killed++;
	if(is_true(level.var_d0be33a6))
	{
		namespace_b22c99a5::function_dace284(challenge.enemies_killed);
	}
}

/*
	Name: get_zombie_count_for_round
	Namespace: namespace_32192f7
	Checksum: 0x6182BB15
	Offset: 0x530
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
	Namespace: namespace_32192f7
	Checksum: 0x7E90160D
	Offset: 0x558
	Size: 0x22C
	Parameters: 0
	Flags: Linked, Private
*/
function private spawn_enemy()
{
	var_f63f3454 = zm_trial::function_a36e8c38(#"hash_a0e875894ebc5ff");
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
	challenge = zm_trial::function_a36e8c38(#"hash_79a710e660651843");
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
	Namespace: namespace_32192f7
	Checksum: 0x5A98FF9F
	Offset: 0x790
	Size: 0x8C
	Parameters: 2
	Flags: Linked
*/
function function_95c1dd81(name, spawn_callback)
{
	if(!zm_trial::function_b47f6aba())
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
	Namespace: namespace_32192f7
	Checksum: 0x4B64CC35
	Offset: 0x828
	Size: 0x32
	Parameters: 0
	Flags: None
*/
function is_active()
{
	challenge = zm_trial::function_a36e8c38(#"hash_79a710e660651843");
	return isdefined(challenge);
}

