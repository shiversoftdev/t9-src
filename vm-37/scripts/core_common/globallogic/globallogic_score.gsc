#using scripts\weapons\weapon_utils.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\player\player_loadout.gsc;
#using script_7f6cd71c43c45c57;
#using scripts\core_common\weapons_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\contracts_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\rank_shared.gsc;
#using scripts\core_common\activecamo_shared.gsc;

#namespace globallogic_score;

/*
	Name: __init__system__
	Namespace: globallogic_score
	Checksum: 0x38320864
	Offset: 0x180
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"globallogic_score", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: globallogic_score
	Checksum: 0xBD803608
	Offset: 0x1C8
	Size: 0x9C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	callback::on_start_gametype(&init);
	callback::on_spawned(&playerspawn);
	/#
		setdvar(#"logscoreevents", 0);
		setdvar(#"dumpscoreevents", 0);
		thread function_bb9f3842();
	#/
}

/*
	Name: init
	Namespace: globallogic_score
	Checksum: 0x3C3EA66E
	Offset: 0x270
	Size: 0x7C
	Parameters: 0
	Flags: Linked
*/
function init()
{
	level.var_e0582de1 = [];
	scoreevents::registerscoreeventcallback("playerKilled", &function_f7f7b14e);
	scoreevents::function_9677601b("playerKilled", &function_1a0fa609);
	level.capturedobjectivefunction = &function_eced93f5;
}

/*
	Name: playerspawn
	Namespace: globallogic_score
	Checksum: 0x61E20DBB
	Offset: 0x2F8
	Size: 0x84
	Parameters: 0
	Flags: Linked
*/
function playerspawn()
{
	self.var_60a9eae7 = 0;
	self.var_a6b00192 = 0;
	self.var_7fff4605 = 0;
	self callback::on_weapon_change(&on_weapon_change);
	self callback::on_weapon_fired(&on_weapon_fired);
	self callback::on_grenade_fired(&on_grenade_fired);
}

/*
	Name: on_weapon_change
	Namespace: globallogic_score
	Checksum: 0x13ECB0D4
	Offset: 0x388
	Size: 0x22
	Parameters: 1
	Flags: Linked, Private
*/
function private on_weapon_change(params)
{
	self.var_a6b00192 = 0;
	self.var_7fff4605 = 0;
}

