#using script_340a2e805e35f7a2;
#using script_3b2abb7986f4ae7c;
#using script_34ab99a4ca1a43d;
#using scripts\zm_common\zm_zonemgr.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_transformation.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_maptable.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\zm_common\gametypes\zm_gametype.gsc;
#using scripts\zm_common\zm_devgui.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm.gsc;
#using script_3a704cbcf4081bfb;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using script_7bacb32f8222fa3e;
#using scripts\core_common\flag_shared.gsc;
#using script_7fc996fe8678852;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace zm_holiday_event;

/*
	Name: function_1def8ff7
	Namespace: zm_holiday_event
	Checksum: 0x681DF625
	Offset: 0x310
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_1def8ff7()
{
	level notify(-1575546727);
}

/*
	Name: __init__system__
	Namespace: zm_holiday_event
	Checksum: 0x441E07CD
	Offset: 0x330
	Size: 0x54
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_holiday_event", &function_70a657d8, &function_8ac3bea9, undefined, #"zm_loadout");
}

/*
	Name: function_70a657d8
	Namespace: zm_holiday_event
	Checksum: 0x2FDF5F57
	Offset: 0x390
	Size: 0x10C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(is_true(getgametypesetting(#"hash_4751990deae37e66")))
	{
		callback::on_ai_spawned(&function_3ba5772b);
		callback::on_ai_killed(&function_7d47c6f7);
		callback::on_item_pickup(&function_5da12481);
		zm::register_actor_damage_callback(&function_cb059f82);
		clientfield::register("actor", "" + #"hash_477ed992854f5645", 28000, 1, "counter");
		level thread function_cf4230c2();
	}
}

/*
	Name: function_8ac3bea9
	Namespace: zm_holiday_event
	Checksum: 0xD35E7602
	Offset: 0x4A8
	Size: 0xBC
	Parameters: 0
	Flags: Private
*/
function private function_8ac3bea9()
{
	if(is_true(getgametypesetting(#"hash_4751990deae37e66")))
	{
		/#
			util::add_debug_command("");
			util::add_debug_command("");
			util::add_debug_command("");
			zm_devgui::add_custom_devgui_callback(&function_33572994);
		#/
		level thread function_5837bf72();
	}
}

/*
	Name: function_5837bf72
	Namespace: zm_holiday_event
	Checksum: 0x499F65D0
	Offset: 0x570
	Size: 0xB74
	Parameters: 0
	Flags: None
*/
function function_5837bf72()
{
	if(!isdefined(level.var_e0b4bcdf))
	{
		level.var_e0b4bcdf = [];
	}
	if(zm_utility::is_survival())
	{
		level flag::wait_till_all([2:"intro_scene_done", 1:"start_zombie_round_logic", 0:#"hash_5aca8d24a1f56ee1"]);
		util::wait_network_frame();
		var_f79418e = [];
		if(isdefined(level.var_7d45d0d4.currentdestination))
		{
			foreach(location in level.var_7d45d0d4.currentdestination.locations)
			{
				instances = array::randomize(namespace_8b6a9d79::function_f703a5a(location));
				foreach(instance in instances)
				{
					if(instance.content_script_name === "explore_chests_large")
					{
						if(!isdefined(var_f79418e))
						{
							var_f79418e = [];
						}
						else if(!isarray(var_f79418e))
						{
							var_f79418e = array(var_f79418e);
						}
						if(!isinarray(var_f79418e, instance))
						{
							var_f79418e[var_f79418e.size] = instance;
						}
					}
				}
			}
			foreach(instance in var_f79418e)
			{
				a_spawn_points = instance.var_fe2612fe[#"hash_6b1e5d8f9e70a70e"];
				if(isarray(a_spawn_points))
				{
					level.var_e0b4bcdf = arraycombine(level.var_e0b4bcdf, a_spawn_points);
				}
			}
		}
		n_max_spawns = function_21a3a673(2, 3);
		level.var_e0b4bcdf = array::randomize(level.var_e0b4bcdf);
		var_c6e3f0a = 0;
		foreach(var_6f531d9b in level.var_e0b4bcdf)
		{
			if(isdefined(var_6f531d9b.scriptmodel))
			{
				var_6f531d9b.scriptmodel delete();
			}
			if(isdefined(var_6f531d9b.trigger))
			{
				var_6f531d9b.trigger delete();
			}
			var_cc1fb2d0 = namespace_58949729::function_fd5e77fa(#"hash_716f17fde963d0ae");
			var_3a053962 = #"hash_12e47c6c01f2ff59";
			var_6f531d9b.angles = var_6f531d9b.angles + (vectorscale((0, -1, 0), 90));
			namespace_58949729::function_4ec9fc99(var_6f531d9b, var_cc1fb2d0, var_3a053962, #"hash_d3de086d9682a24", 3);
			var_6f531d9b.scriptmodel.var_11428995 = -1 * (vectorscale((0, -1, 0), 90));
			var_6f531d9b.var_738dfc81 = function_21a3a673(2, 3);
			var_6f531d9b.scriptmodel.var_cad1f913 = &namespace_dedc3cb9::function_960ea519;
			var_6f531d9b.scriptmodel.var_f2f6db96 = #"hash_6b51d18944db0abc";
			var_6f531d9b.scriptmodel.var_30dd81f6 = #"hash_1e149ca0cc921d74";
			var_6f531d9b.scriptmodel.var_46e0d8c8 = #"hash_44b7c85c36f077f7";
			var_6f531d9b.scriptmodel.var_d3256432 = #"hash_40541819515012be";
			var_c6e3f0a++;
			if(var_c6e3f0a >= n_max_spawns)
			{
				break;
			}
		}
	}
	else if(zm_utility::is_classic())
	{
		if(!level.var_e0b4bcdf.size)
		{
			a_s_player_spawns = zm_gametype::get_player_spawns_for_gametype();
			foreach(var_6f531d9b in a_s_player_spawns)
			{
				var_49089e5b = {#str_zone:var_6f531d9b.script_noteworthy, #angles:var_6f531d9b.angles, #origin:groundtrace(var_6f531d9b.origin + vectorscale((0, 0, 1), 8), var_6f531d9b.origin + (vectorscale((0, 0, -1), 100000)), 0, undefined)[#"position"]};
				if(ispointonnavmesh(var_49089e5b.origin, 50))
				{
					if(!isdefined(level.var_e0b4bcdf))
					{
						level.var_e0b4bcdf = [];
					}
					else if(!isarray(level.var_e0b4bcdf))
					{
						level.var_e0b4bcdf = array(level.var_e0b4bcdf);
					}
					if(!isinarray(level.var_e0b4bcdf, var_49089e5b))
					{
						level.var_e0b4bcdf[level.var_e0b4bcdf.size] = var_49089e5b;
					}
					continue;
				}
				var_49089e5b struct::delete();
			}
		}
		if(!isdefined(level.var_7fe5d501))
		{
			level.var_7fe5d501 = 5;
		}
		zm_utility::function_fdb0368(level.var_7fe5d501);
		n_max_spawns = function_21a3a673(2, 3);
		var_c6e3f0a = 0;
		if(!isdefined(level.var_165a2af4))
		{
			level.var_165a2af4 = [];
		}
		level.var_e0b4bcdf = array::randomize(level.var_e0b4bcdf);
		foreach(var_6f531d9b in level.var_e0b4bcdf)
		{
			var_18fc05c = var_6f531d9b.str_zone;
			if(!isdefined(var_18fc05c))
			{
				var_18fc05c = zm_zonemgr::get_zone_from_position(var_6f531d9b.origin, 1);
			}
			if(!isdefined(var_18fc05c) || is_true(level.zones[var_18fc05c].is_active) || isinarray(level.var_165a2af4, var_18fc05c))
			{
				continue;
			}
			if(isdefined(var_6f531d9b.scriptmodel))
			{
				var_6f531d9b.scriptmodel delete();
			}
			if(isdefined(var_6f531d9b.trigger))
			{
				var_6f531d9b.trigger delete();
			}
			var_cc1fb2d0 = namespace_58949729::function_fd5e77fa(#"hash_716f17fde963d0ae");
			var_3a053962 = #"hash_12e47c6c01f2ff59";
			var_6f531d9b.angles = var_6f531d9b.angles + (vectorscale((0, -1, 0), 90));
			namespace_58949729::function_4ec9fc99(var_6f531d9b, var_cc1fb2d0, var_3a053962, #"hash_d3de086d9682a24", 3);
			var_6f531d9b.scriptmodel.var_11428995 = -1 * (vectorscale((0, -1, 0), 90));
			var_6f531d9b.var_738dfc81 = function_21a3a673(2, 3);
			var_6f531d9b.scriptmodel.var_cad1f913 = &namespace_dedc3cb9::function_960ea519;
			var_6f531d9b.scriptmodel.var_f2f6db96 = #"hash_6b51d18944db0abc";
			var_6f531d9b.scriptmodel.var_30dd81f6 = #"hash_1e149ca0cc921d74";
			var_6f531d9b.scriptmodel.var_46e0d8c8 = #"hash_44b7c85c36f077f7";
			var_6f531d9b.scriptmodel.var_d3256432 = #"hash_40541819515012be";
			var_c6e3f0a++;
			if(var_c6e3f0a >= n_max_spawns)
			{
				break;
			}
		}
		level.var_7fe5d501 = level.var_7fe5d501 + 5;
		level thread function_5837bf72();
	}
}

/*
	Name: function_3ba5772b
	Namespace: zm_holiday_event
	Checksum: 0x307AC073
	Offset: 0x10F0
	Size: 0x122
	Parameters: 0
	Flags: None
*/
function function_3ba5772b()
{
	self endon(#"death");
	if(isdefined(self.archetype))
	{
		switch(self.archetype)
		{
			case "raz":
			case "mimic":
			case "tormentor":
			case "zombie_dog":
			case "mechz":
			case "zombie":
			case "avogadro":
			case "hash_7c0d83ac1e845ac2":
			{
				self.var_4356b0bd = 1;
				break;
			}
			case "soa":
			{
				wait(1.4 + (float(function_60d95f53()) / 1000));
				self.var_4356b0bd = 1;
				break;
			}
		}
	}
}

/*
	Name: function_cb059f82
	Namespace: zm_holiday_event
	Checksum: 0x22C227A
	Offset: 0x1220
	Size: 0x1EE
	Parameters: 13
	Flags: Private
*/
function private function_cb059f82(inflictor, attacker, damage, flags, meansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype)
{
	if(is_true(self.var_4356b0bd) && (shitloc === "neck" || shitloc === "head" || shitloc === "helmet" || shitloc === "torso_upper"))
	{
		self.var_4356b0bd = undefined;
		self clientfield::increment("" + #"hash_477ed992854f5645");
		if(isplayer(attacker))
		{
			level thread scoreevents::doscoreeventcallback("scoreEventZM", {#scoreevent:"haunting_destroyed_pumpkin", #attacker:attacker});
			attacker zm_stats::function_17ee4529(#"hash_513bce963a91dd34", 1, #"hash_735ace6b22542a65");
		}
		if(damage >= self.health)
		{
			damage = self.health - 1;
			self thread function_9f5a8125(inflictor, attacker, damage, flags, meansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype);
			return damage;
		}
	}
	return -1;
}

/*
	Name: function_9f5a8125
	Namespace: zm_holiday_event
	Checksum: 0xCB74D997
	Offset: 0x1418
	Size: 0xBC
	Parameters: 13
	Flags: None
*/
function function_9f5a8125(inflictor, attacker, damage, flags, meansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype)
{
	self endon(#"death");
	util::wait_network_frame();
	self dodamage(vpoint, boneindex, var_fd90b0bb, weapon, surfacetype, shitloc, vdir, psoffsettime);
}

/*
	Name: function_7d47c6f7
	Namespace: zm_holiday_event
	Checksum: 0x47826157
	Offset: 0x14E0
	Size: 0x17C
	Parameters: 1
	Flags: Private
*/
function private function_7d47c6f7(params)
{
	if(zm_utility::is_survival())
	{
		if(is_true(level.var_53bc31ad))
		{
			n_chance = 3;
		}
		else
		{
			n_chance = 3;
		}
	}
	else
	{
		n_chance = 2;
	}
	if(isplayer(params.eattacker) && (math::cointoss(n_chance) || level flag::get(#"hash_69ca47ce3a408f31")) && self.archetype !== #"mimic")
	{
		if(zm_utility::is_classic() && !zm_utility::check_point_in_playable_area(self.origin))
		{
			return;
		}
		point = function_4ba8fde(#"hash_62f54e5cca7204bf");
		if(isdefined(point))
		{
			item_drop::drop_item(0, undefined, 1, 0, point.id, self.origin, self.angles, 2);
		}
	}
}

/*
	Name: function_5da12481
	Namespace: zm_holiday_event
	Checksum: 0xB52F8EC0
	Offset: 0x1668
	Size: 0x18A
	Parameters: 1
	Flags: Private
*/
function private function_5da12481(params)
{
	item = params.item;
	if(isplayer(self))
	{
		if(isdefined(item.var_a6762160.name))
		{
			switch(item.var_a6762160.name)
			{
				case "hash_62f54e5cca7204bf":
				{
					if(math::cointoss(15) || level flag::get(#"hash_6ef5c2fd97dfb8ba"))
					{
						var_c40fb40b = spawnactor(#"spawner_bo5_mimic", item.origin, item.angles, "mimic_jackolantern_spawn", 1);
						if(isdefined(var_c40fb40b))
						{
							playfx(#"zm_ai/fx9_mimic_prop_spawn_out", var_c40fb40b.origin);
							var_c40fb40b playsound(#"hash_408f33e5cf20df9d");
						}
						else
						{
							item function_933708f2();
						}
					}
					else
					{
						item function_933708f2();
					}
					break;
				}
			}
		}
	}
}

/*
	Name: function_933708f2
	Namespace: zm_holiday_event
	Checksum: 0x1656515F
	Offset: 0x1800
	Size: 0xB4
	Parameters: 0
	Flags: Private
*/
function private function_933708f2()
{
	var_7580ce3e = spawnstruct();
	var_7580ce3e.origin = self.origin;
	var_7580ce3e.angles = self.angles;
	var_7580ce3e.var_738dfc81 = 2;
	var_7580ce3e.scriptmodel = self;
	var_9b2da190 = namespace_58949729::function_257d7203(#"hash_716f17fde963d0ae");
	level namespace_58949729::function_f82f361c(var_7580ce3e, var_9b2da190, 2);
	var_7580ce3e struct::delete();
}

/*
	Name: function_fb4c0780
	Namespace: zm_holiday_event
	Checksum: 0xE3D53F95
	Offset: 0x18C0
	Size: 0x24
	Parameters: 1
	Flags: Private
*/
function private function_fb4c0780(player)
{
	self thread namespace_dedc3cb9::function_960ea519(player);
}

/*
	Name: function_cf4230c2
	Namespace: zm_holiday_event
	Checksum: 0xC4D134D3
	Offset: 0x18F0
	Size: 0xC4
	Parameters: 0
	Flags: None
*/
function function_cf4230c2()
{
	level.var_f546b995 = "halloween";
	zm_audio::musicstate_create("round_start_first_halloween", 3, "round_start_first_hallow_00");
	zm_audio::musicstate_create("round_start_halloween", 3, "round_start_hallow_00", "round_start_hallow_01");
	zm_audio::musicstate_create("round_end_halloween", 3, "round_end_hallow_00", "round_end_hallow_01");
	zm_audio::musicstate_create("game_over_halloween", 5, "gameover_hallow");
}

/*
	Name: function_33572994
	Namespace: zm_holiday_event
	Checksum: 0x113B33D0
	Offset: 0x19C0
	Size: 0x1C2
	Parameters: 1
	Flags: Private
*/
function private function_33572994(cmd)
{
	/#
		switch(cmd)
		{
			case "hash_e41021f4d82e571":
			{
				level flag::toggle(#"hash_69ca47ce3a408f31");
				if(level flag::get(#"hash_69ca47ce3a408f31"))
				{
					iprintlnbold("");
				}
				else
				{
					iprintlnbold("");
				}
				break;
			}
			case "hash_68f2deafb75d0499":
			{
				level flag::toggle(#"hash_6ef5c2fd97dfb8ba");
				if(level flag::get(#"hash_6ef5c2fd97dfb8ba"))
				{
					iprintlnbold("");
				}
				else
				{
					iprintlnbold("");
				}
				break;
			}
			case "hash_3d3ef40bc9791d4b":
			{
				if(level flag::get(""))
				{
					level flag::clear("");
				}
				else
				{
					level flag::set("");
					level thread function_50567097();
				}
			}
		}
	#/
}

/*
	Name: function_50567097
	Namespace: zm_holiday_event
	Checksum: 0xCC6FE0C1
	Offset: 0x1B90
	Size: 0x132
	Parameters: 0
	Flags: Private
*/
function private function_50567097()
{
	/#
		self notify("");
		self endon("");
		while(level flag::get(""))
		{
			foreach(var_6f531d9b in level.var_e0b4bcdf)
			{
				if(var_6f531d9b.scriptmodel.model === #"hash_12e47c6c01f2ff59")
				{
					circle(var_6f531d9b.origin, 50, (0, 1, 0));
					continue;
				}
				circle(var_6f531d9b.origin, 50, (1, 0, 0));
			}
			waitframe(1);
		}
	#/
}

