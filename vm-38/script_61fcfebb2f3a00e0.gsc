#using script_744259b349d834c7;
#using scripts\zm_common\ai\zm_ai_utility.gsc;
#using scripts\zm_common\zm_round_spawning.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using script_799de24f8ad427f7;
#using scripts\zm_common\zm_cleanup_mgr.gsc;
#using scripts\zm_common\zm_behavior.gsc;
#using scripts\zm_common\zm.gsc;
#using script_2c5daa95f8fec03c;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace zm_ai_soa;

/*
	Name: function_43b10765
	Namespace: zm_ai_soa
	Checksum: 0x18F004BE
	Offset: 0x190
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_43b10765()
{
	level notify(-1119505930);
}

/*
	Name: __init__system__
	Namespace: zm_ai_soa
	Checksum: 0x93FC66D3
	Offset: 0x1B0
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_ai_soa", &function_70a657d8, undefined, undefined, "zm_destination_manager");
}

/*
	Name: function_70a657d8
	Namespace: zm_ai_soa
	Checksum: 0xC312CDD9
	Offset: 0x200
	Size: 0x14C
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	spawner::add_archetype_spawn_function(#"soa", &function_49bf8a32);
	spawner::function_89a2cd87(#"soa", &function_751146f8);
	zm_round_spawning::register_archetype(#"soa", &function_76a7a9ef, &function_ecce5272, &function_e803632f, 80);
	zm_cleanup::function_cdf5a512(#"soa", &function_9310b9ca);
	callback::add_callback(#"hash_72fd23232c4c7ab1", &function_53bc3572);
	callback::add_callback(#"hash_2a040f8b8142266d", &function_3138c2d5);
}

/*
	Name: function_49bf8a32
	Namespace: zm_ai_soa
	Checksum: 0x9B7C01E1
	Offset: 0x358
	Size: 0xB4
	Parameters: 0
	Flags: Linked
*/
function function_49bf8a32()
{
	self.b_ignore_cleanup = 0;
	self.closest_player_override = &zm_utility::function_3d70ba7a;
	self.var_64c67df3 = &function_7a71cf9f;
	self.var_b0709fcc = &function_6c3b6e9d;
	self.var_6fd4da3a = &function_bd4dbc6d;
	self.var_9d431816 = &function_9d431816;
	self.var_917994fb = &function_917994fb;
	level thread zm_spawner::zombie_death_event(self);
}

/*
	Name: function_751146f8
	Namespace: zm_ai_soa
	Checksum: 0xA24B3414
	Offset: 0x418
	Size: 0xAC
	Parameters: 0
	Flags: Linked
*/
function function_751146f8()
{
	self.completed_emerging_into_playable_area = 1;
	self.canbetargetedbyturnedzombies = 1;
	self.should_zigzag = 0;
	self.var_72411ccf = &function_dda06e36;
	self setblackboardattribute("_locomotion_speed", "locomotion_speed_sprint");
	namespace_81245006::initweakpoints(self);
	self thread zm_audio::zmbaivox_notifyconvert();
	self thread zm_audio::play_ambient_zombie_vocals();
}

