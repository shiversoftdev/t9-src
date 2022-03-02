#using script_47fb62300ac0bd60;
#using script_68d2ee1489345a1d;
#using script_7a8059ca02b7b09e;
#using script_bc839bb0e693558;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\contracts_shared.gsc;
#using scripts\core_common\rank_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace scoreevents_shared;

/*
	Name: function_861ed3cf
	Namespace: scoreevents_shared
	Checksum: 0xCCFEB987
	Offset: 0x178
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_861ed3cf()
{
	level notify(417698731);
}

#namespace scoreevents;

/*
	Name: registerscoreeventcallback
	Namespace: scoreevents
	Checksum: 0xD1A072D7
	Offset: 0x198
	Size: 0xF2
	Parameters: 2
	Flags: Linked
*/
function registerscoreeventcallback(callback, func)
{
	if(!isdefined(level.scoreeventcallbacks))
	{
		level.scoreeventcallbacks = [];
	}
	if(!isdefined(level.scoreeventcallbacks[callback]))
	{
		level.scoreeventcallbacks[callback] = [];
	}
	if(!isdefined(level.scoreeventcallbacks[callback]))
	{
		level.scoreeventcallbacks[callback] = [];
	}
	else if(!isarray(level.scoreeventcallbacks[callback]))
	{
		level.scoreeventcallbacks[callback] = array(level.scoreeventcallbacks[callback]);
	}
	level.scoreeventcallbacks[callback][level.scoreeventcallbacks[callback].size] = func;
}

/*
	Name: function_9677601b
	Namespace: scoreevents
	Checksum: 0x2D46CCC5
	Offset: 0x298
	Size: 0xF2
	Parameters: 2
	Flags: Linked
*/
function function_9677601b(callback, func)
{
	if(!isdefined(level.var_8c00e05d))
	{
		level.var_8c00e05d = [];
	}
	if(!isdefined(level.var_8c00e05d[callback]))
	{
		level.var_8c00e05d[callback] = [];
	}
	if(!isdefined(level.var_8c00e05d[callback]))
	{
		level.var_8c00e05d[callback] = [];
	}
	else if(!isarray(level.var_8c00e05d[callback]))
	{
		level.var_8c00e05d[callback] = array(level.var_8c00e05d[callback]);
	}
	level.var_8c00e05d[callback][level.var_8c00e05d[callback].size] = func;
}

/*
	Name: function_6f51d1e9
	Namespace: scoreevents
	Checksum: 0x7E34805A
	Offset: 0x398
	Size: 0xC0
	Parameters: 4
	Flags: None
*/
function function_6f51d1e9(event, players, victim, weapon)
{
	if(!isdefined(players))
	{
		return;
	}
	foreach(player in players)
	{
		if(!isdefined(player))
		{
			continue;
		}
		processscoreevent(event, player, victim, weapon);
	}
}

/*
	Name: function_2a2e1723
	Namespace: scoreevents
	Checksum: 0xC76EC1B
	Offset: 0x460
	Size: 0x7E
	Parameters: 4
	Flags: Linked
*/
function function_2a2e1723(event, player, victim, weapon)
{
	scoregiven = processscoreevent(event, player, victim, weapon, undefined, undefined, undefined, 1);
	if(isdefined(victim.var_1318544a))
	{
		victim.var_1318544a.var_7b4d33ac = 1;
	}
	return scoregiven;
}

