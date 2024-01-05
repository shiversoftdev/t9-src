#using scripts\killstreaks\recon_plane.gsc;
#using scripts\killstreaks\mp\uav.gsc;
#using scripts\weapons\weapon_utils.gsc;
#using scripts\mp_common\util.gsc;
#using scripts\mp_common\player\player_utils.gsc;
#using scripts\mp_common\gametypes\match.gsc;
#using scripts\mp_common\gametypes\spawning.gsc;
#using scripts\mp_common\gametypes\globallogic_defaults.gsc;
#using scripts\mp_common\gametypes\globallogic_utils.gsc;
#using scripts\mp_common\gametypes\globallogic_score.gsc;
#using script_1cc417743d7c262d;
#using scripts\mp_common\gametypes\globallogic.gsc;
#using scripts\mp_common\gametypes\gametype.gsc;
#using scripts\mp_common\challenges.gsc;
#using scripts\core_common\armor.gsc;
#using script_3d703ef87a841fe4;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\player\player_loadout.gsc;
#using scripts\core_common\gestures.gsc;
#using scripts\core_common\music_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\hud_message_shared.gsc;
#using scripts\core_common\hostmigration_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\influencers_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\struct.gsc;
#using script_44b0b8420eabacad;
#using scripts\core_common\spawning_shared.gsc;
#using script_335d0650ed05d36d;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\player\player_role.gsc;
#using scripts\core_common\gameobjects_shared.gsc;

#namespace dropkick;

/*
	Name: main
	Namespace: dropkick
	Checksum: 0x135F4E85
	Offset: 0x380
	Size: 0x314
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	globallogic::init();
	util::registerroundscorelimit(0, 10000);
	level.takelivesondeath = 1;
	level.var_8abcfbb8 = getgametypesetting(#"capturetime");
	level.carryscore = getgametypesetting(#"carryscore");
	level.var_6ecc0fa6 = (isdefined(getgametypesetting(#"idleflagresettime")) ? getgametypesetting(#"idleflagresettime") : 0);
	level.var_ce802423 = 1;
	level.var_95fa13a1 = (isdefined(getgametypesetting(#"hash_5d0b23ea21b37f41")) ? getgametypesetting(#"hash_5d0b23ea21b37f41") : 0);
	level.onstartgametype = &onstartgametype;
	level.onspawnplayer = &onspawnplayer;
	level.onspawnspectator = &onspawnspectator;
	level.onscorelimit = &onscorelimit;
	player::function_3c5cc656(&function_610d3790);
	player::function_cf3aa03d(&onplayerkilled);
	level.player_team_mask = getteammask(#"allies");
	level.enemy_team_mask = getteammask(#"axis");
	spawning::addsupportedspawnpointtype("dropkick");
	spawning::addsupportedspawnpointtype("tdm");
	spawning::function_32b97d1b(&spawning::function_90dee50d);
	spawning::function_adbbb58a(&spawning::function_c24e290c);
	clientfield::register("world", "" + #"hash_69d32ac298f2aa22", 1, 2, "int");
	level.var_2ee800c8 = "dropkickNearWinning";
	level.var_78739954 = "dropkickNearLosing";
}

/*
	Name: onstartgametype
	Namespace: dropkick
	Checksum: 0x8F19EF8F
	Offset: 0x6A0
	Size: 0x3C
	Parameters: 0
	Flags: None
*/
function onstartgametype()
{
	level thread onscoreclosemusic();
	function_2f873f5e();
	function_4e92a5e8();
}

