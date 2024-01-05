#using script_2595527427ea71eb;
#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace zm_trial_purchase_rush;

/*
	Name: function_76dd2a68
	Namespace: zm_trial_purchase_rush
	Checksum: 0xDD9EA57
	Offset: 0x98
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_76dd2a68()
{
	level notify(89381494);
}

/*
	Name: __init__system__
	Namespace: zm_trial_purchase_rush
	Checksum: 0x5592B60A
	Offset: 0xB8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_trial_purchase_rush", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_trial_purchase_rush
	Checksum: 0x7241F419
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
	zm_trial::register_challenge(#"purchase_rush", &on_begin, &on_end);
}

/*
	Name: on_begin
	Namespace: zm_trial_purchase_rush
	Checksum: 0x7D415751
	Offset: 0x168
	Size: 0x110
	Parameters: 1
	Flags: Private
*/
function private on_begin(n_timer)
{
	n_timer = zm_trial::function_5769f26a(n_timer);
	level.var_63c017bd = n_timer;
	callback::on_spawned(&on_player_spawned);
	callback::add_callback(#"on_host_migration_end", &function_ff66b979);
	foreach(player in getplayers())
	{
		player thread function_2e2a518(n_timer);
	}
}

/*
	Name: on_end
	Namespace: zm_trial_purchase_rush
	Checksum: 0xCB47CC56
	Offset: 0x280
	Size: 0xF0
	Parameters: 1
	Flags: Private
*/
function private on_end(round_reset)
{
	level.var_63c017bd = undefined;
	callback::remove_on_spawned(&on_player_spawned);
	callback::remove_callback(#"on_host_migration_end", &function_ff66b979);
	foreach(player in getplayers())
	{
		player stop_timer();
	}
}

/*
	Name: function_2e2a518
	Namespace: zm_trial_purchase_rush
	Checksum: 0x462864F
	Offset: 0x378
	Size: 0x18C
	Parameters: 2
	Flags: Private
*/
function private function_2e2a518(n_timer, var_f97d1a30)
{
	self endon(#"disconnect");
	level endon(#"hash_7646638df88a3656", #"hash_76fb373d2d71c744", #"host_migration_begin");
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
		s_waitresult = self waittilltimeout(n_timer, #"spent_points", #"hash_14b0ad44336160bc");
		self stop_timer();
		if(s_waitresult._notify == "timeout")
		{
			zm_trial::fail(#"hash_1a444a987e075837", array(self));
			level notify(#"hash_76fb373d2d71c744");
			return;
		}
		wait(3);
	}
}

/*
	Name: on_player_spawned
	Namespace: zm_trial_purchase_rush
	Checksum: 0x1D67ED02
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
	Namespace: zm_trial_purchase_rush
	Checksum: 0xC6B854C5
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
		level.var_f995ece6 zm_trial_timer::set_timer_text(self, #"hash_424e01ea2299eec0");
		level.var_f995ece6 zm_trial_timer::set_under_round_rules(self, 1);
		self zm_trial_util::start_timer(timeout);
		self thread function_a0f0109f(timeout, var_f97d1a30);
	}
}

/*
	Name: function_a0f0109f
	Namespace: zm_trial_purchase_rush
	Checksum: 0x8165307D
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
	Namespace: zm_trial_purchase_rush
	Checksum: 0xE9091B8F
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
		self zm_trial_util::stop_timer();
	}
	self notify(#"hash_2a79adac1fd03c09");
	self.n_time_remaining = undefined;
}

/*
	Name: function_ff66b979
	Namespace: zm_trial_purchase_rush
	Checksum: 0x531F05AA
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
			player zm_trial_util::stop_timer();
		}
	}
	wait(5);
	foreach(player in getplayers())
	{
		player thread function_2e2a518((isdefined(player.n_time_remaining) ? player.n_time_remaining : level.var_63c017bd), 1);
	}
}

