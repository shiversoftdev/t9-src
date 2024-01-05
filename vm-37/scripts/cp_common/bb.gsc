#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\bb_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace bb;

/*
	Name: __init__system__
	Namespace: bb
	Checksum: 0x98D0AE02
	Offset: 0x1C0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"bb", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: bb
	Checksum: 0x1DF22378
	Offset: 0x208
	Size: 0x94
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	init_shared();
	callback::on_spawned(&function_3872d0f0);
	callback::on_spawned(&function_70635e9d);
	callback::on_spawned(&function_88a4e45c);
	callback::on_spawned(&function_85a6ae83);
}

/*
	Name: function_3872d0f0
	Namespace: bb
	Checksum: 0x90A9F2CD
	Offset: 0x2A8
	Size: 0xB8
	Parameters: 0
	Flags: Private
*/
function private function_3872d0f0()
{
	self endon(#"death", #"disconnect");
	level endon(#"game_ended");
	self notify("676c2f77e9785ef0");
	self endon("676c2f77e9785ef0");
	self notifyonplayercommand("objective_ping", "+scores");
	while(true)
	{
		self waittill(#"objective_ping");
		logplayermapnotification("show_objectives", self);
	}
}

/*
	Name: function_70635e9d
	Namespace: bb
	Checksum: 0xB22011F1
	Offset: 0x368
	Size: 0x1A0
	Parameters: 0
	Flags: Private
*/
function private function_70635e9d()
{
	self endon(#"death", #"disconnect");
	level endon(#"game_ended");
	self notify("757ff94f2b51b3cb");
	self endon("757ff94f2b51b3cb");
	waitframe(1);
	while(isdefined(level.var_a8072505))
	{
		event = undefined;
		event = self waittill(#"stealth_alert");
		enemies = getaiteamarray("axis");
		var_f5c94561 = -1;
		foreach(var_9e578de5 in enemies)
		{
			if(var_9e578de5 === event.receiver)
			{
				continue;
			}
			var_e081fa2b = [[level.var_a8072505]](var_9e578de5.alertlevelscript);
			if(var_f5c94561 < var_e081fa2b)
			{
				var_f5c94561 = var_e081fa2b;
			}
		}
		if(event.var_c0659057 > var_f5c94561)
		{
			function_8fca6a2e(event, self);
		}
	}
}

/*
	Name: function_88a4e45c
	Namespace: bb
	Checksum: 0x3F1741E9
	Offset: 0x510
	Size: 0x1E8
	Parameters: 0
	Flags: Private
*/
function private function_88a4e45c()
{
	self endon(#"death", #"disconnect");
	level endon(#"game_ended");
	self notify("51e343fcfe3f702b");
	self endon("51e343fcfe3f702b");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"weapon_switch_started");
		curweap = self getcurrentweapon();
		if(waitresult.weapon !== curweap)
		{
			if(curweap.name !== "none")
			{
				function_141c945e("stop", curweap, self);
				if(curweap.type !== "melee" && self getammocount(curweap) == 0)
				{
					function_141c945e("noammo", curweap, self);
					logplayermapnotification("out_of_ammo", self);
				}
			}
			if(waitresult.weapon.name !== "none")
			{
				function_141c945e("start", waitresult.weapon, self);
				if(waitresult.weapon.name === #"gadget_health_regen")
				{
					logplayermapnotification("heal", self);
				}
			}
		}
	}
}

/*
	Name: function_85a6ae83
	Namespace: bb
	Checksum: 0x76A097D4
	Offset: 0x700
	Size: 0xC8
	Parameters: 0
	Flags: Private
*/
function private function_85a6ae83()
{
	self endon(#"death", #"disconnect");
	level endon(#"game_ended");
	self notify("6d685e8e8bf91248");
	self endon("6d685e8e8bf91248");
	while(true)
	{
		if(getdvarint(#"hash_7b899094cda20ec3", 1))
		{
			recordbreadcrumbdataforplayer(self);
		}
		wait(getdvarfloat(#"hash_48fe774d185ff64a", 2));
	}
}

/*
	Name: function_56f03b13
	Namespace: bb
	Checksum: 0x74545312
	Offset: 0x7D0
	Size: 0xB6
	Parameters: 1
	Flags: Private
*/
function private function_56f03b13(player)
{
	var_4f1ec5c = "";
	if(isdefined(player.var_efc688f7))
	{
		for(index = 0; index < player.var_efc688f7.size; index++)
		{
			if(isdefined(player.var_efc688f7[index]) && player.var_efc688f7[index])
			{
				if(isdefined(var_4f1ec5c) && var_4f1ec5c != "")
				{
					var_4f1ec5c = var_4f1ec5c + ";";
				}
				var_4f1ec5c = var_4f1ec5c + index;
			}
		}
	}
	return var_4f1ec5c;
}

/*
	Name: function_bb412e85
	Namespace: bb
	Checksum: 0x8FE495C3
	Offset: 0x890
	Size: 0x56
	Parameters: 0
	Flags: Private
*/
function private function_bb412e85()
{
	var_2084f739 = {};
	var_2084f739.gametime = gettime();
	var_2084f739.level_name = level.script;
	if(!isdefined(var_2084f739.level_name))
	{
		var_2084f739.level_name = util::get_map_name();
	}
	return var_2084f739;
}

/*
	Name: logmatchsummary
	Namespace: bb
	Checksum: 0x602C266
	Offset: 0x8F0
	Size: 0x8FC
	Parameters: 1
	Flags: None
*/
function logmatchsummary(player)
{
	if(!isplayer(player))
	{
		return;
	}
	var_604bf865 = 1;
	if(isdefined(player.deaths) && player.deaths > 0)
	{
		var_604bf865 = player.deaths;
	}
	kdratio = player.kills / var_604bf865;
	playertime = 0;
	if(isdefined(player.connectedtime))
	{
		playertime = gettime() - player.connectedtime;
	}
	totalshots = 0;
	shotshit = 0;
	if(isdefined(player._bbdata))
	{
		totalshots = (isdefined(player._bbdata[#"shots"]) ? player._bbdata[#"shots"] : 0);
		shotshit = (isdefined(player._bbdata[#"hits"]) ? player._bbdata[#"hits"] : 0);
	}
	accuracy = 0;
	if(totalshots > 0)
	{
		accuracy = shotshit / totalshots;
	}
	var_4f1ec5c = function_56f03b13(player);
	corners = getentarray("minimap_corner", "targetname");
	dimensions0 = 0;
	dimensions1 = 0;
	if(isdefined(corners) && corners.size >= 2)
	{
		dimensions0 = corners[1].origin[0] - corners[0].origin[0];
		dimensions1 = corners[1].origin[1] - corners[0].origin[1];
	}
	rankxp = 0;
	rank = 0;
	if(isdefined(player.pers))
	{
		if(isdefined(player.pers[#"rank"]))
		{
			rank = player.pers[#"rank"];
		}
		if(isdefined(player.pers[#"rankxp"]))
		{
			rankxp = player.pers[#"rankxp"];
		}
	}
	doublejumpdistance = 0;
	doublejumpcount = 0;
	doublejumptime = 0;
	wallrundistance = 0;
	wallruncount = 0;
	wallruntime = 0;
	sprintdistance = 0;
	sprintcount = 0;
	sprinttime = 0;
	if(isdefined(player.movementtracking))
	{
		if(isdefined(player.movementtracking.doublejump))
		{
			doublejumpdistance = player.movementtracking.doublejump.distance;
			doublejumpcount = player.movementtracking.doublejump.count;
			doublejumptime = player.movementtracking.doublejump.time;
		}
		if(isdefined(player.movementtracking.wallrunning))
		{
			wallrundistance = player.movementtracking.wallrunning.distance;
			wallruncount = player.movementtracking.wallrunning.count;
			wallruntime = player.movementtracking.wallrunning.time;
		}
		if(isdefined(player.movementtracking.sprinting))
		{
			sprintdistance = player.movementtracking.sprinting.distance;
			sprintcount = player.movementtracking.sprinting.count;
			sprinttime = player.movementtracking.sprinting.time;
		}
	}
	playerid = getplayerspawnid(player);
	bestkillstreak = (isdefined(player.pers[#"best_kill_streak"]) ? player.pers[#"best_kill_streak"] : 0);
	meleekills = (isdefined(player.meleekills) ? player.meleekills : 0);
	headshots = (isdefined(player.headshots) ? player.headshots : 0);
	var_f71b6142 = (isdefined(player.primaryloadoutweapon) ? player.primaryloadoutweapon.name : "undefined");
	currentweapon = (isdefined(player.currentweapon) ? player.currentweapon.name : "undefined");
	grenadesused = (isdefined(player.grenadesused) ? player.grenadesused : 0);
	playername = (isdefined(player.name) ? player.name : "undefined");
	kills = (isdefined(player.kills) ? player.kills : 0);
	deaths = (isdefined(player.deaths) ? player.deaths : 0);
	incaps = (isdefined(player.pers[#"incaps"]) ? player.pers[#"incaps"] : 0);
	assists = (isdefined(player.assists) ? player.assists : 0);
	score = (isdefined(player.score) ? player.score : 0);
	var_2084f739 = function_bb412e85();
	var_2084f739.spawnid = playerid;
	var_2084f739.username = playername;
	var_2084f739.kills = kills;
	var_2084f739.deaths = deaths;
	var_2084f739.incaps = incaps;
	var_2084f739.kd = kdratio;
	var_2084f739.shotshit = shotshit;
	var_2084f739.totalshots = totalshots;
	var_2084f739.accuracy = accuracy;
	var_2084f739.assists = assists;
	var_2084f739.score = score;
	var_2084f739.playertime = playertime;
	var_2084f739.meleekills = meleekills;
	var_2084f739.headshots = headshots;
	var_2084f739.primaryloadoutweapon = var_f71b6142;
	var_2084f739.currentweapon = currentweapon;
	var_2084f739.grenadesused = grenadesused;
	var_2084f739.bestkillstreak = bestkillstreak;
	var_2084f739.var_416a3780 = doublejumpdistance;
	var_2084f739.var_5f11b3b0 = doublejumpcount;
	var_2084f739.var_4ee734c0 = doublejumptime;
	var_2084f739.var_eeb75a04 = wallrundistance;
	var_2084f739.var_c595ee7d = wallruncount;
	var_2084f739.var_9c479e22 = wallruntime;
	var_2084f739.sprint_dist = sprintdistance;
	var_2084f739.var_5983424f = sprintcount;
	var_2084f739.sprint_time = sprinttime;
	var_2084f739.var_ee83c52b = dimensions0;
	var_2084f739.var_c1e9a7 = dimensions1;
	var_2084f739.rank = rank;
	var_2084f739.rankxp = rankxp;
	var_2084f739.collectibles = var_4f1ec5c;
	function_92d1707f(#"hash_616fb54063760a91", var_2084f739);
}

/*
	Name: logobjectivestatuschange
	Namespace: bb
	Checksum: 0xB0BB1A65
	Offset: 0x11F8
	Size: 0x1F4
	Parameters: 3
	Flags: None
*/
function logobjectivestatuschange(objectivename, player, status)
{
	if(!isplayer(player))
	{
		return;
	}
	playerid = -1;
	if(isplayer(player))
	{
		playerid = getplayerspawnid(player);
	}
	else
	{
		return;
	}
	var_2084f739 = function_bb412e85();
	var_2084f739.spawnid = playerid;
	var_2084f739.username = player.name;
	var_2084f739.checkpointname = objectivename;
	var_2084f739.eventtype = status;
	var_2084f739.originx = player.origin[0];
	var_2084f739.originy = player.origin[1];
	var_2084f739.originz = player.origin[2];
	var_2084f739.kills = player.kills;
	var_2084f739.revives = player.revives;
	var_2084f739.deathcount = player.deathcount;
	var_2084f739.deaths = player.deaths;
	var_2084f739.headshots = player.headshots;
	var_2084f739.hits = player.hits;
	var_2084f739.score = player.score;
	var_2084f739.shotshit = player.shotshit;
	var_2084f739.shotsmissed = player.shotsmissed;
	var_2084f739.suicides = player.suicides;
	var_2084f739.downs = player.downs;
	var_2084f739.difficulty = level.currentdifficulty;
	function_92d1707f(#"hash_1c8379f2cae4ae9a", var_2084f739);
}

/*
	Name: logdamage
	Namespace: bb
	Checksum: 0x651EBC82
	Offset: 0x13F8
	Size: 0x604
	Parameters: 8
	Flags: None
*/
function logdamage(attacker, victim, weapon, damage, damagetype, hitlocation, victimkilled, victimdowned)
{
	victimid = -1;
	victimname = "";
	victimtype = "";
	victimorigin = (0, 0, 0);
	victimignoreme = 0;
	victimignoreall = 0;
	victimfovcos = 0;
	victimmaxsightdistsqrd = 0;
	victimanimname = "";
	victimlaststand = 0;
	victimdowns = 0;
	attackerid = -1;
	attackername = "";
	attackertype = "";
	attackerorigin = (0, 0, 0);
	attackerignoreme = 0;
	attackerignoreall = 0;
	attackerfovcos = 0;
	attackermaxsightdistsqrd = 0;
	attackeranimname = "";
	attackerlaststand = 0;
	var_f0277724 = "";
	var_8bdcd848 = "";
	aivictimcombatmode = "";
	var_53b48f29 = "";
	var_e2e23f7e = "";
	aiattackercombatmode = "";
	if(isdefined(attacker))
	{
		if(isplayer(attacker))
		{
			attackerid = getplayerspawnid(attacker);
			attackertype = "_player";
			attackername = attacker.name;
		}
		else
		{
			if(isai(attacker))
			{
				attackertype = "_ai";
				aiattackercombatmode = attacker.combatmode;
				attackerid = attacker.actor_id;
			}
			else
			{
				attackertype = "_other";
			}
		}
		attackerorigin = attacker.origin;
		attackerignoreme = attacker.ignoreme;
		attackerfovcos = attacker.fovcosine;
		attackermaxsightdistsqrd = attacker.maxsightdistsqrd;
		if(isdefined(attacker.animname))
		{
			attackeranimname = attacker.animname;
		}
		if(isdefined(attacker.laststand))
		{
			attackerlaststand = attacker.laststand;
		}
	}
	if(isdefined(victim))
	{
		if(isplayer(victim))
		{
			victimid = getplayerspawnid(victim);
			victimtype = "_player";
			victimname = victim.name;
			victimdowns = victim.downs;
		}
		else
		{
			if(isai(victim))
			{
				victimtype = "_ai";
				aivictimcombatmode = victim.combatmode;
				victimid = victim.actor_id;
			}
			else
			{
				victimtype = "_other";
			}
		}
		victimorigin = victim.origin;
		victimignoreme = victim.ignoreme;
		victimfovcos = victim.fovcosine;
		victimmaxsightdistsqrd = victim.maxsightdistsqrd;
		if(isdefined(victim.animname))
		{
			victimanimname = victim.animname;
		}
		if(isdefined(victim.laststand))
		{
			victimlaststand = victim.laststand;
		}
	}
	var_2084f739 = function_bb412e85();
	var_2084f739.attackerid = attackerid;
	var_2084f739.attackertype = attackertype;
	var_2084f739.attackername = attackername;
	var_2084f739.attackerweapon = weapon.name;
	var_2084f739.attackerx = attackerorigin[0];
	var_2084f739.attackery = attackerorigin[1];
	var_2084f739.attackerz = attackerorigin[2];
	var_2084f739.aiattckercombatmode = aiattackercombatmode;
	var_2084f739.attackerignoreme = attackerignoreme;
	var_2084f739.attackerignoreall = attackerignoreall;
	var_2084f739.attackerfovcos = attackerfovcos;
	var_2084f739.attackermaxsightdistsqrd = attackermaxsightdistsqrd;
	var_2084f739.attackeranimname = attackeranimname;
	var_2084f739.attackerlaststand = attackerlaststand;
	var_2084f739.victimid = victimid;
	var_2084f739.victimtype = victimtype;
	var_2084f739.victimname = victimname;
	var_2084f739.originx = victimorigin[0];
	var_2084f739.originy = victimorigin[1];
	var_2084f739.originz = victimorigin[2];
	var_2084f739.aivictimcombatmode = aivictimcombatmode;
	var_2084f739.victimignoreme = victimignoreme;
	var_2084f739.victimignoreall = victimignoreall;
	var_2084f739.victimfovcos = victimfovcos;
	var_2084f739.victimmaxsightdistsqrd = victimmaxsightdistsqrd;
	var_2084f739.victimanimname = victimanimname;
	var_2084f739.victimlaststand = victimlaststand;
	var_2084f739.damage = damage;
	var_2084f739.damagetype = damagetype;
	var_2084f739.damagelocation = hitlocation;
	var_2084f739.death = victimkilled;
	var_2084f739.victimdowned = victimdowned;
	var_2084f739.downs = victimdowns;
	function_92d1707f(#"hash_1daf9dd7ac61d60e", var_2084f739);
}

/*
	Name: logaispawn
	Namespace: bb
	Checksum: 0x3060A899
	Offset: 0x1A08
	Size: 0x1A4
	Parameters: 2
	Flags: None
*/
function logaispawn(aient, spawner)
{
	var_2084f739 = function_bb412e85();
	var_2084f739.actorid = spawner.actor_id;
	var_2084f739.aitype = spawner.aitype;
	var_2084f739.archetype = spawner.archetype;
	var_2084f739.airank = spawner.airank;
	var_2084f739.accuracy = spawner.accuracy;
	var_2084f739.script_accuracy = spawner.script_accuracy;
	var_2084f739.originx = spawner.origin[0];
	var_2084f739.originy = spawner.origin[1];
	var_2084f739.originz = spawner.origin[2];
	var_2084f739.weapon = spawner.primaryweapon.name;
	var_2084f739.team = spawner.team;
	var_2084f739.alertlevel = spawner.alertlevel;
	var_2084f739.grenadeawareness = spawner.grenadeawareness;
	var_2084f739.canflank = spawner.canflank;
	var_2084f739.engagemaxdist = spawner.engagemaxdist;
	var_2084f739.engagemaxfalloffdist = spawner.var_f6cb7908;
	var_2084f739.engagemindist = spawner.engagemindist;
	var_2084f739.engageminfalloffdist = spawner.engageminfalloffdist;
	var_2084f739.health = spawner.health;
	function_92d1707f(#"hash_b8892f711cc8024", var_2084f739);
}

/*
	Name: logplayermapnotification
	Namespace: bb
	Checksum: 0x21A6AC81
	Offset: 0x1BB8
	Size: 0x20C
	Parameters: 2
	Flags: None
*/
function logplayermapnotification(notificationtype, player)
{
	if(!isdefined(player))
	{
		player = getplayers()[0];
	}
	if(!isplayer(player) && !isai(player))
	{
		return;
	}
	playerid = -1;
	playertype = "";
	playerposition = (0, 0, 0);
	playername = "";
	playeryaw = player.angles[1];
	if(isai(player))
	{
		playerid = player.actor_id;
		playertype = "_ai";
		playerposition = player.origin;
	}
	else if(isplayer(player))
	{
		playerid = getplayerspawnid(player);
		playertype = "_player";
		playerposition = player.origin;
		playername = player.name;
	}
	var_2084f739 = function_bb412e85();
	var_2084f739.notificationtype = notificationtype;
	var_2084f739.spawnid = playerid;
	var_2084f739.username = playername;
	var_2084f739.var_4f5cdb6a = playertype;
	var_2084f739.originx = playerposition[0];
	var_2084f739.originy = playerposition[1];
	var_2084f739.originz = playerposition[2];
	var_2084f739.var_3a06c5c4 = playeryaw;
	function_92d1707f(#"hash_a2e7d42c6175a49", var_2084f739);
}

/*
	Name: function_7977c093
	Namespace: bb
	Checksum: 0xE6ECB9B6
	Offset: 0x1DD0
	Size: 0xDC
	Parameters: 3
	Flags: None
*/
function function_7977c093(scriptbundle, selection, player)
{
	if(!isplayer(player))
	{
		return;
	}
	var_2084f739 = function_bb412e85();
	var_2084f739.choice = selection;
	var_2084f739.scriptbundle = scriptbundle;
	var_2084f739.originx = player.origin[0];
	var_2084f739.originy = player.origin[1];
	var_2084f739.originz = player.origin[2];
	function_92d1707f(#"hash_682f461dfce7bcc", var_2084f739);
}

/*
	Name: function_a0d15803
	Namespace: bb
	Checksum: 0x4D551433
	Offset: 0x1EB8
	Size: 0x114
	Parameters: 3
	Flags: None
*/
function function_a0d15803(var_4d98c3ce, var_393b6e18, player)
{
	if(!isplayer(player))
	{
		return;
	}
	var_2084f739 = function_bb412e85();
	var_2084f739.prompt = var_4d98c3ce;
	var_2084f739.originx = player.origin[0];
	var_2084f739.originy = player.origin[1];
	var_2084f739.originz = player.origin[2];
	if(!isdefined(var_393b6e18))
	{
		var_393b6e18 = player.origin;
	}
	var_2084f739.var_8fdde989 = var_393b6e18[0];
	var_2084f739.var_822b4e24 = var_393b6e18[1];
	var_2084f739.var_9018e9fb = var_393b6e18[2];
	function_92d1707f(#"hash_7dc6fbfa7d872255", var_2084f739);
}

/*
	Name: function_8fca6a2e
	Namespace: bb
	Checksum: 0x610EDEAE
	Offset: 0x1FD8
	Size: 0x19C
	Parameters: 2
	Flags: None
*/
function function_8fca6a2e(event, player)
{
	if(!isplayer(player))
	{
		return;
	}
	var_2084f739 = function_bb412e85();
	var_2084f739.event = (isdefined(event.typeorig) ? event.typeorig : (isdefined(event.type) ? event.type : "<unknown>"));
	var_2084f739.originx = player.origin[0];
	var_2084f739.originy = player.origin[1];
	var_2084f739.originz = player.origin[2];
	var_ccfd8635 = (isdefined(event.receiver.origin) ? event.receiver.origin : player.origin);
	var_2084f739.var_808bfef8 = var_ccfd8635[0];
	var_2084f739.var_727ec7 = var_ccfd8635[1];
	var_2084f739.var_1239a255 = var_ccfd8635[2];
	var_2084f739.alertlevel = (isdefined(event.var_c0659057) ? event.var_c0659057 : -1);
	function_92d1707f(#"hash_7cf37e2bb4f129ae", var_2084f739);
}

/*
	Name: function_141c945e
	Namespace: bb
	Checksum: 0x63E10277
	Offset: 0x2180
	Size: 0xDC
	Parameters: 3
	Flags: None
*/
function function_141c945e(action, weapon, player)
{
	if(!isplayer(player))
	{
		return;
	}
	var_2084f739 = function_bb412e85();
	var_2084f739.weapname = weapon.name;
	var_2084f739.action = action;
	var_2084f739.originx = player.origin[0];
	var_2084f739.originy = player.origin[1];
	var_2084f739.originz = player.origin[2];
	function_92d1707f(#"hash_62009457b268d346", var_2084f739);
}

/*
	Name: function_248394b9
	Namespace: bb
	Checksum: 0xA1514860
	Offset: 0x2268
	Size: 0x1DC
	Parameters: 3
	Flags: None
*/
function function_248394b9(event, num, player)
{
	if(!isdefined(player))
	{
		player = getplayers()[0];
	}
	if(!isfloat(num) && !isint(num))
	{
		return;
	}
	if(!isplayer(player))
	{
		return;
	}
	var_2084f739 = function_bb412e85();
	var_2084f739.event = event;
	if(isint(num))
	{
		var_2084f739.var_f2ebb6e1 = num;
		var_2084f739.var_dac812c9 = float(num);
	}
	else if(isfloat(num))
	{
		var_2084f739.var_dac812c9 = num;
		var_2084f739.var_f2ebb6e1 = int(num);
	}
	var_2084f739.playerid = getplayerspawnid(player);
	var_2084f739.playername = player.name;
	var_2084f739.var_df592595 = player.angles[1];
	var_2084f739.originx = player.origin[0];
	var_2084f739.originy = player.origin[1];
	var_2084f739.originz = player.origin[2];
	function_92d1707f(#"hash_16eb11423f4573a7", var_2084f739);
}

