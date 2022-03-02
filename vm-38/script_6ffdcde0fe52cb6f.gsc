#using script_3f9e0dc8454d98e1;
#using script_6021ce59143452c3;
#using script_6ce38ab036223e6e;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_spawner.gsc;

#namespace namespace_e4df2f52;

/*
	Name: function_fbd7767c
	Namespace: namespace_e4df2f52
	Checksum: 0x2BEE93C0
	Offset: 0x98
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_fbd7767c()
{
	level notify(807262875);
}

/*
	Name: function_89f2df9
	Namespace: namespace_e4df2f52
	Checksum: 0x2EB75383
	Offset: 0xB8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_2b76723956a99b39", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_e4df2f52
	Checksum: 0xAC3BDC6F
	Offset: 0x100
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
	zm_trial::register_challenge(#"no_powerups", &function_d1de6a85, &function_9e7b3f4d);
}

/*
	Name: function_d1de6a85
	Namespace: namespace_e4df2f52
	Checksum: 0x3DE33F9C
	Offset: 0x168
	Size: 0xB0
	Parameters: 0
	Flags: Linked, Private
*/
function private function_d1de6a85()
{
	self.active = 1;
	self.enemies_killed = 0;
	zombie_utility::set_zombie_var(#"zombie_powerup_drop_max_per_round", 80);
	zm_spawner::register_zombie_death_event_callback(&function_138aec8e);
	kill_count = zm_powerups::function_2ff352cc();
	if(!isdefined(level.var_1dce56cc) || kill_count < level.var_1dce56cc)
	{
		level.var_1dce56cc = kill_count;
	}
}

/*
	Name: function_9e7b3f4d
	Namespace: namespace_e4df2f52
	Checksum: 0xBB04EF05
	Offset: 0x220
	Size: 0xB4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_9e7b3f4d(round_reset)
{
	self.active = 0;
	zombie_utility::set_zombie_var(#"zombie_powerup_drop_max_per_round", 4);
	level.var_1dce56cc = level.n_total_kills + function_21a3a673(15, 25);
	zombie_utility::set_zombie_var(#"zombie_drop_item", 0);
	zm_spawner::deregister_zombie_death_event_callback(&function_138aec8e);
}

/*
	Name: is_active
	Namespace: namespace_e4df2f52
	Checksum: 0xCE5508F8
	Offset: 0x2E0
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function is_active()
{
	challenge = zm_trial::function_a36e8c38(#"no_powerups");
	return isdefined(challenge) && is_true(challenge.active);
}

/*
	Name: function_2fc5f13
	Namespace: namespace_e4df2f52
	Checksum: 0xA329C57C
	Offset: 0x340
	Size: 0xF2
	Parameters: 0
	Flags: Linked
*/
function function_2fc5f13()
{
	challenge = zm_trial::function_a36e8c38(#"no_powerups");
	/#
		assert(isdefined(challenge));
	#/
	var_5843af96 = namespace_a28acff3::get_zombie_count_for_round(level.round_number, getplayers().size);
	frac = math::clamp(challenge.enemies_killed / var_5843af96, 0, 1);
	modifier = lerpfloat(25, 40, frac);
	return modifier;
}

/*
	Name: function_138aec8e
	Namespace: namespace_e4df2f52
	Checksum: 0x4F0E4AD0
	Offset: 0x440
	Size: 0xA0
	Parameters: 1
	Flags: Linked, Private
*/
function private function_138aec8e(attacker)
{
	if(!isplayer(attacker) && !is_true(self.nuked))
	{
		return;
	}
	challenge = zm_trial::function_a36e8c38(#"no_powerups");
	/#
		assert(isdefined(challenge));
	#/
	challenge.enemies_killed++;
}

