#using script_6ce38ab036223e6e;
#using script_db06eb511bd9b36;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\zm_common\gametypes\globallogic.gsc;
#using scripts\zm_common\gametypes\globallogic_utils.gsc;
#using scripts\zm_common\gametypes\zm_gametype.gsc;
#using scripts\zm_common\util.gsc;
#using scripts\zm_common\zm_behavior.gsc;
#using scripts\zm_common\zm_player.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_stats.gsc;

#namespace zgrief;

/*
	Name: main
	Namespace: zgrief
	Checksum: 0xC6071B15
	Offset: 0x118
	Size: 0x13C
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	zm_gametype::main();
	util::registertimelimit(0, 1440);
	util::registerscorelimit(0, 50000);
	level.forceallallies = 0;
	level.onprecachegametype = &onprecachegametype;
	level.onstartgametype = &onstartgametype;
	level.ontimelimit = &ontimelimit;
	level.onscorelimit = &onscorelimit;
	level._game_module_custom_spawn_init_func = &zm_gametype::custom_spawn_init_func;
	level._game_module_stat_update_func = &zm_stats::survival_classic_custom_stat_update;
	level._round_start_func = &namespace_a28acff3::round_start;
	zm_player::register_player_damage_callback(&function_567c449a);
	callback::on_spawned(&onplayerspawned);
}

/*
	Name: onprecachegametype
	Namespace: zgrief
	Checksum: 0x84DAAEF8
	Offset: 0x260
	Size: 0x1C
	Parameters: 0
	Flags: None
*/
function onprecachegametype()
{
	level.canplayersuicide = &zm_gametype::canplayersuicide;
}

/*
	Name: onstartgametype
	Namespace: zgrief
	Checksum: 0x198031F4
	Offset: 0x288
	Size: 0x1A4
	Parameters: 0
	Flags: None
*/
function onstartgametype()
{
	zm_behavior::function_70a657d8();
	zm_cleanup::function_70a657d8();
	zm_spawner::init();
	zm_behavior::function_8ac3bea9();
	zm_cleanup::function_8ac3bea9();
	level.spawnmins = (0, 0, 0);
	level.spawnmaxs = (0, 0, 0);
	structs = struct::get_array("player_respawn_point", "targetname");
	foreach(struct in structs)
	{
		level.spawnmins = math::expand_mins(level.spawnmins, struct.origin);
		level.spawnmaxs = math::expand_maxs(level.spawnmaxs, struct.origin);
	}
	level.mapcenter = math::find_box_center(level.spawnmins, level.spawnmaxs);
	setmapcenter(level.mapcenter);
}

/*
	Name: ontimelimit
	Namespace: zgrief
	Checksum: 0x690B0F2
	Offset: 0x438
	Size: 0xAC
	Parameters: 0
	Flags: None
*/
function ontimelimit()
{
	winner = globallogic::determineteamwinnerbygamestat("teamScores");
	globallogic_utils::logteamwinstring("time limit", winner);
	setdvar(#"ui_text_endreason", game.strings[#"time_limit_reached"]);
	thread globallogic::endgame(winner, game.strings[#"time_limit_reached"]);
}

/*
	Name: onscorelimit
	Namespace: zgrief
	Checksum: 0xF0E13C8
	Offset: 0x4F0
	Size: 0xAC
	Parameters: 0
	Flags: None
*/
function onscorelimit()
{
	winner = globallogic::determineteamwinnerbygamestat("teamScores");
	globallogic_utils::logteamwinstring("scorelimit", winner);
	setdvar(#"ui_text_endreason", game.strings[#"score_limit_reached"]);
	thread globallogic::endgame(winner, game.strings[#"score_limit_reached"]);
}

/*
	Name: function_567c449a
	Namespace: zgrief
	Checksum: 0xBF7B8C9D
	Offset: 0x5A8
	Size: 0x80
	Parameters: 10
	Flags: None
*/
function function_567c449a(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime)
{
	if(isdefined(shitloc) && isplayer(shitloc))
	{
		return 0;
	}
	return psoffsettime;
}

/*
	Name: onplayerspawned
	Namespace: zgrief
	Checksum: 0x6C186FC0
	Offset: 0x630
	Size: 0xD8
	Parameters: 0
	Flags: None
*/
function onplayerspawned()
{
	self function_dee3f41b(1);
	foreach(player in getplayers())
	{
		if(player != self)
		{
			self setignoreent(player, 1);
			player setignoreent(self, 1);
		}
	}
}

