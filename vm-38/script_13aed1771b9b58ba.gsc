#using script_3f9e0dc8454d98e1;
#using script_72401f526ba71638;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace namespace_ce9594c1;

/*
	Name: function_4fda6e35
	Namespace: namespace_ce9594c1
	Checksum: 0xCA6C7704
	Offset: 0x150
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_4fda6e35()
{
	level notify(107616768);
}

/*
	Name: function_89f2df9
	Namespace: namespace_ce9594c1
	Checksum: 0xDCA80CDE
	Offset: 0x170
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_49946b57ce6e712f", &function_70a657d8, undefined, undefined, #"hash_13a43d760497b54d");
}

/*
	Name: function_70a657d8
	Namespace: namespace_ce9594c1
	Checksum: 0x51388CD7
	Offset: 0x1C0
	Size: 0x300
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("allplayers", "fx_frenzied_guard_player_clientfield", 9000, 1, "int");
	clientfield::register("actor", "fx_frenzied_guard_actor_clientfield", 9000, 1, "int");
	namespace_1b527536::function_36e0540e(#"hash_55569355da0f0f68", 1, 60, #"hash_276a89fd0875409a");
	namespace_1b527536::function_36e0540e(#"hash_43e326396554e18c", 1, 60, #"hash_32d3740bf1d93fe");
	namespace_1b527536::function_36e0540e(#"hash_43e329396554e6a5", 1, 60, #"hash_56f5e5578534069b");
	namespace_1b527536::function_36e0540e(#"hash_43e328396554e4f2", 1, 60, #"hash_45a15df330b74adc");
	namespace_1b527536::function_36e0540e(#"hash_43e323396554dc73", 1, 60, #"hash_5addc54d5927cc29");
	namespace_1b527536::function_36e0540e(#"hash_43e322396554dac0", 1, 60, #"hash_7fecb687adf7f042");
	namespace_1b527536::function_dbd391bf(#"hash_55569355da0f0f68", &function_d798ebd7);
	namespace_1b527536::function_dbd391bf(#"hash_43e326396554e18c", &function_fd0036a5);
	namespace_1b527536::function_dbd391bf(#"hash_43e329396554e6a5", &function_f03b1d1b);
	namespace_1b527536::function_dbd391bf(#"hash_43e328396554e4f2", &function_1eacf9fe);
	namespace_1b527536::function_dbd391bf(#"hash_43e323396554dc73", &function_b1f02082);
	namespace_1b527536::function_dbd391bf(#"hash_43e322396554dac0", &function_a93e0f1e);
	callback::on_ai_killed(&function_7995eedf);
	level.var_54c1ba2b = [];
}

/*
	Name: function_c0dc7220
	Namespace: namespace_ce9594c1
	Checksum: 0x95CBB471
	Offset: 0x4C8
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_c0dc7220()
{
	self.armor = self.maxarmor;
	self playsoundtoplayer(#"hash_493d4d80ba4199c5", self);
}

/*
	Name: set_target
	Namespace: namespace_ce9594c1
	Checksum: 0x84C5C1EA
	Offset: 0x508
	Size: 0x16
	Parameters: 1
	Flags: None
*/
function set_target(zombie)
{
	zombie.enemy_override = self;
}

