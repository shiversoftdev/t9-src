#using script_165beea08a63a243;
#using script_1e27492fba595357;
#using script_20dc0f45753888c7;
#using script_335d0650ed05d36d;
#using script_336275a0ba841d18;
#using script_340a2e805e35f7a2;
#using script_3411bb48d41bd3b;
#using script_34ab99a4ca1a43d;
#using script_35b8a6927c851193;
#using script_3cebb48c37fc271;
#using script_3e196d275a6fb180;
#using script_3e57cc1a9084fdd6;
#using script_3f9e0dc8454d98e1;
#using script_43787b357a978d13;
#using script_43e752475599d64c;
#using script_44b0b8420eabacad;
#using script_48454d623e99a919;
#using script_4d1e366b77f0b4b;
#using script_75da5547b1822294;
#using script_84036a646acb958;
#using script_ab890501c40b73c;
#using script_b9d273dc917ee1f;
#using script_db06eb511bd9b36;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\oob.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\zm_common\gametypes\zm_gametype.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\zm_common\zm_behavior.gsc;
#using scripts\zm_common\zm_laststand.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace zonslaught;

/*
	Name: function_5be66e31
	Namespace: zonslaught
	Checksum: 0xCF5DC1DA
	Offset: 0x3D0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_5be66e31()
{
	level notify(1517929353);
}

/*
	Name: main
	Namespace: zonslaught
	Checksum: 0x79E199FC
	Offset: 0x3F0
	Size: 0x854
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	setclearanceceiling(29);
	level.mapbounds = {#center:(0, 0, 0)};
	level.var_2f5a329e = 1;
	spawning::addsupportedspawnpointtype("tdm");
	/#
		println("");
	#/
	level.dog_round_count = 0;
	changeadvertisedstatus(0);
	clientfield::register("scriptmover", "" + #"boss_zone_on_radar", 1, 2, "int");
	clientfield::function_a8bbc967("hudItems.onslaught.wave_number", 1, 7, "int");
	clientfield::function_a8bbc967("hudItems.onslaught.bosskill_count", 1, 5, "int");
	clientfield::register("scriptmover", "orb_spawn", 1, 1, "int");
	clientfield::register("scriptmover", "bot_claim_fx", 1, 2, "int");
	clientfield::register("actor", "orb_soul_capture_fx", 1, 3, "int");
	clientfield::register("actor", "zombie_aether_spawn_cf", 1, 1, "int");
	level.var_ce3ac5b6 = 1;
	namespace_51f64aa9::function_2ce126c4();
	level.customspawnlogic = &function_716def93;
	level.var_6c4ec3fc = &function_8af3b312;
	level.var_1f966535 = 4;
	level.var_b20199e0 = &function_b20199e0;
	level.var_8179368e = &function_6398c8cb;
	level.var_b48509f9 = 1;
	level.var_8de4d059 = util::function_53bbf9d2();
	switch(level.var_8de4d059)
	{
		case "mp_cartel":
		{
			namespace_4abf1500::function_88645994(#"hash_6790ae0ea3c52d8c");
			break;
		}
		case "hash_3a966c557b53e20f":
		{
			namespace_4abf1500::function_88645994(#"hash_5a35a409d65a7e81");
			break;
		}
		case "hash_2eca735470e3388":
		{
			namespace_4abf1500::function_88645994(#"hash_209ee9b80067b5c");
			break;
		}
		case "mp_moscow":
		{
			namespace_4abf1500::function_88645994(#"hash_50d0118921ca50a5");
			break;
		}
		case "hash_c6580c35ed9c32a":
		{
			namespace_4abf1500::function_88645994(#"hash_f4157e3a1c0c52a");
			break;
		}
		case "hash_7474af58449590c9":
		{
			namespace_4abf1500::function_88645994(#"hash_5330fc8ca7227001");
			break;
		}
		case "hash_7665a0b476d1b735":
		{
			namespace_4abf1500::function_88645994(#"hash_7c7054127b6e76b9");
			break;
		}
		case "hash_31affcfbb0fe663e":
		{
			namespace_4abf1500::function_88645994(#"hash_3f094f7b8f46b9ae");
			break;
		}
		case "hash_3aabbe0c0bb97a9b":
		{
			namespace_4abf1500::function_88645994(#"hash_148c26e54db1d539");
			break;
		}
		case "hash_18edc1d1daaffe9f":
		{
			namespace_4abf1500::function_88645994(#"hash_570a2611b84f56ee");
			break;
		}
		case "hash_1fca690ac41525d1":
		{
			namespace_4abf1500::function_88645994(#"hash_3968fe6c0ca3893d");
			break;
		}
		case "hash_758faaadf8ad2a42":
		{
			namespace_4abf1500::function_88645994(#"hash_2688635b9d6922e8");
			break;
		}
		default:
		{
			break;
		}
	}
	level.var_374c2805 = 1;
	level.aat_in_use = 1;
	level.var_ae22a03 = [11:#"hash_1fca690ac41525d1", 10:#"hash_758faaadf8ad2a42", 9:#"hash_3aabbe0c0bb97a9b", 8:#"hash_18edc1d1daaffe9f", 7:#"hash_31affcfbb0fe663e", 6:#"hash_7665a0b476d1b735", 5:#"hash_7474af58449590c9", 4:#"hash_c6580c35ed9c32a", 3:#"mp_moscow", 2:#"hash_2eca735470e3388", 1:#"hash_3a966c557b53e20f", 0:#"mp_cartel"];
	level.resurrect_override_spawn = &overridespawn;
	callback::on_bleedout(&on_bleedout);
	level.var_bde3d03 = &function_37d98bb7;
	level thread zm_powerups::powerup_round_start();
	level.var_9f01688e = 1;
	zm_gametype::main();
	level.onprecachegametype = &onprecachegametype;
	level.onstartgametype = &onstartgametype;
	level.player_starting_points = 0;
	spawner::add_ai_spawn_function(&function_2c482e69);
	namespace_58949729::function_5a12541e();
	spawner::add_global_spawn_function(level.zombie_team, &namespace_85745671::function_2089690e);
	callback::on_spawned(&on_player_spawn);
	callback::add_callback(#"hash_3b7d3ed9e484ef72", &namespace_51f64aa9::give_match_bonus);
	level thread function_8f3357bd();
}

/*
	Name: function_8f3357bd
	Namespace: zonslaught
	Checksum: 0x72360730
	Offset: 0xC50
	Size: 0x172
	Parameters: 0
	Flags: None
*/
function function_8f3357bd()
{
	if(isdefined(level.var_8de4d059))
	{
		switch(level.var_8de4d059)
		{
			case "hash_3aabbe0c0bb97a9b":
			{
				array::delete_all(getentarray("hide_vent", "targetname"));
				var_4dd3dfa8 = struct::get_array("onslaught_blocker", "targetname");
				foreach(struct in var_4dd3dfa8)
				{
					var_babbd92e = util::spawn_model("p8_usa_ventilation_duct_hatch_01", struct.origin, struct.angles);
					var_babbd92e solid();
				}
				break;
			}
			default:
			{
				return;
			}
		}
	}
}

