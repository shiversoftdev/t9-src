#using script_3411bb48d41bd3b;
#using scripts\core_common\ai\archetype_mimic.gsc;
#using scripts\zm_common\ai\zm_ai_utility.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_quick_spawning.gsc;
#using script_799de24f8ad427f7;
#using scripts\zm_common\zm_cleanup_mgr.gsc;
#using scripts\zm_common\zm.gsc;
#using script_2c5daa95f8fec03c;
#using script_3a704cbcf4081bfb;
#using script_3819e7a1427df6d2;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using script_7fc996fe8678852;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_14c07d4f;

/*
	Name: function_b7cbb23d
	Namespace: namespace_14c07d4f
	Checksum: 0x69D263CD
	Offset: 0x2B0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b7cbb23d()
{
	level notify(-270671099);
}

/*
	Name: __init__system__
	Namespace: namespace_14c07d4f
	Checksum: 0x286B65F
	Offset: 0x2D0
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_7442f9a5295824fd", &function_70a657d8, &function_8ac3bea9, undefined, "zm_destination_manager");
}

/*
	Name: function_70a657d8
	Namespace: namespace_14c07d4f
	Checksum: 0x69C9B46D
	Offset: 0x328
	Size: 0x1C4
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	spawner::add_archetype_spawn_function(#"mimic", &function_76433e31);
	spawner::function_89a2cd87(#"mimic", &function_820e5ac3);
	zm_cleanup::function_cdf5a512(#"mimic", &function_5394f283);
	clientfield::register("actor", "mimic_show_on_minimap", 16000, 1, "int");
	clientfield::register("actor", "mimic_cleanup_teleport", 16000, 1, "counter");
	clientfield::register("toplayer", "mimic_range_hit", 16000, 1, "counter");
	if(!isdefined(level.var_cdfc836d))
	{
		level.var_cdfc836d = &function_f826fb47;
	}
	if(!isdefined(level.var_e1712840))
	{
		level.var_e1712840 = &function_42e3209f;
	}
	if(!isdefined(level.var_64aa9d51))
	{
		level.var_64aa9d51 = &function_64aa9d51;
	}
	if(!isdefined(level.var_f29dd47))
	{
		level.var_f29dd47 = &function_f29dd47;
	}
}

/*
	Name: function_8ac3bea9
	Namespace: namespace_14c07d4f
	Checksum: 0x7C564D9A
	Offset: 0x4F8
	Size: 0xAC
	Parameters: 0
	Flags: Linked
*/
function function_8ac3bea9()
{
	if(zm_utility::is_classic())
	{
		callback::add_callback(#"hash_3065435e3005a796", &function_ff1fe53a);
		callback::add_callback(#"hash_2745091e63972f13", &function_59042f87);
		level flag::wait_till("start_zombie_round_logic");
		waittillframeend();
		function_218c4ce8();
	}
}

/*
	Name: function_ff1fe53a
	Namespace: namespace_14c07d4f
	Checksum: 0x2FF344CE
	Offset: 0x5B0
	Size: 0xCC
	Parameters: 1
	Flags: Linked
*/
function function_ff1fe53a(params)
{
	if(!isdefined(params.player))
	{
		return;
	}
	params.player.var_4ded0009 = (isdefined(params.player.last_valid_position) ? params.player.last_valid_position : getclosestpointonnavmesh(params.player.origin, 32));
	/#
		if(isdefined(params.player.var_4ded0009))
		{
			recordstar(params.player.var_4ded0009, (1, 0, 1), "");
		}
	#/
}

/*
	Name: function_59042f87
	Namespace: namespace_14c07d4f
	Checksum: 0x16267639
	Offset: 0x688
	Size: 0x106
	Parameters: 1
	Flags: Linked
*/
function function_59042f87(params)
{
	if(!isdefined(params.player))
	{
		return;
	}
	if(isdefined(params.player.var_4ded0009) && !zm_zonemgr::function_66bf6a43(params.player.origin, 0))
	{
		/#
			recordstar(params.player.var_4ded0009, (1, 0, 1), "");
			record3dtext("", params.player.var_4ded0009, (1, 0, 1), "");
		#/
		params.player setorigin(params.player.var_4ded0009);
	}
	params.player.var_4ded0009 = undefined;
}

/*
	Name: function_76433e31
	Namespace: namespace_14c07d4f
	Checksum: 0xCA6B7954
	Offset: 0x798
	Size: 0xBC
	Parameters: 0
	Flags: Linked
*/
function function_76433e31()
{
	self.b_ignore_cleanup = 1;
	self.var_22492afd = "mimic_range_hit";
	self.var_f6fd2062 = &function_c8444dac;
	self.closest_player_override = &zm_utility::function_3d70ba7a;
	self callback::function_d8abfc3d(#"hash_484127e0cbd8f8cb", &function_7c591227);
	aiutility::addaioverridedamagecallback(self, &function_fe78c504);
	level thread zm_spawner::zombie_death_event(self);
}

/*
	Name: function_820e5ac3
	Namespace: namespace_14c07d4f
	Checksum: 0x6316BA17
	Offset: 0x860
	Size: 0x174
	Parameters: 0
	Flags: Linked
*/
function function_820e5ac3()
{
	self.completed_emerging_into_playable_area = 1;
	self.canbetargetedbyturnedzombies = 1;
	self.var_58c4c69b = 1;
	self.var_318a0ac8 = &function_c41a996d;
	self.var_154478e3 = 8192;
	self callback::function_d8abfc3d(#"hash_29cb63a7ebb5d699", &function_5c2b66f6);
	if(!is_true(self.var_2ca2d270) && is_true(self.var_7a5e475))
	{
		self function_8b6bfa1();
	}
	else if(!is_true(self.var_2ca2d270))
	{
		self function_c0b09ab0();
	}
	self setblackboardattribute("_locomotion_speed", "locomotion_speed_sprint");
	namespace_81245006::initweakpoints(self);
	self thread zm_audio::zmbaivox_notifyconvert();
	self thread zm_audio::play_ambient_zombie_vocals();
}

/*
	Name: function_c0b09ab0
	Namespace: namespace_14c07d4f
	Checksum: 0x5F30B7CE
	Offset: 0x9E0
	Size: 0x9C
	Parameters: 0
	Flags: Linked
*/
function function_c0b09ab0()
{
	self clientfield::set("mimic_emerge_fx", 1);
	self.var_a516906f = {#angles:self.angles, #origin:self.origin};
	self.var_a516906f.anim = #"ai_t9_zm_mimic_com_emerge_prop_quick_f_01";
	self animcustom(&archetype_mimic::function_f3b371f1);
}

/*
	Name: function_c8444dac
	Namespace: namespace_14c07d4f
	Checksum: 0x58D5F417
	Offset: 0xA88
	Size: 0x2A
	Parameters: 1
	Flags: Linked
*/
function function_c8444dac(player)
{
	return zm_utility::is_player_valid(player, 1, 0, 0, 0);
}

/*
	Name: function_7c591227
	Namespace: namespace_14c07d4f
	Checksum: 0xE65BFFA9
	Offset: 0xAC0
	Size: 0x82
	Parameters: 1
	Flags: Linked
*/
function function_7c591227(params)
{
	self.b_ignore_cleanup = undefined;
	self val::reset_all(#"hash_195d34d606e6ced8");
	self clientfield::set("mimic_show_on_minimap", 0);
	var_1be227f1 = array::random(params.var_ef7458f2);
	self.favoriteenemy = var_1be227f1;
}

/*
	Name: function_5c2b66f6
	Namespace: namespace_14c07d4f
	Checksum: 0x81B4C5C4
	Offset: 0xB50
	Size: 0x8C
	Parameters: 1
	Flags: Linked
*/
function function_5c2b66f6(prop)
{
	self.b_ignore_cleanup = 1;
	self val::set(#"hash_195d34d606e6ced8", "takedamage", 0);
	self val::set(#"hash_195d34d606e6ced8", "allowdeath", 0);
	self clientfield::set("mimic_show_on_minimap", 1);
}

/*
	Name: function_9832759c
	Namespace: namespace_14c07d4f
	Checksum: 0x60EABB44
	Offset: 0xBE8
	Size: 0x130
	Parameters: 2
	Flags: Linked
*/
function function_9832759c(origin, num_points)
{
	points = namespace_85745671::function_e4791424(origin, int(max(10, num_points)), 50, 1000, 0, undefined, 0);
	spawn_points = [];
	foreach(point in points)
	{
		if(!isdefined(arraygetclosest(point.origin, level.var_5fafe5ac, 32)))
		{
			spawn_points[spawn_points.size] = point;
			if(spawn_points.size >= num_points)
			{
				break;
			}
		}
	}
	return spawn_points;
}

/*
	Name: function_7a3d3a78
	Namespace: namespace_14c07d4f
	Checksum: 0xBD9533B2
	Offset: 0xD20
	Size: 0x26A
	Parameters: 2
	Flags: Linked
*/
function function_7a3d3a78(zone_name, spawn_points)
{
	if(!isdefined(zone_name) || (!isstring(zone_name) && !ishash(zone_name)))
	{
		return spawn_points;
	}
	var_417b1b19 = struct::get_array(zone_name + "_no_mimic_prop_node", "targetname");
	if(var_417b1b19.size == 0)
	{
		return spawn_points;
	}
	var_c0477d03 = [];
	foreach(point in spawn_points)
	{
		var_b3602c14 = 1;
		foreach(var_da3caad0 in var_417b1b19)
		{
			if((abs(point.origin[2] - var_da3caad0.origin[2])) < var_da3caad0.halfheight && distance2d(var_da3caad0.origin, point.origin) < var_da3caad0.radius)
			{
				var_b3602c14 = 0;
				break;
			}
		}
		if(var_b3602c14)
		{
			if(!isdefined(var_c0477d03))
			{
				var_c0477d03 = [];
			}
			else if(!isarray(var_c0477d03))
			{
				var_c0477d03 = array(var_c0477d03);
			}
			var_c0477d03[var_c0477d03.size] = point;
		}
	}
	return var_c0477d03;
}

/*
	Name: function_64aa9d51
	Namespace: namespace_14c07d4f
	Checksum: 0xE78DCF98
	Offset: 0xF98
	Size: 0x350
	Parameters: 3
	Flags: Linked
*/
function function_64aa9d51(origin, num_points, zone)
{
	if(!isdefined(num_points))
	{
		num_points = 1;
	}
	if(!isdefined(zone))
	{
		zone = undefined;
	}
	players = function_a1ef346b();
	foreach(index, player in players)
	{
		if(!zm_utility::is_player_valid(player) || is_true(player.var_16735873))
		{
			players[index] = undefined;
		}
	}
	arrayremovevalue(players, undefined);
	if(players.size)
	{
		player = players[randomint(player.size)];
	}
	else
	{
		players = function_a1ef346b();
		player = players[randomint(players.size)];
	}
	if(!isdefined(player))
	{
		return [];
	}
	var_535c0e37 = player geteye();
	zone = (isdefined(zone) ? zone : player zm_utility::get_current_zone(1, 1));
	if(!isdefined(zone) && isdefined(origin))
	{
		zone_name = zm_zonemgr::get_zone_from_position(origin);
		if(isdefined(zone_name))
		{
			zone = level.zones[zone_name];
		}
	}
	else if(!isdefined(zone))
	{
		active_zone_names = zm_zonemgr::get_active_zone_names();
		zone = level.zones[active_zone_names[randomint(active_zone_names.size)]];
	}
	if(isdefined(zone) && isdefined(var_535c0e37))
	{
		spawn_points = self function_2da86e43(zone, var_535c0e37);
	}
	if(!isdefined(spawn_points) || !spawn_points.size)
	{
		if(isdefined(zone) && !isdefined(origin))
		{
			origin = zone.nodes[randomint(zone.nodes.size)].origin;
		}
		if(isdefined(origin))
		{
			spawn_points = function_9832759c(origin, num_points);
		}
	}
	spawn_points = function_7a3d3a78(zone.name, spawn_points);
	return (isdefined(spawn_points) ? spawn_points : []);
}

/*
	Name: function_5394f283
	Namespace: namespace_14c07d4f
	Checksum: 0x80BA802D
	Offset: 0x12F0
	Size: 0x6A
	Parameters: 0
	Flags: Linked
*/
function function_5394f283()
{
	if(is_true(self.var_43c4bc66))
	{
		b_result = self function_dca29f5c();
	}
	else
	{
		b_result = self function_ce42b67b();
	}
	return is_true(b_result);
}

/*
	Name: function_dca29f5c
	Namespace: namespace_14c07d4f
	Checksum: 0xD2474B17
	Offset: 0x1368
	Size: 0xB8
	Parameters: 0
	Flags: Linked
*/
function function_dca29f5c()
{
	self endon(#"death");
	if(level.zm_loc_types[#"mimic_location"].size > 0)
	{
		s_spawn_loc = array::random(level.zm_loc_types[#"mimic_location"]);
		self zm_ai_utility::function_a8dc3363(s_spawn_loc);
		self function_c0b09ab0();
	}
	else
	{
		/#
			println("");
		#/
	}
	return true;
}

/*
	Name: function_ce42b67b
	Namespace: namespace_14c07d4f
	Checksum: 0xAFE4BCDB
	Offset: 0x1428
	Size: 0x186
	Parameters: 0
	Flags: Linked
*/
function function_ce42b67b()
{
	level endon(#"end_game");
	self endon(#"death");
	spawn_points = function_64aa9d51();
	if(!isarray(spawn_points) || !spawn_points.size)
	{
		self.b_ignore_cleanup = 1;
		return true;
	}
	var_b2aa54a9 = spawn_points[randomint(spawn_points.size)];
	self zm_ai_utility::function_a8dc3363(var_b2aa54a9);
	if(isdefined(self.var_a6fe91fd))
	{
		foreach(prop in self.var_a6fe91fd)
		{
			level thread namespace_be0f9d50::function_175bb809(prop);
		}
		arrayremovevalue(self.var_a6fe91fd, undefined);
	}
	self.should_hide = 1;
	return true;
}

/*
	Name: function_8b6bfa1
	Namespace: namespace_14c07d4f
	Checksum: 0x580FA24B
	Offset: 0x15B8
	Size: 0x31C
	Parameters: 0
	Flags: Linked
*/
function function_8b6bfa1()
{
	self endon(#"death");
	var_f6e30076 = function_21a3a673(3, 5);
	if(namespace_be0f9d50::function_1541ff3a(var_f6e30076, self))
	{
		namespace_be0f9d50::function_861757a2(self);
		self val::set(#"hash_7a847edcf44664a6", "hide", 1);
		self notsolid();
		self setgoal(self.origin);
		self pathmode("dont move", 1);
		self.takedamage = 0;
		zone = self zm_utility::get_current_zone(1);
		if(!isdefined(zone))
		{
			target_player = self function_62b67aab();
			if(!isdefined(target_player))
			{
				target_player = array::random(function_a1ef346b());
			}
			zone = self function_a7a45f60(target_player);
		}
		spawn_points = function_7b8e26b3(level.var_6e175eb, zone.name, "script_noteworthy");
		if(isdefined(zone) && (!isdefined(spawn_points) || !spawn_points.size))
		{
			spawn_points = function_64aa9d51(self.origin, var_f6e30076, zone);
		}
		if(!isdefined(spawn_points))
		{
			spawn_points = [];
		}
		props = namespace_be0f9d50::function_c928b745(spawn_points, var_f6e30076, self);
		self val::reset(#"hash_7a847edcf44664a6", "hide");
		self solid();
		self pathmode("move allowed");
		self.takedamage = 1;
		if(props.size)
		{
			namespace_be0f9d50::function_913ecbbc(props, self);
		}
		else
		{
			/#
				println("" + "");
			#/
			if(is_true(level.var_bce8fb65))
			{
			}
		}
		namespace_be0f9d50::function_8c7b02b0(self);
	}
}

/*
	Name: spawn_single
	Namespace: namespace_14c07d4f
	Checksum: 0x6AA43569
	Offset: 0x18E0
	Size: 0x1B0
	Parameters: 1
	Flags: None
*/
function spawn_single(var_eb3a8721)
{
	if(isdefined(var_eb3a8721))
	{
		s_spawn_loc = var_eb3a8721;
	}
	else
	{
		if(isdefined(level.var_7ad32862))
		{
			s_spawn_loc = [[level.var_7ad32862]]();
		}
		else if(level.zm_loc_types[#"mimic_location"].size > 0)
		{
			s_spawn_loc = array::random(level.zm_loc_types[#"mimic_location"]);
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
	ai = spawnactor(#"spawner_bo5_mimic", s_spawn_loc.origin, s_spawn_loc.angles);
	if(isdefined(ai))
	{
		ai.var_7a5e475 = 0;
		ai.var_43c4bc66 = 1;
		ai.b_ignore_cleanup = undefined;
		ai.script_string = s_spawn_loc.script_string;
		ai.find_flesh_struct_string = s_spawn_loc.find_flesh_struct_string;
		ai.check_point_in_enabled_zone = &zm_utility::check_point_in_playable_area;
		ai forceteleport(s_spawn_loc.origin, s_spawn_loc.angles);
	}
	return ai;
}

/*
	Name: function_62b67aab
	Namespace: namespace_14c07d4f
	Checksum: 0x2EFBA3DC
	Offset: 0x1A98
	Size: 0x11A
	Parameters: 0
	Flags: Linked
*/
function function_62b67aab()
{
	if(zm_utility::is_player_valid(self.favoriteenemy, 0, 0, 0, 0))
	{
		return self.favoriteenemy;
	}
	found_player = 0;
	players = array::randomize(function_a1ef346b());
	foreach(player in players)
	{
		if(player === self.favoriteenemy)
		{
			continue;
		}
		if(zm_utility::is_player_valid(player, 0, 0, 0, 0))
		{
			return player;
		}
	}
	return undefined;
}

/*
	Name: function_a7a45f60
	Namespace: namespace_14c07d4f
	Checksum: 0x3114F325
	Offset: 0x1BC0
	Size: 0x18A
	Parameters: 1
	Flags: Linked
*/
function function_a7a45f60(target_player)
{
	var_7bc72d27 = zm_quick_spawning::function_f1ec5df(target_player, target_player getvelocity(), 1);
	if(var_7bc72d27.size)
	{
		player_zone = var_7bc72d27[randomint(var_7bc72d27.size)];
		spawn_zone = player_zone.name;
	}
	else
	{
		if(!isdefined(player_zone))
		{
			player_zone = target_player zm_utility::get_current_zone(1);
		}
		if(!isdefined(player_zone))
		{
			return undefined;
		}
		spawn_zone = undefined;
		foreach(name, struct in player_zone.adjacent_zones)
		{
			if(!struct.is_connected)
			{
				continue;
			}
			spawn_zone = name;
			break;
		}
		if(!isdefined(spawn_zone))
		{
			spawn_zone = player_zone.name;
		}
	}
	var_3be6f4b6 = level.zones[spawn_zone];
	if(var_3be6f4b6.nodes.size)
	{
		return var_3be6f4b6;
	}
}

/*
	Name: function_2da86e43
	Namespace: namespace_14c07d4f
	Checksum: 0x49753C9B
	Offset: 0x1D58
	Size: 0x1A6
	Parameters: 2
	Flags: Linked
*/
function function_2da86e43(zone_struct, var_535c0e37)
{
	if(!isdefined(var_535c0e37))
	{
		target_player = arraygetclosest(self.origin, function_a1ef346b());
		var_535c0e37 = target_player geteye();
	}
	node = array::random(zone_struct.nodes);
	var_2be42166 = tacticalquery(#"hash_744e744b6f78bb27", node, var_535c0e37);
	points = [];
	foreach(point in var_2be42166)
	{
		if(!isdefined(arraygetclosest(point.origin, level.var_5fafe5ac, 32)))
		{
			points[points.size] = point;
		}
	}
	if(!points.size)
	{
		points = array::randomize(var_2be42166);
	}
	if(points.size)
	{
		return var_2be42166;
	}
}

/*
	Name: function_f826fb47
	Namespace: namespace_14c07d4f
	Checksum: 0xB1431283
	Offset: 0x1F08
	Size: 0x1A8
	Parameters: 1
	Flags: Linked
*/
function function_f826fb47(spawn_loc)
{
	if(isdefined(spawn_loc.scriptbundlename))
	{
		bundle = getscriptbundle(spawn_loc.scriptbundlename);
		if(!isdefined(bundle))
		{
			return undefined;
		}
		var_641c724f = bundle.var_e451a3f7[randomint(bundle.var_e451a3f7.size)];
		if(!isdefined(var_641c724f))
		{
			return undefined;
		}
		pos_offset = ((isdefined(var_641c724f.offset_x) ? var_641c724f.offset_x : 0), (isdefined(var_641c724f.offset_y) ? var_641c724f.offset_y : 0), (isdefined(var_641c724f.offset_z) ? var_641c724f.offset_z : 0));
		angle_offset = ((isdefined(var_641c724f.pitch) ? var_641c724f.pitch : 0), (isdefined(var_641c724f.yaw) ? var_641c724f.yaw : 0), (isdefined(var_641c724f.roll) ? var_641c724f.roll : 0));
		return {#angle_offset:angle_offset, #pos_offset:pos_offset, #prop_name:var_641c724f.model};
	}
	return undefined;
}

/*
	Name: function_218c4ce8
	Namespace: namespace_14c07d4f
	Checksum: 0x92F9017F
	Offset: 0x20B8
	Size: 0x854
	Parameters: 0
	Flags: Linked
*/
function function_218c4ce8()
{
	if(!isdefined(level.var_6e175eb))
	{
		level.var_6e175eb = [];
	}
	var_8e76d54d = [7:{#type:0, #name:#"explore_chests_small"}, 6:{#type:0, #name:#"explore_chests_large"}, 5:{#type:0, #name:#"explore_chests"}, 4:{#type:0, #name:#"hash_448adaf187bbb953"}, 3:{#type:0, #name:#"hash_6217ef2a3d7d895b"}, 2:{#type:0, #name:#"crafting_table"}, 1:{#type:0, #name:#"hash_629e563c2ebf707a"}, 0:{#type:0, #name:#"ammo_cache"}];
	var_f5ae494f = struct::get_array(#"hash_313be7fccc870cdd", "variantname");
	if(isdefined(var_f5ae494f) && var_f5ae494f.size > 0)
	{
		foreach(location in var_f5ae494f[0].locations)
		{
			foreach(info in var_8e76d54d)
			{
				if(!isdefined(location.instances[info.name]))
				{
					continue;
				}
				instance = location.instances[info.name];
				var_283bf51b = namespace_8b6a9d79::function_f703a5a(instance);
				foreach(struct in var_283bf51b)
				{
					if(!is_true(struct.b_spawned))
					{
						continue;
					}
					struct.lure_prop_type = info.type;
					level.var_6e175eb[level.var_6e175eb.size] = struct;
				}
			}
		}
		namespace_be0f9d50::function_da3be96b(0, &namespace_be0f9d50::function_6fe38c03, &function_9542c864);
	}
	if(isdefined(level.var_976841f))
	{
		foreach(trigger_stub in level.var_976841f)
		{
			trigger_stub.lure_prop_type = 1;
			level.var_6e175eb[level.var_6e175eb.size] = trigger_stub;
		}
		namespace_be0f9d50::function_da3be96b(1, &function_c4a57e80, &function_9542c864);
	}
	if(isdefined(var_f5ae494f) && var_f5ae494f.size > 0)
	{
		location = var_f5ae494f[0].locations[#"loot_pods"];
		if(isdefined(location.instances[#"loot_pods"]))
		{
			instance = location.instances[#"loot_pods"];
			if(isdefined(instance.a_models) && isarray(instance.a_models))
			{
				foreach(e_pod in instance.a_models)
				{
					var_926eb7ac = {#origin:e_pod.origin, #angles:e_pod.angles, #prop:e_pod, #lure_prop_type:2};
					level.var_6e175eb[level.var_6e175eb.size] = var_926eb7ac;
				}
			}
		}
		namespace_be0f9d50::function_da3be96b(2, &namespace_be0f9d50::function_644d4bf6, &function_9542c864);
	}
	vehicles = getvehiclearray();
	if(isdefined(vehicles))
	{
		foreach(vehicle in vehicles)
		{
			spawn_struct = {#origin:vehicle.origin, #angles:vehicle.angles, #prop:vehicle, #lure_prop_type:3};
			level.var_6e175eb[level.var_6e175eb.size] = spawn_struct;
		}
	}
	level.var_7f1cce33 = &function_8fa4773e;
	namespace_be0f9d50::function_da3be96b(3, &namespace_be0f9d50::function_6f514803, &function_9542c864);
}

/*
	Name: function_8fa4773e
	Namespace: namespace_14c07d4f
	Checksum: 0x570CE657
	Offset: 0x2918
	Size: 0x48
	Parameters: 2
	Flags: Linked, Private
*/
function private function_8fa4773e(vehicle, player)
{
	if(is_true(vehicle.var_2e8a136f))
	{
		namespace_be0f9d50::function_95f8029e(player);
		return false;
	}
}

/*
	Name: function_42e3209f
	Namespace: namespace_14c07d4f
	Checksum: 0x799D0CD9
	Offset: 0x2968
	Size: 0x4A
	Parameters: 0
	Flags: Linked
*/
function function_42e3209f()
{
	var_39ab7f8c = getaiarchetypearray(#"zombie", level.zombie_team);
	return function_d59a3443(var_39ab7f8c);
}

/*
	Name: function_9542c864
	Namespace: namespace_14c07d4f
	Checksum: 0x9DF95ADB
	Offset: 0x29C0
	Size: 0xC6
	Parameters: 1
	Flags: Linked
*/
function function_9542c864(var_e663e7c5)
{
	if(!isdefined(var_e663e7c5.zone_name))
	{
		var_994bab50 = getclosestpointonnavmesh(var_e663e7c5.origin + (anglestoforward(var_e663e7c5.angles) * 32), 128);
		if(!isdefined(var_994bab50))
		{
			return false;
		}
		var_e663e7c5.zone_name = zm_zonemgr::get_zone_from_position(var_994bab50 + vectorscale((0, 0, 1), 15), 1);
	}
	if(!zm_zonemgr::zone_is_enabled(var_e663e7c5.zone_name))
	{
		return false;
	}
	return true;
}

/*
	Name: function_c4a57e80
	Namespace: namespace_14c07d4f
	Checksum: 0xD66D73C6
	Offset: 0x2A90
	Size: 0x98
	Parameters: 1
	Flags: Linked
*/
function function_c4a57e80(var_e9aa3e9c)
{
	if(var_e9aa3e9c.targetname === "zombie_vending")
	{
		return {#activation_func:&namespace_be0f9d50::function_204a610e, #prop:function_b703696e(var_e9aa3e9c, &function_b2b03bc, &function_f7e48831, &function_8afb304d)};
	}
	return undefined;
}

/*
	Name: function_b703696e
	Namespace: namespace_14c07d4f
	Checksum: 0x38C1DF04
	Offset: 0x2B30
	Size: 0xA0
	Parameters: 4
	Flags: Linked
*/
function function_b703696e(var_e9aa3e9c, var_374304ac, var_e06892e6, trigger_func)
{
	var_1386d828 = var_e9aa3e9c.machine;
	var_1386d828.stub = var_e9aa3e9c;
	var_1386d828.spawn_loc = var_e9aa3e9c;
	var_1386d828.var_3c964886 = var_374304ac;
	var_1386d828.var_5faf570 = var_e9aa3e9c.trigger_func;
	var_1386d828.var_9e9b72eb = var_e06892e6;
	var_e9aa3e9c.trigger_func = trigger_func;
	zm_unitrigger::reregister_unitrigger(var_e9aa3e9c);
	return var_1386d828;
}

/*
	Name: function_fe5c51d
	Namespace: namespace_14c07d4f
	Checksum: 0xBEF510C8
	Offset: 0x2BD8
	Size: 0x14C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_fe5c51d(var_1386d828)
{
	level endon(#"game_ended");
	var_1386d828.stub.var_14e12a20 = var_1386d828.stub.prompt_and_visibility_func;
	var_1386d828.stub.prompt_and_visibility_func = var_1386d828.var_9e9b72eb;
	var_1386d828.var_9e9b72eb = undefined;
	var_1386d828.stub.trigger_func = var_1386d828.var_5faf570;
	var_1386d828.var_5faf570 = undefined;
	zm_unitrigger::reregister_unitrigger(var_1386d828.stub);
	var_1386d828 val::set(#"hash_48bf02d0d1665e1a", "hide", 2);
	wait(5);
	var_1386d828.stub.prompt_and_visibility_func = var_1386d828.stub.var_14e12a20;
	var_1386d828.stub.var_14e12a20 = undefined;
	var_1386d828 val::reset(#"hash_48bf02d0d1665e1a", "hide");
	zm_unitrigger::reregister_unitrigger(var_1386d828.stub);
}

/*
	Name: function_b2b03bc
	Namespace: namespace_14c07d4f
	Checksum: 0x3F11D849
	Offset: 0x2D30
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function function_b2b03bc(var_1386d828)
{
	var_1386d828 thread function_fe5c51d(var_1386d828);
}

/*
	Name: function_f7e48831
	Namespace: namespace_14c07d4f
	Checksum: 0xE2916162
	Offset: 0x2D60
	Size: 0xE
	Parameters: 1
	Flags: Linked
*/
function function_f7e48831(player)
{
	return false;
}

/*
	Name: function_8afb304d
	Namespace: namespace_14c07d4f
	Checksum: 0xF70EAC58
	Offset: 0x2D78
	Size: 0x8C
	Parameters: 0
	Flags: Linked
*/
function function_8afb304d()
{
	self endon(#"death");
	waitresult = undefined;
	waitresult = self waittill(#"trigger");
	player = waitresult.activator;
	self.stub.machine notify(#"hash_1e8aabc2641542e", {#activator:player});
}

/*
	Name: function_fe78c504
	Namespace: namespace_14c07d4f
	Checksum: 0x8B2DD3B6
	Offset: 0x2E10
	Size: 0x70
	Parameters: 13
	Flags: Linked
*/
function function_fe78c504(inflictor, attacker, damage, dflags, meansofdeath, weapon, var_fd90b0bb, vpoint, dir, shitloc, offsettime, boneindex, modelindex)
{
	return modelindex;
}

/*
	Name: function_c41a996d
	Namespace: namespace_14c07d4f
	Checksum: 0x2F3D1BD7
	Offset: 0x2E88
	Size: 0xC4
	Parameters: 13
	Flags: Linked, Private
*/
function private function_c41a996d(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype)
{
	var_ebcff177 = 1;
	if(self zm_utility::function_4562a3ef(surfacetype, boneindex))
	{
		var_ebcff177 = 2;
	}
	return {#hash_ebcff177:var_ebcff177, #damage:psoffsettime};
}

/*
	Name: function_f29dd47
	Namespace: namespace_14c07d4f
	Checksum: 0xC857F187
	Offset: 0x2F58
	Size: 0x104
	Parameters: 2
	Flags: Linked
*/
function function_f29dd47(prop_origin, var_3b5d9ccd)
{
	zone_name = zm_zonemgr::function_49d8d29f(prop_origin, 1);
	if(!isdefined(zone_name))
	{
		return undefined;
	}
	locations = array::randomize(var_3b5d9ccd);
	foreach(loc in locations)
	{
		var_1fd701b3 = zm_zonemgr::function_49d8d29f(loc.origin, 1);
		if(var_1fd701b3 === zone_name)
		{
			return loc;
		}
	}
	return undefined;
}