/*
	Name: processscoreevent
	Namespace: scoreevents
	Checksum: 0x52451471
	Offset: 0x4E8
	Size: 0x8B0
	Parameters: 8
	Flags: Linked
*/
function processscoreevent(event, player, victim, weapon, var_36f23f1f, var_dbaa74e2, var_28e349dc, var_6d2812ce)
{
	scoregiven = 0;
	if(is_true(victim.var_12745932))
	{
		return scoregiven;
	}
	if(isdefined(level.scoreinfo[event]) && is_true(level.scoreinfo[event][#"hash_7b64eabf26f777c7"]))
	{
		return scoregiven;
	}
	if(is_true(level.var_64ce2685))
	{
		return scoregiven;
	}
	if(!isplayer(player))
	{
		return scoregiven;
	}
	pixbeginevent();
	isscoreevent = 0;
	/#
		if(getdvarint(#"hash_39060c853726e6c0", 0) > 0)
		{
			if(!isdefined(level.var_10cd7193))
			{
				level.var_10cd7193 = [];
			}
			eventstr = (function_7a600918(event) ? function_9e72a96(event) : event);
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
	if(isdefined(level.challengesoneventreceived))
	{
		player thread [[level.challengesoneventreceived]](event);
	}
	if(isdefined(level.var_6c0f31f5))
	{
		params = {};
		params.event = event;
		params.victim = victim;
		player [[level.var_6c0f31f5]](params);
	}
	if(isregisteredevent(event))
	{
		if(isdefined(level.scoreongiveplayerscore) && !is_true(var_28e349dc))
		{
			scoregiven = [[level.scoreongiveplayerscore]](event, player, victim, undefined, weapon, var_36f23f1f, var_dbaa74e2);
			if(scoregiven > 0)
			{
				player ability_power::power_gain_event_score(event, victim, scoregiven, weapon);
			}
		}
	}
	if(shouldaddrankxp(player) && (!isdefined(victim) || !is_true(victim.disable_score_events)))
	{
		pickedup = isdefined(player.pickedupweapons[weapon]);
		xp_difficulty_multiplier = 1;
		var_50e404bf = 1;
		if(isdefined(level.var_3426461d))
		{
			xp_difficulty_multiplier = player [[level.var_3426461d]](event);
		}
		if(isdefined(level.var_2f528eb0))
		{
			var_50e404bf = player [[level.var_2f528eb0]](event);
		}
		var_6b09455c = undefined;
		if(var_6d2812ce === 1 && isdefined(level.var_e7152385))
		{
			var_6b09455c = [[level.var_e7152385]]({#victim:victim});
		}
		if(isdefined(weapon) && !pickedup)
		{
			weaponitemindex = getbaseweaponitemindex(weapon);
			var_38f824bb = (isdefined(player function_5ab9855c(weaponitemindex)) ? player function_5ab9855c(weaponitemindex) : 0);
		}
		player addrankxp(event, 0, weapon, player.class_num, pickedup, xp_difficulty_multiplier, var_6b09455c, var_50e404bf);
		if(isdefined(weapon) && !pickedup)
		{
			var_8e0fb6fa = (isdefined(player function_5ab9855c(weaponitemindex)) ? player function_5ab9855c(weaponitemindex) : 0);
			var_de0c8b34 = var_8e0fb6fa - var_38f824bb;
			if(var_de0c8b34 > 0)
			{
				level thread telemetry::function_18135b72(#"hash_b88b6d2e0028e13", {#weaponpickedup:pickedup, #value:var_de0c8b34, #statname:#"xpearned", #weapon:weapon, #player:player});
			}
		}
		if(level.hardcoremode && isdefined(level.var_c26a3a23[event]))
		{
			player stats::function_dad108fa(level.var_c26a3a23[event], 1);
		}
		if(isdefined(weapon) && isdefined(level.scoreinfo[event]))
		{
			var_6d1793bb = level.scoreinfo[event][#"hash_17ffe407dca54dd7"];
			if(isdefined(var_6d1793bb))
			{
				specialistindex = player getspecialistindex();
				medalname = function_dcad256c(specialistindex, currentsessionmode(), 0);
				if(medalname == var_6d1793bb)
				{
					player.pers["ability_medal_count" + specialistindex] = (isdefined(player.pers["ability_medal_count" + specialistindex]) ? player.pers["ability_medal_count" + specialistindex] : 0) + 1;
				}
				medalname = function_dcad256c(specialistindex, currentsessionmode(), 1);
				if(medalname == var_6d1793bb)
				{
					player.pers["equipment_medal_count" + specialistindex] = (isdefined(player.pers["equipment_medal_count" + specialistindex]) ? player.pers["equipment_medal_count" + specialistindex] : 0) + 1;
				}
			}
		}
	}
	pixendevent();
	if(sessionmodeiscampaigngame() && isdefined(xp_difficulty_multiplier))
	{
		if(isdefined(victim) && isdefined(victim.team))
		{
			if(victim.team == #"axis" || victim.team == #"team3")
			{
				scoregiven = scoregiven * xp_difficulty_multiplier;
			}
		}
	}
	if(isdefined(victim.deathtime))
	{
		time = victim.deathtime;
	}
	function_644d867a(player, time, event, weapon);
	return scoregiven;
}

/*
	Name: doscoreeventcallback
	Namespace: scoreevents
	Checksum: 0xE7CE0E0F
	Offset: 0xDA0
	Size: 0x6E
	Parameters: 2
	Flags: Linked
*/
function doscoreeventcallback(callback, data)
{
	function_e4171c51(callback, data);
	function_32358e67(callback, data);
	if(isdefined(data.victim.var_1318544a))
	{
		data.victim.var_1318544a = undefined;
	}
}

/*
	Name: function_e4171c51
	Namespace: scoreevents
	Checksum: 0xF9B0DBCC
	Offset: 0xE18
	Size: 0x70
	Parameters: 2
	Flags: Linked, Private
*/
function private function_e4171c51(callback, data)
{
	if(!isdefined(level.scoreeventcallbacks[callback]))
	{
		return;
	}
	for(i = 0; i < level.scoreeventcallbacks[callback].size; i++)
	{
		thread [[level.scoreeventcallbacks[callback][i]]](data);
	}
}

/*
	Name: function_32358e67
	Namespace: scoreevents
	Checksum: 0xC9E498E5
	Offset: 0xE90
	Size: 0x70
	Parameters: 2
	Flags: Linked, Private
*/
function private function_32358e67(callback, data)
{
	if(!isdefined(level.var_8c00e05d[callback]))
	{
		return;
	}
	for(i = 0; i < level.var_8c00e05d[callback].size; i++)
	{
		thread [[level.var_8c00e05d[callback][i]]](data);
	}
}

/*
	Name: shouldaddrankxp
	Namespace: scoreevents
	Checksum: 0xA3065416
	Offset: 0xF08
	Size: 0x15E
	Parameters: 1
	Flags: Linked
*/
function shouldaddrankxp(player)
{
	if(level.gametype == "fr")
	{
		return false;
	}
	if(level.gametype == "zclassic" && is_true(level.var_5164a0ca))
	{
		return false;
	}
	if(is_true(level.var_4f654f3a))
	{
		/#
			playername = "";
			if(isdefined(player) && isdefined(player.name))
			{
				playername = player.name;
			}
			println("" + playername);
		#/
		return false;
	}
	if(!isdefined(level.rankcap) || level.rankcap == 0)
	{
		return true;
	}
	if(player.pers[#"plevel"] > 0 || player.pers[#"rank"] >= level.rankcap)
	{
		return false;
	}
	return true;
}

/*
	Name: uninterruptedobitfeedkills
	Namespace: scoreevents
	Checksum: 0xD17D6A58
	Offset: 0x1070
	Size: 0xC4
	Parameters: 2
	Flags: None
*/
function uninterruptedobitfeedkills(attacker, weapon)
{
	self endon(#"disconnect");
	wait(0.1);
	util::waittillslowprocessallowed();
	wait(0.1);
	if(isdefined(attacker))
	{
		processscoreevent(#"uninterrupted_obit_feed_kills", attacker, self, weapon);
		attacker contracts::function_a54e2068(#"hash_2e97dac7aef215da");
		attacker stats::function_dad108fa(#"hash_3b7d759c8864b5d8", 1);
	}
}

/*
	Name: function_c046c773
	Namespace: scoreevents
	Checksum: 0xE4EE4400
	Offset: 0x1140
	Size: 0x64
	Parameters: 5
	Flags: None
*/
function function_c046c773(waitduration, event, player, victim, weapon)
{
	self endon(#"disconnect");
	wait(waitduration);
	processscoreevent(event, player, victim, weapon);
}

/*
	Name: isregisteredevent
	Namespace: scoreevents
	Checksum: 0xE2F31E8E
	Offset: 0x11B0
	Size: 0x2E
	Parameters: 1
	Flags: Linked
*/
function isregisteredevent(type)
{
	if(isdefined(level.scoreinfo[type]))
	{
		return true;
	}
	return false;
}

/*
	Name: decrementlastobituaryplayercountafterfade
	Namespace: scoreevents
	Checksum: 0x37B18A78
	Offset: 0x11E8
	Size: 0x4C
	Parameters: 0
	Flags: None
*/
function decrementlastobituaryplayercountafterfade()
{
	level endon(#"reset_obituary_count");
	wait(5);
	level.lastobituaryplayercount--;
	/#
		assert(level.lastobituaryplayercount >= 0);
	#/
}

/*
	Name: function_2b96d7dc
	Namespace: scoreevents
	Checksum: 0x6612D714
	Offset: 0x1240
	Size: 0x122
	Parameters: 0
	Flags: Linked
*/
function function_2b96d7dc()
{
	if(!isdefined(level.var_d1455682))
	{
		return undefined;
	}
	table_name = function_6a9e36d6();
	if(!isdefined(table_name))
	{
		return undefined;
	}
	args = strtok(table_name, "\\");
	if(args.size)
	{
		table_name = "";
		foreach(arg in args)
		{
			table_name = table_name + arg;
			if(index < args.size - 1)
			{
				table_name = table_name + ("/");
			}
		}
	}
	return hash(table_name);
}

/*
	Name: getscoreeventtablename
	Namespace: scoreevents
	Checksum: 0x42940C73
	Offset: 0x1370
	Size: 0x228
	Parameters: 1
	Flags: Linked
*/
function getscoreeventtablename(gametype)
{
	table_name = function_2b96d7dc();
	if(isdefined(table_name) && is_true(isassetloaded("stringtable", table_name)))
	{
		return table_name;
	}
	if(!isdefined(gametype))
	{
		gametype = "base";
	}
	prefix = #"hash_44588d37c7fe1bf3";
	if(sessionmodeiscampaigngame())
	{
		prefix = #"hash_3bebadbc9db1102b";
	}
	else
	{
		if(sessionmodeiszombiesgame())
		{
			prefix = #"hash_5f114025234e912f";
		}
		else if(function_f99d2668())
		{
			prefix = #"hash_2bedaa060f1bcc0f";
		}
	}
	gametype = function_ea13f55(gametype, "_hc", "");
	gametype = function_ea13f55(gametype, "_cdl", "");
	gametype = function_ea13f55(gametype, "_bb", "");
	tablename = ((prefix + "_") + gametype) + ".csv";
	if(!is_true(isassetloaded("stringtable", tablename)))
	{
		tablename = prefix + "_base.csv";
	}
	if(is_true(isassetloaded("stringtable", tablename)))
	{
		return tablename;
	}
	return tablename;
}

/*
	Name: getscoreeventtableid
	Namespace: scoreevents
	Checksum: 0xBD9C5488
	Offset: 0x15A0
	Size: 0xE8
	Parameters: 1
	Flags: None
*/
function getscoreeventtableid(gametype)
{
	scoreinfotableloaded = 0;
	tablename = getscoreeventtablename(gametype);
	scoreinfotableid = tablelookupfindcoreasset(tablename);
	if(!isdefined(scoreinfotableid))
	{
		tablelookupfindcoreasset(getscoreeventtablename("base"));
	}
	if(isdefined(scoreinfotableid))
	{
		scoreinfotableloaded = 1;
	}
	/#
		assert(scoreinfotableloaded, "" + function_9e72a96(getscoreeventtablename()));
	#/
	return scoreinfotableid;
}

/*
	Name: givecratecapturemedal
	Namespace: scoreevents
	Checksum: 0x1DEAAD36
	Offset: 0x1690
	Size: 0x1DC
	Parameters: 2
	Flags: None
*/
function givecratecapturemedal(crate, capturer)
{
	if(isdefined(crate.owner) && isplayer(crate.owner))
	{
		if(level.teambased)
		{
			if(capturer.team != crate.owner.team)
			{
				crate.owner playlocalsound(#"mpl_crate_enemy_steals");
				if(!isdefined(crate.hacker))
				{
					processscoreevent(#"capture_enemy_crate", capturer, undefined, undefined);
				}
			}
			else if(isdefined(crate.owner) && capturer != crate.owner)
			{
				crate.owner playlocalsound(#"mpl_crate_friendly_steals");
				if(!isdefined(crate.hacker))
				{
					level.globalsharepackages++;
					processscoreevent(#"share_care_package", crate.owner, undefined, undefined);
				}
			}
		}
		else if(capturer != crate.owner)
		{
			crate.owner playlocalsound(#"mpl_crate_enemy_steals");
			if(!isdefined(crate.hacker))
			{
				processscoreevent(#"capture_enemy_crate", capturer, undefined, undefined);
			}
		}
	}
}

/*
	Name: register_hero_ability_kill_event
	Namespace: scoreevents
	Checksum: 0x6B0940DB
	Offset: 0x1878
	Size: 0x44
	Parameters: 1
	Flags: None
*/
function register_hero_ability_kill_event(event_func)
{
	if(!isdefined(level.hero_ability_kill_events))
	{
		level.hero_ability_kill_events = [];
	}
	level.hero_ability_kill_events[level.hero_ability_kill_events.size] = event_func;
}

/*
	Name: register_hero_ability_multikill_event
	Namespace: scoreevents
	Checksum: 0x66D160F8
	Offset: 0x18C8
	Size: 0x44
	Parameters: 1
	Flags: None
*/
function register_hero_ability_multikill_event(event_func)
{
	if(!isdefined(level.hero_ability_multikill_events))
	{
		level.hero_ability_multikill_events = [];
	}
	level.hero_ability_multikill_events[level.hero_ability_multikill_events.size] = event_func;
}

/*
	Name: register_hero_weapon_multikill_event
	Namespace: scoreevents
	Checksum: 0x915CE886
	Offset: 0x1918
	Size: 0x44
	Parameters: 1
	Flags: None
*/
function register_hero_weapon_multikill_event(event_func)
{
	if(!isdefined(level.hero_weapon_multikill_events))
	{
		level.hero_weapon_multikill_events = [];
	}
	level.hero_weapon_multikill_events[level.hero_weapon_multikill_events.size] = event_func;
}

/*
	Name: hero_ability_kill_event
	Namespace: scoreevents
	Checksum: 0xFA7E7222
	Offset: 0x1968
	Size: 0xB2
	Parameters: 2
	Flags: None
*/
function hero_ability_kill_event(ability, victim_ability)
{
	if(!isdefined(level.hero_ability_kill_events))
	{
		return;
	}
	foreach(event_func in level.hero_ability_kill_events)
	{
		if(isdefined(event_func))
		{
			self [[event_func]](ability, victim_ability);
		}
	}
}

/*
	Name: hero_ability_multikill_event
	Namespace: scoreevents
	Checksum: 0xA2AE938
	Offset: 0x1A28
	Size: 0xB2
	Parameters: 2
	Flags: None
*/
function hero_ability_multikill_event(killcount, ability)
{
	if(!isdefined(level.hero_ability_multikill_events))
	{
		return;
	}
	foreach(event_func in level.hero_ability_multikill_events)
	{
		if(isdefined(event_func))
		{
			self [[event_func]](killcount, ability);
		}
	}
}

/*
	Name: hero_weapon_multikill_event
	Namespace: scoreevents
	Checksum: 0x50DFAF38
	Offset: 0x1AE8
	Size: 0xB2
	Parameters: 2
	Flags: None
*/
function hero_weapon_multikill_event(killcount, weapon)
{
	if(!isdefined(level.hero_weapon_multikill_events))
	{
		return;
	}
	foreach(event_func in level.hero_weapon_multikill_events)
	{
		if(isdefined(event_func))
		{
			self [[event_func]](killcount, weapon);
		}
	}
}

/*
	Name: function_dcdf1105
	Namespace: scoreevents
	Checksum: 0x367F565D
	Offset: 0x1BA8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_dcdf1105()
{
	self callback::add_callback(#"fully_healed", &player_fully_healed);
}

/*
	Name: player_fully_healed
	Namespace: scoreevents
	Checksum: 0x4CFB9693
	Offset: 0x1BE8
	Size: 0x94
	Parameters: 0
	Flags: Linked
*/
function player_fully_healed()
{
	self.var_ae639436 = undefined;
	if(self.var_9cd2c51d.var_43797ec0 === level.var_507570e9)
	{
		var_b68a8a9f = self.health - (isdefined(self.var_9cd2c51d.var_6e219f3c) ? self.var_9cd2c51d.var_6e219f3c : 0);
		if(var_b68a8a9f > 0)
		{
			self stats::function_dad108fa(#"hash_1cd9a591d101dca", var_b68a8a9f);
		}
	}
}

/*
	Name: player_spawned
	Namespace: scoreevents
	Checksum: 0xD93CF54D
	Offset: 0x1C88
	Size: 0x10
	Parameters: 0
	Flags: None
*/
function player_spawned()
{
	self.var_ae639436 = undefined;
}

/*
	Name: function_f40d64cc
	Namespace: scoreevents
	Checksum: 0xE3344F4A
	Offset: 0x1CA0
	Size: 0xBC
	Parameters: 3
	Flags: None
*/
function function_f40d64cc(attacker, vehicle, weapon)
{
	if(!isdefined(weapon))
	{
		return;
	}
	switch(weapon.statname)
	{
		case "ultimate_turret":
		{
			event = "automated_turret_vehicle_destruction";
			break;
		}
		default:
		{
			return;
		}
	}
	victim = (isdefined(vehicle) ? vehicle.owner : undefined);
	processscoreevent(event, attacker, victim, weapon);
}

/*
	Name: function_644d867a
	Namespace: scoreevents
	Checksum: 0x64128031
	Offset: 0x1D68
	Size: 0x15E
	Parameters: 4
	Flags: Linked
*/
function function_644d867a(attacker, time, statname, weapon)
{
	var_42648a02 = level.var_42648a02[statname];
	if(isdefined(var_42648a02) && attacker.var_d853c1af !== 1)
	{
		attackerentnum = attacker getentitynumber();
		if(!isdefined(time))
		{
			time = gettime();
		}
		if(!isdefined(level.var_75aa0434[attackerentnum][statname]) || level.var_75aa0434[attackerentnum][statname] < time)
		{
			var_1215a07e = 1;
			if(isdefined(level.var_1acb0192))
			{
				var_1215a07e = [[level.var_1acb0192]](var_42648a02);
			}
			if(var_42648a02[1] * var_1215a07e > randomfloatrange(0, 1))
			{
				function_31eb1b07(attacker, statname, var_42648a02[0], var_42648a02[3], weapon);
			}
			level.var_75aa0434[attackerentnum][statname] = time + 100;
		}
	}
}

/*
	Name: function_31eb1b07
	Namespace: scoreevents
	Checksum: 0x6AF01F7
	Offset: 0x1ED0
	Size: 0x15C
	Parameters: 5
	Flags: Linked
*/
function function_31eb1b07(player, statname, var_26568428, var_cdbd6bf3, weapon)
{
	attackerentnum = player getentitynumber();
	var_46604f00 = level.var_648e79b7[attackerentnum];
	if(isdefined(var_46604f00))
	{
		var_30ffb0d9 = (isdefined(level.var_42648a02[var_46604f00.statname][0]) ? level.var_42648a02[var_46604f00.statname][0] : 0);
		if(var_26568428 >= var_30ffb0d9)
		{
			level.var_648e79b7[attackerentnum] = {#weapon:weapon, #timestamp:gettime() + var_cdbd6bf3, #statname:statname};
		}
	}
	else
	{
		level.var_648e79b7[attackerentnum] = {#weapon:weapon, #timestamp:gettime() + var_cdbd6bf3, #statname:statname};
	}
}

