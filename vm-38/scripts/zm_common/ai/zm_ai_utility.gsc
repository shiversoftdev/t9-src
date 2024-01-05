#using script_4dc6a9b234b838e1;
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
	Name: function_edbc3ff8
	Namespace: zm_ai_utility
	Checksum: 0x46419B9B
	Offset: 0x1A0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_edbc3ff8()
{
	level notify(1959048084);
}

/*
	Name: __init__system__
	Namespace: zm_ai_utility
	Checksum: 0x4678F46F
	Offset: 0x1C0
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
	Checksum: 0x9916D3C5
	Offset: 0x208
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
	Checksum: 0xCDAB78B0
	Offset: 0x2F0
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
	Checksum: 0xF438AAC0
	Offset: 0x328
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
	Checksum: 0x5CCBBE
	Offset: 0x438
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
	Checksum: 0xEC0C8C5B
	Offset: 0x470
	Size: 0x9C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8d30564f()
{
	level.last_spawn_time = gettime();
	self.spawn_time = gettime();
	self.var_e9c62827 = 1;
	self callback::function_d8abfc3d(#"hash_1518febf00439d5", &function_bb83aae2);
	self callback::function_d8abfc3d(#"hash_34b65342cbfdadac", &function_975d551a);
	self function_637778cf();
}

/*
	Name: function_637778cf
	Namespace: zm_ai_utility
	Checksum: 0x68CC418A
	Offset: 0x518
	Size: 0x2B4
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
	self.var_c588eb = settingsbundle.ishvt;
	self.var_9f536dbe = settingsbundle.var_604a84a1;
	self.var_14e19734 = settingsbundle.var_3e5bacce;
	self.var_28aab32a = settingsbundle.var_10460f1e;
	self.var_95d94ac4 = settingsbundle.stunduration;
	self.var_a0193213 = (isdefined(settingsbundle.var_a3160086) ? settingsbundle.var_a3160086 : 0);
	self.basehealth = self.health;
	self.maxhealth = function_f7014c3d(self.health);
	self.health = self.maxhealth;
	if(getdvarint(#"hash_26d204300c52be34", 0) && self.var_6f84b820 === #"special")
	{
		target_set(self, vectorscale((0, 0, 1), 48));
	}
	if(getdvarint(#"hash_367c47109502674", 0) && self.var_6f84b820 === #"elite")
	{
		target_set(self, vectorscale((0, 0, 1), 48));
	}
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
	Checksum: 0xEFA9758F
	Offset: 0x7D8
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
	Checksum: 0x6354EFB5
	Offset: 0x9A8
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
	Checksum: 0xACB59490
	Offset: 0xA30
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
	Checksum: 0x9B3AF205
	Offset: 0xA68
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
	Checksum: 0x3DDCF772
	Offset: 0xB68
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
	Checksum: 0x7D8F87A9
	Offset: 0xD00
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
	Checksum: 0xC680BBC4
	Offset: 0xE58
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
	Checksum: 0x9AA1ACD3
	Offset: 0xEB0
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
	Checksum: 0x43F711AD
	Offset: 0xF18
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
	Checksum: 0xBFDCF38E
	Offset: 0x1128
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
	Name: function_b5fe98
	Namespace: zm_ai_utility
	Checksum: 0x489762AE
	Offset: 0x1578
	Size: 0x20A
	Parameters: 1
	Flags: None
*/
function function_b5fe98(n_round)
{
	var_b3e29825 = self ai::function_9139c839().var_15c336d1;
	base_health = (isdefined(self.basehealth) ? self.basehealth : 150);
	max_health = self ai::function_9139c839().maxhealth;
	var_5d195d82 = self ai::function_9139c839().var_854eebd;
	var_751a7625 = base_health;
	var_22fbe1cc = 1;
	n_index = 0;
	while(var_22fbe1cc < n_round)
	{
		if(isdefined(var_b3e29825[n_index + 1].start_round) && var_22fbe1cc >= (var_b3e29825[n_index + 1].start_round))
		{
			n_index++;
		}
		if(isdefined(var_b3e29825[n_index].var_928e93a0))
		{
			var_751a7625 = var_751a7625 + var_b3e29825[n_index].var_928e93a0;
		}
		var_22fbe1cc++;
	}
	self callback::callback(#"hash_2f825f8e38a8b04d", {#base_health:base_health, #hash_751a7625:var_751a7625});
	if(var_751a7625 > max_health)
	{
		var_751a7625 = max_health;
	}
	num_players = getplayers().size;
	if(isdefined(var_5d195d82) && num_players > 1)
	{
		var_751a7625 = var_751a7625 + ((var_751a7625 * (num_players - 1)) * var_5d195d82);
	}
	return int(var_751a7625);
}

/*
	Name: function_bb83aae2
	Namespace: zm_ai_utility
	Checksum: 0x90DA7243
	Offset: 0x1790
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function function_bb83aae2(params)
{
	self asmsetanimationrate(1);
}

/*
	Name: function_975d551a
	Namespace: zm_ai_utility
	Checksum: 0x4DAD4260
	Offset: 0x17C8
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function function_975d551a(params)
{
	var_2e874959 = (isdefined(self.var_2e874959) ? self.var_2e874959 : 1);
	self asmsetanimationrate(var_2e874959);
}

/*
	Name: function_5540d5f9
	Namespace: zm_ai_utility
	Checksum: 0x4FAE9190
	Offset: 0x1820
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
	Checksum: 0x1702C3D1
	Offset: 0x1888
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
	Checksum: 0x9E2F6EA7
	Offset: 0x1A38
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
	Checksum: 0x2AB2FFD4
	Offset: 0x1E50
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
	Checksum: 0xC13E9A96
	Offset: 0x1F08
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
	Checksum: 0xB08F1B00
	Offset: 0x20F8
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
	Checksum: 0x3B58FA9C
	Offset: 0x22A0
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
	Checksum: 0x39A1F9AE
	Offset: 0x22D8
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
	Checksum: 0x634DDA09
	Offset: 0x2368
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
	Checksum: 0x23A35825
	Offset: 0x2418
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
	Checksum: 0xF1170E11
	Offset: 0x2540
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
	Checksum: 0x5D9BA1EB
	Offset: 0x25E0
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
	Checksum: 0x4F9AC6B4
	Offset: 0x2850
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
	Checksum: 0x71E24B31
	Offset: 0x2938
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
	Checksum: 0xC3E3BD60
	Offset: 0x29D8
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
	Checksum: 0x655DA8E0
	Offset: 0x2A60
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

/*
	Name: function_825317c
	Namespace: zm_ai_utility
	Checksum: 0x680D6A67
	Offset: 0x2B08
	Size: 0x5A
	Parameters: 1
	Flags: Linked
*/
function function_825317c(entity)
{
	if(is_true(entity.var_1fa24724))
	{
		if(isdefined(entity.var_8a3828c6))
		{
			return entity.var_8a3828c6;
		}
		return entity.enemy;
	}
	return entity.favoriteenemy;
}

/*
	Name: function_e9209002
	Namespace: zm_ai_utility
	Checksum: 0x76B3A90B
	Offset: 0x2B70
	Size: 0xC4
	Parameters: 4
	Flags: Linked
*/
function function_e9209002(var_1e8f7ccf, amount, var_d4ece4fd, eattacker)
{
	if(!isdefined(amount))
	{
		amount = 2;
	}
	if(!isdefined(var_d4ece4fd))
	{
		var_d4ece4fd = 0;
	}
	if(!isdefined(self))
	{
		return;
	}
	if(!isdefined(var_1e8f7ccf))
	{
		var_1e8f7ccf = self.origin;
	}
	if(var_d4ece4fd)
	{
		self kill(self.origin, eattacker, undefined, undefined, undefined, 1);
	}
	self namespace_cc411409::function_706a56ae(var_1e8f7ccf, amount);
	self thread function_3fb4ce3b();
}

/*
	Name: function_3fb4ce3b
	Namespace: zm_ai_utility
	Checksum: 0x585B71EE
	Offset: 0x2C40
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_3fb4ce3b()
{
	util::wait_network_frame();
	if(isdefined(self))
	{
		self zombie_utility::gib_random_parts();
	}
}

