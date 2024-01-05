#using scripts\mp_common\util.gsc;
#using scripts\mp_common\spawnbeacon.gsc;
#using scripts\mp_common\player\player_utils.gsc;
#using scripts\mp_common\gametypes\globallogic_utils.gsc;
#using scripts\mp_common\gametypes\globallogic_spawn.gsc;
#using scripts\mp_common\gametypes\globallogic_score.gsc;
#using scripts\mp_common\gametypes\globallogic.gsc;
#using script_1304295570304027;
#using scripts\mp_common\challenges.gsc;
#using scripts\mp_common\bb.gsc;
#using scripts\killstreaks\killstreaks_util.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using script_7a8059ca02b7b09e;
#using scripts\core_common\spawning_shared.gsc;
#using script_335d0650ed05d36d;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\globallogic\globallogic_score.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;

#namespace dom;

/*
	Name: function_e7d81be4
	Namespace: dom
	Checksum: 0x3D68FFA9
	Offset: 0x290
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_e7d81be4()
{
	level notify(-364202859);
}

/*
	Name: main
	Namespace: dom
	Checksum: 0x608B35E3
	Offset: 0x2B0
	Size: 0x154
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	globallogic::init();
	namespace_5c32f369::init();
	util::registerscorelimit(0, 2000);
	util::registerroundscorelimit(0, 2000);
	level.killstreaksgivegamescore = getgametypesetting(#"killstreaksgivegamescore");
	level.onstartgametype = &onstartgametype;
	player::function_cf3aa03d(&onplayerkilled);
	player::function_3c5cc656(&function_610d3790);
	level.onendround = &onendround;
	level.var_1aef539f = &function_a800815;
	level.var_d3a438fb = &function_d3a438fb;
	clientfield::register("scriptmover", "scriptid", 1, 5, "int");
}

/*
	Name: onstartgametype
	Namespace: dom
	Checksum: 0x279CDBAC
	Offset: 0x410
	Size: 0x29C
	Parameters: 0
	Flags: None
*/
function onstartgametype()
{
	namespace_5c32f369::onstartgametype();
	level.flagbasefxid = [];
	level thread function_873b25c7();
	foreach(capture_zone in level.domflags)
	{
		spawn_beacon::function_18f38647(capture_zone.trigger);
	}
	function_4e5d7f76();
	level.var_882f7b6a[1] = "a";
	level.var_882f7b6a[2] = "b";
	level.var_882f7b6a[3] = "c";
	level.var_882f7b6a[4] = "d";
	level.var_882f7b6a[5] = "e";
	level.var_882f7b6a[6] = "f";
	level.zones = getentarray("flag_primary", "targetname");
	foreach(zone in level.zones)
	{
		othervisuals = getentarray("dom" + level.var_882f7b6a[zone.script_index], "targetname");
		if(isdefined(zone.target2))
		{
			othervisuals = getentarray(zone.target2, "targetname");
		}
		for(j = 0; j < othervisuals.size; j++)
		{
			othervisuals[j] notsolid();
		}
	}
	level thread function_171b6c0();
}

