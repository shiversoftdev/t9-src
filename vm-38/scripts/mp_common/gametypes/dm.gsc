#using scripts\mp_common\util.gsc;
#using scripts\mp_common\player\player_utils.gsc;
#using scripts\mp_common\gametypes\match.gsc;
#using scripts\mp_common\gametypes\round.gsc;
#using scripts\mp_common\gametypes\globallogic_spawn.gsc;
#using scripts\mp_common\gametypes\globallogic_score.gsc;
#using script_1cc417743d7c262d;
#using scripts\mp_common\gametypes\globallogic.gsc;
#using scripts\killstreaks\killstreaks_util.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using script_335d0650ed05d36d;
#using script_44b0b8420eabacad;
#using scripts\core_common\spawning_shared.gsc;

#namespace dm;

/*
	Name: function_61d8b8
	Namespace: dm
	Checksum: 0x357FC515
	Offset: 0xE8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_61d8b8()
{
	level notify(903604629);
}

/*
	Name: main
	Namespace: dm
	Checksum: 0x534E6BF
	Offset: 0x108
	Size: 0xDC
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	globallogic::init();
	level.onstartgametype = &onstartgametype;
	player::function_cf3aa03d(&onplayerkilled);
	level.onspawnplayer = &onspawnplayer;
	level.onendgame = &onendgame;
	spawning::addsupportedspawnpointtype("ffa");
	spawning::function_32b97d1b(&spawning::function_90dee50d);
	spawning::function_adbbb58a(&spawning::function_c24e290c);
}

/*
	Name: setupteam
	Namespace: dm
	Checksum: 0x5AA14BD7
	Offset: 0x1F0
	Size: 0xC
	Parameters: 1
	Flags: None
*/
function setupteam(team)
{
}

/*
	Name: onstartgametype
	Namespace: dm
	Checksum: 0xE63ED2F
	Offset: 0x208
	Size: 0x44
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
	}
}

/*
	Name: onendgame
	Namespace: dm
	Checksum: 0x6250E902
	Offset: 0x258
	Size: 0x74
	Parameters: 1
	Flags: None
*/
function onendgame(var_c1e98979)
{
	player = round::function_b5f4c9d8();
	if(isdefined(player))
	{
		[[level._setplayerscore]](player, [[level._getplayerscore]](player) + 1);
	}
	match::set_winner(player);
}

/*
	Name: onscoreclosemusic
	Namespace: dm
	Checksum: 0x91250B1
	Offset: 0x2D8
	Size: 0xAC
	Parameters: 0
	Flags: None
*/
function onscoreclosemusic()
{
	while(!level.gameended)
	{
		scorelimit = level.scorelimit;
		scorethreshold = scorelimit * 0.9;
		for(i = 0; i < level.players.size; i++)
		{
			scorecheck = [[level._getplayerscore]](level.players[i]);
			if(scorecheck >= scorethreshold)
			{
				return;
			}
		}
		wait(0.5);
	}
}

/*
	Name: onspawnplayer
	Namespace: dm
	Checksum: 0xF9FE71EB
	Offset: 0x390
	Size: 0x44
	Parameters: 1
	Flags: None
*/
function onspawnplayer(predictedspawn)
{
	if(!level.inprematchperiod)
	{
		spawning::function_7a87efaa();
	}
	spawning::onspawnplayer(predictedspawn);
}

/*
	Name: onplayerkilled
	Namespace: dm
	Checksum: 0x5705AFC5
	Offset: 0x3E0
	Size: 0x11C
	Parameters: 9
	Flags: None
*/
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration)
{
	if(!isplayer(shitloc) || self == shitloc)
	{
		return;
	}
	if(!isdefined(killstreaks::get_killstreak_for_weapon(deathanimduration)) || is_true(level.killstreaksgivegamescore))
	{
		shitloc globallogic_score::givepointstowin(level.teamscoreperkill);
		self globallogic_score::givepointstowin(level.teamscoreperdeath * -1);
		if(psoffsettime == "MOD_HEAD_SHOT")
		{
			shitloc globallogic_score::givepointstowin(level.teamscoreperheadshot);
		}
	}
}

