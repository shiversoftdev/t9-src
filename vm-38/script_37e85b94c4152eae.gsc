#using script_2595527427ea71eb;
#using script_27c22e1d8df4d852;
#using script_6021ce59143452c3;
#using script_6ce38ab036223e6e;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace namespace_ec1ef97a;

/*
	Name: function_f720ed1
	Namespace: namespace_ec1ef97a
	Checksum: 0x92225908
	Offset: 0xB8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_f720ed1()
{
	level notify(1385306558);
}

/*
	Name: function_89f2df9
	Namespace: namespace_ec1ef97a
	Checksum: 0x5247EE97
	Offset: 0xD8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_16313bdca8b5638c", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_ec1ef97a
	Checksum: 0x2564BADF
	Offset: 0x120
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
	zm_trial::register_challenge(#"hash_5d38da46b35569b3", &function_d1de6a85, &function_9e7b3f4d);
}

/*
	Name: function_d1de6a85
	Namespace: namespace_ec1ef97a
	Checksum: 0x10545988
	Offset: 0x188
	Size: 0x11C
	Parameters: 3
	Flags: Private
*/
function private function_d1de6a85(var_6325d314, var_52b8b3a2, n_time)
{
	n_time_limit = zm_trial::function_5769f26a(n_time);
	n_grace = zm_trial::function_5769f26a(var_52b8b3a2);
	level thread function_8b87e57c(var_6325d314, n_grace, n_time_limit);
	level flag::set(#"infinite_round_spawning");
	level flag::set(#"pause_round_timeout");
	level.var_382a24b0 = 1;
	callback::on_spawned(&function_31f197c2);
	callback::add_callback(#"hash_137b937fd26992be", &function_ff66b979);
}

/*
	Name: function_9e7b3f4d
	Namespace: namespace_ec1ef97a
	Checksum: 0x55F6D60F
	Offset: 0x2B0
	Size: 0x174
	Parameters: 1
	Flags: Private
*/
function private function_9e7b3f4d(round_reset)
{
	foreach(player in getplayers())
	{
		if(level.var_f995ece6 zm_trial_timer::is_open(player))
		{
			level.var_f995ece6 zm_trial_timer::close(player);
			player namespace_b22c99a5::stop_timer();
		}
	}
	level flag::clear(#"infinite_round_spawning");
	level flag::clear(#"pause_round_timeout");
	level.var_382a24b0 = undefined;
	callback::remove_on_spawned(&function_31f197c2);
	callback::remove_callback(#"hash_137b937fd26992be", &function_ff66b979);
}

/*
	Name: function_8b87e57c
	Namespace: namespace_ec1ef97a
	Checksum: 0xACB303B6
	Offset: 0x430
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
			level.var_f995ece6 zm_trial_timer::function_8ede8e82(player, var_6325d314);
			level.var_f995ece6 zm_trial_timer::function_6ad54036(player, 1);
		}
		player namespace_b22c99a5::start_timer(n_time_limit);
	}
	wait(n_time_limit);
	foreach(player in getplayers())
	{
		if(level.var_f995ece6 zm_trial_timer::is_open(player))
		{
			level.var_f995ece6 zm_trial_timer::close(player);
			player namespace_b22c99a5::stop_timer();
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
	Namespace: namespace_ec1ef97a
	Checksum: 0x2C587058
	Offset: 0x710
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
		level.var_f995ece6 zm_trial_timer::function_8ede8e82(self, level.var_489d6aa2);
		level.var_f995ece6 zm_trial_timer::function_6ad54036(self, 1);
		self namespace_b22c99a5::start_timer(level.var_869f4c31);
	}
}

/*
	Name: function_14a98a41
	Namespace: namespace_ec1ef97a
	Checksum: 0x3B97BFA5
	Offset: 0x828
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
	Namespace: namespace_ec1ef97a
	Checksum: 0xE96B0017
	Offset: 0x8C0
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

