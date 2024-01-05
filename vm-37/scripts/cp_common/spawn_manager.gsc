#using script_2c9bc8b876b81af8;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace spawn_manager;

/*
	Name: __init__system__
	Namespace: spawn_manager
	Checksum: 0x466C6452
	Offset: 0x1B8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"spawn_manager", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: spawn_manager
	Checksum: 0x185E531F
	Offset: 0x200
	Size: 0xE4
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	level.spawn_manager_total_count = 0;
	level.spawn_manager_max_ai = 50;
	level.spawn_manager_active_ai = 0;
	level.spawn_manager_auto_targetname_num = 0;
	level.spawn_managers = [];
	level.spawn_managers = getentarray("spawn_manager", "classname");
	array::thread_all(level.spawn_managers, &spawn_manager_think);
	start_triggers();
	/#
		callback::on_connect(&on_player_connect);
		level thread spawn_manager_debug();
	#/
}

/*
	Name: spawn_manager_setup
	Namespace: spawn_manager
	Checksum: 0xCEE9DB3B
	Offset: 0x2F0
	Size: 0x1C2
	Parameters: 0
	Flags: None
*/
function spawn_manager_setup()
{
	/#
		assert(isdefined(self));
	#/
	/#
		assert(isdefined(self.target));
	#/
	/#
		assert(self.sm_group_size_max >= self.sm_group_size_min, "" + self.sm_id);
	#/
	if(!isdefined(self.sm_spawner_count_min) || self.sm_spawner_count_min > self.allspawners.size)
	{
		self.sm_spawner_count_min = self.allspawners.size;
	}
	if(!isdefined(self.sm_spawner_count_max) || self.sm_spawner_count_max > self.allspawners.size)
	{
		self.sm_spawner_count_max = self.allspawners.size;
	}
	/#
		assert(self.sm_spawner_count_max >= self.sm_spawner_count_min, "" + self.sm_id);
	#/
	self.sm_spawner_count = randomintrange(self.sm_spawner_count_min, self.sm_spawner_count_max + 1);
	self.spawners = self spawn_manager_get_spawners();
	update_for_coop();
	/#
		assert(self.sm_group_size_min <= self.sm_active_count_max, "");
	#/
	if(!isdefined(self.script_forcespawn))
	{
		self.script_forcespawn = 0;
	}
}

/*
	Name: spawn_manager_can_spawn
	Namespace: spawn_manager
	Checksum: 0xA55634E7
	Offset: 0x4C0
	Size: 0x16C
	Parameters: 1
	Flags: None
*/
function spawn_manager_can_spawn(spawngroupsize)
{
	totalfree = (self.count >= 0 ? self.count : level.spawn_manager_max_ai);
	activefree = self.sm_active_count_max - self.activeai.size;
	canspawngroup = activefree >= spawngroupsize && totalfree >= spawngroupsize && spawngroupsize > 0;
	globalfree = level.spawn_manager_max_ai - level.spawn_manager_active_ai;
	/#
		assert(self.enable == (level flag::get(("" + self.sm_id) + "")), "");
	#/
	if(self.script_forcespawn == 0)
	{
		return totalfree > 0 && activefree > 0 && globalfree > 0 && canspawngroup && self.enable;
	}
	return totalfree > 0 && activefree > 0 && self.enable;
}

