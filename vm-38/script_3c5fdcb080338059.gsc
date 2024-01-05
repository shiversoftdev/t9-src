#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_ea9baedf;

/*
	Name: function_867f76cd
	Namespace: namespace_ea9baedf
	Checksum: 0xE457D957
	Offset: 0x90
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_867f76cd()
{
	level notify(-799002713);
}

/*
	Name: __init__system__
	Namespace: namespace_ea9baedf
	Checksum: 0x50414563
	Offset: 0xB0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_c25f006b5e1726d", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_ea9baedf
	Checksum: 0xB09324F6
	Offset: 0xF8
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
	zm_trial::register_challenge(#"hash_7735a2dc4298e55c", &on_begin, &on_end);
}

/*
	Name: on_begin
	Namespace: namespace_ea9baedf
	Checksum: 0xC24C8629
	Offset: 0x160
	Size: 0x184
	Parameters: 1
	Flags: Private
*/
function private on_begin(kill_count)
{
	self.kill_count = zm_trial::function_5769f26a(kill_count);
	foreach(player in getplayers())
	{
		player.var_c957540c = 0;
	}
	zm_spawner::register_zombie_death_event_callback(&function_138aec8e);
	zm_trial_util::function_c2cd0cba(self.kill_count);
	foreach(player in getplayers())
	{
		player thread function_7f62f098(self);
	}
	level thread function_69c5df45(self);
}

/*
	Name: on_end
	Namespace: namespace_ea9baedf
	Checksum: 0x8B2357AB
	Offset: 0x2F0
	Size: 0x254
	Parameters: 1
	Flags: Private
*/
function private on_end(round_reset)
{
	foreach(player in getplayers())
	{
		player zm_trial_util::function_f3aacffb();
	}
	if(!round_reset)
	{
		var_57807cdc = [];
		foreach(player in getplayers())
		{
			if(player.var_c957540c < self.kill_count)
			{
				array::add(var_57807cdc, player, 0);
			}
		}
		if(var_57807cdc.size == 1)
		{
			zm_trial::fail(#"hash_788ffc8d7448f05", var_57807cdc);
		}
		else if(var_57807cdc.size > 1)
		{
			zm_trial::fail(#"hash_2bf9eb58ed3ac518", var_57807cdc);
		}
	}
	foreach(player in getplayers())
	{
		player.var_c957540c = undefined;
	}
	zm_spawner::deregister_zombie_death_event_callback(&function_138aec8e);
}

/*
	Name: function_7f62f098
	Namespace: namespace_ea9baedf
	Checksum: 0x52748273
	Offset: 0x550
	Size: 0x9E
	Parameters: 1
	Flags: Private
*/
function private function_7f62f098(challenge)
{
	self endon(#"disconnect");
	level endon(#"hash_7646638df88a3656");
	while(true)
	{
		var_96936cca = self.var_c957540c;
		if(var_96936cca < 0)
		{
			var_96936cca = 0;
		}
		else if(var_96936cca > challenge.kill_count)
		{
			var_96936cca = challenge.kill_count;
		}
		self zm_trial_util::function_2190356a(var_96936cca);
		waitframe(1);
	}
}

/*
	Name: function_69c5df45
	Namespace: namespace_ea9baedf
	Checksum: 0xF23A3FEA
	Offset: 0x5F8
	Size: 0x184
	Parameters: 1
	Flags: Private
*/
function private function_69c5df45(challenge)
{
	level endon(#"hash_7646638df88a3656");
	while(true)
	{
		/#
			assert(isdefined(challenge));
		#/
		end_round = 1;
		foreach(player in getplayers())
		{
			if(player.var_c957540c < challenge.kill_count)
			{
				end_round = 0;
			}
		}
		if(end_round)
		{
			enemies = getaiteamarray(level.zombie_team);
			if(isdefined(enemies))
			{
				for(i = 0; i < enemies.size; i++)
				{
					enemies[i] dodamage(enemies[i].health + 666, enemies[i].origin);
				}
			}
			level.zombie_total = 0;
			return;
		}
		waitframe(1);
	}
}

/*
	Name: function_138aec8e
	Namespace: namespace_ea9baedf
	Checksum: 0x1B4274DC
	Offset: 0x788
	Size: 0xD0
	Parameters: 1
	Flags: Private
*/
function private function_138aec8e(attacker)
{
	if(is_true(self.nuked))
	{
		foreach(player in getplayers())
		{
			player.var_c957540c++;
		}
		return;
	}
	if(isplayer(attacker))
	{
		attacker.var_c957540c++;
	}
}

