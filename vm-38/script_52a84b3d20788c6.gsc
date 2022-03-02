#using script_178024232e91b0a1;
#using script_1b10fdf0addd52e;
#using script_34bde5579203fa3;
#using script_35598499769dbb3d;
#using script_3657077a08b7f19e;
#using script_3aa0f32b70d4f7cb;
#using script_3f9e0dc8454d98e1;
#using script_4d85e8de54b02198;
#using script_57f7003580bb15e0;
#using script_58c342edd81589fb;
#using script_7e59d7bba853fe4b;
#using script_caf007e2a98afa2;
#using script_db06eb511bd9b36;
#using scripts\core_common\aat_shared.gsc;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm_behavior.gsc;
#using scripts\zm_common\zm_devgui.gsc;
#using scripts\zm_common\zm_player.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace namespace_83bc53d2;

/*
	Name: function_f2e47d07
	Namespace: namespace_83bc53d2
	Checksum: 0x25E6CB59
	Offset: 0x650
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_f2e47d07()
{
	level notify(2087199641);
}

/*
	Name: function_89f2df9
	Namespace: namespace_83bc53d2
	Checksum: 0x7ADDFEBB
	Offset: 0x670
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_4bca7168ca976d7f", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_83bc53d2
	Checksum: 0xE0AF2F87
	Offset: 0x6B8
	Size: 0x4E4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	registerbehaviorscriptfunctions();
	if(!isarchetypeloaded(#"catalyst"))
	{
		return;
	}
	namespace_a216c96::function_8f9b9d24(0, &function_d422ab54);
	namespace_a216c96::function_8f9b9d24(1, &function_19287ba5);
	namespace_a216c96::function_8f9b9d24(3, &function_30b33bc4);
	namespace_a216c96::function_8f9b9d24(2, &function_57285eec);
	namespace_a216c96::function_8f9b9d24(4, &function_f9f8d9e6);
	spawner::add_archetype_spawn_function(#"zombie", &function_49d71e38);
	zm_utility::function_d0f02e71(#"catalyst");
	zm_player::register_player_damage_callback(&function_22e12b7);
	zm_cleanup::function_39553a7c(#"catalyst", &function_5ea7ae19);
	zm_cleanup::function_cdf5a512(#"catalyst", &function_3eaa8337);
	namespace_32192f7::function_95c1dd81(#"catalyst", &function_52ce9654);
	level.var_3ecc60fc[0] = 1;
	level.var_3ecc60fc[2] = 3;
	level.var_3ecc60fc[1] = 2;
	level.var_3ecc60fc[3] = 4;
	clientfield::register("actor", "catalyst_aura_clientfield", 1, 3, "int");
	clientfield::register("actor", "catalyst_damage_explosion_clientfield", 1, 1, "counter");
	clientfield::register("actor", "corrosive_death_clientfield", 1, 1, "int");
	clientfield::register("actor", "corrosive_miasma_clientfield", 1, 1, "int");
	clientfield::register("actor", "water_catalyst_purified", 1, 1, "int");
	clientfield::register("actor", "electricity_catalyst_blast", 1, 1, "int");
	clientfield::register("actor", "plasma_catalyst_blast", 1, 1, "int");
	zm_spawner::register_zombie_death_event_callback(&killed_callback);
	namespace_c3287616::register_archetype(#"catalyst", &function_55f82550, &round_spawn, undefined, 25);
	namespace_c3287616::function_306ce518(#"catalyst", &function_587a3171);
	/#
		spawner::add_archetype_spawn_function(#"catalyst", &zombie_utility::function_27ba8249);
	#/
	spawner::add_archetype_spawn_function(#"zombie", &function_59e10bc5);
	spawner::function_89a2cd87(#"catalyst", &function_47fdbfbb);
	function_6e75e858();
	registertransformations();
	/#
		level thread function_1a0ae193();
	#/
}

/*
	Name: function_52ce9654
	Namespace: namespace_83bc53d2
	Checksum: 0x6DA5053F
	Offset: 0xBA8
	Size: 0x28C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_52ce9654()
{
	if(isarray(level.zm_loc_types) && level.zm_loc_types[#"zombie_location"].size > 0)
	{
		a_s_spawn_locs = level.zm_loc_types[#"zombie_location"];
		var_31b16a0 = [];
		foreach(s_spawn_loc in a_s_spawn_locs)
		{
			if(isdefined(s_spawn_loc.script_noteworthy) && (s_spawn_loc.script_noteworthy == "riser_location" || s_spawn_loc.script_noteworthy == "faller_location"))
			{
				continue;
			}
			if(!isdefined(var_31b16a0))
			{
				var_31b16a0 = [];
			}
			else if(!isarray(var_31b16a0))
			{
				var_31b16a0 = array(var_31b16a0);
			}
			var_31b16a0[var_31b16a0.size] = s_spawn_loc;
		}
		if(isarray(level.zm_loc_types[#"blight_father_location"]) && level.zm_loc_types[#"blight_father_location"].size > 0)
		{
			var_31b16a0 = arraycombine(var_31b16a0, level.zm_loc_types[#"blight_father_location"], 0, 0);
		}
		var_47c2dcf7 = zombie_utility::spawn_zombie(array::random(level.var_aa069b5), undefined, array::random(var_31b16a0));
		if(isdefined(var_47c2dcf7))
		{
			var_47c2dcf7 zm_transform::function_bbaec2fd();
			if(var_47c2dcf7.var_62e81e47 == 1)
			{
				level thread function_4329a51b(var_47c2dcf7);
			}
			return true;
		}
	}
	return false;
}

/*
	Name: registertransformations
	Namespace: namespace_83bc53d2
	Checksum: 0x9437AD23
	Offset: 0xE40
	Size: 0x1E4
	Parameters: 0
	Flags: Linked, Private
*/
function private registertransformations()
{
	zm_transform::function_cfca77a7(function_bbb2bab5(1), #"hash_78ca8e8e6bdbc8ab", &function_39212989, 5, &function_f4043bc8, &function_2ed1300e, "aib_vign_zm_zod_catalyst_corrosive_spawn_pre_split", "aib_vign_zm_zod_catalyst_corrosive_spawn_post_split");
	zm_transform::function_cfca77a7(function_bbb2bab5(3), #"hash_266b62e342076a90", &function_39212989, 5, &function_f4043bc8, &function_2ed1300e, "aib_vign_zm_zod_catalyst_electric_spawn_pre_split", "aib_vign_zm_zod_catalyst_electric_spawn_post_split");
	zm_transform::function_cfca77a7(function_bbb2bab5(2), #"hash_5cfa99582cc66c59", &function_39212989, 5, &function_f4043bc8, &function_2ed1300e, "aib_vign_zm_zod_catalyst_plasma_spawn_pre_split", "aib_vign_zm_zod_catalyst_plasma_spawn_post_split");
	zm_transform::function_cfca77a7(function_bbb2bab5(4), #"hash_5d6b55906fc82ff2", &function_39212989, 5, &function_f4043bc8, &function_2ed1300e, "aib_vign_zm_zod_catalyst_water_spawn_pre_split", "aib_vign_zm_zod_catalyst_water_spawn_post_split");
}

/*
	Name: registerbehaviorscriptfunctions
	Namespace: namespace_83bc53d2
	Checksum: 0x4BF8B83C
	Offset: 0x1030
	Size: 0x50C
	Parameters: 0
	Flags: Linked, Private
*/
function private registerbehaviorscriptfunctions()
{
	/#
		assert(isscriptfunctionptr(&function_177aa69d));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_6e732e3940240c58", &function_177aa69d);
	/#
		assert(isscriptfunctionptr(&function_f4e7fd8f));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_69f8b2358092c7d2", &function_f4e7fd8f);
	/#
		assert(isscriptfunctionptr(&function_787ce068));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_5ff2f90caf2f463d", &function_787ce068);
	/#
		assert(!isdefined(&function_21cbb589) || isscriptfunctionptr(&function_21cbb589));
	#/
	/#
		assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
	#/
	/#
		assert(!isdefined(&function_6c92ebda) || isscriptfunctionptr(&function_6c92ebda));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction(#"hash_7b47cc66161f357c", &function_21cbb589, undefined, &function_6c92ebda);
	/#
		assert(isscriptfunctionptr(&function_1043897a));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_1430ed09cf5c6db5", &function_1043897a);
	/#
		assert(isscriptfunctionptr(&function_dec8327a));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_1747a785a62d469f", &function_dec8327a);
	/#
		assert(isscriptfunctionptr(&function_554a7c58));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_55c082fcd22cf9d7", &function_554a7c58);
	/#
		assert(isscriptfunctionptr(&function_d647a79d));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_3891bbe2c51e97c9", &function_d647a79d);
	animationstatenetwork::registernotetrackhandlerfunction("tag_fx_electric_attack", &function_d697a1e3);
	animationstatenetwork::registernotetrackhandlerfunction("tag_fx_electric_attack_stop", &function_aef521f5);
	animationstatenetwork::registernotetrackhandlerfunction("tag_fx_plasma_death", &function_3b07d86e);
	animationstatenetwork::registernotetrackhandlerfunction("corrosive_hide_model", &function_4329a51b);
	animationstatenetwork::registernotetrackhandlerfunction("corrosive_hide_gas", &function_247a46c1);
	animationstatenetwork::registernotetrackhandlerfunction("tag_fx_corrosive_death", &function_cda81e65);
	animationstatenetwork::registernotetrackhandlerfunction("ghost_catalyst", &function_c8f01c4b);
}

/*
	Name: function_49d71e38
	Namespace: namespace_83bc53d2
	Checksum: 0x80F724D1
	Offset: 0x1548
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_49d71e38()
{
}

/*
	Name: function_47fdbfbb
	Namespace: namespace_83bc53d2
	Checksum: 0x565D033A
	Offset: 0x1558
	Size: 0x2BC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_47fdbfbb()
{
	if(!isdefined(self.var_9fde8624))
	{
		return;
	}
	health_multiplier = 1;
	switch(self.var_9fde8624)
	{
		case "hash_78ca8e8e6bdbc8ab":
		{
			health_multiplier = self ai::function_9139c839().var_51ce117f;
			self.var_17a22c08 = self ai::function_9139c839().var_57140ac3;
			break;
		}
		case "hash_266b62e342076a90":
		{
			health_multiplier = self ai::function_9139c839().var_6e7acfb4;
			self.var_17a22c08 = self ai::function_9139c839().var_fe586e50;
			break;
		}
		case "hash_5cfa99582cc66c59":
		{
			health_multiplier = self ai::function_9139c839().var_33236cb0;
			self.var_17a22c08 = self ai::function_9139c839().var_145b14e6;
			break;
		}
		case "hash_5d6b55906fc82ff2":
		{
			health_multiplier = self ai::function_9139c839().var_bacb0199;
			self.var_17a22c08 = self ai::function_9139c839().var_ead9d81d;
			break;
		}
	}
	health_multiplier = health_multiplier * (isdefined(level.var_1eb98fb1) ? level.var_1eb98fb1 : 1);
	var_ab9f2e38 = zombie_utility::ai_calculate_health(zombie_utility::function_d2dfacfd(#"zombie_health_start"), (isdefined(self._starting_round_number) ? self._starting_round_number : level.round_number));
	self.maxhealth = int(max(var_ab9f2e38 * health_multiplier, 1));
	self.health = int(max(self.maxhealth * (isdefined(self.var_d67de8a4) ? self.var_d67de8a4 : 1), 1));
	self zm_score::function_82732ced();
}

/*
	Name: function_befab5d9
	Namespace: namespace_83bc53d2
	Checksum: 0xAA4E61C0
	Offset: 0x1820
	Size: 0x3A
	Parameters: 0
	Flags: Linked, Private
*/
function private function_befab5d9()
{
	if(math::cointoss())
	{
		self.zombie_arms_position = "up";
	}
	else
	{
		self.zombie_arms_position = "down";
	}
}

/*
	Name: function_d422ab54
	Namespace: namespace_83bc53d2
	Checksum: 0xB07821E4
	Offset: 0x1868
	Size: 0x12C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_d422ab54()
{
	self clientfield::set("catalyst_aura_clientfield", self.var_62e81e47);
	self.canbetargetedbyturnedzombies = 1;
	self.var_6d23c054 = 1;
	self.ignorepathenemyfightdist = 1;
	self.custom_location = &function_bbe2a1d2;
	self.closest_player_override = &zm_utility::function_c52e1749;
	self.var_2f68be48 = 1;
	self.var_7cc959b1 = 1;
	self.var_1731eda3 = 1;
	self thread function_734195be();
	self.var_d1c70689 = &function_439c457c;
	self thread zm_spawner::zombie_think();
	level thread zm_spawner::zombie_death_event(self);
	self thread zm_utility::function_13cc9756();
	self pushplayer(0);
}

/*
	Name: function_734195be
	Namespace: namespace_83bc53d2
	Checksum: 0x9BF5C3A6
	Offset: 0x19A0
	Size: 0xC6
	Parameters: 0
	Flags: Linked, Private
*/
function private function_734195be()
{
	self endon(#"death");
	self.var_69a981e6 = 1;
	while(true)
	{
		s_notify = undefined;
		s_notify = level waittill(#"transformation_complete");
		if(isdefined(s_notify.var_944250d2) && isarray(s_notify.var_944250d2) && isinarray(s_notify.var_944250d2, self))
		{
			self.var_69a981e6 = 0;
			self.zombie_think_done = 1;
			self.completed_emerging_into_playable_area = 1;
		}
	}
}

/*
	Name: killed_callback
	Namespace: namespace_83bc53d2
	Checksum: 0x78E3A413
	Offset: 0x1A70
	Size: 0x22C
	Parameters: 1
	Flags: Linked, Private
*/
function private killed_callback(e_attacker)
{
	if(!isdefined(self.var_62e81e47))
	{
		return;
	}
	if(!isplayer(e_attacker))
	{
		return;
	}
	if(is_true(self.var_85387c5b))
	{
		e_attacker zm_stats::increment_challenge_stat(#"hash_564d41c1808857c7");
		self thread function_d0673f24(e_attacker, self getcentroid());
	}
	else if(isdefined(self.damageweapon) && isdefined(e_attacker.var_b01de37))
	{
		var_e5088518 = aat::function_702fb333(self.damageweapon);
		a_keys = getarraykeys(e_attacker.var_b01de37);
		if(isinarray(a_keys, var_e5088518))
		{
			if(self.var_62e81e47 === e_attacker.var_b01de37[var_e5088518])
			{
				e_attacker zm_stats::increment_challenge_stat(#"hash_564d41c1808857c7");
				self thread function_d0673f24(e_attacker, self getcentroid());
			}
		}
	}
	if(isdefined(e_attacker))
	{
		if(is_true(self.var_69a981e6))
		{
			if(isdefined(self.var_6a4ce3f7))
			{
				e_attacker zm_score::player_add_points("transform_kill", self.var_6a4ce3f7);
			}
			else
			{
				e_attacker zm_score::player_add_points("transform_kill");
			}
		}
		scoreevents::processscoreevent("kill_catalyst", e_attacker, undefined, self.damageweapon);
	}
}

/*
	Name: function_c8f01c4b
	Namespace: namespace_83bc53d2
	Checksum: 0x79AA789E
	Offset: 0x1CA8
	Size: 0x3C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_c8f01c4b(behaviortreeentity)
{
	behaviortreeentity ghost();
	behaviortreeentity notsolid();
}

/*
	Name: function_f4e7fd8f
	Namespace: namespace_83bc53d2
	Checksum: 0x4CC7B5C4
	Offset: 0x1CF0
	Size: 0x162
	Parameters: 1
	Flags: Linked, Private
*/
function private function_f4e7fd8f(behaviortreeentity)
{
	if(isdefined(behaviortreeentity.enemyoverride) && isdefined(behaviortreeentity.enemyoverride[1]))
	{
		return true;
	}
	if(!isdefined(behaviortreeentity.enemy))
	{
		return true;
	}
	if(isdefined(behaviortreeentity.marked_for_death))
	{
		return true;
	}
	if(is_true(behaviortreeentity.ignoremelee))
	{
		return true;
	}
	if(distancesquared(behaviortreeentity.origin, behaviortreeentity.enemy.origin) > sqr(behaviortreeentity ai::function_9139c839().var_c9e47b3f))
	{
		return true;
	}
	yawtoenemy = angleclamp180(behaviortreeentity.angles[1] - (vectortoangles(behaviortreeentity.enemy.origin - behaviortreeentity.origin)[1]));
	if(abs(yawtoenemy) > 60)
	{
		return true;
	}
	return false;
}

/*
	Name: function_3eaa8337
	Namespace: namespace_83bc53d2
	Checksum: 0xB65D7A
	Offset: 0x1E60
	Size: 0x3E0
	Parameters: 0
	Flags: Linked
*/
function function_3eaa8337()
{
	a_s_spawn_locs = level.zm_loc_types[#"zombie_location"];
	var_91562d8c = [];
	var_f2a95155 = [];
	foreach(s_spawn_loc in a_s_spawn_locs)
	{
		if(isdefined(s_spawn_loc.script_noteworthy) && (s_spawn_loc.script_noteworthy == "riser_location" || s_spawn_loc.script_noteworthy == "faller_location"))
		{
			continue;
		}
		if(s_spawn_loc.script_string == "find_flesh")
		{
			if(!isdefined(var_91562d8c))
			{
				var_91562d8c = [];
			}
			else if(!isarray(var_91562d8c))
			{
				var_91562d8c = array(var_91562d8c);
			}
			var_91562d8c[var_91562d8c.size] = s_spawn_loc;
			continue;
		}
		if(!isdefined(var_f2a95155))
		{
			var_f2a95155 = [];
		}
		else if(!isarray(var_f2a95155))
		{
			var_f2a95155 = array(var_f2a95155);
		}
		var_f2a95155[var_f2a95155.size] = s_spawn_loc;
	}
	if(isdefined(level.zm_loc_types[#"blight_father_location"]) && level.zm_loc_types[#"blight_father_location"].size > 0)
	{
		var_91562d8c = arraycombine(var_91562d8c, level.zm_loc_types[#"blight_father_location"], 0, 0);
	}
	if(isdefined(level.var_78a428fe))
	{
		points = [[level.var_78a428fe]]();
		if(isdefined(points) && points.size > 0)
		{
			var_91562d8c = arraycombine(var_91562d8c, points, 0, 0);
		}
	}
	if(var_91562d8c.size)
	{
		var_d7eff26a = zm_spawner::function_20e7d186(var_91562d8c);
	}
	else
	{
		if(var_f2a95155.size)
		{
			var_d7eff26a = zm_spawner::function_20e7d186(var_f2a95155);
		}
		else
		{
			/#
			#/
			return false;
		}
	}
	if(isdefined(self) && isentity(self))
	{
		self clientfield::set("catalyst_aura_clientfield", 0);
		if(self.var_62e81e47 == 1)
		{
			self clientfield::set("corrosive_miasma_clientfield", 0);
		}
		self namespace_e0710ee6::function_a8dc3363(var_d7eff26a);
		if(isdefined(self))
		{
			self clientfield::set("catalyst_aura_clientfield", self.var_62e81e47);
			if(self.var_62e81e47 == 1)
			{
				self clientfield::set("corrosive_miasma_clientfield", 1);
			}
		}
	}
	return true;
}

/*
	Name: function_5ea7ae19
	Namespace: namespace_83bc53d2
	Checksum: 0xB892299F
	Offset: 0x2248
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function function_5ea7ae19(var_3a145c54)
{
	if(var_3a145c54)
	{
		level thread function_616468cb(self.var_9fde8624);
	}
}

/*
	Name: function_616468cb
	Namespace: namespace_83bc53d2
	Checksum: 0x35CE40D6
	Offset: 0x2288
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function function_616468cb(var_56c95dd4)
{
	level endon(#"game_ended");
	level waittill(#"start_of_round");
	zm_transform::function_bdd8aba6(var_56c95dd4);
}

/*
	Name: function_19287ba5
	Namespace: namespace_83bc53d2
	Checksum: 0xC82735D9
	Offset: 0x22E8
	Size: 0x94
	Parameters: 0
	Flags: Linked, Private
*/
function private function_19287ba5()
{
	self setblackboardattribute("_catalyst_type", "corrosive");
	self thread zm_audio::play_ambient_zombie_vocals();
	self thread zm_audio::zmbaivox_notifyconvert();
	self function_befab5d9();
	self zombie_utility::set_zombie_run_cycle("run");
}

/*
	Name: function_d647a79d
	Namespace: namespace_83bc53d2
	Checksum: 0xB6B26EBD
	Offset: 0x2388
	Size: 0x24
	Parameters: 1
	Flags: Linked, Private
*/
function private function_d647a79d(entity)
{
	return self.var_9fde8624 === #"hash_78ca8e8e6bdbc8ab";
}

/*
	Name: function_cda81e65
	Namespace: namespace_83bc53d2
	Checksum: 0x4DB870C8
	Offset: 0x23B8
	Size: 0x5C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_cda81e65(entity)
{
	entity clientfield::set("corrosive_death_clientfield", 1);
	entity ghost();
	entity notsolid();
}

/*
	Name: function_4329a51b
	Namespace: namespace_83bc53d2
	Checksum: 0x8FF685E
	Offset: 0x2420
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function function_4329a51b(entity)
{
	if(isalive(entity))
	{
		entity thread function_e13aa91c();
	}
}

/*
	Name: function_247a46c1
	Namespace: namespace_83bc53d2
	Checksum: 0x6795BAA5
	Offset: 0x2468
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_247a46c1(entity)
{
	entity clientfield::set("corrosive_miasma_clientfield", 0);
}

/*
	Name: function_d4953883
	Namespace: namespace_83bc53d2
	Checksum: 0x7C23A5C
	Offset: 0x24A0
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_d4953883(notifyhash)
{
	self clientfield::set("corrosive_miasma_clientfield", 0);
}

/*
	Name: function_e13aa91c
	Namespace: namespace_83bc53d2
	Checksum: 0x9D7F294D
	Offset: 0x24D8
	Size: 0x2F2
	Parameters: 0
	Flags: Linked, Private
*/
function private function_e13aa91c()
{
	self notify("41327c1cba20efed");
	self endon("41327c1cba20efed");
	self endon(#"death");
	self endoncallback(&function_d4953883, #"hash_11d4cfae418fcfe1");
	self clientfield::set("corrosive_miasma_clientfield", 1);
	var_7a79774b = function_4d1e7b48("dot_corrosive_catalyst");
	while(true)
	{
		trigger_midpoint = self.origin + (0, 0, self ai::function_9139c839().var_2a523c14 / 2);
		foreach(player in level.players)
		{
			if(isalive(player) && !is_true(player.var_a0a1475c) && !player scene::is_igc_active() && distancesquared(player.origin, self.origin) <= sqr(self ai::function_9139c839().var_f3af70e6) && ((abs(player.origin[2] - trigger_midpoint[2])) <= (self ai::function_9139c839().var_2a523c14 / 2) || (abs(player geteye()[2] - trigger_midpoint[2])) <= (self ai::function_9139c839().var_2a523c14 / 2)))
			{
				player status_effect::status_effect_apply(var_7a79774b, undefined, self, 0);
				player thread zm_audio::create_and_play_dialog(#"hash_50660c7d730b03a1", #"react");
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_30b33bc4
	Namespace: namespace_83bc53d2
	Checksum: 0x66E8EC4
	Offset: 0x27D8
	Size: 0xCA
	Parameters: 0
	Flags: Linked, Private
*/
function private function_30b33bc4()
{
	self setblackboardattribute("_catalyst_type", "electric");
	self function_befab5d9();
	self zombie_utility::set_zombie_run_cycle("run");
	self thread zm_audio::play_ambient_zombie_vocals();
	self thread zm_audio::zmbaivox_notifyconvert();
	self.var_51f067e3 = gettime() + self ai::function_9139c839().var_65b97e5e;
	self.var_eaa92291 = gettime();
}

/*
	Name: function_787ce068
	Namespace: namespace_83bc53d2
	Checksum: 0x2293CDF6
	Offset: 0x28B0
	Size: 0x2F6
	Parameters: 1
	Flags: Linked, Private
*/
function private function_787ce068(behaviortreeentity)
{
	if(!isdefined(behaviortreeentity.var_62e81e47) || behaviortreeentity.var_62e81e47 != 3)
	{
		return 0;
	}
	if(is_true(behaviortreeentity.var_529093ee))
	{
		behaviortreeentity.var_529093ee = 0;
		return 1;
	}
	if(behaviortreeentity.var_eaa92291 > gettime())
	{
		return 0;
	}
	behaviortreeentity.var_eaa92291 = gettime() + 500;
	if(is_true(behaviortreeentity.missinglegs))
	{
		return 0;
	}
	if(isdefined(behaviortreeentity.traversal))
	{
		return 0;
	}
	if(is_true(behaviortreeentity.barricade_enter))
	{
		return 0;
	}
	if(is_true(behaviortreeentity.is_leaping))
	{
		return 0;
	}
	if(is_true(behaviortreeentity.var_a85128a4))
	{
		return 0;
	}
	if(behaviortreeentity.var_51f067e3 > gettime())
	{
		return 0;
	}
	var_55edeb64 = 0;
	foreach(player in level.players)
	{
		if(!zm_utility::is_player_valid(player, 1, 1))
		{
			continue;
		}
		if(isdefined(player.var_6b8f84c7) || is_true(player.var_a0a1475c))
		{
			continue;
		}
		if(player scene::is_igc_active())
		{
			continue;
		}
		if(distancesquared(player.origin, behaviortreeentity.origin) > sqr(self ai::function_9139c839().var_cbf14156))
		{
			continue;
		}
		if(player sightconetrace(behaviortreeentity.origin, behaviortreeentity, anglestoforward(behaviortreeentity.angles), self ai::function_9139c839().var_95922bb3))
		{
			behaviortreeentity.var_529093ee = 1;
			var_55edeb64 = 1;
			break;
		}
	}
	return var_55edeb64;
}

/*
	Name: function_21cbb589
	Namespace: namespace_83bc53d2
	Checksum: 0x47BBB5B7
	Offset: 0x2BB0
	Size: 0x3E
	Parameters: 2
	Flags: Linked, Private
*/
function private function_21cbb589(behaviortreeentity, asmstatename)
{
	animationstatenetworkutility::requeststate(behaviortreeentity, asmstatename);
	behaviortreeentity.var_a85128a4 = 1;
	return 5;
}

/*
	Name: function_d697a1e3
	Namespace: namespace_83bc53d2
	Checksum: 0x4B1C485D
	Offset: 0x2BF8
	Size: 0x21A
	Parameters: 0
	Flags: Linked, Private
*/
function private function_d697a1e3()
{
	self endon(#"hash_321b8431208f19bd", #"death");
	self clientfield::set("electricity_catalyst_blast", 1);
	wait(self ai::function_9139c839().var_ce7e1def);
	while(true)
	{
		foreach(player in level.players)
		{
			if(isdefined(player.var_6b8f84c7) || is_true(player.var_a0a1475c))
			{
				continue;
			}
			if(player laststand::player_is_in_laststand())
			{
				continue;
			}
			if(player scene::is_igc_active())
			{
				continue;
			}
			if(distancesquared(player.origin, self.origin) > sqr(self ai::function_9139c839().var_cbf14156))
			{
				continue;
			}
			if(player sightconetrace(self.origin, self, anglestoforward(self.angles), self ai::function_9139c839().var_95922bb3))
			{
				player thread function_e7a0424c(self);
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_aef521f5
	Namespace: namespace_83bc53d2
	Checksum: 0x5ABAD524
	Offset: 0x2E20
	Size: 0x3C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_aef521f5(behaviortreeentity)
{
	self notify(#"hash_321b8431208f19bd");
	self clientfield::set("electricity_catalyst_blast", 0);
}

/*
	Name: function_6c92ebda
	Namespace: namespace_83bc53d2
	Checksum: 0x6E93D773
	Offset: 0x2E68
	Size: 0xCE
	Parameters: 2
	Flags: Linked, Private
*/
function private function_6c92ebda(behaviortreeentity, asmstatename)
{
	animationstatenetworkutility::requeststate(behaviortreeentity, asmstatename);
	behaviortreeentity notify(#"hash_321b8431208f19bd");
	behaviortreeentity clientfield::set("electricity_catalyst_blast", 0);
	var_12588ac8 = randomfloatrange(behaviortreeentity ai::function_9139c839().var_984d7701, behaviortreeentity ai::function_9139c839().var_58ac6ec4);
	behaviortreeentity.var_51f067e3 = gettime() + var_12588ac8;
	behaviortreeentity.var_a85128a4 = 0;
	return 4;
}

/*
	Name: function_e137506e
	Namespace: namespace_83bc53d2
	Checksum: 0x29294F1B
	Offset: 0x2F40
	Size: 0x66
	Parameters: 1
	Flags: Linked, Private
*/
function private function_e137506e(var_ee511b7d)
{
	self endon(#"death", #"disconnect", #"hash_7283e5f17e4fa10a");
	var_ee511b7d waittill(#"death");
	self notify(#"hash_6407608db0e465ec");
}

/*
	Name: function_73961a38
	Namespace: namespace_83bc53d2
	Checksum: 0xCE4FFBF1
	Offset: 0x2FB0
	Size: 0xF6
	Parameters: 1
	Flags: Linked, Private
*/
function private function_73961a38(notifyhash)
{
	var_80841b2c = function_4d1e7b48("blind_zm_catalyst");
	var_f4addf92 = function_4d1e7b48("deaf_electricity_catalyst");
	if(self status_effect::function_4617032e(var_80841b2c.var_67e2281d))
	{
		self status_effect::function_408158ef(var_80841b2c.var_67e2281d, var_80841b2c.var_18d16a6b);
	}
	if(self status_effect::function_4617032e(var_f4addf92.var_67e2281d))
	{
		self status_effect::function_408158ef(var_f4addf92.var_67e2281d, var_f4addf92.var_18d16a6b);
	}
	self.var_6b8f84c7 = undefined;
	self notify(#"hash_7283e5f17e4fa10a");
}

/*
	Name: function_e7a0424c
	Namespace: namespace_83bc53d2
	Checksum: 0xACFBEBA2
	Offset: 0x30B0
	Size: 0x24C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_e7a0424c(behaviortreeentity)
{
	self.var_6b8f84c7 = behaviortreeentity;
	var_116cfaae = behaviortreeentity ai::function_9139c839().var_10a535a6;
	var_a7594ae8 = behaviortreeentity ai::function_9139c839().var_ea39f524;
	self endoncallback(&function_73961a38, #"death", #"disconnect", #"hash_6407608db0e465ec", #"hash_11d4cfae418fcfe1");
	self thread function_e137506e(self.var_6b8f84c7);
	var_80841b2c = function_4d1e7b48("blind_zm_catalyst");
	self status_effect::status_effect_apply(var_80841b2c, undefined, self.var_6b8f84c7, 0, var_116cfaae);
	self util::delay(1.3, undefined, &zm_audio::create_and_play_dialog, #"hash_4c7748b237c6fcbe", #"react");
	wait(float(var_116cfaae) / 1000);
	if(self status_effect::function_4617032e(var_80841b2c.var_67e2281d))
	{
		self status_effect::function_408158ef(var_80841b2c.var_67e2281d, var_80841b2c.var_18d16a6b);
	}
	util::wait_network_frame();
	self status_effect::status_effect_apply(function_4d1e7b48("deaf_electricity_catalyst"), undefined, self.var_6b8f84c7, 0, var_a7594ae8);
	wait(float(var_a7594ae8) / 1000);
	self function_73961a38();
}

/*
	Name: function_57285eec
	Namespace: namespace_83bc53d2
	Checksum: 0xCE9CB6F0
	Offset: 0x3308
	Size: 0xDE
	Parameters: 0
	Flags: Linked, Private
*/
function private function_57285eec()
{
	self setblackboardattribute("_catalyst_type", "plasma");
	self function_befab5d9();
	self zombie_utility::set_zombie_run_cycle("walk");
	self.var_146fbd4b = (gettime() + self ai::function_9139c839().var_c7d67645) + self ai::function_9139c839().var_65b97e5e;
	self thread zm_audio::zmbaivox_notifyconvert();
	self.var_ab8f2b90 = 2;
	self.b_override_explosive_damage_cap = 1;
}

/*
	Name: function_1043897a
	Namespace: namespace_83bc53d2
	Checksum: 0x33B664F7
	Offset: 0x33F0
	Size: 0x5E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_1043897a(behaviortreeentity)
{
	if(!isdefined(behaviortreeentity.var_62e81e47) || behaviortreeentity.var_62e81e47 != 2)
	{
		return false;
	}
	if(is_true(behaviortreeentity.is_exploding))
	{
		return false;
	}
	return true;
}

/*
	Name: function_dec8327a
	Namespace: namespace_83bc53d2
	Checksum: 0x84ED18B9
	Offset: 0x3458
	Size: 0x19C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_dec8327a(behaviortreeentity)
{
	if(behaviortreeentity.var_62e81e47 !== 2)
	{
		return false;
	}
	if(behaviortreeentity.var_146fbd4b > gettime())
	{
		return false;
	}
	if(is_true(behaviortreeentity.is_exploding))
	{
		return true;
	}
	foreach(player in level.players)
	{
		if(!zombie_utility::is_player_valid(player))
		{
			continue;
		}
		if(is_true(player.var_a0a1475c))
		{
			continue;
		}
		if(player scene::is_igc_active())
		{
			continue;
		}
		if(is_true(player.bgb_in_plain_sight_active))
		{
			continue;
		}
		if(distancesquared(player.origin, behaviortreeentity.origin) <= sqr(behaviortreeentity ai::function_9139c839().var_febbf56f))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_de076722
	Namespace: namespace_83bc53d2
	Checksum: 0xDDE0AD4F
	Offset: 0x3600
	Size: 0xB2
	Parameters: 1
	Flags: Linked, Private
*/
function private function_de076722(entity)
{
	origins = spawnstruct();
	origins.eye = entity geteye();
	origins.feet = entity.origin + vectorscale((0, 0, 1), 8);
	origins.mid = (origins.feet[0], origins.feet[1], (origins.feet[2] + origins.eye[2]) / 2);
	return origins;
}

/*
	Name: function_554a7c58
	Namespace: namespace_83bc53d2
	Checksum: 0x59E71AF0
	Offset: 0x36C0
	Size: 0x1A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_554a7c58(behaviortreeentity)
{
	behaviortreeentity.is_exploding = 1;
}

/*
	Name: function_49248f23
	Namespace: namespace_83bc53d2
	Checksum: 0x3CE7BED5
	Offset: 0x36E8
	Size: 0x166
	Parameters: 2
	Flags: Linked, Private
*/
function private function_49248f23(v_blast_origin, var_84dd3dd)
{
	level endon(#"game_ended");
	var_109e8af9 = 0;
	a_ai = zombie_utility::get_round_enemy_array();
	foreach(entity in a_ai)
	{
		if(!isalive(entity))
		{
			continue;
		}
		if(entity === self)
		{
			continue;
		}
		if(distancesquared(v_blast_origin, entity.origin) > var_84dd3dd)
		{
			continue;
		}
		entity zombie_utility::setup_zombie_knockdown(v_blast_origin);
		var_109e8af9++;
		if(var_109e8af9 >= 6)
		{
			util::wait_network_frame();
			var_109e8af9 = 0;
		}
	}
}

/*
	Name: function_3b07d86e
	Namespace: namespace_83bc53d2
	Checksum: 0xB92C0EB1
	Offset: 0x3858
	Size: 0x3BC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_3b07d86e()
{
	var_f152d0cc = function_de076722(self);
	self clientfield::set("plasma_catalyst_blast", 1);
	v_blast_origin = self.origin;
	var_84dd3dd = sqr(self ai::function_9139c839().var_c30a9dc5);
	var_2ffdfebc = self ai::function_9139c839().var_35692434;
	level notify(#"hash_528115ad9eebc84f");
	if(!self isragdoll())
	{
		foreach(player in getplayers())
		{
			if(!zombie_utility::is_player_valid(player, undefined, undefined, 0))
			{
				continue;
			}
			if(distancesquared(v_blast_origin, player.origin) > var_84dd3dd)
			{
				continue;
			}
			var_d2b8d08a = function_de076722(player);
			if(!bullettracepassed(var_f152d0cc.eye, var_d2b8d08a.eye, 0, undefined))
			{
				if(!bullettracepassed(var_f152d0cc.mid, var_d2b8d08a.mid, 0, undefined))
				{
					if(!bullettracepassed(var_f152d0cc.feet, var_d2b8d08a.feet, 0, undefined))
					{
						continue;
					}
				}
			}
			player dodamage(var_2ffdfebc, v_blast_origin, self, self, "none", "MOD_EXPLOSIVE");
			var_6826a387 = function_4d1e7b48(#"hash_528115ad9eebc84f");
			player status_effect::status_effect_apply(var_6826a387, undefined, self, 0, undefined, undefined, v_blast_origin);
			player thread zm_audio::create_and_play_dialog(#"hash_695932a4ae89574f", #"react");
		}
		level thread function_49248f23(v_blast_origin, var_84dd3dd);
	}
	if(isdefined(self))
	{
		if(zm_utility::is_magic_bullet_shield_enabled(self))
		{
			self util::stop_magic_bullet_shield();
		}
		self val::set(#"catalyst", "hide", 2);
		if(isalive(self))
		{
			self.takedamage = 1;
			self.allowdeath = 1;
			self kill();
		}
	}
}

/*
	Name: function_72a1933a
	Namespace: namespace_83bc53d2
	Checksum: 0xF9F98285
	Offset: 0x3C20
	Size: 0x112
	Parameters: 2
	Flags: Linked, Private
*/
function private function_72a1933a(zombie, catalyst)
{
	if(!isdefined(catalyst.last_closest_player) || !isdefined(catalyst.last_closest_player.cached_zone) || !isdefined(catalyst.cached_zone) || !isdefined(zombie.cached_zone))
	{
		return false;
	}
	if(zombie.completed_emerging_into_playable_area !== 1)
	{
		return false;
	}
	if(zombie.var_d53c2370 !== 1)
	{
		return false;
	}
	if(zombie.var_5c8ac43e === 1)
	{
		return false;
	}
	if(zombie.cached_zone != catalyst.last_closest_player.cached_zone && !isdefined(catalyst.last_closest_player.cached_zone.adjacent_zones[zombie.cached_zone.name]))
	{
		return false;
	}
	return true;
}

/*
	Name: function_d9d6e939
	Namespace: namespace_83bc53d2
	Checksum: 0x57207D62
	Offset: 0x3D40
	Size: 0x24C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_d9d6e939(entity)
{
	if(isdefined(self.var_8020a7f2))
	{
		self.need_closest_player = 0;
		if(isalive(self.var_8020a7f2) && function_72a1933a(self.var_8020a7f2, self))
		{
			self setgoal(self.var_8020a7f2.origin);
			return;
		}
	}
	zombies = getaiarchetypearray(#"zombie");
	var_31a419e0 = [];
	foreach(zombie in zombies)
	{
		if(function_72a1933a(zombie, self))
		{
			if(!isdefined(var_31a419e0))
			{
				var_31a419e0 = [];
			}
			else if(!isarray(var_31a419e0))
			{
				var_31a419e0 = array(var_31a419e0);
			}
			var_31a419e0[var_31a419e0.size] = zombie;
		}
	}
	if(var_31a419e0.size == 0)
	{
		self.var_8020a7f2 = undefined;
		self.b_ignore_cleanup = undefined;
		self.should_zigzag = undefined;
		zm_behavior::zombiefindflesh(entity);
		return;
	}
	self.need_closest_player = 0;
	var_31a419e0 = arraysortclosest(var_31a419e0, entity.origin);
	self.var_8020a7f2 = var_31a419e0[0];
	self.b_ignore_cleanup = 1;
	self.should_zigzag = 0;
	self setgoal(self.var_8020a7f2.origin);
}

/*
	Name: function_177aa69d
	Namespace: namespace_83bc53d2
	Checksum: 0x5942F4DF
	Offset: 0x3F98
	Size: 0x72
	Parameters: 1
	Flags: Linked, Private
*/
function private function_177aa69d(behaviortreeentity)
{
	if(behaviortreeentity.var_62e81e47 === 4 && behaviortreeentity ai::has_behavior_attribute("gravity") && behaviortreeentity ai::get_behavior_attribute("gravity") == "normal")
	{
		return true;
	}
	return false;
}

/*
	Name: function_59e10bc5
	Namespace: namespace_83bc53d2
	Checksum: 0x1143AD9D
	Offset: 0x4018
	Size: 0x12
	Parameters: 0
	Flags: Linked, Private
*/
function private function_59e10bc5()
{
	self.var_d53c2370 = 1;
}

/*
	Name: function_f49b9b11
	Namespace: namespace_83bc53d2
	Checksum: 0xF54AE222
	Offset: 0x4038
	Size: 0x54
	Parameters: 1
	Flags: Private
*/
function private function_f49b9b11(var_3a145c54)
{
	if(is_true(self.var_5c8ac43e))
	{
		if(!isdefined(level.var_53b28340))
		{
			level.var_53b28340 = 1;
		}
		else
		{
			level.var_53b28340++;
		}
	}
}

/*
	Name: function_304eef2e
	Namespace: namespace_83bc53d2
	Checksum: 0xB3573FA0
	Offset: 0x4098
	Size: 0x1C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_304eef2e()
{
	self thread function_e5e8cbd2(1);
}

/*
	Name: function_f9f8d9e6
	Namespace: namespace_83bc53d2
	Checksum: 0xAFD0368C
	Offset: 0x40C0
	Size: 0x134
	Parameters: 0
	Flags: Linked, Private
*/
function private function_f9f8d9e6()
{
	self setblackboardattribute("_catalyst_type", "water");
	self function_befab5d9();
	self zombie_utility::set_zombie_run_cycle("sprint");
	self.var_72411ccf = &function_d9d6e939;
	level.var_1ea3f886 = self ai::function_9139c839().var_803e192e;
	level.var_e1ade08 = self ai::function_9139c839().var_f00dd43c;
	self thread zm_audio::play_ambient_zombie_vocals();
	self thread zm_audio::zmbaivox_notifyconvert();
	wait(self ai::function_9139c839().var_65b97e5e);
	if(isdefined(self))
	{
		self function_12cb11ca();
	}
}

/*
	Name: function_12cb11ca
	Namespace: namespace_83bc53d2
	Checksum: 0x65EB2DBE
	Offset: 0x4200
	Size: 0x34
	Parameters: 0
	Flags: Linked, Private
*/
function private function_12cb11ca()
{
	if(isalive(self))
	{
		self thread function_75070c6();
	}
}

/*
	Name: function_75070c6
	Namespace: namespace_83bc53d2
	Checksum: 0xCD67C5DE
	Offset: 0x4240
	Size: 0x220
	Parameters: 0
	Flags: Linked, Private
*/
function private function_75070c6()
{
	self endon(#"death");
	while(true)
	{
		trigger_height = self ai::function_9139c839().var_1803b87d;
		var_a00ff069 = sqr(self ai::function_9139c839().var_baa0ac60);
		foreach(zombie in zombie_utility::get_round_enemy_array())
		{
			if(isalive(zombie) && is_true(zombie.var_d53c2370) && !is_true(zombie.var_5c8ac43e))
			{
				if(zombie.origin[2] >= self.origin[2] && (abs(zombie.origin[2] - self.origin[2])) <= trigger_height && distancesquared(zombie.origin, self.origin) <= var_a00ff069)
				{
					zombie thread function_e5e8cbd2(0);
					wait(2);
				}
			}
		}
		wait(randomfloatrange(0.1, 0.2));
	}
}

/*
	Name: function_e5e8cbd2
	Namespace: namespace_83bc53d2
	Checksum: 0xEF0A1804
	Offset: 0x4468
	Size: 0x1D4
	Parameters: 1
	Flags: Linked
*/
function function_e5e8cbd2(b_respawn)
{
	self notify(#"hash_25ca29da51a78702");
	self endon(#"hash_25ca29da51a78702");
	self.var_5c8ac43e = 1;
	if(isdefined(level.var_e1ade08))
	{
		self.var_9b416b35 = level.var_e1ade08;
	}
	if(!b_respawn && isdefined(level.var_1ea3f886))
	{
		self.health = int(self.health * level.var_1ea3f886);
	}
	self.var_bd2c55ef = 1;
	if(!isdefined(self.var_e0d660f6))
	{
		self.var_e0d660f6 = [];
	}
	else if(!isarray(self.var_e0d660f6))
	{
		self.var_e0d660f6 = array(self.var_e0d660f6);
	}
	if(!isinarray(self.var_e0d660f6, &function_304eef2e))
	{
		self.var_e0d660f6[self.var_e0d660f6.size] = &function_304eef2e;
	}
	self clientfield::set("water_catalyst_purified", 1);
	self thread zm_audio::function_ef9ba49c(#"hash_4433242e2d225df8");
	self waittill(#"death");
	if(isdefined(self))
	{
		self clientfield::set("water_catalyst_purified", 0);
	}
}

/*
	Name: function_50a8406d
	Namespace: namespace_83bc53d2
	Checksum: 0xC1B72833
	Offset: 0x4648
	Size: 0x1A
	Parameters: 0
	Flags: Linked
*/
function function_50a8406d()
{
	return is_true(self.var_5c8ac43e);
}

/*
	Name: function_22e12b7
	Namespace: namespace_83bc53d2
	Checksum: 0xF13AA56B
	Offset: 0x4670
	Size: 0xE0
	Parameters: 10
	Flags: Linked, Private
*/
function private function_22e12b7(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime)
{
	if(isdefined(shitloc) && shitloc function_50a8406d() && isdefined(shitloc.var_9b416b35) && !is_true(self.var_a0a1475c))
	{
		return int(ceil(psoffsettime * shitloc.var_9b416b35));
	}
	return -1;
}

/*
	Name: function_55c235fa
	Namespace: namespace_83bc53d2
	Checksum: 0x4BEE1F78
	Offset: 0x4758
	Size: 0x54
	Parameters: 1
	Flags: None
*/
function function_55c235fa(s_spot)
{
	if(isdefined(level.var_c97f9f06))
	{
		self thread [[level.var_c97f9f06]](s_spot);
	}
	if(isdefined(level.var_ce7b374c))
	{
		self thread [[level.var_ce7b374c]]();
	}
}

/*
	Name: function_6e75e858
	Namespace: namespace_83bc53d2
	Checksum: 0xC62C330B
	Offset: 0x47B8
	Size: 0xE8
	Parameters: 0
	Flags: Linked
*/
function function_6e75e858()
{
	level.var_aa069b5 = getentarray("zombie_catalyst_spawner", "script_noteworthy");
	if(level.var_aa069b5.size == 0)
	{
		return;
	}
	foreach(var_c1da220b in level.var_aa069b5)
	{
		var_c1da220b.is_enabled = 1;
		var_c1da220b.script_forcespawn = 1;
		var_c1da220b spawner::add_spawn_function(&catalyst_init);
	}
}

/*
	Name: catalyst_init
	Namespace: namespace_83bc53d2
	Checksum: 0x80F724D1
	Offset: 0x48A8
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function catalyst_init()
{
}

/*
	Name: function_da7cd6ce
	Namespace: namespace_83bc53d2
	Checksum: 0x27908EB3
	Offset: 0x48B8
	Size: 0xAA
	Parameters: 0
	Flags: None
*/
function function_da7cd6ce()
{
	n_player_count = zm_utility::function_a2541519(level.players.size);
	switch(n_player_count)
	{
		case 1:
		{
			return 1;
			break;
		}
		case 2:
		{
			return 2;
			break;
		}
		case 3:
		{
			return 3;
			break;
		}
		case 4:
		{
			return 4;
			break;
		}
	}
}

/*
	Name: function_bbb2bab5
	Namespace: namespace_83bc53d2
	Checksum: 0x8AE7132B
	Offset: 0x4970
	Size: 0xB8
	Parameters: 1
	Flags: Linked
*/
function function_bbb2bab5(var_3d9951bb)
{
	var_b62aefe1 = function_e1763259(var_3d9951bb);
	foreach(e_spawner in level.var_aa069b5)
	{
		if(e_spawner.var_9fde8624 == var_b62aefe1)
		{
			return e_spawner;
		}
	}
	return undefined;
}

/*
	Name: function_39212989
	Namespace: namespace_83bc53d2
	Checksum: 0x48895A17
	Offset: 0x4A30
	Size: 0x242
	Parameters: 0
	Flags: Linked
*/
function function_39212989()
{
	if(!level flag::get("spawn_zombies") && !is_true(level.var_c9f5947d))
	{
		return 0;
	}
	if(is_true(level.var_5e45f817))
	{
		return 0;
	}
	if(namespace_e0710ee6::function_db610082() == 0)
	{
		return 0;
	}
	if(is_true(level.var_4a03b294))
	{
		return 1;
	}
	if(isdefined(self.var_641025d6) && self.var_641025d6 > gettime())
	{
		return 0;
	}
	if(is_true(self.var_9528ba7a))
	{
		return 1;
	}
	var_57bb4de2 = 0;
	foreach(player in level.players)
	{
		if(!isalive(player))
		{
			continue;
		}
		if(distancesquared(player.origin, self.origin) < 147456)
		{
			continue;
		}
		if(distancesquared(player.origin, self.origin) > 589824)
		{
			continue;
		}
		var_57bb4de2 = self sightconetrace(player geteye(), player, anglestoforward(player.angles));
		if(var_57bb4de2)
		{
			break;
		}
	}
	return var_57bb4de2;
}

/*
	Name: function_f4043bc8
	Namespace: namespace_83bc53d2
	Checksum: 0x682F4FFE
	Offset: 0x4C80
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_f4043bc8()
{
	self.b_ignore_cleanup = 1;
	self thread zm_audio::function_ef9ba49c(#"hash_3a2923869483d05");
}

/*
	Name: function_2ed1300e
	Namespace: namespace_83bc53d2
	Checksum: 0xB3547696
	Offset: 0x4CC0
	Size: 0x1A
	Parameters: 1
	Flags: Linked
*/
function function_2ed1300e(n_health_percent)
{
	self.var_d67de8a4 = n_health_percent;
}

/*
	Name: function_bbe2a1d2
	Namespace: namespace_83bc53d2
	Checksum: 0xA3FC723A
	Offset: 0x4CE8
	Size: 0x26
	Parameters: 1
	Flags: Linked
*/
function function_bbe2a1d2(var_3b720eb2)
{
	if(isdefined(self))
	{
		self notify(#"risen");
	}
}

/*
	Name: function_e1763259
	Namespace: namespace_83bc53d2
	Checksum: 0x8665557A
	Offset: 0x4D18
	Size: 0xC6
	Parameters: 1
	Flags: Linked
*/
function function_e1763259(var_3d9951bb)
{
	switch(var_3d9951bb)
	{
		case 1:
		{
			var_b62aefe1 = #"hash_78ca8e8e6bdbc8ab";
			break;
		}
		case 3:
		{
			var_b62aefe1 = #"hash_266b62e342076a90";
			break;
		}
		case 2:
		{
			var_b62aefe1 = #"hash_5cfa99582cc66c59";
			break;
		}
		case 4:
		{
			var_b62aefe1 = #"hash_5d6b55906fc82ff2";
			break;
		}
	}
	return var_b62aefe1;
}

/*
	Name: function_b2090194
	Namespace: namespace_83bc53d2
	Checksum: 0x3E183AEE
	Offset: 0x4DE8
	Size: 0x8C
	Parameters: 1
	Flags: None
*/
function function_b2090194(var_3d9951bb)
{
	if(!isdefined(var_3d9951bb))
	{
		zm_transform::function_d2374144(self, function_e1763259(randomintrange(1, 5)));
	}
	else
	{
		var_b62aefe1 = function_e1763259(var_3d9951bb);
		zm_transform::function_d2374144(self, var_b62aefe1);
	}
}

/*
	Name: function_439c457c
	Namespace: namespace_83bc53d2
	Checksum: 0x94C0FB6D
	Offset: 0x4E80
	Size: 0x13A
	Parameters: 13
	Flags: Linked
*/
function function_439c457c(inflictor, attacker, damage, flags, meansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype)
{
	if(isdefined(psoffsettime) && isplayer(psoffsettime) && isdefined(self.var_62e81e47) && isdefined(surfacetype) && isdefined(psoffsettime.var_b01de37))
	{
		var_e5088518 = aat::function_702fb333(surfacetype);
		if(self.var_62e81e47 === psoffsettime.var_b01de37[var_e5088518])
		{
			boneindex = boneindex * 2;
			if(boneindex >= self.health || psoffsettime zm_powerups::is_insta_kill_active())
			{
				self.var_85387c5b = 1;
			}
		}
	}
	return boneindex;
}

/*
	Name: function_d0673f24
	Namespace: namespace_83bc53d2
	Checksum: 0xDACAE21C
	Offset: 0x4FC8
	Size: 0x19C
	Parameters: 2
	Flags: Linked
*/
function function_d0673f24(player, v_loc)
{
	self clientfield::increment("catalyst_damage_explosion_clientfield");
	a_ai_zombies = array::get_all_closest(v_loc, getaiteamarray(level.zombie_team), array(self), undefined, self ai::function_9139c839().var_746e06db);
	level notify(#"hash_166cac102910cdb3");
	if(a_ai_zombies.size == 0)
	{
		return;
	}
	foreach(ai_zombie in a_ai_zombies)
	{
		if(!isalive(ai_zombie))
		{
			continue;
		}
		ai_zombie function_3f664506(self, player, v_loc);
		waitframe(1);
	}
	if(isalive(self))
	{
		self thread function_27a8f02d();
	}
}

/*
	Name: function_3f664506
	Namespace: namespace_83bc53d2
	Checksum: 0x16B75737
	Offset: 0x5170
	Size: 0x26C
	Parameters: 3
	Flags: Linked
*/
function function_3f664506(var_b8bbcd96, player, v_loc)
{
	if(!isalive(self) || zm_utility::is_magic_bullet_shield_enabled(self))
	{
		return;
	}
	if(is_true(self.var_69a981e6))
	{
		return;
	}
	if(is_true(self.aat_turned))
	{
		return;
	}
	if(!isdefined(self.var_6f84b820))
	{
		return;
	}
	b_stun = 0;
	switch(self.var_6f84b820)
	{
		case "normal":
		{
			var_103da188 = self.health;
			if(self.archetype === #"zombie" || self.archetype === #"catalyst")
			{
				self function_27a8f02d();
			}
			break;
		}
		case "special":
		{
			var_103da188 = self.maxhealth * 0.5;
			b_stun = 1;
			break;
		}
		case "elite":
		{
			var_103da188 = self.maxhealth * 0.2;
			b_stun = 1;
			break;
		}
		case "boss":
		{
			var_103da188 = 2700;
			break;
		}
		default:
		{
			var_103da188 = self.health;
		}
	}
	if(isalive(self))
	{
		self dodamage(var_103da188, v_loc, player, var_b8bbcd96, "none", "MOD_EXPLOSIVE", 0, player getcurrentweapon());
		if(isalive(self) && b_stun)
		{
			self thread ai::stun();
		}
	}
}

/*
	Name: function_27a8f02d
	Namespace: namespace_83bc53d2
	Checksum: 0x71D150EF
	Offset: 0x53E8
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function function_27a8f02d()
{
	gibserverutils::gibhead(self, 0);
	gibserverutils::gibleftarm(self, 0);
	gibserverutils::gibrightarm(self, 0);
	gibserverutils::giblegs(self, 0);
}

/*
	Name: function_587a3171
	Namespace: namespace_83bc53d2
	Checksum: 0xF3B490CE
	Offset: 0x5458
	Size: 0x1C0
	Parameters: 1
	Flags: Linked
*/
function function_587a3171(n_round_number)
{
	level endon(#"end_game");
	var_f31e767a = array::randomize(array(1, 3, 2, 4));
	/#
		var_47099258 = level.round_number - n_round_number;
		if(var_47099258 >= 4)
		{
			var_f31e767a = undefined;
		}
		else if(var_47099258 > 0)
		{
			for(i = 0; i < var_47099258; i++)
			{
				arrayremoveindex(var_f31e767a, 0);
			}
		}
	#/
	while(true)
	{
		level waittill(#"hash_5d3012139f083ccb");
		if(namespace_c3287616::function_d0db51fc(#"catalyst"))
		{
			if(isdefined(var_f31e767a))
			{
				level.var_1643d0d = array(array::pop(var_f31e767a));
				if(!var_f31e767a.size)
				{
					var_f31e767a = undefined;
				}
			}
			else
			{
				level.var_1643d0d = arraycopy(level.var_3ecc60fc);
				arrayremoveindex(level.var_1643d0d, randomint(level.var_1643d0d.size));
			}
		}
	}
}

/*
	Name: function_55f82550
	Namespace: namespace_83bc53d2
	Checksum: 0xE418F468
	Offset: 0x5620
	Size: 0xA2
	Parameters: 1
	Flags: Linked
*/
function function_55f82550(var_dbce0c44)
{
	var_8cf00d40 = int(floor(var_dbce0c44 / 25));
	var_a1737466 = randomfloatrange(0.08, 0.12);
	return min(var_8cf00d40, int(level.zombie_total * var_a1737466));
}

/*
	Name: round_spawn
	Namespace: namespace_83bc53d2
	Checksum: 0x25FB86F7
	Offset: 0x56D0
	Size: 0x13E
	Parameters: 0
	Flags: Linked
*/
function round_spawn()
{
	if(!isdefined(level.var_1643d0d))
	{
		level.var_1643d0d = arraycopy(level.var_3ecc60fc);
		arrayremoveindex(level.var_1643d0d, randomint(level.var_1643d0d.size));
	}
	var_3d9951bb = array::random(level.var_1643d0d);
	if(isdefined(level.var_ed006fe8))
	{
		if(!isdefined(level.var_ed006fe8))
		{
			level.var_ed006fe8 = [];
		}
		else if(!isarray(level.var_ed006fe8))
		{
			level.var_ed006fe8 = array(level.var_ed006fe8);
		}
		var_3d9951bb = array::random(level.var_ed006fe8);
	}
	zm_transform::function_bdd8aba6(function_e1763259(var_3d9951bb));
	return false;
}

/*
	Name: function_255c7194
	Namespace: namespace_83bc53d2
	Checksum: 0x88195299
	Offset: 0x5818
	Size: 0xA4
	Parameters: 0
	Flags: Private
*/
function private function_255c7194()
{
	/#
		player = getplayers()[0];
		queryresult = positionquery_source_navigation(player.origin, 256, 512, 128, 20);
		if(isdefined(queryresult) && queryresult.data.size > 0)
		{
			return queryresult.data[0];
		}
		return {#origin:player.origin};
	#/
}

/*
	Name: function_fa69f8d2
	Namespace: namespace_83bc53d2
	Checksum: 0xFC81FDF9
	Offset: 0x58C8
	Size: 0x36C
	Parameters: 1
	Flags: Private
*/
function private function_fa69f8d2(type)
{
	/#
		var_7a56405a = [];
		var_7a56405a[1] = #"hash_78ca8e8e6bdbc8ab";
		var_7a56405a[3] = #"hash_266b62e342076a90";
		var_7a56405a[2] = #"hash_5cfa99582cc66c59";
		var_7a56405a[4] = #"hash_5d6b55906fc82ff2";
		player = getplayers()[0];
		direction = player getplayerangles();
		direction_vec = anglestoforward(direction);
		eye = player geteye();
		scale = 8000;
		direction_vec = (direction_vec[0] * scale, direction_vec[1] * scale, direction_vec[2] * scale);
		trace = bullettrace(eye, eye + direction_vec, 0, undefined);
		catalyst_zombie = undefined;
		var_16805a00 = getspawnerarray("", "");
		if(var_16805a00.size == 0)
		{
			iprintln("");
			return;
		}
		if(!isdefined(var_7a56405a[type]))
		{
			iprintln("" + type);
			return;
		}
		foreach(spawner in var_16805a00)
		{
			if(spawner.var_9fde8624 === var_7a56405a[type])
			{
				catalyst_spawner = spawner;
				break;
			}
		}
		if(!isdefined(catalyst_spawner))
		{
			iprintln("" + var_7a56405a[type]);
			return;
		}
		catalyst_zombie = zombie_utility::spawn_zombie(catalyst_spawner, undefined, catalyst_spawner);
		if(isdefined(catalyst_zombie))
		{
			wait(0.5);
			catalyst_zombie zm_transform::function_bbaec2fd();
			catalyst_zombie forceteleport(trace[#"position"], player.angles + vectorscale((0, 1, 0), 180));
			if(catalyst_zombie.var_62e81e47 == 1)
			{
				level thread function_4329a51b(catalyst_zombie);
			}
		}
	#/
}

/*
	Name: function_1a0ae193
	Namespace: namespace_83bc53d2
	Checksum: 0xE858F142
	Offset: 0x5C40
	Size: 0x178
	Parameters: 0
	Flags: Private
*/
function private function_1a0ae193()
{
	/#
		mapname = util::function_53bbf9d2();
		adddebugcommand(("" + 1) + "");
		adddebugcommand(("" + 3) + "");
		adddebugcommand(("" + 2) + "");
		adddebugcommand(("" + 4) + "");
		while(true)
		{
			waitframe(1);
			if(getdvarstring(#"hash_403368b958977fcb", "") != "")
			{
				function_fa69f8d2(int(getdvarstring(#"hash_403368b958977fcb")));
				setdvar(#"hash_403368b958977fcb", "");
			}
		}
	#/
}