/*
	Name: spawn_manager_spawn
	Namespace: spawn_manager
	Checksum: 0x2E5DDA65
	Offset: 0x638
	Size: 0x8C
	Parameters: 1
	Flags: None
*/
function spawn_manager_spawn(maxdelay)
{
	self endon(#"death");
	start = gettime();
	while(true)
	{
		ai = self spawner::spawn();
		if(isdefined(ai) || (gettime() - start) > (1000 * maxdelay))
		{
			return ai;
		}
		wait(0.5);
	}
}

/*
	Name: spawn_manager_spawn_group
	Namespace: spawn_manager
	Checksum: 0xAC3B8F9F
	Offset: 0x6D0
	Size: 0x104
	Parameters: 2
	Flags: None
*/
function spawn_manager_spawn_group(spawner, spawngroupsize)
{
	for(i = 0; i < spawngroupsize; i++)
	{
		ai = undefined;
		if(isdefined(spawner) && isdefined(spawner.targetname))
		{
			ai = spawner spawn_manager_spawn(2);
			if(isdefined(ai))
			{
				ai.sm_id = self.sm_id;
			}
		}
		else
		{
			continue;
		}
		if(!spawner::spawn_failed(ai))
		{
			if(isdefined(self.script_radius))
			{
				ai.script_radius = self.script_radius;
			}
			if(isdefined(spawner.script_radius))
			{
				ai.script_radius = spawner.script_radius;
			}
			ai thread spawn_accounting(spawner, self);
		}
	}
}

/*
	Name: spawn_accounting
	Namespace: spawn_manager
	Checksum: 0xCDDF0F43
	Offset: 0x7E0
	Size: 0x130
	Parameters: 2
	Flags: None
*/
function spawn_accounting(spawner, manager)
{
	targetname = manager.targetname;
	classname = spawner.classname;
	level.spawn_manager_total_count++;
	manager.spawncount++;
	if(manager.count > 0)
	{
		manager.count--;
	}
	level.spawn_manager_active_ai++;
	origin = spawner.origin;
	manager.activeai[manager.activeai.size] = self;
	spawner.activeai[spawner.activeai.size] = self;
	self waittill(#"death");
	if(isdefined(spawner))
	{
		arrayremovevalue(spawner.activeai, self);
	}
	if(isdefined(manager))
	{
		arrayremovevalue(manager.activeai, self);
	}
	level.spawn_manager_active_ai--;
}

/*
	Name: set_defaults
	Namespace: spawn_manager
	Checksum: 0x248E5F9E
	Offset: 0x918
	Size: 0x196
	Parameters: 0
	Flags: None
*/
function set_defaults()
{
	if(isdefined(self.name))
	{
		/#
			check_name(self.name);
		#/
		self.sm_id = self.name;
	}
	else
	{
		if(isdefined(self.targetname) && !strstartswith(self.targetname, "pf"))
		{
			/#
				check_name(self.targetname);
			#/
			self.sm_id = self.targetname;
		}
		else
		{
			auto_id();
		}
	}
	if(!isdefined(self.sm_count_1player))
	{
		self.sm_count_1player = self.count;
	}
	if(!isdefined(self.sm_active_count_min_1player))
	{
		self.sm_active_count_min_1player = (isdefined(self.sm_active_count_min) ? self.sm_active_count_min : level.spawn_manager_max_ai);
	}
	if(!isdefined(self.sm_active_count_max_1player))
	{
		self.sm_active_count_max_1player = (isdefined(self.sm_active_count_max) ? self.sm_active_count_max : level.spawn_manager_max_ai);
	}
	if(!isdefined(self.sm_group_size_min_1player))
	{
		self.sm_group_size_min_1player = (isdefined(self.sm_group_size_min) ? self.sm_group_size_min : 1);
	}
	if(!isdefined(self.sm_group_size_max_1player))
	{
		self.sm_group_size_max_1player = (isdefined(self.sm_group_size_max) ? self.sm_group_size_max : 1);
	}
}

/*
	Name: check_name
	Namespace: spawn_manager
	Checksum: 0xB308C1C2
	Offset: 0xAB8
	Size: 0x128
	Parameters: 1
	Flags: None
*/
function check_name(str_name)
{
	/#
		a_spawn_managers = getentarray("", "");
		foreach(sm in a_spawn_managers)
		{
			if(sm != self)
			{
				if(sm.targetname === str_name || sm.name === str_name)
				{
					/#
						assertmsg((((("" + str_name) + "") + self.origin) + "") + sm.origin);
					#/
				}
			}
		}
	#/
}

/*
	Name: auto_id
	Namespace: spawn_manager
	Checksum: 0xAE6EA143
	Offset: 0xBE8
	Size: 0x44
	Parameters: 0
	Flags: None
*/
function auto_id()
{
	if(!isdefined(level.sm_auto_id))
	{
		level.sm_auto_id = 0;
	}
	self.sm_id = "sm_auto" + level.sm_auto_id;
	level.sm_auto_id++;
}

/*
	Name: update_count_for_coop
	Namespace: spawn_manager
	Checksum: 0x5DF75BD1
	Offset: 0xC38
	Size: 0xDE
	Parameters: 0
	Flags: None
*/
function update_count_for_coop()
{
	if(level.players.size >= 4 && isdefined(self.sm_count_4player))
	{
		n_count = self.sm_count_4player;
	}
	else
	{
		if(level.players.size >= 3 && isdefined(self.sm_count_3player))
		{
			n_count = self.sm_count_3player;
		}
		else
		{
			if(level.players.size >= 2 && isdefined(self.sm_count_2player))
			{
				n_count = self.sm_count_2player;
			}
			else
			{
				n_count = self.sm_count_1player;
			}
		}
	}
	if(n_count > 0)
	{
		self.count = n_count;
	}
	else
	{
		self.count = -1;
	}
}

/*
	Name: update_active_count_min_for_coop
	Namespace: spawn_manager
	Checksum: 0x9C6CB305
	Offset: 0xD20
	Size: 0xBE
	Parameters: 0
	Flags: None
*/
function update_active_count_min_for_coop()
{
	if(level.players.size >= 4 && isdefined(self.sm_active_count_min_4player))
	{
		self.sm_active_count_min = self.sm_active_count_min_4player;
	}
	else
	{
		if(level.players.size >= 3 && isdefined(self.sm_active_count_min_3player))
		{
			self.sm_active_count_min = self.sm_active_count_min_3player;
		}
		else
		{
			if(level.players.size >= 2 && isdefined(self.sm_active_count_min_2player))
			{
				self.sm_active_count_min = self.sm_active_count_min_2player;
			}
			else
			{
				self.sm_active_count_min = self.sm_active_count_min_1player;
			}
		}
	}
}

/*
	Name: update_active_count_max_for_coop
	Namespace: spawn_manager
	Checksum: 0x1A26ADD3
	Offset: 0xDE8
	Size: 0xBE
	Parameters: 0
	Flags: None
*/
function update_active_count_max_for_coop()
{
	if(level.players.size >= 4 && isdefined(self.sm_active_count_max_4player))
	{
		self.sm_active_count_max = self.sm_active_count_max_4player;
	}
	else
	{
		if(level.players.size >= 3 && isdefined(self.sm_active_count_max_3player))
		{
			self.sm_active_count_max = self.sm_active_count_max_3player;
		}
		else
		{
			if(level.players.size >= 2 && isdefined(self.sm_active_count_max_2player))
			{
				self.sm_active_count_max = self.sm_active_count_max_2player;
			}
			else
			{
				self.sm_active_count_max = self.sm_active_count_max_1player;
			}
		}
	}
}

/*
	Name: update_group_size_min_for_coop
	Namespace: spawn_manager
	Checksum: 0x5114AC78
	Offset: 0xEB0
	Size: 0xBE
	Parameters: 0
	Flags: None
*/
function update_group_size_min_for_coop()
{
	if(level.players.size >= 4 && isdefined(self.sm_group_size_min_4player))
	{
		self.sm_group_size_min = self.sm_group_size_min_4player;
	}
	else
	{
		if(level.players.size >= 3 && isdefined(self.sm_group_size_min_3player))
		{
			self.sm_group_size_min = self.sm_group_size_min_3player;
		}
		else
		{
			if(level.players.size >= 2 && isdefined(self.sm_group_size_min_2player))
			{
				self.sm_group_size_min = self.sm_group_size_min_2player;
			}
			else
			{
				self.sm_group_size_min = self.sm_group_size_min_1player;
			}
		}
	}
}

/*
	Name: update_group_size_max_for_coop
	Namespace: spawn_manager
	Checksum: 0x96DB0461
	Offset: 0xF78
	Size: 0xBE
	Parameters: 0
	Flags: None
*/
function update_group_size_max_for_coop()
{
	if(level.players.size >= 4 && isdefined(self.sm_group_size_max_4player))
	{
		self.sm_group_size_max = self.sm_group_size_max_4player;
	}
	else
	{
		if(level.players.size >= 3 && isdefined(self.sm_group_size_max_3player))
		{
			self.sm_group_size_max = self.sm_group_size_max_3player;
		}
		else
		{
			if(level.players.size >= 2 && isdefined(self.sm_group_size_max_2player))
			{
				self.sm_group_size_max = self.sm_group_size_max_2player;
			}
			else
			{
				self.sm_group_size_max = self.sm_group_size_max_1player;
			}
		}
	}
}

/*
	Name: update_for_coop
	Namespace: spawn_manager
	Checksum: 0x19726C25
	Offset: 0x1040
	Size: 0x108
	Parameters: 0
	Flags: None
*/
function update_for_coop()
{
	update_count_for_coop();
	update_active_count_min_for_coop();
	update_active_count_max_for_coop();
	update_group_size_min_for_coop();
	update_group_size_max_for_coop();
	foreach(sp in self.spawners)
	{
		sp update_count_for_coop();
		sp update_active_count_min_for_coop();
		sp update_active_count_max_for_coop();
	}
}

/*
	Name: spawn_manager_wave_wait
	Namespace: spawn_manager
	Checksum: 0xEEF39AB7
	Offset: 0x1150
	Size: 0x94
	Parameters: 0
	Flags: None
*/
function spawn_manager_wave_wait()
{
	if(!isdefined(self.sm_wave_wait_min))
	{
		self.sm_wave_wait_min = 0;
	}
	if(!isdefined(self.sm_wave_wait_max))
	{
		self.sm_wave_wait_max = 0;
	}
	if(self.sm_wave_wait_max > 0 && self.sm_wave_wait_max > self.sm_wave_wait_min)
	{
		wait(randomfloatrange(self.sm_wave_wait_min, self.sm_wave_wait_max));
	}
	else if(self.sm_wave_wait_min > 0)
	{
		wait(self.sm_wave_wait_min);
	}
}

/*
	Name: spawn_manager_think
	Namespace: spawn_manager
	Checksum: 0xC1AC796
	Offset: 0x11F0
	Size: 0x704
	Parameters: 0
	Flags: None
*/
function spawn_manager_think()
{
	self endon(#"death");
	self set_defaults();
	self spawn_manager_flags_setup();
	self thread spawn_manager_enable_think();
	self thread spawn_manager_kill_think();
	self.enable = 0;
	self.activeai = [];
	self.spawncount = 0;
	isfirsttime = 1;
	self.allspawners = getentarray(self.target, "targetname");
	/#
		assert(self.allspawners.size, ("" + self.sm_id) + "");
	#/
	level flag::wait_till(("sm_" + self.sm_id) + "_enabled");
	util::script_delay();
	self spawn_manager_setup();
	b_spawn_up = 1;
	self spawn_manager_get_spawn_group_size();
	while(self.count != 0 && self.spawners.size > 0)
	{
		cleanup_spawners();
		n_active = self.activeai.size;
		n_active_budget = self.sm_active_count_max - n_active;
		if(!b_spawn_up && self.activeai.size <= self.sm_active_count_min)
		{
			b_spawn_up = 1;
			spawn_manager_wave_wait();
		}
		else if(b_spawn_up && n_active_budget < self.sm_group_size)
		{
			b_spawn_up = 0;
		}
		if(!b_spawn_up)
		{
			waitframe(1);
			continue;
		}
		self spawn_manager_get_spawn_group_size();
		if(self.count > 0)
		{
			if(self.sm_group_size > self.count)
			{
				self.sm_group_size = self.count;
			}
		}
		spawned = 0;
		while(!spawned)
		{
			cleanup_spawners();
			if(self.spawners.size <= 0)
			{
				break;
			}
			if(self spawn_manager_can_spawn(self.sm_group_size))
			{
				/#
					assert(self.sm_group_size > 0);
				#/
				potential_spawners = [];
				priority_spawners = [];
				for(i = 0; i < self.spawners.size; i++)
				{
					current_spawner = self.spawners[i];
					if(isdefined(current_spawner))
					{
						if(current_spawner.activeai.size > current_spawner.sm_active_count_min)
						{
							continue;
						}
						if(!function_42a4d0d8(current_spawner))
						{
							continue;
						}
						spawnerfree = current_spawner.sm_active_count_max - current_spawner.activeai.size;
						if(spawnerfree >= self.sm_group_size)
						{
							if(isdefined(current_spawner.spawnflags) && (current_spawner.spawnflags & 32) == 32)
							{
								priority_spawners[priority_spawners.size] = current_spawner;
								continue;
							}
							potential_spawners[potential_spawners.size] = current_spawner;
						}
					}
				}
				if(potential_spawners.size > 0 || priority_spawners.size > 0)
				{
					if(priority_spawners.size > 0)
					{
						spawner = array::random(priority_spawners);
					}
					else
					{
						spawner = array::random(potential_spawners);
					}
					if(!(isdefined(spawner.spawnflags) && (spawner.spawnflags & 64) == 64) && spawner.count < self.sm_group_size)
					{
						self.sm_group_size = spawner.count;
					}
					if(!isfirsttime)
					{
						spawn_manager_wait();
					}
					else
					{
						isfirsttime = 0;
					}
					if(!self.enable)
					{
						continue;
					}
					self spawn_manager_spawn_group(spawner, self.sm_group_size);
					spawned = 1;
				}
				else
				{
					spawner_max_active_count = 0;
					for(i = 0; i < self.spawners.size; i++)
					{
						current_spawner = self.spawners[i];
						if(isdefined(current_spawner))
						{
							if(current_spawner.sm_active_count_max > spawner_max_active_count)
							{
								spawner_max_active_count = current_spawner.sm_active_count_max;
							}
						}
					}
					if(spawner_max_active_count < self.sm_group_size_max)
					{
						self.sm_group_size_max = spawner_max_active_count;
						self spawn_manager_get_spawn_group_size();
					}
				}
			}
			waitframe(1);
		}
		waitframe(1);
		/#
			assert(!level flag::get(("" + self.sm_id) + ""), "");
		#/
		/#
			assert(!level flag::get(("" + self.sm_id) + ""), "");
		#/
	}
	self spawn_manager_flag_complete();
	if(isdefined(self.activeai) && self.activeai.size != 0)
	{
		array::wait_till(self.activeai, "death");
	}
	function_257e48e2();
	self delete();
}

/*
	Name: spawn_manager_enable_think
	Namespace: spawn_manager
	Checksum: 0x809AEC9A
	Offset: 0x1900
	Size: 0x94
	Parameters: 0
	Flags: None
*/
function spawn_manager_enable_think()
{
	self endon(#"death");
	while(isdefined(self))
	{
		self waittill(#"enable");
		self.enable = 1;
		self spawn_manager_flag_enabled();
		self waittill(#"disable");
		self spawn_manager_flag_disabled();
	}
	self spawn_manager_flag_disabled();
}

/*
	Name: spawn_manager_enable_trigger_think
	Namespace: spawn_manager
	Checksum: 0x59E7F2AB
	Offset: 0x19A0
	Size: 0x70
	Parameters: 1
	Flags: None
*/
function spawn_manager_enable_trigger_think(spawn_manager)
{
	spawn_manager endon(#"death", #"enable");
	self endon(#"death");
	self waittill(#"trigger");
	spawn_manager notify(#"enable");
}

/*
	Name: spawn_manager_kill_think
	Namespace: spawn_manager
	Checksum: 0x56E1D5F2
	Offset: 0x1A18
	Size: 0x16C
	Parameters: 0
	Flags: None
*/
function spawn_manager_kill_think()
{
	self waittill(#"death");
	sm_id = self.sm_id;
	a_spawners = self.allspawners;
	a_active_ai = self.activeai;
	level flag::clear(("sm_" + sm_id) + "_enabled");
	level flag::set(("sm_" + sm_id) + "_killed");
	level flag::set(("sm_" + sm_id) + "_complete");
	function_257e48e2();
	if(a_active_ai.size)
	{
		array::wait_till(a_active_ai, "death");
	}
	level flag::set(("sm_" + sm_id) + "_cleared");
	arrayremovevalue(level.spawn_managers, undefined);
}

/*
	Name: start_triggers
	Namespace: spawn_manager
	Checksum: 0x31E6727B
	Offset: 0x1B90
	Size: 0x17C
	Parameters: 1
	Flags: None
*/
function start_triggers(trigger_type)
{
	triggers = trigger::get_all("trigger_multiple", "trigger_once", "trigger_use", "trigger_radius", "trigger_lookat", "trigger_damage", "trigger_box");
	foreach(trig in triggers)
	{
		if(isdefined(trig.target))
		{
			targets = get_spawn_manager_array(trig.target);
			foreach(target in targets)
			{
				trig thread spawn_manager_enable_trigger_think(target);
			}
		}
	}
}

/*
	Name: get_spawn_manager_array
	Namespace: spawn_manager
	Checksum: 0xB2BDE4A5
	Offset: 0x1D18
	Size: 0x112
	Parameters: 1
	Flags: None
*/
function get_spawn_manager_array(targetname)
{
	if(isdefined(targetname))
	{
		spawn_manager_array = [];
		for(i = 0; i < level.spawn_managers.size; i++)
		{
			if(isdefined(level.spawn_managers[i]))
			{
				if(level.spawn_managers[i].targetname === targetname || level.spawn_managers[i].name === targetname)
				{
					if(!isdefined(spawn_manager_array))
					{
						spawn_manager_array = [];
					}
					else if(!isarray(spawn_manager_array))
					{
						spawn_manager_array = array(spawn_manager_array);
					}
					spawn_manager_array[spawn_manager_array.size] = level.spawn_managers[i];
				}
			}
		}
		return spawn_manager_array;
	}
	return level.spawn_managers;
}

/*
	Name: spawn_manager_get_spawners
	Namespace: spawn_manager
	Checksum: 0x25D5890F
	Offset: 0x1E38
	Size: 0x324
	Parameters: 0
	Flags: None
*/
function spawn_manager_get_spawners()
{
	arrayremovevalue(self.allspawners, undefined);
	exclude = [];
	for(i = 0; i < self.allspawners.size; i++)
	{
		if(isdefined(level._gamemode_norandomdogs) && self.allspawners[i].classname == "actor_enemy_dog_sp")
		{
			if(!isdefined(exclude))
			{
				exclude = [];
			}
			else if(!isarray(exclude))
			{
				exclude = array(exclude);
			}
			exclude[exclude.size] = self.allspawners[i];
		}
	}
	self.allspawners = array::exclude(self.allspawners, exclude);
	spawner_count_with_max_active = 0;
	foreach(sp in self.allspawners)
	{
		if(!isdefined(sp.sm_count_1player))
		{
			sp.sm_count_1player = sp.count;
		}
		if(!isdefined(sp.sm_active_count_max_1player))
		{
			sp.sm_active_count_max_1player = (isdefined(sp.sm_active_count_max) ? sp.sm_active_count_max : level.spawn_manager_max_ai);
		}
		if(!isdefined(sp.sm_active_count_min_1player))
		{
			sp.sm_active_count_min_1player = (isdefined(sp.sm_active_count_min) ? sp.sm_active_count_min : sp.sm_active_count_max_1player);
		}
		sp.activeai = [];
	}
	groupspawners = arraycopy(self.allspawners);
	spawner_count = self.sm_spawner_count;
	if(spawner_count > self.allspawners.size)
	{
		spawner_count = self.allspawners.size;
	}
	spawners = [];
	while(spawners.size < spawner_count)
	{
		spawner = array::random(groupspawners);
		if(!isdefined(spawners))
		{
			spawners = [];
		}
		else if(!isarray(spawners))
		{
			spawners = array(spawners);
		}
		spawners[spawners.size] = spawner;
		arrayremovevalue(groupspawners, spawner);
	}
	return spawners;
}

/*
	Name: spawn_manager_get_spawn_group_size
	Namespace: spawn_manager
	Checksum: 0x6A1C7644
	Offset: 0x2168
	Size: 0x5E
	Parameters: 0
	Flags: None
*/
function spawn_manager_get_spawn_group_size()
{
	if(self.sm_group_size_min < self.sm_group_size_max)
	{
		self.sm_group_size = randomintrange(self.sm_group_size_min, self.sm_group_size_max + 1);
	}
	else
	{
		self.sm_group_size = self.sm_group_size_min;
	}
	return self.sm_group_size;
}

/*
	Name: function_257e48e2
	Namespace: spawn_manager
	Checksum: 0xD2667C2
	Offset: 0x21D0
	Size: 0xC2
	Parameters: 0
	Flags: None
*/
function function_257e48e2()
{
	if(isdefined(self.spawners))
	{
		foreach(spawner in self.spawners)
		{
			if(isdefined(spawner) && !is_false(spawner.script_delete))
			{
				spawner delete();
			}
		}
		self.spawners = undefined;
	}
}

/*
	Name: cleanup_spawners
	Namespace: spawn_manager
	Checksum: 0x1BE15B1E
	Offset: 0x22A0
	Size: 0xB2
	Parameters: 0
	Flags: None
*/
function cleanup_spawners()
{
	spawners = [];
	for(i = 0; i < self.spawners.size; i++)
	{
		if(isdefined(self.spawners[i]))
		{
			if(self.spawners[i].count != 0)
			{
				spawners[spawners.size] = self.spawners[i];
				continue;
			}
			self.spawners[i] delete();
		}
	}
	self.spawners = spawners;
}

/*
	Name: spawn_manager_wait
	Namespace: spawn_manager
	Checksum: 0x18A88D4D
	Offset: 0x2360
	Size: 0x19A
	Parameters: 0
	Flags: None
*/
function spawn_manager_wait()
{
	if(isdefined(self.script_wait))
	{
		wait(self.script_wait);
		if(isdefined(self.script_wait_add))
		{
			self.script_wait = self.script_wait + self.script_wait_add;
		}
	}
	else if(isdefined(self.script_wait_min) && isdefined(self.script_wait_max))
	{
		coop_scalar = 1;
		players = getplayers();
		if(players.size == 2)
		{
			coop_scalar = 0.7;
		}
		else
		{
			if(players.size == 3)
			{
				coop_scalar = 0.5;
			}
			else if(players.size == 4)
			{
				coop_scalar = 0.3;
			}
		}
		diff = self.script_wait_max - self.script_wait_min;
		if(abs(diff) > 0)
		{
			wait(randomfloatrange(self.script_wait_min, self.script_wait_min + (diff * coop_scalar)));
		}
		else
		{
			wait(self.script_wait_min);
		}
		if(isdefined(self.script_wait_add))
		{
			self.script_wait_min = self.script_wait_min + self.script_wait_add;
			self.script_wait_max = self.script_wait_max + self.script_wait_add;
		}
	}
}

/*
	Name: function_42a4d0d8
	Namespace: spawn_manager
	Checksum: 0x3D55B6FC
	Offset: 0x2508
	Size: 0x13C
	Parameters: 1
	Flags: None
*/
function function_42a4d0d8(spawner)
{
	if(!isdefined(spawner.var_3717c478))
	{
		return true;
	}
	radius = (isdefined(spawner.var_3717c478) ? spawner.var_3717c478 : 0);
	players = getplayers();
	if(!isdefined(players) || players.size == 0)
	{
		return true;
	}
	foreach(player in players)
	{
		if(distancesquared(spawner.origin, player.origin) <= sqr(spawner.var_3717c478))
		{
			return false;
		}
	}
	return true;
}

/*
	Name: spawn_manager_flags_setup
	Namespace: spawn_manager
	Checksum: 0x6D586CF3
	Offset: 0x2650
	Size: 0xC4
	Parameters: 0
	Flags: None
*/
function spawn_manager_flags_setup()
{
	level flag::init(("sm_" + self.sm_id) + "_enabled");
	level flag::init(("sm_" + self.sm_id) + "_complete");
	level flag::init(("sm_" + self.sm_id) + "_killed");
	level flag::init(("sm_" + self.sm_id) + "_cleared");
}

/*
	Name: spawn_manager_flag_enabled
	Namespace: spawn_manager
	Checksum: 0x8B0A1EBD
	Offset: 0x2720
	Size: 0x84
	Parameters: 0
	Flags: None
*/
function spawn_manager_flag_enabled()
{
	/#
		assert(!level flag::get(("" + self.sm_id) + ""), "");
	#/
	level flag::set(("sm_" + self.sm_id) + "_enabled");
}

/*
	Name: spawn_manager_flag_disabled
	Namespace: spawn_manager
	Checksum: 0xB1717F94
	Offset: 0x27B0
	Size: 0x3C
	Parameters: 0
	Flags: None
*/
function spawn_manager_flag_disabled()
{
	self.enable = 0;
	level flag::clear(("sm_" + self.sm_id) + "_enabled");
}

/*
	Name: spawn_manager_flag_killed
	Namespace: spawn_manager
	Checksum: 0xFD7CD2C7
	Offset: 0x27F8
	Size: 0x84
	Parameters: 0
	Flags: None
*/
function spawn_manager_flag_killed()
{
	/#
		assert(!level flag::get(("" + self.sm_id) + ""), "");
	#/
	level flag::set(("sm_" + self.sm_id) + "_killed");
}

/*
	Name: spawn_manager_flag_complete
	Namespace: spawn_manager
	Checksum: 0x56367E1D
	Offset: 0x2888
	Size: 0x84
	Parameters: 0
	Flags: None
*/
function spawn_manager_flag_complete()
{
	/#
		assert(!level flag::get(("" + self.sm_id) + ""), "");
	#/
	level flag::set(("sm_" + self.sm_id) + "_complete");
}

/*
	Name: spawn_manager_flag_cleared
	Namespace: spawn_manager
	Checksum: 0x2A834048
	Offset: 0x2918
	Size: 0x84
	Parameters: 0
	Flags: None
*/
function spawn_manager_flag_cleared()
{
	/#
		assert(!level flag::get(("" + self.sm_id) + ""), "");
	#/
	level flag::set(("sm_" + self.sm_id) + "_cleared");
}

/*
	Name: set_global_active_count
	Namespace: spawn_manager
	Checksum: 0x543E6B26
	Offset: 0x29A8
	Size: 0x44
	Parameters: 1
	Flags: None
*/
function set_global_active_count(cnt)
{
	/#
		assert(cnt <= 32, "");
	#/
	level.spawn_manager_max_ai = cnt;
}

/*
	Name: use_trig_when_complete
	Namespace: spawn_manager
	Checksum: 0x8524BFAB
	Offset: 0x29F8
	Size: 0x14C
	Parameters: 4
	Flags: None
*/
function use_trig_when_complete(spawn_manager_targetname, trig_name, trig_key, once_only)
{
	if(isdefined(once_only) && once_only)
	{
		trigger = getent(trig_name, trig_key);
		/#
			assert(isdefined(trigger), ((("" + trig_key) + "") + trig_name) + "");
		#/
		trigger endon(#"trigger");
	}
	if(level flag::exists(("sm_" + spawn_manager_targetname) + "_enabled"))
	{
		level flag::wait_till(("sm_" + spawn_manager_targetname) + "_complete");
		trigger::use(trig_name, trig_key);
	}
	else
	{
		/#
			assertmsg(("" + spawn_manager_targetname) + "");
		#/
	}
}

/*
	Name: use_trig_when_cleared
	Namespace: spawn_manager
	Checksum: 0x363D6868
	Offset: 0x2B50
	Size: 0x14C
	Parameters: 4
	Flags: None
*/
function use_trig_when_cleared(spawn_manager_targetname, trig_name, trig_key, once_only)
{
	if(isdefined(once_only) && once_only)
	{
		trigger = getent(trig_name, trig_key);
		/#
			assert(isdefined(trigger), ((("" + trig_key) + "") + trig_name) + "");
		#/
		trigger endon(#"trigger");
	}
	if(level flag::exists(("sm_" + spawn_manager_targetname) + "_enabled"))
	{
		level flag::wait_till(("sm_" + spawn_manager_targetname) + "_cleared");
		trigger::use(trig_name, trig_key);
	}
	else
	{
		/#
			assertmsg(("" + spawn_manager_targetname) + "");
		#/
	}
}

/*
	Name: use_trig_when_enabled
	Namespace: spawn_manager
	Checksum: 0x749C87A9
	Offset: 0x2CA8
	Size: 0x14C
	Parameters: 4
	Flags: None
*/
function use_trig_when_enabled(spawn_manager_targetname, trig_name, trig_key, once_only)
{
	if(isdefined(once_only) && once_only)
	{
		trigger = getent(trig_name, trig_key);
		/#
			assert(isdefined(trigger), ((("" + trig_key) + "") + trig_name) + "");
		#/
		trigger endon(#"trigger");
	}
	if(level flag::exists(("sm_" + spawn_manager_targetname) + "_enabled"))
	{
		level flag::wait_till(("sm_" + spawn_manager_targetname) + "_enabled");
		trigger::use(trig_name, trig_key);
	}
	else
	{
		/#
			assertmsg(("" + spawn_manager_targetname) + "");
		#/
	}
}

/*
	Name: run_func_when_complete
	Namespace: spawn_manager
	Checksum: 0x53B04CE6
	Offset: 0x2E00
	Size: 0xF4
	Parameters: 8
	Flags: None
*/
function run_func_when_complete(spawn_manager_targetname, process, ent, var1, var2, var3, var4, var5)
{
	/#
		assert(isdefined(process), "");
	#/
	/#
		assert(level flag::exists(("" + spawn_manager_targetname) + ""), ("" + spawn_manager_targetname) + "");
	#/
	wait_till_complete(spawn_manager_targetname);
	util::single_func(ent, process, var1, var2, var3, var4, var5);
}

/*
	Name: run_func_when_cleared
	Namespace: spawn_manager
	Checksum: 0x2C0A42F0
	Offset: 0x2F00
	Size: 0xF4
	Parameters: 8
	Flags: None
*/
function run_func_when_cleared(spawn_manager_targetname, process, ent, var1, var2, var3, var4, var5)
{
	/#
		assert(isdefined(process), "");
	#/
	/#
		assert(level flag::exists(("" + spawn_manager_targetname) + ""), ("" + spawn_manager_targetname) + "");
	#/
	wait_till_cleared(spawn_manager_targetname);
	util::single_func(ent, process, var1, var2, var3, var4, var5);
}

/*
	Name: run_func_when_enabled
	Namespace: spawn_manager
	Checksum: 0x28A281AD
	Offset: 0x3000
	Size: 0xF4
	Parameters: 8
	Flags: None
*/
function run_func_when_enabled(spawn_manager_targetname, process, ent, var1, var2, var3, var4, var5)
{
	/#
		assert(isdefined(process), "");
	#/
	/#
		assert(level flag::exists(("" + spawn_manager_targetname) + ""), ("" + spawn_manager_targetname) + "");
	#/
	wait_till_enabled(spawn_manager_targetname);
	util::single_func(ent, process, var1, var2, var3, var4, var5);
}

/*
	Name: enable
	Namespace: spawn_manager
	Checksum: 0x7E46EE68
	Offset: 0x3100
	Size: 0x12C
	Parameters: 2
	Flags: None
*/
function enable(spawn_manager_targetname, no_assert)
{
	if(level flag::exists(("sm_" + spawn_manager_targetname) + "_enabled"))
	{
		foreach(sm in level.spawn_managers)
		{
			if(isdefined(sm) && sm.sm_id == spawn_manager_targetname)
			{
				sm notify(#"enable");
				return;
			}
		}
	}
	else if(!is_true(no_assert))
	{
		/#
			assertmsg(("" + spawn_manager_targetname) + "");
		#/
	}
}

/*
	Name: disable
	Namespace: spawn_manager
	Checksum: 0x569175EC
	Offset: 0x3238
	Size: 0x12C
	Parameters: 2
	Flags: None
*/
function disable(spawn_manager_targetname, no_assert)
{
	if(level flag::exists(("sm_" + spawn_manager_targetname) + "_enabled"))
	{
		foreach(sm in level.spawn_managers)
		{
			if(isdefined(sm) && sm.sm_id == spawn_manager_targetname)
			{
				sm notify(#"disable");
				return;
			}
		}
	}
	else if(!is_true(no_assert))
	{
		/#
			assertmsg(("" + spawn_manager_targetname) + "");
		#/
	}
}

/*
	Name: kill
	Namespace: spawn_manager
	Checksum: 0xD8A28C3A
	Offset: 0x3370
	Size: 0x154
	Parameters: 2
	Flags: None
*/
function kill(spawn_manager_targetname, no_assert)
{
	if(level flag::exists(("sm_" + spawn_manager_targetname) + "_enabled"))
	{
		foreach(sm in level.spawn_managers)
		{
			if(isdefined(sm) && sm.sm_id == spawn_manager_targetname)
			{
				sm delete();
				arrayremovevalue(level.spawn_managers, undefined);
				return;
			}
		}
	}
	else if(!is_true(no_assert))
	{
		/#
			assertmsg(("" + spawn_manager_targetname) + "");
		#/
	}
}

/*
	Name: is_enabled
	Namespace: spawn_manager
	Checksum: 0x67A3ED52
	Offset: 0x34D0
	Size: 0xAC
	Parameters: 1
	Flags: None
*/
function is_enabled(spawn_manager_targetname)
{
	if(level flag::exists(("sm_" + spawn_manager_targetname) + "_enabled"))
	{
		if(level flag::get(("sm_" + spawn_manager_targetname) + "_enabled"))
		{
			return true;
		}
		return false;
	}
	/#
		assertmsg(("" + spawn_manager_targetname) + "");
	#/
}

/*
	Name: is_complete
	Namespace: spawn_manager
	Checksum: 0xAE4CB7F8
	Offset: 0x3588
	Size: 0xAC
	Parameters: 1
	Flags: None
*/
function is_complete(spawn_manager_targetname)
{
	if(level flag::exists(("sm_" + spawn_manager_targetname) + "_enabled"))
	{
		if(level flag::get(("sm_" + spawn_manager_targetname) + "_complete"))
		{
			return true;
		}
		return false;
	}
	/#
		assertmsg(("" + spawn_manager_targetname) + "");
	#/
}

/*
	Name: is_cleared
	Namespace: spawn_manager
	Checksum: 0xE88CC136
	Offset: 0x3640
	Size: 0xAC
	Parameters: 1
	Flags: None
*/
function is_cleared(spawn_manager_targetname)
{
	if(level flag::exists(("sm_" + spawn_manager_targetname) + "_enabled"))
	{
		if(level flag::get(("sm_" + spawn_manager_targetname) + "_cleared"))
		{
			return true;
		}
		return false;
	}
	/#
		assertmsg(("" + spawn_manager_targetname) + "");
	#/
}

/*
	Name: is_killed
	Namespace: spawn_manager
	Checksum: 0xAECD943B
	Offset: 0x36F8
	Size: 0xAC
	Parameters: 1
	Flags: None
*/
function is_killed(spawn_manager_targetname)
{
	if(level flag::exists(("sm_" + spawn_manager_targetname) + "_enabled"))
	{
		if(level flag::get(("sm_" + spawn_manager_targetname) + "_killed"))
		{
			return true;
		}
		return false;
	}
	/#
		assertmsg(("" + spawn_manager_targetname) + "");
	#/
}

/*
	Name: wait_till_cleared
	Namespace: spawn_manager
	Checksum: 0x23861B57
	Offset: 0x37B0
	Size: 0x9C
	Parameters: 1
	Flags: None
*/
function wait_till_cleared(spawn_manager_targetname)
{
	if(level flag::exists(("sm_" + spawn_manager_targetname) + "_enabled"))
	{
		level flag::wait_till(("sm_" + spawn_manager_targetname) + "_cleared");
	}
	else
	{
		/#
			assertmsg(("" + spawn_manager_targetname) + "");
		#/
	}
}

/*
	Name: wait_till_ai_remaining
	Namespace: spawn_manager
	Checksum: 0xD93E3FDE
	Offset: 0x3858
	Size: 0x140
	Parameters: 2
	Flags: None
*/
function wait_till_ai_remaining(spawn_manager_targetname, count_to_reach)
{
	/#
		assert(isdefined(count_to_reach), "");
	#/
	/#
		assert(count_to_reach, "");
	#/
	if(level flag::exists(("sm_" + spawn_manager_targetname) + "_enabled"))
	{
		level flag::wait_till(("sm_" + spawn_manager_targetname) + "_complete");
	}
	else
	{
		/#
			assertmsg(("" + spawn_manager_targetname) + "");
		#/
	}
	if(level flag::get(("sm_" + spawn_manager_targetname) + "_cleared"))
	{
		return;
	}
	while(get_ai(spawn_manager_targetname).size > count_to_reach)
	{
		wait(0.1);
	}
}

/*
	Name: wait_till_complete
	Namespace: spawn_manager
	Checksum: 0xF602C089
	Offset: 0x39A0
	Size: 0x9C
	Parameters: 1
	Flags: None
*/
function wait_till_complete(spawn_manager_targetname)
{
	if(level flag::exists(("sm_" + spawn_manager_targetname) + "_enabled"))
	{
		level flag::wait_till(("sm_" + spawn_manager_targetname) + "_complete");
	}
	else
	{
		/#
			assertmsg(("" + spawn_manager_targetname) + "");
		#/
	}
}

/*
	Name: wait_till_enabled
	Namespace: spawn_manager
	Checksum: 0x2DDAFE15
	Offset: 0x3A48
	Size: 0x9C
	Parameters: 1
	Flags: None
*/
function wait_till_enabled(spawn_manager_targetname)
{
	if(level flag::exists(("sm_" + spawn_manager_targetname) + "_enabled"))
	{
		level flag::wait_till(("sm_" + spawn_manager_targetname) + "_enabled");
	}
	else
	{
		/#
			assertmsg(("" + spawn_manager_targetname) + "");
		#/
	}
}

/*
	Name: wait_till_spawned_count
	Namespace: spawn_manager
	Checksum: 0x834D9AC1
	Offset: 0x3AF0
	Size: 0x178
	Parameters: 2
	Flags: None
*/
function wait_till_spawned_count(spawn_manager_targetname, count)
{
	if(level flag::exists(("sm_" + spawn_manager_targetname) + "_enabled"))
	{
		level flag::wait_till(("sm_" + spawn_manager_targetname) + "_enabled");
	}
	else
	{
		/#
			assertmsg(("" + spawn_manager_targetname) + "");
		#/
	}
	spawn_manager = get_spawn_manager_array(spawn_manager_targetname);
	/#
		assert(spawn_manager.size, "");
	#/
	/#
		assert(spawn_manager.size == 1, "");
	#/
	while(true)
	{
		if(isdefined(spawn_manager[0].spawncount) && spawn_manager[0].spawncount < count && !is_killed(spawn_manager_targetname))
		{
			wait(0.5);
		}
		else
		{
			break;
		}
	}
}

/*
	Name: get_ai
	Namespace: spawn_manager
	Checksum: 0x18EDD5A3
	Offset: 0x3C78
	Size: 0x3A
	Parameters: 1
	Flags: None
*/
function get_ai(spawn_manager_targetname)
{
	a_ai = getaiarray(spawn_manager_targetname, "sm_id");
	return a_ai;
}

