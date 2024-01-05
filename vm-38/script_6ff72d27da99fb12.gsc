#using script_2595527427ea71eb;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_laststand.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace namespace_8cefe82f;

/*
	Name: function_c1e06433
	Namespace: namespace_8cefe82f
	Checksum: 0xE0044376
	Offset: 0xB0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_c1e06433()
{
	level notify(67870695);
}

/*
	Name: __init__system__
	Namespace: namespace_8cefe82f
	Checksum: 0x66800E24
	Offset: 0xD0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_71a1297844fdf28e", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_8cefe82f
	Checksum: 0xAACC8BC2
	Offset: 0x118
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
	zm_trial::register_challenge(#"hash_163077e21e01f4a7", &on_begin, &on_end);
}

/*
	Name: on_begin
	Namespace: namespace_8cefe82f
	Checksum: 0xF452F29E
	Offset: 0x180
	Size: 0x110
	Parameters: 1
	Flags: Private
*/
function private on_begin(n_timer)
{
	n_timer = zm_trial::function_5769f26a(n_timer);
	level.var_f7236c66 = n_timer;
	callback::on_spawned(&on_player_spawned);
	callback::add_callback(#"on_host_migration_end", &function_ff66b979);
	foreach(player in getplayers())
	{
		player thread function_7650d9fb(n_timer);
	}
}

/*
	Name: on_end
	Namespace: namespace_8cefe82f
	Checksum: 0x651DD363
	Offset: 0x298
	Size: 0xF0
	Parameters: 1
	Flags: Private
*/
function private on_end(round_reset)
{
	level.var_f7236c66 = undefined;
	callback::remove_on_spawned(&on_player_spawned);
	callback::remove_callback(#"on_host_migration_end", &function_ff66b979);
	foreach(player in getplayers())
	{
		player stop_timer();
	}
}

/*
	Name: function_7650d9fb
	Namespace: namespace_8cefe82f
	Checksum: 0xC7EBA1CC
	Offset: 0x390
	Size: 0x198
	Parameters: 2
	Flags: Private
*/
function private function_7650d9fb(n_timer, var_f97d1a30)
{
	self endon(#"disconnect");
	level endon(#"hash_7646638df88a3656", #"hash_6223843ef1e3c6de", #"host_migration_begin");
	if(!is_true(var_f97d1a30))
	{
		wait(12);
	}
	while(true)
	{
		while(!isalive(self))
		{
			self waittill(#"spawned");
			wait(2);
		}
		self start_timer(n_timer, var_f97d1a30);
		s_waitresult = undefined;
		s_waitresult = self waittilltimeout(n_timer + 1, #"fasttravel_bought");
		self stop_timer();
		if(s_waitresult._notify == "timeout")
		{
			zm_trial::fail(#"hash_4e619a0715198f72", array(self));
			level notify(#"hash_6223843ef1e3c6de");
			return;
		}
		s_waitresult = undefined;
		s_waitresult = self waittill(#"fasttravel_finished");
	}
}

/*
	Name: on_player_spawned
	Namespace: namespace_8cefe82f
	Checksum: 0x66A5A9CA
	Offset: 0x530
	Size: 0x5C
	Parameters: 0
	Flags: Private
*/
function private on_player_spawned()
{
	self endon(#"disconnect");
	level endon(#"host_migration_begin");
	wait(2);
	if(isdefined(self.n_time_remaining))
	{
		self start_timer(self.n_time_remaining);
	}
}

/*
	Name: start_timer
	Namespace: namespace_8cefe82f
	Checksum: 0x43F5BCB7
	Offset: 0x598
	Size: 0xCC
	Parameters: 2
	Flags: Private
*/
function private start_timer(timeout, var_f97d1a30)
{
	if(!level.var_f995ece6 zm_trial_timer::is_open(self))
	{
		level.var_f995ece6 zm_trial_timer::open(self);
		level.var_f995ece6 zm_trial_timer::set_timer_text(self, #"hash_459951bdd5145bf0");
		level.var_f995ece6 zm_trial_timer::set_under_round_rules(self, 1);
		self zm_trial_util::start_timer(timeout);
		self thread function_a0f0109f(timeout, var_f97d1a30);
	}
}

/*
	Name: function_a0f0109f
	Namespace: namespace_8cefe82f
	Checksum: 0x2EF7745E
	Offset: 0x670
	Size: 0xD0
	Parameters: 2
	Flags: None
*/
function function_a0f0109f(timeout, var_f97d1a30)
{
	if(isdefined(self.n_time_remaining) && !is_true(var_f97d1a30))
	{
		return;
	}
	self endon(#"disconnect", #"hash_2a79adac1fd03c09");
	level endon(#"hash_7646638df88a3656", #"end_game", #"host_migration_begin");
	if(!isdefined(self.n_time_remaining))
	{
		self.n_time_remaining = timeout;
	}
	while(self.n_time_remaining > 0)
	{
		wait(1);
		self.n_time_remaining--;
	}
}

/*
	Name: stop_timer
	Namespace: namespace_8cefe82f
	Checksum: 0xA7E61122
	Offset: 0x748
	Size: 0x76
	Parameters: 0
	Flags: Private
*/
function private stop_timer()
{
	if(level.var_f995ece6 zm_trial_timer::is_open(self))
	{
		level.var_f995ece6 zm_trial_timer::close(self);
		self zm_trial_util::stop_timer();
	}
	self notify(#"hash_2a79adac1fd03c09");
	self.n_time_remaining = undefined;
}

/*
	Name: function_ff66b979
	Namespace: namespace_8cefe82f
	Checksum: 0x235C646
	Offset: 0x7C8
	Size: 0x1B0
	Parameters: 0
	Flags: Private
*/
function private function_ff66b979()
{
	level endon(#"end_round", #"host_migration_begin");
	foreach(player in getplayers())
	{
		if(level.var_f995ece6 zm_trial_timer::is_open(player))
		{
			level.var_f995ece6 zm_trial_timer::close(player);
			player zm_trial_util::stop_timer();
		}
	}
	wait(5);
	foreach(player in getplayers())
	{
		player thread function_7650d9fb((isdefined(player.n_time_remaining) ? player.n_time_remaining : level.var_f7236c66), 1);
	}
}