/*
	Name: on_weapon_fired
	Namespace: globallogic_score
	Checksum: 0x7A2CF778
	Offset: 0x3B8
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private on_weapon_fired(params)
{
	self function_5aa55c0a(params.weapon);
}

/*
	Name: function_f0d51d49
	Namespace: globallogic_score
	Checksum: 0x832142C3
	Offset: 0x3F0
	Size: 0xD4
	Parameters: 2
	Flags: Linked, Private
*/
function private function_f0d51d49(projectile, weapon)
{
	self endon(#"disconnect");
	level endon(#"game_ended");
	scoreevents = function_3cbc4c6c(weapon.var_2e4a8800);
	if(!isdefined(scoreevents.var_aa14d757))
	{
		return;
	}
	var_2a7ea9a6 = undefined;
	var_2a7ea9a6 = projectile waittilltimeout(10, #"death");
	if(var_2a7ea9a6._notify != "timeout")
	{
		scoreevents::processscoreevent(scoreevents.var_aa14d757, self, undefined, weapon);
	}
}

/*
	Name: on_grenade_fired
	Namespace: globallogic_score
	Checksum: 0xADF4F0D1
	Offset: 0x4D0
	Size: 0x6C
	Parameters: 1
	Flags: Linked, Private
*/
function private on_grenade_fired(params)
{
	weapon = params.weapon;
	if(!isdefined(weapon.var_2e4a8800))
	{
		return;
	}
	self function_5aa55c0a(weapon);
	self thread function_f0d51d49(params.projectile, weapon);
}

/*
	Name: function_5aa55c0a
	Namespace: globallogic_score
	Checksum: 0xEDD52AC
	Offset: 0x548
	Size: 0x7C
	Parameters: 1
	Flags: Linked
*/
function function_5aa55c0a(weapon)
{
	if(isdefined(weapon.var_2e4a8800))
	{
		scoreevents = function_3cbc4c6c(weapon.var_2e4a8800);
	}
	if(!isdefined(scoreevents))
	{
		return;
	}
	if(isdefined(scoreevents.var_7ecee77b))
	{
		scoreevents::processscoreevent(scoreevents.var_7ecee77b, self, undefined, weapon);
	}
}

/*
	Name: inctotalkills
	Namespace: globallogic_score
	Checksum: 0xF2A23F25
	Offset: 0x5D0
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function inctotalkills(team)
{
	if(level.teambased && isdefined(level.teams[team]))
	{
		game.totalkillsteam[team]++;
	}
	game.totalkills++;
}

/*
	Name: givekillstats
	Namespace: globallogic_score
	Checksum: 0x1251C604
	Offset: 0x628
	Size: 0x44
	Parameters: 3
	Flags: Linked
*/
function givekillstats(smeansofdeath, weapon, evictim)
{
	if(isdefined(level.scoreevents_givekillstats))
	{
		[[level.scoreevents_givekillstats]](smeansofdeath, weapon, evictim);
	}
}

/*
	Name: function_969ea48d
	Namespace: globallogic_score
	Checksum: 0x36BED564
	Offset: 0x678
	Size: 0x74
	Parameters: 2
	Flags: Linked
*/
function function_969ea48d(var_ba01256c, weapon)
{
	if(!isdefined(var_ba01256c))
	{
		return;
	}
	scoreevents = function_3cbc4c6c(var_ba01256c.var_2e4a8800);
	if(!isdefined(scoreevents.var_1253685d))
	{
		return;
	}
	scoreevents::processscoreevent(scoreevents.var_1253685d, self, undefined, weapon);
}

/*
	Name: processassist
	Namespace: globallogic_score
	Checksum: 0x4133877F
	Offset: 0x6F8
	Size: 0x1D8
	Parameters: 6
	Flags: Linked
*/
function processassist(killedplayer, damagedone, weapon, assist_level, time, meansofdeath)
{
	if(!isdefined(assist_level))
	{
		assist_level = undefined;
	}
	if(!isdefined(time))
	{
		time = gettime();
	}
	if(!isdefined(meansofdeath))
	{
		meansofdeath = "MOD_UNKNOWN";
	}
	waitframe(1);
	util::waittillslowprocessallowed();
	if(!isplayer(self) || !isplayer(killedplayer) || !isdefined(weapon))
	{
		return;
	}
	if(isarray(level.specweapons))
	{
		foreach(var_25f92d1d in level.specweapons)
		{
			if(var_25f92d1d.var_358571b4 !== 1)
			{
				self function_b78294bf(killedplayer, var_25f92d1d.weapon, weapon, var_25f92d1d, time, meansofdeath);
			}
		}
	}
	self function_b78294bf(killedplayer, weapon, weapon, undefined, time, meansofdeath);
	if(isdefined(level.scoreevents_processassist))
	{
		self [[level.scoreevents_processassist]](killedplayer, damagedone, weapon, assist_level);
	}
}

/*
	Name: function_b78294bf
	Namespace: globallogic_score
	Checksum: 0xF5450E28
	Offset: 0x8D8
	Size: 0x1BC
	Parameters: 6
	Flags: Linked, Private
*/
function private function_b78294bf(victim, weapon, attackerweapon, var_67660cb2, time, meansofdeath)
{
	scoreevents = function_3cbc4c6c(attackerweapon.var_2e4a8800);
	if((isdefined(weapon.var_60a9eae7) ? weapon.var_60a9eae7 : 0) && isdefined(scoreevents.var_a6bfdc5f))
	{
		if(isdefined(time))
		{
			if(!isdefined(time.var_37850de1) || ![[time.var_37850de1]](self, weapon, attackerweapon, var_67660cb2))
			{
				return;
			}
		}
		self function_662aaa65(attackerweapon);
		self.multikills[attackerweapon.name].objectivekills++;
		if(isdefined(scoreevents.var_a6bfdc5f))
		{
			scoreevents::processscoreevent(scoreevents.var_a6bfdc5f, self, weapon, attackerweapon);
		}
	}
	else
	{
		if(isdefined(time))
		{
			if(!isdefined(time.kill_callback) || ![[time.kill_callback]](self, weapon, attackerweapon, var_67660cb2, meansofdeath))
			{
				return;
			}
		}
		if(isdefined(scoreevents.var_170b3630))
		{
			scoreevents::processscoreevent(scoreevents.var_170b3630, self, weapon, attackerweapon);
		}
	}
	function_bac4b0de(scoreevents, attackerweapon);
}

/*
	Name: function_5829abe3
	Namespace: globallogic_score
	Checksum: 0x2226DD5A
	Offset: 0xAA0
	Size: 0x2C4
	Parameters: 3
	Flags: Linked
*/
function function_5829abe3(attacker, weapon, var_651b6171)
{
	if(!isdefined(self) || !isdefined(var_651b6171) || !isplayer(attacker))
	{
		return;
	}
	if(!isdefined(weapon))
	{
		weapon = level.weaponnone;
	}
	attacker challenges::function_24db0c33(weapon, var_651b6171);
	if(sessionmodeismultiplayergame() || sessionmodeiswarzonegame())
	{
		if(isplayer(attacker))
		{
			attacker stats::function_a431be09(weapon);
		}
	}
	if(isdefined(level.iskillstreakweapon))
	{
		if([[level.iskillstreakweapon]](weapon) || (isdefined(weapon.statname) && [[level.iskillstreakweapon]](getweapon(weapon.statname))))
		{
			weaponiskillstreak = 1;
		}
		if([[level.iskillstreakweapon]](var_651b6171))
		{
			destroyedkillstreak = 1;
		}
	}
	var_3c727edf = function_3cbc4c6c(var_651b6171.var_2e4a8800);
	if(!is_true(weaponiskillstreak) || is_true(destroyedkillstreak) && isdefined(var_3c727edf.var_3143c814) && util::function_fbce7263(attacker.team, self.team))
	{
		scoreevents::processscoreevent(var_3c727edf.var_3143c814, attacker, self, var_651b6171);
		attacker stats::function_dad108fa(#"stats_destructions", 1);
	}
	if(var_651b6171.issignatureweapon)
	{
		attacker activecamo::function_896ac347(weapon, #"showstopper", 1);
	}
	scoreevents = function_3cbc4c6c(weapon.var_2e4a8800);
	if(isdefined(scoreevents.var_84eddb70))
	{
		scoreevents::processscoreevent(scoreevents.var_84eddb70, attacker, self, weapon);
	}
}

/*
	Name: function_a890cac2
	Namespace: globallogic_score
	Checksum: 0x415387C7
	Offset: 0xD70
	Size: 0x2A4
	Parameters: 5
	Flags: Linked
*/
function function_a890cac2(attacker, owningteam, weapon, scoreevents, objectiveobj)
{
	attacker function_662aaa65(weapon);
	attacker.multikills[weapon.name].objectivekills++;
	if(level.teambased && isdefined(owningteam) && attacker.team == owningteam)
	{
		if(isdefined(level.specweapons[weapon.name].var_826b85e7))
		{
			[[level.specweapons[weapon.name].var_826b85e7]](attacker, self, weapon, objectiveobj);
		}
		if(isdefined(scoreevents.var_867de225))
		{
			scoreevents::processscoreevent(scoreevents.var_867de225, attacker, self, weapon);
		}
		if((isdefined(attacker.multikills[weapon.name].objectivekills) ? attacker.multikills[weapon.name].objectivekills : 0) > 2 && (isdefined(objectiveobj.var_4e02c9bd) ? objectiveobj.var_4e02c9bd : 0) < gettime())
		{
			enemies = attacker getenemies();
			var_f6612539 = 0;
			foreach(enemy in enemies)
			{
				if(enemy istouching(objectiveobj))
				{
					var_f6612539 = 1;
					break;
				}
			}
			if(!var_f6612539)
			{
				objectiveobj.var_4e02c9bd = gettime() + 4000;
				attacker.multikills[weapon.name].var_d6089e48 = 1;
			}
		}
	}
	if(isdefined(scoreevents.var_8600aca4))
	{
		scoreevents::processscoreevent(scoreevents.var_8600aca4, attacker, self, weapon);
	}
}

/*
	Name: function_2e33e275
	Namespace: globallogic_score
	Checksum: 0xBCF14C2D
	Offset: 0x1020
	Size: 0xCA
	Parameters: 4
	Flags: None
*/
function function_2e33e275(einflictor, attacker, weapon, var_5b1d28ec)
{
	if(!isplayer(attacker) || !isplayer(self) || !isdefined(weapon) || !isdefined(var_5b1d28ec))
	{
		return false;
	}
	if(!self istouching(var_5b1d28ec))
	{
		if(!isdefined(einflictor) || einflictor != attacker || !attacker istouching(var_5b1d28ec))
		{
			return false;
		}
	}
	return true;
}

/*
	Name: function_7d830bc
	Namespace: globallogic_score
	Checksum: 0xF22ED7BA
	Offset: 0x10F8
	Size: 0x210
	Parameters: 5
	Flags: None
*/
function function_7d830bc(einflictor, attacker, weapon, var_5b1d28ec, owningteam)
{
	attacker endon(#"disconnect", #"death");
	level endon(#"game_ended");
	self notify("1a696f65f272be70");
	self endon("1a696f65f272be70");
	self.var_60a9eae7 = 1;
	attacker.var_f46a73a1 = weapon;
	attacker.var_60f43bac = gettime();
	attacker.var_e3d30669 = var_5b1d28ec;
	scoreevents = function_3cbc4c6c(weapon.var_2e4a8800);
	self function_a890cac2(attacker, owningteam, weapon, scoreevents, var_5b1d28ec);
	if(isarray(level.specweapons))
	{
		foreach(var_25f92d1d in level.specweapons)
		{
			if(!isdefined(var_25f92d1d.var_37850de1) || ![[var_25f92d1d.var_37850de1]](attacker, self, var_25f92d1d.weapon, weapon))
			{
				continue;
			}
			var_bbe53115 = function_3cbc4c6c(var_25f92d1d.weapon.var_2e4a8800);
			self function_a890cac2(attacker, owningteam, var_25f92d1d.weapon, var_bbe53115, var_5b1d28ec);
		}
	}
}

/*
	Name: function_eced93f5
	Namespace: globallogic_score
	Checksum: 0xD95AF679
	Offset: 0x1310
	Size: 0x1D4
	Parameters: 2
	Flags: Linked, Private
*/
function private function_eced93f5(objective, var_c217216c)
{
	if(!isdefined(objective) || !isdefined(var_c217216c) || !isdefined(self.var_f46a73a1) || !isdefined(self.var_60f43bac) || !isdefined(self.var_e3d30669))
	{
		return;
	}
	if((var_c217216c - self.var_60f43bac) > (int(20 * 1000)) || objective != self.var_e3d30669)
	{
		return;
	}
	if(isarray(level.specweapons))
	{
		foreach(specialweapon in level.specweapons)
		{
			if(isdefined(specialweapon.var_d20c7012))
			{
				[[specialweapon.var_d20c7012]](self, self.var_f46a73a1, self.var_60f43bac, self.var_e3d30669, specialweapon.weapon);
			}
		}
	}
	scoreevents = function_3cbc4c6c(self.var_f46a73a1.var_2e4a8800);
	if(isdefined(scoreevents.var_1d0ab0f4))
	{
		scoreevents::processscoreevent(scoreevents.var_1d0ab0f4, self, undefined, self.var_f46a73a1);
	}
}

/*
	Name: function_3cbc4c6c
	Namespace: globallogic_score
	Checksum: 0x59864B28
	Offset: 0x14F0
	Size: 0x58
	Parameters: 1
	Flags: Linked
*/
function function_3cbc4c6c(scriptbundle)
{
	if(!isdefined(scriptbundle))
	{
		return;
	}
	if(!isdefined(level.var_e0582de1[scriptbundle]))
	{
		level.var_e0582de1[scriptbundle] = getscriptbundle(scriptbundle);
	}
	return level.var_e0582de1[scriptbundle];
}

/*
	Name: function_24d66e59
	Namespace: globallogic_score
	Checksum: 0x8A40C9CD
	Offset: 0x1550
	Size: 0x4B8
	Parameters: 8
	Flags: Linked
*/
function function_24d66e59(inflictor, meansofdeath, victim, attacker, weapon, var_bd10969, time, data)
{
	if(!isdefined(var_bd10969) || !isarray(var_bd10969))
	{
		return;
	}
	if(!isdefined(victim))
	{
		return;
	}
	foreach(effect in var_bd10969)
	{
		if(!isdefined(effect) || !isdefined(effect.var_4b22e697) || victim == effect.var_4b22e697)
		{
			continue;
		}
		scoreevents = function_3cbc4c6c(effect.var_2e4a8800);
		if(!isdefined(scoreevents))
		{
			continue;
		}
		var_183358be = 0;
		if((isdefined(victim.var_60a9eae7) ? victim.var_60a9eae7 : 0) && (isdefined(scoreevents.var_a6bfdc5f) || isdefined(scoreevents.var_8600aca4)))
		{
			attacker function_662aaa65(effect);
			attacker.multikills[effect.name].objectivekills++;
			if(isdefined(effect.var_4b22e697) && isplayer(effect.var_4b22e697) && attacker != effect.var_4b22e697)
			{
				if(isdefined(scoreevents.var_a6bfdc5f))
				{
					scoreevents::processscoreevent(scoreevents.var_a6bfdc5f, effect.var_4b22e697, victim, effect.var_3d1ed4bd);
				}
				var_183358be = 1;
			}
			else if(isdefined(scoreevents.var_8600aca4))
			{
				scoreevents::processscoreevent(scoreevents.var_8600aca4, effect.var_4b22e697, victim, effect.var_3d1ed4bd);
			}
		}
		else if(isdefined(effect.var_4b22e697) && isplayer(effect.var_4b22e697) && attacker != effect.var_4b22e697 && attacker util::isenemyplayer(effect.var_4b22e697) == 0)
		{
			baseweapon = weapons::getbaseweapon(weapon);
			if(isdefined(scoreevents.var_2eaed769) && (is_true(baseweapon.issignatureweapon) || is_true(baseweapon.var_76ce72e8)))
			{
				scoreevents::processscoreevent(scoreevents.var_2eaed769, effect.var_4b22e697, victim, effect.var_3d1ed4bd);
			}
			else if(isdefined(scoreevents.var_170b3630))
			{
				scoreevents::processscoreevent(scoreevents.var_170b3630, effect.var_4b22e697, victim, effect.var_3d1ed4bd);
			}
			var_183358be = 1;
		}
		if(var_183358be)
		{
			effect.var_4b22e697 function_bac4b0de(scoreevents, effect.var_3d1ed4bd);
		}
		if(attacker == effect.var_4b22e697)
		{
			if(isdefined(level.var_f19c99e1[effect.name].kill_callback))
			{
				if(![[level.var_f19c99e1[effect.name].kill_callback]](self, victim, effect.var_3d1ed4bd, weapon, meansofdeath))
				{
					return;
				}
			}
			updatemultikill(inflictor, meansofdeath, victim, attacker, scoreevents, effect.var_3d1ed4bd, weapon, effect, time, data);
		}
	}
}

/*
	Name: function_f7f7b14e
	Namespace: globallogic_score
	Checksum: 0x98FD2D57
	Offset: 0x1A10
	Size: 0x536
	Parameters: 1
	Flags: Linked
*/
function function_f7f7b14e(data)
{
	inflictor = data.einflictor;
	victim = data.victim;
	attacker = data.attacker;
	meansofdeath = data.smeansofdeath;
	if(!isplayer(attacker))
	{
		return;
	}
	time = data.time;
	if(!isdefined(time))
	{
		time = gettime();
	}
	weapon = level.weaponnone;
	if(isdefined(data.weapon))
	{
		weapon = data.weapon;
	}
	if(isarray(level.specweapons))
	{
		foreach(var_25f92d1d in level.specweapons)
		{
			if(isdefined(var_25f92d1d.kill_callback) && var_25f92d1d.var_358571b4 !== 1)
			{
				specweapon = var_25f92d1d.weapon;
				var_b6f366b = function_3cbc4c6c(specweapon.var_2e4a8800);
				attacker updatemultikill(inflictor, meansofdeath, victim, attacker, var_b6f366b, specweapon, weapon, specweapon, time, data);
			}
		}
	}
	attacker function_24d66e59(inflictor, meansofdeath, victim, attacker, weapon, data.var_bd10969, time, data);
	if(isdefined(data.victimweapon))
	{
		var_3d2a11cf = function_3cbc4c6c(data.victimweapon.var_2e4a8800);
		if(data.victimweapon.issignatureweapon)
		{
			attacker activecamo::function_896ac347(weapon, #"showstopper", 1);
		}
	}
	if(!isdefined(var_3d2a11cf) && isdefined(victim.heroability) && isdefined(victim.heroabilityactivatetime) && (victim.heroabilityactivatetime + 700) > time)
	{
		var_3d2a11cf = function_3cbc4c6c(victim.heroability.var_2e4a8800);
		attacker activecamo::function_896ac347(weapon, #"showstopper", 1);
	}
	if(isdefined(weapon) && isdefined(level.iskillstreakweapon))
	{
		if([[level.iskillstreakweapon]](weapon) || (isdefined(weapon.statname) && [[level.iskillstreakweapon]](getweapon(weapon.statname))))
		{
			weaponiskillstreak = 1;
		}
	}
	if(isdefined(var_3d2a11cf.var_3143c814) && !is_true(weaponiskillstreak) && (isdefined(attacker) && isdefined(victim) && util::function_fbce7263(attacker.team, victim.team)))
	{
		scoreevents::processscoreevent(var_3d2a11cf.var_3143c814, attacker, victim, weapon);
		victim.var_ad1472a2 = 1;
		attacker stats::function_dad108fa(#"stats_shutdowns", 1);
		attacker contracts::increment_contract(#"hash_26f8726bc08d080c");
	}
	baseweapon = weapons::getbaseweapon(weapon);
	attacker updatemultikill(inflictor, meansofdeath, victim, attacker, function_3cbc4c6c(weapon.var_2e4a8800), weapon, weapon, baseweapon, time, data);
	if(weapons::ismeleemod(meansofdeath))
	{
		scoreevents::function_2a2e1723(#"melee_kill", attacker, self, weapon);
		data.var_7b4d33ac = 1;
	}
	function_706caaf3(meansofdeath, attacker, victim, data.var_84f2a49b, data.var_18e4956e);
}

/*
	Name: function_706caaf3
	Namespace: globallogic_score
	Checksum: 0x16344D63
	Offset: 0x1F50
	Size: 0x17C
	Parameters: 5
	Flags: Linked
*/
function function_706caaf3(meansofdeath, executioner, victim, var_e399c155, var_ff83a430)
{
	if(meansofdeath == "MOD_EXECUTION")
	{
		scoreevents::processscoreevent(#"finishing_move_kill", executioner, victim, undefined);
		executioner contracts::increment_contract(#"hash_ba2b17c3904e2d6");
		executioner challenges::function_38ad2427(#"hash_7397ba07e9e0325d", 1);
		executioner stats::function_dad108fa(#"hash_723bd70b9a80a581", 1);
		executioner stats::function_dad108fa(#"hash_52b5cb629bbde814", 1);
		if(var_e399c155.type === #"melee")
		{
			executioner stats::function_e24eec31(var_e399c155, #"finishing_move_kill", 1);
		}
		if(var_ff83a430.type === #"melee")
		{
			executioner stats::function_e24eec31(var_ff83a430, #"finishing_move_kill", 1);
		}
	}
}

/*
	Name: function_1a0fa609
	Namespace: globallogic_score
	Checksum: 0xDFBD7E97
	Offset: 0x20D8
	Size: 0xCA
	Parameters: 1
	Flags: Linked, Private
*/
function private function_1a0fa609(data)
{
	attacker = data.attacker;
	if(!isplayer(attacker))
	{
		return;
	}
	if(data.var_7b4d33ac !== 1)
	{
		victim = data.victim;
		weapon = (isdefined(data.weapon) ? data.weapon : level.weaponnone);
		scoreevents::processscoreevent(#"ekia", attacker, victim, weapon);
		data.var_7b4d33ac = 1;
	}
}

/*
	Name: function_d68ae402
	Namespace: globallogic_score
	Checksum: 0x955DACD
	Offset: 0x21B0
	Size: 0x702
	Parameters: 8
	Flags: Linked, Private
*/
function private function_d68ae402(inflictor, meansofdeath, victim, attacker, scoreevents, weapon, var_f801f37e, time)
{
	level endon(#"game_ended");
	var_ac4c1 = var_f801f37e.name;
	attacker notify(var_ac4c1 + "MultiKillScore");
	attacker endon(var_ac4c1 + "MultiKillScore", #"disconnect");
	if(meansofdeath.var_a6b00192 >= 3 && !(isdefined(meansofdeath.var_7fff4605) ? meansofdeath.var_7fff4605 : 0))
	{
		if(isdefined(scoreevents.var_db750037))
		{
			scoreevents::processscoreevent(scoreevents.var_db750037, attacker, undefined, weapon);
		}
		meansofdeath.var_7fff4605 = 1;
	}
	if(!isdefined(attacker.multikills[var_ac4c1]))
	{
		return;
	}
	if((attacker.multikills[var_ac4c1].kills % 2) == 0)
	{
		attacker contracts::player_contract_event(#"double_kill", var_ac4c1);
	}
	waitresult = undefined;
	waitresult = attacker waittilltimeout(4, #"death", #"team_changed");
	if(var_ac4c1 == #"frag_grenade" || var_ac4c1 == #"eq_molotov" || var_ac4c1 == #"hatchet")
	{
		if(attacker.multikills[var_ac4c1].kills >= 2)
		{
			if(!isdefined(attacker.pers[#"hash_52e978325c91fe24"]))
			{
				attacker.pers[#"hash_52e978325c91fe24"] = 0;
			}
			attacker.pers[#"hash_52e978325c91fe24"]++;
			if((attacker.pers[#"hash_52e978325c91fe24"] % 2) == 0)
			{
				attacker stats::function_dad108fa(#"hash_52e978325c91fe24", 1);
			}
		}
	}
	attacker function_84088ec3(var_f801f37e);
	if(isdefined(scoreevents))
	{
		switch((isdefined(attacker.multikills[var_ac4c1].kills) ? attacker.multikills[var_ac4c1].kills : 0))
		{
			case 0:
			case 1:
			{
				break;
			}
			case 2:
			{
				if(isdefined(scoreevents.var_d58bd0e9))
				{
					scoreevents::processscoreevent(scoreevents.var_d58bd0e9, attacker, victim, weapon);
				}
				break;
			}
			case 3:
			{
				if(isdefined(scoreevents.var_6643c0a0))
				{
					scoreevents::processscoreevent(scoreevents.var_6643c0a0, attacker, victim, weapon);
				}
				break;
			}
			case 4:
			{
				if(isdefined(scoreevents.var_16abf654))
				{
					scoreevents::processscoreevent(scoreevents.var_16abf654, attacker, victim, weapon);
				}
				break;
			}
			case 5:
			{
				if(isdefined(scoreevents.var_1b8b6771))
				{
					scoreevents::processscoreevent(scoreevents.var_1b8b6771, attacker, victim, weapon);
				}
				break;
			}
			default:
			{
				if(attacker.multikills[var_ac4c1].kills > 5 && isdefined(scoreevents.var_67b4a761))
				{
					scoreevents::processscoreevent(scoreevents.var_67b4a761, attacker, victim, weapon);
				}
				break;
			}
		}
	}
	attacker.multikills[var_ac4c1].kills = 0;
	switch((isdefined(attacker.multikills[var_ac4c1].objectivekills) ? attacker.multikills[var_ac4c1].objectivekills : 0))
	{
		case 0:
		case 1:
		case 2:
		{
			break;
		}
		default:
		{
			if(attacker.multikills[var_ac4c1].objectivekills > 2)
			{
				if(isdefined(scoreevents.var_3655354))
				{
					scoreevents::processscoreevent(scoreevents.var_3655354, attacker, undefined, weapon);
				}
				if((isdefined(attacker.multikills[var_ac4c1].var_d6089e48) ? attacker.multikills[var_ac4c1].var_d6089e48 : 0))
				{
					if(isdefined(scoreevents.var_7b590f90))
					{
						scoreevents::processscoreevent(scoreevents.var_7b590f90, attacker, undefined, weapon);
						attacker.multikills[var_ac4c1].var_d6089e48 = 0;
					}
					if(isarray(level.specweapons))
					{
						foreach(var_25f92d1d in level.specweapons)
						{
							if(isdefined(var_25f92d1d.var_34f2424e))
							{
								[[var_25f92d1d.var_34f2424e]](attacker, time, weapon, var_25f92d1d.weapon);
							}
						}
					}
				}
			}
			break;
		}
	}
	attacker.multikills[var_ac4c1].objectivekills = 0;
}

/*
	Name: updatemultikill
	Namespace: globallogic_score
	Checksum: 0x9DA803D4
	Offset: 0x28C0
	Size: 0x53C
	Parameters: 10
	Flags: Linked, Private
*/
function private updatemultikill(inflictor, meansofdeath, victim, attacker, scoreevents, weapon, attackerweapon, var_f801f37e, time, data)
{
	self function_662aaa65(var_f801f37e);
	if(!isdefined(inflictor))
	{
		inflictor = attacker;
	}
	var_25f92d1d = level.specweapons[var_f801f37e.name];
	if(isdefined(var_25f92d1d.kill_callback))
	{
		if(![[level.specweapons[var_f801f37e.name].kill_callback]](self, victim, weapon, attackerweapon, meansofdeath))
		{
			return;
		}
		if(isdefined(var_25f92d1d.var_90e3cfd7))
		{
			[[var_25f92d1d.var_90e3cfd7]](attacker, time, weapon, var_25f92d1d.weapon, (isdefined(victim.var_60a9eae7) ? victim.var_60a9eae7 : 0));
		}
		if(isdefined(var_25f92d1d.var_73c59759))
		{
			self stats::function_dad108fa(var_25f92d1d.var_73c59759, 1);
		}
		if(isdefined(var_25f92d1d.var_83a750f3))
		{
			self stats::function_dad108fa(var_25f92d1d.var_83a750f3, 1);
		}
		if(isdefined(var_25f92d1d.var_cd17d10d))
		{
			self challenges::function_38ad2427(var_25f92d1d.var_cd17d10d, 1);
		}
		if(isdefined(var_25f92d1d.var_6e409d37))
		{
			self stats::function_dad108fa(var_25f92d1d.var_6e409d37, 1);
		}
		if(isdefined(var_25f92d1d.var_9010d9f6) && attackerweapon !== level.weaponnone)
		{
			self stats::function_e24eec31(attackerweapon, var_25f92d1d.var_9010d9f6, 1);
		}
	}
	if(isdefined(scoreevents.var_2ecceeab) && (!(isdefined(victim.var_60a9eae7) ? victim.var_60a9eae7 : 0) || !isdefined(scoreevents.var_8600aca4)))
	{
		scoreevents::function_2a2e1723(scoreevents.var_2ecceeab, attacker, victim, attackerweapon);
		data.var_7b4d33ac = scoreevents.var_6913f911 === 1;
	}
	self function_1f664cea(scoreevents, weapon);
	if(isdefined(scoreevents.var_2892e164) || isdefined(var_25f92d1d.var_ec2a6a4c))
	{
		if(level.teambased && isdefined(victim.damagedplayers))
		{
			foreach(entitydamaged in victim.damagedplayers)
			{
				if(!isdefined(entitydamaged.entity) || entitydamaged.entity == attacker || attacker util::isenemyplayer(entitydamaged.entity) || !isdefined(entitydamaged.time))
				{
					continue;
				}
				if(time - entitydamaged.time < 1000)
				{
					if(isdefined(var_25f92d1d.var_ec2a6a4c))
					{
						[[var_25f92d1d.var_ec2a6a4c]](attacker, victim, entitydamaged.entity, time, weapon, var_25f92d1d.weapon);
					}
					if(isdefined(scoreevents.var_2892e164))
					{
						scoreevents::processscoreevent(scoreevents.var_2892e164, attacker, victim, weapon);
					}
				}
			}
		}
	}
	self.multikills[var_f801f37e.name].kills++;
	if(isdefined(scoreevents.var_d58bd0e9) && self.multikills[var_f801f37e.name].kills > 1)
	{
		scoreevents::function_644d867a(self, time, scoreevents.var_d58bd0e9 + "_nostat");
	}
	if(!isdefined(inflictor.var_a6b00192))
	{
		inflictor.var_a6b00192 = 0;
	}
	inflictor.var_a6b00192++;
	self thread function_d68ae402(inflictor, meansofdeath, victim, self, scoreevents, weapon, var_f801f37e, time);
}

/*
	Name: function_1f664cea
	Namespace: globallogic_score
	Checksum: 0xD16FA4AD
	Offset: 0x2E08
	Size: 0x25C
	Parameters: 2
	Flags: Linked
*/
function function_1f664cea(scoreevents, weapon)
{
	if(scoreevents.var_4f57d8be === 1 && (sessionmodeismultiplayergame() || sessionmodeiswarzonegame()))
	{
		var_ccec6846 = (isdefined(scoreevents.var_c2dbdf39) ? scoreevents.var_c2dbdf39 : "kills");
		statweapon = stats::function_a2261724(weapon);
		var_a3884983 = self loadout::function_8435f729(statweapon);
		if(var_a3884983 === "primarygrenade" || var_a3884983 === "secondarygrenade" || var_a3884983 === "specialgrenade")
		{
			weaponname = stats::function_3f64434(statweapon);
			self stats::function_622feb0d(weaponname, var_ccec6846, 1);
			self stats::function_6fb0b113(weaponname, #"hash_37c6a5ea231ad08" + var_ccec6846);
		}
		else
		{
			if(isdefined(level.iskillstreakweapon) && [[level.iskillstreakweapon]](statweapon) && isdefined(level.get_killstreak_for_weapon_for_stats))
			{
				killstreak = [[level.get_killstreak_for_weapon_for_stats]](statweapon);
				self stats::function_8fb23f94(killstreak, var_ccec6846, 1);
				self stats::function_b04e7184(killstreak, #"hash_37c6a5ea231ad08" + var_ccec6846);
			}
			else
			{
				self stats::function_561716e6(statweapon.name, var_ccec6846, 1);
				self stats::function_80099ca1(statweapon.name, #"hash_37c6a5ea231ad08" + var_ccec6846);
			}
		}
	}
}

/*
	Name: function_bac4b0de
	Namespace: globallogic_score
	Checksum: 0xCDDCE829
	Offset: 0x3070
	Size: 0x25C
	Parameters: 2
	Flags: Linked
*/
function function_bac4b0de(scoreevents, weapon)
{
	if(scoreevents.var_4f57d8be === 1 && (sessionmodeismultiplayergame() || sessionmodeiswarzonegame()))
	{
		var_601e335c = (isdefined(scoreevents.var_f23a2b7c) ? scoreevents.var_f23a2b7c : "assists");
		statweapon = stats::function_a2261724(weapon);
		var_a3884983 = self loadout::function_8435f729(statweapon);
		if(var_a3884983 === "primarygrenade" || var_a3884983 === "secondarygrenade" || var_a3884983 === "specialgrenade")
		{
			weaponname = stats::function_3f64434(statweapon);
			self stats::function_622feb0d(weaponname, var_601e335c, 1);
			self stats::function_6fb0b113(weaponname, #"hash_37c6a5ea231ad08" + var_601e335c);
		}
		else
		{
			if(isdefined(level.iskillstreakweapon) && [[level.iskillstreakweapon]](statweapon) && isdefined(level.get_killstreak_for_weapon_for_stats))
			{
				killstreak = [[level.get_killstreak_for_weapon_for_stats]](statweapon);
				self stats::function_8fb23f94(killstreak, var_601e335c, 1);
				self stats::function_b04e7184(killstreak, #"hash_37c6a5ea231ad08" + var_601e335c);
			}
			else
			{
				self stats::function_561716e6(statweapon.name, var_601e335c, 1);
				self stats::function_80099ca1(statweapon.name, #"hash_37c6a5ea231ad08" + var_601e335c);
			}
		}
	}
}

/*
	Name: function_84088ec3
	Namespace: globallogic_score
	Checksum: 0x73FEDF30
	Offset: 0x32D8
	Size: 0x262
	Parameters: 1
	Flags: Linked
*/
function function_84088ec3(var_f801f37e)
{
	if(sessionmodeismultiplayergame() || sessionmodeiswarzonegame() && self.multikills[var_f801f37e.name].kills >= 2)
	{
		if(isweapon(var_f801f37e) && isdefined(level.iskillstreakweapon) && [[level.iskillstreakweapon]](var_f801f37e) && isdefined(level.get_killstreak_for_weapon_for_stats))
		{
			killstreak = [[level.get_killstreak_for_weapon_for_stats]](var_f801f37e);
			self stats::function_8fb23f94(killstreak, #"hash_7bf29fa438d54aad", 1);
		}
		else
		{
			switch(var_f801f37e.name)
			{
				case "gadget_supplypod":
				case "nightingale":
				case "frag_grenade":
				case "land_mine":
				case "gadget_jammer":
				case "tear_gas":
				case "eq_molotov":
				case "satchel_charge":
				{
					self stats::function_622feb0d(var_f801f37e.name, #"hash_7bf29fa438d54aad", 1);
					break;
				}
				case "hash_1527a22d8a6fdc21":
				{
					self stats::function_622feb0d(#"eq_slow_grenade", #"hash_7bf29fa438d54aad", 1);
					break;
				}
				case "hash_4d25a4e985df5d5b":
				{
					self stats::function_622feb0d(#"eq_flash_grenade", #"hash_7bf29fa438d54aad", 1);
					break;
				}
				default:
				{
					break;
				}
			}
		}
	}
}

/*
	Name: function_662aaa65
	Namespace: globallogic_score
	Checksum: 0x432D1EB6
	Offset: 0x3548
	Size: 0x94
	Parameters: 1
	Flags: Linked
*/
function function_662aaa65(var_f801f37e)
{
	if(!isdefined(self.multikills))
	{
		self.multikills = [];
	}
	if(isdefined(var_f801f37e) && !isdefined(self.multikills[var_f801f37e.name]))
	{
		struct = spawnstruct();
		struct.kills = 0;
		struct.objectivekills = 0;
		self.multikills[var_f801f37e.name] = struct;
	}
}

/*
	Name: function_1f9441d7
	Namespace: globallogic_score
	Checksum: 0xFD898040
	Offset: 0x35E8
	Size: 0xA2
	Parameters: 1
	Flags: Linked
*/
function function_1f9441d7(weapon)
{
	if(!isdefined(level.specweapons))
	{
		level.specweapons = [];
	}
	if(!isdefined(level.specweapons[weapon.name]))
	{
		level.specweapons[weapon.name] = spawnstruct();
	}
	if(!isdefined(level.specweapons[weapon.name].weapon))
	{
		level.specweapons[weapon.name].weapon = weapon;
	}
}

/*
	Name: function_5a241bd8
	Namespace: globallogic_score
	Checksum: 0x86B4D163
	Offset: 0x3698
	Size: 0x72
	Parameters: 3
	Flags: Linked
*/
function function_5a241bd8(weapon, callback, var_358571b4)
{
	function_1f9441d7(weapon);
	level.specweapons[weapon.name].kill_callback = callback;
	level.specweapons[weapon.name].var_358571b4 = var_358571b4;
}

/*
	Name: function_a458dbe1
	Namespace: globallogic_score
	Checksum: 0x648EA5C2
	Offset: 0x3718
	Size: 0x82
	Parameters: 2
	Flags: None
*/
function function_a458dbe1(status_effect_name, callback)
{
	if(!isdefined(level.var_f19c99e1))
	{
		level.var_f19c99e1 = [];
	}
	if(!isdefined(level.var_f19c99e1[status_effect_name]))
	{
		level.var_f19c99e1[status_effect_name] = spawnstruct();
	}
	level.var_f19c99e1[status_effect_name].kill_callback = callback;
}

/*
	Name: function_86f90713
	Namespace: globallogic_score
	Checksum: 0xBAD81CFD
	Offset: 0x37A8
	Size: 0x4A
	Parameters: 2
	Flags: None
*/
function function_86f90713(weapon, callback)
{
	function_1f9441d7(weapon);
	level.specweapons[weapon.name].var_37850de1 = callback;
}

/*
	Name: function_82fb1afa
	Namespace: globallogic_score
	Checksum: 0x7C8AA47B
	Offset: 0x3800
	Size: 0x4A
	Parameters: 2
	Flags: None
*/
function function_82fb1afa(weapon, callback)
{
	function_1f9441d7(weapon);
	level.specweapons[weapon.name].var_d20c7012 = callback;
}

/*
	Name: function_2b2c09db
	Namespace: globallogic_score
	Checksum: 0xE1E1C322
	Offset: 0x3858
	Size: 0x4A
	Parameters: 2
	Flags: None
*/
function function_2b2c09db(weapon, callback)
{
	function_1f9441d7(weapon);
	level.specweapons[weapon.name].var_ec2a6a4c = callback;
}

/*
	Name: function_5b0c227a
	Namespace: globallogic_score
	Checksum: 0xCD1FF44D
	Offset: 0x38B0
	Size: 0x4A
	Parameters: 2
	Flags: None
*/
function function_5b0c227a(weapon, callback)
{
	function_1f9441d7(weapon);
	level.specweapons[weapon.name].var_34f2424e = callback;
}

/*
	Name: function_b150f9ac
	Namespace: globallogic_score
	Checksum: 0x4E09A3BF
	Offset: 0x3908
	Size: 0x4A
	Parameters: 2
	Flags: None
*/
function function_b150f9ac(weapon, callback)
{
	function_1f9441d7(weapon);
	level.specweapons[weapon.name].var_826b85e7 = callback;
}

/*
	Name: function_c1e9b86b
	Namespace: globallogic_score
	Checksum: 0x747FA9E6
	Offset: 0x3960
	Size: 0x4A
	Parameters: 2
	Flags: Linked
*/
function function_c1e9b86b(weapon, callback)
{
	function_1f9441d7(weapon);
	level.specweapons[weapon.name].var_90e3cfd7 = callback;
}

/*
	Name: function_78aac1c6
	Namespace: globallogic_score
	Checksum: 0x7B9D88AC
	Offset: 0x39B8
	Size: 0x4A
	Parameters: 2
	Flags: None
*/
function function_78aac1c6(weapon, var_73c59759)
{
	function_1f9441d7(weapon);
	level.specweapons[weapon.name].var_73c59759 = var_73c59759;
}

/*
	Name: function_31bde79e
	Namespace: globallogic_score
	Checksum: 0x9734C17A
	Offset: 0x3A10
	Size: 0x4A
	Parameters: 2
	Flags: Linked
*/
function function_31bde79e(weapon, var_73c59759)
{
	function_1f9441d7(weapon);
	level.specweapons[weapon.name].var_83a750f3 = var_73c59759;
}

/*
	Name: function_affa83aa
	Namespace: globallogic_score
	Checksum: 0x22A549A8
	Offset: 0x3A68
	Size: 0x4A
	Parameters: 2
	Flags: None
*/
function function_affa83aa(weapon, var_cd17d10d)
{
	function_1f9441d7(weapon);
	level.specweapons[weapon.name].var_cd17d10d = var_cd17d10d;
}

/*
	Name: function_889c9d13
	Namespace: globallogic_score
	Checksum: 0xAA05F895
	Offset: 0x3AC0
	Size: 0x4A
	Parameters: 2
	Flags: None
*/
function function_889c9d13(weapon, var_6e409d37)
{
	function_1f9441d7(weapon);
	level.specweapons[weapon.name].var_6e409d37 = var_6e409d37;
}

/*
	Name: function_b498acdc
	Namespace: globallogic_score
	Checksum: 0x99BC546B
	Offset: 0x3B18
	Size: 0x4A
	Parameters: 2
	Flags: None
*/
function function_b498acdc(weapon, var_9010d9f6)
{
	function_1f9441d7(weapon);
	level.specweapons[weapon.name].var_9010d9f6 = var_9010d9f6;
}

/*
	Name: function_d3ca3608
	Namespace: globallogic_score
	Checksum: 0xB48195C0
	Offset: 0x3B70
	Size: 0x18E
	Parameters: 1
	Flags: Linked
*/
function function_d3ca3608(eventname)
{
	/#
		assert(isdefined(eventname));
	#/
	if(!isdefined(level.scoreinfo[eventname]) || !isdefined(self) || !isplayer(self))
	{
		return;
	}
	/#
		if(getdvarint(#"logscoreevents", 0) > 0)
		{
			if(!isdefined(level.var_10cd7193))
			{
				level.var_10cd7193 = [];
			}
			eventstr = (ishash(eventname) ? function_9e72a96(eventname) : eventname);
			if(!isdefined(level.var_10cd7193))
			{
				level.var_10cd7193 = [];
			}
			else if(!isarray(level.var_10cd7193))
			{
				level.var_10cd7193 = array(level.var_10cd7193);
			}
			level.var_10cd7193[level.var_10cd7193.size] = eventstr;
		}
	#/
	eventindex = level.scoreinfo[eventname][#"row"];
}

/*
	Name: function_61254438
	Namespace: globallogic_score
	Checksum: 0x59E0A5FB
	Offset: 0x3D08
	Size: 0x5C
	Parameters: 1
	Flags: Linked
*/
function function_61254438(weapon)
{
	var_8725a10d = function_3cbc4c6c(weapon.var_2e4a8800);
	if(!isdefined(var_8725a10d.var_14d1d5a1))
	{
		return;
	}
	self function_d3ca3608(var_8725a10d.var_14d1d5a1);
}

/*
	Name: allow_old_indexs
	Namespace: globallogic_score
	Checksum: 0xF1A0F101
	Offset: 0x3D70
	Size: 0x5C
	Parameters: 1
	Flags: Linked
*/
function allow_old_indexs(var_8d498080)
{
	var_8725a10d = function_3cbc4c6c(var_8d498080.var_2e4a8800);
	if(!isdefined(var_8725a10d.var_14d1d5a1))
	{
		return;
	}
	self function_d3ca3608(var_8725a10d.var_14d1d5a1);
}

/*
	Name: function_bb9f3842
	Namespace: globallogic_score
	Checksum: 0xC3039404
	Offset: 0x3DD8
	Size: 0x22E
	Parameters: 0
	Flags: None
*/
function function_bb9f3842()
{
	/#
		level endon(#"game_ended");
		if(!isdefined(level.var_10cd7193))
		{
			level.var_10cd7193 = [];
		}
		while(true)
		{
			if(getdvarint(#"dumpscoreevents", 0) > 0)
			{
				var_594354f3 = [];
				foreach(scoreevent in level.var_10cd7193)
				{
					if(!isdefined(var_594354f3[scoreevent]))
					{
						var_594354f3[scoreevent] = 0;
					}
					var_594354f3[scoreevent]++;
				}
				println("");
				foreach(var_d975dd49 in getarraykeys(var_594354f3))
				{
					count = var_594354f3[var_d975dd49];
					println((var_d975dd49 + "") + (isdefined(count) ? "" + count : ""));
				}
				println("");
				setdvar(#"dumpscoreevents", 0);
			}
			waitframe(1);
		}
	#/
}

