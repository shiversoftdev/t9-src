#using script_14f4a3c583c77d4b;
#using script_2595527427ea71eb;
#using script_27c22e1d8df4d852;
#using script_6021ce59143452c3;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\zm_common\zm_laststand.gsc;
#using scripts\zm_common\zm_score.gsc;

#namespace namespace_8cefe82f;

/*
	Name: function_89f2df9
	Namespace: namespace_8cefe82f
	Checksum: 0xE83BA97F
	Offset: 0xB0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_71a1297844fdf28e", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_8cefe82f
	Checksum: 0xD4457B2
	Offset: 0xF8
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
	zm_trial::register_challenge(#"hash_163077e21e01f4a7", &function_d1de6a85, &function_9e7b3f4d);
}

/*
	Name: function_d1de6a85
	Namespace: namespace_8cefe82f
	Checksum: 0xCD8316C7
	Offset: 0x160
	Size: 0x110
	Parameters: 1
	Flags: Private
*/
function private function_d1de6a85(n_timer)
{
	n_timer = zm_trial::function_5769f26a(n_timer);
	level.var_f7236c66 = n_timer;
	callback::on_spawned(&on_player_spawned);
	callback::add_callback(#"hash_137b937fd26992be", &function_ff66b979);
	foreach(player in getplayers())
	{
		player thread function_7650d9fb(n_timer);
	}
}

/*
	Name: function_9e7b3f4d
	Namespace: namespace_8cefe82f
	Checksum: 0x30AC6A5
	Offset: 0x278
	Size: 0xF0
	Parameters: 1
	Flags: Private
*/
function private function_9e7b3f4d(round_reset)
{
	level.var_f7236c66 = undefined;
	callback::remove_on_spawned(&on_player_spawned);
	callback::remove_callback(#"hash_137b937fd26992be", &function_ff66b979);
	foreach(player in getplayers())
	{
		player stop_timer();
	}
}

/*
	Name: function_7650d9fb
	Namespace: namespace_8cefe82f
	Checksum: 0xAFE7BA21
	Offset: 0x370
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
		var_be17187b = undefined;
		var_be17187b = self waittilltimeout(n_timer + 1, #"hash_e66663be8ba322f");
		self stop_timer();
		if(var_be17187b._notify == "timeout")
		{
			zm_trial::fail(#"hash_4e619a0715198f72", array(self));
			level notify(#"hash_6223843ef1e3c6de");
			return;
		}
		var_be17187b = undefined;
		var_be17187b = self waittill(#"hash_66790eb1100e11a2");
	}
}

/*
	Name: on_player_spawned
	Namespace: namespace_8cefe82f
	Checksum: 0x8918C7F2
	Offset: 0x510
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
	Checksum: 0xDDEFFC86
	Offset: 0x578
	Size: 0xCC
	Parameters: 2
	Flags: Private
*/
function private start_timer(timeout, var_f97d1a30)
{
	if(!level.var_f995ece6 zm_trial_timer::is_open(self))
	{
		level.var_f995ece6 zm_trial_timer::open(self);
		level.var_f995ece6 zm_trial_timer::function_8ede8e82(self, #"hash_459951bdd5145bf0");
		level.var_f995ece6 zm_trial_timer::function_6ad54036(self, 1);
		self namespace_b22c99a5::start_timer(timeout);
		self thread function_a0f0109f(timeout, var_f97d1a30);
	}
}

/*
	Name: function_a0f0109f
	Namespace: namespace_8cefe82f
	Checksum: 0xA1C19E4
	Offset: 0x650
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
	Checksum: 0x7FEE04EE
	Offset: 0x728
	Size: 0x76
	Parameters: 0
	Flags: Private
*/
function private stop_timer()
{
	if(level.var_f995ece6 zm_trial_timer::is_open(self))
	{
		level.var_f995ece6 zm_trial_timer::close(self);
		self namespace_b22c99a5::stop_timer();
	}
	self notify(#"hash_2a79adac1fd03c09");
	self.n_time_remaining = undefined;
}

/*
	Name: function_ff66b979
	Namespace: namespace_8cefe82f
	Checksum: 0xDE78456B
	Offset: 0x7A8
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
			player namespace_b22c99a5::stop_timer();
		}
	}
	wait(5);
	foreach(player in getplayers())
	{
		player thread function_7650d9fb((isdefined(player.n_time_remaining) ? player.n_time_remaining : level.var_f7236c66), 1);
	}
}