/*
	Name: function_171b6c0
	Namespace: dom
	Checksum: 0x4FE90472
	Offset: 0x6B8
	Size: 0x148
	Parameters: 0
	Flags: None
*/
function function_171b6c0()
{
	level endon(#"game_ended");
	foreach(zone in level.zones)
	{
		othervisuals = getentarray("dom" + level.var_882f7b6a[zone.script_index], "targetname");
		if(isdefined(zone.target2))
		{
			othervisuals = getentarray(zone.target2, "targetname");
		}
		for(j = 0; j < othervisuals.size; j++)
		{
			othervisuals[j] clientfield::set("scriptid", zone.script_index);
		}
	}
}

/*
	Name: onendround
	Namespace: dom
	Checksum: 0xF1483F7F
	Offset: 0x808
	Size: 0x194
	Parameters: 1
	Flags: None
*/
function onendround(var_c1e98979)
{
	foreach(capture_zone in level.domflags)
	{
		if(capture_zone.var_45438686 == 1)
		{
			team = capture_zone gameobjects::get_owner_team();
			label = capture_zone gameobjects::get_label();
			challenges::holdflagentirematch(team, label);
		}
		if(isdefined(capture_zone.var_56d394cd))
		{
			if(!isdefined(capture_zone.var_249009fd))
			{
				capture_zone.var_249009fd = [];
			}
			else if(!isarray(capture_zone.var_249009fd))
			{
				capture_zone.var_249009fd = array(capture_zone.var_249009fd);
			}
			capture_zone.var_249009fd[capture_zone.var_249009fd.size] = gettime() - capture_zone.var_56d394cd;
		}
	}
	function_1609a882(var_c1e98979);
}

/*
	Name: function_873b25c7
	Namespace: dom
	Checksum: 0x1D914498
	Offset: 0x9A8
	Size: 0x90
	Parameters: 0
	Flags: None
*/
function function_873b25c7()
{
	level endon(#"game_ended", #"hash_62be49427d942098");
	level thread function_e2073ee4(60);
	for(;;)
	{
		waitresult = undefined;
		waitresult = level waittill(#"hash_3809ea07643ef10e");
		waitresult.player challenges::function_f96312cb();
	}
}

/*
	Name: function_e2073ee4
	Namespace: dom
	Checksum: 0x5856651D
	Offset: 0xA40
	Size: 0x40
	Parameters: 1
	Flags: None
*/
function function_e2073ee4(time)
{
	level endon(#"game_ended");
	wait(60);
	level notify(#"hash_62be49427d942098");
}

/*
	Name: function_610d3790
	Namespace: dom
	Checksum: 0x2F25AEF6
	Offset: 0xA88
	Size: 0xC34
	Parameters: 4
	Flags: None
*/
function function_610d3790(einflictor, victim, idamage, weapon)
{
	attacker = self;
	if(isdefined(weapon) && isdefined(level.iskillstreakweapon))
	{
		if([[level.iskillstreakweapon]](weapon) || (isdefined(weapon.statname) && [[level.iskillstreakweapon]](getweapon(weapon.statname))))
		{
			weaponiskillstreak = 1;
		}
	}
	var_1cfdf798 = (isdefined(idamage.lastattacker) ? idamage.lastattacker === attacker : 0);
	foreach(var_b9adb6e8 in level.domflags)
	{
		flag = var_b9adb6e8.trigger;
		if(isdefined(victim) && isdefined(attacker) && victim != attacker)
		{
			if(victim istouching(flag))
			{
				var_19041061 = 1;
			}
			else
			{
				continue;
			}
		}
		else
		{
			var_19041061 = 1;
		}
		owner_team = flag.gameobject gameobjects::get_owner_team();
		if(var_1cfdf798 && idamage globallogic_score::function_2e33e275(victim, attacker, weapon, flag))
		{
			idamage thread globallogic_score::function_7d830bc(victim, attacker, weapon, flag, owner_team);
		}
	}
	if(!is_true(var_19041061))
	{
		return;
	}
	if(isdefined(attacker) && isplayer(attacker))
	{
		scoreeventprocessed = 0;
		if(!scoreeventprocessed && isdefined(attacker.touchtriggers) && attacker.touchtriggers.size && attacker.pers[#"team"] != idamage.pers[#"team"])
		{
			triggerids = getarraykeys(attacker.touchtriggers);
			domflag = attacker.touchtriggers[triggerids[0]].gameobject;
			team = attacker.pers[#"team"];
			if(team != domflag gameobjects::get_owner_team())
			{
				if(!is_true(weaponiskillstreak) && var_1cfdf798)
				{
					scoreevents::function_2a2e1723(#"kill_enemy_while_capping_dom", attacker, idamage, weapon);
					attacker stats::function_cc215323(#"hash_61cf0b4451d9ff9b", 1);
				}
				attacker challenges::function_2f462ffd(idamage, weapon, victim, domflag);
				attacker.pers[#"objectiveekia"]++;
				attacker.objectiveekia = attacker.pers[#"objectiveekia"];
				attacker.pers[#"objectives"]++;
				attacker.objectives = attacker.pers[#"objectives"];
				scoreeventprocessed = 1;
			}
		}
		foreach(var_b9adb6e8 in level.domflags)
		{
			trigger = var_b9adb6e8.trigger;
			flagteam = "invalidTeam";
			inflagzone = 0;
			defendedflag = 0;
			offendedflag = 0;
			if(idamage istouching(trigger) || attacker istouching(trigger))
			{
				inflagzone = 1;
				if(trigger getflagteam() == attacker.pers[#"team"] || trigger getflagteam() == #"neutral")
				{
					defendedflag = 1;
				}
				else
				{
					offendedflag = 1;
				}
			}
			if(inflagzone && isplayer(attacker) && attacker.pers[#"team"] != idamage.pers[#"team"])
			{
				if(offendedflag)
				{
					if(!isdefined(attacker.dom_defends))
					{
						attacker.dom_defends = 0;
					}
					attacker.dom_defends++;
					if(level.playerdefensivemax >= attacker.dom_defends)
					{
						if(var_1cfdf798)
						{
							attacker thread challenges::killedbasedefender(trigger);
							level thread telemetry::function_18135b72(#"hash_37f96a1d3c57a089", {#hash_bdc4bbd2:#"defending", #player:idamage});
						}
						if(!scoreeventprocessed)
						{
							if(!is_true(weaponiskillstreak) && var_1cfdf798)
							{
								scoreevents::function_2a2e1723(#"killed_defender", attacker, idamage, weapon);
							}
							attacker challenges::function_2f462ffd(idamage, weapon, victim, trigger.gameobject);
							attacker.pers[#"objectiveekia"]++;
							attacker.objectiveekia = attacker.pers[#"objectiveekia"];
							attacker.pers[#"objectives"]++;
							attacker.objectives = attacker.pers[#"objectives"];
							scoreeventprocessed = 1;
						}
						break;
					}
					else
					{
						/#
							attacker iprintlnbold("");
						#/
					}
				}
				if(defendedflag)
				{
					if(!isdefined(attacker.dom_offends))
					{
						attacker.dom_offends = 0;
					}
					if(var_1cfdf798)
					{
						attacker thread updateattackermultikills();
					}
					attacker.dom_offends++;
					if(level.playeroffensivemax >= attacker.dom_offends)
					{
						if(var_1cfdf798)
						{
							attacker.pers[#"defends"]++;
							attacker.defends = attacker.pers[#"defends"];
							attacker recordgameevent("return");
							level thread telemetry::function_18135b72(#"hash_540cddd637f71a5e", {#eventtype:#"return", #player:attacker});
							attacker thread challenges::killedbaseoffender(trigger, weapon, victim);
							attacker challenges::killedzoneattacker(weapon);
							level thread telemetry::function_18135b72(#"hash_37f96a1d3c57a089", {#hash_bdc4bbd2:#"assaulting", #player:idamage});
						}
						if(!scoreeventprocessed)
						{
							if(!is_true(weaponiskillstreak) && var_1cfdf798)
							{
								scoreevents::function_2a2e1723(#"killed_attacker", attacker, idamage, weapon);
							}
							attacker challenges::function_2f462ffd(idamage, weapon, victim, trigger.gameobject);
							attacker.pers[#"objectiveekia"]++;
							attacker.objectiveekia = attacker.pers[#"objectiveekia"];
							attacker.pers[#"objectives"]++;
							attacker.objectives = attacker.pers[#"objectives"];
							scoreeventprocessed = 1;
						}
						break;
						continue;
					}
					/#
						attacker iprintlnbold("");
					#/
				}
			}
		}
		if(var_1cfdf798 && !is_true(weaponiskillstreak) && isdefined(idamage.touchtriggers) && idamage.touchtriggers.size && attacker.pers[#"team"] != idamage.pers[#"team"])
		{
			triggerids = getarraykeys(idamage.touchtriggers);
			flag = idamage.touchtriggers[triggerids[0]].gameobject;
			ownerteam = flag gameobjects::get_owner_team();
			team = idamage.pers[#"team"];
			if(team != ownerteam)
			{
				scoreevents::processscoreevent(#"hash_339b0e87303dbd56", attacker, idamage, weapon);
				scoreeventprocessed = 1;
				if(flag.contested === 1)
				{
					attacker killwhilecontesting(flag, weapon);
				}
			}
		}
		if(var_1cfdf798 && scoreeventprocessed === 1)
		{
			attacker challenges::function_82bb78f7(weapon, idamage);
		}
	}
}

/*
	Name: onplayerkilled
	Namespace: dom
	Checksum: 0x495A97CC
	Offset: 0x16C8
	Size: 0xF4
	Parameters: 9
	Flags: None
*/
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration)
{
	if(psoffsettime == "MOD_META")
	{
		return;
	}
	if(isplayer(shitloc) == 0 || shitloc.team == self.team)
	{
		return;
	}
	if(!isdefined(killstreaks::get_killstreak_for_weapon(deathanimduration)) || is_true(level.killstreaksgivegamescore))
	{
		shitloc globallogic_score::giveteamscoreforobjective(shitloc.team, level.teamscoreperkill);
	}
}

/*
	Name: function_a800815
	Namespace: dom
	Checksum: 0x831E2FFA
	Offset: 0x17C8
	Size: 0x180
	Parameters: 2
	Flags: None
*/
function function_a800815(victim, attacker)
{
	if(!isdefined(victim) || !isdefined(victim.pers) || !isdefined(victim.pers[#"team"]))
	{
		return false;
	}
	if(!isdefined(attacker) || !isdefined(attacker.pers) || !isdefined(attacker.pers[#"team"]))
	{
		return false;
	}
	if(isdefined(victim.touchtriggers) && victim.touchtriggers.size && attacker.pers[#"team"] != victim.pers[#"team"])
	{
		triggerids = getarraykeys(victim.touchtriggers);
		domflag = victim.touchtriggers[triggerids[0]].gameobject;
		team = victim.pers[#"team"];
		if(team != domflag gameobjects::get_owner_team())
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_d3a438fb
	Namespace: dom
	Checksum: 0xF42C829C
	Offset: 0x1950
	Size: 0xAA
	Parameters: 1
	Flags: None
*/
function function_d3a438fb(entity)
{
	foreach(capture_zone in level.domflags)
	{
		if(entity istouching(capture_zone.trigger))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: killwhilecontesting
	Namespace: dom
	Checksum: 0x9F1F81F4
	Offset: 0x1A08
	Size: 0x1DE
	Parameters: 2
	Flags: None
*/
function killwhilecontesting(flag, weapon)
{
	self notify(#"killwhilecontesting");
	self endon(#"killwhilecontesting", #"disconnect");
	killtime = gettime();
	playerteam = self.pers[#"team"];
	if(!isdefined(self.clearenemycount))
	{
		self.clearenemycount = 0;
	}
	self.clearenemycount++;
	flag waittill(#"contest_over");
	if(playerteam != self.pers[#"team"] || (isdefined(self.spawntime) && killtime < self.spawntime))
	{
		self.clearenemycount = 0;
		return;
	}
	if(flag.ownerteam != playerteam && flag gameobjects::get_owner_team() != #"neutral")
	{
		self.clearenemycount = 0;
		return;
	}
	if(self.clearenemycount >= 2 && (killtime + 200) > gettime())
	{
		scoreevents::processscoreevent(#"clear_2_attackers", self, undefined, undefined);
		self challenges::function_e0f51b6f(weapon);
		self stats::function_cc215323(#"hash_3c79e0a509575a03", 1);
	}
	self.clearenemycount = 0;
}

/*
	Name: updateattackermultikills
	Namespace: dom
	Checksum: 0x44312F81
	Offset: 0x1BF0
	Size: 0xAE
	Parameters: 0
	Flags: None
*/
function updateattackermultikills()
{
	self endon(#"disconnect");
	level endon(#"game_ended");
	self notify(#"updatedomrecentkills");
	self endon(#"updatedomrecentkills");
	if(!isdefined(self.recentdomattackerkillcount))
	{
		self.recentdomattackerkillcount = 0;
	}
	self.recentdomattackerkillcount++;
	wait(4);
	if(self.recentdomattackerkillcount > 1)
	{
		self challenges::domattackermultikill(self.recentdomattackerkillcount);
	}
	self.recentdomattackerkillcount = 0;
}

/*
	Name: getflagteam
	Namespace: dom
	Checksum: 0x88B070F3
	Offset: 0x1CA8
	Size: 0x1A
	Parameters: 0
	Flags: None
*/
function getflagteam()
{
	return self.gameobject gameobjects::get_owner_team();
}

/*
	Name: function_4e5d7f76
	Namespace: dom
	Checksum: 0xC344F5FB
	Offset: 0x1CD0
	Size: 0x1FA
	Parameters: 0
	Flags: None
*/
function function_4e5d7f76()
{
	descriptorsbylinkname = [];
	descriptors = getentarray("flag_descriptor", "targetname");
	foreach(capture_zone in level.domflags)
	{
		closestdist = undefined;
		closestdesc = undefined;
		for(j = 0; j < descriptors.size; j++)
		{
			dist = distance(capture_zone.trigger.origin, descriptors[j].origin);
			if(!isdefined(closestdist) || dist < closestdist)
			{
				closestdist = dist;
				closestdesc = descriptors[j];
			}
		}
		if(!isdefined(closestdesc))
		{
			globallogic_utils::add_map_error("there is no flag_descriptor in the map! see explanation in dom.gsc");
			break;
		}
		if(isdefined(closestdesc.flag))
		{
			globallogic_utils::add_map_error(("flag_descriptor with script_linkname \"" + closestdesc.script_linkname) + "\" is nearby more than one flag; is there a unique descriptor near each flag?");
			continue;
		}
		capture_zone.trigger.descriptor = closestdesc;
		closestdesc.flag = capture_zone.trigger;
		descriptorsbylinkname[closestdesc.script_linkname] = closestdesc;
	}
	if(globallogic_utils::print_map_errors())
	{
		return false;
	}
}

/*
	Name: function_1609a882
	Namespace: dom
	Checksum: 0x95E941C2
	Offset: 0x1ED8
	Size: 0x224
	Parameters: 1
	Flags: None
*/
function function_1609a882(var_c1e98979)
{
	var_1e866967 = spawnstruct();
	switch(var_c1e98979)
	{
		case 4:
		{
			var_1e866967.wintype = "round_score_reached";
			break;
		}
		case 9:
		case 10:
		default:
		{
			var_1e866967.wintype = "NA";
			break;
		}
	}
	bb::function_bf5cad4e(var_1e866967);
	for(var_268d0315 = 0; var_268d0315 < level.domflags.size; var_268d0315++)
	{
		domflag = level.domflags[var_268d0315];
		var_9669dd4c = 0;
		for(var_be3d50b0 = 0; var_be3d50b0 < domflag.var_249009fd.size; var_be3d50b0++)
		{
			var_9669dd4c = var_9669dd4c + domflag.var_249009fd[var_be3d50b0];
		}
		if(domflag.var_249009fd.size != 0)
		{
			var_3458097 = var_9669dd4c / domflag.var_249009fd.size;
		}
		var_93746b40 = {#hash_afd986ce:(isdefined(var_3458097) ? var_3458097 : 0), #label:domflag gameobjects::get_label(), #round:game.roundsplayed, #gametime:function_f8d53445()};
		function_92d1707f(#"hash_4b747d11b8ad1b23", var_93746b40);
	}
}

