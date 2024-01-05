#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_round_logic.gsc;
#using scripts\zm_common\zm_cleanup_mgr.gsc;
#using scripts\zm_common\zm_behavior.gsc;
#using scripts\zm_common\gametypes\zm_gametype.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\math_shared.gsc;

#namespace ztutorial;

/*
	Name: main
	Namespace: ztutorial
	Checksum: 0x74FD5F07
	Offset: 0xC8
	Size: 0xBC
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	zm_gametype::main();
	level.disableclassselection = 1;
	level.onprecachegametype = &onprecachegametype;
	level.onstartgametype = &onstartgametype;
	level.callbackplayerlaststand = &function_1b27b9d0;
	level._game_module_custom_spawn_init_func = &zm_gametype::custom_spawn_init_func;
	level._game_module_stat_update_func = &zm_stats::survival_classic_custom_stat_update;
	level._round_start_func = &zm_round_logic::round_start;
}

/*
	Name: onprecachegametype
	Namespace: ztutorial
	Checksum: 0x25ADC8D2
	Offset: 0x190
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
	Namespace: ztutorial
	Checksum: 0xCB123D5A
	Offset: 0x1B8
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
	Name: function_1b27b9d0
	Namespace: ztutorial
	Checksum: 0xEFAC55DB
	Offset: 0x368
	Size: 0x4C
	Parameters: 9
	Flags: None
*/
function function_1b27b9d0(einflictor, eattacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, delayoverride)
{
}

