#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_round_logic.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace zm_trial_no_powerups;

/*
	Name: __init__system__
	Namespace: zm_trial_no_powerups
	Checksum: 0x8198F4F7
	Offset: 0x98
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_trial_no_powerups", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_trial_no_powerups
	Checksum: 0x71F1B20A
	Offset: 0xE0
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
	zm_trial::register_challenge(#"no_powerups", &on_begin, &on_end);
}

/*
	Name: on_begin
	Namespace: zm_trial_no_powerups
	Checksum: 0xD80EA963
	Offset: 0x148
	Size: 0xB0
	Parameters: 0
	Flags: Linked, Private
*/
function private on_begin()
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
	Name: on_end
	Namespace: zm_trial_no_powerups
	Checksum: 0xA2E44B86
	Offset: 0x200
	Size: 0xB4
	Parameters: 1
	Flags: Linked, Private
*/
function private on_end(round_reset)
{
	self.active = 0;
	zombie_utility::set_zombie_var(#"zombie_powerup_drop_max_per_round", 4);
	level.var_1dce56cc = level.n_total_kills + function_21a3a673(15, 25);
	zombie_utility::set_zombie_var(#"zombie_drop_item", 0);
	zm_spawner::deregister_zombie_death_event_callback(&function_138aec8e);
}

/*
	Name: is_active
	Namespace: zm_trial_no_powerups
	Checksum: 0xB0350E78
	Offset: 0x2C0
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
	Namespace: zm_trial_no_powerups
	Checksum: 0xD7B0BC5C
	Offset: 0x320
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
	var_5843af96 = zm_round_logic::get_zombie_count_for_round(level.round_number, getplayers().size);
	frac = math::clamp(challenge.enemies_killed / var_5843af96, 0, 1);
	modifier = lerpfloat(25, 40, frac);
	return modifier;
}

/*
	Name: function_138aec8e
	Namespace: zm_trial_no_powerups
	Checksum: 0xBB70B1FD
	Offset: 0x420
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