/*
	Name: function_9310b9ca
	Namespace: zm_ai_soa
	Checksum: 0x26F5CB0
	Offset: 0x4D0
	Size: 0x1A4
	Parameters: 0
	Flags: Linked
*/
function function_9310b9ca()
{
	self endon(#"death");
	if(level.zm_loc_types[#"zombie_location"].size <= 0)
	{
		return false;
	}
	closest_player = zm_utility::function_d7fedde2(self);
	if(isdefined(closest_player))
	{
		var_debfdbf5 = 10;
		while(var_debfdbf5 > 0 && isalive(closest_player))
		{
			point = getrandomnavpoint(closest_player.origin, 350);
			if(isdefined(point) && zm_utility::check_point_in_playable_area(point))
			{
				angles = (0, vectortoyaw(closest_player.origin - point), 0);
				self forceteleport(self.origin, angles);
				self thread namespace_19c99142::function_940cd1d8();
				waitframe(1);
				zm_ai_utility::function_a8dc3363({#origin:point});
				self.completed_emerging_into_playable_area = 1;
				self.var_9817f19a = 0;
				break;
			}
			var_debfdbf5--;
			waitframe(1);
		}
	}
	return true;
}

/*
	Name: function_53bc3572
	Namespace: zm_ai_soa
	Checksum: 0xFF816FE
	Offset: 0x680
	Size: 0x3A
	Parameters: 1
	Flags: Linked
*/
function function_53bc3572(soa)
{
	self.var_72411ccf = &function_7d1d7f3f;
	self.var_60d1126a = &function_e772df94;
}

/*
	Name: function_3138c2d5
	Namespace: zm_ai_soa
	Checksum: 0xFA393E8A
	Offset: 0x6C8
	Size: 0x16
	Parameters: 0
	Flags: Linked
*/
function function_3138c2d5()
{
	self.var_72411ccf = undefined;
	self.var_60d1126a = undefined;
}

/*
	Name: function_dda06e36
	Namespace: zm_ai_soa
	Checksum: 0xBBA720F1
	Offset: 0x6E8
	Size: 0x6CC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_dda06e36(entity)
{
	/#
		if(getdvarint(#"hash_4ac64c7f46b01880", 0) > 0)
		{
			players = getplayers();
			entity.var_93a62fe = (isdefined(players[1]) ? players[1] : players[0]);
		}
	#/
	if(!isdefined(entity.var_93a62fe))
	{
		entity.favoriteenemy = undefined;
	}
	var_cc7597dc = namespace_19c99142::function_3d972f3(entity);
	var_6d4f3481 = entity.team !== level.zombie_team;
	var_4d21f369 = namespace_19c99142::function_da71e09a(entity);
	switch(var_4d21f369)
	{
		case "chase":
		{
			if(namespace_19c99142::function_264f914c(entity) && !var_6d4f3481)
			{
				if(isdefined(var_cc7597dc) && namespace_19c99142::function_85d7a413(entity, var_cc7597dc))
				{
					namespace_19c99142::function_708afe1d(entity, #"hash_6192d8af630c6c07");
				}
				else
				{
					if(namespace_19c99142::function_47f3f527(entity))
					{
						namespace_19c99142::function_708afe1d(entity, #"hash_685254f9ed0ce346");
					}
					else if(namespace_19c99142::function_d1293a5a(entity))
					{
						namespace_19c99142::function_708afe1d(entity, #"circle");
					}
				}
			}
			break;
		}
		case "hash_6192d8af630c6c07":
		{
			if(!isdefined(var_cc7597dc) || !namespace_19c99142::function_85d7a413(entity, var_cc7597dc) || var_6d4f3481)
			{
				namespace_19c99142::function_708afe1d(entity, #"chase");
			}
			break;
		}
		case "hash_685254f9ed0ce346":
		{
			if(namespace_19c99142::function_ee1f25af(entity))
			{
				namespace_19c99142::function_708afe1d(entity, #"hash_4ec3ec4f06b9498f");
			}
			break;
		}
		case "hash_4ec3ec4f06b9498f":
		{
			if(namespace_19c99142::function_89dbf30f(entity) || var_6d4f3481)
			{
				if(namespace_19c99142::function_47f3f527(entity))
				{
					namespace_19c99142::function_708afe1d(entity, #"hash_685254f9ed0ce346");
				}
				else
				{
					namespace_19c99142::function_708afe1d(entity, #"chase");
				}
			}
			break;
		}
		case "hash_110ee879f18b605f":
		{
			break;
		}
		case "circle":
		{
			if(isdefined(var_cc7597dc) && namespace_19c99142::function_85d7a413(entity, var_cc7597dc))
			{
				namespace_19c99142::function_708afe1d(entity, #"hash_6192d8af630c6c07");
			}
			else if(namespace_19c99142::function_25517868(entity))
			{
				namespace_19c99142::function_708afe1d(entity, #"chase");
			}
			break;
		}
	}
	var_4d21f369 = namespace_19c99142::function_da71e09a(entity);
	switch(var_4d21f369)
	{
		case "chase":
		{
			if(namespace_19c99142::function_3c14ef44(entity))
			{
				if(entity.var_7418f498 !== entity.favoriteenemy)
				{
					if(namespace_19c99142::function_264f914c(entity))
					{
						namespace_19c99142::function_1b2f34c9(entity);
					}
					else if(!isplayer(entity.var_7418f498) || zm_utility::is_player_valid(entity.var_7418f498, 1))
					{
						entity.var_93a62fe = entity.var_7418f498;
					}
				}
			}
			else
			{
				namespace_19c99142::function_ff6a04bc(entity);
			}
			function_b7b2c72c(entity);
			zm_behavior::zombiefindflesh(entity);
			break;
		}
		case "hash_6192d8af630c6c07":
		{
			/#
				assert(isdefined(var_cc7597dc), "");
			#/
			/#
			#/
			namespace_19c99142::function_ff6a04bc(entity);
			entity.favoriteenemy = var_cc7597dc;
			entity.goalradius = entity getpathfindingradius();
			entity zm_behavior::zombieupdategoal();
			break;
		}
		case "hash_685254f9ed0ce346":
		{
			entity.favoriteenemy = entity.var_93a62fe;
			break;
		}
		case "hash_4ec3ec4f06b9498f":
		{
			entity.favoriteenemy = entity.var_93a62fe;
			break;
		}
		case "hash_110ee879f18b605f":
		{
			entity.favoriteenemy = entity.var_93a62fe;
			break;
		}
		case "circle":
		{
			namespace_19c99142::function_b046be53(entity);
			break;
		}
	}
	/#
		if(getdvarint(#"hash_13f115c784a1f77b", 0) > 0)
		{
			if(!isdefined(level.var_48137965))
			{
				level.var_48137965 = entity.origin;
			}
			var_1f1f9cfa = entity function_4794d6a3();
			entity setgoal(level.var_48137965);
		}
	#/
}

/*
	Name: function_7d1d7f3f
	Namespace: zm_ai_soa
	Checksum: 0x33F02838
	Offset: 0xDC0
	Size: 0x2EC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_7d1d7f3f(entity)
{
	if(!namespace_19c99142::function_9d13a2e7(entity))
	{
		return;
	}
	soa = namespace_19c99142::function_9dd68a24(entity);
	namespace_19c99142::function_d9fe2b0(entity);
	var_4d21f369 = namespace_19c99142::function_2905c7db(entity);
	if(var_4d21f369 === #"attacking")
	{
		if(!isdefined(soa.favoriteenemy) || entity.favoriteenemy !== soa.favoriteenemy)
		{
			if(!isdefined(soa.favoriteenemy) || distance2dsquared(soa.origin, entity.origin) > sqr(1000))
			{
				namespace_19c99142::function_c33fb385(entity, #"following");
			}
		}
	}
	if(var_4d21f369 === #"following")
	{
		if(isdefined(soa.favoriteenemy) && entity cansee(soa.favoriteenemy))
		{
			namespace_19c99142::function_c33fb385(entity, #"attacking");
		}
	}
	var_4d21f369 = namespace_19c99142::function_2905c7db(entity);
	if(var_4d21f369 === #"following")
	{
		goal = namespace_19c99142::function_dd116fa9(entity);
		entity setgoal(goal);
	}
	else if(var_4d21f369 === #"attacking")
	{
		if(isplayer(soa.favoriteenemy) && is_true(entity.var_ff3cbd9e) && !getdvarint(#"hash_6f7afa24d5871b86", 0) > 0)
		{
			var_ce42b625 = zm_utility::function_d89330e6(soa.favoriteenemy);
			if(var_ce42b625 >= 0)
			{
				entity.var_93a62fe = soa.favoriteenemy;
			}
		}
		zm_behavior::zombiefindflesh(entity);
	}
}

/*
	Name: function_e772df94
	Namespace: zm_ai_soa
	Checksum: 0x955D8A9D
	Offset: 0x10B8
	Size: 0x36C
	Parameters: 2
	Flags: Linked
*/
function function_e772df94(entity, target_pos)
{
	soa = namespace_19c99142::function_9dd68a24(entity);
	if(!(isdefined(entity.favoriteenemy) && isdefined(soa)) || soa.favoriteenemy !== entity.favoriteenemy)
	{
		return;
	}
	if(!entity cansee(entity.favoriteenemy))
	{
		return;
	}
	if(entity flag::get(#"hash_66428e102eda132b"))
	{
		return {#dist:0, #angle:0};
	}
	if(isdefined(soa.var_6017b1f7) && distancesquared(soa.var_6017b1f7.origin, entity.origin) > sqr(400))
	{
		return;
	}
	var_647ddc9d = isdefined(entity.var_bf2dba23) && (entity.var_bf2dba23 & 1) === 0;
	min_angle = -90 + (var_647ddc9d ? 135 : 0);
	max_angle = -45 + (var_647ddc9d ? 135 : 0);
	angle = (vectortoyaw(target_pos - self.origin)) + randomfloatrange(min_angle, max_angle);
	distance = randomfloatrange(128, 196);
	/#
		if(getdvarint(#"hash_20ead0e6e8e713d8", 0) > 0)
		{
			goalpos = checknavmeshdirection(target_pos, function_ba142845(angle), distance, self getpathfindingradius() * 1.1);
			recordline(goalpos, goalpos + (0, 0, 80 + ((self getentitynumber() - 137) * 20)), (1, 0, 0));
			record3dtext(self getentitynumber(), goalpos + (0, 0, 80 + ((self getentitynumber() - 137) * 20)), (1, 0, 0));
		}
	#/
	return {#dist:distance, #angle:angle};
}

/*
	Name: function_b7b2c72c
	Namespace: zm_ai_soa
	Checksum: 0xAF6D7256
	Offset: 0x1430
	Size: 0x84
	Parameters: 1
	Flags: Linked, Private
*/
function private function_b7b2c72c(entity)
{
	if(!entity flag::get(#"hash_6142b8eaf31a60c6"))
	{
		if(isdefined(self.favoriteenemy) && self cansee(self.favoriteenemy))
		{
			entity flag::set(#"hash_6142b8eaf31a60c6");
		}
	}
}

/*
	Name: function_7a71cf9f
	Namespace: zm_ai_soa
	Checksum: 0xE6F1E7D7
	Offset: 0x14C0
	Size: 0x6C
	Parameters: 2
	Flags: Linked
*/
function function_7a71cf9f(zone_path, player)
{
	self.var_ea989fd2 = undefined;
	if(isdefined(zone_path))
	{
		return undefined;
	}
	zipline = function_4a3e695a(self, player);
	if(isdefined(zipline))
	{
		zipline.var_ec8356c8 = 1;
		return zipline;
	}
	return player;
}

/*
	Name: function_4a3e695a
	Namespace: zm_ai_soa
	Checksum: 0x91D2A7B2
	Offset: 0x1538
	Size: 0x446
	Parameters: 2
	Flags: Linked
*/
function function_4a3e695a(entity, player)
{
	if(isdefined(level.var_f9bb6f24))
	{
		return [[level.var_f9bb6f24]]();
	}
	if(!isdefined(entity) || !isplayer(player))
	{
		return undefined;
	}
	if(isdefined(entity.var_ea989fd2))
	{
		return entity.var_ea989fd2;
	}
	var_26352dd8 = entity.cached_zone;
	if(!isdefined(var_26352dd8))
	{
		return undefined;
	}
	var_bac59fe3 = struct::get_array("zipline_start_zm", "script_noteworthy");
	var_bac59fe3 = function_72d3bca6(var_bac59fe3, entity.origin, undefined, 0, 1500);
	var_79796f1c = [0:var_26352dd8.name];
	if(isdefined(var_26352dd8.adjacent_zones))
	{
		var_79796f1c = arraycombine(var_79796f1c, getarraykeys(var_26352dd8.adjacent_zones));
	}
	foreach(current_zone in var_79796f1c)
	{
		foreach(zipline in var_bac59fe3)
		{
			var_2f9aedc0 = (isdefined(zipline.zone_struct) ? zipline.zone_struct : zm_zonemgr::get_zone_from_position(zipline.origin));
			if(!isdefined(zipline.zone_struct))
			{
				zipline.zone_struct = var_2f9aedc0;
			}
			if(isdefined(var_2f9aedc0) && isdefined(zipline.target) && current_zone === var_2f9aedc0)
			{
				var_b4a3c7c5 = struct::get(zipline.target, "targetname");
				if(player.var_5da09c55 === zipline)
				{
					entity.var_ea989fd2 = {#hash_b4a3c7c5:var_b4a3c7c5, #start_zipline:zipline};
					return zipline;
				}
				var_fd1e4845 = (isdefined(var_b4a3c7c5.zone_struct) ? var_b4a3c7c5.zone_struct : zm_zonemgr::get_zone_from_position(var_b4a3c7c5.origin));
				if(!isdefined(var_b4a3c7c5.zone_struct))
				{
					var_b4a3c7c5.zone_struct = var_fd1e4845;
				}
				var_c6bd50df = player.cached_zone;
				if(isdefined(var_fd1e4845) && isdefined(var_c6bd50df) && var_c6bd50df === var_fd1e4845)
				{
					target_zone = level.zones[var_fd1e4845];
					if(isdefined(target_zone.a_loc_types[#"zombie_location"]) && isdefined(target_zone.a_loc_types[#"zombie_location"].size <= 0))
					{
						return undefined;
					}
					entity.var_ea989fd2 = {#hash_b4a3c7c5:var_b4a3c7c5, #start_zipline:zipline};
					return zipline;
				}
			}
		}
	}
	return undefined;
}

/*
	Name: function_6c3b6e9d
	Namespace: zm_ai_soa
	Checksum: 0x2AD0B39A
	Offset: 0x1988
	Size: 0xB8
	Parameters: 0
	Flags: Linked
*/
function function_6c3b6e9d()
{
	closest_player = arraygetclosest(self.origin, getplayers());
	function_4a3e695a(self, closest_player);
	if(isdefined(self.var_ea989fd2) || isdefined(self.var_1389a0b3))
	{
		return true;
	}
	var_4d21f369 = namespace_19c99142::function_da71e09a(self);
	if(var_4d21f369 === #"hash_110ee879f18b605f")
	{
		return true;
	}
	return false;
}

/*
	Name: function_bd4dbc6d
	Namespace: zm_ai_soa
	Checksum: 0x40874B0E
	Offset: 0x1A48
	Size: 0x6C
	Parameters: 0
	Flags: Linked
*/
function function_bd4dbc6d()
{
	closest_player = arraygetclosest(self.origin, getplayers());
	zipline = function_4a3e695a(self, closest_player);
	if(isdefined(zipline))
	{
		return zipline;
	}
}

/*
	Name: function_917994fb
	Namespace: zm_ai_soa
	Checksum: 0x1DAD7EEE
	Offset: 0x1AC0
	Size: 0x6A
	Parameters: 2
	Flags: Linked
*/
function function_917994fb(entity, n_to_spawn)
{
	/#
		/#
			assert(isdefined(n_to_spawn), "");
		#/
	#/
	if(isdefined(level.zombie_total) && level.zombie_total < n_to_spawn)
	{
		return false;
	}
	return true;
}

/*
	Name: function_9d431816
	Namespace: zm_ai_soa
	Checksum: 0xD0D29758
	Offset: 0x1B38
	Size: 0x5C
	Parameters: 2
	Flags: Linked
*/
function function_9d431816(entity, ai_spawned)
{
	if(isdefined(level.zombie_total) && isdefined(level.zombie_respawns))
	{
		level.zombie_total--;
		if(level.zombie_respawns > 0)
		{
			level.zombie_respawns--;
		}
	}
}

/*
	Name: function_76a7a9ef
	Namespace: zm_ai_soa
	Checksum: 0x9A59A20C
	Offset: 0x1BA0
	Size: 0x11A
	Parameters: 1
	Flags: Linked
*/
function function_76a7a9ef(var_dbce0c44)
{
	if(isdefined(level.var_a1c6ba48) && level.round_number < level.var_a1c6ba48)
	{
		return 0;
	}
	var_8cf00d40 = int(floor(var_dbce0c44 / 80));
	if(level.round_number < 20)
	{
		var_e5d49e0f = 0.02;
	}
	else
	{
		if(level.round_number < 30)
		{
			var_e5d49e0f = 0.03;
		}
		else
		{
			var_e5d49e0f = 0.04;
		}
	}
	n_max = min(var_8cf00d40, int(ceil(level.zombie_total * var_e5d49e0f)));
	return n_max;
}

/*
	Name: function_ecce5272
	Namespace: zm_ai_soa
	Checksum: 0x99C37C19
	Offset: 0x1CC8
	Size: 0x38
	Parameters: 0
	Flags: Linked
*/
function function_ecce5272()
{
	ai = function_e803632f();
	if(isdefined(ai))
	{
		level.zombie_total--;
		return true;
	}
	return false;
}

/*
	Name: function_e803632f
	Namespace: zm_ai_soa
	Checksum: 0xFCB66750
	Offset: 0x1D08
	Size: 0x1A0
	Parameters: 3
	Flags: Linked
*/
function function_e803632f(b_force_spawn, var_eb3a8721, var_bc66d64b)
{
	if(!isdefined(var_eb3a8721))
	{
		var_eb3a8721 = 0;
	}
	if(!var_eb3a8721 && !function_f761f651())
	{
		return undefined;
	}
	if(isdefined(var_bc66d64b))
	{
		s_spawn_loc = var_bc66d64b;
	}
	else
	{
		if(isdefined(level.var_194823e7))
		{
			s_spawn_loc = [[level.var_194823e7]]();
		}
		else
		{
			s_spawn_loc = function_41a4961d();
		}
	}
	if(!isdefined(s_spawn_loc))
	{
		/#
			if(getdvarint(#"hash_1f8efa579fee787c", 0))
			{
				iprintlnbold("");
			}
		#/
		return undefined;
	}
	ai = spawnactor(#"hash_63cd2e85e68901a0", s_spawn_loc.origin, s_spawn_loc.angles);
	if(isdefined(ai))
	{
		ai.script_string = s_spawn_loc.script_string;
		ai.find_flesh_struct_string = s_spawn_loc.find_flesh_struct_string;
		ai.check_point_in_enabled_zone = &zm_utility::check_point_in_playable_area;
		ai.ignore_enemy_count = 0;
		ai forceteleport(s_spawn_loc.origin, s_spawn_loc.angles);
	}
	return ai;
}

/*
	Name: function_41a4961d
	Namespace: zm_ai_soa
	Checksum: 0x3786CADE
	Offset: 0x1EB0
	Size: 0x382
	Parameters: 1
	Flags: Linked
*/
function function_41a4961d(get_all)
{
	if(!isdefined(get_all))
	{
		get_all = 0;
	}
	if(isdefined(level.zm_loc_types[#"hash_160b6f445abd3a60"]) && level.zm_loc_types[#"hash_160b6f445abd3a60"].size)
	{
		if(get_all)
		{
			s_spawn_loc = level.zm_loc_types[#"hash_160b6f445abd3a60"];
		}
		else
		{
			locs = level.zm_loc_types[#"hash_160b6f445abd3a60"];
			if(getplayers().size > 1)
			{
				var_a6c95035 = [];
				var_b0becd1e = namespace_19c99142::function_a64f7068();
				if(!isdefined(var_b0becd1e))
				{
					return undefined;
				}
				var_5f3b05e8 = var_b0becd1e zm_zonemgr::get_player_zone();
				if(!isdefined(var_5f3b05e8))
				{
					return undefined;
				}
				target_zone = level.zones[var_5f3b05e8];
				var_24f5d9f8 = array(target_zone.name);
				a_str_adj_zones = getarraykeys(target_zone.adjacent_zones);
				foreach(str_zone in a_str_adj_zones)
				{
					if(target_zone.adjacent_zones[str_zone].is_connected)
					{
						if(!isdefined(var_24f5d9f8))
						{
							var_24f5d9f8 = [];
						}
						else if(!isarray(var_24f5d9f8))
						{
							var_24f5d9f8 = array(var_24f5d9f8);
						}
						var_24f5d9f8[var_24f5d9f8.size] = str_zone;
					}
				}
				foreach(loc in locs)
				{
					if(array::contains(var_24f5d9f8, loc.zone_name))
					{
						if(!isdefined(var_a6c95035))
						{
							var_a6c95035 = [];
						}
						else if(!isarray(var_a6c95035))
						{
							var_a6c95035 = array(var_a6c95035);
						}
						var_a6c95035[var_a6c95035.size] = loc;
					}
				}
				if(var_a6c95035.size === 0)
				{
					var_a6c95035 = locs;
				}
				s_spawn_loc = array::random(var_a6c95035);
			}
			else
			{
				s_spawn_loc = array::random(locs);
			}
		}
	}
	return s_spawn_loc;
}

/*
	Name: function_f761f651
	Namespace: zm_ai_soa
	Checksum: 0x622A58AD
	Offset: 0x2240
	Size: 0x72
	Parameters: 0
	Flags: Linked, Private
*/
function private function_f761f651()
{
	var_268fb71d = function_ff7527d6();
	var_df9af27e = function_d7a21807();
	if(var_268fb71d >= var_df9af27e || !level flag::get("spawn_zombies"))
	{
		return false;
	}
	return true;
}

/*
	Name: function_ff7527d6
	Namespace: zm_ai_soa
	Checksum: 0x3A5A1EE6
	Offset: 0x22C0
	Size: 0xCA
	Parameters: 0
	Flags: Linked
*/
function function_ff7527d6()
{
	var_805eef4e = getaiarchetypearray(#"soa");
	var_268fb71d = var_805eef4e.size;
	foreach(var_c23daab2 in var_805eef4e)
	{
		if(!isalive(var_c23daab2))
		{
			var_268fb71d--;
		}
	}
	return var_268fb71d;
}

/*
	Name: function_d7a21807
	Namespace: zm_ai_soa
	Checksum: 0x13A24E6
	Offset: 0x2398
	Size: 0x8A
	Parameters: 0
	Flags: Linked
*/
function function_d7a21807()
{
	switch(getplayers().size)
	{
		case 1:
		{
			return 2;
			break;
		}
		case 2:
		{
			return 3;
			break;
		}
		case 3:
		{
			return 4;
			break;
		}
		case 4:
		{
			return 5;
			break;
		}
	}
}

