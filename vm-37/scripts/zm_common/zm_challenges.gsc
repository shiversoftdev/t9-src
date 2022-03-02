#using script_14f4a3c583c77d4b;
#using script_1c65dbfc2f1c8d8f;
#using script_1caf36ff04a85ff6;
#using script_47fb62300ac0bd60;
#using script_5f261a5d57de5f7c;
#using script_61828ad9e71c6616;
#using script_68d2ee1489345a1d;
#using script_6e3c826b1814cab6;
#using script_7133a4d461308099;
#using script_ab890501c40b73c;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\throttle_shared.gsc;
#using scripts\zm_common\callbacks.gsc;
#using scripts\zm_common\zm_pack_a_punch_util.gsc;
#using scripts\zm_common\zm_perks.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_weapons.gsc;

#namespace zm_challenges;

/*
	Name: function_89f2df9
	Namespace: zm_challenges
	Checksum: 0x464D24AE
	Offset: 0x368
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"zm_challenges", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_challenges
	Checksum: 0x67475808
	Offset: 0x3C0
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
	callback::function_98a0917d(&function_98a0917d);
	zm_spawner::register_zombie_death_event_callback(&death_check_for_challenge_updates);
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
	Checksum: 0x21116B6A
	Offset: 0x5F8
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
	Checksum: 0x12977BB
	Offset: 0x638
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function start_gametype()
{
	waittillframeend();
	challenges::registerchallengescallback("gun_level_complete_last_rank", &function_b15a1e1e);
	callback::on_connect(&on_connect);
}

/*
	Name: on_connect
	Namespace: zm_challenges
	Checksum: 0xC2535303
	Offset: 0x690
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
	Checksum: 0xF2B301B6
	Offset: 0x860
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
	Checksum: 0xD2D6F1EB
	Offset: 0x888
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
	Checksum: 0x4D9E7543
	Offset: 0x900
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
	Checksum: 0x3E5187D7
	Offset: 0x938
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
	Checksum: 0x281D286C
	Offset: 0x958
	Size: 0x3D8
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
		if(level.round_number == 20 && zm_utility::is_classic())
		{
			self stats::function_dad108fa(#"hash_6a3b487c924d7081", 1);
		}
		if(!self.var_152810ff[1])
		{
			/#
				self debug_print("");
			#/
			self zm_stats::increment_challenge_stat(#"hash_4905ff3bfcad436e", undefined, 1);
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
	Checksum: 0x4F77D21D
	Offset: 0xD38
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function death_check_for_challenge_updates(e_attacker)
{
	self thread function_f807c679(e_attacker);
}

/*
	Name: function_f807c679
	Namespace: zm_challenges
	Checksum: 0xDE0EC85F
	Offset: 0xD68
	Size: 0x274C
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
	loc_00000FA8:
	var_a0345f37 = {#origin:self.origin, #hash_7c9174d1:self.var_7c9174d1, #missinglegs:self.missinglegs, #hash_fc304017:self.var_fc304017, #hash_958cf9c5:self.var_958cf9c5, #hash_5841c56f:self.var_36fa0ac4, #hash_cbf4894c:self.var_cbf4894c, #hash_88421cc2:self.var_88421cc2, #hash_84e41b20:self.var_84e41b20, #hash_2290a541:self.var_2290a541, #enemy_override:self.enemy_override, #hash_8126f3c8:self.var_8126f3c8, #hash_d1b39105:self flag::get(#"hash_83000b27a1fe353"), #hash_6f84b820:self.var_6f84b820, #is_stunned:self ai::is_stunned(), #w_damage:(isvehicle(self) ? self.w_damage : self.damageweapon), #str_damagemod:(isvehicle(self) ? self.str_damagemod : self.damagemod)};
	var_4838b749 = e_attacker namespace_b376ff3f::function_d768ea30();
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
		e_attacker contracts::function_5b88297d(#"hash_27c82052a38b443a");
	}
	/#
		e_attacker debug_print("");
	#/
	e_attacker zm_stats::increment_challenge_stat(#"kill_enemies", undefined, 1);
	e_attacker zm_stats::function_c0c6ab19(#"kills");
	e_attacker contracts::function_5b88297d(#"hash_4a67f445fabbabb4");
	e_attacker contracts::function_dff4c02f();
	str_damagemod = var_a0345f37.str_damagemod;
	w_damage = var_a0345f37.w_damage;
	var_7050de53 = w_damage.inventorytype;
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
				e_attacker contracts::function_5b88297d(#"hash_28124610d29236d9");
			}
			else if(e_attacker playerads() > 0)
			{
				e_attacker contracts::function_5b88297d(#"hash_c5107c9ab542cc8");
			}
			break;
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
				e_attacker zm_stats::increment_challenge_stat(#"hash_100c68ad4d261fb6");
				e_attacker function_d6b32ad3(w_damage, #"hash_55fb32112365dc99", 1);
				e_attacker stats::inc_stat(#"hash_162f9b6a10fa7d66", w_damage.name, #"hash_55fb32112365dc99", #"statvalue", 1);
				e_attacker thread activecamo::function_896ac347(w_damage, #"hash_548497d675bae386", 1);
				e_attacker thread activecamo::function_896ac347(w_damage, #"hash_39ab7cda18fd5c74", 1);
				e_attacker contracts::function_5b88297d(#"hash_4f442f95b647960b");
				break;
			}
			case "elite":
			{
				/#
					e_attacker debug_print("");
				#/
				e_attacker zm_stats::increment_challenge_stat(#"hash_4fce5ab108357eb8");
				e_attacker function_d6b32ad3(w_damage, #"hash_20806ac72acd7d15", 1);
				e_attacker stats::inc_stat(#"hash_162f9b6a10fa7d66", w_damage.name, #"hash_20806ac72acd7d15", #"statvalue", 1);
				e_attacker thread activecamo::function_896ac347(w_damage, #"hash_45814ac55657fc62", 1);
				e_attacker thread activecamo::function_896ac347(w_damage, #"hash_39ab7cda18fd5c74", 1);
				e_attacker contracts::function_5b88297d(#"hash_1bbcbc1ef268d554");
				break;
			}
			case "normal":
			{
				/#
					e_attacker debug_print("");
				#/
				e_attacker function_d6b32ad3(w_damage, #"hash_7c40f14330df4e0b", 1);
				e_attacker stats::inc_stat(#"hash_162f9b6a10fa7d66", w_damage.name, #"hash_7c40f14330df4e0b", #"statvalue", 1);
				e_attacker thread activecamo::function_896ac347(w_damage, #"hash_2c39375eacf54fa8", 1);
				e_attacker thread activecamo::function_896ac347(w_damage, #"hash_39ab7cda18fd5c74", 1);
				e_attacker contracts::function_5b88297d(#"hash_2eccd05bcbd822f");
				break;
			}
		}
	}
	if(killstreaks::is_killstreak_weapon(w_damage))
	{
		e_attacker stats::function_b04e7184(w_damage.statname, #"best_kills");
		e_attacker stats::function_dad108fa(#"hash_195bc77f835411ca", 1);
		e_attacker contracts::function_5b88297d(#"hash_4f513a02494984c0");
		switch(w_damage.statname)
		{
			case "chopper_gunner":
			{
				e_attacker contracts::function_5b88297d(#"hash_1118222f042b742b");
				break;
			}
			case "ultimate_turret":
			{
				e_attacker contracts::function_5b88297d(#"hash_7da8d70743cddefa");
				break;
			}
			case "hero_pineapplegun":
			{
				e_attacker contracts::function_5b88297d(#"hash_4b9ddec4f59f76a3");
				break;
			}
			case "sig_bow_flame":
			{
				e_attacker contracts::function_5b88297d(#"hash_3c3eaa7321a4911c");
				break;
			}
		}
		switch(w_damage.statname)
		{
			case "hash_86464477ee762aa":
			case "chopper_gunner":
			case "remote_missile_bomblet":
			{
				e_attacker contracts::function_5b88297d(#"hash_2dfb176e8015feff");
				break;
			}
			case "ultimate_turret":
			case "hero_pineapplegun":
			case "sig_bow_flame":
			{
				e_attacker contracts::function_5b88297d(#"hash_34e11e6062de3146");
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
			e_attacker zm_stats::increment_challenge_stat(#"hash_552a925ded7df134");
		}
	}
	if(var_a0345f37.var_d3ed3a9b && (isdefined(var_a0345f37.str_damagemod) && var_a0345f37.str_damagemod != "MOD_MELEE"))
	{
		e_attacker contracts::function_5b88297d(#"hash_40cd9410951215b8");
		e_attacker zm_stats::increment_challenge_stat(#"hash_68a582f0fbd97eb2");
		e_attacker function_d6b32ad3(w_damage, #"hash_46422decc5803401", 1);
		var_27b9587 = zm_weapons::get_base_weapon(w_damage);
		if(isdefined(level.zombie_weapons[var_27b9587]))
		{
			switch(level.zombie_weapons[var_27b9587].weapon_classname)
			{
				case "ar":
				{
					/#
						e_attacker debug_print("");
					#/
					e_attacker contracts::function_5b88297d(#"hash_546c523756e9ac9d");
					break;
				}
				case "lmg":
				{
					/#
						e_attacker debug_print("");
					#/
					e_attacker contracts::function_5b88297d(#"hash_2761852b694b4e58");
					break;
				}
				case "pistol":
				{
					/#
						e_attacker debug_print("");
					#/
					e_attacker contracts::function_5b88297d(#"hash_2bbe9120c601cb3d");
					break;
				}
				case "shotgun":
				{
					/#
						e_attacker debug_print("");
					#/
					e_attacker contracts::function_5b88297d(#"hash_6607fdb1e8642de2");
					break;
				}
				case "smg":
				{
					/#
						e_attacker debug_print("");
					#/
					e_attacker contracts::function_5b88297d(#"hash_1763727e117a0f19");
					break;
				}
				case "sniper":
				{
					/#
						e_attacker debug_print("");
					#/
					e_attacker contracts::function_5b88297d(#"hash_455135401bc3c771");
					break;
				}
				case "tr":
				{
					/#
						e_attacker debug_print("");
					#/
					e_attacker contracts::function_5b88297d(#"hash_2f8eabe9d1bd2ee8");
					break;
				}
			}
		}
	}
	if(e_attacker.var_9cd2c51d.var_158e75d4 === #"eq_stimshot" && isdefined(e_attacker.var_9cd2c51d.var_63362b1e) && e_attacker.var_9cd2c51d.var_63362b1e > (gettime() - 6500))
	{
		e_attacker contracts::function_5b88297d(#"hash_1c456f43ac6ce890");
	}
	if(str_damagemod === "MOD_MELEE")
	{
		e_attacker contracts::function_5b88297d(#"hash_6945e246eaae0456");
		e_attacker zm_stats::increment_challenge_stat(#"hash_169c43fc771cc691");
	}
	if(str_damagemod === "MOD_GRENADE" || str_damagemod === "MOD_GRENADE_SPLASH" || str_damagemod === "MOD_EXPLOSIVE" || (zm_weapons::function_e17d0760(w_damage) && w_damage.name !== "gun_ultimate_turret") || var_a0345f37.var_8126f3c8 === #"explosive")
	{
		/#
			e_attacker debug_print("");
		#/
		e_attacker zm_stats::increment_challenge_stat(#"explosive_kills");
		e_attacker zm_stats::function_c0c6ab19(#"explosions");
		e_attacker contracts::function_5b88297d(#"hash_6cde879eb969cfbb");
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
		e_attacker zm_stats::increment_challenge_stat(#"hash_45681118c2f2a280", undefined, 1);
		e_attacker zm_stats::function_c0c6ab19(#"hash_5d3dce1c38a95835");
		e_attacker zm_stats::function_c0c6ab19(#"hash_47f7f0952495877e");
		e_attacker contracts::function_5b88297d(#"hash_3178840f53beab88");
		var_27b9587 = zm_weapons::get_base_weapon(w_damage);
		e_attacker zm_stats::increment_challenge_stat(#"hash_7b6702e69da87f90");
		e_attacker function_d6b32ad3(w_damage, #"hash_289883e2f7a6af52", 1);
		e_attacker stats::inc_stat(#"hash_162f9b6a10fa7d66", w_damage.name, #"hash_289883e2f7a6af52", #"statvalue", 1);
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
			e_attacker zm_stats::increment_challenge_stat(#"hash_7b6702e69da87f90");
			e_attacker zm_stats::function_c0c6ab19(#"hash_5d3dce1c38a95835");
			e_attacker contracts::function_5b88297d(#"hash_3178840f53beab88");
			var_27b9587 = zm_weapons::get_base_weapon(w_damage);
			e_attacker function_d6b32ad3(var_27b9587, #"hash_289883e2f7a6af52", 1);
			e_attacker stats::inc_stat(#"hash_162f9b6a10fa7d66", w_damage.name, #"hash_289883e2f7a6af52", #"statvalue", 1);
			e_attacker stats::function_561716e6(w_damage.statname, #"hash_2098d66c36052fa7", 1);
		}
		else
		{
			var_27b9587 = zm_weapons::function_386dacbc(w_damage);
		}
	}
	if(zm_weapons::is_wonder_weapon(w_damage) || w_damage.statname === #"ray_gun")
	{
		e_attacker contracts::function_5b88297d(#"hash_1db0aaefc2baceb4");
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
	if(isdefined(level.zombie_weapons[var_27b9587]))
	{
		switch(level.zombie_weapons[var_27b9587].weapon_classname)
		{
			case "ar":
			{
				/#
					e_attacker debug_print("");
				#/
				e_attacker zm_stats::increment_challenge_stat(#"hash_58b00abb84f19b74");
				e_attacker zm_stats::function_c0c6ab19(#"hash_4b7cd30475a320ec");
				break;
			}
			case "lmg":
			{
				/#
					e_attacker debug_print("");
				#/
				e_attacker zm_stats::increment_challenge_stat(#"hash_15c2f8dd431370f9");
				e_attacker zm_stats::function_c0c6ab19(#"hash_580e2094234e5ac5");
				break;
			}
			case "pistol":
			{
				/#
					e_attacker debug_print("");
				#/
				e_attacker zm_stats::increment_challenge_stat(#"hash_394fe6e6b6ef8b48");
				e_attacker zm_stats::function_c0c6ab19(#"hash_5ddac928c4d4e8cc");
				break;
			}
			case "shotgun":
			{
				/#
					e_attacker debug_print("");
				#/
				e_attacker zm_stats::increment_challenge_stat(#"hash_61df9bce444b2483");
				e_attacker zm_stats::function_c0c6ab19(#"hash_2624733be0c73be4");
				break;
			}
			case "smg":
			{
				/#
					e_attacker debug_print("");
				#/
				e_attacker zm_stats::increment_challenge_stat(#"hash_4c9d106b9054e930");
				e_attacker zm_stats::function_c0c6ab19(#"hash_4cba49938c3ab570");
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
				e_attacker zm_stats::increment_challenge_stat(#"hash_264de6064dd27a15");
				e_attacker zm_stats::function_c0c6ab19(#"hash_26d8f2fa0846a614");
				break;
			}
		}
	}
	if(w_damage.rootweapon.name == #"hash_1b055fadc5573c29" || w_damage.rootweapon.name == #"hash_1aea58adc540688c" || w_damage.rootweapon.name == #"hash_3b34bf98ebd70d14" || w_damage.rootweapon.name == #"hash_3b19c698ebc05141")
	{
		/#
			e_attacker debug_print("");
		#/
		e_attacker zm_stats::increment_challenge_stat(#"hash_2a72be53205a8db3");
		return;
	}
	if(isdefined(var_a0345f37.var_7c9174d1) && var_a0345f37.var_7c9174d1.size > 0 && w_damage.name === #"eq_sticky_grenade")
	{
		e_attacker contracts::function_5b88297d(#"hash_702ce12b92970cd6");
	}
	switch(w_damage.name)
	{
		case "hatchet":
		{
			e_attacker contracts::function_5b88297d(#"hash_2bdb36192dc0c35b");
			if(distancesquared(var_a0345f37.origin, e_attacker.origin) > 448900)
			{
				e_attacker contracts::function_5b88297d(#"hash_47e4a8a9710c8504");
			}
			break;
		}
		case "frag_grenade":
		{
			e_attacker contracts::function_5b88297d(#"hash_404c66f0c2116811");
			break;
		}
		case "eq_sticky_grenade":
		{
			e_attacker contracts::function_5b88297d(#"hash_5020d12306499cbd");
			break;
		}
		case "satchel_charge":
		{
			e_attacker contracts::function_5b88297d(#"hash_7e171b76ec0c1c42");
			break;
		}
		case "cymbal_monkey":
		{
			e_attacker contracts::function_5b88297d(#"hash_2840c9eff7d8c449");
			break;
		}
		case "hash_23dd6039fe2f36c6":
		{
			e_attacker contracts::function_5b88297d(#"hash_4000032e74ffc77d");
			break;
		}
		case "eq_slow_grenade":
		{
			e_attacker contracts::function_5b88297d(#"hash_4936408b808baff1");
			break;
		}
	}
	switch(w_damage.name)
	{
		case "hash_23dd6039fe2f36c6":
		case "frag_grenade":
		case "hatchet":
		case "eq_sticky_grenade":
		case "eq_slow_grenade":
		case "satchel_charge":
		case "cymbal_monkey":
		{
			e_attacker contracts::function_5b88297d(#"hash_2eebe80848be398");
			break;
		}
		case "energy_mine":
		case "hash_4ac3fda4add2a116":
		case "hash_4ac3fea4add2a2c9":
		case "hash_4ac3ffa4add2a47c":
		case "hash_4ac400a4add2a62f":
		case "hash_4ac402a4add2a995":
		{
			e_attacker stats::function_622feb0d(#"energy_mine", #"kills", 1);
		}
		case "hash_85edf3a63bb488c":
		case "hash_2f148f3f9c3812a8":
		case "hash_2f14913f9c38160e":
		case "hash_2f14923f9c3817c1":
		case "frost_blast_5":
		case "hash_2f14943f9c381b27":
		{
			e_attacker contracts::function_5b88297d(#"hash_1d79330297e3f68b");
			e_attacker stats::function_622feb0d(#"hash_85edf3a63bb488c", #"kills", 1);
			break;
		}
	}
	if(w_damage.statname === #"bowie_knife")
	{
		/#
			e_attacker debug_print("");
		#/
		e_attacker zm_stats::increment_challenge_stat(#"hash_2a5699203eb6eeef");
		return;
	}
	if(is_true(w_damage.var_ff0b00ba))
	{
		/#
			e_attacker debug_print("");
		#/
		e_attacker zm_stats::function_c0c6ab19(#"hash_3e934a4d2ecdedfd");
		e_attacker contracts::function_5b88297d(#"hash_47a744f5c776d978");
	}
	if(zm_utility::is_frag_grenade(w_damage))
	{
		/#
			e_attacker debug_print("");
		#/
		e_attacker zm_stats::increment_challenge_stat(#"hash_127a105903cdac43");
		return;
	}
	if(zm_utility::is_claymore(w_damage))
	{
		/#
			e_attacker debug_print("");
		#/
		e_attacker zm_stats::increment_challenge_stat(#"hash_133bbb2db120c3ef");
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
		e_attacker zm_stats::increment_challenge_stat(#"hash_39a70a2d418f6a87");
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
		e_attacker zm_stats::increment_challenge_stat(#"hash_79cc5aee66351e26");
		e_attacker contracts::function_5b88297d(#"hash_7af98643fc22ffd5");
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
			e_attacker contracts::function_5b88297d(#"hash_4075c12717a62ec7");
		}
		if(isdefined(var_a0345f37.enemy_override) || var_a0345f37.w_damage.name === #"cymbal_monkey")
		{
			e_attacker zm_stats::increment_challenge_stat(#"hash_132df2b4183bc9c8");
			e_attacker contracts::function_5b88297d(#"hash_4c2b485a7927aadb");
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
	Checksum: 0x797C1E4B
	Offset: 0x34C0
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
	Checksum: 0x42BBFE22
	Offset: 0x3540
	Size: 0x11E
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
			var_4838b749 = self namespace_b376ff3f::function_d768ea30();
			if(isdefined(var_4838b749))
			{
				weapon_item = self.inventory.items[var_4838b749];
				if(isdefined(weapon.statname))
				{
					if(!isdefined(weapon_item.first_use))
					{
						self stats::function_8fb23f94(weapon.statname, #"uses", 1);
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
	Checksum: 0x16F439B2
	Offset: 0x3668
	Size: 0x90A
	Parameters: 2
	Flags: Linked
*/
function function_575c37e0(weapon, enemy)
{
	if(self zm_powerups::is_insta_kill_active() || self zm_powerups::function_a4e210c7())
	{
		self contracts::function_5b88297d(#"hash_28d69ecb1123398b");
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
	if(isdefined(weapon.name))
	{
		switch(weapon.name)
		{
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
			case "hash_2f148f3f9c3812a8":
			case "hash_2f14913f9c38160e":
			case "hash_2f14923f9c3817c1":
			case "frost_blast_5":
			case "hash_2f14943f9c381b27":
			case "energy_mine":
			case "hash_4ac3fda4add2a116":
			case "hash_4ac3fea4add2a2c9":
			case "hash_4ac3ffa4add2a47c":
			case "hash_4ac400a4add2a62f":
			case "hash_4ac402a4add2a995":
			{
				self stats::function_dad108fa(#"hash_1dbfc19533279bd1", 1);
				break;
			}
		}
	}
	var_4838b749 = self namespace_b376ff3f::function_d768ea30();
	if(isdefined(var_4838b749))
	{
		weapon_item = self.inventory.items[var_4838b749];
		if(weapon_item.var_627c698b.statname === weapon.statname)
		{
			if(weapon_item.var_96c71057 === 1)
			{
				self contracts::function_5b88297d(#"hash_39d1bb5abc4290a8");
			}
			if(weapon_item.var_a0cc02cf === 1)
			{
				self stats::function_dad108fa(#"hash_15e38ff835419f29", 1);
				self contracts::function_5b88297d(#"hash_74f9ee275506c72a");
			}
		}
	}
	if(enemy.var_6f84b820 === #"elite" && (!isdefined(enemy.var_e293f8ac) || (isdefined(enemy.var_e293f8ac) && enemy.var_e293f8ac.size === 0)))
	{
		self stats::function_dad108fa(#"hash_78b5865817a3c321", 1);
		self contracts::function_5b88297d(#"hash_6552527c7d6010fc");
	}
	if(enemy.archetype === #"zombie_dog")
	{
		self contracts::function_5b88297d(#"hash_3819a71c22f9ec8f");
	}
	var_5638aaf2 = self zm_pap_util::function_2a196eff(weapon);
	if(zm_weapons::is_weapon_upgraded(weapon) || (isdefined(var_5638aaf2) && var_5638aaf2 > 0))
	{
		self contracts::function_5b88297d(#"hash_453b44052f10aff9");
		self zm_stats::function_61e39bb6(#"hash_3171d9bb6e1519ac", 1);
		self stats::function_dad108fa(#"hash_48e4f004511eee67", 1);
	}
	self function_d6b32ad3(weapon, #"ekia", 1);
	self function_d6b32ad3(weapon, #"hash_14b7133a39a0456e", 1);
	var_27b9587 = zm_weapons::function_386dacbc(weapon);
	if(isdefined(level.zombie_weapons[var_27b9587]))
	{
		switch(level.zombie_weapons[var_27b9587].weapon_classname)
		{
			case "ar":
			{
				/#
					self debug_print("");
				#/
				self contracts::function_5b88297d(#"hash_2df3c0a3d246a317");
				break;
			}
			case "lmg":
			{
				/#
					self debug_print("");
				#/
				self contracts::function_5b88297d(#"hash_7f2d55373edd6bd4");
				break;
			}
			case "pistol":
			{
				/#
					self debug_print("");
				#/
				self contracts::function_5b88297d(#"hash_3af737750c46d537");
				break;
			}
			case "shotgun":
			{
				/#
					self debug_print("");
				#/
				self contracts::function_5b88297d(#"hash_2d89237bb56740aa");
				break;
			}
			case "smg":
			{
				/#
					self debug_print("");
				#/
				self contracts::function_5b88297d(#"hash_286a3c0a06a25f63");
				break;
			}
			case "sniper":
			{
				/#
					self debug_print("");
				#/
				self contracts::function_5b88297d(#"hash_65ca61d61094915b");
				break;
			}
			case "tr":
			{
				/#
					self debug_print("");
				#/
				self contracts::function_5b88297d(#"hash_113a972fef98964");
				break;
			}
		}
	}
}

/*
	Name: function_d6b32ad3
	Namespace: zm_challenges
	Checksum: 0x983CFFA8
	Offset: 0x3F80
	Size: 0x6C
	Parameters: 3
	Flags: Linked
*/
function function_d6b32ad3(weapon, challenge, amount)
{
	var_27b9587 = zm_weapons::get_base_weapon(weapon);
	if(isdefined(var_27b9587) && isdefined(challenge))
	{
		self stats::function_e24eec31(var_27b9587, challenge, amount);
	}
}

/*
	Name: function_4281b2f1
	Namespace: zm_challenges
	Checksum: 0x44805FDF
	Offset: 0x3FF8
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
	Checksum: 0x498A5C2B
	Offset: 0x4168
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
		player zm_stats::increment_challenge_stat(#"hash_c7f076298b8f2cd", n_points, 1);
	}
}

/*
	Name: increment_magic_box
	Namespace: zm_challenges
	Checksum: 0x7DDF7FE3
	Offset: 0x4250
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
	Checksum: 0x544215FF
	Offset: 0x4280
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
			self zm_stats::increment_challenge_stat(#"hash_6f2c378eee6730ea");
			var_c0e0819a = undefined;
		}
		self function_b892d1da();
	}
}

/*
	Name: function_5bec2304
	Namespace: zm_challenges
	Checksum: 0x79882DD0
	Offset: 0x4350
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
		var_fff94a73 = self stats::function_441050ca("talent_elemental_pop_drank");
		var_317c380d = self stats::function_441050ca("talent_staminup_drank");
		var_a47cc4dd = self stats::function_441050ca("talent_juggernog_drank");
		var_325628d7 = self stats::function_441050ca("talent_doubletap_drank");
		var_32feae61 = self stats::function_441050ca("talent_deadshot_drank");
		var_6d1d99a3 = self stats::function_441050ca("talent_quickrevive_drank");
		var_1a8aaae7 = self stats::function_441050ca("talent_speedcola_drank");
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
	Checksum: 0x3DA147C8
	Offset: 0x4BD8
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
	Checksum: 0xB0791795
	Offset: 0x4C50
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
	Checksum: 0xCE8CE8A6
	Offset: 0x4CC8
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
			var_4838b749 = self namespace_b376ff3f::function_d768ea30();
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
	Checksum: 0x6A4AAF5C
	Offset: 0x4DB8
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
	Checksum: 0x16B289FB
	Offset: 0x4E50
	Size: 0x130
	Parameters: 0
	Flags: Linked
*/
function function_b3862180()
{
	self endon(#"disconnect");
	self.var_55f98899 = [];
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"hash_2d4daa9e80b86b60");
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
			if(level.var_92c52eed === 1)
			{
				self zm_stats::increment_challenge_stat(#"hash_ec057f8bdec38d9");
			}
		}
	}
}

/*
	Name: function_4f4a3c59
	Namespace: zm_challenges
	Checksum: 0x234D5DBA
	Offset: 0x4F88
	Size: 0x288
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
		if(isdefined(waitresult.heal_amount) && waitresult.heal_amount > 0 && self.var_9cd2c51d.var_158e75d4 === #"eq_stimshot" && isdefined(self.var_9cd2c51d.var_63362b1e) && self.var_9cd2c51d.var_63362b1e > (gettime() - 2500))
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
			self contracts::function_5b88297d(#"hash_5b8c91da65d60b4b", waitresult.heal_amount);
		}
	}
}

/*
	Name: function_874334a5
	Namespace: zm_challenges
	Checksum: 0x17792234
	Offset: 0x5218
	Size: 0x2CE
	Parameters: 0
	Flags: Linked
*/
function function_874334a5()
{
	self endon(#"disconnect");
	if(1)
	{
		level flag::wait_till(#"hash_4b00aa230ebbe82b");
		players = getplayers();
		foreach(player in players)
		{
			if(!isdefined(player.var_e394d7c0) || (isdefined(player.var_e394d7c0) && player.var_e394d7c0 < (level.round_number - 5)))
			{
				continue;
			}
			if(!is_true(player.var_4a996ccb))
			{
				player.var_4a996ccb = 1;
				player zm_stats::increment_challenge_stat(#"hash_45419091cdb5f154");
				if(!is_true(player.var_b9ff264c))
				{
					player.var_b9ff264c = 1;
					player zm_stats::increment_challenge_stat(#"hash_67429a304536459");
					player contracts::function_5b88297d(#"hash_885ac2ac2e7c422");
					if(level.round_number >= 31)
					{
						player zm_stats::increment_challenge_stat(#"hash_5be5c4c5dacd7bec");
					}
					if(!is_true(player.var_8a246020))
					{
						player.var_8a246020 = 1;
						player stats::function_dad108fa(#"hash_359f26f3fe7b3e34", 1);
						player zm_stats::function_61e39bb6(#"hash_3c8e09a04082db5e", 1);
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
	Checksum: 0x40AA1E90
	Offset: 0x54F0
	Size: 0x29C
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
				if(!isdefined(player.var_e394d7c0) || (isdefined(player.var_e394d7c0) && player.var_e394d7c0 < (level.round_number - 5)))
				{
					continue;
				}
				if(!is_true(player.var_b9ff264c))
				{
					player.var_b9ff264c = 1;
					player zm_stats::increment_challenge_stat(#"hash_67429a304536459");
					player contracts::function_5b88297d(#"hash_885ac2ac2e7c422");
					if(level.round_number >= 31)
					{
						player zm_stats::increment_challenge_stat(#"hash_5be5c4c5dacd7bec");
					}
					if(!is_true(player.var_8a246020))
					{
						player.var_8a246020 = 1;
						player stats::function_dad108fa(#"hash_359f26f3fe7b3e34", 1);
						player zm_stats::function_61e39bb6(#"hash_3c8e09a04082db5e", 1);
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
	Checksum: 0x2B8932C3
	Offset: 0x5798
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
	Checksum: 0xD8CD24D
	Offset: 0x57D8
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
		waitresult = level waittill(#"hash_656719782f57ca1a");
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
	Checksum: 0xEAFC6741
	Offset: 0x5888
	Size: 0x148
	Parameters: 0
	Flags: Linked
*/
function function_a9f6b8ef()
{
	level endon(#"end_game");
	if(namespace_59ff1d6c::function_901b751c(#"hash_19d48a0d4490b0a2") == 2 || namespace_59ff1d6c::function_901b751c(#"hash_19d48a0d4490b0a2") == 0)
	{
		return;
	}
	level flag::wait_till("pap_machine_active");
	foreach(player in level.players)
	{
		/#
			player debug_print("");
		#/
		player zm_stats::increment_challenge_stat(#"hash_2f8c66f4c58f068b", undefined, 1);
	}
}

/*
	Name: debug_print
	Namespace: zm_challenges
	Checksum: 0x774B0F80
	Offset: 0x59D8
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
	Checksum: 0x914DD7CC
	Offset: 0x5A50
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
	Checksum: 0x7EE7E020
	Offset: 0x5A90
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
	Checksum: 0x791BD8F6
	Offset: 0x5AA8
	Size: 0x124
	Parameters: 1
	Flags: None
*/
function function_9a9ab6f6(var_1c48b665)
{
	self zm_stats::increment_challenge_stat(var_1c48b665);
	foreach(var_6c7a7f72 in array(#"darkops_zod_ee", #"hash_6d5340d9e43ed73d", #"hash_ad3a508a80a0e6e"))
	{
		if(!self stats::function_441050ca(var_6c7a7f72))
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
	Checksum: 0x85A16793
	Offset: 0x5BD8
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
			self contracts::function_5b88297d(#"hash_7a3b8f92688f1d73");
			self.var_c26d0253 = 1;
		}
		return;
	}
}

/*
	Name: function_b892d1da
	Namespace: zm_challenges
	Checksum: 0x6BFA9A8
	Offset: 0x5CB8
	Size: 0x174
	Parameters: 0
	Flags: Linked, Private
*/
function private function_b892d1da()
{
	var_684d09cd = array(#"perk_juggernog", #"perk_quick_revive", #"perk_sleight_of_hand", #"perk_staminup", #"perk_dead_shot", #"perk_elemental_pop");
	foreach(var_9b9f4901 in var_684d09cd)
	{
		if(!self stats::get_stat(#"hash_409332e5f180ebd", var_9b9f4901, #"hash_3665254f9bca8d1e", #"statvalue"))
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
	Checksum: 0x80B01F76
	Offset: 0x5E38
	Size: 0x134
	Parameters: 0
	Flags: Linked
*/
function function_bf0be8f1()
{
	foreach(var_b1cb18f1 in array("zm_zodt8", "zm_towers", "zm_escape"))
	{
		if(!self stats::get_stat(#"playerstatsbymap", var_b1cb18f1, #"hash_74e26ca9652802fb", level.gametype, #"stats", "FASTEST_TIME_TO_COMPLETE_ROUND_30", #"statvalue"))
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
	Checksum: 0x35E05F8E
	Offset: 0x5F78
	Size: 0x304
	Parameters: 0
	Flags: Linked
*/
function function_e40c9d13()
{
	var_b361a853 = array(#"hash_4dfeb08c20a14b8b", #"hash_478e71d96c16eb50", #"hash_2b648e8ce3814bbb", #"hash_55330e258be3e3cc", #"hash_e1311542f5782b5", #"hash_2c8e9cd5fbd53e70", #"hash_7f6a3674177103f1", #"hash_2721c688766673fb", #"hash_6aadfdc58af04635", #"hash_1efb82c43276a4e3", #"hash_1fc7843987e89a83", #"hash_2df0835a53060b95", #"hash_c2a620242d1636a", #"hash_cd53ea4d4ee864c", #"hash_6a0c4101e88a4707", #"hash_459f15018585edda", #"hash_713d1e36bd254b65", #"shotgun_trenchgun_t8_upgraded", #"hash_757d19cbfbeb94b7", #"hash_354b896513d0581d", #"hash_3477cc89337a5ea5", #"hash_435dd4ea9f2fd1bf", #"hash_514128f7d058cde0", #"hash_fcb8798a7354324", #"hash_16044c4b951b7bdd", #"hash_173040967fe4f754", #"sniper_quickscope_t8_upgraded", #"hash_7f8028bb8adc966c", #"hash_4bf5a2219b1a65d2", #"hash_44f95b73da64d7ee", #"hash_81c373345c076c1");
	foreach(var_5f8b3585 in var_b361a853)
	{
		if(!self stats::get_stat(#"hash_162f9b6a10fa7d66", var_5f8b3585, #"hash_5d5a976d59876880", #"statvalue"))
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
	Checksum: 0x968DC43C
	Offset: 0x6288
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
	var_845ac04e = self stats::function_441050ca("t9_tu5_zm_hunter_mastery_fixup");
	if(!isdefined(var_845ac04e))
	{
		var_845ac04e = 0;
	}
	if(var_845ac04e != 1)
	{
		var_76f39460 = self stats::function_222de31d(#"zombie_hunter_mastery");
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
		self stats::function_4db3fba1("t9_tu5_zm_hunter_mastery_fixup", 1);
	}
}

/*
	Name: function_b15a1e1e
	Namespace: zm_challenges
	Checksum: 0x7E427276
	Offset: 0x6628
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
	Checksum: 0xA364C274
	Offset: 0x6680
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
	Checksum: 0x2218A5C9
	Offset: 0x66B8
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
	Checksum: 0x861F658B
	Offset: 0x66F0
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
	Checksum: 0xF8497BD8
	Offset: 0x67D0
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
	primaryweapon = self namespace_a0d533d1::function_2b83d3ff(self namespace_b376ff3f::function_2e711614(17 + 1));
	secondaryweapon = self namespace_a0d533d1::function_2b83d3ff(self namespace_b376ff3f::function_2e711614(((17 + 1) + 8) + 1));
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
	Checksum: 0x88EF3BC7
	Offset: 0x6988
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
	Name: function_98a0917d
	Namespace: zm_challenges
	Checksum: 0x9BEBE0A9
	Offset: 0x69F0
	Size: 0xD8
	Parameters: 1
	Flags: Linked
*/
function function_98a0917d(params)
{
	level waittill(#"initial_fade_in_complete");
	players = getplayers();
	foreach(player in players)
	{
		player thread function_1dd9fc03();
		player thread function_b8aa1069();
	}
}

/*
	Name: function_1dd9fc03
	Namespace: zm_challenges
	Checksum: 0x9ED1E8AE
	Offset: 0x6AD0
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
	var_845ac04e = self stats::function_441050ca("t9_tu5_zm_dark_matter_fixedup");
	if(!isdefined(var_845ac04e))
	{
		var_845ac04e = 0;
	}
	if(var_845ac04e != 1)
	{
		self stats::function_4db3fba1("t9_tu5_zm_dark_matter_fixedup", 1);
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
			var_b1d90f13 = self stats::get_stat(#"hash_162f9b6a10fa7d66", weapon, #"kills", #"challengevalue");
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
			var_531d02e6 = self stats::get_stat(#"hash_162f9b6a10fa7d66", weapon, #"hash_46422decc5803401", #"challengetier");
			if(!isdefined(var_531d02e6))
			{
				continue;
			}
			var_6872fc45 = self stats::get_stat(#"hash_162f9b6a10fa7d66", weapon, #"hash_289883e2f7a6af52", #"challengetier");
			if(!isdefined(var_6872fc45))
			{
				continue;
			}
			var_59a3dcb1 = self stats::get_stat(#"hash_162f9b6a10fa7d66", weapon, #"hash_9c59d60380f570a", #"challengetier");
			if(!isdefined(var_59a3dcb1))
			{
				continue;
			}
			var_7bb2e982 = self stats::get_stat(#"hash_162f9b6a10fa7d66", weapon, #"multikill", #"challengetier");
			if(!isdefined(var_7bb2e982))
			{
				continue;
			}
			var_b72a7e87 = self stats::get_stat(#"hash_162f9b6a10fa7d66", weapon, #"hash_5870df5ed04a8f11", #"challengetier");
			if(!isdefined(var_b72a7e87))
			{
				continue;
			}
			var_3657e2eb = self stats::get_stat(#"hash_162f9b6a10fa7d66", weapon, #"hash_1f3b0d3bd9acb4a5", #"challengetier");
			if(!isdefined(var_3657e2eb))
			{
				continue;
			}
			var_99543712 = self stats::get_stat(#"hash_162f9b6a10fa7d66", weapon, #"challenges", #"challengevalue");
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
				var_d4bdcb67 = self stats::get_stat(#"hash_162f9b6a10fa7d66", weapon, #"challenges", #"challengevalue");
				if(!isdefined(var_d4bdcb67))
				{
					continue;
				}
				if(var_d4bdcb67 >= 35)
				{
					var_d4ece5d0 = self stats::get_stat(#"hash_162f9b6a10fa7d66", weapon, #"hash_7fce4a14fec05da1", #"challengevalue");
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

