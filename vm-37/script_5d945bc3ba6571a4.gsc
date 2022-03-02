#using script_1cc417743d7c262d;
#using script_229f24b1662651c4;
#using script_2c49ae69cd8ce30c;
#using script_335d0650ed05d36d;
#using script_3f27a7b2232674db;
#using script_44b0b8420eabacad;
#using script_68d2ee1489345a1d;
#using script_6c8abe14025b47c4;
#using scripts\core_common\dogtags.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\mp_common\bb.gsc;
#using scripts\mp_common\gametypes\gametype.gsc;
#using scripts\mp_common\gametypes\globallogic.gsc;
#using scripts\mp_common\gametypes\globallogic_score.gsc;
#using scripts\mp_common\gametypes\globallogic_spawn.gsc;
#using scripts\mp_common\gametypes\globallogic_utils.gsc;
#using scripts\mp_common\gametypes\match.gsc;
#using scripts\mp_common\gametypes\spawning.gsc;
#using scripts\mp_common\laststand.gsc;
#using scripts\mp_common\util.gsc;

#namespace namespace_bbf5d955;

/*
	Name: main
	Namespace: namespace_bbf5d955
	Checksum: 0x2187EDF9
	Offset: 0x168
	Size: 0x1BC
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	globallogic::init();
	util::registerroundscorelimit(0, 10000);
	level.takelivesondeath = 1;
	level.onstartgametype = &onstartgametype;
	level.onspawnplayer = &onspawnplayer;
	level.onroundswitch = &onroundswitch;
	level.var_f6d301b = &function_f6d301b;
	level.laststandrevivehealth = getgametypesetting(#"laststandrevivehealth");
	level.laststandhealth = getgametypesetting(#"laststandhealth");
	level.laststandtimer = getgametypesetting(#"laststandtimer");
	player::function_cf3aa03d(&onplayerkilled);
	spawning::addsupportedspawnpointtype("tdm");
	if(getdvarint(#"hash_5795d85dc4b1b0d9", 0))
	{
		level.var_49a15413 = getdvarint(#"hash_5795d85dc4b1b0d9", 0);
		level.scoremodifiercallback = &function_f9df98d3;
	}
}

/*
	Name: onstartgametype
	Namespace: namespace_bbf5d955
	Checksum: 0x703DFD66
	Offset: 0x330
	Size: 0xAC
	Parameters: 0
	Flags: None
*/
function onstartgametype()
{
	level.displayroundendtext = 0;
	level thread onscoreclosemusic();
	if(!util::isoneround())
	{
		level.displayroundendtext = 1;
		if(level.scoreroundwinbased)
		{
			globallogic_score::resetteamscores();
		}
	}
	if(is_true(level.droppedtagrespawn))
	{
		level.numlives = 1;
	}
	namespace_674e6435::function_414115a0(level.laststandtimer, level.laststandhealth);
}

/*
	Name: onspawnplayer
	Namespace: namespace_bbf5d955
	Checksum: 0x88AC0850
	Offset: 0x3E8
	Size: 0x7C
	Parameters: 1
	Flags: None
*/
function onspawnplayer(predictedspawn)
{
	self.usingobj = undefined;
	if(spawning::usestartspawns() && !level.ingraceperiod && !level.playerqueuedrespawn)
	{
		spawning::function_7a87efaa();
	}
	spawning::onspawnplayer(predictedspawn);
}

/*
	Name: onroundswitch
	Namespace: namespace_bbf5d955
	Checksum: 0xBB413A12
	Offset: 0x470
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function onroundswitch()
{
	gametype::on_round_switch();
	globallogic_score::function_9779ac61();
}

/*
	Name: function_f6d301b
	Namespace: namespace_bbf5d955
	Checksum: 0x78871FEE
	Offset: 0x4A0
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function function_f6d301b(var_c1e98979)
{
	function_e596b745(var_c1e98979);
}

/*
	Name: onscoreclosemusic
	Namespace: namespace_bbf5d955
	Checksum: 0xDE494721
	Offset: 0x4D0
	Size: 0x19C
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
		if(topscore >= (scorelimit * 0.5))
		{
			level notify(#"sndmusichalfway");
			return;
		}
		wait(1);
	}
}

/*
	Name: onplayerkilled
	Namespace: namespace_bbf5d955
	Checksum: 0xF4E21CE0
	Offset: 0x678
	Size: 0x214
	Parameters: 9
	Flags: None
*/
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration)
{
	if(smeansofdeath == "MOD_META")
	{
		return;
	}
	if(is_true(level.droppedtagrespawn))
	{
		thread dogtags::checkallowspectating();
		should_spawn_tags = self dogtags::should_spawn_tags(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration);
		should_spawn_tags = should_spawn_tags && !globallogic_spawn::mayspawn();
		if(should_spawn_tags)
		{
			level thread dogtags::spawn_dog_tag(self, attacker, &dogtags::onusedogtag, 0);
		}
	}
	if(isplayer(attacker) == 0 || attacker.team == self.team)
	{
		return;
	}
	if(!isdefined(killstreaks::get_killstreak_for_weapon(weapon)) || is_true(level.killstreaksgivegamescore))
	{
		attacker globallogic_score::giveteamscoreforobjective(attacker.team, level.teamscoreperkill);
		self globallogic_score::giveteamscoreforobjective(self.team, level.teamscoreperdeath * -1);
		if(smeansofdeath == "MOD_HEAD_SHOT")
		{
			attacker globallogic_score::giveteamscoreforobjective(attacker.team, level.teamscoreperheadshot);
		}
	}
}

/*
	Name: function_e596b745
	Namespace: namespace_bbf5d955
	Checksum: 0x715C87C5
	Offset: 0x898
	Size: 0x104
	Parameters: 1
	Flags: None
*/
function function_e596b745(var_c1e98979)
{
	var_1e866967 = spawnstruct();
	var_1e866967.remainingtime = max(0, globallogic_utils::gettimeremaining());
	switch(var_c1e98979)
	{
		case 2:
		{
			var_1e866967.wintype = "time_limit_reached";
			break;
		}
		case 3:
		{
			var_1e866967.wintype = "score_limit_reached";
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
}

/*
	Name: function_f9df98d3
	Namespace: namespace_bbf5d955
	Checksum: 0x7E2055A7
	Offset: 0x9A8
	Size: 0x3E
	Parameters: 2
	Flags: None
*/
function function_f9df98d3(type, value)
{
	if(type === #"ekia")
	{
		return value + level.var_49a15413;
	}
	return value;
}