/*
	Name: function_95558618
	Namespace: namespace_ce9594c1
	Checksum: 0x953AC318
	Offset: 0x528
	Size: 0x2B8
	Parameters: 0
	Flags: Linked
*/
function function_95558618()
{
	self notify("ec0e4c58b47ccc0");
	self endon("ec0e4c58b47ccc0");
	self endon(#"death");
	while(true)
	{
		var_54c1ba2b = function_72d3bca6(level.var_54c1ba2b, self.origin, undefined, undefined, 2000);
		var_4eb7eef2 = 0;
		foreach(player in var_54c1ba2b)
		{
			if(isdefined(player.var_fa7c46f))
			{
				if(distancesquared(player.origin, self.origin) <= sqr(player.var_fa7c46f))
				{
					var_4eb7eef2 = 1;
					break;
				}
			}
		}
		if(!is_true(var_4eb7eef2))
		{
			self.var_8a3828c6 = undefined;
			if(is_true(self.var_4439c2d9))
			{
				self.var_4439c2d9 = undefined;
				self clientfield::set("fx_frenzied_guard_actor_clientfield", 0);
				self zombie_utility::set_zombie_run_cycle_restore_from_override();
				if(zm_utility::is_survival() && isdefined(level.var_9602c8b2))
				{
					self [[level.var_9602c8b2]]();
				}
			}
		}
		if(isarray(level.var_54c1ba2b))
		{
			if(level.var_54c1ba2b.size <= 0)
			{
				if(is_true(self.var_4439c2d9))
				{
					self.var_4439c2d9 = undefined;
					self clientfield::set("fx_frenzied_guard_actor_clientfield", 0);
					self zombie_utility::set_zombie_run_cycle_restore_from_override();
					if(zm_utility::is_survival() && isdefined(level.var_9602c8b2))
					{
						self [[level.var_9602c8b2]]();
					}
				}
				return;
			}
		}
		wait(1);
	}
}

/*
	Name: function_c94af02b
	Namespace: namespace_ce9594c1
	Checksum: 0x8A5C7FCD
	Offset: 0x7E8
	Size: 0x9E
	Parameters: 0
	Flags: Linked
*/
function function_c94af02b()
{
	self clientfield::set("fx_frenzied_guard_player_clientfield", 0);
	self flag::decrement("zm_field_upgrade_in_use");
	arrayremovevalue(level.var_54c1ba2b, self);
	arrayremovevalue(level.var_54c1ba2b, undefined);
	self.var_fa7c46f = undefined;
	self.var_5202bab4 = undefined;
	self.var_96971e3c = undefined;
}

/*
	Name: function_6f97b981
	Namespace: namespace_ce9594c1
	Checksum: 0xB4FA9676
	Offset: 0x890
	Size: 0x234
	Parameters: 3
	Flags: Linked
*/
function function_6f97b981(tier, radius, duration)
{
	if(!isdefined(tier))
	{
		tier = 0;
	}
	if(!isdefined(radius))
	{
		radius = 1000;
	}
	if(!isdefined(duration))
	{
		duration = 10;
	}
	self endon(#"disconnect");
	count = 0;
	self flag::increment("zm_field_upgrade_in_use");
	while(count < duration)
	{
		if(!isalive(self))
		{
			break;
		}
		var_6c77565b = getentitiesinradius(self.origin, radius, 15);
		foreach(zombie in var_6c77565b)
		{
			if(isalive(zombie) && zombie.team === level.zombie_team)
			{
				zombie.var_8a3828c6 = self;
				zombie thread function_95558618();
				if(tier >= 5)
				{
					if(!is_true(zombie.var_4439c2d9))
					{
						zombie.var_4439c2d9 = 1;
						zombie clientfield::set("fx_frenzied_guard_actor_clientfield", 1);
						zombie zombie_utility::set_zombie_run_cycle_override_value("walk");
					}
				}
			}
		}
		wait(1);
		count++;
	}
	self function_c94af02b();
}

/*
	Name: function_feb87e34
	Namespace: namespace_ce9594c1
	Checksum: 0xD62C0101
	Offset: 0xAD0
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_feb87e34()
{
	self clientfield::set("fx_frenzied_guard_player_clientfield", 1);
}

/*
	Name: function_d798ebd7
	Namespace: namespace_ce9594c1
	Checksum: 0x8175A35C
	Offset: 0xB00
	Size: 0x104
	Parameters: 1
	Flags: Linked
*/
function function_d798ebd7(params)
{
	self namespace_1b527536::function_460882e2(1);
	self function_feb87e34();
	if(!isdefined(level.var_54c1ba2b))
	{
		level.var_54c1ba2b = [];
	}
	else if(!isarray(level.var_54c1ba2b))
	{
		level.var_54c1ba2b = array(level.var_54c1ba2b);
	}
	if(!isinarray(level.var_54c1ba2b, self))
	{
		level.var_54c1ba2b[level.var_54c1ba2b.size] = self;
	}
	self.var_fa7c46f = 1000;
	self thread function_6f97b981(0, 1000);
}

/*
	Name: function_fd0036a5
	Namespace: namespace_ce9594c1
	Checksum: 0xCB1AC5D5
	Offset: 0xC10
	Size: 0x11C
	Parameters: 1
	Flags: Linked
*/
function function_fd0036a5(params)
{
	self namespace_1b527536::function_460882e2(1);
	self function_feb87e34();
	self function_c0dc7220();
	if(!isdefined(level.var_54c1ba2b))
	{
		level.var_54c1ba2b = [];
	}
	else if(!isarray(level.var_54c1ba2b))
	{
		level.var_54c1ba2b = array(level.var_54c1ba2b);
	}
	if(!isinarray(level.var_54c1ba2b, self))
	{
		level.var_54c1ba2b[level.var_54c1ba2b.size] = self;
	}
	self.var_fa7c46f = 1000;
	self thread function_6f97b981(1, 1000);
}

/*
	Name: function_f03b1d1b
	Namespace: namespace_ce9594c1
	Checksum: 0x6997C8CD
	Offset: 0xD38
	Size: 0x124
	Parameters: 1
	Flags: Linked
*/
function function_f03b1d1b(params)
{
	self namespace_1b527536::function_460882e2(1);
	self function_feb87e34();
	self function_c0dc7220();
	if(!isdefined(level.var_54c1ba2b))
	{
		level.var_54c1ba2b = [];
	}
	else if(!isarray(level.var_54c1ba2b))
	{
		level.var_54c1ba2b = array(level.var_54c1ba2b);
	}
	if(!isinarray(level.var_54c1ba2b, self))
	{
		level.var_54c1ba2b[level.var_54c1ba2b.size] = self;
	}
	self.var_fa7c46f = 1000;
	self.var_5202bab4 = 1;
	self thread function_6f97b981(2, 1000);
}

/*
	Name: function_1eacf9fe
	Namespace: namespace_ce9594c1
	Checksum: 0xBC2EE954
	Offset: 0xE68
	Size: 0x134
	Parameters: 1
	Flags: Linked
*/
function function_1eacf9fe(params)
{
	self namespace_1b527536::function_460882e2(1);
	self function_feb87e34();
	self function_c0dc7220();
	if(!isdefined(level.var_54c1ba2b))
	{
		level.var_54c1ba2b = [];
	}
	else if(!isarray(level.var_54c1ba2b))
	{
		level.var_54c1ba2b = array(level.var_54c1ba2b);
	}
	if(!isinarray(level.var_54c1ba2b, self))
	{
		level.var_54c1ba2b[level.var_54c1ba2b.size] = self;
	}
	self.var_fa7c46f = 1000;
	self.var_5202bab4 = 1;
	self.var_96971e3c = 1;
	self thread function_6f97b981(3, 1000);
}

/*
	Name: function_b1f02082
	Namespace: namespace_ce9594c1
	Checksum: 0xC4388775
	Offset: 0xFA8
	Size: 0x134
	Parameters: 1
	Flags: Linked
*/
function function_b1f02082(params)
{
	self namespace_1b527536::function_460882e2(1);
	self function_feb87e34();
	self function_c0dc7220();
	if(!isdefined(level.var_54c1ba2b))
	{
		level.var_54c1ba2b = [];
	}
	else if(!isarray(level.var_54c1ba2b))
	{
		level.var_54c1ba2b = array(level.var_54c1ba2b);
	}
	if(!isinarray(level.var_54c1ba2b, self))
	{
		level.var_54c1ba2b[level.var_54c1ba2b.size] = self;
	}
	self.var_fa7c46f = 2000;
	self.var_5202bab4 = 1;
	self.var_96971e3c = 1;
	self thread function_6f97b981(4, 2000, 15);
}

/*
	Name: function_a93e0f1e
	Namespace: namespace_ce9594c1
	Checksum: 0x3FCFC1C1
	Offset: 0x10E8
	Size: 0x134
	Parameters: 1
	Flags: Linked
*/
function function_a93e0f1e(params)
{
	self namespace_1b527536::function_460882e2(1);
	self function_feb87e34();
	self function_c0dc7220();
	if(!isdefined(level.var_54c1ba2b))
	{
		level.var_54c1ba2b = [];
	}
	else if(!isarray(level.var_54c1ba2b))
	{
		level.var_54c1ba2b = array(level.var_54c1ba2b);
	}
	if(!isinarray(level.var_54c1ba2b, self))
	{
		level.var_54c1ba2b[level.var_54c1ba2b.size] = self;
	}
	self.var_fa7c46f = 2000;
	self.var_5202bab4 = 1;
	self.var_96971e3c = 1;
	self thread function_6f97b981(5, 2000, 15);
}

/*
	Name: function_1072c231
	Namespace: namespace_ce9594c1
	Checksum: 0x410DA9C5
	Offset: 0x1228
	Size: 0x46
	Parameters: 0
	Flags: Linked, Private
*/
function private function_1072c231()
{
	if((isdefined(self.maxarmor) ? self.maxarmor : 0) == 0)
	{
		return true;
	}
	if(self.armor < self.maxarmor)
	{
		return false;
	}
	return true;
}

/*
	Name: function_d87329b7
	Namespace: namespace_ce9594c1
	Checksum: 0x6B04024A
	Offset: 0x1278
	Size: 0x2C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_d87329b7()
{
	if((isdefined(self.maxarmor) ? self.maxarmor : 0) == 0)
	{
		return false;
	}
	return true;
}

/*
	Name: function_7995eedf
	Namespace: namespace_ce9594c1
	Checksum: 0xB44FCABB
	Offset: 0x12B0
	Size: 0x134
	Parameters: 1
	Flags: Linked
*/
function function_7995eedf(s_params)
{
	if(isplayer(s_params.eattacker))
	{
		player = s_params.eattacker;
		if(is_true(player.var_5202bab4) && !is_true(self.var_6e9934ba))
		{
			if(!player function_1072c231() && player function_d87329b7())
			{
				var_2cacdde7 = 0.1 * player.maxarmor;
				var_2cacdde7 = int(var_2cacdde7);
				player.armor = player.armor + math::clamp(var_2cacdde7, 0, player.maxarmor);
				player playsoundtoplayer(#"hash_271353dc9677cad3", player);
			}
		}
	}
}

