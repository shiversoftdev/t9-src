#using scripts\zm_common\zm_zonemgr.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_quick_spawning.gsc;
#using scripts\zm_common\zm_puppet.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_net.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\zm_common\zm_equipment.gsc;
#using scripts\zm_common\zm_camos.gsc;
#using scripts\zm_common\zm_blockers.gsc;
#using scripts\zm_common\zm_bgb.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using script_35598499769dbb3d;
#using scripts\core_common\ai\zombie_shared.gsc;
#using scripts\core_common\ai\zombie_death.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\demo_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\activecamo_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace zm_spawner;

/*
	Name: init
	Namespace: zm_spawner
	Checksum: 0x8EBEB228
	Offset: 0x7D8
	Size: 0x204
	Parameters: 0
	Flags: None
*/
function init()
{
	level._contextual_grab_lerp_time = 0.3;
	level.zombie_spawners = getentarray("zombie_spawner", "script_noteworthy");
	if(is_true(level.use_multiple_spawns))
	{
		level.zombie_spawn = [];
		for(i = 0; i < level.zombie_spawners.size; i++)
		{
			if(isdefined(level.zombie_spawners[i].script_int))
			{
				int = level.zombie_spawners[i].script_int;
				if(!isdefined(level.zombie_spawn[int]))
				{
					level.zombie_spawn[int] = [];
				}
				level.zombie_spawn[int][level.zombie_spawn[int].size] = level.zombie_spawners[i];
			}
		}
	}
	if(isdefined(level.ignore_spawner_func))
	{
		for(i = 0; i < level.zombie_spawners.size; i++)
		{
			ignore = [[level.ignore_spawner_func]](level.zombie_spawners[i]);
			if(ignore)
			{
				arrayremovevalue(level.zombie_spawners, level.zombie_spawners[i]);
			}
		}
	}
	if(!isdefined(level.attack_player_thru_boards_range))
	{
		level.attack_player_thru_boards_range = 109.8;
	}
	if(isdefined(level._game_module_custom_spawn_init_func))
	{
		[[level._game_module_custom_spawn_init_func]]();
	}
	/#
		level thread debug_show_exterior_goals();
	#/
}

