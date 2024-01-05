#using scripts\zm_common\ai\zm_ai_utility.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;
#using scripts\zm_common\zm_cleanup_mgr.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_round_spawning.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using script_3819e7a1427df6d2;
#using script_26cd04df32f6537a;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;

#namespace namespace_abfee9ba;

/*
	Name: function_845dffd3
	Namespace: namespace_abfee9ba
	Checksum: 0x451ED172
	Offset: 0x130
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_845dffd3()
{
	level notify(-2010105759);
}

/*
	Name: __init__system__
	Namespace: namespace_abfee9ba
	Checksum: 0xCD07A05D
	Offset: 0x150
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_55f568f82a7aea28", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_abfee9ba
	Checksum: 0x98AEDE42
	Offset: 0x1A8
	Size: 0xFC
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	clientfield::register("scriptmover", "" + #"hash_3220b44880f1807c", 24000, 1, "counter");
	zm_round_spawning::register_archetype(#"tormentor", &function_44d45595, &round_spawn, &function_dfa96d1f, 25);
	spawner::add_archetype_spawn_function(#"tormentor", &function_a5cd9e54);
	zm_cleanup::function_cdf5a512(#"tormentor", &function_d8461453);
}

/*
	Name: function_8ac3bea9
	Namespace: namespace_abfee9ba
	Checksum: 0x80F724D1
	Offset: 0x2B0
	Size: 0x4
	Parameters: 0
	Flags: Private
*/
function private function_8ac3bea9()
{
}

