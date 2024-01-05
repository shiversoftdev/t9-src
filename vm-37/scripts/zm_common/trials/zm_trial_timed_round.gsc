#using script_2595527427ea71eb;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\zm_common\zm_round_logic.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace zm_trial_timed_round;

/*
	Name: __init__system__
	Namespace: zm_trial_timed_round
	Checksum: 0xFA2933EC
	Offset: 0xB8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_trial_timed_round", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_trial_timed_round
	Checksum: 0xD86D1AED
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
	zm_trial::register_challenge(#"timed_round", &on_begin, &on_end);
}

/*
	Name: on_begin
	Namespace: zm_trial_timed_round
	Checksum: 0x1BE9E366
	Offset: 0x168
	Size: 0x11C
	Parameters: 3
	Flags: Private
*/
function private on_begin(var_6325d314, var_52b8b3a2, n_time)
{
	n_time_limit = zm_trial::function_5769f26a(n_time);
	n_grace = zm_trial::function_5769f26a(var_52b8b3a2);
	level thread function_8b87e57c(var_6325d314, n_grace, n_time_limit);
	level flag::set(#"infinite_round_spawning");
	level flag::set(#"pause_round_timeout");
	level.var_382a24b0 = 1;
	callback::on_spawned(&function_31f197c2);
	callback::add_callback(#"on_host_migration_end", &function_ff66b979);
}

/*
	Name: on_end
	Namespace: zm_trial_timed_round
	Checksum: 0x23BA9A00
	Offset: 0x290
	Size: 0x174
	Parameters: 1
	Flags: Private
*/
function private on_end(round_reset)
{
	foreach(player in getplayers())
	{
		if(level.var_f995ece6 zm_trial_timer::is_open(player))
		{
			level.var_f995ece6 zm_trial_timer::close(player);
			player zm_trial_util::stop_timer();
		}
	}
	level flag::clear(#"infinite_round_spawning");
	level flag::clear(#"pause_round_timeout");
	level.var_382a24b0 = undefined;
	callback::remove_on_spawned(&function_31f197c2);
	callback::remove_callback(#"on_host_migration_end", &function_ff66b979);
}

/*
	Name: function_8b87e57c
	Namespace: zm_trial_timed_round
	Checksum: 0x64B24B3C
	Offset: 0x410
	Size: 0x2D8
	Parameters: 3
	Flags: Private
*/
function private function_8b87e57c(var_6325d314, n_grace, n_time_limit)
{
	level endon(#"end_of_round", #"host_migration_begin");
	wait(n_grace);
	level thread function_14a98a41(var_6325d314, n_time_limit);
	foreach(player in getplayers())
	{
		if(!level.var_f995ece6 zm_trial_timer::is_open(player))
		{
			level.var_f995ece6 zm_trial_timer::open(player);
			level.var_f995ece6 zm_trial_timer::set_timer_text(player, var_6325d314);
			level.var_f995ece6 zm_trial_timer::set_under_round_rules(player, 1);
		}
		player zm_trial_util::start_timer(n_time_limit);
	}
	wait(n_time_limit);
	foreach(player in getplayers())
	{
		if(level.var_f995ece6 zm_trial_timer::is_open(player))
		{
			level.var_f995ece6 zm_trial_timer::close(player);
			player zm_trial_util::stop_timer();
		}
	}
	level flag::clear(#"infinite_round_spawning");
	level flag::clear(#"pause_round_timeout");
	level.zombie_total = 0;
	level thread zm_utility::function_9ad5aeb1(0, 1);
	level notify(#"kill_round");
	level notify(#"kill_round_wait");
}

/*
	Name: function_31f197c2
	Namespace: zm_trial_timed_round
	Checksum: 0x74A56C58
	Offset: 0x6F0
	Size: 0x10C
	Parameters: 0
	Flags: Private
*/
function private function_31f197c2()
{
	level endon(#"hash_7646638df88a3656");
	self endon(#"disconnect");
	wait(0.5);
	var_9a703be9 = level.var_869f4c31;
	while(var_9a703be9 == level.var_869f4c31)
	{
		waitframe(1);
	}
	if(!level.var_f995ece6 zm_trial_timer::is_open(self))
	{
		level.var_f995ece6 zm_trial_timer::open(self);
		level.var_f995ece6 zm_trial_timer::set_timer_text(self, level.var_489d6aa2);
		level.var_f995ece6 zm_trial_timer::set_under_round_rules(self, 1);
		self zm_trial_util::start_timer(level.var_869f4c31);
	}
}

/*
	Name: function_14a98a41
	Namespace: zm_trial_timed_round
	Checksum: 0xC2AB5AE9
	Offset: 0x808
	Size: 0x8C
	Parameters: 2
	Flags: Private
*/
function private function_14a98a41(str_label, n_time_limit)
{
	self notify("6b2c93b0788dd738");
	self endon("6b2c93b0788dd738");
	level endon(#"end_of_round", #"host_migration_begin");
	level.var_489d6aa2 = str_label;
	level.var_869f4c31 = n_time_limit;
	while(true)
	{
		wait(1);
		level.var_869f4c31--;
	}
}

/*
	Name: function_ff66b979
	Namespace: zm_trial_timed_round
	Checksum: 0x39FB3B0B
	Offset: 0x8A0
	Size: 0x104
	Parameters: 0
	Flags: Private
*/
function private function_ff66b979()
{
	level endon(#"end_of_round");
	foreach(player in getplayers())
	{
		if(level.var_f995ece6 zm_trial_timer::is_open(player))
		{
			level.var_f995ece6 zm_trial_timer::close(player);
		}
	}
	wait(5);
	level thread function_8b87e57c(level.var_489d6aa2, 0, level.var_869f4c31);
}

