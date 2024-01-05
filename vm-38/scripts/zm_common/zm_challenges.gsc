#using script_5f261a5d57de5f7c;
#using scripts\zm_common\zm_zonemgr.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using script_b9d273dc917ee1f;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_perks.gsc;
#using scripts\zm_common\zm_pack_a_punch_util.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\zm_common\zm_customgame.gsc;
#using scripts\zm_common\zm_contracts.gsc;
#using scripts\zm_common\callbacks.gsc;
#using scripts\core_common\throttle_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using script_1caf36ff04a85ff6;
#using scripts\core_common\item_inventory.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\activecamo_shared.gsc;
#using script_61828ad9e71c6616;
#using scripts\killstreaks\killstreaks_util.gsc;

#namespace zm_challenges;

/*
	Name: function_14645875
	Namespace: zm_challenges
	Checksum: 0xE192FEB7
	Offset: 0x3F0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_14645875()
{
	level notify(-198358178);
}

/*
	Name: __init__system__
	Namespace: zm_challenges
	Checksum: 0x90BD60B7
	Offset: 0x410
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_challenges", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_challenges
	Checksum: 0x697896CC
	Offset: 0x468
	Size: 0x230
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	callback::on_start_gametype(&start_gametype);
	callback::on_spawned(&on_spawned);
	callback::on_player_damage(&on_damaged);
	callback::on_laststand(&on_laststand);
	callback::on_bleedout(&on_bleedout);
	callback::on_challenge_complete(&on_challenge_complete);
	callback::on_game_playing(&on_game_playing);
	callback::on_ai_killed(&death_check_for_challenge_updates);
	thread function_e71942eb();
	level.var_417f4274 = [];
	for(i = 0; i < 4; i++)
	{
		var_dae19230 = new class_c6c0e94();
		[[ var_dae19230 ]]->initialize(#"hash_53ac88fccc8c24db", 1, float(function_60d95f53()) / 1000);
		level.var_417f4274[level.var_417f4274.size] = var_dae19230;
	}
	level.var_faccd7d4 = [#"hash_116e94a600e48352":&function_486d4ce3, #"hash_1f8a926447abe886":&function_8c48d8ff, #"hash_2138b9a62ba26ce3":&function_8c48d8ff];
}

/*
	Name: function_8ac3bea9
	Namespace: zm_challenges
	Checksum: 0xA5B56D42
	Offset: 0x6A0
	Size: 0x34
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ac3bea9()
{
	level thread spent_points_tracking();
	level thread function_a9f6b8ef();
}

/*
	Name: start_gametype
	Namespace: zm_challenges
	Checksum: 0xC19761AB
	Offset: 0x6E0
	Size: 0x7C
	Parameters: 0
	Flags: Linked
*/
function start_gametype()
{
	waittillframeend();
	challenges::registerchallengescallback("gun_level_complete_last_rank", &function_b15a1e1e);
	callback::on_connect(&on_connect);
	if(is_true(level.var_ce7af4fa))
	{
		level thread function_f6cfe355();
	}
}

/*
	Name: on_connect
	Namespace: zm_challenges
	Checksum: 0x57B3FD1D
	Offset: 0x768
	Size: 0x1C4
	Parameters: 0
	Flags: Linked
*/
function on_connect()
{
	self thread round_tracking();
	self thread function_e365b5ab();
	self thread function_5bec2304();
	self thread function_169107a0();
	self thread function_d61cb0eb();
	self thread function_b5df0b8b();
	self thread function_12a35616();
	self thread function_b3862180();
	self thread function_4f4a3c59();
	self thread function_79deb4a0();
	self thread function_874334a5();
	self thread watchformantle();
	self thread function_31de0f93();
	self.var_9cd2c51d = {};
	self.var_152810ff = [];
	self.var_152810ff[0] = 0;
	self.var_152810ff[1] = 0;
	self.var_152810ff[2] = 0;
	self.var_152810ff[3] = 0;
	self.var_152810ff[4] = 0;
	self.var_152810ff[5] = 0;
	self.var_152810ff[6] = 1;
}

/*
	Name: on_spawned
	Namespace: zm_challenges
	Checksum: 0xD71FB848
	Offset: 0x938
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function on_spawned()
{
	self thread function_70fb11de(3);
}

/*
	Name: on_damaged
	Namespace: zm_challenges
	Checksum: 0x51F5F97F
	Offset: 0x960
	Size: 0x6A
	Parameters: 1
	Flags: Linked
*/
function on_damaged(params)
{
	self.var_152810ff[1] = 1;
	self.var_152810ff[4] = 1;
	self.var_bd019bbf = 0;
	if(isdefined(self.var_4dd3d657) && self.var_4dd3d657.size > 0)
	{
		self.var_4dd3d657 = [];
	}
}

/*
	Name: on_laststand
	Namespace: zm_challenges
	Checksum: 0x4FA37AC8
	Offset: 0x9D8
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function on_laststand()
{
	self.var_152810ff[2] = 1;
	self.var_152810ff[5] = 1;
}

/*
	Name: on_bleedout
	Namespace: zm_challenges
	Checksum: 0x15DE042
	Offset: 0xA10
	Size: 0x18
	Parameters: 0
	Flags: Linked
*/
function on_bleedout()
{
	self.var_152810ff[3] = 1;
}