/*
	Name: function_a5cd9e54
	Namespace: namespace_abfee9ba
	Checksum: 0x28073038
	Offset: 0x2C0
	Size: 0xD4
	Parameters: 0
	Flags: None
*/
function function_a5cd9e54()
{
	self.no_gib = 1;
	self zombie_utility::set_zombie_run_cycle(#"super_sprint");
	self.allowdeath = 1;
	self.allowpain = 0;
	self.is_zombie = 1;
	self.var_78f17f6b = 1;
	self.var_12af7864 = 1;
	self.canbetargetedbyturnedzombies = 1;
	self.var_e8920729 = 1;
	self thread function_5e09bd0f();
	aiutility::addaioverridedamagecallback(self, &function_354a904e);
	level thread zm_spawner::zombie_death_event(self);
}

/*
	Name: function_354a904e
	Namespace: namespace_abfee9ba
	Checksum: 0xFD03DCFF
	Offset: 0x3A0
	Size: 0xAA
	Parameters: 13
	Flags: Private
*/
function private function_354a904e(inflictor, attacker, damage, dflags, mod, weapon, var_fd90b0bb, point, dir, hitloc, offsettime, boneindex, modelindex)
{
	if(boneindex.archetype === #"tormentor" && boneindex.team === self.team)
	{
		return 0;
	}
	return modelindex;
}

/*
	Name: spawn_single
	Namespace: namespace_abfee9ba
	Checksum: 0xBE3E0F2F
	Offset: 0x458
	Size: 0x198
	Parameters: 3
	Flags: None
*/
function spawn_single(b_force_spawn, var_eb3a8721, var_bc66d64b)
{
	if(!isdefined(var_eb3a8721))
	{
		var_eb3a8721 = 0;
	}
	if(!var_eb3a8721 && !function_e0968877())
	{
		return undefined;
	}
	s_spawn_loc = var_bc66d64b;
	if(!isdefined(s_spawn_loc))
	{
		if(level.zm_loc_types[#"zombie_location"].size > 0)
		{
			s_spawn_loc = array::random(level.zm_loc_types[#"zombie_location"]);
		}
		else
		{
			/#
				iprintlnbold("");
			#/
			if(getdvarint(#"hash_1f8efa579fee787c", 0))
			{
			}
			return undefined;
		}
	}
	ai = spawnactor(#"hash_51edd7595ecda822", s_spawn_loc.origin, s_spawn_loc.angles);
	if(isdefined(ai))
	{
		ai.script_string = s_spawn_loc.script_string;
		ai.find_flesh_struct_string = s_spawn_loc.script_string;
		ai.check_point_in_enabled_zone = &zm_utility::check_point_in_playable_area;
		ai.ignore_enemy_count = 0;
		ai thread zm_utility::move_zombie_spawn_location(s_spawn_loc);
	}
	return ai;
}

/*
	Name: round_spawn
	Namespace: namespace_abfee9ba
	Checksum: 0xAC024CB2
	Offset: 0x5F8
	Size: 0x2E
	Parameters: 0
	Flags: None
*/
function round_spawn()
{
	ai = spawn_single();
	if(isdefined(ai))
	{
		return true;
	}
	return false;
}

/*
	Name: function_e0968877
	Namespace: namespace_abfee9ba
	Checksum: 0x8E3273C0
	Offset: 0x630
	Size: 0x72
	Parameters: 0
	Flags: None
*/
function function_e0968877()
{
	n_alive = function_9f679c3c();
	var_12e5a581 = function_4b283bfa();
	if(n_alive >= var_12e5a581 || !level flag::get("spawn_zombies"))
	{
		return false;
	}
	return true;
}

/*
	Name: function_4b283bfa
	Namespace: namespace_abfee9ba
	Checksum: 0x26023529
	Offset: 0x6B0
	Size: 0xB2
	Parameters: 0
	Flags: None
*/
function function_4b283bfa()
{
	n_player_count = zm_utility::function_a2541519(getplayers().size);
	switch(n_player_count)
	{
		case 1:
		default:
		{
			return 3;
		}
		case 2:
		{
			return 5;
		}
		case 3:
		{
			return 7;
		}
		case 4:
		{
			return 10;
		}
	}
}

/*
	Name: function_9f679c3c
	Namespace: namespace_abfee9ba
	Checksum: 0xBBC2704
	Offset: 0x770
	Size: 0xCA
	Parameters: 0
	Flags: None
*/
function function_9f679c3c()
{
	a_ais = getaiarchetypearray(#"tormentor");
	n_ai_alive = a_ais.size;
	foreach(ai in a_ais)
	{
		if(!isalive(ai))
		{
			n_ai_alive--;
		}
	}
	return n_ai_alive;
}

/*
	Name: function_5e09bd0f
	Namespace: namespace_abfee9ba
	Checksum: 0x1446E7D5
	Offset: 0x848
	Size: 0xC8
	Parameters: 0
	Flags: None
*/
function function_5e09bd0f()
{
	self endon(#"death", #"entitydeleted", #"hash_19ad6f62d697788f");
	wait(1.1);
	self playsoundontag(#"hash_65eb1e22e2f9a826", "j_head");
	wait(2);
	while(true)
	{
		self playsoundontag(#"hash_a3c5d5d69e0fc95", "j_head");
		wait(randomfloatrange(1.9, 2.4));
	}
}

/*
	Name: function_44d45595
	Namespace: namespace_abfee9ba
	Checksum: 0x787F77FC
	Offset: 0x918
	Size: 0x162
	Parameters: 1
	Flags: None
*/
function function_44d45595(var_dbce0c44)
{
	if(zm_round_spawning::function_fab464c4(level.round_number))
	{
		a_e_players = getplayers();
		if(level.var_f4b9daca < 3)
		{
			n_max = a_e_players.size * 8;
		}
		else
		{
			n_max = a_e_players.size * 10;
		}
		return n_max;
	}
	var_8cf00d40 = int(floor(var_dbce0c44 / 25));
	if(level.round_number < 20)
	{
		var_a5e820a7 = 0.02;
	}
	else
	{
		if(level.round_number < 30)
		{
			var_a5e820a7 = 0.03;
		}
		else
		{
			var_a5e820a7 = 0.04;
		}
	}
	n_max = min(var_8cf00d40, int(ceil(level.zombie_total * var_a5e820a7)));
	return n_max;
}

/*
	Name: function_55413772
	Namespace: namespace_abfee9ba
	Checksum: 0x6DB27441
	Offset: 0xA88
	Size: 0xA4
	Parameters: 1
	Flags: None
*/
function function_55413772(s_spawn_loc)
{
	level endon(#"end_game");
	var_c0ef5a0c = util::spawn_model("tag_origin", s_spawn_loc.origin, s_spawn_loc.angles);
	var_c0ef5a0c clientfield::increment("" + #"hash_3220b44880f1807c");
	wait(5);
	if(isdefined(var_c0ef5a0c))
	{
		var_c0ef5a0c delete();
	}
}

/*
	Name: function_dfa96d1f
	Namespace: namespace_abfee9ba
	Checksum: 0x3CEBE8B2
	Offset: 0xB38
	Size: 0x62
	Parameters: 1
	Flags: None
*/
function function_dfa96d1f(var_199d73cc)
{
	if(!isdefined(var_199d73cc))
	{
		var_199d73cc = undefined;
	}
	s_spawn_loc = function_a58fe5b7(var_199d73cc);
	if(!isdefined(s_spawn_loc))
	{
		return undefined;
	}
	ai = function_71f8127a(s_spawn_loc);
	return ai;
}

/*
	Name: function_71f8127a
	Namespace: namespace_abfee9ba
	Checksum: 0x576BF23E
	Offset: 0xBA8
	Size: 0xE2
	Parameters: 1
	Flags: None
*/
function function_71f8127a(s_spawn_loc)
{
	level thread function_55413772(s_spawn_loc);
	wait(1);
	ai = spawnactor(#"hash_51edd7595ecda822", s_spawn_loc.origin, s_spawn_loc.angles);
	if(isdefined(ai))
	{
		earthquake(0.5, 0.75, ai.origin, 1000);
		ai.no_powerups = 1;
		if(isdefined(s_spawn_loc.script_string))
		{
			ai.script_string = s_spawn_loc.script_string;
			ai.find_flesh_struct_string = s_spawn_loc.script_string;
		}
		return ai;
	}
	return undefined;
}

/*
	Name: function_a58fe5b7
	Namespace: namespace_abfee9ba
	Checksum: 0xDF4D328B
	Offset: 0xC98
	Size: 0x624
	Parameters: 1
	Flags: None
*/
function function_a58fe5b7(var_199d73cc)
{
	if(!isdefined(var_199d73cc))
	{
		var_199d73cc = undefined;
	}
	if(function_a1ef346b().size != 0)
	{
		if(isdefined(var_199d73cc))
		{
			var_9769213d = var_199d73cc;
		}
		else
		{
			var_9769213d = array::random(function_a1ef346b());
		}
		var_a2105b2a = 0;
		while(var_a2105b2a <= 20 && isdefined(var_9769213d))
		{
			if(var_a2105b2a < 10)
			{
				var_ef8e1e71 = randomintrange(400, 1000);
				var_9d7713d9 = randomintrange(400, 1000);
			}
			else
			{
				if(var_a2105b2a < 15)
				{
					var_ef8e1e71 = randomintrange(400, 1000) / 2;
					var_9d7713d9 = randomintrange(400, 1000) / 2;
				}
				else
				{
					var_ef8e1e71 = randomintrange(400, 1000) / 4;
					var_9d7713d9 = randomintrange(400, 1000) / 4;
				}
			}
			if(isdefined(var_199d73cc) && var_a2105b2a < 15)
			{
				var_bf1cc8e2 = var_9769213d.origin + (var_ef8e1e71 * anglestoforward((0, var_199d73cc.angles[1], 0)));
				var_bf1cc8e2 = var_bf1cc8e2 + (var_9d7713d9 / 4) * (array::random([1:1, 0:-1])) * anglestoright((0, var_199d73cc.angles[1], 0));
				traceresult = groundtrace(var_bf1cc8e2, var_bf1cc8e2 + (vectorscale((0, 0, -1), 100)), 0, 0);
				if(isdefined(traceresult[#"position"]))
				{
					var_bf1cc8e2 = traceresult[#"position"];
				}
			}
			else
			{
				if(isvec(var_9769213d.origin))
				{
					var_db8ceb36 = var_9769213d.origin[0] + (var_ef8e1e71 * (array::random([1:1, 0:-1])));
					var_c93ec69a = var_9769213d.origin[1] + (var_9d7713d9 * (array::random([1:1, 0:-1])));
					var_772fa27d = var_9769213d.origin[2];
					var_bf1cc8e2 = (var_db8ceb36, var_c93ec69a, var_772fa27d);
				}
				else
				{
					var_a2105b2a++;
				}
				traceresult = groundtrace(var_bf1cc8e2, var_bf1cc8e2 + (vectorscale((0, 0, -1), 100)), 0, 0);
				if(isdefined(traceresult[#"position"]))
				{
					var_bf1cc8e2 = traceresult[#"position"];
				}
			}
			spawn_loc = getclosestpointonnavmesh(var_bf1cc8e2, 100, 15);
			if(isdefined(spawn_loc))
			{
				zone = zm_zonemgr::get_zone_from_position(spawn_loc);
				if(isarray(level.var_c9350d57))
				{
					if(isdefined(zone) && isinarray(level.var_c9350d57, zone))
					{
						return undefined;
					}
				}
				/#
					if(isdefined(zone))
					{
						iprintlnbold(zone);
					}
				#/
				if(is_true(zm_zonemgr::zone_is_enabled(zone)) && is_true(level.zones[zone].is_active) && zm_utility::check_point_in_playable_area(spawn_loc))
				{
					/#
						iprintlnbold((((spawn_loc[0] + "") + spawn_loc[1]) + "") + spawn_loc[2]);
					#/
					s_spawn_loc = spawnstruct();
					s_spawn_loc.origin = spawn_loc;
					s_spawn_loc.angles = vectortoangles(var_9769213d.origin - spawn_loc);
					break;
				}
			}
			else
			{
				var_a2105b2a++;
			}
			waitframe(1);
		}
	}
	else
	{
		/#
			iprintlnbold("");
		#/
		if(getdvarint(#"hash_1f8efa579fee787c", 0))
		{
		}
		return undefined;
	}
	return s_spawn_loc;
}

/*
	Name: function_d8461453
	Namespace: namespace_abfee9ba
	Checksum: 0x9DA57810
	Offset: 0x12C8
	Size: 0x106
	Parameters: 0
	Flags: None
*/
function function_d8461453()
{
	s_spawn_loc = function_a58fe5b7();
	if(!isdefined(s_spawn_loc))
	{
		return false;
	}
	if(isdefined(self) && isentity(self))
	{
		self endon(#"death");
		level thread function_55413772(s_spawn_loc);
		wait(1);
		self zm_ai_utility::function_a8dc3363(s_spawn_loc);
		earthquake(0.5, 0.75, self.origin, 1000);
		self.no_powerups = 1;
		if(isdefined(s_spawn_loc.script_string))
		{
			self.script_string = s_spawn_loc.script_string;
			self.find_flesh_struct_string = s_spawn_loc.script_string;
		}
	}
	return true;
}