/*
	Name: onscorelimit
	Namespace: dropkick
	Checksum: 0x45DA0680
	Offset: 0x6E8
	Size: 0xBC
	Parameters: 0
	Flags: None
*/
function onscorelimit()
{
	if(level.var_f2a67a5d === 1)
	{
		return;
	}
	level notify(#"score_limit_reached");
	level.var_f2a67a5d = 1;
	function_b256c6a7();
	winner = teams::function_ef80de99();
	thread globallogic_audio::leader_dialog("dropkickGameWon", winner);
	thread globallogic_audio::leader_dialog_for_other_teams("dropkickGameLost", winner);
	level thread end_round();
}

/*
	Name: end_round
	Namespace: dropkick
	Checksum: 0xC928A1CE
	Offset: 0x7B0
	Size: 0xD4
	Parameters: 0
	Flags: None
*/
function end_round()
{
	level childthread function_1a67afed();
	level childthread do_rumble();
	level childthread function_86ca9275();
	level childthread function_311e397d();
	level childthread function_68f13f40();
	music::setmusicstate("dropkick_round_end");
	playsoundatposition(#"hash_31f07589beb0a02e", (0, 0, 0));
	wait(11);
	globallogic_defaults::default_onscorelimit();
}

/*
	Name: function_610d3790
	Namespace: dropkick
	Checksum: 0x6454B096
	Offset: 0x890
	Size: 0x13E
	Parameters: 4
	Flags: None
*/
function function_610d3790(einflictor, victim, idamage, weapon)
{
	if(level.var_f2a67a5d === 1)
	{
		return;
	}
	attacker = self;
	if(!isplayer(attacker) || !isplayer(idamage) || attacker.pers[#"team"] === idamage.pers[#"team"])
	{
		return;
	}
	if(attacker === level.var_1d402358 || idamage === level.var_1d402358)
	{
		attacker challenges::function_2f462ffd(idamage, weapon, victim, level.var_bb695b91);
		attacker.pers[#"objectiveekia"]++;
		attacker.objectiveekia = attacker.pers[#"objectiveekia"];
	}
}

/*
	Name: onplayerkilled
	Namespace: dropkick
	Checksum: 0x4CE9EC07
	Offset: 0x9D8
	Size: 0x32C
	Parameters: 9
	Flags: None
*/
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration)
{
	if(level.var_f2a67a5d === 1)
	{
		return;
	}
	victim = self;
	if(!isplayer(shitloc) || !isplayer(victim) || shitloc.pers[#"team"] === victim.pers[#"team"])
	{
		return;
	}
	if(shitloc === level.var_1d402358)
	{
		scoreevents::processscoreevent(#"hash_487edfe4eab89682", shitloc, victim, deathanimduration);
		if(weapons::ismeleemod(psoffsettime))
		{
			scoreevents::processscoreevent(#"hash_18b5a81700734b76", shitloc, victim, deathanimduration);
		}
		if(!isdefined(level.var_13faac26))
		{
			level.var_13faac26 = 0;
		}
		level.var_13faac26++;
		if(level.var_13faac26 == 5)
		{
			scoreevents::processscoreevent(#"hash_6926a7955b525980", shitloc, victim, deathanimduration);
		}
	}
	else
	{
		if(victim === level.var_1d402358)
		{
			level.var_d0bebb68 = shitloc;
			scoreevents::processscoreevent(#"hash_2fa5091c22f8e529", shitloc, victim, deathanimduration);
		}
		else if(isdefined(level.var_1d402358) && isalive(level.var_1d402358) && shitloc.team === level.var_1d402358.team)
		{
			if(isdefined(level.var_1d402358.attackerdata) && isdefined(victim.clientid))
			{
				if(isdefined(level.var_1d402358.attackerdata[victim.clientid]))
				{
					scoreevents::processscoreevent(#"hash_576110aaf8aa4c5", shitloc, victim, deathanimduration);
				}
			}
			if(distance2dsquared(shitloc.origin, level.var_1d402358.origin) < level.defaultoffenseradiussq)
			{
				scoreevents::processscoreevent(#"hash_13fa27ec1b3826b5", shitloc, victim);
			}
		}
	}
}

/*
	Name: onspawnplayer
	Namespace: dropkick
	Checksum: 0x7ED08CD0
	Offset: 0xD10
	Size: 0x6C
	Parameters: 1
	Flags: None
*/
function onspawnplayer(predictedspawn)
{
	if(spawning::usestartspawns() && !level.ingraceperiod && !level.playerqueuedrespawn)
	{
		spawning::function_7a87efaa();
	}
	spawning::onspawnplayer(predictedspawn);
}

/*
	Name: onspawnspectator
	Namespace: dropkick
	Checksum: 0xF1525662
	Offset: 0xD88
	Size: 0x64
	Parameters: 2
	Flags: None
*/
function onspawnspectator(origin, angles)
{
	if(!self mayspawn())
	{
		hud_message::setlowermessage(#"hash_366993465c98de65");
	}
	globallogic_defaults::default_onspawnspectator(origin, angles);
}

/*
	Name: function_2f873f5e
	Namespace: dropkick
	Checksum: 0xB89E26D5
	Offset: 0xDF8
	Size: 0xAC
	Parameters: 0
	Flags: Private
*/
function private function_2f873f5e()
{
	if(level.waverespawndelay)
	{
		foreach(team in level.teams)
		{
			level.wavedelay[team] = 0;
		}
	}
	else
	{
		level.mayspawn = &mayspawn;
	}
}

/*
	Name: mayspawn
	Namespace: dropkick
	Checksum: 0x4EF1827
	Offset: 0xEB0
	Size: 0x44
	Parameters: 0
	Flags: None
*/
function mayspawn()
{
	if(!isdefined(self.team) || !isdefined(level.var_1d402358))
	{
		return 1;
	}
	return self.team != level.var_1d402358.team;
}

/*
	Name: function_907e4c8f
	Namespace: dropkick
	Checksum: 0x5524F0B1
	Offset: 0xF00
	Size: 0x100
	Parameters: 0
	Flags: None
*/
function function_907e4c8f()
{
	if(!isdefined(self))
	{
		return;
	}
	if(isalive(self) || self.pers[#"team"] === #"spectator")
	{
		return;
	}
	if(!globallogic_utils::isvalidclass(self.pers[#"class"]))
	{
		self.pers[#"class"] = "CLASS_CUSTOM1";
		self.curclass = self.pers[#"class"];
	}
	if(!self function_8b1a219a())
	{
		self closeingamemenu();
	}
	self thread [[level.spawnclient]]();
}

/*
	Name: onscoreclosemusic
	Namespace: dropkick
	Checksum: 0xB29F5DC3
	Offset: 0x1008
	Size: 0x1B4
	Parameters: 0
	Flags: None
*/
function onscoreclosemusic()
{
	teamscores = [];
	while(!level.gameended)
	{
		scorelimit = level.scorelimit;
		scorethreshold = scorelimit * 0.1;
		scorethresholdstart = abs(scorelimit - scorethreshold);
		scorelimitcheck = scorelimit - 10;
		topscore = 0;
		runnerupscore = 0;
		foreach(_ in level.teams)
		{
			score = [[level._getteamscore]](team);
			if(score > topscore)
			{
				runnerupscore = topscore;
				topscore = score;
				continue;
			}
			if(score > runnerupscore)
			{
				runnerupscore = score;
			}
		}
		scoredif = topscore - runnerupscore;
		if(topscore >= (scorelimit * 0.9))
		{
			level notify(#"hash_15b8b6edc4ed3032", {#hash_7090bf53:0});
			return;
		}
		wait(1);
	}
}

/*
	Name: function_4e92a5e8
	Namespace: dropkick
	Checksum: 0xD540717D
	Offset: 0x11C8
	Size: 0x444
	Parameters: 0
	Flags: None
*/
function function_4e92a5e8()
{
	var_35c5fae0 = struct::get_array("dropkick_football_location", "targetname");
	if(var_35c5fae0.size == 0)
	{
		var_35c5fae0[0] = {};
		var_35c5fae0[0].origin = getclosestpointonnavmesh(level.mapcenter, 256, 32);
		var_35c5fae0[0].angles = (0, 0, 0);
	}
	var_791ffffd = var_35c5fae0[randomint(var_35c5fae0.size)];
	trigger = spawn("trigger_radius_use", var_791ffffd.origin, 0, 110, 110);
	trigger triggerignoreteam();
	trigger setvisibletoall();
	trigger setteamfortrigger(#"none");
	trigger function_682f34cf(-800);
	trigger.trigger_offset = (0, 0, trigger.mins[2] - trigger.maxs[2]) / 2;
	var_e9f2629a = [];
	var_e9f2629a[0] = spawn("script_model", var_791ffffd.origin);
	var_e9f2629a[0] setmodel(#"wpn_t9_eqp_briefcase_world");
	var_e9f2629a[0].angles = var_791ffffd.angles;
	football = gameobjects::create_carry_object(#"neutral", trigger, var_e9f2629a, (0, 0, 0), #"dropkick_football");
	football gameobjects::allow_carry(#"hash_5ccfd7bbbf07c770");
	football gameobjects::set_visible(#"hash_5ccfd7bbbf07c770");
	football gameobjects::set_use_time(level.var_8abcfbb8);
	football gameobjects::set_objective_entity(football);
	football gameobjects::function_a8c842d6((isdefined(getgametypesetting(#"carrier_manualdrop")) ? getgametypesetting(#"carrier_manualdrop") : 0), 1, 1);
	football gameobjects::set_onpickup_event(&function_3dbc9c80);
	football gameobjects::function_13798243(&function_279b8022);
	football gameobjects::set_onbeginuse_event(&onbeginuse);
	football gameobjects::set_onenduse_event(&onenduse);
	football.onreset = &onreset;
	football.objectiveonself = 1;
	football.allowweapons = 1;
	football.var_22389d70 = 0;
	if(-1)
	{
		football.enemyobjid = gameobjects::get_next_obj_id();
		objective_add(football.enemyobjid, "invisible", var_791ffffd.origin, #"hash_7a7d8800746ef2a5");
	}
	level.var_bb695b91 = football;
}

/*
	Name: function_b256c6a7
	Namespace: dropkick
	Checksum: 0x64D877CD
	Offset: 0x1618
	Size: 0xB4
	Parameters: 0
	Flags: None
*/
function function_b256c6a7()
{
	football = level.var_bb695b91;
	if(!isdefined(football))
	{
		return;
	}
	football gameobjects::set_visible(#"hash_161f03feaadc9b8f");
	football.trigger setinvisibletoall();
	if(isdefined(football.droptrigger))
	{
		football.droptrigger setinvisibletoall();
	}
	if(isdefined(football.enemyobjid))
	{
		objective_setstate(football.enemyobjid, "invisible");
	}
}

/*
	Name: function_3dbc9c80
	Namespace: dropkick
	Checksum: 0x74A24EFC
	Offset: 0x16D8
	Size: 0x364
	Parameters: 1
	Flags: None
*/
function function_3dbc9c80(player)
{
	if(level.var_f2a67a5d === 1)
	{
		return;
	}
	/#
		assert(isdefined(player) && isdefined(player.team));
	#/
	ownerteam = player.team;
	football = self;
	self gameobjects::set_owner_team(ownerteam);
	self.visuals[0] notsolid();
	if(player !== level.var_d0bebb68)
	{
		level.var_d0bebb68 = undefined;
	}
	if(isdefined(self.enemyobjid))
	{
		self gameobjects::set_visible(#"hash_150a20fa4efc5c7a");
		objective_setstate(self.enemyobjid, "active");
		objective_setteam(self.enemyobjid, ownerteam);
		function_c939fac4(self.enemyobjid, ownerteam);
		self thread function_6e8c149a();
		self thread function_96a10724();
	}
	else
	{
		self gameobjects::set_visible(#"hash_5ccfd7bbbf07c770");
	}
	if(isdefined(self.trigger))
	{
		self.trigger triggerenable(0);
	}
	player.var_e8c7d324 = 1;
	player setmovespeedscale(1);
	player clientfield::set("ctf_flag_carrier", 1);
	player function_e9921723();
	if(level.var_95fa13a1 > 0)
	{
		player function_b64329fe();
	}
	remove_influencers(self, player);
	level.var_6c99ff95 = player influencers::create_entity_influencer("dropkick_football", level.player_team_mask | level.enemy_team_mask);
	level.var_1d402358 = player;
	level.var_13faac26 = 0;
	if(level.waverespawndelay)
	{
		level.wavedelay[ownerteam] = (isdefined(level.waverespawndelay) ? level.waverespawndelay : 0);
	}
	player thread globallogic_audio::leader_dialog_on_player("dropkickPlayerPickup");
	thread globallogic_audio::function_b4319f8e("dropkickFriendlyPickup", ownerteam, player);
	thread globallogic_audio::leader_dialog_for_other_teams("dropkickEnemyPickup", ownerteam);
	self thread function_a7574777();
}

/*
	Name: function_279b8022
	Namespace: dropkick
	Checksum: 0xE20E81C9
	Offset: 0x1A48
	Size: 0x350
	Parameters: 1
	Flags: None
*/
function function_279b8022(player)
{
	level.var_1d402358 = undefined;
	if(level.waverespawndelay)
	{
		level.wavedelay[player.team] = 0;
	}
	else
	{
		foreach(person in getplayers(player.team))
		{
			if(person === player)
			{
				continue;
			}
			person function_907e4c8f();
		}
	}
	if(level.var_f2a67a5d === 1)
	{
		return;
	}
	self notify(#"hash_69b164cea4605785");
	self gameobjects::set_owner_team(#"neutral");
	self gameobjects::set_visible(#"hash_5ccfd7bbbf07c770");
	self.visuals[0] solid();
	if(isdefined(self.enemyobjid))
	{
		objective_setvisibletoall(self.enemyobjid);
		objective_setstate(self.enemyobjid, "invisible");
		objective_setteam(self.enemyobjid, #"none");
	}
	player.var_e8c7d324 = 0;
	player setmovespeedscale(1);
	player clientfield::set("ctf_flag_carrier", 0);
	player function_f58ec571();
	remove_influencers(self, player);
	level.var_adb77100 = self influencers::create_entity_influencer("dropkick_football", level.player_team_mask | level.enemy_team_mask);
	level.var_13faac26 = 0;
	if(player === level.var_d0bebb68)
	{
		level.var_d0bebb68 = undefined;
	}
	self thread function_aa074770();
	foreach(person in getplayers())
	{
		person playlocalsound(#"hash_2e71f0773ee8286a");
	}
}

/*
	Name: onbeginuse
	Namespace: dropkick
	Checksum: 0xDE3F2A68
	Offset: 0x1DA0
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function onbeginuse(player)
{
	self function_3f367c2e();
}

/*
	Name: onenduse
	Namespace: dropkick
	Checksum: 0x91EF0200
	Offset: 0x1DD0
	Size: 0x54
	Parameters: 3
	Flags: None
*/
function onenduse(team, player, success)
{
	if(!success && self gameobjects::is_object_away_from_home())
	{
		self thread function_aa074770();
	}
}

/*
	Name: onreset
	Namespace: dropkick
	Checksum: 0xE9E3F6FE
	Offset: 0x1E30
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function onreset(previousorigin)
{
	self function_3f367c2e();
}

/*
	Name: function_a7574777
	Namespace: dropkick
	Checksum: 0x72D85B57
	Offset: 0x1E60
	Size: 0x270
	Parameters: 0
	Flags: None
*/
function function_a7574777()
{
	level endon(#"score_limit_reached");
	self endon(#"hash_69b164cea4605785");
	var_8e62571b = 0;
	var_ec4f42f2 = 0;
	var_a14bc571 = 0;
	while(true)
	{
		wait(1);
		hostmigration::waittillhostmigrationdone();
		team = self gameobjects::get_owner_team();
		if(!isdefined(team))
		{
			return;
		}
		globallogic_score::giveteamscoreforobjective(team, level.carryscore);
		player = self.carrier;
		if(isdefined(player))
		{
			if(isdefined(player.pers[#"objtime"]))
			{
				player.pers[#"objtime"]++;
				player.objtime = player.pers[#"objtime"];
			}
			player stats::function_bb7eedf0(#"objective_time", 1);
			player globallogic_score::incpersstat(#"objectivetime", 1, 0, 1);
			var_8e62571b++;
			if((var_8e62571b % 5) == 0)
			{
				scoreevents::processscoreevent(#"hash_5da3cbb3a47375eb", player);
			}
			if(var_8e62571b >= 50 && !var_ec4f42f2)
			{
				scoreevents::processscoreevent(#"hash_7a2b068529e599a8", player);
				var_ec4f42f2 = 1;
			}
			if(var_8e62571b >= 30 && player === level.var_d0bebb68 && !var_a14bc571)
			{
				scoreevents::processscoreevent(#"hash_149ab2bcfb997bbc", player);
				var_a14bc571 = 1;
			}
		}
	}
}

/*
	Name: function_6e8c149a
	Namespace: dropkick
	Checksum: 0x8E2A34D7
	Offset: 0x20D8
	Size: 0x186
	Parameters: 0
	Flags: None
*/
function function_6e8c149a()
{
	self notify("36d6a82d08f54f45");
	self endon("36d6a82d08f54f45");
	level endon(#"score_limit_reached");
	self endon(#"hash_69b164cea4605785");
	while(true)
	{
		carrier = self gameobjects::get_carrier();
		if(!isdefined(self.enemyobjid) || !isdefined(carrier))
		{
			return;
		}
		var_e000301a = 0;
		stance = carrier getstance();
		if(stance === "stand")
		{
			height = 70;
			var_e000301a = height / 1.5;
		}
		else
		{
			if(stance === "crouch")
			{
				height = 50;
				var_e000301a = height / 2;
			}
			else if(stance === "prone")
			{
				height = 30;
				var_e000301a = height / 2;
			}
		}
		var_9eff2ce = carrier.origin + (0, 0, var_e000301a);
		objective_setposition(self.enemyobjid, var_9eff2ce);
		wait(3);
	}
}

/*
	Name: function_96a10724
	Namespace: dropkick
	Checksum: 0x1417E9ED
	Offset: 0x2268
	Size: 0x170
	Parameters: 0
	Flags: None
*/
function function_96a10724()
{
	level endon(#"score_limit_reached");
	self endon(#"hash_69b164cea4605785");
	var_2c26f7e5 = 0;
	while(true)
	{
		carrier = self gameobjects::get_carrier();
		var_8afaec49 = carrier uav::function_781f1bf2() || carrier recon_plane::function_4dc67281();
		if(var_8afaec49)
		{
			if(!var_2c26f7e5)
			{
				objective_setstate(self.enemyobjid, "invisible");
				self gameobjects::set_visible(#"hash_5ccfd7bbbf07c770");
				var_2c26f7e5 = 1;
			}
		}
		else if(var_2c26f7e5)
		{
			self thread function_6e8c149a();
			objective_setstate(self.enemyobjid, "active");
			self gameobjects::set_visible(#"hash_150a20fa4efc5c7a");
			var_2c26f7e5 = 0;
		}
		wait(0.25);
	}
}

/*
	Name: function_e9921723
	Namespace: dropkick
	Checksum: 0x8BD165B8
	Offset: 0x23E0
	Size: 0x16C
	Parameters: 0
	Flags: None
*/
function function_e9921723()
{
	primaryweapon = getweapon(#"hash_29ab150f9f8964f");
	self giveweapon(primaryweapon);
	self givestartammo(primaryweapon);
	self switchtoweapon(primaryweapon, 1);
	self val::set(#"hash_57686500ed84dbcc", "disable_weapon_cycling", 1);
	self val::set(#"hash_57686500ed84dbcc", "disable_offhand_weapons", 1);
	self val::set(#"hash_57686500ed84dbcc", "disable_weapon_pickup", 1);
	self loadout::function_442539("primary", primaryweapon);
	self.droppeddeathweapon = 1;
	gestures::function_a5202150(#"hash_6c5354e57d5054f6", #"hash_29ab150f9f8964f");
}

/*
	Name: function_b64329fe
	Namespace: dropkick
	Checksum: 0xF8E70278
	Offset: 0x2558
	Size: 0x64
	Parameters: 0
	Flags: None
*/
function function_b64329fe()
{
	self armor::set_armor(level.var_95fa13a1, level.var_95fa13a1, 0, 0, 1, 1, 5, 1, 1, 1);
}

/*
	Name: function_f58ec571
	Namespace: dropkick
	Checksum: 0xE256783C
	Offset: 0x25C8
	Size: 0x9E
	Parameters: 0
	Flags: None
*/
function function_f58ec571()
{
	primaryweapon = getweapon(#"hash_29ab150f9f8964f");
	if(self hasweapon(primaryweapon))
	{
		self takeweapon(primaryweapon);
	}
	self enableweaponcycling();
	self val::reset_all(#"hash_57686500ed84dbcc");
	self.droppeddeathweapon = undefined;
}

/*
	Name: remove_influencers
	Namespace: dropkick
	Checksum: 0x4F636992
	Offset: 0x2670
	Size: 0x96
	Parameters: 2
	Flags: None
*/
function remove_influencers(football, carrier)
{
	if(isdefined(level.var_adb77100) && isdefined(football))
	{
		football influencers::remove_influencer(level.var_adb77100);
		level.var_adb77100 = undefined;
	}
	if(isdefined(level.var_6c99ff95) && isdefined(carrier))
	{
		carrier influencers::remove_influencer(level.var_6c99ff95);
		level.var_6c99ff95 = undefined;
	}
}

/*
	Name: function_aa074770
	Namespace: dropkick
	Checksum: 0x55C04458
	Offset: 0x2710
	Size: 0x84
	Parameters: 0
	Flags: None
*/
function function_aa074770()
{
	if(!isdefined(level.var_6ecc0fa6) || level.var_6ecc0fa6 == 0)
	{
		return;
	}
	self endon(#"hash_656fdc4ee4edf47c");
	wait(level.var_6ecc0fa6);
	if(level.var_f2a67a5d === 1)
	{
		return;
	}
	if(!isdefined(self.carrier))
	{
		self thread gameobjects::return_home();
	}
}

/*
	Name: function_3f367c2e
	Namespace: dropkick
	Checksum: 0x7831C2E
	Offset: 0x27A0
	Size: 0x3E
	Parameters: 0
	Flags: None
*/
function function_3f367c2e()
{
	if(!isdefined(level.var_6ecc0fa6) || level.var_6ecc0fa6 == 0)
	{
		return;
	}
	self notify(#"hash_656fdc4ee4edf47c");
}

/*
	Name: function_1a67afed
	Namespace: dropkick
	Checksum: 0x8707C3EA
	Offset: 0x27E8
	Size: 0xC4
	Parameters: 0
	Flags: None
*/
function function_1a67afed()
{
	clientfield::set("" + #"hash_69d32ac298f2aa22", 1);
	level waittill(#"pre_potm");
	clientfield::set("" + #"hash_69d32ac298f2aa22", 2);
	level waittill(#"potm_finished");
	clientfield::set("" + #"hash_69d32ac298f2aa22", 3);
}

/*
	Name: function_311e397d
	Namespace: dropkick
	Checksum: 0x89BC0E33
	Offset: 0x28B8
	Size: 0x164
	Parameters: 0
	Flags: Private
*/
function private function_311e397d()
{
	wait(2.5);
	var_5ac13eb1 = struct::get_array(#"hash_4b493e0124411b31", "targetname");
	if(var_5ac13eb1.size == 0)
	{
		var_5ac13eb1[0] = {};
		var_5ac13eb1[0].origin = level.mapcenter;
		var_5ac13eb1[0].angles = (0, 0, 0);
	}
	nuke_fx = var_5ac13eb1[randomint(var_5ac13eb1.size)];
	origin = nuke_fx.origin;
	forward = anglestoforward(nuke_fx.angles);
	up = anglestoup(nuke_fx.angles);
	playsoundatposition(#"hash_36412d3d8dabf70e", (0, 0, 0));
	playfx(#"hash_76b02047787f0357", origin, forward, up, 1);
}

/*
	Name: do_rumble
	Namespace: dropkick
	Checksum: 0x4D930C15
	Offset: 0x2A28
	Size: 0x210
	Parameters: 0
	Flags: Private
*/
function private do_rumble()
{
	wait(2);
	foreach(player in getplayers())
	{
		player function_66337ef1(#"hash_84a968a81962277");
	}
	var_3b3fc42b = 4;
	wait(var_3b3fc42b);
	foreach(player in getplayers())
	{
		player stoprumble(#"hash_84a968a81962277");
		player function_66337ef1(#"hash_6a64bb8c231f544b");
	}
	var_6972a090 = 3.4;
	wait(var_6972a090);
	foreach(player in getplayers())
	{
		player stoprumble(#"hash_6a64bb8c231f544b");
	}
}

/*
	Name: function_68f13f40
	Namespace: dropkick
	Checksum: 0xCD011BB3
	Offset: 0x2C40
	Size: 0x170
	Parameters: 0
	Flags: Private
*/
function private function_68f13f40()
{
	wait(2.1);
	foreach(player in getplayers())
	{
		player gestures::play_gesture(#"hash_6c5354e57d5054f6", undefined, 1);
	}
	duration = 6.9;
	wait(duration);
	foreach(player in getplayers())
	{
		if(player isgestureplaying(#"hash_6c5354e57d5054f6"))
		{
			player stopgestureviewmodel(#"hash_6c5354e57d5054f6");
		}
	}
}

/*
	Name: function_86ca9275
	Namespace: dropkick
	Checksum: 0x720A0BB0
	Offset: 0x2DB8
	Size: 0xB0
	Parameters: 0
	Flags: Private
*/
function private function_86ca9275()
{
	wait(2);
	foreach(player in getplayers())
	{
		player val::set(#"hash_31a56c396d195997", "show_hud", 0);
	}
}

