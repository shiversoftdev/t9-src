#using scripts\zm_common\ai\zm_ai_utility.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_server_throttle.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_round_logic.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_power.gsc;
#using scripts\zm_common\zm_player.gsc;
#using scripts\zm_common\zm_perks.gsc;
#using scripts\zm_common\zm_maptable.gsc;
#using scripts\zm_common\zm_magicbox.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\zm_common\zm_laststand.gsc;
#using scripts\zm_common\zm_equipment.gsc;
#using scripts\zm_common\zm_customgame.gsc;
#using scripts\zm_common\zm_cleanup_mgr.gsc;
#using scripts\zm_common\zm_characters.gsc;
#using scripts\zm_common\zm_camos.gsc;
#using scripts\zm_common\zm_bgb.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm_ai_faller.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\zm_common\util.gsc;
#using scripts\core_common\throttle_shared.gsc;
#using scripts\core_common\ai\zombie_death.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\abilities\ability_util.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\player\player_shared.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\hud_message_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using script_2c5daa95f8fec03c;
#using scripts\core_common\struct.gsc;

#namespace zm_utility;

/*
	Name: __init__system__
	Namespace: zm_utility
	Checksum: 0x5FFE9181
	Offset: 0x950
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_utility", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_utility
	Checksum: 0x6761ADAD
	Offset: 0x9A8
	Size: 0x354
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register_clientuimodel("hudItems.armorType", 1, 2, "int", 0);
	clientfield::register_clientuimodel("hudItems.armorPercent", 1, 7, "float", 0);
	clientfield::register_clientuimodel("hudItems.scrap", 1, 16, "int", 0);
	clientfield::register_clientuimodel("hudItems.rareScrap", 1, 16, "int", 0);
	clientfield::register_clientuimodel("pap_current", 1, 2, "int", 0);
	clientfield::register("toplayer", "zm_zone_out_of_bounds", 1, 1, "int");
	clientfield::register("actor", "flame_corpse_fx", 1, 1, "int");
	clientfield::register("scriptmover", "model_rarity_rob", 1, 3, "int");
	clientfield::register("scriptmover", "set_compass_icon", 1, 1, "int");
	clientfield::register("scriptmover", "force_stream", 1, 1, "int");
	level thread function_725e99fb();
	for(i = 0; i < 5; i++)
	{
		clientfield::function_5b7d846d(("PlayerList.client" + i) + ".playerIsDowned", 1, 1, "int");
		clientfield::function_5b7d846d(("PlayerList.client" + i) + ".self_revives", 1, 8, "int");
	}
	level.var_e63703cd = [];
	level.var_49f8cef4 = &function_bc5a54a8;
	callback::on_connect(&function_3ba26955);
	callback::on_disconnect(&on_disconnect);
	/#
		util::init_dvar(#"hash_26af2f9714c95db1", 0, &function_452938ed);
	#/
	if(!isdefined(level.var_75b29eed))
	{
		level.var_75b29eed = new class_c6c0e94();
		[[ level.var_75b29eed ]]->initialize(#"hash_14845cc22a76cc27", 10, 0.2);
	}
}

/*
	Name: function_8ac3bea9
	Namespace: zm_utility
	Checksum: 0x80F724D1
	Offset: 0xD08
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ac3bea9()
{
}

/*
	Name: init_utility
	Namespace: zm_utility
	Checksum: 0xA2EC97DB
	Offset: 0xD18
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function init_utility()
{
	level thread check_solo_status();
}

/*
	Name: is_classic
	Namespace: zm_utility
	Checksum: 0x7836D282
	Offset: 0xD40
	Size: 0x72
	Parameters: 0
	Flags: Linked
*/
function is_classic()
{
	if(!isdefined(level.var_8d156cf3))
	{
		level.var_8d156cf3 = util::get_game_type() == #"zclassic" || util::get_game_type() == #"hash_1f847b868c4199a3";
	}
	return level.var_8d156cf3;
}

/*
	Name: is_survival
	Namespace: zm_utility
	Checksum: 0x2A4F6F88
	Offset: 0xDC0
	Size: 0x4A
	Parameters: 0
	Flags: Linked
*/
function is_survival()
{
	if(!isdefined(level.var_50d2a17f))
	{
		level.var_50d2a17f = util::get_game_type() == #"zsurvival";
	}
	return level.var_50d2a17f;
}

/*
	Name: function_c200446c
	Namespace: zm_utility
	Checksum: 0x25EC0963
	Offset: 0xE18
	Size: 0x72
	Parameters: 0
	Flags: Linked
*/
function function_c200446c()
{
	if(!isdefined(level.var_e9ff2970))
	{
		level.var_e9ff2970 = util::get_game_type() == #"zonslaught" || util::get_game_type() == #"hash_321225a5ce1eb35";
	}
	return level.var_e9ff2970;
}

/*
	Name: is_standard
	Namespace: zm_utility
	Checksum: 0xCF3C7C9A
	Offset: 0xE98
	Size: 0x4A
	Parameters: 0
	Flags: Linked
*/
function is_standard()
{
	if(!isdefined(level.var_9bd33c61))
	{
		level.var_9bd33c61 = util::get_game_type() == #"zstandard";
	}
	return level.var_9bd33c61;
}