/*
	Name: function_31a760fa
	Namespace: zonslaught
	Checksum: 0x60307F47
	Offset: 0xDD0
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec
*/
function autoexec function_31a760fa()
{
	if(util::function_53bbf9d2() === #"hash_7665a0b476d1b735")
	{
		setgametypesetting(#"hash_3a15393c2e90e121", 1);
	}
}

/*
	Name: function_37d98bb7
	Namespace: zonslaught
	Checksum: 0xB94DEF78
	Offset: 0xE28
	Size: 0x10C
	Parameters: 1
	Flags: None
*/
function function_37d98bb7(entity)
{
	entity endon(#"disconnect");
	level endon(#"game_ended");
	entity zm_laststand::function_3d685b5f(0);
	entity val::set(#"oob", "takedamage", 1);
	entity.var_39c78617 = 1;
	entity notify(#"hash_257d7f8fe6f97830");
	if(is_true(entity.laststand))
	{
		waitframe(4);
		zm_laststand::bleed_out();
	}
	else
	{
		entity dodamage(entity.health + 10000, entity.origin);
	}
}

/*
	Name: on_bleedout
	Namespace: zonslaught
	Checksum: 0xF2C82AA1
	Offset: 0xF40
	Size: 0x1D0
	Parameters: 0
	Flags: None
*/
function on_bleedout()
{
	self endon(#"disconnect");
	level endon(#"game_ended");
	players = function_a1ef346b();
	if(players.size > 1)
	{
		level waittill(#"hash_1b8264e950c01344");
		self.oobdisabled = 0;
		var_d1803e09 = level.var_df7b46d1.origin;
		var_8c27fbb7 = getclosestpointonnavmesh(var_d1803e09, 64, 32);
		if(isdefined(var_8c27fbb7))
		{
			self.resurrect_origin = var_8c27fbb7;
		}
		else
		{
			players = function_a1ef346b();
			foreach(player in players)
			{
				var_8c27fbb7 = getclosestpointonnavmesh(player.origin, 64, 32);
				if(isdefined(var_8c27fbb7))
				{
					self.resurrect_origin = var_8c27fbb7;
					self.resurrect_angles = player.angles;
				}
			}
		}
		self thread function_3fd71c32();
		self thread [[level.spawnclient]](0);
	}
}

/*
	Name: function_6398c8cb
	Namespace: zonslaught
	Checksum: 0x676DF068
	Offset: 0x1118
	Size: 0x1F6
	Parameters: 0
	Flags: None
*/
function function_6398c8cb()
{
	var_d1803e09 = level.var_df7b46d1.origin;
	var_8c27fbb7 = getclosestpointonnavmesh(var_d1803e09, 64, 32);
	var_e2f41b0a = {#angles:self.resurrect_angles, #origin:self.resurrect_origin};
	if(isdefined(var_8c27fbb7))
	{
		self.resurrect_origin = var_8c27fbb7;
		var_e2f41b0a = {#angles:self.resurrect_angles, #origin:var_8c27fbb7};
		return var_e2f41b0a;
	}
	players = function_a1ef346b();
	if(players.size === 1)
	{
		return var_e2f41b0a;
	}
	foreach(player in players)
	{
		var_8c27fbb7 = getclosestpointonnavmesh(player.origin, 64, 32);
		if(isdefined(var_8c27fbb7))
		{
			self.resurrect_origin = var_8c27fbb7;
			self.resurrect_angles = player.angles;
			var_e2f41b0a = {#angles:player.angles, #origin:var_8c27fbb7};
			return var_e2f41b0a;
		}
	}
	return var_e2f41b0a;
}

/*
	Name: function_3fd71c32
	Namespace: zonslaught
	Checksum: 0xE939721A
	Offset: 0x1318
	Size: 0x144
	Parameters: 0
	Flags: None
*/
function function_3fd71c32()
{
	self endon(#"disconnect");
	level endon(#"game_ended");
	self waittill(#"spawned");
	if(self.currentspectatingclient > -1)
	{
		self.var_f4710251 = self.currentspectatingclient;
	}
	self val::set("zm_laststand", "allowdeath", 0);
	self util::delay(2, "death", &val::reset, "zm_laststand", "allowdeath");
	self util::delay(2, "death", &val::reset, "laststand", "ignoreme");
	self.laststand = undefined;
	self thread val::set_for_time(3, #"player_spawn_protection", "ignoreme");
}

/*
	Name: function_2c482e69
	Namespace: zonslaught
	Checksum: 0x5DD41969
	Offset: 0x1468
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function function_2c482e69(params)
{
	self.var_1b2af7dc = 1;
	self thread function_acafdd66();
}

/*
	Name: function_acafdd66
	Namespace: zonslaught
	Checksum: 0x26DDDE8E
	Offset: 0x14A0
	Size: 0x4C
	Parameters: 0
	Flags: None
*/
function function_acafdd66()
{
	self endon(#"death");
	while(true)
	{
		self waittill(#"bad_path");
		self.var_4fe4e626 = 1;
		wait(0.5);
	}
}

/*
	Name: overridespawn
	Namespace: zonslaught
	Checksum: 0xC6841CD8
	Offset: 0x14F8
	Size: 0x730
	Parameters: 1
	Flags: None
*/
function overridespawn(ispredictedspawn)
{
	self.oobdisabled = 0;
	if(isdefined(level.var_4d75ad83))
	{
		if(!isdefined(self.resurrect_origin))
		{
			self.resurrect_origin = level.var_4d75ad83.origin;
			self.resurrect_angles = level.var_4d75ad83.angles;
		}
		return true;
	}
	if(isdefined(level.var_2492c7f))
	{
		level.var_2492c7f.used = 1;
		if(!isdefined(self.resurrect_origin))
		{
			self.resurrect_origin = level.var_2492c7f.origin;
			self.resurrect_angles = level.var_2492c7f.angles;
		}
	}
	checkdist = 800;
	var_273a84a9 = [];
	if(!isdefined(var_273a84a9))
	{
		var_273a84a9 = [];
	}
	else if(!isarray(var_273a84a9))
	{
		var_273a84a9 = array(var_273a84a9);
	}
	var_273a84a9[var_273a84a9.size] = "war";
	if(!isdefined(var_273a84a9))
	{
		var_273a84a9 = [];
	}
	else if(!isarray(var_273a84a9))
	{
		var_273a84a9 = array(var_273a84a9);
	}
	var_273a84a9[var_273a84a9.size] = "war_zone_0";
	if(!isdefined(var_273a84a9))
	{
		var_273a84a9 = [];
	}
	else if(!isarray(var_273a84a9))
	{
		var_273a84a9 = array(var_273a84a9);
	}
	var_273a84a9[var_273a84a9.size] = "war_zone_1";
	if(!isdefined(var_273a84a9))
	{
		var_273a84a9 = [];
	}
	else if(!isarray(var_273a84a9))
	{
		var_273a84a9 = array(var_273a84a9);
	}
	var_273a84a9[var_273a84a9.size] = "war_zone_2";
	if(!isdefined(var_273a84a9))
	{
		var_273a84a9 = [];
	}
	else if(!isarray(var_273a84a9))
	{
		var_273a84a9 = array(var_273a84a9);
	}
	var_273a84a9[var_273a84a9.size] = "war_zone_3";
	if(!isdefined(var_273a84a9))
	{
		var_273a84a9 = [];
	}
	else if(!isarray(var_273a84a9))
	{
		var_273a84a9 = array(var_273a84a9);
	}
	var_273a84a9[var_273a84a9.size] = "war_zone_4";
	if(!isdefined(var_273a84a9))
	{
		var_273a84a9 = [];
	}
	else if(!isarray(var_273a84a9))
	{
		var_273a84a9 = array(var_273a84a9);
	}
	var_273a84a9[var_273a84a9.size] = "tdm";
	if(!isdefined(var_273a84a9))
	{
		var_273a84a9 = [];
	}
	else if(!isarray(var_273a84a9))
	{
		var_273a84a9 = array(var_273a84a9);
	}
	var_273a84a9[var_273a84a9.size] = "ctf";
	var_8fb1964e = function_d400d613(#"mp_spawn_point", var_273a84a9);
	if(util::function_53bbf9d2() === #"hash_7665a0b476d1b735")
	{
		var_7e51d277 = randomint(5);
		switch(var_7e51d277)
		{
			case 0:
			{
				spawns = var_8fb1964e[#"war"];
				break;
			}
			case 1:
			{
				spawns = var_8fb1964e[#"hash_7c27c07f3b2d8f87"];
				break;
			}
			case 2:
			{
				spawns = var_8fb1964e[#"hash_7c27bf7f3b2d8dd4"];
				break;
			}
			case 3:
			{
				spawns = var_8fb1964e[#"hash_7c27c27f3b2d92ed"];
				break;
			}
			case 4:
			{
				spawns = var_8fb1964e[#"hash_7c27c17f3b2d913a"];
				break;
			}
			case 5:
			{
				spawns = var_8fb1964e[#"hash_7c27bc7f3b2d88bb"];
				break;
			}
		}
		if(!isdefined(spawns))
		{
			spawns = var_8fb1964e[#"tdm"];
		}
	}
	else
	{
		spawns = var_8fb1964e[#"tdm"];
	}
	if(!isdefined(spawns))
	{
		spawns = var_8fb1964e[#"ctf"];
	}
	var_8e971f37 = spawns[randomint(spawns.size)];
	var_8e971f37.used = 1;
	var_d16776ab = 1000000;
	foreach(spawnpt in spawns)
	{
		if(is_true(spawnpt.used))
		{
			continue;
		}
		var_b3dbfd56 = spawnpt.origin;
		distsq = distancesquared(var_b3dbfd56, var_8e971f37.origin);
		if(distsq < var_d16776ab)
		{
			var_d16776ab = distsq;
			level.var_2492c7f = spawnpt;
		}
		if(distsq < checkdist * checkdist)
		{
			level.var_4d75ad83 = spawnpt;
			level.var_4d75ad83.used = 1;
			break;
		}
	}
	if(!isdefined(self.resurrect_origin))
	{
		self.resurrect_origin = var_8e971f37.origin;
		self.resurrect_angles = var_8e971f37.angles;
	}
	level.var_8a579fdb = var_8e971f37;
	return true;
}

/*
	Name: function_b20199e0
	Namespace: zonslaught
	Checksum: 0x7364182F
	Offset: 0x1C30
	Size: 0x5C
	Parameters: 0
	Flags: None
*/
function function_b20199e0()
{
	rand = randomint(100);
	if(rand <= 10)
	{
		self namespace_65181344::function_fd87c780(#"hash_39e0c3466d627c55", 1, 2);
	}
}

/*
	Name: function_8af3b312
	Namespace: zonslaught
	Checksum: 0xB4C8841F
	Offset: 0x1C98
	Size: 0x14
	Parameters: 0
	Flags: None
*/
function function_8af3b312()
{
	spawning::addspawns();
}

/*
	Name: function_716def93
	Namespace: zonslaught
	Checksum: 0xE562C7DD
	Offset: 0x1CB8
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function function_716def93(predictedspawn)
{
	self spawning::onspawnplayer(predictedspawn);
}

/*
	Name: onprecachegametype
	Namespace: zonslaught
	Checksum: 0x80F724D1
	Offset: 0x1CE8
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function onprecachegametype()
{
}

/*
	Name: function_6878d990
	Namespace: zonslaught
	Checksum: 0xC79129C7
	Offset: 0x1CF8
	Size: 0xB4
	Parameters: 1
	Flags: None
*/
function function_6878d990(ai_zombie)
{
	ai_zombie endon(#"death");
	if(isdefined(level.var_df7b46d1))
	{
		var_2a576940 = getclosestpointonnavmesh(level.var_df7b46d1.origin, 64, 64);
		if(isdefined(var_2a576940))
		{
			ai_zombie setgoal(var_2a576940, 0, 32);
		}
		else
		{
			ai_zombie setgoal(ai_zombie.origin, 0, 32);
		}
	}
}

/*
	Name: onstartgametype
	Namespace: zonslaught
	Checksum: 0xA649A733
	Offset: 0x1DB8
	Size: 0x3C4
	Parameters: 0
	Flags: None
*/
function onstartgametype()
{
	zm_behavior::function_70a657d8();
	zm_spawner::init();
	zm_behavior::function_8ac3bea9();
	spawning::function_7a87efaa();
	zm_powerups::powerup_round_start();
	if(isdefined(level.zombie_powerups[#"small_ammo"]))
	{
		level.zombie_powerups[#"small_ammo"].only_affects_grabber = 0;
	}
	if(isdefined(level.zombie_powerups[#"random_weapon"]))
	{
		level.zombie_powerups[#"random_weapon"].only_affects_grabber = 0;
	}
	if(isdefined(level.zombie_powerups[#"free_perk"]))
	{
		level.zombie_powerups[#"free_perk"].only_affects_grabber = 0;
		zm_powerups::powerup_remove_from_regular_drops("free_perk");
	}
	if(isdefined(level.zombie_powerups[#"full_ammo"]))
	{
		level.zombie_powerups[#"full_ammo"].only_affects_grabber = 0;
		zm_powerups::powerup_remove_from_regular_drops("full_ammo");
	}
	if(isdefined(level.zombie_powerups[#"insta_kill"]))
	{
		level.zombie_powerups[#"insta_kill"].only_affects_grabber = 0;
	}
	if(isdefined(level.zombie_powerups[#"hero_weapon_power"]))
	{
		level.zombie_powerups[#"hero_weapon_power"].only_affects_grabber = 0;
	}
	if(isdefined(level.zombie_powerups[#"bonfire_sale"]))
	{
		zm_powerups::powerup_remove_from_regular_drops("bonefire_sale");
	}
	level.spawnmins = (0, 0, 0);
	level.spawnmaxs = (0, 0, 0);
	structs = struct::get_array("player_respawn_point", "targetname");
	foreach(struct in structs)
	{
		level.spawnmins = math::expand_mins(level.spawnmins, struct.origin);
		level.spawnmaxs = math::expand_maxs(level.spawnmaxs, struct.origin);
	}
	level.mapcenter = math::find_box_center(level.spawnmins, level.spawnmaxs);
	setmapcenter(level.mapcenter);
	level.do_randomized_zigzag_path = 0;
	level.no_target_override = &function_6878d990;
	level.var_b813f909 = &function_6878d990;
}

/*
	Name: on_player_spawn
	Namespace: zonslaught
	Checksum: 0x1FC9EB62
	Offset: 0x2188
	Size: 0x62
	Parameters: 0
	Flags: None
*/
function on_player_spawn()
{
	self.specialty = self getloadoutperks(0);
	self zm::register_perks();
	self.oobdisabled = 0;
	self.var_f22c83f5 = 1;
	self.var_d66589da = 1;
	self.var_5d4c5daf = 0;
}

/*
	Name: function_6e4a862f
	Namespace: zonslaught
	Checksum: 0xDE939D07
	Offset: 0x21F8
	Size: 0x4C
	Parameters: 2
	Flags: Private
*/
function private function_6e4a862f(medalindex, var_c0e8e1e0)
{
	if(isdefined(medalindex) && isdefined(var_c0e8e1e0))
	{
		self luinotifyevent(#"hash_68afc2d59b92c95c", 2, medalindex, var_c0e8e1e0);
	}
}

/*
	Name: function_e88957df
	Namespace: zonslaught
	Checksum: 0x9263358F
	Offset: 0x2250
	Size: 0xE6A
	Parameters: 1
	Flags: None
*/
function function_e88957df(var_a0168ed5)
{
	if(!isdefined(var_a0168ed5))
	{
		var_a0168ed5 = 0;
	}
	if(util::function_5df4294() === #"zonslaught")
	{
		var_77acb6b1 = self zm_stats::function_de5c64c9(#"hash_50dc15187c54967c", level.var_9b7bd0e8);
	}
	if(getdvar(#"hash_72211987f2c0143c", 0) == 1 && is_true(var_a0168ed5))
	{
		self zm_stats::increment_challenge_stat(#"hash_40c259a28bc275ba", undefined, 1);
	}
	if(getdvar(#"hash_56c9b20730beeb37", 0) == 1)
	{
		self zm_stats::increment_challenge_stat(#"hash_6125860fd19f299e", undefined, 1);
	}
	self zm_stats::increment_global_stat("onslaught_total_elites_eliminated");
	var_8b708270 = self zm_stats::get_global_stat("onslaught_total_elites_eliminated");
	var_7c02f666 = 0;
	foreach(map in level.var_ae22a03)
	{
		if(self zm_stats::function_fd25ef51(#"hash_50dc15187c54967c", map) > 0)
		{
			var_7c02f666++;
		}
	}
	if(isdefined(var_7c02f666) && var_7c02f666 >= 7)
	{
		self zm_utility::give_achievement(#"hash_3c8fbebec2f463f5");
	}
	if(level.var_9b7bd0e8 === 3)
	{
		function_6e4a862f(1, 3);
		if(getdvar(#"hash_75f206f6fb3c29bb", 0) == 1)
		{
			self zm_stats::increment_challenge_stat(#"hash_12ebd02003c58809", undefined, 1);
		}
		if(getdvar(#"hash_74029e8a77818e59", 0) == 1)
		{
			self zm_stats::increment_challenge_stat(#"hash_203f53d43e7b5525", undefined, 1);
		}
		if(is_true(var_77acb6b1))
		{
			switch(level.var_8de4d059)
			{
				case "mp_cartel":
				{
					self zm_stats::increment_challenge_stat(#"hash_768a330ec53898c9", undefined, 1);
					break;
				}
				case "hash_3a966c557b53e20f":
				{
					self zm_stats::increment_challenge_stat(#"hash_2adda7cd2b43ffaa", undefined, 1);
					break;
				}
				case "hash_2eca735470e3388":
				{
					self zm_stats::increment_challenge_stat(#"hash_77fdc1340a34667d", undefined, 1);
					break;
				}
				case "mp_moscow":
				{
					self zm_stats::increment_challenge_stat(#"hash_6dee1f7a2cf24f0a", undefined, 1);
					break;
				}
				case "hash_c6580c35ed9c32a":
				{
					self zm_stats::increment_challenge_stat(#"hash_174eca25428cfdd3", undefined, 1);
					break;
				}
				case "hash_7474af58449590c9":
				{
					self zm_stats::increment_challenge_stat(#"hash_66ee2888bd7ddb12", undefined, 1);
					break;
				}
				case "hash_7665a0b476d1b735":
				{
					self zm_stats::increment_challenge_stat(#"hash_3aecbf73ceecadaa", undefined, 1);
					break;
				}
				case "hash_31affcfbb0fe663e":
				{
					self zm_stats::increment_challenge_stat(#"hash_39310ccdb302c15b", undefined, 1);
					break;
				}
				case "hash_3aabbe0c0bb97a9b":
				{
					self zm_stats::increment_challenge_stat(#"hash_49d075d62f45e274", undefined, 1);
					break;
				}
				case "hash_18edc1d1daaffe9f":
				{
					self zm_stats::increment_challenge_stat(#"hash_7b7db9592bf8ce56", undefined, 1);
					break;
				}
				case "hash_1fca690ac41525d1":
				{
					self zm_stats::increment_challenge_stat(#"hash_7d8ee900ddefa146", undefined, 1);
					break;
				}
				case "hash_758faaadf8ad2a42":
				{
					self zm_stats::increment_challenge_stat(#"hash_666f9063a85fcd9", undefined, 1);
					break;
				}
				default:
				{
					/#
						assertmsg("");
					#/
					return;
				}
			}
		}
	}
	else
	{
		if(level.var_9b7bd0e8 === 5)
		{
			function_6e4a862f(2, 5);
			if(getdvar(#"hash_75f206f6fb3c29bb", 0) == 1)
			{
				self zm_stats::increment_challenge_stat(#"hash_12ebd02003c58809", undefined, 1);
			}
			if(getdvar(#"hash_74029e8a77818e59", 0) == 1)
			{
				self zm_stats::increment_challenge_stat(#"hash_203f53d43e7b5525", undefined, 1);
			}
			if(is_true(var_77acb6b1))
			{
				switch(level.var_8de4d059)
				{
					case "mp_cartel":
					{
						self zm_stats::increment_challenge_stat(#"hash_e7080a2e314b310", undefined, 1);
						break;
					}
					case "hash_3a966c557b53e20f":
					{
						self zm_stats::increment_challenge_stat(#"hash_1404f61a3c181b21", undefined, 1);
						break;
					}
					case "hash_2eca735470e3388":
					{
						self zm_stats::increment_challenge_stat(#"hash_78912627d043be", undefined, 1);
						break;
					}
					case "mp_moscow":
					{
						self zm_stats::increment_challenge_stat(#"hash_5e2d0a6005f8bb7f", undefined, 1);
						break;
					}
					case "hash_c6580c35ed9c32a":
					{
						self zm_stats::increment_challenge_stat(#"hash_37ff3a21d194b40c", undefined, 1);
						break;
					}
					case "hash_7474af58449590c9":
					{
						self zm_stats::increment_challenge_stat(#"hash_7e1412cacb1d2d6b", undefined, 1);
						break;
					}
					case "hash_7665a0b476d1b735":
					{
						self zm_stats::increment_challenge_stat(#"hash_149f5861932281df", undefined, 1);
						break;
					}
					case "hash_31affcfbb0fe663e":
					{
						self zm_stats::increment_challenge_stat(#"hash_1328a9a4fc66d61a", undefined, 1);
						break;
					}
					case "hash_3aabbe0c0bb97a9b":
					{
						self zm_stats::increment_challenge_stat(#"hash_6cde4583797a1e4d", undefined, 1);
						break;
					}
					case "hash_18edc1d1daaffe9f":
					{
						self zm_stats::increment_challenge_stat(#"hash_677d29dcb0c038a7", undefined, 1);
						break;
					}
					case "hash_1fca690ac41525d1":
					{
						self zm_stats::increment_challenge_stat(#"hash_4f8679e10c170ac9", undefined, 1);
						break;
					}
					case "hash_758faaadf8ad2a42":
					{
						self zm_stats::increment_challenge_stat(#"hash_61b15880248761c8", undefined, 1);
						break;
					}
					default:
					{
						/#
							assertmsg("");
						#/
						return;
					}
				}
			}
		}
		else if(level.var_9b7bd0e8 === 8)
		{
			function_6e4a862f(3, 8);
			if(getdvar(#"hash_75f206f6fb3c29bb", 0) == 1)
			{
				self zm_stats::increment_challenge_stat(#"hash_12ebd02003c58809", undefined, 1);
			}
			if(getdvar(#"hash_74029e8a77818e59", 0) == 1)
			{
				self zm_stats::increment_challenge_stat(#"hash_203f53d43e7b5525", undefined, 1);
			}
			self zm_stats::increment_global_stat(#"hash_926b4857266e7a2");
			var_d9070a37 = self zm_stats::get_global_stat(#"hash_926b4857266e7a2");
			if(isdefined(var_d9070a37) && var_d9070a37 >= 7)
			{
				self zm_utility::give_achievement(#"hash_6703984223a2809c");
			}
			if(is_true(var_77acb6b1))
			{
				switch(level.var_8de4d059)
				{
					case "mp_cartel":
					{
						self zm_stats::increment_challenge_stat(#"hash_43c2b3a0dfc9bab3", undefined, 1);
						break;
					}
					case "hash_3a966c557b53e20f":
					{
						self zm_stats::increment_challenge_stat(#"hash_5014636a724f5c14", undefined, 1);
						break;
					}
					case "hash_2eca735470e3388":
					{
						self zm_stats::increment_challenge_stat(#"hash_15a7d102d2edb893", undefined, 1);
						break;
					}
					case "mp_moscow":
					{
						self zm_stats::increment_challenge_stat(#"hash_567e99c4a5fb9fc8", undefined, 1);
						break;
					}
					case "hash_c6580c35ed9c32a":
					{
						self zm_stats::increment_challenge_stat(#"hash_40199f1bfb79141d", undefined, 1);
						break;
					}
					case "hash_7474af58449590c9":
					{
						self zm_stats::increment_challenge_stat(#"hash_525fc5df1c43afe4", undefined, 1);
						break;
					}
					case "hash_7665a0b476d1b735":
					{
						self zm_stats::increment_challenge_stat(#"hash_4fb345ddd49a654c", undefined, 1);
						break;
					}
					case "hash_31affcfbb0fe663e":
					{
						self zm_stats::increment_challenge_stat(#"hash_17c6d5faa49457e1", undefined, 1);
						break;
					}
					case "hash_3aabbe0c0bb97a9b":
					{
						self zm_stats::increment_challenge_stat(#"hash_80f17b0b548e17e", undefined, 1);
						break;
					}
					case "hash_18edc1d1daaffe9f":
					{
						self zm_stats::increment_challenge_stat(#"hash_65ed7b0fe5ddfe4c", undefined, 1);
						break;
					}
					case "hash_1fca690ac41525d1":
					{
						self zm_stats::increment_challenge_stat(#"hash_54df583b05e784c0", undefined, 1);
						break;
					}
					case "hash_758faaadf8ad2a42":
					{
						self zm_stats::increment_challenge_stat(#"hash_1ada6297a317cb2f", undefined, 1);
						break;
					}
					default:
					{
						/#
							assertmsg("");
						#/
						return;
					}
				}
			}
		}
	}
}

/*
	Name: function_d400d613
	Namespace: zonslaught
	Checksum: 0x7E2EF702
	Offset: 0x30C8
	Size: 0x21E
	Parameters: 2
	Flags: None
*/
function function_d400d613(targetname, var_37c5ce49)
{
	returnarray = [];
	rawspawns = struct::get_array(targetname, "targetname");
	rawspawns = spawning::function_b404fc61(rawspawns);
	foreach(spawn in rawspawns)
	{
		foreach(supportedspawntype in var_37c5ce49)
		{
			if(!function_82ca1565(spawn, supportedspawntype))
			{
				continue;
			}
			if(oob::chr_party(spawn.origin) && territory::is_inside(spawn.origin))
			{
				break;
			}
			if(!isdefined(returnarray[supportedspawntype]))
			{
				returnarray[supportedspawntype] = [];
			}
			if(!isdefined(returnarray[supportedspawntype]))
			{
				returnarray[supportedspawntype] = [];
			}
			else if(!isarray(returnarray[supportedspawntype]))
			{
				returnarray[supportedspawntype] = array(returnarray[supportedspawntype]);
			}
			returnarray[supportedspawntype][returnarray[supportedspawntype].size] = spawn;
		}
	}
	return returnarray;
}

/*
	Name: function_82ca1565
	Namespace: zonslaught
	Checksum: 0xFD9FE06D
	Offset: 0x32F0
	Size: 0x2C4
	Parameters: 2
	Flags: None
*/
function function_82ca1565(spawnpoint, gametype)
{
	switch(gametype)
	{
		case "ctf":
		{
			return isdefined(spawnpoint.ctf) && spawnpoint.ctf;
			break;
		}
		case "tdm":
		{
			return isdefined(spawnpoint.tdm) && spawnpoint.tdm;
			break;
		}
		case "war":
		{
			return is_true(spawnpoint.war);
			break;
		}
		case "hash_7c27c07f3b2d8f87":
		{
			return is_true(spawnpoint.var_17478ac6);
			break;
		}
		case "hash_7c27bf7f3b2d8dd4":
		{
			return is_true(spawnpoint.var_607b9d2d);
			break;
		}
		case "hash_7c27c27f3b2d92ed":
		{
			return is_true(spawnpoint.var_32b3419d);
			break;
		}
		case "hash_7c27c17f3b2d913a":
		{
			return is_true(spawnpoint.var_7bf05416);
			break;
		}
		case "hash_7c27bc7f3b2d88bb":
		{
			return is_true(spawnpoint.var_8e33789c);
			break;
		}
		case "hash_35b3b60f0a291417":
		{
			return is_true(spawnpoint.var_3cb82e5e);
			break;
		}
		case "hash_450dd6aacc69e524":
		{
			return is_true(spawnpoint.var_d8e690f8);
			break;
		}
		case "hash_42f07692f7d48364":
		{
			return is_true(spawnpoint.var_3d72e6da);
			break;
		}
		default:
		{
			/#
				assertmsg((((((("" + gametype) + "") + spawnpoint.origin[0]) + "") + spawnpoint.origin[1]) + "") + spawnpoint.origin[2]);
			#/
			break;
		}
	}
	return 0;
}

