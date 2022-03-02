#using script_2595527427ea71eb;
#using script_27c22e1d8df4d852;
#using script_6021ce59143452c3;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;

#namespace namespace_ca28d1aa;

/*
	Name: function_89f2df9
	Namespace: namespace_ca28d1aa
	Checksum: 0xB4CD70DC
	Offset: 0x130
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_5fc0100b44dd1dac", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_ca28d1aa
	Checksum: 0x2EB71DFC
	Offset: 0x178
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
	zm_trial::register_challenge(#"hash_5b4dc34d166627cb", &function_d1de6a85, &function_9e7b3f4d);
}

/*
	Name: function_d1de6a85
	Namespace: namespace_ca28d1aa
	Checksum: 0x9208BE4D
	Offset: 0x1E0
	Size: 0x124
	Parameters: 5
	Flags: Private
*/
function private function_d1de6a85(var_ed49e96e, var_ea5e88ac, str_return, var_c728f1dd, var_aed178c2)
{
	callback::add_callback(#"hash_137b937fd26992be", &function_ff66b979);
	level flag::set(#"infinite_round_spawning");
	level flag::set(#"pause_round_timeout");
	level.var_2bb6b2ba = [];
	level.var_9fc7133d = zm_trial::function_5769f26a(var_c728f1dd);
	self.n_defend_time = zm_trial::function_5769f26a(var_aed178c2);
	self.var_a7d4f51b = var_ea5e88ac;
	self.str_return = str_return;
	self.var_247c8132 = struct::get(var_ed49e96e);
	self thread function_452ec7b3();
}

/*
	Name: function_9e7b3f4d
	Namespace: namespace_ca28d1aa
	Checksum: 0xD5F07A14
	Offset: 0x310
	Size: 0x13A
	Parameters: 1
	Flags: Private
*/
function private function_9e7b3f4d(round_reset)
{
	callback::remove_callback(#"hash_137b937fd26992be", &function_ff66b979);
	arrayremovevalue(level.var_2bb6b2ba, undefined);
	array::delete_all(level.var_2bb6b2ba);
	level.var_2bb6b2ba = undefined;
	zm_utility::function_75fd65f9(self.var_f7f308cd, 0);
	foreach(player in getplayers())
	{
		player zm_utility::function_ba39d198(self.var_df62490a, 0);
		player.var_356935bb = undefined;
	}
}

/*
	Name: function_452ec7b3
	Namespace: namespace_ca28d1aa
	Checksum: 0x93E197D
	Offset: 0x458
	Size: 0xC40
	Parameters: 0
	Flags: Private
*/
function private function_452ec7b3()
{
	level endon(#"end_of_round");
	wait(12);
	var_2fe28f97 = 1;
	while(isdefined(self.var_247c8132))
	{
		level.var_c8b84806 = [];
		s_hill = self.var_247c8132;
		a_str_zones = strtok(s_hill.script_string, ",");
		foreach(str_zone in a_str_zones)
		{
			level.var_c8b84806[str_zone] = 1;
		}
		self.var_df62490a = zm_utility::function_d7db256e(s_hill.targetname, #"hash_28d5f57c2309090", 0);
		self.var_f7f308cd = s_hill.targetname;
		self thread function_492f4c79();
		foreach(player in getplayers())
		{
			player thread zone_watcher(self, self.var_a7d4f51b, self.str_return, level.var_9fc7133d);
			player thread damage_watcher();
		}
		arrayremovevalue(level.var_2bb6b2ba, undefined);
		arrayremovevalue(level.active_powerups, undefined);
		var_5579e5fa = function_c30f9a6e(s_hill.origin);
		switch(getplayers().size)
		{
			case 1:
			case 2:
			{
				switch(var_2fe28f97)
				{
					case 1:
					{
						level.var_2bb6b2ba[level.var_2bb6b2ba.size] = zm_powerups::specific_powerup_drop("full_ammo", (isdefined(var_5579e5fa[0]) ? var_5579e5fa[0] : s_hill.origin), undefined, undefined, undefined, 1, 1);
						level.var_2bb6b2ba[level.var_2bb6b2ba.size] = zm_powerups::specific_powerup_drop("hero_weapon_power", (isdefined(var_5579e5fa[1]) ? var_5579e5fa[1] : s_hill.origin), undefined, undefined, undefined, 1, 1);
						break;
					}
					case 2:
					{
						level.var_2bb6b2ba[level.var_2bb6b2ba.size] = zm_powerups::specific_powerup_drop("insta_kill", (isdefined(var_5579e5fa[0]) ? var_5579e5fa[0] : s_hill.origin), undefined, undefined, undefined, 1, 1);
						break;
					}
					case 3:
					{
						break;
					}
					case 4:
					{
						level.var_2bb6b2ba[level.var_2bb6b2ba.size] = zm_powerups::specific_powerup_drop("hero_weapon_power", (isdefined(var_5579e5fa[0]) ? var_5579e5fa[0] : s_hill.origin), undefined, undefined, undefined, 1, 1);
						break;
					}
					case 5:
					{
						level.var_2bb6b2ba[level.var_2bb6b2ba.size] = zm_powerups::specific_powerup_drop("full_ammo", (isdefined(var_5579e5fa[0]) ? var_5579e5fa[0] : s_hill.origin), undefined, undefined, undefined, 1, 1);
						level.var_2bb6b2ba[level.var_2bb6b2ba.size] = zm_powerups::specific_powerup_drop("hero_weapon_power", (isdefined(var_5579e5fa[1]) ? var_5579e5fa[1] : s_hill.origin), undefined, undefined, undefined, 1, 1);
						break;
					}
					case 6:
					{
						level.var_2bb6b2ba[level.var_2bb6b2ba.size] = zm_powerups::specific_powerup_drop("insta_kill", (isdefined(var_5579e5fa[0]) ? var_5579e5fa[0] : s_hill.origin), undefined, undefined, undefined, 1, 1);
						break;
					}
					case 7:
					{
						level.var_2bb6b2ba[level.var_2bb6b2ba.size] = zm_powerups::specific_powerup_drop("insta_kill", (isdefined(var_5579e5fa[0]) ? var_5579e5fa[0] : s_hill.origin), undefined, undefined, undefined, 1, 1);
						break;
					}
					case 8:
					{
						level.var_2bb6b2ba[level.var_2bb6b2ba.size] = zm_powerups::specific_powerup_drop("full_ammo", (isdefined(var_5579e5fa[0]) ? var_5579e5fa[0] : s_hill.origin), undefined, undefined, undefined, 1, 1);
						break;
					}
					case 9:
					{
						level.var_2bb6b2ba[level.var_2bb6b2ba.size] = zm_powerups::specific_powerup_drop("hero_weapon_power", (isdefined(var_5579e5fa[0]) ? var_5579e5fa[0] : s_hill.origin), undefined, undefined, undefined, 1, 1);
						break;
					}
				}
				break;
			}
			case 3:
			case 4:
			{
				switch(var_2fe28f97)
				{
					case 1:
					{
						level.var_2bb6b2ba[level.var_2bb6b2ba.size] = zm_powerups::specific_powerup_drop("full_ammo", (isdefined(var_5579e5fa[0]) ? var_5579e5fa[0] : s_hill.origin), undefined, undefined, undefined, 1, 1);
						break;
					}
					case 5:
					{
						level.var_2bb6b2ba[level.var_2bb6b2ba.size] = zm_powerups::specific_powerup_drop("insta_kill", (isdefined(var_5579e5fa[0]) ? var_5579e5fa[0] : s_hill.origin), undefined, undefined, undefined, 1, 1);
						break;
					}
					case 6:
					{
						level.var_2bb6b2ba[level.var_2bb6b2ba.size] = zm_powerups::specific_powerup_drop("hero_weapon_power", (isdefined(var_5579e5fa[0]) ? var_5579e5fa[0] : s_hill.origin), undefined, undefined, undefined, 1, 1);
						break;
					}
					case 7:
					{
						level.var_2bb6b2ba[level.var_2bb6b2ba.size] = zm_powerups::specific_powerup_drop("full_ammo", (isdefined(var_5579e5fa[0]) ? var_5579e5fa[0] : s_hill.origin), undefined, undefined, undefined, 1, 1);
						break;
					}
					case 9:
					{
						level.var_2bb6b2ba[level.var_2bb6b2ba.size] = zm_powerups::specific_powerup_drop("hero_weapon_power", (isdefined(var_5579e5fa[0]) ? var_5579e5fa[0] : s_hill.origin), undefined, undefined, undefined, 1, 1);
						break;
					}
				}
				break;
			}
		}
		do
		{
			var_5630b1e = 1;
			foreach(player in getplayers())
			{
				if(isalive(player) && !is_true(player.var_4cb0b91f))
				{
					var_5630b1e = 0;
				}
			}
			waitframe(1);
		}
		while(!var_5630b1e);
		wait(self.n_defend_time);
		if(isdefined(s_hill.script_noteworthy))
		{
			self.var_247c8132 = struct::get(s_hill.script_noteworthy);
		}
		else
		{
			self.var_247c8132 = undefined;
		}
		level notify(#"hash_29877ed061231191");
		var_2fe28f97++;
		zm_utility::function_75fd65f9(self.var_f7f308cd, 0);
		foreach(player in getplayers())
		{
			player zm_utility::function_ba39d198(self.var_df62490a, 0);
		}
		wait(1);
	}
	level flag::clear(#"spawn_zombies");
	level zm_utility::function_9ad5aeb1(0, 1, 1);
	wait(3);
	level flag::clear(#"infinite_round_spawning");
	level flag::clear(#"pause_round_timeout");
	level.zombie_total = 0;
	level thread zm_utility::function_9ad5aeb1(0, 1);
	level notify(#"kill_round");
	level notify(#"kill_round_wait");
}

/*
	Name: function_492f4c79
	Namespace: namespace_ca28d1aa
	Checksum: 0x2810B170
	Offset: 0x10A0
	Size: 0x44
	Parameters: 0
	Flags: Private
*/
function private function_492f4c79()
{
	level endon(#"hash_7646638df88a3656", #"hash_29877ed061231191");
	zm_utility::function_75fd65f9(self.var_f7f308cd, 1);
}

/*
	Name: start_timer
	Namespace: namespace_ca28d1aa
	Checksum: 0xBA2B2E3B
	Offset: 0x10F0
	Size: 0xCC
	Parameters: 2
	Flags: Private
*/
function private start_timer(n_timeout, str_return)
{
	if(!level.var_f995ece6 zm_trial_timer::is_open(self))
	{
		level.var_f995ece6 zm_trial_timer::open(self);
		level.var_f995ece6 zm_trial_timer::function_8ede8e82(self, str_return);
		level.var_f995ece6 zm_trial_timer::function_6ad54036(self, 1);
		self namespace_b22c99a5::start_timer(n_timeout);
		self playsoundtoplayer(#"hash_18aab7ffde259877", self);
	}
}

/*
	Name: stop_timer
	Namespace: namespace_ca28d1aa
	Checksum: 0x893AF4A0
	Offset: 0x11C8
	Size: 0x5C
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
}

/*
	Name: function_2191cc5d
	Namespace: namespace_ca28d1aa
	Checksum: 0x48256F8D
	Offset: 0x1230
	Size: 0x74
	Parameters: 0
	Flags: Private
*/
function private function_2191cc5d()
{
	zone = self zm_zonemgr::get_player_zone();
	/#
		assert(isdefined(level.var_c8b84806));
	#/
	return isdefined(zone) && is_true(level.var_c8b84806[zone]);
}

/*
	Name: zone_watcher
	Namespace: namespace_ca28d1aa
	Checksum: 0xE25EB9B4
	Offset: 0x12B0
	Size: 0x2F6
	Parameters: 4
	Flags: Private
*/
function private zone_watcher(challenge, var_2d5ebf67, var_530e040f, timeout)
{
	self endon(#"disconnect");
	level endon(#"hash_7646638df88a3656", #"hash_29877ed061231191", #"host_migration_begin");
	self.var_356935bb = {#hash_530e040f:var_530e040f, #hash_2d5ebf67:var_2d5ebf67, #challenge:challenge, #timeout:timeout, #start_time:level.time};
	self.var_4cb0b91f = 0;
	self zm_utility::function_ba39d198(challenge.var_df62490a, 1);
	self thread start_timer(timeout, var_2d5ebf67);
	var_60fa6139 = level.time + (timeout * 1000);
	while(true)
	{
		var_a5096cb5 = self function_2191cc5d();
		if(var_a5096cb5)
		{
			self.var_4cb0b91f = 1;
			self stop_timer();
			self zm_utility::function_ba39d198(challenge.var_df62490a, 0);
			var_60fa6139 = level.time + 0;
		}
		else
		{
			if(level.time > var_60fa6139)
			{
				self stop_timer();
			}
			else if(!level.var_f995ece6 zm_trial_timer::is_open(self))
			{
				self thread start_timer(0, var_530e040f);
				self zm_utility::function_ba39d198(challenge.var_df62490a, 1);
			}
		}
		if(is_true(self.var_4cb0b91f) && !var_a5096cb5 && isalive(self) && !self laststand::player_is_in_laststand() && !is_true(level.intermission))
		{
			self clientfield::set_to_player("zm_zone_out_of_bounds", 1);
		}
		else
		{
			self clientfield::set_to_player("zm_zone_out_of_bounds", 0);
		}
		waitframe(1);
	}
}

/*
	Name: damage_watcher
	Namespace: namespace_ca28d1aa
	Checksum: 0x503C8471
	Offset: 0x15B0
	Size: 0x20E
	Parameters: 0
	Flags: Private
*/
function private damage_watcher()
{
	self endon(#"disconnect");
	level endon(#"hash_7646638df88a3656", #"hash_29877ed061231191", #"host_migration_begin");
	while(true)
	{
		/#
			if(isgodmode(self) || self isinmovemode("", ""))
			{
				waitframe(1);
				continue;
			}
		#/
		if(!self function_2191cc5d() && !level.var_f995ece6 zm_trial_timer::is_open(self) && self.sessionstate != "spectator" && !self laststand::player_is_in_laststand() && !is_true(self.var_eb319d10) && !is_true(level.intermission))
		{
			var_16e6b8ea = self zm_utility::function_7618c8ef(0.0667);
			if(self.health <= var_16e6b8ea)
			{
				if(zm_utility::is_magic_bullet_shield_enabled(self))
				{
					self util::stop_magic_bullet_shield();
				}
				self dodamage(self.health + 1000, self.origin);
			}
			else
			{
				self dodamage(var_16e6b8ea, self.origin);
			}
		}
		wait(1);
	}
}

/*
	Name: function_c30f9a6e
	Namespace: namespace_ca28d1aa
	Checksum: 0xE67FB8CB
	Offset: 0x17C8
	Size: 0x212
	Parameters: 2
	Flags: None
*/
function function_c30f9a6e(v_start_pos, n_radius)
{
	if(!isdefined(n_radius))
	{
		n_radius = 500;
	}
	var_5579e5fa = [];
	v_origin = getclosestpointonnavmesh(v_start_pos, n_radius);
	if(isdefined(v_origin))
	{
		s_result = positionquery_source_navigation(v_origin, 32, n_radius, 4, 16, 1, 32);
		if(isdefined(s_result) && isarray(s_result.data))
		{
			foreach(var_c310df8c in s_result.data)
			{
				if(zm_utility::function_25e3484e(var_c310df8c.origin, 24, var_5579e5fa))
				{
					var_7a4cb7eb = var_c310df8c.origin;
					n_height_diff = abs(var_7a4cb7eb[2] - var_c310df8c.origin[2]);
					if(n_height_diff > 60)
					{
						continue;
					}
					if(!isdefined(var_5579e5fa))
					{
						var_5579e5fa = [];
					}
					else if(!isarray(var_5579e5fa))
					{
						var_5579e5fa = array(var_5579e5fa);
					}
					var_5579e5fa[var_5579e5fa.size] = var_7a4cb7eb;
				}
			}
			var_5579e5fa = arraysortclosest(var_5579e5fa, v_start_pos);
		}
	}
	return var_5579e5fa;
}

/*
	Name: function_ff66b979
	Namespace: namespace_ca28d1aa
	Checksum: 0x1321F55B
	Offset: 0x19E8
	Size: 0x240
	Parameters: 0
	Flags: Private
*/
function private function_ff66b979()
{
	level endon(#"end_of_round");
	foreach(player in getplayers())
	{
		if(!isdefined(player.var_356935bb))
		{
			continue;
		}
		player stop_timer();
	}
	var_a0328dd5 = gettime();
	wait(5);
	foreach(player in getplayers())
	{
		if(!isdefined(player.var_356935bb))
		{
			player thread damage_watcher();
			continue;
		}
		var_d1659cdf = var_a0328dd5 - player.var_356935bb.start_time;
		timeout = int(max(player.var_356935bb.timeout - (float(var_d1659cdf) / 1000), 0));
		player thread zone_watcher(player.var_356935bb.challenge, player.var_356935bb.var_2d5ebf67, player.var_356935bb.var_530e040f, timeout);
		player thread damage_watcher();
	}
}