/*
	Name: is_trials
	Namespace: zm_utility
	Checksum: 0x6EF3076C
	Offset: 0xEF0
	Size: 0x6C
	Parameters: 0
	Flags: Linked
*/
function is_trials()
{
	if(!isdefined(level.var_bc0dd8f3))
	{
		level.var_bc0dd8f3 = util::get_game_type() == #"hash_32a608b582834498";
	}
	return level.var_bc0dd8f3 || level flag::exists(#"ztrial");
}

/*
	Name: is_tutorial
	Namespace: zm_utility
	Checksum: 0xC4212B6A
	Offset: 0xF68
	Size: 0x4A
	Parameters: 0
	Flags: Linked
*/
function is_tutorial()
{
	if(!isdefined(level.var_f9cd414c))
	{
		level.var_f9cd414c = util::get_game_type() == #"ztutorial";
	}
	return level.var_f9cd414c;
}

/*
	Name: is_grief
	Namespace: zm_utility
	Checksum: 0x79795D87
	Offset: 0xFC0
	Size: 0x4A
	Parameters: 0
	Flags: Linked
*/
function is_grief()
{
	if(!isdefined(level.var_80b0bb3d))
	{
		level.var_80b0bb3d = util::get_game_type() == #"zgrief";
	}
	return level.var_80b0bb3d;
}

/*
	Name: function_c4b020f8
	Namespace: zm_utility
	Checksum: 0x493AF8D5
	Offset: 0x1018
	Size: 0x4A
	Parameters: 0
	Flags: Linked
*/
function function_c4b020f8()
{
	if(!isdefined(level.var_7ef56397))
	{
		level.var_7ef56397 = util::get_game_type() == #"hash_339838bfa1eb964d";
	}
	return level.var_7ef56397;
}

/*
	Name: function_d6046228
	Namespace: zm_utility
	Checksum: 0x501AD5E0
	Offset: 0x1070
	Size: 0xFA
	Parameters: 6
	Flags: Linked
*/
function function_d6046228(var_67441581, var_756ee4e5, var_bcb9de3e, var_299ea954, var_787a5e25, var_1e31f083)
{
	if(is_trials())
	{
		if(self function_8b1a219a() && isdefined(var_1e31f083))
		{
			return var_1e31f083;
		}
		if(isdefined(var_787a5e25))
		{
			return var_787a5e25;
		}
	}
	else if(is_standard())
	{
		if(self function_8b1a219a() && isdefined(var_299ea954))
		{
			return var_299ea954;
		}
		if(isdefined(var_bcb9de3e))
		{
			return var_bcb9de3e;
		}
	}
	if(self function_8b1a219a() && isdefined(var_756ee4e5))
	{
		return var_756ee4e5;
	}
	return var_67441581;
}

/*
	Name: get_cast
	Namespace: zm_utility
	Checksum: 0x8F03914A
	Offset: 0x1178
	Size: 0x12
	Parameters: 0
	Flags: None
*/
function get_cast()
{
	return zm_maptable::get_cast();
}

/*
	Name: get_story
	Namespace: zm_utility
	Checksum: 0xFFA117FF
	Offset: 0x1198
	Size: 0x12
	Parameters: 0
	Flags: Linked
*/
function get_story()
{
	return zm_maptable::get_story();
}

/*
	Name: check_solo_status
	Namespace: zm_utility
	Checksum: 0xCAE18793
	Offset: 0x11B8
	Size: 0xB0
	Parameters: 0
	Flags: Linked
*/
function check_solo_status()
{
	if(getnumexpectedplayers() == 1 && (!sessionmodeisonlinegame() || sessionmodeisprivate() || zm_trial::is_trial_mode() || getdvarint(#"com_maxclients", 0) == 1))
	{
		level.is_forever_solo_game = 1;
	}
	else
	{
		level.is_forever_solo_game = 0;
	}
}

/*
	Name: init_zombie_run_cycle
	Namespace: zm_utility
	Checksum: 0x9D653349
	Offset: 0x1270
	Size: 0x1B4
	Parameters: 0
	Flags: Linked
*/
function init_zombie_run_cycle()
{
	if(isdefined(level.speed_change_round))
	{
		if(!isdefined(self._starting_round_number))
		{
			self._starting_round_number = level.round_number;
		}
		if(self._starting_round_number >= level.speed_change_round)
		{
			speed_percent = 0.2 + ((self._starting_round_number - level.speed_change_round) * 0.2);
			speed_percent = min(speed_percent, 1);
			change_round_max = int(level.speed_change_max * speed_percent);
			change_left = change_round_max - level.speed_change_num;
			if(change_left == 0)
			{
				self zombie_utility::set_zombie_run_cycle();
				return;
			}
			change_speed = randomint(100);
			if(change_speed > 80)
			{
				self change_zombie_run_cycle();
				return;
			}
			zombie_count = zombie_utility::get_current_zombie_count();
			zombie_left = level.zombie_ai_limit - zombie_count;
			if(zombie_left == change_left)
			{
				self change_zombie_run_cycle();
				return;
			}
		}
	}
	self zombie_utility::set_zombie_run_cycle();
}

/*
	Name: change_zombie_run_cycle
	Namespace: zm_utility
	Checksum: 0x309B6D35
	Offset: 0x1430
	Size: 0x74
	Parameters: 0
	Flags: Linked
*/
function change_zombie_run_cycle()
{
	level.speed_change_num++;
	if(level.gamedifficulty == 0)
	{
		self zombie_utility::set_zombie_run_cycle("sprint");
	}
	else
	{
		self zombie_utility::set_zombie_run_cycle("run");
	}
	self thread speed_change_watcher();
}

/*
	Name: make_supersprinter
	Namespace: zm_utility
	Checksum: 0xBE5B7C08
	Offset: 0x14B0
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function make_supersprinter()
{
	self zombie_utility::set_zombie_run_cycle("super_sprint");
}

/*
	Name: speed_change_watcher
	Namespace: zm_utility
	Checksum: 0xA5FB5B9A
	Offset: 0x14E0
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function speed_change_watcher()
{
	self waittill(#"death");
	if(level.speed_change_num > 0)
	{
		level.speed_change_num--;
	}
}

/*
	Name: move_zombie_spawn_location
	Namespace: zm_utility
	Checksum: 0x4E1E5BF4
	Offset: 0x1520
	Size: 0x4FA
	Parameters: 1
	Flags: Linked
*/
function move_zombie_spawn_location(spot)
{
	self endon(#"death");
	if(isdefined(self.spawn_pos))
	{
		self notify(#"risen", {#find_flesh_struct_string:self.spawn_pos.script_string});
		return;
	}
	self.spawn_pos = spot;
	if(!isdefined(spot))
	{
		return;
	}
	if(isdefined(spot.target))
	{
		self.target = spot.target;
	}
	if(isdefined(spot.zone_name))
	{
		self.zone_name = spot.zone_name;
	}
	if(isdefined(spot.script_parameters))
	{
		self.script_parameters = spot.script_parameters;
	}
	if(!isdefined(spot.script_noteworthy))
	{
		spot.script_noteworthy = "spawn_location";
	}
	tokens = strtok(spot.script_noteworthy, " ");
	foreach(index, token in tokens)
	{
		if(isdefined(self.spawn_point_override))
		{
			spot = self.spawn_point_override;
			token = spot.script_noteworthy;
		}
		if(token == "custom_spawner_entry")
		{
			next_token = index + 1;
			if(isdefined(tokens[next_token]))
			{
				str_spawn_entry = tokens[next_token];
				if(isdefined(level.custom_spawner_entry) && isdefined(level.custom_spawner_entry[str_spawn_entry]))
				{
					self thread [[level.custom_spawner_entry[str_spawn_entry]]](spot);
					continue;
				}
			}
		}
		if(token == "riser_location")
		{
			self thread zm_spawner::do_zombie_rise(spot);
			continue;
		}
		if(token == "faller_location")
		{
			self thread zm_ai_faller::do_zombie_fall(spot);
			continue;
		}
		if(token == "spawn_location")
		{
			if(isdefined(self.anchor))
			{
				return;
			}
			self.anchor = spawn("script_origin", self.origin);
			self.anchor.angles = self.angles;
			self linkto(self.anchor);
			self.anchor thread anchor_delete_failsafe(self);
			if(!isdefined(spot.angles))
			{
				spot.angles = (0, 0, 0);
			}
			self ghost();
			self.anchor moveto(spot.origin, 0.05);
			self.anchor waittill(#"movedone");
			target_org = zombie_utility::get_desired_origin();
			if(isdefined(target_org))
			{
				anim_ang = vectortoangles(target_org - self.origin);
				self.anchor rotateto((0, anim_ang[1], 0), 0.05);
				self.anchor waittill(#"rotatedone");
			}
			if(isdefined(level.zombie_spawn_fx))
			{
				playfx(level.zombie_spawn_fx, spot.origin);
			}
			self unlink();
			if(isdefined(self.anchor))
			{
				self.anchor delete();
			}
			if(!is_true(self.dontshow))
			{
				self show();
			}
			self notify(#"risen", {#find_flesh_struct_string:spot.script_string});
		}
	}
}

/*
	Name: anchor_delete_failsafe
	Namespace: zm_utility
	Checksum: 0x2F0520B9
	Offset: 0x1A28
	Size: 0x5C
	Parameters: 1
	Flags: Linked
*/
function anchor_delete_failsafe(ai_zombie)
{
	ai_zombie endon(#"risen");
	ai_zombie waittill(#"death");
	if(isdefined(self))
	{
		self delete();
	}
}

/*
	Name: all_chunks_intact
	Namespace: zm_utility
	Checksum: 0xA5C34596
	Offset: 0x1A90
	Size: 0xC8
	Parameters: 2
	Flags: Linked
*/
function all_chunks_intact(barrier, barrier_chunks)
{
	if(isdefined(barrier.zbarrier))
	{
		pieces = barrier.zbarrier getzbarrierpieceindicesinstate("closed");
		if(pieces.size != barrier.zbarrier getnumzbarrierpieces())
		{
			return false;
		}
	}
	else
	{
		for(i = 0; i < barrier_chunks.size; i++)
		{
			if(barrier_chunks[i] get_chunk_state() != "repaired")
			{
				return false;
			}
		}
	}
	return true;
}

/*
	Name: no_valid_repairable_boards
	Namespace: zm_utility
	Checksum: 0x5FC57C04
	Offset: 0x1B60
	Size: 0xB0
	Parameters: 2
	Flags: Linked
*/
function no_valid_repairable_boards(barrier, barrier_chunks)
{
	if(isdefined(barrier.zbarrier))
	{
		pieces = barrier.zbarrier getzbarrierpieceindicesinstate("open");
		if(pieces.size)
		{
			return false;
		}
	}
	else
	{
		for(i = 0; i < barrier_chunks.size; i++)
		{
			if(barrier_chunks[i] get_chunk_state() == "destroyed")
			{
				return false;
			}
		}
	}
	return true;
}

/*
	Name: is_encounter
	Namespace: zm_utility
	Checksum: 0x82042E8E
	Offset: 0x1C18
	Size: 0x6
	Parameters: 0
	Flags: Linked
*/
function is_encounter()
{
	return false;
}

/*
	Name: all_chunks_destroyed
	Namespace: zm_utility
	Checksum: 0xA1033E27
	Offset: 0x1C28
	Size: 0x128
	Parameters: 2
	Flags: Linked
*/
function all_chunks_destroyed(barrier, barrier_chunks)
{
	if(isdefined(barrier.zbarrier))
	{
		pieces = arraycombine(barrier.zbarrier getzbarrierpieceindicesinstate("open"), barrier.zbarrier getzbarrierpieceindicesinstate("opening"), 1, 0);
		if(pieces.size != barrier.zbarrier getnumzbarrierpieces())
		{
			return false;
		}
	}
	else if(isdefined(barrier_chunks))
	{
		/#
			assert(isdefined(barrier_chunks), "");
		#/
		for(i = 0; i < barrier_chunks.size; i++)
		{
			if(barrier_chunks[i] get_chunk_state() != "destroyed")
			{
				return false;
			}
		}
	}
	return true;
}

/*
	Name: check_point_in_playable_area
	Namespace: zm_utility
	Checksum: 0xFB86C106
	Offset: 0x1D58
	Size: 0x1FA
	Parameters: 1
	Flags: Linked
*/
function check_point_in_playable_area(origin)
{
	if(function_21f4ac36() && !isdefined(level.var_a2a9b2de))
	{
		level.var_a2a9b2de = getnodearray("player_region", "script_noteworthy");
	}
	if(function_c85ebbbc() && !isdefined(level.playable_area))
	{
		level.playable_area = getentarray("player_volume", "script_noteworthy");
	}
	valid_point = 0;
	if(isdefined(level.playable_area))
	{
		var_12ed21a1 = function_72d3bca6(level.playable_area, origin, undefined, undefined, level.var_603981f1);
		foreach(area in var_12ed21a1)
		{
			if(istouching(origin, area))
			{
				valid_point = 1;
				break;
			}
		}
	}
	if(isdefined(level.var_a2a9b2de) && !valid_point)
	{
		node = function_52c1730(origin + vectorscale((0, 0, 1), 40), level.var_a2a9b2de, 500);
		if(isdefined(node))
		{
			valid_point = 1;
		}
	}
	return valid_point;
}

/*
	Name: check_point_in_enabled_zone
	Namespace: zm_utility
	Checksum: 0x38FEC6E8
	Offset: 0x1F60
	Size: 0x398
	Parameters: 4
	Flags: Linked
*/
function check_point_in_enabled_zone(origin, zone_is_active, player_zones, player_regions)
{
	if(isdefined(level.var_304d38af) && ![[level.var_304d38af]](origin))
	{
		return 0;
	}
	if(function_c85ebbbc() && !isdefined(level.playable_area))
	{
		level.playable_area = getentarray("player_volume", "script_noteworthy");
	}
	if(!isdefined(player_zones))
	{
		player_zones = level.playable_area;
	}
	if(function_21f4ac36() && !isdefined(level.player_regions))
	{
		level.player_regions = getnodearray("player_region", "script_noteworthy");
	}
	if(!isdefined(player_regions))
	{
		player_regions = level.player_regions;
	}
	if(!isdefined(level.zones) || (!isdefined(player_zones) && !isdefined(player_regions)))
	{
		return 1;
	}
	one_valid_zone = 0;
	if(isdefined(player_zones))
	{
		var_f9ef6a14 = origin + vectorscale((0, 0, 1), 40);
		var_12ed21a1 = function_72d3bca6(level.playable_area, var_f9ef6a14, undefined, undefined, level.var_603981f1);
		foreach(area in var_12ed21a1)
		{
			zone = level.zones[area.targetname];
			if(isdefined(zone) && is_true(zone.is_enabled))
			{
				if(zone_is_active === 1 && !is_true(zone.is_active))
				{
					continue;
				}
				if(istouching(var_f9ef6a14, area))
				{
					one_valid_zone = 1;
					break;
				}
			}
		}
	}
	if(isdefined(player_regions) && !one_valid_zone)
	{
		node = function_52c1730(origin + vectorscale((0, 0, 1), 40), player_regions, 500);
		if(isdefined(node))
		{
			zone = level.zones[node.targetname];
			if(isdefined(zone) && is_true(zone.is_enabled))
			{
				if(zone_is_active === 1 && !is_true(zone.is_active))
				{
					one_valid_zone = 0;
				}
				else
				{
					one_valid_zone = 1;
				}
			}
		}
	}
	return one_valid_zone;
}

/*
	Name: round_up_to_ten
	Namespace: zm_utility
	Checksum: 0xFD966BEE
	Offset: 0x2300
	Size: 0x3E
	Parameters: 1
	Flags: Linked
*/
function round_up_to_ten(score)
{
	new_score = score - (score % 10);
	if(new_score < score)
	{
		new_score = new_score + 10;
	}
	return new_score;
}

/*
	Name: round_up_score
	Namespace: zm_utility
	Checksum: 0x7EA34E98
	Offset: 0x2348
	Size: 0x5C
	Parameters: 2
	Flags: Linked
*/
function round_up_score(score, value)
{
	score = int(score);
	new_score = score - (score % value);
	if(new_score < score)
	{
		new_score = new_score + value;
	}
	return new_score;
}

/*
	Name: halve_score
	Namespace: zm_utility
	Checksum: 0xB8A33E4C
	Offset: 0x23B0
	Size: 0x3A
	Parameters: 1
	Flags: Linked
*/
function halve_score(n_score)
{
	n_score = n_score / 2;
	n_score = round_up_score(n_score, 10);
	return n_score;
}

/*
	Name: create_zombie_point_of_interest
	Namespace: zm_utility
	Checksum: 0x43AEF674
	Offset: 0x23F8
	Size: 0x1E4
	Parameters: 7
	Flags: Linked
*/
function create_zombie_point_of_interest(attract_dist, num_attractors, added_poi_value, start_turned_on, initial_attract_func, arrival_attract_func, poi_team)
{
	if(!is_point_inside_enabled_zone(self.origin))
	{
		return;
	}
	if(!isdefined(added_poi_value))
	{
		self.added_poi_value = 0;
	}
	else
	{
		self.added_poi_value = added_poi_value;
	}
	if(!isdefined(start_turned_on))
	{
		start_turned_on = 1;
	}
	if(!isdefined(attract_dist))
	{
		attract_dist = 1536;
	}
	self.script_noteworthy = "zombie_poi";
	self.poi_active = start_turned_on;
	if(isdefined(attract_dist))
	{
		self.max_attractor_dist = attract_dist;
		self.poi_radius = attract_dist * attract_dist;
	}
	else
	{
		self.poi_radius = undefined;
	}
	self.num_poi_attracts = num_attractors;
	self.attract_to_origin = 1;
	self.attractor_array = [];
	self.initial_attract_func = undefined;
	self.arrival_attract_func = undefined;
	if(isdefined(poi_team))
	{
		self._team = poi_team;
	}
	if(isdefined(initial_attract_func))
	{
		self.initial_attract_func = initial_attract_func;
	}
	if(isdefined(arrival_attract_func))
	{
		self.arrival_attract_func = arrival_attract_func;
	}
	if(!isdefined(level.zombie_poi_array))
	{
		level.zombie_poi_array = [];
	}
	else if(!isarray(level.zombie_poi_array))
	{
		level.zombie_poi_array = array(level.zombie_poi_array);
	}
	level.zombie_poi_array[level.zombie_poi_array.size] = self;
	self thread watch_for_poi_death();
}

/*
	Name: watch_for_poi_death
	Namespace: zm_utility
	Checksum: 0x96B9BDA
	Offset: 0x25E8
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function watch_for_poi_death()
{
	self waittill(#"death");
	if(isinarray(level.zombie_poi_array, self))
	{
		arrayremovevalue(level.zombie_poi_array, self);
	}
}

/*
	Name: debug_draw_new_attractor_positions
	Namespace: zm_utility
	Checksum: 0xFA46018F
	Offset: 0x2648
	Size: 0x13A
	Parameters: 0
	Flags: None
*/
function debug_draw_new_attractor_positions()
{
	self endon(#"death");
	while(true)
	{
		foreach(attract in self.attractor_positions)
		{
			passed = bullettracepassed(attract[0] + vectorscale((0, 0, 1), 24), self.origin + vectorscale((0, 0, 1), 24), 0, self);
			if(passed)
			{
				/#
					debugstar(attract[0], 6, (1, 1, 1));
				#/
				continue;
			}
			/#
				debugstar(attract[0], 6, (1, 0, 0));
			#/
		}
		waitframe(1);
	}
}

/*
	Name: create_zombie_point_of_interest_attractor_positions
	Namespace: zm_utility
	Checksum: 0xC3BF0221
	Offset: 0x2790
	Size: 0x50C
	Parameters: 4
	Flags: None
*/
function create_zombie_point_of_interest_attractor_positions(var_b09c2334, n_height, var_6b5dd73c, var_7262d151)
{
	if(!isdefined(var_b09c2334))
	{
		var_b09c2334 = 15;
	}
	if(!isdefined(n_height))
	{
		n_height = 60;
	}
	if(!isdefined(var_7262d151))
	{
		var_7262d151 = 0;
	}
	self endon(#"death");
	if(!isdefined(self.num_poi_attracts) || (isdefined(self.script_noteworthy) && self.script_noteworthy != "zombie_poi"))
	{
		return false;
	}
	queryresult = positionquery_source_navigation(self.origin, var_b09c2334 / 2, (isdefined(var_6b5dd73c) ? var_6b5dd73c : self.max_attractor_dist), n_height / 2, var_b09c2334 / 2, 1, var_b09c2334 / 2);
	if(var_7262d151)
	{
		var_7162cf15 = getclosestpointonnavmesh(self.origin, var_6b5dd73c);
	}
	else
	{
		var_7162cf15 = getclosestpointonnavmesh(self.origin);
	}
	if(!isdefined(var_7162cf15))
	{
		return false;
	}
	if(queryresult.data.size < self.num_poi_attracts)
	{
		self.num_poi_attracts = queryresult.data.size;
	}
	var_6b998daf = 0;
	for(i = 0; i < queryresult.data.size; i++)
	{
		if(!tracepassedonnavmesh(var_7162cf15, queryresult.data[i].origin, 15))
		{
			/#
				if(is_true(level.var_565d6ce0))
				{
					recordstar(queryresult.data[i].origin, (1, 0, 0));
					record3dtext("", queryresult.data[i].origin + vectorscale((0, 0, 1), 8), (1, 0, 0));
				}
			#/
			continue;
		}
		if(is_true(level.validate_poi_attractors))
		{
			passed = bullettracepassed(queryresult.data[i].origin + vectorscale((0, 0, 1), 24), self.origin + vectorscale((0, 0, 1), 24), 0, self);
			if(passed)
			{
				self.attractor_positions[var_6b998daf] = queryresult.data[i].origin;
				var_6b998daf++;
			}
			else
			{
				/#
					recordstar(queryresult.data[i].origin, (1, 0, 0));
					record3dtext("", queryresult.data[i].origin + vectorscale((0, 0, 1), 8), (1, 0, 0));
				#/
				if(is_true(level.var_565d6ce0))
				{
				}
			}
		}
		else
		{
			if(is_true(self.var_abfcb0d9))
			{
				if(check_point_in_enabled_zone(queryresult.data[i].origin) && check_point_in_playable_area(queryresult.data[i].origin))
				{
					self.attractor_positions[var_6b998daf] = queryresult.data[i].origin;
					var_6b998daf++;
				}
			}
			else
			{
				self.attractor_positions[var_6b998daf] = queryresult.data[i].origin;
				var_6b998daf++;
				/#
					if(is_true(level.var_565d6ce0))
					{
						recordstar(queryresult.data[i].origin, (0, 1, 0));
					}
				#/
			}
		}
		if(self.num_poi_attracts == var_6b998daf)
		{
			break;
		}
	}
	if(!isdefined(self.attractor_positions))
	{
		self.attractor_positions = [];
	}
	self.attract_to_origin = 0;
	self notify(#"attractor_positions_generated");
	level notify(#"attractor_positions_generated");
	return true;
}

/*
	Name: generated_radius_attract_positions
	Namespace: zm_utility
	Checksum: 0x5D0A9FD
	Offset: 0x2CA8
	Size: 0x3E6
	Parameters: 4
	Flags: None
*/
function generated_radius_attract_positions(forward, offset, num_positions, attract_radius)
{
	self endon(#"death");
	failed = 0;
	degs_per_pos = 360 / num_positions;
	i = offset;
	while(i < 360 + offset)
	{
		altforward = forward * attract_radius;
		rotated_forward = ((cos(i) * altforward[0]) - (sin(i) * altforward[1]), (sin(i) * altforward[0]) + (cos(i) * altforward[1]), altforward[2]);
		if(isdefined(level.poi_positioning_func))
		{
			pos = [[level.poi_positioning_func]](self.origin, rotated_forward);
		}
		else
		{
			if(is_true(level.use_alternate_poi_positioning))
			{
				pos = zm_server_throttle::server_safe_ground_trace("poi_trace", 10, (self.origin + rotated_forward) + vectorscale((0, 0, 1), 10));
			}
			else
			{
				pos = zm_server_throttle::server_safe_ground_trace("poi_trace", 10, (self.origin + rotated_forward) + vectorscale((0, 0, 1), 100));
			}
		}
		if(!isdefined(pos))
		{
			failed++;
		}
		else
		{
			if(is_true(level.use_alternate_poi_positioning))
			{
				if(isdefined(self) && isdefined(self.origin))
				{
					if(self.origin[2] >= (pos[2] - 1) && (self.origin[2] - pos[2]) <= 150)
					{
						pos_array = [];
						pos_array[0] = pos;
						pos_array[1] = self;
						if(!isdefined(self.attractor_positions))
						{
							self.attractor_positions = [];
						}
						else if(!isarray(self.attractor_positions))
						{
							self.attractor_positions = array(self.attractor_positions);
						}
						self.attractor_positions[self.attractor_positions.size] = pos_array;
					}
				}
				else
				{
					failed++;
				}
			}
			else
			{
				if(abs(pos[2] - self.origin[2]) < 60)
				{
					pos_array = [];
					pos_array[0] = pos;
					pos_array[1] = self;
					if(!isdefined(self.attractor_positions))
					{
						self.attractor_positions = [];
					}
					else if(!isarray(self.attractor_positions))
					{
						self.attractor_positions = array(self.attractor_positions);
					}
					self.attractor_positions[self.attractor_positions.size] = pos_array;
				}
				else
				{
					failed++;
				}
			}
		}
		i = i + degs_per_pos;
	}
	return failed;
}

/*
	Name: debug_draw_attractor_positions
	Namespace: zm_utility
	Checksum: 0x3A865468
	Offset: 0x3098
	Size: 0x98
	Parameters: 0
	Flags: None
*/
function debug_draw_attractor_positions()
{
	/#
		while(true)
		{
			while(!isdefined(self.attractor_positions))
			{
				waitframe(1);
				continue;
			}
			for(i = 0; i < self.attractor_positions.size; i++)
			{
				line(self.origin, self.attractor_positions[i][0], (1, 0, 0), 1, 1);
			}
			waitframe(1);
			if(!isdefined(self))
			{
				return;
			}
		}
	#/
}

/*
	Name: debug_draw_claimed_attractor_positions
	Namespace: zm_utility
	Checksum: 0x74FA5E0E
	Offset: 0x3138
	Size: 0x98
	Parameters: 0
	Flags: None
*/
function debug_draw_claimed_attractor_positions()
{
	/#
		while(true)
		{
			while(!isdefined(self.claimed_attractor_positions))
			{
				waitframe(1);
				continue;
			}
			for(i = 0; i < self.claimed_attractor_positions.size; i++)
			{
				line(self.origin, self.claimed_attractor_positions[i][0], (0, 1, 0), 1, 1);
			}
			waitframe(1);
			if(!isdefined(self))
			{
				return;
			}
		}
	#/
}

/*
	Name: get_zombie_point_of_interest
	Namespace: zm_utility
	Checksum: 0xE76836A4
	Offset: 0x31D8
	Size: 0x400
	Parameters: 2
	Flags: Linked
*/
function get_zombie_point_of_interest(origin, poi_array)
{
	aiprofile_beginentry("get_zombie_point_of_interest");
	if(is_true(self.ignore_all_poi))
	{
		aiprofile_endentry();
		return undefined;
	}
	curr_radius = undefined;
	if(isdefined(poi_array))
	{
		ent_array = poi_array;
	}
	else
	{
		ent_array = level.zombie_poi_array;
	}
	best_poi = undefined;
	var_a9740555 = undefined;
	best_dist = 100000000;
	for(i = 0; i < ent_array.size; i++)
	{
		if(!isdefined(ent_array[i]) || !isdefined(ent_array[i].poi_active) || !ent_array[i].poi_active)
		{
			continue;
		}
		if(isdefined(self.ignore_poi_targetname) && self.ignore_poi_targetname.size > 0 && isinarray(self.ignore_poi_targetname, ent_array[i].targetname))
		{
			continue;
		}
		if(isdefined(self.ignore_poi) && self.ignore_poi.size > 0 && isinarray(self.ignore_poi, ent_array[i]))
		{
			continue;
		}
		dist = distancesquared(origin, ent_array[i].origin);
		dist = dist - ent_array[i].added_poi_value;
		if(isdefined(ent_array[i].poi_radius))
		{
			curr_radius = ent_array[i].poi_radius;
		}
		if(!isdefined(curr_radius) || dist < curr_radius && dist < best_dist && ent_array[i] can_attract(self))
		{
			best_poi = ent_array[i];
			best_dist = dist;
		}
	}
	if(isdefined(best_poi))
	{
		if(isdefined(best_poi._team))
		{
			if(isdefined(self._race_team) && self._race_team != best_poi._team)
			{
				aiprofile_endentry();
				return undefined;
			}
		}
		if(is_true(best_poi._new_ground_trace))
		{
			var_a9740555 = {};
			var_a9740555.position = groundpos_ignore_water_new(best_poi.origin + vectorscale((0, 0, 1), 100));
			var_a9740555.poi_ent = best_poi;
		}
		else
		{
			if(isdefined(best_poi.attract_to_origin) && best_poi.attract_to_origin)
			{
				var_a9740555 = {};
				var_a9740555.position = groundpos(best_poi.origin + vectorscale((0, 0, 1), 100));
				var_a9740555.poi_ent = best_poi;
			}
			else
			{
				var_a9740555 = self add_poi_attractor(best_poi);
			}
		}
		if(isdefined(best_poi.initial_attract_func))
		{
			self thread [[best_poi.initial_attract_func]](best_poi);
		}
		if(isdefined(best_poi.arrival_attract_func))
		{
			self thread [[best_poi.arrival_attract_func]](best_poi);
		}
	}
	aiprofile_endentry();
	return var_a9740555;
}

/*
	Name: activate_zombie_point_of_interest
	Namespace: zm_utility
	Checksum: 0x8DC9B14
	Offset: 0x35E0
	Size: 0x26
	Parameters: 0
	Flags: None
*/
function activate_zombie_point_of_interest()
{
	if(self.script_noteworthy != "zombie_poi")
	{
		return;
	}
	self.poi_active = 1;
}

/*
	Name: deactivate_zombie_point_of_interest
	Namespace: zm_utility
	Checksum: 0xDB53D9F5
	Offset: 0x3610
	Size: 0x11C
	Parameters: 1
	Flags: None
*/
function deactivate_zombie_point_of_interest(dont_remove)
{
	if(!isdefined(self.script_noteworthy) || self.script_noteworthy != "zombie_poi")
	{
		return;
	}
	arrayremovevalue(self.attractor_array, undefined);
	for(i = 0; i < self.attractor_array.size; i++)
	{
		self.attractor_array[i] notify(#"kill_poi");
	}
	self.attractor_array = [];
	self.claimed_attractor_positions = [];
	self.attractor_positions = [];
	self.poi_active = 0;
	if(is_true(dont_remove))
	{
		return;
	}
	if(isdefined(self))
	{
		if(isinarray(level.zombie_poi_array, self))
		{
			arrayremovevalue(level.zombie_poi_array, self);
		}
	}
}

/*
	Name: assign_zombie_point_of_interest
	Namespace: zm_utility
	Checksum: 0x2BB4D7D9
	Offset: 0x3738
	Size: 0x108
	Parameters: 2
	Flags: None
*/
function assign_zombie_point_of_interest(origin, poi)
{
	position = undefined;
	doremovalthread = 0;
	if(isdefined(poi) && poi can_attract(self))
	{
		if(!isdefined(poi.attractor_array) || (isdefined(poi.attractor_array) && !isinarray(poi.attractor_array, self)))
		{
			doremovalthread = 1;
		}
		position = self add_poi_attractor(poi);
		if(isdefined(position) && doremovalthread && isinarray(poi.attractor_array, self))
		{
			self thread update_on_poi_removal(poi);
		}
	}
	return position;
}

/*
	Name: remove_poi_attractor
	Namespace: zm_utility
	Checksum: 0x7B16AD3
	Offset: 0x3848
	Size: 0xCE
	Parameters: 1
	Flags: Linked
*/
function remove_poi_attractor(zombie_poi)
{
	if(!isdefined(zombie_poi) || !isdefined(zombie_poi.attractor_array))
	{
		return;
	}
	for(i = 0; i < zombie_poi.attractor_array.size; i++)
	{
		if(zombie_poi.attractor_array[i] == self)
		{
			arrayremovevalue(zombie_poi.attractor_array, zombie_poi.attractor_array[i]);
			arrayremovevalue(zombie_poi.claimed_attractor_positions, zombie_poi.claimed_attractor_positions[i]);
			if(isdefined(self))
			{
				self notify(#"kill_poi");
			}
		}
	}
}

/*
	Name: array_check_for_dupes_using_compare
	Namespace: zm_utility
	Checksum: 0x39CAC23F
	Offset: 0x3920
	Size: 0x5A
	Parameters: 3
	Flags: Linked
*/
function array_check_for_dupes_using_compare(array, single, is_equal_fn)
{
	for(i = 0; i < array.size; i++)
	{
		if([[is_equal_fn]](array[i], single))
		{
			return false;
		}
	}
	return true;
}

/*
	Name: poi_locations_equal
	Namespace: zm_utility
	Checksum: 0x8F137CE8
	Offset: 0x3988
	Size: 0x22
	Parameters: 2
	Flags: Linked
*/
function poi_locations_equal(loc1, loc2)
{
	return loc1[0] == loc2[0];
}

/*
	Name: add_poi_attractor
	Namespace: zm_utility
	Checksum: 0xA7B89B48
	Offset: 0x39B8
	Size: 0x3B8
	Parameters: 1
	Flags: Linked
*/
function add_poi_attractor(zombie_poi)
{
	if(!isdefined(zombie_poi))
	{
		return;
	}
	if(!isdefined(zombie_poi.attractor_array))
	{
		zombie_poi.attractor_array = [];
	}
	if(!isinarray(zombie_poi.attractor_array, self))
	{
		if(!isdefined(zombie_poi.claimed_attractor_positions))
		{
			zombie_poi.claimed_attractor_positions = [];
		}
		if(!isdefined(zombie_poi.attractor_positions) || zombie_poi.attractor_positions.size <= 0)
		{
			return undefined;
		}
		best_dist = 100000000;
		best_pos = undefined;
		for(i = 0; i <= zombie_poi.attractor_positions.size; i++)
		{
			if(!isdefined(zombie_poi.attractor_positions[i]))
			{
				continue;
			}
			if(!isinarray(zombie_poi.claimed_attractor_positions, zombie_poi.attractor_positions[i]))
			{
				if(isdefined(zombie_poi.attractor_positions[i]) && isdefined(self.origin))
				{
					dist = distancesquared(zombie_poi.attractor_positions[i], zombie_poi.origin);
					if(dist < best_dist || !isdefined(best_pos))
					{
						best_dist = dist;
						best_pos = zombie_poi.attractor_positions[i];
					}
				}
			}
		}
		if(!isdefined(best_pos))
		{
			if(is_true(level.validate_poi_attractors))
			{
				valid_pos = [];
				valid_pos[0] = zombie_poi.origin;
				valid_pos[1] = zombie_poi;
				return valid_pos;
			}
			return undefined;
		}
		if(!isdefined(zombie_poi.attractor_array))
		{
			zombie_poi.attractor_array = [];
		}
		else if(!isarray(zombie_poi.attractor_array))
		{
			zombie_poi.attractor_array = array(zombie_poi.attractor_array);
		}
		zombie_poi.attractor_array[zombie_poi.attractor_array.size] = self;
		self thread update_poi_on_death(zombie_poi);
		if(!isdefined(zombie_poi.claimed_attractor_positions))
		{
			zombie_poi.claimed_attractor_positions = [];
		}
		else if(!isarray(zombie_poi.claimed_attractor_positions))
		{
			zombie_poi.claimed_attractor_positions = array(zombie_poi.claimed_attractor_positions);
		}
		zombie_poi.claimed_attractor_positions[zombie_poi.claimed_attractor_positions.size] = best_pos;
		return {#poi_ent:zombie_poi, #position:best_pos};
	}
	for(i = 0; i < zombie_poi.attractor_array.size; i++)
	{
		if(zombie_poi.attractor_array[i] == self)
		{
			if(isdefined(zombie_poi.claimed_attractor_positions) && isdefined(zombie_poi.claimed_attractor_positions[i]))
			{
				return {#poi_ent:zombie_poi, #position:zombie_poi.claimed_attractor_positions[i]};
			}
		}
	}
	return undefined;
}

/*
	Name: function_49f80b6f
	Namespace: zm_utility
	Checksum: 0xAD9B43B3
	Offset: 0x3D78
	Size: 0x1E
	Parameters: 1
	Flags: Linked
*/
function function_49f80b6f(entity)
{
	return entity.zombie_poi.position;
}

/*
	Name: can_attract
	Namespace: zm_utility
	Checksum: 0xEE3363D0
	Offset: 0x3DA0
	Size: 0xA6
	Parameters: 1
	Flags: Linked
*/
function can_attract(attractor)
{
	if(!isdefined(self.attractor_array))
	{
		self.attractor_array = [];
	}
	if(isdefined(self.attracted_array) && !isinarray(self.attracted_array, attractor))
	{
		return false;
	}
	if(isinarray(self.attractor_array, attractor))
	{
		return true;
	}
	if(isdefined(self.num_poi_attracts) && self.attractor_array.size >= self.num_poi_attracts)
	{
		return false;
	}
	return true;
}

/*
	Name: update_poi_on_death
	Namespace: zm_utility
	Checksum: 0x99B4110C
	Offset: 0x3E50
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function update_poi_on_death(zombie_poi)
{
	self endon(#"kill_poi");
	self waittill(#"death");
	self remove_poi_attractor(zombie_poi);
}

/*
	Name: update_on_poi_removal
	Namespace: zm_utility
	Checksum: 0xDF57A203
	Offset: 0x3EA8
	Size: 0xAC
	Parameters: 1
	Flags: Linked
*/
function update_on_poi_removal(zombie_poi)
{
	zombie_poi waittill(#"death");
	if(!isdefined(zombie_poi.attractor_array))
	{
		return;
	}
	for(i = 0; i < zombie_poi.attractor_array.size; i++)
	{
		if(zombie_poi.attractor_array[i] == self)
		{
			arrayremoveindex(zombie_poi.attractor_array, i);
			arrayremoveindex(zombie_poi.claimed_attractor_positions, i);
		}
	}
}

/*
	Name: invalidate_attractor_pos
	Namespace: zm_utility
	Checksum: 0x48202CD5
	Offset: 0x3F60
	Size: 0x192
	Parameters: 2
	Flags: None
*/
function invalidate_attractor_pos(attractor_pos, zombie)
{
	if(!isdefined(self) || !isdefined(attractor_pos))
	{
		wait(0.1);
		return undefined;
	}
	if(isdefined(self.attractor_positions) && !array_check_for_dupes_using_compare(self.attractor_positions, attractor_pos, &poi_locations_equal))
	{
		index = 0;
		for(i = 0; i < self.attractor_positions.size; i++)
		{
			if(poi_locations_equal(self.attractor_positions[i], attractor_pos))
			{
				index = i;
			}
		}
		arrayremovevalue(self.attractor_array, zombie);
		arrayremovevalue(self.attractor_positions, attractor_pos);
		for(i = 0; i < self.claimed_attractor_positions.size; i++)
		{
			if(self.claimed_attractor_positions[i][0] == attractor_pos[0])
			{
				arrayremovevalue(self.claimed_attractor_positions, self.claimed_attractor_positions[i]);
			}
		}
	}
	else
	{
		wait(0.1);
	}
	return get_zombie_point_of_interest(zombie.origin);
}

/*
	Name: remove_poi_from_ignore_list
	Namespace: zm_utility
	Checksum: 0x5362948D
	Offset: 0x4100
	Size: 0x8E
	Parameters: 1
	Flags: None
*/
function remove_poi_from_ignore_list(poi)
{
	if(isdefined(self.ignore_poi) && self.ignore_poi.size > 0)
	{
		for(i = 0; i < self.ignore_poi.size; i++)
		{
			if(self.ignore_poi[i] == poi)
			{
				arrayremovevalue(self.ignore_poi, self.ignore_poi[i]);
				return;
			}
		}
	}
}

/*
	Name: add_poi_to_ignore_list
	Namespace: zm_utility
	Checksum: 0x62212616
	Offset: 0x4198
	Size: 0xA8
	Parameters: 1
	Flags: None
*/
function add_poi_to_ignore_list(poi)
{
	if(!isdefined(self.ignore_poi))
	{
		self.ignore_poi = [];
	}
	add_poi = 1;
	if(self.ignore_poi.size > 0)
	{
		for(i = 0; i < self.ignore_poi.size; i++)
		{
			if(self.ignore_poi[i] == poi)
			{
				add_poi = 0;
				break;
			}
		}
	}
	if(add_poi)
	{
		self.ignore_poi[self.ignore_poi.size] = poi;
	}
}

/*
	Name: default_validate_enemy_path_length
	Namespace: zm_utility
	Checksum: 0x4741F5D1
	Offset: 0x4248
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function default_validate_enemy_path_length(player)
{
	d = distancesquared(self.origin, player.origin);
	if(d <= 1296)
	{
		return true;
	}
	return false;
}

/*
	Name: function_d0f02e71
	Namespace: zm_utility
	Checksum: 0x81A2C89
	Offset: 0x42A8
	Size: 0xC8
	Parameters: 1
	Flags: Linked
*/
function function_d0f02e71(archetype)
{
	if(!isdefined(level.var_58903b1f))
	{
		level.var_58903b1f = [];
	}
	if(!isdefined(level.var_58903b1f))
	{
		level.var_58903b1f = [];
	}
	else if(!isarray(level.var_58903b1f))
	{
		level.var_58903b1f = array(level.var_58903b1f);
	}
	if(!isinarray(level.var_58903b1f, archetype))
	{
		level.var_58903b1f[level.var_58903b1f.size] = archetype;
	}
}

/*
	Name: function_55295a16
	Namespace: zm_utility
	Checksum: 0x4C23E045
	Offset: 0x4378
	Size: 0x25C
	Parameters: 0
	Flags: Linked
*/
function function_55295a16()
{
	level waittill(#"start_of_round");
	while(true)
	{
		reset_closest_player = 1;
		zombies = [];
		if(isdefined(level.var_58903b1f))
		{
			foreach(archetype in level.var_58903b1f)
			{
				ai = getaiarchetypearray(archetype, level.zombie_team);
				if(ai.size)
				{
					zombies = arraycombine(zombies, ai, 0, 0);
				}
			}
		}
		foreach(zombie in zombies)
		{
			if(is_true(zombie.need_closest_player))
			{
				reset_closest_player = 0;
				zombie.var_3a610ea4 = undefined;
				break;
			}
			zombie.var_3a610ea4 = undefined;
		}
		if(reset_closest_player)
		{
			foreach(zombie in zombies)
			{
				if(isdefined(zombie.need_closest_player))
				{
					zombie.need_closest_player = 1;
					/#
						zombie.var_26f25576 = undefined;
					#/
				}
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_5dcc54a8
	Namespace: zm_utility
	Checksum: 0xD3373FA7
	Offset: 0x45E0
	Size: 0x132
	Parameters: 1
	Flags: Linked, Private
*/
function private function_5dcc54a8(players)
{
	if(isdefined(self.last_closest_player) && is_true(self.last_closest_player.am_i_valid))
	{
		return;
	}
	self.need_closest_player = 1;
	if(!isdefined(players))
	{
		players = [];
	}
	else if(!isarray(players))
	{
		players = array(players);
	}
	foreach(player in players)
	{
		if(is_true(player.am_i_valid))
		{
			self.last_closest_player = player;
			return;
		}
	}
	self.last_closest_player = undefined;
}

/*
	Name: function_c52e1749
	Namespace: zm_utility
	Checksum: 0x44F0729B
	Offset: 0x4720
	Size: 0x722
	Parameters: 2
	Flags: Linked
*/
function function_c52e1749(origin, players)
{
	if(players.size == 0)
	{
		return undefined;
	}
	if(isdefined(self.zombie_poi))
	{
		return undefined;
	}
	if(players.size == 1)
	{
		self.last_closest_player = players[0];
		self.var_c6e0686b = distancesquared(players[0].origin, origin);
		return self.last_closest_player;
	}
	if(!isdefined(self.last_closest_player))
	{
		self.last_closest_player = players[0];
	}
	if(!isdefined(self.need_closest_player))
	{
		self.need_closest_player = 1;
	}
	level.last_closest_time = level.time;
	self.need_closest_player = 0;
	var_88e86621 = spawnstruct();
	var_88e86621.height = self function_6a9ae71();
	var_88e86621.radius = self getpathfindingradius();
	var_88e86621.origin = origin;
	if(isdefined(self.var_6392b6c4))
	{
		var_448ee423 = self [[self.var_6392b6c4]](origin, players);
		playerpositions = [];
		if(isdefined(var_448ee423))
		{
			foreach(var_5063dbdc in var_448ee423)
			{
				if(isdefined(var_5063dbdc.origin))
				{
					if(!isdefined(playerpositions))
					{
						playerpositions = [];
					}
					else if(!isarray(playerpositions))
					{
						playerpositions = array(playerpositions);
					}
					playerpositions[playerpositions.size] = var_5063dbdc.origin;
				}
			}
		}
		else
		{
			var_448ee423 = [];
		}
	}
	else
	{
		playerpositions = [];
		var_448ee423 = [];
		foreach(player in players)
		{
			player_pos = player.last_valid_position;
			if(!isdefined(player_pos))
			{
				player_pos = getclosestpointonnavmesh(player.origin, 100, var_88e86621.radius);
				if(!isdefined(player_pos))
				{
					continue;
				}
			}
			if(var_88e86621.radius > player getpathfindingradius())
			{
				player_pos = getclosestpointonnavmesh(player.origin, 100, var_88e86621.radius);
			}
			pos = (isdefined(player_pos) ? player_pos : player.origin);
			if(!isdefined(playerpositions))
			{
				playerpositions = [];
			}
			else if(!isarray(playerpositions))
			{
				playerpositions = array(playerpositions);
			}
			playerpositions[playerpositions.size] = pos;
			if(getdvarint(#"hash_4477ab37a00b1492", 1) == 1)
			{
				position_info = {#origin:pos, #player:player};
				if(!isdefined(var_448ee423))
				{
					var_448ee423 = [];
				}
				else if(!isarray(var_448ee423))
				{
					var_448ee423 = array(var_448ee423);
				}
				var_448ee423[var_448ee423.size] = position_info;
			}
		}
	}
	closestplayer = undefined;
	self.var_c6e0686b = undefined;
	if(ispointonnavmesh(var_88e86621.origin, self))
	{
		pathdata = generatenavmeshpath(var_88e86621.origin, playerpositions, self);
		if(isdefined(pathdata) && pathdata.status === "succeeded")
		{
			goalpos = pathdata.pathpoints[pathdata.pathpoints.size - 1];
			if(getdvarint(#"hash_4477ab37a00b1492", 1) == 1)
			{
				position_info = arraygetclosest(goalpos, var_448ee423);
				if(isdefined(position_info))
				{
					closestplayer = position_info.player;
				}
			}
			else
			{
				foreach(position in playerpositions)
				{
					if(isdefined(level.var_cd24b30))
					{
						if(distance2dsquared(position, goalpos) < sqr(16) && (abs(position[2] - goalpos[2])) <= level.var_cd24b30)
						{
							closestplayer = players[index];
						}
						continue;
					}
					if(distancesquared(position, goalpos) < sqr(16))
					{
						closestplayer = players[index];
						break;
					}
				}
			}
		}
	}
	/#
		self.var_26f25576 = gettime();
	#/
	self.last_closest_player = closestplayer;
	if(isdefined(closestplayer))
	{
		self.var_c6e0686b = sqr(pathdata.pathdistance);
	}
	self function_5dcc54a8(players);
	return self.last_closest_player;
}

/*
	Name: function_3d70ba7a
	Namespace: zm_utility
	Checksum: 0xDF118AF9
	Offset: 0x4E50
	Size: 0xDB2
	Parameters: 2
	Flags: Linked
*/
function function_3d70ba7a(origin, players)
{
	if(players.size == 0)
	{
		return undefined;
	}
	if(isdefined(self.zombie_poi))
	{
		return undefined;
	}
	if(players.size == 1 && !is_true(self.var_15d21bbf))
	{
		self.last_closest_player = players[0];
		self.var_c6e0686b = distancesquared(players[0].origin, origin);
		self function_5dcc54a8(players[0]);
		return self.last_closest_player;
	}
	if(!isdefined(self.last_closest_player))
	{
		self.last_closest_player = players[0];
	}
	if(!isdefined(self.need_closest_player))
	{
		self.need_closest_player = 1;
	}
	level.last_closest_time = level.time;
	self.need_closest_player = 0;
	var_88e86621 = spawnstruct();
	var_88e86621.height = self function_6a9ae71();
	var_88e86621.radius = self getpathfindingradius();
	var_88e86621.origin = origin;
	if(isdefined(self.var_6392b6c4))
	{
		var_448ee423 = self [[self.var_6392b6c4]](origin, players);
		playerpositions = [];
		if(isdefined(var_448ee423))
		{
			foreach(var_5063dbdc in var_448ee423)
			{
				if(isdefined(var_5063dbdc.origin))
				{
					if(!isdefined(playerpositions))
					{
						playerpositions = [];
					}
					else if(!isarray(playerpositions))
					{
						playerpositions = array(playerpositions);
					}
					playerpositions[playerpositions.size] = var_5063dbdc.origin;
				}
			}
		}
		else
		{
			var_448ee423 = [];
		}
	}
	else
	{
		playerpositions = [];
		var_448ee423 = [];
		foreach(player in players)
		{
			player_pos = player.last_valid_position;
			if(!isdefined(player_pos))
			{
				player_pos = getclosestpointonnavmesh(player.origin, 100, var_88e86621.radius);
				if(!isdefined(player_pos))
				{
					continue;
				}
			}
			if(var_88e86621.radius > player getpathfindingradius())
			{
				player_pos = getclosestpointonnavmesh(player_pos, 100, var_88e86621.radius);
			}
			pos = (isdefined(player_pos) ? player_pos : player.origin);
			if(!isdefined(playerpositions))
			{
				playerpositions = [];
			}
			else if(!isarray(playerpositions))
			{
				playerpositions = array(playerpositions);
			}
			playerpositions[playerpositions.size] = pos;
			if(!isdefined(self.var_2d5cbb7[player getentitynumber()]))
			{
				self.var_2d5cbb7[player getentitynumber()] = {#dist:-1, #hash_e29d2657:0};
			}
			position_info = {#origin:pos, #player:player};
			if(!isdefined(var_448ee423))
			{
				var_448ee423 = [];
			}
			else if(!isarray(var_448ee423))
			{
				var_448ee423 = array(var_448ee423);
			}
			var_448ee423[var_448ee423.size] = position_info;
		}
	}
	closestplayer = undefined;
	self.var_c6e0686b = undefined;
	if(!isdefined(self.var_2d5cbb7))
	{
		self.var_2d5cbb7 = [];
	}
	var_abdf4916 = 0;
	var_9b606bab = undefined;
	if(ispointonnavmesh(var_88e86621.origin, self))
	{
		var_5e1a4c24 = -1;
		var_3f11f493 = -1;
		for(i = 0; i < var_448ee423.size; i++)
		{
			var_68a2859a = self.var_2d5cbb7[var_448ee423[i].player getentitynumber()].var_e29d2657;
			if(var_5e1a4c24 == -1 || var_68a2859a < var_3f11f493)
			{
				var_3f11f493 = var_68a2859a;
				var_5e1a4c24 = i;
			}
		}
		var_674755ca = function_5cb65d8a(var_88e86621.origin, playerpositions, self, var_88e86621.radius, var_88e86621.height, -1, var_5e1a4c24, 1000);
		if(!isdefined(var_674755ca))
		{
			return undefined;
		}
		for(i = 0; i < var_674755ca.size; i++)
		{
			target = var_448ee423[i].player;
			if(var_674755ca[i] == -2)
			{
				var_674755ca[i] = self.var_2d5cbb7[target getentitynumber()].dist;
				continue;
			}
			self.var_2d5cbb7[target getentitynumber()].dist = var_674755ca[i];
			self.var_2d5cbb7[target getentitynumber()].var_e29d2657 = gettime();
		}
		var_e3958ef0 = arraycopy(var_674755ca);
		var_8aa6bded = -1;
		closest_target = undefined;
		for(i = 0; i < var_674755ca.size; i++)
		{
			if(var_674755ca[i] != -1)
			{
				if(!isdefined(closest_target) || var_8aa6bded > var_674755ca[i])
				{
					closest_target = var_448ee423[i].player;
					var_8aa6bded = var_674755ca[i];
				}
			}
		}
		if(!isdefined(closest_target))
		{
			return undefined;
		}
		for(i = 0; i < var_674755ca.size; i++)
		{
			potential_target = var_448ee423[i].player;
			if(isdefined(self.var_448aebc7[potential_target getentitynumber()]))
			{
				var_ab0d150d = self.var_448aebc7[potential_target getentitynumber()];
				var_e3958ef0[i] = var_e3958ef0[i] - (sqr(var_ab0d150d * 2));
			}
		}
		var_abdf4916 = 0;
		var_9b606bab = undefined;
		for(i = 0; i < var_448ee423.size; i++)
		{
			if(var_674755ca[i] == -1)
			{
				continue;
			}
			if(var_e3958ef0[i] < var_abdf4916 || !isdefined(var_9b606bab))
			{
				var_abdf4916 = var_e3958ef0[i];
				var_9b606bab = var_448ee423[i].player;
			}
		}
		if(isdefined(self.var_8a3828c6))
		{
			var_abdf4916 = 0;
			var_9b606bab = self.var_8a3828c6;
		}
		if(!is_true(self.var_982e6932))
		{
			if(closest_target == var_9b606bab)
			{
				self.var_982e6932 = 1;
				self.var_927ef4c0 = gettime() + 3000;
				self.var_448aebc7 = undefined;
				self.var_29a3768c = undefined;
			}
			self.last_closest_player = var_9b606bab;
			self.var_c6e0686b = var_abdf4916;
		}
		else
		{
			if(gettime() > self.var_927ef4c0)
			{
				self.var_982e6932 = 0;
			}
			self.last_closest_player = closest_target;
			self.var_c6e0686b = var_8aa6bded;
		}
	}
	/#
		self.var_26f25576 = gettime();
	#/
	/#
		if(getdvar(#"hash_169a29e17dd1b916", 0) > 0)
		{
			var_edbf2d06 = "";
			for(i = 0; i < var_448ee423.size; i++)
			{
				target = var_448ee423[i].player;
				score = var_e3958ef0[i];
				if(isdefined(target) && isdefined(var_9b606bab))
				{
					color = (var_9b606bab == target ? "" : "");
					if(isdefined(self.var_29a3768c[target getentitynumber()]))
					{
						var_f24e54b = "" + self.var_29a3768c[target getentitynumber()];
					}
					var_edbf2d06 = ((color + "") + target getentitynumber() + "") + score;
				}
				else
				{
					var_edbf2d06 = "";
				}
				record3dtext(var_edbf2d06, self.origin + (0, 0, 80 - (30 * i)), (1, 1, 1), "", self, 0.5);
				if(isdefined(var_674755ca[i]))
				{
					record3dtext("" + var_674755ca[i], self.origin + (0, 0, 75 - (30 * i)), (1, 1, 1), "", self, 0.5);
				}
			}
			if(isdefined(self.var_c2dcab66))
			{
				var_edbf2d06 = "";
				foreach(attacker in self.var_c2dcab66)
				{
					var_76fc2ac9 = (gettime() - attacker.time) * 0.001;
					if(isdefined(attacker.player) && isdefined(self.var_448aebc7[attacker.player getentitynumber()]))
					{
						var_edbf2d06 = var_edbf2d06 + (((((("" + attacker.player getentitynumber()) + "") + self.var_448aebc7[attacker.player getentitynumber()]) + "") + var_76fc2ac9) + "");
					}
				}
				record3dtext(var_edbf2d06, self.origin + (vectorscale((0, 0, -1), 20)), (1, 1, 1), "", self, 0.5);
			}
			if(is_true(self.var_982e6932))
			{
				record3dtext("", self.origin + (vectorscale((0, 0, -1), 25)), (0, 1, 0), "", self, 0.5);
			}
		}
	#/
	self function_5dcc54a8(players);
	return self.last_closest_player;
}

/*
	Name: get_closest_valid_player
	Namespace: zm_utility
	Checksum: 0xB8A4A026
	Offset: 0x5C10
	Size: 0x5A0
	Parameters: 3
	Flags: Linked
*/
function get_closest_valid_player(origin, ignore_player, var_b106b254)
{
	if(!isdefined(ignore_player))
	{
		ignore_player = array();
	}
	if(!isdefined(var_b106b254))
	{
		var_b106b254 = 0;
	}
	aiprofile_beginentry("get_closest_valid_player");
	players = getplayers();
	if(isdefined(level.zombie_targets) && level.zombie_targets.size > 0)
	{
		function_1eaaceab(level.zombie_targets);
		arrayremovevalue(level.zombie_targets, undefined);
		players = arraycombine(players, level.zombie_targets, 0, 0);
	}
	b_designated_target_exists = 0;
	foreach(player in players)
	{
		if(!is_true(player.am_i_valid))
		{
			continue;
		}
		if(isdefined(level.evaluate_zone_path_override))
		{
			if(![[level.evaluate_zone_path_override]](player))
			{
				array::add(ignore_player, player);
			}
		}
		if(is_true(player.b_is_designated_target))
		{
			b_designated_target_exists = 1;
		}
		if(isdefined(level.var_6f6cc58))
		{
			if(![[level.var_6f6cc58]](player))
			{
				array::add(ignore_player, player);
			}
		}
	}
	if(isdefined(ignore_player))
	{
		foreach(ignored_player in ignore_player)
		{
			arrayremovevalue(players, ignored_player);
		}
	}
	done = 0;
	while(players.size && !done)
	{
		done = 1;
		for(i = 0; i < players.size; i++)
		{
			player = players[i];
			if(!is_true(player.am_i_valid))
			{
				arrayremovevalue(players, player);
				done = 0;
				break;
			}
			if(b_designated_target_exists && !is_true(player.b_is_designated_target))
			{
				arrayremovevalue(players, player);
				done = 0;
				break;
			}
		}
	}
	if(players.size == 0)
	{
		aiprofile_endentry();
		return undefined;
	}
	if(!var_b106b254 && isdefined(self.closest_player_override))
	{
		player = [[self.closest_player_override]](origin, players);
	}
	else
	{
		if(!var_b106b254 && isdefined(level.closest_player_override))
		{
			player = [[level.closest_player_override]](origin, players);
		}
		else
		{
			player = arraygetclosest(origin, players);
		}
	}
	if(!isdefined(player))
	{
		aiprofile_endentry();
		return undefined;
	}
	if(!isdefined(player.last_valid_position) || (!is_true(level.var_9f01688e) && !is_true(player.cached_zone_volume.var_8e4005b6)) || !isdefined(player getgroundent()) || distancesquared(player.last_valid_position, player.origin) < 2048)
	{
		if(isdefined(self.var_81e5ae7) && is_true([[self.var_81e5ae7]](player)))
		{
			zm_ai_utility::function_68ab868a(self);
		}
		else
		{
			zm_ai_utility::function_4d22f6d1(self);
		}
	}
	else
	{
		zm_ai_utility::function_68ab868a(self);
	}
	aiprofile_endentry();
	return player;
}

/*
	Name: update_valid_players
	Namespace: zm_utility
	Checksum: 0xA32CE72C
	Offset: 0x61B8
	Size: 0x354
	Parameters: 2
	Flags: Linked
*/
function update_valid_players(origin, ignore_player)
{
	aiprofile_beginentry("update_valid_players");
	players = arraycopy(level.players);
	foreach(player in players)
	{
		self setignoreent(player, 1);
	}
	b_designated_target_exists = 0;
	for(i = 0; i < players.size; i++)
	{
		player = players[i];
		if(!is_true(player.am_i_valid))
		{
			continue;
		}
		if(isdefined(level.evaluate_zone_path_override))
		{
			if(![[level.evaluate_zone_path_override]](player))
			{
				array::add(ignore_player, player);
			}
		}
		if(is_true(player.b_is_designated_target))
		{
			b_designated_target_exists = 1;
		}
	}
	if(isdefined(ignore_player))
	{
		for(i = 0; i < ignore_player.size; i++)
		{
			arrayremovevalue(players, ignore_player[i]);
		}
	}
	done = 0;
	while(players.size && !done)
	{
		done = 1;
		for(i = 0; i < players.size; i++)
		{
			player = players[i];
			if(!is_true(player.am_i_valid))
			{
				arrayremovevalue(players, player);
				done = 0;
				break;
			}
			if(b_designated_target_exists && !is_true(player.b_is_designated_target))
			{
				arrayremovevalue(players, player);
				done = 0;
				break;
			}
		}
	}
	foreach(player in players)
	{
		self setignoreent(player, 0);
		self getperfectinfo(player);
	}
	aiprofile_endentry();
}

/*
	Name: is_player_valid
	Namespace: zm_utility
	Checksum: 0x4BD30376
	Offset: 0x6518
	Size: 0x204
	Parameters: 5
	Flags: Linked
*/
function is_player_valid(e_player, var_11e899f9, var_67fee570, var_6eefd462, var_da861165)
{
	if(!isdefined(var_11e899f9))
	{
		var_11e899f9 = 0;
	}
	if(!isdefined(var_67fee570))
	{
		var_67fee570 = 0;
	}
	if(!isdefined(var_6eefd462))
	{
		var_6eefd462 = 1;
	}
	if(!isdefined(var_da861165))
	{
		var_da861165 = 1;
	}
	if(!isdefined(e_player))
	{
		return 0;
	}
	if(!isentity(e_player))
	{
		return 0;
	}
	if(!isplayer(e_player))
	{
		return 0;
	}
	if(!isalive(e_player))
	{
		return 0;
	}
	if(is_true(e_player.is_zombie))
	{
		return 0;
	}
	if(e_player.sessionstate == "spectator" || e_player.sessionstate == "intermission")
	{
		return 0;
	}
	if(is_true(level.intermission))
	{
		return 0;
	}
	if(!var_67fee570)
	{
		if(e_player laststand::player_is_in_laststand())
		{
			return 0;
		}
	}
	if(var_11e899f9)
	{
		if(e_player.ignoreme || e_player isnotarget())
		{
			return 0;
		}
	}
	if(!var_6eefd462)
	{
		if(e_player isplayerunderwater())
		{
			return 0;
		}
	}
	if(!var_da861165 && e_player scene::is_igc_active())
	{
		return 0;
	}
	if(isdefined(level.is_player_valid_override))
	{
		return [[level.is_player_valid_override]](e_player);
	}
	return 1;
}

/*
	Name: get_number_of_valid_players
	Namespace: zm_utility
	Checksum: 0xCB78CA15
	Offset: 0x6728
	Size: 0x78
	Parameters: 0
	Flags: Linked
*/
function get_number_of_valid_players()
{
	players = getplayers();
	num_player_valid = 0;
	for(i = 0; i < players.size; i++)
	{
		if(is_player_valid(players[i]))
		{
			num_player_valid = num_player_valid + 1;
		}
	}
	return num_player_valid;
}

/*
	Name: in_revive_trigger
	Namespace: zm_utility
	Checksum: 0x682C5726
	Offset: 0x67A8
	Size: 0xEC
	Parameters: 0
	Flags: Linked
*/
function in_revive_trigger()
{
	if(isdefined(self.rt_time) && (self.rt_time + 100) >= gettime())
	{
		return self.in_rt_cached;
	}
	self.rt_time = gettime();
	players = level.players;
	for(i = 0; i < players.size; i++)
	{
		current_player = players[i];
		if(isdefined(current_player) && isdefined(current_player.revivetrigger) && isalive(current_player))
		{
			if(self istouching(current_player.revivetrigger))
			{
				self.in_rt_cached = 1;
				return 1;
			}
		}
	}
	self.in_rt_cached = 0;
	return 0;
}

/*
	Name: non_destroyed_bar_board_order
	Namespace: zm_utility
	Checksum: 0x5CC1784E
	Offset: 0x68A0
	Size: 0x45C
	Parameters: 2
	Flags: Linked
*/
function non_destroyed_bar_board_order(origin, chunks)
{
	first_bars = [];
	first_bars1 = [];
	first_bars2 = [];
	for(i = 0; i < chunks.size; i++)
	{
		if(isdefined(chunks[i].script_team) && chunks[i].script_team == "classic_boards")
		{
			if(isdefined(chunks[i].script_parameters) && chunks[i].script_parameters == "board")
			{
				return get_closest_2d(origin, chunks);
			}
			if(isdefined(chunks[i].script_team) && chunks[i].script_team == "bar_board_variant1" || chunks[i].script_team == "bar_board_variant2" || chunks[i].script_team == "bar_board_variant4" || chunks[i].script_team == "bar_board_variant5")
			{
				return undefined;
			}
			continue;
		}
		if(isdefined(chunks[i].script_team) && chunks[i].script_team == "new_barricade")
		{
			if(isdefined(chunks[i].script_parameters) && (chunks[i].script_parameters == "repair_board" || chunks[i].script_parameters == "barricade_vents"))
			{
				return get_closest_2d(origin, chunks);
			}
		}
	}
	for(i = 0; i < chunks.size; i++)
	{
		if(isdefined(chunks[i].script_team) && chunks[i].script_team == "6_bars_bent" || chunks[i].script_team == "6_bars_prestine")
		{
			if(isdefined(chunks[i].script_parameters) && chunks[i].script_parameters == "bar")
			{
				if(isdefined(chunks[i].script_noteworthy))
				{
					if(chunks[i].script_noteworthy == "4" || chunks[i].script_noteworthy == "6")
					{
						first_bars[first_bars.size] = chunks[i];
					}
				}
			}
		}
	}
	for(i = 0; i < first_bars.size; i++)
	{
		if(isdefined(chunks[i].script_team) && chunks[i].script_team == "6_bars_bent" || chunks[i].script_team == "6_bars_prestine")
		{
			if(isdefined(chunks[i].script_parameters) && chunks[i].script_parameters == "bar")
			{
				if(!first_bars[i].destroyed)
				{
					return first_bars[i];
				}
			}
		}
	}
	for(i = 0; i < chunks.size; i++)
	{
		if(isdefined(chunks[i].script_team) && chunks[i].script_team == "6_bars_bent" || chunks[i].script_team == "6_bars_prestine")
		{
			if(isdefined(chunks[i].script_parameters) && chunks[i].script_parameters == "bar")
			{
				if(!chunks[i].destroyed)
				{
					return get_closest_2d(origin, chunks);
				}
			}
		}
	}
}

/*
	Name: non_destroyed_grate_order
	Namespace: zm_utility
	Checksum: 0x60BB2437
	Offset: 0x6D08
	Size: 0x494
	Parameters: 2
	Flags: Linked
*/
function non_destroyed_grate_order(origin, chunks_grate)
{
	grate_order = [];
	grate_order1 = [];
	grate_order2 = [];
	grate_order3 = [];
	grate_order4 = [];
	grate_order5 = [];
	grate_order6 = [];
	if(isdefined(chunks_grate))
	{
		for(i = 0; i < chunks_grate.size; i++)
		{
			if(isdefined(chunks_grate[i].script_parameters) && chunks_grate[i].script_parameters == "grate")
			{
				if(isdefined(chunks_grate[i].script_noteworthy) && chunks_grate[i].script_noteworthy == "1")
				{
					grate_order1[grate_order1.size] = chunks_grate[i];
				}
				if(isdefined(chunks_grate[i].script_noteworthy) && chunks_grate[i].script_noteworthy == "2")
				{
					grate_order2[grate_order2.size] = chunks_grate[i];
				}
				if(isdefined(chunks_grate[i].script_noteworthy) && chunks_grate[i].script_noteworthy == "3")
				{
					grate_order3[grate_order3.size] = chunks_grate[i];
				}
				if(isdefined(chunks_grate[i].script_noteworthy) && chunks_grate[i].script_noteworthy == "4")
				{
					grate_order4[grate_order4.size] = chunks_grate[i];
				}
				if(isdefined(chunks_grate[i].script_noteworthy) && chunks_grate[i].script_noteworthy == "5")
				{
					grate_order5[grate_order5.size] = chunks_grate[i];
				}
				if(isdefined(chunks_grate[i].script_noteworthy) && chunks_grate[i].script_noteworthy == "6")
				{
					grate_order6[grate_order6.size] = chunks_grate[i];
				}
			}
		}
		for(i = 0; i < chunks_grate.size; i++)
		{
			if(isdefined(chunks_grate[i].script_parameters) && chunks_grate[i].script_parameters == "grate")
			{
				if(isdefined(grate_order1[i]))
				{
					if(grate_order1[i].state == "repaired")
					{
						grate_order2[i] thread show_grate_pull();
						return grate_order1[i];
					}
					if(grate_order2[i].state == "repaired")
					{
						/#
							iprintlnbold("");
						#/
						grate_order3[i] thread show_grate_pull();
						return grate_order2[i];
					}
					if(grate_order3[i].state == "repaired")
					{
						/#
							iprintlnbold("");
						#/
						grate_order4[i] thread show_grate_pull();
						return grate_order3[i];
					}
					if(grate_order4[i].state == "repaired")
					{
						/#
							iprintlnbold("");
						#/
						grate_order5[i] thread show_grate_pull();
						return grate_order4[i];
					}
					if(grate_order5[i].state == "repaired")
					{
						/#
							iprintlnbold("");
						#/
						grate_order6[i] thread show_grate_pull();
						return grate_order5[i];
					}
					if(grate_order6[i].state == "repaired")
					{
						return grate_order6[i];
					}
				}
			}
		}
	}
}

/*
	Name: show_grate_pull
	Namespace: zm_utility
	Checksum: 0xE4DA74ED
	Offset: 0x71A8
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function show_grate_pull()
{
	wait(0.53);
	self show();
	self vibrate(vectorscale((0, 1, 0), 270), 0.2, 0.4, 0.4);
}

/*
	Name: get_closest_2d
	Namespace: zm_utility
	Checksum: 0xE7B3DBFE
	Offset: 0x7210
	Size: 0x1C4
	Parameters: 2
	Flags: Linked
*/
function get_closest_2d(origin, ents)
{
	if(!isdefined(ents))
	{
		return undefined;
	}
	dist = distance2d(origin, ents[0].origin);
	index = 0;
	temp_array = [];
	for(i = 1; i < ents.size; i++)
	{
		if(isdefined(ents[i].unbroken) && ents[i].unbroken == 1)
		{
			ents[i].index = i;
			if(!isdefined(temp_array))
			{
				temp_array = [];
			}
			else if(!isarray(temp_array))
			{
				temp_array = array(temp_array);
			}
			temp_array[temp_array.size] = ents[i];
		}
	}
	if(temp_array.size > 0)
	{
		index = temp_array[randomintrange(0, temp_array.size)].index;
		return ents[index];
	}
	for(i = 1; i < ents.size; i++)
	{
		temp_dist = distance2d(origin, ents[i].origin);
		if(temp_dist < dist)
		{
			dist = temp_dist;
			index = i;
		}
	}
	return ents[index];
}

/*
	Name: in_playable_area
	Namespace: zm_utility
	Checksum: 0x1C21D2C8
	Offset: 0x73E0
	Size: 0x206
	Parameters: 0
	Flags: Linked
*/
function in_playable_area()
{
	if(function_21f4ac36() && !isdefined(level.var_a2a9b2de))
	{
		level.var_a2a9b2de = getnodearray("player_region", "script_noteworthy");
	}
	if(function_c85ebbbc() && !isdefined(level.playable_area))
	{
		level.playable_area = getentarray("player_volume", "script_noteworthy");
	}
	if(!isdefined(level.playable_area) && !isdefined(level.var_a2a9b2de))
	{
		/#
			println("");
		#/
		return true;
	}
	if(isdefined(level.playable_area))
	{
		var_12ed21a1 = function_72d3bca6(level.playable_area, self.origin, undefined, undefined, level.var_603981f1);
		foreach(area in var_12ed21a1)
		{
			if(self istouching(area))
			{
				return true;
			}
		}
	}
	if(isdefined(level.var_a2a9b2de))
	{
		node = function_52c1730(self.origin, level.var_a2a9b2de, 500);
		if(isdefined(node))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: get_closest_non_destroyed_chunk
	Namespace: zm_utility
	Checksum: 0xD5300ACE
	Offset: 0x75F0
	Size: 0x10E
	Parameters: 3
	Flags: Linked
*/
function get_closest_non_destroyed_chunk(origin, barrier, barrier_chunks)
{
	chunks = undefined;
	chunks_grate = undefined;
	chunks_grate = get_non_destroyed_chunks_grate(barrier, barrier_chunks);
	chunks = get_non_destroyed_chunks(barrier, barrier_chunks);
	if(isdefined(barrier.zbarrier))
	{
		if(isdefined(chunks))
		{
			return array::randomize(chunks)[0];
		}
		if(isdefined(chunks_grate))
		{
			return array::randomize(chunks_grate)[0];
		}
	}
	else
	{
		if(isdefined(chunks))
		{
			return non_destroyed_bar_board_order(origin, chunks);
		}
		if(isdefined(chunks_grate))
		{
			return non_destroyed_grate_order(origin, chunks_grate);
		}
	}
	return undefined;
}

/*
	Name: get_random_destroyed_chunk
	Namespace: zm_utility
	Checksum: 0x13155696
	Offset: 0x7708
	Size: 0x116
	Parameters: 2
	Flags: Linked
*/
function get_random_destroyed_chunk(barrier, barrier_chunks)
{
	if(isdefined(barrier.zbarrier))
	{
		ret = undefined;
		pieces = barrier.zbarrier getzbarrierpieceindicesinstate("open");
		if(pieces.size)
		{
			ret = array::randomize(pieces)[0];
		}
		return ret;
	}
	chunks_repair_grate = undefined;
	chunks = get_destroyed_chunks(barrier_chunks);
	chunks_repair_grate = get_destroyed_repair_grates(barrier_chunks);
	if(isdefined(chunks))
	{
		return chunks[randomint(chunks.size)];
	}
	if(isdefined(chunks_repair_grate))
	{
		return grate_order_destroyed(chunks_repair_grate);
	}
	return undefined;
}

/*
	Name: get_destroyed_repair_grates
	Namespace: zm_utility
	Checksum: 0xA59CB2A8
	Offset: 0x7828
	Size: 0x9E
	Parameters: 1
	Flags: Linked
*/
function get_destroyed_repair_grates(barrier_chunks)
{
	array = [];
	for(i = 0; i < barrier_chunks.size; i++)
	{
		if(isdefined(barrier_chunks[i]))
		{
			if(isdefined(barrier_chunks[i].script_parameters) && barrier_chunks[i].script_parameters == "grate")
			{
				array[array.size] = barrier_chunks[i];
			}
		}
	}
	if(array.size == 0)
	{
		return undefined;
	}
	return array;
}

/*
	Name: get_non_destroyed_chunks
	Namespace: zm_utility
	Checksum: 0x8FCB4172
	Offset: 0x78D0
	Size: 0x388
	Parameters: 2
	Flags: Linked
*/
function get_non_destroyed_chunks(barrier, barrier_chunks)
{
	if(isdefined(barrier.zbarrier))
	{
		return barrier.zbarrier getzbarrierpieceindicesinstate("closed");
	}
	array = [];
	for(i = 0; i < barrier_chunks.size; i++)
	{
		if(isdefined(barrier_chunks[i].script_team) && barrier_chunks[i].script_team == "classic_boards")
		{
			if(isdefined(barrier_chunks[i].script_parameters) && barrier_chunks[i].script_parameters == "board")
			{
				if(barrier_chunks[i] get_chunk_state() == "repaired")
				{
					if(barrier_chunks[i].origin == barrier_chunks[i].og_origin)
					{
						array[array.size] = barrier_chunks[i];
					}
				}
			}
		}
		if(isdefined(barrier_chunks[i].script_team) && barrier_chunks[i].script_team == "new_barricade")
		{
			if(isdefined(barrier_chunks[i].script_parameters) && (barrier_chunks[i].script_parameters == "repair_board" || barrier_chunks[i].script_parameters == "barricade_vents"))
			{
				if(barrier_chunks[i] get_chunk_state() == "repaired")
				{
					if(barrier_chunks[i].origin == barrier_chunks[i].og_origin)
					{
						array[array.size] = barrier_chunks[i];
					}
				}
			}
			continue;
		}
		if(isdefined(barrier_chunks[i].script_team) && barrier_chunks[i].script_team == "6_bars_bent")
		{
			if(isdefined(barrier_chunks[i].script_parameters) && barrier_chunks[i].script_parameters == "bar")
			{
				if(barrier_chunks[i] get_chunk_state() == "repaired")
				{
					if(barrier_chunks[i].origin == barrier_chunks[i].og_origin)
					{
						array[array.size] = barrier_chunks[i];
					}
				}
			}
			continue;
		}
		if(isdefined(barrier_chunks[i].script_team) && barrier_chunks[i].script_team == "6_bars_prestine")
		{
			if(isdefined(barrier_chunks[i].script_parameters) && barrier_chunks[i].script_parameters == "bar")
			{
				if(barrier_chunks[i] get_chunk_state() == "repaired")
				{
					if(barrier_chunks[i].origin == barrier_chunks[i].og_origin)
					{
						array[array.size] = barrier_chunks[i];
					}
				}
			}
		}
	}
	if(array.size == 0)
	{
		return undefined;
	}
	return array;
}

/*
	Name: get_non_destroyed_chunks_grate
	Namespace: zm_utility
	Checksum: 0x4E4F197E
	Offset: 0x7C68
	Size: 0xDA
	Parameters: 2
	Flags: Linked
*/
function get_non_destroyed_chunks_grate(barrier, barrier_chunks)
{
	if(isdefined(barrier.zbarrier))
	{
		return barrier.zbarrier getzbarrierpieceindicesinstate("closed");
	}
	array = [];
	for(i = 0; i < barrier_chunks.size; i++)
	{
		if(isdefined(barrier_chunks[i].script_parameters) && barrier_chunks[i].script_parameters == "grate")
		{
			if(isdefined(barrier_chunks[i]))
			{
				array[array.size] = barrier_chunks[i];
			}
		}
	}
	if(array.size == 0)
	{
		return undefined;
	}
	return array;
}

/*
	Name: get_destroyed_chunks
	Namespace: zm_utility
	Checksum: 0x21C2DF4A
	Offset: 0x7D50
	Size: 0x1A0
	Parameters: 1
	Flags: Linked
*/
function get_destroyed_chunks(barrier_chunks)
{
	array = [];
	for(i = 0; i < barrier_chunks.size; i++)
	{
		if(barrier_chunks[i] get_chunk_state() == "destroyed")
		{
			if(isdefined(barrier_chunks[i].script_parameters) && barrier_chunks[i].script_parameters == "board")
			{
				array[array.size] = barrier_chunks[i];
				continue;
			}
			if(isdefined(barrier_chunks[i].script_parameters) && barrier_chunks[i].script_parameters == "repair_board" || barrier_chunks[i].script_parameters == "barricade_vents")
			{
				array[array.size] = barrier_chunks[i];
				continue;
			}
			if(isdefined(barrier_chunks[i].script_parameters) && barrier_chunks[i].script_parameters == "bar")
			{
				array[array.size] = barrier_chunks[i];
				continue;
			}
			if(isdefined(barrier_chunks[i].script_parameters) && barrier_chunks[i].script_parameters == "grate")
			{
				return undefined;
			}
		}
	}
	if(array.size == 0)
	{
		return undefined;
	}
	return array;
}

/*
	Name: grate_order_destroyed
	Namespace: zm_utility
	Checksum: 0x4ADBCCC1
	Offset: 0x7EF8
	Size: 0x4C4
	Parameters: 1
	Flags: Linked
*/
function grate_order_destroyed(chunks_repair_grate)
{
	grate_repair_order = [];
	grate_repair_order1 = [];
	grate_repair_order2 = [];
	grate_repair_order3 = [];
	grate_repair_order4 = [];
	grate_repair_order5 = [];
	grate_repair_order6 = [];
	for(i = 0; i < chunks_repair_grate.size; i++)
	{
		if(isdefined(chunks_repair_grate[i].script_parameters) && chunks_repair_grate[i].script_parameters == "grate")
		{
			if(isdefined(chunks_repair_grate[i].script_noteworthy) && chunks_repair_grate[i].script_noteworthy == "1")
			{
				grate_repair_order1[grate_repair_order1.size] = chunks_repair_grate[i];
			}
			if(isdefined(chunks_repair_grate[i].script_noteworthy) && chunks_repair_grate[i].script_noteworthy == "2")
			{
				grate_repair_order2[grate_repair_order2.size] = chunks_repair_grate[i];
			}
			if(isdefined(chunks_repair_grate[i].script_noteworthy) && chunks_repair_grate[i].script_noteworthy == "3")
			{
				grate_repair_order3[grate_repair_order3.size] = chunks_repair_grate[i];
			}
			if(isdefined(chunks_repair_grate[i].script_noteworthy) && chunks_repair_grate[i].script_noteworthy == "4")
			{
				grate_repair_order4[grate_repair_order4.size] = chunks_repair_grate[i];
			}
			if(isdefined(chunks_repair_grate[i].script_noteworthy) && chunks_repair_grate[i].script_noteworthy == "5")
			{
				grate_repair_order5[grate_repair_order5.size] = chunks_repair_grate[i];
			}
			if(isdefined(chunks_repair_grate[i].script_noteworthy) && chunks_repair_grate[i].script_noteworthy == "6")
			{
				grate_repair_order6[grate_repair_order6.size] = chunks_repair_grate[i];
			}
		}
	}
	for(i = 0; i < chunks_repair_grate.size; i++)
	{
		if(isdefined(chunks_repair_grate[i].script_parameters) && chunks_repair_grate[i].script_parameters == "grate")
		{
			if(isdefined(grate_repair_order1[i]))
			{
				if(grate_repair_order6[i].state == "destroyed")
				{
					/#
						iprintlnbold("");
					#/
					return grate_repair_order6[i];
				}
				if(grate_repair_order5[i].state == "destroyed")
				{
					/#
						iprintlnbold("");
					#/
					grate_repair_order6[i] thread show_grate_repair();
					return grate_repair_order5[i];
				}
				if(grate_repair_order4[i].state == "destroyed")
				{
					/#
						iprintlnbold("");
					#/
					grate_repair_order5[i] thread show_grate_repair();
					return grate_repair_order4[i];
				}
				if(grate_repair_order3[i].state == "destroyed")
				{
					/#
						iprintlnbold("");
					#/
					grate_repair_order4[i] thread show_grate_repair();
					return grate_repair_order3[i];
				}
				if(grate_repair_order2[i].state == "destroyed")
				{
					/#
						iprintlnbold("");
					#/
					grate_repair_order3[i] thread show_grate_repair();
					return grate_repair_order2[i];
				}
				if(grate_repair_order1[i].state == "destroyed")
				{
					/#
						iprintlnbold("");
					#/
					grate_repair_order2[i] thread show_grate_repair();
					return grate_repair_order1[i];
				}
			}
		}
	}
}

/*
	Name: show_grate_repair
	Namespace: zm_utility
	Checksum: 0x22FB1186
	Offset: 0x83C8
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function show_grate_repair()
{
	wait(0.34);
	self hide();
}

/*
	Name: get_chunk_state
	Namespace: zm_utility
	Checksum: 0xFCD24148
	Offset: 0x83F8
	Size: 0x2A
	Parameters: 0
	Flags: Linked
*/
function get_chunk_state()
{
	/#
		assert(isdefined(self.state));
	#/
	return self.state;
}

/*
	Name: fake_physicslaunch
	Namespace: zm_utility
	Checksum: 0xFEC1E067
	Offset: 0x8430
	Size: 0x138
	Parameters: 2
	Flags: Linked
*/
function fake_physicslaunch(target_pos, power)
{
	start_pos = self.origin;
	gravity = getdvarint(#"bg_gravity", 0) * -1;
	dist = distance(start_pos, target_pos);
	time = dist / power;
	delta = target_pos - start_pos;
	drop = (0.5 * gravity) * (time * time);
	velocity = (delta[0] / time, delta[1] / time, (delta[2] - drop) / time);
	/#
		level thread draw_line_ent_to_pos(self, target_pos);
	#/
	self movegravity(velocity, time);
	return time;
}

/*
	Name: add_zombie_hint
	Namespace: zm_utility
	Checksum: 0xBE843491
	Offset: 0x8570
	Size: 0x40
	Parameters: 2
	Flags: Linked
*/
function add_zombie_hint(ref, text)
{
	if(!isdefined(level.zombie_hints))
	{
		level.zombie_hints = [];
	}
	level.zombie_hints[ref] = text;
}

/*
	Name: get_zombie_hint
	Namespace: zm_utility
	Checksum: 0xE63D6F08
	Offset: 0x85B8
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function get_zombie_hint(ref)
{
	if(isdefined(level.zombie_hints[ref]))
	{
		return level.zombie_hints[ref];
	}
	/#
		println("" + ref);
	#/
	return level.zombie_hints[#"undefined"];
}

/*
	Name: set_hint_string
	Namespace: zm_utility
	Checksum: 0x50A617BF
	Offset: 0x8630
	Size: 0xA4
	Parameters: 3
	Flags: Linked
*/
function set_hint_string(ent, default_ref, cost)
{
	ref = default_ref;
	if(isdefined(ent.script_hint))
	{
		ref = ent.script_hint;
	}
	hint = get_zombie_hint(ref);
	if(isdefined(cost))
	{
		self sethintstring(hint, cost);
	}
	else
	{
		self sethintstring(hint);
	}
}

/*
	Name: get_hint_string
	Namespace: zm_utility
	Checksum: 0x4DED7F6A
	Offset: 0x86E0
	Size: 0x5A
	Parameters: 3
	Flags: Linked
*/
function get_hint_string(ent, default_ref, cost)
{
	ref = cost;
	if(isdefined(default_ref.script_hint))
	{
		ref = default_ref.script_hint;
	}
	return get_zombie_hint(ref);
}

/*
	Name: add_sound
	Namespace: zm_utility
	Checksum: 0x96E04492
	Offset: 0x8748
	Size: 0x40
	Parameters: 2
	Flags: Linked
*/
function add_sound(ref, alias)
{
	if(!isdefined(level.zombie_sounds))
	{
		level.zombie_sounds = [];
	}
	level.zombie_sounds[ref] = alias;
}

/*
	Name: play_sound_at_pos
	Namespace: zm_utility
	Checksum: 0x366356D9
	Offset: 0x8790
	Size: 0xEC
	Parameters: 3
	Flags: Linked
*/
function play_sound_at_pos(ref, pos, ent)
{
	if(isdefined(ent))
	{
		if(isdefined(ent.script_soundalias))
		{
			playsoundatposition(ent.script_soundalias, pos);
			return;
		}
		if(isdefined(self.script_sound))
		{
			ref = self.script_sound;
		}
	}
	if(ref == "none")
	{
		return;
	}
	if(!isdefined(level.zombie_sounds[ref]))
	{
		/#
			assertmsg(("" + ref) + "");
		#/
		return;
	}
	playsoundatposition(level.zombie_sounds[ref], pos);
}

/*
	Name: play_sound_on_ent
	Namespace: zm_utility
	Checksum: 0xD836DEB1
	Offset: 0x8888
	Size: 0xC4
	Parameters: 1
	Flags: Linked
*/
function play_sound_on_ent(ref)
{
	if(isdefined(self.script_soundalias))
	{
		self playsound(self.script_soundalias);
		return;
	}
	if(isdefined(self.script_sound))
	{
		ref = self.script_sound;
	}
	if(ref == "none")
	{
		return;
	}
	if(!isdefined(level.zombie_sounds[ref]))
	{
		/#
			assertmsg(("" + ref) + "");
		#/
		return;
	}
	self playsound(level.zombie_sounds[ref]);
}

/*
	Name: play_loopsound_on_ent
	Namespace: zm_utility
	Checksum: 0x7FD0A2E1
	Offset: 0x8958
	Size: 0x94
	Parameters: 1
	Flags: None
*/
function play_loopsound_on_ent(ref)
{
	if(isdefined(self.script_firefxsound))
	{
		ref = self.script_firefxsound;
	}
	if(ref == "none")
	{
		return;
	}
	if(!isdefined(level.zombie_sounds[ref]))
	{
		/#
			assertmsg(("" + ref) + "");
		#/
		return;
	}
	self playsound(level.zombie_sounds[ref]);
}

/*
	Name: draw_line_ent_to_ent
	Namespace: zm_utility
	Checksum: 0x3DED71B
	Offset: 0x89F8
	Size: 0xA6
	Parameters: 2
	Flags: None
*/
function draw_line_ent_to_ent(ent1, ent2)
{
	/#
		if(getdvarint(#"zombie_debug", 0) != 1)
		{
			return;
		}
		ent1 endon(#"death");
		ent2 endon(#"death");
		while(true)
		{
			line(ent1.origin, ent2.origin);
			waitframe(1);
		}
	#/
}

/*
	Name: draw_line_ent_to_pos
	Namespace: zm_utility
	Checksum: 0x8F1EE623
	Offset: 0x8AA8
	Size: 0xBE
	Parameters: 3
	Flags: None
*/
function draw_line_ent_to_pos(ent, pos, end_on)
{
	/#
		if(getdvarint(#"zombie_debug", 0) != 1)
		{
			return;
		}
		ent notify(#"stop_draw_line_ent_to_pos");
		ent endon(#"stop_draw_line_ent_to_pos", #"death");
		if(isdefined(end_on))
		{
			ent endon(end_on);
		}
		while(true)
		{
			line(ent.origin, pos);
			waitframe(1);
		}
	#/
}

/*
	Name: debug_print
	Namespace: zm_utility
	Checksum: 0x3CBE14FA
	Offset: 0x8B70
	Size: 0x5C
	Parameters: 1
	Flags: None
*/
function debug_print(msg)
{
	/#
		if(getdvarint(#"zombie_debug", 0) > 0)
		{
			println("" + msg);
		}
	#/
}

/*
	Name: debug_blocker
	Namespace: zm_utility
	Checksum: 0x9782660D
	Offset: 0x8BD8
	Size: 0x98
	Parameters: 3
	Flags: None
*/
function debug_blocker(pos, rad, height)
{
	/#
		self notify(#"stop_debug_blocker");
		self endon(#"stop_debug_blocker");
		for(;;)
		{
			if(getdvarint(#"zombie_debug", 0) != 1)
			{
				return;
			}
			waitframe(1);
			drawcylinder(pos, rad, height);
		}
	#/
}

/*
	Name: drawcylinder
	Namespace: zm_utility
	Checksum: 0x89AD05FB
	Offset: 0x8C78
	Size: 0x234
	Parameters: 3
	Flags: None
*/
function drawcylinder(pos, rad, height)
{
	/#
		currad = rad;
		curheight = height;
		for(r = 0; r < 20; r++)
		{
			theta = (r / 20) * 360;
			theta2 = ((r + 1) / 20) * 360;
			line(pos + (cos(theta) * currad, sin(theta) * currad, 0), pos + (cos(theta2) * currad, sin(theta2) * currad, 0));
			line(pos + (cos(theta) * currad, sin(theta) * currad, curheight), pos + (cos(theta2) * currad, sin(theta2) * currad, curheight));
			line(pos + (cos(theta) * currad, sin(theta) * currad, 0), pos + (cos(theta) * currad, sin(theta) * currad, curheight));
		}
	#/
}

/*
	Name: debug_attack_spots_taken
	Namespace: zm_utility
	Checksum: 0x3F2E3C11
	Offset: 0x8EB8
	Size: 0x170
	Parameters: 0
	Flags: None
*/
function debug_attack_spots_taken()
{
	/#
		self notify(#"stop_debug_breadcrumbs");
		self endon(#"stop_debug_breadcrumbs");
		while(true)
		{
			if(getdvarint(#"zombie_debug", 0) != 2)
			{
				wait(1);
				continue;
			}
			waitframe(1);
			count = 0;
			for(i = 0; i < self.attack_spots_taken.size; i++)
			{
				if(self.attack_spots_taken[i])
				{
					count++;
					circle(self.attack_spots[i], 12, (1, 0, 0), 0, 1, 1);
					continue;
				}
				circle(self.attack_spots[i], 12, (0, 1, 0), 0, 1, 1);
			}
			msg = (("" + count) + "") + self.attack_spots_taken.size;
			print3d(self.origin, msg);
		}
	#/
}

/*
	Name: float_print3d
	Namespace: zm_utility
	Checksum: 0x24C8640F
	Offset: 0x9030
	Size: 0xA6
	Parameters: 2
	Flags: None
*/
function float_print3d(msg, time)
{
	/#
		self endon(#"death");
		time = gettime() + (time * 1000);
		offset = vectorscale((0, 0, 1), 72);
		while(gettime() < time)
		{
			offset = offset + vectorscale((0, 0, 1), 2);
			print3d(self.origin + offset, msg, (1, 1, 1));
			waitframe(1);
		}
	#/
}

/*
	Name: do_player_vo
	Namespace: zm_utility
	Checksum: 0x6308E05
	Offset: 0x90E0
	Size: 0x114
	Parameters: 2
	Flags: Linked
*/
function do_player_vo(snd, variation_count)
{
	index = get_player_index(self);
	sound = (("zmb_vox_plr_" + index) + "_") + snd;
	if(isdefined(variation_count))
	{
		sound = (sound + "_") + randomintrange(0, variation_count);
	}
	if(!isdefined(level.player_is_speaking))
	{
		level.player_is_speaking = 0;
	}
	if(level.player_is_speaking == 0)
	{
		level.player_is_speaking = 1;
		self playsoundwithnotify(sound, "sound_done");
		self waittill(#"sound_done");
		wait(2);
		level.player_is_speaking = 0;
	}
}

/*
	Name: is_magic_bullet_shield_enabled
	Namespace: zm_utility
	Checksum: 0xD40665BE
	Offset: 0x9200
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function is_magic_bullet_shield_enabled(ent)
{
	if(!isdefined(ent))
	{
		return 0;
	}
	return !is_true(ent.allowdeath);
}

/*
	Name: play_sound_2d
	Namespace: zm_utility
	Checksum: 0x370C9812
	Offset: 0x9240
	Size: 0x8C
	Parameters: 1
	Flags: None
*/
function play_sound_2d(sound)
{
	temp_ent = spawn("script_origin", (0, 0, 0));
	temp_ent playsoundwithnotify(sound, sound + "wait");
	temp_ent waittill(sound + "wait");
	waitframe(1);
	temp_ent delete();
}

/*
	Name: include_weapon
	Namespace: zm_utility
	Checksum: 0x8E4866D7
	Offset: 0x92D8
	Size: 0x6C
	Parameters: 2
	Flags: Linked
*/
function include_weapon(weapon_name, in_box)
{
	/#
		println("" + function_9e72a96(weapon_name));
	#/
	if(!isdefined(in_box))
	{
		in_box = 1;
	}
	zm_weapons::include_zombie_weapon(weapon_name, in_box);
}

/*
	Name: print3d_ent
	Namespace: zm_utility
	Checksum: 0x91471F69
	Offset: 0x9350
	Size: 0x146
	Parameters: 6
	Flags: None
*/
function print3d_ent(text, color, scale, offset, end_msg, overwrite)
{
	self endon(#"death");
	if(isdefined(overwrite) && overwrite && isdefined(self._debug_print3d_msg))
	{
		self notify(#"end_print3d");
		waitframe(1);
	}
	self endon(#"end_print3d");
	if(!isdefined(color))
	{
		color = (1, 1, 1);
	}
	if(!isdefined(scale))
	{
		scale = 1;
	}
	if(!isdefined(offset))
	{
		offset = (0, 0, 0);
	}
	if(isdefined(end_msg))
	{
		self endon(end_msg);
	}
	self._debug_print3d_msg = text;
	/#
		while(!is_true(level.disable_print3d_ent))
		{
			print3d(self.origin + offset, self._debug_print3d_msg, color, scale);
			waitframe(1);
		}
	#/
}

/*
	Name: function_21f4ac36
	Namespace: zm_utility
	Checksum: 0xDB01ECC2
	Offset: 0x94A0
	Size: 0x30
	Parameters: 0
	Flags: Linked
*/
function function_21f4ac36()
{
	return getdvarint(#"hash_42c75b39576494a5", 1) == 1;
}

/*
	Name: function_c85ebbbc
	Namespace: zm_utility
	Checksum: 0x59CE7AC6
	Offset: 0x94D8
	Size: 0x30
	Parameters: 0
	Flags: Linked
*/
function function_c85ebbbc()
{
	return getdvarint(#"hash_6ec233a56690f409", 1) == 1;
}

/*
	Name: function_b0eeaada
	Namespace: zm_utility
	Checksum: 0x93B67AB2
	Offset: 0x9510
	Size: 0x3A
	Parameters: 2
	Flags: None
*/
function function_b0eeaada(location, max_drop_distance)
{
	if(!isdefined(max_drop_distance))
	{
		max_drop_distance = 500;
	}
	return function_9cc082d2(location, max_drop_distance);
}

/*
	Name: function_a1055d95
	Namespace: zm_utility
	Checksum: 0x793C85C4
	Offset: 0x9558
	Size: 0x46
	Parameters: 2
	Flags: None
*/
function function_a1055d95(location, node)
{
	return isdefined(location) && location[#"region"] === getnoderegion(node);
}

/*
	Name: get_current_zone
	Namespace: zm_utility
	Checksum: 0xA0EADB5B
	Offset: 0x95A8
	Size: 0x3E4
	Parameters: 2
	Flags: Linked
*/
function get_current_zone(return_zone, immediate)
{
	if(!isdefined(return_zone))
	{
		return_zone = 0;
	}
	if(!isdefined(immediate))
	{
		immediate = 1;
	}
	if(!isdefined(self))
	{
		return undefined;
	}
	self endon(#"death");
	level flag::wait_till("zones_initialized");
	if(function_c85ebbbc())
	{
		volumes = function_72d3bca6(level.zone_volumes, self.origin, undefined, undefined, level.var_603981f1);
		for(i = 0; i < volumes.size; i++)
		{
			if(self istouching(volumes[i]))
			{
				zone = level.zones[volumes[i].targetname];
				if(zone !== self.cached_zone)
				{
					self.cached_zone = zone;
					self.cached_zone_name = zone.name;
					self.var_3b65cdd7 = undefined;
					self notify(#"zone_change", {#zone_name:zone.name, #zone:zone});
				}
				self.cached_zone_volume = volumes[i];
				if(is_true(return_zone))
				{
					return zone;
				}
				return zone.name;
			}
		}
	}
	if(!immediate)
	{
		waitframe(1);
	}
	if(function_21f4ac36())
	{
		node = self.var_3b65cdd7;
		var_3e5dca65 = self.origin;
		if(isplayer(self))
		{
			if(isdefined(self.last_valid_position) && distancesquared(self.origin, self.last_valid_position) < sqr(32))
			{
				var_3e5dca65 = self.last_valid_position;
			}
		}
		self.var_3b65cdd7 = function_52c1730(var_3e5dca65, level.zone_nodes, 500);
		if(isdefined(self.var_3b65cdd7))
		{
			if(node !== self.var_3b65cdd7 || (isdefined(node) && node.targetname !== self.var_3b65cdd7.targetname))
			{
				self.cached_zone = level.zones[self.var_3b65cdd7.targetname];
				self.cached_zone_name = self.cached_zone.name;
				self notify(#"zone_change", {#zone_name:self.cached_zone_name, #zone:self.cached_zone});
			}
			self.cached_zone_volume = undefined;
			if(return_zone)
			{
				return level.zones[self.var_3b65cdd7.targetname];
			}
			return self.var_3b65cdd7.targetname;
		}
	}
	self.cached_zone = undefined;
	self.cached_zone_name = undefined;
	self.cached_zone_volume = undefined;
	self.var_3b65cdd7 = undefined;
	return undefined;
}

/*
	Name: update_zone_name
	Namespace: zm_utility
	Checksum: 0xE61136C5
	Offset: 0x9998
	Size: 0x78
	Parameters: 0
	Flags: Linked
*/
function update_zone_name()
{
	self notify("23e0d094e29478bf");
	self endon("23e0d094e29478bf");
	self endon(#"death");
	while(isdefined(self))
	{
		self.zone_name = get_current_zone(0, 0);
		wait(randomfloatrange(0.5, 1));
	}
}

/*
	Name: shock_onpain
	Namespace: zm_utility
	Checksum: 0xC1D25386
	Offset: 0x9A18
	Size: 0x300
	Parameters: 0
	Flags: Linked
*/
function shock_onpain()
{
	self notify(#"stop_shock_onpain");
	self endon(#"stop_shock_onpain", #"death");
	if(getdvarstring(#"blurpain") == "")
	{
		setdvar(#"blurpain", "on");
	}
	while(true)
	{
		oldhealth = self.health;
		waitresult = undefined;
		waitresult = self waittill(#"damage");
		mod = waitresult.mod;
		damage = waitresult.amount;
		attacker = waitresult.attacker;
		direction_vec = waitresult.direction;
		point = waitresult.position;
		if(isdefined(level.shock_onpain) && !level.shock_onpain)
		{
			continue;
		}
		if(isdefined(self.shock_onpain) && !self.shock_onpain)
		{
			continue;
		}
		if(self.health < 1)
		{
			continue;
		}
		if(isdefined(attacker) && isdefined(attacker.custom_player_shellshock))
		{
			self [[attacker.custom_player_shellshock]](damage, attacker, direction_vec, point, mod);
		}
		else
		{
			if(mod == "MOD_PROJECTILE" || mod == "MOD_PROJECTILE_SPLASH")
			{
				continue;
			}
			else
			{
				if(mod == "MOD_GRENADE_SPLASH" || mod == "MOD_GRENADE" || mod == "MOD_EXPLOSIVE")
				{
					shocktype = undefined;
					shocklight = undefined;
					if(is_true(self.is_burning))
					{
						shocktype = "lava";
						shocklight = "lava_small";
					}
					self shock_onexplosion(damage, shocktype, shocklight);
				}
				else if(getdvarstring(#"blurpain") == "on")
				{
					self shellshock(#"pain_zm", 0.5);
				}
			}
		}
	}
}

/*
	Name: shock_onexplosion
	Namespace: zm_utility
	Checksum: 0xE79FCCA4
	Offset: 0x9D20
	Size: 0x10C
	Parameters: 3
	Flags: Linked
*/
function shock_onexplosion(damage, shocktype, shocklight)
{
	time = 0;
	scaled_damage = (100 * damage) / self.maxhealth;
	if(scaled_damage >= 90)
	{
		time = 4;
	}
	else
	{
		if(scaled_damage >= 50)
		{
			time = 3;
		}
		else
		{
			if(scaled_damage >= 25)
			{
				time = 2;
			}
			else if(scaled_damage > 10)
			{
				time = 1;
			}
		}
	}
	if(time)
	{
		if(!isdefined(shocktype))
		{
			shocktype = "explosion_zm";
		}
		self shellshock(shocktype, time);
	}
	else if(isdefined(shocklight))
	{
		self shellshock(shocklight, time);
	}
}

/*
	Name: increment_is_drinking
	Namespace: zm_utility
	Checksum: 0xBB984993
	Offset: 0x9E38
	Size: 0xB0
	Parameters: 1
	Flags: Linked
*/
function increment_is_drinking(var_12d2689b)
{
	if(!isdefined(var_12d2689b))
	{
		var_12d2689b = 0;
	}
	/#
		if(is_true(level.devgui_dpad_watch))
		{
			self.is_drinking++;
			return;
		}
	#/
	if(!isdefined(self.is_drinking))
	{
		self.is_drinking = 0;
	}
	if(self.is_drinking == 0)
	{
		if(!var_12d2689b)
		{
			self disableoffhandweapons();
		}
		self disableweaponcycling();
	}
	self.is_drinking++;
}

/*
	Name: is_drinking
	Namespace: zm_utility
	Checksum: 0x14464564
	Offset: 0x9EF0
	Size: 0x4E
	Parameters: 0
	Flags: Linked
*/
function is_drinking()
{
	return isdefined(self.is_drinking) && self.is_drinking > 0 || (isplayer(self) && self function_55acff10());
}

/*
	Name: is_multiple_drinking
	Namespace: zm_utility
	Checksum: 0xD83456FD
	Offset: 0x9F48
	Size: 0x1E
	Parameters: 0
	Flags: Linked
*/
function is_multiple_drinking()
{
	return isdefined(self.is_drinking) && self.is_drinking > 1;
}

/*
	Name: decrement_is_drinking
	Namespace: zm_utility
	Checksum: 0x74D75C7A
	Offset: 0x9F70
	Size: 0x74
	Parameters: 0
	Flags: Linked
*/
function decrement_is_drinking()
{
	if(self.is_drinking > 0)
	{
		self.is_drinking--;
	}
	else
	{
		/#
			assertmsg("");
		#/
	}
	if(self.is_drinking == 0)
	{
		self enableoffhandweapons();
		self enableweaponcycling();
	}
}

/*
	Name: clear_is_drinking
	Namespace: zm_utility
	Checksum: 0x51C431D1
	Offset: 0x9FF0
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function clear_is_drinking()
{
	self.is_drinking = 0;
	self enableoffhandweapons();
	self enableweaponcycling();
}

/*
	Name: function_91403f47
	Namespace: zm_utility
	Checksum: 0xB8C44A74
	Offset: 0xA038
	Size: 0x2E
	Parameters: 0
	Flags: Linked
*/
function function_91403f47()
{
	if(!isdefined(level.var_1d72fbba))
	{
		level.var_1d72fbba = 0;
	}
	return level.var_1d72fbba > 0;
}

/*
	Name: function_3e549e65
	Namespace: zm_utility
	Checksum: 0x9A226F18
	Offset: 0xA070
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function function_3e549e65()
{
	if(!isdefined(level.var_1d72fbba))
	{
		level.var_1d72fbba = 0;
	}
	level.var_1d72fbba++;
}

/*
	Name: function_b7e5029f
	Namespace: zm_utility
	Checksum: 0x74436B33
	Offset: 0xA0A8
	Size: 0x74
	Parameters: 0
	Flags: None
*/
function function_b7e5029f()
{
	if(!isdefined(level.var_1d72fbba))
	{
		level.var_1d72fbba = 0;
	}
	if(level.var_1d72fbba > 0)
	{
		level.var_1d72fbba--;
	}
	else
	{
		/#
			assertmsg("");
		#/
	}
	level zm_player::function_8ef51109();
}

/*
	Name: can_use
	Namespace: zm_utility
	Checksum: 0x1582BAD5
	Offset: 0xA128
	Size: 0x178
	Parameters: 3
	Flags: Linked
*/
function can_use(e_player, b_is_weapon, var_67fee570)
{
	if(!isdefined(b_is_weapon))
	{
		b_is_weapon = 0;
	}
	if(!isdefined(var_67fee570))
	{
		var_67fee570 = 0;
	}
	if(!is_player_valid(e_player, 0, var_67fee570) || e_player in_revive_trigger() || e_player isthrowinggrenade() || e_player isswitchingweapons() || e_player is_drinking())
	{
		return false;
	}
	if(b_is_weapon)
	{
		w_current = e_player getcurrentweapon();
		if(!e_player zm_magicbox::can_buy_weapon(0) || e_player bgb::is_enabled(#"zm_bgb_disorderly_combat") || zm_loadout::is_placeable_mine(w_current) || zm_equipment::is_equipment(w_current) || ability_util::is_weapon_gadget(w_current))
		{
			return false;
		}
	}
	return true;
}

/*
	Name: getweaponclasszm
	Namespace: zm_utility
	Checksum: 0x9FE8EE39
	Offset: 0xA2A8
	Size: 0xFC
	Parameters: 1
	Flags: Linked
*/
function getweaponclasszm(weapon)
{
	/#
		assert(isdefined(weapon));
	#/
	if(!isdefined(weapon))
	{
		return undefined;
	}
	if(!isdefined(level.weaponclassarray))
	{
		level.weaponclassarray = [];
	}
	if(isdefined(level.weaponclassarray[weapon]))
	{
		return level.weaponclassarray[weapon];
	}
	baseweaponindex = getbaseweaponitemindex(weapon);
	weaponinfo = getunlockableiteminfofromindex(baseweaponindex, 1);
	if(isdefined(weaponinfo))
	{
		level.weaponclassarray[weapon] = weaponinfo.itemgroupname;
	}
	else
	{
		level.weaponclassarray[weapon] = "";
	}
	return level.weaponclassarray[weapon];
}

/*
	Name: spawn_weapon_model
	Namespace: zm_utility
	Checksum: 0x707799C6
	Offset: 0xA3B0
	Size: 0xD8
	Parameters: 6
	Flags: Linked
*/
function spawn_weapon_model(weapon, model, origin, angles, var_57fe74e5, var_fd90b0bb)
{
	if(!isdefined(model))
	{
		model = weapon.worldmodel;
	}
	weapon_model = spawn("script_model", origin);
	if(isdefined(angles))
	{
		weapon_model.angles = angles;
	}
	if(isdefined(var_57fe74e5) || isdefined(var_fd90b0bb))
	{
		weapon_model useweaponmodel(weapon, model, var_57fe74e5, var_fd90b0bb);
	}
	else
	{
		weapon_model useweaponmodel(weapon, model);
	}
	return weapon_model;
}

/*
	Name: spawn_buildkit_weapon_model
	Namespace: zm_utility
	Checksum: 0xD7A87020
	Offset: 0xA490
	Size: 0x130
	Parameters: 5
	Flags: Linked
*/
function spawn_buildkit_weapon_model(player, weapon, var_3ded6a21, origin, angles)
{
	weapon_model = util::spawn_model("tag_origin", origin, angles);
	if(!isdefined(weapon))
	{
		return weapon_model;
	}
	upgraded = zm_weapons::is_weapon_upgraded(weapon);
	if(isplayer(player))
	{
		if(upgraded && (!isdefined(var_3ded6a21) || 0 > var_3ded6a21))
		{
			var_3ded6a21 = player zm_camos::function_4f727cf5(weapon);
		}
		weapon_model usebuildkitweaponmodel(player, weapon, var_3ded6a21);
	}
	else if(isdefined(weapon.worldmodel))
	{
		weapon_model setmodel(weapon.worldmodel);
	}
	return weapon_model;
}

/*
	Name: is_limited_weapon
	Namespace: zm_utility
	Checksum: 0xD2D6542D
	Offset: 0xA5C8
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function is_limited_weapon(weapon)
{
	if(isdefined(level.limited_weapons) && isdefined(level.limited_weapons[weapon]))
	{
		return true;
	}
	return false;
}

/*
	Name: should_watch_for_emp
	Namespace: zm_utility
	Checksum: 0xE35ED823
	Offset: 0xA610
	Size: 0x1A
	Parameters: 0
	Flags: Linked
*/
function should_watch_for_emp()
{
	return is_true(level.should_watch_for_emp);
}

/*
	Name: groundpos
	Namespace: zm_utility
	Checksum: 0xA5A3A049
	Offset: 0xA638
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function groundpos(origin)
{
	return bullettrace(origin, origin + (vectorscale((0, 0, -1), 100000)), 0, self)[#"position"];
}

/*
	Name: groundpos_ignore_water
	Namespace: zm_utility
	Checksum: 0xD18BED6
	Offset: 0xA688
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function groundpos_ignore_water(origin)
{
	return bullettrace(origin, origin + (vectorscale((0, 0, -1), 100000)), 0, self, 1)[#"position"];
}

/*
	Name: groundpos_ignore_water_new
	Namespace: zm_utility
	Checksum: 0x4BE7ECB0
	Offset: 0xA6E0
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function groundpos_ignore_water_new(origin)
{
	return groundtrace(origin, origin + (vectorscale((0, 0, -1), 100000)), 0, self, 1)[#"position"];
}

/*
	Name: self_delete
	Namespace: zm_utility
	Checksum: 0xBFBC83C6
	Offset: 0xA738
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function self_delete()
{
	if(isdefined(self))
	{
		self delete();
	}
}

/*
	Name: ignore_triggers
	Namespace: zm_utility
	Checksum: 0xCCDBC922
	Offset: 0xA768
	Size: 0x5A
	Parameters: 1
	Flags: Linked
*/
function ignore_triggers(timer)
{
	if(!isdefined(self))
	{
		return;
	}
	self endon(#"death");
	self.ignoretriggers = 1;
	if(isdefined(timer))
	{
		wait(timer);
	}
	else
	{
		wait(0.5);
	}
	self.ignoretriggers = 0;
}

/*
	Name: give_achievement
	Namespace: zm_utility
	Checksum: 0x2CE80AE4
	Offset: 0xA7D0
	Size: 0x174
	Parameters: 2
	Flags: Linked
*/
function give_achievement(achievement, all_players)
{
	if(!isdefined(all_players))
	{
		all_players = 0;
	}
	if(achievement == "")
	{
		return;
	}
	if(is_true(level.zm_disable_recording_stats))
	{
		return;
	}
	/#
		assert(ishash(achievement), "");
	#/
	if(all_players)
	{
		foreach(player in getplayers())
		{
			player giveachievement(achievement);
		}
	}
	else
	{
		if(!isplayer(self))
		{
			/#
				assertmsg("");
			#/
			return;
		}
		self giveachievement(achievement);
	}
}

/*
	Name: getyaw
	Namespace: zm_utility
	Checksum: 0xC4FF9317
	Offset: 0xA950
	Size: 0x3E
	Parameters: 1
	Flags: Linked
*/
function getyaw(org)
{
	angles = vectortoangles(org - self.origin);
	return angles[1];
}

/*
	Name: getyawtospot
	Namespace: zm_utility
	Checksum: 0xE59837F
	Offset: 0xA998
	Size: 0x62
	Parameters: 1
	Flags: Linked
*/
function getyawtospot(spot)
{
	pos = spot;
	yaw = self.angles[1] - getyaw(pos);
	yaw = angleclamp180(yaw);
	return yaw;
}

/*
	Name: disable_react
	Namespace: zm_utility
	Checksum: 0x22C7E052
	Offset: 0xAA08
	Size: 0x3E
	Parameters: 0
	Flags: Linked
*/
function disable_react()
{
	/#
		assert(isalive(self), "");
	#/
	self.allowreact = 0;
}

/*
	Name: enable_react
	Namespace: zm_utility
	Checksum: 0xA1C416B1
	Offset: 0xAA50
	Size: 0x42
	Parameters: 0
	Flags: None
*/
function enable_react()
{
	/#
		assert(isalive(self), "");
	#/
	self.allowreact = 1;
}

/*
	Name: is_ee_enabled
	Namespace: zm_utility
	Checksum: 0x12CEF27B
	Offset: 0xAAA0
	Size: 0x8A
	Parameters: 0
	Flags: Linked
*/
function is_ee_enabled()
{
	if(is_true(level.var_73d1e054))
	{
		return false;
	}
	if(!getdvarint(#"zm_ee_enabled", 0))
	{
		return false;
	}
	if(!zm_custom::function_901b751c(#"hash_3c5363541b97ca3e"))
	{
		return false;
	}
	if(level.gamedifficulty === 0)
	{
		return false;
	}
	return true;
}

/*
	Name: function_36e7b4a2
	Namespace: zm_utility
	Checksum: 0x8966B855
	Offset: 0xAB38
	Size: 0x3E
	Parameters: 0
	Flags: None
*/
function function_36e7b4a2()
{
	if(is_true(getgametypesetting(#"hash_5d6471cd7038852e")))
	{
		return true;
	}
	return false;
}

/*
	Name: bullet_attack
	Namespace: zm_utility
	Checksum: 0xB710CE26
	Offset: 0xAB80
	Size: 0x30
	Parameters: 1
	Flags: None
*/
function bullet_attack(type)
{
	if(type == "MOD_PISTOL_BULLET")
	{
		return 1;
	}
	return type == "MOD_RIFLE_BULLET";
}

/*
	Name: pick_up
	Namespace: zm_utility
	Checksum: 0xE043554A
	Offset: 0xABB8
	Size: 0x9C
	Parameters: 0
	Flags: Linked
*/
function pick_up()
{
	player = self.owner;
	self delete();
	clip_ammo = player getweaponammoclip(self.weapon);
	clip_max_ammo = self.weapon.clipsize;
	if(clip_ammo < clip_max_ammo)
	{
		clip_ammo++;
	}
	player setweaponammoclip(self.weapon, clip_ammo);
}

/*
	Name: function_ab9a9770
	Namespace: zm_utility
	Checksum: 0x66AB6465
	Offset: 0xAC60
	Size: 0x98
	Parameters: 0
	Flags: Linked
*/
function function_ab9a9770()
{
	s_trace = groundtrace(self.origin + vectorscale((0, 0, 1), 70), self.origin + (vectorscale((0, 0, -1), 100)), 0, self);
	if(isdefined(s_trace[#"entity"]) && s_trace[#"entity"] ismovingplatform())
	{
		return true;
	}
	return false;
}

/*
	Name: function_52046128
	Namespace: zm_utility
	Checksum: 0x129DB197
	Offset: 0xAD00
	Size: 0x82
	Parameters: 0
	Flags: None
*/
function function_52046128()
{
	s_trace = groundtrace(self.origin + vectorscale((0, 0, 1), 70), self.origin + (vectorscale((0, 0, -1), 100)), 0, self);
	if(isdefined(s_trace[#"entity"]))
	{
		return s_trace[#"entity"];
	}
	return undefined;
}

/*
	Name: waittill_not_moving
	Namespace: zm_utility
	Checksum: 0x5800B682
	Offset: 0xAD90
	Size: 0xAE
	Parameters: 0
	Flags: None
*/
function waittill_not_moving()
{
	self endon(#"death", #"detonated");
	level endon(#"game_ended");
	if(self.classname == "grenade")
	{
		self waittill(#"stationary");
	}
	else
	{
		prevorigin = self.origin;
		while(true)
		{
			wait(0.15);
			if(self.origin == prevorigin)
			{
				break;
			}
			prevorigin = self.origin;
		}
	}
}

/*
	Name: get_closest_player
	Namespace: zm_utility
	Checksum: 0x9A1D7974
	Offset: 0xAE48
	Size: 0x78
	Parameters: 1
	Flags: Linked
*/
function get_closest_player(org)
{
	players = [];
	players = getplayers();
	if(players.size)
	{
		if(players.size > 1 && isdefined(org))
		{
			return arraygetclosest(org, players);
		}
		return players[0];
	}
}

/*
	Name: ent_flag_init_ai_standards
	Namespace: zm_utility
	Checksum: 0x5E9DB52E
	Offset: 0xAEC8
	Size: 0x8C
	Parameters: 0
	Flags: None
*/
function ent_flag_init_ai_standards()
{
	message_array = [];
	message_array[message_array.size] = "goal";
	message_array[message_array.size] = "damage";
	for(i = 0; i < message_array.size; i++)
	{
		self flag::init(message_array[i]);
		self thread ent_flag_wait_ai_standards(message_array[i]);
	}
}

/*
	Name: ent_flag_wait_ai_standards
	Namespace: zm_utility
	Checksum: 0x9CE7A6DF
	Offset: 0xAF60
	Size: 0x40
	Parameters: 1
	Flags: Linked
*/
function ent_flag_wait_ai_standards(message)
{
	self endon(#"death");
	self waittill(message);
	self.ent_flag[message] = 1;
}

/*
	Name: flat_angle
	Namespace: zm_utility
	Checksum: 0x44A0C4F3
	Offset: 0xAFA8
	Size: 0x2A
	Parameters: 1
	Flags: None
*/
function flat_angle(angle)
{
	rangle = (0, angle[1], 0);
	return rangle;
}

/*
	Name: clear_run_anim
	Namespace: zm_utility
	Checksum: 0xD13CB617
	Offset: 0xAFE0
	Size: 0x42
	Parameters: 0
	Flags: None
*/
function clear_run_anim()
{
	self.alwaysrunforward = undefined;
	self.a.combatrunanim = undefined;
	self.run_noncombatanim = undefined;
	self.walk_combatanim = undefined;
	self.walk_noncombatanim = undefined;
	self.precombatrunenabled = 1;
}

/*
	Name: track_players_intersection_tracker
	Namespace: zm_utility
	Checksum: 0x9F4CECB2
	Offset: 0xB030
	Size: 0x8E6
	Parameters: 0
	Flags: Linked
*/
function track_players_intersection_tracker()
{
	level endon(#"end_game");
	wait(5);
	var_76013453 = [];
	/#
		if(!isdefined(level.var_9db63456))
		{
			level.var_9db63456 = 0;
		}
	#/
	if(!isdefined(level.var_9db63456))
	{
		level.var_9db63456 = 1;
	}
	while(true)
	{
		var_1a1f860b = 0;
		players = getplayers();
		/#
			foreach(player in players)
			{
				if(!isdefined(player.var_ab8c5e97))
				{
					player.var_ab8c5e97 = [];
				}
				if(!isdefined(player.var_d28c72e5))
				{
					player.var_d28c72e5 = 1000;
				}
			}
		#/
		var_93bba48c = [];
		for(i = 0; i < players.size; i++)
		{
			if(is_true(players[i].var_f4e33249) || players[i] isplayerswimming() || players[i] laststand::player_is_in_laststand() || "playing" != players[i].sessionstate)
			{
				continue;
			}
			if(isbot(players[i]))
			{
				continue;
			}
			if(lengthsquared(players[i] getvelocity()) > 15625)
			{
				continue;
			}
			if(is_true(players[i].var_c5e36086))
			{
				continue;
			}
			for(j = 0; j < players.size; j++)
			{
				if(i == j || is_true(players[j].var_f4e33249) || players[j] isplayerswimming() || players[j] laststand::player_is_in_laststand() || "playing" != players[j].sessionstate)
				{
					continue;
				}
				if(isbot(players[j]))
				{
					continue;
				}
				if(lengthsquared(players[j] getvelocity()) > 15625)
				{
					continue;
				}
				if(is_true(players[j].var_c5e36086))
				{
					continue;
				}
				if(isdefined(level.player_intersection_tracker_override))
				{
					if(players[i] [[level.player_intersection_tracker_override]](players[j]))
					{
						continue;
					}
				}
				playeri_origin = players[i].origin;
				playerj_origin = players[j].origin;
				if(abs(playeri_origin[2] - playerj_origin[2]) > 60)
				{
					continue;
				}
				distance_apart = distance2d(playeri_origin, playerj_origin);
				/#
					if(!isdefined(players[i].var_ab8c5e97[j]))
					{
						players[i].var_ab8c5e97[j] = 1000;
					}
					players[i].var_ab8c5e97[j] = min(players[i].var_ab8c5e97[j], distance_apart);
					players[i].var_d28c72e5 = min(players[i].var_d28c72e5, distance_apart);
					if(abs(distance_apart) > 30)
					{
						if(players[i].var_ab8c5e97[j] === players[i].var_d28c72e5)
						{
							players[i].var_d28c72e5 = 1000;
						}
						players[i].var_ab8c5e97[j] = 1000;
					}
				#/
				if(abs(distance_apart) > 9)
				{
					continue;
				}
				if(!isdefined(var_93bba48c))
				{
					var_93bba48c = [];
				}
				else if(!isarray(var_93bba48c))
				{
					var_93bba48c = array(var_93bba48c);
				}
				if(!isinarray(var_93bba48c, players[i]))
				{
					var_93bba48c[var_93bba48c.size] = players[i];
				}
				if(!isdefined(var_93bba48c))
				{
					var_93bba48c = [];
				}
				else if(!isarray(var_93bba48c))
				{
					var_93bba48c = array(var_93bba48c);
				}
				if(!isinarray(var_93bba48c, players[j]))
				{
					var_93bba48c[var_93bba48c.size] = players[j];
				}
			}
		}
		foreach(var_e42ab7b4 in var_93bba48c)
		{
			/#
				if(!level.var_9db63456)
				{
					iprintlnbold("" + var_e42ab7b4.var_d28c72e5);
					continue;
				}
			#/
			if(isinarray(var_76013453, var_e42ab7b4))
			{
				if(isdefined(var_e42ab7b4.maxhealth) && var_e42ab7b4.maxhealth > 0)
				{
					n_damage = (var_e42ab7b4.maxhealth / 3) + 1;
				}
				else
				{
					n_damage = 51;
				}
				if(isdefined(var_e42ab7b4) && isvec(var_e42ab7b4.origin))
				{
					self.var_dad8bef6 = 1;
					var_e42ab7b4 dodamage(n_damage, var_e42ab7b4.origin);
					self.var_dad8bef6 = undefined;
					var_e42ab7b4 zm_stats::increment_map_cheat_stat("cheat_too_friendly");
					var_e42ab7b4 zm_stats::increment_client_stat("cheat_too_friendly", 0);
					var_e42ab7b4 zm_stats::increment_client_stat("cheat_total", 0);
				}
			}
			if(!var_1a1f860b)
			{
				/#
					iprintlnbold("" + var_e42ab7b4.var_d28c72e5);
				#/
				foreach(e_player in level.players)
				{
					e_player playlocalsound(level.zmb_laugh_alias);
				}
				var_1a1f860b = 1;
			}
		}
		var_76013453 = var_93bba48c;
		wait(1);
	}
}

/*
	Name: is_player_looking_at
	Namespace: zm_utility
	Checksum: 0x87368EDE
	Offset: 0xB920
	Size: 0x158
	Parameters: 4
	Flags: Linked
*/
function is_player_looking_at(origin, dot, do_trace, ignore_ent)
{
	/#
		assert(isplayer(self), "");
	#/
	if(!isdefined(dot))
	{
		dot = 0.7;
	}
	if(!isdefined(do_trace))
	{
		do_trace = 1;
	}
	eye = self util::get_eye();
	delta_vec = anglestoforward(vectortoangles(origin - eye));
	view_vec = anglestoforward(self getplayerangles());
	new_dot = vectordot(delta_vec, view_vec);
	if(new_dot >= dot)
	{
		if(do_trace)
		{
			return bullettracepassed(origin, eye, 0, ignore_ent);
		}
		return 1;
	}
	return 0;
}

/*
	Name: add_gametype
	Namespace: zm_utility
	Checksum: 0x27A1801C
	Offset: 0xBA80
	Size: 0x24
	Parameters: 4
	Flags: None
*/
function add_gametype(gt, dummy1, name, dummy2)
{
}

/*
	Name: add_gameloc
	Namespace: zm_utility
	Checksum: 0xFF9899DC
	Offset: 0xBAB0
	Size: 0x24
	Parameters: 4
	Flags: None
*/
function add_gameloc(gl, dummy1, name, dummy2)
{
}

/*
	Name: get_closest_index
	Namespace: zm_utility
	Checksum: 0xE489020C
	Offset: 0xBAE0
	Size: 0xC8
	Parameters: 3
	Flags: None
*/
function get_closest_index(org, array, dist)
{
	if(!isdefined(dist))
	{
		dist = 9999999;
	}
	distsq = dist * dist;
	if(array.size < 1)
	{
		return;
	}
	index = undefined;
	for(i = 0; i < array.size; i++)
	{
		newdistsq = distancesquared(array[i].origin, org);
		if(newdistsq >= distsq)
		{
			continue;
		}
		distsq = newdistsq;
		index = i;
	}
	return index;
}

/*
	Name: is_valid_zombie_spawn_point
	Namespace: zm_utility
	Checksum: 0x1FB07702
	Offset: 0xBBB0
	Size: 0xD6
	Parameters: 1
	Flags: None
*/
function is_valid_zombie_spawn_point(point)
{
	liftedorigin = point.origin + vectorscale((0, 0, 1), 5);
	size = 48;
	height = 64;
	mins = (-1 * size, -1 * size, 0);
	maxs = (size, size, height);
	absmins = liftedorigin + mins;
	absmaxs = liftedorigin + maxs;
	if(boundswouldtelefrag(absmins, absmaxs))
	{
		return false;
	}
	return true;
}

/*
	Name: get_closest_index_to_entity
	Namespace: zm_utility
	Checksum: 0x6A1D9414
	Offset: 0xBC90
	Size: 0x110
	Parameters: 4
	Flags: None
*/
function get_closest_index_to_entity(entity, array, dist, extra_check)
{
	org = entity.origin;
	if(!isdefined(dist))
	{
		dist = 9999999;
	}
	distsq = dist * dist;
	if(array.size < 1)
	{
		return;
	}
	index = undefined;
	for(i = 0; i < array.size; i++)
	{
		if(isdefined(extra_check) && ![[extra_check]](entity, array[i]))
		{
			continue;
		}
		newdistsq = distancesquared(array[i].origin, org);
		if(newdistsq >= distsq)
		{
			continue;
		}
		distsq = newdistsq;
		index = i;
	}
	return index;
}

/*
	Name: set_gamemode_var
	Namespace: zm_utility
	Checksum: 0xACF0441C
	Offset: 0xBDA8
	Size: 0x40
	Parameters: 2
	Flags: Linked
*/
function set_gamemode_var(gvar, val)
{
	if(!isdefined(game.gamemode_match))
	{
		game.gamemode_match = [];
	}
	game.gamemode_match[gvar] = val;
}

/*
	Name: set_gamemode_var_once
	Namespace: zm_utility
	Checksum: 0xB8AB9FF5
	Offset: 0xBDF0
	Size: 0x54
	Parameters: 2
	Flags: Linked
*/
function set_gamemode_var_once(gvar, val)
{
	if(!isdefined(game.gamemode_match))
	{
		game.gamemode_match = [];
	}
	if(!isdefined(game.gamemode_match[gvar]))
	{
		game.gamemode_match[gvar] = val;
	}
}

/*
	Name: get_gamemode_var
	Namespace: zm_utility
	Checksum: 0xCAD3EC1A
	Offset: 0xBE50
	Size: 0x48
	Parameters: 1
	Flags: Linked
*/
function get_gamemode_var(gvar)
{
	if(isdefined(game.gamemode_match) && isdefined(game.gamemode_match[gvar]))
	{
		return game.gamemode_match[gvar];
	}
	return undefined;
}

/*
	Name: waittill_subset
	Namespace: zm_utility
	Checksum: 0xEDA7996
	Offset: 0xBEA0
	Size: 0x1C8
	Parameters: 6
	Flags: None
*/
function waittill_subset(min_num, string1, string2, string3, string4, string5)
{
	self endon(#"death");
	ent = spawnstruct();
	ent.threads = 0;
	returned_threads = 0;
	if(isdefined(string1))
	{
		self thread util::waittill_string(string1, ent);
		ent.threads++;
	}
	if(isdefined(string2))
	{
		self thread util::waittill_string(string2, ent);
		ent.threads++;
	}
	if(isdefined(string3))
	{
		self thread util::waittill_string(string3, ent);
		ent.threads++;
	}
	if(isdefined(string4))
	{
		self thread util::waittill_string(string4, ent);
		ent.threads++;
	}
	if(isdefined(string5))
	{
		self thread util::waittill_string(string5, ent);
		ent.threads++;
	}
	while(ent.threads)
	{
		ent waittill(#"returned");
		ent.threads--;
		returned_threads++;
		if(returned_threads >= min_num)
		{
			break;
		}
	}
	ent notify(#"die");
}

/*
	Name: is_headshot
	Namespace: zm_utility
	Checksum: 0xE02C7E86
	Offset: 0xC070
	Size: 0x1A2
	Parameters: 4
	Flags: Linked
*/
function is_headshot(weapon, shitloc, smeansofdeath, var_f8c15d58)
{
	if(!isdefined(var_f8c15d58))
	{
		var_f8c15d58 = 1;
	}
	if(smeansofdeath == "MOD_MELEE" || smeansofdeath == "MOD_UNKNOWN" || smeansofdeath == "MOD_MELEE_WEAPON_BUTT")
	{
		return false;
	}
	if(var_f8c15d58 && isdefined(self.var_e6675d2d) && (smeansofdeath == "MOD_PROJECTILE" || smeansofdeath == "MOD_PROJECTILE_SPLASH" || smeansofdeath == "MOD_GRENADE" || smeansofdeath == "MOD_GRENADE_SPLASH"))
	{
		v_head = self gettagorigin("j_head");
		if(!isdefined(v_head))
		{
			return false;
		}
		n_distance_squared = distancesquared(self.var_e6675d2d, v_head);
		if(n_distance_squared < 80)
		{
			return true;
		}
	}
	if(!isdefined(shitloc) || shitloc == "none")
	{
		return false;
	}
	if(shitloc != "head" && shitloc != "helmet" && shitloc != "neck")
	{
		return false;
	}
	return true;
}

/*
	Name: function_4562a3ef
	Namespace: zm_utility
	Checksum: 0xFEECF95
	Offset: 0xC220
	Size: 0x8A
	Parameters: 2
	Flags: Linked
*/
function function_4562a3ef(shitloc, vpoint)
{
	var_dd54fdb1 = namespace_81245006::function_3131f5dd(self, shitloc, 1);
	if(isdefined(vpoint))
	{
		if(!isdefined(var_dd54fdb1))
		{
			var_dd54fdb1 = namespace_81245006::function_73ab4754(self, vpoint, 1);
		}
	}
	return is_true(var_dd54fdb1.var_3765e777);
}

/*
	Name: is_explosive_damage
	Namespace: zm_utility
	Checksum: 0x58929F8A
	Offset: 0xC2B8
	Size: 0x7E
	Parameters: 1
	Flags: Linked
*/
function is_explosive_damage(mod)
{
	if(!isdefined(mod))
	{
		return false;
	}
	if(mod == "MOD_GRENADE" || mod == "MOD_GRENADE_SPLASH" || mod == "MOD_PROJECTILE" || mod == "MOD_PROJECTILE_SPLASH" || mod == "MOD_EXPLOSIVE")
	{
		return true;
	}
	return false;
}

/*
	Name: function_7a35b1d7
	Namespace: zm_utility
	Checksum: 0x20DD3BB5
	Offset: 0xC340
	Size: 0x8C
	Parameters: 1
	Flags: None
*/
function function_7a35b1d7(var_c857a96d)
{
	if(isplayer(self))
	{
		self luinotifyevent(#"zombie_notification", 2, var_c857a96d, self getentitynumber());
	}
	else
	{
		luinotifyevent(#"zombie_notification", 1, var_c857a96d);
	}
}

/*
	Name: function_846eb7dd
	Namespace: zm_utility
	Checksum: 0x27542557
	Offset: 0xC3D8
	Size: 0x84
	Parameters: 2
	Flags: Linked
*/
function function_846eb7dd(type_id, var_c857a96d)
{
	if(isplayer(self))
	{
		self luinotifyevent(type_id, 2, var_c857a96d, self getentitynumber());
	}
	else
	{
		luinotifyevent(type_id, 1, var_c857a96d);
	}
}

/*
	Name: function_e64ac3b6
	Namespace: zm_utility
	Checksum: 0xC8497AE6
	Offset: 0xC468
	Size: 0x9C
	Parameters: 2
	Flags: None
*/
function function_e64ac3b6(type_id, var_c857a96d)
{
	if(isplayer(self))
	{
		self luinotifyevent(#"zombie_special_notification", 3, type_id, var_c857a96d, self getentitynumber());
	}
	else
	{
		luinotifyevent(#"zombie_special_notification", 2, type_id, var_c857a96d);
	}
}

/*
	Name: sndswitchannouncervox
	Namespace: zm_utility
	Checksum: 0xF7978B1A
	Offset: 0xC510
	Size: 0x6A
	Parameters: 1
	Flags: None
*/
function sndswitchannouncervox(who)
{
	switch(who)
	{
		case "sam":
		{
			game.zmbdialog[#"prefix"] = "vox_zmba_sam";
			level.zmb_laugh_alias = "zmb_player_outofbounds";
			level.sndannouncerisrich = 0;
			break;
		}
	}
}

/*
	Name: do_player_general_vox
	Namespace: zm_utility
	Checksum: 0x3E73B265
	Offset: 0xC588
	Size: 0xBC
	Parameters: 4
	Flags: None
*/
function do_player_general_vox(category, type, timer, chance)
{
	if(isdefined(chance) && isdefined(level.votimer[timer]) && level.votimer[timer] > 0)
	{
		return;
	}
	self thread zm_audio::create_and_play_dialog(type, timer);
	if(isdefined(chance))
	{
		level.votimer[timer] = chance;
		level thread general_vox_timer(level.votimer[timer], timer);
	}
}

/*
	Name: general_vox_timer
	Namespace: zm_utility
	Checksum: 0x6EDC0564
	Offset: 0xC650
	Size: 0xCC
	Parameters: 2
	Flags: Linked
*/
function general_vox_timer(timer, type)
{
	level endon(#"end_game");
	/#
		println(((("" + type) + "") + timer) + "");
	#/
	while(timer > 0)
	{
		wait(1);
		timer--;
	}
	level.votimer[type] = timer;
	/#
		println(((("" + type) + "") + timer) + "");
	#/
}

/*
	Name: play_vox_to_player
	Namespace: zm_utility
	Checksum: 0x2A2CBA66
	Offset: 0xC728
	Size: 0x1C
	Parameters: 3
	Flags: None
*/
function play_vox_to_player(category, type, force_variant)
{
}

/*
	Name: is_favorite_weapon
	Namespace: zm_utility
	Checksum: 0xECA7F588
	Offset: 0xC750
	Size: 0x9C
	Parameters: 1
	Flags: None
*/
function is_favorite_weapon(weapon_to_check)
{
	if(!isdefined(self.favorite_wall_weapons_list))
	{
		return false;
	}
	foreach(weapon in self.favorite_wall_weapons_list)
	{
		if(weapon_to_check == weapon)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: set_demo_intermission_point
	Namespace: zm_utility
	Checksum: 0x7DFE33C4
	Offset: 0xC7F8
	Size: 0x1DC
	Parameters: 0
	Flags: Linked
*/
function set_demo_intermission_point()
{
	spawnpoints = getentarray("mp_global_intermission", "classname");
	if(!spawnpoints.size)
	{
		return;
	}
	spawnpoint = spawnpoints[0];
	match_string = "";
	location = level.scr_zm_map_start_location;
	if(location == "default" || location == "" && isdefined(level.default_start_location))
	{
		location = level.default_start_location;
	}
	match_string = (level.scr_zm_ui_gametype + "_") + location;
	for(i = 0; i < spawnpoints.size; i++)
	{
		if(isdefined(spawnpoints[i].script_string))
		{
			tokens = strtok(spawnpoints[i].script_string, " ");
			foreach(token in tokens)
			{
				if(token == match_string)
				{
					spawnpoint = spawnpoints[i];
					i = spawnpoints.size;
					break;
				}
			}
		}
	}
	setdemointermissionpoint(spawnpoint.origin, spawnpoint.angles);
}

/*
	Name: register_map_navcard
	Namespace: zm_utility
	Checksum: 0xF2325638
	Offset: 0xC9E0
	Size: 0x34
	Parameters: 2
	Flags: None
*/
function register_map_navcard(navcard_on_map, navcard_needed_for_computer)
{
	level.navcard_needed = navcard_needed_for_computer;
	level.map_navcard = navcard_on_map;
}

/*
	Name: does_player_have_map_navcard
	Namespace: zm_utility
	Checksum: 0x2B248043
	Offset: 0xCA20
	Size: 0x2A
	Parameters: 1
	Flags: None
*/
function does_player_have_map_navcard(player)
{
	return player zm_stats::get_global_stat(level.map_navcard);
}

/*
	Name: does_player_have_correct_navcard
	Namespace: zm_utility
	Checksum: 0xD2B30A39
	Offset: 0xCA58
	Size: 0x3A
	Parameters: 1
	Flags: None
*/
function does_player_have_correct_navcard(player)
{
	if(!isdefined(level.navcard_needed))
	{
		return 0;
	}
	return player zm_stats::get_global_stat(level.navcard_needed);
}

/*
	Name: disable_player_move_states
	Namespace: zm_utility
	Checksum: 0xE69F3443
	Offset: 0xCAA0
	Size: 0xDC
	Parameters: 1
	Flags: Linked
*/
function disable_player_move_states(forcestancechange)
{
	self allowcrouch(1);
	self allowads(0);
	self allowsprint(0);
	self allowprone(0);
	self allowmelee(0);
	if(is_true(forcestancechange))
	{
		if(self getstance() == "prone")
		{
			self setstance("crouch");
		}
	}
}

/*
	Name: enable_player_move_states
	Namespace: zm_utility
	Checksum: 0x3A48C4E5
	Offset: 0xCB88
	Size: 0x10C
	Parameters: 0
	Flags: Linked
*/
function enable_player_move_states()
{
	if(!isdefined(self))
	{
		return;
	}
	if(!isplayer(self))
	{
		return;
	}
	if(!isdefined(self._allow_ads) || self._allow_ads == 1)
	{
		self allowads(1);
	}
	if(!isdefined(self._allow_sprint) || self._allow_sprint == 1)
	{
		self allowsprint(1);
	}
	if(!isdefined(self._allow_prone) || self._allow_prone == 1)
	{
		self allowprone(1);
	}
	if(!isdefined(self._allow_melee) || self._allow_melee == 1)
	{
		self allowmelee(1);
	}
}

/*
	Name: spawn_path_node
	Namespace: zm_utility
	Checksum: 0xB3BEC897
	Offset: 0xCCA0
	Size: 0xFE
	Parameters: 6
	Flags: None
*/
function spawn_path_node(origin, angles, k1, v1, k2, v2)
{
	if(!isdefined(level._spawned_path_nodes))
	{
		level._spawned_path_nodes = [];
	}
	node = spawnstruct();
	node.origin = origin;
	node.angles = angles;
	node.k1 = k1;
	node.v1 = v1;
	node.k2 = k2;
	node.v2 = v2;
	node.node = spawn_path_node_internal(origin, angles, k1, v1, k2, v2);
	level._spawned_path_nodes[level._spawned_path_nodes.size] = node;
	return node.node;
}

/*
	Name: spawn_path_node_internal
	Namespace: zm_utility
	Checksum: 0x13DBF3B1
	Offset: 0xCDA8
	Size: 0xB2
	Parameters: 6
	Flags: Linked
*/
function spawn_path_node_internal(origin, angles, k1, v1, k2, v2)
{
	if(isdefined(k2))
	{
		return spawnpathnode("node_pathnode", origin, angles, undefined, k1, v1, k2, v2);
	}
	if(isdefined(k1))
	{
		return spawnpathnode("node_pathnode", origin, angles, undefined, k1, v1);
	}
	return spawnpathnode("node_pathnode", origin, angles);
}

/*
	Name: delete_spawned_path_nodes
	Namespace: zm_utility
	Checksum: 0x80F724D1
	Offset: 0xCE68
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function delete_spawned_path_nodes()
{
}

/*
	Name: respawn_path_nodes
	Namespace: zm_utility
	Checksum: 0xE97B96E6
	Offset: 0xCE78
	Size: 0xCA
	Parameters: 0
	Flags: Linked
*/
function respawn_path_nodes()
{
	if(!isdefined(level._spawned_path_nodes))
	{
		return;
	}
	for(i = 0; i < level._spawned_path_nodes.size; i++)
	{
		node_struct = level._spawned_path_nodes[i];
		/#
			println("" + node_struct.origin);
		#/
		node_struct.node = spawn_path_node_internal(node_struct.origin, node_struct.angles, node_struct.k1, node_struct.v1, node_struct.k2, node_struct.v2);
	}
}

/*
	Name: undo_link_changes
	Namespace: zm_utility
	Checksum: 0xF091A91F
	Offset: 0xCF50
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function undo_link_changes()
{
	/#
		println("");
		println("");
		println("");
	#/
	delete_spawned_path_nodes();
}

/*
	Name: redo_link_changes
	Namespace: zm_utility
	Checksum: 0x29677F4D
	Offset: 0xCFC0
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function redo_link_changes()
{
	/#
		println("");
		println("");
		println("");
	#/
	respawn_path_nodes();
}

/*
	Name: is_gametype_active
	Namespace: zm_utility
	Checksum: 0xAB51B8D5
	Offset: 0xD030
	Size: 0x92
	Parameters: 1
	Flags: None
*/
function is_gametype_active(a_gametypes)
{
	b_is_gametype_active = 0;
	if(!isarray(a_gametypes))
	{
		a_gametypes = array(a_gametypes);
	}
	for(i = 0; i < a_gametypes.size; i++)
	{
		if(util::get_game_type() == a_gametypes[i])
		{
			b_is_gametype_active = 1;
		}
	}
	return b_is_gametype_active;
}

/*
	Name: register_custom_spawner_entry
	Namespace: zm_utility
	Checksum: 0xAC0DF2F8
	Offset: 0xD0D0
	Size: 0x40
	Parameters: 2
	Flags: None
*/
function register_custom_spawner_entry(spot_noteworthy, func)
{
	if(!isdefined(level.custom_spawner_entry))
	{
		level.custom_spawner_entry = [];
	}
	level.custom_spawner_entry[spot_noteworthy] = func;
}

/*
	Name: get_player_weapon_limit
	Namespace: zm_utility
	Checksum: 0x3BF3152F
	Offset: 0xD118
	Size: 0x8E
	Parameters: 1
	Flags: Linked
*/
function get_player_weapon_limit(player)
{
	if(isdefined(self.get_player_weapon_limit))
	{
		return [[self.get_player_weapon_limit]](player);
	}
	if(isdefined(level.get_player_weapon_limit))
	{
		return [[level.get_player_weapon_limit]](player);
	}
	weapon_limit = 2;
	if(player hasperk(#"specialty_additionalprimaryweapon"))
	{
		weapon_limit = level.additionalprimaryweapon_limit;
	}
	return weapon_limit;
}

/*
	Name: function_e05ac4ad
	Namespace: zm_utility
	Checksum: 0x95141729
	Offset: 0xD1B0
	Size: 0x62
	Parameters: 2
	Flags: Linked
*/
function function_e05ac4ad(e_player, n_cost)
{
	if(isdefined(level.var_236b9f7a) && [[level.var_236b9f7a]](e_player, self.clientfieldname))
	{
		return 0;
	}
	return e_player zm_score::can_player_purchase(n_cost);
}

/*
	Name: get_player_perk_purchase_limit
	Namespace: zm_utility
	Checksum: 0xC76443A5
	Offset: 0xD220
	Size: 0x42
	Parameters: 0
	Flags: Linked
*/
function get_player_perk_purchase_limit()
{
	n_perk_purchase_limit_override = level.perk_purchase_limit;
	if(isdefined(level.get_player_perk_purchase_limit))
	{
		n_perk_purchase_limit_override = self [[level.get_player_perk_purchase_limit]]();
	}
	return n_perk_purchase_limit_override;
}

/*
	Name: can_player_purchase_perk
	Namespace: zm_utility
	Checksum: 0xDF49E5D3
	Offset: 0xD270
	Size: 0x70
	Parameters: 0
	Flags: Linked
*/
function can_player_purchase_perk()
{
	if(self.num_perks < self get_player_perk_purchase_limit())
	{
		return true;
	}
	if(self bgb::is_enabled(#"zm_bgb_unquenchable") || self bgb::is_enabled(#"zm_bgb_soda_fountain"))
	{
		return true;
	}
	return false;
}

/*
	Name: wait_for_attractor_positions_complete
	Namespace: zm_utility
	Checksum: 0xAC01DD27
	Offset: 0xD2E8
	Size: 0x36
	Parameters: 0
	Flags: None
*/
function wait_for_attractor_positions_complete()
{
	self endon(#"death");
	self waittill(#"attractor_positions_generated");
	self.attract_to_origin = 0;
}

/*
	Name: get_player_index
	Namespace: zm_utility
	Checksum: 0x63E659E4
	Offset: 0xD328
	Size: 0xD6
	Parameters: 1
	Flags: Linked
*/
function get_player_index(player)
{
	/#
		assert(isplayer(player));
	#/
	/#
		assert(isdefined(player.characterindex));
	#/
	/#
		if(player.entity_num == 0 && getdvarstring(#"zombie_player_vo_overwrite") != "")
		{
			new_vo_index = getdvarint(#"zombie_player_vo_overwrite", 0);
			return new_vo_index;
		}
	#/
	return player.characterindex;
}

/*
	Name: function_828bac1
	Namespace: zm_utility
	Checksum: 0x144B9B73
	Offset: 0xD408
	Size: 0xA0
	Parameters: 1
	Flags: None
*/
function function_828bac1(n_character_index)
{
	foreach(character in level.players)
	{
		if(character zm_characters::function_dc232a80() === n_character_index)
		{
			return character;
		}
	}
	return undefined;
}

/*
	Name: zombie_goto_round
	Namespace: zm_utility
	Checksum: 0xD6316441
	Offset: 0xD4B0
	Size: 0xBC
	Parameters: 1
	Flags: None
*/
function zombie_goto_round(n_target_round)
{
	level notify(#"restart_round");
	if(n_target_round < 1)
	{
		n_target_round = 1;
	}
	level.zombie_total = 0;
	zm_round_logic::set_round_number(n_target_round);
	zombies = zombie_utility::get_round_enemy_array();
	if(isdefined(zombies))
	{
		array::run_all(zombies, &kill);
	}
	level.sndgotoroundoccurred = 1;
	level waittill(#"between_round_over");
}

/*
	Name: is_point_inside_enabled_zone
	Namespace: zm_utility
	Checksum: 0x1148B466
	Offset: 0xD578
	Size: 0x228
	Parameters: 2
	Flags: Linked
*/
function is_point_inside_enabled_zone(v_origin, ignore_zone)
{
	if(function_c200446c() || is_survival())
	{
		return true;
	}
	if(!isdefined(level.playable_area))
	{
		level.playable_area = getentarray("player_volume", "script_noteworthy");
	}
	if(function_c85ebbbc())
	{
		var_12ed21a1 = function_72d3bca6(level.playable_area, v_origin, undefined, undefined, level.var_603981f1);
		foreach(area in var_12ed21a1)
		{
			zone = level.zones[area.targetname];
			if(!zone.is_enabled)
			{
				continue;
			}
			if(isdefined(ignore_zone) && zone == ignore_zone)
			{
				continue;
			}
			if(istouching(v_origin, area))
			{
				return true;
			}
		}
	}
	if(function_21f4ac36())
	{
		node = function_52c1730(v_origin, level.zone_nodes, 500);
		if(isdefined(node))
		{
			zone = level.zones[node.targetname];
			if(isdefined(zone) && zone.is_enabled && zone !== ignore_zone)
			{
				return true;
			}
		}
	}
	return false;
}

/*
	Name: clear_streamer_hint
	Namespace: zm_utility
	Checksum: 0x3E271B29
	Offset: 0xD7A8
	Size: 0x17E
	Parameters: 1
	Flags: Linked
*/
function clear_streamer_hint(var_49d474b2)
{
	if(isarray(self.var_4a501715))
	{
		if(isdefined(var_49d474b2))
		{
			foreach(e_streamer_hint in self.var_4a501715)
			{
				if(n_index === var_49d474b2)
				{
					if(isdefined(e_streamer_hint))
					{
						e_streamer_hint delete();
					}
				}
			}
		}
		else
		{
			foreach(e_streamer_hint in self.var_4a501715)
			{
				if(isdefined(e_streamer_hint))
				{
					e_streamer_hint delete();
				}
			}
		}
		arrayremovevalue(self.var_4a501715, undefined, 1);
	}
	self notify(#"wait_clear_streamer_hint");
}

/*
	Name: wait_clear_streamer_hint
	Namespace: zm_utility
	Checksum: 0x433E7C99
	Offset: 0xD930
	Size: 0x4C
	Parameters: 2
	Flags: Linked
*/
function wait_clear_streamer_hint(lifetime, str_id)
{
	self endon(#"wait_clear_streamer_hint");
	wait(lifetime);
	if(isdefined(self))
	{
		self clear_streamer_hint(str_id);
	}
}

/*
	Name: create_streamer_hint
	Namespace: zm_utility
	Checksum: 0x3A2CA250
	Offset: 0xD988
	Size: 0x270
	Parameters: 5
	Flags: Linked
*/
function create_streamer_hint(origin, angles, value, lifetime, var_49d474b2)
{
	if(self == level)
	{
		foreach(player in getplayers())
		{
			player clear_streamer_hint(var_49d474b2);
		}
	}
	self clear_streamer_hint(var_49d474b2);
	if(!isdefined(self.var_4a501715))
	{
		self.var_4a501715 = [];
	}
	e_streamer_hint = createstreamerhint(origin, value);
	if(isdefined(angles))
	{
		e_streamer_hint.angles = angles;
	}
	if(isplayer(self))
	{
		e_streamer_hint setinvisibletoall();
		e_streamer_hint setvisibletoplayer(self);
	}
	e_streamer_hint setincludemeshes(1);
	if(isdefined(var_49d474b2))
	{
		self.var_4a501715[var_49d474b2] = e_streamer_hint;
	}
	else
	{
		if(!isdefined(self.var_4a501715))
		{
			self.var_4a501715 = [];
		}
		else if(!isarray(self.var_4a501715))
		{
			self.var_4a501715 = array(self.var_4a501715);
		}
		if(!isinarray(self.var_4a501715, e_streamer_hint))
		{
			self.var_4a501715[self.var_4a501715.size] = e_streamer_hint;
		}
	}
	self notify(#"wait_clear_streamer_hint");
	if(isdefined(lifetime) && lifetime > 0)
	{
		self thread wait_clear_streamer_hint(lifetime, var_49d474b2);
	}
	return e_streamer_hint;
}

/*
	Name: approximate_path_dist
	Namespace: zm_utility
	Checksum: 0x7AA6FF15
	Offset: 0xDC00
	Size: 0x130
	Parameters: 1
	Flags: Linked
*/
function approximate_path_dist(player)
{
	aiprofile_beginentry("approximate_path_dist");
	goal_pos = player.origin;
	if(isdefined(player.last_valid_position))
	{
		goal_pos = player.last_valid_position;
	}
	if(is_true(player.b_teleporting))
	{
		if(isdefined(player.teleport_location))
		{
			goal_pos = player.teleport_location;
			if(!ispointonnavmesh(goal_pos, self))
			{
				position = getclosestpointonnavmesh(goal_pos, 100, 15);
				if(isdefined(position))
				{
					goal_pos = position;
				}
			}
		}
	}
	approx_dist = pathdistance(self.origin, goal_pos, 1, self);
	aiprofile_endentry();
	return approx_dist;
}

/*
	Name: get_player_closest_to
	Namespace: zm_utility
	Checksum: 0x9DA66E59
	Offset: 0xDD38
	Size: 0x6A
	Parameters: 1
	Flags: None
*/
function get_player_closest_to(e_target)
{
	a_players = function_a1ef346b();
	arrayremovevalue(a_players, e_target);
	e_closest_player = arraygetclosest(e_target.origin, a_players);
	return e_closest_player;
}

/*
	Name: is_facing
	Namespace: zm_utility
	Checksum: 0x25FCE0F1
	Offset: 0xDDB0
	Size: 0x15C
	Parameters: 3
	Flags: None
*/
function is_facing(facee, requireddot, b_2d)
{
	if(!isdefined(requireddot))
	{
		requireddot = 0.5;
	}
	if(!isdefined(b_2d))
	{
		b_2d = 1;
	}
	orientation = self getplayerangles();
	v_forward = anglestoforward(orientation);
	v_to_facee = facee.origin - self.origin;
	if(b_2d)
	{
		v_forward_computed = (v_forward[0], v_forward[1], 0);
		v_to_facee_computed = (v_to_facee[0], v_to_facee[1], 0);
	}
	else
	{
		v_forward_computed = v_forward;
		v_to_facee_computed = v_to_facee;
	}
	v_unit_forward_computed = vectornormalize(v_forward_computed);
	v_unit_to_facee_computed = vectornormalize(v_to_facee_computed);
	dotproduct = vectordot(v_unit_forward_computed, v_unit_to_facee_computed);
	return dotproduct > requireddot;
}

/*
	Name: is_solo_ranked_game
	Namespace: zm_utility
	Checksum: 0x4D5C9DFD
	Offset: 0xDF18
	Size: 0x3C
	Parameters: 0
	Flags: None
*/
function is_solo_ranked_game()
{
	return level.players.size == 1 && getdvarint(#"zm_private_rankedmatch", 0);
}

/*
	Name: function_e63cdbef
	Namespace: zm_utility
	Checksum: 0xBBC22733
	Offset: 0xDF60
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_e63cdbef()
{
	return level.rankedmatch || getdvarint(#"zm_private_rankedmatch", 0);
}

/*
	Name: function_a3648315
	Namespace: zm_utility
	Checksum: 0x32E61B93
	Offset: 0xDFA0
	Size: 0x50
	Parameters: 0
	Flags: Linked
*/
function function_a3648315()
{
	if(!isdefined(level.var_b03a2fc8))
	{
		level.var_b03a2fc8 = new throttle();
		[[ level.var_b03a2fc8 ]]->initialize(1, 0.1);
	}
}

/*
	Name: function_ffc279
	Namespace: zm_utility
	Checksum: 0xEF70FCA3
	Offset: 0xDFF8
	Size: 0x44
	Parameters: 4
	Flags: Linked
*/
function function_ffc279(v_magnitude, e_attacker, n_damage, weapon)
{
	self thread function_315c8e4(v_magnitude, e_attacker, n_damage, weapon);
}

/*
	Name: function_315c8e4
	Namespace: zm_utility
	Checksum: 0xF4EC3514
	Offset: 0xE048
	Size: 0x104
	Parameters: 4
	Flags: Linked, Private
*/
function private function_315c8e4(v_magnitude, e_attacker, n_damage, weapon)
{
	if(!isdefined(n_damage))
	{
		n_damage = self.health;
	}
	self endon(#"death");
	if(!isdefined(weapon))
	{
		weapon = level.weaponnone;
	}
	self.var_bfffc79e = 1;
	[[ level.var_b03a2fc8 ]]->waitinqueue(self);
	self startragdoll();
	self launchragdoll(v_magnitude);
	util::wait_network_frame();
	if(isdefined(self))
	{
		self.var_bfffc79e = undefined;
		self dodamage(n_damage, self.origin, e_attacker, undefined, "none", "MOD_UNKNOWN", 0, weapon);
	}
}

/*
	Name: set_max_health
	Namespace: zm_utility
	Checksum: 0xB70551FA
	Offset: 0xE158
	Size: 0x6A
	Parameters: 1
	Flags: Linked
*/
function set_max_health(var_54cb21f6)
{
	if(!isdefined(var_54cb21f6))
	{
		var_54cb21f6 = 0;
	}
	if(self.health < self.var_66cb03ad)
	{
		self.health = self.var_66cb03ad;
	}
	if(var_54cb21f6)
	{
		if(self.health > self.var_66cb03ad)
		{
			self.health = self.var_66cb03ad;
		}
	}
}

/*
	Name: function_13cc9756
	Namespace: zm_utility
	Checksum: 0x54F98BF9
	Offset: 0xE1D0
	Size: 0xEA
	Parameters: 0
	Flags: Linked
*/
function function_13cc9756()
{
	self endon(#"death");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"zone_change");
		if(isdefined(waitresult.zone))
		{
			self.inner_zigzag_radius = waitresult.zone.inner_zigzag_radius;
			self.outer_zigzag_radius = waitresult.zone.outer_zigzag_radius;
			self.zigzag_distance_min = waitresult.zone.zigzag_distance_min;
			self.zigzag_distance_max = waitresult.zone.zigzag_distance_max;
			self.zigzag_activation_distance = waitresult.zone.zigzag_activation_distance;
			self.var_592a8227 = waitresult.zone.zigzag_enabled;
		}
	}
}

/*
	Name: function_45492cc4
	Namespace: zm_utility
	Checksum: 0x8F779A00
	Offset: 0xE2C8
	Size: 0x88
	Parameters: 1
	Flags: Linked
*/
function function_45492cc4(var_cf5e7324)
{
	if(!isdefined(var_cf5e7324))
	{
		var_cf5e7324 = 1;
	}
	if(!isdefined(self))
	{
		return 0;
	}
	if(!isdefined(self.owner))
	{
		return 0;
	}
	if(!self.classname === "script_vehicle")
	{
		return 0;
	}
	if(var_cf5e7324 && isplayer(self.owner))
	{
		return 1;
	}
	return isdefined(self.owner);
}

/*
	Name: function_1a4d2910
	Namespace: zm_utility
	Checksum: 0xCB1F6995
	Offset: 0xE358
	Size: 0xAE
	Parameters: 0
	Flags: Linked
*/
function function_1a4d2910()
{
	if(isdefined(level.var_2456c78a))
	{
		foreach(var_92254a2f in level.var_2456c78a)
		{
			if(distancesquared(self.origin, var_92254a2f) < 10000)
			{
				return true;
			}
		}
	}
	return false;
}

/*
	Name: function_64259898
	Namespace: zm_utility
	Checksum: 0x41A5DC2E
	Offset: 0xE410
	Size: 0x96
	Parameters: 2
	Flags: None
*/
function function_64259898(position, search_radius)
{
	if(!isdefined(search_radius))
	{
		search_radius = 128;
	}
	goal_pos = getclosestpointonnavmesh(position, search_radius, self getpathfindingradius());
	if(isdefined(goal_pos))
	{
		self setgoal(goal_pos);
		return true;
	}
	self setgoal(self.origin);
	return false;
}

/*
	Name: function_372a1e12
	Namespace: zm_utility
	Checksum: 0xC7988216
	Offset: 0xE4B0
	Size: 0xFE
	Parameters: 0
	Flags: None
*/
function function_372a1e12()
{
	a_e_players = getplayers();
	e_least_hunted = undefined;
	foreach(e_player in a_e_players)
	{
		if(!isdefined(e_player.hunted_by))
		{
			e_player.hunted_by = 0;
		}
		if(!is_player_valid(e_player))
		{
			continue;
		}
		if(!isdefined(e_least_hunted) || e_player.hunted_by < e_least_hunted.hunted_by)
		{
			e_least_hunted = e_player;
		}
	}
	return e_least_hunted;
}

/*
	Name: function_d7db256e
	Namespace: zm_utility
	Checksum: 0x31A4328D
	Offset: 0xE5B8
	Size: 0xB8
	Parameters: 4
	Flags: None
*/
function function_d7db256e(var_eaf129a0, var_6cc77d4e, var_888cf948, var_b96be97f)
{
	if(!isdefined(var_888cf948))
	{
		var_888cf948 = 1;
	}
	if(!isdefined(var_b96be97f))
	{
		var_b96be97f = undefined;
	}
	if(isdefined(var_6cc77d4e))
	{
		var_1b808f25 = struct::get(var_eaf129a0);
		n_obj_id = function_f5a222a8(var_6cc77d4e, var_1b808f25.origin, var_b96be97f);
	}
	if(var_888cf948)
	{
		level thread function_75fd65f9(var_eaf129a0, 1);
	}
	return n_obj_id;
}

/*
	Name: function_b1f3be5c
	Namespace: zm_utility
	Checksum: 0xBD5F6C3A
	Offset: 0xE678
	Size: 0x54
	Parameters: 2
	Flags: None
*/
function function_b1f3be5c(n_obj_id, var_eaf129a0)
{
	if(isdefined(n_obj_id))
	{
		function_bc5a54a8(n_obj_id);
	}
	level thread function_75fd65f9(var_eaf129a0, 0);
}

/*
	Name: function_ba39d198
	Namespace: zm_utility
	Checksum: 0x9755B548
	Offset: 0xE6D8
	Size: 0x6C
	Parameters: 2
	Flags: None
*/
function function_ba39d198(n_obj_id, b_show)
{
	if(!isdefined(b_show))
	{
		b_show = 1;
	}
	if(isdefined(n_obj_id))
	{
		if(b_show)
		{
			objective_setvisibletoplayer(n_obj_id, self);
		}
		else
		{
			objective_setinvisibletoplayer(n_obj_id, self);
		}
	}
}

/*
	Name: function_f5a222a8
	Namespace: zm_utility
	Checksum: 0xBE248937
	Offset: 0xE750
	Size: 0x1A0
	Parameters: 4
	Flags: Linked
*/
function function_f5a222a8(var_6cc77d4e, v_origin_or_ent, var_c87f9ad7, params)
{
	n_obj_id = gameobjects::get_next_obj_id();
	function_ff902863(var_6cc77d4e, n_obj_id, 1);
	if(isentity(v_origin_or_ent) || isvec(v_origin_or_ent))
	{
		objective_add(n_obj_id, "active", v_origin_or_ent, var_6cc77d4e);
	}
	else if(isstruct(v_origin_or_ent))
	{
		objective_add(n_obj_id, "active", v_origin_or_ent.origin, var_6cc77d4e);
	}
	function_6da98133(n_obj_id);
	if(isdefined(var_c87f9ad7))
	{
		level thread function_f23721f4(n_obj_id, v_origin_or_ent, var_c87f9ad7, params);
	}
	if(!isdefined(level.var_e63703cd[n_obj_id]))
	{
		level.var_e63703cd[n_obj_id] = {#params:params, #hash_c87f9ad7:var_c87f9ad7, #v_origin_or_ent:v_origin_or_ent, #hash_6cc77d4e:var_6cc77d4e};
	}
	return n_obj_id;
}

/*
	Name: function_f23721f4
	Namespace: zm_utility
	Checksum: 0x81403ABC
	Offset: 0xE8F8
	Size: 0xD8
	Parameters: 4
	Flags: Linked, Private
*/
function private function_f23721f4(n_obj_id, v_origin_or_ent, var_c87f9ad7, params)
{
	level flag::wait_till("start_zombie_round_logic");
	foreach(player in getplayers())
	{
		player thread function_71071944(n_obj_id, v_origin_or_ent, var_c87f9ad7, params);
	}
}

/*
	Name: function_4a4cf79a
	Namespace: zm_utility
	Checksum: 0x24CD8A93
	Offset: 0xE9D8
	Size: 0x4A
	Parameters: 3
	Flags: Linked
*/
function function_4a4cf79a(var_6cc77d4e, v_origin_or_ent, params)
{
	n_obj_id = function_f5a222a8(var_6cc77d4e, v_origin_or_ent, &function_15f72a68, params);
	return n_obj_id;
}

/*
	Name: function_71071944
	Namespace: zm_utility
	Checksum: 0x1A20031A
	Offset: 0xEA30
	Size: 0x250
	Parameters: 4
	Flags: Linked, Private
*/
function private function_71071944(n_obj_id, v_origin_or_ent, var_c87f9ad7, params)
{
	self notify("cleanup_zm_objective_id_" + n_obj_id);
	level endon(#"end_game", "cleanup_zm_objective_id_" + n_obj_id);
	self endon(#"disconnect", "cleanup_zm_objective_id_" + n_obj_id);
	n_ent_num = self getentitynumber();
	if(!isdefined(level.var_cef2e607[#"hash_6aca065fb0d8bfbf"]))
	{
		level.var_cef2e607[#"hash_6aca065fb0d8bfbf"] = -1;
	}
	level.var_cef2e607[#"hash_6aca065fb0d8bfbf"]++;
	wait((float(function_60d95f53()) / 1000) * ((level.var_cef2e607[#"hash_6aca065fb0d8bfbf"] % (int(0.5 / (float(function_60d95f53()) / 1000)))) + 1));
	var_cb46b9ea = {};
	while(true)
	{
		[[ level.var_75b29eed ]]->waitinqueue(var_cb46b9ea);
		if(is_true(level.var_e63703cd[n_obj_id].var_d0d552ea[n_ent_num]))
		{
			wait(0.5);
			continue;
		}
		if(self [[var_c87f9ad7]](v_origin_or_ent, params))
		{
			objective_setvisibletoplayer(n_obj_id, self);
		}
		else
		{
			objective_setinvisibletoplayer(n_obj_id, self);
		}
		wait(0.5);
	}
}

/*
	Name: function_e8f4d47b
	Namespace: zm_utility
	Checksum: 0x7F98C4ED
	Offset: 0xEC88
	Size: 0x188
	Parameters: 3
	Flags: Linked
*/
function function_e8f4d47b(a_players, n_obj_id, b_disable)
{
	if(!isdefined(b_disable))
	{
		b_disable = 1;
	}
	if(!isdefined(a_players))
	{
		a_players = [];
	}
	else if(!isarray(a_players))
	{
		a_players = array(a_players);
	}
	if(isdefined(level.var_e63703cd[n_obj_id]))
	{
		if(!isdefined(level.var_e63703cd[n_obj_id].var_d0d552ea))
		{
			level.var_e63703cd[n_obj_id].var_d0d552ea = [];
		}
		foreach(player in a_players)
		{
			n_ent_num = player getentitynumber();
			if(b_disable)
			{
				level.var_e63703cd[n_obj_id].var_d0d552ea[n_ent_num] = 1;
				continue;
			}
			level.var_e63703cd[n_obj_id].var_d0d552ea[n_ent_num] = undefined;
		}
	}
}

/*
	Name: function_15f72a68
	Namespace: zm_utility
	Checksum: 0xF60467BE
	Offset: 0xEE18
	Size: 0x104
	Parameters: 2
	Flags: Linked, Private
*/
function private function_15f72a68(v_origin_or_ent, params)
{
	if(isentity(v_origin_or_ent) || isstruct(v_origin_or_ent))
	{
		v_pos = v_origin_or_ent.origin;
		if(isdefined(v_origin_or_ent.var_8d3fc50c) && v_origin_or_ent.var_8d3fc50c > 0)
		{
			var_8d3fc50c = v_origin_or_ent.var_8d3fc50c;
		}
	}
	else
	{
		v_pos = v_origin_or_ent;
	}
	if(!isdefined(var_8d3fc50c))
	{
		var_8d3fc50c = (isdefined(params.var_5068abe1) ? params.var_5068abe1 : 160);
	}
	if((abs(self.origin[2] - v_pos[2])) <= var_8d3fc50c)
	{
		return true;
	}
	return false;
}

/*
	Name: function_bc5a54a8
	Namespace: zm_utility
	Checksum: 0x308211EF
	Offset: 0xEF28
	Size: 0xA4
	Parameters: 1
	Flags: Linked
*/
function function_bc5a54a8(n_obj_id)
{
	level notify("cleanup_zm_objective_id_" + n_obj_id);
	function_ff902863(undefined, n_obj_id, 0);
	gameobjects::release_obj_id(n_obj_id);
	objective_delete(n_obj_id);
	if(isdefined(level.var_e63703cd[n_obj_id]))
	{
		arrayremoveindex(level.var_e63703cd, n_obj_id, 1);
	}
}

/*
	Name: function_ff902863
	Namespace: zm_utility
	Checksum: 0xCE7B7B0C
	Offset: 0xEFD8
	Size: 0x11C
	Parameters: 3
	Flags: Linked
*/
function function_ff902863(var_6cc77d4e, n_obj_id, var_3a9f00e9)
{
	if(!isdefined(var_3a9f00e9))
	{
		var_3a9f00e9 = 1;
	}
	if(!isdefined(var_6cc77d4e))
	{
		var_6cc77d4e = level.var_e63703cd[n_obj_id].var_6cc77d4e;
	}
	if(var_3a9f00e9)
	{
		s_objective = {#hash_3dce3470:function_f8d53445(), #hash_f81e2f33:n_obj_id, #hash_f23c87bd:var_6cc77d4e};
	}
	else
	{
		s_objective = {#hash_84820801:function_f8d53445(), #hash_9a059624:n_obj_id, #hash_81d2684e:var_6cc77d4e};
	}
	function_92d1707f(#"hash_57cacfb95186806d", s_objective);
}

/*
	Name: function_452938ed
	Namespace: zm_utility
	Checksum: 0x956E518F
	Offset: 0xF100
	Size: 0x14C
	Parameters: 1
	Flags: None
*/
function function_452938ed(params)
{
	/#
		if(int(params.value))
		{
			if(isarray(level.var_e63703cd))
			{
				println(("" + level.var_e63703cd.size) + "");
				foreach(n_obj_id, s_objective in level.var_e63703cd)
				{
					println((("" + n_obj_id) + "") + function_9e72a96(s_objective.var_6cc77d4e));
				}
			}
			setdvar(params.name, 0);
		}
	#/
}

/*
	Name: function_3ba26955
	Namespace: zm_utility
	Checksum: 0x20D3EA6B
	Offset: 0xF258
	Size: 0xB8
	Parameters: 0
	Flags: Linked
*/
function function_3ba26955()
{
	foreach(n_obj_id, var_1b589e4c in level.var_e63703cd)
	{
		if(isdefined(var_1b589e4c.var_c87f9ad7))
		{
			self thread function_71071944(n_obj_id, var_1b589e4c.v_origin_or_ent, var_1b589e4c.var_c87f9ad7, var_1b589e4c.params);
		}
	}
}

/*
	Name: function_75fd65f9
	Namespace: zm_utility
	Checksum: 0x1B5E09B4
	Offset: 0xF318
	Size: 0x1D0
	Parameters: 2
	Flags: Linked
*/
function function_75fd65f9(str_targetname, b_enable)
{
	if(!isdefined(b_enable))
	{
		b_enable = 1;
	}
	if(!isdefined(str_targetname))
	{
		return;
	}
	var_f8f0b389 = struct::get(str_targetname);
	var_2a7c782 = [];
	var_77cd2496 = [];
	if(isdefined(var_f8f0b389.target))
	{
		var_2a7c782 = struct::get_array(var_f8f0b389.target);
		var_77cd2496 = getentarray(var_f8f0b389.target, "targetname");
		if(b_enable)
		{
			showmiscmodels(var_f8f0b389.target);
		}
		else
		{
			hidemiscmodels(var_f8f0b389.target);
		}
	}
	foreach(var_86802380 in var_77cd2496)
	{
		if(b_enable)
		{
			var_86802380 show();
			var_86802380 notsolid();
			continue;
		}
		var_86802380 hide();
		var_86802380 notsolid();
	}
}

/*
	Name: function_ebb2f490
	Namespace: zm_utility
	Checksum: 0xC7C5AC46
	Offset: 0xF4F0
	Size: 0x186
	Parameters: 0
	Flags: Linked
*/
function function_ebb2f490()
{
	var_400c259d = self getweaponslistprimaries();
	var_dc69b88b = [];
	foreach(var_5d22227d in var_400c259d)
	{
		if(!isdefined(var_dc69b88b))
		{
			var_dc69b88b = [];
		}
		else if(!isarray(var_dc69b88b))
		{
			var_dc69b88b = array(var_dc69b88b);
		}
		var_dc69b88b[var_dc69b88b.size] = zm_weapons::function_93cd8e76(var_5d22227d);
		if(var_5d22227d.splitweapon != level.weaponnone)
		{
			if(!isdefined(var_dc69b88b))
			{
				var_dc69b88b = [];
			}
			else if(!isarray(var_dc69b88b))
			{
				var_dc69b88b = array(var_dc69b88b);
			}
			var_dc69b88b[var_dc69b88b.size] = zm_weapons::function_93cd8e76(var_5d22227d.splitweapon);
		}
	}
	return var_dc69b88b;
}

/*
	Name: function_aa45670f
	Namespace: zm_utility
	Checksum: 0x5BB4A927
	Offset: 0xF680
	Size: 0xCE
	Parameters: 2
	Flags: None
*/
function function_aa45670f(weapon, var_3a36e0dc)
{
	root_weapon = zm_weapons::function_93cd8e76(weapon);
	if(isdefined(self.var_f6d3c3[var_3a36e0dc]) && isinarray(self.var_f6d3c3[var_3a36e0dc], root_weapon))
	{
		var_dc69b88b = function_ebb2f490();
		if(isinarray(var_dc69b88b, root_weapon) || zm_weapons::function_93cd8e76(self.currentweapon) === root_weapon)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_28ee38f4
	Namespace: zm_utility
	Checksum: 0xC5E649A6
	Offset: 0xF758
	Size: 0x24C
	Parameters: 3
	Flags: None
*/
function function_28ee38f4(weapon, var_3a36e0dc, var_87f6ae5)
{
	root_weapon = zm_weapons::function_93cd8e76(weapon);
	if(isdefined(self.var_f6d3c3[var_3a36e0dc]) && isinarray(self.var_f6d3c3[var_3a36e0dc], root_weapon))
	{
		return false;
	}
	var_dc69b88b = function_ebb2f490();
	if(isinarray(var_dc69b88b, root_weapon) || zm_weapons::function_93cd8e76(self.currentweapon) === root_weapon)
	{
		if(!isdefined(self.var_f6d3c3[var_3a36e0dc]))
		{
			self.var_f6d3c3[var_3a36e0dc] = [];
		}
		else if(!isarray(self.var_f6d3c3[var_3a36e0dc]))
		{
			self.var_f6d3c3[var_3a36e0dc] = array(self.var_f6d3c3[var_3a36e0dc]);
		}
		self.var_f6d3c3[var_3a36e0dc][self.var_f6d3c3[var_3a36e0dc].size] = root_weapon;
		if(root_weapon.splitweapon !== level.weaponnone)
		{
			if(!isdefined(self.var_f6d3c3[var_3a36e0dc]))
			{
				self.var_f6d3c3[var_3a36e0dc] = [];
			}
			else if(!isarray(self.var_f6d3c3[var_3a36e0dc]))
			{
				self.var_f6d3c3[var_3a36e0dc] = array(self.var_f6d3c3[var_3a36e0dc]);
			}
			self.var_f6d3c3[var_3a36e0dc][self.var_f6d3c3[var_3a36e0dc].size] = root_weapon.splitweapon;
		}
		self thread function_13f40482();
		if(var_87f6ae5)
		{
			self zm_weapons::ammo_give(weapon);
		}
		return true;
	}
	return false;
}

/*
	Name: function_18ce0c8
	Namespace: zm_utility
	Checksum: 0x7602F2C5
	Offset: 0xF9B0
	Size: 0xF0
	Parameters: 2
	Flags: Linked
*/
function function_18ce0c8(weapon, var_3a36e0dc)
{
	root_weapon = zm_weapons::function_93cd8e76(weapon);
	if(!isdefined(self.var_f6d3c3[var_3a36e0dc]) || !isinarray(self.var_f6d3c3[var_3a36e0dc], root_weapon))
	{
		return;
	}
	self.var_f6d3c3[var_3a36e0dc] = array::exclude(self.var_f6d3c3[var_3a36e0dc], root_weapon);
	if(root_weapon.splitweapon != level.weaponnone)
	{
		self.var_f6d3c3[var_3a36e0dc] = array::exclude(self.var_f6d3c3[var_3a36e0dc], root_weapon.splitweapon);
	}
}

/*
	Name: function_13f40482
	Namespace: zm_utility
	Checksum: 0x8DFF6A67
	Offset: 0xFAA8
	Size: 0x174
	Parameters: 0
	Flags: Linked
*/
function function_13f40482()
{
	self notify("368f53c00c4d025d");
	self endon("368f53c00c4d025d");
	self endon(#"disconnect");
	while(true)
	{
		self waittill(#"weapon_change");
		if(self scene::function_c935c42() || level flag::get("round_reset"))
		{
			continue;
		}
		var_dc69b88b = function_ebb2f490();
		for(i = 0; i < 1; i++)
		{
			foreach(var_406a430d in self.var_f6d3c3[i])
			{
				if(!isinarray(var_dc69b88b, var_406a430d))
				{
					self function_18ce0c8(var_406a430d, i);
				}
			}
		}
	}
}

/*
	Name: function_fdb0368
	Namespace: zm_utility
	Checksum: 0xD4206C5C
	Offset: 0xFC28
	Size: 0x8E
	Parameters: 2
	Flags: Linked
*/
function function_fdb0368(n_round_number, str_endon)
{
	if(isdefined(str_endon))
	{
		self endon(str_endon);
	}
	if(!isdefined(level.round_number) || level.round_number < n_round_number)
	{
		while(true)
		{
			s_waitresult = undefined;
			s_waitresult = level waittill(#"start_of_round");
			if(s_waitresult.n_round_number >= n_round_number)
			{
				return;
			}
		}
	}
}

/*
	Name: function_9ad5aeb1
	Namespace: zm_utility
	Checksum: 0xF5AB095E
	Offset: 0xFCC0
	Size: 0x598
	Parameters: 6
	Flags: Linked
*/
function function_9ad5aeb1(var_a8d0b313, var_82ea43f2, b_hide_body, var_b0e62e21, var_814b69d3, var_87c98387)
{
	if(!isdefined(var_a8d0b313))
	{
		var_a8d0b313 = 1;
	}
	if(!isdefined(var_82ea43f2))
	{
		var_82ea43f2 = 1;
	}
	if(!isdefined(b_hide_body))
	{
		b_hide_body = 0;
	}
	if(!isdefined(var_b0e62e21))
	{
		var_b0e62e21 = 1;
	}
	if(!isdefined(var_814b69d3))
	{
		var_814b69d3 = 1;
	}
	if(!isdefined(var_87c98387))
	{
		var_87c98387 = "white";
	}
	var_4b9821e4 = 0;
	a_players = function_a1ef346b();
	foreach(player in a_players)
	{
		player val::set(#"hash_2f1b514922b9901e", "takedamage", 0);
	}
	if(!isarray(var_b0e62e21))
	{
		if(var_b0e62e21)
		{
			if(var_814b69d3)
			{
				level thread lui::screen_flash(1, 1, 0.5, 1, var_87c98387);
			}
			else
			{
				level thread lui::screen_flash(0.2, 0.5, 1, 0.8, var_87c98387);
			}
		}
	}
	else
	{
		var_72487f42 = var_b0e62e21[0];
		n_hold = var_b0e62e21[1];
		var_7012f1e9 = var_b0e62e21[2];
		n_alpha = array(0.8, 1)[var_814b69d3];
		level thread lui::screen_flash(var_72487f42, n_hold, var_7012f1e9, n_alpha, var_87c98387);
	}
	foreach(ai in getaiteamarray(level.zombie_team))
	{
		if(isalive(ai) && !is_true(ai.var_d45ca662) && !is_true(ai.marked_for_death))
		{
			if(var_a8d0b313)
			{
				ai zm_cleanup::function_23621259(0);
			}
			if(var_82ea43f2 || ai.var_6f84b820 !== #"normal")
			{
				if(is_magic_bullet_shield_enabled(ai))
				{
					ai util::stop_magic_bullet_shield();
				}
				ai.allowdeath = 1;
				ai.no_powerups = 1;
				ai.deathpoints_already_given = 1;
				ai.marked_for_death = 1;
				if(!b_hide_body && ai.var_6f84b820 === #"normal" && var_4b9821e4 < 6)
				{
					var_4b9821e4++;
					ai thread zombie_death::flame_death_fx();
					if(!is_true(ai.no_gib))
					{
						ai zombie_utility::zombie_head_gib();
					}
				}
				ai dodamage(ai.health + 666, ai.origin);
				if(b_hide_body)
				{
					ai hide();
					ai notsolid();
				}
			}
			else
			{
				ai delete();
			}
		}
		waitframe(1);
	}
	foreach(player in a_players)
	{
		if(isdefined(player))
		{
			player val::reset(#"hash_2f1b514922b9901e", "takedamage");
		}
	}
}

/*
	Name: function_508f636d
	Namespace: zm_utility
	Checksum: 0xC5286BB7
	Offset: 0x10260
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function function_508f636d()
{
	level function_9ad5aeb1(0, 1, 0, 1, "black");
}

/*
	Name: function_850e7499
	Namespace: zm_utility
	Checksum: 0x5B6A9A98
	Offset: 0x10298
	Size: 0xB2
	Parameters: 2
	Flags: Linked
*/
function function_850e7499(weapon, var_20c27a34)
{
	if(!isdefined(var_20c27a34))
	{
		var_20c27a34 = 0;
	}
	if(weapon === getweapon(#"eq_wraith_fire") || weapon === getweapon(#"eq_wraith_fire_extra"))
	{
		return true;
	}
	if(var_20c27a34 && weapon === getweapon(#"wraith_fire_fire"))
	{
		return true;
	}
	return false;
}

/*
	Name: is_claymore
	Namespace: zm_utility
	Checksum: 0x66AD8938
	Offset: 0x10358
	Size: 0x6A
	Parameters: 1
	Flags: Linked
*/
function is_claymore(weapon)
{
	if(weapon === getweapon(#"claymore") || weapon === getweapon(#"claymore_extra"))
	{
		return true;
	}
	return false;
}

/*
	Name: function_b797694c
	Namespace: zm_utility
	Checksum: 0xE0DE5A05
	Offset: 0x103D0
	Size: 0x6A
	Parameters: 1
	Flags: Linked
*/
function function_b797694c(weapon)
{
	if(weapon === getweapon(#"eq_acid_bomb") || weapon === getweapon(#"eq_acid_bomb_extra"))
	{
		return true;
	}
	return false;
}

/*
	Name: is_frag_grenade
	Namespace: zm_utility
	Checksum: 0x947224A5
	Offset: 0x10448
	Size: 0x6A
	Parameters: 1
	Flags: Linked
*/
function is_frag_grenade(weapon)
{
	if(weapon === getweapon(#"eq_frag_grenade") || weapon === getweapon(#"eq_frag_grenade_extra"))
	{
		return true;
	}
	return false;
}

/*
	Name: is_mini_turret
	Namespace: zm_utility
	Checksum: 0x88A853C3
	Offset: 0x104C0
	Size: 0x8A
	Parameters: 2
	Flags: Linked
*/
function is_mini_turret(weapon, var_b69165c7)
{
	if(!isdefined(var_b69165c7))
	{
		var_b69165c7 = 0;
	}
	if(weapon === getweapon(#"mini_turret"))
	{
		return true;
	}
	if(var_b69165c7 && weapon === getweapon(#"gun_mini_turret"))
	{
		return true;
	}
	return false;
}

/*
	Name: function_a2541519
	Namespace: zm_utility
	Checksum: 0x1A9AE50F
	Offset: 0x10558
	Size: 0x2E
	Parameters: 1
	Flags: Linked
*/
function function_a2541519(var_da4af4df)
{
	if(is_standard())
	{
		var_da4af4df = level.var_aaf21bbb;
	}
	return var_da4af4df;
}

/*
	Name: function_4a25b584
	Namespace: zm_utility
	Checksum: 0x2AA99382
	Offset: 0x10590
	Size: 0x564
	Parameters: 8
	Flags: None
*/
function function_4a25b584(v_start_pos, var_487ba56d, n_radius, b_randomize, var_79ced64, n_half_height, var_21aae2c6, var_a5b5d950)
{
	if(!isdefined(n_radius))
	{
		n_radius = 512;
	}
	if(!isdefined(b_randomize))
	{
		b_randomize = 1;
	}
	if(!isdefined(var_79ced64))
	{
		var_79ced64 = 0.2;
	}
	if(!isdefined(n_half_height))
	{
		n_half_height = 4;
	}
	if(!isdefined(var_21aae2c6))
	{
		var_21aae2c6 = undefined;
	}
	level endon(#"end_game");
	var_bf08dccd = [];
	v_start_pos = groundtrace(v_start_pos + vectorscale((0, 0, 1), 8), v_start_pos + (vectorscale((0, 0, -1), 100000)), 0, undefined)[#"position"];
	if(isdefined(var_21aae2c6))
	{
		s_result = positionquery_source_navigation(var_21aae2c6, 32, n_radius, n_half_height, 16, 1, 32);
	}
	else
	{
		s_result = positionquery_source_navigation(v_start_pos, 32, n_radius, n_half_height, 16, 1, 32);
	}
	if(isdefined(s_result) && isarray(s_result.data))
	{
		if(b_randomize)
		{
			s_result.data = array::randomize(s_result.data);
		}
		foreach(var_c310df8c in s_result.data)
		{
			if(function_25e3484e(var_c310df8c.origin, 24, var_bf08dccd))
			{
				var_7a4cb7eb = var_c310df8c.origin;
				n_height_diff = abs(var_7a4cb7eb[2] - v_start_pos[2]);
				if(n_height_diff > 60)
				{
					continue;
				}
				if(!isdefined(var_bf08dccd))
				{
					var_bf08dccd = [];
				}
				else if(!isarray(var_bf08dccd))
				{
					var_bf08dccd = array(var_bf08dccd);
				}
				var_bf08dccd[var_bf08dccd.size] = var_7a4cb7eb;
				if(var_bf08dccd.size > var_487ba56d + 20)
				{
					break;
				}
			}
		}
	}
	if(b_randomize)
	{
		var_bf08dccd = array::randomize(var_bf08dccd);
	}
	level.var_ec45f213 = 0;
	switch(level.players.size)
	{
		case 1:
		{
			var_487ba56d = int(var_487ba56d * 0.5);
			break;
		}
		case 2:
		{
			var_487ba56d = int(var_487ba56d * 0.75);
			break;
		}
	}
	if(var_487ba56d > var_bf08dccd.size)
	{
		var_487ba56d = var_bf08dccd.size;
	}
	var_487ba56d = int(max(var_487ba56d, 1));
	for(i = 0; i < var_487ba56d; i++)
	{
		e_powerup = function_ce46d95e(v_start_pos, 0, 0, 1);
		if(!isdefined(e_powerup))
		{
			continue;
		}
		if(isdefined(var_a5b5d950))
		{
			e_powerup setmodel(var_a5b5d950);
		}
		if(isdefined(var_bf08dccd[i]))
		{
			var_96bdce8a = length(v_start_pos - var_bf08dccd[i]);
			n_move_time = e_powerup fake_physicslaunch(var_bf08dccd[i] + vectorscale((0, 0, 1), 35), var_96bdce8a);
		}
		else
		{
			n_move_time = e_powerup fake_physicslaunch(v_start_pos + vectorscale((0, 0, 1), 35), n_radius / 3.5);
		}
		if(isdefined(level.var_b4ff4ec))
		{
			e_powerup thread [[level.var_b4ff4ec]](n_move_time);
		}
		wait(var_79ced64);
	}
	if(is_standard())
	{
		level.var_ec45f213 = 1;
	}
}

/*
	Name: function_25e3484e
	Namespace: zm_utility
	Checksum: 0xB06541EA
	Offset: 0x10B00
	Size: 0x160
	Parameters: 3
	Flags: Linked
*/
function function_25e3484e(v_pos, n_spacing, var_3e807a14)
{
	if(!isdefined(n_spacing))
	{
		n_spacing = 400;
	}
	var_91890e6 = zm_powerups::get_powerups(v_pos, n_spacing);
	if(var_91890e6.size > 0)
	{
		return false;
	}
	if(isarray(var_3e807a14))
	{
		foreach(var_a8f85c02 in var_3e807a14)
		{
			if(distance(v_pos, var_a8f85c02) < n_spacing)
			{
				return false;
			}
		}
	}
	if(isdefined(level.var_3e96c707))
	{
		if(![[level.var_3e96c707]](v_pos))
		{
			return false;
		}
	}
	if(check_point_in_playable_area(v_pos) && check_point_in_enabled_zone(v_pos))
	{
		return true;
	}
	return false;
}

/*
	Name: function_ce46d95e
	Namespace: zm_utility
	Checksum: 0x111AB3D4
	Offset: 0x10C68
	Size: 0x112
	Parameters: 4
	Flags: Linked
*/
function function_ce46d95e(v_origin, b_permanent, var_4ecce348, var_9a5654a5)
{
	if(!isdefined(b_permanent))
	{
		b_permanent = 1;
	}
	if(!isdefined(var_4ecce348))
	{
		var_4ecce348 = 1;
	}
	if(var_4ecce348)
	{
		while(level.active_powerups.size >= 75)
		{
			waitframe(1);
		}
	}
	if(level.active_powerups.size < 75)
	{
		e_powerup = zm_powerups::specific_powerup_drop("bonus_points_player", v_origin, undefined, var_9a5654a5, undefined, b_permanent, 1);
		if(isdefined(e_powerup))
		{
			if(isdefined(level.var_48e2ab90))
			{
				e_powerup setscale(level.var_48e2ab90);
			}
			if(isdefined(level.var_6463d67c))
			{
				e_powerup.var_258c5fbc = level.var_6463d67c;
			}
		}
	}
	return e_powerup;
}

/*
	Name: is_jumping
	Namespace: zm_utility
	Checksum: 0x9D734957
	Offset: 0x10D88
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function is_jumping()
{
	ground_ent = self getgroundent();
	return !isdefined(ground_ent);
}

/*
	Name: function_9f7fd525
	Namespace: zm_utility
	Checksum: 0xE8D01DDE
	Offset: 0x10DC0
	Size: 0x272
	Parameters: 3
	Flags: None
*/
function function_9f7fd525(var_c61df77f, a_str_zones, var_a6f0ec9f)
{
	if(!isdefined(var_c61df77f))
	{
		var_c61df77f = "zombie_location";
	}
	if(!isdefined(var_a6f0ec9f))
	{
		var_a6f0ec9f = 1;
	}
	a_s_locs = [];
	if(isdefined(a_str_zones))
	{
		if(!isdefined(a_str_zones))
		{
			a_str_zones = [];
		}
		else if(!isarray(a_str_zones))
		{
			a_str_zones = array(a_str_zones);
		}
		if(var_a6f0ec9f)
		{
			var_5386ca1d = level.zm_loc_types[var_c61df77f];
		}
		else
		{
			var_5386ca1d = struct::get_array("spawn_location", "script_noteworthy");
		}
		foreach(str_zone in a_str_zones)
		{
			foreach(s_loc in var_5386ca1d)
			{
				if(str_zone === s_loc.zone_name)
				{
					if(!isdefined(a_s_locs))
					{
						a_s_locs = [];
					}
					else if(!isarray(a_s_locs))
					{
						a_s_locs = array(a_s_locs);
					}
					if(!isinarray(a_s_locs, s_loc))
					{
						a_s_locs[a_s_locs.size] = s_loc;
					}
				}
			}
		}
	}
	else
	{
		if(var_a6f0ec9f)
		{
			var_5386ca1d = level.zm_loc_types[var_c61df77f];
		}
		else
		{
			var_5386ca1d = struct::get_array("spawn_location", "script_noteworthy");
		}
	}
	return a_s_locs;
}

/*
	Name: function_7618c8ef
	Namespace: zm_utility
	Checksum: 0xECE7F9EC
	Offset: 0x11040
	Size: 0xC2
	Parameters: 1
	Flags: None
*/
function function_7618c8ef(var_6e4c63cc)
{
	if(!isdefined(var_6e4c63cc))
	{
		var_6e4c63cc = 0.0667;
	}
	n_damage_multiplier = 1;
	if(is_true(self.ignore_health_regen_delay))
	{
		n_damage_multiplier = n_damage_multiplier + 1.25;
		if(self hasperk(#"hash_7f98b3dd3cce95aa"))
		{
			n_damage_multiplier = n_damage_multiplier + 0.75;
		}
	}
	var_16e6b8ea = int((self.maxhealth * var_6e4c63cc) * n_damage_multiplier);
	return var_16e6b8ea;
}

/*
	Name: function_10e38d86
	Namespace: zm_utility
	Checksum: 0xEF197776
	Offset: 0x11110
	Size: 0x42
	Parameters: 0
	Flags: Linked
*/
function function_10e38d86()
{
	if(function_c200446c())
	{
		return getscriptbundle("zombie_onslaught_vars_settings");
	}
	return getscriptbundle("zombie_vars_settings");
}

/*
	Name: function_36eb0acc
	Namespace: zm_utility
	Checksum: 0x415D2DA
	Offset: 0x11160
	Size: 0x25A
	Parameters: 1
	Flags: Linked
*/
function function_36eb0acc(var_13f9dee7)
{
	if(!isdefined(var_13f9dee7))
	{
		var_13f9dee7 = #"none";
	}
	switch(var_13f9dee7)
	{
		case "none":
		{
			self clientfield::set("model_rarity_rob", 1);
			break;
		}
		case "resource":
		case "white":
		{
			self clientfield::set("model_rarity_rob", 2);
			break;
		}
		case "green":
		case "uncommon":
		{
			self clientfield::set("model_rarity_rob", 3);
			break;
		}
		case "blue":
		case "rare":
		{
			self clientfield::set("model_rarity_rob", 4);
			break;
		}
		case "purple":
		case "epic":
		{
			self clientfield::set("model_rarity_rob", 5);
			break;
		}
		case "orange":
		case "legendary":
		{
			self clientfield::set("model_rarity_rob", 6);
			break;
		}
		case "yellow":
		case "ultra":
		case "gold":
		{
			self clientfield::set("model_rarity_rob", 7);
			break;
		}
		default:
		{
			self clientfield::set("model_rarity_rob", 0);
		}
	}
}

/*
	Name: function_e3025ca5
	Namespace: zm_utility
	Checksum: 0x9308B808
	Offset: 0x113C8
	Size: 0x6A
	Parameters: 0
	Flags: Linked
*/
function function_e3025ca5()
{
	if(is_survival())
	{
		var_3afe334f = level.var_b48509f9;
	}
	else
	{
		var_3afe334f = ceil(level.round_number / 5);
	}
	return int(var_3afe334f);
}

/*
	Name: get_round_number
	Namespace: zm_utility
	Checksum: 0x945BAB6D
	Offset: 0x11440
	Size: 0x14A
	Parameters: 1
	Flags: Linked
*/
function get_round_number(var_ec585b8)
{
	if(!isdefined(var_ec585b8))
	{
		var_ec585b8 = 0;
	}
	if(is_survival())
	{
		var_88710b09 = zombie_utility::function_d2dfacfd(#"hash_6ba259e60f87bb15");
		if(var_ec585b8 > 0)
		{
			n_round_number = (isdefined(var_88710b09[var_ec585b8 - 1].round) ? var_88710b09[var_ec585b8 - 1].round : 0);
		}
		else
		{
			n_round_number = (isdefined(var_88710b09[level.var_b48509f9 - 1].round) ? var_88710b09[level.var_b48509f9 - 1].round : 0);
		}
	}
	else
	{
		if(function_c200446c())
		{
			return level.wave_number;
		}
		n_round_number = (isdefined(self._starting_round_number) ? self._starting_round_number : level.round_number);
	}
	return int(n_round_number);
}

/*
	Name: function_747180ea
	Namespace: zm_utility
	Checksum: 0x47B1793F
	Offset: 0x11598
	Size: 0xA4
	Parameters: 4
	Flags: Linked
*/
function function_747180ea(var_8861fa85, n_radius, trigger, var_ab426dbb)
{
	if(!isdefined(n_radius))
	{
		n_radius = 64;
	}
	if(!isdefined(var_ab426dbb))
	{
		var_ab426dbb = 0;
	}
	if(!isdefined(var_8861fa85))
	{
		var_8861fa85 = [];
	}
	else if(!isarray(var_8861fa85))
	{
		var_8861fa85 = array(var_8861fa85);
	}
	self thread function_e1a11b1(var_8861fa85, n_radius, trigger, var_ab426dbb);
}

/*
	Name: function_e1a11b1
	Namespace: zm_utility
	Checksum: 0x9439658A
	Offset: 0x11648
	Size: 0x44C
	Parameters: 4
	Flags: Linked, Private
*/
function private function_e1a11b1(var_8861fa85, n_radius, trigger, var_ab426dbb)
{
	if(!isdefined(var_ab426dbb))
	{
		var_ab426dbb = 0;
	}
	self notify("ffb43508aca5e8c");
	self endon("ffb43508aca5e8c");
	foreach(n_obj_id in var_8861fa85)
	{
		level endon("cleanup_zm_objective_id_" + n_obj_id);
	}
	self endoncallback(&function_e5dcd07a, #"death", #"hash_261161e11cf95f9f");
	n_radius_sq = sqr(n_radius);
	self.var_45f78aa4 = arraycopy(var_8861fa85);
	while(true)
	{
		foreach(n_obj_id in self.var_45f78aa4)
		{
			if(isarray(level.releasedobjectives) && isinarray(level.releasedobjectives, n_obj_id))
			{
				break;
			}
			foreach(player in getplayers())
			{
				var_13dc7b2a = 1;
				n_ent_num = player getentitynumber();
				if(is_true(level.var_e63703cd[n_obj_id].var_d0d552ea[n_ent_num]))
				{
					var_13dc7b2a = 0;
				}
				if(isdefined(trigger))
				{
					if(trigger function_4f593819(player, self))
					{
						objective_setplayerusing(n_obj_id, player);
						if(var_ab426dbb && var_13dc7b2a)
						{
							objective_setinvisibletoplayer(n_obj_id, player);
						}
					}
					else
					{
						objective_clearplayerusing(n_obj_id, player);
						if(var_ab426dbb && var_13dc7b2a)
						{
							objective_setvisibletoplayer(n_obj_id, player);
						}
					}
					continue;
				}
				if(distancesquared(player.origin, self.origin) < n_radius_sq)
				{
					objective_setplayerusing(n_obj_id, player);
					if(var_ab426dbb && var_13dc7b2a)
					{
						objective_setinvisibletoplayer(n_obj_id, player);
					}
					continue;
				}
				objective_clearplayerusing(n_obj_id, player);
				if(var_ab426dbb && var_13dc7b2a)
				{
					objective_setvisibletoplayer(n_obj_id, player);
				}
			}
		}
		waitframe(1);
	}
	self function_48d9a9c9();
}

/*
	Name: function_48d9a9c9
	Namespace: zm_utility
	Checksum: 0xA303CE37
	Offset: 0x11AA0
	Size: 0x16
	Parameters: 0
	Flags: Linked
*/
function function_48d9a9c9()
{
	self notify(#"hash_261161e11cf95f9f");
}

/*
	Name: function_4f593819
	Namespace: zm_utility
	Checksum: 0x1EACD3E0
	Offset: 0x11AC0
	Size: 0x112
	Parameters: 2
	Flags: Linked
*/
function function_4f593819(player, ignore_ent)
{
	if(isstruct(self) && isdefined(self.script_unitrigger_type))
	{
		if(isdefined(self.playertrigger[player getentitynumber()]))
		{
			trigger = self.playertrigger[player getentitynumber()];
		}
		else
		{
			if(isdefined(self.trigger))
			{
				trigger = self.trigger;
			}
			else
			{
				return 0;
			}
		}
	}
	else
	{
		trigger = self;
	}
	if(!trigger istouching(player))
	{
		return 0;
	}
	if(!trigger triggerrequireslookat())
	{
		return 1;
	}
	return player util::is_player_looking_at(trigger.origin, 0.76, 1, ignore_ent);
}

/*
	Name: function_e5dcd07a
	Namespace: zm_utility
	Checksum: 0x56364DC8
	Offset: 0x11BE0
	Size: 0x12E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_e5dcd07a(str_notify)
{
	if(isarray(self.var_45f78aa4))
	{
		foreach(n_obj_id in self.var_45f78aa4)
		{
			foreach(player in getplayers())
			{
				objective_clearplayerusing(n_obj_id, player);
			}
		}
		self.var_45f78aa4 = undefined;
	}
}

/*
	Name: function_ee6da6f6
	Namespace: zm_utility
	Checksum: 0x26B837DC
	Offset: 0x11D18
	Size: 0x9C
	Parameters: 2
	Flags: Linked
*/
function function_ee6da6f6(n_delay, str_waittill)
{
	if(!isdefined(n_delay))
	{
		n_delay = 15;
	}
	if(!isdefined(str_waittill))
	{
		str_waittill = "player_intermission_spawned";
	}
	self endon(#"disconnect");
	self thread lui::screen_fade_out(0, (0, 0, 0), "end_game_blackscreen");
	self waittilltimeout(n_delay, str_waittill);
	self thread lui::screen_fade_in(0, (0, 0, 0), "end_game_blackscreen");
}

/*
	Name: function_5d356609
	Namespace: zm_utility
	Checksum: 0x1F39A65A
	Offset: 0x11DC0
	Size: 0xFC
	Parameters: 2
	Flags: Linked
*/
function function_5d356609(aat_name, n_tier)
{
	if(isplayer(self))
	{
		var_f35f3f4b = {#hash_dacb4b0b:function_e3025ca5(), #hash_c075f57d:get_round_number(), #hash_9f39dfd4:function_f8d53445(), #hash_93230b5d:n_tier, #hash_27ad1f0f:hash(aat_name)};
		self function_678f57c8(#"hash_69732e83f28ba309", var_f35f3f4b);
	}
}

/*
	Name: function_60daf5f7
	Namespace: zm_utility
	Checksum: 0xF047CED0
	Offset: 0x11EC8
	Size: 0x1B4
	Parameters: 3
	Flags: None
*/
function function_60daf5f7(str_name, str_key, b_hide)
{
	if(!isdefined(str_key))
	{
		str_key = "targetname";
	}
	if(!isdefined(b_hide))
	{
		b_hide = 1;
	}
	e_machine = getent(str_name, str_key);
	if(isdefined(e_machine))
	{
		if(b_hide)
		{
			if(isdefined(e_machine.objectiveid))
			{
				function_e8f4d47b(getplayers(), e_machine.objectiveid, 1);
				objective_setinvisibletoall(e_machine.objectiveid);
			}
			e_machine.trigger hide();
			e_machine hide();
			e_machine notsolid();
		}
		else
		{
			e_machine.trigger show();
			e_machine show();
			e_machine solid();
			if(isdefined(e_machine.objectiveid))
			{
				objective_setvisibletoall(e_machine.objectiveid);
				function_e8f4d47b(getplayers(), e_machine.objectiveid, 0);
			}
		}
	}
}

/*
	Name: function_ca960904
	Namespace: zm_utility
	Checksum: 0xEC047C04
	Offset: 0x12088
	Size: 0xF6
	Parameters: 3
	Flags: Linked
*/
function function_ca960904(e_machine, var_cc253f86, var_6f0e765d)
{
	if(!isdefined(level.var_c427e93b))
	{
		level.var_c427e93b = [];
	}
	else if(!isarray(level.var_c427e93b))
	{
		level.var_c427e93b = array(level.var_c427e93b);
	}
	if(!isinarray(level.var_c427e93b, e_machine))
	{
		level.var_c427e93b[level.var_c427e93b.size] = e_machine;
	}
	e_machine clientfield::set("force_stream", 1);
	e_machine.var_cc253f86 = var_cc253f86;
	e_machine.var_6f0e765d = var_6f0e765d;
}

/*
	Name: function_725e99fb
	Namespace: zm_utility
	Checksum: 0x9BDFEDC8
	Offset: 0x12188
	Size: 0x466
	Parameters: 0
	Flags: Linked
*/
function function_725e99fb()
{
	level endon(#"end_game");
	if(!isdefined(level.var_c427e93b))
	{
		level.var_c427e93b = [];
	}
	while(true)
	{
		arrayremovevalue(level.var_c427e93b, undefined);
		/#
			if(!getdvarint(#"hash_2769a6109d9d7b4d", 1))
			{
				foreach(machine in level.var_c427e93b)
				{
					if(is_true(machine.var_c02c4d66))
					{
						machine sethighdetail(0);
						machine.var_c02c4d66 = undefined;
					}
				}
				wait(1);
				continue;
			}
		#/
		foreach(machine in level.var_c427e93b)
		{
			if(!is_true(machine.var_cc253f86) && !is_true(machine.var_6f0e765d))
			{
				continue;
			}
			foreach(player in getplayers())
			{
				b_player_nearby = 0;
				if(is_player_valid(player, undefined, 1) && isdefined(machine) && function_7757350c(player, machine))
				{
					b_player_nearby = 1;
				}
				if(isdefined(machine))
				{
					var_4e157e21 = machine getentitynumber();
					if(b_player_nearby && !is_true(machine.var_c02c4d66))
					{
						if(!isdefined(player.var_4a501715[var_4e157e21]))
						{
							e_streamer_hint = player create_streamer_hint(machine.origin, machine.angles, 1, 10, var_4e157e21);
							e_streamer_hint.var_86e2d95e = machine.model;
						}
						if(is_true(machine.var_6f0e765d))
						{
							machine sethighdetail(1);
						}
						machine.var_c02c4d66 = 1;
					}
					else if(!b_player_nearby && is_true(machine.var_c02c4d66))
					{
						if(isdefined(player.var_4a501715[var_4e157e21]))
						{
							player clear_streamer_hint(var_4e157e21);
						}
						if(is_true(machine.var_6f0e765d))
						{
							machine sethighdetail(0);
						}
						machine.var_c02c4d66 = undefined;
					}
				}
				waitframe(1);
			}
		}
		waitframe(10);
	}
}

/*
	Name: function_7757350c
	Namespace: zm_utility
	Checksum: 0x1F71A20D
	Offset: 0x125F8
	Size: 0xEE
	Parameters: 2
	Flags: Linked, Private
*/
function private function_7757350c(player, machine)
{
	v_midpoint = machine.origin + machine getboundsmidpoint();
	n_height_diff = abs(player.origin[2] - machine.origin[2]);
	if(n_height_diff < 140 && distance2dsquared(player.origin, v_midpoint) < 360000)
	{
		return true;
	}
	if(player util::is_player_looking_at(v_midpoint, 0.75, 1, machine, player))
	{
		return true;
	}
	return false;
}

/*
	Name: on_disconnect
	Namespace: zm_utility
	Checksum: 0xFE115FA
	Offset: 0x126F0
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function on_disconnect()
{
	self clear_streamer_hint();
}

/*
	Name: function_e77fca72
	Namespace: zm_utility
	Checksum: 0x4A27E3B7
	Offset: 0x12718
	Size: 0x96
	Parameters: 0
	Flags: Linked
*/
function function_e77fca72()
{
	self endoncallback(&function_6a447863, #"death", #"hash_7fb506f40bcf5962");
	self.var_624e969b = 1;
	self.original_angles = self.angles;
	while(true)
	{
		function_14bad487(self, 0.75, 0.05, 3);
		if(2)
		{
			wait(2);
		}
	}
}

/*
	Name: function_14bad487
	Namespace: zm_utility
	Checksum: 0x77F1874D
	Offset: 0x127B8
	Size: 0x106
	Parameters: 4
	Flags: Linked
*/
function function_14bad487(var_1386d828, total_time, var_4c1cc19a, angle)
{
	original_angles = var_1386d828.angles;
	iterations = total_time / var_4c1cc19a;
	var_ff5fc66c = var_1386d828.angles[2];
	var_ef9ae7e0 = angle;
	if(isdefined(self.var_6748b2d2))
	{
		playsoundatposition(self.var_6748b2d2, self.origin);
	}
	for(i = 0; i < iterations; i++)
	{
		var_1386d828 rotateroll(var_ff5fc66c + var_ef9ae7e0, var_4c1cc19a);
		var_ef9ae7e0 = var_ef9ae7e0 * -1;
		wait(var_4c1cc19a);
	}
	var_1386d828.angles = original_angles;
}

/*
	Name: function_6a447863
	Namespace: zm_utility
	Checksum: 0x70CE09ED
	Offset: 0x128C8
	Size: 0x2A
	Parameters: 1
	Flags: Linked
*/
function function_6a447863(notifyhash)
{
	if(isdefined(self))
	{
		self.angles = self.original_angles;
		self.var_624e969b = undefined;
	}
}

/*
	Name: function_ebd87099
	Namespace: zm_utility
	Checksum: 0x9FC60F06
	Offset: 0x12900
	Size: 0x174
	Parameters: 1
	Flags: Linked
*/
function function_ebd87099(player)
{
	if(isdefined(level.var_23fc2144) && isdefined(level.var_f7794bb5))
	{
		var_2a4e3502 = arraysortclosest(level.var_23fc2144, player.origin, undefined, undefined, level.var_f7794bb5 + 15);
		foreach(param in var_2a4e3502)
		{
			if(player.origin[2] >= param.origin[2] && player.origin[2] <= (param.origin[2] + param.height) && distance2dsquared(player.origin, param.origin) < sqr(param.radius))
			{
				return param;
			}
		}
	}
}

/*
	Name: function_89dbd679
	Namespace: zm_utility
	Checksum: 0xE63DE322
	Offset: 0x12A80
	Size: 0x180
	Parameters: 5
	Flags: None
*/
function function_89dbd679(origin, radius, height, goal_origin, var_b9e9cdf3)
{
	if(!isdefined(level.var_23fc2144))
	{
		level.var_23fc2144 = [];
	}
	level.var_23fc2144[level.var_23fc2144.size] = {#hash_b9e9cdf3:var_b9e9cdf3, #goal_origin:goal_origin, #height:height, #radius:radius, #origin:origin};
	max_radius = 0;
	foreach(override in level.var_23fc2144)
	{
		max_radius = max(max(max_radius, override.radius), override.height);
	}
	level.var_f7794bb5 = max_radius;
}