/*
	Name: round_tracking
	Namespace: zm_challenges
	Checksum: 0x13AE89C5
	Offset: 0xA30
	Size: 0x500
	Parameters: 0
	Flags: Linked
*/
function round_tracking()
{
	self endon(#"disconnect");
	while(true)
	{
		level waittill(#"end_of_round");
		if(!isdefined(self.var_e394d7c0))
		{
			self.var_e394d7c0 = 0;
		}
		self.var_e394d7c0++;
		if(zm_utility::is_classic() && isdefined(level.round_number))
		{
			var_4533f4c2 = self stats::function_1bb1c57c(#"globalchallenges", #"hash_6a3b487c924d7081", #"challengetier");
			if(!isdefined(var_4533f4c2))
			{
				var_4533f4c2 = 0;
			}
			if(var_4533f4c2 < 1)
			{
				if(level.round_number == 20)
				{
					self stats::function_dad108fa(#"hash_6a3b487c924d7081", 20);
				}
				else if(level.round_number < 20)
				{
					var_12d3a336 = self stats::function_1bb1c57c(#"globalchallenges", #"hash_6a3b487c924d7081", #"challengevalue");
					if(!isdefined(var_12d3a336))
					{
						var_12d3a336 = 0;
					}
					if(var_12d3a336 < level.round_number && var_12d3a336 < 19)
					{
						self stats::function_dad108fa(#"hash_6a3b487c924d7081", 1);
					}
				}
			}
		}
		if(self.var_e394d7c0 < level.round_number - 10)
		{
			continue;
		}
		if(zm_utility::is_trials() && level flag::get("round_reset"))
		{
			continue;
		}
		/#
			self debug_print("");
		#/
		self zm_stats::function_c0c6ab19(#"survive_rounds", 1, 1);
		if(level.round_number == 19 && zm_utility::is_classic() && !self.var_152810ff[4])
		{
			/#
				self debug_print("");
			#/
			self zm_stats::increment_challenge_stat(#"hash_758b3285de8999f", undefined, 1);
		}
		if(!self.var_152810ff[1])
		{
			/#
				self debug_print("");
			#/
			self zm_stats::increment_challenge_stat(#"rounds_no_damage", undefined, 1);
		}
		if(!self.var_152810ff[2])
		{
			/#
				self debug_print("");
			#/
			self zm_stats::increment_challenge_stat(#"hash_2325c4e9d9c8568", undefined, 1);
		}
		if(level.round_number === 99)
		{
			self zm_stats::increment_challenge_stat(#"hash_b1ca52c5ef21dcb");
		}
		if(level.round_number === 19 && !self.var_152810ff[4])
		{
			self zm_stats::increment_challenge_stat(#"hash_2030b96b5a4b7a90");
		}
		if(level.round_number === 19 && (is_true(self.var_152810ff[6]) && !isdefined(self.var_d0355ca8)))
		{
			self zm_stats::increment_challenge_stat(#"hash_1a9f296012aa60db");
		}
		if(level.round_number === 29 && !self.var_152810ff[5])
		{
			self zm_stats::increment_challenge_stat(#"hash_75a098c0db2ab15c");
		}
		self.var_152810ff[1] = 0;
		self.var_152810ff[2] = 0;
	}
}

/*
	Name: death_check_for_challenge_updates
	Namespace: zm_challenges
	Checksum: 0xC8F5047
	Offset: 0xF38
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function death_check_for_challenge_updates(params)
{
	self thread function_f807c679(params.eattacker);
}

/*
	Name: function_f807c679
	Namespace: zm_challenges
	Checksum: 0xDE6D5672
	Offset: 0xF70
	Size: 0x2CC4
	Parameters: 1
	Flags: Linked
*/
function function_f807c679(e_attacker)
{
	if(!isdefined(e_attacker))
	{
		return;
	}
	if(!isplayer(e_attacker))
	{
		return;
	}
	loc_000011E0:
	var_a0345f37 = {#origin:self.origin, #hash_7c9174d1:self.var_7c9174d1, #missinglegs:self.missinglegs, #hash_fc304017:self.var_fc304017, #hash_958cf9c5:self.var_958cf9c5, #hash_5841c56f:self.var_36fa0ac4, #hash_cbf4894c:self.var_cbf4894c, #hash_88421cc2:self.var_88421cc2, #hash_84e41b20:self.var_84e41b20, #hash_2290a541:self.var_2290a541, #enemy_override:self.enemy_override, #hash_8126f3c8:self.var_8126f3c8, #hash_d1b39105:self flag::get(#"hash_83000b27a1fe353"), #hash_6f84b820:self.var_6f84b820, #hash_9fde8624:self.var_9fde8624, #archetype:self.archetype, #is_stunned:self ai::is_stunned(), #w_damage:(isvehicle(self) ? self.w_damage : self.damageweapon), #str_damagemod:(isvehicle(self) ? self.str_damagemod : self.damagemod)};
	var_4838b749 = e_attacker item_inventory::function_d768ea30();
	weapon_item = e_attacker.inventory.items[var_4838b749];
	var_bbfa9bda = {#hash_31af8fb0:e_attacker zm_powerups::is_insta_kill_active(), #hash_611eda49:e_attacker zm_perks::function_80514167(), #hash_7c9dadeb:e_attacker zm_perks::function_9a0e9d65(), #weapon_item:weapon_item};
	var_a0345f37.is_headshot = self zm_utility::is_headshot(var_a0345f37.w_damage, self.damagelocation, var_a0345f37.str_damagemod);
	var_a0345f37.var_d3ed3a9b = self zm_utility::function_4562a3ef(self.damagelocation);
	waitframe(1);
	if(!isplayer(e_attacker))
	{
		return;
	}
	var_be7c9b40 = {};
	[[ level.var_417f4274[e_attacker getentitynumber()] ]]->waitinqueue(var_be7c9b40);
	if(!isplayer(e_attacker))
	{
		return;
	}
	if(zm_loadout::is_lethal_grenade(var_a0345f37.w_damage))
	{
		e_attacker stats::function_dad108fa(#"hash_2d868c0eda640cc6", 1);
	}
	if(isdefined(var_bbfa9bda.weapon_item.aat))
	{
		e_attacker stats::function_dad108fa(#"hash_5e89396e6f618c5a", 1);
	}
	if(var_bbfa9bda.weapon_item.var_627c698b.statname === var_a0345f37.w_damage.statname)
	{
		if(var_bbfa9bda.weapon_item.var_96c71057 === 1)
		{
			e_attacker zm_stats::increment_challenge_stat(#"hash_65d7028060285fa0");
		}
		if(var_bbfa9bda.weapon_item.var_a0cc02cf === 1)
		{
			e_attacker zm_stats::increment_challenge_stat(#"hash_53222585ac81741a");
		}
	}
	if(!e_attacker zm_powerups::is_insta_kill_active() && !e_attacker zm_powerups::function_a4e210c7())
	{
		if(!isdefined(e_attacker.var_bd019bbf))
		{
			e_attacker.var_bd019bbf = 1;
		}
		else
		{
			e_attacker.var_bd019bbf++;
		}
	}
	if(e_attacker.var_bd019bbf === 20)
	{
		e_attacker.var_bd019bbf = 0;
		level scoreevents::doscoreeventcallback("scoreEventZM", {#scoreevent:"killstreak_without_getting_hit_zm", #attacker:e_attacker});
		e_attacker contracts::increment_zm_contract(#"hash_27c82052a38b443a");
	}
	/#
		e_attacker debug_print("");
	#/
	e_attacker zm_stats::increment_challenge_stat(#"kill_enemies", undefined, 1);
	e_attacker zm_stats::function_c0c6ab19(#"kills");
	e_attacker contracts::increment_zm_contract(#"hash_4a67f445fabbabb4");
	e_attacker contracts::function_dff4c02f();
	str_damagemod = var_a0345f37.str_damagemod;
	w_damage = var_a0345f37.w_damage;
	var_7050de53 = w_damage.inventorytype;
	if(str_damagemod !== "MOD_MELEE")
	{
		switch(w_damage.inventorytype)
		{
			case "dwlefthand":
			{
				w_damage = w_damage.dualwieldweapon;
				break;
			}
			case "primary":
			{
				if(!e_attacker playerads())
				{
					e_attacker contracts::increment_zm_contract(#"hash_28124610d29236d9");
					e_attacker stats::function_dad108fa(#"hash_c564d52a7c51ad4", 1);
				}
				else if(e_attacker playerads() > 0)
				{
					e_attacker contracts::increment_zm_contract(#"hash_c5107c9ab542cc8");
				}
				break;
			}
		}
	}
	w_damage = zm_weapons::get_nonalternate_weapon(w_damage);
	e_attacker function_d6b32ad3(w_damage, #"hash_49b586d05aaa0209", 1);
	if(isdefined(var_a0345f37.var_6f84b820))
	{
		switch(var_a0345f37.var_6f84b820)
		{
			case "special":
			{
				/#
					e_attacker debug_print("");
				#/
				e_attacker zm_stats::increment_challenge_stat(#"heavy_kills");
				e_attacker function_d6b32ad3(w_damage, #"specialkills", 1);
				e_attacker stats::inc_stat(#"item_stats", w_damage.name, #"specialkills", #"statvalue", 1);
				e_attacker thread activecamo::function_896ac347(w_damage, #"special_kills", 1);
				e_attacker thread activecamo::function_896ac347(w_damage, #"hash_39ab7cda18fd5c74", 1);
				e_attacker contracts::increment_zm_contract(#"hash_4f442f95b647960b");
				if(var_a0345f37.archetype === #"raz" && var_a0345f37.str_damagemod === "MOD_MELEE")
				{
					e_attacker zm_stats::increment_challenge_stat(#"hash_7df91106483d60b6");
				}
				break;
			}
			case "elite":
			{
				/#
					e_attacker debug_print("");
				#/
				e_attacker zm_stats::increment_challenge_stat(#"mini_boss_kills");
				e_attacker function_d6b32ad3(w_damage, #"hash_20806ac72acd7d15", 1);
				e_attacker stats::inc_stat(#"item_stats", w_damage.name, #"hash_20806ac72acd7d15", #"statvalue", 1);
				e_attacker thread activecamo::function_896ac347(w_damage, #"hash_45814ac55657fc62", 1);
				e_attacker thread activecamo::function_896ac347(w_damage, #"hash_39ab7cda18fd5c74", 1);
				e_attacker contracts::increment_zm_contract(#"hash_1bbcbc1ef268d554");
				break;
			}
			case "normal":
			{
				/#
					e_attacker debug_print("");
				#/
				e_attacker function_d6b32ad3(w_damage, #"verminkills", 1);
				e_attacker stats::inc_stat(#"item_stats", w_damage.name, #"verminkills", #"statvalue", 1);
				e_attacker thread activecamo::function_896ac347(w_damage, #"vermin_kills", 1);
				e_attacker thread activecamo::function_896ac347(w_damage, #"hash_39ab7cda18fd5c74", 1);
				e_attacker contracts::increment_zm_contract(#"hash_2eccd05bcbd822f");
				break;
			}
		}
	}
	if(killstreaks::is_killstreak_weapon(w_damage))
	{
		e_attacker stats::function_b04e7184(w_damage.statname, #"best_kills");
		e_attacker stats::function_dad108fa(#"hash_195bc77f835411ca", 1);
		e_attacker contracts::increment_zm_contract(#"hash_4f513a02494984c0");
		switch(w_damage.statname)
		{
			case "chopper_gunner":
			{
				e_attacker zm_stats::increment_challenge_stat(#"hash_77814b03edd946bc");
				e_attacker contracts::increment_zm_contract(#"hash_1118222f042b742b");
				break;
			}
			case "ultimate_turret":
			{
				e_attacker contracts::increment_zm_contract(#"hash_7da8d70743cddefa");
				break;
			}
			case "hero_pineapplegun":
			{
				e_attacker contracts::increment_zm_contract(#"hash_4b9ddec4f59f76a3");
				break;
			}
			case "sig_bow_flame":
			{
				e_attacker contracts::increment_zm_contract(#"hash_3c3eaa7321a4911c");
				break;
			}
			case "napalm_strike":
			{
				e_attacker contracts::increment_zm_contract(#"hash_4074b35d03a96348");
				e_attacker stats::function_dad108fa(#"hash_3822203fc7c2eadf", 1);
				break;
			}
			case "sig_lmg":
			{
				e_attacker zm_stats::increment_challenge_stat(#"hash_681c57e8ca4bcdf3");
				e_attacker contracts::increment_zm_contract(#"hash_3172e810ab23f874");
				break;
			}
			case "hero_annihilator":
			{
				e_attacker contracts::increment_zm_contract(#"hash_6604da9088edc06f");
				break;
			}
			case "remote_missile":
			case "remote_missile_bomblet":
			case "remote_missile_missile":
			{
				e_attacker contracts::increment_zm_contract(#"hash_1e485aae5e2dc011");
				break;
			}
			case "planemortar":
			{
				e_attacker contracts::increment_zm_contract(#"hash_1e52bb6a2fe54fa1");
				break;
			}
			case "hero_flamethrower":
			{
				e_attacker contracts::increment_zm_contract(#"hash_534b79f1515cac46");
				break;
			}
		}
		switch(w_damage.statname)
		{
			case "remote_missile":
			case "chopper_gunner":
			case "remote_missile_bomblet":
			case "remote_missile_missile":
			case "napalm_strike":
			case "planemortar":
			{
				e_attacker contracts::increment_zm_contract(#"hash_2dfb176e8015feff");
				break;
			}
			case "ultimate_turret":
			case "sig_lmg":
			case "hero_pineapplegun":
			case "sig_bow_flame":
			case "hero_flamethrower":
			case "hero_annihilator":
			{
				e_attacker contracts::increment_zm_contract(#"hash_34e11e6062de3146");
				break;
			}
		}
	}
	if(var_a0345f37.is_headshot)
	{
		/#
			e_attacker debug_print("");
		#/
		e_attacker zm_stats::function_c0c6ab19(#"headshots");
		if(w_damage === e_attacker.var_2a62e678)
		{
			/#
				e_attacker debug_print("");
			#/
			e_attacker zm_stats::increment_challenge_stat(#"hash_e5e9f9a250abfb0");
		}
		if(isdefined(e_attacker.var_807f94d7) && e_attacker.var_807f94d7 > 0)
		{
			/#
				e_attacker debug_print("");
			#/
			e_attacker zm_stats::increment_challenge_stat(#"perk_stronghold_headshots");
		}
	}
	if(var_a0345f37.var_d3ed3a9b && (isdefined(var_a0345f37.str_damagemod) && var_a0345f37.str_damagemod != "MOD_MELEE"))
	{
		e_attacker contracts::increment_zm_contract(#"hash_40cd9410951215b8");
		e_attacker zm_stats::increment_challenge_stat(#"hash_68a582f0fbd97eb2");
		e_attacker function_d6b32ad3(w_damage, #"hash_46422decc5803401", 1);
		w_stat = zm_weapons::get_base_weapon(w_damage);
		if(isdefined(level.zombie_weapons[w_stat]))
		{
			switch(level.zombie_weapons[w_stat].weapon_classname)
			{
				case "ar":
				{
					/#
						e_attacker debug_print("");
					#/
					e_attacker contracts::increment_zm_contract(#"hash_546c523756e9ac9d");
					break;
				}
				case "lmg":
				{
					/#
						e_attacker debug_print("");
					#/
					e_attacker contracts::increment_zm_contract(#"hash_2761852b694b4e58");
					break;
				}
				case "pistol":
				{
					/#
						e_attacker debug_print("");
					#/
					e_attacker contracts::increment_zm_contract(#"hash_2bbe9120c601cb3d");
					break;
				}
				case "shotgun":
				{
					/#
						e_attacker debug_print("");
					#/
					e_attacker contracts::increment_zm_contract(#"hash_6607fdb1e8642de2");
					break;
				}
				case "smg":
				{
					/#
						e_attacker debug_print("");
					#/
					e_attacker contracts::increment_zm_contract(#"hash_1763727e117a0f19");
					break;
				}
				case "sniper":
				{
					/#
						e_attacker debug_print("");
					#/
					e_attacker contracts::increment_zm_contract(#"hash_455135401bc3c771");
					break;
				}
				case "tr":
				{
					/#
						e_attacker debug_print("");
					#/
					e_attacker contracts::increment_zm_contract(#"hash_2f8eabe9d1bd2ee8");
					break;
				}
			}
		}
	}
	if(e_attacker.var_9cd2c51d.var_158e75d4 === #"eq_stimshot" && isdefined(e_attacker.var_9cd2c51d.var_63362b1e) && e_attacker.var_9cd2c51d.var_63362b1e > (gettime() - 6500))
	{
		e_attacker contracts::increment_zm_contract(#"hash_1c456f43ac6ce890");
		e_attacker stats::function_622feb0d(#"eq_stimshot", #"hash_1bc3e0ea4bf67adf", 1);
		e_attacker stats::function_6fb0b113(#"eq_stimshot", #"hash_7612343d459539e4");
	}
	if(isdefined(e_attacker.var_9cd2c51d.var_3ca3137f) && e_attacker.var_9cd2c51d.var_3ca3137f > (gettime() - 6500))
	{
		e_attacker stats::function_8fb23f94(#"self_revive", #"hash_1975d12a85c62fd6", 1);
		e_attacker stats::function_b04e7184(#"self_revive", #"hash_4af819397d9b896e");
	}
	if(str_damagemod === "MOD_MELEE")
	{
		e_attacker contracts::increment_zm_contract(#"hash_6945e246eaae0456");
		e_attacker zm_stats::increment_challenge_stat(#"hash_169c43fc771cc691");
	}
	if(str_damagemod !== "MOD_MELEE" && (str_damagemod === "MOD_GRENADE" || str_damagemod === "MOD_GRENADE_SPLASH" || str_damagemod === "MOD_EXPLOSIVE" || (zm_weapons::is_explosive_weapon(w_damage) && w_damage.name !== "gun_ultimate_turret") || var_a0345f37.var_8126f3c8 === #"explosive"))
	{
		/#
			e_attacker debug_print("");
		#/
		e_attacker zm_stats::increment_challenge_stat(#"explosive_kills");
		e_attacker zm_stats::function_c0c6ab19(#"explosions");
		e_attacker contracts::increment_zm_contract(#"hash_6cde879eb969cfbb");
	}
	if(is_true(var_a0345f37.missinglegs))
	{
		/#
			e_attacker debug_print("");
		#/
		e_attacker zm_stats::increment_challenge_stat(#"zombie_hunter_kill_crawler");
	}
	var_5638aaf2 = e_attacker zm_pap_util::function_2a196eff(w_damage);
	if(e_attacker zm_pap_util::function_b81da3fd(w_damage))
	{
		/#
			e_attacker debug_print("");
		#/
		e_attacker zm_stats::increment_challenge_stat(#"double_pap_kills", undefined, 1);
		e_attacker zm_stats::function_c0c6ab19(#"hash_5d3dce1c38a95835");
		e_attacker zm_stats::function_c0c6ab19(#"repacked_kills");
		e_attacker contracts::increment_zm_contract(#"hash_3178840f53beab88");
		w_stat = zm_weapons::get_base_weapon(w_damage);
		e_attacker zm_stats::increment_challenge_stat(#"pap_kills");
		e_attacker function_d6b32ad3(w_damage, #"packedkills", 1);
		e_attacker stats::inc_stat(#"item_stats", w_damage.name, #"packedkills", #"statvalue", 1);
		e_attacker stats::function_561716e6(w_damage.statname, #"hash_2098d66c36052fa7", 1);
	}
	else
	{
		if(zm_weapons::is_weapon_upgraded(w_damage) || (isdefined(var_5638aaf2) && var_5638aaf2 > 0))
		{
			/#
				e_attacker debug_print("");
			#/
			e_attacker zm_stats::increment_challenge_stat(#"zombie_hunter_kill_packapunch");
			e_attacker zm_stats::increment_challenge_stat(#"pap_kills");
			e_attacker zm_stats::function_c0c6ab19(#"hash_5d3dce1c38a95835");
			e_attacker contracts::increment_zm_contract(#"hash_3178840f53beab88");
			w_stat = zm_weapons::get_base_weapon(w_damage);
			e_attacker function_d6b32ad3(w_stat, #"packedkills", 1);
			e_attacker stats::inc_stat(#"item_stats", w_damage.name, #"packedkills", #"statvalue", 1);
			e_attacker stats::function_561716e6(w_damage.statname, #"hash_2098d66c36052fa7", 1);
		}
		else
		{
			w_stat = zm_weapons::function_386dacbc(w_damage);
		}
	}
	if(zm_weapons::is_wonder_weapon(w_damage) || w_damage.statname === #"ray_gun")
	{
		e_attacker contracts::increment_zm_contract(#"hash_1db0aaefc2baceb4");
	}
	if(!isdefined(e_attacker.var_4dd3d657))
	{
		e_attacker.var_4dd3d657 = [];
	}
	if(isdefined(e_attacker.var_4dd3d657[w_damage.name]))
	{
		e_attacker.var_4dd3d657[w_damage.name].var_6dac8bc5++;
		if(e_attacker.var_4dd3d657[w_damage.name].var_6dac8bc5 === 20)
		{
			e_attacker function_d6b32ad3(w_damage, #"hash_1f3b0d3bd9acb4a5", 1);
			e_attacker.var_4dd3d657[w_damage.name].var_6dac8bc5 = 0;
		}
	}
	else
	{
		e_attacker.var_4dd3d657[w_damage.name] = {#hash_6dac8bc5:1, #weapon:w_damage};
	}
	if(isdefined(level.zombie_weapons[w_stat]))
	{
		switch(level.zombie_weapons[w_stat].weapon_classname)
		{
			case "ar":
			{
				/#
					e_attacker debug_print("");
				#/
				e_attacker zm_stats::increment_challenge_stat(#"ar_kills");
				e_attacker zm_stats::function_c0c6ab19(#"kills_ar");
				break;
			}
			case "lmg":
			{
				/#
					e_attacker debug_print("");
				#/
				e_attacker zm_stats::increment_challenge_stat(#"lmg_kills");
				e_attacker zm_stats::function_c0c6ab19(#"kills_lmg");
				break;
			}
			case "pistol":
			{
				/#
					e_attacker debug_print("");
				#/
				e_attacker zm_stats::increment_challenge_stat(#"pistol_kills");
				e_attacker zm_stats::function_c0c6ab19(#"kills_pistol");
				break;
			}
			case "shotgun":
			{
				/#
					e_attacker debug_print("");
				#/
				e_attacker zm_stats::increment_challenge_stat(#"shotgun_kills");
				e_attacker zm_stats::function_c0c6ab19(#"kills_shotguns");
				break;
			}
			case "smg":
			{
				/#
					e_attacker debug_print("");
				#/
				e_attacker zm_stats::increment_challenge_stat(#"smg_kills");
				e_attacker zm_stats::function_c0c6ab19(#"kills_smg");
				break;
			}
			case "sniper":
			{
				/#
					e_attacker debug_print("");
				#/
				e_attacker zm_stats::increment_challenge_stat(#"sniper_kills");
				e_attacker zm_stats::function_c0c6ab19(#"hash_2333d2f2b7271a56");
				break;
			}
			case "tr":
			{
				/#
					e_attacker debug_print("");
				#/
				e_attacker zm_stats::increment_challenge_stat(#"tr_kills");
				e_attacker zm_stats::function_c0c6ab19(#"hash_26d8f2fa0846a614");
				break;
			}
			case "melee":
			{
				e_attacker zm_stats::increment_challenge_stat(#"hash_28d06d169d6df927");
				break;
			}
		}
	}
	if(w_damage.rootweapon.name == #"smg_handling_t8_dw" || w_damage.rootweapon.name == #"hash_1aea58adc540688c" || w_damage.rootweapon.name == #"smg_handling_t8_upgraded_dw" || w_damage.rootweapon.name == #"hash_3b19c698ebc05141")
	{
		/#
			e_attacker debug_print("");
		#/
		e_attacker zm_stats::increment_challenge_stat(#"hash_2a72be53205a8db3");
		return;
	}
	if(is_true(e_attacker.var_b895a3ff))
	{
		e_attacker zm_stats::increment_challenge_stat(#"hash_588caccb5ea9a399");
	}
	if(isdefined(var_a0345f37.var_7c9174d1) && var_a0345f37.var_7c9174d1.size > 0 && w_damage.name === #"eq_sticky_grenade")
	{
		e_attacker contracts::increment_zm_contract(#"hash_702ce12b92970cd6");
	}
	switch(w_damage.name)
	{
		case "hatchet":
		{
			e_attacker contracts::increment_zm_contract(#"hash_2bdb36192dc0c35b");
			if(distancesquared(var_a0345f37.origin, e_attacker.origin) > 448900)
			{
				e_attacker contracts::increment_zm_contract(#"hash_47e4a8a9710c8504");
			}
			break;
		}
		case "frag_grenade":
		{
			e_attacker contracts::increment_zm_contract(#"hash_404c66f0c2116811");
			break;
		}
		case "eq_sticky_grenade":
		{
			e_attacker contracts::increment_zm_contract(#"hash_5020d12306499cbd");
			break;
		}
		case "satchel_charge":
		{
			e_attacker contracts::increment_zm_contract(#"hash_7e171b76ec0c1c42");
			break;
		}
		case "cymbal_monkey":
		{
			e_attacker contracts::increment_zm_contract(#"hash_2840c9eff7d8c449");
			break;
		}
		case "molotov_fire":
		{
			e_attacker zm_stats::increment_challenge_stat(#"hash_3f2b5f5f5c66ddd3");
			e_attacker contracts::increment_zm_contract(#"hash_4000032e74ffc77d");
			break;
		}
		case "eq_slow_grenade":
		{
			e_attacker contracts::increment_zm_contract(#"hash_4936408b808baff1");
			break;
		}
	}
	switch(w_damage.name)
	{
		case "molotov_fire":
		case "frag_grenade":
		case "hatchet":
		case "eq_sticky_grenade":
		case "eq_slow_grenade":
		case "satchel_charge":
		case "cymbal_monkey":
		{
			e_attacker contracts::increment_zm_contract(#"hash_2eebe80848be398");
			break;
		}
		case "energy_mine":
		case "energy_mine_4":
		case "hash_4ac3fea4add2a2c9":
		case "energy_mine_2":
		case "energy_mine_3":
		case "energy_mine_1":
		{
			e_attacker stats::function_622feb0d(#"energy_mine", #"kills", 1);
		}
		case "hash_85edf3a63bb488c":
		case "frost_blast_1":
		case "frost_blast_3":
		case "frost_blast_2":
		case "frost_blast_5":
		case "frost_blast_4":
		{
			e_attacker contracts::increment_zm_contract(#"hash_1d79330297e3f68b");
			e_attacker stats::function_622feb0d(#"hash_85edf3a63bb488c", #"kills", 1);
			if(var_a0345f37.var_9fde8624 === #"hash_28e36e7b7d5421f")
			{
				e_attacker zm_stats::increment_challenge_stat(#"hash_1f2e2a07900d9e2d");
			}
			break;
		}
	}
	if(w_damage.statname === #"bowie_knife")
	{
		/#
			e_attacker debug_print("");
		#/
		e_attacker zm_stats::increment_challenge_stat(#"bowie_kills");
		return;
	}
	if(is_true(w_damage.var_ff0b00ba))
	{
		/#
			e_attacker debug_print("");
		#/
		e_attacker zm_stats::function_c0c6ab19(#"kills_equipment");
		e_attacker contracts::increment_zm_contract(#"hash_47a744f5c776d978");
	}
	if(zm_utility::is_frag_grenade(w_damage))
	{
		/#
			e_attacker debug_print("");
		#/
		e_attacker zm_stats::increment_challenge_stat(#"frag_kills");
		return;
	}
	if(zm_utility::is_claymore(w_damage))
	{
		/#
			e_attacker debug_print("");
		#/
		e_attacker zm_stats::increment_challenge_stat(#"claymore_kills");
		return;
	}
	if(zm_utility::is_mini_turret(w_damage, 1))
	{
		/#
			e_attacker debug_print("");
		#/
		e_attacker zm_stats::increment_challenge_stat(#"sentry_kills");
		return;
	}
	if(zm_utility::function_b797694c(w_damage))
	{
		/#
			e_attacker debug_print("");
		#/
		e_attacker zm_stats::increment_challenge_stat(#"acid_bomb_kills");
		return;
	}
	if(zm_utility::function_850e7499(w_damage, 1))
	{
		/#
			e_attacker debug_print("");
		#/
		e_attacker zm_stats::increment_challenge_stat(#"hash_4e95db8d75052f1");
		return;
	}
	if(is_true(w_damage.isriotshield))
	{
		/#
			e_attacker debug_print("");
		#/
		e_attacker zm_stats::increment_challenge_stat(#"shield_kills");
		e_attacker contracts::increment_zm_contract(#"hash_7af98643fc22ffd5");
		return;
	}
	if(zm_utility::is_player_valid(e_attacker, 0, 0))
	{
		if(var_a0345f37.var_d1b39105 === 1 || var_a0345f37.var_8126f3c8 === #"electrical" || var_a0345f37.var_fc304017 === 1)
		{
			e_attacker zm_stats::increment_challenge_stat(#"hash_686f14faf15263a0");
		}
		if(var_a0345f37.is_stunned)
		{
			e_attacker contracts::increment_zm_contract(#"hash_4075c12717a62ec7");
		}
		if(isdefined(var_a0345f37.enemy_override) || var_a0345f37.w_damage.name === #"cymbal_monkey")
		{
			e_attacker zm_stats::increment_challenge_stat(#"hash_132df2b4183bc9c8");
			e_attacker contracts::increment_zm_contract(#"hash_4c2b485a7927aadb");
		}
		if((isdefined(var_a0345f37.var_2290a541) ? var_a0345f37.var_2290a541 : 0) > 0 || (isdefined(var_a0345f37.var_84e41b20) && var_a0345f37.var_84e41b20.size > 0) || (isdefined(var_a0345f37.var_88421cc2) && var_a0345f37.var_88421cc2.size > 0) || var_a0345f37.var_8126f3c8 === #"fire")
		{
			e_attacker zm_stats::increment_challenge_stat(#"hash_1a01afd3f720adef");
		}
		if(isdefined(var_a0345f37.var_cbf4894c) && var_a0345f37.var_cbf4894c > 1 || (isdefined(var_a0345f37.var_d70e35fb) && var_a0345f37.var_d70e35fb > 1) || is_true(var_a0345f37.var_958cf9c5) || var_a0345f37.var_8126f3c8 === #"cold")
		{
			e_attacker zm_stats::increment_challenge_stat(#"hash_2f2ad06ca7d8d88b");
		}
		if(var_a0345f37.var_8126f3c8 === #"hash_16b5c37d8feae38c")
		{
			e_attacker zm_stats::increment_challenge_stat(#"hash_7fe169cf58d1d6ef");
		}
	}
}

/*
	Name: watchformantle
	Namespace: zm_challenges
	Checksum: 0x8EA99887
	Offset: 0x3C40
	Size: 0x78
	Parameters: 0
	Flags: Linked
*/
function watchformantle()
{
	self endon(#"disconnect", #"death", #"killmantlemonitor");
	self.mantletime = 0;
	while(true)
	{
		if(self ismantling())
		{
			self.mantletime = gettime();
		}
		wait(0.1);
	}
}

/*
	Name: function_31de0f93
	Namespace: zm_challenges
	Checksum: 0xDC43621D
	Offset: 0x3CC0
	Size: 0x1B2
	Parameters: 0
	Flags: Linked
*/
function function_31de0f93()
{
	self endon(#"disconnect", #"death");
	while(true)
	{
		self waittill(#"hash_381bb741cb320f95");
		weapon = self getinventoryweapon();
		if(killstreaks::is_killstreak_weapon(weapon))
		{
			var_4838b749 = self item_inventory::function_d768ea30();
			if(isdefined(var_4838b749))
			{
				weapon_item = self.inventory.items[var_4838b749];
				if(isdefined(weapon.statname))
				{
					if(!isdefined(weapon_item.first_use))
					{
						switch(weapon.statname)
						{
							case "remote_missile":
							case "remote_missile_bomblet":
							case "remote_missile_missile":
							{
								self stats::function_8fb23f94(#"hash_3de3d523512f7cbc", #"uses", 1);
								break;
							}
							default:
							{
								self stats::function_8fb23f94(weapon.statname, #"uses", 1);
								break;
							}
						}
						weapon_item.first_use = 1;
					}
				}
			}
		}
	}
}

/*
	Name: function_575c37e0
	Namespace: zm_challenges
	Checksum: 0x959A500A
	Offset: 0x3E80
	Size: 0xB52
	Parameters: 2
	Flags: Linked
*/
function function_575c37e0(weapon, enemy)
{
	if(self zm_powerups::is_insta_kill_active() || self zm_powerups::function_a4e210c7())
	{
		self contracts::increment_zm_contract(#"hash_28d69ecb1123398b");
	}
	if(self killstreakrules::function_2912fa8())
	{
		self zm_stats::increment_challenge_stat(#"hash_158beead6820875f");
	}
	if(isdefined(self.mantletime) && self.mantletime > (gettime() - 2000))
	{
		self zm_stats::increment_challenge_stat(#"hash_7c8f5be8bd9ffa06");
	}
	if(is_true(self clientfield::is_registered("" + #"hash_63af42145e260fb5")))
	{
		var_19f4406e = self clientfield::get("" + #"hash_63af42145e260fb5");
		if(var_19f4406e === 1)
		{
			self zm_stats::increment_challenge_stat(#"hash_4184958c0a55d46f");
		}
	}
	var_4838b749 = self item_inventory::function_d768ea30();
	if(isdefined(var_4838b749))
	{
		weapon_item = self.inventory.items[var_4838b749];
		if(weapon_item.var_627c698b.statname === weapon.statname)
		{
			if(weapon_item.var_96c71057 === 1)
			{
				self contracts::increment_zm_contract(#"hash_39d1bb5abc4290a8");
			}
			if(weapon_item.var_a0cc02cf === 1)
			{
				self stats::function_dad108fa(#"hash_15e38ff835419f29", 1);
				self contracts::increment_zm_contract(#"hash_74f9ee275506c72a");
			}
		}
	}
	if(self isinvehicle())
	{
		self zm_stats::function_945c7ce2(#"hash_4a2a695d0f0137d9", 1);
	}
	if(enemy.var_6f84b820 === #"boss")
	{
		if(enemy.archetype === #"hulk")
		{
			self zm_stats::increment_challenge_stat(#"hash_7b482d2a97abe802");
		}
	}
	else
	{
		if(enemy.var_6f84b820 === #"elite" && (!isdefined(enemy.var_e293f8ac) || (isdefined(enemy.var_e293f8ac) && enemy.var_e293f8ac.size === 0)))
		{
			self zm_stats::function_945c7ce2(#"hash_5c79495cf16e0818", 1);
			self stats::function_dad108fa(#"hash_78b5865817a3c321", 1);
			self contracts::increment_zm_contract(#"hash_6552527c7d6010fc");
		}
		else
		{
			if(enemy.var_6f84b820 === #"special")
			{
				if(enemy.archetype === #"mimic")
				{
					self zm_stats::increment_challenge_stat(#"hash_81dfbfc52acbb4b");
				}
				self stats::function_dad108fa(#"hash_1aba6fb35597bd85", 1);
				self zm_stats::function_945c7ce2(#"hash_21e2f8fd18871114", 1);
				self contracts::increment_zm_contract(#"hash_7b3ac5b418ed167c");
			}
			else
			{
				self zm_stats::function_945c7ce2(#"hash_49f1cf535b9700b2", 1);
			}
		}
	}
	if(enemy.archetype === #"zombie_dog")
	{
		self contracts::increment_zm_contract(#"hash_3819a71c22f9ec8f");
	}
	var_5638aaf2 = self zm_pap_util::function_2a196eff(weapon);
	if(zm_weapons::is_weapon_upgraded(weapon) || (isdefined(var_5638aaf2) && var_5638aaf2 > 0))
	{
		self contracts::increment_zm_contract(#"hash_453b44052f10aff9");
		self zm_stats::function_61e39bb6(#"hash_3171d9bb6e1519ac", 1);
		self stats::function_dad108fa(#"hash_48e4f004511eee67", 1);
	}
	self function_d6b32ad3(weapon, #"ekia", 1);
	self function_d6b32ad3(weapon, #"hash_14b7133a39a0456e", 1);
	w_stat = zm_weapons::get_base_weapon(weapon);
	if(isdefined(w_stat.name))
	{
		switch(w_stat.name)
		{
			case "hash_ac86d29509a8939":
			case "hash_5bd48d860ebd5a41":
			{
				self zm_stats::increment_challenge_stat(#"hash_2b7368bb97d41c4f");
				break;
			}
			case "hash_3fa91d1674123e09":
			case "hash_5dd5741f21fd680d":
			case "hash_655d944e437c3d5b":
			case "hash_6e0b27b854e591a3":
			case "hash_72796957033e2e4a":
			{
				self zm_stats::increment_challenge_stat(#"hash_31e51e924e57c83a");
				break;
			}
			case "hash_6319e23758cd25e":
			case "hash_6319f23758cd411":
			case "hash_631a023758cd5c4":
			case "hash_631a123758cd777":
			case "hash_631a223758cd92a":
			case "hash_85edf3a63bb488c":
			case "ring_of_fire":
			case "frost_blast_1":
			case "frost_blast_3":
			case "frost_blast_2":
			case "frost_blast_5":
			case "frost_blast_4":
			case "energy_mine":
			case "energy_mine_4":
			case "hash_4ac3fea4add2a2c9":
			case "energy_mine_2":
			case "energy_mine_3":
			case "energy_mine_1":
			{
				self stats::function_dad108fa(#"hash_1dbfc19533279bd1", 1);
				break;
			}
		}
	}
	if(isdefined(level.zombie_weapons[w_stat]))
	{
		switch(level.zombie_weapons[w_stat].weapon_classname)
		{
			case "ar":
			{
				/#
					self debug_print("");
				#/
				self contracts::increment_zm_contract(#"hash_2df3c0a3d246a317");
				break;
			}
			case "lmg":
			{
				/#
					self debug_print("");
				#/
				self contracts::increment_zm_contract(#"hash_7f2d55373edd6bd4");
				self stats::function_dad108fa(#"hash_3b13dc0e3c4bb2a2", 1);
				break;
			}
			case "pistol":
			{
				/#
					self debug_print("");
				#/
				self contracts::increment_zm_contract(#"hash_3af737750c46d537");
				break;
			}
			case "shotgun":
			{
				/#
					self debug_print("");
				#/
				self contracts::increment_zm_contract(#"hash_2d89237bb56740aa");
				break;
			}
			case "smg":
			{
				/#
					self debug_print("");
				#/
				self contracts::increment_zm_contract(#"hash_286a3c0a06a25f63");
				break;
			}
			case "sniper":
			{
				/#
					self debug_print("");
				#/
				self contracts::increment_zm_contract(#"hash_65ca61d61094915b");
				break;
			}
			case "tr":
			{
				/#
					self debug_print("");
				#/
				self contracts::increment_zm_contract(#"hash_113a972fef98964");
				break;
			}
		}
	}
}

/*
	Name: function_d6b32ad3
	Namespace: zm_challenges
	Checksum: 0x6612E24A
	Offset: 0x49E0
	Size: 0x6C
	Parameters: 3
	Flags: Linked
*/
function function_d6b32ad3(weapon, challenge, amount)
{
	w_stat = zm_weapons::get_base_weapon(weapon);
	if(isdefined(w_stat) && isdefined(challenge))
	{
		self stats::function_e24eec31(w_stat, challenge, amount);
	}
}

/*
	Name: function_4281b2f1
	Namespace: zm_challenges
	Checksum: 0xB4DE61B
	Offset: 0x4A58
	Size: 0x164
	Parameters: 1
	Flags: Linked
*/
function function_4281b2f1(params)
{
	self function_1bedf6f1();
	var_2ab78386 = self.inventory.items[17 + 1];
	var_ff082c28 = self.inventory.items[((17 + 1) + 8) + 1];
	weapon1 = namespace_a0d533d1::function_2b83d3ff(var_2ab78386);
	weapon2 = namespace_a0d533d1::function_2b83d3ff(var_ff082c28);
	if(isdefined(var_2ab78386) && isdefined(weapon1) && (isdefined(var_ff082c28) && isdefined(weapon2)))
	{
		if(var_2ab78386.var_a8bccf69 === 3 && isdefined(var_2ab78386.aat) && (var_ff082c28.var_a8bccf69 === 3 && isdefined(var_ff082c28.aat)))
		{
			if(is_true(self.var_c26d0253))
			{
				self zm_stats::increment_challenge_stat(#"hash_6515936e245d91f6");
			}
		}
	}
}

/*
	Name: spent_points_tracking
	Namespace: zm_challenges
	Checksum: 0xDB3BA557
	Offset: 0x4BC8
	Size: 0xE0
	Parameters: 0
	Flags: Linked
*/
function spent_points_tracking()
{
	level endon(#"end_game");
	while(true)
	{
		result = undefined;
		result = level waittill(#"spent_points");
		player = result.player;
		n_points = result.points;
		player.var_152810ff[0] = player.var_152810ff[0] + n_points;
		/#
			player debug_print("");
		#/
		player zm_stats::increment_challenge_stat(#"points_spent", n_points, 1);
	}
}

/*
	Name: increment_magic_box
	Namespace: zm_challenges
	Checksum: 0x37D29D42
	Offset: 0x4CB0
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function increment_magic_box()
{
	/#
		self debug_print("");
	#/
}

/*
	Name: function_73696786
	Namespace: zm_challenges
	Checksum: 0x1945C2A4
	Offset: 0x4CE0
	Size: 0xC8
	Parameters: 0
	Flags: None
*/
function function_73696786()
{
	self endon(#"disconnect");
	var_c0e0819a = 1;
	while(true)
	{
		s_result = undefined;
		s_result = self waittill(#"hash_13948ef3726b968f");
		if(is_true(var_c0e0819a))
		{
			/#
				self debug_print("");
			#/
			self zm_stats::increment_challenge_stat(#"perks_full");
			var_c0e0819a = undefined;
		}
		self function_b892d1da();
	}
}

/*
	Name: function_5bec2304
	Namespace: zm_challenges
	Checksum: 0xD1B6371D
	Offset: 0x4DB0
	Size: 0x880
	Parameters: 0
	Flags: Linked
*/
function function_5bec2304()
{
	self endon(#"disconnect");
	self.var_bd0352a9 = [];
	self.var_c0e11f30 = {#count:0, #time:gettime()};
	while(true)
	{
		s_result = undefined;
		s_result = self waittill(#"perk_acquired");
		if(self.var_c0e11f30.time > gettime() - 6000)
		{
			self.var_c0e11f30 = {#count:self.var_c0e11f30.count + 1, #time:gettime()};
			if(self.var_c0e11f30.count === 6)
			{
				self zm_stats::increment_challenge_stat(#"hash_60469384a8d07186");
			}
		}
		else
		{
			self.var_c0e11f30 = {#count:1, #time:gettime()};
		}
		switch(s_result.var_16c042b8)
		{
			case "hash_504b3df717f88c4e":
			case "hash_504b3ef717f88e01":
			case "hash_504b3ff717f88fb4":
			case "hash_504b40f717f89167":
			case "hash_504b41f717f8931a":
			case "hash_7f98b3dd3cce95aa":
			{
				self.var_bd0352a9[#"hash_7f98b3dd3cce95aa"] = 1;
				self stats::function_dad108fa("talent_quickrevive_drank", 1);
				break;
			}
			case "hash_520b59b0216b70be":
			case "hash_520b5ab0216b7271":
			case "hash_520b5bb0216b7424":
			case "hash_520b5cb0216b75d7":
			case "hash_520b5db0216b778a":
			case "hash_5930cf0eb070e35a":
			{
				self.var_bd0352a9[#"hash_5930cf0eb070e35a"] = 1;
				self stats::function_dad108fa("talent_speedcola_drank", 1);
				break;
			}
			case "hash_1f95b08e4a49d87e":
			case "hash_1f95b18e4a49da31":
			case "hash_1f95b28e4a49dbe4":
			case "hash_1f95b38e4a49dd97":
			case "hash_1f95b48e4a49df4a":
			case "hash_210097a75bb6c49a":
			{
				self.var_bd0352a9[#"hash_210097a75bb6c49a"] = 1;
				self stats::function_dad108fa("talent_deadshot_drank", 1);
				break;
			}
			case "hash_4110e6372aa77f7e":
			case "hash_4110e6372aa77f7e":
			case "hash_4110e6372aa77f7e":
			case "hash_4110e6372aa77f7e":
			case "hash_4110e6372aa77f7e":
			case "hash_4110e6372aa77f7e":
			{
				self.var_bd0352a9[#"hash_4110e6372aa77f7e"] = 1;
				self stats::function_dad108fa("talent_doubletap_drank", 1);
				break;
			}
			case "hash_47d7a8105237c88":
			case "hash_afdc57f440fb620":
			case "hash_afdc67f440fb7d3":
			case "hash_afdc97f440fbcec":
			case "hash_afdcb7f440fc052":
			case "hash_afdcc7f440fc205":
			{
				self.var_bd0352a9[#"hash_47d7a8105237c88"] = 1;
				self stats::function_dad108fa("talent_juggernog_drank", 1);
				break;
			}
			case "hash_17ccbaee64daa05b":
			case "hash_17ccbbee64daa20e":
			case "hash_17ccbcee64daa3c1":
			case "hash_17ccbdee64daa574":
			case "hash_17ccbeee64daa727":
			case "hash_602a1b6107105f07":
			{
				self.var_bd0352a9[#"hash_602a1b6107105f07"] = 1;
				self stats::function_dad108fa("talent_staminup_drank", 1);
				break;
			}
			case "hash_51b6cc6dbafb7f31":
			case "hash_79774256f321d408":
			case "hash_79774356f321d5bb":
			case "hash_79774556f321d921":
			case "hash_79774856f321de3a":
			case "hash_79774956f321dfed":
			{
				self.var_bd0352a9[#"hash_51b6cc6dbafb7f31"] = 1;
				self stats::function_dad108fa("talent_elemental_pop_drank", 1);
				break;
			}
		}
		var_fff94a73 = self stats::get_stat_global("talent_elemental_pop_drank");
		var_317c380d = self stats::get_stat_global("talent_staminup_drank");
		var_a47cc4dd = self stats::get_stat_global("talent_juggernog_drank");
		var_325628d7 = self stats::get_stat_global("talent_doubletap_drank");
		var_32feae61 = self stats::get_stat_global("talent_deadshot_drank");
		var_6d1d99a3 = self stats::get_stat_global("talent_quickrevive_drank");
		var_1a8aaae7 = self stats::get_stat_global("talent_speedcola_drank");
		if(var_fff94a73 === 1 && self.var_bd0352a9[#"hash_51b6cc6dbafb7f31"] === 1 || (var_317c380d === 1 && self.var_bd0352a9[#"hash_602a1b6107105f07"] === 1) || (var_a47cc4dd === 1 && self.var_bd0352a9[#"hash_47d7a8105237c88"] === 1) || (var_325628d7 === 1 && self.var_bd0352a9[#"hash_4110e6372aa77f7e"] === 1) || (var_32feae61 === 1 && self.var_bd0352a9[#"hash_210097a75bb6c49a"] === 1) || (var_6d1d99a3 === 1 && self.var_bd0352a9[#"hash_7f98b3dd3cce95aa"] === 1) || (var_1a8aaae7 === 1 && self.var_bd0352a9[#"hash_5930cf0eb070e35a"] === 1))
		{
			self zm_stats::increment_challenge_stat(#"hash_39fd6dba5e5b592f");
		}
		self function_1bedf6f1();
		self function_4281b2f1();
	}
}

/*
	Name: function_e365b5ab
	Namespace: zm_challenges
	Checksum: 0x90C109CD
	Offset: 0x5638
	Size: 0x70
	Parameters: 0
	Flags: Linked
*/
function function_e365b5ab()
{
	self endon(#"disconnect");
	while(true)
	{
		s_result = undefined;
		s_result = self waittill(#"hash_4de2d5115dc310e2");
		self.var_152810ff[6] = 0;
		self function_4281b2f1();
	}
}

/*
	Name: function_169107a0
	Namespace: zm_challenges
	Checksum: 0x2A09E967
	Offset: 0x56B0
	Size: 0x70
	Parameters: 0
	Flags: Linked
*/
function function_169107a0()
{
	self endon(#"disconnect");
	while(true)
	{
		s_result = undefined;
		s_result = self waittill(#"hash_75ec9942d2d5fd0f");
		self.var_152810ff[6] = 0;
		self function_4281b2f1();
	}
}

/*
	Name: function_d61cb0eb
	Namespace: zm_challenges
	Checksum: 0xDBC099F1
	Offset: 0x5728
	Size: 0xE2
	Parameters: 0
	Flags: Linked
*/
function function_d61cb0eb()
{
	self endon(#"disconnect");
	while(true)
	{
		s_result = undefined;
		s_result = level waittill(#"hash_159f5d1e1b511031");
		self.var_152810ff[6] = 0;
		if(s_result.player === self)
		{
			self thread function_70fb11de(3);
			var_4838b749 = self item_inventory::function_d768ea30();
			if(!isdefined(var_4838b749))
			{
				return;
			}
			weapon_item = self.inventory.items[var_4838b749];
			weapon_item.var_96c71057 = 1;
		}
	}
}

/*
	Name: function_b5df0b8b
	Namespace: zm_challenges
	Checksum: 0xF78C5FDB
	Offset: 0x5818
	Size: 0x90
	Parameters: 0
	Flags: Linked
*/
function function_b5df0b8b()
{
	self endon(#"disconnect");
	while(true)
	{
		self waittill(#"hash_63344bbf1789e2c7");
		self thread function_70fb11de(6);
		if(isdefined(self.var_3a289354) && self.var_3a289354.size > 33)
		{
			self zm_stats::increment_challenge_stat(#"hash_4cd4e442cac88468");
		}
	}
}

/*
	Name: function_b3862180
	Namespace: zm_challenges
	Checksum: 0x534F8498
	Offset: 0x58B0
	Size: 0x244
	Parameters: 0
	Flags: Linked
*/
function function_b3862180()
{
	self endon(#"disconnect");
	level thread function_5bce3615();
	self.var_55f98899 = [];
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"zone_change");
		if(is_true(level.var_92c52eed))
		{
			if(!isdefined(self.var_55f98899))
			{
				self.var_55f98899 = [];
			}
			else if(!isarray(self.var_55f98899))
			{
				self.var_55f98899 = array(self.var_55f98899);
			}
			if(!isinarray(self.var_55f98899, waitresult.zone_name))
			{
				self.var_55f98899[self.var_55f98899.size] = waitresult.zone_name;
			}
			if(self.var_55f98899.size === level.zones.size)
			{
				self zm_stats::increment_challenge_stat(#"hash_ec057f8bdec38d9");
			}
		}
		else if(is_true(level.var_ce7af4fa))
		{
			if(waitresult.zone_name === "zone_bunny_room_1" || waitresult.zone_name === "zone_bunny_room_2")
			{
				level.zone_names[#"hash_d002a29a2fe6e72"] = 1;
			}
			else
			{
				zone_name = [[level.var_27028b8e]](self zm_zonemgr::get_player_zone());
				if(isdefined(zone_name))
				{
					level.zone_names[zone_name] = 1;
				}
			}
			var_6e157233 = self function_3e8babbf();
			if(is_true(var_6e157233))
			{
				return;
			}
		}
	}
}

/*
	Name: function_3e8babbf
	Namespace: zm_challenges
	Checksum: 0x2F8687C
	Offset: 0x5B00
	Size: 0x13C
	Parameters: 0
	Flags: Linked
*/
function function_3e8babbf()
{
	var_19a6f5c4 = 0;
	foreach(var_c93f7d90 in level.zone_names)
	{
		if(is_true(var_c93f7d90))
		{
			var_19a6f5c4++;
		}
	}
	if(var_19a6f5c4 === level.zone_names.size)
	{
		self zm_stats::increment_challenge_stat(#"hash_38bef53143af72bc");
	}
	var_b6cbfb04 = self stats::get_stat(#"playerstatslist", #"hash_38bef53143af72bc", #"challengetier");
	if(isdefined(var_b6cbfb04) && var_b6cbfb04 > 0)
	{
		return true;
	}
	return false;
}

/*
	Name: function_5bce3615
	Namespace: zm_challenges
	Checksum: 0xE58CC3D8
	Offset: 0x5C48
	Size: 0x128
	Parameters: 0
	Flags: Linked
*/
function function_5bce3615()
{
	if(!isdefined(level.zone_names))
	{
		level.zone_names = [];
	}
	foreach(zone in level.zones)
	{
		if(isdefined(level.var_27028b8e))
		{
			if(zone.name === "zone_bunny_room_1" || zone.name === "zone_bunny_room_2")
			{
				level.zone_names[#"hash_d002a29a2fe6e72"] = 0;
				continue;
			}
			zone_name = [[level.var_27028b8e]](zone.name);
			if(isdefined(zone_name))
			{
				level.zone_names[zone_name] = 0;
			}
		}
	}
}

/*
	Name: function_f6cfe355
	Namespace: zm_challenges
	Checksum: 0x7B994CDF
	Offset: 0x5D78
	Size: 0x256
	Parameters: 0
	Flags: Linked
*/
function function_f6cfe355()
{
	level endon(#"end_game");
	while(true)
	{
		level waittill(#"captured_control_point");
		var_6012e65d = 0;
		players = getplayers();
		foreach(player in players)
		{
			if(zm_utility::is_player_valid(player, 0, 1))
			{
				player zm_stats::increment_challenge_stat(#"hash_7a07b005bc08a081");
			}
		}
		foreach(var_9fbdac89 in level.var_cc43b632)
		{
			if(var_9fbdac89.var_269ad176 === 2)
			{
				var_6012e65d++;
			}
		}
		if(var_6012e65d >= level.var_cc43b632.size)
		{
			foreach(player in players)
			{
				if(zm_utility::is_player_valid(player, 0, 1))
				{
					player zm_stats::increment_challenge_stat(#"hash_5235cb868a2e5bc1");
				}
			}
			return;
		}
	}
}

/*
	Name: function_4f4a3c59
	Namespace: zm_challenges
	Checksum: 0x6DE65D69
	Offset: 0x5FD8
	Size: 0x270
	Parameters: 0
	Flags: Linked
*/
function function_4f4a3c59()
{
	self endon(#"disconnect");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"hash_18e59631bf777496");
		if(isdefined(waitresult.heal_amount) && waitresult.heal_amount > 0 && (isdefined(self.var_9cd2c51d.var_43797ec0) && self.var_9cd2c51d.var_43797ec0.statname === #"eq_stimshot"))
		{
			if(waitresult.heal_amount > 100)
			{
				self zm_stats::increment_challenge_stat(#"hash_3b5e5bb023a2f505");
			}
			var_b9109e15 = self stats::function_97f7728e(#"eq_stimshot", #"hash_28be23967ca019c6");
			var_dfe20cae = self stats::function_97f7728e(#"eq_stimshot", #"uses");
			if(isdefined(var_b9109e15) && isdefined(var_dfe20cae))
			{
				var_eb6c0e3f = ((var_b9109e15 * var_dfe20cae) + waitresult.heal_amount) / var_dfe20cae;
				var_7ed9a4d4 = int(var_eb6c0e3f);
				self stats::function_c8da9a88(#"eq_stimshot", #"hash_28be23967ca019c6", var_7ed9a4d4);
			}
			else
			{
				self stats::function_c8da9a88(#"eq_stimshot", #"hash_28be23967ca019c6", waitresult.heal_amount);
			}
			self stats::function_622feb0d(#"eq_stimshot", #"uses");
			self contracts::increment_zm_contract(#"hash_5b8c91da65d60b4b", waitresult.heal_amount);
		}
	}
}

/*
	Name: function_874334a5
	Namespace: zm_challenges
	Checksum: 0xD3847CC
	Offset: 0x6250
	Size: 0x3CE
	Parameters: 0
	Flags: Linked
*/
function function_874334a5()
{
	self endon(#"disconnect");
	if(1)
	{
		level flag::wait_till(#"main_quest_completed");
		players = getplayers();
		foreach(player in players)
		{
			if(!is_true(player.var_4a996ccb))
			{
				player.var_4a996ccb = 1;
				if(is_true(level.var_92c52eed))
				{
					player zm_stats::increment_challenge_stat(#"hash_45419091cdb5f154");
				}
				else if(is_true(level.var_ce7af4fa))
				{
					player zm_stats::increment_challenge_stat(#"hash_139c5d1048195803");
				}
				if(!is_true(player.var_b9ff264c))
				{
					player.var_b9ff264c = 1;
					player zm_stats::increment_challenge_stat(#"hash_67429a304536459");
					player contracts::increment_zm_contract(#"hash_885ac2ac2e7c422");
					if(player.score >= 30000)
					{
						player zm_stats::increment_challenge_stat(#"hash_5670ae565826fea2");
					}
					if(level.round_number >= 31 && is_true(level.var_92c52eed))
					{
						player zm_stats::increment_challenge_stat(#"hash_5be5c4c5dacd7bec");
					}
					player zm_stats::function_945c7ce2(#"hash_1e1cccf58903bfa8", 1);
					if(!is_true(player.var_8a246020))
					{
						player.var_8a246020 = 1;
						player stats::function_dad108fa(#"hash_359f26f3fe7b3e34", 1);
						player stats::function_dad108fa(#"hash_6b9b36fedfb95f3c", 1);
						player zm_stats::function_61e39bb6(#"hash_3c8e09a04082db5e", 1);
					}
					if(!isdefined(player.var_e394d7c0) || (isdefined(player.var_e394d7c0) && player.var_e394d7c0 < (level.round_number - 5)))
					{
						continue;
					}
					if(!isdefined(player.var_e7b05e99) && !is_true(player.var_18d824e4))
					{
						player.var_18d824e4 = 1;
						player zm_stats::increment_challenge_stat(#"hash_6cf6b4ae9ac877b0");
					}
				}
			}
		}
		return;
	}
}

/*
	Name: function_79deb4a0
	Namespace: zm_challenges
	Checksum: 0x47A6058D
	Offset: 0x6628
	Size: 0x3A4
	Parameters: 0
	Flags: Linked
*/
function function_79deb4a0()
{
	self endon(#"disconnect");
	while(true)
	{
		waitresult = undefined;
		waitresult = level waittill(#"hash_4fbe4720f6f13107");
		if(waitresult.b_success === 1)
		{
			players = function_a1ef346b();
			foreach(player in players)
			{
				if(!is_true(player.var_b9ff264c))
				{
					player.var_b9ff264c = 1;
					player zm_stats::increment_challenge_stat(#"hash_67429a304536459");
					player contracts::increment_zm_contract(#"hash_885ac2ac2e7c422");
					if(player.score >= 30000)
					{
						player zm_stats::increment_challenge_stat(#"hash_5670ae565826fea2");
					}
					if(level.round_number >= 31 && is_true(level.var_92c52eed))
					{
						player zm_stats::increment_challenge_stat(#"hash_5be5c4c5dacd7bec");
					}
					if(is_true(level.is_survival) && isdefined(level.var_b48509f9) && level.var_b48509f9 >= 10)
					{
						player zm_stats::increment_challenge_stat(#"hash_52d86f82675aaf1a");
					}
					player zm_stats::function_945c7ce2(#"hash_1e1cccf58903bfa8", 1);
					if(!is_true(player.var_8a246020))
					{
						player.var_8a246020 = 1;
						player stats::function_dad108fa(#"hash_359f26f3fe7b3e34", 1);
						player stats::function_dad108fa(#"hash_6b9b36fedfb95f3c", 1);
						player zm_stats::function_61e39bb6(#"hash_3c8e09a04082db5e", 1);
					}
					if(!isdefined(player.var_e394d7c0) || (isdefined(player.var_e394d7c0) && player.var_e394d7c0 < (level.round_number - 5)))
					{
						continue;
					}
					if(!isdefined(player.var_e7b05e99) && !is_true(player.var_18d824e4))
					{
						player.var_18d824e4 = 1;
						player zm_stats::increment_challenge_stat(#"hash_6cf6b4ae9ac877b0");
					}
				}
			}
		}
	}
}

/*
	Name: function_82383b3e
	Namespace: zm_challenges
	Checksum: 0xA4842263
	Offset: 0x69D8
	Size: 0x36
	Parameters: 0
	Flags: None
*/
function function_82383b3e()
{
	self endon(#"disconnect");
	while(true)
	{
		self waittill(#"intel_collected");
	}
}

/*
	Name: function_12a35616
	Namespace: zm_challenges
	Checksum: 0xA419A75C
	Offset: 0x6A18
	Size: 0xA2
	Parameters: 0
	Flags: Linked
*/
function function_12a35616()
{
	self endon(#"disconnect");
	while(true)
	{
		waitresult = undefined;
		waitresult = level waittill(#"blueprint_completed");
		if(isdefined(waitresult.produced) && is_true(waitresult.produced.isriotshield))
		{
			/#
				self debug_print("");
			#/
			return;
		}
	}
}

/*
	Name: function_a9f6b8ef
	Namespace: zm_challenges
	Checksum: 0xADBAC9BE
	Offset: 0x6AC8
	Size: 0x148
	Parameters: 0
	Flags: Linked
*/
function function_a9f6b8ef()
{
	level endon(#"end_game");
	if(zm_custom::function_901b751c(#"zmpapenabled") == 2 || zm_custom::function_901b751c(#"zmpapenabled") == 0)
	{
		return;
	}
	level flag::wait_till("pap_machine_active");
	foreach(player in level.players)
	{
		/#
			player debug_print("");
		#/
		player zm_stats::increment_challenge_stat(#"pap_activation", undefined, 1);
	}
}

/*
	Name: debug_print
	Namespace: zm_challenges
	Checksum: 0xFDBB26BC
	Offset: 0x6C18
	Size: 0x6C
	Parameters: 1
	Flags: None
*/
function debug_print(str_line)
{
	/#
		if(getdvarint(#"zombie_debug", 0) > 0)
		{
			println((("" + self.entity_num) + "") + str_line);
		}
	#/
}

/*
	Name: on_challenge_complete
	Namespace: zm_challenges
	Checksum: 0xE8BBF421
	Offset: 0x6C90
	Size: 0x36
	Parameters: 1
	Flags: Linked
*/
function on_challenge_complete(params)
{
	n_challenge_index = params.challenge_index;
}

/*
	Name: is_challenge
	Namespace: zm_challenges
	Checksum: 0xB436A4A6
	Offset: 0x6CD0
	Size: 0xE
	Parameters: 1
	Flags: Linked
*/
function is_challenge(n_challenge_index)
{
	return false;
}

/*
	Name: function_9a9ab6f6
	Namespace: zm_challenges
	Checksum: 0xC802313D
	Offset: 0x6CE8
	Size: 0x124
	Parameters: 1
	Flags: None
*/
function function_9a9ab6f6(var_1c48b665)
{
	self zm_stats::increment_challenge_stat(var_1c48b665);
	foreach(var_6c7a7f72 in array(#"darkops_zod_ee", #"hash_6d5340d9e43ed73d", #"hash_ad3a508a80a0e6e"))
	{
		if(!self stats::get_stat_global(var_6c7a7f72))
		{
			return;
		}
	}
	/#
		self debug_print("");
	#/
	self zm_stats::increment_challenge_stat(#"hash_405387fd6efe78b3");
}

/*
	Name: function_1bedf6f1
	Namespace: zm_challenges
	Checksum: 0xC64BA746
	Offset: 0x6E18
	Size: 0xD4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_1bedf6f1()
{
	if(self namespace_e86ffa8::function_7bf30775(0) && self namespace_e86ffa8::function_8923370c(0) && self namespace_e86ffa8::function_efb6dedf(0) && self namespace_e86ffa8::function_3623f9d1(0) && self namespace_e86ffa8::function_cd6787b(0) && self namespace_e86ffa8::function_71680faf(0))
	{
		if(!isdefined(self.var_c26d0253))
		{
			self contracts::increment_zm_contract(#"hash_7a3b8f92688f1d73");
			self.var_c26d0253 = 1;
		}
		return;
	}
}

/*
	Name: function_b892d1da
	Namespace: zm_challenges
	Checksum: 0x7BAE9598
	Offset: 0x6EF8
	Size: 0x174
	Parameters: 0
	Flags: Linked, Private
*/
function private function_b892d1da()
{
	var_684d09cd = array(#"perk_juggernog", #"perk_quick_revive", #"perk_sleight_of_hand", #"perk_staminup", #"perk_dead_shot", #"perk_elemental_pop");
	foreach(var_9b9f4901 in var_684d09cd)
	{
		if(!self stats::get_stat(#"perk_stats", var_9b9f4901, #"modifier_given", #"statvalue"))
		{
			return;
		}
	}
	/#
		self debug_print("");
	#/
	self zm_stats::increment_challenge_stat(#"hash_34f185c936027147", undefined, 1);
}

/*
	Name: function_bf0be8f1
	Namespace: zm_challenges
	Checksum: 0xC7820905
	Offset: 0x7078
	Size: 0x134
	Parameters: 0
	Flags: Linked
*/
function function_bf0be8f1()
{
	foreach(str_map in array("zm_zodt8", "zm_towers", "zm_escape"))
	{
		if(!self stats::get_stat(#"playerstatsbymap", str_map, #"hash_74e26ca9652802fb", level.gametype, #"stats", "FASTEST_TIME_TO_COMPLETE_ROUND_30", #"statvalue"))
		{
			return;
		}
	}
	/#
		self debug_print("");
	#/
	self zm_stats::increment_challenge_stat(#"hash_c59a95e3be43538");
}

/*
	Name: function_e40c9d13
	Namespace: zm_challenges
	Checksum: 0xDA42E654
	Offset: 0x71B8
	Size: 0x304
	Parameters: 0
	Flags: Linked
*/
function function_e40c9d13()
{
	var_b361a853 = array(#"ar_accurate_t8_upgraded", #"ar_damage_t8_upgraded", #"ar_fastfire_t8_upgraded", #"ar_mg1909_t8_upgraded", #"ar_modular_t8_upgraded", #"ar_stealth_t8_upgraded", #"launcher_standard_t8_upgraded", #"lmg_double_t8_upgraded", #"lmg_heavy_t8_upgraded", #"lmg_spray_t8_upgraded", #"lmg_standard_t8_upgraded", #"pistol_burst_t8_upgraded", #"pistol_revolver_t8_upgraded", #"pistol_standard_t8_upgraded", #"pistol_topbreak_t8_upgraded", #"shotgun_pump_t8_upgraded", #"shotgun_semiauto_t8_upgraded", #"shotgun_trenchgun_t8_upgraded", #"smg_accurate_t8_upgraded", #"smg_capacity_t8_upgraded", #"smg_drum_pistol_t8_upgraded", #"smg_fastfire_t8_upgraded", #"smg_handling_t8_upgraded", #"smg_standard_t8_upgraded", #"sniper_powerbolt_t8_upgraded", #"sniper_powersemi_t8_upgraded", #"sniper_quickscope_t8_upgraded", #"tr_leveraction_t8_upgraded", #"tr_longburst_t8_upgraded", #"tr_midburst_t8_upgraded", #"tr_powersemi_t8_upgraded");
	foreach(var_5f8b3585 in var_b361a853)
	{
		if(!self stats::get_stat(#"item_stats", var_5f8b3585, #"doublepacked", #"statvalue"))
		{
			return;
		}
	}
	/#
		self debug_print("");
	#/
	self zm_stats::increment_challenge_stat(#"hash_40d2ff74fd37a2ab", undefined, 1);
}

/*
	Name: function_b8aa1069
	Namespace: zm_challenges
	Checksum: 0xA23C18BC
	Offset: 0x74C8
	Size: 0x394
	Parameters: 0
	Flags: Linked
*/
function function_b8aa1069()
{
	if(!level.onlinegame || is_true(level.zm_disable_recording_stats))
	{
		return;
	}
	var_845ac04e = self stats::get_stat_global("t9_tu5_zm_hunter_mastery_fixup");
	if(!isdefined(var_845ac04e))
	{
		var_845ac04e = 0;
	}
	if(var_845ac04e != 1)
	{
		var_76f39460 = self stats::get_stat_challenge(#"zombie_hunter_mastery");
		if(!isdefined(var_76f39460))
		{
			return;
		}
		var_2994e135 = self stats::get_stat(#"playerstatslist", #"hash_6b6279ca26024847", #"challengetier");
		if(!isdefined(var_2994e135))
		{
			return;
		}
		var_99d0574f = self stats::get_stat(#"playerstatslist", #"hash_1ceaeed13ab4546b", #"challengetier");
		if(!isdefined(var_99d0574f))
		{
			return;
		}
		var_c92e42cb = self stats::get_stat(#"playerstatslist", #"hash_45814ac55657fc62", #"challengetier");
		if(!isdefined(var_c92e42cb))
		{
			return;
		}
		var_4d67e7b2 = self stats::get_stat(#"playerstatslist", #"hash_60594d8f8bc8764b", #"challengetier");
		if(!isdefined(var_4d67e7b2))
		{
			return;
		}
		var_a391451e = self stats::get_stat(#"playerstatslist", #"hash_132df2b4183bc9c8", #"challengetier");
		if(!isdefined(var_a391451e))
		{
			return;
		}
		var_1c2a202d = self stats::get_stat(#"playerstatslist", #"hash_6dfaf1d66eb666ae", #"challengetier");
		if(!isdefined(var_1c2a202d))
		{
			return;
		}
		var_58b42ec7 = 0;
		if(var_2994e135 >= 3)
		{
			var_58b42ec7++;
		}
		if(var_99d0574f >= 3)
		{
			var_58b42ec7++;
		}
		if(var_c92e42cb >= 3)
		{
			var_58b42ec7++;
		}
		if(var_4d67e7b2 >= 3)
		{
			var_58b42ec7++;
		}
		if(var_a391451e >= 3)
		{
			var_58b42ec7++;
		}
		if(var_1c2a202d >= 1)
		{
			var_58b42ec7++;
		}
		if(var_58b42ec7 > var_76f39460 && var_1c2a202d >= 1)
		{
			self zm_stats::increment_challenge_stat(#"zombie_hunter_mastery", 1);
		}
		self stats::set_stat_global("t9_tu5_zm_hunter_mastery_fixup", 1);
	}
}

/*
	Name: function_b15a1e1e
	Namespace: zm_challenges
	Checksum: 0xA94D1FD0
	Offset: 0x7868
	Size: 0x4C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_b15a1e1e(eventstruct)
{
	self challenges::function_d43316bd(#"hash_1cba6f375b8ef307", eventstruct);
	self challenges::function_4e40694d(#"hash_1cba6f375b8ef307", eventstruct);
}

/*
	Name: function_8c48d8ff
	Namespace: zm_challenges
	Checksum: 0xE3DB0FA4
	Offset: 0x78C0
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_8c48d8ff(eventstruct)
{
	self challenges::function_4e40694d(#"hash_1cba6f375b8ef307", eventstruct);
}

/*
	Name: function_486d4ce3
	Namespace: zm_challenges
	Checksum: 0x9723CBBB
	Offset: 0x78F8
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_486d4ce3(eventstruct)
{
	self challenges::function_4e40694d(#"hash_1cba6f375b8ef307", eventstruct);
}

/*
	Name: function_e71942eb
	Namespace: zm_challenges
	Checksum: 0x6DDA4E29
	Offset: 0x7930
	Size: 0xD8
	Parameters: 0
	Flags: Linked
*/
function function_e71942eb()
{
	level endon(#"end_game");
	waittillframeend();
	level flag::wait_till("all_players_spawned");
	players = getplayers();
	foreach(player in players)
	{
		player thread function_eb3f0817();
	}
}

/*
	Name: function_70fb11de
	Namespace: zm_challenges
	Checksum: 0x8205556A
	Offset: 0x7A10
	Size: 0x1AC
	Parameters: 1
	Flags: Linked
*/
function function_70fb11de(wait_time)
{
	self endon(#"death", #"disconnect");
	level endon(#"end_game");
	if(isdefined(wait_time))
	{
		wait(wait_time);
	}
	primaryweapon = self namespace_a0d533d1::function_2b83d3ff(self item_inventory::function_2e711614(17 + 1));
	secondaryweapon = self namespace_a0d533d1::function_2b83d3ff(self item_inventory::function_2e711614(((17 + 1) + 8) + 1));
	if(isdefined(primaryweapon))
	{
		var_74d1fc7b = getbaseweaponitemindex(primaryweapon);
		if(isdefined(var_74d1fc7b))
		{
			params = {};
			params.item_index = var_74d1fc7b;
			self challenges::function_4e40694d(#"hash_1cba6f375b8ef307", params);
		}
	}
	if(isdefined(secondaryweapon))
	{
		var_f547d6d2 = getbaseweaponitemindex(secondaryweapon);
		if(isdefined(var_f547d6d2))
		{
			params = {};
			params.item_index = var_f547d6d2;
			self challenges::function_4e40694d(#"hash_1cba6f375b8ef307", params);
		}
	}
}

/*
	Name: function_eb3f0817
	Namespace: zm_challenges
	Checksum: 0xECB9FB04
	Offset: 0x7BC8
	Size: 0x60
	Parameters: 0
	Flags: Linked
*/
function function_eb3f0817()
{
	self endon(#"death", #"disconnect");
	while(true)
	{
		self waittill(#"loadout_given");
		self thread function_70fb11de(3);
	}
}

/*
	Name: on_game_playing
	Namespace: zm_challenges
	Checksum: 0x88F5FC67
	Offset: 0x7C30
	Size: 0x1A0
	Parameters: 1
	Flags: Linked
*/
function on_game_playing(params)
{
	level waittill(#"initial_fade_in_complete");
	players = getplayers();
	foreach(player in players)
	{
		player thread function_1dd9fc03();
		player thread function_b8aa1069();
		if(getdvar(#"hash_570880cbdb22b9ac", 0) == 0)
		{
			player thread function_bc7f70a4();
		}
		player thread function_a51a383b();
		if(is_true(level.var_ce7af4fa))
		{
			player thread namespace_4abf1500::function_a2579c2d(#"hash_65e0f8450289b67b");
			continue;
		}
		if(is_true(level.var_92c52eed))
		{
			player thread namespace_4abf1500::function_a2579c2d(#"hash_55a1ddeb84bc2ce8");
		}
	}
}

/*
	Name: function_a51a383b
	Namespace: zm_challenges
	Checksum: 0xEF2F3EEB
	Offset: 0x7DD8
	Size: 0x1A4
	Parameters: 0
	Flags: Linked
*/
function function_a51a383b()
{
	if(!level.onlinegame || is_true(level.zm_disable_recording_stats) || !isplayer(self))
	{
		return;
	}
	var_845ac04e = self stats::get_stat_global("t9_tu7_zm_omega_intel_challenge_fixedup");
	if(!isdefined(var_845ac04e))
	{
		var_845ac04e = 0;
	}
	if(var_845ac04e != 1)
	{
		self stats::set_stat_global("t9_tu7_zm_omega_intel_challenge_fixedup", 1);
		var_64b5aa3d = self stats::get_stat(#"playerstatslist", #"hash_607cee7194682397", #"challengevalue");
		if(!isdefined(var_64b5aa3d))
		{
			var_64b5aa3d = 0;
		}
		if(var_64b5aa3d >= 13)
		{
			self stats::set_stat(#"playerstatslist", #"hash_607cee7194682397", #"challengevalue", 12);
			self stats::inc_stat(#"playerstatslist", #"hash_607cee7194682397", #"challengevalue", 1);
		}
	}
}

/*
	Name: function_bc7f70a4
	Namespace: zm_challenges
	Checksum: 0x5D3221CA
	Offset: 0x7F88
	Size: 0x1E4
	Parameters: 0
	Flags: Linked
*/
function function_bc7f70a4()
{
	if(!level.onlinegame || is_true(level.zm_disable_recording_stats) || !isplayer(self))
	{
		return;
	}
	var_845ac04e = self stats::get_stat_global("t9_tu7_zm_s1_mastery_fixedup");
	if(!isdefined(var_845ac04e))
	{
		var_845ac04e = 0;
	}
	if(var_845ac04e != 1)
	{
		if(!stats::function_f94325d3())
		{
			return false;
		}
		self stats::set_stat_global("t9_tu7_zm_s1_mastery_fixedup", 1);
		var_71d636c6 = self stats::function_1bb1c57c(#"globalchallenges", #"hash_5dc4288a3e83811e", #"challengetier");
		if(!isdefined(var_71d636c6))
		{
			var_71d636c6 = 0;
		}
		if(var_71d636c6 >= 1)
		{
			self function_dc7c4fb9(#"globalchallenges", #"hash_5dc4288a3e83811e", #"challengetier", 0);
			self function_dc7c4fb9(#"globalchallenges", #"hash_5dc4288a3e83811e", #"challengevalue", 19);
			self stats::function_dad108fa(#"hash_5dc4288a3e83811e", 1);
		}
	}
}

/*
	Name: function_dc7c4fb9
	Namespace: zm_challenges
	Checksum: 0xC1D668C7
	Offset: 0x8178
	Size: 0x13A
	Parameters: 1
	Flags: Linked, Variadic
*/
function function_dc7c4fb9(...)
{
	/#
		assert(vararg.size > 1);
	#/
	if(vararg.size <= 1)
	{
		return 0;
	}
	if(!stats::function_f94325d3())
	{
		return 0;
	}
	result = 0;
	if(isdefined(self))
	{
		/#
			assert(isplayer(self), "");
		#/
		value = vararg[vararg.size - 1];
		arrayremoveindex(vararg, vararg.size - 1);
		result = self writestat(2, vararg, value);
		/#
			stats::function_d92cb558(result, vararg);
		#/
	}
	return is_true(result);
}

/*
	Name: function_1dd9fc03
	Namespace: zm_challenges
	Checksum: 0x424CF4B7
	Offset: 0x82C0
	Size: 0x840
	Parameters: 0
	Flags: Linked
*/
function function_1dd9fc03()
{
	if(!level.onlinegame || is_true(level.zm_disable_recording_stats))
	{
		return;
	}
	var_845ac04e = self stats::get_stat_global("t9_tu5_zm_dark_matter_fixedup");
	if(!isdefined(var_845ac04e))
	{
		var_845ac04e = 0;
	}
	if(var_845ac04e != 1)
	{
		self stats::set_stat_global("t9_tu5_zm_dark_matter_fixedup", 1);
		weapon_names = [];
		weapon_names[#"weapon_tactical"] = [3:#"tr_precisionsemi_t9", 2:#"tr_powerburst_t9", 1:#"tr_longburst_t9", 0:#"tr_damagesemi_t9"];
		weapon_names[#"weapon_smg"] = [5:#"smg_burst_t9", 4:#"smg_capacity_t9", 3:#"smg_fastfire_t9", 2:#"smg_handling_t9", 1:#"smg_heavy_t9", 0:#"smg_standard_t9"];
		foreach(weapon in weapon_names[#"weapon_tactical"])
		{
			var_79aea5cb = 0;
			var_d33334c3 = 0;
			var_782a947 = 0;
			var_45c0113e = 0;
			var_e0ce2c9f = 0;
			var_71709b6e = 0;
			var_daca47a6 = 0;
			var_b1d90f13 = self stats::get_stat(#"item_stats", weapon, #"kills", #"challengevalue");
			if(!isdefined(var_b1d90f13))
			{
				continue;
			}
			var_79aea5cb = 0;
			if(var_b1d90f13 >= 50 && var_b1d90f13 < 250)
			{
				var_79aea5cb = 1;
			}
			else
			{
				if(var_b1d90f13 >= 250 && var_b1d90f13 < 750)
				{
					var_79aea5cb = 2;
				}
				else
				{
					if(var_b1d90f13 >= 750 && var_b1d90f13 < 1500)
					{
						var_79aea5cb = 3;
					}
					else
					{
						if(var_b1d90f13 >= 1500 && var_b1d90f13 < 2500)
						{
							var_79aea5cb = 4;
						}
						else if(var_b1d90f13 >= 2500)
						{
							var_79aea5cb = 5;
						}
					}
				}
			}
			var_531d02e6 = self stats::get_stat(#"item_stats", weapon, #"hash_46422decc5803401", #"challengetier");
			if(!isdefined(var_531d02e6))
			{
				continue;
			}
			var_6872fc45 = self stats::get_stat(#"item_stats", weapon, #"packedkills", #"challengetier");
			if(!isdefined(var_6872fc45))
			{
				continue;
			}
			var_59a3dcb1 = self stats::get_stat(#"item_stats", weapon, #"hash_9c59d60380f570a", #"challengetier");
			if(!isdefined(var_59a3dcb1))
			{
				continue;
			}
			var_7bb2e982 = self stats::get_stat(#"item_stats", weapon, #"multikill", #"challengetier");
			if(!isdefined(var_7bb2e982))
			{
				continue;
			}
			var_b72a7e87 = self stats::get_stat(#"item_stats", weapon, #"hash_5870df5ed04a8f11", #"challengetier");
			if(!isdefined(var_b72a7e87))
			{
				continue;
			}
			var_3657e2eb = self stats::get_stat(#"item_stats", weapon, #"hash_1f3b0d3bd9acb4a5", #"challengetier");
			if(!isdefined(var_3657e2eb))
			{
				continue;
			}
			var_99543712 = self stats::get_stat(#"item_stats", weapon, #"challenges", #"challengevalue");
			if(!isdefined(var_99543712))
			{
				continue;
			}
			var_6ea301ff = (((((var_3657e2eb + var_b72a7e87) + var_7bb2e982) + var_59a3dcb1) + var_6872fc45) + var_531d02e6) + var_79aea5cb;
			if(isdefined(var_6ea301ff) && var_6ea301ff > var_99543712)
			{
				var_402b331b = getweapon(weapon);
				self function_d6b32ad3(var_402b331b, #"challenges", 1);
			}
		}
		if(isdefined(weapon_names[#"weapon_smg"]))
		{
			foreach(weapon in weapon_names[#"weapon_smg"])
			{
				var_d4bdcb67 = self stats::get_stat(#"item_stats", weapon, #"challenges", #"challengevalue");
				if(!isdefined(var_d4bdcb67))
				{
					continue;
				}
				if(var_d4bdcb67 >= 35)
				{
					var_d4ece5d0 = self stats::get_stat(#"item_stats", weapon, #"hash_7fce4a14fec05da1", #"challengevalue");
					if(!isdefined(var_d4ece5d0))
					{
						continue;
					}
					if(var_d4ece5d0 == 0)
					{
						var_402b331b = getweapon(weapon);
						self function_d6b32ad3(var_402b331b, #"hash_7fce4a14fec05da1", 1);
					}
				}
			}
		}
	}
}

