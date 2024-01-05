#using scripts\killstreaks\killstreaks_util.gsc;
#using scripts\zm_common\ai\zm_ai_utility.gsc;
#using scripts\zm_common\zm_vo.gsc;
#using scripts\zm_common\zm_equipment.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\zm_common\zm_challenges.gsc;
#using scripts\zm_common\zm_contracts.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\throttle_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\popups_shared.gsc;
#using scripts\core_common\ai_shared.gsc;

#namespace scoreevents;

/*
	Name: __init__system__
	Namespace: scoreevents
	Checksum: 0xABBB71C4
	Offset: 0x1278
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"scoreevents", &function_70a657d8, &init, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: scoreevents
	Checksum: 0x6F4375FF
	Offset: 0x12D0
	Size: 0xAA0
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	registerscoreeventcallback("scoreEventZM", &scoreeventzm);
	registerscoreeventcallback("killingBlow", &function_970a97b2);
	level.var_c90fb58a = [];
	for(i = 0; i < 4; i++)
	{
		var_dae19230 = new class_c6c0e94();
		[[ var_dae19230 ]]->initialize(#"hash_489786730d0b07be", 2, float(function_60d95f53()) / 1000);
		level.var_c90fb58a[level.var_c90fb58a.size] = var_dae19230;
	}
	level.var_640bc9e1 = 15;
	level.var_4bcd94b = [];
	level.var_42648a02 = [#"hash_18e3e5b441fb51b0":[4:1, 3:1250, 2:#"hash_394f4a59df1d0c17", 1:0.33, 0:2000], #"ieu_multikill_zm":[4:1, 3:1250, 2:#"hash_394f4a59df1d0c17", 1:0.33, 0:2000], #"ring_of_fire_multikill_zm":[4:2, 3:1500, 2:#"hash_5dc5c0d8c259c02d", 1:0.5, 0:2000], #"healing_aura_multikill_zm":[4:2, 3:1500, 2:#"hash_684963f03f8a86a5", 1:0.5, 0:2000], #"frost_blast_multikill_zm":[4:2, 3:1500, 2:#"hash_2d45724fc1a86740", 1:0.5, 0:2000], #"energy_mine_multikill_zm":[4:2, 3:1250, 2:#"hash_2af4d13403d833e5", 1:0.5, 0:2000], #"aether_shroud_multikill_zm":[4:2, 3:1500, 2:#"hash_3e454dbd28a162b0", 1:0.5, 0:2000], #"melee_weapon_multikill_zm":[4:2, 3:1000, 2:#"hash_6b704db2e152d216", 1:0.5, 0:2000], #"oneshot_explosive_multikill_zm":[4:2, 3:1000, 2:#"hash_68d4ef9c937aa223", 1:0.5, 0:2000], #"oneshot_multikill_zm":[4:2, 3:1000, 2:#"hash_31d075ffaf2c230a", 1:0.5, 0:2000], #"crit_finisher_multikill_zm":[4:2, 3:1000, 2:#"hash_406609dcd40a348e", 1:0.5, 0:2000], #"multikillstreak_25_zm":[4:1, 3:2000, 2:#"hash_343f719a2335150b", 1:0.65, 0:3200], #"multikillstreak_20_zm":[4:1, 3:2000, 2:#"hash_343f749a23351a24", 1:0.55, 0:3100], #"multikillstreak_15_zm":[4:1, 3:1500, 2:#"hash_3449e19a233e27e0", 1:0.5, 0:2500], #"multikillstreak_10_zm":[4:2, 3:1500, 2:#"hash_3449e69a233e305f", 1:0.5, 0:1900], #"multikillstreak_5_zm":[4:2, 3:1500, 2:#"hash_4bd8ffae8d5281c9", 1:0.5, 0:1800], #"monkey_bomb_multikill_zm":[4:1, 3:1500, 2:#"hash_28808125fce8c8e7", 1:0.5, 0:2000], #"concussion_grenade_multikill_zm":[4:undefined, 3:1500, 2:"SE_ConcussionGrenadeMultikill", 1:0.5, 0:2000], #"semtex_multikill_zm":[4:undefined, 3:1500, 2:"SE_SemtexMultikill", 1:0.5, 0:2000], #"molotov_multikill_zm":[4:undefined, 3:1500, 2:"SE_MolotovCocktailMultikill", 1:0.5, 0:2000], #"frag_multikill_zm":[4:undefined, 3:1500, 2:"SE_FragMultikill", 1:0.5, 0:2000], #"nightengale_multikill_zm":[4:undefined, 3:1500, 2:"SE_NightingaleMultikill", 1:0.5, 0:2000], #"satchel_charge_multikill_zm":[4:undefined, 3:1500, 2:"SE_SatchelChargeMultikill", 1:0.5, 0:2000], #"hash_7d61681b4a86f9c1":[4:1, 3:1000, 2:#"hash_56bc9b3d6947b8b6", 1:1, 0:4000], #"hash_2bdba8dd04a772a9":[4:2, 3:1000, 2:#"hash_7e2f32f691207aca", 1:0.5, 0:3000], #"hash_4efbe7fdd1c5873d":[4:2, 3:1000, 2:#"hash_4d97a2cf6c712d4e", 1:0.3, 0:2000], #"hash_25f082a4f62ed553":[4:undefined, 3:750, 2:#"hash_d6e9cf445a840a", 1:0.1, 0:0], #"hash_3e68a28d3c2e0479":[4:undefined, 3:750, 2:#"hash_1561254978f7d1ed", 1:0.1, 0:0]];
}

/*
	Name: init
	Namespace: scoreevents
	Checksum: 0xF8CA8B3D
	Offset: 0x1D78
	Size: 0x14
	Parameters: 0
	Flags: Linked
*/
function init()
{
	function_af57ad40();
}

