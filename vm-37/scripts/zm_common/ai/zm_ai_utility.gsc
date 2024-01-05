#using script_62caa307a394c18c;
#using scripts\zm_common\zm_zonemgr.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using script_35598499769dbb3d;
#using script_2c5daa95f8fec03c;
#using script_59f07c660e6710a5;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\ai_shared.gsc;

#namespace zm_ai_utility;

/*
	Name: __init__system__
	Namespace: zm_ai_utility
	Checksum: 0xC8C35334
	Offset: 0x198
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_ai_utility", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_ai_utility
	Checksum: 0xA1A94352
	Offset: 0x1E0
	Size: 0xDC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	spawner::add_ai_spawn_function(&function_8d30564f);
	clientfield::register("actor", "actor_enable_on_radar", 1, 1, "int");
	spawner::add_ai_spawn_function(&function_a34c1f02);
	callback::on_vehicle_spawned(&function_8d30564f);
	callback::on_spawned(&function_238710c0);
	level.last_spawn_time = 0;
	level.var_41dd92fd = [];
	/#
		level.var_87df97b5 = [];
	#/
}

/*
	Name: function_238710c0
	Namespace: zm_ai_utility
	Checksum: 0xD903CD0A
	Offset: 0x2C8
	Size: 0x2E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_238710c0(params)
{
	self.var_dbb28b34 = 0;
	self.var_7df98a95 = 0;
	self.var_4ca11261 = 0;
}

/*
	Name: function_a34c1f02
	Namespace: zm_ai_utility
	Checksum: 0x4E28FE66
	Offset: 0x300
	Size: 0x104
	Parameters: 0
	Flags: Linked, Private
*/
function private function_a34c1f02()
{
	self endon(#"death");
	if(!isactor(self))
	{
		return;
	}
	if(isdefined(self.archetype) && self.archetype == #"zombie")
	{
		if(is_true(level.var_4d30a9f0))
		{
			while(!is_true(self.completed_emerging_into_playable_area))
			{
				waitframe(1);
			}
		}
		else if(is_true(level.var_3f945d0d))
		{
			self callback::function_d8abfc3d(#"hash_790882ac8688cee5", &function_2272dcba);
			return;
		}
	}
	self clientfield::set("actor_enable_on_radar", 1);
}

/*
	Name: function_2272dcba
	Namespace: zm_ai_utility
	Checksum: 0xC4F7A427
	Offset: 0x410
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_2272dcba(params)
{
	self clientfield::set("actor_enable_on_radar", 1);
}

/*
	Name: function_8d30564f
	Namespace: zm_ai_utility
	Checksum: 0xBD5BD59D
	Offset: 0x448
	Size: 0x3C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8d30564f()
{
	level.last_spawn_time = gettime();
	self.spawn_time = gettime();
	self.var_e9c62827 = 1;
	self function_637778cf();
}

/*
	Name: function_637778cf
	Namespace: zm_ai_utility
	Checksum: 0x8B04E868
	Offset: 0x490
	Size: 0x1C4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_637778cf()
{
	self.var_716c0cc9 = [];
	settingsbundle = self ai::function_9139c839();
	if(!isdefined(settingsbundle))
	{
		return;
	}
	self function_619a5c20();
	self.var_6f84b820 = settingsbundle.category;
	self.var_28aab32a = settingsbundle.var_10460f1e;
	self.var_95d94ac4 = settingsbundle.stunduration;
	self.var_a0193213 = (isdefined(settingsbundle.var_a3160086) ? settingsbundle.var_a3160086 : 0);
	self.basehealth = self.health;
	self.maxhealth = function_f7014c3d(self.health);
	self.health = self.maxhealth;
	self.var_716c0cc9[#"kill"] = settingsbundle.scoreevent;
	self.var_716c0cc9[#"assist"] = settingsbundle.var_dc706c6c;
	self.var_7b22b800 = settingsbundle.var_7b22b800;
	self.var_19f5037 = namespace_42457a0::function_9caeb2f3(settingsbundle.var_349be1e8);
	if(isdefined(settingsbundle.var_5c3586f3))
	{
		self.powerups = arraycopy(settingsbundle.var_5c3586f3);
		self thread function_3edc6292();
	}
	if(isdefined(settingsbundle.var_ca920a99))
	{
		function_a19d7104(settingsbundle);
	}
}

/*
	Name: function_a19d7104
	Namespace: zm_ai_utility
	Checksum: 0x9F0ED922
	Offset: 0x660
	Size: 0x1C2
	Parameters: 1
	Flags: Linked, Private
*/
function private function_a19d7104(settingsbundle)
{
	if(is_true(settingsbundle.var_6199bcd5))
	{
		return;
	}
	if(!isdefined(level.var_532264f5))
	{
		level.var_532264f5 = [];
	}
	if(!isdefined(level.var_532264f5[settingsbundle.name]))
	{
		level.var_532264f5[settingsbundle.name] = [];
	}
	foreach(var_e8d7c6d7 in settingsbundle.var_ca920a99)
	{
		if(!isdefined(var_e8d7c6d7.weaponid) || !isdefined(var_e8d7c6d7.damagescale))
		{
			/#
				println("" + settingsbundle.name);
			#/
			continue;
		}
		level.var_532264f5[settingsbundle.name][var_e8d7c6d7.weaponid] = {#hash_fac896db:var_e8d7c6d7.var_97b22faa, #hash_8e22aa87:var_e8d7c6d7.var_fc420d71, #hash_fff93f95:var_e8d7c6d7.var_628192b0, #hash_c6cc6205:var_e8d7c6d7.damagescale};
	}
	settingsbundle.var_6199bcd5 = 1;
}

/*
	Name: function_94d76123
	Namespace: zm_ai_utility
	Checksum: 0x80D59BE
	Offset: 0x830
	Size: 0x7A
	Parameters: 1
	Flags: Linked
*/
function function_94d76123(weapon)
{
	if(isdefined(self.var_76167463) && isdefined(weapon) && isdefined(level.var_532264f5) && isdefined(level.var_532264f5[self.var_76167463]) && isdefined(level.var_532264f5[self.var_76167463][weapon.name]))
	{
		return true;
	}
	return false;
}

/*
	Name: function_86cb3728
	Namespace: zm_ai_utility
	Checksum: 0x924BDF5F
	Offset: 0x8B8
	Size: 0x2A
	Parameters: 1
	Flags: Linked
*/
function function_86cb3728(weapon)
{
	return level.var_532264f5[self.var_76167463][weapon.name];
}

/*
	Name: function_2ad308c4
	Namespace: zm_ai_utility
	Checksum: 0xEB77CE84
	Offset: 0x8F0
	Size: 0xF2
	Parameters: 2
	Flags: None
*/
function function_2ad308c4(archetype, drop_func)
{
	if(!isdefined(level.var_1029f68))
	{
		level.var_1029f68 = [];
	}
	if(!isdefined(level.var_1029f68[archetype]))
	{
		level.var_1029f68[archetype] = [];
	}
	if(!isdefined(level.var_1029f68[archetype]))
	{
		level.var_1029f68[archetype] = [];
	}
	else if(!isarray(level.var_1029f68[archetype]))
	{
		level.var_1029f68[archetype] = array(level.var_1029f68[archetype]);
	}
	level.var_1029f68[archetype][level.var_1029f68[archetype].size] = drop_func;
}

/*
	Name: function_594bb7bd
	Namespace: zm_ai_utility
	Checksum: 0x7BC4D57C
	Offset: 0x9F0
	Size: 0x190
	Parameters: 1
	Flags: None
*/
function function_594bb7bd(player)
{
	if(!isdefined(level.var_1029f68))
	{
		return;
	}
	foreach(callback_array in level.var_1029f68)
	{
		ai_array = getaiarchetypearray(archetype);
		foreach(ai in ai_array)
		{
			foreach(callback in callback_array)
			{
				ai [[callback]](player);
			}
		}
	}
}

/*
	Name: get_pathnode_path
	Namespace: zm_ai_utility
	Checksum: 0x3B643E15
	Offset: 0xB88
	Size: 0x14C
	Parameters: 1
	Flags: None
*/
function get_pathnode_path(pathnode)
{
	path_struct = {#loops:0, #path:array(pathnode)};
	var_592eaf7 = pathnode;
	while(isdefined(var_592eaf7.target))
	{
		var_592eaf7 = getnode(var_592eaf7.target, "targetname");
		if(!isdefined(var_592eaf7))
		{
			break;
		}
		if(isinarray(path_struct.path, var_592eaf7))
		{
			path_struct.loops = 1;
			break;
		}
		if(!isdefined(path_struct.path))
		{
			path_struct.path = [];
		}
		else if(!isarray(path_struct.path))
		{
			path_struct.path = array(path_struct.path);
		}
		path_struct.path[path_struct.path.size] = var_592eaf7;
	}
	return path_struct;
}

/*
	Name: start_patrol
	Namespace: zm_ai_utility
	Checksum: 0x8281D237
	Offset: 0xCE0
	Size: 0x4C
	Parameters: 5
	Flags: None
*/
function start_patrol(entity, patrol_path, var_b90f0f49, var_73fcb9ff, var_572b1f58)
{
	entity thread update_patrol(entity, patrol_path, var_b90f0f49, var_73fcb9ff, var_572b1f58);
}

/*
	Name: stop_patrol
	Namespace: zm_ai_utility
	Checksum: 0x2F7B2458
	Offset: 0xD38
	Size: 0x60
	Parameters: 1
	Flags: None
*/
function stop_patrol(entity)
{
	if(entity ai::has_behavior_attribute("patrol"))
	{
		entity ai::set_behavior_attribute("patrol", 0);
	}
	entity notify(#"stop_patrol");
}

/*
	Name: update_patrol
	Namespace: zm_ai_utility
	Checksum: 0xA5553EA6
	Offset: 0xDA0
	Size: 0x204
	Parameters: 5
	Flags: Linked, Private
*/
function private update_patrol(entity, patrol_path, var_b90f0f49, var_73fcb9ff, var_572b1f58)
{
	entity notify(#"stop_patrol");
	entity endon(#"death", #"stop_patrol");
	if(!entity ai::has_behavior_attribute("patrol"))
	{
		return;
	}
	entity ai::set_behavior_attribute("patrol", 1);
	while(entity ai::get_behavior_attribute("patrol") && patrol_path.size > 0)
	{
		for(i = 0; i < patrol_path.size; i++)
		{
			var_cf88d3eb = patrol_path[i];
			next_goal = getclosestpointonnavmesh(var_cf88d3eb.origin, 100, entity getpathfindingradius());
			if(!isdefined(next_goal))
			{
				break;
			}
			entity setgoal(next_goal);
			entity waittill(#"goal_changed");
			entity waittill(#"goal");
			if(isdefined(var_73fcb9ff))
			{
				entity [[var_73fcb9ff]](var_cf88d3eb);
			}
			if(entity ai::get_behavior_attribute("patrol") == 0)
			{
				break;
			}
		}
		if(!is_true(var_b90f0f49))
		{
			break;
		}
	}
	if(isdefined(var_572b1f58))
	{
		entity [[var_572b1f58]]();
	}
}

/*
	Name: function_f7014c3d
	Namespace: zm_ai_utility
	Checksum: 0x1CD5F967
	Offset: 0xFB0
	Size: 0x442
	Parameters: 1
	Flags: Linked
*/
function function_f7014c3d(base_health)
{
	current_round = zm_utility::get_round_number();
	register_archetype = self ai::function_9139c839().var_3e8f6c97;
	base_health = (isdefined(base_health) ? base_health : 100);
	ai_name = self.aitype;
	if(is_true(register_archetype))
	{
		ai_name = self.archetype;
	}
	/#
		if(is_true(register_archetype))
		{
			if(isdefined(level.var_87df97b5[self.archetype]))
			{
				/#
					assert(level.var_87df97b5[self.archetype] === base_health, (((("" + self.archetype) + "") + level.var_87df97b5[self.archetype]) + "") + base_health);
				#/
			}
			level.var_87df97b5[self.archetype] = base_health;
		}
	#/
	if(!isdefined(level.var_41dd92fd[ai_name]) || level.var_41dd92fd[ai_name].round != current_round)
	{
		var_b3e29825 = self ai::function_9139c839().var_15c336d1;
		base = (isdefined(base_health) ? base_health : 100);
		max = (isdefined(self ai::function_9139c839().maxhealth) ? self ai::function_9139c839().maxhealth : base);
		var_5d195d82 = self ai::function_9139c839().var_854eebd;
		var_751a7625 = base;
		if(current_round > 1)
		{
			for(i = 0; i < var_b3e29825.size; i++)
			{
				if(current_round >= var_b3e29825[i].start_round)
				{
					var_d3e853a6 = var_b3e29825[i].var_928e93a0;
					if(isdefined(var_b3e29825[i + 1]) && current_round >= (var_b3e29825[i + 1].start_round))
					{
						var_afd2a8a5 = (var_b3e29825[i + 1].start_round) - var_b3e29825[i].start_round;
					}
					else
					{
						var_afd2a8a5 = current_round - var_b3e29825[i].start_round;
					}
					var_751a7625 = var_751a7625 + (var_d3e853a6 * var_afd2a8a5);
					continue;
				}
				break;
			}
		}
		self callback::callback(#"hash_2f825f8e38a8b04d", {#base:base, #hash_751a7625:var_751a7625});
		if(var_751a7625 > max)
		{
			var_751a7625 = max;
		}
		num_players = getplayers().size;
		if(isdefined(var_5d195d82) && num_players > 1)
		{
			var_751a7625 = var_751a7625 + ((var_751a7625 * (num_players - 1)) * var_5d195d82);
		}
		level.var_41dd92fd[ai_name] = {#round:current_round, #health:int(var_751a7625)};
	}
	return level.var_41dd92fd[ai_name].health;
}

/*
	Name: function_5540d5f9
	Namespace: zm_ai_utility
	Checksum: 0x56B8ECDE
	Offset: 0x1400
	Size: 0x5A
	Parameters: 1
	Flags: None
*/
function function_5540d5f9(params)
{
	if(isdefined(params.var_751a7625) && isdefined(params.base))
	{
		self.var_41e87ed9 = round(params.var_751a7625 / params.base);
	}
}

/*
	Name: function_db610082
	Namespace: zm_ai_utility
	Checksum: 0xA6DE2F45
	Offset: 0x1468
	Size: 0x1A6
	Parameters: 0
	Flags: Linked
*/
function function_db610082()
{
	if(!isdefined(self))
	{
		return false;
	}
	if(!isalive(self))
	{
		return false;
	}
	if(self.archetype !== #"zombie")
	{
		return false;
	}
	if(is_true(self.aat_turned))
	{
		return false;
	}
	if(is_true(self.missinglegs))
	{
		return false;
	}
	if(is_true(self.knockdown))
	{
		return false;
	}
	if(gibserverutils::isgibbed(self, 56))
	{
		return false;
	}
	if(isdefined(self.traversal) || self function_dd070839())
	{
		return false;
	}
	if(is_true(self.var_69a981e6))
	{
		return false;
	}
	if(is_true(self.barricade_enter))
	{
		return false;
	}
	if(is_true(self.is_leaping))
	{
		return false;
	}
	if(!is_true(self.completed_emerging_into_playable_area))
	{
		return false;
	}
	if(!is_true(self zm_utility::in_playable_area()))
	{
		return false;
	}
	return true;
}

/*
	Name: function_422fdfd4
	Namespace: zm_ai_utility
	Checksum: 0xCB17ED8C
	Offset: 0x1618
	Size: 0x40C
	Parameters: 11
	Flags: None
*/
function function_422fdfd4(entity, attacker, weapon, var_5457dc44, hitloc, point, var_ebcb86d6, var_b85996d4, var_159ce525, var_ddd319d6, var_d2314927)
{
	var_8d3f5b7d = isalive(attacker) && isplayer(attacker);
	var_201ce857 = var_8d3f5b7d && attacker zm_powerups::is_insta_kill_active();
	var_84ed9a13 = function_de3dda83(var_5457dc44, hitloc, point, var_ebcb86d6);
	registerzombie_bgb_used_reinforce = isdefined(var_84ed9a13) && namespace_81245006::function_f29756fe(var_84ed9a13) == 1;
	var_30362eca = registerzombie_bgb_used_reinforce && var_84ed9a13.type !== #"armor";
	if(entity function_94d76123(weapon))
	{
		var_532264f5 = entity function_86cb3728(weapon);
		var_c6cc6205 = (isdefined(var_b85996d4) ? var_b85996d4 : var_532264f5.var_c6cc6205);
		var_fff93f95 = (isdefined(var_159ce525) ? var_159ce525 : var_532264f5.var_fff93f95);
		var_cee56a92 = (isdefined(var_ddd319d6) ? var_ddd319d6 : var_532264f5.var_8e22aa87);
		var_e008ecea = (isdefined(var_d2314927) ? var_d2314927 : var_532264f5.var_fac896db);
	}
	else
	{
		var_c6cc6205 = var_b85996d4;
		var_fff93f95 = var_159ce525;
		var_cee56a92 = var_ddd319d6;
		var_e008ecea = var_d2314927;
	}
	if(!var_201ce857 && !var_30362eca)
	{
		var_b1c1c5cf = (isdefined(var_c6cc6205) ? var_c6cc6205 : entity ai::function_9139c839().damagescale);
	}
	else
	{
		if(!var_201ce857 && var_30362eca)
		{
			var_b1c1c5cf = (isdefined(var_fff93f95) ? var_fff93f95 : entity ai::function_9139c839().var_628192b0);
		}
		else
		{
			if(var_201ce857 && !var_30362eca)
			{
				var_b1c1c5cf = (isdefined(var_cee56a92) ? var_cee56a92 : entity ai::function_9139c839().var_fc420d71);
			}
			else
			{
				var_b1c1c5cf = (isdefined(var_e008ecea) ? var_e008ecea : entity ai::function_9139c839().var_97b22faa);
			}
		}
	}
	if(var_8d3f5b7d)
	{
		has_weakpoints = isdefined(namespace_81245006::function_fab3ee3e(self));
		if(var_30362eca && attacker hasperk(#"specialty_mod_awareness"))
		{
			if(var_b1c1c5cf < 1)
			{
				var_b1c1c5cf = var_b1c1c5cf + 0.2;
			}
			else
			{
				var_b1c1c5cf = var_b1c1c5cf * 1.2;
			}
		}
	}
	return {#hash_201ce857:var_201ce857, #registerzombie_bgb_used_reinforce:registerzombie_bgb_used_reinforce, #hash_84ed9a13:var_84ed9a13, #damage_scale:var_b1c1c5cf};
}

/*
	Name: function_de3dda83
	Namespace: zm_ai_utility
	Checksum: 0x17053058
	Offset: 0x1A30
	Size: 0xAA
	Parameters: 4
	Flags: Linked
*/
function function_de3dda83(var_5457dc44, hitloc, point, var_ebcb86d6)
{
	if(isdefined(var_ebcb86d6))
	{
		var_84ed9a13 = var_ebcb86d6;
	}
	else
	{
		var_84ed9a13 = namespace_81245006::function_3131f5dd(self, hitloc, 1);
		if(!isdefined(var_84ed9a13))
		{
			var_84ed9a13 = namespace_81245006::function_37e3f011(self, var_5457dc44);
		}
		if(!isdefined(var_84ed9a13))
		{
			var_84ed9a13 = namespace_81245006::function_73ab4754(self, point, 1);
		}
	}
	return var_84ed9a13;
}

/*
	Name: function_a2e8fd7b
	Namespace: zm_ai_utility
	Checksum: 0x82AD8CB0
	Offset: 0x1AE8
	Size: 0x1E6
	Parameters: 3
	Flags: Linked
*/
function function_a2e8fd7b(entity, player, var_3f120c4d)
{
	if(!isdefined(var_3f120c4d))
	{
		var_3f120c4d = 2;
	}
	/#
		assert(isplayer(player), "");
	#/
	if(getdvarint(#"zm_zone_pathing", 1) && level.zones.size)
	{
		zone_path = zm_zonemgr::function_54fc7938(player, entity);
		if(isdefined(level.var_64c67df3))
		{
			to_zone = [[level.var_64c67df3]](zone_path);
		}
		if(isdefined(to_zone) || (isdefined(zone_path) && zone_path.cost >= var_3f120c4d))
		{
			if(!isdefined(to_zone))
			{
				to_zone = level.zones[zone_path.to_zone];
			}
			for(var_3a38abb0 = 0; is_true(to_zone.var_458fe8a) && var_3a38abb0 < 4; var_3a38abb0++)
			{
				zone_path = zm_zonemgr::function_54fc7938(player, zone_path.to_zone);
				if(!isdefined(zone_path))
				{
					return player;
				}
				to_zone = level.zones[zone_path.to_zone];
			}
			if(isdefined(to_zone) && to_zone.nodes.size > 0)
			{
				return to_zone.nodes[0];
			}
		}
	}
	return player;
}

/*
	Name: make_zombie_target
	Namespace: zm_ai_utility
	Checksum: 0x56BAE299
	Offset: 0x1CD8
	Size: 0x19C
	Parameters: 1
	Flags: None
*/
function make_zombie_target(entity)
{
	if(isinarray(level.zombie_targets, entity))
	{
		/#
			iprintlnbold(("" + entity getentitynumber()) + "");
		#/
		return false;
	}
	function_1eaaceab(level.zombie_targets);
	arrayremovevalue(level.zombie_targets, undefined);
	if((level.zombie_targets.size + 4) >= 16)
	{
		/#
			iprintlnbold(("" + entity getentitynumber()) + "");
		#/
		return false;
	}
	if(!isdefined(entity.am_i_valid))
	{
		entity.am_i_valid = 1;
	}
	if(!isdefined(level.zombie_targets))
	{
		level.zombie_targets = [];
	}
	else if(!isarray(level.zombie_targets))
	{
		level.zombie_targets = array(level.zombie_targets);
	}
	level.zombie_targets[level.zombie_targets.size] = entity;
	return true;
}

/*
	Name: is_zombie_target
	Namespace: zm_ai_utility
	Checksum: 0x8BDF65EB
	Offset: 0x1E80
	Size: 0x2A
	Parameters: 1
	Flags: None
*/
function is_zombie_target(entity)
{
	return isinarray(level.zombie_targets, entity);
}

/*
	Name: remove_zombie_target
	Namespace: zm_ai_utility
	Checksum: 0x333A00AC
	Offset: 0x1EB8
	Size: 0x88
	Parameters: 1
	Flags: None
*/
function remove_zombie_target(entity)
{
	if(!isinarray(level.zombie_targets, entity))
	{
		/#
			iprintlnbold(("" + entity getentitynumber()) + "");
		#/
		return false;
	}
	arrayremovevalue(level.zombie_targets, entity);
	return true;
}

/*
	Name: function_3edc6292
	Namespace: zm_ai_utility
	Checksum: 0x61F843B7
	Offset: 0x1F48
	Size: 0xA8
	Parameters: 0
	Flags: Linked
*/
function function_3edc6292()
{
	if(!isdefined(self.powerups))
	{
		return false;
	}
	if(!isdefined(self.var_d0686fde))
	{
		self.var_d0686fde = [];
	}
	else if(!isarray(self.var_d0686fde))
	{
		self.var_d0686fde = array(self.var_d0686fde);
	}
	for(i = 0; i < self.powerups.size; i++)
	{
		self.var_d0686fde[i] = self.powerups[i].dropid;
	}
}

/*
	Name: function_991333ce
	Namespace: zm_ai_utility
	Checksum: 0x1CCE075E
	Offset: 0x1FF8
	Size: 0x120
	Parameters: 2
	Flags: None
*/
function function_991333ce(entity, ai_array)
{
	enemies = ai_array;
	if(!isdefined(enemies))
	{
		enemies = getaiteamarray(level.zombie_team);
	}
	foreach(enemy in enemies)
	{
		if(enemy.favoriteenemy === entity)
		{
			if(isdefined(enemy.var_ef1ed308))
			{
				[[enemy.var_ef1ed308]](enemy);
			}
			else
			{
				enemy.favoriteenemy = undefined;
			}
			enemy.var_93a62fe = undefined;
			enemy setgoal(enemy.origin);
		}
	}
}

/*
	Name: function_f1b557c6
	Namespace: zm_ai_utility
	Checksum: 0xA57A9D55
	Offset: 0x2120
	Size: 0x92
	Parameters: 0
	Flags: Linked, Private
*/
function private function_f1b557c6()
{
	if(self isplayinganimscripted())
	{
		return false;
	}
	if(isactor(self) && (self.isarriving || self function_dd070839() || self asmistransdecrunning() || self asmistransitionrunning()))
	{
		return false;
	}
	return true;
}

/*
	Name: function_a8dc3363
	Namespace: zm_ai_utility
	Checksum: 0xCEF2BB0
	Offset: 0x21C0
	Size: 0x264
	Parameters: 1
	Flags: Linked
*/
function function_a8dc3363(s_location)
{
	if(isalive(self))
	{
		self endon(#"death");
		self val::set(#"ai_cleanup", "hide", 2);
		util::wait_network_frame();
		self pathmode("dont move", 1);
		while(!self function_f1b557c6())
		{
			/#
				println(("" + self getentitynumber()) + "");
			#/
			waitframe(1);
		}
		self dontinterpolate();
		self forceteleport((isdefined(s_location.origin) ? s_location.origin : (0, 0, 0)), (isdefined(self.angles) ? self.angles : (0, 0, 0)), 0, 1);
		self pathmode("move allowed");
		self val::reset(#"ai_cleanup", "hide");
		self zombie_utility::reset_attack_spot();
		self.completed_emerging_into_playable_area = 0;
		self.find_flesh_struct_string = s_location.script_string;
		self.got_to_entrance = undefined;
		self.at_entrance_tear_spot = undefined;
		self.spawn_time = gettime();
		if(self.var_6f84b820 === #"normal" && s_location.script_noteworthy !== "spawn_location" && s_location.script_noteworthy !== "blight_father_location")
		{
			self.spawn_pos = undefined;
			self zm_utility::move_zombie_spawn_location(s_location);
		}
	}
}

/*
	Name: function_54054394
	Namespace: zm_ai_utility
	Checksum: 0x514791C7
	Offset: 0x2430
	Size: 0xDA
	Parameters: 1
	Flags: Linked
*/
function function_54054394(entity)
{
	if(!isdefined(level.var_5fa2f970))
	{
		level.var_5fa2f970 = getentarray("no_powerups", "targetname");
	}
	foreach(volume in level.var_5fa2f970)
	{
		if(entity istouching(volume))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: hashelmet
	Namespace: zm_ai_utility
	Checksum: 0xAC0E3648
	Offset: 0x2518
	Size: 0x96
	Parameters: 2
	Flags: Linked
*/
function hashelmet(hitloc, enemy)
{
	weakpoint = namespace_81245006::function_3131f5dd(enemy, hitloc, 1);
	if(isdefined(weakpoint) && weakpoint.type === #"armor" && weakpoint.var_f371ebb0 === "helmet" && namespace_81245006::function_f29756fe(weakpoint) !== 3)
	{
		return true;
	}
	return false;
}

/*
	Name: function_68ab868a
	Namespace: zm_ai_utility
	Checksum: 0x12076EDE
	Offset: 0x25B8
	Size: 0x7A
	Parameters: 1
	Flags: Linked
*/
function function_68ab868a(entity)
{
	if(isplayer(entity.enemy))
	{
		if(!is_true(entity.var_1fa24724))
		{
			entity.enemy.var_dbb28b34 = gettime();
		}
		entity.enemy.var_4ca11261 = gettime();
	}
	entity.var_1fa24724 = 1;
}

/*
	Name: function_4d22f6d1
	Namespace: zm_ai_utility
	Checksum: 0xA453922A
	Offset: 0x2640
	Size: 0x9A
	Parameters: 1
	Flags: Linked
*/
function function_4d22f6d1(entity)
{
	if(isplayer(entity.enemy))
	{
		entity.enemy.var_7df98a95 = gettime();
		if(isdefined(entity.enemy.var_4ca11261) && (entity.enemy.var_7df98a95 - entity.enemy.var_4ca11261) > 1000)
		{
			entity.var_1fa24724 = undefined;
		}
	}
	else
	{
		entity.var_1fa24724 = undefined;
	}
}

