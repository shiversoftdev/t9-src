#using script_7a8059ca02b7b09e;
#using scripts\core_common\globallogic\globallogic_score.gsc;
#using script_1cc417743d7c262d;
#using scripts\mp_common\player\player_utils.gsc;
#using scripts\mp_common\gametypes\globallogic_utils.gsc;
#using scripts\mp_common\gametypes\globallogic_score.gsc;
#using scripts\mp_common\gametypes\round.gsc;
#using scripts\mp_common\gametypes\overtime.gsc;
#using scripts\mp_common\gametypes\match.gsc;
#using scripts\mp_common\gametypes\globallogic.gsc;
#using scripts\mp_common\challenges.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using script_7d712f77ab8d0c16;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\contracts_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\potm_shared.gsc;
#using scripts\core_common\demo_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\struct.gsc;
#using script_335d0650ed05d36d;
#using script_44b0b8420eabacad;
#using script_1435f3c9fc699e04;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\battlechatter.gsc;

#namespace namespace_d03f485e;

/*
	Name: function_3666790
	Namespace: namespace_d03f485e
	Checksum: 0x7FCCA182
	Offset: 0x5D0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_3666790()
{
	level notify(-594226844);
}

/*
	Name: function_dc5b7ee6
	Namespace: namespace_d03f485e
	Checksum: 0xAB313001
	Offset: 0x5F0
	Size: 0x364
	Parameters: 0
	Flags: None
*/
function function_dc5b7ee6()
{
	globallogic::init();
	level.activezone = undefined;
	spawning::addsupportedspawnpointtype("war");
	spawning::function_754c78a6(&function_259770ba);
	level.b_allow_vehicle_proximity_pickup = 1;
	callback::on_joined_team(&onplayerjoinedteam);
	level.shouldplayovertimeround = &shouldplayovertimeround;
	level.overtimetimelimit = getgametypesetting(#"overtimetimelimit");
	level.extratime = (isdefined(getgametypesetting(#"extratime")) ? getgametypesetting(#"extratime") : 0);
	level.gettimelimit = &gettimelimit;
	level.ontimelimit = &ontimelimit;
	level.var_a9be97d8 = [];
	level.var_34842a14 = 1;
	level.var_ce802423 = 1;
	level.var_10c0e6bb = &function_fac7cc65;
	callback::on_spawned(&on_player_spawned);
	player::function_3c5cc656(&function_610d3790);
	clientfield::register("world", "war_zone", 1, 5, "int");
	clientfield::register("scriptmover", "scriptid", 1, 5, "int");
	clientfield::function_5b7d846d("team_momentum.level1PercentageAllies", 1, 8, "float");
	clientfield::function_5b7d846d("team_momentum.level2PercentageAllies", 1, 8, "float");
	clientfield::function_5b7d846d("team_momentum.level1PercentageAxis", 1, 8, "float");
	clientfield::function_5b7d846d("team_momentum.level2PercentageAxis", 1, 8, "float");
	clientfield::function_5b7d846d("team_momentum.currentLevelAllies", 1, 2, "int");
	clientfield::function_5b7d846d("team_momentum.currentLevelAxis", 1, 2, "int");
	function_97c413ba();
	function_215b6757();
	/#
		spawning::function_a860c440(&function_ed2b0a19);
	#/
}

/*
	Name: function_97c413ba
	Namespace: namespace_d03f485e
	Checksum: 0xF6D3FCC4
	Offset: 0x960
	Size: 0x17C
	Parameters: 0
	Flags: None
*/
function function_97c413ba()
{
	level.var_1845db12 = [];
	level.var_1845db12[#"neutral"] = {#captured:"objSecured", #lost:"warLostNeutral", #taking:"warTakingNeutral", #losing:"warLosingNeutral"};
	level.var_1845db12[#"friendly"] = {#captured:"objSecured", #lost:"warLostFriendly", #taking:"warTakingFriendly", #losing:"warLosingFriendly"};
	level.var_1845db12[#"enemy"] = {#captured:"objSecured", #lost:"warLostEnemey", #taking:"warTakingEnemey", #losing:"warLosingEnemey"};
}

/*
	Name: gettimelimit
	Namespace: namespace_d03f485e
	Checksum: 0xC9FD39C3
	Offset: 0xAE8
	Size: 0xD2
	Parameters: 0
	Flags: None
*/
function gettimelimit()
{
	timelimit = (isdefined(level.timelimit) ? level.timelimit : getgametypesetting(#"timelimit"));
	if(overtime::is_overtime_round())
	{
		timelimit = (isdefined(level.overtimetimelimit) ? level.overtimetimelimit : getgametypesetting(#"overtimetimelimit"));
	}
	timelimit = math::clamp(timelimit, level.timelimitmin, level.timelimitmax);
	return timelimit;
}

/*
	Name: onplayerjoinedteam
	Namespace: namespace_d03f485e
	Checksum: 0x4454B801
	Offset: 0xBC8
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function onplayerjoinedteam(params)
{
	function_c1d8ad94(self.team);
}

/*
	Name: on_player_spawned
	Namespace: namespace_d03f485e
	Checksum: 0x223AED8A
	Offset: 0xBF8
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function on_player_spawned()
{
	self function_2ba2d8e5("");
}

/*
	Name: shouldplayovertimeround
	Namespace: namespace_d03f485e
	Checksum: 0xA5742703
	Offset: 0xC28
	Size: 0x68
	Parameters: 0
	Flags: None
*/
function shouldplayovertimeround()
{
	if(game.overtime_round > 0)
	{
		return 0;
	}
	return game.stat[#"teamscores"][#"allies"] == game.stat[#"teamscores"][#"axis"];
}

/*
	Name: function_b4530b39
	Namespace: namespace_d03f485e
	Checksum: 0xA779207F
	Offset: 0xC98
	Size: 0x5C
	Parameters: 0
	Flags: None
*/
function function_b4530b39()
{
	level endon(#"game_ended");
	while(game.state != #"playing")
	{
		waitframe(1);
	}
	globallogic_audio::leader_dialog("roundOvertime");
}

/*
	Name: function_f6c3ee90
	Namespace: namespace_d03f485e
	Checksum: 0xC25571A4
	Offset: 0xD00
	Size: 0xE0
	Parameters: 0
	Flags: None
*/
function function_f6c3ee90()
{
	while(game.state != "playing")
	{
		waitframe(1);
	}
	timelimit = gettimelimit();
	if(timelimit <= 0)
	{
		return;
	}
	wait((timelimit - 1) * 60);
	if(!isdefined(level.var_57e2bc08))
	{
		return;
	}
	thread [[level.var_57e2bc08]]("warRoundEndNearDraw", #"allies", "Draw", undefined, "war");
	thread [[level.var_57e2bc08]]("warRoundEndNearDraw", #"axis", "Draw", undefined, "war");
}

/*
	Name: function_43811ed1
	Namespace: namespace_d03f485e
	Checksum: 0x72B0E6E5
	Offset: 0xDE8
	Size: 0x84
	Parameters: 1
	Flags: None
*/
function function_43811ed1(warzone)
{
	var_fea5c547 = getentarray(warzone.target, "targetname");
	for(counter = 0; counter < var_fea5c547.size; counter++)
	{
		var_fea5c547[counter] notsolid();
		var_fea5c547[counter] ghost();
	}
}

/*
	Name: function_1804ad1c
	Namespace: namespace_d03f485e
	Checksum: 0x61367E8
	Offset: 0xE78
	Size: 0x2D4
	Parameters: 0
	Flags: None
*/
function function_1804ad1c()
{
	thread function_f6c3ee90();
	var_1b3b480b = getentarray("war_zone", "targetname");
	foreach(warzone in var_1b3b480b)
	{
		function_43811ed1(warzone);
	}
	if(overtime::is_overtime_round())
	{
		function_7de91713();
		startzone = function_582a1641();
		thread function_b4530b39();
	}
	else
	{
		function_7c88d456();
		startzone = function_582a1641();
		foreach(zoneindex in getarraykeys(level.var_1b3b480b))
		{
			if(zoneindex == startzone)
			{
				continue;
				continue;
			}
			if(zoneindex < startzone)
			{
				level.var_1b3b480b[zoneindex] gameobjects::set_owner_team(#"allies");
				level.var_1b3b480b[zoneindex].team = #"allies";
				continue;
			}
			if(zoneindex > startzone)
			{
				level.var_1b3b480b[zoneindex] gameobjects::set_owner_team(#"axis");
				level.var_1b3b480b[zoneindex].team = #"axis";
			}
		}
	}
	spawning::function_fac242d0(5, "war_zone_", &function_b11bd4e4);
	thread function_2f51eb67();
}

/*
	Name: function_610d3790
	Namespace: namespace_d03f485e
	Checksum: 0x2C7431D8
	Offset: 0x1158
	Size: 0x47C
	Parameters: 4
	Flags: None
*/
function function_610d3790(einflictor, victim, idamage, weapon)
{
	attacker = self;
	zone = level.activezone;
	if(isdefined(weapon) && isdefined(level.iskillstreakweapon))
	{
		if([[level.iskillstreakweapon]](weapon) || (isdefined(weapon.statname) && [[level.iskillstreakweapon]](getweapon(weapon.statname))))
		{
			weaponiskillstreak = 1;
		}
	}
	if(isplayer(attacker) && attacker.team !== idamage.team)
	{
		if(zone.var_cddc87d1 === 1 && (attacker istouching(zone.trigger) || idamage istouching(zone.trigger)))
		{
			if(!is_true(weaponiskillstreak))
			{
				scoreevents::function_2a2e1723(#"war_killed_attacker_in_zone", attacker, idamage, weapon);
			}
			attacker challenges::function_2f462ffd(idamage, weapon, victim, zone);
			attacker.pers[#"objectiveekia"]++;
			attacker.objectiveekia = attacker.pers[#"objectiveekia"];
			attacker.pers[#"objectives"]++;
			attacker.objectives = attacker.pers[#"objectives"];
			attacker globallogic_score::incpersstat(#"objectivescore", 1, 0, 1);
			var_1cfdf798 = (isdefined(idamage.lastattacker) ? idamage.lastattacker === attacker : 0);
			if(var_1cfdf798)
			{
				if(idamage globallogic_score::function_2e33e275(victim, attacker, weapon, zone))
				{
					idamage thread globallogic_score::function_7d830bc(victim, attacker, weapon, zone, zone.team);
				}
				if(idamage istouching(zone.trigger) && !is_true(weaponiskillstreak))
				{
					scoreevents::processscoreevent(#"hash_339b0e87303dbd56", attacker, idamage, weapon);
				}
				if(idamage istouching(zone.trigger) && !overtime::is_overtime_round())
				{
					var_6d63be7c = zone gameobjects::get_num_touching(idamage.team);
					var_691a95b3 = function_6f764775(zone.index, idamage.team);
					if(var_6d63be7c === 1 && var_691a95b3)
					{
						scoreevents::processscoreevent(#"hash_6543ff9d3c6a9dcc", attacker, idamage, weapon);
						attacker stats::function_cc215323(#"hash_438dd63c5f27e257", 1);
					}
				}
				attacker challenges::function_82bb78f7(weapon, idamage);
			}
		}
		if(attacker !== idamage && attacker.team !== idamage.team)
		{
			function_8b52c845(attacker.team, 5);
		}
	}
}

/*
	Name: function_2f51eb67
	Namespace: namespace_d03f485e
	Checksum: 0x120FD3B2
	Offset: 0x15E0
	Size: 0x64
	Parameters: 0
	Flags: None
*/
function function_2f51eb67()
{
	while(game.state != "playing")
	{
		waitframe(1);
	}
	startzone = function_582a1641();
	thread function_a8049ffd(startzone, 10);
}

/*
	Name: function_7de91713
	Namespace: namespace_d03f485e
	Checksum: 0x137C816C
	Offset: 0x1650
	Size: 0xF8
	Parameters: 0
	Flags: Private
*/
function private function_7de91713()
{
	if(!isdefined(level.var_1b3b480b))
	{
		level.var_1b3b480b = [];
	}
	var_1b3b480b = getentarray("war_zone", "targetname");
	foreach(warzone in var_1b3b480b)
	{
		if(!isdefined(warzone.var_4259567e))
		{
			continue;
		}
		function_15b6cb2b(warzone);
		level.var_30c0a631 = warzone.script_index;
		break;
	}
}

/*
	Name: function_7c88d456
	Namespace: namespace_d03f485e
	Checksum: 0xF0E23CC3
	Offset: 0x1750
	Size: 0xF0
	Parameters: 0
	Flags: Private
*/
function private function_7c88d456()
{
	if(!isdefined(level.var_1b3b480b))
	{
		level.var_1b3b480b = [];
	}
	var_1b3b480b = getentarray("war_zone", "targetname");
	foreach(warzone in var_1b3b480b)
	{
		if(is_true(warzone.var_fbe444f9))
		{
			continue;
		}
		function_15b6cb2b(warzone);
	}
}

/*
	Name: function_4b6d5b40
	Namespace: namespace_d03f485e
	Checksum: 0x69C3999C
	Offset: 0x1848
	Size: 0xA0
	Parameters: 2
	Flags: Private
*/
function private function_4b6d5b40(zoneindex, target)
{
	var_fea5c547 = getentarray(target, "targetname");
	for(counter = 0; counter < var_fea5c547.size; counter++)
	{
		var_fea5c547[counter] notsolid();
		var_fea5c547[counter] clientfield::set("scriptid", zoneindex + 1);
	}
	return var_fea5c547;
}

/*
	Name: function_15b6cb2b
	Namespace: namespace_d03f485e
	Checksum: 0xDCDB25ED
	Offset: 0x18F0
	Size: 0x404
	Parameters: 1
	Flags: Private
*/
function private function_15b6cb2b(var_45c0e4bc)
{
	/#
		assert(isdefined(var_45c0e4bc.script_index));
	#/
	/#
		assert(!isdefined(level.var_1b3b480b[var_45c0e4bc.script_index]));
	#/
	name = "war_" + (isdefined(var_45c0e4bc.script_index) ? "" + var_45c0e4bc.script_index : "");
	var_6b67c295 = gameobjects::create_use_object(#"neutral", var_45c0e4bc, [], (0, 0, 0), name);
	var_6b67c295 gameobjects::set_use_text(#"hash_12e5f9d3793fc759");
	capturetime = getgametypesetting(#"capturetime");
	var_2084ae03 = getgametypesetting(#"hash_4df429f326400c0f");
	var_1bac6a8e = getgametypesetting(#"hash_130d127406ab976e");
	var_1bac6a8e = (var_1bac6a8e <= capturetime ? var_1bac6a8e : capturetime / var_2084ae03);
	var_6b67c295 gameobjects::set_use_time(capturetime);
	var_6b67c295 gameobjects::function_3dc7107c(var_2084ae03);
	var_6b67c295 gameobjects::function_e887a9d0(var_1bac6a8e);
	var_6b67c295 gameobjects::function_5ea37c7c(&gameobjects::function_83eda4c0);
	var_6b67c295 gameobjects::set_decay_time(capturetime);
	var_6b67c295 gameobjects::set_use_multiplier_callback(&getuseratemultiplier);
	var_6b67c295 gameobjects::function_e9492e8f(1);
	function_9a8950ee(var_6b67c295.objectiveid, 1);
	var_6b67c295.decayprogress = (isdefined(getgametypesetting(#"decayprogress")) ? getgametypesetting(#"decayprogress") : 0);
	var_6b67c295.autodecaytime = (isdefined(getgametypesetting(#"autodecaytime")) ? getgametypesetting(#"autodecaytime") : undefined);
	var_6b67c295.onuse = &onzonecapture;
	var_6b67c295.onupdateuserate = &onupdateuserate;
	var_6b67c295.onuseupdate = &on_use_update;
	var_6b67c295.ontouchuse = &on_touch_use;
	var_6b67c295.index = var_45c0e4bc.script_index;
	var_6b67c295 function_3e4f6efb();
	if(isdefined(var_45c0e4bc.target))
	{
		var_6b67c295.var_142ad58e = function_4b6d5b40(var_45c0e4bc.script_index, var_45c0e4bc.target);
	}
	level.var_1b3b480b[var_45c0e4bc.script_index] = var_6b67c295;
	var_6b67c295.var_48550e00 = #"neutral";
	deactivatezone(var_45c0e4bc.script_index);
}

/*
	Name: onzonecapture
	Namespace: namespace_d03f485e
	Checksum: 0x275FE082
	Offset: 0x1D00
	Size: 0x5C4
	Parameters: 1
	Flags: None
*/
function onzonecapture(sentient)
{
	nextzone = function_d018d4fb(level.activezone.index, sentient.team);
	level.activezone setteam(sentient.team);
	if(nextzone >= level.var_1b3b480b.size || nextzone < 0)
	{
		match::set_winner(sentient.team);
		thread globallogic::function_a3e3bd39(sentient.team, 1);
		return;
	}
	otherteam = util::getotherteam(sentient.team);
	if(self.var_48550e00 == #"neutral")
	{
		function_7aa95c76(self, level.var_1845db12[#"neutral"].captured, sentient.team);
		function_7aa95c76(self, level.var_1845db12[#"neutral"].lost, otherteam);
	}
	else
	{
		if(self.var_48550e00 == sentient.team)
		{
			function_7aa95c76(self, level.var_1845db12[#"enemy"].captured, sentient.team);
			function_7aa95c76(self, level.var_1845db12[#"enemy"].lost, otherteam);
		}
		else
		{
			function_7aa95c76(self, level.var_1845db12[#"friendly"].captured, sentient.team);
			function_7aa95c76(self, level.var_1845db12[#"friendly"].lost, otherteam);
		}
	}
	var_e6d916f3 = function_a1ef346b(sentient.team);
	var_cb4f3f61 = function_a1ef346b(otherteam);
	foreach(player in var_e6d916f3)
	{
		player playsoundtoplayer(#"mpl_dom_captured_by_friendly", player);
		var_e0a499e2 = 1;
		player luinotifyevent(#"hash_1006ebdc62e14847", 1, var_e0a499e2);
	}
	foreach(player in var_cb4f3f61)
	{
		player playsoundtoplayer(#"mpl_dom_captured_by_enemy", player);
		var_e0a499e2 = 0;
		player luinotifyevent(#"hash_1006ebdc62e14847", 1, var_e0a499e2);
	}
	self.var_48550e00 = sentient.team;
	self gameobjects::set_owner_team(sentient.team);
	var_6b67c295 = level.var_1b3b480b[level.activezone.index];
	deactivatezone(level.activezone.index);
	thread function_a8049ffd(nextzone, 15);
	user = self gameobjects::function_4e3386a8(sentient.team);
	self thread function_ef09febd(self.users[user].contributors, self.users[user].touching.players, "Capture", 0, 0, 0);
	self function_3e4f6efb();
	level.timelimit = level.timelimit + (level.extratime / 60);
	resume_time();
	function_8b52c845(sentient.team, 50);
	function_f8243b7d(sentient.team);
}

/*
	Name: onupdateuserate
	Namespace: namespace_d03f485e
	Checksum: 0x9AC06BA
	Offset: 0x22D0
	Size: 0x1B4
	Parameters: 0
	Flags: None
*/
function onupdateuserate()
{
	flags = objective_getgamemodeflags(self.objectiveid);
	if(flags === 3 || flags === 4)
	{
		return;
	}
	var_beb65940 = self gameobjects::get_num_touching(game.attackers);
	var_d88c1173 = self gameobjects::get_num_touching(game.defenders);
	function_9fbbd002(self.objectiveid, var_beb65940, game.attackers);
	function_9fbbd002(self.objectiveid, var_d88c1173, game.defenders);
	var_120ba51e = self.var_6e4f06e2;
	self function_547ca9df();
	var_b7469a2f = self.var_6e4f06e2;
	if(var_b7469a2f == var_120ba51e)
	{
		return;
	}
	if(var_b7469a2f == 0)
	{
		self function_853688fc();
	}
	else
	{
		if(var_b7469a2f == 1 || var_b7469a2f == 2)
		{
			self function_9570d54d(self.var_d2711fe1);
		}
		else if(var_b7469a2f == 3)
		{
			self function_b49a79d3();
		}
	}
}

/*
	Name: function_853688fc
	Namespace: namespace_d03f485e
	Checksum: 0xA725BE1F
	Offset: 0x2490
	Size: 0x14
	Parameters: 0
	Flags: Private
*/
function private function_853688fc()
{
	resume_time();
}

/*
	Name: function_9570d54d
	Namespace: namespace_d03f485e
	Checksum: 0xB437A566
	Offset: 0x24B0
	Size: 0x34
	Parameters: 1
	Flags: Private
*/
function private function_9570d54d(team)
{
	function_b4ed1ea0(team);
	pause_time();
}

/*
	Name: function_b49a79d3
	Namespace: namespace_d03f485e
	Checksum: 0xD1D9E2CE
	Offset: 0x24F0
	Size: 0x194
	Parameters: 0
	Flags: Private
*/
function private function_b49a79d3()
{
	foreach(user in self.users)
	{
		foreach(struct in user.touching.players)
		{
			player = struct.player;
			if(isdefined(player) && isplayer(player) && (isdefined(player.var_c8d27c06) ? player.var_c8d27c06 : 0) < gettime())
			{
				player playsoundtoplayer(#"hash_78e92d9f21eef6d1", player);
				player.var_c8d27c06 = gettime() + 5000;
			}
		}
	}
	resume_time();
}

/*
	Name: function_547ca9df
	Namespace: namespace_d03f485e
	Checksum: 0xA17CA711
	Offset: 0x2690
	Size: 0x1F4
	Parameters: 0
	Flags: Private
*/
function private function_547ca9df()
{
	state = self.var_6e4f06e2;
	team = self.var_d2711fe1;
	numallies = (isdefined(self gameobjects::get_num_touching(#"allies")) ? self gameobjects::get_num_touching(#"allies") : 0);
	numaxis = (isdefined(self gameobjects::get_num_touching(#"axis")) ? self gameobjects::get_num_touching(#"axis") : 0);
	if(numallies == 0 && numaxis == 0)
	{
		state = 0;
		team = #"none";
	}
	else
	{
		if(numallies == numaxis)
		{
			state = 3;
			team = #"none";
		}
		else
		{
			if(level.var_a5068446 === 1 || numallies == 0 || numaxis == 0)
			{
				state = (numallies > numaxis ? 1 : 2);
				team = (numallies > numaxis ? #"allies" : #"axis");
			}
			else
			{
				state = 3;
				team = #"none";
			}
		}
	}
	self.var_6e4f06e2 = state;
	self.var_d2711fe1 = team;
	self function_209d6da2(state);
}

/*
	Name: function_3e4f6efb
	Namespace: namespace_d03f485e
	Checksum: 0x19B976BD
	Offset: 0x2890
	Size: 0x3C
	Parameters: 0
	Flags: None
*/
function function_3e4f6efb()
{
	self.var_6e4f06e2 = 0;
	self.var_d2711fe1 = #"none";
	self function_209d6da2(0);
}

/*
	Name: function_6f764775
	Namespace: namespace_d03f485e
	Checksum: 0xDADB37EE
	Offset: 0x28D8
	Size: 0xAA
	Parameters: 2
	Flags: None
*/
function function_6f764775(zoneindex, team)
{
	if(zoneindex === 0 && team === #"axis")
	{
		return true;
	}
	if(zoneindex === (level.var_1b3b480b.size - 1) && team === #"allies")
	{
		return true;
	}
	if(overtime::is_overtime_round() && level.var_30c0a631 === zoneindex)
	{
		return true;
	}
	return false;
}

/*
	Name: function_7aa95c76
	Namespace: namespace_d03f485e
	Checksum: 0xE8FD6004
	Offset: 0x2990
	Size: 0xC6
	Parameters: 3
	Flags: Private
*/
function private function_7aa95c76(zone, dialog, team)
{
	if(!isdefined(level.var_57e2bc08))
	{
		return;
	}
	if(!isdefined(zone.var_8ef53682[team][dialog]) || zone.var_8ef53682[team][dialog] < gettime())
	{
		globallogic_audio::leader_dialog(dialog, team, "zone" + zone.index, undefined, "war");
		zone.var_8ef53682[team][dialog] = gettime() + (int(30 * 1000));
	}
}

/*
	Name: function_7a4fcbfe
	Namespace: namespace_d03f485e
	Checksum: 0x80278F70
	Offset: 0x2A60
	Size: 0x6C
	Parameters: 5
	Flags: Private
*/
function private function_7a4fcbfe(zone, var_b8522be2, team1, var_6f9b2d8c, team2)
{
	function_7aa95c76(zone, var_b8522be2, team1);
	if(isdefined(var_6f9b2d8c) && isdefined(team2))
	{
		function_7aa95c76(zone, var_6f9b2d8c, team2);
	}
}

/*
	Name: function_8df8131e
	Namespace: namespace_d03f485e
	Checksum: 0xB8C4844A
	Offset: 0x2AD8
	Size: 0x264
	Parameters: 3
	Flags: None
*/
function function_8df8131e(zone, team, progress)
{
	if(!isdefined(team) || team == #"none")
	{
		return;
	}
	otherteam = util::getotherteam(team);
	if(!isdefined(zone.var_42388c6f[team]) && progress > 0.05)
	{
		if(function_6f764775(zone.index, team))
		{
			function_7a4fcbfe(zone, "warTakingFinal", team, "warLosingFinal", otherteam);
		}
		else
		{
			if(zone.var_48550e00 == team)
			{
				var_ecdd36b6 = #"friendly";
				var_971743e7 = #"enemy";
			}
			else
			{
				if(zone.var_48550e00 == #"neutral")
				{
					var_ecdd36b6 = #"neutral";
					var_971743e7 = #"neutral";
				}
				else
				{
					var_ecdd36b6 = #"enemy";
					var_971743e7 = #"friendly";
				}
			}
			function_7a4fcbfe(zone, level.var_1845db12[var_ecdd36b6].taking, team, level.var_1845db12[var_971743e7].losing, otherteam);
		}
		zone.var_42388c6f[team] = 1;
	}
	else if(function_6f764775(zone.index, team) && progress > 0.5 && !isdefined(zone.var_4ebbe2f5))
	{
		zone.var_4ebbe2f5 = 1;
		function_7a4fcbfe(zone, "warRoundEndNearWinningFinal", team, "warRoundEndNearLosingFinal", otherteam);
	}
}

/*
	Name: function_b4ed1ea0
	Namespace: namespace_d03f485e
	Checksum: 0x4FB31DBE
	Offset: 0x2D48
	Size: 0x188
	Parameters: 1
	Flags: None
*/
function function_b4ed1ea0(capturingteam)
{
	losingteam = util::getotherteam(capturingteam);
	var_e6d916f3 = function_a1ef346b(capturingteam);
	var_6d179b9d = function_a1ef346b(losingteam);
	foreach(player in var_e6d916f3)
	{
		player playsoundtoplayer(#"hash_5739d2bc3554b3f9", player);
	}
	foreach(player in var_6d179b9d)
	{
		player playsoundtoplayer(#"hash_3d00e79976c2e9da", player);
	}
}

/*
	Name: on_use_update
	Namespace: namespace_d03f485e
	Checksum: 0xD07914E9
	Offset: 0x2ED8
	Size: 0xA4
	Parameters: 3
	Flags: None
*/
function on_use_update(var_b65ea6f2, progress, change)
{
	function_8df8131e(self, self.var_d2711fe1, change);
	if(progress == #"allies")
	{
		objective_setgamemodeflags(self.objectiveid, 1);
	}
	else if(progress == #"axis")
	{
		objective_setgamemodeflags(self.objectiveid, 2);
	}
}

/*
	Name: on_touch_use
	Namespace: namespace_d03f485e
	Checksum: 0xF85880E1
	Offset: 0x2F88
	Size: 0xCC
	Parameters: 1
	Flags: None
*/
function on_touch_use(player)
{
	if(!isplayer(player))
	{
		return;
	}
	team = self.var_d2711fe1;
	if(isdefined(team) && team != #"none")
	{
		if(team == player.team)
		{
			player playsoundtoplayer(#"hash_5739d2bc3554b3f9", player);
		}
		else
		{
			player playsoundtoplayer(#"hash_3d00e79976c2e9da", player);
		}
		battlechatter::function_98898d14(player, self);
	}
}

/*
	Name: getuseratemultiplier
	Namespace: namespace_d03f485e
	Checksum: 0x946EA5C2
	Offset: 0x3060
	Size: 0x4A
	Parameters: 1
	Flags: None
*/
function getuseratemultiplier(var_a4926509)
{
	return (isdefined(level.var_fcf0897a[self.var_d2711fe1].multiplier) ? level.var_fcf0897a[self.var_d2711fe1].multiplier : 1);
}

/*
	Name: function_d018d4fb
	Namespace: namespace_d03f485e
	Checksum: 0x6DF4F92C
	Offset: 0x30B8
	Size: 0x50
	Parameters: 2
	Flags: Private
*/
function private function_d018d4fb(var_c1647e26, winningteam)
{
	if(winningteam == #"allies")
	{
		var_c1647e26++;
	}
	else if(winningteam == #"axis")
	{
		var_c1647e26--;
	}
	return var_c1647e26;
}

/*
	Name: function_582a1641
	Namespace: namespace_d03f485e
	Checksum: 0x754F64EC
	Offset: 0x3110
	Size: 0x52
	Parameters: 0
	Flags: Private
*/
function private function_582a1641()
{
	if(overtime::is_overtime_round() && isdefined(level.var_30c0a631))
	{
		return level.var_30c0a631;
	}
	return int(level.var_1b3b480b.size / 2);
}

/*
	Name: deactivatezone
	Namespace: namespace_d03f485e
	Checksum: 0xDC422951
	Offset: 0x3170
	Size: 0x148
	Parameters: 1
	Flags: Private
*/
function private deactivatezone(zoneindex)
{
	var_6b67c295 = level.var_1b3b480b[zoneindex];
	var_6b67c295 gameobjects::allow_use(#"hash_161f03feaadc9b8f");
	var_6b67c295 gameobjects::set_visible(#"hash_161f03feaadc9b8f");
	var_6b67c295.var_cddc87d1 = 0;
	objective_setgamemodeflags(var_6b67c295.objectiveid, 4);
	level clientfield::set("war_zone", 5);
	if(isdefined(var_6b67c295.var_142ad58e))
	{
		foreach(visual in var_6b67c295.var_142ad58e)
		{
			visual ghost();
		}
	}
}

/*
	Name: function_a8049ffd
	Namespace: namespace_d03f485e
	Checksum: 0xBF62D512
	Offset: 0x32C0
	Size: 0x154
	Parameters: 2
	Flags: Private
*/
function private function_a8049ffd(zoneindex, spawndelay)
{
	/#
		assert(isdefined(level.var_1b3b480b[zoneindex]), "" + zoneindex);
	#/
	var_6b67c295 = level.var_1b3b480b[zoneindex];
	var_6b67c295 gameobjects::set_visible(#"hash_5ccfd7bbbf07c770");
	var_6b67c295 gameobjects::set_owner_team(#"neutral");
	level.activezone = var_6b67c295;
	level clientfield::set("war_zone", zoneindex);
	objective_setgamemodeflags(var_6b67c295.objectiveid, 3);
	var_6b67c295.var_8ef53682 = [];
	var_6b67c295.var_8ef53682[#"allies"] = [];
	var_6b67c295.var_8ef53682[#"axis"] = [];
	var_6b67c295.var_42388c6f = [];
	function_98b8ad44(zoneindex, spawndelay);
}

/*
	Name: function_98b8ad44
	Namespace: namespace_d03f485e
	Checksum: 0x73BA1E7C
	Offset: 0x3420
	Size: 0x38C
	Parameters: 2
	Flags: Private
*/
function private function_98b8ad44(zoneindex, var_59c3107a)
{
	level endon(#"game_ended");
	var_6b67c295 = level.var_1b3b480b[zoneindex];
	var_94755ba1 = gettime();
	var_f5929597 = (int(var_59c3107a * 1000)) + var_94755ba1;
	setbombtimer("A", var_f5929597);
	setmatchflag("bomb_timer_a", 1);
	while(gettime() < var_f5929597)
	{
		wait(var_59c3107a);
	}
	setmatchflag("bomb_timer_a", 0);
	var_6b67c295 gameobjects::allow_use(#"hash_33c49a99551acae7");
	var_6b67c295 gameobjects::must_maintain_claim(0);
	var_6b67c295 gameobjects::can_contest_claim(1);
	var_6b67c295.var_cddc87d1 = 1;
	objective_setgamemodeflags(var_6b67c295.objectiveid, 0);
	objective_setprogress(var_6b67c295.objectiveid, 0);
	var_beb65940 = var_6b67c295 gameobjects::get_num_touching(game.attackers);
	var_d88c1173 = var_6b67c295 gameobjects::get_num_touching(game.defenders);
	function_9fbbd002(var_6b67c295.objectiveid, var_beb65940, game.attackers);
	function_9fbbd002(var_6b67c295.objectiveid, var_d88c1173, game.defenders);
	if(var_6b67c295.var_48550e00 == #"neutral")
	{
		function_7a4fcbfe(var_6b67c295, "warZoneAvailable_WasNeutral", #"allies", "warZoneAvailable_WasNeutral", #"axis");
	}
	else
	{
		otherteam = util::getotherteam(var_6b67c295.var_48550e00);
		function_7a4fcbfe(var_6b67c295, "warZoneAvailable_WasFriendly", var_6b67c295.var_48550e00, "warZoneAvailable_WasEnemy", otherteam);
	}
	if(isdefined(var_6b67c295.var_142ad58e))
	{
		foreach(visual in var_6b67c295.var_142ad58e)
		{
			visual show();
		}
	}
	setbombtimer("A", 0);
}

/*
	Name: function_f04cf79a
	Namespace: namespace_d03f485e
	Checksum: 0x42FF76B2
	Offset: 0x37B8
	Size: 0x98
	Parameters: 0
	Flags: Private
*/
function private function_f04cf79a()
{
	foreach(warzone in level.var_1b3b480b)
	{
		warzone gameobjects::allow_use(#"hash_161f03feaadc9b8f");
	}
}

/*
	Name: function_259770ba
	Namespace: namespace_d03f485e
	Checksum: 0xB3AAAC6D
	Offset: 0x3858
	Size: 0x42
	Parameters: 1
	Flags: Private
*/
function private function_259770ba(e_player)
{
	if(spawning::usestartspawns())
	{
		return undefined;
	}
	return function_b11bd4e4(level.activezone.index);
}

/*
	Name: function_b11bd4e4
	Namespace: namespace_d03f485e
	Checksum: 0xEC3711A2
	Offset: 0x38A8
	Size: 0xB2
	Parameters: 1
	Flags: Private
*/
function private function_b11bd4e4(var_f99d1b44)
{
	switch(var_f99d1b44)
	{
		case 0:
		{
			return "spl1";
			break;
		}
		case 1:
		{
			return "spl2";
			break;
		}
		case 2:
		{
			return "spl3";
			break;
		}
		case 3:
		{
			return "spl4";
			break;
		}
		case 4:
		{
			return "spl5";
			break;
		}
	}
	return "auto_normal";
}

/*
	Name: ontimelimit
	Namespace: namespace_d03f485e
	Checksum: 0x69F19480
	Offset: 0x3968
	Size: 0x7C
	Parameters: 0
	Flags: None
*/
function ontimelimit()
{
	if(overtime::is_overtime_round())
	{
		round::set_winner(level.activezone gameobjects::function_14fccbd9());
	}
	else
	{
		round::set_flag("tie");
	}
	thread globallogic::end_round(2);
}

/*
	Name: function_ef09febd
	Namespace: namespace_d03f485e
	Checksum: 0x47978C7D
	Offset: 0x39F0
	Size: 0x384
	Parameters: 6
	Flags: None
*/
function function_ef09febd(var_1dbb2b2b, var_6d7ae157, string, var_24672ed6, var_81b74b24, neutralizing)
{
	time = gettime();
	waitframe(1);
	util::waittillslowprocessallowed();
	var_b4613aa2 = [];
	earliestplayer = undefined;
	foreach(contribution in var_1dbb2b2b)
	{
		if(isdefined(contribution))
		{
			contributor = contribution.player;
			if(isdefined(contributor) && isdefined(contribution.contribution))
			{
				percentage = (100 * contribution.contribution) / self.usetime;
				contributor.var_759a143b = int(0.5 + percentage);
				contributor.var_1aea8209 = contribution.starttime;
				if(percentage < getgametypesetting(#"contributionmin"))
				{
					continue;
				}
				if(contribution.var_e22ea52b && (!isdefined(earliestplayer) || contributor.var_1aea8209 < earliestplayer.var_1aea8209))
				{
					earliestplayer = contributor;
				}
				if(!isdefined(var_b4613aa2))
				{
					var_b4613aa2 = [];
				}
				else if(!isarray(var_b4613aa2))
				{
					var_b4613aa2 = array(var_b4613aa2);
				}
				var_b4613aa2[var_b4613aa2.size] = contributor;
			}
		}
	}
	foreach(player in var_b4613aa2)
	{
		var_a84f97bf = earliestplayer === player;
		var_af8f6146 = 0;
		foreach(touch in var_6d7ae157)
		{
			if(!isdefined(touch))
			{
				continue;
			}
			if(touch.player === player)
			{
				var_af8f6146 = 1;
				break;
			}
		}
		credit_player(player, string, var_24672ed6, var_81b74b24, neutralizing, time, var_a84f97bf, var_af8f6146);
	}
	self gameobjects::function_bd47b0c7();
}

/*
	Name: credit_player
	Namespace: namespace_d03f485e
	Checksum: 0xE37126C3
	Offset: 0x3D80
	Size: 0x306
	Parameters: 8
	Flags: None
*/
function credit_player(player, string, var_24672ed6, var_81b74b24, neutralizing, time, var_a84f97bf, var_af8f6146)
{
	if(isdefined(time.pers[#"captures"]))
	{
		time.pers[#"captures"]++;
		time.captures = time.pers[#"captures"];
	}
	time.pers[#"objectives"]++;
	time.objectives = time.pers[#"objectives"];
	time recordgameevent("capture");
	level thread telemetry::function_18135b72(#"hash_540cddd637f71a5e", {#eventtype:#"capture", #player:time});
	demo::bookmark(#"event", gettime(), time);
	potm::bookmark(#"event", gettime(), time);
	time challenges::capturedobjective(var_a84f97bf, self.trigger);
	time stats::function_bb7eedf0(#"captures", 1);
	time globallogic_score::incpersstat(#"objectivescore", 1, 0, 1);
	battlechatter::function_924699f4(time, self);
	scoreevents::processscoreevent(#"hash_7e200352fdeb6fd0", time);
	if(var_af8f6146)
	{
		time stats::function_dad108fa(#"hash_2f1df496791a2f5f", 1);
		time contracts::increment_contract(#"hash_4fa0008b60deaab4");
	}
	if(time.var_759a143b >= 100)
	{
		scoreevents::processscoreevent(#"hash_4cd014c5a7bb237d", time);
	}
	time luinotifyevent(#"hash_289bacbf80b953c9", 2, self.objectiveid, time.var_759a143b);
	time.var_759a143b = undefined;
}

/*
	Name: function_215b6757
	Namespace: namespace_d03f485e
	Checksum: 0x50312204
	Offset: 0x4090
	Size: 0x128
	Parameters: 0
	Flags: Private
*/
function private function_215b6757()
{
	level.var_fcf0897a = [];
	foreach(value in level.teams)
	{
		entry = {#currentlevel:0, #value:0, #multiplier:1};
		level.var_fcf0897a[team] = entry;
	}
	level.var_8fec4866 = int(100);
	level.var_277bdbaa = int(200) - level.var_8fec4866;
}

/*
	Name: function_8b52c845
	Namespace: namespace_d03f485e
	Checksum: 0x720BBEE0
	Offset: 0x41C0
	Size: 0x9C
	Parameters: 2
	Flags: Private
*/
function private function_8b52c845(team, amount)
{
	var_64b9232b = level.var_fcf0897a[team];
	if(!isdefined(var_64b9232b) || !isdefined(amount))
	{
		return;
	}
	if(var_64b9232b.currentlevel === 2)
	{
		return;
	}
	var_64b9232b.value = math::clamp(var_64b9232b.value + amount, 0, 200);
	function_56b5dd3f(team);
}

/*
	Name: function_f8243b7d
	Namespace: namespace_d03f485e
	Checksum: 0x44EB25B1
	Offset: 0x4268
	Size: 0xB0
	Parameters: 1
	Flags: Private
*/
function private function_f8243b7d(friendlyteam)
{
	foreach(team, value in level.teams)
	{
		if(!isdefined(team) || team === friendlyteam)
		{
			continue;
		}
		function_1bdafb6d(team);
	}
}

/*
	Name: function_1bdafb6d
	Namespace: namespace_d03f485e
	Checksum: 0x30E2D92C
	Offset: 0x4320
	Size: 0x92
	Parameters: 1
	Flags: Private
*/
function private function_1bdafb6d(team)
{
	var_64b9232b = level.var_fcf0897a[team];
	if(!isdefined(var_64b9232b))
	{
		return;
	}
	var_64b9232b.multiplier = 1;
	var_64b9232b.value = 0;
	var_64b9232b.currentlevel = 0;
	level.var_a9be97d8[team] = undefined;
	function_c1d8ad94(team);
	level notify("war_team_momentum_reset_" + team);
}

/*
	Name: function_56b5dd3f
	Namespace: namespace_d03f485e
	Checksum: 0x65CAC503
	Offset: 0x43C0
	Size: 0x2E4
	Parameters: 1
	Flags: Private
*/
function private function_56b5dd3f(team)
{
	var_64b9232b = level.var_fcf0897a[team];
	if(!isdefined(var_64b9232b))
	{
		return;
	}
	var_d8ade85 = var_64b9232b.currentlevel;
	if(var_64b9232b.value >= 200)
	{
		var_64b9232b.multiplier = 3;
		var_64b9232b.currentlevel = 2;
		level thread function_33587c8c(team);
		multiplier = 3;
		foreach(player in getplayers(team))
		{
			player luinotifyevent(#"hash_4e128be5bc1a0226", 1, multiplier);
			player playsoundtoplayer(#"hash_691ccafec8b6c07f", player);
		}
	}
	else
	{
		if(var_64b9232b.value >= 100)
		{
			var_64b9232b.multiplier = 2;
			var_64b9232b.currentlevel = 1;
			if(!isdefined(level.var_a9be97d8[team]))
			{
				level.var_a9be97d8[team] = 1;
				multiplier = 2;
				foreach(player in getplayers(team))
				{
					player luinotifyevent(#"hash_4e128be5bc1a0226", 1, multiplier);
					player playsoundtoplayer(#"hash_691ccbfec8b6c232", player);
				}
			}
		}
		else
		{
			var_64b9232b.multiplier = 1;
			var_64b9232b.currentlevel = 0;
		}
	}
	if(var_d8ade85 < var_64b9232b.currentlevel)
	{
		globallogic_audio::leader_dialog("warBuildingMomentum", team, undefined, undefined, "war");
	}
	function_c1d8ad94(team);
}

/*
	Name: function_33587c8c
	Namespace: namespace_d03f485e
	Checksum: 0x6B543866
	Offset: 0x46B0
	Size: 0x19C
	Parameters: 1
	Flags: Private
*/
function private function_33587c8c(team)
{
	var_64b9232b = level.var_fcf0897a[team];
	if(!isdefined(var_64b9232b) || var_64b9232b.multiplier < 3)
	{
		return;
	}
	var_17b7891d = "55e0d344ce4d9347" + team;
	self notify(var_17b7891d);
	self endon(var_17b7891d);
	level endon(#"game_ended", "war_team_momentum_reset_" + team);
	starttime = gettime();
	totaltime = int(60 * 1000);
	endtime = starttime + totaltime;
	var_ae0de673 = 100;
	while(gettime() < endtime)
	{
		elapsedtime = gettime() - starttime;
		fraction = math::clamp(elapsedtime / totaltime, 0, 1);
		var_64b9232b.value = 200 - (var_ae0de673 * fraction);
		function_c1d8ad94(team);
		waitframe(1);
	}
	var_64b9232b.multiplier = 2;
	var_64b9232b.value = 100;
	var_64b9232b.currentlevel = 1;
	function_c1d8ad94(team);
}

/*
	Name: function_c1d8ad94
	Namespace: namespace_d03f485e
	Checksum: 0xA90A95B9
	Offset: 0x4858
	Size: 0x1BC
	Parameters: 1
	Flags: Private
*/
function private function_c1d8ad94(team)
{
	var_64b9232b = level.var_fcf0897a[team];
	if(!isdefined(var_64b9232b))
	{
		return;
	}
	var_a501243e = math::clamp(var_64b9232b.value / level.var_8fec4866, 0, 1);
	var_f304a0c3 = math::clamp((var_64b9232b.value - level.var_8fec4866) / level.var_277bdbaa, 0, 1);
	currentlevel = (isdefined(var_64b9232b.currentlevel) ? var_64b9232b.currentlevel : 0);
	if(team === #"allies")
	{
		level clientfield::set_world_uimodel("team_momentum.level1PercentageAllies", var_a501243e);
		level clientfield::set_world_uimodel("team_momentum.level2PercentageAllies", var_f304a0c3);
		level clientfield::set_world_uimodel("team_momentum.currentLevelAllies", currentlevel);
	}
	else if(team === #"axis")
	{
		level clientfield::set_world_uimodel("team_momentum.level1PercentageAxis", var_a501243e);
		level clientfield::set_world_uimodel("team_momentum.level2PercentageAxis", var_f304a0c3);
		level clientfield::set_world_uimodel("team_momentum.currentLevelAxis", currentlevel);
	}
}

/*
	Name: pause_time
	Namespace: namespace_d03f485e
	Checksum: 0xC585DE2
	Offset: 0x4A20
	Size: 0x3C
	Parameters: 0
	Flags: None
*/
function pause_time()
{
	if(level.timerpaused !== 1)
	{
		globallogic_utils::pausetimer();
		level.timerpaused = 1;
	}
}

/*
	Name: resume_time
	Namespace: namespace_d03f485e
	Checksum: 0x6003D2E9
	Offset: 0x4A68
	Size: 0x38
	Parameters: 0
	Flags: None
*/
function resume_time()
{
	if(level.timerpaused === 1)
	{
		globallogic_utils::resumetimer();
		level.timerpaused = 0;
	}
}

/*
	Name: function_ed2b0a19
	Namespace: namespace_d03f485e
	Checksum: 0x282322DA
	Offset: 0x4AA8
	Size: 0x74
	Parameters: 0
	Flags: None
*/
function function_ed2b0a19()
{
	/#
		for(index = 0; index < 5; index++)
		{
			spawning::function_25e7711a(function_b11bd4e4(index), #"none", ("" + index) + "", "");
		}
	#/
}

/*
	Name: function_fac7cc65
	Namespace: namespace_d03f485e
	Checksum: 0x686C627A
	Offset: 0x4B28
	Size: 0x6C
	Parameters: 2
	Flags: None
*/
function function_fac7cc65(gameobject, starting)
{
	if(!isdefined(starting))
	{
		starting = 0;
	}
	if(!isdefined(self))
	{
		return;
	}
	if(!isdefined(gameobject))
	{
		return;
	}
	if(starting)
	{
		self thread function_15cbf89(gameobject);
	}
	else
	{
		self thread function_4242921c(gameobject);
	}
}

/*
	Name: function_15cbf89
	Namespace: namespace_d03f485e
	Checksum: 0x9EF7DF
	Offset: 0x4BA0
	Size: 0x45E
	Parameters: 1
	Flags: None
*/
function function_15cbf89(gameobject)
{
	self notify("648947d14f1210df");
	self endon("648947d14f1210df");
	self endon(#"death", #"disconnect", #"hash_580789b91ba9f984");
	gameobject.trigger endon(#"destroyed", #"death");
	level endon(#"game_ended");
	waitframe(1);
	while(true)
	{
		currentprogress = gameobject.curprogress;
		var_f802a6b1 = gameobject.usetime;
		var_e672537f = currentprogress / var_f802a6b1;
		var_5b37f77b = gameobject.var_a4926509;
		iscontested = (isdefined(gameobject.var_6e4f06e2) ? gameobject.var_6e4f06e2 : 0) === 3;
		if(!is_true(gameobject.var_cddc87d1))
		{
			if(self.var_a022edea === "cap_war_percent_90")
			{
				self function_2ba2d8e5("cap_war_success");
			}
			else
			{
				self function_2ba2d8e5("");
			}
			self.var_b3890fdf = 0;
		}
		else
		{
			if(iscontested)
			{
				self function_d24432a4("cap_war_contested");
				self function_2ba2d8e5("cap_war_contested");
			}
			else
			{
				if(isdefined(gameobject.ownerteam) && gameobject.ownerteam === self.team)
				{
					if(self.var_a022edea === "cap_war_contested")
					{
						self function_2ba2d8e5("cap_war_exit");
					}
					else
					{
						self function_2ba2d8e5("");
					}
					self.var_b3890fdf = 0;
				}
				else
				{
					if(var_5b37f77b != self.team)
					{
						self function_d24432a4("cap_war_draining");
						self function_2ba2d8e5("cap_war_draining");
					}
					else
					{
						if(var_e672537f >= 0.8)
						{
							self function_d24432a4("cap_war_percent_90");
							self function_2ba2d8e5("cap_war_percent_90");
						}
						else
						{
							if(var_e672537f >= 0.6)
							{
								self function_d24432a4("cap_war_percent_75");
								self function_2ba2d8e5("cap_war_percent_75");
							}
							else
							{
								if(var_e672537f >= 0.4)
								{
									self function_d24432a4("cap_war_percent_50");
									self function_2ba2d8e5("cap_war_percent_50");
								}
								else
								{
									if(var_e672537f >= 0.2)
									{
										self function_d24432a4("cap_war_percent_25");
										self function_2ba2d8e5("cap_war_percent_25");
									}
									else if(var_e672537f >= 0)
									{
										self function_d24432a4("cap_war_percent_0");
										self function_2ba2d8e5("cap_war_percent_0");
									}
								}
							}
						}
					}
				}
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_4242921c
	Namespace: namespace_d03f485e
	Checksum: 0xBD5CD2A2
	Offset: 0x5008
	Size: 0xDA
	Parameters: 2
	Flags: None
*/
function function_4242921c(gameobject, success)
{
	if(!isdefined(success))
	{
		success = 0;
	}
	if(!is_true(gameobject.var_cddc87d1))
	{
		self function_2ba2d8e5("");
		self.var_b3890fdf = 0;
		self notify(#"hash_580789b91ba9f984");
		return;
	}
	if(success)
	{
		self function_2ba2d8e5("cap_war_success");
	}
	else
	{
		self function_2ba2d8e5("cap_war_exit");
		self notify(#"hash_580789b91ba9f984");
		self.var_b3890fdf = 0;
	}
}

/*
	Name: function_2ba2d8e5
	Namespace: namespace_d03f485e
	Checksum: 0xB46D1B76
	Offset: 0x50F0
	Size: 0x7C
	Parameters: 1
	Flags: None
*/
function function_2ba2d8e5(state)
{
	if(!isdefined(self.var_a022edea))
	{
		self.var_a022edea = "";
	}
	if(is_true(level.var_2179a6bf))
	{
		return;
	}
	if(state != self.var_a022edea)
	{
		self.var_a022edea = state;
		globallogic_audio::function_c246758e(state);
	}
}

/*
	Name: function_d24432a4
	Namespace: namespace_d03f485e
	Checksum: 0xAD8D17
	Offset: 0x5178
	Size: 0x254
	Parameters: 1
	Flags: None
*/
function function_d24432a4(state)
{
	if(!isdefined(self.var_b3890fdf))
	{
		self.var_b3890fdf = 0;
	}
	if(game.state != #"playing")
	{
		return;
	}
	str_alias = undefined;
	switch(state)
	{
		case "cap_war_percent_0":
		{
			str_alias = #"hash_1c518fb856754e14";
			n_waittime = 2.5;
			break;
		}
		case "cap_war_percent_25":
		{
			str_alias = #"hash_1c5192b85675532d";
			n_waittime = 2.5;
			break;
		}
		case "cap_war_percent_50":
		{
			str_alias = #"hash_1c5192b85675532d";
			n_waittime = 1.25;
			break;
		}
		case "cap_war_percent_75":
		{
			str_alias = #"hash_1c5191b85675517a";
			n_waittime = 1.25;
			break;
		}
		case "cap_war_percent_90":
		{
			str_alias = #"hash_1c518cb8567548fb";
			n_waittime = 1.25;
			break;
		}
		case "cap_war_draining":
		{
			str_alias = #"hash_1c518fb856754e14";
			n_waittime = 2.5;
			break;
		}
		case "cap_war_contested":
		{
			str_alias = #"hash_43014e1f7354354f";
			n_waittime = 1.25;
			break;
		}
	}
	if(isdefined(str_alias))
	{
		var_bb0c6711 = gettime();
		if(self.var_b3890fdf <= var_bb0c6711)
		{
			if(self.var_b3890fdf === 0)
			{
				self.var_b3890fdf = var_bb0c6711 - 50;
			}
			self.var_b3890fdf = self.var_b3890fdf + (int(n_waittime * 1000));
			self playlocalsound(str_alias);
		}
	}
}

