#using scripts\mp_common\util.gsc;
#using scripts\mp_common\challenges.gsc;
#using scripts\mp_common\gametypes\globallogic.gsc;
#using scripts\mp_common\gametypes\match.gsc;
#using scripts\core_common\status_effects\status_effect_util.gsc;
#using scripts\core_common\globallogic\globallogic_score.gsc;
#using scripts\weapons\weapon_utils.gsc;
#using scripts\abilities\ability_player.gsc;
#using scripts\core_common\player\player_loadout.gsc;
#using script_7f6cd71c43c45c57;
#using scripts\core_common\weapons_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using script_7a8059ca02b7b09e;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\killstreaks\killstreaks_util.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\core_common\contracts_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\activecamo_shared.gsc;

#namespace scoreevents;

/*
	Name: function_67a41f0d
	Namespace: scoreevents
	Checksum: 0xBF5F0708
	Offset: 0x9B0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_67a41f0d()
{
	level notify(1901147560);
}

/*
	Name: __init__system__
	Namespace: scoreevents
	Checksum: 0x14AAE964
	Offset: 0x9D0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"scoreevents", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: scoreevents
	Checksum: 0x9FBDF87E
	Offset: 0xA18
	Size: 0x44
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	callback::on_start_gametype(&init);
	callback::on_spawned(&on_player_spawned);
}

/*
	Name: init
	Namespace: scoreevents
	Checksum: 0xC59FBA54
	Offset: 0xA68
	Size: 0xFA8
	Parameters: 0
	Flags: Linked
*/
function init()
{
	level.scoreeventgameendcallback = &ongameend;
	registerscoreeventcallback("playerKilled", &scoreeventplayerkill);
	registerscoreeventcallback("vehicleKilled", &function_b8495e95);
	status_effect::function_7505baeb(&function_4013aee1);
	callback::add_callback(#"done_healing", &function_9c3085c8);
	callback::add_callback(#"hash_4b807b1167b4a811", &function_abe2675d);
	level.var_e7152385 = &function_e7152385;
	level.var_42648a02 = [#"killstreak_30":[4:1, 3:1000, 2:"SE_Killstreak30", 1:1, 0:4500], #"hash_7f0ab22d09e3b781":[4:1, 3:1000, 2:"SE_Killstreak25", 1:1, 0:4400], #"killstreak_20":[4:1, 3:1000, 2:"SE_Killstreak20", 1:1, 0:4300], #"killstreak_15":[4:2, 3:1000, 2:"SE_Killstreak15", 1:1, 0:4200], #"killstreak_10":[4:2, 3:1000, 2:"SE_Killstreak10", 1:1, 0:4100], #"killstreak_5":[4:2, 3:1000, 2:"SE_Killstreak5", 1:0.4, 0:4000], #"hash_32f458fea519390d":[4:1, 3:1000, 2:"SE_Multikill6", 1:0.4, 0:3300], #"hash_3d37ae7181d5bdd0":[4:1, 3:2000, 2:"SE_UninterruptedObitFeed", 1:0.25, 0:3250], #"hash_3aede7f7a9880107":[4:2, 3:3000, 2:"SE_Multikill4", 1:0.4, 0:3200], #"hash_57097aa234f1ffc1":[4:undefined, 3:3000, 2:"SE_SwatGrenadeMultikill", 1:0.25, 0:3180], #"hash_293351f0ab09e08e":[4:undefined, 3:3000, 2:"SE_ListeningDeviceMultikill", 1:0.25, 0:3180], #"hash_5b873cde9fa1ddea":[4:undefined, 3:3000, 2:"SE_JammerMultikill", 1:0.25, 0:3180], #"hash_33961e0d8b3ef619":[4:undefined, 3:3000, 2:"SE_GasTrapMultikill", 1:0.25, 0:3180], #"hash_5dd8ac39b297ddbd":[4:undefined, 3:3000, 2:"SE_ConcussionGrenadeMultikill", 1:0.25, 0:3180], #"clear_2_attackers":[4:undefined, 3:3000, 2:"SE_Clear2Attackers", 1:0.4, 0:3150], #"hash_77c751d52184d6f":[4:undefined, 3:1000, 2:"SE_SemtexMultikill", 1:0.25, 0:3150], #"hash_36c50241f5969af3":[4:undefined, 3:1000, 2:"SE_SatchelChargeMultikill", 1:0.25, 0:3150], #"hash_3b399c451696641a":[4:undefined, 3:3000, 2:"SE_NightingaleMultikill", 1:0.25, 0:3150], #"hash_77327d63abe964a5":[4:undefined, 3:1000, 2:"SE_MolotovCocktailMultikill", 1:0.25, 0:3150], #"hash_2befcf4e795c58d7":[4:undefined, 3:1000, 2:"SE_LandMineChargeMultikill", 1:0.25, 0:3150], #"hash_2043687e5999396a":[4:undefined, 3:1000, 2:"SE_FragMultikill", 1:0.25, 0:3150], #"hash_4b2287fbdfc248b1":[4:undefined, 3:3000, 2:"SE_Multikill2", 1:0.4, 0:3100], #"point_blank_kill":[4:undefined, 3:500, 2:"SE_PointBlankKill", 1:0.4, 0:3050], #"kill_enemy_injuring_teammate":[4:undefined, 3:2000, 2:"SE_KillEnemyInjuringTeammate", 1:0.4, 0:3000], #"hash_e0ebdc669e8fd7":[4:undefined, 3:500, 2:"SE_VehicleKill", 1:0.25, 0:2000], #"hash_4b60cfbd176b472":[4:undefined, 3:1500, 2:"SE_WarMachineShutdown", 1:0.25, 0:2000], #"hash_6342f42867030970":[4:undefined, 3:1500, 2:"SE_SigLmgShutdown", 1:0.25, 0:2000], #"hash_19163019019a1709":[4:undefined, 3:500, 2:"SE_SemtexStick", 1:0.25, 0:2000], #"hash_6adfe69a27bbb2d5":[4:2, 3:500, 2:"SE_SatchelChargeDestroyedVehicle", 1:0.25, 0:2000], #"revenge_kill":[4:undefined, 3:1000, 2:"SE_RevengeKill", 1:0.4, 0:2000], #"hash_551d67ca10327522":[4:undefined, 3:1500, 2:"SE_QuickshotBowShutdown", 1:0.25, 0:2000], #"hash_32c34d27be56bbe4":[4:undefined, 3:1500, 2:"SE_PurifierShutdown", 1:0.25, 0:2000], #"kill_enemy_with_gunbutt":[4:undefined, 3:1000, 2:"SE_KillEnemyWithGunbutt", 1:0.25, 0:2000], #"kill_enemy_when_injured":[4:undefined, 3:1500, 2:"SE_KillEnemyWhenInjured", 1:0.4, 0:2000], #"hash_17b4c2f07d4f33b9":[4:undefined, 3:2500, 2:"SE_KillEnemyFlashedSlowedStunned", 1:0.25, 0:2000], #"hash_7eea303a50912c2a":[4:2, 3:1500, 2:"SE_KillEnemiesOneBullet", 1:0.25, 0:2000], #"first_kill":[4:undefined, 3:1000, 2:"SE_FirstKill", 1:0.25, 0:2000], #"comeback_from_deathstreak":[4:undefined, 3:1000, 2:"SE_Comeback", 1:0.25, 0:2000], #"bounce_hatchet_kill":[4:undefined, 3:2000, 2:"SE_BounceHatchetKill", 1:0.25, 0:2000], #"kill_enemy_with_their_weapon":[4:2, 3:2000, 2:"SE_Backfire", 1:0.25, 0:2000], #"hash_684f9cf980ee0653":[4:undefined, 3:1000, 2:"SE_AnnihilatorShutdown", 1:0.25, 0:2000], #"hash_444270ecef7ca44":[4:undefined, 3:500, 2:"SE_HatchetLongshotKill", 1:0.1, 0:1500], #"hash_3a7ae1e782198db2":[4:undefined, 3:1500, 2:"SE_KillEnemyOneBullet", 1:0.1, 0:1200], #"backstabber_kill":[4:undefined, 3:1000, 2:"SE_BackstabberKill", 1:0.1, 0:1000], #"hash_23e04a595aa862a":[4:undefined, 3:1500, 2:undefined, 1:1, 0:0]];
	level.var_c26a3a23 = [#"kill_enemy_one_bullet":"STATS_KILL_ENEMY_ONE_BULLET_HC"];
}

/*
	Name: function_4013aee1
	Namespace: scoreevents
	Checksum: 0x51A393E5
	Offset: 0x1A18
	Size: 0x152
	Parameters: 2
	Flags: Linked
*/
function function_4013aee1(status_effect, var_3bc85d80)
{
	if(!isdefined(status_effect.var_4b22e697) || status_effect.var_4b22e697 == status_effect.owner || !isdefined(status_effect.var_3d1ed4bd))
	{
		return;
	}
	switch(status_effect.setype)
	{
		case 2:
		{
			if(var_3bc85d80 == "begin")
			{
				if(status_effect.var_3d1ed4bd == getweapon(#"concussion_grenade"))
				{
					processscoreevent(#"concussed_enemy", status_effect.var_4b22e697, status_effect.owner, status_effect.var_3d1ed4bd);
					status_effect.var_4b22e697.var_9d19aa30 = (isdefined(status_effect.var_4b22e697.var_9d19aa30) ? status_effect.var_4b22e697.var_9d19aa30 : 0) + 1;
					break;
				}
			}
		}
		default:
		{
			break;
		}
	}
}

/*
	Name: on_player_spawned
	Namespace: scoreevents
	Checksum: 0x5F2BF26D
	Offset: 0x1B78
	Size: 0x5E
	Parameters: 0
	Flags: Linked
*/
function on_player_spawned()
{
	self player_spawned();
	self thread function_dcdf1105();
	self callback::on_weapon_change(&on_weapon_change);
	self.var_eed94074 = undefined;
}

/*
	Name: on_weapon_change
	Namespace: scoreevents
	Checksum: 0xC18EA183
	Offset: 0x1BE0
	Size: 0x1DE
	Parameters: 1
	Flags: Linked, Private
*/
function private on_weapon_change(params)
{
	if(!isdefined(params.weapon) || !isweapon(params.weapon) || !isdefined(params.last_weapon) || !isweapon(params.last_weapon) || !isdefined(self) || !isplayer(self))
	{
		return;
	}
	var_86ecd1f2 = weapons::getbaseweapon(params.weapon);
	var_b577d267 = weapons::getbaseweapon(params.last_weapon);
	if(!isdefined(var_86ecd1f2) || !isdefined(var_b577d267) || var_86ecd1f2 == var_b577d267)
	{
		return;
	}
	if(var_86ecd1f2.var_76ce72e8 === 1 || var_86ecd1f2.issignatureweapon === 1 || var_86ecd1f2.name == #"none")
	{
		return;
	}
	if(var_b577d267.var_76ce72e8 === 1 || var_b577d267.issignatureweapon === 1 || var_b577d267.name == #"none")
	{
		return;
	}
	if(isdefined(killstreaks::get_from_weapon(var_86ecd1f2)) || isdefined(killstreaks::get_from_weapon(var_b577d267)))
	{
		return;
	}
	self.var_6f3f5189 = gettime();
}

/*
	Name: function_abe2675d
	Namespace: scoreevents
	Checksum: 0x1894D6CD
	Offset: 0x1DC8
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function function_abe2675d()
{
	if(self.var_9cd2c51d.var_158e75d4 === #"eq_stimshot")
	{
		self stats::function_622feb0d(#"eq_stimshot", #"uses", 1);
	}
}

/*
	Name: function_9c3085c8
	Namespace: scoreevents
	Checksum: 0x4643565D
	Offset: 0x1E30
	Size: 0x7C
	Parameters: 0
	Flags: Linked
*/
function function_9c3085c8()
{
	if(self.var_9cd2c51d.var_158e75d4 === #"eq_stimshot")
	{
		var_b68a8a9f = self.health - self.var_9cd2c51d.var_6e219f3c;
		self stats::function_622feb0d(#"eq_stimshot", #"hash_2bc3b9360ca17edf", var_b68a8a9f);
	}
}

/*
	Name: scoreeventtablelookupint
	Namespace: scoreevents
	Checksum: 0xBA8E110D
	Offset: 0x1EB8
	Size: 0x52
	Parameters: 2
	Flags: None
*/
function scoreeventtablelookupint(index, scoreeventcolumn)
{
	return int(tablelookup(getscoreeventtablename(), 0, index, scoreeventcolumn));
}

/*
	Name: scoreeventtablelookup
	Namespace: scoreevents
	Checksum: 0xE2B84DE6
	Offset: 0x1F18
	Size: 0x42
	Parameters: 2
	Flags: None
*/
function scoreeventtablelookup(index, scoreeventcolumn)
{
	return tablelookup(getscoreeventtablename(), 0, index, scoreeventcolumn);
}

/*
	Name: scoreeventplayerkill
	Namespace: scoreevents
	Checksum: 0xD19C377
	Offset: 0x1F68
	Size: 0x3644
	Parameters: 2
	Flags: Linked
*/
function scoreeventplayerkill(data, time)
{
	victim = data.victim;
	if(!isdefined(victim))
	{
		return;
	}
	attacker = data.attacker;
	if(!isdefined(attacker) || !isplayer(attacker))
	{
		return;
	}
	time = data.time;
	level.numkills++;
	attacker.lastkilledplayer = victim;
	wasdefusing = data.wasdefusing;
	wasplanting = data.wasplanting;
	victimwasonground = data.victimonground;
	attackerorigin = data.attackerorigin;
	victimorigin = data.victimorigin;
	meansofdeath = data.smeansofdeath;
	attackertraversing = data.attackertraversing;
	attackersliding = data.attackersliding;
	attacker_slide_end = (isdefined(data.attacker_slide_end) ? data.attacker_slide_end : 0);
	var_31d0fbf5 = data.var_31d0fbf5;
	attackerwasflashed = data.attackerwasflashed;
	var_c3782b05 = data.var_c3782b05;
	attackerwasconcussed = data.attackerwasconcussed;
	victimwasunderwater = data.wasunderwater;
	victimelectrifiedby = data.victimelectrifiedby;
	victimwasinslamstate = data.victimwasinslamstate;
	victimbledout = data.bledout;
	var_9fb5719b = data.var_9fb5719b;
	victimgadgetpower = data.victimgadgetpower;
	var_64aaf8ac = data.var_64aaf8ac;
	var_78056843 = data.var_78056843;
	var_4f6eb670 = data.var_4f6eb670;
	var_cf13980c = data.var_cf13980c;
	var_7117b104 = data.var_7117b104;
	var_893d5683 = data.var_893d5683;
	var_ab4f5741 = data.var_ab4f5741;
	var_504c7a2f = data.var_504c7a2f;
	var_7006e4f4 = data.var_7006e4f4;
	var_af1b39cb = data.var_af1b39cb;
	var_e020b97e = data.var_e020b97e;
	var_c3f8aa38 = data.var_ac7c0ef7;
	var_a79760b1 = data.var_a79760b1;
	var_dd195b6b = data.var_dd195b6b;
	var_31310133 = data.var_31310133;
	var_a99236f2 = data.var_a99236f2;
	var_9084d6e = data.var_9084d6e;
	var_157f4d3b = data.var_157f4d3b;
	var_f048a359 = data.var_f048a359;
	attacker.var_a7f5c61e = data.var_be469b25;
	var_5fa4aeed = data.var_5fa4aeed;
	var_8099aa99 = data.var_8099aa99;
	var_4d1f1cc0 = data.var_60cb0c39;
	var_284da85d = data.var_284da85d;
	if(level.lastkilltime != time)
	{
		level.prevlastkilltime = level.lastkilltime;
		level.lastkilltime = time;
	}
	if(victimbledout == 1)
	{
		return;
	}
	exlosivedamage = 0;
	attackershotvictim = meansofdeath == "MOD_PISTOL_BULLET" || meansofdeath == "MOD_RIFLE_BULLET" || meansofdeath == "MOD_HEAD_SHOT";
	weapon = level.weaponnone;
	inflictor = data.einflictor;
	isgrenade = 0;
	if(isdefined(data.weapon))
	{
		weapon = data.weapon;
		weaponclass = util::getweaponclass(data.weapon);
		isgrenade = weapon.isgrenadeweapon;
		killstreak = killstreaks::get_from_weapon(data.weapon);
	}
	victim.anglesondeath = victim getplayerangles();
	if(meansofdeath == "MOD_GRENADE" || meansofdeath == "MOD_GRENADE_SPLASH" || meansofdeath == "MOD_EXPLOSIVE" || meansofdeath == "MOD_EXPLOSIVE_SPLASH" || meansofdeath == "MOD_PROJECTILE" || meansofdeath == "MOD_PROJECTILE_SPLASH")
	{
		if(weapon == level.weaponnone && isdefined(data.victim.explosiveinfo[#"weapon"]))
		{
			weapon = data.victim.explosiveinfo[#"weapon"];
		}
		exlosivedamage = 1;
	}
	attacker.cur_kill_streak++;
	if((attacker.cur_kill_streak % 5) == 0)
	{
		util::function_a3f7de13(18, attacker.team, attacker getentitynumber(), attacker.cur_kill_streak);
	}
	if(!isdefined(killstreak))
	{
		if(level.teambased)
		{
			if(isdefined(victim.lastkilltime) && victim.lastkilltime > (time - 3000))
			{
				if(isdefined(victim.lastkilledplayer) && victim.lastkilledplayer util::isenemyplayer(attacker) == 0 && attacker != victim.lastkilledplayer)
				{
					processscoreevent(#"kill_enemy_who_killed_teammate", attacker, victim, weapon);
					attacker activecamo::function_896ac347(weapon, #"avenger", 1);
					attacker activecamo::function_896ac347(weapon, #"hash_39ab7cda18fd5c74", 1);
					attacker stats::function_dad108fa(#"hash_47c20b0aa74ca0c", 1);
					level thread telemetry::function_18135b72(#"hash_37f96a1d3c57a089", {#hash_bdc4bbd2:#"avenger", #player:victim});
				}
			}
			if(isdefined(victim.damagedplayers) && isdefined(attacker) && isdefined(attacker.clientid))
			{
				keys = getarraykeys(victim.damagedplayers);
				for(i = 0; i < keys.size; i++)
				{
					key = keys[i];
					if(!isdefined(key) || key === attacker.clientid)
					{
						continue;
					}
					if(!isdefined(victim.damagedplayers[key].entity))
					{
						continue;
					}
					if(attacker util::isenemyplayer(victim.damagedplayers[key].entity))
					{
						continue;
					}
					if(time - victim.damagedplayers[key].time < 1000)
					{
						processscoreevent(#"kill_enemy_injuring_teammate", attacker, victim, weapon);
						if(isdefined(victim.damagedplayers[key].entity))
						{
							victim.damagedplayers[key].entity.lastrescuedby = attacker;
							victim.damagedplayers[key].entity.lastrescuedtime = time;
						}
						challenges::function_3f57a5b(attacker, weapon);
						level thread telemetry::function_18135b72(#"hash_37f96a1d3c57a089", {#hash_bdc4bbd2:#"defender", #player:victim});
					}
				}
			}
		}
		if(var_4d1f1cc0 === 1)
		{
			attacker contracts::player_contract_event(#"hash_31940a13f77a7a79");
		}
		if(isgrenade == 0 || weapon.name == #"hero_gravityspikes")
		{
			if(attackersliding == 1 || (time - attacker_slide_end) < 350)
			{
				processscoreevent(#"kill_enemy_while_sliding", attacker, victim, weapon);
				attacker stats::function_e24eec31(weapon, #"kill_enemy_while_sliding", 1);
				attacker contracts::increment_contract(#"hash_6c70eaacf3b79499");
			}
			if(attackertraversing == 1)
			{
				processscoreevent(#"traversal_kill", attacker, victim, weapon);
			}
			if(attackerwasconcussed)
			{
				processscoreevent(#"kill_enemy_while_stunned", attacker, victim, weapon);
			}
		}
		if(isdefined(var_cf13980c))
		{
			sensor = function_c01cb128(victim, var_cf13980c);
			if(isdefined(sensor))
			{
				processscoreevent(#"hash_224fd59f924db25a", attacker, victim, sensor.weapon);
			}
		}
		else if(isdefined(var_4f6eb670))
		{
			sensor = function_c01cb128(victim, var_4f6eb670);
			if(isdefined(sensor))
			{
				if(function_9aef690a(weapon))
				{
					processscoreevent(#"hash_1f661efe5e6707ad", var_78056843, victim, weapon);
				}
				else
				{
					processscoreevent(#"hash_731f824a77ef7369", var_78056843, victim, weapon);
				}
			}
		}
		if(var_9084d6e && isdefined(var_f048a359))
		{
			if(var_f048a359 == getweapon(#"concussion_grenade"))
			{
				processscoreevent(#"concussion_kill", attacker, victim, getweapon(#"concussion_grenade"));
				if(attacker != var_157f4d3b)
				{
					processscoreevent(#"assist_concussion", var_157f4d3b, victim, weapon);
				}
			}
			attacker contracts::increment_contract(#"hash_62593ab7c25a27a4");
		}
		if(var_9084d6e || var_e020b97e)
		{
			attacker stats::function_dad108fa(#"hash_3c6b9a79e1aca4d9", 1);
		}
		if(weapon == getweapon(#"sig_buckler_turret") || weapon == getweapon(#"sig_buckler_dw"))
		{
			if(var_e020b97e && isdefined(var_af1b39cb) && var_af1b39cb == attacker)
			{
				processscoreevent(#"hash_63b75d5e59c12f69", attacker, victim, weapon);
			}
		}
		else if(var_e020b97e && !var_c3f8aa38 && isdefined(var_af1b39cb) && var_af1b39cb == attacker)
		{
			processscoreevent(#"hash_5133c3fc034db4aa", attacker, victim, weapon);
			attacker contracts::increment_contract(#"hash_4a30207a6036bed0");
		}
		if(attackerwasflashed === 1 && data.var_1c4553e5.name === #"eq_flash_grenade")
		{
			processscoreevent(#"hash_7e54fa6e53910c4e", attacker, victim, data.var_1c4553e5);
		}
		else if(var_c3782b05 === 1 && data.var_c2cdb4a1.name === #"eq_slow_grenade")
		{
			processscoreevent(#"hash_7e54fa6e53910c4e", attacker, victim, data.var_c2cdb4a1);
		}
		if(isdefined(attacker.var_6f3f5189) && (attacker.var_6f3f5189 + 2000) >= time && !weapon.var_76ce72e8 === 1)
		{
			processscoreevent("kill_enemy_after_switching_weapons", attacker, victim, weapon);
		}
		if(victimwasinslamstate)
		{
			attacker contracts::player_contract_event(#"killed_hero_weapon_enemy");
		}
		if(challenges::ishighestscoringplayer(victim))
		{
			processscoreevent(#"kill_enemy_who_has_high_score", attacker, victim, weapon);
			attacker activecamo::function_896ac347(weapon, #"kingslayer", 1);
			attacker activecamo::function_896ac347(weapon, #"hash_39ab7cda18fd5c74", 1);
			attacker contracts::increment_contract(#"hash_47ca0c4002f709e5");
			attacker contracts::increment_contract(#"hash_30ea14a4ce0e5d04");
		}
		if(victimwasunderwater && exlosivedamage)
		{
			processscoreevent(#"kill_underwater_enemy_explosive", attacker, victim, weapon);
		}
		if(var_5fa4aeed && isdefined(victim.lastattackedshieldplayer) && victim.lastattackedshieldplayer == attacker)
		{
			processscoreevent(#"hash_7c2d800a84be69a2", attacker, victim, weapon);
		}
		if(isdefined(victimelectrifiedby) && victimelectrifiedby != attacker)
		{
			processscoreevent(#"electrified", victimelectrifiedby, victim, weapon);
		}
		if(isdefined(var_ab4f5741) && var_ab4f5741 === 1)
		{
			foreach(var_69162b32 in victim._gadgets_player)
			{
				if(var_69162b32 == getweapon(#"mute_smoke"))
				{
					processscoreevent(#"hash_438160ef75ca2ea", attacker, victim, weapon);
					break;
				}
			}
			if(weapon == getweapon(#"eq_arm_blade"))
			{
				processscoreevent(#"hash_1e657ba6178ae2c6", attacker, victim, weapon);
			}
			if(isdefined(var_7006e4f4) && var_504c7a2f == 1)
			{
				if(var_7006e4f4 == attacker)
				{
					processscoreevent(#"hash_3d3467f13cf43727", attacker, victim, getweapon(#"mute_smoke"));
				}
				else
				{
					processscoreevent(#"hash_5a52344f66f68864", var_7006e4f4, victim, weapon);
				}
			}
		}
		if(isdefined(var_a99236f2))
		{
			if(attacker == var_a99236f2)
			{
				processscoreevent(#"hash_6dee98175676f663", attacker, victim, weapon);
			}
			else
			{
				processscoreevent(#"suppression_assist", var_a99236f2, victim, weapon);
			}
		}
		if(is_true(attacker.var_a7f5c61e))
		{
			if(weapon != getweapon(#"eq_gravityslam") && gettime() > (isdefined(attacker.var_5069fdec) ? attacker.var_5069fdec : int(-30 * 1000)) + (int(30 * 1000)))
			{
				attacker.var_5069fdec = gettime();
			}
			processscoreevent(#"hash_2b28b6abff07567e", attacker, victim, weapon);
		}
		if(weapon == getweapon(#"eq_gravityslam"))
		{
			processscoreevent(#"hash_5c8c3bd3007e5948", attacker, victim, weapon);
		}
		if(var_9fb5719b)
		{
			processscoreevent(#"hash_300c1c6babed2cb3", attacker, victim, weapon);
		}
		if(isdefined(data.victimweapon))
		{
			killedheavyweaponenemy(attacker, victim, weapon, data.victimweapon, victimgadgetpower);
			if(data.victimweapon.statindex == level.weapon_sig_minigun.statindex)
			{
				processscoreevent(#"hash_3988d3aa940f2e77", attacker, victim, weapon);
			}
			else if(data.victimweapon.name == "m32")
			{
				processscoreevent(#"killed_multiple_grenade_launcher_enemy", attacker, victim, weapon);
			}
		}
		if(weapon.statname == #"frag_grenade")
		{
			attacker stats::function_dad108fa(#"kills_frag_grenade", 1);
		}
		else if(weapon.statname == #"eq_molotov")
		{
			attacker stats::function_dad108fa(#"kills_molotov", 1);
		}
		attacker thread updatemultikills(weapon, weaponclass, killstreak, victim, time, meansofdeath);
		if(level.prevlastkilltime == 0 && attacker.prevlastkilltime == 0)
		{
			processscoreevent(#"first_kill", attacker, victim, weapon);
			level thread telemetry::function_18135b72(#"hash_37f96a1d3c57a089", {#hash_bdc4bbd2:#"firstblood", #player:victim});
			level.var_8a3a9ca4.firstblood = gettime();
			attacker contracts::increment_contract(#"hash_61c7d530de491c8d");
			globallogic::function_3305e557(attacker, "firstBlood", 0);
			attacker function_ef823e71(6, attacker.pers[#"firstblood"]);
			if(isdefined(victim.pers[#"hash_375a7d44ce729499"]))
			{
				victim.pers[#"hash_375a7d44ce729499"]++;
				victim function_ef823e71(9, victim.pers[#"hash_375a7d44ce729499"]);
			}
			util::function_a3f7de13(22, attacker.team, attacker getentitynumber());
			data.results.var_a5aabf71 = 1;
		}
		else
		{
			if(isdefined(attacker.lastkilledby))
			{
				if(attacker.lastkilledby == victim)
				{
					level.globalpaybacks++;
					processscoreevent(#"revenge_kill", attacker, victim, weapon);
					attacker contracts::increment_contract(#"hash_be7f654734e0ee5");
					attacker activecamo::function_896ac347(weapon, #"revenge", 1);
					attacker activecamo::function_896ac347(weapon, #"hash_39ab7cda18fd5c74", 1);
					level thread telemetry::function_18135b72(#"hash_37f96a1d3c57a089", {#hash_bdc4bbd2:#"revenge", #player:victim});
					attacker.lastkilledby = undefined;
					data.results.var_905bd140 = 1;
				}
			}
			if(victim killstreaks::function_4a1fb0f())
			{
				level.globalbuzzkills++;
				processscoreevent(#"stop_enemy_killstreak", attacker, victim, weapon);
				attacker activecamo::function_896ac347(weapon, #"buzzkill", 1);
				attacker activecamo::function_896ac347(weapon, #"hash_39ab7cda18fd5c74", 1);
				level thread telemetry::function_18135b72(#"hash_37f96a1d3c57a089", {#hash_bdc4bbd2:#"buzzkill", #player:victim});
			}
			if(isdefined(victim.lastmansd) && victim.lastmansd == 1)
			{
				processscoreevent(#"final_kill_elimination", attacker, victim, weapon);
				if(isdefined(attacker.lastmansd) && attacker.lastmansd == 1)
				{
					processscoreevent(#"elimination_and_last_player_alive", attacker, victim, weapon);
					attacker stats::function_cc215323(#"hash_2e8b68c9d172d72", 1);
				}
			}
		}
		if(is_weapon_valid(meansofdeath, weapon, weaponclass, killstreak))
		{
			var_dca08887 = distancesquared(victimorigin, attackerorigin);
			weap_min_dmg_range = get_distance_for_weapon(weapon, weaponclass);
			if(var_dca08887 > weap_min_dmg_range)
			{
				attacker challenges::longdistancekillmp(weapon, meansofdeath);
				if(weapon.rootweapon.name == "hatchet")
				{
					processscoreevent(#"hash_444270ecef7ca44", attacker, victim, weapon);
					attacker challenges::longdistancehatchetkill();
					attacker contracts::increment_contract(#"hash_212c4ede1f826312");
				}
				processscoreevent(#"longshot_kill", attacker, victim, weapon);
				attacker contracts::increment_contract(#"hash_37a6781050049cc4");
				attacker.pers[#"longshots"]++;
				level thread telemetry::function_18135b72(#"hash_37f96a1d3c57a089", {#hash_bdc4bbd2:#"longshot", #player:victim});
				data.results.var_91b86b21 = 1;
				if(isdefined(attacker.var_ea1458aa))
				{
					if(!isdefined(attacker.var_ea1458aa.longshot_kills))
					{
						attacker.var_ea1458aa.longshot_kills = 0;
					}
					attacker.var_ea1458aa.longshot_kills++;
					if((attacker.var_ea1458aa.longshot_kills % 3) == 0)
					{
						attacker stats::function_dad108fa(#"longshot_3_onelife", 1);
					}
				}
			}
			if(var_dca08887 <= sqr(115))
			{
				processscoreevent(#"point_blank_kill", attacker, victim, weapon);
				challenges::function_ffdecc69(attacker, weapon);
			}
			else if(weaponclass == "weapon_sniper" && victim.firsttimedamaged === time)
			{
				function_644d867a(attacker, time, #"hash_3a7ae1e782198db2");
			}
			killdistance = distance(victim.origin, attackerorigin);
			attacker.pers[#"kill_distances"] = attacker.pers[#"kill_distances"] + killdistance;
			attacker.pers[#"num_kill_distance_entries"]++;
			data.results.kill_distance = killdistance;
			if(weaponclass == "weapon_sniper")
			{
				globallogic::function_3305e557(attacker, "sniperKills", 0);
			}
			if(var_8099aa99 === 1)
			{
				processscoreevent(#"hash_7635c9fb5fb1889", attacker, victim, weapon);
			}
		}
		if(isalive(attacker))
		{
			if(attacker.health < attacker.maxhealth * 0.35)
			{
				attacker.lastkillwheninjured = time;
				processscoreevent(#"kill_enemy_when_injured", attacker, victim, weapon);
				attacker stats::function_e24eec31(weapon, #"kill_enemy_when_injured", 1);
				attacker stats::function_dad108fa(#"hash_522dfb6da6f47203", 1);
				if(attacker util::has_toughness_perk_purchased_and_equipped())
				{
					attacker stats::function_dad108fa(#"perk_bulletflinch_kills", 1);
				}
			}
		}
		else if(isdefined(attacker.deathtime) && (attacker.deathtime + 800) < time && !attacker isinvehicle())
		{
			level.globalafterlifes++;
			processscoreevent(#"kill_enemy_after_death", attacker, victim, weapon);
			level thread telemetry::function_18135b72(#"hash_37f96a1d3c57a089", {#hash_bdc4bbd2:#"posthumous", #player:victim});
		}
		if(isdefined(attacker.cur_death_streak) && attacker.cur_death_streak >= 3)
		{
			level.globalcomebacks++;
			processscoreevent(#"comeback_from_deathstreak", attacker, victim, weapon);
			level thread telemetry::function_18135b72(#"hash_37f96a1d3c57a089", {#hash_bdc4bbd2:#"comeback", #player:victim});
		}
		if(isdefined(victim.lastmicrowavedby))
		{
			foreach(beingmicrowavedby in victim.beingmicrowavedby)
			{
				if(isdefined(beingmicrowavedby) && attacker util::isenemyplayer(beingmicrowavedby) == 0)
				{
					if(beingmicrowavedby != attacker)
					{
						scoregiven = processscoreevent(#"microwave_turret_assist", beingmicrowavedby, victim, weapon);
						if(isdefined(scoregiven))
						{
							beingmicrowavedby challenges::earnedmicrowaveassistscore(scoregiven);
						}
						continue;
					}
					attackermicrowavedvictim = 1;
				}
			}
			if(attackermicrowavedvictim === 1 && weapon.name != "microwave_turret")
			{
				attacker challenges::killwhiledamagingwithhpm();
				processscoreevent(#"microwave_turret_kill", beingmicrowavedby, victim, weapon);
				attacker function_be7a08a8(weapon, 1);
			}
		}
		if(weapons::ismeleemod(meansofdeath) && !weapon.isriotshield)
		{
			attacker.pers[#"stabs"]++;
			attacker.stabs = attacker.pers[#"stabs"];
			vangles = victim.anglesondeath[1];
			pangles = attacker.anglesonkill[1];
			anglediff = angleclamp180(vangles - pangles);
			if(is_true(weapon.var_cfc07f04) && anglediff > -30 && anglediff < 70)
			{
				level.globalbackstabs++;
				processscoreevent(#"backstabber_kill", attacker, victim, weapon);
				attacker contracts::increment_contract(#"hash_5134ffa8b29e76b3");
				var_1c73f975 = 1;
				weaponpickedup = 0;
				if(isdefined(attacker.pickedupweapons) && isdefined(attacker.pickedupweapons[weapon]))
				{
					weaponpickedup = 1;
				}
				attacker stats::function_eec52333(weapon, #"backstabber_kill", 1, attacker.class_num, weaponpickedup);
				attacker stats::function_561716e6(weapon.name, #"hash_110787096944486b", 1);
				if(!isdefined(attacker.pers[#"hash_4ff4199b83228823"]))
				{
					attacker stats::function_d0de7686(#"hash_180122e749fb5a26", 1, #"hash_20ba08b29e1de57e");
					attacker.pers[#"hash_4ff4199b83228823"] = 1;
				}
				attacker.pers[#"backstabs"]++;
			}
			else if(!is_true(weapon.var_cfc07f04) && (anglediff < -30 || anglediff > 70 || is_true(victim.laststand)))
			{
				if(meansofdeath == "MOD_MELEE_WEAPON_BUTT" && weapon.name != #"ball" && weapon.name != #"hash_29ab150f9f8964f")
				{
					processscoreevent(#"kill_enemy_with_gunbutt", attacker, victim, weapon);
				}
				else if(weapons::ispunch(weapon))
				{
					processscoreevent(#"kill_enemy_with_fists", attacker, victim, weapon);
				}
			}
		}
		else if(isdefined(victim.firsttimedamaged) && victim.firsttimedamaged == time && (weapon.statindex == level.weapon_hero_annihilator.statindex || weapon.inventorytype != "ability"))
		{
			if(attackershotvictim)
			{
				attacker thread updateoneshotmultikills(victim, weapon, victim.firsttimedamaged, meansofdeath, time);
			}
		}
		if(isdefined(victim.var_d6f11c60) && attacker == victim.var_d6f11c60 && (victim.var_e6c1bab8 + 2000) > gettime())
		{
			var_21877ec1 = 1;
		}
		var_21877ec1 = 1;
		if(is_true(var_21877ec1))
		{
			processscoreevent(#"hash_50328eac1e8cfdcb", attacker, victim, weapon);
		}
		/#
			assert(isdefined(attacker));
		#/
		/#
			assert(isdefined(attacker.tookweaponfrom), ("" + attacker getentnum()) + "");
		#/
		if(isdefined(attacker) && isdefined(attacker.tookweaponfrom) && isdefined(attacker.tookweaponfrom[weapon]) && isdefined(attacker.tookweaponfrom[weapon].previousowner))
		{
			pickedupweapon = attacker.tookweaponfrom[weapon];
			if(pickedupweapon.previousowner == victim)
			{
				processscoreevent(#"kill_enemy_with_their_weapon", attacker, victim, weapon);
				attacker contracts::increment_contract(#"hash_f615898b7860a3a");
				attacker stats::function_e24eec31(weapon, #"kill_enemy_with_their_weapon", 1);
				if(isdefined(pickedupweapon.weapon) && isdefined(pickedupweapon.smeansofdeath) && weapons::ismeleemod(pickedupweapon.smeansofdeath))
				{
					foreach(meleeweapon in level.meleeweapons)
					{
						if(weapon != meleeweapon && pickedupweapon.weapon.rootweapon == meleeweapon)
						{
							attacker stats::function_e24eec31(meleeweapon, #"kill_enemy_with_their_weapon", 1);
							break;
						}
					}
				}
			}
		}
		if(wasdefusing)
		{
			processscoreevent(#"killed_bomb_defuser", attacker, victim, weapon);
		}
		else if(wasplanting)
		{
			processscoreevent(#"killed_bomb_planter", attacker, victim, weapon);
		}
		heavyweaponkill(attacker, victim, weapon);
		if(data.var_4e8a56b1 === 1)
		{
			if(meansofdeath == "MOD_CRUSH")
			{
				processscoreevent(#"hash_e0ebdc669e8fd7", attacker, victim);
				attacker contracts::increment_contract(#"hash_f3693a9e9cfb10a");
				if(data.var_ee70dcab)
				{
					processscoreevent(#"hash_3ae4d5d2b66fd960", attacker, victim, weapon);
				}
				else
				{
					processscoreevent(#"hash_725686a5570cf00a", attacker, victim, weapon);
				}
				if(var_4d1f1cc0 === 1)
				{
					if(isdefined(data.var_284da85d.session))
					{
						data.var_284da85d.session.var_9678e53b++;
					}
				}
				data.var_7b4d33ac = 1;
			}
			else
			{
				if(weapon.var_29d24e37)
				{
					if(data.var_1ebff6a5 !== 0 || data.var_8badc7f8 !== 1)
					{
						attacker stats::function_dad108fa(#"hash_492a4e8875009b7b", 1);
					}
					if(data.var_8badc7f8 === 1)
					{
						data.var_7b4d33ac = 1;
						if(data.var_1ebff6a5 === 0)
						{
							processscoreevent(#"hash_7f8f6ec19f91d88a", attacker, victim, weapon);
							if(data.var_ee70dcab)
							{
								processscoreevent(#"hash_3ae4d5d2b66fd960", attacker, victim, weapon);
							}
							else
							{
								processscoreevent(#"hash_725686a5570cf00a", attacker, victim, weapon);
							}
							if(var_4d1f1cc0 === 1)
							{
								if(isdefined(data.var_284da85d.session))
								{
									data.var_284da85d.session.var_9678e53b++;
								}
							}
						}
						else
						{
							processscoreevent(#"hash_203460376d5e46e8", attacker, victim, weapon);
							processscoreevent(#"hash_5429e1f8389910a9", attacker, victim, weapon);
							if(isdefined(data.var_adb68654))
							{
								if(data.var_b840fc2a === "player_fav_light" || data.var_b840fc2a === "player_btr40")
								{
									processscoreevent(#"hash_55fdfc040c784853", data.var_adb68654);
								}
								if(var_4d1f1cc0 === 1)
								{
									processscoreevent(#"hash_32393e7bdd5d6163", data.var_adb68654);
								}
								else
								{
									processscoreevent(#"hash_6e016b8588c56243", data.var_adb68654);
								}
							}
							if(var_4d1f1cc0 === 1)
							{
								if(isdefined(data.var_284da85d.session))
								{
									data.var_284da85d.session.var_afb151ad++;
								}
							}
						}
					}
				}
				else
				{
					data.var_7b4d33ac = 1;
					processscoreevent(#"hash_5a723893674cd85", attacker, victim, weapon);
					if(data.var_123eada)
					{
						if(data.var_ee70dcab)
						{
							processscoreevent(#"hash_3ae4d5d2b66fd960", attacker, victim, weapon);
						}
						else
						{
							processscoreevent(#"hash_725686a5570cf00a", attacker, victim, weapon);
						}
						if(var_4d1f1cc0 === 1)
						{
							if(isdefined(data.var_284da85d.session))
							{
								data.var_284da85d.session.var_9678e53b++;
							}
						}
					}
					else
					{
						processscoreevent(#"hash_5b50fec911597745", attacker, victim, weapon);
						if(isdefined(data.var_adb68654))
						{
							if(var_4d1f1cc0 === 1)
							{
								processscoreevent(#"hash_32393e7bdd5d6163", data.var_adb68654);
							}
							else
							{
								processscoreevent(#"hash_6e016b8588c56243", data.var_adb68654);
							}
						}
					}
				}
			}
		}
		if(data.var_3f8dd192 === 1)
		{
			if(isdefined(data.var_adb68654) && data.var_8badc7f8 === 1)
			{
				data.var_7b4d33ac = 1;
				processscoreevent(#"hash_5b50fec911597745", attacker, victim, weapon);
				if(var_4d1f1cc0 === 1)
				{
					processscoreevent(#"hash_32393e7bdd5d6163", data.var_adb68654);
				}
				else
				{
					processscoreevent(#"hash_6e016b8588c56243", data.var_adb68654);
				}
			}
		}
	}
	specificweaponkill(attacker, victim, weapon, killstreak, inflictor);
	if(isdefined(level.vtol) && isdefined(level.vtol.owner))
	{
		attacker stats::function_dad108fa(#"kill_as_support_gunner", 1);
		processscoreevent(#"mothership_assist_kill", level.vtol.owner, victim, weapon);
	}
	if(isdefined(var_7117b104) && (time - var_7117b104) < 5300)
	{
		processscoreevent(#"alarm_kill", attacker, victim, weapon);
	}
	switch(weapon.rootweapon.name)
	{
		case "hatchet":
		{
			attacker.pers[#"tomahawks"]++;
			attacker contracts::increment_contract(#"hash_677d9e70134fd9f5");
			attacker stats::function_dad108fa(#"hash_6189a4d9159c681f", 1);
			attacker stats::function_dad108fa(#"hash_1fc3943adb73363f", 1);
			if(isdefined(data.victim.explosiveinfo[#"projectile_bounced"]) && data.victim.explosiveinfo[#"projectile_bounced"] == 1)
			{
				processscoreevent(#"bounce_hatchet_kill", attacker, victim, weapon);
				attacker contracts::increment_contract(#"hash_660f842f7d97edcc");
				attacker stats::function_622feb0d(weapon.name, #"hash_348944bfb1b2471", 1);
				attacker stats::function_622feb0d(weapon.name, #"hash_4c2be004ea3925a6", 1);
			}
			break;
		}
		case "knife_loadout":
		{
			attacker stats::function_dad108fa(#"hash_1aa963d190a41652", 1);
			attacker stats::function_dad108fa(#"hash_3704dab636d3e04e", 1);
			attacker stats::function_dad108fa(#"hash_3704dbb636d3e201", 1);
			break;
		}
		case "supplydrop":
		case "inventory_supplydrop":
		case "supplydrop_marker":
		case "inventory_supplydrop_marker":
		{
			if(meansofdeath == "MOD_HIT_BY_OBJECT" || meansofdeath == "MOD_CRUSH")
			{
				function_2a2e1723(#"kill_enemy_with_care_package_crush", attacker, victim, weapon);
				attacker stats::function_8fb23f94(#"supplydrop_marker", #"hash_5a706fa7c83f5df3", 1);
			}
			else
			{
				if(isdefined(inflictor.hacker))
				{
					function_2a2e1723(#"kill_enemy_with_hacked_care_package", attacker, victim, weapon);
				}
				else
				{
					function_2a2e1723(#"hash_30fbe29e8c1237da", attacker, victim, weapon);
				}
			}
			attacker stats::function_8fb23f94(#"supplydrop_marker", #"kills", 1);
			data.var_7b4d33ac = 1;
			break;
		}
	}
	if(isdefined(level.var_5be42934))
	{
		attacker [[level.var_5be42934]](data);
	}
	if(isdefined(killstreak))
	{
		attacker thread updatemultikills(weapon, weaponclass, killstreak, victim, time, meansofdeath);
		level thread telemetry::function_18135b72(#"hash_37f96a1d3c57a089", {#hash_bdc4bbd2:#"killstreak", #player:victim});
	}
	attacker.cur_death_streak = 0;
	attacker disabledeathstreak();
}

/*
	Name: get_equipped_hero_ability
	Namespace: scoreevents
	Checksum: 0x8B03E441
	Offset: 0x55B8
	Size: 0x2A
	Parameters: 1
	Flags: None
*/
function get_equipped_hero_ability(ability_name)
{
	if(!isdefined(ability_name))
	{
		return undefined;
	}
	return getweapon(ability_name);
}

/*
	Name: heavyweaponkill
	Namespace: scoreevents
	Checksum: 0xE6625B25
	Offset: 0x55F0
	Size: 0x28C
	Parameters: 3
	Flags: Linked
*/
function heavyweaponkill(attacker, victim, weapon)
{
	if(!isdefined(weapon))
	{
		return;
	}
	switch(weapon.name)
	{
		case "hero_minigun":
		{
			event = "minigun_kill";
			break;
		}
		case "hero_flamethrower":
		{
			event = "flamethrower_kill";
			break;
		}
		case "hero_lightninggun":
		case "hero_lightninggun_arc":
		{
			event = "tempest_kill";
			break;
		}
		case "hero_firefly_swarm":
		case "hero_chemicalgelgun":
		{
			event = "gelgun_kill";
			break;
		}
		case "hero_bowlauncher2":
		case "hero_bowlauncher3":
		case "hero_bowlauncher4":
		case "hero_bowlauncher":
		case "sig_bow_flame":
		case "hash_6653bba8043d03f6":
		case "hash_6653bca8043d05a9":
		case "hash_6653bda8043d075c":
		case "hash_6653bea8043d090f":
		{
			event = "bowlauncher_kill";
			break;
		}
		case "sig_minigun_alt":
		case "sig_minigun":
		case "hash_5a34a2f4b8c715c0":
		case "hash_5a34aef4b8c72a24":
		case "hash_5a382ef4b8ca397b":
		case "hash_5a3832f4b8ca4047":
		case "hash_5a492ef4b8d8acae":
		case "hash_5a4932f4b8d8b37a":
		{
			if(attacker function_a867284b() && attacker playerads() == 1)
			{
				event = "mounted_kill";
			}
			else
			{
				event = "minigun_kill";
			}
			break;
		}
		default:
		{
			return;
		}
	}
	processscoreevent(event, attacker, victim, weapon);
}

/*
	Name: killedheavyweaponenemy
	Namespace: scoreevents
	Checksum: 0xBF8BF211
	Offset: 0x5888
	Size: 0x19C
	Parameters: 5
	Flags: Linked
*/
function killedheavyweaponenemy(attacker, victim, weapon, victim_weapon, victim_gadget_power)
{
	if(!isdefined(victim_weapon))
	{
		return;
	}
	if(!isdefined(victim_gadget_power))
	{
		return;
	}
	if(victim_gadget_power >= 100)
	{
		return;
	}
	switch(victim_weapon.name)
	{
		case "hero_minigun":
		{
			event = "killed_minigun_enemy";
			break;
		}
		case "hero_flamethrower":
		{
			event = "killed_flamethrower_enemy";
			break;
		}
		case "hero_lightninggun":
		case "hero_lightninggun_arc":
		{
			event = "tempest_shutdown";
			break;
		}
		case "hero_chemicalgelgun":
		{
			event = "killed_gelgun_enemy";
			break;
		}
		case "hero_bowlauncher2":
		case "hero_bowlauncher3":
		case "hero_bowlauncher4":
		case "hero_bowlauncher":
		{
			event = "killed_bowlauncher_enemy";
			break;
		}
		default:
		{
			return;
		}
	}
	processscoreevent(event, attacker, victim, weapon);
	attacker contracts::player_contract_event(#"killed_hero_weapon_enemy");
}

/*
	Name: specificweaponkill
	Namespace: scoreevents
	Checksum: 0x36C4DBDE
	Offset: 0x5A30
	Size: 0x384
	Parameters: 5
	Flags: Linked
*/
function specificweaponkill(attacker, victim, weapon, killstreak, inflictor)
{
	switchweapon = weapon.name;
	if(isdefined(killstreak))
	{
		switchweapon = killstreak;
		bundle = killstreaks::get_script_bundle(killstreak);
	}
	switch(switchweapon)
	{
		case "eq_arm_blade":
		{
			event = "blade_kill";
			break;
		}
		case "autoturret":
		case "inventory_autoturret":
		{
			event = "sentry_gun_kill";
			break;
		}
		case "tank_robot":
		case "tank_robot_launcher_turret":
		{
			event = "tank_robot_kill";
			if(is_true(attacker.var_5f28922a))
			{
				attacker stats::function_dad108fa(#"kill_with_controlled_ai_tank", 1);
			}
			break;
		}
		case "microwave_turret":
		case "microwaveturret":
		case "inventory_microwaveturret":
		case "inventory_microwave_turret":
		{
			event = "microwave_turret_kill";
			break;
		}
		case "combat_robot":
		case "inventory_combat_robot":
		{
			event = "combat_robot_kill";
			break;
		}
		case "claymore":
		{
			event = "claymore_kill";
			break;
		}
		case "inventory_rcbomb":
		case "rcbomb":
		{
			event = "hover_rcxd_kill";
			break;
		}
		case "incendiary_fire":
		{
			event = "thermite_kill";
			break;
		}
		case "eq_frag_gun":
		{
			event = "frag_kill";
			break;
		}
		case "overwatch_helicopter":
		{
			event = "overwatch_helicopter_kill";
			break;
		}
		case "swat_team":
		{
			event = "swat_team_kill";
			break;
		}
		default:
		{
			return;
		}
	}
	if(isdefined(inflictor))
	{
		if(isdefined(inflictor.killstreak_id) && isdefined(level.matchrecorderkillstreakkills[inflictor.killstreak_id]))
		{
			level.matchrecorderkillstreakkills[inflictor.killstreak_id]++;
		}
		else if(isdefined(inflictor.killcament) && isdefined(inflictor.killcament.killstreak_id) && isdefined(level.matchrecorderkillstreakkills[inflictor.killcament.killstreak_id]))
		{
			level.matchrecorderkillstreakkills[inflictor.killcament.killstreak_id]++;
		}
	}
	processscoreevent(event, attacker, victim, weapon);
}

/*
	Name: function_8fe4629e
	Namespace: scoreevents
	Checksum: 0xBB4F1C21
	Offset: 0x5DC0
	Size: 0x174
	Parameters: 2
	Flags: Linked
*/
function function_8fe4629e(killcount, weapon)
{
	doublekill = int(killcount / 2);
	if(doublekill > 0)
	{
		self activecamo::function_896ac347(weapon, #"doublekill", doublekill);
	}
	triplekill = int(killcount / 3);
	if(triplekill > 0)
	{
		self activecamo::function_896ac347(weapon, #"triplekill", triplekill);
	}
	furykill = int(killcount / 4);
	if(furykill > 0)
	{
		self activecamo::function_896ac347(weapon, #"furykill", furykill);
	}
	pentakill = int(killcount / 5);
	if(pentakill > 0)
	{
		self activecamo::function_896ac347(weapon, #"pentakill", pentakill);
	}
}

/*
	Name: multikill
	Namespace: scoreevents
	Checksum: 0xC303F8D5
	Offset: 0x5F40
	Size: 0x3DC
	Parameters: 2
	Flags: Linked
*/
function multikill(killcount, weapon)
{
	/#
		assert(killcount > 1);
	#/
	self challenges::multikill(killcount, weapon);
	if(killcount > 7)
	{
		processscoreevent(#"hash_5276c86cb9b56332", self, undefined, weapon);
	}
	else
	{
		processscoreevent(#"multikill_" + killcount, self, undefined, weapon);
	}
	if(isdefined(self.var_a95c605e) && isdefined(self.var_3e5d9e0f))
	{
		if(self.var_a95c605e > 0 && self.var_3e5d9e0f > 0)
		{
			self stats::function_dad108fa(#"hash_1be224b059c35269", 1);
		}
	}
	if(killcount > 2)
	{
		if(isdefined(self.challenge_objectivedefensivekillcount) && self.challenge_objectivedefensivekillcount > 0)
		{
			self.challenge_objectivedefensivetriplekillmedalorbetterearned = 1;
		}
		util::function_a3f7de13(19, self.team, self getentitynumber(), killcount);
	}
	if(killcount >= 2)
	{
		scoreevents = globallogic_score::function_3cbc4c6c(weapon.var_2e4a8800);
		var_8a4cfbd = weapon.var_76ce72e8 && isdefined(scoreevents) && scoreevents.var_fcd2ff3a === 1;
		if(var_8a4cfbd)
		{
			self stats::function_dad108fa(#"hash_2fa96b97166080d2", 1);
			self contracts::increment_contract(#"hash_7861508178a93a0f");
		}
		else if(weapon.issignatureweapon)
		{
			self stats::function_dad108fa(#"hash_cb8c5c845093e02", 1);
			self contracts::increment_contract(#"hash_3f50e5536ee788ab");
		}
	}
	if(killcount >= 3)
	{
		self contracts::increment_contract(#"hash_34056df55815ffbe");
		self contracts::increment_contract(#"hash_64a10fd107fcf644");
	}
	if(killcount >= 2)
	{
		self contracts::increment_contract(#"hash_586557e86aef88fd");
		self contracts::increment_contract(#"hash_8c7ac8fa81d9bc3");
	}
	self.pers[#"hash_104ec9727c3d4ef7"]++;
	if(self.pers[#"highestmultikill"] < killcount)
	{
		self.pers[#"highestmultikill"] = killcount;
		if(level.var_268c70a7 === 1 && isdefined(self.var_a504287b.var_fc1e4ef3))
		{
			if(killcount > self.var_a504287b.var_fc1e4ef3)
			{
				self.var_a504287b.var_fc1e4ef3 = killcount;
			}
		}
	}
	self recordmultikill(killcount);
}

/*
	Name: is_weapon_valid
	Namespace: scoreevents
	Checksum: 0x69720526
	Offset: 0x6328
	Size: 0x1F0
	Parameters: 4
	Flags: Linked
*/
function is_weapon_valid(meansofdeath, weapon, weaponclass, killstreak)
{
	valid_weapon = 0;
	if(isdefined(killstreak))
	{
		valid_weapon = 0;
	}
	else
	{
		if(get_distance_for_weapon(weapon, weaponclass) == 0)
		{
			valid_weapon = 0;
		}
		else
		{
			if(meansofdeath == "MOD_PISTOL_BULLET" || meansofdeath == "MOD_RIFLE_BULLET")
			{
				valid_weapon = 1;
			}
			else
			{
				if(meansofdeath == "MOD_HEAD_SHOT")
				{
					valid_weapon = 1;
				}
				else
				{
					if(weapon.rootweapon.name == "hatchet" && meansofdeath == "MOD_IMPACT")
					{
						valid_weapon = 1;
					}
					else
					{
						baseweapon = challenges::getbaseweapon(weapon);
						if(meansofdeath == "MOD_IMPACT")
						{
							if(baseweapon == level.weaponspecialcrossbow || weapon.isballisticknife || baseweapon == level.weaponflechette)
							{
								valid_weapon = 1;
							}
						}
						else
						{
							if(meansofdeath == "MOD_PROJECTILE")
							{
								if(baseweapon.forcedamagehitlocation || baseweapon == level.weaponshotgunenergy)
								{
									valid_weapon = 1;
								}
							}
							else if(meansofdeath == "MODE_GRENADE" || meansofdeath == "MOD_GRENADE_SPLASH")
							{
								if(baseweapon == level.var_91199825)
								{
									valid_weapon = 1;
								}
							}
						}
					}
				}
			}
		}
	}
	return valid_weapon;
}

/*
	Name: updatemultikills
	Namespace: scoreevents
	Checksum: 0x2452DBA9
	Offset: 0x6520
	Size: 0x13EC
	Parameters: 6
	Flags: Linked
*/
function updatemultikills(weapon, weaponclass, killstreak, victim, time, meansofdeath)
{
	self endon(#"disconnect");
	level endon(#"game_ended");
	self notify(#"updaterecentkills");
	self endon(#"updaterecentkills");
	baseweapon = weapons::getbaseweapon(weaponclass);
	if(!isdefined(self.recentkillvariables))
	{
		self resetrecentkillvariables();
	}
	currenttime = gettime();
	primary_weapon = self loadout::function_18a77b37("primary");
	secondary_weapon = self loadout::function_18a77b37("secondary");
	if(isdefined(primary_weapon) && baseweapon.statname == primary_weapon.statname)
	{
		if(!isdefined(self.var_a95c605e))
		{
			self.var_a95c605e = 0;
		}
		self.var_a95c605e++;
	}
	else if(isdefined(secondary_weapon) && baseweapon.statname == secondary_weapon.statname)
	{
		if(!isdefined(self.var_3e5d9e0f))
		{
			self.var_3e5d9e0f = 0;
		}
		self.var_3e5d9e0f++;
	}
	if(!isdefined(self.recentkillcountweapon) || self.recentkillcountweapon != baseweapon)
	{
		self.recentkillcountsameweapon = 0;
		self.recentkillcountweapon = baseweapon;
	}
	if(!isdefined(victim))
	{
		self.recentkillcountsameweapon++;
		self.recentkillcount++;
		if(self.recentkillcount > 1)
		{
			function_644d867a(self, meansofdeath, (#"multikill_" + self.recentkillcount) + "_nostat");
		}
	}
	if(is_true(baseweapon.issignatureweapon) || is_true(baseweapon.var_76ce72e8))
	{
		self.var_311e32f++;
		if(self.var_311e32f > 8)
		{
			processscoreevent(#"hash_658629ce68f99fb5", self, time, weaponclass);
		}
		else if(self.var_311e32f > 1)
		{
			scorestr = "specialist_weapon_equipment_multikill_x" + self.var_311e32f;
			processscoreevent(scorestr, self, time, weaponclass);
		}
	}
	if(isdefined(killstreak))
	{
		switch(killstreak)
		{
			case "weapon_lmg":
			{
				if(self playerads() < 1)
				{
					self.recent_lmg_smg_killcount++;
				}
				break;
			}
			case "weapon_smg":
			{
				if(self playerads() < 1)
				{
					self.recent_lmg_smg_killcount++;
				}
				self.var_26249c54++;
				break;
			}
			case "weapon_grenade":
			{
				self.recentlethalcount++;
				break;
			}
			case "weapon_knife":
			{
				self.var_aa2f2279++;
				break;
			}
			default:
			{
				break;
			}
		}
	}
	if(weaponclass.name == #"satchel_charge")
	{
		self.recentc4killcount++;
	}
	if(isdefined(level.killstreakweapons) && isdefined(level.killstreakweapons[weaponclass]))
	{
		switch(level.killstreakweapons[weaponclass])
		{
			case "remote_missile":
			case "inventory_remote_missile":
			{
				self.recentremotemissilecount++;
				break;
			}
			case "inventory_rcbomb":
			case "rcbomb":
			{
				self.recentrcbombcount++;
				break;
			}
		}
	}
	if(weaponclass.isheavyweapon)
	{
		self.recentheavykill = currenttime;
		self.recentheavyweaponkillcount++;
		if(isdefined(time))
		{
			self.recentheavyweaponvictims[time getentitynumber()] = time;
		}
		switch(weaponclass.name)
		{
			case "hero_annihilator":
			{
				self.recentanihilatorcount++;
				break;
			}
			case "hero_minigun":
			{
				self.recentminiguncount++;
				break;
			}
			case "hero_bowlauncher2":
			case "hero_bowlauncher3":
			case "hero_bowlauncher4":
			case "hero_bowlauncher":
			{
				self.recentbowlaunchercount++;
				break;
			}
			case "hero_flamethrower":
			{
				self.recentflamethrowercount++;
				break;
			}
			case "hero_lightninggun":
			case "hero_lightninggun_arc":
			{
				self.recentlightningguncount++;
				break;
			}
			case "hero_pineapple_grenade":
			case "hero_pineapplegun":
			{
				self.recentpineappleguncount++;
				break;
			}
			case "hero_firefly_swarm":
			case "hero_chemicalgun":
			{
				self.recentgelguncount++;
				break;
			}
		}
	}
	if(self.var_a7f5c61e && weaponclass.name == #"eq_gravityslam")
	{
		self.var_cc5ece37++;
	}
	if(isdefined(victim))
	{
		switch(victim)
		{
			case "remote_missile":
			{
				self.recentremotemissilekillcount++;
				break;
			}
			case "rcbomb":
			{
				self.recentrcbombkillcount++;
				break;
			}
			case "recon_car":
			case "inventory_recon_car":
			{
				self.var_70845d87++;
				break;
			}
			case "m32":
			case "inventory_m32":
			{
				self.recentmglkillcount++;
				break;
			}
		}
	}
	if(self.recentkillcountsameweapon == 2)
	{
		self stats::function_e24eec31(weaponclass, #"multikill_2", 1);
		self stats::function_dad108fa(#"hash_3a8433be848d44c5", 1);
		self stats::function_dad108fa(#"hash_47d74e5c1e3b9691", 1);
	}
	else if(self.recentkillcountsameweapon == 3)
	{
		self stats::function_e24eec31(weaponclass, #"multikill_3", 1);
	}
	if(isdefined(self.var_9cd2c51d.var_63362b1e) && (self.var_9cd2c51d.var_63362b1e + 4000) >= currenttime)
	{
		self stats::function_622feb0d(#"eq_stimshot", #"hash_1bc3e0ea4bf67adf", 1);
		self stats::function_6fb0b113(#"eq_stimshot", #"hash_7612343d459539e4");
		self contracts::increment_contract(#"hash_7f55ef9eebad63f7");
		self.var_4d1e31f6++;
	}
	if(isdefined(self.var_eed94074.lastdamagetime) && (self.var_eed94074.lastdamagetime + 4000) >= currenttime)
	{
		self.var_b27d41c0++;
	}
	self waittilltimeout(4, #"death");
	if(self.recent_lmg_smg_killcount >= 3)
	{
		self challenges::multi_lmg_smg_kill();
	}
	if(self.var_26249c54 >= 2)
	{
		if(!isdefined(self.pers[#"hash_4612b3db7f75297e"]))
		{
			self stats::function_d0de7686(#"hash_4d6b858ad789777", 1, #"hash_321f62b43e5e631b");
			self.pers[#"hash_4612b3db7f75297e"] = 1;
		}
	}
	if(self.recentrcbombkillcount >= 2)
	{
		self challenges::multi_rcbomb_kill();
	}
	if(self.var_70845d87 >= 2)
	{
		self challenges::function_46754062();
	}
	if(self.recentmglkillcount >= 3)
	{
		self challenges::multi_mgl_kill();
	}
	if(self.recentremotemissilekillcount >= 3)
	{
		self challenges::multi_remotemissile_kill();
		self contracts::increment_contract(#"hash_276886a0fbac5de0");
	}
	if(isdefined(self.recentheroweaponkillcount) && self.recentheroweaponkillcount > 1)
	{
		self hero_weapon_multikill_event(self.recentheroweaponkillcount, weaponclass);
	}
	if(self.recentheavyweaponkillcount > 5)
	{
		arrayremovevalue(self.recentheavyweaponvictims, undefined);
		if(self.recentheavyweaponvictims.size > 5)
		{
			self stats::function_dad108fa(#"kill_entire_team_with_specialist_weapon", 1);
		}
	}
	if(self.recentanihilatorcount >= 3)
	{
		self multikillmedalachievement();
	}
	else if(self.recentanihilatorcount == 2)
	{
		self multikillmedalachievement();
	}
	if(self.recentminiguncount >= 3)
	{
		processscoreevent(#"minigun_multikill", self, time, weaponclass);
		self multikillmedalachievement();
	}
	else if(self.recentminiguncount == 2)
	{
		processscoreevent(#"minigun_multikill_2", self, time, weaponclass);
		self multikillmedalachievement();
	}
	if(self.recentbowlaunchercount >= 3)
	{
		processscoreevent(#"bowlauncher_multikill", self, time, weaponclass);
		self multikillmedalachievement();
	}
	else if(self.recentbowlaunchercount == 2)
	{
		processscoreevent(#"bowlauncher_multikill_2", self, time, weaponclass);
		self multikillmedalachievement();
	}
	if(self.recentflamethrowercount >= 3)
	{
		processscoreevent(#"flamethrower_multikill", self, time, weaponclass);
		self multikillmedalachievement();
	}
	else if(self.recentflamethrowercount == 2)
	{
		processscoreevent(#"flamethrower_multikill_2", self, time, weaponclass);
		self multikillmedalachievement();
	}
	if(self.recentlightningguncount >= 3)
	{
		processscoreevent(#"lightninggun_multikill", self, time, weaponclass);
		self multikillmedalachievement();
	}
	else if(self.recentlightningguncount == 2)
	{
		processscoreevent(#"hash_1ff9cffb9d62d81a", self, time, weaponclass);
		self multikillmedalachievement();
	}
	if(self.recentpineappleguncount >= 3)
	{
		self multikillmedalachievement();
	}
	else if(self.recentpineappleguncount == 2)
	{
		self multikillmedalachievement();
	}
	if(self.recentgelguncount >= 3)
	{
		processscoreevent(#"gelgun_multikill", self, time, weaponclass);
		self multikillmedalachievement();
	}
	else if(self.recentgelguncount == 2)
	{
		processscoreevent(#"gelgun_multikill_2", self, time, weaponclass);
		self multikillmedalachievement();
	}
	if(self.recentarmbladecount >= 3)
	{
		processscoreevent(#"armblades_multikill", self, time, weaponclass);
		self multikillmedalachievement();
	}
	else if(self.recentarmbladecount == 2)
	{
		processscoreevent(#"armblades_multikill_2", self, time, weaponclass);
		self multikillmedalachievement();
	}
	if(self.recentc4killcount >= 2)
	{
		processscoreevent(#"c4_multikill", self, time, weaponclass);
	}
	if(self.recentremotemissilecount >= 3)
	{
		self stats::function_dad108fa(#"multikill_3_remote_missile", 1);
	}
	if(self.recentrcbombcount >= 2)
	{
		self stats::function_dad108fa(#"multikill_2_rcbomb", 1);
	}
	if(self.recentlethalcount >= 2)
	{
		if(!isdefined(self.pers[#"challenge_kills_double_kill_lethal"]))
		{
			self.pers[#"challenge_kills_double_kill_lethal"] = 0;
		}
		self.pers[#"challenge_kills_double_kill_lethal"]++;
		if(self.pers[#"challenge_kills_double_kill_lethal"] >= 3)
		{
			self stats::function_dad108fa(#"kills_double_kill_3_lethal", 1);
		}
	}
	if(self.var_aa2f2279 >= 2)
	{
		if(!isdefined(self.pers[#"hash_68cb2a4ef4c94dbb"]))
		{
			self stats::function_d0de7686(#"hash_539cbd04b9471ee4", 1, #"hash_59592d69443157f");
			self.pers[#"hash_68cb2a4ef4c94dbb"] = 1;
		}
	}
	if(self.recentkillcount > 1)
	{
		self multikill(self.recentkillcount, weaponclass);
		if(self.recentkillcountsameweapon < self.recentkillcount)
		{
			self contracts::increment_contract(#"hash_23e14aee63c48afc");
		}
	}
	if(self.recentkillcountsameweapon > 1)
	{
		self function_8fe4629e(self.recentkillcountsameweapon, weaponclass);
	}
	if(self.var_cc5ece37 >= 2)
	{
		event = "grapple_slam_multikill_" + self.var_cc5ece37;
		processscoreevent(event, self, time, weaponclass);
	}
	if(self.var_4d1e31f6 >= 2)
	{
		processscoreevent(#"hash_5950ec5208dfe10a", self, time, level.var_507570e9);
		self stats::function_622feb0d(#"eq_stimshot", #"hash_7bf29fa438d54aad", 1);
		self contracts::increment_contract(#"hash_70b7885a87308dcf");
	}
	if(self.var_b27d41c0 >= 2)
	{
		if(isdefined(self.var_eed94074.var_615e1be9))
		{
			if(self.var_eed94074.var_615e1be9 >= self.maxhealth)
			{
				processscoreevent(#"hash_4bdbc016764205f3", self, time, getweapon(#"weapon_armor"));
				self stats::function_8fb23f94("weapon_armor", #"hash_e970dce71c27a65", 1);
				self.var_eed94074 = undefined;
			}
		}
	}
	self resetrecentkillvariables();
}

/*
	Name: resetrecentkillvariables
	Namespace: scoreevents
	Checksum: 0x5354CDA1
	Offset: 0x7918
	Size: 0x17A
	Parameters: 0
	Flags: Linked, Private
*/
function private resetrecentkillvariables()
{
	self.recentanihilatorcount = 0;
	self.recent_lmg_smg_killcount = 0;
	self.var_26249c54 = 0;
	self.recentarmbladecount = 0;
	self.recentbowlaunchercount = 0;
	self.recentc4killcount = 0;
	self.recentflamethrowercount = 0;
	self.recentgelguncount = 0;
	self.var_cc5ece37 = 0;
	self.recentheavyweaponkillcount = 0;
	self.recentheavyweaponvictims = [];
	self.recentkillcount = 0;
	self.recentkillcountsameweapon = 0;
	self.recentkillcountweapon = undefined;
	self.var_aa2f2279 = 0;
	self.recentlethalcount = 0;
	self.recentlightningguncount = 0;
	self.recentmglkillcount = 0;
	self.recentminiguncount = 0;
	self.recentpineappleguncount = 0;
	self.recentrcbombcount = 0;
	self.recentrcbombkillcount = 0;
	self.var_70845d87 = 0;
	self.recentremotemissilecount = 0;
	self.recentremotemissilekillcount = 0;
	self.var_311e32f = 0;
	self.var_4d1e31f6 = 0;
	self.var_b27d41c0 = 0;
	self.var_a95c605e = undefined;
	self.var_3e5d9e0f = undefined;
	self.var_fa9604fd = undefined;
	self.var_ee07421b = undefined;
	self.recentkillvariables = 1;
}

/*
	Name: updateoneshotmultikills
	Namespace: scoreevents
	Checksum: 0xFBA6BA32
	Offset: 0x7AA0
	Size: 0x25E
	Parameters: 5
	Flags: Linked
*/
function updateoneshotmultikills(victim, weapon, firsttimedamaged, meansofdeath, time)
{
	self endon(#"disconnect");
	self notify("updateoneshotmultikills" + firsttimedamaged);
	self endon("updateoneshotmultikills" + firsttimedamaged);
	if(!isdefined(self.oneshotmultikills) || firsttimedamaged > (isdefined(self.oneshotmultikillsdamagetime) ? self.oneshotmultikillsdamagetime : 0))
	{
		self.oneshotmultikills = 0;
	}
	self.oneshotmultikills++;
	self.oneshotmultikillsdamagetime = firsttimedamaged;
	if(self.oneshotmultikills > 1)
	{
		function_644d867a(self, time, #"hash_7eea303a50912c2a");
	}
	wait(1);
	if(!isplayer(self))
	{
		return;
	}
	if(self.oneshotmultikills > 1)
	{
		processscoreevent(#"kill_enemies_one_bullet", self, victim, weapon);
		self contracts::increment_contract(#"hash_45b74ebf1ab2fd47");
	}
	else if(weapon.statindex != level.weapon_hero_annihilator.statindex)
	{
		processscoreevent(#"kill_enemy_one_bullet", self, victim, weapon);
		self stats::function_561716e6(weapon.name, #"hash_1253a442c652a94d", 1);
		if(!level.hardcoremode)
		{
			self contracts::increment_contract(#"hash_47f2f8fa5afb9d01");
		}
		if(meansofdeath == "MOD_HEAD_SHOT")
		{
			self stats::function_dad108fa(#"kill_enemy_one_bullet_headshot", 1);
		}
	}
	self.oneshotmultikills = 0;
}

/*
	Name: get_distance_for_weapon
	Namespace: scoreevents
	Checksum: 0x6F5F45AF
	Offset: 0x7D08
	Size: 0x29E
	Parameters: 2
	Flags: Linked
*/
function get_distance_for_weapon(weapon, weaponclass)
{
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
			distance = sqr(1400);
			break;
		}
		case "weapon_lmg":
		case "weapon_tactical":
		case "weapon_assault":
		{
			distance = sqr(1600);
			break;
		}
		case "weapon_sniper":
		{
			distance = sqr(2000);
			break;
		}
		case "weapon_pistol":
		{
			distance = sqr(1000);
			break;
		}
		case "weapon_cqb":
		{
			distance = sqr(550);
			break;
		}
		case "weapon_special":
		{
			baseweapon = challenges::getbaseweapon(weapon);
			if(weapon.isballisticknife || (baseweapon == level.weaponspecialcrossbow && level.weaponspecialcrossbow != level.weaponnone))
			{
				distance = sqr(1500);
			}
			if(baseweapon == level.var_91199825 && level.var_91199825 != level.weaponnone)
			{
				distance = sqr(1600);
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
	Name: ongameend
	Namespace: scoreevents
	Checksum: 0x91667E1F
	Offset: 0x7FB0
	Size: 0x1C4
	Parameters: 1
	Flags: Linked
*/
function ongameend(data)
{
	player = data.player;
	winner = data.winner;
	if(isdefined(winner))
	{
		if(level.teambased)
		{
			if(!match::get_flag("tie") && player.team == winner)
			{
				player.pers[#"hash_6344af0b142ed0b6"] = 1;
				processscoreevent(#"won_match", player, undefined, undefined);
				return;
			}
		}
		else
		{
			placement = level.placement[#"all"];
			topthreeplayers = min(3, placement.size);
			for(index = 0; index < topthreeplayers; index++)
			{
				if(level.placement[#"all"][index] == player)
				{
					player.pers[#"hash_6344af0b142ed0b6"] = 1;
					processscoreevent(#"won_match", player, undefined, undefined);
					return;
				}
			}
		}
	}
	processscoreevent(#"completed_match", player, undefined, undefined);
}

/*
	Name: specialistmedalachievement
	Namespace: scoreevents
	Checksum: 0x5D1E8943
	Offset: 0x8180
	Size: 0x84
	Parameters: 0
	Flags: Linked
*/
function specialistmedalachievement()
{
	if(level.rankedmatch)
	{
		if(!isdefined(self.pers[#"specialistmedalachievement"]))
		{
			self.pers[#"specialistmedalachievement"] = 0;
		}
		self.pers[#"specialistmedalachievement"]++;
		self contracts::player_contract_event(#"earned_specialist_ability_medal");
	}
}

/*
	Name: function_9aef690a
	Namespace: scoreevents
	Checksum: 0x92F807CC
	Offset: 0x8210
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function function_9aef690a(weapon)
{
	baseweapon = weapons::getbaseweapon(weapon);
	return is_true(baseweapon.issignatureweapon) || is_true(baseweapon.var_76ce72e8);
}

/*
	Name: multikillmedalachievement
	Namespace: scoreevents
	Checksum: 0x520848D5
	Offset: 0x8288
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function multikillmedalachievement()
{
	if(level.rankedmatch)
	{
		self challenges::processspecialistchallenge("multikill_weapon");
	}
}

/*
	Name: function_c01cb128
	Namespace: scoreevents
	Checksum: 0xDD3EF84B
	Offset: 0x82C0
	Size: 0x7A
	Parameters: 2
	Flags: Linked
*/
function function_c01cb128(entity, sensor_darts)
{
	if(!isdefined(entity) || !isdefined(sensor_darts) || !isarray(sensor_darts) || !isdefined(entity.origin))
	{
		return undefined;
	}
	return function_c28e2c05(entity.origin, sensor_darts, 1);
}

/*
	Name: function_c28e2c05
	Namespace: scoreevents
	Checksum: 0xA9956AD5
	Offset: 0x8348
	Size: 0x132
	Parameters: 3
	Flags: Linked
*/
function function_c28e2c05(entity_origin, sensor_darts, var_e13a103a)
{
	if(!var_e13a103a)
	{
		if(!isdefined(sensor_darts) || !isarray(sensor_darts) || !isdefined(entity_origin))
		{
			return undefined;
		}
	}
	foreach(sensor in sensor_darts)
	{
		if(!isdefined(sensor))
		{
			continue;
		}
		if(distancesquared(entity_origin, sensor.origin) < sqr((sessionmodeiswarzonegame() ? 2400 : 800) + 50))
		{
			return sensor;
		}
	}
	return undefined;
}

/*
	Name: function_3932ffa2
	Namespace: scoreevents
	Checksum: 0x64BBFBEB
	Offset: 0x8488
	Size: 0x8E
	Parameters: 1
	Flags: None
*/
function function_3932ffa2(sensor_darts)
{
	foreach(sensor in sensor_darts)
	{
		if(!isdefined(sensor))
		{
			continue;
		}
		sensor.var_1fd3a368 = 0;
	}
}

/*
	Name: function_43ee1b3d
	Namespace: scoreevents
	Checksum: 0xDF4DC438
	Offset: 0x8520
	Size: 0x2B4
	Parameters: 3
	Flags: None
*/
function function_43ee1b3d(attacker, victim, attackerweapon)
{
	if(!isdefined(level.var_5101157d) || !isdefined(level.var_5101157d.var_f115c746))
	{
		return;
	}
	if(isdefined(attackerweapon) && isdefined(level.iskillstreakweapon) && [[level.iskillstreakweapon]](attackerweapon))
	{
		return false;
	}
	foreach(smartcover in level.var_5101157d.var_f115c746)
	{
		if(!isdefined(smartcover))
		{
			continue;
		}
		if(victim == smartcover.owner)
		{
			continue;
		}
		var_583e1573 = distancesquared(smartcover.origin, attacker.origin);
		if(var_583e1573 > level.var_5101157d.var_357db326)
		{
			continue;
		}
		var_eb870c = distancesquared(victim.origin, smartcover.origin);
		var_ae30f518 = distancesquared(victim.origin, attacker.origin);
		var_d9ecf725 = var_ae30f518 > var_583e1573;
		var_1d1ca33b = var_ae30f518 > var_eb870c;
		if(var_d9ecf725 && var_1d1ca33b)
		{
			var_a3aba5a9 = 1;
			var_71eedb0b = smartcover.owner;
			break;
		}
	}
	if(isdefined(var_71eedb0b) && isdefined(var_a3aba5a9) && var_a3aba5a9)
	{
		if(smartcover.owner == attacker)
		{
			processscoreevent(#"hash_253788f8c27edb93", var_71eedb0b, victim, level.var_5101157d.var_8d86ade8);
		}
		else
		{
			processscoreevent(#"hash_3d0d53aff3c68c68", var_71eedb0b, victim, level.var_5101157d.var_8d86ade8);
		}
	}
}

/*
	Name: function_b8495e95
	Namespace: scoreevents
	Checksum: 0xD0A15ECC
	Offset: 0x87E0
	Size: 0x1AC
	Parameters: 2
	Flags: Linked
*/
function function_b8495e95(data, time)
{
	vehicle = data.vehicle;
	var_43f2e2ad = data.var_43f2e2ad;
	var_da46f58a = data.var_da46f58a;
	isenemyvehicle = data.isenemyvehicle;
	inflictor = data.inflictor;
	attacker = data.attacker;
	damage = data.damage;
	mod = data.mod;
	weapon = data.weapon;
	hitloc = data.hitloc;
	time = data.time;
	var_c8757561 = data.var_c8757561;
	if(isenemyvehicle && var_43f2e2ad || var_da46f58a)
	{
		if(var_c8757561)
		{
			processscoreevent(#"hash_429ae888806770a4", attacker, undefined, weapon);
			attacker stats::function_561716e6(weapon.name, #"hash_109b0615c82fd4af", 1);
		}
		else
		{
			processscoreevent(#"hash_53c101618247bd46", attacker, undefined, weapon);
		}
	}
}

/*
	Name: function_e7152385
	Namespace: scoreevents
	Checksum: 0x312F4A91
	Offset: 0x8998
	Size: 0x3C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_e7152385(params)
{
	if(isdefined(params.victim.var_1318544a.var_7b4d33ac))
	{
		return 50;
	}
	return undefined;
}