/*
	Name: function_af57ad40
	Namespace: scoreevents
	Checksum: 0xCDFAABAA
	Offset: 0x1D98
	Size: 0x73C
	Parameters: 0
	Flags: Linked
*/
function function_af57ad40()
{
	function_9451b95c(#"hatchet", "hatchet_killingblow_zm", "hatchet_killingblow_special_zm", "hatchet_killingblow_elite_zm");
	function_9451b95c(#"frag_grenade", "frag_killingblow_zm", "frag_killingblow_special_zm", "frag_killingblow_elite_zm");
	function_9451b95c(#"eq_sticky_grenade", "semtex_killingblow_zm", "semtex_killingblow_special_zm", "semtex_killingblow_elite_zm");
	function_9451b95c(#"satchel_charge", "satchel_charge_killingblow_zm", "satchel_charge_killingblow_special_zm", "satchel_charge_killingblow_elite_zm");
	function_9451b95c(#"cymbal_monkey", "monkey_bomb_killingblow_zm", "monkey_bomb_killingblow_zm", "monkey_bomb_killingblow_zm");
	function_9451b95c(#"molotov_fire", "molotov_killingblow_zm", "molotov_killingblow_special_zm", "molotov_killingblow_elite_zm");
	function_9451b95c(#"eq_slow_grenade", "concussion_grenade_killingblow_zm", "concussion_grenade_killingblow_special_zm", "concussion_grenade_killingblow_elite_zm");
	function_9451b95c(#"gun_ultimate_turret", "sentry_turret_kill_zm", "sentry_turret_special_kill_zm", "sentry_turret_elite_kill_zm");
	function_9451b95c(#"sig_lmg", "death_machine_kill_zm", "death_machine_special_kill_zm", "death_machine_elite_kill_zm");
	function_9451b95c(#"hero_flamethrower", "flamethrower_kill_zm", "flamethrower_special_kill_zm", "flamethrower_elite_kill_zm");
	function_9451b95c(#"hero_pineapplegun", "grenade_launcher_kill_zm", "grenade_launcher_special_kill_zm", "grenade_launcher_elite_kill_zm");
	function_9451b95c(#"hash_86464477ee762aa", "cruise_missile_kill_zm", "cruise_missile_kill_special_zm", "cruise_missile_kill_elite_zm");
	function_9451b95c(#"remote_missile_bomblet", "cruise_missile_kill_zm", "cruise_missile_kill_special_zm", "cruise_missile_kill_elite_zm");
	function_9451b95c(#"sig_bow_flame", "combat_bow_kill_zm", "combat_bow_special_kill_zm", "combat_bow_elite_kill_zm");
	function_9451b95c(#"hash_1734871fef9c0549", "chopper_gunner_kill_zm", "chopper_gunner_kill_special_zm", "chopper_gunner_kill_elite_zm");
	function_9451b95c(#"energy_mine", "energy_mine_kill_zm", "energy_mine_kill_special_zm", "energy_mine_kill_elite_zm");
	function_9451b95c(#"energy_mine_1", "energy_mine_kill_zm", "energy_mine_kill_special_zm", "energy_mine_kill_elite_zm");
	function_9451b95c(#"energy_mine_2", "energy_mine_kill_zm", "energy_mine_kill_special_zm", "energy_mine_kill_elite_zm");
	function_9451b95c(#"energy_mine_3", "energy_mine_kill_zm", "energy_mine_kill_special_zm", "energy_mine_kill_elite_zm");
	function_9451b95c(#"energy_mine_4", "energy_mine_kill_zm", "energy_mine_kill_special_zm", "energy_mine_kill_elite_zm");
	function_9451b95c(#"hash_4ac3fea4add2a2c9", "energy_mine_kill_zm", "energy_mine_kill_special_zm", "energy_mine_kill_elite_zm");
	function_9451b95c(#"hash_85edf3a63bb488c", "frost_blast_kill_zm", "frost_blast_kill_special_zm", "frost_blast_kill_elite_zm");
	function_9451b95c(#"frost_blast_1", "frost_blast_kill_zm", "frost_blast_kill_special_zm", "frost_blast_kill_elite_zm");
	function_9451b95c(#"frost_blast_2", "frost_blast_kill_zm", "frost_blast_kill_special_zm", "frost_blast_kill_elite_zm");
	function_9451b95c(#"frost_blast_3", "frost_blast_kill_zm", "frost_blast_kill_special_zm", "frost_blast_kill_elite_zm");
	function_9451b95c(#"frost_blast_4", "frost_blast_kill_zm", "frost_blast_kill_special_zm", "frost_blast_kill_elite_zm");
	function_9451b95c(#"frost_blast_5", "frost_blast_kill_zm", "frost_blast_kill_special_zm", "frost_blast_kill_elite_zm");
	function_9451b95c(#"ring_of_fire", "ring_of_fire_burn_finisher_zm", "ring_of_fire_burn_finisher_special_zm", "ring_of_fire_burn_finisher_elite_zm");
	function_9451b95c(#"hash_631a223758cd92a", "ring_of_fire_burn_finisher_zm", "ring_of_fire_burn_finisher_special_zm", "ring_of_fire_burn_finisher_elite_zm");
	function_9451b95c(#"hash_631a123758cd777", "ring_of_fire_burn_finisher_zm", "ring_of_fire_burn_finisher_special_zm", "ring_of_fire_burn_finisher_elite_zm");
	function_9451b95c(#"hash_631a023758cd5c4", "ring_of_fire_burn_finisher_zm", "ring_of_fire_burn_finisher_special_zm", "ring_of_fire_burn_finisher_elite_zm");
	function_9451b95c(#"hash_6319f23758cd411", "ring_of_fire_burn_finisher_zm", "ring_of_fire_burn_finisher_special_zm", "ring_of_fire_burn_finisher_elite_zm");
	function_9451b95c(#"hash_6319e23758cd25e", "ring_of_fire_burn_finisher_zm", "ring_of_fire_burn_finisher_special_zm", "ring_of_fire_burn_finisher_elite_zm");
}

/*
	Name: function_9451b95c
	Namespace: scoreevents
	Checksum: 0x5F0AF492
	Offset: 0x24E0
	Size: 0xDC
	Parameters: 4
	Flags: Linked
*/
function function_9451b95c(equipment_name, var_92746e82, var_f3af4e17, var_5ef88cf)
{
	/#
		/#
			assert(!isdefined(level.var_4bcd94b[equipment_name]), "" + (ishash(equipment_name) ? function_9e72a96(equipment_name) : equipment_name));
		#/
	#/
	level.var_4bcd94b[equipment_name] = {#hash_9b275351:var_5ef88cf, #special_event:var_f3af4e17, #hash_fd2db56a:var_92746e82};
}

/*
	Name: scoreeventzm
	Namespace: scoreevents
	Checksum: 0x7F9703AF
	Offset: 0x25C8
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function scoreeventzm(params)
{
	if(isdefined(params.scoreevent) && zm_utility::is_player_valid(params.attacker, 0, 0))
	{
		processscoreevent(params.scoreevent, params.attacker, undefined, params.weapon);
	}
}

/*
	Name: function_a1f450c2
	Namespace: scoreevents
	Checksum: 0x48AF91B6
	Offset: 0x2640
	Size: 0x274
	Parameters: 4
	Flags: Linked
*/
function function_a1f450c2(event, attacker, enemy, weapon)
{
	if(zm_utility::is_player_valid(attacker, 0, 0))
	{
		if(enemy.var_6f84b820 === #"elite")
		{
			processscoreevent(event + "_elite_zm", attacker, enemy, weapon);
		}
		else
		{
			if(enemy.var_6f84b820 === #"special")
			{
				processscoreevent(event + "_special_zm", attacker, enemy, weapon);
			}
			else
			{
				processscoreevent(event + "_zm", attacker, enemy, weapon);
			}
		}
		if(!isdefined(attacker.var_40cd3e93))
		{
			attacker.var_40cd3e93 = [];
		}
		if(isdefined(attacker.var_40cd3e93[event]))
		{
			if(attacker.var_40cd3e93[event].time > (gettime() - 2000) && attacker.var_40cd3e93[event].on_cooldown === 0)
			{
				attacker.var_40cd3e93[event].multikills++;
				attacker.var_40cd3e93[event].time = gettime() + 2000;
			}
			else if(attacker.var_40cd3e93[event].time < gettime())
			{
				attacker.var_40cd3e93[event] = {#on_cooldown:0, #multikills:1, #weapon:undefined, #time:gettime(), #player:attacker};
			}
		}
		else
		{
			attacker.var_40cd3e93[event] = {#on_cooldown:0, #multikills:1, #weapon:undefined, #time:gettime(), #player:attacker};
		}
	}
}

/*
	Name: function_970a97b2
	Namespace: scoreevents
	Checksum: 0xCB0C4894
	Offset: 0x28C0
	Size: 0x2328
	Parameters: 1
	Flags: Linked
*/
function function_970a97b2(params)
{
	pixbeginevent();
	updatemultikill(params);
	pixendevent();
	var_a0345f37 = {};
	if(isactor(params.enemy))
	{
		var_a0345f37.origin = params.enemy.origin;
		var_a0345f37.angles = params.enemy.angles;
		var_a0345f37.archetype = params.enemy.archetype;
		var_a0345f37.var_66c1748e = params.enemy function_7f0363e8(1);
		var_a0345f37.var_24f0cbe0 = params.enemy.var_24f0cbe0;
		var_a0345f37.var_6f84b820 = params.enemy.var_6f84b820;
		var_a0345f37.var_716c0cc9 = params.enemy.var_716c0cc9;
		var_a0345f37.var_9624a42c = params.enemy.var_9624a42c;
		var_a0345f37.var_1d8cde9 = params.enemy.var_1d8cde9;
		var_a0345f37.var_e293f8ac = params.enemy.var_e293f8ac;
		var_a0345f37.var_c2dcab66 = params.enemy.var_c2dcab66;
		var_a0345f37.var_7b22b800 = params.enemy.var_7b22b800;
		var_a0345f37.var_c6f48ff5 = params.enemy.var_c6f48ff5;
		var_a0345f37.var_3f87fe17 = params.enemy.var_3f87fe17;
		var_a0345f37.var_49fdad6a = params.enemy.var_49fdad6a;
		var_a0345f37.var_8221e855 = params.enemy.var_8221e855;
		var_a0345f37.smeansofdeath = params.enemy.smeansofdeath;
		var_a0345f37.var_f42aed2a = params.enemy.var_f42aed2a;
		var_a0345f37.var_aa2ce9a4 = params.enemy.var_aa2ce9a4;
		var_a0345f37.var_12745932 = params.enemy.var_12745932;
		var_a0345f37.var_d1b39105 = params.enemy flag::get(#"hash_83000b27a1fe353");
		var_a0345f37.var_9c33fa32 = params.enemy.var_9c33fa32;
		var_a0345f37.var_8126f3c8 = params.enemy.var_8126f3c8;
		var_a0345f37.var_fc304017 = params.enemy.var_fc304017;
		var_a0345f37.damagemod = params.enemy.damagemod;
		var_a0345f37.var_d3ed3a9b = params.enemy zm_utility::function_4562a3ef(params.enemy.damagelocation);
		var_a0345f37.var_9b0f545e = params.enemy.var_9b0f545e;
		var_a0345f37.var_958cf9c5 = params.enemy.var_958cf9c5;
		var_a0345f37.var_e5d5f66e = params.enemy.var_e5d5f66e;
		var_a0345f37.var_991315b5 = params.enemy.var_991315b5;
	}
	if(!isplayer(params.eattacker))
	{
		return;
	}
	var_fdf0b12f = params.eattacker getentitynumber();
	waitframe(1);
	if(!isplayer(params.eattacker))
	{
		return;
	}
	[[ level.var_c90fb58a[var_fdf0b12f] ]]->waitinqueue(var_a0345f37);
	pixbeginevent();
	if(isdefined(level.var_ade393f4))
	{
		level [[level.var_ade393f4]](var_a0345f37, params.eattacker);
	}
	if(zm_utility::is_player_valid(params.eattacker, 0, 0))
	{
		if(params.eattacker.var_d853c1af !== 1)
		{
			if(var_a0345f37.var_6f84b820 === #"special")
			{
				function_644d867a(params.eattacker, params.time, #"hash_4efbe7fdd1c5873d");
			}
			else
			{
				if(var_a0345f37.var_6f84b820 === #"elite")
				{
					function_644d867a(params.eattacker, params.time, #"hash_2bdba8dd04a772a9");
				}
				else
				{
					if(var_a0345f37.var_6f84b820 === #"boss")
					{
						function_644d867a(params.eattacker, params.time, #"hash_7d61681b4a86f9c1");
					}
					else
					{
						function_8fb658e2(params);
					}
				}
			}
		}
		else
		{
			function_8fb658e2(params);
		}
		var_6fc038a1 = get_distance_for_weapon(params.weapon);
		if(isdefined(var_6fc038a1) && var_6fc038a1 > 0 && (params.smeansofdeath === "MOD_PISTOL_BULLET" || params.smeansofdeath === "MOD_RIFLE_BULLET"))
		{
			if(distancesquared(params.eattacker.origin, var_a0345f37.origin) > var_6fc038a1)
			{
				if(var_a0345f37.var_6f84b820 === #"elite")
				{
					processscoreevent("longshot_killingblow_elite_zm", params.eattacker, var_a0345f37, params.weapon, undefined, params);
				}
				else
				{
					if(var_a0345f37.var_6f84b820 === #"special")
					{
						processscoreevent("longshot_killingblow_special_zm", params.eattacker, var_a0345f37, params.weapon, undefined, params);
					}
					else
					{
						processscoreevent("longshot_killingblow_zm", params.eattacker, var_a0345f37, params.weapon, undefined, params);
					}
				}
			}
		}
		if(is_true(params.eattacker.var_b1164fd0))
		{
			if(!isdefined(params.eattacker.var_edae10c))
			{
				params.eattacker.var_edae10c = 1;
			}
			else
			{
				params.eattacker.var_edae10c++;
			}
			if(var_a0345f37.var_6f84b820 === #"elite")
			{
				processscoreevent("aether_shroud_kill_elite_zm", params.eattacker, var_a0345f37, params.weapon, undefined, params);
			}
			else
			{
				if(var_a0345f37.var_6f84b820 === #"special")
				{
					processscoreevent("aether_shroud_kill_special_zm", params.eattacker, var_a0345f37, params.weapon, undefined, params);
				}
				else
				{
					processscoreevent("aether_shroud_kill_zm", params.eattacker, var_a0345f37, params.weapon, undefined, params);
				}
			}
			params.eattacker zm_stats::increment_challenge_stat(#"hash_2c0504992b5785f2");
			if(params.eattacker.var_edae10c >= 5)
			{
				params.eattacker.var_edae10c = -1000;
				processscoreevent("aether_shroud_multikill_zm", params.eattacker, undefined, params.weapon, undefined, params);
				params.eattacker zm_stats::increment_challenge_stat(#"hash_4a2f02fa15e7fd11");
				params.eattacker contracts::increment_zm_contract(#"hash_58e200f3e5061cb9");
			}
		}
		else if(isdefined(params.eattacker.var_edae10c))
		{
			params.eattacker.var_edae10c = undefined;
		}
		if(isdefined(params.var_a3660fca) || is_true(var_a0345f37.var_f42aed2a))
		{
			if(var_a0345f37.var_6f84b820 === #"elite")
			{
				processscoreevent("brain_rot_turned_kill_elite_zm", params.eattacker, var_a0345f37, params.weapon, undefined, params);
				params.eattacker.var_9c448324 = 1;
			}
			else
			{
				if(var_a0345f37.var_6f84b820 === #"special")
				{
					processscoreevent("brain_rot_turned_kill_special_zm", params.eattacker, var_a0345f37, params.weapon, undefined, params);
					params.eattacker.var_9c448324 = 1;
				}
				else
				{
					processscoreevent("brain_rot_turned_kill_zm", params.eattacker, var_a0345f37, params.weapon, undefined, params);
					params.eattacker.var_9c448324 = 1;
				}
			}
		}
		if(isdefined(var_a0345f37.var_3f87fe17))
		{
			if(var_a0345f37.var_3f87fe17.stun_time > gettime() - (2.5 * 1000))
			{
				if(var_a0345f37.var_3f87fe17.player === params.eattacker)
				{
					if(var_a0345f37.var_6f84b820 === #"elite")
					{
					}
					else
					{
					}
				}
				else if(var_a0345f37.var_6f84b820 === #"elite" && var_a0345f37.var_6f84b820 === #"special")
				{
					processscoreevent("healing_aura_stun_assist_zm", params.eattacker, var_a0345f37, params.weapon, undefined, params);
				}
			}
			else
			{
				var_a0345f37.var_3f87fe17 = undefined;
			}
		}
	}
	if(var_a0345f37.var_d1b39105 === 1 && zm_utility::is_player_valid(var_a0345f37.var_9c33fa32, 0, 0))
	{
		if(params.eattacker === var_a0345f37.var_9c33fa32)
		{
			if(var_a0345f37.var_6f84b820 === #"elite")
			{
				processscoreevent("dead_wire_stun_kill_elite_zm", params.eattacker, var_a0345f37, params.weapon, undefined, params);
			}
			else
			{
				if(var_a0345f37.var_6f84b820 === #"special")
				{
					processscoreevent("dead_wire_stun_kill_special_zm", params.eattacker, var_a0345f37, params.weapon, undefined, params);
				}
				else
				{
					processscoreevent("dead_wire_stun_kill_zm", params.eattacker, var_a0345f37, params.weapon, undefined, params);
				}
			}
		}
		else
		{
			processscoreevent("dead_wire_stun_assist_zm", var_a0345f37.var_9c33fa32, var_a0345f37, params.weapon, undefined, params);
		}
	}
	else if(var_a0345f37.var_fc304017 === 1 && zm_utility::is_player_valid(params.eattacker, 0, 0))
	{
		if(params.eattacker === var_a0345f37.var_9c33fa32)
		{
			if(var_a0345f37.var_6f84b820 === #"elite")
			{
				processscoreevent("dead_wire_stun_kill_elite_zm", params.eattacker, var_a0345f37, params.weapon, undefined, params);
			}
			else
			{
				if(var_a0345f37.var_6f84b820 === #"special")
				{
					processscoreevent("dead_wire_stun_kill_special_zm", params.eattacker, var_a0345f37, params.weapon, undefined, params);
				}
				else
				{
					processscoreevent("dead_wire_stun_kill_zm", params.eattacker, var_a0345f37, params.weapon, undefined, params);
				}
			}
		}
		else
		{
			processscoreevent("dead_wire_stun_assist_zm", var_a0345f37.var_9c33fa32, var_a0345f37, params.weapon, undefined, params);
		}
	}
	if(isdefined(params.eattacker.var_d93ab65) && params.eattacker.var_d93ab65.size > 0)
	{
		foreach(ring_of_fire in params.eattacker.var_d93ab65)
		{
			if(zm_utility::is_player_valid(ring_of_fire.owner, 0, 0))
			{
				if(ring_of_fire.owner === params.eattacker)
				{
					if(isdefined(params.eattacker.var_a25e160d))
					{
						params.eattacker.var_a25e160d++;
						params.eattacker stats::function_622feb0d(#"ring_of_fire", #"hash_65e055407b6d8c3e", 1);
						params.eattacker stats::function_622feb0d(#"ring_of_fire", #"ekia", 1);
						params.eattacker stats::function_6fb0b113(#"ring_of_fire", #"hash_695f66aa9455e172");
						if(var_a0345f37.var_6f84b820 === #"elite")
						{
							processscoreevent("ring_of_fire_finisher_elite_zm", params.eattacker, var_a0345f37, params.weapon, undefined, params);
						}
						else
						{
							if(var_a0345f37.var_6f84b820 === #"special")
							{
								processscoreevent("ring_of_fire_finisher_special_zm", params.eattacker, var_a0345f37, params.weapon, undefined, params);
							}
							else
							{
								processscoreevent("ring_of_fire_finisher_zm", params.eattacker, var_a0345f37, params.weapon, undefined, params);
							}
						}
						params.eattacker zm_stats::increment_challenge_stat(#"hash_2c0504992b5785f2");
					}
					continue;
				}
				processscoreevent("ring_of_fire_assist_zm", ring_of_fire.owner, var_a0345f37, params.weapon, undefined, params);
			}
		}
	}
	if(var_a0345f37.var_958cf9c5 === 1)
	{
		if(var_a0345f37.damagemod === "MOD_MELEE" && zm_utility::is_player_valid(params.eattacker, 0, 0))
		{
			params.eattacker zm_challenges::function_d6b32ad3(params.weapon, #"hash_16ef903a11cc4173", 1);
		}
		if(zm_utility::is_player_valid(var_a0345f37.var_e5d5f66e, 0, 0) && !is_true(var_a0345f37.var_aa2ce9a4))
		{
			if(params.eattacker === var_a0345f37.var_e5d5f66e)
			{
				if(var_a0345f37.var_6f84b820 === #"elite")
				{
					processscoreevent("cryo_freeze_slow_kill_elite_zm", params.eattacker, var_a0345f37, params.weapon, undefined, params);
				}
				else
				{
					if(var_a0345f37.var_6f84b820 === #"special")
					{
						processscoreevent("cryo_freeze_slow_kill_special_zm", params.eattacker, var_a0345f37, params.weapon, undefined, params);
					}
					else
					{
						processscoreevent("cryo_freeze_slow_kill_zm", params.eattacker, var_a0345f37, params.weapon, undefined, params);
					}
				}
			}
			else
			{
				processscoreevent("cryo_freeze_slow_assist_zm", var_a0345f37.var_e5d5f66e, var_a0345f37, params.weapon, undefined, params);
			}
		}
		else if(zm_utility::is_player_valid(var_a0345f37.var_991315b5, 0, 0))
		{
			if(params.eattacker === var_a0345f37.var_991315b5)
			{
				if(var_a0345f37.var_6f84b820 === #"elite")
				{
					processscoreevent("frost_blast_frozen_kill_elite_zm", params.eattacker, var_a0345f37, params.weapon, undefined, params);
				}
				else
				{
					if(var_a0345f37.var_6f84b820 === #"special")
					{
						processscoreevent("frost_blast_frozen_kill_special_zm", params.eattacker, var_a0345f37, params.weapon, undefined, params);
					}
					else
					{
						processscoreevent("frost_blast_frozen_kill_zm", params.eattacker, var_a0345f37, params.weapon, undefined, params);
					}
				}
			}
			else
			{
				processscoreevent("frost_blast_frozen_assist_zm", var_a0345f37.var_991315b5, var_a0345f37, params.weapon, undefined, params);
			}
		}
	}
	if(params.smeansofdeath === "MOD_MELEE" && zm_utility::is_player_valid(params.eattacker, 0, 0))
	{
		if(is_true(params.eattacker.var_b1164fd0))
		{
			params.eattacker zm_challenges::function_d6b32ad3(params.weapon, #"hash_16ef903a11cc4173", 1);
		}
		if(var_a0345f37.var_6f84b820 === #"elite")
		{
			processscoreevent("melee_killingblow_elite_zm", params.eattacker, var_a0345f37, params.weapon, undefined, params);
			params.eattacker.var_9c448324 = 1;
		}
		else
		{
			if(var_a0345f37.var_6f84b820 === #"special")
			{
				processscoreevent("melee_killingblow_special_zm", params.eattacker, var_a0345f37, params.weapon, undefined, params);
				params.eattacker.var_9c448324 = 1;
			}
			else
			{
				processscoreevent("melee_killingblow_zm", params.eattacker, var_a0345f37, params.weapon, undefined, params);
				params.eattacker.var_9c448324 = 1;
			}
		}
	}
	else if(var_a0345f37.var_d3ed3a9b && params.weapon.name !== #"gun_ultimate_turret" && params.weapon.name !== #"hatchet" && zm_utility::is_player_valid(params.eattacker, 0, 0))
	{
		if(var_a0345f37.var_6f84b820 === #"elite" && !isdefined(params.enemy.var_e293f8ac))
		{
			processscoreevent("headshot_killingblow_elite_zm", params.eattacker, var_a0345f37, params.weapon, undefined, params);
			params.eattacker.var_9c448324 = 1;
		}
		else
		{
			if(var_a0345f37.var_6f84b820 === #"special")
			{
				processscoreevent("headshot_killingblow_special_zm", params.eattacker, var_a0345f37, params.weapon, undefined, params);
				params.eattacker.var_9c448324 = 1;
			}
			else
			{
				processscoreevent("headshot_killingblow_zm", params.eattacker, var_a0345f37, params.weapon, undefined, params);
				params.eattacker.var_9c448324 = 1;
			}
		}
	}
	if(is_true(var_a0345f37.var_9b0f545e))
	{
		if(var_a0345f37.var_6f84b820 === #"elite")
		{
			processscoreevent("napalm_burst_burn_finisher_elite_zm", params.eattacker, var_a0345f37, params.weapon, undefined, params);
			params.eattacker.var_9c448324 = 1;
		}
		else
		{
			if(var_a0345f37.var_6f84b820 === #"special")
			{
				processscoreevent("napalm_burst_burn_finisher_special_zm", params.eattacker, var_a0345f37, params.weapon, undefined, params);
				params.eattacker.var_9c448324 = 1;
			}
			else
			{
				processscoreevent("napalm_burst_burn_finisher_zm", params.eattacker, var_a0345f37, params.weapon, undefined, params);
				params.eattacker.var_9c448324 = 1;
			}
		}
	}
	if(is_equipment(params.weapon))
	{
		if(isdefined(params.weapon.statname))
		{
			switch(params.weapon.statname)
			{
				case "frag_grenade":
				{
					params.eattacker stats::function_622feb0d(#"eq_frag_grenade", #"kills", 1);
					break;
				}
				default:
				{
					params.eattacker stats::function_622feb0d(params.weapon.statname, #"kills", 1);
					break;
				}
			}
		}
	}
	if(isdefined(level.var_4bcd94b[params.weapon.name]) && (!killstreaks::is_killstreak_weapon(params.weapon) || (killstreaks::is_killstreak_weapon(params.weapon) && var_a0345f37.damagemod !== "MOD_MELEE")))
	{
		event_struct = level.var_4bcd94b[params.weapon.name];
		params.eattacker.var_9c448324 = 1;
		scoreevent = undefined;
		if(var_a0345f37.var_6f84b820 === #"elite")
		{
			scoreevent = event_struct.var_9b275351;
		}
		else if(var_a0345f37.var_6f84b820 === #"special")
		{
			scoreevent = event_struct.special_event;
		}
		if(!isdefined(scoreevent))
		{
			scoreevent = event_struct.var_fd2db56a;
		}
		processscoreevent(scoreevent, params.eattacker, var_a0345f37, params.weapon, undefined, params);
	}
	else if(isdefined(params.weapon.name))
	{
		switch(params.weapon.name)
		{
			case "hash_3fa91d1674123e09":
			case "hash_5dd5741f21fd680d":
			case "hash_655d944e437c3d5b":
			case "hash_6e0b27b854e591a3":
			case "hash_72796957033e2e4a":
			{
				if(is_true(params.enemy.var_49fdad6a) && params.enemy.var_6f84b820 === #"elite" && (!isdefined(var_a0345f37.var_e293f8ac) || (isdefined(var_a0345f37.var_e293f8ac) && var_a0345f37.var_e293f8ac.size === 0)))
				{
					params.eattacker zm_stats::increment_challenge_stat(#"hash_3969fa6c05de12ef");
					processscoreevent("kill_steiner_caught_with_ieu_zm", params.eattacker, var_a0345f37, params.weapon, undefined, params);
					params.eattacker.var_9c448324 = 1;
				}
				break;
			}
		}
	}
	if(isdefined(params.enemy.enemy_override))
	{
		if(zm_utility::is_player_valid(params.enemy.enemy_override.owner, 0, 0))
		{
			switch(params.enemy.enemy_override.item.name)
			{
				case "hash_12f078ddc9b913c3":
				{
					if(var_a0345f37.damagemod === "MOD_MELEE" && zm_utility::is_player_valid(params.eattacker, 0, 0))
					{
						params.eattacker zm_challenges::function_d6b32ad3(params.weapon, #"hash_1f451bc4d664e2ad", 1);
					}
					params.eattacker stats::function_6fb0b113(#"nightingale", #"hash_54fc499311f0b3d");
					if(params.enemy.enemy_override.owner === params.eattacker)
					{
						params.enemy.enemy_override.owner stats::function_622feb0d(#"nightingale", #"kills", 1);
						if(params.enemy.var_6f84b820 === #"elite")
						{
							processscoreevent("nightengale_elite_kill_zm", params.eattacker, var_a0345f37, params.weapon, undefined, params);
						}
						else
						{
							if(params.enemy.var_6f84b820 === #"special")
							{
								processscoreevent("nightengale_special_kill_zm", params.eattacker, var_a0345f37, params.weapon, undefined, params);
							}
							else
							{
								processscoreevent("nightengale_kill_zm", params.eattacker, var_a0345f37, params.weapon, undefined, params);
							}
						}
					}
					else
					{
						processscoreevent("nightengale_assist_zm", params.enemy.enemy_override.owner, var_a0345f37, params.weapon, undefined, params);
						params.enemy.enemy_override.owner stats::function_622feb0d(#"nightingale", #"assists", 1);
					}
					break;
				}
			}
		}
		else if(params.enemy.enemy_override.anim_debug_name === "monkey")
		{
			if(var_a0345f37.damagemod === "MOD_MELEE" && zm_utility::is_player_valid(params.eattacker, 0, 0))
			{
				params.eattacker zm_challenges::function_d6b32ad3(params.weapon, #"hash_1f451bc4d664e2ad", 1);
			}
		}
	}
	if(isdefined(var_a0345f37.var_716c0cc9[#"kill"]) && (!isdefined(var_a0345f37.var_e293f8ac) || (isdefined(var_a0345f37.var_e293f8ac) && (!is_true(params.eattacker.var_9c448324) || var_a0345f37.var_e293f8ac.size === 0))))
	{
		processscoreevent(var_a0345f37.var_716c0cc9[#"kill"], params.eattacker, var_a0345f37, params.weapon, undefined, params);
	}
	if(isplayer(params.eattacker) && params.eattacker isinvehicle())
	{
		veh = params.eattacker getvehicleoccupied();
		if(veh getoccupantseat(params.eattacker) !== 0)
		{
			driver = veh getseatoccupant(0);
			if(isdefined(driver))
			{
				processscoreevent("passenger_assist_zm", driver, var_a0345f37, params.weapon, undefined, params);
				driver.var_9c448324 = 1;
			}
		}
	}
	params.enemy = var_a0345f37;
	function_f2ce8b86(params);
	pixendevent();
	level notify(#"hash_6c17824062de93e5", var_a0345f37.var_6f84b820 === #"special");
}

/*
	Name: function_82234b38
	Namespace: scoreevents
	Checksum: 0x18566243
	Offset: 0x4BF0
	Size: 0x464
	Parameters: 7
	Flags: Linked
*/
function function_82234b38(victim, attacker, weapon, meansofdeath, var_a3660fca, einflictor, var_b7a35db0)
{
	if(!isdefined(victim.var_c2dcab66))
	{
		victim.var_c2dcab66 = [];
	}
	if(zm_utility::is_player_valid(var_a3660fca, 0, 0))
	{
		victim.var_c2dcab66[var_a3660fca getentitynumber()] = {#hash_569e4e47:1, #weapon:weapon, #time:gettime(), #player:var_a3660fca};
	}
	else if(zm_utility::is_player_valid(attacker, 0, 0))
	{
		if(isdefined(victim.var_c2dcab66[attacker getentitynumber()]) && is_true(victim.var_c2dcab66[attacker getentitynumber()].var_569e4e47))
		{
			var_569e4e47 = 1;
		}
		if(zm_weapons::is_wonder_weapon(weapon) || weapon.statname === #"ray_gun")
		{
			victim.var_c2dcab66[attacker getentitynumber()] = {#hash_569e4e47:var_569e4e47, #hash_5349fa8f:1, #weapon:weapon, #time:gettime(), #player:attacker};
		}
		else
		{
			if(weapon.name === #"eq_sticky_grenade" || weapon.name === #"satchel_charge" || weapon.name === #"frag_grenade" || weapon.name === #"cymbal_monkey" || weapon.name === #"molotov_fire" || weapon.name === #"concussion_grenade" || weapon.name === #"hatchet")
			{
				victim.var_c2dcab66[attacker getentitynumber()] = {#hash_569e4e47:var_569e4e47, #hash_b8fea68d:1, #weapon:weapon, #time:gettime(), #player:attacker};
			}
			else
			{
				victim.var_c2dcab66[attacker getentitynumber()] = {#hash_b7a35db0:var_b7a35db0, #einflictor:einflictor, #hash_569e4e47:var_569e4e47, #weapon:weapon, #time:gettime(), #player:attacker};
			}
		}
	}
	if(weapon.name === #"eq_slow_grenade" && meansofdeath !== "MOD_IMPACT")
	{
		processscoreevent("concussion_grenade_concussed_enemy_zm", attacker, victim, weapon);
		attacker contracts::increment_zm_contract(#"hash_51d4ecc2bd44fb2b");
	}
}

/*
	Name: function_46e3cf42
	Namespace: scoreevents
	Checksum: 0x74E7DF9E
	Offset: 0x5060
	Size: 0x5E
	Parameters: 2
	Flags: Linked
*/
function function_46e3cf42(zombie, player)
{
	if(zm_utility::is_player_valid(player, 0, 0))
	{
		zombie.var_9624a42c = {#time:gettime(), #player:player};
	}
}

/*
	Name: function_513fa6e4
	Namespace: scoreevents
	Checksum: 0x78A254C4
	Offset: 0x50C8
	Size: 0xA4
	Parameters: 2
	Flags: None
*/
function function_513fa6e4(zombie, player)
{
	if(isdefined(zombie.var_9624a42c))
	{
		if(zm_utility::is_player_valid(zombie.var_9624a42c.player, 0, 0) && player !== zombie.var_9624a42c.player && zombie.var_9624a42c.time > (gettime() - 10000))
		{
			processscoreevent("kill_enemy_injuring_teammate_zm", player);
		}
	}
}

/*
	Name: function_f2ce8b86
	Namespace: scoreevents
	Checksum: 0x289DA177
	Offset: 0x5178
	Size: 0x11F8
	Parameters: 1
	Flags: Linked
*/
function function_f2ce8b86(params)
{
	if(isdefined(params.enemy.var_716c0cc9[#"assist"]) && isdefined(params.enemy.var_c2dcab66))
	{
		foreach(var_c2dcab66 in params.enemy.var_c2dcab66)
		{
			if(zm_utility::is_player_valid(var_c2dcab66.player, 0, 0) && var_c2dcab66.time > (gettime() - 10000) && (is_true(params.enemy.var_7b22b800) || var_c2dcab66.player != params.eattacker))
			{
				if(var_c2dcab66.player !== params.eattacker)
				{
					function_4ffff5df(var_c2dcab66.player, var_c2dcab66.weapon, params.var_9c448324, params.enemy);
				}
				if(is_equipment(var_c2dcab66.weapon))
				{
					if(isdefined(var_c2dcab66.weapon.statname))
					{
						switch(var_c2dcab66.weapon.statname)
						{
							case "frag_grenade":
							{
								var_c2dcab66.player stats::function_6fb0b113(#"eq_frag_grenade", #"hash_695f66aa9455e172");
								break;
							}
							default:
							{
								var_c2dcab66.player stats::function_6fb0b113(var_c2dcab66.weapon.statname, #"hash_695f66aa9455e172");
							}
						}
					}
				}
				else if(isdefined(var_c2dcab66.weapon.name))
				{
					switch(var_c2dcab66.weapon.name)
					{
						case "energy_mine":
						case "energy_mine_4":
						case "hash_4ac3fea4add2a2c9":
						case "energy_mine_2":
						case "energy_mine_3":
						case "energy_mine_1":
						{
							var_c2dcab66.player stats::function_6fb0b113(#"energy_mine", #"hash_695f66aa9455e172");
							break;
						}
						case "hash_85edf3a63bb488c":
						case "frost_blast_1":
						case "frost_blast_3":
						case "frost_blast_2":
						case "frost_blast_5":
						case "frost_blast_4":
						{
							var_c2dcab66.player stats::function_6fb0b113(#"hash_85edf3a63bb488c", #"hash_695f66aa9455e172");
							break;
						}
					}
				}
				if(var_c2dcab66.player === params.eattacker && var_c2dcab66.player isinvehicle())
				{
					veh = var_c2dcab66.player getvehicleoccupied();
					switch(veh getoccupantseat(var_c2dcab66.player))
					{
						case 0:
						{
							if(params.enemy.var_6f84b820 === #"elite")
							{
								processscoreevent("driver_kia_elite_zm", var_c2dcab66.player, params.enemy, var_c2dcab66.weapon);
								var_c2dcab66.player.var_9c448324 = 1;
							}
							else
							{
								if(params.enemy.var_6f84b820 === #"special")
								{
									processscoreevent("driver_kia_special_zm", var_c2dcab66.player, params.enemy, var_c2dcab66.weapon);
									var_c2dcab66.player.var_9c448324 = 1;
								}
								else
								{
									processscoreevent("driver_kia_zm", var_c2dcab66.player, params.enemy, var_c2dcab66.weapon);
									var_c2dcab66.player.var_9c448324 = 1;
								}
							}
							break;
						}
						case 1:
						case 2:
						case 3:
						case 4:
						{
							if(var_c2dcab66.weapon.statname !== #"chopper_gunner")
							{
								if(params.enemy.var_6f84b820 === #"elite")
								{
									processscoreevent("gunner_kia_elite_zm", var_c2dcab66.player, params.enemy, var_c2dcab66.weapon);
									var_c2dcab66.player.var_9c448324 = 1;
								}
								else
								{
									if(params.enemy.var_6f84b820 === #"special")
									{
										processscoreevent("gunner_kia_special_zm", var_c2dcab66.player, params.enemy, var_c2dcab66.weapon);
										var_c2dcab66.player.var_9c448324 = 1;
									}
									else
									{
										processscoreevent("gunner_kia_zm", var_c2dcab66.player, params.enemy, var_c2dcab66.weapon);
										var_c2dcab66.player.var_9c448324 = 1;
									}
								}
							}
							break;
						}
						case 5:
						case 6:
						case 7:
						case 8:
						case 9:
						case 10:
						{
							if(params.enemy.var_6f84b820 === #"elite")
							{
								processscoreevent("freelance_kia_elite_zm", var_c2dcab66.player, params.enemy, var_c2dcab66.weapon);
								var_c2dcab66.player.var_9c448324 = 1;
							}
							else
							{
								if(params.enemy.var_6f84b820 === #"special")
								{
									processscoreevent("freelance_kia_special_zm", var_c2dcab66.player, params.enemy, var_c2dcab66.weapon);
									var_c2dcab66.player.var_9c448324 = 1;
								}
								else
								{
									processscoreevent("freelance_kia_zm", var_c2dcab66.player, params.enemy, var_c2dcab66.weapon);
									var_c2dcab66.player.var_9c448324 = 1;
								}
							}
							break;
						}
					}
				}
				if(isdefined(params.enemy.var_c6f48ff5) && params.enemy.var_c6f48ff5 > 1)
				{
					var_c2dcab66.player zm_stats::increment_challenge_stat(#"hash_2a35d5d67e994b88");
				}
				if(var_c2dcab66.var_569e4e47 === 1)
				{
					var_c2dcab66.player zm_stats::increment_challenge_stat(#"hash_7fe169cf58d1d6ef");
				}
				if(var_c2dcab66.var_5349fa8f === 1)
				{
					var_c2dcab66.player zm_stats::increment_challenge_stat(#"hash_1ceaeed13ab4546b");
				}
				if(var_c2dcab66.var_b8fea68d === 1)
				{
					var_c2dcab66.player zm_stats::increment_challenge_stat(#"equipment_kills");
				}
				if(killstreaks::is_killstreak_weapon(var_c2dcab66.weapon))
				{
					var_db574065 = var_c2dcab66.einflictor.item;
					var_c2dcab66.player stats::function_8fb23f94(var_c2dcab66.weapon.statname, #"kills", 1);
					if(var_c2dcab66.einflictor.item.name === #"gun_ultimate_turret" && var_c2dcab66.einflictor.owner !== params.eattacker)
					{
						if(zm_utility::is_player_valid(var_c2dcab66.einflictor.owner, 0, 0))
						{
							processscoreevent("sentry_turret_assist_zm", var_c2dcab66.einflictor.owner, params.enemy, var_c2dcab66.weapon);
							var_c2dcab66.einflictor.owner.var_9c448324 = 1;
						}
					}
					if(isdefined(var_db574065))
					{
						if(!isdefined(var_db574065.var_8f44f2c0))
						{
							var_db574065.var_8f44f2c0 = 0;
						}
						var_db574065.var_8f44f2c0++;
						if(isdefined(var_db574065.kills))
						{
							var_db574065.kills++;
							if(var_db574065.kills >= 50)
							{
								var_db574065.kills = undefined;
								var_c2dcab66.player zm_stats::increment_challenge_stat(#"hash_3d79fa20a5d0fb7");
							}
						}
						else
						{
							var_db574065.kills = 1;
						}
					}
				}
				if(isdefined(params.enemy.var_e293f8ac))
				{
					function_1eaaceab(params.enemy.var_e293f8ac);
					if(params.enemy.var_e293f8ac.size === 1)
					{
						if(params.enemy.var_716c0cc9[#"assist"] === "steiner_kia_zm")
						{
							params.enemy.var_e293f8ac[0].var_8221e855 = gettime();
						}
					}
				}
				if(!is_true(var_c2dcab66.player.var_9c448324))
				{
					if(isdefined(params.enemy.var_e293f8ac))
					{
						function_1eaaceab(params.enemy.var_e293f8ac);
						if(params.enemy.var_e293f8ac.size === 0)
						{
							if(isdefined(params.enemy.var_8221e855) && params.enemy.var_8221e855 > (gettime() - 2000))
							{
								params.enemy.var_8221e855 = undefined;
								var_c2dcab66.player zm_stats::increment_challenge_stat(#"hash_6baa731ac0cca35a");
								processscoreevent("kill_both_steiner_halves_rapidly_zm", var_c2dcab66.player, params.enemy, var_c2dcab66.weapon);
							}
							if(var_c2dcab66.player === params.eattacker && var_c2dcab66.weapon.name === #"satchel_charge")
							{
								params.eattacker zm_stats::increment_challenge_stat(#"hash_1a8c582d9511cea8");
							}
							params.enemy.var_c7e611ea = params.enemy.var_24f0cbe0;
							processscoreevent("steiner_kia_zm", var_c2dcab66.player, params.enemy, var_c2dcab66.weapon);
						}
					}
					else
					{
						processscoreevent(params.enemy.var_716c0cc9[#"assist"], var_c2dcab66.player, params.enemy, var_c2dcab66.weapon);
					}
				}
				else if(isdefined(params.enemy.var_e293f8ac))
				{
					function_1eaaceab(params.enemy.var_e293f8ac);
					if(params.enemy.var_e293f8ac.size === 0)
					{
						if(isdefined(params.enemy.var_8221e855) && params.enemy.var_8221e855 > (gettime() - 2000))
						{
							params.enemy.var_8221e855 = undefined;
							var_c2dcab66.player zm_stats::increment_challenge_stat(#"hash_6baa731ac0cca35a");
							processscoreevent("kill_both_steiner_halves_rapidly_zm", var_c2dcab66.player, params.enemy, var_c2dcab66.weapon);
						}
						if(var_c2dcab66.player === params.eattacker && var_c2dcab66.weapon.name === #"satchel_charge")
						{
							params.eattacker zm_stats::increment_challenge_stat(#"hash_1a8c582d9511cea8");
						}
						params.enemy.var_c7e611ea = params.enemy.var_24f0cbe0;
						processscoreevent("steiner_kia_zm", var_c2dcab66.player, params.enemy, var_c2dcab66.weapon);
					}
				}
				if(params.enemy.var_6f84b820 === #"elite" && isdefined(var_c2dcab66.weapon) && (!isdefined(params.enemy.var_e293f8ac) || (isdefined(params.enemy.var_e293f8ac) && params.enemy.var_e293f8ac.size === 0)))
				{
					var_c2dcab66.player zm_challenges::function_d6b32ad3(var_c2dcab66.weapon, #"hash_9c59d60380f570a", 1);
				}
				if(is_true(var_c2dcab66.player.var_b1164fd0))
				{
					var_c2dcab66.player stats::function_622feb0d(#"aether_shroud", #"kills", 1);
					var_c2dcab66.player stats::function_6fb0b113(#"aether_shroud", #"hash_695f66aa9455e172");
				}
				var_c2dcab66.player.var_9c448324 = undefined;
				var_c2dcab66.player zm_challenges::function_575c37e0(var_c2dcab66.weapon, params.enemy);
			}
		}
	}
}

/*
	Name: function_4ffff5df
	Namespace: scoreevents
	Checksum: 0x9283F279
	Offset: 0x6378
	Size: 0x184
	Parameters: 4
	Flags: Linked
*/
function function_4ffff5df(attacker, weapon, var_9c448324, enemy)
{
	if(!is_true(var_9c448324))
	{
		if(is_equipment(weapon))
		{
			if(isdefined(weapon.statname))
			{
				switch(weapon.statname)
				{
					case "frag_grenade":
					{
						attacker stats::function_622feb0d(#"eq_frag_grenade", #"assists", 1);
						break;
					}
					default:
					{
						attacker stats::function_622feb0d(weapon.statname, #"assists", 1);
						break;
					}
				}
			}
		}
		if(weapon.name === #"molotov_fire")
		{
			processscoreevent("molotov_assist_zm", attacker, enemy);
		}
		else if(weapon.name === #"eq_slow_grenade")
		{
			processscoreevent("concussion_grenade_assist_zm", attacker, enemy);
		}
	}
}

/*
	Name: is_equipment
	Namespace: scoreevents
	Checksum: 0xF1A70D13
	Offset: 0x6508
	Size: 0xCC
	Parameters: 1
	Flags: Linked
*/
function is_equipment(weapon)
{
	if(!isdefined(weapon.name))
	{
		return false;
	}
	switch(weapon.name)
	{
		case "molotov_fire":
		case "frag_grenade":
		case "hatchet":
		case "eq_sticky_grenade":
		case "eq_slow_grenade":
		case "satchel_charge":
		case "cymbal_monkey":
		{
			return true;
			break;
		}
		default:
		{
			return false;
			break;
		}
	}
	return false;
}

/*
	Name: updatemultikill
	Namespace: scoreevents
	Checksum: 0x2C96D461
	Offset: 0x65E0
	Size: 0x4C5C
	Parameters: 1
	Flags: Linked
*/
function updatemultikill(params)
{
	if(isdefined(level.var_88e6f8b7))
	{
		level [[level.var_88e6f8b7]](params);
	}
	if(!isdefined(params.eattacker.var_4927d3d))
	{
		params.eattacker.var_4927d3d = [];
	}
	if(isdefined(params.enemy.enemy_override))
	{
		if(zm_utility::is_player_valid(params.enemy.enemy_override.owner, 0, 0))
		{
			switch(params.enemy.enemy_override.item.name)
			{
				case "hash_12f078ddc9b913c3":
				{
					if(isdefined(params.eattacker.var_4927d3d[#"hash_70dc77164c0c1851"]))
					{
						if(params.eattacker.var_4927d3d[#"hash_70dc77164c0c1851"].time > (gettime() - 2000) && params.eattacker.var_4927d3d[#"hash_70dc77164c0c1851"].on_cooldown === 0)
						{
							params.eattacker.var_4927d3d[#"hash_70dc77164c0c1851"].multikills++;
							params.eattacker contracts::increment_zm_contract(#"hash_a8b4dbd0271141f");
							params.eattacker.var_4927d3d[#"hash_70dc77164c0c1851"].time = gettime() + 2000;
							if(params.eattacker.var_4927d3d[#"hash_70dc77164c0c1851"].multikills === 3)
							{
								params.eattacker stats::function_622feb0d(#"nightingale", #"hash_7bf29fa438d54aad", 1);
								processscoreevent("nightengale_multikill_zm", params.eattacker, undefined, params.weapon);
								params.eattacker contracts::increment_zm_contract(#"hash_3de460c73d2f29e3");
							}
						}
						else if(params.eattacker.var_4927d3d[#"hash_70dc77164c0c1851"].time < gettime())
						{
							params.eattacker contracts::increment_zm_contract(#"hash_a8b4dbd0271141f");
							params.eattacker.var_4927d3d[#"hash_70dc77164c0c1851"] = {#on_cooldown:0, #multikills:1, #weapon:params.weapon, #time:gettime(), #player:params.eattacker};
						}
					}
					else
					{
						params.eattacker contracts::increment_zm_contract(#"hash_a8b4dbd0271141f");
						params.eattacker.var_4927d3d[#"hash_70dc77164c0c1851"] = {#on_cooldown:0, #multikills:1, #weapon:params.weapon, #time:gettime(), #player:params.eattacker};
					}
					break;
				}
			}
		}
	}
	if(zm_utility::is_player_valid(params.eattacker, 0, 0))
	{
		var_1c91bc3c = 0;
		if(is_true(params.enemy zm_utility::function_4562a3ef(params.enemy.damagelocation)) && (params.smeansofdeath === "MOD_PISTOL_BULLET" || params.smeansofdeath === "MOD_RIFLE_BULLET"))
		{
			var_1c91bc3c = 1;
		}
		if(params.enemy.var_958cf9c5 === 1 && zm_utility::is_player_valid(params.enemy.var_991315b5, 0, 0))
		{
			if(isdefined(params.eattacker.var_4927d3d[#"hash_85edf3a63bb488c"]))
			{
				if(params.eattacker.var_4927d3d[#"hash_85edf3a63bb488c"].time > (gettime() - 2000) && params.eattacker.var_4927d3d[#"hash_85edf3a63bb488c"].on_cooldown === 0)
				{
					params.eattacker.var_4927d3d[#"hash_85edf3a63bb488c"].multikills++;
					params.eattacker.var_4927d3d[#"hash_85edf3a63bb488c"].time = gettime() + 2000;
					if(params.eattacker.var_4927d3d[#"hash_85edf3a63bb488c"].multikills === 3)
					{
						processscoreevent("frost_blast_multikill_zm", params.eattacker, undefined, params.weapon);
						params.eattacker stats::function_622feb0d(#"hash_85edf3a63bb488c", #"hash_7bf29fa438d54aad", 1);
						params.eattacker contracts::increment_zm_contract(#"hash_4a72dbfac556f4ad");
						var_d4907104 = 1;
					}
				}
				else if(params.eattacker.var_4927d3d[#"hash_85edf3a63bb488c"].time < gettime())
				{
					params.eattacker.var_4927d3d[#"hash_85edf3a63bb488c"] = {#hash_e1ebf0a8:undefined, #oneshotmultikills:1, #hash_510ca9f9:undefined, #hash_1c91bc3c:undefined, #on_cooldown:0, #multikills:1, #weapon:params.weapon, #melee_time:gettime(), #hash_81be4996:gettime(), #time:gettime(), #player:params.eattacker};
				}
			}
			else
			{
				params.eattacker.var_4927d3d[#"hash_85edf3a63bb488c"] = {#hash_e1ebf0a8:undefined, #oneshotmultikills:1, #hash_510ca9f9:undefined, #hash_1c91bc3c:undefined, #on_cooldown:0, #multikills:1, #weapon:params.weapon, #melee_time:gettime(), #hash_81be4996:gettime(), #time:gettime(), #player:params.eattacker};
			}
		}
		if(isdefined(params.eattacker.var_4927d3d[params.eattacker getentitynumber()]))
		{
			if(params.eattacker.var_4927d3d[params.eattacker getentitynumber()].time > (gettime() - 2000) && params.eattacker.var_4927d3d[params.eattacker getentitynumber()].on_cooldown === 0)
			{
				if(is_true(var_1c91bc3c))
				{
					if(isdefined(params.eattacker.var_4927d3d[params.eattacker getentitynumber()].var_510ca9f9))
					{
						params.eattacker.var_4927d3d[params.eattacker getentitynumber()].var_510ca9f9++;
						if(params.eattacker.var_4927d3d[params.eattacker getentitynumber()].var_510ca9f9 === 5)
						{
							processscoreevent("crit_finisher_multikill_zm", params.eattacker, undefined, params.weapon);
							params.eattacker contracts::increment_zm_contract(#"hash_6c0f79b069d2ab27");
							params.eattacker.var_4927d3d[params.eattacker getentitynumber()].var_510ca9f9 = 0;
						}
					}
					else
					{
						params.eattacker.var_4927d3d[params.eattacker getentitynumber()].var_510ca9f9 = 1;
					}
				}
				if(params.weapon.statname === #"ray_gun")
				{
					params.eattacker.var_4927d3d[params.eattacker getentitynumber()].var_5524bc59++;
					if(params.eattacker.var_4927d3d[params.eattacker getentitynumber()].var_5524bc59 === 5)
					{
						function_644d867a(params.eattacker, gettime(), #"hash_18e3e5b441fb51b0");
					}
				}
				if(!params.eattacker zm_powerups::is_insta_kill_active() && !params.eattacker zm_powerups::function_a4e210c7())
				{
					params.eattacker.var_4927d3d[params.eattacker getentitynumber()].multikills++;
					params.eattacker.var_4927d3d[params.eattacker getentitynumber()].time = gettime() + 2000;
					switch(params.eattacker.var_4927d3d[params.eattacker getentitynumber()].multikills)
					{
						case 5:
						{
							processscoreevent("multikillstreak_5_zm", params.eattacker, undefined, params.weapon);
							params.eattacker notify(#"hash_2f07cdc4c8fbe9d5", {#scoreevent:"multikillstreak_5_zm"});
							break;
						}
						case 10:
						{
							processscoreevent("multikillstreak_10_zm", params.eattacker, undefined, params.weapon);
							params.eattacker notify(#"hash_2f07cdc4c8fbe9d5", {#scoreevent:"multikillstreak_10_zm"});
							break;
						}
						case 15:
						{
							processscoreevent("multikillstreak_15_zm", params.eattacker, undefined, params.weapon);
							params.eattacker notify(#"hash_2f07cdc4c8fbe9d5", {#scoreevent:"multikillstreak_15_zm"});
							break;
						}
						case 20:
						{
							processscoreevent("multikillstreak_20_zm", params.eattacker, undefined, params.weapon);
							params.eattacker notify(#"hash_2f07cdc4c8fbe9d5", {#scoreevent:"multikillstreak_20_zm"});
							break;
						}
						case 25:
						{
							processscoreevent("multikillstreak_25_zm", params.eattacker, undefined, params.weapon);
							params.eattacker zm_stats::increment_challenge_stat(#"hash_5a554472dd2b62ad");
							params.eattacker notify(#"hash_2f07cdc4c8fbe9d5", {#scoreevent:"multikillstreak_25_zm"});
							level thread popups::displayteammessagetoteam(#"hash_355d99b37cf5e6f4", params.eattacker, params.eattacker.team);
							break;
						}
					}
				}
				if(params.eattacker.var_9cd2c51d.var_158e75d4 === #"eq_stimshot" && isdefined(params.eattacker.var_9cd2c51d.var_63362b1e))
				{
					params.eattacker stats::function_622feb0d(#"eq_stimshot", #"hash_1bc3e0ea4bf67adf", 1);
					params.eattacker stats::function_6fb0b113(#"eq_stimshot", #"hash_7612343d459539e4");
				}
				if(params.eattacker.var_4927d3d[params.eattacker getentitynumber()].multikills === 3)
				{
					if(params.eattacker.var_9cd2c51d.var_158e75d4 === #"eq_stimshot" && isdefined(params.eattacker.var_9cd2c51d.var_63362b1e) && params.eattacker.var_9cd2c51d.var_63362b1e > (gettime() - 6500))
					{
						params.eattacker stats::function_622feb0d(#"eq_stimshot", #"hash_7bf29fa438d54aad", 1);
						processscoreevent("stim_shot_multikill_zm", params.eattacker, undefined, params.weapon);
						params.eattacker contracts::increment_zm_contract(#"hash_5edb2e1208dc3974");
						params.eattacker.var_4927d3d[params.eattacker getentitynumber()].var_52c02390 = 1;
					}
				}
				if(params.eattacker.var_4927d3d[params.eattacker getentitynumber()].multikills === 5)
				{
					if(isdefined(params.eattacker.var_9cd2c51d.var_232f5c31) && params.eattacker.var_9cd2c51d.var_232f5c31 > (gettime() - 6500))
					{
						params.eattacker stats::function_622feb0d(#"heal_aoe", #"hash_7bf29fa438d54aad", 1);
						processscoreevent("healing_aura_multikill_zm", params.eattacker, undefined, params.weapon);
						params.eattacker contracts::increment_zm_contract(#"hash_2e2aa09daaaff416");
					}
				}
			}
			else if(params.eattacker.var_4927d3d[params.eattacker getentitynumber()].time < gettime())
			{
				if(is_true(var_1c91bc3c))
				{
					var_4105b7a0 = 1;
				}
				else
				{
					var_4105b7a0 = 0;
				}
				params.eattacker.var_4927d3d[params.eattacker getentitynumber()] = {#on_cooldown:0, #hash_510ca9f9:var_4105b7a0, #multikills:1, #weapon:params.weapon, #time:gettime(), #player:params.eattacker};
				params.eattacker.var_4927d3d[params.eattacker getentitynumber()].var_52c02390 = undefined;
				params.eattacker.var_4927d3d[params.eattacker getentitynumber()].var_e5ae4603 = undefined;
				if(params.weapon.statname === #"ray_gun")
				{
					params.eattacker.var_4927d3d[params.eattacker getentitynumber()].var_5524bc59 = 1;
				}
				else
				{
					params.eattacker.var_4927d3d[params.eattacker getentitynumber()].var_5524bc59 = 0;
				}
			}
		}
		else
		{
			if(is_true(var_1c91bc3c))
			{
				var_4105b7a0 = 1;
			}
			else
			{
				var_4105b7a0 = 0;
			}
			params.eattacker.var_4927d3d[params.eattacker getentitynumber()] = {#on_cooldown:0, #hash_510ca9f9:var_4105b7a0, #multikills:1, #weapon:params.weapon, #time:gettime(), #player:params.eattacker};
			params.eattacker.var_4927d3d[params.eattacker getentitynumber()].var_52c02390 = undefined;
			params.eattacker.var_4927d3d[params.eattacker getentitynumber()].var_e5ae4603 = undefined;
			if(params.weapon.statname === #"ray_gun")
			{
				params.eattacker.var_4927d3d[params.eattacker getentitynumber()].var_5524bc59 = 1;
			}
			else
			{
				params.eattacker.var_4927d3d[params.eattacker getentitynumber()].var_5524bc59 = 0;
			}
		}
		if(isdefined(params.eattacker.var_4927d3d[params.weapon.name]))
		{
			if(params.smeansofdeath === "MOD_MELEE" && params.eattacker.var_4927d3d[params.weapon.name].melee_time > (gettime() - 2000) && params.eattacker.var_4927d3d[params.weapon.name].on_cooldown === 0)
			{
				params.eattacker.var_4927d3d[params.weapon.name].var_e1ebf0a8++;
				params.eattacker.var_4927d3d[params.weapon.name].melee_time = gettime() + 2000;
				if(params.eattacker.var_4927d3d[params.weapon.name].var_e1ebf0a8 >= 5)
				{
					processscoreevent("melee_weapon_multikill_zm", params.eattacker, undefined, params.weapon);
					params.eattacker stats::function_561716e6(params.weapon.name, #"hash_7bf29fa438d54aad", 1);
					params.eattacker zm_stats::increment_challenge_stat(#"hash_726e331558583e86");
					params.eattacker.var_4927d3d[params.weapon.name].melee_time = gettime();
					params.eattacker.var_4927d3d[params.weapon.name].var_e1ebf0a8 = 0;
				}
			}
			else if(params.eattacker.var_4927d3d[params.weapon.name].melee_time < gettime())
			{
				params.eattacker.var_4927d3d[params.weapon.name].melee_time = gettime();
				params.eattacker.var_4927d3d[params.weapon.name].var_e1ebf0a8 = 1;
			}
			if(!isdefined(params.eattacker.var_4927d3d[params.weapon.name].var_8935d078))
			{
				params.eattacker.var_4927d3d[params.weapon.name].var_8935d078 = gettime();
			}
			if(!isdefined(params.eattacker.var_4927d3d[params.weapon.name].var_541b7be6))
			{
				params.eattacker.var_4927d3d[params.weapon.name].var_541b7be6 = 0;
			}
			params.eattacker.var_4927d3d[params.weapon.name].var_541b7be6++;
			if(params.eattacker.var_4927d3d[params.weapon.name].var_8935d078 > gettime() - 2000)
			{
				if(params.eattacker.var_4927d3d[params.weapon.name].var_541b7be6 >= 2)
				{
					params.eattacker.var_4927d3d[params.weapon.name].var_541b7be6 = 0;
					params.eattacker.var_4927d3d[params.weapon.name].var_8935d078 = undefined;
					params.eattacker zm_challenges::function_d6b32ad3(params.weapon, #"rapidkills", 1);
				}
				else
				{
					params.eattacker.var_4927d3d[params.weapon.name].var_8935d078 = gettime();
				}
			}
			else
			{
				params.eattacker.var_4927d3d[params.weapon.name].var_541b7be6 = 1;
				params.eattacker.var_4927d3d[params.weapon.name].var_8935d078 = gettime();
			}
			if(params.eattacker.var_4927d3d[params.weapon.name].var_81be4996 > (gettime() - 100) && params.eattacker.var_4927d3d[params.weapon.name].on_cooldown === 0)
			{
				params.eattacker.var_4927d3d[params.weapon.name].oneshotmultikills++;
				params.eattacker.var_4927d3d[params.weapon.name].var_81be4996 = gettime() + 100;
				if(params.eattacker.var_4927d3d[params.weapon.name].oneshotmultikills === 5 && isdefined(params.weapon.statname))
				{
					switch(params.weapon.statname)
					{
						case "special_grenadelauncher_t9":
						case "launcher_freefire_t9":
						case "launcher_standard_t9":
						{
							processscoreevent("oneshot_explosive_multikill_zm", params.eattacker, undefined, params.weapon);
							params.eattacker stats::function_561716e6(params.weapon.statname, #"hash_7bf29fa438d54aad", 1);
							params.eattacker zm_challenges::function_d6b32ad3(params.weapon, #"hash_72467b6043fb9ef7", 1);
							params.eattacker.var_4927d3d[params.weapon.name].var_81be4996 = gettime();
							break;
						}
						default:
						{
							break;
						}
					}
				}
				else if(params.eattacker.var_4927d3d[params.weapon.name].oneshotmultikills === 3 && (params.weapon.statname !== #"launcher_freefire_t9" || params.weapon.statname !== #"special_grenadelauncher_t9" || params.weapon.statname !== #"launcher_standard_t9"))
				{
					if(isweapon(params.weapon) && (!zm_loadout::is_lethal_grenade(params.weapon) && !zm_loadout::is_tactical_grenade(params.weapon) && !zm_loadout::is_placeable_mine(params.weapon) && !zm_loadout::is_melee_weapon(params.weapon)))
					{
						processscoreevent("oneshot_multikill_zm", params.eattacker, undefined, params.weapon);
						params.eattacker.var_4927d3d[params.weapon.name].var_81be4996 = gettime();
					}
				}
			}
			else if(params.eattacker.var_4927d3d[params.weapon.name].var_81be4996 < gettime() - 100)
			{
				params.eattacker.var_4927d3d[params.weapon.name].var_81be4996 = gettime();
				params.eattacker.var_4927d3d[params.weapon.name].oneshotmultikills = 1;
			}
			if(params.eattacker.var_4927d3d[params.weapon.name].time > (gettime() - 2000) && params.eattacker.var_4927d3d[params.weapon.name].on_cooldown === 0)
			{
				if(isdefined(params.weapon.name))
				{
					switch(params.weapon.name)
					{
						case "hash_85edf3a63bb488c":
						case "frost_blast_1":
						case "frost_blast_3":
						case "frost_blast_2":
						case "frost_blast_5":
						case "frost_blast_4":
						{
							if(isdefined(params.eattacker.var_4927d3d[#"hash_85edf3a63bb488c"]))
							{
								if(params.eattacker.var_4927d3d[#"hash_85edf3a63bb488c"].time > (gettime() - 2000) && params.eattacker.var_4927d3d[#"hash_85edf3a63bb488c"].on_cooldown === 0)
								{
									params.eattacker.var_4927d3d[#"hash_85edf3a63bb488c"].multikills++;
									params.eattacker.var_4927d3d[#"hash_85edf3a63bb488c"].time = gettime() + 2000;
									if(params.eattacker.var_4927d3d[#"hash_85edf3a63bb488c"].multikills === 3)
									{
										params.eattacker stats::function_622feb0d(#"hash_85edf3a63bb488c", #"hash_7bf29fa438d54aad", 1);
										processscoreevent("frost_blast_multikill_zm", params.eattacker, undefined, params.weapon);
										params.eattacker contracts::increment_zm_contract(#"hash_4a72dbfac556f4ad");
										var_d4907104 = 1;
									}
								}
								else if(params.eattacker.var_4927d3d[#"hash_85edf3a63bb488c"].time < gettime())
								{
									params.eattacker.var_4927d3d[#"hash_85edf3a63bb488c"] = {#hash_e1ebf0a8:undefined, #oneshotmultikills:1, #hash_510ca9f9:undefined, #hash_1c91bc3c:undefined, #on_cooldown:0, #multikills:1, #weapon:params.weapon, #melee_time:gettime(), #hash_81be4996:gettime(), #time:gettime(), #player:params.eattacker};
								}
							}
							else
							{
								params.eattacker.var_4927d3d[#"hash_85edf3a63bb488c"] = {#hash_e1ebf0a8:undefined, #oneshotmultikills:1, #hash_510ca9f9:undefined, #hash_1c91bc3c:undefined, #on_cooldown:0, #multikills:1, #weapon:params.weapon, #melee_time:gettime(), #hash_81be4996:gettime(), #time:gettime(), #player:params.eattacker};
							}
							break;
						}
						default:
						{
							params.eattacker.var_4927d3d[params.weapon.name].multikills++;
							params.eattacker.var_4927d3d[params.weapon.name].time = gettime() + 2000;
							break;
						}
					}
				}
				else
				{
					params.eattacker.var_4927d3d[params.weapon.name].multikills++;
					params.eattacker.var_4927d3d[params.weapon.name].time = gettime() + 2000;
				}
				if(params.eattacker.var_4927d3d[params.weapon.name].multikills === 10)
				{
					params.eattacker zm_challenges::function_d6b32ad3(params.weapon, #"multikill", 1);
				}
				if(var_1c91bc3c === 1)
				{
					if(params.eattacker.var_4927d3d[params.weapon.name].var_1c91bc3c === 1)
					{
						params.eattacker.var_4927d3d[params.weapon.name].var_510ca9f9++;
						if(params.eattacker.var_4927d3d[params.weapon.name].var_510ca9f9 === 3)
						{
							params.eattacker zm_challenges::function_d6b32ad3(params.weapon, #"hash_5870df5ed04a8f11", 1);
							params.eattacker.var_4927d3d[params.weapon.name].var_510ca9f9 = 0;
						}
					}
					else
					{
						params.eattacker.var_4927d3d[params.weapon.name].var_510ca9f9 = 1;
					}
				}
				if(isdefined(params.weapon.name))
				{
					switch(params.weapon.name)
					{
						case "energy_mine":
						case "energy_mine_4":
						case "hash_4ac3fea4add2a2c9":
						case "energy_mine_2":
						case "energy_mine_3":
						case "energy_mine_1":
						{
							if(params.eattacker.var_4927d3d[params.weapon.name].multikills === 3)
							{
								params.eattacker stats::function_622feb0d(#"energy_mine", #"hash_7bf29fa438d54aad", 1);
								processscoreevent("energy_mine_multikill_zm", params.eattacker, undefined, params.weapon);
								params.eattacker contracts::increment_zm_contract(#"hash_291784e921549410");
								var_da42dc1e = 1;
							}
							else if(params.eattacker.var_4927d3d[params.weapon.name].multikills === 15)
							{
								params.eattacker zm_stats::increment_challenge_stat(#"hash_2bcf4fba492d765a");
							}
							break;
						}
					}
				}
				if(isdefined(params.weapon.name) && killstreaks::is_killstreak_weapon(params.weapon) && params.enemy.damagemod !== "MOD_MELEE")
				{
					switch(params.weapon.name)
					{
						case "gun_ultimate_turret":
						{
							if(params.eattacker.var_4927d3d[params.weapon.name].multikills === 5)
							{
								params.eattacker stats::function_8fb23f94(#"ultimate_turret", #"hash_7bf29fa438d54aad", 1);
								processscoreevent("sentry_turret_multikill_zm", params.eattacker, undefined, params.weapon);
								params.eattacker zm_stats::increment_challenge_stat(#"hash_30f04720fb250afb");
								var_da42dc1e = 1;
							}
							break;
						}
						case "sig_lmg":
						{
							if(params.eattacker.var_4927d3d[params.weapon.name].multikills === 3)
							{
								processscoreevent("death_machine_multikill_zm", params.eattacker, undefined, params.weapon);
								params.eattacker stats::function_8fb23f94(#"sig_lmg", #"hash_7bf29fa438d54aad", 1);
								var_da42dc1e = 1;
							}
							break;
						}
						case "hero_flamethrower":
						{
							if(params.eattacker.var_4927d3d[params.weapon.name].multikills === 3)
							{
								processscoreevent("flamethrower_multikill_zm", params.eattacker, undefined, params.weapon);
								params.eattacker stats::function_8fb23f94(#"hero_flamethrower", #"hash_7bf29fa438d54aad", 1);
								var_da42dc1e = 1;
							}
							break;
						}
						case "hash_86464477ee762aa":
						case "remote_missile_bomblet":
						{
							if(params.eattacker.var_4927d3d[params.weapon.name].multikills === 5)
							{
								processscoreevent("cruise_missile_multikill_zm", params.eattacker, undefined, params.weapon);
								params.eattacker contracts::increment_zm_contract(#"hash_1a6125474b0d46e1");
								params.eattacker stats::function_8fb23f94(#"hash_3de3d523512f7cbc", #"hash_7bf29fa438d54aad", 1);
								var_da42dc1e = 1;
							}
							break;
						}
						case "hero_pineapplegun":
						{
							if(params.eattacker.var_4927d3d[params.weapon.name].multikills === 3)
							{
								processscoreevent("grenade_launcher_multikill_zm", params.eattacker, undefined, params.weapon);
								params.eattacker contracts::increment_zm_contract(#"hash_77c4f06d1c02d2d7");
								params.eattacker stats::function_8fb23f94(#"hero_pineapplegun", #"hash_7bf29fa438d54aad", 1);
								var_da42dc1e = 1;
							}
							break;
						}
						case "sig_bow_flame":
						{
							if(params.eattacker.var_4927d3d[params.weapon.name].multikills === 3)
							{
								processscoreevent("combat_bow_multikill_zm", params.eattacker, undefined, params.weapon);
								params.eattacker contracts::increment_zm_contract(#"hash_1bdaa70759b87110");
								params.eattacker stats::function_8fb23f94(#"sig_bow_flame", #"hash_7bf29fa438d54aad", 1);
								var_da42dc1e = 1;
							}
							break;
						}
						case "napalm_strike":
						{
							if(params.eattacker.var_4927d3d[params.weapon.name].multikills === 3)
							{
								processscoreevent("sentry_turret_multikill_zm", params.eattacker, undefined, params.weapon);
								params.eattacker stats::function_8fb23f94(#"napalm_strike", #"hash_7bf29fa438d54aad", 1);
								var_da42dc1e = 1;
							}
							break;
						}
						case "hash_1734871fef9c0549":
						{
							if(params.eattacker.var_4927d3d[params.weapon.name].multikills === 5)
							{
								processscoreevent("chopper_gunner_multikill_zm", params.eattacker, undefined, params.weapon);
								params.eattacker stats::function_8fb23f94(#"chopper_gunner", #"hash_7bf29fa438d54aad", 1);
								var_da42dc1e = 1;
							}
							break;
						}
					}
				}
				if(isdefined(params.smeansofdeath) && (params.smeansofdeath == "MOD_RIFLE_BULLET" || params.smeansofdeath == "MOD_PISTOL_BULLET"))
				{
					if(params.eattacker.var_4927d3d[params.weapon.name].multikills === 5 && isdefined(params.weapon.name))
					{
						params.eattacker stats::function_561716e6(params.weapon.name, #"hash_7bf29fa438d54aad", 1);
					}
				}
				if(params.eattacker.var_4927d3d[params.weapon.name].multikills === 3 && isdefined(params.weapon.name))
				{
					switch(params.weapon.name)
					{
						case "eq_sticky_grenade":
						{
							params.eattacker zm_stats::increment_challenge_stat(#"hash_60594d8f8bc8764b");
							processscoreevent("semtex_multikill_zm", params.eattacker, undefined, params.weapon);
							params.eattacker stats::function_622feb0d(#"eq_sticky_grenade", #"hash_7bf29fa438d54aad", 1);
							params.eattacker contracts::increment_zm_contract(#"hash_2a3b30f3663d00ed");
							var_da42dc1e = 1;
							break;
						}
						case "satchel_charge":
						{
							params.eattacker zm_stats::increment_challenge_stat(#"hash_60594d8f8bc8764b");
							processscoreevent("satchel_charge_multikill_zm", params.eattacker, undefined, params.weapon);
							params.eattacker stats::function_622feb0d(#"satchel_charge", #"hash_7bf29fa438d54aad", 1);
							params.eattacker contracts::increment_zm_contract(#"hash_4382dd5d9e99a17a");
							var_da42dc1e = 1;
							break;
						}
						case "frag_grenade":
						{
							params.eattacker zm_stats::increment_challenge_stat(#"hash_60594d8f8bc8764b");
							processscoreevent("frag_multikill_zm", params.eattacker, undefined, params.weapon);
							params.eattacker stats::function_622feb0d(#"eq_frag_grenade", #"hash_7bf29fa438d54aad", 1);
							params.eattacker contracts::increment_zm_contract(#"hash_52f740ced65f6ee1");
							var_da42dc1e = 1;
							break;
						}
						case "cymbal_monkey":
						{
							params.eattacker zm_stats::increment_challenge_stat(#"hash_60594d8f8bc8764b");
							processscoreevent("monkey_bomb_multikill_zm", params.eattacker, undefined, params.weapon);
							params.eattacker stats::function_622feb0d(#"cymbal_monkey", #"hash_7bf29fa438d54aad", 1);
							params.eattacker contracts::increment_zm_contract(#"hash_331f341976ba7749");
							var_da42dc1e = 1;
							break;
						}
						case "molotov_fire":
						{
							params.eattacker zm_stats::increment_challenge_stat(#"hash_60594d8f8bc8764b");
							params.eattacker contracts::increment_zm_contract(#"hash_57299228edd7d8ad");
							params.eattacker stats::function_622feb0d(#"eq_molotov", #"hash_7bf29fa438d54aad", 1);
							processscoreevent("molotov_multikill_zm", params.eattacker, undefined, params.weapon);
							var_da42dc1e = 1;
							break;
						}
						case "eq_slow_grenade":
						{
							params.eattacker zm_stats::increment_challenge_stat(#"hash_60594d8f8bc8764b");
							params.eattacker contracts::increment_zm_contract(#"hash_3b1aea9829803ac1");
							params.eattacker stats::function_622feb0d(#"eq_slow_grenade", #"hash_7bf29fa438d54aad", 1);
							processscoreevent("concussion_grenade_multikill_zm", params.eattacker, undefined, params.weapon);
							var_da42dc1e = 1;
							break;
						}
						case "hatchet":
						{
							params.eattacker zm_stats::increment_challenge_stat(#"hash_60594d8f8bc8764b");
							params.eattacker stats::function_622feb0d(#"hatchet", #"hash_7bf29fa438d54aad", 1);
							processscoreevent("combat_axe_multikill_zm", params.eattacker, undefined, params.weapon);
							var_da42dc1e = 1;
							break;
						}
						case "hash_3fa91d1674123e09":
						case "hash_5dd5741f21fd680d":
						case "hash_655d944e437c3d5b":
						case "hash_6e0b27b854e591a3":
						case "hash_72796957033e2e4a":
						{
							processscoreevent("ieu_multikill_zm", params.eattacker, undefined, params.weapon);
							var_da42dc1e = 1;
							break;
						}
					}
				}
				if(is_true(var_da42dc1e))
				{
					params.eattacker.var_4927d3d[params.weapon.name].player = params.eattacker;
					params.eattacker.var_4927d3d[params.weapon.name].time = gettime();
					params.eattacker.var_4927d3d[params.weapon.name].weapon = params.weapon;
				}
				else if(is_true(var_d4907104))
				{
					params.eattacker.var_4927d3d[params.weapon.name].player = params.eattacker;
					params.eattacker.var_4927d3d[params.weapon.name].time = gettime();
					params.eattacker.var_4927d3d[params.weapon.name].weapon = params.weapon;
					params.eattacker.var_4927d3d[#"hash_85edf3a63bb488c"].player = params.eattacker;
					params.eattacker.var_4927d3d[#"hash_85edf3a63bb488c"].time = gettime();
					params.eattacker.var_4927d3d[#"hash_85edf3a63bb488c"].weapon = params.weapon;
				}
			}
			else if(params.eattacker.var_4927d3d[params.weapon.name].time < gettime())
			{
				if(is_true(var_1c91bc3c))
				{
					var_4105b7a0 = 1;
				}
				else
				{
					var_4105b7a0 = 0;
				}
				if(params.smeansofdeath === "MOD_MELEE")
				{
					var_b8275b80 = 1;
				}
				else
				{
					var_b8275b80 = 0;
				}
				params.eattacker.var_4927d3d[params.weapon.name] = {#hash_e1ebf0a8:var_b8275b80, #oneshotmultikills:1, #hash_510ca9f9:var_4105b7a0, #hash_1c91bc3c:var_1c91bc3c, #on_cooldown:0, #multikills:1, #weapon:params.weapon, #melee_time:gettime(), #hash_81be4996:gettime(), #time:gettime(), #player:params.eattacker};
			}
		}
		else
		{
			if(is_true(var_1c91bc3c))
			{
				var_4105b7a0 = 1;
			}
			else
			{
				var_4105b7a0 = 0;
			}
			if(params.smeansofdeath === "MOD_MELEE")
			{
				var_b8275b80 = 1;
			}
			else
			{
				var_b8275b80 = 0;
			}
			params.eattacker.var_4927d3d[params.weapon.name] = {#hash_e1ebf0a8:var_b8275b80, #oneshotmultikills:1, #hash_510ca9f9:var_4105b7a0, #hash_1c91bc3c:var_1c91bc3c, #on_cooldown:0, #multikills:1, #weapon:params.weapon, #melee_time:gettime(), #hash_81be4996:gettime(), #time:gettime(), #player:params.eattacker};
		}
	}
	if(isdefined(params.eattacker.var_d93ab65) && params.eattacker.var_d93ab65.size > 0)
	{
		if(isdefined(params.eattacker.var_4927d3d[#"hash_7ed9a65979594954"]))
		{
			if(params.eattacker.var_4927d3d[#"hash_7ed9a65979594954"].time > (gettime() - 2000) && params.eattacker.var_4927d3d[#"hash_7ed9a65979594954"].on_cooldown === 0)
			{
				arrayremovevalue(params.eattacker.var_d93ab65, undefined);
				foreach(ring_of_fire in params.eattacker.var_d93ab65)
				{
					if(params.smeansofdeath === "MOD_MELEE" && zm_utility::is_player_valid(params.eattacker))
					{
						params.eattacker zm_challenges::function_d6b32ad3(params.weapon, #"hash_16ef903a11cc4173", 1);
					}
					if(zm_utility::is_player_valid(ring_of_fire.owner, 0, 0))
					{
						if(ring_of_fire.owner === params.eattacker)
						{
							if(!isdefined(params.eattacker.var_4927d3d[#"hash_7ed9a65979594954"].multikills))
							{
								params.eattacker.var_4927d3d[#"hash_7ed9a65979594954"].multikills = 0;
							}
							params.eattacker.var_4927d3d[#"hash_7ed9a65979594954"].multikills++;
							params.eattacker.var_4927d3d[#"hash_7ed9a65979594954"].time = gettime() + 2000;
							if(params.eattacker.var_4927d3d[#"hash_7ed9a65979594954"].multikills >= 10 && !isdefined(params.eattacker.var_4927d3d[#"hash_7ed9a65979594954"].var_d7f6715a) && isdefined(ring_of_fire) && !is_true(ring_of_fire.var_6ef480ca))
							{
								if(isdefined(ring_of_fire))
								{
									ring_of_fire.var_6ef480ca = 1;
								}
								params.eattacker zm_stats::increment_challenge_stat(#"hash_3ada34911786e667");
								params.eattacker stats::function_dad108fa(#"hash_3a4cc9109fa72702", 1);
								params.eattacker stats::function_622feb0d(#"ring_of_fire", #"hash_7bf29fa438d54aad", 1);
								processscoreevent("ring_of_fire_multikill_zm", params.eattacker, undefined, params.weapon);
								params.eattacker contracts::increment_zm_contract(#"hash_aac5702f5f9c94d");
								params.eattacker.var_4927d3d[#"hash_7ed9a65979594954"] = {#hash_d7f6715a:ring_of_fire, #multikills:0, #weapon:params.weapon, #time:gettime() + 2000, #player:params.eattacker};
							}
						}
					}
				}
			}
			else if(params.eattacker.var_4927d3d[#"hash_7ed9a65979594954"].time < gettime())
			{
				params.eattacker.var_4927d3d[#"hash_7ed9a65979594954"] = {#hash_d7f6715a:params.eattacker.var_4927d3d[#"hash_7ed9a65979594954"].var_d7f6715a, #on_cooldown:0, #multikills:1, #weapon:params.weapon, #time:gettime(), #player:params.eattacker};
			}
		}
		else
		{
			params.eattacker.var_4927d3d[#"hash_7ed9a65979594954"] = {#hash_d7f6715a:params.eattacker.var_4927d3d[#"hash_7ed9a65979594954"].var_d7f6715a, #on_cooldown:0, #multikills:1, #weapon:params.weapon, #time:gettime(), #player:params.eattacker};
		}
	}
	else if(isdefined(params.eattacker.var_4927d3d[#"hash_7ed9a65979594954"]))
	{
		params.eattacker.var_4927d3d[#"hash_7ed9a65979594954"] = undefined;
	}
	var_5f6e2918 = params.enemy.var_95d94ac4;
	if(!isdefined(var_5f6e2918))
	{
		var_5f6e2918 = 5;
	}
	if(params.enemy ai::is_stunned() && (isdefined(params.enemy.var_31cadcc9[#"eq_slow_grenade"]) && isdefined(params.enemy.var_31cadcc9[#"eq_slow_grenade"].time) && params.enemy.var_31cadcc9[#"eq_slow_grenade"].time > (gettime() - (var_5f6e2918 * 1000))))
	{
		if(params.enemy.damagemod === "MOD_MELEE" && zm_utility::is_player_valid(params.eattacker, 0, 0))
		{
			params.eattacker zm_challenges::function_d6b32ad3(params.weapon, #"hash_1f451bc4d664e2ad", 1);
		}
		params.eattacker stats::function_6fb0b113(#"eq_slow_grenade", #"hash_6b0fbad1bb3b10f1");
		if(params.enemy.var_31cadcc9[#"eq_slow_grenade"].player === params.eattacker)
		{
			params.eattacker stats::function_6fb0b113(#"eq_slow_grenade", #"kills");
			params.eattacker contracts::increment_zm_contract(#"hash_4936408b808baff1");
		}
		else if(zm_utility::is_player_valid(params.enemy.var_31cadcc9[#"eq_slow_grenade"].player))
		{
			params.enemy.var_31cadcc9[#"eq_slow_grenade"].player stats::function_6fb0b113(#"eq_slow_grenade", #"assists");
		}
		if(params.enemy.var_6f84b820 === #"elite")
		{
			processscoreevent("concussion_grenade_killingblow_elite_zm", params.eattacker, params.enemy, undefined, undefined, params);
		}
		else
		{
			if(params.enemy.var_6f84b820 === #"special")
			{
				processscoreevent("concussion_grenade_killingblow_special_zm", params.eattacker, params.enemy, undefined, undefined, params);
			}
			else
			{
				processscoreevent("concussion_grenade_killingblow_zm", params.eattacker, params.enemy, undefined, undefined, params);
			}
		}
		if(params.enemy.var_31cadcc9[#"eq_slow_grenade"].player === params.eattacker)
		{
			if(isdefined(params.eattacker.var_4927d3d[#"hash_27d3241e5c182d42"]))
			{
				if(params.eattacker.var_4927d3d[#"hash_27d3241e5c182d42"].time > (gettime() - 2000) && params.eattacker.var_4927d3d[#"hash_27d3241e5c182d42"].on_cooldown === 0)
				{
					params.eattacker.var_4927d3d[#"hash_27d3241e5c182d42"].var_ae122a53++;
					params.eattacker.var_4927d3d[#"hash_27d3241e5c182d42"].time = gettime() + 2000;
					if(params.eattacker.var_4927d3d[#"hash_27d3241e5c182d42"].var_ae122a53 >= 3)
					{
						params.eattacker zm_stats::increment_challenge_stat(#"hash_2ad38b3cd161c0e8");
						processscoreevent("concussion_grenade_multikill_zm", params.eattacker, undefined, params.weapon);
						params.eattacker stats::function_622feb0d(#"eq_slow_grenade", #"hash_7bf29fa438d54aad", 1);
						params.eattacker contracts::increment_zm_contract(#"hash_3b1aea9829803ac1");
						params.eattacker.var_4927d3d[#"hash_27d3241e5c182d42"] = {#hash_ae122a53:0, #weapon:params.weapon, #time:gettime() + 2000, #player:params.eattacker};
					}
				}
				else if(params.eattacker.var_4927d3d[#"hash_27d3241e5c182d42"].time < gettime())
				{
					params.eattacker.var_4927d3d[#"hash_27d3241e5c182d42"] = {#on_cooldown:0, #hash_ae122a53:1, #weapon:params.weapon, #time:gettime() + 2000, #player:params.eattacker};
				}
			}
			else
			{
				params.eattacker.var_4927d3d[#"hash_27d3241e5c182d42"] = {#on_cooldown:0, #hash_ae122a53:1, #weapon:params.weapon, #time:gettime() + 2000, #player:params.eattacker};
			}
		}
	}
	if(isdefined(params.enemy.a_n_slowdown_timeouts[#"hash_10d83afaeb265fde"]) && params.enemy.a_n_slowdown_timeouts[#"hash_10d83afaeb265fde"] > 0)
	{
		params.eattacker zm_stats::increment_challenge_stat(#"hash_1fb0f883567707e2");
	}
	if(params.enemy.var_6f84b820 === #"elite")
	{
		if(isdefined(params.enemy.var_e293f8ac))
		{
			function_1eaaceab(params.enemy.var_e293f8ac);
			if(params.enemy.var_e293f8ac.size === 0)
			{
				params.eattacker zm_stats::increment_challenge_stat(#"hash_45814ac55657fc62");
			}
		}
		else
		{
			params.eattacker zm_stats::increment_challenge_stat(#"hash_45814ac55657fc62");
		}
	}
}

/*
	Name: get_distance_for_weapon
	Namespace: scoreevents
	Checksum: 0x956D2B19
	Offset: 0xB248
	Size: 0x21E
	Parameters: 2
	Flags: Linked
*/
function get_distance_for_weapon(weapon, weaponclass)
{
	if(!isdefined(weaponclass))
	{
		weaponclass = util::getweaponclass(weapon);
	}
	distance = 0;
	if(!isdefined(weaponclass))
	{
		return 0;
	}
	if(weapon.rootweapon.name == "pistol_shotgun")
	{
		weaponclass = "weapon_cqb";
	}
	switch(weaponclass)
	{
		case "weapon_smg":
		{
			distance = 1960000;
			break;
		}
		case "weapon_assault":
		{
			distance = 2560000;
			break;
		}
		case "weapon_tactical":
		{
			distance = 2560000;
			break;
		}
		case "weapon_lmg":
		{
			distance = 2560000;
			break;
		}
		case "weapon_sniper":
		{
			distance = 4000000;
			break;
		}
		case "weapon_pistol":
		{
			distance = 1000000;
			break;
		}
		case "weapon_cqb":
		{
			distance = 302500;
			break;
		}
		case "weapon_special":
		{
			baseweapon = weapon.rootweapon;
			if(weapon.isballisticknife || baseweapon == level.weaponspecialcrossbow)
			{
				distance = 2250000;
			}
			break;
		}
		case "weapon_grenade":
		{
			if(weapon.rootweapon.name == "hatchet")
			{
				distance = 2250000;
			}
			break;
		}
		default:
		{
			distance = 0;
			break;
		}
	}
	return distance;
}

/*
	Name: function_8fb658e2
	Namespace: scoreevents
	Checksum: 0xE27D5A03
	Offset: 0xB470
	Size: 0x22C
	Parameters: 1
	Flags: Linked
*/
function function_8fb658e2(params)
{
	if(is_true(params.einflictor.aat_turned) || is_true(params.enemy.aat_turned) || is_true(params.enemy.var_f42aed2a) || is_true(params.enemy.var_b70158b5) || is_true(params.enemy.var_865b1595) || params.enemy.archetype === #"zombie_dog")
	{
		return;
	}
	if(zm_utility::is_headshot(params.weapon, params.shitloc, params.smeansofdeath) && (isdefined(params.enemy.archetype) && params.enemy.archetype !== #"zombie_dog") && function_39571ae(params.eattacker, params.enemy))
	{
		statname = #"hash_25f082a4f62ed553";
	}
	else
	{
		statname = #"hash_3e68a28d3c2e0479";
	}
	var_42648a02 = level.var_42648a02[statname];
	if(isdefined(var_42648a02) && var_42648a02[1] > randomfloatrange(0, 1))
	{
		function_31eb1b07(params.eattacker, statname, var_42648a02[0], var_42648a02[3]);
	}
}

/*
	Name: function_39571ae
	Namespace: scoreevents
	Checksum: 0x51EF35A8
	Offset: 0xB6A8
	Size: 0x9A
	Parameters: 2
	Flags: Linked, Private
*/
function private function_39571ae(player, enemy)
{
	if(!isdefined(player) || !isdefined(enemy))
	{
		return false;
	}
	n_dist = distancesquared(player.origin, enemy.origin);
	if(n_dist >= 122500 && n_dist <= 1440000)
	{
		return true;
	}
	return false;
}