/*
	Name: debug_show_exterior_goals
	Namespace: zm_spawner
	Checksum: 0xF9FC672F
	Offset: 0x9E8
	Size: 0x43A
	Parameters: 0
	Flags: None
*/
function debug_show_exterior_goals()
{
	/#
		while(true)
		{
			if(is_true(level.toggle_show_exterior_goals))
			{
				color = (1, 1, 1);
				color_red = (1, 0, 0);
				color_blue = (0, 0, 1);
				foreach(zone in level.zones)
				{
					foreach(location in zone.a_loc_types[#"zombie_location"])
					{
						recordstar(location.origin, color);
					}
				}
				foreach(zone in level.zones)
				{
					foreach(location in zone.a_loc_types[#"zombie_location"])
					{
						foreach(goal in level.exterior_goals)
						{
							if(goal.script_string == location.script_string)
							{
								recordline(location.origin, goal.origin, color);
								goal.has_spawner = 1;
								break;
							}
						}
					}
				}
				foreach(goal in level.exterior_goals)
				{
					if(is_true(goal.has_spawner))
					{
						recordcircle(goal.origin, 16, color);
						continue;
					}
					if(isdefined(goal.script_string) && goal.script_string == "")
					{
						recordcircle(goal.origin, 16, color_blue);
						continue;
					}
					recordcircle(goal.origin, 16, color_red);
				}
			}
			waitframe(1);
		}
	#/
}

/*
	Name: is_spawner_targeted_by_blocker
	Namespace: zm_spawner
	Checksum: 0x2E598A5
	Offset: 0xE30
	Size: 0xD6
	Parameters: 1
	Flags: Linked
*/
function is_spawner_targeted_by_blocker(ent)
{
	if(isdefined(ent.targetname))
	{
		targeters = getentarray(ent.targetname, "target");
		for(i = 0; i < targeters.size; i++)
		{
			if(targeters[i].targetname == "zombie_door" || targeters[i].targetname == "zombie_debris")
			{
				return true;
			}
			result = is_spawner_targeted_by_blocker(targeters[i]);
			if(result)
			{
				return true;
			}
		}
	}
	return false;
}

/*
	Name: add_custom_zombie_spawn_logic
	Namespace: zm_spawner
	Checksum: 0x286F384D
	Offset: 0xF10
	Size: 0x44
	Parameters: 1
	Flags: None
*/
function add_custom_zombie_spawn_logic(func)
{
	if(!isdefined(level._zombie_custom_spawn_logic))
	{
		level._zombie_custom_spawn_logic = [];
	}
	level._zombie_custom_spawn_logic[level._zombie_custom_spawn_logic.size] = func;
}

/*
	Name: zombie_spawn_init
	Namespace: zm_spawner
	Checksum: 0x14C76EEF
	Offset: 0xF60
	Size: 0x55C
	Parameters: 0
	Flags: Linked
*/
function zombie_spawn_init()
{
	if(!isdefined(self.targetname))
	{
		self.targetname = "zombie";
	}
	self.script_noteworthy = undefined;
	self.var_2f68be48 = 1;
	self.var_7cc959b1 = 1;
	self.var_b69c12bc = 1;
	if(isdefined(zm_utility::get_gamemode_var("pre_init_zombie_spawn_func")))
	{
		self [[zm_utility::get_gamemode_var("pre_init_zombie_spawn_func")]]();
	}
	self thread zm_audio::play_ambient_zombie_vocals();
	self thread zm_audio::zmbaivox_notifyconvert();
	self.zmb_vocals_attack = "zmb_vocals_zombie_attack";
	self.allowdeath = 1;
	self.force_gib = 1;
	self.is_zombie = 1;
	self allowedstances("stand");
	if(!zm_utility::is_survival())
	{
		self.attackercountthreatscale = 0;
		self.currentenemythreatscale = 0;
		self.recentattackerthreatscale = 0;
		self.coverthreatscale = 0;
		self.fovcosine = 0;
		self.fovcosinebusy = 0;
		self.goalradius = 32;
		self.disablearrivals = 1;
		self.disableexits = 1;
		self.grenadeawareness = 0;
		self.badplaceawareness = 1;
	}
	self.zombie_damaged_by_bar_knockdown = 0;
	self.gibbed = 0;
	self.head_gibbed = 0;
	self.ignoresuppression = 1;
	self.suppressionthreshold = 1;
	self.nododgemove = 1;
	self.dontshootwhilemoving = 1;
	self.pathenemylookahead = 0;
	self.holdfire = 1;
	self.chatinitialized = 0;
	self zombie_utility::function_df5afb5e(0);
	self.canbetargetedbyturnedzombies = 1;
	self.var_6d23c054 = 1;
	if(!isdefined(self.zombie_arms_position))
	{
		if(randomint(2) == 0)
		{
			self.zombie_arms_position = "up";
		}
		else
		{
			self.zombie_arms_position = "down";
		}
	}
	if(randomint(100) < 25)
	{
		self.canstumble = 1;
	}
	self zm_utility::disable_react();
	self.freezegun_damage = 0;
	if(!is_true(self.ai.var_870d0893))
	{
		self setavoidancemask("avoid none");
	}
	self pathmode("dont move");
	level thread zombie_death_event(self);
	self thread zombie_utility::zombie_gib_on_damage();
	self thread zombie_damage_failsafe();
	self.deathfunction = &zombie_death_animscript;
	self.flame_damage_time = 0;
	self.meleedamage = 60;
	if(!zm_utility::is_survival() && !zm_utility::function_c200446c())
	{
		self.no_powerups = 1;
		self.var_98f1f37c = 1;
	}
	/#
		self zombie_history("" + self.origin);
	#/
	self.thundergun_knockdown_func = level.basic_zombie_thundergun_knockdown;
	self.tesla_head_gib_func = &zombie_tesla_head_gib;
	self.team = level.zombie_team;
	if(!zm_utility::is_survival())
	{
		self.updatesight = 0;
	}
	if(isdefined(level.var_a26e0f74))
	{
		self.heroweapon_kill_power = level.var_a26e0f74;
		self.sword_kill_power = level.var_a26e0f74;
	}
	else
	{
		self.heroweapon_kill_power = 2;
		self.sword_kill_power = 2;
	}
	if(isdefined(level.achievement_monitor_func))
	{
		self [[level.achievement_monitor_func]]();
	}
	if(isdefined(zm_utility::get_gamemode_var("post_init_zombie_spawn_func")))
	{
		self [[zm_utility::get_gamemode_var("post_init_zombie_spawn_func")]]();
	}
	if(is_true(level.var_6d8a8e47))
	{
		self thread function_3f1243fb();
	}
}

/*
	Name: function_3f1243fb
	Namespace: zm_spawner
	Checksum: 0x4621479C
	Offset: 0x14C8
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function function_3f1243fb()
{
	self endon(#"death");
	util::wait_network_frame();
	self thread zombie_utility::makezombiecrawler();
}

/*
	Name: function_c8ba0b8e
	Namespace: zm_spawner
	Checksum: 0xF7C7A505
	Offset: 0x1518
	Size: 0x3C
	Parameters: 0
	Flags: None
*/
function function_c8ba0b8e()
{
	self endon(#"death");
	self waittill(#"completed_emerging_into_playable_area");
	self zombie_utility::makezombiecrawler();
}

/*
	Name: zombie_damage_failsafe
	Namespace: zm_spawner
	Checksum: 0x8E207355
	Offset: 0x1560
	Size: 0x2F8
	Parameters: 0
	Flags: Linked
*/
function zombie_damage_failsafe()
{
	if(zm_utility::is_survival())
	{
		return;
	}
	self endon(#"death");
	while(true)
	{
		wait(0.5);
		if(!isalive(self.enemy) || !isplayer(self.enemy) || !self istouching(self.enemy))
		{
			continue;
		}
		e_enemy = self.enemy;
		v_starting_origin = self.enemy.origin;
		var_f2ca854b = self.enemy.health;
		var_65a69eba = undefined;
		var_f3a1b629 = 0;
		while(isalive(self.enemy) && isplayer(self.enemy) && e_enemy == self.enemy && self istouching(self.enemy) && !self.enemy laststand::player_is_in_laststand())
		{
			if(distancesquared(v_starting_origin, self.enemy.origin) > 60 * 60)
			{
				break;
			}
			if(is_true(self.enemy.hasriotshield))
			{
				if(!isdefined(var_65a69eba))
				{
					var_65a69eba = self.enemy damageriotshield(0);
				}
				else if(self.enemy damageriotshield(0) < var_65a69eba)
				{
					break;
				}
			}
			else if(isdefined(var_65a69eba))
			{
				var_65a69eba = undefined;
				break;
			}
			if(self.enemy.health < var_f2ca854b)
			{
				break;
			}
			if(var_f3a1b629 >= 7)
			{
				self.enemy dodamage(self.enemy.health + 1000, self.enemy.origin, self, self, "none", "MOD_RIFLE_BULLET");
				break;
			}
			wait(0.5);
			var_f3a1b629 = var_f3a1b629 + 0.5;
		}
	}
}

/*
	Name: should_skip_teardown
	Namespace: zm_spawner
	Checksum: 0x3636D72C
	Offset: 0x1860
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function should_skip_teardown(find_flesh_struct_string)
{
	if(!isdefined(find_flesh_struct_string))
	{
		return true;
	}
	if(find_flesh_struct_string === "find_flesh")
	{
		return true;
	}
	return false;
}

/*
	Name: zombie_think
	Namespace: zm_spawner
	Checksum: 0x21BF0A79
	Offset: 0x18A0
	Size: 0x1EA
	Parameters: 0
	Flags: Linked
*/
function zombie_think()
{
	self endon(#"death");
	/#
		assert(!self.isdog);
	#/
	self.ai_state = "zombie_think";
	find_flesh_struct_string = undefined;
	if(isdefined(level.zombie_custom_think_logic))
	{
		shouldwait = self [[level.zombie_custom_think_logic]]();
		if(shouldwait)
		{
			self waittill(#"zombie_custom_think_done", find_flesh_struct_string);
		}
	}
	else
	{
		if(is_true(self.start_inert))
		{
			find_flesh_struct_string = "find_flesh";
			self thread function_d3b3f8b6();
		}
		else
		{
			if(isdefined(self.custom_location))
			{
				self thread [[self.custom_location]]();
			}
			else
			{
				self thread do_zombie_spawn();
			}
			waitresult = undefined;
			waitresult = self waittill(#"risen");
			find_flesh_struct_string = waitresult.find_flesh_struct_string;
		}
	}
	self.find_flesh_struct_string = find_flesh_struct_string;
	/#
		self.backupnode = self.first_node;
		self thread zm_puppet::wait_for_puppet_pickup();
	#/
	self setgoal(self.origin);
	if(!is_true(self.start_inert))
	{
		self pathmode("move allowed");
	}
	self.zombie_think_done = 1;
}

/*
	Name: function_d3b3f8b6
	Namespace: zm_spawner
	Checksum: 0xD5A682AC
	Offset: 0x1A98
	Size: 0x74
	Parameters: 0
	Flags: Linked
*/
function function_d3b3f8b6()
{
	self endon(#"death");
	if(isdefined(self.anchor))
	{
		self waittill(#"risen");
	}
	self setgoal(self.origin);
	self pathmode("move allowed");
}

/*
	Name: zombie_entered_playable
	Namespace: zm_spawner
	Checksum: 0xE2EFD561
	Offset: 0x1B18
	Size: 0x200
	Parameters: 0
	Flags: None
*/
function zombie_entered_playable()
{
	self endon(#"death");
	if(zm_utility::function_21f4ac36())
	{
		if(!isdefined(level.var_a2a9b2de))
		{
			level.var_a2a9b2de = getnodearray("player_region", "script_noteworthy");
		}
	}
	if(zm_utility::function_c85ebbbc())
	{
		if(!isdefined(level.playable_area))
		{
			level.playable_area = getentarray("player_volume", "script_noteworthy");
		}
	}
	while(true)
	{
		if(isdefined(level.playable_area))
		{
			var_12ed21a1 = function_72d3bca6(level.playable_area, self.origin, undefined, undefined, level.var_603981f1);
			foreach(area in var_12ed21a1)
			{
				if(self istouching(area))
				{
					self zombie_complete_emerging_into_playable_area();
					return;
				}
			}
		}
		if(isdefined(level.var_a2a9b2de))
		{
			node = function_52c1730(self.origin, level.var_a2a9b2de, 500);
			if(isdefined(node))
			{
				self zombie_complete_emerging_into_playable_area();
				return;
			}
		}
		wait(1);
	}
}

/*
	Name: zombie_assure_node
	Namespace: zm_spawner
	Checksum: 0x20017494
	Offset: 0x1D20
	Size: 0x3B4
	Parameters: 0
	Flags: None
*/
function zombie_assure_node()
{
	self endon(#"death", #"goal");
	level endon(#"intermission");
	start_pos = self.origin;
	if(isdefined(self.entrance_nodes))
	{
		for(i = 0; i < self.entrance_nodes.size; i++)
		{
			if(self zombie_bad_path())
			{
				/#
					self zombie_history("" + self.entrance_nodes[i].origin);
					println((("" + self.origin) + "") + self.entrance_nodes[i].origin);
					level thread zm_utility::draw_line_ent_to_pos(self, self.entrance_nodes[i].origin, "");
				#/
				self.first_node = self.entrance_nodes[i];
				self setgoal(self.entrance_nodes[i].origin);
				continue;
			}
			return;
		}
	}
	wait(2);
	nodes = array::get_all_closest(self.origin, level.exterior_goals, undefined, 20);
	if(isdefined(nodes))
	{
		self.entrance_nodes = nodes;
		for(i = 0; i < self.entrance_nodes.size; i++)
		{
			if(self zombie_bad_path())
			{
				/#
					self zombie_history("" + self.entrance_nodes[i].origin);
					println((("" + self.origin) + "") + self.entrance_nodes[i].origin);
					level thread zm_utility::draw_line_ent_to_pos(self, self.entrance_nodes[i].origin, "");
				#/
				self.first_node = self.entrance_nodes[i];
				self setgoal(self.entrance_nodes[i].origin);
				continue;
			}
			return;
		}
	}
	/#
		self zombie_history("");
	#/
	wait(20);
	self dodamage(self.health + 10, self.origin);
	if(is_true(level.put_timed_out_zombies_back_in_queue) && !is_true(self.has_been_damaged_by_player))
	{
		level.zombie_total++;
		level.zombie_total_subtract++;
	}
	level.zombies_timeout_spawn++;
}

/*
	Name: zombie_bad_path
	Namespace: zm_spawner
	Checksum: 0x63D7C40C
	Offset: 0x20E0
	Size: 0x50
	Parameters: 0
	Flags: Linked
*/
function zombie_bad_path()
{
	var_29b8f3d0 = undefined;
	var_29b8f3d0 = self waittilltimeout(2, #"bad_path");
	if(var_29b8f3d0._notify === "bad_path")
	{
		return true;
	}
	return false;
}

/*
	Name: do_a_taunt
	Namespace: zm_spawner
	Checksum: 0x839653DA
	Offset: 0x2138
	Size: 0x20C
	Parameters: 0
	Flags: None
*/
function do_a_taunt()
{
	self endon(#"death");
	if(self.missinglegs)
	{
		return false;
	}
	if(!self.first_node.zbarrier zbarriersupportszombietaunts())
	{
		return;
	}
	self.old_origin = self.origin;
	if(getdvarstring(#"zombie_taunt_freq") == "")
	{
		setdvar(#"zombie_taunt_freq", 5);
	}
	freq = getdvarint(#"zombie_taunt_freq", 0);
	if(freq >= randomint(100))
	{
		function_6eac4ca1(self, "taunt");
		self notify(#"bhtn_action_notify", {#action:"taunt"});
		tauntstate = "zm_taunt";
		if(isdefined(self.first_node.zbarrier) && self.first_node.zbarrier getzbarriertauntanimstate() != "")
		{
			tauntstate = self.first_node.zbarrier getzbarriertauntanimstate();
		}
		self animscripted("taunt_anim", self.origin, self.angles, "ai_zombie_taunts_4");
		self taunt_notetracks("taunt_anim");
	}
}

/*
	Name: taunt_notetracks
	Namespace: zm_spawner
	Checksum: 0x6A06A09E
	Offset: 0x2350
	Size: 0x82
	Parameters: 1
	Flags: Linked
*/
function taunt_notetracks(msg)
{
	self endon(#"death");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(msg);
		if(waitresult.notetrack == "end")
		{
			self forceteleport(self.old_origin);
			return;
		}
	}
}

/*
	Name: should_attack_player_thru_boards
	Namespace: zm_spawner
	Checksum: 0xAA19B3BE
	Offset: 0x23E0
	Size: 0x310
	Parameters: 0
	Flags: None
*/
function should_attack_player_thru_boards()
{
	if(self.missinglegs)
	{
		return false;
	}
	if(isdefined(self.first_node.zbarrier))
	{
		if(!self.first_node.zbarrier zbarriersupportszombiereachthroughattacks())
		{
			return false;
		}
	}
	if(getdvarstring(#"zombie_reachin_freq") == "")
	{
		setdvar(#"zombie_reachin_freq", 50);
	}
	freq = getdvarint(#"zombie_reachin_freq", 0);
	players = getplayers();
	attack = 0;
	self.player_targets = [];
	for(i = 0; i < players.size; i++)
	{
		if(isalive(players[i]) && !isdefined(players[i].revivetrigger) && distance2d(self.origin, players[i].origin) <= level.attack_player_thru_boards_range)
		{
			self.player_targets[self.player_targets.size] = players[i];
			attack = 1;
		}
	}
	if(!attack || freq < randomint(100))
	{
		return false;
	}
	self.old_origin = self.origin;
	attackanimstate = "zm_window_melee";
	if(isdefined(self.first_node.zbarrier) && self.first_node.zbarrier getzbarrierreachthroughattackanimstate() != "")
	{
		attackanimstate = self.first_node.zbarrier getzbarrierreachthroughattackanimstate();
	}
	function_6eac4ca1(self, "attack");
	self notify(#"bhtn_action_notify", {#action:"attack"});
	self animscripted("window_melee_anim", self.origin, self.angles, "ai_zombie_window_attack_arm_l_out");
	self window_notetracks("window_melee_anim");
	return true;
}

/*
	Name: window_notetracks
	Namespace: zm_spawner
	Checksum: 0xDF90B68F
	Offset: 0x26F8
	Size: 0x2E0
	Parameters: 1
	Flags: Linked
*/
function window_notetracks(msg)
{
	self endon(#"death");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(msg);
		if(waitresult.notetrack == "end")
		{
			self teleport(self.old_origin);
			return;
		}
		if(waitresult.notetrack == "fire")
		{
			if(self.ignoreall)
			{
				self val::reset(#"attack_properties", "ignoreall");
			}
			if(isdefined(self.first_node))
			{
				var_e3df303a = 8100;
				if(isdefined(level.attack_player_thru_boards_range))
				{
					var_e3df303a = level.attack_player_thru_boards_range * level.attack_player_thru_boards_range;
				}
				for(i = 0; i < self.player_targets.size; i++)
				{
					playerdistsq = distance2dsquared(self.player_targets[i].origin, self.origin);
					heightdiff = abs(self.player_targets[i].origin[2] - self.origin[2]);
					if(playerdistsq < var_e3df303a && (heightdiff * heightdiff) < var_e3df303a)
					{
						triggerdistsq = distance2dsquared(self.player_targets[i].origin, self.first_node.trigger_location.origin);
						heightdiff = abs(self.player_targets[i].origin[2] - self.first_node.trigger_location.origin[2]);
						if(triggerdistsq < 2601 && (heightdiff * heightdiff) < 2601)
						{
							self.player_targets[i] dodamage(self.meleedamage, self.origin, self, self, "none", "MOD_MELEE");
							break;
						}
					}
				}
			}
			else
			{
				self melee();
			}
		}
	}
}

/*
	Name: get_attack_spot
	Namespace: zm_spawner
	Checksum: 0x73A2098C
	Offset: 0x29E0
	Size: 0xDC
	Parameters: 1
	Flags: Linked
*/
function get_attack_spot(node)
{
	index = get_attack_spot_index(node);
	if(!isdefined(index))
	{
		return false;
	}
	/#
		val = getdvarint(#"zombie_attack_spot", 0);
		if(val > -1)
		{
			index = val;
		}
	#/
	self.attacking_node = node;
	self.attacking_spot_index = index;
	node.attack_spots_taken[index] = 1;
	self.attacking_spot = node.attack_spots[index];
	node notify(#"hash_1748b3e6967cf7aa");
	return true;
}

/*
	Name: get_attack_spot_index
	Namespace: zm_spawner
	Checksum: 0x7674DC5D
	Offset: 0x2AC8
	Size: 0x9E
	Parameters: 1
	Flags: Linked
*/
function get_attack_spot_index(node)
{
	indexes = [];
	if(!isdefined(node.attack_spots))
	{
		node.attack_spots = [];
	}
	for(i = 0; i < node.attack_spots.size; i++)
	{
		if(!node.attack_spots_taken[i])
		{
			indexes[indexes.size] = i;
		}
	}
	if(indexes.size == 0)
	{
		return undefined;
	}
	return indexes[randomint(indexes.size)];
}

/*
	Name: zombie_tear_notetracks
	Namespace: zm_spawner
	Checksum: 0x2B22B390
	Offset: 0x2B70
	Size: 0x108
	Parameters: 3
	Flags: None
*/
function zombie_tear_notetracks(msg, chunk, node)
{
	self endon(#"death");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(msg);
		if(waitresult.notetrack == "end")
		{
			return;
		}
		if(waitresult.notetrack == "board" || waitresult.notetrack == "destroy_piece" || waitresult.notetrack == "bar")
		{
			if(isdefined(level.zbarrier_zombie_tear_notetrack_override))
			{
				self thread [[level.zbarrier_zombie_tear_notetrack_override]](node, chunk);
			}
			node.zbarrier setzbarrierpiecestate(chunk, "opening");
		}
	}
}

/*
	Name: zombie_boardtear_offset_fx_horizontle
	Namespace: zm_spawner
	Checksum: 0x4C066FF4
	Offset: 0x2C80
	Size: 0x364
	Parameters: 2
	Flags: Linked
*/
function zombie_boardtear_offset_fx_horizontle(chunk, node)
{
	if(isdefined(chunk.script_parameters) && (chunk.script_parameters == "repair_board" || chunk.script_parameters == "board"))
	{
		if(isdefined(chunk.unbroken) && chunk.unbroken == 1)
		{
			if(isdefined(chunk.material) && chunk.material == "glass")
			{
				playfx(level._effect[#"glass_break"], chunk.origin, node.angles);
				chunk.unbroken = 0;
			}
			else
			{
				if(isdefined(chunk.material) && chunk.material == "metal")
				{
					playfx(level._effect[#"fx_zombie_bar_break"], chunk.origin);
					chunk.unbroken = 0;
				}
				else if(isdefined(chunk.material) && chunk.material == "rock")
				{
					if(is_true(level.use_clientside_rock_tearin_fx))
					{
						chunk clientfield::set("tearin_rock_fx", 1);
					}
					else
					{
						playfx(level._effect[#"wall_break"], chunk.origin);
					}
					chunk.unbroken = 0;
				}
			}
		}
	}
	if(isdefined(chunk.script_parameters) && chunk.script_parameters == "barricade_vents")
	{
		if(is_true(level.use_clientside_board_fx))
		{
			chunk clientfield::set("tearin_board_vertical_fx", 1);
		}
		else
		{
			playfx(level._effect[#"fx_zombie_bar_break"], chunk.origin);
		}
	}
	else
	{
		if(isdefined(chunk.material) && chunk.material == "rock")
		{
			if(is_true(level.use_clientside_rock_tearin_fx))
			{
				chunk clientfield::set("tearin_rock_fx", 1);
			}
		}
		else
		{
			if(isdefined(level.use_clientside_board_fx))
			{
				chunk clientfield::set("tearin_board_vertical_fx", 1);
			}
			else
			{
				wait(randomfloatrange(0.2, 0.4));
			}
		}
	}
}

/*
	Name: zombie_boardtear_offset_fx_verticle
	Namespace: zm_spawner
	Checksum: 0x507E242D
	Offset: 0x2FF0
	Size: 0x354
	Parameters: 2
	Flags: None
*/
function zombie_boardtear_offset_fx_verticle(chunk, node)
{
	if(isdefined(chunk.script_parameters) && (chunk.script_parameters == "repair_board" || chunk.script_parameters == "board"))
	{
		if(isdefined(chunk.unbroken) && chunk.unbroken == 1)
		{
			if(isdefined(chunk.material) && chunk.material == "glass")
			{
				playfx(level._effect[#"glass_break"], chunk.origin, node.angles);
				chunk.unbroken = 0;
			}
			else
			{
				if(isdefined(chunk.material) && chunk.material == "metal")
				{
					playfx(level._effect[#"fx_zombie_bar_break"], chunk.origin);
					chunk.unbroken = 0;
				}
				else if(isdefined(chunk.material) && chunk.material == "rock")
				{
					if(is_true(level.use_clientside_rock_tearin_fx))
					{
						chunk clientfield::set("tearin_rock_fx", 1);
					}
					else
					{
						playfx(level._effect[#"wall_break"], chunk.origin);
					}
					chunk.unbroken = 0;
				}
			}
		}
	}
	if(isdefined(chunk.script_parameters) && chunk.script_parameters == "barricade_vents")
	{
		if(isdefined(level.use_clientside_board_fx))
		{
			chunk clientfield::set("tearin_board_horizontal_fx", 1);
		}
		else
		{
			playfx(level._effect[#"fx_zombie_bar_break"], chunk.origin);
		}
	}
	else
	{
		if(isdefined(chunk.material) && chunk.material == "rock")
		{
			if(is_true(level.use_clientside_rock_tearin_fx))
			{
				chunk clientfield::set("tearin_rock_fx", 1);
			}
		}
		else
		{
			if(isdefined(level.use_clientside_board_fx))
			{
				chunk clientfield::set("tearin_board_horizontal_fx", 1);
			}
			else
			{
				wait(randomfloatrange(0.2, 0.4));
			}
		}
	}
}

/*
	Name: zombie_bartear_offset_fx_verticle
	Namespace: zm_spawner
	Checksum: 0x2F817070
	Offset: 0x3350
	Size: 0x612
	Parameters: 1
	Flags: None
*/
function zombie_bartear_offset_fx_verticle(chunk)
{
	if(isdefined(chunk.script_parameters) && chunk.script_parameters == "bar" || chunk.script_noteworthy == "board")
	{
		possible_tag_array_1 = [];
		possible_tag_array_1[0] = "Tag_fx_top";
		possible_tag_array_1[1] = "";
		possible_tag_array_1[2] = "Tag_fx_top";
		possible_tag_array_1[3] = "";
		possible_tag_array_2 = [];
		possible_tag_array_2[0] = "";
		possible_tag_array_2[1] = "Tag_fx_bottom";
		possible_tag_array_2[2] = "";
		possible_tag_array_2[3] = "Tag_fx_bottom";
		possible_tag_array_2 = array::randomize(possible_tag_array_2);
		random_fx = [];
		random_fx[0] = level._effect[#"fx_zombie_bar_break"];
		random_fx[1] = level._effect[#"fx_zombie_bar_break_lite"];
		random_fx[2] = level._effect[#"fx_zombie_bar_break"];
		random_fx[3] = level._effect[#"fx_zombie_bar_break_lite"];
		random_fx = array::randomize(random_fx);
		switch(randomint(9))
		{
			case 0:
			{
				playfxontag(level._effect[#"fx_zombie_bar_break_lite"], chunk, "Tag_fx_top");
				wait(randomfloatrange(0, 0.3));
				playfxontag(level._effect[#"fx_zombie_bar_break_lite"], chunk, "Tag_fx_bottom");
				break;
			}
			case 1:
			{
				playfxontag(level._effect[#"fx_zombie_bar_break"], chunk, "Tag_fx_top");
				wait(randomfloatrange(0, 0.3));
				playfxontag(level._effect[#"fx_zombie_bar_break"], chunk, "Tag_fx_bottom");
				break;
			}
			case 2:
			{
				playfxontag(level._effect[#"fx_zombie_bar_break_lite"], chunk, "Tag_fx_top");
				wait(randomfloatrange(0, 0.3));
				playfxontag(level._effect[#"fx_zombie_bar_break"], chunk, "Tag_fx_bottom");
				break;
			}
			case 3:
			{
				playfxontag(level._effect[#"fx_zombie_bar_break"], chunk, "Tag_fx_top");
				wait(randomfloatrange(0, 0.3));
				playfxontag(level._effect[#"fx_zombie_bar_break_lite"], chunk, "Tag_fx_bottom");
				break;
			}
			case 4:
			{
				playfxontag(level._effect[#"fx_zombie_bar_break_lite"], chunk, "Tag_fx_top");
				wait(randomfloatrange(0, 0.3));
				playfxontag(level._effect[#"fx_zombie_bar_break_lite"], chunk, "Tag_fx_bottom");
				break;
			}
			case 5:
			{
				playfxontag(level._effect[#"fx_zombie_bar_break_lite"], chunk, "Tag_fx_top");
				break;
			}
			case 6:
			{
				playfxontag(level._effect[#"fx_zombie_bar_break_lite"], chunk, "Tag_fx_bottom");
				break;
			}
			case 7:
			{
				playfxontag(level._effect[#"fx_zombie_bar_break"], chunk, "Tag_fx_top");
				break;
			}
			case 8:
			{
				playfxontag(level._effect[#"fx_zombie_bar_break"], chunk, "Tag_fx_bottom");
				break;
			}
		}
	}
}

/*
	Name: zombie_bartear_offset_fx_horizontle
	Namespace: zm_spawner
	Checksum: 0x1829711B
	Offset: 0x3970
	Size: 0x4B2
	Parameters: 1
	Flags: None
*/
function zombie_bartear_offset_fx_horizontle(chunk)
{
	if(isdefined(chunk.script_parameters) && chunk.script_parameters == "bar" || chunk.script_noteworthy == "board")
	{
		switch(randomint(10))
		{
			case 0:
			{
				playfxontag(level._effect[#"fx_zombie_bar_break_lite"], chunk, "Tag_fx_left");
				wait(randomfloatrange(0, 0.3));
				playfxontag(level._effect[#"fx_zombie_bar_break_lite"], chunk, "Tag_fx_right");
				break;
			}
			case 1:
			{
				playfxontag(level._effect[#"fx_zombie_bar_break"], chunk, "Tag_fx_left");
				wait(randomfloatrange(0, 0.3));
				playfxontag(level._effect[#"fx_zombie_bar_break"], chunk, "Tag_fx_right");
				break;
			}
			case 2:
			{
				playfxontag(level._effect[#"fx_zombie_bar_break_lite"], chunk, "Tag_fx_left");
				wait(randomfloatrange(0, 0.3));
				playfxontag(level._effect[#"fx_zombie_bar_break"], chunk, "Tag_fx_right");
				break;
			}
			case 3:
			{
				playfxontag(level._effect[#"fx_zombie_bar_break"], chunk, "Tag_fx_left");
				wait(randomfloatrange(0, 0.3));
				playfxontag(level._effect[#"fx_zombie_bar_break_lite"], chunk, "Tag_fx_right");
				break;
			}
			case 4:
			{
				playfxontag(level._effect[#"fx_zombie_bar_break_lite"], chunk, "Tag_fx_left");
				wait(randomfloatrange(0, 0.3));
				playfxontag(level._effect[#"fx_zombie_bar_break_lite"], chunk, "Tag_fx_right");
				break;
			}
			case 5:
			{
				playfxontag(level._effect[#"fx_zombie_bar_break_lite"], chunk, "Tag_fx_left");
				break;
			}
			case 6:
			{
				playfxontag(level._effect[#"fx_zombie_bar_break_lite"], chunk, "Tag_fx_right");
				break;
			}
			case 7:
			{
				playfxontag(level._effect[#"fx_zombie_bar_break"], chunk, "Tag_fx_right");
				break;
			}
			case 8:
			{
				playfxontag(level._effect[#"fx_zombie_bar_break"], chunk, "Tag_fx_right");
				break;
			}
		}
	}
}

/*
	Name: check_zbarrier_piece_for_zombie_inert
	Namespace: zm_spawner
	Checksum: 0x18C8D751
	Offset: 0x3E30
	Size: 0x8C
	Parameters: 3
	Flags: None
*/
function check_zbarrier_piece_for_zombie_inert(chunk_index, zbarrier, zombie)
{
	zombie endon(#"completed_emerging_into_playable_area");
	zombie waittill(#"stop_zombie_goto_entrance");
	if(zbarrier getzbarrierpiecestate(chunk_index) == "targetted_by_zombie")
	{
		zbarrier setzbarrierpiecestate(chunk_index, "closed");
	}
}

/*
	Name: check_zbarrier_piece_for_zombie_death
	Namespace: zm_spawner
	Checksum: 0xBF91AB2E
	Offset: 0x3EC8
	Size: 0x98
	Parameters: 3
	Flags: Linked
*/
function check_zbarrier_piece_for_zombie_death(chunk_index, zbarrier, zombie)
{
	while(true)
	{
		if(zbarrier getzbarrierpiecestate(chunk_index) != "targetted_by_zombie")
		{
			return;
		}
		if(!isdefined(zombie) || !isalive(zombie))
		{
			zbarrier setzbarrierpiecestate(chunk_index, "closed");
			return;
		}
		waitframe(1);
	}
}

/*
	Name: check_for_zombie_death
	Namespace: zm_spawner
	Checksum: 0x17FD11E5
	Offset: 0x3F68
	Size: 0x44
	Parameters: 1
	Flags: None
*/
function check_for_zombie_death(zombie)
{
	self endon(#"destroyed");
	wait(2.5);
	self zm_blockers::update_states("repaired");
}

/*
	Name: player_can_score_from_zombies
	Namespace: zm_spawner
	Checksum: 0x9262C99C
	Offset: 0x3FB8
	Size: 0x30
	Parameters: 0
	Flags: Linked
*/
function player_can_score_from_zombies()
{
	if(isdefined(self) && is_true(self.inhibit_scoring_from_zombies))
	{
		return false;
	}
	return true;
}

/*
	Name: zombie_death_points
	Namespace: zm_spawner
	Checksum: 0x86D9AB58
	Offset: 0x3FF0
	Size: 0x2A8
	Parameters: 8
	Flags: None
*/
function zombie_death_points(origin, mod, hit_location, attacker, inflictor, zombie, team, weapon)
{
	if(!isdefined(attacker) || (!isplayer(attacker) && !isplayer(attacker.owner)))
	{
		return;
	}
	if(isdefined(attacker.owner))
	{
		player = attacker.owner;
	}
	else
	{
		player = attacker;
	}
	if(!player player_can_score_from_zombies())
	{
		zombie.marked_for_recycle = 1;
		return;
	}
	zombie thread zm_powerups::function_b753385f(weapon);
	if(is_true(zombie.deathpoints_already_given))
	{
		return;
	}
	zombie.deathpoints_already_given = 1;
	if(zm_equipment::is_equipment(zombie.damageweapon))
	{
		return;
	}
	death_weapon = player.currentweapon;
	if(isdefined(zombie.damageweapon))
	{
		death_weapon = zombie.damageweapon;
	}
	str_event = "death";
	if(isdefined(player))
	{
		if(inflictor.var_9fde8624 === #"zombie_wolf_ally")
		{
			zombie.var_12745932 = 1;
		}
		if(is_true(zombie.var_69a981e6))
		{
			if(isdefined(zombie.var_6a4ce3f7))
			{
				player zm_score::add_to_player_score(zombie.var_6a4ce3f7, 1, "", zombie.var_12745932);
			}
			else
			{
				player zm_score::add_to_player_score(50, 1, "", zombie.var_12745932);
			}
		}
		player zm_score::player_add_points(str_event, mod, hit_location, zombie, team, death_weapon, undefined, zombie.var_12745932);
	}
	if(isdefined(level.hero_power_update))
	{
		level thread [[level.hero_power_update]](player, zombie, str_event);
	}
}

/*
	Name: zombie_ragdoll_then_explode
	Namespace: zm_spawner
	Checksum: 0xCEC96129
	Offset: 0x42A0
	Size: 0x164
	Parameters: 2
	Flags: None
*/
function zombie_ragdoll_then_explode(launchvector, attacker)
{
	if(!isdefined(self))
	{
		return;
	}
	self clientfield::set("zombie_ragdoll_explode", 1);
	self notify(#"exploding");
	self notify(#"end_melee");
	self notify(#"death", attacker);
	self.dont_die_on_me = 1;
	self.exploding = 1;
	self.a.nodeath = 1;
	self.dont_throw_gib = 1;
	self startragdoll();
	self setplayercollision(0);
	self zombie_utility::reset_attack_spot();
	if(isdefined(launchvector))
	{
		self launchragdoll(launchvector);
	}
	wait(2.1);
	if(isdefined(self))
	{
		self ghost();
		self util::delay(0.25, undefined, &zm_utility::self_delete);
	}
}

/*
	Name: zombie_death_animscript
	Namespace: zm_spawner
	Checksum: 0x634094E9
	Offset: 0x4410
	Size: 0x28A
	Parameters: 8
	Flags: Linked
*/
function zombie_death_animscript(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime)
{
	team = undefined;
	if(isdefined(self._race_team))
	{
		team = self._race_team;
	}
	self zombie_utility::reset_attack_spot();
	if(self check_zombie_death_animscript_callbacks())
	{
		return false;
	}
	if(isdefined(level.zombie_death_animscript_override))
	{
		self [[level.zombie_death_animscript_override]]();
	}
	self.grenadeammo = 0;
	if(is_true(self.nuked))
	{
		self thread zm_powerups::function_b753385f(psoffsettime);
	}
	else
	{
		if(isdefined(shitloc.owner))
		{
			player = self.attacker.owner;
		}
		else
		{
			player = self.attacker;
		}
		if(isdefined(player) && isplayer(player))
		{
			if(player player_can_score_from_zombies())
			{
				self thread zm_powerups::function_b753385f(psoffsettime);
			}
			else
			{
				self.marked_for_recycle = 1;
			}
		}
	}
	if(isdefined(self.attacker) && isai(self.attacker))
	{
		self.attacker notify(#"killed", {#victim:self});
	}
	if(self.damagemod == "MOD_BURNED" || is_true(self.var_b364c165) && self.archetype === #"zombie")
	{
		self thread flame_corpse_fx();
	}
	if(self.damagemod == "MOD_GRENADE" || self.damagemod == "MOD_GRENADE_SPLASH")
	{
		level notify(#"zombie_grenade_death", self.origin);
	}
	return false;
}

/*
	Name: check_zombie_death_animscript_callbacks
	Namespace: zm_spawner
	Checksum: 0xA348312B
	Offset: 0x46A8
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function check_zombie_death_animscript_callbacks()
{
	if(!isdefined(level.zombie_death_animscript_callbacks))
	{
		return false;
	}
	for(i = 0; i < level.zombie_death_animscript_callbacks.size; i++)
	{
		if(self [[level.zombie_death_animscript_callbacks[i]]]())
		{
			return true;
		}
	}
	return false;
}

/*
	Name: register_zombie_death_animscript_callback
	Namespace: zm_spawner
	Checksum: 0x39F59969
	Offset: 0x4718
	Size: 0x44
	Parameters: 1
	Flags: None
*/
function register_zombie_death_animscript_callback(func)
{
	if(!isdefined(level.zombie_death_animscript_callbacks))
	{
		level.zombie_death_animscript_callbacks = [];
	}
	level.zombie_death_animscript_callbacks[level.zombie_death_animscript_callbacks.size] = func;
}

/*
	Name: flame_corpse_fx
	Namespace: zm_spawner
	Checksum: 0x487BD52F
	Offset: 0x4768
	Size: 0x1B0
	Parameters: 0
	Flags: Linked, Private
*/
function private flame_corpse_fx()
{
	if(!isdefined(level.var_d39e8272))
	{
		level.var_d39e8272 = 0;
	}
	if(level.var_d39e8272 > 8)
	{
		return;
	}
	if(isdefined(self.var_fa03f342))
	{
		str_clientfield = self.var_fa03f342;
	}
	else
	{
		str_clientfield = "flame_corpse_fx";
	}
	self clientfield::set(str_clientfield, 1);
	s_result = undefined;
	s_result = self waittilltimeout(10, #"actor_corpse", #"deleted");
	if(isdefined(self))
	{
		self clientfield::set(str_clientfield, 0);
	}
	if(s_result._notify == "actor_corpse")
	{
		if(isdefined(s_result.corpse))
		{
			e_corpse = s_result.corpse;
			e_corpse thread function_2cc66();
			e_corpse clientfield::set(str_clientfield, 1);
			e_corpse waittilltimeout(randomfloatrange(1.5, 6), #"death");
			if(isdefined(e_corpse))
			{
				e_corpse clientfield::set(str_clientfield, 0);
				e_corpse notify(#"hash_244b83097f062847");
			}
		}
	}
}

/*
	Name: function_2cc66
	Namespace: zm_spawner
	Checksum: 0xD8DA6CC6
	Offset: 0x4920
	Size: 0x50
	Parameters: 0
	Flags: Linked, Private
*/
function private function_2cc66()
{
	level.var_d39e8272++;
	s_result = undefined;
	s_result = self waittill(#"death", #"hash_244b83097f062847");
	level.var_d39e8272--;
}

/*
	Name: damage_on_fire
	Namespace: zm_spawner
	Checksum: 0x4FB9132C
	Offset: 0x4978
	Size: 0x1D8
	Parameters: 2
	Flags: Linked
*/
function damage_on_fire(player, weapon)
{
	self endon(#"death", #"stop_flame_damage");
	wait(2);
	while(is_true(self.is_on_fire))
	{
		if(level.round_number < 6)
		{
			dmg = level.zombie_health * randomfloatrange(0.2, 0.3);
		}
		else
		{
			if(level.round_number < 9)
			{
				dmg = level.zombie_health * randomfloatrange(0.15, 0.25);
			}
			else
			{
				if(level.round_number < 11)
				{
					dmg = level.zombie_health * randomfloatrange(0.1, 0.2);
				}
				else
				{
					dmg = level.zombie_health * randomfloatrange(0.1, 0.15);
				}
			}
		}
		if(isalive(player))
		{
			self dodamage(dmg, self.origin, player, player, undefined, "MOD_BURNED", 0, weapon);
		}
		else
		{
			self dodamage(dmg, self.origin);
		}
		wait(randomfloatrange(1, 3));
	}
}

/*
	Name: player_using_hi_score_weapon
	Namespace: zm_spawner
	Checksum: 0xEE2FB81A
	Offset: 0x4B58
	Size: 0x68
	Parameters: 1
	Flags: None
*/
function player_using_hi_score_weapon(player)
{
	if(isplayer(player))
	{
		weapon = player getcurrentweapon();
		return weapon == level.weaponnone || weapon.issemiauto;
	}
	return 0;
}

/*
	Name: register_zombie_damage_callback
	Namespace: zm_spawner
	Checksum: 0x3365C352
	Offset: 0x4BC8
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function register_zombie_damage_callback(func)
{
	/#
		assertmsg("");
	#/
}

/*
	Name: zombie_flame_damage
	Namespace: zm_spawner
	Checksum: 0x97E613AE
	Offset: 0x4C00
	Size: 0x144
	Parameters: 3
	Flags: None
*/
function zombie_flame_damage(mod, player, weapon)
{
	if(mod == "MOD_BURNED")
	{
		if(!is_true(self.is_on_fire))
		{
			self thread damage_on_fire(player, weapon);
		}
		do_flame_death = 1;
		ai = getaiteamarray(level.zombie_team);
		for(i = 0; i < ai.size; i++)
		{
			if(isdefined(ai[i].is_on_fire) && ai[i].is_on_fire)
			{
				if(distancesquared(ai[i].origin, self.origin) < 10000)
				{
					do_flame_death = 0;
					break;
				}
			}
		}
		if(do_flame_death)
		{
			self thread zombie_death::flame_death_fx();
		}
		return true;
	}
	return false;
}

/*
	Name: is_weapon_shotgun
	Namespace: zm_spawner
	Checksum: 0x9A576CB9
	Offset: 0x4D50
	Size: 0x20
	Parameters: 1
	Flags: Linked
*/
function is_weapon_shotgun(weapon)
{
	return weapon.weapclass == "spread";
}

/*
	Name: function_58084b96
	Namespace: zm_spawner
	Checksum: 0x79AF1B81
	Offset: 0x4D78
	Size: 0x1BA
	Parameters: 3
	Flags: Linked
*/
function function_58084b96(hitloc, weapon, var_fd90b0bb)
{
	var_c3317960 = gibserverutils::function_de4d9d(weapon, var_fd90b0bb);
	if(isdefined(hitloc))
	{
		switch(hitloc)
		{
			case "head":
			case "helmet":
			{
				gibserverutils::gibhead(self, var_c3317960);
				break;
			}
			case "right_arm_lower":
			case "right_arm_upper":
			case "right_hand":
			{
				gibserverutils::gibrightarm(self, var_c3317960);
				break;
			}
			case "left_arm_lower":
			case "left_arm_upper":
			case "left_hand":
			{
				gibserverutils::gibleftarm(self, var_c3317960);
				break;
			}
			case "right_leg_upper":
			case "right_leg_lower":
			case "right_foot":
			{
				gibserverutils::gibrightleg(self, var_c3317960);
				break;
			}
			case "left_leg_lower":
			case "left_foot":
			case "left_leg_upper":
			{
				gibserverutils::gibleftleg(self, var_c3317960);
				break;
			}
		}
	}
}

/*
	Name: zombie_explodes_intopieces
	Namespace: zm_spawner
	Checksum: 0xCE580368
	Offset: 0x4F40
	Size: 0x154
	Parameters: 1
	Flags: Linked
*/
function zombie_explodes_intopieces(random_gibs)
{
	if(is_true(self.no_gib))
	{
		return;
	}
	if(isdefined(self) && isactor(self))
	{
		if(!random_gibs || randomint(100) < 50)
		{
			gibserverutils::gibhead(self, 0);
		}
		if(!random_gibs || randomint(100) < 50)
		{
			gibserverutils::gibleftarm(self, 0);
		}
		if(!random_gibs || randomint(100) < 50)
		{
			gibserverutils::gibrightarm(self, 0);
		}
		if(!random_gibs || randomint(100) < 50)
		{
			gibserverutils::giblegs(self, 0);
		}
	}
}

/*
	Name: zombie_death_event
	Namespace: zm_spawner
	Checksum: 0x73C5E07D
	Offset: 0x50A0
	Size: 0x1094
	Parameters: 1
	Flags: Linked
*/
function zombie_death_event(zombie)
{
	zombie.marked_for_recycle = 0;
	force_head_gib = 0;
	waitresult = undefined;
	waitresult = zombie waittill(#"death");
	attacker = waitresult.attacker;
	time_of_death = gettime();
	if(isdefined(zombie))
	{
		zombie stopsounds();
	}
	if(isdefined(zombie) && isdefined(zombie.marked_for_insta_upgraded_death))
	{
		force_head_gib = 1;
	}
	if(isdefined(zombie) && !isdefined(zombie.damagehit_origin) && isdefined(attacker) && isalive(attacker) && !isvehicle(attacker))
	{
		zombie.damagehit_origin = attacker getweaponmuzzlepoint();
	}
	if(isdefined(attacker) && isplayer(attacker) && attacker player_can_score_from_zombies())
	{
		if(isdefined(zombie.script_parameters))
		{
			attacker notify(#"zombie_death_params", {#hash_3ef38c68:is_true(zombie.completed_emerging_into_playable_area), #params:zombie.script_parameters});
		}
		if(isdefined(zombie.b_widows_wine_cocoon) && isdefined(zombie.e_widows_wine_player))
		{
			attacker notify(#"widows_wine_kill", {#player:zombie.e_widows_wine_player});
		}
		if(isdefined(zombie) && isdefined(zombie.damagelocation))
		{
			if(zombie zm_utility::is_headshot(zombie.damageweapon, zombie.damagelocation, zombie.damagemod))
			{
				attacker.headshots++;
				attacker zm_stats::increment_client_stat("headshots");
				attacker stats::function_e24eec31(zombie.damageweapon, #"headshots", 1);
				attacker zm_stats::increment_player_stat("headshots");
				attacker zm_stats::function_7bc347f6("headshots");
				attacker zm_stats::function_f1a1191d("headshots");
				attacker zm_stats::function_2726a7c2("headshots");
				attacker zm_stats::function_3468f864("headshots");
				attacker zm_stats::increment_challenge_stat(#"zombie_hunter_kill_headshot");
				attacker zm_stats::function_8f10788e("boas_headshots");
				attacker zm_stats::registerchand_grow_("headshots");
				attacker thread activecamo::function_896ac347(zombie.damageweapon, #"headshots", 1);
				attacker zm_camos::function_432cf6d(zombie.damageweapon);
			}
			else
			{
				attacker notify(#"zombie_death_no_headshot");
			}
			if(zombie zm_utility::function_4562a3ef(zombie.damagelocation))
			{
				attacker zm_stats::function_7bc347f6("kills_critical");
				attacker zm_stats::function_f1a1191d("kills_critical");
				if(isdefined(zombie.damageweapon))
				{
					attacker stats::function_e24eec31(zombie.damageweapon, #"hash_3fb0eb36aeb3b74e", 1);
				}
			}
		}
		if(isdefined(zombie) && isdefined(zombie.damagemod) && zombie.damagemod == "MOD_MELEE" && isdefined(zombie.damageweapon) && !zm_loadout::is_hero_weapon(zombie.damageweapon))
		{
			attacker zm_stats::increment_client_stat("melee_kills");
			attacker zm_stats::increment_player_stat("melee_kills");
			attacker notify(#"melee_kill");
			attacker zm_stats::function_8f10788e("boas_melee_kills");
			/#
				println("");
			#/
		}
		if(zombie.var_6f84b820 === #"elite")
		{
			var_a8dede81 = 1;
			if(isarray(zombie.var_e293f8ac))
			{
				function_1eaaceab(zombie.var_e293f8ac);
				var_a8dede81 = zombie.var_e293f8ac.size == 0;
			}
			if(is_true(var_a8dede81))
			{
				attacker zm_stats::increment_client_stat(#"hash_6013bccb7a4274b6");
				attacker zm_stats::function_7bc347f6(#"hash_6013bccb7a4274b6");
				attacker zm_stats::function_f1a1191d(#"hash_6013bccb7a4274b6");
				if(isdefined(zombie.damageweapon))
				{
					attacker stats::function_e24eec31(zombie.damageweapon, #"hash_45814ac55657fc62", 1);
				}
			}
		}
		attacker demo::add_actor_bookmark_kill_time();
		attacker.kills++;
		attacker zm_stats::increment_client_stat("kills");
		attacker zm_stats::increment_player_stat("kills");
		attacker zm_stats::function_7bc347f6("kills");
		attacker zm_stats::function_3468f864("kills");
		attacker zm_stats::function_f1a1191d("kills");
		attacker zm_stats::function_2726a7c2("kills");
		attacker zm_stats::function_8f10788e("boas_kills");
		attacker zm_stats::registerchand_grow_("kills");
		if(isdefined(zombie) && isdefined(zombie.damageweapon))
		{
			attacker stats::function_e24eec31(zombie.damageweapon, #"kills", 1);
			attacker thread activecamo::function_896ac347(zombie.damageweapon, #"kills", 1);
			attacker zm_camos::function_7b29c2d2(zombie.damageweapon);
			attacker zm_stats::function_ef7d5199(zombie, zombie.damageweapon);
		}
		if(force_head_gib)
		{
			zombie zombie_utility::zombie_head_gib();
		}
	}
	if(!isdefined(zombie))
	{
		return;
	}
	if(isplayer(attacker) && isdefined(attacker.n_health_on_kill))
	{
		attacker.health = attacker.health + attacker.n_health_on_kill;
		if(attacker.health >= attacker.maxhealth)
		{
			attacker zm_utility::set_max_health(1);
		}
	}
	if(is_true(zombie.nuked))
	{
		foreach(player in function_a1ef346b())
		{
			if(!isdefined(player))
			{
				continue;
			}
			if(isdefined(player.n_health_on_kill))
			{
				player.health = player.health + player.n_health_on_kill;
				if(player.health >= player.maxhealth)
				{
					player zm_utility::set_max_health(1);
				}
			}
		}
	}
	level.global_zombies_killed++;
	if(isdefined(zombie.marked_for_death) && !isdefined(zombie.nuked))
	{
		level.zombie_trap_killed_count++;
	}
	zombie check_zombie_death_event_callbacks(attacker);
	zombie bgb::actor_death_override(attacker);
	if(!isdefined(zombie))
	{
		return;
	}
	name = zombie.animname;
	if(isdefined(zombie.sndname))
	{
		name = zombie.sndname;
	}
	function_6eac4ca1(zombie, "death");
	self notify(#"bhtn_action_notify", {#action:"death"});
	if(isactor(zombie))
	{
		if(is_true(zombie.damageweapon.dogibbing))
		{
			if(zombie.damagemod === "MOD_GRENADE_SPLASH" || zombie.damagemod === "MOD_GRENADE" || zombie.damagemod === "MOD_EXPLOSIVE" || zombie.damagemod === "MOD_PROJECTILE_SPLASH")
			{
				var_a55c6d0f = (zombie.maxhealth / (zombie.health + zombie.damagetaken)) * 10;
				if(randomint(100) < var_a55c6d0f)
				{
					if(is_true(zombie.var_b69c12bc) && !is_true(zombie.is_on_fire) && !is_true(zombie.guts_explosion))
					{
						zombie thread zombie_utility::zombie_gut_explosion();
					}
				}
				else
				{
					zombie zombie_explodes_intopieces(1);
				}
			}
			else
			{
				zombie function_58084b96(zombie.damagelocation, waitresult.weapon, waitresult.var_fd90b0bb);
			}
		}
		else if(is_true(zombie.damageweapon.doannihilate) || (is_weapon_shotgun(zombie.damageweapon) && zm_weapons::is_weapon_upgraded(zombie.damageweapon)) || zm_loadout::is_placeable_mine(zombie.damageweapon) || (zombie.damagemod === "MOD_GRENADE" || zombie.damagemod === "MOD_GRENADE_SPLASH" || zombie.damagemod === "MOD_EXPLOSIVE"))
		{
			if(is_true(zombie.damageweapon.doannihilate) || (isdefined(zombie.damagehit_origin) && distancesquared(zombie.origin, zombie.damagehit_origin) < (180 * 180)))
			{
				tag = "J_SpineLower";
				if(is_true(zombie.isdog))
				{
					tag = "tag_origin";
				}
				if(is_true(zombie.var_b69c12bc) && !is_true(zombie.is_on_fire) && !is_true(zombie.guts_explosion))
				{
					zombie thread zombie_utility::zombie_gut_explosion();
				}
			}
		}
		if(zombie.damagemod === "MOD_GRENADE" || zombie.damagemod === "MOD_GRENADE_SPLASH")
		{
			if(isdefined(attacker) && isalive(attacker) && isplayer(attacker))
			{
				attacker.grenade_multikill_count++;
			}
		}
	}
	if(!is_true(zombie.has_been_damaged_by_player) && is_true(zombie.marked_for_recycle))
	{
		level.zombie_total++;
		level.zombie_total_subtract++;
	}
	else
	{
		if(isdefined(zombie.attacker) && isplayer(zombie.attacker))
		{
			level.zombie_player_killed_count++;
			zombie.attacker notify(#"zom_kill", {#zombie:zombie}, isdefined(zombie.sound_damage_player) && zombie.sound_damage_player == zombie.attacker);
		}
		else if(zombie.ignoreall && !is_true(zombie.marked_for_death))
		{
			level.zombies_timeout_spawn++;
		}
	}
	level notify(#"zom_kill");
	level.total_zombies_killed++;
}

/*
	Name: check_zombie_death_event_callbacks
	Namespace: zm_spawner
	Checksum: 0x68881B80
	Offset: 0x6140
	Size: 0x62
	Parameters: 1
	Flags: Linked
*/
function check_zombie_death_event_callbacks(attacker)
{
	if(!isdefined(level.zombie_death_event_callbacks))
	{
		return;
	}
	for(i = 0; i < level.zombie_death_event_callbacks.size; i++)
	{
		self [[level.zombie_death_event_callbacks[i]]](attacker);
	}
}

/*
	Name: register_zombie_death_event_callback
	Namespace: zm_spawner
	Checksum: 0xA4EA3623
	Offset: 0x61B0
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function register_zombie_death_event_callback(func)
{
	if(!isdefined(level.zombie_death_event_callbacks))
	{
		level.zombie_death_event_callbacks = [];
	}
	level.zombie_death_event_callbacks[level.zombie_death_event_callbacks.size] = func;
}

/*
	Name: deregister_zombie_death_event_callback
	Namespace: zm_spawner
	Checksum: 0xB18BEC87
	Offset: 0x6200
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function deregister_zombie_death_event_callback(func)
{
	if(isdefined(level.zombie_death_event_callbacks))
	{
		arrayremovevalue(level.zombie_death_event_callbacks, func);
	}
}

/*
	Name: attractors_generated_listener
	Namespace: zm_spawner
	Checksum: 0x535F3E1
	Offset: 0x6248
	Size: 0x6E
	Parameters: 0
	Flags: None
*/
function attractors_generated_listener()
{
	self endon(#"death", #"stop_find_flesh", #"path_timer_done");
	level endon(#"intermission");
	level waittill(#"attractor_positions_generated");
	self.zombie_path_timer = 0;
}

/*
	Name: zombie_history
	Namespace: zm_spawner
	Checksum: 0x282CB3FD
	Offset: 0x62C0
	Size: 0x58
	Parameters: 1
	Flags: None
*/
function zombie_history(msg)
{
	/#
		if(!isdefined(self.zombie_history) || 32 <= self.zombie_history.size)
		{
			self.zombie_history = [];
		}
		self.zombie_history[self.zombie_history.size] = msg;
	#/
}

/*
	Name: filter_spawn_points
	Namespace: zm_spawner
	Checksum: 0x19D2672B
	Offset: 0x6320
	Size: 0x50
	Parameters: 3
	Flags: None
*/
function filter_spawn_points(point, player, player_dir)
{
	if(vectordot(point.origin - player.origin, player_dir) > 0)
	{
		return true;
	}
	return false;
}

/*
	Name: function_dce9f1a6
	Namespace: zm_spawner
	Checksum: 0x40F735E
	Offset: 0x6378
	Size: 0xA24
	Parameters: 1
	Flags: Linked
*/
function function_dce9f1a6(spots)
{
	pixbeginevent();
	players = getplayers();
	var_1cb510f7 = [];
	foreach(player in players)
	{
		current_zone = player.cached_zone;
		if(!isdefined(current_zone))
		{
			current_zone = player zm_utility::get_current_zone(1);
		}
		var_1cb510f7[player getentitynumber()] = {#zone:current_zone, #valid:zombie_utility::is_player_valid(player, 1, 1), #count:0, #player:player};
	}
	zombies = getaiteamarray(level.zombie_team);
	arrayremovevalue(zombies, undefined);
	foreach(zombie in zombies)
	{
		if(!isdefined(zombie) || !isalive(zombie))
		{
			continue;
		}
		if(isdefined(zombie.last_closest_player) && !isplayer(zombie.last_closest_player))
		{
			continue;
		}
		if(isdefined(zombie.last_closest_player))
		{
			var_7871921b = zombie.last_closest_player getentitynumber();
			if(!is_true(zombie.need_closest_player) && isdefined(var_1cb510f7[var_7871921b]) && is_true(var_1cb510f7[var_7871921b].valid))
			{
				var_1cb510f7[var_7871921b].count++;
				continue;
			}
		}
		if(is_true(zombie.completed_emerging_into_playable_area))
		{
			zone_name = zombie zm_utility::get_current_zone();
		}
		else if(isdefined(zombie.spawn_point))
		{
			zone_name = zombie.spawn_point.zone_name;
		}
		if(!isdefined(zone_name))
		{
			continue;
		}
		foreach(info in var_1cb510f7)
		{
			if(!is_true(info.valid))
			{
				continue;
			}
			if(!isdefined(info.zone))
			{
				continue;
			}
			var_e6217dda = getarraykeys(info.zone.adjacent_zones);
			if(zone_name == info.zone.name || isinarray(var_e6217dda, hash(zone_name)))
			{
				info.count++;
			}
		}
	}
	pixendevent();
	waitframe(1);
	pixbeginevent();
	var_e48372c9 = 2147483647;
	foreach(info in var_1cb510f7)
	{
		if(info.valid && info.count < var_e48372c9)
		{
			var_e48372c9 = info.count;
			player_info = info;
		}
	}
	a_candidates = [];
	if(isdefined(player_info) && isdefined(player_info.player))
	{
		v_player_dir = player_info.player zm_quick_spawning::function_c5ea0b0();
		if(lengthsquared(v_player_dir) > 0)
		{
			zones = zm_quick_spawning::function_f1ec5df(player_info.player, v_player_dir, 1);
			for(i = 0; i < spots.size; i++)
			{
				if(isdefined(spots[i].var_d51f4e2d) && (gettime() - spots[i].var_d51f4e2d) < 3000)
				{
					continue;
				}
				if(isdefined(player_info.zone) && spots[i].zone_name === player_info.zone.name)
				{
					if(!isdefined(a_candidates))
					{
						a_candidates = [];
					}
					else if(!isarray(a_candidates))
					{
						a_candidates = array(a_candidates);
					}
					a_candidates[a_candidates.size] = spots[i];
					continue;
				}
				var_6ed4ea9 = 0;
				foreach(zone in zones)
				{
					var_e6217dda = getarraykeys(zone.adjacent_zones);
					if(zone.name === spots[i].zone_name || (isstring(spots[i].zone_name) && isinarray(var_e6217dda, hash(spots[i].zone_name))))
					{
						if(!isdefined(a_candidates))
						{
							a_candidates = [];
						}
						else if(!isarray(a_candidates))
						{
							a_candidates = array(a_candidates);
						}
						a_candidates[a_candidates.size] = spots[i];
						var_6ed4ea9 = 1;
						break;
					}
				}
				if(var_6ed4ea9)
				{
					continue;
				}
				if(vectordot(spots[i].origin - player_info.player.origin, v_player_dir) > 0)
				{
					if(!isdefined(a_candidates))
					{
						a_candidates = [];
					}
					else if(!isarray(a_candidates))
					{
						a_candidates = array(a_candidates);
					}
					a_candidates[a_candidates.size] = spots[i];
				}
			}
		}
		/#
			if((getdvarint(#"hash_72ad1fcf80c5738d", -1)) > -1 && (level.players[getdvarint(#"hash_72ad1fcf80c5738d", -1)]) == player_info.player)
			{
				foreach(index, spot in a_candidates)
				{
					record3dtext(index, spot.origin, (0, 1, 0));
				}
			}
		#/
	}
	pixendevent();
	player = undefined;
	if(isdefined(player_info))
	{
		player = player_info.player;
	}
	return {#player:player, #spot:array::random(a_candidates)};
}

/*
	Name: function_3f416d76
	Namespace: zm_spawner
	Checksum: 0x16CC9162
	Offset: 0x6DA8
	Size: 0x2B8
	Parameters: 2
	Flags: Linked
*/
function function_3f416d76(player, &points)
{
	spots = [];
	max_dot = 0;
	look_loc = undefined;
	foreach(loc in points)
	{
		player_vec = vectornormalize(anglestoforward(player getplayerangles()));
		player_vec_2d = (player_vec[0], player_vec[1], 0);
		player_spawn = vectornormalize(loc.origin - player.origin);
		player_spawn_2d = (player_spawn[0], player_spawn[1], 0);
		dot = vectordot(player_vec_2d, player_spawn_2d);
		dist = distance(loc.origin, player.origin);
		if(dot > 0.707 && dist <= getdvarint(#"scr_zombie_spawn_in_view_dist", 0))
		{
			if(dot > max_dot)
			{
				look_loc = loc;
				max_dot = dot;
			}
			/#
				debugstar(loc.origin, 1000, (1, 1, 1));
			#/
		}
	}
	if(isdefined(look_loc))
	{
		spots[spots.size] = look_loc;
		/#
			debugstar(look_loc.origin, 1000, (0, 1, 0));
		#/
	}
	if(spots.size <= 0)
	{
		spots[spots.size] = level.zm_loc_types[#"zombie_location"][0];
		iprintln("no spawner in view");
	}
	return spots;
}

/*
	Name: do_zombie_spawn
	Namespace: zm_spawner
	Checksum: 0x6601C20C
	Offset: 0x7068
	Size: 0x978
	Parameters: 0
	Flags: Linked
*/
function do_zombie_spawn()
{
	self endon(#"death");
	spots = [];
	if(isdefined(self._rise_spot))
	{
		spot = self._rise_spot;
		self thread do_zombie_rise(spot);
		return;
	}
	if(is_true(level.use_multiple_spawns) && isdefined(self.script_int))
	{
		foreach(loc in level.zm_loc_types[#"zombie_location"])
		{
			if(!(isdefined(level.spawner_int) && level.spawner_int == self.script_int) && (!(isdefined(loc.script_int) || isdefined(level.zones[loc.zone_name].script_int))))
			{
				continue;
			}
			if(isdefined(loc.script_int) && loc.script_int != self.script_int)
			{
				continue;
			}
			else if(isdefined(level.zones[loc.zone_name].script_int) && level.zones[loc.zone_name].script_int != self.script_int)
			{
				continue;
			}
			spots[spots.size] = loc;
		}
	}
	else
	{
		spots = level.zm_loc_types[#"zombie_location"];
	}
	if(getdvarint(#"scr_zombie_spawn_in_view", 0))
	{
		player = getplayers()[0];
		spots = function_3f416d76(player, level.zm_loc_types[#"zombie_location"]);
	}
	if(spots.size == 0)
	{
		if(!level util::function_88c74107() && !level.gameended)
		{
			/#
				println((("" + function_9e72a96(self.archetype)) + "") + (isdefined(self.script_int) ? self.script_int : "") + "");
				println("" + (isdefined(level.spawner_int) ? level.spawner_int : ""));
				println("");
				foreach(zone_name in zm_zonemgr::get_active_zone_names())
				{
					var_f888a944 = [];
					foreach(array in level.zones[zone_name].a_loc_types)
					{
						foreach(spot in array)
						{
							if(isdefined(spot.script_int))
							{
								if(!isdefined(var_f888a944))
								{
									var_f888a944 = [];
								}
								else if(!isarray(var_f888a944))
								{
									var_f888a944 = array(var_f888a944);
								}
								if(!isinarray(var_f888a944, spot.script_int))
								{
									var_f888a944[var_f888a944.size] = spot.script_int;
								}
							}
						}
					}
					println(zone_name + "");
					foreach(script_int in var_f888a944)
					{
						println(script_int);
					}
				}
				var_6644055d = 0;
				for(i = 0; i < level.zone_keys.size; i++)
				{
					if(level.zones[level.zone_keys[i]].is_spawning_allowed)
					{
						var_6644055d = 1;
						spots = level.zones[level.zone_keys[i]].a_loc_types[#"zombie_location"];
						break;
					}
				}
				if(!var_6644055d)
				{
					/#
						assertmsg("");
					#/
				}
			#/
		}
		if(!isdefined(var_6644055d))
		{
			spots = struct::get_array("spawn_location", "script_noteworthy");
		}
	}
	spot = function_20e7d186(spots);
	spot.var_d51f4e2d = gettime();
	self.spawn_point = spot;
	/#
		if(getdvarint(#"zombiemode_debug_zones", 0))
		{
			level.zones[spot.zone_name].total_spawn_count++;
			level.zones[spot.zone_name].round_spawn_count++;
			self.zone_spawned_from = spot.zone_name;
			self thread draw_zone_spawned_from();
		}
	#/
	/#
		if(is_true(level.toggle_show_spawn_locations))
		{
			debugstar(spot.origin, getdvarint(#"scr_spawner_location_time", 0), (0, 1, 0));
			host_player = util::gethostplayer();
			distance = distance(spot.origin, host_player.origin);
			iprintln(("" + (distance / 12)) + "");
		}
	#/
	if(isdefined(spot.var_c078a32) && getdvarint(#"hash_24e49958fe736182", 0) && (is_true(self.var_a9b2d989) || (isdefined(level.var_d4a79133) && level.var_d4a79133 > 0)) && isdefined(level.var_322d0819))
	{
		self thread [[level.var_322d0819]](spot, spot.var_c078a32);
	}
	else if(isdefined(level.move_spawn_func))
	{
		self thread [[level.move_spawn_func]](spot);
	}
}

/*
	Name: function_20e7d186
	Namespace: zm_spawner
	Checksum: 0x959A148E
	Offset: 0x79E8
	Size: 0x12A
	Parameters: 1
	Flags: Linked
*/
function function_20e7d186(var_493c4730)
{
	/#
		assert(var_493c4730.size > 0, "");
	#/
	if(getdvarint(#"hash_32f24948d4a09f0e", 1))
	{
		spawn_info = function_dce9f1a6(var_493c4730);
		var_cf6e6a44 = spawn_info.spot;
		if(isdefined(var_cf6e6a44))
		{
			var_cf6e6a44.var_c078a32 = spawn_info.player;
		}
	}
	else if(isdefined(level.zm_custom_spawn_location_selection))
	{
		var_cf6e6a44 = [[level.zm_custom_spawn_location_selection]](var_493c4730);
	}
	if(!isdefined(var_cf6e6a44))
	{
		var_cf6e6a44 = function_65439499(array::randomize(var_493c4730));
		if(!isdefined(var_cf6e6a44))
		{
			var_cf6e6a44 = array::random(var_493c4730);
		}
	}
	return var_cf6e6a44;
}

/*
	Name: function_65439499
	Namespace: zm_spawner
	Checksum: 0x6E45C28D
	Offset: 0x7B20
	Size: 0xC0
	Parameters: 2
	Flags: Linked
*/
function function_65439499(spawn_points, var_12af83a0)
{
	if(!isdefined(var_12af83a0))
	{
		var_12af83a0 = 5000;
	}
	foreach(point in spawn_points)
	{
		if(isdefined(point.var_d51f4e2d) && (gettime() - point.var_d51f4e2d) > var_12af83a0)
		{
			return point;
		}
	}
	return undefined;
}

/*
	Name: draw_zone_spawned_from
	Namespace: zm_spawner
	Checksum: 0x8216BAB7
	Offset: 0x7BE8
	Size: 0x5E
	Parameters: 0
	Flags: None
*/
function draw_zone_spawned_from()
{
	/#
		self endon(#"death");
		while(true)
		{
			print3d(self.origin + vectorscale((0, 0, 1), 64), self.zone_spawned_from, (1, 1, 1));
			waitframe(1);
		}
	#/
}

/*
	Name: do_zombie_rise
	Namespace: zm_spawner
	Checksum: 0x7101456E
	Offset: 0x7C50
	Size: 0x496
	Parameters: 1
	Flags: Linked
*/
function do_zombie_rise(spot)
{
	self endon(#"death");
	self.in_the_ground = 1;
	if(isdefined(self.anchor))
	{
		self.anchor delete();
	}
	self.anchor = spawn("script_origin", self.origin);
	self.anchor.angles = self.angles;
	self linkto(self.anchor);
	self.anchor thread zm_utility::anchor_delete_failsafe(self);
	if(!isdefined(spot.angles))
	{
		spot.angles = (0, 0, 0);
	}
	anim_org = spot.origin;
	anim_ang = spot.angles;
	anim_org = anim_org + (0, 0, 0);
	self ghost();
	self.anchor moveto(anim_org, 0.05);
	self.anchor waittill(#"movedone");
	target_org = zombie_utility::get_desired_origin();
	if(isdefined(target_org))
	{
		anim_ang = vectortoangles(target_org - self.origin);
		self.anchor rotateto((0, anim_ang[1], 0), 0.05);
		self.anchor waittill(#"rotatedone");
	}
	self unlink();
	if(isdefined(self.anchor))
	{
		self.anchor delete();
	}
	self thread zombie_utility::hide_pop();
	level thread zombie_utility::zombie_rise_death(self, spot);
	spot thread zombie_rise_fx(self);
	substate = 0;
	if(self.zombie_move_speed == "walk")
	{
		substate = randomint(2);
	}
	else
	{
		if(self.zombie_move_speed == "run")
		{
			substate = 2;
		}
		else if(self.zombie_move_speed == "sprint")
		{
			substate = 3;
		}
	}
	self orientmode("face default");
	custom_riseanim = (isdefined(self.custom_riseanim) ? self.custom_riseanim : level.custom_riseanim);
	if(isdefined(custom_riseanim))
	{
		self animscripted("rise_anim", self.origin, spot.angles, custom_riseanim, "normal");
	}
	else
	{
		if(isdefined(level.custom_rise_func))
		{
			self [[level.custom_rise_func]](spot);
		}
		else
		{
			animation = self animmappingsearch(#"hash_6732bfeaf76772c5");
			self animscripted("rise_anim", self.origin, spot.angles, animation, "normal");
		}
	}
	self zombie_shared::donotetracks("rise_anim", &zombie_utility::handle_rise_notetracks, spot);
	self notify(#"rise_anim_finished");
	spot notify(#"stop_zombie_rise_fx");
	self.in_the_ground = 0;
	self notify(#"risen", {#find_flesh_struct_string:spot.script_string});
}

/*
	Name: zombie_rise_fx
	Namespace: zm_spawner
	Checksum: 0xBF641E99
	Offset: 0x80F0
	Size: 0xBA
	Parameters: 1
	Flags: Linked
*/
function zombie_rise_fx(zombie)
{
	if(!is_true(level.riser_fx_on_client))
	{
		self thread zombie_rise_dust_fx(zombie);
		self thread zombie_rise_burst_fx(zombie);
	}
	else
	{
		self thread zombie_rise_burst_fx(zombie);
	}
	zombie endon(#"death");
	self endon(#"stop_zombie_rise_fx");
	wait(1);
	if(zombie.zombie_move_speed != "sprint")
	{
		wait(1);
	}
}

/*
	Name: zombie_rise_burst_fx
	Namespace: zm_spawner
	Checksum: 0xDDC05A3F
	Offset: 0x81B8
	Size: 0x24C
	Parameters: 1
	Flags: Linked
*/
function zombie_rise_burst_fx(zombie)
{
	self endon(#"stop_zombie_rise_fx", #"rise_anim_finished");
	if(isdefined(self.script_parameters) && self.script_parameters == "in_water" && !is_true(level._no_water_risers))
	{
		zombie clientfield::set("zombie_riser_fx_water", 1);
	}
	else
	{
		if(isdefined(self.script_parameters) && self.script_parameters == "in_foliage" && is_true(level._foliage_risers))
		{
			zombie clientfield::set("zombie_riser_fx_foliage", 1);
		}
		else
		{
			if(isdefined(self.script_parameters) && self.script_parameters == "in_snow")
			{
				zombie clientfield::set("zombie_riser_fx", 1);
			}
			else
			{
				if(isdefined(zombie.zone_name) && isdefined(level.zones[zombie.zone_name]))
				{
					low_g_zones = getentarray(zombie.zone_name, "targetname");
					if(low_g_zones.size && isdefined(low_g_zones[0].script_string) && low_g_zones[0].script_string == "lowgravity")
					{
						zombie clientfield::set("zombie_riser_fx_lowg", 1);
					}
					else
					{
						zombie clientfield::set("zombie_riser_fx", 1);
					}
				}
				else
				{
					zombie clientfield::set("zombie_riser_fx", 1);
				}
			}
		}
	}
}

/*
	Name: zombie_rise_dust_fx
	Namespace: zm_spawner
	Checksum: 0x9F1063DB
	Offset: 0x8410
	Size: 0x158
	Parameters: 1
	Flags: Linked
*/
function zombie_rise_dust_fx(ai_zombie)
{
	ai_zombie endon(#"death");
	wait(2);
	if(!isdefined(self.script_string))
	{
		str_fx = "rise_dust";
	}
	else
	{
		switch(self.script_string)
		{
			case "in_water":
			{
				str_fx = "rise_dust_water";
				break;
			}
			case "in_snow":
			{
				str_fx = "rise_dust_snow";
				break;
			}
			case "in_foliage":
			{
				str_fx = "rise_dust_foliage";
				break;
			}
			default:
			{
				str_fx = "rise_dust";
				break;
			}
		}
	}
	t = 0;
	while(t < 5.5)
	{
		playfxontag(level._effect[str_fx], ai_zombie, "J_SpineUpper");
		wait(0.3);
		t = t + 0.3;
	}
}

/*
	Name: zombie_tesla_head_gib
	Namespace: zm_spawner
	Checksum: 0xE7321456
	Offset: 0x8570
	Size: 0xDC
	Parameters: 0
	Flags: Linked
*/
function zombie_tesla_head_gib()
{
	self endon(#"death");
	if(self.animname === "quad_zombie")
	{
		return;
	}
	if(randomint(100) < zombie_utility::function_d2dfacfd(#"tesla_head_gib_chance"))
	{
		wait(randomfloatrange(0.53, 1));
		self zombie_utility::zombie_head_gib();
	}
	else
	{
		zm_net::network_safe_play_fx_on_tag("tesla_death_fx", 2, level._effect[#"tesla_shock_eyes"], self, "J_Eyeball_LE");
	}
}

/*
	Name: zombie_complete_emerging_into_playable_area
	Namespace: zm_spawner
	Checksum: 0x23C8A97A
	Offset: 0x8658
	Size: 0x254
	Parameters: 0
	Flags: Linked
*/
function zombie_complete_emerging_into_playable_area()
{
	self.should_turn = 0;
	self.completed_emerging_into_playable_area = 1;
	self util::delay(0.5, undefined, &function_ca2efdef);
	self notify(#"completed_emerging_into_playable_area");
	if(isdefined(self.backedupgoal))
	{
		self setgoal(self.backedupgoal);
		self.backedupgoal = undefined;
	}
	else
	{
		self.var_93a62fe = zm_utility::get_closest_valid_player(self.origin, self.ignore_player, 1);
		if(isdefined(self.var_93a62fe) && (!ai::has_behavior_attribute("scripted_mode") || ai::get_behavior_attribute("scripted_mode") !== 1))
		{
			if(isdefined(self.var_93a62fe.last_valid_position))
			{
				goalpos = getclosestpointonnavmesh(self.var_93a62fe.last_valid_position, 100, self getpathfindingradius());
				if(!isdefined(goalpos))
				{
					goalpos = self.var_93a62fe.last_valid_position;
				}
				self setgoal(goalpos);
			}
			else
			{
				goalpos = getclosestpointonnavmesh(self.var_93a62fe.origin, 100, self getpathfindingradius());
				if(!isdefined(goalpos))
				{
					goalpos = self.origin;
				}
				self setgoal(goalpos);
			}
		}
		else
		{
			self setgoal(self.origin);
		}
	}
	self thread function_1446cbd3();
	self thread zm_utility::update_zone_name();
}

/*
	Name: function_ca2efdef
	Namespace: zm_spawner
	Checksum: 0xF7879425
	Offset: 0x88B8
	Size: 0x22
	Parameters: 0
	Flags: Linked
*/
function function_ca2efdef()
{
	if(isdefined(self))
	{
		self.no_powerups = 0;
		self.var_98f1f37c = 0;
	}
}

/*
	Name: function_1446cbd3
	Namespace: zm_spawner
	Checksum: 0x229AE3C8
	Offset: 0x88E8
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function function_1446cbd3()
{
	self endon(#"death");
	self collidewithactors(1);
	wait(1.5);
	self setfreecameralockonallowed(1);
}

/*
	Name: function_45bb11e4
	Namespace: zm_spawner
	Checksum: 0x737761ED
	Offset: 0x8948
	Size: 0x384
	Parameters: 1
	Flags: None
*/
function function_45bb11e4(spot)
{
	self endoncallback(&function_fe3cb19a, #"death");
	self.var_5535a47d = 1;
	self function_fe3cb19a();
	self.mdl_anchor = util::spawn_model("tag_origin", self.origin, self.angles);
	self ghost();
	if(!isdefined(spot.angles))
	{
		spot.angles = (0, 0, 0);
	}
	self.mdl_anchor moveto(spot.origin, 0.05);
	self.mdl_anchor rotateto(spot.angles, 0.05);
	self.mdl_anchor waittill(#"movedone", #"death");
	wait(0.05);
	self.create_eyes = 1;
	self show();
	if(!isdefined(self.var_9ed3cc11))
	{
		self.var_9ed3cc11 = self function_e827fc0e();
	}
	self pushplayer(1);
	e_align = (isdefined(self.mdl_anchor) ? self.mdl_anchor : spot);
	if(is_false(self.has_legs) || is_true(self.missing_legs))
	{
		if(isinarray(scene::get_all_shot_names(spot.scriptbundlename), "crawler"))
		{
			e_align scene::play(spot.scriptbundlename, "crawler", self);
		}
		else
		{
			e_align scene::play(spot.scriptbundlename, self);
		}
	}
	else
	{
		if(isinarray(scene::get_all_shot_names(spot.scriptbundlename), "default"))
		{
			e_align scene::play(spot.scriptbundlename, "default", self);
		}
		else
		{
			e_align scene::play(spot.scriptbundlename, self);
		}
	}
	if(isdefined(self.var_9ed3cc11))
	{
		self pushplayer(self.var_9ed3cc11);
		self.var_9ed3cc11 = undefined;
	}
	self.var_5535a47d = 0;
	self thread function_2d97cae1();
	self notify(#"risen", spot.script_string);
	self zombie_complete_emerging_into_playable_area();
}

/*
	Name: function_2d97cae1
	Namespace: zm_spawner
	Checksum: 0xBC9DCD1E
	Offset: 0x8CD8
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function function_2d97cae1()
{
	waitresult = undefined;
	waitresult = self waittilltimeout(1, #"death");
	self function_fe3cb19a();
}

/*
	Name: function_fe3cb19a
	Namespace: zm_spawner
	Checksum: 0x86C3314B
	Offset: 0x8D28
	Size: 0x3E
	Parameters: 1
	Flags: Linked
*/
function function_fe3cb19a(notifyhash)
{
	if(isdefined(self.mdl_anchor))
	{
		self.mdl_anchor delete();
		self.mdl_anchor = undefined;
	}
}

